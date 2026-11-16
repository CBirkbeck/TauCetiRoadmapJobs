<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17485#issuecomment-6907213473 -->
Red team round 1 pass b (claude) of 1b6ac44

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) Layer 9's Anosov examples: §9.2(a) is statable at the pins and absent, and §§9.1–9.2 are not named in the module docstring

   **Location.** `packages/HyperbolicDynamicsAndThermodynamicFormalism/Suggested.lean:21–36`: "Headline
   theorems of the README that are not stated here, with what each lacks at the pins: … the Anosov
   property of the geodesic flow of a compact manifold of negative sectional curvature (README §9.3)".

   **Claim.** The docstring lists every headline that is not stated. It classes the Anosov property of
   one Layer 9 example (§9.3) as a headline and is silent on the other two of the same layer and the
   same standing: "f_A is … Anosov for the flat metric" (README §9.1, line 764) and "the suspension flow
   on the smooth mapping torus … is a C^∞ Anosov flow" (README §9.2(a), line 783).

   **Witness.** §9.2(a) needs no carrier beyond the file's own `IsHyperbolicSet`, `IsFlowHyperbolicSet`
   and three pinned declarations: `TauCeti.SmoothMappingTorus` (abbrev,
   `TauCeti/Geometry/Manifold/Instances/MappingTorus.lean:245`), its manifold structure for the model
   `𝓘(ℝ).prod I` (instance `TauCeti.instIsManifoldQuotient`,
   `TauCeti/Geometry/Manifold/Instances/Quotient.lean:242`) and
   `TauCeti.SmoothMappingTorus.flow : Flow ℝ (SmoothMappingTorus φ)` (`MappingTorus.lean:395`).
   Hyperbolicity does not depend on the metric (README §7.3), so the metric on the mapping torus is an
   instance binder, as it is for `M` everywhere else in the file. Instance tried: `N` a point, `φ = id`:
   `IsHyperbolicSet I φ univ` holds with `E^s = E^u = 0`; the mapping torus is a circle, its flow the
   unit rotation, `flowGenerator ≠ 0`, `T = ℝX`, so `IsFlowHyperbolicSet` holds with `E^s = E^u = 0`.
   `N` empty: both sides vacuous.

   **Repair.** Either of the following; the first is the one the rules ask for when it elaborates (this
   pass is read-only and ran no Lean, so the worker elaborates it once with `#check @name`).

   1. State §9.2(a) under a new `/-! ## Layer 9: Examples -/` block, importing
      `TauCeti.Geometry.Manifold.Instances.MappingTorus`: for `φ : N ≃ₘ^∞⟮I, I⟯ N` on a compact Hausdorff
      boundaryless finite-dimensional smooth `N`, with `[RiemannianBundle …]` and
      `[IsContinuousRiemannianBundle …]` binders on the tangent bundles of `N` and of
      `TauCeti.SmoothMappingTorus φ` (model `𝓘(ℝ, ℝ).prod I`, fibre `ℝ × E`), hypothesis
      `IsHyperbolicSet I φ' univ` for the `C¹` diffeomorphism `φ'` underlying `φ`, conclusion
      `IsFlowHyperbolicSet (𝓘(ℝ, ℝ).prod I) (TauCeti.SmoothMappingTorus.flow φ) univ`. Add the name to
      README §9.2(a).
   2. If a binder cannot be supplied at the pins (the `C¹` diffeomorphism underlying a `C^∞` one, or
      `(𝓘(ℝ, ℝ).prod I).Boundaryless`), add to the docstring's list, naming that carrier:
      "* the Anosov property of the suspension flow of an Anosov diffeomorphism (README §9.2(a)): 〈the
      missing carrier〉;".

   In both cases add the bullet for §9.1, whose statement needs the diffeomorphism `f_A` as data:
   "* the Anosov property of hyperbolic toral automorphisms (README §9.1): the induced map of
   `UnitAddTorus (Fin n)` as a `Diffeomorph` for the product manifold structure
   `TauCeti.instIsManifoldPi` is a construction of README §9.1; its ergodic consequence, that Haar
   measure is the unique measure of maximal entropy, is stated
   (`isEquilibriumState_toralEndomorphism_zero_iff`);".

