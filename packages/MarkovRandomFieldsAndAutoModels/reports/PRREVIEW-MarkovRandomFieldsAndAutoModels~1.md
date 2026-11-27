# Review of MarkovRandomFieldsAndAutoModels (pull request #3228 at 3c088ad)

**Verdict:** needs changes

**Summary.** Changes are needed, and they are small: every one of the 37 Lean statements and every layer statement survived the adversarial pass, but two sentences of the README assert false mathematics. A Check of 2.1 says that the normalization of the canonical potential becomes false without the nonemptiness hypothesis, when that hypothesis is in fact redundant; and the Summary states convergence of the Gibbs sampler with no positivity hypothesis, which the README's own negative control in 6.4 refutes. There are two small corrections and one format note. None of the eight cited sources could be read legally, so no source locator was verified and the wording and arrangement were not compared with any source; that is left to the human reviewers.

## R01 (P2) — The Check of 2.1 claims that dropping `A.Nonempty` falsifies the normalization conjunct; the hypothesis is redundant and the conjunct stays true without it

A reader of the negative control in 2.1 (README line 317–318) is told that the normalization "is for nonempty `A` only, and dropping `A.Nonempty` makes it false for any `π` with `π(a) ≠ 1`". That is false. The conjunct is "`canonicalPotential π a A x = 0` when `A` is nonempty and `x_i = a_i` for some `i ∈ A`" (line 292–293; in Lean, `A.Nonempty → (∃ i ∈ A, x i = a i) → …`, `Suggested.lean` lines 225 and 234). The second hypothesis already implies the first: no `i` lies in `∅`, so at `A = ∅` the statement without `A.Nonempty` is vacuous, not false, and `V_∅ = log π(a) ≠ 0` does not contradict it. I checked the equivalence of the two forms in Lean at the pins (it is a two-line term proof: from `⟨i, hi, e⟩` one gets `⟨i, hi⟩ : A.Nonempty`).

The smallest change: replace the last clause of that Check by a variant that does fail, for instance "the variant asking `V_A(a) = 0` for every `A` fails at `A = ∅` whenever `π(a) ≠ 1`". The hypothesis `A.Nonempty` could then also go from `canonicalPotential_spec`, from `hnorm` of `eq_canonicalPotential` and from the prose of 2.1, since it changes nothing; keeping it is harmless once the Check no longer says it is needed.

## R02 (P2) — The Summary asserts that sweeps and random scans converge with no hypothesis on the target; without positivity this is false

The last bullet of the Summary (README lines 31–33) says that "a sweep leaves the target invariant, a random scan is reversible, and both converge in total variation uniformly in the initial state". The first two clauses hold for every probability measure, so a reader takes the third at the same generality. It fails there: for `π` uniform on `{00, 11}` every single-site update fixes each configuration of positive mass, and `d(n) = 1/2` for all `n ≥ 1`, which is the README's own negative control in 6.4 (lines 727–728); I recomputed it (from `01` the sweep `[1, 2]` goes to `11` and stays). The theorems of 6.4 carry the hypotheses (`π` positive, the sweep visits every site, `q_i > 0` with sum `1`), and so do their Lean statements.

The smallest change: add the hypotheses to that clause, for example "and, for a positive target, a sweep that visits every site and a random scan with positive site probabilities both converge in total variation uniformly in the initial state".

## C01 — In 1.4 the pointer "(first Check)" for the necessity of the intermediate hypothesis points at the wrong Check

Brook's lemma in 1.4 ends "the hypothesis on the intermediate configurations is needed (first Check)" (line 240–242). The first Check of 1.4 is the positive numerical instance on `{0, 1} × {0, 1, 2}`; the counterexample with `p(1,0) = 0`, `x = (1,1)`, `y = (0,0)` is the second. I recomputed it: `π(x)/π(y) = 1/2`, the first factor is `0/1 = 0` and the second `1/0`, so the product is not `1/2`. Write "(second Check)".

## C02 — The scope does not name HiddenMarkovModels 6.1, which on main already states the contraction under a minorization that Doeblin's bound of 6.4 rests on

HiddenMarkovModels 6.1 on main (`tsum_abs_bind_sub_le`) states that, on a countable space, a kernel whose rows dominate `ε ρ` contracts the `ℓ¹` distance of two laws by `1 − ε`. Doeblin's bound of 6.4 is the `N`-step form of the same fact for Mathlib kernels on a finite type, expressed through `tvToStationary`; its route (rows of `κ^N` equal `ε π + (1 − ε) R_x`) is that proof. The two statements differ in carrier and in the `⌊n/N⌋` exponent, so 6.4 is a variant and not a restatement, but a reader of "Scope and ownership" cannot tell that a neighbour exists. Add one line under the neighbouring roadmaps saying that HiddenMarkovModels 6.1 states the one-step contraction for mass functions on countable spaces, and how 6.4 differs (kernels on a finite type, `N` steps, distance to the stationary law).

