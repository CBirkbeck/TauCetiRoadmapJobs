<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2235#issuecomment-6644677012 -->
Review (claude) of 8a017ba

Verdict: needs_changes

1. **F01** (P2) Levelt's theorem is also built by HypergeometricMotives

   Location: `packages/PotentialAutomorphyDworkMotivesPartII/README.md` lines 159–200 (§§0.2–0.4, "Levelt's rigidity theorem … Prove it as `levelt_rigidity`") and `Suggested.lean` line 56 (`theorem levelt_rigidity`); Scope line 11 ("the linear algebra of hypergeometric pairs … Levelt rigidity, irreducibility").

   Claim: this roadmap owns Levelt's rigidity theorem over an arbitrary field with the companion normal form, the rank-one difference of companion matrices and the irreducibility of hypergeometric pairs.

   Witness: the open new-roadmap pull request HypergeometricMotives (roed-math, head f847e92), README §3.1 "Companion matrices", §3.2 "The Levelt triple", §3.4 "Levelt's theorem" ("State and prove Levelt's theorem over an arbitrary field `K`"), and its `Suggested.lean` lines 410–428 declaring `levelt_rigidity_field` (coprime monic `p, q`, triple `g_∞ g_1 g_0 = 1`, `rank(g_1 − 1) ≤ 1`, conclusion simultaneous conjugacy to `(C(p), C(p)⁻¹C(q), C(q)⁻¹)`) and `levelt_irreducible_field`. Same object, same generality, two open pull requests. Ownership of the Dwork pencil, the eigensheaves and the hypergeometric sheaves was also searched (`roadmaps grep` for "Dwork famil|Dwork pencil|Dwork motive|hypergeometric sheaf"): no other owner.

   Repair: in `## Scope and ownership` name HypergeometricMotives §§3.1, 3.2, 3.4 as the owner of Levelt's theorem and of the companion rank-one difference, add a `From TauCetiRoadmap.HypergeometricMotives` contract (its triple is `(g_∞, g_1, g_0)` with `g_∞ g_1 g_0 = 1`; this roadmap's `(h₀, h₁, h∞)` with `h₀h₁h∞ = 1` is obtained by `g_∞ = h∞`, `g_1 = h₁`, `g_0 = h₀`, which the README's §0.3 already explains for Beukers–Heckman), reduce §§0.2–0.4 to the translation and the Dwork specialisation (the Checks stay), delete `levelt_rigidity` from `Suggested.lean` with its docstring line in the module docstring, and run the dependency check. If the check refuses HypergeometricMotives as a supplier because it is a draft not yet in the merge order, keep §§0.2–0.4 and `levelt_rigidity` and state in Scope, naming HypergeometricMotives §3.4, that this roadmap carries Levelt's theorem until that roadmap is merged, so that the overlap is recorded rather than silent.

2. **F02** (P2) `TauCeti.FiniteEtaleScheme` does not exist at the pinned Tau Ceti

   Location: README line 70, "`TauCeti.FiniteEtaleScheme` (TauCeti/AlgebraicGeometry/FiniteEtale/Basic), the carrier on which EtaleCohomologyFoundations §F.0.2 builds".

   Claim: the pinned Tau Ceti supplies a finite étale scheme carrier.

   Witness: at the pin there is no `TauCeti/AlgebraicGeometry/FiniteEtale/` directory (the directory listing of `TauCeti/AlgebraicGeometry` has no `FiniteEtale` entry) and no Lean file in Tau Ceti or Mathlib mentions `FiniteEtaleScheme`; EtaleCohomologyFoundations README line 39 itself cites the module at Tau Ceti commit `9b58aa7`, "separate from the pinned interfaces".

   Repair: delete the bullet at line 70 (the `### From Tau Ceti` contract then keeps only `TauCeti.companionFinTwo`, which exists at `TauCeti/LinearAlgebra/Matrix/RationalCanonicalFormFinTwo.lean` line 69 as `!![0, -d; 1, t]`), and in the EtaleCohomologyFoundations contract say that the finite étale carrier of §F.0.2 is that roadmap's, consumed through `VanishingCycles.finiteEtaleGaloisCategory`. Nothing in `Suggested.lean` uses it.

3. **F03** (P3) Seven declaration names attributed to PotentialModularityAndCompatibleSystems do not exist there

   Location: README line 127 (the `### From TauCetiRoadmap.PotentialModularityAndCompatibleSystems` paragraph): `induced_character_purity`, `residual_irreducibility_density_one`, `moret_bailly_three_local_conditions`, `moret_bailly_above_preliminary_field`, `surjectiveSpecialisation`, `schemeChebotarevPoints`, `exists_cm_character_with_local_reductions`.

   Claim: these are declarations of that roadmap.

   Witness: `roadmaps grep --fixed` for each name returns "no match on main or in any open roadmap pull request"; the roadmap's README at head 5a6a670 (2124 lines) and its `Suggested.lean` (64 lines) contain none of them. The sections themselves exist: §1.11 "Purity of induced character families", §1.21 "Density-one residual irreducibility", §2.17 "Three kinds of local conditions", §2.18 "Approximation above a preliminary field", §2.20 "Surjective specialization of finite quotients", §3.1 "CM characters with simultaneous local reductions", and their statements match what the README assumes.

   Repair: cite the sections by number and title and drop the seven backticked names (in line 127 and wherever §9 repeats them, for instance "§2.17 (`moret_bailly_three_local_conditions`)" becomes "§2.17 (three kinds of local conditions)").

