# Review of ConvexityToric (pull request #1651 at d9c6241)
Folder: `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/`

**Verdict:** needs changes

## R01 (P2) — Give the compact rank-one construction one owner

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:119–140`: “construct the normalized compact rank-one comparison on its actual Lie algebra”; ownership is also asserted at lines 24–25.

**Claim:** This construction still has two owners. Adding the correct adjoint supplier does not resolve the duplicate compact-real construction.

**Witness:** `TauCetiRoadmap/GeometricQuantization/README.md:519–545`, §3.1a at its supplied open head, also constructs the invariant metric, compact root planes, calibrated su(2) map, integrated SU(2) homomorphism, central kernel, reflection and conjugation laws.

**Exact repair:** Remove the duplicate construction here and coordinate one common earlier owner. For example, register a precise `normalized-compact-rank-one` supplier gap for LieGroups Layer 6 in the design's gaps and the matching README supplier subsection; both consumers use that contract. Keep this folder's period/weight and lattice applications. Do not import GeometricQuantization: its §§6.3–6.4 consume ConvexityToric T1/T4 (`TauCetiRoadmap/GeometricQuantization/README.md:1154–1156,1266–1267`), creating a return edge. Its standalone §3.1a does not depend on ConvexityToric.

**Test of repair:** The shared contract must give dφ(H)=H, α(H)=2 for SU(2); dφ(H)=2Z and kernel {I,−I} for SU(2)→SO(3); and no rank-one maps for a torus. Both roadmaps specify those same values. A single owner preserves all three. LieGroups' open revision contains related work, but this is an existing roadmap: only its main-branch contract is an eligible supplier here.

## R02 (P3) — Use the prescribed imports in the companions

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/BottSamelsonMomentTargets.lean:1–4` and `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/FixedLocusTargets.lean:1–4`.

**Claim:** Both acceptance companions violate the prescribed import form.

**Witness:** Each has four Mathlib submodule imports and no `import Mathlib`. The worker's passing scanner result does not cover these companion violations.

**Exact repair:** Delete the redundant companions as in R06, or replace each retained import block with `import Mathlib` and only needed pinned Tau Ceti imports. A fresh fixed-locus scratch probe with the replacement elaborates; the unchanged polygon replacement test is carried from [r7]. Neither replacement changes a mathematical hypothesis.

## R03 (P3) — Remove the companion option override

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/BottSamelsonMomentTargets.lean:11`: `set_option autoImplicit false`.

**Claim:** This listed acceptance file violates the no-options rule.

**Witness:** The option remains unchanged, although the worker scanner reports `set_option=0`.

**Exact repair:** Delete the line, or delete the redundant companion. The unchanged default-option polygon test carried from [r7] verifies that its two signatures require no override. Their three positive-weight assumptions are preserved. This retains the previous report's P3 classification.

## R04 (P3) — Delete invariant-subspace stability padding

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/FixedLocusTargets.lean:18–21`: `theorem invariants_stable`.

**Claim:** This intermediate calculation is padding in the headline acceptance material.

**Witness:** A fresh scratch probe closes it with `exact fun v hv k => (hcomm k v).trans (congrArg J (hv k))`; Lean exits 0. Pinned invariant membership is exactly the fixed-vector equation.

**Exact repair:** Delete it from `Suggested.lean`/the companion acceptance material and retain the README API statement; do not prove it in place. For trivial, cyclic and S₃ representations, both sides are ρ(k)Jv=Jρ(k)v=Jv. The declaration does not test the geometric fixed-locus headline.

## R05 (P3) — Record the source provenance

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:907–935` (references); no `sources.toml` exists in the folder.

**Claim:** The cited works still lack the required one-entry-per-work provenance records.

**Witness:** The folder contains only README and three Lean files. This round's sources-service fetch legally retrieves Conrad–Landesman, but no roadmap provenance manifest records it.

**Exact repair:** Add `sources.toml` using the established work keys, exact versions/locators, legal provenance, and explicit uncertified entries for publisher-only texts. Record the angular normalization dχ=iα: the new check gives eigenvalues +2i and −2i, not +2 and −2. No manifest was edited by this review.

## R06 (P3) — Remove the stale companion catalogue

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/BottSamelsonMomentTargets.lean:6–16,35–54` and `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/FixedLocusTargets.lean:6–13,24–43`.

**Claim:** The companions retain duplicate/intermediate targets and fail the headline-only, namespace, documentation and README-correspondence rules.

**Witness:** The polygon companion repeats Suggested's two theorems and five supporting declarations under a second namespace. The fixed-locus companion states intermediate steps; Suggested:18–19 identifies the geometric headline's missing carriers.

**Exact repair:** Delete the redundant polygon companion and keep the fixed-locus proof steps in the README API. Independently justified retained headlines must satisfy all acceptance-file rules. Deleting these companions preserves the six Suggested headlines, the eight-flag/six-vertex computation and the geometric fixed-locus specification.

## Previous findings

- R01 — not repaired: README:119–140 still constructs the compact rank-one map, also constructed in GeometricQuantization §3.1a. The new Layer 1 citation fixes its adjoint input only.
- R02 — not repaired: both companion files:1–4 retain submodule imports and omit the required root import.
- R03 — not repaired: BottSamelsonMomentTargets.lean:11 retains `set_option autoImplicit false`.
- R04 — not repaired: FixedLocusTargets.lean:18–21 still admits invariant stability; the one-term proof succeeds again.
- R05 — not repaired: README:907–935 lists references without a source manifest in the folder.
- R06 — not repaired: both companions retain duplicate polygon signatures or intermediate fixed-locus targets, with the same stale documentation and namespaces.
- R07 — repaired: README:79–83 now names LieGroups Layer 1 for Ad/ad; :174 and :286 include it. The added :164–166 check computes both complex root eigenvalues correctly.

## Verified sound

🤖 Incremental AI re-review of **10 changed lines since 319049e**. The only change is the corrected adjoint supplier contract, its Needs/dependency references, and a three-line SU(2) normalization Check. All three Lean files and both library pins are unchanged. There are six remaining findings: one P2 and five P3. No new mathematical defect was found in the repair. No supplied repair report marks these findings not actionable.

[r7]: packages/ConvexityToric/reports/PRREVIEW-ConvexityToric~7.md

**Scope and verification.** HEAD is d9c6241ddf3eee896a30005868f0acdaf7a72244. Mathlib is pinned at 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The supplied main checkout is 929496d4221b974c60787257a3cdc28b600fc49c. No files outside this folder changed since the previous review. The brief's excluding diff against origin/main is empty, and the worktree is clean. No pull-request file was edited.

The worker's scope-aware gate passes, including its targeted build:

```text
gate ConvexityToric: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The prescribed standalone gate was rerun and reports:

```text
gate ConvexityToric: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=4 source-material=0 FAIL
  outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md
  outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/Suggested.lean
  outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/AnnulusFixedPointTargets.lean
  outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md
```

These four lines are scope false positives: the brief expressly includes both sibling folders as this pull request's own. No other gate check fails. The unchanged manual companion findings R02–R03 remain despite the scanner's zero counts.

Fresh dependency output:

```text
depcheck: 205 roadmaps, 1627 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurs. No supplier edge was added by this review.

**Lean and acceptance coverage.** A fresh targeted `lake build TauCetiRoadmap.SymplecticGeometry.ConvexityToric.Suggested` succeeds (8988 jobs). Direct elaboration of Suggested exits 0 with six `sorry` warnings and no other warnings. A fresh elaboration of the scratch copy with `#check @name` for all **17 declarations** exits 0. Comparing those types with README §§1.1, 3.1–3.3 and 5.1 finds no dropped binder or change: compactness, connectedness, finite dimension, boundarylessness, Hausdorffness, smoothness, effectivity, half-dimension, positive weights and exponential/period calibration are present where required. The seven resolver leads are declarations of Suggested, not missing library APIs. The fixed-locus one-term probe exits 0, with only its other two `sorry` warnings. No Lean process was left running.

