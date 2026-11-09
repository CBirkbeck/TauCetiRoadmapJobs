# Review of EllipticPeriods (pull request #1059 at 072605e)

**Verdict:** needs changes

This is an incremental re-review of 42 changed lines since 1f40606. The change is in `README.md` only, and the pull request changes nothing outside its folder.

The change settles the overlap with ModularCurvesPartII by making this roadmap the owner of two things:
- the series `ζ` and the map `quasiPeriod` read off from it;
- the `ℂˣ` action on `PeriodPair` with `G_smul` for all `k`.

The pinned Tau Ceti (`2fd255d9`) already defines and proves both. The earliest owner is therefore Tau Ceti, not this roadmap and not ModularCurvesPartII (R01, R02). The new *Needs:* edges of 2.1 and 2.2 are also wrong (R03). The previous finding (R01 of the last review) remains repaired.

## R01 (P2) — the Weierstrass `ζ` and the quasi-period map are Tau Ceti's at the pin

**Location.** `TauCetiRoadmap/EllipticPeriods/README.md`:
- lines 30–33 (Scope): "the Weierstrass `ζ` function as a series and the map `quasiPeriod` read off from it";
- lines 421–423 (2.2): "`quasiPeriod` is its form read off the series `ζ` of 2.1, in which Layers 3–5 are written".

**Claim.** These passages make this roadmap the owner of the series `ζ` (2.1) and of `quasiPeriod`, read at the base point `ω₁/2` (2.2). They rest on line 184, which says "neither library has the Weierstrass `ζ` or the quasi-periods". At the pin, Tau Ceti has both, with the same series and the same base point. 2.1, 2.2 and their declarations in `Suggested.lean` restate it:
- the definitions `weierstrassZeta` and `quasiPeriod`;
- the theorems `weierstrassZeta_neg`, `hasDerivAt_weierstrassZeta`, `weierstrassZeta_add_coe` and `quasiPeriod_add`.

**Witness.** Tau Ceti `TauCeti/Analysis/SpecialFunctions/Elliptic/WeierstrassZeta.lean` at `2fd255d9` has:
- `PeriodPair.weierstrassZeta` (line 71, the same series);
- `quasiPeriod : L.lattice →+ ℂ` (182), with body `ζ(ω₁/2 + l) − ζ(ω₁/2)`;
- `hasDerivAt_weierstrassZeta` (122);
- `weierstrassZeta_neg` (151);
- `weierstrassZeta_add_coe` (202), for every `z`;
- `quasiPeriod_eq_two_mul_weierstrassZeta` (223).

**Repair.**

In the README:
- **From Tau Ceti.** Add that module, with the names above and `hasSumLocallyUniformly_weierstrassZeta` (96).
- **Scope bullet at line 30.** Own only what the pin lacks:
  - meromorphy with residue `1` at `Λ`;
  - the Laurent expansion;
  - `ζ_{cΛ}(cz) = c⁻¹ ζ_Λ(z)`;
  - `quasiPeriod_smul` and `quasiPeriod_congr`;
  - the identification of Tau Ceti's `PeriodPair.quasiPeriod` with `latticeQuasiPeriod` (2.3).

  The sentence "not a second owner" is then unnecessary.
- **2.1.** Delete the definition, the convergence, `weierstrassZeta_neg` and `hasDerivAt_weierstrassZeta`, and cite them.
- **2.2.** Delete the definition, `weierstrassZeta_add_coe`, `quasiPeriod_add` (it is `map_add`) and `η(ω) = 2ζ(ω/2)`, and cite them. The pin states the last for every `l ∈ Λ`, not only for `Λ ∖ 2Λ`.
- **Other lines.** At line 184, drop "the Weierstrass `ζ` or the quasi-periods". In the 3.2 *Needs:* line (533), replace `quasiPeriod_add` with the additivity of Tau Ceti's `PeriodPair.quasiPeriod` (`map_add`).

