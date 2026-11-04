# Review of ConvexityToric (pull request #1651 at 319049e)
Folder: `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/`

**Verdict:** needs changes

## R01 (P2) — Give the compact rank-one construction one owner

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:118–139`: “construct the normalized compact rank-one comparison on its actual Lie algebra”; ownership is also asserted at lines 24–25.

**Claim:** The construction is still planned here and in another eligible open roadmap. The unchanged target therefore retains the ownership conflict.

**Witness:** `TauCetiRoadmap/GeometricQuantization/README.md:519–545`, §3.1a at its supplied open head, constructs the same invariant metric, compact root planes, calibrated su(2) map, integrated SU(2) homomorphism, central kernel, reflection and conjugation laws.

**Repair:** Remove the duplicated construction from this folder and coordinate one common earlier owner for both roadmaps. A concrete acyclic choice is a registered `normalized-compact-rank-one` gap supplied by LieGroups Layer 6, with the precise compact-group/character/map/differential contract in both the design's gaps and the matching README supplier subsection. Keep this folder's period/weight and lattice comparisons as applications. GeometricQuantization §3.1a should consume that same owner. Do **not** simply add GeometricQuantization as a supplier: its §§6.3–6.4 already consume ConvexityToric T1/T4 (`GeometricQuantization/README.md:1154–1156,1266–1267`), which would introduce a return edge. Its standalone rank-one subsection currently has no ConvexityToric input.

**Test of the repair:** The common contract must give dφ(H)=H and α(H)=2 for SU(2), dφ(H)=2Z and kernel {I,−I} for SU(2)→SO(3), and an empty root family for a torus. Both roadmaps specify exactly these values. A single supplier preserves all three cases and the full generality. LieGroups' unmerged revision is evidence of coordination, not an available replacement for its main-branch contract.

## R02 (P3) — Use the prescribed imports in the companions

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/BottSamelsonMomentTargets.lean:1–4` and `FixedLocusTargets.lean:1–4`.

**Claim:** The listed acceptance files use the required import form.

**Witness:** Both files contain four Mathlib submodule imports and neither contains `import Mathlib`. The worker's scanner does not include these companion violations in its passing result.

**Repair:** Delete the redundant companions as in R06, or replace each retained import block with the single `import Mathlib` and only needed pinned Tau Ceti imports. The fixed-locus scratch probe with that replacement elaborates under default options; the polygon replacement's successful test is inherited from [r6]. No mathematical hypothesis changes.

## R03 (P3) — Remove the companion option override

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/BottSamelsonMomentTargets.lean:11`: `set_option autoImplicit false`.

**Claim:** This file meets the acceptance-file option rule.

**Witness:** The explicit option override remains unchanged in a file covered by this brief, despite the worker scanner reporting `set_option=0`.

**Repair:** Delete this line, or delete the redundant companion. The default-option polygon elaboration carried forward in [r6] already verifies that the two signatures need no override; their positive-weight assumptions are unchanged. This retains the previous report's P3 policy classification.

## R04 (P3) — Delete invariant-subspace stability padding

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/FixedLocusTargets.lean:18–21`: `theorem invariants_stable`.

**Claim:** This calculation is a headline acceptance statement.

**Witness:** A fresh scratch probe closes it with `exact fun v hv k => (hcomm k v).trans (congrArg J (hv k))`; Lean exits 0. Invariant membership is the fixed-vector equation at the pin.

**Repair:** Delete it from `Suggested.lean`/the companion acceptance material, retaining the README API statement. Do not prove it in place. For trivial, cyclic and S₃ representations the identical calculation is ρ(k)Jv=Jρ(k)v=Jv; no geometric fixed-locus theorem is tested.

## R05 (P3) — Record the source provenance

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:903–931` (references); the folder has no `sources.toml`.

**Claim:** The cited works have the required one-entry-per-work provenance records.

**Witness:** The folder still has no source manifest. The Conrad–Landesman and HNP locators can be fetched legally, but the records are not present in the roadmap.

**Repair:** Add the source manifest with the existing work keys, exact versions/locators, legal provenance, and explicit uncertified entries for publisher-only texts. The HNP and HopfRinow locator corrections from the earlier review are repaired: HNP Lemmas 2.1–2.2 give the local formula, and HopfRinow Layer 4 gives isometry transport. The corrected formula still yields −(q²+p²)/2 for weight +1 and the disk exponential test gives (0,1/2) on both sides.

## R06 (P3) — Remove the stale companion catalogue

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/BottSamelsonMomentTargets.lean:6–16,35–54` and `FixedLocusTargets.lean:6–13,24–43`: “These targets describe the linear and chart steps”.

**Claim:** The companions satisfy the same headline-only, namespace, documentation and README correspondence requirements as Suggested.

**Witness:** The polygon companion repeats Suggested's two theorems and five supporting declarations under a second namespace. The fixed-locus companion states intermediate results; Suggested:18–19 already explains why the geometric headline cannot yet be stated.

**Repair:** Delete the redundant polygon companion and retain the fixed-locus proof steps in the README API. Any independently justified retained headline must satisfy the full form rules and README correspondence. Deleting the companions preserves all six Suggested headlines, the eight-flag/six-vertex test and the §1.2 fixed-locus specification.

## R07 (P3) — Cite Layer 1 for the adjoint representation

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:170`: “LieGroups Layers 2–4 and 6 (adjoint representation, Lie integration and maximal tori)”; repeated in the Layer 1 dependency summary at line 282.

**Claim:** The listed layers supply the adjoint representation used for averaging and root characters.

**Witness:** Main `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:261–273` puts Ad, its differential ad and conjugation identities in Layer 1. Layer 2 starts the closed-subgroup theorem at line 275.

**Repair:** Include LieGroups Layer 1 explicitly in the exact contract and these Needs/dependency lines. On SU(2), conjugation by diag(e^(it),e^(−it)) multiplies E₁₂ by e^(2it); differentiating gives 2iE₁₂. Layer 1 supplies precisely this group-to-algebra comparison. This is a locator correction, not an unowned prerequisite.

## Previous findings

- R01 — not repaired: README:118–139 still constructs the compact rank-one map; GeometricQuantization §3.1a still constructs the same object. This report retains R01.
- R02 — not repaired: both companion files:1–4 still use Mathlib submodule imports without the required root import.
- R03 — not repaired: BottSamelsonMomentTargets.lean:11 still contains the option override.
- R04 — not repaired: FixedLocusTargets.lean:18–21 still admits invariant-subspace stability; the one-term proof succeeds again.
- R05 — not repaired: README:903–931 still lists the references without a sources.toml in the folder.
- R06 — not repaired: both companion files still contain the duplicate polygon catalogue or intermediate fixed-locus targets and stale module descriptions.
- R07 — not repaired: README:170,282 still cites LieGroups Layers 2–4 and 6 for an adjoint construction located in Layer 1.

## Verified sound

🤖 Incremental AI re-review of **0 changed lines since 1e71d0f**. All four reviewed files and both library pins are unchanged. All seven previous findings remain: one P2 and six P3. No repair introduced a new ConvexityToric defect because no repair changed this folder. The previous report is cited explicitly for unchanged mathematical/source evidence; this is not a repeated full review. No supplied repair report settles any of these findings as not actionable.

[r6]: packages/ConvexityToric/reports/PRREVIEW-ConvexityToric~6.md

**Scope, pins and gate.** HEAD is 319049e28c2d0906358c62f61bd261ec6f91f3d4. Mathlib remains 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti remains a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Supplier main is 929496d4221b974c60787257a3cdc28b600fc49c. The excluding diff prescribed by the brief is empty, and the worktree is clean. The only changes since 1e71d0f are three authorized CotangentLagrangian files: README/Suggested edits and deletion of RelativeDarbouxTargets.lean. Its Witt-extension statement moves into Suggested with the same finite-dimensional, equal-dimension and restricted-form hypotheses; the identity specialization is removed. These edits do not change a ConvexityToric input or normalization. Their independent sibling review remains responsible for that folder's verdict.

The worker's scope-aware gate passes, including its targeted build:

```text
gate ConvexityToric: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The prescribed standalone gate was also rerun:

