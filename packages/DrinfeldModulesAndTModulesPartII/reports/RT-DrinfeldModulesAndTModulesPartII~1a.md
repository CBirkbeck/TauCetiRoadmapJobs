<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1436#issuecomment-6400768897 -->
Red team round 1 pass a (codex) of 9500295

Verdict: needs_changes

1. **F01** (P1) The descent proof consumes an unowned expansion theorem

   **Location:** `packages/DrinfeldModulesAndTModulesPartII/README.md:970`, “(b) follows by Chang Theorem 5.5.2”.

   **Claim:** The proof uses the expression of a general MZV as a finite linear combination of CMPL values at integral points. No target or supplier contract supplies that expression. §3.5 supplies the deformation specialisation, which is a different assertion.

   **Witness:** CHANG14 lines 919–930 state the coefficient-point expansion. At q=3, H₄=2t³−t−θ³, so it involves Li₄ at coefficients of H₄; §2.8 only compares spans of values at degree characters.

   **Exact repair text:** Replace the sentence starting “(b) follows by Chang Theorem 5.5.2” with: “For MZVs, (b) follows directly from their MZ property in §3.8, the descent theorem above, and the homogeneous multiplication in §1.7. For CMPL values at algebraic points, define the weight-w space to be the span of weight-w monomials; §3.7 gives their MZ property and the same descent theorem applies.” Add §1.7 to the Needs line and Layer 1 to the Layer 3 dependency summary. This removes the unowned expansion without weakening the statement.

   **Retest:** At q=3, ζ_A(4) already has the §3.8 witness with Q=H₄ and c=Γ₄=D₁; descent applies directly. No coefficient-point expansion is needed.

2. **F02** (P3) The q=2 family Check omits its weight restriction

   **Location:** `packages/DrinfeldModulesAndTModulesPartII/README.md:784`, “for q = 2 the two sets differ”.

   **Claim:** AS_w and AT_w differ when q=2, without a weight restriction, immediately after saying they agree for w≤q.

   **Witness:** At q=2,w=1 both sets consist of the unique trivial-character array on (1). At w=2 both consist of the array on (1,1). Thus their symmetric differences have cardinality zero.

   **Exact repair text:** “For w≤q, AS_w=AT_w and the statement is the weak Brown theorem. At q=2,w=3, AS₃ has indices (3),(1,1,1), while AT₃ has (2,1),(1,1,1); both have cardinality d(3)=2.”

   **Retest:** At q=2,w=1 the repaired first sentence gives equality of the singleton sets; at w=3 the displayed sets differ and both counts are 2.

3. **F03** (P3) An internal citation retains a nonexistent section label

   **Location:** `packages/DrinfeldModulesAndTModulesPartII/README.md:594`, “In the formal setting of MZ.1”.

   **Claim:** MZ.1 identifies the formal index space and its realisations used to define binary relations.

   **Witness:** MZ.1 occurs only at line 594; there is no such heading. H is defined at §1.3, line 481, and its realisation maps at §1.4, line 506.

   **Exact repair text:** Replace “In the formal setting of MZ.1” with “In the formal setting of §§1.3–1.4”.

   **Retest:** The replacement resolves both H and 𝔏_d. For the weight-zero pair ([∅],−[∅]), those maps give residuals −1 at d=−1 and 1 at d=0, exactly the negative control in §2.1.

## Verified sound

Read all 1,418 README lines and all 400 Suggested.lean lines: **68 numbered targets, 36 declarations (16 definitions and 20 theorems)**. Compared all 36 supplied elaborated signatures with their explicit binders and README statements; no section hypothesis was lost. No Lean command was run. The computations below are independent arithmetic checks, not claims to have proved the deep theorems.

The adversarial table has one row for each target. All targets inherit finite-field conventions: q≥2, characteristic p, nonzero field, θ transcendental. Thus q=1, the zero ring, arbitrary DVR coefficients, nonreduced bases, nonabelian groups and topological spaces with missing separation axioms are not admitted inputs. The genuine boundary inputs here are empty compositions, weight zero, characteristic two, nonprime q, zero polynomials, zero coefficients, empty relation supports, nonperfect K, convergence-domain boundaries, scalar towers and endpoint weights. These are tested below. Write D₁=θ^q−θ; use −∞ for degree zero. A computed compatible instance is not a proof of a universal assertion.

### README target table

Locations in this table are in `packages/DrinfeldModulesAndTModulesPartII/README.md`.

