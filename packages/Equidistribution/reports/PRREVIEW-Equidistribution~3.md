# Review of Equidistribution (pull request #2112 at ea71f8a)

**Verdict:** needs changes

## R01 (P3) — The pull request description still names Layers C and D and a README sentence that the head does not have

**Location.** The pull request description.
- "Existing formalizations cited": "The README asks implementers to coordinate with its author before reusing proof text, per the porting guidance."
- "Subject-area expert": "the gap-length statement in Layer D … and the Layer C index conventions … which the C→D identification relies on".

**Claim.** The README asks implementers to coordinate with the author of `dkunert/three-gap-theorem-lean`, and the roadmap has a Layer C and a Layer D.

**Witness.** `TauCetiRoadmap/Equidistribution/README.md` 670–672 ends "because it is the stronger theorem."; the words "coordinate" and "porting" occur nowhere in the folder. The layers are numbered 1–4; the gap-length statement is §4.4.

**Repair.**
- Replace the sentence with: "`dkunert/three-gap-theorem-lean` (MIT, uniform in `α`) is cited in the References for its statement shape, not as a specification. Implementers should coordinate with its author before reusing proof text."
- Replace "in Layer D" with "in §4.4", "the Layer C index conventions" with "the continued-fraction index conventions (Conventions and §3.1)", and "the C→D identification" with "the identification of §4.4 through Layer 3".

## Previous findings

- R01 — repaired: README 174–183 lists the seven `Real.*`/`Irrational.*` names and the two `AddCircle.*` names; §1.1 249–251 uses `AddCircle.eq_torsionBy_of_natCard_eq`; §3.1 355–367 consumes the Tau Ceti theorems.
- R02 — repaired: README 396–398 "`|convErr ξ (n + 1)| = |convErr ξ n| / ξₙ₊₂`… the second, with `ξₙ₊₂ > 1`, the decrease".
- R03 — repaired: README 374–376 "Strict monotonicity from index `1`, the determinant identity at `n` and the Fibonacci bound need `¬ (cf ξ).TerminatedAt n`".
- R04 — repaired: README 97–101 "`a₀ = ⌊ξ⌋`… `aₙ₊₁ = (GenContFract.of ξ).partDens.get? n`", with the `π` Check `q₂ = 15·7 + 1 = 106`.
- R05 — repaired: README 65–67 and 646–648 "No roadmap consumes this one"; a search of main and every open head finds no citation of this roadmap.
- R06 — repaired: README 316–321 transfers `linear_equidistribution_tfae` at `d = Unit`, `β = 0`, with §2.3 in the *Needs:* line; the Check at 329 says "§2.5 at `d = Unit`".
- R07 — repaired: `empiricalMeasure_const_add_nsmul` is gone from `Suggested.lean` and its docstring; README 297–299 states it in prose; the periodicity Check is deleted.
- R08 — repaired: §4.3 (562–563) and §4.5 (626) carry locators, §§3.1–3.2 cite Hardy–Wright Theorems 149, 150 and 170–172 (not verifiable, below); the "unmerged" clause is deleted.
- R09 — repaired: Check at 530 "`η⁺ = √2 − 1` and `η⁻ = 3 − 2√2`; without `erase 0` the infimum would be `0`"; Example at 637 "at `N = Fₖ ≥ 2` two gap lengths, at `N = 1` one".
- R10 — partly repaired: "What it specifies" and the supplier sentence now match the head; two other passages do not (R01 above).

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions, `aₙ₊₁ = partDens.get? n` | π = [3; 7, 15, 1, …] | `a₁ = 7`, `q₁ = 7`, `q₂ = 15·7 + 1 = 106` | consistent with §3.1's recurrence |
| §1.1 torsion route, `ncard_range_nsmul_coe_rat` | p = 1; q = 2/5, q = 0 | `zmultiples (2/5)` has 5 points = 5-torsion, `(5 : ℝ) ≠ 0`; q = 0: card 1, 1-torsion `{0}` | true; pinned hypothesis `(n : 𝕜) ≠ 0` met by `q.den > 0` |
| §2.2 `tendsto_empiricalMeasure_nsmul`, new route | a = 0; a = √2, T = 1 | a = 0: `k = 1` gives `1 • 0 = 0`, not `TorusIrrational`, `addOrderOf = 1`; √2: `k • √2 ≠ 0` for `k ≠ 0` | true; §2.3 `torusIrrational_unique_iff` gives the bridge |
| §3.1 scope sentence (374–376) | ξ = 1/2 = [0; 2] | terminated at 1; n = 0: `0·2 − 1·1 = −1 = (−1)¹`; n = 1: `1·2 − 1·2 = 0`, excluded; `q₁ = q₂ = 2`, excluded | true |
| §3.2 route identity (396) | √3, n = 0, 1 | `0.7321/2.7321 = 0.2679 = e₁`; `0.2679/1.3660 = 0.1962 = e₂` | true |
| §4.1 Check `etaPos`, `etaNeg` | √2, N = 3 | points 0, 0.4142, 0.8284; `η⁺ = 0.4142`, `η⁻ = 0.1716`; infimum without `erase 0` is 0 | true |
| Layer 4 Example at `Fₖ` | φ, N = 1..21 | lengths 1, 2, 2, 3, 2, 3, 3, 2, 3, 3, 3, 3, 2, 3, …, 3, 2 (two at N = 2, 3, 5, 8, 13, 21) | true |

