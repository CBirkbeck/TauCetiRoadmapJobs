<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1436#issuecomment-6426812697 -->
Red team round 2 pass a (codex) of 34d0752

Verdict: needs_changes

1. **F01** (P3) The merged-prefix Check silently discards the polynomial labels

   **Location:** `packages/DrinfeldModulesAndTModulesPartII/README.md:1005`: “I = {∅, (1), (1, 1)}, the prefix (1) being shared.”

   **Claim:** The two displayed indices determine this three-element merged prefix set, in the general polynomial-tuple setting of §3.10.

   **Witness:** At q=3 take (s₁,Q₁)=((1,1,1),(1,1,1)), (s₂,Q₂)=((1,2),(θ,1)). Both satisfy the termwise bounds. I={∅,((1),(1)),((1,1),(1,1)),((1),(θ))} has four elements: the length-one polynomial prefixes differ.

   **Exact repair text:** Insert before the index-only Checks at lines 1003–1005: “For the examples (s₁,s₂)=((1,2),(3)), ((1,2),(2,1)) and ((1,1,1),(1,2)), take every Q-coordinate to be 1 and suppress these polynomial labels.” Add: “At q=3, the pairs ((1,1,1),(1,1,1)) and ((1,2),(θ,1)) instead have four proper-prefix pairs including the root: their length-one index prefixes agree, but their polynomial prefixes differ.”

   **Retest:** With Q₂,₁=1 the two length-one pairs coincide and |I|=3. With Q₂,₁=θ they remain distinct and |I|=4; ‖θ‖=3<3^(3/2), so the negative control stays within the hypotheses.

2. **F02** (P1) The endpoint proof consumes an unowned nonproportionality theorem

   **Location:** `packages/DrinfeldModulesAndTModulesPartII/README.md:1344`: “the rational suffix combinations with Corollary 5.1 and the weight-(3q − 3) case remove most of them”.

   **Claim:** The named inputs suffice for the ten-shape elimination at weight 3q−2.

   **Witness:** IKLNDP-NOTE line 1836 additionally uses ζ_A(q,q−1)/ζ_A(2q−1)∉K. At q=3 this separates ζ_A(3,2) from ζ_A(5); §4.7 stops at weight 4. No target or supplier contract states this weight-5 separation.

   This is distinct from the already owned relation ζ_A(2q−1)=−D₁ζ_A(1,2q−2). The Note uses both assertions to remove the supported index (q−1,q,q−1). The additional source LND-ZETALIKE, Theorem 1.3, printed p.4, lines 157–158, confirms the missing assertion: the pair has i=q and j=1, violating i≤j. A source citation alone does not own the prerequisite.

   **Exact repair text:** Extend §4.7 by the following target and proof, before §5.13 consumes it:

   “For q>2, at w=2q−1 put H_w=θ^q−t and H_q=H_(q−1)=1. If δ₁,δ₂∈K̄[t] and a₁,a₂∈F_q[t] satisfy δ₁=(δ₁+δ₂+a₁H_w)⁽⁻¹⁾(t−θ)^w and δ₂=(δ₂+a₂)⁽⁻¹⁾(t−θ)^(q−1), then δ₁=δ₂=a₁=a₂=0. Consequently ζ_A(q,q−1) and ζ_A(2q−1) are K-linearly independent (IKLNDP-NOTE §5.9.1, printed pp.29–30, line 1836).

   “The generating series of §3.1 gives H_(2q−1)=θ^q−t. The second row gives δ₂=f(θ^q−t^q), a₂=f(t^q−t). Sections 4.2–4.3 give δ₁=(aθ²+bθ+c)(t−θ)^(2q−1), with a,b,c∈F_q[t]. Twist once and cancel (t−θ^q)^(2q−1). Comparing θ^(2q+1), θ^(2q), θ^(2q−1) successively gives a=b=c=0; the remaining identity is (f+a₁)θ^q−ft^q−a₁t=0, hence f=a₁=a₂=0. Apply §3.11 to a putative relation on (2q−1) and (q,q−1); the sole nonempty proper prefix is (q), so its lower-weight independence is §0.5.”

   In §5.13 add: “To remove (q−1,q,q−1), use the new weight-(2q−1) separation in §4.7 together with §2.13.” Update the §4.7 heading/range and its H-polynomial formula to include this separately stated boundary case.

   **Retest:** At q=3, H₅=θ³−t and δ₁=(aθ²+bθ+c)(t−θ)⁵. The coefficients of θ⁷, θ⁶, θ⁵ in the cancelled equation give a=b=c=0; then a₁=−f and f(t³−t)=0 force both coefficients zero. At q=4 the same degrees 9,8,7 work in characteristic two. Thus the previously missing separation is supplied without assuming the endpoint independence theorem itself.

3. **F03** (P3) Two counting definitions lack three discriminating Checks

   **Location:** `packages/DrinfeldModulesAndTModulesPartII/README.md:358` and :375–393, the definitions and Checks for “d(w), s(w), t(w) and c(w)”.

   **Claim:** These are four independently specified counting sequences with adequate definition-level Checks.

   **Witness:** The Checks evaluate d and s repeatedly, t only at q=3,w=4, and never numerically evaluate c. The wrong replacement c=d passes every numerical Check there, but at q=3,w=4 gives 6 instead of 5.

   **Exact repair text:** Add the following Checks to §0.11:

   - “At q=3, c(4)=5 while d(4)=6: the extra Thakur index is (3,1). At q=2, c(3)=1 while d(3)=2: only (1,1,1) has all entries below q. At q=4, c(5)=13 while d(5)=14: the extra Thakur index is (4,1).”
   - “At q=3, t(5)=2(48+16+6)=140, whereas s(5)=130. At q=4, t(5)=3(189+48+12+3)=756, whereas s(5)=750. Together with t(4)=48 at q=3, these distinguish unrestricted characters on q-parts from the character-one rule.”

   **Retest:** Enumeration gives c(4)=5, c(3)=1, c(5)=13 in the three specified fields; the recurrences give t(5)=140 and 756. There are now at least three distinct numerical instances for each definition, and substituting d for c or s for t fails them.

## Earlier findings and repairs verified

All locations below are in `packages/DrinfeldModulesAndTModulesPartII/`.