4. **F04** (P3) `LinearEquiv.mem_dilatransvections_pow_of_not_isExceptional` is not a declaration

   Location: README line 59, "`LinearEquiv.mem_dilatransvections_pow_of_not_isExceptional` is the non-exceptional case of Dieudonné's generation theorem".

   Witness: the name occurs only in the module docstring of `Mathlib/LinearAlgebra/Transvection/Generation.lean` (line 36); the theorem is `LinearEquiv.mem_transvections_pow_mul_dilatransvections_of_not_isExceptional` (line 487), stating `e ∈ transvections K V ^ (finrank K (V ⧸ e.fixedSubmodule) − 1) * dilatransvections K V` for `¬ IsExceptional e`.

   Repair: replace the name by `LinearEquiv.mem_transvections_pow_mul_dilatransvections_of_not_isExceptional` and describe its conclusion (a product of transvections times one dilatransvection).

5. **F05** (P3) §3.3 misreports what Barnet-Lamb–Geraghty–Harris–Taylor cite

   Location: README line 639 (§3.3), "(Barnet-Lamb–Geraghty–Harris–Taylor, proof of Lemma 4.3(3), p. 30, citing Katz, *Exponential sums and differential equations*, Theorem 8.4.2; …)".

   Witness: BLGHT11 lines 1139–1140: the third part refers to "theorem 5.3 of [Ka2] and theorem 8.4.11 of [Ka1]". Katz's book is uncertified, so which of 8.4.2 and 8.4.11 is the local-monodromy theorem could not be checked here.

   Repair: write "citing Katz, *Another look at the Dwork family*, Theorem 5.3, and Katz, *Exponential sums and differential equations*, Theorem 8.4.11", or cite Theorem 8.4.2 on the roadmap's own authority without attributing it to BLGHT; make the §3.2 and manifest locators for Katz ESDE consistent with the choice.

6. **F06** (P3) The binary icosahedral Check lists the wrong orders

   Location: README §5.6 proof sketch and second Check ("in it a product of two elements of order three has order `4`, `6` or `10`, never `5`").

   Witness: computed in `SL₂(𝔽₅)` (the binary icosahedral group, 20 elements of order 3): the orders of products of two elements of order exactly 3 are `{1, 3, 4, 6, 10}`. The claim used, "never `5`", is true, and the residual companion pair for `N = 5`, `l = 3` (`A = C((X − 1)²)`, `B = C(X² − tX + 1)` with `t` a root of `x² + x + 2` in `𝔽₉`) generates a group of order `720 = #SL₂(𝔽₉)`, with `ord B⁻¹ = 5`, `ord A = 3`, `ord BA⁻¹ = 3`.

   Repair: in both places write "has order `1`, `3`, `4`, `6` or `10`, never `5`", and add the computed order `720` of the companion pair for `N = 5`, `l = 3` as a Check.

Six findings, two of them blocking (P2). The elaboration passes with `sorry` as the only warning, the dependency check reports no UPWARD or CYCLE line, the one-tactic probe closes none of the six sorried theorems, every sampled locator that could be opened supports its statement, and the Lean statements agree with the README in generality. The repairs are a duplication of Levelt's theorem against an open roadmap pull request, a Tau Ceti carrier cited at a commit that is not the pin, seven supplier declaration names that do not exist at the supplier's head, one Mathlib name that exists only in a module docstring, one misattributed citation inside a source, and one Check that is stated too narrowly.

## Verified sound

**Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout: exit 0, six warnings, all "declaration uses `sorry`" (lines 56, 108, 127, 147, 166, 200); no `TauCeti.*` import is needed or present; single `import Mathlib`; no `set_option`, `lemma`, `#eval`, `#print`, `#synth`, `#check`; no sorry'd data (the five definitions `qianIndexSet`, `selfDualIndexSet`, `ZeroShapedDatum`, `ZeroShapedDatum.indexSet`, `qianGauss` have real bodies). The elaborated signatures were compared with the README statements: §0.3, §§5.1–5.4 and §6.2 agree in every hypothesis (odd characteristic, `N` odd, `n > 2`, `N > 100n + 100`, generation of `k` by `ζ`, `−1` not a power of `l`, `max(l₁, l₂) > 10`, `m > 1` and `N > 2m + 1`, exact odd order of `χ`, primitive `ψ`); no section binder is lost (none is used).

**One-tactic probe.** A copy of the file with each `sorry` replaced by `first | rfl | infer_instance | simp | simp_all | decide | norm_num | aesop` fails on all six theorems (errors at probe lines 65, 117, 139, 158, 184, 204). None restates a definition, mirrors a Check or computes a value; the five definitions are exactly those the headlines need. No padding.