| Target and line | Instances | Computed sides or controls | Result/change |
|---|---|---|---|
| 0.1 Indices, arrays and their orders (line 117) | q=3, s=(1,3), t=(2,1,1); empty and collapse index 3 | Prefix sums (1,4,4) versus (2,3,4) cross; T₃(1,2)=(3); T₁(∅)=∅. At s=(3), admissibility=false; at (3,1), true. | No counterexample. |
| 0.2 Power sums of both realisations (line 147) | q=2,3,4; d=−1,0,1; empty and depth two | S₁(1)=1/(θ²+θ), −1/(θ³−θ), 1/(θ⁴−θ), respectively; S₀(1,1)=0; S₀(1)S_<0(∅)=1·1=1; S_<−1(∅)=1. | Signs, degree characters and empty cutoff agree. |
| 0.3 Thakur multiple zeta values (line 179) | q=2; ∅,(1),(1,1) | Empty monic tuple contributes empty product 1; ζ(1) starts 1; ζ(1,1) starts θ⁻². Squaring gives ζ(1)²=Σa⁻²=ζ(2). | No rank-zero or s₁=1 convergence defect. |
| 0.4 Harada’s alternating multiple zeta values (line 206) | q=2 and q=3, ε=−1, s=(1) | q=2 has one character. At q=3 the difference is −2Σodd ℓ_d⁻¹ with first degree −3, versus zero for the trivial twist. | Character convention discriminates the two series. |
| 0.5 Thakur’s nonvanishing theorem (line 230) | q=2, s=(1,1); ∅ | Minimal tuple (1,0) contributes (θ²+θ)⁻¹ of degree −2; every other tuple has smaller degree. Empty value=1≠0. | Nonvanishing matches the declared degree gap. |
| 0.6 Carlitz multiple polylogarithms (line 246) | q=3, s=(2,2), z=(1,θ⁴); z₂=0; s=(4) | Normalized exponent at d₁=d₂+1 is −8·3^d₂→−∞, while tail exponent=3^d₂→∞. Zero coordinate gives 0. Li(4)−ζ(4) starts θ⁻⁶. | Full domain is larger than the polydisc; no unrestricted equality with ζ. |
| 0.7 Nonvanishing of Carlitz polylogarithm values (line 277) | q=2, s=(1,1), u=(1,1); u₂=0 | First term is ℓ₁⁻¹, degree −2; later terms smaller. At u₂=0 all terms=0, excluded by nonzero-coordinate hypothesis. | Hypothesis is necessary. |
| 0.8 Carlitz’s identity: MZVs equal CMPL values on Thakur’s range (line 289) | q=3, s=(1,2) and (4); d=0,1 | For (1,2), factors are ℓ_d⁻¹ and ℓ_e⁻² on both sides; for (4), S₁(4) starts 2θ⁻⁶, but ℓ₁⁻⁴ starts θ⁻¹². | Entry bound separates equality from failure. |
| 0.9 Weight-graded spans of zeta and polylogarithm values (line 301) | w=0,1,3; q=2,3 | Weight zero spans {1}, dimension 1; ordinary weight one has one nonzero generator. Weight three has 4 indices. At q=3, v∞(ρζ(1))=−1/2, outside K∞. | Base field and algebraic-closure spans differ as claimed. |
| 0.10 Thakur, small-entry and Hoffman-type index families (line 328) | q=2,w=3; q=3,w=4; q=4 entry 2 | IND₃={(3),(111)}, Thakur₃={(21),(111)}, with ι(3)=(21). Both weight-four families at q=3 have 6 indices. At q=4, 4 does not divide 2, although 2 divides 2. | q, not characteristic p, is used. |
| 0.11 The counting sequences d(w), s(w), t(w) and c(w) (line 357) | q=2,3; w=0 through 5 | q=2 d=1,1,1,2,3,5. q=3 d=1,1,2,3,6,11; s=1,2,6,16,46,130; t(4)=48 versus s(4)=46. | Recurrences and initial exceptions agree. |
| 0.12 Counting Thakur and Hoffman index sets (line 384) | q=2,3,4,5; 0≤w≤3q−2 | Direct enumeration gives equal Thakur and IND counts throughout; at q=3,w=4 both=6, weighted AS=46 and AT=48; empty counts=1. | Combinatorial counts verified, not inferred from basis theorem. |
| 0.13 Carlitz’s evaluation of ζ_A(q − 1) (line 396) | q=3; q=2 | Coefficient of z^(q−1) in z/e_C(z) is −D₁⁻¹; hence ζ(q−1)/π̃^(q−1)=−D₁⁻¹. At q=2 the sign is +. | Normalization agrees with ℓ₁=−D₁. |
| 0.14 Eulerian values (line 408) | q=3, s=(2), s=(1) | ζ(2)/π̃²=−1/D₁∈K; v∞(ζ(1)/π̃)=3/2, so it is outside K∞ and outside K. | Eulerian criterion distinguishes the cases; algebraicity descent requires §3.9. |
| 1.1 Chen’s correction coefficients (line 443) | q=2,(a,b)=(1,2); q=3,(2,2) | Δ₁=1, Δ₂=0 in F₂; for q=3 only Δ₂=−2=1 survives. If a+b≤q all correction coefficients vanish. | Computed binomial coefficients and characteristic signs. |
| 1.2 Chen’s equal-degree product formula (line 466) | q=2,3; d=0,1; 1≤a,b≤6 | 144 exact rational-function comparisons give residual 0. At d=0 both product and diagonal=1, depth-two correction=0. | Equal-degree identity verified in these cases. |
| 1.3 The index space and the q-shuffle product (line 479) | q=2; singleton products; empty and zero | [1]*ζ[2]=[12]+[3], whereas harmonic gives [12]+[21]+[3]. Empty product acts as unit; (2)⊞[11]=[31], and P⊞0=0. | Bilinearity and correction are not confused with concatenation/addition. |
| 1.4 The realisation maps (line 504) | d=0; q=3,s=(4); empty cutoff | L₀(1)L_<0(∅)=1; L₀(1,1)=0; L_<0(∅)=1. Li realization minus ζ realization at (4) starts θ⁻⁶. | Maps have the stated different values despite equal spans. |
| 1.5 The realisations are algebra homomorphisms (line 529) | q=2,3; P=Q=[1]; empty unit | ζ(1)² realizes 2[11]+[2]; in F₂ this is ζ(2). For empty P, truncated value 1 multiplies the other value unchanged, even at d=0. | Special-value identity sound. General-point monomial grading requires no additional product formula. |
| 1.6 Controlled product expansions of power sums (line 541) | q=2; a=(1), b=(2), d=0,1 | Equal degree yields S_d(3)+S_d(2,1); both have weight 3 and depths 1 or 2. At d=0 values are 1=1+0. Mixed S₀(1)S_<0(2)=0. | Support, coefficient and depth bounds agree. |
| 1.7 The algebras of zeta and polylogarithm values (line 553) | q=2; weights 0,1,2 | 1·ζ(1)=ζ(1); ζ(1)²=ζ(2)∈Z₂, weight 1+1=2. Character products at q=3: (−1)(−1)=1. | Homogeneous multiplication is consistent. |
| 1.8 Period powers lie in the weight spaces (line 568) | q=3, m=0,1,2 | π̃⁰=1∈Z₀; π̃²=−D₁ζ(2); π̃⁴=D₁²ζ(2)²∈Z₄. | No missing zero-weight scalar case. |
| 2.1 Binary relations between power sums (line 592) | d=−1,0; q=2; R₁ | S_−1(q)+D₁S₀(1,q−1)=0+0=0; at d=0, 1+D₁/ℓ₁=0. Empty test pairs remain governed by the separate convention. | Shifted relation, not same-degree equality. |
| 2.2 Thakur’s fundamental relation R_1 (line 617) | q=2,3; d=0,1 | Four exact comparisons S_d(q)+D₁S_(d+1)(1,q−1) return 0. At d=0 both summands are 1 and −1. | Sign ℓ₁=−D₁ essential. |
| 2.3 Todd’s operators B*, C and the cancellation operator BC (line 629) | q=2, d=0, R₁; B*, C, BC | For the displayed BC control, B*=0, C=D₁⁻³ and the scaled difference is D₁⁻². Replacing the shift by the same degree changes the zero contribution. | Checks agree with the operator formulas. |
| 2.4 The controlled form of C_W(R_1) (line 656) | q=2, W=(1), weight 3 | The reduction has ζ(3)+D₁ζ(1,2)=0; at d=0 its shifted terms sum 1+D₁·D₁⁻¹=0 in F₂. | Leading bad index and coefficient 1 retained. |
| 2.5 The reduction step for a bad index (line 668) | q=2, bad s=(3) | Reduction ζ(3)=D₁ζ(1,2), first entry 3→1 and depth 1→2. q=2,(2) reduces to (1,1). | Well-founded measure improves. |
| 2.6 Reduction to k-admissible indices (line 680) | q=2, s=(3), k=1 then k=3 | First reduction support (1,2) is 1-admissible, not 3-admissible. Next support (111),(21) is 3-admissible; both have weight 3. | Quantifier k matters; no direct one-step all-k claim. |
| 2.7 Brown’s theorem in positive characteristic (line 692) | q=2,w=0,2,3 | Empty span K=K; ζ(2)=D₁ζ(11). Weight-three Thakur support has 2 elements (111),(21), versus 4 total indices. | Spanning reduction matches ordinary and trivial-character alternating cases. |
| 2.8 The bridge between zeta values and polylogarithm values (line 709) | q=3,w=4; q=2,w=0 | Common six-element Thakur spanning family has identical Li and ζ values; Li(4) and ζ(4) nevertheless differ by a series starting θ⁻⁶. Empty spans both K. | Equality of spaces does not assert pointwise equality. |
| 2.9 The Thakur decomposition and the rewriting operator U^• (line 723) | q=2; ∅,(2),(3) | U(∅)=∅; U(2)=D₁[11]; Uζ(3)=D₁[12]. A good index (21) is fixed. | Fixed and moved supports distinguish the operator. |
| 2.10 The rewriting theorem (line 748) | q=2,s=(3) | Uζ²(3)=D₁²([111]+[21]); both output indices are good. Realization of [3]−D₁[12] is 0. | Termination and realization invariance agree on this two-step test. |
| 2.11 The Hoffman-type generating set (line 760) | q=2,w=3; q=3,w=4 | IND counts 2 and 6 equal Thakur counts; the contraction replacing (3,1) by (4) has leading coefficient −1 modulo D₁ at q=3, hence determinant residue is nonzero. | No equality of the two index sets is used. |
| 2.12 The strong Brown theorem for alternating polylogarithms (line 772) | q=2,w=1,2,3; q=3,w=4 | AS=AT singleton sets at weights 1 and 2; at weight 3 sets differ but both count 2. At q=3,w=4, counts AS=46<48=AT. | R02 qualifies the false unqualified Check. |
| 2.13 The next-weight relation ζ_A(2q − 1) + D_1 ζ_A(1, 2q − 2) = 0 (line 788) | q=2,3; d=0,1; q=3,w=5 | Four exact shifted comparisons give S_d(2q−1)+D₁S_(d+1)(1,2q−2)=0. At q=3, both (5),(1,4) are IND; coefficients 1,D₁ are nonzero. | Explicit negative control for extending §5.3. |
| 3.1 Anderson–Thakur polynomials and Carlitz factorials (line 812) | q=3; n=1,3,4 | H₁=H₃=1, Γ₁=Γ₃=1; H₄=2t³−t−θ³ and Γ₄=θ³−θ. Degree in θ is 3≤9/2<6. | Index shift and strict norm bound agree. |
| 3.2 Anderson–Thakur interpolation of power sums (line 837) | q=3,s=2; d=0,1; character −1 | At d=0 both sides π̃⁻². At d=1 both ℓ₁⁻²π̃⁻²; γ³=−γ supplies the character −1. | Interpolation agrees with the small-exponent supplier; general statement matched to CHANG14/AT09. |
| 3.3 Chang’s deformation series (line 849) | q=3,s=(2,2),Q=(1,θ⁴); ∅ | Whole tuple exponent≤−8·3^d₂; tail exponent=3^d₂. Empty series=1, 𝕃₁(θ)=θ−θ³. Twist of t+θ is t+θ³, not t³+θ³. | Domain and twist distinguished. |
| 3.4 Entireness of Chang’s series (line 875) | q=2,s=(1),Q=1; q=3,Q=(1,0) | Specializations at θ,θ² are −D₁⁻¹,D₁⁻². Zero factor makes full series 0; it gives no bound on an arbitrary earlier coordinate. | Entireness route uses the stated nonzero condition for prefixes. |
| 3.5 Specialisations of Chang’s series (line 889) | q=2,j=1; q=3,s=(2,2),Q=(1,t+θ⁴) | (−D₁⁻¹)²=D₁⁻². Second example has whole exponent≤−8·3^d₂ but tail norm 3^(3^d). Q₂=0 gives 0=0. | Whole-tuple specialization does not require convergent tails. |
| 3.6 The dual t-motives attached to an index (line 904) | depth 0,1,2; s=(2,1) | Depth zero Φ=(1), determinant 1. Depth one second row is Q⁻¹twist(t−θ)Ω+𝔏. For (2,1), determinant exponent=3+1=4. | Lower-triangular orientation agrees with first-column equation. |
| 3.7 Chang’s MZ property (line 929) | q=3; Z=ζ(2), Z²,0 | Weights 2 and 4 arise from first entries Ω² and Ω⁴; last values are Z/π̃² and Z²/π̃⁴. Zero is excluded. Scaling by a∈K× changes c to c/a. | Product and scalar witnesses preserve the specified weight. |
| 3.8 Zeta and polylogarithm values have the MZ property (line 952) | q=3; trivial character and ε=−1 | Γ₂=1 gives witness for ζ(2). For γ²=−1, γ∉K, so the unnormalized character value cannot use c=γ∈K×; the normalized value γLi has c=1. | The roadmap keeps the required normalization. |
| 3.9 Chang’s descent theorem and the graded algebra of values (line 964) | q=3; weights 0,1,2; normalized ζ(2) | Index counts are 1,1,2; four proposed independent values. Normalized ζ(2)/π̃²=−1/D₁ instead spans the scalar line: intersection dimension 1, not 0. | Correct unnormalized headline; proof-route repair R01. |
| 3.10 The merged prefix system of a putative relation (line 981) | n=0; pair indices (1,2),(3) | Empty collection still has I={∅}, v=f=0, Φ=diag((t−θ)^w,1), augmented vector (1,Ω^w,0). For the pair, I={∅,(1)} has 2 entries. | Root is not accidentally removed by an empty union. |
| 3.11 The ABP independence criterion for zeta-type periods (line 1008) | q=2; ζ(2)+D₁ζ(11)=0; empty relation | The suffix coordinate is D₁Li(1)/π̃=1∈K. With all coefficients zero, gauge row f=0 and residual 0. | The nontrivial suffix conclusion needs the stated lower-weight independence. |
| 3.12 The Eulerian suffix constraint (line 1022) | q=3,w=1,2; q=2 fundamental relation | w=1 has period valuation −3/2, impossible for a nonzero K∞ multiple in the asserted situation. w=2 gives ζ(2)/π̃²=−D₁⁻¹; q=2 suffix coordinate=1. | Divisibility obstruction applies only to nonzero suffix combinations. |
| 4.1 The Frobenius difference systems (E_M) and their solution spaces (line 1046) | w=0; q=3,w=2,3 | Weight-zero root f=1 and f=t have residual 0; f=θ has residual θ³−θ≠0. IND°₃={(1,2)} has 3 prefixes; (1,1) is not reduced at w=2. | Correct scalar field F(t), and no artificial zero coordinates in the tree. |
| 4.2 Monic Frobenius descent (line 1074) | B=F₂, positive-degree test versus F=G=1 | For δ=0,G=0 both sides 0. For degree-zero F=G=1 and α²=α+1, both sides α+1 but α∉B; the positive-degree assumption excludes it. | Missing-degree counterexample is already excluded. |
| 4.3 The θ-degree bound for solutions (line 1088) | q=3,w=2; leaf and root generator | Root t³−θ has θ-degree 1=(w−0)/(q−1); leaf t−t³ has θ-degree 0=(w−w)/(q−1). Zero has degree −∞. | Degree bound attains equality; natDegree of zero is not used. |
| 4.4 The key lemma: relations give solutions of (E_M) (line 1100) | q=2,w=2, P=[2]+D₁[11]; zero P | The realized value is 0, hence Eulerian with scalar 0. Leaf data are 1,D₁(t); zero P gives zero leaf data and zero solution. | Zero combination must remain allowed; support reduction has the separate suffix-independence assumption. |
| 4.5 The dimension of the solution space X_w (line 1112) | w=0 and w=q−1; q=3,w=1 | X₀ consists of F(t) constants, dimension 1. At w=q−1, root t^q−θ, leaf t−t^q: both equation sides t^q−θ^q. At q=3,w=1, θ-degree bound<1 forces the root and leaf to zero. | Dimension 1 or 0 agrees with divisibility in tested cases. |
| 4.6 Solutions of the character-twisted system (line 1128) | q=3,w=2; γ=1 versus γ²=−1; w=0 | Root t³−θ³ and leaf t−t³ solve the untwisted inverse system: sides t³−θ⁹. With nontrivial γ the residual has factor (1−γ)(t−t³)(t−θ³)²≠0. At w=0 root 1 solves it, excluded by w>0. | Twist and positive-weight hypotheses discriminate solutions. |
| 4.7 Ngo Dac’s two-row system in weights q < w ≤ 2q − 2 (line 1144) | q=3,4,5,8,9; k=q−1 | δ₁=(t−θ)^(2q), a₁=t^q−t, δ₂=a₂=0: both polynomial residuals are exactly zero. Thus endpoint can force a₂=0 but cannot force all four entries zero. | README and Lean retain the strict inequality for total vanishing. |
| 5.1 Independence of small-entry multiple zeta values (line 1170) | q=2,w=0,2 | Small-entry families are {∅} and {(11)}; values are 1 and a series starting θ⁻², each a nonzero singleton, rank 1. | Nonzero singletons, not vacuous empty independence. |
| 5.2 Thakur’s basis through weight q (line 1186) | q=3,w=2,3 | At w=2 the two families coincide with {(2),(11)}, count 2; at w=3 they coincide with {(111),(12),(21)}, count 3=2²−1. | Exceptional initial dimension at w=q retained. |
| 5.3 Independence of q-indivisible MZVs through weight 2q − 2 (line 1198) | q=3,w=4 versus w=5 | IND₄ has 6 indices. At w=5, (5),(14) give coefficients (1,D₁)≠(0,0) with realized sum 0. | Upper bound 2q−2 essential and present. |
| 5.4 Thakur’s basis through weight 2q − 2 (line 1214) | q=2,w=2; q=3,w=4 | Thakur counts 1 and 6; q=2 first range ends at q=2, exactly the earlier small-entry range. | No q=2 two-row argument used. |
| 5.5 The CMPL basis indexed by IND_w (line 1226) | q=2,w=0,3; q=3,w=4 | Basis supports are {∅}, {(3),(111)}, and 6 IND₄ indices. At w=0 span={K·1}, dimension 1; Li(3), not ζ(3), is intended in the q=2 family. | CMPL carrier retained; no invalid switch to unrestricted IND MZVs. |
| 5.6 Thakur’s basis theorem and Todd’s dimension formula (line 1240) | q=2,w=0..5; q=3,w=5 | Counts are 1,1,1,2,3,5 and 11; at q=3, 11=6+3+2. Weight-zero K̄-span is its scalar line with basis 1. | Count side independently computed; nontrivial independence matched to source. |
| 5.7 All linear relations among multiple zeta values (line 1256) | q=2,w=1,2,3 | Kernel dimension candidates 1−1=0, 2−1=1, 4−2=2. Pivots at w=3 are [12] and [3]; displayed relations realize to 0 and have independent pivots. | No spurious weight-zero relation; mixed-weight decomposition uses §3.9. |
| 5.8 Character splitting of relations among ACMPL periods (line 1271) | q=3; roots 1,γ with γ²=−1; repeated characters excluded | X²+1 has values 1,2,2 on F₃, no root; coefficientwise Laurent comparison gives rank 2 over F₃((u)). Repeating ε=1 permits roots 1,−1 and relation 1+(−1)=0. | Injectivity and root equations are both necessary and present. |
| 5.9 Relations among normalised ACMPL periods (line 1285) | q=2,w=1; q=3,w=1,2 | At q=2, 1+D₁Li(1)/π̃=1−1=0. At q=3,w=1, 2 does not divide 1; at w=2, 1+D₁Li(2)/π̃²=0. | Constant-term relation occurs in the divisible weight only. |
| 5.10 The Hoffman-like basis of alternating polylogarithm values (line 1297) | q=3,w=0,1,4 | Array counts 1,2,46; w=1 roots give the two character values, while the weight-zero array gives 1. | Exact span AZ=AL is the bridge, not a new value identification. |
| 5.11 The dimension of alternating multiple zeta values (line 1313) | q=2,w=3; q=3,w=4 | q=2 one character gives ordinary and alternating count 2; q=3 strong count 46 differs from weak count 48. | Dimension sequence uses AS, not AT. |
| 5.12 The lower bound dim_K Z_w ≥ d(w) through CMPLs (line 1329) | q=3,w=4; q=2,w=0 | Trivial-character IND subset has 6 entries among 46 alternating arrays; empty subset has one nonzero value 1. | Subset independence gives the advertised ordinary lower bound. |
| 5.13 Direct bounds for alternating MZVs in small weights (line 1341) | q=2,w=4; q=3,w=4,5,6,7 | q=2 endpoint indices exactly (211),(121),(13), count 3. q=3 weighted counts 46,130,368,1040; s(7)=1042. (4,3),(2,5) admitted, (7),(2,2,3) excluded. | No endpoint cardinality overclaim; adjacency and character restrictions checked. |
| 5.14 An upper bound for v-adic multiple zeta values (line 1367) | q=3,w=2; q=2,w=1; w=0 | Bound is d₂−d₀=2−1=1; q=2 gives d₁−d₀=1−1=0. At w=0 negative-index d=0 gives 1−0=1, not natural-subtraction d₀. | Signed/negative-index convention is essential and explicit. |

