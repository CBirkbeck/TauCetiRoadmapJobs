# Review of EllipticPeriods (pull request #1059 at 1f40606)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 0725bcd. The new head only merges main into the branch: `TauCetiRoadmap/EllipticPeriods/` is byte-identical to the head the previous review read, the pins are unchanged, and the pull request changes nothing outside its folder. The only previous finding (R01, P3) concerned the pull request's description, and the description now names the ModularForms revision that defines §10D. No finding remains, and the gate passes.

## Previous findings

- R01 — repaired: the description's depends-on list now reads "#913 ModularCurvesPartII" and "#1706 ModularForms (§10D, the comparison of g₂, g₃ for ℤ + ℤτ with E₄, E₆)", and its Boundary paragraph says the comparison "is consumed from ModularForms §10D (open revision #1706)".

  The repair introduced no new problem. It is in the description only, so the README still names no pull-request number (gate `prnum=0`; `grep -E '#[0-9]{3,4}'` finds nothing in either file). The ModularForms head is still 75cafd52: §10D is at line 1313, the comparison `g₂(Λ_z) = (4π⁴/3)E₄(z)`, `g₃(Λ_z) = (8π⁶/27)E₆(z)` is at lines 1320–1322, and that roadmap names EllipticPeriods §2.4 as the consumer at lines 65–70 and 1536. So the edge runs one way. On main (12ed9bd), `TauCetiRoadmap/ModularForms/README.md` still has 0 occurrences of "10D", so naming the revision is required, and it is now named.

## Verified sound

**The change.**
- `git diff --stat 0725bcd..HEAD -- TauCetiRoadmap/EllipticPeriods` is empty.
- The head 1f40606 merges main. The 145 files it brings in all lie outside the folder, and `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EllipticPeriods'` is empty, so the pull request changes nothing outside its folder.
- `lake-manifest.json` is unchanged: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`.
- The folder holds exactly `README.md` (871 lines), `Suggested.lean` (270 lines) and `metadata.toml` (`topic = "math.NT"`).

**Suppliers touched by the merge from main.** On main, the merge changed `ModularCurves/README.md` and `Suggested.lean`, `ModularForms/PROGRESS.md` and `STATUS.md`, and `DiophantineApproximationAndTranscendence/PROGRESS.md` and `STATUS.md`.
- The README never cites ModularCurves (Part I): `grep 'ModularCurves[^P]'` returns 0 lines.
- DiophantineApproximationAndTranscendence §5.6 still resolves on main: the heading is at README line 3586, and `nesterenko` is at `Suggested.lean` line 3566 with the statement used in 5.1. That statement says three of `qParam 1 τ, E2 τ, E₄ τ, E₆ τ` are algebraically independent over `ℚ`.
- ModularCurvesPartII, at the head of its open pull request (07e21ad): §1.1 is at line 394, §1.3 at 446 and §1.4a at 488. `latticeSigma` (line 490), `latticeQuasiPeriod` and `latticeQuasiPeriod_legendre` (line 502, `η(ω₁)ω₂ − η(ω₂)ω₁ = 2πi` for `Im(ω₂/ω₁) > 0`) are all present and agree with 2.3 and 3.1 here.
- The resolver (`citations.md`) finds 0 cross-roadmap citations that resolve nowhere. Of the two Lean names it flags, `IsEllipticFunction.finsum_meromorphicOrderAt_eq_zero` and `IsEllipticFunction.exists_eq_div_weierstrassP`, both are declared in this roadmap's own `Suggested.lean`, at lines 104 and 109.
- No name from the brief's never-cite list occurs in either file (grep exit 1).

**The gate.**
- The worker's run at 1f40606 reported every counter 0 and `build=0 OK`.
- My rerun with `--base origin/main --order <the merge-order candidate> --build` gives the same line, `… dropped=0 readme-ids-missing=0 … depcheck=0 … stray-files=0 … outside-folder=0 source-material=0 build=0 OK`.
- A rerun without `--order` uses the configured order, which does not list this roadmap yet. It reports only `depcheck: NOT IN ORDER: EllipticPeriods (insert it after its last supplier)`. By the brief, that is not a defect.
- The dependency check with the candidate order, `--movable` and the content checkout:

```
depcheck: 239 roadmaps, 2351 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. In the candidate order, ModularCurvesPartII is at line 69 and EllipticPeriods at line 70. ModularForms and DiophantineApproximationAndTranscendence are on main.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/EllipticPeriods/Suggested.lean`, run from the worktree, exits 0 in 27 s with 32 diagnostics. All 32 are "declaration uses `sorry`"; there is nothing else.
- The file has module form (`module`, `public import Mathlib` as its single import). It has no `set_option`, no `lemma`, no `variable` or `include`, and no `#eval`, `#print` or `#synth`.
- `signatures.md` lists 40 elaborated declarations, none with a dropped section binder. That matches the review at 636e708, which compared every one of them with its README statement; the file is byte-identical since then.
- The one-tactic probe from that review carries over, because the file and the pins are unchanged: no sorried theorem closes under `first | rfl | simp_all | decide | trivial`.