**Headline theorems.** README summary: maximal unipotence at infinity (§4.6), residual monodromy `SL_n`, `SU_n`, `Sp_n` (§§5.1–5.8), Gauss-sum determinants (§6.2), de Rham with consecutive weights, ordinarity, Steinberg (§§7.4, 7.8, 7.10, 8.5), weakly compatible Dwork systems (§7.11), the switching theorems (§§9.3, 9.4, 9.10, 9.11). Stated at the pins: Levelt (§0.3), the four finite-group forms of the residual monodromy (§§5.1–5.4) and the determinant formula (§6.2). The module docstring names every other headline with the missing carrier (no relative étale or Betti local systems, no eigensheaves, no compactly supported direct images or convolution, no `π₁^ét` acting on stalks, no `ℓ`-adic avatars of Hecke characters or `D_dR`, no comparison isomorphisms, Weil–Deligne, `D_cris`, Hyodo–Kato realizations or weakly compatible systems, no torsors over the parameter line, no Moret-Bailly). Checked against Mathlib at the pin: `BDeRham` exists without a `D_dR` functor; no lisse sheaves or étale fundamental group action on stalks. No statable headline is absent.

**Dependency check.** Output: `moved: PotentialAutomorphyDworkMotivesPartII moved in the merge order from #137 to #198, right after its last supplier PotentialModularityAndCompatibleSystems; checked as moved (the worker moves it there when it submits)` and `depcheck: 235 roadmaps, 2148 edges, 0 problem(s)`. No UPWARD, no CYCLE.

**Supplier citations resolved at the current heads** (file cached per roadmap; heading found): ClassicalArithmeticCompletion §2.46 (`Polynomial.companion`, `Polynomial.det_companion`, `Polynomial.minpoly_companion`) and §2.60; EtaleCohomologyFoundations §§F.0.2 (`VanishingCycles.finiteEtaleGaloisCategory`, `VanishingCycles.lisseMonodromyEquiv`), F.0.A2, F.2.1, F.2.4–F.2.7, F.3, F.4.2, F.4.5, F.6; ComplexComparisonPartII §§C5.2, C5.3, C5.5, C6.5, C6.6 and the five named declarations; InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2 (`VanishingCycles.etaleTraceFormulaFinite`), IG.0.T3, IG.1.3; DeligneWeightsAndPurity §§0.1, 3.2, 7.15, 8.19; EtaleDualityAndPerverseSheaves §§0.5, 0.6; LefschetzPencilsAndVanishingCycles §§0.1, 0.5, 0.8a, 1.1, 1.6, 2.4 (contains the Tougeron henselian implicit function theorem), 2.7, 2.8; ArithmeticGaloisRepresentations §2.4 (`GaloisRep.grothendieck_quasiUnipotent`); PadicHodgeTheory §§3.2–3.4, 3.6, 6.1, 6.3, 6.4, 8.1, 8.2; LocalGaloisDeformationRings §§1.7 (`IsOrdinaryOfWeight`), 6.8, 6.19, 6.25; CrystallineCohomology §§CR.5:log-algebra.1, CR.5:log-algebra.3, CR.6.1–CR.6.3; PadicDifferentialEquationsAndRigidCohomology §§RD.2.3, RD.3.34, RD.3.43, RD.7.7; SchemeAndStackFoundations §§1.15, 1.16, 4.11, 4.20 (`IsStrictlySemistable`); AbelianSchemesAndArithmeticModuli §§A6.30, A6.31; AlgebraicModuliForArithmeticGeometry §3.4; ArithmeticGaloisDuality §R02.4.6 (character roots, totally real base change with avoidance, roots after prescribed totally real base change); BelyiMaps §§5.2 (`periphInf := (periph1 * periph0)⁻¹`), 5.6; Chebotarev Layer 10 (`hasDirichletDensity_frobeniusPrimeSet`); ModularCurves §5C; ModularCurvesPartII §5.14; GlobalNumberFields Layers 9, 10; PotentialModularityAndCompatibleSystems §§1.1, 1.4, 1.9, 1.11, 1.21, 2.14, 2.15, 2.17, 2.18, 2.20, 3.1 (sections; see R03 for the names). Mathlib declarations opened at the pin (file:line): `LinearEquiv.dilatransvections` Transvection/Basic.lean:270, `LinearEquiv.transvections` :223, `mem_dilatransvections_iff_finrank` :408, `mem_transvections_iff_mem_dilatransvections_and_fixedReduce_eq_one` :426, `LinearMap.transvection.det` :633 (`(transvection f v).det = 1 + f v`), `LinearEquiv.transvection.det_eq_one` :674, `LinearEquiv.transvection.baseChange` :527, `Matrix.SpecialLinearGroup.exists_list_transvec_mul_diagonal_mul_list_transvec` Matrix/SpecialLinearGroup.lean:699, `Subgroup.goursat` GroupTheory/Goursat.lean:128, `MulAction.IwasawaStructure.isSimpleGroup` GroupAction/Iwasawa.lean:81, `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple` PSL2.lean:135 (`4 ≤ Nat.card F`), `Matrix.SL2.commutator_eq_top` :804 (`a ≠ 0`, `a² ≠ 1`), `Matrix.SpecialLinearGroup.center_equiv_rootsOfUnity` Matrix/SpecialLinearGroup.lean:297, `Matrix.unitaryGroup` UnitaryGroup.lean:58, `Matrix.specialUnitaryGroup` :253, `Matrix.mem_unitaryGroup_iff'` :74, `Matrix.mem_specialUnitaryGroup_iff` :260, `Matrix.symplecticGroup` SymplecticGroup.lean:101, `FiniteField.unitsMap_norm_surjective` GaloisField.lean:236, `Algebra.trace_surjective` Trace/Basic.lean:518, `FiniteField.frobenius_pow` Finite/Basic.lean:472, `ZMod.pow_totient` :556, `groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units` Hilbert90.lean:84, `gaussSum_mul_gaussSum_eq_card` GaussSum.lean:188 (`χ ≠ 1`, `ψ` primitive, `gaussSum χ ψ * gaussSum χ⁻¹ ψ⁻¹ = card R`), `gaussSum_mulShift` :76, `jacobiSum` JacobiSum/Basic.lean:47, `AddChar.IsPrimitive` LegendreSymbol/AddCharacter.lean:60, `Nat.exists_prime_and_dvd`, `IsAdicComplete.henselianRing` Henselian.lean:170, `FundamentalGroup` FundamentalGroupoid/FundamentalGroup.lean:31, `Matrix.TransvectionStruct` Matrix/Transvection.lean:143, `TauCeti.companionFinTwo` RationalCanonicalFormFinTwo.lean:69.

