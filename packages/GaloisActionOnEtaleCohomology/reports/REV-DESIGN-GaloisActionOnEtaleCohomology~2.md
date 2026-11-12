# Review of GaloisActionOnEtaleCohomology (design, round 2)

**Verdict:** needs changes

Eight findings: one P1, three P2 and four P3. The seven findings of the preceding review are repaired. The new blocking findings concern rationalisation topology, derived tensor products, disconnected étale neighbourhoods and inseparable quadratic extensions. They are repairable within this roadmap's scope. No change to the design, plan or sources manifest was made during this review.

## Previous findings, checked first

Locations in this table are in `packages/GaloisActionOnEtaleCohomology/design/README.md`; the corresponding statements and tests in `design/plan.json` were also read.

| Previous finding | Status and repaired passage | Verification |
| --- | --- | --- |
| F01 | Repaired, §3.1, line 374: “strictly finer than the product topology” and “not compact” | For the limit of the discrete groups ∏ₘ ℤ/ℓⁿ, the open kernels are ℓⁿ∏ₘ ℤ_ℓ. Every product neighbourhood leaves some coordinate unrestricted and contains a unit vector outside ℓ∏ₘ ℤ_ℓ. The quotient ∏ₘ 𝔽_ℓ is infinite discrete. This is distinct from the product-topology counterexample in R01. |
| F02 | Repaired, §1.1, line 187: “sends `δ_1` to `δ_{rs}`” | Over ℚ₂, T³−2 is Eisenstein and adjoining ζ₃ adds the unramified quadratic extension, giving a splitting field of degree 6. With s=(12), r=(123), rs=(13), sr=(23); the two indicator vectors differ. |
| F03 | Repaired, §1.3, line 224: “the isomorphism is `ρ(τ⁻¹) = ρ(τ)⁻¹`” | The map is (τ⁻¹)ₓ. Its pullback gives ρ(τ)⁻¹ρ(τστ⁻¹)ρ(τ)=ρ(σ). Taking σ=s, τ=r in S₃ separates this from the incorrect conjugation by τ². |
| F04 | Repaired, Conventions line 51: “the letters `K`, `L` denote fields only” | All 20 targets and their 72 plan tests were reread. Complexes use M,N,W,P; §3.3 uses A and §4.3 uses H. No remaining field/complex collision was found. |
| F05 | Repaired, §4.2 and References: “page 128” and “page 150” | Berkovich printed pages 128,143,150 agree with the three cited results. The six corrected library locators, and the additional Sheaf.H lines 57 and 112, agree with the supplied pins. R05 below concerns other locators. |
| F06 | Repaired, Scope line 36: “which this roadmap does not supply”; §3.1: “Prove the following.” | Removed status/merge-process vocabulary has not reappeared elsewhere in the README. No local paths, pull-request numbers, HTML anchors or process instructions were found in its mathematical text. |
| F07 | Repaired, gap paragraph line 103: “§11.1 proves finiteness for qcqs spaces that are locally algebraically of finite type” | ClassicalAdicEtaleCohomology §11.1 at #875, README line 5686, includes the support condition. For Σ=X, B=𝔽_ℓ, proper X and ℓ invertible in 𝒪_C, the support condition holds and finite generation means cardinality ℓʳ. The remaining proper case is still the declared gap. |

None of these findings was marked not actionable in the repair report, and none is re-raised here. The changed passages were tested again rather than accepted on the strength of that report. The same patterns were searched throughout the design; the tensor and topology defects below survive those checks.

## R01 (P1) — An open integral image does not give the asserted rational topology

**Location.** `packages/GaloisActionOnEtaleCohomology/design/README.md:399`, §3.3; `design/plan.json`, target 3.3. The definition requires “the image of `A` is an open subgroup carrying its quotient topology”.

**Claim.** For a topological ℤ_ℓ-module with the continuous action in scope, that topology on A⊗ℚ_ℓ makes it a topological ℚ_ℓ-vector space.

**Witness.** A=∏ₘ ℤ_ℓ with product topology and trivial action is torsion-free. Multiplication by ℓ would make ℓA open in A. Every product neighbourhood contains some eₘ∉ℓA, so ℓA is not open.

This A is also an inverse limit of finite discrete, ℓⁿ-annihilated modules: take Aₙ=(ℤ/ℓⁿ)ⁿ with truncation and reduction. Thus inverse-limit continuity alone does not supply the missing property. The obstruction already concerns the fixed scalar ℓ⁻¹, before Galois continuity is considered. The corrected infinite-disjoint-union Check of §3.1 uses a different, strictly finer topology and does not cure this statement. `hansenzavyalov2023 line 1706` specifies algebraic localisation, not the proposed topology on arbitrary A.

**Exact repair.** Keep algebraic rationalisation for general A, but replace the open-image prescription by a specified continuous scalar-extension construction. For the linearly topologised modules here, one concrete choice is the final locally convex topology on V=A[1/ℓ]: writing j:A→V, take as zero-neighbourhoods the ℤ_ℓ-submodules L⊆V such that ⋃ₙ ℓ⁻ⁿL=V and j⁻¹(ℓʳL) is open in A for every r≥0. State and prove the topology, functoriality and joint action assertions for this construction; compactness of G_K allows invariant neighbourhoods by intersecting translates. Do not assert that j(A) is open in general. State the open-lattice and usual finite-dimensional Hausdorff topology conclusion under the finite-generation hypotheses supplied by §4.3. Update the matching plan target and add the product-topology counterexample as a negative Check.

**Repair tested.** In the counterexample j⁻¹(ℓA)=ℓA is not open, so A is excluded as a proposed open lattice; scalar multiplication no longer forces the contradiction. For A=ℤ_ℓ this prescription gives ℚ_ℓ with its usual topology; for A=𝔽_ℓ it gives the zero space. These preserve the existing positive Checks without discarding the general case.

