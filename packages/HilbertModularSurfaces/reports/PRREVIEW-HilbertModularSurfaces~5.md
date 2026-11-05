# Review of HilbertModularSurfaces (pull request #1730 at 7b8a46f)

**Verdict:** accepted

Incremental re-review of the 50 changed lines since b5d5320 (README only; `TauCetiRoadmap/HilbertModularSurfaces/Suggested.lean` is byte-identical to the head the previous review read). One finding, P3. All four findings of the previous review are repaired and none of the repairs introduced a new problem. The worker's gate at this head passes every check. Locations abbreviate `TauCetiRoadmap/HilbertModularSurfaces/README.md` as README and `TauCetiRoadmap/HilbertModularSurfaces/Suggested.lean` as Lean. The worktree was not edited.

## R01 (P3) — The §1.5 table promises a `Γ₀(𝔑)_𝔟` row it does not contain

**Location:** README:667–673, "Every cusp of `Γ₀(𝔑)_𝔟`, `Γ₀¹(𝔑)_𝔟`, `Γ₁¹(𝔑)_𝔟`, and of `Γ₁(𝔑)_𝔟` for squarefree `𝔑`, is of type `G(M, V)` … (Assaf et al., Proposition 3.3.8 …)" followed by a table with rows for `Γ₀¹`, `Γ₁¹` and `Γ₁` only.

**Claim:** The sentence names four groups and cites Proposition 3.3.8 for all of them; the table gives three. The `Γ₀` type is stated only at level one (README:690–691) and otherwise deferred to the abstract translation lattice and unit group of HilbertModularForms §1.4 (README:712–714), which at its head (lines 575–584) defines `Λ_κ` and `U_κ` without the explicit formula. The omission matters only at non-squarefree level: for squarefree `𝔑` the modulus below is the unit ideal and `V = R^×_{>0}`, as the Check at README:704–706 uses.

**Witness:** `assaf` lines 481–485 (Proposition 3.3.8(a), preprint p. 10) and the proof at lines 551–557: `M = 𝔰⁻²𝔟⁻¹𝔑(𝔑 + 𝔐²)⁻¹` and `v ≡ 1` modulo `∏𝔭^{min(f_𝔭, e_𝔭 − f_𝔭)} = 𝔐 + 𝔑/𝔐` (the display prints the modulus as `𝔐 + 𝔐/𝔑`, a misprint; see Source issues). Instance: `F = ℚ(√5)`, `𝔑 = 𝔭₂²`, cusp with `𝔐 = 𝔭₂`: `V = {v ∈ R^×_{>0} : v ≡ 1 mod 𝔭₂} = ⟨φ⁶⟩`, index 3 in `⟨φ²⟩` (`φ` has order 3 in `𝔽₄^×`), which no row of the table yields.

**Repair:** Add the row `| Γ₀(𝔑)_𝔟 | 𝔰⁻²𝔟⁻¹𝔑(𝔑 + 𝔐²)⁻¹ | {v ∈ R^×_{>0} : v ≡ 1 mod 𝔐 + 𝔑/𝔐} |` citing Proposition 3.3.8(a), or drop `Γ₀(𝔑)_𝔟` from the sentence and say in one clause that its type is HilbertModularForms §1.4's stabilizer data, made explicit by the same computation. Retest: on the instance above the new row gives `⟨φ⁶⟩`; at squarefree level it gives `R^×_{>0}`, agreeing with the `G(2R, U_R^+)`, `G(R, U_R^+)` Check.

## Previous findings

