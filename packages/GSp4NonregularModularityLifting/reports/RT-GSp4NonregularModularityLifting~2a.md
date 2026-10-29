<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1219#issuecomment-6486120101 -->
Red team round 2 pass a (codex) of 4d3145d

Verdict: needs_changes

1. **F01** (P1) Neither operator need be invertible on the whole complementary summand

   **Location:** `packages/GSp4NonregularModularityLifting/README.md:380`: “on its complement one of them is invertible.”

   **Claim:** The complement of the simultaneous residual-root factor has one globally invertible root-difference operator.

   **Witness:** The section’s own Check at line 394 has T−c=diag(0,1), Q−d=diag(1,0). The joint selector is zero, its complement is k², and both determinants are zero.

   **Exact repair text:** “Its complement is the direct sum of the factor where T−c is invertible and the factor where T−c is topologically nilpotent and Q−d is invertible. On each joint local factor outside the selected summand, at least one root difference is invertible.”

   **Repair test:** For the displayed matrices these two complementary factors are ke₂ and ke₁; the respective invertible differences act by 1. Their sum is k², without claiming either operator is invertible on that sum.

2. **F02** (P3) The new paramodular twist Check uses the wrong inverse

   **Location:** `packages/GSp4NonregularModularityLifting/README.md:164`: “twisting by χ∘ν preserves every paramodular fixed space and reduces the contract to trivial central character.”

   **Claim:** If χ²=ω, twisting a representation of central character ω by χ∘ν makes its central character trivial.

   **Witness:** Since ν(zI₄)=z², the twisted central character is ω(z)χ(z)²=ω(z)². For unramified ω with ω(ℓ)=2, its value becomes 4, not 1.

   **Exact repair text:** “An unramified central character ω has an unramified square root χ over an algebraically closed field. Twisting by χ⁻¹∘ν preserves every paramodular fixed space and gives trivial central character, since ωχ⁻²=1.”

   **Repair test:** At the uniformizer, 2·(√2)⁻²=1; on the paramodular group the twisting character remains 1. This is a new error in the repair of a.F03; the repaired theorem’s unramified-central-character hypothesis itself is correct.

3. **F03** (P2) The local regularity gap asks again for an existing supplier theorem

   **Location:** `packages/GSp4NonregularModularityLifting/README.md:122`: “Supply the p-distinguished pure semistable weight-two symplectic ordinary point regularity, dimensions and unique-component/conductor comparisons”.

   **Claim:** These conclusions require the declared extension of LocalGaloisDeformationRings §6.29.

   **Witness:** `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:3504–3510`, §6.31, already gives all-p pure distinguished ordinary-point regularity, dimension sixteen and uniqueness, retaining the flag. Its §§1.22 and 2.24 supply pure-point smoothness and componentwise conductor constancy away from p.

   **Exact repair text:** “Use LocalGaloisDeformationRings §6.31, based on §6.29, for pure distinguished ordinary points, their dimension sixteen and unique component, including p=2 and the chosen flag. Away from p use §§1.22 and 2.24 for pure-point smoothness and conductor constancy on a common component; apply the latter to the underlying rank-four representation.” Remove the now-redundant `gap:dyadic-ordinary-local-regularity` from the README and the plan’s gaps, and replace its uses by these citations. If a further comparison is intended, state only that additional comparison as a separate precise gap.

   **Repair test:** At p=2 the cited §6.31 has no p>2 restriction and transfers regularity to the image ring precisely when the point is distinguished. The dimension is sixteen, not an odd-prime extrapolation. Away from p, the forgetful map carries a common symplectic component into a rank-four component, and purity gives the required unique-component points.

4. **F04** (P2) The repaired theta recipe omits the second derivative

   **Location:** `packages/GSp4NonregularModularityLifting/README.md:765`: “Compose the Gauss–Manin connection with the inverse of the Kodaira–Spencer isomorphism and the unit-root projection, then with the Schur projection”.

   **Claim:** This single-connection recipe constructs both scalar determinant theta and the vector contraction operator.

   **Witness:** Yam14 line 1164 defines scalar theta as a composition of two ordinary operators. One derivative has symbol linear in Q; det(Q) is quadratic: at p=7, Q=I gives 1, whereas 2Q requires 4, not 2.

   **Exact repair text:** “Split H¹_dR using the unit-root complement to the rank-two Hodge bundle ℋ. The vector operator uses one projected Gauss–Manin derivative followed by contraction. For scalar theta, compose the first projected derivative into detᵏ(ℋ)⊗Sym²(ℋ) with the second projected derivative and the determinant projection into detᵏ⁺²(ℋ), normalized so that its Fourier multiplier is det(Q). Prove the second-order change-of-frame and pole-cancellation identities before multiplying by the Hasse invariant.” Cite Yam14 §3.3, Propositions 3.5–3.10, especially Proposition 3.8 (author p.21; line 1164), rather than §3.2 for this construction.

   **Repair test:** Two derivatives give degree two in the Fourier index: det(I)=1 and det(2I)=4 in F₇. One vector derivative still scales its contraction by 2. H¹_dR has rank four, split as rank two plus rank two; a Hodge line cannot supply that splitting. The earlier circular-dependency finding a.F05 is repaired, but its replacement recipe needs this correction.

5. **F05** (P3) Several data definitions lack three discriminating Checks

   **Location:** `packages/GSp4NonregularModularityLifting/README.md:291–293,315–317`: “A U₂ prime uses Klingen”; “The pairing constraints involve αδ and βγ”.

   **Claim:** The three bullets in each block test the preceding data definition.

   **Witness:** These quoted bullets merely repeat the definitions. In §0.4 the other bullets repeat the empty-product convention and the exclusion predicate; in §0.5 only the F₁₃ example computes a nontrivial instance.

   **Exact repair text:** Replace §0.4’s block by: “At p=11,a=4,q=5, scalar roots (2,2,2,2) have multiplier 4=q³ and ratio set {1}, avoiding q. Roots (1,5,3,4) have the same multiplier 4 but ratio 5 and fail.” “At p=5,Q={11}, the full diamond group has order 10 and its maximal p-quotient order 5; they are different covers.” “At full auxiliary level 3, −I reduces to 2I≠I; at level 2 it reduces to I, so that level does not exclude this torsion element.” Keep the U₂ level rule in the definition.

   In §0.5 keep the existing F₁₃ example and replace the two remaining bullets by: “Relabel (2,4,11,9) as (2,11,4,9): paired products remain 5 but the selected and complementary plane products become 9 and 10, so the separation condition now holds.” “For p=5,N=2, x=11 gives x−1=10, divisible by 5 but not 25; x=101 gives x−1=100, divisible by 25.”

   **Repair test:** 5·3=4 in F₁₁; 11−1=10; −1=2 in F₃ and 1 in F₂; 2·11=9 and 4·9=10 in F₁₃; v₅(10)=1 and v₅(100)=2. These detect wrong root tests, the full-versus-p diamond quotient, neatness at 2, pairing labels and requested depth.

