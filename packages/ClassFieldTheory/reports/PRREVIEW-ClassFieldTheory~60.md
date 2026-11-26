# Review of ClassFieldTheory (pull request #3170 at ae3c1ba)

**Verdict:** accepted

**Summary.** An incremental re-review of the 28 lines changed since `57376f9`: accepted, with no finding. The previous review raised no finding; of its four small corrections three are repaired (the overview, item 4 of "Owned here" and the acceptance-signature section now name the Layer 8 target, the 8.1 statement has a Milne locator that I checked at the text, and the two Layer 8 theorems are no longer listed as headlines), and the fourth is repaired in the files but not in the pull request's description. One small correction and two format notes remain, none blocking. Nothing is left for a human to decide.

## C01 — The description's general sentence on `Suggested.lean` still does not hold for this folder's prime-to-`p` form

The description says "Planned Prop-valued statements are declared with `sorry` in the folder's `Suggested.lean`" and names DynamicalDegreesOfRationalMaps as "the one exception". For ClassFieldTheory the prime-to-`p` Galois connection of 8.1 ("Prove the same in the prime-to-`p` scope", README line 1165) is a planned Prop-valued statement that `Suggested.lean` does not declare; the module docstring now says so itself ("The prime-to-`p` form of that target is stated in the README only", lines 64–65), and so does item 4 of "Owned here" (line 2093). The files are consistent; only the description is behind. Adding to the ClassFieldTheory bullet "(the characteristic-zero forms; the prime-to-`p` version is stated in the README only)" would make it right.

## N01 — The Layer 8 row of "From Tau Ceti" (README line 2337) still omits three names that 8.1 consumes

`LocalNormSubgroups`, `localNormOpenSubgroup` and `localNormSubgroup_le_iff_of_isAbelian` (all in `TauCeti/NumberTheory/ClassFieldTheory/LocalExistence/Correspondence.lean`, lines 79, 83 and 57 at the pin) appear in the 8.1 paragraph but not in the supplier row. Adding them keeps the contract exact.

## N02 — "`V` lies in the class field of `N`" (docstring of `localClassField_galoisConnection`, `Suggested.lean` line 147) reads, on fields, as the reverse inclusion

Wording such as "`V` lies in the layer subgroup `(localClassField N).1`, that is, the fixed field of `V` contains the class field of `N`" would remove the ambiguity.

<details><summary>What was checked</summary>

- **Scope:** incremental re-review of 28 changed lines since `57376f9` (README: the overview sentence, the 8.1 locator, the "Owned here" introduction and item 4, the paragraph after the acceptance-signature table; `Suggested.lean`: the module docstring). No Lean statement changed.
- **Automatic checks:** the worker's checks all passed at this head. My rerun reports every check clean except the one for files changed outside the folder; the dependency check reports no problem.
- **Build:** `Suggested.lean` elaborates with `sorry` warnings only.
- **Not re-checked:** untouched passages, and the uncertified and waived locators elsewhere in the README.

</details>

## Previous findings

- The previous report (of `57376f9`) had no finding (no R-numbered remark). Its small corrections and format notes at this head:
- C01 (lists of open theorems) — repaired: overview lines 46–48 "the local correspondence extends to every finite Galois L/K as a Galois insertion"; item 4 has "**Open target** (Layer 8)"; a paragraph after the signature table names both declarations.
- C02 (locator in 8.1) — repaired: "(Milne, *Class Field Theory*, I Corollaries 1.2(b) and 1.5, pp. 20 and 22, with III Theorem 3.5, p. 108)"; pages confirmed at the text.
- C03 (two theorems follow in a few lines) — repaired: docstring and README now say "they record the Layer 8 target rather than a headline theorem".
- C04 (prime-to-`p` form) — partly repaired: docstring says "stated in the README only"; the description is unchanged (C01 above).
- N01 — not repaired (N01 above). N02 — not repaired (N02 above).

