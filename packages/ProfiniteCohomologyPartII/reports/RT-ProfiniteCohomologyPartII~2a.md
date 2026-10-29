<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2203#issuecomment-6486743409 -->
Red team round 2 pass a (codex) of f88d25f

Verdict: needs_changes

1. **F01** (P3) Repaired dual Check incorrectly excludes transpose

   **Location:** packages/ProfiniteCohomologyPartII/README.md:1278–1280: “the contragredient action is not the transpose of the primal one read on the same basis”.

   **Claim:** This example distinguishes inverse transpose from transpose.

   **Witness:** S=1+N_s has N_s²=0 in characteristic two, hence S⁻¹=S and S⁻ᵀ=Sᵀ. Both send d* to d*+b*. The same equality holds for T and every element of this action.

   **Exact repair text:** “The dual action differs from the original action: s fixes d but sends d* to d*+b*. In this example inverse transpose equals transpose, since every action matrix is an involution; this example does not distinguish those two formulas.”

   **Retest:** `(s·d*)(s·b)=0`, `d*(s·b)=1`, and both transpose formulas give d*+b*. The computations added for a-F11 are correct; their new interpretation is not.

2. **F02** (P2) Corner definition omits the condition that excludes the diagonal

   **Location:** packages/ProfiniteCohomologyPartII/README.md:1819–1822: “normal closure of the matrices that agree with the identity except at `(0, n)`”; “for `n = 0` the subgroup is trivial”. Suggested.lean:225–233.

   **Claim:** The stated generating set gives the Lean corner subgroup, including n=0.

   **Witness:** R=𝔽₃, n=0. Every invertible 1×1 matrix satisfies the README's exception condition; its normal closure is 𝔽₃ˣ, order 2. Lean requires i<j, so permits only [1], order 1.

   **Exact repair text:** “Define triangularCorner R n as the normal closure of the upper triangular invertible matrices that differ from the identity only at strictly upper entries (i,j) with i=0 and j=n.” Use the same qualification in the Lean declaration's explanatory sentence.

   **Retest:** At n=0 no strictly upper entry exists, giving order 1 over 𝔽₃ on both sides. At n=2 the generators are 1+tE₀₂, giving order 3 as before.

3. **F03** (P3) The sign Check assumes an obstruction is nonzero

   **Location:** packages/ProfiniteCohomologyPartII/README.md:1435: “obstruction `2o(α̃)`, which is nonzero for odd `p`”.

   **Claim:** Nonsplitting of the boundary module sequence forces this obstruction to be nonzero.

   **Witness:** K=ℚ₇, p=3, n=3, r=s=1; take nonzero unramified χ:Γ_K→𝔽₃ and α̃=e₀₁(χ) mod Z. It lifts, so o=0; its boundary sequence is nonsplit because e₁₃ moves by χe₀₃. Thus 2o=0.

   **Exact repair text:** “With δc=+o(α̃), the product ĉα̂ has obstruction 2o(α̃); if o(α̃)≠0 and p is odd this is nonzero. Nonsplitting of the boundary sequence alone does not imply o(α̃)≠0.” Add the witness as the zero-obstruction control.

   **Retest:** The displayed lift gives o=0 and both signs give 0; for o=1 in 𝔽₃ the correct sign gives 0 and the wrong sign gives 2. The proof target's choice δc=−o remains correct.

4. **F04** (P3) The splitting-torsor Check has a nonexistent name at its supplier

   **Location:** packages/ProfiniteCohomologyPartII/README.md:1373–1374: “§R02.1.4, Check `torsor_discrete_fails`”.

   **Claim:** The supplier provides a Check with that identifier.

   **Witness:** TauCetiRoadmap/ArithmeticGaloisDuality/README.md:869–873 has the sheared-module example, but no occurrence of `torsor_discrete_fails` exists in that roadmap's README or Suggested.lean at the supplied indexed head.

   **Exact repair text:** Replace the locator by “ArithmeticGaloisDuality §R02.1.4, *The splitting torsor*, third Check”.

   **Retest:** That Check gives γ(g)(c)=Σgᵢcᵢ and the nondiscrete product Hom. The zero fibre is {0}, hence not open, exactly as required. This is a locator defect, not a missing mathematical supplier.

5. **F05** (P3) Several definitions still lack three discriminating Checks

   **Location:** packages/ProfiniteCohomologyPartII/README.md:695–700, 1100–1107, 1367–1375, 1455–1461, 1663–1670, 1833–1838. Examples: “The zero class evaluates to `1`”; “It is contained in every `P_(r,s)`”.

   **Claim:** Each definition has at least three discriminating Checks.

   **Witness:** §5.2 tests one fixed-class counterexample, then asserts the target action and evaluates zero. §10.2 has two concrete tests, then repeats corner containment. The other four definitions likewise lack a third discriminating Check.

   **Exact repair text:** Add the following Checks to the indicated definitions (retain them only in the README):

   - §2.1: “Over 𝔽₃ in U₅, e₀₂(1)e₂₄(1) has corner entry 1, but its image in B is e₀₂+e₂₄; the reverse product has corner 0 and the same image.”
   - §5.2: “For H=C₃=⟨h⟩, G=C₃=⟨σ⟩ acting trivially and χ=1, let b(σ)(h)=ζ₃. Evaluation on h is ζ₃, on h² is ζ₃², and on 1 is 1.” Also: “Let H=C₃, G=C₃×C₂, with C₂ acting by inversion and χ its sign. Then D=C₃ has trivial action. For σ=(1,1) and b from the first factor, h is allowed and evaluation is ζ₃. Giving the target the sign action would demand ζ₃=ζ₃⁻¹, which fails.”
   - §7.2: “For Γ=C₂ on P=𝔽₂² by (a,c)↦(a+c,c), with Z the first coordinate, the additive splitting has γ(σ)=1 and no equivariant splitting exists; the zero action gives γ=0.”
   - §7.6: “Over 𝔽₃, n=3,r=s=1, take u=(1,2,0,0), v=(0,0,1,1), Q=1+E₀₂+E₁₃. Then ρ(Q)=1+2=0, whereas deleting either noncorner contribution gives 2 or 1.”
   - §9.2: “For four rank-one 𝔽₂ summands, T=U₄ has 64 elements, U¹ has 8 and T/U¹ has 8. The commutator [e₀₁(1),e₁₂(1)]=e₀₂(1) is nonidentity in T and identity in T/U¹.”
   - §10.2: “Over 𝔽₂ at n=3, e₀₂(1) lies in P_(1,1) but not in triangularCorner; e₀₃(1) lies in both. Thus the corner has order 2 and P_(1,1) order 8.”

   **Retest:** These values separate the intended quotient, evaluation, action, retraction and corner from the natural wrong models (raw entries, zero evaluation, wrong target action, trivial splitting class, omitted row/column terms, and the larger boundary subgroup).

