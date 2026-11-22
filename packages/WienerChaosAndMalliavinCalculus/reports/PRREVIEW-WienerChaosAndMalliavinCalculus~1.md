# Review of WienerChaosAndMalliavinCalculus (pull request #2972 at 7adeffa)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding: four prose targets (Stroock's formula in 3.2, the general Skorokhod isometry in 5.3, the domain of L in 6.2, the derivative of the Itô integral in 7.2) are stated on Sobolev spaces and derivatives that no layer defines and that the README's own closing section places outside the roadmap. Every statement of `Suggested.lean` was recomputed on degenerate cases and worked examples and none was found false; the file elaborates with `sorry` as its only warning and no theorem closes with one tactic. There are five small corrections and three format notes, none blocking. None of the five cited books could be read legally, so no locator was checked against its text; that is left to the human reviewers.

## R01 (P2) — Four prose targets are stated on objects that no layer defines and that "Beyond this roadmap" excludes

An implementer cannot state these targets from the README, and the README says two contradictory things about whether they belong to it. Layer 4 defines the derivative only for real-valued functionals, once (the closed graph in `Lp ℝ 2 P × Lp H 2 P`, §4.2). The following targets need more:

- §3.2, line 289: Stroock's formula `f_q = E[D^q F]/q!` "for F in the Sobolev space of order q" needs the iterated derivative `D^q` and `𝔻^{q,2}`. It also sits in Layer 3, whose *Needs:* line (§§2.1, 3.1) does not reach Layer 4.
- §5.3, line 497: `𝔻^{1,2}(H) ⊂ Dom δ` with `E δ(u)² = E‖u‖² + E⟨Du, (Du)*⟩` and `D_h δ(u) = ⟪u, h⟫ + δ(D_h u)` needs the derivative of an `H`-valued functional, with values in `L²(Ω; H ⊗ H)`.
- §6.2, line 564: "the domain of L is the Sobolev space 𝔻^{2,2}" needs the second derivative (with the chaos definition of `𝔻^{2,2}` it would be the definition of `ouGeneratorDom`).
- §7.2, line 664: the formula for `D_t ∫ u dB` needs `𝔻^{1,2}(L²[0, T])` and `D_t u_s`.

Against this, "Beyond this roadmap" (lines 775–781) lists "the Sobolev spaces 𝔻^{k,p}", "iterated derivatives, Stroock's formula in full", and item 5 of "Completion means" (line 702) limits the Skorokhod isometry to elementary processes.

The smallest change is one of two. Either add to Layer 4 a subsection that defines the derivative of functionals with values in a real Hilbert space `K` (the closure of the gradient on `K`-valued smooth cylinders, into `L²(Ω; H ⊗ K)` with the Hilbert tensor product, and where that tensor product comes from) and the second derivative with `𝔻^{2,2}`, and move the Stroock target after it; or move these four targets to "Beyond this roadmap". In either case make item 5 of "Completion means" and the "Beyond" list agree with the layers.

## C01 — Two statements carry a hypothesis they do not use

`IsIsonormal.integral_divergence` assumes `gaussianL2 W P = ⊤`, but mean zero holds without it: `divergence W P u` is some `G` with `IsDivergence W P u G`, the constant `1` is a smooth cylinder functional (n = 0) with gradient 0, and testing against it gives `E G = ⟪D1, u⟫ = 0`. The generation hypothesis is needed only where the value of the divergence must be unique (§5.2, §5.3, §6.2). Likewise `IsIsonormal.chaosProj_zero` does not use `hW`: `wickPower W 0 h` is the constant 1 for every `W`. Dropping `hgen` from the first makes the Check of 5.3 on `W(h)²` independent of the generation hypothesis; the second is already marked as a sanity check.

## C02 — The proof route of 3.3 uses §6.4, which its *Needs:* line does not list

The route (line 308) gets continuity of `(f, g) ↦ I_p(f) I_q(g)` from "the hypercontractive bound of §6.4", three layers later, while *Needs:* says §§3.1–3.2. There is no cycle (Layer 6 does not use Layer 3), but an implementer working in layer order meets an input that is not yet there. Either make Nualart's direct estimate the route and the hypercontractive bound the alternative, or add §6.4 (moment equivalence on a chaos) to the *Needs:* line.

## C03 — Two proof routes of Layer 6 use finite-dimensional inputs that have no owner in this README