```text
gate ConvexityToric: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=4 source-material=0 FAIL
  outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md
  outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/Suggested.lean
  outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/AnnulusFixedPointTargets.lean
  outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md
```

Its four outside-folder lines are scope false positives: both sibling folders are expressly this pull request's own in the brief. There are no other scanner failures. The companion import/option defects R02–R03 are manual findings despite the scanner's zero counts. No acceptance is inferred from the scanner.

Fresh dependency output:

```text
depcheck: 205 roadmaps, 1627 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurs. The proposed direct GeometricQuantization import in R01 would add a return edge; the report does not add it.

**Elaboration and signatures.** A fresh targeted `lake build TauCetiRoadmap.SymplecticGeometry.ConvexityToric.Suggested` succeeds, 8988 jobs. Direct `lake env lean` of Suggested exits 0 with exactly six expected sorry warnings. A fresh scratch copy with `#check @name` for all **17 declarations** also exits 0. Comparing the printed types against README §§1.1, 3.1–3.3 and 5.1 finds no dropped binder: finite dimensionality, boundarylessness, Hausdorffness, compactness, connectedness, smoothness, effectivity, half-dimension, positive weights and calibrated exponential/period assumptions remain explicit where needed. All seven resolver leads are declarations in Suggested, not missing library APIs. A fresh fixed-locus probe using the required root import and the R04 exact term succeeds with only the other two sorry warnings. No source file was edited.

**Headline inventory.** The six statable headlines are torus convexity with preconnected fibers; two-sided Schur–Horn; the actual word121 incidence moment range; its finite convex hull; toric orbit fibers; and the Delzant property for the actual normalized period lattice. Suggested states all six. Its docstring identifies the missing carriers for the period/root comparison, equivariant local models, geometric fixed loci, equivariant perfection, Kirwan/Kostant convexity, norm-square deformation, Duistermaat–Heckman/class variation, reconstruction/cohomology and labeled classification. The unchanged headline one-tactic checks are carried forward from [r6]; the stability-padding success is freshly repeated.

**Seeded sources.** There are no changed source passages or new unverified locators. The following evidence for all ten seeded subsections is carried forward from [r6], including its limitations. None is presented as a fresh source fetch. No settled unavailable work was reopened or renamed.

| Target | Text/locator from [r6] | Carried result |
| --- | --- | --- |
| 1.1 | conrad lines 11244–11513, Appendix Q pp. 248–253; lines 11517–11602, Proposition R.2.1 pp. 254–256 | Compact rank-one and coroot comparison, with dχ=iα; ownership remains R01. |
| 1.2 | cannas Homework 21 exercise 2 p. 174 and Proposition 12.6 p. 70; hnp lines 461–559, Lemmas 2.1–2.2 pp. 141–143, including page-image inspection in [r6] | Invariant metric/polar method and local quadratic formula, with the source's I=−J conversion. |
| 2.1 | cannas lines 6663–6724, Homework 21 exercises 3–5, pp. 174–175; Kirwan Part I §§4–5, pp. 44–78 | Critical-set/closure, even Hessian and connected-level route checked. Kirwan's rational equivariant-perfection text could not be obtained; no certification of that locator. The coadjoint application is unchanged; its supplier was reopened. |
| 3.1 | cannas lines 6472–6528, Theorem 27.1 pp. 169–170; hnp lines 769–828, Theorems 3.10/4.1 pp. 149–151; lmtw lines 45–50, Theorem 1.1 v1 p. 2 | Compact/connected and proper/local-convexity/local-fiber hypotheses align. LMTW's stronger proper-orbifold result supplies the compact case; its opposite moment sign is explicit at lines 108–112. |
| 3.1, norm-square headline | lerman lines 117–175 and 180–225, Theorem 1.1 and proof, v2 pp. 3–5 | Proper moment map, invariant dual norm, gradient inequality and finite-length estimate checked. The README explicitly supplies trapping/uniform tails rather than copying the source's unjustified energy-band step. |
| 3.2 | cannas Theorem 27.1, lines 6472–6479, applied to the compact orbit; Majorization MAJ-A18–A25 | Convex-hull input supports the compact Kostant application. Unitary/projector computations below checked the matrix identification and repeated/empty spectra. |
| 3.3 | escobar lines 301–314, §3.2 p. 8; lines 450–500, §4.1 pp. 12–13; cannas Theorem 27.1 | Projector sum, product embedding and fixed-image convex hull checked. The weighted signs and inequalities are the roadmap's own application and were independently computed; source errors are listed below. |
| 4.1 | cannas lines 7177–7251, Definitions 30.1–30.2/Theorem 30.3 pp. 191–192; moerdijk lines 457–514 §§4.1–4.4; van-den-berg-moerdijk lines 116–134 §2 | Density pushforward and groupoid models checked. The README correctly adds effectiveness/affine support to avoid the overbroad source DH assertion. Generic comparisons remain Orbifolds' targets. |
| 4.2 | cannas lines 7320–7358, Proposition 30.7/Theorem 30.8 pp. 194–195; lines 7359–7395 §30.3 | Left/right connection conversion, curvature sign and top-power polynomial checked. Arbitrary reduced classes remain real, and full ineffective isotropy is retained. |
| 5.1 | cannas lines 6730–6735, Definition 28.1 p. 177; 6768–6788 p. 178; 6822–6840 Theorem 28.2 pp. 179–180; §§29.1–29.3 pp. 183–185; delzant lines 239–246, Theorem 2.1 p. 320, and lines 438–450, §3 pp. 325–326 | Smooth integral vertex/facet dictionary, quotient and classification checked, with inward/outward and period conversions computed below. |
| 5.2 | lerman-tolman lines 73–97, Definitions 1.2–1.4/Theorem 1.5, v1 pp. 2–3 | Compact connected effective half-dimensional orbifold and labeled-polytope scope agree. Weighted slices, periods, coarse power map and areas recorded below. |

**Adversarial table — 154 rows.** All 151 unchanged rows A01–A124, B01–B05 and C01–C22 retain their computed values and cite [r6] individually. Three fresh rows check the authorized sibling delta. There are no changed ConvexityToric statements. The table covers all ten seeded targets, all six statable headlines and every target touched by a finding.