## Verified sound

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Overview and 8.1, on fields: `L ⊇ K_N ↔ N_{L/K}(Lˣ) ⊆ N`, closure = largest abelian subextension (README 46–48, 1161–1165; cited by `localClassField_galoisConnection`, `localClassField_localNormOpenSubgroup`) | `K = ℚ₅`, `L = ℚ₅(ζ₃, 5^{1/3})` (group `S₃`, `E = ℚ₅(ζ₃)` unramified quadratic); `N = ⟨25⟩×ℤ₅ˣ`, `N = Kˣ`, `N = ⟨5⟩×U¹` | `Nm(Lˣ) = Nm(Eˣ) = ⟨25⟩×ℤ₅ˣ`, index 2. First `N`: `⊆` true, `K_N = E ⊆ L` true. `Kˣ`: true, true. `⟨5⟩×U¹` (class field `ℚ₅(ζ₅)`, degree 4 ramified): `2 ∈ Nm(Lˣ)`, `2 ∉ N` false; `ζ₅ ∉ L` false. Closure: `L ↦ E` | holds both directions | none |
| Direction of `GaloisConnection (localNormOpenSubgroup K) (fun N ↦ (localClassField N).1)` against the unchanged signature | `V ≤ V'`; `V = ⊤`, `N` of index 2 | lower adjoint monotone: larger `V`, smaller field, larger norm group. `Nm(⊤) = Kˣ ≤ N` false; `⊤ ≤ W_N` false (index 2). Reversed inclusion would give true/false | consistent | none |
| New locator: milne-cft I Cor. 1.2(b), Cor. 1.5; III Thm 3.5 | milne-cft lines 1209–1214, 1277, 4901 | Cor. 1.2 under running head "20"; Cor. 1.5 under running head "22"; Thm 3.5 (norm limitation, any finite `L/K`, `E` largest abelian) under "108" | pages 20, 22, 108 as cited | none |
| Docstring claim "Neither is at the pin" | grep of `TauCeti/` for both names; of `TauCeti/NumberTheory/ClassFieldTheory/` for `GaloisConnection`, `GaloisInsertion` | 0 hits each | true | none |

The rows for untouched statements stand as in the previous review, of `57376f9`.

- Source locators checked against the text: 3 (milne-cft lines 1209–1214, 1277, 4901, with their page heads at lines 1163, 1268, 4873).
- Library declarations opened at the pin: `LocalExistence/Correspondence.lean` lines 57, 68, 79, 83, 110, 116, 189; `LocalExistence/NormSubgroup.lean` line 208; `Formation/AbelianLayer.lean` lines 130, 161.
- Cross-roadmap citations: the change adds none; the resolver lists none missing.
- Overlap check: read LocalAnabelianGeometry, ArithmeticGaloisDuality, QuadraticFormInvariants, IdelicReciprocityCountsAndCyclotomicClassGroups, GlobalNumberFields (open), LocalGaloisGroups, FilteredLocalGaloisGroups, FunctionFieldArithmetic (main), as in the previous review; the change adds no object; the one shared object is unchanged: FunctionFieldArithmetic §4.2 owns the `p`-primary extension in characteristic `p`, this roadmap the insertion in characteristic zero and prime to `p`.
- Dependency check, verbatim: `depcheck: 113 roadmaps, 1307 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean` gives eight ``declaration uses `sorry` `` warnings (lines 88, 104, 137, 151, 161, 174, 185, 199) and nothing else. The elaborated signatures of the two Layer 8 theorems carry `[CharZero K]` and every binder explicitly, matching 8.1.
- Changes outside the folder: `git diff --stat` against the base, excluding this folder and the fifteen other folders the pull request names, is empty.
- Merge-base comparison: 0 headings removed, 0 layers removed or retitled, 0 Lean declarations removed.

Source independence: 3 changed passages (the overview sentence, the 8.1 locator sentence, the module-docstring paragraph) compared with 1 source, milne-cft (I Cor. 1.2, 1.5; III Thm 3.5); none shared; changed passages only. Largest share of locators milne-cft, about 24 of 71 source mentions, as in the previous review; contents not compared again, since no layer is added, removed or reordered.

Research link: local and global class field theory in the cohomological form of Artin–Tate (2009) and Milne's notes, with local Tate duality and Euler characteristics (Milne 2006; Neukirch–Schmidt–Wingberg 2008), the inputs that LocalGaloisGroups and FunctionFieldArithmetic consume; this rests on the README's overview and References.

## Not verifiable

- None for the change.
- The uncertified and waived locators elsewhere in the README (serre-local-fields, neukirch-ant, nsw, artin-tate) are settled in the manifest and untouched by this change.

Automatic checks set aside as false positives: my rerun of the check for files changed outside the roadmap folder lists 29 files, all inside the fifteen other roadmap folders this pull request also changes and which are its own; the check should exempt those folders, as the worker's own run did.

## Source issues

- none

## For the human reviewers

- none
