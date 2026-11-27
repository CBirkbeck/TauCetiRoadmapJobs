# Review of SpatialPointProcessFoundations (pull request #3223 at 45509e9)

**Verdict:** needs changes

**Summary.** Changes are needed, for two reasons: the Lean statement of the Slivnyak–Mecke characterisation in 5.5 is false at the generality it is stated in (an arbitrary measurable space, where the README says "point process"), and a Check of 1.2 gives a total-variation distance of `2` where the value is `1`. There are three small corrections and one format note, none blocking, and one question for the author. No source text could be read in this round, so every source locator is unverified; that, the overlap with the open PointProcesses roadmap, and the local copies of library definitions that are newer than the pin are left for the human reviewers.

## R01 (P2) — The Lean statement of Slivnyak–Mecke (5.5) is false on a measurable space whose σ-algebra does not separate points; it needs countable generation or the point-measure carrier

`isPoissonRandomMeasure_iff_isReducedPalmKernel` (`Suggested.lean`, line 676) is stated for `N : Ω → Measure X` on an arbitrary measurable space `X`, assuming only that `N` is measurable, almost surely integer-valued and has σ-finite intensity. The README sentence (5.5, line 477) is about a point process. An implementer cannot prove the Lean form, because it fails in both directions.

Take `X = ℝ` with the σ-algebra of countable and co-countable sets, and `ν(A) = 0` for countable `A`, `ν(A) = 1` for co-countable `A`. This is a finite, integer-valued measure with `ν({x}) = 0` for every `x`. Any measure `d` with `ν ≤ d + δ_x` satisfies `d(A) ≥ d(A \ {x}) ≥ ν(A \ {x}) = ν(A)`, so Mathlib's truncated subtraction gives `ν - δ_x = ν`. Let `N = ν` deterministically, on a one-point probability space. Its intensity is `ν`, and both sides of the reduced-Palm identity for the constant kernel `δ_ν` are `∫ g(x, ν) ν(dx)`; so the right side of the iff holds. The left side fails: `N(ℝ) = 1` almost surely, which is not the law `Po(1)`. In the other direction, `N = Kν` with `K ~ Po(1)` is a Poisson random measure with intensity `ν`, again `N - δ_x = N`, and for `g(x, μ) = μ(ℝ)` the reduced-Palm identity for the constant kernel `law(N)` would read `𝔼[K²] = 𝔼[K]`, that is `2 = 1`. This is the README's own negative control of 5.5 (a deterministic diffuse measure), made integer-valued.

The smallest change is to add to the Lean statement the hypothesis under which an integer-valued σ-finite measure is a sum of point masses that the σ-algebra sees: `[MeasurableSpace.CountablyGenerated X]`, which the multivariate Mecke equation of 5.3 already carries, or to state it for `N : Ω → PointMeasure S` as the README sentence does. The README sentence then names the same hypothesis.

## R02 (P2) — The Check of 1.2 on `δ_n → 0` gives the total-variation distance from `0` as `2`; it is `1`

In the second Check of 1.2 (README, line 124): "in total variation `δ_n` stays at distance `2` from `0`". The signed measure `δ_n − 0` is `δ_n`, of total variation `1` (and `sup_A |δ_n(A) − 0| = 1` in the other normalisation). The value `2` is the distance between `δ_n` and `δ_m` for `n ≠ m`. The point of the Check (the vague topology is strictly coarser) is unaffected: write "distance `1` from `0`", or compare `δ_n` with `δ_m` and keep `2`.

## C01 — Campbell's formula (2.1) is Mathlib's `MeasureTheory.Measure.lintegral_bind` after unfolding `intensity`

`lintegral_intensity` (`Suggested.lean`, line 316) closes with `unfold intensity; exact Measure.lintegral_bind hN.aemeasurable hf.aemeasurable` (checked by elaboration; the lemma is in `Mathlib/MeasureTheory/Measure/GiryMonad.lean`, line 307). As a `sorry` target it asks an implementer for nothing. Of the 58 `sorry` statements it is the only one that closes this way. If it is kept as the named form of the formula, mark it as a sanity check of the definition of `intensity`, or cite the Mathlib lemma in the supplier contracts and leave the statement to the README.