| Statement | Instances tried | Computed values on both sides | Result / change |
| --- | --- | --- | --- |
| A01 Period lattice and characters | S¹, k=0,1,2 | exp(2π)=1; real differentials 0,1,2; normalized lattice ℤ, period lattice 2πℤ | Pass on the stated instances; inherited [r6]. |
| A02 Duality/product of characters | χ₂χ₃ | χ₂χ₃=χ₅; differentials 2+3=5 | Pass on the stated instances; inherited [r6]. |
| A03 Restriction/quotient lattice | Diagonal S¹⊂T²; quotient (s,t)↦s−t | Weight (2,3) restricts to 5; quotient kernel ℤ(1,1), quotient lattice ℤ | Pass on the stated instances; inherited [r6]. |
| A04 Rank-one calibration | SU(2), H=diag(i,−i); zero map | α(H)=2 and exp(2πH)=1; zero derivative pairs to 0 | Pass on the stated instances; inherited [r6]. |
| A05 Central isogeny | SU(2)→SO(3) | Kernel {±1}, order 2; same Lie algebra, torus period lattice index 2 | Pass on the stated instances; inherited [r6]. |
| A06 Full lattice versus splitting | U(2); rank zero | det[(1,1),(1,−1)]=−2, index 2; (1,0) needs half coefficients; rank-zero lattice {0} | Pass on the stated instances; inherited [r6]. |
| A07 Haar convention/basis change | ℤ basis 1, then −1 | Fundamental intervals both have length/mass 1; period interval length 2π | Pass on the stated instances; inherited [r6]. |
| A08 HamiltonianTorusData contraction | ℂ, positive rotation at (1,0), v=(1,0) | ω((0,1),(1,0))=−1=d(−r²/2)(v); positive quadratic gives +1 | Pass on the stated instances; inherited [r6]. |
| A09 Reversal and constant shift | Reversed circle, moment r²/2+7 | At (1,0), both contraction and differential are +1; constant contributes 0 | Pass on the stated instances; inherited [r6]. |
| A10 Products and restriction | Two rotation planes; diagonal circle | Moment (−r₁²/2,−r₂²/2) restricts to −(r₁²+r₂²)/2; contractions add identically | Pass on the stated instances; inherited [r6]. |
| A11 Smoothness/junk derivative | Constant point action; nonsmooth candidate | Point derivatives and contraction are 0; raw mfderiv may be 0 off differentiability, but moment/action smoothness are explicit fields | Pass on the stated instances; inherited [r6]. |
| A12 Fixed-set definition/closedness | Trivial group; irrational rotation on first ℂ² factor | Fixed sets ℂ² and {0}×ℂ; tangent real dimensions 4 and 2 | Pass on the stated instances; inherited [r6]. |
| A13 Preserved metric is necessary | Shear (q,p)↦(q+p,p) | Fixed line p=0 has restricted ω=0; nth derivative sends e₂ to ne₁+e₂, squared norm has positive n² coefficient | Pass on the stated instances; inherited [r6]. |
| A14 Polar complex structure | g Euclidean, ω=dq∧dp | A=[[0,−1],[1,0]], −A²=Id, J=A; J²=−Id, ω(e₁,Je₁)=1; −J gives −1 | Pass on the stated instances; inherited [r6]. |
| A15 Polar scaling/smoothness model | ω=2dq∧dp | A=2J₀, (−A²)^(−1/2)=Id/2, J=J₀; ω(e₁,Je₁)=2 | Pass on the stated instances; inherited [r6]. |
| A16 Invariant-subspace stability | Trivial/C₂/S₃ permutation actions on doubled real representation; J swaps the two copies with a sign | ρ(k)Jv=Jρ(k)v=Jv; each side equal for every fixed v | Mathematics passes; padding R04 freshly confirmed. Values inherited [r6]. |
| A17 Invariant form nondegeneracy | Same S₃ action on ℝ³⊕ℝ³ | Fixed subspace span((1,1,1),0),span(0,(1,1,1)); restricted ω matrix [[0,3],[−3,0]], determinant 9 | Pass on the stated instances; inherited [r6]. |
| A18 Exponential-chart fixed iff | Euclidean chart Id, C₂ acts −Id | e(−v)=−e(v); fixed point iff v=0 iff v∈invariants | Pass on the stated instances; inherited [r6]. |
| A19 Common ball and tangent inclusion | Irrational first-plane rotation, ball radius r>0 | Every rotation preserves norm r; common invariant tangent is second plane, exp is Id in this model | Pass on the stated instances; inherited [r6]. |
| A20 Symplectic normal/naturality | Fixed {0}×ℂ⊂ℂ²; exchange coordinates | Normal first ℂ, restricted form standard on second ℂ; exchange swaps both descriptions | Pass on the stated instances; inherited [r6]. |
| A21 Total geodesy | Euclidean fixed second plane | Geodesic (0,v)t stays in fixed plane; normal acceleration 0 | Pass on the stated instances; inherited [r6]. |
| A22 Compact averaging | Rotate an anisotropic metric diag(2,1) | Circle average=(3/2)Id; positive eigenvalues 3/2,3/2 | Pass on the stated instances; inherited [r6]. |
| A23 Equivariant Darboux/relative normal model | Linear weight-one plane; fixed plane times rotating plane | Identity chart preserves dq∧dp and action; normal bundle is the rotating factor | Pass on the stated instances; inherited [r6]. |
| A24 Local quadratic moment | Weights +1,−1,0 | μ=−r²/2,+r²/2,constant; Hessians −Id,+Id,0; indices 2,0,0 | Pass on the stated instances; inherited [r6]. |
| A25 Local cone/stabilizer/rank | Weight +1 at 0 versus nonzero z | Cone μ(0)−ℝ≥0; stabilizer S¹ at 0, {1} away; orbit ranks 0 and 1 | Pass on the stated instances; inherited [r6]. |
| A26 Nonfixed orbit slice | Free circle on cylinder, μ=p | Local coordinates (θ,p), image an interval, fiber a circle locally an arc; no slice weight part | Pass on the stated instances; inherited [r6]. |
| A27 Moment critical-set closure | ξ irrational in T²; ξ=0 | Closure=T² versus {1}; critical sets M^T versus M; zero Hessian in ξ=0 case | Pass on the stated instances; inherited [r6]. |
| A28 Generic Hessian/even index | Sphere height | Two critical Hessians definite with indices 0 and 2; no index 1 | Pass on the stated instances; inherited [r6]. |
| A29 Scalar critical/regular level connectedness | Sphere heights c=0,±1,2 | Fibers circle, point, empty; all preconnected | Pass on the stated instances; inherited [r6]. |
| A30 Ordinary Morse attachments | Sphere, negative ranks 0,2 | Cells D⁰,D², cellular differentials 0; Betti (1,0,1) | Pass on the stated instances; inherited [r6]. |
| A31 Isolated-fixed-point consequences | CP² versus trivial action on T² | CP² indices 0,2,4, ranks (1,1,1), π₁=0; T² has b₁=2 | Pass on the stated instances; inherited [r6]. |
| A32 Coadjoint generic heights | SU(2) nonzero orbit; central orbit | W-orbit has 2 points with indices 0,2; central orbit has 1 point of index 0 | Pass on the stated instances; inherited [r6]. |
| A33 Universal torus/Borel construction | Rank-zero torus; point with S¹ | M_T=M, BT=point versus point_T=BS¹ and H*=ℤ[u] | Pass on the stated instances; inherited [r6]. |
| A34 Chern/Euler weight sign | Circle characters 0,1,2 | Euler classes 0,u,2u, where u=−h; weight 2 gives −2h | Pass on the stated instances; inherited [r6]. |
| A35 Equivariant pullback/restriction | Fixed point inclusion in S² | Projection classes u pull back to u; ordinary restriction sends positive-degree base u to 0 | Pass on the stated instances; inherited [r6]. |
| A36 Localization and Euler nonzerodivisor | Weight-one normal line versus zero-weight tangent | Multiplication by u injective in ℚ[u], invertible after localization; zero Euler multiplication is 0 | Pass on the stated instances; inherited [r6]. |
| A37 Perfection/formality | Standard S¹ on S² | Equivariant module ℚ[u]⊕ℚ[u][−2]; ordinary Betti polynomial 1+t² equals sum of two critical contributions | Pass on the stated instances; inherited [r6]. |
| A38 Torus convexity headline | Point, trivial torus | Range={0}, hull of fixed image={0}; fiber at 0 singleton | Pass on the stated instances; inherited [r6]. |
| A39 Ineffective torus action | Trivial circle on S² | Image={c}, affine dimension 0, fixed-image hull={c}; whole-sphere fiber connected | Pass on the stated instances; inherited [r6]. |
| A40 Torus convexity/off-image | Standard sphere, μ=h | Image/hull=[−1,1]; c=2 fiber=∅, preconnected | Pass on the stated instances; inherited [r6]. |
| A41 Product/subtorus/shift images | S²×S²; diagonal circle; shift +3 | Product square [−1,1]², diagonal projection [−2,2], shifted interval [1,5] | Pass on the stated instances; inherited [r6]. |
| A42 Effective dimension/isotropic orbits | Sphere; product of spheres | Generic orbit dimensions 1,2; ω on orbit tangents 0; image dimensions 1,2=half manifold dimension | Pass on the stated instances; inherited [r6]. |
| A43 Coisotropic regular levels | Circle on ℂ², positive diagonal moment | Level dimension 3; kernel of restricted ω dimension 1; reduced dimension 2=4−2 | Pass on the stated instances; inherited [r6]. |
| A44 Local-to-global hypotheses | Identity ℝ→ℝ; circle cylinder μ=p | Closed convex image ℝ; fibers point or S¹ connected; compact interval preimages compact for cylinder | Pass on the stated instances; inherited [r6]. |
| A45 Nonabelian full image/chamber | SU(2) orbit of radius r>0 | Full image S²_r excludes midpoint 0; chamber image {r}; orbit-projected fiber is whole connected sphere | Pass on the stated instances; inherited [r6]. |
| A46 Rational directions versus supports | Circle sphere shifted by √2 | Interval endpoints √2±1, primitive normals ±1 still integral | Pass on the stated instances; inherited [r6]. |
| A47 Cross-section model | SU(2) sphere | Positive-chamber cross-section is one point with zero form; K-saturation recovers sphere | Pass on the stated instances; inherited [r6]. |
| A48 Norm-square gradient inequality | p(x)=x⁴ | ‖∇p‖=4‖x‖³=4‖p‖^(3/4); p=0 gives both 0 | Pass on the stated instances; inherited [r6]. |
| A49 Gradient semiflow/finite length | x′=−4x³, x₀>0 | x(t)=x₀/√(1+8x₀²t); total length x₀; bound p(x₀)^(1/4)/(4·1/4)=x₀ | Pass on the stated instances; inherited [r6]. |
| A50 Uniform tails/stratum limit | Same flow, 0≤x₀≤R | Tail x(t)≤1/√(8t), uniformly tends to 0; limit and retraction are 0 | Pass on the stated instances; inherited [r6]. |
| A51 Need trapping, not only energy band | Sphere f=h², C=north pole | f(north)=f(south)=1; any energy band about 1 includes south, outside a small north neighborhood | Pass on the stated instances; inherited [r6]. |
| A52 Product gradient convention | f=x⁴+y⁴, product Euclidean metric | ∇f=(4x³,4y³); separate flows give product limit (0,0) | Pass on the stated instances; inherited [r6]. |
| A53 Kostant projection | SU(2) sphere | Torus projection [−r,r]=conv{−r,r}, Weyl reflection swaps endpoints | Pass on the stated instances; inherited [r6]. |
| A54 Matrix pairing sign | H=diag(2,0), X=i diag(θ₁,θ₂) | −i tr(HX)=2θ₁; diagonal moment evaluates to 2θ₁ | Pass on the stated instances; inherited [r6]. |
| A55 Schur–Horn, both inclusions n=2 | Spectrum (2,0), U first row (√t,√(1−t)) | Diagonal (2t,2−2t), 0≤t≤1; trace 2 and coordinates in [0,2] give exactly the segment hull | Pass on the stated instances; inherited [r6]. |
| A56 Repeated spectrum | (1,1) | UIdU*=Id; diagonal set and permutation hull both {(1,1)} | Pass on the stated instances; inherited [r6]. |
| A57 Empty/one-dimensional spectra | n=0; spectrum (a) | Both sets {()}; both sets {(a)} | Pass on the stated instances; inherited [r6]. |
| A58 Majorization comparison | λ=(2,0), d=(1,1) | Largest-entry sum 1≤2, total sums 2=2; squared sums 2≤4 | Pass on the stated instances; inherited [r6]. |
| A59 Rank-one simplex | Projector onto z∈ℂⁿ, ‖z‖=1 | Diagonal ‖zᵢ‖²≥0, sum 1; prescribed simplex coordinates xᵢ realized by zᵢ=√xᵢ | Pass on the stated instances; inherited [r6]. |
| A60 V3/projectorDiagonal | Zero, full, initial plane | Real dimensions of V3=6; projector diagonals (0,0,0),(1,1,1),(1,1,0), traces 0,3,2 | Pass on the stated instances; inherited [r6]. |
| A61 Normalized projector, non-example | span(e₁+e₂) | Diagonal (1/2,1/2,0), trace 1; unnormalized outer product gives (1,1,0), trace 2 | Pass on the stated instances; inherited [r6]. |
| A62 Initial-plane incidence | L₁=e₁ or e₃ | e₁∈span(e₁,e₂), e₃∉span(e₁,e₂) | Pass on the stated instances; inherited [r6]. |
| A63 Weighted moment trace/linearity | a=b=c=1; flag (e₁,12,e₂) | Moment (2,2,0), trace 4=1+2+1; doubling all weights gives (4,4,0), trace 8 | Pass on the stated instances; inherited [r6]. |
| A64 Diagonal-unitary invariance | Line span(e₁+e₂), diagonal phases | Projector diagonal remains (1/2,1/2,0) | Pass on the stated instances; inherited [r6]. |
| A65 KKS/FS sign and scale | CP¹ near e₁, w=x+iy | μ₁=1−‖w‖²+O(‖w‖⁴), tangent weight −1; σ(∂x,∂y)=−2=−2π·(1/π) | Pass on the stated instances; inherited [r6]. |
| A66 Product form restriction | Positive a,b,c; nonzero tangent to holomorphic incidence immersion | (−ω)(v,Jv)=2π(a‖v₁‖²+b‖v₂‖²+c‖v₃‖²)>0 | Pass on the stated instances; inherited [r6]. |
| A67 Actual torus versus ambient group | Diagonal scalars versus swapping e₂,e₃ | Scalars fix all subspaces; swap sends P₀=12 to 13 and fails incidence preservation | Pass on the stated instances; inherited [r6]. |
| A68 Effective kernel/complexity | All coordinate and mixed lines | Common diagonal phases force t₁=t₂=t₃; effective rank 3−1=2, complexity 3−2=1 | Pass on the stated instances; inherited [r6]. |
| A69 Eight fixed flags | L₁∈{e₁,e₂}; P coordinate containing it; L coordinate in P | 2·2·2=8 flags | Pass on the stated instances; inherited [r6]. |
| A70 fixedMoment row 1 | (e₁,12,e₁) | Weighted indicators sum to (a+b+c,b,0), exactly row 1 | Pass on the stated instances; inherited [r6]. |
| A71 fixedMoment row 2 | (e₁,12,e₂) | Sum (a+b,b+c,0), exactly row 2 | Pass on the stated instances; inherited [r6]. |
| A72 fixedMoment row 3 | (e₁,13,e₁) | Sum (a+b+c,0,b), exactly row 3 | Pass on the stated instances; inherited [r6]. |
| A73 fixedMoment row 4 | (e₁,13,e₃) | Sum (a+b,0,b+c), exactly row 4 | Pass on the stated instances; inherited [r6]. |
| A74 fixedMoment row 5 | (e₂,12,e₁) | Sum (b+c,a+b,0), exactly row 5 | Pass on the stated instances; inherited [r6]. |
| A75 fixedMoment row 6 | (e₂,12,e₂) | Sum (b,a+b+c,0), exactly row 6 | Pass on the stated instances; inherited [r6]. |
| A76 fixedMoment row 7 | (e₂,23,e₂) | Sum (0,a+b+c,b), exactly row 7 | Pass on the stated instances; inherited [r6]. |
| A77 fixedMoment row 8 | (e₂,23,e₃) | Sum (0,a+b,b+c), exactly row 8 | Pass on the stated instances; inherited [r6]. |
| A78 Fixed-label symmetry | Swap first two coordinates | Row permutation (1 6)(2 5)(3 7)(4 8); weighted coordinates swap exactly | Pass on the stated instances; inherited [r6]. |
| A79 Incidence image, nonfixed point | a=b=c=1; L₁=span(e₁+e₂), P=L₁⊕e₃, L=e₃ | μ=(1,1,2)=½(2,0,2)+½(0,2,2) | Pass on the stated instances; inherited [r6]. |
| A80 Hull versus inequalities, equal weights | (1,1,1) | Trace 4, bounds (3,3,2); vertices (3,1,0),(3,0,1),(2,0,2),(0,2,2),(0,3,1),(1,3,0) on both sides | Pass on the stated instances; inherited [r6]. |
| A81 Hull, unequal weights | (2,1,3) | Trace 7, bounds (6,6,4); six vertices (6,1,0),(6,0,1),(3,0,4),(0,3,4),(0,6,1),(1,6,0) on both sides | Pass on the stated instances; inherited [r6]. |
| A82 Hull, fractional weights | (1/2,3/2,2) | Trace 11/2, bounds (4,4,7/2); vertices (4,3/2,0),(4,0,3/2),(2,0,7/2),(0,2,7/2),(0,4,3/2),(3/2,4,0) | Pass on the stated instances; inherited [r6]. |
| A83 Interior-edge coefficients/collision | (1,1,1); (2,1,1) | Coefficients of row 6 are (1/2,1/2); (1/3,2/3); distinct image counts 7 and 8 | Pass on the stated instances; inherited [r6]. |
| A84 Six nonzero edges | General positive a,b,c | Consecutive primitive-root edge parameters b,c,a+b,c,b,a+c; all positive | Pass on the stated instances; inherited [r6]. |
| A85 Boundary a=0 | b=c=1 | Fixed values reduce to six permutations of (2,1,0); exceptional P¹ tangent has pulled-back form 0 | Pass on the stated instances; inherited [r6]. |
| A86 Liouville measure/scaling | Unit square, ω,2ω,−ω; point | Masses 1,2,1; point mass 1 from ω⁰/0!=1 | Pass on the stated instances; inherited [r6]. |
| A87 Restriction/product/invariance | Unit squares; map (x,y)↦(2x,y/2) | Product mass 1·1=1, determinant 1 preserves mass; half-square mass 1/2 | Pass on the stated instances; inherited [r6]. |
| A88 DH definition/local finiteness | μ=r²/2 on ℂ, interval [0,R] | Preimage disk radius √(2R), mass 2πR; bounded R gives finite mass | Pass on the stated instances; inherited [r6]. |
| A89 Absolute continuity/affine support | Height sphere; trivial circle on same sphere | Density 2π on [−1,1], total 4π; trivial action gives atom 4π at c | Pass on the stated instances; inherited [r6]. |
| A90 DH shifts/products | Sphere shift +3; two spheres | Support [2,4], same density 2π; product density (2π)² on square | Pass on the stated instances; inherited [r6]. |
| A91 Level principal bundle arrows | h:x→hx, t,k∈T | (ht)⁻¹hx=t⁻¹x; (tk)⁻¹x=k⁻¹(t⁻¹x) | Pass on the stated instances; inherited [r6]. |
| A92 Connection right/left normalization | Positive Hopf right circle; inverse left action | α(ξ_right)=1, α(ξ_left)=−1; opposite connection gives curvature −F | Pass on the stated instances; inherited [r6]. |
| A93 Classifier/Chern/real class | Hopf; c=√2 | ∫F/(2π)=1=h[CP¹], u[CP¹]=−1; [ω_c]=2π√2 h is real, not a rationality claim | Pass on the stated instances; inherited [r6]. |
| A94 Classifying versus coarse model | Point with C₂ isotropy | BC₂ versus point; H¹(BC₂;F₂)=F₂, H¹(point;F₂)=0; rational positive degrees vanish | Pass on the stated instances; inherited [r6]. |
| A95 Full-isotropy integration | Point isotropy k=1,2 | Full integrals 1,1/2; effective point integral 1; effective=k·full | Pass on the stated instances; inherited [r6]. |
| A96 Reduced-class variation sign | Hopf c₀=1,c=3 | [ω₃]−[ω₁]=4πh=(3−1)[F] | Pass on the stated instances; inherited [r6]. |
| A97 Contractible chamber/transport | Positive circle levels on ℂ² | Radial identification sends every quotient to CP¹; H² generator h unchanged, class 2πc h | Pass on the stated instances; inherited [r6]. |
| A98 Degree bound/reduced-volume density | Circle on ℂ², n=2,m=1 | vol(M_c)=2πc; density (2π)(2πc)=4π²c of degree 1=n−m | Pass on the stated instances; inherited [r6]. |
| A99 Wall/null-set behavior | Reversed circle on ℂ | Density 0 at negative regular values, 2π at positive ones; critical value set {0} has Lebesgue mass 0 | Pass on the stated instances; inherited [r6]. |
| A100 Common ineffective factor | Weights (k,k), c>0; k=2 | Effective area 2πc/k, full area 2πc/k²; for k=2: πc and πc/2; DH density π²c | Pass on the stated instances; inherited [r6]. |
| A101 Orthant/simplex/product volumes | ℂ² rectangle; CP² size c; S²×S² sides a,b | Masses 4π²RS, 2π²c², 4π²ab; agree with (2π)^n times Euclidean volumes | Pass on the stated instances; inherited [r6]. |
| A102 Toric fiber iff | Sphere latitudes and poles; point | Same height iff same circle orbit; poles have singleton fibers; point satisfies both sides | Pass on the stated instances; inherited [r6]. |
| A103 Interior freeness/face stabilizers | Sphere interval | Interior stabilizer {1}, endpoint stabilizer S¹; one orbit per fiber | Pass on the stated instances; inherited [r6]. |
| A104 Fixed vertices/rank-zero exception | Point; sphere; word121 | Point is fixed, vertex and interior; sphere endpoints not interior; word121 (2,2,0) fixed but not vertex | Pass on the stated instances; inherited [r6]. |
| A105 Facet presentation/pairing/region | N=ℤ→ℝ, normals ±1, supports 0,−1 | Pairings x,−x; region [0,1]; x=−1 fails first inequality | Pass on the stated instances; inherited [r6]. |
| A106 Translation/permutation/lattice isomorphism | Shift +2; exchange facets; basis −1 | Supports (2,−3) give [2,3]; facet exchange preserves set; x↦−x and normal↦−normal preserve pairing | Pass on the stated instances; inherited [r6]. |
| A107 Smooth vertex | Primitive versus doubled normals | Endpoint active basis ±1 spans ℤ; ±2 spans index-2 subgroup, so same interval fails smoothness | Pass on the stated instances; inherited [r6]. |
| A108 Exact active-facet count | Duplicate x≥0 at x=0 | Two active indices in dimension 1; no injective one-index list exhausts both | Pass on the stated instances; inherited [r6]. |
| A109 Delzant compact/full/irredundant | [0,1], {0}⊂ℝ, half-line, duplicate facet | Interval passes; singleton interior empty; half-line unbounded; duplicate lacks point with other copy strict | Pass on the stated instances; inherited [r6]. |
| A110 Empty facet list/rank zero | V=0 versus V=ℝ | Region singleton/univ in rank 0, empty basis valid; rank-one region ℝ is not compact | Pass on the stated instances; inherited [r6]. |
| A111 Delzant-image actual lattice | Sphere, exp(t)=e^(it), lattice ℤ; rescale exponential | Correct kernel exp(2πv)=1 iff v∈ℤ; exp(2it) has derivative 2 and is excluded by identity-derivative hypothesis | Pass on the stated instances; inherited [r6]. |
| A112 Quotient exact sequence | Interval [0,c], c>0 | ℤ²→ℤ sends (u,v)↦u−v, kernel diagonal ℤ; level r₁²+r₂²=2c, free diagonal circle | Pass on the stated instances; inherited [r6]. |
| A113 Reconstruction and orbit space | Same interval | Quotient CP¹, residual μ=r₁²/2∈[0,c], area 2πc; orbit quotient interval | Pass on the stated instances; inherited [r6]. |
| A114 Uniqueness/affine relabeling | Shift interval; reflect x↦−x | Shift adds constant to μ; reflection changes circle parameter θ↦−θ, not identity equivariance | Pass on the stated instances; inherited [r6]. |
| A115 Facet cohomology/symplectic class | Interval supports (0,−c) | D₁=D₂=h, D₁D₂=0; ring ℤ[h]/h²; −2πΣλ_jD_j=2πc h | Pass on the stated instances; inherited [r6]. |
| A116 Higher toric examples | CP², product, corner chop δ | Rings ℤ[h]/h³ and ℤ[x,y]/(x²,y²); chopped triangle area decreases δ²/2, volume by 2π²δ² | Pass on the stated instances; inherited [r6]. |
| A117 Weighted Hamiltonian flow/periods | Weights (2,3), ε>0 | Contraction d((2r₁²+3r₂²)/2); generic period 2π, axis periods π,2π/3 | Pass on the stated instances; inherited [r6]. |
| A118 Ellipsoid-to-sphere map | (2,3), ε=1 | Squared image norm=(2r₁²+3r₂²)/2=1 | Pass on the stated instances; inherited [r6]. |
| A119 First weighted slice | (2,3), ε=1 | Radius √(2/3), residual C₂ acts w↦−w; center stabilizer 2, off-center 1 | Pass on the stated instances; inherited [r6]. |
| A120 Second slice/overlap | (2,3), ε=1; (1,2) | Radius 1, C₃ multiplier exp(−4πi/3); overlap ambiguities exactly residual phases; order-one first chart for (1,2) | Pass on the stated instances; inherited [r6]. |
| A121 Coarse power map, both directions | (2,3), both axes and mixed points | [z₁³:z₂²] acquires common e^(−6iθ); invariant relative phase 3φ₁−2φ₂; poles [1:0],[0:1] | Pass on the stated instances; inherited [r6]. |
| A122 Slice reduced forms | First slice y₁=0; second y₂=0 | Pullback first/second coordinate area term vanishes, remaining form dx₂∧dy₂ or dx₁∧dy₁ | Pass on the stated instances; inherited [r6]. |
| A123 Weighted area | (2,3), ε=1 and 1/2; (1,1), ε=1/2 | (1/2)π·(2/3)=π/3; π/6; Hopf π, agreeing with 2πε/(ab) | Pass on the stated instances; inherited [r6]. |
| A124 Labeled classification/smoothness | Label 2 primitive cone; label 1 determinant-2 cone | Both have order-two local isotropy; label 1 and determinant 1 gives trivial isotropy | Pass on the stated instances; inherited [r6]. |
| B01 Canonical chart form and uniqueness | T*ℝ; u=(1,0), v=(0,1); coordinate change Q=2q, P=p/2 | Model and intrinsic values are 1=1; dQ∧dP=2·(1/2)dq∧dp=dq∧dp; equality at each chart centre determines every fiber | Pass on the stated instances; inherited [r6]. |
| B02 General cotangent-lift Hamiltonian identity | Scaling action q↦eᵗq, lift (q,p)↦(eᵗq,e⁻ᵗp), at (2,3) | Field (2,−3), H=pq=6; contraction on (a,b) is 2b+3a, dH(a,b)=3a+2b | Pass on the stated instances; inherited [r6]. |
| B03 Sign and rescaling negative controls | Translation on T*ℝ; test v=∂p; forms σ, −σ, 2σ | Canonical contraction=1=d(p)(∂p); opposite gives −1≠1; doubled gives 2≠1 and fails the chart identity | Pass on the stated instances; inherited [r6]. |
| B04 Trivial action and zero-dimensional base | Trivial action on ℝ; base a point | Field 0, H=0, contraction 0=dH; at a point tangent and dual are {0}, zero form has radical {0} and is nondegenerate | Pass on the stated instances; inherited [r6]. |
| B05 Chart-target guard | A chart with target (−1,1), centre 0, attempted coordinate w=2 | At 0 the prescribed pair evaluates 1=1; 2∉(−1,1), so the antecedent is false and no equation constrains the total inverse’s junk value | Pass on the stated instances; inherited [r6]. |
| C01 Invariant metric by averaging (§1.1) | SO(3) adjoint rotations of diag(2,1,3); SU(2) acts through SO(3) | Haar average is ((2+1+3)/3)Id=2Id; every rotated average is 2Id and all eigenvalues are 2>0 | Pass; shared construction ownership R01. Inherited [r6]. |
| C02 Center and semisimple splitting (§1.1) | u(2), su(2), abelian ℝ² | u(2)=iℝId⊕su(2), dimensions 1+3=4; su(2) center 0; abelian derived algebra 0. For central C and [X,Y], invariance gives B(C,[X,Y])=B([C,X],Y)=0 | Pass; real splitting does not assert an integral direct product. Inherited [r6]. |
| C03 Killing hypotheses on the complexified summand (§1.1) | su(2) basis H,A,B; torus | Each ad-basis square has trace −8, cross traces 0: real Killing matrix −8Id, determinant −512≠0; complexification remains nondegenerate. On a torus the summand is 0, radical {0} | Pass; not asserting nondegenerate Killing form on all u(2). Inherited [r6]. |
| C04 Cartan and split weights (§1.1) | sl₂(ℂ), diagonal h=−iH | ad(h) eigenvalues on (h,E₁₂,E₂₁) are (0,2,−2); centralizer of ℂh is ℂh, dimension 1; zero summand has Cartan dimension 0 | Pass; no real split-weight assumption on su(2). Inherited [r6]. |
| C05 Actual character/differential comparison (§1.1) | diag(e^(it),e^(−it)) conjugating E₁₂ | Character e^(2it), derivative 2i; real weight α(H)=2, hence iα(H)=2i. At t=π, character 1 although group element −I | Pass; distinguishes character kernel from group-map kernel. Inherited [r6]. |
| C06 Root dimension and sl₂ comparison (§1.1) | E=E₁₂, F=E₂₁, h=diag(1,−1) | Positive/negative root-space dimensions 1,1; [E,F]=h, [h,E]=2E, [h,F]=−2F. Compact H=ih has eigenvalues ±2i | Pass; matches both pinned complex declarations after the hypotheses are verified. Inherited [r6]. |
| C07 Metric-independent coroot and denominator (§1.1) | B(H,H)=c>0, α(H)=2; c=1,3 | α♯=(2/c)H, ‖α‖²=4/c>0; 2α♯/‖α‖²=H in both cases, α(H)=2 | Pass; arbitrary invariant rescaling cancels. Inherited [r6]. |
| C08 All three compact bracket identities (§1.1) | H=diag(i,−i), A=((0,1),(−1,0)), B=((0,i),(i,0)) | [H,A]=((0,2i),(2i,0))=2B; [A,B]=diag(2i,−2i)=2H; [B,H]=((0,2),(−2,0))=2A | Pass; exact matrix arithmetic recorded in [r6]. |
| C09 Calibration excludes wrong maps (§1.1 Checks) | Identity, zero map, proposed half-coroot | Pairings 2,0,1 respectively; exp(2πH)=I and exp(πH)=−I. Only identity has the required pairing 2; half-coroot has wrong period | Pass; the wrong models are excluded. Inherited [r6]. |
| C10 Integration and diagonal-circle image (§1.1) | SU(2) identity map at t=π/2,π,2π | Both φ(diag(e^(it),e^(−it))) and exp(tH) are H,−I,I respectively; all lie in the diagonal torus. Kernel is {I}⊂{I,−I} | Pass; same normalization in the proposed shared supplier. Inherited [r6]. |
| C11 Root reflection (§1.1 API) | U(2), X=diag(ix,iy), α(X)=x−y, α∨=diag(i,−i) | X−α(X)α∨=diag(iy,ix); conjugation by A swaps the two entries. At (x,y)=(2,−1), both yield (−1,2); center (1,1) stays fixed | Pass; source's dual character reflection agrees. Inherited [r6]. |
| C12 Torus conjugation and root-vector choice (§1.1) | SU(2), t=π/4, D=diag(e^(it),e^(−it)) | Ad_D A=B, Ad_D B=−A, Ad_D H=H; (A−iB)/2=E₁₂ becomes iE₁₂=e^(2it)E₁₂ | Pass; the map changes by conjugation, not a false choice-free identity. Inherited [r6]. |
| C13 Central quotient and actual differential (§1.1) | SU(2)→SO(3), angular generator Z of period 2π | dφ(H)=2Z; α_SO3(Z)=1, α_SO3(2Z)=2; t=π gives rotation 2π=1 but SU(2) element −I; kernel has 2 elements | Pass; no injectivity requirement or lost central kernel. Inherited [r6]. |
| C14 Empty roots and full integral lattice (§1.1) | Trivial group, S¹, U(2) | Root-family cardinalities 0,0; no norm denominator evaluated. In U(2), determinant of ((1,1),(1,−1)) is −2, index 2; (1,0) requires coefficients 1/2,1/2 | Pass; zero-rank and nonsplit integral cases retained. Inherited [r6]. |
| C15 Exponential transport (§1.2) | Euclidean plane, quarter-turn R, v=(1,0) | exp₀(dR₀v)=(0,1)=R(exp₀v); R preserves squared norm 1 | Pass; pinned isometry theorem has actual differential. Inherited [r6]. |
| C16 Incomplete-metric exponential transport (§1.2 Check) | Open unit disk, R as above, v=(1/2,0) | Segment stays inside disk; both sides equal (0,1/2), squared norm 1/4<1. A radial path can reach the boundary in finite time | Pass; completeness not needed. Inherited [r6]. |
| C17 HNP complex-structure/sign adapter (§1.2) | ω=dq∧dp, positive weight +1, v=(1,0) | README Jv=(0,1), source Iv=(0,−1); ω(Iv,v)=1. Source weight relative to I is −1, so half the weighted norm square is −1/2=README μ(v) | Pass; displayed source formula inspected on page image. Inherited [r6]. |
| C18 Local moment Hessian/cone after source correction (§1.2) | Weights +1,−1,0 at origin | μ=−r²/2,+r²/2,0; Hessians −Id,+Id,0 and indices 2,0,0; cones are nonpositive ray, nonnegative ray, {0} | Pass; unchanged general theorem, corrected supporting locator. Inherited [r6]. |
| C19 Imported coadjoint critical set and indices (§2.1) | SO(3) unit sphere, p=±Z, X=Z; SU(2) double cover | Supplier Hessian =−B at +Z and +B at −Z; indices 2,0. Wμ={+Z,−Z}, values +1,−1. Betti numbers (1,0,1) and χ=2 | Pass; consumed from R2a.2–4, no duplicate target. Inherited [r6]. |
| C20 Central coadjoint orbit (§2.1 Check) | μ central, including μ=0; arbitrary torus | Wμ={μ}, orbit dimension 0, Hessian on {0} nondegenerate, index 0; one 0-cell gives b₀=1, all other Betti numbers 0 | Pass; no forced two-point count. Inherited [r6]. |
| C21 Regular height versus distinct values (§2.1) | Product of two unit coadjoint spheres, X=(Z,Z), then (Z,2Z) | Both directions regular. First values are 2,0,0,−2; second are 3,1,−1,−3. Indices remain 4,2,2,0 | Pass; distinctness needs the supplier's additional finite hyperplane avoidance. Inherited [r6]. |
| C22 Imported versus independently reconstructed rank-one object (R01) | Both §1.1 and GeometricQuantization §3.1a on SU(2), SO(3), a torus | Both specify pairing 2, derivative H or 2Z, kernel sizes 1 or 2, and zero rank-one maps in the empty family; no differing mathematical output separates the two constructions | Duplicate ownership; use a common earlier supplier, preserving these values. Inherited [r6]. |

