# Review of ProfiniteProPGroups (pull request #618 at 9af5d7e)

**Verdict:** needs changes

The gate passes. Four blocking findings remain: R01–R04. R05–R06 are P3 notes. The two reviewable files were not changed.

The previous review was checked finding by finding before the full review:

| Previous finding | Passage at this head and verification | Disposition |
|---|---|---|
| R01: valuation subtraction at zero | README:2022 now gives the additive identity and says “For `c ≠ 0`” before subtraction. At `c=0`, the two examples give `∞=∞+0` and `∞=∞+1`; at `c=−6`, `0=1−1`. | Repaired. |
| R02: finite cyclic coordinate | README:1954 says “a finite cyclic `p`-group”. At `p=3`, the corrected `C₃` quotient has rank 3; the excluded `C₂` quotient would have rank 1 instead of 2. | Repaired. R03 below is a different, zero-level claim. |
| R03: IsProP does not imply profiniteness | README:1231 says it “only constrains quotients by open normal subgroups”. Conventions and Suggested.lean:578 separately require the ambient profinite hypotheses. The discrete direct sum and compact product of copies of `C₂` distinguish them. | Repaired. |
| R04: missing finite orientation-image families | README:2512 names “`isDemushkin_marked_of_q_two_odd_top`” and “`isDemushkin_marked_of_q_two_even_top`”; Suggested.lean:1021,1037 declares them. The rank-three and rank-two markings are `(-1,1,1)` and `(1,-1)`. | Repaired. |
| R05: determinacy and arbitrary-rank Serre | README:1769,2691 and Suggested.lean:457,1837 now state the two full headlines. The latter has no finite-generation hypothesis; the former has it on `G` only. | Repaired. |
| R06: bilinear normal forms already supplied | README:1842 says “Supplied normal forms” and names the pinned symplectic/identity dichotomy. `J` and `I₂` over `𝔽₂` enter different branches. | Repaired. |
| R07: elementary orientation controls | The named unit, generator-value, relator-value and continuity declarations are absent. README:1276 retains “The standard orientation of `D₀`” and its computed Checks. | Repaired for the declarations identified there. R06 below identifies two different remaining controls. |
| R08: structure, Checks and conventions | “## Conventions” is present; README:218 has supernatural Checks; README:1511 now says the finite example fails the Demushkin conclusion; the cup trace has an explicit sign. There are still only five `**Checks.**` lists and no per-layer Examples/Dependencies or Exact supplier contracts section. | Partly repaired; R05 records the remaining requirement. The repair report H08 expressly says this restructuring was not applied. |
| R09: cohomology application | README:729 now reads `continuousCohomology n (trivialFp p G)`. This is the actual pinned Mathlib application. | Repaired. |

The older destination/duplicate-completed-folder and source-manifest issues remain settled by `packages/ProfiniteProPGroups/reports/GATE-ProfiniteProPGroups~3.md`, H01 and H07: those repairs exceeded the two-file package authority. That reason remains valid; neither is re-raised. Likewise, retaining proved native headline statements is not treated as an admission defect or a reason to replace proofs with `sorry`.

## R01 (P1) — Divide the exponent sums by p before reducing

**Location:** `TauCetiRoadmap/ProfiniteProPGroups/README.md`:1893–1895. “it is the reduction modulo `p` of the exponent vector of `r`”.

**Claim:** The degree-one power coordinates `c_i`, relative to the classes of `x_i^p`, are obtained by reducing the exponent sums themselves modulo `p`.

**Witness:** At `p=3`, take `r=x₁³(x₁,x₂)`. Its exponent vector is `(3,0)`, reducing to `(0,0)`, but its power-coordinate vector is `(1,0)`. README:1897–1899 itself computes `c₁=1`.

All exponent sums of a relator in `Φ(F)` are divisible by `p`, so the stated operation always loses precisely this information. The pin supplies the correct formula: `TauCeti.freeProP.degreeOneBasis_repr_gradedMk_inl`, `TauCeti/Topology/Algebra/Group/Profinite/Free/DegreeOneForm.lean`:787–789, assumes that an exponent sum is `p*c` and returns `PadicInt.toZMod c`.

**Repair:** Say that `c_i` is the reduction of the i-th exponent sum **divided by p in ℤ_p**. Cite that native declaration and retain the displayed negative control. For exponent vectors `(0,0)`, `(3,0)`, `(9,0)` at `p=3`, the corrected vectors are respectively `(0,0)`, `(1,0)`, `(0,0)`, as required by the `q=0`, `q=p`, and `p²∣q` branches.

## R02 (P1) — Correct the supplier declarations used by the proof routes

**Location:** `TauCetiRoadmap/ProfiniteProPGroups/README.md`:1095. “PC-7 `Coind`, `shapiroIso` for a closed subgroup; L6 dimension shifting.” Also the all-degree use of PC-5 at 1086.

**Claim:** The named suppliers provide the Shapiro, exact-sequence and shifting statements needed to propagate vanishing to every degree.

**Witness:** Main `TauCetiRoadmap/ProfiniteCohomology/README.md`:1227–1228 explicitly places `shapiroIso` in Layer 10, not Layer 7. Its export table at 219,225 puts the all-degree exact sequence and dimension shifting in Layer 10 too.

Layer 7 supplies explicit degrees 0,1,2; Layer 5 supplies low-degree exactness. The consumer has no separate all-degree dimension-shifting construction in Layer 6. This is supplier drift in a proof route, not a claim that Shapiro is false or absent from the project. The named native statements and the correct supplier already exist; no new gap or theory is needed.

There is also a concrete wrong pinned name at README:502: `Subgroup.isCoatom_iff_index_eq_prime`. The declaration at `Mathlib/GroupTheory/Nilpotent.lean`:1255 is **`IsPGroup.isCoatom_iff_index_eq_prime`**, after `end Subgroup` at 1248 and `namespace IsPGroup` at 1250. The README's qualified name occurs in neither pinned library. An older review's claim that the `Subgroup` name was verified was incorrect; this round checked the namespace itself. This was not a settled, not-actionable finding.

**Repair:** Retain PC-7 for `Coind`, but import PC-10 `shapiroIso`, `coindEmbedding`, `dimensionShiftQuotient`, `coindAcyclic`, `dimensionShiftIso`, `longExact_exact`, and filtered-colimit passage as needed for infinite discrete coefficients. Correct the corresponding all-degree PC-5/PC-7 references throughout Layer 6. Check the route at degree 3 with `G=ℤ_p`: `H³(G,𝔽_p)=0` and `H²(G,Coind₁^G 𝔽_p/𝔽_p)=0`; the all-degree shift identifies them. As a negative control, `G=C_p` has `H³(G,𝔽_p)=𝔽_p`, so its degree-two-vanishing premise fails. The correction imports existing theory and introduces no reverse edge.

