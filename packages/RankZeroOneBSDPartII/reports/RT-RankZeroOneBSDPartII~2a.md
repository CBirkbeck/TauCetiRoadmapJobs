<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1744#issuecomment-6444706501 -->
Red team round 2 pass a (codex) of de6e426

Verdict: needs_changes

1. **F01** (P2) The ordinary-control gap asks a second owner for an existing theorem

   **Location:** `packages/RankZeroOneBSDPartII/README.md:75`, also lines 219, 223 and 233; `packages/RankZeroOneBSDPartII/design/plan.json:1279`: “prove finite discrete restriction-control errors and rational compact specialization kernel (γ−1)S”.

   **Claim:** Both the discrete restriction-control theorem and compact specialization kernel are missing endpoints for SelmerIwasawaCohomology; §2.1 plans their proof here from its diagrams.

   **Witness:** `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md:5577` states `augmentationControl`; line 5589 supplies its corank-one consequence. Neither needs residual irreducibility, (Sc), or (Irr). The supplier is earlier (order 113 versus 283).

   **Exact repair text:** Add an EulerSystemsAndKolyvaginSystems supplier paragraph: “Use §8.31, Augmentation control and its corank-one consequence, for finite discrete restriction-control kernel and cokernel and for the rational coinvariant dimension. Its good ordinary, split-level, split-p and E(K)[p]=0 hypotheses follow from the local dictionary and Heegner conditions; §1.2 supplies corank one for the selected field.” Replace the existing gap sentence, in both README and the matching plan gaps entry, by: “For the CGLS self-dual ordinary anticyclotomic Selmer groups with both residual local characters nontrivial, prove that the compact specialization S→H¹_f(K,V_pE) has kernel (γ−1)S after inverting p, retaining the local-image, H² and Tor cokernel terms.” In §2.1 replace the discrete-control construction in the proof route by “Import EulerSystemsAndKolyvaginSystems §8.31's augmentation control and corank-one consequence”; retain the compact-specialization argument and add that supplier to Needs and Layer 2 Dependencies. Correct the ownership sentence at line 9 accordingly.

   **Repair test:** For R=Λ_(γ−1), X=R has coinvariant dimension 1 and torsion length 0; X=R⊕R/(γ−1) has dimension 2 and fails corank one. The existing supplier proves exactly this discrete exclusion. It does not state the compact injection; the reduced gap still supplies that. In the arithmetic application, local p-torsion vanishes and p splits, hence E(K)[p]=0, and all supplier hypotheses hold without adding a restriction to the endpoint.

## Verified sound

Read **all 529 README lines and all 32 Suggested.lean lines**, all **17 numbered targets**, **21 definition-API bullets**, and **50 labelled Check bullets**. There are **zero Lean declarations**. Checked **25 named source locators** in the three supplied legal cached works, and **16 roadmap supplier/ownership families** in the citation table below. Counts refer to inspection, computed controls and contract matching, not proofs of the deep arithmetic results. S01 is the remaining ownership/minimal-gap defect; the mathematical computations below produced no counterexample to a target.

The reviewed checkout is de6e426. Content main is d2e0f0d323cf817cdf8a11c7a2fabd0a3f0ec828. The manifest pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The read-only diff has seven files, all within `packages/RankZeroOneBSDPartII/`. No package file, order file or library was changed, no Lean command was run, and nothing was posted.

### Round-one repair audit

Each earlier finding is addressed individually, including the duplicated findings across the two passes. Quotes below are from the repaired package, not the papers. The retained Part II folder/title is the repair report's intake-level naming matter; its rationale is not re-raised.