2. **F02** (P3) §2.2: ClimenhagaThompson2016 Lemma 2.10 does not state the item it is cited for

   **Location.** `packages/HyperbolicDynamicsAndThermodynamicFormalism/README.md:232`: "weak
   specification at scale δ for long segments implies it for all segments with the same scale after
   enlarging τ (ClimenhagaThompson2016, Lemma 2.10, lines 448–463, for the tail version …)".

   **Claim.** The lemma supports the item.

   **Witness.** ClimenhagaThompson2016 lines 448–449: the lemma passes tail specification at all scales
   from a collection 𝒢 to its enlargement 𝒢^M, and its proof changes the scale (δ′ at line 450). It
   says nothing about short segments at a fixed scale.

   **Repair.** Replace the parenthesis by the one-line proof and demote the citation:
   "(a segment (x, t) with t below the threshold T₀ is the initial part of (x, T₀); shadowing the
   longer segment shadows the shorter, and the unused time T₀ − t joins the gluing time, so τ + T₀
   serves; compare ClimenhagaThompson2016, Lemma 2.10, lines 448–463, which passes tail specification
   from a collection to its enlargements)". Tested: segments (x₁, 0.2), (x₂, 5) with T₀ = 1, τ = 3:
   shadow (x₁, 1), (x₂, 5) with gap g ≤ 3; the gap after the true first segment is 0.8 + g ≤ 4 = τ + T₀.

3. **F03** (P3) §§10.2–10.4: compactness of M is assumed where neither the proof nor the suppliers use it, and §10.4's Lean is narrower than its README

   **Location.** `Suggested.lean:531` and `:584` (`[CompactSpace M]` in sections `BowenRuelle` and
   `PositiveEntropy`); `README.md:851` and `:863` ("of a compact manifold", "on a compact manifold");
   `README.md:876` ("a basic set Λ of a C¹ flow", no compactness).

   **Claim.** The README's generality equals the Lean's, and the statements are at the generality the
   roadmap's own layers reach.

   **Witness.** (a) §10.4's README target has no compactness of M; `pos_coverEntropy_of_isFlowBasicSet`
   and `pos_coverEntropy_of_isBasicSet` carry `[CompactSpace M]`. (b) The proofs of §§10.2–10.3 use only
   §§8.4–8.5 (stated for σ-compact M, `Suggested.lean:457`) and §6.8 (compact Λ). Instance excluded by
   the hypothesis: f = diag(2, 1/2) on ℝ², Λ = {0}, the README's own witness (Conventions, line 31):
   basic set, unique equilibrium state δ₀, entropy 0, Λ finite.

   **Repair.** In `Suggested.lean` replace `[CompactSpace M]` by `[SigmaCompactSpace M]` in the sections
   `BowenRuelle` (line 531) and `PositiveEntropy` (line 584); in README §§10.2–10.3 replace "of a
   compact manifold" / "on a compact manifold" by "of a manifold of the Conventions (Hausdorff and
   σ-compact; Λ is compact by definition)", keeping "compact" in the two "In particular … Anosov"
   sentences and in Layer 11. Tested on diag(2, 1/2), Λ = {0}: `IsBasicSet` holds (U a ball, the only
   whole orbit in it is 0), the subtype is a point, the equilibrium state is δ₀ with
   `ν(B_n) · exp(nP − S_nφ) = 1`, and `Λ.Finite` holds.

4. **F04** (P3) FH2019 is cited nine times by the locator "Part II"

   **Location.** `README.md:439, 463, 537, 567, 604, 655, 713, 783, 798` and `:1023`: "(FH2019, Part II)".

   **Claim.** Each target has an exact locator.

   **Witness.** One locator, a whole part of the book, serves nine different statements (closing for
   flows, the splitting, time reversal, strong and weak manifolds, local product structure, suspensions,
   geodesic flows). `sources.toml` records `locator_scheme = "chapter"`, `locator = "Part II"`.

   **Repair.** Replace each occurrence by the chapter (and section) that contains the statement, read
   from the book's public contents page, and set `locator` in `sources.toml` to the list; where no
   chapter can be confirmed, delete the FH2019 citation: every occurrence already stands beside a
   second locator (BowenRuelle1975 lines or a KatokHasselblatt1995 section) except line 439, whose
   claim is §8.5's own theorem.

