# Review of SiegelModularForms (pull request #1714 at 21d0b93)

**Verdict:** needs changes

Gate at 21d0b93: every counter 0, `build=0`, OK. Dependency check (run by me on this head): `depcheck: 204 roadmaps, 1545 edges, 0 problem(s)`, no UPWARD or CYCLE line. Elaboration of `TauCetiRoadmap/SiegelModularForms/Suggested.lean` with `lake env lean`: 83 warnings, all `declaration uses sorry`, nothing else. This is a full review of the repaired head; the status of each finding of the previous review is under *Verified sound*, and every statement reviewed is in the adversarial table there.

## R01 (P2) — 5.3 defines "pluriharmonic" with the sum over the wrong index; the section's own acceptance example fails it

Location: `TauCetiRoadmap/SiegelModularForms/README.md` line 1150–1151 (5.3): "pluriharmonic (`∑_t ∂²P/∂X_{it}∂X_{jt} = 0` for all `i, j`; the knowl's definition)", for `P` a polynomial in the `m × g` matrix variable `X`.

Claim: with `X_{it}` indexed by row `i ∈ {1..m}` and column `t ∈ {1..g}`, the condition sums over the `g` columns for each pair of rows.

Witness: Ibukiyama's `P_ν(x, y) = (x, a)^{6−ν} (y, a)^ν`, `a = (2, i, i, i, i, 0, …, 0)`, the generator of `S_{8,6}(Γ₂)` named four lines later (and at `vdg line 2304–2308`). Columns `x, y ∈ ℂ¹⁶`. The README's sum at rows `i = j = 1`, `ν = 0`: `∂²P₀/∂x₁² + ∂²P₀/∂y₁² = 30 a₁² (x, a)⁴ = 120 (x, a)⁴ ≠ 0`. Freitag's condition, `∑_{t=1}^{m} ∂²P/∂X_{ti}∂X_{tj} = 0` for all columns `i, j ∈ {1..g}`, gives `30 (a, a) (x, a)⁴ = 0` for `(i, j) = (1, 1)` since `(a, a) = 4 − 4 = 0`, and `0` for the other two pairs. So the roadmap's definition excludes the polynomial it then calls pluriharmonic. The LMFDB knowl `mf.siegel.theta_series` has the same transposed sum (and an undefined bound `n`), see *Source issues*: the README copied a misprint.

Repair: define pluriharmonic as "`∑_{t=1}^{m} ∂²P/∂X_{ti}∂X_{tj} = 0` for all `1 ≤ i, j ≤ g` (the Laplacians and mixed Laplacians in the `m`-dimensional quadratic space, one for each pair of columns)", cite Freitag, Chapter I, not the knowl, and add the Check "for Ibukiyama's `P₀ = (x, a)⁶` the column sum at `i = j = 1` is `120 (x, a)⁴`, the row sum is `30 (a, a)(x, a)⁴ = 0`: only the row sum makes `P₀` pluriharmonic".

## R02 (P2) — 5.3's cuspidality claim "for `ρ` nontrivial" lacks the hypothesis `λ_g(ρ) ≥ 1`

Location: README lines 1156–1158: "the same transformation law as 5.2 with weight `det^{m/2} ⊗ ρ`, and that for `ρ` nontrivial the result is a cusp form".

Claim: `θ_{L,P}^{(g)}` is a cusp form whenever `P` is pluriharmonic and homogeneous of a nontrivial weight `ρ`.

Witness: `Φ(θ_{L,P}^{(2)})(τ') = lim_{t→∞} ∑_{v₁,v₂} P(v₁, v₂) e^{πi(v₁,v₁)τ'} e^{−πt(v₂,v₂)} = ∑_{v₁} P(v₁, 0) e^{πi(v₁,v₁)τ'}`, the degree-one theta series of `P(·, 0)`. Take `L = E₈`, `P(X) = ((x, a)X₀ + (y, a)X₁)^8` with `a` isotropic: `P` is pluriharmonic (every second derivative carries `(a, a) = 0`), homogeneous of weight `Sym⁸`, and `Φ θ_{E₈,P} = θ^{(1)}_{E₈,(x,a)^8} · X₀^8`, whose `q`-coefficient is `∑_{roots r} (r, a)^8`. The `240` roots of `E₈` are a spherical `7`-design and not an `8`-design, so this sum is nonzero for a suitable isotropic `a`, and `Φ θ_{E₈,P} = c Δ X₀^8 ≠ 0`: a form in `M_{4,8}(Γ₂)` that is not cuspidal although `ρ = Sym⁸` is nontrivial. The condition that makes the argument work is `P(X) = 0` whenever a column of `X` vanishes, i.e. `ρ(diag(1, …, 1, t)) → 0` as `t → 0`, i.e. `λ_g(ρ) ≥ 1`. Ibukiyama's `F ∈ S_{8,6}` (`ρ = Sym⁶`, `λ₂ = 0`) is cuspidal for a different reason: `Φ F ∈ S_{14}(SL₂(ℤ)) = 0`.

Repair: replace "for `ρ` nontrivial" by "when the highest weight of `ρ` has `λ_g ≥ 1` (for scalar `det^ν`: `ν ≥ 1`; equivalently `P` vanishes on matrices with a zero column)", add the `E₈` instance above as a negative-control Check, and say that Ibukiyama's `F` is cuspidal because `S_{14}(SL₂(ℤ)) = 0`.

## R03 (P2) — 6.5 calls the `S₆`-isotypic generating functions theorems; the source proves them only conditionally, and the README does not state them