## N01 — The first Check of 1.2 reports an experiment instead of a computed instance

"the agreement theorem was tested against the margin identity on 3000 random laws … 1771 of them are Markov" (lines 181–183) narrates a run that a reader cannot reproduce or recompute. One explicit law with a zero, with both sides of the equivalence evaluated, would test the same thing; the three-copies example in the next Check already does most of this.

## Questions for the author

- In 2.3 and 5.1 the density `π` is not assumed measurable, while the route of 5.1 factors the block normalizer into site normalizers (Tonelli on a product of functions of separate coordinates) and that of 2.3 pulls a factor out of the block integral. Pulling out a finite nonzero constant is fine for any function; the product factorization for non-measurable factors is not a lemma I found at the pin. Is `Measurable π` intended in `setConditional_eq_prod_of_isIndepSet`, as in 1.3? I did not refute the statement as written (a lower-integral argument seems to give it), so this is a question.
- The README records four slips in its sources (Rue–Held and the Handbook on the hypothesis of Brook's lemma; Gaetan–Guyon p. 69 on the sign of `log x_i!`, p. 37 on the neighbour relation as an equivalence, p. 193 on the denominator of `k̂`). The mathematics on the README's side of each is right (recomputed below), but I could not read the sources to confirm what they print.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 full conditionals, positivity condition | `{0,1}²`, masses `1/2, 1/4, 0, 1/4`; two copies of a fair bit | marginals at `(1,0)`: `1/4`, `1/2`, mass `0`; site-1 conditional given `x₂=0`: `(1/2)/(1/2+0) = 1` at `0` | Checks true; positivity fails as claimed | none |
| 1.2 `IsMarkovRandomField`, agreement with `IsLocalMarkov` | both directions by hand; zero normalizer; three copies of a bit on path and on edge `2−3` | margin identity `p(x_∂)p(x) = p(x_{i∪∂})p(x_{-i})`; both sides `0` where `p(x_{-i}) = 0`; edge `2−3`: conditional at `1` is `δ_{x₂}`, `∂1 = ∅` | iff holds for every law; controls true | N01 |
| 1.3 `condDistrib` version; `CondIndepFun` | Gaussian pair altered on the null line `x₂ = 0` | normalizer `φ(0)(1/2 + 2·1/2) = (3/2)φ(0)`; conditional `φ(x₁)(1+1_{x₁>0})/(3/2)` vs `φ(x₁)` | a.e. statements true; pointwise property depends on the version, as claimed | none |
| 1.4 Brook's lemma (`brook_factorization`) | telescoping with `u_k = (x_{≤k}, y_{>k})`; `n = 0`; law of 1.1 with `x=(1,1)`, `y=(0,0)` | factor `i` is `π(u_i)/π(u_{i−1})`; `n=0`: `π y/π y = 1` needs `π y ≠ 0`; control: `1/2` vs `0 · (1/0)` | true; `hmid` at `i=0` gives `π y ≠ 0` only when `n ≥ 1` | C01 |
| 1.4 uniqueness (both forms) | `π` vs `2π`; `S = ∅`; `π = 0`; supports via junk values | `π = cπ'` with `c = π(y)/π'(y)`, masses force `c = 1`; `π(x)/Z > 0` forces `π'(x) ≠ 0` | true | none |
| 2.1 canonical potential (`canonicalPotential_spec`, `eq_canonicalPotential`, full-conditional form) | Möbius sum for arbitrary `f(B)`; `A = ∅`; two binary sites; Gaussian with `a = μ` | `∑_A V_A = f(S)`; `V_∅ = log π(a)`; `V_{12}(1,1) = log[π(11)π(00)/(π(10)π(01))]`; `V_{ij} = −Q_{ij} d_i d_j` | statements true; `A.Nonempty` implied by `∃ i ∈ A` | R01 |
| 2.2 Hammersley–Clifford (three forms) | pairing `B`, `B ∪ {k}` for non-adjacent `j, k ∈ A`; `S = ∅`; four-cycle with masses `2, 1` | `V_{13}(1,0,1,0) = 0 − 0 − 0 + log 2`; zero factor `c(x)` off `i` gives normalizer `0`, excluded by the definition | true, both directions; nonnegative case true | none |
| 2.3 block form | `A = ∅`, `{i}`, `S`; infinite block normalizer | `A=∅`: `π(x)/π(x) = 1` both sides; ratio `gF/(g·I) = F/I` for `0 < g < ∞`, also at `I = 0, ∞` | true | none |
| 3.1 Besag's theorem and converse | derivation with `e_i`, `B_i(e_i) ≠ 0`; `β₁₂ = 1, β₂₁ = 0`; auto-exponential | `α_i = A_i(0)`, `β_{ij} = (A_j(e_i) − A_j(0))/B_i(e_i) = β_{ji}`; asymmetric: parameter `α₁ + x₂/2` | true; `hA`, `hD`, `hBne` all used | none |
| 3.2 auto-logistic | `α = (0.2, −0.4, 0.1)`, `β₁₂ = 0.7`, `β₁₃ = −0.3`, `x = (·,1,1)` | `η₁ = 0.6`, `1/(1 + e^{−0.6}) = 0.645656` | true | none |
| 3.3 auto-Poisson | `β = 0`; `β₁₂ = −1`; `β₁₂ = 0.01`; `S = ∅` | sums `8.745940`, `5.725062` (cut-offs 60, 80); truncations `8.8447`; diagonal log `−1724.26` at `k=1000`, `+48251.95` at `3000` | iff true; Checks reproduce | none |
| 4.1 Gaussian conditional specification and converse | completing the square; `C₁₂ = C₂₁ = 1/2`, `κ = (1,2)`; `S = ∅` | `Q_{ii} = 1/κ_i`, mean `μ_i + ∑ C_{ij} d_j`; Brook along two orders: `−1/2` and `−1/4`; cross terms `C_{ij}/κ_i` vs `C_{ji}/κ_j` | true; `PosDef` at the pin includes symmetry | none |
| 4.2 eigenvalue criterion, constancy of `κ`, Gershgorin | star `K_{1,3}`, `φ = 0.3, 0.5, 0.6`; `C₁₂ = 1.5, C₂₁ = 0.6, κ = (1, 0.4)` | `1 − √3 φ = 0.4804, 0.1340, −0.0392`; eigenvalues of `I−C`: `1.9487, 0.0513`; of `Q`: `0.0729, 3.4271` | true | none |
| 4.3 SAR to CAR | `λ = 1`, `b₁₂ = b₁₃ = b₂₃ = 1`; singular `I − C'` in uniqueness | `(I−B)ᵀ(I−B) = [[1,−1,−1],[−1,2,0],[−1,0,3]]`, `C₂₃ = 0`; singular `I−C'` gives `0 ≠ Σ` | true; neighbour statement is an inclusion | none |
| 5.1 coding sets | path `1−2−3`, weight `exp(x₁x₂ + x₂x₃)`, block `{1,2}` at `x = (1,1,1)` | block conditional `0.6103`, product of full conditionals `0.6439` | control true; identity true for independent sets | question on measurability |
| 5.2 pseudolikelihood maximizer | profile in `b` then `k`; `x = c·Wx` | `RSS(b̂) = ⟨x,x⟩ − ⟨x,Wx⟩²/⟨Wx,Wx⟩`, `k̂ = RSS(b̂)/|S|`; `RSS = 0` gives unbounded likelihood | true, maximizer unique | none |
| 6.1 single-site updates | null conditioning set; one site | detailed balance: both sides `π{x}π{y}/π(B)`, or `0 = 0` when `π(B) = 0` | Markov and reversible for every `π` | none |
| 6.2 sweeps | masses `(0.4, 0.1, 0.2, 0.3)`, orders `[1,2]` and `[2,1]` | `00 → 01`: `2/15` and `1/20`; invariance defect `6·10⁻¹⁷`; detailed-balance defect `0.0533` | true; order convention as stated (`κ * η = κ ∘ₖ η` at the pin) | none |
| 6.3 random scans, agreement with Glauber | `q = (0.3, 0.7)`; `S = ∅`; local copy vs MarkovChainMixing 6.1 | least entry of the uniform scan `0`; at `S = ∅` both kernels are `0`; copy identical to the owner's definition | true; not closed by `rfl` or one `simp` | none |
| 6.4 Doeblin's bound and convergence | `N = 0`; `ε ≤ 0`; `ε = 1`; the law of 6.2; uniform on `{00, 11}` | sweep `ε = 0.5`, `d = 0.25, 1.93·10⁻⁴`; scan `ε = 0.2917`, `d = 0.40, 0.141, 0.0993, 5.2·10⁻⁴`; non-positive law `d(n) = 1/2` | theorems true with their hypotheses | R02 (Summary), C02 |

- Source locators checked against the text: 0 of the 80 in the layers (no source readable legally).
- Library declarations opened at the pins: 9 (`Kernel.IsReversible` and `Kernel.Invariant.comp` in `Mathlib/Probability/Kernel/Invariance.lean`, the monoid on `Kernel α α` at `Mathlib/Probability/Kernel/Composition/Comp.lean` line 238, `tvDist` at `Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean` line 62, `Matrix.PosDef` at `Mathlib/LinearAlgebra/Matrix/PosDef.lean` line 176, and Tau Ceti's `multivariateGaussianPDFReal`, `multivariateGaussian_eq_withDensity`, `map_affine_multivariateGaussian`, `condDistrib_multivariateGaussian`); the 37 names pinned by `#check` all resolve.
- Cross-roadmap citations resolved on main: GraphicalModelsAndConditionalIndependence 1.1, 2.2, 2.3–2.4, 3.1–3.2, 3.3; MarkovChainMixing 1.2, 6.1; GibbsMeasuresAndTheIsingModel (spin and energy conventions, README line 90). The five local copies agree with their owners' definitions token for token.
- Duplication: the pinned Mathlib and Tau Ceti contain none of the roadmap's objects (searched for full conditionals, Brook, Hammersley–Clifford, canonical potential, Gibbs updates, Doeblin, Glauber, the distance to stationarity).
- Elaboration of `TauCetiRoadmap/MarkovRandomFieldsAndAutoModels/Suggested.lean` at Mathlib 1b1ccf4 and Tau Ceti 2fd255d: 37 `sorry` warnings and nothing else. `#check @name` types compared with the README: the binders reported as dropped are unused section variables of definitions (`Fintype S` on `fullConditional`, for instance), no hypothesis is lost.
- Padding probes: eight one-tactic attempts (`rfl`, `simp` with the definitions, `infer_instance`, `simp_all`) on the Glauber agreement, the three Markov-kernel statements, invariance of sweeps and constancy of `κ`; none closes.
- Headline theorems: all 37 named results of the README are stated in `Suggested.lean` with the README's hypotheses and conclusions; no definition has a `sorry` body and there is no `set_option`.
- Dependency check output: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`. The pull-request description agrees with the head (a new roadmap, 37 `sorry`, the pins, the suppliers).

Overlap check: read FiniteGibbsPointProcesses, SecondOrderRandomFields, GlauberDynamicsOfTheIsingModel, RestrictedBoltzmannMachines, SimulatedAnnealing (open, at their heads), GraphicalModelsAndConditionalIndependence, MarkovChainMixing, GibbsMeasuresAndTheIsingModel (main); the finite Hammersley–Clifford theorem and Moussouris' law: GraphicalModelsAndConditionalIndependence (cited); the Glauber kernel and the distances `d`, `d̄`: MarkovChainMixing (cited); contraction under a minorization: HiddenMarkovModels 6.1 on main (not cited, C02); nothing else shared.

Source independence: 0 passages compared with 0 sources (none of the eight could be read legally); largest share Gaetan–Guyon, 23 of 80 locators, then Besag 21 and van Lieshout 16; contents not compared with any source.

Research link: Layers 1–3 and 5 state the conditional-specification theory of Besag (1974): Brook's lemma, the Hammersley–Clifford theorem, auto-models and coding; Layer 4 the Gaussian autoregressions of Rue–Held (2005); Layer 6 the Gibbs sampler of Winkler (2003). Rests on the README's references only; no source text was read.

## Not verifiable

- Every source locator of the seeded sample (1.1, 1.2, 1.4, 2.1, 2.2, 3.1, 4.1, 4.2, 4.3, 5.1, 5.2, 6.1–6.4): Besag 1974, Cressie 1993, Gaetan–Guyon 2010, the Handbook 2010, van Lieshout 2019, Rue–Held 2005, Spodarev (ed.) 2013 and Winkler 2003 were asked of the sources service by DOI or by citation; each resolves only to a publisher's paywalled page, and I looked no further.
- The four source slips the README reports (see the questions): the sources were not read.
- Checks computed from unstated random data (1.2: the 3000 random laws; 1.4: `0.8270976`; 2.1: `−2.288394`; 4.1, 4.3 and 5.2: random matrices): the formulas were verified, the printed digits cannot be reproduced.
- Wording and arrangement against the sources: not compared, for the same reason.

## Source issues

- none

## For the human reviewers

- **Not tested.** Gaetan–Guyon (2010) has the largest share of locators (23 of 80), then Besag (1974) with 21; neither text nor table of contents could be read, so wording and arrangement were not checked against them.
- **Licence.** `Suggested.lean` shares declaration names (`brook_factorization`, `exists_autoModel`, `isMarkovRandomField_iff_factorization`, and others) with lean-MSSS, `MSSS/Lattice/MarkovField.lean`, commit 6826ba2, which README "Prior formalization" names as Apache-2.0 and by the roadmap's author; I did not open that repository.
- **Scope.** README "Downstream consumers" names two roadmaps (GaussianMarkovRandomFieldsAndTheSPDELink, GibbsSpecificationsGeneralSpinAndPseudolikelihood) that exist neither on main nor among the open pull requests; they are cited as consumers only.