## R02 (P2) — Cup products exceed the stated coefficient and derived-category scope

**Location.** `packages/GaloisActionOnEtaleCohomology/design/README.md:173`, lines 179,211,216; `design/plan.json`, targets 1.1 and 1.3. The inputs are “`Λ` a ring” and “`M, N ∈ D⁺(X_ét, Λ)`”.

**Claim.** These hypotheses support M⊗ᴸ_ΛN and the already-defined action on its cohomology for every pair of left-module complexes.

**Witness.** For Λ=M₂(𝔽₂), two left modules have no specified balanced tensor. For Λ=ℤ/4 and M=N=𝔽₂[0], Torₙ^Λ(M,N)=𝔽₂ for every n≥0, so M⊗ᴸ_ΛN is not bounded below.

The second computation follows by tensoring the periodic free resolution with differential multiplication by 2: all differentials become zero. The named supplier explicitly requires commutative coefficients and warns about boundedness: `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:457` on main. Its unbounded enhancement is available; the present §1.1 action is only stated on D⁺. For the first obstruction, declaring the left action to be a right action fails: with v=e₁, a=E₁₂ and b=E₂₁, (v·a)·b=0 whereas v·(ab)=e₁.

**Exact repair.** Retain the additive action and its naturality for arbitrary rings. Require Λ commutative in the tensor/cup-product clauses. Use the existing unbounded enhancement of EnhancedDerivedSheaves §§0.1–0.4 to state the action and cup-product equivariance on the actual tensor target; retain D⁺ as a specialization, with an explicit Tor-amplitude condition whenever its tensor target is asserted to lie in D⁺. Carry those qualifications through §1.3(d), the scope/conventions and plan. Do not rebuild the supplier's derived category or narrow all cohomology to flat coefficients.

**Repair tested.** The matrix-ring example remains valid for additive actions but is outside the commutative tensor clause. The ℤ/4 example has H⁻ⁿ=𝔽₂ in every n≥0 and is admitted in the unbounded target; it is not incorrectly assigned a D⁺ action. With M=Λ[0], the tensor is N, recovering the ordinary unit Check.

## R03 (P2) — A geometric-point neighbourhood need not be a field spectrum

**Location.** `packages/GaloisActionOnEtaleCohomology/design/README.md:151`, §0.3: “For an étale neighbourhood `(V, v̄)` … `V = Spa(L, 𝒪_L)` for a finite separable `L/K`”.

**Claim.** Every pointed étale neighbourhood has that form.

**Witness.** V=Spa(K,𝒪_K) ⊔ Spa(K,𝒪_K), pointed through its first component, is an étale neighbourhood. It has two components; Spa(L,𝒪_L) for a finite extension L/K has one.

**Exact repair.** Say that the connected finite-field neighbourhoods form a cofinal basis of the category of pointed étale neighbourhoods. Refine an arbitrary neighbourhood to the component through the chosen point before identifying it with Spa(L,𝒪_L). Keep the embedding action and the cofinality used in §2.3. Add the disconnected two-point neighbourhood as a Check and synchronize target 0.3 in the plan.

**Repair tested.** The first component is Spa(K,𝒪_K), maps to V and contains the chosen point. Thus cofinal refinement exists, while the false equality with all of V is no longer asserted. The stalk colimit in §2.3 is unchanged.

## R04 (P2) — The quadratic Check omits separability in characteristic two

**Location.** `packages/GaloisActionOnEtaleCohomology/design/README.md:155`; `design/plan.json`, target 0.3, quadratic test: “For `L = K(√a)` quadratic, `Hom_K(L, C)` has two elements”.

**Claim.** A quadratic extension in the standing arbitrary-characteristic scope has two embeddings, interchanged by G_K.

**Witness.** K=𝔽₂((t)), L=K(t¹ᐟ²): [L:K]=2, but T²−t has one root in C. Consequently #Hom_K(L,C)=1 and G_L=G_K, not an index-two subgroup.

**Exact repair.** Require the quadratic extension to be separable. Use K(√a) only in characteristic different from two; in characteristic two use the already-present Artin–Schreier example α²+α=t⁻¹. Add K(t¹ᐟ²)/K as a negative control with one embedding and trivial quotient action. Keep purely inseparable extensions in §1.3(e).

**Repair tested.** The Artin–Schreier roots are α and α+1 and its nontrivial automorphism swaps them; the purely inseparable example has only t¹ᐟ², fixed by every Galois automorphism. These also agree with §0.2's existing purely inseparable Check.

## R05 (P3) — Comparison and finiteness locators do not support their assigned claims

**Location.** `packages/GaloisActionOnEtaleCohomology/design/README.md:444`, line 457, References, the corresponding plan locators, and `sources.toml`'s huber1996 locator. The comparison cites “`huber1996, §3.8; milneLEC §21, page 130`”; finiteness cites “lines 1706–1709”.

**Claim.** Those passages provide the proper rigid comparison and the general finite-generation/topology argument respectively.

**Witness.** `milneLEC line 5007` compares complex varieties with complex manifolds. `hansenzavyalov2023 line 1706` gives localisation/limit identities, then a dimension bound. #875, `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:4076`, assigns proper comparison to Huber 3.7.2.

**Exact repair.** For §4.2 use Huber §3.7, Theorem 3.7.2, printed p.226, proof p.227, through the existing §8.2 supplier; correct the existing manifest locator and References accordingly. Remove Milne §21 as a rigid-comparison locator. Keep Berkovich 7.1.1, printed p.128, for the proper torsion comparison; describe 7.5.4, p.150, only as its constructible prime-to-characteristic comparison scope. Do not use that corollary to justify arbitrary torsion D⁺.

