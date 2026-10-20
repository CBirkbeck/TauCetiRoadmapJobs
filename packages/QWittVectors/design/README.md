# Roadmap: arithmetic Λ-rings and q-Witt vectors

**Summary.** Build the general arithmetic Λ-ring and q-Witt library from integral Witt polynomials, commutative algebra and derived completion. The endpoints are relative degree-zero q-Witt rings for every Λ-base and algebra, the q-fixed completed relative Frobenius for étale coefficients, positive-degree q-Witt operations, complete framed difference calculus, and integer torsion-freeness and degreewise completion for smooth algebras over perfectly covered bases. All primes, including 2, and all positive truncation indices are included.

## Scope and ownership

This roadmap owns QW.0–QW.6: Layers 1–2 give big Witt rings, arithmetic Λ-coalgebras, prime sets, perfection and perfect coverage; Layers 3–5 give absolute and relative q-Witt rings and their exactness, base change and completions; Layer 6 gives the completed coefficient Frobenius; Layer 7 gives positive-degree q-Witt systems; Layer 8 gives complete framed difference calculus; Layers 9–10 supply the algebraic support and smooth torsion conclusions. Arithmetic perfection is not the characteristic-p perfection stated by SchemeAndStackFoundations §§0.24, 0.29.

The p-typical carriers and operations are already in the pinned Mathlib, and their adic topology is already in pinned Tau Ceti. Layer 1 constructs the distinct big Witt object and proves its comparison with those carriers; it does not rebuild p-typical vectors. Scalar Koszul complexes, derived tensor, derived limits, finite-ideal completion and complete flatness are stated by DerivedModuleAlgebra §§0.K.1, 0.2, 1.1–1.9; DG signs and carriers by DGAInfinity Layers 0–1; enhancement and algebra objects by EnhancedDerivedSheaves §0.3 and Layer E5:abstract. Section 1.7 adds only the general commuting-module-action Koszul bridge required by both Verschiebung and framed calculus. Generic ordinary de Rham and prismatic theory belong to DerivedDeRhamCohomology and PrismaticCohomology, with the precise missing section contracts listed below.

HabiroCyclotomicCompletions owns integral cyclotomic ideal and completion theory. HabiroRings and HabiroCohomologyFoundations own Habiro rings, gluing, q-Hodge filtrations and descent; RefinedTraceMethods owns refined traces. Intrinsic q-crystalline cohomology and its geometric comparison belong to PrismaticCohomology. Layer 9 concerns only cohomology of the explicitly framed algebraic complex needed to prove the smooth q-Witt theorem; it creates no geometric or frame-independent cohomology functor. The bounded cochain completion extension of DerivedModuleAlgebra and multiplicative Bockstein extension of DGAInfinity are Part II supplier contracts. The continuous group-cohomology Bocksteins `TauCeti.explicitBockstein1` and `TauCeti.integralBockstein` are already in the pinned library, in `TauCeti/RepresentationTheory/Homological/ContCohomology/Bockstein/Basic.lean` and `Integral.lean`; they do not provide the regular-parameter DGA theorem. Section 9.4 is its framed specialization, with a different carrier and parameter. The functorial global de Rham comparison of Wagner Proposition 4.2 is not an endpoint: its framed polynomial instance in 9.6 is exactly the instance the torsion proof uses.

## Conventions

Rings are commutative; relative algebras and Λ-rings are unital. Absolute big and q-Witt rings also accept nonunital commutative rings, with operations given by integral polynomials or equivalently the unitization kernel. The zero ring and empty truncation set are allowed. Work in arbitrary universes with each small indexing set fixed before taking a product, colimit or diagram category. Big Witt indices are positive integers. W_m means W_Div(m), whereas Mathlib length a+1 corresponds to W_{p^a}. Infinite big Witt rings use restriction limits; the ordinary étale preservation statement has finite truncation set.

Write [n]_q for the polynomial ∑_{0≤j<n}q^j, including [0]_q=0. Expressions such as (q^m−1)/(q^d−1) mean this polynomial geometric sum, never division in a quotient ring. Let Φ_d be Mathlib's cyclotomic polynomial, and A[ζ_d]=A[q]/Φ_d(q), without choosing a root in an extension field. The prime-generator cyclotomic ideal identity has m>1; m=1 uses Φ_1=q−1 directly. Distinct-factor intersection statements require distinct indices.

The scalar action on R^(d)=R⊗_{A,ψ_d}A is through the right factor. The ghost gh_{m/d} has target R^(d)[ζ_d]; gh_1 is the first ghost at level m, with d=m. The relative truncated F_{m/d} and Layer 6 coefficient Frobenius fix q and right-hand A-scalars. Layer 8 framed Frobenius acts on q by q↦q^p and is semilinear over A. No equivalence for smooth coefficient Frobenius is inferred from the étale coefficient theorem.

All hats mean derived completion unless a degreewise ordinary comparison is explicitly proved. Every completion ideal is finitely generated. The comparison of (p,Φ_d) and (p,Φ_{pd}) uses equal radicals and a common topology; the ideals need not be equal. A[[h]] denotes power series with h=q−1, so q=1+h is a unit. Smooth affine algebras have finite local coordinate covers; frames, when supplied, are finite étale maps A[T₁,…,T_r]→R. The complete framed calculus itself needs no Λ-structure on A; its Frobenius and the smooth q-Witt conclusions use the indicated perfectly covered Λ-base.

Complexes are cochain complexes. Ordinary and q-Witt de Rham algebras are graded commutative with every odd square zero, including at 2. The framed model instead has the skew rule dT_i f=γ_i(f)dT_i. Its differential is ∑D_i(f)dT_i, and the scaled differential is h times this expression. Ordered wedges use d¹(a,b)=D₁b−D₂a. Bockstein has the sign β_f([x])=[dx/f]. The two Frobenius conventions, all polynomial normalizations, this Koszul sign and the Bockstein sign have computed witnesses in Layers 1, 6, 7, 8 and 9; their elementary Lean witnesses are recorded in the design report.

## Exact supplier contracts

### From Mathlib

The baseline is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Read the declarations at this commit, rather than transferring statements from a default-branch search result.

- `WittVector` and `WittVector.ext` in `Mathlib/RingTheory/WittVector/Defs.lean` give the p-typical sequence carrier and coordinate extensionality.
- `WittVector.map`, `WittVector.map_coeff`, `WittVector.ghostMap`, `WittVector.ghostComponent` and `WittVector.ghostComponent_apply` in `Mathlib/RingTheory/WittVector/Basic.lean` give functorial ring maps and the p-typical ghost polynomial. These declarations assume `CommRing R` and `Fact p.Prime` for the ring structure.
- `TruncatedWittVector`, `TruncatedWittVector.instCommRing`, `WittVector.truncate`, `WittVector.coeff_truncate`, and `TruncatedWittVector.truncate` in `Mathlib/RingTheory/WittVector/Truncated.lean` fix length as `Fin n`, including n=0.
- `WittVector.frobenius`, `WittVector.ghostComponent_frobenius` and `WittVector.frobenius_eq_map_frobenius` in `Mathlib/RingTheory/WittVector/Frobenius.lean`; the last assumes characteristic p. `WittVector.frobeniusEquiv` additionally assumes `PerfectRing R p`.
- `WittVector.verschiebung`, `WittVector.verschiebung_coeff_succ` and `WittVector.verschiebung_injective` in `Mathlib/RingTheory/WittVector/Verschiebung.lean`; `WittVector.teichmuller` and `WittVector.ghostComponent_teichmuller` in `Mathlib/RingTheory/WittVector/Teichmuller.lean`. They have p-typical scope only.
- `Algebra.TensorProduct.includeRight` in `Mathlib/RingTheory/TensorProduct/Basic.lean` fixes the right scalar factor of the algebra tensor product; `Algebra.Etale` and `Algebra.FormallyEtale` in `Mathlib/RingTheory/Etale/Basic.lean` fix the étale predicates; `KaehlerDifferential`, `KaehlerDifferential.D`, `KaehlerDifferential.linearMapEquivDerivation` in `Mathlib/RingTheory/Kaehler/Basic.lean` supply degree-one differentials; `PowerSeries`, `PowerSeries.coeff`, `PowerSeries.constantCoeff` in `Mathlib/RingTheory/PowerSeries/Basic.lean` supply complete series carriers; `Polynomial.cyclotomic` in `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean` supplies the polynomial used by the cyclotomic supplier.

### From Tau Ceti

The baseline is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The p-typical comparison respects `WittVector.isAdicComplete_span_p_teichmuller` in `TauCeti/RingTheory/WittVector/Complete.lean`: R is characteristic p and perfect, and is complete at (ϖ). `TauCeti.WittVector.continuous_frobenius` and `TauCeti.WittVector.continuous_frobeniusEquiv_symm` in `TauCeti/RingTheory/WittVector/Frobenius.lean` require an adic topology at (p,[ϖ]); the inverse also needs perfectness. They supply compatibility with the existing p-typical topology, not the relative coefficient map of Layer 6. No endpoint depends on strengthening these declarations.

### From TauCetiRoadmap.DerivedModuleAlgebra

Import §0.K.1, §0.2, §1.1, §1.2, §1.3, §1.5, §1.7, §1.8, §1.9. Scalar Koszul complexes; derived module tensor and limits; finite-ideal completion, radical invariance and Nakayama; bounded-torsion ordinary comparison; complete flatness and bounded-base complete faithful-flat descent. The extra cochain comparison is gap:cohomology-completion.

### From TauCetiRoadmap.DGAInfinity

Import Layer 0, Layer 1. Signed graded modules, Koszul braiding, associative and commutative DG carriers, maps, quotients and cohomology multiplication. q-Witt relations and strict alternation are specified here. The generic multiplicative Bockstein extension is gap:dga-bockstein.

### From TauCetiRoadmap.EnhancedDerivedSheaves

Import §0.3, §E5:abstract. Point-site enhancement of derived tensor and coherent limits, stable finite fibre/cofibre calculus and derived commutative algebra objects. No animation of the q-Witt functor is required.

### From TauCetiRoadmap.SchemeAndStackFoundations

Import §0.23a, §0.29, §4.1. Étale topological invariance, affine relative Frobenius isomorphisms for étale maps, polynomial Frobenius ranks, and unique infinitesimal lifts of formally étale morphisms. Characteristic-p perfection is not arithmetic Λ-perfection.

### From TauCetiRoadmap.HabiroCyclotomicCompletions

gap:cyclotomic-contract; the cyclotomic and completion section identifiers are absent.

### From TauCetiRoadmap.DerivedDeRhamCohomology

gap:ordinary-derham; the ordinary exterior de Rham and Cartier section identifiers are absent.

### From TauCetiRoadmap.PrismaticCohomology

gap:prismatic-frobenius; the q-PD, framed comparison and iterated Frobenius section identifiers are absent.

The missing contracts are explicit prerequisites; their source locators specify the mathematics, without pretending to supply a roadmap section.

**`gap:cyclotomic-contract`.** HabiroCyclotomicCompletions must bind these integral cyclotomic and completion statements to an actual section. The earlier HabiroCyclotomicCompletions roadmap has no text in the supplied main checkout or board. Required: Polynomial.cyclotomic compatibility, q^m−1 factorization for m>0; for m>1 the ideal generated by [p]_{q^(m/p)} for p|m is (Φ_m); distinct cyclotomic factors meet only at a prime-power ratio, with the stated characteristic-p quotient; p-local factorization and Chinese remainders; √(p,Φ_d)=√(p,Φ_{pd}) for every d>0, including p|d. Equality of completion functors is by radical, not equality of these ideals. Do not apply the prime-generator formula at m=1 or the distinct-factor formula at equal indices.

**`gap:ordinary-derham`.** DerivedDeRhamCohomology must identify its ordinary de Rham and polynomial Cartier section at this generality. DerivedDeRhamCohomology is earlier in the merge order but its roadmap text is absent. Required over every commutative unital base: Ω* as exterior algebra of Mathlib KaehlerDifferential with its universal differential, strict odd alternation, base change, localization and unique extension through étale algebras, and the finite-coordinate basis for an étale polynomial framing. Required over characteristic p: the polynomial Cartier description of cycles as sums of Frobenius monomials times T_i^(p−1)dT_i and exact forms, with coefficients in an arbitrary characteristic-p algebra, without perfectness of the base. A relative twist is required in the general Cartier statement.

**`gap:cohomology-completion`.** A DerivedModuleAlgebra Part II contract must supply the bounded cochain completion comparison beyond §§1.5 and 1.8. DerivedModuleAlgebra §§1.5 and 1.8 supply module completion and complete flatness, but not the cochain comparison used here. Needed: for a bounded complex M of ℤ[q]-modules and a prime p, if each term and H^i(M) has bounded h-power torsion and is p-torsion-free, and each corresponding reduction modulo p has bounded h-power torsion, then degreewise ordinary h-completion represents derived completion, preserves these conditions, and H^i commutes with h- and (p,h)-completion, for h=q−1. This is Wagner Lemma 4.25, lines 3198–3227. It is an extension in the supplier direction and is proposed for DerivedModuleAlgebra, Part II rather than rebuilt here.

**`gap:prismatic-frobenius`.** PrismaticCohomology must bind the q-prism, explicit framed Frobenius and iterated décalage comparison to named sections. PrismaticCohomology is earlier but its text is absent. For perfectly covered A, p prime and a finite étale framing, D=Â_p[[h]], q=1+h, I=([p]_q) is the bounded q-de Rham prism. Supply the q-PD envelope and comparison with C□^∧_p, identify the explicit coordinate map from 8.5 with prismatic Frobenius, and supply φ^{α*}Δ≃Lη_{Iφ(I)⋯φ^{α−1}(I)}Δ for α≥0, with completed scalar extension, plus its reduction/Bockstein comparison. The general Lη and q-PD theory belongs to that supplier and its existing dependencies. Read sources: bhatt-scholze Theorem 15.3 line 3898; Constructions 16.19–16.20 line 4316; Theorem 16.22 line 4378; wagner Lemma 4.32 line 3459. This input is not the q-fixed coefficient equivalence of Layer 6.

**`gap:dga-bockstein`.** DGAInfinity, Part II must supply the generic multiplicative Bockstein theorem beyond Layer 1. DGAInfinity Layer 1 supplies DGA carriers and cohomology multiplication but its supplied contract does not state the Bockstein theory needed here. Required for an associative cochain DGA P over a commutative B and central degree-zero f regular in every term: β_f on H*(P/f), computed by dx=fy, is independent of lifts, satisfies β_f²=0 and the signed Leibniz rule, is natural, and obeys Fβ_fV=β_g for g|f with F reduction and V multiplication by f/g when both scalars are termwise regular. The maps F and V in this last identity are graded additive maps; F is multiplicative. Source: wagner lines 3026–3032 and 3178–3194, with the cycle-lift proof. The pinned group-cohomology Bocksteins have different carriers and codomains.

## How to read the build

