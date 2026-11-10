# Review of ConvexityToric (pull request #1651 at 4347340)
Folder: `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/`
**Verdict:** accepted

This is an incremental re-review of the 22 changed lines since `c1e867d` (one commit, `5c6f144`, README only; `Suggested.lean` is byte-identical). It found no new findings. All three previous findings are repaired, and the repairs introduce nothing new.

## Previous findings

- R01 — repaired: `README.md:591–593` now reads "For a compact connected Lie group K with maximal torus T, Weyl group W=N_K(T)/T and restriction map pr_t*:k*→t*, prove Kostant … for ν∈t* (embedded in k* as the T-fixed covectors)". The O(2) witness is now a negative-control Check (`:616–619`).
- R02 — repaired: `README.md:1028` now reads "At ε=1/2 this is π/(ab)." The unnamed "notes" is gone (`grep -i notes` now matches only the Conrad–Landesman URL at `:1101`).
- R03 — repaired: `:465` "AlgebraicTopology Stage 6's ordinary cohomology"; `:802` "a specialization in this roadmap of Orbifolds O4's generic bundle/connection API"; `:834` and `:854` "SmoothBundlesConnections B6.2’s"; `:1071` "this roadmap's integration". A whole-word grep for AT, CT and SBC in `README.md` now returns nothing.

## Verified sound

**Changed passages reviewed in full.** The commit touches five passages. §2.1 (`:465`) and §4.2 (`:834`, `:854`) only rename roadmaps. §3.2 (`:591–593`) adds the hypotheses to the target, and `:616–619` adds a new Check. §4.1 (`:796`, `:802`) expands "DH" at its first use and rewrites the Orbifolds clause. §5.2 (`:1028`) drops "the notes'". Downstream consumers (`:1071`) also changed. Each passage was read at the head together with everything it cites:
- AlgebraicTopology Stage 6 on main is "cohomology, products, and manifold duality" (`AlgebraicTopology/README.md:946`).
- SmoothBundlesConnections B6.2 (`:1668`) defines `c₁(P)` through the **dual-character** associated line, with Hopf normalization `⟨c₁(Hopf),[ℂP¹]⟩=1`. This is the convention that §4.2 attributes to it.
- Orbifolds O4 item 1 (`Orbifolds/README.md:296–298`) defines orbibundles and principal bundles with connections. O4-T is at `:419`.
- "DH" is first used at `:796`, where it is now expanded. Later uses at `:810–850` and `:1071–1074` follow it.