6. **F06** (P1) A normalizer transport need not exist at a general neat level

   **Location:** `packages/GSp4NonregularModularityLifting/README.md:874`: “identifying the reverse action with the forward one composed with the action of an element of SL₂(ℤ/N) normalizing Γ”.

   **Claim:** The reverse double coset can always be recovered from the forward one by a tame normalizer action, for all neat tame levels.

   **Witness:** Modulo 5, let H=⟨[[0,1],[4,1]]⟩ and D=diag(2,1). Then diag(1,2) belongs to neither N(H)DH nor HDN(H). Lift H to level 15 with principal level 3; take p=7.

   **Repair test / reproducible calculation:** Define Γ={g∈SL₂(Z): g≡I mod 3, g mod 5∈H}. This is a congruence subgroup contained in Γ(3), hence neat, of tame level dividing 15. Its reduction modulo 5 is H. The determinant-seven forward representative reduces to D=diag(2,1), and the reverse representative to D∨=diag(1,2). Write A=[[0,1],[4,1]]. It has order six and A⁻¹=[[1,4],[1,0]]. If D∨ belonged to N(H)DH, some n_j=D∨A⁻ʲD⁻¹ would normalize H. A normalizer must conjugate A to A or A⁻¹, since those are the only generators of the cyclic group H. Direct multiplication gives:

   | j modulo 6 | n_j A n_j⁻¹ over F₅ |
   | --- | --- |
   | 0,3 | [[0,4],[1,1]] |
   | 1,4 | [[3,2],[4,3]] |
   | 2,5 | [[4,1],[2,2]] |

   None is A or A⁻¹. For the other composition order, the candidates D⁻¹A⁻ʲD∨ give the same three conjugates, so D∨∉HDN(H) too. Because H⊂N(H), inserting the two H factors of the forward double coset does not evade this obstruction. Reduction modulo 5 therefore rules out the asserted normalizer transport at level 15. The principal-level example at line 883 works because its residual level subgroup is trivial; it does not test this case.

   **Exact repair text:** “Keep the reverse correspondence Δ∨=Γ diag(1,p) Γ as a separate correspondence at every tame level. Reciprocity relates F_Δ and F_Δ∨. A same-level normalizer transport may be used only after proving the corresponding double-coset identity for that level. For arbitrary neat levels, construct the forward and reverse maps between the appropriate level/cusp Fourier spaces and prove the scalar vanishing argument with their actual tame Hecke actions. The two-correspondence recurrence and the deduction of the needed scalar exclusion from the stated arithmetic data are local targets and explicit premises of the scalar endpoint; no normalizer identification is assumed.” Add the level-15 example above as a negative-control Check. This retains all neat tame levels and removes the false claimed method; it does not declare the general recurrence proved.

   The original a.F11 repair correctly introduced Δ∨, but did not repair the full general-level argument: its new universal normalizer assertion is refuted here.

## Prior-finding verification

The fourteen findings are distinguished by the earlier pass letter. None was marked “not actionable in this package”; no settled finding is re-raised. Quotations below are from the repaired README at this head. “Repaired” concerns the original defect, not certification of every new proof step.