The six statable headlines remain: torus convexity and preconnected fibers; two-sided Schur–Horn; the actual word121 incidence moment range; its finite convex hull; toric orbit fibers; and the Delzant property for the actual normalized period lattice. Suggested states all six. Its docstring names the missing carriers for period/root comparison, local models, geometric fixed loci, equivariant perfection, Kirwan/Kostant convexity, norm-square deformation, Duistermaat–Heckman/class variation, reconstruction/cohomology and labeled classification. The unchanged headline one-tactic audit is inherited from [r7]; R04's padding witness was rerun.

**Changed source and convention check.** The sources service fetched the cited Spring 2018 Conrad–Landesman text from the author's Stanford page using the existing `conrad` key. Appendix Q pp. 248–249, conrad lines 11264–11291, identifies the adjoint character decomposition and its differential. The source's real-eigenvalue misprint is retained under Source issues; the new README check correctly retains i. Appendix R, Proposition R.2.1 and proof, pp. 254–256, conrad lines 11517–11602, keeps the coroot pairing 2 and the SU(2)/SO(3) comparison. This is a normalization Check on the already specified complexified Lie algebra, not a new restricted theorem. The smooth Ad/ad comparison comes from the now-correct LieGroups Layer 1 citation. All other seeded source evidence is inherited from [r7], not represented as newly fetched.

| Target | Text/locator carried through [r7] | Carried result |
| --- | --- | --- |
| 1.1 | conrad lines 11244–11513, Appendix Q pp. 248–253; lines 11517–11602, Proposition R.2.1 pp. 254–256 | Compact rank-one and coroot comparison, with dχ=iα; ownership remains R01. |
| 1.2 | cannas Homework 21 exercise 2 p. 174 and Proposition 12.6 p. 70; hnp lines 461–559, Lemmas 2.1–2.2 pp. 141–143, including page-image inspection in [r7] | Invariant metric/polar method and local quadratic formula, with the source's I=−J conversion. |
| 2.1 | cannas lines 6663–6724, Homework 21 exercises 3–5, pp. 174–175; Kirwan Part I §§4–5, pp. 44–78 | Critical-set/closure, even Hessian and connected-level route checked. Kirwan's rational equivariant-perfection text could not be obtained; no certification of that locator. The coadjoint application is unchanged; its supplier was reopened. |
| 3.1 | cannas lines 6472–6528, Theorem 27.1 pp. 169–170; hnp lines 769–828, Theorems 3.10/4.1 pp. 149–151; lmtw lines 45–50, Theorem 1.1 v1 p. 2 | Compact/connected and proper/local-convexity/local-fiber hypotheses align. LMTW's stronger proper-orbifold result supplies the compact case; its opposite moment sign is explicit at lines 108–112. |
| 3.1, norm-square headline | lerman lines 117–175 and 180–225, Theorem 1.1 and proof, v2 pp. 3–5 | Proper moment map, invariant dual norm, gradient inequality and finite-length estimate checked. The README explicitly supplies trapping/uniform tails rather than copying the source's unjustified energy-band step. |
| 3.2 | cannas Theorem 27.1, lines 6472–6479, applied to the compact orbit; Majorization MAJ-A18–A25 | Convex-hull input supports the compact Kostant application. Unitary/projector computations below checked the matrix identification and repeated/empty spectra. |
| 3.3 | escobar lines 301–314, §3.2 p. 8; lines 450–500, §4.1 pp. 12–13; cannas Theorem 27.1 | Projector sum, product embedding and fixed-image convex hull checked. The weighted signs and inequalities are the roadmap's own application and were independently computed; source errors are listed below. |
| 4.1 | cannas lines 7177–7251, Definitions 30.1–30.2/Theorem 30.3 pp. 191–192; moerdijk lines 457–514 §§4.1–4.4; van-den-berg-moerdijk lines 116–134 §2 | Density pushforward and groupoid models checked. The README correctly adds effectiveness/affine support to avoid the overbroad source DH assertion. Generic comparisons remain Orbifolds' targets. |
| 4.2 | cannas lines 7320–7358, Proposition 30.7/Theorem 30.8 pp. 194–195; lines 7359–7395 §30.3 | Left/right connection conversion, curvature sign and top-power polynomial checked. Arbitrary reduced classes remain real, and full ineffective isotropy is retained. |
| 5.1 | cannas lines 6730–6735, Definition 28.1 p. 177; 6768–6788 p. 178; 6822–6840 Theorem 28.2 pp. 179–180; §§29.1–29.3 pp. 183–185; delzant lines 239–246, Theorem 2.1 p. 320, and lines 438–450, §3 pp. 325–326 | Smooth integral vertex/facet dictionary, quotient and classification checked, with inward/outward and period conversions computed below. |
| 5.2 | lerman-tolman lines 73–97, Definitions 1.2–1.4/Theorem 1.5, v1 pp. 2–3 | Compact connected effective half-dimensional orbifold and labeled-polytope scope agree. Weighted slices, periods, coarse power map and areas recorded below. |

**Adversarial table — 157 rows.** The 154 unchanged rows from [r7] retain their computed values and cite that report individually. B01–B05 and D01–D03 are inherited sibling-context checks; no sibling changed this round. E01–E03 freshly compute the added Check and the corrected Ad/ad/exponential contract. The table covers the ten seeded subsections, all six statable headlines and each mathematical target touched by a finding.