| Earlier finding | Status and repaired passage | Verification witness / repair regression check |
| --- | --- | --- |
| r1a F01 | **Repaired.** README:101: “Part VII §5.32 ‘Attainable local three-isogeny ratios’ supplies the Kodaira/twist and differential tables”. Also :374, :383, :425. | Part VII README:2336 explicitly includes every finite extension at ℓ≠3, including 2. Finite ratios 1 and 3, multiplied by real ratios 1 and 1/3, give (1,1/3) and (3,1). |
| r1a F02 | **Repaired.** README:391: “No limiting density of B_i is asserted or used”. The same paragraph supplies the cutoff product and applies `le_liminf_mul`. | Pinned `Mathlib/Topology/Algebra/Order/LiminfLimsup.lean:133` has the needed nontrivial-filter and boundedness hypotheses. A relative liminf 1/2 and stratum limit 1/8 give 1/16; no relative limit is needed. Empty cutoffs give 0=0·0. |
| r1a F03 | **Repaired.** README:91: “§0.2 ‘Family defined by local conditions’; §0.5 ‘Quadratic twist squareclass family’; §0.6 ‘Squarefree integers in residue classes’; and §0.15 ‘Positive squareclass denominator’”. | These are Part I README:462, :1118, :1240, :1950, respectively. All specific Needs at :366, :383, :473 match. At q=3 the relative coprime-residue constant is (1/3)/(1−1/9)=3/8. |
| r1a F04 | **Repaired.** README:143: “standing hypotheses, pp. 518–521, and Theorem E, p. 522”. | CGLS line 79 is the standing good-odd-prime condition; line 201 identifies printed p.522; line 219 begins Theorem E. The §5.3 standing-hypothesis locator is also corrected to p.518. |
| r1b F01 | **Repaired in the package's stated scope.** README:7: “The forward direction from which this roadmap starts is supplied by named owners”. | ArithmeticStatisticsPartVI README:2277 explicitly includes the Q-only forward theorem for every modular elliptic curve, independently of its narrower Heegner-logarithm branch; :2331 supplies p-parity. HeegnerPointEulerSystems §§8b.2, 8b.10 supply the rational comparison and Eisenstein equality. The nonexistent base is no longer cited as an input. |
| r1b F02 | **Repaired.** README:383 now includes “§5.32 ‘Attainable local three-isogeny ratios’”. | Same verified local-ratio owner as r1a F01; its explicit bad-dyadic clause supplies the previously missing case. |
| r1b F03 | **Repaired.** README:473: “ArithmeticStatisticsPartI §0.6 squarefree residue counts and §0.1 relative density”. | The four corrected section locations agree with Part I. Keeping §0.5 in §4.4's family citation is correct: that citation concerns the carrier, not the residue-count theorem. |
| r1b F04 | **Repaired.** README:87: “Section 8.17 assumes squarefree N and is not used”. Needs :267 names §§0.1, 8.14, 8.18, 8.19. | GrossZagierAndArithmeticHeights README:5081 has (sqf); :5111–5117 supplies the admissible-level criterion without (sqf); :5125 gives the normalized elliptic formula. EffectiveClassNumbers README:648 allows every split level. For N=20, D=−71, the residues at 2,5,3 are 1 mod8, 4 mod5, 1 mod3; all split, although 20 is not squarefree. |
| r1b F05 | **Repaired.** Suggested.lean:25–27: “scope diagnostics on single explicit curves, kept in README.md as targets with their Checks”. | Zero definitions, theorems, examples or TauCeti imports remain. The local obstruction remains at README:503 with d≠0. At d=1,3 its j-valuation is −3 in both cases; it is no longer acceptance-file padding. |
| r1b F06 | **Repaired.** README:358: “whose isogeny kernel is generated by a rational point of order 3 (φ|G₃=1)”. | On classes (1,2,3,6), φ=1 gives admissibility (0,1,0,0), whereas φ=η gives (1,0,0,0). The corrected hypothesis separates these cases; README:33 has the analogous correction. |

No repair introduced a mathematical counterexample. S01 concerns an existing overlap missed by both previous passes, not a settled finding being re-raised.

### Acceptance file and headline inventory

The twelve mathematical headlines are §§0.2, 1.1–1.2, 2.1–2.3, 3.1–3.3 and 4.2–4.4. Suggested.lean:10–23 names each: the finite-Selmer/corank comparison, complementary fields, corank one over K, augmentation control, Heegner factor comparison, non-torsion Heegner point, p∞ converse, rank/Sha consequence, finite-Selmer converse, positive admissible strata, relative analytic proportions and positive absolute proportions. The four definitions are the hypothesis bundle, admissible family and two concrete coefficient models; §§5.2–5.3 are diagnostics.

The module explains the missing actual Kummer Selmer, normalized Heegner, ordinary anticyclotomic and continued elliptic L-function interfaces. The pinned raw L-series and general cohomological localization kernel do not supply them. The native two-descent squareclass groups in Tau Ceti's Mordell–Weil development do not supply the odd-primary arithmetic Selmer carriers either. No headline has been replaced with an arbitrary function, scalar identity or free predicate. Zero declarations means zero hidden section variables, instance binders, name collisions or one-tactic padding candidates. There is nothing to put in a per-declaration `#check` file.

| Suggested.lean declaration inventory | Section / variable / instance context | Computed count | Result |
| --- | --- | --- | --- |
| No declarations, lines 1–32 | One `import Mathlib`; one module docstring; namespace only; no variables or instances | defs=0, theorems=0, sorry bodies=0, examples=0 | No signature to elaborate; no omitted retained declaration |

### Per-target computed adversarial table

Line numbers below refer to `packages/RankZeroOneBSDPartII/README.md`. Write C for the fixed-isogeny condition, η for the unramified quadratic character at 3, and R for the augmentation-local DVR. Arithmetic theorem rows test the stated implication using its verified suppliers; an abstract module example is a control on that step, not a claim to realize every such module arithmetically.