For §4.3, identify the argument as dévissage plus §3.1, the supplied Milnor/ML theorem, and the pinned `Module.Finite.of_quotient_smul_top` in `TauCeti/Topology/Algebra/Module/Nakayama.lean:164`. Add that native input to Exact supplier contracts and *Needs*. It assumes compact R and M, Hausdorff M, continuous module operations, a finitely generated ideal of topologically nilpotent elements, and finite generation of M/IM. Milne Theorem 19.2, printed p.125 (`milneLEC line 4860`), is a legitimate related finite-generation proof, with its flat-adic-sheaf hypotheses retained; Hansen–Zavyalov is only a reference for the displayed localisation identity and its own restricted setting.

**Repair tested.** In §4.3(b), H is an inverse limit of finite groups, hence compact Hausdorff; I=(ℓ) is generated by one topologically nilpotent element, and H/ℓH embeds in the finite degree-i mod-ℓ group. The pinned theorem applies directly. For §4.2, proper Y and arbitrary torsion satisfy the supplier's 3.7.2 statement, including residue-characteristic torsion in characteristic zero. Huber's text remains settled uncertified; this correction does not claim to have read it.

## R06 (P3) — A named supplier Check no longer exists on main

**Location.** `packages/GaloisActionOnEtaleCohomology/design/README.md:282`: “SchemeAndStackFoundations §2.15, `limits_test_separable_closure`”.

**Claim.** This is a named item in the consumed supplier.

**Witness.** Main `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4024` contains the mathematical Check without this name. Neither its main README nor Suggested.lean declares `limits_test_separable_closure`; older open revision #1807 retains it at README line 3768.

**Exact repair.** Cite SchemeAndStackFoundations §2.15's separably closed-field Check, or its `etale_galois_comparison`, without the obsolete backticked test identifier. Consume the roadmap on main, not the old revision merely because it retains the label.

**Repair tested.** For Spec(k^sep), the trivial Galois group gives H⁰=F and H^q=0 for q>0. This is exactly the unlabelled main Check, so no new prerequisite or supplier gap is needed. This is citation drift in a Check, not an unowned mathematical prerequisite.

## R07 (P3) — A non-Galois embedding representation is not regular

**Location.** `packages/GaloisActionOnEtaleCohomology/design/README.md:203`, lines 301 and 448; matching plan tests. The text calls ℤ[G_K/G_L] the “left regular representation” for every finite separable L/K.

**Claim.** The embedding permutation representation is regular without assuming L/K Galois.

**Witness.** For the non-Galois cubic ℚ₂(∛2)/ℚ₂, its splitting group S₃ permutes three embeddings. The module has rank 3 and a transposition has trace 1; the regular S₃-module has rank 6 and trace 0.

**Exact repair.** Use “permutation representation on Hom_K(L,C), equivalently the representation induced from the trivial representation of G_L”. Only in the Galois case call it the regular representation of Gal(L/K), inflated to G_K. Apply this wording to all three passages and the plan; retain the correctly qualified S₃ worked example at line 513.

**Repair tested.** The cubic gives the permutation character (3,1,0) on identity, transpositions and 3-cycles. The splitting field gives the regular character (6,0,0), exactly as the retained worked example states.

## R08 (P3) — The recorded baseline is not the supplied acceptance baseline

**Location.** `packages/GaloisActionOnEtaleCohomology/design/plan.json:7`, line 8, `baseline.mathlib` and `baseline.tauceti`.

**Claim.** The plan's baseline fields identify the libraries against which this design is to be assessed.

**Witness.** The plan records Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. The supplied `lake-manifest.json` records Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5.

**Exact repair.** Refresh the two plan baseline values to the supplied pins after applying the contract corrections. Do not modify the library manifest or toolchain. Keep historical baseline information, if needed, in the repair report rather than making it the acceptance baseline.

**Repair tested.** The actual pin contains the general `TauCeti.ContinuousRep` at `TauCeti/RepresentationTheory/Continuous/ContinuousRep.lean:82`, generic sheaf-cohomology pullback, and topological Nakayama. These were read at the manifest revisions, not inferred from the older plan metadata.

## Verified sound

### Coverage, principles and shape

The review read all five layers, all 20 targets, all 72 tests in the plan, all supplier contracts and every *Needs:* line. The seeded source sample has 15 targets; all were checked below. Every repaired passage was reconsidered, and the earlier review's conclusions were not used as a substitute for computed examples. The unchanged material without numerical or algebraic witnesses was reviewed anew.

The design develops a general field/site/cohomology interface, including arbitrary characteristic, inseparable extensions, residue-characteristic torsion where permitted, non-smooth proper cases through a declared contract, and both naive and derived limits. It is not a route-specific shortcut or a re-planning of an existing roadmap. It imports the scheme adic action from EtaleCohomologyFoundations §F.4.6 and proves its identification with this explicit action. No algorithm, copied source passage, executable certificate, sorry'd datum or set_option was found. No suspicious fetched instruction was followed.

The README has the required summary, scope, conventions, supplier contracts, reading guide, five numbered layers each ending in Examples and Dependencies, consumers, worked examples and references. Definitions have their API statements and at least three Checks; theorem-only §§2.2 and 2.4 need not have three definition Checks. The false or non-discriminating qualifications found are reported above. Mathematical formulas, rather than undeclared proposed Lean names, are used for this roadmap's constructions. Names in the plan are design labels, not a claim of declarations in a nonexistent Lean file. The three main roadmaps read for shape were SchemeAndStackFoundations, ProfiniteCohomology and EnhancedDerivedSheaves.

### Computed adversarial table

The table includes every target because there are only 20, as well as all seeded targets and all headline families. “Pass” refers to the tested assertion, not to an elaboration or an exemption for other hypotheses. Cohomology degrees are cohomological; torsion coefficients and twists obey the standing invertibility conditions.