| Earlier finding | Status | Repaired passage and present witness |
|---|---|---|
| pass a F01, unowned MZV-to-CMPL expansion | Repaired | README:973: “choose a K-basis V_w of Z_w consisting of MZVs”; “By the homogeneous multiplication of §1.7”. At q=3, ζ(4) uses Q=H₄, c=Γ₄=D₁ directly; no coefficient-point expansion is consumed. README:982 and :1043 include Layer 1. |
| pass a F02, unqualified q=2 family difference | Repaired | README:787: “The two sets first differ at w = q + 1”. For q=2, w=1,2 both are respectively {(1)} and {(1,1)}; at w=3 they have (3) versus (2,1), with two elements each. |
| pass a F03, nonexistent MZ.1 reference | Repaired | README:597: “In the formal setting of §§1.3–1.4”. Those sections define H and its realisations. At ([∅],−[∅]) the residuals are −1 at d=−1 and 1 at d=0. |
| pass b F01, unsupported spanning at 2q−1 | Repaired | Suggested.lean:333: `hw : w ≤ 2 * Fintype.card F - 2`; README:1342: “For w ≤ 2q − 2”. At q=3, w=4 is included and w=5 excluded, matching IKLNDP24 Proposition 4.11, line 6517. |
| pass b F02, presenting absent parent as existing supply | Repaired | README:61: “Every item below is a requirement … registered as one of the supplier gaps”. The 13 parent gaps and 1 stuffle gap match plan.json. The parent’s absence is not re-raised: the brief expressly accepts named declared gaps. |
| pass b F03, roots-of-characters padding | Repaired | Declaration deleted. README:1274 retains “γ₁, …, γ_n are linearly independent over K∞”; Suggested.lean:16–17 names the unavailable period-character headline. At q=3, 1 and √−1 span the two-dimensional constant extension. |
| pass b F04, two-row padding | Repaired | Declaration deleted; README:1149 retains the polynomial system. At q=3, a₁=t³−t, δ₁=(t−θ)⁶, a₂=δ₂=0 still solves its endpoint. The additional deletion of `twisted_system_rigidity` is consistent: README:1135 keeps its full system. |
| pass b F05, missing product headline | Repaired | Suggested.lean:123: `zetaSpace F w * zetaSpace F w' ≤ zetaSpace F (w + w')`; the alternating conjunct follows. README:558 names it. At q=2, ζ(1)ζ(2)=ζ(3)+ζ(1,2)∈Z₃; at weights 0,0 both spaces are K. |

No earlier finding remains partly repaired or unrepaired. S01–S02 concern unchanged material, rather than errors introduced by these repairs. No settled “not actionable in this package” finding is re-raised.


## Verified sound

Read all 1,418 README lines and all 355 Suggested.lean lines: 68 numbered targets, 34 declarations (16 definitions and 18 theorems), and 194 Check bullets in 70 Check blocks. The tables below record the numerical, polynomial, support and valuation controls, including negative controls. Repeated Check bullets were read but are not counted as independent examples. These computations test statements; they do not replace the cited proofs. S01–S03 are the exceptions to the soundness conclusions.

The supplied elaboration record contains all 34 full types. Each was compared with the declaration and README: no missing section binder, unintended instance loss, or universe restriction was found. No Lean command was run during this read-only pass. The file has one `import Mathlib`, the required namespace and layer comments, real bodies for all definitions, and 18 admitted theorem proofs; it has no admitted data, `lemma`, `set_option`, stand-in proposition field, or admitted example.

The 18 retained theorem statements cover nonvanishing; ordinary and alternating multiplication; the two Brown spanning results; both value-space bridges; strong Brown spanning; algebraic weight grading; Frobenius solution-space dimension; small-entry and bounded q-indivisible independence; the CMPL and Thakur bases; ordinary dimension and algebraic-coefficient basis; the alternating basis and dimension; and the two direct small-weight statements. The module docstring explicitly names the unstatable interpolation, deformation-specialisation, MZ descent, ABP/Eulerian-tail, complete-relation, period-character and v-adic headlines and their missing carriers. Reading the definitions and pinned APIs did not identify a remaining one-tactic theorem among these 18. In particular the new multiplication theorem concerns the actual infinite-series weight spaces, not arbitrary submodules satisfying closure as a hypothesis.

All statement tables use q=|F|, K=F(θ), K∞=RatFunc.CompletionAtInfty F, D₁=θ^q−θ, ℓ₁=−D₁, and characteristic-field arithmetic. The finite-field instances exclude q=1, the zero ring, DVRs and nonreduced coefficient rings. Finite positive compositions exclude zero parts; the empty composition represents weight zero. Cases about covers, nonabelian groups and non-quasi-separated spaces have no carrier in these signatures. The genuinely relevant degenerate cases are empty indices, zero polynomial coordinates, weight zero, q=2, nonprime q=4, inseparable coefficient Frobenius, and finite versus infinite-dimensional solution spaces.

### Every README target: computed adversarial controls

