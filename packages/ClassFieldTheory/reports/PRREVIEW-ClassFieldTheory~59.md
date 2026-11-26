# Review of ClassFieldTheory (pull request #3170 at 4aaba98)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 40 changed lines since `87e7f72`. The change adds the norm-subgroup Galois insertion and its closure equation to 8.1 and states both in `Suggested.lean`; I checked the new paragraph, its Check, the two theorems and the README passages they affect against the pinned Tau Ceti, the build, the dependency check, ownership against the neighbouring roadmaps and the pull request's text. The Galois connection, the insertion, the closure operator `V ↦ V.maximalAbelianLayer` and the `S₃` Check are correct, and there is no finding. Four small corrections and two format notes remain, none blocking; the folder has not changed since the previous review, so they are the same ones. Nothing is left for a human to decide.

## C01 — Three README passages that list the open theorems do not include the new Layer 8 target

A reader of the overview or of Scope and ownership would conclude that Layer 8 is entirely Tau Ceti's and that the open theorems are only those of Layers 7 and 13. The overview (lines 43–47) lists the open theorems and ends "The last open theorem removes Tau Ceti's hypothesis on valuations". Item 4 of "Owned here" (line 2087) ends "(Layer 8): Tau Ceti's." The table under "Headline acceptance signatures" (lines 2405–2413) has no row for `localClassField_galoisConnection` or `localClassField_localNormOpenSubgroup`, although the module docstring of `Suggested.lean` does list the pair.

The repair is one sentence in the overview, a clause in item 4 ("open target: the norm-subgroup Galois insertion and its closure operator, in characteristic zero and in the prime-to-`p` range"), and one row in the table.

## C02 — The new statement in 8.1 has no source locator

Every other theorem of 8.1 carries a locator, so a reader cannot tell where this one is proved. It combines two results of Milne's *Class Field Theory*: the order statement of the abelian correspondence, I Corollary 1.2(b), p. 20, as extended to open subgroups of finite index by Corollary 1.5, p. 22 (milne-cft lines 1209–1214 and 1277), and the norm limitation theorem for every finite extension, III Theorem 3.5, p. 108 (milne-cft line 4901). Adding "(Milne, *Class Field Theory*, I Corollaries 1.2(b) and 1.5, pp. 20 and 22, with III Theorem 3.5, p. 108)" after the sentence on fields would cover both the connection and the closure equation.

## C03 — Both new theorems in `Suggested.lean` follow from pinned lemmas in one to three lines

As acceptance tests they ask an implementer for little. On a scratch copy elaborated against the pins, the closure equation `localClassField_localNormOpenSubgroup` is closed by the single term `localClassField_unique (localClassField _).2 V.isAbelianClassFieldLayer_maximalAbelianLayer (by simp [localNormSubgroup_maximalAbelianLayer])`, and `localClassField_galoisConnection` by `intro V N`, one `rw` with `localNormSubgroup_le_iff_of_isAbelian` and `localClassField_normSubgroup`, then `rfl`; the `GaloisInsertion` itself needs three more lines. This is the README's own route.

If the author keeps them as the formal record of the new 8.1 target, the module docstring would be more accurate listing them as the structured form of the pinned correspondence rather than among "the open headline theorems"; or they can be marked as sanity checks.

## C04 — A description sentence does not hold for this folder's prime-to-`p` form

The description says "Planned Prop-valued statements are declared with `sorry` in the folder's `Suggested.lean`". Paragraph 8.1 also plans the prime-to-`p` connection ("Prove the same in the prime-to-`p` scope"), which is a Prop and statable at the pins: for `N : LocalNormSubgroupsPrimeTo K p`, the statement `localNormOpenSubgroup K V ≤ N.1 ↔ V ≤ (localClassFieldPrimeToResidueCharacteristic p N).1.1` elaborates on a scratch copy (and follows from pinned lemmas in two lines). `Suggested.lean` neither states it nor says that it is left out.

Either add that statement, or amend the description to "… (for ClassFieldTheory, the characteristic-zero forms only) …" and say the same in the module docstring.

