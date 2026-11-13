# Review of OrdinaryAutomorphicFormsAndModularityLiftingPartII (pull request #2268 at 7bc4293)

**Verdict:** needs changes

## R01 (P2) — Resolve the existing reasonableness ownership contract

**Location:** `TauCetiRoadmap/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:586`, “Define a subgroup H ⊂ GSp₄(k) to satisfy the reasonableness conditions”.
**Claim:** The definition, stabilization of H_n and adequacy implication in §5.2 duplicate the declared reasonableness contract assigned to ArithmeticGaloisRepresentations by another open roadmap.
**Witness:** PR #1746, `TauCetiRoadmap/AbelianSurfacesModularity/README.md:86`, assigns Whitmore Definition 3.19 and Lemma 3.20 to ArithmeticGaloisRepresentations; `packages/AbelianSurfacesModularity/design/plan.json:3022` declares the same gap. Its general reductive-group contract includes GSp₄.
**Repair:** Import the definition and Lemma 3.20 from ArithmeticGaloisRepresentations §7.9 through the shared declared gap `near-adequacy-reasonableness`, recording it in this package's plan and supplier contracts. Retain §5.2's symplectic refinements, examples and restriction analysis; change the ownership sentence to “Section 5.2 specializes the supplied reasonableness condition to GSp₄ and proves the symplectic refinements.” The supplied dual adjoint specializes to the same ten-dimensional 𝔰𝔭₄^∨.

## R02 (P2) — The paired-support supplier requires unavailable dimension hypotheses

**Location:** `TauCetiRoadmap/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:720`, “M^χ_∞ has full support on it (DeformationAndDerivedPatchingAlgebra §9.6)”.
**Claim:** Section 9.6 cannot be invoked on the full patched rings with the hypotheses established here. It requires their dimensions, whereas §6.2 deliberately establishes dimensions only for selected components. Passing to selected quotients also requires a new argument about the modules.
**Witness:** PR #1034, `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:1869`, requires dim R = dim R′ = D. Here §6.2's model has D = 1 and dim O⟦x,y⟧/(ϖx,ϖy) = 2.
**Repair:** Remove §9.6 from the supplier contract and Layer 6 dependencies. Replace the invocation in (iii) by: “By 6.2 every component of Supp M^χ_∞ has dimension D = dim S_∞. A component generalizing Z lies in the unique selected χ-component through Z, also of dimension D, and therefore equals it.” Retain the subsequent specialization and unique-generalization argument, using §6.1 of the patching supplier for finite-module support. This uses the selected dimension D and remains valid when the ambient ring has larger dimension.

## R03 (P3) — Correct the two stale Check locators

**Location:** `TauCetiRoadmap/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:769`, “(1.4, first Check)”; line 784, “(2.2(1) and its last Check)”.
**Claim:** Both references point to a different example from the one invoked in the correction.
**Witness:** `TauCetiRoadmap/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:219` is §1.4's third Check, the induced-representation coboundary. Line 282 is §2.2's fifth, penultimate Check, the zero ordinary module; its last Check concerns faithfulness over Λ.
**Repair:** Replace the references by “(1.4, third Check)” and “(2.2(1), Check on the zero ordinary module)”, respectively.

## Verified sound

The seven headlines are §§1.2(4), 3.2(b), 4.7, 4.8, 5.3, 6.3 and 6.4; all seven are named with missing carriers in `Suggested.lean`.