### Suggested.lean declaration and binder table

Locations are in `packages/DrinfeldModulesAndTModulesPartII/Suggested.lean`. There are no section variables. The following abbreviations describe the **elaborated**, retained contexts, not inferred assumptions:

- B: F : Type u, Field F, Fintype F; q is Fintype.card F.
- V: B plus DecidableEq (RatFunc F), explicitly retained by the completion API.
- E_K: E : Type v, Field E; Algebra K E, Algebra K∞ E, Algebra K̄ E; IsScalarTower K K∞ E and IsScalarTower K K̄ E.
- E_F: E : Type v, Field E; Algebra F E, Algebra K E, Algebra K∞ E, Algebra F̄ E; towers F→K→E, K→K∞→E, F→F̄→E.

K=RatFunc F, K∞=RatFunc.CompletionAtInfty F; the two universe parameters are independent. Polynomial variables swap roles only in the explicitly documented descended system: there the polynomial variable is θ and RatFunc.X is t. In the twisted and two-row theorems the polynomial variable is t and θ is a coefficient. No arbitrary topology, unproved data, or free predicate supplies a mathematical construction.

| Declaration and line | README | Retained context | Computed instance / result |
|---|---|---|---|
| `multipleZeta` (31) | §0.3–0.4 | V; {w}, s, ε:Fin s.length→Fˣ | w=0: exactly one empty tuple, monicity and StrictAnti vacuous, product=1 and tsum=1. q=2,s=(11): leading degree −2, not zero. |
| `carlitzDenominator` (43) | §0.6 | B; d:ℕ | d=0 product=1; d=1 at q=3 is θ−θ³=−D₁; at q=4 it is θ−θ⁴, not θ−θ². |
| `multiplePolylog` (49) | §0.6 | V; {w}, s, ε | w=0 value=1; q=3,s=(1),ε=−1 has degree-one term −ℓ₁⁻¹ instead of ℓ₁⁻¹. q=3,s=(4) differs from ζ at θ⁻⁶. |
| `zetaSpace` (60) | §0.9 | V; w:ℕ | w=0 is span{1}, rank 1; w=1 is span{ζ(1)}, whose generator has leading coefficient 1. |
| `alternatingZetaSpace` (66) | §0.9 | V; w:ℕ | q=2 gives one character and exactly the ordinary span; q=3,w=1 has two generators, versus the ordinary single generator. |
| `polylogSpace` (72) | §0.9 | V; w:ℕ | w=0 span{1}; at q=3,w=4 it contains Li(4), whose difference from ζ(4) begins θ⁻⁶, while the spans agree by a later theorem. |
| `alternatingPolylogSpace` (78) | §0.9 | V; w:ℕ | w=0 span{1}; q=2 trivial characters give polylogSpace; q=3,w=4 AS offers 46 generators versus 48 AT generators. |
| `thakurIndices` (85) | §0.10 | q,w:ℕ, no instances | q=2,w=3 accepts (21),(111), rejects (3),(12). At w=0 default last entry 0 makes membership equivalent to 0<q; q=0 rejects it. |
| `indivisibleIndices` (89) | §0.10 | q,w:ℕ, no instances | q=4 accepts part 2 and rejects 4; q=0 accepts every positive part (0 does not divide it); q=1 rejects every nonempty index. Field headlines exclude q=0,1. |
| `smallEntryIndices` (93) | §0.10 | q,w:ℕ, no instances | q=2 admits only all-ones in positive weight; q=3 accepts (12), rejects (3). Empty composition satisfies the universal condition even at q=0. |
| `toddNumber` (98) | §0.11 | q,w:ℕ, no instances | q=2,w=0..4: 1,1,1,2,3. q=3,w=4: 6. At q=0,w=0 its subtype is empty and count=0, outside finite-field headline inputs. |
| `alternatingNumber` (103) | §0.11 | q,w:ℕ; local classical | q=3,w=4 gives 16+24+4+2=46. Empty term has exponent 0 and contributes 1, including q=0 because 0⁰=1; no headline admits q=0. |
| `multipleZeta_ne_zero` (110) | §0.5 | V; {w},s,ε | Empty value 1≠0. q=2,s=(11) leading coefficient 1 at θ⁻² cannot cancel against later terms. Characters are units, so ε=0 is not admitted. |
| `brown_spanning` (118) | §2.7 | V; w | w=0 both spans K·1; q=2,w=2 ζ(2)=D₁ζ(11), so the extra generator is in the one-generator left span. |
| `alternating_brown_spanning` (125) | §2.7 | V; w | q=2 reduces to preceding equality; q=3,w=4 left family has 48 arrays, consistent with a 46-dimensional span, not an independence assertion. |
| `value_space_bridges` (134) | §2.8 | V; w | w=0 both equalities are span{1}=span{1}; q=3,w=4 common Thakur values span both while Li(4)−ζ(4) begins θ⁻⁶. |
| `strong_brown_spanning` (140) | §2.12 | V; w | q=3,w=4 left array count=46; q=2,w=3 uses Li(3),Li(111), not the weak family's Li(21),Li(111). Empty spans equal. |
| `zeta_algebra_graded` (153) | §3.9 | V+E_K, no weight bound | q=3 weights 0,1,2 have 1+1+2 proposed generators; replacing ζ(2) by ζ(2)/π̃² makes scalar intersection one-dimensional, so the actual unnormalized carrier is essential. |
| `reducedPrefixes` (168) | §4.1 | q,w:ℕ, no instances | q=3,w=3 tree={∅,(1),(1,2)}; at w=0 tree={∅}. At q=3,w=2, (1,1) is outside the tree because 2 does not divide 1. |
| `frobeniusResidual` (175) | §4.1 | B; w; source=target list→F(t)[θ] | At w=0, root 1↦0, t↦0, θ↦θ^q−θ. An off-tree coordinate 1 maps to 1, forcing zero in the kernel; no junk exponent from an out-of-tree list is consumed. |
| `frobeniusSolutionSpace` (205) | §4.1 | B; w; F(t)-submodule | At w=0 constant root 1 lies in the kernel; root θ does not. Any off-tree nonzero coordinate prevents membership, so this is not an unrestricted function space of solutions. |
| `frobenius_solution_dimension` (211) | §4.5 | B; w; finite module AND finrank equality | w=0 dimension=1 and RHS=1 because q−1 divides 0. q=3,w=1 degree bound forces zero, RHS=0; at w=2 explicit root t³−θ gives a nonzero solution. |
| `twisted_system_rigidity` (222) | §4.6 | B; w>0, ε∈Fˣ, hε; ∀γ,δ, root equation and zero off tree | q=3,w=2,γ²=−1 changes the root residual by (1−γ)(t−t³)(t−θ³)²≠0. For γ=1 the nonzero solution is excluded by hε. w=0 root 1 is excluded by hw; q=2 hε is impossible. |
| `two_row_rigidity` (241) | §4.7 | B; q>2, 2≤k≤q−1; ∀δ₁,δ₂ over K̄[t], a₁,a₂ over F[t]; two equations | At k=q−1, δ₁=(t−θ)^(2q), a₁=t^q−t, δ₂=a₂=0 has two residuals 0 for q=3,4,5,8,9; existential endpoint parameter a=1. At k<q−1 zero data gives both sides 0. |
| `small_entry_independent` (262) | §5.1 | V; w | w=0 family={1}, rank1; q=2,w=2 family={ζ(11)}, rank1 because leading term θ⁻²≠0. No positivity binder disappears. |
| `q_indivisible_independent` (270) | §5.3 | V; q>2, w≤2q−2 | q=3,w=4 count=6; w=5 relation ζ(5)+D₁ζ(14)=0 with nonzero coefficients is excluded by 5≤4 being false. w=0 still {1}. |
| `cmpl_ind_basis` (278) | §5.5 | V; w | w=0 independence rank1 and both spans K·1. q=2,w=3 indices (3),(111), count2; this states Li values, so the MZV next-weight relation is not a counterexample. |
| `thakur_basis` (289) | §5.6 | V; w | q=2,w=2 family (11) has nonzero leading θ⁻² and spans ζ(2) via D₁; w=0 has one generator1. q=3,w=4 family count6. |
| `todd_dimension` (299) | §5.6 | V; w | At w=0 finrank span{1}=1=toddNumber(q,0). q=2,w=2 rank1=count1. q=3,w=5 combinatorial RHS=11=6+3+2. |
| `thakur_basis_algebraicClosure` (305) | §5.6 | V+E_K; w | w=0 image(1)=1 and both K̄-spans are the scalar line. q=3,w=4 retains the six unnormalized values; the two K embeddings agree by both explicit towers. |
| `character_roots_independent` (323) | §5.8 | V+E_F; n, injective ε:Fin n→Fˣ, γ:Fin n→F̄ with root equations | n=0 empty independent family, rank0. q=3,n=2 roots1,√−1 have rank2. Repeated ε=1 gives dependent roots1,−1, excluded by injectivity. Root equations force γ≠0. |
| `alternating_hoffman_basis` (340) | §5.10 | V; w | q=3,w=1 has2 arrays; w=4 has46. At w=0 one nonzero value1 and span AZ₀=K. Span target AZ, rather than AL, is justified by value_space_bridges. |
| `alternating_dimension` (351) | §5.11 | V; w | At w=0 rank1=1. At q=2,w=2 rank1=count1. q=3,w=4 RHS46, not weak-family count48. |
| `directIndices` (361) | §5.13 | q,w:ℕ, no instances | q=3,w=7 includes (43),(25), excludes (7),(223); q=2,w=4 exactly (211),(121),(13). Fin(length−1) is empty for length0 or1, so no nonexistent adjacent pair is introduced. |
| `direct_small_weight_spanning` (377) | §5.13 | V; w≤2q−1; arrays on Thakur family, character1 on q-parts | q=3,w=4 restricted count46 versus unrestricted48; weight0 span{1}=AZ₀. At q=2,w=3, character restriction is automatic and two Thakur values span. |
| `direct_small_weight_independent` (389) | §5.13 | V; w≤3q−2; direct family, character1 on q and 2q−1 parts | q=3,w=7 has1040 arrays versus full dimension1042; independence does not say basis. q=2,w=4 keeps three endpoint indices; at w=0 family{1} is independent. |

