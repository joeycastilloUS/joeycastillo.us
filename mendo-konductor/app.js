/* app.js — Konductor Run Sheet renderer + local state (no framework, no backend yet).
   State persists in localStorage keyed by store+step. Pacific timestamps always.
   Board 2 swaps the STORE shim below for runsheet-api calls; the render code stays. */
(function () {
  'use strict';

  var LS_KEY = 'mendo_konductor_runsheet_v1';
  var GATE_STEP = 'c1-greenlight';      // checking this unlocks the network-cutover phase
  var LOCKED_PHASE = 'p4-network';

  /* ---- local state shim (Board 2 replaces this with runsheet-api) ---- */
  var STORE = {
    all: function () {
      try { return JSON.parse(localStorage.getItem(LS_KEY)) || {}; }
      catch (e) { return {}; }
    },
    get: function (store, step) {
      var s = this.all()[store] || {};
      return s[step] || { checked: false };
    },
    set: function (store, step, checked) {
      var data = this.all();
      data[store] = data[store] || {};
      data[store][step] = { checked: checked, at: checked ? pacificNow() : null };
      localStorage.setItem(LS_KEY, JSON.stringify(data));
    },
    clearStore: function (store) {
      var data = this.all();
      delete data[store];
      localStorage.setItem(LS_KEY, JSON.stringify(data));
    }
  };

  /* ---- Pacific time, always (project convention) ---- */
  function pacificNow() {
    try {
      return new Intl.DateTimeFormat('en-CA', {
        timeZone: 'America/Los_Angeles', year: 'numeric', month: '2-digit', day: '2-digit',
        hour: '2-digit', minute: '2-digit', hour12: false, timeZoneName: 'short'
      }).format(new Date()).replace(',', '');
    } catch (e) { return new Date().toISOString(); }
  }

  var data = null, activeStore = null;

  function el(tag, cls, html) {
    var n = document.createElement(tag);
    if (cls) n.className = cls;
    if (html != null) n.innerHTML = html;
    return n;
  }

  function steps(store) {
    var out = [];
    data.phases.forEach(function (p) { p.steps.forEach(function (s) { out.push(s); }); });
    return out;
  }

  function isGateOpen(store) {
    return STORE.get(store, GATE_STEP).checked;
  }

  function renderTabs() {
    var tabs = document.getElementById('tabs');
    tabs.innerHTML = '';
    data.stores.forEach(function (st) {
      var all = steps(st.store_id);
      var done = all.filter(function (s) { return STORE.get(st.store_id, s.id).checked; }).length;
      var t = el('button', 'tab' + (st.store_id === activeStore ? ' active' : ''));
      t.setAttribute('role', 'tab');
      t.innerHTML = '<span class="sid">' + st.store_id + '</span>' + st.name +
                    ' <span class="cnt">' + done + '/' + all.length + '</span>';
      t.addEventListener('click', function () { activeStore = st.store_id; render(); });
      tabs.appendChild(t);
    });
  }

  function renderProgress() {
    var all = steps(activeStore);
    var done = all.filter(function (s) { return STORE.get(activeStore, s.id).checked; }).length;
    var pct = all.length ? Math.round(done / all.length * 100) : 0;
    var box = document.getElementById('progress');
    box.innerHTML =
      '<div class="bar"><div class="fill" style="width:' + pct + '%"></div></div>' +
      '<div class="label"><b>' + done + '</b> of <b>' + all.length + '</b> steps &middot; ' + pct + '%</div>';
  }

  function badges(step) {
    var b = '';
    (step.systems || []).forEach(function (sys) {
      b += '<span class="badge ' + sys + '">' + sys.toUpperCase() + '</span>';
    });
    if (step.gate) b += '<span class="badge gate">GATE</span>';
    if (step.tentative) b += '<span class="badge tent">TENTATIVE</span>';
    return b;
  }

  function renderSheet() {
    var sheet = document.getElementById('sheet');
    sheet.innerHTML = '';
    var gateOpen = isGateOpen(activeStore);

    data.phases.forEach(function (phase) {
      var locked = (phase.id === LOCKED_PHASE) && !gateOpen;
      var pdiv = el('section', 'phase' + (locked ? ' locked' : ''));
      var h = el('h2', null, phase.name);
      if (locked) h.appendChild(el('span', 'lock', 'LOCKED &middot; needs c1 greenlight'));
      pdiv.appendChild(h);

      phase.steps.forEach(function (step) {
        var state = STORE.get(activeStore, step.id);
        var row = el('label', 'step' + (state.checked ? ' checked' : '') + (locked ? ' locked' : ''));
        var box = el('input');
        box.type = 'checkbox';
        box.checked = !!state.checked;
        box.disabled = locked;
        box.addEventListener('change', function () {
          STORE.set(activeStore, step.id, box.checked);
          render();   // re-render: progress, tab counts, and gate-lock all update
        });
        var body = el('div', 'body');
        body.appendChild(el('div', 'label', step.label));
        var meta = el('div', 'meta', badges(step));
        body.appendChild(meta);
        if (state.checked && state.at) body.appendChild(el('div', 'at', 'checked ' + state.at));
        row.appendChild(box);
        row.appendChild(body);
        pdiv.appendChild(row);
      });
      sheet.appendChild(pdiv);
    });
  }

  function render() {
    renderTabs();
    renderProgress();
    renderSheet();
  }

  function fail(msg) {
    var e = document.getElementById('err');
    e.hidden = false;
    e.textContent = msg;
  }

  function init() {
    document.getElementById('resetLink').addEventListener('click', function (ev) {
      ev.preventDefault();
      if (confirm('Clear this device’s checks for ' + activeStore + '?')) {
        STORE.clearStore(activeStore);
        render();
      }
    });

    fetch('checklist.json', { cache: 'no-store' })
      .then(function (r) { if (!r.ok) throw new Error('HTTP ' + r.status); return r.json(); })
      .then(function (json) {
        data = json;
        if (!data.stores || !data.stores.length) throw new Error('no stores in checklist.json');
        activeStore = data.stores[0].store_id;
        render();
      })
      .catch(function (e) { fail('Could not load checklist.json — ' + e.message); });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else { init(); }
})();
