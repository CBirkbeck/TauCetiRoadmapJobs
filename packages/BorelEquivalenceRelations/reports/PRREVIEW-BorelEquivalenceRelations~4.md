# Review of BorelEquivalenceRelations (pull request #1616 at 6908d40)

**Verdict:** needs changes

Incremental re-review of the 57 lines changed since a614e6e (two README passages, the module docstring, the import line and nine declarations of `Suggested.lean`). The merge of `main` moves the pins to Mathlib 1b1ccf4b and Tau Ceti 2fd255d9, and the diff reacts to that pin by renaming seven `_root_` theorems into the roadmap namespace because Tau Ceti now declares them. That is the wrong reaction: a statement the pinned library proves is deleted and cited, never restated under another name. One new blocking finding (R01) and one new gate failure it caused (R02); the six P3 findings of the previous review are untouched by the diff and are written again (R03–R08).

## R01 (P2) — Eight statements restate Tau Ceti declarations at the pin

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/Suggested.lean:48,82,87,97,101,105,124,134`; module docstring lines 18–22 ("Tau Ceti already declares … so they are stated here in the roadmap namespace"); `README.md:180–184` ("What is missing from Mathlib and built here: … meagreness of countable sets; standard Borel Gδ subspaces; analytic sets under binary intersection, products, off-diagonals and saturation; the perfect set theorem beyond closed sets"), `README.md:214–215` ("Build `IsGδ.standardBorelSpace`").

**Claim:** At the pinned Tau Ceti (2fd255d9) each of these eight statements is a theorem with the same hypotheses and conclusion, binder for binder, so `Suggested.lean` admits with `sorry` (seven cases) or re-proves by one term (one case) what the library already supplies, and the README says the library lacks what it has.

**Witness** (file and line at the pin, each probed in a scratch file that closed the roadmap's statement by a single `exact` of the Tau Ceti theorem):

| Roadmap declaration (line) | Tau Ceti declaration at the pin |
| --- | --- |
| `Set.Countable.isMeagre` (48) | `Set.Countable.isMeagre`, `TauCeti/Topology/Baire/Perfect.lean:52`, `[T1Space X] [PerfectSpace X]` |
| `TopologicalSpace.IsCompletelyMetrizableSpace.isGδ` (82) | `TauCeti.isGδ_of_isCompletelyMetrizableSpace`, `TauCeti/Topology/MetricSpace/Polish/GDelta.lean:55`; the file's own proof is this one name |
| `IsGδ.standardBorelSpace` (87) | `IsGδ.standardBorelSpace`, `TauCeti/MeasureTheory/Constructions/Polish/GDelta.lean:21` |
| `AnalyticSet.inter` (97) | `MeasureTheory.AnalyticSet.inter`, `TauCeti/MeasureTheory/Constructions/Polish/Analytic.lean:75`, `[T2Space α]` |
| `AnalyticSet.prod` (101) | `MeasureTheory.AnalyticSet.prod`, same file line 96 |
| `AnalyticSet.offDiag` (105) | `MeasureTheory.AnalyticSet.offDiag`, same file line 119, `[T2Space α]` |
| `MeasurableSet.exists_nat_bool_injection_of_not_countable` (124) | same name, `TauCeti/MeasureTheory/Constructions/Polish/Perfect.lean:51` |
| `Perfect.mk_eq_continuum` (134) | same name, `TauCeti/Topology/MetricSpace/Perfect.lean:58`, `[PolishSpace X]` |

The README sentence at 180–184 is now false on every listed item: Tau Ceti also has `polishSpace_pi_of_discreteTopology` (`TauCeti/Topology/MetricSpace/Polish/Pi.lean:41`, giving `PolishSpace (ℕ → Bool)` by instance search), `TauCeti.perfectSpace_pi` (`TauCeti/Topology/Perfect.lean:67`), the saturation lemma `AnalyticSet.preimage_image_quotientMk` (`Analytic.lean:183`), `curry_le_residual` (`TauCeti/Topology/Baire/KuratowskiUlam.lean`) and `mycielski` (`TauCeti/Topology/Baire/Mycielski.lean`).

**Repair:** Delete the eight declarations from `Suggested.lean` (and the `TauCeti.Topology.MetricSpace.Polish.GDelta` import if nothing else uses it). In the README, move the eight facts into a `From Tau Ceti` supplier contract that names the Tau Ceti declarations above with their files, change 0.1–0.4 to cite them ("Tau Ceti's `Set.Countable.isMeagre`…", "Tau Ceti's `IsGδ.standardBorelSpace`…"), and rewrite 180–184 so that it lists only what neither Mathlib nor Tau Ceti has at the pin. The Coordination bullet at 709–711 then says that CountableStructureSpaces consumes `IsGδ.standardBorelSpace` and `AnalyticSet.prod` from Tau Ceti, not from Layer 0.

## R02 (P3) — The renaming made seven Mathlib names count as the roadmap's own

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/README.md:155–156` (the Mathlib supplier table) against `Suggested.lean:97–134`.

