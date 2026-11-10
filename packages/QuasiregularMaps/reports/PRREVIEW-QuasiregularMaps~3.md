# Review of QuasiregularMaps (pull request #2134 at 97e2d44)

**Verdict:** needs changes

## R01 (P2) — Retire the duplicate orientation-descent supplier gap

**Location:** `TauCetiRoadmap/QuasiregularMaps/README.md:88`: “No roadmap plans the orientation of the quotient manifold of a general free, properly discontinuous action; it is owned here (§7.5).” Compare `packages/QuasiregularMaps/design/plan.json:1995`.

**Claim:** §7.5 owns this construction, but the intake plan still asks DifferentialGeometry to provide the same construction. The external gap has no matching README contract. This is the previous review's R01, still unrepaired; it is not a complaint that a declared supplier has yet to implement its contract.

**Witness:** `plan.json:1769` still makes the flat theorem (design §7.5, README §7.6) depend on `gap:orientation-descent`; lines 1868 and 1995 still assign it to DifferentialGeometry. README:1694 instead constructs the unique orientation making the orbit projection orientation preserving.

**Repair:** In the board package, retire the obsolete `orientation-descent` gap and its external prerequisite and supplier-note clause. Keep the local dependency already recorded by README §7.6 on §7.5. Do not substitute `target:7.5` in the design: that id is already its flat theorem, so doing so would introduce a self-dependency. The README supplies the correct local ownership and ordering. Test: for translations of ℝⁿ by ℤⁿ, every differential is the identity, its determinant is 1, and the required quotient orientation satisfies `dπ(o) = o/Γ`. After the repair this construction has one owner and six declared gaps remain, all belonging to SobolevMapsBetweenManifolds.

## R02 (P2) — Keep bounded distortion in the summary's simplicial-map claim

**Location:** `TauCetiRoadmap/QuasiregularMaps/README.md:12`: “simplicial maps between smoothly triangulated manifolds are quasiregular”; also the PR description: “It shows that non-degenerate orientation-preserving simplicial maps between `C¹`-triangulated manifolds are quasiregular”.

**Claim:** These unqualified claims include noncompact sources with unbounded simplexwise distortion. The actual headline at README:20 and theorem §6.4 require bounded simplexwise distortion; compact source is a sufficient condition.

**Witness:** README:1571–1575 supplies its own counterexample: `(x,y) ↦ (h(x),y)` has differential `diag(k,1)` on the k-th strip. It is non-degenerate and orientation preserving, but `q_O = k`, so `K_O = ∞`.

**Repair:** Add “with bounded simplexwise distortion, in particular with compact source” to both summary claims. Do not narrow §6.4 to compact manifolds. The increasing-slope example then fails the stated hypothesis, while torus doubling still qualifies with `K_p = 2` and satisfies `4 ≤ 2·2`.

## R03 (P3) — Identify the declared Sobolev supplier in the description

**Location:** PR description, dependencies paragraph: “Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite.”

**Claim:** Apart from the open suppliers already listed there, the description classifies every non-main roadmap as a consumer. SobolevMapsBetweenManifolds is instead a prerequisite under six declared contracts.

**Witness:** README:367–402 names six SobolevMapsBetweenManifolds supplier contracts. Its package design supplies their section numbering; it is absent from main and the open-PR index. `merge-order/ORDER.txt:402–403` puts it immediately before QuasiregularMaps.

**Repair:** Replace the sentence with one explicitly identifying those six declared supplier gaps and reserving “consumer” for the downstream roadmaps. Do not create a dependency on a nonexistent PR or wait for the contracts to be implemented. Checking the revised sentence against README §Exact supplier contracts should classify SobolevMapsBetweenManifolds as a supplier and Parts II/III as consumers.

## Previous findings

The last review read this same head. Its sole finding R01 is **not repaired**, as R01 above records. There is no intervening change to inherit as evidence of a repair. I also checked the seven older findings whose repair statuses the last report records:

| Older finding | Current passage | Status |
| --- | --- | --- |
| Collapsed-simplex counterexample | README:1488, “exactly one pair of identified vertices”; README:1568, “Total collapse to one target vertex instead has rank `0`” | Repaired: partial collapse has positive rank for n ≥ 2; total collapse is permitted. |
| Infinite-dimensional ACL differentiation | README:1199, “assume `F` finite-dimensional”; README:1228, “For finite-dimensional `F`” | Repaired; the two differentiation/equivalence signatures retain this binder. |
| Pointwise identification of a chosen weak derivative | README:1504–1506, “agrees with this classical differential almost everywhere” | Repaired; changing one value of a weak derivative remains a valid negative control. |
| Nonpositive metric comparison constants | README:1636, “if `0 < α ≤ β`” | Repaired; α = −2 and α = 0 are excluded. |
| Restated singular-value API | README:63–69, “Their specializations at index `n − 1` supply the corresponding minimal-stretch laws” | Repaired; perturbation, scaling and isometry laws are consumed from Tau Ceti. |
| External orientation-descent gap | README:88–92 assigns ownership to §7.5, but `packages/QuasiregularMaps/design/plan.json:1995` retains the external request | Not repaired; current R01. |
| Duplicate Lee source record | `packages/QuasiregularMaps/sources.toml:182`, one `Lee2012` record | Repaired; no second key was introduced. |

## Verified sound

This is a full review of all 37 numbered targets in seven layers, the conventions, API bullets, Checks, worked examples, supplier contracts and all ten Lean declarations. Earlier reports were leads, not substitutes for reading the present files. The tables below record computations made against the present statements, including both directions of the equivalences. They also cover all 15 seeded source targets, all headline theorems and the targets implicated by the findings.

**Gate, scope and build.** The worker's gate at 97e2d44 reports all counters zero and ends `OK`, including statement hygiene, source material, outside-folder changes and the targeted build. Independently, `lake env lean` on `TauCetiRoadmap/QuasiregularMaps/Suggested.lean` succeeded with precisely five `declaration uses sorry` warnings, at lines 90, 106, 160, 177 and 191. The worktree remained clean, and the diff outside `TauCetiRoadmap/QuasiregularMaps` is empty. No computational algorithms, copied source passages, sorry-defined data, forbidden imports or option overrides were found. The layer order is mathematical, not a source's chapter sequence. The findings concern the claims and package records, not a failed gate.

**Dependency check.** I ran the prescribed dependency check against main and the merge order. Its complete output was:

    depcheck: 235 roadmaps, 2133 edges, 0 problem(s)

There is no UPWARD, CYCLE or moved line. I read every target's *Needs* line. The six Sobolev contracts are declared, sufficiently precise interfaces, rather than unowned prerequisites. Their matching slugs in the plan and README are `sobolev-maps-class`, `sobolev-maps-weak-differential`, `sobolev-maps-norm`, `sobolev-maps-jacobian`, `sobolev-maps-chain-rules`, and `sobolev-maps-euclidean`. The APIs already available at the pins supply their ingredients, not the manifold-map class and its assembled compatibility theorems. R01 concerns the seventh, redundant gap only.