| Statement | Instances tried and values on both sides | Result / change |
| --- | --- | --- |
| §0.1 (:119–145), definition C | p=3, character pair (φ,ψ)=(η,ωη): φψ=ω and C=1 for good E. Pairs (1,ω),(ω,1): exclusion=0 and C=0. At p=2, p>2 is false; at multiplicative reduction the good-reduction conjunct is false. A nonzero extension class does not change either diagonal character. | Coherent predicate, with actual kernel rather than a freely chosen constituent; no change. |
| §0.2 (:149–162), finite Selmer versus corank | S=(Q₃/Z₃)^c⊕M², s=dim M[3]. For (c,s)=(0,0),(1,0),(0,1),(1,1), dim S[3]=0,1,2,3 versus c=0,1,0,1. Thus dim≤1 forces s=0. Z/9 has dim[3]=1 but corank0 and no perfect alternating pairing: every pairing value is ab·b(1,1)=0. | Correct; the finite reduced pairing is essential, full Sha finiteness is not assumed. |
| §1.1 (:176–189), complementary K | r=0: w(E)=+1, w(E^K)=−1, twist order1. r=1: signs −1,+1, twist order0. In both cases the product sign is −1 and complementary order is 1−r. D=−3 gives u_K=3 and fails D<−4; splitting at2 forces D≡1 mod8. | Correct conditional on the named complementary-twist gap; no change. |
| §1.2 (:193–205), corank over K | r=0: 0+1=1; r=1: 1+0=1. At split p the completion degree is1 and local p-torsion dimension is0 at both places, hence global dimension0. On c-eigenvalues ±1, (1±c)/2 gives (1,0),(0,1). | Correct use of the forward theorem on the known twist. |
| §2.1 (:219–233), augmentation control | X=R, R⊕R/(T), R⊕(R/(T))² give coinvariant dimensions1,2,3 and torsion lengths0,1,2. A finite Z/3 error rationalizes to0. Tor₁(R/(T),R/(T))=R/(T), dimension1, so the compact cokernel cannot simply be discarded. | Mathematical consequence correct; S01 imports the already-owned discrete part and narrows the gap. |
| §2.2 (:237–250), bottom-class normalization | For a₃=2, α=5 mod9 satisfies α²−2α+3=18=0 mod9, β=6 mod9 and α⁻¹=2 mod9. Traced factor=(1−2)²=1 mod9; Howard factor=5²(6−1)²=4 mod9. Both have valuation0. For α=1 mod3 the trace factor is0 mod3 and is excluded. Tracing each Artin translate yields the same trace. | Constants are distinct and both units; no class-number division; no change. |
| §2.3 (:254–267), non-torsion trace | S=R, κ=1: quotient length0, char-square=(1), bottom1. κ=T: quotient length1, char-square=(T²), bottom0. The latter contradicts the required torsion exponent0. Height h_(O)=1 gives h_x=2>0; L′≠0 with sign−1 gives central order1. | Equality at augmentation plus compact injection is sufficient; no change. |
| §3.1 (:281–294), p∞ converse | Base-change order1 equals original+complementary: 0+1 and1+0. Subtraction gives original0 and1. r=2 would give natural-subtraction junk 1−2=0 but is outside r∈{0,1}. | Correct at the stated range. |
| §3.2 (:298–310), rank and whole Sha | Analytic orders0,1 give ranks0,1 and finite whole Sha by the supplier. A group ⊕_(ℓ≠p)Z/ℓ has p-primary size1 and infinite total cardinality, so one-primary finiteness alone would fail. | The actual forward theorem supplies the stronger conclusion. |
| §3.3 (:314–327), finite-Selmer converse | Finite dimensions0,1 give coranks0,1 by §0.2, hence analytic and arithmetic ranks0,1. The false model S=Z/3 has dimension1 and corank0 but fails the paired finite-part hypothesis. p=3 passes p>2. | Correct composition. |
| §4.1 (:341–366), admissible family | For nineteen-a3, classes (1,2,3,6) give (0,1,0,0). For its 2-twist they give (1,0,0,0). The ratio18/2=9 is a square, so both name the same admitted class. For W with v₃(j)=−3, all four classes give0. | Definition, duality and twisting iff agree; no change. |
| §4.2 (:370–383), positive ratio strata | Fix all finite ratios away from3 equal1. If c₃=1, real factors1,1/3 give exponents0,−1. If c₃=3 they give1,0. Every compatible prescribed local class has positive mass; multiplying finitely many positive masses remains positive. | Correct; dyadic existence now has the right supplier. |
| §4.3 (:387–401), restricted and absolute bounds | Even ranks0,2 with probabilities q,1−q have mean2−2q≤1 ⇒q≥1/2. Odd ranks1,3 give3−2q≤4/3 ⇒q≥5/6. Masses1/8,1/4 yield1/16,5/24. Alternating full/half-filled very long blocks have relative liminf1/2, limsup1 and absolute liminf1/16 in a mass1/8 stratum. Empty cutoffs yield0=0·0. | Correct lower limits; no existence of analytic density needed. |
| §4.4 (:405–417), positive absolute proportions | For positive stratum masses a,b, a/2>0 and5b/6>0. If A₃ is empty, both masses are0 and the premise requiring a good-at3 twist fails for W. | Correct scoped consequence; no claim on the complement. |
| §5.1 (:431–455), nineteen-a3 | Coefficients(0,1,1,1,0) give b₂=4,b₄=2,b₆=1,b₈=0; Δ=−19,c₄=−32,c₆=8,j=32768/19. c₄³−c₆²=−32832=1728Δ. Mod3 the x-fibres have2,2,1 points, giving #E=6 and a₃=−2. Tangent y=x leaves x³=0. | All coefficient, ellipticity, point and sign computations agree. |
| §5.2 (:459–473), exact admissibility/density | φ=1, χ₂=η and a₃(E²)=2; only the nonsquare unit class passes. Unit masses3/8+3/8=3/4, ramified masses1/8+1/8=1/4. The allowable residue2 has density3/8. 5/12−3/8=1/24>0. | The restricted conversion cannot establish41.6%; it supplies no upper bound on the full rank-one set. |
| §5.3 (:477–503), obstruction model and local theorem | (1,0,3,0,0) gives b₂=1,b₄=3,b₆=9,b₈=0; Δ=−2160,c₄=−71,c₆=−1837,j=357911/2160. The numerator has v₃=0, denominator v₃=3, so v₃(j)=−3. For d=1,3,1/3, raw (v₃Δ,v₃c₄)=(3,0),(9,2),(−3,−2), each giving3v(c₄)−v(Δ)=−3. d=0 gives Δ=0 and is excluded. | Every nonzero local twist fails good reduction, including after minimalization. |

