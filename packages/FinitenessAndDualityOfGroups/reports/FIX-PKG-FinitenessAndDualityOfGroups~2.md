# FIX-PKG-FinitenessAndDualityOfGroups~2

Repair round on the findings of `REV-PKG-FinitenessAndDualityOfGroups` (one review, four findings).
Files changed: `packages/FinitenessAndDualityOfGroups/Suggested.lean` (two docstrings, one new
headline theorem, module docstring) and `packages/FinitenessAndDualityOfGroups/README.md` (§7.4,
one sentence). `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## F01 (P1) — applied

Right: `finrank` is `0` on infinite-dimensional groups, so `FreeGroup ℕ` (dims `1, ∞, 0, …`) gets
`1`. `Suggested.lean`, `rationalEulerChar` docstring. Old: "otherwise the finite sum is `0` by
convention". New: `Module.finrank` assigns `0` to each infinite-dimensional term, `finsum` assigns
`0` for infinite support; the countable-rank free group gets `1`. README Conventions already correct.

## F02 (P2) — applied

Right: `TauCeti.Huber.IsPseudoCoherentOver` requires exactness at `M, F₀, …, F_{m−1}` only.
`Suggested.lean`, `IsOfTypeFPn` docstring. Old: "exact in degrees `≤ n`". New: partial resolution
`F_n → ⋯ → F_0 → R → 0`, exact at `R` and `F_i` for `i < n`; `FP_0` is finite generation (every
group), `FP_1` finite presentation, `FP_∞` exact everywhere. README §§1.2–1.3 already correct.

## F03 (P2) — applied

Right: the summary promises the mod-`p` form; only 7.3(b) was stated. Added
`exists_linearEquiv_tensorZMod` (finite `G`, finitely generated projective `P`, prime `p`:
`∃ m, m·|G| = rank_ℤ P` and `P ⊗ 𝔽_p ≅ ℤG^m ⊗ 𝔽_p` over `ℤG`), its module-docstring entry, and a
README §7.4 sentence naming it and equating `ℤG`- with `𝔽_pG`-linearity (Brown1974 lines 1311–1320).

## F04 (P3) — disputed

The roadmap exists as a board package on the board's main branch,
`packages/MotivicStructuresInModuliOfCurves/README.md`, listed in `merge-order/ORDER.txt` (line 350,
after this roadmap at 319). Its §2.1 (line 337), "The virtual cohomological dimension", proves
rational vanishing above Harer's bound through a torsion-free finite-index subgroup: an instance of
4.1 and 4.3. `roadmaps show` does not search board packages.

## Checks run

- **Pinned evidence for F01 and F02.** `Module.finrank_of_not_finite`
  (`Mathlib/LinearAlgebra/Dimension/Free.lean` line 276); `HomologicalComplex.homologyEulerChar`
  (`Mathlib/Algebra/Homology/EulerCharacteristic.lean` line 154), whose `finsum` and `finrank`
  conventions the new docstring names; `TauCeti.Huber.IsPseudoCoherentOver`
  (`TauCeti/Algebra/Module/PseudoCoherent/Basic.lean` line 89: exactness at `F₀` only when `1 ≤ m`,
  at `F_{i+1}` only when `i + 2 ≤ m`) and its `zero_iff` (line 133).

- **Elaboration.** `lake env lean packages/FinitenessAndDualityOfGroups/Suggested.lean` from the
  content checkout: exit 0, no errors, 14 warnings, all `declaration uses 'sorry'` (the 13 previous
  theorems and `exists_linearEquiv_tensorZMod`). No `TauCeti.*` object file needed building.
- **Binders.** A scratch copy of the file with `#check @name` for all 23 declarations elaborated.
  The 22 old signatures are unchanged (only docstrings changed). The new one elaborates to
  `∀ {G : Type} [Group G] [Finite G] (P : Type) [AddCommGroup P] [Module (MonoidAlgebra ℤ G) P]
  [Module.Finite (MonoidAlgebra ℤ G) P] [Module.Projective (MonoidAlgebra ℤ G) P] (p : ℕ)
  [Fact (Nat.Prime p)], ∃ m, m * Nat.card G = Module.finrank ℤ P ∧ Nonempty (P ⊗[ℤ] ZMod p ≃ₗ[MonoidAlgebra ℤ G]
  (Fin m → MonoidAlgebra ℤ G) ⊗[ℤ] ZMod p)`, every binder of README §7.4 present; nothing changed.
- **One-tactic probe.** The new statement in a scratch file with
  `first | simp | rfl | infer_instance | trivial` fails; the pins contain no integral Swan theorem
  (Tau Ceti's `TauCeti.nonempty_linearEquiv_of_projective_of_tensorRat`,
  `TauCeti/NumberTheory/Padics/GroupAlgebra/Swan.lean` line 58, is over `ℤ_[p]` and assumes an
  isomorphism of rationalizations; no `MonoidAlgebra ℤ G` projective-module theorem exists under
  `TauCeti/NumberTheory/Padics/GroupAlgebra/`).
- **README and Lean agree.** All 23 Lean names occur in backticks in the README; the README names no
  other declaration of this roadmap's own.