**Cross-roadmap resolution and ownership.** I used the roadmap search/show tools for object searches, then read the relevant passages. No incoming ownership cycle or second owner was found for the retained distortion, ACL comparison or triangulation-regularity targets. The three citation-resolver leads are explained: SobolevMapsBetweenManifolds is a declared package supplier, and the two `IsQuasiregularOn` theorem names are declared and elaborate in this folder. The overlap data reports no conflicting head, dropped cited id, or id defined only by an open revision. The concrete resolutions are:

| Supplier or nearby owner | Passage read | Boundary checked |
| --- | --- | --- |
| SobolevMapsBetweenManifolds | `packages/SobolevMapsBetweenManifolds/design/README.md:417` (§1.2), 691 (§3.1), 764 (§3.3), 863 (§4.2), 906 (§4.3), 944 (§4.4), 964 (§4.5), 1005 (§4.6), 1047 (§5.1), 1072 (§5.2), 1091 (§5.3), 1123 (§6.1), 1182 (§6.2), 1223 (§6.3), 1296 (§7.1) | Continuous manifold-map class, weak differential, null sets, norm, Jacobian, C¹ chain rules and Euclidean compatibility. The six declared contracts cover these uses. Its C¹-member target does not own the locally Lipschitz theorem of §2.8. |
| DifferentialGeometry, main | `TauCetiRoadmap/DifferentialGeometry/README.md:1009` (§2.1), 1041 (§2.2), 2801 (§12.1), 2896 (§12.4) | Orientation/pullback, metrics and volume are imported. General orbit-space orientation descent is not supplied there; §7.5 constructs it using native quotient and orientation APIs. |
| RiemannianGeometry, main | `TauCetiRoadmap/RiemannianGeometry/README.md:2318`, especially 2370–2385 (R4 item 7) | Quotient metric/covering and complete-flat classification; projective-space orientability is a special case, not general descent. |
| GeometricTopology, main | `TauCetiRoadmap/GeometricTopology/README.md:7740` (§11.1), 7887 (§11.3) | Abstract realizations, compact finite support and existence of smooth triangulations. §6.1 proves metric/measure properties of a given C¹ triangulation, without rebuilding existence. |
| PDE, main | `TauCetiRoadmap/PDE/README.md:677` (§1.1) | One-dimensional weak-derivative/absolute-continuity identification is imported through Tau Ceti; coordinate-line slicing in arbitrary finite dimension is the new target. |
| PseudoholomorphicCurveAnalysis, main | `TauCetiRoadmap/PseudoholomorphicCurveAnalysis/README.md:807` (§4.1) | The condition kp > 2 does not supply the borderline W¹,² manifold maps needed here. |
| Orbifolds, main | `TauCetiRoadmap/Orbifolds/README.md:14` (conventions and orientation ownership) | Invariant orientations of presentations/coarse orientation local systems do not construct the native manifold orientation of a free quotient. |
| TeichmullerGeometry, PR #1169 | `TauCetiRoadmap/TeichmullerGeometry/README.md:742` (§7.4) | Owns weak Wirtinger derivatives and quasiconformal homeomorphisms. This roadmap consumes them and adds quasiregular comparison, allowing noninjective maps. |
| SobolevDifferentialForms, PR #1609 | `TauCetiRoadmap/SobolevDifferentialForms/README.md:16`, Scope and ownership | Weak exterior differentiation of Euclidean forms; no competing manifold-map class or ACL characterization target. |
| CalibratedGeometry, PR #946 | `TauCetiRoadmap/CalibratedGeometry/README.md:43`, Scope and ownership | Differential forms, comass and calibrated geometry; no ownership of the distortion or triangulation-regularity targets here. |

No declaration of the ten in `Suggested.lean` duplicates a fully qualified name found in the other roadmaps. The ownership search distinguished the ring-theoretic meaning of “quasiregular” and the distortion of boxes from the present analytic objects. Main-roadmap shapes were compared with PDE, DifferentialGeometry and RiemannianGeometry. The headline/target separation, API bullets, definition Checks and per-layer examples/dependencies conform to that shape, except for the overbroad summary in R02.

