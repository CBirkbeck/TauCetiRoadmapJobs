<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1674#issuecomment-6481465639 -->
Red team round 2 pass a (codex) of 906c684

Verdict: needs_changes

1. **F01** (P1) The new cycle–weight dictionary loses torsion information

   Location: packages/SheafConvolutionOnAbelianVarieties/README.md:684, §4.3(e)–(f): “p:Ĝ→G_u°” and “[e]_*cc(N)=S(Λ₁,…,Λ_r) with Λ_i=cc(Ψ^e U_i) effective”.

   Claim: restriction to the connected group supplies a characteristic-cycle map on the original A, with effective isogeny lifts.

   Witness: take K=δ_a for a nonzero point of order two. Then G_u=μ₂, G_u°=1. Both δ_a and δ₀ restrict to the unit representation, but cc(δ_a)=Λ_a≠Λ₀=cc(δ₀). K2 lines 776–784 explicitly require quotienting.

   Exact repair text: “For (e), first push to A/K₀ and then to A/(X_u)_tors as in K2 Theorem 2.2.3. The character-to-cycle comparison on the connected group takes values in cycles on those quotient abelian varieties. For (f), apply K2 Theorem 2.3.1 only when the entire Tannaka group G is connected. Its cycles on A need not be effective. After pushing them to A/(X_u)_tors they are effective, by Remark 2.3.2. In the general case first push K along A→A/K₀ and perform the connected construction there. To obtain effective cycles on the original A in §4.4, compose with an isogeny back to A and absorb this into the multiplication integer m.” Replace the corresponding effectiveness claim in :693 and proof in :695 and :713.

   Repair test: the quotient by ⟨a⟩ sends both Λ_a and Λ₀ to Λ₀, so the connected trivial representation has one well-defined cycle. On the original A the two distinct cycles remain distinct; no map R(1)→L(A) can factor both original cycles through restriction. For e=2 the SL₂/PGL₂ example still has degrees 2 and 3 after the required pushforward.

2. **F02** (P1) The replacement exceptional-locus proof uses an unowned transform

   Location: packages/SheafConvolutionOnAbelianVarieties/README.md:349: “Laumon's Fourier–Mukai transform of M is a bounded coherent complex on A♮ satisfying base change to points”.

   Claim: the §0.8 proof has all its prerequisites in §§0.4, 0.7 and its named suppliers.

   Witness: Sch lines 574–613 construct a different transform on coherent D-modules and use Laumon–Rothstein coherence. The §0.4 transform lands on Spec F[π₁], not A♮. None of §0.8's suppliers states this transform.

   Exact repair text: “Before §0.8, construct the transform M↦Rp₂*DR_(A×A♮/A♮)(p₁*M⊗(P♮,∇♮)) on bounded coherent D_A-complexes. Prove bounded coherence on A♮ and derived base change to (L,∇), with fibre RΓ(A,DR_A(M⊗(L,∇))). Use this to prove algebraicity of de Rham cohomology jump loci. Import the Poincaré connection from AbelianSchemesAndArithmeticModuliPartII §P1.1 and the universal vector extension from AbelianSchemesAndArithmeticModuli §A4.2; own the coherent D-module transform and its comparison here.” Give the new target a locator to Sch §10, Theorem 10.3 and Proposition 16.2 and make §0.8 consume it. Replace “M regular holonomic” in the proof by “M a bounded complex with regular holonomic cohomology”; an arbitrary bounded K need not be the de Rham realization of one module. In §0.7 import the existing moduli construction from A4.2/P1.1 instead of rebuilding it. Extend the holonomic-realization contract, in both README and plan.json, to name the bounded derived Riemann–Hilbert comparison used here; an equivalence of the perverse hearts alone is not that derived comparison. The transform's full equivalence is not needed for this particular interface.

   Repair test: for a point skyscraper, Fourier–Mellin gives a free rank-one module on the character torus; the de Rham transform gives the restricted Poincaré line bundle on A♮. Their bases are different even for an elliptic curve. For K=δ₀⊕δ₀[1], the inverse realization has two nonzero cohomology modules, so the bounded-complex formulation is necessary. The new target supplies precisely the latter and its fibres. The earlier Part II's §P2.3 is ordinary coherent Poincaré cohomology; it does not already supply Laumon's coherent D-module transform.

3. **F03** (P1) The Schneider–Lang supplier does not cover the group used by Simpson

   Location: packages/SheafConvolutionOnAbelianVarieties/README.md:115 and :334: “Consume §3.5 for the Schneider–Lang criterion”.

   Claim: DiophantineApproximationAndTranscendence §3.5 supplies the transcendence criterion needed in §0.7(b).

   Witness: its main README:2338–2352 treats coordinates and exponentials for additive/multiplicative groups. Sim lines 379–397 instead applies the criterion to an extension 1→G_m→G→A→1 with A an abelian variety.

   Exact repair text: “What DiophantineApproximationAndTranscendence must provide (gap:schneider-lang-commutative-groups): For a connected commutative algebraic group G over Q̄ and an analytic homomorphism ψ:Cⁿ→G(C) whose differential is defined over Q̄, if a subgroup Γ⊂Cⁿ contains a complex basis and ψ(Γ)⊂G(Q̄), then the Zariski closure of ψ(Cⁿ) has dimension at most n.” Register the same slug, supplier and exact statement in plan.json's gaps and consume it in §0.7. Cite Sim Proposition 3.4 proof, pp.369–370, Sim lines 379–397 for the required form. Retain §3.5 only for the special additive/multiplicative criterion it actually owns.

   Repair test: for A an elliptic curve, Simpson's G has dimension two, contains G_m, and maps onto the proper curve A. It is not a group of the form G_a^a×G_m^b. The new criterion applies to its one-dimensional horizontal analytic subgroup and gives closure dimension at most one, which is the step needed to obtain finite monodromy.

4. **F04** (P2) The rational-map extension gap is already supplied at the current head

   Location: packages/SheafConvolutionOnAbelianVarieties/README.md:79–81: “that section states only over a connected Dedekind base”.

   Claim: AbelianSchemesAndArithmeticModuli §A1.8 does not supply extension of rational maps from smooth field varieties to abelian varieties.

   Witness: the current supplier README §A1.8, “Relative Weil extension”, part (1), states Weil's criterion over every normal locally Noetherian base; part (3) additionally covers every connected regular locally Noetherian base. The restriction-to-Dedekind assertion is outdated.

   Exact repair text: “For rational maps X⇢A over a field, consume AbelianSchemesAndArithmeticModuli §A1.8(1). Smoothness makes the codimension-one local rings of X discrete valuation rings. Properness of A extends the rational map there, and Weil's criterion extends it everywhere; separatedness gives uniqueness.” Delete gap:rational-map-extension-to-abelian-varieties from the README and plan.json gaps, and replace its uses by this supplier citation.

   Repair test: a rational map from a smooth surface to an elliptic curve extends across codimension-one points by properness and across the remaining points by A1.8(1). The nodal normalization counterexample still fails smoothness. No new general theorem is required.