### Headlines, padding and policy

The README headlines represented in Lean are: ordinary/alternating nonvanishing; weak and strong Brown generation; the ordinary and alternating span comparisons; Chang's weight grading; the Frobenius solution dimension, twisted vanishing and two-row rigidity; small-entry and bounded IND independence; the IND CMPL basis; the Thakur bases over K and K̄; Todd's dimension; character-root independence; the alternating Hoffman basis and dimension; direct small-weight spanning and independence. These account for all 20 admitted theorems.

The module docstring identifies the unavailable headlines and their missing constructions: Anderson–Thakur interpolation, entire Frobenius specialization, full MZ-property descent, ABP independence, Eulerian suffixes, the rewriting description of every relation, period character splitting, normalized ACMPL period relations, and v-adic dimensions. Their full analytic/motivic carriers are not supplied by the pins. No statable headline was found absent, and no replacement predicate was found. The 16 real-body definitions feed the kept headlines. The one-library-lemma probe found no padding theorem: in particular the basis and dimension theorems express the substantive value independence, not just cardinalities of composition subtypes.

The file has one `import Mathlib`, the required namespace, documented definitions/theorems, no `lemma`, no `set_option`, no sorry'd data and no admitted examples. The displayed mathematical rewriting operators have generation and kernel theorems as their targets, not a computational implementation. All own backticked Lean declaration names were matched between the two files. Read-only git inspection confirmed head 9500295 and that the branch diff is confined to this package (seven files). No package file was changed by this pass; only this report and scratch notes were written.