**Pinned library audit.** Pins inspected: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d997`. The following 22 groups record the declarations and definitions opened, rather than relying on search-name matches. Native hypotheses were compared with the roadmap's finite-dimensional, Hausdorff, second-countable and boundaryless conventions.

| Object / declarations | File and line at the pin | Comparison |
| --- | --- | --- |
| `LinearMap.singularValues`, antitonicity, injectivity criterion | `Mathlib/Analysis/InnerProductSpace/SingularValues.lean:95`, 142, 156 | Zero-indexed, finitely supported sequence. The roadmap converts σᵢ to index i−1 explicitly. |
| `normDet`, product and absolute determinant | `Mathlib/Analysis/InnerProductSpace/NormDet.lean:69`, 374, 389 | Empty product is 1; signed Jacobian is not `normDet`. |
| `Orientation.volumeForm`, robustness, negation, vector bound, naturality | `Mathlib/Analysis/InnerProductSpace/Orientation.lean:170`, 198, 223, 245, 290 | Naturality here is for linear isometric equivalences. General signed Jacobian multiplicativity is a declared supplier contract. |
| Operator norm and singular-value perturbation | `TauCeti/Analysis/OperatorIdeal/ApproximationNumber/EckartYoung.lean:98`, 106 | Supplies the norm and perturbation laws, not a new target to prove. |
| Singular-vector lower bound; isometry and scalar laws | `TauCeti/Analysis/InnerProductSpace/SingularValues.lean:325`, 589, 595, 602 | Lower bound on indices ≤ k; use k = n−1 for ℓ. Scaling uses the absolute value. |
| Frobenius norm; planar Gram formulas | `TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/Frobenius.lean:191`; `TauCeti/Analysis/InnerProductSpace/SingularValues/Planar.lean:110`, 120 | Supplies √Σσ² and planar Gram eigenvalues; not the full `az + b z̄` distortion theorem. |
| Absolute continuity and scalar a.e. differentiation; integration by parts | `Mathlib/MeasureTheory/Function/AbsolutelyContinuous.lean:155`, 444; `Mathlib/MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean:259` | The differentiation theorem is scalar. The roadmap applies it componentwise only for finite-dimensional targets. |
| `measurable_lineDeriv` | `Mathlib/Analysis/Calculus/LineDeriv/Measurable.lean:44` | Assumes continuous input; the open-domain argument localizes to boxes. It does not itself prove existence of partial derivatives. |
| `HasWeakFDerivOn`, restriction, a.e. congruence and basis test | `TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:251`, 293, 453, 657 | All directional weak identities; completeness and local integrability are built in. No continuity or conditions outside the open set are built in. |
| Classical-to-weak and uniqueness | same file, 747, 856, 881, 893 | Classical-to-weak needs integrability; a.e. agreement with a classical derivative assumes that derivative exists. It does not subsume §5.2. |
| Weak derivative for locally Lipschitz maps; locality; removability | `TauCeti/Analysis/Sobolev/WeakDeriv/Lipschitz.lean:134`; `TauCeti/Analysis/Sobolev/WeakDeriv/Local.lean:71`; `TauCeti/Analysis/Sobolev/WeakDeriv/Removable.lean:43` | Supports §2.8 and local proof routes. Continuity is retained at exceptional points. |
| One-dimensional absolute continuity and derivative | `TauCeti/Analysis/Sobolev/WeakDeriv/Interval.lean:302`, 318 | Continuous representative on a closed interval, integrable weak derivative on its interior; precisely the linewise input. |
| Zero gradient implies constant | `TauCeti/Analysis/Sobolev/Poincare/Wirtinger/W1p.lean:436` | Scalar W¹,p on a preconnected open set. Apply on relatively compact chart balls to coordinates, then use continuity and connectedness. |
| Rademacher and lower-dimensional null images | `TauCeti/Analysis/Calculus/Rademacher.lean:83`; `TauCeti/Analysis/Calculus/Sard/LowDimension.lean:73` | Finite-dimensional local differentiability and the null-skeleton argument. |
| Manifold orientation and extensionality | `TauCeti/Geometry/Manifold/Orientation/Basic.lean:32`, 140, 164, 172, 183, 200, 206, 235 | Quotient of chart-sign data; tangent orientation, uniqueness, two orientations on a connected nonempty manifold, constructor and model orientation. |
| Orientation preservation, restriction and pullback | `TauCeti/Geometry/Manifold/Orientation/Preserving.lean:63`, 82; `TauCeti/Geometry/Manifold/Orientation/OpenSubset.lean:49`; `TauCeti/Geometry/Manifold/Orientation/Pullback.lean:173`, 255 | Preservation asserts invertibility and orientation of `mfderiv`, not nearby differentiability. The roadmap separately requires C¹ maps. |
| Local orientation family constructor | `TauCeti/Topology/VectorBundle/Orientation/Basic.lean:289` | `ofEventually` assembles local constancy; this plus the preceding row supports §7.5 without an opaque orientation placeholder. |
| Chartwise null sets; volume, support, second metric | `TauCeti/Geometry/Manifold/Measure.lean:36`, 72, 89; `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82`, 179; `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Support.lean:36`; `TauCeti/Geometry/Manifold/Riemannian/WithMetric.lean:68` | Chartwise null sets need no measurable manifold structure. Volume uses a continuous metric and Lindelöf hypotheses. Identifying the two null notions remains the declared supplier contract. |
| Quotient charts and smooth projection | `Mathlib/Geometry/Manifold/Instances/Quotient.lean:50`; `TauCeti/Geometry/Manifold/Instances/Quotient.lean:242`, 253, 264 | Free properly discontinuous action, C¹ regularity, and derivative identity for the orbit projection. No descended orientation is already constructed. |
| Local Riemannian isometry and quotient metric | `TauCeti/Geometry/Manifold/Riemannian/Isometry/Local.lean:70`; `TauCeti/Geometry/Manifold/Riemannian/Pullback/Descent.lean:189`, 258 | Smooth isometric action and descended metric are imported; general orientation descent remains a separate result. |
| Smooth simplex immersion and triangulation | `TauCeti/Geometry/Manifold/SmoothTriangulation/Basic.lean:97`, 191 | C¹ within each closed simplex and injectivity on the sum-zero directions; no local finiteness or purity field. |
| Realizations, support, compactness and maps | `TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Basic.lean:71`, 80, 150, 362; `TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Compact.lean:87`, 97; `TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Map.lean:149`; `Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean:48` | Weak topology and finite compact support; simplices are nonempty. Thus the empty face is not a counterexample to §6.1's finite-coface statement. |

The native definition bodies fix two particularly important ownership boundaries. `TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:251` defines the weak Fréchet condition by

```lean
∀ v : E, HasWeakLineDerivOn μ Ω u (fun x => U x v) v
```

It contains no continuity condition on u and no manifold-map carrier. `TauCeti/Geometry/Manifold/SmoothTriangulation/Basic.lean:191` defines the triangulation condition by

```lean
∀ σ : Face K, IsSimplexImmersion I n (f ∘ faceInclusion K σ)
```

It contains no local-finiteness or purity assertion. The immersion's injectivity condition at line 104 is

```lean
∀ v : σ → ℝ, ∑ a, v a = 0 → F' v = 0 → v = 0
```

Thus injectivity is required on the simplex's directions, including at its boundary; a merely smooth homeomorphism does not suffice.

**Seeded source verification: 15 targets.** I read the three available primary texts. The two arXiv versions are the versions expressly identified in the README: HeikkilaPankka2025 uses 2302.11440v2, and Prywes2019 uses 1806.05306v1. Their line/page locators are not asserted to be the pagination of the published journals. For the MRV scan, printed pagination is one greater than the extraction's page marker in this portion: Definition 2.16 is on printed p. 12, Definition 2.20 on p. 14, and (2.25) on p. 15. No additional locator was explicitly flagged unverified in the README. Settled inaccessible sources are listed below, not silently certified.

| Seeded target | Text and locator inspected | Hypotheses and support |
| --- | --- | --- |
| 1.3 Comparison of the linear distortions | MartioRickmanVaisala1969 line 438, (2.25), printed p. 15; lines 409–419, Definition 2.20, p. 14 | Source states map distortions for its Euclidean n ≥ 2 setting. The roadmap states a pointwise algebraic derivation, handles J > 0, zero and singular cases explicitly, and tests n = 1 independently. Equality cases follow from its product inequalities, not an alleged extra source theorem. |
| 1.5 Planar linear maps | Ahlfors2006, Ch. I | Text unavailable under the settled status. Independently recomputed the real matrix, singular values and both directions of the k/K equivalence below. |
| 2.4 Jacobian | Rickman1993, Ch. I | Uncertified locator. Positivity and vanishing follow from the signed inequality with K ≥ 1; integrability is expressly supplied by the Sobolev Jacobian contract. |
| 2.5 Restriction and locality | Rickman1993, Ch. I | Uncertified locator. Countable-cover route and essential-supremum formula checked, including the empty-cover correction. |
| 2.6 Vanishing differential | Rickman1993, Ch. I | Uncertified locator. Coordinatewise zero-gradient input checked at the pin. Connectedness and Sobolev regularity are both needed. The n = 1 ReLU example correctly prevents claiming positivity a.e. |
| 2.7 C¹ maps | Rickman1993, Ch. I | Uncertified locator. Continuity of the distortion inequality and positivity of volume on nonempty opens give the everywhere version. |
| 2.8 Locally Lipschitz maps | HeikkilaPankka2025 lines 1255–1260, Lemma B.2, p. 23; proof lines 1261–1316, pp. 23–24 | Source is closed M, scalar continuous piecewise smooth functions, not arbitrary locally Lipschitz manifold maps. README explicitly says this; its wider theorem uses native Rademacher/weak-derivative inputs and the declared chartwise class. |
| 2.9 Euclidean domains | MartioRickmanVaisala1969 lines 409–419, Definition 2.20, p. 14; Prywes2019 lines 22–26, p. 1 | Signed operator-norm distortion and Sobolev/ACL regularity agree. Source domain is connected nonempty and n ≥ 2; the roadmap explicitly extends to arbitrary open sets, n = 0 and n = 1, with computations below. |
| 4.1 Change of metric | HeikkilaPankka2025 lines 20–27, p. 1; Rickman1993, Ch. I | HP gives the definition, not the quantitative comparison theorem. The roadmap supplies its own Gram-density argument. Rickman locator remains uncertified. Positive lower bounds and the density ratio direction checked. |
| 4.2 Orientations | HeikkilaPankka2025 lines 20–27, p. 1 | Definition uses oriented Jacobian. Reversal laws are derived using the native volume-form sign law and the named Jacobian contract, not attributed to a source theorem absent here. |
| 4.3 Precomposition | Rickman1993, Ch. I | Uncertified locator. Chain rule and null preimages are assigned to the supplier; uniform distortion and orientation hypotheses survive the explicit controls. |
| 5.2 ACL/Sobolev equivalence | Vaisala1971, Ch. 3; Rickman1993, Ch. I | Both locators uncertified. Checked the proposed Fubini/one-dimensional proof route and pinned inputs, p ≥ 1, finite-dimensional F, continuity and a.e. equality of arbitrary weak derivatives. |
| 5.3 MRV agreement | MartioRickmanVaisala1969 lines 332–340, Definition 2.16, p. 12; lines 409–425, Definition 2.20, p. 14 | Continuous ACL maps, local integrability and outer inequality match. MRV's use of maximal K is explicitly distinguished from the modern outer K, with a separating radial example. |
| 7.1 Ellipticity | HeikkilaPankka2025 lines 20–21, p. 1, and 271–273, p. 6; Prywes2019 lines 26–27, p. 1 | Nonconstant entire quasiregular map. README allows the meaningful one-dimensional case and does not import the closed-manifold cohomology conclusions at that generality. |
| 7.3 Metric independence | HeikkilaPankka2025 lines 18–34, p. 1 | Source uses this smooth-manifold reading without stating the comparison bound. README says so explicitly and derives the result from §4.1, with compactness for arbitrary metrics and 0 < α ≤ β for its quantitative version. |

I also checked HeikkilaPankka2025 Appendix B lines 1236–1251 and 1317–1339: Proposition B.1 is for closed oriented PL manifolds, n ≥ 2, with compatible piecewise smooth structures. The roadmap's noncompact/C¹ generalization is supported by its own local-finiteness, within-simplex inverse estimates, gluing and bounded-distortion targets; it does not claim the source proves that greater generality. Prywes2019 lines 28–53 and HeikkilaPankka2025 lines 18–19 support the downstream cohomology constraints, not targets of this folder.

**Adversarial computations (124 rows).** In these tables, q denotes a linear distortion, K a map distortion. Unless stated otherwise the dimensions are positive, the metrics Euclidean and the orientations standard. “Pass” means the computed instance agrees with the stated hypotheses/conclusion, including a negative control being excluded. It does not mean that finite examples constitute a proof. Algebraic, arithmetic, scheme-theoretic and characteristic-p test objects do not occur in these real-analytic signatures; the relevant degeneracies are zero dimension/rank, empty domains, disconnectedness, singular maps, null modifications and noncompact sources.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Convention: zero-dimensional tangent space | Unique endomorphism of {0} | norm = 0, det = empty product = 1; 0⁰ = 1, so QR inequality is 1 ≤ K | Pass; excluded for manifolds, allowed in Euclidean Lean | None |
| Convention: singular index and truncation | dim V = 0, 1, 2 | n−1 = 0, 0, 1; singularValues = 0 at zero dimension; for diag(3,1/2), indices 0,1 give 3,1/2 | Pass | None |
| Convention: norm normalization | diag(2,1) | op-norm²/J = 4/2 = 2; HS²/(2J) = 5/4 | Distinguishes the two conventions | None |
| Convention: orientation and zero division | diag(−1,1); zero | J = −1, naive ratio = −1 but q_O = ∞, q_I = 0; zero has (q_O,q_I) = (0,0) | Pass | None |
| §1.1 minimum characterization | diag(3,1/2), vectors e₁,e₂ | lengths 3,1/2; min on unit sphere = 1/2 = ℓ | Pass | None |
| §1.1 injectivity and norm bounds | projection diag(1,0); a = −2 in dim 1 | ℓ = 0, norm = 1, noninjective; ℓ = norm = 2, injective | Pass | None |
| §1.1 reciprocal inverse norm | diag(3,1/2) | inverse norm = 2; ℓ·inverse norm = (1/2)·2 = 1 | Pass | None |
| §1.1 composition lower bound | A = diag(3,1/2), B = diag(1/2,3) | ℓ(BA) = 3/2 ≥ ℓ(B)ℓ(A) = 1/4 | Pass, can be strict | None |
| §1.1 imported perturbation law | diag(3,1/2), diag(3,3/4) | difference of minima = 1/4 = operator norm of difference | Pass | None |
| §1.1 imported scaling and isometry laws | −2A; coordinate swap on either side | ℓ(−2A) = 1 = 2·1/2; swapped Gram eigenvalues remain 9,1/4, so ℓ = 1/2 | Pass; signed scalar would give −1 | None |
| §1.1 shear control | [[1,1],[0,1]] | singular values (√5±1)/2; ℓ ≈ .618, norm ≈ 1.618, product 1 | Pass | None |
| §1.2 outer quotient definition | diag(2,1), zero, projection, reflection | q_O = 2, 0, ∞, ∞ respectively | Pass; excludes naive total division | None |
| §1.2 inner quotient definition | Same four matrices | q_I = 2, 0, 0, 0 respectively | Pass; does not define quasiregularity alone | None |
| §1.2 conformal equality | 2I₂; diag(2,1) | q_O = q_I = 1 for 2I₂; both 2 for anisotropic diagonal | Pass; forces equal singular values | None |
| §1.2 orientation/scalar invariance | −I₂, −I₃; positive 3A | determinants 1,−1, so q_O = 1,∞; normⁿ and positive Jacobian both multiply by 3ⁿ | Pass | None |
| §1.2 submultiplicativity | A = diag(2,1), B = diag(1,2) | BA = 2I₂: q_O(BA) = q_I(BA) = 1 ≤ 2·2 = 4 | Pass | None |
| §1.2 sign hypothesis for inner composition | Two reflections R | q_I(R²) = 1, q_I(R)q_I(R) = 0; J(R) = −1 | Correctly excluded | None |
| §1.2 lower semicontinuity | εI₂ → 0; diag(1,ε) → projection | q_O = 1 → liminf 1 ≥ q_O(0) = 0; q_O = 1/ε → ∞ | Pass, not continuous at 0 | None |
| §1.3 outer iff | diag(2,1), K = 2 and 1 | 4 ≤ 2·2 and 2 ≤ 2 both true; 4 ≤ 1·2 and 2 ≤ 1 both false | Both directions agree | None |
| §1.3 inner iff | diag(2,1), K = 2 and 1 | 2 ≤ 2·1² and 2 ≤ 2 true; 2 ≤ 1·1² and 2 ≤ 1 false | Both directions agree | None |
| §1.3 K ≥ 0 is essential | R = diag(−1,1), K = −1; zero with K = 0 | 1 ≤ (−1)(−1) true but ∞ ≤ −1 false; zero gives 0 ≤ 0 on both sides | Pass | None |
| §1.3 sharp outer-to-inner comparison | diag(1,1,1/2) | q_I = (1/2)/(1/8) = 4 = q_O² = 2² | Pass; exponent 1 would give 4 ≤ 2 false | None |
| §1.3 sharp inner-to-outer comparison | diag(2,1,1) | q_O = 8/2 = 4 = q_I² = 2² | Pass | None |
| §1.3 equality cases and strict case | diag(3,2,1); dim 1 positive scalar | q_O = 9/2, q_I = 6; 6 < 81/4 and 9/2 < 36; dim 1 gives 1 ≤ 1⁰ = 1 | Pass | None |
| §1.3 zero and singular exceptions | zero; diag(1,0) | zero inequalities 0 ≤ 0 in dim 2; projection requires ∞ ≤ 0, false | Pass | None |
| §1.4 HS normalization/minimum | I₂; diag(2,1) | q_S(I₂) = 2/2 = 1; q_S = 5/4 > 1, q_O = 2 | Pass | None |
| §1.4 HS comparison/sharp constant | diag(1,ε); diag(1,ε,ε) | q_O/q_S = 2/(1+ε²) → 2; = 3^(3/2)/(1+2ε²)^(3/2) → 3^(3/2) | Strict for ε > 0; optimal constant | None |
| §1.4 singular HS convention | zero; reflection | q_S = 0; q_S = ∞, as for q_O | Pass | None |
| §1.5 planar norm/minimum/J | a = 1, b = 1/2 | norm = 3/2, ℓ = 1/2, J = 3/4; q_O = q_I = 3 | Pass | None |
| §1.5 nonpositive determinant and conformal case | conjugation; a = 2i,b = 0 | J = −1, q_O = ∞; J = 4, norm² = 4, q_O = 1 | Pass | None |
| §1.5 k/K iff including zero | k = 1/3, a = 1,b = 1/3; a = b = 0 | (1+k)/(1−k) = 2 = q_O; zero: 0 ≤ 2 and 0 ≤ (1/3)·0 | Both directions agree; denominator 2/3 > 0 | None |
| §2.1 QR definition | identity, constant, reflection, projection in dim 2 | 1 ≤ K; 0 ≤ 0; 1 ≤ −K false; 1 ≤ 0 false | Pass | None |
| §2.1 monotonicity | diag(2,1), K = 1,2,3 | 4 ≤ 2 false; 4 ≤ 4 true; 4 ≤ 6 true | Pass | None |
| §2.1 one-dimensional nonopenness | max(0,t) | derivative/J = 0 on negative half-line, 1 on positive; 0 ≤ 0 and 1 ≤ 1 | QR but not open; higher-dimensional conclusion not imported | None |
| §2.2 outer map distortion | constant, empty domain, z², fold | esssup q_O = 0,0,1,∞; K_O = 1,1,1,∞ | Pass; max with 1 matters | None |
| §2.2 representative independence | D(id) changed to 0 at one point in ℝ² | q_O changes 1→0 only on measure 0; both essential suprema 1 | Pass | None |
| §2.3 infimum attained | identity, constant, empty source, fold | admissible constants [1,∞),[1,∞),[1,∞),∅; least constants 1,1,1,∞ | Pass | None |
| §2.4 sign and zero-J conclusion | z²; projection | J = 4r², norm² = 4r², D(0)=0; projection J=0 but norm²=1 | Pass; projection excluded | None |
| §2.4 integrable Jacobian | radial exponent a > 0 | J = a r^(n(a−1)); polar integral proportional to ∫₀¹ r^(na−1)dr = 1/(na) | Finite exactly for a > 0 | None |
| §2.5 restriction and uniform locality | shear (x,y+x³/3), strips abs(x) < R | J = 1, strip K_O = ((R²+√(R⁴+4))/2)²; supremum over R is ∞ | Pass; varying local K is insufficient | None |
| §2.5 empty cover | M = ∅ | K_O = 1; sup over empty family = 0; max(1,0)=1 | Pass | None |
| §2.6 zero differential | connected constant; two components with values 0 and 1 | D=0 in both; image cardinalities 1 and 2 | Connectedness distinguishes them | None |
| §2.6 Sobolev hypothesis | Cantor function | classical derivative 0 a.e.; c(1)−c(0)=1 whereas integral of derivative = 0 | Fails AC/Sobolev; not a counterexample to theorem | None |
| §2.6 positive-measure positivity | ReLU in dimension 1 | J=1 on (0,∞), J=0 on (−∞,0); both sets positive measure | Claim is positive measure, not a.e. positivity | None |
| §2.7 pointwise C¹ inequality | (x³,y) | J=3x²; quotient max(3x²,1)²/(3x²)→∞; at x=0, norm²=1 > K·0 | Not QR despite smooth homeomorphism | None |
| §2.7 conformal and orientation tests | z²; −id on ℝⁿ; flat torus projection | norm²=J=4r²; J=(−1)ⁿ; dπ has norm=J=1 | K=1 precisely as stated | None |
| §2.8 locally Lipschitz/weak derivative | winding (r,θ,z)↦(r,2θ,z) | singular values 2,1,1; J=2; outer 8/2=4, inner 2/1=2 | Pass, a.e. off the axis | None |
| §2.8 necessity of Lipschitz for every p | abs(t)^(1/2) | derivative magnitude (1/2)abs(t)^(−1/2); integral exponent −p/2, finite iff p<2 | Fails local Lipschitz at 0 | None |
| §2.8 class is not QR | fold | Lipschitz constant 1; J = ±1, and inequality 1 ≤ −K fails on half-space | Pass | None |
| §2.9 Euclidean native definition | diag(2,1), constant, empty Ω | weak derivatives diag(2,1),0; 4≤2·2, 0≤0; empty restricted measure 0 | Native definition has expected values | None |
| §2.9 values outside Ω | Ω=(−1,1), f(t)=t on Ω with arbitrary changes outside | D=1 on Ω; each test-function integral and a.e. inequality unchanged | Off-domain data irrelevant | None |
| §2.9 radial stretches | n=3, a=2 and a=1/2, r=1 | (norm,ℓ,J)=(2,1,2),(1,1/2,1/2); (K_O,K_I)=(4,2),(2,4) | Pass | None |
| §2.9 excluded radial exponent | a=0, n≥2 | unit radial map has direction-dependent limit at 0; derivative n-th power has integral ∫₀¹r^(−1)dr=∞ | a>0 required as stated in the radial construction | None |
| §2.10 Beltrami comparison | f(z)=z+(1/2)z̄ | f_z=1, f_z̄=1/2; k=1/2, K=(1+k)/(1−k)=3 | Matches planar q_O=3 | None |
| §2.10 conformal/nonexample | holomorphic z²; conjugation | f_z̄=0, K=1; conjugation has f_z=0,f_z̄=1, so 1≤k·0 fails | Pass | None |
| §3.1 inner/maximal map distortions | radial a=1/2 in ℝ³; constant; projection | (K_O,K_I,K)=(2,4,4),(1,1,1),(∞,∞,∞) | Projection pointwise q_I=0 does not bypass membership | None |
| §3.2 outer-to-inner Lean headline | same radial map, K=2, r=1 | det=1/2; K^(n−1)ℓⁿ=4·1/8=1/2 | Sharp; smaller exponent gives 1/4 | None |
| §3.2 converse Lean headline | radial a=2 in ℝ³, inner K=2 | det=2≤2·1; output outer K²=4, norm³=8=4·2 | Sharp | None |
| §3.2 converse needs existing QR | projection diag(1,1,0) | inner 0≤1·0 true; outer 1≤K·0 false | Existing QR hypothesis excludes it | None |
| §3.2 arbitrary weak derivative | radial map with Du changed at one point | displayed inequalities unchanged a.e.; exceptional set mass 0 | Uniqueness a.e. suffices | None |
| §3.2 low dimensions | n=1 positive derivative a; n=0 | a≤K⁰a=a; zero-space det 1≤K⁰·0⁰=1; output K⁰=1 | No lost dimension hypothesis | None |
| §3.3 inner inequality alone | projection; reflection | J=0≤0; J=−1≤0; both have q_O=∞ | Pass; both wrong models excluded by QR membership | None |
| §3.4 map HS distortion | winding in ℝ³; constant | HS²=6, J=2; K_S=6^(3/2)/(3^(3/2)·2)=√2; constant K_S=1 | √2 ≤ 4 ≤ 3^(3/2)√2 | None |
| §4.1 norm/density comparison | source norm ×2, target norm ×3 | norm ratio 3/2; J ratio 3ⁿ/2ⁿ; q'_O/q_O=1 | Density direction verified | None |
| §4.1 quantitative metric bound | flat T² → metric dx²+4dy² | norm'=2, density/J'=2; actual q'_O=2 ≤ (2/1)²=4 | Pass | None |
| §4.1 noncompact counterexample | target dx²+e^(2x)dy² | norm'=max(1,eˣ), J'=eˣ, q'_O=e^abs(x), supremum ∞ | No false global equivalence without comparability | None |
| §4.1 conformal invariance | target e^(2x)(dx²+dy²) | norm'=eˣ, J'=e^(2x), q'_O=e^(2x)/e^(2x)=1 | No bounded conformal factor required | None |
| §4.2 orientation reversal | identity with one/two orientations reversed | J=−1 then +1; 1≤−K false then 1≤K true | Pass | None |
| §4.2 both signs force componentwise constants | map taking two constant values on two components | J=0,D=0, both sign inequalities 0≤0; image has two points | Conclusion correctly componentwise | None |
| §4.3 precomposition bound | torus projection, then torus doubling | norm²=4,J=2, K_O=2=1·2; surjective local isometry preserves esssup | Pass | None |
| §4.3 hypotheses | unbounded shear; reflection before identity | K_θ=∞; J=−1 and 1≤−K fails | Both excluded | None |
| §4.4 postcomposition | z² after z² | z⁴: norm²=J=16r⁶, K_O=1=1·1 | Pass | None |
| §4.4 strict composition bound | radial a=2 after radial a=1/2 in ℝ³ | composition=id, K_O=1≤4·2=8; outer factor is C¹ with D(0)=0 | Pass | None |
| §5.1 formal derivative definition | u(x₁,x₂)=(x₂,0) | columns (0,0),(1,0), matrix [[0,1],[0,0]] | Distinguishes transpose convention | None |
| §5.1 failed partial derivative junk value | u(t)=abs(t) | derivative −1,+1 off 0; lineDeriv(0)=0 although derivative does not exist | No existence inferred from zero default | None |
| §5.1 ACL continuity and line condition | smooth u; indicator of a singleton; Cantor in x₁ | smooth line variation finite; indicator zero on a.e. line but discontinuous; Cantor has increment 1 and derivative integral 0 | Only smooth input passes both defining conditions | None |
| §5.1 actual segment parameterization | Q=[0,1]², x=(1/2,1/2), i=2 | x+(t−x₂)e₂=(1/2,t); endpoints (1/2,0),(1/2,1); unshifted endpoint would be 3/2 | Segment convention verified | None |
| §5.1 finite-dimensional differentiation restriction | u(t)(s)=abs(t−s) into C([0,1]) | norm(u(t)−u(r))=abs(t−r); evaluation at s=t gives difference quotients +1 and −1 | Lipschitz/ACL but no derivative at interior t; hypothesis essential | None |
| §5.1 ACL^p definition | u(x)=norm(x)^(1/2) on ℝ² | gradient norm=(1/2)r^(−1/2); integral ∫₀¹r^(1−p/2)dr finite iff p<4; p=4 diverges logarithmically | Distinguishes exponents | None |
| §5.1 sums/linear maps/restriction | u=x₁,v=x₂; coordinate projection; smaller open box | rows (1,0)+(0,1)=(1,1); projection selects its row; line integrals restrict to shorter intervals | Pass | None |
| §5.1 C¹ and exponent inclusion | u=x₁² on compact [-R,R]² | derivative norm ≤2R; all finite p and p=∞ norms finite; finite-volume L^q embeds in L^p for p≤q | Pass | None |
| §5.2 ACL/Sobolev equivalence headline | abs(t), p=∞; Cantor function | abs(t): both sides true, derivative sign(t); Cantor: both false, 1≠∫₀¹0 | Both implications discriminated | None |
| §5.2 line-derivative headline | abs(x₁) into ℝ; modified weak derivative at singleton | derivative row (sign x₁,0) off x₁=0; altered value differs only on measure 0 | Existence plus a.e. equality, not merely formal equality | None |
| §5.2 p≥1 negative control | stated strip bumps, p=1/2 | ∂₁ amplitude 8ᵏ, width 8^(−k): half-power integral ≍8^(−k/2); ∂₂ amplitude 4ᵏ: half-power integral ≍4^(−k); L¹ ∂₁ mass ≍1 per strip | Half-power integrals sum; L¹ sum diverges, so weak derivative fails | None |
| §5.2 local interval route | abs(t), [-1,1] | integral sign(t)=0=abs(1)−abs(−1); on [0,1], integral=1=increment | Pinned one-dimensional input has the required hypotheses | None |
| §5.3 classical/Sobolev equivalence headline | diag(2,1), projection, zero-dimensional domain | K=2: both true, 4=2·2; projection both false, 1>0; n=0 both reduce to 1≤K | Both directions agree including dim 0 | None |
| §5.3 outer versus maximal convention | radial a=1/2 in ℝ³ | outer K=2; maximal K=max(2,4)=4 | MRV's K=2 convention differs, as explicitly stated | None |
| §6.1 local finiteness argument | point with carrier τ, compact neighborhood supported on m vertices | every coface σ⊇τ is contained in that support; at most 2ᵐ candidate subsets | Finite, with native nonempty faces | None |
| §6.1 compact-support alone is insufficient | infinite star, center v | {v} has one vertex of support but meets infinitely many closed edges; no compact neighborhood at v | Correct negative control | None |
| §6.1 purity and null skeleton | triangle boundary → S¹; tetrahedron boundary → S² | maximal dimensions 1,2; lower skeleton images 3 points,6 arcs, volume 0 | Pass | None |
| §6.1 dimension obstruction | simplex dimension m>n; maximal m<n | injective rank would require m≤n; lower-dimensional open image would have measure 0 and positive measure | Both impossible under hypotheses | None |
| §6.1 top-simplex/local inverse estimate | equilateral triangle edge | radius²=1−3t+3t² ∈[1/4,1]; angular derivative=(√3/2)/radius² ∈[√3/2,2√3] | Uniform positive lower/upper bounds on this edge | None |
| §6.1 vertex immersion is essential | t↦t² at t=0 | derivative 0; inverse Lipschitz ratio √t/t=1/√t→∞ | Not a smooth triangulation under native definition | None |
| §6.1 general local lower bound | injective A₀, minimum c₀>0, perturbation ≤c₀/2 | norm(A₀v)−error ≥c₀ norm(v)−(c₀/2)norm(v)=(c₀/2)norm(v) | Works within the simplex, no unowned extension theorem | None |
| §6.2 simplicial realization and rank | one identified vertex pair in triangle/tetrahedron | matrices diag(1,0),diag(1,1,0); ranks 1=n−1,2=n−1 | Pass | None |
| §6.2 nondegenerate orientation condition | identity, fold, total collapse | ranks n,n,0; signed J=1,±1,0 | Only identity satisfies both nondegeneracy and orientation-preservation conditions everywhere on top interiors | None |
| §6.2 identity/composition | compatible vertex maps σ,τ | barycentric point Σtᵢvᵢ maps to Σtᵢτ(σ(vᵢ)); identity gives Σtᵢvᵢ | Matches native realization map | None |
| §6.3 piecewise C¹ gluing | abs(x₁); eight-sector map | Lipschitz constants 1 and √(2+√2); boundaries agree, so one finite maximum controls the pieces | Pass | None |
| §6.3 classical versus weak derivative | id with D(x₀)=0 at a simplex-interior point | dp(x₀)=id≠0=D(x₀); equality elsewhere, exceptional mass 0 | Correct a.e. conclusion | None |
| §6.4 bounded simplicial theorem | torus doubling diag(2,1) | J=2, norm²=4, K_p=2; 4≤2·2 | Pass | None |
| §6.4 singular controls | partial collapse; total collapse | positive rank: normⁿ>0=KJ; rank zero: 0≤0 | Sufficiency does not become necessity | None |
| §6.4 noncompact boundedness and summary | increasing-slope strip map | on k-th strip, norm²=k²,J=k,q_O=k; supₖk=∞ | Theorem excludes it; summary incorrectly includes it | R02 |
| §6.4 empty source | no top simplices | supremum of empty set=0; max(1,0)=1; inequality vacuous | Formula handles empty case | None |
| §7.1 ellipticity definition | ℝⁿ identity; constant; S¹ covering | J=1 and nonconstant; J=0 and constant; covering derivative=1, J=1 | Nonconstant condition selects the intended object | None |
| §7.1 positive-J and domain controls | ReLU; chart from a small ball into any N | positive-J half-line has positive measure; small chart derivative has positive minimum Jacobian and finite maximum norm | Entire domain requirement prevents trivial chart-based ellipticity | None |
| §7.1 monotonicity/isometry invariance | radial witness with K=2; target orientation-preserving isometry | 2≤3 preserves bound; norm and J unchanged by isometry, hence same K=2 | Pass | None |
| §7.2 orientation independence headline | f after reflection R, target orientation reversed | J_new(f∘R)=−J_f(Rx)det R=−J_f(Rx)(−1)=J_f(Rx) | Same K and nonconstancy | None |
| §7.3 metric independence headline | target metric ×9; anisotropic flat torus | norm ×3,J ×3ⁿ, factor (3/3)ⁿ=1; target dx²+4dy² bound4, actual standard covering distortion2 | Pass; existence can have better K via a different covering | None |
| §7.3 positivity of comparison constants | equal metric, α=−2,β=1; α=0 | bad factor −1/2 in n=1; zero denominator at α=0 | Both excluded by 0<α | None |
| §7.4 transfer | torus doubling; exp into ℂ∖{0} then inclusion | K_q=2, or 1 for pullback metric; exp has norm²=J=exp(2Re z), inclusion K_q=1 | Pass; no surjectivity of q required | None |
| §7.4 nonconstancy proof | hypothetical q∘f constant with q local diffeomorphism | f(ℝⁿ) connected inside discrete fibre, cardinality ≤1 | Contradicts nonconstant f | None |
| §7.5 descent existence/uniqueness | trivial group; ℤⁿ translations | dπ transports o; translations dγ=id, det=1, dπ_{γx}dγ=dπ_x | Mathematical target sound; duplicate ownership record remains | R01 |
| §7.5 orientation reversal and converse | reverse o; glide (x,y)↦(x+1,−y) | transported orientation changes sign; glide determinant −1, so invariant orientation impossible | Correct negative control | None |
| §7.5 connectedness in orientability iff | S₃ acting by left translation on S₃×ℝⁿ, with mixed component orientations | quotient is ℝⁿ, orientable; some component maps change chosen sign | Connectedness is necessary for converse relative to fixed o_X | None |
| §7.5 nonabelian positive example | same free S₃ action with all component orientations standard | every derivative=id, det=1; quotient ℝⁿ has standard orientation | Descent itself needs no commutativity or connectedness | None |
| §7.5 antipodal sign | S¹ and S² | degree=(−1)^(n+1)=+1,−1; RP¹ orientable, RP² not | Matches supplier's special case | None |
| §7.6 flat-manifold headline | flat torus cover; orientation-reversing glide; half-turn with fixed point | cover norm=J=1; glide det=−1; half-turn fixes 0 | Positive example and excluded hypotheses | None |
| §7.6 conformal sphere example | inverse stereographic map, r=0,1 | dilation 2/(1+r²)=2,1; normⁿ=J=2ⁿ,1 with compatible orientation | Nonconstant K=1 | None |
| §7.7 torus simplicial headline | torus doubling after ℝ²→T² | K_π=1,K_p=2; composite J=2,norm²=4, K=2 | Nonconstant since map is nondegenerate | None |
| §7.7 wrong constant model | constant torus map | rank0,J0; would yield constant composite, but fails nondegeneracy | Excluded | None |
| Worked eight-sector map | L=[[1,−1],[0,√2]] | det=√2; Gram eigenvalues 2±√2; q_O=q_I=(2+√2)/√2=1+√2; total angle4π gives degree2 | Pass; distinct from conformal z² with K=1 | None |
| Worked radial and torus examples | n=3,a=2,1/2; flat cover | (K_O,K_I)=(4,2),(2,4); cover (1,1) | Consistent across all layers | None |
| Downstream scope, not present targets | flat Tⁿ; connected sum of four S²×S² | Betti numbers binom(n,k); b₂=8>binom(4,2)=6 | Matches the stated cohomology obstruction and ownership in Part III | None |
| Supplier-contract classification | six Sobolev contracts; orientation construction | six matching slugs, one external orientation request versus one local construction | Mathematical interfaces precise; records/description disagree | R01, R03 |

**Headline coverage and padding.** The six headline families in README:15–27 are the distortion comparisons; ACL/Sobolev and classical agreement; bounded simplicial quasiregularity; orientation/metric independence of ellipticity; closed orientable flat examples; and torus-to-manifold simplicial examples. Their distribution is:

| Headline | Present acceptance signature or stated obstacle |
| --- | --- |
| Sharp distortion comparisons | Two theorems at `Suggested.lean:90` and 106 on genuine Euclidean quasiregular maps; manifold form named as not statable. |
| ACL/Sobolev and weak line derivative | `isACLpOn_iff_exists_hasWeakFDerivOn` at 160 and `ae_hasLineDerivAt_of_hasWeakFDerivOn` at 177. |
| Classical MRV comparison | `isQuasiregularOn_iff_isACLpOn` at 191, with the outer/maximal convention explained in prose. |
| Bounded simplicial quasiregularity | Module docstring names §6.4 and the missing continuous Sobolev manifold-map class/differential/Jacobian. |
| Orientation/metric independence of ellipticity | Module docstring names §7.2–§7.3 and the same missing manifold-map carrier. |
| Flat and torus examples | Module docstring separately names §7.6 and §7.7 and the same missing carrier. |

A scratch copy with `#check @name` for all ten declarations elaborated. All five definitions have real bodies; no section binder was lost. `minimalStretch` retains finite-dimensional V and W. `IsQuasiregularOn` retains finite-dimensional E and its Borel measurable structure. `formalDeriv`, `IsACLOn` and `IsACLpOn` deliberately allow arbitrary normed F; the two differentiation/Sobolev equivalence theorems explicitly retain finite-dimensional F. The latter equivalence retains `1 ≤ p` and continuity on Ω. Both distortion signatures retain an actual quasiregularity hypothesis and a weak derivative tied to f; the converse additionally retains `1 ≤ K`. The final comparison retains `1 ≤ K`. No statement claims a zero default of `lineDeriv` proves differentiability.