| Statement | Instances tried | Computed values on both sides | Result / change |
| --- | --- | --- | --- |
| A01 Period lattice and characters | S¹, k=0,1,2 | exp(2π)=1; real differentials 0,1,2; normalized lattice ℤ, period lattice 2πℤ | Pass on the stated instances; inherited [r7]. |
| A02 Duality/product of characters | χ₂χ₃ | χ₂χ₃=χ₅; differentials 2+3=5 | Pass on the stated instances; inherited [r7]. |
| A03 Restriction/quotient lattice | Diagonal S¹⊂T²; quotient (s,t)↦s−t | Weight (2,3) restricts to 5; quotient kernel ℤ(1,1), quotient lattice ℤ | Pass on the stated instances; inherited [r7]. |
| A04 Rank-one calibration | SU(2), H=diag(i,−i); zero map | α(H)=2 and exp(2πH)=1; zero derivative pairs to 0 | Pass on the stated instances; inherited [r7]. |
| A05 Central isogeny | SU(2)→SO(3) | Kernel {±1}, order 2; same Lie algebra, torus period lattice index 2 | Pass on the stated instances; inherited [r7]. |
| A06 Full lattice versus splitting | U(2); rank zero | det[(1,1),(1,−1)]=−2, index 2; (1,0) needs half coefficients; rank-zero lattice {0} | Pass on the stated instances; inherited [r7]. |
| A07 Haar convention/basis change | ℤ basis 1, then −1 | Fundamental intervals both have length/mass 1; period interval length 2π | Pass on the stated instances; inherited [r7]. |
| A08 HamiltonianTorusData contraction | ℂ, positive rotation at (1,0), v=(1,0) | ω((0,1),(1,0))=−1=d(−r²/2)(v); positive quadratic gives +1 | Pass on the stated instances; inherited [r7]. |
| A09 Reversal and constant shift | Reversed circle, moment r²/2+7 | At (1,0), both contraction and differential are +1; constant contributes 0 | Pass on the stated instances; inherited [r7]. |
| A10 Products and restriction | Two rotation planes; diagonal circle | Moment (−r₁²/2,−r₂²/2) restricts to −(r₁²+r₂²)/2; contractions add identically | Pass on the stated instances; inherited [r7]. |
| A11 Smoothness/junk derivative | Constant point action; nonsmooth candidate | Point derivatives and contraction are 0; raw mfderiv may be 0 off differentiability, but moment/action smoothness are explicit fields | Pass on the stated instances; inherited [r7]. |
| A12 Fixed-set definition/closedness | Trivial group; irrational rotation on first ℂ² factor | Fixed sets ℂ² and {0}×ℂ; tangent real dimensions 4 and 2 | Pass on the stated instances; inherited [r7]. |
| A13 Preserved metric is necessary | Shear (q,p)↦(q+p,p) | Fixed line p=0 has restricted ω=0; nth derivative sends e₂ to ne₁+e₂, squared norm has positive n² coefficient | Pass on the stated instances; inherited [r7]. |
| A14 Polar complex structure | g Euclidean, ω=dq∧dp | A=[[0,−1],[1,0]], −A²=Id, J=A; J²=−Id, ω(e₁,Je₁)=1; −J gives −1 | Pass on the stated instances; inherited [r7]. |
| A15 Polar scaling/smoothness model | ω=2dq∧dp | A=2J₀, (−A²)^(−1/2)=Id/2, J=J₀; ω(e₁,Je₁)=2 | Pass on the stated instances; inherited [r7]. |
| A16 Invariant-subspace stability | Trivial/C₂/S₃ permutation actions on doubled real representation; J swaps the two copies with a sign | ρ(k)Jv=Jρ(k)v=Jv; each side equal for every fixed v | Mathematics passes; padding R04 also reproduced this round. Values inherited [r7]. |
| A17 Invariant form nondegeneracy | Same S₃ action on ℝ³⊕ℝ³ | Fixed subspace span((1,1,1),0),span(0,(1,1,1)); restricted ω matrix [[0,3],[−3,0]], determinant 9 | Pass on the stated instances; inherited [r7]. |
| A18 Exponential-chart fixed iff | Euclidean chart Id, C₂ acts −Id | e(−v)=−e(v); fixed point iff v=0 iff v∈invariants | Pass on the stated instances; inherited [r7]. |
| A19 Common ball and tangent inclusion | Irrational first-plane rotation, ball radius r>0 | Every rotation preserves norm r; common invariant tangent is second plane, exp is Id in this model | Pass on the stated instances; inherited [r7]. |
| A20 Symplectic normal/naturality | Fixed {0}×ℂ⊂ℂ²; exchange coordinates | Normal first ℂ, restricted form standard on second ℂ; exchange swaps both descriptions | Pass on the stated instances; inherited [r7]. |
| A21 Total geodesy | Euclidean fixed second plane | Geodesic (0,v)t stays in fixed plane; normal acceleration 0 | Pass on the stated instances; inherited [r7]. |
| A22 Compact averaging | Rotate an anisotropic metric diag(2,1) | Circle average=(3/2)Id; positive eigenvalues 3/2,3/2 | Pass on the stated instances; inherited [r7]. |
| A23 Equivariant Darboux/relative normal model | Linear weight-one plane; fixed plane times rotating plane | Identity chart preserves dq∧dp and action; normal bundle is the rotating factor | Pass on the stated instances; inherited [r7]. |
| A24 Local quadratic moment | Weights +1,−1,0 | μ=−r²/2,+r²/2,constant; Hessians −Id,+Id,0; indices 2,0,0 | Pass on the stated instances; inherited [r7]. |
| A25 Local cone/stabilizer/rank | Weight +1 at 0 versus nonzero z | Cone μ(0)−ℝ≥0; stabilizer S¹ at 0, {1} away; orbit ranks 0 and 1 | Pass on the stated instances; inherited [r7]. |
| A26 Nonfixed orbit slice | Free circle on cylinder, μ=p | Local coordinates (θ,p), image an interval, fiber a circle locally an arc; no slice weight part | Pass on the stated instances; inherited [r7]. |
| A27 Moment critical-set closure | ξ irrational in T²; ξ=0 | Closure=T² versus {1}; critical sets M^T versus M; zero Hessian in ξ=0 case | Pass on the stated instances; inherited [r7]. |
| A28 Generic Hessian/even index | Sphere height | Two critical Hessians definite with indices 0 and 2; no index 1 | Pass on the stated instances; inherited [r7]. |
| A29 Scalar critical/regular level connectedness | Sphere heights c=0,±1,2 | Fibers circle, point, empty; all preconnected | Pass on the stated instances; inherited [r7]. |
| A30 Ordinary Morse attachments | Sphere, negative ranks 0,2 | Cells D⁰,D², cellular differentials 0; Betti (1,0,1) | Pass on the stated instances; inherited [r7]. |
| A31 Isolated-fixed-point consequences | CP² versus trivial action on T² | CP² indices 0,2,4, ranks (1,1,1), π₁=0; T² has b₁=2 | Pass on the stated instances; inherited [r7]. |
| A32 Coadjoint generic heights | SU(2) nonzero orbit; central orbit | W-orbit has 2 points with indices 0,2; central orbit has 1 point of index 0 | Pass on the stated instances; inherited [r7]. |
| A33 Universal torus/Borel construction | Rank-zero torus; point with S¹ | M_T=M, BT=point versus point_T=BS¹ and H*=ℤ[u] | Pass on the stated instances; inherited [r7]. |
| A34 Chern/Euler weight sign | Circle characters 0,1,2 | Euler classes 0,u,2u, where u=−h; weight 2 gives −2h | Pass on the stated instances; inherited [r7]. |
| A35 Equivariant pullback/restriction | Fixed point inclusion in S² | Projection classes u pull back to u; ordinary restriction sends positive-degree base u to 0 | Pass on the stated instances; inherited [r7]. |
| A36 Localization and Euler nonzerodivisor | Weight-one normal line versus zero-weight tangent | Multiplication by u injective in ℚ[u], invertible after localization; zero Euler multiplication is 0 | Pass on the stated instances; inherited [r7]. |
| A37 Perfection/formality | Standard S¹ on S² | Equivariant module ℚ[u]⊕ℚ[u][−2]; ordinary Betti polynomial 1+t² equals sum of two critical contributions | Pass on the stated instances; inherited [r7]. |
| A38 Torus convexity headline | Point, trivial torus | Range={0}, hull of fixed image={0}; fiber at 0 singleton | Pass on the stated instances; inherited [r7]. |
| A39 Ineffective torus action | Trivial circle on S² | Image={c}, affine dimension 0, fixed-image hull={c}; whole-sphere fiber connected | Pass on the stated instances; inherited [r7]. |
| A40 Torus convexity/off-image | Standard sphere, μ=h | Image/hull=[−1,1]; c=2 fiber=∅, preconnected | Pass on the stated instances; inherited [r7]. |
| A41 Product/subtorus/shift images | S²×S²; diagonal circle; shift +3 | Product square [−1,1]², diagonal projection [−2,2], shifted interval [1,5] | Pass on the stated instances; inherited [r7]. |
| A42 Effective dimension/isotropic orbits | Sphere; product of spheres | Generic orbit dimensions 1,2; ω on orbit tangents 0; image dimensions 1,2=half manifold dimension | Pass on the stated instances; inherited [r7]. |
| A43 Coisotropic regular levels | Circle on ℂ², positive diagonal moment | Level dimension 3; kernel of restricted ω dimension 1; reduced dimension 2=4−2 | Pass on the stated instances; inherited [r7]. |
| A44 Local-to-global hypotheses | Identity ℝ→ℝ; circle cylinder μ=p | Closed convex image ℝ; fibers point or S¹ connected; compact interval preimages compact for cylinder | Pass on the stated instances; inherited [r7]. |
| A45 Nonabelian full image/chamber | SU(2) orbit of radius r>0 | Full image S²_r excludes midpoint 0; chamber image {r}; orbit-projected fiber is whole connected sphere | Pass on the stated instances; inherited [r7]. |
| A46 Rational directions versus supports | Circle sphere shifted by √2 | Interval endpoints √2±1, primitive normals ±1 still integral | Pass on the stated instances; inherited [r7]. |
| A47 Cross-section model | SU(2) sphere | Positive-chamber cross-section is one point with zero form; K-saturation recovers sphere | Pass on the stated instances; inherited [r7]. |
| A48 Norm-square gradient inequality | p(x)=x⁴ | ‖∇p‖=4‖x‖³=4‖p‖^(3/4); p=0 gives both 0 | Pass on the stated instances; inherited [r7]. |
| A49 Gradient semiflow/finite length | x′=−4x³, x₀>0 | x(t)=x₀/√(1+8x₀²t); total length x₀; bound p(x₀)^(1/4)/(4·1/4)=x₀ | Pass on the stated instances; inherited [r7]. |
| A50 Uniform tails/stratum limit | Same flow, 0≤x₀≤R | Tail x(t)≤1/√(8t), uniformly tends to 0; limit and retraction are 0 | Pass on the stated instances; inherited [r7]. |
| A51 Need trapping, not only energy band | Sphere f=h², C=north pole | f(north)=f(south)=1; any energy band about 1 includes south, outside a small north neighborhood | Pass on the stated instances; inherited [r7]. |
| A52 Product gradient convention | f=x⁴+y⁴, product Euclidean metric | ∇f=(4x³,4y³); separate flows give product limit (0,0) | Pass on the stated instances; inherited [r7]. |
| A53 Kostant projection | SU(2) sphere | Torus projection [−r,r]=conv{−r,r}, Weyl reflection swaps endpoints | Pass on the stated instances; inherited [r7]. |
| A54 Matrix pairing sign | H=diag(2,0), X=i diag(θ₁,θ₂) | −i tr(HX)=2θ₁; diagonal moment evaluates to 2θ₁ | Pass on the stated instances; inherited [r7]. |
| A55 Schur–Horn, both inclusions n=2 | Spectrum (2,0), U first row (√t,√(1−t)) | Diagonal (2t,2−2t), 0≤t≤1; trace 2 and coordinates in [0,2] give exactly the segment hull | Pass on the stated instances; inherited [r7]. |
| A56 Repeated spectrum | (1,1) | UIdU*=Id; diagonal set and permutation hull both {(1,1)} | Pass on the stated instances; inherited [r7]. |
| A57 Empty/one-dimensional spectra | n=0; spectrum (a) | Both sets {()}; both sets {(a)} | Pass on the stated instances; inherited [r7]. |
| A58 Majorization comparison | λ=(2,0), d=(1,1) | Largest-entry sum 1≤2, total sums 2=2; squared sums 2≤4 | Pass on the stated instances; inherited [r7]. |
| A59 Rank-one simplex | Projector onto z∈ℂⁿ, ‖z‖=1 | Diagonal ‖zᵢ‖²≥0, sum 1; prescribed simplex coordinates xᵢ realized by zᵢ=√xᵢ | Pass on the stated instances; inherited [r7]. |
| A60 V3/projectorDiagonal | Zero, full, initial plane | Real dimensions of V3=6; projector diagonals (0,0,0),(1,1,1),(1,1,0), traces 0,3,2 | Pass on the stated instances; inherited [r7]. |
| A61 Normalized projector, non-example | span(e₁+e₂) | Diagonal (1/2,1/2,0), trace 1; unnormalized outer product gives (1,1,0), trace 2 | Pass on the stated instances; inherited [r7]. |
| A62 Initial-plane incidence | L₁=e₁ or e₃ | e₁∈span(e₁,e₂), e₃∉span(e₁,e₂) | Pass on the stated instances; inherited [r7]. |
| A63 Weighted moment trace/linearity | a=b=c=1; flag (e₁,12,e₂) | Moment (2,2,0), trace 4=1+2+1; doubling all weights gives (4,4,0), trace 8 | Pass on the stated instances; inherited [r7]. |
| A64 Diagonal-unitary invariance | Line span(e₁+e₂), diagonal phases | Projector diagonal remains (1/2,1/2,0) | Pass on the stated instances; inherited [r7]. |
| A65 KKS/FS sign and scale | CP¹ near e₁, w=x+iy | μ₁=1−‖w‖²+O(‖w‖⁴), tangent weight −1; σ(∂x,∂y)=−2=−2π·(1/π) | Pass on the stated instances; inherited [r7]. |
| A66 Product form restriction | Positive a,b,c; nonzero tangent to holomorphic incidence immersion | (−ω)(v,Jv)=2π(a‖v₁‖²+b‖v₂‖²+c‖v₃‖²)>0 | Pass on the stated instances; inherited [r7]. |
| A67 Actual torus versus ambient group | Diagonal scalars versus swapping e₂,e₃ | Scalars fix all subspaces; swap sends P₀=12 to 13 and fails incidence preservation | Pass on the stated instances; inherited [r7]. |
| A68 Effective kernel/complexity | All coordinate and mixed lines | Common diagonal phases force t₁=t₂=t₃; effective rank 3−1=2, complexity 3−2=1 | Pass on the stated instances; inherited [r7]. |
| A69 Eight fixed flags | L₁∈{e₁,e₂}; P coordinate containing it; L coordinate in P | 2·2·2=8 flags | Pass on the stated instances; inherited [r7]. |
| A70 fixedMoment row 1 | (e₁,12,e₁) | Weighted indicators sum to (a+b+c,b,0), exactly row 1 | Pass on the stated instances; inherited [r7]. |
| A71 fixedMoment row 2 | (e₁,12,e₂) | Sum (a+b,b+c,0), exactly row 2 | Pass on the stated instances; inherited [r7]. |
| A72 fixedMoment row 3 | (e₁,13,e₁) | Sum (a+b+c,0,b), exactly row 3 | Pass on the stated instances; inherited [r7]. |
| A73 fixedMoment row 4 | (e₁,13,e₃) | Sum (a+b,0,b+c), exactly row 4 | Pass on the stated instances; inherited [r7]. |
| A74 fixedMoment row 5 | (e₂,12,e₁) | Sum (b+c,a+b,0), exactly row 5 | Pass on the stated instances; inherited [r7]. |
| A75 fixedMoment row 6 | (e₂,12,e₂) | Sum (b,a+b+c,0), exactly row 6 | Pass on the stated instances; inherited [r7]. |
| A76 fixedMoment row 7 | (e₂,23,e₂) | Sum (0,a+b+c,b), exactly row 7 | Pass on the stated instances; inherited [r7]. |
| A77 fixedMoment row 8 | (e₂,23,e₃) | Sum (0,a+b,b+c), exactly row 8 | Pass on the stated instances; inherited [r7]. |
| A78 Fixed-label symmetry | Swap first two coordinates | Row permutation (1 6)(2 5)(3 7)(4 8); weighted coordinates swap exactly | Pass on the stated instances; inherited [r7]. |
| A79 Incidence image, nonfixed point | a=b=c=1; L₁=span(e₁+e₂), P=L₁⊕e₃, L=e₃ | μ=(1,1,2)=½(2,0,2)+½(0,2,2) | Pass on the stated instances; inherited [r7]. |
| A80 Hull versus inequalities, equal weights | (1,1,1) | Trace 4, bounds (3,3,2); vertices (3,1,0),(3,0,1),(2,0,2),(0,2,2),(0,3,1),(1,3,0) on both sides | Pass on the stated instances; inherited [r7]. |
| A81 Hull, unequal weights | (2,1,3) | Trace 7, bounds (6,6,4); six vertices (6,1,0),(6,0,1),(3,0,4),(0,3,4),(0,6,1),(1,6,0) on both sides | Pass on the stated instances; inherited [r7]. |
| A82 Hull, fractional weights | (1/2,3/2,2) | Trace 11/2, bounds (4,4,7/2); vertices (4,3/2,0),(4,0,3/2),(2,0,7/2),(0,2,7/2),(0,4,3/2),(3/2,4,0) | Pass on the stated instances; inherited [r7]. |
| A83 Interior-edge coefficients/collision | (1,1,1); (2,1,1) | Coefficients of row 6 are (1/2,1/2); (1/3,2/3); distinct image counts 7 and 8 | Pass on the stated instances; inherited [r7]. |
| A84 Six nonzero edges | General positive a,b,c | Consecutive primitive-root edge parameters b,c,a+b,c,b,a+c; all positive | Pass on the stated instances; inherited [r7]. |
| A85 Boundary a=0 | b=c=1 | Fixed values reduce to six permutations of (2,1,0); exceptional P¹ tangent has pulled-back form 0 | Pass on the stated instances; inherited [r7]. |
| A86 Liouville measure/scaling | Unit square, ω,2ω,−ω; point | Masses 1,2,1; point mass 1 from ω⁰/0!=1 | Pass on the stated instances; inherited [r7]. |
| A87 Restriction/product/invariance | Unit squares; map (x,y)↦(2x,y/2) | Product mass 1·1=1, determinant 1 preserves mass; half-square mass 1/2 | Pass on the stated instances; inherited [r7]. |
| A88 DH definition/local finiteness | μ=r²/2 on ℂ, interval [0,R] | Preimage disk radius √(2R), mass 2πR; bounded R gives finite mass | Pass on the stated instances; inherited [r7]. |
| A89 Absolute continuity/affine support | Height sphere; trivial circle on same sphere | Density 2π on [−1,1], total 4π; trivial action gives atom 4π at c | Pass on the stated instances; inherited [r7]. |
| A90 DH shifts/products | Sphere shift +3; two spheres | Support [2,4], same density 2π; product density (2π)² on square | Pass on the stated instances; inherited [r7]. |
| A91 Level principal bundle arrows | h:x→hx, t,k∈T | (ht)⁻¹hx=t⁻¹x; (tk)⁻¹x=k⁻¹(t⁻¹x) | Pass on the stated instances; inherited [r7]. |
| A92 Connection right/left normalization | Positive Hopf right circle; inverse left action | α(ξ_right)=1, α(ξ_left)=−1; opposite connection gives curvature −F | Pass on the stated instances; inherited [r7]. |
| A93 Classifier/Chern/real class | Hopf; c=√2 | ∫F/(2π)=1=h[CP¹], u[CP¹]=−1; [ω_c]=2π√2 h is real, not a rationality claim | Pass on the stated instances; inherited [r7]. |
| A94 Classifying versus coarse model | Point with C₂ isotropy | BC₂ versus point; H¹(BC₂;F₂)=F₂, H¹(point;F₂)=0; rational positive degrees vanish | Pass on the stated instances; inherited [r7]. |
| A95 Full-isotropy integration | Point isotropy k=1,2 | Full integrals 1,1/2; effective point integral 1; effective=k·full | Pass on the stated instances; inherited [r7]. |
| A96 Reduced-class variation sign | Hopf c₀=1,c=3 | [ω₃]−[ω₁]=4πh=(3−1)[F] | Pass on the stated instances; inherited [r7]. |
| A97 Contractible chamber/transport | Positive circle levels on ℂ² | Radial identification sends every quotient to CP¹; H² generator h unchanged, class 2πc h | Pass on the stated instances; inherited [r7]. |
| A98 Degree bound/reduced-volume density | Circle on ℂ², n=2,m=1 | vol(M_c)=2πc; density (2π)(2πc)=4π²c of degree 1=n−m | Pass on the stated instances; inherited [r7]. |
| A99 Wall/null-set behavior | Reversed circle on ℂ | Density 0 at negative regular values, 2π at positive ones; critical value set {0} has Lebesgue mass 0 | Pass on the stated instances; inherited [r7]. |
| A100 Common ineffective factor | Weights (k,k), c>0; k=2 | Effective area 2πc/k, full area 2πc/k²; for k=2: πc and πc/2; DH density π²c | Pass on the stated instances; inherited [r7]. |
| A101 Orthant/simplex/product volumes | ℂ² rectangle; CP² size c; S²×S² sides a,b | Masses 4π²RS, 2π²c², 4π²ab; agree with (2π)^n times Euclidean volumes | Pass on the stated instances; inherited [r7]. |
| A102 Toric fiber iff | Sphere latitudes and poles; point | Same height iff same circle orbit; poles have singleton fibers; point satisfies both sides | Pass on the stated instances; inherited [r7]. |
| A103 Interior freeness/face stabilizers | Sphere interval | Interior stabilizer {1}, endpoint stabilizer S¹; one orbit per fiber | Pass on the stated instances; inherited [r7]. |
| A104 Fixed vertices/rank-zero exception | Point; sphere; word121 | Point is fixed, vertex and interior; sphere endpoints not interior; word121 (2,2,0) fixed but not vertex | Pass on the stated instances; inherited [r7]. |
| A105 Facet presentation/pairing/region | N=ℤ→ℝ, normals ±1, supports 0,−1 | Pairings x,−x; region [0,1]; x=−1 fails first inequality | Pass on the stated instances; inherited [r7]. |
| A106 Translation/permutation/lattice isomorphism | Shift +2; exchange facets; basis −1 | Supports (2,−3) give [2,3]; facet exchange preserves set; x↦−x and normal↦−normal preserve pairing | Pass on the stated instances; inherited [r7]. |
| A107 Smooth vertex | Primitive versus doubled normals | Endpoint active basis ±1 spans ℤ; ±2 spans index-2 subgroup, so same interval fails smoothness | Pass on the stated instances; inherited [r7]. |
| A108 Exact active-facet count | Duplicate x≥0 at x=0 | Two active indices in dimension 1; no injective one-index list exhausts both | Pass on the stated instances; inherited [r7]. |
| A109 Delzant compact/full/irredundant | [0,1], {0}⊂ℝ, half-line, duplicate facet | Interval passes; singleton interior empty; half-line unbounded; duplicate lacks point with other copy strict | Pass on the stated instances; inherited [r7]. |
| A110 Empty facet list/rank zero | V=0 versus V=ℝ | Region singleton/univ in rank 0, empty basis valid; rank-one region ℝ is not compact | Pass on the stated instances; inherited [r7]. |
| A111 Delzant-image actual lattice | Sphere, exp(t)=e^(it), lattice ℤ; rescale exponential | Correct kernel exp(2πv)=1 iff v∈ℤ; exp(2it) has derivative 2 and is excluded by identity-derivative hypothesis | Pass on the stated instances; inherited [r7]. |
| A112 Quotient exact sequence | Interval [0,c], c>0 | ℤ²→ℤ sends (u,v)↦u−v, kernel diagonal ℤ; level r₁²+r₂²=2c, free diagonal circle | Pass on the stated instances; inherited [r7]. |
| A113 Reconstruction and orbit space | Same interval | Quotient CP¹, residual μ=r₁²/2∈[0,c], area 2πc; orbit quotient interval | Pass on the stated instances; inherited [r7]. |
| A114 Uniqueness/affine relabeling | Shift interval; reflect x↦−x | Shift adds constant to μ; reflection changes circle parameter θ↦−θ, not identity equivariance | Pass on the stated instances; inherited [r7]. |
| A115 Facet cohomology/symplectic class | Interval supports (0,−c) | D₁=D₂=h, D₁D₂=0; ring ℤ[h]/h²; −2πΣλ_jD_j=2πc h | Pass on the stated instances; inherited [r7]. |
| A116 Higher toric examples | CP², product, corner chop δ | Rings ℤ[h]/h³ and ℤ[x,y]/(x²,y²); chopped triangle area decreases δ²/2, volume by 2π²δ² | Pass on the stated instances; inherited [r7]. |
| A117 Weighted Hamiltonian flow/periods | Weights (2,3), ε>0 | Contraction d((2r₁²+3r₂²)/2); generic period 2π, axis periods π,2π/3 | Pass on the stated instances; inherited [r7]. |
| A118 Ellipsoid-to-sphere map | (2,3), ε=1 | Squared image norm=(2r₁²+3r₂²)/2=1 | Pass on the stated instances; inherited [r7]. |
| A119 First weighted slice | (2,3), ε=1 | Radius √(2/3), residual C₂ acts w↦−w; center stabilizer 2, off-center 1 | Pass on the stated instances; inherited [r7]. |
| A120 Second slice/overlap | (2,3), ε=1; (1,2) | Radius 1, C₃ multiplier exp(−4πi/3); overlap ambiguities exactly residual phases; order-one first chart for (1,2) | Pass on the stated instances; inherited [r7]. |
| A121 Coarse power map, both directions | (2,3), both axes and mixed points | [z₁³:z₂²] acquires common e^(−6iθ); invariant relative phase 3φ₁−2φ₂; poles [1:0],[0:1] | Pass on the stated instances; inherited [r7]. |
| A122 Slice reduced forms | First slice y₁=0; second y₂=0 | Pullback first/second coordinate area term vanishes, remaining form dx₂∧dy₂ or dx₁∧dy₁ | Pass on the stated instances; inherited [r7]. |
| A123 Weighted area | (2,3), ε=1 and 1/2; (1,1), ε=1/2 | (1/2)π·(2/3)=π/3; π/6; Hopf π, agreeing with 2πε/(ab) | Pass on the stated instances; inherited [r7]. |
| A124 Labeled classification/smoothness | Label 2 primitive cone; label 1 determinant-2 cone | Both have order-two local isotropy; label 1 and determinant 1 gives trivial isotropy | Pass on the stated instances; inherited [r7]. |
| B01 Canonical chart form and uniqueness | T*ℝ; u=(1,0), v=(0,1); coordinate change Q=2q, P=p/2 | Model and intrinsic values are 1=1; dQ∧dP=2·(1/2)dq∧dp=dq∧dp; equality at each chart centre determines every fiber | Pass on the stated instances; inherited [r7]. |
| B02 General cotangent-lift Hamiltonian identity | Scaling action q↦eᵗq, lift (q,p)↦(eᵗq,e⁻ᵗp), at (2,3) | Field (2,−3), H=pq=6; contraction on (a,b) is 2b+3a, dH(a,b)=3a+2b | Pass on the stated instances; inherited [r7]. |
| B03 Sign and rescaling negative controls | Translation on T*ℝ; test v=∂p; forms σ, −σ, 2σ | Canonical contraction=1=d(p)(∂p); opposite gives −1≠1; doubled gives 2≠1 and fails the chart identity | Pass on the stated instances; inherited [r7]. |
| B04 Trivial action and zero-dimensional base | Trivial action on ℝ; base a point | Field 0, H=0, contraction 0=dH; at a point tangent and dual are {0}, zero form has radical {0} and is nondegenerate | Pass on the stated instances; inherited [r7]. |
| B05 Chart-target guard | A chart with target (−1,1), centre 0, attempted coordinate w=2 | At 0 the prescribed pair evaluates 1=1; 2∉(−1,1), so the antecedent is false and no equation constrains the total inverse’s junk value | Pass on the stated instances; inherited [r7]. |
| C01 Invariant metric by averaging (§1.1) | SO(3) adjoint rotations of diag(2,1,3); SU(2) acts through SO(3) | Haar average is ((2+1+3)/3)Id=2Id; every rotated average is 2Id and all eigenvalues are 2>0 | Pass; shared construction ownership R01. Inherited [r7]. |
| C02 Center and semisimple splitting (§1.1) | u(2), su(2), abelian ℝ² | u(2)=iℝId⊕su(2), dimensions 1+3=4; su(2) center 0; abelian derived algebra 0. For central C and [X,Y], invariance gives B(C,[X,Y])=B([C,X],Y)=0 | Pass; real splitting does not assert an integral direct product. Inherited [r7]. |
| C03 Killing hypotheses on the complexified summand (§1.1) | su(2) basis H,A,B; torus | Each ad-basis square has trace −8, cross traces 0: real Killing matrix −8Id, determinant −512≠0; complexification remains nondegenerate. On a torus the summand is 0, radical {0} | Pass; not asserting nondegenerate Killing form on all u(2). Inherited [r7]. |
| C04 Cartan and split weights (§1.1) | sl₂(ℂ), diagonal h=−iH | ad(h) eigenvalues on (h,E₁₂,E₂₁) are (0,2,−2); centralizer of ℂh is ℂh, dimension 1; zero summand has Cartan dimension 0 | Pass; no real split-weight assumption on su(2). Inherited [r7]. |
| C05 Actual character/differential comparison (§1.1) | diag(e^(it),e^(−it)) conjugating E₁₂ | Character e^(2it), derivative 2i; real weight α(H)=2, hence iα(H)=2i. At t=π, character 1 although group element −I | Pass; distinguishes character kernel from group-map kernel. Inherited [r7]. |
| C06 Root dimension and sl₂ comparison (§1.1) | E=E₁₂, F=E₂₁, h=diag(1,−1) | Positive/negative root-space dimensions 1,1; [E,F]=h, [h,E]=2E, [h,F]=−2F. Compact H=ih has eigenvalues ±2i | Pass; matches both pinned complex declarations after the hypotheses are verified. Inherited [r7]. |
| C07 Metric-independent coroot and denominator (§1.1) | B(H,H)=c>0, α(H)=2; c=1,3 | α♯=(2/c)H, ‖α‖²=4/c>0; 2α♯/‖α‖²=H in both cases, α(H)=2 | Pass; arbitrary invariant rescaling cancels. Inherited [r7]. |
| C08 All three compact bracket identities (§1.1) | H=diag(i,−i), A=((0,1),(−1,0)), B=((0,i),(i,0)) | [H,A]=((0,2i),(2i,0))=2B; [A,B]=diag(2i,−2i)=2H; [B,H]=((0,2),(−2,0))=2A | Pass; exact matrix arithmetic recorded in [r7]. |
| C09 Calibration excludes wrong maps (§1.1 Checks) | Identity, zero map, proposed half-coroot | Pairings 2,0,1 respectively; exp(2πH)=I and exp(πH)=−I. Only identity has the required pairing 2; half-coroot has wrong period | Pass; the wrong models are excluded. Inherited [r7]. |
| C10 Integration and diagonal-circle image (§1.1) | SU(2) identity map at t=π/2,π,2π | Both φ(diag(e^(it),e^(−it))) and exp(tH) are H,−I,I respectively; all lie in the diagonal torus. Kernel is {I}⊂{I,−I} | Pass; same normalization in the proposed shared supplier. Inherited [r7]. |
| C11 Root reflection (§1.1 API) | U(2), X=diag(ix,iy), α(X)=x−y, α∨=diag(i,−i) | X−α(X)α∨=diag(iy,ix); conjugation by A swaps the two entries. At (x,y)=(2,−1), both yield (−1,2); center (1,1) stays fixed | Pass; source's dual character reflection agrees. Inherited [r7]. |
| C12 Torus conjugation and root-vector choice (§1.1) | SU(2), t=π/4, D=diag(e^(it),e^(−it)) | Ad_D A=B, Ad_D B=−A, Ad_D H=H; (A−iB)/2=E₁₂ becomes iE₁₂=e^(2it)E₁₂ | Pass; the map changes by conjugation, not a false choice-free identity. Inherited [r7]. |
| C13 Central quotient and actual differential (§1.1) | SU(2)→SO(3), angular generator Z of period 2π | dφ(H)=2Z; α_SO3(Z)=1, α_SO3(2Z)=2; t=π gives rotation 2π=1 but SU(2) element −I; kernel has 2 elements | Pass; no injectivity requirement or lost central kernel. Inherited [r7]. |
| C14 Empty roots and full integral lattice (§1.1) | Trivial group, S¹, U(2) | Root-family cardinalities 0,0; no norm denominator evaluated. In U(2), determinant of ((1,1),(1,−1)) is −2, index 2; (1,0) requires coefficients 1/2,1/2 | Pass; zero-rank and nonsplit integral cases retained. Inherited [r7]. |
| C15 Exponential transport (§1.2) | Euclidean plane, quarter-turn R, v=(1,0) | exp₀(dR₀v)=(0,1)=R(exp₀v); R preserves squared norm 1 | Pass; pinned isometry theorem has actual differential. Inherited [r7]. |
| C16 Incomplete-metric exponential transport (§1.2 Check) | Open unit disk, R as above, v=(1/2,0) | Segment stays inside disk; both sides equal (0,1/2), squared norm 1/4<1. A radial path can reach the boundary in finite time | Pass; completeness not needed. Inherited [r7]. |
| C17 HNP complex-structure/sign adapter (§1.2) | ω=dq∧dp, positive weight +1, v=(1,0) | README Jv=(0,1), source Iv=(0,−1); ω(Iv,v)=1. Source weight relative to I is −1, so half the weighted norm square is −1/2=README μ(v) | Pass; displayed source formula inspected on page image. Inherited [r7]. |
| C18 Local moment Hessian/cone after source correction (§1.2) | Weights +1,−1,0 at origin | μ=−r²/2,+r²/2,0; Hessians −Id,+Id,0 and indices 2,0,0; cones are nonpositive ray, nonnegative ray, {0} | Pass; unchanged general theorem, corrected supporting locator. Inherited [r7]. |
| C19 Imported coadjoint critical set and indices (§2.1) | SO(3) unit sphere, p=±Z, X=Z; SU(2) double cover | Supplier Hessian =−B at +Z and +B at −Z; indices 2,0. Wμ={+Z,−Z}, values +1,−1. Betti numbers (1,0,1) and χ=2 | Pass; consumed from R2a.2–4, no duplicate target. Inherited [r7]. |
| C20 Central coadjoint orbit (§2.1 Check) | μ central, including μ=0; arbitrary torus | Wμ={μ}, orbit dimension 0, Hessian on {0} nondegenerate, index 0; one 0-cell gives b₀=1, all other Betti numbers 0 | Pass; no forced two-point count. Inherited [r7]. |
| C21 Regular height versus distinct values (§2.1) | Product of two unit coadjoint spheres, X=(Z,Z), then (Z,2Z) | Both directions regular. First values are 2,0,0,−2; second are 3,1,−1,−3. Indices remain 4,2,2,0 | Pass; distinctness needs the supplier's additional finite hyperplane avoidance. Inherited [r7]. |
| C22 Imported versus independently reconstructed rank-one object (R01) | Both §1.1 and GeometricQuantization §3.1a on SU(2), SO(3), a torus | Both specify pairing 2, derivative H or 2Z, kernel sizes 1 or 2, and zero rank-one maps in the empty family; no differing mathematical output separates the two constructions | Duplicate ownership; use a common earlier supplier, preserving these values. Inherited [r7]. |
| D01 Sibling Witt-extension signature relocation | ℝ² with dq∧dp, S=T=span(e₁), f(e₁)=2e₁ | Restricted forms both 0; e=diag(2,1/2) extends f and ω(e e₁,e e₂)=2·(1/2)=1=ω(e₁,e₂) | Inherited [r7]: degenerate subspaces remain allowed; no ConvexityToric contract changes. |
| D02 Sibling added hypothesis controls | S=V=ℝ², f=2Id; ambient dimensions 2 versus 4 | ω(2e₁,2e₂)=4≠1, so hf fails; finrank equality 2=4 fails in the unequal-dimensional case | Inherited [r7]: both stated exclusions hold. |
| D03 Sibling zero-dimensional/identity specialization | V=W=0; V=W=ℝ², S=span(e₁), f=Id | At rank zero both forms evaluate 0=0 and the unique equivalence works; in the plane e=Id preserves ω(e₁,e₂)=1 and fixes S | Inherited [r7]: deleting the separate identity example loses no generality. |
| E01 Added two-root conjugation Check (§1.1:164–165) | D(t)=diag(e^(it),e^(−it)); E₁₂,E₂₁; t=0,π/4,π/2 | D E₁₂ D⁻¹=e^(2it)E₁₂ and D E₂₁ D⁻¹=e^(−2it)E₂₁. Coefficient pairs on both sides: (1,1),(i,−i),(−1,−1) | Pass; fresh. Inverse conjugation exchanges the signs at π/4 and fails the displayed convention. |
| E02 Added differential Check (§1.1:165–166) | H=diag(i,−i), both complex root lines | HE₁₂−E₁₂H=(i−(−i))E₁₂=2iE₁₂; HE₂₁−E₂₁H=(−i−i)E₂₁=−2iE₂₁. Derivatives of e^(±2it) at 0 are ±2i; iα(H)=±2i | Pass; fresh. Omitting i gives ±2, unequal to ±2i; the zero map gives 0. |
| E03 Corrected supplier contract and dependency (§1.1:79–83,174,286) | Same D,H; real su(2) root basis A=E₁₂−E₂₁, B=i(E₁₂+E₂₁); t=π/4; identity t=0 | ad_H A=2B, ad_H B=−2A. Both Ad_D and exp(t ad_H) send (A,B) to (B,−A) at π/4, and to (A,B) at 0; H stays H. The torus/trivial Lie algebra has ad=0 and Ad=Id | Pass; fresh. LieGroups Layer 1 is the cited owner for these identities. Correcting the locator introduces no new construction or edge. |

