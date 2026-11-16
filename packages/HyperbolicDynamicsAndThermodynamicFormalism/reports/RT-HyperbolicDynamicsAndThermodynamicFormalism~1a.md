<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17485#issuecomment-6907177213 -->
Red team round 1 pass a (claude) of 1b6ac44

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) §9.3: the decay of stable Jacobi fields is credited to a supplier statement that does not give it

   **Location.** `packages/HyperbolicDynamicsAndThermodynamicFormalism/README.md:798`: "…and converge by
   comparison with the model of curvature −a² (RiemannianGeometry R4.1), and the comparison with the
   model sinh(at)/a gives |J(t)| ≤ e^(−at)|J(0)| for stable … fields."

   **Claim.** RiemannianGeometry R4.1 supplies the upper bound |J(t)| ≤ e^(−at)|J(0)| for the stable
   field (the limit of the fields J_T with J_T(0) = w, J_T(T) = 0).

   **Witness.** `TauCetiRoadmap/RiemannianGeometry/README.md:2275–2281` (and this README's own contract,
   line 124): `rauch_norm_ge_of_sectional_le` needs J(0) = 0 and gives the *lower* bound
   s_κ(t)|D_tJ(0)| ≤ |J(t)|. Instance: curvature −4, a = 1, J_T(t) = w·sinh(2(T−t))/sinh(2T). Applied
   from the zero at T, R4.1 gives |J_T(t)| ≥ sinh(T−t)·|D_tJ_T(T)|, no upper bound; with the reversed
   bound for K ≥ −b² one only gets |J_T(t)| ≤ (a/b)·sinh(b(T−t))/sinh(aT)·|w|, which is unbounded in T
   when b > a. R4.1 does give the convergence of the J_T once the upper bound |J_T'(T)| ≤ |w| (for T' > T, the
   value at T of the field J_T' vanishing at T') is known, so only the upper bound is unowned.

   **Repair.** In §9.3 replace "and converge by comparison with the model of curvature −a²
   (RiemannianGeometry R4.1), and the comparison with the model sinh(at)/a gives |J(t)| ≤ e^(−at)|J(0)|
   for stable and the reverse growth for unstable fields" by:

   > "For a Jacobi field J perpendicular to a unit-speed geodesic with K ≤ −a², the function f = |J|
   > satisfies f'' ≥ a²f wherever J ≠ 0: (f²)'' = 2|D_tJ|² − 2⟨R(J, γ')γ', J⟩ ≥ 2|D_tJ|² + 2a²f² and
   > f' = ⟨D_tJ, J⟩/f ≤ |D_tJ|. This convexity estimate is part of this target; it uses only
   > `TauCeti.Manifold.IsJacobiFieldOn` and `CovariantDerivative.sectionalCurvature`. Since J_T has no
   > zero on [0, T) (no conjugate points), the maximum principle against the solution
   > |w|·sinh(a(T−t))/sinh(aT) of g'' = a²g with the same end values gives
   > |J_T(t)| ≤ |w|·sinh(a(T−t))/sinh(aT) on [0, T]. For T' > T the difference J_T − J_T' vanishes at 0
   > and has norm |J_T'(T)| ≤ |w| at T, so RiemannianGeometry R4.1 gives
   > |D_t(J_T − J_T')(0)| ≤ a|w|/sinh(aT) → 0: the J_T converge, and the limit satisfies
   > |J(t)| ≤ e^(−at)|J(0)|; unstable fields are the stable fields of the reversed geodesic."

   Tested on the instance: for K = −4, a = 1, |J_T(t)| = |w|·sinh(2(T−t))/sinh(2T) ≤ |w|·sinh(T−t)/sinh(T),
   and for K = −1 the bound is an equality. Add to the `*Needs:*` line of §9.3 nothing new (both
   declarations are already listed); keep "RiemannianGeometry R4.1 (Rauch comparison)" for the
   convergence step.

2. **F02** (P3) `Suggested.lean` docstring names §9.3 as an unstated headline but is silent on §§9.1–9.2, one of which is statable at the pins

   **Location.** `packages/HyperbolicDynamicsAndThermodynamicFormalism/Suggested.lean:21–36`: "Headline
   theorems of the README that are not stated here, with what each lacks at the pins: … the Anosov
   property of the geodesic flow … (README §9.3)".

   **Claim.** The list is complete: every Layer 9 theorem of the same kind is either stated or named.

   **Witness.** §9.2(a) (README line 783) uses only carriers that exist: `TauCeti.SmoothMappingTorus.flow`
   is a `Flow ℝ (SmoothMappingTorus φ)` (`TauCeti/Geometry/Manifold/Instances/MappingTorus.lean:395`),
   and `IsHyperbolicSet`, `IsFlowHyperbolicSet` are in the file. §9.1's Anosov property of f_A is
   neither stated nor named either.

   **Repair.** Whether the Layer 9 Anosov theorems are headlines is the author's decision; make the
   docstring say which. Either (a) drop the §9.3 bullet's claim to be exhaustive by adding one bullet:

   > "* the Anosov property of hyperbolic toral automorphisms and of suspension flows (README §§9.1–9.2):
   >   examples, not end theorems; §9.1 lacks at the pins a `Diffeomorph` of `UnitAddTorus (Fin n)`
   >   induced by an integer matrix and a Riemannian-bundle instance on its tangent bundle, and §9.2
   >   is stated for the pinned mapping torus only in the README;"

   or (b) state §9.2(a) in the Layer 9 position, for every continuous Riemannian bundle structure on
   the tangent bundle of the mapping torus (§7.3 makes the choice immaterial): hypotheses
   `φ : N ≃ₘ^∞⟮I, I⟯ N`, `[CompactSpace N] [Nonempty N]`, `IsHyperbolicSet I φ' univ` for the C¹
   diffeomorphism φ' underlying φ; conclusion
   `IsFlowHyperbolicSet (𝓘(ℝ).prod I) (TauCeti.SmoothMappingTorus.flow φ) univ`. I did not elaborate
   (b); if the coercion of φ to class C¹ needs an ad hoc encoding, take (a).

3. **F03** (P3) §8.4 API: "f-invariant subset" is false in the forward-invariant reading, by the section's own first Check

   **Location.** `packages/HyperbolicDynamicsAndThermodynamicFormalism/README.md:675`: "Λ is locally
   maximal with isolating neighbourhood U iff every f-invariant subset of U is contained in Λ, the
   orbit of a point being invariant."

   **Claim.** The equivalence holds for "f-invariant" subsets; the README defines invariance of a set
   under a diffeomorphism nowhere (hyperbolic sets are introduced with f(Λ) = Λ, flows with Mathlib's
   `IsInvariant`).

   **Witness.** Line 681, the hyperbolic sink {p} with U a small ball and f(U) ⊆ U: S = U satisfies
   f(S) ⊆ S and S ⊆ U, but S ⊄ Λ = {p}, although Λ is locally maximal with this U. With f(S) = S the
   item is true (U ⊋ f(U) there).

   **Repair.** Replace the item by: "Λ is locally maximal with isolating neighbourhood U iff every
   subset S ⊆ U with f(S) = S is contained in Λ; the full orbit of a point is such a set." Tested on
   the sink: the only S ⊆ U with f(S) = S is {p} (and ∅), since ⋂ fⁿ(U) = {p}. §8.5's flow item needs
   no change: invariance under every g^t, t ∈ ℝ, already forces g^t(S) = S.

Three findings: one unowned step in a proof plan (R01), one inconsistency between the module
docstring and Layer 9 (R02), one ambiguous API item that its own Check refutes under the other
reading (R03). Everything else that was computed, resolved or opened is recorded under
`## Verified sound`.

## The adversarial pass: computed values

One row per statement; "L" marks a `Suggested.lean` declaration (context given), "R" a README target.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| R Conventions, shift metric; §1.2, §5.2 Checks | full 2-shift, ε = 1/2, 1/4, 1 | {d < 1/2} = agree on −1, 0, 1; B_n(x, 1/2) fixes −1..n, mass 2^(−n−2), × 2^n = 1/4; covers at {d ≤ 1/4}: 2^(n+2); B_n(x, 1) mass 2⁻ⁿ | agree |
| R §1.1 Bowen balls | doubling map; n = 0; rotation flow t = 1 | half-width 2^(−n−2): 1/8 at n = 1, 1/16 at n = 2; B_0 = X; converse containment fails at n = 0 only | agree |
| R §1.1 Γ_ε formula | y with single 1 at −1 | d(T^k0, T^ky) = 2^(−k−1); d(T⁻¹0, T⁻¹y) = 1; T¹(B̄_3(T⁻¹0)) excludes y | agree; the source's formula is misprinted (Source issues) |
| R §2.2 / L `HasWeakSpecification`, `HasFlowWeakSpecification` (pseudometric X) | k = 0; empty X; swap; one point; τ < 0 for flows | Lean start time Σ_(l<j)(n_l + g_l) = README's N_(j−1) + τ_(j−1); empty X: no y; swap: (a,1),(a,1) needs 1+τ even, (a,1),(b,1) odd; τ < 0 forces k = 0 | agree |
| R §2.2 comparison with `HasSpecification` | s_j = Σn + (j−1)M, p = s_k + n_k + M | b_j + M = s_(j+1) exactly; b_k − a_1 + M = p; one-point space M = 0 | agree with the supplier's Lean (`a i ≤ b i`, `b i + M ≤ a j`) |
| L `upperSemicontinuousOn_measureEntropy_of_isExpansiveFlow` (compact metric, Borel; no Nonempty) | empty X; period-1 orbit; roof-1 suspension | vacuous; all entropies 0; hμ = log 2 with trivial partition rate 0 | true as typed |
| R §4.1 | F = c; g(2t); roof-1 suspension F = 1 | ∫₀¹ aF(g^(as)x) ds = F_a; 2h + c vs 2h + 2c; 2 log 2 + 1 vs 2 log 2 + 2 | agree |
| R §5.1 / L `HasLowerGibbsProperty` | t ≤ T₀; sign; scale above diameter | exponent changes by ≤ T₀(‖P‖ + max‖φ‖) (the stated factor 2 is not sharp, not false); wrong sign gives 4^(−t); product 2^t at large scale | agree |
| L `existsUnique_isEquilibriumState_of_hasWeakSpecification` (nonempty compact metric) | one point; swap; two disjoint shifts | P = φ(pt), product 1; swap ergodic not mixing; hypothesis fails for the union | true as typed; hypothesis `hexp` is the supplier's verbatim |
| L `existsUnique_isFlowEquilibriumState_of_hasFlowWeakSpecification` | one point (fixed point allowed); periodic orbit | t·P − ∫F = 0, ν(B) = 1 ≥ K⁻¹; arc measure 2s_ε/p | true as typed |
| L `HasHyperbolicLocalProductStructure` | 2-shift; finite set; rotation; monotone shift | c = 1, ρ = 1/2, e(1/2) = 1; singletons; (A3) fails; monotone shift satisfies it, forward transitivity fails (T^n{x₀=1} ⊆ {x₀=1}) | agree |
| L `HasFlowHyperbolicLocalProductStructure` | periodic orbit δ = 0.6 vs δ₀ = 1/4; irrational linear flow; one point | v = 0.45 and −0.55 both in [−0.6, 0.6]; (F3) vacuous, (F2) fails; one point excluded by the no-fixed-point clause | agree |
| R §6.6 expansivity from (F2), (F3) | reparametrised pair | bracket of (g^t x, g^(s(t)) y) moves along one orbit, v_t = v₀ + s(t) − t, so ‖s(t) − t‖ ≤ 2δ; (F3) in both time directions gives y = g^(v₀)x | re-derived; no source states it at this generality (Not verifiable) |
| R §6.5 Fibonacci Check | k = 6, n = (13, 8) | n·e_v = −φ⁻⁶/√(1+φ²) = −0.0293; ‖y‖ = φ⁻⁵/1.902 = 0.0474; A³y = (0.7236, 0.4472) ≡ (−0.2764, 0.4472), distance 0.5257 | agree |
| L 6.8(a), 6.8(b) (nonempty compact metric) | one point; swap; one point for (b) | Finite X; h = 0; (b) vacuous | true as typed |
| L `IsHyperbolicSet`, `IsFlowHyperbolicSet`, `flowGenerator` | diag(2, 1/2); identity; circle flow; Λ = ∅; non-C¹ flow | E^s second axis, C = 1, ρ = 1/2; identity forces E = 0; circle: E^s = E^u = ⊥, span X = ⊤; ∅ vacuous; the predicate does not ask the flow to be C¹, every theorem using it carries `hϕ` | agree |
| R §7.3, §7.6, §8.2 numeric Checks | Gram (2 1; 1 1); Jordan block; corner vector | K₁K₂ = (3+√5)/2 = 2.618; 2ⁿ‖Jⁿe₂‖ = (4n²+1)^(1/2), norm 0.566; ‖v‖² = ‖Bv‖² = 12 − 4√7, ‖B²v‖/‖v‖ = 0.7646 | agree |
| L `IsHadamardPerronFamily`, `exists_isHadamardPerronFamily` | K = ⊥; K = ⊤; z = 0; linear diag(2, 1/2); f = (2x, 0); ρ ≥ 1 | K = ⊥: graph {0}, (ii) empty, (iii) vacuous because ν > ρ' > ρ + δ; K = ⊤: image of the ball contains radius (μ−δ)r₀ > r₀; z = 0 excluded by ‖z‖ < C‖z‖; cone step needs γ(μ−ρ) ≥ (1+γ)²δ, implied by max(1, ρ') < μ'; image stays in the box since ‖y'‖ ≤ γ‖x'‖ < r₀ | true as typed; uniqueness re-derived from (i)–(iii) |
| L `IsLocallyMaximal`, `IsFlowLocallyMaximal` | sink; f = −Id; cat suspension | integer vector of length < (5+√5)/8 = 0.905; c = (4/5, 3/5), Ac ≡ (1/5, 2/5), distance 0.447 | agree (R03 for the API wording) |
| L `hasHyperbolicLocalProductStructure_of_isLocallyMaximal`, flow version (σ-compact, not compact) | Λ = ∅; periodic orbit; three-copy example | vacuous; singletons; truncated distance 1 between copies | true as typed |
| L `IsBasicSet`, `IsFlowBasicSet`, `IsFlowAttractor` | ∅; two fixed points; attracting circle; Anosov Λ = univ | ∅ excluded; not transitive; U = {‖r‖ < 1/4}: ⋂ g^t(U) = {r = 0}, U = {‖r‖ < 1/2}: intersection is U; `ϕ t '' univ = univ` | agree |
| L `existsUnique_isEquilibriumState_of_isBasicSet`, `…_of_isFlowBasicSet` | fixed point; periodic orbit; cat map φ = −log λ | point mass; C_ε = (2s_ε/p)e^(−2p max‖F‖); pressure 0 | true as typed; all five clauses of the flow theorem match §§4.1, 10.3 |
| L `pos_coverEntropy_of_isFlowBasicSet`, `pos_coverEntropy_of_isBasicSet` (no `hd`) | periodic orbit; fixed point | left disjunct; entropy depends only on the unique uniformity of the compact Λ | true as typed |
| L `toralEndomorphism`, `isEquilibriumState_toralEndomorphism_zero_iff` | d = 0; cat matrix; shear | d = 0: det = 1, charpoly 1, one-point torus, ν = volume; eigenvalues 2.618, 0.382, h = 0.9624; shear excluded by `hhyp` | true as typed |
| L `flowUnstableSubspace`, `unstableJacobian`, `geometricPotential` | E^u = 0; cat suspension metric; without square root | 0 × 0 Gram determinant 1, λ_t = 1, φ^u = 0; λ_t = e^(at), φ^u = −a = −0.9624; −2a would give P = −a | agree |
| R §11.1–11.6 Checks | conformal factor; line in ℝP²; b = 0.1; covering radii | φ'^u = −a − 0.2π cos(2πs); (b, c) ↦ (be^(−2aT), ce^(−aT)); (1.01)^(−1/2) = 0.99504 < e^(−0.001); (1.95² + 1.01²)^(1/2) = 2.196 > 2.01; √5 ε > 2ε | agree |
| L `srb_of_isFlowAttractor`, `srb_of_isFlowBasicSet_univ` | attracting circle; Anosov | E^u = 0: φ^u = 0, μ⁺ the orbit measure, basin {r ≠ 1/2} of full volume; `LindelofSpace` for the volume comes from `CompactSpace` | true as typed |
| R §9.3 | K = −1; K = −4 with a = 1 | J = e^(∓t)E, Sasaki rate 1; R4.1 gives only a lower bound | R01 |

## Verified sound

- **Declarations read:** 51 (35 `def`, 16 `theorem`), every line of `Suggested.lean`. No Lean was
  run in this pass; the elaborated types in the job's signature listing were compared one by one
  with the README statements. The nine "dropped binder" leads are all definitions that do not use
  the binder (`[MeasurableSpace X]` in the entropy and net-sum definitions, `[FiniteDimensional]` in
  `hadamardPerronGraph` and `flowUnstableSubspace`); every theorem keeps `CompactSpace`, `Nonempty`,
  `BorelSpace`, `SigmaCompactSpace`, `IsManifold I ∞ M`, `I.Boundaryless` and
  `IsContMDiffRiemannianBundle` where the README asks for them. Nothing changed.
- **Restated supplier definitions:** the 4 entropy notions and 11 of the 12 restated notions of
  ClassicalErgodicTheory have the same bodies as in that roadmap's `Suggested.lean` at its open head
  (`flowInvariantProbabilities` is its definition at the time monoid ℝ); the twelfth,
  `IsGibbsMeasure`, is prose-only there (§8.4) and the body here matches that prose (open balls,
  n ≥ 1, real pressure). The namespace differs, so no fully qualified name is shared.
- **Padding:** none found. No declaration follows by one tactic or one library lemma; the two
  positive-entropy theorems carry no distance hypothesis and are not instances of §6.8(a).
- **Targets read:** all 45 numbered sections of the README, every line.
- **Locators verified:** every line locator into the 11 cached texts (about 100: BowenRuelle1975,
  ClimenhagaThompson2016, BowenPeriodicPoints1971, BowenEntropyExpansive1972, ClimenhagaPesin2016,
  BowenGroupEndomorphisms1971, Smale1967, Buzzi2014, Misiurewicz1976, TsujiiZhang2023, BCS2022); all
  point at the cited statement. The README does not reproduce the two source slips listed below.
- **Checks tested:** about 70 recomputed (values in the table); none false, none vacuous; every
  definition has at least three.
- **Sibling citations checked (all resolve at main or at the open head):** ClassicalErgodicTheory
  Conventions, §§0.3, 1.4, 3.4, 5.1–5.5, 6.1–6.2, 6.4, 7.1–7.3, 8.1–8.2, 8.4–8.5 and 14 declaration
  names; GeometryOfNumbersAndQuadraticArithmetic §4.2 (paragraph and 4 names);
  ProbabilisticAndMetricNumberTheory §4.1 (2 names); ArithmeticDynamics §2.7 and §§2.67–2.92;
  GeometricCurrents G6; GeneralizedCohomology G4.0b (on main at line 1082: the overlap tool's lead
  that only an open revision defines it is wrong); RiemannianGeometry R2 (§2.1) and R4.1 (2 names);
  HeegaardFloer §1.0a (M.0a); OperatorAlgebraDynamics D9.
- **Pinned declarations checked:** 48 Mathlib and 45 Tau Ceti names of the supplier contracts, each
  at its stated file; `ContMDiff.iff_comp_isImmersion` is at `Mathlib/Geometry/Manifold/Immersion.lean:995`,
  `TauCeti.riemannianVolume` needs `LindelofSpace`, which the SRB section has through compactness.
- **Ownership:** a search of every roadmap on main and at the open heads for hyperbolic sets, Anosov
  systems, local product structure, Hadamard–Perron, entropy-expansive maps, SRB and Bowen–Margulis
  measures finds no second owner; ClassicalErgodicTheory's scope paragraph excludes uniformly
  hyperbolic dynamics and names a roadmap such as this one as its consumer.
- **Policy:** the pull request changes only the package folder; no process words, pull-request
  numbers, `lemma`, `set_option`, `#eval` or machine paths in the README or the Lean file.
- **Gaps:** `gap:connection-map-jacobi-derivative` is precise, minimal and declared in both places.
  `sphere-bundle-embedding` remains in `design/plan.json` only; the repair reports settled it (the
  plan is frozen, the README no longer uses it) and it is not raised.
- **Dependency check:** `depcheck: 244 roadmaps, 2273 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- **Observation outside this package (not a finding here).** ClassicalErgodicTheory §5.5 asks to
  prove that, on a compact metric space without isolated points, transitivity of the ℝ-action is
  equivalent to a dense forward orbit. The roof-one suspension of the monotone shift (this README,
  §6.6, fifth Check) is such a space with a dense two-sided orbit and no dense forward orbit: for a
  flow a point is approached by its own orbit at small times, so the argument for ℤ-actions does not
  transfer. This roadmap does not consume that statement and says so (README line 92).

Source independence: 12 passages compared with 6 sources (definitions of §§2.2, 6.1, 7.2, 10.1, the
statements of §§3.1, 5.2, 8.1, 11.4, 11.6, the proof plans of §§11.5–11.6 and two docstrings), none
shared beyond formulas and hypothesis lists; largest share BowenRuelle1975, 48 of 156 source
mentions; contents compared with BowenRuelle1975 (Sections 1–5 and Appendix): independent — Layers
1–9 have no counterpart there, the source's Section 2 (symbolic dynamics) is not used, and Layer 11
interleaves its Section 4 with its Appendix as the *Needs:* lines of §§11.2–11.4 force.

## Not verifiable

- KatokHasselblatt1995, FH2019, Bowen1975, Walters1982, BowenWalters1972, Newhouse1989,
  HirschPalisPughShub1970: uncertified, cited by locator only; 40 mentions were not opened. FH2019
  is cited throughout as "Part II" without a section.
- §§6.5–6.7: the flow axioms (F2), (F3) are this roadmap's own, and expansivity, closing, density of
  periodic orbits and weak specification from them are stated in no source I could open at this
  generality. I re-derived expansivity (table) and found no counterexample among the periodic
  orbit, the suspensions and the linear flow; closing and specification rest on the bracket
  iteration, which I did not carry out in full.
- The Lean file was not elaborated in this pass (read-only, no builds); statement (b) of R02 is
  untested.
- `hd : edist x y = min 1 (riemannianEDist I x y)` for a merely continuous Riemannian metric: I did
  not check at the pin that such a metric space structure exists on every manifold of the
  Conventions; it is a hypothesis, so no statement depends on it.

## Source issues

- **Misprint** in ClimenhagaThompson2016 at Section 2.5, the sentence after (2.12), printed page 8: the source says the two-sided set is the intersection over real t of the time-t image of the closed Bowen ball of order 2t centred at x; it should be centred at the time −t image of x, with t ≥ 0; affects nothing.
- **Misprint** in ClimenhagaPesin2016 at Section 11.1 and Theorem 11.1, printed page 40: the source says the maps are given for n ≤ 0 while the invariant family is indexed by all integers; it should index the family by n ≤ 1 or give maps for every integer; affects a stated result.

## For the human reviewers

- **Not tested.** Seven uncertified texts carry 40 of the 156 source mentions (KatokHasselblatt1995 17, FH2019 10); wording and arrangement were not compared with them. `packages/HyperbolicDynamicsAndThermodynamicFormalism/sources.toml`.
- **Scope.** The flow axioms (F2), (F3) of README §6.5 and the theorems of §§6.6–6.8(b) derived from them are stated in no cited refereed source in this abstract form; README line 439 says so.
- **Declared gap.** `design/plan.json` still declares the gap `sphere-bundle-embedding` (supplier TangentialBordism §2.3), which the README no longer uses; the frozen plan and the README disagree on what the intake announces.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1b6ac448fc61a4f2c2ae317ccd70b1943fe912a9", "job": "RT-HyperbolicDynamicsAndThermodynamicFormalism~1a", "model": "fable", "worker": "chris-x80"} -->