| D01 Sibling Witt-extension signature relocation | ℝ² with dq∧dp, S=T=span(e₁), f(e₁)=2e₁ | Restricted forms both 0; e=diag(2,1/2) extends f and ω(e e₁,e e₂)=2·(1/2)=1=ω(e₁,e₂) | Fresh computation: degenerate subspaces remain allowed; no ConvexityToric contract changes. |
| D02 Sibling added hypothesis controls | S=V=ℝ², f=2Id; ambient dimensions 2 versus 4 | ω(2e₁,2e₂)=4≠1, so hf fails; finrank equality 2=4 fails in the unequal-dimensional case | Fresh computation: both stated exclusions hold. |
| D03 Sibling zero-dimensional/identity specialization | V=W=0; V=W=ℝ², S=span(e₁), f=Id | At rank zero both forms evaluate 0=0 and the unique equivalence works; in the plane e=Id preserves ω(e₁,e₂)=1 and fixes S | Fresh computation: deleting the separate identity example loses no generality. |

**Pinned declarations reopened.** Six previously audited source files were read again at the pins:

- `Mathlib/RepresentationTheory/Invariants.lean:73–80`: invariants are exactly the vectors with ρ(g)v=v for every g; no topology or compactness is implicit. This justifies R04's one-term witness.
- `Mathlib/Algebra/Lie/Weights/Killing.lean:555–556,608–609`: the sl₂-triple existence and one-dimensional nonzero root-space declarations exist. Their complex Lie-algebra conclusions do not construct the compact group map claimed by both roadmaps.
- `TauCeti/Geometry/Manifold/Riemannian/Isometry/Basic.lean:44–52`: a RiemannianIsometry extends a smooth diffeomorphism and preserves tangent inner products.
- `TauCeti/Geometry/Manifold/Riemannian/Isometry/Exponential.lean:47–60,117–121`: finite-dimensional smooth Riemannian data, boundaryless models and Hausdorffness; actual differential in the exponential identity, no completeness assumption.
- `TauCeti/Geometry/Toric/Algebraic/Lattice.lean:87–98`: IsIntegralLattice has finite freeness and real base-change fields.
- `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:90–103`: IsSymplectic adds closedness and fiberwise nondegeneracy, not compactness or a measure.