**Pinned declarations reopened (six files).**

- `Mathlib/Algebra/Lie/OfAssociative.lean:195–201`: `LieAlgebra.ad` is the bracket representation and `LieAlgebra.ad_apply` evaluates it. It does not supply the smooth group derivative comparison; LieGroups Layer 1 owns that comparison.
- `Mathlib/Algebra/Lie/Weights/Killing.lean:555–556,608–609`: the sl₂-triple and one-dimensional nonzero-root-space declarations are present, with their finite-dimensional/Killing/Cartan/split-weight context. They do not construct the compact group map duplicated in R01.
- `Mathlib/RepresentationTheory/Invariants.lean:73–80`: the native invariant submodule consists of vectors fixed by every group element; compactness or topology is not part of this definition. This is the R04 probe's fixed-vector equation.
- `TauCeti/Geometry/Manifold/Riemannian/Isometry/Exponential.lean:47–58,117–121`: actual differential, finite-dimensional smooth Riemannian bundles, boundarylessness and Hausdorffness; no completeness assumption.
- `TauCeti/Geometry/Toric/Algebraic/Lattice.lean:87–98`: finite freeness and real scalar extension are fields of the native integral lattice predicate.
- `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:90–103`: symplecticity adds closedness and fiberwise nondegeneracy, not compactness or a measure.

