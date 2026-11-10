# Review of HomotopyTheoryOfCategories (pull request #1521 at 8f3b224)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 74cabaa. The new head is a merge of main into the branch. `git diff --quiet 74cabaa HEAD -- TauCetiRoadmap/HomotopyTheoryOfCategories` succeeds, so `README.md`, `Suggested.lean` and `metadata.toml` are byte-identical to the head the previous review read. The pins are unchanged: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d`, the same as main's `lake-manifest.json`. The one finding of the previous report was in the pull-request description, and the description at this head repairs it. No finding remains.

## Previous findings

- R01 — repaired: the description now reads "GrothendieckInfinityGroupoids 0.1 (the globe category); the simplex Reedy structure is Mathlib's `SimplexCategory.reedyStructure` (8.3, 8.4)". `BordismFormalGroups` no longer occurs in the description, and it never occurred in `README.md`. The repair introduces no new claim: the README cites `SimplexCategory.reedyStructure` as Mathlib's at lines 174, 1040, 1047 and 1120, and the pin declares it at `Mathlib/AlgebraicTopology/Reedy/SimplexCategory.lean` line 42.

## Verified sound

**Gate and build.**

- The worker's gate at this head: every check 0, including `build=0` and `depcheck=0`, result `OK`.
- My re-run of the gate (`gate … HomotopyTheoryOfCategories --base origin/main`): every text scanner is 0. The only non-zero check is `depcheck=1`, "NOT IN ORDER: HomotopyTheoryOfCategories (insert it after its last supplier)". That check reads the public merge order, which does not list this roadmap yet; by the review rules this is not a finding.
- The dependency check against the candidate order prints `depcheck: 230 roadmaps, 2146 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. StableHomotopyKTheory is at line 16 of the candidate order and this roadmap at line 17.
- `lake env lean` on `TauCetiRoadmap/HomotopyTheoryOfCategories/Suggested.lean`, run from the worktree: exit 0, 52 "declaration uses `sorry`" warnings and no other message.
- Outside the folder, `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/HomotopyTheoryOfCategories'` is empty. The ten files the change summary lists outside the folder come from the merge of main and are not changes of this pull request. The three-dot diff touches only README (+1669), `Suggested.lean` (+920) and `metadata.toml` (+1).

**Signatures and padding.** The Lean file and the pins are unchanged, so the `#check @name` comparison, the reading of the 41 "lost binder" leads and the one-tactic padding probe of the earlier reports (~7 to ~14) stand. The 32 "Lean names found nowhere" leads of the citation resolver are this roadmap's own names: 31 of them are declared in `Suggested.lean` (each occurs at least twice there), and the 32nd, `Stack.stackification`, is SchemeAndStackFoundations §1.18's, cited as a supplier and not declared here.

**Cross-roadmap citations resolved this round: 11 sections in 5 roadmaps, re-read because main moved.**

- On main (2f76e05). SchemeAndStackFoundations was revised on main since the previous review; its section numbers and the three carriers survive, at new lines:
  - §1.18 (README line 2849): `Stack.stackification J F` for any small site and any category-valued pseudofunctor (line 2864). This is the generality the contract's "for an arbitrary small site" assumes.
  - §1.24 (line 3174): `CrossedModule Ht H` with `∂(h·x) = h ∂(x) h⁻¹`, `.quotientCategory`, `.isGroupoid`, `.isoClasses` (`coker ∂`), `.aut` (`ker ∂`) (lines 3197–3200). These are the five names 12.3 consumes.
  - §3.4 (line 5015): `PicardGroupoid C` with `pi0 C := Skeleton C` and `pi1 C := Aut(𝟙_C)` (lines 5058–5060); `gradedPicardGroupoid X` with symmetry the swap times `(−1)^{f·g}` (lines 5064–5072).
  - §3.7 (line 5173) exists, as the "not used" row says.
  - GeneralizedCohomology G2 item 1 (lines 213–223): the Kan–Quillen structure, and simplicial weak equivalences defined by components and based homotopy groups of the realization.