| Earlier finding | Status | Repaired passage and location | Recomputed witness / current owner |
| --- | --- | --- | --- |
| a.F01: six-point model duplicated | Repaired | §8.4, line 1218: “Import the six-point symplectic model” | AbelianSchemesAndArithmeticModuli A3.12, README:1723. Even subsets / complements have 32/2=16 classes; dimension 4; Sp₄(F₂) has 15·8·3·2=720 elements. |
| a.F02: residual pairing duplicated | Repaired | §3.3, line 681: “Import the residual realization and its absolutely irreducible symplectic pairing” | ModularityAndLanglandsExtensions §3.30, README:2544, includes a≥b≥2 and absolute irreducibility for the alternating pairing. At p=7 shifts t=6 and t=2 give multiplier factors ε̄⁻¹²=1 and ε̄⁻⁴≠1. |
| a.F03: paramodular central character | Repaired; new Check error S02 | Contract, line 158: “with unramified central character” | At ℓ=7, 3I acts by ζ₃²≠1 after the ramified twist, so fixed vectors have dimension 0. This is excluded. README and plan gap sentences agree. |
| a.F04: adic / algebraic eigenspaces | Repaired; new complement error S01 | §1.2, line 380: “Modulo every ϖᵐ its image is the intersection of the two algebraic generalized root submodules” | For T=16,c=5 over Z₁₁, 11ⁿ→0 but ker(11ⁿ)=0. Modulo 11ᵐ the m-th power is zero, so the finite-level selected space is the full module. Mathlib Eigenspace/Basic:71,89. |
| a.F05: circular theta proof | Repaired; replacement needs S04 | §4.2, line 763: “The proof is ordered in three steps, each a target of this subsection.” | No self-supplier remains. A4.3 supplies the connection and C5.12 the rank-three Kodaira–Spencer isomorphism. On k[[t]]/(t²), D(t²)=2t≠0 for p>3, so the prohibited truncated derivation is explicitly rejected. |
| a.F06: unsupported singular crystalline specialization | Repaired as to the missing continuation input | §2.4, line 501: “the analytic continuation of crystalline periods … from AutomorphicGaloisRepresentations §0.4” | That section exists at README:794 and includes the Galois group of a finite local extension and φ to the residue-degree power. The new local target verifies its family hypotheses. Distinct roots (1,2,3,4) yield six nonzero differences; (1,1,2,3) yields five and fails. |
| a.F07: projector Checks fail to distinguish zero | Repaired | §6.1, line 985: “R(6)=(−2)(−1)(4)=8≠0” | In F₁₁, eigenvalues are 6,8,7,2; R takes values 8,0,0,0. Eventual factorial powers give 1,0,0,0. Two commuting selectors multiply to diag(1,0,0,0). |
| a.F08: annihilator in wrong ring | Repaired | §3.2, line 667: “Jsel=Ann_Tsel(ke₁)=0” | Ann over k×k is 0×k; over the selected image k it is 0. Over O acting on O/ϖᵐ it is ϖᵐO. |
| a.F09: impossible surjective p=7 example | Repaired | §8.3, line 1210: “At p=11 and a=4 the exponent 1−a=−3 is prime to p−1=10.” | gcd(3,10)=1, 5³=4 mod 11. At p=7, cubes have only two values, so the multiplier cannot surject onto six units. |
| a.F10: geometric Frobenius inverted | Repaired | §8.3, line 1199: “q=ε̄(σ)⁻¹≢1 modulo p” | In F₁₁, q=5, ε̄=9 and 9⁻³=4=2². The former q=ε̄ formula would give 9 instead of 5. |
| a.F11: same-coset neighbor reciprocity | Partly repaired; S06 | §4.7, line 874: “Prove [P]∈F_Δ([Q]) exactly when [Q]∈F_Δ∨([P]).” | The matrix in line 883 has determinant 7. Its neighbor coefficients (1208,−930,179) have discriminant −28 and residue (3,0,4) mod 5; Q has residue (2,0,1). Transport diag(3,2) gives (27,0,16)≡(2,0,1). The reverse-coset statement is correct, but the new normalizer transport is false at the level-15 example in S06. |
| b.F01: empty supersingular rank-one locus | Repaired | §3.1a, line 634: “a unit on the rank-one open and vanishes along the reduced supersingular curve to order two” | P20 line 1652: at p=5 secondary weight 24, square-root weight 12, vanishing orders 2 and 1. The rank-one open has nonzero section, not a supersingular zero. |
| b.F02: strong-oddness Check restates definition | Repaired | §11.2, line 1568: “its local classes µ_v vanish at every real place” | The supplier’s §1.2(1) gives dim µ_v=0 for Ψ₄ and 1 for I₄ in characteristic two. All Ψ₄ places fail the existential condition; one I₄ place satisfies it. |
| b.F03: ShimuraData heading drift | Repaired | Contract, line 148: “Pilloni genus-two convention comparison” | Exact current heading in ShimuraData §5.18, README:1535. Its (k,r)=(0,2) substitution is (−1,0;4), agreeing with this package. |

## Verified sound

Read all 1683 README lines and all 44 Suggested.lean lines. The statement inventory is 61 numbered target sections; bold material consists of the summary, normalization Checks and Check-block labels, not additional hidden theorem declarations. Read and assessed all 220 Check bullets. The table below records 61 target-by-target batches with actual computed values, including failed tests and conditional conclusions. There are zero Lean declarations, zero local definitions, zero instances and zero examples. Thus the declaration/context inventory and the mechanical `#check @name` comparison have zero entries; no Lean command was run.

The four main endpoints are §8.2–§8.5 minimal lifting, §9.2–§9.4 family lifting, §10.7 characteristic-zero local freeness, and §11.3–§11.6 multiplicity one and classical weight-two lifting. The additional deep milestones are §1.1, §2.3–§2.8, §3.1a, §3.4, §4.2, §4.8, §5.2, §6.4 and §7.4. All are identified in the Lean module docstring with their missing carriers. Searches at the pins for Siegel, GSp₄/GSp4, Hida, Klingen and crystalline-period carriers found no carrier making these arithmetic statements expressible by a few simple definitions. The hits for Siegel in generic analytic/number-field files and for transvections do not provide those carriers. No headline has been replaced by scalar algebra, no padding is present, and there is no duplicate fully qualified Lean name.

Pinned declarations inspected: Mathlib `Module.End.genEigenspace` and `mem_genEigenspace_nat` at `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:71,89`; `IsIdempotentElem` at `Mathlib/Algebra/Group/Idempotent.lean:37`; `Matrix.symplecticGroup` at `Mathlib/LinearAlgebra/SymplecticGroup.lean:101`; `ZMod` in `Mathlib/Data/ZMod/Defs.lean`; Tau Ceti `ContCohomology.H1` at `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:725`. H¹ retains a monoid with topology, a topological additive group, a distributive action and continuous scalar action; its pointwise quotient topology is not discrete by definition. Generalized eigenspaces are kernels of powers and their union, not adic residual factors. The symplectic group is Sp, not a similitude group.

The manifest pins inspected are Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. The only import is `import Mathlib`; the namespace and module docstring have the required form. No `set_option`, admitted data, `lemma`, evaluator, process instruction or computational algorithm occurs in the acceptance file. The git comparison changes only this package folder. Comparing the plan with board main found no changed top-level key other than `gaps`. All 20 gap slugs and their needs sentences agree exactly between the plan and README; every gap names a supplier. S03 is the identified minimality exception, not an objection to a supplier’s implementation being absent.

### Statement and computed-instance ledger

All section references in this table are to `packages/GSp4NonregularModularityLifting/README.md`. Standing arithmetic coefficients are O, the integers of a finite extension of Qₚ, with finite residue field k. The zero ring is admitted only as an action image, never as that coefficient field. Rank four, finite tame sets, neat levels and the stated branch restrictions are retained; arbitrary ranks, noncompact coefficient groups, inseparable characteristic-zero field extensions and arbitrary non-quasi-separated schemes are not quantified inputs to these targets.