## C02 — The normalisation of the Palm probability (8.1) does not use stationarity

`IsStationary.isProbabilityMeasure_palmProbability` (`Suggested.lean`, line 932) assumes `IsStationary P N`, but the README's own route (line 690) computes the mass as `γ⁻¹ 𝔼 N(unitCube d) = 1`, which holds for every measurable point process with `0 < γ < ∞`. A reader takes stationarity to be what makes `P⁰` a probability. Either drop the hypothesis (the name then loses its `IsStationary.` prefix) or say in 8.1 that it is carried only for uniformity with 8.2.

## C03 — The eight roadmaps named under Downstream consumers exist nowhere

DeterminantalPointProcesses, FiniteGibbsPointProcesses, InfiniteVolumeGibbsPointProcesses, PointProcessLikelihood, RandomClosedSetsAndBooleanModels, RandomTessellations, SpatialCoxAndClusterProcesses and SpatialPointPatternStatistics (README, lines 749–791) are neither on main nor in an open pull request, and the opening summary (lines 28–31) says each "takes the parts listed". A reader who looks for them finds nothing. Say that they are planned consumers, in one clause, or describe the consumers by subject without roadmap names.

## N01 — Some README text is tied to a moment in time

"younger than the pinned commit" and "Tau Ceti main at commit `d395922`" (Prior formalization, lines 911–913), "the marked realization that Tau Ceti main constructs" (6.2, line 540), "is proved in Tau Ceti" (5.2 and 6.1, for declarations the pinned Tau Ceti does not contain), and the heading "Beyond this roadmap (a roadmap for a roadmap; do not implement)" read as a status report; a reader a year on cannot tell which pin they refer to. The supplier contracts are the place for facts at the pin.

## Questions for the author

