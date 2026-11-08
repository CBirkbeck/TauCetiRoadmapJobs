# Review of ConvexityToric (pull request #1651 at 8882c6f)
Folder: `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/`

**Verdict:** needs changes

Incremental re-review of 0 changed lines since bd2dba9. The head is the merge of main into the branch: the folder's two files are byte-identical to the previous head, and the merge moved the pull request's `lake-manifest.json` from Mathlib `6b7abb3c` / Tau Ceti `a91d3aa` to Mathlib `f6090c70` / Tau Ceti `358314d4`. At the new pins the worker's gate fails its build step on Lake's module-system warning (R01, the only blocking finding); the sibling anchor of the previous review is repaired by the merge, and the previous R02 (the kernel clause of the rank-one contract) is unchanged and carried as R02. The dependency check, the elaboration, the one-tactic probe and every cross-roadmap citation were rerun at this head; the adversarial table carries the previous report's rows (nothing in the folder changed) and adds the row for the moved pins.

## R01 (P2) — `Suggested.lean` needs the module-system header at the merged pins

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/Suggested.lean:1–3` ("import Mathlib / import TauCeti.Geometry.Symplectic.Manifold.TwoForm / import TauCeti.Geometry.Toric.Algebraic.Lattice").

**Claim:** Since the merge the pull request pins Mathlib `f6090c70` and Tau Ceti `358314d4`, both Lean module-system packages. A file that imports them with a plain `import` builds, but Lake warns that `Mathlib` is designed for the module system, and the gate's build step counts that warning as a failure, so the gate fails (`build=1 FAIL`) and the folder cannot be accepted while it does.

**Witness:** The worker's gate at this head (`gate.md`): every content counter 0, `build=1 FAIL`, the one line "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`". My rerun of the targeted build `lake build TauCetiRoadmap.SymplecticGeometry.ConvexityToric.Suggested` replays the same warning before "Build completed successfully (8966 jobs)". Plain `lake env lean` on the file is clean (six `sorry` warnings), because the warning is Lake's, not the elaborator's.

**Exact repair:** Replace the three import lines by

```lean
module

public import Mathlib
public import TauCeti.Geometry.Symplectic.Manifold.TwoForm
public import TauCeti.Geometry.Toric.Algebraic.Lattice
```

keep the module docstring, and insert the line `public section` between the docstring and `noncomputable section` (`public section` needs no `end`). Tested on a scratch copy with exactly this header: it elaborates at the pins with the same six `sorry` warnings and nothing else, writes a 489 KB olean, and a scratch importer `#check`s all twelve declarations (`torus_convexity`, `schur_horn`, `BottSamelson.incidence_moment_range`, `BottSamelson.fixedMoment_convexHull`, `toric_fibers`, `toricImage_delzant`, `HamiltonianTorusData`, `BottSamelson.projectorDiagonal`, `BottSamelson.initialPlane`, `BottSamelson.fixedMoment`, `IntegralFacetPresentation.IsSmoothVertex`, `IntegralFacetPresentation.IsDelzant`) with their full types and no error. Without `public section`, `module` alone makes every declaration private and an importer reports them as unknown identifiers, so both lines are needed. The gate's import scanner admits `public import`.

