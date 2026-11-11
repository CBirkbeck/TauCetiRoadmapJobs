# Review of LocallyAnalyticDistributionsPartII (package, round 2)

**Verdict:** needs changes

Seventeen findings: seven P1, four P2, six P3. The package is repairable within its intended scope. Its acceptance file elaborates, but elaboration does not detect the false mathematical statements below. No package input was edited during this review.

### Previous findings, checked first

The previous report and repair report identify the seven findings as F01–F07. The table preserves those identifiers. No entry was marked not actionable.

| Previous finding | Repaired passage in packages/LocallyAnalyticDistributionsPartII/README.md, unless specified | Assessment now |
|---|---|---|
| F01, Lazard ownership | Line 11: “The Lie algebra L_G itself … is NoncommutativeAndEquivariantIwasawa §0.13a’s.” | Repaired. The current supplier constructs Log and rational L(G); §0.1 here retains lattice structure and normalization. |
| F02, nonexistent coadmissibility name | Line 53: “the coadmissibility predicate of §0.1 (compatible finite modules over the Banach stages, recovered by inverse limit)” | Repaired. The invented declaration is absent throughout both files. R08 below concerns an independent missing hypothesis in the general supplier contract. |
| F03, irrational radii | Line 515: “for every real r in the range it is §4.8 (ii)” | Repaired. For p=3 and 5 the comparisons are 1/2=1/2 and 1/2>1/4. At r=p^(−1/√2), ρ=pr>1. The route to §4.8 is acyclic. |
| F04, antipode | Line 450: “λ = dχ ∘ HC ∘ S”; line 480 derives this on Ind(χ). | Partly repaired. The SL₃ values −6 and 6 are correct. The new fixed-character equivalence fails (R06), and the same antipode pattern remains in the unrepaired duality (R01). |
| F05, disconnected-group example | Line 174: “G = O(2)(ℤ_p), or … containing an element of determinant −1” | Repaired. Reflection sends x to −x; SO(2) sends x to x. |
| F06, roots and Dirac density | Line 92 cites §0.7 for roots; line 151: “The K-span of the Dirac distributions … is dense in D(G, K)” | Repaired at these locations. ST02 line 514 supports the added density target. The related mistake of calling G itself dense remains at line 351 (R16). |
| F07, existing completed-module action | Suggested.lean lines 46–47 cite the native completed-module action. | Partly repaired at the present pins. That API is correctly identified, but the claimed missing symmetric-power action is now in Tau Ceti; a native Peter–Weyl signature elaborates (R10). |

## R01 (P1) — Central-character duality loses the antipode

**Location:** packages/LocallyAnalyticDistributionsPartII/README.md:470, 472; Suggested.lean:39. Quote: “D(G, K)_λ ≅ C^la(G, K)[λ]′_b”.

**Claim:** The natural pairing identifies the quotient at λ with the dual of the left-translation eigenspace at the same λ. Preserving the centre under S is treated as preserving each character.

**Witness:** G=1+3ℤ₃ in G_m, x the torus generator, f(g)=g. Left differentiation gives xf=−f, but the positive distribution satisfies (x̃+δ₁)(f)=1+1=2, not 0.

**Exact repair:** Use D_λ ≅ (C^la[λ∘S])′ and Ann(C^la[ν])=D·ker(ν∘S), with S²=1. Propagate this through the proof, docstring and §4.5: inversion of functions transports density at λ to density at λ∘S. Keep the general reductive statement. Test: f(g)=g⁻¹ has positive derivative −1, so (x̃+δ₁)(f)=0; for SL₂, S(Δ)=Δ and the existing specialization is unchanged. This is a convention error, not a reason to restrict the theorem to SL₂.

## R02 (P1) — Frommer’s supported distributions became a product containing all distributions

**Location:** packages/LocallyAnalyticDistributionsPartII/README.md:234. Quote: “the closure of D(G, K)·D(H, K) … with basis in K[H]”.

**Claim:** That closure is the finite free module of Kohlhaase’s Corollary 1.4.1.

**Witness:** H={1}, G=ℤ_p, r=p^(−1/p): the displayed product is D(G), whose completion has U_r-rank p. A basis contained in K[H]=K can have at most one element.

**Exact repair:** Replace the product by the distributions supported on H, defining their meaning, or equivalently use the closure of U(g_K)D(H,K). KOH07 line 683 uses the supported-distribution subspace, defined at line 277; lines 702–705 identify its closure. State its rank as the product of ℓ_i over subgroup coordinates. Test: H={1} gives U_r and rank 1; H=G gives D_r and rank p in dimension one. This fixes the object without narrowing Frommer’s theorem.

## R03 (P1) — Not every split semisimple Lie order has stable lattices in every representation

**Location:** packages/LocallyAnalyticDistributionsPartII/README.md:379,392. Quote: “A g_R-stable lattice exists for every finite-dimensional W”. Also §3.8(b)’s equivalence with all finite-dimensional U(𝔤_K)-modules.

**Claim:** Split semisimplicity over K alone supplies the integral lattice and extension to U₀ for every representation, for the permitted congruence kernels.

**Witness:** At p=3 take 𝔞=sl₃(ℤ₃)+ℤ₃q, q=diag(1,1,−2)/3, and W=ℚ₃³. Then det(q)=−2/27 has valuation −3, excluding any q-stable lattice.

**Exact repair:** Retain the stable-lattice hypothesis in the general construction and describe the corresponding category as representations extending to the specified completed lattice algebra. Assert automatic existence, the unrestricted equivalence and factorization with the integral group hypotheses actually used by AW13, including its simply-connected semisimple setting (AW13 line 2060, lines 2816–2840). Keep general semisimplicity separately, supplying its argument after passage to a sufficiently deep lattice; do not discard small primes or arbitrary uniform groups from the general theory.

The counterexample is an admitted group, not an arbitrary irrelevant Lie order: 𝔞 is the image of Lie(PGL₃/ℤ₃) in sl₃(ℚ₃) under X↦X−tr(X)I/3. Its brackets are integral: [q,E₁₃]=E₁₃, [q,E₂₃]=E₂₃, the opposite brackets are their negatives, and [q,E₁₂]=0. Thus L=3𝔞 is powerful and gives a uniform group, also realized by the first congruence kernel of PGL₃. In Û(𝔞), 1−3q is a unit with inverse Σ(3q)^n; on W it kills e₁. Hence W cannot extend to Û(𝔞)_K, directly refuting §3.8(b). After replacing the lattice by 3𝔞, the matrices are integral and ℤ₃³ is stable, testing the corrected general construction. For SL₂ and its symmetric powers the Chevalley lattice supplies the required stable lattice, so the Lean semisimplicity headline survives.

## R04 (P1) — A nonnormal subgroup needs different left and right transversals

