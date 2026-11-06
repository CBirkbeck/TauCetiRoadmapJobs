# Review of AutomorphicBundlesPartII (pull request #1823 at 6787f01)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/AutomorphicBundlesPartII/README.md` and `TauCetiRoadmap/AutomorphicBundlesPartII/Suggested.lean` at 6787f016. The gate passed every check (build=0, depcheck=0, outside-folder=0). The seeded source sample (15 targets) was read at its locators in the cached texts; every cross-roadmap citation was resolved at its head or on main; the three Lean declarations were elaborated and probed. Four findings, two of them blocking.

## R01 (P2) — The G→G₁ direct-factor descent is narrowed by a hypothesis the source does not need

**Location.** `README.md` Conventions (line 31: "impose p∤#Δ(K^p) and use the compactified direct-factor descent of §5.0"), §5.0 (line 873: "prove the compactified direct-factor comparison under p∤#Δ(Kᵖ)"; line 881; the Check at line 888: "At p=2 the denominator is absent; the hypothesis rejects this argument"), §5.13 (lines 1106, 1110: "For the G₁ quotient model impose p∤#Δ(Kᵖ)").

**Claim.** The splitting of RΓ(X^{G₁},ω^κ) and RΓ(X^{G₁},ω^κ(−D)) as direct factors of the G-model cohomology, and hence the hyperspecial integral Hecke relations on the G₁ model, hold only when p does not divide the order of the component stabilizer Δ.

**Witness.** BCGP21 Proposition 3.8.3 (b4cc8b01 lines 2655–2659, printed p. 219) splits both pullbacks in D(ℤ_p) with no hypothesis on p; its proof uses Lemma 3.8.5 (lines 2696–2703, printed pp. 220–221): for a finite étale cover with any finite group G, f_*O_T = O_S ⊕ I_G ⊗_{ℤ[G]} f_*O_T, checked étale-locally where f_*O_T = O_S[G] and ℤ[G] = ℤ·e ⊕ I_G as abelian groups. Lemma 3.5.3 (line 2480, printed p. 214) gives freeness of the Δ-action on the compactification X_{K,Σ}, so X_{K,c} → X^{G₁}_{K,π(c)} is finite étale with group Δ(Π₀) on the compactified model (line 2687). Proposition 3.9.15 (lines 3106–3117, printed pp. 231–232) then restricts to the G₁ direct factor with no condition on p. Instance where the README's hypothesis fails but the statement holds: the trivial C_p-torsor over 𝔽_p, where 𝔽_p[C_p] = 𝔽_p·e ⊕ I_{C_p}⊗𝔽_p although p = #Δ. The README's route (averaging idempotent (1+σ)/2) is a different argument from the source's and is the only reason for the hypothesis.

**Repair.** Delete the hypothesis p∤#Δ(Kᵖ) from Conventions, §5.0 and §5.13. In §5.0 state the direct-factor comparison for every reasonable level: the finite étale Galois cover of compactified models (BCGP21 Lemma 3.5.3) and the augmentation-ideal splitting O_S ⊕ I_Δ⊗_{ℤ[Δ]} f_*O_T ≅ f_*O_T (Lemma 3.8.5) give RΓ(X^{G₁},F) as a Hecke-stable direct summand of RΓ(X_K, f^*F) for F = ω^κ and ω^κ(−D). Replace the averaging Check by: the trivial C_p-torsor over 𝔽_p splits as 𝔽_p·e ⊕ I⊗𝔽_p[C_p] although p = #Δ; an averaging projector would need 1/p and is not the construction. Keep the Check that open freeness alone does not certify boundary descent (that is exactly what Lemma 3.5.3 supplies). Use BCGP21's names Δ(Π₀) for the component stabilizer and Δ(K^p) for the geometric-component stabilizer (lines 2317–2318) rather than a single Δ(Kᵖ).

## R02 (P2) — Case (c) of the rational exclusion cites the wrong realization and misses the Maass dihedral subcase

**Location.** `README.md` §7.0, line 1374: "in case (c), μ|·|^(1/2)⊞μ|·|^(−1/2) with μ induced from a quadratic extension of ℚ, the same comparison forces a=2 and μ of infinitesimal character (1,1), a weight-one form up to the twist |·|" and "(... the weight-one gap for case (c), class-field characters for the character summands)"; the WeightsInEtaleCohomology contract at line 133; §8.7's proof route at line 1544.