## R02 (P3) — The kernel clause of the rank-one contract is not something LieGroups states

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:81–83` ("a smooth homomorphism φ_α:SU(2)→G with dφ_α(diag(i,−i))=α∨, ker(φ_α)⊆{I,−I} and φ_α(diag(e^(it),e^(−it)))=exp_G(tα∨)") and `:125` (the same clause in §1.1), with "Layer 1 constructs none of these" at `:85`. Unchanged since the previous review.

**Claim:** LieGroups' Layer 6 states the derivative, torus and normalizer equations of φ_α but never the kernel. The clause is therefore neither supplied nor owned.

**Witness:** `RepresentationTheory/LieGroups/README.md` on main (a0ad405e), Layer 6 (`:383`, "maximal tori, the Weyl group, and Weyl integration") has no root characters, coroots or SU(2) maps; its last change is the roadmap's original commit. At the open head of its revision (`:751`, "Rank-one representatives") the map is built with "the derivative and torus/normalizer equations", and the only kernel in that layer is ker α (`:752`). The consumers on main (`SymplecticGeometry/HamiltonianReduction/README.md:145–147`, `SchubertGeometry/README.md:44`) cite only the characters, coroots, reflections and representatives.

**Exact repair:** Either delete "ker(φ_α)⊆{I,−I}" from the contract at `:82` and from `:125` (nothing in Layers 1–5 uses it: the SU(2)→SO(3) Check at `:161–162` and the "retain any order-two kernel" bullet at `:150` are consumer-side observations), or keep it and own it in §1.1 with its one-line proof, which is this roadmap's own work: dφ_α is a Lie algebra map out of the simple algebra su(2) with dφ_α(H)=α∨≠0, hence injective, so ker(φ_α) is a closed normal subgroup of SU(2) with trivial Lie algebra, hence discrete and normal in a connected group, hence central, hence inside {I,−I}. Tested on the two Checks: for φ=id the kernel is {I}; for SU(2)→SO(3) it is {I,−I}; both satisfy the clause and neither needs more than the centre of SU(2).

## Previous findings

- R01 (P3, sibling anchor) — repaired: `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md:16` now reads "[ConvexityToric Layer 1 (1.1)](../ConvexityToric/README.md#layer-1-compact-symplectic-actions-and-local-models)", the anchor of this README's `## Layer 1: Compact symplectic actions and local models` (`README.md:118`).
- R02 (P3, kernel clause) — not repaired: `README.md:82` and `:125` still read "ker(φ_α)⊆{I,−I}"; carried as R02 above.

No repair report exists on the board for this folder (the package directory holds the eleven review reports only), so no finding is marked not actionable and no `Re-raised` line applies.

## Verified sound

**Scope.** Head 8882c6fd7b2163a5ed4e5e8cf94ba791f239417a, the merge of main (a0ad405e) into the branch. `changes.md`: 0 insertions, 0 deletions in the folder; the files changed outside it are main's own changes carried in by the merge (the Completed archive, many roadmap folders, `lake-manifest.json`) plus the sibling `IntegrableSystems` folder, which the brief names as the pull request's own. The brief's excluding diff (`git diff --stat origin/main...HEAD` minus this folder, the two sibling folders and the family files) is empty. The worktree's `lake-manifest.json` records Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a` and Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`, and `.lake/packages` resolves to the Lake directory whose `mathlib` and `TauCeti` checkouts are at exactly those revisions.

**Gate.** The worker's gate at this head: every content counter 0, `build=1 FAIL` on the Lake warning (R01). My run of the brief's gate command (which stops before its build step) gives every content counter 0 and `outside-folder=4` for the four sibling-folder files the brief names as the pull request's own (a scope false positive, as in the previous rounds):

```text
gate ConvexityToric: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=4 source-material=0 FAIL
  outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md
  outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/Suggested.lean
  outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md
  outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/Suggested.lean
```

