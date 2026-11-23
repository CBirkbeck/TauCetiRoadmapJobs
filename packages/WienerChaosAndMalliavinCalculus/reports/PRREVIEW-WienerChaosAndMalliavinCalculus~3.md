# Review of WienerChaosAndMalliavinCalculus (pull request #2972 at cec201e)

**Verdict:** accepted

**Summary.** Accepted: the finding of the previous review is repaired. Every theorem of Layers 4–5, and the four theorems of Layer 6 that mention 𝔻¹,², now carry `[CompleteSpace H]` in their elaborated signatures, and the counterexample is recorded as a negative-control Check in Layer 4. The two small corrections and the format note are repaired as well; the repairs introduced no new problem. There is one format note, not blocking. As before, none of the five cited books could be read legally, so no locator was checked against its text; that is left to the human reviewers.

## N01 — The module docstring calls `H` a Hilbert space and, six lines later, says only some layers assume completeness

In `Suggested.lean`, line 18 says "`H` is a real Hilbert space", while lines 26–29 (new) say that the theorems of Layers 4–5 and part of Layer 6 assume `[CompleteSpace H]`, and the signatures of Layers 1–2 and of the remaining Layer 6 theorems do not. "`H` is a real inner product space", as in the README's Conventions, would agree with both.

## Previous findings

- R01 — repaired: `variable [CompleteSpace H] [IsProbabilityMeasure P] {W : H → Ω → ℝ}` in the sections `Derivative` and `Divergence`; `[CompleteSpace H]` on `mem_ouGeneratorDom_iff`, `malliavinDeriv_ouSemigroup`, `integral_mul_comp`, `integral_sq_mul_log_le`; Conventions and a Layer 4 Check say so.
- C01 — repaired: the scope bullet now reads only "This roadmap consumes from Tau Ceti only the Gaussian Hermite bases."
- C02 — repaired: the guide says "Layers 4–6 use it only for the white-noise forms of the derivative in §4.4 and of the divergence in §5.1"; §4.4 has "*Needs:* §§2.1, 4.2, 4.3; §3.1 for the white-noise form."
- N01 — repaired: no line of `Suggested.lean` exceeds 100 characters.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 4.4 `IsIsonormal.mem_sobolev12_iff` (now with `CompleteSpace H`) | H = ℓ², F = W(h̄), h̄ = (1/k); the previous counterexample H = c₀₀ | DF = h̄ ∈ H, ‖DF‖² = π²/6 = ∑ₙ n‖JₙF‖²; c₀₀ is excluded by the new hypothesis | sound |
| 4.4 Check, negative control for completeness (new) | H = c₀₀ ⊂ ℓ², F = lim W(hₖ) | ‖F‖² = ∑ 1/k² = π²/6, F in chaos 1; a graph limit G is σ(W)-measurable with ⟪G, h⟫ = ⟪h̄, h⟫, so G = h̄ ∉ H a.s. | true |
| 6.2 `IsIsonormal.mem_ouGeneratorDom_iff` | H = ℓ², F = W(h̄) | LF = −F; δ(DF) = δ(h̄) = W(h̄) = −LF | sound |
| 6.3 `IsIsonormal.malliavinDeriv_ouSemigroup` | H = ℓ², F = W(h̄), t ≥ 0 | D P_t F = e⁻ᵗ h̄; right side e⁻ᵗ P_t⟪h̄, h⟫ = e⁻ᵗ⟪h̄, h⟫ | sound |
| 6.3 `IsIsonormal.integral_mul_comp` | H = ℓ², F = W(h̄), G = W(e₁), g = id | left E[W(h̄)W(e₁)] = 1; right 0·0 + ⟪e₁, h̄⟫ = 1 (L⁻¹F = −F, now in 𝔻¹,²) | sound |
| 6.4 `IsIsonormal.integral_sq_mul_log_le` | F = exp(λW(h)), ‖h‖ = 1; F = 0 | 4λ²e^(2λ²) − 2λ²e^(2λ²) = 2λ²e^(2λ²) = 2E‖DF‖²; 0 ≤ 0 | sound |
| Layers 4–5, the other theorems (hypothesis added only) | H = ℓ², u = W(h)h; F = 1 | δ(u) = W(h)² − 1, E δ(u)² = 2 = 1 + 1; D1 = 0, E δ(u) = 0 | sound |
| Layer 6 theorems left without completeness | H = c₀₀, F = lim W(hₖ) in chaos 1 | P_t F = e⁻ᵗF, LF = −F, L⁻¹F = −F: all defined through the chaos, no 𝔻¹,² in the statement | sound |
| 3.3 `IsMultipleWienerIntegral.mul_ae_eq` (line break only) | p = q = 1 | r = 0: I₂(f ⊗ g); r = 1: 1·1·1·⟪f, g⟫ | unchanged |