Correct the finite-group citation to `IsPGroup.isCoatom_iff_index_eq_prime`, with nilpotence supplied by `IsPGroup.isNilpotent`. In `Q₈`, each of its three maximal `C₄` subgroups has index 2, so the repaired citation supplies exactly the required input.

## R03 (P2) — Exclude m=0 from the no-power assertion

**Location:** `TauCetiRoadmap/ProfiniteProPGroups/README.md`:2005–2006. “`ω_m / T` has constant coefficient `p^m`, so `(ω_m)` is no power of `(T)`”.

**Claim:** Every finite-level ideal differs from every power of `(T)`.

**Witness:** For `m=0`, `ω₀=(1+T)¹−1=T`; hence `(ω₀)=(T)¹`. The quotient has constant coefficient `p⁰=1`, a unit. This is the projection to the trivial quotient of Γ.

**Repair:** Restrict that assertion to `m≥1`, and explicitly record `(ω₀)=(T)`. The broader statement that the two filtrations differ remains correct. At `p=2,m=1`, `ω₁=T(2+T)` has T-order 1 but `2+T` is not a unit, so its ideal is neither `(T)` nor any higher power. At `p=3,m=1`, use `T(3+3T+T²)` in the same way. These corrected claims include the finite trivial-group Check already given at README:1957.

## R04 (P2) — State the existence half of the classification

**Location:** `TauCetiRoadmap/ProfiniteProPGroups/README.md`:2595–2599. “Then `(n, A)` is realized in exactly three situations”. `Suggested.lean`:913–1079 states marked classification/transport only for groups already assumed Demushkin.

**Claim:** The acceptance file covers the classification of admissible rank and orientation-image pairs, including realization.

**Witness:** For `p=3,n=2,A=1`, `1<9` and `ℤ₃²` realizes the pair. Every marked theorem first assumes `IsDemushkin`; none asserts that a group realizing this or any admissible pair exists.

The missing result is statable with the existing subgroup, free-group, presentation, rank and character carriers. For example, `TauCeti/Topology/Algebra/Group/Profinite/Demushkin/NormalForm/Existence.lean`:587 states the exact rank/image existence iff for the `q≠2` range, including the dyadic `A≤1+4ℤ₂` hypothesis. The other families are supplied at 369,384,403,445,490,510,526. A scratch statement that the `q≠2` normal-form presentation is Demushkin closed with `TauCeti.isDemushkin_presentedProP_demushkinWordNeTwo`; it elaborated under the existing imports and defaults.

**Repair:** Add the existence classification on the native carriers, either as the full three-case iff or as complete necessity and realization families with the stated rank and character image. Do not substitute a theorem assuming the group's existence. Keep the infinite-level and rank-one cases. Check `(p,n,A)=(3,2,1)` (realized), `(2,2,ℤ₂ˣ)` (`4<4` false), `(2,4,ℤ₂ˣ)` (`4<16` true), and `(2,1,{±1})` (realized by `C₂`). None requires a missing carrier or a stand-in predicate.

## R05 (P3) — Finish the definition Checks and roadmap structure

**Location:** `TauCetiRoadmap/ProfiniteProPGroups/README.md`:273–294, and the layer headings. “API checklist for `IsProPSylow`”.

**Claim:** Each definition has at least three discriminating computed Checks; supplier contracts and layer dependencies have the required structure.

**Witness:** The Sylow list gives constructors, examples and edge-case labels but no three computed Checks. Only five `**Checks.**` lists occur in 11 layers. Exact supplier contracts and per-layer Examples/Dependencies headings are absent.

**Repair:** Complete the remaining previous R08 work: use the required Summary/Scope/Contracts/build headings, put imported objects and exact supplier declarations in the contracts, and give every definition its API and three discriminating Checks. For the cited Sylow definition, `C₂≤S₃` at p2 has index 3 and three conjugates; `C₃≤S₃` at p3 has index 2 and is the unique normal Sylow; `1≤S₃` at p2 has index 6 and is not Sylow. The trivial group gives the separate positive boundary case. Apply the same computed-test standard to the other definitions, rather than merely adding headings.

This is the unapplied portion of H08, not a re-raised finding that the repair report marked not actionable. The completed sign, cohomology syntax and supernatural repairs remain credited above.

While consolidating the contracts, correct the file locator `ProP/RelationRank.lean` at README:1017 to `ProP/Relation/Rank.lean`. The cited native declarations exist in the latter file: `finite_H2_iff` at 566, `natCard_H2` at 582, `natCard_H2_le_pow_iff` at 601 and `topologicalGeneratorRankNat_quotient_pLowerCentralStep_eq` at 701. This is a locator defect, not a missing mathematical supplier.

## R06 (P3) — Delete the two remaining elementary controls

**Location:** `TauCetiRoadmap/ProfiniteProPGroups/Suggested.lean`:508,736. `fpPairing_bil` and `demushkinRelatorCharacter_mem_ker`.

**Claim:** These are headline acceptance theorems.

**Witness:** A scratch copy closes the first with `simp [fpPairing, TauCeti.fpPairing_bil_apply]`, and the second with `exact TauCeti.demushkinRelatorCharacter_mem_ker hr`. Elaboration exits 0.

The first evaluates the already defined multiplication pairing; the second says that a character pulled back from the presented quotient kills its defining relator. They are definition/API controls, unlike the classification and duality theorems. Their use by a downstream consumer does not make them end theorems.

**Repair:** Delete them from `Suggested.lean`; retain the mathematical claims and native citations in the README. Direct consumers to those native declarations. At `p=3,a=b=2`, the pairing value and the product are both 1. For `D₀`, the relator maps to `(-1)²·1⁴·1=1`; these remain useful README Checks. No headline proof should be deleted merely because its native proof is short.

## Verified sound

The computations below test the actual statements and plausible wrong models; they are not proofs of all their universal assertions. All eleven layers and both files were read. The pass includes the seeded targets, all headline families, the previous repairs and every target touched by a finding. Here `C_m` denotes a cyclic group of order m; brackets use `x⁻¹y⁻¹xy`; `J` has upper-right block `−I`. A blank-change alternative is never used: “none” means the computed test agrees, not that it proves the theorem.

There are **142 computed rows**, **117 elaborated declaration signatures**, **15 pinned-file evidence entries**, and **10 cross-roadmap resolution entries** below.

