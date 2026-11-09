# Review of SiegelModularForms (pull request #1714 at d01f7b0)

**Verdict:** needs changes

A full review: the folder changed by 537 lines since `4013044`. Every finding of the previous review is checked first, then the whole roadmap. Two P3 findings remain; nothing blocks.

## Previous findings

- R01 (P2), level-one theorems planned again without citing LevelOneAutomorphicFormsForClassicalGroups §§6.1–6.2: **repaired**. `README.md:128–137` records the ownership ("The level-one statements of `LevelOneAutomorphicFormsForClassicalGroups` §§6.1–6.2 … The variants kept here (1.3, 2.4, 2.6, 3.1–3.2) are stated on the analytic carrier"); `:352–369` adds the contract; `:371–376` adds the `AutomorphicBundles` §11.9 contract; `:1151–1155` adds the `Φ` comparison Check; `:1765–1767` and `:2159–2163` add the §7.9 comparison Checks; the `LO.6/…` ids are gone (`:125–127`, `:354`, `:1433`, `:1551`, `:2574`; `Suggested.lean:66`). All cited sections exist in the board package (`packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:2005, 2027, 2081, 2145, 2346, 2478`) and in AutomorphicBundles at its open head (§11.1, §11.9, §11.16).
- R02 (P3), Tau Ceti names at main's pin: **partly repaired**. `Matrix.transpose_mul_J_mul_eq_smul_iff` is gone (`:275`, `:296–299`, `:530`). The theta-series names of `:313–319` are still cited at a pin where they do not exist. See R01 below.
- R03 (P3), Mathlib names: **repaired**: `ModularForm.slash_def` (`:186`, `:248`, `:790`, `:795`), `ModularForm.E` with `EisensteinSeries.E_qExpansion_coeff_zero` (`:249–250`, `:1270–1271`), `ModularForm.sturm_bound_levelOne` (`:252`, `:1221`); all exist at the Mathlib pin (`SlashActions.lean:137`, `EisensteinSeries/Basic.lean:47`, `EisensteinSeries/QExpansion.lean:348`, `LevelOne/DimensionFormula.lean:250, 307`). The Tau Ceti Sturm name is still missing its namespace (R01 below).
- R04 (P3), 2.3 at period `N`: **repaired**. `:965–973` restates it for `τ ↦ τ + NS` with the bound `∑ ‖fourierCoeff N f T‖ e^{−2πc·tr T/N}` and no `GL_g(ℤ)` hypothesis; `:995–998` applies it with `N = N_δ`; the two Checks (`:979–987`) are recomputed below.
- R05 (P3), "not self-adjoint" at `p ∣ N`: **repaired** (`:2278`, `:2301–2304`).
- R06 (P3), coset types of 7.5: **repaired** (`:2360–2363`): the three types `(1, p·1)`, `(pU⁻¹, Uᵀ)`, `(p·1, 1)` in the order of the terms, each with `A Dᵀ = p·1`, and the count `p³ + p(p+1) + 1 = (p+1)(p²+1)`; recomputed below.
- R07 (P3), 7.6 without locator or Checks: **repaired**: the route through §6.1's intertwining (`:2381–2389`) and three Checks (`:2407–2413`), recomputed below.
- R08 (P3), Layer 8 needing Layer 9: **repaired**. The Maass-space poles and the Ramanujan–Petersson bound moved to 9.5 (`:2852–2875`); 8.3's *Needs* (`:2600–2603`) no longer name 9.5; Layer 8's *Dependencies* (`:2694–2699`) end "Nothing of Layer 9"; the layer *Dependencies* of Layers 0, 3, 5, 6, 7, 8, 9, 10 now list their suppliers. The depcheck below is clean.
- R09 (P3), `SiegelSpace`: **repaired**: `ℍ[2] ≃ₜ SiegelSpace` (`:582–586`, Check `:602–604`).
- R10 (P3), Hayashida: **repaired** (`:2972`, `:3692–3694`).
- R11 (P3), Poor–Yuen 2007 locator: **repaired** (`:2124–2128`): "§13, Examples 1–8, pp. 208–215, which treat even weights only"; odd `k ≤ 13` from §7.9. Verified below.
- R12 (P3), Ibukiyama 2012 generators "by citation": **repaired** by removal; `:149–151` records that the `j ≥ 4` module generators are owned by no roadmap.
- R13 (P3), Humbert surfaces: **repaired** (`:152–155`, `:3502`).
- R14 (P3), Lean names absent from the README: **repaired**: the "In `Suggested.lean` …" paragraphs of Layers 0, 1, 2, 3, 4, 5, 6, 7, 9, 10 (`:721–734`, `:861–871`, `:1071–1083`, `:1239–1243`, `:1403–1405`, `:1639–1641`, `:2166–2173`, `:2415–2421`, `:3009–3012`, `:3322–3325`). The gate's `readme-ids-missing` is `0`.

