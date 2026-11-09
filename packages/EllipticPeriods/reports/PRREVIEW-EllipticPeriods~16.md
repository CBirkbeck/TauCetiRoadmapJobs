# Review of EllipticPeriods (pull request #1059 at 69585f8)

**Verdict:** needs changes

This is a full review: the folder changed by 406 lines since 072605e. The three findings of the previous review are repaired. Three P3 findings remain, none blocking. Two are of the same kind as the last round's: a fact the README takes from a roadmap is already a theorem of the pinned Tau Ceti (`2fd255d9`), in a file the last round did not open (`TauCeti/Analysis/SpecialFunctions/Elliptic/Uniformization.lean`). The third is a padding conjunct in `Suggested.lean`.

## R01 (P3) — `g₂³ − 27g₃² ≠ 0` is Tau Ceti's at the pin, not ModularCurvesPartII §1.1's

**Location.** `TauCetiRoadmap/EllipticPeriods/README.md`:
- lines 58–61 (Scope): "the half-period values and `g₂³ − 27g₃² ≠ 0`: ModularCurvesPartII §§1.4a and 1.1, consumed here";
- lines 177–178 (contracts), 349–353 (1.5), 610 and 614 (3.5), and the Dependencies of Layers 1 and 3 (413, 635).

**Claim.** The non-vanishing of the discriminant is consumed from a roadmap that is still an open pull request. The pinned Tau Ceti proves it for every `PeriodPair`, so Tau Ceti is the earliest owner.

**Witness.** `TauCeti/Analysis/SpecialFunctions/Elliptic/Uniformization.lean` at the pin: `PeriodPair.weierstrassCurve_Δ : L.weierstrassCurve.Δ = L.g₂ ^ 3 - 27 * L.g₃ ^ 2` (line 167) and `PeriodPair.weierstrassCurve_Δ_ne_zero` (line 203).

**Repair.**
- Under "From Tau Ceti", add that module with the two names. Remove `g₂³ − 27g₃² ≠ 0` from the Scope bullet at 58–61 and from the §1.1 contract at 177–178.
- 3.5: cite the two Tau Ceti names in the text and in the *Needs:* line, and drop "ModularCurvesPartII §1.1" there and in the Layer 3 Dependencies. 3.5 then has no edge to an open roadmap.
- 1.5: take the non-vanishing from Tau Ceti. The distinctness of `e₁, e₂, e₃` then follows from 1.5's own identity `g₂³ − 27g₃² = 16∏(e_i − e_j)²`, so §1.1 is needed there only if you keep it as the route.

**Tested.** In a scratch copy with the extra import, `rw [← PeriodPair.weierstrassCurve_Δ]; exact L.weierstrassCurve_Δ_ne_zero` proves `L.g₂ ^ 3 - 27 * L.g₃ ^ 2 ≠ 0` (0 errors).

## R02 (P3) — the comparison of `G_k`, `g₂`, `g₃` with `E_k`, `E₄`, `E₆` is in the pinned Tau Ceti; "neither library has" it is false

**Location.** README lines 207–211: "neither library has … the connection between `PeriodPair.G` and the modular-forms library (Mathlib's `Weierstrass.lean` leaves it open; Layer 2 supplies it)". Also lines 185–190 (From ModularForms) and the 2.4 *Needs:* line (500).

**Claim.** The sentence says the pinned libraries lack the comparison and that Layer 2 supplies it. Both halves fail: the pin has it, and the README's own contract (lines 36–37, 187–190) takes it from ModularForms §10D, Layer 2 adding only the `E₂` dictionary.

**Witness.** Same Tau Ceti file: `UpperHalfPlane.G_periodPair : τ.periodPair.G k = 2 * riemannZeta k * E hk τ` for `3 ≤ k` (line 112), `UpperHalfPlane.g₂_periodPair` (125), `UpperHalfPlane.g₃_periodPair` (130).