| Statement/object | Instances tried | Computed values on both sides | Result/change |
|---|---|---|---|
| One implementation (seeded) | native aliases for q, χ, words, E | Unfolding gives the same q, character, word and E term with the same arguments; number of new carriers 0 | Agrees; none |
| Profinite ambient convention | finite S₃; discrete infinite direct sum of C₂ | S₃ compact/T2/totally disconnected; direct sum T2/totally disconnected but noncompact | Discriminates; prior R03 repaired |
| IsProP definition | direct sum and product of C₂; connected ℝ | First two have only 2-group open quotients; connected ℝ has only the trivial open quotient | Predicate alone does not imply profinite; corrected prose |
| Closed normal quotient | C₄/C₂; ℤ̂/ℤ | First has 2 separated points; second has dense identity coset and is not T1 | Closedness matters; none |
| Inverse-limit lifting | ℤ₂ and discrete ℤ, residues of −1/3 mod 2ᵏ | Compatible solution exists in ℤ₂; an integer a would satisfy 2ᵏ∣3a+1 for all k, impossible | Compact/separated setting matters; none |
| Profinite completion | C₃; ℤ→C₂ | Completion unit on C₃ is bijective, 3 images; maps to C₂ determined by 1 with 2 choices | Universal property agrees; none |
| Closure of normal subgroups | 2ℤ in ℤ₂ | Closure 2ℤ₂, normal; quotient order 2 | Native normal-closure instance agrees; none |
| Supernatural multiplication | 12,18 | Exponents (2,1)+(1,2)=(3,3), giving 216=12·18 | Agrees; prior R08 Check repaired |
| Supernatural lattice | 12,18 | min gives 2·3=6; max gives 4·9=36 | Agrees; none |
| Supernatural finite-support predicate | zero vector; all-primes exponent 1; exponent ∞ at 2 | Correspond to 1, no natural number, no natural number | Both finiteness conditions necessary; none |
| Infinite supernatural multiplication | 2^∞ and 2 | Exponent ∞+1=∞ on both sides | Agrees; none |
| Profinite order/index | 1,C₆,ℤ₂,ℤ̂ | Orders 1,6,2^∞,∏ℓ^∞; [ℤ₂:2ℤ₂]=2 | Agrees; none |
| Lagrange | C₃≤S₃; 2ℤ₂≤ℤ₂ | 6=3·2; 2^∞=2^∞·2 | Nonabelian/infinite cases agree; none |
| p-support criterion | C₄,C₆ at p2 | Orders 2² and 2·3; IsProP true and false | Both directions separated; none |
| Sylow predicate | C₂,C₃,1 in S₃ | Indices 3,2,6; first two Sylow at p2,p3; last not at p2 | Correct; add Checks, R05 |
| Sylow existence | S₃ at p2,p3,p5; trivial group | Sylow orders 2,3,1; trivial group order1 for every p | Absent primes included; none |
| Sylow conjugacy | S₃ at p2 | Three transposition subgroups, one conjugacy orbit | Agrees; none |
| Pro-p containment | 1≤C₂≤S₃ at p2 | Trivial subgroup contained in each order2 Sylow; C₂ maximal pro-2 | Agrees; none |
| Normal Sylow uniqueness | S₃ at p3 vs p2 | One normal C₃; three nonnormal C₂ subgroups | Hypothesis necessary; none |
| Surjective Sylow images | sign S₃→C₂ | 2-Sylow image C₂; 3-Sylow image1 | Both target Sylows correct; none |
| Open overgroup index | 2-Sylow C₂≤S₃ | Overgroups C₂,S₃ have indices 3,1, neither divisible by2 | Agrees; none |
| Maximal pro-p quotient | S₃ at p2,p3 | Quotients C₂,1; kernels C₃,S₃ | Not a Sylow identification; none |
| Kernel has no p-quotient | p2, kernel C₃ of S₃→C₂ | Maximal pro-2 quotient of C₃ is1; second kernel C₃=top | Agrees; none |
| Frattini construction | C₄,Q₈,C₂² | Φ=C₂,{±1},1; quotient orders2,4,4 | Closure/powers/commutators agree; none |
| Maximal subgroups | Q₈ | Three maximal C₄, all index2; intersection {±1} | Mathematics agrees; qualified supplier name corrected by R02 |
| Burnside iff | {i,j} and {i} in Q₈ | Quotient spans dimensions2 and1; generated groups Q₈ and C₄ | Both directions; none |
| Infinite Burnside closure | coordinate vectors in ∏ℕ C_p | Algebraic span ⊕ℕ C_p proper; closure all of ∏ℕ C_p | Topological closure essential; none |
| Generator rank | 1,ℤ_p,C_p²,∏ℕ C_p | Ranks 0,1,2,ℵ₀; continuous dual dimensions same | Agrees; none |
| Rank under surjection | Q₈→C₂²→C₂ | Ranks 2≥2≥1 | Agrees; none |
| Schreier bound | 1≤1; C₂≤S₃ | 0≤1+1·(0−1)=1 in ℕ; 1≤1+3·(2−1)=4 | Truncated subtraction checked; none |
| Hopf property | ℤ_p multiplication by a unit; shift on ∏ℕ C₂ | First kernel0 and onto; second onto with kernel C₂ | Finite generation matters; none |
| Gaschütz | C₄→C₂ with one generator; C₂²→C₂ | Generator lifts 1,3 in C₄; one element cannot generate C₂² | Source-rank hypothesis matters; none |
| Finite group class/pro-C | class of p-groups; class {1} | Quotients of S₃ at p2 yield C₂; trivial class yields1 | Classes determine different completions; none |
| Free groups on finite sets | empty set; singleton | Free pro-p groups 1,ℤ_p; free profinite groups1,ℤ̂ | Empty/rank1 cases; none |
| Free universal property | two generators to C₂ | 2²=4 generator assignments and 4 continuous homomorphisms | Unique extension pins maps; none |
| Presented universal property | ⟨x∣x⁴⟩ and ⟨x∣x³⟩ to C₂ | Respectively 2 and1 allowed images of x | Relator condition excludes wrong maps; none |
| p-adic power | x in C₉, p3, exponents0,1,3 | x⁰=1,x¹=x,x³; reduction mod9 gives same powers | Native integer comparison agrees; none |
| Rank-one p-adic identification | free pro-p on one generator | Generator maps to compatible residues 1 mod pᵏ; limit1 in ℤ_p | Normalization agrees; none |
| Abelian structure | ℤ₂×C₄; infinite product C₂ | Free rank1/torsion C₄; product has infinite torsion and is not finitely generated | Hypothesis discriminates; none |
| Native cohomology carrier (seeded) | G=1, coefficient 𝔽_p | continuousCohomology 0 A has dimension1; degrees1,2 dimension0 | Correct syntax/carrier; prior R09 repaired |
| Multiplication pairing | p3,a=b=2 | Pairing value1=2·2 mod3 | Definition control; R06 |
| Cup signs | ℤ₃²; C₂ at p2 | Surface entries B₁₂=−1,B₂₁=1; C₂ square1=−1 in 𝔽₂ | Characteristic/sign agree; none |
| H¹ and relation ranks | C_p,C_p²,free rank2 | (d,r)=(1,1),(2,3),(2,0) | Finite-dimensional tests agree; none |
| Deficiency | ⟨x∣xᵖ,x^(p²)⟩ | Presentation deficiency1−2=−1 < d−r=0 | Integer subtraction correct; none |
| Elementary abelian H² | ranks0,1,2 | Dimensions0,1,3 equal n(n+1)/2 | Zero/rank2 checked; none |
| Extension pushforward/lifting | identity and zero maps on a central kernel | Identity preserves c; zero sends c to0 and gives split pushforward | Both directions of class/lift theorem agree; none |
| Extension surjectivity | onto quotient/onto kernel; zero kernel map | First reaches all fibres; C₄→C₂² with zero kernel map reaches2 of4 elements | Both hypotheses needed; none |
| Finite embedding problems/projectivity | ℤ_p; C_p→C_p with C_(p²) cover | Free source lifts generator; a section C_p→C_(p²) cannot exist | Iff distinguishes groups; none |
| Compact solution spaces | finite generator assignments to finite quotient Q | At most card(Q)^n assignments; n0 gives one | Finite-level compactness input agrees; none |
| Golod–Shafarevich | C_p,C_p²,Q₈; trivial group | d²<4r gives1<4,4<12,4<8; trivial gives0<0 false | Nontrivial hypothesis necessary; none |
| Invariant-vector input | C_p acting unipotently on 𝔽_p² | Fixed subspace ker(g−1) has dimension1, hence p−1 nonzero vectors | Nonzero invariant exists; none |
| Finite p-primary filtration | ℤ/p² with trivial action | Composition length2, cardinal p²; not an 𝔽_p vector space | Length versus dimension correct; none |
| Elementary-coefficient test | 1,ℤ_p,ℤ_p²,C_p | cd=0,1,2,∞; H² dimensions0,0,1,1 | Both vanishing/nonvanishing directions; none |
| All-degree shift route | ℤ_p, degree3; C_p | H³(ℤ_p,𝔽_p)=0=H²(ℤ_p,Coind/𝔽_p); H³(C_p,𝔽_p)=𝔽_p | Correct theorem, wrong supplier layer; R02 |
| Free cd≤1 | ranks0,1,2 | cd=0,1,1, all ≤1 | Rank0 included; none |
| Finite-rank Serre | 1,ℤ_p,C_p | Free ranks0,1,not free; cd0,1,∞ | Iff agrees; none |
| Open-subgroup cd | pℤ_p≤ℤ_p; 1≤C_p | 1=1; 0≠∞ outside finite-cd hypothesis | Hypothesis necessary; none |
| Restriction to Sylow | S₃,p2,P=C₂ | H¹ dimensions1→1, sign restricts to nonzero class; H⁰ identity | Injective; none |
| Restriction/corestriction scalar | same P, 𝔽₂ coefficients | Index3 acts as1; 3−2=1 gives Bézout inverse | Correct scalar/direction; none |
| Sylow cd | S₃ at p2,p3,p5 | cd values∞,∞,0 match Sylows C₂,C₃,1 | Agrees; none |
| Open Nielsen–Schreier | free rank1 indexp; rank2 index2 | Ranks1=1+p·0; 3=1+2·1 | Nonzero-rank hypothesis protects natural subtraction; none |
| Demushkin predicate | C₂ at p2; C₃ at p3; ℤ_p²; ℤ_p | (dimH¹,dimH²)=(1,1),(1,1),(2,1),(1,0); cup square1,0; surface perfect | Examples and two nonexamples; none |
| q convention | C₂; ℤ_p² | Torsion orders2,1; q=2,0 respectively | Torsion-free q is0, not1; none |
| Abelianization for q≠0 | x₁³[x₁,x₂],p3 | ℤ₃²/(3,0) = C₃×ℤ₃; q3,n2 | Matches torsion/rank; none |
| Prescription/unique character | ℤ_p²; free ℤ_p | Demushkin orientation1 forced; free source admits differing characters | Demushkin assumption needed; none |
| Dyadic subgroup classification | 1,U^(2),U^[2],V^(2),{±1} | Square indices1,2,2,4,2; U^[2]=closure⟨3⟩; V^(2)=ℤ₂ˣ | Families distinguished; none |
| Level uniqueness | U^(2),U^(3) | 5∈U^(2),5∉U^(3); hence unequal | Discriminating Check; none |
| D₀ orientation | A,S,Y and defining relator | Values−1,1,−1/3; relator value1 | Normalization agrees; prior R07 repaired |
| D₀ surjectivity/uniqueness | standard marking; A↦1 variant | Standard imageℤ₂ˣ; changed imageU^(2), index2; values on generators pin homomorphism | Deep image conclusion retained; none |
| Finite-module duality α₀,α₁,α₂ | ℤ_p², trivial 𝔽_p^m, m0,1,2 | Cohomology dimensions(m,2m,m); dual target dimensions(m,2m,m) | Zero module and extremes agree; none |
| Twisted p-primary duality | ℤ_p², trivial orientation, M=ℤ/p² | Orders H⁰=p²,H¹=p⁴,H²=p²; duals have same orders | Beyond 𝔽_p coefficients; none |
| Infinite Demushkin cd2 | ℤ_p²; C₂ | cd2 versus∞, although H² dimension1 for both | Infinite hypothesis needed; none |
| Finite C₂ sign module | M=ℤ/4 with sign action | Invariants {0,2}; H²={0,2}; H¹=M/2M of order2 | H² order2, not4; none |
| Open Demushkin theorem | indexp subgroup of ℤ_p² | Rank2; 2−2=p(2−2)=0; χ restricts from1 to1 | Three headline conclusions agree; none |
| Finite open-subgroup boundary | 1≤C₂ | 0−2=2(1−2)=−2, but H²(1)=0 | Revised warning correct; none |
| Open-normal recognition | ℤ_p² vs free rank2 | First cd2 and open H² dimension1; second cd1 and H²0 | Distinguishes predicate; none |
| Lower p-series | ℤ₂,C₄ | λ_k=2ᵏℤ₂; C₄,C₂,1 for k0,1,2 | Labute F₃=λ₂; none |
| Graded finiteness | free finite rank; ∏ℕ C_p | First finite graded pieces; product λ₁=1 and gr₀ infinite | Finite generation cannot be dropped; none |
| First free graded dimension | ranks0,1,2 | 0,1,3 = n+binom(n,2) | Power and bracket generators counted; none |
| Graded p-power | ℤ₃, degree0 | Class1 maps class3; π(1+1)=class6=π1+π1 | Odd-p additivity; none |
| Dyadic power nonadditivity | Q₈,i,j | π(i+j)=class(−1); πi+πj=0; [i,j]=class(−1) | Bracket correction necessary; none |
| Commutator direction | S₃,x=(12),y=(23) | [x,y]=(132); [x²,y]=1; [x,y]^x[x,y]=(123)(132)=1 | Right-conjugation convention agrees; none |
| Graded bracket/π naturality | Q₈→C₂² | Nonzero commutator class maps0; target bracket0; squared classes map0 | Agrees; none |
| Cofinality/openness | ℤ_p vs ∏ℕ C_p | λ_k=pᵏℤ_p open/cofinal; λ₁=1 in infinite product not open | Hypotheses correct; none |
| δ₁ cross term | p3, commutator relator, x_i↦x_i² | Deviation4−1=0 mod3; linear part2 plus cross term1=0 | Correct quadratic formula; none |
| δ_j power term | p2, r=x₁² | δ_j=πw₁+[w₁,x₁]; coefficient binom(2,2)=1; odd-p coefficient0 | Extra term retained; none |
| δ₁ linearity boundary | rank1 p2,r=x²; rank2 Q₈ test | Rank1 bracket0 so π additive; rank2 polarization class(−1)≠0 | Rank hypothesis matters; none |
| Tail indexing | p2 odd form rank3 f2 | c=(1,0,0); tail generators2,3; even rank4 tail excludes index2 | Distinct odd/even tails; none |
| Finite-quotient determinacy | C₂/C₂; C₂/C₄ | Quotient types {1,C₂} equal in first; C₄ occurs only in second | Correct iff test; prior R05 repaired |
| Determinacy non-fg boundary | B=∏n≥1 C_(pⁿ), B×ℤ_p | Both realize every finite abelian p-group; Hom_cont(B,ℤ_p)=0, while second projects ontoℤ_p | Same finite quotients without isomorphism; none |
| Determinacy rank distinction | ℤ_p,ℤ_p² | First only cyclic finite quotients; second has C_p² quotient | Negative control agrees; none |
| Levelwise comparison | ℤ_p→ℤ_p, identity at each level | Each C_(pᵏ) map identity; limit identity; image all ℤ_p | Compatibility/realization checked; none |
| Symplectic normal form | dimensions0,2 | Empty J has rank0; J₂ determinant1, diagonal0 | All characteristics allowed; prior R06 repaired |
| Nonalternating dyadic form | I₁,I₂ over 𝔽₂ | Determinants1; B(e₁,e₁)=1; I₂ has isotropic(1,1) but not alternating | Correct dichotomy; none |
| Square-scalar hypothesis | 𝔽₂ vs 𝔽₃ | Squares {0,1} vs {0,1}; 2 has no square root in 𝔽₃ | Nonalternating theorem not overclaimed; none |
| Change of basis | J over 𝔽₃,P=diag(2,1) | PᵀJP=2J=[[0,1],[2,0]], determinant1 | Column convention agrees; none |
| Relator/cup trace | Heisenberg x=(1,0,0),y=(0,1,0) | [x,y]=(0,0,1); φ=−z gives δφ=ab′ and trace−1 | Sign agrees with J; none |
| Diagonal cup trace | p2,r=x² | −2(2−1)/2=−1=1 in 𝔽₂ | No division by2 in the field; integer computation first; none |
| Power coordinates | p3,r=x₁³[x₁,x₂] | Exponent reduction(0,0), actual c=(1,0); divided reduction(1,0) | False as written; R01 |
| Odd-p cup loses power part | previous r vs [x₁,x₂] | c₁=1 vs0, but both have B₁₂=−1,B₂₁=1, diagonals0 | Negative control correct; none |
| Completed group algebra | Γ=1,C₂,S₃ | ℤ_p; free modules of ranks2,6; S₃ algebra has distinct gh,hg | Noncommutative scope retained; none |
| Compact-module predicate | finite ℤ/p²; discrete ℤ_p | First compact with continuous action; discrete infinite ℤ_p not compact | Topology is part of data; none |
| Finite cyclic p-coordinate | p3,C₃ and C₂ | T³+3T²+3T gives rank3; T(2+T) gives rank1≠2 | Prior R02 repaired |
| Infinite coordinate | Γ=ℤ_p, generatorγ | T↦γ−1,1+T↦γ; augmentation T↦0 | Map and inverse normalization agree; none |
| Generator substitution | p3,γ′=γ² | T′=2T+T²; linear coefficient2 unit | Invertible coordinate change; none |
| Finite-level kernels | m0,m1,p2 | ω₀=T; ω₁=2T+T²; quotient ranks1,2 | Correct kernels; none |
| No T-power claim | same m0,m1 | (ω₀)=(T); (ω₁)≠(T) since2+T nonunit | Missing m≥1; R03 |
| Evaluation/division iff | ψ=T+2,c=−2; ψ=1; ψ=T,c0 | Values0,1,0; divisibility true,false,true | Both directions and zero checked; none |
| Constant coefficient valuation | c0,φ1 or2; c−6,φ1 | ∞=∞+0; ∞=∞+1; 1=1+0 and0=1−1 | Repaired identity; none |
| Factoring vs basis vector | (2,T) in ℤ₂[[T]]² | Mod(2,T) vector0; ideal(2,T) proper | Divisibility does not imply unimodularity; none |
| Relation object E | surface relator,χ=1 | E=F^ab=ℤ_p²; r class0, unlike relation generator in R^ab | Correct carrier distinction; none |
| Conjugation convention | C₇⋊C₃ with yxy⁻¹=x² | Native action2; right-conjugation action4; 2·4=1 mod7 | Inverse quotient element required; none |
| Relator in kernel | D₀ relation | Character value1, hence membership true | Elementary control; R06 |
| Procyclic scalar criterion | rank4,α4,f2,g∞,dihedral order16 quotient | r maps4 mod8; (5+γ)x maps(5−1)=4; (1+γ)z always0 | f-index correct; none |
| Procyclic basis correction | f2,α4,c−6 | ψ₁(0)=6,v₂=1; quotient constant1,v₂=0; ψ₂=0 | Unit first coordinate, zero second; none |
| Missing branch hypotheses control | F=ℤ₂,r generator,χ=1 | Requested equation1=(2+2^f)z reduces1=0 mod2 | README excludes it; none |
| Split scalar criterion | f2,α0,b0 | (1+S)·1+(4+T)·0=1+S | Positive branch specialization; none |
| Split correction at nonzero α | f2,α−4,b1 | A/(1+α)=1−S(1+T)/3; Φ=S/3 gives total1+S | README existence correct; source proof sign slip below |
| Split residual commutator | exponent a=1 | Correction leaves [z₁,z₃]²∈λ₂, versus [z₁,z₃]∈λ₁ | Squaring removes degree-one error; none |
| Tail detectors | χ-trivial x_k,D_i(x_k)=2δik | D_i(x_k^(2^(j−1)))=2ʲδik; on [X,X] value0 | Distinguishes tail coefficient from zero; none |
| Split extra detector | f2,χx₂=−1,χx₄=−1/3,D₄x₄=2 | D₄[x₂,x₄]=−12,v₂=2; exponent2^(j−2) gives valuationj | Correct surviving tail; none |
| Iteration convergence | corrections in λ_j | Modλ_k every correction with j≥k equals1 | Finite coordinates stabilize; none |
| q=0 span restriction | p3,r=[x₁,x₂] | Abelian graded image of Imδ_j=0; πʲξ₁ maps nonzero3ʲe₁ mod3^(j+1) | Bracket span, not full span; none |
| q=p initial class | p3,q3 vs q9 | c₁=1 vs0 after division by3 | Matches corrected branch split; R01 |
| Odd/even dyadic cup forms | n2 | x₁²[x₁,x₂] gives [[1,1],[1,0]], det1; x₁² alone det0 | Parity distinction necessary; none |
| q≠2 marked form | n2,q0; p3,q3 | χ=(1,1); χ=(1,−1/2); χx₂·(1−q)=1 | q0 needs no division byq; none |
| Odd finite-level marking | n3,f2,D₀ | Word A²S⁴[S,Y],χ=(−1,1,−1/3), imageℤ₂ˣ | Agrees; none |
| Even finite-level marking | n4,α0,f2 | χ=(1,−1,1,−1/3), imageℤ₂ˣ | Rank≥4 correct; none |
| Rank-two marking | n2,α4 | χ=(1,−1/5); image closure⟨3⟩ | Separate family necessary; none |
| Out-of-range generator | attempting four-generator clause at n2,f3 | x₄=1 would give1·(1−8)=1, i.e.−7=1 | Excluded by rank bound; none |
| padicValNat junk at0 | a0 in finite rank-two parameter condition | valuation function returns0, required unit has value−1+1=0 | Hypothesis impossible; endpoint handled separately |
| Odd infinite-level marking | n1,n3 | Words x₁² and x₁²[x₂,x₃]; χ=(−1) and(−1,1,1) | Prior R04 repaired |
| Even infinite-level marking | n2,n4 | χ=(1,−1) and(1,−1,1,1); image{±1} | Prior R04 repaired |
| Marked relator transport | r=r′; p3 q3 vsq9 | Identity sends r to r; different q give imagesU^(1)≠U^(2) | Equal-image hypothesis discriminates; none |
| Classification existence, even | p3,n2,A1; p2,n2/n4,Aℤ₂ˣ | Index1<9 true; index4<4 false; index4<16 true | True mathematical claim missing acceptance; R04 |
| Existence pro-p hypothesis | p3,n2,Aℤ₃ˣ | Index(A:A³)=3<9 but element−1 has order2 | Excluded correctly; none |
| Existence rank0 | A1,n0 | 1<1 false; trivial group H²0 | Correct exclusion; R04 coverage |
| Existence odd/rank1 | p2,n1,A{±1}; n3,Aℤ₂ˣ | C₂ has rank1/image{±1}; D₀ rank3/imageℤ₂ˣ | Required realization families; R04 |
| Pointed universal property | one point; three pointed discrete points | Free ranks0,2; based maps to C₂ number1,4 | Basepoint killed; none |
| Infinite discrete versus converging basis | S=ℕ,p2 | Hom of discrete free object to𝔽₂: all sequences, dimension2^ℵ₀; converging basis: finite support, dimensionℵ₀ | Comparison noninjective; none |
| Arbitrary-rank Serre iff | empty basis; countable converging basis; C_p | cd0,1,∞; free presentations exist,exist,do not exist | Repaired headline; none |
| Closed-subgroup freeness | 1,pℤ_p≤ℤ_p | cd0,1 and free ranks0,1 | Arbitrary-rank criterion supplies conclusion; none |