**Declared gaps.** All four carry the same slug in `design/plan.json` and in the README's supplier contracts with a named supplier. Each was checked against the supplier's head: LefschetzPencilsAndVanishingCycles §0.1 identifies the tame character with Tau Ceti's and does not state the point-specialization of inertia through `T^{d·t_ℓ}`; PadicDifferentialEquationsAndRigidCohomology has no crystalline companions (no occurrence of "companion" in Abe's sense); SchemeAndStackFoundations §4.20 has no equivariant or toroidal statement; ModularCurvesPartII §5.14 constructs `X(ρ)` over `ℚ` only, without the universal curve's good-reduction model or its mod-`p` monodromy. None asks for what is provided; each `needs` sentence names its hypotheses.

**Sources: the seeded sample.** Every target below was read at its locator in the cached text.
- 0.8: BCGNT25 lines 2328–2352 (Lemma 4.3.4, p. 46): absolutely irreducible `V`, `V^∨ ≅ V^c ⊗ χ⁻¹`, image in `GU_n(𝔩)`; proof via Schur, `N(λ) = 1`, Hilbert 90, Lewis §4. Matches.
- 2.2: QIAN23 lines 582–587 (Prop. 3.2, p. 13) and BLGHT11 lines 1010–1017 (Lemma 4.1(2), printed p. 27): both derive local freeness from smoothness and properness and the rank from the fibre at `0`; the README's extra torsion-freeness input is correctly flagged as needed (see Source issues).
- 2.6: QIAN23 lines 600–608 (Lemma 3.3(1)) and BLGHT11 lines 1000–1007 (Lemma 4.1(1)): eigenlines indexed by `B`, `H`-characters `χ_i`, self-dual range `(N+1−n)/2 ≤ i ≤ (N−1+n)/2`. Matches.
- 4.3: QIAN23 lines 602–603, 623 (Lemma 3.3(3), "same as part 2 of Lemma 4.3 in BLGHT") and BLGHT11 lines 1118–1138 (Picard–Lefschetz, `H₀`-orbit `Δ`, `x ↦ x ± x_{δ₀}·(#Δ/#H₀)∑χ(ξ)⁻¹ξδ₀`, `dim ker ≥ n − 1`). Matches.
- 5.3: BCGNT25 lines 2388–2409 (Prop. 4.4.2, p. 47) and QIAN23 lines 685–715 (proof of Lemma 3.6): transvection-generated, Zalesskii–Serezhkin, subfield exclusion by Lemma 3.1, `Sp` excluded by `B ≠ −B`, `SU` for `l^s ≡ −1`. Matches the finite-group form.
- 5.4: QIAN23 lines 738–756 (Prop. 3.7, p. 16): distinct residue characteristics, `N ∤ l_i^{r/2}+1`, `max{l₁,l₂} > 10`, Goursat and the non-isomorphism of `PSL_n` across characteristics. Matches.
- 6.3: QIAN23 lines 844–931 ((3.2), (3.3), p. 18): `σ(∏g(v,b_j)) = t(a^{(q−1)/N})^{∑b_j}∏g = ∏g` since `∑b_j ≡ 0`; the rank-two case picks `σ` inverting `ζ_N` and fixing `ζ_p`. Matches, including the README's objection.
- 6.6: QIAN23 lines 209–213 (Lemma 2.1, p. 5: a finite field containing all `n`-th roots of unity, hence the `m`-th roots) and lines 1125–1134 (§4, p. 22: "`𝔽_{l²} ⊂ k(λ)`, `n | #(k(λ)^×)`"). The README's correction to `m` is right.
- 7.4: QIAN23 lines 1010–1014 (Lemma 3.10(1), pp. 20–21: de Rham, `σ`-weights `{M(a), …, M(a)+n−1}`) and BLGHT11 lines 1352–1355 (Lemma 5.3(1), printed p. 37: twist `(N−1−n)/2`, weights `{0, …, n−1}`). Matches.
- 7.11: BCGNT25 lines 2086–2090 (Prop. 4.2.5(3), p. 42: `(M, S, {Q_v}, {W^ss_{t,λ}}, {{0,…,n−1}}_τ)` weakly compatible, pure of weight `n − 1`, in the sense of BLGGT14 §5.1) and BLGGT14 line 2820 (§5.1 "Compatible systems: definitions"). Matches.
- 7.13: BCGNT25 lines 2126–2250 (Prop. 4.2.6, pp. 43–45: `U(v;λ)`, DK Theorem 1.3.3, `u(T) = ∑(−1)^{nr}∏C(c_i,r)T^r`, `U₁ = T_{1,k(v)}[1/u]`, Lucas) and DK17 lines 1364, 1434 (Prop. A.3.1, Cor. A.3.2). Matches, including the printed `r_d q_v^{d−1}` at line 2275.
- 8.1: QIAN21 lines 183–200 (Lemma 2.1, pp. 4–5: blowup of `UT(∑X_i^N) = N∏X_i` over `W[T,U^{±1}]′`, `H₀`-equivariant, charts `TU = Z₁⋯Z_r`; centres `D ∩ D_N`, then strict transforms `D^{(j)} ∩ D^{(j)}_j`), 362–372 (Remark 2.2: characters on chart coordinates), 373–380 (isomorphism outside `T = 0`). Matches.
- 8.4: QIAN21 lines 927–936 (foot of p. 20, first display of p. 21: `D_st,σ(V_{λ,t⁻¹}) := (V ⊗_{σ,(F′)⁰} B_st)^{G_{F′}} ≅ H^{N−2}_crys((Y,N)/(W,ℕ,1↦0))[1/p]^{H₀,σ⁻¹χ} ⊗_{(F′)⁰,σ} ℚ(ζ_N)_λ`). Matches.
- 9.2: QIAN23 lines 1171–1187 (§4, pp. 23–24: `T = Res_{EF^suff/ℚ} T_W`, `H = F₀L`, `S₁ = {∞}`, `S₃ = {l, l′}`, `Ω_{l,0}` with `v_l(t_τ) < 0`, `Ω_{l′,0}` with `v_{l′}(t_τ) > 0`). Matches.
- 9.3: QIAN23 lines 1156–1170 (Prop. 4.2), 1188–1196 (the five bullets: `F′ = L′EF^suff` CM Galois over `F`, `χ₁⁻¹V[λ]_t ≅ r|`, `χ₂⁻¹V[λ′]_t ≅ Sym^{n−1}r_{E,l′}|`, `v(t) < 0` above `l`, `> 0` above `l′`), 1197–1215 (`F′ ∩ F^avoid₂ = ℚ`, `F′ ∩ F^avoid F^avoid₂ = F`), 1299–1312 (p. 26: `L′LF^suff(ζ_N) ∩ F^avoid = ℚ`). Matches, including the README's remark that disjointness over `ℚ` holds for `K`, not `F′`.
- Flagged-unverified locators: the manifest flags none; the six `uncertified` entries (Lewis, Katz–Messing, Kisin, Katz ESDE, Artin, Zalesskii–Serezhkin) are settled and cited by locator.