| Statement | Instances tried | Values on the two sides / excluded wrong value | Result and change |
| --- | --- | --- | --- |
| §0.1 completed closure and density | K=𝔽_p((t)), aᵖ=t; K=ℚ_p; K already complete algebraically closed | For b_s a root of Tᵖ−sT−t with s≠0, (b_s−a)ᵖ=s b_s and bounded b_s give distance tending to 0 as s→0; these roots are separable. Over ℚ_p, norm(√p)=p⁻¹ᐟ², not 1. For algebraically closed complete K, C=K. | Density includes p=2,3; norm extension distinguishes the trivial norm. Pass. |
| §0.2 extension, uniqueness, joint continuity | √3 over ℚ₃; purely inseparable t¹ᐟp; identity | σ̂(√3)=−√3 versus identity's √3. Every σ̂ fixes t¹ᐟp. If σ fixes an algebraic approximation a to x, norm(σ̂y−x)≤max(norm(y−a),norm(x−a)); both terms <ε on a finite-extension stabiliser and a small ball. | Isometry, dense uniqueness and joint continuity hold with the stated nontrivial complete norm. Pass. |
| §0.3 geometric-point automorphisms and neighbourhoods | Cyclic cubic; disconnected two-point neighbourhood; inseparable quadratic | gτ₀ and g⁻¹τ₀ are distinct embeddings; Spa reverses multiplication. The disconnected neighbourhood has 2 components versus 1 for a field. The inseparable quadratic has 1 embedding versus the claimed 2. | Main automorphism convention passes; R03 and R04 repair the neighbourhood and Check. |
| §1.1 cover action, composition and tensor | S₃ with s=(12),r=(123); empty cover; Λ=ℤ/4,M=N=𝔽₂; matrix coefficients | (a∘b)^♮δ₁=δ_(13), while a^♮b^♮δ₁=δ_(23). Empty cohomology is 0 and its map is unique. Tensor H⁻ⁿ=𝔽₂ for all n≥0, not eventually 0. Matrix attempted right-action values are 0 and e₁. | Composition repair passes. R02 needed for cup scope. |
| §1.2 rigid action | μ₅ over ℚ₂; finite separable L; structure sheaf; empty X | Frobenius acts ζ↦ζ²; inverse convention ζ↦ζ³. Indicators satisfy ρ(σ)δ_τ=δ_(στ) and component map τ↦σ⁻¹τ. Inverse-image structure sheaf has stalk K^sep, not C. Empty groups=0. | Action and module/sheaf distinction pass. R07 corrects “regular”. |
| §1.3 functoriality and closure change | σ=s,τ=r in S₃; identity; purely inseparable extension; Kummer | ρ(r)⁻¹ρ(rsr⁻¹)ρ(r)=ρ(s); wrong transport yields ρ(r²sr⁻²)≠ρ(s). For L=K(t¹ᐟp), G_L=G_K and both restricted actions agree. Kummer kernel on (K^sep)× is μ_n and cokernel is 0 for n invertible. | Transport, restriction and connecting-map conventions pass. Tensor clause subject to R02. |
| §1.4 scheme action and topological invariance | Spec ℝ with μ₄; Spec 𝔽₂ with μ₅; dual-number thickening | Conjugation sends i↦−i. Arithmetic Frobenius sends ζ↦ζ². Spec(k[ε]/ε²) and Spec k have the same étale topos, so both geometric H⁰ groups are the same fibre and H^q=0 for q>0. | No reduction or perfectness shortcut. Pass. |
| §2.1 rigid finite levels and discreteness | Point with inverse-image 𝒪; countable non-qc union | colim_L L=K^sep, equal to H⁰ on the geometric point; each a∈L has an open stabiliser containing G_L. A tuple of roots of orders ℓᵐ has stabiliser ker χ_ℓ, not open. | Positive and excluded non-qc values discriminate the hypothesis. Pass. |
| §2.2 scheme finite levels | Spec k; countable union of Spec ℚ with roots of increasing order | H⁰(Spec k^sep,F)=F_stalk and H^q=0 for q>0. The infinite tuple has stabiliser ker χ_ℓ of infinite index, not open. | The theorem is supported; R06 changes only its Check citation. |
| §2.3 rigid higher-direct-image dictionary | Point with μ₅; P¹ trace; non-Galois cubic | Stalk and geometric H⁰ both have ζ↦ζ² over ℚ₂. Trace sends the twisted hyperplane class to 1 on both sides. Cubic module has rank 3 and transposition trace 1, not regular rank 6 and trace 0. | Dictionary and trace convention pass; R07. |
| §2.4 scheme dictionary | Spec ℂ→Spec ℝ with μ₄; point | Both stalk and geometric cohomology have two coordinates and conjugation (ζ₁,ζ₂)↦(conj ζ₂,conj ζ₁). For the point H⁰ is the fibre and higher groups vanish. | Both full-faithfulness directions use the same Galois-module equivalence. Pass. |
| §2.5 Hochschild–Serre identification | Geometric point; ℚ₂, μ₅ | At the point the only nonzero geometric row is q=0, so E₂^(p,0)=Hᵖ(G_K,F_stalk)=the abutment. For ℚ₂, H²(G_K,𝔽₅(1))=𝔽₅; the inverse twist gives 0 since χ₅²(Frob)=4≠1. | Correct left-action coefficient is essential. Pass. |
| §2.6 adic agreement and Frobenius | q=2,ℓ=5; H⁰(μ₅); H²(P¹,𝔽₅) | Arithmetic/geometric multipliers are 2 and 3 on μ₅, product 1 mod 5; on H²(P¹,𝔽₅)=𝔽₅(−1) they are 3 and 2. Explicit finite-level pullback and supplier descent data give the same multipliers. | No inversion or Tate-twist mismatch. Pass. |
| §3.1 naive/derived limits and topology | Point; infinite disjoint union; tower ℤ with ×ℓ | lim ℤ/ℓⁿ=ℤ_ℓ and lim¹=0. Infinite-union limit has kernels ℓⁿ∏ℤ_ℓ and infinite discrete quotient ∏𝔽_ℓ. For (ℤ,×ℓ), lim=0 but lim¹=ℤ_ℓ/ℤ, so deleting the Milnor term is wrong. | Repaired topology and distinction of derived cohomology pass. |
| §3.2 joint continuity | Finite-level cylinders; ℤ_ℓ× acting on discrete ℚ_ℓ; zero module | In a cylinder restricting finitely many projections, the stabiliser is an intersection of finitely many open subgroups. On discrete ℚ_ℓ the stabiliser of 1 under units is {1}, not open. On 0 every operator and the action map are constant. | Joint continuity is proved, not inferred from continuity of individual operators. Pass. |
| §3.3 rational coefficients | Product-topology ∏ℤ_ℓ; ℤ_ℓ; 𝔽_ℓ | ℓA is not product-open although the proposed ℚ_ℓ topology requires it open. A[1/ℓ] consists of sequences with a common denominator; (ℓ⁻ᵐ)ₘ is outside it but inside ∏ℚ_ℓ. ℤ_ℓ[1/ℓ]=ℚ_ℓ and 𝔽_ℓ[1/ℓ]=0. | Algebraic Checks pass; topology is false, R01. |
| §4.1 equivariant twists | μ₅ over ℚ₂; elliptic curve with twist modulo 7; coefficient ℤ/1 | Twist-one multiplier 2 versus inverse 3 mod 5. On rank 2, twisting by χ multiplies determinant by χ², giving 4 mod 7 at q=2, not 1. ℤ/1 is zero, with unique action. | Twist and determinant exponents pass; invertibility excludes μ_p as an étale rank-one sheaf in characteristic p. |
| §4.2 proper comparison | P¹ over ℚ₂ with 𝔽₅; Spec L; empty scheme | Each H² is 𝔽₅(−1), arithmetic multiplier 3; at Spec L each H⁰ has one Λ coordinate per embedding with the same permutation. Empty groups on both sides are 0. | Mathematical comparison matches the named supplier. R05 locators and R07 terminology. |
| §4.3 finite-generation packaging | Finite towers; Enriques surface at ℓ=2; non-ML tower | Finite inverse systems have lim¹=0. H/ℓH has cardinality ≤#Hⁱ(𝔽_ℓ); native topological Nakayama gives finite generation. Enriques H² has torsion ℤ/2, so it is not finite projective; quotient removes that torsion. Without ML a degree-(N+1) lim¹ term need not be 0. | Mathematical packaging sound subject to repaired rational topology. R05 supplies the exact input. |
| §4.4 finiteness instances and gap | Pᵈ; smooth proper at residue characteristic; singular locally algebraic proper; equal characteristic ℓ=p | Pᵈ has H²ᵐ=ℤ_ℓ(−m) for 0≤m≤d and odd cohomology 0; above 2d all groups 0. Finite-dimensional 𝔽_ℓ group has cardinality ℓʳ. In characteristic p, ℓ=p fails every listed invertibility case, so no false finiteness assertion follows. | Four cases have their respective hypotheses; the non-locally-algebraic proper case remains the owned gap. |

