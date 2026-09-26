const tools=[
["schema-detective","Schema Detective","Infer useful schemas, candidate keys and starter SQL DDL from CSV or JSON."],
["data-diff-explorer","Data Diff Explorer","Compare two CSV datasets and inspect added, removed and changed rows."],
["csv-relationship-finder","CSV Relationship Finder","Discover likely PK/FK relationships between multiple CSV datasets."],
["data-quality-playground","Data Quality Playground","Run readable data-quality rules against CSV data."],
["log-pattern-analyzer","Log Pattern Analyzer","Group noisy log lines into recurring normalized patterns."],
["dependency-impact-explorer","Dependency Impact Explorer","Explore direct and transitive dependency impact."],
["regex-data-lab","Regex Data Lab","Test regex patterns against realistic multi-line datasets."]
];
const onPages=location.hostname==="raoulmunet.github.io";
const grid=document.querySelector("#toolGrid"),runner=document.querySelector("#runner"),frame=document.querySelector("#toolFrame");
function urlFor(slug){return onPages?`https://raoulmunet.github.io/${slug}/`:`../${slug}/`;}
for(const [slug,name,desc] of tools){
 const c=document.createElement("article");c.className="card";
 c.innerHTML=`<h3>${name}</h3><p class="muted">${desc}</p><div class="toolbar"><button class="primary">Run here</button><a class="btn secondary" href="${urlFor(slug)}" target="_blank" rel="noopener">Standalone</a><a class="btn secondary" href="https://github.com/raoulmunet/${slug}" target="_blank" rel="noopener">Repo</a></div>`;
 c.querySelector("button").onclick=()=>openTool(slug,name,desc);grid.appendChild(c);
}
function openTool(slug,name,desc){
 document.querySelector("#runnerTitle").textContent=name;document.querySelector("#runnerMeta").textContent=desc;
 document.querySelector("#standaloneLink").href=urlFor(slug);frame.src=urlFor(slug);runner.classList.remove("hidden");runner.scrollIntoView({behavior:"smooth"});
}
document.querySelector("#closeRunner").onclick=()=>{frame.src="about:blank";runner.classList.add("hidden");};