**Location:** packages/LocallyAnalyticDistributionsPartII/README.md:166. Quote: “a free left and right D(H, K)-module on δ_g₁, …, δ_g_l”.

**Claim:** Any representatives for gH give both module bases before H is assumed normal.

**Witness:** G=S₃, H=⟨(12)⟩, representatives 1,(23),(123) for gH. But H(23)=H(123). Their left D(H)-span has dimension 4, whereas D(G) has dimension 6.

**Exact repair:** Use these representatives for the right basis and their inverses for the left basis, or choose separate transversals. Preserve the common basis when H is normal. Finite groups are compact analytic groups of dimension zero, so this is within the statement. ST02 line 516 gives the right decomposition δ_gD(H). The corrected inverse transversal has three distinct left cosets, hence span dimension 6.

## R05 (P1) — The Frobenius inverse omits the crossed-product cocycle

**Location:** packages/LocallyAnalyticDistributionsPartII/README.md:537. Quote: “β(Σ r_g ḡ)(h̄) = r_(h⁻¹)”.

**Claim:** This is the inverse of α(f)=Σ f(ḡ)ḡ⁻¹ for an arbitrary finite crossed product.

**Witness:** R=ℚ, H=C₂, T=ℚ[u]/(u²−2), f(1)=0, f(u)=1. Then α(f)=u/2; the proposed β gives β(α(f))(u)=1/2 instead of 1.

**Exact repair:** Define β(t)(x)=pr₁(tx), the identity-coefficient pairing. Verify its R-linearity and right T-equivariance, and retain the Ext theorem. Now β(u/2)(u)=pr₁(1)=1 and β(u/2)(1)=0. AB07 line 626 contains the same erroneous coordinate formula; record the source correction rather than copying it. The result about Ext is unaffected.

## R06 (P1) — Equality at one character does not force an even invariant polynomial

**Location:** packages/LocallyAnalyticDistributionsPartII/README.md:454. Quote: “exactly when the W-invariants P_z are even for every generator”.

**Claim:** For the fixed χ, equality of the two evaluated central characters is equivalent to evenness as polynomials.

**Witness:** Take the trivial character of G_m. Then ρ=0, P_x(X)=X is odd, but dχ(HC(S(x)))=0=dχ(HC(x)). The repair report’s own trivial SL₃ example also gives 0=0.

**Exact repair:** For fixed χ, require P_z(dχ+ρ)=P_z(−dχ−ρ) on central generators. Reserve polynomial evenness for equality uniformly in all weights/characters, with the density argument stated. Test the trivial character (0=0 despite an odd generator) and the existing SL₃ character (−6≠6). Keep the corrected induced-character definition.

## R07 (P1) — The trivial-group Ore set is not every nonzero scalar

**Location:** packages/LocallyAnalyticDistributionsPartII/README.md:327. Quote: “S₀ = R ∖ {0}”.

**Claim:** The exact-symbol definition of S₀ becomes all nonzero elements when G is trivial.

**Witness:** R=ℤ₃, G={1}: S₀=⋃ₐ3ᵃ(1+3ℤ₃). The nonzero unit 2 is absent: its residue is 2, while every valuation-zero member has residue 1.

**Exact repair:** Write this union, distinguishing it from its saturation. Its localization is still K, since it contains p and all other scalar units were already units. Test 1,3∈S₀ and 2∉S₀; both the corrected localization and the old intended localization equal ℚ₃. AW13 line 3228 defines exact powers of gr p, not their unit multiples.

## R08 (P2) — The general Fréchet–Stein contract omits a restriction hypothesis

**Location:** packages/LocallyAnalyticDistributionsPartII/README.md:55 and design/plan.json:4365–4368. Quote: “restriction of coadmissibility along a map of Fréchet–Stein algebras”.

**Claim:** Restriction preserves coadmissibility without a condition on the target algebra as a module over the source.

**Witness:** A=ℚ_p, B=ℚ_p⟨T⟩, M=B, using constant Banach presentations. M is finite over B and coadmissible, but infinite-dimensional over A and not coadmissible there. ST03 line 475 excludes this map.

**Exact repair:** In both copies of the same gap, specify a continuous unital A→B with B coadmissible as a left A-module, and state Lemma 3.8’s equivalence under that hypothesis. Alternatively remove this unused clause. The same test with B=A² is finite on both sides and satisfies the corrected hypothesis. The declared gap remains owned by PadicLocalLanglandsForGL2Qp §0.1; its existence is not a finding.

## R09 (P2) — The pinned library already supplies the full PBW basis

**Location:** packages/LocallyAnalyticDistributionsPartII/README.md:49, 197, 204. Quote: “Linear independence … is LieHighestWeight Layer 3, not a library theorem at the pin.”

**Claim:** This package must assemble PBW linear independence over R from a future field theorem.

**Witness:** TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Basis.lean:96 defines Module.Basis.pbwBasis over an arbitrary commutative ring and a free Lie algebra; line 175 identifies it with ordered products.

**Exact repair:** Cite that basis and its product formula, remove the duplicated PBW target and update the supplier and ownership prose. Retain the new π-adic completions and their analytic properties. The associated-graded comparison is also native at PBW/Injective.lean:213. On R=ℤ₃ and h=sl₂(R), the native basis gives precisely hᵃeᵇfᶜ; on h=0 its sole monomial is 1. TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:405–424 itself now consumes this native theorem, rather than being its future owner.

## R10 (P2) — Peter–Weyl is statable at these pins and is absent

**Location:** packages/LocallyAnalyticDistributionsPartII/Suggested.lean:42–47; README.md:616. Quote: “Mathlib’s SymmetricPower carries no functoriality and no group action at the pin”.

**Claim:** The symmetric-power action prevents the algebraic Peter–Weyl headline from being stated.

**Witness:** TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:57 supplies TauCeti.symPowerRep; RepresentationTheory/SymmetricPower.lean:47 and LinearAlgebra/SymmetricPower/Basic.lean:109 supply the general construction and functoriality. A native surjective-extension signature elaborated with only a sorry warning.

**Exact repair:** State the Peter–Weyl headline using these native actions: a surjective K-algebra homomorphism from K ⊗_[ℤ_p] ℤ_p[[G₁]] to End_K(Sym^k(K²)), prescribing its value on each group element. Its kernel is the annihilator, so this states the quotient theorem without building a compact symmetric-power carrier first. State the product form on native tensor products as well. Update the missing-carrier explanation and supplier contracts; do not insert the tautology Hom_A(A,W)≅W as a substitute. The successful probe is reproduced below. At k=0,1,2 the endomorphism dimensions are 1,4,9; the signature covers arbitrary k and finite K/ℚ_p.

## R11 (P2) — Microlocalisation at the identity still completes a noncomplete ring

