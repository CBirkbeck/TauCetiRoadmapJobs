# Review of ConformalMappingPartII (pull request #1407 at 520fb55)

**Verdict:** needs changes

This is an incremental re-review of the 45 lines changed since b8c0542. The changes are the rewritten ConformalMapping scope paragraph (README line 7) and supplier contract (lines 97–103), the ClassicalArithmeticCompletion anchor (line 15), line 25, and the *Needs:* lines of §§0.3, 0.4, 1.1, 1.2, 1.4, 1.6, 1.7 (two), 1.8, 2.4, 3.3, 6.1 and 6.7. In `Suggested.lean`, the discreteness binder of `finite_puncture_cusp_comparison` changed. The Lean change is sound, and every newly cited Tau Ceti declaration exists at the pin. Three locator and contract defects remain in the changed lines.

## R01 (P3) — Two changed supplier citations name the wrong module

**Location.** `TauCetiRoadmap/ConformalMappingPartII/README.md` line 99: “`TauCeti.IsLocallyBoundedOn` Ω (`TauCeti.Analysis.Normed.Group.LocallyBounded`; uniformly bounded on every compact subset)”. Line 296 (§1.2 *Needs:*): “`TauCeti.exists_eqOn_const_mul_of_leftInvOn_ball_of_map_zero` in `TauCeti.Analysis.Complex.Conformal.UnitDisc.Automorphism.Classification`”.

**Claim.** Each citation names the module that declares the supplier.

**Witness.** At the Tau Ceti pin there is no `TauCeti/Analysis/Normed/` directory. `IsLocallyBoundedOn` is declared at `TauCeti/Analysis/Complex/Conformal/NormalFamilies.lean:101`. The rotation theorem is declared at `UnitDisc/Automorphism/Rotation.lean:72`, and line 100 of the same README already says `Rotation`.

**Repair.** On line 99, write `TauCeti.Analysis.Complex.Conformal.NormalFamilies` (or `NormalFamilies`, under the stated prefix). On line 296, replace `…Automorphism.Classification` with `…Automorphism.Rotation`. Both corrected locators were checked against the declaring files above.

## R02 (P3) — The ConformalMapping contract misstates two pinned hypotheses and one layer

**Location.** README line 99: “`TauCeti.hurwitz_injOn` (`Hurwitz`): … maps that are eventually holomorphic and frequently injective on Ω”. Line 102: the reflection theorem is described as acting on “a map continuous on the closed side Im e≥0, holomorphic on the open side and sending the arc Im e=0 into the arc Im d=0”. Line 7: “Its layers on normal families (Montel compactness and Hurwitz injectivity)”.

**Claim.** The contract states what is assumed of each pinned declaration.

**Witness.** `Hurwitz.lean:286` assumes `hinj : ∀ᶠ i in l, Set.InjOn (F i) Ω`, which is eventual injectivity, not frequent. `Reflection/Arc.lean:212` also assumes `hf_maps : MapsTo f (e.source ∩ {0 ≤ (e z).im}) d.source`. ConformalMapping (main, README line 104) places Hurwitz in L0, not in its normal-families layer L1.

**Repair.**
- Line 99: write “eventually holomorphic and eventually injective”.
- Line 102: add “mapping the closed side into the source of d”.
- Line 7: move Hurwitz injectivity out of the normal-families parenthetical, for example “its local-mapping layer (Hurwitz injectivity), its layer on normal families (Montel compactness), …”.

§1.1 is still served after the repair, because there every map of the normalized sequence is injective.

## R03 (P3) — The Little Picard deferral names a ModularForms layer that does not hold it

**Location.** README line 25: “The modular-uniformization and Little Picard programme remains with ModularForms, Layer 10, as ConformalMapping assigns it.”

**Claim.** ModularForms Layer 10 owns the ℍ/Γ(2) λ-uniformization and Little Picard, and ConformalMapping assigns them there.

**Witness.** On main, `TauCetiRoadmap/ModularForms/README.md` line 1024 is “Layer 10: the modular curve `Γ\ℍ` and the dimension formulas”. That README has zero hits for “Picard” or “Γ(2)”. `Completed/ConformalMapping/README.md` lines 163–167 name ModularForms without a layer.

**Repair.** Drop “, Layer 10”. One option is the wording of BelyiMaps' README (main, line 167): “The `ℍ/Γ(2) ≅ ℂ∖{0,1}` λ-uniformization and Little Picard are not targets here; ConformalMapping records them as ModularForms material.” No section of this roadmap consumes them. §1.1 excludes the plane alternative through the ComplexCurveModuli D0.4 metric (line 25) and McMullenRS Theorem 2.9.

