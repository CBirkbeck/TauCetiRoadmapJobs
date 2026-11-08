# Review of EllipticPeriods (pull request #1059 at 0725bcd)

**Verdict:** needs changes

Incremental re-review of the 2 lines of `TauCetiRoadmap/EllipticPeriods/README.md` that changed since 1b5ad0a: line 819, in Research context, lost the parenthetical that named LinearFormsInLogarithms. That repairs R02 of the previous report, and the gate now passes every check including the build. One previous finding stays open (R01, the pull request's description), P3; nothing blocks.

## R01 (P3) — ModularForms §10D is defined only at an open revision, and the pull request does not name that revision

Location: `TauCetiRoadmap/EllipticPeriods/README.md` line 34 ("is ModularForms §10D's … and is consumed"), lines 159–164 (`### From ModularForms`, "§10D, the lattice–modular comparison …"), and lines 455, 465, 489 and 800. The pull request's description names only "#913 ModularCurvesPartII" in its depends-on list (unchanged since the previous two reviews).

Claim: ModularForms §10D supplies `g₂(ℤ + ℤτ) = (4π⁴/3)E₄(τ)` and `g₃(ℤ + ℤτ) = (8π⁶/27)E₆(τ)`, consumed by 2.4 and through it by 5.1.

Witness: on main (665b395), `TauCetiRoadmap/ModularForms/README.md` contains no "10D" (0 occurrences). The section exists only at the head of the open ModularForms revision, still 75cafd52: heading `### 10D Uniformisation of the level moduli and algebraicity of sections` at line 1313, the comparison at lines 1321–1322, and the naming of EllipticPeriods §2.4 as its consumer at line 1536. `scratch/overlaps.md` lists it as "only an open revision defines".

Repair: add the ModularForms revision to the depends-on list of the pull request's description, after ModularCurvesPartII, and say in the description's "Boundary" paragraph that the `g₂, g₃` comparison for `ℤ + ℤτ` comes from ModularForms §10D. The README needs no edit and must not name a pull-request number. Tested: all six README citations of §10D (lines 34, 161, 455, 465, 489, 800) resolve at 75cafd52 to the statement the contract quotes (lines 1321–1322), and that head's lines 65–70 and 1536 make the edge one-way.

## Previous findings

- R01 — not repaired: the description's depends-on list still reads "- [ ] #913 ModularCurvesPartII" only; the six §10D citations resolve only at ModularForms head 75cafd52 (lines 1313, 1321–1322). Raised again as R01.
- R02 — repaired: line 819 now ends "no roadmap owns that form of the criterion." with the parenthetical on LinearFormsInLogarithms 5.7 deleted; `grep -c LinearFormsInLogarithms README.md` is 0, and no name of the dropped-names list occurs in the folder. The repair introduced no new problem (the surviving claim is checked below).

## Verified sound

**The change.** `git diff --stat 1b5ad0a6..HEAD` lists only `TauCetiRoadmap/EllipticPeriods/README.md` (+1/−1, line 819). `Suggested.lean` is unchanged since 636e708 (empty diffstat, 270 lines). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EllipticPeriods'` is empty. Pins unchanged: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`. The worktree is clean.

**The surviving sentence (lines 814–819).** With the parenthetical gone, the sentence claims that Schneider's 1937 theorem follows from the Schneider–Lang criterion for meromorphic functions of finite order, cites Lang 1966 Ch. IV §1 Theorem 1 and Waldschmidt's Theorem 4.1 with its footnote 10 for the criterion, and says no roadmap owns that form. The ownership claim was re-resolved this round:

- main (665b395): the only roadmap on main mentioning Schneider–Lang is DiophantineApproximationAndTranscendence; its §3.5 (line 2336) consumes the criterion for `ℂ^{d₀} × (ℂˣ)^{d₁}` (W00 Corollary 4.2, the exponential-group form), not the meromorphic-function form.
- the DiophantineApproximationAndTranscendence revision at its head: §3.5 at line 2263 proves `Baker.schneiderLang` for `ℂ^{d₀} × (ℂˣ)^{d₁}` (line 2279), again the exponential-group form.
- LinearFormsInLogarithms at its head ce174b2, README lines 68–71: the "Not in this roadmap, and not owned by any other roadmap unless stated" list opens with the Schneider–Lang criterion for algebraically independent entire functions of finite order (Waldschmidt Theorem 4.1) and its extension to meromorphic functions. That is the source the deleted parenthetical paraphrased, so the deletion lost no information the paragraph needs: the supplier it pointed at disclaims ownership itself.
- `roadmaps grep -i 'Schneider.Lang'` over the open heads finds the criterion in five roadmaps (LinearFormsInLogarithms, DiophantineApproximationAndTranscendence, OrdinaryAutomorphicFormsAndModularityLifting, SheafConvolutionOnAbelianVarieties, this one); the first four all state or consume the exponential-group or the `p`-adic form, and SheafConvolution declares a gap for the commutative-group form. None owns Lang's Ch. IV Theorem 1.

The Lang and Waldschmidt locators and the Grothendieck Montpellier locator (lines 820–821) are unchanged from the heads the previous reviews read; neither text was re-opened (see Not verifiable).

**Gate.** The worker's run at 0725bcd: every counter 0, `build=0 OK`. My rerun with `--build` and the merge-order candidate gives the same line, `dropped=0 … depcheck=0 … build=0 OK`. The dependency check with the order, `--movable` and the content checkout:

```
depcheck: 240 roadmaps, 2431 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line for this roadmap; ModularCurvesPartII at position 79, EllipticPeriods at 80; ModularForms and DiophantineApproximationAndTranscendence are on main.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/EllipticPeriods/Suggested.lean` from the worktree: exit 0, 32 `declaration uses sorry` warnings and no other diagnostic. The file is byte-identical to the one the reviews at 636e708 and 1b5ad0a elaborated, so the 40 elaborated signatures of `scratch/signatures.md` (0 lost binders; no `variable` or `include` line in the file), the one-tactic probe (no sorried theorem closes under `first | rfl | simp_all | decide | trivial`; no padding) and the headline check (five headlines stated: `trdeg_periodField_le`, `chudnovsky`, `two_le_trdeg_periodField`, `trdeg_periodField_le_two_of_hasCM`, `trdeg_periodField_eq_two_of_hasCM`; 2.3 `ζ = σ′/σ` named as not statable for want of `latticeSigma`) carry over unchanged. The two names `citations.md` finds nowhere, `IsEllipticFunction.finsum_meromorphicOrderAt_eq_zero` and `IsEllipticFunction.exists_eq_div_weierstrassP`, are this roadmap's own declarations (`Suggested.lean` lines 104 and 109). Single `import Mathlib`, no `set_option`, no `lemma`, no sorried data.

**Seeded sample.** This round's sample is 0.1, 0.3, 1.3, 1.5, 1.7, 2.2, 2.4, 3.1, 3.4, 3.5, 4.1, 4.2, 5.1, 5.3 and 5.5. None of these targets changed at this head: 2.4 was last changed at 1b5ad0a (line 456) and checked in full there against DLMF 23.8.5 (cache `911959ce…` line 217) and the pinned `E2/Defs.lean`; the other fourteen are byte-identical to 636e708 and their locators (DLMF 23.2.5, 23.2.14, 23.3.4, 23.9.5; Chudnovsky ICM 1978 §0, Theorems 1 and 3, Corollary 2, display (4); Waldschmidt math/0502582 Théorème 3.1; Waldschmidt 2008 Corollaries 32 and 35) were checked in the reviews at a1d420d through 1b5ad0a. The README flags no locator as unverified.

**Overlaps, citations and ownership.** `overlaps.md`: no other open pull request changes this roadmap; no dropped id in either direction; the one "only an open revision defines" item is R01. ModularForms #1706 has not moved since the previous review (head 75cafd52), and its §10D lines were re-read this round (1313, 1321–1322, 1536). `citations.md` lists no cross-roadmap citation found nowhere. The ownership of the scaled dictionary against EllipticCurvePeriodsAndModularParametrizations is as settled in the earlier reviews (that roadmap is placed after this one and the duplicate is its to cite); the change does not touch it. No declared gaps (no readable `design/plan.json`).

**Adversarial table.** Rows for statements the change leaves untouched are carried from the previous report (at 1b5ad0a, values computed there or at the heads it names); the last two rows are computed this round.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 `SMul`, `G_smul` | `k = 0, 1, 2`; `k = 4, c = 2`; `c = −1` | `G₄(2Λ) = G₄/16`; odd `k`: `0 = 0`; `k ≤ 2` both sides `0` (junk) | sound | none; carried from the review at 1b5ad0a |
| 0.2, 0.3 lattice invariance, `ofUpperHalfPlane` | `ℤ[i]`, `I • L`; `(τ, 1)` | `iℤ[i] = ℤ[i]`, `G₆ = −G₆ ⇒ g₃(ℤ[i]) = 0`; `(1/τ).im < 0` | sound | none; carried from the review at 1b5ad0a |
| 1.1 `IsEllipticFunction` | `℘`, `℘′`, `℘(2z)`, constant; `ζ`, `z` | `ζ(z+1) − ζ(z) = π ≠ 0` on `ℤ[i]` | Checks discriminate | none; carried from the review at 1b5ad0a |
| 1.2 Liouville | constant; `℘`; `z ↦ z` | `℘` order `−2` at `0`; `z` not periodic | hypotheses needed | none; carried from the review at 1b5ad0a |
| 1.3 `finsum_meromorphicOrderAt_eq_zero` | `℘ − e₁`; `1`; codiscrete `0` | orders `−2 + 2 = 0`; all `0`; all `⊤`, excluded by `hne` | sound | none; carried from the review at 1b5ad0a |
| 1.4 structure | `℘′²`; `0`; `℘′` | `P = 4X³ − g₂X − g₃, Q = 1`; `P = 0`; `℘′` odd, excluded | sound | none; carried from the review at 1b5ad0a |
| 1.5 half-period values | `ℤ[i]`; `ℤ[ρ]` | `℘(1/2) = 6.87518 = −℘(i/2)`, `4e² = 189.0726 = g₂`; `64e⁶ = g₂³`; `g₂(ℤ[ρ]) = 0` | sound | none; carried from the review at 1b5ad0a |
| 1.6 Laurent, `G_mem_adjoin` | `n = 3, 4`; numerically `c₁` | `c₃ = g₂²/1200`, `c₄ = 3g₂g₃/6160`; `(℘(0.05) − 400)/0.05² = 9.4538` vs `g₂/20 = 9.4536` | sound | none; carried from the review at 1b5ad0a |
| 1.7 descent | `℘(2z)`; `℘`; `℘′²` | duplication at `z = 0.3 + 0.17i`: `0.75722 + 1.51668i` both sides | sound | none; carried from the review at 1b5ad0a |
| 2.1 `weierstrassZeta`, oddness, `ζ′ = −℘` | `z = l₀`; `z = 0` | junk `2/l₀` at `l₀`, odd; `ζ(0) = 0` | sound | none; carried from the review at 1b5ad0a |
| 2.2 `quasiPeriod`, `_add`, `_smul`, `_congr` | `l = 0`; `c = 2`, `l = 1/3`; `(ω₂, ω₁)` | `η(0) = 0`; `−2.207299 = ½(−4.414598)`; `_congr` needs `l ∈ Λ` | sound | none; carried from the review at 1b5ad0a |
| 2.3 Legendre, `ζ = σ′/σ` | `ℤ[i]`, both bases | `η(1) = 3.14160`, `η(i) = −3.14159i`, `η(1)i − η(i) = 6.28319i = 2πi`; reversed `−2πi` | agrees with ModularCurvesPartII §1.4a | none; carried from the review at 1b5ad0a |
| 2.4 line 456, `η(1) = G₂(τ)` row by row | `τ = 0.3 + 1.2i`, `z = 0.37 + 0.21i`; `τ = i` | lattice `3.302893 − 0.039866i` vs `q`-series `3.302890 − 0.039872i`; `3.141601` vs `π`; `e2Summand 0 = 2ζ(2)` (Defs.lean line 40) | sound | none; carried from the review at 1b5ad0a |
| 2.4 line 460, `η(τ) = τG₂(τ) − 2πi` | `τ = 0.3 + 1.2i` | `1.038713 − 2.331679i` vs `ζ(z+τ) − ζ(z) = 1.038707 − 2.331686i` | sound | none; carried from the review at 1b5ad0a |
| 2.4 against DLMF 23.8.5 (cache `911959ce…` line 217) | half-periods `ω₁ = 1/2`, `ω₃ = τ/2` | `2η₁ = π²/3 + 2π²∑_{n≥1} csc²(nπτ)` = `e2Summand 0 τ + ∑_{m≠0} e2Summand m τ` | locator supports the identity | none; carried from the review at 1b5ad0a |
| 3.1 `periodMatrix`, `det_periodMatrix` | `ℤ[i]`; exchanged; `γ = !![0,1;1,0]` | `!![1, i; π, −iπ]`, `det = −2πi`; `+2πi`; `det γ = −1` | sound | none; carried from the review at 1b5ad0a |
| 3.2 `periodField`, `two_pi_I_mem_periodField` | both orientations; `ℤ[i]` | `det = ∓2πi ∈ F`; `F = ℚ(i, π)`, trdeg `1` | sound | none; carried from the review at 1b5ad0a |
| 3.3 `trdeg_periodField_le` | four generators; `ℤ[i]`; `πℤ[i]` | `≤ 4`; `1`; `1` | sound | none; carried from the review at 1b5ad0a |
| 3.4 `periodIdeal`, `ringKrullDim_periodIdeal` | `ℤ[i]`; determinant | `X₂₂ + X₁₂X₂₁ ↦ 0`, `X₁₂² + 1 ↦ 0`; `det ↦ −2πi ≠ 0`; `dim = 1 = trdeg ℚ(i, π)` | hypotheses met | none; carried from the review at 1b5ad0a |
| 3.5 `trdeg_periodField_smul`, `isAlgebraic_of_smul` | algebraic `c`; `c = π` | `c⁴ = g₂(L)/g₂(cL)`; `g₂(πL) = π⁻⁴` transcendental | sound | none; carried from the review at 1b5ad0a |
| 4.1 `HasCM`, `hasCM_iff`, multipliers | `τ = i, i√2, iπ`; `α = 0, N, 1+i, 1/2` | `nτ² + (m−q)τ − p = 0`, `n ≠ 0`; `iπ` no integer quadratic; `[ℤ[i] : (1+i)ℤ[i]] = 2 = |1+i|²`; `α = 0` excluded; `ω₁/2 ∉ Λ` | sound | none; carried from the review at 1b5ad0a |
| 4.2 `exists_weierstrassP_mul_eq` | `α = ±1, 2, 0, i` | `P = X`; duplication; excluded; `P = −X` | sound | none; carried from the review at 1b5ad0a |
| 4.3 `exists_quasiPeriod_mul` | real `α`; `α = i`; `√−2` numerically | `b = 0`; `b = 0`; `b = 2.99106i` from three routes, `b² = −e₂²/2` algebraic | sound | none; carried from the review at 1b5ad0a |
| 4.4 `trdeg_periodField_le_two_of_hasCM` | `ℤ[i]`; `√−2` numerically | `η₁ = 2πi/(2i) = π`; `3.278942` vs `3.278944`, `−1.646065i` both | sound | none; carried from the review at 1b5ad0a |
| 5.1 `chudnovsky` through the scaled dictionary | invert 2.4; field equality | `E₄ = 3g₂l⁴/(4π⁴)`, `E₆ = 27g₃l⁶/(8π⁶)`, `E₂ = 3lη(l)/π²`; `ℚ(l/π, η/π) = ℚ(π/l, η/l)` | sound | none; carried from the review at 1b5ad0a |
| 5.2 `two_le_trdeg_adjoin_invariants` | `ℤ[i]`, `l = 1`; `πℤ[i]` | `g₂(ℤ[i]), π` a.i.; `η_{πΛ}(π) = 1` | sound | none; carried from the review at 1b5ad0a |
| 5.3 `two_le_trdeg_periodField` | `πℤ[i]`; `ℤ[i]` | `ω₁/π = 2iω₁/(2πi) ∈ F(i)`; trdeg `1` in both examples, hypothesis needed | sound | none; carried from the review at 1b5ad0a |
| 5.4 `trdeg_periodField_eq_two_of_hasCM` | `c • ℤ[i]`, `c⁴ = g₂(ℤ[i])` | `g₂ = 1`, `g₃ = 0`, `E₆(i) = 0`, `2 ≤ trdeg ≤ 2` | sound | none; carried from the review at 1b5ad0a |
| 5.5 corollaries | `ℤ[i]`; `c • ℤ[i]`; `ρ` | fails without algebraic invariants (`ω₁ = 1`); `c, π` a.i.; `(0, 1)` | sound | none; carried from the review at 1b5ad0a |
| Research context (conjecture, CM case) | symbolic; `τ = i, ρ`; `ℤ[i]`, `α = i` | `j′ = −(9i/π)ω₁²(g₃/g₂)j`; `bω₁² − (α−ᾱ)ω₁η + 2πin = 0`, `n ≠ 0`; trdeg `2` by 5.5 | sound | none; carried from the review at 1b5ad0a |
| Scope line 32, the scaled dictionary for a positive pair | `(1+i, 0.3+2i)`; `(ω₁, −ω₂)`, `(−ω₁, −ω₂)`, `(ω₁, ω₂+ω₁)` | `g₂`, `g₃`, `η(ω₁)` lattice vs scaled agree to `10⁻⁵`; `τ ∉ ℍ` reversed; `(−ω₁)⁻⁴ = ω₁⁻⁴`; `E_k(τ+1) = E_k(τ)` | sound | none; carried from the review at 1b5ad0a |
| From ModularForms §10D contract (lines 159–164) | `m = 2, 3`; `m = 1`; #1706 at 75cafd52 | `60·π⁴/45 = 4π⁴/3`; `140·2π⁶/945 = 8π⁶/27`; `m = 1` excluded (`G₂` conditionally convergent); §10D at lines 1313/1321–1322, only at that head, head unmoved this round | mathematically sound; revision unnamed in the description | R01 (P3) |
| Research context lines 814–819, the changed sentence: Schneider 1937 from the meromorphic Schneider–Lang criterion, owned by no roadmap | the dropped-names list; main; DAT revision head; LinearFormsInLogarithms head ce174b2; `roadmaps grep` over 478 heads | `grep -c LinearFormsInLogarithms` = 0, dropped-list hits 0; DAT §3.5 main line 2336 and revision line 2279 = `ℂ^{d₀} × (ℂˣ)^{d₁}` form; LFL lines 68–71 list the entire/meromorphic finite-order criterion as owned by none; 5 roadmaps mention the criterion, none owns Lang Ch. IV Thm 1 | the sentence is true as it now stands and names no dropped roadmap | none (R02 of the previous report repaired) |
| Gate and depcheck at 0725bcd | `--build --order`; `--depcheck --movable` | every counter 0, `build=0 OK`; `240 roadmaps, 2431 edges, 0 problem(s)` | passes | none |

## Not verifiable

- Lang, *Introduction to Transcendental Numbers*, 1966, Ch. IV §1, Theorem 1, and Waldschmidt, *Diophantine Approximation on Linear Algebraic Groups*, Theorem 4.1 with footnote 10 (line 815–818): no legal copy of either book; cited by locator only, unchanged since the earlier reviews. No target depends on them.
- Silverman, AEC ch. VI and ATAEC chs. I–II (1.4, 2.4, 4.1): no legal copy; the 2.4 claim was checked against DLMF 23.8.5 and the pinned Mathlib instead, and numerically, at 1b5ad0a.
- Lang 1971, Bull. AMS 77, p. 652 (Conjecture 34's origin, cited through Waldschmidt 2008): not opened.
- Bost–Charles, Grothendieck's Montpellier folder 18, Chudnovsky 1976 and 1984, Nesterenko 1996, André: cited by locator only, as in the previous reviews. No target depends on them.
- Milne, *Modular Functions and Modular Forms*, Proposition 3.10, cited by ModularForms §10D: the supplier's locator, not this roadmap's; not re-opened.

## Source issues

- none
