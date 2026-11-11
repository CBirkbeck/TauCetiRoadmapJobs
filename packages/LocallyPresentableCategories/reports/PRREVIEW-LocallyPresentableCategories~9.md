# Review of LocallyPresentableCategories (pull request #1926 at 9deea52)

**Verdict:** needs changes

## R01 (P3) — The description counts 19 headline theorems; the head states 27

**Location:** description, *Acceptance test*: "`Suggested.lean` states the 19 headline theorems with `sorry`." and "only `sorry` warnings (19). This build was run at the Mathlib and Tau Ceti pins of an earlier main, Mathlib `f6090c7`."

**Claim:** Both counts, and the build sentence, describe an earlier head. At `9deea52` the file states 27 sorried theorems and builds at the current pins.

**Witness:** `lake env lean` on `TauCetiRoadmap/LocallyPresentableCategories/Suggested.lean` at Mathlib `1b1ccf4`, Tau Ceti `2fd255d` gives 27 warnings, all "declaration uses `sorry`" (lines 106–423). The docstring's "Headline theorems stated here" names the same 27.

**Repair:** Change the description to read: "`Suggested.lean` states the 27 headline theorems with `sorry`." Replace the build bullet with: "`lake build TauCetiRoadmap.LocallyPresentableCategories.Suggested` at Mathlib `1b1ccf4` and Tau Ceti `2fd255d`: only `sorry` warnings (27)." Replace the 3.5/5.4 sentence with: "Not stated, as the file's docstring says: the syntactic essentially algebraic theories (3.5), sound doctrines (5.4), and the comparison in 5.5 between basic functors and generation."

## R02 (P3) — The layer bullets leave out 1.6–1.8, 4.4 and 5.5

**Location:** description, *Scope*: "**Layer 1.** Completeness …; finitely accessible = `Ind A`." "**Layer 4.** … and the recognition theorem (Lack–Rosický, Theorem 3.1)." "**Layer 5.** … and sound doctrines."

**Claim:** The bullets describe an earlier head. They leave out sections that hold 8 of the 27 headline theorems: 1.6 (two), 1.7 (two), 1.8, 4.4 (two) and 5.5.

**Witness:** README headings 1.6 (line 389), 1.7 (line 426), 1.8 (line 469), 4.4 (line 745) and 5.5 (line 901). The module docstring of `Suggested.lean` lists each of these as a headline.

**Repair:**
- Append to the Layer 1 bullet: "; `ModuleCat R` is locally finitely presentable, and its finitely presentable objects are the finitely presented modules (1.6); a small category is accessible iff its idempotents split, and directed unions of accessible full subcategories are accessible (1.7); `C` and `Cᵒᵖ` are both locally presentable iff `C` is equivalent to a small complete lattice (1.8)".
- Append to the Layer 4 bullet: "; initial algebras of endofunctors as colimits of the initial chain, and their existence for accessible endofunctors of locally presentable categories (4.4)".
- Append to the Layer 5 bullet: "; generation under `D`-limits, detected by fully faithful `D`-functors and, when the equalizer shape is among the `D a`, equivalent to presentation by envelopes, localisations and adjoined arrows (5.5)".

## R03 (P3) — The description names OrthogonalFactorization as an owner, but the README does not

**Location:** description, *Scope*: "Boundaries are set in the README's Scope by roadmap name and section. Orthogonal factorization systems and local objects for arbitrary classes stay with OrthogonalFactorization."

**Claim:** The head's Scope defers orthogonality of classes of morphisms without naming any roadmap. No file in the folder mentions OrthogonalFactorization.

**Witness:** README lines 77–80 say these "are not built here; this roadmap uses only Mathlib's `MorphismProperty.isLocal`". `grep OrthogonalFactorization` over `README.md` and `Suggested.lean` finds nothing.

**Repair:** Replace the sentence with: "Orthogonality of classes of morphisms, orthogonal factorization systems and local objects for an arbitrary class are not built here; only Mathlib's `MorphismProperty.isLocal` is used." In the ∞-categorical sentence, add "and the ∞-categorical `Ind_κ` with BordismFormalGroups §F6.5", as README line 86 says.

## R04 (P3) — The Sources list belongs to an earlier head