The route of 6.1 (line 543) rests on "the one-dimensional Mehler identity", `∫ Heₙ(e^{−t}x + √(1 − e^{−2t}) y) dγ(y) = e^{−nt} Heₙ(x)`, which is neither a target here nor in the pinned Tau Ceti (no Mehler statement at the pin; the Hermite files have the bases only) nor cited from a supplier; and the alternative route of 6.4 (line 615) uses "the finite-dimensional theorem" of Nelson, while "Scope and ownership" says the roadmap that owns it is not consumed. State the Hermite identity as a prose target of 6.1 (its n = 2 case is already the Check at line 624), and either drop the alternative route of 6.4 or name its supplier.

## C04 — "The CKMA synopsis of area 09" is cited without saying what it is

Lines 732–734, 775 and 783 number results by "CKMA 09.1–09.16". The abbreviation is not expanded, is not in the References, and occurs in no other roadmap on main, so a reader cannot follow the pointer. Give the document's full name and where it is, or remove the three mentions.

## C05 — The scope section does not say how §1.2 relates to the exponential density of StochasticCalculus §6.1

StochasticCalculus §6.1 on main plans "density of exponential/cylinder Gaussian functionals" and an orthonormal basis of Hermite products on a finite grid, for Brownian motion, as the engine of the martingale representation theorem. `IsIsonormal.closure_span_exp` (§1.2) and `IsIsonormal.hermiteProduct_spec` (§2.2) are the same facts for an arbitrary isonormal process. The statements differ in generality, so both may stand, but "Not owned here" should say so in one clause (the Brownian grid forms belong to StochasticCalculus §6.1; the forms here are for a general `H` and are not consumed there).

## N01 — TeX-style subscripts and superscripts outside code spans

About ninety places write `^{…}` or `_{…}` in running text, for example `h^{⊗q}` (line 257), `I_{p+q−2r}` (line 302), `𝔻^{1,2}` (line 362 onwards), `e^{−nt}` (line 526). Put each formula in a code span or write it in Unicode.

## N02 — Sentences that describe the state of the project on one day

"An open roadmap on the Ornstein–Uhlenbeck semigroup" (lines 42, 719), "separate open roadmaps" (line 727), "a planned roadmap" (lines 687, 788), "formalized in Tau Ceti beyond the pinned version" (line 730) and "no open Mathlib pull request" (line 748) will be false or unverifiable later. Name the roadmaps (OrnsteinUhlenbeckSemigroup, BooleanFunctionAnalysis) and drop the statements about what is open, planned or beyond the pin.

## N03 — The module docstring does not name the headlines that are not statable

