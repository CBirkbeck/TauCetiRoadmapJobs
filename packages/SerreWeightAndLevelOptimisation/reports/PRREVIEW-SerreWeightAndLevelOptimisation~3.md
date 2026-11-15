# Review of SerreWeightAndLevelOptimisation (pull request #1013 at 0825d40)

**Verdict:** needs changes

Incremental re-review of the 12 lines changed since 5999164, and of the pull request's title and description against this head. Two P3 findings; no P1 or P2.

## R01 (P3) — §3.3 and the new References entry attribute the proof of Theorem 2.8 to the wrong paper

**Location:** `TauCetiRoadmap/SerreWeightAndLevelOptimisation/README.md` line 651 ("the proof is Mazur–Ribet, Astérisque 196–197, §6") and line 1726 ("No open copy is known; it is cited by locator only (§6 in §3.3)").

**Claim:** Edixhoven refers the proof of Theorem 2.8 to §6 of Mazur–Ribet's Astérisque article, and that article has no open copy.

**Witness:** edixhoven92 line 222 refers to "[22], §6"; lines 1144–1145 give [22] = Ribet, Invent. Math. 100 (1990), 431–476; Mazur–Ribet is [18] (line 1136). Mazur–Ribet's §6 is "Rosenlicht differentials" (author PDF `math.berkeley.edu/~ribet/Articles/mazur-ribet.pdf`, line 684), an open copy.

**Repair:** The wording this repair adopted came from the previous review's R02, which misread [22]; the pages and Proposition 8.2 are right. In §3.3 replace "the proof is Mazur–Ribet, Astérisque 196–197, §6" by "the proof for trivial `ε` and odd p is Ribet, Invent. Math. 100 (1990), §6, which Edixhoven extends to arbitrary `ε`". In References add "Kenneth A. Ribet, *On modular representations of Gal(Q̄/Q) arising from modular forms*. Inventiones Mathematicae 100 (1990), 431–476. Cited by locator only (§6 in §3.3)." Keep the Mazur–Ribet entry, since §5.2 (line 1161) uses that article, but link it to the author PDF above and replace its last sentence by "Author PDF, 41 pages; used in §5.2."

## R02 (P3) — the description's AI-assistance sentence omits the model used for the review repairs

**Location:** pull request description: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with two author-side red-team passes (GPT-6 Codex and Astra, then a second Codex pass) applied before review."

**Claim:** the sentence lists the models used on this pull request.

**Witness:** commits 5999164f and 0825d407 (the review repairs: `weight_two_at_level_mul_prime`, the `2 ≤ w` hypothesis, citation fixes) carry `Co-Authored-By: Claude Fable 5.1`; `CONTRIBUTING.md` lines 54–56 ask for every model used to be named in the description.

**Repair:** append to that sentence: "The repairs made after review (stating §4.7 in `Suggested.lean`, the weight-two hypothesis of §4.2, the §2.9–§2.10 route and citation fixes) were made with Claude Fable 5.1."

## Previous findings

- R01 — repaired: §2.10 route now ends "The contradiction shows occurrence at level Mr; §2.9 at r … gives level M"; *Needs:* lists §2.9; §2.9 reads "character modulo M, with M allowed to contain powers of `ℓ`" and drops the (4.7) normalisation clause.
- R02 — partly repaired: line 651 now cites "Theorem 2.8 and the `p=2` remark following it, author pp. 6–7; §8, Proposition 8.2, author pp. 26–27" (correct), but names Mazur–Ribet for the proof (R01 above).

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §2.9, weight-two branch as reworded | `ℓ = 3`, `q = 2`, `M = 9`; `ℓ = 3`, `q = 7` | `gcd(9, 2) = 1` and `2 ≢ 1 mod 3`: ribet94 Theorem 8.1 (lines 1311–1313) applies, N only prime to q; `7 ≡ 1 mod 3`: excluded | matches; (4.7) itself needs `ℓ ≥ 5` (line 532) |
| §2.10, new final step (§2.9 at r) | `ℓ = 3`: `r = 2, 5, 11`; `ℓ = 5`: `r = 19`; `ℓ = 2` | `r mod 3 = 2 ≠ 1`; `19 mod 5 = 4 ≠ 1`; at `ℓ = 2`, `−1 ≡ 1`, step fails, excluded by `ℓ ≥ 3` | matches ribet94 lines 1108, 1150–1153 |
| §2.10, character after the §2.9 step | trivial nebentypus at level Mr | Theorem 8.1's Hecke ring contains `⟨d⟩`, `d ∈ (ℤ/N)ˣ` (ribet94 line 1318), so `φ(⟨d⟩) = 1` descends to level M | `Γ0(M)` conclusion is consistent |
| §2.10 *Needs:* with §2.9 added | cycle test | §2.9 needs §1.4, §2.6, §2.1 and suppliers (line 511); none is §2.10 | no cycle |
| §3.3 locators | edixhoven92, author pages = cache pages | Theorem 2.8 lines 217–221 (p. 6), `p = 2` remark lines 223–230 (pp. 6–7), Proposition 8.2 lines 943–949 (p. 26, proof to p. 27) | pages match; proof attribution is R01 |

The rows for untouched statements stand as in the previous review, of 5999164.

- Source locators checked against the text: 6 (ribet94 (4.7), §8 remark, Theorem 8.1, §7 lines 1108 and 1150–1153; edixhoven92 Theorem 2.8, Proposition 8.2) plus the bibliographic check of [18] and [22].
- Seeded sample: of its targets only 2.9 falls in the changed passages; checked above.
- Gate at this head: every rule 0, `OK`. Dependency check: `depcheck: 245 roadmaps, 2244 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with four `declaration uses sorry` warnings (lines 74, 93, 108, 128) and nothing else; the diff changes no Lean.
- Nothing changed outside the folder (`git diff --stat origin/main...HEAD` outside it is empty).
- Consumers of the changed sections resolved at their open heads: ModularIwasawaMainConjectures line 175 (§2.9, `ℓ ≥ 5` branch as still stated), AutomorphicGaloisRepresentations lines 94, 637, 3764 and RankOneConverse line 507 (§2.10, statement unchanged).
- Description against the head: the thirteen suppliers of the depends-on list are the thirteen open roadmaps the README cites as suppliers, none yet on main; the summary's theorems, consumers and imports each have their section; the validation sentence holds at this head.
- Remark (untouched text): the §2.9 locator note still says "General normalized branch", wording left from the clause the repair removed.

Overlap check: read AlgebraicModularFormsAndSerreWeights, AutomorphicGaloisRepresentations, ClassicalSerreModularity (changed passages only); nothing shared: Mazur's principle and Ribet lowering are owned here, and CompletedCohomologyAndLocalGlobalCompatibility §4.2 states a different, in-families fibre theorem.

Source independence: changed passages only; 4 passages compared with 3 sources (ribet94, edixhoven92, the Mazur–Ribet author PDF), none shared; largest share ribet94, 27 of 72 linked locators; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- Ribet, Invent. Math. 100 (1990), §6: the text was not read (the fetch from the author's page did not complete); its identity as Edixhoven's [22] and its §6 and Lemmas 6.2–6.3 are attested by edixhoven92 lines 222–229, 1144–1145 and ribet94 lines 538, 1309, 1521–1522.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` line 1730 links Gross's Duke article as a scan of the published paper hosted on a third party's seminar page (`math.purdue.edu/~tongliu/seminar/Mlift/Gross.pdf`), neither the publisher's nor the author's; its status as a legal copy was not settled.