Read Layers 1–2 for the integral and arithmetic input, the finite Koszul bridge and arithmetic fracture detection, Layers 3–4 for the initial absolute and relative systems, Layer 5 for étale and completion comparisons, Layer 6 for the q-fixed overlap used by cyclotomic consumers, and Layers 7–8 for positive-degree and framed calculus. Layer 9 isolates the algebraic support of the smooth torsion induction, including one simultaneous induction whose subclaims are not separate circular prerequisites. Layer 10 exports smooth integer torsion-freeness and degreewise completion. Every target states its context and source, followed by its public laws, proof route and discriminating checks. A `gap:` dependency is a precise supplier requirement, not a theorem assumed to have been formalized.

## Layer 1: Big Witt rings and shared homological algebra

### 1.1 Truncation Set

Define `BigWitt.TruncationSet`. A truncation set S is a subset of positive integers closed under positive divisors, including the empty set. Put S/n = {e > 0 | ne ∈ S}, Div(m) = {d > 0 | d divides m}, and w_n(x) = ∑_{d|n} d x_d^(n/d) for x ∈ R^S and n ∈ S. R is a commutative ring, possibly without identity n > 0. (hesselholt line 217, §1 before Proposition 1.2, lines 217–268; Wagner §2.6, wagner line 435).

The public laws are `TruncationSet.ext`: Equality is membership equivalence; `TruncationSet.div_mem`: S/n is divisor closed; (S/n)/k = S/(nk); `BigWitt.ghostPolynomial_map`: w_n commutes with every coefficient ring map; `TruncationSet.mk`: A subset of positive integers and a proof of divisor closure construct a truncation set; Div(m) is the canonical finite example.

*Proof route.* Finite divisor sums define integral polynomials; divisor transitivity gives the closure and evaluation laws.

*Needs:* commutative rings, finite divisor sums and integral polynomial evaluation.

This interface is used by Layer 1.2 `BigWitt.ghost_image`, Layer 1.3 `BigWitt`.

**Checks.**

- For Div(6), w_6 = x_1^6 + 2x_2^3 + 3x_3^2 + 6x_6; omission of mixed prime divisors fails.
- The empty set gives the singleton product and no ghost coordinates.
- w_1 = x_1, w_2 = x_1^2 + 2x_2; using zero-based p-typical indices fails. The subset {2} is not a truncation set because it omits 1.

### 1.2 ghost image

Prove `BigWitt.ghost_image`. If B has endomorphisms φ_p lifting pth powers modulo p, a sequence b ∈ B^S lies in the ghost image iff b_n ≡ φ_p(b_{n/p}) modulo p^v_p(n)B for every n ∈ S and prime p dividing n. Ghosts are injective if multiplication by every n ∈ S is injective on B. The injectivity assertion holds for every commutative B without specifying Frobenius lifts. B is a commutative unital ring; a lift φ_p is specified for every prime appearing in S. Pairwise commutation is unnecessary for the ghost image criterion. (hesselholt line 217, Lemma 1.1, lines 217–267; Lemma 1.9).

The public laws are `BigWitt.ghost_injective`: Integer torsion-freeness at all primes occurring in S implies ghost injectivity; `BigWitt.ghost_equiv_of_units`: If all n ∈ S are units, the ghost map is bijective.

*Proof route.* Choose Witt coordinates in divisor order; the congruences make the next numerator divisible by n. Uniqueness needs n-torsion-freeness, existence does not require dividing by a unit.

*Needs:* Layer 1.1 `BigWitt.TruncationSet`.

**Checks.**

- Over ℤ with φ_2 = id and S = Div(2), b_2 ≡ b_1 modulo 2 is the image condition.
- Over 𝔽₂, (0,1) has both ghost coordinates zero for S = Div(2); injectivity without torsion-freeness fails.
- For S = ∅, the empty sequence is in the image and the map is injective.

### 1.3 Big Witt

Construct `BigWitt`. Construct the natural commutative ring W_S(R) on R^S whose ghost polynomials are ring maps. For nonunital R use the same integral operation polynomials. For T ⊆ S, restriction is a ring map; W_S is the inverse limit of its finite subtruncations. S is any truncation set; R is commutative, with or without identity. (hesselholt line 268, Proposition 1.2, lines 268–298; Proposition 1.6 proof, lines 383–397; wagner §2.6).

The public laws are `BigWitt.mk_coeff`: Coordinates construct every element; coeff (mk x) d = x_d; `BigWitt.ext`: Elements agree iff all their Witt coordinates agree; `BigWitt.map`: Ring maps act on coordinates; map_id and map_comp hold; `BigWitt.restrict_comp`: Restrictions compose and commute with ghosts and coefficient maps; `BigWitt.nonunital_unitization`: W_S(R) identifies with the kernel for W_S(ℤ ⋉ R) → W_S(ℤ).

*Proof route.* Apply 1.2 over the torsion-free polynomial ring in universal coordinates to obtain integral addition, multiplication and negatives. Verify identities there by ghosts and specialize. The kernel model handles nonunital inputs without a fictitious unit.

*Needs:* Layer 1.1 `BigWitt.TruncationSet`; Layer 1.2 `BigWitt.ghost_image`.

This interface is used by Layer 1.4 `BigWitt.frobenius`.

**Checks.**

- In W_Div(2)(ℤ), τ(1)+τ(1) has coordinates (2,−1), not (2,0).
- W_∅(R) and W_S(0) are zero rings; W_{1}(R) ≅ R.
- The unitization kernel gives the same operations on a nonunital square-zero ring.

### 1.4 frobenius

Construct `BigWitt.frobenius`. For every n > 0 construct F_n : W_S(R) → W_{S/n}(R), additive V_n in the reverse direction, and the multiplicative Teichmüller map τ : R → W_S(R). Ghosts satisfy w_e F_n = w_{ne}; (V_n x)_{ne} = x_e and other coordinates vanish. S is divisor closed; R is a commutative ring; units are preserved in the unital case. (hesselholt line 301, Lemmas 1.3–1.5, lines 301–371).

The public laws are `BigWitt.frobenius_comp`: F_a F_b = F_{ab}; V_a V_b = V_{ab} with the indicated shifted truncations; `BigWitt.frobenius_verschiebung`: On W_{S/n}(R), F_n V_n = n; `BigWitt.frobenius_verschiebung_gcd`: For c = gcd(a,b), F_a V_b = c V_{b/c} F_{a/c} on W_{S/b}(R), with target W_{S/a}(R); `BigWitt.projection_formula`: x V_n(y) = V_n(F_n(x)y); `BigWitt.teichmuller_ghost`: w_e(τ(r)) = r^e and F_n τ(r) = τ(r)^n; `BigWitt.verschiebung_teichmuller_expansion`: x = ∑_{d∈S} V_d τ(x_d), converging in the finite-restriction topology.

*Proof route.* Construct F by the universal polynomial argument in 1.2; define V and τ on coordinates. Prove all identities on universal torsion-free rings using ghosts, then specialize.

*Needs:* Layer 1.3 `BigWitt`.

This interface is used by Layer 1.5 `BigWitt.pTypicalEquiv`, Layer 2.1 `ArithmeticLambdaRing`, Layer 3.1 `QWitt.AbsoluteFVSystem`.

**Checks.**

- For S = Div(2), F_2(x_1,x_2) = x_1^2+2x_2 and V_2(a)=(0,a).
- F_1 and V_1 are identities, including S=∅.
- τ(−1) = −τ(1)+V_2τ(1) in W_Div(2)(ℤ); treating τ as additive fails.

### 1.5 p Typical Equiv

Prove `BigWitt.pTypicalEquiv`. For prime p and a ≥ 0, coordinate reindexing d=p^i gives W_Div(p^a)(R) ≃+* TruncatedWittVector p (a+1) R; the infinite p-power truncation gives WittVector p R. These equivalences preserve ghosts, τ, V and F with their shifted lengths. R is a commutative unital ring; p is prime. (wagner line 471, Remark 2.7, lines 471–473).

The public laws are `BigWitt.pTypicalEquiv_coeff`: Coefficient p^i corresponds to coefficient i; `BigWitt.pTypicalEquiv_truncate`: Big restrictions correspond to TruncatedWittVector.truncate.

*Proof route.* The ghost polynomials agree after reindexing; compare operation polynomials over ℤ and transport. Infinite sequences follow by compatible finite restrictions.

*Needs:* Layer 1.4 `BigWitt.frobenius`; Mathlib `WittVector`; Mathlib `TruncatedWittVector`; Mathlib `WittVector.ghostComponent_apply`; Mathlib `WittVector.frobenius`; Mathlib `WittVector.verschiebung`; Mathlib `WittVector.teichmuller`.

**Checks.**

- W_Div(1)(R) has length 1 for every p; length 0 is the zero ring.
- At p=2,a=1 the second ghost is x_0^2+2x_1 on both carriers.
- At p=3,a=2 the final ghost is x_0^9+3x_1^3+9x_2.

### 1.6 etale base Change

Prove `BigWitt.etale_baseChange`. For an étale map R → R′, a finite truncation set S and n > 0, W_S(R) → W_S(R′) is étale and W_S(R′) ⊗_{W_S(R),F_n} W_{S/n}(R) ≅ W_{S/n}(R′). For coprime positive a,b there is a natural W_Div(ab)(R) ≅ W_Div(a)(W_Div(b)(R)). R and R′ are commutative unital rings; S is finite in the étale assertion. (hesselholt line 811, Theorem 1.25, lines 811–827; borger Corollary 5.4, borger line 1323).

The public laws are `BigWitt.etale_baseChange_natural`: The tensor comparison is induced by F_n and the coefficient map, natural in étale squares.

*Proof route.* Use prime-set decomposition and the finite p-typical étale lifting argument, reducing the Frobenius square modulo p by relative Frobenius for étale algebras. Iterate and use finite divisor induction as in Hesselholt 1.25.

*Needs:* Layer 1.5 `BigWitt.pTypicalEquiv`; SchemeAndStackFoundations §0.23a; SchemeAndStackFoundations §0.29.

**Checks.**

- S=∅ gives the unique map of zero rings and a zero tensor product.
- S={1} recovers the original étale map.
- The theorem has finite S: no finite-presentation conclusion is inferred for the infinite big Witt functor.

### 1.7 koszul Complex

Construct `CommutingEndomorphisms.koszulComplex`. For a commutative ring B, a B-module M and r commuting B-linear endomorphisms D_i, define the cochain complex K(M;D)^k = M⊗_B ∧^k B^r, with differential d(m⊗e_I)=∑_i D_i(m)⊗e_i∧e_I. Give endomorphism-compatible maps, signed coordinate permutations, direct sums, arbitrary scalar extension and cohomology base change for flat scalar extensions, concatenation by iterated two-term totalization, and the comparison with the supplied scalar Koszul complex. r≥0; M any B-module; D_iD_j=D_jD_i; B any commutative ring. (wagner line 603, Remark 2.16, lines 603–619; §4.7, lines 2847–2857).

The public laws are `commutingEndomorphismKoszul_d_sq`: Commutativity of the D_i implies d²=0, with no regularity assumption; `commutingEndomorphismKoszul_map`: A map intertwining every D_i induces a chain map; identities and composition hold; `commutingEndomorphismKoszul_ext`: Maps induced by intertwining maps are determined in degree zero; `commutingEndomorphismKoszul_scalar`: For M=B and D_i multiplication by f_i, identify this complex with the cochain dual of the supplied chain scalar Koszul model, using the coordinate dual bases.

*Proof route.* Give M its B[X_i]-module structure with X_i acting by D_i. Tensor with the supplied finite scalar Koszul resolution, using the cochain wedge convention, and compare termwise. This is the module-action bridge to the supplier complex, not a second scalar Koszul construction.

*Needs:* DerivedModuleAlgebra §0.K.1; DGAInfinity Layer 0.

This interface is used by Layer 3.4 `QWitt.absolute_verschiebungResolution`, Layer 8.2 `QWitt.framedGamma`, Layer 8.4 `QWitt.framedDifferenceComplex`.

**Checks.**

- For r=2, d⁰(m)=(D₁m,D₂m) and d¹(a,b)=D₁b−D₂a; using a plus in both positions fails d²=0.
- For r=0 the complex is M in degree zero; for M=0 it vanishes.
- If D₁D₂≠D₂D₁, d²m=(D₁D₂−D₂D₁)m e₁∧e₂ can be nonzero; arbitrary endomorphisms are excluded.

### 1.8 arithmetic Fracture

Prove `QWitt.arithmeticFracture`. For M in the enhanced derived category of ℤ-modules and any positive integer N, the square M→∏_{p|N}M^∧_p, M[1/N]→∏_{p|N}M^∧_p[1/p] is a pullback. Localization at N and p-completion for p|N jointly detect zero objects. Rationalization and all prime completions jointly detect zero objects. N>0; M arbitrary, possibly unbounded; each product indexed by p|N is finite. (wagner line 366, Lemma 2.4, Remark 2.5, lines 366–430; §4.18, lines 3081–3095).

The public laws are `arithmeticFracture_natural`: The pullback is natural in M and compatible with coefficient algebra objects.

*Proof route.* Apply localization and each indicated completion to the fibre of the proposed square; the resulting squares split. Prove conservativity first from derived completeness as RHom of the localization cone, then pass over all N for rational detection.

*Needs:* EnhancedDerivedSheaves §0.3; DerivedModuleAlgebra §1.3.

**Checks.**

- For N=1 the right product is zero and the left vertical map is identity.
- For M=ℤ,N=2 the square is ℤ→ℤ₂ over ℤ[1/2]→ℚ₂.
- p-completion alone kills ℤ[1/p]; joint detection needs the localization term.

### Examples

Divisors of 1, 2, 6 and prime powers distinguish the big indexing from p-typical length. The checks above specify the evaluated values and the negative controls.

### Dependencies

Mathlib `WittVector`; Mathlib `TruncatedWittVector`; Mathlib `WittVector.ghostComponent_apply`; Mathlib `WittVector.frobenius`; Mathlib `WittVector.verschiebung`; Mathlib `WittVector.teichmuller`; SchemeAndStackFoundations §0.23a; SchemeAndStackFoundations §0.29; DerivedModuleAlgebra §0.K.1; DGAInfinity Layer 0; EnhancedDerivedSheaves §0.3; DerivedModuleAlgebra §1.3.

## Layer 2: Arithmetic Λ-rings, prime sets and perfection

### 2.1 Arithmetic Lambda Ring

Define `ArithmeticLambdaRing`. Give the full big Witt functor W = W_{positive integers} its comonad structure Δ : W(R) → W(W(R)), counit w_1, characterized by w_n Δ = F_n. An arithmetic Λ-ring is a commutative unital ring A with a ring coaction s : A → W(A) satisfying w_1 s = id and Δs = W(s)s. Define Λ-maps by coaction compatibility and ψ_n = w_n s. A is a commutative unital ring, with torsion allowed. (hesselholt line 711, Proposition 1.19 and Definitions 1.21, 1.23, lines 711–801).

The public laws are `ArithmeticLambdaRing.mk`: A coaction and its two coalgebra equations construct the structure; `ArithmeticLambdaRing.hom_ext`: Λ-maps are equal when their underlying ring maps are equal; `ArithmeticLambdaRing.adams_one_mul`: ψ_1=id and ψ_a ψ_b=ψ_{ab}; `ArithmeticLambdaRing.adams_prime_mod`: ψ_p(a)−a^p belongs to pA for every prime p; `ArithmeticLambdaRing.ofFrobeniusLifts`: On ℤ-torsion-free A, commuting prime Frobenius lifts determine a unique Λ-structure; `ArithmeticLambdaRing.adams_isLambdaHom`: Each ψ_n commutes with the coaction and defines a Λ-endomorphism.

