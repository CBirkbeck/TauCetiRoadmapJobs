# Review of ComplexKahlerGeometry (pull request #1807 at 7e8275c)

**Verdict:** needs changes

This is a full re-review. The folder changed by 4747 lines since 12e0624. `README.md` was rewritten to 2303 lines in TauCetiRoadmap form, and `Suggested.lean` was rewritten to 319 lines: 14 sorried headline theorems, 10 definitions with real bodies, no sorried data. The gate passes, and so does the dependency check (`depcheck: 239 roadmaps, 2423 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line). Eleven of the twelve previous findings are repaired; R06 is only partly repaired (R04 below).

The new blocking findings come from four places:
- the pinned Tau Ceti, which already contains much of what Layers 1, 2, 3, 5 and 7 plan to build (R01, R02);
- two famous Layer 3 theorems that can be stated with Mathlib carriers but are absent from `Suggested.lean` (R03);
- PseudodifferentialOperators on main, which still owns the differential-operator core that 5.2 now also owns (R04);
- DifferentialGeometry's open revision, which drops the Layers 6–9 this roadmap cites (R05).

## R01 (P2) — Layer 3 re-plans the pinned Tau Ceti's several-variable calculus, holomorphic stalks and meromorphic germ field

**Location.** `README.md` lines 740–751 (3.1), "Prove Osgood's lemma … Prove `realified_isManifold_analytic`: apply `AnalyticAt.restrictScalars` to the analytic chart transitions". Lines 771–779 (3.2), "Supply restriction, pullback and the maximal-ideal comparison". Lines 810–834 (3.3), "construct `K_a = FractionRing 𝒪_a`. Identify it with a field structure …". Conventions line 114, "3.1 proves its equivalence to complex analytic and complex `ContMDiff ∞` maps".

**Claim.** Each object below exists at Tau Ceti 2fd255d, the pin of this head, and the README neither cites it nor lists it in the Tau Ceti contract. The rule is to consume what is pinned, not restate it.
- Osgood's lemma: `ContinuousOn.analyticAt_of_differentiableAt_update` and `TauCeti.analyticOnNhd_iff_continuousOn_and_differentiableAt_update` (`Analysis/Complex/CauchyIntegralPolydisc.lean` lines 292, 318).
- The realified analytic atlas: `IsManifold.restrictScalars_of_ne_zero` and `IsManifold.maximalAtlas_subset_restrictScalars_of_ne_zero` (`Geometry/Manifold/Complex/Analytic.lean` lines 115, 123).
- Holomorphic means `ContMDiff`: `TauCeti.contMDiff_iff_mdifferentiable` (same file, line 174).
- The holomorphic structure sheaf `TauCeti.holomorphicStructureSheaf`, compared with `smoothSheafCommRing` in `StructureSheaf/SmoothComparison.lean`.
- Stalks are domains: `smoothStalkIsDomain` (`StructureSheaf/Domain.lean` line 93).
- The coordinate germs generate the maximal ideal in every dimension: `OpenPartialHomeomorph.ker_eval_eq_span_holomorphicLinearCoordinateGerm` (`StructureSheaf/MaximalIdeal.lean` line 197).
- The meromorphic germ field `TauCeti.meromorphicGerms` (`Analysis/Meromorphic/Germ.lean`).
- The meromorphic germ field as a fraction field, with its structure:
  - `toMeromorphicGerms_injective`, `exists_eq_toMeromorphicGerms_div`, `isFractionRing_meromorphicGerms`, `regularPart` and the unique splitting `evalInvSub_add_toMeromorphicGerms_eq_iff` (`StructureSheaf/MeromorphicGerm.lean` lines 73, 111, 141, 166, 207);
  - `principalPart` (`Analysis/Meromorphic/PrincipalPart.lean`);
  - pullback and the local-biholomorphism equivalence (`Analysis/Meromorphic/Pullback.lean` lines 40, 130; `StructureSheaf/Pullback.lean`);
  - `regularEval` and `rangeToMeromorphicGermsEquiv` (`StructureSheaf/RegularEval.lean` lines 63, 80).

**Witness.** `Analytic.lean` line 115, `theorem IsManifold.restrictScalars_of_ne_zero (hm : m ≠ 0) (h : IsManifold 𝓘(ℂ, E) m M) : IsManifold 𝓘(ℝ, E) n M`. README 3.1 plans the same atlas from `AnalyticAt.restrictScalars`.

**Repair.**
- Add the declarations above, by name and file, to "From Tau Ceti", and delete the matching construction sentences in 3.1–3.3 and in Conventions line 114.
- Keep only what the pin lacks:
  - 3.1: the export of local defining-equation comparisons;
  - 3.2: the several-variable power-series comparison `𝒪_(M,x) ≃ ℂ{z₁,…,z_n}`;
  - 3.3: the circle-integral formula for the coefficient of order `−k`, and the transport of finite sums, products and differentiation.
- In 3.4, cite `smoothStalkIsDomain` for the domain property. In `Suggested.lean`, import `TauCeti.Geometry.Manifold.Complex.StructureSheaf.Domain` and state `uniqueFactorizationMonoid_holomorphicStalk` without the `∃ _ : IsDomain …` binder.

## R02 (P2) — Layers 1, 2, 5 and 7 re-plan pinned Tau Ceti objects

**Location.**
- 1.1, lines 364–374: "Reindex `Fin (2 * finrank ℂ E)` to `Fin (finrank ℝ E)` … prove that every chart sign … is positive … every local biholomorphism is `IsOrientationPreservingAt`".
- 1.2, lines 410–417: "construct the joint holomorphic implicit map `F(z, w)` … prove its local uniqueness".
- 2.1, lines 542–548, and 2.2's *Parameter Cauchy–Green*, lines 577–584.
- 5.3, lines 1318–1326: "Own the delta-series failure".
- 5.1, lines 1209–1210, and 5.3's finite order.
- 7.1, lines 1970–1979: affine charts, `T2Space`, `CompactSpace`, `SecondCountableTopology`, `ConnectedSpace`.

**Claim.** Each of these is pinned:
- The complex orientation lift with every chart sign `1`, its naturality under local biholomorphisms, and the product law: `TauCeti.complexOrientationLift` and `complexOrientationLift_sign` (`Geometry/Manifold/Complex/Orientation.lean` lines 297, 311), `IsLocalDiffeomorphAt.isOrientationPreservingAt_complexManifoldOrientation` (line 359), `map_orientationAt_prod_complexManifoldOrientation` (line 441).
- The joint holomorphic implicit function theorem on manifolds with local uniqueness: `TauCeti.exists_jointImplicitFunction_of_eventually_mdifferentiableAt` (`Complex/ImplicitFunction.lean` line 52).
- The compact-support Cauchy transform with both inversion identities: `Analysis/Complex/Pompeiu/Basic.lean` lines 162, 234, 286.
- Its parameter version, with joint `C^n` regularity, commuting parameter derivatives, the commuting conjugate Wirtinger derivative and a holomorphy region independent of the parameter: `contDiffOn_integral_sub_inv_smul_with_param`, `hasFDerivAt_…`, `conjWirtingerDeriv_…` (`Pompeiu/Parameter.lean` lines 75, 124, 158).
- The δ-series failure, with the same test `1/(1+2x)` supported in `(−1/4, 1/4)`: `not_tendsto_sum_normalized_delta_derivative` (`Analysis/Distribution/DeltaSeries.lean` line 97).
- Local finite order: `Distribution.exists_norm_apply_le` (`Order.lean` line 39).
- The complex extension of real-test distributions: `Distribution.complexPairing` (`ComplexPairing.lean` line 56).
- The affine charts and manifold structure of `ℙ 𝕜 (Fin (n+1) → 𝕜)`: `Projectivization.instIsManifold` (`Geometry/Manifold/Instances/Projectivization.lean` line 82). Its `T2Space`, `CompactSpace`, `SecondCountableTopology` and `PathConnectedSpace` instances are in `Topology/Algebra/Projectivization.lean` (lines 149, 188, 215, 251).

**Witness.** `Orientation.lean` lines 297–311 define `complexOrientationLift : Manifold.OrientationLift 𝓘(ℝ, E) M (Fin (finrank ℝ E))` and prove `complexOrientationLift_sign`. Scope (line 29) names exactly these as "owned" by Layer 1.

**Repair.**
- Move these declarations to "From Tau Ceti" and cut the construction sentences. 1.1 then owns nothing beyond consuming them. 1.2 keeps the submanifold and normal-sequence theory. 2.1–2.2 keep only the shell exhaustion and the gluing of the solver. 5.3 keeps the continuous-primitive and supported-jet structure. 7.1 keeps the orientation comparison and the `OnePoint ℂ` biholomorphism.
- Tau Ceti's `Projectivization` modules cannot be imported next to `import Mathlib` at these pins. A probe fails with "environment already contains `Projectivization.instTopologicalSpace` from `Mathlib.Topology.Algebra.Projectivization`". The module docstring should give this as the reason the K7 projective statements are not statable. It currently says the carrier is a target of ComplexManifolds and K7.

## R03 (P2) — Rückert's Nullstellensatz and Oka's coherence theorem are statable but neither stated nor named as not statable

**Location.** `README.md` lines 859–865: "Prove **Rückert's Nullstellensatz** `I(V(𝔞)) = √𝔞` … Prove **Oka coherence** ((3.19)) … in the primitive local form". `Suggested.lean` lines 26–45 are the module docstring's "Stated here" and "Not statable" lists; neither mentions them.

**Claim.** Both are bolded headline theorems of Layer 3. Both are statable with Mathlib carriers alone, so their absence is the P2 case of the headline rule. The de Rham Hodge theorem of 5.7 (line 1633) is also neither stated nor named.

**Witness.** In a scratch copy, using Mathlib carriers only, this elaborates for analytic `f : Fin k → (Fin n → ℂ) → ℂ` and `g`: `(∀ᶠ z in 𝓝 0, (∀ i, f i z = 0) → g z = 0) → ∃ m a, (∀ i, AnalyticAt ℂ (a i) 0) ∧ (g · ^ m) =ᶠ[𝓝 0] ∑ i, a i * f i`. Oka's statement below also elaborates.

**Repair.** Add both theorems to the Layer 3 section of `Suggested.lean`, with docstrings citing Demailly II (4.22) and (3.19). One shape for the Oka statement:

    ∃ V ⊆ U, IsOpen V ∧ x ∈ V ∧ ∃ N g, (∀ i j, DifferentiableOn ℂ (g i j) V) ∧
      (∀ i, ∀ z ∈ V, ∑ j, g i j z * f j z = 0) ∧ ∀ y ∈ V, ∀ h, (∀ j, AnalyticAt ℂ (h j) y) →
        (∀ᶠ z in 𝓝 y, ∑ j, h j z * f j z = 0) →
        ∃ a, (∀ i, AnalyticAt ℂ (a i) y) ∧ ∀ j, h j =ᶠ[𝓝 y] ∑ i, a i * g i j

Instance check for the Nullstellensatz: with `k = 1`, `f₀ = z²` and `g = z`, the hypothesis holds and `m = 2`, `a₀ = 1` satisfy the conclusion. Either state the de Rham Hodge theorem the way the Dolbeault one is stated (finite-dimensionality on a real analogue of `ComplexDeRhamCohomology`), or name it in the docstring with the carrier it lacks.

## R04 (P2) — Two owners of the differential-operator core and the Laplace-type predicate (previous R06, partly repaired)

Re-raised: R06 of the previous review. The CKG → PDO edge is gone, but PseudodifferentialOperators on main still owns the same objects.

**Location.** `README.md` 5.2, lines 1248–1268: "Own the differential-operator core … Define the Laplace-type predicate: order at most `2` and Fourier principal symbol `c |ξ|²_g Id` … Construct the bilinear density transpose `P^t` … and the metric formal adjoint `P*`". Lines 91–95: "PseudodifferentialOperators consumes K5a: its differential-operator core (5.2)".

**Claim.** After this pull request merges, main has two roadmaps owning one object, and the two READMEs contradict each other about who supplies whom. 5.2's Checks repeat PseudodifferentialOperators' own Checks word for word: `P = a(x)∂` with `P* = −conj(a)∂ − conj(a′)`, and multiplication by `3`.

**Witness.** `TauCetiRoadmap/PseudodifferentialOperators/README.md` on main, lines 437–441: "Define the Laplace-type predicate on this carrier by order at most 2 and Fourier principal symbol `c|ξ|²_g Id` … Prove restriction, frame invariance, positive rescaling and the c=1 comparison; CKG K5a consumes this predicate". Lines 412–413 cover the density transpose and formal adjoint, and lines 419–420 the same `a(x)∂` Check.

**Repair.** Add PseudodifferentialOperators to this pull request. In its P1.0:
- cite ComplexKahlerGeometry 5.2 for the chart-local operator carrier, the Fourier symbol, the Laplace-type predicate, the density transpose and the formal adjoint;
- keep jets, the iterated-commutator order and the connection expansion;
- delete "CKG K5a consumes this predicate" (line 441).

This keeps the single direction of supply that 5.2's text now asserts. The other repair, moving the core into PseudodifferentialOperators, recreates the cycle, because P1.0 needs K5a's density bundle (line 425).

## R05 (P2) — Supplier ids that DifferentialGeometry's open revision drops

**Location.** The README cites:
- DifferentialGeometry 6.1–6.2 at lines 271, 1524 and 1539;
- DifferentialGeometry Layer 7 (Mayer–Vietoris) at lines 272, 1526, 1569, 1819 and 2104;
- DifferentialGeometry 8.3–8.5 at lines 272 and 1525;
- DifferentialGeometry 9.3 at lines 273 and 1919.

**Claim.** These are supplier citations. At the head of pull request #886, DifferentialGeometry's revision, none of these ids exists, and the README cites no replacement. Moreover, DeRhamCohomologyAndDuality at the head of #1768, its intended new owner, says in its Summary (lines 3–8) that these layers stay in DifferentialGeometry. So the two heads disagree, and neither one plans the content.

**Witness.** In the #886 head's `TauCetiRoadmap/DifferentialGeometry/README.md`, the headings jump from `### Layer 5.6` (line 940) to `### Layer 12` (line 1204). Lines 259–262 assign de Rham cohomology, Mayer–Vietoris, the de Rham theorem and Poincaré duality to DeRhamCohomologyAndDuality.

**Repair.** Own locally what this roadmap actually uses:
- the two-set Mayer–Vietoris exact sequence for `ComplexDeRhamCohomology`, as a target in 5.6 (it is used only for the slit cover of `ℂ ∖ {0}` and for the Hopf surface's de Rham groups in 7.3);
- the star-convex Poincaré lemma, which follows from the cited `homotopyOperator`.

For 8.3–8.5 and 9.3, cite the roadmap that owns them at the head where they are defined. Until the two open heads agree, record in the pull request's merge-order paragraph that these citations follow DifferentialGeometry on main.

## R06 (P3) — Anchor ids this pull request drops that roadmaps on main link to, with no old → new map

**Location.** The new headings `## Layer 2: … (K2)`, `## Layer 5: …` and `## Layer 7: …` (lines 526, 1143, 1960) replace the old `## K2: …`, `## K5: …` and `## K7: …`. The README has no old → new lines.

**Claim.** Relative anchor links on main break when this pull request merges. The blob-pinned links in Hyperfunctions, SpinGeometry and RiemannianGeometry still resolve at their commits.

**Witness.** On main, SmoothBundlesConnections line 576 and PseudodifferentialOperators line 2105 link `../ComplexKahlerGeometry/README.md#k5-compact-hermitian-elliptic-theory-and-serre-duality`. MorseTheory line 831 links `#k7-projective-torus-and-hopf-examples`.

**Repair.** Add one line per moved id to the README: K3.0 → 3.1, K5a → 5.1–5.8, K5b.0 → 5.9, K5b.1 → 5.10, K6.0 → 6.1, K6.1 → 6.2, K7.1–K7.3 → 7.1–7.3, and the old layer anchors → the new ones. Alternatively, add the three citing roadmaps to this pull request and update their anchors.

## R07 (P3) — Targets that need later targets

**Location.**
- 8.2's `*Needs:*` (line 2183) lists 8.3, and 8.3 (line 2188) "Supply the existence and lattice theorem needed at every induction step of 8.2".
- 2.1 needs 2.2–2.3 (line 563), 2.2 needs 2.3 (line 627), and 2.3 needs 3.1, and needs 2.2 "for the acyclicity statements" (line 663).
- 1.2 needs 3.1 (line 524).

**Claim.** Each listed target uses a target that comes after it in build order. 2.2 and 2.3 form a cycle between subsections: 2.3's truncation operators feed the 2.2 solver, which feeds 2.3's acyclicity statement.

**Witness.** Lines 2183 and 2188, quoted above.

**Repair.**
- Put 8.3 before 8.2.
- Order Layer 2 as Taylor/Laurent truncation, then the solver, then the polydisc lemma, then cohomology. Move the acyclicity sentence of 2.3 into 2.4.
- Move 3.1 to the start of Layer 1, or to a Layer 0, since line 734 already says it "precedes it in the build".

## R08 (P3) — Two suppliers are named as consumers

**Location.** Line 2258: "AlgebraicTopology Stage 7 consumes 7.1's carrier for its Euler-characteristic check". Lines 320–321 and 2264–2265: "VariationalMethods §5.3's geometric comparison follows 5.6 / 5.7".

**Claim.** Both sentences invert the direction of supply that the cited roadmaps state.

**Witness.**
- AlgebraicTopology at this head, lines 1817–1820: the `chi(CP^n)` check "consumes Stage 4.6's cell structure … no complex-manifold … input".
- VariationalMethods at #1028's head: §5.3 needs only 3.1 and 5.1 (line 942), and line 1054 says K5a consumes 5.3.

**Repair.** Delete both clauses. If 5.7 uses VariationalMethods §5.3's `CompactFormPair.differentialOperator` adapter for `D = d + d*`, add §5.3 to 5.7's `*Needs:*`.

## R09 (P3) — Locators that do not support the statement as written

**Location.**
- 7.2, lines 2008–2011: `H⁰(O(k))` is the space of degree-`k` homogeneous polynomials, of dimension `binomial(n+k, n)` ("knutson-borel-weil, p. 1").
- `Suggested.lean` line 150: uniqueness "(Demailly, Chapter II, (2.1))".
- Line 217: the Hodge theorem "(… Demailly, Chapter VI, §(7.3) and its preparation …)".

**Claim.**
- knutson-borel-weil, p. 1 (line 64–72) identifies the holomorphic sections of the dual tautological bundle with `V*`. That is `k = 1` only; there is no statement for `k ≥ 2` and none for `k < 0`.
- Demailly II (2.1) (`demailly-agbook` lines 3794–3800, p. 80) states existence only. Uniqueness is the uniqueness clause of division (2.3)–(2.4) (line 3817, p. 80).
- Finite-dimensionality is Demailly VI (7.2) (`demailly-agbook` line 15385, p. 309), not (7.3).
- Also: 3.5 cites II (4.31) for the dimension drop, but (4.31) (line 4929) only says `A_sing` is analytic; density of regular points is (4.24) (line 4789, p. 98). The regular-local-ring and Krull-dimension claim of 3.4 has no locator; II (4.32) (line 4959, p. 101) gives the `n` generators. `even_finrank_complexDeRhamCohomology_odd` has no locator; Demailly VI (8.12) (line 15523, p. 313) states it. The Dolbeault theorem's "Chapter IV" has no item number; it is IV (6.13).

**Witness.** `demailly-agbook` lines 13724–13728, Chapter V, (15.5)–(15.6), p. 278: `H⁰(P(V), O(k)) ≃ S^k V*` for `k ≥ 0`, `0` for `k < 0`, of dimension `binomial(n+k, n)`. This is the statement 7.2 makes; Knutson's p. 1 has only `k = 1`.

**Repair.** Replace each locator by the one given above. For "Hörmander, *Linear Partial Differential Operators*", give the book whose §2.3 is cited: *The Analysis of Linear Partial Differential Operators I*, 2nd ed., 1990.

## R10 (P3) — Unqualified subsection numbers in 5.6 and 6.2 point to the wrong subsections of this README

**Location.**
- Line 1508: "8.4's vector-valued simplex and chain integrals". This README has no 8.4.
- Line 1512: "5.5's `integralTopForm_eq_integralDensity`". 5.5 here is the Sobolev scale.
- Lines 1540 and 1551–1552: "5.4's radial homotopy", "5.4's `homotopyOperator`". 5.4 here is the Fréchet topology.
- Line 1547: "the polar notation of 1.4". 1.4 here is Newlander–Nirenberg.
- Line 1907: "5.2's `integralTopForm`". 5.2 here is differential operators.

**Claim.** Everywhere else in the README, a bare number means this roadmap's own subsection. These six references only make sense as DifferentialGeometry's numbering, or are unresolvable.

**Witness.** Line 1344 is `### 5.4 The smooth-section Fréchet topology …`, while line 1551–1552 reads "with 5.4's `homotopyOperator`".

**Repair.** Write "DifferentialGeometry 8.4 / 5.5 / 5.4 / 5.2". Replace "the polar notation of 1.4" by the definitions `β = d log|z|`, `α = dθ`, or by the roadmap and section that define them.

## R11 (P3) — Checks that compute the wrong value, use an object outside the hypothesis, or are missing

**Location.**
- 5.8 Check, lines 1712–1714: two circles "with ranks `1` and `2` … the eigenvalue `0` has multiplicity `2`".
- 3.5 Check, lines 947–949: `V = {z₁ z₂ = 0} ∩ {|z| ≤ 1}` with regular pieces "the two punctured closed discs".
- 5.5 Check, lines 1488–1489.
- The `IsKahlerForm`, `polydisc` and `lefschetzPow` Checks, and the `IsKahlerForm` docstring (`Suggested.lean` line 260: "`g(v, w) = κ(v, Jv)`").

**Claim.**
- The 5.8 Check computes the wrong value. With ranks 1 and 2, `ker Δ_d = ℂ ⊕ ℂ²`, so the multiplicity of `0` is `3`.
- The 3.5 Check uses an object outside the hypothesis. That `V` is compact but not an analytic subset: near `|z| = 1` it is a half-disc. Punctured closed discs are not submanifolds.
- The 5.5 Check does not test what it claims. `|x|^(1/2)χ ∈ H^s` exactly for `s < 1`, so it says nothing about the strict threshold `s > k + n/2 = 3/2` at `k = n = 1`.
- No Check excludes a form that fails `IsKahlerForm`'s J-invariance clause, and `polydisc` and `lefschetzPow` have no discriminating Check of their own.
- The `IsKahlerForm` docstring has a typo (`Jv` for `Jw`).

**Witness.** `κ = dx₁∧dy₁ + dx₂∧dy₂ + ε dx₁∧dx₂` on `ℂ²` is closed and positive on `(v, Jv)` for small `ε`. It is not J-invariant, because `dx₁∧dx₂(J·, J·) = dy₁∧dy₂`. Without invariance, `κ(u, Jv)` is not symmetric.

**Repair.**
- 5.8: write "multiplicity `3 = 1 + 2`", or make both ranks `1`.
- 3.5: use the closure of `{z₁ z₂ = 0}` in `ℂP²`, two lines meeting in one point: `S₁` is that point, `S₂ = ∅`, and the regular pieces are two copies of `ℂ`.
- 5.5: use `k = 0`, `n = 2`, with `log log(1/|x|)` cut off near `0`, which lies in `H¹(ℝ²)` and is unbounded.
- Add Checks:
  - the `κ` above as the non-example for J-invariance;
  - `(0.9, 0.9)` lies in `polydisc (1,1)` but not in the unit ball;
  - `lefschetzPow κ 1 1 = κ`, and `lefschetzPow (dx∧dy) 2 = 0` on `ℂ`.
- Correct the docstring to `g(v, w) = κ(v, Jw)`.

## R12 (P3) — Padding: `realified_isManifold_analytic` follows from one pinned lemma

**Location.** `Suggested.lean` lines 115–123.

**Claim.** The declaration closes with one library term, so it is not a headline.

**Witness.** In a scratch copy, `example … [h : IsManifold 𝓘(ℂ, E) ∞ M] : IsManifold 𝓘(ℝ, E) ω M := IsManifold.restrictScalars_of_ne_zero ω (by simp) h` elaborates without error at the pins.

**Repair.** Delete it from `Suggested.lean`. The README cites the pinned `IsManifold.restrictScalars_of_ne_zero` (R01). Remove it from the Summary and Scope wording if it is named there.

## R13 (P3) — Conflicting open pull requests on this roadmap, with no stated order

**Location.** The pull request description's merge-order paragraph: "No open pull request must merge before this one."

**Claim.** Pull requests #1234 ("normal frames, Picard and projective examples") and #1398 ("planar Hodge-star and Laplacian conventions") change this roadmap and conflict with this head. The paragraph names neither of them, and does not say which pull request is rebased on which or whether their content is absorbed here.

**Witness.** The overlap report: "#1234 and #1807 conflict in `TauCetiRoadmap/ComplexKahlerGeometry/README.md`, `…/Suggested.lean`", and the same for #1398.

**Repair.** In the description, state that #1234 and #1398 are rebased onto this pull request, or the reverse, and which of their targets this rewrite already contains.

## Previous findings (review at 12e0624)

- **R01 (sorried data): repaired.** The gate reports `sorry-data=0`. Every `def` (`polydisc` line 91, `dolbeaultCocycles` line 198, … `lefschetzPow` line 294) has a real body.
- **R02 (imports): repaired.** Lines 3–13 read `public import Mathlib` plus ten `TauCeti.*` modules, all of them used. No other roadmap's module is imported.
- **R03 (no headline stated): repaired in substance.** 14 headline theorems are stated, and the docstring (lines 35–45) names the ones that are not statable and what each lacks. Two statable Layer 3 headlines are still missing (R03 above).
- **R04 (ℂPⁿ CW structure): repaired.** Line 2016 reads "Consume AlgebraicTopology Stage 4.6's finite CW structure"; the "AT 8.12" clause is gone. The new consumer sentence at line 2258 is wrong (R08).
- **R05 (two-way supply with RealAnalyticGeometry): repaired on this side.** No `*Needs:*` cites RealAnalyticGeometry. 3.5 proves the regular-piece finiteness locally (lines 914–918), and the integral fundamental class goes to "ComplexKahlerGeometry, Part II" (lines 86–90, 1921–1924). RealAnalyticGeometry on main, line 1019, still calls R5 "the provider consumed by ComplexKahlerGeometry K6"; that sentence is RealAnalyticGeometry's to update.
- **R06 (two-way supply with PseudodifferentialOperators): partly repaired.** The cycle is cut on this side, but the two roadmaps now both own the core (R04 above).
- **R07 (pull-request numbers and blob links): repaired.** 0 `#nnn`, 0 `github.com` links.
- **R08 (unresolvable labels): repaired.** "VariationalMethods §5.1" and the like, "LieGroupoidsPoisson §G1.3a"; no GH5.1.
- **R09 (padding): repaired.** All listed declarations are gone. One new padding item appears (R12).
- **R10 (README shape): repaired.** It has the title `# Roadmap: …`, a Summary, Scope and ownership, Conventions, Exact supplier contracts, and How to read the build. There are 35 `**Checks.**` blocks and 8 pairs of `### Examples` / `### Dependencies`. There is no LaTeX. The remaining Check gaps are in R11.
- **R11 (pinned Nijenhuis, type calculus, ∂/∂̄, Hodge star, codifferential): repaired.** Lines 69–73 and 196–240 consume them, and 1.3 keeps only the complex-bilinear extension. The wider re-audit against the pin is R01–R02.
- **R12 (`Classical.choose`): repaired.** The declaration is gone; the gate reports `statement-hygiene=0`.

## Verified sound

**Gate and dependency check at 7e8275c.**
- The worker's gate passes, every rule 0.
- My own run reproduces every count: `set_option=0 … sorry-data=0 … imports=0 … statement-hygiene=0 … build=0 … stray-files=0`. Its 20 `outside-folder` lines are the thirteen sibling folders the brief names as the pull request's own.
- `depcheck: 239 roadmaps, 2423 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the fourteen named folders is empty. The worktree is clean.

**Elaboration.** `lake env lean TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` exits 0 in 12 s. The only output is 14 `declaration uses sorry` warnings, one per theorem (lines 75, 100, 119, 130, 141, 152, 173, 181, 219, 226, 271, 279, 287, 305).

**`#check @name` for all 24 declarations** (scratch copy, elaborated once). The types match the worker's elaborated-signature report.
- Nine definitions elaborate without `[FiniteDimensional ℂ E]`: `dolbeaultCocycles`, `dolbeaultCoboundaries`, `DolbeaultCohomology`, `mextDerivℂ`, `deRhamCocycles`, `deRhamCoboundaries`, `ComplexDeRhamCohomology`, `IsKahlerForm` and `lefschetzPow`. None of their bodies needs it, and every theorem stated on them keeps `[FiniteDimensional ℂ E]`, together with `[T2Space M] [CompactSpace M]` where the README requires compactness.
- No theorem lost a binder its README statement has. Nothing needed changing.

**Adversarial table** (values computed on each side).

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| `newlander_nirenberg` | `E = ℂ`, any `J` on a surface; 1.3's `J` on `ℝ⁴`; `J = ofComplexManifold` | surface: `N(v,Jv) = −N(Jv,v) = J N(v,v) = 0`, so the hypothesis holds and the conclusion is isothermal charts; `ℝ⁴`: `N(∂x,∂u) = [∂y, ∂v + y∂x] = ∂x ≠ 0`, so the hypothesis fails; `IsPseudoholomorphicWithinAt` requires `HasMFDerivWithinAt` (`JHolomorphic.lean` lines 81–84), so a zero derivative cannot make it vacuous | sound | none |
| `dolbeault_grothendieck_polydisc` | `n = 1`, `r = 1`, `φ = z̄ dz̄`; `n = 0`; `r₁ ≤ 0` | `ψ = z̄²/2`, `∂̄ψ = z̄ dz̄`; `n = 0`: forms of degree ≥ 1 vanish, `ψ = 0`; empty polydisc: vacuous; `p + (q+1)` and `p+q+1` agree definitionally | sound | none |
| `hartogs_extension` | `n = 2`, `K = {0}`; shell `1 ≤ ‖z‖ ≤ 2`; `n = 1` | `ℂ² ∖ {0}` connected, so extension; shell: `Ω ∖ K` disconnected, and `1` inside, `0` outside contradicts the identity theorem; `1/z` on `ℂ ∖ 0` excluded by `2 ≤ n` | sound (Demailly I (3.28), p. 28) | none |
| `weierstrass_preparation` | `w² − z` (`d = 2`); `e^z w` (`d = 1`); `d = 0`; `n = 0` | derivatives at `0`: `0, 0, 2`; `u = 1`, `a = (−z, 0)`; `u = e^z`, `a = ∅`; `u = f`; `n = 0`: `a i = 0`, `f = u w^d` | sound (II (2.1), p. 80) | none |
| `weierstrass_preparation_unique` | `w² − z = u′(w² + a′₁ w + a′₀)` | the roots of both polynomials are the zeros `±√z` of `f(z, ·)` near 0, so `a′ = (−z, 0)` and `u′ = f/P = 1` | true | locator (R09) |
| `isRegularLocalRing_holomorphicStalk` | `E = 0`; `E = ℂ` | stalk `ℂ`, dimension `0 = finrank 0`; `ℂ{z}` a DVR, dimension `1 = finrank ℂ ℂ` | sound | locator (R09) |
| `uniqueFactorizationMonoid_holomorphicStalk` | `ℂ{z, w}` | `w² − z³` irreducible; `w² − z² − z³ = (w − z√(1+z))(w + z√(1+z))` | sound (II (2.10), p. 82) | binder (R01) |
| `dolbeaultCocycles` / `Coboundaries` / `DolbeaultCohomology` | compact Riemann surface, `(p, q) = (1, 0)` | cocycles are the holomorphic 1-forms (dimension `g`), coboundaries `⊥`; the ambient quotient by `⊥` is infinite-dimensional, so the image construction is required; `IsOfType.delBar` with `delBar_delBar_ofComplexManifold` gives coboundaries ⊆ cocycles | sound | none |
| `finiteDimensional_dolbeaultCohomology` | Hopf surface; `ℂ` (non-compact); `E = 0` | `h^(0,1) = 1`; `H^(0,0)(ℂ) = 𝒪(ℂ)` infinite-dimensional, so compactness is needed; finite `M`: `h^(0,0) = |M|` | sound | locator (R09) |
| `finrank_dolbeaultCohomology_serre` | Hopf (`n = 2`); elliptic curve, `p = 2, q = 1` | `h^(0,1) = 1 = h^(2,1)`, `h^(1,0) = 0 = h^(1,2)`; without `hp`: `h^(2,1) = 0` but truncated `h^(0,0) = 1`, so `hp` is needed | sound (VI (7.3), p. 310) | none |
| `finrank_complexDeRhamCohomology_eq_sum_dolbeault` | elliptic curve, `k = 1, 2`; Iwasawa (non-Kähler) | `2 = h^(0,1) + h^(1,0)`; `1 = 0 + 1 + 0`; Iwasawa `4 ≠ 3 + 2`, so the Kähler hypothesis is needed | sound (VI (8.5), p. 311) | none |
| `finrank_dolbeaultCohomology_symm` | elliptic curve; Hopf | `1 = 1`; Hopf `0 ≠ 1`, excluded because it is not Kähler (`b₂ = 0`) | sound | none |
| `even_finrank_complexDeRhamCohomology_odd` | elliptic curve; Hopf | `b₁ = 2`; Hopf `b₁ = 1`, not Kähler | sound | locator (R09) |
| `hard_lefschetz`, `lefschetzPow` | curve, `k = 0`; `k = n`; `ℂP¹ × ℂP¹`, `k = 0` | `H⁰ = ℂ^c → H² = ℂ^c` via `∫ω > 0` on each component; `lefschetzPow κ 0 = id`; `∫ω² = 2 ≠ 0`; degree `k + 2(n−k) = 2n − k` | sound (VI (8.17), p. 313; Ballmann 5.31) | Checks (R11) |
| `IsKahlerForm` | `ℂ`, `dx∧dy`; `−dx∧dy`; the `ℂ²` form `κ_ε` of R11 | `κ(1, i) = 1 > 0`; `−1`; `κ_ε` closed and tame but not invariant; `g(v,u) = κ(Jv, J²u) = κ(u, Jv)` symmetric; same sign as the pinned `Tames` (`TwoForm.lean` lines 174–176) | sound | Check, typo (R11) |
| `polydisc` | `r = (1,1)`; `r₁ = 0` | `(0.9, 0.9)` in, of norm 1.27 (not in the ball); empty | sound | Check (R11) |
| `realified_isManifold_analytic` | one-tactic probe | `IsManifold.restrictScalars_of_ne_zero ω (by simp) h` closes it | padding | R12 |
| 1.1 Checks | `diag(2, i)`; conjugation | real determinant `|2i|² = 4`; `−1` | sound | pinned (R02) |
| 1.3 Check (sign) | `Y ↦ fY` | reversed signs add `2((JX)f·JY − (Xf)Y)`, pinned form adds `0` | sound | none |
| 2.2 Checks | `f = 1`; `f = q⁻¹`; `f = q̄` | `u = z̄`; `u = q⁻¹ z̄`, while `q⁻¹z̄ + q̄` fails `∂̄_q u = 0`; `∂̄_q f = 1 ≠ 0`, so no solution | sound | pinned parts (R02) |
| 2.3 Check | `1/(1 − z)`, `r = 1/2`, `ρ = 3/4` | error `2^(−N)` ≤ bound `12(2/3)^(N+1)` (`N = 0`: `1 ≤ 8`) | sound (Rainer Thm 7.4) | none |
| 2.4 Check | compact `M`, `c` components | `H^(0,0) = ℂ^c` | sound | none |
| 3.1 Check | `xy/(x² + y²)` | separately analytic, discontinuous at `0` | sound | pinned (R01) |
| 3.3 Checks | `1/(z − a)`; `(z − a)^(−2)` | coefficient `(2πi)⁻¹∮dz/(z − a) = 1`; product of order `−2`, `c₋₂ = 1` | sound | pinned (R01) |
| 3.4 Checks | relations of `(z, z²)` and `(z₁, z₂)` | `(a, b) = b(−z, 1)`; Koszul `(z₂, −z₁)` | sound | none |
| 3.5 Checks | `z² = w³`; `V = {z₁z₂ = 0} ∩ B̄` | `Sing = {0}`, dimension `0 < 1`; `V` is not analytic near `|z| = 1` | one Check false | R11 |
| 4.1 Check | `O(1)`, `O(2)` on `ℂP¹` | `h⁰ = 2, 3` (`binomial(1+k, 1)`) | sound | none |
| 4.2 Checks | `h = e^(−φ)`; `O(1)`, `h = (1+|z|²)⁻¹`; gauge | `A = −∂φ`, `Θ = ∂∂̄φ`; `Θ = ∂∂̄ log(1+|z|²) = −2πi ω_FS`; `(∂̄+a)(e^u f) = 2a e^u f ≠ 0` | sound (Ballmann 3.18; Demailly V (12.4)) | none |
| 4.3 Check | `d + λ dz/z`, `λ = 1/2` | `e^(−πi) = −1`; equals inverse iff `λ ∈ ½ℤ` | sound | none |
| 5.2 Checks | `∂ + 3` at `x = 2`, `ξ = 2`; `x∂`; `Δ_∂̄` on `ℂ` | `16`; `σ_F = 2i`, `σ_geom = 2`; `P* = −x∂ − 1`; symbol `½|ξ|²` | sound | duplicate owner (R04) |
| 5.3 Checks | `δ′`; `δ^(n)/n!` with `1/(1+2x)` | `⟨δ′, z⟩ = −1`, so `u₁ = 1`; `(−1)^n(−2)^n = 2^n` | sound | pinned (R02) |
| 5.5 Checks | Bessel weights; `δ(2x)`; `|x|^(1/2)χ` | constants `1`, `2^|s|`; `δ/2`; `∫(1+ξ²)^s|ξ|^(−3)` finite iff `s < 1` | one Check vacuous | R11 |
| 5.6 Checks | `dz/z`, `dz̄/z̄`; `dz̄∧dz` | periods `2πi`, `−2πi`, difference `4πi`; `d(i(x dy − y dx)) = 2i dx∧dy` | sound | references (R10) |
| 5.7 Checks | codifferential sign, `m = 3, k = 1`; Peetre, `s = −1` | `(−1)^7 = −1` on both sides; `1 ≤ √2` holds, alternative at `|ζ| = 1`: `1 ≤ √2/2` fails | sound | none |
| 5.8 Check | two circles, ranks 1 and 2 | `dim ker Δ = 1 + 2 = 3`; the Check says `2` | false | R11 |
| 5.9 / 6.1 Checks | `ℂ²`; `[Λ, L]` on `ℂ`; `[iΘ, Λ]` | `ω²/2! = dvol`; `+1`, `−1`; `a` on (1,1)-forms, `−a` on functions | sound | none |
| 6.2 Checks | `ℂP¹ × ℂP¹`, `ω₁ − ω₂`; `f dz`; nodal cubic | `(−1)·(−2) = 2 > 0`; `2∫|f|²`; `∫ω_FS = 3` | sound | none |
| 7.2 Checks | `ω_FS` on `ℂP¹` | `(1/π)·2π·½ = 1`; unnormalized `π` | sound | locator (R09) |
| 7.3 Checks | Hopf weights; `S¹ × S³` | `2^(a+b+1) ≥ 2`, `2^(1−m−n) ≤ ½`; `1,1,0,1,1 = Σh` | sound | none |
| 8.1 Checks | Iwasawa; Hopf; bidegree | `3 + 2 = 5 > 4`; `1 = 0 + 1`; `(r, 1 − r)` | sound (VI (11.1)–(11.2)) | none |
| 8.2 Checks | invariant forms | `∂(dz₃ − z₁dz₂) = −dz₁∧dz₂`; `∂̄(dz̄₃ − z̄₁dz̄₂) = −dz̄₁∧dz̄₂` | sound | build order (R07) |

**Library declarations opened at the pins** (Tau Ceti 2fd255d, Mathlib per `lake-manifest.json`).
- Tau Ceti, symplectic and almost complex: `JHolomorphic.lean` lines 81–103; `Symplectic/Manifold/TwoForm.lean` lines 174, 231.
- Tau Ceti, differential forms: `Dolbeault/Basic.lean` lines 86, 95; `AlmostComplexType.lean` line 282.
- Tau Ceti, complex manifolds: `Complex/Analytic.lean` lines 88–123, 174; `Complex/Orientation.lean` lines 195–482; `Complex/ImplicitFunction.lean` line 52; `Instances/Projectivization.lean` line 82; `Topology/Algebra/Projectivization.lean` lines 149–251.
- Tau Ceti, complex analysis: `CauchyIntegralPolydisc.lean` lines 292–365; `Pompeiu/Basic.lean` lines 162–286; `Pompeiu/Parameter.lean` lines 75–182.
- Tau Ceti, structure sheaf and meromorphic germs: `StructureSheaf/{Domain, MaximalIdeal, MeromorphicGerm, RegularEval, Pullback, SmoothComparison}.lean`; `Analysis/Meromorphic/{Germ, PrincipalPart, Pullback}.lean`.
- Tau Ceti, distributions: `Analysis/Distribution/{DeltaSeries, Order, ComplexPairing}.lean`.
- Mathlib: `RegularLocalRing/Defs.lean` line 52 (no regular-implies-UFD theorem at the pin); `Analytic/Constructions.lean` line 831; `Complex/Conformal.lean` lines 189, 286; `Complex/Convex.lean` line 45; `Topology/Algebra/Projectivization.lean`.
- A grep over both pins finds 45 further README-cited names, among them `mapCoeff_delBar_of_map_smul_conj`, `kerDelBarZeroEquiv` and `integralTopForm_inner_mextDeriv_eq_inner_codifferential`. The only one not at a pin is `legacySmoothTwoFormEquiv`, which is DifferentialGeometry 0.4's target (its README on main, line 303).

**Cross-roadmap citations resolved.**
- On main (eaf17b1):
  - ComplexManifolds Milestones 1–7 (lines 172–319, items 7.4–7.5 at line 373); ComplexTori Milestone 1 (line 130).
  - SmoothBundlesConnections B2.1–B6.3 (lines 559–1716); PDE §1.3 (A3), §1.7 (A7), §2.2 (B9), §5.3 (E22), §5.6 (E25) (lines 769–2097).
  - LieGroupoidsPoisson §G1.3a (line 18, which names K8 as its consumer at line 86); Completed/RealAlgebraicGeometry Layer 7 (line 479).
  - DifferentialGeometry Layers 0–12 (lines 268–910).
  - PseudodifferentialOperators lines 410–441 (R04); RealAnalyticGeometry lines 173–1029.
- At this head: AlgebraicTopology Stages 4.6, 5.0, 6.3 and 7 (lines 285, 826–830, 961, 1817–1821) and CharacteristicClasses C1.5 (lines 100–107).
- At open heads: VariationalMethods at #1028 (§2.2–§5.3 and Downstream, lines 924–1072); DifferentialGeometry at #886 and DeRhamCohomologyAndDuality at #1768 (R05); CalibratedGeometry at #946. CalibratedGeometry consumes K5b.0 and K6.1 for the volume of complex planes and owns the general Wirtinger inequality (its lines 49–50, 213–222), so there is no second owner.
- Ownership against #1234 and #1398, whose files the brief does not give, was not checked beyond the overlap report (R13).

**Sources at their locators** (the seeded sample).
- Demailly (`demailly-agbook`):
  - Chapter I: (3.2) and (3.4) at lines 883 and 918, p. 21; (3.28) at line 1266, p. 28; (3.29) at line 1288, p. 28, local form, as the README says.
  - Chapter II: (2.1) at line 3794, p. 80; (2.3) at line 3804; (2.7) at line 3872; (2.10) at line 3931; (3.19) at line 4286; (4.19) at line 4613; (4.22) at line 4742; (4.29) at line 4842; (4.31) at line 4929.
  - Chapter V: (12.4) at line 13254.
  - Chapter VI: (7.2) and (7.3) at lines 15385 and 15390, pp. 309–310; (8.5) at line 15442; (8.12) at line 15523; (8.17) at line 15557, p. 313; §11 at lines 15941–15960.
- Ballmann (`ballmann-kahler`): Theorems 3.18, 4.17, 4.23, 5.25 and 5.31 at lines 1400, 1990, 2090, 2680 and 2742.
- Rainer (`rainer-advanced-complex-analysis`): Theorem 7.4 at line 716.
- Sakane (`sakane-parallelisable`): Theorem 1 at lines 46 and 102 (printed pp. 187 and 189).
- Angella (`angella-iwasawa`): Theorems 2.1, 2.3 and 4.1 and Appendix A at lines 256, 276, 766 and 916.
- Knutson (`knutson-borel-weil`): p. 1, lines 64–72 (R09).
- Every flagged locator other than those in R09 supports its statement as written.

## Not verifiable

- `webster-nn` (Math. Z. 201 (1989), pp. 303–316), settled as uncertified. The 1.4 route is cited by locator only.
- `hormander-alpdo1`, Theorems 2.3.4–2.3.5, settled as uncertified and not read. The 5.3 statements were checked mathematically in the table.
- `wells-dacm`, Chapters II and IV, settled as uncertified. The Hodge and Serre statements were checked against Demailly VI (7.2)–(7.3) instead.

## Source issues

- none