## R01 (P3) — Tau Ceti theta-series and Sturm names are cited "at the pin" at names that do not exist at this pull request's pin

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:313–319`: "`TauCeti.NumberTheory.ModularForms.ThetaSeries.*` … `ZLattice.thetaSeries L` … `ZLattice.thetaSeries_S_smul` … `ZLattice.thetaForm`"; `:323`: "`ModularForm.sturm_bound_finiteIndex`"; `:221`: "a Tau Ceti declaration at the pin".

**Claim:** `lake-manifest.json` pins Tau Ceti at `358314d4`, where `TauCeti/NumberTheory/ModularForms/` has no `ThetaSeries` directory. At main's pin `2fd255d9` the first two names exist, but the third is `ZLattice.IsEven.thetaForm`, and the Sturm theorem is `TauCeti.ModularForm.sturm_bound_finiteIndex`.

**Witness:**
- At `358314d4` (this pull request's `.lake/packages/TauCeti`): the directory listing of `TauCeti/NumberTheory/ModularForms/` has no `ThetaSeries`.
- At `2fd255d9`: `ThetaSeries/Basic.lean:96, 102` (`namespace ZLattice`, `def thetaSeries`); `ThetaSeries/Inversion.lean:55, 104` (`ZLattice.thetaSeries_S_smul`); `ThetaSeries/LevelOne.lean:65, 70, 122` (`namespace ZLattice`, `namespace IsEven`, `def thetaForm`).
- `TauCeti/NumberTheory/ModularForms/SturmBound.lean:28, 79`: `TauCeti.ModularForm.sturm_bound_finiteIndex`.

**Repair:** merge main so that the pin moves to `2fd255d9`, rerun the targeted build, and write `ZLattice.IsEven.thetaForm` at `:317` and `TauCeti.ModularForm.sturm_bound_finiteIndex` (and `…_SL2Z`) at `:323–324`, `:1220` and `:1254`. If the pin stays, say at `:313` that the pinned Tau Ceti has no theta-series module and cite the theta-series roadmap's targets instead.

## R02 (P3) — 9.5 attributes "`Λ(s, F, spin)` entire off the Maass space" to Andrianov and Arakawa; in scalar weight that is Evdokimov's theorem

**Location:** `README.md:2861–2865`: "For a cuspidal eigenform `F ∈ S_{k,j}(Γ₂)` orthogonal to the Maass space … `Λ(s, F, spin)` is entire (the holomorphy part of Andrianov's and Arakawa's theorems as cited in 8.3)".

**Claim:** For `j = 0` and even `k`, Andrianov's theorem (as 8.3 cites it) gives the continuation, the functional equation and finitely many poles; which cusp eigenforms have the pole at `s = k` is the characterization of the Maass space by Evdokimov (and Oda). The statement as written is true, but its source is not among the references.

**Witness:** `vdg` lines 1774–1776 record Andrianov's theorem as "meromorphic with only finitely many poles" with the functional equation `Φ_f(2k − 2 − s) = (−1)^k Φ_f(s)`, and nothing about where the poles are; Andrianov 1974 is not in the cache. The pole criterion is S. A. Evdokimov, *Characterization of the Maass space of Siegel modular cusp forms of genus 2*, Mat. Sb. 112 (1980), 133–142 (Math. USSR-Sb. 40 (1981), 125–133); also T. Oda, *On the poles of Andrianov L-functions*, Math. Ann. 256 (1981), 323–340.

**Repair:** in 9.5 write "entire by Evdokimov's characterization of the Maass space (Evdokimov 1980; Oda 1981), the pole at `s = k` occurring exactly on the Maass space; for `j > 0` Arakawa 1983", and add the two works to the references. Keep Andrianov 1974 for the continuation and functional equation only.

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

- **Worker's gate** (`scratch/gate.md`): every check `0`, `build=0`, `OK`.
- **Dependency check** with the candidate order, `--movable` and main:

```text
depcheck: 238 roadmaps, 2320 edges, 0 problem(s)
```

- **Elaboration:** `lake env lean` on `Suggested.lean` exits `0` in 29 s with exactly 72 `declaration uses 'sorry'` warnings and nothing else. Pins: Mathlib `f6090c70`, Tau Ceti `358314d4` (main: `1b1ccf4b`, `2fd255d9`; R01).
- **Signatures:** a scratch copy with `#check @…` for all 208 declarations elaborates with 0 errors. Compared with the README: `koecher` carries `2 ≤ g`, `IsArithmetic Γ`, holomorphy, `Γ`-invariance, `0 < N` and the translation containment; `bounded_of_invariant` the same; `isSingular_iff` carries `0 < g` and `f ≠ 0`; `finiteDimensional` carries `IsArithmetic Γ`; `exists_eigenform_basis` is for every `ρ` and `e`; `finrank_cusp_tsushima` carries `5 ≤ k ∨ (m = 0 ∧ 4 ≤ k)`; `finrank_gammaTwo_odd` carries `Odd k`, `Even j`, `(3 ≤ k ∧ 2 ≤ j) ∨ (5 ≤ k ∧ j = 0)`; `finrank_gammaTwo_even` carries `Even k`, `4 ≤ k`, `Even j`, `2 ≤ j`; `saito_kurokawa` and `finrank_maassSubmodule*` carry `Even k`, `4 ≤ k`; `eigenvalue_isIntegral` carries `2 ≤ k`; `finrank_cusp_paramodular` carries `p.Prime`, `5 ≤ k`; `finrank_cusp_paramodular_four` carries `p.Prime`, `5 ≤ p`; `siegelTheta_symJ_smul` carries `finrank ℝ E = 2k` with the measurable-space and lattice instances. Nothing was lost through `variable` blocks.
- **Natural-number subtraction:** `saito_kurokawa` uses `p ^ (k − 1)` and `p ^ (k − 2)` with `k : ℕ`, safe under `4 ≤ k`; `igusa_odd` uses `k − 35`, where for odd `k < 35` the weight-`0` constraint and `M_k(Γ₂) = 0` make `P = 0` the unique solution; `heckeDiag g p i` with `i > g` collapses to the scalar `p·1`, a harmless double coset.
- **Padding probe:** each `:= sorry` replaced by `first | rfl | simp | infer_instance | trivial | norm_num | decide | exact?`: all 66 sites fail (63 with a tactic error, 3 proof obligations `isCuspForm_zero`, `IsMaassForm.add`, `IsMaassForm.smul` by heartbeat timeout); the 6 sites with `sorry` on its own line are the obligations of bundled definitions. Nothing closes in one tactic.
- **Headlines:** the statable ones are stated; the module docstring (`Suggested.lean:22–50`) names the ten that are not, each with its missing carrier. `AutomorphicBundles` §11.1, §11.9, §11.16 exist at its open head (its lines 3789, 4057, 4296) and say what `:371–376` consumes.