In `Suggested.lean`:
- Add `public import TauCeti.Analysis.SpecialFunctions.Elliptic.WeierstrassZeta`.
- Delete the six declarations listed in the Claim.
- Restate the remaining statements on `L.quasiPeriod`:
  - `periodField` with `Set.range L.quasiPeriod`;
  - `periodMatrix` with `L.quasiPeriod ⟨L.ω₁, L.ω₁_mem_lattice⟩`;
  - `chudnovsky` and `two_le_trdeg_adjoin_invariants` with `(l : L.lattice)`;
  - `exists_quasiPeriod_mul` with `⟨α * l, hαL l l.2⟩`;
  - `quasiPeriod_smul` with `L.latticeSMulEquiv c l`.

**Tested.** I applied this repair and R02's to a scratch copy of `Suggested.lean` and elaborated it against the pins:
- It gives 0 errors and 27 `sorry` warnings, against 32 now.
- It drops 2 definitions, 1 instance and 5 theorems.
- Every headline is still stated.

## R02 (P2) — the `ℂˣ` action and `G_smul` are Tau Ceti's at the pin, not "owned here"

**Location.** README lines 202–204 (0.1): "The action `SMul ℂˣ PeriodPair` (defined in `Suggested.lean`), … the laws of a `MulAction ℂˣ PeriodPair`, and `G_smul` for all `k`, owned here". The same claim appears at line 28 (Scope) and at lines 814–817 ("which owns the statement for all `k`").

**Claim.** ModularCurvesPartII §1.3 and ModularForms §10D state the weights `4` and `6`. The change makes this roadmap the owner of the general homogeneity they specialise. At the pin, Tau Ceti already has:
- the action and its laws;
- the homogeneity for every `n`;
- the cases `g₂_smul` and `g₃_smul`.

`Suggested.lean`'s instance has the same body as Tau Ceti's `instSMulUnitsComplex`.

**Witness.** Tau Ceti `TauCeti/Analysis/Complex/UpperHalfPlane/PeriodPair.lean` has:
- `instSMulUnitsComplex` (556);
- `instMulActionUnitsComplex` (575);
- `lattice_smul` (580);
- `G_smul : (c • L).G n = L.G n / c ^ n` (600);
- `g₂_smul` and `g₃_smul` (605, 609).

One `rw [PeriodPair.G_smul, inv_pow, div_eq_mul_inv, mul_comm]` proves this roadmap's `G_smul`.

**Repair.**

In the README:
- **0.1.** Delete target 0.1. List the action, `lattice_smul`, `G_smul`, `g₂_smul`, `g₃_smul` and `weierstrassP_smul` (614) under "From Tau Ceti".
- **Scope.** Replace the bullet at line 28 with an out-of-scope line naming Tau Ceti.
- **Lines 814–817.** Rewrite them to say that ModularCurvesPartII §1.3 and ModularForms §10D state the cases `k = 4, 6` of Tau Ceti's `PeriodPair.G_smul`.
- **Uses of 0.1 inside the file.** Repoint each to Tau Ceti:
  - line 238 (the 0.3 *Needs:* line);
  - lines 249 and 255;
  - line 474 (the 2.4 *Needs:* line);
  - the 0.2 Check at line 228. The 0.1 Checks at lines 211–214 go with 0.1.

  The only external citation of this roadmap is ModularForms citing §2.4, so renumbering Layer 0 breaks nothing.

In `Suggested.lean`:
- Add `public import TauCeti.Analysis.Complex.UpperHalfPlane.PeriodPair`.
- Delete the local `SMul ℂˣ PeriodPair` instance and `G_smul`.

**Tested.** Together with R01's repair, as above.

## R03 (P3) — 2.1 and 2.2 now need ModularCurvesPartII §1.4a, which only 2.3 uses

**Location.** README:
- lines 410–411 (2.1): "ModularCurvesPartII §1.4a (`latticeSigma`, compared in 2.3)";
- lines 431–432 (2.2): "ModularCurvesPartII §1.4a (`latticeQuasiPeriod`, the owner of the quasi-period map, compared in 2.3)";
- line 421: "consumed here".

