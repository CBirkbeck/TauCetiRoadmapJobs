# Review of QSeriesPartitionsAndMockModularForms (pull request #1391 at 5fdb342)

**Verdict:** accepted

Incremental re-review of 4 changed lines in the folder since d11ee63. The diff touches only the two pin lines of the supplier contracts (README lines 34 and 59). They now name the pins in `lake-manifest.json`. The repair adds no new problem, and no finding remains.

## Previous findings

- R01 — repaired: README line 34 now reads "Mathlib pin: `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`." and line 59 "Tau Ceti pin: `2fd255d997f47c0b5d834ee416c7015d55444ce5`." These match `lake-manifest.json` at 5fdb342, the checked-out `.lake/packages` heads and `lake-manifest.json` on origin/main (4ec889e).

The repair introduced no new problem. No other line in `README.md`, `Suggested.lean` or `metadata.toml` names a commit hash, so no older pin is left behind (grep for `6b7abb3`, `a91d3aa`, `358314d`: none). The pull-request description does not state the pins.

## Verified sound

### Gate and dependency check

- `gate … --base origin/main` at 5fdb342, run for this review: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run at the same head adds `build=0`.
- `gate --depcheck … --movable --pr 1391`: `depcheck: 222 roadmaps, 2027 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. The roadmap is at line 247 of the merge order. Its five suppliers that are open pull requests are earlier: HabiroCyclotomicCompletions 47, GeometryOfNumbersAndQuadraticArithmetic 55, AutomorphicSpectralTheory 96, ArithmeticStatisticsPartIV 114, MetaplecticAutomorphicForms 150. AutomorphicFormsOnReductiveGroups, which the README names only for ownership, is at line 60.
- `git diff --stat origin/main...HEAD` outside the folder: empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

### What the changed lines govern: the supplier contracts at the pins

The two changed lines fix the commits against which "From Mathlib", "From Tau Ceti" and the pinned ContourIntegration names (README lines 36–65 and 113) are stated. All of these were re-resolved mechanically at Mathlib 1b1ccf4b and Tau Ceti 2fd255d9:

- 25 file paths: all 17 `Mathlib/…` paths, the `SlashActions.lean` companion of line 46 (`Mathlib/NumberTheory/ModularForms/SlashActions.lean`) and all 7 `TauCeti/…` paths exist.
- 58 backticked library names: each has a declaration at the pins, and the two module names `TauCeti.Analysis.SpecialFunctions.Erf` and `…IncompleteGamma` exist.
- Hypotheses the contract prose states, opened at the pin:
  - `TauCeti.CuspFormClass.eichlerIntegral_slash_apply` (`EichlerIntegral/Transformation.lean`:121) takes `[Γ.IsArithmetic] [CuspFormClass F Γ k] (hk : k = n + 2) (hh : 0 < h) (hΓ : h ∈ Γ.strictPeriods)`, plus the same strict-period hypotheses for `f'`. This is exactly "integral weight k=n+2, arithmetic level and positive strict periods" in the changed line 59.
  - `TauCeti.Real.erf` (`Erf.lean`:61) is `2 / √π * ∫ t in 0..x, rexp (-t ^ 2)`, and `erfc` (:64) is `1 - erf x`. `erf_pos` (:150) needs `0 < x`; `erf_lt_one` (:196) and `abs_erf_lt_one` (:206) hold for every x. This matches README line 61.
  - `lowerIncompleteGamma` (`IncompleteGamma.lean`:115) has junk value 0 for s ≤ 0. `_eq_integral` (:124) needs `0 < s` and `0 ≤ x`, `hasDerivAt_` (:250) needs `0 < s` and `0 < x`, and `tendsto_…_atTop` (:334) needs `0 < s` and converges to `Real.Gamma s`. This matches README line 63, and §8.4's s=1−k>0, x=−2w>0 avoids the junk value.
  - `modFormCharSpace` (:327) and `cuspFormCharSpace` (:291) are infima of diamond eigenspaces on `(Gamma1 N).map (mapGL ℝ)`. `mem_…_iff_nebentypus` (:356, :388) use `Gamma0Map N`, which is `g.1 1 1` (Mathlib `CongruenceSubgroups.lean`:96), the lower-right entry. This matches README line 65.