**Location:** packages/LocallyAnalyticDistributionsPartII/README.md:287, 300. Quote: “For T = {1} … Q_T(A) = A.”

**Claim:** The Check asserts equality for the section’s Zariskian hypothesis; completeness is only an example in its opening sentence.

**Witness:** A=ℤ_(3) with its 3-adic filtration is separated and Zariskian. S=1+3A consists of units, so A_S=A, but Q_{1}(A)=ℤ₃, not ℤ_(3).

**Exact repair:** State Q_{1}(A)=Â generally and Q_{1}(A)=A when A is complete. Explicitly attach completeness to that conclusion rather than only to the intervening remark about units. Retain the general Zariskian theorem. The same instance with A=ℤ₃ gives Q=A=ℤ₃, as intended.

## R12 (P3) — Several factors give a complete intersection, not a hypersurface

**Location:** packages/LocallyAnalyticDistributionsPartII/README.md:553. Quote: “its graded ring is a commutative hypersurface”.

**Claim:** The graded ring used in the direct route is a hypersurface for arbitrary m.

**Witness:** With m=2, p=3, n=1, the native-norm graded quotient has two independent relations q₁³,q₂³ in six group variables. Its relative dimension is 4 and codimension 2, not 1.

**Exact repair:** Say commutative complete intersection (a hypersurface when m=1), and identify the regular sequence on the disjoint blocks of variables. Each relation is monic in its own H_i variable, so it is regular even after the preceding blocks are quotiented. This still gives the Gorenstein graded ring required by AW13 Proposition 2.5(b). Do not conflate this native-norm computation with the weaker-norm separatedness problem of §4.7(iii): the repeated powers at the native norm need not be reduced, but they are a regular sequence. For m=1 the codimension is 1; for m=2 it is 2; for m=0 the graded coefficient ring has codimension 0. The corrected statement supports the existing grade route without adding a large-radius domain claim.

## R13 (P3) — The lattice-extension locator names a theorem that is a proposition

**Location:** packages/LocallyAnalyticDistributionsPartII/README.md:390. Quote: “§9.2, Theorem and its proof, p. 61”.

**Claim:** AW13 labels this extension result a theorem.

**Witness:** AW13 line 2816 labels the equivalence Proposition; its proof at lines 2818–2829 constructs the stable lattice and completion. Line 2833 is its Corollary.

**Exact repair:** Cite §9.2 Proposition and its proof, p.61, and the Corollary where semisimplicity is used. I located and read these passages, resolving the prior round’s unread locator. The corrected locator contains exactly the extension argument, subject to R03’s hypotheses.

## R14 (P3) — The number of factors is reused as the congruence depth

**Location:** packages/LocallyAnalyticDistributionsPartII/README.md:382. Quote: “the congruence level is m + 1 = 1”.

**Claim:** The m in G₁^m is simultaneously the depth parameter of the preceding general theorem.

**Witness:** For two factors, m=2 gives m+1=3, whereas G₁² is the product of level-one kernels. It is not the level-three kernel.

**Exact repair:** Rename the general congruence-depth parameter a, and say a=0, so a+1=1, independently of the factor count m. At m=0,1,2 the level stays 1. The Lean declaration’s m is already only the factor count.

## R15 (P3) — The strict-inclusion Check needs a nonzero lattice

**Location:** packages/LocallyAnalyticDistributionsPartII/README.md:211. Quote: “Û(πh)_K … is a proper subalgebra of Û(h)_K”.

**Claim:** This Check applies to every lattice of §2.1, including rank zero.

**Witness:** The preceding Check sets h=0 and gives Û(h)_K=K. Then πh=0 too, so the purported proper inclusion is K=K.

**Exact repair:** Explicitly take the rank-one abelian lattice h=Ru (or a nonzero lattice and a chosen basis vector). Then Σπⁿuⁿ has coefficients tending to zero in u but constant 1 in πu. Keep h=0 as the equality control.

## R16 (P3) — It is the linear span of G that is dense

**Location:** packages/LocallyAnalyticDistributionsPartII/README.md:351. Quote: “agreement with exp(log g) holds on the dense subgroup G”.

**Claim:** The group elements themselves are dense in the Iwasawa algebra used for the extension argument.

**Witness:** Augmentation sends every g∈G to 1 and sends 0 to 0. Its continuity excludes 0 from the closure of G. For G={1}, that closure is exactly {1}, not K.

**Exact repair:** Say the maps agree on G, hence on the dense K-linear span K[G], and then use continuity. For G={1}, the span is K and the extension argument works. This is the same span-versus-set distinction correctly used in the F06 repair.

## R17 (P3) — The ramified highest-weight lattice has the wrong scalar ring

**Location:** packages/LocallyAnalyticDistributionsPartII/README.md:559. Quote: “the R-linear character a : t₀ = ⊕ ℤ_p h_i → R”.

**Claim:** The displayed ℤ_p-lattice is the domain of an R-linear map when R is ramified.

**Witness:** p=3, λ=1, R=ℤ₃[√3]. The vector √3h does not belong to ℤ₃h, so that domain has no stated R-module structure.

**Exact repair:** Say ℤ_p-linear on t₀ and extend R-linearly to R⊗_[ℤ_p]t₀=⊕Rh_i, the domain required in §4.13. With a(h)=−1+√3, the extended map gives a(√3h)=√3(−1+√3), and a(h)(a(h)+2)/2=1 as required.

## Verified sound

### Scope, principles and shape

I read the four package inputs in full, the prior review and repair report, and the supplied signature, overlap, package-index and near-match files. I reread the changed mathematics and searched the rest for the repaired patterns. Unchanged prose was not accepted on the earlier review’s blanket summaries: the sampled targets, proof inputs and uncomputed cases were reviewed again. The compact adversarial table below contains the sample, headlines and every finding’s target; it does not reproduce a separate ledger for every API bullet.

The Part II boundary is real: the base LocallyAnalyticDistributions supplies abelian transforms and functional analysis, while the present package develops the noncommutative comparison theory. There is no computational algorithm, sorry-defined datum, set_option, lemma declaration, route-specific replacement of the end theorem, or copied source passage detected in the package. Source arrangement is not used as the build order: the dependency chain is lattices → distributions/completions → microlocalisation → central quotients, with Peter–Weyl consuming the module comparison. The generic microlocalisation target legitimately belongs here; general Iwasawa rings, Log, and distribution Fréchet–Stein theory are assigned to earlier suppliers. R09 is the newly detected duplication at the pins.

