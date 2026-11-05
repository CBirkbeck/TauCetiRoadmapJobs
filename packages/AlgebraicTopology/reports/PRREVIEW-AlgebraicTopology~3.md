# Review of AlgebraicTopology (pull request #1663 at 1fc6a4c)

**Verdict:** needs changes

This pull request revises the AlgebraicTopology roadmap on main: it adds a product-ball intersection paragraph to Stage 6.5, a Whitehead inducing-map counterexample to Stage 8.5, a new item 8.13 (smooth low-codimension representatives), three new sections 8.14–8.16, one dependency-table row, one acceptance bullet, one import plus one `#check` in `Suggested.lean`, and three companion Lean files. The mathematics of the new targets is sound in every instance I computed (table below). The blocking defects are an unowned prerequisite (transversality and map smoothing in 8.13), a proof route in 8.15 that does not prove its bound, three statable headlines kept out of `Suggested.lean`, and a failing gate most of whose failures the pull request inherits from main but does not repair.

## R01 (P1) — 8.13 cites "GT/DG smoothing and relative transversality", which no roadmap on main owns

Location: `TauCetiRoadmap/AlgebraicTopology/README.md` lines 2199–2200 ("Smooth the maps and make them transverse to 1∈Circle, RP^(N−1)⊂RP^N or CP^(N−1)⊂CP^N") and the dependency row at line 2378 ("GT/DG smoothing and relative transversality"); also lines 2240–2243 (relative smoothing and transversality of homotopies fixing endpoint collars).

Claim: the smoothing of a continuous map M→S¹/RPᴺ/CPᴺ and its perturbation to a map transverse to a point or a hyperplane, relative to a closed set, are supplied by GeometricTopology or DifferentialGeometry.

Witness: `TauCetiRoadmap/GeometricTopology/README.md` on main contains no transversality target (the only match for "transvers" is the foliation closed-transversal sentence at line 803); its smoothing-and-triangulation comparison (lines 930–952) is "smooth implies PL". `TauCetiRoadmap/DifferentialGeometry/README.md` on main has Sard (Layer 10.2) and relative Whitney approximation for smooth simplices only (8.3, Lee Thm 18.7, lines 836–844); no transversality theorem. Mathlib at the pin approximates only maps into normed spaces (`Mathlib/Geometry/Manifold/SmoothApprox.lean`, `Continuous.exists_contMDiff_approx_and_eqOn`). The transversality theorem exists only in open pull requests (TangentialBordism B1.6, DeRhamCohomologyAndDuality Layer 5, and the DifferentialGeometry and GeometricTopology revision pull requests), none of which a roadmap on main may cite.

Repair: state the two inputs as targets of 8.13 with their hypotheses, and name them in the row: (a) for compact smooth Hausdorff second-countable M and target S¹, RPᴺ or CPᴺ, every continuous map is homotopic to a smooth map, relative to a closed set where it is already smooth; (b) for a smooth map and the closed submanifold {1}, RPᴺ⁻¹ or CPᴺ⁻¹, a homotopic smooth map transverse to it, relative to a closed set on which transversality already holds (this is what the endpoint collars of the bordism argument use). Record that these notions move down into this roadmap because their only owners are later in the merge order.

## R02 (P2) — 8.15's cohomological-dimension bound is not proved by the route written

Location: `README.md` lines 2313–2321 ("prove H^k(M;F_p)=0 for k>n … construct the natural Čech-to-singular comparison by the subordinate-chain/nerve double complex and subdivision. The refined nerves have no cochains above n, giving the asserted bound").

Claim: a natural comparison from Čech cochains of covers of order ≤ n+1 to singular cochains gives H^k(M;F_p)=0 for k>n on the compact topological quotient M=Sⁿ/(C_p×C_p).

Witness: vanishing of the Čech side transfers to singular cohomology only if the comparison is surjective in degrees above n, i.e. only with the theorem that Čech and singular cohomology agree on compact locally contractible spaces; the text constructs the map and never states that theorem, its hypotheses or a locator, and it also needs covering dimension ≤ n for compact topological n-manifolds, stated nowhere. Hatcher Exercise 28 of §4.2 (bebb3032 lines 16980–16985, p. 391) uses "M a closed manifold" with the ordinary manifold bound.