## Verification of the round-one findings

Read both previous reviews and the repair report before the new pass. The repair report marks all 21 findings applied (one differently); none is settled as “not actionable in this package”. References below are to the current package unless another repository-relative path is given. Repeated findings are recorded separately. Quotes are from the package, not from source texts.

| Previous finding | Status | Repaired passage and location | Retest/witness at this head |
|---|---|---|---|
| a-F01, unrestricted defining-system entries | Repaired | Suggested.lean:82–84: “The entries that are not permitted vanish”; README:406–408 imposes zero entries. | For Γ=1,R=𝔽₂,n=2,χ=0 there is now exactly one family, not several families with different diagonal entries. The n=1 helper convention is separately specified at README:407–408,446–448; headline criteria require n≥2. |
| a-F02, gauge primitive sign | Repaired | README:475: “−d(u₀ ∪ a₁₂ − a₀₁ ∪ u₁ + u₀ ∪ du₁)”. | In the stated 𝔽₉ conjugation example both sides at (σ,σ) are 2; replacing the middle minus by plus gives 1. |
| a-F03, nonexistent DG-carrier claim | Repaired | Suggested.lean:35: “the generic carriers exist at the pins”. | TauCeti/Algebra/Homology/DG/Algebra/Defs.lean:182 and TauCeti/CategoryTheory/DG/HomComplexData.lean:74 contain the carriers; their input cochain constructions are still new work. |
| a-F04, trivial-group exponent | Repaired | README:847: “For n ≤ 1, U¹ = 1 and the exponent is 1”; README:872: “for the trivial group it is 1 for every p”. | For p=3,n=0 or 1 both exponents are 1, not 3; nontrivial elementary abelian 3-groups have outer exponent 3. |
| a-F05, fixed vectors versus fixed classes | Repaired | README:1102: “but the converse fails”. | Recomputed 4096 candidates, 1036 fixed-class representatives, image span dimension 5 versus fixed-space dimension 6; e₂₅ is outside the image span. |
| a-F06, omitted small-rank headline | Repaired | Suggested.lean:148–154 states “IsConj Q (Q ^ a)” for n≤6 and a≡1 mod p. | n≤1 gives 1=1. At p=3,n=6 the cubic-corner correction is nonzero and removed by e₂₆(t); at p=2 conjugacy to the inverse suffices. |
| a-F07, nondiscrete coefficients | Repaired | Suggested.lean:70,89,96,102 explicitly bind “[DiscreteTopology R]”. | The old nondiscrete-coefficient countermodel is excluded. Finite 𝔽₂ and the infinite discrete ring ℤ are admitted; finite intersections of entry kernels are open. |
| a-F08, zero instead of shear cocycle | Repaired | README:1372: “g·(a, c) = (a + Σ gᵢcᵢ, c)”. | The splitting cocycle now has zero fibre {0}, which is not open in ∏ℕ𝔽₂; with trivial middle action the fibre is the whole group. The supplier Check name still needs S04. |
| a-F09, zero ring | Repaired | README:1342: “If R is nontrivial”; README:1344: “For the zero ring U and every P_(r,s) are trivial”. | Over the zero ring the commutator is 1; over 𝔽₂,n=4,r=s=2 it is e₀₄(1)≠1. |
| a-F10, unjustified scalar identifications | Repaired | README:1691–1692: “every N_i free of rank one over R with a chosen basis”; likewise 1716–1718 and 1756. | R=ℤ/4,N_i=ℤ/2 gives Hom coordinates of order 2 and U₄ of order 64, not 4096. Chosen free rank-one blocks do recover scalar matrices. |
| a-F11, nondiscriminating definition Checks | Partly repaired | README:947: “[a², b] = a⁴ ↦ 1/2 ≠ 0”; README:975: “r⁻² = r”; README:1273: “V^Q = ⟨d, e⟩”. | D₈/Q₁₆ restriction is nonzero, S₃ commutator is r versus r², invariants have size 4 and action kernel size 4. The added dual interpretation is false (S01); additional definition Checks remain insufficient (S05). |
| a-F12, comparison locator | Repaired | README:371–377 names the pinned explicit H¹/H² comparisons and the parent's Layer 3. | TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologyComparison.lean:134,232 supply exactly these maps. Degree-one round trip sends f to f, without a sign. |
| a-F13, local twisting supplier drift | Repaired | README:2039–2047 cites “§IG.4.1” and gives “z(g) = β(g)s(π(g))⁻¹”. | IG.4.1 permits nonsurjective π. Multiplication gives z(gh)=z(g)(π(g)·z(h)); over ℝ the image of π can have order ≤2, so IG.4.2's surjectivity would be insufficient. |
| a-F14, invalid block sizes | Repaired | README:901–903: “For n = 2, 3 the block sizes do not fit, and none is needed”. | At n=2, Q=1+E₀₂ over 𝔽₂ has Q²=1. For n=4,5,6 all 90 tested decompositions have D²=O²=1 and Q⁻¹=OD. |
| b-F01, trivial exponent | Repaired | README:847: “the exponent is 1, not p”. | Same test as a-F04: n=0,1 gives 1, and n=2 gives p. |
| b-F02, example attribution and padding | Repaired | README:1260–1261: “they are not HW's examples”; README:1281: “There is a cocycle γ”. | The five-dimensional model is identified as the author's example, its β cocycle is verified on 256 pairs, and γ is a Check rather than a separate target. |
| b-F03, wrong local supplier | Repaired | README:2046–2047 cites “§IG.4.1”. | Same explicit crossed-homomorphism calculation and nonsurjective local map as a-F13. |
| b-F04, unstated finite-group results | Repaired | Suggested.lean:40–44: “Two finite-group results consumed downstream are not stated”. | Names 5.6 and 5.7 and the missing acted-on B, boundary module, twisted dual and cyclic kernel; their full statements require these constructions. The statable 3.4 is now present. |
| b-F05, gauge sign | Repaired | README:475: “− a₀₁ ∪ u₁”. | Same 𝔽₉ test as a-F02: 2=2, wrong sign 1. |
| b-F06, triangular predicate owner | Repaired | README:170: “Unitriangular matrices: Matrix.IsUpperUnitriangular”; the row is under “From Tau Ceti”. | TauCeti/LinearAlgebra/Matrix/Triangular.lean:85 defines it; README:518 also attributes it to Tau Ceti. |
| b-F07, defining-system docstring | Repaired | Suggested.lean:66: “are zero (entry_eq_zero)”. | The docstring now agrees with the fields: diagonal/lower entries and nonadjacent corner are zero. The n=1 corner convention is also explicitly described. |

