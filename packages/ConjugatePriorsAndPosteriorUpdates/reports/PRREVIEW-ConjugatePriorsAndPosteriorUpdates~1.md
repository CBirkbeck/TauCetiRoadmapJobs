# Review of ConjugatePriorsAndPosteriorUpdates (pull request #3201 at 2eea20c)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or route was found false, and every one of the ten theorems of `Suggested.lean` was recomputed on degenerate and concrete instances (values in the table kept on the board). There are two small corrections and two format notes, none blocking. One thing is left open: the text of Diaconis–Ylvisaker (1979), which carries all the locators of Layer 2, could not be read from a legal place, so its theorem numbers, pages and hypotheses were not compared with the roadmap; the mathematics of 2.2–2.6 was checked from the routes written in the README instead, and the human reviewers are told.

## C01 — In the route of 2.5, "for `θ ∉ Θ` it is `0`" fails at `n = 0`

The Conventions allow `n = 0`, and there `P_θ^{⊗ 0}` is the unit mass on the one-point space `Fin 0 → E` whatever `P_θ` is (Mathlib `Measure.pi_of_empty`), also when `P_θ = 0`. So the sentence in the route of 2.5 (line 372) is right only for `n ≥ 1`. Nothing depends on it, since `π Θᶜ = 0`. It would be enough to write "for `θ ∉ Θ` and `n ≥ 1` it is `0`, and `Θᶜ` is `π`-null".

## C02 — "A pointwise claim would be false there" says more than is known

In the Conventions (lines 42–43), on continuous data spaces the posterior kernel is one fixed kernel, and at a point of a null set its value is whatever Mathlib's construction happens to give: an identity at every point is not determined by the defining property of the posterior and is not provable from it, but it is not thereby false. "A pointwise claim is not determined there" would say what is meant.

## N01 — A Check that would show `Θ = E` is needed in 2.3

The Checks of 2.3 test `n₀ ≤ 0` and empty `ι`, but not the hypothesis `Θ = E`. One that could be added: for Lebesgue measure on `(0, ∞)`, `Θ = (−∞, 0)`, `M(θ) = −log (−θ)`, and with `n₀ = −1/2`, `x₀ = −1` the conjugate measure has mass `∫₀^∞ t^{−1/2} e^{−t/2} dt = √(2π) < ∞` although `n₀ < 0`.

## N02 — "the indicator of `Θ`, where `M` has junk values" reads as if the junk were on `Θ`

In the Conventions (line 58) the junk values of `M` are off `Θ`; "off which `M` has junk values" would remove the ambiguity.

## Questions for the author