The tests also include rank zero, zero coefficients and identity maps: their cohomology maps are uniquely zero or identity, without dividing by a parameter or using a nonexistent inverse. No degree-of-zero, natural subtraction or division-by-zero formula is introduced. The rank-one field assumption is explicit; q=1 is not a residue cardinality of the local fields used in the Frobenius Checks. No finite-type theorem was extended to a non-qc space by these tests. There is no Lean variable/include context to audit at this stage.

### Seeded sources and source register

All 11 cited works have a single manifest key. Seven cached legal texts were read; the four settled uncertified works were not requested again. The Scholze, Zavyalov and Hansen–Zavyalov locators were checked against the explicitly identified arXiv versions, not silently assigned published pagination. No source was fetched, no manifest entry was changed and no new missing-source request was created.

| Sampled target | Text and exact locator examined | Support and limits |
| --- | --- | --- |
| 0.1 | `dejongvanderput1996 line 1476`, §3.6, printed p.36; source statement of the completed separable closure; pinned norm/completion declarations below | Source identifies the algebraically closed completed closure. Density in arbitrary characteristic was separately tested and the general completion theorem resolved to RD.0.33; the characteristic-zero-only Mathlib shortcut is not used for characteristic p. |
| 0.2 | `dejongvanderput1996 line 1479`, §3.6, p.36 | Continuous K-automorphisms of C are the Galois group. The design's norm-extension and dense uniqueness route supplies its more explicit statement; joint continuity has the finite-extension-stabiliser witness above. |
| 0.3 | `dejongvanderput1996 line 1479`; `stacks03N1 line 3966`, Tag 03QW, printed pp.86–87 | These support the automorphism/stalk convention, not the assertion that every neighbourhood is connected or every quadratic extension separable. R03–R04. |
| 1.2 | `dejongvanderput1996 line 1481`, §3.6, p.36 | Pullback along the semilinear geometric automorphism gives the cohomology action. The source's over-K versus over-C distinction agrees with the design's explicit nonempty hypothesis. |
| 1.3 | `dejongvanderput1996 line 1481`; `zavyalov2025 line 3798`, §5.4, arXiv v3 p.78 | Source uses the sheaf/Galois dictionary to obtain equivariance. It does not remove commutativity/Tor restrictions of the cited tensor supplier: R02. Closure change is verified directly above. |
| 1.4 | `stacks03N1 line 3963`, Tag 03QW; line 4221, Lemma 59.1, p.92; line 4235, Example 59.3 | Left action and discrete-module equivalence match the design, including μ_n with its usual Galois action. A notational source misprint is recorded below. |
| 2.1 | `dejongvanderput1996 line 1514`, finite levels, pp.37–38; line 1571, Theorem 3.7.3, p.38; line 1594, Corollary 3.7.5, p.39 | Quasi-compactness and arbitrary abelian sheaves are present. The design's qcqs and D⁺ extensions use its named descent/limit and hypercohomology inputs. No source finiteness assertion was substituted for discreteness. |
| 2.2 | `stacks03N1 line 3733`, Theorem 53.1, Tag 03Q9, p.81; `milneLEC line 3211`, §12, p.81 | Stalk/limit comparison uses qcqs hypotheses; the Stacks statement includes the bounded-below setting. Main SchemeAndStackFoundations §2.15 supplies the limit formulation. |
| 2.3 | `dejongvanderput1996 line 1571`, Theorem 3.7.3, p.38; `zavyalov2025 line 3795`, §5.4, arXiv v3 p.78 | The equivariant higher-direct-image stalk isomorphism is explicitly supported; the source's quasi-compact setting is retained. Huber 2.3.10 is attested there but not directly certified. |
| 2.4 | `stacks03N1 line 3733`; line 4221, Lemma 59.1; line 4229, Lemma 59.2; `milneLEC line 3211` | Both the higher-direct-image stalk and equivalence with discrete Galois modules are present. Full faithfulness gives both directions of the design's Hom bijection. |
| 2.6 | `stacks03N1 line 3966`, action convention; line 4241, roots of unity; `milneLEC line 4531`, §17, p.114; pinned arithmetic-Frobenius theorem | Milne §17 is proper base change, not a Frobenius-normalisation theorem. The actual normalisation is independently supported by the pinned cyclotomic theorem and the resolved F.10.2/F.4.6 supplier. SGA 4½ Rapport remains uncertified. |
| 3.2 | `milneLEC line 4808`, §19, pp.123–124; `hansenzavyalov2023 line 1706`, p.39 | The inverse-limit/localisation convention is present. The general continuity assertion is the design's proof from discrete finite levels, not a claim that these sources cover arbitrary topological representations. |
| 3.3 | `hansenzavyalov2023 line 1702` and line 1706, Theorem 3.3.2 proof, p.39 | The source works over a discretely valued p-adic field with ℓ≠p and states algebraic localisation. It does not establish the design's arbitrary-module open-image topology: R01. |
| 4.2 | `berkovich1993 line 4584`, Theorem 7.1.1, printed p.128; line 5339, Corollary 7.5.4, printed p.150; `milneLEC line 5007`, §21, p.130 | Berkovich 7.1.1 is the compact-support comparison for compactifiable schemes and arbitrary torsion; properness makes it ordinary cohomology. Corollary 7.5.4 has constructibility/prime-to-characteristic hypotheses. Milne §21 is complex comparison: R05. |
| 4.4 | `berkovich1993 line 5110`, Corollary 7.4.4, printed p.143; `scholze2013 line 1279`, Theorem 5.1, arXiv v2 p.28; `milneLEC line 4783`, Theorem 19.1, p.123; `hansenzavyalov2023 line 1708` | Respectively smooth proper prime-to-residue finiteness, smooth proper 𝔽_p finiteness over algebraically closed complete extensions of ℚ_p, algebraic constructible finiteness, and attestation of the 2d bound. General proper rigid finiteness is not falsely attributed to these: it is the declared gap. |