*Proof route.* Construct Δ by 1.2 on universal coordinates and prove coalgebra laws by ghosts. The coaction equations imply Adams laws. The torsion-free converse is the same ghost congruence criterion, not a definition on torsion rings.

*Needs:* Layer 1.4 `BigWitt.frobenius`.

This interface is used by Layer 2.2 `ArithmeticLambdaRing.primeSet`, Layer 2.5 `ArithmeticLambdaAlgebra.IsRelativelyPerfect`.

**Checks.**

- The canonical structure on ℤ has ψ_n(k)=k, including ψ_2(2)=2, not 4.
- The toric structure has ψ_2(T)=T² and ψ_3(T)=T³.
- Commuting identity Adams maps on 𝔽₂ do not define an arithmetic Λ-ring: the p-coordinate δ_2(2)=−1 contradicts 2=0. Adams congruences alone lose torsion data.

### 2.2 prime Set

Construct `ArithmeticLambdaRing.primeSet`. For any set P of primes construct the P-typical Witt comonad and its Λ_P-coalgebras; on P-torsion-free rings these are commuting ψ_p with ψ_p(x) ≡ x^p modulo p. Give change-of-prime-set functors, free Λ_P-rings on sets, and reflexive presentations by free Λ_P-rings. Finite Div(m) q-Witt data require only P={p | p divides m}. P is arbitrary; coalgebras, rather than Adams-only structures, are used on rings with torsion. (borger line 603, §§1.16–1.18, lines 603–638; pridham Definition 2.1, pridham line 506; wagner Remarks 2.32 and 2.43).

The public laws are `LambdaP.restrict`: For P′⊆P restrict the operations and coaction; `LambdaP.free_homEquiv`: Λ_P-maps from the free ring on I to A correspond naturally to I → A; `LambdaP.hom_ext`: Maps from the free ring agree when they agree on its generators; `LambdaP.singlePrime_wittCoalgebra`: For P={p}, identify the coaction with the usual p-typical Witt-coalgebra notion of δ-ring; `LambdaP.free_polynomial`: The free Λ-ring on I has underlying polynomial ring on the universal exterior operations of its generators; Adams operations have faithfully flat underlying maps; `LambdaP.filteredColimit`: Filtered colimits are created on underlying rings: every coordinate operation and every defining relation uses finitely many arguments.

*Proof route.* Restrict Witt indices to the monoid generated by P; repeat the comonad construction. The free object is represented by symmetric-operation generators and the coalgebra equations. Its polynomial presentation supplies the reflexive coequalizer and faithful-flat Adams property needed in 2.4. The faithful-flat statement uses the free polynomial presentation and prime-set decomposition; it does not identify an Adams operation with a literal permutation of the exterior-operation generators.

*Needs:* Layer 2.1 `ArithmeticLambdaRing`; Layer 1.5 `BigWitt.pTypicalEquiv`.

This interface is used by Layer 2.3 `ArithmeticLambdaRing.perfection`, Layer 4.1 `QWitt.lambdaComparison`.

**Checks.**

- P=∅ gives ordinary commutative rings and the identity Witt comonad.
- P={2} uses infinite 2-typical Witt vectors, not length two.
- The free Λ-ring on no generators is ℤ, with all Adams operations identity.

### 2.3 perfection

Define `ArithmeticLambdaRing.perfection`. Call A perfect if every ψ_n, n>0, is an isomorphism. Construct A^perf as the filtered colimit of A indexed by positive integers under divisibility, with transition A_m → A_n equal to ψ_{n/m}. The resulting Λ-map A → A^perf is initial among Λ-maps to perfect Λ-rings. A is an arithmetic Λ-ring; colimits are in commutative Λ-rings. (wagner line 1621, Remark 2.47 and footnote 2.3, lines 1621–1643; bhatt-scholze Remark 2.27, bhatt-scholze line 775).

The public laws are `LambdaPerfection.lift`: Maps to a perfect B extend uniquely and naturally across A → A^perf; `LambdaPerfection.adamsEquiv`: Every Adams operation on A^perf has its shift inverse; `LambdaPerfection.idempotent`: If A is perfect then A → A^perf is an isomorphism; `LambdaPerfection.map`: Λ-maps induce maps of perfections with identity and composition laws; `LambdaPerfection.of`: The stage-one map sends a to its colimit class; at stages m|n the class of a equals the class of ψ_{n/m}(a).

*Proof route.* Adams operations commute with the coaction, so form the directed colimit. Index shifts invert each ψ_n. The universal map sends a at stage m to ψ_m^{-1}(f(a)).

*Needs:* Layer 2.2 `ArithmeticLambdaRing.primeSet`.

This interface is used by Layer 2.4 `ArithmeticLambdaRing.IsPerfectlyCovered`.

**Checks.**

- ℤ^perf=ℤ; replacing arithmetic perfection by characteristic-p perfection fails.
- For toric ℤ[T], the perfection is ℤ[T^r | r is a nonnegative rational], with ψ_n(T^r)=T^(nr).
- T has no preimage under ψ_2 on ℤ[T]; ℤ[T] itself is not perfect.

### 2.4 Is Perfectly Covered

Define `ArithmeticLambdaRing.IsPerfectlyCovered`. A is perfectly covered if there exists a faithfully flat Λ-map A → B with B perfect. This is equivalent to every ψ_n being faithfully flat, and to A → A^perf being faithfully flat. Such A is ℤ-torsion-free; so are its flat algebras. A is an arithmetic Λ-ring; the zero ring is allowed under the usual faithful-flat convention. (wagner line 1621, Remark 2.47 and footnote 2.3, lines 1621–1643; wagner-habiro §1.22(e), wagner-habiro line 493; bhatt-scholze Lemma 2.28, bhatt-scholze line 778).

The public laws are `IsPerfectlyCovered.iff_adams`: The three conditions in the statement are equivalent; `IsPerfectlyCovered.torsionFree`: Multiplication by every positive integer is injective on A; `IsPerfectlyCovered.polynomial`: Toric polynomial algebras over a perfectly covered Λ-base are perfectly covered, for any variable set; `IsPerfectlyCovered.free`: Every free arithmetic Λ-ring on a set is perfectly covered; `IsPerfectlyCovered.mk`: A perfect Λ-ring B and a faithfully flat Λ-map A→B give a witness of perfect coverage.

*Proof route.* Use faithful-flat descent on the ψ_n-twisted tensor functors and filtered colimits of faithful-flat maps. The p-coordinate of a coaction gives px=0 ⇒ ψ_p(x)=0 as in the δ torsion lemma; injective Adams on the cover kill p-torsion, and faithful flatness descends this conclusion. Polynomial monomial bases and 2.2 prove the examples.

*Needs:* Layer 2.3 `ArithmeticLambdaRing.perfection`.

This interface is used by Layer 4.6 `QWitt.perfectCover_comparison`, Layer 6.1 `QWitt.completedEtaleFrobenius`, Layer 8.5 `QWitt.framedFrobenius`.

**Checks.**

- On ℤ[T], ψ_2 is finite free with basis 1,T and ψ_3 with basis 1,T,T².
- ℤ, every perfect Λ-ring and the free ring on the empty set satisfy the predicate.
- For A=ℤ[ε]/(ε²) with ψ_n(ε)=nε, the torsion-free Frobenius-lift criterion gives a Λ-ring, but ψ_2 is not flat: after reduction modulo 2, ε acts by zero on the nonzero target dual-number ring. Thus A is not perfectly covered, and torsion-freeness alone is insufficient.

### 2.5 Is Relatively Perfect

Define `ArithmeticLambdaAlgebra.IsRelativelyPerfect`. For any A-algebra R define the twist R^(n)=R⊗_{A,ψ_n}A with its right-hand A-algebra structure. If R is a Λ-A-algebra, define relative perfection by invertibility of ψ_{p/A}:R^(p)→R, r⊗a↦ψ_p(r)a, for every prime p; equivalently these maps are invertible for every positive n. A is an arithmetic Λ-ring and R any commutative unital A-algebra; linearized Adams maps and relative perfection additionally require a compatible Λ-structure on R. (wagner line 1573, §2.45 and Remark 2.47, lines 1573–1628).

The public laws are `LambdaAlgebra.linearizedAdams_tmul`: ψ_{n/A}(r⊗a)=ψ_n(r)a; tensor balancing uses ψ_n on A; `LambdaAlgebra.twist_comp`: (R^(a))^(b) ≅ R^(ab), naturally and compatibly with linearized Adams; `IsRelativelyPerfect.ofPerfect`: If A and R are perfect Λ-rings and A → R is a Λ-map, then R is relatively perfect; `LambdaAlgebra.twist_hom_ext`: A-algebra maps out of the twist are determined on pure tensors; `IsRelativelyPerfect.ofPrimeEquivalences`: A compatible Λ-A-algebra and equivalences for every ψ_{p/A} give relative perfection; these equivalences respect the fixed linearized maps.

*Proof route.* The tensor balancing relation is ψ_n-compatible because A → R is a Λ-map. Associativity of scalar extension proves the composite law, and prime factorization reduces all n to primes.

*Needs:* Layer 2.1 `ArithmeticLambdaRing`; Mathlib `Algebra.TensorProduct.includeRight`.

This interface is used by Layer 4.4 `QWitt.relativeGhost`, Layer 4.6 `QWitt.perfectCover_comparison`, Layer 6.2 `QWitt.cyclotomicCompletedFrobenius`.

**Checks.**

- For R=A the linearized map is an isomorphism even when ψ_p on A is not surjective.
- ℤ[T] over ℤ is not relatively perfect: T is outside the image of linearized ψ_2.
- For A=ℤ and perfect R the definition reduces to invertibility of ψ_p on R.

### Examples

The toric ring ℤ[T] is perfectly covered but not perfect; ℤ is perfect. Characteristic-p perfection is a different object. The checks above specify the evaluated values and the negative controls.

### Dependencies

Layer 1.4 `BigWitt.frobenius`; Layer 1.5 `BigWitt.pTypicalEquiv`; Mathlib `Algebra.TensorProduct.includeRight`.

## Layer 3: Absolute q-Witt rings and exactness

### 3.1 Absolute F V System

Define `QWitt.AbsoluteFVSystem`. For a commutative ring R define a q-FV system to consist of Z[q]-rings E_m, m>0, structural maps W_Div(m)(R)[q]/(q^m−1) → E_m, Z[q]-linear additive V_{m/d}:E_d → E_m and multiplicative Z[q]-algebra maps F_{m/d}:E_m → E_d compatible with the ordinary Witt maps, and satisfying FV=m/d and VF=[m/d]_{q^d}. The unital variant preserves units; the nonunital variant uses nonunital rings with Z[q]-action. Morphisms preserve every structure map. R may be nonunital; d divides m and d,m>0. (wagner line 475, Definition 2.8 and Remark 2.12, lines 475–549).

The public laws are `AbsoluteFVSystem.mk`: Compatible structural, F and V maps with the two composite laws give a system; `AbsoluteFVSystem.hom_ext`: A morphism is determined by its maps on E_m; `AbsoluteFVSystem.truncate`: Restrict the system to any divisor-closed set of positive indices.

*Proof route.* Specify the category with all structural commutative squares. The polynomial model for ℤ verifies that the two composite laws impose distinct requirements.

*Needs:* Layer 1.4 `BigWitt.frobenius`.

This interface is used by Layer 3.2 `QWitt.absolute`.

**Checks.**

- For R=ℤ, E_m=ℤ[q]/(q^m−1), F is reduction and V is multiplication by [m/d]_{q^d}.
- The zero nonunital ring gives the zero system.
- Using V_2=2 in the ℤ example fails VF=1+q at m=2.

### 3.2 absolute

Construct `QWitt.absolute`. Construct the initial q-FV system Q_m(R). It is W_Div(m)(R)[q]/I_m, where I_m is generated by (q^d−1)V_{m/d}(x) and [d/e]_{q^e}V_{m/d}(x)−V_{m/e}(F_{d/e}x) for e|d|m and x∈W_Div(d)(R)[q]. For m=1, Q_1(R) ≅ R, with q acting as 1. R is any commutative ring, possibly nonunital; m>0. (wagner line 483, Lemmas 2.9–2.10 and Remark 2.12, lines 483–549).

The public laws are `QWitt.absolute_desc`: Maps to a q-FV system extend uniquely from the structural Witt maps; `QWitt.absolute_map`: Ring maps induce maps of initial systems; identity and composition hold; `QWitt.absolute_hom_ext`: System maps out of Q agree on the structural polynomial generators; `QWitt.F_comp_V_comp`: F and V compose, commute for coprime indices and satisfy the projection formula; `QWitt.teichmuller`: τ_m is the multiplicative composite R → W_Div(m)(R) → Q_m(R); F_{m/d}τ_m(r)=τ_d(r)^(m/d).

*Proof route.* Verify that F and V preserve I_m using divisibility and coprime interchange in 1.4. The presentation gives the initial property and the remaining identities by descent from ordinary Witt operations.

*Needs:* Layer 3.1 `QWitt.AbsoluteFVSystem`.

This interface is used by Layer 3.3 `QWitt.absoluteGhost`.

**Checks.**

- Q_1(R)=R and Q_m(0)=0, including nonunital inputs.
- For Q_2(ℤ), V_2(1)=1+q and F_2(1+q)=2.
- At q=1, V_2F_2=2; this specialization need not be ordinary W_Div(2)(R).

### 3.3 absolute Ghost

Construct `QWitt.absoluteGhost`. For d|m define gh_{m/d}:Q_m(R) → R[q]/Φ_d(q) as F_{m/d} followed by the quotient by all proper-divisor V-images in Q_d. At d=m this is the first ghost; its target is R[q]/Φ_m(q). The Teichmüller image is r^(m/d) in the dth target. R is commutative, possibly nonunital; m>0. (wagner line 552, §2.13, lines 552–580).

The public laws are `QWitt.ghost_quotient`: ker gh_1 is the ideal generated by V_p-images for prime p|m; `QWitt.ghost_F`: gh_{m/d}=gh_1 F_{m/d}; `QWitt.ghost_V`: gh_{m/d} V_n is zero unless n divides m/d; when it does it is n times the appropriate source ghost; `QWitt.ghost_map`: Ghosts commute with coefficient maps.

*Proof route.* First quotient the defining ideal and all prime V-images; the cyclotomic ideal contract identifies the result, treating m=1 directly. Compose with F for the other ghosts.

*Needs:* Layer 3.2 `QWitt.absolute`; `gap:cyclotomic-contract`.

This interface is used by Layer 3.4 `QWitt.absolute_verschiebungResolution`, Layer 4.4 `QWitt.relativeGhost`.

**Checks.**

- For m=2 over ℤ, gh_1 evaluates q at −1 and kills V_2(1)=1+q.
- At m=1 there are no proper V-images and Φ_1=q−1; the ghost is id_R.
- Reduction q↦1 from Q_2 to Q_1 does not extend the ordinary restriction W_2→W_1: it sends V_2(1) to 2 whereas ordinary restriction sends it to 0.