Primality excludes p=0,1 and composite coefficient characteristics from the classification. The coefficient rings are ℤ_p and 𝔽_p, not general DVRs or zero rings; inseparability, nonreduced schemes and fan/cover conventions do not enter these targets. Rank zero, the empty pointed basis, zero modules, p=2/3, infinite cardinal ranks, noncompact inputs, natural subtraction, valuation at zero, out-of-range generators and identity maps do enter, and are tested above.

**Headline inventory and acceptance coverage.**

| Headline family from README | Coverage at this head |
|---|---|
| Profinite Sylow existence, containment, normal uniqueness and images | Local theorems present. Conjugacy is imported by its exact native declaration. |
| Pro-p kernel, Frattini/Burnside, generator ranks, Hopf/Gaschütz | Kernel/Burnside/rank theorems present; Hopf/Gaschütz imported native results. |
| Free universal property and p-adic rank-one identification | Local statements present; other universal maps use native carriers directly. |
| Abelian pro-p structure theorem and H¹/H² rank interpretations | Supplied native results; these are cited/checked rather than rebuilt. The finite-rank tests above agree. |
| Extension-class lifting, converse, surjectivity | All three statements present, on actual extension carriers. |
| Finite embedding problems and projectivity | Both directions present. |
| Golod–Shafarevich | Present, with finite nontrivial p-group hypotheses. |
| Elementary coefficient criterion; free cd≤1; finite-rank Serre | Present. The README proof route needs R02's supplier correction. |
| Sylow restriction injectivity and equality of cd | Present for arbitrary discrete p-primary coefficients. |
| Open Nielsen–Schreier and closed-subgroup freeness | Open formula and closed-subgroup cd bound present; the full arbitrary-rank Serre equivalence now supplies freeness. |
| Canonical Demushkin character and uniqueness | Present on continuous characters with the native prescription property. |
| Demushkin duality and cd2 | Local α₂ and cd2 present; α₀,α₁ and finite p-primary variants are explicitly supplied by named native results. |
| Open Demushkin subgroup, rank and orientation formulas | All present; infinitude retained. |
| Dyadic unit subgroup classification | Present, including the finite {±1} subgroup. |
| Finite-quotient determinacy | Full local statement present, with finite generation only on G. |
| Central-tower schema, graded operations, coordinates, bilinear normal forms | Native structures/results are cited. The schema is a proof route on those structures, not a replacement theorem with free predicates. |
| Two Labute module branches | Present on `labuteE χ`; character/image hypotheses and inverse-action convention retained. |
| Marked normal forms and relator transport | All six marked families and exact relator transport present; natural parameters explicitly scoped at README:2526. The general p-adic words remain prose targets, not fake natural encodings. |
| Classification of admissible pairs, including realization | Existence missing: R04. The docstring identifies no unavailable carrier for it. |
| Infinite pointed-free comparison and arbitrary-rank Serre | Both now present. |

