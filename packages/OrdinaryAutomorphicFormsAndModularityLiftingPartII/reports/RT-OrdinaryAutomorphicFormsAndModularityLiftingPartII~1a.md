<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13074#issuecomment-6791887717 -->
Red team round 1 pass a (codex) of 2984461

Verdict: needs_changes

1. **F01** (P1) Cyclotomic base change can destroy reasonableness

   **Location:** packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:567, “linearly disjoint over F(ζ_{p^∞})”.

   **Claim:** This disjointness suffices to preserve GSp₄-reasonableness.

   **Witness:** Set p=5, H=SL₂(𝔽₅)≀C₂ and F′=F(ζ₅). The cyclotomic image stays H, but ζ₅ enters the adjoint splitting field. H¹(H,sp₄)=𝔽₅≠0. See ArithmeticGaloisRepresentations §7.11 and BCGP21 lines 9563–9590.

   **Verification detail:** Realize H over a number field F with splitting field E disjoint from F(ζ_{5^∞}); for example embed H in a symmetric group, choose a symmetric-group extension disjoint from the cyclotomic tower, and take its H-fixed field. The standard four-dimensional wreath representation is absolutely irreducible. H is weakly enormous, hence satisfies (a),(b), and ζ₅ is outside its adjoint field L⊂E. Thus it is reasonable over F. The stated disjointness after adjoining the entire cyclotomic tower holds for F′ automatically. Over F′ the adjoint field is LF′, contains ζ₅, and the nonzero H¹ now violates the definition. The cohomology follows from sp₄ restricted to SL₂² being sl₂⊕sl₂⊕(V₁⊗V₂): the first two H¹ lines are swapped, leaving a one-dimensional invariant line. An exact finite-field calculation on the 120 elements of SL₂(𝔽₅), using two unipotent generators and the basis E₁₂,E₂₁,diag(1,−1), gives cocycle-constraint rank 2 in six generator coordinates, dim Z¹=4 and dim B¹=3, hence dim H¹=1.

   **Exact repair text:** “If F′/F is finite, EF(ζ_{p^∞}) and F′F(ζ_{p^∞}) are linearly disjoint over F(ζ_{p^∞}), where E is the field cut out by ρ̄, and, writing L for the field cut out by sp₄^∨, ζ_p∉L implies ζ_p∉LF′, then restriction preserves GSp₄-reasonableness. Alternatively require the H¹ vanishing for the stabilized cyclotomic image unconditionally.” The extra condition excludes F′=F(ζ₅) in the witness. Add that witness as a negative-control Check.

2. **F02** (P3) The prepared degree-three example is impossible

   **Location:** packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:449, “With two dyadic places of degree 3”; also lines 451 and 527.

   **Claim:** The degree-three example is an instance of the prepared field hypotheses.

   **Witness:** Preparation gives F=F⁺(i), while every dyadic place splits in F. Hence i∈F⁺_v and 2=[ℚ₂(i):ℚ₂] divides [F⁺_v:ℚ₂]; it cannot be 3.

   **Exact repair text:** “For two dyadic places of degree 4, n=2, d=8, #T=3 and q=7: each dyadic factor has dimension 17, the auxiliary factor has dimension 5, dim R^loc=17+17+5−2=37, g=7+3−1−8=1, and both patched dimensions are 38=17+7+14. Adding a redundant prime changes q to 8, g to 2 and both dimensions to 39. R_X has dimension at least 17.” Replace the degree-three examples at all three locations. Degree 4 permits ℚ₂(i) and satisfies the strict degree bound >2; these are numerical checks, not assertions that arbitrary residual data realize the chosen Selmer dimension.

3. **F03** (P1) The claimed unavoidable scalar class can be zero

   **Location:** packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:207–209, “in particular h¹ ≥ 1”.

   **Claim:** For every problem of §1.1, the class obtained from the first missing real cyclotomic quadratic extension is nonzero and proves the lower bound.

   **Witness:** Over 𝔽₂ take A=[[0,1],[1,1]], J=[[0,1],[1,0]]. Then A²=A+I, JAJ=A+I and J Aᵗ J=A+I. The specified scalar cocycle is dA in the number-field instance below, hence [ψ]=0.

   **Verification detail:** Let F⁺=ℚ(√105), F=ℚ(√−7,√−15), and E be the splitting field of x³−21x+98. The cubic has no rational root and discriminant −14·126², so Gal(E/ℚ)=S₃ and its quadratic field is ℚ(√−14). E∩F=ℚ. Let σ:G_{F⁺}→GL₂(𝔽₂)=⟨A,J⟩ be the resulting representation. Put δ:G_{F⁺}→𝔽₂ for the character of F/F⁺, and define r̄(g)=(σ(g),1)(J,1)^δ(g)j^δ(g), using the symplectic embedding of BCGP25 Corollary 5.1.6 (lines 5219–5225). Its restriction to G_F is absolutely irreducible. Take S containing 2, infinity and all ramification, Λ_v=ℤ₂, unrestricted local conditions, and multiplier lift ε⁻¹. The CM extension F/F⁺ is unramified at finite places and split above 2. Here m=3 and L⁺=F⁺(√2). If s is the sign character of σ, its quadratic field is F⁺(√−14), so s+δ is exactly the character of L⁺/F⁺. The adjoint action gives g·A−A=(s(g)+δ(g))I. Thus the roadmap's ψ is a coboundary, not a surviving nonzero class. At real places σ(c) is conjugate to J and r̄(c) is conjugate to j, so even strong residual oddness does not repair this instance.

   **Exact repair text:** “For the nonvanishing assertion assume additionally H¹(ρ̄(G_F),k)=0 (in particular this holds for nearly adequate image). If the scalar cocycle were a coboundary, restricting to ker ρ̄ inside G_F would make the nonzero character of FL⁺/F factor through ρ̄(G_F), contradicting that vanishing. The local orthogonality calculation then proves h¹≥1.” Keep any lower-bound claim without this extra hypothesis as a separate target requiring a different nonvanishing argument. Add the displayed S₃ example as a negative-control Check and record the omitted nonvanishing argument in the source issues. The added hypothesis fails for the witness: H¹(S₃,𝔽₂)=𝔽₂.

4. **F04** (P2) The seed and supplier contract exclude the promised weight-two forms

   **Location:** packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:112 and :593, “k_v ≥ l_v ≥ 2, including the ordinary parallel weight 2 case”.

   **Claim:** The displayed weight range includes the nonregular weight-two seed of BCGP25 Theorem 1.8.17.

   **Witness:** BCGP25 Definition 1.8.16, lines 636–638, gives weight two as (1,1;2), which fails l_v≥2. The Hodge–Tate formula at lines 611–612 gives (0,0,1,1) at (1,1;2).

   **Exact repair text:** “Allow the regular algebraic weights in the conventions of BCGP25 §1.8.12 and, additionally, parallel weight (1,1;2) with the ordinary non-degenerate limit-of-discrete-series hypothesis of Definition 1.8.16 and Theorem 1.8.17. Use those same alternatives in the seed definition and the GSp₄ Galois supplier contract.” Synchronize the existing gap's needs sentence in design/plan.json. State the character-lattice parity and the regularity convention explicitly rather than using l_v≥2 as a substitute. The repaired nonregular alternative includes (1,1;2), with diagonal characters α,β,β⁻¹ε⁻¹,α⁻¹ε⁻¹, as required by the seed application.

