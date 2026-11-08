# Review of ConformalMappingPartII (pull request #1407 at 79dc9b4)

**Verdict:** accepted

This is an incremental re-review of the 2 lines changed since 24d9cdf. The only change in the folder is `Suggested.lean` line 4, which now imports `TauCeti.Geometry.Manifold.Instances.OnePoint.Basic`. `README.md` and `metadata.toml` are byte-identical to the previous head.

The head also merges main, and that merge moved both library pins: Tau Ceti a91d3aa → 2fd255d, Mathlib 6b7abb3 → 1b1ccf4, toolchain v4.36.0-rc2. I therefore re-resolved every library declaration the README cites against the new pins, in addition to checking the import itself.

No findings.

## Previous findings

- none: the previous report (at 24d9cdf) raised no finding. It recorded round 8's R01 and R02 as repaired. README line 99, which carried both, is unchanged, and it remains true at the new pin (see the remarks below).

## Verified sound

**Mechanical evidence.**
- HEAD is 79dc9b4bc74720cf19fb48f6e1f6b4ce9a94e368 and the worktree is clean.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ConformalMappingPartII'` is empty. The files listed as changed outside the folder since 24d9cdf all come from the merge of main, not from this pull request.
- `git diff --stat 24d9cdf..HEAD` on the folder shows only `Suggested.lean | 2 +-`. The folder still holds exactly `README.md` (1198 lines), `Suggested.lean` (332 lines) and `metadata.toml`.
- I reran the gate at this head. Every scanner reports 0 (`set_option=0 … statement-hygiene=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`) and it exits 0. The worker's record at this head also shows `build=0`.
- `lake env lean` on `TauCetiRoadmap/ConformalMappingPartII/Suggested.lean` exits 0 and prints 17 warnings. All 17 are `declaration uses sorry`, at lines 62, 72, 92, 108, 155, 165, 183, 201, 216, 223, 236, 250, 270, 285, 299, 311 and 322, the same set as round 9.
- The dependency command prints exactly

```text
depcheck: 238 roadmaps, 2349 edges, 0 problem(s)
```

  with no UPWARD, CYCLE or `moved:` line. `ConformalMappingPartII` is line 240 of the merge order. The diff adds no supplier and no `*Needs:*` edge.

**The changed import, at Tau Ceti 2fd255d.**
- At this pin, `TauCeti/Geometry/Manifold/Instances/OnePoint.lean` has become `OnePoint/Basic.lean`; git records a rename at 92% similarity. No `OnePoint.lean` module remains, so the old import would no longer resolve and this change is required.
- `OnePoint/Basic.lean` declares everything the roadmap uses: `affineChart` (:69), `invChart` (:122), `invChart_source` (:171, `{0}ᶜ`), `invChart_coe` (:180), `invChart_infty` (:184), `instChartedSpace` (:207) and `instIsManifold` (:236).
- The rest of the rename's diff only adds `inv_invChart` and `contMDiff_invChart_symm` and reflows one proof. No existing statement changed.
- A scratch copy of `Suggested.lean` with probes appended shows how instances resolve:
  - `#synth` yields `OnePoint.instChartedSpace` and `OnePoint.instIsManifold` for `OnePoint ℂ`, and `OnePoint.instMulActionPSL` for `PSL(2, ℝ)` on `OnePoint ℝ`.
  - `chartAt ℂ ∞ = OnePoint.invChart` and `chartAt ℂ ↑z = OnePoint.affineChart` both elaborate.
- Mathlib at 1b1ccf4 has no charted space on `OnePoint`, found by grepping `Mathlib/` for one. The imported instance is therefore the only one, and there is no diamond.
- README line 73 places the charts “under `TauCeti.Geometry.Manifold.Instances.OnePoint`”. That module prefix still covers `OnePoint/Basic.lean`.

**Library re-resolution at the new pins.**
- A scratch `#check @…` file importing Mathlib and the 17 cited Tau Ceti modules that have object files at the pin resolves 45 Mathlib and 30 Tau Ceti names. The hypotheses match the README's prose. Examples:
  - `MeromorphicOn.exists_canonicalDecomp`: needs meromorphy on the closed ball and orders ≠ ⊤.
  - `Complex.CanonicalDecomp.divisor_eq_divisor`: needs `0 < R`.
  - `MeromorphicOn.circleIntegrable_log_norm`: needs meromorphy on `sphere c |R|` only.
  - `ordinaryHypergeometricSeries_radius_eq_one`: excludes nonpositive-integer parameters.
  - `Complex.digamma_one_sub`: excludes s ∈ ℤ.
  - `TauCeti.montel`: `[ProperSpace E]`, `IsOpen Ω`, holomorphy and `IsLocallyBoundedOn`.
  - `TauCeti.descendPow_pow` and `differentiableOn_descendPow`: `[NeZero m]`, an open s, invariance at every u ∈ s.
  - `TauCeti.image_pow_ball`: `0 ≤ r`.
  - Horodisc and Shimizu: `[DiscreteTopology Γ]`, `0 ≤ A`, `D.width * D'.width ≤ A * A'`, `w ≠ 0`.
