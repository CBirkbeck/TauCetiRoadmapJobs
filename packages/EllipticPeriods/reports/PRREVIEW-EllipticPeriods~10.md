# Review of EllipticPeriods (pull request #1059 at 636e708)

**Verdict:** needs changes

Incremental re-review of 44 changed lines in `TauCetiRoadmap/EllipticPeriods/` since a17e4ca (README +23/−21 in the Scope list, a new `### From ModularForms` contract, 2.4 and its `*Needs:*` line, Layer 2 Dependencies, the Downstream bullet on EllipticCurvePeriodsAndModularParametrizations and the Silverman References entry; `Suggested.lean` −8: `g₂_ofUpperHalfPlane`, `g₃_ofUpperHalfPlane` deleted and one docstring phrase). Nothing changed outside the folder; the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, toolchain `v4.36.0-rc2`) are unchanged. The change repairs the three findings of the previous report in the folder; what remains is one item of the previous R01's repair that lives in the pull request's description, and one wording defect the rewrite of 2.4 introduced. Neither is blocking.

## R01 (P3) — ModularForms §10D exists only at an open revision that the pull request does not name

Location: `TauCetiRoadmap/EllipticPeriods/README.md` lines 158–163 ("### From ModularForms … §10D, the lattice–modular comparison …"), also lines 33, 464, 488, 799; the pull request's description, depends-on list ("#913 ModularCurvesPartII" only).

Claim: ModularForms §10D supplies `G_{2m}(ℤ + ℤτ) = 2ζ(2m)E_{2m}(τ)` for `m ≥ 2` and the `g₂, g₃` comparison.

Witness: on main (`eaf17b1`) `TauCetiRoadmap/ModularForms/README.md` contains no "10D" (0 occurrences); the section exists only at the head of the open ModularForms revision (`3453d2b`, its README line 1273, the comparison at lines 1279–1283). The citation is correct there, and that revision's lines 1494–1495 name EllipticPeriods §2.4 as the consumer; but a citation of content that only an open revision defines is a dependency, and neither the pull request's description nor a merge-order paragraph names that revision (`scratch/overlaps.md`, "Ids this README cites that only an open revision defines").