### Seeded sample (15 targets) and flagged locators

- **0.2:** CG.0.1 at the head of ClassicalGroupsPartII (its line 399); AutomorphicFormsOnReductiveGroups §6.4 (its line 1021). `−J Mᵀ J = [[Dᵀ, −Bᵀ], [−Cᵀ, Aᵀ]] = μ M⁻¹` recomputed; `GSpPos.mult` reads `−(M J Mᵀ)(inl 0, inr 0)`, which is `μ` since `J(inl 0, inr 0) = −1`.
- **0.4:** `vdg` lines 195–201: the stabilizer of `i·1_g` is `U(g)`; the three generator laws recomputed (table).
- **0.5:** cocycle and `det Im(γ • τ) = |det j|^{−2} det Im τ` recomputed on `J` at `2i` (table).
- **1.2:** Mathlib `slash_def` (`SlashActions.lean:137`): `σ g (f (g • τ)) · |det g|^{k−1} · denom^{−k}`; on `diag(1, p)` both sides give `p⁻¹ f(τ/p)`.
- **2.2:** `vdg` Definition 4.1 (line 387) and the equivariance `a(uᵗnu) = ρ(uᵗ) a(n)` (line 452); the direction rederived from `f ∣ m(U) = f` (table).
- **4.3:** `vdg` Theorem 5.4 (line 584: `k > g + r + 1`, `k` even, `Φ^{g−r} E = f`) and Corollary 5.5 (line 595: `Φ` onto for even `k > 2g`). Arakawa 1983 is uncertified.
- **5.3:** `vdg` lines 2299–2309: Ibukiyama's `F ≠ 0 ∈ S_{8,6}` from the lattice `{x ∈ ℚ¹⁶ : 2x_i ∈ ℤ, x_i − x_j ∈ ℤ, ∑x_i ∈ 2ℤ}` with `a = (2, i, i, i, i, 0, …, 0)` and `F_ν = ∑ (x,a)^{6−ν}(y,a)^ν e^{πi(…)}`. The Gaussian-transform law recomputed (table). Freitag 1983 is not in the cache.
- **6.5:** `cvdgg2015` Theorem 12.1 (lines 934–942): both cubics, `dim M_{0,k} = (k+1)(k²+2k+12)/12` and the shift by `5`, as stated; Remark 12.2 (line 943); Theorem 14.1 (lines 1036–1056): denominator `(1 − t²)(1 − t⁴)⁴(1 − t⁶)` with cubic numerators by `j mod 4`. `bfvdg2008` Conjectures 6.2, 7.1, 7.4, 7.6 at lines 373, 391, 418, 424.
- **6.7:** Ibukiyama 1991 is not in the cache. The Checks are recomputed numerically (table): the `(+, −, −, +)` form is invariant under `τ ↦ τ + diag(0, 1)` and the four-plus form is not; the Hilbert series gives `1, 1, 3, 4, 7`.
- **6.9:** `pooryuen2007`: §13 "Examples" begins at line 1194 (pdf page 23, journal p. 207); Examples 1–6 at lines 1269–1322 (pdf pages 24–26, journal pp. 208–210): `S₂, S₄, S₆ = 0`, `S₈ = S₁₀ = 1`, `S₁₂ = 2`; Example 7 at line 1523 (journal p. 213): `S₁₄ = 3`; Example 8 at line 1590 (journal p. 214, running into p. 215): `S₁₆ = 7`. "pp. 208–215" is right. LevelOne §7.9's table: degree `3` one row `(3, 12)`; degree `4` rows `(4, 8)`, `(4, 10)`, `(4, 12)`, `(4, 12)`, no odd weight.
- **7.3:** Tau Ceti `Petersson/Normal.lean` has `isAdjointPair_heckeRingHomCuspCharSpace_heckeTGeneratorGamma0` and `commute_peterssonAdjoint_…`; `CharacterDecomp.lean` has both `isInternal_*`. The cubic-character Check recomputed (table). Roberts–Schmidt is not in the cache.
- **8.1:** `vdg` §18 lines 1673–1683 (the quartic `F(X)` and `∑ T(pⁱ)zⁱ = (1 − p²T₂(p²)z²)/z⁴F(1/z)`) and §19 lines 1697–1711 (`α₀²∏α_i = p^{∑λ_i − g(g+1)/2}`, Eisenstein parameters, `λ(p) = α₀(1 + σ₁ + … + σ_g)`); the degree-two `Q_p` follows with `T₂(p²) = p^{2k+j−6}`.
- **8.3:** `vdg` lines 1763–1776: `Δ(f, s)`, `ε`, the functional equation `Δ(s) = Δ(1 − s)`, poles at `s = 0, 1` for `k ≥ g`, holomorphy off the rank-`2g` theta span, and Andrianov's statement (R02). `gelbartjacquet1978` Theorem 9.3 (1) at its lines 2134, 2151–2154 (previous review; unchanged text). Mizumoto is uncertified.
- **9.4:** `vdg` lines 1826–1833 (the Maass relation `a([n,r,m]) = ∑_{d ∣ (n,r,m)} d^{k−1} a([1, r/d, mn/d²])`) and Theorem 21.1 (line 1841).
- **11.2:** `T₂` on `S₃₈(SL₂(ℤ))` recomputed from `q`-expansions: characteristic polynomial `X² + 194400X − 137403408384`, discriminant `587404993536 = 96² · 63737521`.
- **Also:** `taibi2017` lines 176–178 and 189–195: `r` has highest weight `(m₁, m₂) = (k + j, k)`, so Tsushima's range `m₁ > m₂ ≥ 5 or m₁ = m₂ ≥ 4` is `k ≥ 5` for `j > 0` and `k ≥ 4` for `j = 0`, and Arthur's `m₁ > m₂ ≥ 3` is `k ≥ 3`, as 6.4 says. `vdg` Theorem 4.3 (line 442, p. 11) ends with the majorization `∑_{n ≥ 0} |a(n)| e^{−2π tr(n) c}` (lines 466–467), the statement 2.3 generalizes to period `N`.
- **Flagged locators:** Igusa 1981 (6.9) and Tsuyumine's series are cited as unread; the series expands to `1, 1, 1, 2, 4` at `k = 4, …, 12` (previous review, unchanged text).