**Claim:** The gate's `readme-ids-missing` count rose from 1 at a614e6e to 8: declaring `AnalyticSet.inter`, `MeasurableSet.exists_nat_bool_injection_of_not_countable` and `Perfect.mk_eq_continuum` inside the roadmap namespace makes `AnalyticSet`, `MeasurableSet` and `Perfect` namespaces of this roadmap, so the Mathlib names `AnalyticSet.image_of_continuous`, `AnalyticSet.inter_measurableSet`, `AnalyticSet.measurableSet_of_compl`, `MeasurableSet.image_of_continuousOn_injOn`, `MeasurableSet.image_of_measurable_injOn`, `MeasurableSet.residualEq_isOpen` and `Perfect.exists_nat_bool_injection` in the supplier table are read as claims that `Suggested.lean` declares them.

**Witness:** Gate rerun at 6908d40: `readme-ids-missing=8`, the seven names above plus `isThinOn_image_iff`; at a614e6e the same table produced one hit.

**Repair:** R01's deletion of the namespaced declarations removes the three prefixes and clears the seven hits; no change to the supplier table is needed. If any of the eight were kept, it would have to carry its Tau Ceti name as a citation, not a declaration.

## R03 (P3) — Remove the forbidden option

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/Suggested.lean:25`, `set_option autoImplicit false`.

**Claim:** `Suggested.lean` may contain no `set_option`; the gate reports `set_option=1`.

**Witness:** Gate rerun at 6908d40: `set_option: line 25: set_option autoImplicit false`. The file elaborates without the line (every binder is explicit).

**Repair:** Delete line 25.

## R04 (P3) — Remove process wording and pull-request references

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/README.md:732,794` ("at checkpoint", "checkpoint `518a366`"); pull-request numbers at README 46, 164–178, 188, 219, 533, 698–709 and `Suggested.lean:74,77,116`; the new "has landed" at README 168 and "the prototype derives the roadmap's form from it" at 221.

**Claim:** The README is not timeless: the two `checkpoint` residues fail the gate; suppliers and design references are identified by pull-request numbers in prose and in docstrings; the diff adds a merge-state narrative ("has landed") and a reference to a prototype.

**Witness:** Gate rerun: `residue: line 732: at checkpoint`, `residue: line 794: set theory above, checkpoint 518a366`.

**Repair:** Write "revision `518a366`" for the formalization; name theorems and library declarations instead of proposal numbers (for 0.2: "Alexandrov's converse, Tau Ceti's `TauCeti.isGδ_of_isCompletelyMetrizableSpace`; the forward direction is Mathlib's `IsGδ.polishSpace`"); keep legal source links with descriptive labels; cite CountableModelCounting and CountableStructureSpaces by section only.

## R05 (P3) — Do not advertise an undeclared API name as an acceptance declaration

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/README.md:284`, `isThinOn_image_iff`.

**Claim:** A backticked name of this roadmap's own claims a declaration in `Suggested.lean`; it is not declared there.

**Witness:** Gate rerun: `readme-ids-missing: isThinOn_image_iff`; `grep isThinOn_image_iff Suggested.lean` is empty. (The previous review's second instance, `IsGδ.isCompletelyMetrizableSpace` at README 169, is no longer a defect: it is Mathlib's at the pin, `Mathlib/Topology/MetricSpace/Polish.lean:302`.)

**Repair:** State the fact in prose without the name (thinness transports along the measurable embedding). Do not add a declaration.

## R06 (P3) — Supply exact locators

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/README.md:193–603,761–790`.

**Claim:** Most targets carry no theorem or page locator; the Alexandrov converse cites only a Mathlib proposal, not a text.

**Witness:** Sections 5.1–5.4 and 2.3 give no theorem/page locator (unchanged since 6c542e9). README 216–224 cites "Mathlib #42912" and a Tau Ceti name; the Tau Ceti module itself cites Kechris, Classical Descriptive Set Theory, Theorem 3.11 (`TauCeti/Topology/MetricSpace/Polish/GDelta.lean:42`), which the README does not.

**Repair:** As in the previous review: a locator beside every target (Miller manuscript Proposition 6 p. 5, Theorem 8 pp. 5–6, Lecture I Theorem 11 and Lemma 12 p. 7); for Alexandrov cite Kechris Theorem 3.11 or Engelking, General Topology, Theorem 4.3.24, noting the T6 generalization.