5. **F05** (P2) Component selection does not preserve reducedness of the Hecke quotient

   **Location:** packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:683, “has nilpotent kernel, so … ≅ T_{S_{1,π}}”.

   **Claim:** Nilpotence of the selected map's kernel identifies the reduced deformation ring with the unreduced tensor-product Hecke quotient defined in 5.6.

   **Witness:** Put Λ=O[[u]], T=Λ[z]/(z(z−u)), B=O[[x,y]]/(xy), x↦z²,y↦z−u. Selecting B/(x) gives T/(z²)=Λ[z]/(z²,uz), with nonzero nilpotent z, although T is reduced and Λ-free.

   **Verification detail:** O is a DVR. Both rings are complete local. The roots 0,u embed T in Λ×Λ, proving reducedness; {1,z} is a Λ-basis. The characteristic-zero point u=ϖ,z=0 maps to x=0,y=−ϖ and lies on exactly one B-component. Thus the seed's unique-component hypothesis also holds in this algebraic test. Set R=T: the selected map is the identity, has kernel zero, and satisfies full support. Its reduced source is Λ, whereas its target still contains z≠0 with z²=0. TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:1285 explicitly supplies A_red≅T_red and requires reduced T for the stronger conclusion. BCGP25 Theorem 6.3.4, lines 6694–6696, uses the same implication without establishing reducedness after this tensor product.

   **Exact repair text:** “The selected map has nilpotent kernel; consequently (R_{S_{1,π}})_red ≅ (T_{S_{1,π}})_red.” If the stronger headline is intended, add a separate named target proving that the component-selection ideal in T_{S_1} is radical, with an independent proof and its prerequisites; neither ambient reducedness nor the seed condition proves it. The repaired assertion sends the test ring on both sides to Λ and preserves the finiteness argument of 6.4.

6. **F06** (P1) The non-distinguished dimension input is not supplied

   **Location:** packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:671, “14 over Λ … by LocalGaloisDeformationRings §6.31”; also :90 and :669.

   **Claim:** The cited supplier gives equidimensionality of the entire ordinary image ring's flat quotient for the non-distinguished residual problems used here, sufficient for the depth assertion over R^·_∞.

   **Witness:** TauCetiRoadmap/LocalGaloisDeformationRings/README.md:3506 gives regularity at an unobstructed flagged characteristic-zero point, transferring to the image only at distinguished points. Section 6.34 assumes distinguished residual data; §6.35 treats a chosen weight-dominant component.

   **Verification detail:** BCGP25 lines 6606–6607 explicitly leave universal component dominance as an expectation and verify only the component needed globally. The selected-component conclusion of 6.1 cannot establish an all-component statement about R^1_∞ or R^χ_∞. There is also a separate integral gap: equality dim(R∞)′=dim S∞ proves maximal depth over (R∞)′, not over R∞ unless its dimension is controlled. For R=O[[x,y]]/(ϖx,ϖy), R′=O and M=O, one has dim R′=depth_R M=1 but dim R=2. The statement at :669 and its proof at :671 name different rings.

   **Exact repair text:** “Before 6.2, obtain a named LocalGaloisDeformationRings contract for the maximal O-flat quotient of the non-distinguished GSp₄ ordinary image ring over ℚ_p: it is equidimensional of absolute Krull dimension 17 (14 more than dim Λ_{GSp₄,v}). Declare it as a gap in both the README and design/plan.json, or prove it as a target here before applying it. In 6.2 assert maximal Cohen–Macaulayness over (R^·_∞)′; assert it over R^·_∞ only after a separate integral dimension bound.” Keep the selected dimension result of 6.1 separate. In the test R above the repaired assertion reads depth_O O=dim O=1, and makes no false assertion that 1=2.

7. **F07** (P3) The patching supplier's prime restriction is stale

   **Location:** packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:103, “The balanced patching theorem of §5.5 is stated for p ≥ 3”.

   **Claim:** The current supplier excludes p=2 from that theorem.

   **Witness:** TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:1107 states balanced_module_patching for every prime and either coefficient characteristic. Its p=2,q=1,O=ℤ₂ example has A=R=H=O and concludes rank-one freeness.

   **Exact repair text:** “The balanced patching theorem of §5.5 allows every prime, including 2, and equal-characteristic coefficients. Its regular coefficient source differs from the torsion weight algebra used in 4.2; the latter uses §§5.2–5.4 and the numerical depth comparison.” For the supplier's dyadic example the conclusion is rank_O H=1, so the corrected contract includes it. This does not duplicate the torsion-weight extension in 4.2.

8. **F08** (P3) Selected-problem Checks only repeat the definition and API

   **Location:** packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:621–623, “the component through π … would not be defined”.

   **Claim:** These three bullets serve as discriminating Checks of the selected quotient defined in 5.5.

   **Witness:** The bullets repeat, respectively, selection of the chosen component, the unique-component hypothesis, and the preceding distinguished-case API. None computes a ring, a point, or an infinitesimal lift that separates the quotient from a wrong model.

   **Exact repair text:** Replace or supplement them with these three algebraic tests of the selection operation: “For B=O[[x,y]]/(xy), the point x=0,y=ϖ selects P=(x); the point x=ϖ,y=0 does not factor through B/P. The point x=y=0 lies on both minimal primes (x),(y), so it cannot select a component. The map to k[ε]/(ε²) with x↦ε,y↦0 has its sole underlying point on the selected component but does not factor through B/(x), since ε≠0.” The first tests orientation, the second uniqueness, and the third scheme-theoretic rather than merely pointwise selection. Retain the existing prose as consequences, not counted Checks.

9. **F09** (P3) The odd-prime Check overlooks cyclotomic self-twists

   **Location:** packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:187, “vanishes when ζ_p ∉ F”.

   **Claim:** Excluding ζ_p from F forces H⁰(G_{F⁺,S},ad r̄(1))=0 at odd p.

   **Witness:** At p=3 take R=[[0,−1],[1,0]], S=diag(1,−1), A=[[0,1],[1,0]]. For the D₈ character η(R)=η(S)=−1, RAR⁻¹=SAS⁻¹=−A. Hence A is a nonzero invariant of ad(1) when η=ε̄.

   **Verification detail:** Let E be the splitting field of x⁴−3 over ℚ. Its D₈ quotient has η cutting out ℚ(√−3)=ℚ(ζ₃): rotation changes √3 and reflection changes i, so each changes i√3. Take F⁺=ℚ(√1081), F=ℚ(√−23,√−47), disjoint from E; F/F⁺ is unramified at finite places and both 2 and 3 split, while ζ₃∉F and the restriction of the displayed D₈ representation σ to G_F is absolutely irreducible. Put J=[[0,1],[−1,0]], u=(J,−1)j∈𝒢₂(𝔽₃), and r̄(g)=(σ(g),det σ(g))u^{δ_{F/F⁺}(g)}. Here u²=1 and u centralizes the embedded GL₂. On traceless matrices its adjoint action is identity, since −JXᵗJ⁻¹=X−tr(X)I. Therefore A is fixed by ad r̄(1) on all of G_{F⁺}; this invariant space has dimension one. The multiplier det σ has an odd quadratic lift. Taking S to contain all ramification gives the claimed cohomological counterexample to the odd-prime comparison. This does not change the correct dyadic value h³=1.

   **Exact repair text:** “At odd p the formula is still h³_{𝒮,T}=h⁰(G_{F⁺,S},ad r̄(1)). It vanishes under the additional hypothesis Hom_{G_F}(ρ̄,ρ̄⊗ε̄)=0. The condition ζ_p∉F alone does not exclude a cyclotomic self-twist.” Add the D₈,p=3 example as the negative control: its Hom space and h³ both have dimension one, so it is excluded by the repaired hypothesis.

## Verified sound

Coverage: all 763 README lines and all 42 Suggested.lean lines read; 30 numbered target sections and both bold end-theorem summaries audited. There are 0 Lean declarations, hence 0 signatures requiring binder comparison and 0 padding declarations. All 107 README Check bullets were inspected against their definitions and proof routes; the 113-row computed table below records the numerical, matrix, finite-group, ring and boundary tests, and explicitly marks conditional arithmetic tests. Restatements in R08 are not credited as discriminating computations. Nine findings are recorded above; the remaining calculations are evidence about their displayed instances, not a certification of the unproved arithmetic targets.