### Library declarations opened at the pins

- **Mathlib `f6090c70`:** `SlashActions.lean:137` (`slash_def`), `EisensteinSeries/Basic.lean:47` (`E = (1/2) • eisensteinSeriesMF … 0`, "the coprime-pair sum halved"), `EisensteinSeries/QExpansion.lean:348` (`E_qExpansion_coeff_zero {k} (hk : 3 ≤ k) (hk2 : Even k)`), `LevelOne/DimensionFormula.lean:250, 307`, `GroupTheory/Commensurable.lean:61` (`Subgroup.Commensurable`), `Matrix/Hermitian.lean:68` (`isHermitian_iff_isSymm`), `Matrix/Symmetric.lean:81` (`IsSymm.map`), `GeneralLinearGroup/Defs.lean:147` (`mkOfDetNeZero`).
- **Tau Ceti `358314d4`:** 28 cited names found by grep in the files the README names: `Symplectic/Basic.lean` (`symJ`, `ofSymplecticGroup`, `mulEquivSymplecticGroup`), `Symplectic/Levi.lean` (`leviHom`), `UnipotentGeneration.lean` (`upperUnipotent`, `lowerUnipotent`), `TorusGeneration.lean:140` (`variable {K} [Field K]`, as `:290–291` says), `SymplecticGroup.lean` (`fromBlocks_*_mem`, `transpose_eq_J_conj_inv`), `SymplecticMultiplier.lean` (`transpose_mul_J_mul_eq_det_smul`), `Topology/Algebra/SymplecticGroup.lean`, `Newforms/Satake.lean`, `Newforms/Newform.lean`, `Eigenform.lean`, `LFunction/Basic.lean`, `EisensteinSeries/Normalized.lean`, `LevelOne/GradedRing.lean`, `SturmBound.lean`, `CharacterDecomp.lean`, `Petersson/Normal.lean`, `AlgebraicGeometry/AbelianVariety/Basic.lean`. The three theta-series names: R01.

