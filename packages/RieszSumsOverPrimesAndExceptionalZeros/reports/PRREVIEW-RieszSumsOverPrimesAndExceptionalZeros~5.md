# Review of RieszSumsOverPrimesAndExceptionalZeros (pull request #2877 at 7297de1)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RieszSumsOverPrimesAndExceptionalZeros/`
**Verdict:** accepted

**Summary.** Accepted: no finding. The effectivity of the repulsion constant of 1.7b (i) now rests on Bombieri 1987, Théorèmes 14 and 16 with the Landau–Page lemma, and I checked that 1.7b (i) does follow from them at `T = e^ℒ` and that Bombieri states those constants to be effectively computable at the pages cited; the two docstring changes of `Suggested.lean` are accurate, and the rewritten description agrees with this head. There is one small correction (the description's list of the forms of the formal proof leaves out the one in 1.7b) and two format notes, none blocking. The standing of the formal proof as a source, which I could not read, is left to the human reviewers.

## C01 — The description's list of the forms of the formal proof omits the one recorded in 1.7b, which has no primed label

A reader of the description expects every form of the formal proof to carry a primed label and to be in its list: "with the label primed: 1.4e (a′), 1.4f (a′), 1.4h (b′)–(c′), 1.4i (b′) and (c′), 1.7a (b′) and 2.9b (iv) (c′)". The README has one more, in the convention paragraph of 1.7b (line 498), under the same heading and with no label: the formal proof's gap `1 − β₁ ≥ c/(q² log q)`, which gives `π(x;a,q) ≥ c′x/(q³ log x)` in (iii) in place of the exponent `7/4`.

Adding to that sentence "and, unlabelled, the polynomial gap of 1.7b with the exponent `3` it gives in Linnik's theorem" would make the list complete.

## N01 — A docstring line of `Suggested.lean` still begins with the word "theorem"

Line 20 of the module docstring starts "theorem for the Riesz remainder under a zero-free interval", so a tool that reads declarations line by line sees a declaration named `for`. Reflowing the sentence so that no line starts with a declaration keyword removes it. (N01 of the previous review, unchanged.)

## N02 — "the route above" in the Effectivity paragraph of 1.7b points at the wrong route

The paragraph (line 679) stands after the route of (iv), which does not use 0.30b; "the route of (i)" would say what is meant.

## Previous findings

The previous review had no finding; its small corrections and format note are accounted for.

- C01 (the effectivity of the repulsion constant) — repaired: "(i) follows from Bombieri 1987, Théorème 16, p. 41, taken at `T = e^ℒ` with the Landau–Page lemma of p. 39 … The constant of 0.30b … is asserted only to exist"; docstring: "none … effective here, and the README says which are".
- C02 (the description described an earlier head) — repaired: "`Suggested.lean` states seven theorems"; the repulsion and Gallagher's theorem are listed as stated; ExplicitPrimeCounting and QuasiRiemannHypothesis are named; the comparison of index copies is replaced by the rebase rule.
- C03 (1.4i (c′) follows from 1.4i (c) as stated in Lean) — repaired: "As stated, it follows from `norm_rieszRemainder_le` by discarding the zero-free hypothesis; the target is its proof by the route of 1.4i (c′), from 1.4i (a), without AnalyticNumberTheoryPartI §0.34."
- N01 (a docstring line begins with "theorem") — not repaired: line 20, "theorem for the Riesz remainder under a zero-free interval (1.4i (c′))". Written again as N01.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.7b (i) from Bombieri 1987 Th. 16 at `T = e^ℒ` (the changed Effectivity sentence) | `q = 3, γ = 0`; imprimitive `χ`; `χ = χ₀`; `(1−β₁)ℒ ≥ c`; `χ = χ₁, ρ = β₁` multiple | `T ≥ q(|γ|+2) ≥ 6`, so `q ≤ T`, `|γ| ≤ T`; zeros with `β ≥ 1/2` are those of the primitive source, modulus `∣ q`; `ζ` is modulus 1 | holds | none |
| 1.7b (i), the cases Th. 16 does not cover | `β₁ ≤ 1 − c₁/ℒ`; `δ₁ℒ > c₄/e`; multiple `β₁` | with `c ≤ min(c₁, c₄/e, c₅)`: `log(c/((1−β₁)ℒ)) ≤ 0 < 1 − β`; Landau–Page zero is simple, so a multiple `β₁` is not exceptional and the bound is vacuous | holds | none |
| Effectivity of Bombieri's constants | Bombieri1987 lines 1184–1196, 1208–1215, 1248–1260 | lemma, printed p. 39: `c₁, c₂` effectively computable; Th. 14, p. 40: implied constants and `c₃` absolute, effectively computable; Th. 16, p. 41: proof is one inequality from Th. 14 | holds | none |
| `norm_rieszRemainder_le_of_no_real_zero` docstring (1.4i (c′)) | elaborated types of the two theorems | (c′) is (c) with the hypothesis `χ² = 1 → no zero in (1−c₀, 1)` added and `C, c` after `c₀`; so (c) gives (c′) | holds | none |
| Description against the head | declarations; primed labels; suppliers; effectivity sentences | 7 theorems, names as listed; primed forms at README lines 115, 159, 273, 333, 403, 455, 854, and an unlabelled one at 498; 10 supplier subsections match | one omission | C01 |

The rows for the statements the change does not touch stand as in the previous review, of `cf3acf2`.

- Source locators checked against the text: 4 (Bombieri1987 Landau–Page lemma p. 39, Théorème 13 p. 39, Théorème 14 p. 40, Théorème 16 p. 41; Bombieri1987 lines 1176–1260). The seeded sample falls in the change only at 1.7b.
- Library declarations opened at the pins: none new; the diff changes no Lean statement.
- Cross-roadmap citations resolved: the changed passages add none; the worker's resolution of the README's citations and Lean names found none missing.
- Elaboration: `Suggested.lean` elaborates with seven `sorry` warnings and nothing else; the seven statements are textually those of `cf3acf2` (the diff touches docstrings only), so the signature comparison and the one-tactic probe of the previous review stand.
- Dependency check: `depcheck: 171 roadmaps, 1993 edges, 0 problem(s)`. The worker's automatic checks all passed. Outside the roadmap folder the pull request changes only the three files of the family index.
- Duplication and overlaps: no layer, item or supplier changed; the worker's overlap report lists no shared roadmap, no dropped id and no second copy.

Overlap check: read QuadraticTwistSelectionOverPrimes, RiemannHypothesisStatementsAndConsequences, FrobeniusRestrictedRieszSums, GeneralizedRiemannHypothesisFromWindowBounds and LiCoefficientsArithmeticFormula (open), and AnalyticNumberTheoryPartI, AnalyticNumberTheoryPartIII and ZerosOfLFunctions (main), as in the previous review; the change touches no owned object. Riesz sums and the Riesz remainder: RiemannHypothesisStatementsAndConsequences 8.4a. The exclusion of Landau–Siegel zeros: AnalyticNumberTheoryPartI §§0.18, 0.34. Landau's lemma: AnalyticNumberTheoryPartIII 8.3. The repulsion, Gallagher's theorem in Linnik's range, Linnik's theorem and the short-interval counts: this roadmap.

Source independence: changed passages only; 2 passages compared with 1 source (Bombieri1987), none shared beyond the standard phrase "effectively computable"; largest share Linnik1944a/b, 5 of 17 theorem-level locators (Gallagher1970 4, Bombieri1987 4); the diff adds, removes and reorders no layer, so the contents were not compared again: independent as in the previous review. Iwaniec–Kowalski, Davenport, Stark, Lagarias–Odlyzko, Knapowski and [FormalProof] could not be read.

Research link: 1.7b is Linnik's least-prime theorem (Linnik 1944; Bombieri 1987, Th. 13) with the Deuring–Heilbronn repulsion (Bombieri 1987, Th. 16) and Gallagher's theorem (Gallagher 1970, Th. 7); 1.4g (b) is Iwaniec–Kowalski Th. 5.27 as used by Bennett–Siksek (2020); 2.9b follows Lagarias–Odlyzko (1977) and Stark (1974). Rests on the README and the five texts read.

## Not verifiable

- [FormalProof] and [Announcement]: not in the sources cache and their hosts are in no licence class; the description's sentences about what the formal proof establishes were checked against the README only.
- Iwaniec–Kowalski, Davenport1980, Stark1974, Knapowski 1962 and Lagarias–Odlyzko 1977: not readable, as in the previous review; the change does not bear on them.
- The description's merge-order and depends-on blocks are generated and were not checked.

## Source issues

- none

## For the human reviewers

- Scope: the forms headed "The form of the formal proof" rest on a Lean repository and an announcement of 20 November 2026 (the last two entries of the README's References), not refereed, on hosts of no licence class; I did not read them.
- Not tested: Iwaniec–Kowalski, Davenport, Stark, Lagarias–Odlyzko, Knapowski and [FormalProof] could not be read; wording and arrangement were compared with Gallagher1970, Linnik1944a/b, Bombieri1987 and BennettSiksek2020 only.
- Design: with AnalyticNumberTheoryPartI §0.34 on main and QuasiRiemannHypothesis §10.7 open, no exceptional zero exists; 0.30b, 1.7a, 1.7b (i) and the exception-tolerant forms then serve only routes that avoid those two statements (README, remarks of 1.4e and 1.4i).
- GaloisSectionsPadicPeriodMaps (open) declared, when the previous review read it, a gap asking AnalyticNumberTheoryPartI for Linnik's theorem, which this roadmap states as 1.7b (iii); not re-read this round.