## Verified sound

Coverage: README.md, all 2132 lines; Suggested.lean, all 275 lines; 17 top-level Lean declarations (eight admitted headline theorems, seven definitions, one structure, one supporting instance); all 67 numbered target subsections; all 219 Check bullets and four final worked examples. The tables below retain the Lean context audit and sampled computations, including failures rather than counting them as successes. There are 39 source-locator groups in the source ledger, 38 inspected in the cached texts and one settled uncertified. Seven supplier roadmaps and 22 distinct cited sections/layers were resolved, plus the two declared gap contracts. These counts refer to this pass, not to the repair worker's tests.

The current manifest pins are Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. They differ from the first review's pins. The checked-out board head is `f88d25f`. The read-only diff against origin/main changes only packages/ProfiniteCohomologyPartII. No Lean command, build, git mutation, source-manifest edit, or external write was performed.

The seven headline families are Dwyer's two criteria (§1.6), small-rank outer powering (§3.4), Bogomolov vanishing (§4.5), refined lifting including real places (§§7.8,8.3), local Massey vanishing (§8.4), twisted refined lifting (§10.3), and the defined nonvanishing triple (§11.10). All eight corresponding theorem declarations are present. The module docstring names the missing acted-on carriers for §§5.6–5.7. Generic DG carriers already exist; constructing the continuous cochain algebra and Hom-coefficient DG category is work of §§0.1,9.1, not a reason to claim DG carriers are absent. No theorem here reduces to a definition, a one-lemma restatement, a small-value computation or a boundary case. The normality instance is necessary to form a headline's quotient and is not an additional acceptance theorem.

### Lean declaration and context ledger

All locators in this table are in packages/ProfiniteCohomologyPartII/Suggested.lean. There are no ambient section `variable` blocks: the listed hypotheses are in the declarations themselves. “Retain” means no counterexample found for that declaration, not a claim of formal verification. Arbitrary `Type*` parameters of the defining systems retain their universes; fields and the Bogomolov carrier are explicitly in `Type` as documented.

| Declaration; section/line | Variables and instances retained in its type | Instances and computed values on the two sides | Result/change |
|---|---|---|---|
| `DefiningSystem`; 0.3,69 | Γ:Type*, Group, topology; R:Type*, CommRing, topology, DiscreteTopology; n; χ:Fin n→Γ→R | Γ=1,R=𝔽₂,n=2,χ=0: exactly one all-zero family. n=1,χ(1)=1: one family, dχ(1,1)=1, no equation imposed. n=0: only zero entries. | Normalization works; n=1 is an explicitly separate cochain-helper convention. |
| `DefiningSystem.value`; 0.3,88 | Same instances, n,χ,D, and x:Γ×Γ | n=0,1: empty sum 0. n=2,x,y on C₃²: value at the two generators −1=2, extension factor +1. n=4 with a₀₂=x,a₂₄=y gives the same 2. | Retain; minus is intentional. |
| `MasseyDefined`; 0.3,95 | Same discrete-ring context; χ, no cocycle assumption | n=2 over C₂ with two nonzero 𝔽₂ characters: true; n=3 with three such characters: false (adjacent cup generator). n=1 constant-one cochain: true. | Retain; the n=1 helper admits more than the stated mathematical cocycle inputs, explicitly noted in the README Check. |
| `MasseyContainsZero`; 0.3,101 | Same context; existential D and continuous primitive f | C₂,𝔽₂,n=2,χχ: false; pullback to C₄: true, using a lift of order four in U₃. Zero χ over any Γ: true with D=f=0. | Retain. |
| `masseyDefined_iff_exists_lift`; 1.6,112 | Adds IsTopologicalGroup Γ, n≥2; no compactness, finiteness or surjectivity | C₂,𝔽₂,n=2,χχ: true↔true (quotient lift), although no full lift. Γ=1,χ(1)=1: false↔false. R=0: true↔true, unique group element. Discrete ℤ as Γ,R: open kernels automatic and entry formulas unchanged. | Retain; no missing profiniteness needed. |
| `masseyContainsZero_iff_exists_lift`; 1.6,130 | Same topological-group/discrete-ring context, n≥2 | C₂,χχ: false↔false; C₄ pullback: true↔true. C₃²,(x,0,y): some quotient lift has obstruction −x∪y≠0, another has 0, so the existential quantifier is essential. | Retain. |
| `isConj_pow_superdiagonalSubgroup_two`; 3.4,148 | p:ℕ, Fact p.Prime, n≤6, Q in superdiagonalSubgroup 2, a:ℕ, a≡1 mod p | n=0,1: Q=Qᵃ=1. p=3,n=6: Q⁴−Q=Q₀₂Q₂₄Q₄₆E₀₆; e₂₆(Q₂₄Q₄₆) conjugates Q⁴ to Q. p=2: Q⁻¹=OD conjugate to DO=Q. | Retain; no least-outer-exponent error. |
| `bogomolovMultiplier`; 4.1,159 | G:Type, Group; native ℤ-linear discrete cohomology with trivial ℚ/ℤ | G=1 or abelian C₂²: intersection contains restriction to G itself, giving 0. C₂² ambient H² has order 2; intersection over cyclic subgroups alone would have order 2, not 1. | Retain; quantifies all abelian subgroups, no finite-group hypothesis needed for definition. |
| `bogomolovMultiplier_superdiagonalSubgroup_two_eq_bot`; 4.5,170 | p prime, arbitrary n:ℕ | n=0,1: G=1; n=2:G=C_p; n=3:G=C_p³, ambient H²=C_p³ but B₀=0; n=4 noncommuting e₀₂,e₂₄ have commutator e₀₄, yet B₀=0. | Retain; theorem is stronger than an abelian test. |
| `IsTwoBoundary`; 7.1,182 | R:Type*, Zero, One; n,r,s:ℕ; native matrix | n=0 forces M=1. n=3,r=s=1 over 𝔽₂: 3 free entries, 8 matrices. n=4,r=s=2: commutator e₀₄≠1; no abelianness in definition. n≤j+s avoids junk natural subtraction; s≥n permits the entire strict first row. | Retain. |
| `IsLocalField`; 8.2,193 | K:Type, Field; existential valuative relation and compatible topology, or ring equivalence with ℝ/ℂ | ℚ: false (countable); ℚ_p,𝔽_q((t)),ℝ,ℂ:true. A finite field with discrete topology is false because the native valuation must be nontrivial. | Retain; no arbitrary-topology loophole. |
| `refinedLocalLifting`; 7.8/8.3,202 | K field/local; p prime; r,s≥1; r+s+1=n; ρ into U/center, open kernel | n=3,r=s=1: P has p³ elements, U/P=p³. ρ=1 permits ρ′=x=1. K=ℝ,p=3 forces ρ=1. K=ℝ,p=2: H²=𝔽₂; P-adjustment, not preservation of a chosen quotient lift, is allowed. | Retain. Quantified x is pointwise; it expresses equality of quotient homomorphisms, not a claimed continuous choice. |
| `localMasseyVanishing`; 8.4,219 | K field/local; p prime; n≥3; χ and hχ:MasseyDefined χ | K=ℂ: both predicates true on zero cocycles; K=ℝ,p=2,χχχ: antecedent false; χ,0,χ has zero-valued defining system. At n=2,χχ is defined but contains-zero false, excluded. | Retain. Definedness supplies continuous adjacent cocycles. |
| `triangularCorner`; 10.2,231 | R:Type*, CommRing; n:ℕ | 𝔽₃,n=0: generator set={1}, normal closure order1. n=2: order3 and diag(−1,1,1) sends parameter1 to2. R=0: order1. | Lean body retained; S02 repairs README/docstring. |
| `triangularCorner.normal`; 10.2,241 | Same R,CommRing,n; proposition Normal of the preceding real definition | n=0: trivial normal subgroup; n=2 over 𝔽₃: conjugation by a diagonal unit rescales t and stays among all three parameters. | Necessary supporting instance; native `Subgroup.normalClosure_normal`. |
| `twistedRefinedLocalLifting`; 10.3,251 | K field/local; p prime; r,s≥1,r+s+1=n; ρ:T/corner and open kernel | p=2: T=U, same assertion. p=3,K=ℝ with sign diagonal: character-killing extension is ℂ/ℝ of degree2; cor∘res=2 invertible on 3-primary groups. Trivial ρ has ρ′=1. | Retain; arbitrary diagonal is carried by actual triangular matrices. |
| `exists_masseyDefined_not_masseyContainsZero_zmod_eight`; 11.10,271 | No section parameters; Γ is actual AbsoluteGaloisGroup ℚ, coefficient ZMod 8, Fin3 | p=17,q=41 construction: defined=true, contains-zero=false; associated Wang class is locally zero but globally nonzero. Replacing coefficients by 𝔽₂ cannot supply this witness. | Retain; continuity and characters follow from a defining system, no arbitrary placeholder. |

