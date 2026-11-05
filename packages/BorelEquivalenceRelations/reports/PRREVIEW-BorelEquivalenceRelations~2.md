# Review of BorelEquivalenceRelations (pull request #1616 at a614e6e)

**Verdict:** needs changes

Incremental re-review of the 24 lines changed since 6c542e9 (two README passages, one Lean declaration). Both P2 findings of the previous review are repaired and the repairs introduce no new defect. The six P3 findings of the previous review are untouched by the diff and the gate still fails on three of them (`set_option`, residue, `readme-ids-missing`), so they are written again below; none is blocking.

## R01 (P3) — Remove the forbidden option

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/Suggested.lean:20`, `set_option autoImplicit false`.

**Claim:** `Suggested.lean` may contain no `set_option`; the gate reports `set_option=1`.

**Witness:** Gate rerun at a614e6e: `set_option: line 20: set_option autoImplicit false`. The previous review elaborated the file without the line with only `sorry` warnings.

**Repair:** Delete line 20. No signature changes.

## R02 (P3) — Remove process wording and pull-request references

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/README.md:728,790` ("at checkpoint", "checkpoint `518a366`"); pull-request numbers at README lines 46, 164–175, 186, 217, 232, 300, 529, 694–705, 748 and `Suggested.lean:69,74,111,218`.

**Claim:** The README is not timeless: two `checkpoint` residues fail the gate, and suppliers and design references are identified by pull-request numbers in prose and in docstrings. The repaired Alexandrov passage (README 217, Lean docstring 74) adds one more such reference.

**Witness:** Gate rerun: `residue: line 728: at checkpoint`, `residue: line 790: set theory above, checkpoint 518a366`.

**Repair:** Write "revision `518a366`" for the formalization and name the theorem instead of the proposal number ("Alexandrov's theorem, as `TopologicalSpace.IsCompletelyMetrizableSpace.isGδ`"); keep legal source links with descriptive labels. Cite CountableModelCounting and CountableStructureSpaces by section only.

## R03 (P3) — Do not advertise undeclared API names as acceptance declarations

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/README.md:280`, `isThinOn_image_iff`; also line 169, `IsGδ.isCompletelyMetrizableSpace`.

**Claim:** A backticked name of this roadmap's own claims a declaration in `Suggested.lean`; neither name is declared there.

**Witness:** Gate rerun: `readme-ids-missing: isThinOn_image_iff`. `grep isCompletelyMetrizableSpace Suggested.lean` finds nothing; at the pin the name exists only as `IsClosed.isCompletelyMetrizableSpace` (`Mathlib/Topology/Metrizable/CompletelyMetrizable.lean:298`).

**Repair:** State both facts in prose without the names (thinness transports along the measurable embedding; a Gδ subset of a completely metrizable space is completely metrizable). Do not add declarations.

## R04 (P3) — Supply exact locators and distinguish the source versions

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/README.md:193–603,761–790`; the repaired passage at 215–219 included.

**Claim:** Most targets carry no theorem or page locator; the Alexandrov converse cites only a Mathlib proposal, not a text.

**Witness:** Sections 5.1–5.4 and 2.3 give no theorem/page locator (unchanged since 6c542e9). README 215–219 cites "Mathlib #42912" only; that proposal's own proof follows Tserunyan's notes, which the References do not list.

**Repair:** As in the previous review: put a locator beside every target (Miller manuscript Proposition 6 p. 5, Theorem 8 pp. 5–6, Lecture I Theorem 11 and Lemma 12 p. 7; `infinitarylogic` `Descriptive/G0Dichotomy.lean` 310–352). For Alexandrov cite Kechris, Classical Descriptive Set Theory, Theorem 3.11, or Engelking, General Topology, Theorem 4.3.24, noting that the ambient T6 form is a generalization proved as Gδ in the closure plus closed sets Gδ.