| Target and README line | Instances and computed values on the two sides | Result / change |
|---|---|---|
| Conventions :15–34 | q=3: ℓ₁+D₁=0, ℓ₁−D₁=2ℓ₁≠0; twist(t+θ)=t+θ³, whereas (t+θ)³=t³+θ³. v(θ)=-1, v(θ^(1/q))=-1/q; v(π̃)=-3/2. | Signs and inverse-twist domain agree with the contracts. |
| 0.1 :118 | T₁(∅)=∅; T₃(1,2)=(3); wt(2,1,3)=6, depth=3. Prefix sums for (1,3)/(2,1,1) are 1<2 and 4>3, hence incomparable. Init(q+1,1)=∅, Init(q,q,1)=(q,q,1); (q) fails and (q,1) satisfies 1-admissibility. | Empty/out-of-range conventions and partial order distinguished. |
| 0.2 :148 | S₀(k)=1 and S₀(k,l)=0; S_<0(∅)=1 makes 1=1·1, whereas zero gives 1≠0. q=2,3,4: S₁(1)=1/(θ²+θ), −1/(θ³−θ), 1/(θ⁴−θ). q=3: S₁(−1;1)=−S₁(1). | Nonprime-q and negative-cutoff controls hold. |
| 0.3 :180 | Empty polynomial tuple contributes 1. ζ(1) starts with 1; q=2, ζ(1,1) starts θ⁻² and converges. Squaring in characteristic two gives ζ(1)²=ζ(2), coefficientwise. | No real-MZV admissibility restriction imported. |
| 0.4 :207 | q=2 has one unit character. q=3: ζ(−1;1)−ζ(1)=−2Σ_(d odd)ℓ_d⁻¹ has valuation 3, not infinity; all-one characters give identical summands. | Twisting is nontrivial when it should be. |
| 0.5 :231 | q=2, depth two: largest-degree term S₁(1)S₀(1) has degree −2; next possible degree is smaller. Depth one has leading coefficient 1, empty depth value 1. | Nonvanishing argument uses declared general power-sum contract. |
| 0.6 :247 | q=3, s=(2,2), z=(1,θ⁴): exponent −3·3^d₁+3^d₂≤−8·3^d₂; tail exponent is +3^d. Full series converges but tail does not. A zero coordinate gives value 0. Li(4)−ζ(4) starts θ⁻⁶; Li₁(√−1)=√−1·Li(−1;1). | Whole-tuple and rectangular domains distinguished. |
| 0.7 :278 | Nonzero coordinates in the small polydisc give a unique largest term at (r−1,…,0); q=2, s=(1,1), z=(1,1), its norm is 2⁻². Putting the last coordinate 0 gives 0 and violates the hypothesis. | Zero-coordinate negative control. |
| 0.8 :290 | q=3, n=1,2,3: S_d(n)=ℓ_d⁻ⁿ; d=0 gives 1=1. For n=4, S₁(4) starts 2θ⁻⁶ but ℓ₁⁻⁴ starts θ⁻¹². | Entry bound is essential. |
| 0.9 :302 | Z₀=K·1, Z₁=K·ζ(1); both dimensions 1. Weight 3 has four compositions. q=3: v(ρζ(1))=−1/2, so it is in the algebraic scalar extension but outside K∞. | Scalar fields distinguished; no arbitrary ambient topology. |
| 0.10 :329 | q=2,w=3: Iᵀ={111,21}, IND={111,3}, both size 2. q=3: ι(4)=(3,1). q=4: (2) is IND although 2 divides its entry. (q,1) is Thakur but prefix (q) is not. | q-indivisibility and prefix closure checked separately. |
| 0.11 :358 | q=2: d(1…5)=1,1,2,3,5. q=3: d(4)=6, s(4)=46, t(4)=48, c(4)=5. q=4: c(5)=13 versus d(5)=14. | S03: missing discriminating c/t Checks. |
| 0.12 :385 | q=3,w=4: enumerated counts (Iᵀ,IND,AS,AT)=(6,6,46,48). q=2,w=3: ordinary counts 2=2 and weighted counts 2=2. | Cardinalities and recurrences agree. |
| 0.13 :397 | q=3: ζ(2)/π̃²=−1/(θ³−θ); q=2: ζ(1)/π̃=1/(θ²+θ). The coefficient of degree q in e_C(log_C z)=z is 1/ℓ₁+1/D₁=0. | Period sign agrees with exponential normalisation. |
| 0.14 :409 | 0/π̃^w=0∈K; ζ(q−1)/π̃^(q−1)=−D₁⁻¹. q=3: v(ζ(1)/π̃)=3/2 is not integral, so the quotient is not in K. | Both positive and negative Eulerian examples. |
| 1.1 :444 | q=2: Δ¹_(1,2)=1, Δ²_(1,2)=0. q=3: Δ²_(2,2)=−2=1; Δ¹_(1,2)=0 whereas the unfiltered binomial expression is 1. | Divisibility filter and signs hold. |
| 1.2 :467 | Exact rational-function arithmetic for q=2,3, d=0,1, 1≤a,b≤6: 144 differences between product and proposed expansion are 0. q=3: S₁(2)²−S₁(4)=S₁(2,2); d=0 gives 1−1=0. | General formula's low-degree controls passed. |
| 1.3 :480 | q=2: [1]*ζ[2]=[12]+[3], but [1]*Li[2]=[12]+[21]+[3]. (2)⊞[11]=[31], not [2]+[11]; either zero argument gives 0; empty shuffle factor is the unit. | Bilinear box-plus and the two products distinguished. |
| 1.4 :505 | Empty realisation=1, empty fixed-degree value=1 at d=0 and 0 otherwise. Depth≥2 at d=0 gives 0. q=3: Li(12)=ζ(12), Li(4)−ζ(4) has coefficient 1 at θ⁻⁶. | Equal spans do not identify maps. |
| 1.5 :530 | q=2: ζ(1)²=ζ(2); q=3: ζ(1)²−ζ(2)=2ζ(11), whose leading term is 2ℓ₁⁻¹≠0. | Correct characteristic-dependent cross term. |
| 1.6 :542 | q=2: S_d(1)S_d(2)=S_d(3)+S_d(21), weights 3 and depths 1,2. At d=0 the two sides are 1 and 1+0. q=3: S₁(1)²=S₁(2). | Mixed-product induction is the corrected source route. |
| 1.7 :554 | q=2: ζ(1)ζ(2)=ζ(3)+ζ(12)∈Z₃; adding the CMPL term ζ(21) would be nonzero. q=3 alternating character product (−1)²=1. Empty unit gives weights 0+w=w and product 1·Z_w=Z_w. | Ordinary and alternating closure, unit and grading agree. |
| 1.8 :571 | q=3: π̃²=−D₁ζ(2)∈Z₂; π̃⁴=D₁²ζ(2)²∈Z₄; π̃⁰=1∈Z₀. q=2 all positive weights are divisible by q−1. | Weight restriction and multiplication agree. |
| 2.1 :595 | ([∅],−[∅]) has residuals −1 at d=−1 and 1 at d=0, despite summed value 0. Zero pair has all residuals 0. q=2 omitted-D₁ expression at d=0 is 1+D₁⁻¹≠0. | Binary relation is stronger than a value relation. |
| 2.2 :620 | For q=2,3 and d=0,1, S_d(q)+D₁S_(d+1)(1,q−1)=0 exactly. d=0 is 1+D₁/ℓ₁=0, including odd-characteristic minus sign. | Fundamental relation checked. |
| 2.3 :632 | q=2,d=1: fixed parts B*₂(R₁)=0, C₍₁₁₎(R₁)=D₁⁻³, BC₂(R₁)=D₁⁻². Thus 0−D₁·D₁⁻³=D₁⁻²; omitting D₁ instead gives D₁⁻³. Empty operators act as identity; B*₀ is outside domain. | Operator coefficients and domains hold. |
| 2.4 :659 | For W=(1), leading fixed-degree index is (q+1) with coefficient 1. q=2, summing yields ζ(3)+D₁ζ(12)=0. | Leading coefficient remains a unit. |
| 2.5 :671 | q=2: bad singleton (3) reduces to (1,2), then (111),(21); weight stays 3 and first prefix drops from 3 to 1. The resulting indices meet the advertised two types. | Finite descent is mathematical induction, not a computational deliverable. |
| 2.6 :683 | q=2, k=3, weight 3: (12) is not final-admissible, while (111) and (21) have all parts≤2 and last part 1<2. Empty index is admissible for every k. | Termination target handles empty and final-part cases. |
| 2.7 :695 | q=2: ζ(3)=D₁²(ζ(111)+ζ(21)); four compositions reduce to two generators. Weight zero has one generator 1; below q no forbidden singleton occurs. | Brown spanning controls passed. |
| 2.8 :712 | q=3,w=4: both spans have the same six Thakur generators; individual Li(4) and ζ(4) differ first at θ⁻⁶. Weight-zero spans both equal K. | Span bridge does not overclaim pointwise equality. |
| 2.9 :726 | q=2: U(2)=D₁[11], Uζ(3)=D₁[12], Uζ(21)=[21], U(∅)=∅. For (1,2,2), Init=(1,2,2) but sᵀ=(1). | Correct split and coefficient signs. |
| 2.10 :751 | q=2: Uζ²(3)=D₁²([111]+[21]); omitting box-plus drops the [21] coefficient D₁². Both remaining indices lie in Iᵀ₃. | Iteration preserves realisation with required extra term. |
| 2.11 :763 | q=3,w=4: exceptional IND index (4) maps to (3,1), and its coefficient is −1 modulo D₁; the six-by-six transition has diagonal residues ±1. q=2,w≤2: IND=Iᵀ. | Spanning uses a nonzero transition determinant. |
| 2.12 :775 | q=2,w=1,2: AS=AT; w=3: {3,111} versus {21,111}, each size 2. q=3,w=4: 46 versus 48 arrays. | Earlier q=2 repair verified. |
| 2.13 :791 | q=2,3,d=0,1: S_d(2q−1)+D₁S_(d+1)(1,2q−2)=0 exactly. At q=3 this relates IND indices (5),(1,4), beyond the independence range 4. | Boundary counterexample agrees with §5.3. |
| 3.1 :815 | q=3: H₁=H₃=1, H₄=2t³−t−θ³, Γ₄=D₁; deg_θ H₄=3≤9/2<6. The generating series also gives H₅=θ³−t. | Shifted indexing and norm bound hold. |
| 3.2 :840 | q=3,s=2: at d=0 both sides are π̃⁻²; at d=1 both are ℓ₁⁻²π̃⁻². For γ²=−1, γ³=−γ supplies the character factor. | Twist is coefficientwise, not substitution in t. |
| 3.3 :852 | 𝕃₁(θ)=θ−θ^q=ℓ₁. q=3,s=(2,2),Q=(1,θ⁴): full exponent≤−8·3^d₂, tail exponent +3^d₂. Empty deformation=1. | Full versus tail convergence separated. |
| 3.4 :878 | q=2,s=1,Q=1: 𝓛(θ)=−D₁⁻¹ and 𝓛(θ²)=D₁⁻², while |θ|=2 exceeds unit-disc radius. Zero full tuple gives the entire zero function even with a divergent prefix. | Entire extension and the zero-coordinate branch are essential. |
| 3.5 :892 | q=2,j=1: (−D₁⁻¹)²=D₁⁻². q=3,Q=(1,t+θ⁴): same negative full exponent as above, tail term norm 3^(3^d); Q=(1,0) gives 0=0 at every point. | General specialisation does not specialise the divergent tail. |
| 3.6 :907 | Depth zero Φ=(1), determinant 1. s=(2,1): determinant exponent 3+1=4. Depth-one second row is Q^(-1)(t−θ)Ω+𝔏, with the essential t−θ factor. | Matrix orientation and rank-zero convention hold. |
| 3.7 :932 | Li(1) uses Φ=[[t−θ,0],[t−θ,1]], ψ=(Ω,𝓛)ᵀ. q=3, ζ(2)² has weight 4. Zero is excluded; scaling Z by a∈K× changes c to c/a. | MZ datum selects the normalisation and excludes zero. |
| 3.8 :955 | q=3, ζ(2) uses H₂=Γ₂=1. For alternating γ²=−1, use γ·Li(−1;1) as the MZ value with c=1; treating γ as a K-scalar is invalid since γ∉K. | The scaled alternating value is the declared carrier. |
| 3.9 :967 | q=3: weights 0,1,2 give 1+1+2=4 K̄-linearly independent basis vectors. Normalised ζ(2)/π̃²=−D₁⁻¹ meets the weight-zero line in dimension 1 instead of 0. | Grading is for values, not period-normalised ratios; repaired proof uses MZV basis directly. |
| 3.10 :984 | Empty collection leaves one root and Φ=diag((t−θ)^w,1). Two equal index prefixes with Q-coordinates 1 and θ produce four prefix pairs, not three; with both coordinates 1 the count is three. | S01. |
| 3.11 :1011 | q=2, ζ(2)+D₁ζ(11)=0 gives f_root(θ)=0 and f_(1)(θ)=D₁Li(1)/π̃=1. Omitting the suffix row would lose that nonzero rational coordinate. | Rationality conclusion is stronger than the original zero relation. |
| 3.12 :1025 | q=3,w=1: v(π̃)=−3/2 rules out a nonzero Eulerian value in K∞; w=2 has ζ(2)/π̃²=−D₁⁻¹. q=2: every integer is divisible by q−1=1. | Divisibility obstruction has the correct small-field limit. |
| 4.1 :1049 | w=0: residual(1)=residual(t)=0; residual(θ)=θ^q−θ≠0. q=3: IND°₂={(2)}, excluding (1,1); IND°₃={(1,2)} gives three vertices. | F(t)-linearity, not F(θ,t)-linearity; no junk coordinates in kernel. |
| 4.2 :1077 | Without positive degree, B=F₂, F=G=1, α²=α+1 gives δ^(1)=Fδ+G=α+1 with δ=α∉B[t]. With G=δ=0 both sides are zero. | Positive-degree descent hypothesis is necessary. |
| 4.3 :1091 | w=q−1: root t^q−θ has θ-degree 1; leaf t−t^q has degree 0, equal to its bound. Zero polynomial has degree −∞, not a spurious positive degree. | Degree conventions and leaf bound hold. |
| 4.4 :1103 | q=2,w=2: P=[2]+D₁[11] realises to 0, so it is Eulerian; lifted leaf coefficients are 1 and D₁(t). P=0 gives the zero solution. | Key lemma does not require nonzero value. |
| 4.5 :1115 | w=q−1: root+leaf=(t^q−θ)+(t−t^q)=t−θ, so both sides are t^q−θ^q. q=3,w=1: a=(a+b)(t−θ) forces a=b=0. w=0 gives one free F(t)-coordinate. | Dimension is 1,0,1 in these three cases; finite-dimensional conjunct retained. |
| 4.6 :1131 | q=3,w=2,γ=1: both root sides are t³−θ⁹. With γ²=−1, the same coordinates leave (1−γ)(t−t³)(t−θ³)²≠0. w=0 has nonzero constant solution 1 and is excluded. | Character and positive-weight restrictions discriminate. |
| 4.7 :1147 | q=3,w=4: a₁=t³−t, δ₁=(t−θ)⁶, a₂=δ₂=0 has zero residual in both rows. Thus “all solutions zero” would fail; the actual conclusion excludes a₂≠0. | Correct endpoint at 2q−2; S02 requires another case at 2q−1. |
| 5.1 :1171 | q=2: small-entry family is the singleton (1,…,1), whose leading term is nonzero; weight zero is {∅} with value 1. | Rank-one and empty cases agree with nonvanishing. |
| 5.2 :1187 | q=3: dimensions at w=1,2,3 are 1,2,3=2²−1; weight-2 family is {(2),(1,1)}. q=2,w=2 has one generator (1,1). | Small-weight count agrees with the basis. |
| 5.3 :1199 | q=3,w=4: six IND values; at w=5 the nonzero relation ζ(5)+D₁ζ(1,4)=0 refutes the extension. q=2 is outside its q>2 hypothesis. | Range and q restriction are explicit. |
| 5.4 :1215 | q=3,w=4: six Thakur indices give dimension 6; q=2 endpoint w=2 gives basis {(1,1)}, dimension 1. | Bounded ordinary basis agrees with counts. |
| 5.5 :1227 | q=3,w=4: Li(4) and the five other IND values give six basis vectors. Weight zero gives Li(∅)=1. The w=2 nonzero period vector π̃²=−D₁ζ(2) prevents the one-dimensional solution line from becoming a relation. | The CMPL basis proof uses the period input, not just finrank. |
| 5.6 :1241 | q=2,w=0…4: dimensions 1,1,1,2,3; q=3,w=5: 6+3+2=11. Algebraic scalar extension retains the same number of basis vectors. | Ordinary dimension and algebraic-coefficient statement agree. |
| 5.7 :1257 | q=2: kernel dimensions at w=1,2,3 are 0,1,2. Bases at w=2 and 3 are [2]+D₁[11], and {[12]+D₁([111]+[21]), [3]+D₁[12]}; each realises to 0 and has a distinct excluded-index pivot. | Full-kernel claim is supported by the actual rewriting target. |
| 5.8 :1272 | q=3: 1 and γ with γ²=−1 form a basis of F₉ over F₃ and remain independent over F₃((1/θ)); a+bγ=0 gives a=b=0. q=2: only the character-one vector 1 remains. | Character splitting has the intended constant-field domain. |
| 5.9 :1284 | q=2,w=1: 1+D₁𝔏𝔦(1;1)(θ)=0, equivalently π̃+D₁Li(1)=0. q=3,w=1 cannot have a nonzero constant term in such a normalised relation. | Period factor cannot be omitted. |
| 5.10 :1296 | q=3,w=1: two characters and two basis values; w=4: 46 arrays. q=2,w=3: two arrays, characters all one. | Alternating basis index count is correct. |
| 5.11 :1312 | q=3: s(1)=2, s(4)=46, s(5)=130; q=2: s=d with values 1,1,1,2,3 at w=0…4. | Alternating and ordinary dimensions collapse only at q=2. |
| 5.12 :1328 | q=3,w=4: the six trivial-character IND values are a subfamily of the 46-element alternating basis, giving lower bound 6. At w≤q the bound equals the small-weight ordinary dimension. | The bridge supplies the correct ordinary value space. |
| 5.13 :1340 | q=3: direct arrays at w=4,5,6,7 number 46,130,368,1040; s(7)=1042. At q=2,w=4 direct indices are 211,121,13, count 3; the alternative 1111,112,121 has relation ζ(112)+D₁(ζ(1111)+ζ(121))=0. | Family and range corrections sound; endpoint proof still has S02. |
| 5.14 :1367 | q=3: bounds at w=1,2,4 are 1,2−1=1,6−2=4. q=2,w=1 gives 1−1=0. Weight zero gives 1−0=1 using the stipulated negative-index zero. | No natural-subtraction or negative-index error. |