### Cross-roadmap citations resolved (every one, at the open heads or on main)

HalfIntegralWeightModularForms 6.1–6.4 (its lines 1586, 1624, 1659, 1707); MetaplecticAutomorphicForms 6.18, 6.20, 8.10–8.12, 8.18, 8.19, 8.76 (1769, 1805, 2491, 2507, 2522, 2609, 2625, 3309); AutomorphicFormsOnReductiveGroups §§3.1, 3.2, 6.4, 7.2, 7.4 (527, 544, 1021, 1149, 1219); ClassicalGroupsPartII CG.0.1 (399); LatticePackingsAndPerfectForms 5.6 (1474); HyperellipticCurves 5.3, 5.6 (2130, 2210); AbelianVarietiesOverFiniteFields 1.3 (525); SmoothRepresentationsOfLocalGroups SR.0.1, SR.0.3, SR.0.4, SR.1.1–SR.1.3 (583, 760, 864, 1045, 1215, 1294); QSeriesPartitionsAndMockModularForms §9.1 (1374); AutomorphicLFunctionsAndLocalFactorsPartII §§9.1–9.3 (1534, 1571, 1605); AdelicAlgebraicGroups §§2.2–2.3 (1774, 1886); PELModuli M5 `siegelModuli`, M6 `siegelStack` (46–47); ShimuraCompactifications 2.8, 7.16 (1339, 2577); LFunctions *Layer 0* `AnalyticLFunctionData`, `ArithmeticLFunctionData`, `NormalizationTranslation` (349, 386–387); AutomorphicBundles §§11.1, 11.9, 11.16 (3789, 4057, 4296); LevelOneAutomorphicFormsForClassicalGroups §§6.1, 6.2, 6.4, 6.7, 7.3, 7.9 (board package, lines 2005, 2027, 2081, 2145, 2346, 2478). The worker's `roadmaps resolve` found no missing citation. HilbertModularSurfaces (its line 1832) still names this roadmap for Humbert surfaces; `:152–155` and `:3502` answer it. HilbertModularForms defers Siegel forms here (its lines 202–203); MaassForms and BianchiModularForms name no Siegel object. `scratch/overlaps.md`: no conflicting or dropping pull request.