- The one probe error was my own mis-namespaced guess `TauCeti.volume_idealRegion_neg_one_one`. The README's name, `TauCeti.UpperHalfPlane.volume_idealRegion_neg_one_one`, resolves.
- I compared each cited Tau Ceti statement textually between a91d3aa and 2fd255d:
  - **Identical statements (24):**
    - Cayley: `bijOn_I_mul_one_add_div_one_sub_ball`, `I_mul_one_add_sub_I_div_add_I_div_one_sub`.
    - Comap: `chartAt_chartedSpaceComap_apply`.
    - Continuation and GlobalBranch: `IsAnalyticContinuationAlong`, `ContinuesInside`, `ContinuesInside.exists_analyticOnNhd`.
    - Reflection: `exists_differentiableOn_eqOn_chartedReflection_of_symmetric`.
    - Dirichlet domain: `isFundamentalDomain_dirichletDomain` (moved to `Fuchsian/DirichletDomain/Basic.lean:63`, same `[DiscreteTopology Γ]` variable at :58), `dirichletDomain`.
    - Riemann maps: `IsNormalizedRiemannMapOn`, `exists_isNormalizedRiemannMapOn`.
    - `unitDiscMoebius`, `montel`, both BranchLogRoot theorems, `image_pow_ball`, both `descendPow` lemmas.
    - All three Shimizu lemmas, both Horodisc lemmas.
    - `CuspDatum`, `IsCofinite`, `CompactifiedQuotient`, `cuspChart`, `volume_idealRegion_neg_one_one` and `UniversalCover`.
  - **Same statement, proof only:** `exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier` (its tactic proof became a term proof).
  - **Docstring or proof lines only:** Classification, Rotation (still publicly re-exported by Classification at :8), AutomorphismIsometry, RiemannMapping Existence and Normalization, Triangle and Moebius.
  - **Files unchanged:** Herglotz, PreSchwarzian and `Instances/UniversalCover.lean`.
  - **Other cover names:** `TauCeti.UniversalCover.isCoveringMap` is at `UniversalCover/Covering.lean:58` and the `simplyConnectedSpace` instance at :183.
- Mathlib meanings I opened at 1b1ccf4:
  - `ValueDistribution.proximity` is rewritten through `WithTop.recTopCoe`. It has the same two branches, the circle average of log⁺‖f‖ at ⊤ and of log⁺‖f − a₀‖⁻¹ otherwise, and `proximity_top` is now `rfl`.
  - Divisor, Order, TrailingCoefficient, OrdinaryHypergeometric and CanonicalDecomposition have only proof changes. The one hypothesis change is to `min_divisor_le_divisor_add`, which the README does not cite.
  - The Tau Ceti `SpecialLinearGroup.rotation` is still `!![cos θ, sin θ; −sin θ, cos θ]` (`MatrixFinTwo.lean:134`). `upperRightHom` is still the transvection class acting by z ↦ z + x (`ProjectiveSpecialLinearGroup/FinTwo.lean:186`).

**Adversarial table.** Rows 1–6 are computed this round for the changed import and the statements and passages that depend on it or on moved library modules. The remaining rows are carried forward from round 9 and the rounds it cites, for statements this diff leaves untouched.

