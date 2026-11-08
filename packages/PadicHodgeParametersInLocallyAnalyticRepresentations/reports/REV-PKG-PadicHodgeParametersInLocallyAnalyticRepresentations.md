<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2246#issuecomment-6655304487 -->
Review (claude) of b8451af

Verdict: needs_changes

1. **F01** (P2) The split-gl_n Harish-Chandra contract asks for the dot-action invariants with a normalisation that forces the ordinary action

   **Location.** `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md` line 166–170 (the gap `split-gln-harish-chandra`): "`Z(U(gl_{n,Σ_K})) ≅ U(t_{Σ_K})^{W_{n,K}}` … `W_{n,K}` = `S_n^{Σ_K}` acting by the dot action, normalised so that a weight μ corresponds to the infinitesimal character `ξ_{μ−θ}`". The same sentence is `design/plan.json`, `gaps[2].needs`.

   **Claim.** The Harish-Chandra isomorphism onto the dot-action invariants can be normalised so that the point μ of Spec U(t)^{W·} is the infinitesimal character of L(μ − θ).

   **Witness.** Under the dot action (w·ν = w(ν+ρ) − ρ) the standard normalisation is μ ↔ ξ_μ (the centre acts on the Verma module of highest weight μ by the evaluation at μ; Humphreys, BGG category O, Thm 1.10). Transport along μ ↦ μ − θ: w·(μ − θ) + θ = w(μ) + (w(ρ−θ) − (ρ−θ)) = w(μ), because ρ − θ = ((n−1)/2)(1,…,1) is central at each σ. So the invariants compatible with μ ↔ ξ_{μ−θ} are the ordinary permutation invariants, and the two parts of the sentence contradict each other. The README itself computes with the ordinary invariants: §2.6 uses "the Jacobian of the elementary symmetric polynomials at (h_{1,σ},…,h_{n,σ})", and its fourth Check says the normalisation differs from the ρ-shifted map by the central shift (n−1)/2·(1,…,1). Ding fixes the normalisation μ ↔ ξ_{μ−θ} and describes the invariants as a polynomial algebra (DING25 lines 2284–2296, p. 51), which is the ordinary symmetric-polynomial ring. LieHighestWeight on main already distinguishes "Harish-Chandra isomorphisms onto dot and linear" invariants (`TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md` line 35), so a supplier reading "dot action" will build the wrong one. The phrase is new at the package stage (the design README has no occurrence of "dot action").

   **Repair.** In README line 168 replace "acting by the dot action, normalised so that a weight μ corresponds to the infinitesimal character `ξ_{μ−θ}` of L(μ − θ)" by "acting by the ordinary permutation action on `t_{Σ_K}` (the dot action transported along μ ↦ μ − θ: since ρ − θ = ((n−1)/2)(1,…,1) is central, the dot-invariants in the variable μ − θ are the ordinary invariants in μ), normalised so that a weight μ corresponds to the infinitesimal character `ξ_{μ−θ}` of L(μ − θ)". Align the `needs` sentence of the gap in `design/plan.json` with the same wording so that the intake announces a consistent contract. Instance check after the repair: n = 2, one embedding, θ = (0,−1), ρ = (1/2,−1/2); h = (3,1) ↦ λ = (3,2); the ordinary S_2-invariants e_1 = 4, e_2 = 3 at h and the dot-invariants evaluated at λ (λ + ρ = (7/2, 3/2): e_1 = 5, e_2 = 21/4) are related by the central translation by 1/2 in each coordinate, as the repaired sentence says; the Vandermonde h_1 − h_2 = 2 ≠ 0 gives the tangent bijection of §2.6.