- R01 — repaired: README:81–85 no longer has the AutomorphicBundles row; the only remaining mention is the deferral sentence at README:116 ("automorphic bundles: ShimuraVarieties, ShimuraCompactifications, AutomorphicBundles"), which assigns ownership away and is not a supply edge. The depcheck below stays at `0 problem(s)`; AutomorphicBundles (candidate line 167) is cited by no `*Needs:*` line or table row.
- R02 — repaired: README:1040–1041 "(Assaf et al., Lemma 4.1.1(a), preprint p. 13; van der Geer, Chapter I, §5; Prestel, §8)" and README:1048 "The order `q = 12` is proved here, not in the sources"; the References entry (README:2066–2068) records the two defects of Lemma 4.1.1(b). `assaf` lines 628–638 confirm part (a), the `2 ∣ q` reduction, `1 ≤ q ≤ 6` in part (b), and the lemma's own pointers to Prestel §8 and van der Geer §I.5 (line 610).
- R03 — repaired: README:678–688 now derives the lower-right entry `1 + μc(v − 1) + acm`, proves `≡ 1 mod 𝔭` at `𝔭 ∣ 𝔐` for every `(λ, μ)`, and at `𝔭 ∣ 𝔑/𝔐` first normalises `(λ, μ) ↦ (λ − xc, μ + xa)` to `λ ∈ 𝔭𝔰⁻¹` before concluding `≡ v`. Recomputed below (adversarial table, §1.5 row); the normalisation is Assaf's (3.3.11) (`assaf` lines 536–543), and the parenthesis at README:684–686 says that the set `V` is choice-free while the sketch is not.
- R04 — repaired: README:264–268 "lines 71–78, 96–107, 130" and "`totallyPositiveIntegerUnits` (line 168 of the same file)". At the pin `IsTotallyPositive` is at `TauCeti/NumberTheory/NumberField/TotallyPositive.lean`:71, `isTotallyPositive_iff` :76, `IsTotallyPositive.mul` :96, `.inv` :102, `isTotallyPositive_sq` :107, `totallyPositiveUnits` :130, `totallyPositiveIntegerUnits` :168.

Nothing was settled as not actionable; nothing is re-raised.

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

The worker's gate at 7b8a46f reports every check zero and `OK`. `git diff --stat origin/main...HEAD` outside the folder is empty. My run of the brief's dependency check against the candidate order:

```text
depcheck: 204 roadmaps, 1652 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line (the candidate order lists HilbertModularSurfaces at line 147; HilbertModularForms is not yet in it and is consumed as placed after its last supplier, as the previous review recorded).

`lake env lean` on Lean from the worktree exits 0 with exactly four warnings, `declaration uses sorry` at Lean:86, :145, :152, :175, and nothing else. A scratch copy with `#check @name` for all 16 declarations elaborated (exit 0); every elaborated type is identical to the worker's `signatures.md` listing and to the previous review's comparison with the README: the six elementary definitions (`hjStream`, `hjDigit`, `IsReduced`, `hjPeriod`, `IsOriented`, `multiplierUnits`) drop the unused `[NumberField F]`, as README:788–791 says; the three cusp theorems keep `[NumberField F]`, `v₁ ≠ v₂`, `finrank ℚ F = 2`; the zeta theorem keeps `[IsTotallyReal F]`, `finrank = 2`, meromorphy, analyticity at −1 and agreement on `Re s > 1`. No signature needed correction.

One-tactic probe on a scratch copy, each of the four `sorry`s replaced by `first | simp | rfl | infer_instance | simp [*]`: Lean:96 (`hjPeriod_ne_nil_of_isReduced`) leaves unsolved goals; Lean:147 (`cycleIntersectionMatrix_negDef`), :157 (`period_dual`) and :178 (`dedekindZeta_neg_one_eq_siegel`) fail with no applicable tactic. No declaration is padding. The headline list (README §§2.2, 2.5, 2.7, 4.2 stated; §§2.4, 3.4, 3.10, 4.4, 4.6–4.8, 6.3–6.5 named in the module docstring with the missing carrier) is unchanged since the previous review; imports are `Mathlib` and `TauCeti.NumberTheory.NumberField.TotallyPositive`; no `set_option`, `lemma` or sorry'd data.

