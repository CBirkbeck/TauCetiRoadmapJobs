# Review of ConformalMappingPartII (pull request #1407 at 24d9cdf)

**Verdict:** accepted

Incremental re-review of the 8 lines changed since a182e56: README lines 73 (the Riemann-sphere charts), 99 (the normal-families contract), 114 (the Dirichlet-domain contract) and 772 (§6.1). `Suggested.lean` and `metadata.toml` are unchanged. Both round-8 findings are repaired, the repairs match the pinned declarations, and no new problem was found.

No findings.

## Previous findings

- R01 — repaired: line 99 now reads “`TauCeti.IsLocallyBoundedOn` Ω (available from `NormalFamilies`; uniformly bounded on every compact subset by one constant for the whole family)”. Under line 97's prefix this is `TauCeti.Analysis.Complex.Conformal.NormalFamilies`, which declares the predicate (`NormalFamilies.lean:101`).
- R02 — repaired: line 99 now reads “a locally uniform limit along a nontrivial filter of maps that are eventually holomorphic and eventually injective on Ω is injective on Ω or constant there”. This matches `Hurwitz.lean:283–287` (`[l.NeBot]`, `∀ᶠ … DifferentiableOn`, `∀ᶠ … Set.InjOn`).

## Verified sound

**Mechanical evidence.**
- HEAD is 24d9cdf09c5070c0b2820198d82cb6d7be0e30da and the worktree is clean. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ConformalMappingPartII'` is empty. `git diff --stat a182e56..HEAD` on the folder shows only `README.md | 8 ++++----`. The folder has three files: `README.md` (1198 lines), `Suggested.lean` (332 lines) and `metadata.toml`.
- I reran the gate at this head. It reports every scanner at 0 (`set_option=0 … statement-hygiene=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`) and exits 0. The worker's gate record also shows `build=0`.
- `lake env lean` on `TauCetiRoadmap/ConformalMappingPartII/Suggested.lean` exits 0 and prints 17 lines. All 17 are `declaration uses sorry` warnings, at lines 62, 72, 92, 108, 155, 165, 183, 201, 216, 223, 236, 250, 270, 285, 299, 311 and 322, the same set as round 8. Object files exist at the pin for the three `TauCeti.*` imports (`Fuchsian.Compactification.Manifold`, `Fuchsian.Covolume`, `Geometry.Manifold.Instances.OnePoint`).
- The dependency command reports exactly

```text
depcheck: 244 roadmaps, 2462 edges, 0 problem(s)
```

  with no UPWARD, CYCLE or `moved:` line. `ConformalMappingPartII` is line 244 of the merge order. The diff adds no supplier and no `*Needs:*` edge.

**The changed passages, against the Tau Ceti pin a91d3aa and Mathlib pin 6b7abb3.**

| Changed line | Checked against (file:line at the pin) | Result |
|---|---|---|
| 73: OnePoint charts “under” `TauCeti.Geometry.Manifold.Instances.OnePoint` | That path is one file. `affineChart` is at :68, `invChart` at :121 (source `{0}ᶜ` at :170), `invChart_infty` at :183, `invChart_coe` at :179 and `instIsManifold` at :230. The rest of the line is unchanged and also resolves: `CompactifiedQuotient` (`Compactification/Basic.lean:80`), `instChartedSpace`/`instIsManifold` (`Compactification/Manifold.lean:120, 260`), `cuspChart` (`Compactification/Cusp/Chart.lean:230`), `CuspDatum` (`Cusp/Datum.lean:167`) and `IsCofinite` (`Covolume.lean:114`) | correct |
| 99: Montel and `IsLocallyBoundedOn` | `Montel/Basic.lean:81`: `[ProperSpace E]`, `IsOpen Ω`, `∀ n, DifferentiableOn ℂ (F n) Ω`, `F : ℕ → ℂ → E` with `E` a complex normed space (:66), giving a strictly monotone subsequence converging locally uniformly to a holomorphic `g`. `NormalFamilies.lean:101` defines the predicate as `∀ K ⊆ s, IsCompact K → ∃ C, ∀ i, ∀ z ∈ K, ‖F i z‖ ≤ C`, so there is one constant per compact set | correct |
| 99: Hurwitz | `Hurwitz.lean:283–287` (variables at :102, `F : ι → ℂ → ℂ`) gives `Set.InjOn g Ω ∨ ∃ v, ∀ z ∈ Ω, g z = v`. §1.1 (README line 253) uses normalized univalent maps, which are injective at every index along `atTop` on ℕ, a nontrivial filter | correct |
| 114, 772: `Subgroup.isFundamentalDomain_dirichletDomain` “under” `…Fuchsian.DirichletDomain` | `DirichletDomain.lean` is one file. The theorem sits at :63 in the root `namespace Subgroup` (:56), with hypotheses `[DiscreteTopology Γ]` and `p ∈ freeLocus Γ ℍ`. `TauCeti.dirichletDomain` is defined at `MeasureTheory/Group/DirichletDomain/Basic.lean:71` with `G` explicit, so `TauCeti.dirichletDomain Γ̃_N UpperHalfPlane.I` is well formed | correct |