**Repair.**
- Lines 207–211: replace the clause by what is actually missing, the connection between `PeriodPair.quasiPeriod` and `EisensteinSeries.G2`/`E2` (2.4).
- Under "From Tau Ceti", list the three names, noting that they are stated for `UpperHalfPlane.periodPair τ = (τ, 1)`, which has the lattice of `ofUpperHalfPlane τ` (0.2), so they transfer by `PeriodPair.G_eq_of_lattice_eq`.
- Cite them in the 2.4 *Needs:* line. The "From ModularForms" entry can stay as the roadmap section these declarations implement, or go.

**Tested.** In the scratch copy, `(ofUpperHalfPlane τ).lattice = τ.periodPair.lattice` closes by `simp [PeriodPair.lattice, ofUpperHalfPlane, Set.pair_comm]`, and `(ofUpperHalfPlane τ).g₂ = 4 * π ^ 4 / 3 * E₄ τ` and the `g₃` analogue follow by one `rw` chain through `G_eq_of_lattice_eq` and `g₂_periodPair`/`g₃_periodPair` (0 errors).

## R03 (P3) — the second conjunct of `quasiPeriod_ofUpperHalfPlane_one` restates Mathlib's definition of `E2`

**Location.** `TauCetiRoadmap/EllipticPeriods/Suggested.lean` lines 129–132: "`EisensteinSeries.G2 τ = (π : ℂ) ^ 2 / 3 * EisensteinSeries.E2 τ`".

**Claim.** The conjunct mentions no object of this roadmap. It is Mathlib's `E2 = (1 / (2 * riemannZeta 2)) • G2` with `riemannZeta_two`.

**Witness.** `Mathlib/NumberTheory/ModularForms/EisensteinSeries/E2/Defs.lean` line 61. In the scratch copy, `simp [EisensteinSeries.E2, riemannZeta_two]; field_simp; ring` closes it.

**Repair.** Delete the conjunct from `Suggested.lean`, leaving `(ofUpperHalfPlane τ).quasiPeriod ⟨1, _⟩ = EisensteinSeries.G2 τ`. The README keeps `G₂(τ) = (π²/3)E₂(τ)` in 2.4.

## Previous findings