The unchanged projector/unitary/convexity/Haar and other native API audit is inherited from [r7]. No new declaration or fully qualified name was added. The changed Check is in the README, where these small computations belong.

**Ownership and supplier refresh.** A focused `roadmaps grep` search and `roadmaps show GeometricQuantization` were run; the latter was checked against its supplied new-roadmap checkout. Its §3.1a still duplicates this folder's compact-real construction. The search also finds LieGroups' open revision, but that revision is not a supplier under the brief's existing-roadmap rule. The relevant board package search found no declared replacement gap. The broad unchanged ownership audit is carried from [r7]; this round does not claim a new full-repository mathematical review.

All direct supplier names and Needs lines were reread. The following current passages were reopened on supplied main, except GeometricQuantization at its supplied eligible open head. Existing-roadmap revisions were not substituted for main. These refresh the direct cited objects; the unchanged deeper supplier audit is inherited from [r7].

| Supplier | Passage reopened and consumed object |
| --- | --- |
| Family and HamiltonianReduction | `TauCetiRoadmap/SymplecticGeometry/README.md:25–44`, positive contraction and period 2π; `HamiltonianReduction/README.md:33–49,127–190`, R1/R2/R2a action, orbit, Hessian, regular/generic distinction and even-cell consequences; R3 reduction contract remains the unchanged supplier. |
| LieGroups | `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:261–273,300–356,383–405`, actual adjoint, differential/exponential, integration and tori/Weyl inputs. The changed Layer 1 citation now resolves; previous R07 is repaired. |
| RootSystems | `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:296–319`, abstract chamber/longest-element statements; it does not construct the compact-group map. |
| HopfRinow | `Completed/HopfRinow/README.md:521–529`, smooth-isometry transport of geodesics and exponentials. The Layer 1/Layer 4 separation remains correct. |
| GeometricQuantization | `TauCetiRoadmap/GeometricQuantization/README.md:519–563`, the competing rank-one construction; :1154–1156,1266–1267 supplies evidence of its return consumption of ConvexityToric. It is not added as a supplier. |
| SmoothBundlesConnections | `TauCetiRoadmap/SmoothBundlesConnections/README.md:776–800,1668–1704`, density/Liouville measure and dual-character/Hopf curvature +2π, class +1. |
| Orbifolds | `TauCetiRoadmap/Orbifolds/README.md:296–319,419–446`, represented bundles and O4-T classifying comparison. At :425–427 the generic input is supplied character data, not ConvexityToric's subsequent geometry. |
| MorseTheory | `TauCetiRoadmap/MorseTheory/README.md:611–640`, M5 normal Hessians, smooth spectral normalization and oriented/twisted negative-bundle attachments. |
| CharacteristicClasses | `TauCetiRoadmap/CharacteristicClasses/README.md:150–154,511–533`, assignment of general Hamiltonian perfection here and universal torus models with standard-character class −h. |
| AlgebraicTopology | `TauCetiRoadmap/AlgebraicTopology/README.md:946–962`, Stage 6 foundational cohomology/products preceding manifold duality. |
| DifferentialGeometry | `TauCetiRoadmap/DifferentialGeometry/README.md:268–280,503–516,782–793`, forms, integration and de Rham carriers. |
| HeegaardFloer | `TauCetiRoadmap/HeegaardFloer/README.md:2081–2105`, §4.1 Darboux and native contraction/form comparison; the equivariant application remains here. |
| GeometricTopology | `TauCetiRoadmap/GeometricTopology/README.md:177–222`, Layer 1 manifold/tubular floor, unchanged. |
| SchubertGeometry | `TauCetiRoadmap/SchubertGeometry/README.md:38–45,107–111`, actual all-word spaces, compact factors and complex/smooth realization; the moment polygon remains this folder's application. |
| ComplexKahlerGeometry | `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1444–1453`, K7.2 positive FS of line area 1. |
| Majorization and AnalyticToricGeometry | `TauCetiRoadmap/OperatorTheory/Majorization/README.md:153–166`, forward Schur inequalities; `Completed/AnalyticToricGeometry/README.md:186–201`, native integral lattices. Neither owns the reverse Schur–Horn or symplectic classification headline. |

