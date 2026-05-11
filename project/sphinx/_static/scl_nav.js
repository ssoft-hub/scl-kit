(function () {
  'use strict';

  var cfg = window.SCL_NAV;

  // ── Build and insert nav bar ─────────────────────────────────────────────────
  var bar = document.createElement('div');
  bar.id = 'scl-nav';

  var left = document.createElement('div');
  left.className = 'scl-nav-left';

  var homeLink = document.createElement('a');
  homeLink.href = '/';
  homeLink.className = 'scl-nav-home';
  homeLink.textContent = 'SCL Toolkit';
  left.appendChild(homeLink);

  if (cfg && cfg.module) {
    left.appendChild(sep());

    var modLink = document.createElement('a');
    modLink.href = cfg.siteRoot + cfg.module + '/';
    modLink.className = 'scl-nav-module';
    modLink.textContent = 'SCL ' + capitalize(cfg.module);
    left.appendChild(modLink);

    if (cfg.versions && cfg.versions.length) {
      left.appendChild(sep());

      var sel = document.createElement('select');
      sel.id = 'scl-ver-select';
      sel.className = 'scl-nav-select';
      cfg.versions.forEach(function (v) {
        var opt = document.createElement('option');
        opt.value = v.v;
        opt.textContent = v.label;
        if (v.v === cfg.version) opt.selected = true;
        sel.appendChild(opt);
      });
      sel.addEventListener('change', function () {
        window.location.href = cfg.siteRoot + cfg.module + '/' + sel.value + '/';
      });
      left.appendChild(sel);
    }
  }

  bar.appendChild(left);

  var right = document.createElement('div');
  right.className = 'scl-nav-right';

  var searchBtn = document.createElement('button');
  searchBtn.id = 'scl-search-btn';
  searchBtn.className = 'scl-nav-search-btn';
  searchBtn.setAttribute('title', 'Search (Ctrl+K)');
  searchBtn.innerHTML = '<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg> Search';
  right.appendChild(searchBtn);

  bar.appendChild(right);

  if (document.body) {
    document.body.insertBefore(bar, document.body.firstChild);
  } else {
    document.addEventListener('DOMContentLoaded', function () {
      document.body.insertBefore(bar, document.body.firstChild);
    });
  }

  // ── Search modal ─────────────────────────────────────────────────────────────
  var searchLoaded = false;
  var searchModal = null;

  searchBtn.addEventListener('click', openSearch);

  document.addEventListener('keydown', function (e) {
    if ((e.ctrlKey || e.metaKey) && e.key === 'k') {
      e.preventDefault();
      openSearch();
    }
    if (e.key === 'Escape' && searchModal) {
      closeSearch();
    }
  });

  function openSearch() {
    if (!searchLoaded) {
      loadPagefind(function () {
        showSearchModal();
      });
    } else {
      showSearchModal();
    }
  }

  function showSearchModal() {
    if (!searchModal) {
      var backdrop = document.createElement('div');
      backdrop.id = 'scl-search-backdrop';
      backdrop.addEventListener('click', closeSearch);

      var box = document.createElement('div');
      box.id = 'scl-search-box';

      var inner = document.createElement('div');
      inner.id = 'scl-search-inner';
      box.appendChild(inner);

      searchModal = document.createElement('div');
      searchModal.id = 'scl-search-modal';
      searchModal.appendChild(backdrop);
      searchModal.appendChild(box);
      document.body.appendChild(searchModal);

      new PagefindUI({ element: '#scl-search-inner', showSubResults: true, resetStyles: false });
    }
    searchModal.style.display = 'flex';
    setTimeout(function () {
      var inp = searchModal.querySelector('input[type=text]');
      if (inp) inp.focus();
    }, 50);
  }

  function closeSearch() {
    if (searchModal) searchModal.style.display = 'none';
  }

  function loadPagefind(cb) {
    if (searchLoaded) { if (cb) cb(); return; }
    var link = document.createElement('link');
    link.rel = 'stylesheet';
    link.href = '/_pagefind/pagefind-ui.css';
    document.head.appendChild(link);
    var script = document.createElement('script');
    script.src = '/_pagefind/pagefind-ui.js';
    script.onload = function () { searchLoaded = true; if (cb) cb(); };
    document.head.appendChild(script);
  }

  function sep() {
    var s = document.createElement('span');
    s.className = 'scl-nav-sep';
    s.textContent = '/';
    return s;
  }

  function capitalize(s) {
    return s ? s.charAt(0).toUpperCase() + s.slice(1) : s;
  }
})();