**Headline theorems.** The README Summary names five, and all five are stated:
- `trdeg_periodField_le` (3.3)
- `chudnovsky` (5.1)
- `two_le_trdeg_periodField` (5.3)
- `trdeg_periodField_le_two_of_hasCM` (4.4)
- `trdeg_periodField_eq_two_of_hasCM` (5.4)

The module docstring names 2.3, `ζ = σ′/σ`, as not statable for want of ModularCurvesPartII's `latticeSigma`. That is correct at the pins.

**Seeded sample.** The targets are 0.1, 0.2, 1.3, 1.5, 2.1, 2.4, 3.1, 3.2, 3.3, 3.4, 3.5, 4.3, 5.1, 5.3 and 5.5. None of them changed. Their locators were checked in the reviews at a1d420d through 1b5ad0a:
- DLMF 23.2.5, 23.3.4 and 23.8.5;
- Chudnovsky, ICM 1978, §0 and §2.A Theorems 1 and 3, Corollary 2 and (9);
- Bost–Charles §2.2.2;
- Waldschmidt 2008, Corollaries 32 and 35.

The README flags no locator as unverified. This round I recomputed 1.5, 2.1/2.2/3.1 (Legendre), 2.4, 4.3 and the 5.1 dictionary at `τ = i` numerically, in plain double precision. Lattice sums run over `|m|, |n| ≤ 300–400`; q-series are truncated at 60 terms. The rows marked "this round" in the table below are those.

**Ownership and overlaps.**
- `overlaps.md` reports no other open pull request changing this roadmap, and no dropped id in either direction. Its one "only an open revision defines" item is ModularForms §10D, which is now named in the description (R01).
- Of the closest roadmaps in vocabulary, EllipticCurvePeriodsAndModularParametrizations (head 7a356fe) states lattice invariance of `G_k` and the scaled `g₂, g₃` dictionary at its README lines 471–476. That roadmap is not earlier in the candidate order, and README line 799 here records that it should cite 0.2 and 2.4. This is unchanged from the earlier reviews.
- No gaps are declared (no readable `design/plan.json`).

