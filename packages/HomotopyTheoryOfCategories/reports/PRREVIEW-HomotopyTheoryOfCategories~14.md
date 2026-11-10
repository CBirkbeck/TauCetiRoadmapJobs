# Review of HomotopyTheoryOfCategories (pull request #1521 at 74cabaa)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 361db84. The new head is a merge of main into the branch. `git diff --quiet 361db84 HEAD -- TauCetiRoadmap/HomotopyTheoryOfCategories` succeeds, so `README.md`, `Suggested.lean` and `metadata.toml` are byte-identical to the head of the previous review. The merge leaves `lake-manifest.json` untouched: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d`. The only text that changed is the hand-written pull-request description, which repairs two of the three wrong supplier bullets. One finding remains, P3, carried from the previous report. No file in the folder needs to change.

## R01 (P3) — the description still names BordismFormalGroups F6.5 as a supplier

**Location.** The pull-request description, under "Ownership and suppliers": "GrothendieckInfinityGroupoids 0.1 (the globe category) and BordismFormalGroups F6.5 (the simplex Reedy structure);".

**Claim.** This roadmap consumes the simplex Reedy structure from BordismFormalGroups F6.5.

**Witness.** `README.md` has no occurrence of `BordismFormalGroups`. It takes `SimplexCategory.reedyStructure` from Mathlib: lines 174 and 1040, the *Needs:* line 1047 and Dependencies line 1120. The pinned `Mathlib/AlgebraicTopology/Reedy/SimplexCategory.lean` line 42 declares it.

**Repair.** In the description, change the bullet to "GrothendieckInfinityGroupoids 0.1 (the globe category); the simplex Reedy structure is Mathlib's `SimplexCategory.reedyStructure` (8.3, 8.4)". No file in the folder changes.

This is the remaining part of the previous R01, whose claim was that the description's list is what the roadmap consumes. PRREVIEW-HomotopyTheoryOfCategories~9 recorded the same stale bullet as a remark when the README dropped that supplier. BordismFormalGroups F6.5 on main is not an owner either. Its README lines 1689–1690 say to build the simplex Reedy structure following the design of Mathlib's declaration.

## Previous findings

- R01 — partly repaired: the description now reads "StableHomotopyKTheory §§1.21, 2.26, 2.29, 2.30, 2.34 (`π₁(BC)`, … Quillen's Theorem B)" and "HigherToposTheory F1.8 (the characterization of Reedy structures), for 7.2", as asked. It still lists "BordismFormalGroups F6.5 (the simplex Reedy structure)". Written again as R01 above.

## Verified sound

**Gate and build.**

- The worker's gate at this head: every check 0, including `build=0` and `depcheck=0`, result `OK`.
- My re-run of the gate (`gate … HomotopyTheoryOfCategories --base origin/main`): every text scanner is 0. The only non-zero check is `depcheck=1`, "NOT IN ORDER: HomotopyTheoryOfCategories (insert it after its last supplier)". That check reads the public merge order, which does not list this roadmap yet. By the brief this is not a finding.
- The dependency check against the candidate order prints `depcheck: 235 roadmaps, 2267 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. StableHomotopyKTheory is at line 16 and this roadmap at line 17. Of the five supplier roadmaps, StableHomotopyKTheory is the only one the candidate order lists. That is consistent with the description's "it finds 1 edge and no problem". GeneralizedCohomology and SchemeAndStackFoundations are on main. HigherToposTheory and GrothendieckInfinityGroupoids are open pull requests that add new roadmap folders.
- `lake env lean` on `TauCetiRoadmap/HomotopyTheoryOfCategories/Suggested.lean`, run from the worktree: exit 0, 52 "declaration uses `sorry`" warnings and no other message.
- Outside the folder, `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/HomotopyTheoryOfCategories'` is empty. The nine files that `changes.md` lists outside the folder come from the merge of main and are not changes of this pull request. The three-dot diff touches only the three files the description names: README 1669 lines, `Suggested.lean` 920 and `metadata.toml` 1.

**Signatures.** The Lean file and the pins are unchanged, so the `#check @name` comparison and the one-tactic padding probe of the earlier reports (~7 to ~12) still hold. I re-read the binder mentions of the 41 "lost binder" leads in `signatures.md`, by kind:

- Category instances (`Category.{v} C` 15, `Category.{v₁} C` 7, `Category.{v₂} D` 7, `Category* C`/`D` 5 each): 39 mentions. Each appears in the elaborated type as `Category.{u_1, u_2}` with renamed universes.
- `[SmallCategory A]`: 10. Each appears as `inst : SmallCategory A`, for example in `iA` and `iAFunctor`.
- `[Groupoid.{v} E]`/`[Groupoid.{v} B]`: 4 each. They appear as `inst`/`inst_1` in the `IsGroupoidFibration` lemmas.
- `[Preadditive C]`/`[Preadditive D]`: 5 each. They appear as `inst_2`/`inst_3`.
- `[IsDirect C]`: 3. It appears as an anonymous instance binder, for example in `IsDirect.rank : … → [IsDirect C] → C → Ordinal`.
- `IsCofibrationCategory`: the class keeps `CategoryWithCofibrations` and `CategoryWithWeakEquivalences`. None of its fields C1–C3 mentions an initial object, so it does not need `[HasInitial C]`. `brown_factorization` (line 777) does carry `[HasInitial C]`.

None of these binders is actually lost.

**Cross-roadmap citations resolved this round: 11 sections in 5 roadmaps.**

- On main:
  - SchemeAndStackFoundations §1.18 (README line 2745, `Stack.stackification` at 2775), §1.24 (3068, `CrossedModule Ht H` at 3091) and §3.4 (4789, `PicardGroupoid` at 4827).
  - GeneralizedCohomology G2 item 1 (211–223: the Kan–Quillen structure, and simplicial weak equivalences defined by components and based homotopy groups).
- At the open heads:
  - StableHomotopyKTheory §1.21 (line 340), §2.26 (856), §2.29 (894), §2.30 (908) and §2.34 (940, `quillenTheoremB` in the forward comma form). Its consumer row (2845) states the same five sections and says that its §2.4 is not an input.
  - HigherToposTheory F1.8 (681). Its characterization sentence still matches the **From HigherToposTheory** contract (`README.md` lines 200–204): "for some well-ordered α", unique factorization, no non-identity endomorphism in either class, `≺₀` on distinct objects.
  - GrothendieckInfinityGroupoids 0.1 (170, `Globe` with its `Category` instance).

**Overlaps.** The overlap report lists no other pull request that changes this roadmap, no cited id that an open pull request drops and no id that only an open revision defines. Ownership is unchanged since the previous report.

**Seeded sample.** None of the fifteen sampled targets contains or cites a changed line, because no line changed. They stand from the earlier full reviews. I spot-checked these against the cached text and the pins:

- 10.1 and 10.2 against `groth2013`:
  - Definition 1.9, homotopy Kan extensions: line 327.
  - Definition 1.10, Der1–Der4: lines 552–561.
  - Example 1.11, "derivator iff bicomplete": line 578.
  - Proposition 1.12, `D(∅) ≃ e` with initial and terminal objects: lines 602–604.
  - Definition 1.13, strong derivators: line 681.
  - Definition 1.15, the dual prederivator: line 725.
  - Theorem 1.31, `D^M(K) = D(M × K)`: line 1344.
- Convention 2, sieves and cosieves (Definition 1.28): `groth2013` lines 1218–1222. A sieve is closed under maps into its image, as the README says.
- 8.4: Mathlib `SemiSimplexCategory` (`SimplexCategory/SemiSimplexCategory.lean` line 31); `Suggested.lean` line 663.
- 12.7: Tau Ceti `zerothHomotopyLoopSpaceEquivFundamentalGroup` (`LoopSpace.lean` line 200) and `HomotopyGroup.loopSpaceMulEquiv` (line 243).
- 11.2: `brown_factorization` (`Suggested.lean` line 777).

**Adversarial table.** Rows for statements the folder leaves untouched are carried forward:

- from ~7, its 49 rows (0.1–13.3);
- from ~8, the 1.4, 4.1, 4.6 and 12.6 rows;
- from ~9, the 1.4 and 8.3 rows;
- from ~10, the 8.3-remark and Out-of-scope rows;
- from ~11, its six rows;
- from ~12, the 2.4, Comparisons and Downstream rows;
- from ~13, its nine F1.8 and 7.2 rows.

No statement in the folder changed. The first rows below cover the changed text, which is the description's claims. The remaining rows are recomputed spot checks of this round's sample.