**Dependency check** (the brief's command, `--movable`):

```text
depcheck: 236 roadmaps, 2082 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The family order (CotangentLagrangian → HamiltonianReduction → ConvexityToric → IntegrableSystems, `SymplecticGeometry/README.md:80`) is respected: this folder cites only HamiltonianReduction among its siblings, and IntegrableSystems cites it downstream.

**Elaboration at the new pins.** `lake env lean` on `Suggested.lean` exits 0 in 3.7 s with exactly six `sorry` warnings (declarations at lines 68, 82, 112, 120, 140, 190) and nothing else. The worker's targeted build produced the 641 KB olean. One-tactic probe (`first | rfl | simp | infer_instance | decide | aesop | exact fun _ => rfl` at each of the six proof sites, scratch copy, elaborated at the new pins): all six fail (unsolved goals at the sites of `torus_convexity`, `schur_horn`, `incidence_moment_range`, `toric_fibers`, `toricImage_delzant`, a type mismatch at `fixedMoment_convexHull`). No padding: the eleven definitions (`HamiltonianTorusData`, `V3`, `projectorDiagonal`, `moment`, `initialPlane`, `fixedMoment`, `IntegralFacetPresentation`, `pairing`, `region`, `IsSmoothVertex`, `IsDelzant`) have real bodies on native carriers and exist only to make the six headlines statable.

**Signatures.** The worker's `signatures.md` (elaborated `#check @name` of all 17 declarations, 0 with a dropped section binder) is unchanged because the file is unchanged; the scratch importer of the repaired header printed the same types. `torus_convexity` and `toric_fibers` carry `FiniteDimensional ℝ E/EG`, `IsManifold I ∞ M`, `I.Boundaryless`, `T2Space M`, `SecondCountableTopology M`, `CompactSpace M`, `ConnectedSpace M`, `LieGroup IT ∞ T`, `T2Space T`, `CompactSpace T`, `ConnectedSpace T` and `σ.IsSymplectic`, as `README.md:40–47, 175` require; `toric_fibers` adds effectivity (`∀ g, (∀ x, g • x = x) → g = 1`) and the half-dimension equation; `toricImage_delzant` carries the exponential with identity derivative and the 2π period law of `README.md:783–787`. The seven resolver leads (`citations.md`) are this file's own declarations, all twelve of which the importer resolved.

**Headlines.** Unchanged: torus convexity with connected fibers (§3.1, `torus_convexity`), two-sided Schur–Horn (§3.2, `schur_horn`), the word121 incidence image and its polygon (§3.3, `BottSamelson.incidence_moment_range`, `BottSamelson.fixedMoment_convexHull`), toric fibers and the Delzant property of the image (§5.1, `toric_fibers`, `toricImage_delzant`). Named in the docstring as not statable (`Suggested.lean:14–31`): the period/root comparison, local normal forms, the fixed-locus theorem, equivariant perfection, Kirwan and Kostant convexity, the norm-square deformation, Duistermaat–Heckman and class variation, Delzant reconstruction/uniqueness and labeled classification. Re-searched at the new pins: Tau Ceti `358314d4` adds `TauCeti/LinearAlgebra/RootSystem/Weyl/Chamber.lean` (`weylChamber`, `openWeylChamber` at `:107, 111`: the abstract chambers of a root pairing, the object RootSystems Layer 4 supplies), but neither library has a compact coadjoint orbit with its Kirillov–Kostant–Souriau form, a symplectic cross-section, a Liouville measure, a reduced space or an orbifold carrier (grep for `coadjoint`, `Liouville`, `orbifold`, `symplecticReduction`/`reducedSpace`, `Delzant`: no geometric hit), so the docstring's list stands.

**Pinned declarations named in the supplier contracts**, re-opened at the new pins: `Matrix.unitaryGroup` (`Mathlib/LinearAlgebra/UnitaryGroup.lean:58`), `Submodule.starProjection` (`Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean:131`), `Set.extremePoints` (`Mathlib/Analysis/Convex/Extreme.lean:70`), `Representation.invariants` (`Mathlib/RepresentationTheory/Invariants.lean:73`), `IsZLattice` (`Mathlib/Algebra/Module/ZLattice/Basic.lean:433`), `Basis.addHaar` (`Mathlib/MeasureTheory/Measure/Haar/OfBasis.lean:254`); `TauCeti.SmoothTwoForm` (`TauCeti/Geometry/Manifold/TwoForm/Basic.lean:61`), `TauCeti.SmoothTwoForm.IsSymplectic` (`TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:92`), `TauCeti.Toric.IsIntegralLattice` (`TauCeti/Geometry/Toric/Algebraic/Lattice.lean:90`, moved from `:87`; fields `free`, `finite`, `isBaseChange`, so "finite freeness and real scalar extension" at `README.md:64` is exactly what it says), `TauCeti.RiemannianIsometry.riemannianExp_mfderiv` (`TauCeti/Geometry/Manifold/Riemannian/Isometry/Exponential.lean:117–118`: hypotheses `I.Boundaryless`, `J.Boundaryless`, `T2Space M`, `T2Space N`, no completeness, matching `README.md:65–69`).

**Cross-roadmap citations re-resolved this round on main (a0ad405e) and at the open heads** (the merge changed several supplier READMEs, so each was re-read): HamiltonianReduction R1 (`:33`), R2 (`:127`, with `g*/G ≃ z(g)*×t*_(ss,+)` at `:147`), R2a (`:157`), R3 (`:187`), R3.1 (`:262`); SmoothBundlesConnections B2.4 (`:776`, the Liouville measure of a symplectic form at `:781`), B6.2 (`:1668`), B6.3 (`:1716`); Orbifolds O1–O4 (`:87, 154, 246, 296`), O4-T (`:419`) and the ConvexityToric T4 consumer line (`:83`); MorseTheory M1–M5 (`:90, 124, 430, 458, 611`); CharacteristicClasses C1–C3 (`:211, 550, 720`); AlgebraicTopology Stage 6 (`:946`); DifferentialGeometry Layers 0–1 (`:268, 311`), 5.5 (`:528`, densities and Stokes with corners), Layer 6 (`:782`), 10.2 (`:884`); HeegaardFloer §4.1 (`:2081`, Darboux at `:2083–2086`); HopfRinow Layers 1 and 4 (`Completed/HopfRinow/README.md:264, 495`); GeometricTopology Layer 1 (`:177`, tubular neighbourhoods at `:218`); SchubertGeometry S2 (`:38`), S9 (`:107`) and the word121 bullet (`:140`); ComplexKahlerGeometry K7.2 (`:1445`, normalized Fubini–Study form); AnalyticToricGeometry Layer 0 (`Completed/AnalyticToricGeometry/README.md:186`, `IsIntegralLattice` at `:197`); Majorization Part A (`OperatorTheory/Majorization/README.md:13, 79`, forward Schur–Horn only); RootSystems Layer 4 (`RepresentationTheory/RootSystems/README.md:296`); LieGroups Layer 1 (`:261`) and Layer 6 (`:383`, see R02); LieGroups' open revision `:750–752`; the family index (`SymplecticGeometry/README.md:66, 80`). The LieGroups revision has not merged: on main Layer 6 is still tori, the Weyl group and Weyl integration, so the rank-one adapter citation remains a citation of a section in a revision pull request, the same state as the two consumers on main (not a finding under the brief's contract paragraph; stated for the human approver as in the previous report).