5. **F05** (P2) Holonomy is algebraic in dimension zero

   Location: packages/SheafConvolutionOnAbelianVarieties/README.md:315: “a biholomorphic group isomorphism which is not algebraic”.

   Claim: the holonomy map is nonalgebraic for every complex abelian variety of dimension g, with no positivity condition.

   Witness: A=Spec C gives g=0, A♮=Char(A)=Spec C and Φ=id. This is an algebraic morphism and an algebraic isomorphism.

   Exact repair text: “The holonomy map Φ:A♮→Char(A) is a biholomorphic group isomorphism. For g>0 it is not algebraic; for g=0 it is the identity of a point.” Add the zero-dimensional computation to the Checks, retaining dimension zero in the construction and both linearity theorems.

   Repair test: g=0 now gives the algebraic identity. For an elliptic curve, the connection line t↦(exp(−t),exp(−τt)) remains nonalgebraic, so the existing positive-dimensional control is unchanged.

6. **F06** (P3) Scope reminders remain as Checks; the quotient lacks a third instance

   Location: packages/SheafConvolutionOnAbelianVarieties/README.md:308–309: “Negligible higher perverse cohomology … disappears” and “used only after geometric semisimplicity in Layer 2”.

   Claim: the four bullets test the quotient definition and its comparison.

   Witness: only the constant-sheaf and unit bullets compute an instance. The third repeats annihilation of N; the fourth is a scope reminder and holds even without constructing a quotient.

   Exact repair text: replace the last two bullets by “On an elliptic curve, Q(δ₀⊕F[1])≅Q(δ₀), so its quotient endomorphism space has dimension one; retaining the negligible summand gives dimension at least two before localization.” and “Q(δ₀⊕δ₀) has endomorphism algebra M₂(F), of dimension four; identifying objects merely by their support would incorrectly give dimension one.” Keep the annihilation and semisimplicity restrictions in the API/proof paragraphs.

   Additional locations for the same defect: scope-only Check bullets at README:389, :503, :505, :535, :552, :620, :718, :738, :773, :792, :832, :875, :915, :1127, :1153, :1245, :1271, :1288, :1354, :1392 and :1393. The minuscule definition is repeated at :737, the q=2 identity at :1013, and the definition of quasi-finiteness at :1391. Delete these from the Checks lists; retain any needed qualification in the statement/API/proof. For the repeated q=2 bullet, use the already supplied explicit values (0,0,1,0,0), whose sum is 1=A(3,2). This does not remove mathematical hypotheses. In §5.2 do not count the defining seed P₀=(1,5) as an independent test: add “The positive ordered pair (1,1) is not a solution: 1−4+1=−2≠2, and it occurs at no sequence index.” In §2.1 add “For the irreducible two-dimensional S₃-representation supported at the origin, arithmetic End has dimension one and geometric End has dimension four.” These supply discriminating definition checks after deleting scope-only bullets.

   Repair test: the mixed object's two summand identities give two independent pre-localization endomorphisms, of which the constant-sheaf identity dies. Both skyscraper summands survive, giving four matrix units. These distinguish killing N from killing multiplicities. Prior a/F06 is only partly repaired.

7. **F07** (P1) Euler-one rigidity has no owned proof prerequisites

   Location: packages/SheafConvolutionOnAbelianVarieties/README.md:464: “Apply KW Proposition 10.1(b), which identifies a simple perverse object of Euler characteristic one”.

   Claim: §1.5 follows from §1.2, §0.3 and coefficient comparisons.

   Witness: KW lines 795–814 use the characteristic-cycle index formula, Lemmas 10.3–10.4 and reduction from nonsimple abelian varieties. None occurs in §1.5's Needs; the index formula is only constructed later in §4.2.

   Exact repair text: “Place Euler-one rigidity after §4.2. First prove that an irreducible conormal of Gauss degree one is supported at a point, using birationality of its Gauss map and rational-map extension. For a simple ambient abelian variety prove that a degree-zero conormal is the zero section (KW Lemma 10.3). Prove the purity step: a simple perverse sheaf whose characteristic cycle is a positive multiple of the zero section plus components over a subset of codimension at least two is a shifted rank-one local system (KW Lemma 10.4). Treat dimension one directly. Own the general-abelian induction step as a separate subtarget: assuming Euler-one rigidity in all smaller dimensions, prove it for a nonsimple abelian variety of the current dimension. Supply its proof before concluding §1.5; KW Proposition 10.1(b) is the reference for the conclusion, not a formal input.” Add the index, conormal, rational-extension, purity and induction targets to the actual dependency list, and update §4.8 and §7.1 to consume the relocated result.

   Repair test: on a simple ambient variety the positive cycle contributions sum to χ=1, so exactly one degree-one point contribution occurs. The purity step rules out a positive zero-section contribution when the ambient dimension is at least two. For E×E the ambient variety is not simple; the explicitly owned induction step is indispensable and cannot be replaced by the simple-ambient assertion. This is an ownership/build-order finding, not a counterexample to Euler-one rigidity. The general reduction itself still requires an independently written proof.

8. **F08** (P1) Tensor generation does not give countably many objects

   Location: packages/SheafConvolutionOnAbelianVarieties/README.md:695: “Countability of isomorphism classes in ⟨K⟩ gives the very general point u.”

   Claim: for arbitrary K in §4.3, its tensor-generated abelian category has countably many isomorphism classes.

   Witness: embed a genus-two curve C in J(C). Two independent unipotent rank-two extensions of F_C generate extensions indexed by P¹(F). Shift and push to J(C); their constituents have Euler characteristic 2, so localization does not identify them.

   More explicitly, Ext¹(F_C,F_C)=H¹(C,F) has dimension four. Choose independent e₁,e₂, let E_i be their rank-two local systems, and K=i_*(E₁⊕E₂)[1]. Pullback/pushout of E₁⊕E₂ along the diagonal and (1,λ) produces the extension class e₁+λe₂ as a subquotient of a finite sum of K. Nonzero rank-two unipotent extensions are isomorphic only when their classes are proportional. Thus λ∈F gives uncountably many isomorphism classes. All their perverse constituents are i_*F_C[1], with χ=2; the Serre quotient changes no Hom between these objects.

   Exact repair text: “Use the countable set of tensor words in K and K∨, not the set of all their subquotients. On their common very-general Gauss locus use the microlocal local-system realization. For each pair of tensor words choose a finite basis of its Hom space and exclude the bad locus for those basis morphisms. The resulting countable union is proper. Morphisms of these local systems have locally constant rank, so their kernels, images and cokernels give every required subquotient and preserve exactness on this common locus. Only then forget to the vector-bundle germs.” Prove this extension-to-subquotients assertion in §4.3(a)–(b); do not add semisimplicity to the general fibre-functor theorem. K1's local-system realization and K2 lines 584–586 supply the intended model; K2 lines 595–598 contain the erroneous counting shortcut.

   Repair test: the tensor words in the example above remain countable while the family E_(e₁+λe₂) is uncountable. Each extension is a subquotient of the fixed local-system data; the repaired argument never counts those extension classes. Semisimple K is also covered.