### Sampled adversarial computations

The sample below retains concrete computations for the findings, repaired signs, boundary cases and headline results, plus the four final worked examples. The full pass covered all 67 numbered targets and their Checks; the per-target ledger is omitted to fit the comment limit. Tests depending on a declared gap remain conditional on that contract. Topology, duality and global-field assertions were tested mathematically rather than by finite enumeration.

| Statement and README line | Instances tried; computed values on both sides and negative controls | Result/change |
|---|---|---|
| 0.1 cochain DG algebra,306 | Γ=1: d⁰=0,d¹=id,d²=0,d³=id, hence H⁰=R,H^{>0}=0 versus all R for wrong zero differential. C₂ on 𝔽₉: cup −i versus unshifted i. C₃ noncocycle at (σ,σ,σ): d(f∪f)=0, signed RHS2−2=0, unsigned RHS2+2=1. Both associative bracketings have value f(x)(xg(y))(xyh(z)); identity cochain gives f. For ∏C₂, r evaluations impose ≤r linear equations on infinitely many characters, so zero is not isolated in the pointwise topology. | Retain; compact-open/discrete coefficient choice is material. |
| 0.3 defining systems,390 | n=2,x,y on C₃²: unique system,value−x∪y, at generator pair2 versus+1. n=4,all inputs0: values include0 and−x∪y≠0. n=3,χχχ on C₂: empty set; x,0,y on C₃²: nonempty. n=1,χ(1)=1: value0 but dχ=1. n=2,Γ=1,χ0: one family. | Retain. The mathematical definition fixes cocycles; the n=1 total helper deliberately accepts arbitrary continuous cochains. |
| 0.4 gauge independence,454 | C₂ on 𝔽₉,u=i gives du(σ)=i; corrected primitive gives2=2 versus wrong 1. Trivial action gives d⁰=0. For nilpotent U over ℤ/8, (1+U)(1−U+U²−U³)=1−U⁴=1 when U⁴=0. | Retain, conditional on integral gauge contract. |
| 1.6 both criteria,629 | n3 on C₃²,(x,0,y): choice a₀₂=x gives−x∪y≠0 and no full lift; choice0 gives0 and full lift. C₂,n2,χχ: defined true,zero false. Zero inputs: both true with trivial lift. | Retain; “some”, not “every”, lift. |
| 2.1 B,677 | n2 dimension1; n3 dimension3; n4 dimension5, corner distance4 maps0. For 𝔽₃,U₅,e₀₂e₂₄ corner 1 versus reversed0, both images e₀₂+e₂₄. Conjugating lift by U¹ changes B by a commutator in U³, hence0. | S05 adds the concrete quotient control. |
| 3.4 small-rank powering,877 | 50 cubic-correction tests over𝔽₃ and90 involution-block tests over𝔽₂ all match. ChainQ atn6 has extra corner 1 inQ⁴. n2,3 over𝔽₂:Q²=1, so no invalid blocks. | Retain. |
| 4.1 Bogomolov multiplier,916 | Abelian H:restriction to H is id, kernel0. C₂²:H²(Q/Z)=C₂, all cyclic restrictions0 but whole-group restrictionnonzero. D₈:Q₁₆ extension restricts on C₂² with commutator a⁴ mapping1/2≠0. | Retain; detects wrong cyclic-only definition. |
| 5.2 evaluation,1079 | χ1:allowed images⊂fixed vectors, strict atn6,e₂₅. Coboundary evaluation on χ-fixed h is (σf)(h)/f(h)=1. New C₃ test gives ζ₃,ζ₃²,1; inversion twist cancels in D but not in the incorrectly twisted target. | S05. |
| 6.1 n6 failure,1215 | All4096 candidates tested by linear TQ=QT equations:1036 admit T with prescribed adjacent entries; image span dimension5, e₂₅coordinate0; B^a dimension6. Sums of images need not be single basis vectors. | Retain. |
| 6.3 five-dimensional module,1253 | All four N-products0; invariants{0,d,e,d+e},kernel{1,t²,r,t²r}. γ(t²)=d+e≠0. Dual (s−1)d*=b*,(t−1)e*=b*; paired evaluation0 versus1, but S⁻ᵀ=Sᵀ. | S01. |
| 7.2 boundary sequence,1347 | Trivialα̃ givesγ0; changing its lift by centralz changes action by identity. Infinite shear:zero fibre{0},notopen; finite C₂ shear:γ(σ)=1,nonsplit; trivial middle actionγ0. | S04 locator and S05 Check. |
| 7.5 nonsplit cancellation,1416 | γ≠0 gives nonzero functional to one-dimensional H² and hence surjectivity;γ0 gives zero functional. Correct signs add o+(−o)=0. Liftable α̃ can still haveγ≠0,o0, so wrong sign also gives0 in that case. | S03. |
| 7.6 retractions,1437 | Corner basisu=e₀,v=e_n givesρ(Q)=Q₀n. Changing unused coordinates gives difference0. Corner e₀n(t) maps t,not2t. 𝔽₃ mixed test in S05 gives1+2=0 versus deleted contribution1 or2. | S05. |
| 8.4 local vanishing,1579 | ℝ,p2,n2,χχ:product singletonnonzero; n3 χχχ undefined; χ0χ contains0. H²0 forces every defined value0. ℂ all continuous cocycles0,product{0}. | Retain; n≥3 essential. |
| 9.2 filtered automorphisms,1641 | Rℤ/4,N₀ℤ/2,N₁ℤ/4:Homorder2,not4. Zero block givesone automorphism,no coordinates. Four free𝔽₂ blocks:Torder 64,U¹order8,quotient8; [e₀₁,e₁₂]=e₀₂ killed only in quotient. | S05 adds concrete commutator control. |
| 10.2 triangular corner,1817 | n0,𝔽₃:Leanorder1,README literal generatororder2. n2:diag−1 sendscorner 1→2. n3,𝔽₂:e₀₂ inP notcorner, e₀₃inboth,orders 8 and 2. | S02 and S05. |
| 11.10 nonvanishing triple,2055 | p17,q41 givesdefined=true andcontains-zero=false, by separate quotient/full lifting arguments. Constant coefficients ℤ/8 have order 8; the auxiliary D₈ has 512 elements and nontrivial action. Over𝔽₂ defined number-field productscannot give a counterexample. | Retain. |
| Bold final “The sign”,2094 | C₃² coordinate pair:−x∪y at generators 2,+x∪y1. | Retain. |
| Bold final “The real place”,2096 | C₂,𝔽₂,n2:χ∪χ generator of H²≅𝔽₂,not0. | Retain. |
| Bold final “Length six”,2098 | Fixed space dimension 6, image span 5, 4096 candidates, 1036 representatives. | Retain. |
| Bold final “ℤ/8”,2100 | p17,q41:quadratic radicands 17,82,1394; Wangclass nonzero,triple defined=true,contains-zero=false. | Retain. |