### Elaboration and padding

- `lake env lean` on `Suggested.lean` from the worktree: 19 `declaration uses sorry` warnings and nothing else (12 s). Imports are `import Mathlib` and `TauCeti.Analysis.SpecialFunctions.Erf` (its object file is built). There is no `variable` line, no `set_option` and no `lemma`.
- One-tactic probe on a scratch copy: every `sorry` was replaced by `first | rfl | simp | infer_instance | decide | (intro; simp) | (constructor <;> simp) | (refine ⟨1, one_pos, fun _ => 1, ?_⟩; simp)`. All 19 theorems still fail, with one error site per theorem (copy lines 58, 66, 77, 97, 123, 141, 151, 160, 172, 199, 207, 215, 256, 270, 282, 339, 348, 380, 405). None is padding.
- `#check @name` for all 41 declarations: the elaborated types are character-for-character those of the worker's `signatures.md` (diff empty). No section binder is lost. `Suggested.lean` is unchanged since d11ee63 (diff empty).

### Cross-roadmap citations, this round

- Main at 4ec889e: ModularForms, ThetaSeries, IntegralLattices, ClassicalArithmeticCompletion, PadicMeasuresIwasawaAlgebras, PDE, ComplexKahlerGeometry and StandardDistributions are under `TauCetiRoadmap/`; ContourIntegration is under `Completed/`.
- Open heads (`roadmaps show`), each cited name sitting in its cited section:
  - ArithmeticStatisticsPartIV: "Gaussian binomial coefficient" (README 130) is under "### 3.2 Gaussian coefficients"; "Euler q-binomial sum" (796) is under "### 3.9".
  - AutomorphicSpectralTheory: `weight_laplacian_slash` (1257) is under "### 1.16".
  - GeometryOfNumbersAndQuadraticArithmetic: `appell_lerch_difference_identity` (1605) is under "### 4.3".
  - MetaplecticAutomorphicForms: `finiteWeil_conjugate` (1254) is under "### 4.7 Finite Weil representation".
- The worker's `citations.md` has one lead, "BruinierFunke2003, §3". It is a source key, not a roadmap. `overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, and no id exists only at an open revision.

### Declared gaps

The three gaps are unchanged at README lines 95, 103 and 123, under their suppliers' subsections and with the plan's slugs. The Tau Ceti pin does not supply any of them.

### Seeded sample

None of the fifteen sampled targets (§§1.2, 1.4, 2.1, 2.5, 4.1, 4.4, 5.4, 5.7, 6.1, 7.3, 7.4, 8.6, 9.3, 9.5, 10.5) lies in the changed lines, and the folder diff since d11ee63 is limited to lines 34 and 59. The source readings of the earlier full reviews stand.

### Adversarial table