| Statement | Instances tried | Computed value | Required or competing value | Result / change |
|---|---|---|---|---|
| Conventions: geometric Frobenius | p = 7, q = 2 | 2⁻¹ = 4 in 𝔽₇ | Arithmetic Frobenius gives 2 | Distinguishes conventions |
| Conventions: full adjoint | n = 1, K = ℚ₃, O = ℤ₂ | ad has dimension 1; ad⁰ has dimension 0 | H² has dimension 1; ring has u² + 2u = 0 | Full adjoint retained |
| Conventions: weight dimension | n = d = 2, two split dyadic places | T(2) has rank 4 and torsion C₂⁴ | dim Λ = 5; 16 characteristic-zero components | Agrees |
| 1.1 framing | n = 4, #T = 3; T empty | 17·3 − 1 = 50; empty gives 0 | GL₄-only count 47; empty ring equals unframed ring | Agrees |
| 1.1 equivalence | A = 𝔽₂[ε], a = 1 + ε | Squares have ε-coefficient 0; a⁻¹ = 1 + ε | Scalar conjugation would need μ² = a⁻¹ | Full Ĝ_n necessary |
| 1.1 local framing map | (r,α) changed to (ara⁻¹,aα) | (aα)⁻¹(ara⁻¹)(aα) = α⁻¹rα | αrα⁻¹ is not invariant | Correct orientation |
| 1.2 real-place correction | n = 2; B = I₂ versus alternating J | Norm image rank 1 in both; I₂ lies only in alternating image | Scalar H² restriction nonzero versus zero | Strong oddness separates cases |
| 1.2 degree-three cohomology | p = 2, absolutely irreducible residual restriction | Scalar invariants dimension 1 | h³ = h⁰(ad(1)) = 1 | Printed h³ = 0 excluded |
| 1.2(4) headline presentation | n = 2, d = 8, #T = 3, q = 7 | g = 7 + 3 − 1 − 8 = 1 | q = h¹_dual − 1 gives h¹_dual = 8 | Counts agree |
| 1.3 semisimple span | H = GL₂(𝔽₂) = S₃ | Three odd-order elements span dimension 2 | Full matrix algebra dimension 4 | Not weakly adequate |
| 1.3 trace annihilator | Trivial subgroup in GL₂(𝔽₂) | Span dimension 1; annihilator dimension 3 | Near adequacy needs annihilator 0 | Trivial group excluded |
| 1.4 scalar class | Swap acting on X = diag(1,0) | gXg⁻¹ − X = I₂ | ψ = ∂X, hence cohomology class 0 | Nonvanishing hypothesis necessary |
| 1.4 cyclotomic choice | √2 absent; F⁺ = ℚ(√2) | m = 3; respectively m = 4 and [L⁺:ℚ] = 4 | Least missing real cyclotomic layer | Agrees; R03 locator |
| 1.4 trace pairing | n = 1, 2, 4 in characteristic 2 | tr(I_n) = 1, 0, 0 | Scalar pairing is n times the rank-one pairing | Agrees |
| 2.1 spherical versus Iwahori | GL₂(ℚ₂), diag(2,1) | Spherical coset count 3; Iwahori count 2 | Operators already differ on constants | Depth c ≥ 1 necessary |
| 2.1 ordinary projector | X² − X + 2 modulo 32 | Roots 27 and 6; valuations 0 and 1 | Ordinary summand rank 1, full summand rank 2 | Distinguishes projector |
| 2.1 weight twist | n = 1 and n = 2 | Twist 1 and u₂⁻¹ | Exponents 1 − i | Agrees |
| 2.2 Hida freeness and faithfulness | Ordinary module 0 | Rank 0; coefficient-map kernel is whole ring | Finite does not imply faithful at rank 0 | Conditional formulation retained |
| 2.2 control | λ = 0; λ = (1,0) | Lowest-weight twists 1 and τ(u₂) | Identity at zero weight; reversed coordinate at rank 2 | Agrees |
| 2.2 torsion action | Tame levels contain −I_n | [−I_n] acts by ε₀; [−I_n] − ε₀ acts by 0 | This element is nonzero in Λ | Faithfulness over smaller algebra distinguished |
| 2.3 constituents | Constant constituent, n = 1 and n = 2 | Residual dimensions 1 and 2; second has invariant line | GL₁ cuspidal; 1 ⊕ ε̄⁻¹ Eisenstein at rank 2 | Agrees |
| 2.3 polarization | n = 1, 2; complex conjugation | ε^(1−n)δ^n(c) = −1 in both cases | Alternative δ exponent gives +1 | Correct sign |
| 3.1 local problems | Characters χ_i congruent to 1 modulo ϖ | Inertia polynomial reduces to (X − 1)^n | Trivial-character problem has same polynomial | Common special fibre |
| 3.2(a),(b) headline dimension | n = d = 2, #T = 3 | Local dimension 19; framing 14; corrected obstruction bound 4 | Desired bound dim Λ = 5 | One relation must be saved |
| 3.2 proposed scalar route | P = O[C₂]⟦x⟧, relation t = [−1] − 1 | P and P/(t) have dimension 2; relation vanishes on component t = 0 | A torsion relation can cost 0 dimensions on a component | Does not establish (★) or (C) |
| 3.3 Hecke-valued representation | Ramified residual at hyperspecial tame level | Fixed-vector space dimension 0 | Required seed-fixed-vector dimension ≥ 1 | Added hypothesis excludes instance |
| 3.3 good-place polynomial | n = 2, q = 3 | X² − T¹X + 3T² | Exponents j(j−1)/2 are 0,0,1 | Normalization agrees |
| 3.4 uniform fixed vectors | Rank-one tame characters of order 4, q ≡ 1 mod 4 | Nontrivial character conductor 1; trivial conductor 0 | Both fixed by 1 + 𝔭 | One subgroup works for both |
| 3.4 inertial support | Trivial and Steinberg of GL₂ | Same inertial Weil restriction; monodromy ranks 0 and 1 | Same Bernstein block | Monodromy must be forgotten |
| 3.5 sufficiently deep levels | U′ contained in U; one-dimensional fixed line | dim V^U = 1 implies dim V^U′ ≥ 1 | Shrinking preserves fixed vectors | Correct direction |
| 3.6 auxiliary levels | q_v = 17 and 3, p = 2 | Δ_v orders 16 and 2 | 2-primary parts of q_v − 1 | Agrees |
| 3.6 projection | n = 2, selected eigenspace dimension 1 | Selected parahoric part rank 1 | Unprojected part rank 2 | Projection necessary |
| 4.1 preparation | n = 2, dyadic degrees 2 and 4 | Threshold n(n−1)/2 + 1 = 2 | 2 fails strict inequality; 4 passes | Prepared example uses degree 4 |
| 4.1 auxiliary place | Regular semisimple rank 2 | Two distinct residual eigenvalues | Scalar Frobenius has one | Auxiliary-place condition discriminates |
| 4.2 torsion weight algebra | Λ = O[C₂⁴]⟦w₁,…,w₄⟧ | Rank 16 over O⟦w₁,…,w₄⟧; dimension 5 | Λ has zero divisors, regular subring does not | Regular-subring depth route |
| 4.2 empty patch variables | q = j = 0 | S∞ = Λ; augmentation ideal 0 | Augmentation recovers unchanged module | Boundary agrees |
| 4.3 patch dimensions | n = 2, d = 8, #T = 3, q = 7 | g = 1; dim R∞ = 38 | dim S∞ = 38 | Agrees |
| 4.3 redundant prime | Same data, q = 8 | g = 2; dim R∞ = 39 | dim S∞ = 39 | Both increase by 1 |
| 4.4 components | n = 2, one avoidance place | Unipotent factors 2; distinct-character factors 1 | Unramified and Steinberg versus irreducible χ-ring | Component counts agree |
| 4.5 support and dimension | Prepared numerical data | dim C_X = 38; augmentation has 21 generators | dim R_X ≥ 17 = dim Λ | Support supplies required bound |
| 4.6 removing auxiliary ramification | Finite inertia characters of orders dividing 4 | Restriction to intersection of kernels gives inertia eigenvalues 1 | Unramified local condition requires trivial inertia | Correct direction of restriction |
| 4.7 headline finiteness | Finite extension of coefficient algebras | R′ generated by a elements, R by b over R′ gives at most ab products | Finite Λ-module after scalar map | Composition of finite maps |
| 4.8 headline reduced R = T | Surjection O[ε]/ε² → O | Kernel (ε), square 0; source reduction O | Reduced target O | Nilpotent-kernel interpretation agrees |
| 5.1 tangent modules | GSp₄, p = 3 | dim 𝔤𝔰𝔭₄ = 11; dim 𝔰𝔭₄ = 10 | Fixed-similitude cocycles use dimension 10 | Distinct modules retained |
| 5.1 framing | #T = 1 and 3 | 11#T − 1 = 10 and 32 | GL₄ count at #T = 3 would be 47 | Agrees |
| 5.2 reasonableness definition | General contract specialized to GSp₄ | D = 𝔰𝔭₄^∨, dimension 10 | Section 5.2 uses identical D and conditions | R01: import shared contract |
| 5.2 detection | Image preserves two symplectic planes | Lie block dimension 6; annihilator dimension 4 | Every nonzero simple annihilator submodule detects 0 | Reasonableness fails |
| 5.2 cyclotomic base change | SL₂(𝔽₅) acting on 𝔰𝔩₂ | Group order 120; dim Z¹ = 4, dim B¹ = 3, dim H¹ = 1 | Shapiro gives nonzero H¹ for the wreath-product summand | Extra cyclotomic condition necessary |
| 5.2 trace form | Diagonal Cartan at p = 3 versus p = 2 | Gram matrix 2I₂: determinant 1 versus 0 | Nondegenerate versus zero | p > 2 essential |
| 5.3 headline Taylor–Wiles places | Identity versus regular semisimple Frobenius | Detecting central Lie dimensions 0 versus 2 | Identity detects no nonzero dual class | Semisimple detection retained |
| 5.4 seed ramification | p = 3; q_v = 19 and 7 | Residues modulo 9 are 1 and 7 | Requirement q_v ≡ 1 mod 9 | First permitted, second excluded |
| 5.4 weights | (k,l;c) = (0,0;2) versus (2,2;2) | Hodge labels −1,0,1,2 versus 1,0,1,0 | Regular versus repeated labels | Correct dominance convention |
| 5.4 unipotent test | p = 3, h = diag(U,U⁻ᵗ), X = diag(1,0,−1,0) | hXh⁻¹ − X = 2E₁₂ + E₄₃, fixed by h | Nonzero invariant coboundary | Agrees |
| 5.5 component selection | B = O⟦x,y⟧/(xy), x = 0, y = ϖ | Exactly one generic component through point | Origin lies on two | Uniqueness necessary |
| 5.5 infinitesimal selection | x = ε, y = 0 in k[ε]/ε² | Underlying point has x = 0; map sends x to nonzero ε | Factoring through B/(x) requires x ↦ 0 | Point containment insufficient |
| 5.6 reduced Hecke image | Λ[N]/N² acting on Λ² | N ≠ 0, N² = 0 | Classical semisimple actions have no nonzero nilpotent | Semisimplicity contract needed |
| 6.1 local weight dominance | One split p-adic place, p > 2 | dim Λ_v = 3; dim selected ring = 17 | Relative dimensions over O and Λ_v: 16 and 14 | Counts agree |
| 6.2 symplectic patch | d = 1, #S = 3, t = 7 | g = 5; relative dimension 39 | dim S∞ = 42, absolute | Counts agree |
| 6.2 versus §9.6 supplier | R = O⟦x,y⟧/(ϖx,ϖy), M = O | depth_R M = 1; dim R = 2; selected quotient dimension 1 | Supplier requires dim R = D = 1 | R02: invocation unavailable |
| 6.3 headline reduced R = T | T = Λ[z]/z(z−u); select z² = 0 | Selected quotient Λ[z]/(z²,uz), z ≠ 0 and z² = 0 | Both reduced quotients are Λ | Target must also be reduced |
| 6.4 headline finiteness | Λ → Λ[ε]/ε² | Finite module rank 2; nilpotent kernel onto Λ | Finite residual fibre dimension 2 | Nakayama route agrees |
| Correction locators | Examples in §§1.4 and 2.2 | Induced example index 3; zero-module example index 5 of 6 | Text points to indices 1 and 6 | R03 |

