# Review of RieszSumsOverPrimesAndExceptionalZeros (pull request #2877 at df7d2be)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RieszSumsOverPrimesAndExceptionalZeros/`
**Verdict:** accepted

**Summary.** Accepted. The new locators for Linnik's theorem, the Deuring–Heilbronn repulsion and Gallagher's theorem (1.7b (i)–(iii)) match Linnik's two 1944 papers, Bombieri's *Le grand crible* and Gallagher 1970 at the cited theorems and pages. The effectivity claims now follow their routes, and the route of 0.30b now cites Landau's lemma (AnalyticNumberTheoryPartIII 8.3) with parameters that check out. Two small corrections remain, neither blocking: the effectivity of the repulsion constant rests on a constant that 0.30b states only as existing, and the description's account of the family index no longer matches the sibling heads. Questions about the unrefereed formal-proof source and the texts that could not be read are left to the human reviewers.

## C01 — The repulsion constant of 1.7b (i) is called effective because of its route, but the constant of 0.30b, on which that route depends, is stated only to exist

A reader who checks the claim against the route finds the effectivity asserted for the result but not for its input. The new Effectivity paragraph of 1.7b (line 579) says "The constant `c` of (i) is effective: its route uses 0.30b and 1.7a and no zero-free region". Step 5 of the route takes `c = 1/(2CC′)`.

- 1.7a's constant is explicit: `C = 144(1 + ρ₀)/(1 − ρ₀)`, which is 1008 at `r = x₀ = 1/2`.
- 0.30b says only "There is an absolute `C`" (lines 34–35). Its growth input, ZerosOfLFunctions 3.4, gives "there are `C`, `B`" without effectivity.
- 2.9b (iv) (line 751) applies a stricter test to a supplier constant in the same position: there a constant that is "absolute but not given as effective" is not called effective.

The claim itself is classical. Bombieri 1987 deduces Théorème 16 (p. 41) from Théorème 14 (p. 40), whose constants it states to be effectively computable (Bombieri1987 line 1214).

Either of two changes would fix this:

- Say in 0.30b that its `C` is effective. The wide-strip growth bound, Jensen's bound and Landau's lemma involve no minimum over finitely many characters, and AnalyticNumberTheoryPartIII 8.3 cites its constant as explicit.
- Rest the effectivity of (i) on Bombieri 1987, Théorèmes 14 and 16.

## C02 — The description's comparison of the family index with the sibling pull requests no longer matches their heads

The description says: "Its `README.md` here agrees with the copies in #2885 (RiemannHypothesisStatementsAndConsequences) and #2878 (QuadraticTwistSelectionOverPrimes). The copies in #2881 (FiniteReductiveGroups) and #2883 (AdelicHeightsAndSuccessiveMinima) differ: they lack the attribution". At today's heads, the family index `README.md` of this pull request compares with the sibling copies as follows:

- #2878 agrees with it.
- #2885 differs at lines 9–14, 31 and 112–113. Its copy has a longer attribution paragraph, a sentence saying that a section keeps its number, and a rewritten entry for ChowFormsAndHeightsOfSubvarieties.
- #2881, #2880 and #2887 carry #2885's text, attribution included.
- #2883 still carries the older text.

The index `Suggested.lean` is the same in #2878, #2881, #2883 and #2885, as the description says. Since #2885 is this pull request's supplier and merges first, this pull request takes #2885's index when it is rebased.

The simplest repair is to drop the list of pull requests and keep the rule the next sentence already states. Alternatively, write "Its `README.md` agrees with #2878; #2885 (and #2880, #2881, #2887) carry a revised index, which this pull request adopts when it is rebased after #2885."

## Previous findings

- R01 — repaired: "Linnik 1944 II, §3, the second basic theorem, p. 348 … Bombieri 1987, Théorème 16, p. 41, and Gallagher 1970, (27), p. 336" (lines 435–437); Gallagher 1970, Theorem 7, (29), p. 337 (line 490); Linnik 1944 I, (2), p. 139, and Bombieri Théorème 13, p. 39 (lines 546–547). Each checked against its text.
- C01 — repaired: "The constants here are asserted to exist, not to be effective" (1.4g (b), line 169). "Effective" is dropped from 1.7b (ii)–(iv) and from headline (2); the new Effectivity paragraph (line 579) raises C01 above.
- C02 — repaired: "with `4` in place of `12` the guaranteed saving is just below `4cS`, and with `8` just below `8cS`: neither exceeds `8cS`" (line 777).
- C03 — partly repaired: the description now names which copies of the family index differ, but its list no longer matches the heads (C02 above).
- C04 — repaired: "Landau's lemma (AnalyticNumberTheoryPartIII 8.3, with `R = 15/4`, `r₂ = 4/5`, `r₁ = 2/3`, so that `r₂R = 3` and `r₁R = 5/2`)" (lines 54–57). It is also in *Needs* (line 77), the Dependencies (line 87) and the supplier contracts (line 865).