| Statement / context | Instances and values on the two sides | Result / change |
| --- | --- | --- |
| 0.1 roots; field, arithmetic roots units | F₁₁: (2,3) gives 3·8·(−1)·2=7; (2,6) gives last factor 0; (1,3) gives first factor 0. At α=0,β=2 the bare predicate is nonzero although α is not a unit. | Predicate/body equivalence holds over a field; arithmetic units are separately required. |
| 0.2 integer weight/Frobenius convention | Ω(0,2)=(2,2), λ=(−1,0;4); Ω(2,2)=(4,2), λ=(−3,0;6). At ℓ=3, ε=1/3 and ε⁻¹=3; multiplier squares for ±1 both equal 1. | Signs and negative integer powers agree; determinant cannot replace multiplier. |
| 0.3 CG data; p≥5, odd, fixed multiplier | p=7: a=4 satisfies 4<6, a=6 fails, a=5 gives ν(c)=1. Over F₇[η]/η², N₀²=0 but (N₀+η(E₁₂−E₃₄))²=η(E₁₃−E₂₄). | Artinian orbit and split-plane conditions exclude the wrong lifts. |
| 0.4 finite tame levels / q | Q empty gives deck order 1. At p=11,q=5, scalar 2I has multiplier 4, ratio set {1}; (1,5,3,4) has paired products 4 but ratio 5. | Definition excludes the latter; improve Checks by S05. |
| 0.5 labelled Klingen refinement | F₁₃ (2,4,11,9): pairs 5=5, selected/opposite products 8=8, so rejected. Exchanging middle entries gives products 9≠10. For p=5, x=11 has depth 1; x=101 depth 2. | Separation is independent of distinctness and requested congruence; S05. |
| 1.1 integral normalized Hecke images | d=0,r=2: valuations 4,3,3 allow p³, not p⁴ uniformly. In O/p³, p³·1=0 although 1≠0. At weight (2,2), discriminant 1 contributes X₂=1. | Integral divisibility before reduction is essential; central summand retained. |
| 1.2 joint selectors | diag(0,1),diag(1,0) yield selector 0, complement dimension 2 and determinants 0,0. Over Z₁₁, T−5=11 gives adic selector 1 but every exact kernel 0. | Adic repair correct; complementary invertibility false, S01. |
| 1.3 Katz occurrence | Zero space has 0 nonzero witnesses. A one-dimensional line with T=5,Q=7 at roots 2,3 has correct sum 5 but 7≠6; an Eisenstein line has cuspidal component 0. | Nonzero cuspidal simultaneous occurrence excludes all three wrong models. |
| 2.1 occurring coefficient field | Matrix [[0,2],[1,0]] satisfies A²=2I, eigenvalues ±√2, degree 2. In Q×Q an idempotent maps to 0 or 1, never 1/2; zero module has no occurrence. | Actual action images prevent transcendental/mixed characters. |
| 2.2 scalar no-Steinberg | (j,k)=(2,2), x=3: exponent −1, valuation −1; (4,2) and (3,3): exponent 0, valuation 0. Unit twists add valuation 0. | Contradiction is scalar-weight-specific. |
| 2.3 characteristic-zero interpolation | Roots 1,2,3,6: elementary sums 12,47,72,36; reciprocal polynomial coefficients 1,−12,47,−72,36. O and ϖO span E but have images k and 0 in O/ϖO. | Polynomial normalization and lattice limitation retained. |
| 2.4 qualified crystalline limit | (m₁,m₂,w)=(1,0,0): parity 1=1 mod 2; w=1 gives 0≠1. Roots (1,2,3,4) give six nonzero differences, repeated list gives five. | Distinct periods give dimension 4 only under continuation hypotheses; spherical condition excludes N≠0. |
| 2.5 ordinary weight-two representation | Paired products both ε⁻¹, determinant ε⁻²; at ℓ=3 these are 3 and 9. Replacing ε⁻¹ by ε gives 1/3 and 1/9. | Full multiplier and semisimplified local comparison distinguished. |
| 2.6 monodromy upgrade | With r(F)=diag(1,3), conjugation sends E₁₂ to E₁₂/3; both N=0 and N=E₁₂ satisfy the relation, ranks 0 and 1. | Semisimplification alone cannot choose N; purity and generic transfer remain hypotheses. |
| 2.7 dual-spin interpolation | w=0: exponents −1,−1,−2,−2; w=2: −2,−2,−3,−3. χ₂(u)=ζ₃ gives ζ₃⁻¹ rather than ζ₃. At p, trivial smooth factors give p⁻¹,p⁻². | Formal substitution is explicitly not an occurrence assertion; inverse correction necessary. |
| 2.8 completed isotypy | dim W=1,2 gives total dimensions 4,8; 3 is impossible. On E[t]/t², socle and residue quotient both dimension 1. Unipotent g has (g−1)²=0 but g−1≠0. | Full polynomial annihilation, not equality of traces, supplies isotypy. |
| 3.1 Hasse finite-level shifts | (4,2)→(4+t,2+t) leaves difference 2; p=5,m=3 requires 25 dividing s, so s=5 fails and 25 works. Hasse q-series is 1, hence coefficients unchanged. | Finite precision and weight threshold kept distinct from p-action compatibility. |
| 3.1a secondary Hasse | At p=5 weight (p−1)(p+1)=24, square-root weight 12, orders 2/1. Rank-one BT₁ has primary value 0 and secondary value a unit. ε on k[ε]/ε² is pointwise 0 but nonzero. | Correct strata; reducedness and component nonvanishing each needed. |
| 3.2 annihilators / injections | k×k on ke₁: full-ring annihilator 0×k, image-ring annihilator 0. O on O/ϖᵐ: annihilator ϖᵐO. Zero module: annihilator whole ring, quotient 0. | Repaired acting-ring distinction correct. |
| 3.3 residual pairing / central transport | Roots 1,2,3,6 pair to 6 and determinant 36. F₇ roots 1,2,3,4 have pair products (4,6),(3,1),(2,5), none equal. t=6 gives exponent −12≡0 mod 6; t=2 gives −4≠0. | Pairing imported; trace/determinant and arbitrary weight shift insufficient. |
| 3.4 regular Hecke-valued system | (a,b)=(4,3): exponents 0,−1,−3,−4, paired sums −4. b=2 gives the repeated exponents 0,0. Extra generator values 0 versus 1 stay unequal despite matching away-p generators. | Regular theorem and selected-image comparison have the correct separate roles. |
| 4.1 formal coefficient operators | F₅ Legendre values at d=1,2,0 are 1,−1,0, each satisfies x³=x. d(pQ)=p²d(Q), so UX₂=0. Q=(1,0,p) is primitive but d=−4p=0 mod p. | No division by discriminant; p=2 excluded. |
| 4.2 scalar/vector theta | F₇ rank-one contraction −2=5, determinant 0; doubling coefficient gives 10=3. Scalar k=6 Hasse gives Θ(1)=0; k=8 gives 8·15=1 mod 7. Q=I,2I have determinants 1,4. | Weights/exceptions correct; ordinary scalar recipe needs second derivative, S04. |
| 4.3 source and U-envelope | Nilpotent block J has Je₂=e₁, J²e₂=0. On β-eigenline α=1,β=3,m=1, projection gives 1 while U−α gives 2. | Generalized blocks and normalized projector are not confused. |
| 4.4 ordinary envelope | For J²=0, intersection of JⁿW is 0; for U=I it is W. In F₁₁, 6³−6=210=1; for c=1 it is 0. | Scalar injectivity uses the explicit root exclusion; U-iteration occurs on W. |
| 4.5 all-index contraction | det M=p yields factor 0 after reduction. Q=(1,0,p) has det=p,d=−4p. At p=7, det values 1,2 are squares while discriminants 3,6 are nonsquares. | Correct discriminant convention; geometric/covariance theorem remains a named conditional obligation. |
| 4.6 constrained kernels | α=2,β=3: T=5 and U=2 give Z=3. Scalar coordinates give U=(2,0), Z=(3,5), hence T=(5,5). Jordan e₂ gives Ue₂=αe₂+e₁. | Equalities are for spectrally reduced vectors, not all generalized vectors. |
| 4.7 cuspidal vanishing | 3·4=1 mod 11; βθF=0 gives θF=0. Constant series has no positive discriminant. Γ(5),p=7 neighbor residues (3,0,4)≠(2,0,1), reverse transport restores latter. | Cuspidality and reverse coset retained; universal normalizer transport fails, S06. |
| 4.8 two composite injections | Zero projector after a one-dimensional Hasse inclusion has kernel dimension 1. In O/ϖ², ϖv reduces to 0 directly but gives a nonzero first torsion-layer vector. Roots 2 and 3 give two distinct selected labels. | Actual composite and both labels are required; finite-level induction keeps torsion layers. |
| 5.1 unramified plane | Lifts of e₁,e₂ have a unit 2×2 minor 1 mod ϖ; lifts of e₁,e₁ have minor 0. Nontrivial inertia multiplier versus trivial action on the plane forces pairing 0. | Rank two, independence and isotropy are genuine conditions. |
| 5.2 singular minimal deformation | χ,χ,χ⁻¹,χ⁻¹ have paired products 1. At a=2 first exponents 0,0, giving two unramified lines; replacing the plane by one line changes rank 2 to 1. | Maps distinguish Rmin and auxiliary RQ, with scalar inertia retained. |
| 6.1 Klingen block projector | F₁₁ block eigenvalues 6,8,7,2, R-values 8,0,0,0. F₁₃ selected/opposite products both 8 give R(8)=0. Product of two specified projectors is diag(1,0,0,0). | Repaired Checks detect zero and identity wrong models. |
| 6.2 high-weight comparison | q=11,p=5: degree-normalized composite 1/2−5δ/516 reduces to 3; unnormalized 6−5δ/43 reduces to 1. Klingen degree reduces to 4 and selected contribution to 1/4. | Correct inverse is v_Q⁻¹ trace; empty Q gives v_Q=1. |
| 6.3 nonordinary descent | In k×k, (1,0)(0,1)=0; in k[x,y]/xy, xy=0 with y≠0. A high-weight H¹=0 makes lower H¹ the cokernel of H⁰→H⁰(divisor). | Nonzero on every component and the cokernel comparison cannot be omitted. |
| 6.4 finite-coefficient level comparison | O/ϖ² has length 2=1+1; O/ϖ⁰=0 has length 0 and is not the induction base. Empty Q gives identity pullback, trace and normalization. | m≥1 and connecting maps retained. |
| 7.1 dual coherent module | a=4 gives L=ω(1,−1); ordinary O-linear Hom(E/O,O)=0, while Hom(E/O,E/O)=O. Δ=1 gives S=O. | Negative weight is integer-valued; correct fraction-quotient dual used. |
| 7.2 H² / torsion-free homology | Multiplication by ϖ on E/O is surjective and dual O has ϖ-kernel 0; on k it is zero and cokernel k. a=2 fails 4≤a. | The uniform weight-two H² hypothesis is retained. |
| 7.3 whole-module balance | S=O[Cp]: d(S)=1−0=1; cotangent dimension 2 gives d(k)=1−2=−1; d(S⊕k)=0. At p=7,a=5: 7>3 but 5>5 false. | Additivity does not imply summand balance; corrected numerical range distinguished from the odd arithmetic branch. |
| 7.4 selected balance | Selecting k in S⊕k gives defect −1 while whole defect 0; selecting S gives 1; zero projector gives defect and rank 0. | Separate selected-rank supplier contract is needed; occurrence supplies positivity later. |
| 8.1 balanced patching datum | Paired inertia χ·χ⁻¹=1 twice; untwisted 1,1,u,u has multiplier u. For odd p, near-identity square-root character at trivial diamond equals 1. | Fixed full multiplier and one Klingen diamond direction retained. |
| 8.2 minimal R=T and positivity | Ann_T(T¹)=0; Ann_T(T⁰)=T. O[ε]/ε²→O has kernel (ε) although O acts faithfully on O. | Positive freeness over the source, not target faithfulness alone, proves injectivity. |
| 8.3 a≥4 endpoint | p=7,a=4 passes 4<6; p=5,a=4 fails 4<4. At p=11, 5³=4, 5⁻¹=9, 9⁻³=4; at p=7 multiplier cubes have image {±1}. | Repaired surjectivity and Frobenius examples consistent. |
| 8.4 arithmetic illustrations | Six-point quotient size 16; transposition fixes 8 (dimension 3), 3-cycle fixes 4 (dimension 2). A quadratic twist becomes isomorphic geometrically, giving diagonal rather than product image. | Imported model; geometric nonisogeny required for product image. |
| 8.5 classical minimal corollary | a=4 weights 0,0,3,3, pair sums 3. Slopes {0,3} contain no pair differing by 1, so N=0 for a semistable ordinary lift. a=2 slopes {0,1} allow rank-one N. | No automatic crystallinity asserted at weight two. |
| 9.1 P12 data | p=5 requires neatness; p=7 permits alternative. In F₅, ε-value 2 has inverse 3≠2; ordered ratio 2 is excluded while inverse 3 need not be. | Flag and exponent dictionary remains a declared gap, not an equality of raw predicates. |
| 9.2 family R=T | Λ=O[[w₁,w₂]]/(w₁,w₂)=O; Λᵈ specializes to Oᵈ. Λ/(ϖ) has ϖ·1=0 with 1≠0, so not flat. At (2,2), i=(0,0,−1,−1), −i=(0,0,1,1). | Flatness and convention comparison are real hypotheses. |
| 9.3 ordinary p-adic forms | κ=(4,2): i=(0,0,−3,−3); (2,2): (0,0,−1,−1); (1,1): (0,1,0,1). t and t+ϖ agree mod ϖ but differ in E. | Integral weights are not all classical weights; residual matching is weaker than characteristic-zero matching. |
| 9.4 parabolic family | k′=2 gives (0,0,−1,−1); k′=3 gives (0,−1,−2,−3). Deformation ratio ε versus automorphic ε⁻¹ differs at ε=2 in F₅: 2≠3. | One weight variable versus two does not change Galois rank 4. |
| 10.1 BCGP data, including p=2 | At p=2,r=7: r=1 mod 2 but 3 mod 4; r=5 is 1 mod 4. A nontrivial 2-power character ψ has residual inertia 1 and actual inertia ψ≠1. | Lift-unramifiedness and dyadic congruence distinct; local regularity gap redundant, S03. |
| 10.2 four Hida modules | One depth-N rank-two torus has size p²ᴺ; p=2,N=2 gives 16 versus rank-one size 4. χ(u)=ζ₃ becomes ζ₃⁻¹ under inversion. | Four separate modules and partial center retained; character involution visible. |
| 10.3 weight/diamond freeness | For d=3 and Δ of size 16, Λ-rank is 48. At p=2, valuation of 8 is positive, so 1/8∉O. Zero module has rank 0. | No integral Weyl averaging; freeness does not prove support. |
| 10.4 action image | End of zero module is zero ring. Generators differing by an action-kernel element induce difference 0. Multipliers ±ν give equal determinant ν². | Zero image permitted; full multiplier still separate. |
| 10.5 deformation action | There is one unital map R→0. Two evaluations have common kernel ker ev₁∩ker ev₂. Diamond value u=ζ₃ differs from u⁻¹=ζ₃². | Actual evaluations and correctly oriented diamond action required. |
| 10.6 projective Satake / norm | k[C₂] in char 2: norm [1]↦1+g≠0, both spaces dimension 1. Trivial k-module: norm 1↦0, invariants dimension 1. Δ=1: norm 1. | Projectivity replaces division by 2 or 8. |
| 10.7 local freeness | Coefficient of t in (1+t)ᵖᴺ−1 is pᴺ≠0, so relation is never in (t²). E[[x]]→E[[x]]/(x²) has relative cotangent 0, kernel (x²)≠0. | Cofinal open cutoffs and genuine patching comparison retained; rank 0 allowed. |
| 11.1 R-regular weights | R=3: (−4,−1) gives gaps 3,3; (0,3) gives 3,−5; swapped pair gives first gap −3. R=0,(0,0) gives 0,1 and in any event fails R≥1. | All four Checks agree with h₂−h₁ and 1−2h₂; no finding. |
| 11.2 seeds | Ψ₄ at every real place gives dim µ_v=0, no strong-odd place; I₄ at one place gives dim µ_v=1. In E[x,y]/xy the origin lies on 2 components. | Nonzero local class and unique-component clauses distinguish bad seeds. |
| 11.3 regular-point multiplicity | Q₇[t]/(t²−3) has degree 2 because squares mod 7 are 0,1,2,4. Rank-one fiber has E′-dimension 1 and E-dimension 2. Tensor of one-dimensional local lines has dimension 1. | Residue-field dimension correctly used; zero fiber excluded. |
| 11.4 support | E×E acting on E×0 has fibers dimensions 1,0. E[ε]/ε² acting on E has full topological support but annihilator (ε). At p=3, 7≡1 mod 3 but not mod 9; 19≡1 mod 9. | Seed support is component-specific; no global reduced R=T inferred from mere nonvanishing. |
| 11.5 singular rank one | Four fibers each of E′-dimension 1 sum to 4; if [E′:E]=2 their E-dimensions are 2 each, sum 8. Rank-zero nearby fibers all have dimension 0. | Individual chamber ranks, not only their sum, are propagated. |
| 11.6 classical weight two | Four graded dimensions 1 sum to 4=4n, n≥1, hence n=1. Repeated Sen Jordan block has nilpotent rank 1 versus semisimple rank 0. Weights 0,0,1,1 retain multiplicity two each. | Singular classicality uses all four chamber inputs and de Rham semisimplicity. |