## Verification of the preceding findings

The preceding reports identify their findings as F01 etc.; “a/F01” and “b/F01” distinguish them. The repair report marks all nine actionable. None is being reopened against a “not actionable” disposition. The table separates a repaired original defect from defects introduced or left by that repair.

| Earlier finding | Repaired passage at this head | Status and independently checked witness |
|---|---|---|
| a/F01, generic-vanishing proof assumes missing quotient machinery | README:254: “This route uses neither convolution nor any Tannakian quotient.” README:349 uses the de Rham transform. | **Partly repaired.** The BSS route supplies generic open vanishing before the quotient: on E, F[1] has dimensions (1,2,1) at 1 and (0,0,0) away from 1. BSS lines 183–242 support that route. The replacement exceptional-locus route still has S02/S03. |
| a/F02, microlocal dictionary unowned | README:684: “The map ω_u(N)↦cc(N) is a λ-ring homomorphism” and the new parts (a)–(f). | **Partly repaired.** The required constructions now have a target and the microdifferential gap. The new counting shortcut also fails without semisimplicity (S08). The displayed λ² computation gives Λ_(x+y) on both sides. But (e)–(f) incorrectly remove torsion/connectedness qualifications: δ_a for 2a=0 gives the S01 counterexample. |
| a/F03, disconnected group put in a connected reductive carrier | README:21: “linearly reductive”; README:419: “may be disconnected”. | **Repaired.** δ_a for a of order two gives μ₂, two components, semisimple representations. The general finite-type affine group carrier accepts it; the pinned reductive property includes geometric connectedness. README:1211 uses the same convention for B. |
| a/F04, 13/4≥4 | README:1086: “h(v+1)≥⌈A₁/(2(n−1))⌉≥4”. | **Repaired.** n=5: 26/8=13/4<4 but its ceiling is 4. n=6: 57/10 has ceiling 6. No surviving unrounded assertion was found. |
| a/F05, wrong W/K2/LS locators | README:219 cites “W line 24”; :660 cites “K2 line 628”; :729 cites “LS line 966”. | **Repaired.** W line 24 starts the rigidity proposition, K2 line 628 Definition 2.2.1, LS line 966 Lemma 3.8. The reference title at :1419 now agrees with W line 6. |
| a/F06, vacuous and repeated Checks | README:899: “D₂=36030431772522503316”; :454: “x²=−1 over ℝ has no real point and two complex points”. | **Partly repaired.** choose(96,20)=216182590635135019896=6D₂; the real/complex point counts are 0/2. These replacements discriminate. The remaining §0.6 scope and repetition bullets still leave only two instance Checks: S06. |
| a/F07, Artin comparison cited to de Rham/Hodge sections | README:105: “§C6.6 … rational étale–Betti”; :582 and :680 also cite C6.6. | **Repaired.** ComplexComparisonPartII §C6.6 states adicArtinComparison, while EtaleDualityAndPerverseSheaves §3.5 supplies the perverse comparison. For E, both cohomologies have dimensions (1,2,1) and Euler characteristic 0. C5 citations now serve Hodge/de Rham input. |
| b/F01, reductivity cited to wrong layer | README:440: “ReductiveGroups Layers 3 and 6”. | **Repaired.** Current main ReductiveGroups Layer 3 supplies components; Layer 6 at README:466 supplies characteristic-zero reductivity/semisimplicity. Layer 7 supplies the separately used structural statements. μ₂ remains outside the connected claim. |
| b/F02, redundant fourfold Lean theorem | README:980 retains the n=4 case as a consequence; Suggested.lean:106 retains only the general classification. | **Repaired.** No fourfold_exterior_impossible declaration remains. Substituting n=4 in the general conclusion gives (4=2 ∨ 4=3)=False; the padding was deleted, not proved in place. |

## Verified sound

Read all 1,422 README lines and all 129 Suggested.lean lines. The review covered all 56 numbered targets, the additional Eulerian-row predicate, all nine Lean declarations (four definitions, five admitted headline theorems), and each of the 21 separate §6.2 comparisons. The tables retain the Lean contexts, 14 sampled README rows and the numerical comparisons; the full per-target ledger is omitted for comment length. “Holds” records the displayed instances and source comparison, not a formal proof. No Lean command was run: the supplied elaborated-signature artifact was compared declaration by declaration with the file and README. The file has no section-variable block; the field and characteristic-zero instances of Jordan's theorem are inside its explicit quantifiers.

The statable headlines are the Pell classification, the surface and threefold exterior classifications, the complete exterior/Eulerian classification, and uniform Jordan. All five are present. The other headline families are generic vanishing and the exceptional-locus structure, rigid convolution/Tannaka reconstruction, arithmetic–geometric exactness, hypersurface Euler/Hodge–Tate formulas, microlocal factorization and classical connected monodromy, family invariant detection and simultaneous twists, Frobenius avoidance and Galois-uniform monodromy, and isogeny-pullback period finiteness. The module docstring names these and identifies the missing geometric/sheaf carriers. There is no substituted free predicate for these missing carriers. The kept finite-weight predicate has a real body on finite permutations and finite subsets; it tests the actual combinatorial theorem.

### Lean context and instance ledger

All names below are in TauCetiRoadmap.SheafConvolutionOnAbelianVarieties. The context column is the complete mathematical context; no topological, finite-generation or scalar-extension assumption is implicit.