## Verified sound

Incremental re-review of the 78 changed lines since 833bd0c.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.30b route, Landau's lemma | `q = 1, t = 0`; principal modulo 6 | `r₂R = 3`, `r₁R = 5/2`; Jensen count `≤ M/log(5/4) = 4.48M`; `|F(2)| = ζ(2) = 1.645 ≥ ζ(4)/ζ(2) = 0.658 > 1/2` | holds | none |
| 0.30b, coefficients of `−g` | expansion at `z − u` | `−δ/(z−1−u) = −δΣu^k(z−1)^(−k−1)`; `m_w/(z−w−u) = m_wΣu^k(z−w)^(−k−1)`, matching (b); Cauchy radius `2 ≤ 5/2` | holds | none |
| Contract for AnalyticNumberTheoryPartIII 8.3 | `f(z) = z − ρ` | the hypotheses and conclusion equal 8.3 on main (its lines 496–500); the zero sum is `f′/f` exactly, so the left side is `0` | holds | none |
| 1.4g (b) | BennettSiksek2020 lines 805–806 | source: `c` absolute and effective, implied constant absolute; README now asserts existence only, matching | holds | none |
| 1.7b (i) and its locator paragraph | Linnik1944b p. 348; Bombieri Th. 16; Gallagher (27) | Linnik: `|t| ≤ ln³D`, moduli `≤ D²`, `σ ≥ 1 − c₃ln(c₄μ₀)/ln D`, `μ₀ = 1/((1−β₀)ln D)`; at `ℒ = log q` this has the shape of (i) | holds | none |
| 1.7b (i), effectivity | 1.7a at `r = x₀ = 1/2` | `ρ₀ = 3/4`, `C = 144·(7/4)/(1/4) = 1008`; 0.30b: "there is `C`"; ZerosOfLFunctions 3.4: "there are `C`, `B`" | claim true, basis unstated | C01 |
| 1.7b (ii) and Gallagher paragraph | Gallagher Th. 7, p. 337 (page image) | `x/Q ≤ h ≤ x`, `exp(√log x) ≤ Q ≤ x^b`; bound reduced "by a factor of `(δ log Q)²`"; the README matches | holds | none |
| 1.7b (iii) / `exists_prime_modEq_le` | `q = 3, a = 1`; Linnik I (2); Bombieri Th. 13 | `p = 7` needs `L ≥ log 7/log 3 = 1.771`; sources: `p_min < D^{C₀}`; Bombieri `k ≥ 2`, `c₀` effectively computable | holds | none |
| 1.7b (iv), third bound | `x = 4, 5` | `(2/3)(x−2) ≥ x/3 ⇔ x ≥ 4`; equality `4/3 = 4/3` at `x = 4` | holds | none |
| 2.9b Check (saving) | `n = 2, c = 0.1, S = 100` | `r = 130/134 = 0.970`; with 8: `77.6 < 8cS = 80`; with 12: `116.4 ≥ 9cS = 90` | holds | none |
| Docstring of `Suggested.lean` | 2.9b (iv) (c) | the Lean form states only `c, c′, X₀`, and the README's effective `c_ε` is not in it; "none claimed effective" is consistent | holds | none |
| Family index across heads | #2878, #2880, #2881, #2883, #2885, #2887 | here = #2878; #2885 = #2881 = #2880 = #2887 ≠ here (lines 9–14, 31, 112–113); #2883 older | description out of date | C02 |

The rows for the statements the diff does not touch (1.4e, 1.4f, 1.4h, 1.4i, 1.7a, 2.9b (i)–(iv), 2.41a, `norm_rieszRemainder_le`, `card_primes_norm_one_mod_shortInterval_ge`) stand as in the previous review, of 833bd0c.

- **Source locators checked against the text:**
  - Gallagher1970: (26)–(27), p. 336; Theorem 7, (29), and the remark after it, p. 337; the credit to [9] = Knapowski (lines 359–395 and 458; the page images were read).
  - Linnik1944a: (2), p. 139 (lines 20–27).
  - Linnik1944b: the Theorem, p. 347, and §3, the second basic theorem, p. 348 (lines 10–17 and 65–70; page image read). Pages 139–178 and 347–368 confirmed.
  - Bombieri1987: Théorème 13, p. 39; Théorème 14, p. 40; Théorème 16, p. 41 (lines 1173–1215 and 1248–1255; page images read).
  - BennettSiksek2020: lines 805–806.