Repair: drop the covering-dimension and Čech targets. Prove H_k(M;F_p)=0 for k>n by the argument of Hatcher Lemma 3.27 (bebb3032 line 10255, p. 236), which is purely topological (coordinate balls, Mayer–Vietoris, compact finite-cover induction) and is exactly the route Stage 6.3 already uses at line 1251 for its compact-support lemma; state that lemma's hypotheses as "locally Euclidean Hausdorff m-dimensional" (or add a topological-manifold version beside the smooth one in 6.3), and get the cohomology bound from H^k(M;F_p)≅Hom(H_k(M;F_p),F_p) over the field. The attaching-cell contradiction of the section (dim H^(n+1)(K;F_p)≤1 against n+2) is correct and unchanged.

## R03 (P2) — three statable headline theorems are kept out of `Suggested.lean`

Location: `TauCetiRoadmap/AlgebraicTopology/ProductBallIntersectionTargets.lean` line 24 (`exists_common_image`), `KirbyHatcherApplicationsTargets.lean` line 17 (`elementaryAbelianPair_sphere_action_has_stabilizer`), `TransverseRepresentativeTargets.lean` line 32 (`exists_transverse_circle_classifying_map`); `Suggested.lean` changes only at lines 22 and 45.

Claim (PR description and README lines 1578, 2252, 2330): the companion files "record" or "pin" the new headline signatures.

Witness: all three statements elaborate against the pins with `lake env lean` (exit 0, one `sorry` warning each; the `#check @` of each on a scratch copy shows every binder present, including `[CompactSpace M]`, `[T2Space M]`, `[SecondCountableTopology M]`, `[I.Boundaryless]`). They are headline theorems of 6.5, 8.13 and 8.15 and are statable, so their absence from the acceptance test is a defect. The companion files also break the Lean form: `import Mathlib.<submodule>` lines (the rule the gate enforces on `Suggested.lean` applies to every listed `.lean` file), the KirbyHatcher file is outside the `TauCetiRoadmap.AlgebraicTopology` namespace, and the docstrings carry process wording ("representative and nonexhaustive", "future theorem target").

Repair: move the three statements into `Suggested.lean` (its existing `import Mathlib` and TauCeti imports suffice; `Circle`, `Metric.sphere`, `Metric.closedBall`, `EuclideanSpace`, `TopCat.singularCohomology` all exist at the pins), each with a docstring stating the mathematics, under Layer 6 and Layer 8 section comments; delete the three files and the three README links to them.

## R04 (P2) — the gate fails at this head

Location: `scratch/gate.md` for 1fc6a4c: `set_option=1 tex=1 sorry-data=69 residue=3 readme-ids-missing=2 depcheck=2 build=16 FAIL`.

Claim: the folder is submittable.

Witness: the dependency check on this head prints `UPWARD: AlgebraicTopology (on main) -> HomotopySpheres (#64) at README lines [2361, 2374, 2375, 2376]` and `CYCLE among: AlgebraicTopology, HilbertModules, HomotopySpheres, IndexTheory, OperatorKTheory, StringOrientation, TangentialBordism` (depcheck: 205 roadmaps, 1704 edges, 2 problems). Every one of these failures except the three residue anchors (R05) is inherited: the same check on main's README gives the same two lines at lines 2096, 2109–2111; `set_option maxHeartbeats 800000 in` at `Suggested.lean` line 911, the 69 `sorry` bodies of `def`s (lines 162–1056), the 16 non-`sorry` build warnings (`letI`/`haveI` lints, overlapping `[IsManifold I ∞ M]` instances at 488–497, unused `hx`/`y` at 646/740), the TeX fragment `C_c^{cell,n}` at README line 1176, and the undeclared own names `coordinateCubeReferenceChain_eq_shuffle` (line 378) and `isQuotientCoveringMap_iff_isCoveringMap_and` (line 877) are all byte-identical to main. HomotopySpheres is an open pull request, so a main roadmap citing it is upward by the standing rule.