### Every definition-API bullet

Each row is one API bullet; line numbers refer to the reviewed README. “Unchanged” records a successful mathematical test, not a proposed extra Lean declaration.

| Statement line | Instances and computed values | Result / change |
| --- | --- | --- |
| 125, constructor | p=3, degree3, good reduction, φ=η: all conjuncts1, C=1; φ=1: exclusion0, C=0 | Unchanged |
| 126, projections | C=1 gives p>2 true, good=true, degree=3; degree1 differs from3 and cannot enter | Unchanged |
| 127, characters | φ=η gives ψ=ωη and product η²ω=ω; φ=1 gives ψ=ω and fails exclusion | Unchanged |
| 128, duality | Exchange 1↔ω and η↔ωη; admissibility vector (0,0,1,1) is preserved | Unchanged |
| 129, transport | Kernel basis rescaling −1 gives (−1)φ(g)(−1)⁻¹=φ(g); the marked kernel is transported | Unchanged |
| 130, identity | Iφ(g)I⁻¹=φ(g); the proposition still has the same proof-irrelevant witness | Unchanged |
| 131, composition | Two basis rescalings −1 compose to1; successive and composite transport both give φ(g) | Unchanged |
| 347, membership | For nineteen-a3 and d=2: good=1, exclusion=1, membership=1. For d=1: good=1, exclusion=0, membership=0 | Unchanged |
| 348, squares | 18/2=9=3²; χ₁₈=χ₂=η locally and both membership values1 | Unchanged |
| 349, initial twist | d₀=2,d=1 gives membership1 in E² and membership1 for2 in E; d=2 gives membership0 for4 in E. Heights1 and2 differ | Unchanged; no height-preserving claim |
| 350, dual family | (φχ,ψχ)=(η,ωη) yields (admitted,admitted)=(1,1); (1,ω) yields(0,0) | Unchanged |
| 351, localization | The four local classes are1,2,3,6. Allowed set{2} has mass3/8; allowed set∅ for W has mass0 | Unchanged |
| 352, C iff membership | d=2 gives 1↔1; d=1 gives0↔0; d=3 gives0↔0 through bad reduction | Both directions hold |
| 437, coefficient projections | (0,1,1,1,0) gives a₂=a₃=1; the short-model tuple would give a₂=a₃=0 | Unchanged |
| 438, invariants | (Δ,c₄,c₆)=(−19,−32,8); c₄³−c₆²=−32832=1728·(−19) | Unchanged |
| 439, ellipticity | Δ·(−1/19)=1 in Q; the zero equation has Δ=0 and fails over Q | Unchanged |
| 440, proof-independent j | Both choices of unit witness have inverse−1/19; (−32)³/(−19)=32768/19 | Unchanged |
| 441, base change | In Q[ε]/(ε²), every coefficient has ε-part0 and retains its integer value. In the zero ring all images0=1. A unital Q→F₃ would imply1=f(3·1/3)=0, so no such map exists | Correct full ring generality |
| 493, W projections/ellipticity | (1,0,3,0,0), Δ=−2160, inverse−1/2160, product1 | Unchanged |
| 494, W invariants | (c₄,c₆)=(−71,−1837); c₄³−c₆²=−3732480=1728Δ; j=357911/2160 | Unchanged |
| 495, W local base change | Q→Q₃ preserves the tuple. A coordinate scaling u changes valuations by −4v(u),−12v(u), hence changes v(j) by3(−4v(u))−(−12v(u))=0 | Unchanged |

