# Review of MarkovDiffusionOperators (pull request #3148 at 23492cb)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 77 lines changed since `5e13b1a` finds no blocking point. The one finding of the previous review is repaired (Prékopa's theorem is now cited from the pinned Tau Ceti, and Layer 11 keeps only the second-order bound, which I recomputed), and the new arguments in Layers 2, 8, 9 and 10 are correct as written. There are three small corrections and two format notes, none blocking. The book [BGL] still could not be read legally; that, a licence question, the library pin and the future-roadmaps subsection are left for the human reviewers.

## C01 — In the criterion for `LS(C)` the letter `g` stands for two functions inside one parenthesis

In Layer 8 (README line 195) the integration by parts is stated for `k` and `g`, and then: "here `g = Γ(log P_t f)`, with `LΓ(g) = 2Γ₂(g) + 2Γ(g, Lg)` in `L¹` by Layer 5". Read literally the second formula is about `LΓ(Γ(log P_t f))`. What is meant, and what the argument needs, is `Lg = LΓ(v) = 2Γ₂(v) + 2Γ(v, Lv) ∈ L¹` with `v = log P_t f`. The same bullet also uses `g` for the `A₀` part of `f = c + g`. Naming `v = log P_t f` and writing `g = Γ(v)`, `Lg = 2Γ₂(v) + 2Γ(v, Lv)` removes the ambiguity. The argument itself is sound: with `ζ_j k ∈ A₀`, `∫ ζ_j k Lg → ∫ k Lg` by domination, `∫ ζ_j Γ(k, g) → ∫ Γ(k, g)`, and `|∫ k Γ(ζ_j, g)| ≤ ‖k‖_∞ ℰ(ζ_j)^{1/2} ℰ(g)^{1/2} → 0`.

## C02 — Two of the facts taken from OrnsteinUhlenbeckSemigroup are attributed to the wrong place

In the Ornstein–Uhlenbeck item of Layer 9 (line 210) and in the new supplier contract (line 351), "the Mehler form (§1.2)" and "Mehler's formula (§1.2)" are given as the source of `Q_t f(x) = ∫ f(e^{−t}x + √(1 − e^{−2t}) y) dγ(y)`. At that roadmap's head this integral formula is the second fact of §1.1 (there called the Mehler form); §1.2 is Mehler's kernel and its Hermite expansion, which the identification `P_t = Q_t` does not use. Also, the contraction of `Lᵖ(γ)`, `1 ≤ p < ∞`, "by Jensen and invariance" is listed under "Proved here", and it is the third fact of that §1.1, with the same proof. Cite §1.1 for the integral formula and for the `L²(γ)` contraction; the symmetry, the strong continuity and the identification of the generators remain this roadmap's.

## C03 — The docstring of `gibbsMeasure` says integrability is needed in `gibbs_brascampLieb`, and the Lean statement holds without it

`Suggested.lean` line 203: "the hypothesis `hint` … is needed in `gibbs_brascampLieb` (`V = eˣ`)". For `V = eˣ` the function `e^{−V}` is not integrable, so `volume.tilted (−V) = 0` (Mathlib `MeasureTheory.tilted_of_not_integrable`, `Mathlib/MeasureTheory/Measure/Tilted.lean`, line 46), the variance and the lower integral are both `0`, and the inequality reads `0 ≤ 0`; a scratch copy of the statement with `¬ Integrable` in place of `hint` closes by `simp` with that lemma. What the example shows is that positive-definiteness of the Hessian does not imply integrability, so there `hint` is what makes `μ_V` a probability measure and the statement non-trivial. Saying that instead of "needed" would be exact.

## N01 — [HelfferSjostrand] is still cited without a locator

Layer 11, line 253, cites the article as a whole; the other references of the layer carry a theorem or a page.

## N02 — Two sentences still tie the text to the library's branch

"are consumed from Tau Ceti `main`" (README line 331) and "implemented on Tau Ceti `main` as" (`Suggested.lean` line 39) will be out of date at the next change of pin. The fact they record is correct today: those files are absent at the pinned commit.

## Questions for the author

- Layer 6 says that [BGL, Theorem 3.3.23] states the finiteness of `μ` without ergodicity, and Layer 10 that [BGL, Theorem 8.5.3] is stated for `f ∈ A₀`. Does a standing convention of the book at these theorems supply ergodicity, or the constants? The book could not be read, and the errata has no entry for either theorem.

## Previous findings