The rows for the untouched statements stand as in the previous review, of `653e845`.

- Source locators checked against the text: 0. The changed passages carry no locator; the sources cache was searched again for the five books and holds only works that cite them.
- Elaboration of `Suggested.lean`: no error, `sorry` the only warning. `#check @name` in a probe copy for twelve declarations of Layers 4–6: the nine of Layers 4–5 and of Layer 6 with 𝔻¹,² show `[CompleteSpace H]`; `ouGenerator_cylinder` and `ouPseudoInverse_spec` do not, as intended.
- One-tactic probe: the change adds a hypothesis to statements and alters no conclusion, so the previous probe (none closes) stands.
- Dependency check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Cross-roadmap citations in the changed passages: none added; the removed scope sentence took its unsupported library claims with it.
- Pull request text against the head: "complete for the statements about the derivative and the divergence" agrees with the Conventions; 45 theorems and 45 `sorry` counted; imports and suppliers as described.

Overlap check: read OrnsteinUhlenbeckSemigroup (open), YoungIntegrationAndRoughPaths (open), StochasticCalculus and RandomMatrices (main), as in the previous review; the change touches no ownership. Finite-dimensional Mehler kernel, generator and Nelson: OrnsteinUhlenbeckSemigroup. Finite-dimensional Poincaré and logarithmic Sobolev: RandomMatrices §2.2. Brownian exponential density and grid Hermite basis: StochasticCalculus §6.1. Chaos, multiple integrals, D, δ and the Wiener-space semigroup: this roadmap, no other owner.

Source independence: changed passages only; 4 passages compared (the Conventions bullet, the guide sentence, the new Check, the docstring sentence) with 0 sources, since none of the five cited texts could be read; they are the roadmap's own counterexample and bookkeeping and cite no source. Largest share Nualart 2006, about half of the locators; contents not compared, its table of contents could not be opened. No layer was added, removed or reordered.

Research link: Layers 4–6 are the prerequisites of the Malliavin–Stein method of Nourdin–Peccati (2012): the total-variation bound through ⟪DF, −DL⁻¹F⟫ and the fourth moment theorem; also of the Bouleau–Hirsch criterion and Hörmander's theorem (Nualart 2006, §§2.1, 2.3). Rests on the README's "Downstream consumers" and "Beyond this roadmap".

## Not verifiable

- Nualart 2006, Nourdin–Peccati 2012, Nualart–Nualart 2018, Bogachev 1998, Da Prato 2014: no legal copy readable (paywalled publishers; the sources cache holds none of them), so the sampled locators of §§1.2–7.1 remain unchecked against the texts.
- Wording and arrangement against the sources: not checked, for the same reason.

Automatic checks set aside as false positives: the section comment at the end of `Suggested.lean` with no declaration under it introduces the `#check` lines that pin library names, which is an allowed use.

## Source issues

- none

## For the human reviewers

- Not tested: Nualart 2006 carries about half of the README's locators; neither its text nor its table of contents could be read, so wording and arrangement were not compared with it.
- Not tested: none of the five cited books (README "References") was readable from a legal place; every locator is unverified.
