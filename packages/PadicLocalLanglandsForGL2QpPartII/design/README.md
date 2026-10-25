# Roadmap: p-adic local Langlands for GL₂(ℚ_p), Part II: geometric realisation in the Drinfeld tower

**Summary.** PadicLocalLanglandsForGL2Qp builds the p-adic local Langlands correspondence for G = GL₂(ℚ_p). Its §6.9 identifies the analytic quotient Π^an/π with the strong dual of functions on a Drinfeld cover. It does this for a supercuspidal π with trivial central character, conditionally on a global nonzero map. This Part II starts from that comparison and the correspondence. It discharges the global hypothesis and extends the comparison to every supercuspidal type on which p acts trivially. It refines the comparison by the P-finite Kirillov model, the embedded common dual and the homographic covariance of the coordinate operator. It then extracts the Galois and Banach multiplicities of the geometric p-adic étale cohomology of the Drinfeld tower, and factors the arithmetic completed cohomology at a fixed level over blocks and full Weil–Deligne type rings. The end theorems are:

- the Galois-socle theorem: the multiplicity of V_{M,ℒ} in H¹_ét is Π(V_{M,ℒ})′_b⊗JL(M), and every absolutely irreducible V of dimension at least three has zero multiplicity (Dospinescu–Le Bras, Colmez–Dospinescu–Nizioł);
- the factorisation of the arithmetic completed cohomology H¹_ét(M^p_{n,ℚ̄_p}, L(1)) for p > 3;
- the weighted, Iwasawa, primitive and filtered derived consequences of Dospinescu–Le Bras §§11–12.

## Scope and ownership

This roadmap owns the following:

- the type and level bookkeeping of the p-central Drinfeld tower and the normalisation dictionary among the three sources;
- the P-finite Kirillov model with its infinitesimal action and duality;
- the embedded common dual E_π, the homographic covariance of the coordinate operator and the topological irreducibility of Π(π,0);
- the discharge of the global nonzero-map hypothesis, and the line-independent Kirillov embedding;
- the realisation for every supercuspidal type in the p-central sector;
- the geometric fundamental diagram, and all geometric multiplicity theorems of Layer 4;
- the arithmetic block decomposition and the interpolated factorisation;
- the consequences in Layer 7.

**PadicLocalLanglandsForGL2Qp** is the base roadmap. Its §§3.1–3.11 supply the correspondence V ↦ Π(V), the Montreal functor, D⊠ℙ¹ and the analytic vectors Π(V)^an. Its §4.1k supplies the P-algebraic Kirillov model of fixed weight and its §4.2a the line-independent G-action on N_rig⊠ℙ¹. Its §4.11 supplies the analytic quotient `AnalyticBoxtimes.analyticQuotient`, independent of the filtration. Its §§5.1–5.8 and 5.12 supply blocks, projective envelopes, pseudodeformation rings, the universal family for absolutely irreducible residual representations and the full-type rings `WDTypeRing` with `KisinRingLL.completion`. Its §6.7 supplies Paškūnas–Tung finiteness. Its §6.9 supplies the Breuil–Strauch comparison in the following named pieces:

- `DivisionAlgebraTypes.jacquetLanglands`, the multiplicity spaces X^ρ and `DrinfeldComparison.halfPlaneModule`, the O(Ω)-module structure on E_π with its coordinate operator ∂;
- `DrinfeldComparison.map_linear`, `DrinfeldComparison.map_surjective`, `DrinfeldComparison.scalarEndomorphisms` and `DrinfeldComparison.map_injective`, the last with the weight-two model Π(π,2) and its two-copy smooth kernel;
- `DrinfeldComparison.functions_dual`, `DrinfeldComparison.deRham` and `DrinfeldComparison.filtration_preimage`, under the hypothesis `DrinfeldComparison.global_nonzero_map`.

Part II begins where §6.9 stops. It does not construct a second correspondence, a second analytic quotient, a second coordinate operator, a second O(Ω)-module structure or a second proof of surjectivity, injectivity or the de Rham comparison for trivial central character. The kept refinements say in one clause how they go beyond the base roadmap:

- §2.1 proves equality of the embedded duals inside tN_rig⊠ℙ¹, with fixed-radius control. §4.11 of the base proves independence of the abstract quotient only.
- §2.2 proves the two-sided homographic covariance of ∂. §6.9 of the base constructs ∂ and the resolvents only.
- §2.3 proves topological irreducibility of Π(π,0), which the base does not state.
- §3.2 gives the Kirillov embedding of the u⁺-kernel, independent of the line, with its twisted coefficients.
- §3.3 removes the trivial-central-character hypothesis of §6.9.

The tower, its period maps, commuting actions, Weil descent, central quotients and Stein covers come from **EndoscopicTransferAndUnitaryTraceComparison** §§12.4, 12.5, 12.7, 12.14, 12.19 and 12.21. Its ℓ ≠ p compact-support comparison is not used. Hyodo–Kato cohomology of Stein curves and of semistable curve towers comes from **LocallyAnalyticDistributions** §0.CR.6.6. That roadmap's §0.3 also gives the strong-dual comparison for analytic compact-type spaces. **PhiGammaModulesAndIwasawaCohomology** supplies three things: the unfiltered differential equation N_dR (§5.6a), the map from ψ-fixed vectors to the ψ-zero part (§2.4) and the all-level exponential-image theorem with its annular generation (§5.7). **PadicHodgeTheory** §§3.3, 4.4, 5.1–5.4 and 8.1 supply the period functors, D_dif, Berger's differential equation, Fontaine's recipe and the proper smooth de Rham comparison. **PadicDifferentialEquationsAndRigidCohomology** §§RD.1.73 and RD.2.43 supply the Robba residue duality and the bijectivity of ∂ on N_rig of a nontrianguline de Rham representation.

**GL2AutomorphicRepresentationsAndTransfer** R16.3 supplies the rank-two local parameters and R17.3 the global Jacquet–Langlands correspondence. Its R17.3.12 supplies the quaternionic globalisation of a supercuspidal type. **CompletedCohomologyAndLocalGlobalCompatibility** §4.9 supplies local–global compatibility for a definite quaternion algebra. **LocalGaloisDeformationRings** §3.8 compares R_{B,M} with deformation rings of fixed Weil–Deligne type. **SmoothRepresentationsOfLocalGroups** SR.0 and SR.2 supply the smooth categories and induction. The mod p finiteness of the tower, Strauch's description of its connected components, the derived Lie-algebra action and the coefficient form of supercuspidal projectivity are supplier gaps, stated under *Exact supplier contracts*.

## Conventions

Let p be a prime, L/ℚ_p a finite extension, O = O_L with uniformiser ϖ and residue field k_L. Enlarge L whenever a splitting or absolute-irreducibility hypothesis needs it. Write G = GL₂(ℚ_p), Z for its centre, P for the mirabolic subgroup (∗ ∗; 0 1), B for the upper Borel subgroup, w = (0 1; 1 0), u(b) = (1 b; 0 1), and Γ = ℤ_p^× for the cyclotomic group. Write D for the quaternion division algebra over ℚ_p, O_D for its maximal order, ϖ_D for a uniformiser with ϖ_D² = pu for a unit u, and Ǧ = D^×. Let Ω = ℙ¹ ∖ ℙ¹(ℚ_p) be the Drinfeld half-plane over ℚ_p, with coordinate z, and let g = (a b; c d) act by z ↦ (az+b)/(cz+d).

**Levels.** The source of Dospinescu–Le Bras (DLB17) writes Σ_r for the model over ℚ_p of the quotient by p^ℤ of the cover of level 1+p^rO_D. Its Galois group over Σ₀ is O_D^×/(1+p^rO_D) (DLB17 lines 104–106). Colmez–Dospinescu–Nizioł (CDN20, CDN23) write M^p_n for the p-central quotient of level 1+ϖ_D^nO_D. Since 1+p^rO_D = 1+ϖ_D^{2r}O_D, the DLB level r is the CDN level 2r. EndoscopicTransferAndUnitaryTraceComparison §12.4 indexes by ϖ_E-power level m, which is ϖ_D-level 2m for E = ℚ_p. The first cover of level 1+ϖ_DO_D is a different space from Σ_1. Σ₀ consists of two copies of Ω, exchanged by ϖ_D, on which O_D^× acts trivially (DLB17 lines 115–116).

**Actions and duals.** Groups act on functions by inverse pullback: (gf)(z) = f(g⁻¹z). With this convention the Lie algebra acts on O(Ω) by u⁺f = −f′, a⁺f = −zf′, a⁻f = zf′ and u⁻f = z²f′. This is the case k = 0 of DLB17 Lemme 3.5 (DLB17 line 759). The strong dual E′_b of a locally convex space E carries the topology of uniform convergence on bounded sets and the action (gℓ)(v) = ℓ(g⁻¹v). In particular a central element acting on E by a scalar χ(z) acts on E′_b by χ(z)⁻¹.

**Multiplicity spaces.** For a topological G×Ǧ-representation X and a finite-dimensional smooth representation ρ of Ǧ, write X^ρ = Hom_Ǧ^cont(ρ, X), as in the base roadmap §6.9. For a type M, write X[M] = X^{JL(M)}. The multiplicity X[M] and the isotypic summand X[M]⊗JL(M) are different spaces when dim JL(M) > 1.

**Hodge–Tate weights and twists.** The cyclotomic character χ has Hodge–Tate weight +1, as in the base roadmap. Thus D_dR(ℚ_p(1)) is spanned by t⁻¹⊗e₁ and lies in Fil⁻¹ but not in Fil⁰. A representation of weights {0,1} has Hodge filtration with jumps −1 and 0 on D_dR. Its line Fil⁰D_dR is the period line of the family. For a (φ,N,G_ℚ_p)-module M and k ∈ ℤ, M[k] is M with φ multiplied by p^k (CDN20 line 857). Hence D_pst(ℚ_p(1))[1] has φ = 1, since φ acts on D_cris(ℚ_p(1)) by p⁻¹. Reciprocity is the geometric normalisation of the base roadmap's Conventions: p corresponds to a geometric Frobenius.

**Types.** For a rank-two (φ,N,G_ℚ_p)-module M, CDN20 (lines 242–252) attaches WD(M), the smooth representation LL(M) and JL(M). M is supercuspidal when WD(M) is irreducible, and special when M = Sp⊗δ with N ≠ 0. ΦN denotes the special and supercuspidal M. ΦNᵖ denotes those on which p ∈ Z(Ǧ) acts trivially on JL(M). ΦNᵖ_n denotes those of level at most n, meaning JL(M) is trivial on 1+ϖ_D^nO_D (CDN23 lines 2343–2345). The p-central quotient only sees ΦNᵖ.

**Coefficients.** Over C = ℂ_p, use the Galois-invariant model with L⊗F coefficients before base change to C (CDN20, §2.1, line 749). The completed tensor product ⊗̂ is the completed projective tensor product of the base roadmap §0.1.

## Exact supplier contracts

### From Mathlib