### Computation and Check coverage

All **193 Check bullets in 69 blocks** were read, including the extra direct-family block; duplicate bullets were not counted as additional mathematical evidence. The 68-row target table records the boundary/control computations. The following ledger identifies **30 concrete README Check instances** that were recomputed, so the Check-test count is not merely a count of prose inspected. Additional source-based Checks and broader test families are covered by the target table, but are not added to this conservative numerical count.

| Check instance | Computed value |
|---|---|
| Conventions: q=3 Carlitz signs | ℓ₁+D₁=0; ℓ₁−D₁=2ℓ₁≠0 |
| Conventions: forward twist of t+θ | t+θ³, versus t³+θ³ for the cube |
| §0.1 collapse past depth | T₃(1,2)=(3) |
| §0.1 incomparable indices | Prefixes (1,4,4) and (2,3,4) cross |
| §0.2 q=4 first sum | S₁(1)=1/(θ⁴−θ), leading degree −4 |
| §0.2 empty cutoff | S₀(1)S_<0(∅)=1·1=1 |
| §0.3 empty value | 1 |
| §0.4 nontrivial q=3 twist | Difference has leading valuation 3 |
| §0.6 domain beyond polydisc | −3·3^(d₂+1)+3^d₂=−8·3^d₂ |
| §0.6 Li versus ζ at exponent 4 | Difference starts θ⁻⁶ |
| §0.9 coefficient-field control | v∞(ρζ(1))=−1/2 at q=3 |
| §0.10 q versus p | 4 does not divide 2; 2 divides 2 |
| §0.12 family counts | 6,6,46,48 at q=3,w=4 |
| §1.1 q=2 correction | Δ₁=1, Δ₂=0 for (1,2) |
| §1.1 q=3 correction | Δ₂(2,2)=−2=1 |
| §1.3 q-shuffle | [1]*ζ[2]=[12]+[3] at q=2 |
| §1.3 box-plus | (2)⊞[11]=[31] |
| §2.1 summed relation versus binary relation | ([∅],−[∅]) has values −1,1 at d=−1,0 |
| §2.1 missing D₁ control | At d=0 the wrong relation is 1+D₁⁻¹≠0 |
| §2.9 decomposition | (q−1,q,q,q+1,1) gives m=2 and s″=(1,1) |
| §2.10 two-step rewrite | D₁²([111]+[21]) at q=2 |
| §2.12 q=2 set comparison | Equal at weights 1,2; different at weight 3: R02 |
| §3.1 polynomial | H₄=2t³−t−θ³ at q=3 |
| §3.5 Frobenius specialization | (−D₁⁻¹)²=D₁⁻² at q=2 |
| §3.6 determinant | Exponent 3+1=4 for (2,1) |
| §3.10 empty support | I={∅}, f=v=0, augmented vector (1,Ω^w,0) |
| §4.1 scalar test | residual(1)=residual(t)=0; residual(θ)=θ^q−θ |
| §4.2 degree-zero counterexample | α²=α+1 over F₄, with α outside F₂ |
| §4.7 nonzero endpoint | Both residuals 0 with a₁=t³−t at q=3 |
| §5.13 endpoint family | q=3,w=7: 37 indices,1040 arrays, versus s(7)=1042 |