## Previous findings

- The round-6 report (`PRREVIEW-ConformalMappingPartII~6`, at b8c0542) raised no finding, so no finding is carried forward. Three repairs in this diff introduced new problems, raised above: the module locators of R01, the contract wording of R02 and the deferral of R03. The changed Lean binder is sound (below).

## Verified sound

**Mechanical evidence.**
- HEAD is 520fb55b505f88cdb0384697ec2dd6d51debba6d and the worktree is clean.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ConformalMappingPartII'` is empty.
- The folder holds only `README.md` (1198 lines), `Suggested.lean` (332 lines) and `metadata.toml`.
- The gate rerun at this head prints every scanner at 0 and `OK`. The worker's gate also has `build=0`.
- A fresh `lake env lean` on `TauCetiRoadmap/ConformalMappingPartII/Suggested.lean` exits 0 in 22 s. It prints exactly 17 warnings, all `declaration uses sorry`, at lines 62, 72, 92, 108, 155, 165, 183, 201, 216, 223, 236, 250, 270, 285, 299, 311 and 322, the same set as round 6.
- Imports are unchanged. There is no `set_option`, no sorried data and no `lemma`.

The dependency command reports exactly

```text
depcheck: 239 roadmaps, 2426 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. `ConformalMappingPartII` is line 243 of the merge order. The diff adds no roadmap supplier: it replaces ConformalMapping layer citations by pinned Tau Ceti and Mathlib names.

**The changed Lean statement.** `finite_puncture_cusp_comparison` replaced `∃ hd : DiscreteTopology Γ, letI := hd; Γ.IsCofinite ∧ …` with `Γ.IsCofinite ∧ ∀ [DiscreteTopology Γ], …`. At the pin, `Subgroup.IsCofinite` (`TauCeti/Analysis/Complex/Fuchsian/Covolume.lean:114`) is a structure with the fields `discreteTopology : DiscreteTopology Γ` and `covolume_ne_top`, and `#print` confirms this. In a scratch copy of the file, the following was proved without error for every Γ and every `P : DiscreteTopology Γ → Prop`:

```lean
(∃ hd, Γ.IsCofinite ∧ P hd) ↔ (Γ.IsCofinite ∧ ∀ [hd : DiscreteTopology Γ], P hd)
```

So the new form says exactly what the old one did, and it no longer binds an instance existentially. `#check @finite_puncture_cusp_comparison` shows every hypothesis of README §1.7: `3 ≤ S.card`, `ContMDiff … ω f`, omission, `IsCoveringMap` and surjectivity. Its conclusion keeps the order Γ, then cofinite, then e, then ∀ D A. The one-tactic probe `simp` leaves unsolved goals, so the theorem is not padding.

