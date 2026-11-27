# Review of SpatialPointProcessFoundations (pull request #3223 at 83b48de)

**Verdict:** needs changes

**Summary.** Changes are needed, for two missing hypotheses in prose targets: the zero–infinity law of 7.2 is false at `d = 0`, a case the same section treats as in scope, and the uniqueness of Palm kernels in 3.2 is stated with no hypotheses and fails on a measurable space that is not countably generated, although the Campbell measure there is finite. Both findings of the previous review are repaired, and so are its three small corrections. There is one small correction and one format note, neither blocking, and two questions for the author. No source text could be read, so every locator is unverified; that, the overlap with the open PointProcesses roadmap and the local copies of library definitions newer than the pin are left to the human reviewers.

## R01 (P2) — The zero–infinity law of 7.2 is false at `d = 0`; it needs `d ≥ 1`

An implementer who states the law as written, for every `d`, cannot prove it. In 7.2 (README, lines 635–636): "a stationary point process has `P(0 < N(ℝ^d) < ∞) = 0`". At `d = 0` the space `E 0` is one point and the translation group is trivial, so, as the second Check of the same section says (line 641), every point process is stationary. Take `N = δ_0` deterministically: `N(ℝ⁰) = 1`, so `P(0 < N(ℝ⁰) < ∞) = 1`. Section 7.4 already separates `d ≥ 1` from `d = 0` for ergodicity; this target needs the same hypothesis: "for `d ≥ 1`, a stationary point process has …".

Two negative controls rest on the same fact and are false at `d = 0` for the same `N = δ_0`: in 8.2 (lines 729–731) the left side without the shift is `1_B(0) · 1 = 1`, not `0`, and in 8.3 (lines 748–749) `P(N({0}) ≥ 1) = 1`, not `0`. Adding "for `d ≥ 1`" to each makes them true.

## R02 (P2) — Uniqueness of Palm kernels (3.2) is stated without hypotheses and fails on a space that is not countably generated

In 3.2 (README, lines 251–253): "Two Palm kernels of `N` agree for intensity-almost every `x` … when the Campbell measure is σ-finite." The definitions of 3.2 are on an arbitrary measurable space, and there the statement is false even for a finite Campbell measure, so the target cannot be proved at the generality the text gives it.

Take `X = ℝ` with the countable–co-countable σ-algebra and `ν(A) = 0` for countable `A`, `1` otherwise (the measure of the last Check of 5.5), and `N = ν` deterministically. The intensity is `ν` and the Campbell measure is `ν ⊗ δ_ν`, of mass `1`. The constant kernel `κ(x) = δ_ν` is a Palm kernel. So is `κ'(x) = δ_{δ_x}`: a measurable set `L` of measures depends on the masses of countably many sets `A_k`, and for `x` outside the countable union of the countable `A_k` and of the complements of the co-countable ones, `δ_x(A_k) = ν(A_k)` for all `k`; hence `ν(B ∩ {x : δ_x ∈ L}) = ν(B) 1_L(ν)` on every rectangle `B × L`, and `ν ⊗ κ' = ν ⊗ κ`. But `κ(x) ≠ κ'(x)` for every `x`: on `{μ : μ({x}) = 1}` the first gives `0` and the second `1`. Without σ-finite intensity uniqueness fails for another reason, the junk value of `⊗ₘ`.

The smallest change is to state the bullet under the hypotheses of the two existence bullets before it (a Polish space, σ-finite intensity), and to say in the route what is used: Palm kernels are carried by the measures finite on the partition `(Bₖ)`, a countably generated space, so a countable π-system of test sets determines `κ(x, ·)`.

## C01 — Two hypotheses are not used by the statements that carry them