Exact scratch arithmetic also checked 144 equal-degree Chen identities (q=2,3; d=0,1; 1≤a,b≤6), eight shifted fundamental/next-weight identities, composition counts for q=2,3,4,5 through weight 3q−2, and five endpoint polynomial identities at q=3,4,5,8,9. Every tested identity had residual zero. These finite tests support the table; they do not establish linear independence in all weights.

### Source locator audit

All 19 manifest source texts were accessed legally from the supplied cache. **75 locator entries** were checked at statement level, counting separately the named lemmas/propositions listed in the table and counting a displayed equation range once. Proof steps were inspected where the roadmap relies on them, especially the domain/prefix argument, corrected product induction, descent, coefficient comparison and endpoint exclusions. This is not certification of every step of every paper. Version-sensitive numbering is the preprint numbering declared in the README.

| Source | Count | Locators | Text witnesses | Result |
|---|---:|---|---|---|
| ND21 | 9 | Theorems A, B, D and Corollary C; Definition 2.3; Proposition 3.2; Lemma 6.1; Theorem 6.2; equations (6.3)–(6.5) | ND21 lines 159, 167, 174, 180, 392, 860, 1345, 1357, 1379 | Generation, index restrictions and small-weight hypotheses agree. The endpoint admits the Eulerian line, as the package now says. |
| CCM23 | 15 | Theorem 1.2.4; Corollary 1.2.7; Definition 2.2.2; (2.3.2); Proposition 2.3.5; Definition 3.1.1; Theorem 3.2.4; Corollary 3.2.5; Theorem 3.2.6; Lemmas 4.2.2–4.2.3; Theorem 4.3.5; Lemma 5.1.1; Theorem 5.2.1; Theorem 5.4.2 | CCM23 lines 132, 156, 332, 410, 440, 502, 539, 563, 571, 666, 719, 776, 1182, 1373, 1409 | Preprint numbering used. Count includes the two descent lemmas separately. Empty cutoff is deliberately corrected in the package; source mistakes are listed below. |
| IKLNDP24 | 11 | Theorems 1.11 and 2.4; Lemmas 3.1–3.3; Theorems 3.4 and 3.6; Propositions 4.10–4.11; Remark 4.12; Proposition 4.13 | IKLNDP24 lines 3334, 3666, 3942, 3958, 3999, 4049, 4070, 6489, 6517, 6729, 6733 | Distinct characters, nonzero collected relation, positive weight, direct-weight ranges and constant term are retained. Count includes each lemma/proposition separately. |
| IKLNDP-NOTE | 5 | Definition of I′_w; Propositions 1.3–1.4; Theorems 1.5–1.6 | IKLNDP-NOTE lines 191, 262–310 | Endpoint family and q=2 exception agree. The independence endpoint does not assert the cardinality equality. |
| CHANG14 | 15 | Definitions 5.1.1 and 5.1.3; Remark 5.1.5; Definition 3.4.1; Proposition 3.4.4; Theorem 3.4.5; Proposition 4.3.1; Lemmas 5.3.1 and 5.3.5; Proposition 5.4.1; Theorem 5.4.3; Theorems 5.5.1–5.5.2; Corollary 5.5.5; (5.2.1) | CHANG14 lines 343, 376, 392, 576, 614–700, 704, 793, 848, 885, 911, 919, 963 | Nonzero values and algebraic points are retained. Monomial formulation at lines 880–898 clears the suspected need for an additional general-point product theorem; R01 is the separate unowned expansion input. |
| CPY19 | 3 | Proposition 2.2.1; (2.3.1); Proposition 2.3.3 | CPY19 lines 245, 275, 325 | Constant denominator is in F_q[t]; whole-tuple decay is weaker than all-tail convergence. Package does not repeat the polynomial/rational matrix typo. |
| THAKUR09R | 1 | Theorem 5 | THAKUR09R line 289 | Fundamental relation has the coefficient θ^q−θ, consistent with the signed ℓ₁. |
| THAKUR10 | 1 | Theorem 3 | THAKUR10 line 230 | Product existence and weight/depth constraints agree; the proof must use the correction below. |
| THAKUR09P | 1 | Theorem 4 and proof | THAKUR09P lines 455–465 | Positive reciprocal exponents and general prime powers retained; the general degree input is an explicit supplier gap. |
| CH21 | 1 | Proposition 2.12 | CH21 lines 629–633 | Anderson–Thakur interpolation normalization matches Γ_s and the shifted H-index. |
| LRT14 | 1 | Theorem 3.1(2) | LRT14 lines 147–149 | Its n=0 case is the required next-weight relation; no extension of IND independence past 2q−2 follows. |
| PAP08 | 3 | §2.2 fixed rational field; Lemma 3.3.2; §4.1.6 | PAP08 lines 346, 564, 1033 | Inverse twist fixes F_q(t); two fundamental matrices differ on the right by a constant matrix. |
| ABP04 | 3 | Theorem 3.1.1; §3.1.2; Proposition 3.1.3 | ABP04 lines 346, 367, 409 | Polynomial lifting, Ω normalization and entire-from-equation hypotheses match the declared contracts. |
| THAKUR-UPDATES | 1 | Entry 36 | THAKUR-UPDATES lines 308–355 | The correction proves the mixed product first, then equal leading degree. The README follows that order. |
| CM21 | 1 | Theorem 1.2.2 | CM21 line 149 | Weightwise K-linear specialization, not by itself an algebra homomorphism. |
| AT09 | 1 | §2.4.1 | AT09 lines 200–203 | Interpolation formula verified; the adjacent generating function is at §2.4.2, lines 204–222. |
| SHEATS98 | 2 | Theorem 1.4; §2 inequalities (2.7)–(2.8) | SHEATS98 lines 177–180, 258–268 | Degree/greedy weight statements and the inequality used by the general-q route are present; OCR symbols are not treated as source errors. |
| CCM-ALG | 1 | Theorem 1.2.3 | CCM-ALG line 176 | Multiplicative finite-place specialization and its kernel ideal support the stronger contract, beyond CM21. |
| AT90 | 0 | §§3.6–3.7, (3.6.4), (3.7.1), (3.7.3)–(3.7.4) | AT90 lines 738–761 | The section and surrounding derivation are present, but these displayed formulas are missing from the extraction. Direct formula certification is excluded from the count. |