- **Dependency check** (the prescribed `gate --depcheck … --movable`):

      depcheck: 245 roadmaps, 2214 edges, 0 problem(s)

  No UPWARD, CYCLE or moved line.
- **Ownership.** `roadmaps grep -i "swan's theorem"` (main and the open heads) and a search of the
  board packages find no other owner of the integral Swan theorem for projective `ℤG`-modules
  (CohomologyOfGroups and K3BlochGroups cite Swan's periodicity theorem, a different result;
  NoncommutativeAndEquivariantIwasawa's lattice lemma concerns `G₀` of `𝒪[Δ]`). §7.4 stays owned
  here. `roadmaps grep --fixed exists_linearEquiv_tensorZMod`: no match elsewhere.
- **Sources.** No new source. The §7.4 locator (Brown1974 lines 1311–1320) was re-read and is
  already in the manifest's Brown1974 entry.

## Adversarial pass on the changed and added statements

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| `rationalEulerChar` (docstring) | `G = 1`; `ℤ`; `F₂`; `ℤ/2`; `FreeGroup ℕ` | finranks `1`; `1,1` → `0`; `1,2` → `−1`; `1,0,…` → `1`; `1, 0 (dim ∞), 0,…` → `1` | Old docstring predicted `0` for `FreeGroup ℕ`; new one predicts `1`, as the body gives. README Conventions (`χ = 0` for the countable-rank free group from `1/1 ≠ 1/2`) consistent. |
| `IsOfTypeFPn`, `n = 0` | additive `ℚ` over `ℤ`; any `G` over `R = 0` | `R` is cyclic, so `zero_iff` holds; old wording also demanded exactness at `F_0`, i.e. finite presentation, false for `ℚ` (augmentation ideal not finitely generated) | New wording: `FP_0` true for `ℚ` and every group, matching the body. |
| `IsOfTypeFPn`, `n = 1` | `ℚ`; `ℤ` | `ℚ`: finite presentation fails; `ℤ`: `0 → ℤ[ℤ] →(t−1) ℤ[ℤ] → ℤ → 0` gives it | Matches `one_iff` and README 1.2 Checks. |
| `IsOfTypeFPn`, `n = ⊤` | `ℤ/2` over `ℤ` | `ℤ[ℤ/2]` noetherian, so pseudocoherent | Exact everywhere, as the new wording says. |
| `exists_linearEquiv_tensorZMod` | `G = 1`, `P = ℤ^r`, any `p` | `m = r`, `r·1 = r`, `𝔽_p^r ≅ 𝔽_p^r` | Holds. |
| same | `G = ℤ/2`, `P = ℤG`, `p = 2`; `G = ℤ/3`, `P = ℤG`, `p = 3` | `m = 1`, `rank 2 = 1·2`; `3 = 1·3`; reductions are `𝔽₂G`, `𝔽₃G` | Holds (identity). |
| same | `G = S₃`, `P = (ℤS₃)²`, `p = 2, 3` | rank `12 = 2·6`, `m = 2` | Holds. |
| same | `P = 0` | `m = 0`, `0 = 0·|G|`, both sides `0` | Holds. |
| same, projectivity dropped | trivial `ℤ` over `ℤ/p` | rank `1`, `m·p = 1` has no solution | Conclusion fails, so `Module.Projective` is needed (README §7.4 Check). |
| same, `p` junk values | `p = 0`; `p = 1`; `p = 6` | `ZMod 0 = ℤ`: the conclusion would claim that `P` is free, more than Swan's theorem gives (local freeness only); `ZMod 1 = 0`: trivially true; `p = 6`: true by the Chinese remainder theorem from the `ℤ_(2)` and `ℤ_(3)` forms | `[Fact p.Prime]` excludes `0` and `1`. It is stronger than `p ≠ 0`, but it matches README §7.4 and the source (P3 note, no change). |
| same, linearity | `ℤG`- versus `𝔽_pG`-linear | `ℤG → 𝔽_pG` is onto and `p` kills both sides, so the two notions of linear map agree | Statement means the README's `𝔽_p G`-isomorphism. |
| same, uniqueness of `m` | finite `G` | `|G| ≥ 1`, so `m = rank_ℤ P / |G|`, the `m` of 7.3 | Consistent with `exists_linearEquiv_tensorRat`. |
| README §7.4 added sentence | as above | as above | No Check of §7.3–7.5 contradicted; §7.5 still uses 7.4 for characteristic `p`. |

## Notes for the maintainer

- New Lean name in this roadmap: `exists_linearEquiv_tensorZMod` (namespace
  `TauCetiRoadmap.FinitenessAndDualityOfGroups`). No name was renamed or removed, and no section id
  changed.
- F04 is disputed. The citation names a board package that is on the board's main branch and later
  in the merge order, not yet a roadmap pull request. If it is renumbered before it opens, the
  downstream bullet needs updating; it is not a supplier edge.
- Ownership against open pull requests was checked with the roadmap index (main and the open heads)
  for the one object added to the acceptance test.
- No suspicious instructions were found in the review text.
