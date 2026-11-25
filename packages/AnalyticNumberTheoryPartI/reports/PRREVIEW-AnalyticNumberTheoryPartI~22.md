# Review of AnalyticNumberTheoryPartI (pull request #3027 at 6ff5aef)

**Verdict:** accepted

**Summary.** An incremental re-review of the 6 lines changed since `e47c8ec`, with the title and description read against this head: accepted, with no finding. The three changed passages repair the three small corrections of the previous review, and each repair is correct: the hybrid large sieve of §1.7a(ii) is now stated as Bombieri's Théorème 11 has it, §0.1 names the source of the effectivity it asserts, and §2.3a has the sign of the norm power that LFunctions' convention gives. There are no small corrections and two format notes in untouched text, none blocking; one question on the description and one licence question remain.

## N01 — Untouched text: §§0.6 and 0.18 cite Iwaniec–Kowalski by name instead of as [117]

Lines 150 and 481 cite "Iwaniec–Kowalski Theorem 5.26" and "Theorem 5.27"; the book is [117] in the references, and the sentence this change adds to §0.1 cites it by that number.

## N02 — Untouched text: the *Needs:* line of §2.42a keeps the whole-layer style

Line 2115 cites "[LFunctions Layers 5, 6 and 7]" and "[GlobalNumberFields 9]", where the other *Needs:* lines of the README cite the sections used.

## Questions for the author

- The part of the description that was read names, for this roadmap, §§1.4e, 1.7a and 1.7b only. The head also adds §1.6a (conjugate characters and the half-plane form), §2.42a (the generalized Riemann hypothesis for ray-class and algebraic Hecke characters) and two declarations to `Suggested.lean` (`deuring_heilbronn_repulsion`, `exists_prime_modEq_le`). Does the description name them further down? The text available to this review was cut before its end, so this could not be checked; if it does not, one clause naming them would complete it.

## Previous findings

- No finding (R) was open.
- C01 — repaired: "the large sieve inequality for the primitive characters of moduli `q≤Q` with the weights `log(Q/q)`, in its hybrid form: for `T≥1` and absolutely summable `a_n` vanishing at every `n` with a prime factor `≤Q`" (line 1071).
- C02 — repaired: "The supplier states `c₁` existentially, so a route through this comparison gives its constants as existing; the effectivity asserted of `c_star` … is that of the classical region and two-zero inequality" (line 77).
- C03 — repaired: "written `χ₀=χ₀,u|·|^(−σ)` with `χ₀,u` unitary and `σ` LFunctions Layer 6's ideal-side shift" (line 1361).
- N01 — not repaired, untouched text: "Iwaniec–Kowalski Theorem 5.27" (line 481); N01 above.
- N02 — not repaired, untouched text: "[LFunctions Layers 5, 6 and 7]" (line 2115); N02 above.

## Verified sound

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| A | §1.7a(ii) *Needs:*, hybrid large sieve, against the source | `bombieri1987` lines 924–928 (Théorème 10) and 952–957 (Théorème 11) | source: `Σ|a_n|<∞`, `T≥1`, `a_n=0` at `n` with a prime factor `≤Q`, weight `log(Q/q)`, integral over `[−T,T]`, right side `Σ|a_n|²(n+Q²T)`; README: the same | agrees |
| B | same, degenerate coefficient `a_1=1` (allowed: 1 has no prime factor) | `(Q,T)=(5,1),(20,10),(100,1),(400,10)` | left `2TΣ_{q≤Q}log(Q/q)φ*(q)` = 4.7, 732.6, 1844.0, 295616.2; right `1+Q²T` = 26, 4001, 10001, 1600001; ratios 0.180, 0.183, 0.184, 0.185 | bounded |
| C | §2.3a, sign of the norm power | `K=ℚ`, `χ₀=N` on ideals (ideal-side shift `σ=1`), series `ζ(s−1)` | `|·|^(−σ)` with the twist rule `Λ_H(ω|·|^u,s)∝Λ_H(ω,s+u)` at `u=−1`: `ζ(s−1)`; the former `|·|^σ`: `ζ(s+1)` | head correct; agrees with LFunctions Conventions item 10 (`N^m` is `‖·‖^(−m)`) and with `Λ_H(χ₀,u,s+t−σ)` |
| D | §0.1, source of the effectivity of `c_star` | `bennettsiksek2020` lines 771–782 | the source states an effectively computable absolute `c∗` and says it combines Theorems 5.26 and 5.28 of its [20], Iwaniec–Kowalski (line 1395); the README cites [117], Theorems 5.26 and 5.28, and [47], Proposition 7.1 | supported |
| E | §0.1's new sentence against §§0.17, 1.4e, 1.7b | lines 77, 457, 1077 | §0.17 asserts effective `c_star`; §1.7b drops effectivity because its route uses the existential supplier constant; line 77 now says a route through the supplier gives existence only | consistent |