Repair: a revision pull request must leave the folder passing the gate, so these need repair here or the pull request must be rebased onto a head that repairs them. As data: the parallel revision of this folder, pull request #1652, was reviewed as accepted at f285cc1 with a passing gate, zero `sorry` data and no HomotopySpheres citations; this pull request is based on main and will conflict with it in `Suggested.lean` and the README.

## R05 (P3) — process residue: three `<a id=…>` anchors

Location: `README.md` lines 2265, 2292, 2333.

Witness: gate rule "residue"; the gate at main reports 0 anchors, so these are new.

Repair: delete the three anchor lines; the headings carry their own slugs.

## R06 (P3) — none of the new targets has a locator

Location: `README.md` lines 1569–1620 (product-ball), 1757–1802 (counterexample), 2176–2253 (8.13), 2266–2348 (8.14–8.16). The References section (lines 2451–2472) is unchanged; the Kirby notes the pull-request description names are cited nowhere.

Witness: no "(Source, Thm, p.)" appears in any added paragraph. The statements are standard and Hatcher (cached as bebb3032, printed page = page marker − 9) supports them: 8.14 ¶1 is Exercise 13 of §4.2 (line 16895, p. 391, with the hint "pass to universal covers and use homology"), 8.14 ¶2 is Exercise 17 (line 16911, p. 391, based classes, X an (n−1)-connected CW complex, Y path-connected with π_i=0 for i>n), 8.14 ¶3 is Exercise 16 (line 16908, p. 391) with Proposition 3.29 (line 10370, p. 239), 8.15 ¶2 is Exercise 26 (line 16974, p. 391) and the RP² versus S²×RP∞ discussion (line 15164, p. 348), 8.15 ¶3 is Exercise 28 (line 16980, p. 391) with Proposition 2.29 (line 5873, p. 135), the n=1 case of 8.14 ¶2 is Proposition 1B.9 (line 3905, p. 90), the bound of R02 is Lemma 3.27 (line 10255, p. 236). The representability theorem of 8.13 is Thom's (R. Thom, Quelques propriétés globales des variétés différentiables, Comment. Math. Helv. 28 (1954), Chapter II); I did not open that text. The product-ball theorem and the T³→S² example have no locator I could find in the cached sources.

Repair: add these locators at the claims and add Thom 1954 (and, if used, the Kirby notes with a legal URL) to References.

## R07 (P3) — `HS3C` is an undefined abbreviation naming an open-pull-request roadmap

Location: `README.md` lines 2341 ("independently of HS3C") and 2348 ("does not change HS3C's EHP/Toda scope").

Witness: `HS3C` occurs nowhere else in the README and in no abbreviation key; it resolves only to HomotopySpheres §3C ("EHP, Hopf invariants and secondary composition", HomotopySpheres README line 939 at its open head), a roadmap not on main. The dependency check does not see it as a citation only because of the spelling.

Repair: delete both clauses; 8.16 consumes nothing from that section.

## R08 (P3) — unstated prerequisites in 8.13–8.15

Location: `README.md` line 2286–2289 ("ordinary top-homology vanishing on the cover, its 2-dimensional CW comparison"), line 2308 ("lifted finite-dimensional CW structure"), line 2190 ("AT8.7/GT's actual smooth triangulation of dimension m, keeping its dimension bound").

Witness: (a) the vanishing of H₂ of a connected noncompact surface is Hatcher Proposition 3.29, a separate statement from the compact-support lemma Stage 6.3 states at lines 1247–1251 (which gives H_i(U,U∖K)=0 for i>m and local injectivity, not H_m(U)=0); no target states it. (b) That a covering space of a CW complex carries a CW structure of the same dimension (used in 8.14 ¶3 and 8.15 ¶2) is stated by no target: the only README occurrences of covers together with CW structures are lines 4 and 2308. (c) Item 8.7 (lines 1911–1918) exports "countable locally finite CW type", not a CW structure of dimension m, so the dimension bound 8.13 relies on is not currently an output of 8.7. (d) "closed connected surface" in 8.14 ¶3 does not say smooth; the triangulation route needs smooth.

Repair: add the three statements as targets (noncompact top-homology vanishing in 6.3; lifted CW structures on covers of CW complexes in Stage 4 or 5; the dimension-m CW structure as an explicit export of 8.7) and write "smooth closed connected surface".

