<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1547#issuecomment-6483922740 -->
Red team round 2 pass a (codex) of 66aaeba

Verdict: needs_changes

1. **F01** (P1) The crystalline-family proof asserts an impossible smooth map

   **Location:** packages/TriangulineVarietyAndItsLocalModel/README.md:1091 (§8.6 proof), “the Frobenius matrix and the Hodge filtration define a smooth morphism to (Res GL_n×Flag)^rig”; the flag-map construction at :1085 and its use in §8.7 depend on this argument.

   **Claim:** Choosing a period basis on the framed crystalline representation space produces the stated smooth map to the space of Frobenius matrices and Hodge flags.

   **Witness:** Take n=1 and K/ℚₚ unramified quadratic, weight zero, trivial residual character. Crystalline lifts have dimension 1; Res_(K₀/ℚₚ) G_m has dimension 2. A smooth map from this nonempty curve to that smooth surface is impossible.

   **Explanation:** A representation frame is not a period frame. In this example the φ-matrix has coordinates (a,b); only their product is the varying crystalline eigenvalue. Changing a period basis varies their ratio. Choosing a section discards that extra direction. The source makes the same unsupported step: BHSsmooth17 lines 447–453, printed p. 11. The subsequent BHS19 lines 3061–3068 invoke it for the Hodge-flag map. Neither citation supplies the missing frame directions.

   **Exact repair text:** “Let P→X^(k-cr)_(r̄) be the torsor of bases of the family D_cris over K₀⊗E, of relative dimension [K₀:ℚₚ]n². On P the Frobenius matrix and Hodge filtration define the smooth period morphism to (Res_(K₀/ℚₚ)GL_n×Flag)^rig; its relative dimension is n². Over the ordered distinct-eigenvalue locus, use the torsor of bases adapted to the ordered Frobenius flag. On this torsor the Hodge-flag morphism is smooth. Bruhat conditions are invariant under changes of adapted basis, so their inverse images descend to the refined crystalline space. Prove the Bruhat-closure equality on this torsor and descend it along the smooth surjective torsor map.” Replace the unframed h assertion and the §8.7 proof's appeal to its smoothness by this framed construction; include the frame torsor and smooth period comparison among §8.6's explicit targets, using LocalGaloisDeformationRings §3.6 for the deformation comparison.

   **Retest:** In the witness, dim P=1+2=3 and the matrix target has dimension 2, leaving relative dimension 1=n². The flag target is a point. The repaired comparison retains both independent period-frame coordinates and has no negative relative dimension.

2. **F02** (P2) The companion criterion omits the supported crystabelline generality

   **Location:** packages/TriangulineVarietyAndItsLocalModel/README.md:1125 (§8.7), “Let r be crystalline”; Suggested.lean:30–33 inventories only the crystalline companion criterion.

   **Claim:** The roadmap's companion theorem is limited to crystalline representations and unramified smooth parameters.

   **Witness:** BHS19 lines 3098–3101 (Remark 4.2.4, p. 377) explicitly extends the criterion to de Rham representations satisfying Remark 3.7.9, hence generic crystabelline representations. A nontrivial ramified finite-order rank-one character is in this larger domain and outside §8.7.

   **Explanation:** The binding general-library requirement prohibits narrowing below the generality supported by the source. The package already has finite-descent filtered modules and generic smooth-character parameters in Layers 10–13; the missing case is not unsupported conjectural theory. Twisting a generic crystalline representation by a ramified finite-order character gives a higher-rank witness with the identical flag positions and Bruhat inequalities but nontrivial inertia.

   **Exact repair text:** “Let r be a generic regular crystabelline representation, with distinct labelled Sen weights h, increasing at each embedding, and an ordered smooth-character refinement φ=(φ₁,…,φ_n) of its split Weil–Deligne representation, with φ_i/φ_j∉{1,|·|_K} for i≠j. Define w_x by the relative position of this refinement and the Hodge flag. For w∈(S_n)^Σ put x_w=(r,z^(w(h))φ). Then x_w∈X_tri(r̄) if and only if w_x≤w. (BHS19 Theorem 4.2.3 and Remark 4.2.4, pp. 375–377.)” Extend §8.6's refined-space argument to fixed finite inertia/descent data using LocalGaloisDeformationRings §§3.4–3.6 and PadicHodgeTheory §5.2. Keep its crystalline construction as the trivial-inertia specialization. Name the general companion theorem in the Lean module docstring, with its missing potentially crystalline period and refinement carriers.

   **Retest:** For n=1 and ramified finite-order χ, h=0, φ=χ, w_x=w=e. Both sides are true: x_e=(χ,χ) is its unique rank-one trianguline point and e≤e. For a common ramified twist of a rank-two generic crystalline example, all character ratios and relative positions remain unchanged, so the existing S₂ checks still give two companions when w_x=e and one when w_x=s.

3. **F03** (P3) The recorded library revisions are not the pins

   **Location:** packages/TriangulineVarietyAndItsLocalModel/README.md:47, “The pinned library revisions are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.”

   **Claim:** These identify the libraries against which the acceptance test and supplier audit are made.

   **Witness:** lake-manifest.json instead pins Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2 and TauCeti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. Read-only `git rev-parse HEAD` in both library checkouts returns those same manifest revisions.

   **Exact repair text:** “The pinned library revisions are Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a.”

   **Retest:** Both replacement strings equal both their manifest values and their checkout heads. The eight explicitly named Mathlib declarations remain present at these actual pins.

