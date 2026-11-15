# Review of SchemeAndStackFoundationsPartII (pull request #2272 at f517dd7)

**Verdict:** accepted

No findings.

## Deferred findings

- D01 — stands

## Previous findings

- R01 — repaired: the summary block now ends “…Tau Ceti's affine fppf sites, Cartier duality, henselization and Weil restriction; derived completion is imported from DerivedModuleAlgebra §§1.1–1.9”, matching README lines 19 and 68–90.

## Verified sound

| Statement | Instances tried | Left / input value | Right / output value | Result | Change |
|---|---|---|---|---|---|
| `flatCohomology_henselian_invariance` (README §2.2; description: “surjectivity in degree one and bijectivity from degree two”) | p=2: R=ℤ₂, I=(2), G=μ₂ | H¹=ℤ₂^×/squares=(ℤ/2)²; H²=Br(ℤ₂)[2]=0 (Pic=0) | H¹(𝔽₂,μ₂)=𝔽₂^×/squares=0; H²=Br(𝔽₂)[2]=0 | n=1 onto with kernel of order 4, not injective; n=2 bijective | — |
| Same, infinitesimal coefficients and boundary cases | R=𝔽_p[[t]], I=(t), G=α_p; I=0; n=0 | H¹=R/R^p≠0 (class of t); H²=0. I=0: source equals target | H¹(𝔽_p,α_p)=𝔽_p/𝔽_p^p=0; H²=0. Identity map | Onto at n=1, bijective at n=2; I=0 bijective; n=0 both implications vacuous | — |
| `flatCohomology_algebraization` (README §§2.3–2.4; description: “from degree two across topological completion and on Laurent punctures”) | B=𝔽_p{t}[1/t], B′=t𝔽_p{t}, G=μ_p; discrete B, B′=0 | H²=Br(B)[p]=ℤ/p; H¹=B^×/p countable. Discrete: B̂=B | H²(𝔽_p((t)),μ_p)=ℤ/p; H¹ uncountable (units 1+t·h(t^p)). Identity | Bijective at n=2; fails at n=1, as the bound n≥2 says | — |

Rows for untouched statements stand as in the previous review, of `f517dd7`.

- The folder is unchanged since `f517dd7` (0 lines); this round read the title and every sentence of the description (summary block and prose) against the README and `Suggested.lean` at the head: 0 contradicted, 0 unstated changes (the pull request adds the roadmap; 0 headings and 0 declarations removed).
- Description claims confirmed at the head: finite-ideal continuity by derived Koszul quotients (§1.5, line 243); arbitrary non-Noetherian pairs (§2.2, line 369); Popescu route (lines 363, 378); Cauchy nets and no first-countability (lines 104, 384); Laurent puncture (§2.4); full and punctured descent under derived completeness (§3.2, line 466); Mathlib's big fppf site (lines 15, 329); consumers (line 489); imports from PrismaticCohomologyPartIII §6.0 and PurityForFlatCohomology §§3.2, 3.3, 3.5, 3.6 (lines 3, 11, 13).
- `Suggested.lean` against the description: 2 theorems stated (lines 102, 130), 4 real-bodied definitions, cohomology as `Abelian.extFunctor` out of the sheafified free sheaf on a representable (lines 92–96), §1.5 and §3.2 named in the docstring as not statable (lines 36–40); the folder holds exactly README, `Suggested.lean`, `metadata.toml`.
- Suppliers: 10 supplier subsections in the README; 3 on main (DerivedModuleAlgebra, EnhancedDerivedSheaves, SchemeAndStackFoundations), 7 open, the 7 of the description's list; cross-roadmap citations found nowhere: 0.
- Gate rerun at this head: every counter 0, `OK`. Direct elaboration of `Suggested.lean`: exit 0, the 2 `sorry` warnings (lines 102, 130) the only output.
- Dependency-check output: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`.
- Outside-folder diff against the base: 0 paths; worktree clean.
- Source locators: none rechecked (no passage changed; the seeded sample falls in no changed passage). D01: `packages/SchemeAndStackFoundationsPartII/design/plan.json` still lists 19 gaps, none with slug `classical-affine-group-adapter`.

Overlap check: no passage changed; the overlap list at this head shows no other pull request changing this roadmap, no dropped id and no second copy. The scopes of PurityForFlatCohomology, ArcTopologyAndDescent and PrismaticCohomologyPartIII were not reread this round; ownership stands as in the review of `f517dd7`, nothing shared.

Source independence: changed passages only; 0 passages changed, so 0 compared; largest share CS24 as in the earlier full review; no layer added, removed or reordered, so the contents comparison stands.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