### Suppliers, ownership and direction

The object searches used the roadmap service's `roadmaps grep` on current indexed heads and main, direct searches of the supplied sibling trees, main/Completed, the board packages, and both pinned libraries. Searches included Massey products, defining systems, translated cups, Bogomolov multipliers, commutativity-preserving exterior squares, outer exponents, cyclic restriction kernels, splitting torsors, upper triangular groups and pointwise scalar maps. The final Lean-name search for this namespace and the candidate carrier names returned `no match on main or in any open roadmap pull request`. No duplicate fully qualified declaration was found. The package's own design and previous reports were excluded as competing owners.

| Supplier contract, resolved against its actual file | Scope matched and ownership conclusion |
|---|---|
| TauCetiRoadmap/ProfiniteCohomology/README.md, Layers 0,1,2,3,5,6,8,9,10,11,12; Layer 1:630, Layer 2:725, Layer 3:777, Layer 5:960, Layer 6:1060, Layer 8:1265, Layer 9:1363, Layer 10:1549, Layer 11:1739, Layer 12:2091 | Parent on main supplies the discrete-module dictionary, explicit low degrees, continuous/discrete comparisons, connecting maps, low/all-degree corestriction, cups, Kummer, dimension and graded cohomology cup. The strict continuous inhomogeneous DG algebra and its Massey/unipotent results are extensions here. This does not reassign the parent's cohomology carrier. |
| TauCetiRoadmap/DGAInfinity/README.md, Layer 1:293 and Layer 8:520 | DG algebra/category carriers and general matric products are imported. The strict group-cochain objects and their unitriangular interpretation belong here. Integral finite-unipotent gauge independence is declared as a supplier gap, not falsely asserted to exist. |
| TauCetiRoadmap/ProfiniteProPGroups/README.md, Layer 5:711, extension dictionary:814–855, finite embedding problems:901 | Source has finite discrete p-primary extension theory and weak solutions; the used kernels are p-primary. The general finite-abelian obstruction interface is also supplied by the explicit pinned factor-set declarations and IG.4.1. Nothing here asserts surjectivity of a weak solution. |
| TauCetiRoadmap/ClassFieldTheory/README.md, Layer 5:920, local duality:1078 | Local Tate duality for finite discrete modules, with annihilating integer invertible in the field, agrees with the actual finite-module theorems. Does not cover equal-characteristic p torsion or real places; those are separately handled here. |
| TauCetiRoadmap/ArithmeticGaloisDuality/README.md, R02.1.4:801, R02.3.0d:1788, R02.4.5a:4014, R02.4.5b:4073 | Pointwise Hom and splitting torsor; finite absolute-Galois localization; natural perfect Sha²/Sha¹ duality; exceptional eighth-power class. All four section contracts exist. The finite-C specialization is valid. The invented Check name is S04. |
| TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md, IG.4.1:3643 and IG.4.2:3733, cyclic-eight input:3786 | IG.4.1's finite abelian-kernel target accepts nonsurjective π. IG.4.2's global twisting hypothesis is stronger, but the revised local use has been moved to IG.4.1 and proved explicitly. The independent cyclic-eight extensions have degree64 and exactly the three asserted quadratic subfields. |
| TauCetiRoadmap/K2SymbolsBrauer/README.md, 6.14:1136 | Lexicographic upper-unipotent factorization, `Steinberg.toElementary_upperUnipotent`, over a commutative ring and matrix size≥3. §1.1's increasing-distance order is a genuine extension; sizes1,2 are elementary boundary cases. |