**Claim.** The new edges make 2.1 and 2.2 depend on a section of a roadmap that is still in an open pull request, although neither target uses it:
- 2.1's statements (meromorphy, residues, the Laurent expansion, scaling, lattice dependence) and its Checks never mention `σ`.
- 2.2's definition, its quasi-periodicity, `quasiPeriod_smul`, `quasiPeriod_congr` and its Checks never mention `latticeQuasiPeriod`.

The comparison is 2.3's, and so is the consumption that 2.2 calls "consumed here". The new sentence of 2.1 on `σ′/σ` has no locator, and 2.3's locator does not cover it.

**Witness.** 2.3's *Needs:* line (449–450) already lists all four §1.4a names. `ζ = σ′/σ` is DLMF 23.2.8 (dlmf-23 line 349), outside 2.3's 23.2.12–23.2.14 (lines 523–574).

**Repair.**
- In whatever 2.1 and 2.2 keep after R01, delete the added §1.4a clause from their *Needs:* lines.
- In 2.2, replace "consumed here" with "consumed in 2.3".
- Add "(DLMF 23.2.8)" to the 2.1 sentence on `σ′/σ`.

The ModularCurvesPartII edge remains through 2.3, so the dependency check is unchanged.

## Previous findings

- R01 — repaired: the description still names "#1706 ModularForms (§10D, the comparison of g₂, g₃ for ℤ + ℤτ with E₄, E₆)", and its depends-on block ticks it. §10D is now on main, `TauCetiRoadmap/ModularForms/README.md` line 1313.

## Verified sound

