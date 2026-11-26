# Review of ClassFieldTheory (pull request #3170 at 57376f9)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 40 changed lines since `87e7f72`. The change adds the norm-subgroup Galois insertion and its closure equation to 8.1 and states both in `Suggested.lean`. I checked the new paragraph, its Check, the two theorems and the README passages they affect against the pinned Tau Ceti, the build, the worker's text scanners and its check for files changed outside the folder, the dependency check, the ownership sweep and the pull request's text. The Galois connection, the insertion, the closure operator `V ↦ V.maximalAbelianLayer` and the `S₃` Check are all correct, and there is no finding. There are four small corrections: three README lists of open theorems were not updated, the new statement has no locator, both new theorems are a few lines from pinned lemmas, and a description sentence does not hold for the prime-to-`p` form. There are also two format notes. Nothing is left for a human to decide.

## C01 — Three README passages that list the open theorems do not include the new Layer 8 target

A reader of the overview or of Scope and ownership would conclude that Layer 8 is entirely Tau Ceti's. They would also take the open theorems to be only those of Layers 7 and 13. Three passages say so:
- **The overview** (lines 43–47) lists the open theorems and ends "The last open theorem removes Tau Ceti's hypothesis on valuations".
- **Item 4 of "Owned here"** (line 2087) ends "(Layer 8): Tau Ceti's." Its introduction says that the open headline theorems are the ones stated in `Suggested.lean`.
- **The "Headline acceptance signatures" table** (lines 2405–2413) has no row for `localClassField_galoisConnection` or `localClassField_localNormOpenSubgroup`.

The module docstring of `Suggested.lean` does list the new pair. The repair is:
- one sentence in the overview;
- an "**Open targets** (Layer 8): the norm-subgroup Galois insertion and its closure operator, in characteristic zero and in the prime-to-`p` range" clause in item 4;
- one row in the table.

## C02 — The new statement in 8.1 has no source locator

Every other theorem of 8.1 carries a locator, so a reader cannot tell where this one is proved. The statement combines two results of `milne-cft`. The first is the order statement of the abelian correspondence, I Corollary 1.2(b) as extended by Corollary 1.5, pp. 20–21 (milne-cft lines 1209–1214 and 1277). The second is the norm limitation theorem for every finite extension, III Theorem 3.5, p. 108 (milne-cft line 4901). Adding "(Milne, *Class Field Theory*, I Corollaries 1.2(b) and 1.5, pp. 20–21, with III Theorem 3.5, p. 108)" after the field-level sentence would cover both the connection and the closure equation.

## C03 — Both new theorems in `Suggested.lean` follow from pinned lemmas in one to three lines

As acceptance tests they ask an implementer for little. On a scratch copy, elaborated against the pins:
- **The closure equation:** a single `exact localClassField_unique (localClassField _).2 V.isAbelianClassFieldLayer_maximalAbelianLayer (by simp [localNormSubgroup_maximalAbelianLayer])` closes `localClassField_localNormOpenSubgroup`.
- **The Galois connection:** `intro V N`, then one `rw` with `localNormSubgroup_le_iff_of_isAbelian` and `localClassField_normSubgroup`, then `rfl`, closes `localClassField_galoisConnection`.
- **The insertion:** the `GaloisInsertion` itself follows in four more lines.

This is the README's own route. If the author keeps them as the formal record of the new 8.1 target, the module docstring would be more accurate listing them as the structured form of the pinned correspondence rather than among "the open headline theorems". Alternatively, mark them as sanity checks.

## C04 — A description sentence does not hold for this folder's prime-to-`p` form

The description says: "Planned Prop-valued statements are declared with `sorry` in the folder's `Suggested.lean`". For this folder that does not hold:
- 8.1 also plans the prime-to-`p` Galois connection ("Prove the same in the prime-to-`p` scope").
- That connection is a Prop and statable at the pins: the iff for `V` of degree prime to `p` and `N : LocalNormSubgroupsPrimeTo K p` elaborates on a scratch copy.
- Yet `Suggested.lean` neither states it nor says that it is left out.

Either add that statement, or amend the description to "… declared with `sorry` in the folder's `Suggested.lean` (for ClassFieldTheory, the characteristic-zero forms only) …" and say the same in the module docstring.

## N01 — The Layer 8 row of "From Tau Ceti" (line 2330) omits three names the new paragraph consumes