No supply edge from a later roadmap was found. Within the package, the proof routes use earlier numbered targets; later references in Checks are examples, not prerequisites. Generic local/global duality, extension obstructions, cyclic-eight extensions and generic gauge independence are not rebuilt here. The new finite support calculations, CP exterior-square specialization, outer-power result, fixed-conjugacy-class results, refined lifts and explicit Wang obstruction are owned here; no competing owner was found by object search. Geometric Bogomolov conjectures and unrelated spectral-sequence Massey products in search hits concern different objects.

The two gap entries agree exactly between README supplier contracts and design/plan.json:

| Slug | Supplier and requested contract | Audit |
|---|---|---|
| `gap:char-p-galois-h2-vanishing` | ProfiniteCohomology Layer 9: H²(Γ_K,ℤ/p)=0 for every field K of characteristic p, via Artin–Schreier/additive separable-closure acyclicity | Named owner; explicit coefficients, action and characteristic; not supplied by the parent's Kummer sequence, which requires p invertible. The asserted cd_p consequence uses the parent's dimension theory. No duplicate found at current pins. |
| `gap:integral-gauge-massey-independence` | DGAInfinity Layer 8: degree-one matric product values depend only on adjacent classes over any commutative ring, via finite integral unipotent gauge | Named owner; no rational denominators or hidden characteristic exclusion. Generic DG carriers alone do not prove it. One representative-independence contract, covering the algebra and category versions used here. |

Both contracts are precise and minimal for this package. Acceptance of their uses is conditional on the declared supplier contracts, as the brief requires; their absence today is not a finding.

The required read-only dependency gate returned:

```text
depcheck: 188 roadmaps, 1232 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The citation resolver found no missing cross-roadmap target or name, but warned that it did not check non-roadmap Lean names because it did not locate the pinned Lake packages. The manual pinned checks, not that warning-prone resolver, are the evidence for the library contracts.

### Pinned declarations and nonduplication

Paths here are library-relative. The rows record the definitions that matter to truth or ownership, rather than treating a matching name as sufficient evidence.

| Pinned declaration/file | What the source actually supplies; consequence |
|---|---|
| Mathlib/NumberTheory/LocalField/Basic.lean:45, `IsNonarchimedeanLocalField` | Extends valuative-topology compatibility, local compactness and nontriviality of the valuative relation. A finite/discrete field with trivial valuation is not a local-field countermodel. |
| Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:54,113, `TopRep.resolutionX`, `TopRep.homogeneousCochains`, and `continuousCohomology` | Native canonical homogeneous complex/cohomology; not already the internally graded inhomogeneous DG algebra with the translated product promised here. |
| Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:71, `ContinuousCohomology.tateShafarevich` | Generic localization-kernel construction. The arithmetic localization maps and duality are supplied by ArithmeticGaloisDuality, not inferred from this name. |
| Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean and Functoriality.lean, `groupCohomology`, `groupCohomology.map` | Restriction along A.subtype with identity coefficient morphism is the actual map used by the Bogomolov definition. Quantifying an abelian subgroup includes the whole group when G is abelian. |
| Mathlib/Algebra/Module/CharacterModule.lean:101, `CharacterModule.dual_surjective_of_injective` | Extension of additive/module characters into ℚ/ℤ along an injection; used in the finite abelian character-duality argument. It is not a ready-made Bogomolov theorem. |
| Mathlib/LinearAlgebra/Center.lean:218, `LinearMap.exists_eq_smul_id_of_forall_notLinearIndependent` | A related scalar-endomorphism theorem on free modules over a commutative domain. §5.3 has two maps V→W and must first factor through im T₀; it is not a duplicate headline or an unstated field-only shortcut. |
| TauCeti/Algebra/Homology/DG/Algebra/Defs.lean:182, `TauCeti.IsDGAlgebra` | Real `Prop` structure with degree-raising, square-zero and graded-Leibniz fields on an internally ℤ-graded algebra. It exists at this pin. |
| TauCeti/CategoryTheory/DG/HomComplexData.lean:74 and DG/Basic.lean, `DGCategoryData`, `DGCategory` | Hom complexes, composition and units already exist. Indexing Hom(i,j) by Hom(N_j,N_i) yields the intended composition convention; reversing the module index labels is not a missing category carrier. |
| TauCeti/LinearAlgebra/Matrix/Triangular.lean:85 and GeneralLinearGroup/UpperUnitriangular/Basic.lean:107 | `Matrix.IsUpperUnitriangular` and `upperUnitriangularGroup` are Tau Ceti's native predicates/groups. Equality from strictly upper entries and coefficient change also exist. |
| TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/UpperUnitriangular/Nilpotent.lean:137,181,210,220 | `superdiagonalSubgroup`, membership, eventual triviality and commutator inclusion. The pin gives only `[F_r,F_s]≤F_{r+s}`; §1.2 proves the reverse inclusion. Its internal support helper does not supply §3.1's public submodule API. |
| TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean:212,248,256 | Commutation and both oriented transvection commutators; forward chain gives +ab, reversed chain −ab. These support the chosen left commutator convention. |
| TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/UpperTriangular/Basic.lean:55,214 and UpperTriangular/Transvection.lean:34 | Triangular group, diagonal morphism, its unitriangular kernel, diagonal section and upper transvection membership. A corner is normal under diagonal rescaling, not generally central. |
| TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:132,172,215,231,482,485,491,725,734,792 | C1, d0, trivial-action B1=0, d1, Z1/Z2/B2, H1/DiscreteH1/H2. In particular d1(f)(g,h)=g•f(h)−f(gh)+f(g), fixing the signs used throughout. |
| TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologyComparison.lean:134,232 | Explicit H¹/H² to canonical continuous cohomology. Discrete smooth module and local-compactness hypotheses are satisfied for the profinite groups in the comparison targets. |
| TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteCyclic.lean:94 and the cup/duality files | `H1pi_eq_zero_iff_exists_smul_sub_eq`, `explicitH2CyclicEquiv`, `explicitCup11`, its Heisenberg primitive criterion and `dualityMap1` exist. These give the finite cyclic and evaluation ingredients, not the boundary cyclic-kernel theorem. |
| TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction/AllDegrees.lean:173 and Shapiro/AllDegrees.lean:208 | `corestriction_res` has cor∘res=index, and `isIso_shapiroMap` supplies Shapiro. The prime-to-p descent multiplies by the actual finite index, with no division by p. |
| TauCeti/GroupTheory/GroupExtension/Cohomology.lean:261,319; TauCeti/Topology/Algebra/Group/Profinite/Section.lean:230 | Factor-set class realization and splitting iff class0; continuous section for profinite groups under its compactness/totally-disconnected hypotheses. No claim about arbitrary profinite-space surjections is used. |
| TauCeti/Topology/Algebra/Group/Profinite/EmbeddingProblem/Cohomology.lean:87,110 | Obstruction and weak solvability theorem for the native finite embedding problem, including its surjective quotient-map requirement. The arbitrary-π use is supplied separately by IG.4.1. |
| TauCeti/Topology/Algebra/GroupAction/InternalHom/Basic.lean:165,308,350 | Contragredient Hom action and evaluation pairing. Finiteness of the relevant quotient makes the discrete-Hom specialization legitimate; infinite pointwise Hom is an ArithmeticGaloisDuality contract. |
| TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean and LocalField extension interface | AbsoluteGaloisGroup and its fixing-subgroup comparison are native; the finite-extension local-field result is used with an actual finite extension, not an arbitrary field inclusion. |
| TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/FiniteModule.lean:253,260,267 and TauCeti/NumberTheory/ClassFieldTheory/Brauer/RootsOfUnity.lean:89 | The three `dualityMap*_kummerCoeff_bijective` results require finite discrete modules and n invertible in K; `h2MuEquivZMod` supplies the μ_n target. No assumption “p differs from the residue characteristic” was silently added. |

No extra geometric, finiteness, flatness or smoothness hypotheses are silently used in these algebraic/profinite targets. General commutative rings, including the zero ring and square-zero rings, survive the unitriangular polynomial formulas; the field/prime hypotheses are explicit precisely in the duality and finite-field theorems. There is no arithmetic algorithm among the targets; the finite computations are adversarial Checks. The single `import Mathlib` and the three actual Tau Ceti imports satisfy the import policy; every admitted statement is a `theorem`, no data body is `sorry`, and no `set_option`, admitted example, `True` stand-in, hidden section hypothesis or process instruction was found in the two deliverable files.

### Source-locator ledger

The three readable sources were checked in the provided line-numbered legal cache, not in unverified published editions. HW uses arXiv v2 numbering and pages; Michailov uses arXiv v2; Moravec uses arXiv v1. Their manifest entries explicitly record that choice. No additional source was needed. Each row identifies what was verified, and source mistakes are registered below rather than attributed to the repaired roadmap.

| # | Locator and cached witness | Supported use / qualification |
|---|---|---|
| 1 | HW Introduction, p.1, lines7–38 | DG defining equations, negative value and convention footnote. |
| 2 | HW Proposition2.2, p.5, lines182–191 | Defining-system/lift correspondence; package extends from prime coefficients by explicit ring-matrix proof. |
| 3 | HW Corollary2.3, p.5, lines192–196 | Definedness versus quotient lift, zero-membership versus full lift. |
| 4 | HW Remark2.4, p.5, lines197–205 | Higher coefficient-exponent warning; no inference that all prime powers vanish. |
| 5 | HW Definition3.2, p.9, lines340–353 | Outer exponent via power action; package corrects the later p=2 least-divisor claim. |
| 6 | HW §3 before Proposition3.3 and Remark3.4, pp.9–10, lines353–385 | Conjugacy-power evaluation and the fixed-class condition. Does not identify all invariant abelianized vectors with fixed classes. |
| 7 | HW Proposition4.1 and equations(4.1)–(4.2), pp.11–12, lines453–490 | Restriction kernel/Bogomolov finite-group input. Geometric Brauer identification remains outside this package. |
| 8 | HW Definition4.3, p.13, lines512–540 | Cyclic restriction kernel; the five-dimensional module here is explicitly the author's example. |
| 9 | HW Lemma4.6, p.14, lines560–565 | Strict inequality 2p^m>n gives exponent bound. |
| 10 | HW Lemma4.7, p.14, lines566–604 | Cubic correction and binary two-involution proof; the least outer exponent and divisibility wording require corrections. |
| 11 | HW Remark4.10 and(4.8), p.15, lines618–667 | Sparse conjugation, signed distance terms and action through adjacent entries. |
| 12 | HW Remark4.11, p.15, lines668–677 | Reversal by inverse transpose, including the minus on transvections. |
| 13 | HW Lemma4.12, p.16, lines682–688 | Fixed second-diagonal vector lifts to a fixed conjugacy class. |
| 14 | HW Lemma4.13, pp.16–17, lines689–732 | Boundary generation; the final central factor parameter must be a₂. |
| 15 | HW Lemma4.14, p.17, lines733–744 | Explains downstream use of the boundary and small-rank exponent; the geometric Brauer target itself is not replanned here. |
| 16 | HW Lemma4.15, pp.17–18, lines745–771 | Boundary dual cyclic vanishing and pointwise scalar argument. |
| 17 | HW Remark4.17, p.18, lines776–787 | Limitation beyond length five; the 1036 enumeration is the package's own verified witness. |
| 18 | HW Definition5.2, pp.18–19, lines789–820 | Row/column boundary positions and overlapping corner. |
| 19 | HW Proposition5.3 and proof, pp.19–21, lines821–926 | Nonarchimedean refinement, cup cancellation, retraction stabilizer. Archimedean extension is separately proved here. |
| 20 | HW Remark5.4, p.19, lines824–828 | Relation to ordinary local Massey vanishing. Mináč–Tân is named historically; the roadmap proves the result by the preceding refinement. |
| 21 | HW Lemma5.5, p.19, lines830–842 | Splitting cocycle/cup formula; blanket discrete Hom is too broad, corrected by finite quotient here and pointwise Hom at supplier. |
| 22 | HW proof of Theorem5.1, p.22, lines929–967 | Uses local solvability at all places; missing real-place explanation is supplied by Layer8. |
| 23 | HW Proposition6.1, p.23, lines974–1009 | Fixed-class generation for n4,5; endpoint-zero subgroup indexing correction. |
| 24 | HW Example6.3 and subsequent discussion, p.24, lines1029–1043 | Nonzero full cyclic kernel and failure at n6; package does not attribute its independent five-dimensional example to this passage. |
| 25 | HW Remark7.1, p.25, lines1044–1062 | General pairings, translated cups and Massey convention. |
| 26 | HW Example7.2, p.25, lines1063–1094 | Hom-coefficient matrices; the package retains the finiteness assumption introduced immediately afterward. The unrestricted discrete-Hom example has the same continuity problem as Lemma5.5. |
| 27 | HW Proposition7.3,(7.2)–(7.3), pp.26–27, lines1095–1153 | Twisted correspondence; fixed adjacent cocycles needed for a bijection. |
| 28 | HW Theorem7.4 local step, pp.27–28, lines1154–1200 | Kill rank-one diagonal characters by prime-to-p extension; descend local obstruction. Boundary is internal, not external, sum. |
| 29 | HW Theorem7.5, p.28, lines1201–1206 and proof lines1287–1335 | Defined nonvanishing constant-ℤ/8 triple. |
| 30 | HW Lemma7.6, pp.28–29, lines1207–1234 | Independent cyclic-eight extensions; imported from IG rather than replanned. |
| 31 | HW Lemma7.7,(7.4),(7.6), pp.29–31, lines1235–1335 | Wang class, dual coordinates and nonsurjectivity leading to nonzero Sha² kernel. |
| 32 | Michailov §1, pp.1–2, lines20–43 | Restriction-kernel background; final obstruction sentence has vanishing/nonvanishing slip. |
| 33 | Michailov §3,(3.1)–(3.2), pp.4–5, lines130–170 | Transvection commutators and lower-central/support indexing; last nontrivial corner term is not zero. |
| 34 | Michailov Theorem3.1, CaseI, pp.5–7, lines171–268 | Endpoint collection for the full unitriangular group. |
| 35 | Michailov Theorem3.1, CaseII, p.8, lines271–307 | General gap-ℓ groups; the printed distance-one wedge cannot be an element of that subgroup. Package uses two distance-ℓ inputs. |
| 36 | Moravec §2, pp.3–4, lines102–174 | Nonabelian exterior square and commutator map; translate the presentation convention consistently. |
| 37 | Moravec(3.0.1), Lemma3.1, p.4, lines175–210 | Abelian/bicyclic restriction tests and commuting-wedge kernel. |
| 38 | Moravec Theorem3.2 and §4(4.0.1), pp.5–6,9–10, lines218–267,440–495 | Character duality and the CP exterior-square presentation. Finite-group hypothesis is retained for duality. |
| 39 | Dwyer Theorem2.4 | Settled uncertified/paywalled. HW Proposition2.2 and footnote verify the cited correspondence and sign change indirectly; no claim to have read Dwyer's text. |

## Not verifiable

- Fresh elaboration and elaborated `#check @name` signatures were not available. The supplied signature attempt failed on a missing Tau Ceti object file; the brief prohibits Lean builds/commands in this read-only pass. I compared all 17 written signatures, explicit binders, native carriers and instances statically, and did not fabricate an elaboration result. No package signature was changed.
- Dwyer, Theorem2.4, remains **uncertified** under its existing manifest key. It is settled by the brief and was not requested or fetched again. The readable HW restatement and direct matrix calculations support the uses here.
- The two declared supplier gaps are future contracts, not completed proofs at these pins. Their precise statements, owners and matching slugs were verified; completion was not asserted.
- Finite enumerations test the displayed examples, not the universal theorems. The general statements were audited through their algebraic arguments and cited source proofs; no formal proof certification is claimed. The published editions' pagination was not checked; the README and manifest consistently cite the legal preprint versions actually read.