Location: README lines 1376–1381 (6.5): "State the generating functions `∑_k m_λ(k, j) t^k` for `j ∈ {0, 2, …, 16}` as rational functions (Cléry–van der Geer–Grushevsky 2015; Bergström–Faber–van der Geer 2008) — the stored rational functions of the LMFDB's `smf_dims` table are the certificate against which the statements are checked, so each `(λ, j)` is a theorem whose proof is the comparison of two rational functions."

Claim: for every partition `λ ⊢ 6` and every listed `j`, the isotypic multiplicity generating function is a theorem.

Witness: `cvdgg2015 lines 966–967`: the `S₆`-representation on `S_{j,k}(Γ[2])` is computed "assuming the conjectures" of Bergström–Faber–van der Geer (their Conjectures 6.2, 7.1, 7.4, 7.6 on the endoscopic and lift contributions, `bfvdg2008 lines 373–424`). What Cléry–van der Geer–Grushevsky prove unconditionally are the total dimensions: Theorem 12.1 and 12.3 for `Γ[2]` (`cvdgg2015 lines 934–960`, e.g. `dim M_{0,k}(Γ[2]) = (k+1)(k²+2k+12)/12` for even `k`: `1, 5, 15` at `k = 0, 2, 4`, the values 6.5's own Checks use) and Theorem 14.1 for `Γ₁[2]`, `Γ₀[2]` via the holomorphic Lefschetz formula (`lines 1029–1031, 1036`), plus the module structures of Theorems 20.2, 21.1, 22.1, 22.4, 23.1. A database table is not a proof, and the README writes down none of the rational functions it calls targets.

Repair: state as targets the unconditional formulas (Theorems 12.1, 12.3, 14.1 of Cléry–van der Geer–Grushevsky, written out, with the Check `1, 5, 15`), state the `S₆`-isotypic refinement for `(λ, j)` as a named hypothesis (the Bergström–Faber–van der Geer conjectures) except where the module theorems 20.2–23.1 determine it, and record the LMFDB's isotypic columns as conditional on that hypothesis.

## R04 (P2) — Satoh's theorem is statable at the pins but absent from `Suggested.lean`; the docstring's reason does not apply to it

Location: `Suggested.lean` lines 34–36 (module docstring): "Satoh's theorem, Tsushima's formula, Igusa's `Γ₂(2)` ring and the `Γ₀(2)`, `Γ₀(3)`, `Γ₀(4)` rings … (6.4–6.9): forms with a character and the structure of modules over a polynomial ring in theta constants"; README 6.4 line 1340: "Prove **Satoh's theorem**".

Claim: Satoh's theorem is not statable at the pins.

Witness: the file already states Igusa's Hilbert-series consequence as `finrank_eq_igusaDim` (line 1162) with `igusaDim` a solution count. Satoh's theorem involves no character and no theta constant; its dimension consequence `dim M_{k,2}(Γ₂) = ` coefficient of `t^k` in `(t¹⁰ + t¹⁴ + t¹⁶)/((1−t⁴)(1−t⁶)(1−t¹⁰)(1−t¹²)) + (t¹⁶ + t¹⁸ + t²²)/((1−t⁶)(1−t¹⁰)(1−t¹²))` is statable on the file's own carriers (`rho k 2`, `Module.finrank`, a `Set.ncard` of two solution sets), exactly as `finrank_eq_igusaDim`; the bracket decomposition itself is statable too, since `normDeriv` (line 1117) is already in the file. Values to pin the statement: `1, 0, 2, 3, 3, 4, 7` at `k = 10, …, 22` (recomputed, table below).

Repair: add `satohDim k` (the two solution counts) and `theorem finrank_rho_two (k : ℕ) (hk : Even k) : Module.finrank ℂ (SiegelModularForm (Gamma 2) (rho k 2)) = satohDim k := sorry`; remove Satoh's theorem from the not-statable list (Tsushima's formula and the level-2, 3, 4 rings may stay there, with their real reasons: the principal congruence subgroup `Γ₂(2)` and the characters are not in the file).

## R05 (P3) — 9.7's Kohnen exponent disagrees with the only readable source

Location: README lines 2126–2127 (9.7): "Kohnen's formula `a(T) = ∑_{a ∣ f_T} a^{k+n−1} φ(a, T) c(|D_T|/a²)` … `φ(a, T)` is Kohnen's integer-valued function, whose values are not restated here".

Witness: `vdg line 1929` quotes Kohnen's formula with `a^{k−1}`, `k` the `k` of `f ∈ S_{2k}`, the lift in `S_{k+g}(Γ_{2g})` (`vdg lines 1921–1922`). At `n = 1` the lift is the Maass lift of weight `k + 1`, whose coefficient formula (9.3) has `d^{(k+1)−1} = d^k`: van der Geer's exponent needs `φ(a, T) = a` there, the README's needs `φ(a, T) = 1`. Only one can be Kohnen's `φ`. Kohnen 2002 is paywalled (Springer; recorded `uncertified`), so the README's exponent has no readable source and contradicts the one it has.