The missing names are `LocalNormSubgroups`, `localNormOpenSubgroup` and `localNormSubgroup_le_iff_of_isAbelian` (all in `LocalExistence/Correspondence.lean`). Adding them keeps the supplier contract exact.

## N02 — "`V` lies in the class field of `N`" (docstring of `localClassField_galoisConnection`, `Suggested.lean` line 145) reads, on fields, as the reverse inclusion

The README warns about exactly this direction (line 2430). Wording such as "`V` lies in the layer subgroup `(localClassField N).1`, that is, the fixed field of `V` contains the class field of `N`" would remove the ambiguity.

<details><summary>What was checked</summary>

- **Previous findings:** the previous review of this folder raised none, so there was nothing to re-check.
- **Automatic checks:** the worker's checks all passed. My rerun of the check for files changed outside the folder flags only the files of the other roadmap folders this pull request changes; those folders are the pull request's own, so this is expected. The dependency check reports no problem.
- **Build:** `Suggested.lean` elaborates with `sorry` warnings only.
- **Pins:** neither the pins nor any file outside the named folders changed.
- **Not re-checked:** the uncertified and waived locators elsewhere in the README are untouched by the change and were not re-checked.

</details>

## Verified sound

Adversarial table. These rows cover the statements the diff adds and the passage C04 touches. The rows for untouched statements are carried from earlier reports.

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `localClassField_galoisConnection`: `N(V) ≤ N ↔ V ≤ (localClassField N).1` (README 1155–1157, Lean 147) | `V = ⊤`; `ℚ₅`, `V` cutting out `L = ℚ₅(ζ₃, 5^{1/3})`, with `N = N(V)` and with `N = N(ℚ₅(√5))` | `⊤`: `Kˣ ≤ N` and `⊤ ≤ W_N` both hold iff `N = Kˣ`. `N(V) = ⟨25⟩×ℤ₅ˣ`: true and true. `N(ℚ₅(√5))`: unit `2` has `(2,5)₅ = −1`, so false; `√5 ∉ L`, so false | holds | C03, N02 |
| the same with the inclusion reversed (wrong model) | `V = ⊤`, `N` of index 2 | `N ≤ Kˣ` is true; `⊤ ≤ W_N` is false | the reversed form is excluded by the stated law | none |
| insertion: `N(localClassField N) = N` | `ℚ_p`, `p` odd, `N = ⟨p⟩×U¹` | index `p−1`; class field `ℚ_p(ζ_p)`; `localClassField_normSubgroup` gives `N` back | an insertion, not a coinsertion (next row) | none |
| `localClassField_localNormOpenSubgroup`: `= V.maximalAbelianLayer` (README 1159–1161, Lean 157) | `V = ⊤`; `ℚ₉/ℚ₃`; `S₃` layer over `ℚ₂` | `⊤ ↦ Kˣ ↦ ⊤`. Abelian: `⟨9⟩×ℤ₃ˣ ↦ V = V.maxAb`. `S₃`: index `2 = [ℚ₂(ζ₃):ℚ₂]`; the wrong model "`= V`" gives degree 6 | holds | C03 |
| the 8.1 Check: for `p ≡ 2 mod 3`, `V < V.maxAb` and `V.maxAb` cuts out `ℚ_p(ζ₃)` (README 1165–1167) | `p = 2`, `p = 5`; negative control `p = 7` | `p = 2`: `X²+X+1` is irreducible over `𝔽₂` and `X³−2` is Eisenstein, so degree 6, group `S₃`, `[S₃,S₃] = A₃`. `p = 5`: `3 ∤ 4`. `p = 7`: `ζ₃ ∈ ℚ₇`, the extension is cyclic cubic, `V = V.maxAb` | true; the hypothesis is load-bearing | none |
| on fields: `L ⊇ K_N ↔ N_{L/K}(Lˣ) ≤ N` (README 1158–1159) | `L = ℚ₂(ζ₃, 2^{1/3})`; `N = N(ℚ₂(ζ₃))`, `N = N(ℚ₂(i))` | first: `N_L = ⟨4⟩×ℤ₂ˣ = N`, both true. Second: `(−1,−1)₂ = −1`, so `−1 ∉ N`, and `i ∉ L`: both false | holds (Galois is not needed) | C02 |
| prime-to-`p` form (README 1161–1162; C04) | `𝔽₃((t))`, unramified quadratic `V`, `N = N(V)`; general | index `2`, coprime to `3`: both sides true. On a scratch copy the iff and its closure equation each follow from pinned lemmas in two lines | holds, and is statable at the pins | C04 |
| 8.1 existence locator, Milne CFT III Thm 5.1, p. 115 (README 1106) | milne-cft line 5186 | Theorem 5.1 on printed p. 115; the author proves it only in characteristic zero (line 5188), as the README says | matches | none |

