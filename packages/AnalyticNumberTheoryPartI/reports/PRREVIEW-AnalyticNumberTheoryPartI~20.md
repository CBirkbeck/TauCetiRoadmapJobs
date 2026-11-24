# Review of AnalyticNumberTheoryPartI (pull request #3027 at e47c8ec)

**Verdict:** accepted

**Summary.** An incremental re-review of the 52 lines changed since `e7914b5`: accepted, with no finding. The pull request's own change is one line, the *Needs:* line of §1.7a(ii), which now describes Bombieri's Théorème 11 correctly; the other 51 lines are `main`'s rewrite of *Needs:* lines (sections cited instead of whole layers, and new *Needs:* lines for eleven sub-targets), which arrived by a merge and whose expansions and citations all resolve. There are three small corrections (one new, two in untouched text) and two format notes, none blocking. One licence question is left for the human reviewers.

## C01 — §1.7a(ii)'s new *Needs:* line does not say that the weighted large sieve is over primitive characters

An implementer who reads "the characters of moduli `q≤Q`" as all characters modulo `q` is given an inequality that is false with an absolute constant. The line (README line 1071) reads "the large sieve inequality for the characters of moduli `q≤Q` with the weights `log(Q/q)`, for coefficients supported on integers with no prime factor `≤Q`".

With `a_n=1` on the integers `1<n≤N` free of prime factors `≤Q`, the ratio of `Σ_{q≤Q}log(Q/q)Σ_χ|Σa_nχ(n)|²` to `Σ|a_n|²(n+Q²)` at `(Q,N)=(5,2000),(11,2000),(23,4000),(47,8000)` is `0.83, 0.89, 0.80, 0.68` over primitive `χ`, but `1.69, 3.28, 5.24, 7.76` over all `χ` modulo `q` (each principal character contributes the full `|Σa_n|²`). Writing "for the primitive characters of moduli `q≤Q`" settles it; the line could also say that Théorème 11 is the hybrid form, with the integral of `|Σa_nχ(n)n^(it)|²` over `|t|≤T` and the right side `Σ|a_n|²(n+Q²T)`.

## C02 — Untouched text: §§0.1, 0.17 and 0.18 claim effective constants from the zero-free region that §§1.4e, 1.7a and 1.7b treat as existential

Carried from the previous review and unchanged. §§1.4e and 1.7b drop effectivity because the constant of the region of ZerosOfLFunctions 6.3–6.4 "is existential" (README line 1077), and the last Check of §1.4e says that §0.18's effectivity "is not given by this route". Yet §0.1, §0.17 (line 457, "There is an effective absolute `c_star>0`") and §0.18 (line 471) claim effective constants on routes through that same region. A separate change would either name the source of an effective region constant in §0.1's supplier comparison, or drop "effective" in those three places.

## C03 — Untouched text: §2.3a writes the algebraic character with the opposite sign of the norm power

Carried from the previous review and unchanged. A bullet of §2.3a (line 1361) writes `χ₀=χ₀,u|·|^σ` with `σ` "LFunctions Layer 6's ideal-side shift". With `|·|` the idele norm, as in the twist rule of the bullet before it, this gives the completion at `s+σ`, against the same bullet's `Λ_H(χ₀,u,s+t−σ)`; LFunctions' convention makes the ideal-side shift the negative of the idelic one. Writing `|·|^(−σ)`, or saying that the norm there is the ideal norm, fixes it. §2.42a has the right sign and refers the reader to this bullet.

## N01 — Untouched text: §§0.6 and 0.18 cite Iwaniec–Kowalski by name instead of as [117]

Lines 150 and 481 cite "Iwaniec–Kowalski Theorem 5.26" and "Theorem 5.27"; the book is [117] in the references, and the sections this pull request adds cite it by that number.

## N02 — The *Needs:* lines of the added sections keep the whole-layer style that the rest of the README has now left

After the merge of `main`, the *Needs:* lines elsewhere cite sections ("ClassFieldTheory §11.1", "ZerosOfLFunctions §§4.2, 4.4 and 4.5"). §2.42a (line 2115) still cites "[LFunctions Layers 5, 6 and 7]" and "[GlobalNumberFields 9]"; it would read as the others do with the sections it uses.

## Deferred findings

- D01 — resolved: the other pull request that edited this README has merged to `main`, this head has merged `main`, and no open pull request changes this roadmap.

## Previous findings

- No finding (R) was open. C01 of the previous review — repaired: "the large sieve inequality for the characters of moduli `q≤Q` with the weights `log(Q/q)`, for coefficients supported on integers with no prime factor `≤Q`" (line 1071); the repair leaves C01 above.
- C02 — repaired: deferred (D01), and settled since: the other pull request is merged and its *Needs:* lines are in this head; the added sections' citation style is N02.
- C03 — not repaired, untouched text: "There is an effective absolute `c_star>0`" (line 457) against "Effectivity is not part of this statement" (line 1077); C02 above.
- C04 — not repaired, untouched text: "written `χ₀=χ₀,u|·|^σ` with `χ₀,u` unitary and `σ` LFunctions Layer 6's ideal-side shift" (line 1361); C03 above.
- N01 — not repaired, untouched text: "Iwaniec–Kowalski Theorem 5.27" (line 481); N01 above.