The README has all required major headings and six layers, each with Examples and Dependencies. Fourteen definition sections have API lists and Checks: §§0.1, 0.2, 1.1, 2.1, 2.2, 2.5, 3.1, 3.3, 3.7, 3.9, 4.1, 4.2, 4.4, 5.1. Their Check counts are respectively 4,4,4,4,4,4,4,4,4,4,4,5,4,4 (57 total). Counts alone do not certify their truth: R07, R11 and R15 identify faulty Checks. The theorem locators are present; R13 corrects one label and the mathematical findings correct mismatches with their sources. Unicode and source locators are used without machine paths or pull-request/process residue in the roadmap. I compared the house shape against the main-branch PadicMeasuresIwasawaAlgebras and LieHighestWeight roadmaps.

### Build, binders, padding and headline coverage

The command required by the brief, lake env lean on the absolute package Suggested.lean from the content checkout, exited 0. Its only diagnostic was the expected declaration-uses-sorry warning at line 77. The module/public-import header imports Mathlib and the single actually used completed-group-algebra module. No targeted module build was needed.

I elaborated a separate copy with #check @ for all three declarations. The two definitions have the prime hypothesis; the theorem explicitly retains Fact p.Prime, p≠2, the Iwasawa-module structure, the ℚ_p-module structure, the scalar tower and finite dimension. No binder disappeared. The README and Lean agree on the semisimplicity theorem, apart from R14’s prose variable collision.

Every sorried theorem was probed: there is exactly one. Four independent copies tried simp, rfl, infer_instance, and exact using the scalar-field semisimplicity instance. They respectively made no progress, failed reflexivity, lacked an instance, and had a type mismatch between scalar-field and Iwasawa-algebra semisimplicity. The library near-matches require additional hypotheses and do not prove this theorem. There is no padding finding. The two definitions are simple native carriers required by that headline. All three names are present in the README and no other backticked identifier attributed to this package claims an undeclared local declaration.

| Headline in Summary/scope | Acceptance-file assessment |
|---|---|
| Finite-dimensional Iwasawa-module semisimplicity, §3.8 | Stated; elaborates with the intended binders; not a one-tactic theorem. |
| Fu injectivity, §4.14 | Named as unstatable. Its particular microlocalisation homomorphism and specialized completed algebra are not supplied by the pins. |
| AW microlocalisation and D_(1/p) comparison, §§3.4–3.5 | Named as unstatable; filtered microlocalisation and the nonabelian distribution stages are missing. |
| Affinoid Verma faithfulness, §4.13 | Named as unstatable; the affinoid Verma object and its microlocal action are missing. |
| Frommer and crossed products, §§2.3–2.4 | Named as unstatable; the Banach distribution stages are missing. |
| Isotypic comparison, §3.10 | Named as unstatable; M̂ and the comparison map are missing. |
| Central duality, domains and normal forms, §§4.3, 4.7–4.10 | Named as unstatable; the analytic function/distribution topology and central quotients are missing. R01 still requires the docstring’s formula to be corrected. |
| Arens–Michael Fréchet–Stein property, §2.5 | Named as unstatable; the specified envelope and Fréchet–Stein carriers are missing. |
| Algebraic Peter–Weyl, §5.2 | Incorrectly excluded: R10. |

The successful Peter–Weyl probe used the package’s firstCongruenceSL2 definition unchanged, native tensor products and the native symmetric-power action. The substantive signature below elaborated; its proof was sorry. No free predicate, arbitrary action, or sorry-defined data was introduced. The use of an existential homomorphism states the extension and surjectivity theorem itself, rather than presupposing the extension as a hypothesis.