Additional full-pass source checks: §4.3's cited Hansen–Zavyalov lines do not establish its Nakayama step (R05); `milneLEC line 4860`, Theorem 19.2, p.125, was read with its flat ℤ_ℓ-sheaf assumptions. The finite-group and profinite Hochschild–Serre statements were resolved to their suppliers and `milneLEC line 3300`. The reported published-page issue for Zavyalov is avoided by the README's explicit arXiv-v3 p.78 locator; no claim of checked Annals pagination is made.

### Libraries opened at the supplied pins

The actual revisions are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Object searches included absolute Galois groups, completions, continuous representations, étale sheaves and pullback, derived towers, Tate twists, scalar extension and compact-module finiteness. The following are native inputs, not new roadmap constructions.

| Pinned file and line | Declaration/content checked |
| --- | --- |
| `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42`, line 59 | `Field.absoluteGaloisGroup` is the algebra-automorphism group of the algebraic closure; `mapOfAlgebra` has the requisite algebra/tower context. |
| `Mathlib/FieldTheory/KrullTopology.lean:170` | `IntermediateField.fixingSubgroup_isOpen` uses finite dimensionality. |
| `Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:381`, lines 451,573,699,755 | Spectral norm, automorphism invariance, extension of the base norm, uniqueness under completeness, and the normed-field structure. None alone supplies joint Galois continuity. |
| `Mathlib/Topology/UniformSpace/Completion.lean:414`, lines 477,491,496,506; `Mathlib/Topology/Algebra/UniformField.lean:148` | Dense extensionality has a Hausdorff target; completion map, its uniqueness for uniformly continuous maps, identity/composition, and field structure. Isometry supplies uniform continuity in the application. |
| `Mathlib/Analysis/Normed/Field/Dense.lean:46`; `Mathlib/Analysis/Normed/Field/Approximation.lean:52` | `IsAlgClosed.of_denseRange` requires CharZero. The polynomial-root approximation result is the general continuity-of-roots input, not a theorem asserting the desired Galois action. |
| `Mathlib/FieldTheory/IsSepClosed.lean:348`; `Mathlib/NumberTheory/Padics/Complex.lean:54`, lines 137,244 | `SeparableClosure`; native PadicAlgCl, PadicComplex and its algebraic-closedness instance. The arbitrary-field variant is not the ℚ_p specialization restated. |
| `Mathlib/RepresentationTheory/Continuous/TopRep.lean:31`, line 212; `Mathlib/RepresentationTheory/Continuous/Basic.lean:56`; `Mathlib/Topology/Algebra/MulAction.lean:299` | TopRep bundles a topological module and operators continuous individually. It does not itself assert joint continuity in G. The discrete stabiliser criterion supplies the latter where used. |
| `Mathlib/AlgebraicGeometry/Sites/Etale.lean:50`, line 96; `Mathlib/AlgebraicGeometry/Sites/AffineEtale.lean:46`, line 140 | Small étale topology, geometric fibres and affine-basis/sheaf equivalence. These are not an adic-space étale site. |
| `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:64`, line 76 | Scheme adic coefficient sheaf and cohomology definition, without the geometric-fibre Galois action promised here. |
| `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:57`, line 112 | Sheaf.H and its map on abelian sheaves. A native abelian-cohomology carrier is not by itself every ring-coefficient derived interface. |
| `TauCeti/CategoryTheory/Sites/SheafCohomology/Pullback.lean:69`, lines 85,92,105,119 | Generic pullback requires an exact additive functor and the specified constant-sheaf map; naturality, identity, composition and connecting-map compatibility are native. SchemeAndStackFoundations imports them. |
| `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Cyclotomic/Character.lean:54`; `TauCeti/NumberTheory/LocalField/Unramified/Inertia/Cyclotomic.lean:61`; `TauCeti/RingTheory/RootsOfUnity/PadicTateTwist.lean:88` | The continuous character, its arithmetic-Frobenius value under the prime-to-residue assumption, and the roots-of-unity Tate module. |
| `TauCeti/RepresentationTheory/Continuous/ContinuousRep.lean:82` | Native ContinuousRep is a representation with joint continuity; it imposes neither finite generation nor projectivity nor Hausdorffness. The design explicitly uses the narrower F.4.0 finite-projective convention. Its Enriques Check excludes that convention, not the general native carrier. No duplicate native carrier should be added at the package stage. |
| `TauCeti/Topology/Algebra/Module/Nakayama.lean:164` | `Module.Finite.of_quotient_smul_top`, with compactness, Hausdorffness and nilpotent-ideal hypotheses read in scope. This resolves the missing exact input to the §4.3 route as described in R05. |