| Declaration; README section | Variables/instances retained | Instances and computed values on both sides | Result/change |
|---|---|---|---|
| wedgeMultiplicity; §5.1 | {m:ℕ}, w:Fin m→ℤ, k:ℕ, t:ℤ; native finite/decidable instances | m=0,k=0,t=0: one empty subset, W=1; t=1: W=0. m=2,k=3: zero subsets, W=0. w=(0,0,1,1),k=2: W at 0,1,2=(1,4,1), total 6=choose(4,2). | Real definition; unordered subsets and junk k>m correct. |
| exceptionalPair; §5.2 | index j:ℕ only | P₀=(1,5), P₁=(5,20), P₂=(20,76), P₃=(76,285). Successor second coordinates 20=4·5+1−1, 76=4·20+1−5, 285=4·76+1−20. | Natural subtraction never truncates on this orbit. |
| exceptionalDegree; §5.3 | j:ℕ only | choose(6,1)/6=1; choose(25,5)/6=53130/6=8855; choose(96,20)/6=36030431772522503316; all remainders 0. | Division is exact on the sequence; j=0 excluded only from the geometric exceptional set. |
| hasEulerianExteriorWeights; §5.1 | {m:ℕ}, w, k n d:ℕ, s:ℤ | w=(0,0,1,1),k=2,n=3,d=1,s=0: (1,4,1)=(1,4,1), outside q∈[0,3) both 0. w=0⁴ gives (6,0,0)≠(1,4,1). n=0 RHS is identically 0; m=0,k=1,d=0 gives both 0. | The headline hypotheses n≥2,d≥1 exclude the vacuous zero row. Negative q tests the guard before q.toNat. |
| exceptionalPair_classification; §5.2 | a b:ℕ, 0<a, a≤b | (1,5): lhs 6=rhs6, unique j=0; (5,20):25=25,j=1; (1,1):−2≠2 and no index. (0,0):0=0 but excluded by 0<a; (5,1) excluded by ordering. | Both directions and the two essential boundary restrictions agree. |
| surface_exterior_classification; §5.6 | {m k d}, w,s; 1<k, k+1<m, 2k≤m, 1≤d; exact n=2 row | w=0⁵1,k=3: endpoint counts 10,10=d(1,1), m=6=2k, d=choose(5,3)=10, singleton upper endpoint. w=0³1,k=2: counts3,3 and d=3=choose(3,2). | Same normalization as README; no arbitrary shift/sign restriction added. |
| threefold_exterior_classification; §5.7 | Same four numerical hypotheses, exact n=3 row | w=(0,0,1,1),k=2 gives1,4,1 and m4,k2,d1. w=(−1,0²³,1),k=5,s=−1 gives8855,35420,8855; m25=5+20,d8855,j1, endpoints each singleton. | Both branches occur; the lower/upper weight counts are not confused with exterior multiplicities. |
| exterior_eulerian_classification; §6.6 | {m k n d},w,s; n≥2,d≥1,1<k,k+1<m, exact row; no 2k≤m | Surface example: n2,m6,k3,d10=choose(5,3). Complement of the Pell example has k20,m25, min=5,d8855. n4 candidate w=(0,0,1,2),k2 has (1,2,2,1)≠d(1,11,11,1) for d≥1. | Complementary exponents admitted; no Lean/README generality mismatch. |
| jordan_finite_linear_groups; §7.4 | n:ℕ,1≤n; ∃J before ∀F:Type u,[Field F],[CharZero F],Γ≤GL(Fin n,F),[Finite Γ] | n1, cyclic Γ: B=Γ,index1≤J1=1. Q₈⊂GL₂(C): B=C₄,index2, all B elements commute. Dihedral D_(2q): rotation subgroup index2. Trivial Γ: index1. | Bound independent of field and subgroup; nonabelian checks avoid the false B=Γ choice. Characteristic-p SL₂(F_q) has growing required index and is excluded. |

### Sampled README adversarial instances

Numbered sections are the mathematical targets; the bold “Checks” labels are lists, not additional theorems. F is the stated algebraically closed characteristic-zero coefficient field except in the explicitly more general Betti vanishing construction. Let E be an elliptic curve. A naked numerical failure below is either an excluded negative control or is identified by an S-number. All comparisons use geometric characters; arithmetic twists are recorded separately. Conditional geometric implications are tested at their hypotheses as well as at their conclusions; this is not a claim to construct a smooth hypersurface for every numerical d.

| Target | Instances tried; values computed on both sides | Result/change |
|---|---|---|
| §0.3 convolution | δ_x*δ_y=δ_(x+y), versus incorrect δ_(x−y); δ_x∨=δ_(−x); δ₀*δ_x=δ_x. On E, F_E*δ_x=F_E, not δ_x. Exchange of two degree-one shifts is (−1)^(1·1)=−1. | Unit, dual and Koszul sign agree with both later parity tests. |
| §0.4 generic vanishing | E,F[1]: degrees −1,0,1 have dimensions1,2,1; Euler −1+2−1=0. Nontrivial twist:0,0,0. δ_x: H⁰ dimension1, other degrees0, FM rank1. δ₀⊕δ₀[1]: H⁻¹=H⁰=F at every χ, so perversity is necessary. Non-torsion L_α[1] has exceptional locus {α⁻¹}. | Open vanishing and codimension control hold; no assertion of torsion exceptions for arbitrary K. |
| §0.6 quotient | Q(F_E[1])=0; Q(δ₀) unit, End dimension1. Q(δ₀²) has End dimension4. Q(δ₀⊕F_E[1]) has End dimension1, versus at least2 before quotient. | Construction consistent conditional on declared heart-localization gap; S06 replaces ineffective Checks. |
| §0.7 holonomy/linearity | g=0: both moduli are a point, Φ=id algebraic. For E and d+t dz, holonomy (exp(−t),exp(−τt)); no nonzero integer pair (a,b) has a+bτ=0, hence its Zariski closure is dimension2 although the de Rham line has dimension1. The point ρ=(2,1) has infinite order, while (−1,1) has order2. | S05 corrects nonalgebraicity; S02/S03 identify the construction/supplier issues. The point and antidiagonal tests distinguish linear from arithmetic. |
| §1.3 monodromy group | δ₀ gives1; δ_a with a of order2 gives μ₂ with2 components; a of infinite order gives G_m. K⊕K gives diagonal G(K), dimension dimG rather than2dimG. Negligible K has ωK=0, GL(0)=1. | Disconnected linear reductivity repaired; trivial and zero cases admitted. |
| §3.1 divisor Euler row | n2: (−d,d), sum0 for the coherent Ω-row, topological Euler−2d, N2d. n3: (d,−4d,d), alternating sum6d=N. n4: signed (−d,11d,−11d,d), alternating sum−24d, N24d. At n2,d1 genus2 gives χ(O)=−1 and e_top=−2. | Hodge signs and N=(−1)^(n−1)e_top correct; n0,1 hypersurface statements excluded. |
| §3.3 Hodge–Tate row | n3,d1: weights0,−1,−2 with multiplicities1,4,1, total6. Cyclotomic twist has native weight+1, while Hodge q=1 contributes weight−1. On n2 the row has d copies of0 and d copies of−1. | Matches supplier's native Tate convention; finite-order character/finite cover restriction is explicit. |
| §4.3 microlocal dictionary | δ_x multiplicity1 versus δ_x² multiplicity2; their tensor multiplicities2·3=6 at x+y. λ²(Λ_x+Λ_y)=Λ_(x+y) of degree1. Ψ²(std SL₂) has weights−2,+2, degree2; Sym² has degree3. For δ_a,2a=0≠a, G°=1 but ccδ_a≠ccδ₀. Genus-two extension family gives P¹(F) distinct objects. | S01 and S08; the valid λ-ring examples do not fix either defect. |
| §4.8 duality/form | n3 support shift2: sign(−1)²=+1, orthogonal form. n4 shift3: sign−1, alternating form, N24d even. Standard SL₆ has highest weights ω₁ and ω₅ for V,V∨, unequal; character twisting cannot identify them. | Correct SO/Sp parity and nonselfdual SL branch; depends on relocated Euler-one rigidity. |
| §5.7 threefold classification | (0,0,1,1),k2:1,4,1. Histogram1[−1]+23[0]+1[1],k5: choose(23,4)=8855; middle choose(23,5)+choose(23,3)=35420=4·8855. Total53130=6d. | Classical and Pell alternatives realized as weight lists; no assertion of geometric existence. |
| §6.2 comparisons | All21 are in the separate table below. Outside range n2:1/2<0 fails. n7:√2382+1≈49.8057≤50; replacing48 by49 gives RHS≈48.9796 and fails. n10:27A₂=1291680>A₁²=1026169; n11:4121199<4145296. | 1,762 exact rational comparisons passed; infinite ranges not proved by this finite test. |
| §6.5 second regime | n5 quotient13/4<4, ceiling4; n6 quotient57/10, ceiling6. Gapr4 gives A(5,10)=0 versus lower bound26·25/2=325. d<3/676 excludes positive d at n5 but is not a uniform argument. | Corrected integrality; full occupancy step retained for larger n. |
| §8.1 Frobenius avoidance | Curve(2a,3a)⊂E²: first-axis kernel Π(E)[2] has4 points, not1. Two bad cosets,c2,M2:9 grid tuples, ≤6 bad, ≥3 good. On E³ with(2,3,5), order4 χ and σ=3, sums16 and20 both0 mod4; collision difference1−3=2 lies in the nonzero first-axis exception. | Finite component collision terms indispensable; original-axis trivial-character simplification rejected. |
| §9.3 transport relation | u=(1,0)ᵀ,t=(64,0): tu=64,ut/64=diag(1,0), e²=e. Swap sends e to diag(0,1), so arbitrary isometry need not descend. E with lattice Z[i]: integral polarized automorphisms4; (3+4i)/5 has norm1 and infinite order, polynomial x²−6x/5+1. On Y(3), τ and τ+1 agree modulo SL₂(Z) but ±T∉Γ(3); no transport for generic τ. Constant variation gives R=S²; r1 inverse maps give equal relations. | Integral and transport hypotheses prevent all displayed false converse/descent models. |