## N01 — The Layer 8 row of "From Tau Ceti" (line 2330) omits three names the new paragraph consumes

`LocalNormSubgroups`, `localNormOpenSubgroup` and `localNormSubgroup_le_iff_of_isAbelian` (all in `TauCeti/NumberTheory/ClassFieldTheory/LocalExistence/Correspondence.lean`) would keep the supplier contract exact.

## N02 — "`V` lies in the class field of `N`" (docstring of `localClassField_galoisConnection`, `Suggested.lean` line 145) reads, on fields, as the reverse inclusion

The README warns about exactly this direction (line 2430). "`V` lies in the layer subgroup `(localClassField N).1`, that is, the fixed field of `V` contains the class field of `N`" would remove the ambiguity.

<details><summary>What was checked</summary>

- **Previous findings:** the previous review of this folder raised none. Its four small corrections and two format notes concern text that is the same at this head (the folder did not change between the two heads), so they are restated above; the page of Corollary 1.5 in C02 is corrected to p. 22.
- **Automatic checks:** the worker's checks all passed. My rerun reports only the files of the fifteen other roadmap folders this pull request changes, which are the pull request's own; nothing else outside the folder changed. The dependency check reports no problem.
- **Build:** `Suggested.lean` elaborates with `sorry` warnings only.
- **Not re-checked:** the uncertified and waived locators elsewhere in the README lie in untouched text.

</details>

## Verified sound

Adversarial table: the statements the diff adds and the passages the corrections touch.

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `localClassField_galoisConnection`: `N(V) ≤ N ↔ V ≤ (localClassField N).1` (README 1155–1157, Lean 147) | `V = ⊤`; `ℚ₅`, `V` cutting out `ℚ₅(ζ₃, 5^{1/3})`, `N = N(V)` and `N = N(ℚ₅(√5))` | `⊤`: both sides hold iff `N = Kˣ`. `N = N(V)`: true, true. `N(ℚ₅(√5))`: `(2,5)₅ = −1` so unit 2 ∉ N, false; `√5 ∉ L`, false | holds | C03, N02 |
| the same with the inclusion reversed (wrong model) | `V = ⊤`, `N` of index 2 | `N ≤ Kˣ` true; `⊤ ≤ W_N` false | excluded by the stated law | none |
| insertion `N(localClassField N) = N` | `ℚ_p`, `p` odd, `N = ⟨p⟩×U¹` | index `p−1`, class field `ℚ_p(ζ_p)`, norm group `N` again; `le_l_u` proved on scratch from `localClassField_normSubgroup` | insertion on the `N` side | none |
| `localClassField_localNormOpenSubgroup` (README 1159–1161, Lean 157) | `V = ⊤`; abelian `ℚ₉/ℚ₃`; `S₃` layer over `ℚ₂` | `⊤ ↦ Kˣ ↦ ⊤`. Abelian: `V = V.maxAb`. `S₃`: `N(V)` has index 2 = `[ℚ₂(ζ₃):ℚ₂]`; wrong model "`= V`" would need index 6 | holds | C03 |
| the 8.1 Check: `p ≡ 2 mod 3`, `V < V.maxAb`, which cuts out `ℚ_p(ζ₃)` (README 1165–1167) | `p = 2`, `5`; control `p = 7` | `p=2`: `X²+X+1` irreducible mod 2, `X³−2` Eisenstein, degree 6, `[S₃,S₃] = A₃`. `p=5`: `3 ∤ 4`. `p=7`: `ζ₃ ∈ ℚ₇`, cyclic cubic, `V = V.maxAb` | true; hypothesis needed | none |
| on fields: `L ⊇ K_N ↔ N_{L/K}(Lˣ) ≤ N` (README 1158–1159) | `L = ℚ₂(ζ₃, 2^{1/3})`; `N = N(ℚ₂(ζ₃))`, `N = N(ℚ₂(i))` | first: `N_L = ⟨4⟩×ℤ₂ˣ = N`, both true. Second: `(−1,−1)₂ = −1`, `−1 ∉ N`; `i ∉ L`: both false | holds | C02 |
| prime-to-`p` form (README 1161–1162) | `𝔽₃((t))`, unramified quadratic `V`, `N = N(V)`; index of `N(V)` | index 2, coprime to 3, both sides true; `[Kˣ:N(V)] = deg V.maxAb` divides `deg V`, so the map lands in the prime-to-`p` carrier | holds; statable at the pins | C04 |
| 8.1 existence locator, Milne CFT III Thm 5.1, p. 115 (README 1106) | milne-cft line 5186 | Theorem 5.1 on printed p. 115 (PDF p. 124); proved there in characteristic zero only (line 5188), as the README says | matches | none |