**Sources, seeded sample.** No passage of the README changed, so no locator was re-read this round; the previous report's re-reading of every sampled target (1.1 conrad Appendix Q and Proposition R.2.1; 1.2 cannas Homework 21 and Proposition 12.6, hnp Lemmas 2.1–2.2; 2.1 cannas Homework 21 exercises 3–5; 3.1 cannas Theorem 27.1, hnp Theorems 3.10 and 4.1, lmtw Theorem 1.1, lerman Theorem 1.1; 3.2 cannas Theorem 27.1 and Majorization; 3.3 escobar §§3.2 and 4.1; 4.1 cannas Definitions 30.1–30.2 and Theorem 30.3, moerdijk §§4–5, vdb-moerdijk §2; 4.2 cannas Proposition 30.7, Theorem 30.8 and §30.3; 5.1 cannas Definition 28.1, Theorem 28.2 and §29.1, delzant Théorème 2.1; 5.2 lerman-tolman Definitions 1.2–1.4 and Theorem 1.5) stands with its page rules. The README flags no locator as unverified.

**Adversarial table.** Rows 1–30 are carried from the previous report (PRREVIEW-ConvexityToric~11), whose statements this head leaves untouched; row 31 is new for the moved pins. `✓` means both sides agree.

| Statement | Instances tried | Values on both sides | Result |
| --- | --- | --- | --- |
| 1 §1.1 period at t=2π (r11 row 1) | SU(2), H=diag(i,−i) | diag(e^(2πi),e^(−2πi))=I, φ(I)=1, so exp_G(2πα∨)=1; at t=π: diag(−1,−1)=−I, exp(πH)=−I, so H/2 is excluded | ✓ |
| 2 §1.1 metric independence of α∨ (r11 row 2) | ⟨H,H⟩=c for c=1,2 | α(H)=2, α♯=(2/c)H, ‖α‖²=4/c, α∨=2α♯/‖α‖²=H for both c | ✓ |
| 3 §1.1 reflection on weights (r11 row 3) | SU(2) fundamental weight λ(H)=1 | λ(α∨)=1, λ−1·α has value 1−2=−1∈ℤ; on cocharacters X=H: H−α(H)α∨=H−2H=−H∈Λ_Z | ✓ |
| 4 §1.1 root-line conjugation (r11 row 4) | D=diag(e^(it),e^(−it)) | DE₁₂D⁻¹=e^(2it)E₁₂, d/dt at 0 gives [H,E₁₂]=2iE₁₂, so dχ_α(H)=2i=iα(H) | ✓ |
| 5 §1.1 SU(2)→SO(3), U(2), rank 0 (r11 row 5) | Ad(exp tH) on A=((0,1),(−1,0)); (1,1),(1,−1); trivial torus | rotation by 2t so H↦2Z, kernel {±I}; det=−2, index 2, (1,0)=½(1,1)+½(1,−1) not integral; Λ_Z={0}, no roots, no division | ✓ |
| 6 §1.1 kernel clause (r11 row 6) | φ=id; SU(2)→SO(3) | kernels {I} and {I,−I}; neither is stated by LieGroups on main or at its head | R02 |
| 7 HamiltonianTorusData sign (r11 row 7) | ℂ, dx∧dy, positive rotation at (x,y) | field (−y,x), contraction −y dy−x dx=d(−(x²+y²)/2); +(x²+y²)/2 gives the opposite sign | ✓ |
| 8 §1.2 shear / polar J (r11 row 8) | S=((1,1),(0,1)); Euclidean g, ω=dq∧dp | Sⁿe₂=(n,1), norm² n²+1 unbounded, no invariant positive metric; A(q,p)=(−p,q), A²=−1, J=A, ω(e₁,Je₁)=1, −J gives −1 | ✓ |
| 9 §1.2 irrational rotation (r11 row 9) | e^(iθ) on first ℂ factor, θ/2π∉ℚ | fixed set {0}×ℂ, tangent dimension 2; trivial K gives M | ✓ |
| 10 §2.1 Euler sign, closure (r11 row 10) | weight-2 line; irrational ξ in T² | Euler class 2u=−2h (CharacteristicClasses `u_i=−h_i`); closure of exp(ℝξ) is T, critical set M^T; ξ=0 gives all of M | ✓ |
| 11 §3.1 `torus_convexity` degenerate and sphere (r11 row 11) | point with trivial torus; S² height, c=0,±1,2 | {0}=hull{0}, fiber a point; image [−1,1]=hull{±1}; fibers circle, point, ∅ (preconnected) | ✓ |
| 12 §3.1 rationality at a vertex (r11 row 12) | CP² standard T², m=[1:0:0], μ=μ(p)−½Σα_i|z_i|² | t₀=t, t₀^⊥=0, slice weights (1,0),(0,1), local cone μ(m)−cone{(1,0),(0,1)}: the negative quadrant at the vertex of the simplex | ✓ |
| 13 §3.1 rationality at an edge point (r11 row 13) | CP², m with z₁=0, z₂z₃≠0 | stabilizer the circle (e^(iθ),1), t₀=ℝ(1,0), t₀^⊥={(0,y)} the edge line, slice weight (1,0), cone a half-plane bounded by the edge: rational | ✓ |
| 14 §3.1 nonabelian (r11 row 14) | SU(2) orbit sphere radius r | full image not convex (0 missing); chamber image {r}; cross-section a single point, cone 0; torus projection [−r,r] | ✓ |
| 15 §3.1 gradient inequality (r11 row 15) | p=x⁴ | ‖∇p‖=4|x|³=4p^(3/4), θ=3/4, tail bound ∫=|x₀|; at x₀=0 both 0 | ✓ |
| 16 §3.2 `schur_horn` n=2 (r11 row 16) | spectrum (2,0), U=((√t,√(1−t)),(−√(1−t),√t)) | diagonal (2t,2−2t); t=0,½,1 give (0,2),(1,1),(2,0) = hull of (2,0),(0,2) | ✓ |
| 17 §3.2 repeated/empty (r11 row 17) | (1,1); n=0 | UIU*=I so {(1,1)}; both sides {()} | ✓ |
| 18 §3.3 projector diagonals (r11 row 18) | 0, V3, initial plane, span(e₁+e₂) | (0,0,0),(1,1,1),(1,1,0),(½,½,0); traces 0,3,2,1 | ✓ |
| 19 §3.3 fixed rows at (1,1,1) (r11 row 19) | eight rows | (3,1,0),(2,2,0),(3,0,1),(2,0,2),(2,2,0),(1,3,0),(0,3,1),(0,2,2): 7 distinct values; rows 2,5 coincide | ✓ |
| 20 §3.3 `fixedMoment_convexHull` corners (r11 row 20) | plane x+y+z=4, 0≤x,y≤3, 0≤z≤2 | pairwise active pairs give (3,1,0),(3,0,1),(2,0,2),(0,2,2),(0,3,1),(1,3,0) = rows 1,3,4,8,7,6; (0,1,3) excluded by z≤2, (4,0,0) by x≤3 | ✓ |
| 21 §3.3 edge coefficients (r11 row 21) | (a,b,c)=(1,1,1) and (2,1,1) | (2,2,0)=½(3,1,0)+½(1,3,0), c/D=½; (3,2,0)=(1−⅓)(4,1,0)+⅓(1,4,0), c/D=⅓; (2,3,0) at ⅔=a/D | ✓ |
| 22 §3.3 KKS/FS sign (r11 row 22) | line (1,w), w=0.1 | μ₁=1/(1+|w|²)=0.990099, quadratic term −|w|²; σ(∂x,∂y)=−2, FS area-1 value 1/π, ratio −2π | ✓ |
| 23 §4.1 Liouville / DH (r11 row 23) | dx∧dy, 2dx∧dy on unit square; S² height; trivial circle | masses 1, 2; 4π on [−1,1], density 2π; Dirac 4π | ✓ |
| 24 §4.1 level bundle / O4 label (r11 row 24) | arrow h, right k | (ht)⁻¹(hx)=t⁻¹x; (tk)⁻¹x=k⁻¹(t⁻¹x); "O4, item 1" is `Orbifolds/README.md:298` | ✓ |
| 25 §4.2 variation / Hopf (r11 row 25) | Cannas period-1 circle, c=[−β]; ℂ² reversed diagonal | transported to +2π(c−c₀)c₁(P)_ℝ; area 2πc, dA/dc=2π, c₁=+1 | ✓ |
| 26 §5.1 `toric_fibers` / complexity one (r11 row 26) | point; S² circle; word121 at (1,1,1) | both directions trivially true on a point; endpoints fixed, interior fibers free circles; (2,2,0) fixed and not a vertex | ✓ |
| 27 §5.1 presentations (r11 row 27) | normals +1,−1, supports 0,−1; translate by 2; +2,−2 supports 0,−2; x≥0 alone; rank 0 | [0,1]; [2,3]; same region, 2 not a ℤ-basis; not compact; empty presentation Delzant | ✓ |
| 28 §5.1 `toricImage_delzant` degenerate (r11 row 28) | N=0, rank 0, d=0 | exp(2π·0)=1 ↔ 0∈range true; region the point, IsDelzant vacuous with `Fin 0` basis | ✓ |
| 29 §5.2 periods / area / residual action (r11 row 29) | (a,b)=(2,3), ε=½; first chart k=1 | axial periods π, 2π/3, generic 2π; area 2πε/6=πε/3=π/6; w↦e^(−2πi·3/2)w=−w, half disk | ✓ |
| 30 Lean context (r11 row 30) | all 17 `#check` types | compactness, connectedness, finite dimension, boundaryless, T2, second countable, Lie group, effectivity, half dimension present as in the README | ✓ |
| 31 Lean context at the moved pins (new) | elaboration, probe, importer at Mathlib `f6090c70` / Tau Ceti `358314d4` | 6 `sorry` warnings and 0 errors; 6 of 6 probe sites fail; 12 of 12 declarations resolve from an importer under the R01 header, 0 under `module` without `public section`; `IsIntegralLattice` fields unchanged at `Lattice.lean:90`; `riemannianExp_mfderiv` hypotheses unchanged at `Exponential.lean:117–118` | R01 only |

