# GATE-QuaternionicAnalysis~1 — reply to human review

## H01 (roed-math) — applied

`TauCetiRoadmap/QuaternionicAnalysis/README.md` line 115 now reads `MeasureTheory.ContinuousOn.hasBoxIntegral` (old: `BoxIntegral.ContinuousOn.hasBoxIntegral`); the correction was already in the head under review (`7cccb1d`). At the pinned Mathlib, `Mathlib/Analysis/BoxIntegral/Integrability.lean` closes `namespace BoxIntegral` at line 165, opens `namespace MeasureTheory` at line 167, and declares `ContinuousOn.hasBoxIntegral` at line 305. `Box.coe_ae_eq_Icc` exists at `Mathlib/Analysis/BoxIntegral/Partition/Measure.lean:70`.

## H02 (roed-math) — applied

README line 137 now reads `Real.map_linearMap_volume_pi_eq_smul_volume_pi` (old: `Measure.map_linearMap_volume_pi_eq_smul_volume_pi`); this was also already in the head `7cccb1d`. It is declared inside `namespace Real` at `Mathlib/MeasureTheory/Measure/Lebesgue/Basic.lean:429`. `integral_map` (`Mathlib/MeasureTheory/Integral/Bochner/Basic.lean:1076`) and `setIntegral_map` (`.../Bochner/Set.lean:554`) are also present at the pin.

## H03 (roed-math) — answered

The review's verdict (no `C¹` hypothesis and no wider scope) matches the roadmap, so this point needs no edit. The quotient-rule side conditions in `Suggested.lean` were recomputed and are both necessary and sufficient. Left product: `D(fg)(h) = h·b_f·g + f·h·b_g`, which equals `h·(b_f g + f b_g)` for all `h` iff `(f h − h f)·b_g = 0` for all `h`, i.e. `b_g = 0` or `f(q)` is real. Right inverse: `−f⁻¹(a_f h)f⁻¹ = −(f⁻¹a_f f⁻¹)h` for all `h` iff `a_f = 0` or `f(q)` is real. Composition: `(h·b_g)·b_f = h·(b_g b_f)`. Simultaneous slopes: at `h = 1` we get `a = b`, and `h·b = b·h` for all `h` forces `b` to be real.

## Pattern repair (same defect class: library references checked at the pins)

Every library declaration named in the README was checked at the pinned Mathlib and Tau Ceti:

- **Found where cited:** `Quaternion.re_mul`/`imK_mul` (`Mathlib/Algebra/Quaternion.lean:823`, `:835`), `QuaternionAlgebra.linearEquivTuple` (`:506`), `Quaternion.linearIsometryEquivTuple` (`Mathlib/Analysis/Quaternion.lean:158`), `PiLp.volume_preserving_toLp`, `MeasureTheory.integral_divergence_of_hasFDerivAt_off_countable`, `ModelWithCorners.ofConvexRange`, `hasFDerivAt_of_restrictScalars`, `hasFDerivAt_integral_of_dominated_of_fderiv_le`, `iteratedFDeriv_succ_eq_comp_left`, `integral_fun_norm_addHaar`, `InnerProductSpace.volume_ball_of_dim_even`, and Tau Ceti `_root_.DifferentiableOn.analyticOnNhd_of_finiteDimensional` (`TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean:275`).
- **On main:** DifferentialGeometry §5.2 `integralTopForm` and `integralTopForm_of_tsupport_subset_chart`.
- **One defect, fixed (README line 12):** the README listed `star_mk` among the "missing" constructor identities to be built in the shape of an upstream Mathlib pull request. In fact `QuaternionAlgebra.star_mk` exists at the pin (`Mathlib/Algebra/Quaternion.lean:598`, value `⟨a₁ + c₂a₂, −a₂, −a₃, −a₄⟩`; for `ℍ`, `c₂ = 0`). Only the constructor multiplication formula is missing for quaternions; there is no quaternion `mk_mul_mk` at the pin. The sentence now cites `QuaternionAlgebra.star_mk` and says `mk_mul_mk` is proved locally. This also removes the pull-request link, which the gate flagged (`prnum`).

## Gate repairs in Suggested.lean

The gate refused the four imports (`Mathlib.Analysis.Quaternion`, `Mathlib.Analysis.Calculus.FDeriv.Basic`, `Mathlib.Analysis.Analytic.Basic`, `TauCeti.Analysis.Complex.CauchyIntegralPolydisc`). They are replaced by the single line `import Mathlib`. No declaration in the file uses the Tau Ceti module; the README still names it as the input for the Milestone 3 bridge. No statement changed.

**Not changed (form, outside the reviewed points):** the file does not yet follow the house form:
- namespace `QuaternionicAnalysisPrototype` rather than `TauCetiRoadmap.QuaternionicAnalysis`;
- the module comment is not a "target signatures" docstring;
- some definitions have no docstring;
- the two `rfl` `@[simp]` lemmas `rightMulCLM_apply` and `leftMulCLM_apply` are padding.

The gate does not flag any of these. They are left for a format pass so this reply stays within the reviewed points.

## Adversarial pass on changed statements

| statement | instances tried | values | result | change |
|---|---|---|---|---|
| `QuaternionAlgebra.star_mk` claim (README l.12) | `ℍ` (`c₁=c₂... = −1,0,−1`), `⟨1,2,3,4⟩` | pin: `⟨1 + 0·2, −2, −3, −4⟩ = ⟨1,−2,−3,−4⟩` | the conjugation description is true for `ℍ` only, so it is scoped "for `ℍ`, where `c₂=0`" | wording scoped |
| `mk_mul_mk` "absent at pin" | grep at pin for `mk_mul_mk` | hits only in `GradedMonoid`, `Associates`, `FreeSemigroup` | absent for quaternions | kept as local target |
| imports → `import Mathlib` | rebuild | 11 `sorry` warnings, same as before | same statements elaborate | none |

## Build

`lake build TauCetiRoadmap.QuaternionicAnalysis.Suggested`: `Build completed successfully (8976 jobs)`, with 11 `declaration uses 'sorry'` warnings and no errors.

## Gate

`gate QuaternionicAnalysis: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`

The only remaining item is `depcheck: NOT IN ORDER: QuaternionicAnalysis (insert it after its last supplier)`. The roadmap is not yet in the merge order, which the brief says is not a defect before intake. Depcheck output (`--movable`):

```
NOT IN ORDER: QuaternionicAnalysis (insert it after its last supplier)
depcheck: 148 roadmaps, 1002 edges, 1 problem(s)
```

There are no UPWARD or CYCLE lines.

Commit: `QuaternionicAnalysis: review repairs (import Mathlib only; cite pinned star_mk, drop upstream PR link)`. Not pushed. No new citations were added, so `sources.toml` and `needs-references.toml` were not touched. The `#check @name` signature comparison was not rerun because no signature changed.