- **Source locators checked:** 4, all in milne-cft: line 5186 (III Theorem 5.1, p. 115), lines 1209–1214 (I Corollary 1.2, p. 20), line 1277 (I Corollary 1.5, p. 22), line 4901 (III Theorem 3.5, p. 108).
- **Library declarations opened at the pin (Tau Ceti `2fd255d`):** `LocalExistence/Correspondence.lean` lines 57, 68, 79, 83, 93, 102, 110, 116, 122, 189, 199, 210, 217, 224; `LocalExistence/NormSubgroup.lean` lines 190, 199, 208; `Formation/AbelianLayer.lean` lines 80, 130. No `GaloisConnection`, `GaloisInsertion` or `ClosureOperator` occurs under `TauCeti/NumberTheory/ClassFieldTheory/`, so nothing at the pin duplicates the new targets.
- **Cross-roadmap search:** `localNormOpenSubgroup` and `maximalAbelianLayer` occur in no roadmap but this one, on main or at an open head; the only other "Galois insertion" is Forcing's on `Heyting.Regular`; HigherLocalClassFieldTheory's norm limitation is on topological Milnor K-groups of higher local fields, another object.
- **Overlap check:** read LocalAnabelianGeometry, ArithmeticGaloisDuality, QuadraticFormInvariants, IdelicReciprocityCountsAndCyclotomicClassGroups, GlobalNumberFields (open) and LocalGaloisGroups, FilteredLocalGaloisGroups, FunctionFieldArithmetic (main). One shared object: the local correspondence, whose `p`-primary equal-characteristic extension FunctionFieldArithmetic §4.2 owns; the insertion in characteristic zero and in the prime-to-`p` range is owned here. Nothing else shared.
- **Automatic checks:** the worker's all passed; my rerun has every count 0 except the 29 files of the fifteen other folders the pull request names, and the diff outside those folders is empty. Dependency check, verbatim: `depcheck: 115 roadmaps, 1329 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** eight ``declaration uses `sorry` `` warnings (lines 84, 100, 133, 147, 157, 170, 181, 195), nothing else. The elaborated types of the two new theorems carry every binder (`CharZero K` included) and match the README's generality.
- **One-tactic probe:** `simp` on each new theorem makes no progress and `rfl` fails on the closure equation; the terms of C03 close both; the prime-to-`p` iff of C04 elaborates and is closed in two lines.
- **Record:** 0 layers or items removed, renumbered or retitled against the README at the merge base; the change is 40 insertions.

Source independence: 4 changed passages (the 8.1 paragraph with its Check, the two theorem docstrings, the module-docstring bullet) compared with 1 source, milne-cft (I Corollaries 1.2 and 1.5, III Theorems 3.5 and 5.1); none shared; changed passages only. Contents not compared: no layer is added, removed or reordered.

Research link: local and global class field theory in the cohomological form of Artin–Tate (2009) and Milne's notes, with local Tate duality and Euler characteristics (Milne 2006; Neukirch–Schmidt–Wingberg 2008), which LocalGaloisGroups and FunctionFieldArithmetic consume; rests on the README's overview and References.

## Not verifiable

- None for the change: the 8.1 paragraph was checked against milne-cft and the pinned Tau Ceti.
- The uncertified and waived locators elsewhere in the README (serre-local-fields, neukirch-ant, nsw, artin-tate) are settled in the manifest and untouched by this change.

## Source issues

- none

## For the human reviewers

- none