- 15 seeded targets checked against source text: BCGP25 §§5.4–5.7, 6.1–6.3; Tho17 §§2, 4; Ger19 §§2.4–2.7; WHI22 §§3.2, 7.3; component comparison additionally BCGNT25 Lemma 3.2.4.
- 8 named pinned declarations opened: `Matrix.trace`, `Matrix.trace_one` (`Mathlib/LinearAlgebra/Matrix/Trace.lean:43,144`); `Module.End.IsSemisimple` (`Mathlib/LinearAlgebra/Semisimple.lean:56`); `Submodule.span` (`Mathlib/LinearAlgebra/Span/Defs.lean:46`); `Matrix.symplecticGroup` (`Mathlib/LinearAlgebra/SymplecticGroup.lean:102`); `LieAlgebra.Symplectic.sp` (`Mathlib/Algebra/Lie/Classical.lean:157`); `groupCohomology` (`Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:183`); `TauCeti.completedGroupAlgebra` (`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`).
- 12 direct supplier roadmaps' contracts resolved; 9 declared gap slugs match `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/design/plan.json`; additional ownership conflict recorded in R01.
- 7 headlines recorded; 0 Lean declarations, 0 missing declaration binders, 0 applicable one-tactic probes; missing deformation and automorphic carriers confirmed by searches at both pins.
- 29 worker gate checks pass; targeted build passes; direct `lake env lean` elaboration exits 0 with 0 warnings; 0 outside-folder changes.
- Dependency audit output: `depcheck: 221 roadmaps, 1962 edges, 0 problem(s)`.
- 2 main-roadmap shape comparisons: QuadraticCharactersAndReduction and TensorProductCombinatorics; 0 PR-title/prose contradictions established against the added folder.