**Adversarial table.** Rows for statements the head leaves untouched are carried from the previous report (PRREVIEW-EllipticPeriods r13, at 0725bcd, values computed there or in the review at 1b5ad0a). Rows marked "this round" were recomputed at 1f40606.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 `SMul`, `G_smul` | `k = 0, 1, 2`; `k = 4, c = 2`; `c = −1` | `G₄(2Λ) = G₄/16`; odd `k`: `0 = 0`; `k ≤ 2` both sides `0` (junk) | sound | none; carried from r13 |
| 0.2, 0.3 lattice invariance, `ofUpperHalfPlane` | `ℤ[i]`, `I • L`; `(τ, 1)` | `iℤ[i] = ℤ[i]`, `G₆ = −G₆ ⇒ g₃(ℤ[i]) = 0`; `(1/τ).im < 0` | sound | none; carried from r13 |
| 0.2 Check `g₃(ℤ[i]) = 0`, this round | `140∑′ l⁻⁶` over `ℤ[i]`; `(8π⁶/27)E₆(i)` | `6.1·10⁻²⁷`; `−1.3·10⁻¹³` | sound | none |
| 1.1 `IsEllipticFunction` | `℘`, `℘′`, `℘(2z)`, constant; `ζ`, `z` | `ζ(z+1) − ζ(z) = π ≠ 0` on `ℤ[i]` | Checks discriminate | none; carried from r13 |
| 1.2 Liouville | constant; `℘`; `z ↦ z` | `℘` order `−2` at `0`; `z` not periodic | hypotheses needed | none; carried from r13 |
| 1.3 `finsum_meromorphicOrderAt_eq_zero` | `℘ − e₁`; `1`; codiscrete `0` | orders `−2 + 2 = 0`; all `0`; all `⊤`, excluded by `hne` | sound | none; carried from r13 |
| 1.4 structure | `℘′²`; `0`; `℘′` | `P = 4X³ − g₂X − g₃, Q = 1`; `P = 0`; `℘′` odd, excluded | sound | none; carried from r13 |
| 1.5 half-period values, this round | `ℤ[i]` by direct lattice sum, `N = 300` | `℘(1/2) = 6.875183`, `℘(i/2) = −6.875183`, `℘((1+i)/2) ≈ −5.5·10⁻⁶i`; `4e² = 189.07257` vs `g₂ = 60∑′l⁻⁴ = 189.07260`; `16∏(eᵢ−eⱼ)² = 6759048.6` vs `g₂³ − 27g₃² = 6759051.5` (rel. `4·10⁻⁷`) | sound | none |
| 1.6 Laurent, `G_mem_adjoin` | `n = 3, 4`; numerically `c₁` | `c₃ = g₂²/1200`, `c₄ = 3g₂g₃/6160`; `(℘(0.05) − 400)/0.05² = 9.4538` vs `g₂/20 = 9.4536` | sound | none; carried from r13 |
| 1.7 descent | `℘(2z)`; `℘`; `℘′²` | duplication at `z = 0.3 + 0.17i`: `0.75722 + 1.51668i` both sides | sound | none; carried from r13 |
| 2.1 `weierstrassZeta`, oddness, `ζ′ = −℘` | `z = l₀`; `z = 0` | junk `2/l₀` at `l₀`, odd; `ζ(0) = 0` | sound | none; carried from r13 |
| 2.2 `quasiPeriod`, `_add`, `_smul`, `_congr` | `l = 0`; `c = 2`, `l = 1/3`; `(ω₂, ω₁)` | `η(0) = 0`; `−2.207299 = ½(−4.414598)`; `_congr` needs `l ∈ Λ` | sound | none; carried from r13 |
| 2.2/2.3 quasi-periods on `ℤ[i]`, this round | `ζ(z+ω) − ζ(z)` at `z = 0.31 + 0.17i`, direct sum `N = 300` | `η(1) = 3.141601`, `η(i) = −3.141597i`; `η(1)·i − η(i)·1 = 6.283198i ≈ 2πi = 6.283185i` | agrees with ModularCurvesPartII §1.4a (line 502) | none |
| 2.4 `η(1) = G₂(τ)`, this round | `τ = i`; `τ = i√2` | `G₂(i) = (π²/3)E₂(i) = 3.1415927` vs direct `3.1416005`; `G₂(i√2) = 3.2789404` vs direct `η(1) = 3.2789434` | sound | none |
| 2.4 `η(τ) = τG₂(τ) − 2πi`, this round | `τ = i`; `τ = i√2` | `−3.1415927i` vs direct `−3.1415975i`; `−1.6460634i` vs direct `−1.6460688i` | sound | none |
| 2.4 against DLMF 23.8.5 | half-periods `ω₁ = 1/2`, `ω₃ = τ/2` | `2η₁ = π²/3 + 2π²∑_{n≥1} csc²(nπτ)` = `e2Summand 0 τ + ∑_{m≠0} e2Summand m τ` | locator supports the identity | none; carried from r13 |
| 2.4 Checks / §10D contract, this round | `τ = i`; constants | `(4π⁴/3)E₄(i) = 189.07272` vs lattice `189.07260`; `60·π⁴/45 = 4π⁴/3`, `140·2/945 = 8/27`; `(π²/3)(3/π) = π` | sound | none |
| 3.1 `periodMatrix`, `det_periodMatrix` | `ℤ[i]`; exchanged; `γ = !![0,1;1,0]` | `!![1, i; π, −iπ]`, `det = −2πi` (this round: `−6.283198i`); `+2πi`; `det γ = −1` | sound | none; carried from r13, value re-confirmed |
| 3.2 `periodField`, `two_pi_I_mem_periodField` | both orientations; `ℤ[i]` | `det = ∓2πi ∈ F`; `F = ℚ(i, π)`, trdeg `1` | sound | none; carried from r13 |
| 3.3 `trdeg_periodField_le` | four generators; `ℤ[i]`; `πℤ[i]` | `≤ 4`; `1`; `1` | sound | none; carried from r13 |
| 3.4 `periodIdeal`, `ringKrullDim_periodIdeal` | `ℤ[i]`; determinant | `X₂₂ + X₁₂X₂₁ ↦ −iπ + iπ = 0`, `X₁₂² + 1 ↦ 0`; `det ↦ −2πi ≠ 0`; `dim = 1 = trdeg ℚ(i, π)` | hypotheses met | none; carried from r13 |
| 3.5 `trdeg_periodField_smul`, `isAlgebraic_of_smul` | algebraic `c`; `c = π` | `c⁴ = g₂(L)/g₂(cL)`; `g₂(πL) = π⁻⁴` transcendental | sound | none; carried from r13 |
| 4.1 `HasCM`, `hasCM_iff`, multipliers | `τ = i, i√2, iπ`; `α = 0, N, 1+i, 1/2` | `nτ² + (m−q)τ − p = 0`, `n ≠ 0`; `iπ` no integer quadratic; `[ℤ[i] : (1+i)ℤ[i]] = 2 = |1+i|²`; `α = 0` excluded; `ω₁/2 ∉ Λ` | sound | none; carried from r13 |
| 4.2 `exists_weierstrassP_mul_eq` | `α = ±1, 2, 0, i` | `P = X`; duplication; excluded; `P = −X` | sound | none; carried from r13 |
| 4.3 `exists_quasiPeriod_mul`, this round | `Λ = ℤ + ℤi√2`, `α = i√2`; `ℤ[i]`, `α = i` | `b = η(τ) − ᾱη(1) = 2.9910586i`; at `l = τ`: `η(ατ) = −2η(1) = −6.5578808` vs `ᾱη(τ) + bτ = −6.5578808`; `b² = −8.946432` vs `−℘(τ/2)²/2 = −8.946421` (`℘(τ/2) = −4.229993`); `ℤ[i]`: `η(i) = −iη(1)`, `b = 0` | sound | none |
| 4.4 `trdeg_periodField_le_two_of_hasCM` | `ℤ[i]`; `√−2` numerically | `η₁ = 2πi/(2i) = π`; `3.278942` vs `3.278944`, `−1.646065i` both | sound | none; carried from r13 |
| 5.1 `chudnovsky` through the scaled dictionary | invert 2.4; field equality; `ℤ[i]`, `l = 1` this round | `E₄ = 3g₂l⁴/(4π⁴)`, `E₆ = 27g₃l⁶/(8π⁶)`, `E₂ = 3lη(l)/π²`; `ℚ(l/π, η/π) = ℚ(π/l, η/l)`; `3·1·π/π² = 3/π = E₂(i)` | sound | none |
| 5.2 `two_le_trdeg_adjoin_invariants` | `ℤ[i]`, `l = 1`; `πℤ[i]` | `g₂(ℤ[i]), π` a.i.; `η_{πΛ}(π) = 1` | sound | none; carried from r13 |
| 5.3 `two_le_trdeg_periodField` | `πℤ[i]`; `ℤ[i]` | `ω₁/π = 2iω₁/(2πi) ∈ F(i)`; trdeg `1` in both examples, hypothesis needed | sound | none; carried from r13 |
| 5.4 `trdeg_periodField_eq_two_of_hasCM` | `c • ℤ[i]`, `c⁴ = g₂(ℤ[i])` | `g₂ = 1`, `g₃ = 0`, `E₆(i) = 0`, `2 ≤ trdeg ≤ 2` | sound | none; carried from r13 |
| 5.5 corollaries | `ℤ[i]`; `c • ℤ[i]`; `ρ` | fails without algebraic invariants (`ω₁ = 1`); `c, π` a.i.; `(0, 1)` | sound | none; carried from r13 |
| Research context (conjecture, CM case, Schneider–Lang ownership) | symbolic; `τ = i, ρ`; `ℤ[i]`, `α = i`; open heads | `j′ = −(9i/π)ω₁²(g₃/g₂)j`; `bω₁² − (α−ᾱ)ω₁η + 2πin = 0`, `n ≠ 0`; trdeg `2` by 5.5; criterion owned by no roadmap | sound | none; carried from r13 |
| Scope line 32, the scaled dictionary for a positive pair | `(1+i, 0.3+2i)`; `(ω₁, −ω₂)`, `(−ω₁, −ω₂)`, `(ω₁, ω₂+ω₁)` | `g₂`, `g₃`, `η(ω₁)` lattice vs scaled agree to `10⁻⁵`; `τ ∉ ℍ` reversed; `(−ω₁)⁻⁴ = ω₁⁻⁴`; `E_k(τ+1) = E_k(τ)` | sound | none; carried from r13 |
| From ModularForms §10D contract (README lines 159–164), this round | `m = 2, 3`; `m = 1`; the ModularForms revision at 75cafd52; the description | `60·π⁴/45 = 4π⁴/3`; `140·2π⁶/945 = 8π⁶/27`; `m = 1` excluded; §10D at line 1313, comparison 1320–1322, consumer 1536; description names "#1706 ModularForms (§10D …)" | sound; revision named | R01 repaired |
| Gate and depcheck at 1f40606, this round | `--order <candidate> --build`; `--depcheck --movable --content` | every counter 0, `build=0 OK`; `239 roadmaps, 2351 edges, 0 problem(s)` | passes | none |