## R07 (P3) — Restore per-definition Checks, precise dependency lists and declaration documentation

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/README.md:49–64,191–614`; `Suggested.lean:4–23,60,66,87,97–107`.

**Claim:** The folder lacks the roadmap shape: no `**Checks.**` blocks, no `*Needs:*` lines, no layer-ending `### Examples`/`### Dependencies`, no `## Scope and ownership` or `## Exact supplier contracts` headings, undocumented declarations, and a module docstring about "suggested signatures" rather than headline acceptance tests.

**Witness:** `grep -c '**Checks.**' README.md` = 0; `grep -c '*Needs:*'` = 0; no `### Examples`, `### Dependencies`, `## Scope and ownership` or `## Exact supplier contracts` heading exists. Unchanged since 6c542e9.

**Repair:** As in the previous review: Summary, Scope and ownership, Conventions, Exact supplier contracts (now including `From Tau Ceti`, see R01), How to read the build, layers with prose targets, three discriminating Checks per definition, `*Needs:*` per target, docstrings on every declaration.

## R08 (P3) — Delete routine API padding from the acceptance file

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/Suggested.lean:478,481,540`, and the API-only declarations listed in the previous reviews (cylinder bridge, antichain injectivity/monotonicity/subtype API, adjacency unpacking, unique-word-length API, coloring-interface conversion, `wordCylinder`, `IsThinOn`).

**Claim:** These admitted declarations are library specializations or unpackings, not headline theorems.

**Witness:** `BorelReducible.refl` (478) closes with the identity, `BorelReducible.trans` (481) with composition, `not_isSmooth_of_borelReducible_eZero` (540) with a composed reduction, as the previous reviews showed; all three are present at 6908d40. (`IsGδ.standardBorelSpace`, the fourth instance, is now covered by R01.)

**Repair:** Delete them from `Suggested.lean`; the README keeps the statements.

## Previous findings

- R01 — not repaired: `set_option autoImplicit false` is at `Suggested.lean:25`; now R03 here.
- R02 — not repaired: "at checkpoint" (README 732), "checkpoint `518a366`" (794), proposal numbers in prose and docstrings, plus the new "has landed" (168); now R04 here.
- R03 — partly repaired: `IsGδ.isCompletelyMetrizableSpace` (README 169) is now Mathlib's at the pin and no longer a defect; `isThinOn_image_iff` (284) remains; now R05 here.
- R04 — not repaired: locators unchanged; now R06 here.
- R05 — not repaired: shape unchanged; now R07 here.
- R06 — not repaired: `BorelReducible.refl` (478), `.trans` (481), line 540 still present; `IsGδ.standardBorelSpace` (87) still present and now also a Tau Ceti duplicate; now R08 and R01 here.

## Verified sound

**Scope of this pass.** The diff's two README passages (164–184 and 212–224), the Coordination link at 704, the module docstring and import line, the deleted `IsGδ.polishSpace`, the re-proved Alexandrov converse and the seven renamed declarations; and what cites them: the Layer 0.1–0.4 bullets, the "built here" sentence, the Coordination bullets at 704–712, the gate's identifier check. The outside-folder diff `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/BorelEquivalenceRelations'` is empty (merge base 35884a8c, the pull request's merge of `main`). The pins of `lake-manifest.json` equal main's: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9, toolchain v4.36.0-rc2.

**Gate.** Rerun at 6908d40: `set_option=1 residue=2 readme-ids-missing=8`, every other counter 0 including `depcheck`, `stray-files`, `outside-folder`, `imports`; `FAIL`. Identical to the worker's run (which also reports `build=0`).

**Elaboration.** `lake env lean TauCetiRoadmap/BorelEquivalenceRelations/Suggested.lean` exited 0 with exactly 59 `declaration uses sorry` warnings and nothing else (61 at a614e6e: `IsGδ.polishSpace` deleted, the Alexandrov converse now proved). The imported module `TauCeti.Topology.MetricSpace.Polish.GDelta` exists at the pin with its object file.

**Signatures.** The worker's elaborated types of the eight touched declarations were compared with the README statements and with the Tau Ceti declarations: all agree binder for binder (the roadmap takes the complete metrizability of `s` as an explicit hypothesis where Tau Ceti takes an instance; Lean finds the local hypothesis as an instance, which is why the one-name proof elaborates). The two automated binder-loss leads (`RelIndependent`, `IsSmallFamily`) are untouched and were settled as non-defects in the previous reviews.

