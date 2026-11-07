# Review of EllipticPeriods (pull request #1059 at 2e239b9)

**Verdict:** needs changes

Incremental re-review of the 3 lines of `TauCetiRoadmap/EllipticPeriods/` that changed since 636e708. The change is in the Scope list of `README.md` (lines 31–34): the roadmap now names "the scaled dictionary for a positive period pair (Layer 2)" next to the `E₂` dictionary. The new line is correct and agrees with every passage that depends on it. Neither finding of the previous report is repaired at this head, so both are raised again below. Both are P3, and nothing blocks.

## R01 (P3) — ModularForms §10D is defined only at an open revision, and the pull request does not name that revision

Location: `TauCetiRoadmap/EllipticPeriods/README.md` line 34 ("`ℤ + ℤτ` is ModularForms §10D's … and is consumed"), lines 159–164 (`### From ModularForms`, "§10D, the lattice–modular comparison …"), and lines 455, 465, 489 and 800. In the pull request's description, the depends-on list names only "#913 ModularCurvesPartII".

Claim: ModularForms §10D supplies `G_{2m}(ℤ + ℤτ) = 2ζ(2m)E_{2m}(τ)` for `m ≥ 2`, and from it the `g₂, g₃` comparison that 2.4 and 5.1 consume.

Witness: on main (eaf17b1), `TauCetiRoadmap/ModularForms/README.md` has no §10D. The section exists only at the head of the open ModularForms revision, #1706 at 3453d2b: the heading is at line 1273, the comparison at lines 1279–1283, and the naming of EllipticPeriods §2.4 as consumer at line 1495. `scratch/overlaps.md` lists this as "only an open revision defines".