The window form of reduced Palm kernels (3.2; `Suggested.lean`, line 534) assumes the windows pairwise disjoint, but the identity is the defining identity of `IsReducedPalmKernel` at `g(x, μ) = 1_A(x) ∏ⱼ μ(Bⱼ)^{(nⱼ)}` and holds for any relatively compact windows. The intensity of a marking (6.2; line 733) assumes `N` almost surely integer-valued, but differentiating the defining identity at `g = t · 1_C` as `t ↓ 0` gives `𝔼 M(C) = 𝔼 ∫ K(x, C_x) N(dx)` for every measurable `C` with no such assumption (the exponent of `markExponent` lies between `(1 − e^{-t}) K(x, C_x)` and `t K(x, C_x)`). A reader takes each hypothesis to be what makes the statement true. Either drop them or say in one clause that they are carried for the consumers' sake.

## N01 — Some text is still tied to a moment in time

"of Tau Ceti at commit `d395922`" (supplier contracts, line 890, and Prior formalization, line 929) and the heading "Beyond this roadmap (a roadmap for a roadmap; do not implement)" read as a status report; the other passages the previous review listed are repaired.

## Questions for the author

- Measurability along a random measure (4.1, lines 292–298; `aemeasurable_factorialMeasure` and, with the same hypotheses, `IsMarking.factorialMomentMeasure_thinning`) assumes that almost every `N ω` is σ-finite, with a cover that may depend on `ω`. The route gives measurability of `μ⁽ⁿ⁾` on rectangles of the generating algebra, where masses may all be infinite (for `∑_{q ∈ ℚ} δ_{q+U}` every interval has infinite count), and the passage from rectangles to all measurable sets needs finiteness on a cover that does not depend on `ω`. Is the statement meant with a fixed countable cover (σ-finite intensity, which is all that 5.3 uses), or is there an argument for the pointwise hypothesis? I found neither a proof nor a counterexample.
- In 1.2 (lines 113–115) the `w#`-topology of Daley–Vere-Jones is said to agree with the vague topology "on a locally compact space". As I recall their definition (the text could not be read), `w#`-convergence tests against bounded continuous functions vanishing outside a metrically bounded set. For `S = ℝ` with the metric `min(|x − y|, 1)`, which is Polish and locally compact, every set is bounded, so `δ_n → 0` vaguely but not in `w#`. Should the sentence say "when the metric makes bounded sets relatively compact"?

## Earlier findings