The remaining unchanged native-projector/unitary/convexity/Haar/derivative audit is inherited from [r6]. The sibling's imported `TauCeti/Geometry/Symplectic/SymplecticTransport.lean:14–38` documents the actual transport and symplectomorphism predicates; the moved signature uses those carriers.

**Ownership and supplier refresh.** The focused `roadmaps grep` query for compact rank-one construction and su(2) homomorphisms returns ConvexityToric §1.1 and GeometricQuantization §3.1a. `roadmaps show GeometricQuantization` and its supplied checkout agree on that construction and its consumption of ConvexityToric. Searches of the relevant board packages and pinned libraries find no replacement owner that resolves R01. The unchanged broad ownership audit is inherited from [r6]; no new construction or fully qualified name was added in this folder.

All supplier names and Needs lines were reread. The following passages were reopened on the supplied main checkout, except GeometricQuantization at its supplied eligible new-roadmap head. Existing-roadmap revisions are not treated as suppliers. This refresh resolves the direct citations and the previous findings; it does not certify every internal prerequisite of every supplier.

| Supplier | Passage reopened and consumed object |
| --- | --- |
| Family and HamiltonianReduction | `TauCetiRoadmap/SymplecticGeometry/README.md:25–44`, positive contraction and period 2π; `HamiltonianReduction/README.md:33–49,127–190`, R1/R2/R2a action, orbit, Hessian, regular/generic distinction and even-cell consequences; R3 reduction contract remains the unchanged supplier. |
| LieGroups | `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:261–273,300–350,383–405`, actual adjoint, differential/exponential, integration and tori/Weyl inputs. The unchanged adjoint locator correction is R07. |
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
| GeometricTopology | `TauCetiRoadmap/GeometricTopology/README.md:177–221`, Layer 1 manifold/tubular floor, unchanged. |
| SchubertGeometry | `TauCetiRoadmap/SchubertGeometry/README.md:38–45,107–111`, actual all-word spaces, compact factors and complex/smooth realization; the moment polygon remains this folder's application. |
| ComplexKahlerGeometry | `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1444–1453`, K7.2 positive FS of line area 1. |
| Majorization and AnalyticToricGeometry | `TauCetiRoadmap/OperatorTheory/Majorization/README.md:153–166`, forward Schur inequalities; `Completed/AnalyticToricGeometry/README.md:186–201`, native integral lattices. Neither owns the reverse Schur–Horn or symplectic classification headline. |

Main MorseTheory and CharacteristicClasses were also reopened as shape examples. The family convention still has ω=−dλ and ι_Xω=df. The CotangentLagrangian edits preserve these signs; the unchanged IntegrableSystems positive-period comparison is inherited from [r6]. No newly changed ConvexityToric target requires an additional source or ownership audit.

## Not verifiable

- The source limitations recorded in [r6] remain: Kirwan, *Cohomology of quotients*, Part I §§4–5 pp. 44–78, and Condevaux–Dazord–Molino were not legally obtained by the earlier service searches; Atiyah's DOI landing page returned 403; the Guillemin–Sternberg, Kirwan convexity III and Duistermaat–Heckman originals were publisher-only/uncertified. This incremental review does not newly certify their locators.
- HNP pp. 141–143 retain [r6]'s image-verified evidence; unchanged other HNP passages retain that report's extraction limitations.
- The provenance manifest is still absent (R05). No manifest was edited and no new source request was needed for an unchanged passage.
- Elaborations and computed instances are not proofs of the admitted headlines. The sibling folder has its own review; this report checks its delta for scope and effects on ConvexityToric.

## Source issues

All ten entries below are carried forward from [r6]; no new source issue was found in this zero-line re-review.

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