The stale strings are gone. `grep` finds no `Normed.Group` or `frequently` anywhere in the README. The only uses of `montel`/`hurwitz_injOn` outside line 99 are on line 276 (§1.1 *Needs:*), and the only use of `dirichletDomain` outside line 114 is on line 772.

**Adversarial table.** Rows for the changed statements have freshly computed values. Rows for the untouched statements are carried forward from round 8 and the rounds it cites.

| Statement | Instances and values | Result |
|---|---|---|
| `IsLocallyBoundedOn` gloss (line 99) | Take K the closed disc of radius 1/2 in 𝔻. For F_n = n·z, each member is bounded on K but the bounds n/2 = 0.5, 5, 50 at n = 1, 10, 100 grow without limit, and F_n(1/2) → ∞, so no subsequence converges. The phrase “one constant for the whole family” excludes this per-member reading. For F_n = zⁿ the bounds on K are 0.5, 9.77e−4, 7.9e−31 at n = 1, 10, 100, all at most C = 1, and the limit 0 is holomorphic | correct |
| Hurwitz contract (line 99) | Along the trivial filter ⊥, every hypothesis holds for g = z² on 𝔻. But g(0.5) = g(−0.5) = 0.25 while g(0) = 0, so g is neither injective nor constant: the added “nontrivial filter” is necessary. F_n = z/(n+1) is injective at every n with F_n(0.5) = 0.25, 0.04545, 0.00495 → 0, which gives the constant alternative | correct |
| Sphere charts (line 73) | invChart: ∞ ↦ 0, X = 2 ↦ 0.5, X = −4i ↦ 0.25i. X = 0 is outside the source `{0}ᶜ`; there Lean's junk value 0⁻¹ = 0 would collide with the image of ∞. The README restricts to “finite nonzero X” | correct |
| §6.1 Dirichlet polygon (lines 114, 772) | The Tau Ceti set `{x | ∀ g, dist x p ≤ dist x (g • p)}` equals the source's region d(gz,0) ≥ d(z,0) (CDT-journal line 2819), because each g is an isometry. The centre i is a free point: its stabilizer is compact, so it meets the discrete Γ̃_N in a finite group, which is trivial because Γ̃_N is free. The rotation r̃_N fixes i and is not in Γ̃_N (§6.4 Check). Vertices exp(πik/N): for N = 2 they are 1, i, −1, −i; for N = 3 they agree with ζ₃^(k/2), k = 0..5. Ideal 2N-gon area (2N−2)π = 6.283185, 12.566371, 25.132741 at N = 2, 3, 5 equals the covolume 2π(N−1) of the (N+1)-punctured sphere. h_N = 2cot(π/2N) = 2, 3.464102, 6.155367 | correct |
| §1.7 model metric (sampled) | McMullenRS line 5348 gives ρ = 2\|dz\|/(1−\|z\|²) on the disc, whose square is the README's `4|dz|²/(1−|z|²)²`. d(0, 0.5) = log 3 = 1.098612 = 2 artanh 0.5 | correct |
| `finite_puncture_cusp_comparison`, binder form and S = {0,1,∞} | Round 7: λ = θ₂⁴/θ₃⁴, covolume 6.283185 = 2π(2·0 − 2 + 3), λ/q → 16 (15.7746, 15.99018, 15.999982 at Im τ = 2, 3, 5); the width-4 coordinate gives u′(0) = 0 (wrong-coordinate control); \|S\| = 2 excluded by `hS` | keep (round 7) |
| Classification and isometry (§§1.6, 1.7) | Round 7: for φ = i(z − 1/2)/(1 − z/2), \|φ′\|/(1 − \|φ\|²) = 1.000000, 1.333333, 1.333333, 1.960784 at z = 0, 0.5, 0.3 + 0.4i, −0.7i, equal to 1/(1 − \|z\|²) | keep (round 7) |
| Rotation (§1.2) | Round 7: f = iz, g = −iz, f(0) = 0 gives c = i with \|c\| = 1 | keep (round 7) |
| Reflection (line 102) | Round 8: the triangle with vertices 0, 1, e^{πi/N}; `hf_maps` holds for its Riemann map with d = id on 𝔻 | keep (round 8) |
| Normalized Riemann map, branch log and root, Jordan closure, monodromy | Round 7: (z − i)/(z + i) has derivative −i/2 at i, and i times it has derivative 0.5 > 0; log(1 + z), √(1 + z); n = 0 excluded by `hn` | keep (round 7) |
| `zero_balanced_connection`, `uniform_cusp_asymptotic`, §4.6, §8.1 | Round 6: ₂F₁ and the series agree to 1.2e−14; γ_N quotient 4.376879230453 at N = 2; max D ≤ 0.9995 up to N = 2000 | keep (round 6) |
| `RootsCover.halfPlaneForm`, `free_deck_presentation`, §1.5, §6.3 | Round 5: h_N = 2, 3.464102, 4.828427, 12.627503; 13 120 reduced words with no violation | keep (round 5) |
| All other untouched targets (0.1–0.6, 1.1–1.12, 2.1–2.9, 3.1–3.8, 4.1–4.8, 5.1–5.8, 6.2–6.8, 7.1–7.10, 8.2–8.7, 9.1–9.19) | Round 4: S(z²)(1) = −3/2; γ₂ = Γ(1/4)⁴/(4π²); half rotation 1.2111859623 at z = 0.1; C* = 7 | keep (round 4) |