- **R01 (ζ and the quasi-period map are Tau Ceti's) — repaired.** Scope, lines 30–33: "what the pinned Tau Ceti lacks about its Weierstrass `ζ` and quasi-period map". The contract at 155–162 lists the pinned names. `Suggested.lean` imports the module, the six restated declarations are gone, and every statement is on `L.quasiPeriod`.
- **R02 (the `ℂˣ` action and `G_smul` are Tau Ceti's) — repaired.** Lines 53–57 put them out of scope with owner Tau Ceti; lines 163–170 list the names; target 0.1 is now lattice invariance only. The local instance and `G_smul` are gone from `Suggested.lean`.
- **R03 (unused §1.4a edges of 2.1, 2.2) — repaired.** The *Needs:* lines at 430–432 and 454–455 name no ModularCurvesPartII section; 2.2 says "consumed in 2.3" (449–450); 2.1 carries "(DLMF 23.2.8)" (428).

## Verified sound

**Gate and build.**
- The worker's gate at 69585f8: every counter 0, `build=0 OK`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `lake env lean` on `TauCetiRoadmap/EllipticPeriods/Suggested.lean`: exit 0, 27 diagnostics, all "declaration uses `sorry`". No `set_option`, no sorry'd data; the 4 definitions and `ofUpperHalfPlane` have real bodies.
- Dependency check with `--movable`:

```
depcheck: 236 roadmaps, 2263 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. ModularCurvesPartII is line 71 of the candidate order, EllipticPeriods line 72.

**Library declarations at the pins** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`). `#check` of 36 names the README cites, in a scratch copy, all found with the types the README gives; the remaining names below were opened in the pinned sources at the lines given:
- Tau Ceti `WeierstrassZeta.lean`: `weierstrassZeta` (71), `hasSumLocallyUniformly_weierstrassZeta` (96), `hasDerivAt_weierstrassZeta` (122), `weierstrassZeta_neg` (151), `quasiPeriod` (182), `weierstrassZeta_coe` (197), `weierstrassZeta_add_coe` (202), `quasiPeriod_eq_intCast_mul_add` (214), `quasiPeriod_eq_two_mul_weierstrassZeta` (223).
- Tau Ceti `UpperHalfPlane/PeriodPair.lean`: `periodPair` (99, `(z, 1)`), `instSMulUnitsComplex` (556), `instMulActionUnitsComplex` (575), `lattice_smul` (580), `latticeSMulEquiv` (584), `G_smul` (600), `g₂_smul` (605), `g₃_smul` (609), `weierstrassP_smul` (614), `G_eq_of_lattice_eq` (632), `exists_lattice_eq_smul_periodPair` (653).
- Tau Ceti `TauCeti.Contour.residue` (`Residue/Basic.lean` 80), `classicalResidueTheorem_nullHomologous` (`Residue/Cycle.lean` 226), `TauCeti.ringKrullDim_eq_toNat_trdeg` (`KrullDimension/FiniteType.lean` 227).
- Mathlib `Weierstrass.lean`: `PeriodPair` (60), `weierstrassP` (268), `order_weierstrassP` (921), `G` (945), `g₂`, `g₃` (957, 960), `derivWeierstrassP_sq` (1075); `E2/Defs.lean`: `e2Summand` (34), `G2` (57), `E2` (61), `D2` (64); `E2/Transform.lean`: `G2_S_transform` (193); `trdeg_le_cardinalMk`, `isTranscendenceBasis_of_le_trdeg_of_finite`, `Differentiable.apply_eq_apply_of_bounded`, `ZSpan.fundamentalDomain`.

Not at the pin (grep of both libraries by object): meromorphy of `ζ`, a scaling law for `ζ` or `quasiPeriod` under `c • L` (Tau Ceti has only the `SL(2, ℤ)` forms `weierstrassZeta_periodPair_smul`, `quasiPeriod_periodPair_smul`), Legendre's relation, `η(1) = G₂(τ)`, elliptic functions on a `PeriodPair`, the period field, lattice CM. So Layers 1–5 and what 2.1–2.4 keep are not duplicated, apart from R01 and R02.

**One-tactic probe.** Nine statements tried with `simp`/`fun_prop`/`simpa` on the scratch copy: `quasiPeriod_congr`, `meromorphic_weierstrassZeta`, `trdeg_periodField_le`, `HasCM.smul`, `trdeg_periodField_smul`, `two_pi_I_mem_periodField`, `ringKrullDim_periodIdeal`: none closes. The `G2`/`E2` conjunct closes (R03). `trdeg_periodField_eq_two_of_hasCM` is `le_antisymm` of two headlines of the file, and is itself the headline of 5.4.

**Headline theorems.** `trdeg_periodField_le` (3.3), `chudnovsky` (5.1), `two_le_trdeg_periodField` (5.3), `trdeg_periodField_le_two_of_hasCM` (4.4), `trdeg_periodField_eq_two_of_hasCM` (5.4): all stated on the roadmap's `periodField` and `HasCM`. The docstring names `ζ = σ′/σ` as not statable (no `latticeSigma` at the pins). I compared the 33 elaborated signatures with the README statements; none has lost a binder and the generality agrees.

**Sources read this round** (seeded sample; ids are those of the fetch).
- 2.1: DLMF 23.2.5, the series (dlmf-23-2 line 232); 23.2.8, `ζ = σ′/σ` (line 347); the Laurent expansion is 23.9.3 (dlmf-23-9 line 122).
- 2.3, conventions: DLMF 23.2.12 `η_j = ζ(ω_j)` (dlmf-23-2 line 521), 23.2.14 with value `πi/2` (line 572).
- 1.5: DLMF 23.3.4 (dlmf-23-3 line 182). 1.6: DLMF 23.9.4–23.9.5 (dlmf-23-9 lines 156, 189); with DLMF's index shifted by one the recursion is the README's.
- 2.4: DLMF 23.8.5 (dlmf-23-8 line 215); with `csc²(nπτ) = −4qⁿ/(1 − qⁿ)²` it is `η(1) = (π²/3)E₂(τ)`.
- 5.1–5.5: Chudnovsky, ICM 1978, §0 (algebraic invariants, the meaning of `#S`; chudnovsky-icm1978 lines 14557–14562), §2.A Theorem 1, Corollary 2, Theorem 3, display (4) (lines 14698–14717, printed p. 343), display (9) (p. 344). Each supports the statement as written, including that Corollary 2 is for CM only.
- 5.2: Waldschmidt, arXiv math/0502582, §3, Théorème 3.1 and the statement after it (waldschmidt-2005 lines 309, 329–334), Théorème 3.4 (line 367).
- 5.4: Bost–Charles, arXiv v2, §2.2.2, Conjecture 2.12 and the remark on the CM case (bost-charles lines 456–472).
- Research context: Waldschmidt 2008, Corollary 32 (p. 166), Conjecture 34 and Corollary 35 (p. 167) (waldschmidt-2008 lines 1118–1137).

0.1, 0.2, 1.3, 1.7, 3.3–3.5 and 4.2 cite no external source; their inputs are the library declarations above. The README flags no locator as unverified.

**Cross-roadmap citations resolved** (9).
- ModularCurvesPartII at its open head: §1.1 (discriminant, Laurent leading terms and distinct half-period values, in its proof route), §1.3 (the homotheties `u⁻⁴`, `u⁻⁶`), §1.4a (`latticeSigma`, `latticeQuasiPeriod`, `latticeSigma_quasiPeriod`, `latticeQuasiPeriod_legendre` with `2πi` for `Im(ω₂/ω₁) > 0`).
- On main: ModularForms §10D (README 1320–1321, 1400; it cites this roadmap's §2.4 at 65 and 1536); DiophantineApproximationAndTranscendence §5.6, `nesterenko` and `eisenstein_values_at_i` (`Suggested.lean` 3566, 3572; the form with a 3-element subset of the four values); EllipticCurves (`HasGeometricCM`, README 512; uniformisation excluded, 150); EllipticIntegrals (README 71–72); ComplexTori; ContourIntegration under `Completed/`.
- The out-of-scope owners AbelianSchemesAndArithmeticModuli, ComplexComparisonPartII, MotivesAndAlgebraicCycles, PeriodsAndSpecialValues and ComplexMultiplicationAndExplicitReciprocity are in the candidate order; none is a *Needs:* edge.

**Ownership and overlaps.** `overlaps.md`: no other pull request changes this roadmap, no dropped id either way. `roadmaps grep` for `IsEllipticFunction`, `periodField`, `HasCM`, `periodMatrix`, `chudnovsky` over the open heads and main finds no second owner (Polylogarithms' `periodMatrix` is in its own namespace, for a different object). EllipticCurvePeriodsAndModularParametrizations (head 91ab26b) defers `ζ`, quasi-periods, Legendre and transcendence of periods (its lines 109–110, 441). No gaps are declared.

**Adversarial table.** Lattice sums over `|m|, |n| ≤ 200` in double precision; `ζ`-differences are accurate to about `3·10⁻⁵`.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 lattice invariance, Checks | `ℤ[i]`, `c = i`, `k = 6, 4` | `g₃(ℤ[i]) = −3.9·10⁻²⁸`; `g₂ = 189.0722`; `G₄/i⁴ = G₄` | sound | none |
| 0.2 `ofUpperHalfPlane` vs Tau Ceti `periodPair` | `(1, τ)`, `(τ, 1)`; Lean probe | lattices equal by `simp`; `Im(τ/1) > 0`, `Im(1/τ) < 0` | sound; a kept variant with its difference stated | none |
| 1.3 `finsum_meromorphicOrderAt_eq_zero` | `℘ − e₁`; `1`; `0`; type `WithTop ℤ` | `−2 + 2 = 0`; all `0`; `0` excluded by `hne`, so no order is `⊤` | sound | none |
| 1.4 structure | `℘′²`; `0`; `℘′` | `P = 4X³ − g₂X − g₃, Q = 1`; `P = 0, Q = 1`; odd, excluded | sound | none |
| 1.5 half-period values; `Δ ≠ 0` | `ℤ[i]`: roots `0, ±e` | `16·e²·e²·4e² = 64e⁶ = (4e²)³`; `g₂³ − 27g₃² = 6759011.6 ≠ 0`; Tau Ceti lines 167, 203 | true; owner of `≠ 0` is Tau Ceti | R01 |
| 1.6 Laurent, `G_mem_adjoin` | `n = 3, 4`; `k = 2, 3, 4` | `9c₃ = 3c₁²`, `c₃ = g₂²/1200`: `29.79041` vs `29.79025`; `22c₄ = 6c₁c₂`, `c₄ = 3g₂g₃/6160`; `G₈ = c₃/7` | sound | none |
| 1.7 descent | `℘(2z)`; `℘`; `℘′²` | duplication formula has coefficients in `ℚ(g₂, g₃)`; `P = X, Q = 1`; `P = 4X³ − g₂X − g₃` needs `g₂, g₃ ∈ K` | sound | none |
| 2.1 scaling of `ζ` | `ℤ[i]`, `c = 2`, `z = 0.3 + 0.17i` | `ζ_{2Λ}(2z) = 1.2610924 − 0.7789011i = ζ_Λ(z)/2`; weight `c` would give four times that | sound | none |
| 2.2 `quasiPeriod_smul` | `c = 2`; `c = i` | `η_{2Λ}(2) = 1.570810 = η_Λ(1)/2`; `η(i) = −3.141595i = −iη(1)` | sound | none |
| 2.3 Legendre sign | `ℤ[i]`, basis `(1, i)` and `(i, 1)` | `η(1)·i − η(i) = 6.283214i ≈ 2πi`; reversed `−2πi` | agrees with §1.4a | none |
| 2.4 dictionary | `τ = i, i√2, 0.3 + 1.1i`, Mathlib's `G2` order | `η(1)`: `3.141620, 3.278952, 3.314384 − 0.074661i`; `G₂(τ)`: `3.141593, 3.278940, 3.314366 − 0.074673i`; `η(τ)` vs `τG₂ − 2πi`: `−1.646070i` vs `−1.646063i`, `1.076433 − 2.659790i` vs `1.076450 − 2.659785i` | sound | none |
| 2.4 companions `g₂, g₃` | `60·π⁴/45`, `140·2/945`; Lean probe | `4π⁴/3`, `8/27`; proved from Tau Ceti by one `rw` chain | true; in Tau Ceti at the pin | R02 |
| `quasiPeriod_ofUpperHalfPlane_one`, second conjunct | Lean probe | closes by `simp; field_simp; ring` | padding | R03 |
| 3.1 `det_periodMatrix` | `ℤ[i]`; `(i, 1)` | `1·(−iπ) − i·π = −2πi`; `i·π − 1·(−iπ) = +2πi` | sound | none |
| 3.2, 3.3 period field, `≤ 4` | `ℤ[i]`; `π·ℤ[i]` | `ℚ(1, i, π, −iπ) = ℚ(i, π)`, trdeg `1`; `ℚ(π, πi, 1, −i) = ℚ(π, i)`, trdeg `1`; both `≤ 4` | sound | none |
| 3.4 `periodIdeal` | `ℤ[i]` | `X₂₂ + X₁₂X₂₁ ↦ −iπ + iπ = 0`; `X₁₂² + 1 ↦ 0`; `det ↦ −2πi ≠ 0`; dimension `1` | sound | none |
| 3.5 homotheties | `c = π` on `g₂ = 1, g₃ = 0`; `c = i` | `g₂(πL) = π⁻⁴` transcendental; same lattice at `c = i`; proof needs `Δ ≠ 0` | sound; supplier of `Δ ≠ 0` | R01 |
| 4.1 `hasCM_iff` | `τ = i, i√2, iπ`; `α = aτ`; `α = 1/2` | `α = m + nτ` gives `nτ² + (m − q)τ − p = 0`, `n ≠ 0`; conversely `aτ·τ = −bτ − c`; `ω₁/2 ∉ Λ` | both directions hold | none |
| 4.2 `exists_weierstrassP_mul_eq` | `α = 1, 2, i` | `P = X, Q = 1`; duplication, `Q` with roots `e_i`; `P = −X` on `ℤ[i]` | sound | none |
| 4.3 `exists_quasiPeriod_mul` | `ℤ + ℤi√2`, `α = i√2`; `α = 0`; `α = 2` | `b = 2.991069i` from `l = 1`; at `l = τ`: `η(−2) = −6.557894` vs `ᾱη(τ) + bτ = −6.557905`; residue balance `|α|²/α = ᾱ`; `b = 0` for `α = 0, 2` | sound | none |
| 4.4 formulas | same lattice, `m = 0, n = 1`; `ℤ[i]` | `(2πi + b)/(α − ᾱ) = 3.278944` vs `η(1) = 3.278952`; `2πi/(2i) = π` | sound | none |
| 5.1 `chudnovsky` | inverted dictionary; `l = 0`; `π·ℤ[i]` | `E₄ = (3g₂/4)(l/π)⁴`, `E₆ = (27g₃/8)(l/π)⁶`, `E₂ = 3(l/π)(η/π)`; at `ℤ[i]`: `3·(1/π)·1 = 3/π = E₂(i)`; both entries `0` at `l = 0`; `l/π = 1` on `π·ℤ[i]` | hypotheses needed and present | none |
| 5.2 without algebraic invariants | `ℤ[i]`, `l = 1`; `π·ℤ[i]`, `l = π` | set `{g₂, 0, 1/π, 1}`; set `{π⁻⁴g₂(ℤ[i]), 0, 1, 1/π}`: both say `g₂(ℤ[i])`, `π` independent | consistent | none |
| 5.3 lower bound | `π·ℤ[i]`; `ℤ[i]` | trdeg `1 < 2` in both; so `g₂` is transcendental in each | hypothesis needed | none |
| 5.4 CM case | `c • ℤ[i]`, `c⁴ = g₂(ℤ[i])` | `g₂ = 1`, `g₃ = 0`; `2 ≤ trdeg ≤ 2` | sound | none |
| 5.5 corollaries | `ℤ[i]`; `ρ` | `ω₁ = 1` algebraic without algebraic invariants; `(g₂, g₃) = (0, 1)` after scaling | sound | none |

## Not verifiable

- Silverman, AEC ch. VI and ATAEC chs. I–II (1.4, 2.4, 4.1): no legal copy found; cited by chapter. 2.4 is checked against DLMF 23.8.5 and numerically; 4.1's multiplier statements are checked by the computation in the table.
- Chudnovsky 1976 and 1984, Nesterenko 1996, André 2004, Grothendieck 1966, Lang 1966 and 1971, Waldschmidt's *Diophantine Approximation on Linear Algebraic Groups*: not read; cited by locator in References and Research context only. No target's statement rests on them alone.

## Source issues

- none