### Supplier and ownership audit

The supplied board-packages index was read before the audit. The review used `roadmaps show` and object-based `roadmaps grep` against main and the indexed open heads, as well as direct pinned-library searches. Existing-roadmap suppliers were resolved on main, not silently replaced by revisions. The design has no former section numbering to preserve. The overlap report lists no conflicting head changing this roadmap, no dropped cited id, no dropped own id cited elsewhere and no id requiring an open-revision dependency. Its closest roadmaps were inspected by scope and object.

| Supplier / other roadmap | Current resolution and ownership decision |
| --- | --- |
| AdicEtaleGeometry, main | `TauCetiRoadmap/AdicEtaleGeometry/README.md:2285` A1.1; line 3259 A1.6 with maps at 3282; line 3670 A1.7; line 5511 A1.14. Sites, geometric points, descent along algebraic extensions and pro-finite-étale slices are imported. |
| AdicSpacesPartII, main | `TauCetiRoadmap/AdicSpacesPartII/README.md:3085` R0.6; line 3557 R0.7, fibre products at 3702; line 8427 R1.1; line 8542 R1.2. The scheme/adic fibre-product comparison has the required universal property. |
| AdicSpacesPartIV, main; closest revision #1187 | `TauCetiRoadmap/AdicSpacesPartIV/README.md:562`, R4, functoriality at 675. Main already supplies corrected pro-étale site functoriality and compatibility with ν; no revision is consumed. |
| ClassicalAdicEtaleCohomology, new roadmap #875 | `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:95` §1.1, line 354 §1.3, 449 §1.4, 624 §1.5, 3803 §7.1, 4016 §8.2, 4388 §8.4, 5213 §9.7, 5666 §11.1. The actual proper comparison is at 4076; general locally algebraic finiteness at 5686. It owns analytic sheaf/cohomology machinery; this roadmap owns the explicit geometric-fibre action and the identification with those supplied functors. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1658` §0.23a; line 2422 §1.10; 3374 §2.1; 3420 §2.2; 4001 §2.15; 4029 §2.16. Generic pullback is already native. Lines 3403–3404 explicitly map old pullback_comp to pullback_comp_apply: this is valid, not drift. The obsolete Check identifier is R06. |
| EtaleCohomologyFoundations, main; closest revision #1891 | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:231` F.0.3; line 248 F.0.4; 457 F.1; 504 F.2.1; 676 F.3; 850 F.4.0; 940 F.10.2; 959 F.4.1; 1089 F.4.6; 1108 F.10.2b. Main owns finite coefficients, proper base change, finiteness, scheme adic action and Frobenius interface. The target §2.6 is equality with that action, not a second implementation. |
| ProfiniteCohomology, main | `TauCetiRoadmap/ProfiniteCohomology/README.md:671` Layer 0; line 784 Layer 1; 2592 Layer 10. The Galois-module and continuous-cohomology carriers are supplied; §1.2's continuity distinction agrees with this design. |
| EnhancedDerivedSheaves, main | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:457`, tensor and Tor scope; line 467 derived limits; 494 functor coherence. R02 restores its hypotheses. DerivedModuleAlgebra is the point-site/module owner. |
| DerivedModuleAlgebra, main | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:38` explicitly resolves former §1.T.1 to native Tau Ceti tower declarations listed in its Exact supplier contracts. The section citation is valid through this mapping; absence of a literal §1.T.1 heading is not a defect. |
| ArithmeticGaloisRepresentations, new roadmap #856 | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:779` §1.1 and native carrier identification at 783; line 880 §1.2, Tate-module identification at 971. It owns representation twists, not geometric cohomology. The native carrier's generality is distinguished from its finite-projective application. |
| AInfCohomology, new roadmap #1044 | `TauCetiRoadmap/AInfCohomology/README.md:1898` AI.3.1, primitive comparison/finiteness at 2018. Its smooth proper and complete algebraically closed extension-of-ℚ_p assumptions match §4.4(b). |
| PadicDifferentialEquationsAndRigidCohomology, new roadmap #1002 | `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:1535` RD.0.33 supplies algebraic closedness of the completion in every characteristic. This theorem is imported rather than re-planned. |
| PadicPeriodRings, new roadmap #940 | `TauCetiRoadmap/PadicPeriodRings/README.md:89` §1.1 and line 271 §2. These are the finite-ℚ_p and complete discretely valued mixed-characteristic specializations used as Checks. The arbitrary-characteristic rank-one extension in the present roadmap is strictly broader. |
| DiamondEtaleCohomology #922; AdicCoefficientsAndComparisons #965 | `TauCetiRoadmap/DiamondEtaleCohomology/README.md:1` and `TauCetiRoadmap/AdicCoefficientsAndComparisons/README.md:1`, summaries and scope: diamond/v-stack cohomology and adic coefficient comparisons. Their carriers and operations remain theirs; they do not duplicate this explicit rigid/scheme action bridge. |
| Named downstream sections | PadicHodgeTheory §2.7 and Layer 8 (`TauCetiRoadmap/PadicHodgeTheory/README.md:599`, line 1376); WeightsInEtaleCohomology §§1.7–1.8 and Layer 2 (`TauCetiRoadmap/WeightsInEtaleCohomology/README.md:232`,244,272); ClassicalAdicEtaleCohomologyPartII §§5.3–5.9 and §7.5 at its head. These consume actions or their equivariant comparisons; they are not *Needs* prerequisites. Other names in Downstream consumers are prospective uses, not supplier edges. |

