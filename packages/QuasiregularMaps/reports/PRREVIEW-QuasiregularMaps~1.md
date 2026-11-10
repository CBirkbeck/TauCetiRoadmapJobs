# Review of QuasiregularMaps (pull request #2134 at 64a7eb8)

**Verdict:** needs changes

## R01 (P1) — Total simplex collapse is a quasiregular constant map

**Location:** `TauCetiRoadmap/QuasiregularMaps/README.md:1517`, also line 1454: “A degenerate map that collapses an n-simplex, n ≥ 2, has dp of rank n − 1 ≥ 1”.

**Claim:** Degeneracy forces positive rank and rules out quasiregularity. Identifying two vertices does not say that these are the only identifications.

**Witness:** Send every vertex of a triangulated sphere to one target vertex. Every simplex collapses to a point: rank = 0, norm = 0, Jacobian = 0, and the distortion inequality is 0 ≤ 0.

**Repair:** Restrict these negative controls to a simplex with exactly one pair of identified vertices and all other vertex images distinct, or explicitly require rank between 1 and n − 1. Add the total-collapse control: it is constant and 1-quasiregular, as §2.1 already requires. On a triangle the repaired negative control has rank 1, norm positive and determinant zero; total collapse has rank 0 and satisfies the inequality. This changes the Checks, not the sufficient hypothesis of §6.4.

## R02 (P2) — ACL differentiation needs a hypothesis on the target

**Location:** `TauCetiRoadmap/QuasiregularMaps/README.md:1200`: “The partial derivatives of an ACL map exist almost everywhere on Ω”. The standing assumption at line 1173 makes F finite-dimensional only in §5.2. The same overclaim occurs in `TauCetiRoadmap/QuasiregularMaps/Suggested.lean:119`.

**Claim:** Absolute continuity of lines in an arbitrary real normed target implies almost-everywhere norm differentiation.

**Witness:** For F = C([0,1], ℝ), put u(t)(s) = |t − s| on (0,1). It is 1-Lipschitz and ACL. Evaluation at s = t gives difference quotients +1 and −1, so u is nowhere differentiable.

**Repair:** Assume F finite-dimensional for the differentiation and associated almost-everywhere identification claims in §5.1, and qualify the `formalDeriv` docstring accordingly. The definitions can keep their general carriers. Add this infinite-dimensional negative control. In the repaired finite-dimensional scalar example u(t) = |t − s₀|, the derivative is −1 or +1 away from the single exceptional point s₀. The cited pinned `AbsolutelyContinuousOnInterval.ae_differentiableAt` is scalar-valued (`Mathlib/MeasureTheory/Function/AbsolutelyContinuous.lean:444`), so componentwise extension supplies precisely the finite-dimensional case. The §5.2 Lean theorems already carry the required finite-dimensional binder.

## R03 (P2) — A chosen weak differential has no prescribed value at every interior point

**Location:** `TauCetiRoadmap/QuasiregularMaps/README.md:1465`: “Dp(x) is the differential of p|κ(σ°) at every x ∈ κ(σ°), hence almost everywhere.”

**Claim:** The supplier's chosen weak differential equals the classical differential pointwise on every simplex interior.

**Witness:** For p = id on ℝ², replace its weak differential by zero at one simplex-interior point x₀. It remains a weak differential, but Dp(x₀) = 0 whereas dp(x₀) = id.

**Repair:** Say that the classical differential exists at every simplex-interior point and that the weak differential agrees with it almost everywhere. Add the modified-identity control. This suffices for every distortion conclusion here. `TauCeti.HasWeakFDerivOn.congr_ae_deriv` permits exactly this modification (`TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:453`); the supplier explicitly makes Df a total choice and denies determination at a single point (`packages/SobolevMapsBetweenManifolds/design/README.md:920`, line 939). The repaired assertion gives equality off {x₀}, a null set.

## R04 (P2) — Metric transfer omits positivity of its comparison constants

**Location:** `TauCetiRoadmap/QuasiregularMaps/README.md:1584`: “if α|w| ≤ |w|' ≤ β|w| … then it is (β/α)ⁿ K-quasiregularly elliptic”.

**Claim:** The displayed norm inequalities alone justify division by α and the claimed distortion parameter.

**Witness:** Use the same flat metric on ℝ, n = 1, K = 1, α = −2 and β = 1. The norm bounds hold, but the conclusion requests distortion −1/2, excluded by K ≥ 1.

**Repair:** Include `0 < α ≤ β`, as §4.1 does. For equal metrics, α = β = 1 then gives factor 1. For the stated anisotropic torus, α = 1 and β = 2 give factor 4. Allowing α = 0 would also leave the denominator unjustified.

## R05 (P2) — Import the existing singular-value perturbation and invariance results

