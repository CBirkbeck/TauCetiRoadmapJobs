# Review of ConvexityToric (pull request #1651 at c7860ab)
Folder: `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/`

**Verdict:** needs changes

Seven findings remain: one P1, one P2 and five P3. The blockers are the unregistered calibrated rank-one supplier contract and the duplicated coadjoint-height target. The authorized sibling update repairs neither. No new finding arises from that update.

🤖 Incremental AI re-review of 0 changed lines since `307ff10`. Git confirms that all four reviewed files and both library pins are unchanged. Only `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md` changed, by 33 added lines. This report checks that update and the existing findings, refreshes supplier citations and elaboration, and explicitly inherits unchanged mathematics from [r4]. It does not claim a second full review. No pull-request file was edited. No repair report marking a finding “not actionable in this package” was supplied or found.

[r4]: packages/ConvexityToric/reports/PRREVIEW-ConvexityToric~4.md

## R01 (P1) — Register or own the missing rank-one construction

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:91–99`, especially “Supplier gap: normalized-compact-rank-one”; consumed at lines 115–142.

**Claim:** Layer 1 can consume actual adjoint characters, real coroots and calibrated smooth maps SU(2)→G as an agreed supplier input.

**Witness:** No readable `packages/ConvexityToric/design/plan.json` exists. Main `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:383–405` supplies maximal tori and Weyl comparison, not this calibrated SU(2) construction. A prose gap heading alone does not meet the declared-gap contract.

**Repair:** Register `normalized-compact-rank-one` with supplier LieGroups, its section and the precise missing map/character/differential contract in the design's `gaps`, and use the matching `What LieGroups must provide (gap:normalized-compact-rank-one)` entry under its supplier subsection. Alternatively make the missing comparison an owned target here while importing existing torus theory. Do not treat LieGroups' open revision as main. This carries forward r4 R01; it does not object to properly declared gaps.

**Test of the repaired contract:** SU(2), H=diag(i,−i): the identity map has derivative H, root pairing 2 and exp(2πH)=1; the zero map has pairing 0 and must fail. SO(3) must allow the central order-two kernel; a torus must allow an empty root family. The prose now describes these data well enough to register them, but the ownership mechanism is missing.

## R02 (P2) — Consume the existing compact-orbit height theorem

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:279–281`: “For compact coadjoint orbits prove existence of a generic height with isolated fixed points via root tangent planes and torus-centralizer structure”.

**Claim:** This is a new Layer 2 construction.

**Witness:** Main `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/README.md:171–175`, R2a.3, already proves Crit(f_X)=Wμ for regular X, the root-plane index formula and generic distinct heights. R2a.4 supplies the even-cell consequences.

**Repair:** Remove this repeated construction and cite HamiltonianReduction R2a.2–4 in Scope and ownership, the exact contracts and the appropriate Needs line. Retain this folder's general Hamiltonian torus Morse–Bott/perfection theory. On the SU(2) orbit the supplier gives exactly two critical points, with indices 0 and 2; on a central orbit it gives one point with index 0. Both examples continue to work through the supplier, with no new proof target or upward edge.

## R03 (P3) — The companion imports still violate the acceptance form

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/BottSamelsonMomentTargets.lean:1–4` and `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/FixedLocusTargets.lean:1–4`: `import Mathlib.RepresentationTheory.Invariants` is one of eight submodule imports.

**Claim:** All listed Lean files satisfy the single-root-Mathlib import rule.

**Witness:** Neither companion contains `import Mathlib`; both have four Mathlib submodule imports. The passing worker gate does not detect these companion violations.

**Repair:** Delete redundant companion material as in R07, or give each retained acceptance file exactly `import Mathlib` plus only needed pinned Tau Ceti modules. A fresh scratch copy with `import Mathlib` and default options elaborated all ten companion declarations successfully. Its section scopes were kept separate from Suggested’s scoped notation.

## R04 (P3) — Remove the companion option override

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/BottSamelsonMomentTargets.lean:11`: `set_option autoImplicit false`.

**Claim:** The companion uses the required default Lean options.

**Witness:** This is an explicit option override in one of the files covered by the brief, despite the worker's `set_option=0` result for its scanned material.

**Repair:** Delete the line, or delete the redundant companion. The fresh scratch companion elaboration without it passed; its two polygon statements retain their positive-weight hypotheses and signatures.

## R05 (P3) — Delete invariant-subspace stability padding

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/FixedLocusTargets.lean:18–21`: `theorem invariants_stable`.

**Claim:** The pointwise commutation calculation belongs among headline acceptance statements.

**Witness:** The unchanged signature closes with `exact fun v hv k => (hcomm k v).trans (congrArg J (hv k))`. The fresh probe exits 0. `Representation.invariants` is precisely the fixed-vector equation at the pin.

**Repair:** Delete it from `Suggested.lean`/the companion acceptance material; keep the README API statement. Do not prove it in place. For trivial, cyclic and S₃ permutation representations, the same computation is ρ(k)Jv=Jρ(k)v=Jv, so it tests no geometric fixed-locus construction.

## R06 (P3) — Finish source provenance and correct the remaining locators

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:232–233`: “§27.1, proof of Theorem 27.1, pp. 170–171”; lines 84 and 235 cite HopfRinow Layer 1 for isometry transport. The folder still has no `sources.toml`.

**Claim:** The quadratic local moment formula and exponential transport are supplied at those exact locators, with recorded source versions/provenance.

**Witness:** Cannas lines 6502–6545 contain the convexity argument, not the quadratic normal form. HopfRinow's smooth-isometry transport is in `Completed/HopfRinow/README.md:521–529`, Layer 4, while Layer 1 supplies the exponential itself.

**Repair:** Add the one-entry-per-work manifest with legal provenance and explicit uncertified entries where appropriate. Cite HNP Lemmas 2.1–2.2, printed pp. 141–143, for the local model and weight formula, transporting its sign, and cite HopfRinow Layers 1 and 4 for the two distinct inputs. Keep the corrected Escobar locators and versioned LMTW/Lerman–Tolman citations. The local test remains μ=−(q²+p²)/2, Hessian −Id and index 2 for weight +1; rotating the tangent vector before or after the Euclidean exponential gives the same vector. Neither mathematical target needs narrowing.

