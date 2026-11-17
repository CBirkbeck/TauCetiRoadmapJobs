# Review of EllipticPeriods (pull request #1059 at d300669)

**Verdict:** needs changes

## R01 (P3) — The description's Layer 4 line drops the algebraic invariants from the CM bound

**Location:** pull request description, **Scope.** list, item 4: "Complex multiplication of lattices (`HasCM`), `℘(αz)` rational in `℘(z)`, the CM quasi-period relation, and the bound `≤ 2` with CM."

**Claim:** The head proves `trdeg ≤ 2` only when the lattice has CM and algebraic `g₂, g₃` (`Suggested.lean` 221–224, README 9–11). With CM alone the bound is false.

**Witness:** `L₀ = (1, i√2)`, `α = i√2`: the `b` of 4.3 is `℘(ω₂/2)/α ≈ 2.99107i`. `periodField (c • L₀)` and `ℚ(c, π, b)` have the same algebraic closure. `b = u²b₁` with `u • L₀` algebraic, so by 5.5 the transcendence degree is 3 for generic `c`.

**Repair:** Change the item to: "4. Complex multiplication of lattices (`HasCM`), `℘(αz)` rational in `℘(z)`, the CM quasi-period relation, and the bound `≤ 2` with CM and algebraic invariants." This excludes `c • L₀`, whose `g₂ = g₂(L₀)/c⁴` is transcendental for generic `c`.

## Previous findings