The docstring of `Suggested.lean` says the other headlines are "stated there in prose". For Layer 7 the reason is that the pins have Brownian motion (`ProbabilityTheory.IsBrownianReal`) but no Itô integral, so iterated Itô integrals, Skorokhod = Itô and Clark–Ocone cannot be stated; one sentence saying this would complete it.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 `IsIsonormal`, existence, laws, linearity, independence | H = 0; h = 0; H not complete | W(0) = 0 a.s., law δ₀ = N(0, 0); `IndepFun` with a constant ↔ ⟪0, g⟫ = 0; Lean has no `CompleteSpace`, route passes to completion | sound |
| 1.2 `wickPower`, covariance | h = 0 with n = 0, 2; n = m = 2, 3, 4; unnormalised | 0/0 gives He₂(0) = −1 but ‖h‖² = 0 kills it; 2ρ², 6ρ³, 24ρ⁴; 2c²; n = m = 0 gives 1 = 0!·1 | sound |
| 1.2 `closure_span_exp` | H = 0; W(0) nonzero on a null set | span = constants; classes measurable for σ(W(0)) are a.e. constants | sound |
| 2.1 chaos, orthogonality, density, expansion | n = 0; H = 0, n ≥ 1; F = 1{W(h) > 0} | chaos₀ = span{1}; chaosₙ = 0; ∑‖JₙF‖² = 0.48358 at n ≤ 59, limit 1/2 | sound |
| 2.2 `hermiteProduct_spec` | ι empty; a = (2) | single vector Φ₀ = 1 orthonormal, span = constants; without 1/√2 the norm is √2 | sound |
| 3.1 `IsMultipleWienerIntegral`, isometry, range | q = 0; T = {a, b}, f = 1{(a, b)} | I₀(c) = c; ‖f̃‖² = 1/2, E I₂(f)² = 2·1/2 = 1 ≠ 2‖f‖² | sound |
| 3.3 contraction and product formula | p = q = 1; (2, 2); (2, 3); p = 0 | W(f)W(g) = I₂ + ⟪f, g⟫; He₂² = He₄ + 4He₂ + 2; He₂He₃ = He₅ + 6He₃ + 6He₁; index maps total for r ≤ min | sound |
| 4.1 integration by parts on cylinders | n = 0; h = 0; f = x², ‖k‖ = 1, h = k | 0 = c·E W(h); 0 = 0; E[2W·1] = 0 = E[W³] | sound |
| 4.2 closability, derivative, graph | F = 1 (n = 0); Ω larger than σ(W) | D1 = 0; limit G is σ(W)-measurable, so testing on functionals of W suffices | sound |
| 4.3 chain rule | m = 0; φ(x) = x² on [0, 1] with A an event | constant has derivative 0; D1_A = 2·1_A·D1_A forces D1_A = 0 | sound |
| 4.4 chaos description, Poincaré | F = W(h)²; F = W(h); F = 1{W(h) > 0} | E‖DF‖² = 4 = 2·‖J₂F‖²; Var = 2 ≤ 4; equality ‖h‖²; ∑ n‖JₙF‖² = 0.298, 0.392, 0.561, 0.798 | sound |
| 4.5 constants, indicators | P(A) ∈ {0, 1}; A not determined by W | constant class is in 𝔻^{1,2}; indicator outside `gaussianL2`, both sides false | sound |
| 5.1 divergence, domain, mean zero | c < 0; F = 1; extra independent Z | F = 1 gives 0 ≤ c, so c ≥ 0; E δ(u) = 0 without generation (C01); G + Z also a divergence | sound, C01 |
| 5.2 product rules | u = W(h)h; F in chaos n, unit h | δ = W(h)² − 1; ‖δ(Fh)‖² ≤ (n + 1)‖F‖², so F W(h) − ⟪DF, h⟫ ∈ L² on 𝔻^{1,2} | sound |
| 5.3 elementary processes | u = W(h)h; u = W(h)g, h ⟂ g | 2 = 1 + 1; 1 = 1 + 0 | sound |
| 6.1 semigroup, Mehler, positivity, Lᵖ | t = 0; f = x²; F outside `gaussianL2`; F in chaos n, t < 0 | f(W); e^{−2t}(x² − 1) + 1; P₀F = projection, statements restrict; single term, e^{−nt}F | sound |
| 6.2 generator, L = −δD, pseudo-inverse | F = W(h)²; n = 0 term | 2 − 2W² = −2He₂; 0⁻¹ = 0 gives L L⁻¹F = F − E F | sound |
| 6.3 commutation, integration by parts | F = G = W(h), g = sin | E[W sin W] = e^{−1/2} = E[cos W]·1 | sound |
| 6.4 log-Sobolev | F = exp(λW); F = 0 | both sides 2λ²e^{2λ²}; 0·log 0 = 0 | sound |
| 6.4 Nelson | q ≤ 0; 0 < q < 1; p = 1; F = e^W, p = 2, e^{2t} = 3 | exponent 0 gives 0; monotone norms; q ≤ 1; ‖P_tF‖₄ = e = ‖F‖₂; q = 10 gives e² > e | sound |
| 6.4 moment equivalence | He₂, q = 2, r = 4 | 60^{1/4} = 2.783 ≤ 3√2 = 4.243; exponent 1/2 gives 2.449 < 2.783 | sound |
| 7.1–7.3 Brownian realization (prose) | F = B₁³ | E[D_tF \| 𝓕_t] = 3(B_t² + 1 − t); 9∫₀¹(2t² + 1)dt = 15 = E B₁⁶ | sound |
| Prose targets of 3.2, 5.3, 6.2, 7.2 | objects needed against layers | D^q, 𝔻^{q,2}, 𝔻^{2,2}, 𝔻^{1,2}(H): defined in no layer; listed under "Beyond" | R01 |