**Elaboration and form.** The requested head was verified. The worker's targeted module build passed. Independently, `lake env lean` on the absolute path of `TauCetiRoadmap/ProfiniteProPGroups/Suggested.lean`, from the specified worktree, exited 0 with no warnings or errors. Its 22 library `#check` outputs are informational. No dependency module needed an additional build, and neither the manifest nor toolchain was changed.

A scratch copy checked the elaborated types of all **117 declarations**: the 116 ordinary declarations and the scoped normal-closure instance. All checks elaborated. I compared the binders for primality, topology, compactness, total disconnectedness, finite generation, infinitude, coefficient universe and orientation image with the prose. The predicate aliases do not acquire profiniteness merely from surrounding variables; the repaired prose now recognizes that. The four added headline statements have the advertised hypotheses. No source file or binder was changed. The finite-rank marked signatures use `G : Type`; the arbitrary-rank statements retain their universe variable.

There are **zero sorried declarations**, so the requested one-tactic probe over admitted theorems has an empty domain. Separately, both surviving controls in R06 were tested by the displayed single tactics, and a native normal-form realization statement was tested in the same scratch elaboration; exit 0. There are no admitted examples, sorry'd data, `set_option`, or roadmap imports. The single `import Mathlib` is followed by individual pinned Tau Ceti modules. The absence of admissions does not excuse a missing headline or padding.