### Supplier and ownership ledger

Resolved 23 distinct supplier roadmaps and checked the named contract sections at their current permitted copies, including board designs where no published roadmap exists. The following are locators into those copies, not new dependencies. For service output with a heading comment, the line numbers below exclude that comment.

| Supplier | Resolved contract / verification |
| --- | --- |
| AbelianSchemesAndArithmeticModuli | A3.12, README:1723, owns the six-point model; A4.3, README:1881, owns the relative connection over a smooth base. |
| ArithmeticGaloisRepresentations | §5.11, README:3449; §§7.3–7.12, README:4247–5062. “Semisimplicity criteria” is a bold target inside §7.6 at line 4705, not the section heading. The integral-enormity extension is still a declared contract. |
| AutomorphicBundles | B3–B5, README:1702,3781,4505; B3.HT.4, .7, .8 at 3448,3647,3697. These supply the geometric coefficients and rational tower, not the missing normalized integral degree-one p-action. |
| AutomorphicBundlesPartII | IC.1–IC.8 in its board design at lines 69,253,381,719,850,1175,1384,1528. The whole characteristic-zero rank equality is not automatically a selected-summand inequality; the separate selected contract is necessary. |
| AutomorphicGaloisRepresentationsPartII | AG2.P at README:267 and GSp₄ construction at 526; AG2.5 at 1807, AG2.6 at 2138, GSp₄ crystalline comparison at 3368. The regular GSp₄ theorem has b≥3. |
| AutomorphicGaloisRepresentations | §0.4, README:794: finite free family, reduced Tate algebra, smallness, Sen polynomial, invertibility and injectivity; retains the local-field φᶠ version. |
| AutomorphicLFunctionsAndLocalFactors | AL.4, README:2790, local parameters, Satake and local factors. Monodromy is extra data, as the ranks 0/1 test demonstrates. |
| ModularityAndLanglandsExtensions | §§3.2,3.5(vii),3.9,3.26,3.30 at README:1831,1944,2040,2429,2544. Residual pairing and classification are imported, not rebuilt. |
| DeformationAndDerivedPatchingAlgebra | §§5.5–5.9 at README:1087–1189 and §§7.6–7.10 at 1451–1526. The three patching branches use different criteria; the projective norm and selected-defect examples distinguish them. |
| EndoscopicTransferAndUnitaryTraceComparison | §§11.1,13.2 at README:4153,4783; solvable descent retains restriction irreducibility and the central/Tate normalization. |
| GlobalGaloisDeformations | R04.3–R04.6 and G7 at README:398,674,1028,1412,1871. The one-direction Klingen and two-direction torus requests are expressly gaps, not miscitations of existing general presentations. |
| HodgeTateAndCanonicalSubgroups | §§0.2–0.5 and 0.14–0.15 at README:196–270,452,478. Pointwise Hodge–Tate maps do not supply the rational period cover; B3.HT is cited separately. |
| IntegralHeckeAndGaloisDeterminants | §§0.7,1.1–1.7,2.1–2.3 and IHG.3a–IHG.4. The scalar example 11ⁿ→0 versus ker 11ⁿ=0 confirms why its factorial powers, not just Mathlib eigenspaces, are used. The p>2 symplectic-descent restriction is not silently removed. |
| LocalGaloisDeformationRings | §§2.7,2.17,2.25,6.3,6.14,6.26–6.29 found at README:1778,1944,2080,2897,3148,3346–3411. The resolver’s two missing Lean-name leads are API names explicitly present here. Existing §6.31 yields S03. |
| PadicFamiliesPartII | K2, E6, S7 and F8 at design lines 329,963,1073,1211; named four-pieces, sen-cousin, de-rham-classicality and four-modules/central-character targets are present. Their separate overlap and balance premises are retained. |
| OverconvergentAutomorphicForms | §§8.6–8.7 at README:1462,1494: analytic coefficients and families; integral finite-torus averaging is not supplied. |
| PadicHodgeTheory | §§3.2–3.6,4.4,5.3–5.4 at README:665–754,894,1022,1050. The convention HT(ε)=−1 is accounted for by the package’s signs; de Rham finite-dimensional Sen semisimplicity is not asserted on arbitrary completed spaces. |
| ShimuraCompactifications | C3.9–C3.10, C5.12–C5.18; C5.12 at README:2479 has Sym² of a rank-two Hodge bundle, rank 3, mapping to logarithmic differentials. This exposes the “Hodge line” slip in S04. |
| ShimuraData | §§5.9,5.10,5.18 at README:1336,1360,1535; Ω(0,2) maps to (−1,0;4). The repaired heading is exact. |
| SmoothRepresentationsOfLocalGroups | SR.2.1–SR.2.3 and SR.4.1–SR.4.5 at README:1835–2124,3108–3514. Generic local theories are imported; the six specialized contracts remain declared requests. |
| OrdinaryAutomorphicFormsAndModularityLiftingPartII | Board-main design: §§1.2–1.3,2.1–2.2,3.1–3.2,4.7–4.8,5.2,5.4–5.6,6.3–6.4 all present. In §1.2, h³=1 and h¹=1−1−(−5)=5, not 6. The resolver’s absence from published/open roadmaps is not an unowned gap. |
| PotentialAutomorphyInfrastructurePartII | PL.4, strong residual oddness, design:1793; the Ψ₄ versus I₄ classes give µ dimensions 0 versus 1. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.1–R07.2, especially multiplicative–connected–étale filtration at README:3082 and Hasse–Witt at 3809–3856. Primary Hasse and generic BT₁ theory remain with these suppliers. |