The rows for the untouched statements stand as in the previous review, of `65ead17`.

- **Gate.** The worker's gate passes at `ea71f8a`. My rerun printed only `depcheck: NOT IN ORDER: Equidistribution (insert it after its last supplier)`, the not-yet-placed case, which is not a finding.
- **Dependency check.** `depcheck: 206 roadmaps, 1899 edges, 0 problem(s)`; no UPWARD or CYCLE line. The candidate order has ProbabilisticAndMetricNumberTheory at 62 and this roadmap at 63. Nothing outside the folder changes.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/Equidistribution/Suggested.lean` at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d`): 17 `sorry` warnings for the 17 theorems, nothing else. The diff changes no remaining signature.
- **Tau Ceti at `2fd255d`, opened.** `NumberTheory/DiophantineApproximation/ContinuedFractions.lean` 62, 113, 121, 128, 135, 151, 161 (the seven names; `Real.fib_succ_le_den_convergent` takes `Irrational ξ`, `Real.den_convergent` holds for every `ξ`); `Algebra/AddCircle.lean` 187 and 231.
- **Cross-roadmap citations resolved.** ProbabilisticAndMetricNumberTheory at its open head: §2.3 (README 2631, bridge at 2676 and 2707), §2.5 `linear_equidistribution_tfae` (README 2842, `Suggested.lean` 229), `torusHaar` (`Suggested.lean` 212). DiophantineApproximationAndTranscendence on main: §0.4 (345), §0.5 (367; line 434 names the same two Tau Ceti theorems), §0.6 (440).
- **Overlap check:** read ProbabilisticAndMetricNumberTheory, ClassicalErgodicTheory, SpecialFunctionsLegendre, SpecialFunctionsEiLiErfIncompleteGamma, Exchangeability; the owners are as in the previous review (equidistribution on `UnitAddTorus d`: ProbabilisticAndMetricNumberTheory §2.5; the `AddCircle T` transfer: this roadmap), and the change adds no shared object.
- **Pull request text.** Title, file list, the four-layer summary, the supplier sentence and the depends-on block agree with the head; the two passages of R01 do not.
- Remark: the contract line at README 181–183 describes `AddCircle.eq_torsionBy_of_natCard_eq`; `AddCircle.torsionBy_eq_zmultiples` is the statement that the `n`-torsion is generated by the class of `p / n`.

## Not verifiable

- Hardy–Wright, 6th ed., Theorems 149 and 150 (§3.1) and 170–172 (§3.2): the sources service found no legal copy (the publisher's page refuses access), so the new theorem numbers were not read against the text.
- Alessandri–Berthé §3, p. 12 of the authors' copy (§4.3's new locator): the sources service found no copy in this run; the locator is the one the previous review read the three counts at (AB98 lines 480–483), and was not read again.
- Khinchin, Kuipers–Niederreiter, Einsiedler–Ward, Liang, Weyl: as in the previous review; their locators did not change.

## Source issues

- none