**Location:** `TauCetiRoadmap/QuasiregularMaps/README.md:452`, line 455: “ℓ(c A) = |c| ℓ(A)” and “|ℓ(A) − ℓ(A')| ≤ ‖A − A'‖”.

**Claim:** These and invariance under isometric equivalences are new minimal-stretch proof targets; neither their existing owners nor their exact declarations appear in the supplier contract.

**Witness:** `LinearMap.abs_singularValues_sub_singularValues_le` already proves the bound for every index (`TauCeti/Analysis/OperatorIdeal/ApproximationNumber/EckartYoung.lean:106`). `singularValues_smul` and the two isometric-equivalence composition laws are in `TauCeti/Analysis/InnerProductSpace/SingularValues.lean:589`, line 595 and line 602.

**Repair:** Cite these four pinned declarations in Scope and ownership and the Tau Ceti contract; consume their specializations at index n − 1 instead of planning their proofs again. Keep the minimal-stretch definition and genuinely new distortion targets. For diag(3,1/2) and diag(3,3/4), the supplied perturbation inequality is 1/4 ≤ 1/4. Scaling the first map by −2 gives ℓ = 1 = 2·(1/2); composing with coordinate-swap isometries keeps ℓ = 1/2. Thus the existing statements have the required generality, with no new hypothesis or theorem needed.

## R06 (P2) — The orientation-descent gap has two owners

**Location:** `TauCetiRoadmap/QuasiregularMaps/README.md:81`: “No roadmap plans the orientation of the quotient manifold … it is owned here (§7.5).” Compare `packages/QuasiregularMaps/design/plan.json:1995`.

**Claim:** This package owns the general descent theorem, while its declared gap still requests that same theorem from DifferentialGeometry.

**Witness:** The plan's `orientation-descent` gap names DifferentialGeometry and requests the unique quotient orientation. README §7.5, line 1637, plans that construction here; the exact supplier contracts contain only the six Sobolev gaps.

**Repair:** Reconcile the intake's gap record with the local ownership decision: retire the external orientation-descent request as superseded by §7.5, and record that consumers use this local target. Do not schedule another copy in DifferentialGeometry, Part II. Preserve the six genuine Sobolev contracts. The translation action of ℤⁿ on ℝⁿ tests both descriptions: each asks for the same orientation with dπ carrying the standard positive basis to a positive basis. One local owner and no external request removes the duplicate obligation and contract mismatch.

## R07 (P3) — Register the newly cited Lee source

**Location:** `TauCetiRoadmap/QuasiregularMaps/README.md:1639`, reference at line 1848: “Lee2012, Ch. 15”.

**Claim:** This is a source for the general quotient-orientation theorem, but it is absent from the package's source manifest.

**Witness:** `packages/QuasiregularMaps/sources.toml` has eleven source records and none for Lee, the book title or DOI 10.1007/978-1-4419-9982-5. The sources service resolved that DOI as uncertified/paywalled.

**Repair:** Add one Lee2012 source record with the bibliography, DOI, chapter locator, cited-for §7.5, and the service's uncertified access status. Do not manufacture a certification or reopen the eight settled unavailable sources. A title/author/DOI lookup should then find exactly one record for the reference. No manifest was changed during this review.

## Verified sound

This was a full read of both files: 37 numbered mathematical sections in seven layers, 132 computed adversarial rows, the worked examples and downstream boundary, ten Lean declarations (five definitions and five theorems), all 15 seeded source targets, the supplier contracts and all Needs lines. The findings above distinguish mathematical counterexamples from ownership and source-record defects. Passing examples below are finite adversarial checks, not claims that the admitted theorems have been formally proved.

The head is 64a7eb804e666e390197fef9747d4528cb482e17. The outside-folder diff is empty, the worktree stayed unchanged, and the supplied gate reports every counter zero, including statement hygiene, stray files, dependencies and targeted build. Independent elaboration of Suggested.lean succeeded with only its five expected sorry warnings. No forbidden imports, sorry'd data, options, algorithms or route-specific scope restrictions were found. Comparison with the accessible sources found no copied passages. The organization follows mathematical dependencies rather than a source's chapter order.

The independent dependency check returned:

    depcheck: 235 roadmaps, 2132 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. The six Sobolev contracts are declared with matching slugs in the plan and README; their absence from the pinned library is an explicit conditional dependency, not a finding. R06 concerns the seventh, obsolete request.

**Headline coverage and elaborated types.** The six README end-theorem groups are distortion comparison (§3.2), ACL/Sobolev equivalence and the classical definition (§§5.2–5.3), simplicial quasiregularity (§6.4), ellipticity invariance (§§7.2–7.3), closed orientable flat ellipticity (§7.6), and torus-supplied ellipticity (§7.7). The first two groups supply the five stated Euclidean theorems. The docstring individually names the manifold comparison and the remaining four groups, with the missing continuous manifold-valued Sobolev class, weak differential, norm and Jacobian. Object searches at the pins confirmed that missing carrier; scalar manifold Sobolev inequalities and surface maps at kp > 2 do not supply it.

I elaborated a scratch copy with `#check @name` for each of the ten declarations and compared every type with the README. No hypothesis was silently dropped. In particular, the reverse distortion implication retains an existing quasiregularity witness, the ACL equivalence retains finite-dimensional F and p ≥ 1, and the Euclidean distortion theorems retain Borel measurability and finite dimension. The definitions intentionally admit n = 0; the table evaluates that case. R02 is a prose/docstring generality defect, not a lost theorem binder.

Each of the five admitted theorems was probed on a scratch copy with simp, rfl and infer_instance, with no theorem closed. I also compared the near-match candidates at the pins: the existing weak/classical derivative identification assumes classical differentiability, unlike the new weak-to-ACL conclusion; interval weak derivative theorems are one-dimensional; the existing singular-value inequalities do not directly state the Sobolev-map distortion theorems. No one-library-lemma replacement or padding was found among the five theorems. R05 concerns README API ownership, not an instruction to prove padding in place.

**Seeded source verification.** Printed page numbers below refer to the versions actually read: HeikkilaPankka2025 arXiv v2, Prywes2019 arXiv v1, and the journal scan of MartioRickmanVaisala1969. Published Annals pagination was not substituted for preprint pagination. No additional locator was marked unverified in the README. The eight previously uncertified works remain uncertified.

| Seeded target | Text and locator inspected | Support and hypothesis check |
| --- | --- | --- |
| 1.2 Outer and inner linear distortion | MartioRickmanVaisala1969 lines 409–425, Definition 2.20, (2.21)–(2.22), printed p. 14 | The two inequalities and projection warning agree. The source uses n ≥ 2 and maximal K; the README distinguishes outer K and gives its elementary linear extension, including n = 1. |
| 1.4 Hilbert–Schmidt distortion | MartioRickmanVaisala1969 lines 426–439, (2.23), p. 14; (2.24), p. 15 | The n^(n/2) normalization and comparison direction agree. The singular-value computation supplies the pointwise form. |
| 2.4 Jacobian | Rickman1993, Ch. I, unavailable | Source certification withheld; positivity and zero-derivative consequences follow algebraically from K ≥ 1, n ≥ 1 and the declared Jacobian contract. |
| 2.6 Vanishing differential | Rickman1993, Ch. I, unavailable | Source certification withheld; the local chart-ball route uses the pinned zero-gradient theorem, continuity and connectedness. The dimension-one Check correctly avoids claiming positivity almost everywhere. |
| 2.8 Locally Lipschitz maps | HeikkilaPankka2025 lines 1255–1260, Lemma B.2, p. 23 | The source states the narrower closed-source, scalar, piecewise smooth W¹,∞ result. The README acknowledges this and gives a different, general chartwise Rademacher route with pinned inputs. |
| 2.9 Euclidean domains | MartioRickmanVaisala1969 lines 409–425, Definition 2.20, p. 14; Prywes2019 lines 22–27, p. 1 | Operator norm, positive oriented determinant and the local critical Sobolev exponent agree. The classical ACL definition is related through §5.3; manifold compatibility remains a declared supplier contract. |
| 3.4 Hilbert–Schmidt map distortion | MartioRickmanVaisala1969 lines 426–439, (2.23)–(2.24), pp. 14–15 | Correct comparison and normalization; taking max with 1 treats constants correctly. |
| 4.3 Precomposition | Rickman1993, Ch. I, unavailable | Source certification withheld; the stated C¹ local diffeomorphism has the necessary null-preimage property and the declared chain rule. |
| 4.4 Postcomposition | Rickman1993, Ch. I, unavailable | Source certification withheld; a C¹ outer map gives a pointwise differential bound, avoiding pullback of an exceptional null set under f. |
| 5.2 ACL/Sobolev | Vaisala1971, Ch. 3; Rickman1993, Ch. I, unavailable | Source certification withheld. The stated finite-dimensional target, continuity and p ≥ 1 match the componentwise interval/Fubini route. R02 concerns the preceding section's broader assertion. |
| 6.3 Piecewise C¹ | HeikkilaPankka2025 lines 1255–1316, Lemma B.2 and proof, pp. 23–24 | The source is scalar and closed-source; the README explicitly extends it using locally finite pasting and local Lipschitz estimates. R03 corrects its weak differential representative claim. |
| 6.4 Simplicial maps | HeikkilaPankka2025 lines 1247–1251, Proposition B.1, p. 23; lines 1317–1339, proof, p. 24 | Source: closed oriented PL n-manifolds, n ≥ 2, compatible smooth structures, nondegenerate orientation-preserving map. The broader roadmap retains finite simplexwise distortion and explains the extension. R01 corrects a negative control, not this sufficient theorem. |
| 7.1 Ellipticity | HeikkilaPankka2025 lines 20–27, p. 1, and 271–273, p. 6; Prywes2019 lines 22–27, p. 1 | Nonconstant map from all of ℝⁿ, with finite distortion. Source closed-target assumptions are distinguished from the roadmap's broader definition. |
| 7.3 Metric independence | HeikkilaPankka2025 lines 18–34, p. 1; README §4.1 | The source uses ellipticity on closed manifolds; it does not state the displayed quantitative comparison. That comparison is an internal deduction, requiring the missing positivity in R04. |
| 7.6 Flat manifolds | HeikkilaPankka2025 lines 52–57, p. 2; Prywes2019 lines 33–36, p. 1; RiemannianGeometry R4.7 | The papers give tori, not the full flat-manifold theorem. The latter is the roadmap's deduction from the supplied Killing–Hopf classification, the descended orientation and a local isometry. |

**Pinned-library audit.** Mathlib is pinned at 1b1ccf4b088b32fa3f23f2de1127433254a81e1e; Tau Ceti at 2fd255d997f47c0b5d834ee416c7015d55444ce5. Searches were by operators and hypotheses, not only proposed names. The following 25 interface rows record opened declarations and their near-match distinctions:

| Declaration or object | Pinned file and line | What was checked |
| --- | --- | --- |
| LinearMap.singularValues; antitonicity; positivity/injectivity | `Mathlib/Analysis/InnerProductSpace/SingularValues.lean:95`, line 142, line 156 | Zero-based descending indices; zero beyond the domain dimension. |
| normDet product and absolute determinant | `Mathlib/Analysis/InnerProductSpace/NormDet.lean:374`, line 389 | Product of singular values and absolute determinant; dimension-zero determinant normalization. |
| Orientation.volumeForm; negation; map | `Mathlib/Analysis/InnerProductSpace/Orientation.lean:170`, line 223, line 290 | The sign comes from one orientation reversal; it is not an absolute Jacobian. |
| singularValues_mul_norm_le_norm_apply | `TauCeti/Analysis/InnerProductSpace/SingularValues.lean:325` | Lower bound on the appropriate singular-vector span, not a minimum over the standard basis. |
| operator norm = first singular value; Weyl bound | `TauCeti/Analysis/OperatorIdeal/ApproximationNumber/EckartYoung.lean:98`, line 106 | Norm normalization and the already supplied perturbation theorem (R05). |
| singular-value isometry and scalar laws | `TauCeti/Analysis/InnerProductSpace/SingularValues.lean:589`, line 595, line 602 | Existing full-sequence laws specialize to minimal stretch (R05). |
| Frobenius singular-value formula | `TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/Frobenius.lean:191` | Hilbert–Schmidt norm squared is the sum of squared singular values. |
| HasWeakFDerivOn; congr_ae_deriv; ae_eq | `TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:251`, line 453, line 856 | Native weak derivatives, local integrability, almost-everywhere uniqueness and freedom at individual points. |
| ae_eq_lineDeriv | `TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:881` | Requires classical differentiability; does not duplicate the new weak-to-ACL theorem. |
| Interval weak derivative implies AC and a.e. derivative | `TauCeti/Analysis/Sobolev/WeakDeriv/Interval.lean:302`, line 318 | Continuous interval representative and integrable weak derivative, with endpoint order. |
| Weak derivative locality | `TauCeti/Analysis/Sobolev/WeakDeriv/Local.lean:71` | Open-cover localization used by the Euclidean class. |
| Locally Lipschitz weak derivative | `TauCeti/Analysis/Sobolev/WeakDeriv/Lipschitz.lean:134` | Finite-dimensional target and local, rather than global, Lipschitz hypothesis. |
| Locally Lipschitz Rademacher | `TauCeti/Analysis/Calculus/Rademacher.lean:83` | Almost-everywhere differentiation on open Euclidean domains. |
| Zero weak gradient implies a.e. constant | `TauCeti/Analysis/Sobolev/Poincare/Wirtinger/W1p.lean:436` | Apply on relatively compact chart balls; continuity upgrades a.e. constancy. |
| Scalar AC differentiation | `Mathlib/MeasureTheory/Function/AbsolutelyContinuous.lean:444` | Scalar target; the omitted general-target hypothesis is R02. |
| Cantor function and failure of AC | `TauCeti/Analysis/SpecialFunctions/CantorFunction.lean:71`, line 245 | Classical derivative zero a.e. does not make a weak derivative zero. |
| Coordinate Fubini; interval integration by parts | `Mathlib/MeasureTheory/Constructions/Pi.lean:819`; `Mathlib/MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean:259` | Inputs to the coordinate-line/weak derivative identification. |
| IsNullSet; countable unions; empty interior | `TauCeti/Geometry/Manifold/Measure.lean:36`, line 70, line 89 | Chartwise definition, not a claim that every arbitrary uncountable union is null. |
| riemannianVolume; local finiteness | `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82`, line 179 | Continuous metric hypotheses; the null-set comparison is separately declared. |
| IsSimplexImmersion; IsSmoothTriangulation | `TauCeti/Geometry/Manifold/SmoothTriangulation/Basic.lean:97`, line 191 | Full-rank smooth extensions on closed faces; the native definition does not include local finiteness or purity. |
| Realization compactness | `TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Compact.lean:87`, line 97 | Compact subsets have finitely many carrier vertices; the local-finiteness deduction is new here. |
| Quotient manifold, local diffeomorphism and differential identity | `TauCeti/Geometry/Manifold/Instances/Quotient.lean:242`, line 253, line 264 | Free properly discontinuous action; dπ at γx composed with dγ equals dπ at x. |
| Orientation-preserving predicate | `TauCeti/Geometry/Manifold/Orientation/Preserving.lean:63` | Linear-equivalence witness agreeing with mfderiv and carrying the orientation; smoothness is supplied separately. |
| Orientation constructors and sign alternative | `TauCeti/Geometry/Manifold/Orientation/Basic.lean:172`, line 200, line 206 | Connected-source sign comparison and construction from tangent-bundle orientations. |
| Local constancy for transported orientations | `TauCeti/Geometry/Manifold/Orientation/Pullback.lean:255` | Local diffeomorphism input used in the descent proof. |

**Cross-roadmap ownership and supplier resolution.** The source of existing roadmap contracts was main, including DifferentialGeometry despite its open revision. Open new-roadmap heads were read for their own objects. No other Suggested.lean declaration with one of this file's ten fully qualified names was found. The ten ownership rows below resolve the relevant boundaries. The overlap evidence has no shared-folder conflict, dropped cited identifier, or identifier defined only by an open revision.

| Owner and locator resolved | Boundary verified |
| --- | --- |
| `TauCetiRoadmap/DifferentialGeometry/README.md:1009`, line 1041, line 2801, line 2896 (2.1–2.2, 12.1, 12.4 on main) | Orientations, maps, metrics and volume foundations. General free-action orientation descent is not supplied there; §7.5 may own it, subject to R06. |
| `TauCetiRoadmap/RiemannianGeometry/README.md:2318`, line 2370 (R4.7 on main) | Descended quotient metric and Killing–Hopf classification. Its projective-space orientation example does not own the general theorem. |
| `TauCetiRoadmap/GeometricTopology/README.md:7887` (11.3 on main) | Smooth triangulations and PL foundations; does not supply the local Lipschitz/full-rank metric estimates newly planned here. |
| `TauCetiRoadmap/PDE/README.md:677` (§1.1 on main) | One-dimensional Sobolev/AC input; the multidimensional coordinate-line equivalence is distinct. |
| `TauCetiRoadmap/PseudoholomorphicCurveAnalysis/README.md:89`, §4.1 on main | Surface maps with kp > 2, not critical W¹,² planar quasiregularity. |
| `TauCetiRoadmap/Orbifolds/README.md:37` (scope on main) | Orbifold presentation orientations and descended orientation local systems, not the native quotient-manifold orientation constructed in §7.5. |
| `TauCetiRoadmap/TeichmullerGeometry/README.md:740` (§7.4, #1169 head) | Weak Wirtinger derivatives and W¹,² quasiconformal homeomorphisms. Its Beltrami convention yields K = 3 for z + conjugate(z)/2, matching this roadmap. No reverse supply edge. |
| `TauCetiRoadmap/SobolevDifferentialForms/README.md:18` (scope, #1609 head) | Euclidean Sobolev differential forms and weak exterior differentiation; no second owner of continuous manifold-valued Sobolev maps or ACL equivalence. |
| CalibratedGeometry #946, `TauCetiRoadmap/CalibratedGeometry/README.md`, Scope and ownership; TangentialBordism #942, `TauCetiRoadmap/TangentialBordism/README.md`, Scope and ownership | Calibration, currents, Grassmannians and bordism/Thom objects are distinct from quasiregular maps and the local triangulation estimates. |
| `packages/SobolevMapsBetweenManifolds/design/README.md:691`, line 764, line 863, line 906, line 944, line 964, line 1005, line 1047, line 1072, line 1091, line 1123, line 1182, line 1223, line 1296 | Resolved §§3.1, 3.3, 4.2–4.6, 5.1–5.3, 6.1–6.3 and 7.1 in the declared supplier design. The six gaps give the precise missing contracts; weak differentiation is only an a.e. construction. |

The supplier requests concern continuous manifold-valued Sobolev maps, not the already implemented Euclidean weak derivatives. The oriented Jacobian request includes different tangent spaces and their orientations; the native absolute determinant and endomorphism determinant are components, not the whole missing carrier. The continuous-metric null-set comparison is stronger than the smooth-metric instance. No extra unowned prerequisite or mutual ownership was found beyond the explicit findings.

**Adversarial computations.** The following table covers all 37 numbered sections, the five Lean theorem statements and their five supporting definitions, the six end-theorem groups, the worked examples and each mathematical finding. Separate rows distinguish the relevant defining laws and API assertions. Here A = diag(2,1), B = diag(3,1/2), P = diag(1,0), R = diag(−1,1), and I is the identity in the indicated dimension. For a definition, “pass” means its computed outputs separate the intended example and wrong model; for a theorem it means these instances did not refute it. The repairs in failed rows are the requests above.

| Statement / law | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: operator versus Hilbert–Schmidt normalization | A in dimension 2 | norm² = 4, J = 2, outer K = 2; HS²/(2J) = 5/4 | Distinct normalizations | None |
| Conventions: oriented versus absolute Jacobian | R; reverse target orientation | J = −1, qO = ∞ versus absolute-J quotient 1; reversed target J = +1 | Wrong absolute convention excluded | None |
| Conventions: index n − 1 | B, n = 2 | singular values at indices 0,1,2 are 3,1/2,0 | Last-index definition gives 1/2 | None |
| §1.1 minimalStretch definition and attainment | B; unit e₂; zero map | minimum norm(Bv) = 1/2 = norm(Be₂); zero minimum 0 | Pass | None |
| §1.1 lower bound and wrong basis minimum | shear S = [[1,1],[0,1]] | ℓ = (√5−1)/2; minimum column norm = 1; norm(Sv) ≥ ℓ for unit v | Basis-only model excluded | None |
| §1.1 ℓ ≤ norm and equality characterization | 2I, A, 0 | 2 = 2; 1 < 2; 0 = 0; equality models are 2·I and 0·I | Both directions pass | None |
| §1.1 injectivity and inverse norm | B, P | ℓ(B) = 1/2 > 0 and inverse norm = 2, product 1; ℓ(P) = 0, kernel dimension 1 | Pass | None |
| §1.1 composition lower bound | diag(2,1) and diag(1,2) | ℓ(2I) = 2 ≥ 1·1 | Strict case passes | None |
| §1.1 scalar and isometry laws | −2B; left/right coordinate swaps | ℓ(−2B) = 1 = 2·(1/2); swapped ℓ = 1/2 | True, already supplied | R05: cite pin |
| §1.1 determinant sandwich | B; P | (1/2)² = 1/4 ≤ 3/2 ≤ 9; 0 ≤ 0 ≤ 1 | Pass | None |
| §1.1 perturbation bound | B and B' = diag(3,3/4) | abs(ℓ(B)−ℓ(B')) = 1/4 = norm(B−B') | True, already supplied | R05: cite pin |
| §1.1 rank-zero and rank-one Lean inputs | zero source; scalar a on ℝ | index max(0−1,0) = 0, ℓ = 0; ℓ(aI) = abs(a) | Total-function conventions pass | None |
| §1.2 qO and qI definitions, nonvanishing denominator | A, 0, P, R | (qO,qI) = (2,2), (0,0), (∞,0), (∞,0); for A, J = 2 and ℓ² = 1 | Zero, singular and wrong-sign models separated | None |
| §1.2 singular-value product expressions and ≥ 1 | diag(3,2,1) | qO = 27/6 = (3/2)·3 = 9/2; qI = 6 = 3·2; both ≥ σ₁/σ₃ = 3 | Pass | None |
| §1.2 scale/isometry/orientation invariance | 2A; −I in dimensions 2,3; both orientations reversed | qO(2A) = 16/8 = 2; det(−I) = +1,−1 gives qO = 1,∞; two reversals multiply J by +1 | Parity and signs pass | None |
| §1.2 outer submultiplicativity including 0·∞ | A²; 0 composed with R | qO(A²) = 4 = 2·2; qO(0) = 0 = 0·∞ | Pass | None |
| §1.2 inner submultiplicativity and sign hypothesis | A²; R² | 4 = 2·2; qI(R²) = 1 > 0·0 | Sign restriction necessary | None |
| §1.2 qO ≤ 1 classification | 2I; 0; A; R | qO = 1,0,2,∞ respectively | Both accepted models and both exclusions pass | None |
| §1.2 lower semicontinuity and Borel behavior | diag(1,ε) → P; εI → 0 | qO = 1/ε → ∞ = qO(P); qO(εI) = 1, limit-map qO(0) = 0 ≤ 1 | Lower rather than full continuity correct | None |
| §1.3 inequality iff quotient bound | A at K = 2; P at K = 1 | 4 ≤ 2·2 and 2 ≤ 2; P outer 1 ≤ 0 false and ∞ ≤ 1 false; inner 0 ≤ 0 true and 0 ≤ 1 true | Both iff directions pass | None |
| §1.3 K ≥ 0 restriction | R, K = −1 | norm² = 1 ≤ (−1)(−1) = 1 but qO = ∞ | Negative K excluded | None |
| §1.3 sharp comparison, each direction | diag(2,1,1); diag(1,1,1/2) | (qO,qI) = (4,2), (2,4); 4 = 2² in opposite directions | Exponent n − 1 necessary | None |
| §1.3 equality cases and strict case | diag(3,2,1) | 6 < (9/2)² = 81/4; 9/2 < 6² = 36; neither required repeated singular-value block holds | Pass | None |
| §1.3 n = 1 and zero | positive scalar; zero | 1 ≤ 1⁰ = 1 both ways; at zero, 0 ≤ 0⁰ = 1 | Natural exponent boundary passes | None |
| §1.4 qS definition and AM–GM equality | A; 2I; 0; R | qS = 5/4,1,0,∞; for A, arithmetic mean 5/2 > geometric mean 2 | Conformal and degenerate models separated | None |
| §1.4 comparison and sharp constant | diag(1,ε), 0 < ε < 1 | qO = 1/ε, qS = (1+ε²)/(2ε); ratio = 2/(1+ε²) < 2, tends to 2 | Strictness and supremal sharpness pass | None |
| §1.4 dimension-three sharpness | diag(1,ε,ε) | qO/qS = 3^(3/2)/(1+2ε²)^(3/2) → 3^(3/2) | Correct normalization | None |
| §1.5 planar singular values and J | a = 1, b = 1/2 | norm = 3/2, ℓ = 1/2, J = 3/4; qO = (9/4)/(3/4) = 3 | Pass | None |
| §1.5 planar Beltrami iff | a = 1,b = 1/3,k = 1/3; a = b = 0 | qO = 2 = (1+k)/(1−k), abs(b) = k abs(a); zero gives 0 ≤ 2 and 0 ≤ 0 | Both nonzero and zero branches pass | None |
| §1.5 anti-holomorphic and conformal models | (a,b) = (0,1), (2i,0) | J = −1,qO = ∞; J = 4,norm² = 4,qO = 1 | Wrong orientation excluded | None |
| §2.1 QR definition and monotonicity | I, constant, fold | I: 1 ≤ K; constant: 0 ≤ 0; fold negative half: 1 ≤ −K false for K ≥ 1 | Intended class separated | None |
| §2.1 lower bound on K and zero derivative consequence | I, K = 1/2; D = 0 | 1 ≤ 1/2 false; 0 ≤ 0 true | Subunit K forces zero D | None |
| §2.1 empty source | M = ∅ | a.e. inequality and continuity are vacuous, least permitted K = 1 | Explicit convention coherent | None |
| §2.2 outer distortion and a.e. representative independence | z²; alter D at z = 0 | qO = 1 off 0; qO at 0 can change without changing ess sup = 1; KO = 1 | Pass | None |
| §2.2 bad class excluded | fold; Cantor coordinate map | fold qO = ∞ on half-space, KO = ∞; Cantor weak W¹,¹ membership fails, KO = ∞ despite classical derivative 0 a.e. | Raw derivative quotient is insufficient | None |
| §2.3 least distortion attained | I, fold, empty source | admissible K sets [1,∞), ∅, [1,∞); KO values 1,∞,1 | Both set-equality directions pass | None |
| §2.4 positive J, zero locus and absolute determinant | z²; P | z²: J = norm² = 4 abs(z)², D₀ = 0; P: J = 0 but norm² = 1 | Projection correctly excluded | None |
| §2.4 local integrability of radial Jacobian | a > 0, n ≥ 1, unit ball | J = a r^(n(a−1)); radial integral = a·area(Sⁿ⁻¹)/(na) = area(Sⁿ⁻¹)/n | Exponent condition na > 0 passes | None |
| §2.5 restriction and fixed-K locality | shear (x,y+x³/3), strips abs(x) < R | J = 1; strip KO = ((R²+√(R⁴+4))/2)²; supremum over R = ∞ | Local finite bounds do not imply global finite K | None |
| §2.5 empty-cover normalization | empty source, empty cover | KO = 1; bare supremum = 0; max(1,0) = 1 | Pass | None |
| §2.6 zero weak gradient and connectedness | connected constant; two components with values 0,1 | D = 0 in both; image cardinalities 1 and 2 | Connectedness distinguishes conclusion | None |
| §2.6 classical versus weak derivative | Cantor function c | c(1)−c(0) = 1; integral of classical c' = 0 | Cannot substitute classical derivative | None |
| §2.6 positive measure versus a.e. positivity | t ↦ max(0,t) | D = J = 0 on t < 0 and 1 on t > 0; KO = 1 | Correct dimension-one strength | None |
| §2.7 C¹ pointwise inequality and supremum | z²; (x³,y) | z²: 4 abs(z)² = 1·J; at (0,y), second map norm² = 1 > J = 0; nearby qO → ∞ | Pointwise characterization passes | None |
| §2.7 conformal/isometric characterization | 2I; torus projection; −I | 2I: normⁿ = J = 2ⁿ; projection norm = J = 1; −I has J = (−1)ⁿ | Orientation condition necessary | None |
| §2.8 chartwise local Lipschitz definition and W¹,p membership | fold; u(t) = abs(t)^(1/2) | fold Lipschitz constant 1, weak derivative magnitude 1; u ratio abs(u(t)−u(0))/abs(t) = abs(t)^(−1/2) → ∞ | Negative control fails local Lipschitz as intended | None |
| §2.8 a.e. classical/weak derivative and QR | winding map of ℝ³ | off axis singular values (2,1,1), J = 2; norm³ = 8 = 4J; inner J = 2·ℓ³ | KO = 4, KI = 2 | None |
| §2.8 exponent range of non-Lipschitz control | abs(t)^(1/2), p > 0 | integral on (−1,1) of abs(u')^p = 2^(1−p)/(1−p/2) for p < 2; diverges for p ≥ 2 | “Every p” is discriminating | None |
| §2.9 IsQuasiregularOn definition | linear A, R, P, constant | A: 4 ≤ 2·2; R: 1 ≤ K(−1) false; P: 1 ≤ 0 false; constant: 0 ≤ 0 | Real-bodied predicate separates models | None |
| §2.9 restriction, derivative choice, off-domain values | Ω open, alter f off Ω; alter Du at one interior point | test functions see zero change outside Ω; derivative fields differ on measure 0; integrals and a.e. bound unchanged | Native domain and a.e. semantics pass | None |
| §2.9 n = 0 Lean case | zero-dimensional E, K = 1 | norm(Du)^0 = 0^0 = 1; det(Du) = 1; inequality 1 ≤ 1 | No 0/0 or subtraction defect | None |
| §2.9 radial stretch formula | n = 3, a = 2 and a = 1/2, r = 1 | (norm,ℓ,J) = (2,1,2), (1,1/2,1/2); KO = 4,2 | Both radial branches pass | None |
| §2.10 Beltrami characterization | f(z) = z + conjugate(z)/2 | f_z = 1, f_zbar = 1/2; k = 1/2, K = 3; abs(f_zbar) = k abs(f_z) | Matches TeichmullerGeometry convention | None |
| §2.10 holomorphic QR versus homeomorphism | z²; conjugation | z²: KO = 1 but 1 and −1 have same image; conjugation: f_z = 0,f_zbar = 1,J = −1 | Quasiconformal homeomorphism is a stricter class | None |
| §3.1 inner/maximal definitions and attainment | radial a = 1/2 in ℝ³; P | radial (KO,KI,K) = (2,4,4); P raw qI = 0 but KI = ∞, not 1 | Wrong off-class extension excluded | None |
| §3.1 inner restriction and C¹ supremum | A on ℝ² and an open ball | qI = 2 everywhere; both inner distortions 2, restricted ≤ global | Pass | None |
| §3.1 distortion-one equivalences | I; zero; A | (KO,KI,K) = (1,1,1), (1,1,1), (2,2,2) | Both iff directions pass | None |
| §3.2 first Lean theorem | radial a = 1/2 in ℝ³, r = 1, K = 2 | det Du = 1/2; K²·ℓ³ = 4·(1/8) = 1/2; exponent 1 would give 1/4 | Sharp equality | None |
| §3.2 second Lean theorem | radial a = 2 in ℝ³, r = 1, inner K = 2 | J = 2 = 2·1³; output K² = 4; outer norm³ = 8 = 4·2 | Sharp equality | None |
| §3.2 existing-QR hypothesis in reverse theorem | P, K = 1 | inner 0 ≤ 1·0 true; outer 1 ≤ 1·0 false | Hypothesis prevents false converse | None |
| §3.2 both inequalities and maximal K | diag(3,2,1) | KO = 9/2, KI = K = 6; 6 ≤ 81/4 and 9/2 ≤ 36 | Pass | None |
| §3.2 n = 1 and n = 0 theorem signatures | nondecreasing scalar map; zero-dimensional E | n = 1: J = ℓ ≥ 0, K⁰ℓ = ℓ; n = 0: J = 1 = K⁰·0⁰ | Natural subtraction does not break these signatures | None |
| §3.3 inner inequality not a definition | P in dimension 2; zero in dimension 1 | dimension 2: inner 0 = 0, outer 1 > 0; dimension 1: outer 0 = 0, KO = 1 | Boundary dimension correct | None |
| §3.4 KS definition and comparison | I, A, constant, fold | (KS,KO) = (1,1), (5/4,2), (1,1), (∞,∞); for A, 5/4 ≤ 2 ≤ 5/2 | Pass | None |
| §3.4 normalized inequality iff bound | A, K = 5/4 | HS² = 5 = 2·(5/4)·J; KS = 5/4 | Both sides have same threshold | None |
| §3.4 sharpness and conformal equality | diag(1,ε); cI with c > 0 | KO/KS = 2/(1+ε²) → 2; for cI, KS = KO = 1 | Pass | None |
| Layer 3 example table | winding map; radial a = 2, n = 3 | winding KS = 6^(3/2)/(3^(3/2)·2) = √2; radial a = 2 gives same singular values and same KS | Table arithmetic consistent | None |
| §4.1 norm and volume-density change | target metric dx²+4dy²; source Euclidean; A = I | new norm = 2; density = 2, new J = 2; actual qO = 2 ≤ (2/1)²·1 = 4 | Bounds and density direction pass | None |
| §4.1 conformal invariance | multiply target metric by c², c > 0 | norm'ⁿ = cⁿ normⁿ, J' = cⁿJ; quotient unchanged | Cancellation correct | None |
| §4.1 source rescaling | source metric c²g, target unchanged | norm' = norm/c, J' = J/cⁿ; qO' = qO | Correct reciprocal density | None |
| §4.1 compactness versus noncompact metric comparison | target dx²+e^(2x)dy², identity of ℝ² | qO = e^abs(x), supremum ∞; on abs(x) ≤ R, supremum e^R | Uniform comparison cannot be omitted | None |
| §4.2 one/both orientation reversals | identity; reflected map with reversed target | one reversal J = −1; two reversals J = +1; reflected map reversed target J = (−1)(−1) = +1 | Signs pass | None |
| §4.2 QR for both target orientations | connected constant; identity | constant has D = J = 0 and works both ways; identity needs 1 ≤ −K after one reversal | Constancy conclusion passes | None |
| §4.3 precomposition estimates | torus projection θ; A; reflection | θ has KO = KI = 1, A∘θ has KO = KI = 2 ≤ 2·1; reflection violates orientation condition, qO = ∞ | Hypotheses discriminate | None |
| §4.3 necessity of a global bound | shear θ(x,y) = (x,y+x³/3), f = id | qO(dθ) = ((x²+√(x⁴+4))/2)² → ∞ while KO(f) = 1 | Local diffeomorphism alone insufficient | None |
| §4.4 postcomposition estimates | z² after z²; radial a = 2 after a = 1/2 in ℝ³ | z⁴ has KO = 1 ≤ 1·1; radial composition is id, KO = 1 ≤ 4·2 = 8, KI = 1 ≤ 2·4 = 8 | Finite but nonsharp product bound passes | None |
| §5.1 formalDeriv definition and column convention | u(x,y) = (y,0) | D(e₁) = 0, D(e₂) = e₁; matrix [[0,1],[0,0]], not its transpose | Wrong convention excluded | None |
| §5.1 ACL definition: continuity matters | indicator of {0} in ℝ² | a.e. coordinate line avoids 0 and has derivative 0; u(0)=1 versus nearby limit 0 | ACL false despite a.e. good lines | None |
| §5.1 ACL line measure versus face measure | Q = [0,2]×[0,3], exceptional transverse set B | area of exceptional lines = 2·length(B); zero iff length(B)=0 | Positive side length used | None |
| §5.1 ACL wrong differentiability criterion | Cantor coordinate function | partials = 0 a.e.; on every first-coordinate line, endpoint increment 1 versus derivative integral 0 | ACL false | None |
| §5.1 ACL partials for general F | F = C([0,1],ℝ), u(t)(s)=abs(t−s) | norm increment = abs(h); at s=t, quotient = +1 or −1; exceptional set is all (0,1), measure 1 | Fails | R02 |
| §5.1 derivative equals fderiv when differentiable | u(x,y) = (y,0); abs(x) off x=0 | both derivative matrices [[0,1],[0,0]]; scalar row (sign(x),0) | Pass | None |
| §5.1 ACLp definition and critical exponent | u(x)=norm(x)^(1/2) in ℝ², p > 0 | integral of norm(Du)^p over unit disk = 2π·2^(−p)/(2−p/2), finite iff p < 4 | Distinguishes p = 3 from p = 4 | None |
| §5.1 locality and exponent inclusion | same u on a disk away from 0; p = 3 versus p = 4 | on radius ≥ δ > 0 derivative ≤ 1/(2√δ); at 0, p=3 finite and p=4 divergent | Local and global distinctions pass | None |
| §5.1 linear combination and linear postcomposition | u(x)=x on ℝ, T(y)=3y, v=−u | D(Tu)=3=T(Du); D(u+v)=0=1−1; all compact Lp norms finite | Pass | None |
| §5.1 C¹ and locally Lipschitz examples | t² on compact [−R,R]; abs(t) | derivative bounds 2R and 1; compact L∞ seminorms finite | Positive controls pass | None |
| §5.1 p = 0, n = 0 total definitions | zero formal derivative on a point | no coordinate indices; formalDeriv = 0; MemLp at 0 reduces to a.e. strong measurability, true | Explicit unused p=0 convention coherent | None |
| §5.2 first equivalence theorem | u(t)=abs(t), p=∞; Cantor c | abs(t): weak derivative sign(t), essential norm 1, ACL∞ true; c: ACL false and no L¹ weak derivative representing its variation | Both directions tested | None |
| §5.2 p ≥ 1 is needed | disjoint scaled bump construction in its Check, p=1/2 | horizontal derivative p-masses proportional to 8^(−k/2), vertical ones to 4^(−k), both summable; horizontal L¹ masses each 1, sum ∞ | Subunit exponent counterexample separates classes | None |
| §5.2 continuous representative required | u = indicator of {0} in ℝ² | u = 0 a.e., weak derivative 0; ACL false because value 1 at 0 disagrees with limiting value 0 | Continuity hypothesis used | None |
| §5.2 a.e. HasLineDerivAt theorem | u(t)=abs(t); alter weak derivative at t=1 | coordinate derivative = sign(t) except t=0; altered value at 1 can disagree only on measure-zero {1} | a.e. conclusion has correct strength | None |
| §5.2 finite-dimensional and zero-dimensional endpoints | F=ℝ² with u(t)=(t,abs(t)); n=0 | derivative (1,sign(t)) off 0; for n=0, derivative operator 0, coordinate assertion is empty, both class memberships true | Binder and endpoint checks pass | None |
| §5.3 classical versus Sobolev QR theorem | A; P; radial a=1/2 in ℝ³ | A: ACL² and 4≤2·2; P: ACL² but 1≤0 false; radial: norm³=r^(−3/2)=2J with critical power locally integrable | Both sides agree | None |
| §5.3 outer versus maximal convention | radial a = 1/2 in ℝ³ | KO = 2, KI = 4; modern 2-QR true, maximal 2-QR false, maximal 4-QR true | Source convention distinguished | None |
| §5.3 n=0 Lean equivalence | unique map E→E, E zero-dimensional | ACL⁰ true, norm(formalDeriv)^0 = 1, det = 1, condition 1 ≤ K on both sides | Pass | None |
| §6.1 full-rank smooth triangulation | interval map t↦t² at endpoint 0 | derivative 0; inverse √t has ratio √t/t = 1/√t → ∞ | Mere smooth homeomorphism excluded | None |
| §6.1 pure locally finite complex versus native definition | triangulated manifold; infinite star at central vertex | manifold neighborhoods meet finitely many full-dimensional simplices; star center lies in infinitely many closed edges | Local finiteness is a new deduction, not a native field | None |
| §6.1 compact realization criterion | finite triangle boundary; infinitely many star vertices | carrier vertex set size 3 versus ∞; first realization compact, second not compact | Matches pinned compactness input | None |
| §6.1 local bi-Lipschitz and orientation derivatives | radial projection of triangle edge to circle | angular derivative = (√3/2)/(1−3t+3t²), between √3/2 and 2√3 | Strict positive minimum supplies local inverse bound | None |
| §6.1 lower skeleton nullity and dense interiors | triangle on S¹; tetrahedral S² | skeleton sizes: 3 points, 6 arcs; dimensions 0<1 and 1<2, ambient volume 0 | Countable local finite union has measure 0 | None |
| §6.2 simplicial map definition, identity and composition | identity vertex map; composition of vertex maps | realized id has differential I; κ₃|t|κ₂⁻¹κ₂|s|κ₁⁻¹ = κ₃|t∘s|κ₁⁻¹ | Source/target and cancellation correct | None |
| §6.2 nondegenerate does not imply orientation preserving | fold across x=0 | differential diag(1,1) on right and diag(−1,1) on left; determinants +1 and −1 | Separate orientation condition needed | None |
| §6.2 positive J on closed simplex | orientation-preserving affine diagonal(2,1) | interior J = 2; boundary extension J = 2 ≠ 0 | Continuity plus invertibility works | None |
| §6.2 vertex-identification Check | all three vertices of a triangle sent to one | image dimension 0, rank 0; asserted n−1 = 1 | Fails | R01 |
| §6.3 finite-piece Lipschitz gluing | abs(x) across two half-planes | each piece Lipschitz 1; across −a and b, increment abs(b−a) ≤ a+b = distance | Combined Lipschitz estimate passes | None |
| §6.3 pointwise weak differential identification | identity with D(x₀)=0 at an interior point | chosen weak D(x₀)=0, classical d(id)(x₀)=I; elsewhere both I | Pointwise claim fails, a.e. repair passes | R03 |
| §6.4 finite simplex bound and exact distortion | torus doubling, diag(2,1) on every simplex | Kp = sup 4/2 = 2 = KO; KI = sup 2/1 = 2 | End theorem and exact suprema pass | None |
| §6.4 nonempty versus empty source normalization | identity; empty triangulated source | Kp = 1 versus sup∅ = 0; max(1,Kp)=1 both cases | Nonempty qualifier necessary for Kp ≥ 1 | None |
| §6.4 degenerate map exclusion Check | constant simplicial map; rank-one triangle collapse | constant norm=J=0 accepts K=1; rank-one norm>0,J=0 rejects every finite K | General degeneracy is not an obstruction | R01 |
| §6.4 noncompact finite-distortion hypothesis | strip map (h(x),y), slope k on [k,k+1] | J=k, norm²=k², qO=k; supremum over k is ∞ | Global hypothesis cannot be removed | None |
| §7.1 ellipticity definition: nonconstant and entire domain | id:ℝⁿ→ℝⁿ; constant; local coordinate ball | id: J=1,image not singleton; constant:J=0,image singleton; local chart domain is bounded rather than all ℝⁿ | Both conditions discriminate | None |
| §7.1 equivalence with J positive on positive measure | nonconstant radial map; constant | radial J=a r^(n(a−1))>0 off 0; constant J=0 everywhere | Pass using connected-source §2.6 | None |
| §7.2 orientation independence | f∘R with target orientation negated | new J = −J_f(Rx)·det R = J_f(Rx); R bijective preserves image cardinality | End theorem passes | None |
| §7.3 quantitative metric transfer as written | same metric on ℝ; α=−2,β=1,K=1 | norm bound −2 abs(w)≤abs(w)≤abs(w) true; output distortion −1/2<1 | Fails | R04 |
| §7.3 repaired metric bounds and compact consequence | same metric α=β=1; anisotropic flat torus α=1,β=2 | factors 1 and 4; actual torus ellipticity constant 1 via a flat covering | Positivity repair passes | R04 |
| §7.4 local diffeomorphism transfer | torus doubling; exponential to punctured plane | doubling Kq=2, composition bound 2·1=2; exp has J=abs(exp z)²>0, norm²=J, Kq=1 | Transfer and non-surjective target example pass | None |
| §7.4 nonconstancy and orientation requirement | constant composite with local-diffeomorphism q; conjugation | connected image in discrete fibre has cardinality 1; conjugation det=−1 and Kq=∞ | Nonconstancy argument and exclusion pass | None |
| §7.5 descended orientation definition and uniqueness | trivial group; ℤⁿ translations | dπ for trivial group = I; dγ for translations = I, determinant +1; transported positive basis is identical for every lift | Intended orientation determined | R06 only for ownership |
| §7.5 pullback and negation | torus projection, input o and −o | π*(o/Γ)=o; replacing o by −o multiplies orientation sign by −1 | Fixed-orientation wrong model excluded | None |
| §7.5 converse: action must preserve orientation | glide (x,y)↦(x+1,−y) | determinant −1; dπ after the glide cannot carry both o and −o to the same quotient orientation | Nonorientable quotient control passes | None |
| §7.5 connected quotient sign alternatives | antipodal action on S¹ and S² | degree (−1)^(n+1) is +1 and −1; RP¹ orientable, RP² not | Connected orientability iff passes | None |
| §7.5 nonabelian action test | Q₈ acting on S³⊂ℍ by left multiplication | nonidentity unit q has no fixed unit x since qx=x⇒q=1; real determinant of Lq is norm(q)^4=1 | Descent route does not assume commutativity | None |
| §7.5 obsolete external gap versus local target | ℤⁿ translations | both contracts demand dπ(o)=o/Γ with determinant sign +1 | Same object has two planned owners | R06 |
| §7.6 conformal-map criterion | inverse stereographic projection | conformal scale λ=2/(1+r²)>0, normⁿ=λⁿ=J; KO=1 | Nonconstant positive control passes | None |
| §7.6 flat-manifold end theorem | flat torus cover; orientation-preserving flat quotient | covering differential is an isometry: norm=1,J=1, KO=KI=1 | Killing–Hopf deduction passes | None |
| §7.6 free/orientation hypotheses | half-turn of ℝ²; glide reflection | half-turn fixes 0, so stabilizer nontrivial; glide det=−1 | Orbifold/nonorientable models excluded | None |
| §7.7 simplicial torus-supplied end theorem | p=torus doubling, π standard flat cover | differential diag(2,1), J=2,norm²=4; KO(p∘π)=2, image not singleton | Pass | None |
| §7.7 more general covering-domain formulation | T=N=ℝ²,p=π=id; disconnected T with π in one component | identity Kp=Kπ=1; connected image of π lies in a single component where a local differential is invertible | No compactness or surjectivity needed in that formulation | None |
| §7.7 degenerate input | constant simplicial p | D(p∘π)=0 and image size 1; nondegeneracy hypothesis false | The sufficient theorem gives no ellipticity conclusion | None |
| Worked example: eight-sector map | first-sector L=[[1,−1],[0,√2]] | det L=√2; eigenvalues of LᵀL=2±√2; qO=qI=(2+√2)/√2=1+√2 | Sector arithmetic and orientation pass | None |
| Worked example: degree versus distortion | eight-sector map and z² | both degree 2; distortions 1+√2 and 1 | Degree alone does not determine distortion | None |
| Downstream cohomological boundary, not targets here | Tⁿ; #ᵏ(S²×S²) | b_j(Tⁿ)=binom(n,j); in dimension 4, b₂ of connected sum =2k, which exceeds binom(4,2)=6 at k≥4 | Matches Prywes bound and stated non-ellipticity consequence | None |

The positive-dimensional conventions apply to the manifold layers. Zero-dimensional tests above address the broader native Lean signatures explicitly. Algebraic test classes such as nonreduced schemes, DVR ramification or residue characteristic do not instantiate these real-inner-product and real-manifold carriers; no conclusion was tested by silently changing the coefficient field.

## Not verifiable

The following are limitations of source certification, not pending requests or reasons to park this review. The available proofs and pinned inputs were still audited as described above.

- Rickman1993, Ch. I and Ch. VI: settled uncertified Springer book. The recorded DOI/publisher route is paywalled. This limits source certification for §§2.4–2.7, 4.1, 4.3–4.4, 5.2 and the downstream Reshetnyak/Picard references. No page or theorem number was guessed.
- Vaisala1971, Ch. 3: settled uncertified Springer volume; the recorded DOI is paywalled. The book's exact ACL/Sobolev statement and pagination were not checked.
- Ahlfors2006, Ch. I: settled uncertified AMS book; the service previously found only the publisher's priced e-book. The planar algebra was independently computed, but the chapter's exact formulation was not certified.
- Reshetnyak1989, Ch. II: settled uncertified AMS book; publisher access is paywalled. Downstream source statement not certified.
- IwaniecMartin2001, Ch. 6: settled uncertified OUP book; publisher access is paywalled. Scope-reference text not certified.
- BonkHeinonen2001, Theorem 1.1: settled uncertified. The recorded Project Euclid attempt met bot protection; the DOI route was paywalled. The available Prywes and Heikkilä–Pankka discussions were read, but were not substituted for the original theorem text.
- Gromov1981, p. 200, and Gromov1999, Ch. 2: settled uncertified Princeton/Birkhäuser references. Their recorded publisher routes did not supply readable legal text. The question is corroborated in the accessible papers; the original locators were not certified.
- Lee2012, Ch. 15: the source service was queried for DOI 10.1007/978-1-4419-9982-5 and returned uncertified/paywalled Springer access. The descent construction was checked against the pinned quotient/orientation API, but the cited book chapter was not read. R07 records the missing manifest entry.
- The published Annals versions of HeikkilaPankka2025 and Prywes2019 were not compared page-for-page. Verification uses the explicitly cited arXiv versions and their printed pages, as their existing manifest version notes specify.

## Source issues

- **Misprint** in HeikkilaPankka2025 at proof of Proposition B.1, printed p. 24, line 1328: the source says compose the manifold map after the Euclidean embedding; it should be compose the embedding after the manifold map, giving a map from M to Euclidean space; affects the proof.