- `IsPalmKernel.lintegral` (3.2, `Suggested.lean` line 403) carries no σ-finiteness of the intensity, while `campbellMeasure_prod` and `exists_isPalmKernel` do, and 3.1 says σ-finiteness is what keeps the `bind` in `campbellMeasure` from being the junk value `0`. If the `bind` is junk and the intensity is not s-finite, both sides of the defining equation `C = intensity ⊗ₘ κ` are `0` for every Markov `κ`, and the conclusion would then fail. Is there a reason this cannot happen for measurable `N`? I could not construct such an `N` (for counting measures the map is universally measurable), so this is not raised as a finding; adding `[SigmaFinite (intensity P N)]` would settle it.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.1 carriers, counts (`PointMeasure.coe_count`) | `2δ_a`; `∑_{k∈ℤ} δ_k` on `ℝ` and `[0,2)`; Lebesgue on `[0,1/2]`; counting measure on `ℚ` | count `2`; `⊤` and `2`; mass `1/2` not integer; `[0,1]` mass `∞` | holds | none |
| 1.1 marked measures | `∑ δ_{(k,k)}` on `[0,1]×ℝ`; `∑ δ_{(0,k)}` on `{0}×ℝ` | `2`; `∞` (finite on compacts) | holds | none |
| 1.2 vague topology, Checks | `δ_{1/n}→δ_0` counts on `(0,1]`; `δ_n→0` total variation; `δ_{1/n}+δ_{-1/n}` | `1` vs `0`; `‖δ_n‖ = 1`, README says `2`; limit `2δ_0` not simple | one Check false | R02 |
| 1.2 σ-algebra by counts (Lean) | index set `MeasurableSet A ∧ IsCompact (closure A)`; `ℕ∞`-valued counts | elaborates; count is a function of the mass on measurable sets | consistent with 1.1 | none |
| 1.3 `ofTuple`, simplicity | `![a,b,a]`; `![a,a]`; `n = 0` | mass `2` on `{a}`, total `3`; mass `2 > 1`, not injective; zero measure simple, empty tuple injective | holds | none |
| 2.1 Campbell's formula | `Kδ_0`, `P(K=∞)=1/2`; one-tactic probe | both sides `∞`; closes by `Measure.lintegral_bind` | true, asks nothing | C01 |
| 2.2 determination by Laplace functional | `f = 0`; `f = ∞·1_B`; `Q` not assumed finite | `P(Ω)`; `P(N(B)=0)`; `f=0` forces `Q(Ω') = P(Ω)` | holds | none |
| 2.3 void probabilities | `δ_U` vs `2δ_U`; inclusion–exclusion for disjoint `A`, `B` | both void `1−\|A∩[0,1]\|`, laws differ; identity exact | simplicity needed, as stated | none |
| 3.1 Campbell measure | `δ_U`; `2δ_U`; `2δ_0` | mass `1`; `C(B×L) = 2P(U∈B, 2δ_U∈L)`; `𝔼N = 2` vs `P(N>0) = 1` | holds | none |
| 3.2 Palm kernels | `δ_U`; `δ_U+δ_V`; `IsPalmKernel.lintegral` with junk `bind` and non-s-finite intensity | `δ_{δ_x}`, reduced `δ_0`; reduced law of `δ_V`; both sides of hypothesis `0` | no instance found | question |
| 3.2 window form | `m = 0` or `n = 0`; atom `x ∈ B_j` | both sides `𝔼N(A)`; `count ≥ 1` so `ℕ` subtraction exact | holds | none |
| 4.1 factorial powers | `2δ_a+δ_b`, `n=2`; `(3δ_a)⁽³⁾`; `c=(1,1,2)`; overlapping windows; `n > k` tuples | `9−3 = 6`; `18−12 = 6`; `3·2·1 = 6`; `9` vs `12`; empty sum `0` | holds | none |
| 4.2 product densities, determinacy | `n = 0`; `Kδ_U`; rectangles split into equal-or-disjoint coordinates | `ρ(∅) = 1`; `α₂` mass `λ²` on diagonal; every box is a finite disjoint union | holds | none |
| 4.3 Janossy measures | mass for `ν(W)=n`; series at `m=k+n`; `2δ_U` without `1/n!` | `n!/n! `; `(k+n)!/n!·J_{k+n}`; `2 ≠ 1` | holds | none |
| 5.1 Poisson definition | `Λ = 0`; `Λ = ∞δ_a`; window `∅` | `N = 0` a.s., `P(Ω)=1`; `N({a}) = ∞` forced; law `δ_0` of mass `1` | holds | none |
| 5.2 Laplace functional, void probabilities | `λ=2`, `t=0.7`; `Λ(B)=∞`; non-σ-finite `Λ` (counting on `ℝ`) | `0.365375` both; `0` both; `{f>ε}` infinite ⇒ `∫f dN = ∞` | holds | none |
| 5.3 Mecke equations | `f = 1_B(x)μ(B)`, `Λ(B)=1.7`; `Λ=∞δ_a`; characterisation for non-integer `N` | `4.59` both; `∞` both; `L'/L = −Λ(B)e^{−t}` forces `Po(Λ(B))` | holds | none |
| 5.4 simplicity, binomial form | `Λ=δ_a`; `Λ(W)=0`, `m=0` and `m≥1`; `(3, 1.2, 5)` | `1−2/e`; `δ_0` both, `0` both; binomial `(5, 0.4)` | holds | none |
| 5.5 Rényi | `2N` | void `e^{−Λ(B)}`, not simple | holds | none |
| 5.5 Slivnyak–Mecke (Lean) | countable–co-countable `ℝ`, `N = ν`; `N = Kν`, `g = μ(ℝ)` | iff: right true, left false; `𝔼K² = 2` vs `𝔼K = 1` | false as stated | R01 |
| 6.1 mapping, restriction, superposition | projection of planar Lebesgue; `ι` empty; `λ₁δ_0+λ₂δ_0` | intensity `∞` on open sets; `iIndepFun` forces `P(Ω)=1`; `Po(λ₁+λ₂)` | holds | none |
| 6.2 marking | `δ_a`, Bernoulli`(1/2)`, `g = ∞·1{true}`; `C = univ` with Poisson `N` | `1/2` both, exponent `log 2`; `exp(−∫(1−e^{−g}) d(Λ⊗K))` | holds | none |
| 6.3 thinning | binomial `(5,0.4)`, `p=0.3`; trivial σ-algebra, `N = m` | `0.288`; covariance `−0.168`; `m^{(n)}pⁿ` both | holds | none |
| 7.1 translation | `x +ᵥ δ_x`; `add_vadd` in a nonabelian group; `d=0` | `δ_0`; `(z−y)−x = z−(x+y)`; every process stationary | holds | none |
| 7.2 stationary intensity | `δ_U` on the cube; `d = 0`; `γ` as `ℝ≥0` in the Poisson iff | `γ=1`, intensity not `volume`; `volume = δ_0`; `Λ` locally finite | holds | none |
| 7.3 reduced second factorial moment measure | Poisson `γ=3`, `A=[0,1]`, `B=[0.5,2]`; unreduced | `13.5` both; extra `γδ_0` | holds | none |
| 7.4 mixing, ergodicity | void events of the cube, `γ=3`; `d=0` | `e^{−6} = 0.002479`; `cocompact = ⊥`, `{N=0}` invariant with `e^{−γ}` | holds, `d ≥ 1` needed and present | none |
| 8.1 Palm probability | lattice `ℤ^d+U`; `γ = 0`; mass without stationarity | `δ_{ℤ^d}`; `∞·0 = 0`; `γ⁻¹γ = 1` | holds; hypothesis unused | C02 |
| 8.2 refined Campbell | `f = 1_B`; `f = 1_B·1{ξ({0})≥1}` | `γ\|B\|` both; `γ\|B\|` both, `0` without the shift | holds | none |
| 8.3 Slivnyak | planar, `γ=50`, `r=0.08`; lattice | `e^{−1.00531} = 0.36593`; `δ_{ℤ^d} ≠ law(N+δ_0)` | holds | none |