| Statement | Instance | Computed on each side | Result |
| --- | --- | --- | --- |
| Description: "BordismFormalGroups F6.5 (the simplex Reedy structure)" | README text; Mathlib pin | README: 0 occurrences of `BordismFormalGroups`; `SimplexCategory.reedyStructure` cited as Mathlib's at lines 174, 1040, 1047 and 1120. Pin: `def reedyStructure : ReedyStructure (epimorphisms SimplexCategory) (monomorphisms _) ℕ` with `deg := len`, line 42. | description false (R01) |
| Description: StableHomotopyKTheory bullet | contract, lines 193–198 | Description {1.21, 2.26, 2.29, 2.30, 2.34}; contract {2.26, 2.29 for 4.1; 1.21 for 4.6; 2.34 for 4.4; 2.30 for 4.3}. The sets are equal, and §2.31 is absent from both. | true (repaired) |
| Description: HigherToposTheory bullet | lines 58, 200–204 | Description "F1.8 … for 7.2"; the supplier table and contract say F1.8 for 7.2. | true (repaired) |
| Description: "adds the folder … changes nothing outside it" | three-dot diff | Outside the folder: empty. Inside: README (+1669), `Suggested.lean` (+920), `metadata.toml` (+1). | true |
| Description: "fourteen layers" | layer headings | `## Layer 0` … `## Layer 13`: 14 headings. | true |
| Description: build "with only `sorry` warnings" | `lake env lean` | 52 warnings, all `sorry`; 0 errors; exit 0. | true |
| 10.2 Check, Der3 fails for a discrete 2-object category | `C = {a, b}` discrete, `u : 2 → e` | `u^*` is the diagonal `C → C × C`. Its left adjoint would give `a ⊔ b`. No object receives maps from both `a` and `b`, so there is no left adjoint. | Check true |
| 10.2 Check, constant `J ↦ Type u` fails Der1 at `∅` | `D(∅) = Type u` | Prop 1.12(i) forces `D(∅) ≃ e`. `Type u` has the non-isomorphic objects `PEmpty` and `PUnit`, so it is not equivalent to `e`. | Check true |
| 10.2 Check, represented prederivator is a derivator | `C` bicomplete versus `C = {a, b}` discrete | Example 1.11 gives the derivator property exactly when `C` is bicomplete. The discrete category has no coproduct `a ⊔ b`, so it is not bicomplete, which agrees with the previous row. | consistent |
| 8.4 Check, `Nat.choose (n + 1) (m + 1)` morphisms `⦋m⦌ₛ ⟶ ⦋n⦌ₛ` | `(m, n) = (0, 1), (1, 1), (1, 0)` | Order embeddings: 2 (`δ 0`, `δ 1`), 1 (`𝟙`), 0. Formula: `C(2,1) = 2`, `C(2,2) = 1`, `C(1,2) = 0`. The last case agrees with the Check "no morphism `⦋1⦌ₛ ⟶ ⦋0⦌ₛ`". | true |
| 8.4 Check, `δ i ≫ δ j = δ (j - 1) ≫ δ i` for `i < j` | Mathlib `δ_comp_δ` with `H : i ≤ j'` | Mathlib: `δ i ≫ δ j'.succ = δ j' ≫ δ i.castSucc`. Put `j = j'.succ`, so `j' = j − 1 ≥ i` exactly when `i < j`. | true |
| 12.7 Checks | `S¹`; `O(2)`; `ℝP²` | `S¹` connected with `π₁ = ℤ`. `O(2)`: conjugating by a reflection sends `ρ_θ` to `ρ_{−θ}`, which acts by `−1` on `π₁(SO(2)) = ℤ`. `ℝP²`: the deck transformation is the antipodal map of `S²`, of degree `(−1)³ = −1`. | true |
| 11.2 `brown_factorization`, degenerate model | `Type`, all maps cofibrations, isomorphisms as weak equivalences | C1–C3 hold, with C3 given by `f = f ≫ 𝟙`. Brown's lemma holds with `Z = Y`, `i = f`, `r = j = 𝟙`. The general route uses only C1–C3: `X ⊔ Y` is the pushout of two cofibrations from `⊥`; factor `(f, 𝟙)` by C3; `j ≫ r = 𝟙` with `r` weak, so `j` is weak by two-out-of-three. | true |
| Convention 2, sieve | `groth2013` Def. 1.28 | Source: a map `k ⟶ u(j)` forces `k` into the image. README: `b ⟶ b'` with `b'` in the sieve forces `b` into it. | agree |

**Remarks on untouched text** (no change requested):

- In 10.1 (line 1218), Groth 2013 introduces the represented prederivator in Example 1.2 (`groth2013` line 216). Example 1.11, the cited locator, is the statement that it is a derivator exactly when the category is bicomplete.
- In 7.2 (line 928), the sentence "A direct factorization of `f` is unique" still repeats the clause two lines above it.

## Not verifiable

- Brown–Heath–Kamps 1983, Brown–Spencer 1976 and Joyal–Street 1993 are `uncertified` in the manifest and cited by locator. No changed text cites them.
- Hirschhorn 2003 (8.3) is still verified only through secondary sources, as in the earlier reports. No changed text cites it.

## Source issues

- none