The rows of the previous review for the statements this change does not touch stand as in that review, of `e47c8ec`.

- Source locators checked against the text: 3 (Bombieri, Théorèmes 10 and 11, printed pp. 31–32, `bombieri1987` lines 924–928 and 952–957; Bennett–Siksek, Proposition 7.1, `bennettsiksek2020` lines 771–782).
- Cross-roadmap citations resolved at this head: LFunctions Conventions item 10 (the ideal-side shift, the negative of the idelic one) and Layer 6; ZerosOfLFunctions 6.3–6.4 as cited by the new sentence of §0.1.
- Record against the merge base: 4 layers, none removed or retitled; 0 headings removed, 5 added; 0 Lean declarations removed, 2 added. Since `e47c8ec` the folder changed in three README lines only; `Suggested.lean` is unchanged.
- Automatic checks: all passed. Dependency check: `depcheck: 124 roadmaps, 1407 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. Every file the pull request changes lies in a roadmap folder it names as its own.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 64 warnings, all `declaration uses sorry`.
- Seeded sample: none of the 15 targets lies in a changed passage; §0.17 (sampled) is cited by the new sentence of §0.1, whose claim about it is row D.
- Pull request text: the title and the part of the description read agree with this head; its sentence on this roadmap (§§1.4e, 1.7a and 1.7b "without the effectivity of the constants, which the sources prove") holds (line 1077), and the new sentence of §0.1 does not bear on it. It says the roadmap receives sections, which is a revision that removes and renumbers nothing; that agrees with the record above.

Overlap check: read RieszSumsOverPrimesAndExceptionalZeros, ZerosOfLFunctions, SieveMethodsAndPrimePatterns and ExplicitNumberFields as in the previous review; the change adds no statement and no owner; no open pull request changes this roadmap or drops an id it cites; nothing shared.

Source independence: changed passages only; 2 passages compared with 2 sources (`bombieri1987`, the statement of Théorème 11 in §1.7a(ii); `bennettsiksek2020`, Proposition 7.1 beside the new sentence of §0.1), nothing shared beyond the formula and hypotheses the mathematics forces; largest share of the changed passages' locators `bombieri1987` and `bennettsiksek2020`, 1 each of 3; contents not compared, since no layer is added, removed or reordered.

Research link: §§1.7a–1.7b are the Deuring–Heilbronn repulsion and Linnik's least-prime theorem (Linnik 1944; Knapowski 1962; Gallagher 1970; Bombieri, Astérisque 18, §6); §1.4e is the conductor-uniform character prime-number estimate (Iwaniec–Kowalski 2004, Theorem 5.27, as used by Bennett–Siksek 2020). Rests on the README and on `bombieri1987` and `bennettsiksek2020`.

## Not verifiable

- Iwaniec–Kowalski [117], Theorems 5.26 and 5.28, cited by the new sentence of §0.1: no text held; the pairing of the two theorem numbers rests on Bennett–Siksek's own attribution (`bennettsiksek2020` line 771).
- The printed page 373 of Bennett–Siksek, Proposition 7.1: the text held is the preprint, with its own page numbers.
- Bombieri, Théorème 11: the recognised text has lost the mark on the character sum (`bombieri1987` line 955), so that the sum is over primitive characters was not read there; Théorème 10 (line 927) shows the mark, and the previous review's computation shows the restriction is needed.
- The end of the pull request's description, which was cut in the copy read.
- As in the previous review: Bombieri pp. 41–42 (illegible lines), Davenport [112], Linnik [118], Knapowski [119], Gallagher [120], Bach [121] and Belabas–Diaz y Diaz–Friedman [122] (no text held).

## Source issues

- none

## For the human reviewers

- Licence: Bach [121] and Belabas–Diaz y Diaz–Friedman [122] (Math. Comp., cited by §2.42a) and Jutila [R97] (Math. Scand., cited by §1.7) are cited by publisher locator with no text held; whether the publishers' pages are open archives is yours to settle.
- The two recorded decisions concern roadmaps under RiemannHypothesisForDirichletLFunctions; this folder removes nothing, so neither was needed here.