- R01 — repaired: "Prékopa's theorem itself is in Tau Ceti: `TauCeti.LogConcave.lintegral_prod_right`, with `TauCeti.hasPrekopaLeindler_volume`… The target here is the second-order bound"; Scope lists "Prékopa's theorem to Tau Ceti" and owns only "the quantitative form".
- C01 — repaired: the description now says ten `sorry`s, the three imports, the restated profile, and names OrnsteinUhlenbeckSemigroup, LogConcaveFunctionalInequalities and OptimalTransport §11.9.
- C02 — repaired: "which `Suggested.lean` here restates" (line 231); "The future roadmaps of the list below" (line 272).
- C03 — repaired, with one slip (C02 above): "*Needs:* Layers 5–8; OrnsteinUhlenbeckSemigroup §§1.1–1.3 and 2.1 (the kernel semigroup)" and a "From TauCetiRoadmap.OrnsteinUhlenbeckSemigroup" contract; the description names the dependency.
- N01 — repaired: no pull-request number remains in the README.
- N02 — repaired: the bullet "Bounded Lipschitz functions are in `𝒟(ℰ)`" (line 216) is indented with its neighbours.
- N03 — partly repaired: the seven profile lemmas carry `TauCeti.Probability.`, "not from the pinned commit" is gone; "consumed from Tau Ceti `main`" remains (N02 above).
- N04 — not repaired: "[HelfferSjostrand; BGL, Lemma 4.9.2, (4.9.2)]" (N01 above).
- N05 — repaired: `gibbsMeasure V := volume.tilted (fun x => -V x)`.
- Question on [Hörmander, Theorem 2.2.1] — answered in the text: "stated there for the `∂̄` operator and is cited for the method".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.3 `L^∞` extension as adjoint of the `L¹` contraction | `f ∈ L² ∩ L^∞`, `g ∈ L¹ ∩ L²`; `0 ≤ f_k ↑ f` | `∫ P_t f · g = ∫ f · P_t g` (symmetry). `∫ P_t f_k · g = ∫ f_k P_t g ↑ ∫ f P_t g` for `g ≥ 0`, so `P_t f_k ↑ P_t f` a.e. | sound; locators not read | none |
| Layer 8 criterion: integration by parts for `Lg ∈ L¹` | `ζ_j k ∈ A₀`; `ψ(h_j)`, `h_j → 1` in form norm | third term `≤ ‖k‖_∞ √ℰ(ζ_j) √ℰ(g) → 0`; `Γ(ψ(h_j)) ≤ ‖ψ'‖²_∞ Γ(h_j)` | sound | C01 |
| Layer 8, `LS((n−1)/(ρn))` under `CD(ρ, n)` | `f = e^g`, `g = log f` | `Γ(g) = Γ(f)/f²`, `Lg = Lf/f − Γ(f)/f²`; criterion's inequality becomes `∫e^gΓ(g) ≤ C∫e^gΓ₂(g)`, `C = (n−1)/(ρn)` | sound; Props 3.3.6, 3.3.17 not read | none |
| Layer 9, `P_t = Q_t` for Ornstein–Uhlenbeck | generator `B` of `Q_t` | `B` self-adjoint, `B ⊇ L|C_c^∞`, so `B ⊇ L̄`; `L̄` self-adjoint, hence maximal symmetric: `B = L̄` | sound | C02 |
| Layer 10, local Bobkov with `K = I² + c_αΓ + ε` | `c_α' `; sign of extra terms; `Γ + ε` variant | `c_α' = 2(1 − ρc_α) = −2(ρα − 1)e^{−2ρt}`. Extra terms `4εI'²Γ + 4c_αε(Γ₂ − ρΓ) ≥ 0`. Variant adds `c_α' ε < 0` when `ρα > 1` | sound | none |
| Layer 10, non-measurable `A` | closure `Ā` | `A_r = Ā_r`, `μ(Ā) ≥ μ*(A)`, `p ↦ Φ(Φ⁻¹(p) + √ρ r)` increasing; derivative at `r = 0`: `√ρ I(p)` | sound | none |
| Layer 11, quantitative Prékopa | `W = x²/2 + btx + at²/2`; general `Λ''` | `Λ' = E[∂_sW]`, `Λ'' = E[∂²_sW] − Var(∂_sW)`. Example: `a − b²` on both sides, equality; `≥ 0` iff `a ≥ b²` | sound | none |
| Future roadmaps: Bochner–Lichnerowicz | flat `ℝᵈ`, `L = Δ − ∇V·∇` | `Γ₂(f) = ‖∇²f‖² + ∇²V(∇f, ∇f)`, as in Layer 9 with `Ric = 0` | sound | none |
| `gibbsMeasure` (`volume.tilted (−V)`) | `e^{−V}` integrable; not integrable | probability (`isProbabilityMeasure_tilted`); `0` (`tilted_of_not_integrable`) | sound | C03 |
| `invHessian` (`(hessianOperator V x).inverse`) | against the former body | `rw [TauCeti.fderiv_gradient]` identifies it with `inverse (fderiv ℝ (gradient V) x)` | unchanged object | none |
| `gibbs_brascampLieb` | `¬ Integrable e^{−V}` | both sides `0`; closes by `simp [tilted_of_not_integrable]` | true; trivial there | C03 |