| Statement | Instances and values | Result |
|---|---|---|
| 1. `finite_puncture_cusp_comparison`, sphere chart at an infinite puncture (the import's `invChart`) | S = {0,1,∞}, f = λ = θ₂⁴/θ₃⁴, cusp τ = 1 ↦ ∞, local parameter q′ = e^{πiτ′} with τ = 1 − 1/τ′ (width 2), u = 1/λ(τ) = λ(τ′)/(λ(τ′) − 1). u/q′ = −16.241508, −16.010334, −16.000019 at Im τ′ = 2, 3, 5, tending to −16 ≠ 0. Wrong chart: the affine chart gives λ(τ)/q′ = −1.766e4, −9.591e6, −2.752e12, which diverges | correct |
| 2. `invChart` and junk values at the pin | ∞ ↦ 0, X = 2 ↦ 0.5, X = −4i ↦ 0.25i. The new pinned `inv_invChart`, (invChart x)⁻¹ = affineChart x, makes affineChart ∞ = 0 = invChart 0. Both junk values sit outside the chart sources, and the README restricts to finite nonzero X | correct |
| 3. §2.5 Hempel's formula (cites §1.7) | N = 2: p = 0, −1, 1 and m = 0, 3/4, −3/4, so c = −3/4 = −1/2 − 1/(2N) (CDT-journal line 2537). The X⁻¹, X⁻², X⁻³ coefficients at ∞ have absolute values 9.2e−17, 0 and 3.1e−17. N = 3, 5: c = −0.6667, −0.6, all residuals ≤ 3.0e−16. With the puncture at ∞ (the `roots_inverse_schwarzian` case N = 2), (3 + x²)/(2(x² − 1)²) equals ½Σ(x ∓ 1)⁻² − ¼/(x − 1) + ¼/(x + 1): both sides are 1.5 at x = 0, 0.388889 at x = 2, and 1.058960 + 0.610578i at x = 0.3 + 0.4i | correct |
| 4. §5.4 boundary limit (cites §1.7), and §5.1 | Γ(1+1/N)Γ(a₋)²/(Γ(1−1/N)Γ(a₊)²) = 4.3768792305, 2.5810565398, 1.7497171580 at N = 2, 3, 5, equal to `gammaRadius N` to 10 digits. The §5.1 Checks give Γ(1/4)⁴/(4π²) = 4.3768792305 and Γ(1/6)³/(12π^{3/2}) = 2.5810565398. At N = 2, s(1−y) = 2.441278, 3.074513, 3.589603, 3.937307 for y = 1e−3, 1e−6, 1e−12, 1e−24. The leading-order prediction 4.37688·(L + 1.017290)/(L + 7.300476) at L = −log y = 55.262 gives 3.937307. The series (5.1.21) and the direct ₂F₁ agree to 3.3e−13 at x = 1/2 | correct |
| 5. §6.1 and line 114, Dirichlet domain (module moved) | The statement and the `[DiscreteTopology Γ]`, `p ∈ freeLocus Γ ℍ` hypotheses are unchanged at `DirichletDomain/Basic.lean:63`. Round-9 values stand: vertices 1, i, −1, −i at N = 2, and ideal 2N-gon area (2N − 2)π = 6.283185, 12.566371, 25.132741 at N = 2, 3, 5, equal to the covolume 2π(N − 1) | correct |
| 6. Line 99, Hurwitz and Montel contracts at the new pin | The pinned `hurwitz_injOn` now needs frequent injectivity and no `[l.NeBot]` (along ⊥, ∃ᶠ is false). The README's nontrivial filter with eventual injectivity implies frequent injectivity (`Filter.Eventually.frequently`). Example: F_n = z/(n+1), injective at every n, with F_n(0.5) = 0.25, 0.04545, 0.00495, tending to the constant 0. `IsLocallyBoundedOn` is unchanged: F_n = zⁿ on \|z\| ≤ 1/2 has one bound C = 1, while n·z has per-member bounds 0.5, 5, 50 | correct |
| `ValueDistribution.proximity` in five headlines | f = 2z, r = 1: m(1, f, ∞) = log 2 = 0.693147 under either form of the definition. f = z/2: 0 | correct |
| `finite_puncture_cusp_comparison`, binder form and S = {0,1,∞} | Round 7: covolume 6.283185 = 2π(2·0 − 2 + 3); λ/q → 16 (15.7746, 15.99018, 15.999982); the width-4 coordinate gives u′(0) = 0; \|S\| = 2 is excluded by `hS` | keep (round 7) |
| Classification and isometry (§§1.6, 1.7) | Round 7: \|φ′\|/(1 − \|φ\|²) = 1, 1.333333, 1.333333, 1.960784, equal to 1/(1 − \|z\|²) | keep (round 7) |
| Rotation (§1.2), reflection (line 102), normalized Riemann map, branch log and root, Jordan closure, monodromy | Rounds 7–8: c = i with \|c\| = 1; the triangle 0, 1, e^{πi/N}; derivative 0.5 > 0; n = 0 excluded | keep (rounds 7–8) |
| `zero_balanced_connection`, `uniform_cusp_asymptotic`, §4.6, §8.1 | Round 6: the series agree to 1.2e−14; γ_N quotient 4.376879230453 at N = 2; max D ≤ 0.9995 up to N = 2000 | keep (round 6) |
| `RootsCover.halfPlaneForm`, `free_deck_presentation`, §1.5, §6.3 | Round 5: h_N = 2, 3.464102, 4.828427, 12.627503; 13 120 reduced words with no violation. `rotation` and `upperRightHom` conventions are unchanged at the new pin | keep (round 5) |
| All other untouched targets (0.1–0.6, 1.1–1.12, 2.1–2.9, 3.1–3.8, 4.1–4.8, 5.1–5.8, 6.2–6.8, 7.1–7.10, 8.2–8.7, 9.1–9.19) | Round 4: S(z²)(1) = −3/2; γ₂ = Γ(1/4)⁴/(4π²); half rotation 1.2111859623 at z = 0.1; C* = 7 | keep (round 4) |

**Headline theorems and padding.**
- The 17 sorried headlines are unchanged from round 9: `LinearEquation.global_initial_value`, `SurfaceUniformization.noncompactCoordinate`, `PointedCover.exists_cover`, `finite_puncture_cusp_comparison`, `roots_inverse_schwarzian`, `quotient_representation`, `inverseRatio.cover_inverse`, `zero_balanced_connection`, `roots_conformal_radius`, `gammaRadius.positive_expansion`, `free_deck_presentation`, `half_rotation_involution`, `local_first_main_translation`, `uniform_cusp_asymptotic`, `large_n_max_growth`, `normalized_log_derivative` and `uniform_mean_growth`.
- The symmetric ideal polygon is named in the module docstring as not statable.
- Because the libraries moved, I reran the one-tactic probe on a scratch copy at the new pins. Each `sorry` became `first | rfl | infer_instance | simp | norm_num`, each attempt followed by `done`. All 17 declarations still need `sorry` (warnings at the same 17 lines), so the bump introduced no padding.
- The worker's `signatures.md` lists 31 declarations with 0 dropped binders. My own `#check @` of `finite_puncture_cusp_comparison` and `free_deck_presentation` under the new import matches §1.7 and §6.3: the hypotheses `hS`, `hf`, `hm`, `hc` and `hs`, the `[DiscreteTopology Γ]` binder, and the cusp-chart composite u.

**Seeded sample, where it falls in the change and its dependents.**
- §2.5 (cites §1.7): CDT-journal proof of Lemma 5.1.8, (5.1.13), is at line 2498 on printed p.670 (header at line 2453). Hempel's standard form, with ∞ not in S, is at lines 2486–2488. The regularity constraints at ∞ are at line 2511, and c = −1/2 − 1/(2N) at line 2537 (p.671). The README states this as written. Hem88 is settled as waived.
- §5.4 (cites §1.7): the proof of Theorem 5.1.4 opens at line 2669 on p.672, where the modulus-one cusp limit is at lines 2671–2672. The Gamma-quotient limit is at lines 2681–2721, on p.673. The formula matches the README (a± = (N±1)/(2N), 2a± = 1 ± 1/N).
- §5.1 (its expression is evaluated in row 4): Theorem 5.1.4 and (5.1.5) are at lines 2382–2390 on p.668 (header at line 2348), and match `gammaRadius` with 2^{4/N} = 16^{1/N}.
- §6.1 (its module moved): Proposition 5.2.1 is at line 2795 on p.674 (header at line 2782). The Dirichlet domain about 0 is at lines 2817–2819.
- The other sampled targets (0.4, 0.5, 0.6, 3.5, 5.3, 5.8, 6.2, 7.4, 7.5, 8.1, 8.3) lie outside the diff and its dependents. Their library inputs (`CuspDatum`, Horodisc, Shimizu, divisor, Jensen and proximity) have unchanged statements at the new pins, as listed above. The README flags no locator as unverified.

**Ownership, overlaps, citations.**
- The diff adds no object and no supplier.
- `overlaps.md` lists no open pull request changing this roadmap, no dropped id and no id that only an open revision defines.
- The 8 leads in `citations.md` are the same as in round 9, and none is a defect. TeschlODE and McMullenRS are source ids. The six flagged Lean names are declared in `Suggested.lean` at lines 50, 62, 72, 142, 183 and 223.

**Remarks on untouched text (no change requested, not findings).**
- Line 99 describes `TauCeti.hurwitz_injOn` with a nontrivial filter and eventual injectivity. At 2fd255d (`Conformal/Hurwitz.lean:235`) the theorem needs only frequent injectivity and no `NeBot`. The README's contract is a special case and stays true.
- `TauCeti.IsLocallyBoundedOn` now lives in `TauCeti/Analysis/Normed/Group/LocallyBounded.lean:48` with an unchanged body. `NormalFamilies` publicly imports that file (line 12), so “available from `NormalFamilies`” holds.
- In §5.4, the limit formula sits on p.673, not p.672: the proof the locator names starts on p.672 and continues there.

## Not verifiable

- **Hem88**, Theorem 3.1: settled as waived and cited by locator only. §§1.7 and 2.5 use it as the primary locator next to CDT-journal (5.1.13), which I read.
- **KR16**, §1: settled as uncertified, and untouched by this diff.
- Several cited Tau Ceti modules have no object files at 2fd255d: Herglotz, Cayley, Fuchsian `DirichletDomain.Basic`, `Instances.UniversalCover`, Comap, and in Conformal: Hurwitz, Classification, Rotation, AutomorphismIsometry, `RiemannMapping.*`, `Continuation.Basic`, GlobalBranch, `Reflection.Arc`, `Jordan.Approach`, PreSchwarzian and Moebius. I checked their statements by comparing the source at both pins, not by `#check`.

## Source issues

- none
