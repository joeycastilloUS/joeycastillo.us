/* gate.js — Be password gate (client-side SHA-256) */
(function () {
  var script = document.currentScript;
  var TARGET = script.getAttribute('data-hash');
  var KEY = 'audit_gate_v1';

  /* Cookie helper -- set on every gate-pass so CF Pages Functions can
     verify auth server-side when proxying to live Cloud Run dashboards.
     SameSite=Lax (not Strict) so the cookie is sent on iframe loads of
     same-origin proxied content. */
  function setCookie() {
    document.cookie = 'audit_gate_token=' + TARGET +
      '; Path=/; Max-Age=86400; SameSite=Lax; Secure';
  }

  /* After gate passes (or fast-path skip), kick any iframes that were
     deferred via data-gated-src so they only load with the cookie set. */
  function loadGatedIframes() {
    var els = document.querySelectorAll('iframe[data-gated-src]');
    for (var i = 0; i < els.length; i++) {
      var el = els[i];
      if (!el.src) el.src = el.getAttribute('data-gated-src');
    }
  }

  /* Fast path — session already valid */
  if (sessionStorage.getItem(KEY) === TARGET) {
    setCookie();
    if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', loadGatedIframes);
    } else {
      loadGatedIframes();
    }
    return;
  }

  /* Block visibility immediately — no flash of content */
  document.documentElement.style.visibility = 'hidden';

  function sha256(str) {
    return crypto.subtle.digest('SHA-256', new TextEncoder().encode(str))
      .then(function (buf) {
        return Array.from(new Uint8Array(buf))
          .map(function (b) { return b.toString(16).padStart(2, '0'); })
          .join('');
      });
  }

  function injectOverlay() {
    /* Overlay DOM */
    var overlay = document.createElement('div');
    overlay.className = 'metal-gate';
    overlay.innerHTML =
      '<div class="metal-gate-box">' +
        '<div class="metal-gate-brand">AUDIT</div>' +
        '<div class="metal-gate-sub">private access</div>' +
        '<form id="gateForm" autocomplete="off">' +
          '<input class="metal-gate-input" id="gateInput" type="password" placeholder="password" autofocus>' +
          '<button class="metal-gate-btn" type="submit">Enter</button>' +
          '<div class="metal-gate-err" id="gateErr"></div>' +
        '</form>' +
      '</div>';

    document.body.appendChild(overlay);
    document.documentElement.style.visibility = '';

    var form = document.getElementById('gateForm');
    var input = document.getElementById('gateInput');
    var err = document.getElementById('gateErr');

    form.addEventListener('submit', function (e) {
      e.preventDefault();
      var val = input.value;
      if (!val) return;

      sha256(val).then(function (hash) {
        if (hash === TARGET) {
          sessionStorage.setItem(KEY, TARGET);
          setCookie();
          loadGatedIframes();
          overlay.classList.add('gate-hidden');
          setTimeout(function () { overlay.remove(); }, 350);
        } else {
          err.textContent = 'wrong password';
          input.value = '';
          input.classList.add('gate-shake');
          setTimeout(function () { input.classList.remove('gate-shake'); }, 450);
          input.focus();
        }
      });
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', injectOverlay);
  } else {
    injectOverlay();
  }
})();