For each of the five sorried theorems I elaborated a scratch probe trying `simp`, `rfl` and `infer_instance` as single closing tactics; none closed any theorem. I also read the relevant library-near-match statements: determinant identities and planar Gram formulas do not prove the distortion comparisons; the one-dimensional weak-derivative theorems do not provide the finite-dimensional slicing theorem; ring quasiregularity and box distortion are unrelated objects. No matching single-library-lemma proof or padded boundary-case declaration was found. These probes are evidence about padding, not proofs of the five theorems.

## Not verifiable

Nine cited works remain settled as uncertified. I inspected their manifest records and the available legal cached texts; I did not reopen settled requests or infer unread theorem contents. This limitation applies to source certification, not to the explicit calculations or pinned-library checks above.

- `Rickman1993`, Ch. I (basic QR, invariance, ACL comparison) and Ch. VI (downstream Picard theory): settled Springer/paywalled record; no legal text available in the supplied cache.
- `Vaisala1971`, Ch. 3 (§5.2): settled Springer/paywalled record; no supplied legal text.
- `Ahlfors2006`, Ch. I (§1.5): settled AMS/paywalled record; no supplied legal text.
- `Lee2012`, Ch. 15 (§7.5): settled Springer/paywalled record; no supplied legal text. The native descent proof route was checked independently.
- `Reshetnyak1989`, Ch. II (downstream Part II): settled AMS/paywalled record; no supplied legal text.
- `IwaniecMartin2001`, Ch. 6 (scope boundary for finite distortion): settled Oxford/paywalled record; no supplied legal text.
- `BonkHeinonen2001`, Theorem 1.1 (downstream Part III): settled inaccessible publisher/Euclid record; the available Prywes2019 text reports the bound, but that does not certify the original theorem's full text.
- `Gromov1981`, p. 200 (downstream question): settled Princeton/paywalled record; no supplied legal text.
- `Gromov1999`, Ch. 2 (downstream question): settled Birkhäuser/paywalled record; no supplied legal text.

## Source issues

- **Misprint** in HeikkilaPankka2025 at arXiv v2, proof of Proposition B.1, p. 24 (line 1328): the source composes the Nash embedding before the manifold map; it should compose the embedding after the manifold map, giving `ι ∘ p : M → ℝᵐ`; affects the proof.