Repair: add the ModularForms revision (pull request #1706) to the depends-on list of the pull request's description, after ModularCurvesPartII, so that it merges first. The README is right as it stands and never names a pull-request number. Tested: the four README citations of §10D (lines 33, 158, 464, 488, 799) all resolve at `3453d2b` to the statement quoted in the contract, so no README edit is needed.

## R02 (P3) — "Prove the last one" in 2.4 now points at the wrong identity

Location: `TauCetiRoadmap/EllipticPeriods/README.md` lines 452–455: "`E₂` is only quasi-modular and ModularForms §10D does not cover it; the companions `g₂ = (4π⁴/3) E₄(τ)` and `g₃ = (8π⁶/27) E₆(τ)` are §10D's (Exact supplier contracts). Prove the last one row by row: …".

Claim: the row-by-row proof is of `η(1) = G₂(τ) = (π²/3) E₂(τ)`.

Witness: before the change the sentence followed a list of three identities whose last was the `η(1)` one; now the nearest antecedents of "the last one" are the two companions, which the sentence just before says are §10D's and are not proved here. The proof that follows (rows `l = mτ + n`, `e2Summand m τ`, the symmetric sum defining `G2`) is the `η(1) = G₂(τ)` proof, so the mathematics is unaffected; the reference is wrong.

Repair: line 455, replace "Prove the last one row by row:" by "Prove `η(1) = G₂(τ)` row by row:". Tested on the instance: the rest of the sentence ("the series for `ζ(z+1) − ζ(z)` …, hence equal to the symmetric sum defining `G2`") then names exactly the identity it proves, and the following "Then `η(τ) = τ G₂(τ) − 2πi` by Legendre" still reads correctly.

## Previous findings

- R01 — partly repaired: Scope (lines 31–33), the new `### From ModularForms` contract (158–163), 2.4 (452–455, `*Needs:*` 464), Layer 2 Dependencies (488), the Downstream bullet (797–800) and `Suggested.lean` (the two theorems deleted, docstring line 34 "the `E₂` dictionary (2.4)") are all as the repair asked; the depends-on list of the pull request's description still names ModularCurvesPartII only. Raised again, for that item alone, as R01.
- R02 — repaired: lines 797–800 "EllipticCurvePeriodsAndModularParametrizations states, in its §1.1, the lattice invariance of `G_k` and the scaled dictionary, which are 0.2 and 2.4 here (and ModularForms §10D for `ℤ + ℤτ`), to be cited from there rather than restated." True at its head (below).
- R03 — repaired: lines 866–867 "GTM 151, 1994, ch. I–II (ch. II for Layer 4)"; the body's ATAEC locators are lines 467, 491 (ch. I, Layer 2) and 605 (ch. II, in 4.1, Layer 4).

## Verified sound

**The change.** `git diff --stat a17e4ca..HEAD` lists only the two files of the folder (README +23/−21, Lean −8); `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EllipticPeriods'` is empty; the worktree is clean; `lake-manifest.json` and `lean-toolchain` are unchanged. No process word, pull-request number, LaTeX delimiter or machine path enters the folder (the gate's counters below).

**The new supplier contract against ModularForms at its head.** ModularForms' open revision is now at `3453d2b` (2026-11-07, later than the `a24d49a2` the previous report read; §10D moved from line 1204 to 1273). Its lines 1279–1283 state, for `m ≥ 2`, `G_(2m)(Λ_z) = 2ζ(2m)E_(2m)(z)` with `E_(2m)` the native normalised series of constant term 1, hence `g₂(Λ_z) = (4π⁴/3)E₄(z)`, `g₃(Λ_z) = (8π⁶/27)E₆(z)`: exactly the contract at README lines 160–162, including the hypothesis `m ≥ 2` and the normalisation. Its lines 65–71 say ModularCurvesPartII and EllipticPeriods take the lattice–modular comparison from §10D "and nothing of either is cited here", and its lines 1494–1495 name EllipticPeriods §2.4 as the consumer of `g₂ = (4π⁴/3)E₄, g₃ = (8π⁶/27)E₆`: the ownership is now single (ModularForms owns, this roadmap cites), the direction is one-way, and ModularForms is on main and earlier than every roadmap in the merge order. `E₂` (quasi-modular, `G₂` conditionally convergent, `m = 1` excluded from §10D's `m ≥ 2`) stays here as `quasiPeriod_ofUpperHalfPlane_one`, which §10D does not state.

**The Downstream bullet against EllipticCurvePeriodsAndModularParametrizations at its head.** `rev/1715` is still `7a356fe6` (2026-11-03). Its `### 1.1 The period lattice, pinned by g₂ and g₃` runs from line 438 to 496; lines 470–476 state lattice invariance of `G_k` for `k > 2` and `g₂ = ω₁⁻⁴(4π⁴/3)E₄`, `g₃ = ω₁⁻⁶(8π⁶/27)E₆` for an oriented basis; line 490 computes the same constants. The bullet's "in its §1.1" and "the lattice invariance of `G_k` and the scaled dictionary" are both true there. That roadmap still names EllipticPeriods nowhere (0 occurrences), which the rewritten bullet no longer claims.

**Gate.** The worker's run at 636e708: every counter 0, `build=0 OK`. My plain rerun (`gate … --base origin/main`, no `--order`) gives the same counters with `depcheck=1 NOT IN ORDER: EllipticPeriods`, which is the pre-intake state of every new folder, not a defect; the dependency check with the merge-order candidate and `--movable`:

```
depcheck: 240 roadmaps, 2368 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line for this roadmap (2368 edges against 2364 at a17e4ca: the four new ModularForms §10D edges). ModularCurvesPartII is at 73 and EllipticPeriods at 74 in the candidate; ModularForms and DiophantineApproximationAndTranscendence are on main.

**Elaboration.** The worker's `SignatureCheck.lean` (`Suggested.lean` plus `#check @<name>` for all 40 declarations, verified by `diff` to differ only by those 41 lines) elaborated with `lake env lean` from the worktree in 11 s: exit 0, 32 `declaration uses 'sorry'` warnings and no other diagnostic. The 40 elaborated types are identical, whitespace-normalised and ignoring the `@`, to the 40 blocks of `signatures.md` (set comparison, 0 missing either way); none uses a section variable, so no binder can be lost. `grep -n 'g₂_ofUpperHalfPlane\|g₃_ofUpperHalfPlane'` on both files is empty: the deleted names are referenced nowhere. Single `import Mathlib`, module form, no `set_option`, no sorried data, 270 lines.

**One-tactic probe.** On a scratch copy every `sorry` (31 on `:= sorry`/`:= by sorry` lines, one on its own line at 148) replaced by `by first | rfl | simp_all | decide | trivial`: errors at exactly the 32 probe lines (21 "assumption failed", 10 "unsolved goals", the line-148 site a parse error from the bare-line form), 0 `sorry` warnings left. No sorried theorem closes in one tactic at the pins: no padding. The two Lean names `citations.md` could not find (`IsEllipticFunction.finsum_meromorphicOrderAt_eq_zero`, `IsEllipticFunction.exists_eq_div_weierstrassP`) are this roadmap's own declarations (`Suggested.lean` lines 104 and 109), as before.

**Headlines.** The five headlines of the module docstring (3.3, 5.1, 5.3, 4.4, 5.4) are stated; the deletion removed two intermediate dictionary statements, not a headline, and the docstring's sentence on 2.4 was updated to "the `E₂` dictionary". The scaled dictionary 5.1 uses (`E₄(τ) = (3g₂/4)(l/π)⁴`, `E₆(τ) = (27g₃/8)(l/π)⁶`) is still 2.4's (lines 459–461), now derived from §10D and 0.1 rather than from two local theorems; 5.1's `*Needs:*` ("2.4 (the scaled dictionary)") and the contract's "Consumed by 2.4 … and through it by 5.1" agree.

**Seeded sample.** None of the fifteen sampled targets (0.2, 0.3, 1.6, 1.7, 2.2, 2.3, 3.1, 3.2, 3.3, 4.1, 4.2, 4.3, 4.4, 5.2, 5.4) is in a changed passage; the only sampled passage the change touches indirectly is 2.3's neighbour 2.4, checked above. All fifteen are byte-identical to the heads verified at a1d420d, 40c294b, 7406ad2, ceceba6, 1569ed9 and a17e4ca, whose reports record the cache passages behind their locators (Chudnovsky ICM 1978 §0, Theorem 1, Corollary 2, Theorem 3, display (4), (9); DLMF 23.2.5, 23.2.14, 23.3.4, 23.8.5, 23.9.5; Waldschmidt math/0502582 Théorème 3.1; Waldschmidt 2008 Corollaries 32, 35, Conjecture 34).

**Overlaps and citations.** `overlaps.md`: no other open pull request changes this roadmap, no dropped id either way; the one "only an open revision defines" item is R01. `citations.md`: no cross-roadmap citation found nowhere.

**Adversarial table.** Rows for the unchanged statements are carried from the previous report (which carried them, with their values, from the reviews at ceceba6 and before); the last four rows are computed this round.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 `SMul`, `G_smul` | `k = 0, 1, 2`; `k = 4, c = 2`; `c = −1` | `G₄(2Λ) = G₄/16`; odd `k`: `0 = 0`; `k ≤ 2` both sides `0` (junk) | sound | none; carried from the review at a17e4ca |
| 0.2, 0.3 lattice invariance, `ofUpperHalfPlane` | `ℤ[i]`, `I • L`; `(τ, 1)` | `iℤ[i] = ℤ[i]`, `G₆ = −G₆ ⇒ g₃(ℤ[i]) = 0`; `(1/τ).im < 0` | sound | none; carried from the review at a17e4ca |
| 1.1 `IsEllipticFunction` | `℘`, `℘′`, `℘(2z)`, constant; `ζ`, `z` | `ζ(z+1) − ζ(z) = π ≠ 0` on `ℤ[i]` | Checks discriminate | none; carried from the review at a17e4ca |
| 1.2 Liouville | constant; `℘`; `z ↦ z` | `℘` order `−2` at `0`; `z` not periodic | hypotheses needed | none; carried from the review at a17e4ca |
| 1.3 `finsum_meromorphicOrderAt_eq_zero` | `℘ − e₁`; `1`; codiscrete `0` | orders `−2 + 2 = 0`; all `0`; all `⊤`, excluded by `hne` | sound | none; carried from the review at a17e4ca |
| 1.4 structure | `℘′²`; `0`; `℘′` | `P = 4X³ − g₂X − g₃, Q = 1`; `P = 0`; `℘′` odd, excluded | sound | none; carried from the review at a17e4ca |
| 1.5 half-period values | `ℤ[i]`; `ℤ[ρ]` | `℘(1/2) = 6.87518 = −℘(i/2)`, `4e² = 189.0726 = g₂`; `64e⁶ = g₂³`; `g₂(ℤ[ρ]) = 0` | sound | none; carried from the review at a17e4ca |
| 1.6 Laurent, `G_mem_adjoin` | `n = 3, 4`; numerically `c₁` | `c₃ = g₂²/1200`, `c₄ = 3g₂g₃/6160`; `(℘(0.05) − 400)/0.05² = 9.4538` vs `g₂/20 = 9.4536` | sound | none; carried from the review at a17e4ca |
| 1.7 descent | `℘(2z)`; `℘`; `℘′²` | duplication at `z = 0.3 + 0.17i`: `0.75722 + 1.51668i` both sides | sound | none; carried from the review at a17e4ca |
| 2.1 `weierstrassZeta`, oddness, `ζ′ = −℘` | `z = l₀`; `z = 0` | junk `2/l₀` at `l₀`, odd; `ζ(0) = 0` | sound | none; carried from the review at a17e4ca |
| 2.2 `quasiPeriod`, `_add`, `_smul`, `_congr` | `l = 0`; `c = 2`, `l = 1/3`; `(ω₂, ω₁)` | `η(0) = 0`; `−2.207299 = ½(−4.414598)`; `_congr` needs `l ∈ Λ` | sound | none; carried from the review at a17e4ca |
| 2.3 Legendre, `ζ = σ′/σ` | `ℤ[i]`, both bases | `η(1) = 3.14160`, `η(i) = −3.14159i`, `η(1)i − η(i) = 6.28319i = 2πi`; reversed `−2πi` | agrees with ModularCurvesPartII §1.4a | none; carried from the review at a17e4ca |
| 2.4 `E₂` dictionary (mathematics) | constants; `τ = i`; `G₂(−1/τ)` | `(π²/3)E₂(i) = (π²/3)(3/π) = π = η(1)`; `G2_S_transform` is `τ²G₂ − 2πiτ` | sound | none; carried from the review at a17e4ca |
| 3.1 `periodMatrix`, `det_periodMatrix` | `ℤ[i]`; exchanged; `γ = !![0,1;1,0]` | `!![1, i; π, −iπ]`, `det = −2πi`; `+2πi`; `det γ = −1` | sound | none; carried from the review at a17e4ca |
| 3.2 `periodField`, `two_pi_I_mem_periodField` | both orientations; `ℤ[i]` | `det = ∓2πi ∈ F`; `F = ℚ(i, π)`, trdeg `1` | sound | none; carried from the review at a17e4ca |
| 3.3 `trdeg_periodField_le` | four generators; `ℤ[i]`; `πℤ[i]` | `≤ 4`; `1`; `1` | sound | none; carried from the review at a17e4ca |
| 3.4 `periodIdeal`, `ringKrullDim_periodIdeal` | `ℤ[i]`; determinant | `X₂₂ + X₁₂X₂₁ ↦ 0`, `X₁₂² + 1 ↦ 0`; `det ↦ −2πi ≠ 0`; finite-type domain, `dim = 1 = trdeg ℚ(i, π)` | hypotheses met | none; carried from the review at a17e4ca |
| 3.5 `trdeg_periodField_smul`, `isAlgebraic_of_smul` | algebraic `c`; `c = π` | `c⁴ = g₂(L)/g₂(cL)`; `g₂(πL) = π⁻⁴` transcendental | sound | none; carried from the review at a17e4ca |
| 4.1 `HasCM`, `hasCM_iff`, multipliers | `τ = i, i√2, iπ`; `α = 0, N, 1+i, 1/2` | `nτ² + (m−q)τ − p = 0`, `n ≠ 0`; `iπ` no integer quadratic; `[ℤ[i] : (1+i)ℤ[i]] = 2 = |1+i|²`; `α = 0` excluded; `ω₁/2 ∉ Λ` | sound | none; carried from the review at a17e4ca |
| 4.2 `exists_weierstrassP_mul_eq` | `α = ±1, 2, 0, i` | `P = X`; duplication; excluded; `P = −X` | sound | none; carried from the review at a17e4ca |
| 4.3 `exists_quasiPeriod_mul` | real `α`; `α = i`; `√−2` numerically | `b = 0`; `b = 0`; `b = 2.99106i` from three routes, `b² = −e₂²/2` algebraic | sound | none; carried from the review at a17e4ca |
| 4.4 `trdeg_periodField_le_two_of_hasCM` | `ℤ[i]`; `√−2` numerically | `η₁ = 2πi/(2i) = π`; `3.278942` vs `3.278944`, `−1.646065i` both | sound | none; carried from the review at a17e4ca |
| 5.1 `chudnovsky` | primitive `l`; `l = 0`; `πℤ[i]` | `E₄ = (3g₂/4)(l/π)⁴`, `E₆ = (27g₃/8)(l/π)⁶`, `E₂ = 3(l/π)(η(l)/π)`; `trdeg ≥ 3 − 1 = 2`; `(0, 0)`; `l/π = 1` | sound | none; carried from the review at a17e4ca |
| 5.2 `two_le_trdeg_adjoin_invariants` | `ℤ[i]`, `l = 1`; `πℤ[i]` | `g₂(ℤ[i]), π` a.i.; `η_{πΛ}(π) = 1` | sound | none; carried from the review at a17e4ca |
| 5.3 `two_le_trdeg_periodField` | `πℤ[i]`; `ℤ[i]` | `ω₁/π = 2iω₁/(2πi) ∈ F(i)`; trdeg `1` in both examples, hypothesis needed | sound | none; carried from the review at a17e4ca |
| 5.4 `trdeg_periodField_eq_two_of_hasCM` | `c • ℤ[i]`, `c⁴ = g₂(ℤ[i])` | `g₂ = 1`, `g₃ = 0`, `E₆(i) = 0`, `2 ≤ trdeg ≤ 2` | sound | none; carried from the review at a17e4ca |
| 5.5 corollaries | `ℤ[i]`; `c • ℤ[i]`; `ρ` | fails without algebraic invariants (`ω₁ = 1`); `c, π` a.i.; `(0, 1)` | sound | none; carried from the review at a17e4ca |
| Research context: `ω₁²/π` ↔ `j′(τ)`; any two of `ω₁, η(ω₁), π` a.i. with CM | symbolic; `τ = i, ρ`; `ℤ[i]`, `α = i` | `j′ = −(9i/π)ω₁²(g₃/g₂)j`; `bω₁² − (α−ᾱ)ω₁η + 2πin = 0` with `n ≠ 0`; trdeg `2` by 5.5 | sound | none; carried from the review at a17e4ca |
| From ModularForms §10D contract (new, lines 158–163) | `m = 2, 3` constants; `m = 1`; `τ = i`; scaling `c = ω₁` | `2ζ(4) = π⁴/45`, `60·π⁴/45 = 4π⁴/3`; `2ζ(6) = 2π⁶/945`, `140·2π⁶/945 = 280π⁶/945 = 8π⁶/27` (`945 = 35·27`, `280 = 35·8`), equal to ModularForms lines 1279–1283 and ECPMP line 490; `m = 1` excluded by `m ≥ 2` (`G₂` conditionally convergent), handled by `quasiPeriod_ofUpperHalfPlane_one`; `τ = i`: `E₆(i) = 0 ⇒ g₃(ℤ[i]) = 0`, matching `G₆(iΛ) = i⁻⁶G₆ = −G₆`; `g₂(ω₁Λ_τ) = ω₁⁻⁴(4π⁴/3)E₄(τ)` by 0.1 at `k = 4` | sound; single owner | R01 (P3): the revision is unnamed in the depends-on list |
| 2.4 rewritten paragraph (lines 452–462) | the three identities named; the proof that follows | the row-by-row proof computes `ζ(z+1) − ζ(z) = ∑_m e2Summand m τ = G₂(τ)` (with `e2Summand 0 τ = 2ζ(2) = π²/3`), i.e. the `η(1)` identity, not `g₃ = (8π⁶/27)E₆` which "the last one" now names | mathematics unchanged; antecedent wrong | R02 (P3) |
| Downstream bullet on EllipticCurvePeriodsAndModularParametrizations (lines 797–800) | that README at 7a356fe6 | §1.1 = lines 438–496; invariance of `G_k`, `k > 2`, and `g₂ = ω₁⁻⁴(4π⁴/3)E₄`, `g₃ = ω₁⁻⁶(8π⁶/27)E₆` at 470–476; occurrences of EllipticPeriods: 0, no longer claimed | true at the current head | none (R02 of the previous report repaired) |
| References, Silverman entry (lines 865–867) | body locators | `grep -n ATAEC`: 467, 491 (ch. I, Layer 2), 605 (ch. II, 4.1 in Layer 4); entry "ch. I–II (ch. II for Layer 4)" | covers every locator | none (R03 of the previous report repaired) |

## Not verifiable

- Silverman, AEC ch. VI and ATAEC chs. I–II (1.4, 2.4, 4.1): not legally available to me; checked for internal consistency only (the References entry now covers both chapters).
- Lang 1971, Bull. AMS 77, p. 652 (Conjecture 34's origin, cited through Waldschmidt 2008): not opened; the README cites it only through Waldschmidt.
- Bost–Charles, Grothendieck's Montpellier folder 18, Chudnovsky 1976 and 1984, Nesterenko 1996, André, Lang 1966: cited by locator only, as in the previous reviews; no target depends on them.
- Milne, *Modular Functions and Modular Forms*, Proposition 3.10, cited by ModularForms §10D for the lattice–modular comparison: a supplier's locator, not this roadmap's; not re-opened this round.

## Source issues

- none
