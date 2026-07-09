/* Be — artifact comment + collapse + new-indicator widget (the "kung ~fu" template).
   v5 (2026-07-08): resilient Post — 6 retries (~12s window) rides Cloud Run instance churn, surfaces errors, keeps your text.
   Drop into any Be artifact:
     <script>window.ARTIFACT={doc:"my-artifact-key"};</script>
     <script src="../tools/artifact-comments.js"></script>
   Mark any element commentable + collapsible with data-cm="<object-id>". The heading immediately
   before it becomes a collapse toggle. Comments are open (no lock), per-object, backed by the
   gcp-bridge /comments API. "N new" = comments you haven't opened yet (per-object, localStorage).
   metal reads via /comments/recent and stamps seen. Self-contained: injects its own CSS. */
(function(){
  var CFG = window.ARTIFACT || {};
  var GB  = CFG.bridge || "https://gcp-bridge-692654781984.us-west1.run.app";
  var DOC = CFG.doc; if(!DOC){ return; }

  function esc(s){ return String(s==null?"":s).replace(/[&<>]/g,function(c){return {"&":"&amp;","<":"&lt;",">":"&gt;"}[c];}); }
  function el(id){ return document.getElementById(id); }
  function lsGet(k){ try{ return localStorage.getItem(k)||""; }catch(_){ return ""; } }
  function lsSet(k,v){ try{ localStorage.setItem(k,v); }catch(_){} }
  function nowIso(){ return new Date().toISOString().replace(/\.\d+Z$/,"Z"); }
  function readKey(o){ return "acr_"+DOC+"_"+o; }

  // ---- inject CSS (template ships its own look) ----
  var css=
  ".ac-h{cursor:pointer;user-select:none;} .ac-chev{display:inline-block;color:#6FC3DF;font-size:.8em;transition:transform .15s;transform:rotate(-90deg);} .ac-h.ac-open .ac-chev{transform:none;}"
  +".ac-hnew{background:#241d06;color:#ffd479;border-radius:5px;padding:1px 7px;font-size:10px;font-weight:800;margin-left:8px;vertical-align:middle;}"
  +"[data-cm].ac-collapsed{display:none;}"
  +".ac-bar{margin-top:16px;padding-top:11px;border-top:1px solid #1b2730;}"
  +".ac-toggle{background:none;border:0;color:#6FC3DF;font-size:11px;cursor:pointer;font-family:inherit;padding:0;letter-spacing:.03em;text-transform:uppercase;font-weight:700;display:inline-flex;align-items:center;gap:7px;} .ac-toggle:hover{color:#9fe;} .ac-count{color:#7d8894;}"
  +".ac-newbadge{background:#0c1c22;color:#7CFFB2;border:1px solid #1f5f47;border-radius:10px;padding:1px 8px;font-size:10px;font-weight:800;}"
  +".ac-panel{margin-top:14px;display:none;max-width:680px;} .ac-panel.open{display:block;}"
  +".ac-item{position:relative;background:#0f161b;border:1px solid #1d2831;border-radius:14px;padding:13px 16px;margin:11px 0;transition:border-color .15s;}"
  +".ac-item.me{background:#0c1418;border-color:#213640;} .ac-item.op{background:#14120b;border-color:#332f1f;} .ac-item.isnew{border-color:#1f5f47;}"
  +".ac-ih{display:flex;align-items:center;gap:10px;margin-bottom:8px;}"
  +".ac-av{width:26px;height:26px;border-radius:50%;display:inline-flex;align-items:center;justify-content:center;font-size:11.5px;font-weight:800;flex:0 0 auto;}"
  +".ac-item.me .ac-av{background:#123039;color:#6FC3DF;} .ac-item.op .ac-av{background:#332a12;color:#e6c179;}"
  +".ac-name{font-weight:700;font-size:13px;} .ac-item.me .ac-name{color:#6FC3DF;} .ac-item.op .ac-name{color:#e6c179;}"
  +".ac-t{color:#5c6670;font-size:11px;margin-left:auto;white-space:nowrap;}"
  +".ac-tx{font-size:14px;color:#dfe6ec;line-height:1.62;white-space:pre-wrap;word-break:break-word;} .ac-item.cmd .ac-tx{font-family:Consolas,monospace;font-size:12.5px;color:#e6f4fa;background:#0a1013;border:1px solid #1a2830;border-radius:8px;padding:10px 12px;}"
  +".ac-tilde{background:#241d06;color:#ffd479;border-radius:5px;padding:1px 7px;font-size:9.5px;font-weight:800;} .ac-seen{color:#7CFFB2;font-size:10px;font-weight:700;} .ac-newtag{background:#0c1c22;color:#7CFFB2;border-radius:4px;padding:1px 6px;font-size:9.5px;font-weight:800;} .ac-empty{color:#5a636c;font-size:13px;font-style:italic;padding:2px 0;}"
  +".ac-err{background:#2a1414;color:#ffb4b4;border:1px solid #6b2b2b;border-radius:8px;padding:8px 12px;font-size:12.5px;margin:8px 0;}"
  +".ac-post{margin-top:16px;max-width:680px;display:grid;grid-template-columns:118px 1fr auto;gap:9px;align-items:end;}"
  +".ac-post input,.ac-post textarea{background:#0b0f12;color:#e6e6e6;border:1px solid #24303a;border-radius:10px;padding:10px 13px;font-size:13px;font-family:inherit;} .ac-post input::placeholder,.ac-post textarea::placeholder{color:#586470;} .ac-post input:focus,.ac-post textarea:focus{outline:0;border-color:#6FC3DF;} .ac-post textarea{resize:vertical;min-height:44px;line-height:1.5;}"
  +".ac-post button{background:#6FC3DF;color:#06222c;border:0;border-radius:10px;padding:11px 22px;font-weight:800;font-size:13px;cursor:pointer;font-family:inherit;height:44px;} .ac-post button:hover{background:#8ad3ea;}"
  +"@media(max-width:560px){ .ac-post{grid-template-columns:1fr;} }"
  +".ac-navbox{display:inline-flex;align-items:center;gap:12px;font-size:11px;color:#7d8894;}"
  +".ac-live{display:inline-flex;align-items:center;gap:7px;} .ac-dot{width:7px;height:7px;border-radius:50%;background:#7CFFB2;animation:acpulse 2s infinite;}"
  +".ac-navbtn{background:#16242b;color:#9aa3ad;border:1px solid #2c4a55;border-radius:6px;padding:4px 10px;font-size:11px;cursor:pointer;font-family:inherit;} .ac-navbtn:hover{border-color:#6FC3DF;color:#6FC3DF;}"
  +"@keyframes acpulse{0%{box-shadow:0 0 0 0 rgba(124,255,178,.55);}70%{box-shadow:0 0 0 6px rgba(124,255,178,0);}100%{box-shadow:0 0 0 0 rgba(124,255,178,0);}}";
  var st=document.createElement("style"); st.textContent=css; document.head.appendChild(st);

  var objs=[].slice.call(document.querySelectorAll("[data-cm]"));

  // ---- collapse: wire the heading before each card ----
  objs.forEach(function(node){
    var h=node.previousElementSibling;
    while(h && !/^H[1-6]$/.test(h.tagName)) h=h.previousElementSibling;
    if(h){ h.classList.add("ac-h","ac-open"); h.setAttribute("data-accol", node.getAttribute("data-cm"));
      h.insertAdjacentHTML("afterbegin","<span class='ac-chev'>&#9662;</span> ");
      h.insertAdjacentHTML("beforeend","<span class='ac-hnew' id='ach-"+node.getAttribute("data-cm")+"' style='display:none'></span>"); }
  });

  // ---- comment bar per object ----
  objs.forEach(function(node){
    var obj=node.getAttribute("data-cm");
    var bar=document.createElement("div"); bar.className="ac-bar";
    bar.innerHTML="<button class='ac-toggle' data-accm='"+obj+"'><span class='ac-count' id='acc-"+obj+"'>comment</span><span id='acn-"+obj+"'></span></button>"
      +"<div class='ac-panel' id='acp-"+obj+"'><div id='acl-"+obj+"'></div>"
      +"<div class='ac-post'><input id='aca-"+obj+"' placeholder='name' autocomplete='off'>"
      +"<textarea id='acx-"+obj+"' rows='1' placeholder='comment &mdash; or a tilde like ~go'></textarea>"
      +"<button data-acpost='"+obj+"'>Post</button></div></div>";
    node.appendChild(bar);
  });

  // ---- nav controls ----
  var nav=document.querySelector("nav");
  if(nav){ var box=document.createElement("span"); box.className="ac-navbox";
    box.innerHTML="<span id='ac-live' class='ac-live'></span><button id='ac-collapse' class='ac-navbtn'>collapse all</button>";
    nav.appendChild(box); }

  var seenTs="", lastPoll=0, allComments=[], totalNew=0;
  function render(all){
    allComments=all;
    var g={}; all.forEach(function(c){ (g[c.obj]=g[c.obj]||[]).push(c); });
    totalNew=0;
    objs.forEach(function(node){
      var obj=node.getAttribute("data-cm"), cs=g[obj]||[], lastRead=lsGet(readKey(obj));
      var newN=cs.filter(function(c){return c.author!=="metal" && c.ts>lastRead;}).length; totalNew+=newN;
      var cc=el("acc-"+obj); if(cc) cc.textContent = cs.length ? (cs.length+" comment"+(cs.length>1?"s":"")) : "comment";
      var nb=el("acn-"+obj); if(nb) nb.innerHTML = newN? " <span class='ac-newbadge'>"+newN+" new</span>":"";
      var hn=el("ach-"+obj); if(hn){ hn.textContent = newN? (newN+" new"):""; hn.style.display = newN? "":"none"; }
      var cl=el("acl-"+obj); if(cl) cl.innerHTML = cs.length ? cs.map(function(c){
        var mine=c.author==="metal", isnew=(c.author!=="metal" && c.ts>lastRead), seen=(!mine && seenTs && c.ts<=seenTs);
        var nm=mine?"metal":((c.author||"anon").trim()||"anon"), ini=(nm.charAt(0)||"?").toUpperCase();
        return "<div class='ac-item "+(mine?"me":"op")+(c.isCommand?" cmd":"")+(isnew?" isnew":"")+"'>"
          +"<div class='ac-ih'><span class='ac-av'>"+esc(ini)+"</span><span class='ac-name'>"+esc(nm)+"</span>"
          +(c.isCommand?"<span class='ac-tilde'>TILDE</span>":"")+(seen?"<span class='ac-seen'>&#10003; seen</span>":"")+(isnew?"<span class='ac-newtag'>NEW</span>":"")
          +"<span class='ac-t' title='"+esc((c.ts||'').replace('T',' ').replace('Z',' UTC'))+"'>"+esc(reltIso(c.ts))+"</span></div>"
          +"<div class='ac-tx'>"+esc(c.text)+"</div></div>";
      }).join(""):"<div class='ac-empty'>No comments yet &mdash; start the thread.</div>";
    });
    tick();
  }
  function relt(ms){ var s=Math.round((Date.now()-ms)/1000); if(s<2)return "just now"; if(s<60)return s+"s ago"; return Math.round(s/60)+"m ago"; }
  function reltIso(iso){ if(!iso) return ""; var t=Date.parse(String(iso).replace(" ","T")); if(isNaN(t)) return iso; var s=Math.round((Date.now()-t)/1000); if(s<0)s=0; if(s<45)return "just now"; if(s<90)return "1 min ago"; if(s<3600)return Math.round(s/60)+" min ago"; if(s<5400)return "1 hr ago"; if(s<86400)return Math.round(s/3600)+" hr ago"; if(s<172800)return "yesterday"; if(s<2592000)return Math.round(s/86400)+" days ago"; try{ return new Date(t).toLocaleDateString(undefined,{month:"short",day:"numeric"}); }catch(_){ return iso; } }
  function tick(){ var e=el("ac-live"); if(e&&lastPoll) e.innerHTML="<span class='ac-dot'></span> live &middot; "+relt(lastPoll)+(totalNew?" &middot; <b style='color:#7CFFB2'>"+totalNew+" new</b>":""); }
  function load(){ fetch(GB+"/comments?doc="+DOC+"&_="+Date.now(),{cache:"no-store"}).then(function(r){return r.json();}).then(function(d){ seenTs=(d&&d.seenByMetal)||seenTs; lastPoll=Date.now(); render((d&&d.comments)||[]); }).catch(function(){}); }
  function markRead(o){ lsSet(readKey(o), nowIso()); render(allComments); }
  // Post is RESILIENT: the backend (Cloud Run) can cold-start and 500 the first
  // write after idle. Retry with backoff, show state, and NEVER silently drop the
  // operator's text — a failed post keeps the text so it's one click to retry.
  function flashErr(o,msg){ var l=el("acl-"+o); if(!l) return;
    var d=document.createElement("div"); d.className="ac-err"; d.textContent=msg;
    l.insertBefore(d,l.firstChild); setTimeout(function(){ if(d.parentNode)d.parentNode.removeChild(d); },7000); }
  function post(o){
    var a=((el("aca-"+o)||{}).value||"").trim()||"operator", t=((el("acx-"+o)||{}).value||"").trim();
    if(!t) return; lsSet("cm_author",a);
    var btn=document.querySelector("[data-acpost='"+o+"']"), orig=btn?btn.textContent:"Post";
    if(btn){ btn.disabled=true; btn.textContent="Posting…"; }
    var body=JSON.stringify({obj:o,author:a,text:t});
    function done(){ if(btn){btn.disabled=false;btn.textContent=orig;} var x=el("acx-"+o); if(x)x.value=""; markRead(o); load(); }
    function fail(){ if(btn){btn.disabled=false;btn.textContent="Retry ↻";} /* keep text */
      flashErr(o,"Couldn't reach the comment server — your text is kept. Press Retry."); }
    function attempt(n){
      fetch(GB+"/comments?doc="+DOC,{method:"POST",headers:{"Content-Type":"application/json"},body:body})
        .then(function(r){ if(!r.ok) throw new Error("http "+r.status); return r.json(); })
        .then(function(d){ if(d&&d.error) throw new Error(d.error); done(); })
        .catch(function(){ if(n<7){ if(btn) btn.textContent="Retrying… ("+n+")"; setTimeout(function(){attempt(n+1);}, Math.min(2500,600*n)); } else { fail(); } });
    }
    attempt(1);
  }
  function setCollapsed(node,on){ node.classList.toggle("ac-collapsed",on); var h=el("acp-"+node.getAttribute("data-cm")); var head=document.querySelector("[data-accol='"+node.getAttribute("data-cm")+"']"); if(head) head.classList.toggle("ac-open",!on); }
  function toggleAll(){ var anyOpen=objs.some(function(n){return !n.classList.contains("ac-collapsed");}); objs.forEach(function(n){ setCollapsed(n, anyOpen); }); var b=el("ac-collapse"); if(b) b.textContent = anyOpen? "expand all":"collapse all"; }

  document.addEventListener("click", function(e){
    if(!e.target||!e.target.closest) return;
    if(e.target.id==="ac-collapse"){ toggleAll(); return; }
    var col=e.target.closest("[data-accol]"); if(col && !e.target.closest("[data-accm]") && !e.target.closest(".ac-bar")){ var o=col.getAttribute("data-accol"); var card=document.querySelector("[data-cm='"+o+"']"); if(card) setCollapsed(card, !card.classList.contains("ac-collapsed")); return; }
    var tg=e.target.closest("[data-accm]"); if(tg){ var o=tg.getAttribute("data-accm"); var p=el("acp-"+o); if(p){ p.classList.toggle("open"); if(p.classList.contains("open")) markRead(o); } return; }
    var pb=e.target.closest("[data-acpost]"); if(pb){ post(pb.getAttribute("data-acpost")); return; }
  });

  try{ var la=lsGet("cm_author"); if(la) objs.forEach(function(n){ var ai=el("aca-"+n.getAttribute("data-cm")); if(ai) ai.value=la; }); }catch(_){}
  load(); setInterval(load, 15000); setInterval(tick, 1000);
})();