### Every Suggested.lean declaration: context and computed controls

Context codes below expand to the complete instance contexts, not ambient assumptions: **F** means `(F : Type u) [Field F] [Fintype F]`; **C** adds `[DecidableEq (RatFunc F)]`. **E** adds `(E : Type v) [Field E]`, the three algebras over K, K∞ and AlgebraicClosure K, and both K scalar-tower instances. **N** means only the displayed natural numbers, with no field or q≥2 assumption. All declarations have explicit binders; there are no standing `variable` blocks. Definitions with context N have harmless q=0,1 junk values, but no field theorem instantiates those values.

| Declaration, layer / line | Variables and instances | Computed values / signature comparison | Result / change |
|---|---|---|---|
| multipleZeta, 0 / 31 | C; {w}, s:Composition w, ε:Fin s.length→Fˣ | w=0: one empty tuple, product=1; q=2,s=(1,1): first nonzero degree tuple (1,0), leading degree −2. Zero polynomial is not monic, so no licensed denominator is zero. | Matches §§0.3–0.4. |
| carlitzDenominator, 0 / 43 | F; d:ℕ | d=0:1; d=1:θ−θ^q; q=3,d=2:(θ−θ³)(θ−θ⁹). q≥2 makes each exponent greater than 1 and each factor nonzero. | Native polynomial body; no lost completeness hypothesis. |
| multiplePolylog, 0 / 49 | C; {w},s,ε as above | Empty value=1; q=3,ε=−1,d=1 gives −1/ℓ₁, d=2 gives +1/ℓ₂. q=3,s=(4): Li−ζ begins θ⁻⁶. | Degree powers match README. |
| zetaSpace, 0 / 60 | C; w:ℕ | w=0 gives span{1}=K; w=1 gives span{ζ(1)} of dimension 1. | Scalar field is K, not its algebraic closure. |
| alternatingZetaSpace, 0 / 66 | C; w:ℕ | q=2 equals ordinary space; q=3,w=1 has two nonzero independent character values, dimension 2. | Dependent-pair arrays retain characters. |
| polylogSpace, 0 / 72 | C; w:ℕ | w=0 is K; q=3,w=4 span dimension 6 despite Li(4)≠ζ(4). | Agreement is a later theorem, not built into the definition. |
| alternatingPolylogSpace, 0 / 78 | C; w:ℕ | q=2,w=3 dimension 2; q=3,w=4 dimension 46. | Matches AL, not the unweighted IND count 6. |
| thakurIndices, 0 / 85 | N; q,w | q=2,w=3 accepts 111,21 and rejects 12,3. Empty accepted iff 0<q; at q=0 it is rejected. | getD 0 has intended field-case value. |
| indivisibleIndices, 0 / 89 | N; q,w | q=4 accepts (2), rejects (4); q=1 rejects every positive part; empty accepted. | Divisor is q, not characteristic p. |
| smallEntryIndices, 0 / 93 | N; q,w | q=2,w=3 accepts only 111; q=3,w=4 accepts five compositions and rejects 31. | Strict bound preserved. |
| toddNumber, 0 / 98 | N; q,w | q=2,w=0…4 gives 1,1,1,2,3; q=3,w=4 gives 6. q=0,w=0 gives 0, never a field instance. | Finite subtype makes Nat.card genuine cardinality. |
| alternatingNumber, 0 / 103 | N; q,w | q=3,w=4 gives 46; q=2 gives ordinary counts. q=1,w=0 contributes 0^0=1; positive weights contribute 0. | Natural subtraction junk does not enter theorems. |
| multipleZeta_ne_zero, 0 / 110 | C; {w},s,ε | Empty value 1≠0; q=3,twisted depth one leading coefficient 1; q=2,depth two leading degree −2≠−∞. | Actual series nonvanishing, not padding. |
| zeta_space_mul_le, 1 / 121 | C; w,w':ℕ | q=2,w=1,w'=2: product ζ(3)+ζ(12) belongs to Z₃. w=w'=0: K·K=K. q=3: character −1 times −1 becomes 1. | Both conjuncts match §1.7. |
| brown_spanning, 2 / 131 | C; w | q=2,w=3: ζ(3)=D₁²(ζ(111)+ζ(21)); at w=0 both sides span{1}. | Full unbounded weight range. |
| alternating_brown_spanning, 2 / 138 | C; w | q=3,w=4: 48 generators span dimension 46; q=2,w=3: two generators span dimension 2. | Spanning does not assert independence. |
| value_space_bridges, 2 / 147 | C; w | q=3,w=4: ordinary sides dimension 6, alternating sides dimension 46; Li(4)−ζ(4) has leading coefficient 1. | Equal submodules, not individual-value equality. |
| strong_brown_spanning, 2 / 153 | C; w | q=3,w=4: 46 IND arrays, compared with 48 weak-Brown arrays; w=0 both sides K. | Uses CMPL values as required. |
| zeta_algebra_graded, 3 / 166 | C+E | q=3,w=0,1,2: dimensions 1,1,2 and total span dimension 4; normalised weight-2 scalar has intersection dimension 1, so cannot replace the actual value. | Both embeddings and scalar towers occur explicitly; arbitrary compatible overfield is legitimate. |
| reducedPrefixes, 4 / 181 | N; q,w | q=3,w=3 gives ∅,1,12; w=0 gives {∅}; q=3,w=2 excludes prefix 1 because 11 is not reduced. | Complete rather than proper prefixes, as the solution system requires. |
| frobeniusResidual, 4 / 188 | F; w | w=0: R(1)=R(t)=0, R(θ)=θ^q−θ. Outside-tree coordinate f(l)=1 gives residual 1, forcing it out of the kernel. In-tree l.sum≤w, so subtraction w−l.sum has no underflow. | F(t)-linear with polynomial variable θ; no arbitrary support. |
| frobeniusSolutionSpace, 4 / 218 | F; w | w=0 kernel is constants F(t); q=3,w=1 root equation forces a=b=0. | Kernel imposes all equations and outside-tree zero. |
| frobenius_solution_dimension, 4 / 224 | F; w | w=0: dimension 1, divisor q−1 divides 0; q=3,w=1 dimension 0; w=2 root t³−θ, leaf t−t³ gives a line. | Module.Finite prevents finrank's infinite-dimensional zero convention from weakening the assertion. |
| small_entry_independent, 5 / 233 | C; w | q=2 every weight has one nonzero value; q=3,w=4 has five, not six, small-entry indices. | Matches §5.1 at all weights. |
| q_indivisible_independent, 5 / 241 | C; hq:2<q; w; hw:w≤2q−2 | q=3,w=4 has six indices; w=5 is excluded and has ζ(5)+D₁ζ(14)=0. | Range hypothesis is in elaborated type. |
| cmpl_ind_basis, 5 / 249 | C; w | q=3,w=4: six independent Li-values and dimension 6; q=2,w=3: Li(3),Li(111) give two. | Independence and spanning on the same family. |
| thakur_basis, 5 / 260 | C; w | q=2,w=3: ζ(21),ζ(111), dimension 2; q=3,w=5: 11 indices, dimension 11. | Full ordinary basis headline. |
| todd_dimension, 5 / 270 | C; w | q=3,w=5: finrank=11=toddNumber; q=2,w=0:1=1. | Finite generating family justifies use of finrank. |
| thakur_basis_algebraicClosure, 5 / 276 | C+E; w | q=3,w=4: six embedded basis values, span dimension 6 over K̄; w=0: embedded 1 is nonzero in field E. | Same-weight algebraic extension with both towers. |
| alternating_hoffman_basis, 5 / 294 | C; w | q=3,w=4: 46 character arrays, independent span of dimension 46; q=2,w=3:2. | Polylog family spans alternating zeta space via the bridge. |
| alternating_dimension, 5 / 305 | C; w | q=3,w=4:46=46; q=4,w=5:750=750; w=0:1=1. | Counts q−1 units, including nonprime fields. |
| directIndices, 5 / 315 | N; q,w | q=3,w=7:37 indices,1040 arrays; accepts43,25 and rejects7,223. q=2,w=4 accepts211,121,13. For lengths0,1, Fin(length−1) is empty, so the pair alternative is false. | All piecewise branches match the stated range; no theorem beyond 3q−2. |
| direct_small_weight_spanning, 5 / 332 | C; w; hw:w≤2q−2 | q=3,w=4:46 arrays spanning AZ₄; q=3,w=5 excluded. Empty array at w=0 has value1. | Earlier range repair is present. |
| direct_small_weight_independent, 5 / 344 | C; w; hw:w≤3q−2 | q=3,w=7:1040 independent candidates versus dimension1042; q=2,w=4:three values. Both q and 2q−1 entries force character1. | Statement matches the Note; proof-plan ownership has S02. |