**Probe** (scratch file importing the five Tau Ceti modules, four of which had to be built first with `lake build`): each of the eight statements closes by `exact` of the Tau Ceti declaration named in R01's table; `#check` printed each Tau Ceti type. In the same file: `[T6Space X] → T2Space X` and `[T6Space X] → PerfectlyNormalSpace X` by `inferInstance`, and `[T2Space X] [PerfectlyNormalSpace X] → T6Space X` by the anonymous constructor, so the README's "perfectly normal Hausdorff spaces, which are exactly the `T6` spaces" (221–222) holds in both directions at the pin (`T6Space` extends `T0Space` and `PerfectlyNormalSpace`; T6 → T5 → T4 → T2 through Mathlib's instances).

**Pinned carriers.** Mathlib 1b1ccf4b: `IsGδ.isCompletelyMetrizableSpace` at `Mathlib/Topology/MetricSpace/Polish.lean:302` and `IsGδ.polishSpace` at 309, so the README's "are Mathlib's" (169) and the Lean section comment (74–75) are correct; the deletion of the local `IsGδ.polishSpace` is correct. No `IsCompletelyMetrizableSpace.isGδ` exists in Mathlib or Tau Ceti at the pin, so the `_root_` name clashes with nothing. Tau Ceti: `isGδ_of_isCompletelyMetrizableSpace` at `TauCeti/Topology/MetricSpace/Polish/GDelta.lean:55` with `[PerfectlyNormalSpace X] [T2Space X]` and an instance argument `[IsCompletelyMetrizableSpace s]`, cited at README 171–172 and 220 correctly.

**Links.** `../../Completed/InfinitaryLogic/README.md` from the roadmap folder resolves to `Completed/InfinitaryLogic/README.md`, which exists on this head; `TauCetiRoadmap/InfinitaryLogic` does not, so the retargeting is right. `../CountableModelCounting/README.md` exists on this head; `../CountableStructureSpaces/README.md` does not (it is still the open pull request #1316; unchanged text, remark only).

**Depcheck**, from the gate: `depcheck=0`; no UPWARD or CYCLE line. The diff adds no roadmap supplier; Tau Ceti is a pinned library.

**Ownership.** `roadmaps grep --lean-only` for the eight names over the 469 open heads and main finds them only in this pull request and in this roadmap's folder on main (`_root_` forms at main's `Suggested.lean:43,80,98,117,127`); neither CountableStructureSpaces (#1316) nor CountableModelCounting (#1318) declares them. The owner at the pin is Tau Ceti (R01). Ownership against open pull requests whose files the brief does not give was not checked.

**Remarks on untouched text (not findings).** A name-based comparison of all 79 declarations of `Suggested.lean` with Tau Ceti at the pin finds a same-named declaration for at least 57 of them, among them `silver_dichotomy` (`TauCeti/SetTheory/Descriptive/Silver.lean:130`), `silver_dichotomy_standardBorel` (142), `SimpleGraph.g0_dichotomy` (`GZeroDichotomy.lean:431`), `mycielski`, `curry_le_residual`, `not_isSmooth_eZero`, `borelReducible_bot_eZero` and the whole antichain, G_S-graph and small-family vocabulary; the roadmap's headline theorems appear to be proved in the pinned library, and the next full review should compare every statement with its Tau Ceti counterpart by object, as R01 does for the eight the diff touches. The "Suggested homes" block (README 78–90) names `TauCeti/Topology/MetricSpace/PolishGDelta.lean` where the pinned module is `TauCeti/Topology/MetricSpace/Polish/GDelta.lean`. The citation lead `BaireMeasurableSet.eventually_eventually_left_iff_mem_residual` (README 167) is a name this roadmap declares at `Suggested.lean` under `_root_`, not a library name; it is not in Tau Ceti at the pin under that name (Tau Ceti's Kuratowski–Ulam module uses other names), so the lead is not a defect of the changed text.

**Seeded sample, changed targets only.** "0.2 Gδ subspaces": the forward direction is now cited from Mathlib correctly; the converse is correct as stated and is Tau Ceti's (R01). The other fourteen sampled targets are untouched; the previous reviews' table stands for them.

### Adversarial table

Rows for untouched statements carry forward from the previous reports (their tables of 80 declarations and 49 prose rows); the rows below are the changed statements and passages, recomputed.

| Statement (location) | Instances tried | Values on each side | Result / change |
| --- | --- | --- | --- |
| `Set.Countable.isMeagre` (Lean 48) | `X = ℝ, s = ℚ`; `X = ℕ` discrete, `s = {0}`; `X = ℕ` indiscrete, `s = {0}` | ℚ: countable T, meagre T; discrete: perfect F, `{0}` open so meagre F; indiscrete: perfect T, T1 F, only nowhere dense set is ∅ so `{0}` meagre F | Both hypotheses necessary; statement = Tau Ceti `Baire/Perfect.lean:52`; R01 |
| `IsCompletelyMetrizableSpace.isGδ` (Lean 82) | `s = ℚ ⊆ ℝ`; uncountable discrete `X`; `{ω₁} ⊆ ω₁+1` | ℚ: complete F, Gδ F; discrete: T6 T, complete T, Gδ T, Polish F; ω₁+1: T6 F, Gδ F | Carried from r2; proof body is Tau Ceti `GDelta.lean:55` by one name; R01 |
| README 221–222 "perfectly normal Hausdorff = T6" | `[T6Space X]`; `[T2Space X] [PerfectlyNormalSpace X]` | T6 ⊢ T2 and PerfectlyNormal by `inferInstance`; T2 + PerfectlyNormal ⊢ T6 by `{}` | Both directions hold at the pin |
| `IsGδ.standardBorelSpace` (Lean 87) | `s = ℝ ∖ ℚ`; `s = ℚ` | irrationals: Gδ T, standard Borel T; ℚ: Gδ F (hypothesis fails) | Closes by `hs.measurableSet.standardBorel` and by Tau Ceti `MT/Polish/GDelta.lean:21`; R01, R08 |
| `AnalyticSet.inter` (Lean 97) | `A = [0,1], B = [1,2]` in ℝ; `A = ∅` | `{1}` analytic T; ∅ analytic T | = Tau Ceti `Analytic.lean:75` with the same `T2Space`; R01 |
| `AnalyticSet.prod` (Lean 101) | `A = ∅`; `A = B = ℝ` | ∅ analytic T; ℝ² analytic T | = Tau Ceti `Analytic.lean:96`, no separation axiom on either side; R01 |
| `AnalyticSet.offDiag` (Lean 105) | `A = {0}`; `A = ℝ` | offDiag ∅, analytic T; ℝ² ∖ Δ open, analytic T | = Tau Ceti `Analytic.lean:119`; R01 |
| `MeasurableSet.exists_nat_bool_injection_of_not_countable` (Lean 124) | `s = ℚ`; `s = ℝ ∖ ℚ`; a Vitali set | ℚ: uncountable F; irrationals: Borel T, Cantor copy exists T; Vitali: measurable F (excluded) | = Tau Ceti `MT/Polish/Perfect.lean:51`; R01 |
| `Perfect.mk_eq_continuum` (Lean 134) | `C = ∅`; `C` = Cantor set in ℝ | ∅: perfect T, nonempty F, `#∅ = 0 ≠ 𝔠` so `hne` necessary; Cantor: `#C = 𝔠` T | = Tau Ceti `Topology/MetricSpace/Perfect.lean:58`; R01 |
| README 168–169 "`IsGδ.polishSpace` and `IsGδ.isCompletelyMetrizableSpace` are Mathlib's" | Mathlib 1b1ccf4b | `Polish.lean:302` and `:309` exist | Correct |
| README 180–184 "missing from Mathlib and built here" | each listed item against Tau Ceti 2fd255d9 | `PolishSpace (ℕ → Bool)`: `Polish/Pi.lean:41`; `perfectSpace_pi`: `Topology/Perfect.lean:67`; countable meagre: `Baire/Perfect.lean:52`; Gδ standard Borel: `MT/Polish/GDelta.lean:21`; analytic closure: `Analytic.lean:75,96,119,183`; Borel perfect set: `MT/Polish/Perfect.lean:51`; Kuratowski–Ulam: `Baire/KuratowskiUlam.lean`; Mycielski: `Baire/Mycielski.lean` | Every item exists at the pin; R01 |
| README 704 InfinitaryLogic link | path from the roadmap folder | `Completed/InfinitaryLogic/README.md` exists; `TauCetiRoadmap/InfinitaryLogic` does not | Correct retargeting |
| Gate `readme-ids-missing` | a614e6e versus 6908d40 | 1 versus 8; the seven new hits all carry the prefixes `AnalyticSet`, `MeasurableSet`, `Perfect` | R02 |
| All other 70 declarations and 49 prose rows | unchanged | see previous reports | Carried |

## Not verifiable

- The previous reviews' unverifiable items stand unchanged: `kechris1995`, `gao2009`, `kst1999`, `silver1980` are paywalled records; the Miller manuscript/published numbering correspondence; the external formalization's global axiom claim. The Alexandrov locator was checked against the Tau Ceti proof and the previous review's independent proof, not against Kechris's page.

## Source issues

- none