- Source locators checked against the text: 0 of 155 (no cited text could be read legally).
- Library declarations opened at the pin: `ProbabilityTheory.IsGaussianProcess` (Mathlib/Probability/Distributions/Gaussian/IsGaussianProcess/Def.lean:30), `MeasureTheory.lpMeas` (Mathlib/MeasureTheory/Function/ConditionalExpectation/AEMeasurable.lean:88), `ProbabilityTheory.stdGaussian` (Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:65), `MeasureTheory.Measure.infinitePi` (Mathlib/Probability/ProductMeasure.lean:354), `ProbabilityTheory.IsBrownianReal` (Mathlib/Probability/BrownianMotion/Basic.lean:302), `TauCeti.gaussianHermiteHilbertBasis` (TauCeti/Probability/Distributions/Gaussian/Hermite/Basis.lean:138), `TauCeti.gaussianHermitePiBasis` (TauCeti/Probability/Distributions/Gaussian/Hermite/Pi/Basis.lean:54), `TauCeti.hasSum_gaussianHermitePi_expansion` (…/Pi/Parseval.lean:132).
- No isonormal process, Wiener chaos, Malliavin derivative, Mehler formula, Ornstein–Uhlenbeck semigroup or stochastic integral in the pinned Mathlib or Tau Ceti (searched by object).
- Cross-roadmap citations resolved on main: StochasticCalculus §1.3 (isonormal map from deterministic L² integrands, README line 846), Layer 3, §6.1 (L² martingale representation, line 1923), Layer 8, Layer 9, scope sentence on infinite-dimensional noise (line 3679); RandomMatrices §2.2 (line 318). All exist and say what is claimed.
- Dependency check: `depcheck: 154 roadmaps, 1769 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: no error, `sorry` the only warning. `#check @name` for every declaration elaborated in a probe copy and compared with the README: the definitions of Layer 3 drop `[SigmaFinite μ]` (their types do not mention it; every theorem carries it), nothing else changed.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp` with the definitions unfolded) on all 45 theorems: none closes.
- Pull request text against the head: 45 theorems, 45 `sorry`, 56 named headlines, 21 prose targets, imports and suppliers all as described.

Overlap check: read OrnsteinUhlenbeckSemigroup (open), YoungIntegrationAndRoughPaths (open), StochasticCalculus and RandomMatrices (main); LawOfTheIteratedLogarithm, DysonBrownianMotion and MathematicalStatisticsNonparametric searched by object, nothing shared. Finite-dimensional Mehler kernel, generator and Nelson: OrnsteinUhlenbeckSemigroup (it excludes the infinite-dimensional case, chaos moment bounds and Malliavin calculus). Finite-dimensional Poincaré and logarithmic Sobolev: RandomMatrices §2.2. Brownian exponential density and grid Hermite basis: StochasticCalculus §6.1 (C05). Chaos, multiple integrals, D, δ, the Wiener-space semigroup: this roadmap, no other owner.

Source independence: 0 passages compared with 0 sources (none of the five cited texts could be read); largest share Nualart 2006, about 75 of 155 locators; contents not compared, its table of contents could not be opened. The layer order derivative → divergence → semigroup is forced by the *Needs:* lines of §4.4 (§2.1), §5.1 (§4.2) and §6.2 (§§4.4, 5.1, 5.3).

Research link: Layers 4–6 are the prerequisites of the Malliavin–Stein method of Nourdin–Peccati (2012): the total-variation bound through ⟪DF, −DL⁻¹F⟫ and the fourth moment theorem; also of the Bouleau–Hirsch criterion and Hörmander's theorem (Nualart 2006, §§2.1, 2.3). Rests on the README's "Downstream consumers" and "Beyond this roadmap".

## Not verifiable

- Nualart 2006 (all sampled locators, §§1.1–7.1): paywalled publisher; cited by locator only.
- Nourdin–Peccati 2012 (sampled locators of §§1.1–6.4): the publisher's page is not an open copy; no legal source found.
- Nualart–Nualart 2018 (sampled locators of §§3.2, 4.2–4.5, 6.1–6.4, 7.1): the publisher's page is not an open copy; no legal source found.
- Bogachev 1998 (locators of §§2.1, 4.4, 4.5, 6.1, 6.4): the publisher's page is not an open copy; no legal source found.
- Da Prato 2014 (locators of §§1.1, 4.1–4.3, 5.2, 7.3): paywalled publisher; cited by locator only.
- Wording and arrangement against the sources: not checked, for the same reason.

Automatic checks set aside as false positives: the section comment at the end of `Suggested.lean` with no declaration under it introduces the `#check` lines that pin library names, which is an allowed use.

## Source issues

- none

## For the human reviewers

- Not tested: Nualart 2006 carries about 75 of the README's 155 locators; neither its text nor its table of contents could be read, so wording and arrangement were not compared with it.
- Not tested: none of the five cited books (README lines 794–804) was readable from a legal place; all 155 locators are unverified.
- Licence: README lines 732–734 cite a "CKMA synopsis of area 09" that is not in the References; its status and whether its numbering may be reused could not be settled.