5. **F05** (P3) §§6.2 and 6.6: the closing constant is called φ(ε), the letter of the potential

   **Location.** `README.md:390` and `:463`: "closing: for every ε > 0 there are φ(ε) > 0 and R(ε) such
   that if m ≥ R(ε) and d(f^m y, y) < φ(ε)".

   **Claim.** Notation is the roadmap's own and unambiguous.

   **Witness.** φ is the potential in the same layer (`README.md:427`, "a Hölder φ"; `:481`, `:494`).
   The constant's name and the clause order are those of BowenPeriodicPoints1971 line 101 (about 12
   consecutive tokens shared, most of them symbols).

   **Repair.** Line 390: "closing: for every ε > 0 there are η > 0 and R such that every y with
   d(f^m y, y) < η for some m ≥ R has a point z with f^m z = z and d(f^k z, f^k y) ≤ ε for 0 ≤ k ≤ m".
   Line 463: the same with η and R, "if T ≥ R and d(g^T y, y) < η". These are the only two occurrences
   of φ(ε).

One blocking finding (R01, P2); R02–R05 are P3. No false statement was found: every Lean
declaration and every bold README target was instantiated on the cases of the table below and held.

## The pass: record

`Suggested.lean` declarations (50). "ctx" is the section context; values are what was computed.