**Gate and build.**
- The worker's gate at `4347340` passes on every counter, including `build=0`.
- My rerun (without `--build`) gives every counter 0 except `outside-folder=4`. All four entries are files of the pull request's own `CotangentLagrangian` and `IntegrableSystems` folders, which the brief names, so this is not a finding.
- The brief's exclusion diff (`git diff --stat origin/main...HEAD` minus the three folders and the family index) is empty.
- Dependency check output: `depcheck: 234 roadmaps, 2273 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `lake env lean` on `Suggested.lean` reports five `declaration uses sorry` warnings (lines 74, 108, 116, 136, 186) and nothing else.

**Padding probe (rerun).** On a scratch copy, each of the five `sorry` was replaced by `first | rfl | simp | infer_instance | (constructor <;> simp)`. All 5 fail:
- line 83: `simp` made no progress;
- line 112: unsolved goals;
- line 121: `constructor` found no applicable constructor;
- line 146: the target is not an inductive datatype;
- line 209: `simp` made no progress.

**Signatures.** `Suggested.lean` is unchanged since `c1e867d`. For the 16 elaborated signatures, `signatures.md` reports 0 dropped section binders, and the README passages they state (§§1.1, 3.1, 3.3, 5.1) are untouched. The previous comparison stands, and nothing changed.

**Headlines.** The docstring is unchanged. Its line 25 names Kostant projection convexity as not statable, for lack of the compact coadjoint-orbit and chamber-comparison carriers. The new hypotheses in §3.2 make no compact coadjoint-orbit carrier available, so the statement stays a README target. The other headline entries are carried forward from the previous report.

**Adversarial table.** The rows for statements this change leaves untouched are carried forward from the previous report (PRREVIEW-ConvexityToric~26, its table of 30 rows). Those rows cover `fixedMoment`, `fixedMoment_convexHull`, `incidence_moment_range`, `torus_convexity`, `toric_fibers`, `toricImage_delzant`, `IsDelzant`/`IsSmoothVertex`, `HamiltonianTorusData`, §1.1, §1.2, §3.1, §3.2 matrix form, §4 DH, §4.1 level bundle, §4.2 common weight and §5.1. The rows below were computed this round for the changed statements.

| Statement | Instance | Computed on each side | Result |
| --- | --- | --- | --- |
| §3.2 Kostant (`:591–593`) | K=O(2), T=SO(2), ν=1 (now excluded) | Ad of a reflection on so(2) is −1, so K·ν={1,−1}, and pr_t*=id gives {±1}; W=O(2)/SO(2)=ℤ/2, so conv(W·ν)=[−1,1] | unequal; the hypothesis "connected" excludes this case, and the new Check records it |
| §3.2 Kostant | K=SO(2) | coadjoint action is trivial, so K·ν={ν}; W is trivial, so conv={ν} | equal |
| §3.2 Kostant | K=SU(2), ν=r≠0 on the axis | the orbit is the sphere of radius ‖r‖ in su(2)*≅ℝ³ (the action is SO(3)), with projection [−‖r‖,‖r‖]; W·ν={±r}, so the hull is [−‖r‖,‖r‖] | equal |
| §3.2 Kostant | K=SU(2), ν=0 | orbit {0} (the metric sphere of radius 0), projection {0}; W·0={0} | equal |
| §3.2 Kostant | K=U(2), ν=(2,0) | the diagonals of U diag(2,0) U* are (2t,2−2t) for t∈[0,1]; W=S₂ gives conv{(2,0),(0,2)} | equal; agrees with the Check at `:609` |
| §3.2 Kostant | K trivial (rank 0) | k*=t*=0, so both sides are {0} | equal |
| §3.2 embedding of t* | K=SU(2) | the centralizer of t in k is t, so (k*)^T is the axis and pr_t* restricted to it is the identity | the identification holds for connected K |
| §3.2 route via Cannas da Silva Thm 27.1 | the orbit K·ν | Thm 27.1 needs a compact connected manifold (cannas-da-silva-lsg line 6473); K·ν is connected iff K is (for O(2) the orbit is {±1}) | the route matches the new hypothesis |
| §5.2 value (`:1028`) | ε=1/2 in area 2πε/(ab) | 2π·(1/2)/(ab)=π/(ab); (a,b)=(1,1) gives π; (2,3) gives π/6, matching the Check at `:1051` (πε/3 at ε=1/2) | holds |
| §5.2 against §4.2 Hopf | a=b=1, c=ε=1/2 | the slice area is 2πε=π; the Hopf reduction area is 2πc=π; `[ω_c]=2πc·c₁(P)_ℝ` paired with [ℂP¹] gives 2πc·1=π | agrees |
| §4.2 sign (`:834`, `:854`) | the reversed diagonal circle on ℂ², μ=(‖z₁‖²+‖z₂‖²)/2 | B6.2 c₁(Hopf)=+1 on the dual-character line; the standard-character class is u=−h, so its value is −1 | the convention is unchanged by the rename |

**Sources (seeded sample, in the changed passages).** Sampled targets 2.1, 3.2, 4.1, 4.2 and 5.2 fall in the changed text, and only §3.2 changed a mathematical claim. I re-read Cannas da Silva Theorem 27.1 in the author's copy (cannas-da-silva-lsg lines 6472–6479, printed p. 169). It assumes a compact connected symplectic manifold with a Hamiltonian torus action, and it concludes that the levels are connected and that the image is convex and equals the hull of the images of the fixed points. Applied to K·ν with K connected, this supports the restated target.

The §4.1 locators are unchanged and re-confirmed: Definition 30.2 and Theorem 30.3 at lines 7195–7226 (p. 191), and Proposition 30.7 and Theorem 30.8 at lines 7320–7341. Sampled targets 1.1, 1.2, 3.1, 3.3 and 5.1 are untouched; the previous report verified them.

**Ownership and overlaps.** The change adds no object. `overlaps.md` lists the dropped anchor `#t1-compact-symplectic-actions-and-local-models`. This pull request repoints it (`IntegrableSystems/README.md:21` → `#layer-1-compact-symplectic-actions-and-local-models`), and `README.md:200` maps T1–T5 to Layers 1–5. Its other listed citer is the IntegrableSystems pin-bump revision, which the description's shared-folder order places after this pull request.

**Pull request description.** The ConvexityToric §5.2 bullet ("including the level ε=1/2") agrees with `:1028`. The other ConvexityToric bullets concern text this commit leaves untouched.

## Not verifiable

- Kirwan, *Cohomology of quotients in symplectic and algebraic geometry*, Part I, §§4–5: not openly available, and untouched by this change (carried from the previous report).

## Source issues

- none
