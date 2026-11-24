# Review of QuantumHarmonicOscillator (pull request #3033 at 09527e1)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired, and the repair is correct. The rewritten second Example of Layer 1 now states the isometric isomorphism of `ker a ⊗ F` onto `V`, the criterion for intertwining by the kernels, and the exact condition for a decomposition into towers; each sentence was recomputed and holds on incomplete spaces. There are no small corrections and no format notes; two facts remain for the human reviewers, as before.

## Previous findings

- R01 — repaired: "`y ⊗ hₙ ↦ bⁿ y/√(n!)` is an isometric isomorphism of `ker a ⊗ F` onto `V`"; towers over `(ε_k)` "exactly when the family is an algebraic basis of `ker a`" (README, Layer 1, Examples, lines 156–171).
- C01 — repaired: "Teschl, §8.3, p. 213" (1.1), "Theorem 8.6, pp. 214–215" (2.1, step 2 and the Needs line), and the References give "§8.3, pp. 212–214 … Theorem 8.6, pp. 214–215"; the description gives the same pages.
- N01 — repaired: the phrases "checked symbolically", "checked exactly", "could not be read here" and "not consulted" are gone; the Checks state the identities alone, and Rellich is "cited through Dixmier".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Layer 1, second Example: `Φ(y ⊗ hₙ) = bⁿy/√(n!)` is isometric and onto | `y, y′ ∈ ker a`, levels `n`, `m` | `⟪bⁿy, bⁿy′⟫/n! = ⟪y, y′⟫`; `0` for `n ≠ m` (`N` symmetric); range = `Σ bⁿ(ker a) = V` | holds | none |
| Same Example: `Φ` carries `1 ⊗ a_F`, `1 ⊗ b_F` to `a`, `b` | `y ⊗ hₙ`, `n ≥ 1`; `n = 0` | `b`: both `bⁿ⁺¹y/√(n!)`; `a`: `n bⁿ⁻¹y/√(n!) = √n bⁿ⁻¹y/√((n−1)!)`; `n = 0`: both `0` | holds | none |
| Same Example: intertwined iff kernels isometric | `ℓ² ⊗ F` vs `c₀₀ ⊗ F`; `u : ker a₁ ≅ ker a₂` | an intertwiner restricts to `ℓ² ≅ c₀₀`, complete onto incomplete: none; conversely `Φ₂(u ⊗ 1)Φ₁⁻¹` intertwines | holds, both directions | none |
| Same Example: towers over `(ε_k)` sum to `V` iff `(ε_k)` spans `ker a` | `V = ℓ² ⊗ F`; countable dimension | level `0` of the tower sum is `span(ε_k)`; in `ℓ²`, `⟪ε_k, Σ2^(−j)ε_j⟫ = 2^(−k) ≠ 0` for all `k`; Gram–Schmidt on a countable basis | holds, both directions | none |
| Same Example against step 3 of 2.1 | `M₀ = ker A` closed in `H` | step 3 takes a Hilbert basis of `M₀` and `bⁿ/√(n!)` isometric `M₀ → M_n`: Hilbert sum, not algebraic sum | consistent | none |
| 1.2, first Check (rewritten) | Fock basis, `n = 2`, `m = 3`; `m < n` | `b²a²e₃ = 6e₃ = 3!/1!·e₃`; `a b³e₀ = 3√2 e₂ = 0 + 3b²e₀`; `‖b²e₀‖² = 2`; `a²e₁ = 0` | holds | none |
| 3.1, first Check (rewritten) | `n = 2` | `W(He₂/√2) = π^(−1/4)e^(−x²/2)(2x²−1)/√2 = h₂`; without dilation `(x²−1)e^(−x²/2)` | holds | none |
| Teschl locators in 1.1 and 2.1 | pages now cited against the previous review's reading of the 2nd ed. | §8.3 pp. 212–214, ladder argument p. 213, Theorem 8.6 pp. 214–215: equal to what the README now cites | agrees | none |

The rows for the untouched statements (1.1, 1.2, 2.1, 3.1, 3.2, 4.1, 4.2 and the conventions) stand as in the previous review, of `98724fc`; the diff changes no statement and no line of `Suggested.lean`.

- Changed passages reviewed: 12 hunks of the README (58 lines); `Suggested.lean` unchanged since `98724fc`.
- Source locators checked: 3 (Teschl §8.3 p. 213; Theorem 8.6 pp. 214–215; the References entry), against the pages the previous review read in the second edition; the text was not opened again (below).
- Library declarations opened at the pin: none new; the changed passages cite no library declaration not already opened in the previous review.
- Cross-roadmap citations in the changed passages: 1 (QuantumFoundations §9.2, in the first Example, unchanged).
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with `sorry` the only warning (7 theorems, at lines 39, 49, 105, 177, 203, 230, 246).
- The pull request's title and description agree with this head: they state the corrected Example, the second-edition pages and the move of the verification notes; no change outside the roadmap folder.
- Headline theorems (1.1, 1.2, 2.1, 3.1, 3.2, 4.1, 4.2) are all stated, as before.

Overlap check: read OrnsteinUhlenbeckSemigroup, QuantumFoundations, UnboundedOperators as in the previous review; the change adds no object and no citation, so the owners stand: the Ornstein–Uhlenbeck kernel and semigroup (OrnsteinUhlenbeckSemigroup), `CommonInvariantDomain` and Nelson's theorem (UnboundedOperators §5.3), the closed oscillator (QuantumFoundations §9.2), the Hermite functions (Tau Ceti); nothing else shared.

Source independence: changed passages only; 3 passages compared with 1 source (Teschl, as read in the previous review), none shared: the rewritten Example and Checks are the roadmap's own and have no source counterpart; largest share Dixmier, 5 of 12 locators; no layer added, removed or reordered, so the arrangement was not compared again. Teschl's text could not be opened this round.

Research link: Layer 2 is the uniqueness theorem of Dixmier (1958), sharpening Rellich (1946), for the canonical commutation relation; Layers 3–4 are Mehler's formula (DLMF 18.18.28) for the oscillator semigroup and group, tied to the Ornstein–Uhlenbeck semigroup and, in 4.2, to the metaplectic action of rotations. Rests on the README and on Dixmier's text.

## Not verifiable

- Teschl, 2nd ed.: the text could not be fetched this round (the sources service found no copy it classifies as legal); the pages now cited are those the previous review read in the second edition.
- Rellich (1946): not read; cited through Dixmier.
- The physlib development named in the scope section was not compared with `Suggested.lean`.

## Source issues

- none

## For the human reviewers

- Licence: the README (scope section, "Related formal work") names the physlib library's oscillator development and says nothing is taken from it; the declarations of `Suggested.lean` were not compared with that repository.
- Scope: five of the seven targets (1.1, 1.2, 3.1, 4.1, 4.2) are marked "Proved here" and carry no refereed locator for the statement itself; the cited sources are Dixmier (Compositio Math., 1958), Teschl (AMS, 2014) and DLMF.
