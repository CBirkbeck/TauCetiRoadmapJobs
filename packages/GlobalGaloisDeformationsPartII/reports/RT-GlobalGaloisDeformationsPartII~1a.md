<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1174#issuecomment-6434546556 -->
Red team round 1 pass a (codex) of a63f550

Verdict: needs_changes

1. **F01** (P1) The analytic-chart supplier does not exist at the available heads

   **Location:** packages/GlobalGaloisDeformationsPartII/README.md:173–175, 922, 929. “Consume ND.0, especially the p-valued analytic structure and ordered-basis charts.”

   **Claim:** LocallyAnalyticDistributionsPartII ND.0 supplies the analytic structure and charts used by §4.4.

   **Witness:** `roadmaps show LocallyAnalyticDistributionsPartII` reports no such roadmap on main or at an indexed open head. NoncommutativeAndEquivariantIwasawa §§0.2, 0.6–0.7 already provide open uniform subgroups, ordered coordinates and the compatible analytic structure.

   **Exact repair:** Replace every `LocallyAnalyticDistributionsPartII ND.0` input, including its supplier subsection, by `NoncommutativeAndEquivariantIwasawa §§0.2, 0.6–0.7 (analytic_exists_open_uniform, UniformCoordinates.toHomeomorph and IsCompactPAdicAnalytic.analyticStructure)`. Retain the separate declared lattice-comparison gap for cohomology.

   **Repair check:** For U=ℤ₃² these coordinates are the identity, with level-3 quotient order 3⁶=729; U=1 has zero coordinates and quotient order 1. These are precisely the group and chart inputs §4.4 needs. No additional analytic-chart gap is necessary.

2. **F02** (P1) ANT is attributed to an unavailable roadmap instead of its existing owner

   **Location:** packages/GlobalGaloisDeformationsPartII/README.md:277–279, 1578–1589. “Consume PL.7, ‘The ANT lifting theorem with source primitivity’, and its full eight hypotheses.”

   **Claim:** PotentialAutomorphyInfrastructurePartII PL.6–PL.7 supplies the ANT theorem and its primitivity comparisons.

   **Witness:** `roadmaps show PotentialAutomorphyInfrastructurePartII` reports no such roadmap; `roadmaps grep 'PL\.7|PL\.6|source primitivity'` returns no match. ModularityAndLanglandsExtensions §4.2 already states ANT ordinary lifting with several residual constituents.

   **Exact repair:** Replace the PL.7 citations by `ModularityAndLanglandsExtensions §4.2, Ordinary lifting with several residual constituents (ANT Theorem 1.1)`. State primitivity there and in §10.2 as noninduction of the residual semisimplification over k̄. Delete the claimed PL.6 input: §10.2 already assumes that precise primitivity and the post-base-change constituent conditions, so no primitivity-replacement theorem is used. Update Scope, Exact supplier contracts and all dependency summaries consistently.

   **Repair check:** The existing §4.2 has CM input, ℓ>3, ℓ∤n, individual constituent polarization, ordinary weight, the characteristic-zero Steinberg-shaped local restriction, the ordinary Steinberg seed, both cyclotomic exclusions, primitivity and absence of an order-ℓ quotient. For n=2, ℓ=5 the numerical tests are 5>3 and 5∤2; n=5, ℓ=5 still fails. Retaining these tests neither strengthens nor weakens the advertised application.

3. **F03** (P1) The maximal-parabolic argument needs cohomology beyond the supplied adjoint module

   **Location:** packages/GlobalGaloisDeformationsPartII/README.md:574–583; compare its gap:character-twisted-adjoint-h1 at line 148. “Use the stipulated character separation, then the p-kernel factor argument and inflation–restriction.”

   **Claim:** §1.1 and the named finite-group inputs suffice to prove C4 in the property-D branch of §1.10.

   **Witness:** FKP22 line 2269 needs H¹ for the semisimplified ambient adjoint dual restricted to a Levi image. In SL₃ with block Levi (2,1), its radical has dimension 2; the Levi-derived adjoint has dimension 3.

   **Exact repair:** Add a contract at ArithmeticGaloisRepresentations §7.7, with the same new slug in the README and plan gaps: “For each split connected reductive root datum there is B such that, for finite k of characteristic p>B, a k-Levi L⊂G and a finite subgroup Γ⊂L(k)×k× whose projection is absolutely L-irreducible, H¹(Γ,(Lie(Gᵈᵉʳ)|Γ)ˢˢ∨⊗χ)=0, where χ is the second projection.” Cite this contract explicitly in §1.10, separately from the inflation–restriction and central-factor arguments. Alternatively give an explicit derivation from an existing supplier target with these exact coefficients; the adjoint-only gap is not that derivation.

   **Repair check:** For G=SL₃ and L=S(GL₂×GL₁), the restricted adjoint has graded dimensions 2+4+2=8, whereas Lie(Lᵈᵉʳ) has dimension 3. The new contract covers all eight dimensions and their common character twist. For a torus the ambient derived module is zero and H¹ has order 1. ArithmeticGaloisRepresentations §7.7 supplies restriction, coefficients, specific GL₂ calculations and descent; none is the general Levi-coefficient assertion. Its §7.9 adequacy target also does not state this coefficient interface.