## Verified sound

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| A | §1.7a(ii) *Needs:*, Théorème 11 as described | sieved `a_n`, `(Q,N)=(5,2000),(11,2000),(23,4000),(47,8000)` | left/right over primitive `χ`: `0.83, 0.89, 0.80, 0.68`; over all `χ`: `1.69, 3.28, 5.24, 7.76` | bounded for primitive only; C01 |
| B | same, the sieved-support hypothesis | `a_n=1` on all `1<n≤N`, same `(Q,N)` | primitive `χ`: `3.14, 4.27, 4.96, 4.96`, growing like `log Q`; sieved: `≤0.89` | hypothesis is needed, and stated |
| C | same, against the source | `bombieri1987` lines 952–957 | `a_n=0` when `n` has a prime factor `≤Q`; weight `log(Q/q)`; right side `Σ|a_n|²(n+Q²T)`; used at line 1580 | description agrees |
| D | Expansions of `B1`, `B3`, `B4` in nine *Needs:* lines | lines 1639, 1742, 1948, 2012, 2131, 2145, 2157, 2209 against lines 29–32 | `B3` 3 items, `B4` 6, `B1` 14: each expansion has the same items, with Layer 3 → 3a, 7 → §7.1, 11 → §11.1 | equal |
| E | §2.49 (sampled) *Needs:* | `B3` expansion; Chebotarev Layers 8, 11, 13; ArithmeticDirichletSeries Layer 6 | all four headings exist in the Completed roadmaps; statement and locators untouched | holds |

The rows of the previous review for the statements this change does not touch stand as in that review, of `e7914b5`.

- Source locators checked against the text: 1 (Bombieri, Théorème 11, printed p. 31, `bombieri1987` lines 952–957, and its use at line 1580).
- Library declarations opened at the pins: 8 (`MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1148`; `GroupTheory/Exponent.lean:72`; `FieldTheory/IsAlgClosed/Basic.lean:63–69`; `NumberTheory/SmoothNumbers.lean:391, 394`; `LinearAlgebra/Charpoly/ToMatrix.lean:60`; `NumberTheory/NumberField/DedekindZeta.lean:57`; `NumberTheory/LSeries/DirichletContinuation.lean:149`; Tau Ceti `NumberTheory/LocalField/Different/Basic.lean:92`, `TauCeti.differentExponent`).
- Cross-roadmap citations resolved at this head: ClassFieldTheory §§7.1, 11.1, 13.1; RepresentationTheory/InductionRestriction Layers 3a, 3b and 6; ZerosOfLFunctions §§1.2–1.4, 4.1, 4.2, 4.4, 4.5, 5.6; Completed/NumberFieldArithmetic Layers 1, 2 and 7 (normal closures are in Layer 7); Completed/ArithmeticDirichletSeries Layers 1, 3, 5, 6; Completed/GlobalNumberFields Layers 9, 10; Completed/Chebotarev Layers 8, 11, 13.
- Record against the merge base: 4 layers, none removed or retitled; 0 headings removed, 5 added; 0 Lean declarations removed, 2 added. Against `main` the folder's change is the same 178 lines as at `e7914b5`, but for the one *Needs:* line of §1.7a(ii).
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1468 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. Every file the pull request changes lies in a roadmap folder it names as its own.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 64 warnings, all `declaration uses 'sorry'`. `Suggested.lean` is unchanged since `e7914b5`, so the signatures stand as compared then.
- Seeded sample: of the 15 targets only §2.49 lies in a changed passage (its *Needs:* line, row E); the other 14 are outside the change.
- Pull request text: its sentence on this roadmap (§§1.4e, 1.7a and 1.7b "without the effectivity of the constants, which the sources prove") agrees with the head; no other open pull request changes this roadmap.

Overlap check: read RieszSumsOverPrimesAndExceptionalZeros, ZerosOfLFunctions, SieveMethodsAndPrimePatterns and ExplicitNumberFields as in the previous review; the change adds no statement and no owner, so ownership stands as found there (the repulsion, Linnik's theorem and the character prime-number estimate owned here, the region by ZerosOfLFunctions); nothing shared.

Source independence: changed passages only; 1 passage compared with 1 source (`bombieri1987`, the description of Théorème 11 in §1.7a(ii)), nothing shared beyond the hypotheses the mathematics forces; the other changed lines are lists of section numbers; largest share `bombieri1987`, 1 of 1 literature locators of the changed passages; contents not compared, since no layer is added, removed or reordered.

Research link: §§1.7a–1.7b are the Deuring–Heilbronn repulsion and Linnik's least-prime theorem (Linnik 1944; Knapowski 1962; Gallagher 1970; Bombieri, Astérisque 18, §6); §1.4e is the conductor-uniform character prime-number estimate (Iwaniec–Kowalski 2004, Theorem 5.27, as used by Bennett–Siksek 2020). Rests on the README and on `bombieri1987` and `bennettsiksek2020`.

## Not verifiable

- Bombieri, Théorème 11: the recognised text has lost the mark on the character sum (`bombieri1987` line 955), so whether the source prints the sum over primitive characters was not read; C01 rests on the computation.
- As in the previous review: Bombieri pp. 41–42 (illegible lines), Iwaniec–Kowalski [117], Davenport [112], Linnik [118], Knapowski [119], Gallagher [120], Bach [121] and Belabas–Diaz y Diaz–Friedman [122] (no text held), and the printed page of Bennett–Siksek Theorem 5.

## Source issues

- none

## For the human reviewers

- Licence: Bach [121] and Belabas–Diaz y Diaz–Friedman [122] (Math. Comp., cited by §2.42a) and Jutila [R97] (Math. Scand., cited by §1.7) are cited by publisher locator with no text held; whether the publishers' pages are open archives is yours to settle.
- The two recorded decisions concern roadmaps under RiemannHypothesisForDirichletLFunctions; this folder removes nothing, so neither was needed here.
