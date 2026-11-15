# Review of GlobalGaloisDeformationsPartII (pull request #1837 at df03de2)

**Verdict:** needs changes

Incremental re-review of the 79 lines changed since d2150fc (the regrouping of Layers 7–9 in `TauCetiRoadmap/GlobalGaloisDeformationsPartII/README.md`; `Suggested.lean` unchanged), and the first check of the pull request's title and description against this head. The folder's change raises no finding; the description has one.

## R01 (P3) — The description says one headline is stated in Lean; the head states two

**Location:** pull request description, last sentence of the first prose paragraph: "The uniform finite-coefficient torsion theorem … (FKP19 Lemma B.1, degree one) is the one headline statable at the pins and is stated in `Suggested.lean`."

**Claim:** The head contradicts it: `Suggested.lean` states two headline theorems, the degree-one form and the all-degree form.

**Witness:** `TauCetiRoadmap/GlobalGaloisDeformationsPartII/Suggested.lean:128` `uniformTorsion_H1` and `:147` `uniformTorsion`; its docstring, line 17: "both uniform torsion theorems of README §4.4"; `README.md:272`: "states the degree-one and all-degree uniform torsion theorems of §4.4".

**Repair:** Replace the sentence in the description by: "The two uniform finite-coefficient torsion theorems for compact p-adic analytic groups with semisimple Lie algebra (FKP19 Lemma B.1: the degree-one form, and the all-degree form for lattices on which no open subgroup fixes a nonzero vector) are the headlines statable at the pins, and both are stated in `Suggested.lean`."

## Previous findings

- none: the review of d2150fc accepted the folder and numbered no finding. Its remark that the description still says "the one headline statable" is R01 above, now that the description is checked.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `README.md:1192` (new): §§7.1–7.5 are consumed by §§7.6, 8.5, 9.4, 9.5, and §8.11 uses §7.2 | every `*Needs:*` line citing §7.1–§7.5 from outside the group | :1269 (§7.6: §7.5, §7.1); :1375 (§8.5: §7.1, §7.3); :1539 (§9.4: §7.3, §7.1); :1551 (§9.5: §7.5, §7.1); :1466 (§8.11: §7.2); no other line | holds, list complete | none |
| `README.md:1306` (new): §§8.1–8.4 are consumed by §§8.5, 8.7, 8.10 | `*Needs:*` lines citing §8.1–§8.4 | :1375 (§8.1, §8.2, §8.3); :1399 (§8.2); :1453 (§8.1); no other line | holds | none |
| `README.md:1480`, `:1514` (new): §§9.3–9.5 consume §9.2 | `*Needs:*` at :1527, :1539, :1551 | each lists §9.2 | holds | none |
| `README.md:1255`, `:1364`, `:1480` (new): §§7.6–7.8, 8.5–8.7, 9.2 are under the §3.2 hypothesis; §8.8 part and §9.1 are not | first sentence of each statement | :1257, :1272, :1283, :1366, :1378, :1390, :1501, :1516, :1530, :1542 open with the §3.2 assumption; :1308, :1405, :1429, :1443, :1456, :1482 do not | holds | none |
| `README.md:1255`, `:1364`, `:1514` (new): "named under Downstream consumers" | `README.md:1629` | names "the Levi theorem", "extension-sensitive residual witnesses", "Function-field consumers" | holds | none |
| §8.1 (seeded sample; heading changed, statement not) | 𝔽₃: `I` against `I+E₁₂`; FKP22 lines 70–73, 1570–1579 | traces 2 and 2, `rank(g−I)` 0 and 1, fixed dimensions 2 and 1; the source defines modularity of weight r and level N by a lattice whose unsemisimplified reduction is ρ̄ after a residual embedding, p.35 | holds; locator correct | none |
| §8.11 route through §7.2 (cited by the new :1192) | W=k(χ̄), d=[k:𝔽_p]; p=5, S′={5,11} | `dim_𝔽p H¹ > d` gives `dim_k ≥ 2`; `ℤ[1/55]×/5th powers = ⟨5,11⟩`, dimension 2, against 1 for S={5} | holds | none |
| `uniformTorsion_H1`, `uniformTorsion` (touched by R01) | elaboration at the head; the description's count | two theorems at `Suggested.lean:128` and `:147`, both elaborate; description counts one | the Lean is sound; the description is wrong (R01) | description |

