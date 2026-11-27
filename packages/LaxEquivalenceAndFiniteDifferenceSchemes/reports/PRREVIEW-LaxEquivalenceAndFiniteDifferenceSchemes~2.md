# Review of LaxEquivalenceAndFiniteDifferenceSchemes (pull request #3214 at 34ccdce)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired, and the 20 changed lines of the README say nothing untrue. The Check of 1.1 on the exact scheme and the comparison of the two forms of consistency are now stated on a Banach space, the comparison with Trefethen's definitions names the restriction `τ ≤ τ₀`, and the convention on `B⁻¹ A` no longer claims a hypothesis that 2.4 does not make. No small correction and one format note (carried over, not blocking). For the human reviewers, as before: the two texts the locators point into are an unpublished book draft and lecture notes, and Lax–Richtmyer 1956 is cited by attribution only.

## N01 — A locator is available for the weighted family in 2.4

Carried over from the previous review. 2.4 says the weighted family and its threshold are proved here; the family with weight in `[0, 1]` is posed, without an answer, in Trefethen, Exercise 4.4.1, p. 170 (the "theta method"). Citing it would let a reader find the classical name and see that `w ∉ [0, 1]` is the part with no source.

## Previous findings

- R01 — repaired: "On a Banach space, the exact scheme `C τ = S τ` is consistent with `D = X` and stable with `K` the bound of `‖S t‖` on `[0, T]`" (line 109); likewise "the two forms agree on a Banach space" (line 98).
- C01 — repaired: "Trefethen asks for the bound at all steps with `n k ≤ T` and for `n k = t` exactly, while here stability is asked for `τ ≤ τ₀` and convergence for `n j τ j → t`" (lines 94–95).
- C02 — repaired: "Statements 2.2 and 2.3 assume that `ρ_b` does not vanish where it is evaluated …; in 2.4 the value `0` on grids where `B` is singular is harmless, as its route shows" (lines 61–62).
- N01 — not repaired: 2.4 still gives no locator for the weighted family; written again above as a format note.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 Check, exact scheme (changed) | `X = ℝ`, `S t = e^t`, `T = 1`; the incomplete witness of the previous review | `(e^τ)ⁿ = e^(nτ) ≤ e = K`; one-step error `0`; incomplete case `‖S(1/k)‖ ≥ (1+k)/e` now excluded by the hypothesis | true as stated | none |
| 1.1 two forms of consistency (changed) | `x` in the domain of `A`, `‖S t‖ ≤ M` on `[0, T]` | `(S τ − 1)S t x/τ − S t A x = S t((S τ − 1)x/τ − A x)`, norm `≤ M · o(1)`; `M` from `existsGrowthBound`, complete `X` | true on a Banach space | none |
| 1.1 against Trefethen (4.2.7), (4.2.8) (changed) | family `(τ − 1)⁻¹` on `(1, 2]`, `T = 2` | source: limit along `nk = t`; bound for all `n, k` with `0 ≤ nk ≤ T`; family stable here with `τ₀ = 1`, unbounded as `τ ↓ 1` | sentence matches the source | none |
| Conventions on `B⁻¹ A` against 2.2–2.5 (changed) | `w = −1/4`, `μ = 1` on `ZMod 2` and `ZMod 3` | `ρ_b(π) = 0`, step matrix `0` on `ZMod 2`; on `ZMod 3` `s = 3/4`, `ρ_b = 1/4`, `ρ_a = −11/4`, `|g| = 11`; `2(1 − 2w)μ = 3 > 1` | both sides of 2.4 false; convention true; 2.5 explicit | none |
| 1.5 `isConvergentScheme_iff_isStableScheme` (cites 1.1) | exact scheme on a Banach space | consistent (error `0`), stable (`K = M e^(ωT)`), convergent by orbit continuity: both sides true | consistent with the changed Check | none |

The rows of the other statements stand as in the previous review, of `4759bb5`; the diff changes no Lean statement.

- Source locators checked against the text: 2 (Trefethen (4.2.7) and (4.2.8), p. 156, chapter 4 text lines 284–299), plus Exercise 4.4.1 (line 745) for N01.
- Library declarations opened at the pin: 2 (`StronglyContinuousSemigroup.existsGrowthBound`, `TauCeti/Analysis/Semigroups/GrowthBound.lean` line 135, under `[CompleteSpace X]` from line 129; `map_natCast_mul`, `Basic.lean` line 103).
- Cross-roadmap citations: unchanged by the diff; none found unresolved.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the roadmap folder.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: eight `sorry` warnings, nothing else. `Suggested.lean` is unchanged since `4759bb5`, so the signature comparison and the one-tactic probe of the previous review stand.
- Pull request title and description read against this head: no sentence contradicted; the change (three wording repairs in the README) removes or adds nothing they describe.

Overlap check: read ExponentialIntegrators, SymmetricHyperbolicSystems, SamplingAndDiscreteFourierAnalysis; nothing shared (as in the previous review; the diff adds no object).

Source independence: changed passages only; 4 passages compared with 1 source (Trefethen's text), none shared; largest share Trefethen's text, 12 of 19 locators; the diff adds, removes or reorders no layer, so the arrangement was not compared again. Lax–Richtmyer 1956 could not be read.

Research link: The headline is the equivalence theorem of Lax and Richtmyer (1956); Layer 2 is von Neumann's criterion as in Trefethen (1996, §4.4) and Chern (2018, §2.2). The README's scope section offers Layer 1 to later convergence proofs for discretisations of linear evolution equations. Rests on the README and on the two texts read.

## Not verifiable

- Lax and Richtmyer, Comm. Pure Appl. Math. 9 (1956): paywalled at the publisher, no open copy; the README cites it by attribution and DOI only, so nothing depends on its text.

## Source issues

- **Error** in Trefethen 1996 (chapter 4 file) at (4.2.8) and Theorem 4.1, pp. 156–157: the source says stability is a bound for all steps with `nk ≤ T`, and equates it with convergence as `k → 0`; it should be restricted to steps below some `k₀`, since convergence does not see large steps; affects a stated result.

## For the human reviewers

- Scope: the two texts all locators point into are an unpublished book draft (Trefethen, author's page, chapters dated 1994, proofs of Theorems 4.1–4.3 marked not yet written) and lecture notes (Chern 2018). The refereed origin, Lax–Richtmyer 1956, is cited without locators.
- Not tested: Lax–Richtmyer 1956 could not be read; the README's attributions to it ("due to Lax and Richtmyer") were not checked against its text.
