# Review of EllipticPeriods (pull request #1059 at 88b745b)

**Verdict:** accepted

This is an incremental re-review of the 96 lines changed since 69585f8. The three P3 findings of the previous review are repaired, the repairs introduce no new problem, and the gate passes. There are no findings.

## Previous findings

- R01 — repaired: README 60–65 and 175–178 give the discriminant and its non-vanishing to Tau Ceti (`PeriodPair.weierstrassCurve_Δ`, `PeriodPair.weierstrassCurve_Δ_ne_zero`); 3.5 (632–638) and the Layer 3 Dependencies (658–661) no longer cite ModularCurvesPartII §1.1.
- R02 — repaired: README 221–225 now says the missing link is `PeriodPair.quasiPeriod` with `EisensteinSeries.G2`, `E2`; 178–185 list `UpperHalfPlane.G_periodPair`, `g₂_periodPair`, `g₃_periodPair` with the transfer from `(τ, 1)` to `(1, τ)`; 2.4 *Needs:* cites them.
- R03 — repaired: `quasiPeriod_ofUpperHalfPlane_one` (`Suggested.lean` 130–132) is now the single equation `(ofUpperHalfPlane τ).quasiPeriod ⟨1, _⟩ = EisensteinSeries.G2 τ`; README 2.4 keeps `G₂(τ) = (π²/3)E₂(τ)` as Mathlib's definition of `E2`.

## Verified sound

**Gate and build.**
- The worker's gate at 88b745b: every counter 0, `build=0 OK`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `lake env lean` on `TauCetiRoadmap/EllipticPeriods/Suggested.lean`: exit 0, 27 diagnostics, all "declaration uses `sorry`". No `set_option`, no sorry'd data.
- Dependency check with `--movable` against the candidate order:

```
depcheck: 236 roadmaps, 2266 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. ModularCurvesPartII is line 71 of the candidate order, EllipticPeriods line 72.

**The changed passages** (README Scope 36–38 and 60–65, contracts 175–185, 191 and 200–204, "What is built here" 221–225, 1.5, Layer 1 Dependencies, 2.4 and its *Needs:* line, Layer 2 Dependencies, 3.5, Layer 3 Dependencies, Downstream consumers 865–868; `Suggested.lean` module docstring and `quasiPeriod_ofUpperHalfPlane_one`).

- Library declarations opened at the pins (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`), 8 in all. In `TauCeti/Analysis/SpecialFunctions/Elliptic/Uniformization.lean`: `UpperHalfPlane.G_periodPair` (112, `τ.periodPair.G k = 2 * riemannZeta k * E hk τ` for `3 ≤ k`), `UpperHalfPlane.g₂_periodPair` (125), `UpperHalfPlane.g₃_periodPair` (130), `PeriodPair.weierstrassCurve_Δ` (167), `PeriodPair.weierstrassCurve_Δ_ne_zero` (203). `PeriodPair.G_eq_of_lattice_eq : L.lattice = L'.lattice → L.G = L'.G`. Mathlib `E2/Defs.lean`: `G2` (57), `E2 = (1 / (2 * riemannZeta 2)) • G2` (61). The `#check` types agree with the types the README quotes.
- Lean probe on a scratch copy with the Uniformization import added: `L.g₂ ^ 3 - 27 * L.g₃ ^ 2 ≠ 0` follows by `rw [← PeriodPair.weierstrassCurve_Δ]; exact L.weierstrassCurve_Δ_ne_zero`, and `(ofUpperHalfPlane τ).lattice = τ.periodPair.lattice` by `simp [PeriodPair.lattice, ofUpperHalfPlane, Set.pair_comm]` (0 errors). So the route of 3.5 and the transfer sentence of 2.4 are as the README states them.
- One-tactic probe of the changed statement: `simp` makes no progress, `rfl` fails, and unfolding leaves `quasiPeriod ⟨1, _⟩ = ∑'[symmetricIcc ℤ] m, e2Summand m τ`. It is not padding; it is the statement of 2.4.
- `Suggested.lean` uses none of the Uniformization names, so its two `TauCeti.*` imports are still exactly the modules used.
- 1.5 keeps one edge to ModularCurvesPartII §1.1 (the distinct half-period values). That section at its open head states them (its README line 402), and §1.4a states `latticeQuasiPeriod_legendre` (line 502). The order line at README 228 is therefore still correct.
- ModularForms §10D is on main (its README 58, 145); DiophantineApproximationAndTranscendence is on main. The pull request description names ModularCurvesPartII as the open supplier.
- Elaborated signature of the changed theorem compared with README 2.4: same generality (`τ : UpperHalfPlane`, no lost binder).

**Headline theorems.** Unchanged since the previous report: `trdeg_periodField_le` (3.3), `chudnovsky` (5.1), `two_le_trdeg_periodField` (5.3), `trdeg_periodField_le_two_of_hasCM` (4.4), `trdeg_periodField_eq_two_of_hasCM` (5.4), all stated; `ζ = σ′/σ` named in the docstring as not statable.

**Sources.** The diff changes no source locator. The sampled targets (0.1, 1.1–1.3, 2.1, 2.3, 2.4, 3.1, 3.3, 4.1–4.3, 5.1, 5.4, 5.5) keep the locators the previous report verified against DLMF ch. 23, Chudnovsky (ICM 1978), Waldschmidt and Bost–Charles. The README flags no locator as unverified.

