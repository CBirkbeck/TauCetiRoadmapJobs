# Review of SiegelModularForms (pull request #1714 at e43a9fe)

**Verdict:** needs changes

Gate at e43a9fe: FAIL (build=1: the module-system warning on `import Mathlib`; every other counter 0). Dependency check: 0 problems with the README as it stands and 0 problems with every `*Prerequisites:*` line rewritten as `*Needs:*` (1526 and 1531 edges; no UPWARD or CYCLE line). The sampled targets, the headline theorems and every target a finding touches are in the adversarial table under *Verified sound*.

## R01 (P1) — Gate build failure: the file is not a module-system file

Location: `TauCetiRoadmap/SiegelModularForms/Suggested.lean` line 1 (`import Mathlib`).

Claim: the targeted build passes.

Witness: the worker's gate records `build=1 FAIL` with the warning "imports `Mathlib` … designed for use with the module system; consider adding `module`". Every file of the pinned Mathlib and Tau Ceti is a `module` file, so the warning is emitted on every build, and the gate counts every warning other than `declaration uses 'sorry'`.

Repair: write the file as a module-system file: first line `module`, blank line, `public import Mathlib`, `public import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Symplectic.Basic` and the other four Tau Ceti imports with `public import`, then the docstring, `@[expose] public section`, and the namespace as now (the precedent is `TauCetiRoadmap/TypeAHeckeAlgebras/Suggested.lean` on main). No declaration changes; `lake env lean` elaborates `module` files from the roadmap folder.

## R02 (P1) — The Lean parity lemma is false for reducible weights

Location: `Suggested.lean` lines 816–819, `SiegelModularForm.eq_zero_of_neg_one_mem`: "if `−1 ∈ Γ` and `ρ.rep (-1) ≠ LinearMap.id` then `f = 0`"; README line 530, "if `−1 ∈ Γ` and `M_ρ(Γ, ψ) ≠ 0` then `ψ(−1) ρ(−1) = 1`".

Claim: `−1 ∈ Γ` and `ρ(−1) ≠ 1` force `M_ρ(Γ) = 0`.

Witness: `g = 1`, `V = ℂ²`, `ρ = det⁰ ⊕ det¹`, i.e. `ρ(A) = diag(1, det A)`, a holomorphic weight; `Γ = Γ₁ ∋ −1`; `f ≡ (1, 0)`. Then `(f ∣_ρ γ)(τ) = ρ(j(γ,τ))⁻¹ (1, 0) = (1, 0)` for every `γ`, `f` is holomorphic and bounded, so `f ∈ M_ρ(Γ₁)` is nonzero, while `ρ(−1) = diag(1, −1) ≠ 1`. The computation `slash ρ (−1) f τ = ρ(−1) f(τ)` only shows that the values of `f` are fixed by `ρ(−1)`.

Repair: in Lean replace `hρ : ρ.rep (-1) ≠ LinearMap.id` by `hρ : ∀ v : V, ρ.rep (-1) v = v → v = 0` (no nonzero fixed vector; for irreducible `ρ` this is `ρ(−1) ≠ 1`); the two corollaries `scalar_eq_zero_of_odd` and `vector_eq_zero_of_odd` are unaffected (`det^k(−1) = (−1)^{kg}`, `ρ_{k,j}(−1) = (−1)^j` are scalars). In the README state the parity lemma for irreducible `ρ` (van der Geer, Corollary 4.2 is scalar weight) or as "`ψ(−1) ρ(−1)` fixes every value of `f`", and add the direct-sum instance above as a negative-control Check.

## R03 (P1) — The holomorphy clause for the standard `L`-function is false; the roadmap's own Ikeda lift refutes it

Location: README lines 1255–1259 (8.3): "`Δ(s, F)` … for a cusp form with `k ≥ g` is holomorphic except for simple poles at `s = 0, 1`, holomorphic when `F` is orthogonal to the theta series of even unimodular lattices of rank `2g`".

Claim: for `F ∈ S_k(Γ_g)`, `k ≥ g`, orthogonality to the rank-`2g` theta series gives a holomorphic `Δ(s, F)`.

Witness: 9.7 (README line 1548): `I(Δ) ∈ S_8(Γ₄)` is the Ikeda lift with `L(s, I(Δ), st) = ζ(s) ∏_{i=1}^{4} L(s + 9 − i, Δ)`, which has a pole at `s = 1` from `ζ(s)`; here `k = 8 ≥ g = 4`, and rank-`8` even unimodular theta series have weight `4`, so `I(Δ)` is orthogonal to all of them (different weight). The clause asserts holomorphy; 9.7 asserts a pole. The true statement (Böcherer 1985; Mizumoto, Math. Ann. 289 (1991)) is: the pole at `s = 1` occurs exactly when `F` lies in the span of the theta series of even unimodular lattices of rank `2k` (so `k ≡ 0 mod 4`); `I(Δ) = θ_{E₈⊕E₈} − θ_{D₁₆⁺}` is rank `16 = 2k`. The misprint is in the source: `vdg line 1772` says "rank 2g" (see *Source issues*).

Repair: replace "rank `2g`" by "rank `2k` (so `k ≡ 0 mod 4`; for `k ≢ 0 mod 4` the function is holomorphic on `s = 1`)" in 8.3 and in 8.4's polar-divisor line, and add the Check "`I(Δ) ∈ S_8(Γ₄)` is a combination of rank-16 theta series and `L(s, I(Δ), st)` has a simple pole at `s = 1`" to 8.3, pinning the rank.

## R04 (P2) — 9.8's general Miyawaki statement carries the wrong parity hypothesis

Location: README lines 1572–1577: "for `k ≡ n mod 2`, `f ∈ S_{2k}(SL₂(ℤ))` and an eigenform `g ∈ S_{k+n+r}(Γ_r)`, `n, r ≥ 1`, there is `F_{f,g} ∈ S_{k+n+r}(Γ_{2n+r})` … (degree three is `n = r = 1`, `k ↦ k − 2`)".

Claim: the general statement contains the degree-three statement and Miyawaki's instance.

Witness: Miyawaki's `F₁₂ = M_I(φ₂₀, Δ)` (README line 1591) has `2k = 20`, `n = r = 1`, so `k − n = 9` is odd and the instance is excluded; the type-I statement two lines above ("for even `k`") is the case `k_{Ikeda} = k − 2 ≡ n + r = 0 mod 2`. Ikeda's construction pulls back the Ikeda lift of `f` to degree `2n + 2r`, which exists exactly when `k ≡ n + r mod 2` (`vdg line 1910`: the lift to degree `2g` needs `g ≡ k mod 2`). `vdg line 1947` prints "`k − n` even" (a source misprint, see *Source issues*), which the README copied.