| Declaration | ctx | Instances tried and values | Result |
|---|---|---|---|
| `countablePartitionEntropy`, `iteratedPartitionLabel`, `partitionEntropyRate`, `measureEntropy` | `[MeasurableSpace X]` | compared token for token with ClassicalErgodicTheory's file at its head (its lines 405–421) and GeometryOfNumbersAndQuadraticArithmetic §4.2's prose; fair coin label: H = log 2; `n = 0` excluded by `0 < n` | identical; no change |
| `invariantProbabilities`, `flowInvariantProbabilities` | same | supplier lines 554–566 (supplier's is over any `τ`; ours `ℝ`) | specialisation; no change |
| `pressureNetSum`, `topologicalPressure`, `flowTopologicalPressure` | `[UniformSpace X]` | one point: net {pt}, sum e^{nφ}, growth φ = P; empty space: sum 0, P = ⊥; φ = 0 gives Mathlib's net entropy; smaller entourage admits more nets, so ⨆ is the limit | matches supplier lines 571–614 |
| `IsEquilibriumState`, `IsFlowEquilibriumState` | same | one point: 0 + φ = φ; supplier lines 720–743 | identical |
| `IsGibbsMeasure` | `[PseudoMetricSpace X]` | full 2-shift, φ = 0, ε = 1/2: 2^{−(n+2)} · 2^n = 1/4; ε above the diameter: product 2^n, excluded by `ε ≤ ε₀`; supplier README §8.4 has the quotient form, equal | no change |
| `HasBowenProperty`, `IsExpansiveFlow`, `HasFlowBowenProperty` | same | supplier lines 782–814; identity flow of a circle: not expansive; of a finite set: expansive | identical |
| `HasLowerGibbsProperty` | same | t = 0: ν(ball) ≥ K⁻¹; periodic orbit: arc of measure 2s_ε/p; wrong sign e^{−tP}: 4^{−t} → 0 | no change |
| `HasWeakSpecification`, `HasFlowWeakSpecification` | same | k = 0: asks for a point (empty space fails); start time Σ_{l<j}(n_l + g_l) equals README's N_{j−1} + τ_{j−1}; swap: (a,1),(a,1) needs 1 + g even, (a,1),(b,1) odd, so weak with τ = 1, not strong; n_j = 0: vacuous for maps, one time for flows | no change |
| `upperSemicontinuousOn_measureEntropy_of_isExpansiveFlow` | compact metric, Borel | empty space: vacuous; one point; period-1 orbit (g¹ = id, entropy 0); route: Γ_ε in an orbit segment, BowenEntropyExpansive1972 Example 1.6, ClimenhagaThompson2016 Theorem 3.2 (ergodic) plus decomposition | true |
| `existsUnique_isEquilibriumState_of_hasWeakSpecification` | nonempty compact metric | one point (Gibbs product 1); swap (unique, ergodic, not mixing); two full shifts (spec fails, ES a segment); lower bound Lemma 6.13, upper Proposition 6.17 with the Bowen property | true |
| `existsUnique_isFlowEquilibriumState_of_hasFlowWeakSpecification` | same | one fixed point; periodic orbit; identity flow of two points (expansive, no spec, two measures) | true |
| `HasHyperbolicLocalProductStructure` | `[PseudoMetricSpace X]` | 2-shift: c = 1, ρ = 1/2; identity of a finite set: holds; irrational rotation: (A3) fails; monotone shift: holds, not forward transitive; two-sided δ*-closeness gives d ≤ cρ^n δ* → 0 | no change |
| `HasFlowHyperbolicLocalProductStructure` | same | periodic orbit of period 1: δ = 0.6 gives v = 0.45 and −0.55 (so δ₀ needed), δ₀ = 1/4 works; irrational linear flow: (F3) vacuous, (F2) fails; fixed point excluded by the first clause; uniqueness of v re-derived from W^u ∩ W^cs = point and no small periods | no change |
| `existsUnique_isEquilibriumState_of_hasHyperbolicLocalProductStructure` | nonempty compact | finite orbit (first disjunct); 2-shift (log 2 > 0); monotone shift excluded by `∃ n : ℕ` (U = {x₀ = 1}, V = {x₀ = 0}); gluing time mM + (mL_j − r_j − n_j) + r_{j+1} ∈ [mM, mM + 2m − 1] recomputed, including r_j + n_j = 0 | true |
| `existsUnique_isFlowEquilibriumState_of_hasFlowHyperbolicLocalProductStructure` | same | periodic orbit; roof-1 suspension of the 2-shift (weak, not strong spec: τ within 1/4 of ℤ and of 1/2 + ℤ impossible) | true |
| `IsHyperbolicSet`, `flowGenerator`, `IsFlowHyperbolicSet` | manifold, continuous metric | diag(2, 1/2) at 0: C = 1, ρ = 1/2; diag(2, 1): fails; ρ = 1 excluded by `Ioo`; empty Λ: holds; flow: three-term sum from `Disjoint` + `IsCompl`; zero of the generator excluded | no change |
| `hadamardPerronBox`, `hadamardPerronGraph`, `IsHadamardPerronFamily`, `exists_isHadamardPerronFamily` | finite-dim inner product space | K = ⊥ (graph {0}; (ii),(iii) empty; `φ n 0 = 0` gives uniqueness); K = ⊤; linear maps (φ = 0); z = 0 in (iii): hypothesis ‖z‖ < C·0 false; (i): image covers the r₀-ball since the K-part expands by μ − (1+γ)δ > 1 and \|y′\| ≤ γ\|x′\| < r₀; (ii) strict since √(1+γ²) < 1 + γ; (iv) needs δ(1+γ)² ≤ γ(μ − ρ); uniqueness from (i),(ii) of φ′ and (iii) of φ with C = 2; indices f_{n−L}(z_L) = z_{L−1} against (i) | true; equals README |
| `IsLocallyMaximal`, `IsFlowLocallyMaximal` | topological | sink; −Id with Λ = {(1,0)} (vacuous); three-copy example | no change |
| `hasHyperbolicLocalProductStructure_of_isLocallyMaximal`, `hasFlowHyperbolicLocalProductStructure_of_isFlowLocallyMaximal` | σ-compact M, `hd` | Λ empty: vacuous; hyperbolic fixed point / periodic orbit: singletons; {c, d} in two components: truncated distance 1 | true |
| `IsBasicSet`, `IsFlowBasicSet`, `IsFlowAttractor` | manifold | empty set excluded; two fixed points: not transitive; attracting circle: U = {\|r\| < 1/4} works, {\|r\| < 1/2} has intersection U | no change |
| `existsUnique_isEquilibriumState_of_isBasicSet` | compact M (R03) | fixed point; cat map with φ = 0 and φ = −log((3+√5)/2); coboundary clause from supplier §8.2 | true |
| `existsUnique_isFlowEquilibriumState_of_isFlowBasicSet` | compact M (R03) | periodic orbit of period p: P = (1/p)∫F; time-t clause: free energy t-fold, P_{g^t}(F_t) = tP by averaging over [0, t]; period-1 orbit shows the clause needs flow-invariant ν′ (present); rescaling: ∫₀¹ aF(g^{as}x) ds = F_a | true |
| `pos_coverEntropy_of_isFlowBasicSet`, `pos_coverEntropy_of_isBasicSet` | compact M (R03) | periodic orbit (first disjunct); fixed point (`Λ.Finite`); cat map 0.9624 > 0 | true |
| `toralEndomorphism`, `isEquilibriumState_toralEndomorphism_zero_iff` | none | d = 0: charpoly 1, no roots, torus a point, ν = volume; d = 1: A = ±1 excluded by `‖z‖ ≠ 1`; shear excluded; cat map: Haar, uniqueness is this roadmap's (supplier line 2157 gives only "a measure of maximal entropy") | true; not a duplicate |
| `flowUnstableSubspace`, `unstableJacobian`, `geometricPotential` | manifold, metric | on a hyperbolic set the span is E^u (X-component bounded below, E^s-component grows); E^u = 0: empty Gram determinants 1/1, λ_t = 1, φ^u = 0; cat suspension: λ_t = e^{at}, φ^u = −a; without the square root −2a and P = −a < 0 | no change |
| `srb_of_isFlowAttractor`, `srb_of_isFlowBasicSet_univ` | compact M, smooth metric | attracting circle: basin {r ≠ 1/2}, a.e. point generic for the time measure; cat suspension: μ⁺ = volume for the metric ds² + e^{2as}du² + e^{−2as}dv², density e^{3u(s)} after a conformal change; absolutely continuous clause from genericity plus Birkhoff | true |

README targets (the 45 numbered sections §§1.1–1.3, 2.1–2.2, 3.1, 4.1, 5.1–5.3, 6.1–6.8, 7.1–7.7,
8.1–8.7, 9.1–9.3, 10.1–10.4, 11.1–11.6, each with a "Prove", "Define" or "Construct"). Values
recomputed, by section: 1.1 doubling map half-widths 1/8, 1/16; shift point y: d = 2^{−k−1}, 1 at time −1. 1.2
covers 2^{n+2}. 4.1 values 2h + c against 2h + 2c; 2 log 2 + 1 against 2 log 2 + 2. 5.1 constant
Ke^{T₀(\|P\|+max\|φ\|)} suffices (README has the weaker 2T₀). 6.3 gluing range; at m = 2, M = k + 2 and 2k + 8 ≥ 2k while k + 4 < 2k
from k = 5. 6.5 half-width ℓ = 0.10004, ratio 1.1010; cat-suspension
numbers: n·e_v = −0.0293, \|y\| = 0.0474, A^{k/2}y = (0.724, 0.447), minimum 0.428. 7.3 K₁K₂ = 2.618.
7.6 operator norm 0.566. 8.2 corner: \|v\| = \|Bv\|, \|B²v\|/\|v\| = 0.7646, determinant 0.6614.
8.5 bound 0.905 < 1; A(4/5, 3/5) ≡ (1/5, 2/5), distance 0.447. 8.3 e^{3a} = 17.94. 8.7 θ = 1/2. 9.1 E^u = span(1, 0.618). 9.2 return time c + (R − c) = R.
11.1 Sol pull-back factor a²; φ′^u = −a − 0.2π cos(2πs). 11.3 ratio 0.99504. 11.5 distance 2.196δ.
11.6 √5 ε. All agree with the README.

Elaborated signatures: the 51 entries of the worker's `signatures.md` were compared with the README
statements (one entry, `of`, is an artefact of the docstring text at line 29, not a declaration). The
nine flagged binders are `[MeasurableSpace X]` on seven definitions that do not use it,
`[FiniteDimensional ℝ V]` on `hadamardPerronGraph` and `[FiniteDimensional ℝ E]` on
`flowUnstableSubspace`; none is needed by the definition's meaning, and nothing changed. No file was
edited by this pass, so no new `#check` run was made.

Dependency check (unchanged tree):

    depcheck: 244 roadmaps, 2273 edges, 0 problem(s)

## Verified sound

- Declarations read: 50 of 50. Targets read: 45 sections, every line of the README.
- Checks tested: 188 Check bullets read; each one with a number, a formula or a named object was
  recomputed (values in the record above), the others tested by argument; none false, none vacuous.
  Every definition has at least three.
- Sibling citations checked at the cited head or on main: ClassicalErgodicTheory (Conventions,
  §§0.3, 1.4, 3.4, 5.1–5.5, 6.1–6.2, 6.4, 7.1–7.3, 8.1–8.2, 8.4–8.5; `HasSpecification`,
  `HasFlowSpecification`, `IsExpansive`, `IsTopologicallyMixing`, `IsGibbsMeasure`,
  `IsMeasureOfMaximalEntropy`, `toralEndomorphism`, `measureEntropy_toralEndomorphism` found, and the
  eleven restated definitions agree with its Lean); GeometryOfNumbersAndQuadraticArithmetic §4.2 (the
  four entropy names, in the "Entropy and Haar measure on leaves" paragraph);
  ArithmeticDynamics §2.7; ProbabilisticAndMetricNumberTheory §4.1 (`birkhoff_pointwise`,
  `birkhoff_pointwise_ergodic`); GeometricCurrents G6 (Grassmann bundle, compact over compact
  regions); GeneralizedCohomology G4.0b; RiemannianGeometry R2 (`exists_jacobi_initial_data`), R4.1
  (`rauch_norm_ge_of_sectional_le`); OperatorAlgebraDynamics D9; HeegaardFloer §1.0a (M.0a);
  GeometricTopology and TaubesGromov exist on main. 12 roadmaps, 0 unresolved.
- GeneralizedCohomology G4.0b: the overlap list says only an open revision defines it. It is on main
  (`TauCetiRoadmap/GeneralizedCohomology/README.md` lines 939 and 1140–1151, "Own the smooth
  graph-chart upgrades on … finite real/complex Grassmannian carriers, of real dimensions r(N−r)"),
  so the citation stands without that revision.
- Pinned declarations confirmed by grep at the pins: 23 Mathlib names and 49 Tau Ceti names of the
  supplier contracts, all present in the files the README names; the worker's resolver reports no
  other backticked name missing (among those confirmed:
  `ContMDiff.iff_comp_isImmersion` at `Mathlib/Geometry/Manifold/Immersion.lean:995`,
  `Homeomorph.flow` and `Flow.restrictNonneg` in `Mathlib/Dynamics/Flow.lean`,
  `Submodule.orthogonalProjectionOnto`, `ExpGrowth.expGrowthSup`,
  `TauCeti.isSmoothEmbedding_coe_sphereBundle`, `ContMDiffMap.weakWhitneyTopology`).
- Ownership by object: unique equilibrium states under specification with periodic shadowing are
  ClassicalErgodicTheory §§8.4–8.5; this roadmap's weak-specification theorems, hyperbolic sets,
  invariant manifolds, basic sets and SRB measures have no other owner among the roadmaps on main
  and the open heads (`roadmaps grep` for "hyperbolic set", "Anosov", "Hadamard–Perron", "weak
  specification", "SRB" and six of this file's declaration names). The only hits are
  ClassicalErgodicTheory, which puts uniformly hyperbolic dynamics outside its scope and names such
  a roadmap as the consumer of its §§8.4–8.6, and the cat-matrix examples of GeometricTopology and
  TaubesGromov. No declaration of `Suggested.lean` has the fully qualified name of a
  declaration of a readable roadmap (the restated ones live in this roadmap's namespace).
- Locators read against the cached texts: 75 (ClimenhagaThompson2016 20, BowenRuelle1975 26,
  BowenPeriodicPoints1971 8, BowenEntropyExpansive1972 5, ClimenhagaPesin2016 4,
  BowenGroupEndomorphisms1971 2, TsujiiZhang2023 4, BCS2022 3, Buzzi2014 1, Misiurewicz1976 1,
  Smale1967 1); one does not support its claim (R02). Not read: ClimenhagaThompson2016 lines 170–175;
  BowenRuelle1975 lines 60–61, 77–78, 119–133, 441, 655–676, 729–808 and the body of 426–469;
  BowenPeriodicPoints1971 lines 105–200.
- Policy: the pull request changes only the package folder (10 files); no pull-request number,
  process word, `lemma`, `set_option`, `#eval`, sorry'd data or `True` placeholder; every Lean name is
  backticked in the README; imports are `Mathlib` and one existing Tau Ceti module.
- Declared gap `gap:connection-map-jacobi-derivative`: one supplier, one precise sentence, same slug
  in `design/plan.json` and README line 126; not provided by RiemannianGeometry on main or by the
  pinned Jacobi files.
- Padding probe: no declaration follows by one tactic or one library lemma, restates a definition as
  a theorem, or computes a value; the restated supplier definitions are needed by the headlines.

Source independence: 19 passages compared with 5 sources (ClimenhagaThompson2016 lines 140–147,
295–303, 504–509, 1661–1669, 1717–1724; BowenRuelle1975 lines 10–34, 96–108, 272–277, 346–358,
377–407, 421–425, 681–683; ClimenhagaPesin2016 lines 1822–1840; BowenPeriodicPoints1971 lines 66–83,
96–104, 421–426; BowenEntropyExpansive1972 lines 55–56, 117–121, 192–193),
none shared beyond formulas and the short clause of R05; largest share BowenRuelle1975, 46 of 137
source citations; contents compared with BowenRuelle1975 (1 Introduction, 2 Symbolic Dynamics, 3 Equilibrium
States, 4 Attractors, 5 Main Results, Appendix): independent. The roadmap has no counterpart of its
Section 2, proves its Section 3 by another route (Layers 1–6), and only §§11.1, 11.4, 11.5, 11.6
follow the order 4.1, 4.2–4.3, 4.4, 5.1, an order the *Needs:* lines force (11.4 needs 11.1 and
11.3; 11.5 needs 11.4; 11.6 needs 11.5), with the Appendix material placed before it as §§11.2–11.3.
No table, figure or list of examples is taken over.

## Not verifiable

- Walters1982, Bowen1975, FH2019, KatokHasselblatt1995, Newhouse1989, BowenWalters1972,
  HirschPalisPughShub1970: recorded as uncertified; their locators were not read against the text.
  KatokHasselblatt1995's section numbers (6.2, 6.4, 18.1, 18.4, 19.1, Chapter 17) agree with that
  book's contents as recalled, not as read.
- R01, repair 1: whether the proposed statement elaborates under the defaults (no Lean was run).
- GeneralizedCohomology G4.0b names "TopK T1.5's existing finite real … Grassmannian carriers";
  README line 120 says the structure is on `TauCeti.finiteGrassmannian`. That the two carriers are
  the same type was not checked.
- The supplier ClassicalErgodicTheory was read at the head of its open pull request; it is a draft
  and may change before it merges.

## Source issues

- **Gap** in ClimenhagaPesin2016 at Theorem 11.1, printed page 40: the source says the family of graphs is unique without asking that they pass through the origin; it should require φ_n(0) = 0, since for k = 0 and identity maps every constant family qualifies; affects a stated result.
- **Misprint** in ClimenhagaPesin2016 at §11.1 and Theorem 11.1, printed page 40: the source says the maps f_n are given for n ≤ 0 while the family and clause (i) run over all integers; it should give f_n for every integer n; affects a stated result.
- **Misprint** in ClimenhagaPesin2016 at Theorem 11.1, printed page 40: the source says the graphs are taken over all of ℝ^k and clause (i) intersects with a set Ω_(n+1) never defined; it should be the ball B^u(r₀) and the box Ω; affects nothing.
- **Gap** in ClimenhagaPesin2016 at Theorem 11.1(iii), printed page 40: the source says the clause through inverses of the maps f_n, which are not assumed invertible; it should speak of backward sequences of preimages inside the box; affects a stated result.

## For the human reviewers

- **Scope.** ClassicalErgodicTheory, the supplier of Layers 1–6 and 10, is an open draft pull request by another author and is not in `merge-order/ORDER.txt`; the dependency check reports 0 problems.
- **Licence.** None observed: no source is unpublished, and no declaration matches a public formalisation (`library-matches.md`, 0 same-name hits).
- **Not tested.** `design/plan.json` still lists `sphere-bundle-embedding` (supplier TangentialBordism §2.3), which README §9.3 no longer uses (Mathlib's `ContMDiff.iff_comp_isImmersion` supplies it); earlier repair reports left it because the plan cannot be edited at this stage.
- **Not tested.** FH2019 and KatokHasselblatt1995 carry 25 of 137 source citations and were cited without their text (uncertified).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1b6ac448fc61a4f2c2ae317ccd70b1943fe912a9", "job": "RT-HyperbolicDynamicsAndThermodynamicFormalism~1b", "model": "fable", "worker": "chris-x55"} -->