**Location:** description, *Sources*: only Kelly and Lack–Rosický are listed as read; "Adámek–Rosický … Corollary 1.28, Theorems 1.20, …". *Review*: "Corollary 1.28, Theorem 1.46, … were not checked against the text."

**Claim:** The head cites no Corollary 1.28. It also cites eight openly readable texts that the list leaves out.

**Witness:** `grep 1.28 README.md` finds nothing. README lines 31, 397–402, 429, 442, 541, 732 and 1009 cite Adámek 1974, Lazard, EGA IV₃, Tendas, Paré–Rosický, Wilson, Adámek–Rosický 2001 and Positselski–Šťovíček. The References (lines 1014–1059) list 19 works.

**Repair:** Replace the Sources list with the following, and delete "Corollary 1.28," from the Review paragraph.

> Read in open copies:
> - Kelly, TAC Reprints 10: Theorems 5.35, 6.5, 6.11 and 6.23, Propositions 6.13 and 6.21, Corollary 6.22.
> - Lack–Rosický, arXiv:0810.2578v2: §§3, 4.4 and 5.2, Theorems 3.1, 4.18, 5.2 and 5.4, Propositions 4.20 and 5.3, Lemma 4.19.
> - Adámek–Rosický, TAC 8 (2001): Theorem 3.10.
> - Adámek 1974 (dml.cz): p. 592.
> - Lazard 1969, Appendice, and EGA IV₃, Lemme 8.5.2.1 (both on Numdam).
> - Tendas, arXiv:2110.14192v2: Theorem 3.7.
> - Paré–Rosický, arXiv:1110.0767v1: Theorem 2.1, Example 2.2, Corollary 3.2.
> - Wilson, arXiv:1909.09333v1: Theorems 1.2 and 1.4.
> - Positselski–Šťovíček, arXiv:2101.10797v3: Question 9.10.
>
> Cited by locator only:
> - Adámek–Rosický 1994: Definitions 1.13 and 3.34, Theorems 1.20, 1.39, 1.46, 1.66, 2.26 and 3.36, Corollaries 1.40, 2.45 and 2.47.
> - Gabriel–Ulmer 1971: Satz 7.13.
> - Adámek–Borceux–Lack–Rosický 2002: Theorems 2.4 and 5.5.

## Previous findings

- None. The review of `c3ec7a6` raised no findings, and the folder at `9deea52` is identical to the one it read (`git diff c3ec7a6 9deea52 -- TauCetiRoadmap/LocallyPresentableCategories` is empty).

## Verified sound

Adversarial rows below use fresh instances, not those of the review of `c3ec7a6`. The folder has not changed, so the table checks headline statements that the description findings concern.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.5 `isFinitelyAccessibleCategory_iff_exists_ind` | `C = ω+1`, `A = ℕ`; `C = ℕ` | `Ind ℕ` ≌ `ω+1`; `n` compact, `∞ = sup n` not: both true. `ℕ` lacks colimit of `0→1→⋯`, `Ind A` has it: both false | sound | none |
| 1.6 `isFinitelyPresentable_moduleCat_iff` | `R = ℤ`: `M = ℤ/6`; `M = ℤ^(ℕ)` | `ℤ →·6 ℤ → ℤ/6`, `Hom(ℤ/6, −) = N[6]` commutes with filtered colimits: both true. `𝟙` of `colim ℤ^k` factors through no `ℤ^k`: both false | sound | none |
| 1.7 `isAccessibleCategory_iff_isIdempotentComplete` | poset `ℕ`; `Bℤ/2` | `ℕ` thin; ℵ₁-filtered diagrams have countable image attaining its maximum, so ℵ₁-accessible: both true. `Bℤ/2`: only idempotent `1`, filtered colimits exist: both true | sound | none |
| 1.7 same, negative | monoid `{1, e, f}`, `xy = x` for `x ≠ 1` | `e² = e`; splitting needs `rs = 1`, forcing `r = s = 1`, so `sr = 1 ≠ e`: both false | sound | none |
| 1.8 `isLocallyPresentable_and_op_iff` | `ω+1`; `ℕ`; `Bℤ/2` | `ω+1`, `(ω+1)ᵒᵖ`: countable complete lattices, objects ℵ₁-presentable: both true. `ℕ` lacks a top: both false. `Bℤ/2` lacks `∗⊔∗` (4 ≠ 2 maps): both false | sound | none |
| 4.4 `exists_isInitial_algebra_colimit_initialChain` | `F X = 1 ⊔ 2 × X`; `X^ℕ`; `1 ⊔ X^ℕ` | sizes `0, 1, 3, 7`, colimit `List (Fin 2)`, `[nil, cons]` initial; chain `∅`, `(∅, id)` initial; `1 ⊔ X^ℕ`: hypothesis fails (height-ω tree) | sound | none |
| 4.4 `hasInitial_algebra_of_isAccessible` | `F X = 1 ⊔ X^ℕ`; finite powerset | `ℕ` is ℵ₁-presentable (Type.lean:126), so `F` is ℵ₁-accessible: well-founded countably branching trees, reached at `ω₁`; `P_fin` finitary: initial algebra `V_ω` | sound | none |
| 5.2 `envelope_universal` | `D () = WalkingCospan`: `I = PUnit`; `I = Discrete (Fin 2)` | `1 ⊔_1 1 = 1` in `(Type w)ᵒᵖ`, `Ĩ ≌ PUnit`, restriction `C ≌ C`; `Hom((1,0),(0,1)) = ∅`, so `Ĩ ≌ I` | sound | none |

