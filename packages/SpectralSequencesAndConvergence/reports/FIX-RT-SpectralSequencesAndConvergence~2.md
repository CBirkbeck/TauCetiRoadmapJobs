# FIX-RT-SpectralSequencesAndConvergence~2: repair report

Six P3 findings from two reviews. All six were checked against the sources, the pins and main, and all six hold. No finding overlaps another: each touches a different passage.

## RT-SpectralSequencesAndConvergence~2a/F01 (P3) — applied

The third Check of §1.2 repeated the values of the second (`Z_3(0,1) = B_3(0,1) = E_3^{0,1} = 0`). It is replaced by a naturality Check. The morphism from the `×2` example to the `d_2 = ×4` sequence is the identity at `(0,1)` and `×2` at `(2,0)`. It gives `B_3 = 2ℤ ↦ 4ℤ = B′_3`, `Z_3 = ℤ → Z′_3 = ℤ` and the induced map `ℤ/2 → ℤ/4`, `[1] ↦ [2]`. The Check states this in my own words rather than the reviewer's text.

## RT-SpectralSequencesAndConvergence~2a/F02 (P3) — applied

The witness holds: if `P` is every object, all four closure conditions hold, so the failing hypothesis is additivity. The negative Check of §2.3 now reads "Additivity on `P` cannot be dropped". It uses `P` = all of `ModuleCat k` and `v` = integer `Module.finrank`, with `k^(ℕ)` at `(0,1)` and `(2,0)` and `d_2` the left shift. The page sums are `0` and `−1`, so the identity fails, and the failing hypothesis is `0 ≠ 1 + 0`. No other Euler Check (3.4, 5.3) has this pattern.

## RT-SpectralSequencesAndConvergence~2b/F01 (P3) — applied

The witness holds on main. In `TauCetiRoadmap/AlgebraicTopology/README.md`, line 879–880 maps Stage 6 item 0 to §6.0 and gives the tower algebra to Tau Ceti; the §6.0 heading at line 2145 is "Restriction towers and homotopy-square maps". Three places changed:

- **Scope.** The scope bullet now cites §6.0 for the restriction towers and homotopy-square maps. It attributes lim, lim¹, the six-term sequence, Mittag–Leffler vanishing and the Milnor sequences to `TauCeti.ModuleTower` and `TauCeti.ComplexTower`, both at the pin (`Tower/Basic.lean:78`, `Tower/Milnor/Basic.lean:106`).
- **Supplier contract.** It now says §6.0 is not consumed.
- **7.1 API bullet.** It now reads "on which AlgebraicTopology §6.0 builds".

The reviewer's phrase "former numbering" was dropped, because it is process wording.

## RT-SpectralSequencesAndConvergence~2b/F02 (P3) — applied

The witness holds. In bhatt-scholze2015, line 750 is Proposition 3.1.9 (exact countable products in a replete topos), and line 755–756 is Proposition 3.1.10 (`lim ≃ R lim` for epimorphic towers of abelian sheaves). Neither states a converse. Changes:

- **README 7.2.** It now cites 3.1.9 (line 750–753) and 3.1.10 (line 755–770) for the implication from repleteness, and says the converse is proved here by the stated route.
- **`Suggested.lean`.** The docstring of `isReplete_iff_countableAB4Star_and_epi_towerDifference` says the same.
- **Pattern.** The bhatt-scholze2015 locator in `sources.toml` (`locator`, `version_note`) and in the README References now includes Proposition 3.1.9.

## RT-SpectralSequencesAndConvergence~2b/F03 (P3) — applied

The witness holds at the pin. The four names used are all declared in `Filtered/SpectralObject.lean`: `spectralObject` (line 147), `spectralObjectMap` (191), `filtrationFunctor` (304) and `spectralSequence` (409). `Filtered/Naturality.lean` adds only `filtrationFunctorMap` and its lemmas, plus `spectralObjectMap_hom_app_spectralObjectHIsoCokernel_hom`, and the file uses none of them. The import is now `TauCeti.Algebra.Homology.SpectralSequence.Filtered.SpectralObject`. The other four imports are each used: `abutmentFiltration`, `spectralSequenceMap`, `towerDifference` and `IsReplete`.

## RT-SpectralSequencesAndConvergence~2b/F04 (P3) — applied

The witness holds. In stacks-012K, Definition 31.2 (tag 02N0) occupies line 3715–3719, and the Neeman remark is the next paragraph, line 3720–3724. The docstring of `epi_towerDifference_of_isMittagLeffler` now says the example is "recorded in Stacks, Homological Algebra, Section 31, in the paragraph after Definition 31.2".

Pattern search:

- The README (7.2) already locates the remark by line 3720–3724.
- The other tag 02N0 citation (docstring of `IsMittagLeffler`) is for the definition itself, which is correct.

## Checks run