- R01 of the previous review (Slivnyak–Mecke false without countable generation): repaired. `Suggested.lean`, line 666, now carries `[MeasurableSpace.CountablyGenerated X]`; 5.5 says "On a countably generated space" and keeps the counterexample as a negative control (lines 497–501).
- R02 (total-variation distance `2`): repaired. Line 128 reads "at distance `1` from `0`".
- C01 (Campbell's formula is a Mathlib lemma): repaired. 2.1 calls it "a proved sanity check of `intensity`" and the Lean file proves it.
- C02 (stationarity unused in the normalisation of `P⁰`): repaired. The hypothesis is dropped and 8.1 says "stationarity is not needed".
- C03 (consumer roadmaps that exist nowhere): repaired. Consumers are described by subject.
- N01 (text tied to a moment): partly; see N01 above.
- The question on `IsPalmKernel.lintegral`: settled, `[SigmaFinite (intensity P N)]` is now in the statement (line 392).

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.1 carriers and counts (`PointMeasure.coe_count`, atomic decomposition) | `2δ_a`; `∑_{k∈ℤ} δ_k` on `ℝ`, `[0,2)`; Lebesgue on `[0,1/2]`; `∑ δ_{(0,k)}` on `{0}×ℝ` | count `2`; `⊤` and `2`; `1/2` not an integer; `∞`, not marked | holds | none |
| 1.2 vague topology, σ-algebra by counts | `δ_{1/n}` on `(0,1]`; `‖δ_n − 0‖`; `δ_{1/n}+δ_{-1/n}` | `1` against limit `0`; `1`; limit `2δ_0` not simple | holds | question on `w#` |
| 1.3 `isSimple_ofTuple_iff` | `![a,b,a]`; `n = 0` | mass `2` on `{a}`, not injective; zero measure simple, empty tuple injective | holds | none |
| 2.1 intensity, Campbell's formula | `Kδ_0`, `P(K=∞)=1/2`; proof in file | both sides `∞`; closes by `Measure.lintegral_bind`, marked as a sanity check | holds | none |
| 2.2 determination by counts and by Laplace functional | `f = 0` with `Q` arbitrary; `f = ∞·1_B`; `δ_0+δ_1` vs `2δ_{1/2}` on `[0,1/2)` | forces `Q(Ω') = P(Ω)`; `P(N(B)=0)`; counts `1` vs `0` | holds | none |
| 2.3 Rényi–Mönch | `δ_U` vs `2δ_U` | same void probability `1−\|A∩[0,1]\|`, different laws | simplicity needed, present | none |
| 3.1 `campbellMeasure_prod` | `δ_U`; `2δ_0` | mass `1`; `𝔼N = 2` vs `P(N>0) = 1` | holds | none |
| 3.2 existence, Campbell–Little–Mecke | `δ_U`; `δ_U+δ_V`; `N = 0` | `δ_{δ_x}`, reduced `δ_0`; reduced law of `δ_V`; both sides `0` | holds | none |
| 3.2 uniqueness (prose) | countable–co-countable `ℝ`, `N = ν`, `κ = δ_ν`, `κ' = δ_{δ_x}` | `ν⊗κ = ν⊗κ'` on rectangles; on `{μ({x})=1}`: `0` vs `1` | false without hypotheses | R02 |
| 3.2 window form | `g = 1_A ∏ μ(Bⱼ)^{(nⱼ)}` with overlapping windows; atom `x ∈ Bⱼ` | identity is the definition at `g`; count `≥ 1`, `ℕ` subtraction exact | holds; disjointness unused | C01 |
| 4.1 factorial powers, count moments | `2δ_a+δ_b`, `n=2`; `(3δ_a)⁽³⁾`; `c=(1,1,2)` on `3δ_a+δ_b`; `{a,b}×{a}` | `9−3 = 6`; `18−12 = 6`; `3·2·1 = 6`; `9` vs `12` | holds, disjointness needed | none |
| 4.1 measurability along a random measure | `∑_{q∈ℚ} δ_{q+U}` | every interval has count `∞`; rectangles measurable, extension step not closed | undecided | question |
| 4.2 product densities, moment determinacy | `n = 0`, any `P`; `P = 0`; `Kδ_U` | both sides `P(Ω)`, `ρ(∅)`; `ρ = 0` a.e.; `α₂` mass `λ²` on the diagonal | holds | none |
| 4.3 Janossy measures | mass at `N(W)=n`; series term at `k+n`; `2δ_U` without `1/n!` | `n!/n! = 1`; `(k+n)!/n! · n!/(k+n)! = 1`; `2 ≠ 1` | holds | none |
| 5.1 definition, existence, uniqueness, intensity | `Λ = 0`; `Λ = ∞δ_a`; window `∅` | `N = 0` a.s.; `N({a}) = ∞` forced, mean `∞`; law `δ_0`, so `P(Ω) = 1` | holds | none |
| 5.2 Laplace functional, void probabilities | `λ=2`, `t=0.7`; `Λ ∈ {0,∞}`-valued; `Λ(B) = ∞` | `e^{-1.00683} = 0.365376` both; `1` or `0` both; `0` both | holds | none |
| 5.3 Mecke equations and characterisation | `f = 1_B μ(B)`, `Λ(B)=1.7`; `Λ=∞δ_a`; `Kν` on countable–co-countable `ℝ`, `f = μ(ℝ)` | `4.59` both; `∞` both; `𝔼K² = 2 = 𝔼(K+1)` | holds | none |
| 5.4 simplicity, binomial form | `Λ=δ_a`; `Λ(W)=0`, `m=0`, `m≥1`; `Kν`, `m=1` | `1−2/e > 0`; `δ_0` both, zero measure both; laws agree on the Giry σ-algebra | holds | none |
| 5.5 Rényi; Slivnyak–Mecke | `2N`; trivial σ-algebra, `N = K·unit`; `N = Λ` diffuse | void `e^{-Λ(B)}`, not simple; `(N−δ_x)+δ_x = N`; `Var = 0 ≠ Λ(B)` | holds with the new hypothesis | none |
| 6.1 mapping, restriction, superposition | projection of planar Lebesgue; `ι` empty; `λ₁δ_0`, `λ₂δ_0`; `∑ Λᵢ(A) = ∞` | intensity `∞`; `P(Ω) = 1` forced; `Po(λ₁+λ₂)`; `∑(1−e^{-λᵢ}) = ∞` | holds | none |
| 6.2 markings, intensity, marking theorem | `δ_a`, Bernoulli`(1/2)`, `g = ∞·1{true}`; `g = t·1_C`, `t ↓ 0` without integer values | `1/2` both, exponent `log 2`; `𝔼M(C) = 𝔼∫K(x,C_x)dN` | holds; `hint` unused | C01 |
| 6.3 thinning | binomial `(5,0.4)`, `p=0.3`; `N = 2δ_a` | `3.2·0.09 = 0.288`; covariance `0.21·(−0.8) = −0.168`; `2p²` both | holds | none |
| 7.1 translation, stationarity | `x +ᵥ δ_x`; `add_vadd` nonabelian; counts of `x +ᵥ N` | `δ_0`; `(z−y)−x = z−(x+y)`; counts of `N` on `A + x` | holds | none |
| 7.2 stationary intensity; zero–infinity law | `δ_U` on the cube; `d = 0`, `N = δ_0` | `γ=1`, intensity not `volume`; stationary with `N(ℝ⁰) = 1` | law false at `d = 0` | R01 |
| 7.3 reduced second factorial moment measure | Poisson `γ=3`, `\|A\|=1`, `\|B\|=1.5`; `d = 0` | `9·1.5 = 13.5`; `α₂^! = α₂` | holds | none |
| 7.4 mixing, ergodicity | void events, `γ=3`; `γ = 0`; `d = 0` | `e^{-6} = 0.002479`; law `δ_0`; `cocompact = ⊥`, `P(N=0) = e^{-γ}` | holds, `d ≥ 1` present | none |
| 8.1 Palm probability | lattice `ℤ^d+U`; `γ = 0`; mass | `δ_{ℤ^d}`; `∞·0 = 0`; `γ⁻¹γ = 1` | holds | none |
| 8.2 refined Campbell | `f = 1_B`; control without shift at `d = 0`, `N = δ_0` | `γ\|B\|` both; `1`, README says `0` | theorem holds; control needs `d ≥ 1` | R01 |
| 8.3 Slivnyak | planar, `γ=50`, `r=0.08`; `d = 0`, `N = Kδ_0`; control at `d=0` | `e^{-1.00531} = 0.36593`; size-biased `K` equals `K+1` iff Poisson; `1`, README says `0` | theorem holds; control needs `d ≥ 1` | R01 |

- Source locators checked against the text: 0 of 212 (no source text could be read; see Not verifiable). The chapter list of LP was read on the publisher's contents page.
- Library declarations opened at the pin (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`): the seventeen `#check` lines elaborate; the pinned Tau Ceti has no `IsPoissonRandomMeasure`, `laplaceFunctional`, `expNeg`, `IsIntegerValued`, `poissonLaw` or point-measure carrier, and the pinned Mathlib no Poisson random measure, Campbell measure or vague topology on measures.
- Cross-roadmap citations resolved on main, 5 of 5: GeometryOfNumbersAndQuadraticArithmetic §4.2 (`configurationMeasure`, `configurationMeasure_apply`, permutation invariance, measurability), ClassicalErgodicTheory §1.3 (mixing along `cocompact`, mixing ⇒ weak mixing for noncompact `G` ⇒ ergodic), RandomMatrices §8.1, StochasticCalculus §0.6, MarkovChainsAndRenewal Layer 7.
- Dependency check: `depcheck: 94 roadmaps, 1055 edges, 0 problem(s)`; no UPWARD or CYCLE line. Both suppliers are on main.
- Elaboration: `Suggested.lean` elaborates with exit 0 and 57 `sorry` warnings, nothing else; no `set_option`, no sorry'd data. `#check @name` on all 61 theorems: every signature carries its section binders and agrees with its README statement.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp_all`) on the 57 sorried theorems: none closes.
- Headline theorems of the summary (Palm disintegration, Poisson existence and uniqueness, Mecke, Rényi, Slivnyak–Mecke, refined Campbell, Slivnyak) are all stated in `Suggested.lean`; none is forced through a stand-in.
- No change outside the roadmap folder. The description agrees with the head: a new roadmap, 57 `sorry`, one proved sanity check, three supporting lemmas, four instances, both suppliers on main, the pins as named.

Overlap check: read PointProcesses (open), ShotNoiseAndCampbellTheorem (open), LevyProcesses (open), MarkovChainsAndRenewal, DimerModelsAndLozengeTilings, PoissonApproximation (main), and RandomMatrices and InfinitelyDivisibleLawsAndTriangularArrays (main) for the same objects. PointProcesses and this roadmap both plan the carriers, laws, Campbell measure and Palm kernels, factorial and Janossy measures, the Poisson random measure and its operations, stationarity and the stationary Palm theory (its Layers 0–4 and 6–8); PointProcesses is on the project's list of roadmaps not to be cited as suppliers and is not in the merge order, so this roadmap is the owner here and the question goes to the human reviewers. ShotNoiseAndCampbellTheorem and LevyProcesses disclaim general random measures; RandomMatrices §8.1 keeps its count-based correlation functions and MarkovChainsAndRenewal Layer 7 the line process, as Scope says; nothing else is shared.

Source independence: 0 passages compared with 0 sources (no source text could be read); largest share LP, 84 of 212 locators; contents compared with LP's chapter list: independent. Layers 1 and 3 have no LP chapter, Layer 5 draws on Ch. 3, 4 and 6, and Layers 6, 7, 8 against Ch. 5, 8, 9 are in the order the dependencies force (Layer 6 needs Layer 5, Layer 8 needs the stationary intensity of Layer 7). Wording was not compared with LP or any other source.

Research link: The README places the roadmap as the common base of determinantal, Gibbs, Cox and cluster processes, random closed sets and tessellations, with the Mecke equation, Palm kernels and the refined Campbell theorem as in Last–Penrose (2018), Kallenberg (2017) and Baccelli–Błaszczyszyn–Karray (2024). This rests on the README only.

## Not verifiable

- All source locators, including the fifteen sampled targets (1.1, 2.1, 2.2, 4.1, 4.2, 5.1, 5.2, 5.3, 5.5, 6.1, 6.3, 7.2, 8.1, 8.2, 8.3): the sources service found no legal copy of LP (the publisher's page and the first author's page were tried), its request for the HAL record of BBK returned no text, and K, DVJ1, DVJ2, CSKM and SW are published books with no open copy known to me. The mathematics of each sampled target was checked independently (table above); theorem numbers and pages were not.
- The claims about Tau Ceti beyond the pin (the copied definitions and the theorems listed under Prior formalization, commit `d395922`): outside the pinned library.
- The lean-MSSS repository named under Prior formalization was not opened.

Automatic checks set aside as false positives: the four hits on a dropped roadmap name are a directory name inside file paths of an external repository in the Prior formalization section, not a citation of that roadmap; the section comment of `Suggested.lean` reported as having no declaration under it is followed by the `#check` lines that pin the consumed library declarations.

## Source issues

- none

## For the human reviewers

- **Scope / ownership.** The open roadmap PointProcesses plans the same substrate (its Layers 0–4 and 6–8); the description says this roadmap covers that part so the spatial family need not wait. Which of the two owns it is settled in neither text.
- **Library newer than the pin.** `Suggested.lean` lines 62–156 copy eight definitions of a Tau Ceti commit newer than the pin; by the README (Prior formalization) that commit already proves about ten targets of Layers 2, 5 and 6. Not checked beyond the pin.
- **Not tested.** LP has the largest share of locators (84 of 212); neither its text nor any other source was read, so wording was not compared; only its chapter list was.
- **Licence.** BBK is cited as a 2024 manuscript (README, References), not a published book; 49 locators rest on it.
- **Reuse.** The README says lean-MSSS (Apache-2.0, by the roadmap's author) proves several targets; whether `Suggested.lean` adapts its declarations was not checked.