### Supplier, ownership and pin checks

**Four extant roadmap citation groups** were resolved against the instructed copies, rather than remembered names: RestrictedPowerSeries on main; PeriodsAndSpecialValues at its supplied head; FunctionFieldArithmetic at its supplied head; GlobalShtukasAndFunctionFieldLanglands at its supplied head. The latter two are ownership boundaries, not sources of a Carlitz MZV theorem. The parent contracts are covered by the declared-gap exception below.

| Owner / location | Verified contract or boundary |
|---|---|
| `TauCetiRoadmap/RestrictedPowerSeries/README.md:193`, 247, 306, 723 | §§0.1–0.3, 1.1–1.2, 2.1 and 7.2 cover restricted series, evaluation and entire series. Evaluating at θ of norm q>1 needs entire-ness, not merely radius-one restriction. |
| `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:1990` | PS.9.1–PS.9.4 concern classical real MZVs; PS.9.2 supplies the rational word/stuffle object. Its integral, arbitrary-coefficient extension is explicitly a gap, not already supplied at that head. |
| `TauCetiRoadmap/FunctionFieldArithmetic/README.md:1693` | Layer 5 is divisor zeta/L-polynomial theory; Layers 0–4 give the field, curve and class-field infrastructure. No same-object special-value basis target was found. |
| `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:163` | Layers 0–3 concern bundle, Satake, shtuka and Langlands constructions, not the special-value series or their basis families. |

Object searches used the roadmap index tool and local README/Lean searches across main, Completed, board packages and the supplied revision checkouts. Search terms included Carlitz, multizeta/multiple zeta, Thakur basis, MZ property, Frobenius difference systems and stuffle/quasi-shuffle. There was no competing owner of these multiple-depth special-value constructions and no second declaration of the package's fully qualified Lean names. Generic compositions, scalar fields, restricted series and the harmonic product are already attributed to their owners. No target needed relocation to break an upward dependency.

The **14 gap slugs** were compared between `packages/DrinfeldModulesAndTModulesPartII/design/plan.json` and its README. All have named suppliers and matching declarations; none has supplier `none`. Their related laws specify the required interface for the same construction rather than an unrelated extra theorem. No gap was found to request a result already provided by a pin or earlier owner.

| Gap slug | Supplier | Boundary/minimality witness |
|---|---|---|
| general-power-sum-degree | DrinfeldModulesAndTModules DM.6 | Small exponent identities alone do not give S_d(k) for arbitrary positive k; q=3,k=4 differs already at d=1. |
| anderson-thakur-generating-series | DrinfeldModulesAndTModules DM.6 | Exact formal power-sum identity feeds §3.2; d=0 gives (1−x)⁻¹ on both sides. |
| v-adic-mzv-specialisation | DrinfeldModulesAndTModules DM.6 | Requires a finite-place realization and multiplicative specialization, neither defined by the infinity completion. |
| parent-carlitz-products | DrinfeldModulesAndTModules DM.0 | Nonvanishing and general norm/recursion laws exceed the finite product definition used for the Lean headline. |
| parent-period-analytic-field | DrinfeldModulesAndTModules DM.2 | C∞, the Carlitz exponential/logarithm and its kernel are not the native RatFunc infinity completion. |
| parent-carlitz-omega | DrinfeldModulesAndTModules DM.2 | Arithmetic Ω and its period normalization are not generic restricted-series facts. |
| parent-effective-dual-motives | DrinfeldModulesAndTModules DM.4 | Finite free inverse-twist objects need the stated broad effective category; finite generation over K̄[σ] is not imposed. |
| parent-twisted-analytic-rings | DrinfeldModulesAndTModules DM.8 | The finite-extension arithmetic condition and fixed rings are additional to generic entire-series interfaces. |
| parent-abp-interface | DrinfeldModulesAndTModules DM.8 | Polynomial lifting of a specialized relation is not provided by a native matrix type. |
| abp-entire-from-equation | DrinfeldModulesAndTModules DM.8 | det Φ(0)≠0 is the specific hypothesis, distinguished from the stronger ABP determinant shape. |
| frobenius-constant-denominator | DrinfeldModulesAndTModules DM.8 | U=1/t solves Φ₁=Φ₂=1, with denominator t; U=1/(t−θ) does not satisfy the same equation. |
| frobenius-fundamental-matrix | DrinfeldModulesAndTModules DM.8 | The comparison Ψ′=ΨC uses the fixed field F_q(t) and right multiplication; rank-zero determinant is 1. |
| parent-small-power-sums | DrinfeldModulesAndTModules DM.6 | Exact exponent interval 1≤n≤q; at q=3,n=4 the equality fails. |
| integral-positive-index-stuffle | PeriodsAndSpecialValues PS.9.2 | Existing supplier works over ℚ; reducing integer multiplicities is required to obtain coefficient 2=0 in characteristic two. |