- **Elaboration.** From the content checkout I ran `lake env lean packages/SpectralSequencesAndConvergence/Suggested.lean` twice, once after the edits and once after the final docstring rewrap. Exit 0, no errors, ten `declaration uses 'sorry'` warnings at lines 113, 125, 139, 187, 212, 230, 248, 278, 305 and 326. The module `TauCeti.Algebra.Homology.SpectralSequence.Filtered.SpectralObject` was already built at the pin.
- **Signatures.** I wrote `#check @name` for all 13 declarations in one scratch file and elaborated it once. Every type is identical to `scratch/signatures.md`, because only docstrings and one import changed. No binder was lost and nothing changed. The 14th entry, `that`, in `signatures.md` is an extraction artefact: docstring line 66 begins with "theorem that". It is not a declaration.
- **Dependency check.** Output, verbatim:

  ```text
  depcheck: 242 roadmaps, 2194 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the edited README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."
- **Ownership.** AlgebraicTopology §6.0 has the same heading on main (line 2145) and at the head of the open multi-roadmap revision that keeps the section-numbered layout (line 2652). Another open draft revision of AlgebraicTopology still uses its earlier "Stage 6" layout. It is a revision of a roadmap on main, so it is not a dependency, and main's mapping (line 879) keeps the old id resolvable. No new object is claimed here, so no ownership question arises.

## Adversarial pass on the new and changed text

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.2 naturality Check | `E`: `ℤ →(×2) ℤ`, `E'`: `ℤ →(×4) ℤ` at `(0,1) → (2,0)`; `f = (1, ×2)` | square: `4·1 = 4 = 2·2`; `E_3 = (0, ℤ/2)`, `E′_3 = (0, ℤ/4)`; `×2(2ℤ) = 4ℤ = B′_3`; pullback of `Z′_3 = ℤ` along `×2` is `ℤ ⊇ Z_3`; `[1] ↦ [2]`, `2·[2] = [4] = 0` (well defined), `[2] ≠ 0` in `ℤ/4`; at `(0,1)`: `Z_3 = ker ×2 = 0`, `Z′_3 = ker ×4 = 0` | consistent with the naturality API item and with the second Check; pages `r ≥ 4` have zero differentials, so the morphism exists in Mathlib's carrier | new Check |
| 2.3 additivity Check | `P` = all of `ModuleCat k`; `v = (finrank : ℤ)`; `k^(ℕ)` at `(0,1)`, `(2,0)`, `d_2` the left shift | `ker = k·e₀`, onto; signs `(−1)^1`, `(−1)^2`; page 2: `−0 + 0 = 0`; page 3: `−1 + 0 = −1`; `0 ≠ 1 + 0` on `0 → k → k^(ℕ) → k^(ℕ) → 0` | the theorem's conclusion would give `0 = −1`; exactly `hv` fails, `hs` and `hsP` hold; with `P` = finite-dimensional, `hsP` fails at both positions (`k^(ℕ)` not finite-dimensional) | new Check |
| 2.3 API bullet "`P` everything, `v` an `AdditiveInvariant`" against the new Check | `finrank` on all spaces | not additive (`0 ≠ 1`), so not an additive invariant | no conflict | none |
| `isReplete_iff_countableAB4Star_and_epi_towerDifference` (docstring citation) | forward: 3.1.9 + 3.1.10; converse: README route | `K_n = ker(F_n → F_0)`, transitions epi (snake), `0 → lim K → lim F → F_0 → lim¹ K = 0`, so `lim F → F_0` epi; uses `CountableAB4Star` for the six-term sequence | both directions have a cited source or a route; type unchanged | docstring |
| 7.2 README citation | bhatt-scholze2015 lines 750–753, 755–770 | 3.1.9: countable products exact in a replete topos; 3.1.10: replete topos, epi tower of abelian sheaves, `lim ≃ R lim`, i.e. `t − id` onto | matches the parenthesis as now written | text |
| Scope / supplier text for AlgebraicTopology | AT main lines 174–183, 879–880, 2145–2199 | §6.0: holim(f,h) of homotopy-commutative tower maps and singular/cellular restriction towers; tower algebra `TauCeti.ModuleTower`, `TauCeti.ComplexTower` | attributions agree with the owner's own scope | text |
| Import change | names used versus declarations at the pin | 4 of 4 used names in `Filtered/SpectralObject.lean`; elaborates | no lost name | import |

Recomputed Checks that use the changed objects: the second Check of §1.2 (`Z_3(2,0) = ℤ`, `B_3(2,0) = 2ℤ`, `E_3^{2,0} = ℤ/2`) and the first two Checks of §2.3 (`−2 + 1 = −1 = −1 + 0`; `−1 + 1 = 0`, page 3 `0`). Both still hold and agree with the new Checks.

## For the maintainer

- `design/plan.json` (`suppliers`) still describes AlgebraicTopology as "Stage 6, item 0: module towers, lim, lim¹, six-term and Milnor sequences". This job may edit only the plan's `gaps` list, so that entry is stale design metadata and was left unchanged. No gap was added or changed.
- Ownership against the open pull requests was checked with `roadmaps grep` and `roadmaps show` for AlgebraicTopology. No declaration name changed, and no other roadmap's citation of this roadmap is affected.
- No source was fetched and `scratch/needs-references.toml` was not written. The edits used only the cached texts: stacks-012K, bhatt-scholze2015 and helle-rognes2024.
- The two reviews' "For the human reviewers" sections were not acted on.