- **Source locators checked:** 4, all in milne-cft, at lines 5186 (III Theorem 5.1, p. 115), 1209–1214 and 1277 (I Corollaries 1.2 and 1.5, pp. 20–21), and 4901 (III Theorem 3.5, p. 108).
- **Library declarations opened at the pin (Tau Ceti `2fd255d`):**
  - `LocalExistence/Correspondence.lean`: lines 57, 68, 79, 83, 110, 116, 122, 189, 210, 217;
  - `LocalExistence/NormSubgroup.lean`: lines 190, 199, 208;
  - `Formation/AbelianLayer.lean`: lines 130, 152, 161, 171, 191.
  - No `GaloisConnection`, `GaloisInsertion` or `ClosureOperator` occurs in `TauCeti/NumberTheory/ClassFieldTheory/`, so nothing duplicates the new targets.
- **Cross-roadmap citations resolved:**
  - FunctionFieldArithmetic README 907 and 3394 cite Tau Ceti's `localClassFieldCorrespondence`, not the new names.
  - LocalAnabelianGeometry (open) leaves local class field theory to this roadmap.
  - No roadmap, on main or open, cites `localNormOpenSubgroup`, `localClassField_galoisConnection` or `localClassField_localNormOpenSubgroup`.
- **Overlap check:**
  - Read: LocalAnabelianGeometry, ArithmeticGaloisDuality, QuadraticFormInvariants, IdelicReciprocityCountsAndCyclotomicClassGroups and GlobalNumberFields (open), and LocalGaloisGroups, FilteredLocalGaloisGroups and FunctionFieldArithmetic (main).
  - Shared: one object only. FunctionFieldArithmetic §4.2 extends the Layer 8 correspondence to `p`-primary subgroups in characteristic `p`, and owns that extension. The Galois insertion in characteristic zero and in the prime-to-`p` range is owned here. Nothing else is shared.
- **Automatic checks:**
  - The worker's: all passed.
  - Gate rerun: every check 0 except `outside-folder=29`. All 29 files are in the fifteen other folders the pull request names. `git diff --stat` excluding them is empty, and `lake-manifest.json` and `lean-toolchain` are unchanged.
  - Dependency check, verbatim: `depcheck: 122 roadmaps, 1406 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean` gives eight ``declaration uses `sorry` `` warnings, at lines 84, 100, 133, 147, 157, 170, 181 and 195, and nothing else.
- **Signatures:** the elaborated signatures of the two new theorems carry every binder explicitly (`CharZero K` included) and match the README's generality.
- **One-tactic probe:**
  - 7 attempts. `simp`, `aesop`, `rfl`, `apply localClassField_unique`, and `exact` with `localNormSubgroup_le_iff_of_isAbelian` alone all fail.
  - The `exact` of C03 closes the closure equation, and three lines close the connection.

Source independence: 4 changed passages (the 8.1 paragraph with its Check, the two theorem docstrings, the module-docstring bullet) compared with 1 source, milne-cft (I Corollaries 1.2 and 1.5, III Theorems 3.5 and 5.1); none shared; changed passages only. The largest share of the README's locators is milne-cft, about 24 of 71 source mentions. Contents were not compared, since no layer is added, removed or reordered.

Research link: local and global class field theory in the cohomological form of Artin–Tate (2009) and Milne's notes, with local Tate duality and Euler characteristics (Milne 2006; Neukirch–Schmidt–Wingberg 2008), the inputs that LocalGaloisGroups and FunctionFieldArithmetic consume; this rests on the README's overview and References.

## Not verifiable

- None for the change. The 8.1 paragraph's mathematics was checked against milne-cft and the pinned Tau Ceti.
- The uncertified and waived locators elsewhere in the README (serre-local-fields, neukirch-ant, nsw, artin-tate) are settled in the manifest and are untouched by this change.

## Source issues

- none

## For the human reviewers

- none
