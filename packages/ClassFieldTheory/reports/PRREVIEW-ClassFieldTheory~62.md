# Review of ClassFieldTheory (pull request #3170 at 0c3be17)

**Verdict:** accepted

**Summary.** An incremental re-review of 0 changed lines in the folder since `ae3c1ba`, whose purpose is to read the pull request's title and description against this head: accepted, with no finding. The previous review's one small correction is repaired (the description now says that the prime-to-`p` form is stated in the README only), and the title and description agree with the folder's change. Two format notes carried from the previous review remain, none blocking. Nothing is left for a human to decide.

## N01 — The Layer 8 row of "From Tau Ceti" still omits three names that 8.1 consumes

`LocalNormSubgroups`, `localNormOpenSubgroup` and `localNormSubgroup_le_iff_of_isAbelian` (`TauCeti/NumberTheory/ClassFieldTheory/LocalExistence/Correspondence.lean`, lines 79, 83 and 57 at the pin) appear in the 8.1 paragraph (README lines 1159–1167) but not in the supplier row. Adding them keeps the contract exact.

## N02 — "`V` lies in the class field of `N`" (docstring of `localClassField_galoisConnection`, `Suggested.lean` lines 147–149) reads, on fields, as the reverse inclusion

Wording such as "`V` lies in the layer subgroup `(localClassField N).1`, that is, the fixed field of `V` contains the class field of `N`" would remove the ambiguity.

<details><summary>What was checked</summary>

- **Scope:** incremental re-review; the folder is unchanged since `ae3c1ba`, so this round read the pull request's title and description against the head and the folder's change against the base (62 lines: the overview sentence, the 8.1 paragraph, item 4 of "Owned here", the paragraph after the acceptance-signature table, two theorems and a docstring paragraph in `Suggested.lean`).
- **Title and description:** sixteen roadmap folders are changed, as the title says (31 files, all inside the sixteen folders the description lists); the pin `2fd255d` is the Tau Ceti revision of `lake-manifest.json`; the ClassFieldTheory bullet names Layer 8, the two declarations `Suggested.lean` adds, and the README-only prime-to-`p` form; no heading, layer or declaration is removed, and no supplier is added. DynamicalDegreesOfRationalMaps is indeed the one folder whose `Suggested.lean` is unchanged.
- **Automatic checks:** the worker's checks all passed at this head; the dependency check reports no problem.
- **Build:** `Suggested.lean` elaborates with `sorry` warnings only.
- **Other open work:** #3177 changes this README at line 673 (Layer 5 coefficient conventions); a trial merge of the two heads merges this folder without conflict (the conflicts it reports are in GeometricTopology, which has a review of its own).
- **Not re-checked:** the folder's untouched text, and the uncertified and waived locators in the README.

</details>

## Previous findings

- The previous report (of `ae3c1ba`) had no finding (no R-numbered remark). Its small correction and format notes at this head:
- C01 (description and the prime-to-`p` form) — repaired: the bullet now ends "(the characteristic-zero forms; the prime-to-`p` version is stated in the README only)", and the general sentence says "in ClassFieldTheory and AmenableGroups part of it".
- N01 — not repaired (N01 above). N02 — not repaired (N02 above).

## Verified sound

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Description bullet and 8.1: `L ⊇ K_N ↔ N_{L/K}(Lˣ) ⊆ N` for every finite Galois `L/K`, char 0 (`localClassField_galoisConnection`) | `K = ℚ₃`, `L = ℚ₃(√3)`; `N = ⟨3⟩×(1+3ℤ₃)`, `N = Kˣ`, `N = Nm(Lˣ)` | `Nm(Lˣ) = ⟨−3⟩×(1+3ℤ₃)`, index 2. First `N` (class field `ℚ₃(√−3)`): `−3 ∉ N` false; `√−3 ∉ L` false. `Kˣ`: true, true. `Nm(Lˣ)`: true, true | both sides agree in all three | none |
| Description: "abelian or not, with `maximalAbelianLayer` as its closure" (`localClassField_localNormOpenSubgroup`) | `K = ℚ₂`, `L = ℚ₂(ζ₃, 2^{1/3})`, group `S₃`; abelian `L = ℚ₃(√3)` | `S₃^ab` has order 2; largest abelian subextension `E = ℚ₂(ζ₃)`, unramified; `Nm(Lˣ) = Nm(Eˣ) = ⟨4⟩×ℤ₂ˣ`, index 2 ≠ 6; closure `L ↦ E ≠ L`. Abelian case: closure is `L` | insertion, not an isomorphism, as 8.1's Check says | none |
| Description: "Names not at the pin are described in prose"; both new declarations absent from the pin | grep of the pinned `TauCeti/` for both names | 0 hits each; the lemmas of the stated route exist (`Correspondence.lean` 57, 68, 116; `NormSubgroup.lean` 208; `AbelianLayer.lean` 161) | true | none |

The rows for untouched statements stand as in the previous review, of `ae3c1ba`.

- Source locators checked against the text: 0 new (no passage changed; the three Milne locators of 8.1 were checked at `ae3c1ba`).
- Library declarations opened at the pin: `LocalExistence/Correspondence.lean` lines 57, 68, 79, 83, 116, 189; `LocalExistence/NormSubgroup.lean` line 208; `Formation/AbelianLayer.lean` line 161.
- Cross-roadmap citations: the change adds none; the resolver lists none missing.
- Overlap check: read LocalAnabelianGeometry, IdelicReciprocityCountsAndCyclotomicClassGroups, ArithmeticGaloisDuality, ProfiniteCohomology (open), LocalGaloisGroups, FilteredLocalGaloisGroups, FunctionFieldArithmetic (main), as in the previous review; the folder is unchanged, so no object is added; the one shared object is unchanged: FunctionFieldArithmetic §4.2 owns the `p`-primary extension in characteristic `p`, this roadmap the insertion in characteristic zero and prime to `p`.
- Dependency check, verbatim: `depcheck: 95 roadmaps, 1078 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean` gives eight ``declaration uses `sorry` `` warnings (lines 88, 104, 137, 151, 161, 174, 185, 199) and nothing else.
- Changes outside the folder: `git diff --stat` against the base, excluding this folder and the fifteen other folders the pull request names, is empty.
- Merge-base comparison: 0 headings removed, 0 layers removed or retitled, 0 Lean declarations removed, 2 added.

Source independence: 0 passages compared with 0 sources (changed passages only; the folder is unchanged since `ae3c1ba`); largest share of locators milne-cft, about 24 of 71 source mentions, as in the previous review; contents not compared again, since no layer is added, removed or reordered.

Research link: local and global class field theory in the cohomological form of Artin–Tate (2009) and Milne's notes, with local Tate duality and Euler characteristics (Milne 2006; Neukirch–Schmidt–Wingberg 2008), the inputs that LocalGaloisGroups and FunctionFieldArithmetic consume; this rests on the README's overview and References.

## Not verifiable

- None for the change.
- The uncertified and waived locators elsewhere in the README (serre-local-fields, neukirch-ant, nsw, artin-tate) are settled in the manifest and untouched by this change.

## Source issues

- none

## For the human reviewers

- none