The 39 rows of PRREVIEW-QSeriesPartitionsAndMockModularForms~12 ("Adversarial table"), carried forward in ~13, stand: no statement changed and the pins are those ~13 re-read. The headline rows, with their values from those reports:

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `qBinomial` (carried, ~12) | (a,q,z)=(0.3+0.2i,0.4−0.3i,0.5+0.1i); q=0 | 1.8736257319−0.4684739279i both; 1.2454545455 both | Keep |
| `qBinomial_largeBase` (carried) | (0.5,2,0.7) | 0.65 both | Keep |
| `euler_qExponential` (carried) | q=0.4−0.3i, z=0.5+0.1i; q=0 | 2.4874562632−0.3500169047i both; 2=1/(1−z), 1.5=1+z | Keep |
| `ramanujanOnePsiOne_hasSum` (carried) | (2,0.3,½,0.6); b=0 | −0.0920302027 both; residual ≤5.7×10⁻¹⁶ | Keep |
| `baileyLemma_transform` (carried) | exact ℚ, a=⅓, q=½ | β′₁=5484/2717 both ways; pair relation n=0…8 | Keep |
| `rogersRamanujan_count`, `_count_two` (carried) | n=0…20 | …,23,26,31 both; …,15,16,20 both | Keep |
| `rogersRamanujan_hasSum` (carried) | q=0.45+0.3i | 1.2605476441+0.7632052939i both | Keep |
| `quintupleProduct_hasSum` (carried) | (0.3+0.2i,0.7−0.4i) | 1.8340448725−0.8634664154i both | Keep |
| `partitionRank`, `partitionCrank` (carried) | (3,2,1,1),(1),(3,3),(2,2,2),() | rank −1,0,1,−1,0; crank −1,−1,3,2,0 | Keep |
| `rank_equidistribution_five_seven` (carried) | sizes 4…24 mod 5; 5…26 mod 7 | classes [1],[6],[27],[98],[315]; [1],[11],[70],[348] | Keep |
| `crank_equidistribution_five_seven_eleven` (carried) | sizes 6,17,28 mod 11 | crank classes [1],[27],[338]; rank control at 6 unequal | Keep |
| `partition_primePowerCongruences` (carried) | ℓ=5,7,11, r≤3 | δ=(4,24,99),(5,47,243),(6,116,721); all divisible; p(243)≡0 mod 49, ≡245 mod 343 | Keep |
| `zwegersMuHat_elliptic` (carried) | five (k,l,m,n), τ=0.17+1.1i | residuals ≤5×10⁻¹⁶ | Keep |
| `zwegersMuHat_modular` (carried) | S at (i,⅓,¼); four more γ | 0.7167793626i both; residuals ≤5.8×10⁻¹⁰ | Keep |
| `thirdOrderF_rank` (carried) | q=0.3+0.25i | 1.2056564842+0.0794678723i vs 1.2056564849+0.0794678713i (tail 10⁻⁹) | Keep |
| `thirdOrderCompletion_T`, `_S` (carried) | four τ | residuals ≤8.1×10⁻¹⁴; F₃+G₃ fails S by ≥0.43 | Keep |
| `rankCompletion_modular` (carried) | t=5, γ=(1 0;25 1), four α | every ratio e(1/24)=0.9659258263+0.2588190451i | Keep |
| `rankResidueDeviation_mock` (carried) | t=1…7, every r | worst residual 9.0×10⁻¹⁶; t=1: 0=0 | Keep |
| Changed line 34: Mathlib pin | README vs `lake-manifest.json` (branch and origin/main) vs `.lake/packages/mathlib` HEAD | 1b1ccf4b088b… on all four | Keep |
| Changed line 59: Tau Ceti pin | the same comparison | 2fd255d997f4… on all four | Keep |
| Line 59: `eichlerIntegral_slash_apply` hypotheses | signature at :121 vs prose | `hk : k = n + 2`, `[Γ.IsArithmetic]`, `0 < h`, `h ∈ Γ.strictPeriods` vs "k=n+2, arithmetic level, positive strict periods" | Keep |
| §5.3 adapter E(x)=erf(√π·x) on pinned `erf` (computed this round) | x=1, −0.4, 0 | 2∫₀ˣe^(−πu²)du = 0.987811117815, −0.683970869951, 0; erf(√π x) the same | Keep |
| §5.3 adapter β(t)=erfc(√(πt)) on pinned `erfc` (computed this round) | t=0.3, 1, 0 | ∫ₜ^∞u^(−1/2)e^(−πu)du = 0.1697719797, 0.0121888822, Γ(½)/√π=1; erfc side 0.1697719797, 0.0121888822, 1 | Keep |
| §8.4 on pinned `lowerIncompleteGamma` (computed this round) | s=½, x=2; s≤0 | ∫₀²t^(−½)e^(−t)dt = 1.691806732945 = √π·erf(√2); limit Γ(½)=1.772453850906; junk 0 avoided by s=1−k>0 | Keep |

### Remarks on untouched text (no change asked)

- README line 46 writes the slash-action file as bare `SlashActions.lean` after a full `Mathlib/…/Basic.lean` path; it resolves to `Mathlib/NumberTheory/ModularForms/SlashActions.lean`.

## Not verifiable

- As in the previous reports, GasperRahman2004 and BFOR2017 are waived. Andrews1976, Hickerson1988 and AtkinSwinnertonDyer1954 are uncertified and cited by locator only. The common multiplier of `rankCompletion_modular` was sampled for t=3, 4, 5, 6, not proved for every t.
- Ownership against open pull requests was checked through `overlaps.md`, `citations.md` and the heads of the four open suppliers named above. The other open heads were not re-read this round: the change is limited to the two pin lines.

## Source issues

- none
