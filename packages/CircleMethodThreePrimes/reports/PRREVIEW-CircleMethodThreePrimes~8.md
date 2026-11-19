# Review of CircleMethodThreePrimes (pull request #2543 at 96f5e8c)

**Verdict:** accepted

**Summary.** Accepted. This is an incremental re-review of the 23 lines changed since `0e859d6`: the three small corrections of the previous review (the remark of §2.2, the "ineffective" docstrings, the build guide and the description's sentence) are repaired and the repairs are true as written; no statement changed and there is no finding. One small correction about the description (it does not say that §3.1 was retitled and absorbed the old contract subsection for the proposition) and two format notes carried from the previous review remain, none blocking. The three points for the human reviewers stand as before.

## C01 — The description does not say that §3.1 was retitled and that the old contract subsection for `SiegelWalfiszBound` was folded into it

A reader who follows a link to the old headings finds neither. On main the README has "### 3.1 Reduced fractions and residue classes" and, under the supplier contracts, "### The proposition `SiegelWalfiszBound`" (a one-row table with the exact statement). At this head the first is "### 3.1 Reduced fractions, residue classes and the Siegel–Walfisz proposition" (line 259), which now defines the proposition, and the second is gone; the description lists the other removed sections (the export-contract table, "Downstream consumers", "Ordering", the conventions table) but not these, and says only that "the layers keep their numbering 0.1–4.9". No roadmap cites either heading, so nothing breaks. One sentence would cover it, for instance: "§3.1 is retitled 'Reduced fractions, residue classes and the Siegel–Walfisz proposition' and now carries the definition of `SiegelWalfiszBound`, which had its own subsection under the supplier contracts."

## N01 — The scope bullet for AutomorphicSpectralTheory (lines 519–521) still reads as if §1.16 supplied the divisor formula

That section records `S(m, 0; c) = ∑_{d ∣ (m, c)} μ(c/d) d` only among its Checks, and §0.2 here proves it. "whose Checks record the divisor formula and the values …" would match the contract at lines 599–603.

## N02 — "This roadmap owns the additive character … the distance to the nearest integer" (lines 483–484), though §0.1 identifies both with Mathlib objects

Listing the two as kept variants (wrappers on `ℝ` for `Real.fourierChar` and the norm of `UnitAddCircle`) would make the ownership list agree with §0.1 and the Mathlib contract.

## Previous findings

The previous review had no finding (R); its small corrections and format notes are accounted for here.

- C01 (previous) — repaired: §2.2 now ends "This route cannot give the constant `1`, since `ψ(N) ≤ N` fails: `ψ(19) ≈ 19.27 > 19` and `ψ(113) ≈ 117.39 > 113`."
- C02 (previous) — repaired: the three docstrings now say the constant or threshold "is existential" and that the classical proof or route "gives no way to compute it" (`Suggested.lean` lines 135, 213, 225).
- C03 (previous) — repaired: the build guide says "each with its own *Needs:* line and with its source where the result is not elementary" and "apart from the identification with the Kloosterman sum in §0.2"; the description's sentence was changed the same way.
- N01 (previous) — not repaired: N01 above.
- N02 (previous) — not repaired: N02 above.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 2.2 remark (changed) | ψ(19), ψ(113), recomputed | 19.26566 > 19; 117.38673 > 113; the remark now refutes only `ψ(N) ≤ N`, which is what the witnesses refute | true | none |
| Build guide (changed), lines 42–48 | *Needs:* lines of 0.1, 0.2, 1.1, 1.2; sources of 0.1, 2.2, 3.1, 4.9; line 326 | Layer 1 needs 0.1 and 1.1 only; 0.2 needs AutomorphicSpectralTheory §1.16 (line 159); line 326 gives the source "for 4.1 to 4.8"; the four sections without a source are definitions, Parseval and a deduction from the supplier | true | none |
| `SiegelWalfiszBound` docstring (changed), line 135 | type against docstring; q = 1; x = 2 | type is `∀ A B > 0, ∃ C, ∀ x q a, …`, unchanged; `ZMod 1`: a = 0 is a unit, bound is `abs(ψ(x) − x) ≤ C x (log x)^(−A)`; an existential, as the docstring now says | true | none |
| `vinogradov_threePrimes`, `vinogradov_threePrimes_unconditional` docstrings (changed), lines 213, 225 | type against docstring; N = 7, 9 | `∃ N₀, ∀ N ≥ N₀, Odd N → …`, unchanged; 7 = 2+2+3, 9 = 3+3+3; threshold existential, as README Convention 8 and §4.8 (line 443) say | true | none |
| 4.9 against the supplier (cited by the changed guide) | `siegel_walfisz` on main, AnalyticNumberTheoryPartI `Suggested.lean` line 328 | supplier: `∃ C > 0, ∀ᶠ x, ∀ q > 0, q ≤ (log x)^B, ∀ unit a`, same conclusion; bounded range closed by `ψ ≤ (log 4 + 4) x` | holds | none |
| Description against the head | Checks counted; Lean diff against main; headings on main and at head | 15 Checks; 9 changed lines in `Suggested.lean`, all in three docstrings, 0 declarations changed; two heading changes unstated | one omission | C01 |

The rows for the untouched statements stand as in the previous review, of `0e859d6`.

- Source locators checked against the text: 1 (helfgott2015 lines 327–332 and 366–384, behind the reworded docstrings and §4.8: explicit and effective thresholds are recorded there, and the classical route gives none). The changed passages add no locator.
- Library declarations: none new in the changed passages; `Chebyshev.psi_le_const_mul_self`, named beside the changed remark, stands as opened in the previous review (NumberTheory/Chebyshev.lean:485).
- Cross-roadmap citations resolved on main, 2 in the changed passages: AnalyticNumberTheoryPartI §0.32 (`siegel_walfisz`, `Suggested.lean` line 328, docstring "an effective constant and threshold", as the description says) and AutomorphicSpectralTheory §1.16 (through the *Needs:* line of §0.2).
- Overlap check: read ExplicitCharacterSumsAndSieves, ExplicitMultiplicativeFunctions (open), SieveMethodsAndPrimePatterns, AnalyticNumberTheoryPartI, ExplicitPrimeCounting (main), as in the previous review; the third list is empty; the change adds no object. Shared objects and owners are unchanged: Vaughan's identity, SieveMethodsAndPrimePatterns §2.4; `ψ(x; q, a)` and Siegel–Walfisz, AnalyticNumberTheoryPartI §0.32; the Kloosterman sum, AutomorphicSpectralTheory §1.16; all cited. No open pull request changes this roadmap or drops an id it cites.
- Dependency check: `depcheck: 200 roadmaps, 2198 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changes outside the folder. The automatic checks all pass on this head.
- Elaboration: `lake env lean` on `TauCetiRoadmap/CircleMethodThreePrimes/Suggested.lean` gives 18 `declaration uses sorry` warnings and nothing else; one `import Mathlib`, no `set_option`. No declaration's type changed, so the signature comparison and the one-tactic probe of the previous review stand.
- Headline theorems (minor-arc bound, asymptotic formula with the count, Vinogradov's theorem with Siegel–Walfisz discharged) are all stated; none is unstatable; unchanged.

Source independence: changed passages only; 3 passages compared with 1 source (the §2.2 remark, the build guide, the reworded docstrings against helfgott2015 lines 327–332 and 366–384), none shared; largest share Davenport, *Multiplicative Number Theory*, 6 of 12 locators, whose text and contents could not be read; the diff adds, removes or reorders no layer, so the arrangement was not compared again (helfgott2015: independent, as before).

Research link: the headline is Vinogradov's three-primes theorem (Vinogradov 1937) by Vaughan's identity (Vaughan 1977); Helfgott (2015) makes this circle method explicit to prove the ternary Goldbach conjecture. Rests on the README's references and helfgott2015 lines 327–332 and 1007–1009.

## Not verifiable

- Davenport, Iwaniec–Kowalski, Vaughan (book and 1977 note) and Vinogradov 1937: closed or not held, not read, as in the previous review; the changed passages cite none of them newly.
- The description's sentences about the README before this pull request were checked against the headings and the diff from main, not line by line.

## Source issues

- none

## For the human reviewers

- **Not tested.** Davenport (GTM 74) has the largest share of locators, 6 of 12 in `TauCetiRoadmap/CircleMethodThreePrimes/README.md`, and is closed: wording and arrangement were not compared with it.
- **Licence.** README "Prior work" (lines 472–477) names `github.com/sthubbar/lean-lab-ci` as a source ported "with its author's agreement". Its root shows a NOTICE file and no LICENSE file; its contents were not compared with `Suggested.lean`.
- **Supplier route.** The unconditional headline consumes AnalyticNumberTheoryPartI §0.32, which main proves through its §0.34, an effective exclusion of Landau–Siegel zeros. §4.9 here uses only that a constant exists, which the classical ineffective theorem gives.
