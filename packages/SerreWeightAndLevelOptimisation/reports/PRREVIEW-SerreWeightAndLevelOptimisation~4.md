# Review of SerreWeightAndLevelOptimisation (pull request #1013 at 9f2eed7)

**Verdict:** accepted

Incremental re-review of the 10 lines changed since 0825d40, and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: §3.3 now cites "Kenneth A. Ribet … §6, Theorem 6.1 and Lemmas 6.2–6.3, pp. 469–471. The proof for trivial `ε` and odd p"; References list Ribet 1990 (§§2.6, 3.3) and link Mazur–Ribet's author PDF (§5.2).
- R02 — repaired: the description now reads "Claude Fable 5.1 and Claude Opus 5.5 for the later repairs (the §4.7 statement in `Suggested.lean`, the weight-two hypothesis of §4.2, the §2.9–§2.10 route and the citation fixes)".

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §3.3, new proof locator (Ribet 1990 §6) | ribet90 scan, printed pages | "6. A theorem of Mazur" and Theorem 6.1 at line 1643 (p. 469), Lemma 6.2 line 1650 (p. 469), Lemma 6.3 line 1690 (p. 470), proof of 6.1 ends p. 471 (lines 1704–1712) | section, numbers and pages match |
| §3.3, "trivial `ε` and odd p" | Theorem 6.1's hypotheses | Hecke ring of `J₀(pM)` (line 1633): trivial character; hypothesis (ii) residue characteristic odd (line 1638); at `p = ℓ`, `p mod ℓ = 0 ≠ 1`, so the congruence condition is automatic | matches; the finite-at-p conclusion is the contrapositive used in §3.3 |
| §3.3, "to which Edixhoven refers Theorem 2.8 and which he states extends to arbitrary `ε`" | edixhoven92 (published scan) | Theorem 2.8 lines 278–282; line 283 refers to [22, §6] for trivial `ε`, `p > 2`; line 284 says it generalises to arbitrary `ε`; [22] at line 1337 is Invent. Math. 100, 431–476 | matches |
| §2.9, "General-weight branch for `ℓ≥5`", "places no condition on the character" | ribet94 (4.7), lines 532–535; `ℓ = 3`, `ℓ = 5` | (4.7): `ℓ ≥ 5`, weight k arbitrary, level `Γ1(M) ∩ Γ0(p)`, no hypothesis on the nebentypus; `ℓ = 3 < 5` excluded there and covered only by §8 (line 544–545: `ℓ` odd) | matches |
| References: Ribet 1990 "used in §§2.6 and 3.3" | README lines 452, 651 | line 452 (§2.6) cites it for §3, Proposition 3.3, pp. 440, 444–446; line 651 is §3.3; no other link to the file | matches |
| References: Mazur–Ribet "author PDF, 41 pages; used in §5.2" | the linked PDF; README line 1161 | 41 pages; line 1161 (§5.2) adapts its weight-two argument; Edixhoven’s citation of it as [18] occurs only inside the `p = 2` remark | matches |

The rows for untouched statements stand as in the previous review, of 0825d40.

- Source locators checked against the text: 5 (ribet90 Theorem 6.1, Lemmas 6.2 and 6.3; edixhoven92 Theorem 2.8 and its reference [22]; ribet94 (4.7)), plus the page count of the Mazur–Ribet PDF.
- Seeded sample: of its targets only 2.9 falls in the changed passages; checked above.
- Gate at this head: every rule 0, `OK`. Dependency check: `depcheck: 245 roadmaps, 2243 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with four `declaration uses sorry` warnings (lines 74, 93, 108, 128) and nothing else; the diff changes no Lean.
- Nothing changed outside the folder (`git diff --stat origin/main...HEAD` outside it is empty); the branch has merged main.
- Description against the head: it adds the folder (README, `Suggested.lean`, `metadata.toml`; 6 declarations, 4 of them `sorry` theorems, as its validation sentence says); the models named (GPT-6 Codex, Astra, Claude Fable 5.1, Claude Opus 5.5) cover the `Co-Authored-By` trailers of all 13 commits on the folder; no supplier or section was added or dropped since 0825d40, so the summary block and dependency paragraph stand as checked then.
- Citation leads of the worker (`AlgebraicModularFormsAndSerreWeights R15.3`, `HasFiniteFlatModel.of_isUnramified`) lie in untouched text the previous reviews passed; not reopened.

Overlap check: read AlgebraicModularFormsAndSerreWeights, GL2ModularityLifting, ClassicalSerreModularity (changed passages only); nothing shared: the change touches only citations and wording of §2.9 and §3.3, both owned here.

Source independence: changed passages only; 4 passages compared with 4 sources (ribet94, ribet90, edixhoven92, the Mazur–Ribet author PDF), none shared; largest share ribet94, 29 of the 102 source links before the References; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` line 1732 links Gross's Duke article as a scan of the published paper hosted on a third party's seminar page (`math.purdue.edu/~tongliu/seminar/Mlift/Gross.pdf`), neither the publisher's nor the author's; its status as a legal copy was not settled.