### Separate numerical comparison ledger

Eulerian rows were generated by their integer recurrence, with A(n,j)=0 for j≥n. Square roots were replaced during testing by explicit rational upper bounds with denominator 10¹² (integer square-root enclosure); the decimal displays below are rounded renderings of those bounds. Every displayed inequality was tested throughout its finite stated range. For unbounded ranges, every n from the lower endpoint through 128 was tested; this detects boundary failures but does not replace the requested proof beyond an explicit threshold. All 1,762 comparisons succeeded. In particular the equality 247=A(8,1) is retained as non-strict.

| §6.2 comparison | Instances | Computed upper LHS; RHS | Result/change |
|---|---|---|---|
| 1. (n−1)²/2 < A₁−1 | All 5≤n≤128 | n=5: 8; 25; n=11: 50; 2035 | Holds on tested range; no change |
| 2. 6(n−1) < A₁−1 | All 5≤n≤128 | n=5: 24; 25; n=11: 60; 2035 | Holds on tested range; no change |
| 3. 28A₂ < 3(A₁−1)² | All 5≤n≤128 | n=5: 1848; 1875; n=11: 4273836; 12423675 | Holds on tested range; no change |
| 4. 10A₂ < A₁² | All 5≤n≤128 | n=5: 660; 676; n=11: 1526370; 4145296 | Holds on tested range; no change |
| 5. n+1+(n−1)A₁/2 < A₂ | All 5≤n≤128 | n=5: 58; 66; n=11: 10192; 152637 | Holds on tested range; no change |
| 6. 78nA₄ < (A₁−1)³ | All 5≤n≤128 | n=5: 390; 15625; n=11: 8355301812; 8427392875 | Holds on tested range; no change |
| 7. 341A₅ < A₁³ | All 5≤n≤128 | n=5: 0; 17576; n=11: 5361968568; 8439822656 | Holds on tested range; no change |
| 8. 6nA₄ < A₁²A₂ | All 5≤n≤128 | n=5: 30; 44616; n=11: 642715524; 632725545552 | Holds on tested range; no change |
| 9. 100A₆ < (A₂−1)² | All 5≤n≤128 | n=5: 0; 4225; n=11: 973811400; 23297748496 | Holds on tested range; no change |
| 10. (n−1)A₁/2+4A₃/A₁+2+√(2A₅) < A₂ | All 5≤n≤128 | n=5: 58; 66; n=11: 20118.948907; 152637 | Holds on tested range; no change |
| 11. 9(n−1) ≤ A₁ | All 6≤n≤128 | n=6: 45; 57; n=11: 90; 2036 | Holds on tested range; no change |
| 12. 247 ≤ A₁ | All 8≤n≤128 | n=8: 247; 247; n=11: 247; 2036 | Holds on tested range; no change |
| 13. 140A₇ < A₁⁴ | All 8≤n≤128 | n=8: 140; 3722098081; n=11: 308488320; 17183478927616 | Holds on tested range; no change |
| 14. n≥11 five-term bound < A₂ | All 11≤n≤128 | n=11: 148972.584729; 152637 | Holds on tested range; no change |
| 15. 6≤n≤19 factorial bound < A₂ | All 6≤n≤19 | n=6: 155.272386; 302; n=19: 496131531.871944; 1151775897 | Holds on tested range; no change |
| 16. √(2A₄)+1 ≤ A₁²/(48(n−1)) | All 5≤n≤10 | n=5: 2.414214; 3.520833; n=10: 1619.860093; 2375.391204 | Holds on tested range; no change |
| 17. 36/11 bound < A₂ | All 5≤n≤10 | n=5: 52.308497; 66; n=10: 40411.567912; 47840 | Holds on tested range; no change |
| 18. 48/11 bound < A₂ | All 5≤n≤10 | n=5: 56.312229; 66; n=10: 44964.845534; 47840 | Holds on tested range; no change |
| 19. 27·46²A₂ < 4·45²A₁² | All 6≤n≤10 | n=6: 17253864; 26316900; n=10: 2733194880; 8311968900 | Holds on tested range; no change |
| 20. 6·13·46²A₂ < 11·45²A₁² | All 5≤n≤5 | n=5: 10893168; 15057900 | Holds on tested range; no change |
| 21. 2A₁+4+√(96A₅/(11A₁)) < A₂ | All 5≤n≤5 | n=5: 56; 66 | Holds on tested range; no change |