### The changed passages

1. **Supplier table (README:78–85).** Rows now cite HilbertModularForms §§1.1–1.3, §1.4, §§2.2–2.3, 2.5–2.6, 3.2, 3.5, ShimuraVarieties 0.4, 1.2, P.6, 2.5, 2.7, 2.8, ShimuraCompactifications §0.13, §§2.1–2.8, 8.14–8.15, 8.23–8.25, 8.32–8.38, 8.56, Tau Ceti `NarrowClassGroup`, GlobalNumberFields Layers 2, 11 and ImaginaryQuadraticClassNumber H1.3, H1.4, H2.2, all earlier in the order or on main (resolved in the previous review; unchanged). HilbertModularForms §1.4 at its head (lines 575–605) still states the cusp count `h_F Σ_{𝔞∣𝔫} #((𝒪_F/𝔤_𝔞)^×/U_𝔞)` and the translation lattice `Λ_κ` and unit group `U_κ` that README:712–714 consumes.
2. **Tau Ceti locators (README:264–268).** Seven declarations opened at the pin (`358314d4`), lines as in R04 above; the sentence's content (positivity at every real place, vacuous for a totally complex field: `totallyPositiveUnits_eq_top` at :157) matches the file.
3. **§1.5 Γ₁ derivation (README:674–691).** With `γ = (λ μ; −c a)`, `λa + μc = 1`, I recomputed `γ⁻¹(v m; 0 1)γ`: entries `1 + a(λ(v−1) − cm)`, `a(μ(v−1) + am)`, `c(λ(v−1) − cm)`, `v − a(λ(v−1) − cm) = 1 + μc(v−1) + acm`, agreeing with `assaf` (3.3.10) (lines 520–534) and the README. `(1 x; 0 1)γ = (λ − xc, μ + xa; −c, a)` is Assaf's (3.3.11) (lines 536–543); `x ∈ 𝔰⁻²𝔟⁻¹` keeps `λ ∈ 𝔰⁻¹`, `μ ∈ 𝔰⁻¹𝔟⁻¹` since `c ∈ 𝔟𝔰`, `a ∈ 𝔰`, and at `𝔭 ∣ 𝔑/𝔐` the ideal `c(𝔟𝔰)⁻¹` is prime to `𝔭` (else `𝔭 ∣ 𝔐`), so `x ≡ λ/c` is solvable locally and globally by weak approximation. Then `λa ∈ 𝔭`, `μc ≡ 1`, the lower-left condition `c(λ(v−1) − cm) ∈ 𝔑𝔟` reads `m ∈ 𝔭𝔰⁻²𝔟⁻¹` locally, and the entry is `≡ v`. At `𝔭 ∣ 𝔐`: `c ∈ 𝔭𝔟𝔰`, `μc ∈ 𝔭`, `cm ∈ 𝔭𝔰⁻¹(𝔑/𝔐) ⊆ 𝔭` locally as `𝔰` is prime to `𝔑` (README:569). With the scalar `ε`, the `d ≡ 1 mod 𝔑` condition becomes `ε ≡ 1 mod 𝔐`, `εv ≡ 1 mod 𝔑/𝔐`: exactly the row's `V` with `U = {u ≡ 1 mod 𝔐}`, and Assaf's (d) (lines 584–601) for `a ≡ 1` has the roles exchanged, as README:686–688 says. Numeric instance in the table.
4. **§3.3 orders (README:1037–1055).** `assaf` lines 628–632: part (a) `R[γ] ≅ R[ζ]`, `ζ` of order `2q`, `1 < q ≤ 6`; part (b) `2 ∣ q`, `γ² = u⁻¹ζ`, `ζ` of order `q`, `1 ≤ q ≤ 6`. The README's `γ² = uζ` is forced by determinants: `det γ² = u²` while `det(u⁻¹ζ) = u⁻²` (`N_{K/F}ζ = 1`), and the Check `γ = (0, −u; 1, 0)`, `γ² = −uI` (README:1030) has `ζ = −1`. The errata (item (5), `assaf-errata` line 19) keep `u⁻¹ζ`. The order-12 unit: see the table. The `ζ` list: `(tr γ)² = u(2 + ζ + ζ⁻¹)` shows `ζ = ζ₃^{±1}` and `ζ = 1` would make `u` a square, so they are rightly absent; `ζ₈`, `ζ₁₀` need `√2`, `√5 ∈ F`, where `N(ε) = −1` (`1 + √2`, `(1+√5)/2`) and `R^×_{>0} = R^{×2}`. The notation `u ∉ R^{×2}_{>0}` at README:1043 copies the lemma (line 631) while §3.2 (README:1012) writes `u ∉ R^{×2}`; the sets are equal, not a finding.
5. **References (README:2061–2069).** Locator list extended by (3.3.10)–(3.3.11) and the Lemma 4.1.1(b) note; both displays exist at the lines above. No process words, no pull-request numbers.