## R05 (P3) — Restore per-definition Checks, precise dependency lists and declaration documentation

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/README.md:49–64,191–614`; `Suggested.lean:3–17,58,82,92`.

**Claim:** The folder lacks the roadmap shape: no `**Checks.**` blocks, no `*Needs:*` lines, no layer-ending `### Examples`/`### Dependencies`, undocumented declarations, and a module docstring about "suggested signatures" rather than headline acceptance tests.

**Witness:** `grep -c '**Checks.**' README.md` = 0; `grep -c '*Needs:*'` = 0; no `### Examples` or `### Dependencies` heading exists. Unchanged since 6c542e9.

**Repair:** As in the previous review: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, layers with prose targets, three discriminating Checks per definition (the density/sparseness and small-family controls given there), `*Needs:*` per target, docstrings on every declaration.

## R06 (P3) — Delete routine API padding from the acceptance file

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/Suggested.lean:82,473,476,535`, and the API-only declarations listed in the previous review (cylinder bridge, antichain injectivity/monotonicity/subtype API, adjacency unpacking, unique-word-length API, coloring-interface conversion, `wordCylinder`, `IsThinOn`).

**Claim:** These admitted declarations are library specializations or unpackings, not headline theorems.

**Witness:** The previous review closed `IsGδ.standardBorelSpace` with `exact hs.measurableSet.standardBorel`, reflexivity with the identity, transitivity with composition and line 535 with a composed reduction; all four are still present at a614e6e.

**Repair:** Delete them from `Suggested.lean`; the README keeps the statements, citing Mathlib `MeasurableSet.standardBorel` for the Gδ specialization.

## Previous findings

- R01 — repaired: README 623–627 now says the kernel of a continuous map between Polish spaces "has 𝔠 classes exactly when the image is uncountable", with the constant map `ℝ → ℝ` (universal relation, one class) as negative control.
- R02 — repaired: `Suggested.lean:77–80` states `TopologicalSpace.IsCompletelyMetrizableSpace.isGδ` for `[T6Space X]` and an explicit `IsCompletelyMetrizableSpace s`; README 215–219 states the same generality and names the uncountable discrete space as the non-Polish instance.
- R03 — not repaired: `set_option autoImplicit false` at `Suggested.lean:20`; now R01 here.
- R04 — not repaired: "at checkpoint" (728), "checkpoint `518a366`" (790), proposal numbers in prose and docstrings; now R02 here.
- R05 — not repaired: `isThinOn_image_iff` at README 280; now R03 here.
- R06 — not repaired: locators unchanged; now R04 here.
- R07 — not repaired: shape unchanged; now R05 here.
- R08 — not repaired: `IsGδ.standardBorelSpace` (82), `BorelReducible.refl` (473), `.trans` (476), line 535 still present; now R06 here.

## Verified sound

**Scope of this pass.** Only the two README passages and the one Lean declaration the diff changes, and what cites them: the Layer 0.2 bullet, the Mathlib-proposal bullet at README 168–170, the Conventions paragraph on `upgradeIsCompletelyMetrizable` (104), worked example 3, `isSmooth_of_isClosed` (Lean 497) and the analytic perfect set theorem (Lean 455). The outside-folder diff `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/BorelEquivalenceRelations'` is empty.

**Gate.** Rerun at a614e6e: `set_option=1 residue=2 readme-ids-missing=1`, every other counter 0 including `build`, `depcheck`, `stray-files`, `outside-folder`; `FAIL`. Identical to the worker's run.

**Elaboration.** `lake env lean TauCetiRoadmap/BorelEquivalenceRelations/Suggested.lean` exited 0 with exactly 61 `declaration uses sorry` warnings and nothing else. The worker's signature file gives the new declaration's elaborated type as `∀ {X} [TopologicalSpace X] [T6Space X] {s : Set X}, IsCompletelyMetrizableSpace ↑s → IsGδ s`, which is the README statement at 215–217; no binder lost. The two automated binder-loss leads (`RelIndependent`, `IsSmallFamily`) are untouched by the diff and were settled as non-defects in the previous review.