The rows for the statements the change does not touch stand as in the previous review, of `5e13b1a`.

- Source locators checked against the text: none new; the changed passages cite only [BGL], [FOT], [Davies], [Hörmander], [CorderoErausquin2005], none of which could be read.
- Library declarations opened at the pin: `TauCeti.hessianOperator` and `TauCeti.fderiv_gradient` (`TauCeti/Analysis/Calculus/Morse/Linearization.lean:96, 101`); Mathlib `MeasureTheory.Measure.tilted`, `tilted_of_not_integrable`, `isProbabilityMeasure_tilted` (`Mathlib/MeasureTheory/Measure/Tilted.lean:42, 46, 125`). The form semigroup and the profile are still absent at the pin, as the README says.
- Cross-roadmap citations resolved at the open heads: OrnsteinUhlenbeckSemigroup §1.1 (composition law, the integral formula, `Lᵖ` contraction), §1.2 (Mehler's kernel), §1.3 (reversibility, invariance), §2.1 (backward equation for `C²` functions of polynomial growth, which covers `C_c^∞`), §2.4; LogConcaveFunctionalInequalities §§2.3, 2.4.
- Automatic checks: all passed. Dependency check: `depcheck: 94 roadmaps, 1055 edges, 0 problem(s)`; no upward or cyclic line. The pull request changes nothing outside the folder.
- Elaboration of `TauCetiRoadmap/MarkovDiffusionOperators/Suggested.lean`: ten `sorry` warnings, nothing else; no `set_option`, no sorried data. The two changed definitions take all their arguments explicitly; the theorem signatures did not change.
- The pull request's title and description agree with this head (ten `sorry`s, three imports, the open dependency, the consumed Tau Ceti declarations).

Overlap check: read LogConcaveFunctionalInequalities, OrnsteinUhlenbeckSemigroup, GaussianIsoperimetryAndClusters; shared, with owners as the previous review found and the README states: the Gibbs Poincaré and logarithmic Sobolev inequalities (LogConcaveFunctionalInequalities §§2.3–2.4, second proof here), the Ornstein–Uhlenbeck kernel semigroup, Mehler's formula and Hermite eigenfunctions (OrnsteinUhlenbeckSemigroup), the Gaussian profile and Gaussian isoperimetry (GaussianIsoperimetryAndClusters §1.1, Layer 8); Prékopa's theorem is now left to the pinned Tau Ceti.

Source independence: changed passages only; no passage could be compared, since none of the sources they cite could be read; largest share BGL, as in the previous review; no layer was added, removed or reordered, so the arrangement was not compared again, and the contents of [BGL] remain unread.

Research link: Layers 6–8 and 10 are the `Γ₂` results of Bakry–Émery theory in the form of Bakry, Gentil and Ledoux (2014), with the semigroup proof of Gaussian isoperimetry; Layer 11 is the Brascamp–Lieb inequality (1976) by Hörmander's method and the Helffer–Sjöstrand representation (1994). Rests on the README's references; of these only the errata was read.

## Not verifiable

- Every [BGL] locator, including the sampled 2.3 as changed (§§1.7, 3.1) and Propositions 3.3.6, 3.3.17, 5.7.3, Theorem 5.7.4 and (5.7.6)–(5.7.12) of the rewritten Layer 8 route: the book resolves only to a paywalled page.
- [FOT, Theorem 1.4.1], [Davies, §1.3], [Hörmander, Theorem 2.2.1], [CorderoErausquin2005, p. 402], [BrascampLieb, Theorem 4.1], [HelfferSjostrand]: paywalled or no legal copy found.
- Whether the Lean statements resemble the external formalisation named in the Provenance section: not compared.

## Source issues

- none

## For the human reviewers

- **Not tested.** [BGL] carries most of the README's bracketed citations; neither its text nor its table of contents could be read, so wording and arrangement were not compared with it, including the six subjects of README lines 308–313.
- **Licence.** The Provenance section (README line 359) names an Apache-2.0 repository by the pull request's author that formalises [BGL]; `Suggested.lean` was not compared with it.
- **Library pin.** Layer 2 builds the semigroup with `IsCoercive.formSemigroup`, and Layers 7–10 use `PoincareInequality`, `LogSobolevInequality`, `entropy` and the profile; none is at the pinned Tau Ceti commit, all are on the library's main branch (README line 331 says so).
- **Scope.** README lines 305–315 describe six future roadmaps and say "Contributors should not work from it"; whether a roadmap should carry such a plan is not decided here.