4. **F04** (P2) The main general lifting results have been replaced by conditional versions

   **Location:** packages/GlobalGaloisDeformationsPartII/README.md:23, 785–799, 1117, 1363, 1500. “C1,C3,C4 are not asserted to imply this arithmetic hypothesis.”

   **Claim:** The package retains the full generality of its intended lifting endpoints while requiring the missing arithmetic selection construction as an additional hypothesis.

   **Witness:** FKP22 Theorem 5.2, line 1008, and Theorem 7.4, lines 1609–1615, have no selection hypothesis. README §2.9 computes a rank-1 inertia span inside a rank-2 product, so the missing step is substantive.

   **Exact repair:** Replace the scope's disclaimer by: “This roadmap owns the replacement auxiliary-prime selection theorem needed for doubling under C1,C3,C4 and the stated root-datum prime bound, including repeated simple constituents. Section 3.2 separates the elementary density estimate from that arithmetic construction; the latter is a target to be proved, not an extra hypothesis of the lifting endpoints.” State that construction with the actual Frobenius test maps, tuple-density normalization and finite-stage/coefficient-extension quantifiers. Remove the extra arithmetic-selection assumptions from the general lifting and application targets once their proof plans cite that owned target. Preserve the counterexample to the source's stronger independence lemma.

   **Repair check:** For two repeated scalar constituents, projected ranks remain 1 and 1 while the joint inertia rank remains 1<2. The repair does not assert their strong independence: it requires a different selection argument and retains these data in scope. Four repeated binary tests still have failure proportion 1/2, not 1/16. The package's present elementary probability estimate proves neither the missing arithmetic construction nor the advertised unconditional endpoints. This is a generality/ownership finding, not a claim that the explicitly conditional implications are false. The previous repair marked this scope change “applied differently”, not “not actionable”; the binding no-bypassed-theory requirement remains applicable.

5. **F05** (P2) Uniform H¹ torsion is a statable deep target missing from the acceptance test

   **Location:** packages/GlobalGaloisDeformationsPartII/Suggested.lean:11–14; packages/GlobalGaloisDeformationsPartII/README.md:916–933. “No headline theorem is statable at the pins.”

   **Claim:** None of this roadmap's deep results can be stated on the pinned carriers.

   **Witness:** Mathlib/Geometry/Manifold/Algebra/LieGroup.lean:72 has `LieGroup I ω G`; Mathlib/Geometry/Manifold/GroupLieAlgebra.lean:56,230,262 supplies its Lie algebra. TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:696–713 supplies actual continuous H¹ with joint continuity.

   **Exact repair:** Keep §4.4's degree-one uniform torsion theorem in Suggested.lean: for a compact Hausdorff finite-dimensional analytic group over ℚ_p with semisimple `GroupLieAlgebra`, and a finite free O-lattice with continuous O-linear action, there exists a natural exponent a such that every H¹ class with coefficients V/ϖʳ is killed by ϖᵃ, for every positive r. Use the native submodule quotient and actual continuous cohomology; scalar annihilation may equivalently be stated by a uniform p-power annihilator in its additive group. Put compactness, Hausdorffness, finite dimension, analytic regularity, semisimplicity, the finite extension O/ℤ_p and action continuity in the signature. Import the individual Tau Ceti cohomology module if used, and remove the blanket “No headline theorem” claim. No differentiated-action definition is needed for this independent degree-one assertion.

   **Repair check:** The semisimplicity predicate is `LieAlgebra.HasTrivialRadical` in Mathlib/Algebra/Lie/Semisimple/Defs.lean:64. For Γ=C₃ acting by ζ₃ on ℤ₃[ζ₃], the Lie algebra is zero and H¹(V/ϖʳ) has order 3 for every r, killed by ϖ and by 3. For Γ=ℤ₃ with trivial lattice, H¹ has exponent 3ʳ; its one-dimensional abelian Lie algebra fails semisimplicity. These are precisely §4.4's unrestricted-invariants degree-one assertion, not boundary substitutes for a missing arithmetic theorem. No one-library-lemma proof of this uniform result occurs at the pins.

6. **F06** (P3) The factor-orbit Check forms quotients that do not exist

   **Location:** packages/GlobalGaloisDeformationsPartII/README.md:1073. “For two simple factors exchanged by C₂, the product over the common component quotient has component order 2”.

   **Claim:** Two exchanged factors provide two component extensions whose fibre product illustrates orbit recombination.

   **Witness:** In (SL₂×SL₂)⋊C₂ with swap σ, σ(a,1)σ⁻¹=(1,a). Projection to the first factor sends these to a and 1, so it cannot define a quotient retaining σ when a≠1.

   **Exact repair:** Replace this Check by: “For four simple factors, with C₂ swapping the first pair and the second pair, there are two stable factor orbits. Each orbit quotient has component group C₂. Their fibre product over that common C₂ has component order 2, whereas their unrestricted product has component order 4 and includes the mismatched components (0,1) and (1,0). For just two exchanged factors there is one orbit and no such decomposition into two orbit quotients.”

   **Repair check:** The four-factor projections have stable kernels, so both are homomorphisms. The matching component pairs are exactly (0,0),(1,1), of cardinality 2; the unrestricted set has 4. The original two-factor example has exactly one orbit.