- none: the review of `d300669` raised no finding.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 4.4 `trdeg_periodField_le_two_of_hasCM` (R01) | `L₀ = (1, i√2)`, `α = i√2`, lattice sums `\|m\|, \|n\| ≤ 250` | `η(1) = 3.278948`, `η(i√2) = −1.646068i`, `b = 2.991065i` vs `℘(ω₂/2)/α = 2.991056i`; Legendre `6.283200i` vs `2π = 6.283185` | Lean sound (carries `h₂`, `h₃`); description's unqualified form false | R01 |
| 5.2, `π·ℤ[i]` without algebraic invariants (description, item 5) | `(ω₁, ω₂) = (π, πi)`, `\|m\|, \|n\| ≤ 300` | `η(π) = 1.0000038`, `η(πi) = −1.0000003i`; field `ℚ(π, πi, 1, −i) = ℚ(π, i)`, trdeg `1` vs README `1` | sound | none |
| 3.1 `det_periodMatrix` (Legendre, description's Boundary) | `(1, i)` and `(π, πi)` | `det P = −0.0000055 − 6.2831982i` (both) vs `−2πi = −6.2831853i`; `η(1) = 3.1416047`, `η(i) = −3.1415936i` | sound | none |
| 2.4 `quasiPeriod_ofUpperHalfPlane_one` at `τ = i` (description's Boundary) | lattice sum against the `q`-side `π²/3 − 2π²∑ 1/sinh²(πm)` | `3.1416047` vs `3.141592654 = π` (`(π²/3)E₂(i)`, `E₂(i) = 3/π`) | sound | none |

The rows for the statements the description does not touch are unchanged from the previous review, of `d300669`.

- Gate, rerun on this head with `--build` and the candidate order: every counter 0, `build=0 OK`. With the configured order the only failure is `depcheck: NOT IN ORDER: EllipticPeriods (insert it after its last supplier)`. The candidate order lists EllipticPeriods at line 443, after ModularCurvesPartII (79), so this is not a finding.
- Dependency check (`--movable`, candidate order): `depcheck: 248 roadmaps, 2567 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Elaboration of `TauCetiRoadmap/EllipticPeriods/Suggested.lean`: exit 0, 27 diagnostics, all "declaration uses `sorry`". The elaborated `trdeg_periodField_le_two_of_hasCM` takes `IsAlgebraic ℚ L.g₂`, `IsAlgebraic ℚ L.g₃` and `HasCM L`. The folder has 0 changed lines since `d300669`; `git diff origin/main...HEAD` outside the folder is empty.
- Description checked sentence by sentence against the head. It names three files, six layers and five supplier subsections (README 123–206). All 27 `### k.n` targets have a *Needs:* line and Checks, and every layer has Examples and Dependencies. The headlines are at `Suggested.lean` 175, 223, 230, 243, 247. The file is in module form (line 1) and its docstring names `ζ = σ′/σ` (39–44). The Sources list matches References (README 901–). Only item 4 is wrong (R01).
- The description's library names, opened at the pins: Tau Ceti `G_smul`, `g₂_smul`, `g₃_smul`, `weierstrassP_smul` (`TauCeti/Analysis/Complex/UpperHalfPlane/PeriodPair.lean` 600, 605, 609, 614); `weierstrassCurve_Δ_ne_zero`, `g₂_periodPair`, `g₃_periodPair` (`TauCeti/Analysis/SpecialFunctions/Elliptic/Uniformization.lean` 203, 125, 130); `quasiPeriod` (`TauCeti/Analysis/SpecialFunctions/Elliptic/WeierstrassZeta.lean` 182). The ModularForms item in "Depends on" names the commit that added §10D's comparison to main.
- Cross-roadmap citations resolved again. ModularCurvesPartII is now on main (`6393e2c`). Its §1.1 (README 393, 401) and §1.4a (487, 489, 501: `latticeSigma`, `latticeQuasiPeriod`, `latticeSigma_quasiPeriod`, `latticeQuasiPeriod_legendre`) match head `9be1eb8`, the copy reviewed before. DiophantineApproximationAndTranscendence §5.6 is at 3555, `nesterenko` at 3658 (its `Suggested.lean` 938) and `eisenstein_values_at_i` at 3660. ModularForms §10D is at 58, 145 and 1536.
- Remarks on untouched text (no change asked): README 4.4's prose does not repeat "algebraic invariants"; it inherits them through the algebraic `b` of 4.3, and the Lean statement and its docstring carry them. The generated depends-on block still lists ModularCurvesPartII as open although it has merged. EllipticIntegrals on main (its README 72) still links this roadmap under an earlier title.
- Seeded sample: no sampled target is in changed text, and the README flags no locator as unverified.

Overlap check: read EllipticCurvePeriodsAndModularParametrizations (open, `91ab26b`, unchanged), ModularForms, DiophantineApproximationAndTranscendence and EllipticIntegrals (main). I also searched main, which has gained ModularCurvesPartII and DiophantineApproximationAndTranscendencePartII, for Chudnovsky, quasi-periods and the period field: no new owner. Owners: the `g₂, g₃`–`E₄, E₆` comparison belongs to ModularForms §10D and Tau Ceti `UpperHalfPlane.g₂_periodPair`. `σ`, `latticeQuasiPeriod` and Legendre belong to ModularCurvesPartII §1.4a, and `nesterenko` to DiophantineApproximationAndTranscendence §5.6. All are consumed here.

Source independence: changed passages only, 0 passages compared with 0 sources (the folder did not change since `d300669`). The largest share is NIST DLMF ch. 23, 15 of 28 locators, as in the previous review. No layer was added, removed or reordered, so the contents were not compared again.

Research link: Layer 5 states Chudnovsky's theorem (Chudnovsky 1976; ICM 1978, §2.A, Theorem 3) and derives it from Nesterenko's theorem (Nesterenko 1996, Theorem 1). Layers 3–5 are the known cases and bounds of the elliptic Grothendieck period conjecture (Bost–Charles 2016, Conjecture 2.12 and the remark after it; Waldschmidt 2006, §3). This rests on the README's Summary and Research context.

## Not verifiable

- Silverman, AEC ch. VI and ATAEC chs. I–II (1.4, 2.4, 4.1): no legal copy found; they are cited by chapter. 2.4 is checked numerically above.
- Chudnovsky 1976 and 1984, Nesterenko 1996, André 2004, Grothendieck 1966, Lang 1966 and Waldschmidt's *Diophantine Approximation on Linear Algebraic Groups*: not read. They appear only in References and Research context, cited by locator, and no locator changed.

## Source issues

- none

## For the human reviewers

- none