Main MorseTheory and CharacteristicClasses were also read as roadmap-shape examples. The family convention remains ω=−dλ and ι_Xω=df. The new adjoint Check agrees with HamiltonianReduction's dχ=iα root-plane convention and with both roadmaps' SU(2)/SO(3) normalizations. No dependency was moved or added.

## Not verifiable

- The source limitations in [r7] remain: Kirwan, *Cohomology of quotients*, Part I §§4–5 pp. 44–78, and Condevaux–Dazord–Molino were not legally obtained by the earlier sources-service searches; Atiyah's DOI landing page returned 403; Guillemin–Sternberg, Kirwan convexity III and Duistermaat–Heckman originals were publisher-only/uncertified. Their passages are unchanged and are not newly certified here.
- HNP pp. 141–143 retain [r7]'s carried image verification; its other unchanged passages retain the extraction limitations recorded there.
- The provenance manifest is still absent (R05). The only source refreshed this round was legally retrieved; no new missing-text request was necessary and no manifest was edited.
- Elaborations and computed instances do not prove the admitted headlines. This is the requested incremental review, with explicitly inherited evidence for unchanged mathematics and companion repairs.

## Source issues

The ten entries below are carried from [r7]. The Conrad angular-factor misprint was rechecked in this round's retrieved text. No new source issue is asserted.