### Adversarial table

Rows for untouched statements carry forward the previous report (b5d5320, "Computed adversarial checks"), whose values I did not recompute; the Lean statements are unchanged. New rows carry computed values.

| Statement | Instances and computed sides | Result |
|---|---|---|
| §1.5 Γ₁ row, entry at `𝔭 ∣ 𝔑/𝔐` (changed) | `F = ℚ(√5)`, `𝔟 = R`, `𝔑 = 𝔭₂𝔭₁₉` with `𝔭₁₉ = (1 + 2√5)`, cusp `(1 : 2)`: `𝔰 = R`, `𝔐 = 𝔭₂`, `𝔑/𝔐 = 𝔭₁₉`. In `𝔽₁₉`: `√5 ≡ 9`, `φ ≡ 5`, `φ² ≡ 6` of order 9; `U = ⟨−1, φ³⟩` (units `≡ 1 mod 𝔭₂` since `φ` has order 3 in `𝔽₄^×`) reduces to `{1, 7, 8, 11, 12, 18}`; `V = {φ^{2k} : φ^{2k} ∈ U mod 𝔭₁₉} = ⟨φ⁶⟩`, index 3. Normalised `(λ, μ) = (−19, 10)` (`λ ∈ 𝔭₁₉`, `λa + μc = 1`, `μc = 20 ≡ 1 mod 19`): entry `1 + μc(v−1) ≡ v = 7` for `v = φ⁶`, and `φ³·7 ≡ 1`, so `ε = φ³ ∈ U` makes `d ≡ 1`; for `v = φ²` no `ε ∈ U` has `εv ≡ 1` (none of `6·{1,7,8,11,12,18}` is 1). Unnormalised `(λ, μ) = (1, 0)`: entry `1 + 2m ≡ 1`, independent of `v`. | Row right, sketch now right; the previous sketch's congruence fails for `(1, 0)`. |
| §1.5 Γ₁ row, entry at `𝔭 ∣ 𝔐` (changed) | Same cusp, `𝔭 = 𝔭₂`: `c = 2 ∈ 𝔭₂𝔟𝔰`, `μc = 6 ∈ 𝔭₂`, `acm = 2m ∈ 𝔭₂`; entry `≡ 1 mod 𝔭₂` for both choices of `(λ, μ)`; with `ε = φ³ ≡ 1 mod 𝔭₂` the scalar keeps `d ≡ 1`. | Agrees. |
| §1.5 affine normalisation (changed) | `x = 2 ∈ 𝔰⁻²𝔟⁻¹ = R` sends `(1, 0) ↦ (−3, 2)` over `ℚ` at `N = 6`, cusp `(1 : 2)`, `λ = −3 ∈ 3ℤ`; `λa + μc = −3 + 4 = 1`. | Agrees with (3.3.11). |
| §3.3 order-12 unit (changed) | `γ = ζ₁₂(1+i)/(1+√3)`: `|γ² − ζ₁₂⁵ε⁻¹| = 1·10⁻¹⁶`, `γγ̄ = 0.26795 = 2 − √3`, `tr γ = 2 − √3`, `(tr γ)² = 0.0718 = ε⁻¹(2 + ζ + ζ⁻¹)` with `ζ = ζ₁₂⁵`; first real power `γ¹²` (`ζ₂₄^{5k} = ±1` iff `12 ∣ k`), value `−ε⁻⁶`. Quotient `ℤ[ζ₁₂]^×/R^×`: `η = (1+i)/(1+√3)`, `η² = iε⁻¹`, so `E_K = ⟨ζ₁₂, η⟩`, `[E_K : μE_{K⁺}] = 2`, order 12, and `γ² ≡ ζ₁₂⁵` has order 6, so `γ` generates. Stabilizer of the fixed point in `PΓ₀(1)_R` is `ℤ[ζ₁₂]^×/R^×` (maximal order, `N_{K/F}` totally positive on `K^×`). | Order 12 confirmed; Lemma 4.1.1(b)'s `q ≤ 6` is false. |
| §3.3 `ζ` list and parity (changed) | `(tr γ)² = u(2 + ζ + ζ⁻¹)`: `ζ = 1`: `4u`; `ζ₃`: `u`; `−1`: `0`; `±i`: `2u`; `ζ₆`: `3u`; `ζ₁₂`: `uε` (`F = ℚ(√3)`); `ζ₁₂⁵`: `uε⁻¹`. Odd `q` forces `γ^q = s` scalar, `γ = su⁻¹ζ⁻¹`, `det γ = s²u⁻² = u` so `u = (s/u)²`. `ℚ(√7)`: `2ε = 16 + 6√7 = (3 + √7)²`, order 4 occurs; `ℚ(√21)`: `3ε = (15 + 3√21)/2 = ((3 + √21)/2)²`, order 6 occurs. | Agrees; `ζ₃`, `1` excluded, `2 ∣ q`. |
| §3.3 `q = 8, 10` excluded (changed) | `N(1 + √2) = −1`, `N((1 + √5)/2) = −1`: `R^×_{>0} = ⟨ε²⟩ = R^{×2}`, so no non-square totally positive `u`. | Agrees. |
| §0.1–0.5, §§1.1–1.4, §§2.1–2.7, §§3.1–3.2, §§3.4–3.11, §§4.2–4.9, §§5.1–5.3, §§6.2–6.5, §§7.1–7.3, Lean headlines, Siegel values, D = 85 | Untouched: previous report at b5d5320, rows "Conv. 1, §0.1 units" through "D = 85 nonprincipal class" and the 22-discriminant Siegel table. | Carried forward. |