### Independent finite computations

An exact finite-field polynomial/rational-function calculation checked all 144 equal-degree identities with q∈{2,3}, d∈{0,1}, a,b∈{1,…,6}; every cross-multiplied residual was zero. The fundamental and next-weight shifted relations were also checked at q=2,3 and d=0,1 with residual zero. No Lean build or external code was used.

Exhaustive composition enumeration checked the ordinary recurrence, q-indivisible/Thakur bijection counts, alternating recurrence, small-entry recurrence, and direct-family restrictions through weight 3q−2 for q=2,3,4,5. Some distinguishing results are:

| q | Weights | d(w) | s(w) | c(w) | Direct endpoint arrays versus s(3q−2) |
|---|---|---|---|---|---|
| 2 | 0…4 | 1,1,1,2,3 | 1,1,1,2,3 | 1,1,1,1,1 | 3=3 |
| 3 | 0…7 | 1,1,2,3,6,11,20,37 | 1,2,6,16,46,130,368,1042 | 1,1,2,3,5,8,13,21 | 1040<1042 |
| 4 | 0…10 | 1,1,2,4,7,14,27,52,100,193,372 | 1,3,12,48,189,750,2973,11784,46710,185151,733908 | 1,1,2,4,7,13,24,44,81,149,274 | 733902<733908 |
| 5 | 0…13 | 1,1,2,4,8,15,30,59,116,228,448,881,1732,3405 | 1,4,20,100,500,2496,12468,62276,311060,1553700,7760512,38762660,193614004,967074564 | 1,1,2,4,8,15,29,56,108,208,401,773,1490,2872 | 967074552<967074564 |