**The change.**
- `git diff --stat 1f40606..HEAD` shows `README.md` with 28 insertions and 14 deletions.
- `Suggested.lean` is byte-identical, and `lake-manifest.json` is unchanged (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`).
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EllipticPeriods'` is empty.

**The new supplier statements.** Three hold as written:
- ModularCurvesPartII, at the head of its open pull request (07e21ad), §1.3, first sentence: `g₂(uΛ) = u⁻⁴g₂(Λ)`, `g₃(uΛ) = u⁻⁶g₃(Λ)`.
- ModularForms §10D, on main, in its API bullet (line 1400): homogeneity `g₂(αΛ) = α⁻⁴g₂(Λ)`, `g₃(αΛ) = α⁻⁶g₃(Λ)`.
- ModularCurvesPartII §1.4a: `latticeSigma`, and `latticeQuasiPeriod` as an additive homomorphism with `latticeQuasiPeriod_legendre`, `η(ω₁)ω₂ − η(ω₂)ω₁ = 2πi` for `Im(ω₂/ω₁) > 0`. This is the name the new 3.1 *Needs:* line cites.

The claim "both precede this roadmap" also holds: ModularForms is on main, and in the candidate order ModularCurvesPartII is at line 71 and EllipticPeriods at line 72. What fails is "owned here" (R02), because the general statement is Tau Ceti's.

**Library declarations opened at the pin.**
- `TauCeti/Analysis/SpecialFunctions/Elliptic/WeierstrassZeta.lean`, lines 71, 96, 106, 122, 145, 151, 160, 182, 197, 202, 208, 214 and 223.
- `TauCeti/Analysis/Complex/UpperHalfPlane/PeriodPair.lean`, lines 556, 575, 580, 584, 600, 605, 609, 614, 623, 632 and 653.
- Mathlib `PeriodPair.G` (`Weierstrass.lean` line 945, `∑' l, (l ^ n)⁻¹`).

I built the module with `lake build TauCeti.Analysis.Complex.UpperHalfPlane.PeriodPair` and elaborated a probe:
- `#check` of 17 declarations, giving the types above;
- five `example`s with 0 errors: `G_smul` (one `rw` chain), `quasiPeriod_add` (`map_add`), `weierstrassZeta_add_coe` without `z ∉ Λ`, the base point `ω₁/2` of the pinned `quasiPeriod`, and the pinned series (`rfl`).

Tau Ceti has no Legendre relation and no `η(1) = G₂(τ)`. `TauCeti/AlgebraicGeometry/EllipticCurve/Legendre.lean` is the Legendre form `y² = x(x−1)(x−λ)`. So 2.3's consumption of ModularCurvesPartII for Legendre, and 2.4, are not duplicated.

**The gate.**
- The worker's run at 072605e: every counter 0, `build=0 OK`.
- My rerun with `--base origin/main --order <candidate>`: `… dropped=0 readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- Dependency check with `--movable` and the content checkout:

```
depcheck: 236 roadmaps, 2262 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

**Elaboration.**
- `lake env lean` on `TauCetiRoadmap/EllipticPeriods/Suggested.lean` exits 0 in 7 s with 32 diagnostics, all of them "declaration uses `sorry`".
- `signatures.md` lists 40 declarations and none has lost a binder. The file is unchanged since the review that compared each one with the README.
- The earlier reviews' one-tactic probe ran on this file's own definitions, and nothing closed. On the pinned Tau Ceti carriers, `G_smul`, `quasiPeriod_add` and `weierstrassZeta_add_coe` close in one step (R01, R02).

**Headline theorems.** All five are stated and unchanged:
- `trdeg_periodField_le` (3.3)
- `chudnovsky` (5.1)
- `two_le_trdeg_periodField` (5.3)
- `trdeg_periodField_le_two_of_hasCM` (4.4)
- `trdeg_periodField_eq_two_of_hasCM` (5.4)

They are still statable after R01 and R02 (scratch copy, 0 errors).

**Seeded sample.** Two sampled targets fall in the changed passages:
- 2.3: DLMF 23.2.12 `η_j = ζ(ω_j)` (dlmf-23 line 523), 23.2.13 (555) and 23.2.14, Legendre with value `πi/2` in half-period form (574). These support 2.3, with the gap in R03.
- 3.1: its *Needs:* line now cites `latticeQuasiPeriod_legendre`, which exists in ModularCurvesPartII §1.4a.

The other sampled targets are untouched; their locators were checked in the reviews at a1d420d through 1b5ad0a (DLMF 23.2.5, 23.3.4, 23.8.5; Chudnovsky, ICM 1978, §2.A; Waldschmidt 2008, Corollaries 32 and 35). DLMF 23.2.5 (dlmf-23 line 234), the series of 2.1, was re-read this round. The README flags no locator as unverified.

**Ownership and overlaps.**
- `overlaps.md` reports no other open pull request changing this roadmap and no dropped id in either direction.
- `roadmaps grep` finds this roadmap cited only by ModularForms: lines 65 and 1536 cite §2.4, and line 68 names it as a consumer of ModularCurvesPartII. No roadmap cites `PeriodPair.weierstrassZeta`, `PeriodPair.quasiPeriod` or `PeriodPair.G_smul`.
- The closest roadmap, EllipticCurvePeriodsAndModularParametrizations (head 91ab26b), still states lattice invariance of `G_k` and the scaled dictionary (its lines 477–484). It defers `ζ` and the quasi-periods to ModularCurvesPartII §1.4a. Both points are unchanged from the earlier reviews.
- No gaps are declared.

**Remarks on untouched text** (not findings):
- 0.2's `G_k` part is Tau Ceti `PeriodPair.G_eq_of_lattice_eq` (632).
- 0.3 overlaps `exists_lattice_eq_smul_periodPair` (653). Tau Ceti's `UpperHalfPlane.periodPair z = (z, 1)` is negatively oriented in this roadmap's convention, since `Im(1/z) < 0`, unlike `ofUpperHalfPlane τ = (1, τ)`.
- The Standing-conventions bullet at lines 84–89 defines `ζ` and `η` without naming Tau Ceti.
- `library-matches.md` searched Mathlib only (Loogle returned 503), which is why the Tau Ceti declarations were not flagged.

**Adversarial table.** Rows marked r14 are carried from the previous report (PRREVIEW-EllipticPeriods r14, at 1f40606) for statements the diff leaves untouched. The other rows were computed this round:
- lattice sums are over `|m|, |n| ≤ 150` in double precision;
- the `ζ`-differences converge like `N⁻¹`, so values agree with `π` to about `5·10⁻⁵`.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 `G_smul` (ownership rewritten), this round | `ℤ[i]`, `c = 1+i`, `k = 4`; `c = 2`; Lean probe | `G₄(ℤ[i]) = 3.15119729`; `G₄((1+i)ℤ[i]) = −0.78779932`; Tau Ceti form `G₄/c⁴ = −0.78779932`; this roadmap's `c⁻⁴G₄ = −0.78779932`; `G₄(2ℤ[i]) = 0.19694983 = G₄/16`; one `rw` from `PeriodPair.G_smul` | statement true; "owned here" false | R02 |
| Scope line 28 and lines 814–817 (`k = 4, 6`), this round | `g₂ = 60G₄`; ModularCurvesPartII §1.3; ModularForms §10D line 1400; Tau Ceti 605/609 | `g₂(ℤ[i]) = 189.071837`, `g₂((1+i)ℤ[i]) = −47.267959 = 189.071837/(−4)`; three statements of the same homothety, the general one Tau Ceti's | suppliers correct; owner wrong | R02 |
| 2.1 new sentence `ζ = σ′/σ`; *Needs:*, this round | DLMF; the Tau Ceti and Suggested bodies of `ζ` | 23.2.8 at dlmf-23 line 349, not in 23.2.12–14; `η(1)` from both bodies `3.14164048`, difference `3·10⁻¹⁴`; pinned series `rfl` | true; locator missing; edge unused | R01, R03 |
| 2.2 preamble, definition, *Needs:*, this round | `ℤ[i]`: `l = 1, i`; `2ζ(ω/2)`; Lean probe | `η(1) = 3.141640`, `η(i) = −3.141596i`; `2ζ(1/2) = 3.141596`, `2ζ(i/2) = −3.141596i`; pinned `η(l) = ζ(ω₁/2 + l) − ζ(ω₁/2)` by `rw; ring`; for `l ∈ 2Λ` the pin uses `ζ(l/2) = η(l/2)`, giving `η(2ω₁) = 2η(ω₁)` | true; owner wrong; edge unused | R01, R03 |
| 2.2/2.3 Legendre on `ℤ[i]`, this round | `η(1)·i − η(i)·1` | `6.283237i` vs `2πi = 6.283185i` | agrees with ModularCurvesPartII §1.4a | none |
| 3.1 *Needs:* `latticeQuasiPeriod_legendre`, this round | `ℤ[i]`, `det periodMatrix` | `1·η(i) − i·η(1) = −6.283237i ≈ −2πi`; the name exists in §1.4a | sound | none |
| Layer 3 Dependencies, this round | the §1.4a edge through 2.3 | depcheck `0 problem(s)` | sound | none |
| 0.2, 0.3 lattice invariance, `ofUpperHalfPlane` | `ℤ[i]`, `I • L`; `(τ, 1)` | `G₆ = −G₆ ⇒ g₃(ℤ[i]) = 0` (`6.1·10⁻²⁷`); `(1/τ).im < 0` | sound | none; r14 |
| 1.1 `IsEllipticFunction` | `℘`, `℘′`, constant; `ζ`, `z` | `ζ(z+1) − ζ(z) = π ≠ 0` on `ℤ[i]` | Checks discriminate | none; r14 |
| 1.2 Liouville | constant; `℘`; `z` | `℘` has order `−2` at `0`; `z` is not periodic | hypotheses needed | none; r14 |
| 1.3 `finsum_meromorphicOrderAt_eq_zero` | `℘ − e₁`; `1`; `0` | `−2 + 2 = 0`; all `0`; `0` excluded by `hne` | sound | none; r14 |
| 1.4 structure | `℘′²`; `0`; `℘′` | `P = 4X³ − g₂X − g₃, Q = 1`; `P = 0`; `℘′` odd, excluded | sound | none; r14 |
| 1.5 half-period values | `ℤ[i]` | `℘(1/2) = 6.875183`; `16∏(eᵢ−eⱼ)² = 6759048.6` vs `g₂³ − 27g₃² = 6759051.5` | sound | none; r14 |
| 1.6 Laurent, `G_mem_adjoin` | `n = 3, 4`; `c₁` | `c₃ = g₂²/1200`, `c₄ = 3g₂g₃/6160`; `9.4538` vs `g₂/20 = 9.4536` | sound | none; r14 |
| 1.7 descent | `℘(2z)` at `0.3 + 0.17i` | `0.75722 + 1.51668i` on both sides | sound | none; r14 |
| 2.4 `η(1) = G₂(τ)`, `η(τ) = τG₂(τ) − 2πi` | `τ = i, i√2` | `3.1415927` vs `3.1416005`; `3.2789404` vs `3.2789434`; `−1.6460634i` vs `−1.6460688i` | sound | none; r14 |
| 3.2 `periodField` | `ℤ[i]` | `F = ℚ(i, π)`, trdeg `1`; `2πi ∈ F` | sound | none; r14 |
| 3.3 `trdeg_periodField_le` | `ℤ[i]`; `πℤ[i]` | `1 ≤ 4`; `1 ≤ 4` | sound | none; r14 |
| 3.4 `periodIdeal` | `ℤ[i]` | `X₂₂ + X₁₂X₂₁ ↦ 0`; `det ↦ −2πi ≠ 0`; `dim = 1` | sound | none; r14 |
| 3.5 homotheties | `c = π` | `g₂(πL) = π⁻⁴` is transcendental | hypotheses needed | none; r14 |
| 4.1 `HasCM`, `hasCM_iff` | `τ = i, i√2, iπ`; `α = 1+i` | `iπ` satisfies no integer quadratic; `[ℤ[i] : (1+i)ℤ[i]] = 2 = |1+i|²` | sound | none; r14 |
| 4.2 `exists_weierstrassP_mul_eq` | `α = ±1, 2, i` | `P = X`; duplication; `P = −X` | sound | none; r14 |
| 4.3 `exists_quasiPeriod_mul` | `ℤ + ℤi√2`, `α = i√2` | `η(ατ) = −6.5578808 = ᾱη(τ) + bτ`; `b² = −8.946432` vs `−8.946421` | sound | none; r14 |
| 4.4 `≤ 2` with CM | `ℤ[i]`; `√−2` | `η₁ = π`; `3.278942` vs `3.278944` | sound | none; r14 |
| 5.1 `chudnovsky` | the inverted dictionary; `ℤ[i]` | `E₂ = 3lη(l)/π²`; `3π/π² = 3/π = E₂(i)` | sound | none; r14 |
| 5.2 without algebraic invariants | `ℤ[i]`; `πℤ[i]` | `g₂(ℤ[i])` and `π` algebraically independent; `η_{πΛ}(π) = 1` | sound | none; r14 |
| 5.3 `two_le_trdeg_periodField` | `πℤ[i]` | trdeg `1`; hypothesis needed | sound | none; r14 |
| 5.4 CM case | `c • ℤ[i]`, `c⁴ = g₂(ℤ[i])` | `g₂ = 1`, `g₃ = 0`, `2 ≤ trdeg ≤ 2` | sound | none; r14 |
| 5.5 corollaries | `ℤ[i]`; `ρ` | fails without algebraic invariants (`ω₁ = 1`); `(g₂, g₃) = (0, 1)` | sound | none; r14 |
| Repaired `Suggested.lean` (R01 + R02), this round | scratch copy against the pins | 0 errors, 27 `sorry` warnings; 5 headlines stated on `PeriodPair.quasiPeriod` | repair elaborates | — |

## Not verifiable

- Lang, *Introduction to Transcendental Numbers*, and Waldschmidt, *Diophantine Approximation on Linear Algebraic Groups* (Research context): there is no legal copy, so both are cited by locator only, and no target depends on them.
- Silverman, AEC ch. VI, and ATAEC chs. I–II (1.4, 2.4, 4.1): there is no legal copy. 2.4 was checked against DLMF 23.8.5 and numerically (r14).
- Bost–Charles §2.2.2, Chudnovsky 1976 and 1984, Nesterenko 1996, André 2004 and Lang 1971: cited by locator only, as in the previous reviews. None is in the changed passages.

## Source issues

- none