### Every labelled Check

The statement is identified by its README line. For prose cautions the numerical row tests the distinction the caution makes. All fifty bullets are accounted for.

| Check line | Computed instance / result |
| --- | --- |
| 33 | η(Frob)=−1, η(I)=1, (ωη)(I)=−1; η·ωη=ω; characters1,ω fail |
| 34 | c=1 gives projectors(1,0), c=−1 gives(0,1); 1/2 is not in Z₂ |
| 35 | Under γ↦γ⁻¹, T↦−T/(1+T), order1 at T=0; 3 is invertible in Λ[1/3], T is not |
| 36 | h_x(P)=2,h_x(2P)=8; (8−2−2)/2=2, while the (O)-height polar form gives1 |
| 37 | 3/8+3/8+1/8+1/8=1; unit mass3/4; 18/2=9 is square |
| 137 | Character pairs(η,ωη) and(ωη,η) both have exclusion value1 |
| 138 | φ=1 and φ=ω each have exclusion value0 |
| 139 | p=2 gives2>2 false; multiplicative reduction gives good=false |
| 140 | Matrices with diagonal charactersη,ωη and nonzero extension entry still have the same kernel/quotient and determinantω; exclusion=1 |
| 141 | Nontrivial residual characters have fixed-space dimension0; η(Frob)=−1 gives a₃≡2 and an ordinary unit root |
| 157 | On cyclic Z/9, alternating b(k,l)=kl·b(1,1)=0; cardinality9 alone does not produce a perfect form |
| 158 | c=1,dim M[3]=1: finite dimension1+2=3, corank1 |
| 184 | r=0 has complementary order1; r=1 has complementary order0 |
| 185 | Required split local character is+1 at every N-prime; a nonsplit choice has value−1 and fails the premise |
| 201 | Only the twist's corank is inferred from its known analytic order1−r; adding gives r+(1−r)=1 without assigning Sha(E) a finite cardinality |
| 227 | Ordinary X has Λ-rank1; torsion Greenberg X_E has rank0 and cannot supply that free summand |
| 228 | (R⊕R/T)/T has dimension2, exceeding the allowed1 |
| 229 | (Z/3)⊗Q₃=0, but (Λ/T)[1/3]=Q₃≠0 |
| 245 | κ=T≠0 in R has bottom0; tower nonvanishing alone fails |
| 246 | Trace sends σ_vP and σ_v̄P to Tr(P); the group-ring factor becomes(1−α⁻¹)², equal1 mod9 in the a₃=2 example |
| 262 | (T²) and(1) are unequal before T-inversion; both become(1) afterward, losing the bottom-class obstruction |
| 263 | An abstract divisible Sha line contributes corank1 with Mordell–Weil rank0; it does not meet a control theorem assuming rank1 and finite Sha |
| 289 | Original order0 means L(1)≠0; original order1 means L(1)=0,L′(1)≠0 |
| 290 | p=3 satisfies the odd-prime hypothesis; N=20 is nonsquarefree yet is not excluded by p∤N or the split-level formula |
| 306 | A p-primary-zero group can be infinite, e.g. ⊕_(ℓ≠p)Z/ℓ; the cited forward theorem supplies finite total Sha |
| 322 | Z/3 has p-torsion dimension1 and corank0; the alternating paired finite-part hypothesis excludes it |
| 323 | 3>2 is true, whereas3≥5 is false; the cited Eisenstein theorem uses the former |
| 358 | φ=1 on classes(1,2,3,6) gives(0,1,0,0) |
| 359 | [2]=[18], both admitted; counting them twice would give2 instead of1 |
| 360 | W has v₃(j)=−3 for all twists; good reduction would require≥0, so allowed set∅ |
| 361 | φ=η gives class1 admitted and class2 excluded: η·η=1 |
| 362 | W has a rational flex of order3 but A₃=∅ |
| 378 | For nineteen-a3, changing local class2 to1 changes admissibility1 to0; statistical subsets must keep the class fixed |
| 379 | Finite ratio1 times real1/3 gives3^(−1); finite ratio3 times real1 gives3^1 |
| 395 | Relative1/2 and5/6 become absolute1/16 and5/24 at masses1/8 and1/4 |
| 396 | Oscillating relative proportions have liminf1/2 and limsup1; no exact density follows |
| 397 | The same oscillation times limiting mass1/8 gives absolute liminf1/16; the odd bound is(5/6)(1/4)=5/24 |
| 413 | A₃ has mass3/8 in the example, leaving mass5/8 with no analytic conclusion from this conversion |
| 447 | Δ=−19, not19 or−361 |
| 448 | Affine x-fibres2,2,1 total5; infinity adds1; trace4−6=−2, distinct from equation coefficient a₃=1 |
| 449 | Native parameter4d=8 gives Δ=−19·8⁶=−4980736; standard parameter2 would give−1216 before coordinate comparison |
| 450 | F_x(0,0)=−1,F_y(0,0)=1; tangent y=x and residual x³ show intersection multiplicity3 |
| 451 | Actual(a₂,a₃)=(1,1), short-model values(0,0); these are different equations |
| 467 | Conditional nonzero-unit share1/2 times unit mass3/4 gives3/8, not1/2 |
| 468 | (0,0) is affine; infinity is a different point. The tangent shows3P=O and P≠O |
| 469 | 5/12 exceeds3/8 by1/24; a restricted argument fails without imposing an upper bound on the full rank-one set |
| 485 | A twist multiplies c₄³ and Δ by the same(4d)⁶; j and its valuation−3 stay fixed |
| 499 | F_y=3,F_x=0 at W's(0,0); tangent y=0 gives x³=0, with P distinct from infinity |
| 500 | 2160=2⁴·3³·5; 357911=71³ has v₃=0; v₃(j)=0−3=−3 |
| 501 | d=0 gives Δ=0; d=1,3 give raw valuations3,9 and the same j-valuation−3 |