## Source issues

- **Error** in HW at Lemma5.5, printed p.19: the source says arbitrary discrete coefficient modules permit the discrete Hom splitting cocycle; it should be finite or suitably finitely generated quotient, or pointwise Hom in general; affects the proof.
- **Error** in HW at Proposition7.3, printed p.26: the source says lifts biject with defining systems of cohomology classes; it should be defining systems with fixed adjacent cocycles, followed by representative-change invariance; affects a stated result.
- **Error** in HW at Definition3.2 and Lemma4.7, printed pp.9,14: the source says the least outer exponent is p also at p=2; it should be 1 at p=2, with power action still factoring through units modulo p; affects a stated result.
- **Misprint** in HW at proof of Lemma4.7, printed p.14: the source says the exponent is divisible by nine; it should be that the exponent divides nine; affects the proof.
- **Misprint** in HW at proof of Lemma4.13, printed p.17: the source says the central elementary factor has parameter one; it should be parameter a₂; affects the proof.
- **Misprint** in HW at proof of Proposition6.1, printed p.23: the source says the endpoint-zero subgroup is a copy of the size-four unitriangular group; it should be the size-five group; affects the proof.
- **Error** in HW at local proof of Theorem7.4, printed p.28: the source says the boundary is an external sum of the full first-row and last-column parts; it should be their internal sum, with the common corner counted once; affects the proof.
- **Gap** in HW at Proposition5.3 and proof of Theorem5.1, printed pp.19,22: the source says the nonarchimedean lifting proposition gives solvability at every place; it should be supplemented by the real-place argument and the trivial complex case; affects the proof.
- **Misprint** in HW at proof of Proposition5.3, printed p.19: the source says the easy-case homomorphism lifts to the center; it should be that it lifts to the unitriangular group; affects the proof.
- **Misprint** in HW at proof of Proposition5.3, printed p.21: the source says the retraction has vector arguments in column-row order; it should be row-column order as in its defining formula; affects the proof.
- **Misprint** in Michailov at §3, printed p.5: the source says the penultimate lower-central term of the size-m group is trivial; it should be the corner subgroup, with the next term trivial; affects a stated result.
- **Error** in Michailov at Theorem3.1 CaseII, printed p.8: the source says a minimal wedge uses a distance-one factor inside a gap-ℓ subgroup; it should use two distance-ℓ factors inside that subgroup; affects the proof.
- **Misprint** in Michailov at §1, printed p.2: the source says vanishing of the Bogomolov multiplier obstructs rationality; it should be nonvanishing; affects nothing.
- **Error** in HW at Example7.2, printed p.25: the source says Hom between arbitrary Galois R-modules carries the induced discrete Galois-module structure; it should require smoothness of that Hom action, for example finite source, or use pointwise topology; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f88d25fd07db6e429e218b909e5fd6264b1ebbfc", "job": "RT-ProfiniteCohomologyPartII~2a", "model": "gpt-6-astra", "worker": "chris-30"} -->