Overlap check: read PotentialAutomorphyInfrastructurePartII, GSp4NonregularModularityLifting, AbelianSurfacesModularity, AutomorphyLiftingBeyondTaylorWiles, PotentialAutomorphyInfrastructure and GlobalGaloisDeformations (the main-vocabulary list is empty), plus OrdinaryAutomorphicFormsAndModularityLifting. Owners: polarized O-coefficient deformation theory—GlobalGaloisDeformations; odd-prime unitary Hecke theory, relaxed adequacy and O-coefficient Taylor–Wiles presentations—PotentialAutomorphyInfrastructurePartII; ordinary base change and auxiliary fields—PotentialAutomorphyInfrastructure; rank-two ordinary refinements—the base OrdinaryAutomorphicFormsAndModularityLifting; dyadic Λ-extensions and selected ordinary symplectic R = T—this roadmap; singular-weight lifting—GSp4NonregularModularityLifting; surface applications—AbelianSurfacesModularity; arbitrary-number-field conditional cohomological lifting—AutomorphyLiftingBeyondTaylorWiles. Reasonableness ownership conflicts with AbelianSurfacesModularity's ArithmeticGaloisRepresentations contract (R01).

Source independence: 21 passages compared with 5 sources, with no copied prose established; largest share BCGP25, 65 of 156 explicit source-key/locator clauses before the correction catalogue. Contents compared with BCGP25 lines 63–75: independent division of §5.7 among Layers 2–4 and §§6.1–6.3 among Layers 5–6; dependencies 3.3 → 4.3 → 4.5 → 4.7–4.8 and 5.6 → 6.1 → 6.2 → 6.3–6.4 force these orders.