The supplier audit covered 12 named supplier-contract sections, the base roadmap's scope, and the three additional closest scopes AbelianSurfacesModularity, GSp4NonregularModularityLifting and AutomorphyLiftingBeyondTaylorWiles. The main and Completed trees, board packages and supplied open heads were searched by objects, including ordinary deformation rings, ordinary Hecke algebras, near adequacy, reasonableness, torsion-weight patching and selected symplectic components. No duplicate fully qualified Lean name is possible in the empty Suggested.lean. The dyadic extensions, full-adjoint variant and reasonable-image interface belong here; the generic objects remain with the suppliers listed below. The out-of-package reasonableness intake issue marked not actionable in FIX-PKG-OrdinaryAutomorphicFormsAndModularityLiftingPartII~2, F09, is not re-raised.

| Supplier checked at its supplied head | Sections / hypotheses resolved | Outcome |
| --- | --- | --- |
| PotentialAutomorphyInfrastructurePartII | 0.2,0.9,1.3;3.1–3.6,3.9,3.11;4.1,4.4,4.6;5.2,5.4 | The l-odd versus all-prime boundaries match the dyadic extension here; Thorne's h³ term is retained |
| AutomorphicFormsOnReductiveGroups | 7.4–7.5 | Carrier, weighted action, sufficient smallness, finite stabilizers and realization are owned there |
| ArithmeticGaloisRepresentations | 7.4,7.5,7.9,7.11 | 𝒢_n, symplectic conventions, ad⁰ adequacy and vast/tidy inputs exist; R01 concerns the extra permanence claim here |
| LocalGaloisDeformationRings | 1.3,1.4,1.9,1.17,F.2.6;2.17,2.22–2.24,2.29;6.24,6.27,6.29,6.31,6.35 | Dyadic and semisimple-TW gaps declared; the all-component use of 6.31 is R06 |
| GlobalGaloisDeformations | 3.3,4.2,4.8–4.11,8.1–8.4 | Generic representability/restriction inputs and conditional rank-two determinant route found; no unconditional dyadic scalar-relation theorem supplied |
| DeformationAndDerivedPatchingAlgebra | 1.12,4.1,4.2,4.6,5.2–5.5,6.1,6.3,6.5,6.7,8.2–8.5,9.6 | Regular-weight restriction of Layer8 matters; 6.5 requires reduced target for unreduced equality; R05,R07 |
| AutomorphicGaloisRepresentationsPartII | AG2.2,AG2.3,AG2.5; GSp₄ construction and normalization | Arbitrary regular weights, all coefficient primes and full away-prime compatibility are supplied; totally-real GSp₄ extension is a declared gap, with weight mismatch R04 |
| PotentialAutomorphyInfrastructure | 2.5,3.44,3.47 | CM preparation and ordinary GL_n base change supplied |
| PotentialModularityAndCompatibleSystems | 2.16 | Prescribed finite soluble local completions, avoidance and allowable degree enlargement supplied |
| SmoothRepresentationsOfLocalGroups | SR.3.2 | Bernstein carrier/projective generator supplied; precise LLC/inertial and uniform-level additions declared |
| ModularityAndLanglandsExtensions | 3.9 | GSp₄ general type and transfer interface found |
| AutomorphicBundles | Layer12,12.11–12.13, former B5 mapping | Classical Hecke operations supplied; all three Hilbert–Siegel Hida contracts declared separately |

The seven gap slugs agree between README and design/plan.json, all name suppliers, and none is treated as already implemented. The two dyadic clauses and the semisimple local-ring package specify the distinct properties consumed later. The three Hida contracts separate the module, auxiliary coinvariants and classicality. No additional absence finding is raised against those declared contracts; R04 corrects their weight convention, and R06 identifies a different, undeclared input.

At the pins, the eight referenced library declarations resolve as follows. The Mathlib pin is 1b1ccf4b088b32fa3f23f2de1127433254a81e1e; the Tau Ceti pin is 2fd255d997f47c0b5d834ee416c7015d55444ce5.

| Pinned declaration | File:line and actual carrier / limitation |
| --- | --- |
| Matrix.trace | Mathlib/LinearAlgebra/Matrix/Trace.lean:43; finite sum of diagonal entries |
| Matrix.trace_one | Mathlib/LinearAlgebra/Matrix/Trace.lean:144; trace identity equals index cardinality, so trace I₂=0 in characteristic2 |
| Module.End.IsSemisimple | Mathlib/LinearAlgebra/Semisimple.lean:56; semisimplicity of the associated polynomial-module action; invertibility is not included |
| Submodule.span | Mathlib/LinearAlgebra/Span/Defs.lean:46; infimum of submodules containing the set |
| Matrix.symplecticGroup | Mathlib/LinearAlgebra/SymplecticGroup.lean:102; matrix submonoid satisfying AJAᵗ=J, not GSp |
| LieAlgebra.Symplectic.sp | Mathlib/Algebra/Lie/Classical.lean:157; skew-adjoint matrix Lie subalgebra on a doubled index type |
| groupCohomology | Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:183; abstract group-representation cohomology, not the global arithmetic Selmer carrier |
| TauCeti.completedGroupAlgebra | TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145; compatible group-algebra families over open normal quotients |

No Galois-deformation or Hida carrier was found at the pins. The statement that Tau Ceti has no “deformation” declarations is read in its arithmetic context: unrelated deformation objects do exist, but do not state these headlines.

The read-only dependency check returned exactly:

```text
depcheck: 237 roadmaps, 2151 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The head resolves to 29844611. The comparison with origin/main changes four paths, all inside packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII: README.md and three repair reports; 467 insertions and 65 deletions. The review changed only its own report and scratch notes. No Lean command was run. The requested per-declaration elaboration is inapplicable because there are no declarations, not silently replaced by a build claim.

### Source locator audit

The following 38 locator groups were opened in the legal cached texts and compared with the claims that use them. A group containing several numbered items is counted once; these are not 38 independently proved theorems. All 14 cited works have an existing source-manifest entry and an available cached text. No new missing-reference request or source-manifest mutation was needed. Source issues found during these comparisons are recorded separately below.

| Source / exact locator group | Text witness | Comparison |
| --- | --- | --- |
| BCGP25 Definition1.8.16,Theorem1.8.17 | BCGP25 line636 | Weight(1,1;2), R04 |
| BCGP25 Theorem1.8.13 | BCGP25 line600 | Regular-weight representation and Hodge–Tate normalization |
| BCGP25 Lemma5.3.1,Definitions5.3.2–5.3.3 | BCGP25 line5402 | Semisimple spanning and near adequacy |
| BCGP25 §5.4,(5.4.1)–(5.4.3),Remark5.4.4 | BCGP25 line5540 | µ, dual Selmer, erroneous h³ suppression |
| BCGP25 Lemma5.5.3 | BCGP25 line5640 | Orthogonality verified; nonvanishing gap R03 |
| BCGP25 Proposition5.5.6 | BCGP25 line5694 | Near-adequate dyadic presentation; prepared F and strong oddness |
| BCGP25 Lemmas5.6.2–5.6.3 | BCGP25 line5794 | Uniform unipotence; regular-semisimple auxiliary lifts |
| BCGP25 Propositions5.6.4,5.6.6 | BCGP25 line5819 | Local components and extra trivial-residual/large-degree hypotheses |
| BCGP25 §5.7,Hecke definitions,(5.7.3)–(5.7.4) | BCGP25 line5889 | Depth-zero restriction and weight-algebra conventions compared with Ger19 |
| BCGP25 Lemma5.7.7 | BCGP25 line6044 | Degree typo and one-relation gap |
| BCGP25 Proposition5.7.9 | BCGP25 line6060 | Missing fixed-vector hypothesis repaired in package |
| BCGP25 Lemma5.7.12,Definition5.7.13 | BCGP25 line6080 | Uniform level and sufficient depth |
| BCGP25 Theorem5.7.14 and proof | BCGP25 line6088 | Two conclusions and two preparation stages; does not supply ★ |
| BCGP25 §6.1,Definitions6.1.1–6.1.4,(6.1.5) | BCGP25 line6364 | GSp₄ deformation/framing conventions |
| BCGP25 Lemma6.2.2 | BCGP25 line6486 | Flagged regularity, distinguished transfer; R06 |
| BCGP25 Lemma6.2.6 | BCGP25 line6596 | Weight-dominant selected component, not every component |
| BCGP25 Hypothesis6.3.1,Remarks6.3.2–6.3.3 | BCGP25 line6622 | Seed hypotheses and stabilization labels |
| BCGP25 Theorem6.3.4 and proof | BCGP25 line6694 | Selected support theorem; unreduced-target inference R05 |
| Tho17 Lemmas2.2,2.4–2.5 | Tho17 line199 | Polarization extension, descent of coefficients, strict uniqueness |
| Tho17 Lemmas2.8,2.10–2.12 | Tho17 line274 | Full-kernel quotient and framing dimension; local map inverse-order typo |
| Tho17 Lemma2.13,Corollary2.14,Lemma2.15 | Tho17 line377 | Euler count, higher cohomology and h³ |
| Tho17 Lemmas2.16–2.17 | Tho17 line462 | Real bilinear-form types and µ; proof matrix typo |
| Ger19 Definitions2.3.1–2.3.4,Lemma2.3.3 | Ger19 line484 | Integral normalized operators and Iwahori depth |
| Ger19 Lemmas2.4.4,2.4.7 | Ger19 line600 | Reducedness and integral/discrete coefficient comparison |
| Ger19 Proposition2.5.3,Corollary2.5.4 | Ger19 line716 | Freeness and faithfulness over sufficiently small Λ_b₀ |
| Ger19 Proposition2.6.1,Lemma2.6.4 | Ger19 line771 | Lowest-weight twist and classical specialization |
| Ger19 Propositions2.7.2–2.7.4 | Ger19 line1065 | Galois construction, inertia inverses, residual maximal ideals |
| Ger19 Corollary3.1.4,Lemma3.2.3 | Ger19 line1460 | Ordinary factorization; generic flagged dimension bound only |
| WHI22 Lemma3.16,Proposition3.18,Definition3.19,Lemma3.20 | WHI22 line1001 | H⁰ hypothesis, conditional H¹, stabilized cyclotomic images |
| WHI22 Propositions7.5–7.6,Theorems7.7–7.8 | WHI22 line3104 | Free auxiliary modules, coinvariants, Hecke-valued representations |
| WHI22 Lemma7.10,Proposition7.11,Theorem7.12 | WHI22 line3299 | t versus q, dimension calculation and distinguished hypotheses |
| BCGP21 Propositions7.4.7–7.4.8,Lemmas7.5.18–7.5.19,Theorem7.9.4 | BCGP21 line8961 | Tame components, wreath exceptional p=5, dense classical gluing |
| BCGNT25 Lemma3.2.4 | BCGNT25 line1636 | Product-component argument, with its own crystalline/p>n setting not imported verbatim |
| BLGHT11 Lemma3.3 | BLGHT11 line786 | Flat/geometrically integral tensor products and unique special-fibre generalizations |
| BLGGT14 Lemma1.2.3(1) | BLGGT14 line676 | Finite restriction; the trace-generation proof needs the dyadic replacement named here |
| CHT08 Lemma2.2.11,Corollary2.2.12 | CHT08 line1018 | Obstruction relations bounded by h², not h²−1 |
| Tay08 Lemma2.3;KT17 Proposition3.1;Tho12 Theorem8.6 | Tay08 line227;KT17 line630;Tho12 line2084 | MCM support, general-coefficient extraction and ordinary patching route |
| Sho18 Theorems2.5,4.6;KW09 Lemma9.4 | Sho18 line305,line801;KW09 line4000 | Framed dimension for all coefficient primes, Breuil–Mézard only l>2, free-torus square torsor |

### Declaration and headline inventory

| File / item | Section, variables and instances | Result |
| --- | --- | --- |
| Suggested.lean, all 42 lines | One Mathlib import; namespace TauCetiRoadmap.OrdinaryAutomorphicFormsAndModularityLiftingPartII; no section variables, instances, definitions, examples or theorem declarations | 0 declarations; 0 retained binders; 0 padding declarations; no elaborated-signature comparison is applicable |
| README bold dyadic headline, line 5 | Finite CM field, n≥2, nd≡0 mod 4, nearly adequate automorphic residual representation, regular semisimple element, strong residual oddness when n even | Its finiteness and reduced R=T are 4.7 and 4.8; both named in the Lean docstring |
| README bold symplectic headline, line 6 | p>2 completely split, reasonable tidy residual representation, ordinary seed and selected components | 6.3 and 6.4 named in the Lean docstring; R04–R06 affect their prerequisites or interpretation |
| Additional headline 3.2(b) | Ordinary polarized deformation ring over the full dyadic weight algebra | Named, with missing deformation-ring carrier |
| Additional headlines 1.2(4), 5.3 | Taylor–Wiles presentations / places, with their respective residual hypotheses | Both named, with missing arithmetic Galois, Selmer and deformation carriers |

No headline can be replaced by a theorem about arbitrary rings without losing the arithmetic construction in its statement. The seven named headlines are not statable on the pins by a few simple definitions. The full-adjoint linear algebra of 1.3 could be stated, but it is a preparatory variant of the supplier's weak-adequacy theorem, not a missing end theorem. No stand-in is requested.

### Computed statement audit

Every row refers to packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md. API numbers mean bullets in their printed order. “Conditional” means that the displayed computation checks the stated implication or boundary, not that it independently proves the arithmetic existence theorem. The coefficient category excludes the zero ring (residue field k≠0), fields as coefficient rings, and equal-characteristic coefficients; number fields exclude inseparable extensions. Residue cardinality q=1 is never admitted. Rank-zero calculations below apply only to the independent linear algebra of 1.3, not absolutely irreducible arithmetic data.

| Statement / context | Instances and computed values on the two sides | Result / change |
| --- | --- | --- |
| Conventions: coefficient category | O=ℤ₂ has residue 𝔽₂≠0; the zero ring has residue 0≠𝔽₂; k[ε]/ε² has residue k and ε²=0 | Square-zero tests admitted; zero ring excluded |
| Conventions: 𝒢_n and multiplier | j²=1; ν(j)²=(−1)²=1; for n=2, det(j)=j and ν(det j)=−1 whereas ν(j)²=1 | Determinant needs the δ twist in 3.2 |
| Conventions: Frobenius | q=2,p=7: geometric ε=2⁻¹=4; 2·4=1 mod 7, arithmetic ε=2≠4 | Convention discriminates direction |
| Conventions: symplectic adjoint | GSp₄ dimension 11; fixed-similitude kernel dimension 10; scalar tangent dν(aI)=2a | p=2 cannot use the odd-prime trace splitting |
| Conventions: full versus trace-zero obstruction | ℚ₃,ℤ₂,rank 1: R=ℤ₂[[u,X]]/(u²+2u); mod 2, u≠0,u²=0; h²(ad)=1, ad⁰=0 | Full adjoint is necessary |
| Conventions: weight dimension | n=2,d=2: torsion group C₂⁴ has 16 characters, free rank 4, dim Λ=1+4=5 | Torsion does not change dimension |
| Conventions: reduced R=T | O[ε]/ε²↠O has kernel (ε), (ε)²=0 and reduced source O; identity on O[ε]/ε² has kernel 0 but nonreduced target | R05 distinguishes the two meanings |
| 1.1 local lifting / type / strict equivalence | At k[ε], (1,1+ε) sends (B,1)j to ((1+ε)B,1)j; all squares of units 1+aε equal 1 in characteristic 2 | Full Ĝ_n-equivalence differs from GL_n-equivalence |
| 1.1 global and local functors / representability | At residue k there is exactly the specified residual lifting; the stabilizer is λ↦(λI,λ²), of dimension 1, not dimension 2 | Tho17 2.8,2.10 support the quotient construction |
| 1.1 T-framing, API 2 | n=4,#T=3 gives (16+1)3−1=50 versus GL count 47; T=∅ gives 0 variables, not −1 | Empty case correctly separated |
| 1.1 local restriction map, API 3 | Replace (r,α) by (ara⁻¹,aα): (aα)⁻¹(ara⁻¹)(aα)=α⁻¹rα | Map descends; the inverse order is necessary |
| 1.1 split-place projection, API 4 | At a split place r=(ρ,χ), second coordinate fixed; projecting and restoring χ gives (ρ,χ) again | Inverse maps identified |
| 1.1 square-root comparison, API 5 | At p=3, a=1+ε has square root 1+2ε; at p=2 every (1+bε)²=1≠1+ε | Correct prime distinction |
| 1.1 Taylor–Wiles augmentation, API 6 | Δ=C₂: O[Δ]=O[t]/(t²−1); augment t↦1, quotient by t−1 is O | Source and target of specialization agree |
| 1.2(1) µ and local tangent condition | Split place µ=0. At real B=I₂, Y+Yᵗ has zero diagonal so I₂ is not an image; B=J gives E₁₁+JE₁₁J=I₂ | dim µ=1 versus 0, as stated |
| 1.2(2) cohomology / tangent | p=2: j·I=−Iᵗ=I and ε̄=1; absolutely irreducible invariants have dimension 1. Thus h³=1, not 0; T≠∅ gives h⁰=0 | Corrected degree-three term |
| 1.2(3) Euler characteristic | n=d=2,#T=3,q=5: χ=1−3−5+2=−5; h²=1,h³=1 give h¹=1−1+5=5 | Both computations equal 5 |
| 1.2(4) Taylor–Wiles presentation | Same data: g=5+3−1−2=5; falsely setting h³=0 gives 6. If h¹_dual=1 then q=0 | Boundary conditional on strengthened 1.4; R03 |
| 1.2(5) restriction comparison | B=I₂ gives [I₂]≠0 in symmetric matrices modulo Y+Yᵗ; B=J gives [I₂]=0 via E₁₁ | Strong oddness really distinguishes surjectivity argument |
| 1.3 U / projector annihilator | Trivial H on k²: tr(Iw)=tr(w); U=trace-zero matrices, dim 3. Projector set {I} gives same equation | Both descriptions equal a 3-space |
| 1.3 spanning / socle equivalences | S₃=GL₂(𝔽₂): semisimple set {I,A,A²}, A²=A+I; span dimension 2<4; trace annihilator dimension 2>0 | All three adequacy tests fail, despite absolute irreducibility |
| 1.3 rank boundaries | V=0: End=0, span=0,U=0, simple-submodule condition vacuous. V=k,H={1}: End=k,span=k,U=0,H¹(H,k)=0 | No false rank-zero dimension formula |
| 1.3 near versus relaxed adequacy | A₅ projective 4-dimensional module: H¹(H,k)=H¹(H,ad)=0 but H¹(H,ad/k)=k via H²(H,k)=k | Distinction from stronger adequacy retained |
| 1.4 cyclotomic extension definition | √2∉F⁺: m=3,[L⁺:F⁺]=2. F⁺=ℚ√2: m=4,[L⁺:ℚ]=4. F⁺=ℚ√5 is not contained in any real 2-power cyclotomic field | Least-m construction correct |
| 1.4 orthogonality | n=2: tr(I₂)=0 in k, scalar pairing is 0; n=1 at split dyadic v: CM quadratic class=0, Hilbert symbol=1 | Local orthogonality holds |
| 1.4 nonvanishing / Selmer lower bound | R03 instance: Δ cubic=−222264=−14·126², A²=A+I, JAJ=A+I, JAᵗJ=A+I; ψ=dA gives [ψ]=0 rather than nonzero | R03; local orthogonality cannot supply nonvanishing |
| 2.1 coefficient modules and levels | λ=0 gives M_λ=O; rank 1 has no off-diagonal congruences; n=2,c=0 level K, c=1 level I, [K:I]=3 at q=2 | Distinguishes spherical and Iwahori carriers |
| 2.1 U-operators and API 1 | n=2,j=1,q=2,λ=0: spherical constant eigenvalue 3, Iwahori eigenvalue 2; Iwahori depths 1,2 both yield 2 | c≥1 restriction necessary and present |
| 2.1 operator normalization | λ=(1,0), n=2: j=1 scalar=ϖ⁰=1, j=2 scalar=ϖ; λ=(0,0) gives 1 for both | Normalization not uniformly nontrivial |
| 2.1 ordinary idempotent and API 2 | X²−X+2 has roots 27,6 mod 32: values 704,32 are 0 mod 32; roots have unit difference 21, and e acts as (1,0) | e is not scalar on the 2-plane, hence need not lie in small Hecke algebra |
| 2.1 ordinary nilpotence | On U=diag(1,2) over ℤ₂, U^{r!}→diag(1,0); complementary eigenvalue has valuation r!→∞ | e²=e and ordinary rank=1, not 2 |
| 2.1 direct/inverse limits and API 3 | Constant coefficient system O has limit O; its E/O action has annihilator ∩_r(ϖ^r)=0 | Compatible O and E/O action images agree in this test |
| 2.1 Λ twist | n=1 exponent 1−1=0 gives 1; n=2 gives u₂⁻¹. At u₂=−1 this is −1 rather than 1 | Distinguishes twisted weight action |
| 2.1 Hecke polynomial, API 4 | n=1 gives X−T¹; n=2 gives X²−T¹X+qT²; n=3 gives X³−T¹X²+qT²X−q³T³ | Signs and q-exponents recomputed |
| 2.1 odd-prime comparison, API 5 | At p=3, 1+3ℤ₃ has no C₃ torsion and one ℤ₃ coordinate; at p=2,1+2ℤ₂=C₂×ℤ₂ | Common construction retains distinct weight bases |
| 2.2(1) Hida freeness / finite Hecke algebra | b₀=2 for two split dyadic places,n=2 gives regular base O[[w₁,…,w₄]], dim 5; finite free rank r gives faithful scalar action when r>0 | Conditional on smallness and nonzero ordinary forms |
| 2.2(1) reducedness | In characteristic-zero eigenspaces a Hecke operator maps to a tuple (a_i); tuple nilpotence implies a_i=0 for every i | Reduced action algebra, not arbitrary coefficient reduction |
| 2.2(2) weight independence | λ=0 projection is identity, diamond twist 1; λ=(1,0) gives lowest weight u₂, so at u₂=−1 the twist is −1 | Correct lowest-weight direction |
| 2.2(3) arithmetic density | C₂⁴ torsion weights give 16 parity patterns; each pattern allows arbitrarily large dominant weights, e.g. (2N+a,2M+b), N>M | Torsion components are not discarded |
| 2.2(4) classical specialization | At weight zero with trivial finite character, the finite-level index is r=1; ℘₀-specialization compares the same level U(l^{1,1}) | Uses Ger19 2.6.4, not all nonarithmetic points |
| 2.2 central-kernel Check | n=d=2: dn(n−1)/2=2, sign=1. If −I lies in tame level, [−I]−1≠0 in Λ acts as 0 | Finite over Λ does not mean faithful over Λ |
| 2.3 automorphic constituent / ordinarity iff | n=1: no proper parabolic, character is cuspidal and ordinary. Constant constituent n=2: 1⊕ε̄⁻¹ has an invariant line of dimension 1 | Non-Eisenstein distinction works in both directions |
| 2.3 Galois construction (i) | n=2, unramified w: determinant polynomial X²−T¹_wX+q_wT²_w, identical to 2.1 | Normalization agrees |
| 2.3 Galois construction (ii) | n=1 gives r^c=r⁻¹; for n=2 constant constituent 1⊕ε⁻¹, dual-twist is ε⁻¹⊕1 | Same multiset of characters |
| 2.3 Galois construction (iii) | Unramified inert hyperspecial example has inertia image I_n, polynomial (X−1)^n | Unramified carrier test |
| 2.3 Galois construction (iv) | Rank 1, tame character χ(Art⁻¹σ)=i: inertia eigenvalue i⁻¹=−i, not i | Inverse character / Artin direction distinguished |
| 3.1 ordinary problem and multiplier | n=4 gives ε⁻³δ⁴=ε⁻³; n=3 gives ε⁻²δ and value −1 on real conjugation | Correct parity |
| 3.1 reduction of χ and local/global quotients | χ=−1 versus 1 over ℤ₂: both reduce to 1; inertial polynomials X+1 and X−1 become X+1 over 𝔽₂ | Mod-ϖ identifications have the required sign |
| 3.1 restriction / norm map | Identity extension gives norm x↦x and ring map identity; for degree e extension, an unramified Frobenius character a restricts with value a^e | Direction Λ_F′→Λ_F matches restriction |
| 3.1 residual conjugacy | k=𝔽₂: k×/(k×)²=1; k=𝔽₃: quotient has order 2 | Dyadic equivalence does not extend verbatim to odd p |
| 3.2(a) obstruction count | n=d=2,#T=3: local dimension 19,h¹−h²=−1, framed lower bound 18, framing count14, unframed bound4 | 4=dim Λ−1, not5 |
| 3.2(b) proposed improved bound | Same numbers: save one relation gives19−14=5; printed 1+n[F:ℚ]=9≠5 | Arithmetic missing step explicitly owned, not proved here |
| 3.2(b) torsion relation mechanism | O[C₂],t²=1: (t−1)(t+1)=0; on t=1 branch relation is0, on t=−1 branch it is−2 | Both ★ and special-fibre condition C are substantive |
| 3.2(b) rank-one route | Rank K=h²−1; K_tors=0 gives d(K)=h²−1, K_tors=C₂ gives d(K)=h² | Ranks alone do not decide ★ |
| 3.2(b) reciprocity test | A chosen-place −1 has conjugate contribution −x; global relation x−x=0 holds for x=0 and x of order2 | No invalid killing of units at places in S |
| 3.2(b) determinant homomorphism | For x=(g,a)j, ν(det x)=−a^n; χ^n alone gives (−a)^n, ratio (−1)^{n+1}; real value becomes−1 | δ^{n+1} correction verified |
| 3.3 Hecke-valued representation / surjection | Rank2 polynomial again X²−T¹X+qT²; twisted scalar at u₂=−1 equals−1 | Same normalization on both sides |
| 3.3 existence of localized ideal | Residually ramified w and hyperspecial U: an unramified lift would have trivial residual inertia, contradicting ρ̄(I_w)≠1; fixed-vector dimension0 | Added level hypothesis is necessary |
| 3.4 uniform fixed vectors | Rank1,q=5: a tame order4 lift reduces to1 but has conductor1, versus unramified seed conductor0 | Residual class, not seed conductor, controls level |
| 3.4 Bernstein convention | Trivial GL₂ and Steinberg have r restricted to inertia=1⊕1 on both sides; monodromy ranks0 and1 | Forgetting N is necessary |
| 3.5 definition / existence / shrinking | For rank1,q=5, O× acts by nontrivial χ so invariant dimension0; 1+ϖO acts trivially so dimension1; a smaller subgroup still has dimension1 | Positive and negative depth tests |
| 3.5 automorphic points at deep level | Nonzero U-fixed vector spans dimension≥1; changing to U′⊂U retains that same vector | Correct containment direction; arithmetic existence conditional |
| 4.1 preparation | n=2 requires local degree>2; F=F⁺(i) and dyadic splitting force degree divisible by2; degree3 fails, degree4 passes both numerical tests | R02 |
| 4.1 auxiliary Frobenius | diag(1,ω) over 𝔽₄,ω²+ω+1=0: eigenvalues distinct, polynomial X²+(1+ω)X+ω≠(X−1)² | Regular semisimple auxiliary place need not be residual identity |
| 4.2 coefficient hypothesis | Λ=O[C₂⁴][[w₁,…,w₄]] has rank16 over Λ⁰=O[[w₁,…,w₄]], dim5 on each; (1−t)(1+t)=0 | Finite free, not domain; regular-base reduction applicable |
| 4.2 patching conclusion | q=j=0: S_N=S∞=Λ and H_N=H, yielding H∞=H; positive rank r remains r after augmentation | Boundary does not add artificial variables |
| 4.2 depth comparison | S=O,M=O,R=O[[x]] acting by x=0: depth_R M=1,dim R=2; numerical hypothesis1≥2 fails | Dimension hypothesis excludes wrong model |
| 4.2 simultaneous reduction | χ=±1 have identical mod2 characters; O[χ]/2 and O[1]/2 are both 𝔽₂ | Mod-ϖ compatibility is the precise comparison |
| 4.3 patched module and dimension | Unprepared numerical n=d=2,#T3,q5: g5,dimR19+5=24,dimS5+5+14=24 | Arithmetic instance explicitly not claimed |
| 4.3 prepared count | Two degree4 dyadic factors:17+17+5−2=37;d8,q7,g1;dimR38=17+7+14 | R02 corrected model |
| 4.3 redundant-prime count | Corrected prepared q8 givesg2,dimR39=17+8+14; h³0 would instead add one false variable | Both rings increase by1 |
| 4.4(1) generic characteristics | O-flat domain factor has ϖ≠0; generic prime(0) therefore characteristic0 | Flatness excludes vertical generic components |
| 4.4(2) product components | A=O[[x,y]]/(xy),B=O[[z,w]]/(zw): four generic products (x,z),(x,w),(y,z),(y,w) | Product count2·2=4 |
| 4.4(3) special-fibre product | Same model moduloϖ has four minimal primes, indexed by the same pairs | Four products versus four minimal primes |
| 4.4(4) χ-side components | χ factors each count1; auxiliary factor counts a; total1·a=a. R=∅ leaves a | Correct removal of irrelevant factors |
| 4.4(5) unique generalizations off v₁ | Rank2 unipotent factor has2 components versus distinct-character factor1; one auxiliary special prime may generalize to s≥1 auxiliary components | Remaining ambiguity belongs only to v₁ |
| 4.5(a) support and dimension | Corrected prepared dimensions: dimC38,augmentation generators7+14=21; dimR_X≥38−21=17=dimΛ | Conditional on support; no need to invoke3.2 |
| 4.5(b) automorphic lift on each component | R=∅ and one weight branch gives one local choice; one rank2 unipotent tame factor gives2 local choices to realize | Existence conditional on Hida/control suppliers |
| 4.6 removal of auxiliary ramification | A finite tame character of order e restricts trivially after ramification degree e: ζ_e^e=1; unramified characters remain unramified | Uniform e requires the named local supplier |
| 4.6 second support problem | If two dyadic places remain, T′=R′∪{v₁′} omits2 ordinary factors; corrected T′ adds both | Corrected set retains all conditions |
| 4.7 finiteness headline | Finite Λ′→R′→R with R finite over R′ and Λ′ action factoring throughΛ: products of finite generating sets generate R overΛ | Algebraic finiteness descent valid, arithmetic factorization conditional |
| 4.8 reduced R=T headline | R=Λ[ε]/ε²,T=Λ: kernel(ε), square0; R_red=T. A divisor quotientΛ/(f) has dimension dimΛ−1 | Needs3.2(b), not merely3.2(a) |
| 5.1 local/global GSp₄ problem | Dual numbers: fixed similitude has10 tangent coordinates, unrestricted11; p odd scalar derivative2a is onto | Fixed-similitude context retained |
| 5.1 framing torsor | #T=0 gives0;#T=1 gives10;#T=3 gives32, versus GL₄ count47 | Empty and positive cases correct |
| 5.1 local restriction / GL₄ comparison | γ⁻¹ργ invariant under (ρ,γ)↦(aρa⁻¹,aγ); forgetting symplectic pairing retains a4-dimensional representation | Map directions agree |
| 5.2 definition: H⁰ and detection | Torus H fixes2 Cartan coordinates, so h⁰≥2≠0; regular torus pairing is2(xx′+yy′), determinant4≠0 forp3 | Torus excluded; p2 degeneration gives determinant0 |
| 5.2 stabilized H_n | H¹(H₁,k)=0 rules out a quotientC_p; index p^a with a>0 would produce nonzero Hom(H₁,k) | Thus a=0 and H_n=H₁ |
| 5.2 vast / adequate implications | Enormous input gives h⁰=h¹=0 and regular-semisisimple detection; Sp₄(𝔽₃) has h⁰(sp₄)=0 although the GL₄ exterior-square H¹ is nonzero | Symplectic and GL conditions differ |
| 5.2 base-change permanence | p5,wreath H: h⁰=0,h¹(sp₄)=1; ζ₅∉L initially, ζ₅∈LF′ forF′=Fζ₅; H_n unchanged | R01: conditional hypothesis changes truth value |
| 5.3 Taylor–Wiles killing | h=I gives M=GSp₄,N=LieZ(GSp₄)∩sp₄=0 forp>2; detection valueψ(h)(N)=0 | Such extra places cannot kill a class |
| 5.3 induction / cardinality | Starting dimensiond₀≤q, each detecting prime reduces by≥1; afterd₀ choices dimension0; q−d₀ extra primes leave0 | Correct cardinality versus detection distinction |
| 5.4 seed weights | (k,l)=(1,1) gives Hodge–Tate list(0,0,1,1), but l≥2 isfalse | R04 |
| 5.4 auxiliary smoothness | q≡1,h=I gives twist1 and invariant sp₄ dimension10, so H² dimension10≠0 | Excluded auxiliary choice cannot imply smoothness |
| 5.4 nonsemisimple auxiliary Check | Over𝔽₃,h=diag(U,U⁻ᵗ),U=I+E₁₂: h³=I; [h,X]=2E₁₂+E₄₃≠0; Z=h−h⁻¹ has [h,Z]=0 | Invariant exists, but fixed standard Cartan claim would fail |
| 5.4 tame congruences | p3:19≡1 mod9,7≡7 mod9; R=∅ leaves S=S_p∪{w₀} | Two residue examples discriminate |
| 5.4 base-change API | Identity extension has restrictionρ=ρ, unchanged stabilization(α,β), and unchanged component; nontrivial extensions need the claimed seed transport theorem | Nonidentity permanence not certified |
| 5.5 selected quotient definition / API1 | Node B: at(0,ϖ), unique component(x), quotientB/(x)=O[[y]]; at(ϖ,0),x≠0 so no factorization | R08 computed checks |
| 5.5 uniqueness / infinitesimals | At(0,0) there are2 components; x↦ε,y↦0 into k[ε]/ε² has1 underlying point but x-imageε≠0 | Topological membership is insufficient; R08 |
| 5.5 distinguished API2 | One reduced flat generic component means selection has one minimal O-flat branch; two-component node violates this hypothesis | Scope restriction necessary |
| 5.6 Hecke-valued representation | Faithful action on Λ^r embeds T in M_r(Λ), a finiteΛ-module; r=1 gives T=Λ when scalars included | Finite algebra conclusion valid |
| 5.6 factorization through flag image | If a defining ideal element maps to0 in every characteristic-zero eigenvalue coordinate, injectivity into the product makes its image0 inT | Requires reduced/dense ambient Hecke algebra |
| 5.6 selected tensor product | R05 example: reducedT specializes toΛ[z]/(z²,uz), z²0 but z≠0 | Reducedness does not pass through tensor quotient |
| 6.1 dominance | Finite torsion-freeT overΛ-domain: for every minimal primeQ, Q∩Λ=0; contrastΛ×Λ/(u), where u(0,1)=0 | Faithful free-module action excludes vertical branch |
| 6.1 local dimension | dimΛ_v=3; relative14 gives absolute17, relativeO16; selected weight-dominant component matches17 | Cannot infer dimensions of unselected components; R06 |
| 6.2 character choices | p3, onlyµ₃: two nontrivial characters are inverses and fail condition; µ₉ gives exponents1,2 with1≠±2 mod9 | Explainsµ₉ and q_v≡1 mod9 |
| 6.2 patched rank/dimension | d1,#S3,t7: g=7−4+3−1=5; R relative dimension5+30+4=39; S relative dimension7+33−1=39 | Arithmetic equality correct, missing dimension premise R06 |
| 6.2 q versus t / freeness | A Levi centre contributes rank0,1,or2; qplaces give0≤t≤2q; I=∅ gives resolution length0 | Counts places and cyclic factors separately |
| 6.2 MCM over flat quotient | R=O[[x,y]]/(ϖx,ϖy),M=O: dimR′1,depth_R M1,dimR2 | R06 integral overclaim |
| 6.3 nilpotent-kernel consequence | Selected testT=Λ[z]/(z²,uz): kernel of identity0, target nilradical(z)≠0; source reductionΛ | R05 |
| 6.3 seed-dependent support transport | Node special fibre has primes(x),(y); nonzero module B/(x) supports only(x)-branch, not(y)-branch | Nonzero χ-module alone is insufficient; seed/Z necessary |
| 6.4 selected finiteness | If I^e=0 in NoetherianR and R/I finiteΛ, each I^j/I^{j+1} is finiteR/I; e finite layers imply R finiteΛ | Nilpotence suffices without target reducedness |
| 6.4 missing finiteness hypothesis control | R=Λ⊕⊕_{i≥1}Λe_i, e_ie_j=0: quotientΛ finite, square-zero kernel infinitely generated, R not finite | Noetherian hypothesis matters; completeness is not necessary for this algebraic step |
| 1.2 odd-prime Check, line187 | p3,D₈: RAR⁻¹=SAS⁻¹=−A and ε̄(R)=ε̄(S)=−1; ad(1) fixes A≠0, so h³=1 although ζ₃∉F | R09 |

## Not verifiable

- The new scalar-relation assertion ★ and the unprepared-field special-fibre assertion C in 3.2(b) have not been proved by this review. They are explicitly owned targets, so their absence from the cited sources is not an additional unowned-prerequisite finding. The obstruction count alone gives 4 rather than 5 in the displayed rank-two test.
- The seven declared supplier gaps are accepted as conditional contracts, subject to R04's precise weight correction. Their general mathematical conclusions, especially the dyadic image-ring special-fibre assertion and the Hilbert–Siegel Hida constructions, are not established by testing their existing special cases.
- The nonidentity solvable base-change assertion in 5.4 was not independently certified in the stated non-distinguished generality. The identity test is recorded, but does not prove preservation of a unique local ordinary component under arbitrary restriction. The supplied GL_n base-change theorem alone is not a proof of that component assertion.
- R05 is a counterexample to the stated commutative-algebra implication and proof route, not a constructed automorphic counterexample to reducedness of the actual selected Hecke quotient. A separate arithmetic radicality argument could establish the stronger result.
- R03 disproves nonvanishing of the specified cyclotomic scalar class. It does not compute the entire dual Selmer group of that number-field example and therefore does not assert that every possible proof of its dimension lower bound is impossible.
- The locator audit certifies the 38 groups listed, with the stated corrections. It does not certify every subsidiary reference appearing inside their proofs, or independently establish all global existence theorems. Exact published/preprint numbering beyond the versions specified in the package's manifest was not independently compared page by page.
- No Lean elaboration or build was performed, as required by the read-only brief. There are no named declarations to submit to the requested #check audit.

## Source issues

- **Error** in BCGP25 at §5.4, printed p. 123 (BCGP25 line5569): the source says Thorne's complex vanishes outside degrees one and two; it should be allowed to have h³=1 in the dyadic absolutely irreducible setting; affects a stated result.
- **Gap** in BCGP25 at Lemma 5.5.3, printed pp. 125–126 (BCGP25 line5647): the source says the cyclotomic scalar class supplies the positive Selmer dimension; it should be proved nonzero, or replaced when it is a coboundary as in R03; affects the proof.
- **Gap** in BCGP25 at Lemma 5.5.3, printed p. 125 (BCGP25 line5645): the source says the real base field can be nested between consecutive real cyclotomic fields; it should be handled by choosing the first real cyclotomic field not contained in the base and taking the compositum; affects the proof.
- **Misprint** in BCGP25 at Lemma 5.5.3, printed p. 126 (BCGP25 lines5680–5682): the source says the relevant quadratic class and ramification condition concern L/L⁺ or L⁺/L; it should be L⁺/F⁺ in both occurrences; affects nothing.
- **Misprint** in BCGP25 at (5.4.5), printed p. 124 (BCGP25 line5598): the source says the final inflation group has trivial coefficients k; it should be cohomology with coefficients ad r̄; affects nothing.
- **Gap** in BCGP25 at Remark 5.4.4, printed p. 124 (BCGP25 line5603): the source says injectivity at a real place with trivial coefficients proves restriction surjective; it should be injectivity with adjoint coefficients, which requires the nonalternating real pairing condition; affects the proof.
- **Gap** in BCGP25 at Lemma 5.7.7, printed pp. 133–134 (BCGP25 line6051): the source says the obstruction presentation has the relation bound giving dimension dim Λ; it should be one relation larger unless a separate scalar-direction argument saves a relation; affects the proof.
- **Misprint** in BCGP25 at Lemma 5.7.7, printed p. 133 (BCGP25 line6045): the source says the weight dimension uses n[F:ℚ]; it should be n[F⁺:ℚ], with the same additional constant one; affects a stated result.
- **Gap** in BCGP25 at Lemma 5.7.7, printed p. 133 (BCGP25 line6046): the source says Proposition 5.6.6 supplies the required local dimension for the general ordinary problem; it should be supplemented by a bound without that proposition's trivial-residual and large-local-degree hypotheses; affects the proof.
- **Gap** in BCGP25 at Proposition 5.7.9, printed p. 134 (BCGP25 line6060): the source says the localized ideal exists for arbitrary tame levels away from R; it should be assumed that the seed has fixed vectors at each remaining tame level; affects a stated result.
- **Error** in BCGP25 at §5.7, printed p. 131 (BCGP25 line5937): the source says U-operators intertwine all level inclusions starting at depth zero; it should be restricted to positive Iwahori depth, since the constant eigenvalues at q=2 are three and two; affects a stated result.
- **Misprint** in BCGP25 at (5.7.3), printed p. 131 (BCGP25 line5953): the source says the torus reduction target is one residue-field unit group per place; it should be n copies per place; affects nothing.
- **Misprint** in BCGP25 at §5.7, printed p. 130 (BCGP25 line5883): the source says coefficient-module tensor factors are indexed by chosen places; it should be embeddings inducing those places, as the weights are; affects nothing.
- **Misprint** in BCGP25 at §5.6.1, printed p. 129 (BCGP25 line5816): the source says to apply the Artin map to an inertia element; it should be the inverse Artin map before evaluating the local character; affects nothing.
- **Misprint** in BCGP25 at Proposition 5.5.6(i), printed p. 126 (BCGP25 line5694): the source says the sign condition is on µ; it should be on χ, the multiplier in the deformation problem; affects nothing.
- **Misprint** in BCGP25 at §5.4 and Definition 6.1.4, printed pp. 121–122,141 (BCGP25 lines5480,6398): the source says the global polarized representation has domain G_F; it should be G_{F⁺}, with the stated ramification restriction where appropriate; affects nothing.
- **Misprint** in BCGP25 at proof of Theorem 5.7.14, printed p. 137 (BCGP25 line6236): the source says the first component support belongs to the primed patched module; it should be the unprimed module, before the second base change; affects nothing.
- **Misprint** in BCGP25 at proof of Theorem 5.7.14, printed p. 138 (BCGP25 line6250): the source says the new set T′ consists only of R′ and the auxiliary place; it should be enlarged by all dyadic places; affects the proof.
- **Gap** in BCGP25 at proof of Theorem 5.7.14, printed pp. 135,139 (BCGP25 lines6113,6295): the source says the final restriction map follows from the stated preparation; it should be prepared so every lift over the original field becomes unipotently ramified at the specified tame places; affects the proof.
- **Misprint** in BCGP25 at §6.3, printed p. 147: the source says the stabilization characters at v have values α_p,β_p; it should be α_v,β_v; affects nothing.
- **Misprint** in BCGP25 at introduction to Hypothesis 6.3.1, printed p. 146 (BCGP25 line6623): the source says Theorem 1.8.17 supplies the seed representation including regular weights; it should be Theorem 1.8.13 for regular weights and Theorem 1.8.17 for ordinary weight two; affects nothing.
- **Gap** in BCGP25 at Theorem 6.3.4, printed p. 148 (BCGP25 line6696): the source says nilpotent kernel identifies the reduced source with the selected tensor-product target; it should be proved that the selected target is reduced, or both sides should be reduced; affects the proof.
- **Gap** in WHI22 at Proposition 3.18, printed p. 22, v3 (WHI22 lines1014,1046): the source says trace detection and conditional H¹ vanishing suffice; it should be assumed additionally that the H⁰ group required by Lemma 3.16 vanishes; affects a stated result.
- **Misprint** in Tho17 at the local restriction map after Lemma 2.11, printed p. 7 (Tho17 line305): the source says to conjugate by α on the left and α⁻¹ on the right; it should be α⁻¹rα, which is invariant under the stated simultaneous equivalence; affects nothing.
- **Misprint** in Tho17 at proof of Lemma 2.17, printed p. 11 (Tho17 line482): the source says the infinitesimal condition is X=Xᵗ for every residual symmetric A; it should be X=AXᵗA⁻¹, equivalently XA symmetric; affects the proof.
- **Misprint** in Tho17 at Lemma 2.3, printed p. 5 (Tho17 line215): the source says the polarized representation takes values in GL_n; it should be 𝒢_n, as required by the identity-component condition and conjugacy conclusion; affects nothing.
- **Error** in Ger19 at Remark 2.4.6, preprint printed p. 14 (Ger19 line629): the source says dualizing gives an algebra isomorphism on arbitrary endomorphisms; it should be an anti-isomorphism, or an isomorphism from the opposite algebra; affects nothing.
- **Error** in BCGP21 at proof of Lemma 7.5.18, printed p. 398 (BCGP21 line9582): the source says SL₂(k) always has an element of order eight for odd characteristic; it should be an order-four element a, with (a,1) followed by factor-swap giving order eight in the wreath product; affects the proof.
- **Misprint** in BCGP21 at Theorem 7.9.4, printed p. 417 (BCGP21 line10285): the source says the matrix-valued Galois representation is unique; it should be unique up to strict equivalence, since strict conjugation preserves all listed properties; affects nothing.
- **Misprint** in BCGP25 at §6.1, printed p. 141 (BCGP25 line6376): the source says D_𝒮 returns liftings immediately after defining deformation classes; it should be strict-equivalence classes of liftings; affects nothing.
- **Misprint** in WHI22 at Proposition 7.11, printed p. 68 (WHI22 line3368): the source says the patched rings act on endomorphisms of the unpatched modules; it should be endomorphisms of M_∞, with the indicated specialization recovering the unpatched action; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "2984461158c0b34d4ec7f3f0afbbc76fdebc865b", "job": "RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