### Sources, ownership and pinned APIs

There are 19 source-manifest entries, all recorded as certified legal copies. This pass resolved the README's 99 distinct first line-number anchors into those cached works and read the surrounding statements or proof steps; the AT90 displayed formulas remain the exception described below. The useful source groups and their directly checked content are recorded here. An additional legal HAL text, LND-ZETALIKE, was fetched through the sources service to verify S02; it is evidence for this review, not a package manifest edit.

| Source / locators read | Verification against the roadmap |
|---|---|
| ND21 lines 120, 139–180, 265–277, 392, 455, 477, 554, 647, 828, 954 | Positive and empty indices, ordinary counting initial values, Theorems A/B/D and Corollary C, power sums, Todd operators and the descending reduction proof. The summation-variable misprint is not copied into §2.3. |
| ND21 lines 995–1075, 1184–1248, 1333–1455 | Broad effective-dual-motive convention; H-index shift; matrices and period interpretation; suffix rationality; Lemma 6.1/Theorem 6.2 two-row calculation. The endpoint permits nonzero a₁ but forces a₂=0. |
| CCM23 lines 250–640 | Index bijection and weighted families; the two realisations; q-shuffle correction; box-plus; rewriting and Brown spanning. The package corrects the exponent, divisibility-variable, bilinearity and empty-cutoff defects listed below. |
| CCM23 lines 643–785, 845–878, 1068–1099 | Monic descent, θ-degree estimate, reduced system and its dimension proof. In the divisible case the source actually has 2ℓ−m equations; q=3,ℓ=7 gives 12, as the README now says. No matrix-size erratum is inferred. |
| CCM23 lines 1155–1433, 1465–1488 | Key lemma, CMPL basis, Thakur basis, complete relation kernel, and binary relations. The grading step is supplied by Chang, not by an unsupported direct-sum assertion. |
| IKLNDP24 lines 95–597, 1643, 2082, 2286, 2845, 3086, 3228–3335 | Alternating conventions, product and reduction statements, and weak/strong Brown spanning with different generator counts. |
| IKLNDP24 lines 3454–3684, 3844, 3949–4063, 4114, 4453, 4531, 4656, 6420–6540, 6766 | Inverse twist, merged polynomial-prefix pairs, descent, character splitting, normalised period relations, all-weight alternating basis, direct spanning through 2q−2. The Note supplies the corrected endpoint family. |
| IKLNDP-NOTE lines 191–264, 970–1350, 1739–1840 | Explicit direct indices, prefix-closure range, Theorem 1.6, shortlists and the two-row argument. Line 1836 consumes the extra nonproportionality isolated in S02. |
| CHANG14 lines 189–244, 329–420, 614–674, 733–918 | Algebraic-coefficient grading, MZ data and descent, convergence versus nonvanishing domains, entire-series argument, specialisation and MZ properties of values. The zero-coordinate prefix gap is bypassed explicitly in the package. |
| CPY19 lines 245–274, 275–331 | Constant denominator and polynomial-tuple specialisation. Rational matrices, not polynomial matrices, are required in Proposition 2.2.1. |
| THAKUR09R lines 274–291; LRT14 lines 105–185 | Fundamental relation and next-weight relation, with ℓ₁=−D₁. Both signs give residual zero at d=0 for odd q as well as q=2. |
| THAKUR09P lines 445–465; SHEATS98 lines 85–130 | General-q nonvanishing route and the degree/minimal-decomposition background for the declared supplier gap. No prime-only recursion is substituted for the general contract. |
| THAKUR10 lines 205–255; THAKUR-UPDATES lines 276–291, 305–360 | Higher-depth product theorem and Shi's corrected mixed-product-first induction. The roadmap uses the correction. |
| CH21 lines 593–643; AT09 lines 147–206 | Anderson–Thakur indexing and ordinary/alternating interpolation, twist and period conventions. The base-q digit upper bound in AT09 needs the correction below. |
| PAP08 lines 346–357, 564–579, 1028–1039; ABP04 lines 346–366, 409–435 | Fixed-field, fundamental-matrix, ABP lifting and entire-from-equation interfaces. The determinant and nonzero-constant-term hypotheses are retained. |
| CM21 lines 149–177; CCM-ALG lines 169–184 | Weightwise specialisation alone is distinguished from the later algebra-homomorphism theorem. The ideal generated by ζ(q−1) is killed, supporting the dimension subtraction. |
| AT90 lines 738–761 | Section context and interpolation substitution are readable; displayed generating-function formulas are not extracted. See limitations below. |
| LND-ZETALIKE lines 132, 157–158 | Le–Ngo Dac, “Zeta-like multiple zeta values in positive characteristic”, HAL hal-03093398, published Math. Z. 301 (2022), 2037–2057: Theorem 1.3 excludes (q,q−1), since its parameters i=q,j=1 violate i≤j. Its introductory sign error is independent of this classification. |