**Newly cited declarations, read at the pins (file:line, hypotheses against the README's description).**

| Cited | Pinned location | Matches the README? |
|---|---|---|
| `TauCeti.montel` | `Conformal/Montel/Basic.lean:81` (`[ProperSpace E]`, `IsOpen Ω`, holomorphic, `IsLocallyBoundedOn`) | yes |
| `TauCeti.IsLocallyBoundedOn` | `Conformal/NormalFamilies.lean:101` (one constant per compact K ⊆ s) | statement yes, module no (R01) |
| `TauCeti.hurwitz_injOn` | `Conformal/Hurwitz.lean:283` (`[l.NeBot]`, open, preconnected, `∀ᶠ` holomorphic, `∀ᶠ` injective) | “frequently” wrong (R02) |
| `TauCeti.exists_forall_unitDisc_eq_unitDiscStandardAutomorphismEquiv` | `UnitDisc/Automorphism/Classification.lean:89`; formula `u(z−a)/(1−āz)` at `…/Basic.lean:43,57`, centre `a = g 0` | yes (§§1.6, 1.7) |
| `TauCeti.exists_eqOn_const_mul_of_leftInvOn_ball_of_map_zero` | `UnitDisc/Automorphism/Rotation.lean:72` (left inverse, `f 0 = 0`) | line 100 yes; §1.2 module no (R01) |
| `TauCeti.norm_deriv_div_one_sub_norm_sq_unitDiscStandardAutomorphismFormula_of_norm_lt_one` | `SchwarzPick/AutomorphismIsometry.lean:74` (`‖u‖ = 1`, `‖a‖ < 1`, `‖z‖ < 1`) | yes |
| `TauCeti.riemannMapping` | `RiemannMapping/Existence.lean:96` (open, simply connected, `≠ univ`; BijOn, `deriv ≠ 0`) | yes |
| `TauCeti.IsNormalizedRiemannMapOn`, `TauCeti.exists_isNormalizedRiemannMapOn` | `RiemannMapping/Normalization.lean:122,170` (fields: base_mem, differentiableOn, bijOn, map_base, `0 < deriv f z₀`) | yes |
| `DifferentiableOn.invFunOn` | `Conformal/Inverse/Function.lean:44` (root namespace; open, InjOn) | yes |
| `TauCeti.exists_differentiableOn_eqOn_exp_comp`, `TauCeti.exists_differentiableOn_pow_eq` | `TauCeti/Analysis/Complex/BranchLogRoot.lean:155,165` (simply connected open, `0 ∉ g '' U`, `n ≠ 0`) | yes (§§2.4, 3.3) |
| `TauCeti.IsAnalyticContinuationAlong`, `TauCeti.ContinuesInside` | `Conformal/Continuation/Basic.lean:190,506` | yes (§§0.3, 1.8) |
| `TauCeti.ContinuesInside.exists_analyticOnNhd` | `Conformal/GlobalBranch.lean:214` (namespace `TauCeti.ContinuesInside`, `[CompleteSpace E]`) | yes (§0.4) |
| `TauCeti.exists_differentiableOn_eqOn_chartedReflection_of_symmetric` | `Conformal/Reflection/Arc.lean:208` | `hf_maps` omitted (R02) |
| `TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier` | `Conformal/Jordan/Approach.lean:213` (open, connected, bounded, Jordan frontier) | yes (§6.1) |
| Mathlib `Complex.norm_deriv_le_one_of_mapsTo_ball`, `Complex.affine_of_mapsTo_ball_of_norm_dslope_eq_div` | `Mathlib/Analysis/Complex/Schwarz.lean:261,291`, `#check`ed | yes (§1.4) |

The Tau Ceti modules above other than the three imported ones have no object files in this workspace. They were read in source at the pin rather than `#check`ed. The Mathlib names were `#check`ed.

**Anchors and cross-roadmap citations in the changed lines.**
- `ClassicalArithmeticCompletion/README.md#620-conformal-radius-using-the-existing-normalized-map` resolves to the unique heading “6.20 Conformal radius using the existing normalized map” (main, line 12529).
- `Completed/ConformalMapping/README.md` exists on main, and its L0–L6 list (lines 102–146) matches line 7 except as noted in R02.
- The open revision of ConformalMapping (pull request #998) no longer affects this roadmap, because no anchor into it is cited. Its own contract also reads “eventually holomorphic and injective” for `hurwitz_injOn`, which confirms R02.
- `overlaps.md` lists no dropped id and no other pull request that changes this roadmap.
- The `citations.md` leads are not findings. TeschlODE and McMullenRS are source ids. `LinearEquation.global_initial_value`, `LinearEquation.initialJet`, `RootsCover.halfPlaneForm`, `SurfaceUniformization.noncompactCoordinate`, `gammaRadius.positive_expansion` and `inverseRatio.cover_inverse` are declared at `Suggested.lean` lines 62, 50, 142, 72, 223 and 183.

**Source sample in the changed passages.**
- §1.6 against CDT-journal lines 2328–2341 (printed p.667, page marker line 2299): the Fuchsian group of ℂ∖μ_N as the deck group of the half-plane uniformization, with the Cayley transform at line 2319. The locator and statement agree.
- §6.1 against CDT-journal lines 2795–2828 (Proposition 5.2.1, printed p.674, page marker line 2780): Γ̃_N is free on t̃_N and its r̃_N-conjugates, and the Dirichlet domain about 0 has 2N cusps at the half-integer powers of ζ_N. These cusps are exp(πik/N), as the README states.
- The new *Needs:* route of §6.1, a triangle Riemann map followed by Schwarz reflection in its geodesic sides, is the classical construction the source itself points to (CDT-journal lines 2312–2315, Goluzin §III.1). Its two inputs are the Jordan and reflection theorems above.
- The other seeded targets (0.6, 1.10, 3.7, 5.3, 5.5, 6.6, 7.2, 7.6, 8.4, 8.5, 9.2, 9.3, 9.6) are untouched by the diff and were read in rounds 1–6.

**Adversarial table.** The new rows have values computed in this round (`witness7.py` and the Lean probe in the scratch directory). The other rows are carried forward with their values abbreviated.

| Statement | Instances and values | Result |
|---|---|---|
| `finite_puncture_cusp_comparison`, binder change | The Lean equivalence above, both directions, for arbitrary Γ and P. With Γ non-discrete, both forms are false, because `IsCofinite` fails. | keep |
| `finite_puncture_cusp_comparison`, S = {0, 1, ∞} | f = λ = θ₂⁴/θ₃⁴, Γ = Γ(2)/±1. Covolume 6·π/3 = 6.283185 = 2π(2·0 − 2 + 3), and 3 cusp orbits = \|S\|. The width at ∞ is 2, with chart q = e^{πiτ}. λ/q is 15.7746, 15.99018, 15.999982 at Im τ = 2, 3, 5 (→ 16), and (λ − 16q)/q² → −127.9999. So u′(0) = 16 ≠ 0. The width-4 coordinate q₄ gives u = 16q₄² + …, so u′(0) = 0, which is the wrong-coordinate control. | keep |
| `finite_puncture_cusp_comparison`, degenerate | \|S\| = 2 (ℂ*) is excluded by `hS`: ℂ* is covered by ℂ, so no holomorphic covering ℍ → ℂ* exists. | keep |
| Classification and isometry (§§1.6, 1.7) | φ = i(z − 1/2)/(1 − z/2): \|φ′\|/(1 − \|φ\|²) vs 1/(1 − \|z\|²) is 1.000000 / 1 at z = 0, 1.333333 / 1.333333 at z = 0.5 and at 0.3 + 0.4i, and 1.960784 / 1.960784 at −0.7i. The centre g(0) = 1/2 = a. | keep |
| Rotation (§1.2) | f = iz, g = −iz, f(0) = 0 gives c = i, \|c\| = 1. Its hypotheses (left inverse only) are weaker than line 100 says, which is harmless. | keep, module R01 |
| Normalized Riemann map (§1.1, contract) | Ω = ℍ, base i: (z − i)/(z + i) has derivative −i/2 at i (not positive). Multiplying by i gives the derivative 0.5 > 0 and value 0. | keep |
| Hurwitz (§1.1) | z/(n+1) on 𝔻: injective maps with constant limit 0, so both alternatives occur. The `∀ᶠ` binder is witnessed at `Hurwitz.lean:286`. | wording R02 |
| Branch log and root (§§2.4, 3.3) | g = 1 + z on the disc of radius R′ ∈ (R, 1): log(1 + z) with L(0) = 0. For n = 2 the root is √(1 + z), and n = 0 is excluded by `hn`. | keep |
| Jordan closure (§6.1) | Ω = 𝔻: g = id is a homeomorphism of closures. The triangle with vertices 0, 1, e^{πi/N} is bounded, open and connected with Jordan frontier (two radii and one orthogonal arc). | keep |
| Monodromy (§0.4) | The germ of log at 1 continues inside ℂ∖{0}, which is not simply connected, so the theorem does not apply. On the slit plane it applies (pinned docstring, `Continuation/Basic.lean:503`). | keep |
| `zero_balanced_connection`, `uniform_cusp_asymptotic`, §4.6, §8.1 | Untouched. Values from round 6: ₂F₁ vs series agree to 1.2e−14; γ_N quotient 4.376879230453 at N = 2; max D ≤ 0.9995 up to N = 2000. | keep (round 6) |
| `RootsCover.halfPlaneForm`, `free_deck_presentation`, §1.5, §6.3 | Untouched. Values from round 5: h_N = 2cot(π/2N) = 2, 3.464102, 4.828427, 12.627503; 13 120 reduced words with no violation. | keep (round 5) |
| Conventions; 0.1–0.6; 1.1–1.12; 2.1–2.9; 3.1–3.8; 4.1–4.5, 4.7–4.8; 5.1–5.8; 6.1–6.8; 7.1–7.10; 8.2–8.7; 9.1–9.19 | Statements untouched (only *Needs:* lines changed, checked above). Values from round 4: S(z²)(1) = −3/2; γ₂ = Γ(1/4)⁴/(4π²); half rotation 1.2111859623 at z = 0.1; C* = 7. | keep (round 4) |

**Ownership.** The diff adds no object. `roadmaps grep` for `hurwitz_injOn` hits only the ConformalMapping files (main, #998, #1791) and this README, which consumes the name and does not restate it.

## Not verifiable

- **Hem88**, Theorem 3.1: settled as waived and cited by locator only. Its *Needs:* lines in §1.7 changed, but its locator did not.
- **KR16**, §1: settled as uncertified. Untouched by the diff.
- The Tau Ceti modules `Hurwitz`, `UnitDisc.Automorphism.*`, `SchwarzPick.AutomorphismIsometry`, `RiemannMapping.*`, `Continuation.Basic`, `GlobalBranch`, `Reflection.Arc` and `Jordan.Approach` have no object files in this workspace. Their declarations were verified by reading the source at the pin, not by `#check`.

## Source issues

- none