The worker gate at this exact head reports:

```text
gate ProfiniteProPGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The independently executed dependency command, with the supplied merge order and `--movable`, reports:

```text
depcheck: 175 roadmaps, 1176 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Every Needs line was read; R02 is a section/declaration resolution defect that this graph check does not detect. No declared gaps were found. The outside-folder diff is empty, and the worktree remains clean.

**Pinned-library audit.** Mathlib is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following 15 file entries give decisive locations actually opened at those pins; native definitions were checked by body as well as by their names.

| Repository-relative file at the pin | Declaration/evidence |
|---|---|
| `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean`:112,131 | Homogeneous cochains and `continuousCohomology n A`, the actual cohomology object. |
| `Mathlib/GroupTheory/Nilpotent.lean`:1248,1250,1255,1282 | Namespace boundary; `IsPGroup.isCoatom_iff_index_eq_prime` and `IsPGroup.isNilpotent`. R02 corrects the qualified name. |
| `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean`:68,85 | `IsProP` is `∀ U : OpenNormalSubgroup G, IsPGroup p (G ⧸ U.toSubgroup)`; no compactness, separation or finiteness field. `IsPGroup.isProP` confirms the discrete counterexample. |
| `TauCeti/Topology/Algebra/Group/Profinite/Demushkin/Basic.lean`:81–93 | Actual pro-p, H¹-finiteness, H²-dimension and cup-nondegeneracy fields. Ambient profiniteness remains separate. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/TrivialFp.lean`:73,81,246 | Native coefficient object/equivalence and `cohomFp`, directly using Mathlib cohomology. |
| `TauCeti/Topology/Algebra/Group/LowerCentralSeries/Graded/Basic.lean`:797 | `gradedPow_smul_zero` exists, with `NeZero p`; the worker resolver's warning is false. |
| `TauCeti/Topology/Algebra/Group/Profinite/FiniteQuotients.lean`:189 | Determinacy has finite generation of G only; H has the ambient profinite instances. |
| `TauCeti/Topology/Algebra/Group/Profinite/Free/Pointed/Serre.lean`:108 | Full cd≤1/converging free-presentation equivalence, without finite generation. |
| `TauCeti/Topology/Algebra/Group/Profinite/Free/DegreeOneForm.lean`:787 | Power-coordinate formula divides the exponent sum by p before reduction, R01. |
| `TauCeti/Topology/Algebra/Group/Profinite/Demushkin/NormalForm/Marked.lean`:173,319 | Odd/even {±1} marked families and bounded generator indices. |
| `TauCeti/Topology/Algebra/Group/Profinite/Demushkin/NormalForm/Existence.lean`:335–587 | Native realization families; exact q≠2 rank/image iff at 587. |
| `TauCeti/Topology/Algebra/Group/Profinite/Demushkin/NormalForm/IsDemushkin.lean`:76 | `isDemushkin_presentedProP_demushkinWordNeTwo`, used in the successful realization probe. |
| `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean`:301,309 | Symplectic normal form and even dimension, including characteristic two. |
| `TauCeti/LinearAlgebra/BilinearForm/Diagonalization.lean`:227,243,264 | Nonalternating identity form and the dichotomy; finite-dimensional, nondegenerate and square-scalar hypotheses retained. |
| `TauCeti/NumberTheory/Padics/PowerSeries.lean`:48,59,69 | Division with remainder, factorization at a root and divisibility iff, allowing c=0. |

**Cross-roadmap resolution and ownership.** Main was checked at `c994070`; open references were read at the heads supplied in the brief. Object searches used `roadmaps grep` and the board packages, with separate searches for completed group algebras, Demushkin/prescription objects, free pointed groups, Sylow objects and basis modification. Generic hits were narrowed before relying on them. Completed group algebras in arithmetic roadmaps are imports or coefficient extensions of the native object, not a second owner of this abstract carrier.

| Resolved citation/ownership boundary | Evidence opened |
|---|---|
| ProfiniteCohomology canonical carrier, coefficient dictionary and low-degree comparisons | Main `TauCetiRoadmap/ProfiniteCohomology/README.md`:205–219; `Suggested.lean`:323 is its private functor adapter, so it does not change native application syntax. |
| ProfiniteCohomology all-degree supplies | Main README:219–225,1227–1228,1245–1246,1549; low-degree sections expressly point to Layer 10. R02 records the incorrect consumer citations. |
| Seven resolver leads attributed to ProfiniteCohomology | Main Suggested.lean:752 `ofDiscreteModuleRes`; 2350 `corestriction_comp_res`; 2378 closed-subgroup vanishing descent; 3094 finite-p-primary criterion; 3108 bounded-exponent criterion; 3123 closed-subgroup cd bound; 3130 prime-to-p-index equality. They are roadmap declarations, not missing native names. |
| LocalGaloisGroups arithmetic application | `Completed/LocalGaloisGroups/README.md`:109–122,386,485 confirms the kernel, lifting and orientation imports. It consumes this abstract theory; it is not used to prove it. |
| LocalFieldsRamification wild inertia | Supplied open head, `TauCetiRoadmap/LocalFieldsRamification/README.md`:1298–1332 names native Sylow aliases and excludes the arithmetic G_K(p) presentation from its own scope. |
| ClassFieldTheory cd application | Main `TauCetiRoadmap/ClassFieldTheory/README.md`:224,1223,1288 consumes the Sylow cd result. |
| ProfiniteArithmetic ring/powers/Aut/Out | Supplied open head, `TauCetiRoadmap/ProfiniteArithmetic/README.md`:5–16,38–56,76–91 owns these extensions; this roadmap only uses its native group and p-adic-power precursors. No upward supply was introduced. |
| Belyi arithmetic consumer | Supplied open head, `TauCetiRoadmap/BelyiMaps/README.md`:86–91,228,303 resolves its generic infrastructure to ProfiniteArithmetic and its arithmetic extensions. |
| PadicMeasuresIwasawaAlgebras | Main README:23–26,97–99 explicitly continues Layer 9 with measure comparison and broader Iwasawa theory. The native ℤ_p completed algebra and one-variable coordinate are earlier inputs. |
| Existing completed abstract roadmap | `Completed/ProfiniteProPGroups/README.md` and Suggested.lean overlap this namespace and direction. The destination issue is the settled H01 item, not a newly invented independent project. |

Thus the claimed “one implementation” is accurate for the reducible carriers. No competing new construction was found in the relevant supplied open work. The inherited duplicate destination remains the previously settled merge consideration. Two main roadmaps and the completed base were also used to compare document shape. No executable algorithm, copied source passage, route-specific prime restriction or circular supply was found. The mathematics explicitly includes the dyadic and rank-one exceptional cases.

**Source sample.** No locator is explicitly labelled unverified in the README. The seeded “One implementation” was checked against native bodies and signatures; “The carrier is Mathlib's, and its calculus is the Profinite Cohomology roadmap's” was checked against the native cohomology definition and main supplier. “Theorem” was checked across the orientation and Labute classification statements, rather than assuming a theorem number implied the right hypotheses. Legal source acquisition used the sources service; no manifest was edited.

| Source and exact text locator | What was verified |
|---|---|
| `labute1967` lines 7–37, printed p.106 | Demushkin invariants, torsion-free q=0 convention and closed commutator notation. |
| `labute1967` lines 56–82, Theorems 1,2 and Remark 2, p.107 | Even q=2 families, rank/image realization and exact automorphism transport of relators in the Frattini subgroup. The pro-p orientation-image condition is retained. |
| `labute1967` lines 273–348, Propositions 1–3, pp.112–113 | Filtered/graded setup, the source's q-central convention and the cup trace. The roadmap uses lower-p indexing and explicitly supplies its own trace sign. |
| `labute1967` lines 478–526, Theorem 3 and proof, pp.118–119 | Preliminary normal forms and the correction route; this is not a blanket full-span assertion for q=0. |
| `labute1967` lines 527–544, Proposition 6, p.119 | Prescription characterization with finite-dimensional H¹; the continuous character is tied to that property. |
| `labute1967` lines 557–580, Theorem 4, p.120 | Character values in the three normal forms and their prescription property; the kernel misprint is recorded below. |
| `labute1967` lines 622–625, §4, p.121 | X=kerχ, E=X/[X,X], and conjugation by y⁻¹xy, requiring inversion against the native left-action convention. |
| `labute1967` lines 658–696, §4.1 and Theorem 5, pp.122–123 | Division separates c=0; procyclic coefficient factor and basis correction. The f/g distinction in the roadmap survives the dihedral test. |
| `labute1967` lines 717–817, §4.1 proof, pp.124–126 | Restricted correction image, tail detection and iteration inside kerχ. The inputs have the even-rank/procyclic-image hypotheses. |
| `labute1967` lines 818–870, §4.2, pp.126–128 | Split module computation, triangular correction and residual-commutator repair. The roadmap's displayed existential equation is correct; the source's subsequent choice has a sign slip. |
| `labute1967` lines 871–950, Theorem 6 and proof, pp.128–130 | Split-image normal form and character-preserving iteration; generator-value misprint recorded below. |
| `serre1963bourbaki` lines 282–306, §9.1–9.2, printed pp.154–155 | Infinitude, all finite modules killed by p, co-effacement/right exactness, cd2 and the open-subgroup Euler formula. |
| `serre1963bourbaki` lines 307–326, §9.3, p.155 | Twisted finite p-primary duality and orientation characterization. |

The legal copies are [Labute's publisher article](https://doi.org/10.4153/CJM-1967-007-8) and [Serre's Numdam exposé](https://www.numdam.org/item/SB_1962-1964__8__145_0/). Source extraction sometimes confuses subscripts and ≥ with >; I have not promoted ambiguous OCR into a source error. The explicit arithmetic witnesses, native signatures and unambiguous source formulas are distinguished from the uncertified book locators below.

## Not verifiable

- **NSW, second edition (`nsw2e`)**: the service's book lookup is uncertified/paywalled. The [legal Heidelberg author-hosted PDF URL](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf) resolved through the service to an index page rather than the book text. Thus the precise numbering/text of (3.9.13), (3.9.15), (3.9.19), the asserted p.417 generator choice, and the other NSW locators remain uncertified. I did not infer their wording from Labute or from the previous review. The abstract classification was checked independently against Labute and the pin.
- **Ribes–Zalesskii (`ribes_zalesskii`), Serre's Galois Cohomology (`serre_galois`), Koch (`koch`), Washington (`washington`), Fried–Jarden (`fried_jarden`), Dixon–Formanek–Poland–Ribes (`dixon_formanek_poland_ribes`)**: the sources service resolved the identified editions/DOIs only to paywalled publishers. Their book/article locators are uncertified; no paywall was bypassed. Washington's corrected DOI lookup also returns uncertified. No settled text was renamed or requested again.
- There is no readable source manifest for this package. The previous scope settlement is respected. The successful Labute fetch supersedes its initial host-classification failure; there is no outstanding request for that text. Missing-text status does not park this review or conceal the findings established without those books.
- This is a statement, source, ownership and acceptance-interface review, not a re-verification of every proof in either pinned library. Computed examples do not establish universal truth. Ambiguous glyphs in the source extraction remain unverified as print details.

## Source issues

- **Misprint** in labute1967 at Theorem 4 proof, printed p.120 (line 569): the source says the multiplicative orientation character sends the relator to zero; it should be the unit one; affects the proof.
- **Misprint** in labute1967 at §4.1 evaluation of the second coefficient, printed p.123 (line 677): the source says substitution raises −2−2^f to the exponent ab; it should be −1−2^f, since the powered expression is 1+T; affects the proof.
- **Misprint** in labute1967 at §4.2 auxiliary division lemma proof, printed p.127 (lines 843–852): the source says to choose Φ=Sφ after θ=(2^f+T)φ; it should be Φ=−Sφ for the displayed equation with a plus sign; affects the proof.
- **Misprint** in labute1967 at Theorem 6 proof, printed p.128 (line 880): the source says the nontrivial principal-unit character value is on x₃ and the value on x₄ is one; it should place that value on x₄ and one on x₃; affects the proof.