## Not verifiable

- §3.2(b)'s proposed minimal scalar relation (★) and unprepared special-fibre input (C) are not proved in BCGP25 Lemma 5.7.7 or its cited argument; the README expressly retains them as targets and makes §4.8 conditional on the dimension bound.
- No cited source text was inaccessible; the nine declared supplier gaps remain contracts, not completed library results.

## Source issues

- **Error** in BCGP25 at §5.4, p. 123 (line 5567): the source says cohomology occurs only in degrees one and two; it should retain h³ = h⁰(ad r̄(1)) = 1 in characteristic two; affects a stated result.
- **Gap** in BCGP25 at Proposition 5.7.9, p. 134 (line 6060): the source says the seed supplies a localized Hecke quotient at every listed tame level; it should require seed-fixed vectors at the remaining places of T; affects a stated result.
- **Gap** in BCGP25 at Lemma 5.7.7, pp. 133–134 (line 6049): the source says the obstruction count proves dimension at least dim Λ; it should account for h³ = 1, which gives only dim Λ − 1 without another argument; affects the proof.
- **Misprint** in BCGP25 at Lemma 5.7.7, p. 133 (line 6044): the source says dim Λ = 1 + [F:ℚ]n; it should be 1 + [F⁺:ℚ]n; affects a stated result.
- **Gap** in BCGP25 at Lemma 5.7.7, p. 133 (line 6046): the source says Proposition 5.6.6 supplies the local dimension input; it should supply that bound for arbitrary residual flags when applying the lemma before preparation; affects the proof.
- **Misprint** in BCGP25 at equation (5.4.5), p. 124 (line 5598): the source says the last H² group has trivial coefficients; it should have coefficients ad r̄; affects nothing.
- **Gap** in BCGP25 at Remark 5.4.4, p. 124 (line 5603): the source says real-place injectivity with trivial coefficients proves restriction surjectivity; it should check injectivity with adjoint coefficients, requiring the nonalternating polarization condition in even rank; affects the proof.
- **Gap** in BCGP25 at Lemma 5.5.3, p. 125 (line 5640): the source says the scalar class always gives a nonzero dual Selmer class; it should require nonvanishing, for example absolute irreducibility after the quadratic restriction; affects a stated result.
- **Gap** in BCGP25 at Lemma 5.5.3 proof, p. 125 (line 5645): the source says F⁺ lies between consecutive real cyclotomic fields; it should choose the first real cyclotomic field not contained in F⁺ and form the compositum; affects the proof.
- **Misprint** in BCGP25 at Lemma 5.5.3 proof, p. 126: the source says the quadratic class and unramifiedness concern L/L⁺ and L⁺/L; it should use L⁺/F⁺; affects nothing.
- **Error** in BCGP25 at §5.7, p. 131: the source says U-operator level compatibility includes depth zero; it should require positive Iwahori depth, since spherical and Iwahori coset counts are 3 and 2 for GL₂(ℚ₂); affects a stated result.
- **Misprint** in BCGP25 at equation (5.7.3), p. 131 (line 5951): the source says the reduction target has one residue-unit factor per place; it should have the rank-n diagonal torus at every place; affects nothing.
- **Misprint** in BCGP25 at §5.7 coefficient module, p. 130: the source says the tensor index is the chosen set of places; it should be the embeddings inducing those places; affects nothing.
- **Misprint** in BCGP25 at §5.6.1 fixed-type problem, p. 129: the source says the characters are evaluated after Artin applied to inertia; it should use inverse Artin; affects nothing.
- **Misprint** in BCGP25 at Proposition 5.5.6(i), p. 126 (line 5694): the source says µ(c_v) = −1; it should use χ, the specified multiplier; affects nothing.
- **Misprint** in BCGP25 at §5.4, pp. 121–122, and Definition 6.1.4, p. 141 (line 6395): the source says the global representation has domain G_F; it should use G_(F⁺), with the specified ramification set; affects nothing.
- **Misprint** in BCGP25 at Theorem 5.7.14 proof, p. 137 (line 6229): the source says Spec R_X is supported by the primed patched module; it should refer to the unprimed finite-level module H₁; affects nothing.
- **Misprint** in BCGP25 at Theorem 5.7.14 proof, p. 138 (line 6261): the source says T′ = R′ ∪ {v′₁}; it should also include S₂(L⁺); affects nothing.
- **Gap** in BCGP25 at Theorem 5.7.14 proof, pp. 135, 139 (line 6289): the source says preparation provides the final restriction map; it should ensure all original-field local lifts become unipotently ramified after restriction, using Lemma 5.6.2; affects the proof.
- **Misprint** in BCGP25 at §6.3 stabilization, p. 147 (line 6668): the source says α_p and β_p; it should use α_v and β_v at each p-adic place; affects nothing.
- **Gap** in BCGP25 at Hypothesis 6.3.1 discussion, p. 146 (line 6642): the source says Theorem 1.8.17 supplies the representation also for regular weights; it should cite Theorem 1.8.13 for that branch and 1.8.17 for weight two; affects nothing.
- **Gap** in BCGP25 at Theorem 6.3.4, p. 148 (line 6695): the source says nilpotent kernel identifies the reduced source with the selected Hecke quotient; it should reduce both rings unless reducedness of the selected quotient is separately proved; affects a stated result.
- **Gap** in Ger19 at Corollary 2.5.4, preprint p. 17 (line 749): the source says finite freeness gives faithfulness without a positive-rank qualification; it should establish nonvanishing for these level hypotheses or condition faithfulness on it; affects the proof.
- **Gap** in Ger19 at Lemma 2.4.3 proof, preprint p. 13 (line 597): the source says one primitive image under U(l) forces a unit eigenvalue; it should justify persistence under powers, since a nilpotent matrix can have a primitive image; affects the proof.
- **Gap** in WHI22 at Proposition 3.18, arXiv v3 p. 22 (line 1013): the source says detection and conditional H¹ vanishing suffice for its argument; it should include the H⁰ vanishing required by Lemma 3.16 in that proof; affects the proof.
- **Misprint** in Tho17 at the local-framing transformation after Lemma 2.11, p. 7 (line 305): the source says to conjugate the restriction by α on the left; it should conjugate by α⁻¹ on the left under the stated framing equivalence; affects nothing.
- **Misprint** in Ger19 at weak admissibility, preprint p. 23 (line 1052): the source says the total Newton number equals itself; it should equal the total Hodge number; affects nothing.

## For the human reviewers

- none