All four definitions have at least three discriminating controls. Domain exclusions were also tested: p=0,1 fail primality; p=2 fails oddness; singular equations fail ellipticity over Q; zero, nonreduced and characteristic-p rings do not instantiate the arithmetic curves, but the Q-algebra base-change statement was tested on the zero ring and Q[ε]/(ε²). Inseparable extensions do not instantiate the characteristic-zero arithmetic setting. S₃ and Q₈ cannot instantiate the additive abelian Selmer groups. A rank-zero augmentation module fails the rank-one premise. The empty family has count and density0 and is excluded from conditional proportions. No theorem here quantifies over arbitrary covers, fans, noncompact groups or unrestricted universes. Denominators are nonzero by d≠0, ellipticity, u_K=1, invertibility of2 at odd p, or the positive family denominator; zero cutoff denominators use the explicit value0.

### Supplier resolution, ownership and direction

The sixteen rows below cover all named roadmap supplier/ownership families, including the newly identified earlier owner. Section citations were resolved against main, the furnished heads, or the board designs as indicated. `roadmaps grep`/`show` supplied the indexed new-roadmap heads for the earlier suppliers not present on content main. Object searches covered the indexed open roadmaps, main active/completed roadmaps and board packages: actual isogenies and twists, reduced-primary pairing, finite Selmer/corank comparison, augmentation control, Heegner specialization, Eisenstein converse, local ratio strata and nineteen-a3. No new fully qualified Lean name exists in the reviewed file.