4. **F04** (P3) The blockwise derivative subspace lacks a third Check

   **Location:** packages/TriangulineVarietyAndItsLocalModel/README.md:1721, “Its compatible-refinement derivative image is Hom_(P,g')=Hom_sm(T(K),E)+sum_i{psi_i o det_i}”; :1729–1733 has only two Checks.

   **Claim:** This defines the blockwise derivative subspace used in the paraboline comparison.

   **Witness:** The two Checks treat only blocks (2,1). Neither tests the one-block or singleton-block extremes. The binding definition contract requires at least three discriminating Checks.

   **Exact repair text:** Add: “For n=2,d=2, P=G has derivative-image dimension 2+2=4 and excludes (log_σ,0), whereas P=B has dimension 2+2·2=6 and includes (log_σ,0). Thus a block may share its logarithmic derivative without forcing equality between different blocks.”

   **Retest:** Smooth characters contribute two dimensions. One block adds two logarithmic directions; two singleton blocks add four. The difference of the two coordinates has nonzero σ-derivative in the displayed tuple, excluding it precisely for P=G.

5. **F05** (P3) The repaired frame Check still fails for a nilpotent matrix lift

   **Location:** packages/TriangulineVarietyAndItsLocalModel/README.md:163, “For N with [N,B]≠0 the matrices N and N+ε[N,B] differ and no compatible isomorphism exists”.

   **Claim:** Nonzero commutator alone distinguishes the two framed objects over the dual numbers.

   **Witness:** In A=E[ε]/ε² take N=εE₁₂ and B=diag(1,0). Then [N,B]=−εE₁₂≠0 but ε[N,B]=0. Hence the matrices coincide; I+εB commutes with N and gives the compatible frame transport.

   **Exact repair text:** “The matrices differ exactly when ε[N,B]≠0. In particular, for constant matrices N,B over E with [N,B]≠0, they differ. For N=εE₁₂ and B=diag(1,0), the commutator is nonzero but ε[N,B]=0, and the two framed objects are isomorphic.”

   **Retest:** The constant test N=E₁₂ gives −εE₁₂≠0 and remains nonisomorphic. The Artinian test N=εE₁₂ gives −ε²E₁₂=0 and isomorphic objects. This is a residual defect in the repair of pass-a F08, not a challenge to the matrix deformation model.

## Verification of the previous findings

All eleven prior finding entries were compared with the repaired head, independently of the repair report's status. Pass-a F05 and pass-b F03 concern the same repair. None was marked not actionable. The quotations below are from the package, not the sources.

| Earlier finding | Repaired passage and location in packages/TriangulineVarietyAndItsLocalModel | Status and recomputed witness |
|---|---|---|
| a F01, reciprocity | README.md:31, “Art_K(x)=rec_arith(x)⁻¹”; §4.1 uses “NT's geometric normalization of Art_K” | Repaired. At ℚ₃, arithmetic eigenvalue 2 gives δ(3)=1/2; inversion recovers 2. Cyclotomic restriction on units is u, and at 3 is 1. NT21 lines 261–263 confirms the direction. |
| a F02, undefined endpoint derivative | README.md:1967, “φ_end=(φ₁,…,φₙ₋₁) and T_end=(G_m)^(n−1)” and “κ_end,D₁(ι⁻M)=κ_end,C₁(ι⁺M)” | Repaired. For n=3 both sides have two coordinates, (ψ,ψ) for a scalar deformation; (ψ₁,ψ₂) differs from its reversal when ψ₁≠ψ₂. Ding25 lines 1197–1203. |
| a F03, absent almost de Rham hypotheses | README.md:715, “W⁺=W_dR⁺(D) is almost de Rham”; :733 adds “a locally algebraic parameter δ∈T₀ⁿ” | Repaired. Rank-one weight 1/2 gives D_pdR=0 and no frame; x² gives rank 1. T₀¹ alone imposes no condition. BHS19 lines 2251, 2305, 2321. |
| a F04, modified class excluded | README.md:1363, “weakly decreasing at every embedding”; the same paragraph separates regularity | Repaired. (3,1,0) is strict; the modified off-σ tuple (0,0,0) is weakly decreasing but not strict. Both objects now lie in their named classes. Ding25 lines 450–457, 554. |
| a F05, omitted headline inventory | Suggested.lean:13–20, “Ordinary-flag dictionary and strictness and uniqueness”, “The three rank-two de Rham triangulation cases”; :39–41, “Surjectivity of single-embedding modification” | Repaired. Each formerly omitted headline is named with its missing carrier. Zero stand-in declarations were introduced. The actual pin search still finds no native Robba/period/refinement carrier for these statements. |
| a F06, family supplier | README.md:1087, “families of filtered φ-modules and the specialization comparisons come from LocalGaloisDeformationRings §3.5” | Repaired as a citation. The supplier actually includes these families. Arithmetic Frobenius 1+ε gives crystalline eigenvalue 1−ε, since their product is 1. The separate smoothness error in the proof is S01. |
| a F07, undefined D₂,σ Check | README.md:2189, “ψ=log_τ with τ≠σ has τ-derivative 1” | Repaired. log_τ has off-σ derivative 1 and fails the σ-analytic condition; log_σ has off-σ derivative 0 and passes. In both cases ψ−ψ=0, so cancellation alone does not suffice. |
| a F08, frame-change Check | README.md:163, “the two framed objects are isomorphic and both have matrix 0” | Partly repaired. N=0 gives fN=Nf=0. With N=E₁₂ and B=diag(1,0), [N,B]=−E₁₂ and N+ε[N,B]≠N. In rank 1, 0 and ε remain nonisomorphic framed operators. The additional unrestricted nonzero-commutator assertion fails for N=εJ: see S05. |
| b F01, nontrianguline scope | README.md:19, “when V is moreover de Rham” qualifies the ∂ assertion only | Repaired. The scope now assigns P(∇)-injectivity to all the stated absolutely irreducible nontrianguline V, and adds de Rham only for ∂-bijectivity. This is an ownership boundary, not an input to a target here. |
| b F02, cycle dimension Check | README.md:1241, “dimension 3 in the ambient framed ring of dimension 8, hence codimension 5” | Repaired. At n=2,d=1: ambient=4+4=8, codimension=3+2=5, support dimension=3. At d=2: 12−8=4. |
| b F03, omitted headline inventory | Suggested.lean:13–20, same ordinary/uniqueness and rank-two bullets as a F05 | Repaired. Three rank-two cases remain in README §4.5; no scalar or abstract-flag substitute was added to Lean. |

## Statement and context ledger

There are 91 numbered README targets and 30 explicitly marked reusable interfaces. The entire 2,269-line README and entire 60-line Suggested.lean were read. Each row below records computations, including negative controls; it is not a claim that a finite example proves the general theorem. ε²=0, J=E₁₂, and dimensions are over E unless indicated. The rank-n trianguline setting has n≥1, characteristic-zero coefficient field E, finite K/ℚₚ of degree d≥1, and E containing its embeddings. Thus the zero coefficient ring, d=0, equal-characteristic coefficients, inseparable K/ℚₚ and q=1 are outside that setting. The Artinian coefficient rings retain residue E and may be nonreduced. Layers 10–13 assume generic all-refinement noncritical crystabelline D of rank n≥2; modified D_σ has weakly decreasing off-σ weights. Zero maps and zero extension classes are allowed and are tested below.

| Suggested.lean declaration | Section / variables / instances | Computation and disposition |
|---|---|---|
| None | Empty namespace; no variable, instance, definition, theorem, example or #check declarations | Declaration count=0; sorry-data count=0; padding count=0. No signatures exist to elaborate. No Lean command was run. The module docstring names 18 headline groups and their missing carriers; the broader companion group must change under S02. |

| README statement | Instances and computed values | Result / change |
|---|---|---|
| Conventions | Q₃: ε_cyc(3)=1, ε_cyc(u)=u; t-lattice Fil⁻¹=E, Fil⁰=0. Arithmetic eigenvalue 2 gives geometric value 1/2. | Sign and reciprocity consistent. |
| Herr convention / supplier interfaces | φ=2, γ=3: d⁰(1)=(1,2), d¹(1,2)=2−2=0; d¹(1,0)=2. Swapping coordinates negates d¹. n=2,d=2: period frame dimension 8, representation frame 4. | Normalizations discriminate the swapped complex and the two frames. |
| 1.1 deformation groupoids | Over E: one base deformation, identity residual marking; over E[ε], rank-one ν=0 and ν=ε differ. N=0 admits frame transport I+εB; J and B=diag(1,0) give [J,B]=−J. | Constant-matrix tests pass; the nilpotent-matrix lift fails the last Check (S05). |
| 1.2 matrix model | Rank-one ν=ε has ν²=0 but characteristic polynomial X−ε≠X. n=2,d=2 has 8 frame coordinates, not 4. | Correctly uses full matrix completion, not the scheme-theoretic nilpotent cone. |
| 1.3 filtered weights | Upper triangular matrix with diagonal (ε,2ε) has ordered Cartan (ε,2ε); reversing the flag reverses these entries. Rank 1 gives κ=ν=ε. | Weight order retained. |
| 1.4 first resolution | n=2,d=1: flag dimension 1 plus upper triangular dimension 3 gives 4; n=1,d=2 gives 0+2=2. | Dimension formula passes. |
| 2.1 lattice filtration | Unit lattice has Fil⁰=E, Fil¹=0; t times that lattice has Fil⁻¹=E, Fil⁰=0. | Shift sign excludes t⁻¹ convention. |
| 2.2 Artinian equivalence | A=E[ε]: free rank-one graded piece has E-dimension 2 and residue dimension 1. εA→A becomes zero after tensoring E; its quotient is not A-free. | Freeness hypotheses exclude the non-flat candidate. |
| 2.3 regular Hodge flag | Jumps (0,2) give successive ranks 1,2; (0,0) gives no full regular flag; jumps (1,4) still give ranks 1,2. | Regularity necessary for full flag. |
| 2.4 second resolution | n=2,d=1 gives 4; n=1,d=2 gives 2. Scalar ε is an allowed first-order operator, although its characteristic polynomial is X−ε. | Same full completion as 1.2. |
| 3.1 generic tuples | n=1 has zero pairs and both conditions are vacuous. In rank 2 ratios 1 and ε_cyc hit the excluded algebraic/twisted-algebraic cases. | Ordered and unordered generic conditions distinguished. |
| 3.2 localized parameters | δ and δx have isomorphic t-localizations; δ and δ(1+ε log) have derivatives differing by ε and cannot be identified as constant-weight deformations. | Localization loses integral shift, not infinitesimal derivative. |
| 3.3 torsion rank one | k=0 quotient=0. For k=1, the weight-zero quotient contributes one invariant and one degree-one class; a nonmatching weight contributes 0. | Zero and nonzero torsion cases retained. |
| 3.4 period realization | D and tD have the same localization, but positive lattices differ by t. A free rank-one realization and free lattice glue to rank 1. | Both lattices needed; localized data alone fails to distinguish them. |
| 3.5 Cartan equality | δ=x²(1+ε log) has infinitesimal weight ε and period Cartan ε; a finite-order twist has derivative 0. | Both sides match. |
| 4.1 ordered regularity | δ₁/δ₂=x is excluded, x⁻¹ allowed, 1 excluded. Slopes (1,−1) sum to 0 but neither equals 0. η(Frob_arith)=2 gives δ(3)=1/2. | Ordering and étaleness checks pass. |
| 4.2 strictness | Rank-one endomorphism invariants have dimension 1; two repeated trivial lines have dimension 2 and violate ordered regularity. | Hypothesis excludes obvious nonuniqueness. |
| 4.3 numerical condition | Weights (0,3), tested slope 2: 2<3 true; slope 3: 3<3 false. At two embeddings with gaps 3 and 1, the common slope 2 fails the second condition. | Strict inequality and all embeddings necessary. |
| 4.4 WD criterion | WD slope 2 and weight gap 3 again give 2<3; equality 3=3 fails. With two embeddings both gaps 3, both tests pass. | Same normalization as 4.3. |
| 4.5 rank-two cases | Nonzero monodromy leaves one stable refinement; split distinct Frobenius leaves two; nonsplit crystalline case has two noncritical refinements, split case has one critical refinement. | Cases distinguish flags and criticality. |
| 5.1 extension comparison | ν=0 on E² gives (dim ker,dim coker)=(2,2); ν=J gives (1,1). Zero extension maps to zero in both realizations. | Kernel/cokernel model passes. |
| 5.2 rank-one localization | Generic unr(2)x² over Q₃: H¹ dimension 1; shift k=1 comparison rank 1, shift k=2 rank 0; localized comparison vanishes in the stated exceptional direction. δ=1 has H⁰ dimension 1 and is excluded. | Exceptional hypotheses matter. |
| 5.3 filtered smoothness | First-order rank-one derivative ε matches period operator ε; replacing the latter by 0 breaks the fibre-product condition. Identity extension gives the same point on both sides. | Weight compatibility is substantive. |
| 5.4 closed flag condition | ν=0 versus J distinguish split de Rham lift from nonzero nilpotent extension. Two repeated trivial lines allow two flags but fail genericity. | Split conclusion is used on its stated locus. |
| 6.1 lattice gluing | Rank 1, weight 1/2: D_pdR=0, no rank-one frame. For x², rank D_pdR=1. D and tD give same localization but different positive lattices. | Repaired hypothesis excludes counterexample. |
| 6.2 representability | n=2,d=2: character dimension 6 minus weight dimension 4 equals n=2. T₀¹ is vacuous, while local algebraicity excludes weight 1/2. | Repaired domain and relative dimension pass. |
| 6.3 localized dimension | n=2,d=2: 8+8−2=14; n=1,d=1: 1+2−1=2. | Dimension identity passes. |
| 6.4 double flag model | n=2,d=2 gives 8+6=14; n=1,d=2 gives 2+2=4. | Matches 6.3. |
| 6.5 components | Rank 1 has one incidence component. A completed functor at a point absent from a component has zero objects, unlike the unique-component case. | Point-incidence hypothesis prevents empty completion confusion. |
| 6.6 component normality | n=2,d=2 component dimension 14; a component missing the base point gives the empty functor rather than a local domain of dimension 14. | Domain assertions apply to nonempty pointed components. |
| 6.7 weight graphs | For a 3-cycle and z=(ε,2ε,3ε), w⁻¹z=(2ε,3ε,ε), whereas wz=(3ε,ε,2ε). | Graph uses inverse, not direct action. |
| 6.8 Galois components | n=2,d=2: dim 10; adding period frame 8 gives 18=14+4. Rank 1,d=2 gives 3. | The two frame corrections agree. |
| 6.9 tangent/support | n=2,d=2: 4−8+6+8=10 in the smooth test. N=0 with equal flags has support {e,s}; distinct flags have {s}; J has a unique stable line. | Nilpotent and flag positions distinguish support. |
| 7.1 flag uniqueness | Rank 1 has one flag; two repeated trivial rank-one summands admit at least two and fail the generic hypothesis. | No unconditional flag uniqueness. |
| 7.2 analytic completion | Node E[[x,y]]/(xy) maps injectively to both normalization branches together (kernel 0); projection to the x branch kills nonzero y. | Product-over-branches gap is essential and correctly stated. |
| 7.3 root matching | Roots ε and 2+3ε give X²−(2+4ε)X+2ε. Repeated-residue roots ±ε both give X² and do not permit unique matching. | Distinct residual roots necessary. |
| 7.4 local model | n=2,d=2: 10+8=8+10=18; rank 1,d=2: 3+2=2+3=5. | Framed dimension comparison passes. |
| 7.5 normal/CM locus | Rank-one trianguline local dimension 3 for d=2 is smooth. Adding m smooth directions adds m to both tangent and Krull dimension, preserving their difference. | Smooth descent does not erase singularity. |
| 8.1 projection flatness | n=2,d=1: full-character fibre 7−4=3; unit-character fibre 7−2=5. Flat xy=t has nodal fibre at t=0, so flatness does not imply smooth fibres. | Two projections distinguished. |
| 8.2 accumulation | k′=(a+(p−1)p^m,b−(p−1)p^m) tends p-adically to (a,b) while its gap tends to +∞. At p=2 and m≥1, parity is unchanged. | Large gaps and small p-adic distance coexist. |
| 8.3 gap criterion | e=2 and valuation bound 1 require gap>2: gap 3 passes, gap 2 fails. Negative valuations are controlled by the nonnegative maximum bound. A ramified finite-order unit twist fails algebraic-on-all-units. | Boundary and finite-order conditions retained. |
| 8.4 accumulation at point | Same sequences yield arbitrarily large gaps inside a prescribed small algebraic-weight neighbourhood; a neighbourhood in a different finite-torsion component has empty intersection. | Component condition matters. |
| 8.5 tangent bound | n=2,d=1 bound gives 7. For the stated S₃ long-element test, bound 17 exceeds expected dimension 15. | Upper bound is not automatically an equality. |
| 8.6 refined crystalline space | Rank 1, unramified quadratic K: source dimension 1, claimed smooth matrix target dimension 2. Distinct rank-two roots give 2 reduced points; equal roots give 1 point of length 2. | S01; ordered-root Checks otherwise consistent. |
| 8.7 companions | S₂: w_x=e gives 2 allowable w, w_x=s gives 1. S₃: s₁≤s₁s₂ true, s₂≤s₁ false. Ramified finite-order rank-one χ gives e≤e but is excluded by “crystalline”. | S02; inequalities themselves pass. |
| 9.1 weight-fibre cycles | n=2,d=1: ambient 8, codimension 3, fibre dimension 5; d=2: 12−6=6. Rank 1,d=2: 3−2=1. | Weight fibre, not full-character fibre. |
| 9.2 KL identity | S₂ upper interval gives C_e+C_s with coefficients 1; reverse KL value P_(s,e)=0. At J only the compatible stable-flag contribution survives, unlike N=0. | Support and KL direction agree. |
| 9.3 character fibre | Rank 1,d=2: fixed full character has dimension 0; fixed unit character has dimension 1. | The closed embedding uses the full character. |
| 9.4 multiplicity problem | n=2,d=1: 8−5=3; d=2: 12−8=4. Signed cycle Z−Z=0 does not force Z=0. | Earlier dimension repair correct; conjecture not asserted proved generally. |
| 9.5 uniqueness | F₂=C₂, F₁=C₁+2C₂ imply C₁=F₁−2F₂. One zero equation alone leaves infinitely many signed solutions. | Separating triangularity gap is genuinely needed. |
| 9.6 full-character cycles | n=2,d=1 gives codimension 5, dimension 3; d=2 gives codimension 8, dimension 4. Weight/full-character codimensions differ by n=2. | Corrected codimension retained. |
| 9.7 presentation independence | Identical constituent presentations give the same coefficient 1. Two unrelated presentations need not identify their cycles. | Uses the stated parabolic equivalence. |
| 9.8 crystalline formula | Split rank-two generic case has two nonzero component contributions of multiplicity 1; absent parameters give zero fibre and zero multiplicity sum. | Matches 9.2 and 9.6. |
| 9.9 split fibre | Total dimension 7, full-character base 4, fibre dimension 3 with two components; unit-character base 2 instead gives fibre dimension 5. | No substitution of projections. |
| 10.1 Hodge classes | n=3 labels (φ₁,φ₂,φ₃) permute to (φ₃,φ₁,φ₂) but assigned ordered weights remain h. Off-σ (3,1,0) becomes (0,0,0), weak not strict. | Prior repair admits modified object. |
| 10.2 endpoints | n=3,h=(3,1,0): endpoint weights (3,1) and (1,0), each rank 2. n=2: φ₁z^(h₁) versus φ₁z^(h₂). | Ambient cutoff and labels retained. |
| 10.3 injection pencil | n=2 Hom dimension 1; n=3 dimension 2 with rank-one exceptional maps. Three distinguished lines in a two-dimensional Hom space can be pairwise independent without jointly independent. | No independence overclaim. |
| 10.4 recovery | Annihilator dimension is 1 for d=1 and 2 for d=2. Scaling injection by 2 gives same kernel and projective line. | Only line, not normalized injection, is recovered. |
| 10.5 endpoint modification | n=3, off-σ (3,1,0) becomes (0,0,0); both endpoints have (0,0). Using first endpoint's own minimum gives (1,1), a different module. | Uses ambient minimum. |
| 10.6 σ-recovery | At d=2 original annihilator dimension 2 becomes 1 after selective modification; at d=1 both equal 1. | Explains projective recovery versus multiple embeddings. |
| 10.7 rank-three parameter | a=2: normal (1,−1,1) dotted with line (1,2,1) equals 0. a=0 kills a line coordinate; a=1 kills a normal coordinate. | Noncriticality excludes both endpoints. |
| 10.8 surjectivity | d=1 modification is identity. At d=2 two different generic off-σ flags have identical modified filtration, so fibre cardinality exceeds 1. | Surjective need not injective. |
| 11.1 character derivatives | v_K gives δ′(ϖ)=1+ε and δ′(units)=1. At d=2 dimensions smooth/σ-analytic/full are 1/2/3. | Uniformizer and logarithms distinguished. |
| 11.2 refinement subspaces | Scalar logarithm has tuple (log,…,log) and is not de Rham; an unramified derivative is de Rham. Zero extension has all derivatives 0. | De Rham and de Rham-up-to-twist differ. |
| 11.3 transport/dimensions | n=3,d=1: self=10, g=4, refinement=7, character target=6, kernel=1. A 3-cycle permutes the derivative tuple rather than negating it. | Numbers match imported deformation spaces. |
| 11.4 common quotient | n=2,d=1 kernel 0, quotient 5; n=3,d=1 kernel 1, quotient 9. | Rank-two boundary and higher kernel differ. |
| 11.5 scalar twists | n=2,d=1: g dimension 2, g′ dimension 3; (log,log) passes, (log,0) fails scalar-twist condition. | Extra direction count is d=1. |
| 11.6 paraboline spaces | P=G forgets no block data; P=B retains full flag. Blocks (2,1) have graded ranks 2,1 and cumulative ranks 2,3. | Cumulative and graded ranks not confused. |
| 11.7 product formula | n=3,d=1, block (2,1): dim P=7, tangent dimension 8, quotient 7. For general d, B quotient=3d+3, G quotient=6d+3. | Products have expected extremes. |
| 11.8 blockwise twists | n=3,d=2, blocks (2,1): n+rd=7. (log,log,0) passes; (log,0,0) fails. Proposed extra n=2,d=2 test: G dimension 4 versus B dimension 6. | S04. |
| 12.1 partial condition | d=1 complement empty, so partial=full. Rank-one d=2: partial dimension 2 versus full 3; off-σ log fails partial de Rham. | Empty embedding subset interpreted correctly. |
| 12.2 partial products | n=3,d=2: partial tangent 13, block (2,1) tangent 11, common kernel 4, quotient 7=5+2. | Quotient agrees with product. |
| 12.3 modified dimensions | n=2,d=2: full 9, de Rham 2, smooth-parameter preimage 3, partial 5, B-partial 4. | Five distinct spaces not conflated. |
| 12.4 tangent modification | Zero deformation maps to zero; at d=1 map is identity. ε·id is nonzero although its residue eigenvalue is 0. | Artinian nilpotent directions retained. |
| 12.5 restricted surjectivity | n=3,d=2: kernel 3; de Rham 7→4 and partial 13→10 are onto. Full tangent 19 has image dimension 16. | Does not claim unrestricted surjectivity. |
| 12.6 modified kernel | n=2,d=2: modified common kernel 0 while original common kernel 1; n=3 modified kernel 1. | Original and modified zero spaces differ. |
| 12.7 quotient isomorphism | n=3,d=2: kernels 4→1, modification kernel 3; quotient dimensions 13−4=10−1=9. | Quotient comparison passes. |
| 13.1 push/pull | Zero injection induces zero maps; identity induces identity; multiplication of an injection by 2 scales both induced maps and preserves their images. | Functorial direction and scaling pass. |
| 13.2 exceptional images | n=3,d=1: two images dimension 2, intersection 0, sum 4. d=2: images 4, intersection 1, sum 7. n=4,d=1: 6+6−3=9. | Intersection correction essential. |
| 13.3 image rigidity | n=3,d=2: injective image dimension 5, exceptional noninjective image 4, zero image 0. Both endpoint scalar derivatives are (ψ,ψ). | Ordered endpoint repair passes. |
| 13.4 signed relation | Identity map gives anti-diagonal (1,−1); (1,1) and (1,0) are excluded in characteristic zero. Zero class gives (0,0). | Minus sign substantive, including at p=2 over E. |
| 13.5 injection recovery | ι and 2ι yield same relation and same projective line. d=1 annihilator dimension 1, d=2 dimension 2 before modification. | Does not recover a scalar normalization. |
| 13.6 higher intertwining | Opposite character twists multiply to 1. For rank 3, forgetting first versus last filtration exchanges endpoint target dimensions 2 and 5. | Targets and twist directions distinguished. |
| 13.7 two-space generation | n=3,d=2: 15+15−11=19; n=2,d=1: 4+4−3=5. | Sum equals full tangent dimension. |
| 13.8 refinement generation | n=2,d=1 two refinements span dimension 5; n=3,d=1 paraboline dimensions give 8+8−6=10, reached by six refinements. | Nonabelian S₃ case included. |
| 13.9 matched tangent relation | ψ=0 gives ([ι⁻M],[−ι⁺M]); scalar derivatives ψ−ψ=0 and multiplicative twists (1+εψ)(1−εψ)=1. | Additive and multiplicative cancellation agree. |
| 13.10 recovery presentation | n=3,d=1: middle 14, target 9, kernel 5. n=2,d=1: middle 8, target 5, kernel 3. | Exact-sequence dimensions pass. |
| 13.11 partial images | n=3,d=2: partial image dimension 3 versus unrestricted 5; n=2 partial image dimension 1 versus zero-map image 0. | Partial rigidity distinguishes zero injection. |
| 13.12 partial intertwining | log_σ has off-σ derivative 0 and passes; log_τ has derivative 1 and fails. Opposite admissible twists multiply to 1. | Partial condition survives cancellation. |
| 13.13 modified relation | n=2,d=2: endpoint quotients dimension 2 each, scalar derivative space dimension 2, middle dimension 8; modified common kernel 0. log_τ is excluded despite ψ−ψ=0. | Repaired Check discriminates the correct carrier. |
| 13.14 modified recovery | n=3,d=2: middle 14, target 9, kernel 5. | Single-embedding presentation agrees with d=1 numbers. |
| 13.15 sequence comparison | Original partial quotient 13−4=9 equals modified quotient 10−1=9; middle 14 and kernel 5 on both sides. | Vertical quotient dimensions agree. |
| 13.16 partial generation | n=2,d=2: original partial sum 5+5−4=6; modified sum 4+4−3=5. | Original and modified tangent spaces remain distinct. |

## Verified sound

**Counts and coverage.** Read 0 Lean declarations, 91 numbered README targets, all 30 reusable-interface blocks, and all 273 numbered-target Check bullets. The ledger above supplies a computed row for every target, including boundary and negative cases; S01 and S05 are failed computations. Resolved 110 distinct explicit source-line starting locators across all seven cached legal texts, and inspected their relevant theorem statements or proof context. This count counts a repeated locator once and a range by its starting line; it does not count bibliography entries as independent mathematical verifications. Compared all 12 gap sentences with design/plan.json: exact text matches, same slugs and named suppliers. Checked the 11 roadmap supplier families under “Exact supplier contracts”, three further scope owners, and the downstream Hodge-parameter consumer: 15 roadmap families in total. The main ownership search and the supplied open-head search found no second owner for this package's deformation adapters or higher-intertwining recovery; foundational carriers remain assigned to their cited suppliers.

**Headline inventory.** The acceptance-test inventory covers the period and lattice completion equivalences (§§1.2, 1.4, 2.2–2.4), ordinary/ordered-regular results and rank-two classification (§§4.1–4.5), filtered period smoothness (§5.3), double-flag and Galois component comparisons (§§6.4–6.9), analytic local model and normality/CM (§§7.4–7.5), flatness/accumulation/tangent bounds/companions (§§8.1–8.7), weight-fibre KL and crystalline full-character multiplicities (§§9.2, 9.8), injection recovery and selective-modification surjectivity (§§10.4, 10.6, 10.8), simultaneous-refinement and paraboline products (§§11.3, 11.7), partial tangent comparison (§§12.5–12.7), injection rigidity, intertwining, refinement generation and recovery sequences (§§13.3–13.16). The actual pins contain no Robba, trianguline, crystabelline or corresponding period-moduli carriers found by object searches. Replacing these with matrices, free predicates or bare linear maps would not state the headlines. Consequently the empty Lean namespace is justified; its missing-carrier inventory needs only the generality correction S02. The padding probe has zero declarations to test.

**Pinned declarations.** At the actual manifest revisions, Mathlib/LinearAlgebra/Prod.lean:95 pairs two linear maps with common source; Mathlib/Algebra/Module/Submodule/Range.lean:57 uses existence of a preimage, and Mathlib/Algebra/Module/Submodule/Ker.lean:59 uses mapping to zero. None includes a topological, period or saturation condition. Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean:53 requires finite-dimensional summand subspaces for the sum/intersection formula; :173 requires finite-dimensional source for rank-nullity. Mathlib/RingTheory/AdicCompletion/Basic.lean:171 constructs the compatible inverse system; Mathlib/RingTheory/Length.lean:30 returns ℕ∞, so finiteness is needed before integer conversion; Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44 is the locally finitely supported function carrier, without a codimension restriction. All eight declarations cited by name are present, with the limitations described in the README. No fully qualified declaration collision is possible in an empty Suggested.lean.

**Supplier resolution and ownership witnesses.** The current resolver reports no cross-roadmap citation and no roadmap Lean name found nowhere. Its generic message that external Lean names were not checked was not treated as verification: the local pinned files were checked separately. The checked contracts include:

| Owner and current section/target | Content verified and boundary |
|---|---|
| TauCetiRoadmap/PadicHodgeTheory/README.md §§3.2, 4.3–4.5, 5.2, 6.3 | Tate filtration sign; coefficient periods, B-pairs, `fullRankQuotient_H0`, filtered modules and modifications. Artinian extensions and partial local-condition formulas remain declared gaps. |
| TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md §§1.0c, 1.1–1.2, 3.1, 3.4a, 3.8–3.9, 4.0, 7.1–7.8 | Robba/Herr/Ext carriers, sign convention, finite Gamma torsion, full character spaces, Artinian weights, saturated/strict flags and global triangulation. No second character-space carrier is introduced here. |
| TauCetiRoadmap/LocalGaloisDeformationRings/README.md §§0.4, 1.1, 1.4, 1.12, 1.18, 1.23, 3.4–3.6, 3.10 | Framed lifting, coefficient completion, scalar-endomorphism noncritical deformation dimensions, family periods and filtered deformation comparison. §3.5 supplies families; §3.6 alone is not their construction. Nφ=pφN gives p·e₁ on both sides for φ=diag(1,p), Ne₂=e₁. |
| packages/SpringerResolutionAndCharacteristicCycles/design/README.md F, G, I, C, N, S, Y, K, P, T, E | Named flag/incidence targets, characteristic-zero normality/CM, pointwise flatness, inverse Weyl graph, positive simple cycles, KL direction, tangent upper bound and completed cycles. In particular no false normality of all Steinberg components is imported. |
| TauCetiRoadmap/SchemeAndStackFoundations/README.md §§0.16–0.17, 0.21, 4.3–4.5 | Catenarity, finite-module depth/CM, excellence, residue-preserving Artinian functors, hulls and representability. These are foundational imports, not new targets here. |
| TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md §§1.6–1.9, 1.11, 1.13–1.14, 2.1–2.7 | Labelled coefficients, small extensions, formal presentations, fixed bases, completion, obstructions. Period and representation frame dimensions stay distinct. |
| TauCetiRoadmap/RigidAnalyticGeometry/README.md §§1.2, 7.3, 8.1–8.3 | Affinoid excellence and componentwise dimensions, normal identity principle, classical completed stalks, analytification and rigid–adic transport. The three additional openness/normalization contracts are explicitly gaps. |
| TauCetiRoadmap/AdicSpacesPartII/README.md R1.1, R1.5, R1.7, R1.9 | Classical local-completion and rigid–adic interfaces use the same rigid carriers. No blanket equivalence beyond the stated quasi-separated setting is imported. |
| TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md §5.2a | Reduced trianguline closure and regular locus are stated within §5.1's global setting. The separate unrestricted local contract correctly removes those conditions and includes the full-character smoothness assertion. |
| TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md §4.3 | Ordered NT-regularity excludes x and 1 in the forward ratio but allows x⁻¹. The package adds strictness and the numerical criterion rather than reconstructing that predicate. |
| packages/LocallyAnalyticRepresentationsOfLocalGroups/design/README.md LR.4/principal-series and LR.5/orlik-strauch-* | Actual induced representations, exactness, irreducibility, finite-length Jordan–Hölder data and products exist as named targets. The GL_n case retains p=2,3; non-type-A restrictions are not transferred to GL_n. Additional all-family triangularity and convention matching are declared gaps. |
| TauCetiRoadmap/LocallyAnalyticDistributions/README.md §3.3; TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md §3a.1 | Distribution adapter consumes the PhiGamma character carrier; measure-space points and functions do not construct another rigid space. At p=2 the sign group has 2 elements and the analytic factor is 1+4ℤ₂. |
| packages/PadicLocalLanglandsForGL2QpPartII/design/README.md §1.2 and design/plan.json GR.1/nontrianguline-differential-control, on board origin/main | P(∇)-injectivity does not assume de Rham; ∂-bijectivity does. The target ID maps to §1.2 in the plan. This is an excluded ownership boundary, not an upward input. |
| packages/PadicHodgeParametersInLocallyAnalyticRepresentations/design/README.md TR1–TR5 | This later consumer explicitly requests the present Hodge endpoints, tangent quotients, partial modification and recovery relations. It is not used as a supplier here. |

Searches by object covered main, Completed, the board's package READMEs and the roadmap service's current open-head index, including the supplied potentially overlapping PadicExtensionFamilies and AdmissiblePairsAndPadicHodgeStructures checkouts. Their presence did not change the above ownership allocation. No mathematical construction was moved to another owner by this review; S01 requires completing the period-frame adapter here, using the already assigned filtered deformation comparison.

**Dependencies and policy.** The internal Needs scan found 178 explicit local section references, all strictly earlier than their consumer. The prescribed dependency check returned:

```text
depcheck: 186 roadmaps, 1220 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The actual output is recorded, rather than reusing the previous round's smaller graph. All twelve gaps have named earlier suppliers; their additional clauses concern the same specified interface, carry hypotheses and do not ask this package to reconstruct an imported foundation. The general multiplicity existence statement remains explicitly conjectural. No build, git write or external posting was performed. The pre-review diff contains nine files, all in packages/TriangulineVarietyAndItsLocalModel. The target README and Lean file contain no computational algorithm, forbidden option, admitted data, or process narrative requiring a separate finding. The Lean file has its single import Mathlib and the required namespace.

## Not verifiable

- No Lean elaboration or build was run, as required. There are no declarations, so the requested per-declaration signature comparison has zero cases; there is no unexamined signature hidden by this restriction.
- Completion of the twelve declared supplier gaps is not verified. Their matching declarations, hypotheses and ownership were checked; downstream claims remain conditional on delivery of those contracts.
- The finite-instance ledger and source comparison do not certify complete proofs of the 91 future theorems. In particular S01 identifies a false intermediate assertion in a cited proof; the replacement period-frame proof must be implemented and proved by the library work.
- The companion extension in S02 is expressly stated in BHS19 Remark 4.2.4, but that remark does not give a separate full proof of its finite-descent version. The repair must supply that proof at the stated generality, not treat the remark as implemented code.
- No cited text was inaccessible: all seven manifest works were available legally in the supplied cache. No additional reference request or guessed paywalled content was used. No ownership claim is made about unpublished work outside main, the supplied checkouts, board packages and the indexed roadmap heads.

## Source issues

- **Error** in BHSsmooth17 at proof of Lemma 2.4, printed p. 11 (BHSsmooth17 lines 447–453): the source says a chosen period basis makes the representation-space map to Frobenius matrices and flags smooth; it should be the map from the period-frame torsor, whose extra frame directions restore the dimensions; affects the proof.
- **Gap** in BHS19 at proof of Theorem 4.2.3, printed p. 376 (BHS19 lines 3061–3068): the source says the Hodge-flag map is smooth by the earlier chosen-basis argument; it should be proved on the adapted-period-frame torsor, with invariant Bruhat loci descended to the refined space; affects the proof.
- **Gap** in BHS19 at proof of Proposition 3.7.2, printed p. 367 (BHS19 lines 2691–2694): the source says the selected completed branch maps injectively from the reduced local completion; it should be the product over normalization branches unless unibranchness is proved; affects the proof.
- **Misprint** in BHS19 at definition of T₀ⁿ in §3.4, printed p. 352 (BHS19 lines 2143–2146): the source says the excluded ratios and their cyclotomic twists are both algebraic; it should be that either is algebraic; affects a stated result.
- **Misprint** in BHS19 at Theorem 1.9 and §4.3, printed pp. 305, 381–385 (BHS19 line 264 and lines 3239–3388): the source says full-character constituent cycles have codimension dn(n+3)/2; it should be dn(n+1)/2+n; affects a stated result.
- **Misprint** in BHS19 at construction preceding Theorem 4.3.8, printed p. 383 (BHS19 lines 3335–3336): the source says algebraic shifts and strict dominance uniquely determine δ₀; it should be supplemented by fixing the labelled weight multiset of r, in decreasing order; affects the proof.
- **Misprint** in NT21 at proof of Lemma 2.4, printed p. 29 (NT21 lines 1105–1107): the source says the strictness test includes i=n and therefore δ_(n+1); it should be indexed by 0≤i<n; affects the proof.
- **Misprint** in BHSsmooth17 at proof of Lemma 2.3, printed p. 10 (BHSsmooth17 lines 398–400): the source says the nilradical under study is that of the already reduced localization B_f; it should be the nilradical of B, annihilated by a power of f; affects the proof.
- **Misprint** in BHSsmooth17 at proof of Lemma 2.10, printed p. 15 (BHSsmooth17 lines 629–630): the source says the absolute value of each saturated prefix parameter is at least one; it should be at most one, equivalently nonnegative prefix slope; affects the proof.
- **Misprint** in Ding25 at proof of Proposition 2.2, printed p. 12 (Ding25 line 516): the source says the two remaining endpoint labels are n−2 and n−3; it should be n−2 and n−1; affects the proof.
- **Misprint** in Ding25 at Proposition 2.5(2), printed p. 13 (Ding25 lines 567–569): the source says the σ-component of the original de Rham space equals the whole modified space; it should be the σ-component on both sides; affects a stated result.
- **Misprint** in Ding25 at proof of Lemma 2.11, printed p. 16 (Ding25 line 708): the source says the final graded character has weight h₁; it should be h_n; affects the proof.
- **Misprint** in Ding25 at proof of Corollary 2.14, printed p. 19 (Ding25 line 860): the source says the quotient dimension is d·dim(B∩L_P)−n; it should be d·dim(B∩L_P)+n; affects the proof.
- **Misprint** in Ding25 at Theorems 2.32(2) and 2.37(2), printed pp. 28, 31 (Ding25 lines 1236, 1352): the source says the cancelling character twist uses a Robba ring with the K subscript omitted; it should be the coefficient Robba ring over K throughout the tensor product; affects a stated result.
- **Misprint** in Ding25 at proof of Corollary 2.33, printed p. 29 (Ding25 lines 1268–1270): the source says the sum-dimension expression has unmatched parentheses and adds the intersection term; it should be 2(1+(n²−n+1)d)−(1+(n²−2n+2)d)=1+n²d; affects the proof.
- **Misprint** in Ding25 at definition before Corollary 2.38, printed pp. 31–32 (Ding25 lines 1356–1364): the source says the relation's third endpoint is D₂,σ; it should be C₁,σ; affects a stated result.
- **Error** in Ding19 at proof of Proposition A.3, printed p. 46 (Ding19 lines 2086–2089): the source says the positive-twist condition forces H⁰(W(δ))=0 for every J; it should be restricted to nonempty J, with J=∅ handled directly by Euler–Poincaré; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "66aaebaf27281662e3e3df0c3e88d9055f65ec0d", "job": "RT-TriangulineVarietyAndItsLocalModel~2a", "model": "gpt-6-astra", "worker": "chris-30"} -->