2. **F02** (P3) Seven declaration names attributed to PhiGammaModulesAndIwasawaCohomology do not exist at its head

   **Location.** README lines 227–233 (the PhiGamma supplier contract) and line 655 (§2.5 *Needs*): `fieldEtaleRealization`, `RelativePhiGammaModule`, `CoefficientRobbaModule`, `CoefficientRobbaModule.etaleEquivalence`, `HerrCohomology`, `characterModule`, `characterModule_deRham_iff_locallyAlgebraic`.

   **Claim.** These are declarations of PhiGammaModulesAndIwasawaCohomology §§1.0, 1.2, 3.4a, 3.6, 7.1, 7.4.

   **Witness.** At the head of that roadmap's pull request (#1310, 09f2de3, read with `roadmaps show` and `--file Suggested.lean`), none of the seven strings occurs in README.md or Suggested.lean (0 hits each, backticked or not). The names occur only in consumers' READMEs (LocalGaloisDeformationRings §0.4, PadicHodgeTheory). The sections themselves exist and supply the objects: §1.0 "Cyclotomic norm fields and field realization" (étale realisation with coefficient algebras), §1.2 "Relative categories and finite-radius models" (relative (φ,Γ_K)-modules over A), §3.4a "Field Herr comparison, Euler characteristic and duality", §3.6 "Integral and affinoid Galois comparison", §7.1 "Character lines over K" (R_{A,K}(δ) and ε = N|N|), §7.3 "Weights over Artinian coefficients", §7.4 (de Rham exactly when δ is locally algebraic, that roadmap's line 2966), §7.5 "Saturated and strict triangulations".

   **Repair.** Delete the seven backticked names and cite by content: "§1.0 (the étale realisation of E-representations of G_K as étale Robba modules, with coefficient algebras), §1.2 (relative (φ,Γ_K)-modules over a finite local E-algebra A, the coefficient Robba modules), §§3.4a and 3.6 (the Herr complex and its comparison with Galois cohomology), §7.1 (the rank-one modules `R_{K,E}(δ)`, with ε = `N_{K/ℚ_p}|N_{K/ℚ_p}|` the Tate character), §7.3 (weights of characters over Artinian coefficients, locally algebraic characters), §7.4 (a rank-one module is de Rham exactly when its character is locally algebraic), §7.5 (triangulations)". In line 655 replace "`characterModule`, the Tate character ε" by "the rank-one modules `R_{K,E}(δ)` and the Tate character ε". The same section numbers stay.

3. **F03** (P3) `BPair`, `WdRPlus` and `bergerModification` are not names of PadicHodgeTheory

   **Location.** README lines 237–238 (the PadicHodgeTheory supplier contract).

   **Claim.** PadicHodgeTheory §4.5 declares `BPair` and `WdRPlus`, and §5.2 declares `bergerModification`.

   **Witness.** At the head of PadicHodgeTheory (#1062, c1968e3) neither README.md nor Suggested.lean contains any of the three strings. §4.5 "B-pairs, cohomology and general de Rham blocks" describes the Galois B-pair, its labelled positive lattice and the Herr comparison in prose and names only its own supplier's `PG.RelativeBPair` and `PG.RelativeBPair_classical` (that roadmap's line 1327); §5.2 "Filtered modules as Robba modifications" describes Berger's modification without a Lean name.

   **Repair.** Replace lines 237–238 by "§4.5 (the Galois B-pair of a Robba module over a finite coefficient field, with its labelled positive de Rham lattices and its exact tensor equivalence with Robba modules), §5.2 (Berger's modification of a filtered module with finite descent)". The gap paragraph that follows is unaffected.

4. **F04** (P3) "not in general a quotient of it" is false as stated about abstract algebras

   **Location.** README line 1008–1010 (§5.1, the paragraph after the display): "that A_D is a subalgebra of R_D/𝔪² and not in general a quotient of it".

   **Claim.** A_D is not a quotient of R_D/𝔪².

   **Witness.** Both are square-zero local E-algebras: A_D ≅ `TrivSqZeroExt E Q^∨` (the README's own statement) and R_D/𝔪² ≅ `TrivSqZeroExt E Ext¹(D,D)^∨`. Any E-linear surjection Ext¹(D,D)^∨ ↠ Q^∨ (dual to any injection Q ↪ Ext¹(D,D), e.g. a splitting of the quotient map at n = 3, d_K = 1, dimensions 10 ↠ 9) induces an algebra surjection R_D/𝔪² ↠ A_D. The true statement concerns the natural map.

   **Repair.** Replace the clause by "that the natural map A_D → R_D/𝔪² (the first projection of the fibre product) is injective, dual to the surjection Ext¹(D,D) ↠ Q, and is not surjective when Ext¹_0(D,D) ≠ 0 (n = 3, d_K = 1: dimensions 10 and 11)". The Check "the missing direction is Ext¹_0(D,D)" already says this.

Four findings: one P2 (a supplier contract that cannot be fulfilled as written) and three P3 (declaration names cited to suppliers that do not carry them, one imprecise API sentence). The mathematics of all thirty targets was recomputed on instances and found sound; the package is otherwise ready for port.

## Verified sound

**Principles.** No route-specific shortcut: every statement is at Ding's generality (any p, finite K/ℚ_p, E containing all embeddings, D possibly non-étale, n ≥ 1 with the rank-one case stated separately). No roadmap is re-planned: the locally analytic side is imported from LocallyAnalyticRepresentationsOfLocalGroups (board design, accepted 2026-10-19, status partial), the (φ,Γ)-module side from TriangulineVarietyAndItsLocalModel (board design, accepted 2026-10-19, status complete), both earlier in the merge order (lines 318, 319; this roadmap is line 320). No copied passage (the README paraphrases; I compared each sampled target with the text). No algorithm. `Suggested.lean` has no sorry'd data, no `set_option`, no `lemma`, a single `import Mathlib` and no other import.

**Dependency check** (run as instructed, `--movable`):

```text
depcheck: 234 roadmaps, 2242 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Suppliers and their positions: SmoothRepresentationsOfLocalGroups (25), PhiGammaModulesAndIwasawaCohomology (31), LocalGaloisDeformationRings (85), PadicHodgeTheory (136), LocallyAnalyticDistributionsPartII (316, named in Scope only), LocallyAnalyticRepresentationsOfLocalGroups (318), TriangulineVarietyAndItsLocalModel (319); LieHighestWeight is on main (`TauCetiRoadmap/RepresentationTheory/LieHighestWeight`, Layers 3, 7, 9 at its README lines 405, 931, 1432; the open pull request #1220 on it revises an existing roadmap and is not a dependency).

**Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout: exit 0, no output (the file declares nothing, so no `sorry` warning and nothing to probe for padding; no `#check @name` comparison applies).

**Headline theorems** (from the README summary) and their statability at the pins (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`): Ding's comparison theorem §1.4 and its kernel dimension §1.5; the characterisation §2.4; the central and infinitesimal characters §2.6; the parabolic compatibility and the decomposition over embeddings §§3.1, 3.5; the recovery theorem §4.2; the universal Artinian action and the annihilator §§5.4–5.5. I grepped the pinned Tau Ceti and Mathlib for locally analytic representations of p-adic groups, Robba rings and (φ,Γ)-modules: none exists (the only "locally analytic" hits are complex-analysis files), so none of the headlines is statable and the module docstring names each with the carrier it lacks. The docstring's claim that `TauCeti.hcProjection` assumes a Killing-semisimple algebra is true at the pin (`TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/HarishChandra.lean` line 83 `[IsKilling K L]`, definition at line 281; `vermaCentralCharacter_eq_lift_cartanProjection` at line 247). No padding (nothing declared); no statable headline absent.

**Library declarations opened at the pin.** `LinearMap.quotKerEquivOfSurjective` (`Mathlib/LinearAlgebra/Isomorphisms.lean` line 47), `LinearMap.finrank_range_add_finrank_ker` (`Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean` line 173, `[FiniteDimensional K V]`), `Submodule.finrank_sup_add_finrank_inf_eq` (same file line 53), `TrivSqZeroExt` (`Mathlib/Algebra/TrivSqZeroExt/Basic.lean` line 67), `DualNumber` (`Mathlib/Algebra/DualNumber.lean` line 46), `IsLocalRing` (`Mathlib/RingTheory/LocalRing/Defs.lean` line 30), `CategoryTheory.Abelian.Ext` (`Mathlib/CategoryTheory/Abelian/Ext.lean` line 41), `Module.Dual` (`Mathlib/LinearAlgebra/Dual/Defs.lean` line 61), `LinearMap.prod` (`Mathlib/LinearAlgebra/Prod.lean` line 95), `Equiv.Perm`. All exist; the README names them correctly.

**Sources: the seeded sample**, each read at its locator in DING25 (page markers of the cached text) and CEGGPS16:

| Target | Locator | Lines | Outcome |
| --- | --- | --- | --- |
| 0.2 Block character directions | (2.21) p. 19; proof of Thm 3.21 p. 49 | 862–879, 2188–2198 | Hom_{P,g′} = {ψ : ψ − ψ_P∘det_{L_P} smooth}; block tuples are the ψ_P∘det_{L_P}; supports the statement |
| 0.3 Levi-centre spanning | (3.43) and closing paragraph, pp. 49–50 | 2189–2222 | printed as a direct sum (dimensions (2n−1)(1+d_K) vs n(1+d_K)); only spanning is used; README correct |
| 1.2 Gluing | proof of Thm 3.21 pp. 48–49, Prop 3.13 p. 44 | 2096–2163, 1909–1914 | S′_{n−1} = {w(n)=1}, t_F, t_G, agreement on g′ via (3.18) and (2.13), second exact sequence of Prop 3.13; supports |
| 1.4 Ding's comparison | Thm 3.21 p. 48, Rk 3.22(2) p. 50 | 2084–2095, 2225 | unique t_D with ⊕Ext̄¹_w ↠ Ext̄¹ = t_D∘(3.38) (overlines lost in extraction, defined at lines 745–748); matches |
| 1.6 Transversality | Lemma 3.23 p. 50 | 2227–2228 | Ker t_D ∩ Ext¹_w = 0 for all w; consequences follow from the filtration (3.17) |
| 2.2 Push-forward | (3.45) and the paragraph, p. 50 | 2239–2249 | surjectivity of f_D from Lemma 3.5(2) (line 1598–1600); images Ext¹_{F_P}, Ext¹_w, Ext¹_g defined as images; matches |
| 2.3 Refinement comparisons | Cor 3.24 p. 50 | 2250–2254 | isomorphisms for ∗ = g, w; matches |
| 2.4 Characterisation | Cor 3.25 p. 51 | 2258–2271 | (1) socle conditions, (2) bijection compatible with every ζ_w and κ_w^{-1}; README (2) is this statement |
| 2.5 Determinant character | before Prop 3.26 p. 51; §2.1 p. 9; §3.1.1 p. 34 | 2272–2278, 388–395, 1456–1458 | χ_D = z^{|λ|}|·|^{n(n−1)/2}∏φ_i with |λ| printed as a sum over i and σ; ∧ⁿD ≅ R(χ_D ε^{−N}); η and |·|_K as in README |
| 2.6 Central/infinitesimal characters | Prop 3.26 and (3.46)–(3.47), pp. 51–52 | 2280–2342 | normalisation μ ↔ ξ_{μ−θ}; d_Sen kills Ext¹_g; d_inf; tangent bijection asserted from polynomiality; matches README (with the regularity gap recorded) |
| 3.2 Parabolic minimal | Rk 3.28 p. 53 | 2368–2380 | multiplicity Σ_i d_K(2^{n_i} − n_i(n_i+1)/2 − 1), maximality among push-forwards from π_{F_P}, injection of the closed induction twisted by ε^{−1}∘θ^P, the diagram of isomorphisms; matches |
| 3.6 Modified module | §2.2 Prop 2.5 and (2.7) p. 13; Cor 3.32 and (3.51) p. 55 | 554–592, 2430–2465 | t_{D_σ} = 𝔗_σ∘t_{D,σ}, Ker equal, factorisation through the modified presentation, dependence on D_σ only, (3.51); matches |
| 3.7 Minimal Ext for D_σ | Cor 3.33 and (3.52) p. 55 | 2467–2487 | the two isomorphisms and the diagram with π_{min,F_P}(D)_σ maximal g_{Σ∖σ}-algebraic; matches |
| 5.4 Universal action | Thm 3.36 and (3.58), pp. 58–59 | 2602–2617 | unique A_D-action with U_w ↪ U[I_w] equivariant; (3.58) ends in π_1^univ_w (misprint); matches |
| 5.5 Annihilator | Cor 3.37 p. 59 | 2619 | π_min(D) ≅ π_1^univ[𝔪_{A_D}]; matches |

Also read for the supplier contracts and conventions: Prop 2.10 and Lemma 2.11 (lines 679–740), Ext¹_0 and (2.14)–(2.16) (741–774), Prop 2.12 (801–806), Cor 2.14–2.15 (830–909), Lemma 2.16 (928), the relation ℒ, 𝒱 and Cor 2.38 (1339–1372), Props 3.3, 3.6, 3.8, Remarks 3.7, 3.9, (3.16)–(3.18) (1583–1738), Prop 3.12 and (3.30) (1850–1894), the paragraph after (3.30) and Prop 3.13 (1895–1914), Prop 3.18 (2003–2024), Thm 3.34 and its proof (2490–2529), §3.2.2 (2530–2598). CEGGPS16 Lemma 3.22 (line 1921, v5 p. 47): Z_{Ω,E} = Z_{D,E}^{W(D)}; for generic φ the stabiliser of the point φ in W(D) is trivial (φ^w ≅ φ ⊗ unramified with w ≠ 1 would need φ_{w(i)} = φ_i on units and a twist, excluded by φ_i ≠ φ_j), so the completion statement of Ding p. 57 follows; the gap sentence is consistent with the lemma. No locator in the package is flagged unverified by the author.

**Adversarial table** (the sampled targets, the headlines and every target a finding touches; values computed by me):

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 families and w_j | n=1,2,3; w=(1 2 3), (1 3 2); n=4, i=2, j=1,3; n=3, w=(2 3) | n=1: both {id}; n=2: {id}, {(1 2)}; (1 2 3): w(3)=1, w⁻¹(3)=2; (1 3 2): w(3)=2; n=4: w_1=(2 4)∈S_{2,3,4}, w_3=(1 2)∈S_{1,2,3}; (2 3)(2 3)=id, (1 2)(2 3): 3↦1 | holds | none |
| §0.2 block tuples, H_j ⊂ Hom_{P_j,g′} | j=0, j=n, n=3 j=1; restriction to Z_j | (b,b,b), (a,a,a), (a,b,b); a(x^j)+b(y^{n−j}) = j·a(x)+(n−j)·b(y); dim H_j = 2(1+d_K) ≤ n+2d_K iff n≥2 | holds | none |
| §0.3 spanning | n=1; n=3 (a,b,c); n=3,d_K=1 dims | coordinate i: Σ_{j≥i}(v_j−v_{j+1})+v_n = v_i; (c,c,c)+(a−b,0,0)+(b−c,b−c,0) = (a,b,c); 6 vs 2+4+4 = 10 | holds; (3.43) as printed false | none |
| §0.4 presentation | n=1; n=3,d_K=1; Ext¹ in place of Q | dim C = 36, Ker R_D = 26, Ker s_D = 27; dim Ext¹_0 = 3+1−3 = 1, so κ_w kills a line that s_D keeps | holds | none |
| §1.1 c_n | n=0..5; recursion | 0,0,0,1,5,16; (n+1)(n+2)/2+1 = n(n+1)+2−n(n−1)/2 = (n²+3n+4)/2 both sides | holds | none |
| §1.2 gluing | sign (b,−b) vs (b,b); h=(3,1,−2); dims of ζ_F, κ_F | t_F(b)−t_G(b)=0 vs 2t_F(b); h¹=(3,1), h²=(1,−2); 𝔈_F: n+2^{n−1}d_K; Q_F: n+d_K(n(n−1)/2+1) = n+d_K dim(B∩L_P) | holds | none |
| §1.4 comparison (headline) | n=1; uniqueness via R_D onto | 𝔈 = Q = Hom(K^×,E), dim 1+d_K; t_D = κ⁻¹ζ⁻¹ | holds | none |
| §1.5 kernel (headline) | K=ℚ_p n=1..5; n=3,d_K=2 | (2,2,0),(5,5,0),(10,9,1),(19,14,5),(36,20,16); (17,15,2); full Ext¹ at n=3: 10−10=0 | holds | none |
| §1.6 transversality | n=3, K=ℚ_p | kernel line vs six 6-dim 𝔈_w in 10-dim 𝔈 | holds (refinement equation, not dimensions) | none |
| §2.2 f_D | 𝒦_D=0; cokernel term | f_D = id; dim Ext¹(A,A) = n+d_K ≠ 0 so (3.45) does not give surjectivity | holds | none |
| §2.3 | n=3,K=ℚ_p | dim 𝔈^min = 9, 𝔈_w^min = 6; full-Ext¹ g-space 1+3 = 4 ≠ 3 | holds | none |
| §2.4 characterisation (headline) | Π_L for a line L with L∩𝔈_{g′}=0, L≠𝒦_D; split extension | soc Π_L = A (ℓ≠0 forbids a second A); soc(Π_L/A)=soc(V/A) iff ℓ∉𝔈_{g′}; push-forward kills L, (2) forces kernel 𝒦_D; split socle A^{1+c_n d_K} | holds; (1) and (2) both needed | none |
| §2.5 χ_D | n=1; n=2, λ_σ=(2,0), λ_τ=(5,1); n=3 | φ_1z^{h_1}; exponents (2,6); |λ|_σ = Σh_{i,σ}+3, Σ_i θ_i = −3 | holds; printed scalar |λ| wrong | none |
| §2.6 characters (headline) | n=2 at x_1=x_2; regular h; ψ=log_p∘det; ρ vs θ | Jacobian of (x_1+x_2, x_1x_2) = x_1−x_2; Vandermonde ≠ 0; d(ψ)(I) = n ≠ 0; ρ_i−θ_i = (n−1)/2; w·(μ−θ)+θ = w(μ) | holds; contract says "dot action" | R01 |
| §3.1 parabolic (headline) | P=G, P=B, n=3 (2,1), n=4 (3,1),(2,2) | c_n d_K, 0, 0, d_K, 0 | holds | none |
| §3.2 parabolic minimal | n=4 (3,1); P=B; P=G | c_3+c_1 = 1 vs c_4 = 5; V; π_min(D); twist 1⊠ε³ from θ^P=(0,0,0,−3) | holds | none |
| §3.5 embeddings (headline) | n=3,d_K=2; 𝔈_σ∩𝔈_τ | 1+1 = 2 = c_3·2; ⊇ 𝔈_g of dim 3 | holds | none |
| §3.6 modification | K=ℚ_p; (3,1,0) at τ; D_σ ∉ ΦΓ_nc | D_σ=D; τ-weights (0,0,0); hypothesis (H) not reapplicable | holds | none |
| §3.7 | n=2; n=3 | 2+3 = 5 = 2+3; 3+7−1 = 9 = 3+6 | holds | none |
| §4.1 relation | n=3 | dim 𝒱_σ = 2(5+2) = 14, Q_σ(D_σ) = 9, ℒ = 5; (x,−x) vs (x,x) | holds | none |
| §4.2 recovery (headline) | n≤2 torus orbits; d_K>1 | ℙ¹∖{2 pts} is a 𝔾_m-torsor at one embedding; over d_K embeddings the diagonal torus has 1-dim orbits in a d_K-dim space; source labels "if/only if" swapped (line 2496–2497) | holds | none |
| §5.1 algebras | n=1; n=3,d_K=1; fibre product cotangent | A_D = A_{D,id}; dims 10, 7, 3, 11; M_D ×_{M_g} M_0 = {m : m|_{Ext¹_0} = 0} = Q^∨ | holds; "not a quotient" imprecise | R04 |
| §5.1 End(D) = E | n=2, Hodge line E(1,1) vs E(1,0) | diag(a_1,a_2) fixes E(1,1) iff a_1=a_2; E(1,0) excluded by noncriticality for (1 2) | holds | none |
| §5.3 induction | n=1 | PS_1 = A = δ_1 = φ_1z^{h_1} (θ=(0)), U_1 = U | holds | none |
| §5.4 action (headline) | x,y radical; x∈I_w on U_w | p∘i_A = 0 so xy = 0; x vanishes on Q_w | holds; (3.58) codomain misprint confirmed at line 2610 | none |
| §5.5 annihilator (headline) | n≤2; n=3,K=ℚ_p; 𝔪U | U[𝔪]=V; one copy of A vs ten; Ker(t_D⊗id) = 𝒦_D⊗A; 𝔪U = A so U/𝔪U = U/A | holds | none |
| Conventions: ε^{−1}∘θ, η | n=2 | ∏ε(t_i)^{−θ_i} = ∏|t_i|^{i−1}z^{i−1}(t_i) = ηz^{−θ}; Ding p. 33: η = |·|^{−1}∘θ | consistent with Ding (3.47) and Rk 3.28 | none |
| Conventions: |·|_K vs PhiGamma ε | ϖ_K | v_p(N_{K/ℚ_p}ϖ_K) = f = [K_0:ℚ_p], so |N(·)|_p = |·|_K | consistent | none |

**Duplication and ownership by object.** The comparison map, π_min(D), the Artinian algebras A_D and the universal action occur in no roadmap on main, no board package and no open pull request whose README I could read (`roadmaps grep` for π_min(D) and for Ding's title: the hits in LocalGaloisDeformationRings, PadicHodgeTheory, PhiGammaModulesAndIwasawaCohomology, AutomorphicFormsOnReductiveGroups, OverconvergentAutomorphicForms and CompletedCohomologyAndLocalGlobalCompatibility are citations of DING25 for conventions or inputs). This roadmap owns Ding §3.2. Ownership against the open pull requests named in the brief without files was not checked beyond that grep.

**Supplier citations resolved.** TriangulineVarietyAndItsLocalModel design: every cited section exists (§§9.1–9.3, 9.6, 9.8, 9.9, 10.1–10.8, 11.1–11.7, 12.8, 12.13, 12.14, 12.16) and I read §§9.1, 10.4, 10.7, 10.8, 11.7, 12.8, 12.13, 12.14: the quotient Q, Q_w ≅ Hom(T(K),E), the corrected sign in §10.7, Hom_{P,g′}, T_σ, the spanning and the relation ℒ_σ with 𝒱_σ match the README's use. LocallyAnalyticRepresentationsOfLocalGroups design: all 35 cited target slugs exist (LR.1 ext-groups, ext1-extensions, self-extension-dual-numbers, admissible-external-tensor; LR.0 completed-external-tensor; LR.5 orlik-strauch-functor; LR.6 closed-induction, jacquet-emerton-functor; LR.7 gln-conventions … ext-filtration; LR.8 seven targets; LR.9 seven targets including sigma-amalgamation at its line 2261), and I read gln-conventions, self-extensions, constituent-ext-lines, ext-pi1, ext-filtration, zeta-fp-bijective, endpoint-amalgamation (first map b ↦ (b, −b)), sigma-ext-pi1, pi1-sigma, jacquet-emerton-functor: the parts (1)–(4) the README cites are stated there with Ding's generality. LocalGaloisDeformationRings §0.4 and §1.23 at head #923: the names `PhiGamma.defRing`, `PhiGamma.triangulineDefRing`, `PhiGamma.deRhamDefRing`, `PhiGamma.tangent_defRing`, `PhiGamma.formallySmooth` are in its API list (lines 1619–1623) with the hypothesis End(D) = E, generic regular parameters and noncritical refinements. SmoothRepresentationsOfLocalGroups §SR.3.2 at head #1688 is over ℂ, so the Bernstein-completion gap is correctly declared. LieHighestWeight on main: Layers 3, 7, 9 exist; the base field is algebraically closed (README line 77) and Layer 7's Harish-Chandra isomorphism is for Killing-semisimple algebras, so the split-gl_n gap is genuine (its wording is R01). LocallyAnalyticDistributionsPartII ND.0–ND.3 exist (design lines 65, 345, 570, 851).

**Declared gaps.** The three gaps have the same slugs in `design/plan.json` and in the README's contracts, each with a named supplier and section. `embedding-selective-modification`: precise (Ding Prop 2.5, lines 560–569; the B-pair construction supports the de Rham generality asked), minimal (PadicHodgeTheory §4.5 at head has B-pairs and labelled lattices but not D_σ). `principal-series-bernstein-completion`: precise and minimal (SR §SR.3.2 is over ℂ, the Part II design does not state Ĥ_φ). `split-gln-harish-chandra`: minimal, but its `needs` is self-contradictory (R01).

**Shape.** All thirty subsections have a locator and hypotheses ("Assume (H)" or their own weaker ones); each definition has its API bullets; Checks per subsection are 3–5 (counted mechanically: 0.1–0.4: 4,4,3,4; 1.1–1.6: 4,4,3,4,3,3; 2.1–2.6: 4,4,3,3,4,4; 3.1–3.7: 4,4,4,4,3,4,3; 4.1–4.2: 3,4; 5.1–5.5: 5,4,3,5,3); every layer ends with Examples and Dependencies; no LaTeX delimiters, no pull-request numbers, no process words, no machine paths (scanned by regex: 0 hits); no backticked name of the roadmap's own is claimed (the Lean file declares nothing and the README's backticks are either suppliers' names or notation). The source manifest records both cited works with DOI or arXiv id, hashes and licence classes; the published CEGGPS version is cited by the arXiv v5 numbering with a version note.

**Settled findings from earlier rounds.** None (first review).

## Not verifiable

- CEGGPS16, Cambridge Journal of Mathematics 4 (2016): the published pagination was not opened (paywalled); the arXiv v5 text was read and the manifest cites v5 with a version note, so nothing in the package depends on the published numbering.
- Humphreys, *Representations of semisimple Lie algebras in the BGG category O*, Thm 1.10 (the dot-action normalisation used in R01's witness) is a standard textbook statement quoted from memory; the computation w·(μ−θ)+θ = w(μ) in R01 is independent of it.

## Source issues

- **Error** in DING25 at (3.43), proof of Theorem 3.21, printed page 49: the source says the character space of T(K) is the direct sum of the Levi-centre character spaces and the centre character space; it should be their (non-direct) sum, since the dimensions are (2n−1)(1+d_K) against n(1+d_K); affects nothing (only spanning is used on p. 50).
- **Misprint** in DING25 at the definition of χ_D before Proposition 3.26, printed page 51: the source says |λ| is the sum of λ_{i,σ} over all i and σ; it should be the tuple (Σ_i λ_{i,σ})_σ ∈ ℤ^{Σ_K}, as the determinant formula requires; affects nothing.
- **Misprint** in DING25 at (3.58), proof of Theorem 3.36, printed page 58: the source says the radical operator ends in the w-th universal extension; it should end in the full universal extension; affects nothing.
- **Misprint** in DING25 at the proof of Theorem 3.34 after (3.54), printed page 56: the source says that after replacing D_σ by D′_σ one obtains the relation attached to D_σ again; it should be the relation attached to D′_σ; affects nothing.
- **Misprint** in DING25 at the proof of Theorem 3.34, first paragraph, printed page 56: the source says the "only if" follows from Corollary 3.32(1) and "if" is proved by induction; the labels are interchanged; affects nothing.
- **Gap** in DING25 at the proof of Proposition 3.26, printed page 51: the source says the tangent map of the Harish-Chandra inclusion at h is bijective because the invariants form a polynomial algebra; it should use that h is regular (nonvanishing Vandermonde), since the differential of the quotient map is singular at non-regular points; affects the proof.
- **Misprint** in DING25 at Corollary 2.14 proof, printed page 19: the source says the quotient paraboline dimension is d_K dim(B∩L_P) − n; it should be d_K dim(B∩L_P) + n (for P = B this is n(1+d_K)); affects a stated result's proof only.
- **Misprint** in DING25 at (3.12), (3.15) and (3.33), printed pages 38–39 and 46: the source says the labels I range over subsets of {1,…,n−1}; they should range over all nonempty proper subsets of {1,…,n}, as the dimension n + (2^n − 1)d_K requires; affects nothing.
- **Misprint** in DING25 at the proof of Lemma 2.11, printed page 16: the source says the last graded parameter carries z^{h_1}; it should carry z^{h_n}; affects nothing.
- **Misprint** in DING25 at the paragraph after (3.30), printed page 43: the source says the two endpoint inductions are from P_1^- and P_2^- with twists ε on the GL_{n−1} block and ε^{n−1} on the GL_1 block; they should be from P_{n−1}^- and P_1^- with the twists 1 ⊠ ε^{n−1} and 1 ⊠ (ε∘det) fixed by ε^{−1}∘θ^P (at n = 2 the printed algebraic part is z^{(h_1+1,h_2)} against z^λ = z^{(h_1,h_2+1)}); affects nothing.
- **Misprint** in DING25 at the definition before Corollary 2.38, printed page 31: the source says the relation attached to D_σ has third argument D_{2,σ}; it should be C_{1,σ}; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b8451af6c565ebb350205d1da524dce86646d828", "job": "REV-PKG-PadicHodgeParametersInLocallyAnalyticRepresentations", "model": "fable", "worker": "chris-x19"} -->