The rows for the other statements stand as in the previous review, of `c3ec7a6`: the folder and the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, `lake-manifest.json` unchanged) are the same.

- **Change.** 0 lines in the folder. The head merges main. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Gate.** Rerun on `9deea52`: every check 0, `OK`. The worker's gate also reports `build=0`. `lake env lean` on `Suggested.lean` exits 0 with 27 warnings, all `sorry`, and no error. Since the file and pins are unchanged, the one-tactic probe and the `#check @name` comparison of `c3ec7a6` still hold.
- **Dependency check.** `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`. The roadmap is line 408 of the merge-order candidate and has no supplier roadmap (README line 196).
- **Cross-roadmap citations, resolved again (11).**
  - On main `b7bdbfd`: EnhancedDerivedSheaves §E0.8 (line 376) and Layer E5:presentability (line 1593); BordismFormalGroups §F6.5 (line 1526, with `Ind_κ` inside it).
  - HigherToposTheory at `2176cc4`: F1.1, F1.3, F1.6 and L7 (lines 269, 372, 520, 5763).
  - GrothendieckTopoi at `6b3158d`: Layers 1 and 2 and §1.4 (lines 285, 402, 357).
  - ClassifyingTopoi at `81c4460` consumes 1.5, 3.1 and 3.5 (lines 225, 971–979).
- **Overlap check.** Read HigherToposTheory, ClassifyingTopoi, OrthogonalFactorization, HomotopyTheoryOfCategories, CommRingFactorizationSystems and EnhancedDerivedSheaves; nothing is shared. HigherToposTheory F1.1 owns Lurie's characterisation, which is deferred here. ClassifyingTopoi is a consumer. OrthogonalFactorization uses Mathlib's presentability for the small object argument only. `roadmaps grep` for Gabriel–Ulmer, `IsCardinalLocallyPresentable`, `IsAccessibleCategory`, essentially algebraic theories, "locally finitely presentable" and sound doctrines finds no second owner. `overlaps.md` reports no dropped or revision-only id.
- **Sources re-read for the rows (2).** tendas-2022 line 365 (Theorem 3.7: a small category is accessible iff Cauchy complete, which at `V = Set` means idempotents split). adamek-1974 lines 105–123 (the transfinite chain `W_{i+1} = A ⊔ F W_i`, and its Proposition).
- **Remark (untouched text).** The docstring of `exists_localization` (`Suggested.lean` line 405) says "for a small `R` with `D`-limits", but README 5.3 (line 852) and the signature require none.

## Not verifiable

- Adámek–Rosický 1994, Gabriel–Ulmer 1971, Adámek–Borceux–Lack–Rosický 2002, Adámek–Rosický–Trnková 1988, Rosický–Trnková–Adámek 1990, Grothendieck 1957, Makkai–Paré 1989, Kelly 1982 and Lack–Power 2009: paywalled or not in the cache, as in the review of `c3ec7a6`. Not re-fetched, since no locator changed.

## Source issues

- none