**Ownership and duplication.** Nothing in the folder changed, so the previous rounds' searches stand: Delzant polytope, Schur–Horn and Duistermaat–Heckman over main and the open heads hit only main, this pull request, GeometricQuantization (a consumer of T1/T3/T4, with its §3.1a duplicate of the rank-one adapter noted in the previous report as GeometricQuantization's to remove), the family-index copy in another family pull request and Majorization (forward inequality only). The eight declaration names of `Suggested.lean` occur only in this pull request and in main's own `ConvexityToric/Suggested.lean`. The new Weyl-chamber file at the Tau Ceti pin is RootSystems' object, cited here through RootSystems Layer 4, not restated. Ownership against open pull requests was checked through the supplied checkouts.

## Not verifiable

- Kirwan, *Cohomology of quotients in symplectic and algebraic geometry* (1984), Part I §§4–5, pp. 44–78 (`README.md:326–327`): no legal copy found by the sources service in earlier rounds; cited by locator, unchanged.
- Atiyah 1982, Guillemin–Sternberg 1982, Kirwan 1984 (Invent. Math. 77) and Duistermaat–Heckman 1982 (References only): paywalled; their statements were checked in Cannas da Silva §§27 and 30 and in LMTW/Lerman in the previous rounds.
- Condevaux–Dazord–Molino (named at `README.md:365`) has no locator and was not sought; HNP Theorems 3.10 and 4.1 cover the route.
- Elaboration and the computed instances do not prove the six admitted headlines.

## Source issues

- none (no locator was re-read this round; the previous report's seven errata stand and were collected then).