### Adversarial table

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.2 `M^∨ = μ M⁻¹` | Mathlib `J` | `−J Mᵀ J = [[Dᵀ, −Bᵀ], [−Cᵀ, Aᵀ]]`; `diag(1,2)`: entry `−2`, `μ = 2` | Pass |
| 0.4 generator laws | `diag(i, 2i)`, `i·1₂` | `J•diag(i,2i) = diag(i, i/2)`; `n(diag(1,0))•i1 = [[1+i,0],[0,i]]`; `m(diag(1,2))•i1 = diag(i,4i)`; `g=1`, `γ = diag(1,2)`: `Im(τ/2) = 2·(1/2)(1/2) Im τ` | Pass |
| 0.5 cocycle | `J·J = −1`; `τ = 2i` | `(−τ⁻¹)τ = −1`; `det Im(Jτ) = 1/2 = (1/4)·2` | Pass |
| 1.2 slash bridge | `diag(1,p)`, `e = k−1` | `p^{k−1}p^{−k}f(τ/p)` both sides; `e+1` multiplies by `p` | Pass |
| 1.3 parity | `det⁰ ⊕ det¹`, `g = 1`, `f ≡ (1,0)` | `ρ(j)⁻¹(1,0) = (1,0)`: nonzero form with `ρ(−1) ≠ 1`; `g = 2`: `ρ(−1) = 1` | Pass |
| 2.2 equivariance | `f ∣ m(U) = f` | `f(UτUᵀ) = ρ(Uᵀ)⁻¹f(τ)` ⇒ `a(UᵀTU) = ρ(Uᵀ)a(T)`; `diag(1,−1)`: `a(n,−r,m) = (−1)^k a(n,r,m)` | Pass |
| 2.2 Checks | `E₄(τ/2)`, `Δ(τ/2)` | coefficients `1, 240, 2160`; `1, −24`; jump `E₄((1+i)/2) − E₄(i/2) = −4E₄(i) − 16E₄(2i) = −21.836` | Pass |
| 2.3 Checks | `ψ₄(τ/2)` at `2i·1₂`; `E₄(τ/2)` | `E₄(i)² = 2.1192`, `E₄(2i)² = 1.0017`; `E₄(i) = 1.4558`, `E₄(2i) = 1.0008`; `δγδ⁻¹ = [[A, B/2],[2C, D]]` integral on `Γ₂(2)` | Pass |
| 2.4 `koecher` | `(1,1,0)`; `g = 1` | `4nm − r² = −1` ⇒ `0`; `j(τ)` excluded by `2 ≤ g` | Pass |
| 2.6 `isSingular_iff` | `(g,k) = (1,0), (2,0), (9,4), (8,4), (2,10)` | `0<1`, `0<2` (constants singular); `8<9`; `8<8` false (`θ_{E₈}^{(8)}` has rank-8 Gram matrices); `χ₁₀` has `a(1,1,1) = 1` | Pass |
| 4.3 Klingen | `(g,r) = (2,1)`; `k = 4, 12` | `k > 4` ⇒ even `k ≥ 6`; `M₄ = 1+0+0`; `M₁₂ = 1+1+1` | Pass |
| 5.3 Gaussian law | `m = g = 1`, `Y = 2`, `P = 1` | `2^{−1/2}exp(−πξ²/2)`; ratios `0.7071`, `2^{−1/2}e^{3π/2} = 78.71` | Pass |
| 5.3 negative control | `E₈`, `((x,a)X₀ + (y,a)X₁)⁸` | `(a,a) = 0` ⇒ pluriharmonic; `P(XA) = ρ(Aᵀ)P`; `Φθ = (∑_{roots}(r,a)⁸)ΔX₀⁸`, nonzero: 240 roots are a 7-design, not an 8-design | Pass |
| 5.3 Ibukiyama | `a = (2,i,i,i,i,0,…)` | `(a,a) = 4 − 4 = 0`; `∑_t ∂²P₀/∂x_t² = 30(a,a)(x,a)⁴ = 0`; row-pair sum `120(x,a)⁴ ≠ 0` | Pass |
| 6.3 `igusaDim` | `k = 0, …, 24` even | `1,0,1,1,1,2,3,2,4,4,5,6,8`; odd: `M₃₅ = 1`, `M₃₇ = 0`, `M₃₉ = 1` | Pass |
| 6.4 `tsushimaDim` | 12 points | `(8,3),(10,2),(14,1),(16,1),(20,1),(12,3),(6,6),(35,0),(24,0),(30,0),(8,6),(10,0)` → `1,1,1,2,3,2,1,1,5,8,2,1`; `m = 0`, `k = 4..16`: `0,0,0,1,1,1,2`; `m = 1`, `k = 10..22`: `0,0,1,2,2,3,5`; imaginary parts `0` | Pass |
| 6.4 `satohDim` | `k = 10..22` | summand counts `1,0,2,3,3,4,7`; minus `dim S_{k+2}(SL₂) = 1,0,1,1,1,1,2` gives `0,0,1,2,2,3,5` | Pass |
| 6.5 cubics | `(3,2)`, `(4,2)`, `(5,0)`, `(7,0)`, `(9,0)` | `0`, `15`, `1`, `5`, `15`; `(k+1)(k²+2k+12)/12 = 1,5,15,35`; odd cubic at `j = 0` equals `(k−4)(k²−8k+27)/12`, the shift by 5 | Pass |
| 6.7 `θ'` signs | `τ = i[[1.2,.2],[.2,1.5]] + [[.1,.05],[.05,−.2]]`, 20 theta constants | `X,Y,Z,K,T` and `χ₁₉` unchanged under `τ ↦ τ + diag(0,1)` (`|χ₁₉| = 4.4126·10⁻¹³` both sides, difference `5·10⁻²⁷`); four-plus form `1.7181·10⁻¹²` → `1.7229·10⁻¹²`; `χ₁₉(γτ)/(det(Cτ+1)^{19}χ₁₉(τ)) = 1.000` for `C = 2diag(1,0)`; 10 even, 6 odd (`|θ_odd| < 10⁻¹⁶`) | Pass |
| 6.7 Hilbert series | `(1+t¹⁹)/((1−t²)(1−t⁴)²(1−t⁶))` | `1,1,3,4,7` at `k = 0..8`; `χ₁₉`: `5+6+8 = 19` | Pass |
| 6.9 Poor–Yuen | Examples 1–8 | `0,0,0,1,1,2,3,7` at `k = 2..16`; §7.9 rows `(3,12)`; `(4,8),(4,10),(4,12)×2` | Pass |
| 7.1 cosets | `p = 2, 3` | `15,120,30,1` → `151`; `40,1080,120,1` → `1201 = (p+1)(p²+1)(p³+p)+1` | Pass |
| 7.2 Eisenstein eigenvalues | `ψ₄, ψ₆` at `2` | `(1+8)(1+4) = 45`; `(1+32)(1+16) = 561`; weight 0: `15/8`, `40/27` | Pass |
| 7.3 adjoint | cubic `χ` mod 7, `χ(3) = ω` | `χ(2) = χ(3)² = ω²`, `T₂* = χ(2)⁻¹T₂ = ωT₂` | Pass |
| 7.5 cosets | `U = [[p,u],[0,1]]`, `[[1,0],[0,p]]` | `p⁻¹UᵀTU = (pn, 2nu+r, (nu²+ru+m)/p)`, `(n/p, r, pm)`; `(1, p·1)`: `p^{2k−3}p^{−2k}·p³ = 1` on `a(pT)`; `(p·1, 1)`: `p^{2k−3}a(T/p)`; vector factor `p^{2k+j−2}ρ(Uᵀ)⁻¹` with `det U = p` gives `p^{k−2}` for `j = 0`; `p³ + p(p+1) + 1 = (p+1)(p²+1)` | Pass |
| 7.6 Klingen | `E_{2,1,12}(Δ)`, `p = 2` | `λ = −24·1025 = −24600`; `ββ̄·2¹⁰ = 2²¹ = 2^{2k−3}`; `2¹¹` gives `2²²`; `r = 0`: `(1, p^{k−1}, p^{k−2})`; `(rk − r(r+1)/2) + ∑_{i=r+1}^{g}(k−i) = gk − g(g+1)/2` | Pass |
| 8.1 degree-two `Q_p` | `vdg` `F(X)` | `p²T₂ = p^{2k+j−4}`, `p³T₂ = p^{2k+j−3}`, `p⁶T₂² = p^{4k+2j−6}`; `χ₁₀` at 2: `X`-coefficient `−2⁸−2⁹+528 = −240` | Pass |
| 8.2 half-planes | `ψ₆`; Klingen `(k,j)`; `χ₁₀` | `p⁹` ⇒ `Re s > 10`, `p⁵` ⇒ `> 6`; `p^{k−2}·p^{(k+j−1)/2}` ⇒ `> (3k+j−3)/2 = 33/2` at `(12,0)`, standard `p^{k−2}` ⇒ `> 11`; `χ₁₀`: `8,9,17/2,17/2` ⇒ `> 10`; `0,±1/2` ⇒ `> 3/2`; `2a − w = 3` | Pass |
| 8.3 gamma | Hodge types of `(k,j)` | `(k−2) + (k+j−1) = 2k+j−3 = w`; shifts `0`, `k−2`; `(8,6)`: `0, 6`, `w = 19` | Pass |
| 8.5 `b_st(2)` | `χ₁₀` | `α₁+α₂ = −33/16`, `α₁α₂ = 2`, `1 − 33/16 − 33/32 = −67/32` | Pass |
| 9.4 Maass relation | `χ₁₀` at `(2,2,2)`, `(1,2,4)`, `(−1,1,−1)` | `−272 + 2⁹ = 240`; `(1,2,4)` and `(1,0,3)` both disc `12`, content `1`; `d^k` gives `−272 + 2¹⁰`; negative definite index excluded by `IsPosSemidef` | Pass |
| 9.5 `saito_kurokawa` | `χ₁₀` at `2, 3`; `χ₁₂` at `2` | `−528+512+256 = 240`; `−4284+19683+6561 = 21960`; `−288+2048+1024 = 2784`; `p^{k−3}` gives `112` | Pass |
| 9.5 poles | `f ∈ S_{2k−2}`, `k` even | center `k−1`, root number `(−1)^{k−1} = −1` ⇒ `L(k−1,f) = 0` cancels `ζ(s−k+2)`; `L(k,f) ≠ 0` since `k > k−1/2` (Deligne), `> k−1/5` (Rankin), `= k` boundary (Hecke); mirror `2k−2−k = k−2` | Pass (source: R02) |
| 11.2 coefficient field | `S₃₈`, `T₂` | `X² + 194400X − 137403408384`; disc `587404993536 = 2¹⁰·3²·63737521 = 96²·63737521`; roots `−97200 ± 48√63737521` | Pass |
| 11.3 types at `k = 20` | `p = 2` | `(1, 2¹⁹, 2¹⁸)`, `(β, β̄/β, 2¹⁸)`, `(2¹⁸, β'2^{−18}, β̄'2^{−18})`: three `W`-orbits; `5 = 1+1+2+1` | Pass |
| `finrank_cusp_paramodular_four` | `p = 5..23` | `576·dim = 0, 576, 576, 1152, 1152, 1728, 1728` ⇒ `0,1,1,2,2,3,3` | Pass |
| `finrank_maassSubmodule` | `k = 4, 6, 8, 10, 12` | `dim M_{2k−2} = 1,1,1,2,2` against `M_k^* = ℂψ_k`, …, `⟨ψ₁₂, χ₁₂⟩` (Klingen section excluded) | Pass |
| `exists_equiv_modularForm_degreeOne` | cusp condition | Mathlib bounds `f ∣[k] A` for `A ∈ SL₂(ℤ)`; `SL₂(ℚ) = SL₂(ℤ)·B(ℚ)` and `f ∣ b` for upper-triangular rational `b` is a rescaled translate, so the two boundedness conditions agree | Pass |
| `siegelTheta_symJ_smul` | `g = 1`, `L = ℤ²` | `θ(−1/τ) = (τ/i)θ(τ)`, `covol = 1`, `L^∨ = L` | Pass |
| LevelOne comparison | §7.9 rows | `(2,10)`, `(2,12)` ↔ `χ₁₀`, `χ₁₂`; `S_k(Γ₂) = 0` for other `k ≤ 13` ↔ Igusa (odd `k < 35` zero) | Pass |