The `ζ`-difference sums converge like `N⁻¹`, so the direct values differ from π or the q-series in the sixth significant figure, at the truncation error. The q-series values are exact to double precision.

## Not verifiable

- Lang, *Introduction to Transcendental Numbers*, 1966, Ch. IV §1, Theorem 1, and Waldschmidt, *Diophantine Approximation on Linear Algebraic Groups*, Theorem 4.1 with footnote 10 (Research context): no legal copy of either book. They are cited by locator only, and no target depends on them.
- Silverman, AEC ch. VI and ATAEC chs. I–II (1.4, 2.4, 4.1): no legal copy. The 2.4 claim was checked against DLMF 23.8.5, against the pinned Mathlib `EisensteinSeries.G2`/`e2Summand`, and numerically (this round at `τ = i, i√2`).
- Lang 1971, Bull. AMS 77, p. 652 (the origin of Conjecture 34, cited through Waldschmidt 2008): not opened.
- Bost–Charles §2.2.2, Grothendieck's Montpellier folder, Chudnovsky 1976 and 1984, Nesterenko 1996, André 2004: cited by locator only, as in the previous reviews. No target's statement rests on them beyond what the checked Chudnovsky ICM report and the `nesterenko` supplier give.
- Milne, *Modular Functions and Modular Forms*, Proposition 3.10: this is the supplier ModularForms §10D's locator, not this roadmap's, and was not re-opened.

## Source issues

- none