### Library declarations at the pins

Pins: Mathlib `f6090c70`, Tau Ceti `358314d4` (`lake-manifest.json`). Opened this round: `TauCeti/NumberTheory/NumberField/TotallyPositive.lean` :71 `IsTotallyPositive`, :76 `isTotallyPositive_iff`, :96 `IsTotallyPositive.mul`, :102 `IsTotallyPositive.inv`, :107 `isTotallyPositive_sq`, :130 `totallyPositiveUnits`, :157 `totallyPositiveUnits_eq_top`, :168 `totallyPositiveIntegerUnits`. The previous report's table of 30 declarations (Mathlib `UpperHalfPlane.instProperSMul`, `IsCusp`, `dedekindZeta`, `hurwitzZeta_neg_nat`, `Pell.IsFundamental`, `IntFractPair.stream`, `Matrix.PosDef`; Tau Ceti `NarrowClassGroup`, `units_sq_index_eq`, `PlumbingGraph`, `Toric.Fan`, `BinaryQuadraticForm`, `hurwitzClassNumber`, …) is unaffected by the diff.

### Cross-roadmap citations and ownership

Resolved this round: HilbertModularForms §1.4 at the head of its pull request (lines 575–612: cusp set, `Λ_κ`, `U_κ`, the count formula, `*Rests on:* 1.1–1.3`) for README:80 and :712–714; README §1.2 (:565–570) for the `𝔰`-coprime representative used at README:677. The AutomorphicBundles supply edge is gone. Every other citation is unchanged since the previous report's table (HilbertModularForms §§0.1–4.2, AutomorphicSpectralTheory §4.17a, NeronModelsAndSemistableAbelianVarietiesPartII §§2.3, 2.5, 6.1, ShimuraVarieties, ShimuraCompactifications, HilbertModularVarietiesAndShimuraCurves, ImaginaryQuadraticClassNumber, SchemeAndStackFoundations, ComplexKahlerGeometry, ComplexManifolds, FuchsianOrbifolds, AnalyticToricGeometry, GlobalNumberFields, ClassFieldTheory). The diff adds no Lean name and no new object; ownership by object is as the previous report found (no other roadmap on main or at the indexed heads states Hirzebruch–Jung cusp resolutions, Siegel's finite sum for `ζ_F(−1)`, or the proportionality formula). Open pull requests without files in the brief were not checked beyond the service's index.