- **Error** in cannas at Theorem 30.3, printed p. 191 (cannas lines 7186–7226): the source says every proper Hamiltonian torus pushforward has a Lebesgue polynomial density; it should require effectiveness or the appropriate affine support; affects a stated result.
- **Error** in escobar at §4.1, printed p. 13 (escobar lines 480–484): the source says a general point has a Weyl-conjugate fundamental-weight moment value; it should restrict that claim to torus-fixed points, allowing convex combinations otherwise; affects a stated result.
- **Misprint** in escobar at §4.1, printed p. 13 (escobar lines 485–488): the source says the product moment map sums embedding-after-moment compositions; it should sum moment-after-embedding compositions; affects a stated result.
- **Misprint** in escobar at §4.1, printed p. 12 (escobar lines 459–464): the source says the kth embedding component uses an unbound product index and factor-position parabolic; it should use the cumulative product through k and the kth word letter's parabolic; affects a stated result.
- **Misprint** in lerman at Theorem 1.1(2), printed preprint p. 3 (lerman lines 131–135): the source says the extended flow takes every time into the critical component; it should take values in the stable stratum, with its infinite-time endpoint in the critical component; affects a stated result.
- **Gap** in lerman at the proof after Lemma 2.2, printed preprint p. 4 (lerman lines 180–183): the source says properness places a narrow critical-value band near the selected critical component; it should establish trapping and eventual entry on that component's stable stratum; affects the proof.
- **Error** in cannas at §29.3, printed p. 186 (cannas lines 7036–7040): the source says the quotient torus has a section through every point stabilizer; it should choose a vertex stabilizer for the splitting, since interior stabilizers are trivial; affects the proof.
- **Misprint** in conrad at Appendix Q.1 before Lemma Q.1.1, printed pp. 248–249 (conrad lines 11283–11289): the source says a real circle generator acts on complex root lines by real integer eigenvalues; it should retain the imaginary factor, with eigenvalues 2πin for unit-period coordinates or in for angular coordinates; affects the proof.
- **Misprint** in hnp at §2 after Lemma 2.1, printed p. 142 (hnp lines 527–529): the source says the generalized equivariant argument concerns groups that necessarily preserve the symplectic form; it should say groups that do not necessarily preserve it, allowing the stated sign character; affects nothing.
- **Error** in hnp at Proposition 1.16(ii), printed p. 139 (hnp lines 420–435): the source says proper linear projections preserve the extreme-point set exactly; it should assert only Ext(φ(C))⊆φ(Ext(C)); projecting the unit square by x+y gives {0,2}⊊{0,1,2}; affects a stated result.