| Supplier / ownership family | Resolved section and evidence | Scope/convention comparison |
| --- | --- | --- |
| EllipticCurves, main | `TauCetiRoadmap/EllipticCurves/README.md`, Layers1–2,4–5,7; the separable stable-kernel quotient is in Layer1 | Generic isogeny, character, reduction, twist and Kummer work stays upstream. The specialized good odd-prime local dictionary remains declared. |
| EllipticCurveModularity, ed342f3 | `TauCetiRoadmap/EllipticCurveModularity/README.md`, R29.3–R29.6, especially “The morphism from X₀ at the conductor” and “Continuation and the functional equation” | Supplies the actual modular form, bad factors and normalized parametrization π(∞)=O. This normalization is inherited in the Heegner comparison; arbitrary translations are not permitted. Does not yet provide the complete requested quadratic arithmetic factorization. |
| ModularForms, main | `TauCetiRoadmap/ModularForms/README.md:708`, Layer7 | Continued arithmetic function, not raw `tsum`; weight2 centre1 and sign−ε_N. |
| SelmerIwasawaCohomology, 1fa1c7d | `TauCetiRoadmap/SelmerIwasawaCohomology/README.md`, §§2.6,2.9–2.12a,3.9–3.11,4.26,4.28,4.29 | Cofinite generation and actual Kummer/Sha carriers; rational quadratic decomposition; finite reduced-primary T×T. Local-image, H² and Tor terms retained. S01 removes the redundant discrete-control request. |
| HeegnerPointEulerSystems, furnished head | `TauCetiRoadmap/HeegnerPointEulerSystems/README.md:1393`, :1418, :1441, :1546, :1708, :1814, :1830, :1850, :2056, :2142 | §§8.5–8.6a,8.13,8.24,8.31–8.32,8.34,8b.2,8b.10 exist. Actual fixed quotient/lattice and class-number shifts retained. Rational odd-p comparison includes3; the integral stronger equality has its own independent upstream gaps. Finite near-trivial congruences in8.32 do not replace the new exact full trace. |
| PadicMeasuresIwasawaAlgebras, main | `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:2328`, Layer4 | Finitely generated modules over a complete DVR power-series ring; localization at T has residue Q_p. The package uses O=Z_p and does not extrapolate p-formulas to ramified coefficients. |
| GrossZagierAndArithmeticHeights, furnished head | `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md`, §§0.1,8.14,8.18,8.19; :5111, :5125 | Hodge/test-vector, unit-index and height normalizations retained; normalized elliptic parametrization required. Squarefree8.17 is not consumed. |
| EffectiveClassNumbers, furnished head | `TauCetiRoadmap/EffectiveClassNumbers/README.md:648`, §2.8 | Classical all-split, odd-D, coprime-level formula for any N, with positive explicit constant and K-relative x-height. |
| ArithmeticStatisticsPartI, 3b1a24f | `TauCetiRoadmap/ArithmeticStatisticsPartI/README.md`, §§0.1,0.2,0.5,0.6,0.15; :318, :462, :1118, :1240, :1950 | Cutoff ratio0 at empty denominator; unweighted signed squareclasses; finite compatible local prescriptions; nonuniform masses. Density-tower theorem needs two limits and is no longer misused. |
| ArithmeticStatisticsPartVI, 88461f2 | `TauCetiRoadmap/ArithmeticStatisticsPartVI/README.md:2277`, :2331 | The separately stated forward Q theorem is general despite the logarithm theorem's narrower preceding hypotheses. p∞ parity includes reducible residual action and p=3. Both complementary branches with prescribed splitting remain an explicit gap. |
| ArithmeticStatisticsPartVII, cbcd49e | `TauCetiRoadmap/ArithmeticStatisticsPartVII/README.md`, §5.10 and :2336 (§5.32) | Reduced rank is dim Sel₃−dim E(Q)[3], equal to dim Sel₃ on A₃. Both restricted bounds keep C. §5.32 includes bad dyadic local ratio-one existence. |
| ArithmeticStatisticsPartIII, 6f16f6c | `TauCetiRoadmap/ArithmeticStatisticsPartIII/README.md:2272`, “Windowed cubic counting contract” | Seven-part C is genuinely retained by the counting/mean theorem. The declared rational uniform instance supplies its discharge; the numerical mean alone does not. |
| CMRankZeroConverse, board design | `packages/CMRankZeroConverse/design/README.md:69`, §C.0 | Shared implication corank=r ⇒ analyticRank=r exists. It does not itself prove a converse or import CM assumptions into this branch. |
| RankOneConverse, board design | `packages/RankOneConverse/design/README.md:50`, §§PC.0–PC.6 | Named as the separate irreducible-residual owner; no theorem from that branch is used as the Eisenstein proof. The resolver's missing-roadmap lead is accounted for by this readable design. |
| ModularIwasawaMainConjectures, furnished head | `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:1955`, §6.1 | It supplies formulation inputs in its p>3 scope, not the Eisenstein equality. The package's actual odd-p equality input is HeegnerPointEulerSystems8b.10; no p=3 consequence is inferred from this interface alone. |
| EulerSystemsAndKolyvaginSystems, 7a0e642 | `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md:5577`, :5589, §8.31 | Existing discrete augmentation control and corank-one consequence; S01. |

The new package owns the assembly of the Eisenstein converse, exact traced specialization, admissible statistical conversion and its concrete diagnostics. Generic cohomology, Selmer, isogeny and local-ratio constructions remain with their named owners. The discrete augmentation theorem is the exception identified in S01. No ownership move to a later roadmap is required.

All five declared slugs and their `needs` sentences match exactly between README and the top-level `gaps` list of `packages/RankZeroOneBSDPartII/design/plan.json`. Each has a named earlier supplier. The local-character contract, both complementary nonvanishing branches, complete actual quadratic L-function comparison, and rational counting contract are substantive arithmetic endpoints beyond the cited existing targets. The compact specialization kernel is likewise a substantive remainder; its discrete companion is already supplied, as S01 records. These gap contracts are accepted conditionally, not treated as absent theorem findings.

The required read-only dependency check returned:

```text
depcheck: 149 roadmaps, 1012 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The order was not changed. S01's earlier supplier is at113, while the reviewed roadmap is at283.

### Pinned APIs and carrier checks

All paths here are relative to their library repositories.

| Pinned object/claim | File and line verified | Computed discriminant / domain control |
| --- | --- | --- |
| Native equation and invariants | `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:76`, :120, :124, :131, :230, :366, :388 | Five coefficient fields; c₄=b₂²−24b₄, c₆=−b₂³+36b₂b₄−216b₆. The zero equation is allowed as a curve but Δ=0 is not a unit over Q. Ellipticity over a ring requires a unit. |
| Minimal model/good reduction | `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean:299`, :323, :328 | `minimal` returns a K-equation; good reduction carries minimality and multiplicative valuation(Δ)=1, equivalently additive valuation0. Raw twist valuation9 alone is not a reduction test. |
| Literal L-series | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:84` | Direct application of `LSeries` to arithmetic coefficients; it does not construct the continued central germ. |
| General Sha kernel | `Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:71` | Intersection of restriction kernels for supplied coefficient data; not the arithmetic elliptic local-comparison theorem. |
| Northcott | `Mathlib/NumberTheory/Height/NumberField.lean:431`; `Mathlib/NumberTheory/Height/EllipticCurve.lean:116` | Finite height sublevels over the stated number field/Northcott context; not a finiteness statement over arbitrary fields. |
| Liminf multiplication | `Mathlib/Topology/Algebra/Order/LiminfLimsup.lean:133` | For ratios in[0,1], eventual nonnegativity, upper boundedness and the required coboundedness all hold; (1/2)(1/8)=1/16. |
| Native isogeny | `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139` | Contravariant conditioned coordinate pullback and infinity condition; characteristic-zero cyclic degree3 is not a free arbitrary point map. |
| Native twist | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:169`, :239, :299, :306 | Parameter t²−4n; at t=0,n=−2 this is8. Δ scales by8⁶; j is unchanged. The ellipticity iff includes the parameter being a unit. |
| Canonical height | `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:260`, :332 | Nonnegativity and zero iff torsion; latter retains Northcott. h(2P)=4h(P) distinguishes the diagonal normalization. |
| Native finite generation | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean:121` | `WeierstrassCurve.Affine.fg_point_of_numberField` has number-field and ellipticity context, not a statement for all fields. |