The design states no Lean declarations; the following pinned declarations (Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`) are the carriers the G-bounded vectors of §4.8 and the linear algebra of §4.3 rest on.

- `Bornology.IsVonNBounded` (Mathlib/Analysis/LocallyConvex/Bounded.lean): von Neumann boundedness, defined by absorption of every neighbourhood of zero over a seminormed ring. It assumes neither a Hausdorff topology nor local convexity.
- `NormedSpace.image_isVonNBounded_iff` (Mathlib/Analysis/LocallyConvex/Bounded.lean): over a nontrivially normed field, the image of a set under a map into a seminormed space is von Neumann bounded iff its norms are bounded by one real constant.
- `WithSeminorms.isVonNBounded_iff_seminorm_bounded` and `WithSeminorms.image_isVonNBounded_iff_seminorm_bounded` (Mathlib/Analysis/LocallyConvex/WithSeminorms.lean): for a topology given by a family of seminorms p_i over a nontrivially normed field, a set (resp. an image) is bounded iff for every i there is a bound r_i > 0 on p_i. The bound depends on i.
- `WithSeminorms.banach_steinhaus` (Mathlib/Analysis/LocallyConvex/Barrelled.lean): the uniform boundedness principle on a barrelled source.
- `Representation`, `Submodule`, `LinearMap`, `Module.finrank` and `Module.Basis`: linear representations, subspaces, partial operators, dimension and prescribed eigenbases.

The pinned Tau Ceti (`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`) has no carrier for Drinfeld covers, Kirillov models, Robba rings, locally analytic or Banach representations. None of the headline theorems is statable at these pins.

### From TauCetiRoadmap.PadicLocalLanglandsForGL2Qp

- §0.1: LA(X,L) and D(H,L), with strong duals, completed tensors and convolution. It also supplies coadmissible D(H,L)-modules and the anti-equivalence with admissible locally analytic representations. Further, it gives admissible unitary Banach representations with the analytic-vector functor Π ↦ Π^an, which is exact, has dense image and preserves admissibility.
- §0.2: the filtered (φ,N)-module carrier, weak admissibility and the semistable equivalence, which give the Colmez–Fontaine construction of V_{M,ℒ}.
- §§1.1–1.4 and 1.6: the subgroups of G, the character dictionary, the Tate dual Ď, ψ and the treillis, and the trianguline representations of dimension two.
- §§2.5 and 2.7: universal unitary completions and the irreducible mod p representations.
- §§3.1–3.8 and 3.11: D⊠ℙ¹, the Montreal functor, its integral and mod p forms, Π(D) and the correspondence V ↦ Π(V), family stability, and the analytic vectors of Π(D).
- §4.1k: the almost de Rham Kirillov construction `Kirillov.compactPAlgebraic` on P-algebraic vectors.
- §4.2a: `AnalyticBoxtimes.filtrationIndependentAction` on N_rig⊠ℙ¹, which preserves tN_rig⊠ℙ¹ in weights {0,1}.
- §4.9: compactly supported P-finite vectors and their Banach density, for p ≥ 5.
- §4.11: `AnalyticBoxtimes.analyticQuotient`, with Π(V)^an/π independent of the line.
- §§5.1–5.6: blocks B, projective envelopes P_B, E_B = End(P_B) with the evaluation Hom(P_B,M)⊗̂_{E_B}P_B → M, and the pseudodeformation ring R_B^{ps,δ} with the centre comparison.
- §5.8: the universal family Π^univ for absolutely irreducible ρ̄. Its fibre at a closed point x is Π(ρ_x(ε)).
- §5.12: `WDTypeRing` and `KisinRingLL.completion`, the B-adic completion LL_B(M) of a G-stable lattice, with the ring R_{B,M} = End_G(LL_B(M)), a finite product of principal ideal domains, and the free rank-two family ρ_{B,M}.
- §6.7: Paškūnas–Tung finiteness.
- §6.9: `DivisionAlgebraTypes.jacquetLanglands`, `DrinfeldComparison.halfPlaneModule`, `DrinfeldComparison.map_linear`, `DrinfeldComparison.map_surjective`, `DrinfeldComparison.scalarEndomorphisms`, `DrinfeldComparison.map_injective`, `DrinfeldComparison.functions_dual`, `DrinfeldComparison.deRham`, `DrinfeldComparison.filtration_preimage` and the hypothesis `DrinfeldComparison.global_nonzero_map`. It also supplies Π(π,2) with its differential d and the two-copy smooth kernel Π(π,2)^{u⁺=0} ≅ π⊗M_dR(π). All of these are stated there for supercuspidal π with trivial central character.

What PadicLocalLanglandsForGL2Qp must provide (gap:halfplane-module-continuity): in §6.9, the uniqueness of `DrinfeldComparison.halfPlaneModule` must be stated among module structures for which f ↦ T_fℓ is continuous on O(Ω) for every ℓ. Uniqueness without this continuity is not what DLB17 Théorème 9.9 (DLB17 line 2005) proves (source correction E1).

What PadicLocalLanglandsForGL2Qp must provide (gap:two-sided-resolvents): in §6.9, the operators a−c∂ for (a b; c d) ∈ G, and in particular the resolvents (∂−x)⁻¹ for x ∈ ℚ_p, must be proved to be two-sided continuous inverses on Π(π,0)′_b, not only one-sided ones (source correction E7).

What PadicLocalLanglandsForGL2Qp must provide (gap:smooth-kernel-twisted-coefficients): in §6.9, the smooth-kernel comparison Π(π,2)^{u⁺=0} ≅ π⊗M_dR(π) must use the Kirillov target LP(ℚ_p^×, t⁻¹N⁺_dif,∞/N⁺_dif,∞)^Γ with its Tate-twisted Γ-action, and pass to locally constant coefficients only after the twist of Π(π,2) (source correction E9).

What PadicLocalLanglandsForGL2Qp must provide (gap:fixed-radius-divisibility): in §6.9, the vanishing of ∩_{j≥0}(u⁺)^j Π(π,0)′_b used for `DrinfeldComparison.map_injective` must be proved inside one lattice of fixed admissible radius on both charts, not by t-divisibility in the full Robba ring (source correction E10).

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

§12.4 supplies the special O_D-module tower and its levels. §12.5 supplies the period maps and their equivariance, and §12.7 the commuting G×Ǧ×W_ℚ_p actions and the effective Weil descent. §12.14 supplies the central quotient and tensor sectors. There the diagonal centre acts trivially and the left Ǧ-character of a sector is the inverse of the central character of ρ. §12.19 supplies the arithmetic descent of the rank-two central quotient M^p_n to ℚ_p with its G′-action, and §12.21 the perfectoid Stein covers and the Mittag–Leffler property of their p-primary cohomology.

### From TauCetiRoadmap.LocallyAnalyticDistributions

§0.0 supplies locally convex limits and completed projective tensor products. §0.2 supplies strict sequences and projective limits of finite-dimensional Mittag–Leffler cohomology. §0.3 supplies the strong-dual comparison for analytic compact-type spaces. §0.CR.6.6 supplies the nonproper finite-piece Hyodo–Kato comparison, Hyodo–Kato cohomology of Stein curves, its completed comparison with de Rham cohomology, and the Hyodo–Kato cohomology of semistable curve towers in ind-Fréchet spaces.

### From TauCetiRoadmap.PhiGammaModulesAndIwasawaCohomology

- §2.4: `oneSubPhiOnPsiOne`, the map x ↦ (1−φ)x from ψ-fixed vectors to the ψ-zero part.
- §5.4: the analytic Iwasawa comparison.
- §5.6a: `deRhamDiffEq`, the unfiltered differential equation N_dR(V) = N_rig(V), with localisations L_n[[t]]⊗D_dR(V).
- §5.7: `allLevelExp_iff_tNrig`, `allLevelExp_oneSubPhi_injective`, `tNrig_psiCokernels_vanish` and `tNrig_annularGeneration`. Their hypothesis is that D_rig(V) is geometrically nontrianguline after localisation for every finite coefficient extension.

### From TauCetiRoadmap.PadicHodgeTheory and TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology

PadicHodgeTheory §3.3 supplies Fontaine's functors and §4.4 the Sen and differential realisations D_dif^±. §§5.1–5.2 supply Berger's differential equation and filtered modules as Robba modifications. §§5.3–5.4 supply potentially semistable periods, Fontaine's recipe for WD(V) and the rank-two type normalisations, and §8.1 the proper smooth de Rham comparison. PadicDifferentialEquationsAndRigidCohomology §RD.1.73 defines the Robba residue pairing coker ∂ × ker ∂^∨ → L. Its §RD.2.43 proves perfectness for differential modules with Frobenius structure. Its application step proves that ∂ = t⁻¹∇ is bijective on N_rig(V) for V absolutely irreducible, two-dimensional, de Rham and nontrianguline, which is DLB17 Proposition 6.4.

### From the global and smooth suppliers

- GL2AutomorphicRepresentationsAndTransfer R16.3: rank-two local parameters, Steinberg monodromy and supercuspidal parameters.
- GL2AutomorphicRepresentationsAndTransfer R17.3: the global Jacquet–Langlands correspondence. R17.3.12 constructs a weight-two automorphic representation on a quaternion algebra with prescribed supercuspidal type at p. It permits a twist of τ by η∘det, with its partner twisted by η∘Nrd, and a finite extension of L.
- CompletedCohomologyAndLocalGlobalCompatibility §4.9: Emerton's local–global compatibility for a definite quaternion algebra split at p, with r̄|G_ℚ_p absolutely irreducible.
- LocalGaloisDeformationRings §3.8: the identification of R_{B,M} with the fixed-Weil–Deligne-type quotient of R_B^{ps,δ_M}[1/p], with its point criterion and its integral image R⁺_{B,M}.
- SmoothRepresentationsOfLocalGroups SR.0 and SR.2: smooth categories, admissibility, compact induction and Frobenius reciprocity.

What SmoothRepresentationsOfLocalGroups must provide (gap:cuspidal-projectivity-coefficients): §SR.3.2, *cuspidal-splitting*, for a field L of characteristic zero rather than ℂ. For G = GL₂(ℚ_p) and a smooth character ζ of Z, a smooth absolutely irreducible supercuspidal L-representation with central character ζ is projective and injective in the category of smooth L-representations with central character ζ.

### Supplier gaps on board designs

What LocallyAnalyticRepresentationsOfLocalGroups must provide (gap:derived-lie-action): Layer LR.0, *The derived action of the Lie algebra*. For a locally ℚ_p-analytic representation V of G on a barrelled L-space, it must give the continuous action X·v = d/ds exp(sX)v at s = 0 of gl₂(L) on V, with its brackets, and its compatibility with continuous equivariant maps and with the D(H,L)-module structure of the base roadmap §0.1.

What ScholzeFunctorAndModpCohomologyOfTheLubinTateTower must provide (gap:modp-drinfeld-finite-length): Layer 5, *Finite length of the mod p cohomology of the Drinfeld tower (CDN Theorem 4.1)*. For p > 2, n ≥ 0, K/ℚ_p finite and k ≥ 1, it must show that H¹_ét(M^p_{n,K}, O_L/ϖ^k)^∨ is a smooth admissible G′-representation of finite length. It must also show that Hom^cont_{k_L[G′]}(π^∨, H¹_ét(M^p_{n,ℂ_p}, k_L)) is finite-dimensional for every smooth admissible k_L[G′]-module π with a central character.

What ScholzeFunctorAndModpCohomologyOfTheLubinTateTower must provide (gap:drinfeld-components): Layer 0, *Connected components of the Lubin–Tate and Drinfeld towers (Strauch)*. The geometric connected components of M^p_{n,ℂ_p} must be shown finite in number, and G×Ǧ×W_ℚ_p must be shown to act on them through det, Nrd and the reciprocity character.

## How to read the build

Layer 0 fixes the types, levels, multiplicity spaces and the period-line parameter, and proves the normalisation dictionary among the base roadmap, DLB17 and CDN20. Layer 1 builds the differential-equation and Kirillov machinery of DLB17 §§6–7 for a fixed supercuspidal family. Layer 2 proves the embedded and covariant refinements of the base roadmap's analytic quotient and coordinate operator. Layer 3 discharges the global hypothesis of the base §6.9, builds the line-independent Kirillov embedding and extends the realisation to every supercuspidal type in ΦNᵖ. Layer 4 proves the geometric fundamental diagram and computes the Galois and Banach multiplicities of p-adic étale cohomology of the tower. Layer 5 builds the integral arithmetic completion at fixed level and its block decomposition. Layer 6 interpolates the multiplicities over the type rings and proves the factorisation. Layer 7 proves the weighted, Iwasawa, primitive, original Breuil–Strauch and derived consequences and constructs the boundary sheaf.

## Layer 0: Types, levels and normalisations

The tower and the classical transfers are imported; this layer fixes the bookkeeping that every later statement uses.

### 0.1 Discrete-series types and the two level conventions

Define ΦN, ΦNᵖ and ΦNᵖ_n as in Conventions, using GL2AutomorphicRepresentationsAndTransfer R16.3 for the rank-two discrete-series parameters and `DivisionAlgebraTypes.jacquetLanglands` (base roadmap §6.9) for JL. A supercuspidal geometric M has rank two, N = 0 and slope 1/2. A special M is Sp⊗δ with N ≠ 0, and then JL(M) = δ∘Nrd. The DLB cover Σ_r is the CDN level 2r. The p-central quotient and its Weil descent are those of EndoscopicTransferAndUnitaryTraceComparison §§12.14 and 12.19 (CDN23 lines 2339–2349; DLB17 lines 104–106).

Its API:

- M has level at most n exactly when JL(M) factors through Ǧ/(1+ϖ_D^nO_D). Level at most n implies level at most m for every m ≥ n, compatibly with pullback along the tower.
- M lies in ΦNᵖ exactly when the p-central quotient has a nonzero JL(M)-multiplicity space for some n. For special M = Sp⊗δ this means δ(p)² = 1, since p ∈ Z(Ǧ) has reduced norm p².
- The DLB cover Σ_r is the CDN level 2r, with the same central sector.

**Checks.**

- At r = 1, 1+pO_D = 1+ϖ_D²O_D, which is strictly smaller than 1+ϖ_DO_D. Identifying DLB level r with CDN level r would put the first ϖ_D-cover in place of Σ_1.
- For special M = Sp⊗δ, JL(M) = δ∘Nrd is one-dimensional and N ≠ 0. A construction that requires a rank-two absolutely irreducible Galois family rejects it.
- Take a supercuspidal π₀ with trivial central character and the unramified character χ with χ(p) = 1+p, and put M = M(π₀⊗χ∘det). Then JL(M) = JL(π₀)⊗χ∘Nrd, so p acts on JL(M) by χ(p²) = (1+p)² ≠ 1. Hence M has the level of π₀ but does not lie in ΦNᵖ, and every Ǧ-map from JL(M) into the p-central quotient vanishes.

*Needs:* GL2AutomorphicRepresentationsAndTransfer R16.3; PadicLocalLanglandsForGL2Qp §6.9 (`DivisionAlgebraTypes.jacquetLanglands`); EndoscopicTransferAndUnitaryTraceComparison §§12.4, 12.14 and 12.19.

### 0.2 Type decomposition and multiplicity spaces

The base roadmap §6.9 defines X^ρ for one ρ, with its evaluation isomorphism ρ⊗X^ρ ≅ e_ρX. Here the decomposition is over all types. Let Z be a smooth L[Ǧ]-module on which p acts trivially and whose action factors through Ǧ/(p^ℤ(1+ϖ_D^nO_D)), and let L split all irreducible representations of this finite group. Prove that evaluation gives a Ǧ-equivariant isomorphism ⊕_{M ∈ ΦNᵖ_n} Z[M]⊗_L JL(M) → Z, where Ǧ acts trivially on Z[M]. For a topological G×Ǧ-representation the isomorphism is topological, each Z[M] carrying the subspace topology of Hom_L(JL(M), Z). Prove that a continuous equivariant map induces maps on every Z[M], compatibly with composition, and that the decomposition commutes with finite extension of L. Source: CDN23 lines 2346–2349; DLB17, Théorème 1.2 and its footnote on σ^ρ (DLB17 line 154).

Its API:

- Evaluation ⊕_M Z[M]⊗JL(M) → Z is a topological isomorphism. Only finitely many M have Z[M] ≠ 0.
- A continuous G×Ǧ-map Z → Z′ induces G-maps Z[M] → Z′[M] that respect identity and composition.
- On strong duals Ǧ acts by (dℓ)(v) = ℓ(d⁻¹v). A central element acting on Z[M] by a scalar acts on the dual by its inverse.
- Finite extension L′/L commutes with Z[M] and with the decomposition.

**Checks.**

- For Z = W⊗JL(M) with trivial Ǧ-action on W, Z[M] = W⊗End(JL(M)) = W, not W⊗JL(M). When dim JL(M) = 2 the second space has twice the dimension.
- For absolutely irreducible JL(M) ≇ JL(M′), Hom_Ǧ(JL(M), JL(M′)) = 0 over a splitting field. Taking the full isotypic projector in place of the multiplicity space would keep a nonscalar End(JL(M)) acting.
- If z ∈ Z(G) acts on E by χ(z), it acts on E′_b by χ(z)⁻¹. Omitting the inverse in the dual action fails this computation.

*Needs:* §0.1; PadicLocalLanglandsForGL2Qp §6.9 (multiplicity spaces); SmoothRepresentationsOfLocalGroups SR.0; EndoscopicTransferAndUnitaryTraceComparison §12.7.

### 0.3 The period-line parameter

For a supercuspidal M of slope 1/2 over L⊗ℚ_p^nr, put M_dR = (ℚ̄_p⊗_{ℚ_p^nr}M)^{G_ℚ_p}, a two-dimensional L-space. Put X⁺_st(M) = (B⁺_cris⊗_{ℚ_p^nr}M)^{φ=p}. For an L-line ℒ ⊂ M_dR, define V_{M,ℒ} as the kernel of the map X⁺_st(M) → C⊗(M_dR/ℒ) induced by θ. Prove the following (CDN20, §2.1.4, lines 879–885; Remarque 2.6 and Lemme 2.7, lines 889–913):

- V_{M,ℒ} is an absolutely irreducible two-dimensional representation of weights {0,1}, with D_pst(V_{M,ℒ}) ≅ M[−1].
- ℒ ↦ V_{M,ℒ} is a bijection from ℙ(M_dR)(L) onto the isomorphism classes of absolutely irreducible two-dimensional V of weights {0,1} with D_pst(V) ≅ M[−1].
- Every such line is weakly admissible, because WD(M) is irreducible. The construction therefore uses the base roadmap §0.2.
- Π_{M,ℒ} := Π(V_{M,ℒ}) is the base roadmap's correspondence applied to V_{M,ℒ}.

Its API:

- V_{M,ℒ} is the θ-preimage of C⊗ℒ in X⁺_st(M); its dimension is two and it is absolutely irreducible.
- Hom_{G_ℚ_p}(V_{M,ℒ}, X⁺_st(M)) is one-dimensional over L.
- A finite extension L′/L transports M, ℒ and V_{M,ℒ} compatibly.
- Distinct lines give non-isomorphic representations.

**Checks.**

- For fixed M and ℒ ≠ ℒ′, V_{M,ℒ} ≇ V_{M,ℒ′}, although both have D_pst ≅ M[−1]. The unfiltered module does not determine V.
- C⊗V_{M,ℒ} ≅ (L⊗C) ⊕ (L⊗C)(1) (CDN20, Remarque 2.8, line 914), so the weights are {0,1}. A construction that returned a character would give a one-dimensional C-semilinear representation.
- The shift M[−1] is witnessed on ℚ_p(1): D_pst(ℚ_p(1)) has φ = p⁻¹, and its shift [1] has φ = 1. Dropping the shift would identify M with D_pst(V) and change every φ-eigenvalue by a factor p.

*Needs:* PadicLocalLanglandsForGL2Qp §§0.2 and 3.8; PadicHodgeTheory §§3.3 and 5.3–5.4.

### 0.4 The normalisation dictionary among the three sources

The base roadmap §6.9(i) parametrises V(π) by ℙ(M_dR(π)) through Π ↦ Fil⁰D_dR(V(Π)), where M(π) comes from the classical correspondence normalised à la Tate. DLB17 writes the de Rham comparison with M*_dR(π) and the orthogonal ℒ^⊥. CDN20 writes it with the geometric module M = D_pst(V)[1], with M_dR and ℒ. Prove the dictionary between them. Let π be supercuspidal with central character ζ and ζ(p) = 1, and let M be the CDN module with LL(M) = π. Then:

- (a) D_pst(V)[1] ≅ M for every V with Π(V) ∈ V(π), and M(π) and M agree up to the twist fixed by the base roadmap §1.7.
- (b) Under the identification M_dR ≅ D_dR(V_{M,ℒ}) induced by (a), the line ℒ is Fil⁰D_dR(V_{M,ℒ}). The two parametrisations of V(π) therefore agree.
- (c) The canonical isomorphism M_dR ≅ M*_dR⊗∧²M_dR, v ↦ (w ↦ v∧w), sends ℒ to ℒ^⊥⊗∧²M_dR. When ζ is trivial, the trivialisation of ∧²M_dR fixed by det V = χ turns DLB17's preimage of ℒ^⊥⊗π′ into CDN's preimage of ℒ⊗π′. For nontrivial ζ, ∧²M_dR remains a line carrying the central character and is not trivialised.

Sources: DLB17 line 189 and Théorème 1.4 (DLB17 line 232); CDN20, lines 240–249 and §2.1.5 (lines 917–933); CDN23, Proposition 5.7, footnote 30 (line 2447). The determinant relation and the central character are preserved by each identification.

**Checks.**

- For a basis e₁, e₂ of M_dR and ℒ = Le₁, the map v ↦ (w ↦ v∧w) sends e₁ to the functional that kills e₁ and sends e₂ to e₁∧e₂. So ℒ goes to Le₂*⊗∧²M_dR = ℒ^⊥⊗∧²M_dR. Using ℒ itself in M*_dR would give the wrong preimage.
- Twisting by an unramified character μ with μ(p) = −1 changes ζ by μ² = 1 at p. It leaves the ℒ-dictionary unchanged and multiplies the φ-eigenvalues on M by −1.
- For V = V_{M,ℒ}, Fil⁰D_dR(V) is one-dimensional and Fil¹D_dR(V) = 0, since the jumps are −1 and 0. Taking Fil¹ instead of Fil⁰ as the parameter would give the zero space.

*Needs:* §§0.1 and 0.3; PadicLocalLanglandsForGL2Qp §§1.7 and 6.9; PadicHodgeTheory §5.4.

### Examples

For π with trivial central character and the basis (e₁, e₂) of M_dR(π), the lines Le₁ and Le₂ give two non-isomorphic Banach completions Π_{M,Le₁} and Π_{M,Le₂} with the same smooth vectors π. DLB17 locates them by Le₂* and Le₁* in M*_dR, while CDN locates them by Le₁ and Le₂ in M_dR. At p = 7, take the quadratic character ω of 𝔽₇^× extended by ω(7) = 1. A supercuspidal π with central character ω has M ∈ ΦNᵖ. It is not a twist of a representation with trivial central character, since the square of every character of μ₆ has order dividing 3.

### Dependencies

PadicLocalLanglandsForGL2Qp §§0.2, 1.7, 3.8 and 6.9; GL2AutomorphicRepresentationsAndTransfer R16.3; EndoscopicTransferAndUnitaryTraceComparison §§12.4, 12.7, 12.14 and 12.19; PadicHodgeTheory §§3.3 and 5.3–5.4.

## Layer 1: Differential equations and P-finite Kirillov models

In Layers 1–2 fix a smooth absolutely irreducible supercuspidal L-representation π of G with trivial central character, ρ = JL(π), and the family V(π) of absolutely irreducible admissible unitary Banach representations Π with Π^lisse ≅ π (base roadmap §6.9). By §0.4, V(π) = {Π_{M,ℒ} : ℒ ∈ ℙ(M_dR)} with V = V_{M,ℒ} absolutely irreducible, de Rham of weights {0,1}, with det V = χ, potentially crystalline and nontrianguline. The general function-space and P-finite definitions of §§1.3–1.4 are stated on their own carriers, without these hypotheses.

### 1.1 The unfiltered equation of a supercuspidal family

PhiGammaModulesAndIwasawaCohomology §5.6a constructs N_rig(V) for each de Rham V, and the base roadmap §4.2a uses it for one M. Here prove the family statements. For V, V′ in the family of π there is an isomorphism N_rig(V) ≅ N_rig(V′), unique up to L^×, compatible with φ, Γ and ∂ = t⁻¹∇. Write N_rig(π) for the common object. For n large, N⁺_dif,n = L_n[[t]]⊗_L M_dR and D⁺_dif,n(V_{M,ℒ}) = tN⁺_dif,n + L_n[[t]]⊗ℒ. Hence tN_rig(π) ⊂ D_rig(V_{M,ℒ}) ⊂ N_rig(π), with the same radius qualification on each term. Prove these from the characterisation of N_rig by its localisations (DLB17, Exemple 6.5 and Exemple 6.6 with Définition 6.7, lines 1335–1345) and from Fil⁰(L_n((t))⊗D_dR(V)) = Σ_i t^{−i}L_n[[t]]⊗Fil^iD_dR(V). These are the inclusions used in PhiGammaModulesAndIwasawaCohomology §5.7.

**Checks.**

- The quotient N⁺_dif,n/D⁺_dif,n is L_n⊗(M_dR/ℒ), killed by t. Two distinct lines give the same N⁺_dif,n but distinct D⁺_dif,n.
- For V = V_{M,ℒ}, the filtration has Fil⁻¹ = M_dR, Fil⁰ = ℒ and Fil¹ = 0, so Σ_i t^{−i}Fil^i = tN⁺ + L_n[[t]]ℒ. With jumps 0 and 1 instead, the same formula would give N⁺ + t⁻¹L_n[[t]]ℒ ⊃ N⁺, which is not contained in N⁺.
- For weights {0,k} with k ≥ 2, the same computation gives D⁺ ⊃ t^kN⁺, not tN⁺. The sandwich tN ⊂ D ⊂ N is a weight-{0,1} statement.

*Needs:* PhiGammaModulesAndIwasawaCohomology §5.6a; PadicHodgeTheory §§4.4 and 5.1–5.2; §0.3.

### 1.2 Polynomial injectivity and invertibility of the connection

Let V be absolutely irreducible, two-dimensional and nontrianguline. Prove that P(∇) is injective on D_rig(V) for every nonzero P ∈ L[X] (DLB17, Lemme 6.3, line 1250). The proof has two steps. First prove that the kernel X of P(∇) on D_rig(V) is finite-dimensional over L, by factoring P over a finite extension and bounding ker(∇−a) on each radius stage. Then use φ-stability of X: if X ≠ 0, φ has an eigenvector on D_rig(V) after a finite extension of L, which gives a rank-one (φ,Γ)-submodule and contradicts nontriangulinity. If moreover V is de Rham, ∂ = t⁻¹∇ is bijective on N_rig(V). This is DLB17 Proposition 6.4 (line 1259) and is supplied by PadicDifferentialEquationsAndRigidCohomology §RD.2.43, application step. No continuity statement for ∂⁻¹ is asserted. The theorem does not apply to trianguline V.

**Checks.**

- For the rank-one trivial equation R with ∇ = t(1+T)d/dT, P(X) = X kills 1, so the nontrianguline hypothesis cannot be dropped.
- For V trianguline, D_rig(V) contains a rank-one submodule R(δ) with basis e, and ∇e = κ(δ)e, where κ(δ) is the weight of δ. So P(X) = X−κ(δ) kills e ≠ 0, and the injectivity fails.
- For V of weights {0,1}, take h = 1 with tN_rig ⊂ D_rig. Then (∇−1)(tx) = t²∂x, so injectivity of ∂ on N_rig follows from injectivity of ∇−1 on D_rig.

*Needs:* PadicLocalLanglandsForGL2Qp §1.6; PadicDifferentialEquationsAndRigidCohomology §§RD.1.73 and RD.2.43; §1.1.

### 1.3 P-finite vectors and infinite slope

For a locally analytic representation Π of G on an L-space, define Π^{P-fin} to be the vectors v such that some power (u(p^n)−1)^k kills v and the orbit of v under diag(ℤ_p^×,1) spans a finite-dimensional space. Call v of infinite slope when there are n, k ≥ 1 and m ∈ ℤ with (Σ_{i=0}^{p^n−1} u(i))^k diag(p^m,1)v = 0. Put Π_c^{P-fin} for the intersection (DLB17, Définition 7.4 and Remarque 7.5, lines 1473–1500). The definition applies to every locally analytic G-representation and every prime. It specialises to the base roadmap §4.9's compactly supported P-finite space on Banach objects with supersingular constituents, where p ≥ 5.

Its API:

- Π^{P-fin} and Π_c^{P-fin} are P-stable L-subspaces containing 0.
- A continuous G-map carries P-finite vectors to P-finite vectors and infinite-slope vectors to infinite-slope vectors.
- For v P-finite and N divisible enough, a power of 1−u(p^N) carries v into Π_c^{P-fin} (DLB17, Remarque 7.5).

**Checks.**

- The zero vector satisfies both conditions.
- A nonzero vector v of the trivial representation is P-finite but not of infinite slope: the trace Σ_{i<p^n} u(i) acts by p^n, so its k-th power sends v to p^{nk}v ≠ 0.
- For the Kirillov models of §1.4, a function supported on a single valuation shell is of infinite slope. A function with nonzero values on infinitely many shells accumulating at 0 is not in Π_c^{P-fin}.

*Needs:* PadicLocalLanglandsForGL2Qp §§0.1 and 1.1.

### 1.4 Locally polynomial Kirillov function spaces

For a Γ-module X killed by a power of t and on which t acts nilpotently, as for D⁻_dif(V) = lim_n D⁺_dif,n[1/t]/D⁺_dif,n, define LP(ℚ_p^×, X)^Γ. Its elements are the functions φ: ℚ_p^× → X with φ(ax) = σ_a(φ(x)) for a ∈ ℤ_p^× whose support has compact closure in ℚ_p; zero may be a limit point of the support. Define LP_c(ℚ_p^×, X)^Γ by requiring compact support in ℚ_p^×. Let (a b; 0 1) act by φ ↦ (x ↦ ε(bx) e^{tbx} φ(ax)), where ε is the additive character of ℚ_p fixed by the chosen p-power roots of unity (DLB17 lines 1531–1534). The exponential is a finite sum on each value because t is nilpotent on X.

Its API:

- A Γ-equivariant function is determined by its values φ(p^j), j ∈ ℤ, and evaluation identifies LP_c(ℚ_p^×, X)^Γ with ⊕_{j∈ℤ} X.
- LP_c ⊂ LP is a P-stable inclusion. It is not surjective as soon as X ≠ 0.
- A Γ-equivariant map X → X′ commuting with t induces a P-equivariant map on LP and LP_c.
- The formula defines a left action of P.

**Checks.**

- A Γ-equivariant function supported on p^jℤ_p^× has exactly one nonzero valuation coordinate.
- The function equal to a fixed nonzero x on p^jℤ_p^× for every j ≥ 0 has support with closure ℤ_p, compact in ℚ_p but not in ℚ_p^×. So it lies in LP and not in LP_c.
- Differentiating the action of u(b) at b = 0 multiplies φ(x) by tx. With the opposite order of the matrix factors the derivative of the a-action would be wrong by the sign of the Lie bracket.

*Needs:* PadicHodgeTheory §4.4; PadicLocalLanglandsForGL2Qp §1.2.

### 1.5 The P-finite Kirillov model and the infinitesimal action

For V in the family of π, construct the P-equivariant injection v ↦ φ_v: Π(V)^{P-fin} → LP(ℚ_p^×, D⁻_dif(V))^Γ. Prove that it restricts to an isomorphism Π(V)_c^{P-fin} ≅ LP_c(ℚ_p^×, D⁻_dif(V))^Γ (DLB17, Proposition 7.6, line 1535). This extends the base roadmap §4.1k, which treats P-algebraic vectors only. For generalized Hodge–Tate weights a, b, prove that U(gl₂) acts on D_rig(V) by a⁺ = ∇, a⁻ = a+b−1−∇, u⁺ = t and u⁻ = −t⁻¹(∇−a)(∇−b), with Casimir ((a−b)²−1)/2 (DLB17, Théorème 7.3, line 1460). In weights {0,1}, u⁻ = −t∂². The route takes the analytic-vector exact sequence of the base §3.11, Colmez's P-finite expansion, and the Sen operator for the Lie action.

**Checks.**

- At (a,b) = (0,1), the Casimir is ((0−1)²−1)/2 = 0. Also (∇−0)(∇−1) = t²∂², so u⁻ = −t⁻¹t²∂² = −t∂², not −∂²t.
- For a P-finite vector in the image of the base roadmap's P-algebraic model, φ_v agrees with `Kirillov.compactPAlgebraic`. A second normalisation of the exponential would disagree already on u(b) at b = 1.
- The zero vector maps to the zero function. By injectivity, a vector with zero Kirillov function is zero.

*Needs:* §§1.2–1.4; PadicLocalLanglandsForGL2Qp §§3.1, 3.11 and 4.1k; gap:derived-lie-action.

### 1.6 The differential residue pairing

The pairing V̌×V → L(1) gives ⟨ , ⟩: D⁺_dif(V̌)[1/t] × D⁺_dif(V)[1/t] → L_∞((t))dt, where dt is the canonical basis of ℚ_p(1). Define {ž, z}_dif = lim_n p^{−n} res₀ Tr_{L_n((t))/L((t))} ⟨σ_{−1}(ž), z⟩, with res₀(Σ a_n t^n dt) = a_{−1} (DLB17 lines 1550–1564). Prove the following:

- It is a perfect Γ-equivariant pairing, and for n large the orthogonal of D⁺_dif,n(V̌) is D⁺_dif,n(V) (DLB17, Proposition 7.7(a), line 1565).
- For every de Rham V, the orthogonal of N⁺_dif,n(V̌) is tN⁺_dif,n(V). Indeed N⁺_dif(V) = L_∞[[t]]⊗D_dR(V) and N⁺_dif(V̌) = L_∞[[t]]⊗D_dR(V)*⊗t⁻¹dt. A product therefore lies in t^{m−1}L_∞[[t]]dt when the second factor lies in t^mN⁺, and its residue vanishes for all partners exactly when m ≥ 1.

The source prints t^kN⁺ for weights {0,k} (source correction E4). The two agree only at k = 1, which is the case used here.

Its API:

- The pairing is the normalised trace of the residue of the σ_{−1}-adjusted product, and is independent of n.
- D⁺_dif is its own annihilator under the determinant identification when det V = χ.
- (N⁺_dif(V̌))^⊥ = tN⁺_dif(V) for every de Rham V.

**Checks.**

- For V = L, V̌ = L(1) and N⁺(V̌) = L_∞[[t]]t⁻¹dt. The residue of f·g·t⁻¹dt is the constant term of fg, so the orthogonal of N⁺(V̌) is tL_∞[[t]] = tN⁺(L).
- For weights {0,2}, te ∈ tN⁺(V) pairs to residue zero with every element of N⁺(V̌), but te ∉ t²N⁺(V). So the printed t^k fails at k = 2.
- Only products of total t-exponent −1 contribute. A pairing without the normalisation p^{−n} would change by the factor p when n increases by one.

*Needs:* §1.1; PadicLocalLanglandsForGL2Qp §1.3; PadicHodgeTheory §4.4.

### 1.7 Kirillov duality and the smooth-vector criterion

For V in the family of π, n ≥ m(V), v ∈ Π(V)_c^{P-fin} and ℓ ∈ (Π(V)^an)′_b, prove {ℓ, v}_{ℙ¹} = Σ_{j∈ℤ} {i_{j,n}(ℓ), φ_v(p^{−j})}_dif. Here i_{j,n} = φ^{−n}∘Res_ℤ_p∘diag(p^{n−j},1) (DLB17, Théorème 7.8, lines 1576–1586). Prove the following description of the smooth vectors (DLB17, Proposition 7.9 and Théorème 7.11, lines 1593–1615):

- The P-smooth vectors of infinite slope, ker u⁺ ∩ ker a⁺ ∩ Π(V)_c^{P-fin}, are contained in π.
- Under §1.5 they correspond to LP_c(ℚ_p^×, N⁺_dif(V)/D⁺_dif(V))^Γ.
- Π(V) has no nonzero vector fixed by the whole upper unipotent subgroup.

The route compares Colmez's global pairing on D_rig⊠ℙ¹ (base §3.11) with the shell sum by trace–residue compatibility (§1.6).

**Checks.**

- The nonzero trivial representation is P-smooth and killed by u⁺ and a⁺ but not of infinite slope (§1.3). Without the infinite-slope condition the criterion would wrongly include it.
- For v supported on one shell p^jℤ_p^×, the sum has one nonzero term.
- For the zero functional the sum vanishes term by term.

*Needs:* §§1.5–1.6; PadicLocalLanglandsForGL2Qp §§0.1 and 3.11; gap:derived-lie-action.

### Examples

In weights {0,1}, with ℒ = Le₁ in M_dR = Le₁⊕Le₂, N⁺_dif/D⁺_dif = L_∞⊗(M_dR/Le₁) is spanned by the image of e₂ and killed by t. The P-smooth Kirillov functions of infinite slope then take values in this one-dimensional L_∞-space.

### Dependencies

Layer 0; PadicLocalLanglandsForGL2Qp §§0.1, 1.1–1.3, 1.6, 3.1, 3.11 and 4.1k; PhiGammaModulesAndIwasawaCohomology §5.6a; PadicHodgeTheory §§4.4 and 5.1–5.2; PadicDifferentialEquationsAndRigidCohomology §§RD.1.73 and RD.2.43; gap:derived-lie-action.

## Layer 2: The common embedded dual and homographic covariance

The base roadmap supplies the G-module tN_rig(π)⊠ℙ¹ (its §4.2a, independent of the line), the abstract analytic quotient (§4.11), and the coordinate operator ∂ on Π(π,0)′_b with its O(Ω)-module structure (§6.9). This layer proves the embedded, covariant and irreducibility refinements.

### 2.1 The common embedded analytic dual

For V in the family of π, write B_V = (Π(V)^an/π)′_b with its canonical embedding into D_rig(V̌)⊠ℙ¹. Prove the following (DLB17, Proposition 8.2, Théorème 8.3 and Théorème 8.6, lines 1661–1690 and 1828):

- The image of B_V lies in tN_rig(π)⊠ℙ¹. At an admissible fixed radius r_m(V) it lies in the corresponding lattice of tN_rig^{]0,r_m]}.
- Under the identifications of §1.1 these images are equal for all V in the family. Write E_π for this common closed subspace with its Fréchet topology, so that Π(π,0) := (E_π)′_b is isomorphic to the base roadmap's analytic quotient for every V.
- Restriction to ℤ_p identifies the diag(p,1)-fixed vectors of E_π with tN_rig(π)^{ψ=1}. Restriction to ℤ_p^× has image (1−φ)tN_rig(π)^{ψ=1}.

The injectivity of Res_ℤ_p on these fixed vectors uses the Weyl chart and D_rig^{φ=1} = 0, from `allLevelExp_oneSubPhi_injective`. It is not a consequence of the restriction relation alone (source correction E5). Equality of images is proved by comparing two stable integral lattices: p^n-rescaled pairings tend to 0, and a dense Lie-generated subspace with the annihilator of §1.6 forces the two closed images to agree.

**Checks.**

- The statement is an equality of subspaces of tN_rig(π)⊠ℙ¹ with their topologies. An abstract isomorphism B_V ≅ B_{V′}, which is the base §4.11, does not imply it.
- An element of E_π with zero restriction to ℤ_p and zero restriction of its Weyl transform is zero. Vanishing of the ℤ_p-restriction alone does not imply this.
- Lines Le₁ ≠ Le₂ give different Π(V)^an but the same E_π.

*Needs:* §§1.1, 1.2, 1.6 and 1.7; PadicLocalLanglandsForGL2Qp §§3.11, 4.2a and 4.11; PhiGammaModulesAndIwasawaCohomology §§2.4 and 5.7.

### 2.2 Homographic covariance of the coordinate operator

Let ∂ be the operator on E_π of the base roadmap's `DrinfeldComparison.halfPlaneModule`, characterised by a⁺−1 = u⁺∂. Prove the following on E_π (DLB17, Proposition 9.6, Théorème 9.7 and Lemme 9.8, lines 1946–1980):

- ∂u⁺ − u⁺∂ = 1, a⁺ = ∂u⁺ and u⁻ = −∂²u⁺.
- For g = (a b; c d) ∈ G, a−c∂ is a continuous automorphism of E_π, g∂g⁻¹ = (d∂−b)(a−c∂)⁻¹, and gu⁺g⁻¹ = (det g)⁻¹(a−c∂)²u⁺.

The route proves g∂g⁻¹(a−c∂) = d∂−b on Bruhat generators. A right inverse comes from the same identity applied to g⁻¹. The identity for g alone gives only a one-sided inverse (source correction E7).

**Checks.**

- For w = (0 1; 1 0): det w = −1 and (0−∂)² = ∂², so w∂w = (−1)(−∂)⁻¹ = ∂⁻¹ and wu⁺w = −∂²u⁺. On O(Ω), with (wf)(z) = f(1/z) and u⁺f = −f′, the composite w u⁺ w sends f to z²f′, and −∂²u⁺f = −z²(−f′) agrees.
- For u(b) = (1 b; 0 1), u(b)∂u(b)⁻¹ = ∂−b. On functions this is z ↦ z−b.
- For aI₂ the conjugation factor is (a²)⁻¹a² = 1, consistent with the trivial central character.

*Needs:* §§1.5 and 2.1; PadicLocalLanglandsForGL2Qp §6.9 (`DrinfeldComparison.halfPlaneModule`); gap:derived-lie-action.

### 2.3 Topological irreducibility of Π(π,0)

Prove that Π(π,0) is topologically irreducible as a locally analytic G-representation. Equivalently, E_π has no nonzero proper closed G-stable subspace. Colmez proves that Π(M,−k) is irreducible for every absolutely irreducible M and k ≥ 1 (COLMEZ19POIDS, Théorème 0.3(ii), line 179). By COLMEZ19POIDS Remarque 0.2(ii) (lines 161–166), Π(V)^an is an extension of Π(M,−1) by LL_p(M) = π when V has weights {0,1}. Hence Π(π,0) ≅ Π(M,−1). DLB17 Remarque 1.8 (line 410) records this result. Transport it to E_π by the anti-equivalence of the base roadmap §0.1.

**Checks.**

- The statement concerns the G-action alone. It is stronger than the irreducibility of O(Σ_r)^ρ as an O(Ω)[G]-semilinear module used for surjectivity in the base §6.9.
- Π(V)^an itself is reducible, with the smooth subrepresentation π. Irreducibility is a property of the quotient, not of Π(V)^an.
- For a trianguline V, Π(V)^an has a different Jordan–Hölder pattern (COLMEZ19POIDS, Remarque 0.2(ii), lines 158–160). The theorem is not asserted there.

*Needs:* §2.1; PadicLocalLanglandsForGL2Qp §§0.1, 3.11 and 4.11.

### Examples

On O(Ω) the coordinate operator is multiplication by z. Then a⁺−1 = u⁺∂ reads −zf′−f = −(zf)′, and the conjugation by w sends z to 1/z.

### Dependencies

Layer 1; PadicLocalLanglandsForGL2Qp §§0.1, 3.11, 4.2a, 4.11 and 6.9; PhiGammaModulesAndIwasawaCohomology §§2.4 and 5.7.

## Layer 3: Completing the Breuil–Strauch realisation

### 3.1 Discharge of the global nonzero-map hypothesis

For every supercuspidal π with trivial central character, every Π ∈ V(π) and every r with ρ trivial on 1+p^rO_D, prove that there is a nonzero continuous G-map Φ: (Π^an/Π^lisse)′_b → O(Σ_r)^ρ. This is the hypothesis `DrinfeldComparison.global_nonzero_map` of the base roadmap §6.9, which therefore becomes unconditional. The route follows DLB17 Théorèmes 5.1, 5.4, 5.5 and 5.7 (lines 999–1119), §5.3 (line 1184) and Théorème 8.8 (line 1864):

- Choose a weight-two quaternionic automorphic representation whose p-component is π, using GL2AutomorphicRepresentationsAndTransfer R17.3.12. This gives π up to a twist by η∘det, with its partner twisted by η∘Nrd.
- Arrange the residual Galois representation to be absolutely irreducible at p.
- Remove the twist by a finite-order global character with prescribed component η⁻¹ at p before taking isotypic parts. A map for π⊗η∘det is not a map for π (source correction E3).
- Apply the local–global compatibility of CompletedCohomologyAndLocalGlobalCompatibility §4.9 and the Čerednik–Drinfeld uniformisation of the quaternionic Shimura curve to obtain (Π^an)′_b → Ω¹(Σ_r)^ρ.
- Restriction to the quotient dual is nonzero: otherwise the smooth π′_b would inject into the differentials, which contradicts the u⁺-action. The induced map to H¹_dR vanishes by smoothness, so the map factors through exact forms and hence through O(Σ_r)^ρ.

**Checks.**

- The zero map is continuous and equivariant but does not discharge the hypothesis.
- A map constructed for π⊗η∘det has Ǧ-sector JL(π)⊗η∘Nrd. When this is not isomorphic to ρ, the map does not land in O(Σ_r)^ρ.
- Rescaling Φ by c ∈ L^× gives another valid map; the comparison of the base §6.9 is unique up to this scalar.

*Needs:* §§0.2 and 2.1; GL2AutomorphicRepresentationsAndTransfer R17.3; CompletedCohomologyAndLocalGlobalCompatibility §4.9; PadicLocalLanglandsForGL2Qp §§3.3, 3.8 and 6.9; EndoscopicTransferAndUnitaryTraceComparison §§12.4 and 12.7.

### 3.2 The line-independent quotient Kirillov embedding

Localisation and the identifications of §1.1 induce a P-equivariant embedding ι of the u⁺-kernel of Π(V)^an/π into LP(ℚ_p^×, t⁻¹N⁺_dif,∞/N⁺_dif,∞)^Γ. Prove that the embeddings for different V agree up to their comparison scalar (DLB17, Proposition 11.2, Théorème 11.3 and Lemmes 11.4–11.5, lines 2432–2524). The coefficient module t⁻¹N⁺/N⁺ carries a Γ-action through χ⁻¹. The target is identified with locally constant L_∞-valued functions only after the twist of Π(π,2), in which the model takes values in the untwisted coefficient module (source correction E9). The route compares the pairings on compactly supported functions by Lemme 11.4 and uses their nondegeneracy (Lemme 11.5).

**Checks.**

- γ ∈ Γ acts on the class of t⁻¹e in t⁻¹N⁺/N⁺ by χ(γ)⁻¹. Treating the target as locally constant functions before untwisting gives the wrong Γ-equivariance by this character.
- The embedding is independent of V as an embedded P-module once the scalar is fixed, not merely as an abstract vector space.
- On a vector supported on one shell the Kirillov function has one nonzero coordinate, in t⁻¹N⁺/N⁺.

*Needs:* §§1.1, 1.5, 1.6 and 2.1; PadicLocalLanglandsForGL2Qp §6.9.

### 3.3 The realisation for every supercuspidal type in the p-central sector

Let M ∈ ΦNᵖ_n be supercuspidal, π = LL(M) with central character ζ, ζ(p) = 1, and ρ = JL(M). Do not assume that ζ is trivial. Prove the following for n with JL(M) trivial on 1+ϖ_D^nO_D:

- (i) For every ℒ ⊂ M_dR there is a topological G-isomorphism (O(M^p_n)[M])′_b ≅ Π_{M,ℒ}^an/π, unique up to L^×. The quotient is independent of ℒ.
- (ii) There is an isomorphism (L⊗H¹_dR(M^p_n))[M] ≅ M_dR⊗_L π′_b, unique up to L^×. Under it the preimage of ℒ⊗π′_b in (L⊗Ω¹(M^p_n))[M] is (Π_{M,ℒ}^an)′_b, which gives the exact sequence 0 → O[M] → (Π^an_{M,ℒ})′_b → π′_b → 0.

M_dR and M*_dR are kept distinct; for ζ = 1 the dictionary §0.4(c) recovers the base roadmap §6.9(ii)–(iii).

DLB17 Remarque 1.3(a) (line 159) states that trivial central character is not essential to the argument. CDN23 Proposition 5.7 uses the general case (lines 2438–2448, with footnote 30). The route reruns the base §6.9 and §§2.1–3.2 here with a fixed central character ζ. That needs three inputs:

- the global map of §3.1 with prescribed central character, using the central-character adjustment allowed by GL2AutomorphicRepresentationsAndTransfer R17.3.12;
- the smooth-kernel splitting in the category with central character ζ, from gap:cuspidal-projectivity-coefficients;
- the dictionary of §0.4 in place of a self-duality of M_dR.

CDN20 Théorème 0.4 (line 268) gives the de Rham isomorphism of (ii) for every supercuspidal M by the Lubin–Tate route; either route may be used for (ii).

**Checks.**

- At p = 7, let ω be the quadratic character of 𝔽₇^× extended by ω(7) = 1, and let π be supercuspidal with central character ω. The square of a character of μ₆ ⊂ ℤ₇^× has order dividing 3, while ω|μ₆ has order 2. So no twist π⊗χ∘det has trivial central character, and reduction to the base §6.9 by twisting is impossible. Since ω(7) = 1, M ∈ ΦNᵖ and the theorem applies.
- For ζ = 1 and ℒ = Le₁, (ii) puts the preimage at Le₁⊗π′_b ⊂ M_dR⊗π′_b. The base §6.9(iii) puts it at Le₂*⊗π′_b ⊂ M*_dR⊗π′_b. The two agree under §0.4(c).
- For M ∉ ΦNᵖ, for instance after the twist with χ(p) = 1+p of §0.1, both sides of (i) vanish on the p-central quotient. The statement must not be read on the full tower.

*Needs:* §§0.2–0.4, 2.1, 2.2, 3.1 and 3.2; PadicLocalLanglandsForGL2Qp §6.9; GL2AutomorphicRepresentationsAndTransfer R17.3; gap:cuspidal-projectivity-coefficients; gap:halfplane-module-continuity; gap:two-sided-resolvents; gap:smooth-kernel-twisted-coefficients; gap:fixed-radius-divisibility.

### Examples

For ζ = 1, n = 2r and ℒ = Le₁, §3.3(i) is the base §6.9(ii) at DLB level r. For ζ = ω at p = 7 as above, §3.3 is the only available form of the comparison.

### Dependencies

Layers 0–2; PadicLocalLanglandsForGL2Qp §6.9 with its four declared gaps; GL2AutomorphicRepresentationsAndTransfer R17.3; CompletedCohomologyAndLocalGlobalCompatibility §4.9; EndoscopicTransferAndUnitaryTraceComparison §§12.4, 12.7 and 12.14; gap:cuspidal-projectivity-coefficients.

## Layer 4: Individual geometric multiplicities

From here on fix n ≥ 0 and work on the p-central quotient M^p_n over ℚ_p (EndoscopicTransferAndUnitaryTraceComparison §12.19), with geometric fibre M^p_{n,C}. Write O[M], Ω¹[M], H¹_proét[M] and H¹_ét[M] for the JL(M)-multiplicity spaces of L⊗O(M^p_{n,C}), L⊗Ω¹(M^p_{n,C}), H¹_proét(M^p_{n,C}, L(1)) and H¹_ét(M^p_{n,C}, L(1)). For a supercuspidal M ∈ ΦNᵖ_n, G_ℚ_p acts on these through the descent datum.

### 4.1 The fundamental diagram of the Drinfeld tower

For supercuspidal M ∈ ΦNᵖ_n of slope 1/2, prove that there is a commutative diagram of G×G_ℚ_p-Fréchet spaces with exact rows (CDN20, Théorème 0.8, line 323, and Corollaire 2.1, line 762; CDN23 lines 2501–2514):

    0 → O[M] --exp--> H¹_proét[M] --------> X⁺_st(M) ⊗̂_L LL(M)′_b → 0
          ‖                 | dlog                 | θ⊗id
    0 → O[M] ---d---> Ω¹[M] -----------> (C⊗M_dR) ⊗̂_L LL(M)′_b → 0

The vertical maps are injective with closed image. The right-hand column uses the de Rham comparison of §3.3(ii) and the completed Hyodo–Kato comparison of LocallyAnalyticDistributions §0.CR.6.6. Under the latter, the Hyodo–Kato multiplicity is identified with M̆⊗̂LL(M)′_b compatibly with φ (CDN20, Théorème 0.4, line 268). The route of CDN20 §§5.3–5.4 and §0.6 has five steps:

- Fix a Stein covering of M^p_{n,C} by affinoids, taken from EndoscopicTransferAndUnitaryTraceComparison §12.21.
- Compute H¹_proét of each affinoid by the Kummer sequence. Its integral form H¹_ét(Y, ℤ_p(1)) is the p-adic completion of O(Y)^×/C^× extended by T_p Pic(Y) (CDN20 lines 779–791).
- Pass to the limit over the cover; the limit is a Fréchet space (CDN20, Remarque 2.2, lines 792–800).
- Compare with the syntomic description of the tower, using Hyodo–Kato cohomology of semistable curve towers (LocallyAnalyticDistributions §0.CR.6.6).
- Take the JL(M)-multiplicity.

N = 0 on supercuspidal M, so B_st may be replaced by B_cris in X⁺_st(M). This roadmap treats F = ℚ_p only. For F ≠ ℚ_p the de Rham comparison requires CDN20 Théorème 0.6 for the Lubin–Tate tower, which belongs to the GL₂(F) theory and not to this roadmap.

**Checks.**

- θ: X⁺_st(M) → C⊗M_dR is injective because M has slope 1/2 > 0, so (B⁺_cris⊗M)^{φ=1} = 0 (CDN20, Remarque 2.3, line 817). For a slope-zero module the φ = 1 invariants survive and the right vertical map fails to be injective.
- Taking G_ℚ_p-invariants of the bottom row gives 0 → O[M]^{G_ℚ_p} → Ω¹[M]^{G_ℚ_p} → M_dR⊗LL(M)′_b → 0 (CDN20 lines 917–919).
- For M ∉ ΦNᵖ all terms of both rows vanish on the p-central quotient.

*Needs:* §3.3; EndoscopicTransferAndUnitaryTraceComparison §§12.4, 12.7, 12.19 and 12.21; LocallyAnalyticDistributions §§0.0, 0.2 and 0.CR.6.6; PadicHodgeTheory §§3.3 and 5.3.

### 4.2 Half-plane cohomology and the three Steinberg representations

Define St^sm = C^sm(ℙ¹(ℚ_p), L)/L, St^cont = C⁰(ℙ¹(ℚ_p), L)/L and St^an = C^an(ℙ¹(ℚ_p), L)/L. Each carries the inverse-pullback G-action and the quotient topology, and their strong duals are the functionals of total mass zero (CDN20, §1.3, line 614). Prove that St^cont is the universal unitary completion of St^sm and of St^an (base roadmap §2.5). Prove the following on Ω (CDN20, Proposition 1.6 and Théorème 1.7, lines 659–680; Drinfeld for the étale statement):

- μ ↦ ∫ dz/(z−x) μ(x) gives Ω¹(Ω_C) ≅ (St^an_C)′.
- f ↦ df/f gives C⊗̂(O(Ω)^×/C^×) ≅ H¹_dR(Ω_C) ≅ C⊗̂(St^sm)′.
- H¹_ét(Ω_C, ℤ/p^k(1)) ≅ (St^sm_{ℤ/p^k})^∨ for every k ≥ 1, compatibly with the action of G×G_ℚ_p.

For special M = Sp⊗δ ∈ ΦNᵖ_n, prove that the M-multiplicities of the tower are obtained from these by twisting with δ_G = δ∘det on G, δ_Ǧ = δ∘Nrd on Ǧ and δ on G_ℚ_p through the reciprocity convention. In particular H¹_ét[M] ≅ (St^cont⊗δ_G)′_b⊗δ (CDN23, Théorème 5.1 and Remarque 5.2, lines 2357–2371).

Its API:

- Each Steinberg form is the stated function space modulo constants, with the quotient topology, and its dual is the annihilator of the constants.
- The maps St^sm → St^cont and St^an → St^cont have dense image and the universal property of unitary completion.
- Twisting by δ commutes with the half-plane comparisons for δ_G, δ_Ǧ and δ simultaneously.

**Checks.**

- A constant function represents zero in all three quotients. δ_x − δ_y has total mass zero and is a nonzero element of each dual for x ≠ y, while δ_x alone does not vanish on the constants and is not in the dual.
- The function z ↦ (z−a)/(z−b) has symbol mapped to δ_a − δ_b (CDN20, Proposition 1.5, line 650). Its residues at a and b are opposite, matching total mass zero.
- The scalar aI₂ acts on St^cont⊗δ_G by δ(a²), and a ∈ ℚ_p^× ⊂ Ǧ acts by δ(Nrd a) = δ(a²). Both sides agree, and δ(p)² = 1 is exactly the ΦNᵖ condition.

*Needs:* PadicLocalLanglandsForGL2Qp §§0.1 and 2.5; SmoothRepresentationsOfLocalGroups SR.2; EndoscopicTransferAndUnitaryTraceComparison §12.14.

### 4.3 Extension of a partial operator with prescribed spectrum

Let E be a d-dimensional L-vector space, S ⊂ E a subspace and A: S → E an L-linear map such that the only subspace T ⊂ S with A(T) ⊂ T is T = 0. Prove that for any d pairwise distinct λ₁,…,λ_d ∈ L there is an endomorphism B of E extending A that has an eigenbasis e₁,…,e_d with Be_i = λ_ie_i (CDN20, Lemme 2.18, line 1171). No algebraic closure of L is assumed. The route inducts on d along a maximal A-chain s, As, A²s, … inside S, whose iterates up to the first exit from S are linearly independent. It completes the companion block with the coefficients of ∏(X−λ_i), which alternate in sign. The proof must establish that the complementary partial operator again has no nonzero invariant subspace before the induction applies; the source omits this step. The source prints all-positive companion coefficients (source correction E14).

**Checks.**

- d = 2, S = Le₁, Ae₁ = e₂. Then Be₂ = −λ₁λ₂e₁ + (λ₁+λ₂)e₂ gives trace λ₁+λ₂ and determinant λ₁λ₂. The all-positive column λ₁λ₂e₁ + (λ₁+λ₂)e₂ gives determinant −λ₁λ₂ and fails.
- S = 0: every diagonal operator with the prescribed eigenbasis is an extension.
- S = E with d ≥ 1 never satisfies the hypothesis, since T = E is A-stable. So the lemma never asks to extend a full endomorphism with no invariant subspace.

*Needs:* Mathlib `Submodule`, `LinearMap`, `Module.finrank` and `Module.Basis`.

### 4.4 Period multiplicity spaces

For finite F/ℚ_p, a finite-dimensional continuous L-representation V of G_F and a supercuspidal M of slope 1/2, define H_M(V) = Hom_{L[G_F]}(V, X⁺_st(M)) and H_C(V) = Hom_{L[G_F]}(V, L⊗_ℚ_p C) (CDN20, §2.1.2 and Remarque 2.3, lines 800–821). H_M(V) is finite-dimensional over L and H_C(V) is finite over L⊗F. θ induces an injection ι: H_M(V) → M_dR⊗_{L⊗F}H_C(V). The coefficients are L⊗_ℚ_p F, which is not identified with L when F ≠ ℚ_p.

Its API:

- H_C(V) = (C⊗_ℚ_p V^∨)^{G_F} with its L⊗F-module structure.
- ι is injective because M has positive slope.
- A Galois map V → W induces H_M(W) → H_M(V) and H_C(W) → H_C(V), commuting with ι.

**Checks.**

- Both spaces vanish at V = 0.
- For V = L trivial, H_C(L) = C^{G_F}⊗L = F⊗L.
- For F = ℚ_p and V = V_{M,ℒ}, H_M(V) is one-dimensional and its θ-image is ℒ⊗H_C(V) ⊂ M_dR⊗H_C(V) (CDN20, Lemme 2.7, line 911).

*Needs:* §0.3; PadicHodgeTheory §§3.3 and 5.3.

### 4.5 The fundamental diagram after Galois multiplicities

For supercuspidal M ∈ ΦNᵖ_n and finite-dimensional continuous V of G_ℚ_p, apply Hom_{G_ℚ_p}(V, −) to §4.1 and prove that the result is a commutative diagram with exact rows (CDN20, Proposition 2.4, line 822):

    0 → H_C(V)⊗O[M] → Hom_{G_ℚ_p}(V, H¹_proét[M]) → H_M(V)⊗_L LL(M)′_b → 0
    0 → H_C(V)⊗O[M] → H_C(V)⊗Ω¹[M] → H_C(V)⊗M_dR⊗_L LL(M)′_b → 0

The vertical maps are id, dlog and ι⊗id, injective with closed image. Surjectivity on the right does not follow from exactness of Hom. The route proves that H¹(G_ℚ_p, C⊗̂O[M]⊗V^∨) → H¹(G_ℚ_p, C⊗̂Ω¹[M]⊗V^∨) is injective, as in the proof of Proposition 2.4. It identifies the terms using finite-dimensionality of H_C(V) and the identity (X⊗̂B)^G ≅ X^G⊗̂B for a Banach space B with trivial action (CDN23, Lemme 5.5, line 2411).

**Checks.**

- The left square is the identity on H_C(V)⊗O[M].
- For V = 0 every term is 0.
- dlog has closed image, which is needed to keep the middle term Fréchet. An abstract injection with nonclosed image would not give a strict sequence.

*Needs:* §§4.1 and 4.4; PadicLocalLanglandsForGL2Qp §0.1; LocallyAnalyticDistributions §0.0.

### 4.6 Classification of rank-two period multiplicities

For finite F/ℚ_p, supercuspidal M and V a representation of G_F, prove the following (CDN20, Proposition 2.5, Remarque 2.6 and Lemme 2.7, lines 859–913):

- Hom_{G_F}(V, X_st(M)) ≅ Hom_{WD_F}(M[−1]*, D_pst(V*)).
- If dim V = rank M and this Hom is nonzero, then V is supercuspidal, D_pst(V) ≅ M[−1] and the Hom is one-dimensional.
- For F = ℚ_p and V two-dimensional, H_M(V) ≠ 0 exactly when V ≅ V_{M,ℒ} for a unique line ℒ.

For F ≠ ℚ_p the embeddingwise Hodge–Tate weights κ_{i,σ} ≥ 0 with Σκ_{i,σ} = [F:ℚ_p] allow representations other than V_{M,ℒ}, and the last statement is not asserted. The source's proof prints the dimension count of the equal-rank Hom in reverse (source correction E15).

**Checks.**

- A character V cannot embed in X⁺_st(M) for supercuspidal M, since M[−1]* has no one-dimensional WD-quotient.
- For F = ℚ_p and V two-dimensional, the weight constraint κ₁, κ₂ ≥ 0 with κ₁+κ₂ = 1 forces weights {0,1}.
- For F of degree two over ℚ_p, weights (0,0) at one embedding and (1,1) at the other satisfy the constraints but do not give a V_{M,ℒ}.

*Needs:* §§0.3 and 4.4; PadicHodgeTheory §§5.3–5.4.

### 4.7 The line extension W_{M,ℒ}

For supercuspidal M ∈ ΦNᵖ_n and a line ℒ ⊂ M_dR, let W′_{M,ℒ} be the preimage of ℒ⊗LL(M)′_b under Ω¹[M]^{G_ℚ_p} → M_dR⊗LL(M)′_b (§4.1). Let ℒ^{−1} = M*_dR/ℒ^⊥, so that ℒ^{−1}⊗ℒ = L canonically, and put W_{M,ℒ} = ℒ^{−1}⊗_L W′_{M,ℒ}. Its quotient is LL(M)′_b through evaluation (CDN20, §2.1.5, lines 917–951). Prove that W_{M,ℒ} ≅ (Π^an_{M,ℒ})′_b. This is CDN20 Proposition 2.9 (line 952), which the source deduces from DLB17 for trivial central character. Here it follows from §3.3(ii) for every M ∈ ΦNᵖ_n. Also prove Hom_{G_ℚ_p}(V_{M,ℒ}, H¹_proét[M]) ≅ W_{M,ℒ} (CDN20, Proposition 2.10, line 962).

Its API:

- W′_{M,ℒ} is the full inverse image of ℒ⊗LL(M)′_b in Ω¹[M]^{G_ℚ_p}.
- W_{M,ℒ} = ℒ^{−1}⊗W′_{M,ℒ}, whose quotient is LL(M)′_b through ℒ^{−1}⊗ℒ = L.
- W_{M,ℒ} ≅ (Π^an_{M,ℒ})′_b, compatibly with the scalar of §3.3.
- Hom_{G_ℚ_p}(V_{M,ℒ}, H¹_proét[M]) ≅ W_{M,ℒ}, respecting the G-action and the topology.

**Checks.**

- Replacing a generator e of ℒ by ae, a ∈ L^×, replaces the dual generator by a⁻¹e*. The normalised quotient map is unchanged.
- For ℒ ≠ ℒ′, W′_{M,ℒ} ∩ W′_{M,ℒ′} = dO[M].
- W′_{M,ℒ} ≠ Ω¹[M]^{G_ℚ_p}, since M_dR/ℒ ≠ 0 and LL(M) ≠ 0.

*Needs:* §§3.3, 4.1, 4.5 and 4.6; §0.4.

### 4.8 G-bounded vectors

For a continuous L-linear action of G on a Hausdorff locally convex L-space E, call v ∈ E G-bounded when the orbit {gv : g ∈ G} is von Neumann bounded (Mathlib `Bornology.IsVonNBounded`). Write E^b for the G-bounded vectors (CDN23 lines 2378–2380; CDN20, §2.2.1, line 1009). If E is normed, this means the orbit has bounded norm (`NormedSpace.image_isVonNBounded_iff`). If the topology is given by seminorms (p_i), it means that for each i the values p_i(gv) are bounded, with a bound depending on i (`WithSeminorms.image_isVonNBounded_iff_seminorm_bounded`). These criteria are pinned Mathlib theorems and are not restated here.

Its API:

- E^b is a G-stable L-subspace containing 0.
- A continuous G-equivariant L-linear map E → E′ carries E^b into E′^b, compatibly with identity and composition.
- For an isometric action on a normed space, E^b = E.

**Checks.**

- For the trivial action every vector is G-bounded, since its orbit is a point.
- For G = ℤ acting on ℚ_p by n·x = p^nx, a nonzero x is not bounded: |p^nx| = p^{−n}|x| is unbounded as n → −∞.
- On a Fréchet space with seminorms (p_i), take a vector v with p_i(v) = 1 for all i and the action of ℤ fixing v. Replacing p_i by i·p_i keeps the topology and v stays bounded, though no single constant bounds all i·p_i(v). The condition is ∀i ∃C_i, not ∃C ∀i.

*Needs:* Mathlib `Bornology.IsVonNBounded`, `NormedSpace.image_isVonNBounded_iff` and `WithSeminorms.image_isVonNBounded_iff_seminorm_bounded`.

### 4.9 Étale cohomology as bounded vectors

Prove that H¹_ét(M^p_{n,C}, L(1)) → H¹_proét(M^p_{n,C}, L(1)) is injective with image exactly the G-bounded vectors (CDN20, Proposition 2.12, line 1020; CDN23, Proposition 5.6, line 2420). The same holds for each M-multiplicity. Prove also that L⊗O(M^p_{n,C}) has no nonzero G-bounded vectors in a supercuspidal sector: O(M^p_{n,C})[M]^b = 0 for supercuspidal M (CDN23, proof of Théorème 5.24(i), lines 2791–2793 and footnote 31). There are two reasons. Bounded functions are constant on connected components. The action of Ǧ on the components factors through Nrd (gap:drinfeld-components), so only one-dimensional JL(M) occur.

The route has three steps. The integral global group has a G-stable bounded unit ball, which gives one inclusion. For the other, choose a cocompact free subgroup Γ of G acting on the Bruhat–Tits tree, and finitely many affinoids whose Γ-translates cover the tower. Boundedness on these translates gives one integral denominator on a finite union, and the Čech sequence of the Stein covering (EndoscopicTransferAndUnitaryTraceComparison §12.21) patches it globally. Rational étale cohomology is L⊗ the integral group, formed after the inverse limit.

**Checks.**

- Separate seminorm bounds on the pro-étale Fréchet space give a single integral denominator only after the cocompact tree cover. Without it, the argument proves boundedness affinoid by affinoid only.
- A constant function on M^p_{n,C} is G-bounded and lies in the trivial sector. Its supercuspidal multiplicity is 0, since dim JL(M) > 1 and Ǧ acts on constants through Nrd.
- The rational étale group is L⊗lim_k of integral groups, not lim_k of groups already tensored with L, which would vanish on p^k-torsion.

*Needs:* §4.8; EndoscopicTransferAndUnitaryTraceComparison §§12.19 and 12.21; gap:drinfeld-components.

### 4.10 Bounded duals and universal completions

Prove the following (CDN23, Lemme 5.3, line 2381; CDN20, Corollaire 2.13, line 1078):

- (a) If Π is a unitary Banach representation of G, then (Π′_b)^b = Π′_b.
- (b) If π₀ is smooth admissible of finite length, then (π₀′_b)^b ≅ (π̂₀)′_b, where π̂₀ is its universal unitary completion.
- (c) If Π is admissible unitary of finite length, then ((Π^an)′_b)^b = Π′_b.

Consequently Hom_{G_ℚ_p}(V_{M,ℒ}, H¹_ét[M]) ≅ Π_{M,ℒ}′_b for supercuspidal M ∈ ΦNᵖ_n. The route proves (a) and (b) by the Banach–Steinhaus theorem (Mathlib `WithSeminorms.banach_steinhaus`), the gauge of O_L[G]v₁+⋯+O_L[G]v_r and the invariant Banach norm. It proves (c) by the analytic universal-completion theorem of the base roadmap §2.5. The consequence follows from §§4.7 and 4.9.

**Checks.**

- For Π = L trivial, Π′_b = L and every vector is bounded.
- For π₀ = St^sm, (b) gives (St^cont)′_b by §4.2.
- (c) fails without finite length or admissibility hypotheses on Π; they are part of the statement.

*Needs:* §§4.7–4.9; PadicLocalLanglandsForGL2Qp §§0.1, 2.5 and 3.11; Mathlib `WithSeminorms.banach_steinhaus`.

### 4.11 Occurrence and finite length for finite-dimensional Galois representations

For a finite-dimensional continuous L-representation V of G_ℚ_p and supercuspidal M ∈ ΦNᵖ_n, prove the following (CDN20, Théorème 2.15, line 1090, with Lemmes 2.17–2.18):

- Hom_{G_ℚ_p}(V, H¹_ét[M]) ≠ 0 exactly when, after a finite extension of L, V has a quotient V_{M,ℒ}.
- Its strong dual Π_M(V) is an admissible unitary Banach representation of finite length whose irreducible constituents are among the Π_{M,ℒ}.

No exactness of V ↦ Π_M(V) is asserted. The route treats the case where no quotient V_{M,ℒ} occurs first. Then the period multiplicity subspace of M_dR⊗H_C(V) is transverse to every line, so it is the graph of a partial operator A: S → H_C(V) with no nonzero invariant subspace. Apply §4.3 with distinct eigenvalues to embed the pro-étale Hom into a sum of analytic duals for distinct lines. Taking bounded vectors (§4.10) gives a sum of pairwise non-isomorphic irreducible Banach duals, which forces vanishing. When a permitted quotient exists, induct on dim V using the left-exact Hom sequence and the finite-length Banach category of the base roadmap §0.1.

**Checks.**

- A non-split extension V of V_{M,ℒ} by a character has the quotient V_{M,ℒ}. The theorem applies to it without assuming V semisimple.
- For V = V_{M,ℒ}⊕V_{M,ℒ′} with ℒ ≠ ℒ′, Π_M(V) = Π_{M,ℒ}⊕Π_{M,ℒ′} has length two.
- For V a character, the Hom into a supercuspidal sector vanishes (§4.6).

*Needs:* §§4.3, 4.5, 4.6 and 4.10; PadicLocalLanglandsForGL2Qp §§0.1 and 3.8.

### 4.12 Banach multiplicities in differentials

Let Π be an absolutely irreducible admissible unitary Banach L-representation of G. Prove that Hom_G(Π′_b, L⊗Ω¹(M^p_{n,ℚ_p})) is:

- ℒ⊗JL(M) if Π ≅ Π_{M,ℒ} for a supercuspidal M ∈ ΦNᵖ_n;
- δ_Ǧ if Π ≅ St^cont⊗δ_G with Sp⊗δ ∈ ΦNᵖ_n, that is, δ(p)² = 1 and δ∘Nrd trivial on 1+ϖ_D^nO_D;
- 0 otherwise.

The line ℒ is part of the answer, not an unnamed one-dimensional space. Source: CDN23, Proposition 5.7 (line 2424), whose proof decomposes over M ∈ ΦNᵖ (line 2434). The statement prints the condition as level ≤ n (source correction E16). The route has three steps. For supercuspidal M, apply Hom_G(Π′_b, −) to 0 → (Π^an_{M,ℒ})′_b → Ω¹[M] → (M_dR/ℒ)⊗LL(M)′_b → 0 from §3.3(ii). A second line ℒ′ bounds the dimension by one. For special M, use §4.2.

**Checks.**

- Let π₀ have trivial central character and χ be unramified with χ(p) = 1+p, and put M = M(π₀⊗χ∘det). Then M has level at most n but M ∉ ΦNᵖ, and Hom_G(Π′_{M,ℒ}, L⊗Ω¹(M^p_{n,ℚ_p})) = 0. The printed condition "level ≤ n" would predict ℒ⊗JL(M).
- For an ordinary absolutely irreducible Π, Hom_G(Π′_b, (Π^an_{M,ℒ})′_b) = 0 and Hom_G(Π′_b, LL(M)′_b) = 0, so the multiplicity vanishes.
- For Π = Π_{M,ℒ}, Hom_G(Π′_b, (Π^an_{M,ℒ′})′_b) = 0 for ℒ′ ≠ ℒ, which bounds the dimension by one.

*Needs:* §§0.1, 3.3, 4.2 and 4.10; PadicLocalLanglandsForGL2Qp §§3.8 and 4.2.

### 4.13 Banach multiplicities in étale cohomology

With Π as in §4.12, prove that Hom_G(Π′_b, H¹_ét(M^p_{n,C}, L(1))) is G_ℚ_p×Ǧ-equivariantly and topologically isomorphic to:

- V_{M,ℒ}⊗JL(M) for Π ≅ Π_{M,ℒ} with supercuspidal M ∈ ΦNᵖ_n;
- δ⊗δ_Ǧ for Π ≅ St^cont⊗δ_G with Sp⊗δ ∈ ΦNᵖ_n;
- 0 otherwise.

Source: CDN23, Théorème 5.8 (line 2465), with the condition corrected as in §4.12 (source correction E16). Prove first that restriction gives an isomorphism Hom_G((Π^an)′_b, H¹_proét) ≅ Hom_G(Π′_b, H¹_ét) (CDN23, Lemme 5.9, line 2481). Injectivity uses density of Π′ in (Π^an)′. Surjectivity extends a map along Π′⊗_{Λ(K)}D(K) ≅ (Π^an)′, the Schneider–Teitelbaum identification of the base roadmap §0.1. Then apply Hom_G((Π^an)′_b, −) to the exact sequence 0 → H¹_proét[M] → Ω¹[M] → ((C⊗M_dR)/X⁺_st(M))⊗̂LL(M)′_b → 0 derived from §4.1. The completed tensor-Hom identity Hom(E, F⊗̂D) ≅ Hom(E,F)⊗̂D for nuclear Fréchet E and Fréchet F, D (CDN23, Lemme 5.4, line 2401) and §4.12 give the kernel X⁺_st(M) ∩ (ℒ⊗C) = V_{M,ℒ}.

**Checks.**

- The Hom is from Π′_b into cohomology. Reversing the direction would replace V_{M,ℒ} by its dual.
- For Π = Π_{M,ℒ} the answer is two-dimensional over L times JL(M), not one-dimensional as in §4.12. The Galois factor V_{M,ℒ} replaces the line ℒ.
- For the unramified twist of §4.12 the answer is 0.

*Needs:* §§4.1, 4.9, 4.10 and 4.12; PadicLocalLanglandsForGL2Qp §0.1; LocallyAnalyticDistributions §§0.0 and 0.3.

### 4.14 Galois multiplicities and vanishing in higher dimension

For an absolutely irreducible continuous L-representation V of G_ℚ_p, prove that Hom_{W_ℚ_p}(V, H¹_ét(M^p_{n,C}, L(1))) is:

- Π(V)′_b⊗JL(M) if V ≅ V_{M,ℒ} with supercuspidal M ∈ ΦNᵖ_n;
- (St^cont⊗δ_G)′_b⊗δ_Ǧ if V = δ is a character with Sp⊗δ ∈ ΦNᵖ_n;
- 0 otherwise.

In particular the multiplicity is 0 for dim V ≥ 3. Sources: CDN20, Théorème 0.2 (line 130) and Corollaire 2.16 (line 1108); CDN23, Théorème 5.1 (line 2357) and Théorème 5.10 (line 2541). On the full tower M_n the source condition is level ≤ n (CDN23, Théorème 5.1); on the p-central quotient it is membership in ΦNᵖ_n (source correction E16). Weil equivariance extends to G_ℚ_p-equivariance by continuity of the descended action.

For dimension two the route uses §§4.6 and 4.10, and for dimension one §4.2. For dimension at least three there are two routes:

- the occurrence theorem §4.11, valid for every p;
- for p > 2, the finite length of the mod p cohomology (gap:modp-drinfeld-finite-length). It makes Π(V) := Hom(V, H¹_ét)′ an admissible unitary Banach representation of finite length. After a finite extension of L it contains an absolutely irreducible Π, which contradicts §4.13.

**Checks.**

- An absolutely irreducible V of dimension three has multiplicity 0.
- A character δ with δ(p)² = 1 and δ∘Nrd of level ≤ n contributes through the Steinberg branch. It is not a supercuspidal exception.
- The unramified twist with χ(p) = 1+p of §0.1 gives V ≅ V_{M,ℒ} with M ∉ ΦNᵖ. Its multiplicity on M^p_n is 0, although on the full tower it is nonzero.

*Needs:* §§4.2, 4.6, 4.10, 4.11 and 4.13; PadicLocalLanglandsForGL2Qp §0.1; gap:modp-drinfeld-finite-length.

### Examples

For supercuspidal M ∈ ΦNᵖ_n and ℒ ⊂ M_dR, the three multiplicities are as follows:

- of Π_{M,ℒ}′ in Ω¹: ℒ⊗JL(M), of dimension dim JL(M);
- of Π_{M,ℒ}′ in H¹_ét: V_{M,ℒ}⊗JL(M), of dimension 2·dim JL(M);
- of V_{M,ℒ} in H¹_ét: Π_{M,ℒ}′⊗JL(M).

For the Steinberg type Sp, H¹_ét[Sp] is (St^cont)′_b with trivial Galois action.

### Dependencies

Layers 0 and 3; PadicLocalLanglandsForGL2Qp §§0.1, 2.5, 3.8, 3.11 and 4.2; EndoscopicTransferAndUnitaryTraceComparison §§12.4, 12.7, 12.14, 12.19 and 12.21; LocallyAnalyticDistributions §§0.0, 0.2, 0.3 and 0.CR.6.6; PadicHodgeTheory §§3.3 and 5.3–5.4; SmoothRepresentationsOfLocalGroups SR.2; Mathlib's von Neumann bornology; gap:drinfeld-components; gap:modp-drinfeld-finite-length.

## Layer 5: The integral arithmetic block decomposition

Fix n. Write H^{1,+}_{k,K} = H¹_ét(M^p_{n,K}, (O_L/p^k)(1)) for finite K/ℚ_p and H^{1,+}_{k,C} for the geometric fibre. In this layer p > 2, the hypothesis under which the mod p finiteness input holds (CDN23 lines 1776 and 1795).

### 5.1 Arithmetic completed cohomology at fixed level

Define H^{1,+}_{ℚ̄_p} = lim_k colim_{[K:ℚ_p]<∞} H^{1,+}_{k,K} with its p-adic topology, and H¹_{ℚ̄_p} = L⊗_{O_L}H^{1,+}_{ℚ̄_p}. The level n stays fixed; only K and k vary (CDN23, §5.3.1, lines 2627–2634). Prove that H^{1,+}_{ℚ̄_p} → H^{1,+}_C := H¹_ét(M^p_{n,C}, O_L(1)) is injective. Its image is the set of almost-smooth classes: those whose reduction modulo p^k is fixed by an open subgroup of G_ℚ_p for every k, the subgroup depending on k (CDN23, Proposition 5.16, line 2635). The route uses the Hochschild–Serre sequence for G_K acting on H^{1,+}_{k,C}. H⁰ of the geometric fibre is finite because M^p_{n,C} has finitely many connected components (gap:drinfeld-components), so colim_K H^j(G_K, H⁰) = 0 for j = 1, 2.

Its API:

- H^{1,+}_{ℚ̄_p} and H¹_{ℚ̄_p} are defined by the stated limits. The prime p is inverted after both limits.
- The map to H^{1,+}_C is G×Ǧ×G_ℚ_p-equivariant, continuous and injective, with image the almost-smooth classes.
- Restriction and corestriction in n commute with the arithmetic and geometric maps; the definition keeps n fixed.

**Checks.**

- An almost-smooth class may need a smaller open subgroup for each k. Requiring one open subgroup for the whole integral class gives a strictly smaller set in general.
- L⊗lim_k is not lim_k(L⊗−): the latter vanishes on the p^k-torsion groups H^{1,+}_{k,K}.
- Replacing the fixed level by a limit over n gives a different object. No limit over n enters the factorisation.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §§12.19 and 12.21; gap:drinfeld-components.

### 5.2 Saturation and finite-K pieces

Prove that H^{1,+}_{ℚ̄_p} is p-torsion-free, p-adically complete and p-saturated in H^{1,+}_C, and that each H^{1,+}_{ℚ̄_p}/p^k is a smooth G_ℚ_p-module (CDN23, Corollaire 5.17, line 2658). Prove that for every finite K/ℚ_p and k ≥ 1, (H^{1,+}_{ℚ̄_p}/p^k)^{G_K} with its induced topology is the Pontryagin dual of a smooth O_L[G′]-representation of finite length, where G′ = G/p^ℤ (CDN23, Proposition 5.19, line 2673). The route embeds it continuously into (H^{1,+}_{k,C})^{G_K}, which is profinite and dual to a representation of finite length by gap:modp-drinfeld-finite-length. For compact open H ⊂ G the induced O_L[[H]]-module is finitely generated and separated, so its given topology is the compact module topology.

**Checks.**

- The invariant piece is compact in its induced topology. Algebraic finite generation over O_L[[H]] alone is not the topological assertion.
- p-saturation means that x ∈ H^{1,+}_C with px ∈ H^{1,+}_{ℚ̄_p} lies in H^{1,+}_{ℚ̄_p}. The sublattice p·H^{1,+}_{ℚ̄_p} is also p-torsion-free and p-adically complete but is not saturated when nonzero: an x outside it has px inside it.
- For k = 1 the pieces are duals of smooth k_L[G′]-modules of finite length.

*Needs:* §5.1; gap:modp-drinfeld-finite-length.

### 5.3 Cohomological block multiplicities

Use the base roadmap's projective envelope P_B of a block B, E_B = End(P_B) with ordinary composition, and R_B^{ps} (§§5.1–5.4). Define the following (CDN23 lines 2716–2745 and 2757–2769):

- m_{n,B} = Hom^cont_G(P_B, H^{1,+}_{ℚ̄_p}), with its p-adic topology;
- its continuous O_L-dual m̌_{n,B} = Hom^cont_{O_L}(m_{n,B}, O_L);
- after inverting p and taking the M-part, m_{B,M} = Hom^cont_{G×Ǧ}(P_B⊗JL(M), H¹_{ℚ̄_p}).

Hom(P_B, −) is a right E_B-module, so evaluation m_B(X)⊗̂_{E_B}P_B → X is balanced (base roadmap, Conventions).

Its API:

- Evaluation sends f⊗x to f(x), with f·e ⊗ x and f ⊗ e·x identified for e ∈ E_B.
- m̌_{n,B} is a compact p-torsion-free O_L-module. It is the O_L-dual of m_{n,B}, not m_{n,B} itself.
- m_B(H¹_{ℚ̄_p}) = L⊗m_{n,B}, by compactness of P_B.
- G_ℚ_p acts on m_{n,B} by postcomposition and commutes with E_B and with R_B^{ps}.
- m_{B,M} = Hom_G(P_B, H¹_{ℚ̄_p}[M]).

**Checks.**

- If X lies in a block B′ ≠ B, Hom(P_B, X) = 0.
- For X = Y⊗JL(M) with Ǧ acting only on the second factor, m_{B,M}(X) ≅ Hom_G(P_B, Y).
- The O_L-valued dual m̌_{n,B} is compact, while the Pontryagin dual into L/O_L is discrete. Confusing the two changes the finiteness statement of §5.5.

*Needs:* §§0.2 and 5.1; PadicLocalLanglandsForGL2Qp §§5.1–5.4.

### 5.4 Integral block evaluation

Prove that evaluation identifies H^{1,+}_{ℚ̄_p} with the p-adic completion of ⊕_B m_{n,B}⊗_{E_B}P_B, and that m_{n,B}/p^k ≅ Hom_G(P_B, H^{1,+}_{ℚ̄_p}/p^k) (CDN23, Proposition 5.21, line 2716). The route has four steps:

- On each finite-K piece of §5.2, which is compact of finite length, apply the Gabriel–Morita decomposition of the base roadmap §§5.1 and 5.3.
- Pass through colim_K using compactness of P_B.
- For surjectivity of reduction, finite length puts a map P_B → (X/p^j)^{G_K} into the image of one (X/p^{j+1})^{G_{K′}}, and projectivity of P_B lifts it.
- Pass to the p-adic limit.

This extends the base roadmap's compact Morita evaluation to the noncompact p-adically complete target.

**Checks.**

- Modulo p^k each vector has finite block support, but the finite set of blocks may grow with k.
- The completed sum is neither the algebraic direct sum nor the product over all blocks. An element with nonzero components in infinitely many blocks, tending to zero p-adically, lies in it.
- m_{n,B} is p-torsion-free, so m_{n,B}/p^k → Hom(P_B, X/p^k) is injective. Surjectivity is the content of the lifting step.

*Needs:* §§5.2–5.3; PadicLocalLanglandsForGL2Qp §§5.1 and 5.3.

### 5.5 Finite generation of the dual multiplicity

Prove that m̌_{n,B} is a finitely generated R_B^{ps}-module (CDN23, Théorème 5.22, line 2746). This concerns the O_L-dual; m_{n,B} itself is not asserted to be finitely generated. The route uses topological Nakayama. It injects (m_{n,B}/ϖ)[𝔪] into Hom_G(k_L⊗_{R_B^{ps}}P_B, H¹_ét(M^p_{n,C}, k_L(1))). By Paškūnas–Tung (base roadmap §6.7), k_L⊗P_B = π^∨ for a smooth admissible π of finite length. The Hom is then finite-dimensional by gap:modp-drinfeld-finite-length.

**Checks.**

- The residual Hom is finite-dimensional. Finite length of the arithmetic invariants alone does not bound this geometric multiplicity.
- For a block with no constituent in the cohomology, m̌_{n,B} = 0, which is finitely generated.
- Topological Nakayama applies because m̌_{n,B} is compact. For the discrete Pontryagin dual it would not.

*Needs:* §§5.3–5.4; PadicLocalLanglandsForGL2Qp §§5.4 and 6.7; gap:modp-drinfeld-finite-length.

### 5.6 Type decomposition, level stability and central character

Prove the following (CDN23, Remarque 5.23, lines 2762–2776):

- Only finitely many M have H¹_{ℚ̄_p}[M] ≠ 0, and H¹_{ℚ̄_p} = ⊕_M H¹_{ℚ̄_p}[M]⊗JL(M), hence m_B(H¹_{ℚ̄_p}) = ⊕_M m_{B,M}⊗JL(M).
- For n at least the level of M, m_{B,M} is independent of n. Since p is inverted, Ǧ-equivariant projectors are built by composing restrictions and corestrictions.
- Z(G) acts on m_{B,M} by a character δ_M, the inverse of the central character of JL(M), because the diagonal centre acts trivially on the tower (EndoscopicTransferAndUnitaryTraceComparison §12.14).

**Checks.**

- Level independence holds only after inverting p. Averaging restriction–corestriction over Ǧ_n/Ǧ_{n′} divides by its order, a power of p.
- For X = Y⊗JL(M) with the diagonal centre acting trivially, z ∈ Z(G) acts on Y by ω_{JL(M)}(z)⁻¹. Omitting the inverse would give the wrong fixed-determinant ring R_B^{ps,δ_M}.
- For special M = Sp⊗δ, δ_M = δ⁻² as a character of ℚ_p^×.

*Needs:* §§0.1, 0.2, 5.1 and 5.3; EndoscopicTransferAndUnitaryTraceComparison §12.14.

### Examples

For a block B containing no constituent of H¹_ét(M^p_{n,C}, k_L), m_{n,B} = 0. For the block of the Steinberg reduction St⊗η̄, the special type Sp⊗η contributes the character η of G_ℚ_p (§6.2).

### Dependencies

Layers 0 and 4; PadicLocalLanglandsForGL2Qp §§5.1–5.4 and 6.7; EndoscopicTransferAndUnitaryTraceComparison §§12.14, 12.19 and 12.21; gap:drinfeld-components; gap:modp-drinfeld-finite-length.

## Layer 6: Interpolated factorisation over type rings

The full-type ring R_{B,M}, its integral image R⁺_{B,M} and its free rank-two family ρ_{B,M} are the base roadmap's `WDTypeRing` (§5.12), compared with deformation rings by LocalGaloisDeformationRings §3.8. R_{B,M} is a finite product of principal ideal domains; it is zero when the type locus in B is empty.

### 6.1 The interpolated Banach dual

Let M be supercuspidal. Choose a G_ℚ_p-stable R⁺_{B,M}-lattice ρ^{⋄,+} in the R_{B,M}-dual of ρ_{B,M}. Write its Pontryagin dual as colim_i V_i over finite quotients of R⁺_{B,M}, and define Π*(ρ_{B,M}) = L⊗_{O_L} lim_i Π(V_i)^∨, using the integral correspondence of the base roadmap §§3.3 and 3.8 on each finite-length V_i (CDN23, Définition 5.14, line 2606). Prove the following:

- Π*(ρ_{B,M}) is independent of the lattice up to compatible canonical isomorphism.
- It agrees with the rationalisation of D(ρ^{⋄,+})^♮⊠ℙ¹, and with Hom^cont_{R_{B,M}}(LL_B(M), R_{B,M}) for the B-adic completion LL_B(M) of the base `KisinRingLL.completion`.
- κ(x)⊗_{R_{B,M}}Π*(ρ_{B,M}) ≅ Π(ρ_x)′_b at every closed point x.

The fibre property is a theorem about the construction, not its definition. For absolutely irreducible ρ̄_B, compare with the universal family Π^univ of the base §5.8. Its fibre at x is Π(ρ_x(ε)), whose strong dual relates to Π(ρ_x)′_b by the cyclotomic twist ε and the duality of §0.2.

Its API:

- Π*(ρ) = L⊗lim_iΠ(V_i)^∨ from the stable dual lattice and its finite quotients.
- For closed x, κ(x)⊗Π*(ρ) ≅ Π(ρ_x)′_b, G-equivariantly.
- Commensurable stable lattices give the same rational object.
- Π*(ρ) ≅ Hom^cont_{R_{B,M}}(LL_B(M), R_{B,M}), with the B-adic topology.
- If R_{B,M} = 0, then Π*(ρ) = 0.

**Checks.**

- At a closed point x the fibre is Π(V_{M,ℒ_x})′_b, with ℒ_x the line of the Galois fibre ρ_x (§0.3).
- An empty type locus gives zero, not a residual constant family.
- Two R_{B,M}-modules can have the same closed fibres and differ by non-separated or non-finite pieces, so the construction must keep the integral limit. Using a lattice in ρ rather than in its dual, with the same integral correspondence, reverses the duality convention.

*Needs:* §§0.3 and 0.4; PadicLocalLanglandsForGL2Qp §§3.3, 3.5, 3.6, 3.8, 5.8 and 5.12; LocalGaloisDeformationRings §3.8.

### 6.2 The special-type convention

For special M = Sp⊗η, put R_{B,M} = L. If B is the block of St⊗η̄_G, put ρ_{B,M} = η, a character of G_ℚ_p through reciprocity, and Π*(ρ_{B,M}) = (St^cont⊗η_G)′_b. For every other block put ρ_{B,M} = 0 and Π*(ρ_{B,M}) = 0 (CDN23, §5.2, lines 2553–2557).

Its API:

- R_{B,M} = L for special M.
- In the Steinberg block the Galois factor is η, of rank one, and the G-factor is (St^cont⊗η_G)′_b.
- In all other blocks the contribution is zero.

**Checks.**

- For η = 1 the Galois factor is L with trivial action, not a rank-two semistable extension.
- A block not containing St⊗η̄_G contributes zero.
- Replacing η by ηχ twists the Galois factor by χ, the G-factor by χ_G and JL(M) by χ_Ǧ. This matches §4.14.

*Needs:* §§4.2 and 5.6; PadicLocalLanglandsForGL2Qp §§5.1–5.2.

### 6.3 Rigidity over principal ideal domains

Let A be a principal ideal domain with infinitely many prime ideals, or a finite product of such. Let V and W be representations of G_ℚ_p on finitely generated locally free A-modules whose specialisations at every closed point are absolutely irreducible. If these specialisations are pairwise isomorphic at every closed point, then V ≅ W (CDN23, Lemme 5.12, line 2574). Prove this as follows. Traces agree modulo every maximal ideal, hence agree, since the maximal ideals meet in 0. Irreducibility at the generic point holds, as otherwise almost all specialisations would be reducible. So V and W are isomorphic over the fraction field. Write the intertwiner in Smith normal form P·diag(λ₁,…,λ_d)·Q with λ₁ | ⋯ | λ_d, scaled so that λ₁ is a unit. A non-unit λ_i would make V or W reducible modulo a maximal ideal dividing it. The same statement holds for representations of a product E×G_ℚ_p with a finite-dimensional algebra E acting compatibly.

**Checks.**

- Over a discrete valuation ring O there is only one closed point. V = ρ and W = ρ⊗χ, with χ a nontrivial unramified character congruent to 1, have isomorphic absolutely irreducible reductions but are not isomorphic. So the hypothesis of infinitely many primes is needed.
- For A = L[T] and V = W the statement is trivial.
- For A = L[T], a representation that is reducible over L(T) stays reducible modulo all but finitely many maximal ideals. So irreducibility at all closed points forces generic irreducibility; with finitely many closed points this step fails.

*Needs:* Mathlib `Submodule` and `Module.Basis`.

### 6.4 The type annihilator

For p > 2 and supercuspidal M ∈ ΦNᵖ_n, prove that R_B^{ps,δ_M}[1/p] acts on m_{B,M} through its quotient R_{B,M}. Equivalently, I_{B,M} = ker(R_B^{ps,δ_M}[1/p] → R_{B,M}) kills the whole module, not only its closed fibres (CDN23, Théorème 5.24(i), lines 2779–2800). The route has four steps:

- Since O[M]^b = 0 (§4.9), bounded vectors in §4.1 embed H¹_ét[M] into X⁺_st(M)⊗̂(LL(M)^∧)′_b.
- Choose a G-stable O_L-lattice in LL(M), complete it p-adically and take its B-adic quotient. This is `KisinRingLL.completion` of the base §5.12.
- The B-adic quotient is p-torsion-free and complete, and is killed by J = Z_B^{δ_M} ∩ I_{B,M}, where Z_B^{δ_M} is the lattice R_B^{ps,δ_M}/O_L-torsion. Its reduction maps are surjective.
- Every map from the compact P_B factors through a finite-length block quotient, so the two actions of R_B^{ps} agree and I_{B,M} kills Hom_G(P_B, H¹_ét[M]).

**Checks.**

- Killing every closed fibre does not imply killing the module. Over L[T], the ideal (T) kills N⊗κ(x) for N = L[T]/(T²) at every closed point x, but T·1 ≠ 0 in N.
- For special M the statement is immediate from §6.2.
- If R_{B,M} = 0, then I_{B,M} is the unit ideal and m_{B,M} = 0.

*Needs:* §§4.1, 4.9, 4.10, 5.5 and 5.6; PadicLocalLanglandsForGL2Qp §§5.4–5.6 and 5.12; LocalGaloisDeformationRings §3.8.

### 6.5 Structure of the typed multiplicity

For p > 3, prove that there is an E_B^{δ_M}[G_ℚ_p]-equivariant isomorphism m_{B,M} ≅ m_B^{δ_M}(Π*(ρ_{B,M}))⊗_{R_{B,M}}ρ_{B,M}⊗_{R_{B,M}}Ř_{B,M}. Here Ř_{B,M} = Hom^cont_L(R_{B,M}, L), with (rℓ)(s) = ℓ(rs) (CDN23, Théorème 5.24(ii), lines 2779–2782 and footnote 32, line 2861). The route has five steps:

- At a closed point x, compute m_{B,M}[𝔪_x] using the base roadmap's Morita specialisation and §4.13.
- Pass to continuous L-duals.
- Prove that these duals are finite locally free over each principal ideal domain factor of R_{B,M}. The source asserts this without argument (source correction E18).
- Apply §6.3 to the joint action of E_{B,M}×G_ℚ_p. All closed fibres are absolutely irreducible for this joint action. For p > 3, generic semisimplicity of E_{B,M} and its characteristic-zero trace determine the generic representation (footnote 32; source correction E13).
- Dualise back; Ř_{B,M} accounts for the continuous dual of the coefficient ring.

The special case is §6.2. The formula concerns the rational module; no formula for m_{n,B} before inverting p is asserted.

**Checks.**

- For R_{B,M} = L (one closed point), Ř = L and the formula reads m_{B,M} ≅ m_B(Π(ρ_x)′_b)⊗ρ_x.
- Ř_{B,M} is the continuous L-dual of R_{B,M}. The source formula Ř = Hom(Ř, L) refers to the object being defined (source correction E12).
- A comparison of Galois modules alone, without the E_B-action, is weaker than the statement and does not determine the isomorphism.

*Needs:* §§4.13, 5.5, 6.1–6.4; PadicLocalLanglandsForGL2Qp §§5.3, 5.5 and 5.12; LocalGaloisDeformationRings §3.8.

### 6.6 The factorisation of arithmetic cohomology

Let p > 3, fix n, and let L contain the fields of definition of all JL(M) of level at most n. Prove that there is a topological L[G_ℚ_p×G×Ǧ]-isomorphism

    H¹_ét(M^p_{n,ℚ̄_p}, L(1)) ≅ ⊕_{M∈ΦNᵖ_n} ( ⊕̂_B Π*(ρ_{B,M}) ⊗_{R_{B,M}} ρ_{B,M} ⊗_{R_{B,M}} Ř_{B,M} ) ⊗_L JL(M).

The left side is the arithmetic completion of §5.1, not all of H¹_ét(M^p_{n,C}, L(1)). The outer sum is finite. The inner completion is p-adic for the lattices of §5.4, after which p is inverted. Ř_{B,M} is the continuous L-dual of R_{B,M}. Sources: CDN23, Théorème 0.1 (line 121) and Théorème 5.15 (line 2620), with the hypothesis p > 3 of line 93. The route combines §5.4 after inverting p, §5.6 and §6.5, recovering Π*(ρ) through the base roadmap's Morita evaluation.

**Checks.**

- At a closed supercuspidal point x the multiplicity recovers Π(ρ_x)′_b⊗ρ_x⊗JL(M), in agreement with §4.14.
- For the Steinberg block and M = Sp the summand is (St^cont)′_b⊗1⊗1, in agreement with §4.2.
- Modulo p^k each integral vector has finite block support, so the unrestricted product over B is not the left side.

*Needs:* §§5.4, 5.6, 6.2 and 6.5; PadicLocalLanglandsForGL2Qp §§5.3 and 5.12.

### Examples

If ρ̄_B is absolutely irreducible and the type locus of M in B is a single PID factor A with fraction field K, then the summand of B is a rank-two A-family Π*(ρ)⊗ρ⊗Ǎ whose fibre at each closed point x of A is Π(ρ_x)′_b⊗ρ_x.

### Dependencies

Layers 4–5; PadicLocalLanglandsForGL2Qp §§3.3, 3.5–3.8, 5.1–5.8 and 5.12; LocalGaloisDeformationRings §3.8.

## Layer 7: Weighted, Iwasawa, primitive, derived and boundary consequences

In §§7.1–7.4 and 7.6–7.7, π and ρ are as in Layer 1, r is such that ρ is trivial on 1+p^rO_D, and E_π ≅ O(Σ_r)^ρ through the base roadmap's `DrinfeldComparison.functions_dual`, unconditional by §3.1.

### 7.1 The integral-weight automorphy twist

For k ∈ ℤ, let E_π[k] be E_π as a topological O(Ω)-module with the action g⋆_kℓ = (a−c∂)^{−k}(gℓ) for g = (a b; c d). Negative powers use the automorphism of §2.2 (DLB17, Remarque 11.12, line 2718). Prove that this is an action. Its API:

- g⋆_kℓ = (a−c∂)^{−k}gℓ, and k = 0 recovers the action on E_π.
- The cocycle identity holds for every k ∈ ℤ: for g′ = (a′ b′; c′ d′), (a−c∂)(a′−c′·g∂g⁻¹) = (aa′+bc′)−(ca′+dc′)∂, whose coefficients are the left column of gg′. Since g∂g⁻¹ = (d∂−b)(a−c∂)⁻¹ (§2.2), this is the identity a′(a−cz)−c′(dz−b) = (aa′+bc′)−(ca′+dc′)z.
- Under §3.1 the strong dual of E_π[k] realises O(k)(Σ_r)^ρ (DLB17, Remarque 11.12, line 2718; COLMEZ19POIDS lines 310–321 give the same twist in a right-action convention).

**Checks.**

- At k = 0 every factor is the identity.
- aI₂ acts by a^{−k} relative to its action on E_π. Determinant twists must therefore be added separately to keep a central character.
- For k = 2, tensoring with det gives the factor det(g)(a−c∂)^{−2}, which is the action on Π(π,2)′_b in the base §6.9.

*Needs:* §§2.2 and 3.1; PadicLocalLanglandsForGL2Qp §6.9.

### 7.2 Weighted realisation and the BGG row

For k ≥ 0, prove the strict exact sequence of G-Fréchet spaces 0 → O(−k)(Σ_r)^ρ → O(k+2)(Σ_r)^ρ⊗det^{k+1} → H¹_dR(Σ_r)^ρ⊗Sym^k → 0, whose first map is (u⁺)^{k+1} = (d/dz)^{k+1} (DLB17, Remarque 11.12, lines 2718–2725). Prove that the preimages of the lines ℒ⊗(π′⊗Sym^k) describe the duals of the locally analytic vectors of the Banach representations of weights {0,k+1} attached to M. This is COLMEZ19POIDS Conjecture 0.10 (lines 328–332), which its Remarque 0.11(iii) (lines 337–340) derives from the case k = 0 and its Théorèmes 0.6 and 0.8. For every supercuspidal M ∈ ΦNᵖ, use §3.3 in place of the case k = 0. The route takes the case k = 0 from §3.3 and the operators of §7.1; exactness of the row is justified as indicated in DLB17 Remarque 11.12.

**Checks.**

- For k = 0 the row is the de Rham sequence of §3.3, with O(2)⊗det = Ω¹ (DLB17, Lemme 3.5).
- For k = 1, (u⁺)² sends O(−1) to O(3)⊗det². Its cokernel is H¹_dR(Σ_r)^ρ⊗Sym¹ ≅ π′⊗M_dR⊗Sym¹, which is four copies of π′, and the weights become {0,2}.
- The determinant power is k+1; omitting it changes the central character of the middle term by a^{2k+2}.

*Needs:* §§3.3 and 7.1; PadicLocalLanglandsForGL2Qp §§4.1–4.2.

### 7.3 Comparison with the original first-cover formulation

Let Σ_{1+ϖ_DO_D} be the ℚ_p-model of the p^ℤ-quotient of the first ϖ_D-cover, with Teitelbaum's semistable model over K = ℚ_{p²}((−p)^{1/(p²−1)}) as recalled in DLB17 Remarque 11.13 (lines 2731–2781). Define BS(ℒ) as the strong dual of the preimage of ℒ^⊥⊗π′ in Ω¹(Σ_{1+ϖ_DO_D})^ρ under the de Rham identification transported from Hyodo–Kato cohomology. Prove that BS(ℒ) = Π^an_ℒ for every ℒ. The route has four steps:

- Identify H¹_dR(Σ_{1+ϖ_DO_D})^ρ with π′⊗M*_dR using the nonproper Hyodo–Kato comparison of LocallyAnalyticDistributions §0.CR.6.6 and the proper comparison on the Shimura curve (PadicHodgeTheory §8.1).
- For a quaternionic form with local component π, use the local Galois representation to show that BS agrees with Π^an at its line.
- Produce three distinct global lines by varying the residual representation in §3.1.
- Two lines fix the comparison only up to a diagonal projectivity of ℙ¹(L); three distinct lines force it to be scalar (source correction E11).

**Checks.**

- The DLB cover Σ_1 has level 1+pO_D = 1+ϖ_D²O_D. It is not the first ϖ_D-cover (§0.1).
- In the basis (ℒ, ℒ′), the diagonal projectivity diag(1, c) fixes the points 0 and ∞ but moves the point 1 unless c = 1.
- The comparison is of filtered objects; an unfiltered isomorphism H¹_dR ≅ π′⊗M*_dR does not determine BS(ℒ).

*Needs:* §§0.1, 0.4, 3.1 and 3.3; LocallyAnalyticDistributions §0.CR.6.6; PadicHodgeTheory §8.1; GL2AutomorphicRepresentationsAndTransfer R17.3.

### 7.4 Iwasawa invariants of Drinfeld functions

For V in the family of π, prove that (O(Σ_r)^ρ)^{diag(p,1)=1} is a free D(Γ)-module of rank two, isomorphic to {μ ∈ H¹(G_ℚ_p, D(Γ)⊗_L V) : ∫_{1+p^mℤ_p}μ ∈ H¹_e(G_{ℚ_p(μ_{p^m})}, V) for every m ≥ 0} (DLB17, Théorème 1.9, line 434; §12.1, line 2785). H¹_e is the image of the Bloch–Kato exponential, not H¹_f or H¹_g. The route identifies the diag(p,1)-fixed vectors with tN_rig(π)^{ψ=1} by §2.1. Applying 1−φ and `allLevelExp_iff_tNrig` with `allLevelExp_oneSubPhi_injective` (PhiGammaModulesAndIwasawaCohomology §5.7) identifies the result with the right side. Freeness of rank two over D(Γ) is proved here, using the analytic Iwasawa comparison of PhiGammaModulesAndIwasawaCohomology §5.4 for the right-hand side. The cover level r and the cyclotomic level m are different indices; the source uses n for both (source correction E19).

**Checks.**

- For V = 0 both sides vanish.
- For the trivial representation, H¹_e ≠ H¹_f, which is why the condition uses the exponential image.
- The hypothesis of `tNrig_annularGeneration` holds because V is nontrianguline over every finite extension of L. A supercuspidal WD(M) stays irreducible after coefficient extension.

*Needs:* §2.1; PhiGammaModulesAndIwasawaCohomology §§5.4 and 5.7.

### 7.5 Infinitely primitivable functions

A function f ∈ O(Σ_n) is infinitely primitivable when it lies in ∩_{j≥0} (d/dz)^j O(Σ_n). Prove that the infinitely primitivable functions lie in H⁰_dR(Σ_n)·O(Ω): finite sums of locally constant functions on geometric components times pullbacks of functions on Ω, after the finite extension that splits the components. The conclusion of DLB17 Théorème 1.10 (line 447), that they lie in O(Ω), is false when component constants are nontrivial (source correction E2). The route decomposes f by Ǧ-types:

- On a supercuspidal sector ρ of any central character trivial on p, use §3.3(i) to identify O(Σ_n)^ρ with a dual on which ∩_j(u⁺)^j is zero (gap:fixed-radius-divisibility in the base §6.9). The source proof treats every nontrivial type as supercuspidal with trivial central character (source correction E20).
- On a one-dimensional type χ∘Nrd, use gap:drinfeld-components: the χ∘Nrd-sector of O(Σ_n) is (χ-isotypic locally constant functions on components)·O(Ω).

**Checks.**

- On Σ₀ = Ω⊔Ω, f = (1, −1) has the primitives (z^j/j!, −z^j/j!) for every j, but is not a pullback from Ω. So the printed conclusion fails, and the corrected one holds.
- For a nontrivial supercuspidal ρ, the infinitely primitivable part of O(Σ_n)^ρ is 0.
- The statement is a containment. Not every function of H⁰_dR·O(Ω) is infinitely primitivable, since d/dz is not surjective on O(Ω): H¹_dR(Ω) ≠ 0 (§4.2).

*Needs:* §§3.3 and 4.2; PadicLocalLanglandsForGL2Qp §6.9; gap:drinfeld-components; gap:fixed-radius-divisibility.

### 7.6 The filtered derived realisation

For V in the family of π and r large, prove that Hom_{D^b(D(G))}((Π(V)^an)′_b, RΓ_dR(Σ_r)^ρ[1]) ≅ D_dR(V) as filtered L-spaces, canonically up to the common scalar (DLB17, Proposition 12.2, line 2819). Here D^b(D(G)) is the bounded derived category of coadmissible D(G)-modules in the fixed ρ-sector. RΓ_dR(Σ_r)^ρ = [O(Σ_r)^ρ → Ω¹(Σ_r)^ρ] sits in degrees 0 and 1, with F⁰ = [0 → Ω¹(Σ_r)^ρ] and the stupid filtration. The coadmissibility used is that of the ρ-sector; the whole unprojected complex is not asserted to be coadmissible (source correction E8). Construct here the bounded derived category of the fixed-sector coadmissible modules, as an exact subcategory of the coadmissible modules of the base roadmap §0.1. Provide the filtered two-term complex in it and the comparison of its Hom with the filtration. The route uses H⁰_dR(Σ_r)^ρ = 0, so the complex is quasi-isomorphic to H¹_dR(Σ_r)^ρ[−1], and computes Hom to the two-copy smooth quotient by the base §6.9. No Frobenius or monodromy structure is asserted (DLB17, Remarque 12.3(a), line 2823).

**Checks.**

- For the chosen line ℒ, the filtration induced on the two-dimensional Hom is Fil⁰D_dR(V) = ℒ. An unfiltered dimension count would only give 2.
- The trivial sector ρ = 1 has H⁰_dR ≠ 0 and is excluded.
- The full O(Σ_r) is an infinite sum over types and is not coadmissible as a D(G)-module.

*Needs:* §§0.4 and 3.3; PadicLocalLanglandsForGL2Qp §§0.1 and 6.9.

### 7.7 The boundary-function sheaf

Let τ: Σ_r → T be the period map to Ω followed by the retraction onto the Bruhat–Tits tree T of PGL₂(ℚ_p). For an open U ⊂ ℙ¹(ℚ_p), let V(U) be the union of rays from a fixed vertex towards points of U, and B_i the ball of radius i. Define F_π as the sheafification of U ↦ colim_i O(τ⁻¹(V(U)∖B_i))^ρ, over the admissible analytic neighbourhoods of DLB17 §12.3 (line 2861). Prove that its restriction maps and G-action do not depend on the vertex or the cofinal sequence of collars. Its identification with tN_rig(π)⊠− is DLB17 Conjecture 12.4 (line 2876) and is not asserted.

Its API:

- On a compact open U, sections are the stabilised germs over admissible collars.
- Restriction commutes with passage to germs, identities and composition.
- Cofinal collar systems and changes of base vertex give canonically isomorphic sheaves.
- G transports collars and commutes with restriction and the ρ-projection.

**Checks.**

- The empty open has zero sections.
- Replacing B_i by B_{i+c} for fixed c gives the same germs.
- For disjoint compact opens U₁, U₂, deep collars separate, so F_π(U₁ ⊔ U₂) ≅ F_π(U₁)×F_π(U₂). A constant function pulled back from the tree has zero ρ-part for nontrivial supercuspidal ρ, so the projection cannot be omitted.

*Needs:* §§0.2 and 3.1; PadicLocalLanglandsForGL2Qp §4.2a; EndoscopicTransferAndUnitaryTraceComparison §§12.4 and 12.5.

### Examples

On Σ₀ = Ω⊔Ω every locally constant function is infinitely primitivable, and so is every product of one with an infinitely primitivable function on Ω. For k = 0 the BGG row of §7.2 is the de Rham sequence.

### Dependencies

Layers 2–4; PadicLocalLanglandsForGL2Qp §§0.1, 4.2a and 6.9; PhiGammaModulesAndIwasawaCohomology §§5.4 and 5.7; LocallyAnalyticDistributions §0.CR.6.6; PadicHodgeTheory §8.1; GL2AutomorphicRepresentationsAndTransfer R17.3; EndoscopicTransferAndUnitaryTraceComparison §§12.4 and 12.5; gap:drinfeld-components; gap:fixed-radius-divisibility.

## Downstream consumers

The Galois-socle theorem §4.14 and the factorisation §6.6 are the inputs for comparisons between local and global multiplicities in completed cohomology of quaternionic Shimura curves. The general-central-character realisation §3.3 is the form of the Breuil–Strauch comparison needed by every statement on the p-central tower at fixed level. The boundary sheaf §7.7 is the geometric side of DLB17 Conjecture 12.4. No roadmap cites this one as a supplier.

## Source corrections

All statements below are in our own words.

- **E1** (gap, DLB17, Théorème 9.9, line 2005; affects a stated result). Uniqueness of the O(Ω)-module structure needs continuity of f ↦ T_fℓ for every ℓ; algebraic density does not determine an arbitrary action. Declared as gap:halfplane-module-continuity.
- **E2** (error, DLB17, Théorème 1.10, line 447; affects a stated result). Infinitely primitivable functions lie in H⁰_dR(Σ_n)·O(Ω), not in O(Ω). §7.5.
- **E3** (gap, DLB17, proof of Théorème 5.1, §5.3, line 1184; affects the proof). A globalisation obtained up to an unramified twist must have the twist removed by a global character before taking isotypic parts. §3.1.
- **E4** (error, DLB17, Proposition 7.7(b), line 1568; affects a stated result). The orthogonal of N⁺_dif,n(V̌) is tN⁺_dif,n(V) for every weight k ≥ 1, not t^kN⁺_dif,n(V). The two agree at k = 1. §1.6.
- **E5** (gap, DLB17, proof of Théorème 8.3, line 1690; affects the proof). Injectivity of Res_ℤ_p on the fixed vectors needs the Weyl chart and D_rig^{φ=1} = 0. §2.1.
- **E6** (error, DLB17, proof of Proposition 8.4, line 1768; affects the proof). Generation is used over D(Γ) where only generation after scalar extension to the Robba ring of Γ is available. This roadmap takes tN_rig(π)⊠ℙ¹ from the base roadmap §4.2a and does not use this step.
- **E7** (gap, DLB17, proof of Théorème 9.7, line 1967; affects the proof). The displayed computation gives a one-sided inverse of a−c∂; the identity for g⁻¹ gives the other. §2.2 and gap:two-sided-resolvents.
- **E8** (gap, DLB17, §12.2 before Proposition 12.2, line 2810; affects the proof). Théorème 10.1 gives coadmissibility of the ρ-sector, not of the whole de Rham complex of Σ_n. §7.6.
- **E9** (error, DLB17, Proposition 11.2 and Théorème 11.3, lines 2432–2461; affects the proof). The coefficient module t⁻¹N⁺/N⁺ carries a Tate twist and is not a locally constant coefficient module before the twist of Π(π,2). §3.2 and gap:smooth-kernel-twisted-coefficients.
- **E10** (gap, DLB17, Proposition 11.10, line 2685; affects the proof). Infinite t-divisibility must be proved in one lattice of fixed radius on both charts. gap:fixed-radius-divisibility.
- **E11** (gap, DLB17, Remarque 11.13, lines 2776–2781; affects the proof). Two filtration lines leave a diagonal projectivity; three distinct lines are needed. §7.3.
- **E12** (misprint, CDN23, Théorème 5.15, line 2624; affects nothing). Ř_{B,M} is the continuous L-dual of R_{B,M}, not Hom(Ř_{B,M}, L). §6.5.
- **E13** (gap, CDN23, Théorème 5.15 and Théorème 5.24(ii), lines 2620 and 2779; affects a stated result). The local statements do not repeat the hypothesis p > 3 used for generic semisimplicity (footnote 32, line 2861; line 93). §§6.5–6.6 retain it.
- **E14** (misprint, CDN20, proof of Lemme 2.18, line 1186; affects the proof). The completing column uses the symmetric functions without the alternating signs. The proof's complement step checks only AS′ ∩ (S_v+AS_v) = 0, not that S′+AS′ meets S_v+AS_v in 0 (lines 1188–1193). §4.3.
- **E15** (misprint, CDN20, proof of Proposition 2.5, lines 875–876; affects nothing). The Hom has dimension 1 when D_pst(V*) ≅ M[−1]* and 0 otherwise, not the reverse. §4.6.
- **E16** (error, CDN23, Proposition 5.7 and Théorème 5.8, lines 2424–2473; affects a stated result). On the p-central quotient the condition is M ∈ ΦNᵖ_n, not level ≤ n; the proofs decompose over ΦNᵖ (line 2434). §§4.12–4.14.
- **E17** (gap, CDN23, proof of Proposition 5.7, lines 2438–2448, and CDN20, Proposition 2.9, line 952; affects the proof). DLB17 is applied to every supercuspidal M, though DLB17 assumes trivial central character. §3.3.
- **E18** (gap, CDN23, proof of Théorème 5.24(ii); affects the proof). Local freeness of the dual multiplicities over each PID factor is asserted without argument. §6.5.
- **E19** (misprint, DLB17, Théorème 1.9, line 434; affects nothing). n denotes both the cover level and the cyclotomic level. §7.4.
- **E20** (gap, DLB17, proof of Théorème 1.10, §12.1, line 2785; affects the proof). Théorème 1.2 is applied to every nontrivial Ǧ-type, including one-dimensional types and nontrivial central characters. §7.5.

## References

- **DLB17.** Gabriel Dospinescu, Arthur-César Le Bras, *Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique*, Ann. of Math. 186 (2017), 321–411; locators refer to arXiv:1509.00606v2, whose numbering agrees with the published version.
- **CDN20.** Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, *Cohomologie p-adique de la tour de Drinfeld : le cas de la dimension 1*, J. Amer. Math. Soc. 33 (2020), 311–362; locators refer to the authors' copy.
- **CDN23.** Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, *Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*, Forum Math. Pi 11 (2023), e16; locators refer to the HAL copy hal-04289191, whose theorem numbering agrees with the published version.
- **COLMEZ19POIDS.** Pierre Colmez, *Correspondance de Langlands locale p-adique et changement de poids*, J. Eur. Math. Soc. 21 (2019); locators refer to the author's copy.
