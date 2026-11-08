# Review of EllipticPeriods (pull request #1059 at 1b5ad0a)

**Verdict:** needs changes

Incremental re-review of the 2 lines of `TauCetiRoadmap/EllipticPeriods/` that changed since 2e239b9: README line 456 in 2.4 now reads "Prove `η(1) = G₂(τ)` row by row", which repairs the previous R02 and is correct. One previous finding is unrepaired (R01, the pull request's description) and the gate now fails on one dropped name (R02, new; the name was added to the project's list after the previous review's gate run). Both are P3; nothing blocks.

## R01 (P3) — ModularForms §10D is defined only at an open revision, and the pull request does not name that revision

Location: `TauCetiRoadmap/EllipticPeriods/README.md` line 34 ("`ℤ + ℤτ` is ModularForms §10D's … and is consumed"), lines 159–164 (`### From ModularForms`, "§10D, the lattice–modular comparison …"), and lines 455, 465, 489 and 800. The pull request's description names only "#913 ModularCurvesPartII" in its depends-on list.

Claim: ModularForms §10D supplies `g₂ = (4π⁴/3)E₄(τ)` and `g₃ = (8π⁶/27)E₆(τ)` for `ℤ + ℤτ`, which 2.4 and 5.1 consume.

Witness: on main (3b3f7ef), `TauCetiRoadmap/ModularForms/README.md` contains no "10D" (0 occurrences). The section exists only at the head of the open ModularForms revision, now 75cafd52 (2026-11-07 21:09): the heading `### 10D Uniformisation of the level moduli and algebraicity of sections` is at line 1313, the comparison at lines 1321–1322, and the naming of EllipticPeriods §2.4 as its consumer at line 1536. `scratch/overlaps.md` lists this as "only an open revision defines".

Repair: add the ModularForms revision to the depends-on list of the pull request's description, after ModularCurvesPartII, and say in the description's "Boundary" paragraph that the `g₂, g₃` comparison for `ℤ + ℤτ` comes from ModularForms §10D. The README needs no edit, and it must not name a pull-request number. Tested: all six README citations of §10D (lines 34, 161, 455, 465, 489, 800) resolve at 75cafd52 to the statement the contract quotes (lines 1321–1322).

## R02 (P3) — The gate fails: line 819 names a roadmap on the project's dropped-names list

Location: `TauCetiRoadmap/EllipticPeriods/README.md` line 819, in Research context: "no roadmap owns that form of the criterion (LinearFormsInLogarithms 5.7 covers `ℂ^{d₀} × (ℂˣ)^{d₁}` only)."

Claim: the gate's rule "no name of the project's dropped-names list" (`gate.md`: `dropped=1`, FAIL).

Witness: LinearFormsInLogarithms is on the dropped-names list (and in this brief's "never cite" list). The list was last changed on 2026-11-07 at 23:54, after the previous review's gate run at 2e239b9 showed `dropped=0`, so the failure is new to this round, not to the text. The name occurs once in the README (line 819 only). It is not a supplier citation: the sentence says no roadmap owns the meromorphic Schneider–Lang criterion, and cites Lang 1966 and Waldschmidt for it.

Repair: end the sentence at "no roadmap owns that form of the criterion." and delete the parenthetical "(LinearFormsInLogarithms 5.7 covers `ℂ^{d₀} × (ℂˣ)^{d₁}` only)". Tested on the instance: with the parenthetical removed, `grep -c LinearFormsInLogarithms README.md` is 0, so the `dropped` counter returns to 0; the sentence still says what the paragraph needs (Schneider's theorem is a corollary of a criterion no roadmap owns, with the Lang and Waldschmidt locators intact). Nothing else in the README names a dropped roadmap.

## Previous findings

- R01 — not repaired: the description's depends-on list still names only "#913 ModularCurvesPartII"; the README's six §10D citations resolve only at the ModularForms revision's head (now 75cafd52, lines 1313 and 1321–1322). Raised again as R01.
- R02 — repaired: line 456 now reads "Prove `η(1) = G₂(τ)` row by row: the series for `ζ(z+1) − ζ(z)` has summands `O(|l|⁻³)` …", naming the identity the argument proves. The repair introduced no new problem (checked below).

## Verified sound

**The change.** `git diff --stat 2e239b9..HEAD` lists only `README.md` (+1/−1, line 456). `Suggested.lean`, `lake-manifest.json` and `lean-toolchain` are unchanged, and `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EllipticPeriods'` is empty. The pins are unchanged: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`. The worktree is clean.

**The repaired sentence against what it cites.** The row-by-row argument of lines 456–460 proves the first conjunct of `quasiPeriod_ofUpperHalfPlane_one` (`Suggested.lean` lines 162–164: `quasiPeriod (ofUpperHalfPlane τ) 1 = EisensteinSeries.G2 τ ∧ G2 τ = π²/3 · E2 τ`), with `ofUpperHalfPlane τ` the pair `(1, τ)` (lines 73–75) and `quasiPeriod L l = ζ(ω₁/2 + l) − ζ(ω₁/2)` (line 136), base-point independent by `weierstrassZeta_add_coe` (line 146). Each step was checked:

- The summand of `ζ(z+1) − ζ(z)`, with the `1/l²` correction term included, is `1/(z+1−l) − 1/(z−l) + 1/l² = −1/(w(w−1)) + 1/l²` with `w = l − z`, and `−1/(w(w−1)) = −1/w² − 1/w³ − …`, `1/l² − 1/w² = O(|l|⁻³)`: so `O(|l|⁻³)` and absolutely convergent, as line 457 says. Grouping by rows is therefore allowed.
- In a row `l = mτ + n`, `1/(z+1−l) − 1/(z−l) = f(n−1) − f(n)` for `f(n) = 1/(z−mτ−n)`, absolutely convergent in `n` (`O(n⁻²)`), with symmetric partial sums `f(−N−1) − f(N) → 0`; what remains is `∑_n (mτ+n)⁻²`.
- Mathlib at the pin, `Mathlib/NumberTheory/ModularForms/EisensteinSeries/E2/Defs.lean`: `e2Summand m z = ∑' n, eisSummand 2 ![m, n] z` (line 34); `e2Summand 0 z = 2 * riemannZeta 2` (line 40, `e2Summand_zero_eq_two_riemannZeta_two`); `G2 z = ∑'[symmetricIcc ℤ] m, e2Summand m z` (line 57); `E2 = (1 / (2 * riemannZeta 2)) • G2` (line 61). So the parenthetical "`e2Summand 0 τ = 2ζ(2)`" and "the symmetric sum defining `G2`" are the pinned definitions, and `G₂ = 2ζ(2)E₂ = (π²/3)E₂`.
- The outer sum is absolutely convergent because `e2Summand m τ = π² csc²(πmτ)` for `m ≠ 0` decays like `e^{−2π|m| Im τ}`; so its unconditional value equals the `symmetricIcc` value.
- DLMF 23.8.5 (cache `911959ce…` line 217, the `dlmf23-8` text of the earlier reviews) in half-periods `ω₁ = 1/2`, `ω₃ = τ/2`: `η(1) = 2η₁ = π²/3 + 2π² ∑_{n≥1} csc²(nπτ)`, which is `e2Summand 0 τ + ∑_{m≠0} e2Summand m τ`, the same row sum.

**Numerical witness (computed this round).** At `τ = 0.3 + 1.2i`, base point `z = 0.37 + 0.21i`, lattice box `|m|, |n| ≤ 300`, `q`-series to 80 terms, row sum `|m| ≤ 60`:

| Quantity | Value |
| --- | --- |
| `η(1) = ζ(z+1) − ζ(z)` (lattice sum) | `3.302893 − 0.039866i` |
| `G₂(τ) = (π²/3)(1 − 24∑σ₁(n)qⁿ)` | `3.302890 − 0.039872i` |
| `π²/3 + ∑_{m≠0} π² csc²(πmτ)` (the rows) | `3.302890 − 0.039872i` |
| `e2Summand 1 τ` by direct `n`-sum (`|n| ≤ 20000`) vs `π² csc²(πτ)` | `0.00640 − 0.019942i` vs `0.00650 − 0.019942i` (tail `≈ 2/20000`) |
| `η(τ) = τG₂(τ) − 2πi` (line 460) vs `ζ(z+τ) − ζ(z)` | `1.038713 − 2.331679i` vs `1.038707 − 2.331686i` |
| `τ = i`: `η(1)` vs `π` | `3.141601` vs `3.141593` |

**Gate.** The worker's run at 1b5ad0a has every counter at 0 except `dropped=1` (R02) and ends `build=0 FAIL`. My rerun without the build, with the merge-order candidate, gives the same counters with `depcheck=0`. The dependency check with the order and `--movable`:

```
depcheck: 245 roadmaps, 2467 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line for this roadmap. ModularCurvesPartII is at position 79 and EllipticPeriods at 80; ModularForms and DiophantineApproximationAndTranscendence are on main.

**Elaboration.** `scratch/signatures/SignatureCheck.lean` is `Suggested.lean` plus 40 `#check @` lines (`diff` shows exactly those 40 added lines). `lake env lean` on it from the worktree: exit 0 in 5 s, 32 `declaration uses sorry` warnings and no other diagnostic. The Lean file is unchanged since 636e708, so the 40 elaborated types are those of `signatures.md` (compared in the previous review); the file has no `variable` or `include` line. Single `import Mathlib`, no `set_option`, no `lemma`, no sorried data, 270 lines.

**One-tactic probe.** On a scratch copy with all 32 `sorry` sites replaced by `first | rfl | simp_all | decide | trivial`: 33 errors at exactly the 32 sites (lines 90–268; line 148 reports twice) and no `sorry` warning left. No sorried theorem closes in one tactic, so there is no padding. The two names `citations.md` could not find (`IsEllipticFunction.finsum_meromorphicOrderAt_eq_zero`, `IsEllipticFunction.exists_eq_div_weierstrassP`) are this roadmap's own declarations (`Suggested.lean` lines 104 and 109).

**Headlines.** The module docstring lists five headlines, 3.3 `trdeg_periodField_le`, 5.1 `chudnovsky`, 5.3 `two_le_trdeg_periodField`, 4.4 `trdeg_periodField_le_two_of_hasCM`, 5.4 `trdeg_periodField_eq_two_of_hasCM`; all stated, unchanged. 2.3 `ζ = σ′/σ` is named as not statable (`latticeSigma` missing at the pins). The change touches no Lean statement.

**Seeded sample.** This round's sample is 0.1, 0.2, 1.1, 1.3, 1.6, 2.1, 2.3, 3.1, 3.2, 3.3, 4.4, 5.1, 5.2, 5.3 and 5.5. None falls in the changed line. The changed line's own locator, DLMF 23.8.5, was re-read in the cache this round (above); 2.3, which the next sentence invokes for `η(τ) = τG₂ − 2πi`, is unchanged and its Legendre value was recomputed above (`η(τ)` row of the table). The fifteen sampled targets are byte-identical to 636e708 and their locators were checked in the reviews at a1d420d through 636e708 (DLMF 23.2.5, 23.2.14, 23.3.4, 23.9.5; Chudnovsky ICM 1978 §0, Theorems 1 and 3, Corollary 2, display (4); Waldschmidt math/0502582 Théorème 3.1; Waldschmidt 2008 Corollaries 32 and 35).

**Overlaps, citations and ownership.** `overlaps.md` reports no other open pull request that changes this roadmap and no dropped id in either direction; its one "only an open revision defines" item is R01. ModularForms #1706 moved from 3453d2b to 75cafd52 since the previous review; every §10D citation was re-resolved there (lines 1313, 1321–1322, 1536), and its lines 65–71 and 1536 make the edge one-way (EllipticPeriods consumes §10D; nothing of EllipticPeriods is cited there). `citations.md` lists no cross-roadmap citation that resolves nowhere. The ownership of the scaled dictionary against EllipticCurvePeriodsAndModularParametrizations is as in the previous review (that roadmap is placed after this one and the duplicate is its to cite); the change does not touch it.

**Adversarial table.** Rows for statements the change leaves untouched are carried from the previous report (at 2e239b9, values computed there or at 636e708); the last three rows are computed this round.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 `SMul`, `G_smul` | `k = 0, 1, 2`; `k = 4, c = 2`; `c = −1` | `G₄(2Λ) = G₄/16`; odd `k`: `0 = 0`; `k ≤ 2` both sides `0` (junk) | sound | none; carried from the review at 2e239b9 |
| 0.2, 0.3 lattice invariance, `ofUpperHalfPlane` | `ℤ[i]`, `I • L`; `(τ, 1)` | `iℤ[i] = ℤ[i]`, `G₆ = −G₆ ⇒ g₃(ℤ[i]) = 0`; `(1/τ).im < 0` | sound | none; carried from the review at 2e239b9 |
| 1.1 `IsEllipticFunction` | `℘`, `℘′`, `℘(2z)`, constant; `ζ`, `z` | `ζ(z+1) − ζ(z) = π ≠ 0` on `ℤ[i]` | Checks discriminate | none; carried from the review at 2e239b9 |
| 1.2 Liouville | constant; `℘`; `z ↦ z` | `℘` order `−2` at `0`; `z` not periodic | hypotheses needed | none; carried from the review at 2e239b9 |
| 1.3 `finsum_meromorphicOrderAt_eq_zero` | `℘ − e₁`; `1`; codiscrete `0` | orders `−2 + 2 = 0`; all `0`; all `⊤`, excluded by `hne` | sound | none; carried from the review at 2e239b9 |
| 1.4 structure | `℘′²`; `0`; `℘′` | `P = 4X³ − g₂X − g₃, Q = 1`; `P = 0`; `℘′` odd, excluded | sound | none; carried from the review at 2e239b9 |
| 1.5 half-period values | `ℤ[i]`; `ℤ[ρ]` | `℘(1/2) = 6.87518 = −℘(i/2)`, `4e² = 189.0726 = g₂`; `64e⁶ = g₂³`; `g₂(ℤ[ρ]) = 0` | sound | none; carried from the review at 2e239b9 |
| 1.6 Laurent, `G_mem_adjoin` | `n = 3, 4`; numerically `c₁` | `c₃ = g₂²/1200`, `c₄ = 3g₂g₃/6160`; `(℘(0.05) − 400)/0.05² = 9.4538` vs `g₂/20 = 9.4536` | sound | none; carried from the review at 2e239b9 |
| 1.7 descent | `℘(2z)`; `℘`; `℘′²` | duplication at `z = 0.3 + 0.17i`: `0.75722 + 1.51668i` both sides | sound | none; carried from the review at 2e239b9 |
| 2.1 `weierstrassZeta`, oddness, `ζ′ = −℘` | `z = l₀`; `z = 0` | junk `2/l₀` at `l₀`, odd; `ζ(0) = 0` | sound | none; carried from the review at 2e239b9 |
| 2.2 `quasiPeriod`, `_add`, `_smul`, `_congr` | `l = 0`; `c = 2`, `l = 1/3`; `(ω₂, ω₁)` | `η(0) = 0`; `−2.207299 = ½(−4.414598)`; `_congr` needs `l ∈ Λ` | sound | none; carried from the review at 2e239b9 |
| 2.3 Legendre, `ζ = σ′/σ` | `ℤ[i]`, both bases | `η(1) = 3.14160`, `η(i) = −3.14159i`, `η(1)i − η(i) = 6.28319i = 2πi`; reversed `−2πi` | agrees with ModularCurvesPartII §1.4a | none; carried from the review at 2e239b9 |
| 3.1 `periodMatrix`, `det_periodMatrix` | `ℤ[i]`; exchanged; `γ = !![0,1;1,0]` | `!![1, i; π, −iπ]`, `det = −2πi`; `+2πi`; `det γ = −1` | sound | none; carried from the review at 2e239b9 |
| 3.2 `periodField`, `two_pi_I_mem_periodField` | both orientations; `ℤ[i]` | `det = ∓2πi ∈ F`; `F = ℚ(i, π)`, trdeg `1` | sound | none; carried from the review at 2e239b9 |
| 3.3 `trdeg_periodField_le` | four generators; `ℤ[i]`; `πℤ[i]` | `≤ 4`; `1`; `1` | sound | none; carried from the review at 2e239b9 |
| 3.4 `periodIdeal`, `ringKrullDim_periodIdeal` | `ℤ[i]`; determinant | `X₂₂ + X₁₂X₂₁ ↦ 0`, `X₁₂² + 1 ↦ 0`; `det ↦ −2πi ≠ 0`; `dim = 1 = trdeg ℚ(i, π)` | hypotheses met | none; carried from the review at 2e239b9 |
| 3.5 `trdeg_periodField_smul`, `isAlgebraic_of_smul` | algebraic `c`; `c = π` | `c⁴ = g₂(L)/g₂(cL)`; `g₂(πL) = π⁻⁴` transcendental | sound | none; carried from the review at 2e239b9 |
| 4.1 `HasCM`, `hasCM_iff`, multipliers | `τ = i, i√2, iπ`; `α = 0, N, 1+i, 1/2` | `nτ² + (m−q)τ − p = 0`, `n ≠ 0`; `iπ` no integer quadratic; `[ℤ[i] : (1+i)ℤ[i]] = 2 = |1+i|²`; `α = 0` excluded; `ω₁/2 ∉ Λ` | sound | none; carried from the review at 2e239b9 |
| 4.2 `exists_weierstrassP_mul_eq` | `α = ±1, 2, 0, i` | `P = X`; duplication; excluded; `P = −X` | sound | none; carried from the review at 2e239b9 |
| 4.3 `exists_quasiPeriod_mul` | real `α`; `α = i`; `√−2` numerically | `b = 0`; `b = 0`; `b = 2.99106i` from three routes, `b² = −e₂²/2` algebraic | sound | none; carried from the review at 2e239b9 |
| 4.4 `trdeg_periodField_le_two_of_hasCM` | `ℤ[i]`; `√−2` numerically | `η₁ = 2πi/(2i) = π`; `3.278942` vs `3.278944`, `−1.646065i` both | sound | none; carried from the review at 2e239b9 |
| 5.1 `chudnovsky` through the scaled dictionary | invert 2.4; field equality | `E₄ = 3g₂l⁴/(4π⁴)`, `E₆ = 27g₃l⁶/(8π⁶)`, `E₂ = 3lη(l)/π²`; `ℚ(l/π, η/π) = ℚ(π/l, η/l)` | sound | none; carried from the review at 2e239b9 |
| 5.2 `two_le_trdeg_adjoin_invariants` | `ℤ[i]`, `l = 1`; `πℤ[i]` | `g₂(ℤ[i]), π` a.i.; `η_{πΛ}(π) = 1` | sound | none; carried from the review at 2e239b9 |
| 5.3 `two_le_trdeg_periodField` | `πℤ[i]`; `ℤ[i]` | `ω₁/π = 2iω₁/(2πi) ∈ F(i)`; trdeg `1` in both examples, hypothesis needed | sound | none; carried from the review at 2e239b9 |
| 5.4 `trdeg_periodField_eq_two_of_hasCM` | `c • ℤ[i]`, `c⁴ = g₂(ℤ[i])` | `g₂ = 1`, `g₃ = 0`, `E₆(i) = 0`, `2 ≤ trdeg ≤ 2` | sound | none; carried from the review at 2e239b9 |
| 5.5 corollaries | `ℤ[i]`; `c • ℤ[i]`; `ρ` | fails without algebraic invariants (`ω₁ = 1`); `c, π` a.i.; `(0, 1)` | sound | none; carried from the review at 2e239b9 |
| Research context | symbolic; `τ = i, ρ`; `ℤ[i]`, `α = i` | `j′ = −(9i/π)ω₁²(g₃/g₂)j`; `bω₁² − (α−ᾱ)ω₁η + 2πin = 0`, `n ≠ 0`; trdeg `2` by 5.5 | sound | none; carried from the review at 2e239b9 |
| Scope line 32, the scaled dictionary for a positive pair, with negative controls | `(1+i, 0.3+2i)`; `(ω₁, −ω₂)`, `(−ω₁, −ω₂)`, `(ω₁, ω₂+ω₁)` | `g₂`, `g₃`, `η(ω₁)` lattice vs scaled agree to `10⁻⁵`; `τ ∉ ℍ` for the reversed pair; `(−ω₁)⁻⁴ = ω₁⁻⁴`; `E_k(τ+1) = E_k(τ)` | sound | none; carried from the review at 2e239b9 |
| From ModularForms §10D contract (lines 159–164) | `m = 2, 3`; `m = 1`; #1706 at 75cafd52 | `60·π⁴/45 = 4π⁴/3`; `140·2π⁶/945 = 8π⁶/27`; `m = 1` excluded (`G₂` conditionally convergent); §10D at lines 1313/1321–1322, only at that head | mathematically sound; revision unnamed in the description | R01 (P3) |
| 2.4 line 456, `η(1) = G₂(τ)` row by row (the changed line) | `τ = 0.3 + 1.2i`, `z = 0.37 + 0.21i`; `τ = i`; summand order; row telescoping | lattice `3.302893 − 0.039866i` vs `q`-series and row sum `3.302890 − 0.039872i`; `3.141601` vs `π`; summand `−1/(w(w−1)) + 1/l² = O(|l|⁻³)`; row `f(−N−1) − f(N) → 0`, residue `∑_n (mτ+n)⁻² = e2Summand m τ`, `e2Summand 0 = 2ζ(2)` (Defs.lean line 40), outer sum absolutely convergent (`π² csc²(πmτ)`), equal to the `symmetricIcc` sum (line 57) | the named identity is the one the argument proves | none (R02 of the previous report repaired) |
| 2.4 line 460, `η(τ) = τG₂(τ) − 2πi` by Legendre (2.3) | `τ = 0.3 + 1.2i` | `τG₂ − 2πi = 1.038713 − 2.331679i`; `ζ(z+τ) − ζ(z) = 1.038707 − 2.331686i` | sound | none |
| 2.4 against DLMF 23.8.5 (cache `911959ce…` line 217) | half-periods `ω₁ = 1/2`, `ω₃ = τ/2` | `2η₁ = π²/3 + 2π²∑_{n≥1} csc²(nπτ) = e2Summand 0 τ + ∑_{m≠0} e2Summand m τ` | locator supports the row-by-row identity | none |
| Research context line 819 (R02) | the gate's dropped-names list; the sentence without the parenthetical | `grep -c LinearFormsInLogarithms` = 1 (line 819 only); list changed 2026-11-07 23:54, previous gate `dropped=0` at 2e239b9 | style rule, not a supplier citation | R02 (P3) |

## Not verifiable

- Silverman, AEC ch. VI and ATAEC chs. I–II (1.4, 2.4, 4.1): no legal copy; the 2.4 claim was checked against DLMF 23.8.5 and the pinned Mathlib instead, and numerically.
- Lang 1971, Bull. AMS 77, p. 652 (Conjecture 34's origin, cited through Waldschmidt 2008): not opened. The README cites it only through Waldschmidt.
- Bost–Charles, Grothendieck's Montpellier folder 18, Chudnovsky 1976 and 1984, Nesterenko 1996, André, Lang 1966: cited by locator only, as in the previous reviews. No target depends on them.
- Milne, *Modular Functions and Modular Forms*, Proposition 3.10, cited by ModularForms §10D for the lattice–modular comparison: the supplier's locator, not this roadmap's; not re-opened this round.

## Source issues

- none