Repair: write `a^{k−1}` as van der Geer quotes it, or cite the page of Kohnen 2002 that fixes the exponent and the normalization of `φ` (the previous review's R13 asked for exactly this).

## R06 (P3) — A non sequitur in Layer 1's Examples

Location: README line 677: "`ρ_{k,j}(−1) = (−1)^j`, so `M_{k,j}(Γ₂) = 0` for odd `j` and `M_k(Γ₂) = 0` for odd `k < 35`".

Witness: `det^k(−1₂) = 1` for every `k`, so the parity lemma says nothing about odd scalar weight in degree two; `M_k(Γ₂) = 0` for odd `k < 35` is Igusa's theorem (6.3), as 6.3's Checks correctly say.

Repair: "`ρ_{k,j}(−1) = (−1)^j`, so `M_{k,j}(Γ₂) = 0` for odd `j` (1.3); `M_k(Γ₂) = 0` for odd `k < 35` by 6.3" (the worked example at line 2576 already separates the two).

## R07 (P3) — Checks that name Lean counterparts

Location: README line 670 (1.3 Check: "the Lean hypothesis is the latter"), line 2048 (9.4 Check: "`Suggested.lean` states the Maass space as the submodule `maassSubmodule k` …"), line 2084 (9.5 Check: "is the statement `saito_kurokawa` of `Suggested.lean`").

Witness: the house rule for Checks is that a Check never names or claims a Lean counterpart; these three do.

Repair: move the three sentences into the prose of their subsections (where backticked names of this roadmap's own are allowed) and keep the Checks mathematical.

## R08 (P3) — Process remark in the Lean docstring

Location: `Suggested.lean` lines 42–43: "the Jacobi carrier of `MetaplecticAutomorphicForms` 6.18 and the sibling `HalfIntegralWeightModularForms` 6.1–6.4, which are pull requests".

Witness: the reason the carrier is missing is permanent, not a matter of review status: `Suggested.lean` imports only Mathlib and `TauCeti.*` modules, never another roadmap's. "which are pull requests" is a process remark.

Repair: "which `Suggested.lean` cannot import (no roadmap module is importable here)".

## R09 (P3) — Non-headline sorried declarations in `Suggested.lean`

Location: `Suggested.lean` line 876 `exists_eq_const` (`M_0(Γ) = ℂ`), line 880 `eq_zero_of_neg` (`M_k = 0` for `k < 0`), line 1013 `summable_siegelTheta` (used by no definition and no headline), line 1194 `cosetReps_spec` (the defining property of `Quotient.out`).

Witness: the one-tactic probe on a scratch copy closed none of the nine candidates I tried (`isMaassForm_zero`, `isCuspForm_zero`, `holomorphic_const`, `act_one`, `rhoFun_one`, `IsMaassForm.smul`, `IsCuspForm.smul`, `cosetReps_spec`, `scalar_eq_zero_of_odd`), so nothing is one-tactic padding. The four listed are degenerate-case corollaries of `koecher`, an unused summability lemma, and a restatement of a definition.

Repair: delete the four from `Suggested.lean` (the README keeps each as an API bullet or Check); the proof obligations of definitions (`holomorphic_const`, `act_one`, `rhoFun_one`, `IsCuspForm.add`, …) stay, since the definitions need them.

## R10 (P3) — No `sources.toml`

Location: `TauCetiRoadmap/SiegelModularForms/` (contents: `README.md`, `Suggested.lean`, `metadata.toml`).

Witness: the References section cites about forty works, roughly half of them paywalled (Kohnen 2002, Roberts–Schmidt 2007, Ibukiyama 1985/1991/2007/2012, Igusa 1962–1967, Tsuyumine 1986, Andrianov 1974, Freitag 1983, Klingen 1990, Satoh 1986, Tsushima 1983, Aoki–Ibukiyama 2005, Hayashida–Ibukiyama 2005, Poor–Yuen 2007, Ikeda 2001/2006, Miyawaki 1992, Weissauer 2009, Mizumoto 1991, Cohen 1975, Maass 1979, Eichler–Zagier 1985, Böcherer 1985), and none is recorded, so none is marked `uncertified` and the open ones (`vdg`, `pooryuen2015`, `brumerkramer2014`, `bppvty2019`, `cvdgg2015`, `bfvdg2008`) have no recorded locators.

Repair: add `sources.toml` (schema `tauceti-roadmap-sources/v1`) with one key per work, the open ones with their arXiv ids and the paywalled ones as `uncertified` with DOI and locator.

## Verified sound

**Previous review, finding by finding.** R01 (module file): repaired — `module`, `public import Mathlib` and five `public import TauCeti.*`, `@[expose] public section`; gate `build=0`. R02 (parity lemma): repaired — `eq_zero_of_neg_one_mem` now takes `hρ : ∀ v, ρ.rep (-1) v = v → v = 0` (line 682), the README states the fixed-vector form and carries the `det⁰ ⊕ det¹` negative control (lines 655–671). R03 (rank `2g`): repaired — 8.3 and 8.4 say rank `2k`, with the `I(Δ)` Check (lines 1837–1849). R04 (Miyawaki parity): repaired — `k ≡ n + r mod 2` with the `k = 10, 11` Checks (lines 2160–2180). R05 (sorry in statements): repaired — `HalfIntegral.zero`, `appendZero` (real bodies, four proved fields) and `transposeGL` replace the sorried terms; `grep` finds no `sorry` outside `:= sorry` positions. R06 (Saito–Kurokawa): repaired — `saito_kurokawa` (line 1395) and `finrank_maassSubmodule`, `finrank_maassSubmodule_inf_cusp` on the real-bodied `maassSubmodule`. R07 (branch point): repaired — `(2 + i)·1₃` with the arguments `−1.661`, `1.481`. R08 (discriminant): repaired — `2¹⁰ · 3² · 63737521`, which I recomputed (table). R09.1–R09.6 (supplier drift): all six repaired — ShimuraCompactifications 2.8/7.16 (both headings exist at the open head, its lines 1339, 2577), IntegralLattices 6D (`D₁₆⁺`, its line 1661), half-integral weight Siegel forms declared unowned (lines 74–80), Calegari–Chidambaram–Ghitza attribution dropped and Brumer–Kramer §8 cited (`brumerkramer2014 lines 2233–2247` confirm), HyperellipticCurves 5.3/5.6 and AbelianVarietiesOverFiniteFields 1.3 named (headings exist at their heads, lines 1397/1450 and 401), the Tau Ceti theta-module claim replaced by "the pinned Tau Ceti has no theta-series module". R10 (shape): repaired — house headings, `*Needs:*` lines (depcheck reads 1545 edges, 0 problems), `**Checks.**` under every definition I read, `### Examples` and `### Dependencies` closing every layer, no `references/` remark. R11 (padding, docstring): largely repaired — 216 declarations instead of 286, the value computations, `Family`/`LabelPrefix`/`EigenformType` catalogue and the `rfl`/`simp` lemmas are gone, the docstring is in the house form; the residue is R09 above. R12 (Deligne bound): repaired — 8.3 names Deligne's and Rankin's bounds and says Hecke's does not suffice. R13 (Kohnen gloss): changed, not repaired — see R05.

**Gate, tooling, order.** Gate OK on 21d0b93; `git diff --stat origin/main...HEAD` outside the folder is empty; `metadata.toml` is the one line `topic = "math.NT"`. Depcheck: `204 roadmaps, 1545 edges, 0 problem(s)`. SiegelModularForms is at position 369 of the merge order, after LFunctions (23), PELModuli (100), MetaplecticAutomorphicForms (134), ShimuraCompactifications (144), AutomorphicBundles (164), ClassicalGroupsPartII (186) and QSeriesPartitionsAndMockModularForms (232); ModularForms, ThetaSeries, IntegralLattices are on main; HalfIntegralWeightModularForms (#1721), LatticePackingsAndPerfectForms (#1723), HyperellipticCurves (#1707), AbelianVarietiesOverFiniteFields (#1720) are new-folder pull requests whose heads I read. HalfIntegralWeightModularForms names this roadmap only as the consumer of its Layer 6 (its lines 55, 1100, 1147, 1170, 1253): no cycle. Ownership by object: MetaplecticAutomorphicForms 8.10–8.12 builds the degree-two space and similitude action; this roadmap builds the degree-`g` carrier and states the `g = 2` identification in 0.3 and the supplier contract, which is why it is the owner. Ownership against open pull requests whose files the brief does not give was not checked.

**Cross-roadmap citations resolved at the cited heads or on main.** ModularForms Layers 2, 3, 4, 7 (headings at its lines 383, 481, 532, 708) and the Satake pair at its line 980; ThetaSeries Layer 1 (`poissonSummation`, `gaussian`, `fourier_gaussian`, lines 126–127), Layer 2 with 2E `level` (line 533), `IsIntegral`/`IsEven` (204, 222), Layer 3 `thetaSeries` (591), Layers 5 and 7 (673, 854), 6F `χ_L` (830, 846); IntegralLattices Layer 2 and 6D; LFunctions Layer 0 `AnalyticLFunctionData` (line 348); ClassicalGroupsPartII CG.0.1 (#1492 line 318); MetaplecticAutomorphicForms 6.18 `jacobiSpace` (line 1769), 6.20 `jacobi_thetaDecomposition` (1805), 8.10–8.12 (2491–2522), 8.18–8.19 (2609, 2625), 8.76–8.80 (3309–3374); QSeriesPartitionsAndMockModularForms §9.1 (#1391 line 1358; its `θ_{m,l}` with exponent `πin²τ/(2m) + 2πinz` equals 9.2's `e(r²τ/(4m) + rz)`); HalfIntegralWeightModularForms 6.1–6.4 (#1721 lines 1080–1158); LatticePackingsAndPerfectForms 5.6 (#1723 line 813); PELModuli M5 `siegelModuli`, M6 `siegelStack` (#966 lines 46–47); ShimuraCompactifications 2.8, 7.16; HyperellipticCurves 5.3, 5.6; AbelianVarietiesOverFiniteFields 1.3.

**Library declarations opened at the pins.** `HeckeRing.GL2.Newform` (`TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean` line 104: extends `EigenformAwayFromLevel`, fields `isNew` and `isNorm : (qExpansion 1 toCuspForm).coeff 1 = 1`), so `saito_kurokawa`'s `(qExpansion 1 f.toCuspForm).coeff p` is `a_p` of a normalized form; `TauCeti.GLSymplectic`, `mem_iff`, `mem_iff_mem_symplecticGroup`, `symJ`, `map`, `leviHom`, `det_eq_of_transpose_mul_J_mul_eq_smul`, `SymplecticGroup.fromBlocks_upper_mem`, `inv_eq_symplectic_inv`, `Matrix.map_J`, `mkOfDetNeZero`, `IsHeckeTriple`, `QuotientGroup.rightRel`, `IsOpenEmbedding.singletonChartedSpace`, `ZLattice.covolume`, `LinearMap.BilinForm.dualSubmodule`, `MvPolynomial.IsWeightedHomogeneous`, `AlgebraicIndependent`: each elaborates in the file as used (the build is the witness). Not at the pin and correctly not cited: a theta-series module.

**Lean form.** Single `public import Mathlib`, five `TauCeti.*` modules that exist at the pin, no `set_option`, no `lemma`, no `#eval`/`#print`, no sorried `def`/`instance`, no `sorry` inside a statement. The five lost-binder leads of the signatures file are unused instance binders: `extendZero` and `phi` lose `[NormedSpace ℂ V]`/`[FiniteDimensional ℂ V]`, `fourierCoeff` loses `[FiniteDimensional ℂ V]`, `gram` and `siegelTheta` lose `[FiniteDimensional ℝ E]`; none of these types needs the instance, so nothing is lost. Elaborated types compared with the README for every headline and every declaration a finding touches (`mem_paramodular_iff` entry set, `heckeDiag`, `coeffTriple_heckeT`, `spinorEulerFactor`, `maassCoeff`, `IsMaassForm`, `saito_kurokawa`, `siegelTheta_symJ_smul`, `thetaConstant`, `eq_zero_of_neg_one_mem`, `relindex_gamma0_prime`, `igusa_odd`, `finrank_eq_igusaDim`): agreement, see the table.

**Headline theorems** (README) and their status in `Suggested.lean`: Koecher (`koecher`, `bounded_of_invariant`, `ofInvariant`), Fourier expansion and uniqueness (`hasSum_fourier`, `fourierCoeff_eq_zero_of_hasSum`, `fourierCoeff_conj`), finite dimensionality and the Sturm-type bound (`finiteDimensional`, `eq_zero_of_fourierCoeff_eq_zero`), `Φ` and cusp forms (`phi_mem`, `fourierCoeff_phi`, `phi_rho`, `isCuspForm_iff_fourierCoeff`), Siegel Eisenstein series (`siegelEisensteinFun_mem`, `fourierCoeff_siegelEisenstein_zero`, `phi_siegelEisenstein`, `eigenvalue_siegelEisenstein`), theta series (`fourierCoeff_siegelTheta`, `siegelTheta_mem`, `siegelTheta_symJ_smul`), theta constants (`thetaConstant_eq_zero_iff`, `card_evenChar`), Igusa (`chi10_isCuspForm`, `chi12_isCuspForm`, `wronskian_mem`, `igusa_even`, `igusa_odd`, `igusaGenerators_algebraicIndependent`, `finrank_eq_igusaDim`), Hecke theory (`isHeckeTriple_gamma`, `card_cosetReps_two`, `heckeT_sq`, `heckeT_comm`, `heckeT_mul_of_coprime`, `isCuspForm_heckeT`, `heckeT_one_eq`, `exists_eigenform_basis`, `coeffTriple_heckeT`), the Maass space and Saito–Kurokawa (`finrank_maassSubmodule`, `finrank_maassSubmodule_inf_cusp`, `saito_kurokawa`), Poor–Yuen (`finrank_cusp_277`), paramodular groups (`mem_paramodular_iff`, `relindex_paramodular_inf_gamma`), coefficient fields (`eigenvalue_isIntegral`, `finiteDimensional_coefficientField`). Named as not statable in the docstring with a correct reason: Petersson product, Maass–Cohen formula and `E_{k,1}`, Klingen series, odd-rank theta law, Satake isomorphism and `L`-functions, Fourier–Jacobi and Jacobi-side statements, Ikeda and Miyawaki lifts, paramodular Hecke operators, newforms and the conjecture. Statable but absent: Satoh's theorem (R04).

**Sources read at the locators** (all through the sources service). `vdg` = arXiv:math/0605346v2: fundamental domain and Minkowski reduction (lines 224–231: the three conditions and `hᵀyh ≥ y_kk`, `y_{k,k+1} ≥ 0`, as 3.3 states), Definition 3.2 (373–377), formula (4) `a(uᵀnu) = ρ(uᵀ)a(n)` (436), Corollary 4.2 `kg ≡ 1 mod 2` (439–440), Theorem 4.3 (442–443), Theorem 6.2 `2λ_g < g` (614–616), harmonic theta series (671–690), Fourier–Jacobi rules for `g = 2` and general `r` (726–760; 9.1 restates them), Theorem 9.1 with `R` on Igusa [52] p. 849 (858–862), Ikeda's lift with `g ≡ k mod 2` and the `β` parameters (1907–1920), Kohnen's formula (1921–1930), Miyawaki's observation and Conjecture 21.3 (1941–1952), §25: `(j, k)` notation, `Φ : M_{j,k} → S_{j+k}` surjective for `j > 0, k > 4` (Arakawa), Satoh's bracket, the `S_{j,k}` table (2225–2273), Ibukiyama's `F ∈ S_{6,8}` with its lattice, `a` and `P_ν` (2299–2309). `pooryuen2015` = arXiv:0912.0049v1: Theorems 1.2–1.4 (64–74), §3 with Theorem 3.1 (`p ≥ 5`) and Table 1 (`0, 0, 0, 1, 1, 2, 2, 3, 3, …` for `p = 2, …, 23, …`) (231–239), the Euler factors `Q₂, Q₃, Q₅` of `f` (2179–2182), the curve `y² + y = x⁵ + 5x⁴ + 8x³ + 6x² + 2x` of conductor `277` and Theorem 7.3 (2340–2356). `brumerkramer2014` = arXiv:1004.4699v4: Conjecture 1.1 (99–103), §8, Definition 8.1 and Conjecture 8.2 with the Calegari credit (2232–2247). `cvdgg2015` = arXiv:1306.6018v2 and `bfvdg2008` = arXiv:0803.0917v2 as quoted in R03. LMFDB knowl `mf.siegel.theta_series` (read for R01).

**Adversarial table.** Values recomputed by hand or by the scratch scripts `numerics2.py` (point counts) and `numerics3.py` (`T₂` on `S₃₈`); the Cohen values `H(3, 3) = −2/9`, `H(3, 4) = −1/2` are taken from the README's Checks (verified numerically by the previous review) and everything downstream of them is recomputed.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 0.2 `det M = μ^g`, rejection of `diag(1_g, −1_g)` | `c·1`, `diag(1,1,−1,−1)` | `μ(c·1) = c²`; `diag(1,1,−1,−1)`: `μ = −1`, `det = 1 = μ²` | sound (positivity of `μ`, not `det`) | none |
| 0.6 orders and indices | `g = 2`, `p = 2, 3` | `2⁴·3·15 = 720`, `3⁴·8·80 = 51840`; `(1+p)(1+p²) = 15, 40` | sound | none |
| 0.7 `K(N)` entrywise shape | `γL ⊆ L`, `γ⁻¹L ⊆ L` with `γ⁻¹ = (Dᵀ, −Bᵀ; −Cᵀ, Aᵀ)` | `(1,2),(3,2),(4,1),(4,2),(4,3) ∈ Nℤ`, `(2,4) ∈ N⁻¹ℤ`, `(1,4),(3,4) ∈ ℤ` | sound; = `mem_paramodular_iff` | none |
| 0.7 `[Γ₂ : K(p) ∩ Γ₂]` | `p = 2, 3` | hyperplanes of `𝔽_p⁴`: `15`, `40` | sound | none |
| 0.7 Fricke `μ_N` | `A_N = [[0,√N],[1/√N,0]]` | `A_N² = 1`, `det = −1`, `A_N⁻ᵀ = A_Nᵀ`; `fricke` = `leviHom A_N = diag(A_N, A_Nᵀ)` | sound | none |
| 1.1 `ρ_{k,j}(−1)`, `e(ρ)` | `A = −1`, `(k,j) = (8,6)` | `det(−1)^k(−1)^j = (−1)^j`; `2k + j − 3 = 19` | sound | none |
| 1.3 parity lemma, Lean form | `ρ = det⁰ ⊕ det¹`, `f ≡ (1,0)` | `ρ(−1) = diag(1,−1)` fixes `(1,0) ≠ 0`; hypothesis "no nonzero fixed vector" excludes the instance | sound (R02 of r1 repaired) | none |
| 1.3 Examples "so `M_k(Γ₂) = 0` for odd `k < 35`" | `g = 2`, `ρ = det^k` | `det^k(−1₂) = 1`: parity gives nothing; vanishing is 6.3 | **non sequitur** | R06 |
| 2.1 content | `(2,2,2)` | gcd of `2T` entries and diagonal `= 2`; gcd of `T` entries `= 1` | sound | none |
| 2.2 equivariance | `U = diag(1,−1)`, `χ₃₅` | `a(2,−1,3) = −a(2,1,3)` | sound; Lean `fourierCoeff_conj` uses `ρ(Uᵀ)` as `vdg (4)` | none |
| 2.6 singular forms | `θ_{E₈}^{(g)}`, `k = 4` | singular iff `8 < g`; rank `≤ 8` | sound (`vdg 614–616`) | none |
| 3.3 Minkowski reduction | `Y = [[1,0.6],[0.6,1]]`, `[[1,0.4],[0.4,1]]` | `2y₁₂ = 1.2 > 1`; `0.8 ≤ 1` | sound (`vdg 229–230`) | none |
| 4.1 convergence bound | `g = 1`, `k = 2` | `k = g + 1` not absolutely convergent | sound | none |
| 4.2 Maass–Cohen | `k = 4`: `(1,1,1)`, `(1,0,1)`, `(1,2,1)` | `2·(−2/9)/((1/120)(−1/252)) = 13440`; `2·(−1/2)/(−1/30240) = 30240`; `N = 0`: `240·σ₃(1) = 240` | sound | none |
| 4.3 Klingen decomposition | `k = 4, 12` | `M_4 = ℂψ₄`; `3 = 1 + 1 + 1` | sound | none |
| 5.1 diagonal restriction | `ψ₄` at `q₁q₂` | `30240 + 2·13440 + 2·240 = 57600 = 240²` | sound | none |
| 5.2 `J`-law normalization | `g = 1`, `L = cℤ` | Poisson: `θ_L(−1/τ) = c⁻¹(τ/i)^{1/2}θ_{L^∨}(τ)` = README with `m = 1`, `covol = c` | sound; Lean `siegelTheta_symJ_smul` even rank | none |
| 5.2 characters | `A₂`, `D₈` | `(−3/·)`; `(4/·)` trivial on odd `d` | sound | none |
| 5.3 pluriharmonic | Ibukiyama `P₀ = (x,a)⁶`, `a = (2,i,i,i,i,0,…)` | column sum at `i=j=1`: `120(x,a)⁴`; row sum: `30(a,a)(x,a)⁴ = 0` | **definition excludes its example** | R01 |
| 5.3 cuspidality | `E₈`, `P = ((x,a)X₀ + (y,a)X₁)⁸` | `Φθ = θ^{(1)}_{E₈,(x,a)⁸}X₀⁸ = cΔX₀⁸`, `c ≠ 0` (roots are a 7-, not 8-design) | **missing hypothesis `λ_g ≥ 1`** | R02 |
| 5.4 even characteristics, `χ₅²` | `g = 1,2,3`; `(1,1,1)`, `(1,0,1)` | `2^{g−1}(2^g+1) = 3, 10, 36`; `2¹²·1 = 4096`, `2¹²·(−2) = −8192` | sound | none |
| 5.4 `g = 1` comparison | `θ_{(0,1)}` | `∑ e^{πin}e^{πin²τ} = jacobiTheta₂ (1/2) τ` | sound | none |
| 6.1 cuspidality of the combinations | `q`-coefficients | `240 − 504 + 264 = 0`; `441·720 + 250·(−1008) − 65520 = 0` | sound | none |
| 6.1 Witt restriction | `χ₁₂` at `q₁q₂` | `10 + 2·1 = 12` | sound | none |
| 6.3 Hilbert series | `k = 0,…,24`; `35, 37, 39` | `1,0,1,1,1,2,3,2,4,4,5,6,8`; `S_k = M_k − 1 − dim S_k(Γ₁)`: `…,3` at `20`; `1, 0, 1` | sound; `igusaDim` matches | none |
| 6.4 Satoh | `k = 10,…,22` | `M_{k,2}: 1,0,2,3,3,4,7`; `S_{k,2} = M_{k,2} − dim S_{k+2}(Γ₁): 0,0,1,2,2,3,5`; `vdg 2262–2264` table agrees | sound; statable | R04 |
| 6.5 quotients and dimensions | `Γ₂/Γ₂(2)`, parabolic, unipotent | `720`; `6·8 = 48`; `8`; `6`; `dim M_4(Γ₂(2)) = C(6,2) = 15 = (5·36)/12` (`cvdgg2015 941`) | sound | none |
| 6.5 isotypic generating functions | `cvdgg2015 966–967, 1029–1031` | computed "assuming the conjectures of [4]"; totals unconditional | **overclaim; targets unstated** | R03 |
| 6.6 theta expansions | `θ_{E₆}, θ_{A₂}³, θ_{E₆*}` to `q³` | `β₃: 0, −108, −324, −972`; `δ₃: −8, 72, −216`; relation: `0, 0, 0, 720 − 936 + 216 = 0` | sound | none |
| 6.6 dimensions from the stated ring | `k = 0,…,8`; odd `1,3,5,7` | monomials: `1,0,1,0,4,0,7,0,10`; `1,3,4,9`; first odd `15` | consistent | none |
| 6.7, 6.8 Hilbert series | `k = 0,…,8` | `1,1,3,4,7`; `1,3,7,14,24` (`6+1`, `10+1+3`, `15+3+6`); `ψ₄`-module `0,1,4` | consistent | none |
| 6.9 Tsuyumine | `k = 4,…,20` | `1,1,1,2,4,3,7,8,11`; minus `dim M_k(Γ₂)`: `0,0,0,0,1,1,3,4,6` | consistent | none |
| 7.1 coset counts | `p = 2, 3`; symbolic | `(p+1)(p²+1)(p³+p)+1 = p⁶+p⁵+2p⁴+2p³+p²+p+1` = `X²`-coefficient of `(1−p²X²)/∏_{i≤3}(1−p^iX)`: `151, 1201`; `T₀`: Lagrangians lift `p³`-to-one, `p³(p+1)(p²+1)` | sound | none |
| 7.4 `T(p)² = T₀ + (p+1)T₁ + (p³+p²+p+1)T₂` | degrees | `(p³+p²+p+1)² − p³(p+1)(p²+1) − (p³+p²+p+1) = p(p+1)²(p²+1) = (p+1)·deg T₁` | sound | none |
| 7.4 Eisenstein eigenvalues, relation | `ψ₄` at `2, 3`; `ψ₆` at `2` | `9·5 = 45`, `28·10 = 280`, `33·17 = 561`; `α₀²α₁α₂ = p^{2k−3}` | sound | none |
| 7.4 `T₂(p²)` scalar | `g = 2`, `det^k` | `p^{2(2k−3)}p^{−2k} = p^{2k−6}`; `p^{−3}·p^{2k−3}` | sound | none |
| 7.5 representatives | `U = [[p,u],[0,1]]` | `UᵀTU/p = (pn, 2nu + r, (nu²+ru+m)/p)` = `coeffTriple_heckeT` | sound | none |
| 8.1 degree-one standard factor; quartic | `α₁ = β̄/β`; `(k,j)` | `α₁ + α₁⁻¹ = a_p²/p^{k−1} − 2`; coefficients `p^{w−1}, p^w, p^{2w}` with `w = 2k+j−3` | sound | none |
| 8.2 Andrianov identity | `z = p^{−s}` | `∏_p (1 − p^{2k+j−4−2s}) = ζ(2s−2k−j+4)⁻¹` | sound | none |
| 8.3 Hodge types, root number | `(k,j)`, `j` even | `(k−2)+(k+j−1) = w`; `ε_∞ = i^{w+1} i^{j+2} = (−1)^{k+j} = (−1)^k` | sound | none |
| 8.3 standard `L` pole | `I(Δ) ∈ S_8(Γ₄)` | rank `16 = 2k`; `ζ(s)` pole at `1` | sound (R03 of r1 repaired) | none |
| 8.5 analytic parameters | `χ₁₀`, `p = 2` | `2⁸·2^{−17/2} = 2^{−1/2} ≠ 1` | sound | none |
| 9.2 `E_{4,1}` | `c(3), c(4)` | `(−2/9)/(−1/252) = 56`, `(−1/2)/(−1/252) = 126` | sound | none |
| 9.3 Maass lift constants and relation | `k = 4`; `χ₁₀, χ₁₂` at `(2,2,2)` | `−B₄/8 = 1/240`; `−272 + 512 = 240`; `736 + 2048 = 2784` | sound | none |
| 9.4 decomposition | `k = 20, 24` | `5 = 1 + 1 + 2 + 1` (`dim S₃₈ = 2`); `8 = 1 + 2 + 3 + 2` (`dim M₂₄(Γ₂) = 8` by enumeration) | sound | none |
| 9.5 Saito–Kurokawa | `(p^{k−2}, βp^{2−k}, β̄p^{2−k})`; `f₁₈`, `f₂₂` | `λ = a_p + p^{k−1} + p^{k−2}`; `a₂(f₁₈) = −24−504 = −528`, `a₃(f₁₈) = 252 + 12096 − 16632 = −4284`: `240`, `21960`; `a₂(f₂₂) = −288`: `2784` | sound; Lean `saito_kurokawa` matches | none |
| 9.7 Ikeda parameters | `β₀, β_i, β_{n+i}` | `β₀²∏β = p^{2nk−n}` = `p^{∑λ − g(g+1)/2}`; standard factor reproduces `ζ(s)∏L(s+k+n−j, f)` | sound (`vdg 1913–1920`) | none |
| 9.7 Kohnen exponent | `n = 1` | `vdg 1929`: `a^{k−1}φ`, needs `φ = a`; README `a^{k+n−1}φ`, needs `φ = 1` | **disagrees with source** | R05 |
| 9.8 Rankin–Selberg factor; parity | weights `k', l`; `k = 10, 11`, `n = r = 1` | `X²`: `a_f²p^{l−1} + a_g²p^{k'−1} − 2p^{k'+l−2}`; `k ≡ n + r`: `10` in, `11` out | sound (R04 of r1 repaired) | none |
| 10.1 Fricke coefficient law | `k` even plus form | `a(n,r,Nm) = a(m,r,Nn)` | sound | none |
| 10.1 `dim S_4(K(p))` | `p = 2,…,17` | `pooryuen2015 238–239`: `0,0,0,1,1,2,2` | sound | none |
| 10.5 `f₂₇₇` | `Q₂`, `λ(4)` | `pooryuen2015 2180–2182` identical; `λ(4) = 4 − 4 − 1 = −1` | sound | none |
| 10.6 curve `277.a.277.1` | `p = 2,…,31` point counts | `a_p = −2,−1,−1,1,−2,3,−4,−1,3,−1,−10`; `b₂, b₃, b₅ = 4, 1, −2`: `L₂, L₃, L₅` = Poor–Yuen's `Q₂, Q₃, Q₅` | sound (all eleven values) | none |
| 10.6 corrected conjecture | `brumerkramer2014 2243–2247` | `P_N ↔ A_N ∪ B_N`, `L(B) = L(f)²` | sound | none |
| 11.2 `S₃₈` field | `T₂` on `Δ·M₂₆` | char poly `x² + 194400x − 137403408384`, disc `587404993536 = 2¹⁰·3²·63737521` | sound (R08 of r1 repaired) | none |
| Lean `relindex_gamma0_prime`, `card_evenChar`, `igusa_odd` junk values | `g = 0`; odd `k < 35` | empty product `1` = index `1`; `0 < g` hypothesis; `k − 35 = 0`, `P = 0` unique | sound | none |
| Lean `IsHeckeEigenform` over all `p, i` | `p = 0, 1`; `i > g` | `heckeDiag` singular/identity/scalar: still eigen | no vacuity | none |
| Lean `siegelEisensteinFun` well-definedness | `γ ↦ pγ`, `p ∈ P_g` | `det(D'Cτ + D'D) = det D' det(Cτ+D)`, `det D' = ±1`, `k` even | sound | none |
| Lean `maassLift` index set | `n = 0` or `m = 0`, `r ≠ 0` | `4nm − r² < 0`, `c` vanishes there | sound | none |
| One-tactic probe | 9 sorried lemmas with `simp`/`exact` | none closes | no one-tactic padding | R09 lists the degenerate-case ones |

## Not verifiable

- Kohnen 2002 (Math. Ann. 322): paywalled, `uncertified`; the exponent of R05 could not be read in the paper.
- Ikeda 2001 (Annals): JSTOR only; Ibukiyama 1991 (Internat. J. Math.): World Scientific HTTP 403; both recorded in `needs-references.toml`. The statements of 6.6 (Ibukiyama's rings) were checked for internal consistency only; the theta expansions and the linear relation were recomputed.
- Igusa 1962/1964/1967, Tsuyumine 1986, Satoh 1986, Tsushima 1983, Aoki–Ibukiyama 2005, Hayashida–Ibukiyama 2005, Poor–Yuen 2007, Ikeda 2006, Miyawaki 1992, Roberts–Schmidt 2006/2007, Andrianov 1974, Andrianov–Kalinin 1978, Böcherer 1985, Mizumoto 1991, Freitag 1983, Klingen 1990, Eichler–Zagier 1985, Cohen 1975, Maass 1979, Weissauer 2009, Gritsenko 1995, Andrianov–Maloletkin 1975: paywalled or not located; cited by locator. The roadmap has no `sources.toml` (R10), so none is recorded as `uncertified`.
- The LMFDB knowls other than `mf.siegel.theta_series` were not re-read this round.
- Not recomputed: `a(W; (2,1,3)) = 41472`, the `χ₃₅` coefficients `−69`, `69`, the Cohen values `H(3, 3)`, `H(3, 4)`, `H(3, 7)` themselves, the eigenvalues `λ_{χ₁₀}(5)`, `λ_{χ₁₂}(3)`, `λ_{χ₁₂}(5)`, and the Poor–Yuen degree-four dimensions `1, 1, 2, 3, 7`.

## Source issues

- **Error** in LMFDB knowl `mf.siegel.theta_series` at the definition of "pluriharmonic": the source sums the second derivatives over the column index `t = 1..g` for each pair of row indices; it should sum over the row (lattice-coordinate) index `t = 1..m` for each pair of columns `i, j ≤ g`, the condition Ibukiyama's generator of `S_{8,6}` satisfies; affects a stated result (README 5.3).
- **Misprint** in LMFDB knowl `mf.siegel.theta_series` at the same definition: the source quantifies "for each `1 ≤ i, j ≤ n`" with `n` undefined; it should be the matrix size bound (`g` under the corrected definition); affects nothing.
- **Error** in `vdg` at §20, printed page 36 (line 1772): the source says the completed standard `L`-function of a cusp eigenform of weight `k ≥ g` is holomorphic when the form is orthogonal to the theta series of even unimodular lattices of rank `2g`; it should be rank `2k` (the Ikeda lift `I(Δ) ∈ S_8(Γ₄)` is a rank-16 theta combination with the `ζ(s)` pole); affects a stated result (README 8.3, now corrected).
- **Misprint** in `vdg` at Conjecture 21.3, printed page 40 (line 1947): the source requires `k − n` even; it should be `k − n − r` even, so that the Ikeda lift of `f` to degree `2n + 2r` exists (Miyawaki's `F₁₂` has `k = 10`, `n = r = 1`); affects a stated result (README 9.8, now corrected).