- Source locators checked against the text: 0 of 141 (no text could be read; see Not verifiable).
- Library declarations opened at the pin: `Measure.lintegral_bind` (`Mathlib/MeasureTheory/Measure/GiryMonad.lean:307`); the sixteen `#check` lines of `Suggested.lean` elaborate; the pinned Tau Ceti has no `IsPoissonRandomMeasure`, `laplaceFunctional`, `expNeg` or `IsIntegerValued`, and Mathlib no vague topology on measures.
- Cross-roadmap citations resolved on main: ClassicalErgodicTheory §1.3 (mixing along `cocompact`, mixing ⇒ weak mixing for noncompact `G` ⇒ ergodic), GeometryOfNumbersAndQuadraticArithmetic §4.2 (`configurationMeasure`, `configurationMeasure_apply`, permutation invariance, measurability), RandomMatrices §8.1, StochasticCalculus §0.6, MarkovChainsAndRenewal Layer 7: 5 of 5.
- Dependency check: `depcheck: 2 roadmaps, 7 edges, 0 problem(s)`; no UPWARD or CYCLE line. Both suppliers are on main.
- Elaboration: `Suggested.lean` elaborates with exit 0 and 58 `sorry` warnings, nothing else; no `set_option`, no sorry'd data; `#check`-style comparison of the signatures with the README found the one generality gap of R01.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, one library lemma) on all 58: 1 closes (C01).
- No change outside the roadmap folder. The pull request's description agrees with the head (58 targets, 58 `sorry`, three proved supporting lemmas, two instances, two `AddAction` instances, both suppliers on main).
- Headline theorems of the summary (Palm disintegration, Poisson existence and uniqueness, Mecke, Rényi, Slivnyak–Mecke, refined Campbell, Slivnyak) are all stated in `Suggested.lean`.