- At the open heads:
  - StableHomotopyKTheory §1.21 (line 340), §2.26 (856), §2.29 (894), §2.30 (908), §2.34 (940, `quillenTheoremB` in the forward comma form). §§1.10–1.12 (252, 260, 268) and §2.31 (916) exist, as the Scope comparison says. Its consumer row (2845) lists the same five sections and says this roadmap's Theorem A (its §2.4) is not an input there; its line 22 calls this roadmap a consumer and not a supplier. The supply is one-directional.
  - HigherToposTheory F1.8 (681): its characterization sentence still matches the **From HigherToposTheory** contract (unique `W₁`-then-`W₂` factorization, no non-identity endomorphism in either class, `≺₀` without infinite descending chains). L5.4 (4348) is Joyal's Theorem A, as line 513 says.
  - GrothendieckInfinityGroupoids 0.1 (170): `Globe` with its `Category` instance. Its lines 173 and 596 name this roadmap's 8.6 as the consumer.
- Pinned declarations opened: Tau Ceti `zerothHomotopyLoopSpaceEquivFundamentalGroup` (`TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean` line 200) and `HomotopyGroup.loopSpaceMulEquiv` (docstring line 48 of the same file); Mathlib `SimplexCategory.reedyStructure` (line 42 of its file).

**Overlaps and ownership.** The overlap report lists no other pull request that changes this roadmap, no cited id that an open pull request drops and no id that only an open revision defines. The generated depends-on block names #1060, #1901 and #1227, which are exactly the three suppliers that are still open. Ownership against the open roadmaps is unchanged since the earlier reports: the five closest in vocabulary are the three suppliers above plus LocallyPresentableCategories and ClassifyingTopoi, neither of which this README cites.

**Seeded sample.** None of the fifteen sampled targets contains or cites a changed line, because no line changed. They stand from the earlier full reviews. This round's recomputed spot checks are in the table.

**Adversarial table.** Rows for the statements the folder leaves untouched are carried forward:

- from ~7, its 49 rows (0.1–13.3);
- from ~8, the 1.4, 4.1, 4.6 and 12.6 rows;
- from ~9, the 1.4 and 8.3 rows;
- from ~10, the 8.3-remark and Out-of-scope rows;
- from ~11, its six rows;
- from ~12, the 2.4, Comparisons and Downstream rows;
- from ~13, its nine F1.8 and 7.2 rows;
- from ~14, its fourteen rows (the description, 10.2, 8.4, 12.7, 11.2, Convention 2).

No statement in the folder changed. The first rows cover the text that did change, which is the description. The others are spot checks recomputed this round on sampled targets.