### Supplier, ownership and pin ledger

The following 24 roadmap interfaces were resolved at main/completed copies, the supplied new-roadmap heads, or the named earlier board designs. Existing-roadmap revision proposals were not treated as new suppliers. Repeated citations in Needs, Scope and Dependencies refer to the same checked interface. Their section numbers and mathematical ranges were compared, not just their names. Missing additions expressly declared as gaps were not reported merely for being absent.

| Supplier | Sections/targets checked; result |
|---|---|
| EtaleCohomologyFoundations | F.0.2, F.0.A2, F.2.2, F.4.0, F.4.5–F.4.6, F.5–F.6: geometric representations, coefficient range and comparison scope distinguished. The two extra character/base-extension contracts are declared. |
| EtaleDualityAndPerverseSheaves | 0.5, 2.1–2.2, 2.6–2.10, 3.3–3.5, 5.10: perverse heart, amplitudes, products and rational analytic comparison; the native decomposition target retains geometric origin. Arbitrary semisimple direct image and heart/Verdier comparison are declared additions. |
| MotivesAndAlgebraicCycles | 6.1–6.3, 6.8: neutral reconstruction, represented images, group-map criteria and tensor-isomorphism torsors. EHS kernel exactness is a separate declared contract. |
| AbelianSchemesAndArithmeticModuli | A1.3, A1.8, A2.4, A3.1–A3.6, A4.1–A4.2, A5, A6: multiplication, stabilizers, χ(L), duality, Tate/Hodge realization and rigid Hom. A1.8 already covers the rational-map gap (S04); A4.2 owns the universal vector extension (S02). |
| AbelianSchemesAndArithmeticModuliPartII | P1.1 and P2.3 at the supplied head: Poincaré connection and ordinary coherent Fourier–Mukai/completion. Neither provides the coherent D-module transform required in §0.8. Used to resolve ownership in S02, not an invented duplicate construction. |
| SchemeAndStackFoundations | 2.21, 5.1–5.5, 5.8: normalized dualizing complexes, cycles, intersections, Chern/Riemann–Roch and conormal bundles. The conormal-cycle/Gauss projection contract is explicitly additional. |
| SpringerResolutionAndCharacteristicCycles | Earlier design D/characteristic-cycle, H and cycle geometry: coherent D-modules, characteristic cycles and regular holonomicity. Microdifferential localization remains a declared gap; it is not supplied merely by the D-module carrier. |
| ComplexComparisonPartII | C5.1–C5.3, C5.6, C6.1 and C6.6: de Rham/Hodge versus étale–Betti separated. Stein Artin vanishing and holonomic/index compatibility are additional contracts. Bounded derived RH needed by the replacement route is included in S02. |
| DiophantineApproximationAndTranscendence | 3.5 main: only the specified additive/multiplicative Schneider–Lang interface. S03 records the unsupplied general commutative-group form. |
| PadicHodgeTheory | 3.3, 8.1–8.2: HT decomposition and geometric comparison. Native Q_p(1) has weight+1, de Rham filtration jump−1. The image-group cocharacter is a declared additional contract. |
| ReductiveGroups | Layers3,6,7,9,10: components; connected reductivity and characteristic-zero semisimplicity; derived groups/normalizers; roots/outer automorphisms; highest weights. The linear-reductive disconnected convention is not forced into its connected carrier. |
| LieHighestWeight | Layers4,6,8 in the RepresentationTheory subtree: irreducible highest weights, Weyl characters/dimensions and exceptional modules. No complete minuscule table silently inferred from a dimension formula. |
| SpinRepresentations | Layers4–5: actual spin/half-spin carriers, dimensions and weights, including low-rank scope. Complex realization and the declared general minuscule table cover the use here. |
| LieHighestWeightPartII | Earlier design N2: classical comparison/recognition; the full nonzero minuscule-weight table is an additional declared contract, not a missing-citation finding. |
| ClassicalArithmeticCompletion | 2.18, 2.39, 2.56–2.57, 2.71, 2.77–2.78: descent indexing, zero extension, recurrence, exponential bounds and general Appendix C inequalities. At n11, 27A₂<A₁²; at n10 it fails, so the supplied threshold was retained. |
| DeligneWeightsAndPurity | 0.1–0.3, 0.11, 1.4: arithmetic/geometric Frobenius and Tate conventions and Weil moduli; arithmetic Tate action and inverse geometric action not interchanged. |
| MordellLawrenceVenkatesh | 0.22–0.24: subdirect Lie products and graph alternatives; the downstream Part II application is not a reverse dependency. |
| ShimuraData | 3.1–3.4: variations, integral/rational morphisms, Hom/tensor constructions, polarizations and splittings. Bounded-norm orbit Hodge loci are explicitly requested separately. |
| HodgeStructures | Completed L0–L3: opposed filtration, integral polarization and Hodge metric, mixed strictness, and period-domain points. These are not an already-existing geometric VHS or transport-relation theorem. |
| ShimuraVarieties | 3.5b.1 and 3.5c: local nilpotent-orbit factorization and definability of actual polarized period maps. Neither owns §9.3's transport relation/descent statement; scope citation accurate. |
| StableReductionPartII | Earlier design MC.4/fine-level-scheme and MC.6/torelli-finite-fibres: N≥3 level scheme, genus≥2, fibres at most2 with the hyperelliptic sign identification. Integral Jacobian/VHS comparison remains a declared additional contract. |
| JacobianChallenge | LayerF on main: pointed Abel–Jacobi and its universal property over fields, compatible with extension. It does not by itself provide the parameter-scheme version used for a fixed curve family. |
| JacobianChallengePartII | 2.1–2.4: relative Abel morphisms and base change. Relative pointed Albanese factorization is separately declared with reduced connected parameter scheme. |
| AlgebraicModuliForArithmeticGeometry | 1.1–1.2, 2.1: projective section spaces and smooth-family parameter geometry. The package explicitly uses sections modulo scalar; this is the line convention, dual to the supplier's quotient-projective presentation. |