Repair: add the ModularForms revision (#1706) to the depends-on list of the pull request's description, after ModularCurvesPartII. In the description's "Boundary" paragraph, say that the `g₂, g₃` comparison for `ℤ + ℤτ` comes from ModularForms §10D. The README needs no edit, and it must not name a pull-request number. Tested: all six README citations of §10D (lines 34, 161, 455, 465, 489, 800) resolve at 3453d2b to the statement the contract quotes.

## R02 (P3) — In 2.4, "Prove the last one" points at the wrong identity

Location: `TauCetiRoadmap/EllipticPeriods/README.md` lines 454–456: "… the companions `g₂ = (4π⁴/3) E₄(τ)` and `g₃ = (8π⁶/27) E₆(τ)` are §10D's (Exact supplier contracts). Prove the last one row by row: …".

Claim: the row-by-row proof is a proof of `η(1) = G₂(τ) = (π²/3)E₂(τ)`.

Witness: the identities nearest before "the last one" are the two companions, and the previous sentence says these come from §10D and are not proved here. The proof that follows (rows `l = mτ + n`, `e2Summand m τ`, then the symmetric sum that defines `G2`) proves the `η(1)` identity. The mathematics is right; only the reference is wrong.

Repair: on line 456, replace "Prove the last one row by row:" with "Prove `η(1) = G₂(τ)` row by row:". Tested on the instance: the rest of the sentence ("the series for `ζ(z+1) − ζ(z)` …, hence equal to the symmetric sum defining `G2`") then names the identity it proves. The next sentence, "Then `η(τ) = τ G₂(τ) − 2πi` by Legendre", still reads correctly.

## Previous findings

- R01 — not repaired: at this head the README still cites §10D at lines 34, 161, 455, 465, 489 and 800 (correct at #1706's head). The depends-on list in the description still names only "#913 ModularCurvesPartII". Raised again as R01.
- R02 — not repaired: line 456 still reads "Prove the last one row by row:" and follows the sentence that hands `g₂ = (4π⁴/3)E₄`, `g₃ = (8π⁶/27)E₆` to §10D. Raised again as R02.

## Verified sound

**The change.** `git diff --stat 636e708..HEAD` lists only `README.md` (+2/−1, lines 31–34). `Suggested.lean`, `lake-manifest.json` and `lean-toolchain` are unchanged, and `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EllipticPeriods'` is empty. The pins are unchanged: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`. The worktree is clean.

**The new Scope line against what depends on it.** Line 32 says this roadmap owns "the scaled dictionary for a positive period pair (Layer 2)". Every other use of the phrase denotes the same object:

- 2.4 defines it at lines 461–463: "for any positive `L` with `τ = ω₂/ω₁`: `g₂ = ω₁⁻⁴(4π⁴/3)E₄(τ)`, `g₃ = ω₁⁻⁶(8π⁶/27)E₆(τ)`, `η(ω₁) = ω₁⁻¹(π²/3)E₂(τ)` (the scaled dictionary)".
- The ModularForms contract (line 163: "Consumed by 2.4 (the scaled dictionary) and through it by 5.1") and 5.1's `*Needs:*` (line 697: "2.4 (the scaled dictionary)") refer to it.
- The Downstream bullet on EllipticCurvePeriodsAndModularParametrizations (lines 798–801) refers to it.

"Positive" is the Conventions' notion (line 78, `0 < (L.ω₂ / L.ω₁).im`), and line 230 uses it the same way. The Scope line still sends the `ℤ + ℤτ` comparison to ModularForms §10D (lines 33–34). So the roadmap owns only the general-basis corollary (§10D together with 0.1's homogeneity), plus the `E₂` and `η` parts that §10D does not cover.

**Ownership of the scaled dictionary against open work.** `roadmaps grep '4π⁴/3|8π⁶/27|scaled dictionary'` finds the object in three open roadmaps:

- this one (lines 32–33, 163, 455, 462, 697, 800);
- ModularForms at 3453d2b: `ℤ + ℤτ` only, lines 1281–1282, which this roadmap consumes;
- EllipticCurvePeriodsAndModularParametrizations at 7a356fe6: §1.1, lines 470–476. It proves `G₄ = ω₁⁻⁴(π⁴/45)E₄`, `G₆ = ω₁⁻⁶(2π⁶/945)E₆` for an oriented basis, and its Scope lines 42–43 claim the "normalized Eisenstein-sum comparisons".

ModularCurvesPartII (#913) does not state the comparison (its README has no `E₄` dictionary). The ownership is settled on this roadmap's side:

- This roadmap is at position 80 of the merge-order candidate.
- EllipticCurvePeriodsAndModularParametrizations is not in the order, and it consumes EllipticCurveModularity R29.3 (its line 379), which is at position 167. So it is placed after this roadmap.
- This roadmap's Downstream bullet already tells it to cite 2.4 instead of restating it.

The duplicate is that roadmap's to remove (cite EllipticPeriods §2.4, and ModularForms §10D for `ℤ + ℤτ`), not a change here. That roadmap still names EllipticPeriods nowhere (0 occurrences).

**Libraries at the pins.**

- Mathlib `Mathlib/NumberTheory/ModularForms/EisensteinSeries/E2/Defs.lean`: line 34 is `e2Summand m z = ∑' n, eisSummand 2 ![m, n] z`; line 57 is `G2` as the `symmetricIcc` sum; line 61 is `E2 = (1 / (2 * riemannZeta 2)) • G2`; line 64 is `D2`. So `G₂ = 2ζ(2)E₂ = (π²/3)E₂`, as 2.4 and the Scope line say.
- The Scope line cites `EisensteinSeries.E2`. It exists under that name (namespace `EisensteinSeries`, line 31).

**Gate.** The worker's run at 2e239b9 has every counter at 0 and ends `build=0 OK`. My plain rerun (`gate … --base origin/main`, no `--order`) gives the same counters except `depcheck=1 NOT IN ORDER: EllipticPeriods (insert it after its last supplier)`. That is how every new folder looks before intake, not a defect. The dependency check with the merge-order candidate and `--movable`:

```
depcheck: 240 roadmaps, 2430 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line for this roadmap. ModularCurvesPartII is at position 79 and EllipticPeriods at 80. ModularForms and DiophantineApproximationAndTranscendence are on main.

**Elaboration.** I ran `scratch/SignatureCheck.lean`, which is `Suggested.lean` plus `#check @TauCetiRoadmap.EllipticPeriods.<name>` for all 40 declarations; `diff` shows it differs from the original by exactly those 41 lines. I elaborated it with `lake env lean` from the worktree:

- exit 0 in 6 s, with 32 `declaration uses sorry` warnings and no other diagnostic;
- the 40 elaborated types are identical to the 40 blocks of `signatures.md` after normalising whitespace and the leading `@` (set comparison: 0 missing either way);
- the file has no `variable` or `include` line, so no binder can be lost.

The file has a single `import Mathlib` (in module form), no `set_option`, no `lemma` and no sorried data, in 270 lines.

**One-tactic probe.** On a scratch copy I replaced all 32 `sorry` sites (31 `:= sorry`/`:= by sorry`, plus the bare `sorry` on line 148) with `by first | rfl | simp_all | decide | trivial`. The result has errors at exactly the 32 sites (lines 90 to 268) and no `sorry` warnings left. No sorried theorem closes in one tactic, so there is no padding. The two names that `citations.md` could not find (`IsEllipticFunction.finsum_meromorphicOrderAt_eq_zero`, `IsEllipticFunction.exists_eq_div_weierstrassP`) are this roadmap's own declarations (`Suggested.lean` lines 104 and 109).

**Headlines.** The module docstring lists five headlines: 3.3 `trdeg_periodField_le`, 5.1 `chudnovsky`, 5.3 `two_le_trdeg_periodField`, 4.4 `trdeg_periodField_le_two_of_hasCM` and 5.4 `trdeg_periodField_eq_two_of_hasCM`. All five are stated and unchanged. The docstring names 2.3 `ζ = σ′/σ` as not statable, because `latticeSigma` is missing at the pins. The change touches no Lean statement.

**Seeded sample.** The sampled targets are 0.2, 0.3, 1.2, 1.3, 1.4, 1.5, 1.6, 2.4, 3.2, 3.4, 4.2, 5.1, 5.3, 5.4 and 5.5. Only 2.4 (named by the changed line) and 5.1 (its consumer through the scaled dictionary) depend on the change. I re-read both in the cache this round:

- 2.4: DLMF 23.8.5, `dlmf23-8` line 217. It gives `η₁` for half-periods as `π²/(2ω₁)` times `1/6` plus the cosecant series in `nπω₃/ω₁`, and line 210 gives the bracketing convention. With `csc²(nπτ) = −4∑_k k qⁿᵏ`, this is exactly `η(ω₁) = ω₁⁻¹(π²/3)E₂(τ)` in full periods, which is the `η` part of the scaled dictionary.
- 5.1: `chudnovsky-icm78`. Line 14557 states the standing hypothesis of algebraic `g₂, g₃`. Lines 14710–14712 are Theorem 3: `π/ω` and `η/ω` are algebraically independent for every period and quasi-period pair.

The other thirteen sampled targets are byte-identical to 636e708. Their locators were checked in the reviews at a1d420d through 636e708: DLMF 23.2.5, 23.2.14, 23.3.4 and 23.9.5; Chudnovsky ICM 1978 §0, Theorem 1, Corollary 2 and display (4); Waldschmidt math/0502582 Théorème 3.1; Waldschmidt 2008 Corollaries 32 and 35.

**Overlaps and citations.** `overlaps.md` reports no other open pull request that changes this roadmap and no dropped id in either direction. Its one "only an open revision defines" item is R01. ModularForms at #1706 is still at 3453d2b (2026-11-07). Lines 65–71 there state that EllipticPeriods takes the lattice–modular comparison from §10D, and line 1495 names 2.4 as the consumer, so the edge is one-way. `citations.md` lists no cross-roadmap citation that resolves nowhere.

**Adversarial table.** The rows for statements this change leaves untouched are carried from the previous review (at 636e708), with the values computed there. The last six rows are computed this round.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 `SMul`, `G_smul` | `k = 0, 1, 2`; `k = 4, c = 2`; `c = −1` | `G₄(2Λ) = G₄/16`; odd `k`: `0 = 0`; `k ≤ 2` both sides `0` (junk) | sound | none; carried from the review at 636e708 |
| 0.2, 0.3 lattice invariance, `ofUpperHalfPlane` | `ℤ[i]`, `I • L`; `(τ, 1)` | `iℤ[i] = ℤ[i]`, `G₆ = −G₆ ⇒ g₃(ℤ[i]) = 0`; `(1/τ).im < 0` | sound | none; carried from the review at 636e708 |
| 1.1 `IsEllipticFunction` | `℘`, `℘′`, `℘(2z)`, constant; `ζ`, `z` | `ζ(z+1) − ζ(z) = π ≠ 0` on `ℤ[i]` | Checks discriminate | none; carried from the review at 636e708 |
| 1.2 Liouville | constant; `℘`; `z ↦ z` | `℘` order `−2` at `0`; `z` not periodic | hypotheses needed | none; carried from the review at 636e708 |
| 1.3 `finsum_meromorphicOrderAt_eq_zero` | `℘ − e₁`; `1`; codiscrete `0` | orders `−2 + 2 = 0`; all `0`; all `⊤`, excluded by `hne` | sound | none; carried from the review at 636e708 |
| 1.4 structure | `℘′²`; `0`; `℘′` | `P = 4X³ − g₂X − g₃, Q = 1`; `P = 0`; `℘′` odd, excluded | sound | none; carried from the review at 636e708 |
| 1.5 half-period values | `ℤ[i]`; `ℤ[ρ]` | `℘(1/2) = 6.87518 = −℘(i/2)`, `4e² = 189.0726 = g₂`; `64e⁶ = g₂³`; `g₂(ℤ[ρ]) = 0` | sound | none; carried from the review at 636e708 |
| 1.6 Laurent, `G_mem_adjoin` | `n = 3, 4`; numerically `c₁` | `c₃ = g₂²/1200`, `c₄ = 3g₂g₃/6160`; `(℘(0.05) − 400)/0.05² = 9.4538` vs `g₂/20 = 9.4536` | sound | none; carried from the review at 636e708 |
| 1.7 descent | `℘(2z)`; `℘`; `℘′²` | duplication at `z = 0.3 + 0.17i`: `0.75722 + 1.51668i` both sides | sound | none; carried from the review at 636e708 |
| 2.1 `weierstrassZeta`, oddness, `ζ′ = −℘` | `z = l₀`; `z = 0` | junk `2/l₀` at `l₀`, odd; `ζ(0) = 0` | sound | none; carried from the review at 636e708 |
| 2.2 `quasiPeriod`, `_add`, `_smul`, `_congr` | `l = 0`; `c = 2`, `l = 1/3`; `(ω₂, ω₁)` | `η(0) = 0`; `−2.207299 = ½(−4.414598)`; `_congr` needs `l ∈ Λ` | sound | none; carried from the review at 636e708 |
| 2.3 Legendre, `ζ = σ′/σ` | `ℤ[i]`, both bases | `η(1) = 3.14160`, `η(i) = −3.14159i`, `η(1)i − η(i) = 6.28319i = 2πi`; reversed `−2πi` | agrees with ModularCurvesPartII §1.4a | none; carried from the review at 636e708 |
| 3.1 `periodMatrix`, `det_periodMatrix` | `ℤ[i]`; exchanged; `γ = !![0,1;1,0]` | `!![1, i; π, −iπ]`, `det = −2πi`; `+2πi`; `det γ = −1` | sound | none; carried from the review at 636e708 |
| 3.2 `periodField`, `two_pi_I_mem_periodField` | both orientations; `ℤ[i]` | `det = ∓2πi ∈ F`; `F = ℚ(i, π)`, trdeg `1` | sound | none; carried from the review at 636e708 |
| 3.3 `trdeg_periodField_le` | four generators; `ℤ[i]`; `πℤ[i]` | `≤ 4`; `1`; `1` | sound | none; carried from the review at 636e708 |
| 3.4 `periodIdeal`, `ringKrullDim_periodIdeal` | `ℤ[i]`; determinant | `X₂₂ + X₁₂X₂₁ ↦ 0`, `X₁₂² + 1 ↦ 0`; `det ↦ −2πi ≠ 0`; `dim = 1 = trdeg ℚ(i, π)` | hypotheses met | none; carried from the review at 636e708 |
| 3.5 `trdeg_periodField_smul`, `isAlgebraic_of_smul` | algebraic `c`; `c = π` | `c⁴ = g₂(L)/g₂(cL)`; `g₂(πL) = π⁻⁴` transcendental | sound | none; carried from the review at 636e708 |
| 4.1 `HasCM`, `hasCM_iff`, multipliers | `τ = i, i√2, iπ`; `α = 0, N, 1+i, 1/2` | `nτ² + (m−q)τ − p = 0`, `n ≠ 0`; `iπ` no integer quadratic; `[ℤ[i] : (1+i)ℤ[i]] = 2 = |1+i|²`; `α = 0` excluded; `ω₁/2 ∉ Λ` | sound | none; carried from the review at 636e708 |
| 4.2 `exists_weierstrassP_mul_eq` | `α = ±1, 2, 0, i` | `P = X`; duplication; excluded; `P = −X` | sound | none; carried from the review at 636e708 |
| 4.3 `exists_quasiPeriod_mul` | real `α`; `α = i`; `√−2` numerically | `b = 0`; `b = 0`; `b = 2.99106i` from three routes, `b² = −e₂²/2` algebraic | sound | none; carried from the review at 636e708 |
| 4.4 `trdeg_periodField_le_two_of_hasCM` | `ℤ[i]`; `√−2` numerically | `η₁ = 2πi/(2i) = π`; `3.278942` vs `3.278944`, `−1.646065i` both | sound | none; carried from the review at 636e708 |
| 5.2 `two_le_trdeg_adjoin_invariants` | `ℤ[i]`, `l = 1`; `πℤ[i]` | `g₂(ℤ[i]), π` a.i.; `η_{πΛ}(π) = 1` | sound | none; carried from the review at 636e708 |
| 5.3 `two_le_trdeg_periodField` | `πℤ[i]`; `ℤ[i]` | `ω₁/π = 2iω₁/(2πi) ∈ F(i)`; trdeg `1` in both examples, hypothesis needed | sound | none; carried from the review at 636e708 |
| 5.4 `trdeg_periodField_eq_two_of_hasCM` | `c • ℤ[i]`, `c⁴ = g₂(ℤ[i])` | `g₂ = 1`, `g₃ = 0`, `E₆(i) = 0`, `2 ≤ trdeg ≤ 2` | sound | none; carried from the review at 636e708 |
| 5.5 corollaries | `ℤ[i]`; `c • ℤ[i]`; `ρ` | fails without algebraic invariants (`ω₁ = 1`); `c, π` a.i.; `(0, 1)` | sound | none; carried from the review at 636e708 |
| Research context | symbolic; `τ = i, ρ`; `ℤ[i]`, `α = i` | `j′ = −(9i/π)ω₁²(g₃/g₂)j`; `bω₁² − (α−ᾱ)ω₁η + 2πin = 0`, `n ≠ 0`; trdeg `2` by 5.5 | sound | none; carried from the review at 636e708 |
| Scope line 32, the scaled dictionary for a positive pair (2.4 lines 461–463) | positive `(ω₁, ω₂) = (1+i, 0.3+2i)`, `τ = 1.15 + 0.85i`; `ζ` difference at `z = 0.37 + 0.21i` (box sums, `|a|, |b| ≤ 400`); `q`-series to 60 terms | `g₂`: lattice `−53.90057 − 31.75317i`, scaled `−53.90055 − 31.75318i`; `g₃`: `82.659025 − 10.276038i` both; `η(ω₁)`: lattice `1.378924 − 1.690237i`, scaled `1.378925 − 1.690241i` | sound | none |
| Same, negative controls | `(ω₁, −ω₂)`; `(−ω₁, −ω₂)`; `(ω₁, ω₂ + ω₁)` | `τ = −1.15 − 0.85i ∉ ℍ`, `|q| = 208.66`, so `E₄(τ)` is undefined and positivity is needed; `(−ω₁)⁻⁴ = ω₁⁻⁴` and `η(−ω₁) = −η(ω₁)` match `(−ω₁)⁻¹`; `τ + 1`: `E_k(τ+1) = E_k(τ)` | basis-independence consistent | none |
| 2.4 `η(1) = G₂ = (π²/3)E₂` against DLMF 23.8.5 (`dlmf23-8` line 217) and Mathlib `E2` (Defs.lean line 61) | half periods `ω₁ = 1/2`, `ω₃ = i/2`; `csc²` expansion | `2η₁ = 2π²(1/6 − ∑ sinh⁻²(nπ)) = 3.14159265 = π = (π²/3)(3/π)`; `∑ csc²(nπτ) = −4∑σ₁(N)q^N` gives `(π²/3)(1 − 24∑σ₁q^N)`; `2ζ(2) = 3.289868 = π²/3` | locator supports the statement, including the scaled `η` form | none |
| 5.1 `chudnovsky` through the scaled dictionary (`chudnovsky-icm78` lines 14557, 14710–14712) | invert 2.4; field equality | `E₄ = 3g₂l⁴/(4π⁴)`, `E₆ = 27g₃l⁶/(8π⁶)`, `E₂ = 3lη(l)/π²`, matching README line 692; `ℚ(l/π, η/π) = ℚ(π/l, η/l)` since `l/π = (π/l)⁻¹`, `η/π = (η/l)(l/π)` | sound | none |
| From ModularForms §10D contract (lines 159–164) | `m = 2, 3`; `m = 1`; #1706 at 3453d2b | `60·π⁴/45 = 4π⁴/3`; `140·2π⁶/945 = 8π⁶/27`; `m = 1` excluded (`G₂` conditionally convergent); §10D at lines 1273/1279–1283, only at that head | mathematically sound; revision unnamed | R01 (P3) |
| 2.4 paragraph, lines 453–456 | the antecedent of "the last one" | nearest antecedent is `g₃ = (8π⁶/27)E₆` (§10D's); the proof computes `ζ(z+1) − ζ(z) = ∑_m e2Summand m τ = G₂(τ)` | antecedent wrong | R02 (P3) |
| Ownership of the scaled dictionary | EllipticCurvePeriodsAndModularParametrizations at 7a356fe6 §1.1; merge order | its lines 470–476 restate it; this roadmap at position 80, that one after EllipticCurveModularity (position 167, its supplier line 379) | single owner here; the restatement is that roadmap's to cite | none here |

## Not verifiable

- Silverman, AEC ch. VI and ATAEC chs. I–II (1.4, 2.4, 4.1): I have no legal copy, so I checked these citations for internal consistency only.
- Lang 1971, Bull. AMS 77, p. 652 (Conjecture 34's origin, cited through Waldschmidt 2008): not opened. The README cites it only through Waldschmidt.
- Bost–Charles, Grothendieck's Montpellier folder 18, Chudnovsky 1976 and 1984, Nesterenko 1996, André, Lang 1966: cited by locator only, as in the previous reviews. No target depends on them.
- Milne, *Modular Functions and Modular Forms*, Proposition 3.10, cited by ModularForms §10D for the lattice–modular comparison: that is the supplier's locator, not this roadmap's, and I did not re-open it this round.

## Source issues

- none