### Source locator verification

The count25 treats equations within one named remark/proof as part of that locator, not separate works. No extra source was needed. All three works already have unique manifest keys, legal author-copy provenance and version/pagination notes.

| Source | Named locators verified | Reading outcome |
| --- | --- | --- |
| CGLS (9) | Introduction standing hypotheses, pp.518–521 (line79); Theorem E,p.522 (line219); Corollary3.4.2,p.566 (line1847); Remark4.1.3 with(4.4)–(4.5),pp.568–569 (line1934); Corollary4.2.3,p.570 (line2001); Theorem5.2.1 and its two proof branches,pp.574–575 (line2145); Corollary5.2.2,p.575 (line2191); Corollary5.2.3,p.575 (line2198); Remark5.2.4,p.575 (line2206) | Good odd reduction and the local exclusions are retained; (Sel) is established before the source equality. The two statistical proof gaps are recorded below; the package correctly limits its conversion. |
| BKLOS (9) | §2 family/height,pp.2–3 (line94); Theorem2.5,p.4 (line159); Theorem2.6,pp.4–5 (line166); §9.1,p.14 (line643); §9.2,p.14 (line654); Proposition10.1,p.14 (line674); Theorem10.5,pp.15–16 (line713); Proposition10.7,p.17 (line764); §11 proof of2.6,p.18 (line800) | Signed versus absolute exponent is explicitly reconciled. The good ordinary differential alternatives are1 and3 over Q₃; real alternatives1 and1/3. Finite local squareclass restrictions are retained in the statistical application. |
| PS (7) | §1,p.2 (line64); §2,pp.3–4 (line132); Theorem5,p.10 (line425); Corollary6,p.11 (line456); Corollary7,p.11 (line461); Theorem8,pp.11–12 (line474); Corollary9,p.12 (line510) | Elliptic alternation follows from the rational polarization divisor. Reduced-primary finiteness is separate from total Sha finiteness; the package does not assume the latter to apply the pairing. |

## Not verifiable

- No Lean elaboration or build was run, as required. The supplied signature artifact is unavailable because the acceptance file has no named declarations; no elaborated type remains to audit. Mathematical truth was checked separately through the tables and sources.
- Declared future supplier contracts are not implemented proofs. Four gaps and the nonredundant compact portion of the fifth remain conditions of acceptance; their eventual proofs were not verified.
- The imported suppliers' entire proof programs and their further references were not re-reviewed. In particular, the original Howard, Greenberg, Gross–Zagier, Friedberg–Hoffstein and counting-theory papers are not new sources cited by this package; the specified supplier targets, together with the supplied CGLS/BKLOS/PS texts, were the checked interfaces. The dependency closure was checked mechanically, not every theorem in those other roadmaps.
- Ownership against additional open pull requests beyond the furnished checkouts and the available indexed roadmap search was not checked. No unlisted checkout was sought. The report identifies the indexed heads used for earlier suppliers.
- The full analytic percentages in CGLS Remark5.2.4 and the unrestricted analytic positive-proportion assertion in Corollary5.2.3 are not disproved here; the verified counterexamples concern the stated use of the good-reduction converse. Neither unrestricted assertion is an endpoint of this package.

## Source issues

- **Gap** in CGLS at Corollary 5.2.3 proof, printed page 575: the source says character twisting suffices to apply the good-reduction converse to every rational three-isogeny family; it should be noted that y²+xy+3y=x³ has twist-invariant v₃(j)=−3, so another argument is required; affects the proof.
- **Gap** in CGLS at Remark 5.2.4, printed page 575: the source says its converse transfers the unrestricted nineteen-a3 Selmer statistics to the stated analytic percentages; it should restrict this conversion to d≡2 mod3, of density3/8, which cannot alone yield41.6%; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "de6e42688a6ed0d772f84357c62332d3cdabe7e8", "job": "RT-RankZeroOneBSDPartII~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