**One-tactic probe** of the changed theorem, in a scratch file: `infer_instance` fails ("type class instance expected"), `simp` makes no progress, `rfl` fails. Not padding. In the same file the degenerate instances elaborated: `[MetrizableSpace X] → T6Space X`, `IsCompletelyMetrizableSpace (univ : Set (ℕ → ℝ))`, `[DiscreteTopology X] → IsCompletelyMetrizableSpace X`.

**Pinned carriers** (Mathlib 6b7abb3c): `class IsCompletelyMetrizableSpace` at `Mathlib/Topology/Metrizable/CompletelyMetrizable.lean:158`; `discrete` instance at line 264 (the README's uncountable discrete example); `class T6Space` extends `T0Space, PerfectlyNormalSpace` at `Mathlib/Topology/Separation/GDelta.lean:131`, with `closed_gdelta` at line 67, `T6Space.toT5Space` at 135, subspace instance at 142; `T5Space` extends `T1Space` (`Separation/Regular.lean:695`) and `T5Space.toT4Space` (707), so a T6 space is Hausdorff and its closed sets are Gδ; `[MetrizableSpace X] : T6Space X` at `Mathlib/Topology/GDelta/MetrizableSpace.lean:44`, which justifies "in particular of a metrizable space". No Alexandrov converse exists at the pin: the only `isCompletelyMetrizableSpace` theorems are `IsClosed.isCompletelyMetrizableSpace` (298) and the closed-embedding form (253), and `grep -rn 'IsGδ' Topology/Metrizable/CompletelyMetrizable.lean` is empty. The `_root_` name therefore clashes with nothing at the pin (build 0).

**Mathlib proposal.** The open proposal the README follows states, in a new file `Mathlib/Topology/GDelta/CompletelyMetrizable.lean`, `theorem isGδ {s : Set X} (hs : IsCompletelyMetrizableSpace s) : IsGδ s` under `variable {X} [TopologicalSpace X] [T6Space X]`, docstring "Alexandrov's theorem". The roadmap's statement is the same, binder for binder. The proposal is open, so it is a design reference, not a supplier; the roadmap states the theorem itself.

**The mathematics of the T6 form.** Let `s ⊆ X` with `X` T6 and `d` a complete metric on `s` inducing the subspace topology, `Y = closure s`. For each `n` let `Uₙ` be the points of `Y` having an open neighbourhood `W` in `Y` with `d`-diameter of `W ∩ s` below `1/n`; `Uₙ` is open in `Y` and contains `s`. For `y ∈ ⋂ Uₙ`, density gives `xₙ ∈ Wₙ ∩ s`, Cauchy in `d`, with `d`-limit `x ∈ s`. If `x ≠ y`, Hausdorffness of `Y` gives disjoint open `V ∋ x`, `V' ∋ y`; shrinking `Wₙ` into `V'` leaves the same limit `x` (the shrunk choices are within `1/n` of the old ones) while `V ∩ s` is a neighbourhood of `x` in `s`, so eventually `xₙ ∈ V ∩ V' = ∅`. Hence `s = ⋂ Uₙ` is Gδ in `Y`, and `Y` is Gδ in `X` by `closed_gdelta`, so `s` is Gδ in `X`. T6 is not removable: in `ω₁ + 1` the singleton `{ω₁}` is completely metrizable, closed, and not Gδ (every countable intersection of neighbourhoods contains a tail), and `ω₁ + 1` is Hausdorff but not perfectly normal.

**Depcheck**, verbatim:

```text
depcheck: 232 roadmaps, 2108 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The diff adds no supplier citation; the Mathlib proposal is cited as a design reference only.

**Ownership.** The Alexandrov converse and the kernel example were searched by object (`IsCompletelyMetrizableSpace`, `IsGδ`, "Alexandrov", "kernel of a continuous map") in the previous review across main, the board packages and the open heads with no other owner; the diff introduces no new object, so that result stands. Ownership against open pull requests whose files the brief does not give was not checked.

**Seeded sample, changed targets only.** "0.2 Gδ subspaces": the statement now agrees with the Mathlib proposal's signature and with Engelking 4.3.24 / Kechris 3.11 in the metrizable case; the T6 generalization is proved above. "5.2 Smoothness" and worked example 3: `isSmooth_of_isClosed` (Lean 497) needs `[PolishSpace X] [BorelSpace X]` and a closed graph; the kernel of a continuous `f : X → Y` is `(f × f)⁻¹(Δ_Y)`, closed because `Y` is Hausdorff; `f` itself is a Borel reduction to equality on `Y`. The quotient is in bijection with `f '' univ`, an analytic set; the analytic perfect set theorem (Lean 455, `[T2Space X]`) gives cardinality 𝔠 when it is uncountable and `≤ 𝔠` always. The other thirteen sampled targets are untouched; the previous review's table stands for them.

### Adversarial table

Rows for untouched statements carry forward from the previous report (its tables of 80 declarations and 49 prose rows); the rows below are the changed statements, recomputed.

| Statement (location) | Instances tried | Values on each side | Result / change |
| --- | --- | --- | --- |
| `IsCompletelyMetrizableSpace.isGδ` (Lean 77) | `s = ℚ ⊆ ℝ`; `s = univ` in an uncountable discrete `X`; `s = {ω₁} ⊆ ω₁+1` | ℚ: complete=F (hypothesis fails), Gδ=F; discrete: T6=T, complete=T, Gδ=T, Polish=F; ω₁+1: T6=F (closed point not Gδ), complete=T, Gδ=F | Keep T6; hypothesis is necessary, separability correctly dropped |
| README 0.2 "in particular of a metrizable space" (215) | `X = ℝ`; `X = ℕ → ℝ` | `MetrizableSpace → T6Space` instance found at the pin (priority 500) for both | Correct specialization |
| README 0.2 "an uncountable discrete space … not Polish" (218) | `X = Set ℕ` discrete | completely metrizable=T (`discrete` instance), second countable=F (𝔠 isolated points), Gδ(univ)=T | Correct non-example |
| Worked example 3: `\|x\| = \|y\|` on ℝ (623) | `f(x) = \|x\|` | image `[0,∞)`, uncountable=T; classes=𝔠; graph closed=T; smooth=T | Correct |
| Worked example 3: constant map (626) | `f ≡ 0 : ℝ → ℝ` | image `{0}`, uncountable=F; classes=1 ≠ 𝔠; graph `ℝ × ℝ` closed=T; smooth=T | Negative control holds |
| Worked example 3: "𝔠 classes exactly when the image is uncountable" (624–625) | `X = ∅`; `f = id` on `ℕ → Bool`; `f : ℕ → Bool → Bool`, `x ↦ x 0` | classes 0, 𝔠, 2; image uncountable F, T, F | Both directions hold; uses analytic perfect set theorem for ⇐ and `#Y ≤ 𝔠` for ⇒ |
| `Set.Countable.isMeagre` and the T₁ consequence (Lean 43, README 199) | unchanged since 6c542e9 | see previous report | Carried |
| All other 78 declarations and 49 prose rows | unchanged | see previous report | Carried |

## Not verifiable

- The previous review's unverifiable items stand unchanged: `kechris1995`, `gao2009`, `kst1999`, `silver1980` are paywalled records; the Miller manuscript/published numbering correspondence; the external formalization's global axiom claim; the proposals' merge state is not used as availability. The Alexandrov locator was checked against the Mathlib proposal's statement and an independent proof, not against Kechris's or Engelking's page.

## Source issues

- none
