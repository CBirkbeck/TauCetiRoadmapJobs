# Review of EllipticPeriods (pull request #1059 at a17e4ca)

**Verdict:** needs changes

Incremental re-review of 10 changed lines in `TauCetiRoadmap/EllipticPeriods/` since 1569ed9: one new Research-context paragraph (README lines 813–819, Lang's conjecture on `j′(τ)` and the pairwise algebraic independence of `ω₁, η(ω₁), π` with CM) and one new References entry (lines 849–850, Waldschmidt 2008). Nothing else changed: `Suggested.lean`, `metadata.toml`, the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, toolchain `v4.36.0-rc2`) and the tree outside the folder are identical to 1569ed9. The new paragraph is sound: its locators were verified against the author's copy of the survey, Siegel's relation was recomputed, and the quadratic relation it quotes was checked against 4.4 and on `ℤ[i]` (table). None of the three findings of the previous report is touched by the change; the two sibling heads they rest on (ModularForms `a24d49a2`, EllipticCurvePeriodsAndModularParametrizations `7a356fe6`) are unchanged, so all three are raised again below, with the same repairs.

## R01 (P2) — The `g₂, g₃ ↔ E₄, E₆` comparison has two owners at the open heads

Location: `TauCetiRoadmap/EllipticPeriods/README.md` lines 31–32 ("the dictionary between the lattice invariants `g₂, g₃, η(1)` of `ℤ + ℤτ` and Mathlib's `ModularForm.E₄`, `ModularForm.E₆`, `EisensteinSeries.E2` (Layer 2)"), lines 444–445 (2.4: `g₂_ofUpperHalfPlane`, `g₃_ofUpperHalfPlane`); `TauCetiRoadmap/EllipticPeriods/Suggested.lean` lines 160–166. Carried from the previous report (its R01), unrepaired: the change touches none of these lines.

Claim: this roadmap owns `g₂(ℤ + ℤτ) = (4π⁴/3)E₄(τ)` and `g₃(ℤ + ℤτ) = (8π⁶/27)E₆(τ)`, as its own targets and as two sorried theorems.

Witness: ModularForms at the head of its open revision (`a24d49a2`, unchanged since the previous review), `TauCetiRoadmap/ModularForms/README.md` lines 1211–1212: §10D proves `G_{2m}(Λ_z) = 2ζ(2m)E_{2m}(z)` for `m ≥ 2`, "hence `g₂(Λ_z) = (4π⁴/3)E₄(z)`, `g₃(Λ_z) = (8π⁶/27)E₆(z)`"; its lines 58–61 and 1426 say "EllipticPeriods §2.4 consumes its lattice–modular comparison". ModularForms is on main and earlier than every roadmap in the merge order; this README cites it nowhere. The values agree (`60 · π⁴/45 = 4π⁴/3`, `140 · 2π⁶/945 = 8π⁶/27`), so the duplication is of ownership, not of conventions.

Repair (ModularForms owns, this roadmap cites):

- Scope, lines 31–32: "the dictionary between `η(1)` for `ℤ + ℤτ` and Mathlib's `EisensteinSeries.E2`, and the scaled dictionary for a positive basis (Layer 2); the comparison `g₂ = (4π⁴/3)E₄`, `g₃ = (8π⁶/27)E₆` for `ℤ + ℤτ` is ModularForms §10D's, consumed."
- Exact supplier contracts: add `### From ModularForms` with "§10D: `G_{2m}(ℤ + ℤτ) = 2ζ(2m)E_{2m}(τ)` for `m ≥ 2`, hence `g₂(ℤ + ℤτ) = (4π⁴/3)E₄(τ)` and `g₃(ℤ + ℤτ) = (8π⁶/27)E₆(τ)`." Since §10D exists only at ModularForms' open revision, the pull request's description names that revision in its depends-on list (the README never names a pull-request number).
- 2.4, lines 444–446: keep `η(1) = G₂(τ) = (π²/3)E₂(τ)` (`quasiPeriod_ofUpperHalfPlane_one`) and the scaled dictionary, with "`g₂ = (4π⁴/3)E₄(τ)`, `g₃ = (8π⁶/27)E₆(τ)` are ModularForms §10D" and `*Needs:*` extended by "ModularForms §10D"; drop the two backticked names. Layer 2 Dependencies (line 480) and the Downstream paragraph (line 793) follow.
- `Suggested.lean`: delete `g₂_ofUpperHalfPlane` and `g₃_ofUpperHalfPlane` (lines 160–166); in the module docstring (line 34) "the Eisenstein dictionary (2.4)" becomes "the `E₂` dictionary (2.4)". The Checks of 2.4 and 5.4 that evaluate the constants stay as Checks.

Tested: after the deletion no remaining declaration mentions either name (`grep -n 'g₂_ofUpperHalfPlane\|g₃_ofUpperHalfPlane' Suggested.lean` gives only lines 160–166; the README mentions at 445 and 453 are the prose the repair rewrites), and 5.1's route ("`E₄(τ) = (3g₂/4)(l/π)⁴`") uses the scaled form, which 2.4 keeps as a corollary of §10D and 0.1.

## R02 (P3) — The Downstream consumers bullet on EllipticCurvePeriodsAndModularParametrizations is false at its head

Location: `TauCetiRoadmap/EllipticPeriods/README.md` lines 789–791 ("EllipticCurvePeriodsAndModularParametrizations expects the Eisenstein dictionary (2.4) and lattice invariance (0.2) from here; …"). Carried from the previous report (its R02), unrepaired.

Claim: that roadmap consumes 2.4 and 0.2 from here.

Witness: at its open head (`7a356fe6`, unchanged) `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md` names neither EllipticPeriods nor GrothendieckPeriodConjecture (`grep -n -i 'EllipticPeriods\|GrothendieckPeriodConjecture'` is empty); its lines 470–476 prove lattice invariance of `G_k` and the scaled dictionary `g₂ = ω₁⁻⁴(4π⁴/3)E₄(τ)` themselves, from Milne.

Repair: replace the bullet by what is true now: "EllipticCurvePeriodsAndModularParametrizations states, in its §1.1, the lattice invariance of `G_k` and the scaled dictionary `g₂ = ω₁⁻⁴(4π⁴/3)E₄(τ)`, `g₃ = ω₁⁻⁶(8π⁶/27)E₆(τ)`; those are 0.2 and 2.4 here (and ModularForms §10D for `ℤ + ℤτ`), to be cited from there rather than restated." Or delete the bullet.

## R03 (P3) — The References entry does not cover the ATAEC ch. II locator

Location: `TauCetiRoadmap/EllipticPeriods/README.md` line 596 ("Silverman, ATAEC, ch. II.") against lines 857–858 ("*Advanced Topics in the Arithmetic of Elliptic Curves*, GTM 151, 1994, ch. I"). Carried from the previous report (its R03), unrepaired.

Claim: every locator in the body points into a work the References list records at that place.

Witness: `grep -n 'ATAEC' README.md` gives lines 458, 482 (ch. I) and 596 (ch. II); the References entry for GTM 151 names ch. I only.

Repair: line 858: "GTM 151, 1994, ch. I–II (ch. II for Layer 4)". Optionally number the AEC locator (Theorem VI.4.1 for the multiplier–endomorphism correspondence, Theorem VI.5.5 for "`ℤ` or an order in an imaginary quadratic field"), confirmed against the printing cited.

## Previous findings

- R01 — not repaired: lines 31–32 still claim the dictionary `g₂, g₃ ↔ E₄, E₆`; 2.4 still states `g₂_ofUpperHalfPlane`, `g₃_ofUpperHalfPlane` (lines 444–445, Lean 160–166); ModularForms is cited nowhere. Raised again as R01.
- R02 — not repaired: lines 789–791 still say EllipticCurvePeriodsAndModularParametrizations "expects the Eisenstein dictionary (2.4) and lattice invariance (0.2) from here". Raised again as R02.
- R03 — not repaired: line 858 still reads "GTM 151, 1994, ch. I" while line 596 cites "ATAEC, ch. II". Raised again as R03.

## Verified sound

**The change.** `git diff --stat 1569ed9..HEAD` lists only `TauCetiRoadmap/EllipticPeriods/README.md` (+10, −0); `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EllipticPeriods'` is empty; the worktree is clean; `lake-manifest.json` and `lean-toolchain` are unchanged (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, `v4.36.0-rc2`). The new paragraph is research context ("Not targets", line 797): no target, `*Needs:*` line, supplier contract or Lean statement depends on it, and it introduces no process word, pull-request number or LaTeX.

**Gate.** The worker's run at a17e4ca: every counter 0, `build=0 OK`. My rerun with `--order` on the merge-order candidate: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0.

**Dependency check** with the merge-order candidate and `--movable`:

```
depcheck: 240 roadmaps, 2364 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line for this roadmap. The candidate lists ModularCurvesPartII at 73 and EllipticPeriods at 74; ModularForms and DiophantineApproximationAndTranscendence are on main; EllipticCurvePeriodsAndModularParametrizations is not listed and sits after GrossZagierAndArithmeticHeights (326), later than this roadmap.

**Elaboration.** The worker's `SignatureCheck.lean` (`Suggested.lean` plus `#check @<name>` for all 42 declarations; it differs from `Suggested.lean` only by those lines and a blank line) elaborated with `lake env lean` from the worktree in 6 s: 34 `declaration uses sorry` warnings, no other diagnostic; the 42 elaborated types are identical, whitespace-normalised, to the worker's `signatures.md`; 0 declarations lost a section binder (none uses section variables). Single `import Mathlib`, module form, no `set_option`, no sorried data.

**One-tactic probe.** Every `sorry` (33 on `:= sorry`/`:= by sorry` lines and the one on its own line at 148) replaced by `by first | rfl | simp_all | decide | trivial`: errors at exactly the 34 `sorry` lines (line 148 reports two positions), 0 `sorry` warnings left, so none of the 34 theorems closes in one tactic at the pins; no padding. The 2 Lean names `citations.md` could not find (`IsEllipticFunction.finsum_meromorphicOrderAt_eq_zero`, `IsEllipticFunction.exists_eq_div_weierstrassP`) are this roadmap's own declarations at `Suggested.lean` lines 104 and 109.

**The new passage against its source.** Waldschmidt, « Elliptic functions and transcendence », read from the author's copy on his institutional page (`waldschmidt-elliptic-2008`, 46 pages in the published layout: chapter 7 of the volume, running head "167" on its page 25, so pages 143–188 and page 24 = 166, page 25 = 167):
- Corollary 32 (line 1118–1120, p. 166): with algebraic `g₂, g₃` and CM, a nonzero period `ω` and `π` are algebraically independent (the statement 5.5 attributes to Chudnovsky ICM 1978, Corollary 2; same hypotheses);
- Conjecture 34 (line 1128, p. 167): Lang 1971, if `j(τ)` is algebraic with `j′(τ) ≠ 0` then `j′(τ)` is transcendental; lines 1129–1134 give Siegel's relation and say the conjecture amounts to the transcendence of `ω₁²/π`;
- Corollary 35 (lines 1136–1137, p. 167): for quadratic `τ` with `j′(τ) ≠ 0`, `π` and `j′(τ)` algebraically independent, deduced there from Corollary 32 ("true at least in the CM case").
The README's "Conjecture 34, p. 167", "whose CM case is Corollary 35", and the References entry "Corollaries 32 and 35, Conjecture 34, pp. 166–167" all match. The hypothesis `g₂ g₃ ≠ 0` in the README is the source's `j′(τ) ≠ 0`: by the relation below `j′ = 0` exactly when `g₂ g₃ = 0` (with `Δ ≠ 0`).

**Siegel's relation recomputed.** With `θ = (2πi)⁻¹ d/dτ`, Ramanujan's `θE₄ = (E₂E₄ − E₆)/3` and `θΔ = E₂Δ` give `θj = −E₄²E₆/Δ`, `Δ = (E₄³ − E₆²)/1728`; substituting the scaled dictionary of 2.4 (`E₄ = (3g₂/4)(ω₁/π)⁴`, `E₆ = (27g₃/8)(ω₁/π)⁶`) gives `E₄²E₆ = (243/128)g₂²g₃(ω₁/π)¹⁴`, `E₄³ − E₆² = (27/64)(g₂³ − 27g₃²)(ω₁/π)¹²`, hence `j′(τ) = −2πi · 7776 · (ω₁/π)² g₂²g₃/(g₂³ − 27g₃²) = −(9i/π) ω₁² (g₃/g₂) j(τ)`; the source's `j′(τ) = (18ω₁²/(2πi))(g₃/g₂) j(τ)` (line 1130–1133) is the same number. So for algebraic `g₂, g₃` with `g₂g₃ ≠ 0`, `j′(τ)` is an algebraic nonzero multiple of `ω₁²/π`, as the README says.

**The CM relation against 4.4.** 4.4 (line 649) gives `η(ω₁) = (2πin + bω₁²)/((α − ᾱ)ω₁)`, i.e. `bω₁² − (α − ᾱ)ω₁η(ω₁) + 2πin = 0`, the form quoted at line 817; `α` non-real so `α − ᾱ ≠ 0` and `n ≠ 0` (4.4 line 647), `b` algebraic (4.3). Then `η(ω₁)` is algebraic over `ℚ(ω₁, π)` (divide by `(α − ᾱ)ω₁ ≠ 0`), `π` over `ℚ(ω₁, η(ω₁))` (`n ≠ 0`), `ω₁` over `ℚ(η(ω₁), π)` (root of `bX² − (α − ᾱ)η(ω₁)X + 2πin`, nonzero by its constant term). With `ω₁, π` algebraically independent (5.5), `trdeg ℚ(ω₁, η(ω₁), π) = 2`, and each pair generates a field over which the third is algebraic, so each pair has transcendence degree 2: the paragraph's claim.

**Cross-roadmap citations the finding sites rest on, re-resolved.** ModularForms at `rev/1706` is still `a24d49a2` (2026-11-06): §10D at README line 1204, the comparison at 1211–1212, the consumer sentences at 58–61 and 1426; main's ModularForms (`eaf17b1`) has no §10D and no mention of EllipticPeriods, so §10D is still only at the open revision. EllipticCurvePeriodsAndModularParametrizations at `rev/1715` is still `7a356fe6` (2026-11-03): 0 occurrences of EllipticPeriods or GrothendieckPeriodConjecture; lines 475 and 490 restate the scaled dictionary. `overlaps.md`: no other pull request changes this roadmap, no dropped ids; the two closest roadmaps (#1715, #1706) are the two read here.

**Seeded sample.** None of the fifteen targets (0.1, 0.2, 1.1, 1.2, 1.3, 1.5, 1.6, 2.1, 2.2, 3.2, 3.4, 3.5, 4.1, 5.2, 5.4) is in a changed passage; all are byte-identical to the heads verified at a1d420d, 40c294b, 7406ad2, ceceba6 and 1569ed9, whose reports record the cache passages behind their locators (Chudnovsky ICM 1978 §0, Theorem 1, Corollary 2, Theorem 3, display (4), (9); DLMF 23.2.5, 23.2.14, 23.3.4, 23.8.5, 23.9.5; Waldschmidt math/0502582 Théorème 3.1). The only dependence the new paragraph has on them is 4.4 and 5.5, checked above.

**Adversarial table.** Rows for the unchanged statements are carried from the previous report (which carried them, with their values, from the reviews at ceceba6 and before); the last two rows are computed this round.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 `SMul`, `G_smul` | `k = 0, 1, 2`; `k = 4, c = 2`; `c = −1` | `G₄(2Λ) = G₄/16`; odd `k`: `0 = 0`; `k ≤ 2` both sides `0` (junk) | sound | none; carried from the review at 1569ed9 |
| 0.2, 0.3 lattice invariance, `ofUpperHalfPlane` | `ℤ[i]`, `I • L`; `(τ, 1)` | `iℤ[i] = ℤ[i]`, `G₆ = −G₆ ⇒ g₃(ℤ[i]) = 0`; `(1/τ).im < 0` | sound | none; carried from the review at 1569ed9 |
| 1.1 `IsEllipticFunction` | `℘`, `℘′`, `℘(2z)`, constant; `ζ`, `z` | `ζ(z+1) − ζ(z) = π ≠ 0` on `ℤ[i]` | Checks discriminate | none; carried from the review at 1569ed9 |
| 1.2 Liouville | constant; `℘`; `z ↦ z` | `℘` order `−2` at `0`; `z` not periodic | hypotheses needed | none; carried from the review at 1569ed9 |
| 1.3 `finsum_meromorphicOrderAt_eq_zero` | `℘ − e₁`; `1`; codiscrete `0` | orders `−2 + 2 = 0`; all `0`; all `⊤`, excluded by `hne` | sound | none; carried from the review at 1569ed9 |
| 1.4 structure | `℘′²`; `0`; `℘′` | `P = 4X³ − g₂X − g₃, Q = 1`; `P = 0`; `℘′` odd, excluded | sound | none; carried from the review at 1569ed9 |
| 1.5 half-period values | `ℤ[i]`; `ℤ[ρ]` | `℘(1/2) = 6.87518 = −℘(i/2)`, `4e² = 189.0726 = g₂`; `64e⁶ = g₂³`; `g₂(ℤ[ρ]) = 0` | sound | none; carried from the review at 1569ed9 |
| 1.6 Laurent, `G_mem_adjoin` | `n = 3, 4`; numerically `c₁` | `c₃ = g₂²/1200`, `c₄ = 3g₂g₃/6160`; `(℘(0.05) − 400)/0.05² = 9.4538` vs `g₂/20 = 9.4536` | sound | none; carried from the review at 1569ed9 |
| 1.7 descent | `℘(2z)`; `℘`; `℘′²` | duplication at `z = 0.3 + 0.17i`: `0.75722 + 1.51668i` both sides | sound | none; carried from the review at 1569ed9 |
| 2.1 `weierstrassZeta`, oddness, `ζ′ = −℘` | `z = l₀`; `z = 0` | junk `2/l₀` at `l₀`, odd; `ζ(0) = 0` | sound | none; carried from the review at 1569ed9 |
| 2.2 `quasiPeriod`, `_add`, `_smul`, `_congr` | `l = 0`; `c = 2`, `l = 1/3`; `(ω₂, ω₁)` | `η(0) = 0`; `−2.207299 = ½(−4.414598)`; `_congr` needs `l ∈ Λ` | sound | none; carried from the review at 1569ed9 |
| 2.3 Legendre, `ζ = σ′/σ` | `ℤ[i]`, both bases | `η(1) = 3.14160`, `η(i) = −3.14159i`, `η(1)i − η(i) = 6.28319i = 2πi`; reversed `−2πi` | agrees with ModularCurvesPartII §1.4a | none; carried from the review at 1569ed9 |
| 2.4 Eisenstein dictionary (mathematics) | constants; `τ = i`; `G₂(−1/τ)` | `60·2ζ(4) = 4π⁴/3`, `140·2ζ(6) = 8π⁶/27`; `g₂(ℤ[i]) = 189.0726` vs `(4π⁴/3)E₄(i) = 189.0727`; `(π²/3)E₂(i) = π`; `G2_S_transform` is `τ²G₂ − 2πiτ` | sound | none; carried from the review at 1569ed9 |
| 2.4 ownership of `g₂_ofUpperHalfPlane`, `g₃_ofUpperHalfPlane` (R01) | the constants against ModularForms §10D (lines 1211–1212) and EllipticCurvePeriodsAndModularParametrizations §1.1 (lines 470–476) at `ω₁ = 1`; `τ = i` | `60 · π⁴/45 = 4π⁴/3`, `140 · 2π⁶/945 = 8π⁶/27` in all three; at `τ = i`: `g₃ = 0`, `g₂ = (4π⁴/3)E₄(i) = 189.07` in each | mathematics agrees; two owners, §10D names this roadmap as consumer | R01 (P2); carried from the review at 1569ed9, heads unchanged |
| 3.1 `periodMatrix`, `det_periodMatrix` | `ℤ[i]`; exchanged; `γ = !![0,1;1,0]` | `!![1, i; π, −iπ]`, `det = −2πi`; `+2πi`; `det γ = −1` | sound | none; carried from the review at 1569ed9 |
| 3.2 `periodField`, `two_pi_I_mem_periodField` | both orientations; `ℤ[i]` | `det = ∓2πi ∈ F`; `F = ℚ(i, π)`, trdeg `1` | sound | none; carried from the review at 1569ed9 |
| 3.3 `trdeg_periodField_le` | four generators; `ℤ[i]`; `πℤ[i]` | `≤ 4`; `1`; `1` | sound | none; carried from the review at 1569ed9 |
| 3.4 `periodIdeal`, `ringKrullDim_periodIdeal` | `ℤ[i]`; determinant | `X₂₂ + X₁₂X₂₁ ↦ 0`, `X₁₂² + 1 ↦ 0`; `det ↦ −2πi ≠ 0`; finite-type domain, `dim = 1 = trdeg ℚ(i, π)` | hypotheses met | none; carried from the review at 1569ed9 |
| 3.5 `trdeg_periodField_smul`, `isAlgebraic_of_smul` | algebraic `c`; `c = π` | `c⁴ = g₂(L)/g₂(cL)`; `g₂(πL) = π⁻⁴` transcendental | sound | none; carried from the review at 1569ed9 |
| 4.1 `HasCM`, `hasCM_iff`, multipliers | `τ = i, i√2, iπ`; `α = 0, N, 1+i, 1/2` | `nτ² + (m−q)τ − p = 0`, `n ≠ 0`; `iπ` no integer quadratic; `[ℤ[i] : (1+i)ℤ[i]] = 2 = |1+i|²`; `α = 0` excluded; `ω₁/2 ∉ Λ` | sound | none; carried from the review at 1569ed9 |
| 4.2 `exists_weierstrassP_mul_eq` | `α = ±1, 2, 0, i` | `P = X`; duplication; excluded; `P = −X` | sound | none; carried from the review at 1569ed9 |
| 4.3 `exists_quasiPeriod_mul` | real `α`; `α = i`; `√−2` numerically | `b = 0`; `b = 0`; `b = 2.99106i` from three routes, `b² = −e₂²/2` algebraic | sound | none; carried from the review at 1569ed9 |
| 4.4 `trdeg_periodField_le_two_of_hasCM` | `ℤ[i]`; `√−2` numerically | `η₁ = 2πi/(2i) = π`; `3.278942` vs `3.278944`, `−1.646065i` both | sound | none; carried from the review at 1569ed9 |
| 5.1 `chudnovsky` | primitive `l`; `l = 0`; `πℤ[i]` | `E₄ = (3g₂/4)(l/π)⁴`, `E₆ = (27g₃/8)(l/π)⁶`, `E₂ = 3(l/π)(η(l)/π)`; `trdeg ≥ 3 − 1 = 2`; `(0, 0)`; `l/π = 1` | sound | none; carried from the review at 1569ed9 |
| 5.2 `two_le_trdeg_adjoin_invariants` | `ℤ[i]`, `l = 1`; `πℤ[i]` | `g₂(ℤ[i]), π` a.i.; `η_{πΛ}(π) = 1` | sound | none; carried from the review at 1569ed9 |
| 5.3 `two_le_trdeg_periodField` | `πℤ[i]`; `ℤ[i]` | `ω₁/π = 2iω₁/(2πi) ∈ F(i)`; trdeg `1` in both examples, hypothesis needed | sound | none; carried from the review at 1569ed9 |
| 5.4 `trdeg_periodField_eq_two_of_hasCM` | `c • ℤ[i]`, `c⁴ = g₂(ℤ[i])` | `g₂ = 1`, `g₃ = 0`, `E₆(i) = 0`, `2 ≤ trdeg ≤ 2` | sound | none; carried from the review at 1569ed9 |
| 5.5 corollaries | `ℤ[i]`; `c • ℤ[i]`; `ρ` | fails without algebraic invariants (`ω₁ = 1`); `c, π` a.i.; `(0, 1)` | sound | none; carried from the review at 1569ed9 |
| Downstream bullet on EllipticCurvePeriodsAndModularParametrizations (R02) | that README at 7a356fe6 | occurrences of `EllipticPeriods`, `GrothendieckPeriodConjecture`: 0; lines 470–476 prove the dictionary there | false at the current head | R02 (P3); carried, head unchanged |
| Research context: `ω₁²/π` ↔ `j′(τ)` (new, lines 813–816) | symbolic, any `τ`; `τ = i`, `τ = ρ`; `ℤ[i]` scaled to `g₂ = 1` | `j′ = −(9i/π)ω₁²(g₃/g₂)j`, source's `(18ω₁²/(2πi))(g₃/g₂)j`, equal; `τ = i`: `g₃ = 0 ⇒ j′ = 0` and `τ = ρ`: `g₂ = 0 ⇒ j = 0 ⇒ j′ = 0`, both excluded by `g₂g₃ ≠ 0` = source's `j′ ≠ 0`; `g₂ = 1, g₃ = 0`: excluded, consistent with Corollary 35's `j′(τ) ≠ 0` | sound; locators p. 167, Conjecture 34, Corollary 35 match the text | none |
| Research context: any two of `ω₁, η(ω₁), π` a.i. with CM (new, lines 816–819) | `ℤ[i]`, `α = i`, `b = 0`; general `α ∉ ℝ` | `0·1 − 2i·1·π + 2πi·1 = 0` with `n = 1 ≠ 0`; `η` over `ℚ(ω₁, π)` by division by `(α−ᾱ)ω₁ ≠ 0`, `π` by `n ≠ 0`, `ω₁` as root of `bX² − (α−ᾱ)ηX + 2πin` (constant term `≠ 0`); `trdeg ℚ(ω₁, η, π) = trdeg ℚ(ω₁, π) = 2` by 5.5 | sound; the form matches 4.4 line 649 | none |

## Not verifiable

- Silverman, AEC ch. VI and ATAEC chs. I–II (1.4, 2.4, 4.1): not legally available to me; checked for internal consistency only (R03).
- Lang 1971, Bull. AMS 77, p. 652 (Conjecture 34's origin, cited through Waldschmidt 2008 line 1127): not opened; the README cites it only through Waldschmidt.
- Bost–Charles, Grothendieck's Montpellier folder 18, Chudnovsky 1976 and 1984, Nesterenko 1996, André, Lang 1966: cited by locator only, as in the previous reviews; no target depends on them.
- The published Springer pages of Waldschmidt 2008 (DOI prefix 10.1007, paywalled): the author's copy read here carries the published layout (chapter number 7, running heads with printed page numbers), so the page locators were checked against it rather than against the publisher's file.

## Source issues

- none
