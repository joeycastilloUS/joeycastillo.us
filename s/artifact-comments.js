/* Be — artifact comment + collapse + new-indicator widget (the "kung ~fu" template).
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
  +".ac-bar{margin-top:12px;padding-top:9px;border-top:1px solid #22303a;}"
  +".ac-toggle{background:none;border:0;color:#6FC3DF;font-size:11px;cursor:pointer;font-family:inherit;padding:0;letter-spacing:.02em;text-transform:uppercase;font-weight:700;} .ac-toggle:hover{color:#9fe;} .ac-count{color:#7d8894;}"
  +".ac-newbadge{background:#0c1c22;color:#7CFFB2;border:1px solid #1f5f47;border-radius:10px;padding:1px 8px;font-size:10px;font-weight:800;margin-left:6px;}"
  +".ac-panel{margin-top:12px;display:none;} .ac-panel.open{display:block;}"
  +".ac-item{background:#10171c;border:1px solid #222c33;border-radius:12px;padding:11px 14px;margin:9px 0;}"
  +".ac-item.me{border-color:#243b43;background:#0e161b;box-shadow:inset 3px 0 0 #6FC3DF;padding-left:16px;} .ac-item.isnew{box-shadow:inset 3px 0 0 #7CFFB2;}"
  +".ac-ih{font-size:11px;margin-bottom:5px;display:flex;gap:8px;align-items:baseline;flex-wrap:wrap;} .ac-ih b{font-weight:800;} .ac-item.me .ac-ih b{color:#6FC3DF;} .ac-item.op .ac-ih b{color:#e0b56f;} .ac-t{color:#59626b;font-size:10.5px;}"
  +".ac-tx{font-size:13.5px;color:#e2e8ee;line-height:1.66;white-space:pre-wrap;word-break:break-word;} .ac-item.cmd .ac-tx{font-family:Consolas,monospace;font-size:12.5px;color:#e6f4fa;background:#0a1013;border:1px solid #1a2830;border-radius:7px;padding:9px 11px;}"
  +".ac-tilde{background:#241d06;color:#ffd479;border-radius:5px;padding:1px 7px;font-size:9.5px;font-weight:800;} .ac-seen{color:#7CFFB2;font-size:10px;font-weight:800;} .ac-newtag{background:#0c1c22;color:#7CFFB2;border-radius:4px;padding:1px 6px;font-size:9.5px;font-weight:800;} .ac-empty{color:#5a636c;font-size:12.5px;font-style:italic;}"
  +".ac-post{margin-top:12px;display:grid;grid-template-columns:130px 1fr auto;gap:8px;align-items:start;}"
  +".ac-post input,.ac-post textarea{background:#0d0d0d;color:#e6e6e6;border:1px solid #2a2f34;border-radius:8px;padding:9px 11px;font-size:13px;font-family:inherit;} .ac-post input:focus,.ac-post textarea:focus{outline:0;border-color:#6FC3DF;} .ac-post textarea{resize:vertical;min-height:38px;}"
  +".ac-post button{background:#6FC3DF;color:#06222c;border:0;border-radius:8px;padding:9px 18px;font-weight:800;font-size:13px;cursor:pointer;font-family:inherit;}"
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
        return "<div class='ac-item "+(mine?"me":"op")+(c.isCommand?" cmd":"")+(isnew?" isnew":"")+"'><div class='ac-ih'><b>"+esc(c.author)+"</b> <span class='ac-t'>"+esc((c.ts||'').replace('T',' ').replace('Z',' UTC'))+"</span>"+(c.isCommand?"<span class='ac-tilde'>TILDE &mdash; metal acts</span>":"")+(seen?"<span class='ac-seen'>&#10003; seen by metal</span>":"")+(isnew?"<span class='ac-newtag'>NEW</span>":"")+"</div><div class='ac-tx'>"+esc(c.text)+"</div></div>";
      }).join(""):"<div class='ac-empty'>No comments yet.</div>";
    });
    tick();
  }
  function relt(ms){ var s=Math.round((Date.now()-ms)/1000); if(s<2)return "just now"; if(s<60)return s+"s ago"; return Math.round(s/60)+"m ago"; }
  function tick(){ var e=el("ac-live"); if(e&&lastPoll) e.innerHTML="<span class='ac-dot'></span> live &middot; "+relt(lastPoll)+(totalNew?" &middot; <b style='color:#7CFFB2'>"+totalNew+" new</b>":""); }
  function load(){ fetch(GB+"/comments?doc="+DOC+"&_="+Date.now(),{cache:"no-store"}).then(function(r){return r.json();}).then(function(d){ seenTs=(d&&d.seenByMetal)||seenTs; lastPoll=Date.now(); render((d&&d.comments)||[]); }).catch(function(){}); }
  function markRead(o){ lsSet(readKey(o), nowIso()); render(allComments); }
  function post(o){
    var a=((el("aca-"+o)||{}).value||"").trim()||"operator", t=((el("acx-"+o)||{}).value||"").trim();
    if(!t) return; lsSet("cm_author",a);
    fetch(GB+"/comments?doc="+DOC,{method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify({obj:o,author:a,text:t})}).then(function(r){return r.json();}).then(function(){ el("acx-"+o).value=""; markRead(o); load(); }).catch(function(){});
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