The rows for untouched statements stand as in the previous review, of `d2150fc`.

- Gate, rerun at df03de2: `gate GlobalGaloisDeformationsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0; the worker's run also has `build=0`. The outside-folder diff is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Dependency check, complete output: `depcheck: 237 roadmaps, 2250 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. The diff changes no `*Needs:*` line, supplier citation or gap.
- Elaboration: `lake env lean` on `TauCetiRoadmap/GlobalGaloisDeformationsPartII/Suggested.lean`, exit 0, the only messages `declaration uses sorry` at 128:8 and 147:8. The file is unchanged since d2150fc, so signatures and one-tactic probes stand.
- The diff: 7 sections (7.1, 7.6, 8.1, 8.5, 8.8, 9.1, 9.3 get new titles as group headings; 20 sections (7.2–7.5, 7.7–7.8, 8.2–8.4, 8.6–8.7, 8.9–8.11, 9.2, 9.4–9.5 become bold run-in titles); all keep their numbers and statements; 7 introductory paragraphs are added. All 27 section numbers of Layers 7–9 are still present, every internal `§7.x`, `§8.x`, `§9.x` reference (Scope, Conventions, supplier contracts, `*Needs:*`, Examples, References) still resolves, and the gate's `target-ids`, `layer-ids`, `dropped` and `empty-sections` are 0.
- Cross-roadmap: no roadmap on main or at an open head cites a section of Layers 7–9 of this roadmap (3 citing READMEs read: FunctionFieldArithmetic :3620, GlobalShtukasAndFunctionFieldLanglands :2239, PotentialAutomorphyInfrastructurePartII :2208; none by section number of this roadmap). The overlaps tool lists no pull request changing this roadmap, no dropped id, no id only an open revision defines.
- Source locators checked against the text: 1 (FKP22 §7 before Lemma 7.3, p.35, lines 1570–1579; §1, p.2, lines 64–73). The other fourteen seeded targets lie in untouched text. The README flags no locator as unverified.
- The pull request's text, other sentences: the title, the summary block and the remaining prose agree with the head (a new roadmap folder of three files; smooth affine G with split reductive identity component and prime-to-p component group, `README.md:27`; the §3.2 hypothesis and its exemption for §6.6 and §§10.1–10.3, `README.md:3`; the refuting example of FKP22 Lemma 3.7 as Checks of §2.9; the Lean imports no roadmap).
- Overlap check: the diff adds no object, target or supplier, so the scopes of the closest roadmaps (PotentialAutomorphyInfrastructurePartII, PotentialModularityAndCompatibleSystems, OrdinaryAutomorphicFormsAndModularityLiftingPartII, GL2ModularityLifting, PotentialAutomorphyInfrastructure, IntegralHeckeAndGaloisDeterminants, SmoothRepresentationsOfLocalGroups) were not read again; nothing shared is added.
- Source independence: changed passages only; 14 passages (7 introductory paragraphs, 7 new headings) compared with 1 source (FKP22 §§6–8 and its section titles, lines 1203, 1394, 1710), none shared; largest share FKP22, 95 of 181 source mentions; the diff adds, removes and reorders no layer, so the contents were not compared again.

## Not verifiable

- Gur99 Theorem A; NSW08 Theorems 8.6.7, 8.6.10 and 8.7.9; BC14 Lemma 10, Propositions 11 and 32, Definitions 29–30: settled as uncertified, cited by locator only, not read.
- The description's sentence on AI assistance (the number of review and red-team rounds) is a record of process that the head neither supports nor contradicts.

## Source issues

- none

## For the human reviewers

- none