Repair: replace "`k ≡ n mod 2`" by "`k ≡ n + r mod 2` (the Ikeda lift of `f` to `S_{k+n+r}(Γ_{2n+2r})` must exist)", and add the Check "`n = r = 1`, `k = 10` gives Miyawaki's `F₁₂`; `n = r = 1`, `k = 11` is excluded although `k ≡ n mod 2`".

## R05 (P2) — `sorry` inside three theorem statements

Location: `Suggested.lean` line 987 (`fourierCoeff_conj`: `mkOfDetNeZero (…)ᵀ sorry`), line 1046 (`fourierCoeff_phi`: `⟨Matrix.of …, sorry, sorry, sorry⟩`), line 1118 (`fourierCoeff_siegelEisenstein_zero`: `⟨0, Matrix.isSymm_zero, sorry, sorry⟩`).

Claim: these are statements of the roadmap's targets.

Witness: each statement's elaborated type contains `sorryAx`: the half-integral matrix `0` and the restriction `diag(T', 0)` are built with sorried proof fields, and the transpose of `U ∈ GL_g(ℤ)` is made a unit with a sorried determinant proof. A statement that mentions `sorry` is not a claim the finished roadmap is tested against (the brief: no sorry'd data and nothing that mentions one).

Repair: add `HalfIntegral.zero : HalfIntegral g := ⟨0, Matrix.isSymm_zero, fun _ => ⟨0, by simp⟩, fun _ _ => ⟨0, by simp⟩⟩` and a real-bodied `HalfIntegral.extendZero (T' : HalfIntegral g) : HalfIntegral (g + 1)` (block-diagonal through `Matrix.fromBlocks` and `finSumFinEquiv`, with the four fields proved); for `fourierCoeff_conj` take `U : GL (Fin g) ℤ` and use `(Matrix.GeneralLinearGroup.map (Int.castRingHom ℂ) U)⁻¹ᵀ` through `Matrix.GeneralLinearGroup.transpose` (or state the equivariance with `ρ.rep` applied to the unit `Units.map … Uᵀ`, whose determinant is the unit `det U`); every `sorry` then sits in a proof only.

## R06 (P2) — The Saito–Kurokawa theorem is statable at the pins but absent

Location: `Suggested.lean` lines 1535–1545 (Layer 9 states `maassCoeff`, `maassLift`, `IsMaassForm`, `chi10_isMaassForm`, `chi12_isMaassForm` only); README 9.5.

Claim (module docstring, lines 13–20): what is not stated is only what needs a carrier the pins lack.

Witness: 9.5's content in eigenvalue form needs no Jacobi carrier. The statement below elaborated against the file's own declarations with only the `sorry` warning:

```lean
theorem saito_kurokawa (k : ℕ) (hk : Even k) (hk4 : 4 ≤ k)
    (f : HeckeRing.GL2.Newform 1 (2 * (k : ℤ) - 2)) :
    ∃ F : SiegelModularForm (Gamma 2) (detWeight 2 k), IsCuspForm F ∧ IsMaassForm F ∧
      ∃ hF : IsHeckeEigenform _ (scalarExponent 2 k) F, ∀ p : ℕ, p.Prime →
        eigenvalue hF p =
          (qExpansion 1 f.toCuspForm).coeff p + (p : ℂ) ^ (k - 1) + (p : ℂ) ^ (k - 2) := sorry
```

This is van der Geer's Theorem 21.1 (`vdg line 1841`) read through `λ_F(T(p)) = a_p(f) + p^{k−1} + p^{k−2}` (README line 1498), the theorem the roadmap's title names; `χ₁₀ = SK(f₁₈)` with `λ(2) = −528 + 512 + 256 = 240` is its first instance. The Maass-space dimension `dim S_k^*(Γ₂) = dim S_{2k−2}(SL₂(ℤ))` (9.4) is statable as well once the Maass relation is packaged as a `Submodule` of `cuspSubmodule (Gamma 2) (detWeight 2 k)` (the relation is linear in the coefficients, so the submodule has a real body); a bare subtype does not carry a module structure.

Repair: add the statement above (with `IsMaassForm` and `IsHeckeEigenform` as they stand) and, if 9.4's dimension count is kept as a headline, a real-bodied `maassSubmodule k` with `Module.finrank ℂ (maassSubmodule k) = Module.finrank ℂ (CuspForm (CongruenceSubgroup.Gamma 1) (2 * (k : ℤ) - 2))`. Name in the docstring that the Jacobi-side isomorphisms of 9.5 are not statable (carrier in `HalfIntegralWeightModularForms`).

## R07 (P3) — The branch example in 5.2 names the wrong point

Location: README lines 830–832: "at `τ = (1 + 2i)·1₃`, `det(τ/i) = (1 − 2i)³ = −11 + 2i` and the principal square root differs from the continued one by the sign".

Witness: for `τ = (1 + 2i)·1₃`, `τ/i = (2 − i)·1₃` and `det(τ/i) = (2 − i)³ = 2 − 11i`; each factor has argument `−0.464`, the continued root has argument `−0.695`, the principal root of `2 − 11i` has argument `−0.695` too: they agree. The stated value `(1 − 2i)³ = −11 + 2i` belongs to `τ = (2 + i)·1₃` (`τ/i = 1 − 2i`), where each factor has argument `−1.107`, the continued root argument `−1.661`, and the principal root of `−11 + 2i` argument `+1.481`: the roots differ by the sign, as claimed.

Repair: replace `(1 + 2i)·1₃` by `(2 + i)·1₃`.

## R08 (P3) — Wrong discriminant exponent in 11.2

Location: README line 1825: "`T₂` has characteristic polynomial `x² + 194400x − 137403408384` of discriminant `2¹² · 63737521`".

Witness: `194400² + 4 · 137403408384 = 587404993536 = 96² · 63737521 = 2¹⁰ · 3² · 63737521`; the roots are `−97200 ± 96√63737521`, the field `ℚ(√63737521)` is right.

Repair: write `2¹⁰ · 3² · 63737521`.

## R09 (P3) — Supplier and deferral drift (six items)

1. README line 173: "`ShimuraCompactifications` (C4–C5)". That roadmap (open head #1053) has no C-numbered targets; its "C−1–C4" are ComplexComparisonPartII's labels in its supplier list. Its minimal compactification is 2.8 and 7.16. Cite those.
2. README line 897 (5.3): "the `D₁₆⁺` lattice of that roadmap's Layer 8" (LatticePackingsAndPerfectForms). Its Layer 8 is the LMFDB geometric columns; `D₁₆⁺` occurs there only as a non-example at its line 838. The owner is IntegralLattices 6D (rank 16, the two classes), on main. Cite IntegralLattices 6D.
3. README lines 196–198 and 1106–1107 and 11.4: half-integral weight Siegel modular forms, the theta multiplier on `Γ_g(4, 8)` and the LMFDB's half-integral weight family on `Γ₀(4)` are deferred to `HalfIntegralWeightModularForms`. That roadmap (open head #1721) lists "Siegel modular forms" under what it does not own (its line 1253) and mentions no Siegel half-space, so the family is unowned. Either own the weight-`(k − 1/2)` family on `Γ₀^{(2)}(4)` here (Hayashida–Ibukiyama is already a reference) or say in *Not owned here* that no roadmap owns it.
4. README line 1739: "Calegari–Chidambaram–Ghitza 2020 is where the quaternionic case is exhibited". `ccg2020` contains no quaternionic abelian fourfold (no occurrence of "quaternion"); the corrected conjecture with `B_N` (QM fourfolds of conductor `N²`, `L(s, B) = L(s, F, spin)²`) is Brumer–Kramer's own section 8, `brumerkramer2014 lines 2233–2247`, which credits Calegari with the observation. Cite Brumer–Kramer §8 / the 2019 corrigendum and drop the CCG attribution (CCG may stay as a reference for explicit modular surfaces).
5. README line 1794 ("consumed from the character roadmaps by name") and 1763 ("the abelian-variety and `HyperellipticCurves` roadmaps for `L_p(A, X)`"): name the suppliers. `HyperellipticCurves` (open head #1707, its scope line 104) owns the good Euler factors of genus-two Jacobians; a Dirichlet-character orbit label needs a named roadmap and section.
6. README lines 294–299: "on Tau Ceti main, `TauCeti.NumberTheory.ModularForms.ThetaSeries.Basic` (`thetaSeries`, `thetaCoset`, …) and `…JacobiTheta.OneVariable`". Neither module exists at the pinned Tau Ceti (`TauCeti/NumberTheory/ModularForms/` has EisensteinSeries, FiniteDimensional, HeckeSlash, LFunction, LevelOne, Newforms, Petersson, SturmBound and no theta module; no `thetaSeries` anywhere in the pinned sources). "On Tau Ceti main" is a process claim. Cite the theta-series roadmap's Layer 3 `thetaSeries L` only, as 5.1 already does.

## R10 (P3) — README shape

Location: whole README.

Witness: the headings are `## Prerequisites`, `## Pinned conventions`, `## What Mathlib supplies`, `## What Tau Ceti supplies`, `## What is missing (build here)`, `## Explicit scope exclusions`, `## Ordering`; the house shape is `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Downstream consumers`, with `### Examples` and `### Dependencies` closing every layer. Dependencies are written as `*Prerequisites:*` lines, which the dependency check does not read (it reads `*Needs:*`); I checked by substitution that every edge is downward, but the gate's `depcheck=0` is currently vacuous for this README. Only eleven subsections carry `**Checks.**` bullets (0.1, 1.3, 3.4, 4.2, 7.3, 7.4, 8.2, 9.2, 10.2, 10.3, 10.6); the definitions of 0.2–0.7, 1.1, 1.2, 2.1, 2.2, 3.1, 3.2, 5.1–5.4, 6.1–6.9, 7.1, 7.2, 8.1, 9.3, 9.4, 10.1, 11.1–11.3 have their acceptance values inline but no Checks list, and several `⚠` rejection remarks stand in for negative-control Checks. References line 2009: "(local copy in `references/`)" is a local path and a process remark (no such folder exists).

Repair: rename and reorder the sections to the house shape; rewrite every `*Prerequisites:*` as `*Needs:*`; close each layer with `### Examples` (the worked examples already exist) and `### Dependencies` (the *Ordering* section already has the content); turn each inline acceptance value and `⚠` remark into a `**Checks.**` bullet of its definition, three per definition; delete the parenthetical about the local copy.

## R11 (P3) — Padding in `Suggested.lean`; the docstring follows the catalogue model

Location: `Suggested.lean` throughout (286 declarations).

Witness (one-tactic probe on a scratch copy, elaborated with `lake env lean`): `coe_add` and `coe_smul` close by `rfl`; `chi10_eq` closes by `rfl` (it restates the definition); `detTwo_ofTriple` closes by `simp [detTwo, ofTriple, Matrix.det_fin_two_of]; ring`; `det_frickeMatrix` closes by `simp [frickeMatrix, Matrix.det_fin_two_of]; field_simp` after `Real.sqrt_pos`. Beyond these: API lemmas proved in place (`Sp.mat_inv`, `smul_toMatrix`, `rhoFun_add`, `rhoFun_smul`, `slash_add`, `slash_smul`, `slash_zero`, `slash_detWeight_mul`, `symOfUpper_isSymm`, `diagMatrix_isSymm`, `heckeT_eq_eigenvalue_smul`, `isArithmetic_gamma`, `im_posDef`, `toMatrix_isSymm`, `isSymm_I_smul_one`, `map_im_I_smul_one`); trivial sorried lemmas (`holomorphic_const`, `Holomorphic.add/smul/mul`, `act_one`, `autFactor_one`, `slash_one`, `slashE_toGSpPos`, `gammaN_le_gamma1`, `gamma1_le_gamma0`, `content_ofTriple`, `conj_diag_int`, `conj_two_int`, `isCuspForm_zero`, `IsCuspForm.add/smul`, `rhoFun_one`, `rho_zero`, `rho_neg_one`, `continuous_equivUpperHalfPlaneEquiv`, `continuous_equivUpperHalfPlaneEquiv_symm`, `natDegree_spinorEulerFactor`, `natDegree_standardEulerFactor`, `level_gamma`, `level_gamma0`, `level_paramodularR`, `paramodular_one`, `fricke_sq`, `frickeOp_frickeOp`); value computations mirroring README Checks (`fourierCoeff_psi4_111`, `fourierCoeff_psi4_101`, `fourierCoeff_chi10`, `fourierCoeff_chi12`, `fourierCoeff_chi35`, `igusaDim_values`, `chi10_eigenvalues`, `chi12_eigenvalues`, `chi12_eq`, `chi10_isIntegral`, `chi12_isIntegral`, `chi35_isIntegral`); catalogue definitions used by no headline (`Family`, `Family.degree`, `LabelPrefix`, `EigenformType`, `IsIntegral`, `coefficientField`, `equivUpperHalfPlaneEquiv`, `equivUpperHalfPlane`, `integralSimilitudes` beyond `cosetReps`). The docstring (lines 9–20) says the file "suggests Lean forms for the load-bearing milestones" and "is not exhaustive"; the house form says the file states the headline theorems and names which are not statable and what each lacks.

Repair: delete the listed declarations from `Suggested.lean` (the README keeps each as an API bullet or a Check); keep the carriers (`GSpPos`, `SiegelHalfSpace`, `Holomorphic`, `Weight`, `detWeight`, `rho`, `slash`, `slashE`, `SiegelModularForm`, `HalfIntegral`, `fourierCoeff`, `phi`, `IsCuspForm`, `siegelEisenstein`, `siegelTheta`, `thetaConstant`, `chi10`, `chi12`, `wronskian`, `chi35`, `heckeT`, `heckeTi`, `IsHeckeEigenform`, `eigenvalue`, `spinorEulerFactor`, `standardEulerFactor`, `IsMaassForm`, `paramodular`, `fricke`) and the headlines (`koecher`, `bounded_of_invariant`, `finiteDimensional`, `eq_zero_of_fourierCoeff_eq_zero`, `siegelEisensteinFun_mem`, `phi_siegelEisenstein`, `siegelTheta_mem`, `siegelTheta_symJ_smul`, `thetaConstant_eq_zero_iff`, `card_evenChar`, `wronskian_mem`, `igusa_even`, `igusa_odd`, `igusaGenerators_algebraicIndependent`, `finrank_eq_igusaDim`, `isHeckeTriple_gamma`, `card_cosetReps_two`, `heckeT_comm`, `heckeT_mul_of_coprime`, `heckeT_sq`, `exists_eigenform_basis`, `eigenvalue_siegelEisenstein`, `coeffTriple_heckeT`, `heckeT_one_eq`, `relindex_gamma0_prime`, `relindex_paramodular_inf_gamma`, `mem_paramodular_iff`, `finrank_cusp_277`, `exists_unique_reduced`, `hasSum_fourier`, `isCuspForm_iff_fourierCoeff`, the Saito–Kurokawa statement of R06); rewrite the docstring in the house form, listing as not statable the Petersson product, Cohen's `H`, the Satake isomorphism, the two `L`-functions as Euler products, the Jacobi-side statements of 9.2–9.6, the paramodular operators and newforms of 7.3 and 10.2–10.4, and `IsParamodularPartner`, each with the carrier it lacks.

## R12 (P3) — The nonvanishing `L(k, f) ≠ 0` in 8.3 needs a named bound

Location: README lines 1244–1245: "`L(k, f) ≠ 0` since `k` lies in the half-plane of absolute convergence of `L(s, f)`".

Witness: `f ∈ S_{2k−2}(SL₂(ℤ))`; Hecke's bound `a_n = O(n^{k−1})` gives absolute convergence only for `Re s > k`, with `s = k` on the boundary. With Deligne's bound `|a_p| ≤ 2p^{(2k−3)/2}` the Euler product converges absolutely for `Re s > k − 1/2` and `L(k, f) ≠ 0`.

Repair: say "by Deligne's bound (the modular-forms roadmap, Layer 7, or Rankin's `a_n = O(n^{k−1−1/5})`), `s = k` lies inside the region of absolute convergence of the Euler product".

## R13 (P3) — The Kohnen-exponent gloss in 9.7 contradicts the quoted formula

Location: README lines 1534–1536: "(Kohnen 2002, whose `a^{k−1}` has `k` the weight `k + n` of the lift: at `n = 1` the exponent is the Maass lift's `d^{(k+1)−1}` of 9.3 …)".

Witness: `vdg line 1929` quotes Kohnen's formula `a(T) = ∑_{a ∣ f_T} a^{k−1} φ(a, T) c(|D_T|/a²)` with `k` the `k` of `f ∈ S_{2k}` and the lift in `S_{k+g}(Γ_{2g})`, the same `k` as 9.7's; the lift's weight is `k + n`, not Kohnen's `k`. The Maass exponent `d^{(k+1)−1}` at `n = 1` is recovered through `φ(a, T)` (Kohnen's integer-valued factor), not by renaming `k`; Kohnen 2002 is paywalled and I could not read `φ(a, T)` there.

Repair: delete the gloss, or state Kohnen's convention from the paper with its page.

## Verified sound

**Gate and tooling.** Gate at e43a9fe: all counters 0 except `build=1` (R01); `outside-folder=0` and `git diff --stat origin/main...HEAD` outside the folder is empty; `metadata.toml` is one line. Depcheck: 0 problems both as-is and with `*Needs:*` substituted (1526 → 1531 edges); SiegelModularForms is at position 368 of the merge order after LFunctions (23), MetaplecticAutomorphicForms (134), ClassicalGroupsPartII (185), QSeriesPartitionsAndMockModularForms (231). `roadmaps grep SiegelModularForms`: HalfIntegralWeightModularForms (#1721), LatticePackingsAndPerfectForms (#1723), HilbertModularForms (#1724), HilbertModularSurfaces (#1730) mention it only as a deferral or consumer; no open roadmap takes it as a supplier: no cycle. Ownership against the open pull requests whose files the brief lists was checked by object: MetaplecticAutomorphicForms 8.10–8.12 (#1063) builds the degree-two Siegel space and the positive similitude action; this roadmap builds the degree-`g` objects and 0.3/0.4 state the identification at `g = 2`, which is the reason it is the owner of the general-degree carrier.

**Cross-roadmap citations resolved** (27 leads of `roadmaps resolve` are all LMFDB knowl names, not Lean names): ModularForms on main Layers 2 (Hecke), 3 (Petersson, oldforms), 4 (newforms), 7 (`L`-functions), 9 (Satake parameters, its line 980); ThetaSeries on main Layer 1 (`poissonSummation`, `gaussian`, `fourier_gaussian`, lines 126–127), Layer 2 (`IsIntegral` line 204, `IsEven` line 81, 2E `level` line 533), Layer 3 `thetaSeries` (line 591), 6F `χ_L` (line 830), Layers 5 and 7; IntegralLattices on main Layer 2 (positive definite lattices, reduction) and 6D (`D₁₆⁺`); LFunctions on main Layer 0 (`AnalyticLFunctionData` line 348, `ArithmeticLFunctionData` and `NormalizationTranslation` lines 385–386); ClassicalGroupsPartII CG.0.1 (#1492 line 318: points `h ∈ GL_{2g}(A)` with `h J hᵀ = ν(h) J`, multiplier uniqueness); QSeriesPartitionsAndMockModularForms §9.1 (#1391 line 1358); HalfIntegralWeightModularForms 6.1–6.4 (#1721 lines 1080–1158); LatticePackingsAndPerfectForms 5.6 (#1723 line 813); HyperellipticCurves good Euler factors (#1707 line 104); MetaplecticAutomorphicForms 6.18, 6.20, 8.10–8.12, 8.18, 8.19, 8.76–8.80 (#1063); PELModuli M5 `siegelModuli`, M6 `siegelStack` (#966). Drift found: R09.

**Library declarations opened at the pins.** Mathlib: `IsHeckeTriple`, `HeckeCoset`, `HeckeCosetModule`, `HeckeRing` (`NumberTheory/HeckeRing/Defs.lean`), `jacobiTheta₂` (`JacobiTheta/TwoVariable.lean`), `EisensteinSeries.E` (`EisensteinSeries/Basic.lean`), `sturm_bound_levelOne` (`LevelOne/DimensionFormula.lean` line 307), `IsArithmetic`, `HasDetOne`, `Commensurable`, `Matrix.map_J`, `inv_eq_symplectic_inv`, `transpose_mem`, `PosDef.isUnit`, `posDef_iff_dotProduct_mulVec`, `isHermitian_iff_isSymm`, `IsOpenEmbedding.singletonChartedSpace`, `mkOfDetNeZero`. Tau Ceti: `GLSymplectic`, `mem_iff'`, `mem_iff_mem_symplecticGroup`, `ofSymplecticGroup`, `mulEquivSymplecticGroup`, `symJ` (`Symplectic/Basic.lean`), `leviHom` (`Symplectic/Levi.lean`), `upperUnipotent`, `lowerUnipotent` (`UnipotentGeneration.lean`), `eq_top_of_root_subgroups` (`TorusGeneration.lean`), `GLSymplecticFin.mulEquivGLSymplectic`, `det_eq_of_transpose_mul_J_mul_eq_smul`, `transpose_mul_J_mul_eq_det_smul` (`SymplecticMultiplier.lean`), `fromBlocks_upper_mem`, `fromBlocks_lower_mem`, `fromBlocks_diagonal_mem`, `transpose_eq_J_conj_inv` (`LinearAlgebra/SymplecticGroup.lean`), `isClosed_GLSymplectic`, `HeckeRing.GL2.Newform`, `satakeParameters`, `satakeAngle`, `EigenformAwayFromLevel`, `LSeries_qExpansion_coeff_eq`, `hasEntireExtension_qExpansion_coeff`, `mvPolynomialEquivModularForms`, `normalizedCharEisensteinSeriesMF`, `ModularForms/FiniteDimensional.lean`, `ModularForms/SturmBound.lean`, `AlgebraicGeometry/AbelianVariety/Basic.lean`. Not at the pin: `thetaSeries`, `thetaCoset`, the theta and Jacobi modules (R09.6).

**Lean form.** The worker's targeted build and my three probe elaborations (`lake env lean` on scratch copies) show only `declaration uses 'sorry'` plus the module warning; a single `import Mathlib` and five `TauCeti.*` imports that exist at the pin; no `set_option`, no `lemma`, no `#eval`, no sorried `def`. The five "lost binder" leads of the signatures file (`extendZero`, `fourierCoeff`, `phi`, `gram`, `siegelTheta`) are unused instance binders (`FiniteDimensional`), harmless. Elaborated types compared with the README for every declaration a finding touches and for the headlines (table below).

**Adversarial table** (values computed by hand or by the scratch script `numerics.py`, which evaluates `L(1 − r, χ_D) = −B_{r,χ_D}/r` from generalized Bernoulli numbers).

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 0.1 block membership, `g = 1` | `M = diag(2, 1/2)`, `diag(1, −1)` | `M J Mᵀ = J` iff `det = 1`: `1` vs `−1` | sound | none |
| 0.2 `det M = μ^g`, scalars | `c·1`, `diag(1_g, −1_g)` | `μ(c·1) = c²`; `diag(1,1,−1,−1)`: `μ = −1`, `det = 1 = μ^2` | sound (positivity of `μ`, not `det`) | none |
| 0.4 `J • τ` | `τ = diag(i, 2i)` | `−τ⁻¹ = diag(i, i/2)`, `Im > 0` | sound | none |
| 0.6 `[Γ_g : Γ₀(p)]`, `|Sp₄(𝔽_p)|`, `−1 ∈ Γ_g(N)` | `g = 2`, `p = 2, 3`; `N = 1, 2, 3` | `(1+2)(1+4) = 15`, `40`; `2⁴·3·15 = 720`, `3⁴·8·80 = 51840`; `−1 ≡ 1 mod N` iff `N ≤ 2` | sound | none |
| 0.7 `[Γ₂ : K(p) ∩ Γ₂]` | `p = 2, 3` | lines of `𝔽_p⁴`: `15`, `40`; `K(N)` entry shape derived from `γL ⊆ L`, `γ⁻¹L ⊆ L` with `γ⁻¹ = (Dᵀ, −Bᵀ; −Cᵀ, Aᵀ)`: `(1,2),(3,2),(4,1),(4,2),(4,3) ∈ Nℤ`, `(2,4) ∈ N⁻¹ℤ` | sound; matches `mem_paramodular_iff` | none |
| 0.7 Fricke `μ_N = m(A_N)` | `A_N = [[0,√N],[1/√N,0]]` | `A_N τ A_Nᵀ = [[Nτ'', z],[z, τ'/N]]`, `A_N² = 1`, `det A_N = −1`; `leviHom` gives `diag(A, A⁻ᵀ) = diag(A_N, A_Nᵀ)` | sound | none |
| 1.1 `ρ_{k,j}` | `A = −1`, `A = c·1` | `det(−1)^k (−1)^j = (−1)^j`; central character `c^{2k+j}`; highest weight `(k+j, k)`; `e = 2k + j − 3` | sound | none |
| 1.1 substitution action is a left action | `σ_A σ_B (X_i)` | `∑_m (AB)_{mi} X_m = σ_{AB}(X_i)` | sound (`rhoFun_mul` direction right) | none |
| 1.2 degree-one slash | `g = 1`, `e = k − 1` | `μ^{k−1}(cτ+d)^{−k} f(γτ)` = Mathlib `slash` with `det^{k−1}` | sound | none |
| 1.3 parity lemma | `ρ = det⁰ ⊕ det¹`, `f ≡ (1,0)` | `f ≠ 0`, `ρ(−1) = diag(1,−1) ≠ 1` | **false for reducible ρ** | R02 |
| 2.1 content, reduced forms | `(1,−1,1)`, `(2,1,1)`, `(2,3,4)` | `gcd(2n, r, 2m, n, m) = gcd(n,r,m)`; `(1,−1,1)` not reduced, `(2,1,1) ~ (1,1,2)`, `(2,3,4) ~ (2,−1,3)` by `U = [[1,−1],[0,1]]` | sound | none |
| 2.4 Koecher, `g = 1` control | `j(τ)` | `a(−1) = 1 ≠ 0`; constructor carries `2 ≤ g` | sound | none |
| 2.6 singular forms | `g = 2`, `k = 0, 1` | `2k < g` iff `k = 0`; `S_k(Γ₂) = 0` for `k < 1` | sound (`vdg line 614`) | none |
| 4.1–4.2 Eisenstein coefficients | `ψ₄`: `(1,0,0),(1,1,1),(1,0,1),(1,2,1),(2,1,1),(1,0,2)`; `ψ₆`: `(1,1,1),(1,0,1),(1,2,1),(2,1,1)` | `H(3,0) = −1/252`, `H(3,3) = −2/9`, `H(3,4) = −1/2`, `H(5,3) = 2/3`; `c_{E_{4,1}}(3,4,7,8) = 56, 126, 576, 756`; `c_{E_{6,1}}(3,4,7) = −88, −330, −4224`; `a(ψ₄) = 240, 13440, 30240, 240, 138240, 181440`; `a(ψ₆) = 44352, 166320, −504, 2128896` | sound (all README values reproduced) | none |
| 4.2 `N ≡ 1, 2 mod 4` | `N = 1, 2` | no fundamental `D < 0` with `|D|f² = N`: `H` undefined | sound (Check) | none |
| 4.3 Klingen decomposition | `k = 4, 6` | `k > g + r + 1 = 4` and `k > 2g = 4`: holds for `k ≥ 6`; `M_4 = ℂψ₄` | sound (`vdg lines 584, 595`) | none |
| 5.2 branch example | `τ = (1+2i)·1₃`, `τ = (2+i)·1₃` | `det(τ/i) = (2−i)³ = 2 − 11i` (roots agree) vs `(1−2i)³ = −11 + 2i` (roots differ by sign) | **wrong point** | R07 |
| 5.2 `E₈`, `g = 2` | `r_{E₈}((1,1,1))`, `((1,0,1))` | `240·56 = 13440`, `240·126 = 30240` = `a(ψ₄)` | sound | none |
| 5.4 even characteristics, `χ₅²` | `g = 1, 2, 3`; `(1,1,1)`, `(1,0,1)` | `2^{g−1}(2^g+1) = 3, 10, 36`; `χ₅² = −2^{14}χ₁₀^{Igusa} = 2^{12}·C`: `4096`, `−8192`; `card_evenChar` needs `0 < g` (at `g = 0` the formula gives `2`, the count `1`) | sound (`vdg line 654`) | none |
| 6.1 Igusa constants | `(ψ₄ψ₆ − ψ₁₀)`, `(441ψ₄³ + 250ψ₆² − 691ψ₁₂)` at `(1,1,1),(1,0,1),(2,1,1),(1,0,2),(2,2,2)` | Igusa `χ₁₀`: `−1/4, 1/2, 4, −9, −60`; `C = −4χ₁₀`: `1, −2, −16, 36, 240`; Igusa `χ₁₂`: `1/12, 5/6, −22/3, −11, 232`; `D = 12χ₁₂`: `1, 10, −88, −132, 2784` | sound (all five pairs match 6.1) | none |
| 6.1 Witt restriction | `ψ₄` at `q₁q₂` | `∑_r a((1,r,1)) = 30240 + 2·13440 + 2·240 = 57600 = 240²` | sound | none |
| 6.2 `χ₃₅` antisymmetries | `(2,−1,3)`, `(3,1,2)`, `(2,3,4)`, `(4,1,2)` | `−1, −1, −1 (= a(2,−1,3)), 69 = −a(2,1,4)` | consistent | none |
| 6.3 Hilbert series | `k = 0,…,24` even; `35, 37, 39` | `dim M_k = 1,0,1,1,1,2,3,2,4,4,5,6,8`; `dim S_k = dim M_k − 1 − dim S_k(Γ₁) = 0,0,0,0,0,1,1,1,2,2,3,4,5`; `1, 0, 1` | sound | none |
| 6.4 Satoh dims | `k = 10,…,22` | `M_{k,2}: 1,0,2,3,3,4,7`; `S_{k,2} = M_{k,2} − dim S_{k+2}(Γ₁): 0,0,1,2,2,3,5`; `vdg line 2262` table: `S_{8,6} = 1`, `S_{10,4} = 1`, `S_{14,2} = 1`, `S_{16,2} = 2`, `S_{20,2} = 3`, `S_{12,6} = 2`, `S_{6,12} = 1` | sound | none |
| 6.5 quotients | `Γ₂/Γ₂(2)`, `Γ₀(2)/Γ₂(2)`, `Γ₁(2)/Γ₂(2)`, `Γ₀(2)/Γ₁(2)` | `720 = |S₆|`; `720/15 = 48 = |ℤ/2 × S₄|`; `(ℤ/2)³ = 8`; `48/8 = 6 = |S₃|` | sound | none |
| 6.6 theta series and relation | `θ_{E₆}, θ_{A₂}³, θ_{E₆*}` to `q³` | `θ_{E₆} − 4θ_{A₂}³ + 3θ_{E₆*}`: `q⁰: 0`, `q: 72 − 72 = 0`, `q²: 270 − 432 + 162 = 0`, `q³: 720 − 936 + 216 = 0`; `Φβ₃ = −108q − 324q² − 972q³`, `Φδ₃ = −8 + 72q − 216q²` | sound | none |
| 6.6 Ibukiyama dims | `k = 0,…,8` and odd `k ≤ 7` | monomial counts in weights `1,3,4,3`: `1,0,1,0,4,0,7,0,10`; `ψ₃`-part `1,3,4,9`; first odd weight `15 = 1 + 14` | consistent with the stated ring | none |
| 6.7–6.8 Hilbert series | `k = 0,…,8`; `2k = 10,12,14`; `k = 11` | `(1+t¹⁹)/((1−t²)(1−t⁴)²(1−t⁶))`: `1,1,3,4,7`; `(1+t⁴)(1+t¹¹)/((1−t²)³(1−t⁶))`: `1,3,7,14,24`, `t¹¹: 1`; `(t¹²+t¹⁴)/(…)`: `0,1,4`; weights of `X,Y,Z,K,T,θ',χ₁₉` = `2,4,4,6,4,6,19` | consistent | none |
| 6.9 Tsuyumine | `k = 4,…,20` | `N(t)`/denominator coefficients `1,1,1,2,4,3,7,8,11`; `S_k(Γ₃) = M_k(Γ₃) − M_k(Γ₂)`: `0,0,1,1,3,4,6` | consistent | none |
| 7.1 coset degrees | `p = 2, 3` | `(p+1)(p²+1) = 15, 40`; `p³(p+1)(p²+1) = 120, 1080`; `p(p+1)(p²+1) = 30, 120`; totals `151, 1201` = coefficient of `X²` in `(1 − p²X²)/∏_{i=0}^{3}(1 − p^iX)` = `p⁶+p⁵+2p⁴+2p³+p²+p+1` | sound | none |
| 7.4 Satake relations | `T(p)² = T₀ + (p+1)T₁ + (p³+p²+p+1)T₂` at `p = 2` | degrees `225 = 120 + 90 + 15` | sound | none |
| 7.4 Checks | `ψ₄`, `χ₁₀`, `W`-image, `Δ` at `p = 2` | `(1,8,4)`: `45`, `2⁵ = 2^{2k−3}`; `(2⁸, β/2⁸, β̄/2⁸)`: `256 − 528 + 512 = 240`; `(8, 1/8, 4)`: `8·(9/8)·5 = 45`; `a₂(Δ) = −24`, `ββ̄ = 2¹¹` | sound | none |
| 7.4 `T₂(p²)` scalar | `g = 2`, `det^k` | `p^{2e}ρ(p)⁻¹ = p^{4k−6−2k} = p^{2k−6}`; `p^{−3}α₀²α₁α₂ = p^{2k−6}` | sound | none |
| 7.5 coefficient formula | `χ₁₀`, `p = 2`, `T = (1,1,1)` and `(1,0,1)`; lower-triangular family | `R_p`: `UᵀTU/2` never half-integral at `(1,1,1)`: `λ = a(2,2,2) = 240`; at `(1,0,1)`: `32 + 2⁸·a(2,2,1) = 32 − 512 = −480 = 240·(−2)`; `[[2,0],[u,1]]`: `32 = λ·(−2)`, `λ = −16` | sound; `coeffTriple_heckeT` middle term `(pn, 2nu + r, (nu² + ru + m)/p)` matches `UᵀTU/p` | none |
| 7.6 Klingen parameters | `(β, β̄/β, p^{k−2})` | `Q_p = (1−βX)(1−β̄X)(1−p^{k−2}βX)(1−p^{k−2}β̄X)`; `α₀²α₁α₂ = p^{2k−3}`; `λ = a_p(1 + p^{k−2})` | sound | none |
| 8.1 quartic factor | `χ₁₀`, `p = 2` | `(1−2⁸X)(1−2⁹X)(1+528X+2¹⁷X²)`: `X`: `−240`; `X³`: `−240·2¹⁷`; `X⁴`: `2³⁴`; `X²`: `−143360 ⇒ λ(4) = 135424` | sound; `vdg line 1795` | none |
| 8.1 degree-one standard factor | `α₁ + α₁⁻¹` | `(β̄² + β²)/ββ̄ = a_p²/p^{k−1} − 2` | sound | none |
| 8.3 spinor functional equation, Hodge types | `(k,j)`; `j = 0` | types `(0,w),(k−2,k+j−1),(k+j−1,k−2),(w,0)`, `w = 2k+j−3`; `Γ_ℂ(s)Γ_ℂ(s−k+2)`, center `k + j/2 − 1`, `9` for `χ₁₀`; `vdg line 1774`: `Φ_f(2k−2−s) = (−1)^kΦ_f(s)` | sound | none |
| 8.3 Saito–Kurokawa pole | `k` even, `f ∈ S_{2k−2}` | root number `(−1)^{k−1} = −1 ⇒ L(k−1, f) = 0` cancels the pole of `ζ(s−k+2)`; `L(k,f) ≠ 0` needs Deligne | sound with the named bound | R12 |
| 8.3 standard `L` holomorphy | `F = I(Δ) ∈ S_8(Γ₄)` | `L(s, I(Δ), st) = ζ(s)∏L(…)`: pole at `s = 1`; clause "rank `2g` = 8" vacuous at weight 8 | **false** | R03 |
| 9.3 Maass lift constants | `k = 4` | constant term `c(0)(−B₄/8) = −1/240`, so `−(2k/B_k)V(E_{4,1})` has `a(0) = 1`; `a(1,1,1) = 240·56 = 13440` | sound | none |
| 9.3–9.4 Maass relation | `χ₁₀`, `χ₁₂` at `(2,2,2)` | `a(1,0,3) + 2⁹a(1,1,1) = −272 + 512 = 240`; `736 + 2048 = 2784` | sound (script) | none |
| 9.4 decomposition dims | `k = 10,…,24` | Maass `= dim S_{2k−2}(Γ₁)`: `0(k=10: S_{18} = 1)`, … at `k = 20`: `5 = 1 + 1 + 2 + 1`; `k = 24`: `8 = 1 + 2 + 3 + 2`; `k = 14, 16, 18`: remainder `0` | sound | none |
| 9.5 Saito–Kurokawa parameters | `(p^{k−2}, βp^{2−k}, β̄p^{2−k})` | `α₀²α₁α₂ = ββ̄ = p^{2k−3}`; `λ = a_p + p^{k−1} + p^{k−2}`; `χ₁₀`: `−528 + 512 + 256 = 240`, `−4284 + 19683 + 6561 = 21960`, `a₅(f₁₈) = −1025850`; `χ₁₂`: `−288 + 2048 + 1024 = 2784`, `a₃(f₂₂) = −128844`, `a₅(f₂₂) = 21640950` | sound (`vdg line 1841`) | statable headline absent: R06 |
| 9.7 Ikeda parameters | `β₀`, `β_i`, `β_{n+i}` | `β₀² ∏β = p^{2nk−n−n²}·p^{n²}`, i.e. `p^{∑λ−g(g+1)/2}` with `g = 2n`, `λ_i = k+n`; standard factor reproduces `ζ(s)∏_{i=1}^{2n}L(s+k+n−i, f)` | sound (`vdg line 1918`) | none |
| 9.8 Miyawaki parity | `k = 10`, `n = r = 1` | `k − n = 9` odd: excluded; `k − n − r = 8` even: included; type-I case `K = k + 2` even consistent | **wrong hypothesis** | R04 |
| 9.8 Rankin–Selberg factor | weights `k', l` | `e₂ = a_f²p^{l−1} + a_g²p^{k'−1} − 2p^{k'+l−2}`, `e₃ = a_fa_gp^{k'+l−2}`, `e₄ = p^{2k'+2l−4}` | sound | none |
| 10.1 Fricke coefficient law | `f ∣_k μ_N` | `det(A_Nᵀ)^{−k} f(Nτ'', z, τ'/N)`: `a(f∣μ;(m,r,Nn)) = (−1)^k a(f;(n,r,Nm))` | sound | none |
| 10.2/10.5 `f₂₇₇` | `Q₂, Q₃, Q₅` against 8.1 with `k = 2` | `λ(2) = −2`, `X³: 2·2 = 4`, `X⁴ = 4`, `λ(4) = 4 − 4 − 1 = −1`; `Q₃`: `λ = −1`, `3, 9`; `Q₅`: `−1`, `5, 25`; `pooryuen2015 lines 2180–2182` identical | sound | none |
| 10.6 curve `277.a.277.1` at `p = 2` | `y² + (x³+x²+x+1)y = −x² − x` over `𝔽₂` | affine `(0,0),(0,1),(1,0)`, two points at infinity (`Y² + Y = 0`): `#C = 5`, `a₂ = 3 − 5 = −2`; `L₂ = 1 + 2X + 4X² + 4X³ + 4X⁴ ⇒ b₂ = 4` | sound | none |
| 10.6 corrected converse | `brumerkramer2014 lines 2243–2247` | `P_N ↔ A_N ∪ B_N`, `B_N` QM fourfolds of conductor `N²`, `L(B) = L(f)²` | sound; attribution wrong | R09.4 |
| 11.2 `S_{38}` field | `x² + 194400x − 137403408384` | discriminant `587404993536 = 96²·63737521` | field right, exponent wrong | R08 |
| 11.3 class partition | Eisenstein, Klingen, Maass parameters | `(1, p^{k−1}, p^{k−2})`, `(β, β̄/β, p^{k−2})`, `(p^{k−2}, βp^{2−k}, β̄p^{2−k})` pairwise distinct `W`-orbits for `|β| = p^{(k−1)/2}` resp. `p^{(2k−3)/2}` | sound | none |
| Lean `card_evenChar`, `relindex_gamma0_prime`, `igusa_odd` junk values | `g = 0`; `k < 35` odd | `0 < g` present; empty product `1` = index `1`; `k − 35 = 0`, `P = 0` unique | sound | none |
| Lean `IsHeckeEigenform` over all `p, i : ℕ` | `p = 0`, `p = 1`, `i > g` | `heckeDiag` singular (empty coset set, operator `0`), identity, scalar `p·1`: all eigen | no vacuity | none |
| Lean `eq_zero_of_fourierCoeff_eq_zero` | `C = −1` | hypothesis vacuous only off the cone; conclusion then false, so `C` must be large: statement is the existence of a Sturm bound | sound | none |

**Sources read at the locators** (ids are the keys I used with the sources service): `vdg` = arXiv:math/0605346v2: Exercise 2.1 (line 160), Exercise 2.2 (255), Siegel's fundamental domain and Minkowski reduction (224–230), Definition 3.2 (373), Definition 4.1 (387), formula (4) (424), Corollary 4.2 (439), Theorem 4.3 (442), Theorem 4.4 (470), Corollary 4.5 (475), Proposition 4.6 (495), Definitions 5.1–5.2 (508, 524), Exercise 5.3 (528), Petersson product (536–546), Theorem 5.4 (584), Corollary 5.5 (595), Definition 6.1 and Theorem 6.2 (611–616), theta constants and `χ₁₀ = −2^{−14}∏θ²` (644–655), harmonic theta series (673–686), Fourier–Jacobi rules (729–737, 753–759), Witt's restriction (840–850), Theorem 9.1 (858), Lemma 16.1 (1401), Proposition 16.2 (1416), Theorem 16.3 (1453), Definitions 16.4–16.5 (1474–1490), Theorem 17.1 (1609), Proposition 18.1 and Example 18.2 (1639–1652), Satake normalization (1700–1708), §20 (1719–1776), Theorem 21.1 and `V_l` (1841–1870), Ikeda (1907–1921), Kohnen (1921–1930), Conjecture 21.3 (1947), §25 bracket and table (2246–2272), Arakawa surjectivity (2235–2237). `pooryuen2015` = arXiv:0912.0049v1 (a 2018 revision; theorem numbers agree with the README's): Theorems 1.2–1.4 (64–74), Theorem 3.1 and Table 1 (235–239), 277 Euler factors (2180–2182), Theorem 7.3 and the curve (2340–2356). `brumerkramer2014` = arXiv:1004.4699v4: Conjecture 1.1 (99–103), Definition 8.1 and Conjecture 8.2 (2235–2247). `bppvty2019` = arXiv:1805.10873v4: 277 statement (76–98, 1687–1716). `ccg2020` = arXiv:1906.10939v1 (checked for the quaternionic attribution only).

## Not verifiable

- Andrianov 1974 (Russian Math. Surveys 29): Theorem 3.1.1 and the §1 coefficient formula; mathnet landing page has no open PDF. The statements were checked against `vdg lines 1774–1776, 1795` and by the computation in the table.
- Roberts–Schmidt 2007 (LNM 1918), Theorems 7.5.1–7.5.9 and Table A.12 (10.4): paywalled, recorded `uncertified`.
- Roberts–Schmidt 2006, Theorem 1.1 (10.3): World Scientific returns HTTP 403.
- Arakawa 1983 (Manuscripta Math. 44), Satoh 1986 (Math. Ann. 274), Cohen 1975 (Math. Ann. 217), Kohnen 2002 (Math. Ann. 322): Springer, `uncertified`; Cohen's values checked numerically instead.
- Böcherer 1985 (Crelle 362): GDZ volume page only (no article download id found); the statement is confirmed indirectly by the Ikeda-lift pole (R03).
- Tsushima 1983 (Proc. Japan Acad.), Hayashida–Ibukiyama 2005 (Kyoto J. Math.), Poor–Yuen 2007 (J. Math. Soc. Japan): Project Euclid blocks the download (Incapsula page); the dimension values in 6.4, 6.8, 6.9 were checked only for internal consistency.
- Ikeda 2001 (Annals), Ikeda 2006 (Duke), Igusa 1962/1964/1967 (Amer. J. Math.), Tsuyumine 1986, Ibukiyama 1985/1991/2007/2012, Aoki–Ibukiyama 2005, Andrianov–Maloletkin 1975, Andrianov–Kalinin 1978, Gritsenko 1995, Maass 1979, Miyawaki 1992, Weissauer 2009, Freitag 1983, Klingen 1990, Eichler–Zagier 1985 (the MPIM copy at Zagier's page returns 404), Bergström–Faber–van der Geer 2008, Cléry–van der Geer–Grushevsky 2015: JSTOR, Springer or not located; cited by locator only. The roadmap has no `sources.toml`, so none of these is recorded as `uncertified` yet.
- The eigenvalues `λ(17), …, λ(31)` of `f₂₇₇` and the `χ₃₅` coefficients `a(2,1,4) = −69`, `a(W;(2,1,3)) = 41472`: not recomputed.

## Source issues

- **Error** in `vdg` at §20, printed page 36 (line 1772): the source says the standard-`L` completion of a cusp eigenform of weight `k ≥ g` is holomorphic when the form is orthogonal to the theta series of even unimodular lattices of rank `2g`; it should be rank `2k` (the weight-`k` theta series; Böcherer 1985, Mizumoto 1991), as the Ikeda lift `I(Δ) ∈ S_8(Γ₄)` with its `ζ(s)` factor shows; affects a stated result (README 8.3).
- **Misprint** in `vdg` at Conjecture 21.3, printed page 40 (line 1947): the source requires `k − n` even for `f ∈ S_{2k}`, `g ∈ S_{k+n+r}(Γ_r)`; it should be `k − n − r` even (the Ikeda lift of `f` to degree `2n + 2r` must exist; Miyawaki's `F₁₂` has `k = 10`, `n = r = 1`); affects a stated result (README 9.8).