**Headline theorems and padding.** `Suggested.lean` is byte-identical to the file reviewed in rounds 7 and 8. Its 17 sorried theorems are `LinearEquation.global_initial_value`, `SurfaceUniformization.noncompactCoordinate`, `PointedCover.exists_cover`, `finite_puncture_cusp_comparison`, `roots_inverse_schwarzian`, `quotient_representation`, `inverseRatio.cover_inverse`, `zero_balanced_connection`, `roots_conformal_radius`, `gammaRadius.positive_expansion`, `free_deck_presentation`, `half_rotation_involution`, `local_first_main_translation`, `uniform_cusp_asymptotic`, `large_n_max_growth`, `normalized_log_derivative` and `uniform_mean_growth`. The diff touches none of them, so the earlier one-tactic probe and `#check` comparison stand; I did not re-probe.

**Seeded sample.** Two sampled targets fall in or downstream of the changed passages.
- §1.7 consumes the line-73 charts. Its locators check out:
  - CDT-journal, proof of Lemma 5.1.8 and (5.1.13): lines 2483 and 2498, on printed p.670 (page header at line 2453, next page at 2529).
  - McMullenRS §16: begins at line 5346, and line 5348 fixes the disc metric, on printed p.147 (page number at line 5372).
  - Hem88: settled as waived.
- §6.4 sits downstream of §6.1. CDT-journal Definition 5.2.3 is at line 2830, on printed p.674, and states Φ̃_N = ⟨Γ̃_N, r̃_N⟩ = ⟨r̃_N, t̃_N⟩ as written.

§6.1 is not sampled, but I read its locator anyway. CDT-journal Proposition 5.2.1 (line 2795, p.674) gives the 2N cusps at half-integer powers of ζ_N, and its proof takes the Dirichlet domain about 0 (lines 2817–2828), as the README states.

The remaining sampled targets (0.1, 1.5, 1.6, 1.8, 1.9, 4.5, 4.7, 5.5, 7.3, 7.9, 8.1, 9.15, 9.19) lie outside the diff and its dependents, so I did not re-read them. The README flags no locator as unverified.

**Ownership, overlaps, citations.**
- The diff adds no object and no supplier.
- `overlaps.md` lists no other pull request changing this roadmap, no dropped id and no id that only an open revision defines.
- The `citations.md` leads are unchanged from round 8 and none is a defect. TeschlODE and McMullenRS are source ids. The six flagged Lean names are declared in `Suggested.lean`: `initialJet` :50, `global_initial_value` :62, `noncompactCoordinate` :72, `halfPlaneForm` :142, `cover_inverse` :183 and `positive_expansion` :223.

## Not verifiable

- **Hem88**, Theorem 3.1: settled as waived; cited by locator only, and untouched by this diff.
- **KR16**, §1: settled as uncertified, and untouched by this diff.
- The Tau Ceti modules `Hurwitz`, `NormalFamilies` and `Montel.Basic` are not imported by `Suggested.lean`. I checked their declarations by reading the source at pin a91d3aa, not by `#check`.

## Source issues

- none
