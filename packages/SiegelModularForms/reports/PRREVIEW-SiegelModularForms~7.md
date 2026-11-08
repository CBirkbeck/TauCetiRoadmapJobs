# Review of SiegelModularForms (pull request #1714 at 8b63df9)

**Verdict:** needs changes

This head repairs all six findings of the previous review (`77069cb`); the disposition, finding by finding, is under *Verified sound*. The whole roadmap was then re-read as a full review (327 changed lines), the two newly transcribed dimension formulas were checked against their primary texts and recomputed on independent data, and the seeded sample was verified against the sources. The push gate at this head fails on two `statement-hygiene` hits, both P3; nothing else was found.

Source ids name the cache texts of the manifest: `vdg` (van der Geer, arXiv math/0605346), `cvdgg2015` (arXiv 1306.6018), `ez1983` (the MPIM preprint, OCR), `pooryuen2015` (arXiv 0912.0049), `taibi2017` (arXiv 1406.4247v1), `gelbartjacquet1978` (Numdam), `bfvdg2008`. Two texts the manifest records at Project Euclid were read from the institutional copies on Ralf Schmidt's dimension-formulas page (`math.ou.edu/~rschmidt/dimension_formulas/papers/`), fetched through the sources service into a scratch manifest: `tsushima1983ou` (pdftotext, 4 pages) and `ibukiyama1985ou` (OCR, two printed pages per scan page). The same host supplied `ibukiyama1991` (cache `05822cf0…`), `arakawa1983` (cache `c1bdbabf…`) and Ibukiyama 2007 (`weightthreeprocrevised.pdf`, cache `2fda2d93…`).

## R01 (P3) — `slashE` chooses its multiplier with `Classical.choose`

**Location:** `TauCetiRoadmap/SiegelModularForms/Suggested.lean:520`–523 (`def slashE … Classical.choose (show ∃ μ : ℚ, 0 < μ ∧ … from γ.2)`).

**Claim:** The gate's `statement-hygiene` rule refuses a `def` whose body chooses its datum; the multiplier `μ(γ)` is determined by `γ` and needs no choice.