7. **F07** (P2) The extension convention for property D omits inseparable extensions

   **Location:** packages/GlobalGaloisDeformationsPartII/README.md:554. “every finite extension F′/F” and “embeddings of F′ into a separable closure”.

   **Claim:** The stated separable-closure embedding convention defines every restriction quantified by D(s,t,N), also over global function fields.

   **Witness:** Take F=𝔽₂(t), F′=𝔽₂(t¹ᐟ²), p=5 and N=2. The extension has degree 2 and admits no F-embedding into F's separable closure.

   **Exact repair:** Replace the last sentence about embeddings by: “Fix an algebraic closure of F. For every finite extension F′/F, use its F-embedding into that algebraic closure and the induced map of absolute Galois groups. The inequalities are independent of this choice. A purely inseparable extension induces an isomorphism of absolute Galois groups. Equivalently, D(s,t,N) may be tested on finite separable extensions of degree at most N.” Keep the quantification over all finite extensions; its separable reformulation is equivalent rather than a reduced scope.

   **Repair check:** With χ=1 and s=t=1, the mod-5 cyclotomic character over 𝔽₂(t) has order 4. It still has order 4 after the displayed purely inseparable degree-2 extension. A separable quadratic constant extension reduces its order to 2, still nontrivial. Killing it requires degree 4>N. Thus D(1,1,2) has a defined, true value on this datum after the repair. The original separable-closure convention has no embedding on which to evaluate the quantified inseparable case.

## Verified sound

Read all 1,644 README lines and all 44 Suggested.lean lines, the repository rules, the design's gap register and the latest repair record. There are 81 numbered targets, not bold target labels, and 185 bulleted Checks attached to those targets. The table below retains sampled mathematical probes, including the assertions that require repair. The six standing-convention Checks and the supplier-contract computations were also evaluated. Suggested.lean has **0 declarations, 0 section variables and 0 instance contexts**: its only command beyond the import is its namespace wrapper. Consequently there are 0 duplicate fully qualified names, 0 padding declarations and 0 elaborated signatures to compare.

The statement table uses the standing context explicitly: finite nonzero k of odd characteristic p; O the characteristic-zero complete DVR of a finite extension of ℚ_p; finite ramification sets; smooth G with split reductive identity component and prime-to-p component group; positive coefficient indices. A stated p>B_G bound is additional to very-good characteristic. Number-field geometric assertions separately require total reality and a de Rham fixed quotient. Function-field duality uses nonempty S and coefficients prime to the field characteristic. Results below that invoke a declared gap are conditional on that exact contract, rather than evidence that the supplier has already proved it.

### Sampled adversarial instances

The retained rows span every layer and include the findings’ counterexamples. Values compare the intended construction with a boundary case or a plausible wrong construction. “Retain” refers only to the tested assertion, not a proof of the entire roadmap.