## R07 (P3) — Remove the stale companion catalogue

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/BottSamelsonMomentTargets.lean:6–16,35–54` and `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/FixedLocusTargets.lean:6–13,24–43`: “These targets describe the linear and chart steps”.

**Claim:** These companions satisfy the same headline-only, namespace, declaration-documentation and README correspondence rules as Suggested.

**Witness:** The polygon companion repeats Suggested's two headlines and five supporting definitions under a second namespace. The fixed-locus companion states intermediate linear/chart results, while Suggested:18–19 correctly explains the missing geometric carrier. Their old module descriptions and namespaces remain.

**Repair:** Delete the redundant polygon companion and move the fixed-locus proof steps entirely into the README API; the genuine headline's missing-carrier explanation is already in Suggested. If keeping any independently justified headline, apply the complete form rules, give it a mathematical docstring and name it in the README. Removing these companions preserves all six Suggested headlines and the computed eight-flag/six-vertex test; the fixed-locus mathematics remains specified in §1.2.

## Previous findings

- R01 — not repaired: README:91–99 still labels the normalized rank-one input a supplier gap; no readable design plan registers its owner and contract. See R01.
- R02 — not repaired: README:279–281 still asks to prove generic coadjoint heights with isolated fixed points; HamiltonianReduction R2a.3–4 already owns that construction. See R02.
- R03 — not repaired: both companion files still begin with four Mathlib submodule imports and lack the required root import. See R03.
- R04 — not repaired: BottSamelsonMomentTargets.lean:11 still contains `set_option autoImplicit false`. See R04.
- R05 — not repaired: FixedLocusTargets.lean:18–21 still admits `invariants_stable`; the one-term proof succeeds again. See R05.
- R06 — not repaired: README:232–235 still uses the convexity proof for the quadratic local formula and HopfRinow Layer 1 for transport; `sources.toml` remains absent. See R06.
- R07 — not repaired: both unchanged companions retain their duplicate/intermediate statements, old module descriptions and namespaces. See R07.

## Verified sound

**Scope, gate and elaboration.** This head is `c7860ab6e3ef2bc06500be50d75677c787f38a6d`. Mathlib is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, and supplier main is `fa41b3747f56d4e77bd69e7099c1be4f2e4959ba`, all checked directly. The prescribed diff excluding the three authorized folders and family index is empty. The worktree is clean.

The worker’s scope-aware gate at this head passes:

```text
gate ConvexityToric: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The prescribed standalone gate was also rerun. Every emitted rule is zero except `outside-folder=5`; it exits 1 and emits these exact scope lines:

```text
outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md
outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/RelativeDarbouxTargets.lean
outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/Suggested.lean
outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/AnnulusFixedPointTargets.lean
outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md
```

These are scope false positives: the brief expressly names both sibling folders as this PR’s own. They are not unauthorized edits and do not add findings. The standalone invocation does not run a build unless requested; the permitted targeted build was run separately and completed successfully, 8988 jobs. Neither the tooling nor the merge order was changed. The automated gate does not catch the manual companion defects R03–R04.

Fresh direct `lake env lean` elaboration of Suggested exits 0 with exactly six `sorry` warnings. A scratch copy prints `#check @name` for all 17 declarations; the printed signatures were compared with the README. Compactness, connectedness, finite dimension, boundarylessness, smoothness, effectiveness, half-dimension, positive weights and the calibrated exponential/period hypotheses remain in scope. No binder change or loss was found. The seven resolver leads are local declarations in Suggested, not missing library inputs. A fresh default-option companion probe also succeeds, replacing only the stability admission by R05’s single `exact` term. The initial combined harness exposed a scoped-notation collision from concatenating files; closing their section scopes fixed the harness without changing any signature or repository file.

Fresh dependency output:

```text
depcheck: 205 roadmaps, 1592 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Every Needs line and supplier contract was reread. This does not resolve the unregistered ownership in R01 or the duplication in R02.

**Headline inventory and padding.** The six statable headlines remain torus convexity with preconnected fibers, two-sided Schur–Horn, the actual word121 incidence moment range, its exact finite hull, toric orbit fibers, and the Delzant property for the actual period lattice. All six remain in Suggested. Its docstring still names the missing carriers for period/root comparison, equivariant local forms and fixed loci, equivariant perfection, Kirwan/Kostant comparison, norm-square deformation, Liouville/DH/class variation, and smooth/labeled toric reconstruction and classification. The prior one-tactic failures for the six unchanged headlines are inherited from [r4]; the stability-padding success was rerun. No changed Lean statement required a new truth or padding probe.

**Changed sibling contract.** `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md:498–529,538` now supplies a specified canonical smooth form to HamiltonianReduction R1. Its coordinate identity matches the existing `canonicalForm_exists` at `CotangentLagrangian/Suggested.lean:59–64`, including membership in the chart target. The pinned `SmoothTwoForm.inChartAt_extChartAt_self` identifies each central chart value with the intrinsic form, hence the specified form is unique. For the lifted action, Cartan’s identity and preservation of λ give `ι_X(−dλ)=d(ι_Xλ)`; projecting the lifted field gives `H(q,p)=p(ξ_M(q))`. This uses C1’s form/lift and leaves the action momentum theorem with HamiltonianReduction R1:59–60. It adds no reverse dependency to ConvexityToric.

The sources service obtained the author’s Cannas text legally. The new locator is correct: **cannas lines 4267–4271**, §18.1 exercise, printed p. 106, states the cotangent-lift Hamiltonian identity with `ω=−dα`; the contraction convention is at **cannas lines 4238–4240**. The fresh instances are B01–B05 below. No new source error was found there.

**Seeded sample.** All ten sampled subsections are unchanged, so their source checks are carried from [r4], as the incremental brief requires; none is represented as newly fetched here. The following table records that earlier evidence. Cannas’s incorrect local-model locator was independently reopened for R06, and the newly added sibling exercise was freshly read as above. No new or changed unverified locator occurs in the target folder.

| Target | Text and exact locator inspected | Outcome |
| --- | --- | --- |
| 1.1 | conrad lines 11517–11578, Appendix R, Proposition R.2.1 and proof, printed pp. 254–255 | Actual integral coroot, rank-one reduction, SU(2)/SO(3) and pairing 2 support the comparison. The compact-group construction remains a missing formal supplier, R01. |
| 1.2 | cannas lines 2802–2807, Proposition 12.6 p. 70; lines 6631–6662, Homework 21 exercise 2 p. 174 | Polar normalization and the invariant exponential argument support the proof. The arbitrary metric-preserving group extension uses the same invariant ball and injectivity and does not need averaging. The quadratic formula locator is wrong, R06. |
| 2.1 | cannas lines 6663–6724, Homework 21 exercises 3–5, pp. 174–175; Kirwan Part I §§4–5, pp. 44–78 | Critical-set/closure, even Hessian and connected-level route checked. Kirwan's rational equivariant-perfection text could not be obtained; no certification of that locator. R02 concerns the separate coadjoint application. |
| 3.1 | cannas lines 6472–6528, Theorem 27.1 pp. 169–170; hnp lines 769–828, Theorems 3.10/4.1 pp. 149–151; lmtw lines 45–50, Theorem 1.1 v1 p. 2 | Compact/connected and proper/local-convexity/local-fiber hypotheses align. LMTW's stronger proper-orbifold result supplies the compact case; its opposite moment sign is explicit at lines 108–112. |
| 3.1, norm-square headline | lerman lines 117–175 and 180–225, Theorem 1.1 and proof, v2 pp. 3–5 | Proper moment map, invariant dual norm, gradient inequality and finite-length estimate checked. The README explicitly supplies trapping/uniform tails rather than copying the source's unjustified energy-band step. |
| 3.2 | cannas Theorem 27.1, lines 6472–6479, applied to the compact orbit; Majorization MAJ-A18–A25 | Convex-hull input supports the compact Kostant application. Unitary/projector computations below independently check the matrix identification and repeated/empty spectra. |
| 3.3 | escobar lines 301–314, §3.2 p. 8; lines 450–500, §4.1 pp. 12–13; cannas Theorem 27.1 | Projector sum, product embedding and fixed-image convex hull checked. The weighted signs and inequalities are the roadmap's own application and were independently computed; source errors are listed below. |
| 4.1 | cannas lines 7177–7251, Definitions 30.1–30.2/Theorem 30.3 pp. 191–192; moerdijk lines 457–514 §§4.1–4.4; van-den-berg-moerdijk lines 116–134 §2 | Density pushforward and groupoid models checked. The README correctly adds effectiveness/affine support to avoid the overbroad source DH assertion. Generic comparisons remain Orbifolds' targets. |
| 4.2 | cannas lines 7320–7358, Proposition 30.7/Theorem 30.8 pp. 194–195; lines 7359–7395 §30.3 | Left/right connection conversion, curvature sign and top-power polynomial checked. Arbitrary reduced classes remain real, and full ineffective isotropy is retained. |
| 5.1 | cannas lines 6730–6735, Definition 28.1 p. 177; 6768–6788 p. 178; 6822–6840 Theorem 28.2 pp. 179–180; §§29.1–29.3 pp. 183–185; delzant lines 239–246, Theorem 2.1 p. 320, and lines 438–450, §3 pp. 325–326 | Smooth integral vertex/facet dictionary, quotient and classification checked, with inward/outward and period conversions computed below. |
| 5.2 | lerman-tolman lines 73–97, Definitions 1.2–1.4/Theorem 1.5, v1 pp. 2–3 | Compact connected effective half-dimensional orbifold and labeled-polytope scope agree. Weighted slices, periods, coarse power map and areas checked directly below. |

**Adversarial table.** A01–A124 carry forward the prior report’s computed values, each explicitly citing [r4]; the reviewed statements and pins have not changed. These are test instances, not proofs of the admitted general theorems. B01–B05 are fresh computations covering the added sibling contract and its Checks. The inherited rows include all ten sampled targets, six statable headlines, remaining geometric headlines and every target touched by a finding. No arithmetic characteristic/DVR generality is claimed for these real/complex smooth statements.

| Statement | Instances tried | Computed values on both sides | Result / change |
| --- | --- | --- | --- |
| A01 Period lattice and characters | S¹, k=0,1,2 | exp(2π)=1; real differentials 0,1,2; normalized lattice ℤ, period lattice 2πℤ | Pass; excludes a missing 2π.  Inherited [r4]. |
| A02 Duality/product of characters | χ₂χ₃ | χ₂χ₃=χ₅; differentials 2+3=5 | Pass.  Inherited [r4]. |
| A03 Restriction/quotient lattice | Diagonal S¹⊂T²; quotient (s,t)↦s−t | Weight (2,3) restricts to 5; quotient kernel ℤ(1,1), quotient lattice ℤ | Pass.  Inherited [r4]. |
| A04 Rank-one calibration | SU(2), H=diag(i,−i); zero map | α(H)=2 and exp(2πH)=1; zero derivative pairs to 0 | Mathematics passes; supplier R01.  Inherited [r4]. |
| A05 Central isogeny | SU(2)→SO(3) | Kernel {±1}, order 2; same Lie algebra, torus period lattice index 2 | Pass; finite central kernel required.  Inherited [r4]. |
| A06 Full lattice versus splitting | U(2); rank zero | det[(1,1),(1,−1)]=−2, index 2; (1,0) needs half coefficients; rank-zero lattice {0} | Pass.  Inherited [r4]. |
| A07 Haar convention/basis change | ℤ basis 1, then −1 | Fundamental intervals both have length/mass 1; period interval length 2π | Pass; no determinant sign in positive measure.  Inherited [r4]. |
| A08 HamiltonianTorusData contraction | ℂ, positive rotation at (1,0), v=(1,0) | ω((0,1),(1,0))=−1=d(−r²/2)(v); positive quadratic gives +1 | Pass.  Inherited [r4]. |
| A09 Reversal and constant shift | Reversed circle, moment r²/2+7 | At (1,0), both contraction and differential are +1; constant contributes 0 | Pass.  Inherited [r4]. |
| A10 Products and restriction | Two rotation planes; diagonal circle | Moment (−r₁²/2,−r₂²/2) restricts to −(r₁²+r₂²)/2; contractions add identically | Pass.  Inherited [r4]. |
| A11 Smoothness/junk derivative | Constant point action; nonsmooth candidate | Point derivatives and contraction are 0; raw mfderiv may be 0 off differentiability, but moment/action smoothness are explicit fields | Pass; zero derivative cannot silently certify a nonsmooth candidate.  Inherited [r4]. |
| A12 Fixed-set definition/closedness | Trivial group; irrational rotation on first ℂ² factor | Fixed sets ℂ² and {0}×ℂ; tangent real dimensions 4 and 2 | Pass.  Inherited [r4]. |
| A13 Preserved metric is necessary | Shear (q,p)↦(q+p,p) | Fixed line p=0 has restricted ω=0; nth derivative sends e₂ to ne₁+e₂, squared norm has positive n² coefficient | Pass; no invariant positive metric exists.  Inherited [r4]. |
| A14 Polar complex structure | g Euclidean, ω=dq∧dp | A=[[0,−1],[1,0]], −A²=Id, J=A; J²=−Id, ω(e₁,Je₁)=1; −J gives −1 | Pass.  Inherited [r4]. |
| A15 Polar scaling/smoothness model | ω=2dq∧dp | A=2J₀, (−A²)^(−1/2)=Id/2, J=J₀; ω(e₁,Je₁)=2 | Pass; no zero eigenvalue under nondegeneracy.  Inherited [r4]. |
| A16 Invariant-subspace stability | Trivial/C₂/S₃ permutation actions on doubled real representation; J swaps the two copies with a sign | ρ(k)Jv=Jρ(k)v=Jv; each side equal for every fixed v | Pass; one-term padding, R05.  Inherited [r4]. |
| A17 Invariant form nondegeneracy | Same S₃ action on ℝ³⊕ℝ³ | Fixed subspace span((1,1,1),0),span(0,(1,1,1)); restricted ω matrix [[0,3],[−3,0]], determinant 9 | Pass; no topology/compactness on the abstract group needed.  Inherited [r4]. |
| A18 Exponential-chart fixed iff | Euclidean chart Id, C₂ acts −Id | e(−v)=−e(v); fixed point iff v=0 iff v∈invariants | Pass; injectivity and invariant source are the relevant laws.  Inherited [r4]. |
| A19 Common ball and tangent inclusion | Irrational first-plane rotation, ball radius r>0 | Every rotation preserves norm r; common invariant tangent is second plane, exp is Id in this model | Pass without completeness.  Inherited [r4]. |
| A20 Symplectic normal/naturality | Fixed {0}×ℂ⊂ℂ²; exchange coordinates | Normal first ℂ, restricted form standard on second ℂ; exchange swaps both descriptions | Pass.  Inherited [r4]. |
| A21 Total geodesy | Euclidean fixed second plane | Geodesic (0,v)t stays in fixed plane; normal acceleration 0 | Pass; supplier transport locator needs R06.  Inherited [r4]. |
| A22 Compact averaging | Rotate an anisotropic metric diag(2,1) | Circle average=(3/2)Id; positive eigenvalues 3/2,3/2 | Pass; averaging J itself has no square law.  Inherited [r4]. |
| A23 Equivariant Darboux/relative normal model | Linear weight-one plane; fixed plane times rotating plane | Identity chart preserves dq∧dp and action; normal bundle is the rotating factor | Pass on the defining models.  Inherited [r4]. |
| A24 Local quadratic moment | Weights +1,−1,0 | μ=−r²/2,+r²/2,constant; Hessians −Id,+Id,0; indices 2,0,0 | Pass; local formula locator R06.  Inherited [r4]. |
| A25 Local cone/stabilizer/rank | Weight +1 at 0 versus nonzero z | Cone μ(0)−ℝ≥0; stabilizer S¹ at 0, {1} away; orbit ranks 0 and 1 | Pass.  Inherited [r4]. |
| A26 Nonfixed orbit slice | Free circle on cylinder, μ=p | Local coordinates (θ,p), image an interval, fiber a circle locally an arc; no slice weight part | Pass; cotangent directions must remain.  Inherited [r4]. |
| A27 Moment critical-set closure | ξ irrational in T²; ξ=0 | Closure=T² versus {1}; critical sets M^T versus M; zero Hessian in ξ=0 case | Pass.  Inherited [r4]. |
| A28 Generic Hessian/even index | Sphere height | Two critical Hessians definite with indices 0 and 2; no index 1 | Pass.  Inherited [r4]. |
| A29 Scalar critical/regular level connectedness | Sphere heights c=0,±1,2 | Fibers circle, point, empty; all preconnected | Pass.  Inherited [r4]. |
| A30 Ordinary Morse attachments | Sphere, negative ranks 0,2 | Cells D⁰,D², cellular differentials 0; Betti (1,0,1) | Pass.  Inherited [r4]. |
| A31 Isolated-fixed-point consequences | CP² versus trivial action on T² | CP² indices 0,2,4, ranks (1,1,1), π₁=0; T² has b₁=2 | Pass; positive-dimensional fixed components cannot inherit even-cell conclusion.  Inherited [r4]. |
| A32 Coadjoint generic heights | SU(2) nonzero orbit; central orbit | W-orbit has 2 points with indices 0,2; central orbit has 1 point of index 0 | Pass mathematically; duplicate owner R02.  Inherited [r4]. |
| A33 Universal torus/Borel construction | Rank-zero torus; point with S¹ | M_T=M, BT=point versus point_T=BS¹ and H*=ℤ[u] | Pass; consumes actual universal models.  Inherited [r4]. |
| A34 Chern/Euler weight sign | Circle characters 0,1,2 | Euler classes 0,u,2u, where u=−h; weight 2 gives −2h | Pass.  Inherited [r4]. |
| A35 Equivariant pullback/restriction | Fixed point inclusion in S² | Projection classes u pull back to u; ordinary restriction sends positive-degree base u to 0 | Pass.  Inherited [r4]. |
| A36 Localization and Euler nonzerodivisor | Weight-one normal line versus zero-weight tangent | Multiplication by u injective in ℚ[u], invertible after localization; zero Euler multiplication is 0 | Pass; invert only nonzero weights.  Inherited [r4]. |
| A37 Perfection/formality | Standard S¹ on S² | Equivariant module ℚ[u]⊕ℚ[u][−2]; ordinary Betti polynomial 1+t² equals sum of two critical contributions | Pass on model; Kirwan locator uncertified.  Inherited [r4]. |
| A38 Torus convexity headline | Point, trivial torus | Range={0}, hull of fixed image={0}; fiber at 0 singleton | Pass, rank zero.  Inherited [r4]. |
| A39 Ineffective torus action | Trivial circle on S² | Image={c}, affine dimension 0, fixed-image hull={c}; whole-sphere fiber connected | Pass; no effectiveness assumed by convexity theorem.  Inherited [r4]. |
| A40 Torus convexity/off-image | Standard sphere, μ=h | Image/hull=[−1,1]; c=2 fiber=∅, preconnected | Pass; no nonempty-fiber overclaim.  Inherited [r4]. |
| A41 Product/subtorus/shift images | S²×S²; diagonal circle; shift +3 | Product square [−1,1]², diagonal projection [−2,2], shifted interval [1,5] | Pass.  Inherited [r4]. |
| A42 Effective dimension/isotropic orbits | Sphere; product of spheres | Generic orbit dimensions 1,2; ω on orbit tangents 0; image dimensions 1,2=half manifold dimension | Pass.  Inherited [r4]. |
| A43 Coisotropic regular levels | Circle on ℂ², positive diagonal moment | Level dimension 3; kernel of restricted ω dimension 1; reduced dimension 2=4−2 | Pass.  Inherited [r4]. |
| A44 Local-to-global hypotheses | Identity ℝ→ℝ; circle cylinder μ=p | Closed convex image ℝ; fibers point or S¹ connected; compact interval preimages compact for cylinder | Pass; connected source and properness retained.  Inherited [r4]. |
| A45 Nonabelian full image/chamber | SU(2) orbit of radius r>0 | Full image S²_r excludes midpoint 0; chamber image {r}; orbit-projected fiber is whole connected sphere | Pass; full image is not convex.  Inherited [r4]. |
| A46 Rational directions versus supports | Circle sphere shifted by √2 | Interval endpoints √2±1, primitive normals ±1 still integral | Pass; supports need not be rational.  Inherited [r4]. |
| A47 Cross-section model | SU(2) sphere | Positive-chamber cross-section is one point with zero form; K-saturation recovers sphere | Pass; orbit/chamber carriers consumed.  Inherited [r4]. |
| A48 Norm-square gradient inequality | p(x)=x⁴ | ‖∇p‖=4‖x‖³=4‖p‖^(3/4); p=0 gives both 0 | Pass; excludes exponent 1/2.  Inherited [r4]. |
| A49 Gradient semiflow/finite length | x′=−4x³, x₀>0 | x(t)=x₀/√(1+8x₀²t); total length x₀; bound p(x₀)^(1/4)/(4·1/4)=x₀ | Pass.  Inherited [r4]. |
| A50 Uniform tails/stratum limit | Same flow, 0≤x₀≤R | Tail x(t)≤1/√(8t), uniformly tends to 0; limit and retraction are 0 | Pass on compact subsets.  Inherited [r4]. |
| A51 Need trapping, not only energy band | Sphere f=h², C=north pole | f(north)=f(south)=1; any energy band about 1 includes south, outside a small north neighborhood | Pass for README's explicit correction; source issue below.  Inherited [r4]. |
| A52 Product gradient convention | f=x⁴+y⁴, product Euclidean metric | ∇f=(4x³,4y³); separate flows give product limit (0,0) | Pass with product data; no metric-free flow identity inferred.  Inherited [r4]. |
| A53 Kostant projection | SU(2) sphere | Torus projection [−r,r]=conv{−r,r}, Weyl reflection swaps endpoints | Pass.  Inherited [r4]. |
| A54 Matrix pairing sign | H=diag(2,0), X=i diag(θ₁,θ₂) | −i tr(HX)=2θ₁; diagonal moment evaluates to 2θ₁ | Pass.  Inherited [r4]. |
| A55 Schur–Horn, both inclusions n=2 | Spectrum (2,0), U first row (√t,√(1−t)) | Diagonal (2t,2−2t), 0≤t≤1; trace 2 and coordinates in [0,2] give exactly the segment hull | Pass.  Inherited [r4]. |
| A56 Repeated spectrum | (1,1) | UIdU*=Id; diagonal set and permutation hull both {(1,1)} | Pass.  Inherited [r4]. |
| A57 Empty/one-dimensional spectra | n=0; spectrum (a) | Both sets {()}; both sets {(a)} | Pass; no omitted rank restriction.  Inherited [r4]. |
| A58 Majorization comparison | λ=(2,0), d=(1,1) | Largest-entry sum 1≤2, total sums 2=2; squared sums 2≤4 | Pass; forward inequalities belong to Majorization.  Inherited [r4]. |
| A59 Rank-one simplex | Projector onto z∈ℂⁿ, ‖z‖=1 | Diagonal ‖zᵢ‖²≥0, sum 1; prescribed simplex coordinates xᵢ realized by zᵢ=√xᵢ | Pass, including zero coordinates.  Inherited [r4]. |
| A60 V3/projectorDiagonal | Zero, full, initial plane | Real dimensions of V3=6; projector diagonals (0,0,0),(1,1,1),(1,1,0), traces 0,3,2 | Pass.  Inherited [r4]. |
| A61 Normalized projector, non-example | span(e₁+e₂) | Diagonal (1/2,1/2,0), trace 1; unnormalized outer product gives (1,1,0), trace 2 | Pass; excludes missing denominator.  Inherited [r4]. |
| A62 Initial-plane incidence | L₁=e₁ or e₃ | e₁∈span(e₁,e₂), e₃∉span(e₁,e₂) | Pass; excludes an unrestricted flag product.  Inherited [r4]. |
| A63 Weighted moment trace/linearity | a=b=c=1; flag (e₁,12,e₂) | Moment (2,2,0), trace 4=1+2+1; doubling all weights gives (4,4,0), trace 8 | Pass.  Inherited [r4]. |
| A64 Diagonal-unitary invariance | Line span(e₁+e₂), diagonal phases | Projector diagonal remains (1/2,1/2,0) | Pass.  Inherited [r4]. |
| A65 KKS/FS sign and scale | CP¹ near e₁, w=x+iy | μ₁=1−‖w‖²+O(‖w‖⁴), tangent weight −1; σ(∂x,∂y)=−2=−2π·(1/π) | Pass.  Inherited [r4]. |
| A66 Product form restriction | Positive a,b,c; nonzero tangent to holomorphic incidence immersion | (−ω)(v,Jv)=2π(a‖v₁‖²+b‖v₂‖²+c‖v₃‖²)>0 | Pass; if a=0, exceptional tangent gives 0.  Inherited [r4]. |
| A67 Actual torus versus ambient group | Diagonal scalars versus swapping e₂,e₃ | Scalars fix all subspaces; swap sends P₀=12 to 13 and fails incidence preservation | Pass; no U(3) action on X asserted.  Inherited [r4]. |
| A68 Effective kernel/complexity | All coordinate and mixed lines | Common diagonal phases force t₁=t₂=t₃; effective rank 3−1=2, complexity 3−2=1 | Pass.  Inherited [r4]. |
| A69 Eight fixed flags | L₁∈{e₁,e₂}; P coordinate containing it; L coordinate in P | 2·2·2=8 flags | Pass; no identification of flags with moment values.  Inherited [r4]. |
| A70 fixedMoment row 1 | (e₁,12,e₁) | Weighted indicators sum to (a+b+c,b,0), exactly row 1 | Pass.  Inherited [r4]. |
| A71 fixedMoment row 2 | (e₁,12,e₂) | Sum (a+b,b+c,0), exactly row 2 | Pass.  Inherited [r4]. |
| A72 fixedMoment row 3 | (e₁,13,e₁) | Sum (a+b+c,0,b), exactly row 3 | Pass.  Inherited [r4]. |
| A73 fixedMoment row 4 | (e₁,13,e₃) | Sum (a+b,0,b+c), exactly row 4 | Pass.  Inherited [r4]. |
| A74 fixedMoment row 5 | (e₂,12,e₁) | Sum (b+c,a+b,0), exactly row 5 | Pass.  Inherited [r4]. |
| A75 fixedMoment row 6 | (e₂,12,e₂) | Sum (b,a+b+c,0), exactly row 6 | Pass.  Inherited [r4]. |
| A76 fixedMoment row 7 | (e₂,23,e₂) | Sum (0,a+b+c,b), exactly row 7 | Pass.  Inherited [r4]. |
| A77 fixedMoment row 8 | (e₂,23,e₃) | Sum (0,a+b,b+c), exactly row 8 | Pass.  Inherited [r4]. |
| A78 Fixed-label symmetry | Swap first two coordinates | Row permutation (1 6)(2 5)(3 7)(4 8); weighted coordinates swap exactly | Pass; labels retained at collisions.  Inherited [r4]. |
| A79 Incidence image, nonfixed point | a=b=c=1; L₁=span(e₁+e₂), P=L₁⊕e₃, L=e₃ | μ=(1,1,2)=½(2,0,2)+½(0,2,2) | Pass; uses actual noncoordinate subspaces.  Inherited [r4]. |
| A80 Hull versus inequalities, equal weights | (1,1,1) | Trace 4, bounds (3,3,2); vertices (3,1,0),(3,0,1),(2,0,2),(0,2,2),(0,3,1),(1,3,0) on both sides | Pass by exact rational enumeration.  Inherited [r4]. |
| A81 Hull, unequal weights | (2,1,3) | Trace 7, bounds (6,6,4); six vertices (6,1,0),(6,0,1),(3,0,4),(0,3,4),(0,6,1),(1,6,0) on both sides | Pass by exact rational enumeration.  Inherited [r4]. |
| A82 Hull, fractional weights | (1/2,3/2,2) | Trace 11/2, bounds (4,4,7/2); vertices (4,3/2,0),(4,0,3/2),(2,0,7/2),(0,2,7/2),(0,4,3/2),(3/2,4,0) | Pass on both descriptions.  Inherited [r4]. |
| A83 Interior-edge coefficients/collision | (1,1,1); (2,1,1) | Coefficients of row 6 are (1/2,1/2); (1/3,2/3); distinct image counts 7 and 8 | Pass; denominators a+c>0, collision iff a=c.  Inherited [r4]. |
| A84 Six nonzero edges | General positive a,b,c | Consecutive primitive-root edge parameters b,c,a+b,c,b,a+c; all positive | Pass; each vertex has two active bounds in trace plane.  Inherited [r4]. |
| A85 Boundary a=0 | b=c=1 | Fixed values reduce to six permutations of (2,1,0); exceptional P¹ tangent has pulled-back form 0 | Pass; image proof uses surjective flag map.  Inherited [r4]. |
| A86 Liouville measure/scaling | Unit square, ω,2ω,−ω; point | Masses 1,2,1; point mass 1 from ω⁰/0!=1 | Pass; measure owner SBC B2.4.  Inherited [r4]. |
| A87 Restriction/product/invariance | Unit squares; map (x,y)↦(2x,y/2) | Product mass 1·1=1, determinant 1 preserves mass; half-square mass 1/2 | Pass.  Inherited [r4]. |
| A88 DH definition/local finiteness | μ=r²/2 on ℂ, interval [0,R] | Preimage disk radius √(2R), mass 2πR; bounded R gives finite mass | Pass.  Inherited [r4]. |
| A89 Absolute continuity/affine support | Height sphere; trivial circle on same sphere | Density 2π on [−1,1], total 4π; trivial action gives atom 4π at c | Pass with effectivity/support clause.  Inherited [r4]. |
| A90 DH shifts/products | Sphere shift +3; two spheres | Support [2,4], same density 2π; product density (2π)² on square | Pass.  Inherited [r4]. |
| A91 Level principal bundle arrows | h:x→hx, t,k∈T | (ht)⁻¹hx=t⁻¹x; (tk)⁻¹x=k⁻¹(t⁻¹x) | Pass; abelian torus makes arrow/right actions commute.  Inherited [r4]. |
| A92 Connection right/left normalization | Positive Hopf right circle; inverse left action | α(ξ_right)=1, α(ξ_left)=−1; opposite connection gives curvature −F | Pass.  Inherited [r4]. |
| A93 Classifier/Chern/real class | Hopf; c=√2 | ∫F/(2π)=1=h[CP¹], u[CP¹]=−1; [ω_c]=2π√2 h is real, not a rationality claim | Pass.  Inherited [r4]. |
| A94 Classifying versus coarse model | Point with C₂ isotropy | BC₂ versus point; H¹(BC₂;F₂)=F₂, H¹(point;F₂)=0; rational positive degrees vanish | Pass; generic construction belongs to O4-T.  Inherited [r4]. |
| A95 Full-isotropy integration | Point isotropy k=1,2 | Full integrals 1,1/2; effective point integral 1; effective=k·full | Pass.  Inherited [r4]. |
| A96 Reduced-class variation sign | Hopf c₀=1,c=3 | [ω₃]−[ω₁]=4πh=(3−1)[F] | Pass.  Inherited [r4]. |
| A97 Contractible chamber/transport | Positive circle levels on ℂ² | Radial identification sends every quotient to CP¹; H² generator h unchanged, class 2πc h | Pass; forms vary, cohomology transport fixed.  Inherited [r4]. |
| A98 Degree bound/reduced-volume density | Circle on ℂ², n=2,m=1 | vol(M_c)=2πc; density (2π)(2πc)=4π²c of degree 1=n−m | Pass.  Inherited [r4]. |
| A99 Wall/null-set behavior | Reversed circle on ℂ | Density 0 at negative regular values, 2π at positive ones; critical value set {0} has Lebesgue mass 0 | Pass; smoothness through wall not asserted.  Inherited [r4]. |
| A100 Common ineffective factor | Weights (k,k), c>0; k=2 | Effective area 2πc/k, full area 2πc/k²; for k=2: πc and πc/2; DH density π²c | Pass, agrees with derivative of mass 2π²(c/k)².  Inherited [r4]. |
| A101 Orthant/simplex/product volumes | ℂ² rectangle; CP² size c; S²×S² sides a,b | Masses 4π²RS, 2π²c², 4π²ab; agree with (2π)^n times Euclidean volumes | Pass.  Inherited [r4]. |
| A102 Toric fiber iff | Sphere latitudes and poles; point | Same height iff same circle orbit; poles have singleton fibers; point satisfies both sides | Pass in both directions.  Inherited [r4]. |
| A103 Interior freeness/face stabilizers | Sphere interval | Interior stabilizer {1}, endpoint stabilizer S¹; one orbit per fiber | Pass.  Inherited [r4]. |
| A104 Fixed vertices/rank-zero exception | Point; sphere; word121 | Point is fixed, vertex and interior; sphere endpoints not interior; word121 (2,2,0) fixed but not vertex | Pass; previous R01 repaired.  Inherited [r4]. |
| A105 Facet presentation/pairing/region | N=ℤ→ℝ, normals ±1, supports 0,−1 | Pairings x,−x; region [0,1]; x=−1 fails first inequality | Pass.  Inherited [r4]. |
| A106 Translation/permutation/lattice isomorphism | Shift +2; exchange facets; basis −1 | Supports (2,−3) give [2,3]; facet exchange preserves set; x↦−x and normal↦−normal preserve pairing | Pass.  Inherited [r4]. |
| A107 Smooth vertex | Primitive versus doubled normals | Endpoint active basis ±1 spans ℤ; ±2 spans index-2 subgroup, so same interval fails smoothness | Pass.  Inherited [r4]. |
| A108 Exact active-facet count | Duplicate x≥0 at x=0 | Two active indices in dimension 1; no injective one-index list exhausts both | Pass.  Inherited [r4]. |
| A109 Delzant compact/full/irredundant | [0,1], {0}⊂ℝ, half-line, duplicate facet | Interval passes; singleton interior empty; half-line unbounded; duplicate lacks point with other copy strict | Pass.  Inherited [r4]. |
| A110 Empty facet list/rank zero | V=0 versus V=ℝ | Region singleton/univ in rank 0, empty basis valid; rank-one region ℝ is not compact | Pass.  Inherited [r4]. |
| A111 Delzant-image actual lattice | Sphere, exp(t)=e^(it), lattice ℤ; rescale exponential | Correct kernel exp(2πv)=1 iff v∈ℤ; exp(2it) has derivative 2 and is excluded by identity-derivative hypothesis | Pass; no arbitrary lattice substitution.  Inherited [r4]. |
| A112 Quotient exact sequence | Interval [0,c], c>0 | ℤ²→ℤ sends (u,v)↦u−v, kernel diagonal ℤ; level r₁²+r₂²=2c, free diagonal circle | Pass; c=0 excluded in rank 1.  Inherited [r4]. |
| A113 Reconstruction and orbit space | Same interval | Quotient CP¹, residual μ=r₁²/2∈[0,c], area 2πc; orbit quotient interval | Pass.  Inherited [r4]. |
| A114 Uniqueness/affine relabeling | Shift interval; reflect x↦−x | Shift adds constant to μ; reflection changes circle parameter θ↦−θ, not identity equivariance | Pass.  Inherited [r4]. |
| A115 Facet cohomology/symplectic class | Interval supports (0,−c) | D₁=D₂=h, D₁D₂=0; ring ℤ[h]/h²; −2πΣλ_jD_j=2πc h | Pass.  Inherited [r4]. |
| A116 Higher toric examples | CP², product, corner chop δ | Rings ℤ[h]/h³ and ℤ[x,y]/(x²,y²); chopped triangle area decreases δ²/2, volume by 2π²δ² | Pass; Hirzebruch trapezoid has four vertices and b₂=2.  Inherited [r4]. |
| A117 Weighted Hamiltonian flow/periods | Weights (2,3), ε>0 | Contraction d((2r₁²+3r₂²)/2); generic period 2π, axis periods π,2π/3 | Pass.  Inherited [r4]. |
| A118 Ellipsoid-to-sphere map | (2,3), ε=1 | Squared image norm=(2r₁²+3r₂²)/2=1 | Pass; positive scale factors.  Inherited [r4]. |
| A119 First weighted slice | (2,3), ε=1 | Radius √(2/3), residual C₂ acts w↦−w; center stabilizer 2, off-center 1 | Pass.  Inherited [r4]. |
| A120 Second slice/overlap | (2,3), ε=1; (1,2) | Radius 1, C₃ multiplier exp(−4πi/3); overlap ambiguities exactly residual phases; order-one first chart for (1,2) | Pass.  Inherited [r4]. |
| A121 Coarse power map, both directions | (2,3), both axes and mixed points | [z₁³:z₂²] acquires common e^(−6iθ); invariant relative phase 3φ₁−2φ₂; poles [1:0],[0:1] | Pass; coprimality removes extra phase orbits.  Inherited [r4]. |
| A122 Slice reduced forms | First slice y₁=0; second y₂=0 | Pullback first/second coordinate area term vanishes, remaining form dx₂∧dy₂ or dx₁∧dy₁ | Pass.  Inherited [r4]. |
| A123 Weighted area | (2,3), ε=1 and 1/2; (1,1), ε=1/2 | (1/2)π·(2/3)=π/3; π/6; Hopf π, agreeing with 2πε/(ab) | Pass; no omitted isotropy divisor.  Inherited [r4]. |
| A124 Labeled classification/smoothness | Label 2 primitive cone; label 1 determinant-2 cone | Both have order-two local isotropy; label 1 and determinant 1 gives trivial isotropy | Pass; both smoothness requirements necessary.  Inherited [r4]. |
| B01 Canonical chart form and uniqueness | T*ℝ; u=(1,0), v=(0,1); coordinate change Q=2q, P=p/2 | Model and intrinsic values are 1=1; dQ∧dP=2·(1/2)dq∧dp=dq∧dp; equality at each chart centre determines every fiber | Pass, fresh; unchanged canonicalForm_exists supplies the identity. |
| B02 General cotangent-lift Hamiltonian identity | Scaling action q↦eᵗq, lift (q,p)↦(eᵗq,e⁻ᵗp), at (2,3) | Field (2,−3), H=pq=6; contraction on (a,b) is 2b+3a, dH(a,b)=3a+2b | Pass, fresh; both sides equal without assuming the action is translation. |
| B03 Sign and rescaling negative controls | Translation on T*ℝ; test v=∂p; forms σ, −σ, 2σ | Canonical contraction=1=d(p)(∂p); opposite gives −1≠1; doubled gives 2≠1 and fails the chart identity | Pass, fresh; symplecticity alone cannot substitute for normalization. |
| B04 Trivial action and zero-dimensional base | Trivial action on ℝ; base a point | Field 0, H=0, contraction 0=dH; at a point tangent and dual are {0}, zero form has radical {0} and is nondegenerate | Pass, fresh; no nonzero-dimension restriction needed. |
| B05 Chart-target guard | A chart with target (−1,1), centre 0, attempted coordinate w=2 | At 0 the prescribed pair evaluates 1=1; 2∉(−1,1), so the antecedent is false and no equation constrains the total inverse’s junk value | Pass, fresh; the domain guard prevents an off-chart assertion. |

**Pinned declarations refreshed — 19 source files.** Library paths below are relative to their respective pinned repositories. These declarations and their defining conditions were inspected, not just their names.

- `Mathlib/LinearAlgebra/UnitaryGroup.lean:55–62`: `Matrix.unitaryGroup` is the unitary matrix submonoid with its group structure; star is conjugate transpose.
- `Mathlib/Analysis/InnerProductSpace/PiL2.lean:111–112`: `EuclideanSpace` is the finite ℓ² carrier, not the coordinate supremum-norm model; `Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean:128–132` defines the ambient `Submodule.starProjection` from the subtype projection and requires orthogonal projection existence.
- `Mathlib/RepresentationTheory/Invariants.lean:73–80`: invariant membership is the equation for every group element; it adds no topology, finiteness or compactness.
- `Mathlib/Analysis/Convex/Hull.lean:45`: `convexHull` is the closure operator for convex sets; `Mathlib/Analysis/Convex/Extreme.lean:70` defines extreme points of the actual set. Convex hull is not automatically a topological closure.
- `Mathlib/Algebra/Module/ZLattice/Basic.lean:433–436`: `IsZLattice` uses a discrete subtype and full real span. `Mathlib/MeasureTheory/Measure/Haar/OfBasis.lean:250–266`: `Module.Basis.addHaar` gives its basis parallelepiped mass 1, under the Borel/measurability hypotheses.
- `Mathlib/Topology/Connected/Basic.lean:705–709`: `ConnectedSpace` includes nonemptiness, so empty M is excluded by the headline assumptions. `Mathlib/Topology/OpenPartialHomeomorph/Defs.lean:51–54`: open source and target supplement the partial-homeomorphism laws; equivariance is not part of that structure.
- `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean:72–78` and `Mathlib/Geometry/Manifold/Algebra/Monoid.lean:65–69`: smooth multiplication includes `IsManifold`; a LieGroup adds smooth inversion, not compactness, connectedness or Hausdorffness. Those necessary topological assumptions are explicit in the headlines.
- `Mathlib/Geometry/Manifold/MFDeriv/Defs.lean:336–342`: `mfderiv` uses the chart derivative when differentiable and otherwise returns zero. HamiltonianTorusData's smoothness fields prevent exploiting this junk value.
- `TauCeti/Geometry/Manifold/TwoForm/Basic.lean:61–69`: `SmoothTwoForm` is a smooth alternating tangent-bilinear section. `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:90–103`: `IsSymplectic` adds closedness and fiberwise nondegeneracy, not measure or compactness.
- `TauCeti/Geometry/Toric/Algebraic/Lattice.lean:84–98,117–124`: `IsIntegralLattice` includes finite freeness and real scalar extension; injectivity is a theorem, not an arbitrary extra field. The given lattice map is retained in toricImage_delzant's conclusion.
- `Mathlib/Analysis/InnerProductSpace/Projection/FiniteDimensional.lean:54–56` identifies the closure of a finite-dimensional subspace with itself. The actual projector is the native definition cited above; no alternate projector was introduced.

- `TauCeti/Geometry/Manifold/TwoForm/Closed.lean:81–102`: `inChartAt` uses the total chart inverse and tangent coordinate change; its documented off-target value is junk. The centre identity at :99 recovers the intrinsic form without extra compactness assumptions.
- `TauCeti/Geometry/Symplectic/Cotangent/StrongDual.lean:82–92`: the symplectic form on the native continuous-dual product has value `y.2 x.1 − x.2 y.1`. This gives the positive value 1 on (∂q,∂p), and 3a+2b for B02.

**Ownership and citation refresh.** The broad unchanged ownership/namespace audit is inherited from [r4]. A fresh `roadmaps grep` object search for generic coadjoint heights and calibrated rank-one contracts confirms the main R2a owner and the remaining R01 contract. The new sibling construction cites its existing C1 owner instead of declaring another form or moment theorem. The package directory still contains no readable design plan or settled repair report. No new declaration needs a broader duplication audit; ownership against open work beyond the supplied index and [r4]’s audit was not re-audited.

All fifteen supplier groups below were resolved again at main, rather than substituting unmerged revisions of existing roadmaps. The family conventions and the two authorized siblings were read at this head. Main MorseTheory, CharacteristicClasses and SmoothBundlesConnections also supply the shape examples for this review. No supplier drift beyond the outstanding findings was established.

| Supplier | Resolved passage and scope |
| --- | --- |
| Family conventions; HamiltonianReduction | `TauCetiRoadmap/SymplecticGeometry/README.md:25–44`, positive contraction, ω=−dλ, period 2π. `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/README.md:33–49` R1 equations; :127–155 R2 KKS/chambers; :157–187 R2a orbit heights; :187 onward R3 reductions and R3.1 proper-orbit slice. R2a overlap is R02. |
| LieGroups | `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:300–348` differential/exponential functor and simply-connected integration; :383–405 compact tori/Weyl/exponential surjectivity. No calibrated rank-one input found on main, R01. |
| RootSystems | `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:296–319`, abstract chambers/fundamental-domain targets. This does not construct the compact Lie-group realization. |
| SmoothBundlesConnections | `TauCetiRoadmap/SmoothBundlesConnections/README.md:776–800` B2.4 density/Liouville measure; :1668–1704 B6.2 dual-character class, curvature integral +2π and Hopf pairing +1; B6.3 comparison continues that convention. |
| Orbifolds | `TauCetiRoadmap/Orbifolds/README.md:83` ownership boundary; O4.1 and O4-N/S/R/K/W at :296–419; O4-T at :419–542 and its principal-torus continuation; O5 full-isotropy integration. Generic proofs take supplied character data, not CT's convexity/DH outputs; O7 is not an input. |
| MorseTheory | `TauCetiRoadmap/MorseTheory/README.md:611–640` M5 normal Hessian, bundle splitting, inverse-square-root smoothness, oriented/twisted attachments; M1–M4 provide the ordinary prerequisites. |
| CharacteristicClasses | `TauCetiRoadmap/CharacteristicClasses/README.md:150–154` explicitly assigns Hamiltonian Borel/perfection theory here; :511–533 C1.5 finite torus models and u=−h; C2/C3 ordinary Thom/Euler/Leray–Hirsch. No generic equivariant-perfection duplicate was found. |
| AlgebraicTopology | `TauCetiRoadmap/AlgebraicTopology/README.md:946` Stage 6 ordinary cohomology/products/duality, with foundational 6.0–6.2 distinguished from duality. |
| DifferentialGeometry | `TauCetiRoadmap/DifferentialGeometry/README.md:268–340` forms/d; :503–533 integration/densities; :782–805 de Rham complex/cohomology. |
| HeegaardFloer | `TauCetiRoadmap/HeegaardFloer/README.md:2081–2120`, §4.1/F2.1 Darboux, contraction inverse and domain-local Moser. Equivariant fixed-locus application remains here. |
| HopfRinow | `Completed/HopfRinow/README.md:264–426` local geodesic/exponential construction; :521–529 smooth Riemannian isometry transport. Correct the cited layer for transport, R06. |
| GeometricTopology | `TauCetiRoadmap/GeometricTopology/README.md:177–221`, generic closed-submanifold tubular/normal bundles. Equivariant specialization remains here. |
| SchubertGeometry | `TauCetiRoadmap/SchubertGeometry/README.md:38–45` all-word carrier/flag maps; :107–111 S9.1 complex and smooth realization; :140 word121 exceptional P¹ and eight subwords. This folder owns the form/moment-image application, not a second incidence carrier. |
| ComplexKahlerGeometry | `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1444–1453`, K7.2 normalized positive FS with ∫CPⁿ ω_FSⁿ=1. The negative 2π KKS adapter was computed in A65. |
| Majorization; AnalyticToricGeometry | `TauCetiRoadmap/OperatorTheory/Majorization/README.md:153–166`, MAJ-A18–A25 forward inequalities/trace. `Completed/AnalyticToricGeometry/README.md:186–201`, integral scalar-extension/cone/fan dictionary. Neither owns the new reverse Schur–Horn realization or symplectic Delzant classification. |


IntegrableSystems I2.0:48–93 retains the positive-period conversion `θ=2πt/p`, `dt_p=(p/(2π))dθ`. CotangentLagrangian’s new contract:498–529 agrees with the family’s `ω=−dλ`, positive contraction and inverse-derivative lift. The root/coroot period, dual-character Chern sign, Fubini–Study scale and orbifold full-isotropy contracts remain as recorded above.

## Not verifiable

The following unchanged source limitations are inherited from [r4], not renewed source requests:

- **Kirwan, Cohomology of quotients**, Part I §§4–5, pp. 44–78: the earlier sources-service bibliographic search did not obtain a legal text; rational-equivariant-perfection’s exact locator remains uncertified.
- **Condevaux–Dazord–Molino, Géométrie du moment**: the earlier bibliographic search found no legal text. The separately named 1994 HNP route was checked in [r4], which does not certify CDM.
- **Atiyah, Convexity and commuting Hamiltonians**: the earlier DOI landing page returned HTTP 403. The Cannas/HNP evidence does not certify the original pages.
- **Guillemin–Sternberg (1982), Kirwan convexity III (1984), Duistermaat–Heckman (1982)**: the earlier service classified these as publisher-only, uncertified. No paywall was bypassed.
- The 1994 HNP extraction lost several displayed formulas in [r4]; that report’s readable hypotheses and local differential computation are retained, without claiming image certification.
- `sources.toml` remains absent. This incremental review edits no manifest and does not retry unchanged missing texts. The sole new citation was legally obtained, read and certified above.
- No admitted geometric headline has been proved. Inherited tests and the refreshed citations/build do not establish a general Lean proof or exhaustive absence of competing work from uninspected files.

The source issues below are carried forward from [r4]. No additional source mistake was found in the new §18.1 citation.

## Source issues

- **Error** in cannas at Theorem 30.3, printed p. 191 (cannas lines 7186–7226): the source says every proper Hamiltonian torus pushforward has a Lebesgue polynomial density; it should require effectiveness or the appropriate affine support; affects a stated result.
- **Error** in escobar at §4.1, printed p. 13 (escobar lines 480–484): the source says a general point has a Weyl-conjugate fundamental-weight moment value; it should restrict that claim to torus-fixed points, allowing convex combinations otherwise; affects a stated result.
- **Misprint** in escobar at §4.1, printed p. 13 (escobar lines 485–488): the source says the product moment map sums embedding-after-moment compositions; it should sum moment-after-embedding compositions; affects a stated result.
- **Misprint** in escobar at §4.1, printed p. 12 (escobar lines 459–464): the source says the kth embedding component uses an unbound product index and factor-position parabolic; it should use the cumulative product through k and the kth word letter's parabolic; affects a stated result.
- **Misprint** in lerman at Theorem 1.1(2), printed preprint p. 3 (lerman lines 131–135): the source says the extended flow takes every time into the critical component; it should take values in the stable stratum, with its infinite-time endpoint in the critical component; affects a stated result.
- **Gap** in lerman at the proof after Lemma 2.2, printed preprint p. 4 (lerman lines 180–183): the source says properness places a narrow critical-value band near the selected critical component; it should establish trapping and eventual entry on that component's stable stratum; affects the proof.

- **Error** in cannas at §29.3, printed p. 186 (cannas lines 7036–7040): the source says the quotient torus has a section through every point stabilizer; it should choose a vertex stabilizer for the splitting, since interior stabilizers are trivial; affects the proof.
