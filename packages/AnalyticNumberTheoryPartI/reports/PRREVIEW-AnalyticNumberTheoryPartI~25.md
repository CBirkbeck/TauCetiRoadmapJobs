# Review of AnalyticNumberTheoryPartI (pull request #3027 at 7633b39)

**Verdict:** accepted

**Summary.** An incremental re-review: the folder has not changed since `6ff5aef` (0 lines), so this round read the pull request's title and description against this head and checked the citations of this roadmap that the rest of the pull request added since. Accepted, with no finding: the title and the part of the description that was read agree with the head. There are no small corrections and two format notes in untouched text, none blocking; one question on the end of the description and one licence question remain.

## N01 — Untouched text: §§0.6 and 0.18 cite Iwaniec–Kowalski by name instead of as [117]

Lines 150 and 481 cite "Iwaniec–Kowalski Theorem 5.26" and "Theorem 5.27"; the book is [117] in the references, and §0.1 cites it by that number.

## N02 — Untouched text: the *Needs:* line of §2.42a keeps the whole-layer style

Line 2115 cites "[LFunctions Layers 5, 6 and 7]" and "[GlobalNumberFields 9]", where the other *Needs:* lines of the README cite the sections used.

## Questions for the author

- The part of the description that was read names, for this roadmap, §§1.4e, 1.7a and 1.7b only. Against `main` the head also adds §1.6a (conjugate characters, reflection and the half-plane form), §2.42a (the generalized Riemann hypothesis for ray-class characters of every modulus and for algebraic Hecke characters) and two declarations to `Suggested.lean` (`deuring_heilbronn_repulsion`, `exists_prime_modEq_le`). Does the description name them further down? The copy available to this review is cut before its end, so this could not be checked; if it does not, one clause naming them would complete it.

## Previous findings

- No finding (R) was open, and no small correction.
- N01 — not repaired, untouched text: "Iwaniec–Kowalski Theorem 5.27" (line 481); N01 above.
- N02 — not repaired, untouched text: "[LFunctions Layers 5, 6 and 7]" (line 2115); N02 above.

## Verified sound

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| A | §1.7b, `exists_prime_modEq_le` (named by the description): least prime `p≡a (mod q)` is `≤q^A` | every `3≤q≤1000`, every `a` coprime to `q` | largest `log p/log q` = 1.829 at `(q,a,p)=(5,4,19)`; `(3,1,7)`: 1.771; `(1000,1,3001)`: 1.159; so `A=2` suffices in range, and `A>1` is needed, as the Check says | consistent |
| B | same, Lean binders | `a=0`; `a≥q`; `q<3` | `Nat.Coprime 0 q` forces `q=1`, excluded by `3≤q`; `a≥q` is read modulo `q`; real power `q^A` with `q≥3>0` | no junk case |
| C | Description: §§1.4e, 1.7a, 1.7b "without the effectivity of the constants, which the sources prove" | README lines 949, 1053, 1065, 1077; docstrings of the two theorems | each section says effectivity is not part of the statement and names the source that proves it (Bombieri, Théorèmes 13–16); Lean: bare `∃ c`, `∃ A` | description true of the head |
| D | §0.12 as newly cited from the family (effective gap `1−β≥c_ε q^(−1/2−ε)`, "stated there for the field characters `χ_D`") | README line 364; §0.34a at line 780 | §0.12: `1−β≥c_ε|D|^(−1/2−ε)`, `β∈(1/2,1)`, `|D|≤Q_D≤4|D|`; §0.34a: a real primitive character of conductor `q` is the Kronecker character of `D=χ(−1)q` | citation matches |
| E | §2.15a as newly cited from the family (at most `τ_d(m)` ideals of norm `m`) | README line 1586; `K=ℚ(i)`, `m=5,2,3` | §2.15a: `0≤a_K(n)≤d_d(n)`; ideals of norm 5, 2, 3 in `ℤ[i]`: 2, 1, 0; `d_2` = 2, 2, 2 | citation matches |

The rows of the previous reviews for the statements this change does not touch stand as in the previous review, of `6ff5aef`.

- Change since `6ff5aef`: 0 lines in the folder (`git diff` empty); `Suggested.lean` and the README are those the previous review accepted.
- Source locators checked against the text: 0 new (no changed passage); the sample targets lie in untouched text and stand as reviewed.
- Cross-roadmap citations resolved at this head: the family's citations of this roadmap added since `6ff5aef` (§§0.12, 0.34a, 2.15, 2.15a) exist here and state what they are cited for (rows D, E); the other section ids the family cites (§§0.1–0.34a, 1.4–1.9, 2.3a–2.49) are all present as headings or bold sub-sections.
- Record against the merge base: 4 layers, none removed or retitled; 0 headings removed, 5 added (§§1.4e, 1.6a, 1.7a, 1.7b, 2.42a); 0 Lean declarations removed, 2 added; no supplier subsection added or dropped.
- Automatic checks: all passed. Dependency check: `depcheck: 122 roadmaps, 1389 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. Every file the pull request changes lies in a roadmap folder it names as its own.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 64 warnings, all `declaration uses sorry`.
- Pull request text: the title ("published theory to the general roadmaps …") covers this folder as one of the general roadmaps that receive sections; the description says existing roadmaps "receive" sections, which is a revision that removes and renumbers nothing, in agreement with the record above; its one sentence on this roadmap is row C. No sentence of the part read is contradicted by the head.

Overlap check: read RieszSumsOverPrimesAndExceptionalZeros, ZerosOfLFunctions, SieveMethodsAndPrimePatterns and ExplicitNumberFields as in the previous review; the folder is unchanged, no open pull request changes this roadmap or drops an id it cites, and this pull request drops no id of it; nothing shared.

Source independence: changed passages only; there are none, so 0 passages compared with 0 sources; contents not compared, since no layer is added, removed or reordered. The comparisons of the previous reviews stand.

Research link: §§1.7a–1.7b are the Deuring–Heilbronn repulsion and Linnik's least-prime theorem (Linnik 1944; Knapowski 1962; Gallagher 1970; Bombieri, Astérisque 18, §6); §1.4e is the conductor-uniform character prime-number estimate (Iwaniec–Kowalski 2004, Theorem 5.27, as used by Bennett–Siksek 2020). Rests on the README and on `bombieri1987` and `bennettsiksek2020`.

## Not verifiable

- The end of the pull request's description, which is cut in the copy read; whether it names §§1.6a and 2.42a and the two added declarations is the question above.
- As in the previous review: Iwaniec–Kowalski [117], Davenport [112], Linnik [118], Knapowski [119], Gallagher [120], Bach [121] and Belabas–Diaz y Diaz–Friedman [122] (no text held); Bombieri pp. 41–42 (illegible lines); the printed page 373 of Bennett–Siksek (the text held is the preprint).

## Source issues

- none

## For the human reviewers

- Licence: Bach [121] and Belabas–Diaz y Diaz–Friedman [122] (Math. Comp., cited by §2.42a) and Jutila [R97] (Math. Scand., cited by §1.7) are cited by publisher locator with no text held; whether the publishers' pages are open archives is yours to settle.
- The two recorded decisions concern roadmaps under RiemannHypothesisForDirichletLFunctions; this folder removes nothing, so neither was needed here.