| Statement | Instances and computed values | Result and change |
|---|---|---|
| Suggested.lean, module and namespace | 44 lines; 1 import; 0 theorem/definition/instance signatures; 0 retained implicit binders | Empty context is consistent, but the blanket nonstatability claim fails: R05. |
| Conventions: coefficients and depth | e=2,D=1 gives central level 2 and first noncentral level 3; ramification 3 sends original ϖ² to ϖ′⁶; N=8,M=2 gives N−M=6=3M | Retain positive indices and original-uniformizer accuracy. A field, zero ring, equal-characteristic coefficient DVR and q=1 fail the declared context. |
| Conventions: root bounds | SL₄ over 𝔽₃ has 0 regular diagonal elements although 3∤4; over 𝔽₇ there are 840 distinct ordered quadruples and 120 of trace zero. SL₂/𝔽₃ has dα(diag(1,−1))=2 | Retain distinction between very good and sufficiently large; the explicit sl₂ exception survives this probe. |
| Conventions: dual, sign, weight | κ̄=2 in 𝔽₅ gives one twist 2, two twists 4; cup matrix [[0,−1],[1,0]]; classical weight 2 gives {0,−1}, ordinary symplectic weight zero in dimension 2 gives {0,1} | Retain the specified dual and the two different determinant conventions. |
| 0.2 Oddness | At p=3, diag(1,−1) acts on sl₂ with eigenvalues (1,2,2): fixed dimension 1=flag dimension. Scalar action gives 3≠1. Torus over an imaginary quadratic field gives 0=0 | Both directions of the GL₂ determinant criterion pass; total reality remains separate for tori. |
| 0.5 Cocycle fields | Zero image has order/degree 1. A prime-field line in 𝔽₉ has image/degree 3, not 9. Three quadratic subfields of a biquadratic extension give compositum degree 4 versus product 8 | Retain actual additive image and strong, not pairwise, disjointness. Empty family has degree/product 1. |
| 1.7 GL blocks | Independent order-10 κ̄,ψ give remaining cyclotomic degrees 10,10,5 for ψ,κ̄ψ,κ̄ψ², but joint degree 1. Conjugating diag(1,−1) by I+E₁₂ adds −2E₁₂ | Joint-field condition and injection by Levi projection survive; literal containment in a chosen Levi would fail. |
| 1.9 Property D | (m₁,m₂)=(0,0) compares 1 with κ̄ˢ; if κ̄ˢ=1 it fails. χ=κ̄ with (1,0) compares equal characters. χ=1, ord κ̄=5,N=4: every χᵃκ̄ has order 5; degree 5 kills it | Both directions of the prime-field order criterion pass. Zero exponents cannot be discarded. The inseparable-extension convention needs R07: over 𝔽₂(t), p=5, χ=1,N=2, cyclotomic orders are 4 before and 4 after a purely inseparable quadratic extension. |
| 1.10 Maximal separation | Blocks (2,4): primitive exponents (2,−1), gcd 1, common-scalar value c⁴c⁻⁴=1. SL₃ restricted adjoint dimensions 2+4+2=8 versus Levi-derived adjoint dimension 3 | Character normalization passes; the cohomological coefficient input is missing: R03. |
| 2.3 Stabilization | 𝔽₃[x,y]/(x,y)² has dimension 3, socle dimension 2 and cyclic generator 1; its dual has coinvariant dimension 2, whereas a cyclic module has coinvariant dimension ≤1 | Stabilize duals of cyclic modules, not merely cyclic modules in the dual. The finite set of modules permits successive minima. |
| 2.9 Conditional product statement | Repeated scalar constituents give projected ranks 1,1, joint rank 1, quotient rank 1. Repeated old differences yield relation (1,−1,−1,1); 1−1=0 at new inertia | The conditional assertion and counterexample are consistent. Its replacement in the general proof remains unproved: R04. |
| 3.2 Density selection | ε=1/2,s=4: independent failure 1/16<1/10; repeated binary failure 1/2. ε=1,s≥1: bound 0; s=0: bound 1. Alternating sequences each have limsup 1 while product limsup is 0 | Elementary estimate passes. No arithmetic construction with these conditional proportions is provided: R04. |
| 3.3 Local pairing | Over 𝔽₅, u=(1,0),t=(0,1): pairings (u,t),(t,u),(u,u),(t,t) are 4,1,0,0. Inverting σ negates its coordinate | Sign agrees with geometric reciprocity and arithmetic Frobenius; keep calibration. |
| 3.4 Doubling | p=5: −1=4,2=2 and −Y+2Y=Y; p=3: both coefficients 2; p=2: second coefficient 0 | Algebraic corrections pass; existence of suitable pairs is conditional as in R04. |
| 4.2 Coefficient exactness | C₃ acts by 4 on ℤ/9: connecting value (4−1)/3=1; cocycles and coboundaries are both {0,3,6}, giving H¹ at level 2 zero, while residual H¹ has dimension 1 | Middle exactness survives; injection fails without residual H⁰=0. Dual coefficient arrows reverse a,b. |
| 4.4 Uniform torsion | Lie sl₂ on a trivial line: rational H¹,H² dimensions 0,0 but H⁰ dimension 1. C₃ acting by ζ₃: all finite-level H¹ have order 3 and uniform annihilator ϖ. Trivial ℤ₃ action: exponent 3ʳ | Mathematics passes these controls; fix supplier R01 and acceptance test R05. |
| 4.6 Q_N | O=ℤ₃,M=2,N=8: v₃(19−1)=2 passes, v₃(109−1)=3 fails. A second root value 1 mod 27 fails. Scalar 2I is central but not identity. Gₘ has 0 roots and Q_N density 0 | Retain exact depth, chosen root/torus and positive derived rank for density. |
| 5.2 Simultaneous root position | For A=h and B(E₁₂)=1 in sl₂/𝔽₃, dα(A)=2, B(E₁₂)=1; trace Gram determinant −2=1. Exhaustive finite-field probes: 676 nonzero pairs at p=3 and 15,376 at p=5, with 0 failures in each | Both nonzero hypotheses and odd characteristic matter: A=0 or B=0 gives a zero test, and p=2 makes the Gram determinant 0. |
| 5.5 Factor-orbit recombination | Two exchanged factors have 1 orbit. Four factors swapped in two pairs have 2 orbits; matching component pairs number 2, unrestricted pairs 4 | Target uses valid orbit quotients; replace its two-factor Check: R06. |
| 6.2 Frattini detection | ℤ₃/3ℤ₃ has order 3. Closed subgroup 3ℤ₃ has image order 1; proper dense ℤ has image order 3 | Closedness is indispensable; compact Galois image in a Hausdorff target supplies it. |
| 6.3 Geometric lifting | Gₘ: derived dimension 0, kernel order 1, only lift μ. GL₂: derived dimension 3; finite determinant has central closure dimension 0. Original t=2, ramification 3 gives new depth 6 | Quantifier order O′ before t is retained. General endpoint is weakened by the new hypothesis: R04. |
| 7.1 Levi lattice change | Adjoint diag(t,1) is not an SL₂ cocharacter; its double lifts to diag(t,t⁻¹). Ramification 3 yields positive exponents 2 and 1 | Actual cocharacter lift and coefficient extension correct the source step; integral full-image claims are not transported. |
| 7.4 Local unipotent lift | p=3,q=7: the selected square root x satisfies x²=7 and conjugation scales u(a) to u(7a). Central correction changes multiplier 1 to prescribed μ(σ) without changing 7 | Retain unramified residually trivial μ and the central correction. At p=2 the derivative 2 is not a unit. |
| 8.1 Actual modularity | In characteristic 3, I and I+E₁₂ have equal trace 2 but ranks(g−I) 0,1 and fixed dimensions 2,1. Λ→3Λ preserves reduction dimension 2 | A full intertwiner distinguishes the actual representation. Homothety preserves it; semisimplification alone does not. |
| 8.8 Infinitely many extensions | Split maps i(a)=(a,0),q(a,b)=b have rank 1,1 and equal range/kernel. Zero maps have rank 0,0; q(a,b)=a gives qi=1. C₃ has dim H¹=1/one nonzero projective class; C₃² has dim H¹=2 and distinct (1,t). Over 𝔽₃ there are only 4 projective points | Infinite-field and dimension>1 assumptions discriminate the conclusion. For χ=1, the two orientations are one family. |
| 8.9 Stable segment | min v(b)=2,min v(c)=1 gives s∈{−2,−1,0,1}: 4 vertices, 2 nonsplit endpoints. Ramification 3 gives −6≤s≤3: 10 vertices, the same two nonsplit classes plus split class | Apartment bounds, endpoint orientation and coefficient-extension assertion pass; no assertion that all new vertices descend. |
| 8.11 Fixed-level obstruction | p=5,χ̄=κ̄,S={5}: Kummer dimension 1, so quotient H¹ dimension≤1. S′={5,11}: valuation vectors (1,0),(0,1) give dimension 2. Infinite (1,t) minus ≤3m classes stays infinite | Retain enlargement of S before claiming a two-dimensional finite-quotient H¹. |
| 9.2 Lifting to automorphy | p=3,n=2: derivative of the power map is 2, a unit; n=3: derivative 0 mod 3. Finite Teichmüller determinant order divides q−1 | Retain p∤n, finite determinant and R04's outstanding general selection theorem. |
| 9.3 Irreducible specialization | Constant field q≡−1 mod p gives cyclotomic values 1,−1 on even/odd degree. Induction from the quadratic constant extension gives 0 invariant lines before restriction and 2 after, with κ̄ in the adjoint | Retain cyclotomic absolute irreducibility and field-dependent degree bound; irreducibility over F alone is insufficient. |
| 10.1 Symplectic ordinary lift | n=1,ξ=0: weights 0,1, multiplier weight 1. n=2: 0,1,2,3 with sums 0+3=1+2=3. Infinite multiplier has central dimension 1 versus finite multiplier 0 | Sign, regularity and full-central-density test pass; the two auxiliary residue characteristics are needed later. |
| 10.2 ANT application | Swap polarization fixes diag(1,−1); individual block polarization negates each scalar. For n=2, gl₂/sl₂ dimensions are 4/3. Dimension d=2,p=5 gives 5>3 and 5∤2 | Individual polarization and all eight conditions must stay; replace the supplier as R02. |
| 10.3 Compatible system | Steinberg residue characteristics 2,5: coefficient ℓ=2 uses 5 and ℓ=5 uses 2. Principal SL₂ and Sp₂ both have rank 1; principal SL₂ and Sp₄ have ranks 1,2 | Retain two places and the separately declared formal-character/monodromy contract. |


