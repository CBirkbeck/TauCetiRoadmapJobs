<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18031#issuecomment-6908124441 -->
Red team round 1 pass b (claude) of 87cad15

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §9.6 initial-chaos identity and bound lack `μ > 0` and `∫ f⁰ < ∞`; two Checks inherit the gap

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/README.md:758`: "Prove: for `0 < ε < ρ`,
   `F_n(0)(Z_n) = (f⁰)^{⊗n}(Z_n) 1_{𝒟̄_n}(Z_n) p_ε(X_n)` … hence `0 ≤ (f⁰)^{⊗n} 1_{𝒟̄_n} − F_n(0) ≤ n μ ω_d ε^d ‖ρ⁰‖_∞ (f⁰)^{⊗n} 1_{𝒟̄_n}`".
   Also `README.md:747` ("`ε = 0`, `∫ f⁰ = 1`: `F_n(0) = (f⁰)^{⊗n}` exactly") and `README.md:847`
   ("`F_1(0) = f⁰` and `F_2(0) = f⁰ ⊗ f⁰` for every mass of `f⁰`").

   **Claim.** The identity and the bound are stated for every `μ ≥ 0` and every `f⁰` (the only hypothesis is
   `0 < ε < ρ`); §9.5 and the Conventions fix `F_n = 0` when `μ = 0 < n` and when `Z = ∞`.

   **Witness.**
   - `μ = 0`: unit circle (d = 1, ρ = 1/2), ε = 0.1, `f⁰ = M_{1,0}`, `n = 1`, `v = 0`. The measure is the vacuum
     law, so `p_ε = 1` and the right side is `M(0) ≈ 0.39894`; the left side is `(0¹)⁻¹ · 0 = ∞ · 0 = 0` (§9.5,
     `README.md:742`). The identity fails, and the bound reads `0.39894 ≤ 0`.
   - `∫ f⁰ = ∞`: `X = E`, d = 1, ε = μ = 1, `f⁰(x, v) = 0.1 · 1_{[0,1]}(v)`, `n = 1`. The `N = 1` term of `Z` is
     `0.1 · ∞`, so `Z = ∞` and `F_1(0) = 0`; `‖ρ⁰‖_∞ = 0.1`, `ω_1 = 2`, and the bound reads
     `0.1 − 0 ≤ 1 · 1 · 2 · 1 · 0.1 · 0.1 = 0.02` at `v = 0.5`: false.
   - The same two instances refute the Checks at lines 747 and 847 (`F_n(0) = 0 ≠ (f⁰)^{⊗n}`).

   `HardSphere.boltzmannGrad_scaling` is not affected (`μ_ε > 0`, `∫ f⁰ = 1`).

   **Repair.**
   - Line 758, replace the opening by: "Prove: for `0 < ε < ρ`, `μ > 0` and a measurable `f⁰` with `∫ f⁰ < ∞`
     (so that `1 ≤ Z < ∞` and the grand canonical measure is a probability measure, §9.3), `F_n(0)(Z_n) = …`"
     and keep the rest; in the closing sentence write "Consequently, for such `f⁰` with ρ⁰ bounded, in the
     scaling `μ_ε = ε^{−(d−1)}`, `F^ε_n(0) → (f⁰)^{⊗n}` …".
   - Add to the Checks of §9.6: "Both hypotheses are needed. `μ = 0`: on the unit circle with ε = 0.1 and
     `f⁰ = M_{1,0}` the measure is the vacuum law, `p_ε = 1`, and `F_1(0) = 0` (§9.5) while `f⁰ p_ε = M(v)`.
     Infinite mass: on `E` with d = 1, ε = μ = 1 and `f⁰(x, v) = 0.1 · 1_{[0,1]}(v)`, `Z = ∞`, `F_1(0) = 0`, and the
     bound would read `0.1 ≤ 0.02`."
   - Line 747: "`ε = 0`, `μ > 0`, `∫ f⁰ = 1`: `F_n(0) = (f⁰)^{⊗n}` exactly (Poisson process); for `μ = 0` and
     `n ≥ 1`, `F_n(0) = 0`."
   - Line 847: replace "for every mass of `f⁰`" by "for every `μ > 0` and every finite mass of `f⁰`".

   Tested on the refuting instances: the first has `μ = 0` and the second `∫ f⁰ = ∞`, so both are excluded;
   under the added hypotheses `Z ∈ [1, e^{μ∫f⁰}]`, `p_ε` is a probability, `1 − p_ε ≤ E[#{particles within ε of some x_i}] ≤ n μ ω_d ε^d ‖ρ⁰‖_∞`,
   and the identity is the computation `μ^{−n} μ^{n+p} = μ^p`, valid for `0 < μ < ∞`.

2. **F02** (P3) a roadmap that does not exist is said to prove Lanford's theorem

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/Suggested.lean:31-33` ("defined here and proved
   by the roadmap on the BBGKY hierarchy"), `Suggested.lean:467-468` ("proved by the roadmap on the BBGKY
   hierarchy (Lanford1975)"), `README.md:823` ("The proposition is the theorem proved by the roadmap on the
   BBGKY hierarchy"), `README.md:862`.

   **Claim.** Present-tense assertion that a named-by-subject roadmap proves `HardSphere.LanfordStatement`.

   **Witness.** `roadmaps grep -i 'BBGKY'`, `'Lanford'`, `'Boltzmann equation'`: no match on main or in any open
   roadmap pull request outside this package. No such roadmap exists; the docstrings overclaim.

   **Repair.**
   - `Suggested.lean:31-33`: "Lanford's theorem itself is not a theorem of this roadmap: it is the proposition
     `HardSphere.LanfordStatement`, defined here; its proof (the BBGKY and Boltzmann hierarchies) is outside
     this roadmap and is left to a later one."
   - `Suggested.lean:467-468`: "For `d ≥ 2` it is the theorem of BGSS2023 Theorem 1 (lines 316–321) and GST2013
     Theorem 8 (lines 2069–2080) (Lanford1975); it is not proved in this roadmap."
   - `README.md:823`, last sentence: "The proof of the proposition is left to a later roadmap on the BBGKY
     hierarchy; this roadmap proves its consequences."
   - `README.md:862`: "A later roadmap on the BBGKY hierarchy and Lanford's theorem (…) is to prove …".

3. **F03** (P3) the two-sided Boltzmann–Grad bound is cited to locators that state only a limit

   **Location.** `README.md:758`: "`1 − ω_d ε ‖ρ⁰‖_∞ ≤ ε^{d−1} E[N] ≤ 1` … (BGSS2023 (1.1.8), lines 211–217;
   DengHaniMa2024 (1.12), lines 246–252)"; the same citation in `Suggested.lean:395`.

   **Claim.** The explicit inequality with the constant `ω_d ‖ρ⁰‖_∞` is supported by the two locators.

   **Witness.** BGSS2023 lines 211–214 state the limit `E(N) ε^{d−1} → 1` as a normalisation; DengHaniMa2024
   lines 246–249 state `E(N) ε^{d−1} ≈ 1` up to an error `O(ε)`. Neither prints a two-sided bound or a constant.

   **Repair.** After the citation in `README.md:758` add: "The sources state the limit (BGSS2023) and the
   error `O(ε)` (DengHaniMa2024); the two-sided bound with the constant `ω_d ‖ρ⁰‖_∞` is derived here and is
   printed in neither." In `Suggested.lean:395` replace the parenthesis by "(the limit: BGSS2023 (1.1.8),
   lines 211–217; the error `O(ε)`: DengHaniMa2024 (1.12), lines 246–252; the explicit bound is the roadmap's)".

4. **F04** (P3) `μ_ε = ε^{−(d−1)}` and its Lean form disagree at `d = 0`, where the README says the definitions apply

   **Location.** `README.md:30`: "`μ_ε = ε^{−(d−1)}`, written `Real.toNNReal (ε⁻¹ ^ (d − 1))`", with
   `README.md:19` ("the definitions of `Suggested.lean` … carry no hypothesis on `d`") and `README.md:823`
   ("Define `HardSphere.LanfordStatement d : Prop`, for every `d`").

   **Claim.** The Lean expression is the stated scaling for every `d`.

   **Witness.** `d = 0`, ε = 0.1: `ε^{−(d−1)} = ε = 0.1`, while `d − 1 = 0` in `ℕ` and
   `Real.toNNReal (ε⁻¹ ^ 0) = 1`. (`d = 1`: both 1; `d = 3`: both 100.) No theorem is affected:
   `boltzmannGrad_scaling` has `1 ≤ d` and the corollary `2 ≤ d`.

   **Repair.** In `README.md:30` append: "The exponent is a natural number, so for `d = 0` the Lean expression is
   `ε⁻¹ ^ 0 = 1`, not ε; the scaling is used only for `d ≥ 1` (`HardSphere.boltzmannGrad_scaling`) and `d ≥ 2`
   (§10.4–10.5), where the two agree."

5. **F05** (P3) §9.6 uses §1.1 and does not list it

   **Location.** `README.md:766`: "*Needs:* §1.4, §8.4, §9.3, §9.5."

   **Claim.** The `*Needs:*` line covers the route.

   **Witness.** The route at `README.md:758` reads "(a union bound, §1.1 for the ball volume, `ε < ρ`)"; §1.1 is
   not in the line, and §8.4 is not used by the route (it enters through §9.5).

   **Repair.** "*Needs:* §1.1, §9.3, §9.5."

One blocking finding (R01, P2: a README target and two Checks of Layers 9–10 are false at `μ = 0` and at
infinite mass of `f⁰`), and four P3 findings. No finding touches a statement of `Suggested.lean`: all
eleven `sorry`'d theorems were recomputed on their boundary cases and hold as typed.

## Verified sound

Counts: 36 declarations of `Suggested.lean` read (31 named, 5 anonymous instances; 11 `sorry`'d theorems,
no sorry'd data, no `set_option`, single `import Mathlib`, `theorem` only); 45 README targets read
(§1.1–§10.5), every line of both files; 55 source locator ranges read (BGSS2023 22, GST2013 22,
DengHaniMa2024 11); 68 Checks recomputed; 11 sibling citations resolved; about 60 pinned declarations grepped at the pins.

**Elaborated signatures.** I did not run Lean (read-only pass). I compared the elaborated type of each
declaration in the worker's `signatures.md` with its README statement: all agree. The 23 "lost binder"
leads are false: each listed class (`MeasureSpace X`, `FlatPositionSpace d X`) occurs in the printed type.
`hardCoreSet`, `scatter`, `partitionFunction`, `grandCanonicalDensity`, `grandCanonical` keep fewer
instances than the section declares, and their README statements assume no more.

**Declarations and adversarial pass** (values on each side; "L" = Lean statement, "R" = README).

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `FlatPositionSpace` (§1.1) | `E`, `π = id`, ρ = ∞; unit torus; wrong model `X = ℝ` with norm `φ(|x|)`, `φ(s) = s` for `s ≤ 1`, `1 + (s−1)/2` after, ρ = 1 | axioms hold in all three; in the third `{‖ξ‖ < ε} = π(B(0, ε))` for `ε < 1`, so `hardCoreSet` and every `ε < ρ` theorem coincide with `E` | sound; admitted extra model is harmless |
| `shortLift` | ‖ξ‖ < ρ; ‖ξ‖ ≥ ρ; ξ = 0 | unique lift of norm ‖ξ‖ (lift axiom + `injOn_cover`); 0, since `‖π a‖ ≤ |a| < ρ`; 0 | sound |
| `FlatTorus` and its 5 instances, `UnitFlatTorus` | d = 0; `ℤ²`; `2ℤ × ℤ` | point of mass 1; `‖π(1/2,1/2)‖ = √2/2`, mass 1, ρ = 1/2; covolume 2, ρ = 1/2, ball of radius 1/4 has `π/16` | sound; bodies real; pins: `ZLattice.module_free`, `ZSpan.fract_mem_fundamentalDomain`, `instIsZLatticeRealSpan` exist |
| `scatter` | ν = (1,0), v = (0,0.9), w = (0.9,0); ν = 0 | ((0.9,0.9),(0,0)), energy 1.62 both sides; identity | sound |
| `contactScatter`, `reversal` | ε = 1, x = ((1,0),0), V = ((1,0),0); non-matching triple; ε = 0; ε ≥ ρ | σ_M V = (0,(1,0)), ℛ = (0,(−1,0)) outgoing; identity; normal `0⁻¹•0 = 0`; `shortLift = 0` | sound; involution for every ε |
| `freeFlow` | unit torus, `S_1(π0, e_1)`; `E`, `S_2(0,(1,0))` | `(π0, e_1)`; `((2,0),(1,0))` | sound |
| `IsTrajectory`, `goodSet` | head-on witness; free passage; left-continuous variant; velocity jump without contact | trajectory with 𝒯 = {1}; leaves 𝒟̄ at t > 1; fails (5) at t = 1; excluded by (6)+(7) since `σ_M = id` off contacts | determines the object |
| `IsTrajectory.eqOn` | ε < 0, ε = 0, 0 < ε < ρ, ε ≥ ρ; `J` a point; `J = [0,1] ∪ [2,3]` | free motion (no contact survives (5)) in the degenerate ranges; forward/backward argument with `σ_M` injective at fixed positions; two trajectories at rest/velocity 5 on (1,2) differ at t = 2 | true as typed; `OrdConnected` needed |
| `volume_hardCoreSet_diff_goodSet` | N ≤ 1; N = 2 on `E`; d = 0; d = 1; torus, ε < ρ | G everything; exceptional set `{u ≠ 0, D = 0}` ∪ non-outgoing contacts, null; 𝒟̄ = ∅ for N ≥ 2; null (codimension 1); other lifts have length `≥ 2ρ − ε > ε` | true as typed |
| `flow`, `flow_add` | ε = −1 rods; ε = 1/2 = ρ on the circle; head-on, `T_1 T_2` vs `T_3` | positions (−2,0) both; G = ∅, identity; ((1,0),(−2,0)) both | true for every ε |
| `measurePreserving_flow` | N = 2 on `E` (ε = 1); torus d = 2, ε = 0.4, N = 8 | `𝒟̄ᶜ` infinite measure, flow identity there; 𝒟̄ = ∅, identity | true; measurability rests on §6.4 (G Borel) |
| `flow_reversal` | head-on, t = −3; ε = −1, t = 2; Z ∉ G | both sides ((1,0),(−2,0); 0,(1,0)); both (3,0; 1,0); both ℛZ (ℛ involution preserving G) | true for every ε |
| `weak_liouville` | φ = χ(t)ψ(H); non-specular φ on the d = 1 box; N = 0; `t = T` | `−χ(0)c + χ(0)c = 0`; left side `−1 ≠ 0` so `hspec` is used; `−wφ(0) + wφ(0)`; `Lφ(T, ·) = 0` because φ vanishes for `t ≥ T` and the derivative exists | true as typed |
| `partitionFunction`, `grandCanonicalDensity`, `grandCanonical` | μ = 0; ε = 0, ∫f⁰ = 1, μ = 2; `X = E`, Maxwellian | Z = 1 (`0⁰ = 1`), vacuum law; Z = e², P(N=1) = 0.27067; Z = ∞, zero measure | sound |
| `grandCanonical_flow_invariant` | μ = 0; `c = 0`; `μ_X(X) = ∞`; `u ≠ 0` | Dirac at the empty configuration; same; zero measure; density a function of `(H, P)` | true as typed |
| `correlation`, `lintegral_sum_distinct_eq_correlation` | n = 0; μ = 0, n ≥ 1; Z = ∞; ε = 0, μ = 2, `h = 1_B ⊗ 1_B`, ∫_B f⁰ = 1/2 | `h(∅)·1` both; 0 both (`∞·0`, no embedding `Fin n ↪ Fin 0`); 0 both; λ² = 1 both | true as typed |
| `boltzmannGrad_scaling` | d = 1; d = 3, ε = 0.01, ‖ρ⁰‖ = 1; d = 0 (excluded) | `1 − 2ε‖ρ⁰‖ ≤ E[N] ≤ 1`; `[0.9581, 1]`; `E[N] = 1/2` against lower bound `1 − ε`: `hd` is needed | true as typed |
| `empirical` | N = 0; μ = 0; `h = 1` | 0; 0 (`0⁻¹ = 0` in ℝ); `N/μ` | sound |
| `collisionOperator` | d = 1; Maxwellian; d = 3 loss term at v = 0 | `Q ≡ 0` (σ_{±1} swaps); 0; `M(0) π √(8/π)` | sound; kernel sign fixed by `ω ↦ −ω` |
| `IsMildBoltzmannSolution` | `f = M`; `Q = 0`; wrong transport sign on the circle | holds; free transport; `0.5 M(1) ≠ 1.5 M(1)` | determines the object |
| `tendsto_empirical_of_correlation` | `f⁰ = 0`; d = 0; ε = 0 Poisson, μ = 2; `F_2 → 2 f⊗f` | vacuum, `f = 0` a.e., conclusion holds; `P(N=1) = μc/(1+μc)`, `F_1 → 0`, `|π(h)| ≤ |h|/μ → 0`; variance `μ⁻¹∫f⁰h² = 1/2`; variance → `m²` so `n = 2` is used | true as typed |
| `LanfordStatement` | Maxwellian datum; cover `π ∘ B`, `B` a quarter turn; d = 0, 1 (not asserted) | every clause holds by §9.4–9.6; conjugate by `(X, V) ↦ (X, BV)`; see R04 | definition with a real body |
| `LanfordStatement.tendsto_empirical` | one-tactic probe; d = 1 | needs `μ_ε → ∞` (d ≥ 2), integrability of `f(t)` from the Gaussian bound on a space of mass 1, and measurability of `ofReal ∘ f⁰`: not one step; `P(N ≠ 1) → 1 − e⁻¹`, so `hd` is needed | true as typed; not padding |

**README targets recomputed without change:** §2.2 cross-section (`π|k|`, `2|k|`, `|k|` in d = 3, 2, 1);
§4.1–4.3 (`D`, τ, `q`, `R_q u` at the three witnesses; `DC` at `a = (2,0)`, `u = (−1,0)`: rows recomputed,
determinant 1; d = 1 variable-time determinant 0); §4.5 (`2^d`, `P^{12}_3`); §5.2 route (closedness and
openness of the agreement set); §5.5 `N = 2` description (`a = (−2,1)`, `u = (−1,0)`: `D = 0`, tangency at
time −2); §6.1 bound (triples `≤ N³`, two shells, `μ_X(K)^{N−2}`); §6.2–6.3 (torus step sizes 0.09, 0.045;
`C₁ = 576π⁴ ≈ 56108`); §6.4 Borel claim (a trajectory on `[0, t]` passes all steps of size `t/m` for large
`m`: the second-nearest distance is continuous and `> ε` on `[0, t]`); §7.4 route (`p = 2` by dominated
convergence, other `p` by interpolation on a set of measure `≤ 2 vol(supp f)`); §8.2 Checks 3–5 (`τ ∈ (0.9519, 1.0521)`,
`H ∈ (0.4802, 0.5204)`, `−2χ(0) − ∫χ ≤ −5`); §9.1 (`(det S)^{−1/2} = β^{d/2}`); §9.5 inversion formula and its
bound; §10.2 Checks; §10.4 Scheffé route and the classification of structures on `𝕋^d`; §10.5 Checks.

**Headline theorems.** Uniqueness, Alexander's theorem, the group law, measure preservation,
reversibility, the weak Liouville equation, grand canonical invariance, the correlation identity, the
Boltzmann–Grad scaling and the law of large numbers are all stated. No statable headline is absent and
no declaration is padding by the one-tactic probe.

**Suppliers.** ClassicalErgodicTheory §3.5 items 1, 3, 4 and §0.2 read at the head of its open pull request
(a new roadmap folder): the items exist with the hypotheses the contract quotes (standard Borel, σ-finite).
MathematicalBilliards §10.3, §10.5, §12.3, RandomMatrices §8.1, ProbabilisticAndMetricNumberTheory §4.9a
(`scalarLpKoopman_strong`), StandardDistributions Layer 5, OneParameterSemigroups, ComplexTori: present on
main as cited. No roadmap of the never-cite list is cited.

**Ownership against open work.** `roadmaps grep` for hard sphere, Boltzmann equation, `FlatTorus`, flat
tori, Maxwellian, grand canonical, collision operator, Lanford, BBGKY, specular: no second owner on main
or in the open pull requests; the pinned Mathlib and Tau Ceti have none of these objects (Tau Ceti's
Maxwell–Boltzmann law of `|v|` in `Probability/Distributions/Chi/Gaussian.lean` is a different object).
This roadmap is the owner. No declaration shares a fully qualified name with another roadmap.

**Policy.** `git diff --stat origin/main...HEAD` touches only the package folder; no pull-request numbers,
no `lemma`, no `set_option`; every target has a locator or states that it is derived here.

**Dependency check.**

    depcheck: 250 roadmaps, 2363 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

**Copyright.** Wording: 55 locators and 8 further passages (Lean docstrings of `IsTrajectory`,
`volume_hardCoreSet_diff_goodSet`, `LanfordStatement`, `tendsto_empirical_of_correlation`; README §5.5,
§6.3, §8.2 route, §10.4) set beside the sources: no sentence, list or proof plan reproduced or followed clause by clause, outside formulas
and standard names. Arrangement: GST2013 has the largest share; its contents (Ch. 1 Liouville equation,
Ch. 2 Boltzmann equation, Ch. 3 results, Ch. 4 flow, hierarchy and weak formulation, Ch. 5–7 hierarchies)
do not map onto Layers 1–10: Layers 1 and 4 have no counterpart there, Layer 2 precedes the flow where
GST2013 Ch. 2 follows the hierarchy's motivation, Layers 9–10 draw on BGSS2023 §1.1–1.2, and the order
1 → 3 → 5 → 6 → 7 → 8 → 9 → 10 is forced by the `*Needs:*` lines of §5.1, §6.2, §7.1, §8.1, §9.3, §10.1.
Reuse: no table, figure or list taken over.

Source independence: 63 passages compared with 3 sources, none shared; largest share GST2013, 53 of 132 locators; contents compared with GST2013: independent.

## Not verifiable

- Alexander1976, AlexanderThesis1975, Lanford1975, CIP1994, Spohn1991, Uchiyama1988: recorded as
  uncertified; their locators (Alexander1976 Proposition 4.3, pp. 217–232) were not read. The finite-system
  statement is checked against GST2013 Proposition 4.1.1 instead.
- The numbering of the published versions (BGSS2023 in Ann. of Math. 198; GST2013 in the EMS volume) was not
  compared with arXiv v2: the README's line and equation locators are those of the arXiv texts, which the
  References name.
- Downstream-consumer locators (BGSS2023 Theorems 2–3 and §2; GST2013 Part III, Part IV): not opened; no
  target depends on them.
- Elaboration was not rerun in this pass; the comparison used the worker's elaborated signatures.

## Source issues

- **Gap** in GST2013 at the proof of Proposition 4.1.1, printed p. 28 (lines 881–887): the iteration invokes invariance of the measure under the flow before the flow or that invariance is established, and treats forward time only; it should prove measure preservation of each short-time step map first and handle negative times by reversal; affects the proof.
- **Gap** in BGSS2023 at the proof of Corollary 1.2.1, printed p. 5 (lines 369–371): convergence of the integrals of the first two correlation functions is drawn from almost-everywhere convergence alone; it should add the convergence of total masses and a Scheffé or domination argument; affects the proof.

## For the human reviewers

- **Scope.** `HardSphere.LanfordStatement` (`Suggested.lean:469`) states Lanford's theorem as a definition of type `Prop`, and one stated theorem takes it as a hypothesis; no roadmap on main or in an open pull request proves it (R02).
- **Licence.** Alexander1976 is open on Project Euclid but the manifest records it as uncertified because the service received a bot-protection page; it is cited by locator only (`sources.toml`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "87cad15ba264ee803add3edb493c1999c390b4d2", "job": "RT-HardSphereDynamicsAndKineticLimits~1b", "model": "fable", "worker": "chris-x90"} -->