## Not verifiable

- **Blocked pages in the cache:** `tsushima1983` and `ibukiyama1985` hold a Project Euclid / Incapsula stub (530 and 514 bytes). The formulas were tested numerically instead (table; the paramodular columns in the previous review).
- **Uncertified or waived:** Satoh 1986 (6.4), Arakawa 1983 (4.3, 8.3, 9.5), Weissauer 2009 (9.5), Mizumoto 1991 (8.3), Tsuyumine 1986 and Klingen 1990. Cited by locator.
- **Not in the cache and not in the manifest:** Freitag 1983 (2.4, 5.3), Igusa 1962/1964/1967/1981 (6.2, 6.3, 6.5, 6.9), Ibukiyama 1991 and 2007 (6.6, 6.7, 10.1), Aoki–Ibukiyama 2005 (6.2, 6.6, 6.8), Andrianov 1974 (7.5, 8.1, 8.3), Andrianov–Kalinin, Böcherer 1985/1989, Piatetski-Shapiro–Rallis (8.3), Roberts–Schmidt 2006/2007 (7.3, 10.3, 10.4), Gritsenko 1995 (9.6), Ikeda 2001 and Kohnen 2002 (9.7), Miyawaki 1992, Heim 2012 (9.8), Brumer–Kramer 2014/2019, Brumer–Pacetti–Poor–Tornaría–Voight–Yuen 2019 (10.6), Eichler–Zagier 1985 (the 1983 preprint `ez1983` is cached), Maass 1964/1972/1979, Cohen 1975, Deligne 1974, Rankin 1939. Looked for in the sources cache and in `sources.toml`; this review edits no manifest.
- **LMFDB:** knowls and table columns (11.1–11.4, 6.8's `dimensions.py`) were not fetched.
- **Build at main's pins:** not run; the shared lake directory at `2fd255d9` has no Tau Ceti object files (`scratch/signatures.md`), and no other Lean command is allowed here.

## Source issues

- **Misprint** in vdg at Definition 4.1, p. 10: the source says a half-integral matrix lies in `GL(g, ℚ)`; it should be any symmetric rational matrix, since its expansions and `Φ` use singular ones such as `0`; affects nothing.
- **Error** in vdg at §8, p. 18 (line 818): the source says `E₁₂ − E₆²` is a cusp form of weight 12 on `Γ₂`; it should be `441E₄³ + 250E₆² − 691E₁₂`, since `Φ(ψ₁₂ − ψ₆²) = E₁₂ − E₆² ≠ 0` (`q`-coefficients `65520/691` and `−1008`); affects nothing.
- **Error** in vdg at Conjecture 21.3, p. 40 (lines 1947–1952): the source says `k − n` even; it should be `k ≡ n + r mod 2`, as Ikeda's theorem and his own example `F₁₂` (`k = 10`, `n = r = 1`) require; affects a stated result (the conjecture's hypothesis).