Overlap check: read PointProcesses (open, #417), ShotNoiseAndCampbellTheorem (open, #3204), LevyProcesses (open), HardSphereDynamicsAndKineticLimits (open), MarkovChainsAndRenewal, PoissonApproximation, RandomMatrices (main). PointProcesses and this roadmap both own the carriers, laws, Campbell and Palm kernels, factorial and Janossy measures, the Poisson random measure and its operations, stationarity and the stationary Palm theory (its Layers 0–4 and 6–8, `TauCetiRoadmap/PointProcesses/README.md` lines 554–1629 at its head); PointProcesses is on the project's list of roadmaps that are not to be cited as suppliers and is not in the merge order, so this roadmap is the owner here and the question goes to the human reviewers. ShotNoiseAndCampbellTheorem owns a model on the line built from gaps and disclaims the general theory; LevyProcesses and HardSphereDynamicsAndKineticLimits own no random-measure object; RandomMatrices §8.1 and MarkovChainsAndRenewal Layer 7 keep their count-based and line objects, as the Scope section says.

Source independence: 0 passages compared with 0 sources (no source text could be read); largest share LP, 58 of 141 locators; contents not compared with LP. By the README alone, Layers 1 and 3 carry no LP locator in their headline statements and Layer 5 draws on three LP chapters, so the layers are not a run of one source's chapters; this was not checked against the table of contents.

Research link: The README places the roadmap as the common base for determinantal, Gibbs, Cox and cluster processes, random closed sets and tessellations, with the Mecke equation, Palm kernels and the refined Campbell theorem as stated in Last–Penrose (2018), Kallenberg (2017) and Baccelli–Błaszczyszyn–Karray (2024). This rests on the README only.

## Not verifiable

- All source locators, including the fifteen sampled targets (1.1, 1.2, 1.3, 2.3, 3.1, 3.2, 4.1, 5.2, 5.5, 6.1, 6.2, 7.2, 7.3, 8.2, 8.3): the sources service was asked for BBK (its HAL record) and for LP and returned no text in more than ten minutes; K, DVJ1, DVJ2, CSKM and SW are published books with no open copy known to me. The mathematics of each sampled target was checked independently (table above); the theorem numbers and pages were not.
- The statement in 1.2 that Daley–Vere-Jones's `w#`-topology agrees with the vague topology on a locally compact space (it does when bounded sets are relatively compact; DVJ2 not read).
- The claims about Tau Ceti beyond the pin (Prior formalization): outside the pinned library. A newer local checkout does contain `TauCeti.Probability.IsPoissonRandomMeasure` with the body copied here, and `isPoissonRandomMeasure_sum`, `isPoissonRandomMeasure_poissonLaw` and `map_eq_of_laplaceFunctional_eq` with the signatures stated here; the commit `d395922` itself was not opened.
- The lean-MSSS repository named under Prior formalization was not opened.

Automatic checks set aside as false positives: the four hits on a dropped roadmap name are a directory name inside file paths of an external repository in the Prior formalization section, not a citation of that roadmap; the section comment of `Suggested.lean` reported as having no declaration under it is followed by the `#check` lines that pin the consumed library declarations.

## Source issues

- none

## For the human reviewers

- **Scope / ownership.** The open roadmap PointProcesses (#417) plans the same substrate (its Layers 0–4, 6–8); the description says this roadmap covers that part so the spatial family need not wait. Which of the two owns it is not settled in either text.
- **Library newer than the pin.** `Suggested.lean` lines 50–168 declare eight definitions at Tau Ceti's own names (`ENNReal.expNeg`, `MeasureTheory.Measure.poissonLaw`, `TauCeti.Probability.IsPoissonRandomMeasure`, …); the file will not compile once the pin contains them, and about ten Layer 2, 5 and 6 targets are, by the README, already proved there.
- **Not tested.** LP has the largest share of locators (58 of 141); neither its text nor its table of contents, nor any other source, was read, so wording and arrangement were not compared.
- **Licence.** BBK is cited as a 2024 manuscript (README line 969), not a published book; 26 locators rest on it.
- **Reuse.** The README says lean-MSSS (Apache-2.0, by the roadmap's author) proves several targets; whether `Suggested.lean` adapts its declarations was not checked.