Ownership was searched by mathematical object with `roadmaps grep`, then against active and completed roadmaps on content main, board packages and all 55 supplied sibling folders. The direct filesystem search inspected 672 README/Suggested files, including package design copies; matches for relevant MZV/stuffle objects were read. No other owner of the function-field MZV/CMPL constructions, q-shuffle correction, arithmetic prefix system or basis index families was found. No other supplied Lean file declares the namespace `TauCetiRoadmap.DrinfeldModulesAndTModulesPartII`. The generic constructions remain with their existing owners; no ownership move is proposed in this review.

Twenty-one cited section locators across four extant roadmaps were resolved at their supplied version:

- `TauCetiRoadmap/RestrictedPowerSeries/README.md:193`, :207, :224, :247, :264, :306, :723: §§0.1–0.3, 1.1–1.2, 2.1 and 7.2. Its general entire-series target is distinct from arithmetic E; evaluation at θ requires an entire or sufficiently large-radius series.
- `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:1989`, :2014, :2040, :2062: PS.9.1–9.4 at the supplied open head. PS.9.2 has ℚ-bilinear stuffle and integer multiplicity lists, but does not yet state the full arbitrary-coefficient integral theorem. The declared gap is needed; the package does not re-own generic stuffle.
- `TauCetiRoadmap/FunctionFieldArithmetic/README.md:434`, :547, :666, :797, :980, :1693: Layers 0–5 exist and concern the distinct global-field/divisor-zeta objects identified in the scope boundary.
- `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:163`, :537, :895, :1176: Layers 0–3 exist and own the stated bundle/shtuka/cohomology material; none supplies the MZV period construction.

The citation resolver, against content main 546d9e4 and its 354-open-roadmap index, returned no unresolved roadmap citation or Lean name. Its library check was unavailable in that service environment; the library claims were instead verified manually in the actual pinned checkouts. Mathlib is pinned at 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

| Pinned file / declaration | Native meaning and limiting hypothesis checked |
|---|---|
| `Mathlib/Combinatorics/Enumerative/Composition.lean:101`, :155, :162, :217, :1033 | Positive blocks with fixed sum; blocksFun, sum_blocksFun, sizeUpTo and composition_card. Empty weight zero has one composition. It imposes no real-MZV admissibility. |
| `Mathlib/Algebra/Polynomial/Degree/Defs.lean:59`, :454 | Monic is `leadingCoeff p = 1`; nontrivial coefficients imply p≠0. No zero denominator is hidden by natDegree. |
| `Mathlib/FieldTheory/RatFunc/Valuation.lean:81`, :97, :103, :108, :138 | Integer-multiplicative infinity valuation; X maps to exp(1), X⁻¹ to exp(−1); completion derives Field and Algebra K. The real q-normalisation is extra mathematical notation. |
| `Mathlib/FieldTheory/Finite/Basic.lean:266`, :290, :333 | card' gives a positive prime power; sum_pow_units gives −1 or 0; frobeniusAlgHom raises to the full field cardinality. It does not assert K itself perfect. |
| `Mathlib/Algebra/Polynomial/Eval/Defs.lean:380`, :533 | comp and mapRingHom distinguish θ-substitution from coefficientwise twist. |
| `Mathlib/Data/Nat/Choose/Basic.lean:50` | Natural binomial recursion with zero above the top index, matching the correction coefficient. |
| `Mathlib/Data/Finsupp/Defs.lean:88`; `Mathlib/Data/Finsupp/Single.lean:47` | Finite support and single; zero coefficient has empty support. No stuffle multiplication is supplied by these declarations. |
| `Mathlib/LinearAlgebra/Span/Defs.lean:46`; `Mathlib/LinearAlgebra/LinearIndependent/Defs.lean:98` | span is the least submodule; independence is injectivity of finite linear combinations. Neither builds independence into a span. |
| `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61` | finrank is Cardinal.toNat of rank; infinite dimension would produce zero. The Frobenius headline explicitly asserts Module.Finite. |
| `Mathlib/Algebra/Algebra/Operations.lean:214`, :222; `Mathlib/Order/SupIndep.lean:328` | Product submodule and mul_le; independent family of submodules. These generic facts do not prove the MZV closure or grading. |
| `Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:89`, :142 | HasSum/tsum are the additive declarations of the finite-subset convergence definitions. A totalised sum is not evidence of convergence; the package has separate convergence targets on the actual completion. |
| `TauCeti/RingTheory/PowerSeries/TateAlgebra.lean:63`, :76, :80, :94, :105, :138 | Positive-radius ultrametric normed-ring context, Gauss norm, coefficient bound, norm_C, norm_X and completeness. norm_X additionally needs NormOneClass. Arithmetic twisting and the finite coefficient-extension condition are absent. |

Object searches in these pins found no Carlitz, function-field multizeta or stuffle implementation to cite in place of the package's arithmetic targets. This is a claim about the pinned libraries only.

### Declared gaps and build direction

All 14 slugs occur both in `design/plan.json` and in the required “What … must provide (gap:…)” form in the README. Suppliers and sections agree. No supplier is `none`. Each contract has a specified arithmetic object, hypotheses and output; the related laws in a carrier contract concern that one carrier rather than unrelated tasks. Searches found no existing implementation making these contracts redundant. The elementary Carlitz denominator body in Suggested.lean does not supply the missing nonvanishing, recursion and analytic norm theorems.