### 3.4 absolute verschiebung Resolution

Prove `QWitt.absolute_verschiebungResolution`. If p_1,…,p_r are the distinct prime factors of m, put p_J=∏_{j∈J}p_j. The augmented complex with ⊕_{|J|=k}Q_{m/p_J}(R) in chain degree k, Q_m(R) in degree 0 and quotient R[q]/Φ_m(q) is exact. Deletion of j∈J has coefficient (−1)^{#{i∈J:i<j}}V_{p_j}. In particular every V_n:Q_{m/n}(R) → Q_m(R) is injective. R may be nonunital; m>0; an ordering of distinct prime divisors is fixed only to write signs. (wagner line 591, Proposition 2.15, Remark 2.16, Lemmas 2.17–2.18 and Corollary 2.19, lines 591–1004).

The public laws are `QWitt.verschiebungResolution_perm`: Reordering primes gives the signed permutation chain isomorphism; `QWitt.verschiebung_injective`: All absolute Verschiebungen are injective without a torsion assumption.

*Proof route.* Prove the prime-power short exact sequence from the explicit ideal. For the general complex, use iterated mapping cones of its finite cube; split the prime-to-p V-directions after p-localization and compare the remaining direction with the prime-power case. Rational and prime-completed detection prove exactness; apply the same cube argument to kernels of V. The terminal object removed from the reverse-inclusion cube is ∅.

*Needs:* Layer 3.3 `QWitt.absoluteGhost`; DerivedModuleAlgebra §0.K.1; EnhancedDerivedSheaves §0.3; `gap:cyclotomic-contract`; Layer 1.7 `CommutingEndomorphisms.koszulComplex`; Layer 1.8 `QWitt.arithmeticFracture`.

**Checks.**

- For m=6, the first maps are Q_1 → Q_3⊕Q_2 → Q_6, x↦(−V_3x,V_2x), then (a,b)↦V_2a+V_3b; the composite is zero.
- For m=1 the augmentation Q_1(R)→R is an isomorphism.
- For m=2^a, the resolution is 0→Q_{2^(a−1)}→Q_{2^a}→R[ζ_{2^a}]→0.

### 3.5 absolute localization torsion

Prove `QWitt.absolute_localization_torsion`. Q_m commutes with integer localization and with localization R[U⁻¹] at τ_m(U). If R is p-torsion-free, so is Q_m(R); if R has bounded p-primary torsion, so does Q_m(R). If R is p-torsion-free for every p|m, its q-Witt ghosts are jointly injective. R is commutative, possibly nonunital; multiplicative localization at elements uses the corresponding unital algebra or unitization; p is any prime. (wagner line 1006, Corollaries 2.20, 2.22 and Lemmas 2.21, 2.23, lines 1006–1080).

The public laws are `QWitt.absolute_localize`: Q_m(R)[τ_m(U)⁻¹] ≅ Q_m(R[U⁻¹]); `QWitt.absolute_boundedTorsion`: A finite bound on p-primary torsion of R gives a bound for each fixed m; no uniform bound in m is asserted.

*Proof route.* Induct along 3.4; localize first to ℤ_(p), where prime-to-p V maps split by ℓ⁻¹F_ℓ. Kernels killed by the other F maps and first ghost lie in im V_p. Apply this to torsion elements, bounding the exponents inductively.

*Needs:* Layer 3.4 `QWitt.absolute_verschiebungResolution`.

**Checks.**

- For R=ℤ and m=2, the ghosts ℤ[q]/(q²−1)→ℤ×ℤ are jointly injective.
- For R=𝔽₂,m=2, V_2(1) is nonzero by 3.4 but both ghosts vanish on it; dropping the torsion hypothesis fails.
- For m=1 the sole ghost is id_R even when R has torsion.

### 3.6 absolute completion

Prove `QWitt.absolute_completion`. If the derived p-completion R̂_p is discrete, Q_m(R)^∧_p ≅ Q_m(R̂_p). If this holds for each p|m, then Q_m(R)^∧_{(q^n−1)} is discrete for every n>0. If R has bounded p-primary torsion for every p|m, Q_m(R) has bounded (q^n−1)-power torsion. R is commutative, possibly nonunital; m,n>0; p is prime. (wagner line 1083, Corollaries 2.24, 2.26 and Lemma 2.27, lines 1083–1190).

The public laws are `QWitt.absolute_completion_natural`: Comparisons commute with F, V, ghosts and maps of R.

*Proof route.* Complete the finite resolution 3.4 and induct. On R[ζ_d], compare radicals of (q^n−1) with (p) when d/gcd(d,n) is a nontrivial p-power, use the unit ideal for at least two prime factors, and the zero ideal for d|n. The same argument with annihilator bounds gives bounded torsion.

*Needs:* Layer 3.5 `QWitt.absolute_localization_torsion`; DerivedModuleAlgebra §1.1; DerivedModuleAlgebra §1.2; DerivedModuleAlgebra §1.3; DerivedModuleAlgebra §1.5; `gap:cyclotomic-contract`.

**Checks.**

- For R=ℤ,m=2, p-completion gives ℤ_p[q]/(q²−1).
- For m=1, (q^n−1) acts as zero and its derived completion is R.
- Discreteness of R̂_p alone is not declared a bounded-torsion hypothesis; the two conclusions have distinct assumptions.

### 3.7 absolute witt injective

Prove `QWitt.absolute_witt_injective`. The natural map W_Div(m)(R) → Q_m(R) is injective for every commutative ring R, including nonunital R. For an exact sequence 0→J→R→R′→0 of such rings, 0→Q_m(J)→Q_m(R)→Q_m(R′)→0 is exact as additive groups. m>0; J is the kernel ring, with no unit required. (wagner line 1194, Proposition 2.28, Corollary 2.29 and Lemma 2.30, lines 1194–1303).

The public laws are `QWitt.absolute_pLocalDecomposition`: For R a ℤ_(p)-algebra and m=p^a n with gcd(n,p)=1, Q_m(R) ≅ ∏_{d|n} Q_{p^a}(R)⊗_{ℤ_(p)[q],q↦q^d}ℤ_(p)[q]/Φ_d(q^(p^a)).

*Proof route.* The resolution proves exactness on kernel rings. Prove the displayed p-local decomposition by truncated universal properties and 1.6; reduce injectivity to prime powers, where the explicit ideal in 3.2 and coefficient comparison give injectivity. Localize at every prime to conclude.

*Needs:* Layer 3.6 `QWitt.absolute_completion`; Layer 1.6 `BigWitt.etale_baseChange`.

**Checks.**

- For R=0 the injection and exact sequence are zero maps between zero objects.
- For m=2,R=𝔽₂, the element V_2(1) stays nonzero, despite its zero ghosts.
- For m=1 the assertion is the original short exact sequence.

### Examples

Q_1(R)=R with q=1; Q_2(ℤ)=ℤ[q]/(q²−1); nonunital zero and square-zero rings remain included. The checks above specify the evaluated values and the negative controls.

### Dependencies

Layer 1.4 `BigWitt.frobenius`; `gap:cyclotomic-contract`; DerivedModuleAlgebra §0.K.1; EnhancedDerivedSheaves §0.3; Layer 1.7 `CommutingEndomorphisms.koszulComplex`; Layer 1.8 `QWitt.arithmeticFracture`; DerivedModuleAlgebra §1.1; DerivedModuleAlgebra §1.2; DerivedModuleAlgebra §1.3; DerivedModuleAlgebra §1.5; Layer 1.6 `BigWitt.etale_baseChange`.

## Layer 4: Relative q-Witt rings and Λ comparison

### 4.1 lambda Comparison

Construct `QWitt.lambdaComparison`. For any arithmetic Λ-ring A let s_m:A[q]/(q^m−1)→Q_m(A) be the polynomial extension of the coaction A→W_Div(m)(A). Construct c_m:Q_m(A)→A[q]/(q^m−1) with c_m s_m=ψ_m, c_d F_{m/d}=reduction c_m and c_m V_{m/d}=[m/d]_{q^d}c_d. If all ψ_n are injective, c_m identifies Q_m(A) with ∑_{d|m}[d]_{q^(m/d)}ψ_{m/d}(A)[q]/(q^m−1). For perfect A, s_m and c_m are isomorphisms. A is a commutative unital arithmetic Λ-ring; m>0. (wagner line 1348, Lemmas 2.33–2.34, Corollary 2.35, Proposition 2.36 and Corollary 2.37, lines 1348–1468).

The public laws are `QWitt.lambdaCoordinates`: Every x∈W_Div(m)(A) has a unique expansion ∑_{d|m}V_d s_{m/d}(a_d); define ε_d by its final coefficient; `QWitt.lambdaComparison_expansion`: c_m(∑ V_d s_{m/d}(a_d)) = ∑[d]_{q^(m/d)}ψ_{m/d}(a_d); `QWitt.lambdaComparison_natural`: Both comparison maps commute with Λ-maps.

*Proof route.* Use triangular Witt coordinates to define ε, first on free torsion-free Λ-rings and then by their reflexive presentations. The displayed formula is multiplicative after cyclotomic projection on a torsion-free universal ring. Descend to Q using 3.2; ghost injectivity and 2.4 give the image assertion.

*Needs:* Layer 2.2 `ArithmeticLambdaRing.primeSet`; Layer 3.7 `QWitt.absolute_witt_injective`.

This interface is used by Layer 4.2 `QWitt.RelativeFVSystem`, Layer 5.4 `QWitt.finiteType`.

**Checks.**

- For A=ℤ,m=2, c_2 and s_2 are inverse isomorphisms and V_2(1) maps to 1+q.
- For toric ℤ[T], c_2 has image ℤ[T²,q]+(1+q)ℤ[T,q] inside ℤ[T,q]/(q²−1); it is not the whole ring.
- For m=1 both comparisons are identities.

### 4.2 Relative F V System

Define `QWitt.RelativeFVSystem`. For a Λ-ring A and unital A-algebra R, a relative q-FV system has A[q]-algebras E_m receiving Q_m(R)⊗_{Q_m(A),c_m}A[q]/(q^m−1), with compatible A[q]-algebra F and A[q]-linear V satisfying FV=m/d and VF=[m/d]_{q^d}. Define its morphisms by commutation with these maps. A is any arithmetic Λ-ring; R is any commutative unital A-algebra; d|m. (wagner line 1504, Definition 2.40, lines 1504–1512).

The public laws are `RelativeFVSystem.mk`: Structural maps and compatible F,V satisfying the two relations construct a system; `RelativeFVSystem.hom_ext`: Morphisms are determined by their component maps; `RelativeFVSystem.truncate`: Restriction to any divisor-closed set preserves the notion.

*Proof route.* Use c_m to specify the scalar action; requiring compatibility with every V is additional data beyond the tensor product at a single level.

*Needs:* Layer 4.1 `QWitt.lambdaComparison`.

This interface is used by Layer 4.3 `QWitt.relative`.

**Checks.**

- For R=A, E_m=A[q]/(q^m−1), reduction F and multiplication V satisfy the definition.
- For R=0 all components may be zero rings, over any A.
- Replacing A[q]-linearity by ψ-semi-linearity would give the wrong relative category; F fixes the base coefficient a and q.

### 4.3 relative

Construct `QWitt.relative`. The category in 4.2 has initial object Q_m(R/A). It is the tensor product there modulo the ideal generated by V_{m/d}(xy)⊗1−V_{m/d}(x)⊗c_d(y), for x∈Q_d(R), y∈Q_d(A). Lifts of c_d(y) modulo q^m−1 give the same generator because V_{m/d}(x) is killed by q^d−1. It has functorial F,V, multiplicative τ_m and composition, coprime interchange and projection laws. A is any arithmetic Λ-ring; R any commutative unital A-algebra; m>0. (wagner line 1513, Lemmas 2.41–2.42 and Remark 2.43, lines 1513–1559).

The public laws are `QWitt.relative_desc`: There is a unique compatible map to any relative q-FV system; `QWitt.relative_map`: A-algebra maps give maps of systems, preserving identity and composition; `QWitt.relative_hom_ext`: Maps of systems agree when their structural maps agree; `QWitt.relative_teichmuller_F`: F_{m/d}τ_m(r)=τ_d(r)^(m/d); `QWitt.relative_truncation`: The same initial property holds on every divisor-closed set; Div(m) depends only on Λ_{p|m}.

*Proof route.* Check that all F and V preserve the ideal, using the comparison compatibilities in 4.1 and separate cases p|m/d and p∤m/d. The universal property gives maps and laws without requiring flatness of A.

*Needs:* Layer 4.2 `QWitt.RelativeFVSystem`.

This interface is used by Layer 4.4 `QWitt.relativeGhost`, Layer 7.1 `QWitt.DifferentialVSystem`.

**Checks.**

- Q_1(R/A)=R and Q_m(0/A)=0.
- Q_m(A/A)=A[q]/(q^m−1), even for a nonperfect A.
- The tensor product without the displayed ideal need not make V A[q]-linear; the generators test precisely this failure.

### 4.4 relative Ghost

Construct `QWitt.relativeGhost`. For d|m construct gh_{m/d}:Q_m(R/A)→R^(d)⊗_A A[q]/Φ_d(q). It factors as F_{m/d} then the first ghost of Q_d. The first ghost gh_1 at level m is the quotient by the ideal generated by all proper-divisor V-images. A is any Λ-ring; R is an A-algebra; d|m and d,m>0. (wagner line 1565, §2.44, lines 1565–1572).

The public laws are `QWitt.relativeGhost_tmul`: On structural x⊗a, gh_{m/d} sends x to its ordinary (m/d)th Witt ghost in the R factor, and a to the A[q]/Φ_d factor; `QWitt.relativeGhost_natural`: Ghosts commute with maps of A-algebras and Λ-base change; `QWitt.relativeGhost_teichmuller`: gh_{m/d}(τ_m(r))=r^(m/d)⊗1.

*Proof route.* Tensor the absolute ghosts with the scalar cyclotomic quotient and verify that every relative generator in 4.3 vanishes. The tensor balancing equation forces ψ_d, with no choice of inverse Adams operation.

*Needs:* Layer 4.3 `QWitt.relative`; Layer 2.5 `ArithmeticLambdaAlgebra.IsRelativelyPerfect`; Layer 3.3 `QWitt.absoluteGhost`.

This interface is used by Layer 4.5 `QWitt.relative_baseChange`, Layer 5.2 `QWitt.ghost_etalePushout`, Layer 7.6 `QWitt.differentialGhost`.

**Checks.**

- At d=m the structural coaction s_m(a) maps to ψ_m(a)⊗1=1⊗a; erasing the twist makes this equality false.
- At m=d=1, R^(1)[ζ_1]=R and the map is identity.
- Over A=ℤ the twisted targets identify with the absolute ghost targets.

### 4.5 relative base Change

Prove `QWitt.relative_baseChange`. For any Λ-map A→A′ and A-algebra R there is a canonical A′[q]-algebra isomorphism Q_m(R/A)⊗_A A′ ≅ Q_m(R⊗_A A′/A′), compatible with F,V,τ and twisted ghosts. No flatness is required. A,A′ are arithmetic Λ-rings; R is any A-algebra; m>0. (wagner line 1583, Lemma 2.46, lines 1583–1620).

The public laws are `QWitt.polynomial_image`: For toric A[T_i], Q_m(A[T_i]/A) identifies with ∑_{d|m}[d]_{q^(m/d)}A[T_i^(m/d),q]/(q^m−1); `QWitt.reflexive_coequalizer`: Q_m(−/A) preserves reflexive coequalizers and filtered colimits.

*Proof route.* First identify the polynomial image using the maps in 4.1 and the relative relations. Prove base change there directly; then use the initial property to preserve reflexive coequalizers of polynomial presentations. A bare appeal to the tensor universal property would omit the Witt structure on the new coefficients.

*Needs:* Layer 4.4 `QWitt.relativeGhost`.

**Checks.**

- A′=A gives the identity comparison, and A′=0 gives zero.
- For R=A[T], m=2 the polynomial-image formula commutes with any Λ-base map.
- Base change here uses a Λ-map of bases; an arbitrary ring map does not specify the required ψ-compatible scalar action.

### 4.6 perfect Cover comparison

Prove `QWitt.perfectCover_comparison`. If A is perfectly covered, all relative V are injective, the relative version of the exact resolution 3.4 has quotient R^(m)[ζ_m], and for a relatively perfect Λ-A-algebra R the maps s_{m/A}:R^(m)[q]/(q^m−1)→Q_m(R/A) and c_{m/A}:Q_m(R/A)→R[q]/(q^m−1) are isomorphisms with composite ψ_{m/A}. For any Λ-A-algebra R both maps exist with that composite without the perfection hypotheses. A is a Λ-ring; existence of comparisons assumes R is a Λ-A-algebra; injectivity and exactness assume A perfectly covered; isomorphisms also assume R relatively perfect. (wagner line 1573, §2.45 and Remark 2.47, lines 1573–1643).

The public laws are `QWitt.perfectBase_absolute`: If A is perfect, the natural Q_m(R)→Q_m(R/A) is an isomorphism for every R/A; `QWitt.relativeComparison_natural`: The comparisons commute with Λ-A-algebra maps and Λ-base change.

*Proof route.* Use 4.5 and A→A^perf, reduce to the absolute perfect-base case via 4.1, then descend exactness and isomorphisms by faithful flatness. Keep existence separate from the statements requiring descent.

*Needs:* Layer 4.5 `QWitt.relative_baseChange`; Layer 2.4 `ArithmeticLambdaRing.IsPerfectlyCovered`; Layer 2.5 `ArithmeticLambdaAlgebra.IsRelativelyPerfect`.

**Checks.**

- For R=A, s_{m/A} is the standard identification even when A is only perfectly covered.
- For toric ℤ[T]/ℤ, relative perfection fails and c_2 misses T.
- For A=ℤ all relative V are injective even on torsion R.

### Examples

Relative constructions exist before perfect coverage is assumed. Twisted ghosts retain the Adams operation of the base. The checks above specify the evaluated values and the negative controls.

### Dependencies

Layer 2.2 `ArithmeticLambdaRing.primeSet`; Layer 3.7 `QWitt.absolute_witt_injective`; Layer 2.5 `ArithmeticLambdaAlgebra.IsRelativelyPerfect`; Layer 3.3 `QWitt.absoluteGhost`; Layer 2.4 `ArithmeticLambdaRing.IsPerfectlyCovered`.

## Layer 5: Étale base change, finiteness and relative completions

### 5.1 etale

Prove `QWitt.etale`. For every étale A-algebra map R→R′, Q_m(R/A)→Q_m(R′/A) is étale. For d|m its F-square is a pushout: Q_m(R′/A)⊗_{Q_m(R/A),F_{m/d}}Q_d(R/A) ≅ Q_d(R′/A). The ordinary tensor is also the derived tensor since the changed factor is étale and flat. A is any arithmetic Λ-ring; R,R′ any A-algebras; m>0. (wagner line 1651, Proposition 2.48 and Lemma 2.50, lines 1651–1712).

The public laws are `QWitt.etale_wittBaseChange`: W_Div(m)(R′)⊗_{W_Div(m)(R)}Q_m(R/A) ≅ Q_m(R′/A); `QWitt.etale_natural`: The pushout comparison is natural and compatible with chains of divisors.

*Proof route.* Apply ordinary Witt étale base change to the generators and relations in 3.2 and 4.3, giving the displayed Witt-base-change comparison. Étaleness and the F-pushout then follow from 1.6.

*Needs:* Layer 4.5 `QWitt.relative_baseChange`; Layer 1.6 `BigWitt.etale_baseChange`.

**Checks.**

- For R′=R the comparison is identity.
- At m=1 it is the original étale algebra R′ over R.
- No perfect-cover, Noetherian or F-finiteness hypothesis is added to this theorem.

### 5.2 ghost etale Pushout

Prove `QWitt.ghost_etalePushout`. For d|m and an étale A-algebra map R→R′, the square from Q_m(R/A)→Q_m(R′/A) to R^(d)[ζ_d]→R′^(d)[ζ_d], with vertical maps gh_{m/d}, is a pushout of rings and of derived commutative algebras. A any arithmetic Λ-ring; R→R′ étale over A; d|m. (wagner line 1715, Corollary 2.51, lines 1715–1730).

The public laws are `QWitt.ghost_etalePushout_map`: The comparison on pure tensors is induced by the coefficient map and the relative ghost.

*Proof route.* Reduce to d=m by 5.1 and present the first ghost as the cokernel of all proper V-images. Flatness of the étale Q-map makes the ordinary quotient pushout the derived one.

*Needs:* Layer 5.1 `QWitt.etale`; Layer 4.4 `QWitt.relativeGhost`; EnhancedDerivedSheaves §E5:abstract.

**Checks.**

- At m=d=1 the square is the identity vertical square.
- For R=A it identifies Q_m(R′/A)⊗_{A[q]/(q^m−1)}A[ζ_d] with R′^(d)[ζ_d].
- With R′=R/(x), flatness may fail; this is not a derived pushout assertion for arbitrary maps.

### 5.3 relative torsion completion

Prove `QWitt.relative_torsion_completion`. For a perfectly covered A and any R/A, all conclusions of 3.5 and 3.6 about integer torsion, joint ghost injectivity and discrete completions hold relatively, with ghosts in R^(d)[ζ_d]. In particular Q_m(R/A)^∧_p ≅ Q_m(R̂_p/A) when R̂_p is discrete, and Q_m(R/A)^∧_{(q^n−1)} is discrete if R̂_p is discrete for all p|m. Bounded p-primary torsion of R for all p|m gives bounded (q^n−1)-power torsion. A perfectly covered; m,n>0; p prime. Ghost injectivity assumes R p-torsion-free for all p|m; integer torsion statements keep the same prime-specific hypotheses as 3.5. (wagner line 1621, Remark 2.47, lines 1621–1643, with Corollaries 2.22, 2.24, 2.26; §4.19 proof, lines 3123–3127).

The public laws are `QWitt.relative_completeBaseChange`: Completed scalar extension to A^perf computes the corresponding completion after perfect-base comparison; complete faithful-flat descent detects discreteness.

*Proof route.* Use the faithful-flat perfect cover and 4.5 for torsion and exactness. For completions, use completed derived scalar extension, not uncompleted tensor interchange with infinite limits; apply complete faithful-flat descent and bounded-torsion comparison from the supplier contracts.

*Needs:* Layer 4.6 `QWitt.perfectCover_comparison`; Layer 3.6 `QWitt.absolute_completion`; DerivedModuleAlgebra §1.7; DerivedModuleAlgebra §1.8; DerivedModuleAlgebra §1.9.

**Checks.**

- For R=A,m=1, all comparisons reduce to those for A.
- For A=ℤ the statement agrees with 3.6.
- No relative V-injectivity or torsion/completion descent is asserted for an arbitrary Λ-base.

### 5.4 finite Type

Prove `QWitt.finiteType`. If R is a finite type ℤ-algebra, Q_m(R) is a finite type ℤ[q]/(q^m−1)-algebra and hence Noetherian. For the toric polynomial ring R₀=ℤ[T_1,…,T_r], R₀[q]/(q^m−1) is finite over the image of c_m. Relative q-Witt functors commute with filtered colimits and reflexive polynomial presentations. m>0; finite type and finitely many variables are required only for the finiteness statements. (wagner line 1485, Corollary 2.39 and proof, lines 1485–1495; Lemma 2.46 proof, lines 1588–1620).

The public laws are `QWitt.polynomial_finite`: The image contains ℤ[T_1^m,…,T_r^m,q]/(q^m−1), over which R₀[q]/(q^m−1) is finite.

*Proof route.* Use the image formula 4.1 and integral monomials for the polynomial case, then descend through a finite presentation. Filtered colimits and reflexive coequalizers follow from the algebraic universal properties.

*Needs:* Layer 4.5 `QWitt.relative_baseChange`; Layer 4.1 `QWitt.lambdaComparison`.

**Checks.**

- With r=0 this is the finite free rank-m algebra ℤ[q]/(q^m−1).
- At m=2,r=1, 1,T generate ℤ[T,q]/(q²−1) over the subring containing T².
- Infinitely many variables are allowed for base change, but are not declared Noetherian.

### Examples

Identity maps, prime-power indices and a characteristic-two ghost kernel test the limits of étale and torsion claims. The checks above specify the evaluated values and the negative controls.

### Dependencies

Layer 4.5 `QWitt.relative_baseChange`; Layer 1.6 `BigWitt.etale_baseChange`; Layer 4.4 `QWitt.relativeGhost`; EnhancedDerivedSheaves §E5:abstract; Layer 4.6 `QWitt.perfectCover_comparison`; Layer 3.6 `QWitt.absolute_completion`; DerivedModuleAlgebra §1.7; DerivedModuleAlgebra §1.8; DerivedModuleAlgebra §1.9; Layer 4.1 `QWitt.lambdaComparison`.

## Layer 6: Completed coefficient Frobenius and cyclotomic overlaps

### 6.1 completed Etale Frobenius

Construct `QWitt.completedEtaleFrobenius`. For every prime p, a perfectly covered Λ-ring A and étale R/A, the ordinary p-completion R̂_p has a unique continuous ring endomorphism φ_p extending ψ_p:A→A→R̂_p and reducing to x↦x^p on R/p. Its linearization (R̂_p⊗^L_{A,ψ_p}A)^∧_p→R̂_p, r⊗a↦φ_p(r)a, is an equivalence. All rings and completed tensor products in this statement are discrete and agree with ordinary completed tensor products. A perfectly covered; R étale over A; p prime. No Λ-structure or Frobenius lift on uncompleted R is assumed. (wagner-habiro line 647, §2.7, lines 647–658).

The public laws are `completedEtaleFrobenius_mod`: φ_p(r) mod p = r^p for r∈R; the map is ψ_p-semilinear over A; `completedEtaleFrobenius_natural`: Étale A-algebra maps commute with φ_p on p-completions; `completedEtaleFrobenius_iterate`: Iterated linearizations for ψ_{p^a} are equivalences, compatible with composition; `completedEtaleFrobenius_ordinary`: The derived completed tensor equals completion of the ordinary twisted tensor.

*Proof route.* Lift the relative Frobenius modulo p uniquely through the nilpotent p-power thickenings using formal étaleness. The inverse limit gives φ_p. Perfect coverage makes A and R torsion-free and ψ_p flat; completed tensor products are discrete by complete flatness. Modulo p the linearization is étale relative Frobenius, an isomorphism; derived Nakayama gives the equivalence.

*Needs:* Layer 2.4 `ArithmeticLambdaRing.IsPerfectlyCovered`; Layer 5.3 `QWitt.relative_torsion_completion`; SchemeAndStackFoundations §0.23a; SchemeAndStackFoundations §0.29; SchemeAndStackFoundations §4.1; DerivedModuleAlgebra §1.3; DerivedModuleAlgebra §1.7.

This interface is used by Layer 6.2 `QWitt.cyclotomicCompletedFrobenius`.

**Checks.**

- For R=A, the linearization is the canonical equivalence of the ψ_p-twisted base with A after completion. If p is invertible in A, both completions are zero; no prime is discarded.
- For A=ℤ,R=ℤ×ℤ,p=2, φ_2 is identity on ℤ₂×ℤ₂ and reduces to the square map.
- For R=ℤ[T] over A=ℤ, the coordinate lift T↦T² exists but its linearization is not an equivalence modulo 2: T is outside its image. Étaleness cannot be replaced by smoothness.

### 6.2 cyclotomic Completed Frobenius

Prove `QWitt.cyclotomicCompletedFrobenius`. For A,R,p as in 6.1 and every d>0 there is a natural A[q]-linear equivalence ((R̂_p⊗^L_{A,ψ_{pd}}A)[q])^∧_{(p,Φ_{pd})} ≃ ((R̂_p⊗^L_{A,ψ_d}A)[q])^∧_{(p,Φ_d)}, induced by r⊗a↦φ_p(r)⊗a and q↦q. It agrees with ordinary completed tensor products. Iteration composes these maps for d,pd,…,p^a d. A perfectly covered; R étale over A; p prime; d>0. (wagner-habiro line 647, §2.7 and Theorem 2.9 proof, lines 647–661 and 709–716).

The public laws are `cyclotomicCompletedFrobenius_q`: The equivalence fixes q and the right A-factor; `cyclotomicCompletedFrobenius_ideals`: The ideals (p,Φ_d) and (p,Φ_{pd}) have equal radicals in A[q], giving the same derived completion functor; `cyclotomicCompletedFrobenius_baseChange`: The equivalence is the ψ_d-base change of 6.1 followed by the common completion; it commutes with morphisms of étale A-algebras.

*Proof route.* Apply ψ_d scalar extension to 6.1: tensor balancing uses ψ_dψ_p=ψ_{pd}. Extend by q fixed. Equal radicals permit use of one completion topology; flatness of ψ_d and completed base change give the equivalence, without imposing p∤d.

*Needs:* Layer 6.1 `QWitt.completedEtaleFrobenius`; Layer 2.5 `ArithmeticLambdaAlgebra.IsRelativelyPerfect`; `gap:cyclotomic-contract`.

**Checks.**

- For p=2,d=1, Φ_1=q−1 and Φ_2=q+1 become equal modulo 2.
- For p=3,d=1, Φ_3 mod 3=(q−1)²; (3,Φ_3) and (3,q−1) have the same radical but are not equal in ℤ[q].
- For R=0 both sides are zero, and for R=A the map is the canonical twisted-base equivalence.

### 6.3 completed Ghost Frobenius

Prove `QWitt.completedGhostFrobenius`. For pd|m, the reductions modulo p of gh_{m/(pd)} and gh_{m/d} commute with the bottom map R/p⊗_{A/p,ψ_{pd}}(A/p)[q]/Φ_{pd}→R/p⊗_{A/p,ψ_d}(A/p)[q]/Φ_d, r⊗a↦r^p⊗a, q↦q. The deformation of this bottom map on the common (p,Φ_d)-completion is exactly 6.2. A perfectly covered; R étale over A; p prime; pd|m. (wagner-habiro line 679, Theorem 2.9 proof, lines 679–721).

The public laws are `completedGhostFrobenius_teichmuller`: The two paths on τ_m(r) give r^(m/d)⊗1; `completedGhostFrobenius_deformation`: The comparison is characterized by the indicated reduction and unique étale lifting, compatibly with iterations.

*Proof route.* The ordinary Witt ghosts in characteristic p satisfy w_{pn}=w_n^p. Descend this identity through the relative presentation and the cyclotomic quotient. Use 5.2 for the étale ghost algebras and unique formal lifting to identify the completed map.

*Needs:* Layer 6.2 `QWitt.cyclotomicCompletedFrobenius`; Layer 5.2 `QWitt.ghost_etalePushout`.

**Checks.**

- For m=p,d=1, the upper Teichmüller value r maps to r^p, matching the bottom ghost.
- For A=R=ℤ and p=2 this is the q-fixed overlap between q=−1 and q=1 modulo 2.
- Sending q↦q^p here would not be the A[q]-linear map specified by the étale deformation square.

### Examples

The coefficient map fixes q. For p=3,d=1 its two completion ideals have equal radicals but need not be equal. The checks above specify the evaluated values and the negative controls.

### Dependencies

Layer 2.4 `ArithmeticLambdaRing.IsPerfectlyCovered`; Layer 5.3 `QWitt.relative_torsion_completion`; SchemeAndStackFoundations §0.23a; SchemeAndStackFoundations §0.29; SchemeAndStackFoundations §4.1; DerivedModuleAlgebra §1.3; DerivedModuleAlgebra §1.7; Layer 2.5 `ArithmeticLambdaAlgebra.IsRelativelyPerfect`; `gap:cyclotomic-contract`; Layer 5.2 `QWitt.ghost_etalePushout`.

## Layer 7: Positive-degree q-Witt systems

### 7.1 Differential V System

Define `QWitt.DifferentialVSystem`. For A a Λ-ring and R/A define a q-V system of nonnegative differential graded A[q]-algebras P_m: each is graded commutative with odd squares zero, receives Q_m(R/A)→P_m⁰, and has graded A[q]-linear V_{m/d} extending degree-zero V, with identity and composition laws, V(ω dη)=V(ω)dV(η), and V(ω)dτ_m(r)=V(ωτ_d(r)^(m/d−1))dV(τ_d(r)). Morphisms preserve all data. A any arithmetic Λ-ring; R any A-algebra; homogeneous ω,η in the indicated source; r∈R; d|m. (wagner line 1822, Definition 3.1, lines 1822–1838).

The public laws are `DifferentialVSystem.mk`: The specified degree-zero map, V and identities construct an object; `DifferentialVSystem.hom_ext`: Component DGA maps determine system maps; `DifferentialVSystem.V_d`: V_n d = n d V_n; `DifferentialVSystem.truncate`: Restrict to arbitrary divisor-closed positive indices.

*Proof route.* Use the supplied DG hierarchy and impose strict alternation as a predicate. The projection identity with ω=1 and the relation (q^d−1)P_d=0 prove V_n d=n dV_n; no integer is inverted.

*Needs:* Layer 4.3 `QWitt.relative`; DGAInfinity Layer 0; DGAInfinity Layer 1; `gap:ordinary-derham`.

This interface is used by Layer 7.2 `QWitt.differential`.

**Checks.**

- The system truncated to {1} receives Ω*_{R/A}, with q=1 and V_1=id.
- Over 𝔽₂ a graded commutative algebra with a degree-one element u satisfying u²≠0 is excluded by strict alternation.
- A graded quotient by a differential graded ideal preserving the V-relations again gives a system; a quotient only by the degree-zero relations need not.

### 7.2 differential

Construct `QWitt.differential`. For every A,R as in 7.1 construct the initial q-V system Q_mΩ*_{R/A}. Degree zero is canonically Q_m(R/A), and Q_1Ω*_{R/A}≅Ω*_{R/A}. The natural de Rham DGA map Ω*_{Q_m(R/A)/A[q]}→Q_mΩ* is surjective. At level m the defining differential ideal is generated by all lifted relations ∑V(w_j)dV(x_{j1})⋯dV(x_{jk}) whenever ∑w_j dx_{j1}⋯dx_{jk}=0 at a proper divisor, and the V-Teichmüller relations of 7.1. A any Λ-ring; R any A-algebra; m>0; strict odd alternation including at 2. (wagner line 1956, Proposition 3.12, Definition 3.13 and Remark 3.14, lines 1956–2010).

The public laws are `QWitt.differential_desc`: Every q-V system receives a unique system map from QΩ; `QWitt.differential_hom_ext`: Maps agree on elements x₀dx₁⋯dx_k and the structural data; `QWitt.differential_map`: A-algebra maps induce DGA maps; filtered colimits and reflexive polynomial presentations are preserved; `QWitt.differential_V_monomial`: V(w dx₁⋯dx_k)=V(w)dV(x₁)⋯dV(x_k).

*Proof route.* Induct on m through its proper divisors and quotient the supplied de Rham algebra by the stated differential ideal. All generators have positive degree, preserving degree zero. Lifting polynomial differential expressions proves existence of V and initiality.

*Needs:* Layer 7.1 `QWitt.DifferentialVSystem`.

This interface is used by Layer 7.3 `QWitt.DifferentialFVSystem`, Layer 7.4 `QWitt.verschiebungPrimeDifferential`.

**Checks.**

- Q_1Ω*_{R/A}=Ω*_{R/A} and Q_mΩ*_{0/A}=0.
- For R=A the complex is A[q]/(q^m−1) in degree zero.
- For m=1,R=A[T], d(T²)=2T dT and dT∧dT=0, also at residue characteristic 2.

### 7.3 Differential F V System

Define `QWitt.DifferentialFVSystem`. A differential q-FV system is a q-V system with graded A[q]-algebra F_{m/d} extending F in degree zero, F_1=id, composition, coprime F/V interchange, FV=m/d, VF=[m/d]_{q^d}, F d V=d, V(ωFη)=V(ω)η and F(dτ_m(r))=τ_d(r)^(m/d−1)dτ_d(r). A any Λ-ring; R any A-algebra; d|m. F is not required to commute with d. (wagner line 1893, Definition 3.6 and Lemma 3.7 proof, lines 1893–1929).

The public laws are `DifferentialFVSystem.mk`: A q-V system and the displayed graded maps and relations construct an object; `DifferentialFVSystem.hom_ext`: A morphism is determined by its component graded algebra maps; `DifferentialFVSystem.d_F`: d F_n = n F_n d, derived from F d V=d and VF=[n]_{q^d}; `DifferentialFVSystem.forget`: Forget F to obtain a q-V system; no equivalence of these two categories is asserted.

*Proof route.* Store exactly the graded identities and prove the differential formula by FdV and VF; (q^d−1)=0 on the target converts the q-integer to n. The source proof, rather than its misprinted display, fixes the formula.

*Needs:* Layer 7.2 `QWitt.differential`.

This interface is used by Layer 7.5 `QWitt.frobeniusDifferential`.

**Checks.**

- At m=2,R=ℤ[T], F_2(dτ_2(T))=T dT but d(F_2τ_2(T))=2T dT.
- F_1 is a chain map because its differential factor is 1.
- Replacing dF_n=nF_nd by the printed dF_n=n dV_n is ill-typed: dV_n has the opposite domain and codomain.

### 7.4 verschiebung Prime Differential

Prove `QWitt.verschiebungPrimeDifferential`. In every q-V system over R/A, for p|m and x∈Q_{m/p}(R/A), dV_p(x^p)=V_p(x^(p−1))dV_p(x). On absolute q-Witt vectors the map γ_p on im V_p defined by γ_p(V_p x)=p^(p−2)V_p(x^p) is well-defined and satisfies pγ_p(v)=v^p; the differential of every q-V system is a derivation compatible with this operation after passing from absolute to relative degree zero. A any Λ-ring; R any A-algebra; p prime dividing m; a q-V system as in 7.1 is given. No Frobenius on positive degrees is used. (wagner line 1849, §3.3 and Lemma 3.4, lines 1849–1874; langer-zink Lemma 1.5, langer-zink line 601).

The public laws are `QWitt.VPD_teichmuller`: The V-Teichmüller identity supplies the relation for scalar multiples of Teichmüller lifts; `QWitt.VPD_add`: The relation is preserved under addition, using the integral binomial identity; `QWitt.VPD_noFrobenius`: The proof uses V and d only, so it is available before 7.5.

*Proof route.* Prove the formula first on Teichmüller generators, then on sums by the integral binomial expansion, and finally on V_ℓ-generators by induction on m, including ℓ=p. This is the V-only adaptation of the three-step argument in langer-zink line 605; it does not use an unconstructed F. Absolute V-injectivity makes γ_p a function on its image; the relative assertion is the displayed identity, not a claim of relative V-injectivity.

*Needs:* Layer 7.2 `QWitt.differential`; Layer 3.4 `QWitt.absolute_verschiebungResolution`.

**Checks.**

- At p=2, γ_2(V_2x)=V_2(x²) and 2γ_2(V_2x)=(V_2x)²; no inverse of 2 occurs.
- For x=0 both sides of the differential identity are zero.
- On the first-ghost quotient all V-images vanish, so the identity reduces to zero; on Teichmüller generators it is exactly the V-Teichmüller condition.

### 7.5 frobenius Differential

Construct `QWitt.frobeniusDifferential`. For each p|m define an F_p-semilinear derivation θ_p:Q_m(R)→Q_{m/p}Ω¹_{R/ℤ} by θ_pτ_m(r)=τ_{m/p}(r)^(p−1)dτ_{m/p}(r), θ_p V_p=d, and, for ℓ≠p prime dividing m, p θ_pV_ℓ=dF_pV_ℓ and ℓ θ_pV_ℓ=V_ℓθ_p. It extends uniquely to graded F_p on the relative Q_mΩ*. These F make QΩ initial among differential q-FV systems. A any arithmetic Λ-ring; R any A-algebra; m>0; p prime dividing m. (wagner line 2053, Proposition 3.17, §§3.20–3.30, lines 2053–2549; langer-zink Proposition 1.3, langer-zink line 453 (July 2003 preprint)).

The public laws are `QWitt.theta_add_mul`: θ_p(x+y)=θ_p(x)+θ_p(y), θ_p(xy)=F_p(x)θ_p(y)+F_p(y)θ_p(x); `QWitt.frobeniusDifferential_monomial`: F_p(x₀dx₁⋯dx_k)=F_p(x₀)θ_p(x₁)⋯θ_p(x_k); `QWitt.frobeniusDifferential_unique`: The Teichmüller and V formulas determine all F; this is uniqueness on the initial object, not on every q-V system.

*Proof route.* Use the exact V-resolution to define θ on the sum of V-images. The cyclotomic quotient gives unique Teichmüller remainder representatives. Prove additivity and the derivation law by finite-type reduction, detection after localization and completion, and the already constructed proper-divisor operations. Check that θ kills the relative scalar and differential ideals, then use the de Rham universal property. Verify the system laws on the generators; no torsion-free assumption on R is used.

*Needs:* Layer 7.3 `QWitt.DifferentialFVSystem`; Layer 5.4 `QWitt.finiteType`; Layer 3.4 `QWitt.absolute_verschiebungResolution`; DerivedModuleAlgebra §1.3; `gap:cyclotomic-contract`; Layer 7.4 `QWitt.verschiebungPrimeDifferential`; Layer 1.8 `QWitt.arithmeticFracture`.

This interface is used by Layer 7.6 `QWitt.differentialGhost`.

**Checks.**

- For p=2, θ_2τ_2(T)=T dT without division by 2.
- For ℓ≠p, Bézout for p and ℓ makes the two equations determine θ_pV_ℓ uniquely.
- At m=1 there is no prime step and F_1=id.

### 7.6 differential Ghost

Construct `QWitt.differentialGhost`. Construct DGA maps gh_{m/d}:Q_mΩ*_{R/A}→Ω*_{R/A}⊗_{A,ψ_d}A[ζ_d]. On a form x₀dx₁⋯dx_k use the corresponding degree-zero ghost and its de Rham differential. In degree i the ghost of V_n has coefficient n^(i+1) on the components whose index divides the smaller level and is zero elsewhere. A any Λ-ring; R any A-algebra; d|m; i≥0. (wagner line 2011, §3.15, lines 2011–2041).

The public laws are `QWitt.differentialGhost_d`: Ghosts commute with differential and multiplication; `QWitt.differentialGhost_F`: For n=m/d and e|d, n^i gh_{d/e}(F_nω)=gh_{m/e}(ω) for a degree-i form ω; `QWitt.differentialGhost_natural`: Ghosts commute with A-algebra maps and Λ-base change.

*Proof route.* Give the product of twisted de Rham algebras the q-V system whose degree-i V acts as n^(i+1) on surviving components; apply initiality 7.2. Compatibility with F follows from 7.5 and its Teichmüller and V generators.

*Needs:* Layer 7.5 `QWitt.frobeniusDifferential`; Layer 4.4 `QWitt.relativeGhost`.

This interface is used by Layer 7.7 `QWitt.differential_baseChange`.

**Checks.**

- At m=2, the degree-one d=1 component of V_2(dT) is 4dT, not 2dT.
- At m=1 the differential ghost is identity on Ω*_{R/A}.
- In degree zero it is 4.4 with coefficient n rather than n^(i+1) for an unspecified i.

### 7.7 differential base Change

Prove `QWitt.differential_baseChange`. For a Λ-map A→A′, Q_mΩ*_{R/A}⊗_A A′ ≅ Q_mΩ*_{R⊗_A A′/A′}. If R→R′ is étale over A, Q_m(R′/A)⊗_{Q_m(R/A)}Q_mΩ*_{R/A} ≅ Q_mΩ*_{R′/A}, with the unique DGA differential extending that on Q_mΩ*. Both comparisons preserve F,V,τ and ghosts. A,A′ any Λ-rings; R any A-algebra; m>0. Étaleness is required in the second assertion only. (wagner line 2044, Lemma 3.16 and Proposition 3.31, Lemma 3.32, lines 2044–2050 and 2552–2595).

The public laws are `QWitt.differential_etaleDescent`: The degreewise functors on affine étale algebras satisfy faithfully flat étale descent; `QWitt.differential_etaleDifferential`: For a nonnegative DGA P and an étale map P⁰→S, the graded scalar extension S⊗_{P⁰}P admits exactly one extending differential.

*Proof route.* Λ-base change follows from initiality and 4.5. For étale scalar extension use Ω*_{S/A[q]}⊗_{Ω*_{P⁰/A[q]}}P to define the differential. Transfer F and V using 5.1 and verify the Teichmüller and FdV identities by uniqueness of étale derivations. Module descent gives the degreewise sheaf property.

*Needs:* Layer 7.6 `QWitt.differentialGhost`; Layer 5.1 `QWitt.etale`; `gap:ordinary-derham`.

**Checks.**

- A′=A and R′=R give identity isomorphisms.
- At m=1 both results are ordinary de Rham base change.
- The differential on S⊗P is not generally s⊗ω↦s⊗dω: étale elements s can have nonzero differentials over A[q].

### Examples

Frobenius is a graded algebra map. Its differential relation has a factor n, visible on dτ_2(T) already over ℤ[T]. The checks above specify the evaluated values and the negative controls.

### Dependencies

Layer 4.3 `QWitt.relative`; DGAInfinity Layer 0; DGAInfinity Layer 1; `gap:ordinary-derham`; Layer 3.4 `QWitt.absolute_verschiebungResolution`; Layer 5.4 `QWitt.finiteType`; DerivedModuleAlgebra §1.3; `gap:cyclotomic-contract`; Layer 1.8 `QWitt.arithmeticFracture`; Layer 4.4 `QWitt.relativeGhost`; Layer 5.1 `QWitt.etale`.

## Layer 8: Complete framed difference calculus

### 8.2 framed Gamma

Construct `QWitt.framedGamma`. For an étale framing □:A[T₁,…,T_r]→R over any commutative A, on R[[h]] with q=1+h construct unique continuous A[[h]]-algebra automorphisms γ_i congruent to id modulo h and extending T_j↦q^(δ_ij)T_j. They commute and γ_i−id has image in hT_i R[[h]]. Multiplication by hT_i is injective, so the quotient below is uniquely defined. r≥0; A any commutative unital ring, without a Λ-structure requirement; R étale over the displayed polynomial algebra. (wagner line 2830, §4.7, lines 2830–2848; pridham Definition 1.22, pridham line 371; scholze §3, scholze line 319).

The public laws are `framedGamma_coordinate`: γ_i(T_j)=q^(δ_ij)T_j and γ_i(a)=a; `framedGamma_inverse`: The inverse extends T_i↦q⁻¹T_i; q=1+h is a unit in A[[h]]; `framedGamma_natural`: Framing-compatible étale maps commute with γ_i; `framedGamma_unique`: Reduction id and the coordinate formula determine γ_i.

*Proof route.* Lift the coordinate automorphism successively through R[h]/h^n by formal étaleness; lift the inverse too. Uniqueness proves commuting and naturality. Lift against the quotient by hT_i to prove divisibility. T_i is regular on A[T] and remains so by flatness of the framing; h is regular on power series, even when A has zero divisors.

*Needs:* Layer 1.7 `CommutingEndomorphisms.koszulComplex`; SchemeAndStackFoundations §4.1; Mathlib `PowerSeries`.

This interface is used by Layer 8.3 `QWitt.framedJacksonDerivative`.

**Checks.**

- For A[T], γ(T²)=q²T²=(1+2h+h²)T².
- With no variables, R/A is étale and there are no γ_i; constants are fixed.
- The polynomial ring A[T,q] does not make q invertible; the same coordinate map there need not be an automorphism. Completion is essential.

### 8.3 framed Jackson Derivative

Construct `QWitt.framedJacksonDerivative`. Under 8.2 define the continuous A[[h]]-linear operator D_i by hT_i D_i(f)=γ_i(f)−f. These operators commute, satisfy D_i(fg)=fD_i(g)+γ_i(g)D_i(f), and D_i(T_i^n)=[n]_q T_i^(n−1) for n≥1, D_i(T_j)=0 for j≠i. Reduction modulo h is the coordinate derivation ∂/∂T_i on R. The framing and regularity assumptions of 8.2; n≥1. (wagner line 2842, §§4.7–4.8, lines 2842–2872; scholze §3, scholze lines 291–304).

The public laws are `framedJacksonDerivative_unique`: The equation hT_iD_i=γ_i−id uniquely determines D_i; `framedJacksonDerivative_zero_one`: D_i(0)=D_i(1)=0; D_i(T_i)=1; `framedJacksonDerivative_commute`: D_iD_j=D_jD_i and D_iγ_j=γ_jD_i for i≠j; `framedJacksonDerivative_map`: Framing-compatible maps intertwine D_i.

*Proof route.* The divisibility and regularity in 8.2 permit unique cancellation. Expand γ_i(fg)−fg for the twisted product rule, use coordinate evaluation and finite geometric sums for monomials, and formal étaleness for the specialization and commutation identities.

*Needs:* Layer 8.2 `QWitt.framedGamma`.

This interface is used by Layer 8.4 `QWitt.framedDifferenceComplex`.

**Checks.**

- D(T²)=(1+q)T and D(T³)=(1+q+q²)T²; an ordinary derivative would give 2T and 3T².
- D(1)=0; no formula with T^(−1) is used for n=0.
- At q=1 in characteristic 2, D(T²)=0; the integral formula remains valid and does not divide by 2.

### 8.4 framed Difference Complex

Construct `QWitt.framedDifferenceComplex`. For the framing in 8.2 form C□=K(R[[h]];D_i) and H□=K(R[[h]];hD_i), with terms Ω^k_{R/A}[[h]] via the coordinate basis. Equip both with the ordered-wedge product (f dT_I)(g dT_J)=f γ_I(g) dT_I∧dT_J. This is associative, strictly alternating on coordinate one-forms and obeys the DG Leibniz rule. Modulo h, C□ is the de Rham complex; H□ is Ω*_{R/A} with zero differential. A any commutative ring; finite étale framing as in 8.2; all complexes are nonnegative cochain complexes. (wagner line 2849, §§4.7–4.8, lines 2849–2872; pridham Definition 1.22, pridham line 371).

The public laws are `framedDifferenceComplex_d`: d_C(f)=∑D_i(f)dT_i and d_H(f)=h∑D_i(f)dT_i; `framedDifferenceComplex_wedge`: dT_i f=γ_i(f)dT_i, and dT_i dT_j=−dT_j dT_i; `framedDifferenceComplex_map`: Framing-compatible étale maps induce continuous DGA maps; `framedDifferenceComplex_scalar`: On constants and coordinate basis, the terms agree with completed Kähler exterior powers.

*Proof route.* Use 1.7 and the commuting derivatives. The skew coefficient rule and commuting γ_i prove associativity; 8.3 proves Leibniz. Finite free coordinate differential modules identify the terms and their h-specializations. The framed DGA is associative, not a commutative DGA.

*Needs:* Layer 8.3 `QWitt.framedJacksonDerivative`; Layer 1.7 `CommutingEndomorphisms.koszulComplex`; `gap:ordinary-derham`.

This interface is used by Layer 8.5 `QWitt.framedFrobenius`, Layer 9.4 `QWitt.framedBockstein`.

**Checks.**

- d_C(T²)=(1+q)T dT and d_H(T²)=(q²−1)T dT.
- For r=0 both complexes are R[[h]] in degree zero.
- In one variable, dT·T=qT dT while T·dT=T dT; ordinary graded commutativity before q=1 fails.

### 8.5 framed Frobenius

Construct `QWitt.framedFrobenius`. If A is perfectly covered and R has the finite étale framing □, for every prime p construct the unique continuous ψ_p-semilinear Frobenius lift φ□ on R̂_p with T_i↦T_i^p. Extend it to R̂_p[[h]] by q↦q^p. On H□ completed degreewise at p it gives a semilinear DGA map with φ□(dT_i)=T_i^(p−1)dT_i, commuting with each γ_i. On C□ the corresponding chain map instead sends dT_i↦[p]_q T_i^(p−1)dT_i. A perfectly covered; R étale over A[T₁,…,T_r]; p prime. Completion is (p,h); all relevant coefficient rings are discrete. (wagner line 2882, §4.9, lines 2882–2891; §4.28, lines 3292–3332; §4.31, lines 3452–3458; pridham Lemma 2.9, pridham line 635).

The public laws are `framedFrobenius_unique`: Reduction modulo p is absolute Frobenius, and the base and coordinate formulas determine the lift; `framedFrobenius_chain`: φ□(hD_i f)T_i^(p−1)=hD_i(φ□f); φ□(h)=q^p−1; `framedFrobenius_natural`: Framing-compatible étale maps commute with φ□; `framedFrobenius_injective`: The coefficient lift on R̂_p is injective: R/p is reduced, and R̂_p is p-torsion-free and separated.

*Proof route.* Apply formal étaleness over the p-completed polynomial base to lift its coordinate Frobenius. Reducedness of A/p descends from A^perf/p and gives injectivity. Extend continuously by q↦q^p; check γ-commutation on coordinates and by unique étale lifting. The displayed equation proves the chain relation without making the smooth relative Frobenius an equivalence.

*Needs:* Layer 8.4 `QWitt.framedDifferenceComplex`; SchemeAndStackFoundations §4.1; Layer 2.4 `ArithmeticLambdaRing.IsPerfectlyCovered`.

This interface is used by Layer 9.2 `QWitt.framedFrobeniusDecomposition`.

**Checks.**

- At p=2, φ□(h)=2h+h² and φ□(dT)=T dT; both paths on d_H(T) give (q²−1)T dT.
- On C□ at p=2 the factor 1+q is necessary: d_C(T²)=(1+q)T dT.
- For r=0 the coefficient lift agrees with 6.1, but its extension on series still sends q to q^p.

### Examples

For T² the Jackson derivative is (1+q)T; the scaled differential is (q²−1)T dT. At q=1 the two complexes have different differentials. The checks above specify the evaluated values and the negative controls.

### Dependencies

Layer 1.7 `CommutingEndomorphisms.koszulComplex`; SchemeAndStackFoundations §4.1; Mathlib `PowerSeries`; `gap:ordinary-derham`; Layer 2.4 `ArithmeticLambdaRing.IsPerfectlyCovered`.

## Layer 9: Algebraic support for the smooth torsion induction

### 9.2 framed Frobenius Decomposition

Construct `QWitt.framedFrobeniusDecomposition`. Under 8.5 and for α≥0 put B_α=(φ□^α(R̂_p)⊗_{ψ_p^α(Â_p)}Â_p)^∧_p. Its map to R̂_p is injective and R̂_p is free over B_α with basis T^v, 0≤v_i<p^α. After adjoining h, the p-completed H□ decomposes as a finite direct sum by v, with degree-k basis T^v times the wedges of T_j^(−1)dT_j, interpreted as T_j^(p^α−1)dT_j when v_j=0. After reduction q^(p^α)−1, the v-summand is a tensor product of two-term factors with differential q^(v_i)−1 (zero for v_i=0). A perfectly covered; finite étale framing; p prime; α≥0; inverse powers in the notation are replaced by the explicit nonnegative monomials. (wagner line 2892, §§4.10–4.12, lines 2892–2972).

The public laws are `framedFrobeniusDecomposition_basis`: There are p^(αr) basis vectors and the expansion in them is unique; `framedFrobeniusDecomposition_d`: On the v_i factor, hD_i sends T_i^(v_i) to (q^(v_i)−1)T_i^(v_i−1)dT_i; `framedFrobeniusDecomposition_zero`: The zero exponent in the one-form basis means T_i^(p^α−1)dT_i, not T_i⁻¹dT_i.

*Proof route.* Reduce the framed Frobenius square modulo p and use étale relative Frobenius to transport the polynomial monomial basis; complete flatness lifts it to R̂_p. Expand the exterior basis and calculate hD_i on monomials. Before the cyclotomic quotient the v=0 summand has coefficient differential on B_α; the two-term scalar description is asserted only after reduction.

*Needs:* Layer 8.5 `QWitt.framedFrobenius`; SchemeAndStackFoundations §0.29; DerivedModuleAlgebra §1.7.

This interface is used by Layer 9.3 `QWitt.framedTwoTermCohomology`.

**Checks.**

- For r=1,p=2,α=1, the ring basis is 1,T; the one-form basis is T dT,dT, respectively.
- For r=0 there is exactly one summand, in degree zero; no minimum over an empty index set is taken.
- For α=0 there is one ring basis vector and the one-form basis is dT_i.

### 9.3 framed Two Term Cohomology

Prove `QWitt.framedTwoTermCohomology`. Let S_α=ℤ_p[[h]]/(q^(p^α)−1), q=1+h. For 0≤e≤α, let K_{α,e} be S_α→S_α in degrees 0,1 with differential q^(p^e)−1. Its H⁰ is [p^(α−e)]_{q^(p^e)}S_α≅ℤ_p[[h]]/(q^(p^e)−1), and H¹ is that same quotient. If e₁≥e₂, the ordinary tensor complex K_{α,e₁}⊗_{S_α}K_{α,e₂} is K_{α,e₂}⊕K_{α,e₂}[−1]. Thus every summand of 9.2 has p-torsion-free cohomology, and so does H*(H□^∧_p/(q^(p^α)−1)). p prime; α≥0; 0≤e_i≤α; H□ has the hypotheses of 9.2; rank zero handled separately. (wagner line 2950, Lemmas 4.13–4.14 and Corollary 4.15, lines 2950–3012).

The public laws are `framedTwoTermCohomology_unit`: For v=p^e u, p∤u, [u]_{q^(p^e)} is a unit; the differential q^v−1 is unit-equivalent to q^(p^e)−1; `framedTwoTermCohomology_tensor`: The two-factor isomorphism uses the polynomial quotient (q^(p^e₁)−1)/(q^(p^e₂)−1); no division by zero in S_α is used.

*Proof route.* Compute kernel and cokernel by polynomial divisibility in the torsion-free power-series coefficient ring. Triangularly change the two degree-one basis vectors using the integral polynomial quotient to split the tensor. Repeated splitting and p-completely flat extension to B_α give the cohomology formula without imposing a perfect field base.

*Needs:* Layer 9.2 `QWitt.framedFrobeniusDecomposition`; `gap:cyclotomic-contract`.

**Checks.**

- For p=2,α=1,e=0, S_α=ℤ₂[[h]]/(h(h+2)); H⁰=(h+2)S_α and H¹=S_α/(h) are both ℤ₂.
- For e=α the differential is zero, H⁰=H¹=S_α, including α=0.
- The tensor is ordinary over S_α. Derived tensor over ℤ_p[[h]] would introduce extra Tor and is not the displayed two-term decomposition.

### 9.4 framed Bockstein

Construct `QWitt.framedBockstein`. For a perfectly covered Λ-ring A and finite étale framing □ of R/A, put f_m=q^m−1 and E_m=H*(H□/f_m). Since f_m is injective in every term of H□, specialize the generic DGA Bockstein to β_m:E_m^i→E_m^(i+1), with β_m([x])=[d_H(x)/f_m]. It is independent of the cycle lift, squares to zero and is a degree-one derivation. For d|m the reduction F and multiplication V=[m/d]_{q^d} satisfy Fβ_mV=β_d. A perfectly covered; R has a specified finite étale framing; m,d>0 and d divides m. (wagner line 3026, §4.16 and §4.23, lines 3026–3032 and 3178–3194).

The public laws are `framedBockstein_lift`: If d_H(x)=f_m y, then β_m([x])=[y]; `framedBockstein_natural`: Framing-compatible étale maps commute with β_m; `framedBockstein_sign`: At m=1, β_1(T_i)=dT_i, fixing the plus connecting-map sign.

*Proof route.* Perfect coverage makes R integer torsion-free; the first h-coefficient of f_m is m, so f_m acts injectively on R[[h]] and all finite free differential terms. Apply the generic Bockstein supplier to H□ and f_m. Its cycle-lift equation fixes the sign, and its change-of-parameter identity for f_d dividing f_m gives Fβ_mV=β_d. This specializes the generic theorem rather than constructing a second DGA Bockstein theory.

*Needs:* Layer 8.4 `QWitt.framedDifferenceComplex`; DGAInfinity Layer 1; EnhancedDerivedSheaves §0.3; `gap:dga-bockstein`.

This interface is used by Layer 9.5 `QWitt.framedCohomologySystem`.

**Checks.**

- For the one-variable frame, d_H(T)=h dT and β_1(T)=dT.
- For a zero-variable frame H□ is concentrated in degree zero and β_m=0.
- β_1 is the ordinary de Rham differential, even though the differential on H□/h is zero; confusing them would give β_1(T)=0.

### 9.5 framed Cohomology System

Prove `QWitt.framedCohomologySystem`. For A perfectly covered and a finite étale framing □, put E_m=H*(H□/(q^m−1)) with β_m from 9.4. Then E_m is ℤ-torsion-free, strictly alternating and graded commutative. Give it its canonical Q_m(R/A)→E_m⁰ map, F_{m/d} induced by quotient reduction and V_{m/d} induced by multiplication [m/d]_{q^d}. This is a differential q-FV system. Its canonical Q_mΩ*→E_m map is induced by initiality. A perfectly covered; R has a specified finite étale framing; m>0; all quotients are degreewise ordinary since q^m−1 is regular on the terms. (wagner line 3022, §§4.16–4.26, lines 3022–3277).

The public laws are `framedCohomologySystem_degreeZero`: For polynomial R the degree-zero map is c_{m/A}; for framed R it is its arithmetic fracture extension using coordinate lifts on p-completions; `framedCohomologySystem_modOne`: At m=1 the Bockstein DGA is Ω*_{R/A}; `framedCohomologySystem_FV`: FβV=β, FV=m/d and VF=[m/d]_{q^d}; the Teichmüller relation holds by torsion-freeness.

*Proof route.* Construct the degree-zero map by the finite arithmetic fracture square, using the polynomial comparison and the framed p-adic lifts on each completed factor. Lemma 4.25 is the cohomology/completion supplier gap. Reduce ℤ-torsion-freeness to 9.3 by finite-type and flat étale base change; commutativity follows because γ_i−id vanishes on cocycles modulo q^m−1. Torsion-freeness forces odd squares to zero, including at 2, and proves the Teichmüller relation. All constructions remain dependent on the specified frame.

*Needs:* Layer 1.8 `QWitt.arithmeticFracture`; Layer 9.3 `QWitt.framedTwoTermCohomology`; Layer 9.4 `QWitt.framedBockstein`; Layer 5.4 `QWitt.finiteType`; Layer 7.7 `QWitt.differential_baseChange`; `gap:cohomology-completion`.

**Checks.**

- For m=1, β_1(T_i)=dT_i, although the differential of H□/h is zero.
- In E_m the skew multiplication becomes graded commutative only on cohomology; this does not turn H□ itself into a commutative DGA.
- For zero variables E_m=R[[h]]/(q^m−1) in degree zero and β_m=0.

### 9.6 prime Power Smooth Induction

Prove `QWitt.primePowerSmoothInduction`. For a perfectly covered A and every prime p, establish simultaneously for all α≥0: (a) Q_{p^α}Ω*_{R/A} is degreewise p-torsion-free for smooth R/A; (b) for framed R the canonical map (Q_{p^α}Ω*)^∧_p→H*(H□^∧_p/(q^(p^α)−1)), with Bockstein differential, is an isomorphism; (c) for framed R there is an explicit quasi-isomorphism (Ω*_{R/A}⊗_{A,ψ_{p^α}}A[q]/(q^(p^α)−1))^∧_p→(Q_{p^α}Ω*)^∧_p induced in degree zero by s_{p^α/A} of the coordinate Frobenius lift; (d) for polynomial R and dξ≡0 mod p at level p^α, ξ=F_p(ω)+pη for some ω at level p^(α+1) and η at level p^α, in the same form degree. A perfectly covered; p any prime including 2; α≥0; R smooth, framed or polynomial as specified separately in (a)–(d). Statement (c) is an equivalence of complexes, not a degreewise isomorphism. (wagner line 2703, §4.3, lines 2703–2720; Lemma 4.5, lines 2756–2808; §§4.29–4.33 and §4.4 proof, lines 3341–3608).

The public laws are `QWitt.primePowerGhostQuotient`: Q_{p^α}Ω*/(im V_p+im dV_p) ≅ Ω*_{R/A}⊗_{A,ψ_{p^α}}A[ζ_{p^α}] for α≥1; `QWitt.primePowerSmoothInduction_step`: The induction proceeds (d at α−1)⇒(a at α)⇒(b at α)⇒(c at α)⇒(d at α); `QWitt.primePowerSmoothInduction_base`: At α=0 use Ω*_{R/A}, the h-Bockstein identity and the polynomial Cartier cycle decomposition; the α=−1 premise is empty.

*Proof route.* Treat (a)–(d) as one simultaneous induction, not four circular prerequisites. For (a), use the first-ghost quotient and (d at α−1) to kill a putative p-torsion form; extend from polynomial to smooth by 7.7. For (b), compare the short exact sequences with kernel im V_p+im dV_p using 9.3 and the zero-index Frobenius summand. For (c), use the prismatic Frobenius/décalage comparison gap with the explicit C□ map in 8.5, then identify it through (b). For (d), decompose polynomial de Rham cycles modulo p into Cartier monomials and exact forms; Teichmüller identities and FdV=d lift both. No global functorial de Rham comparison is needed for this induction.

*Needs:* Layer 9.5 `QWitt.framedCohomologySystem`; Layer 7.7 `QWitt.differential_baseChange`; `gap:prismatic-frobenius`; `gap:ordinary-derham`.

**Checks.**

- At α=0, Q_1Ω*=Ω*, and the framed cohomology comparison is β_h=d.
- For R=A[T], p=2, the cycle T dT modulo 2 lifts under F_2 to dτ_2(T).
- The quotient by im V_p alone in positive degrees is insufficient; dV_p must also be killed.

### Examples

Local framed cohomology is used only as an algebraic tool. Filtered q-Hodge descent and geometric comparisons remain with consumers. The checks above specify the evaluated values and the negative controls.

### Dependencies

Layer 8.5 `QWitt.framedFrobenius`; SchemeAndStackFoundations §0.29; DerivedModuleAlgebra §1.7; `gap:cyclotomic-contract`; Layer 8.4 `QWitt.framedDifferenceComplex`; DGAInfinity Layer 1; EnhancedDerivedSheaves §0.3; `gap:dga-bockstein`; Layer 1.8 `QWitt.arithmeticFracture`; Layer 5.4 `QWitt.finiteType`; Layer 7.7 `QWitt.differential_baseChange`; `gap:cohomology-completion`; `gap:prismatic-frobenius`; `gap:ordinary-derham`.

## Layer 10: Smooth q-Witt torsion and completion exports

### 10.1 smooth integer Torsion Free

Prove `QWitt.smooth_integerTorsionFree`. If A is perfectly covered and R is smooth over A, Q_mΩ*_{R/A} is degreewise ℤ-torsion-free for every m>0. Consequently every positive-degree V_n is injective and the initial q-V system is also initial among degreewise ℤ-torsion-free q-V systems. A perfectly covered; R smooth over A; m>0; no Noetherian assumption on A. (wagner line 2690, Proposition 4.1, line 2690 and proof, lines 3613–3643).

The public laws are `QWitt.smooth_verschiebung_injective`: F_nV_n=n and integer torsion-freeness imply V_n injective; `QWitt.smooth_torsionFreeInitial`: The initial map into every torsion-free q-V system is still unique.

*Proof route.* Work étale locally on a smooth algebra, reduce polynomial bases to ℤ by flat Λ-base change, and use finite generation over the Noetherian Q-ring from 5.4. Detect p-torsion after localization at p, the (p,q^(m/ℓ)−1)-completions for ℓ≠p and their complementary localization. F_ℓ and V_ℓ remove prime-to-p factors on the completed pieces; the remaining localization is a flat base change of the p-power case 9.6. This covers every p and m.

*Needs:* Layer 9.6 `QWitt.primePowerSmoothInduction`; Layer 7.7 `QWitt.differential_baseChange`; Layer 5.4 `QWitt.finiteType`; `gap:cyclotomic-contract`.

**Checks.**

- For R=A, all positive degrees vanish.
- For m=1 it is torsion-freeness of the exterior powers of the smooth differential module over the torsion-free ring R.
- For R=ℤ[x]/(x²), Ω¹ has the nonzero 2-torsion class x dx; smoothness cannot be omitted even at m=1.

### 10.2 smooth bounded Difference Torsion

Prove `QWitt.smooth_boundedDifferenceTorsion`. For perfectly covered A, smooth R/A, m>0 and every degree i≥0, Q_mΩ^i_{R/A} has bounded (q−1)-power torsion. Its degreewise ordinary (q−1)-completion is canonically its derived completion. Both comparisons are natural and compatible with F,V,ghosts and Λ-base change in the appropriate completed sense. A perfectly covered; R smooth over A; m>0; the torsion bound is for a fixed degree and index, not a global uniform bound. (wagner line 2810, Lemma 4.6, lines 2810–2822).

The public laws are `QWitt.smooth_degreewiseCompletion`: The completed degree-i module is discrete and computes LΛ_(q−1) of that module; `QWitt.smooth_completion_complex`: For the bounded smooth de Rham degrees of a fixed smooth R, degreewise completion represents derived completion of the complex.

*Proof route.* For ℤ-polynomial R use the surjection from the de Rham algebra and 5.4 to get finite generation in each degree, hence bounded torsion. Flat Λ-base change transfers the same bound to a polynomial ring over A. Étale base change and a finite affine cover of a smooth affine algebra transfer a common finite bound. The principal bounded-torsion completion contract identifies ordinary and derived completions.

*Needs:* Layer 10.1 `QWitt.smooth_integerTorsionFree`; Layer 5.4 `QWitt.finiteType`; Layer 7.7 `QWitt.differential_baseChange`; DerivedModuleAlgebra §1.5.

**Checks.**

- For m=1, q−1=0 on Q_1Ω^i and its torsion has bound 1; completion is the identity.
- For R=A,m=2, (q−1)(q+1)=0 in A[q]/(q²−1); nonzero (q−1)-torsion is compatible with integer torsion-freeness.
- For polynomial R over ℤ, finite generation over a Noetherian Q-ring bounds the torsion; flat Λ-base change preserves that bound.

### Examples

Every positive index and prime is covered. The auxiliary comparisons retain their frame, while the torsion conclusions do not. The checks above specify the evaluated values and the negative controls.

### Dependencies

Layer 9.6 `QWitt.primePowerSmoothInduction`; Layer 7.7 `QWitt.differential_baseChange`; Layer 5.4 `QWitt.finiteType`; `gap:cyclotomic-contract`; DerivedModuleAlgebra §1.5.

## Downstream consumers

- **HabiroCohomologyFoundations**: Layers 2–6 supply relative arithmetic Λ and degree-zero q-Witt theory, especially the completed overlap in Layer 6 for the filed §0.3 interface; Layers 7–10 supply the shared positive-degree operators, complete framed calculus and smooth completion. Consumer text is absent, so §0.3 is an input label, not a verified section contract.
- **HabiroRings**: Layers 1–6: arithmetic Λ-perfection and perfect coverage, relative degree zero, ghosts, base change and q-fixed completed Frobenius overlap. Habiro rings and cyclotomic gluing stay there.
- **RefinedTraceMethods**: Layers 7–10 provide the q-Witt operations and framed difference algebra needed for trace/cohomology comparisons; no trace invariant is constructed here.
- **HabiroCohomologyFoundationsPartII**: Imports the same named algebraic interfaces for its extended cohomology constructions; no reverse dependency.

Consumers import these interfaces without becoming suppliers. QWittVectors follows its last earlier supplier in the merge order and precedes every Habiro or trace consumer.

## References

- **pridham**: J. P. Pridham, *On q-de Rham cohomology via Λ-rings* (2016), [arXiv v4](https://arxiv.org/abs/1608.07142v4). Definition 1.22 (line 371); Definition 2.1 (line 506); Lemma 2.9 (line 635), arXiv v4.
- **wagner**: Ferdinand Wagner, *q-Witt vectors and q-Hodge complexes* (2024), [arXiv v5](https://arxiv.org/abs/2410.23078v5). Sections 2.1–2.6 and 3.1–3.4; Proposition 4.1; Lemma 4.6; Sections 4.7–4.32; Theorem 4.27 and its simultaneous induction proof (v5 lines 305, 475, 1194, 1504, 1621, 1651, 1822, 1956, 2053, 2552, 2690, 2810, 2830, 2950, 3022, 3198, 3292, 3341, 3459, 3584, 3613).
- **scholze**: Peter Scholze, *Canonical q-deformations in arithmetic geometry* (2016), [arXiv v1](https://arxiv.org/abs/1606.01796v1). Section 3, v1 pp. 6–7, lines 296–340 (framed construction; Conjecture 3.1 remains distinguished).
- **bhatt-scholze**: Bhargav Bhatt, Peter Scholze, *Prisms and Prismatic Cohomology* (2019), [arXiv v4](https://arxiv.org/abs/1905.08229v4). Lemma 2.28 (v4 p. 20, line 778); Theorem 15.3 (line 3898); Construction 16.19 and Theorem 16.22 (v4 pp. 114–115, lines 4316 and 4378).
- **wagner-habiro**: Ferdinand Wagner, *q-Hodge complexes over the Habiro ring* (2025), [arXiv v2](https://arxiv.org/abs/2510.04782v2). Section 1.22(e), v2 p. 12, line 493; Section 2.7, pp. 15–16, lines 647–658; proof of Theorem 2.9, pp. 16–17, lines 679–723, with standing etale hypothesis from Section 2.2.
- **hesselholt**: Lars Hesselholt, *The big de Rham-Witt complex* (2010), [arXiv v3](https://arxiv.org/abs/1006.3125v3). Section 1: Lemma 1.1 (line 223); Proposition 1.2; Lemmas 1.3–1.5 and 1.9; Proposition 1.19; Definitions 1.21 and 1.23; Lemma 1.24; Theorem 1.25 (v3 lines 268, 301, 315, 354, 711, 753, 787, 798, 811).
- **borger**: James Borger, *The basic geometry of Witt vectors, I: The affine case* (2008), [arXiv v6](https://arxiv.org/abs/0801.1691v6). Sections 1.16–1.18 (v6 pp. 12–13, lines 603–638); Corollary 5.4 (p. 26, line 1323); Theorem 9.2 (p. 39, line 1995); Corollary 9.4 (p. 40, line 2095).
- **langer-zink**: Andreas Langer, Thomas Zink, *De Rham-Witt cohomology for a proper and smooth morphism* (2003), [July 2003 author-hosted preprint; Proposition 1.3, lines 453–525; Lemma 1.5, lines 601–645 numbering checked](https://www.math.uni-bielefeld.de/~zink/dRW.pdf). Proposition 1.3 and Lemma 1.5.

All locators use the stated arXiv version and the numbered source extraction; printed pagination and extraction page markers are not interchangeable. The source manifest is `packages/QWittVectors/sources.toml`.