Object searches used the roadmap service over open heads and main, the board packages, and the supplied sibling checkouts. The new SiegelModularForms roadmap explicitly excludes geometric, mod-p and p-adic Siegel modular forms and local GSp₄ newform theory (`TauCetiRoadmap/SiegelModularForms/README.md:194,1878–1892`); its classical analytic carriers do not own these lifting targets. ClassicalArithmeticCompletion §1.17, README:854, already owns the finite-field binary-form zero count, consistent with using it as background rather than rebuilding a general counting library here. The later board design AlgebraicModularFormsAndSerreWeightsPartII overlaps Hasse shifts, secondary Hasse, theta and neighbor geometry. It must import these targets from this earlier roadmap; it cannot be used as an upward supplier to repair this package. No new supplier edge to it is proposed. Ownership searches are by these objects, not only by declaration names; there are no local Lean declarations whose names could collide.

The mechanical dependency check was run read-only on this README, with the specified content and movable order. Complete output, exit 0:

```text
depcheck: 188 roadmaps, 1248 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line for this roadmap. Local proof order was also inspected: §2.4 now constructs its own family and consumes the earlier continuation theorem; §4.2 now orders construction, extension and injectivity, but needs S04; §4.7 needs S06; §4.8 consumes the corrected conditional Fourier results; §7.4 does not infer selected balance from whole-module balance; §10.7 allows rank zero, and §11 supplies support before positive rank and classicality.

### Source verification ledger

All nine manifest works were accessible in the supplied legal cache. Inspected the text around all 81 distinct source-prefixed line anchors in the README, plus the unprefixed continuation locators needed for the repaired passages and BCGP21 Propositions 2.4.24, 2.4.26 and 7.9.8. These are counts of locator checks, not a claim to have re-proved the sources. No additional text needed fetching; no missing-reference request was added.

| Source | Distinct explicit line anchors inspected | Additional comparison / boundary computation |
| --- | ---: | --- |
| CG20 | 38 | Selected projector gives 0, not 1, on the desired eigenline if the printed product-power is used; normalized trace reduces to 1/4 instead of 1; scalar Hasse theta has nonzero kernel. Corrected targets retain these distinctions. |
| P20 | 5 | Remark 6.4.1, line 1652: p=5 gives secondary weight 24 and square-root weight 12. Rank-zero and ordinary strata have dimensions 1 and 3, not 3 and 1. |
| P12 | 5 | Lines 665 and 987 use opposite cyclotomic exponent prescriptions; at κ=(2,2) they give (0,0,−1,−1) versus (0,0,1,1). At p=5 a character of order 4 and its inverse take values 2 and 3. |
| PS16 | 1 | Theorem 3.6 provides characteristic-zero coherent interpolation; coefficient polynomial has constant term 1. No assertion about a particular mod-ϖ lattice is imported from it. |
| M14 | 1 | Proposition 4.16, line 1677, retains spherical level and four distinct inverse roots; the repeated-root example is outside its hypotheses. |
| BCGP25 | 26 | Four-module dimensions 1+1+1+1=4; dyadic norm 1+1=0 on the trivial module; marked patching cutoff needs pᴺt as well as higher powers. |
| BCGP21 | 0 | Propositions 2.4.24 and 2.4.26, lines 1283 and 1338: two weight-two ordinary lines before choosing the ordered refinement, one after selection; Proposition 7.9.8 at line 10665 explicitly uses odd p for the old degree argument. The package instead requests the all-p projective comparison. |
| Tho17 | 2 | Lemma 2.15 gives degree-three scalar invariant dimension 1 in the dyadic case; the corrected numerical generator count is 5, not 6. |
| Yam14 | 3 | Proposition 3.8 at line 1164 uses two derivatives; the mod-square-zero derivative at line 1235 cannot send t²=0 to 2t≠0. Section number is corrected by S04. |

## Not verifiable

- No Lean build or elaboration was run, as required. Since Suggested.lean has no declarations, no signature test was omitted: its declaration list is empty. Grep establishes the cited pinned definitions and absence of the named arithmetic carriers, not mathematical truth of the future implementation.
- The stated supplier gaps remain contracts, not proved inputs. Apart from S03, their absence from today’s suppliers is not a finding. The selected coherent inequality, integral degree-one p-actions, all-p symplectic descent and marked Taylor–Wiles bounds have not been independently proved here.
- The full all-index contraction proof and general two-correspondence scalar recurrence are not proved here. S06 refutes the proposed universal normalizer step. The determinant/sign checks and the principal-level residue transport do not establish a general recurrence. The endpoints expressly retain their Fourier obligations.
- The construction of a finite-slope family through every Mok point, and verification of the continuation hypotheses on that family over every totally real field, are future local targets. Source M14 supports the stated crystalline theorem, and the repaired continuation citation exists, but this review is not a proof that the proposed family construction has been completed.
- Boundary tests in the table refute the listed wrong models; they do not prove the deep automorphy, patching, geometric extension or classification theorems. No certification of a source’s entire proof is inferred merely from locating its theorem.
- Ownership was searched against the supplied sibling checkouts and the service’s main/open-head index. Unavailable open work outside those inputs was not independently retrieved or certified. No suspicious fetched instruction was followed, and no external message was posted.

## Source issues

- **Error** in CG20 at §6.3, p.841, and §6.4, p.845 (lines 1645,1777): the source says the factorial power of the product of root differences selects the desired block; it should be the product of the two complementary factorial limits; affects a stated result.
- **Gap** in CG20 at Definition 6.15, p.844 (line 1762): the source permits the zero form as the displayed eigenform witness; it should require a nonzero witness; affects a stated result.
- **Error** in CG20 at Theorem 7.3, p.847 (line 1864): the source says degree-normalized trace inverts the selected pullback; it should use the actual selected trace composite, a unit reducing to one; affects a stated result.
- **Misprint** in CG20 at Theorem 7.11, p.853 (line 2058): the source states p−2>a while referring to the preceding range; it should retain p>a−2 used in the section and duality calculation; affects a stated result.
- **Error** in CG20 at Proposition 8.9(2), p.861 (line 2417): the source multiplies the vector contraction by an additional determinant; it should use the contraction without that factor; affects a stated result.
- **Error** in CG20 at Theorem 8.10, p.861 (line 2425): the source includes k=p−1 in its scalar injectivity range; it should exclude that weight because the Hasse invariant has zero theta; affects a stated result.
- **Error** in CG20 at Lemma 8.20, p.872 (line 2793): the source claims reciprocity for the same double coset at the stated tame level; it should use the reverse coset and prove the level transport; affects the proof.
- **Misprint** in P20 at §6.4, author p.35 (lines 1532–1534): the source describes the ≤r and ≥r loci using strict inequalities; it should use inclusive inequalities; affects nothing.
- **Error** in P20 at §6.4, author p.35 (line 1536): the source gives dimension 3−r for the multiplicative-rank strata; it should give r+1, so the ordinary locus has dimension three; affects a stated result.
- **Gap** in P12 at Definitions 3.2 and 5.3, author pp.14,20 (lines 665,987–990): the source transports ordinarity despite opposite exponent signs and ratio directions; it should provide a compatible ordered-flag and exponent dictionary before that transport; affects the proof.
- **Error** in Yam14 at Proposition 3.9’s setup, author p.22 (line 1235): the source treats coordinate partial derivatives as derivations of the square-zero quotient; it should calculate on a smooth formal base before truncating; affects the proof.
- **Misprint** in BCGP25 at Lemma 4.12.1(2), p.112 (lines 5027–5029): the source inverses the last two smooth characters twice; it should inverse each once in the dual-spin character list; affects a stated result.
- **Error** in BCGP25 at §5.4, p.123 (line 5569): the source asserts vanishing outside degrees one and two; it should retain the dyadic degree-three scalar invariant of dimension one; affects a stated result.
- **Gap** in BCGP25 at the patching construction before Proposition 7.2.3, p.162 (line 7391): the source calls the augmentation-power containment condition cofinite; it should use cofinal open cutoffs retaining coefficient precision, since pᴺt never lies in (t²) over O; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4d3145d776d4bab689186fd8d414c1b96df0a2b5", "job": "RT-GSp4NonregularModularityLifting~2a", "model": "gpt-6-astra", "worker": "chris-30"} -->