**Claim.** The reducible spin system in case (c) is built from the classical weight-one realization (gap:classical-weight-one-realization), μ being a weight-one eigenform up to twist.

**Witness.** The infinitesimal-character comparison gives μ_∞⊗|·|⁻¹ infinitesimal character (0,0). A cuspidal GL₂ representation of orthogonal type is Ind of a Hecke character ψ of a quadratic field K, and (0,0) forces ψ of finite order; the holomorphic weight-one case is K imaginary quadratic or K real quadratic with ψ_∞ of mixed sign, while K real quadratic with ψ_∞ ∈ {(1,1),(sgn,sgn)} gives an even Maass form of eigenvalue 1/4, also of infinitesimal character (0,0). CG20 (fff30587 lines 2140–2142, p. 54) and BCGP21 Lemma 2.9.1 (b4cc8b01 lines 1855–1859, p. 198) say only "orthogonal type, induced from a quadratic extension" and "μ is certainly algebraic"; neither says weight one. In both subcases the attached Galois representation is Ind_{G_K}^{G_ℚ} of the finite-order character given by class field theory, twisted by the cyclotomic character; no weight-one modular realization is needed, and the weight-one theorem does not cover the Maass subcase at all.

**Repair.** In §7.0 case (c), realize the reducible system as Ind of the finite-order Hecke character of the quadratic field (class field theory as already cited for the character summands, with ArithmeticGaloisRepresentations §1.12 for induction), covering both the weight-one and the Maass dihedral forms; delete "a weight-one form up to the twist |·|" and "the weight-one gap for case (c)". Keep gap:classical-weight-one-realization only where a genuine weight-one Klingen boundary term needs it (§8.2's nerve terms), and say so there; if no target needs it, delete the gap from the README and from `design/plan.json`.

## R03 (P3) — `GSp4ClassificationInputs` is not a name of EndoscopicTransferAndUnitaryTraceComparison

**Location.** `README.md` lines 121, 1376, 1380, 1444, 1540, 1546, 1573, 1579, 1607: "EndoscopicTransferAndUnitaryTraceComparison §11.1, under its `GSp4ClassificationInputs`".

**Claim.** The supplier's §11.1 carries a hypothesis package of that name.

**Witness.** The supplier README at its head (#999) contains no occurrence of `GSp4ClassificationInputs`; its §11.1 (line 4440) states its hypotheses as "the symplectic classification contract of §§11.0g–11.0h" (headers at lines 4409 and 4423). The name occurs only in ModularityAndLanglandsExtensions (which coined it) and in this README; the citation tool does not flag it because of that sibling.

**Repair.** Replace every `GSp4ClassificationInputs` by "the symplectic classification contract of EndoscopicTransferAndUnitaryTraceComparison §§11.0g–11.0h" (unbackticked), or cite §11.1 together with §§11.0g–11.0h in each *Needs:* line.

## R04 (P3) — Three page locators are off by one

**Location.** `README.md` §2.3 (line 391): "CG18, Lemmas 7.5–7.7, pp. 397–398"; §1.6 (line 325): "CG18, §7.2, pp. 395–396, 399–400"; §6.4 (line 1253): "H90, Theorems 2.4.4 and 2.7, pp. 57–58".

**Witness.** In the cached CG18 (c0ba8de0; marker page N is printed page N+296) Lemma 7.5 starts at line 4001 on printed p. 396 and Lemma 7.7 at line 4058 on p. 397; the Verdier-duality statement Hⁱ(Y,(f*F)_A) dual to H^{d−i}(Y,Hom(f*F,ω_Y)_A) is at lines 4100–4101 on p. 398 and its derived form at lines 4122–4123 on p. 399. In the cached H90 scan (ead5b841) Theorem 2.7 is at line 2267, after the page header "59" at line 2262.

**Repair.** §2.3: "pp. 396–398". §1.6: "pp. 395–396, 398–400". §6.4: "Theorem 2.4.4, p. 57; Theorem 2.7, Proposition 2.7.2 and (3.0.1), p. 59".

## Verified sound

**Gate.** All checks pass at 6787f016 (`gate.md`): set_option=0, sorry-data=0, imports=0, depcheck=0, outside-folder=0, build=0. The dependency check run by this review: `depcheck: 240 roadmaps, 2309 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap is listed in the merge order (line 245) after AutomorphicBundles (line 170); every roadmap it cites is on main (EnhancedDerivedSheaves, DerivedModuleAlgebra, AlgebraicVectorBundles, ReductiveGroups, SchemeAndStackFoundations) or earlier in the order. `git diff --stat origin/main...HEAD` outside the folder: empty.

**Lean.** `lake env lean` on `Suggested.lean`: the only diagnostic is the `sorry` warning at line 73. A probe copy with `#check @` for the three declarations and 14 library names elaborated; the elaborated types equal the README statements: `dvrCoefficientRing O ϖ n = O ⧸ Ideal.span {ϖ^n}`; `integerCoherentCohomology R X F i` is the base-linear `ModuleCat R` for `0 ≤ i` and zero otherwise; `finiteCoefficientSerreDuality` quantifies over `[IsDomain O] [IsDiscreteValuationRing O]`, `Irreducible ϖ`, `n : ℕ`, `X` over `Spec (O/ϖ^n)` with `SmoothOfRelativeDimension d` and `IsProper`, `F` locally free of finite presentation, `i : ℤ`, exactly the README §1.6 hypotheses (no section binder lost). One-tactic probe on the theorem (`first | rfl | simp | infer_instance | exact ⟨LinearEquiv.refl _ _⟩`): does not close; not padding. The two definitions are needed to state it. Library names checked at the pin: `Scheme.Modules.cohomologyBaseModule` (Base.lean:45), `cohomologyMapBaseLinear` (:57), `cohomologyZeroBaseLinearEquiv` (:110), `cohomologyZeroBaseLinearEquiv_naturality` (:127), `TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyδBaseLinear` (LongExactSequence.lean:242, namespace TauCeti.AlgebraicGeometry.Scheme.Modules), `SheafOfModules.exteriorPower` (ExteriorPower/Basic.lean:60), `Scheme.relativeDifferentials` (Differentials/Basic.lean:85), `Scheme.Modules.instMonoidalClosed` (TensorProduct.lean:66), `Cohomology` (Cohomology/Basic.lean:61), `cohomologyFunctor` (:66), `cohomologyZeroEquiv` (:80), `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.cohomologyOneDualEquivCohomologyZero` (WeilDivisor/Scheme/SerreDuality.lean:113), `CochainComplex.isKProjective_of_projective` and `CochainComplex.IsKProjective.Qh_map_bijective` (types as the README states). All exist with the stated hypotheses.

**Headlines.** The docstring lists 14 headlines; 13 need Shimura-variety, solid six-operation or automorphic carriers absent at the pins, and nothing is stated in their place. The one statable headline is stated.

**Source sample (each read at its locator).**
- 1.5: CG18 line 3981 (p. 395) defines H_i as the dual of Hⁱ(E*⊗ω⊗O/ϖⁿ); lines 3985–3999 (p. 396) explain the E/O-coefficient Pontryagin dual; CG20 lines 1991–1996 (p. 51) the same for X_Δ(Q). Matches.
- 2.1: CG18 lines 4048–4057 (p. 397): affine cover, Čech complex of O-flat O[Δ]-modules with terms N⊗_A B. Matches, including infinite O-rank of terms.
- 2.3: CG18 Lemma 7.5 (line 4001), 7.6 (4035, Δ any finite abelian group), 7.7 (4058, flat O-algebras, Nakajima for k[Δ] local, hence Δ a p-group). Matches apart from the page slip in R04.
- 2.4: CG18 lines 4073–4082 (p. 398): bounded projective R/ϖⁿ complex, replacement by a perfect C_n^∨ (Mumford II.5 Lemma 1), dual chain complex C_n with homology H_i(Y,E⊗O/ϖⁿ); lines 4119–4136 (pp. 399–400) the derived lift. Matches the README's convention choice.
- 5.0: BCGP21 Definition 3.3.3 (line 2091, p. 204); §3.3.1 line 2072 fixes p totally split; Theorem 3.5.1(4) (lines 2443–2446, p. 213): smooth iff K_v hyperspecial at all v|p and Σ smooth; Prop. 3.8.3 and Lemma 3.8.5 (see R01); §3.9 lines 3030–3056 (pp. 229–230): EO filtration, affine strata images, lci thickenings by Hasse powers, Koszul systems; Lemma 3.9.12 (line 3057).
- 5.7: CG20 lines 1220–1222 (p. 30): ω(a,b)^∨⊗det Ω = ω(3−b,3−a)(−1); Appendix A.3.2 lines 3394–3396 (p. 88): Serre duality Hecke-equivariant up to a cyclotomic twist. Matches.
- 5.9: CG20 Definition 6.3 (lines 1458–1466, p. 36): N(κ) with vanishing for t≥N, i>0, Z∈{X,X₀(Q),X₁(Q)} and the two surjections; p. 43 (lines 1697–1700) uses t≥N(κ). Matches, including "no bound uniform over all levels".
- 5.11: BCGP21 Lemma 3.9.12 (lines 3057–3060, p. 230), proof by the Ext/Koszul description of the Cousin terms. Matches; the regularity input the README isolates in §5.0 is the implicit step.
- 5.15: BCGP21 lines 3261–3267 (p. 236): non-Eisenstein via the degree-four polynomial X⁴−T₁X³+(qT₂+(q³+q)T₀)X²−q³T₀T₁X+q⁶T₀²; CG20 Lemma 7.10 (lines 2021–2054, pp. 52–53) holds in all weights and prime-to-p levels. Matches.
- 5.16: P20 lines 4952–4963 (p. 108): localized groups through ℚ_p≅ℂ and characters congruent to Θ_m. Matches.
- 6.2: Su24 Proposition 3.14 (line 1549, p. 36), Proposition 3.16 (line 1560, p. 37); §1.1 line 260 is condition (∗) on A_G, line 355 defines p_o = p_h ∩ m_G. Matches.
- 6.3: Su24 Proposition 4.1 (line 1609, p. 38), Lemmas 5.1–5.5 (lines 2396–2450, pp. 53–54), Theorem 5.7 (line 2456, p. 55). Matches.
- 8.4: BCGP21 lines 3349–3357 (p. 238): Satake H_{G₁}→H_{M_W}→ℂ[X_*(T)], boundary system ρ_π⊕(ρ_π⊗χ); the displayed monomial list has a misprint (see Source issues) that the README already corrects; P20 p. 109 lines 4974–4983. Matches.
- 8.5: BCGP21 Lemma 3.10.7 (lines 3314–3357, pp. 237–238): point/curve decomposition of ∂X*, parallel scalar case via π_*O_D=O_∂, π_*I_D=I_∂, R¹π_*I_D=0, BR16 Prop. 1.5.8 for the non-parallel vanishing; BR16 Theorem 1.12 (line 523, p. 10) and Proposition 1.14 (line 579, pp. 11–12). Matches.
- 8.9: BCGP21 Corollary 3.10.5 (lines 3302–3309, p. 237): h¹ = l₀·h⁰ under (2); CG20 Theorem 7.11 proof (lines 2167–2187, p. 55); P20 Proposition 15.2.4.1 (lines 4986–4991, p. 109). Matches.
Also read: CG20 Theorem 5.1 and its proof (lines 931–1009, pp. 22–24: |μ|_L=a+b, representation-small iff a+b<p−3, Levi bound a−b+1≤p, substitutions ẽ₁,ẽ₂,ẽ₃), Theorem 5.2 (p. 25), Lemma 5.4 (p. 27), Theorems 5.5–5.6 (pp. 28–29), Remarks 5.10/5.12 (pp. 33–34), Corollary 5.8 (pp. 30–31); P20 §5.3 (lines 1084–1085, p. 25: T_{ℓ,2}=ℓ⁻³T′, T_{ℓ,i}=ℓ⁻⁶T′), Remark 4.3.3 (p. 19); LanSuh Prop. 7.21, Thm 7.22, Cor. 7.24 (lines 2012–2073, pp. 41–43); Lan17 Cor. 6.7 (line 1163), Def. 8.5 and Thm 8.6 (lines 1488–1516, p. 34); HZ01 (3.2.4) line 2694 and (3.2.8) line 2729 (p. 62), Cor. 3.2.9 line 2734 (p. 63); CS19 Def. 9.1 (line 2318, p. 62), Thm 9.8 (line 2449, p. 65), Prop. 11.2, Def. 11.3, Prop. 11.4 (lines 2795–2826, pp. 73–74); Sch15 Cor. V.1.7 (line 3089, p. 83); EDS E1.9 statement on main (termwise flat over the target, proper support) as the README describes it.

**Adversarial table.**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.6 / `finiteCoefficientSerreDuality` | A=ℤ/9, X=ℙ¹_A, F=O, d=1 | i=0: Hom(H⁰(Ω),A)=0 and H¹(O)=0; i=1: Hom(H¹(Ω),A)=Hom(A,A)=A and H⁰(O)=A | true both degrees |
| same | A any O/ϖⁿ, general X | RHom_A(RΓ(F^∨⊗ω)[d],A)≃RΓ(F) by SSF §2.20 duality + ω=Λ^dΩ; A self-injective so H^{−j}RHom(C,A)=Hom(H^j C,A); gives Hom(Hⁱ(Hom(F,ω)),A)≃H^{d−i}(F) | true; direction and shift as stated |
| same, degenerate | n=0 (A=0, X=∅); d=0, X=Spec A⊔Spec A; i<0; i>d | both sides 0; A²≃Hom(A²,A); Dual(0)=0 vs H^{d−i}=0 (d−i>d); Dual(Hⁱ)=0 vs H^{<0}=0 | true; vacuous at n=0 as README says |
| §1.4 `dvrCoefficientRing` Checks | O=ℤ₃, n=1,2,0 | 𝔽₃; ℤ/9 with 3≠0, 3²=0; O/(1)=0 | true |
| §1.5 A_n≃Hom_O(A_n,E/O) | O=ℤ₃, n=2 | 1↦1/9 generates (ℚ₃/ℤ₃)[9]≅ℤ/9 | true |
| §1.5 δ-action on functionals | 𝔽₅, δ=2, λ(1)=1 | (δλ)(1)=λ(δ⁻¹·1)=3; ⟨δλ,δ·1⟩=3·2=6≡1; wrong model 2·2=4 | Check correct |
| §1.1 polarization law | g=1, ψ₁=2,4, c=3 | ψ₂=3/2, 3/4; ψ₁ψ₂=3; wrong model 9/4·4=9≠3 | Check correct |
| §1.2 left translation | m=P_(123)∈GL₃, f=m₂₁, m′=1 | f(m)=1; wrong formula f(m⁻¹)=(P_(132))₂₁=0 | Check correct |
| §1.3 / §4.1 central scalar | (a,b)=(5,2), x=2; (4,2) | 2⁷=128, ν(2I₄)=4, 4⁻³·128=2; (4,2): 64/64=1; ν³ gives 8192 | Checks correct; agrees with CG20 Remark 5.12 (x^{a+b−6}) |
| §2.2 étale Galois freeness | trivial C₂-torsor over 𝔽₂ | 𝔽₂×𝔽₂ free rank 1 over 𝔽₂[C₂] on (1,0); trace (1,0)↦1 | Check correct |
| §2.3 flatness hypothesis | Δ=1, N=O/ϖ, n=2 | (N)/ϖ²=k, not free over O/ϖ² | negative control correct |
| §2.5 Tor edge sequence | R=𝔽₂[t]/t², C=[R→R] (t) | H₁=H₀=k; C⊗k zero differential; Tor_i^R(k,k)=k ∀i; H₁(C⊗k)→Tor₁=k iso, so H₁⊗k→H₁(C⊗k) is 0 and Tor₂=k→H₁⊗k=k iso | Check correct, Tor₂ term needed |
| §1.4/§5.9 reduction | [O→O] by ϖ | H⁰=0,H¹=k; reduced: H⁰=H¹=k; 0→k not surjective | Check correct |
| §3.9 transpose | Bl_pt ℙ², F=G=O | b^!O=O(E); coker(O→O(E))=O_E(−1), H⁰=H¹=0; Rb_*O=O; action 1 on H⁰ and on H²(ω) | Check correct |
| §3.9 closed point | i:Spec k→𝔸¹, G=O[1] | i^!O=k[−1], D_XF=O[1], D_XG=O | Check correct |
| §3.9 split double cover | Spec k⊔Spec k→Spec k | trace scalar 2, transpose 2; char 2: 0=0; averaged trace would give 1 | Check correct |
| §3.10 contraction | p₂:t↦t², Z=V(t) | supports both {0}; ideals (t)⊄(t²) | Check correct (set-theoretic) |
| §3.11/3.12 completion vs local cohomology | A=k[x], I=(x) | completion k[[x]] in degree 0; H¹_{(x)}=k[x,x⁻¹]/k[x]∋x⁻¹ | Check correct |
| §3.5 coinvariants | k=𝔽₂, Δ=C₂ | k[Δ]⊗^L k=k[0]; k⊗^L_{k[Δ]}k=k in every degree | Check correct |
| §3.6 Tor-independence | O=ℤ₃, k=𝔽₃ | k⊗^L_O k = k in degrees −1,0 | Check correct |
| §4.2 derived division | F=(O/ϖ)[−1], G=O | Hom_D=Ext¹(O/ϖ,O)=O/ϖ, ϖ acts by 0; U=0 and U=1 both satisfy ϖU=0 | negative control correct |
| §4.3 spin polynomial | q=2,(T₀,T₁,T₂)=(1,3,2); q=1,(1,4,4) | X⁴−3X³+14X²−24X+64; X⁴−4X³+6X²−4X+1=(X−1)⁴ | Checks correct |
| §4.3 similitudes | diag(x,x,x,x), (1,1,x,x), (1,x,x,x²) with antidiagonal form | ad=bc: x², x, x² | Check correct |
| §5.3 Lan–Suh substitutions | p=7, μ=0, t=2 and t=1 | (β+2+t,−α+t)=(4,2),(3,1); (α+3+t,1−β+t)=(5,3),(4,2); (α+3+t,β+3+t)=(5,5),(4,4) | matches CG20 lines 992–1008 |
| §5.4 range | p=7: (3,1),(6,1),(7,1) | α+β=a−b−2 = 0,3,4; bound <4 | Check correct |
| §5.5 range | (4,2),(6,1),(7,1) | (0,0,1); (2,1,1) sum 3; sum 4 fails | Check correct |
| §5.6 range | (4,4),(7,4),(8,4) | t=b−3=1; α=a−b = 0,3,4 | Check correct |
| Worked-example substitutions | length 1,2,3 formulas | α+β = a−b−2, a−b−2, a−b; dominance ⇔ 2t≥a+b−2 (resp. a+b−4≥2t); β≥0 ⇔ t≤a−2 (resp. t≥b−1) | consistent with the three ranges |
| §5.8 | p=5 | a=4∈[4,5]; (p+1)/2=3 so a=3 only; ω(3,0) | Check correct |
| §5.16 congruence localization | T=O[t]/(t(t−ϖ)) | characters 0,ϖ both ≡ (ϖ,t); T⊗ℂ=ℂ×ℂ | Check correct |
| §6.2 relative degrees | sl₂, trivial V | dim sl₂/so₂=2, H²=ℂ; dim p_o/k_o=1, degree-2 cochains 0 | Check correct |
| §6.3 growth vectors | f(y)=y, dy/y² | (y∂_y)ⁿy=y; ∫(log y)^{−2n}dy=∞ | Check correct |
| §7.0 spin orbit | (4,2): c=−3,w=0; (5,2): w=1 | (3/2,3/2,−3/2,−3/2) sum 0; (3/2,3/2,−5/2,−5/2) sum −2 | matches CG20 Thm 5.6(2) |
| §7.0 formula | general (a,b), c=3−a−b | w=a+b−6; entries 3/2, 3/2−(b−2), 3/2−(a−1), 3/2−(a+b−3); b=2: (3/2,3/2,5/2−a,5/2−a) | agrees with CG20 p. 54 |
| §7.0 split weight (3,2;0) | w=−5 | V-coefficient (−2,−3;5); orbit (7/2,7/2,3/2,3/2), sum 10 | Check correct |
| §7.0 case analysis | a=2,3,4 | entries 3/2 and 5/2−a differ by a−1: 1,2,3 | cases (c),(d) only at a=2 |
| §7.0 case (c) | μ dihedral, inf. char. (1,1) | μ⊗|·|⁻¹ has (0,0): weight-one holomorphic or Maass λ=1/4 dihedral | R02 |
| §7.0 chambers | (3,0),(1,−1),(0,0) | {0,1},{1,2},{0,1,2,3} | Check correct |
| §7.2 families | (a,2),(a,3−a),(1,b≤1) | (a−1,0)∈C₀,C₁; (a−1,1−a)∈C₁,C₂; (0,b−2)∈C₂,C₃ | matches CG20 p. 30 |
| §7.3 bound | R_sing=5 | k=4: −λ₁=5 ok; k=3: 4 fails | Check correct; P20 prints λ₁≥R (see Source issues) |
| §8.4 Satake factorization | q=2,α=1,β=2,u=4,D=2,T₀=1 | uD=8=q³T₀; (X²−3X+2)(X²−12X+32)=X⁴−15X³+70X²−120X+64; T₁=15, 2T₂+10=70 ⇒ T₂=30, −8·15=−120, 64 | Check correct |
| §8.7 algebraicity | (a,2) | (3/2,3/2,5/2−a,5/2−a)−3/2=(0,0,1−a,1−a)∈ℤ⁴ | Check correct |
| §8.8 gaps | R_sep=3, R_gap=5: (8,4),(12,6),(8,2),(10,6) | pairings 5,7,9,2 (fail); 7,11,15,4; 7,7,7,0; k−l=4≤5 | Checks correct; AFRG §6.6 elementary condition k−l>R+2 |
| §8.8 central twist | z=2 at one place | |z|²=4, |ν(2I₄)|⁻¹=1/4 | Check correct |
| §8.9 l₀ count | 2 real places, d, m=1 | (d,2d); one place (d,d); none (d,0) | matches BCGP21 Cor. 3.10.5 |
| §5.0 G₁ descent | trivial C_p-torsor over 𝔽_p | 𝔽_p[C_p]=𝔽_p·e⊕I⊗𝔽_p[C_p] | holds with p=#Δ: R01 |

**Cross-roadmap citations resolved** (on main, or at the head named): AutomorphicBundles #1069: 5.10 `integralLeviCoefficient` (line 2040), 9.2 `siegelDualBGGComplex` (3094), 9.3 `siegelBGGGradedComparison` (3155), 12.11 `ClassicalHecke.operator` (4931), Layers 0,1,3,5,11,12; ShimuraCompactifications #1053: 4.3–4.10, 6.1–6.11, 6.16–6.17, 7.3–7.17, 7.19–7.31, Layer 1; SchemeAndStackFoundations (main): §§0.18, 1.1, 2.6–2.8, 2.18–2.21 (`cm_serre_duality`, `upperShriek_lci`, `relativeDualizingModule_smooth`, `sheafified_grothendieck_duality`), 2.23, 4.8–4.10; DerivedModuleAlgebra (main): §§0.2–0.3, 1.1.1, 1.3–1.5, 1.E.0–1.E.1, 1.M.1–1.M.2, S.1; DeformationAndDerivedPatchingAlgebra #1034: 7.1–7.10; EnhancedDerivedSheaves (main): 0.1–0.3, E1.3, E1.9 `perfect_proper_pushforward`, E2:towers, E3.2–E3.3, E5:abstract; AlgebraicVectorBundles (main): L0A–L0C; ReductiveGroups (main): 9A, 10B; ComplexComparisonPartII #848: C1.9, C2, C3.3; SmoothRepresentationsOfLocalGroups #1688: SR.0–SR.4.5; IntegralHeckeAndGaloisDeterminants #1689: 2.2–2.3, 3a.1–3a.2, 3b.1–3b.2; AutomorphicFormsOnReductiveGroups #1037: 1.1–1.3, 4.1–4.2, 5.5 `clozelPurity`, 6.1–6.7; AutomorphicSpectralTheory #925: 4.1–4.5, 4.10, 5.1–5.8, 5.7a; EndoscopicTransferAndUnitaryTraceComparison #999: §11.1 (name slip R03); ArithmeticGaloisRepresentations #856: 1.1–1.2, 1.7–1.12, 2.2, 5.1–5.3, Layer 5; WeightsInEtaleCohomology #1001: R34.5 (Layer 5), R34.6 (Layer 6); ModularCurvesPartII #913: 14.1–14.4a; HilbertModularVarietiesAndShimuraCurves #1005: R18.3.29(a) with its Normalization paragraph (line 3930) and the even-degree existence branch via Taylor (line 3931); CrystallineCohomology #857: CR.5.1–CR.5.4, CR.DDR.6.11–6.14; VStackSheavesAndLisseCategories #1230: VS2.1, VS2.2; AlgebraicModuliForArithmeticGeometry #853: §7.5 `fundamental_class_boundary` (line 9565) with the Cartier and normal-crossings hypotheses the README restates; IgusaVarietiesAndTorsionConcentration #1090: 2.12–2.13 (scope only).

**Declared gaps** (10, same slugs in `design/plan.json` and contracts in the README's supplier subsections, each with its supplier and section). Minimality checked against the supplier at its head: ReductiveGroups 10B has integral Weyl lattices but no function-realized induced lattice; SchemeAndStackFoundations §2.18 only names Tau Ceti `Scheme.Modules.Cohomology` as a need; ComplexComparisonPartII C1.9/C3.3 have no duality-trace compatibility; SR.4.5 has the spin polynomial and Galois comparison but no Klingen-Levi restriction identity; CrystallineCohomology CR.5.4 has no relative logarithmic vanishing; AutomorphicBundles 9.2–9.3 are not integral p-small; WeightsInEtaleCohomology has no weight-one realization; R18.3.29 is parallel weight only; AutomorphicSpectralTheory §5.2 is the full (m_G,K_∞) pair; AutomorphicFormsOnReductiveGroups §6.6 fixes F before its constant. All `needs` sentences are single, hypothesis-carrying statements. The README writes each contract as "What X must provide (the … contract)" without the `gap:` slug; the slugs are in `plan.json`. Whether a weight-one realization is needed at all depends on R02.

**Ownership.** Searched all open roadmap pull requests and main for coherent homology, finite-coefficient Serre duality over O/ϖⁿ, Ekedahl–Oort Cousin complexes and higher-Hida coherent cohomology: the only other occurrences are in GSp4NonregularModularityLifting #1817, which imports them from this roadmap (its lines 63, 1068). AutomorphyLiftingBeyondTaylorWiles #1824 does not touch them. SchemeAndStackFoundations §2.20 scopes its Serre duality to proper Cohen–Macaulay schemes over a field; §1.6 here consumes its duality and dualizing-module results and owns the Artinian-coefficient form.

## Not verifiable

- GK19 Remark 10.1.3, p. 962 (§7.1): settled as uncertified in the manifest; cited by locator only.
- H90 is cached as an OCR'd scan; theorem numbers and page headers were read, but the statements' fine print (Theorems 2.4.1, 2.4.4, 2.7, Proposition 2.7.2) were checked only for existence and page.
- Ownership against open pull requests whose files this brief did not give was checked only through `roadmaps grep` over the index of 2026-11-05.

## Source issues

- **Misprint** in BCGP21 at proof of Lemma 3.10.7, printed page 238: the displayed Satake image of [1,1,ϖ,ϖ] lists the monomial [1,ϖ,1,ϖ] twice and omits [1,1,ϖ,ϖ]; it should be the four Weyl conjugates [1,1,ϖ,ϖ],[1,ϖ,1,ϖ],[ϖ,1,ϖ,1],[ϖ,ϖ,1,1]; affects nothing.
- **Misprint** in P20 at proof of Corollary 15.2.3.1, manuscript page 109: the boundary identification "H⁰(S^{(1),*},ω²) if k = 2" should read "if k = 0", as the preceding sentence states; affects nothing.
- **Misprint** in P20 at Theorem 15.2.2.1(2), manuscript page 108: the large-weight condition is printed as λ₁ ≥ R although λ₁ = −k−1 < 0 and Theorem 15.2.3.1 uses k ≥ R−1; it should be −λ₁ ≥ R; affects nothing.