| Statement | Instance | Computed on each side | Result |
| --- | --- | --- | --- |
| Description: "the simplex Reedy structure is Mathlib's `SimplexCategory.reedyStructure` (8.3, 8.4)" | README; Mathlib pin | README 8.3 (line 1040) and its *Needs:* (1047) name Mathlib's declaration; pin: `def reedyStructure : ReedyStructure (epimorphisms SimplexCategory) (monomorphisms _) ℕ`, line 42. | true (R01 repaired) |
| Description: supplier list | README supplier table, lines 56–63 | Description: GeneralizedCohomology G2 item 1; StableHomotopyKTheory {1.21, 2.26, 2.29, 2.30, 2.34}; HigherToposTheory F1.8; SchemeAndStackFoundations {1.18, 1.24, 3.4}; GrothendieckInfinityGroupoids 0.1. Table: the same five roadmaps and the same sections. | equal |
| Description: "changes nothing outside it" | three-dot diff | Outside the folder: empty. Inside: 3 files, 2590 insertions. | true |
| Description: build "with only `sorry` warnings" | `lake env lean` | 52 warnings, all `sorry`; 0 errors; exit 0. | true |
| 2.1 Check: `e ⥤ [1]` picking `1` is not aspherical | slices over `0` and `1` | `A/0`: needs a map `1 ⟶ 0` in `[1]`, none, so empty; `∅ ⥤ e` has `Nonempty` false versus true, not in `W₋₁`. With `b\A`: `0\A = {0 ⟶ 1}` and `1\A = {𝟙}`, one object each. | Check true; the definition's direction is pinned |
| 2.2 Checks: `W₀ < W₋₁ < ⊤` | two points `⥤ e`; `∅ ⥤ e` | Two points: both sides nonempty, so in `W₋₁`; `π₀` has 2 versus 1 elements, so not in `W₀`. `∅ ⥤ e`: false versus true, not in `W₋₁`. | true, both strict |
| 2.2 Check: the walking parallel pair is `W₀`- but not `W₁`-aspherical | graph with 2 vertices, 2 edges | Connected, so `π₀ = 1`. The free groupoid has vertex group free of rank `2 − 2 + 1 = 1`, that is `ℤ ≠ 1`, so `Π₁` is not equivalent to `e`. | true |
| 7.5 Checks: degree on `[1] × [1]` | `(0, 1) ⟶ (1, 1)` | Sum: `1 → 2`, strictly raised. Max: `1 → 1`, not raised by a non-identity map. | true; `max` excluded |
| 12.1 Check: skeletal gr-category on `ℤ/3`, `ℤ/7` | arithmetic mod 7 | `4³ = 64 = 9·7 + 1`; `4⁻¹ = 2` since `4·2 = 8`; the action `a ↦ 2ˣ a` has `2³ = 8 ≡ 1`, so it is an action of `ℤ/3`. The reverse composite gives `4 ≠ 2`. | true; convention pinned |
| 12.1 Check: discrete monoidal category on `ℕ` | `1 ∈ π₀ = ℕ` | `1 + n = 0` has no solution in `ℕ`, so `1` is not a unit and `isUnit_skeleton` would fail. On a group every element has an inverse. | negative control holds |
| 12.2 Checks | `H³(ℤ/2, ℤ/2)`; `H³(ℤ/3, ℤ/7)` | Trivial action of `ℤ/2` on `ℤ/2`: `Hⁿ = ℤ/2` for all `n`, so two classes, and `Aut` of both groups is trivial so they stay distinct. `H³(ℤ/3, ℤ/7)` is killed by 3 and by 7, hence 0. | true |
| 12.5 Check: `gradedPicardGroupoid (Spec ℚ)`, `ε(𝒪, 1) = −1` | supplier §3.4 at main, lines 5070–5072 | Supplier: symmetry is the swap times `(−1)^{f·g}`; at `f = g = 1` this is `−1` times the identity under `𝒪 ⊗ 𝒪 ≅ 𝒪`. README: `−1 ≠ 1` in `π₁ = ℚ^×`. | agree after main's revision |
| 12.3 contract: `CrossedModule Ht H` | supplier §1.24 at main, line 3197 | Supplier: `∂(h·x) = h ∂(x) h⁻¹` and `∂(x)·y = x y x⁻¹`, objects `H`, morphisms `H̃`. README 12.3: the same first law, `H` acting on `H̃`, the same four projections. | agree after main's revision |

**Remarks on untouched text** (no change requested):

- `README.md` line 1583, in Downstream consumers, says that GrothendieckNotesLemmas names this roadmap as the owner of 0.1–0.3 and 8.4. That roadmap is not on main and is no longer among the open roadmap pull requests whose heads I can read, so the sentence could not be resolved this round. It is a note about a consumer, not a supplier citation, and nothing in this roadmap depends on it.
- In 10.1 (line 1218), Groth 2013 introduces the represented prederivator in Example 1.2 (`groth2013` line 216). Example 1.11, the cited locator, is the statement that it is a derivator exactly when the category is bicomplete.
- In 7.2 (line 928), the sentence "A direct factorization of `f` is unique" repeats the clause two lines above it.

## Not verifiable

- Brown–Heath–Kamps 1983, Brown–Spencer 1976 and Joyal–Street 1993 are `uncertified` in the manifest and cited by locator. No changed text cites them.
- Hirschhorn 2003 (8.3) is still verified only through secondary sources, as in the earlier reports. No changed text cites it.
- The GrothendieckNotesLemmas sentence of Downstream consumers (first remark above): no readable copy of that roadmap on main or at an open head.

## Source issues

- none