| Gap slug | Supplier section | Precision / minimality witness |
|---|---|---|
| general-power-sum-degree | DrinfeldModulesAndTModules DM.6 | k≥1,d≥0, every prime power; S₀(k)=1 and q=4,S₁(1) has degree −4. Small-exponent identities alone do not cover arbitrary k. |
| anderson-thakur-generating-series | DM.6 | Equality in K[[x]], all d≥0, explicit γ and products. At d=0 both sides (1−x)⁻¹; d=1 both are (ℓ₁+x^q−x)⁻¹. |
| v-adic-mzv-specialisation | DM.6/v-adic-special-values | Every finite place and weight, algebra map, ζ(q−1)↦0. CM21 gives the linear map; CCM-ALG gives the stronger multiplicative contract. |
| parent-carlitz-products | DM.0/carlitz-products | d=0 gives 1; d=1 gives ℓ₁=−D₁≠0; analytic norms are not supplied by the native body. |
| parent-period-analytic-field | DM.2 | Entire exponential and logarithm on the stated open disc; boundary term norms do not tend to zero. Kernel is the specified π̃A lattice. |
| parent-carlitz-omega | DM.2/omega | ρ↦ξρ multiplies π̃ by ξ; (q−1)-st power unchanged. v(π̃)=−q/(q−1), so arbitrary rescaling is excluded. |
| parent-effective-dual-motives | DM.4/inverse-twist-dual-motive | Finite-free K̄[t] matrices and power-torsion cokernel; rank-zero trivial object allowed. K̄[σ]-finiteness is deliberately absent. |
| parent-twisted-analytic-rings | DM.8 | Twist fixes t, sends θ to θ^q; norms become q-th powers. Fixed Tate coefficients lie in F_q and tend to zero, hence only finitely many are nonzero. |
| parent-abp-interface | DM.8/abp-lifting | det=c(t−θ)^m, c≠0, entire vector; P(θ)=ρ and Pψ=0. Zero determinant is excluded. |
| abp-entire-from-equation | DM.8/entire-from-equation | det Φ(0)≠0 plus Tate solution implies E. Depth-one Φ has det Φ(0)=−θ≠0. |
| frobenius-constant-denominator | DM.8/constant-denominator | Φ₁=Φ₂=1,U=1/t has denominator t∈F_q[t]; U=1/(t−θ) fails the twist equation. |
| frobenius-fundamental-matrix | DM.8/fundamental-matrix | C=Ψ⁻¹Ψ′ is uniquely determined and fixed; Ψ′=Ψ gives C=Id. Rank zero gives the unique empty invertible matrix. |
| parent-small-power-sums | DM.6/small-power-sum | Exactly 1≤n≤q; d=0 gives 1=1, while q=3,n=4 has different leading degrees −6 and −12. |
| integral-positive-index-stuffle | PeriodsAndSpecialValues PS.9.2 | [1]*[1]=2[11]+[2] over ℤ; coefficient 2 becomes 0 in F₂, stays 2 in F₃. No map ℚ→F_p provides this specialisation. |

The requested dependency check at this head returned its complete output:

```text
depcheck: 56 roadmaps, 643 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. This graph check does not detect the internal missing input S02. The `origin/main...HEAD` diff touches only `packages/DrinfeldModulesAndTModulesPartII/`; its plan change is confined to the top-level gaps list. README and docstrings contain no pull-request numbers or process narrative, and no computational algorithm is proposed as a deliverable.

## Not verifiable

- AT90 formulas (3.6.4), (3.7.1), (3.7.3) and (3.7.4) are missing from the supplied text extraction at AT90 lines 738–761. The surrounding proof and substitution are readable, and AT09/CHANG14 independently state interpolation; the d=0,1 generating-function controls pass. This pass does not certify those missing displays. The work already has a certified legal cache entry, so no replacement key or missing-source request was created.
- No fresh Lean elaboration was run. All 34 supplied elaborated signatures were inspected, but this is not a fresh build result. No Lean source changed.
- The 14 supplier contracts are accepted conditionally as instructed; this review does not certify their future implementations or treat the absent parent sections as existing code.
- The source passages were checked in the specific cached manuscript versions. Published numbering was not independently checked against paywalled journal versions; the README gives its preprint numbering conventions.
- The long all-weight determinant and character-elimination proofs were checked against their statements, needed proof steps and recorded small cases, not recomputed coefficient by coefficient in every weight.
- Ownership against the 55 supplied open sibling folders, content main and board packages was checked. Other open work was searched through the roadmap index but not individually inspected beyond matching text; there is no claim about unpublished or inaccessible work.
- The previous pass-b source-issue claim about CHANG14's ambient k∞ is not re-certified: the extraction loses overbars, including in its notation list at CHANG14 lines 179–182. The current package states its C∞ carrier explicitly, and its use of the general MZ argument was checked directly.

## Source issues

- **Misprint** in CCM23 at §2.2, printed p.7 (CCM23 line 329): the source says the power in the definition of S_d(s) is d; it should be s; affects a stated result.
- **Misprint** in CCM23 at (2.3.2), printed p.9 (CCM23 line 421): the source says an unbound k is tested for divisibility by q−1; it should be the summation index j; affects a stated result.
- **Misprint** in CCM23 at Definition 3.1.1, printed p.10 (CCM23 line 502): the source says box-plus is a linear map on H⊕H; it should be bilinear on H×H, since separate zero inputs vanish while a pair of nonzero inputs need not; affects a stated result.
- **Error** in CCM23 at the identities after Definition 2.2.2, printed p.8 (CCM23 lines 354 and 378): the source says tail factorisation holds at every integer cutoff with its empty convention; it should be restricted at cutoff zero, or use empty truncated value one, since an empty tail otherwise gives 0≠1; affects a stated result.
- **Misprint** in CPY19 at Proposition 2.2.1, printed p.6 (CPY19 line 248): the source says the rationalised-module map has a polynomial matrix; it should be a rational-function matrix, as multiplication by 1/t between trivial modules demonstrates; affects a stated result.
- **Misprint** in ND21 at §2.2, printed p.9 (ND21 line 477): the source says the summand defining B* uses R(d); it should be R(j), where j is the variable being summed; affects the proof.
- **Error** in THAKUR10 at proof of Theorem 3, printed p.1979, fourth equality (THAKUR-UPDATES lines 308–355): the source says the displayed equality follows from the shuffle induction; it should be replaced by the corrected induction establishing the mixed-product identity first at each depth; affects the proof; corrected in print at THAKUR-UPDATES entry 36, pp.7–8.
- **Gap** in CHANG14 at proof of Lemma 5.3.1, printed p.15 (CHANG14 lines 774–784): the source says whole-tuple decay puts every prefix series in the Tate algebra; it should be supplemented by a zero-coordinate case: Q=(θ²,0), q=3, s=(1,1) has zero full terms and divergent first-prefix terms; affects the proof.
- **Misprint** in CHANG14 at proof of Lemma 5.3.1, printed p.15 (CHANG14 line 750): the source says ABP Proposition 3.1.1 supplies entire-ness from the functional equation; it should be ABP Proposition 3.1.3, since 3.1.1 is the lifting theorem; affects the proof.
- **Misprint** in AT09 at §2.3, printed p.4 (AT09 lines 195–196): the source says a base-q digit may equal q; it should be strictly less than q to give the stated unique expansion; affects a stated result.
- **Misprint** in LND-ZETALIKE at §1.2, printed p.3 (LND-ZETALIKE line 132): the source says D₁ζ_A(1,q−1)=ζ_A(q); it should be D₁ζ_A(1,q−1)=−ζ_A(q), since at q=3 their leading terms are −1 and 1; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "34d07525c82d4a8799ff98905d0bfe878dc65093", "job": "RT-DrinfeldModulesAndTModulesPartII~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