- Does Theorem 1 of Diaconis–Ylvisaker state the converse of 2.2 (finite mass and `n₀ > 0` force `x₀ ∈ 𝒳`) for every open `Θ`, or only for `Θ = ℝ^d`? The route of 2.2 says that both directions follow Theorem 1, and the description says that the half-cylinder argument for the converse is the roadmap's own. If the source has the converse only for `Θ = ℝ^d`, the sentence at lines 293–294 would better say that the converse for open `Θ` is proved here. The paper could not be read (see below), so this is a question and not a remark; the converse as stated is correct by the route given.
- Is the scalar `a` of 2.6 the form of Theorem 3 in the source in dimension `d > 1` (rather than a matrix)? Same obstacle.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions: posterior at atoms | Mathlib `posterior` is `((μ ⊗ₘ κ).map Prod.swap).condKernel`; `condKernel_apply_of_ne_zero` | value at `x` with `ρ.fst {x} ≠ 0` is `(ρ.fst {x})⁻¹ ρ ({x} ×ˢ s)`: pointwise claims of 1.1–1.3 are determined | sound | C02 (wording) |
| 1.1 Beta–binomial | `(a,b,n,k,j) = (2/3, 5/2, 4, 1, 3)`; `n = 0`; `k > n` | moment ratio 0.0303749406739 both sides; `n = 0`: `Beta(a, b)`; `k > n`: marginal mass 0, excluded by `k ≤ n` | sound | none |
| 1.2 Dirichlet–multinomial | `ι` a singleton; tilting constant; fallback of `extendWeights` | singleton: `Dir(a) = δ₁ = Dir(a + n)`; `D_k = Γ(A₀)∏Γ(aᵢ+kᵢ)/(Γ(A₀+n)∏Γ(aᵢ))` rederived from the Gamma representation; fallback only off the simplex, a null set | sound | none |
| 1.3 Gamma–Poisson | `(α,β,n,S,j) = (7/3, 2/5, 3, 4, 2)`; `n = 0`; example `Gamma(1,1)`, counts `(2,0)` | moment ratio 4.01768550557 both sides; `n = 0`: prior; example gives `Gamma(3,3)`, predictive `NB(3, 3/4)` | sound | none |
| 1.4 Normal–normal | `m=.3, v=2, s=.7, x=(1,−2,.5)`; `v = 0`; `n = 0`; `s = 0` | mean −0.117910447761 both sides, variance 0.208955223881 both sides; `v=0`: `δ_m`; `n=0`: `N(m, v)`; `s=0,n=0,v=1`: formula gives variance 0, prior has 1 | sound | none |
| 1.5 normal–gamma law and update | `m=.3, κ₀=1.5, α=2, β=.8, x=(1,−2)` at three points `(τ, μ)`; `n = 0`; two forms of `βₙ` | ratio prior·likelihood / updated density = 0.00363033480038 at all three points; `βₙ` = 3.32428571429 in both forms; `n=0`: `mₙ=m`, `βₙ=β` | sound | none |
| 1.5 Student marginal | Tau Ceti lemma with `n=2α`, `ρ=2β`, `S=κ₀⁻¹` | Gamma `(n/2, ρ/2) = (α, β)`, scale `(ρ/n)S = β/(ακ₀)`; agrees with Murphy2007 line 530 | sound | none |
| 2.1 conjugate family | Bernoulli, Poisson, normal location; `Measure.tilted` off `Θ` | `Beta(n₀x₀, n₀(1−x₀))`, `Gamma(n₀x₀, n₀)`, `N(x₀, 1/n₀)` after change of variable; tilt off `Θ` divides by integral 0, so zero measure | sound | N02 |
| 2.2 properness | Lebesgue on `(0,∞)`; Bernoulli `x₀=1`; `ι` empty with `ν=0` and with `ν=cδ`; `Θ` empty; `Θ` a point | mass `∫ t^{n₀} e^{−n₀x₀t} dt` finite iff `x₀>0`; Bernoulli density → 1 at +∞; `ν=0`: mass 1, `𝒳=∅` (hypothesis needed); `Θ` a point: mass 0 for every `x₀` (openness needed) | sound, both directions rederived | none |
| 2.3 sign of `n₀` | normal location `n₀ ∈ {0,−1}`; `ν = 0`; `ι` empty; `Θ ≠ E` | integrals infinite; `ν=0`: `f = e^{n₀⟨x₀,θ⟩}`, infinite, vacuous; `Θ=(−∞,0)`, `n₀=−1/2`, `x₀=−1`: mass √(2π) = 2.50662827463 | sound | N01 |
| 2.4 prior mean | Laplace `ν=e^{−|x|}dx`, `Θ=(−1,1)`: `(n₀,x₀)=(2,.5),(1.5,3)`; exponential family; `Θ=∅` | 0.50000000003 vs .5; 3.0000001 vs 3; `E[1/t]` under `Gamma(n₀+1, n₀x₀)` is `x₀`; `Θ=∅`: `π = ∞·0 = 0` | sound | none |
| 2.5 updating | normal location against 1.4 with `m=x₀, v=1/n₀, s=1`; `n = 0`; `θ ∉ Θ` | variance `1/(n₀+n)` and mean `(n₀x₀+∑x)/(n₀+n)` on both sides; `n=0`: `y=x₀`; `P_θ^{⊗0}` is the unit mass | sound | C01 |
| 2.6 characterization | conjugate prior (`a=1/(n₀+1)`); uniform prior, Laplace family (`a=1`, `b=0`), `x=.7,−2`; two-point prior, Bernoulli; `π=δ`; `ι` empty; `Θ=∅` | `a⁻¹b=n₀x₀`, `a⁻¹(1−a)=n₀`; posterior means 0.69999999997, −1.9999999998; two-point: 0.6068 at `x=1`, 0.3932 at `x=0`, `a=0.2136`, no density; `ι` empty and `Θ=∅` contradict hypotheses | sound; route followed step by step, signs of the gradient equation rechecked | none |
| Headlines in `Suggested.lean` | ten theorems, one tactic each (`rfl`, `simp`, `simp_all`, `infer_instance`) | none closes; all ten name the roadmap's objects | no padding | none |