- **Cross-roadmap citations resolved on main:** AnalyticNumberTheoryPartIII 8.3 (its line 495); ZerosOfLFunctions 3.3–3.4 (lines 693–762), 6.4 (4e) (line 1416) and its scope (line 2638); AnalyticNumberTheoryPartI §0.30a (line 681).
- **Library declarations:** no Lean statement changed, so none was reopened.
- **Elaboration:** only the three `sorry` warnings. `#check @name` for the three declarations matches 1.4i (c), 1.7b (iii) and 2.9b (iv) (c). A `simp` probe on Linnik's theorem leaves the goal open.
- **Automatic checks:** the worker's checks all passed. My own run of the gate passed every content check (two flags were set aside, see below). The dependency check gave `depcheck: 171 roadmaps, 1991 edges, 0 problem(s)`.
- **Family index:** the `README.md` was compared at 17 sibling heads and the `Suggested.lean` at 4.
- **Ownership:**
  - SieveMethodsAndPrimePatterns §2.9 is Linnik's theorem on the least quadratic non-residue, not on primes in progressions.
  - ExplicitZetaBounds 8.4 uses an explicit repulsion inside a route and states none.

Overlap check: I read LiCoefficientsArithmeticFormula (open) and, on main, AnalyticNumberTheoryPartIII, SieveMethodsAndPrimePatterns §2.9 and ExplicitZetaBounds 8.4. QuadraticTwistSelectionOverPrimes, RiemannHypothesisStatementsAndConsequences, GeneralizedRiemannHypothesisFromWindowBounds, ExplicitNumberFields, AnalyticNumberTheoryPartI and ZerosOfLFunctions stand as read in the previous round. The shared objects and their owners are:

- Landau's local logarithmic-derivative lemma: AnalyticNumberTheoryPartIII 8.3, now cited by 0.30b.
- The exception-free character prime number theorem: AnalyticNumberTheoryPartI §0.18.
- Riesz sums: RiemannHypothesisStatementsAndConsequences 8.4a.
- Linnik's theorem and the repulsion: this roadmap, 1.7b.
- LiCoefficientsArithmeticFormula's Laurent coefficients of `−ζ′/ζ` at `1` are a different object from the Taylor coefficients of 0.30b at `2 + it`.

Source independence: changed passages only. 6 passages were compared with 5 sources (Gallagher1970, Linnik1944a, Linnik1944b, Bombieri1987, BennettSiksek2020); none shares more than formulas and standard names (the longest shared run is "the factor `(δ log Q)²`"). The largest share of the 12 theorem-level locators is held jointly by Gallagher1970, Linnik1944a/b and Bombieri1987, 3 each. The contents were not compared again, because the diff adds, removes and reorders no layer.

Research link: 1.7b is Linnik's least-prime theorem (Linnik 1944; Bombieri 1987, Th. 13), with the Deuring–Heilbronn repulsion (Linnik 1944 II §3; Bombieri 1987, Th. 16) and Gallagher's theorem (Gallagher 1970, Th. 7). 1.4g (b) is Iwaniec–Kowalski Th. 5.27, used by Bennett–Siksek (2020). 2.9b follows Lagarias–Odlyzko (1977) and Stark (1974). This rests on the README and the four texts read.

## Not verifiable

- Iwaniec–Kowalski, *Analytic Number Theory*: no legal copy is known to the sources service. Theorem 5.27 was checked only through BennettSiksek2020.
- Davenport1980 and Stark1974: settled as uncertified (paywalled).
- Knapowski 1962: not in the sources cache. It was checked only through Gallagher's credit (Gallagher1970 lines 372–376, and its reference 9 at line 458).
- Lagarias–Odlyzko 1977: no legal source was found in an earlier round; not retried.
- [FormalProof] (a GitHub repository) and [Announcement] (alpo.ge): neither host is in a licence class; not read.

Automatic checks set aside as false positives: the rule that a pull request changes nothing outside its roadmap folder, which keeps edits to other roadmaps from riding along unreviewed, flagged the three family-index files directly under the family folder, but those files belong to this pull request. The rule that every roadmap has its place in the merge order after its suppliers noted that this roadmap is not listed yet, which is expected for a new roadmap: it is placed after its last supplier.

## Source issues

- **Misprint** in BennettSiksek2020 at Theorem 5, (26), p. 17 (arXiv v1): the source says the error term carries the factor `(log N)⁴` for every primitive `χ`, the trivial one included; it should read `(log 3N)⁴`, or exclude `N = 1`, where that factor vanishes; affects nothing.

## For the human reviewers

- Scope: README lines 921–922 cite a Lean repository formalising the Riemann hypothesis, announced on 20 November 2026 at alpo.ge. It is not refereed, its host is in no licence class, and I did not read it.
- Not tested: Iwaniec–Kowalski, [FormalProof], Davenport, Stark, Lagarias–Odlyzko and Knapowski could not be read. The wording of the changed passages was compared only with Gallagher1970, Linnik1944a/b, Bombieri1987 and BennettSiksek2020.
- Design: with AnalyticNumberTheoryPartI §0.34 on main, 0.30b, 1.7a and 1.7b (i) serve only the routes of the exception-tolerant forms (Scope, README line 850).
- GaloisSectionsPadicPeriodMaps (an open pull request, its README line 1516) declares the gap `linnik-polynomial-least-prime`, which asks AnalyticNumberTheoryPartI for Linnik's theorem. This roadmap states that theorem (1.7b (iii)).