The parent is not available as an implemented supplier in the inspected content. Its absence is **not** a finding: these are exactly the contracts the brief authorizes as declared gaps. Acceptance remains conditional on their fulfillment.

Pinned checks used the manifest-selected files, not current online Mathlib. Relevant native declarations and their limits:

| Pin file | Declarations / observations |
|---|---|
| `Mathlib/Combinatorics/Enumerative/Composition.lean:101` | Composition is a positive block list of prescribed sum; blocksFun at 155, sum law at 162, sizeUpTo at 217 and composition_card at 1033. Weight zero has one composition; Nat subtraction in 2^(n−1) gives 2⁰=1 at n=0. |
| `Mathlib/FieldTheory/RatFunc/Valuation.lean:81` | inftyValuation; polynomial at 108, X at 97, X_inv at 103; CompletionAtInfty at 138. The native multiplicative value is exp(intDegree), not a real-valued q-normalized absolute value. Completion retains DecidableEq and derives Field/Algebra. |
| `Mathlib/FieldTheory/Finite/Basic.lean:266` | card' forces prime-power cardinality; sum_pow_units at 290 and frobeniusAlgHom at 333 supply the coefficient calculations. Forward Frobenius does not require K itself to be perfect. |
| `Mathlib/Data/Finsupp/Defs.lean:88` and `Mathlib/Data/Finsupp/Single.lean:47` | Finitely supported functions and single; a zero coefficient has empty support. These do not supply a harmonic or q-shuffle operation. |
| `Mathlib/LinearAlgebra/Span/Defs.lean:46` | Submodule.span is the native span; no finite-dimensionality or independence is part of its definition. |
| `Mathlib/LinearAlgebra/LinearIndependent/Defs.lean:98` | LinearIndependent is injectivity of finite linear combination; it does not silently assume the family nonempty. |
| `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61` | Natural finrank alone does not assert finite dimension; the Frobenius headline separately retains Module.Finite. |
| `Mathlib/Order/SupIndep.lean:328` | iSupIndep is the independent family condition used for distinct weights; normalized Eulerian values would violate it. |
| `Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:89` and 142 | HasSum/tsum are generated additive declarations. Generic topology alone gives no uniqueness, and a nonsummable family has totalized sum zero; the actual completion is a separated complete field and the roadmap supplies convergence. |
| `TauCeti/RingTheory/PowerSeries/TateAlgebra.lean:76` | norm_eq_gaussNorm; norm_coeff_mul_pow_le at 80, norm_C at 94, norm_X at 105, completeness at 138. Positive radius and ultrametric norm assumptions are present; norm_X additionally needs NormOneClass. No arithmetic twist or E finite-extension condition is supplied. |

No Carlitz, multizeta or stuffle implementation was found in the pinned Mathlib or Tau Ceti object searches. This search result is limited to those pins; it is not a claim about every external Lean library.

The requested dependency check returned:

```text
depcheck: 56 roadmaps, 633 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The extant open suppliers precede this roadmap in `merge-order/ORDER.txt`: FunctionFieldArithmetic at 167, GlobalShtukasAndFunctionFieldLanglands at 170, PeriodsAndSpecialValues at 199, this roadmap at 286. Internal proof-input ownership is a separate check; R01 is not detected by this graph test. The previous repair report contains no finding marked “not actionable in this package”; none of the three findings reopens such a settlement.

## Not verifiable

- AT90's displayed formulas (3.6.4), (3.7.1), (3.7.3) and (3.7.4) are absent from its supplied text extraction at AT90 lines 738–761. The surrounding sections and the substitution argument are readable. AT09 §2.4.1 and CHANG14 Theorem 5.5.1 independently support interpolation, and the gap's generating function passes d=0,1 controls, but this pass does not certify those AT90 displays directly. No replacement source key or human request was created: the work is already legally cached and settled in the manifest.
- No Lean build or fresh #check elaboration was run, as required by the read-only pass. Signature verification used the supplied 36-declaration elaboration artifact and the actual source; it is not a fresh build result.
- The 14 declared supplier gaps are requirements, not existing implementations. The calculations and source checks do not certify their future formalizations.
- Ownership searches covered the supplied sibling checkouts and the roadmap index. Open work without a supplied checkout was not individually inspected beyond index matches; no assertion of exhaustive unpublished-work ownership is made.
- Finite tests do not verify every coefficient in the long all-weight elimination proofs. The recorded source statements, relevant proof steps and explicit boundary computations support the review; they do not replace formal proofs.

## Source issues

- **Misprint** in CCM23 at §2.2, printed p.7 (CCM23 line 329): the source says the reciprocal power in S_d(s) is indexed by d; it should be indexed by s; affects a stated result.
- **Misprint** in CCM23 at (2.3.2), printed p.9 (CCM23 line 421): the source says the correction coefficient tests divisibility of an unbound k; it should be divisibility of j; affects a stated result.
- **Misprint** in CCM23 at Definition 3.1.1, printed p.10 (CCM23 line 502): the source says box-plus is linear on H⊕H; it should be bilinear on H×H, since its two single-input values vanish but their joint value need not; affects a stated result.
- **Error** in CCM23 at identities after Definition 2.2.2, printed p.8 (CCM23 lines 354 and 378): the source says the tail-factorization identity holds for every integer cutoff with its given empty convention; it should be restricted at cutoff zero or use empty truncated value one, since its displayed convention gives 0=1 there; affects a stated result.
- **Misprint** in CPY19 at Proposition 2.2.1, printed p.6 (CPY19 line 248): the source says a rationalized-module homomorphism has a polynomial matrix; it should be a rational-function matrix, as the homomorphism 1/t between trivial modules demonstrates; affects a stated result.
- **Misprint** in ND21 at §2.2, printed p.9 (ND21 line 477): the source says the summand in the partial sum defining B* is R(d); it should be R(j), with j the summation variable; affects the proof.
- **Error** in THAKUR10 at proof of Theorem 3, printed p.1979, fourth equality (THAKUR-UPDATES lines 308–355): the source says that equality follows from the inductive shuffle argument; it should be replaced by Shi's mixed-product-first induction given in the author's correction; affects the proof.
- **Gap** in CHANG14 at proof of Lemma 5.3.1, printed p.15 (CHANG14 lines 774–784): the source says whole-tuple decay places every initial-prefix series in the Tate algebra; it should handle zero coordinates separately: at q=3, s=(1,1), Q=(θ²,0), whole terms vanish but the first-prefix norms grow; affects the proof.
- **Misprint** in AT09 at §2.3, printed p.4 (AT09 lines 195–196): the source says base-q digits can equal q; it should require digits strictly below q; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9500295f50d3ee0b34eea0f8d44847758e13689c", "job": "RT-DrinfeldModulesAndTModulesPartII~1a", "model": "gpt-6-astra", "worker": "chris-35"} -->