## R09 (P3) — typography and shape of the added text

Location: added lines throughout, e.g. 1571 ("dimension0"), 1589 ("coefficient1"), 2288 ("its2-dimensional"), 2290 ("on3-dimensional"), 2219–2220 ("count is1", "count is+1"), 2216 ("class−h"), 2270 ("for1≤i≤n"), "Stage2.5", "Stage6.3", "AT4.6"; ASCII `>=`/`<=` and `R^p`, `Z`, `F2` beside Unicode `π₁`, `≃`; sections 8.14–8.16 as `###` headings after the numbered items 1–13 of Stage 8.

Repair: restore the spaces, use one notation (the file's Unicode `ℤ`, `≥`, `ℝᵖ`), and number the three sections as items 14–16 of Stage 8 like 8.13.

## R10 (P3) — five backticked library names in the README do not exist at the pins (inherited)

Location: `README.md` lines 111 (`TauCeti.TopCat.serreFibrations`), 271 (`Units.continuousConstSMul_nonZero`), 911–913 (`mem_serreFibrations_of_exists_trivialization`, `mem_serreFibrations_proj`, `FiberBundle.hasHomotopyLiftingProperty_proj_cube`).

Witness: `grep -rn serreFibrations` over the pinned Tau Ceti (a91d3aa) and Mathlib (6b7abb3c) sources returns nothing; same for the other three names. These lines are identical on main.

Repair: replace each by the pinned declaration actually meant, or state the fact in prose.

## Verified sound

**Scope of the read.** Full diff of the pull request against `origin/main` (five files, 372 added lines, nothing outside the folder: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicTopology'` is empty), the whole README (2472 lines) for the cited stages 2.5, 4.6, 5.1, 6.3, 6.5, 8.5, 8.7–8.12, the three companion files, and `Suggested.lean`'s header and diff.

**Elaboration.** `lake env lean` from the pull-request worktree (Mathlib 6b7abb3c, Tau Ceti a91d3aa): `ProductBallIntersectionTargets.lean`, `KirbyHatcherApplicationsTargets.lean`, `TransverseRepresentativeTargets.lean` each exit 0 with exactly one `sorry` warning; `Suggested.lean` exits 0 with 215 `sorry` warnings and the 16 inherited lint warnings of R04. Scratch copies with `#check @` of the three new theorems printed their full types (R03); the `[CompactSpace M]`, `[T2Space M]`, `[SecondCountableTopology M]`, `[I.Boundaryless]`, `[IsManifold I ∞ M]` binders of the circle theorem all survive. One-tactic probe: `simp_all` closes none of the three (unsolved goals printed); the three are deep theorems (Brouwer-type intersection, transversality, Smith-type non-freeness), so no padding.

**Pinned declarations opened.** `TauCeti.map_fundamentalGroup_smul` (`TauCeti/Topology/Homotopy/HomotopyGroup/FundamentalGroupAction.lean` line 286: equivariance of `HomotopyGroup.map F` along `FundamentalGroup.map F`, as 8.5 uses it); `HomotopyGroup.prodMulEquiv` (`…/HomotopyGroup/Product.lean` line 196, needs `[Nonempty N]`, so degrees ≥ 1, as 8.5 uses it for k ≥ 2); `TauCeti.singularHomologyDiskBoundaryPairIso` (`TauCeti/AlgebraicTopology/Singular/DiskSphere.lean`); `IsCoveringMap.fundamentalGroupMulAction` (`Mathlib/Topology/Homotopy/Lifting.lean` line 436); `Circle` (`Mathlib/Analysis/Complex/Circle.lean` line 53); `TopCat.disk` (`Mathlib/Topology/Category/TopCat/Sphere.lean` line 28, the `ULift` of `Metric.closedBall 0 1` in `EuclideanSpace ℝ (Fin n)`, as the companion docstring says); `Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean` and the Tau Ceti module of the same path both exist (8.15 says "Tau Ceti's"; both are present). The `FundamentalGroupAction` object file is present in the worktree's packages directory, so the new import builds.

**Cross-roadmap citations resolved (all on main).** CharacteristicClasses C1 item 5 (README lines 511–536: finite models ET_N=(S^(2N+1))^m over BT_N=(CP^N)^m, so S³→CP¹ at m=N=1; h=−x with x pairing to −1 on complex-oriented CP¹, so ⟨h,[CP¹]⟩=+1 and O(−1)↦−h exactly as 8.13 states; w₁ = the generator a of H¹(RP∞;F₂)); CC C2.3–C2.4 (lines 657–672: transverse-section zero loci, embedding Gysin with transverse base change); CC consumes AT Stages 2–6, 8.1–8.7, 8.9, 8.10, 8.12 (lines 50–66), none of 8.13–8.16, so the new AT→CC edges create no layer cycle; ComplexKahlerGeometry K7.1 (lines 1405–1440, the `Projectivization ℂ (Fin (n+1) → ℂ)` atlas, compactness, the CP¹ ≃ OnePoint ℂ biholomorphism; K7's CW structure at line 1461); GeneralizedCohomology G2.10 (item 10 at line 533; `numerableFiberBundle_hurewicz` at line 651 is inside it); GeometricTopology smoothing-and-triangulation item 1 (lines 938–943); AT 4.6 (real projective atlas and antipodal comparison, lines 789–816), AT 2.5 (coordinate reference classes and `coordinateDiskNativeComparisonCoefficient`, lines 340–381), AT 6.3's determinant-sign theorem (lines 1264–1283), AT 5.1 integral Künneth (lines 856–867), AT 8.8's `[X,Bπ]_*≃Hom(π₁X,π)` (line 1950). HomotopySpheres §3C exists at the open head (line 939) but is not citable (R07).

**Ownership against open work.** `roadmaps grep` over main and the 440 open heads: the product-ball intersection, the RP²×S³ versus S²×RP³ example, the C_p×C_p non-freeness, the T³→S² composite and the low-codimension representative theorem are owned by no other roadmap; AlgebraicTopologyPartII (open head) consumes AT Stages 2–8 and owns none of them; PositiveMass (open head, line 678) is a future consumer of hypersurface representatives. No other `Suggested.lean` declares the three new names.

**Dependency check.** Output on this head:

```
UPWARD: AlgebraicTopology (on main) -> HomotopySpheres (#64) at README lines [2361, 2374, 2375, 2376]
CYCLE among: AlgebraicTopology, HilbertModules, HomotopySpheres, IndexTheory, OperatorKTheory, StringOrientation, TangentialBordism
depcheck: 205 roadmaps, 1704 edges, 2 problem(s)
```

Both lines reproduce verbatim on main's README (lines 2096, 2109–2111); the pull request adds no new supplier edge that the check flags, and its new edges to CharacteristicClasses, ComplexKahlerGeometry, GeneralizedCohomology, GeometricTopology and DifferentialGeometry all point at roadmaps on main.

**Seeded sample.** The three sampled targets 8.14, 8.15, 8.16 carry no locator (R06). I checked them against Hatcher (bebb3032) where the statements occur: 8.14 ¶1 = Exercise 13 §4.2 line 16895 (hypotheses match: connected n-dimensional CW complexes, isomorphisms on π_i for i ≤ n); 8.14 ¶2 = Exercise 17 line 16911 (based classes, (n−1)-connected CW source, path-connected target with π_i=0 for i>n; the README's "natural in both variables" and the n=1 group-homomorphism reading are consistent with Proposition 1B.9 line 3905); 8.14 ¶3 = Exercise 16 line 16908; 8.15 ¶2 = Exercise 26 line 16974 (connected finite-dimensional CW complex, elements of finite order); 8.15 ¶3 = Exercise 28 line 16980 (the attaching-cell argument, "Z_p or 0 for H_(n+1)", n=1 separately, as the README has it); 8.16 has no Hatcher counterpart (Example 4.51 line 16494 gives only the Hopf bundle sequence).

**Adversarial table** (values computed on both sides).

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| 6.5 product-ball, fixed boundary | p=q=0 | Ball 0 = {0}; both images are the single point (0,0) | holds; no change |
| same | p=0, q=1 | f(pt)=(pt,z); g restricted to S⁰ is the identity on {±1}; g₂:[−1,1]→[−1,1] with g₂(±1)=±1 hits z by the intermediate value theorem | holds |
| 6.5 boundary-degree form, negative control | p,q ≥ 1, f≡(a,0), g≡(0,b), ‖a‖=‖b‖=1 | images {(a,0)} and {(0,b)} disjoint; f₁ constant factors through a point pair so d_f=0, likewise d_g=0 | README's own counterexample verified; the hypothesis d_f·d_g≠0 is needed |
| 6.5 homotopy H_t stays in the punctured target on B | x∈S_p, any y, t∈(0,1] | ‖x−(1−t)g₁(y)‖ ≥ 1−(1−t)=t; on D_p×S_q ‖(1−t)f₂(x)−y‖ ≥ t; t=0 is F, nonvanishing on B by case split | holds |
| 6.5 sign (−1)^q | (p,q)=(1,1),(2,0),(0,1) | det diag(I_p,−I_q) = −1, +1, −1; coefficient of H₁=(f₁,−g₂) is d_f·(−1)^q·d_g; fixed boundary gives d_f=d_g=1 | holds |
| 6.5 disjoint images ⇒ zero relative class | any p,q | F misses 0 on all of D_p×D_q, so F factors through (ℝ^(p+q)∖0, ℝ^(p+q)∖0), whose relative homology is 0 | holds |
| 8.5 H₂(RP²×S³;ℤ)=0 | Künneth | ⊕_{i+j=2} H_i(RP²)⊗H_j(S³): 0⊗ℤ, ℤ/2⊗0, ℤ⊗0 = 0; Tor_{i+j=1}: Tor(ℤ/2,ℤ)=0, Tor(ℤ,0)=0 | holds |
| 8.5 H₂(S²×RP³;ℤ)=ℤ | Künneth | ℤ⊗ℤ ⊕ 0⊗ℤ/2 ⊕ ℤ⊗0 = ℤ; Tor_{i+j=1}: Tor(0,ℤ)=0, Tor(ℤ,ℤ/2)=0 | holds |
| 8.5 π₁-action on π₂ | X, Y | X: deck = (antipodal, id) on S²×S³; antipodal on S² is −I on ℝ³, degree (−1)³=−1 (Stage 6.3 determinant sign); Y: deck = (id, antipodal on S³), π₂(S²×S³)=π₂(S²) fixed, action +1 | holds |
| 8.5 no map induces isomorphisms on π₁ and π₂ | both directions | equivariance φ(g·a)=φ(g)·φ(a) with φ(g) the nonzero element of ℤ/2: X→Y gives φ(−a)=φ(a), so 2φ(a)=0, φ=0 on ℤ; Y→X gives φ(a)=−φ(a), same | holds |
| 8.5 all abstract homotopy groups agree | k=0,1,≥2 | π₀ trivial both; π₁ = ℤ/2 both; π_k = π_k(S²)×π_k(S³) both via the common cover; `prodMulEquiv` needs k ≥ 1 | holds |
| 8.14 ¶1 route | n-connected pair (M_f̃, X̃) | H_i(M,X̃)=0 for i ≤ n by Thm 4.37; H_(n+1)(M,X̃)≅π_(n+1)(M,X̃); π_(n+1)(M)→π_(n+1)(M,X̃) is onto because π_n(X̃)→π_n(Ỹ) is injective; by Hurewicz naturality it factors through H_(n+1)(Ỹ)=0, so H_(n+1)(M,X̃)=0; degrees ≥ n+2 vanish by the long exact sequence | the written route closes (my first reading suspected a gap at degree n; the naturality step above repairs it, no change needed) |
| 8.14 ¶1 dimension bound needed | X=S², Y=S²×S³, inclusion | iso on π_i for i ≤ 2, dim Y = 5 > 2, not a homotopy equivalence (H₃ differs) | hypothesis necessary |
| 8.14 ¶1 n=0 | discrete connected | both single points; f a homeomorphism | holds |
| 8.14 ¶2 bijection | X=Sⁿ; X=S¹∨S¹, Y=K(G,1); X=S², Y=RP∞×CP∞ | π_n(Y)=Hom(ℤ,π_nY); G²=Hom(F₂,G); ℤ=Hom(ℤ,ℤ) with π₁(Y)=ℤ/2 ≠ 0, so the "no lower homotopy" disclaimer is right | holds |
| 8.14 ¶3 | torus, Klein bottle; S², RP² | universal cover ℝ² contractible; S², RP² have finite π₁ and cover S², excluded by the hypothesis | holds; hypothesis sharp |
| 8.15 ¶1 | d=0,1,2 | dim H^d(BC_p;F_p)=1; Künneth gives 1,2,3 = d+1 | holds |
| 8.15 ¶2 | X=S¹; X=RP² | G=ℤ torsion-free: ℝ×S¹ ≃ S¹, consistent; RP² vs S²×RP∞: retracts onto RP∞, nonzero F₂-cohomology in all degrees against dimension 2 | holds; torsion hypothesis necessary |
| 8.15 ¶3 | n=0; n=1; n>1; negative control | p² ≥ 4 > 2 points, pigeonhole; deck group of a connected cover of S¹ is a quotient of ℤ, cyclic; dim H^(n+1)(K;F_p) ≤ 1 < n+2; C_p acts freely on S^(2k−1), so the C_p×C_p hypothesis is needed | holds (route defect R02 only) |
| 8.16 | f = p∘q | π_k(T³)=0 for k ≥ 2 and π₁(S²)=0, so π_k(f)=0 for k>0; H̃_k(S²)≠0 only for k=2 and H₂(f) factors through H₂(S³)=0; a nullhomotopy lifts through the Hopf bundle from q to a map into a fibre S¹, whose H₃ is 0, against deg q = 1 | holds; with q constant the composite is nullhomotopic, so the degree hypothesis is needed |
| 8.13 bordism sign | c=1,2 | (n,∂_t,τ) = (−1)^c (∂_t,n,τ); with the (−1)^c correction the outward-normal-first boundary is +N₁ at t=1 and −N₀ at t=0 | holds |
| 8.13 skeleton bounds | m-dimensional source | m-skeleton of RP∞ is RP^m (N ≥ m), of CP∞ is CP^⌊m/2⌋ (2N ≥ m); homotopies live on dimension m+1 (N' ≥ m+1, 2N' ≥ m+1) | holds |
| 8.13 torsion | H_(m−1)(M;ℤ) vs H_(m−2)(M;ℤ) | PD gives H¹(M;ℤ), torsion-free by UCT; H²(RP³;ℤ)=ℤ/2 = H₁(RP³;ℤ), so torsion occurs only in the codimension-two case; "retain torsion classes" is harmless | holds |
| 8.13 projective classes | CC C1.5 convention | x pairs to −1 on CP¹ and h=−x, so ⟨h,[CP¹]⟩=+1; O(−1) has class x=−h; hyperplane zero locus of the coordinate functional is {v₀=0}; normal bundle O(1) restricted | consistent with the supplier |
| `exists_common_image` (Lean) | p=q=0; p=0,q=1 | as rows 1–2, on `Metric.closedBall 0 1` in `EuclideanSpace ℝ (Fin 0)` = {0} | holds |
| `elementaryAbelianPair_sphere_action_has_stabilizer` (Lean) | p=2,n=0; trivial action | orbit sizes divide 4 and are ≤ 2, so a stabilizer of order ≥ 2 exists; the trivial action satisfies the conclusion | holds; the plausible wrong model (trivial action) is not excluded and need not be |
| `exists_transverse_circle_classifying_map` (Lean) | M=∅; M=point; M=S¹, a=generator; b=±generator | vacuous; a=0 and f≡−1 is transverse vacuously; f=id has surjective `mfderiv`; both signs of b admissible, README fixes one | holds; hypotheses match the README's compact boundaryless M |

**Declared gaps.** None (no readable `design/plan.json`; a revision of a main roadmap declares none).

## Not verifiable

- The Kirby lecture notes the pull-request description names (HW1, HW14, p. 61) are cited nowhere in the README and I found no legal copy (the Berkeley Math 215B course page lists Hatcher and Milnor–Stasheff as texts and carries no notes). The statements were checked against Hatcher instead.
- Thom 1954 (representability of low-codimension classes) was not opened; the statement of 8.13 was checked by the Poincaré-duality/classifying-map route itself.

## Source issues

- none