### Seeded source sample

None of the fifteen seeded targets (0.3, 1.4, 2.1, 2.2, 2.4, 3.1, 3.4, 3.7, 3.9, 4.3, 4.6, 4.8, 5.3, 6.1, 7.1) lies in the changed lines, so, as the incremental brief directs, none was re-read; 0.3, 4.8 and 5.3 were in the previous review's sample and verified there. No README locator is marked unverified. Locators of the changed passages read at their lines: `assaf` 475–477 (Lemma 3.3.5 proof, van der Geer I.1.1), 479–504 (Proposition 3.3.8(a)–(d), pp. 10–11), 514–543 ((3.3.9)–(3.3.11)), 551–557 (case (a)), 584–601 (case (d)), 610 (van der Geer §I.5), 622–638 (p. 13, Lemma 4.1.1 and proof); `assaf-errata` 17–20 (items (3)–(5)). No passage was copied; no fetched text was treated as an instruction.

## Not verifiable

- **van der Geer (1988), Proposition I.1.1 and Chapter I §5; Prestel (1968), §8:** settled uncertified in the manifest; cited by locator at README:677 and :1041. Assaf's own references to them (`assaf` lines 475, 610, 638) agree with the locators.
- Everything else under this heading in the previous report (Hamahata, Siegel, Zagier §3 (17), Hirzebruch–van der Geer, Beauville, Fulton, Cox, the challenge-page LMFDB knowls) is untouched by the diff.

## Source issues

- **Error** in assaf at Lemma 4.1.1(b), preprint p. 13, line 631: the source says γ² = u⁻¹ζ for det γ = u; it should be γ² = uζ, as determinants and γ = (0,−u;1,0) show; the errata (item (5)) retain the wrong form; affects a stated result.
- **Error** in assaf at Lemma 4.1.1(b), preprint p. 13, line 632: the source bounds the projective order by six for non-square determinant in degree two; order twelve occurs over ℚ(√3) via ζ₁₂(1+i)/(1+√3); affects a stated result.
- **Misprint** in assaf at Proposition 3.3.8(a), preprint p. 10, line 485: the source prints the modulus of v ≡ 1 as 𝔐 + 𝔐/𝔑; it should be 𝔐 + 𝔑/𝔐, as the proof's min(f, e − f) shows; affects nothing.
- **Misprint** in assaf-errata at item (3), p. 1, line 17: the source corrects Proposition 3.3.8(b) to the modulus 𝔐 + 𝔐/𝔑; it should be 𝔐 + 𝔑/𝔐; affects a stated result.