**Ownership and overlaps.** `overlaps.md`: no other open pull request changes this roadmap, no dropped id either way, no id that only an open revision defines. `citations.md` lists two names (`IsEllipticFunction.exists_eq_div_weierstrassP`, `IsEllipticFunction.finsum_meromorphicOrderAt_eq_zero`); both are this roadmap's own, declared in `Suggested.lean`.

**Adversarial table.** Rows marked "r16" are carried from the previous report (statements the diff leaves untouched); the others are recomputed here. Lattice sums over `|m|, |n| ≤ 150` in double precision; modular side by `q`-series.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `quasiPeriod_ofUpperHalfPlane_one` (changed): `η(1) = G₂(τ)` | `τ = i`; `τ = 0.3 + 1.1i`; Lean probe | `η(1) = 3.1415963` vs `G₂ = (π²/3)E₂ = 3.1415927`; `3.3143683 − 0.0746714i` vs `3.3143658 − 0.0746731i`; `simp`, `rfl` do not close it | sound, not padding | none |
| 2.4 companions (supplier changed to Tau Ceti) | `τ = i`; `τ = 0.3 + 1.1i`; `(τ, 1)` vs `(1, τ)` | `g₂`: `189.07184` vs `(4π⁴/3)E₄ = 189.07272`; `120.05733 + 29.36980i` vs `120.05792 + 29.37021i`; `g₃`: `0` vs `−1.3·10⁻¹³`; `332.831051 − 133.245705i` on both sides; lattices equal by `simp` | sound; Tau Ceti lines 125, 130 | none |
| 1.5, 3.5: `g₂³ − 27g₃² ≠ 0` (supplier changed to Tau Ceti) | `ℤ[i]`; `τ = 0.3 + 1.1i`; Lean probe | `6758970 ≠ 0`; `−1091798 + 3639463i ≠ 0`; proved from Tau Ceti lines 167, 203 in two steps | sound | none |
| 3.5 `isAlgebraic_of_smul` route | `g₃ = 0` (`ℤ[i]`); `g₂ = 0` (`ρ`) | `Δ ≠ 0` gives `g₂ ≠ 0`, so `c⁴ = g₂(L)/g₂(cL)`; resp. `g₃ ≠ 0`, `c⁶` a ratio | route needs only Tau Ceti | none |
| 0.1 lattice invariance | r16 | `g₃(ℤ[i]) = −3.9·10⁻²⁸`; `g₂ = 189.0722` | sound | none |
| 1.2, 1.3 Liouville, residue balance | r16 | `℘ − e₁`: `−2 + 2 = 0`; `0` excluded | sound | none |
| 1.4 structure theorem | r16 | `℘′²`: `P = 4X³ − g₂X − g₃`, `Q = 1` | sound | none |
| 2.1 scaling of `ζ` | r16 | `ζ_{2Λ}(2z) = 1.2610924 − 0.7789011i = ζ_Λ(z)/2` | sound | none |
| 2.2 `quasiPeriod_smul` | r16 | `η_{2Λ}(2) = 1.570810 = η_Λ(1)/2` | sound | none |
| 2.3 Legendre sign | r16 | `η(1)·i − η(i) = 6.283214i ≈ 2πi`; reversed basis `−2πi` | sound | none |
| 3.1 `det_periodMatrix` | r16 | `1·(−iπ) − i·π = −2πi` | sound | none |
| 3.3 `trdeg_periodField_le` | r16 | `ℚ(1, i, π, −iπ) = ℚ(i, π)`, trdeg `1 ≤ 4` | sound | none |
| 4.1 `hasCM_iff` | r16 | `α = m + nτ` gives `nτ² + (m − q)τ − p = 0`, `n ≠ 0`; converse holds | sound | none |
| 4.2 `exists_weierstrassP_mul_eq` | r16 | `α = i` on `ℤ[i]`: `P = −X`, `Q = 1` | sound | none |
| 4.3 `exists_quasiPeriod_mul` | r16 | `ℤ + ℤi√2`: `η(−2) = −6.557894` vs `ᾱη(τ) + bτ = −6.557905` | sound | none |
| 4.4 `trdeg_periodField_le_two_of_hasCM` | r16 | `(2πi + b)/(α − ᾱ) = 3.278944` vs `η(1) = 3.278952` | sound | none |
| 5.1 `chudnovsky` | r16 | at `ℤ[i]`: `E₂(i) = 3/π`; `l = 0` excluded; `π·ℤ[i]` excluded by algebraic invariants | sound | none |
| 5.3 `two_le_trdeg_periodField` | r16 | `π·ℤ[i]`: trdeg `1 < 2`, hypothesis needed | sound | none |
| 5.4 `trdeg_periodField_eq_two_of_hasCM` | r16 | `c • ℤ[i]` with `g₂ = 1`, `g₃ = 0`: `2 ≤ trdeg ≤ 2` | sound | none |
| 5.5 corollaries | r16 | `ℤ[i]`: `ω₁ = 1` algebraic without algebraic invariants | sound | none |

## Not verifiable

- Silverman, AEC ch. VI and ATAEC chs. I–II (1.4, 2.4, 4.1): no legal copy found; cited by chapter. As in the previous report, 2.4 is checked against DLMF 23.8.5 and numerically, and 4.1 by computation.
- Chudnovsky 1976 and 1984, Nesterenko 1996, André 2004, Grothendieck 1966, Lang 1966 and 1971, Waldschmidt's *Diophantine Approximation on Linear Algebraic Groups*: not read; cited by locator in References and Research context only. No target's statement rests on them alone.

## Source issues

- none
