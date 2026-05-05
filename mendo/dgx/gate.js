/* gate.js — Be password gate (client-side SHA-256) */
(function () {
  var script = document.currentScript;
  var TARGET = script.getAttribute('data-hash');
  var KEY = 'mendo_dgx_gate_v1';

  /* Fast path — session already valid */
  if (sessionStorage.getItem(KEY) === TARGET) return;

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
        '<div class="metal-gate-brand">MENDO DGX</div>' +
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