All 18 plan.json gap slugs occur under the README's named supplier contracts. None has supplier “none”. Seventeen remain substantive declared contracts; the eighteenth, rational-map extension, is redundant at the current version (S04). S02/S03 specify the further precise interfaces the new proof needs. The contracts for whole categories and functors are not being mistaken for proofs already present in the pins. The two newly added gaps from round one, Stein Artin vanishing and microdifferential localization, are declared in both intake locations.

Ownership was searched by object through the roadmap service and locally through main, completed roadmaps, board packages and the supplied sibling heads: convolution, Fourier–Mellin versus coherent/D-module Fourier–Mukai, rank-one connections, microlocal characteristic cycles, Eulerian exterior counts, Jordan, and Hodge transport/period relations. The nine Lean declaration names have no conflicting fully qualified declaration in the indexed main/open-roadmap search. The definitions here are specializations needed by the five headlines, not a second generic Eulerian API.

One overlap requires an explicit ownership decision: the supplied FiniteGroupInvariants head has the same uniform Jordan theorem and finite-modulo-scalars consequence at TauCetiRoadmap/FiniteGroupInvariants/README.md:1029–1050. SheafConvolutionOnAbelianVarieties already owns the general Jordan theorem in its accepted design and is in the merge order. FiniteGroupInvariants is absent from ORDER.txt, so I do not infer its position from its newer pull-request number or claim an UPWARD edge. To preserve the accepted ownership rather than re-plan it, keep the general theorem here and have FiniteGroupInvariants §10.5 consume §7.4, retaining its optimal constant and stronger classification targets. This is the required move to the earlier owner, recorded here rather than adding an upward Needs edge. Likewise, the existing A♮/Poincaré construction is imported from the earlier abelian-scheme roadmaps; only the D-module transform is new work here (S02).

The pin check used Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a from the current manifest, not the earlier review's pins. In particular:

| Pinned declaration | File and checked content |
|---|---|
| Finset.powersetCard; Finset.card_powersetCard | Mathlib/Data/Finset/Powerset.lean:197, :211; finite unordered subsets, cardinality choose(card s,n). |
| Nat.choose; Equiv.Perm | Mathlib/Data/Nat/Choose/Basic.lean:50; Mathlib/Logic/Equiv/Defs.lean:94 defines Perm as self-equivalences, and Mathlib/Data/Fintype/Perm.lean:155 gives cardinality n!, including the unique empty permutation. |
| DerivedCategory | Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87; generic derived category of an abelian category, not a selected constructible/adically completed perverse category. |
| SerreClassLocalization.abelian; preservesFiniteLimits; preservesFiniteColimits | Mathlib/CategoryTheory/Abelian/SerreClass/Localization.lean:415, :427, :433; additive localization at isoModSerre, with a preadditive target, gives the abelian/exact interface. |
| Matrix.GeneralLinearGroup | Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:42; units in the finite matrix algebra. |
| Subgroup.Normal; Subgroup.index | Mathlib/Algebra/Group/Subgroup/Defs.lean:606 and Mathlib/GroupTheory/Index.lean:55; normal subgroup condition and Nat.card of cosets. Infinite index has junk value0; the theorem's Finite Γ prevents it. |
| TauCeti.AlgebraicGeometry.AbelianVariety | TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95; group object, properness and geometric integrality are actual fields. No dimension/smoothness-only stand-in is used. |
| TauCeti.AffineGroupSchemeCat; FiniteTypeAffineGroupSchemeCat | TauCeti/AlgebraicGeometry/AffineGroupScheme/Basic.lean and FiniteType.lean:97; affineness and finite type are separate restrictions. |
| TauCeti.ReductiveAffineGroupSchemeCat; geometricallyConnected_of_reductiveAffineGroupSchemeProperty | TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive/Basic.lean:109–121; geometric connectedness is forced. |
| TauCeti.Tannaka.tensorAutFunctor; fgPointTensorIsoEquiv | TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean:63 and Equivalence.lean:188; finite comodules of a given bialgebra/Hopf algebra, not reconstruction of an unspecified geometric category. |

There is one import, Mathlib; no set_option, sorry'd data, free Prop stand-in, admitted example, lemma declaration or non-pinned import in Suggested.lean. Its five sorry bodies belong to the five deep theorems. The read-only diff stat has eight changed files, all under packages/SheafConvolutionOnAbelianVarieties; no change outside the package was found. No computational algorithm is made a library target: the finite numerical checks in this report are review witnesses.

Dependency gate output, verbatim:

```text
depcheck: 171 roadmaps, 1190 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. This graph result does not certify the unowned internal prerequisites in S02, S03 and S07.

### Source and Check coverage

All 12 manifest sources have certified legal cached text. I inspected 105 distinct source-line anchors named by the README, with nearby hypotheses/proofs when needed. Counts and the anchors themselves are recorded to make “locator checked” auditable:

| Source | Anchor count | Lines inspected for the cited targets |
|---|---:|---|
| LS | 53 | 650,672,680,693,707,710,741,749,777,804,842,864,873,966,1000,1003,1025,1057,1071,1085,1137,1159,1191,1252,1271,1358,1388,1392,1399,1406,1479,1484,1526,1582,1591,1628,1669,1698,1707,1726,4343,4380,4452,4503,4641,4655,4660,5013,5083,5393,5485,5741,5745 |
| KW | 6 | 41,787,805,922,1020,1087; additionally the full 10.1 proof and Lemmas10.3–10.4 at795–867 |
| K1 | 7 | 227,242,254,360,433,444,1893; Corollary1.8's multiplicity-free qualification also read |
| K2 | 14 | 341,389,452,580,611,628,637,677,711,728,776,1200,1221,1402; especially the quotient diagrams and Remark2.3.2 |
| EHS | 1 | 781–825, AppendixA criterion and its proof |
| W | 1 | 24, rigidity proposition; title at6 |
| CDK | 3 | 54,59,121, bounded norm and orbit Hodge locus statements |
| JV | 3 | 941,947,1713, Albanese extension and Torelli |
| BR | 1 | 12, dimension-uniform Jordan theorem |
| BSS | 7 | 25,50,172,183,188,192,221, generic vanishing, transforms and local duality |
| Sch | 5 | 88,423,453,1236,1291; additionally574–620 for the missing transform and1242–1251 for its jump loci |
| Sim | 4 | 243,360,367,655; additionally379–397 for the actual transcendence input |

There are 224 README Check bullets. All were read against the targets; sampled numerical and geometric instance values appear above, including negative controls. Scope-only bullets are not counted as successful computations and are grouped in S06. Each kept definition was tested on its unit/empty/zero case, a genuine nonzero example, and a wrong-model or out-of-range example where available. The total bookkeeping is therefore **9 declarations read, 56 numbered targets plus 1 additional predicate read, 105 locator anchors inspected, 224 Check bullets audited, 24 cross-roadmap interfaces checked, and 1,762 separate exact numerical comparisons**. These counts do not claim 224 independent nonvacuous tests.

## Not verifiable

- No Lean build or fresh elaboration was run, as required by the read-only review. Signature conclusions rely on the supplied elaborated types and direct examination of the nine declarations and current pinned definitions.
- The infinite §6.2 inequalities were not formally proved here. The finite ranges were exhausted and unbounded ranges tested through128; the missing explicit asymptotic thresholds remain implementation work, not evidence supplied by these numerical tests.
- The 17 nonredundant supplier gaps remain future contracts. The review is conditional on those exact hypotheses; it does not certify future implementations or treat a declared contract's present absence as a defect.
- KW10.1's general-abelian reduction is not independently justified by the package's proof plan. To inspect its reference, the sources service legally fetched Weissauer, *Degenerate perverse sheaves on abelian varieties*, arXiv1204.2247v3, under the new scratch identifier WeissauerDegenerate. Its lines127–137 give the Euler-zero classification; lines970–974 themselves appeal to the Euler-one skyscraper result in KW. These passages alone do not supply the missing Euler-one induction proof. S07 requests an explicit owned proof rather than certifying a chain of citations.
- Published versions were not collated against the cited preprints. The report uses the versions recorded in sources.toml; it makes no claim that the listed source issues survive in published corrections. No inaccessible text remains requested, and no missing-reference request was needed.
- The roadmap service and the supplied sibling checkouts were searched for ownership. Open work outside those accessible indexed/supplied copies was not checked. The FiniteGroupInvariants overlap is specifically recorded above; no changes to its head or to merge order were made.

## Source issues

- **Error** in K2 at §2.1, p.13, K2 lines 595–598: the source says tensor-generated abelian categories have countably many object isomorphism classes; it should be tensor words are countable, while their subquotients need not be; affects the proof.
- **Error** in K2 at Proposition 6.1.1, pp.29–30, K2 lines 1402–1411: the source says failure of simplicity modulo centre always yields two nontrivial semisimple factors; it should be require a nonzero derived algebra with at least two simple factors; affects a stated result.
- **Misprint** in EHS at Appendix A, equation (A.5), p.20, EHS line 817: the source says the trivialized induced module is k[A] tensor V; it should be k[G] tensor W after pullback along the principal L-bundle; affects the proof.
- **Misprint** in LS at Lemma 3.8, p.21, LS line 968: the source says the distinguished representation is a representation of the Lie algebra of the hypersurface; it should be the Lie algebra of its convolution group; affects a stated result.
- **Misprint** in LS at Lemma 3.8 proof, p.21, LS line 969: the source says the divisor constant sheaf is shifted by n for the positive conormal calculation; it should be shifted by n−1; affects the proof.
- **Misprint** in LS at Lemma 3.8 proof, p.21, LS lines 971–972: the source says the minuscule conclusion uses Corollary 1.0 of K1; it should be Corollary 1.10; affects nothing.
- **Error** in LS at Lemma 3.9 proof, p.22, LS lines 1018–1021: the source says the topological Euler characteristic of H equals positive n!d in every ambient dimension; it should be (−1)^(n−1)n!d, with positive n!d the shifted perverse Euler characteristic; affects the proof.
- **Misprint** in LS at Lemma 3.9 proof, p.23, LS line 1028: the source says Λ_H equals the factor-cycle product after introducing multiplication by m; it should be [m]_*Λ_H; affects the proof.
- **Gap** in LS at Lemma 3.9 proof, p.23, LS lines 1038–1040: the source says every morphism H→A extends directly to a homomorphism A→A; it should be translate the morphism and choose a base point before invoking the pointed Albanese property; affects the proof.
- **Error** in LS at Lemma 3.9 proof, p.23, LS lines 1049–1052: the source says a hypersurface contained in a proper inverse image must equal that whole inverse image; it should be an irreducible component, with possible other translates under a finite kernel; affects the proof.
- **Error** in LS at Lemma 3.10, p.23, LS line 1061: the source says spin representations are representations of SO_m; it should be representations of Spin_m, followed by their actual represented images; affects a stated result.
- **Gap** in LS at Lemma 3.10 proof, p.23, LS lines 1057–1065: the source says simplicity follows without a dimension restriction from Lemma 3.9; it should be impose n>2 for that invocation; affects the proof.
- **Error** in LS at Lemma 3.11, p.24, LS lines 1071–1078: the source says containing SL_N rules out translated inversion symmetry without a rank qualification; it should be require N>2, since SL₂=Sp₂ has self-dual standard representation; affects a stated result.
- **Misprint** in LS at Lemma 4.2, p.30, LS lines 1358–1364: the source says push forward the abelian varieties as the two sheaf summands; it should be push forward K₁ and K₂; affects a stated result.
- **Error** in LS at §4 before Lemma 4.4, p.30, LS lines 1392–1394: the source says every perverse sheaf has torsion-translated exceptional loci; it should be arbitrary translates generally, with torsion translates under the geometric-origin hypothesis; affects a stated result.
- **Error** in LS at Lemma 4.8 proof, pp.34–35, LS lines 1591–1598: the source says cyclotomic Frobenius acts invertibly on the entire character space; it should be restrict the power action to prime-to-p finite-order characters for this argument; affects the proof.
- **Misprint** in LS at Lemma 4.8 proof, p.35, LS lines 1600–1605: the source says the upper bound counts tuples outside one bad coset; it should be count tuples inside that coset, before subtracting the bad counts; affects the proof.
- **Error** in LS at Lemma 4.8 proof, p.35, LS lines 1606–1608: the source says an axis inverse image of a connected restriction subtorus is again connected; it should be allow finite components, as the (2,3) embedding gives Π(E)[2] on the first axis; affects the proof.
- **Misprint** in LS at Proposition 4.11 proof, p.38, LS line 1723: the source says the second family uses the m-cover in the displayed comparison for all m′; it should be the m′-cover on both sides; affects the proof.
- **Misprint** in LS at Lemma B.7 proof, p.96, LS line 4643: the source says the quadratic expression without an equation's right-hand side; it should be a²−4ab+b²=a+b; affects nothing.
- **Misprint** in LS at Lemma B.8 proof, p.96, LS line 4658: the source says the excluded initial case has m=a(2); it should be m=a(1)+a(2)=6; affects the proof.
- **Gap** in LS at Appendix C opening, p.116, LS lines 5745–5751: the source says the preceding inequalities follow by large-n bounds and finitely many checks, without all thresholds or certificates in the text; it should be provide those thresholds and exact finite inequalities; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "906c68422c944aea049241e975f18908f3afb8d1", "job": "RT-SheafConvolutionOnAbelianVarieties~2a", "model": "gpt-6-astra", "worker": "chris-30"} -->