The 12 automated unresolved-name leads are supplied planned declarations: AdicSpace geometric-point/pullback/pushforward names in A1.6–A1.7, ClassicalDerived names in EnhancedDerivedSheaves, AInf.primitive_mod_p_comparison in AI.3.1, and the six VanishingCycles names in the cited F-sections. They are not asserted to exist in the pinned libraries. No additional ownership conflict was found in the indexed main/open-roadmap object searches. This is a search and relevant-scope audit, not a claim to have read every file of all 434 pull requests.

The `proper-rigid-finiteness` gap is precise, named in both README and plan with the same slug, and assigned to ClassicalAdicEtaleCohomology §9.7. Its general proper conclusion is not supplied by §9.7's smooth case or §11.1's locally algebraic case. The repair now records both existing subcases. The gap is not a finding and should remain available for conditional acceptance after the findings are fixed.

Dependency gate output from this round:

```text
candidate: GaloisActionOnEtaleCohomology is not in the merge order yet; checked as if placed after PadicDifferentialEquationsAndRigidCohomology (the intake inserts it when its design is accepted)
depcheck: 234 roadmaps, 2115 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The design is not yet required to occur in the merge order. No banned supplier is consumed. The proper-rigid-finiteness contract is the only declared gap; no cycle was manufactured by treating a consumer as a prerequisite.

### Headline theorems and acceptance-file audit

The summary's headline families are: (1) G_K≅Aut_cont(C/K); (2) the left rigid/pro-étale/scheme action with functoriality; (3) discreteness, higher-direct-image dictionary, Hochschild–Serre and scheme-adic/Frobenius agreement; (4) continuous integral and rational actions; (5) twisting, proper comparison and finite-generation/finite-dimensionality consequences. Their targets are §§0.2–0.3, 1.1–1.4, 2.1–2.6, 3.1–3.3 and 4.1–4.4 respectively.

This is a design review: there is no `Suggested.lean` in the package. Consequently there are zero sorried theorem declarations, zero padding declarations to probe, no imports or variable binders to elaborate, and no package module docstring to assess. No fictitious passing build is reported. Elaboration is **not available (this lane does not elaborate; say so in the report)**. No Lean command was run.

For the later package, the field-only extension/uniqueness headline is statable on native algebraic closures, normed completions and continuous algebra maps using a few real-bodied definitions; it must not disappear behind a “no adic space” explanation. Analytic headline signatures lack the native adic-space/site/cohomology carriers. Scheme abelian cohomology and generic pullback do exist at the pins, so the package must assess its precise scheme signatures rather than declaring every scheme headline unstatable merely because a supplier plans related theory. Nothing is accepted here as a substitute headline, a free Prop-valued stand-in or a boundary-case padding theorem.

## Not verifiable

- Direct textual certification of huber1996: Proposition 2.3.10, §2.4/Corollary 2.4.6, Corollary 2.8.3, Theorem 3.7.2, §3.8 and Proposition 6.1.1. The manifest settles the book as uncertified/paywalled. Supplier restatements and open-source attestations were checked where available; they are not represented as reading the book.
- Direct textual certification of huber1994 §§1–3, sga4half Arcata/Rapport and serreGC1997 Chapter I §2, for the same settled reason. No renewed source request was made.
- Published pagination of Zavyalov's Annals version: the source read and the README locator are explicitly arXiv v3, p.78. The cited content and numbering at that version were read; the published pagination was not guessed.
- Lean elaboration, `#check @name` and one-tactic probes: unavailable in this lane, and no Suggested.lean exists at this design stage. Library definitions and hypothesis blocks were inspected directly instead. This report does not certify a future package file.

## Source issues

- **Misprint** in stacks03N1 at Example 59.3 (Tag 03QV), printed page 92, lines 4240–4241: the source says the additive and roots-of-unity sheaves are restricted to Spec(K^sep) within the equivalence for Spec(K); it should be restrictions to Spec(K)_ét, whose stalks are evaluated over K^sep; affects nothing.