- Source locators checked against the text: 7 of 15 (Gelman et al. §2.4 p. 35, §2.5 (2.11)–(2.12) pp. 41–42, §2.6 p. 44, §3.4 p. 69; Murphy2007 lines 153, 182, 513–520, 530); 8 not checked (Diaconis–Ylvisaker).
- Library declarations opened at the pins: 28 in Mathlib (among them `Probability/Kernel/Posterior.lean` lines 70, 113, 287; `Probability/Kernel/Disintegration/StandardBorel.lean` line 389; `MeasureTheory/Measure/Support.lean` lines 59, 202) and 18 in Tau Ceti (among them `MultivariateT/Basic.lean` line 171, `MultivariateT/PDF.lean` line 386, `DirichletMultinomial/Basic.lean` lines 46, 147); every supplier-contract description agrees with the declaration.
- Cross-roadmap citations resolved on main: 8 (MathematicalStatisticsFoundations 3.1, 3.3, 3.5, 9.4, Layers 3 and 7; DenoisingDiffusion 1.2; KalmanFiltering Layer 3). The three copied definitions agree character for character with `TauCetiRoadmap/MathematicalStatisticsFoundations/Suggested.lean` lines 190–200; the namespaces differ, so no fully qualified name is shared.
- Duplication by object: neither pinned library has a posterior identity for these laws or a conjugate family of an exponential family; no roadmap on main or open states one (searched for conjugate priors, the source's authors, the normal–gamma law and the posterior laws).
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: ten `sorry` warnings and nothing else; the 15 elaborated signatures were compared with the README statements, no binder lost, generality equal.
- The pull request's text: read against the head; no sentence contradicted (10 theorems, 5 definitions, 3 copied, the three Tau Ceti imports, suppliers as stated).
- Change outside the folder: none.

Overlap check: read PolyaUrnsAndExchangeableSequences, DiscriminantAnalysisAndLogisticRegression, CharacterizationsOfTheNormalLaw, EvidenceLowerBound, RestrictedBoltzmannMachines, StandardDistributions, MathematicalStatisticsFoundations, MathematicalStatisticsSemiparametric; nothing shared. The posterior mean of the urn bias is PolyaUrnsAndExchangeableSequences 3.4 and is excluded here; StandardDistributions excludes priors and posteriors; the natural exponential family definitions are owned by MathematicalStatisticsFoundations 3.1 and copied with attribution; the normal–gamma law and the conjugate family are owned here.

Source independence: 7 passages compared with 2 sources (Gelman et al., Murphy2007), none shared; largest share DiaconisYlvisaker1979, 8 of 15 locators; its text and table of contents could not be read, so wording and arrangement were not compared with it. The order 2.2 → 2.4 → 2.5 is forced by the Needs lines of 2.4 and 2.5.

Research link: Layer 2 states Theorems 1–3 of Diaconis and Ylvisaker (1979) on conjugate priors of natural exponential families, on the exponential families of MathematicalStatisticsFoundations Layer 3; Layer 1 identifies Mathlib's posterior kernel for the textbook updates (Gelman et al. 2013). Rests on the README; the 1979 paper was not read.

## Not verifiable

- DiaconisYlvisaker1979, all locators (family (2.3) pp. 271–272; Theorem 1 p. 272; Theorem 2 p. 273; (2.9), Remarks and (2.10) p. 274; Theorem 3 p. 275): the DOI's landing page gave no PDF link and Project Euclid refused the automated request for the PDF; a copy under an address naming no author was refused as a third party's; no local copy. The text has been requested.
- The sentence of 2.6 on how the source reads the conditional expectation (lines 411–412): same text.

## Source issues

- none

## For the human reviewers

- **Not tested.** DiaconisYlvisaker1979 has 8 of the README's 15 locators and is the only source of Layer 2 (sections 2.1–2.6); its text was unreadable, so wording, arrangement and locators were not compared with it.
- **Licence.** Murphy2007 (README References, last entry) is an unpublished note on its author's page; it is cited for 1.4 and 1.5 beside Gelman et al., and only its equation numbers are used.
- **Scope.** Layer 1 (sections 1.1–1.5) consists of textbook conjugate updates, cited to a textbook and a note; the refereed research source of the roadmap is the 1979 paper behind Layer 2.