**Witness:** `scratch/gate.md` line 521 (P3, "def `slashE` chooses its datum"); the gate reports `FAIL`. For `g ≥ 1` the entry `(M J Mᵀ)_{inl 0, inr 0}` of `μ • J` is `−μ` (Mathlib's `J = fromBlocks 0 (−1) 1 0`): for `γ = diag(1, 2) ∈ GSp⁺₂(ℚ)`, `M J Mᵀ = 2J` and the entry is `−2`, so `μ = 2`.

**Repair:** Define the multiplier with a real body, `GSpPos.mult γ := if h : 0 < g then −(GSpPos.mat γ * J * (GSpPos.mat γ)ᵀ) (Sum.inl ⟨0, h⟩) (Sum.inr ⟨0, h⟩) else 1`, prove it equals the witness of `γ.2` (a named `sorry` theorem), and use `(GSpPos.mult γ : ℂ) ^ e` in `slashE`; or carry `μ` as a field of the carrier. Tested on `diag(1, 2)`: the entry formula returns `2`, the `(−1)^g`-sign trap of 0.2 does not enter.

## R02 (P3) — `eigenvalue` chooses the eigenvalue with `Classical.choose`

**Location:** `TauCetiRoadmap/SiegelModularForms/Suggested.lean:1357`–1358 (`def eigenvalue … := Classical.choose (hf.2.1 m)`); consumers at 1440–1445 (`saito_kurokawa`), 1528–1539 (`eigenvalue_isIntegral`, `coefficientField`, `finiteDimensional_coefficientField`).

**Claim:** Same gate rule (P3, line 1358); the gate's own repair is to take the datum as an argument.

**Witness:** `scratch/gate.md` line 1358; the eigenvalue system is a function `λ : ℕ → ℂ` the hypothesis can carry.

**Repair:** Replace `IsHeckeEigenform ρ e f` by `IsHeckeEigenformWith ρ e f (lam : ℕ → ℂ) (lam' : ℕ → ℕ → ℂ) := f ≠ 0 ∧ (∀ m, heckeT ρ e m f = lam m • f) ∧ ∀ p i, heckeTi ρ e p i f = lam' p i • f`, delete `eigenvalue`, and restate the consumers: `saito_kurokawa` concludes `∃ F lam lam', IsCuspForm F ∧ IsMaassForm F ∧ IsHeckeEigenformWith _ (scalarExponent 2 k) F lam lam' ∧ ∀ p, p.Prime → lam p = (qExpansion 1 f.toCuspForm).coeff p + p^(k−1) + p^(k−2)`; `eigenvalue_isIntegral` and `coefficientField` take `lam` with `hf : IsHeckeEigenformWith … lam lam'` and use `lam m`. Tested on `χ₁₀`: `lam 2 = 240` is forced by `heckeT … 2 χ₁₀ = 240 • χ₁₀` and `χ₁₀ ≠ 0`, so no datum is chosen. The README's 7.2 needs no change (it already says the eigenvalue character is a function of `f` and `T` because `f ≠ 0`).

## Verified sound

### Disposition of the previous review's findings on this head

| Previous | Status | Where, and what was checked |
|---|---|---|
| R01 (P2) Tsushima and Ibukiyama formulas absent | Repaired | README 1640–1670 and 2818–2858 transcribe both; `Suggested.lean:1194`–1248 (`cyclotomicTrace`, `tsushimaDim`, `finrank_cusp_tsushima`), 1464–1521 (`periodicValue`, `ibukiyamaDim`, `finrank_cusp_paramodular`); the process sentences are gone; both formulas verified below against the texts and on independent data |
| R02 (P3) `GSp₄⁺(ℝ)` owner | Repaired | README 35–38, 86–90, 352–355, 485–489 and the Check 513–516 name `AutomorphicFormsOnReductiveGroups` §6.4 `positiveSimilitude` as the owner and state `GSpPos 2 ℝ = positiveSimilitude` as a comparison; at the open head of that roadmap (`roadmaps show --pr 1037`) §6.4 is "Components of GSp₄ and coherent multiplicities" (line 1022) and exposes `positiveSimilitude` (line 1028) |
| R03 (P3) `Θ_{2g,k}` at `k = g` | Repaired | README 2361–2366: span inside `M_k(Γ_g)`, cuspidal for `k > g` by 5.3, `θ_{E₈}^{(4)}` at `k = g = 4`, cuspidal part `Θ ∩ S_k` |
| R04 (P3) residue is a scalar | Repaired | README 2366–2372 ("the residue … is a scalar, the residue target: the value the Rallis inner-product identity assigns …"), 2397 |
| R05 (P3) three page locators | Repaired | README 2329 (Arakawa, p. 158: `arakawa1983` line 92 on the page with footer 158), 3403 (Aoki–Ibukiyama Proposition 2.1, p. 251), 1806 and 3404 (Theorem 4.1, p. 257) |
| R06 (P3) "semigroup" docstring | Repaired | `Suggested.lean:1275`–1276: "The set `O_g(m)` … not closed under multiplication" |

No repair report marked a finding "not actionable in this package".

### Gate, elaboration, probe, signatures, dependency direction, ownership

The worker's gate at this head reports every scanner `0` except `statement-hygiene=2` (R01, R02) and ends `FAIL`; `build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`, `dirty=0`. `git diff --stat origin/main...HEAD` outside the folder is empty and the worktree is clean. `lake env lean TauCetiRoadmap/SiegelModularForms/Suggested.lean` elaborated in 30 s with exactly 72 `declaration uses sorry` warnings and nothing else (70 at the previous head plus `finrank_cusp_tsushima` and `finrank_cusp_paramodular`).

Padding probe: a scratch copy with every `:= sorry` replaced by `by first | (simp; done) | rfl | infer_instance | (decide; done) | (norm_num; done) | sorry` elaborated with 72 `sorry` warnings remaining: no admitted declaration closes by a one-tactic probe. The two new definitions have real bodies (a finite sum over `(Finset.range n).filter (Nat.Coprime · n)` of `f (exp (2πi a/n))`, and `List.getD` on `k % t.length`); neither restates a Check.

Signatures (`#check` appended to the scratch copy): `finrank_cusp_tsushima : ∀ (k m : ℕ), 5 ≤ k ∨ m = 0 ∧ 4 ≤ k → ↑(finrank ℂ (cuspSubmodule (Gamma 2) (rho ↑k (2 * m)))) = tsushimaDim k m`; `finrank_cusp_paramodular : ∀ (k p : ℕ), p.Prime → 5 ≤ k → ↑(finrank ℂ (cuspSubmodule (paramodularR p) (rho ↑k 0))) = ibukiyamaDim k p`; `finrank_cusp_paramodular_four` with `p.Prime`, `5 ≤ p`; `saito_kurokawa` for even `k ≥ 4` and `f : Newform 1 (2k − 2)`; `isSingular_iff` with `0 < g`, `f ≠ 0`; `finrank_gammaTwo_odd` with `(3 ≤ k ∧ 2 ≤ j) ∨ (5 ≤ k ∧ j = 0)`; `exists_equiv_modularForm_degreeOne` for arithmetic `Γ ≤ Sp₂(ℝ)` and every `k`. Each agrees with its README statement (6.4 line 1642–1644, 10.1 line 2818, 10.1 line 2860, 9.5, 2.6, 6.5, 1.3). The `slashE` and `eigenvalue` signatures carry `[FiniteDimensional ℂ V]` and the eigenform hypothesis explicitly.

Dependency check, run with the candidate order, `--movable` and main:

```text
depcheck: 244 roadmaps, 2460 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line names this roadmap.

Ownership and duplication: `roadmaps grep --lean-only --fixed` for `cyclotomicTrace`, `tsushimaDim`, `ibukiyamaDim`, `periodicValue`, `GSpPos`, `SiegelHalfSpace` and `paramodularR` finds no declaration outside this folder at the open heads; the pinned Mathlib and Tau Ceti contain none of the four new names. `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id cited here, no id only an open revision defines; the closest roadmaps in vocabulary (`HalfIntegralWeightModularForms`, `HilbertModularForms`, `MaassForms`, `ModularForms`, `MetaplecticAutomorphicForms`) own degree one, Hilbert, Maass and metaplectic objects, as the previous review resolved. The 27 leads of `scratch/citations.md` are LMFDB knowl ids and one Tau Ceti name (`det_eq_of_transpose_mul_J_mul_eq_smul`, in `TauCeti/LinearAlgebra/Matrix/SymplecticMultiplier.lean` at the pin, `[Unique l]`), not missing Lean names of this roadmap.

### Tsushima's formula (6.4), against the text and independent data

Text: `tsushima1983ou` line 67–69 (Theorem 1: `j = 0, k ≥ 4` or `j ≥ 1, k ≥ 5`, the vanishing theorem by Kawamata–Viehweg, lines 65–66), 95–96 (signature `(2j + k, k)`, so Tsushima's `j` is the README's `m`), 104–118 (Theorem 4 on printed p. 141, the page header at line 89). The extraction drops exponents, but the term order, the integer coefficients `7`, `5`, `3`, `(2j+1)`, `(k−2)`, `(2j+k−1)`, `(2j+2k−3)`, the four `tr_i`, nine `tr_ρ`, two `tr_ω` and two `tr_σ` terms and their signs are legible and agree with README 1646–1659 and `tsushimaDim`. Taïbi: `taibi2017` line 189–195 (printed p. 6–7): Tsushima's range `m₁ > m₂ ≥ 5` or `m₁ = m₂ ≥ 4`, and validity for `m₁ > m₂ ≥ 3` by Arthur's classification, as README 1664–1667 says.

Computation (exact arithmetic in the Galois sums, complex floating point for the roots of unity, every value within `10⁻⁹` of an integer): the formula reproduces all 170 entries of van der Geer's table (`vdg` lines 2262–2272, `4 ≤ k ≤ 20`, even `j ≤ 18`), the seven acceptance values, and the scalar column `m = 0` against Igusa's Hilbert series `(1 + t³⁵)/((1 − t⁴)(1 − t⁶)(1 − t¹⁰)(1 − t¹²))` with `dim S_k = dim M_k − 1 − dim S_k(SL₂(ℤ))` for even `k ≥ 4` and `dim S_k = dim M_k` for odd `k`, at every `4 ≤ k ≤ 75` (both parities, including `k = 35, 37, 39`: `1, 0, 1`); the column `m = 1` against Satoh's series minus `dim S_{k+2}(SL₂(ℤ))` at every even `6 ≤ k ≤ 60`. It is a non-negative integer at every `5 ≤ k ≤ 60`, `0 ≤ m ≤ 30`. The two misreadings of the Check (README 1694–1697) fail as stated: `2` at `(8, 6)`, `11/12` and `5/8` at `(10, 0)`.

### Ibukiyama's formula (10.1), against the text and independent data

Text: `ibukiyama1985ou` lines 362–400 (Theorem 2, `k ≥ 5`, `H₃`–`H₁₂`, printed pp. 20–21; the bracket notation "`t = [t₀, …, t_{q−1}; q]` means `t_j` if `k ≡ j mod q`" at line 362–364), 411–500 (Theorem 3, `I₁`–`I₁₂`, pp. 22–25), 532–537 (Theorem 4, p. 26: `dim S_k(K(p)) = Σ H_i + Σ I_i` for `k ≥ 5` and every prime `p`), 506–519 (the table p. 27). Every legible coefficient agrees with README 2829–2852 and `ibukiyamaDim`: `H₃` (`5[…]/2⁵3` at `p = 2`), `H₄`, `H₅`, `H₆` (all three cases), `H₇` (all three), `H₈`, `H₉`, `H₁₀ = (1 + (5/p))[1,0,0,−1,0;5]/5`, `H₁₁ = (1 + (2/p))[1,0,0,−1;4]/2³`, `H₁₂` (four cases), `I₁ = [0,1,1,0,−1,−1;6]/6`, `I₂ = [−2,1,1;3]/(2·3²)`, `I₃` (three cases), `I₄ = [−1,1,1,−1;4]/2²`, `I₉ = −1/(2³3)`, `I₁₀ = (p+1)/(2³3)`, `I₁₁ = −(1 + (−1/p))/2³`. The OCR loses the exponents of `I₅`, `I₇`, `I₈` and `I₁₂`; the README's readings are forced by integrality (replacing `I₇` by `−(−1)^k(2k−3)/(2²3)` changes the total by an odd multiple of `1/24`, replacing `I₈` by `−p(2k−3)/(2·3²)` by `7p(2k−3)/144`, neither an integer at `(k, p) = (5, 5)`). The table row `p = 2` reads `0 0 0 1 0 1 1 2 0 2 1 4` and the row `p = 13` reads `3 5 7 10 13 19 23 31 37 48 56 72` (line 510, 519), exactly the README's; the rows `p = 5, 7, 11` are column-scrambled by the OCR but contain the computed values.

Computation (exact rationals): the four claimed columns at `p = 2, 3, 5, 13` and `dim S_5(K(17)) = 4`, `dim S_5(K(19)) = 5` are reproduced; the formula is a non-negative integer at every `5 ≤ k ≤ 40` and prime `p < 100`; the two misreadings of the Check (README 2882–2886) give `−1/16` at `(5, 2)` and `17/48` at `(5, 5)`. Independent check: Ibukiyama 2007 (`2fda2d93…` line 348–349, Theorem 2.6: the `k ≥ 5` formulas "are valid also for `k = 4`", and line 380–383, the `K(p)` weight-four formula "by putting `k = 4`") — the transcribed quasi-polynomial at `k = 4` equals Poor–Yuen's Theorem 3.1 formula (`pooryuen2015` line 235) at `p = 5, 7, 11, 13, 17, 19, 23` (`0, 1, 1, 2, 2, 3, 3`), and its leading term `(p² + 1)(2k−2)(2k−3)(2k−4)/(2⁹3³5) ~ (p² + 1)k³/8640` is `[Γ₂ : K(p) ∩ Γ₂]/[K(p) : K(p) ∩ Γ₂] = (p² + 1)` times Igusa's `k³/8640`.

### Seeded source sample

| Target | Text and result |
|---|---|
| 1.1 | The LMFDB knowl `mf.siegel` (fetched) takes `ρ` as a finite-dimensional complex representation of `GL(g, ℂ)` with `f(γτ) = ρ(cτ + d) f(τ)` and no cusp condition for `g > 1` (Koecher); README 681–684 restricts to holomorphic `ρ` and says so. Statement as cited |
| 2.5 | `vdg` line 442–443 (Theorem 4.3, printed p. 11), 475 (Corollary 4.5); `arakawa1983` line 253 ((1.6), `‖ρ(T^{−1/2}) a_f(T)‖ ≤ c(f)`, p. 163). As cited |
| 4.2 | `ez1983` line 682–697 (Theorem 2.1, `e_{k,1}(n, r) = H(k−1, N)/ζ(3−2k)`, OCR page 25 = printed p. 18), 2416 (Theorem 6.2, OCR page 78 = printed p. 71; the proof runs to p. 74), 2594 (Corollary 2 after Theorem 6.3, printed p. 75: the Eisenstein comparison). The Cohen values recomputed: `H(3,3) = −2/9`, `H(3,4) = −1/2`, `c(3) = 56`, `c(4) = 126`, `a(ψ₄;(1,1,1)) = 13440`, `a(ψ₄;(1,0,1)) = 30240`, `a(ψ₆;(1,1,1)) = 44352`, `a(ψ₆;(1,0,1)) = 166320` |
| 4.3 | `vdg` line 584–586 (Theorem 5.4: `k > g + r + 1` even, `Φ^{g−r} E = f`), 595–596 (Corollary 5.5: even `k > 2g`); `arakawa1983` line 217–218 (Proposition 1.2, `k > 4`, `ν ≥ 0`, footer 162 at line 229), 243–245 (Proposition 1.3, `N_{k,ν} ≅ S_{k+ν}`, footer 163). As cited |
| 6.1 | `vdg` line 858–862 (Theorem 9.1, `R` on [52] p. 849). Igusa's constants recomputed from the Maass–Cohen formula with generalized Bernoulli numbers: `−43867·2^{−12}3^{−5}5^{−2}7^{−1}53^{−1}(a(ψ₄ψ₆) − a(ψ₁₀))` at `(1,1,1)` is exactly `−1/4`, `131·593·2^{−13}3^{−7}5^{−3}7^{−2}337^{−1}(441·3·13440 + 250·2·44352 − 691·a(ψ₁₂))` is exactly `1/12`, and the normalized `χ₁₀` has `a((1,0,1)) = −2` |
| 6.5 | `cvdgg2015` line 934–942 (Theorem 12.1: both cubics, the ranges, `(k+1)(k²+2k+12)/12`, the shift `k ↦ k + 5`), 943–944 (Remark 12.2), 1036–1072 (Theorem 14.1 and the even-`k` generating functions with denominator `(1−t²)(1−t⁴)⁴(1−t⁶)`), 1491, 1642, 1687, 1736, 1740 (Theorems 20.2, 21.1, 22.1, 22.4, 23.1); `bfvdg2008` line 373, 391, 418, 424 (Conjectures 6.2, 7.1, 7.4, 7.6). The README's formulas agree term by term; `(3,2) ↦ 0`, `(4,2) ↦ 15` recomputed |
| 6.7 | `ibukiyama1991` line 569–576 (Theorem A, `A(Γ₀(2)) = ℂ[x,y,z,k]`, cusp ideal `(k, yz)`), 589–600 (odd weights, `θ'` with signs `(+, −, −, +)`, `χ₁₁ = θθ'`, Theorem C: `A_k(Γ₀(2)) = χ₁₉ A_{k−19}` for odd `k ≥ 19`). Hilbert values `1, 1, 3, 4, 7` and the vanishing for odd `k < 19` recomputed from `(1 + t¹⁹)/((1−t²)(1−t⁴)²(1−t⁶))` |
| 7.5 | Andrianov 1974 unreadable (paywalled). The formula recomputed on `χ₁₀` at `T = (1,1,1)`, `p = 2`: the three `R_2`-terms `½Uᵀ(1,1,1)U` are `[[½,½],[½,2]]`, `[[2,½],[½,½]]`, `[[2,3/2],[3/2,3/2]]`, none half-integral, and `a(T/2) = 0`, so `λ(2) = a((2,2,2)) = 240` |
| 8.1 | `vdg` line 1673–1683 (the quartic and `Σ T(pⁱ)zⁱ = (1 − p²T₂(p²)z²)/(z⁴F(1/z))`), 1740–1757 (spinor and standard factors). With `T₂(p²) = p^{2k+j−6}` this is README 2238–2241 |
| 8.3 | `vdg` line 1763–1773 (`Δ(f,s)` with `(2π)^{−gs}π^{−s/2}Γ((s+ε)/2)∏Γ(s+k−j)`, `Δ(f,s) = Δ(f,1−s)`, simple poles at `0, 1` for `k ≥ g`, holomorphic off the span of theta series of rank `2g`), 1774–1776 (Andrianov: `Φ_f(2k−2−s) = (−1)^k Φ_f(s)`); `arakawa1983` line 92 (the Theorem, p. 158, `ν > 0`); `gelbartjacquet1978` line 2151–2154 (Theorem 9.3 (1), journal p. 534: entire when `σ ≇ σ ⊗ χ` for every `χ ≠ 1`) |
| 8.4 | `vdg` line 1774–1776 (root number `(−1)^k`); Hodge types `(0, w), (k−2, k+j−1), (k+j−1, k−2), (w, 0)` give `Γ_ℂ(s)Γ_ℂ(s−k+2)` and, shifted by `w/2 = (2k+j−3)/2`, `Γ_ℂ(s + (j+1)/2)Γ_ℂ(s + (2k+j−3)/2)`, as README 2450–2452 |
| 9.4 | `vdg` line 1841–1845 (Theorem 21.1: `S^*_k` Hecke-stable, `f ↔ F` iff `L(F,s) = ζ(s−k+1)ζ(s−k+2)L(f,s)`); `ez1983` line 2416 (Theorem 6.2), 2563–2574 (Theorem 6.3 and the Saito–Kurokawa corollary) |
| 10.2 | `pooryuen2015` line 2180–2182 (`Q₂ = 1 + 2x + 4x² + 4x³ + 4x⁴`, `Q₃ = 1 + x + x² + 3x³ + 9x⁴`, `Q₅ = 1 + x − 2x² + 5x³ + 25x⁴`, Theorem 7.1), 66–69 (Theorem 1.3: Euler factors at `2, 3, 5`, linear coefficients at `7, 11, 13`); `λ(4) = λ(2)² − 4 − 1 = −1` from the `x²`-coefficient with `p^{2k+j−4} = 1` |
| 10.4 | Roberts–Schmidt 2006 and 2007 are in no legal cache: not verifiable |
| 11.2 | `194400² + 4 · 137403408384 = 587404993536 = 96² · 63737521` and `63737521 = 181 · 349 · 1009` is squarefree, so the field is `ℚ(√63737521)` and the roots are `−97200 ± 48√63737521` |

### Supplier citations resolved

`AutomorphicFormsOnReductiveGroups` §6.4 `positiveSimilitude` (head of #1037, lines 1022, 1028) and §§3.1–3.2; `ClassicalGroupsPartII` CG.0.1; `MetaplecticAutomorphicForms` 6.18, 6.20, 8.10–8.12, 8.18–8.19; `HalfIntegralWeightModularForms` 6.1–6.4; `QSeriesPartitionsAndMockModularForms` §9.1; `LatticePackingsAndPerfectForms` 5.6; `HyperellipticCurves` 5.3, 5.6; `AbelianVarietiesOverFiniteFields` 1.3; `AutomorphicLFunctionsAndLocalFactorsPartII` §§9.1–9.3; `AdelicAlgebraicGroups` §§2.2–2.3; `SmoothRepresentationsOfLocalGroups` SR.0.1, SR.0.3–0.4, SR.1.1–1.3; `PELModuli` M5, M6; `ShimuraCompactifications` 2.8, 7.16; `LevelOneAutomorphicFormsForClassicalGroups` LO.6; on main: `ThetaSeries`, `IntegralLattices` Layer 2 and 6D, `ModularForms` Layers 2, 3, 4, 7, 9, `LFunctions` Layer 0. The previous review resolved each at its head; `scratch/citations.md` lists no cross-roadmap citation found nowhere, and the dependency check confirms the direction.

### Adversarial values (this round; the previous review's table of 50 rows stands)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 6.4 Tsushima, table | 170 entries `4 ≤ k ≤ 20`, even `j ≤ 18` | all 170 equal, incl. the zero column `k = 4` | Pass |
| 6.4 Tsushima, `m = 0` vs Igusa | `k = 4, …, 75` | even: `M_k − 1 − dim S_k(SL₂)`; odd: `#{4a+6b+10c+12d = k−35}`; `k = 24, 30, 35`: `5, 8, 1`; no mismatch | Pass |
| 6.4 Tsushima, `m = 1` vs Satoh | even `6 ≤ k ≤ 60` | `satohDim(k) − dim S_{k+2}(SL₂)`; `k = 10, …, 22`: `0,0,1,2,2,3,5`; `k = 22` gives `5` both | Pass |
| 6.4 misreadings | `(8,6)`, `(10,0)` | `2`; `11/12` without `tr_σ`; `5/8` with `7 ↦ 1` | Pass |
| 6.4 integrality | `5 ≤ k ≤ 60`, `m ≤ 30` | no non-integer, no negative | Pass |
| 6.4 range | `(3,0)`, `(2,0)`, `(3,1)` | `−1`, `0`, `0`: `(3,0)` outside the stated range, as it must be | Pass |
| 10.1 Ibukiyama columns | `p = 2, 3, 5, 7, 11, 13`, `k = 5..16` | `p = 2`: `0,0,0,1,0,1,1,2,0,2,1,4`; `p = 13`: `3,5,7,10,13,19,23,31,37,48,56,72`; `(5,17) = 4`, `(5,19) = 5` | Pass |
| 10.1 at `k = 4` vs Poor–Yuen | `p = 5, …, 23` | `0,1,1,2,2,3,3` both | Pass |
| 10.1 misreadings | `(5,2)` Kronecker; `(5,5)` `δ₁`-term | `−1/16`; `17/48` (shift `31·(2k−2)(2k−4)/2304 = 31/48` at `k = 5`) | Pass |
| 10.1 OCR-lost exponents | `I₇`, `I₈` at `(5,5)` | `/(2²3)`: `+7/24`; `/(2·3²)`: `+35·7/144`; non-integers | forced as stated; Pass |
| 10.1 integrality | `5 ≤ k ≤ 40`, `p < 100` | no non-integer, no negative | Pass |
| 10.1 `p = 2` symbols | `ℚ(√−1), ℚ(√2), ℚ(√5), ℚ(√−3)` | discriminants `−4, 8, 5, −3`: `2` ramified, ramified, inert, inert → `0, 0, −1, −1` | Pass |
| 10.1 leading term | `p → ∞`, `k → ∞` | `(p²+1)k³/8640 = (p²+1) · ` Igusa's growth | Pass |
| 6.1 Igusa constants | `(1,1,1)`, `(1,0,1)` | `−1/4`, `1/12`, `−2` exact | Pass |
| 4.2 Maass–Cohen | `ψ₄, ψ₆` | `13440, 30240, 44352, 166320`; `a(ψ₆;(1,2,1)) = −12/B₆ = −504` | Pass |
| 7.5 coefficient formula | `χ₁₀`, `p = 2`, `T = (1,1,1)` | three `R_2`-terms non-half-integral, `λ(2) = a(2,2,2) = 240` | Pass |
| 6.3 Hilbert series | `k = 0, …, 24` even; `35, 37, 39` | `1,0,1,1,1,2,3,2,4,4,5,6,8`; `1,0,1` | Pass |
| 6.6–6.8 series | `Γ₀(3)` `B`, `Γ₀(2)`, `Γ₀(4)`, `ψ₄`-module | `1,0,1,0,4,0,7,0,10`; `1,1,3,4,7`, odd `< 19` zero; `1,3,7,14,24`, `k = 11`: `1`; `0,1,4` | Pass |
| 11.2 field | discriminant | `96² · 63737521`, `63737521 = 181·349·1009` | Pass |
| 1.2 Check | `g = 1`, `γ = diag(1,p)`, `e = k−1` | `p^{k−1}·p^{−k} f(τ/p) = p^{−1}f(τ/p)` = Mathlib's `det^{k−1}(cτ+d)^{−k}` | Pass |
| R01 multiplier entry | `diag(1,2)`, `g = 1` | `(MJMᵀ)_{inl 0, inr 0} = −2`, `μ = 2` | repair tested |
| Lean `cyclotomicTrace` | `n = 4, 3, 5, 12` | conjugates `{i, −i}`, `{ρ, ρ²}`, `{ω^a}_{a=1..4}`, `{σ, σ⁵, σ⁷, σ¹¹}` | Galois orbits; Pass |
| Lean `periodicValue` | `[]`, `k = 7` | `k % 0 = 7`, `getD → 0`; `[a,b,c]` at `k = 7` gives `b` | Pass |

## Not verifiable

- Andrianov 1974, Andrianov–Kalinin 1979, Böcherer 1985 and 1989, Piatetski-Shapiro–Rallis 1987, Mizumoto 1991, Weissauer 2009, Satoh 1986, Kohnen 2002, Ikeda 2001, Miyawaki 1992, Gritsenko 1995, Roberts–Schmidt 2006 and 2007, Brumer–Kramer 2014 and corrigendum, Igusa 1962, 1964, 1967, 1981, Tsuyumine 1986, Poor–Yuen 2007, Heim 2012, Deligne 1974, Rankin 1939, Cohen 1975, Andrianov–Maloletkin 1975, Maass 1964, 1972, 1979, Ibukiyama 2012, Freitag 1983, Klingen 1990: cited by locator, paywalled, waived or uncertified in the manifest.
- The manifest's `tsushima1983` and `ibukiyama1985` records point at Project Euclid pages whose fetched texts are Incapsula block pages (cache `63d8d673…`, `11153eff…`, one line each); the texts above were read from the institutional copies on `math.ou.edu/~rschmidt/dimension_formulas/papers/` (the host of the manifest-less `ibukiyama1991` and `arakawa1983` caches). The worker may want to repoint those two records; this review edits no manifest.
- `ibukiyama1985ou` is an OCR of a two-pages-per-scan copy: the exponents of `I₅`, `I₇`, `I₈`, `I₁₂` and the `p = 3, 5, 7, 11` rows of the table are not legible and were decided by integrality and recomputation as recorded above.
- Aoki–Ibukiyama 2005 has no manifest record and no cache file found under its title; the page locators 251, 257, 261 are taken from the previous review's reading of a journal copy.
- The LMFDB knowls other than `mf.siegel` were not re-fetched this round.

## Source issues

- **Misprint** in ibukiyama1991 at the Appendix, printed p. 34 (`ibukiyama1991` line 590): the odd-weight vanishing for `k ≤ 17` is printed for the level-three group; it should read the level-two group `Γ₀(2)` of Theorem C on the same page; affects nothing.