The automatic finite probes for §5.2 enumerated SL₂(𝔽ₚ), all nonzero trace-zero A and all nonzero trace-dual B, and searched conjugates of the standard torus/root. They are finite counterexample probes, not proofs of the general root-position theorem. Nonabelian controls also included S₃ and the order-27 Heisenberg group. No Lean build or elaboration was run.

### Registered contracts

All **28** gap slugs, named suppliers and needs sentences match between packages/GlobalGaloisDeformationsPartII/design/plan.json and the README's Exact supplier contracts. None has supplier `none`. These are declarations of missing exports, not false claims that today's suppliers already provide them. Their related compatibility clauses specify single usable interfaces rather than unrelated work bundles. The finite-field, fixed-quotient, lattice-sensitive and all-place extensions were compared with the existing supplier scopes; no duplicate exact contract was found. The additional unregistered coefficient requirement in R03 is distinct.

For the additional descent Check, a rank-one Satake value 2 becomes 4 over an inert quadratic extension. The quadratic character restricts to 1; twisting a rank-two descent changes trace t to −t and determinant d to d. Thus base change alone does not choose the descent twist.

### Supplier and ownership resolution

Checked **28 named supplier subsections** against main or the specified current open head: **26 resolve; 2 fail as R01 and R02**. This includes imports whose extra exports are explicitly registered gaps; resolving a section does not certify its future implementation.

Ownership searches used the roadmap index's object search and the main/Completed trees, board packages and all **55 specified sibling checkouts**. Searches included relative Selmer images, joint inertia, cyclic prime-field spans, central Γ-series, stable lattice segments, compact-group torsion and the individual generic carriers. Existing owners are used for spans, exact sequences, cohomology, lattice orientations, Langlands correspondence and compatible systems. This package's added arithmetic selection, relative finite-prime construction, segment-extension analysis and application with an actual retained lattice are extensions rather than duplicate generic constructions. No duplicate declaration name can arise from its empty Lean namespace. Ownership against unnamed or unavailable open heads was not certified; no additional pull-request discovery was used as a substitute for the supplied checkouts.

Pinned declarations were read by object as well as by name. In particular, Mathlib Representation is a homomorphism to linear endomorphisms, without continuity; TopRep has individually continuous operators, not automatic joint continuity. IsAbelianGalois includes Galoisness and commutativity, not finiteness. Submodule.map is an actual image, not an unspecified Selmer condition. Mathlib's absolute-Galois Tate–Shafarevich kernel is not the restricted-ramification carrier. Tau Ceti's H¹ and explicit inflation–restriction have their continuity and normal-subgroup hypotheses. None of those native objects by itself supplies the missing arithmetic fixed-quotient or local Hodge data.