**Adversarial pass** (values computed on each side; sampled targets, headlines and the targets touched by findings).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.3 / `levelt_rigidity` | `n = 0`; `n = 1`, `A∞ = α`, `A₀ = β⁻¹`; rank-zero displacement; `n = 2` without coprimality | `n = 0`: all groups trivial, conclusion holds; `n = 1`: coprime iff `α ≠ β`, `g = 1`; rank 0 forces `A∞ = A₀⁻¹`, so `p = q`, coprime only for `n = 0`; `(1,1)` vs `(1,J)`: all charpolys `(X−1)²`, displacements of rank `0`, `1`, `1` not conjugate to `J` | true; coprimality needed | R01 (ownership) |
| §0.2 companion difference | `p = (X−1)²`, `q = (X−2)(X−4)`; `p = q` | `C(q)C(p)⁻¹` fixes `e₂`, first column differs since `p ≠ q`; `p = q` gives `0` | rank exactly one needs `p ≠ q` | none |
| §0.5 orders | `n = 1`, `n = 2`, `q = 3` | `#U₁(𝔽₉) = q+1 = 4`, `#SU₁ = 1`; `#SU₂(𝔽₉) = 3¹(3²−(−1)²) = 24 = #SL₂(𝔽₃)`; `n = 0`: no multiplier | consistent | none |
| §0.7 | `𝔽₉ = 𝔽₃[i]` | `N(i) = i⁴ = 1`; `N(1+i) = (1+i)⁴ = (2i)² = −4 ≡ 2 = −1` | `diag(1,1) ≅ diag(1,−1)` | none |
| §0.9, §0.10 | `PSL₃(𝔽₃)`, `PSL₂(𝔽₁₁)`, `PSL₂(𝔽_{3^r})` | `27·8·26 = 5616`; `11·120/2 = 660`; `3^r(3^{2r}−1)/2 = 12, 360, 9828, 265680` for `r = 1..4` | `660` never attained | none |
| §1.1 | `l = 3`, `s = 4`, `N = 35`; `l = 2`, `N = 7` | `ord_35(3) = 12`, `3⁶ ≡ 29 ≢ 34`; `ord_7(2) = 3` odd | both Checks hold | none |
| §1.4 `qianIndexSet` | `(N, n) = (401, 3)`, `(501, 4)`; Qian's displayed vector for `(401, 3)` | `{1, 2, 398}`, sum `401 ≡ 0`; `{1, 2, 3, 495}`, sum `501 ≡ 0`; the displayed vector has `401` entries, sum `≡ 0`, `398 = N − n` distinct values, index set `{1, 2, 398}` | definition and vector agree; for `n ≤ 3` odd or `n ≤ 4` even `range (n−3)`, `range (n−4)` are empty, so the set is `{1,2,−3}` or `{1,2,3,−6}`, used only for `n > 2` | none |
| §1.4 `selfDualIndexSet` | `(7, 2)`, `(5, 2)`, `(7, 4)` | `{3,4} = −B`, sum `0`; `{2,3} = −B`; `{2,3,4,5} = −B`, sum `14 ≡ 0` | self-dual, sum zero | none |
| §1.4 non-zero-shaped datum | `N = 5`, `a = (1,1,2,2,4)` | sum `10 ≡ 0`, three values, `B = {0, 2}`, sum `2` | rank-two datum, not zero-shaped | none |
| §1.5 stabiliser | `B = {1,2,398}` mod `401` | `2B = {2, 4, 395}`, `−B = {3, 399, 400}` | `≠ B` | none |
| §2.1 Fermat count | `N = 3`, `N = 5` | `(8−2)/3 = 2`; `(1024−4)/5 = 204` | `b₃` of the Fermat quintic | none |
| §2.4 twist | fibre dimension `N − 2` | `H^{2N−4} = O(2−N)`, weight `2(N−2)`; printed `1 − N` gives weight `2N − 2` | `2 − N` | source issue |
| §3.5 weight of `Ψ` | `N = 401`, `n = 3`; misprinted twist | `(N−2)−(n−1) = 397`; `Ψc(Ψ)` weight `2·397 = 794 = 2(N−n−1)`; with `1−N`: `ε^{n−N}` of weight `2(N−n) = 796` | `ε^{n+1−N}` | source issue |
| §4.5 companions | `n = 3`, `n = 2` | `(X−1)³ = X³−3X²+3X−1`, last column `(1, −3, 3)ᵀ`; `C((X−1)²) = [[0,−1],[1,2]]`, det `1`, trace `2` | match | none |
| §5.1 / `qian_hypergeometric_group_eq_SL` | `N = 401`, `l = 5, 3, 7, 11` | `ord(5) = 25` odd, `−1 ∉ ⟨5⟩`; `ord(3) = 400`, `3^{200} ≡ 400 = −1`; `ord(7) = ord(11) = 200`, `7^{100} ≡ 11^{100} ≡ −1` | `l = 5` in §5.1, `l = 3, 7, 11` in §5.3 | none |
| §5.2 / `selfDual_hypergeometric_group_conj_Sp` | `l = 3`, `N = 7`; `m = 2`, `N = 7` | `ord_7(3) = 6`, `3³ ≡ 6 = −1`, so `𝔽₃(ζ₇) = 𝔽_{3⁶}`, `𝔽₃(ζ₇+ζ₇⁻¹) = 𝔽_{3³}`; `B = {2,3,4,5}`, sum `0` | field of definition `k ⊊ 𝔽_l(ζ)` | none |
| §5.3 / `qian_hypergeometric_group_conj_SU` | `σ` with `σζ = ζ⁻¹` | `(σ(h₀)ᵀ)⁻¹` has eigenvalues `σ(ζ^b)⁻¹ = ζ^b`; `(σ(h∞)ᵀ)⁻¹` unipotent; Levelt applies | invariant Hermitian form exists | none |
| §5.4 / `qian_two_prime_hypergeometric_group` | `l₁ = 5`, `l₂ = 3209` | `3209 = 8·401+1` prime, smallest prime `≡ 1 (mod 401)`, `3209 ≡ 2 (mod 3)`, cubing bijective on `𝔽_{3209}^×`; composition factors `PSL₃(𝔽_{5^{25}})` vs `PSL₃(𝔽_{3209})` | product by Goursat | none |
| §5.6 binary icosahedral exclusion | `SL₂(𝔽₅)`; companion pair over `𝔽₉` for `N = 5` | orders of products of two order-3 elements `{1,3,4,6,10}`; `⟨B⁻¹, A⟩` has order `720`, `ord B⁻¹ = 5`, `ord A = 3`, `ord BA⁻¹ = 3` | exclusion holds, Check too narrow | R06 |
| §5.11 degree | `n = 3`, `l = 7` | `7³(7²−1)(7³−1) = 5630688` | matches | none |
| §6.2 / `zeroShaped_gauss_product` | `n = 0` (`a` a permutation of `(0,…,N−1)`); `a = 0` (`n = N−1`); `N = 1`; even `N` | `B = ∅`, both sides `1`; left `∏_{b≠0}g(b)^N`, right `(∏g(b))^{N−1}q^{(N−1)/2}` with `∏_{b≠0}g(b) = q^{(N−1)/2}`; `N = 1`: `n = 0`, `B = ∅`, `1 = 1`; `N = 2`: `g(1)² = χ(−1)q` may be `−q` | identity holds for odd `N`; `n(N−n)` even since `N` odd; `N − n ≥ 1` from `card_zero`, no truncation | none |
| `qianGauss` at `0` | nontrivial `ψ` | `gaussSum 1 ψ = ∑_{a≠0}ψ(a) = −1`, so `g(0) = 1` | docstring right | none |
| §6.4 self-dual | `n = 2` | `q^{2(N−4)/2}(g(b)g(−b))² = q^{N−4}q² = q^{N−2}`, `N − 2` odd | `√q ∈ 𝔽_{l²}` needed | none |
| §6.5, §6.6 | `k = 𝔽₇`, `m = 3`; `k = 𝔽₅`, `m = 3`; `n = l = 3` | `(𝔽₇^×)³ = {1, 6}`, `3 ∉`; `μ₃ ⊄ 𝔽₅`; `3 ∤ #𝔽_{3^r}^×` | published `n | #k^×` impossible for `l | n` | source issue |
| §6.7 | `N = 401`, `n = 3` | `(N−2n−1)/2 = 197` | integral exponent | none |
| §7.2 grades | self-dual `N = 5`, `n = 2`; `N = 7`, `a = (0,0,0,1,3,5,5)` | `a+2 = (3,2,2,2,1)`: `10/5−1 = 1`; `a+3`: `15/5−1 = 2`; `(N−n−3)/2 + #{b ≤ i} = 0+1, 0+2`; non-zero-shaped: `B = {1,3,5}`, sums `21, 21, 28`, grades `2, 2, 3` | consecutive iff zero-shaped | none |
| §7.9 sign | `n = 3` | `(θ_τθ_{cτ})³ = ε̄⁻³`; `ε̄³ = ε̄⁻³` iff `(l−1) | 6` iff `l ∈ {3, 7}` | differ for `l ≥ 5`, `l ≠ 7` | source issue |
| §8.5 counterexample | rank two, `φe₁ = pe₁`, `φe₂ = p²e₂`, `Ne₂ = e₁`, jumps `0, 3` | `t_H = 3 = t_N`, `N` maximal, monodromy flag `⟨e₁⟩` has jump `0` but weight of `e₁` is `1` | consecutive weights needed in QIAN21 Lemma 4.2 | source issue |
| §9.1 disjointness | `F₀ = ℚ(√6)`, `L₁ = ℚ(√2)`, `L₂ = ℚ(√3)` | each `∩ F₀ = ℚ`, `L₁L₂ ⊃ F₀` | second avoidance field must contain `L₁` | none |

