# Review of AutomorphicGaloisRepresentationsPartII (pull request #1006 at 902b706)

**Verdict:** accepted

Incremental re-review of the 8 lines changed since 8ea8284 (4 insertions, 4 deletions, all in `TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md`), and a check of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: line 276 reads “cited by arXiv PDF page; from PDF page 25 on the printed folio is one less (pages 2–23 carry their PDF number)”; line 2916 “pp.33–35”; lines 3077 and 3155 “Theorem 5.4.13 …, pp.98–99”.

## Verified sound

| Statement (README line) | Instance tried | Values computed | Result |
| --- | --- | --- | --- |
| AHTW page convention (276) | running heads at PDF pages 2, 3, 23, 24, 25, 26, 33, 34, 35, 98, 99, 104, 107 (AHTW lines 36, 74, 855, 889, 895, 931, 1206, 1248, 1284, 3875, 3911, 4124, 4245) | folios 2, 3, 23, none, 24, 25, 32, 33, 34, 97, 98, 103, 106 | PDF = folio on 2–23, page 24 unnumbered, PDF = folio + 1 from 25: as the note says |
| §§3.3.1–3.3.7, Theorem 3.3.6, pp.33–35 (2916) | page markers at AHTW lines 1205, 1247, 1283, 1316 | §3.3 opens at line 1237 (PDF p.33); Theorem 3.3.6 at 1301 and Proposition 3.3.7 at 1313 (p.35) | range right |
| Theorem 5.4.13(1)–(4), pp.98–99 (3077, 3155) | page markers at AHTW lines 3874, 3910, 3954 | statement opens at line 3902 (p.98); items (1)–(4) at 3926–3943 (p.99); 5.4.14 starts on p.99 | range right |
| Bounded boundary comparison: `ρ̃_f` weights of Theorem 5.4.13(2) and `ρ₁` weights `{λ_{τ,1}+n−1>…>λ_{τ,n}}` (3036–3042), cited by the changed locator | `n=1`, `λ_τ=λ_{τc}=0`; `n=2`, `λ_τ=λ_{τc}=(0,−1)` (dominant `λ̃`: `−λ_{τc,1}=0≥λ_{τ,1}=0`) | `n=1`: `ρ̃` `{1>0}`, `ρ₁` `{0}`. `n=2`: `ρ̃` `{4>2>1>−1}`, `ρ₁` `{1,−1}` = `H_τ(λ)={a_i+n−i}` of line 244 | strict order holds; `ρ₁` carries the lower half; agrees with the Hodge multiset convention |
| Nonselfdual de Rham comparison source line (3155) | Lemma 5.4.18 with proof, pp.104–107 | statement at AHTW line 4134 (p.104), proof ends line 4268 (p.107) | unchanged part of the changed line is right |
| Title and description against the head | each sentence of the summary block and prose | rank, fields, routes: README lines 3–5; self-contained AG2.6 prefix: 38–40; `GL₂` independence and adapters: 9–13; repeated weights: 236; parity for odd `w`: 250; `arithmeticPadicMonodromy` “no restriction on ramification, rank or `ℓ`”: 285–290; `ExtremelyRegularIrreducibility` scope: 5; exports: headings at 3606–3704, `GSp₄` targets at 3372–3392; folder holds README, `Suggested.lean`, `metadata.toml`; Lean: one real-bodied definition and two theorems | no sentence contradicted; the pull request adds the folder and removes nothing |

Rows for the untouched statements stand as in the previous review, of `8ea8284`.

- Gate, run on this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's run adds `build=0`.
- Dependency check with `--movable`: `depcheck: 245 roadmaps, 2266 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/Suggested.lean` gives two `sorry` warnings (lines 42, 89) and nothing else. The file is unchanged since `8ea8284`; the three elaborated types are those compared with the README last round, and the one-tactic probe of that round stands.
- Source locators checked against the text this round: 5 (AHTW §3.3 and Theorem 3.3.6; Lemma 5.4.12; Theorem 5.4.13; Lemma 5.4.18; the page convention), all at AHTW arXiv v1 page markers. Seeded sample: “P-ordinary arithmetic block comparison” falls in the changed line 3077 and its AHTW range is right; “Bounded boundary comparison and degree shifting” is untouched (Definition 5.2.4 at AHTW line 2897, p.74, to Remark 5.2.10 at line 3073, p.78, re-read: pp.74–78 right).
- Files changed outside the folder: none (`git diff --stat origin/main...HEAD` outside the folder is empty). No statement, supplier citation, heading or Lean declaration changed, so no cross-roadmap citation was affected.
- Overlap check: read ModularityAndLanglandsExtensions, IgusaVarietiesAndTorsionConcentration, PotentialAutomorphyInfrastructure, PotentialAutomorphyInfrastructurePartII, EndoscopicTransferAndUnitaryTraceComparison, SmoothRepresentationsOfLocalGroups; nothing shared (the first four cite this roadmap's AG2.0–AG2.7 as owner; the last two are its suppliers). The overlap tool lists no dropped id, no second copy and no other pull request changing this folder.
- Remark, untouched text: line 3076 gives “Lemma 5.4.12 and the following paragraph, p.97”; the lemma is on PDF p.97 (AHTW line 3856) and the paragraph after its proof (lines 3896–3901) is on p.98.
- Remark, untouched text: “LanglandsParameterStacks LP1.7–LP1.8 and LP4.1–LP4.3” (lines 229, 2603, 2673) resolve to that roadmap's §§1.7–1.8 and 4.1–4.3, whose headings carry no `LP` prefix.

Source independence: changed passages only; 4 passages (three page ranges and the page-convention sentence) compared with 1 source (AHTW), none shared; ACC+ is named in the most source parentheticals, 28 of 151; no layer was added, removed or reordered, so the contents were not compared again.

## Not verifiable

- Nothing in the changed passages. The texts other than AHTW were not opened this round; their locators are untouched by the diff.

## Source issues

- **Misprint** in AHTW at Theorem 5.4.13, first hypothesis, PDF page 98: the source says that for `v ∉ S` of residue characteristic `l`, `l` is unramified in `F` with `S_l(F) ∩ S` nonempty, or `l` splits in an imaginary quadratic subfield; it should be `S_l(F) ∩ S` empty, as in ACC+ Theorem 2.3.7; affects a stated result.

## For the human reviewers

- **Scope.** The nonselfdual comparison at `ℓ` (AG2.6) rests on AHTW, arXiv:2607.11763v1 of 13 July 2026, which the README itself calls an unrefereed preprint (`README.md` lines 276 and 4011); 16 source parentheticals cite it.
- **Scope.** This is “Part II” of AutomorphicGaloisRepresentations, which is not on main (it is an open pull request); the README says it does not cite the base roadmap (`README.md` lines 7–9).