| Pinned declaration family | File and checked locator |
|---|---|
| Representation; Rep.of | Mathlib/RepresentationTheory/Basic.lean:48; Mathlib/RepresentationTheory/Rep/Basic.lean:62 |
| Representation.IntertwiningMap; Representation.Equiv | Mathlib/RepresentationTheory/Intertwining.lean:36,312, structures with the intertwining law |
| groupCohomology.H1 | Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean:965 |
| TopRep; continuousCohomology | Mathlib/RepresentationTheory/Continuous/TopRep.lean:31; Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131 |
| ContinuousCohomology.tateShafarevich | Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:71 |
| CategoryTheory.ShortComplex.ShortExact | Mathlib/Algebra/Homology/ShortComplex/ShortExact.lean:34 |
| Submodule.span, subset_span, span_le, map_span | Mathlib/LinearAlgebra/Span/Defs.lean:46,75,80; Mathlib/LinearAlgebra/Span/Basic.lean:73 |
| Submodule.map; AddSubgroup.map | Mathlib/Algebra/Module/Submodule/Map.lean:52,89; additive declaration generated from Mathlib/Algebra/Group/Subgroup/Map.lean:112 |
| CompositionSeries.jordan_holder | Mathlib/Order/JordanHolder.lean:454 |
| IsAbelianGalois | Mathlib/FieldTheory/Galois/Abelian.lean:25; underlying IntermediateField, Normal and IsGalois carriers also exist |
| TauCeti.ContCohomology.H1 | TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:696–713 |
| TauCeti.ContCohomology.explicitInfRes_exact | TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation/Basic.lean:350 |

The dependency checker was run read-only with the requested name, order and movable mode. Its complete output was:

```text
depcheck: 56 roadmaps, 661 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. This graph result does not resolve a nonexistent supplier section or fill an undeclared coefficient theorem. Internal given-tower uses in Layers 4–6 were distinguished from constructing the tower: §6.6 explicitly owns its separate K′ construction and does not acquire §3.2 as a premise through that given-tower interface.

The head diff contains 9 changed files, all within packages/GlobalGaloisDeformationsPartII. Suggested.lean has the single import Mathlib, no set_option, no lemma, no admitted data or examples and no process narrative. No computational algorithm is a roadmap target. Every numbered README target has a source locator. Only this report and scratch notes were written during the review.

### Acceptance-test coverage

| Headline from the README | Pinned statement assessment and module-docstring coverage |
|---|---|
| §3.6 controlled towers | Fixed-quotient arithmetic datum and local lifting conditions missing; named in docstring. |
| §4.4 uniform compact-group H¹ torsion | Native analytic group, semisimple Lie algebra, finite lattice quotient and continuous H¹ suffice. Omitted and incorrectly declared nonstatable: R05. |
| §5.4 annihilation of relative Selmer images | Arithmetic adjoint coefficient system and root local conditions missing; named in docstring. |
| §§6.1,6.3–6.6 finite-ramification/geometric/sl₂/nongeometric/irreducible lifting | G-valued deformation data, local components and de Rham conditions missing; named collectively, with §6.6 explicitly distinguished. |
| §§7.6–7.8 derived-dense Levi lifting | Arithmetic lifting datum and integral comparison missing; named in docstring. |
| §8.5 actual reducible modularity, arbitrary weight and Serre-weight prime-to-p level | General newform attachments with stable lattices and extension-sensitive local weight missing; named in docstring. |
| §8.10 fixed-weight-level finiteness | General newform attachments with their lattices missing; named in docstring. |
| §§9.2–9.5 actual function-field automorphy and block applications | Global automorphic/attachment carriers and integral witnesses missing; named in docstring. |
| §§10.1–10.2 ordinary symplectic lifts and ANT application | Ordinary deformation and automorphic attachment interfaces missing; named in docstring. |
| §10.3 strictly pure symplectic system | Compatible-system, strict-purity and all-place monodromy interfaces missing; named in docstring and correctly assigned to suppliers. |

The generic extension classification and lattice computations in §§8.8–8.9 are intermediate inputs, not a reason to fill the acceptance file with auxiliary APIs. Conversely §4.4 is expressly owned here as a substantive uniform-cohomology application. Its degree-one statement needs no dummy arithmetic carrier. A one-tactic padding probe has no declarations to test in the submitted file.

### Locator audit

The README has **128 distinct explicit source-line anchors**: FKP22 77, FKP19 41, Ribet10 7, LP11 1, ANT20 1 and Pan22 1. Their referenced passages were resolved in the supplied legal cache. The nine readable manifest works were consulted, including the named locators without line anchors below. “Resolved” certifies the location and comparison made, not the correctness of every source argument: the exceptions are recorded under Source issues. No additional source key or missing-source request was necessary.

| Source | Locators compared with the package and material outcome |
|---|---|
| FKP22 | §§1–2; Lemma 2.1; Assumptions 3.1,4.1,5.1; Definition 3.2; Lemmas 3.4,3.7; Propositions 3.6,3.8; Lemma 4.3; Theorems 4.4,5.2,5.6; Lemma 5.3, Proposition 5.4, Corollary 5.5; Lemmas 6.1–6.5, Corollary 6.6, Remark 6.7, Example 6.8; Lemmas 7.1–7.3,7.6, Theorem 7.4, Proposition 7.7, Remarks 7.5,7.8; Theorem 8.1, Remark 8.2, Corollaries 8.3–8.4; Proposition 9.1; Appendix A and Appendix B ordinary definition/components. The cache is the cited arXiv v5 pagination. Corrections to the source's independence and character assertions are substantive. |
| FKP19 | Definition 1.2; §2 and Assumption 2.1; Lemmas 3.5,3.9; Proposition 4.7 and Lemma 4.9; §5.1, Definition 5.8, Proposition 5.9, Lemma 5.11, Proposition 5.12, Theorem 5.14; Lemmas 6.1–6.4, Definition 6.6, Lemma 6.7, Proposition 6.8, Theorem 6.9, Theorem 6.11 and Claims 6.13–6.14, Lemma 6.15, Theorem 6.21; Proposition 7.8 and Remark 7.9; Appendix A and Lemma B.1/Corollary B.2. The K′ base field, Tate-dual arrows and approximation quantifiers were compared explicitly. |
| Ribet10 | Proposition 1.4, Lemmas 1.3–1.5 and Exercises 1.5–1.7,1.10, pp.6–8. The direct apartment computation independently verifies the endpoint/subdivision claim; the entire extended tree need not descend. |
| LP11 | Theorem 0.2, p.1106, and §12, p.1156. The normal-series theorem and its central strengthening do not themselves state all the requested H¹ vanishings. |
| Lazard65 | III Proposition 3.1.3, pp.91–92; III Theorem 3.1.7.4, p.94; V Theorems 2.2.2.3,2.2.3.1, pp.165–166, and 2.4.10, pp.178–179. The finite free resolution, Ext and Lie comparison are distinct steps. |
| ANT20 | Theorem 1.1, pp.1–2, and notation/ordinary characters, pp.3–4, arXiv v2. All eight hypotheses, residual semisimple primitivity, individual polarization and the coefficient-prime restrictions were retained in the comparison. |
| BLGHT11 | Lemma 5.1(2), pp.34–35: tame regular unipotence and the Frobenius eigenvalues in a Steinberg-shaped local parameter. |
| Pan22 | Theorem 1.0.2, p.3, arXiv v2: potentially semistable irreducible odd input, distinct weights, reducible residual semisimplification and the p=3 ratio exclusion; scalar ratio 1 is not excluded. |
| BLGGT14 | Proposition 3.1.1 and Theorem 3.1.2, pp.529–530; Lemma 5.3.1, pp.580–581; Theorem 5.5.1 and proof, pp.590–593. The potential-automorphy seed, compatible-system construction and formal-character input are not interchangeable assertions. |

## Not verifiable

- Gur99 Theorem A; NSW08 Theorems 8.6.7,8.6.10,8.7.9; BC14 Lemma 10/Proposition 11, pp.9–10, and Definitions 29–30/Proposition 32, pp.16–17: settled locator-only, uncertified sources. Their full texts were not requested again. The stable-segment calculation was checked directly and against Ribet10, without pretending to certify BC14's text.
- The 28 registered supplier contracts are accepted as declared future exports. Their presence in both intake locations was checked; their future Lean implementations and proofs cannot be certified from planning documents. R03 identifies one additional needed coefficient contract rather than reopening those 28 gaps.
- No Lean execution was authorized or performed. The worker's reported signature-wrapper error is at line 46 while the submitted Suggested.lean has 44 lines and no declarations. It is not evidence of an elaboration defect in this file. There are no `#check @name` outputs to compare. R05's proposed new statement has been checked against native carrier definitions, not elaborated here.
- The general arithmetic selection construction is not currently supplied by the package. Its explicitly conditional endpoints cannot be certified as the intended unconditional general lifting results; this is R04, not a missing-text request.
- Source verification used the cached versions and their pagination, not an assertion that all later published versions have identical numbering. No published correction was confirmed for the source issues below. No missing-reference file was created because all unavailable works were already settled as uncertified.
- This pass is a counterexample, scope, ownership and proof-input audit. The finite probes do not constitute proofs of the remaining deep theorems, and future supplier implementations were not built.