**Principles.** No route-specific shortcut (the hypergeometric sheaves are Katz's general construction; the Dwork data are specialisations; the general character case of §8.6 is stated with its hypotheses); nothing re-plans an existing roadmap on main; the only overlap is R01; no computational algorithm (the Lucas-theorem polynomial of §7.13 is a mathematical statement); no copied passages (locators only); no sorry'd data, no `set_option`. Process residue: none (no pull-request numbers, dates, paths, LaTeX delimiters, "removed"/"deferred"/"optional"). Shape: layers 0–9 each end with `### Examples` and `### Dependencies`; every definition has an API list and at least three Checks; every theorem has a locator and a `*Needs:*` line.

**Ownership against open pull requests.** Checked by object (`roadmaps grep` over the 453 open pull requests and main): the Dwork pencil, its eigensheaves, Katz's hypergeometric sheaves and the switching theorems have no other owner; Levelt's theorem has (R01). The downstream consumers named in the README (PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, KloostermanSheavesAndBesselIsocrystals) exist as board packages or open pull requests and are not cited as suppliers.

## Not verifiable

- Katz, *Exponential sums and differential equations*, Theorems 8.4.2 and 8.12.2 (uncertified, paywalled book): the local-monodromy and determinant statements of §§3.2–3.3 are cited through BCGNT25 Theorem 4.2.1 and BLGHT11 Lemma 4.3 as the manifest records; which theorem number BLGHT's "8.4.11" denotes could not be checked (R05).
- Zalesskii–Serezhkin, main theorem (uncertified): the form applied in §0.11, including the `n = 2`, characteristic-3 exception `SL₂(𝔽₅)`, is taken from Qian and BLGHT as cited; the exclusion of the exception for the self-dual family was verified by computation (`720`).
- Artin, Theorem 2; Lewis §4; Katz–Messing Theorem 2; Kisin Theorem 5.1 (uncertified): cited by locator.
- Deligne, *Hodge cycles on abelian varieties* I.7 (Propositions 7.4, 7.6, 7.10), A'Campo (Definitions 2.1.1–2.1.2, Proposition 2.5.7), Berger §1.3 and Théorème 3.2.1, Caraiani–Emerton–Gee–Savitt Lemma 1.4.1, Allen et al. Lemma 7.1.8 and Corollary 7.2.4: cached but outside the seeded sample, not opened in this round.

## Source issues

- **Error** in BCGNT25 at Lemma 4.2.4, printed pp. 41–42: the source says the duality is `V_{c(λ)} ≅ V_λ^∨(1 − N)` and `Ψc(Ψ) = |·|^{N−n}`; it should be the twist `2 − N` (the fibres have dimension `N − 2`), giving `Ψc(Ψ)` of absolute value `q^{N−n−1}` at `Frob_v`; affects a stated result.
- **Error** in BCGNT25 at Lemma 4.4.4, printed p. 48: the source says `W̄_{0,λ} ≅ ⊕ ω_τ^{i−1}ω_{cτ}^{n−i}` with `ω_τ = τ∘Art⁻¹`; with its conventions `HT(ε) = −1` and geometric Artin map the exponents must be negated (compare BLGHT11 Lemma 5.3(5)); affects a stated result.
- **Misprint** in BCGNT25 at §4.1, definition of `V_λ`, printed p. 40: the source says `V_λ = (π[1/l]_*O_{M_λ})^{H₀=χ}`; it should be the degree-`(N−2)` higher direct image; affects nothing.
- **Misprint** in BCGNT25 at Definition 4.3.1, printed p. 45: the source says `SU_n(𝔩)` is the kernel of the multiplier; the group used in Proposition 4.4.2 and Lemma 5.2.3 is `U_n(𝔩) ∩ SL_n(𝔩)`; affects nothing.
- **Misprint** in BCGNT25 at Remark 4.3.3, printed p. 45: the source says the scaled form satisfies `⟨x, y⟩ = −c⟨x, y⟩`; it should be `⟨y, x⟩ = −c⟨x, y⟩`; affects nothing.
- **Misprint** in BCGNT25 at proof of Proposition 4.2.6, printed p. 45: the source says the base-`q_v` expansion ends in `r_d q_v^{d−1}`; it should be `r_{d−1} q_v^{d−1}`; affects nothing.
- **Gap** in BCGNT25 at proof of Proposition 4.2.5(1), printed pp. 42–43: the source says Katz–Messing on the untwisted cohomology gives `Q_v ∈ O_M[X]`; integrality at places above the residue characteristic of `v` also needs the twist `Ψ_λ(Frob_v)⁻¹`, a non-unit there in general, and follows from weak admissibility at those places; affects the proof.
- **Error** in QIAN23 at proof of Lemma 3.8 (published Lemma 3.9), arXiv v1 p. 18: the source says take `σ ∈ G_{ℚ_l(ζ_N)⁺}` with `σ(ζ_N) = ζ_N⁻¹` and `σ(ζ_p) = ζ_p`; such `σ` need not exist (for instance `l ≡ 1 mod N`); `g(b)g(−b) = q` is rational directly; affects the proof.
- **Error** in QIAN23 at §4, arXiv v1 p. 22: the source says assume `n | #(k(λ)^×)`; this is impossible when `l | n`; Lemma 2.1 needs only the `m`-th roots of unity for the prime-to-`l` part `m` of `n`; affects the proof.
- **Misprint** in QIAN23 at §4, arXiv v1 p. 22: the source says `det Sym^{n−1}r_{E,l′} = χ_cyc^{n(n−1)/2}`; with `r_{E,l′} = H¹_ét(E, 𝔽_{l′})` the exponent is `−n(n−1)/2`; affects nothing.
- **Gap** in QIAN23 at proof of Lemma 3.3(2), arXiv v1 pp. 13–14: the source says the semistable model over the `T`-line makes the monodromy unipotent; that argument concerns the monodromy around `T = 0` on the Dwork line, which is `ρ_{t′}(γ∞)^{±N}`, not `ρ_{t′}(γ∞)` itself; affects the proof.
- **Gap** in QIAN23 at Proposition 3.2, arXiv v1 p. 13: the source says local freeness follows from smoothness and properness; local freeness of the integral sheaf also needs torsion-freeness of the fibre cohomology; affects the proof.
- **Misprint** in QIAN23 at proof of Theorem 1.4, arXiv v1 p. 26: the source says the Galois closure of `F^{ker r}(ζ_l)` is linearly disjoint from `F′` over `ℚ`; both contain `F`, and the computation shows it for `L′LF^suff(ζ_N)`; affects nothing.
- **Error** in QIAN21 at Lemma 4.2, arXiv v1 p. 20: the source says a semistable representation with maximally nilpotent `N` at every label is regular ordinary; BLGHT11 Lemma 2.2(2), which it invokes, also requires the filtration jumps `0, …, n−1` (a rank-two counterexample with jumps `0, 3` is in the README); affects the proof.
- **Gap** in BLGHT11 at proof of Lemma 4.1(2), printed p. 27: the source says local freeness need only be checked on the fibre at `0`; the integral sheaf is locally free only given torsion-free fibre cohomology; affects the proof.
- **Misprint** in BLGHT11 at proof of Lemma 4.3(2), printed p. 30: the source says `H^{n−1}(Y_t(ℂ), ℤ)`; the degree is `N − 2`; affects nothing.
- **Gap** in BLGHT11 at proof of Lemma 4.6, printed pp. 32–33: the source says the classification gives `SL_n(k)`, `Sp_n(k)` or `SU(n,k)`; for `n = 2` in characteristic `3` the list also contains `SL₂(𝔽₅) ⊂ SL₂(𝔽₉)`, which the proof does not exclude; it arises only for `N = 5`, where the companion pair generates `SL₂(𝔽₉)` (order `720`); affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8a017ba7edeb05ff48745c262ebc891578dd2b0e", "job": "REV-PKG-PotentialAutomorphyDworkMotivesPartII", "model": "fable", "worker": "chris-x9"} -->