~~~lean
theorem peterWeyl (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (k : ℕ)
    (K : Type) [Field K] [Algebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K]
    [Algebra ℤ_[p] K] [IsScalarTower ℤ_[p] ℚ_[p] K] :
    ∃ Φ : (K ⊗[ℤ_[p]] TauCeti.completedGroupAlgebra ℤ_[p]
          (firstCongruenceSL2 p)) →ₐ[K]
          Module.End K (Sym[K]^k (Fin 2 → K)),
      (∀ g : firstCongruenceSL2 p,
        Φ (1 ⊗ₜ[ℤ_[p]] TauCeti.completedGroupAlgebra.of ℤ_[p]
            (firstCongruenceSL2 p) g) =
          TauCeti.symPowerRep K 2 k
            (Matrix.SpecialLinearGroup.toGL
              (Matrix.SpecialLinearGroup.map (algebraMap ℤ_[p] K) g.val))) ∧
      Function.Surjective Φ := by
  sorry
~~~

### Source sample and locators

All fifteen seeded targets were checked against the legally cached extractions. Page numbers below are the cited preprints’ printed pages, not PDF viewer indices. The manifest has one key for each of the fifteen works cited; no new source or duplicate key was needed. A locator’s presence is distinguished from support for the package’s actual statement.

| Seeded target | Text read and locator | Outcome |
|---|---|---|
| 0.2 First congruence subgroups | FU24 line 124 (definition before Theorem 1.4), lines 157–175 (Theorem 1.5), pp.3–4; AW13 line 3591, §10.12, p.77 | The group/product and odd-prime setting agree. Index and p=2 controls computed below. |
| 2.1 Completed enveloping algebra | AW13 lines 657–668, 682–714, 747–803, §§3.4–3.9, pp.14–17; line 3217, §10.4, p.70 | Completion, null coefficients, noetherianity and finite coefficient extension supported. R09 and R15 are package defects, not failures of these source results. |
| 2.3 Frommer | KOH07 lines 665–705, §1.4 Theorem and Corollary 1.4.1, pp.15–16 | Main theorem and ℓ_i formula supported; subgroup object mistranscribed (R02). FROM03 remains waived. |
| 3.1 Microlocalisation | AW13 lines 402–427, §2.4 Lemma, Definition, Corollary, pp.8–9 | Flatness, module comparison and torsion criterion supported; Q_{1} completes A (R11). |
| 3.4 AW comparison | AW13 lines 3235–3297, §10.4 Theorem and §10.5 remarks, pp.70–71; lines 3314–3354, §10.6 Proposition, p.72 | Uniform, unramified setting and normalization agree. |
| 3.6 Ramified coefficients | AW13 lines 797–803, §3.9 Lemma(c), p.17; FU24 lines 686–699, (17)–(18), p.14 | Finite base change supplies the corrected ramified map. R16 corrects the density sentence. |
| 3.7 Modules | AW13 lines 3283–3297, §10.5(d), p.71, and line 3351, §10.6(e), p.72; FU24 line 700, p.14 | Exactness and localization/kernel distinctions agree. |
| 3.8 Lie modules and semisimplicity | AW13 lines 3653–3730, §11.1 Proposition, Theorem, Corollary, pp.78–80; lines 3749–3789, §§11.2–11.3, pp.80–81 | SL₂ headline supported. Integral hypotheses behind equivalence/lattice claims are lost in the general package (R03); factor/depth indices collide (R14). |
| 3.10 Isotypic comparison | FU24 lines 700–747, (19)–(20), Theorem 4.3, pp.14–15 | Requires the stable lattice and absolute irreducibility kept in this target. Both quotients and natural map agree. |
| 4.4 Principal series | FU24 lines 762–817, §5 and proof of Theorem 5.2, pp.16–17 | Sections and nowhere-zero function supported. Antipode correction is required with this package’s conventions; R06 concerns its new criterion. |
| 4.5 Density/injection | FU24 lines 792–817, Theorem 5.2 and proof, pp.16–17 | Multiplication by f₀ is an isometry on continuous functions. General central-character pairing needs the R01 twist; type A₁ is unaffected. |
| 4.7 Domain quotients | FU24 lines 975–1009, Theorem 5.7, p.20; ST03 lines 872–893, Theorem 4.5/Remark 4.6, pp.21–22 | Package correctly records integrality, rational-radius noetherianity and the large-radius separatedness gap. Irrational small radii now use §4.8. |
| 4.9 Ext/grade | AB07 lines 612–629, §5.4 Lemma/Corollary, pp.16–17 | Result supported; source’s inverse formula is wrong for nontrivial cocycles (R05). |
| 4.11 Direct route | FU24 lines 1017–1043, proof of Theorem 5.1, p.21; AW13 §2.5, pp.9–10 | Domain condition is appropriately explicit. The native-norm graded complete intersection supports the grade argument; it is a hypersurface only for one factor (R12). |
| 5.2 Peter–Weyl | FU24 lines 1072–1115, §6 and (32), pp.21–22; AW13 §11.3, p.81 | Quotient and matrix coefficient theorem supported; right upper-unipotent correction is correct. R10 concerns the pins. |

Also read: ST02 line 376 (Lemma 2.4’s sign) and line 514 (Dirac span and cosets); ST03 lines 449–477 (quotients and restriction), 803–833 (HYP and odd uniform groups); ST02B lines 547–553 (Theorem 3.5); AW13 lines 2060–2068 and 2811–2840 (standing integral hypotheses and the previously unread §9.2); AW14 lines 609–666 (D_(1/p)), 728–751 (Theorem 5.4); SCHM13 lines 196–230 and 625–629 (Propositions 3.2.1/3.2.3, Theorem 4.3.3); BCGP25 lines 1112–1157 (Arens–Michael and left-module conventions). The prior unread AW13 §9.2 is resolved, not carried forward as inaccessible.

### Computed adversarial table

The entries are computations, not claims that small examples prove general theorems. R-numbers identify required changes. Outside-domain controls are explicitly distinguished from counterexamples. Characteristic p, equal-characteristic DVRs, zero coefficient rings and noncompact G are excluded by the standing characteristic-zero/discrete-valuation/compactness hypotheses where used; they are not silently admitted by a Lean binder. Rank zero, p=2, zero modules, unit ideals and nonnormal/noncommutative groups were tested where the carriers admit them.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| §0.1 lattice/normalization | G=ℤ_p; G=G₁; rank 0 | L_(pG)=pℤ_p=pL_G; log G₁=p sl₂, (1/p)log G₁=sl₂; [pe,pf]=p²h∈pL; trivial lattice=0 | Normalization correct | None |
| §0.1 roots, changed F01/F06 | (1+p)^(pa), p odd | Its p-th root is (1+p)^a; ω of the original is 2+v_p(a), root 1+v_p(a) | Saturation threshold agrees with supplier | None |
| §0.2 congruence kernel | p=3,5,2; m=0 | Index p(p²−1)=24,120; at 2, −I≠I but reduces to I and has order 2; empty product has 1 element | Odd uniformity and empty-product convention correct | None |
| §0.3 Lie comparison | x=ph versus pE₁₁ | tr(ph)=0, det exp(ph)=1; tr(pE₁₁)=p, determinant exp(p)≠1; torus span dimension 1 versus sl₂ dimension 3 | Trace/open-subgroup conditions discriminate | None |
| Convention 3, §1.1 | f(z)=z²+3z; exp(pe),exp(pf) | Positive derivative 3 versus negative −3; products have diagonals (1+p²,1) and (1,1+p²) | Sign and convolution order correct | None |
| §1.1 Dirac span | G={1}; G=ℤ_p | D({1})=Kδ₁; log(1+T) has coefficients 1/pⁿ at degree pⁿ, norms pⁿ unbounded | Span dense, not equal to all distributions or bounded measures | None |
| §1.2 two module bases | S₃,H=⟨(12)⟩ | Three gH cosets cover 6 elements; Hg for same representatives cover only 4 | False before normality | R04 |
| §1.3 centre, changed F05 | reflection s, x=E₁₂−E₂₁; SO(2) | sxs⁻¹=−x, rotations give +x | Connectedness example now discriminates | None |
| §2.1 coefficients | rank 1, rank 0 | Coefficients πⁿ have norms →0; coefficients 1 have norm 1; at rank 0 both completed lattices equal K | Null condition correct; blanket properness false | R15 |
| §2.1 ramified deformation | e=2,n=1 | πh after scalar extension equals a unit times (π′)²h′, so index en=2, not 1 | Base-change index correct | None |
| §2.1 PBW | rank 0, rank 1, sl₂ | Native basis gives 1 monomial in rank 0; uⁿ in rank 1; filtered degree ≤1 in sl₂ has dimension 4=1+3 | Already provided at pin | R09 |
| §§2.2–2.3 logarithmic rank | p=3,r=3^(−1/3) | Norm terms at n=1,3,9 are 3^(−1/3),1,1/3; maximum at 3, ℓ=3; D_r rank 3 | Main Frommer computation correct | None |
| §2.3 subgroup closure | Same G,r; H={1}, H=G | Printed product closure has ranks 3,3; supported closures have ranks 1,3; K[1] supports at most rank 1 | Objects differ | R02 |
| §2.4 crossed radius | n=1,2; dimension d=0,1 | log norms p^0=1,p^1=p; pⁿlog norm p⁻¹ in both cases; ranks p^(nd)=1 or pⁿ | Exponential converges, quotient sizes agree | None |
| §2.5 integral-basis requirement, source control | sl₂/ℚ₃ with h′=h/9, e, f, ordered h′<e; r=3 | [h′,e]=(2/9)e; ||eh′||=max(9,27)=27, but ||e||·||h′||=9 | Arbitrary-basis norm is not submultiplicative; package correctly uses an integral Lie lattice | Source issue SCHM13 |
| §2.5 envelope | abelian rank 1; rank 0 | Coefficient condition is null for every weight r≥1; exp(u) converges only within radius p^(−1/(p−1)), hence not entire; rank 0 envelope K | Single Banach step differs from envelope | None |
| §3.1 identity localization | A=ℤ_(3), T={1}; complete A=ℤ₃ | Localizations A_S=A in both; completions both ℤ₃; first A is strictly smaller | Completeness missing from Check | R11 |
| §3.1 torsion/flatness | A=ℤ_p[[X]], T=⟨gr p⟩, M=A/(p) | Q(A)=ℚ_p⟨X/p⟩≠0; Q(M)=0, M≠0; p+X²=p(1+p(X/p)²) invertible, X/p not a unit | Flat, not faithfully flat | None |
| §§3.2–3.3 symbols | p+X², X+p²; G={1},R=ℤ₃ | Both degrees 1, symbols respectively p and X; 1,3∈S₀, 2∉S₀ though 2≠0 | Exact-symbol set matters | R07 |
| §3.3 ramified exclusion | R=ℤ_p[√p] | p∈m², so p−p=0∈p+m² | Direct Ore set invalid; package excludes it | None |
| §3.4 microlocalisation | rank 1; rank 0 | b↦exp(pu)−1 has leading term pu, norm p⁻¹; inverse u=p⁻¹log(1+b); rank 0 R localizes to K=Û(0)_K | Scale p correct | None |
| §3.5 c₀ at 1/p | coefficients d_n=p^(−n) | Weighted norms |d_n|p^(−n)=1, so not null; corresponding Σuⁿ is outside K⟨u⟩ | Corrected bounded/null distinction | None |
| §3.6 base change | K=ℚ₃(√3); G={1} | Extension degree 2, basis 1,√3; K⊗ℚ₃=K; augmentation of all g is 1, of 0 is 0 | Base change correct; G itself not dense | R16 |
| §3.7 modules | 0,K, finite cyclic quotient of dimension p | Microlocal dimensions 0,1,1; distribution-extension dimensions 0,1,p; exp(p²u)−1=p²u times a unit | Exactness does not imply faithfulness | None |
| §3.8 semisimplicity headline | m=0; M=0; G=ℤ_p negative control | Algebra ℚ_p for m=0; zero module has one submodule; γ=1+N with N²=0≠N gives nonsplit 2-dimensional extension for ℤ_p | Semisimple Lie hypothesis necessary | None |
| §§3.8–3.9 lattice equivalence | p=3,PGL₃ Lie order 𝔞, W=ℚ₃³ | q eigenvalues 1/3,1/3,−2/3; det valuation −3; unit 1−3q acts with diagonal 0,0,3 | Stable lattice and extension fail | R03 |
| §3.8 factor/depth convention | m=2 versus depth a=0 | Printed m+1=3, claimed 1; actual level a+1=1 for any factor count | Notation collision | R14 |
| §3.9 native action, changed F07 | W=K and W=K², g=exp(pe) | Trivial action gives 1; standard action is [[1,p],[0,1]]=I+pe; e²=0 | Completed action agrees on group elements | None |
| §3.10 isotypic quotient | W standard, M=A; M=0; M=W^t | Both algebra quotients have dimension 4; both zero-module quotients 0; both W^t quotients dimension 2t | Comparisons agree with stable-lattice assumptions | None |
| §4.1 Casimir normalization | k=0,1,2; Killing dual basis | Eigenvalues 0,3/2,4; h²/8+(ef+fe)/4=Δ/4, so 4Ω=Δ | Sign and scale correct | None |
| §4.1 nonintegral zero quotient | r=p^(−2/3),λ=p⁻¹ | ||Δ||≤p^(2/3)<p=|λ|; Δ−λ a unit; quotient 0 | Integral parameter restriction is substantive | None |
| §4.2 induced character | c=0,2; p=3,5,λ=1 | λ=0,4 and 2λ+1=1,9; for λ=1 get 3, nonsquare in ℚ₃ and modulo 5 | Square criterion correct | None |
| §4.2 antipode, changed F04 | sl₂; SL₃ weight (1,1,−2) | SΔ=½h²+h+2fe=Δ; cubic values 2·1·(−3)=−6 and 6 | New sign correction correct | None |
| §4.2 fixed-character iff | trivial G_m character; trivial SL₃ character | X(0)=−X(0)=0 with X odd; cubic at ρ=(1,0,−1) and −ρ both 0 | Equality at a point does not imply evenness | R06 |
| §4.3 natural pairing | torus f(g)=g, λ(x)=−1 | Left eigenvalue −1; (x̃+δ₁)(f)=2 versus required 0; corrected f=g⁻¹ gives −1+1=0 | Antipode missing | R01 |
| §4.4 eigenfunction | torus χ(t)=t, p=3; trivial χ | f₀(4)=4∈1+3ℤ₃, norm 1; constant 1 fails χ-equivariance since 1≠4; trivial χ gives f₀=1 | Nowhere-vanishing construction separates characters | None |
| §4.5 density and dual injection | f₀ values in 1+pℤ_p; torus inversion | ||f₀h−f||∞=||h−f/f₀||∞; inversion sends t to t⁻¹ and eigenvalue −1 to +1 | Isometry correct; twist repairs general injection route | R01 |
| §4.6 inverse limit | m=0; unit ideal; zero ideal | D=K at every radius, lim K=K; quotient by 1 is 0 at every stage; quotient by 0 is D | No 0/0 or nonzero-domain claim for unit ideal | None |
| §4.7 small-radius domain | p=3,r=3^(−1/√2),λ integral | 1>1/√2>1/2; ρ=3^(1−1/√2)>1; quadratic symbol ½H²+2EF has matrix determinant −1/2≠0 | Irrational route now justified by §4.8 | None |
| §4.8 normal form | ρ=1 and ρ>1,λ=0 | h²=2h−4ef; weights of terms ≤ρ²; remainder h-exponent 0 or 1; rank-zero quotient K | Reduction bounded, proper endpoint retained | None |
| §4.9 Frobenius pairing | T=ℚ[u]/(u²−2) | α(f)=u/2; printed β gives 1/2; coefficient pairing gives 1; dim Hom_ℚ(T,ℚ)=2=dim T | Formula false, theorem survives | R05 |
| §4.9 grade boundary | M=0; T=R=field,M=R | Ext_i(0,R)=0 all i, grade ∞ on both sides; Ext⁰(R,R)=R, grade 0 on both | Boundary conventions consistent | None |
| §4.10 weighted completion | n≥1, degree N, d_N=p^(−2nN) | |d_N|p^(nN)=p^(3nN), not null: excluded on both sides; using d_N=p^(2nN) gives p^(−nN)→0 | Correct weight direction and inclusion into weight 1 | None |
| §4.11 direct route | p=3,n=1,m=1,2; δ=1 | Native symbol is q³ for q=½H²+2EF; one block has dimension 3−1=2; two have dimension 6−2=4, codimension 2; δ=1 gives δ′=1 | Gorenstein complete intersection suffices; hypersurface wording fails for m=2 | R12 |
| §4.12 integral roots | p=3,λ=1; λ=−1/2; m=0 | a=−1+√3 gives a(a+2)/2=1; a=−1 gives −1/2; empty extension has degree 1=2⁰ | Arithmetic correct; scalar domain wrong | R17 |
| §4.13 Verma faithfulness | type A₁,p=3 versus2; highest weight a=2 | 3 is very good,2 is not; Δv=4v; vectors fⁿv give infinite dimension while Sym² has dimension3 | No finite-dimensional stand-in; source hypotheses explicit | None |
| §4.14 Fu injectivity | p=3,λ=1; m=0 | K degree2, a=−1+√3 integral; faithful scalar extension sends nonzero vector to nonzero; empty product gives identity ℚ_p→ℚ_p | All integral λ retained, including non-induced ones | None |
| §5.1 degree filtration | n=0,1,2; finite subgroup {±I} | Dimensions 1,4,10−1=9; x−w evaluates to0 on ±I but is a nonzero coordinate function | Openness needed; degree count correct | None |
| §5.2 Peter–Weyl | k=0,1,2; left lower/right upper unipotents | dim W=1,2,3; dim End=1,4,9; (gn_upper)₁₁=x, (gn_lower)₁₁=x+ay | Source statement and corrected convention sound; statable | R10 |
| General FS restriction gap | A=ℚ_p,B=A⟨T⟩ versus A² | B-module rank1; A-vector dimension ∞ versus2; coadmissible over constant A means finite dimension | Missing finiteness/coadmissibility hypothesis | R08 |

### Pin and duplication audit

I searched by objects as well as declaration names: completed group algebras and compact actions; symmetric powers and their actions; PBW bases and graded enveloping algebras; Lie lattices, distributions, radii, filtered localization, central quotients and finite crossed-product Ext. Pins: Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e; Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5. The following declarations/definitions were opened at those pins, not inferred from search hits.

| Object | Pinned file and line | What it supplies / limits checked |
|---|---|---|
| U(L), lift, special linear Lie algebra | Mathlib/Algebra/Lie/UniversalEnveloping.lean:80,92; Algebra/Lie/Classical.lean:92; Algebra/Lie/Sl2.lean:38 | Native UEA and lift; trace-zero Lie algebra; IsSl2Triple includes nonzero h and bracket laws. |
| SL₂ reduction and action | Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:225,476; Topology/Algebra/Group/Matrix.lean:128; NumberTheory/Padics/RingHoms.lean:301 | Ring-map functor, vector action, topology, reduction to ZMod. |
| Congruence carriers | Mathlib/Algebra/Group/Subgroup/Basic.lean:172; Algebra/Group/Subgroup/Ker.lean:238 | Pi subgroup and homomorphism kernel; no uniformity is silently part of either definition. |
| Localization and filtration | Mathlib/GroupTheory/OreLocalization/OreSet.lean:52; RingTheory/FilteredAlgebra/Basic.lean:75 | Ore laws and ring filtration; neither supplies all the roadmap’s completeness, regularity or separatedness assumptions. |
| Flatness and scalar extension | Mathlib/RingTheory/Flat/Basic.lean:114; Flat/FaithfullyFlat/Basic.lean:64; TensorProduct/Maps.lean:274 | Flat/faithfully flat modules and tensor right-unit map. |
| Semisimplicity | Mathlib/RingTheory/SimpleModule/Basic.lean:66,301,349,365 | Complemented submodule lattice, transport and generic sufficient conditions; not Iwasawa semisimplicity. |
| Exponential/closure/centre | Mathlib/Analysis/Normed/Algebra/Exponential.lean:128; Topology/Algebra/Algebra.lean:263; Algebra/Algebra/Subalgebra/Basic.lean:906 | Native operations. The total exponential definition does not itself prove convergence on a proposed radius. |
| Measures and continuous functions | Mathlib/NumberTheory/Padics/Measure/Basic.lean:40; Topology/ContinuousMap/Defs.lean:32; Topology/LocallyConstant/Basic.lean:212 | AbstractMeasure is a continuous-linear dual of continuous functions, not all locally analytic distributions. |
| Other stated carriers | Mathlib/Topology/MetricSpace/Ultra/Basic.lean:47; Algebra/Lie/Basic.lean:93; RingTheory/AdicCompletion/Algebra.lean:40,97 | Ultrametric property; LieModule; Mathlib’s ring completion theorem here assumes a commutative base ring. |
| Completed group algebra | TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145,252 | Inverse limit over open normal subgroups and native group-element map. |
| Compact module action | TauCeti/Topology/Algebra/Module/Compact.lean:294; TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean:251,322,340,348 | Compact/totally disconnected topological module, completed action, agreement on group elements, scalar tower and continuity. IsCompactModule does not itself assert T2. |
| Casimir | TauCeti/Algebra/Lie/UniversalEnveloping/Casimir.lean:125,175 | Killing-dual-basis Casimir and centrality, with characteristic-zero, finite-dimensional, Killing hypotheses. |
| PBW | TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Basic.lean:75; Ordered.lean:156; Basis.lean:96,175; Injective.lean:213 | Filtration, span, full basis over a commutative ring, and associated-graded equivalence. R09. |
| Symmetric actions | TauCeti/LinearAlgebra/SymmetricPower/Basic.lean:109; RepresentationTheory/SymmetricPower.lean:47; RepresentationTheory/ClassicalGroups/SymmetricPower.lean:57 | Functorial symmetric powers and the actual classical-group representation. R10. |

The pins also have generic ring-valued module-tower completions in TauCeti/Algebra/Category/ModuleCat/Tower/Ring.lean:333. I do not assert that every noncommutative inverse-limit ring is absent. That infrastructure does not itself supply the microlocalisation map, its Banach norm, or the nonabelian D_r comparison; those remain substantial README targets. Likewise the abelian Amice/measure APIs are not duplicates of the nonabelian radius-algebra targets.

### Supplier-order and open-work audit

The required dependency command, with --movable and the specified main checkout and order, returned:

~~~text
depcheck: 236 roadmaps, 2137 edges, 0 problem(s)
~~~

There was no UPWARD, CYCLE or moved line. I read every Needs line and the supplier contracts; none names a forbidden or later supplier. The citation resolver returned no unresolved cross-roadmap citation or local Lean name. Its message that it did not check external Lean names was not treated as a pin audit; those were opened separately above.

Current supplier citations were resolved with roadmaps show/grep, using main for existing roadmaps and provided heads for new roadmaps:

| Supplier | Current locations read | Resolution |
|---|---|---|
| NoncommutativeAndEquivariantIwasawa, open #1307 | TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md, §§0.1–0.3 (from line150), §§0.5–0.8 (from line271), §F.1 (line435), §0.13a (line590) | Uniform groups, coordinates, valuations, series, filtered/noetherian inputs, canonical module topology and Log all exist at the cited sections. The repaired ownership of Log is correct. |
| PadicLocalLanglandsForGL2Qp, open #1312 | TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:205, §0.1 and its declaration-name table | Supplies the distribution/duality/Fréchet–Stein-for-D interfaces described. No invented Coadmissible name remains. General FS and explicit norm contracts are still declared gaps, not missing-owner findings. |
| LocallyAnalyticDistributions, open #854 | TauCetiRoadmap/LocallyAnalyticDistributions/README.md, §§0.0–0.3; scope line41, Hahn–Banach line44, analytic-stage section near1360, strong-duality comparison line1465 | Functional analysis and analytic charts resolve. For discretely valued coefficients the strong-duality comparison explicitly uses PadicLocalLanglandsForGL2Qp §0.1, also already a direct supplier here. |
| PadicMeasuresIwasawaAlgebras, main | TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:424,489,657,909 | Layer0 measures, §1.2 convolution in order xy, §1.7 completed-group-algebra comparison exist. |
| LieHighestWeight, main | TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:318,405,567,931 | Layers0,3,5,7 exist. Layer3 now imports native PBW, producing R09 rather than a missing section. |

Both declared gap slugs occur under Exact supplier contracts and in design/plan.json:4363–4376 with supplier PadicLocalLanglandsForGL2Qp §0.1. The radius-algebra contract keeps finite-rank valuation, HYP, c₀ coefficients and rational-radius stages; it is an owned extension of the supplier’s presentation. The general FS contract needs R08’s hypothesis; otherwise these are genuine extensions, not duplicated carriers. No acceptance conditional on them is issued because there are findings to repair.

The board-packages index was read before the ownership search. I used the provided open-head search, including object searches for Lie lattices/Log, completed enveloping algebras, symmetric powers, microlocalisation, central quotients and finite crossed products. The supplied overlaps.md reports no conflicting head, dropped cited id or revision-only id for this package. A fresh overlaps invocation could not resolve this unported package as an open/main roadmap; that tool failure was not interpreted as a clean result. I checked the supplied closest-head scope leads: #854 and #1312 assign analytic foundations as above; #1307 owns Log/Iwasawa foundations; #1035 CompletedCohomologyPartII/README.md:12–30 owns arithmetic tower comparisons and imports the generic compact-module and Iwasawa APIs; #1837 GlobalGaloisDeformationsPartII/README.md:8–20 owns lifting and finite-coefficient applications and imports Log. None of these scope passages supplies a second owner of this package’s microlocalisation/central-specialisation objects. The elementary first-congruence definitions have no conflicting fully qualified declaration in the readable heads. No dropped-id remapping or revision dependency is needed on the evidence supplied.

## Not verifiable

- SCH11 remains uncertified/paywalled: Corollary31.7 p.229, Theorem32.1 p.232 and Theorem28.3 p.199 were not read. Their cited roles are explicit; the related lattice/graded statements were compared with AW13 and the supplier. No new request was made.
- FROM03 remains waived. The primary orthogonality proof was not read; KOH07 §1.4, pp.15–16 was read in full for the theorem, subgroup corollary and ℓ_i formula. R02 is visible in that accessible text.
- DDMS99, MR01 and DG70 remain waived. Their independent original proofs could not be certified; the corresponding explicit statements and uses were checked in AW13, AB07 and the accessible package sources. They were not renamed or requested again.
- Ownership against open pull requests for which the brief supplies no readable head was not independently checked beyond the configured roadmaps search. No missing-owner conclusion is based on their absence. The unavailable fresh overlaps result is described above; the supplied overlap facts were checked against the relevant readable heads.
- No formal proofs of the deep sorried headlines were attempted. Elaboration, one-tactic failure and computed examples certify their respective limited claims, not theorem truth by themselves.

## Source issues

- **Misprint** in FU24 at §4, equation (16), printed page 14: the source says radius completion consists of series with bounded weighted coefficients; it should be series whose weighted coefficients tend to zero; affects nothing.
- **Gap** in FU24 at Theorem 4.2, printed page 14: the source says all real radii give noetherian Banach algebras by ST03; it should be restricted to the proved rational-power radii or supply an irrational-radius proof; affects a stated result.
- **Error** in FU24 at §4, equation (17), printed page 14: the source says the displayed Ore set works over every finite coefficient extension; it should be formed over an unramified ring and extended by scalar extension when ramified; affects the proof.
- **Error** in FU24 at Theorem 5.7, printed page 20: the source says every central parameter gives a domain; it should require integral Casimir parameters, since some nonintegral parameters give the zero quotient; affects a stated result.
- **Gap** in FU24 at proof of Theorem 5.7 and its use in Theorem 5.1, printed pages 20–21: the source says the weaker-norm quotient has the stated graded ring; it should establish separatedness of the quotient filtration at the larger radii; affects the proof.
- **Error** in FU24 at Remark 5.8, second bullet, printed pages 20–21: the source says integrality characterizes induced parameters; it should require that 2λ+1 be a square in ℤ_p; affects a stated result.
- **Misprint** in FU24 at §6, printed page 22: the source says the right stabilizing unipotent subgroup is lower upper triangular; it should be upper triangular, since right multiplication then preserves the first column; affects nothing.
- **Error** in FU24 at §5, induced-character sentence before Theorem 5.2, printed page 16: the source says left-translation induction has central character dχ composed with HC; it should include the antipode under the positive distribution embedding; affects a stated result.
- **Misprint** in AW14 at §5.2, proof of the Lemma, printed page 14: the source says the radius-one-over-p completion has bounded weighted coefficients; it should have null weighted coefficients; affects nothing.
- **Misprint** in BCGP25 at Definition 2.2.31, printed page 24: the source says the stage transition tensors a left module on the left of its algebra; it should put the extending algebra on the left of the module; affects nothing.
- **Error** in AB07 at §5.4, proof of the Lemma, printed page 17: the source says the inverse Frobenius map extracts the inverse-index coefficient without a cocycle; it should use the identity coefficient of the product tx; affects the proof.
- **Misprint** in AB07 at §5.4 Corollary, printed page 17: the source says R equals the crossed product T∗G while calling R its base; it should say T=R∗G; affects nothing.
- **Misprint** in AW13 at §11.1, proof of Theorem(b), printed page 80: the source says V→RLV is the counit and LRW→W the unit; it should interchange these names; affects nothing.
- **Error** in SCHM13 at proof of Proposition 3.2.1, printed page 6: the source says every radius greater than one gives a submultiplicative norm for an arbitrary basis; it should take radii dominating the bracket coefficients, or first choose an integral Lie lattice; affects the proof.