## Source issues

- **Error** in FKP19 at discussion after Definition 1.2, printed p.3 (FKP19 line 114): the source says numerical oddness forces total reality; it should be restricted to positive derived dimension, since a torus has fixed and flag dimensions zero; affects a stated result.
- **Misprint** in FKP22 at proof of Lemma 3.4(2), printed p.12 (FKP22 line 510): the source says the dimension increase is always one; it should be dim_𝔽p(𝔽p Z), zero for Z=0 and one otherwise; affects the proof.
- **Misprint** in FKP22 at Remark 3.5, printed p.12 (FKP22 line 513): the source says the duals of cyclic submodules are cyclic quotients; it should be dual quotients of cyclic submodules, which need not themselves be cyclic; affects the proof.
- **Error** in FKP22 at Lemma 3.7 and its use in Proposition 3.8, printed pp.15–19 (FKP22 line 666; FKP22 line 678; FKP22 line 799): the source says individual cyclic inertia images give independent products across new primes; it should be require joint generation or replace the independence argument, since repeated constituents yield unramified common quotients; affects a stated result.
- **Gap** in FKP22 at proof of Lemma 6.1, printed p.28 (FKP22 line 1241): the source says an adjoint-torus cocharacter evaluated on a uniformizer gives an element of G; it should be lift a positive multiple to G, or justify lifting after coefficient extension; affects the proof.
- **Gap** in FKP22 at Lemma 6.2, printed p.28 (FKP22 line 1255): the source says W′-trivial primes permit identifying H¹ with homomorphisms valued in W; it should be choose primes trivial for W as well as W′; affects the proof.
- **Gap** in FKP22 at proof of Theorem 7.4, printed p.36 (FKP22 line 1636): the source says the chosen potentially unramified local correction extends globally unramified outside p; it should be first remove its unramified factor and normalize its uniformizer value to one; affects the proof.
- **Error** in FKP22 at Proposition 7.7, printed p.37 (FKP22 line 1676): the source says the finite-quotient family over the finite coefficient field is infinite; it should be allow an infinite coefficient field or finite extensions inside its algebraic closure; affects a stated result.
- **Error** in FKP22 at Appendix A setup, printed p.44 (FKP22 line 1987): the source says the opposite unipotent Lie algebra carries the adjoint P-action; it should be use the P-module g/p and identify it with the opposite radical only as a Levi module; affects the proof.
- **Misprint** in FKP22 at central-series setup, printed p.44 (FKP22 line 2008): the source says successive factors Σᵢ₊₁/Σᵢ are indexed from 1 through n; it should be index them from 0 through n−1; affects a stated result.
- **Gap** in FKP22 at proof of Lemma A.4, printed p.44 (FKP22 line 2018): the source says the subgroup kernel may be replaced by the whole unipotent group; it should be first compare factors using intersections with the ambient central filtration; affects the proof.
- **Error** in FKP22 at Lemma A.9 and Corollary 8.4, printed pp.46–47,39–40 (FKP22 line 2097; FKP22 line 2123; FKP22 line 1796): the source says separate determinant-field degree bounds force cyclotomic separation from their compositum; it should be require the joint determinant field: κ̄ψ and ψ together recover κ̄ although their individual intersections can be trivial; affects a stated result.
- **Error** in FKP22 at Lemma A.9, printed p.46 (FKP22 line 2099): the source says adjoint invariants literally lie in the selected Levi center for parabolic-valued representations; it should be assert injectivity of Levi projection, with literal containment only for Levi-valued representations; affects a stated result.
- **Error** in FKP22 at Appendix A.1.2 setup, printed p.47 (FKP22 line 2129): the source says the derived group of GLₙ×Gₘ is its GLₙ factor; it should be SLₙ, while the multiplier kernel has Lie algebra glₙ; affects a stated result.
- **Error** in FKP22 at proof of Lemma A.10, printed p.47 (FKP22 line 2144): the source says polarization negates all constituent scalar invariants; it should be require individual constituent polarization and retain X↦−AXᵗA⁻¹, since a swapping pairing fixes a scalar difference; affects the proof.
- **Error** in FKP22 at Lemma A.11(2) and its proof, printed pp.47–48 (FKP22 line 2163; FKP22 line 2194): the source says the Siegel radical is Sym² of the GL block without a similitude factor; it should be Sym²r⊗δ⁻¹, with invariant and twisted tests using multipliers δ and δκ̄⁻¹; affects a stated result.
- **Error** in FKP22 at Example A.16, printed p.50 (FKP22 line 2289): the source says the adjoint-Levi quotient character is det r; it should be (det r)/δ, which equals one on the central point (cI,c²); affects a stated result.
- **Error** in FKP22 at Example A.17, printed p.50 (FKP22 line 2296): the source says comparisons of only the two nonzero powers suffice for property D; it should be retain comparisons with either exponent zero, including the cyclotomic-only comparison; affects a stated result.
- **Misprint** in FKP22 at ordinary-weight calculation before Proposition 9.1, printed p.41 (FKP22 line 1861): the source says ordinary weights have the negative sign under HT(κ)=−1; it should be ξ_{τ,n−i+1}+i−1, giving 0,1 in weight-zero dimension two; affects the proof.
- **Gap** in FKP22 at final proof of Proposition 9.1, printed p.43 (FKP22 line 1959): the source says one Steinberg place gives regular unipotence for every coefficient characteristic; it should be provide two distinct residue characteristics and use an away-ℓ place for each ℓ; affects the proof.
- **Misprint** in FKP19 at the dimension formula following Claim 6.13, printed p.52 (FKP19 line 2336): the source says the p-adic fixed-type dimension adds one flag dimension; it should be add [F_v:ℚ_p] times the flag dimension; affects the proof.
- **Misprint** in FKP19 at proof of Claim 6.14, printed p.54 (FKP19 line 2435): the source says the lifting correction is a cocycle in the Tate-dual adjoint; it should be a cocycle in the primal adjoint, as required by the preceding localization diagram; affects the proof.
- **Misprint** in FKP19 at proof of Lemma B.1, printed p.64 (FKP19 line 2862): the source says the universal-coefficient terms for M/ϖᵐ use reduction modulo ϖⁿ; it should be modulo ϖᵐ on both right-hand terms, with n reserved for the torsion bound; affects the proof.
- **Misprint** in Ribet10 at proof of Proposition 1.2, printed p.4 (Ribet10 line 161): the source says a reduction equals its own semisimplification; it should be the semisimplifications of the reductions for the two lattices are isomorphic; affects the proof.
- **Error** in Ribet10 at Remark 1.1, printed p.6 (Ribet10 line 228): the source says opposite nonsplit orientations are necessarily nonisomorphic; it should be require distinct residual characters, since for coincident characters the two orientations need not differ; affects a stated result.
- **Misprint** in Ribet10 at proof of Proposition 1.4, printed p.7 (Ribet10 line 278): the source says an endpoint reduction is not indecomposable; it should be indecomposable, equivalently the indicated extension is nonsplit; affects the proof.
- **Misprint** in Ribet10 at proof of Proposition 1.4, printed p.7 (Ribet10 line 286): the source says both endpoints give the same extension orientation; it should be opposite orientations, interchanging χ₁ and χ₂ at the second endpoint; affects the proof.

- **Error** in FKP22 at Lemma A.11(4)(b), printed p.48 (FKP22 line 2175): the source says the even-orthogonal maximal-isotropic test excludes alternating forms with multiplier κ̄; it should be exclude multiplier κ̄⁻¹ for vanishing of H⁰(Λ²r(1)); affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a63f5501c36a2bd69a72dcf67a7c57071e455c8d", "job": "RT-GlobalGaloisDeformationsPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
