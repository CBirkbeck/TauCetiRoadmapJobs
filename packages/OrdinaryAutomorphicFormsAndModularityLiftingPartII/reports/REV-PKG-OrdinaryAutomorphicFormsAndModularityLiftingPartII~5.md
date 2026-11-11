<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13074#issuecomment-6789120624 -->
Review (codex) of 2984461

Verdict: accepted

No package findings. Acceptance is conditional on the seven declared supplier contracts listed below. Both findings of round 4 are repaired. This is acceptance of the roadmap, not certification of the future proofs, notably the explicitly owned additional argument in §3.2(b).

## Verified sound

### Previous findings checked first

All package line references below are to `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md`, unless a different file is named. The diff from the reviewed version to the repair changes §2.1, the positive-depth qualifications in §§2.2–2.3 and 3.3, and the corresponding source correction. The other numbered targets are unchanged.

| Previous finding | Repaired passage | Status and witness |
| --- | --- | --- |
| F01 (P1), compatibility with spherical depth zero | :236: “every ordinary construction below [is] defined only at Iwahori depth c ≥ 1”; :244: “For 0 ≤ b ≤ c with c ≥ 1” | **Repaired.** Ger19 lines 451–458 and 493–505 impose positive depth. Independently enumerating matrices modulo 4 gives spherical index 96/32 = 3 and Iwahori index 32/16 = 2. Modulo 8 the positive-depth indices are 512/256 = 2 and 256/128 = 2. The new Check at :252 records the failed and successful comparisons. |
| F02 (P2), projector in the smaller algebra | :238: “ordinary idempotent e ∈ T̃^T”; :245: “it need not lie in T^T” | **Repaired.** Ger19 lines 508–510 distinguish the two algebras; lines 535 and 542–555 give the ordinary image and the projector's ambient algebra. For X²−X+2 the roots modulo 32 are exactly 6 and 27, with difference 21 a unit. The projector is diag(1,0), whereas the smaller algebra acts as diag(a,a) on the two refinements. |

The full changed paragraphs were checked, not just these quotations. The added finite-algebra decomposition, factorial limit, faithfulness on eS and limit idempotent match Ger19 §2.4, pp. 12–14, lines 522–572 and 606–634. The positive-depth condition reaches the limits (:239), reducedness (:265), ordinary constituents (:284, :294), and the Hecke-valued representation (:356). Searched the complete README for the old compatibility and membership patterns; no remaining unrestricted depth-zero compatibility or ambient membership e ∈ T was found. The larger algebra supplies e; the smaller ordinary image still supplies the Galois quotient. The spherical level itself remains in the general level theory.

The earlier settled treatment of §3.2(b) is not re-raised: the README explicitly owns the missing scalar relation and component-placement arguments, explains what the sources do not prove, and names the local supplier contract. No repair marked not actionable is being re-raised.

### Principles, shape and coverage

Read all 30 numbered targets, their formulas, APIs, Checks, routes and 30 Needs lines, together with the summary, conventions, supplier contracts, corrections and references. There are six layers, six Examples subsections and six Dependencies subsections. Definition/data blocks have prose APIs and at least three Checks; none of the backticked identifiers claims an undeclared new Lean definition. The eight external identifiers are resolved at the pins below. The main-branch `TauCetiRoadmap/ClassFieldTheory/README.md` and `TauCetiRoadmap/GlobalQuadraticForms/README.md` were read as shape comparisons.

The mathematics determines the ordering: polarized data and ordinary Hecke theory feed the global problem and dyadic patching; symplectic seed/selected-component data feed a separate patching argument. These are not source chapter headings. The README does not prescribe following a source's exposition. The ordinary operator extension is specifically dyadic; generic algebraic modular forms, local deformation rings and patching algebra remain imported. Torsion components of the weight algebra, full-adjoint cohomology, the surviving dyadic class, and nonregular semisimple symplectic Taylor–Wiles places are retained. The source's split-prime hypothesis for the symplectic theorem is stated, rather than silently claiming the theorem beyond its source.

No source copying, computational algorithm, option override, sorry'd data, admitted example, process identifier, machine path, HTML anchor or suspicious instruction was found in the authored roadmap and Lean file. The unchanged round-4 numerical evidence was used only where it supplies actual values; the fresh table below covers every seeded target, every headline, all repaired passages, and the other numbered targets. Tests of arithmetic formulas are distinguished from realizable field instances.

### Seeded source verification

All fifteen seeded targets were checked in the supplied legal cached texts. All fourteen cited works have certified manifest entries; there is no author-flagged unverified locator. Ger19 locators use the explicitly declared preprint numbering; WHI22 uses v3. No source fetch or manifest change was needed.

| Target | Locator and text opened | Comparison with the statement |
| --- | --- | --- |
| 1.2 Complex, dual Selmer and presentations | BCGP25 (5.4.1)–(5.4.3), Remark 5.4.4, pp. 122–124, lines 5510–5605; Proposition 5.5.6, p. 126, lines 5694–5704; Tho17 Lemmas 2.12–2.17, pp. 9–11, lines 353–489 | Full Ĝ_n equivalence, local µ_v conditions and h³ = 1 are retained. The presentation has the CM/cyclotomic, near-adequacy and strong residual oddness hypotheses. Its count is g, not g+1. The real restriction argument uses adjoint coefficients. |
| 1.3 Full-adjoint weak adequacy and near adequacy | BCGP25 Lemma 5.3.1, Definitions 5.3.2–5.3.3, Remark 5.3.4, pp. 120–121, lines 5402–5437 | Both trace-annihilator descriptions and the spanning equivalence agree. The full-adjoint variant is distinguished from the supplier's ad⁰ condition; the eigenvalue-field condition is retained for relaxed adequacy. |
| 1.4 Unavoidable dyadic class | BCGP25 Lemma 5.5.3 and proof, pp. 125–126, lines 5640–5687 | Least cyclotomic level, total reality, triviality at auxiliary primes and trace pairing n times the scalar pairing agree, with the two textual slips corrected. N ≥ m is explicit. |
| 2.2 Hida theory | Ger19 Proposition 2.5.3/Corollary 2.5.4, pp. 16–17, lines 716–752; Proposition 2.6.1, p. 18, lines 771–790; Lemma 2.6.4, pp. 21–22, lines 954–980; Lemma 2.4.4, p. 13, lines 600–604; BCGP25 lines 5993–6001 | Sufficient smallness, the deeper weight subgroup, finite algebra, O-coefficient reducedness, lowest-weight twist and arithmetic specialization agree. The amended positive-depth qualification agrees with Ger19. |
| 3.1 Ordinary global problem | BCGP25 Hypothesis 5.7.5, (5.7.6), Definition 5.7.11, pp. 133–134, lines 6023–6043 and 6076–6077 | Split finite T, seed ramification, trivial residual tame data, ordinary factors, inverse inertial characters and multiplier agree. |
| 3.2 Dimension bound | BCGP25 Lemma 5.7.7, pp. 133–134, lines 6044–6059; CHT08 Lemma 2.2.11/Corollary 2.2.12, pp. 24–25, lines 1018–1054; Corollary 2.3.5, pp. 31–32, lines 1415–1450 | The obstruction calculation yields nd after retaining h³. The stated stronger 1+nd bound is the corrected source target, with additional work explicitly owned in (b). It is not presented as following from the obstruction count alone. |
| 3.3 Hecke-valued representation | BCGP25 Proposition 5.7.9, p. 134, lines 6060–6075; Ger19 ordinary algebra definitions, lines 508–555 | The Frobenius polynomial and multiplier agree. The README adds seed fixed vectors at remaining tame places, and now consistently uses positive depth and the smaller ordinary image algebra. |
| 3.4 Uniform fixed vectors | BCGP25 Lemma 5.7.12, p. 134, lines 6080–6084 | Uniformity is in the fixed residual local representation, not the seed conductor. The elaborated route uses finitely many inertia restrictions and the declared Bernstein-block contract, forgetting monodromy. |
| 4.2 Patching with torsion weights | KT17 Proposition 3.1, pp. 14–15, lines 630–710; Tho12 Theorem 8.6 and proof, pp. 49–51, lines 2084–2199; Tay08 Lemma 2.3, p. 188, lines 227–235 | Fixed finite residue, compatible finite data/actions/augmentations and nonzero module are explicit. The finite-free reduction to regular Λ⁰ justifies depth. The abstract extraction does not import Tho12's odd-prime arithmetic hypotheses. |
| 4.5 Component support | BCGP25 proof of Theorem 5.7.14, pp. 137–138, lines 6201–6249 | Product components, paired reduction, automorphic points and genericity match. The README supplies the augmentation dimension argument and corrects the primed-module slip. |
| 4.6 Auxiliary-place removal | BCGP25 proof of Theorem 5.7.14, p. 138, lines 6250–6277 | Solvable restriction and selected component union agree. T′ includes the dyadic places, correcting the source's omission. |
| 4.8 Dyadic reduced comparison | BCGP25 Theorem 5.7.14, pp. 134–135, lines 6088–6109; final proof, p. 139, lines 6280–6302 | All six standing hypotheses and sufficient tame depth are retained. Density explicitly depends on (b), not the weaker obstruction count. |
| 5.2 Reasonableness | WHI22 Definitions 3.15/3.19 and Lemmas 3.16/3.20, pp. 21–24, lines 985–1077 | The H⁰ condition, centre-of-centralizer detection and conditional H¹ condition match. Stabilization along the cyclotomic tower uses absence of a p-quotient. |
| 5.3 Symplectic Taylor–Wiles places | WHI22 Proposition 3.18 and proof, pp. 22–23, lines 1013–1060; Lemma 3.14, lines 970–980 | The omitted H⁰ hypothesis is restored. Semisimplicity is not strengthened to regular semisimplicity. The detection quotient is distinguished from the dual local condition; cardinality q and zero dual Selmer are as stated. |
| 6.3 Symplectic reduced comparison | BCGP25 Theorem 6.3.4 and proof, pp. 148–149, lines 6694–6746; Lemma 6.2.6, pp. 145–146, lines 6596–6605 | Selected components, dominance, unique special-fibre generalization and Ihara avoidance agree. Nonzero support alone is explicitly rejected. The preceding seed retains Hypothesis 6.3.1, lines 6620–6662. |

Also checked the repaired §2.1 against Ger19 Definitions 2.3.1–2.4.2, pp. 10–12, lines 451–565, and §2.4, pp. 13–14, lines 568–634; and the symplectic patching counts against WHI22 Lemma 7.10/Proposition 7.11, pp. 66–68, lines 3298–3389. No inaccessible source was treated as verified.

### Adversarial values

“Retained” marks numerical evidence from the unchanged round-4 table checked against the unchanged formula. Other rows were recalculated in this review, by finite enumeration, matrix/character algebra or direct ring calculation. These are falsification controls and consistency checks, not proofs of the deep theorems.

| Statement | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| Frobenius and trace conventions | q=2, p=7; rank-one trivial residual character at ℚ₃ with O=ℤ₂ | ε(geometric Frob)=4 versus arithmetic value 2; dim ad=1 versus dim ad⁰=0; special fibre u²=0 with u≠0 | Inverse Frobenius and full-adjoint obstruction retained. |
| 1.1 Full framing and strict equivalence | n=4, #T=3; T empty; A=𝔽₂[t]/t² | 17·3−1=50 versus GL₄ count 47; empty framing adds 0; (x+yt)²=x², so 1+t is not a square; transformed local frame gives α⁻¹rα on both sides | No scalar-square shortcut; source/target of the ring map agree. |
| 1.2 Real local condition | B=I₂ and B=Ψ₂ over 𝔽₂ | For I₂, Y+Yᵗ has diagonal (0,0), excluding I₂. For Ψ₂, Y=diag(1,0) gives Y+Ψ₂YᵗΨ₂=I₂ | µ dimensions 1 and 0, respectively; oddness matters. |
| 1.2 Presentation headline | n=d=2, #T=3, q=5, h²=h³=1 | χ=1−3−5+2=−5; h¹=1−1+5=5; g=5+3−1−2=5. Setting h³=0 gives 6 | Corrected degree-three term is necessary. |
| 1.3 Trace-span equivalence | V=0; H={1} in ranks 1 and 2; H=GL₂(𝔽₂)=S₃ | Span/End dimensions 0/0, 1/1, 1/4; S₃ semisimple matrices I,A,A² span dimension 2, trace-annihilator dimension 2 | Both equivalence directions survive boundary cases; absolute irreducibility alone fails. |
| 1.4 Surviving scalar class | n=2, char 2; √2 absent/present in F⁺ | tr(I₂)=0; least m=3/4; auxiliary Frobenius splitting in F(ζ₂ᴺ) evaluates ψ to 0; lower bound is 1, not 0 | Retains unavoidable class and permits redundant primes. |
| 2.1 Field witness | F⁺=ℚ(√105), F=ℚ(√−7,√−15) | disc(F)=(-7)(-15)(105)=11025=disc(F⁺)²; relative discriminant norm 1; −7,−15,105≡1 mod8; nd=4 | Genuine standing-field instance for the new operator Check. |
| 2.1 Depth-zero compatibility | n=2, q=2, λ=0; depths 0→1 and 1→2 | Mod4: 96/32=3 versus 32/16=2. Mod8: 512/256=2 versus 256/128=2 | Previous F01 repaired. |
| 2.1 General double-coset count | n=3,j=1,q=2; j=n; n=1 | Grassmannian count 7 versus Iwahori count 4; central operator counts 1=1; no intermediate j for n=1 | Exception j=n is necessary and stated. |
| 2.1 Enlarged algebra and projector | X²−X+2 over ℤ₂ | Roots mod32: 27 and 6; evaluations 704 and 32; α−β≡21, inverse denominator a unit; e eigenvalues (1,0), scalar operators (a,a) | Previous F02 repaired. |
| 2.1 Factorial limit and torsion coefficients | U=diag(α,β), valuations 0,1; reductions mod2 and mod32; zero module | α^(r!)→1, β^(r!)→0; e²=(1,0)=e in both reductions; on zero module e=0 and image algebra=0 | Enlarged-algebra and faithful-image assertions pass including torsion/zero controls. |
| 2.1 Normalization and Hecke polynomial | n=1,2; λ=(1,0), j=1,2 | Diamond twists 1 and u₂⁻¹; lowest-weight factors 1 and ϖ; polynomials X−T¹ and X²−T¹X+qT² | Same twist/polynomial in §§2.3 and 3.3. |
| 2.2 Torsion weight algebra and freeness | Two ℚ₂ places, n=2; central −I retained at tame level | Rank over Λ⁰=16, dim=5, (1−z)(1+z)=0; [−I]−ε₀ acts as ε₀−ε₀=0 while nonzero in Λ | General Λ-faithfulness is not asserted; deeper-subgroup freeness retained. |
| 2.2 Weight change and coefficients | λ=0 and (1,0); O versus O/ϖ² | Lowest-weight twists 1 and τ(u₂); ϖ is nonnilpotent in O but nonzero with square 0 in O/ϖ² | Reducedness is read for the O-coefficient algebras of (1), consistent with Ger19; no claim that finite coefficient quotients are reduced. |
| 2.3 Ordinary constituents | Rank 1 versus rank 2 constant constituents; unit/nonunit U-roots | Rank-one invariant dimensions {0,1}; rank-two invariant line 1<2; e ranks 1 and 0 on unit and nonunit lines; Iw(1,1)⊂Iw(0,1) preserves the unit-root vector | n≥2 Eisenstein qualification retained; b≥1 loses no ordinary constituent. |
| 3.1 Global problem | R=∅; n=3,4; identity field extension | Zero tame-character constraints; real multipliers (−1)⁻²(−1)=−1 and (−1)⁻³=−1; norm u↦u | Conditions and contravariant restriction map agree. |
| 3.2(a) Obstruction bound | n=d=2, #T=3 | Local dim=19; h¹−h²=−1; framing dim=14; 19−1−14=4=nd | Does not imply 5. |
| 3.2(b) Headline and determinant | Same parameters; x=(g,a)j | Required 1+nd=5 versus printed 1+n[F:ℚ]=9; ν(det x)=−aⁿ versus ν(x)ⁿ=(−1)ⁿaⁿ; δ^(n+1) restores −aⁿ | Degree/sign corrections agree; additional scalar relation remains owned work. |
| 3.2 Rank-one relation control | K torsion-free versus K with cyclic 2-torsion | rank K=h²−1 in both; dim K/2K=h²−1 versus h² | Torsion and its relation-space injection are not inferred from rank. Retained. |
| 3.3 Hecke localization | Ramified residual inertia at hyperspecial level; (b,c)=(0,1) | Hyperspecial parameters have inertia 1, residual data have inertia ≠1, matching eigensystem count 0; ordinary Iwahori refinement has projector rank 1 | Fixed-vector hypothesis and repaired positive depth exclude the failed model. |
| 3.4 Uniform local level | ℚ₅, order-four tame character versus trivial seed | Conductors 1 and 0; nontrivial tame character has fixed dimensions 0 under ℤ₅×, 1 under 1+5ℤ₅ | Seed conductor cannot determine the common level. |
| 3.4 Inertial block dictionary | Trivial and Steinberg GL₂ | Same inertia support [T,1]; monodromy ranks 0 and 1 | Declared contract correctly forgets N. |
| 3.5 Sufficient depth | Same tame character; U′=1+5ℤ₅⊂U=ℤ₅× | Fixed dimensions increase from 0 to 1; a U-fixed vector remains U′-fixed | Inclusion direction and negative Check agree. |
| 4.1 Solvable preparation | Tame quadratic character ψ, σ with ψ(σ)=−1; n=2 | Lift inertia polynomial (X+1)(X−1)=X²−1 versus unipotent (X−1)²=X²−2X+1; modulo2 both become (X−1)² | Preparation is for restrictions of original lifts, not all new-field lifts. |
| 4.2 Torsion-weight patching | q=j=0; Λ=Λ⁰[C₂⁴]; wrong-dimension model R=S⟦y⟧, H=S | S_N=S∞=Λ; rank_Λ⁰ Λ=16, dimΛ=dimΛ⁰=5; depth_R H=dim S while dimR=dimS+1 | Empty variables valid; dimension hypothesis excludes wrong model. |
| 4.3 Patched dimensions | n=2, d=6, two dyadic degrees 3, #T=3, q=5/6 | Local dimensions 14+14+5−2=31; g=1/2; patched dimensions 32=13+5+14 and 33=13+6+14 | Fresh arithmetic agrees with retained row; distinguishes q from h¹ and keeps h³. |
| 4.4 Components | One tame unipotent factor with two components; s auxiliary components | Unipotent side 2s components, distinct-character side s; with R=∅ both counts s | Product and unique-generalization statements agree. Retained. |
| 4.5 Ihara support | Prepared dimension 32; augmentation has 5+14 generators | Lower bound 32−19=13=dimΛ; for each choice of the two tame components there is an auxiliary component | Full component transport is stronger than nonempty support. |
| 4.6 Auxiliary removal | R=∅; two dyadic places over L⁺ | Correct #T′=2+1=3; omitting S₂ would give 1 and zero ordinary local factors | The repaired source set retains both ordinary factors. |
| 4.7 Finiteness headline | Finite A→B→C, b and c module generators; Λ[u]/u² | Products give at most bc A-generators; square-zero example has Λ-rank 2 and residual length 2 | Restriction/residual-fibre route permits nilpotents. |
| 4.8 Reduced comparison headline | dimΛ=5, hypothetical component Λ/(ϖ) | Component dimension 4 and zero characteristic-zero points, versus (b)'s required dimension ≥5 | Strong dimension bound is essential and explicitly cited. |
| 5.1 Symplectic framing | #T=1,3; T=∅ | dim gsp₄=11, dim sp₄=10; 11#T−1=10,32; empty framing adds 0 | Fixed similitude tangent and full conjugating group distinguished. Retained. |
| 5.2 Reasonableness | Diagonal torus; p=3 versus 2 | Invariant Cartan dimension 2; trace of diag(1,0,−1,0)² is 2 mod3 and 0 mod2 | H⁰ and odd-prime conditions discriminate. |
| 5.3 Taylor–Wiles headline | h=I₄, p=3; q=4,t=7 | Levi GSp₄; scalar derivative of similitude 2a gives centre∩sp₄=0; detection rank 0; 7≤2·4=8 | Identity Frobenius is allowed but detects no class; q≠t retained. |
| 5.4 Seed and auxiliary obstruction | p=3, q=7/19; h=I₄ or diag(U,U⁻ᵗ), U unipotent 2×2 | q mod9=7/1; h=I has invariant dim10; nonsemisimple h has kernel dim4, [h,X]=2E₁₂+E₄₃≠0 and [h,h−h⁻¹]=0 | Previous nonsemisimple control retained; q≡1 cannot be used for auxiliary vanishing. |
| 5.5 Selected local component | O⟦x,y⟧/(xy), seed (ϖ,0) versus (0,ϖ) | At seed y=0,x=ϖ≠0; opposite point y=ϖ≠0 fails quotient by (y) | Seed selection is a restriction; no unselected component is asserted. |
| 5.6 Gluing and point detection | O⟦x⟧, evaluations x↦0 and x↦ϖ | Values 0 and ϖ≠0 | One point fails to detect x; the dense family is required. Retained. |
| 6.1 Dominance | F⁺_v=ℚ_p, p>2 | dimΛ_v=3; total dim=1+16=17=3+14 | Local dimension count matches global dominance route. Retained. |
| 6.2 Symplectic patching | d=1,#S=3,t=7,I=∅ | g=7−4+3−1=5; 5+30+4=39=7+33−1; total dim42 | Free case and place/cyclic-factor distinction agree with WHI22. |
| 6.3 Reduced comparison headline | O⟦x⟧/(x(x−ϖ)), M=A/(x) | Two horizontal components; both meet the special point; M supports one and misses one | Nonzero support alone fails. README uses the stronger unique-special-component condition. |
| 6.4 Finiteness headline | Λ[u]/u² versus Λ⊕⊕ᵢΛuᵢ with all uᵢuⱼ=0 | Finite rank 2 versus infinitely many independent generators | Complete Noetherian local hypotheses exclude the false nilpotent-kernel inference. Retained. |

Zero coefficient rings are excluded from deformation problems by the specified nonzero residue field; the zero forms module is allowed and passes the projector/image test. General CNL coefficient objects include nonreduced and equal-characteristic Artinian objects, whereas O itself is the integers of a finite p-adic field. Rank-zero trace-span data were tested independently of the arithmetic n≥2 endpoints. Negative and zero counts are not silently interpreted as natural-number subtraction: the presentation hypotheses force the nonnegative generator counts. No opaque operation or conclusion-as-hypothesis is used in the acceptance file.

### Pinned declarations and acceptance file

The pins inspected are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, as recorded in `lake-manifest.json`. The following are library-relative paths at those pins, not searches of a newer library.

| Name opened | File and line | Native meaning and limit relevant here |
| --- | --- | --- |
| `Matrix.trace` | `Mathlib/LinearAlgebra/Matrix/Trace.lean:43` | Sum of diagonal entries over a finite index type. It is the full matrix trace, not a trace-zero projection. |
| `Matrix.trace_one` | `Mathlib/LinearAlgebra/Matrix/Trace.lean:144` | Trace of identity is the cardinality in the coefficient ring; therefore 2=0 in characteristic 2. |
| `Module.End.IsSemisimple` | `Mathlib/LinearAlgebra/Semisimple.lean:56` | Semisimplicity of the associated polynomial-module action. It does not assert invertibility; the roadmap uses it on group elements. |
| `Submodule.span` | `Mathlib/LinearAlgebra/Span/Defs.lean:46` | Infimum of submodules containing the given set; empty span is zero. |
| `Matrix.symplecticGroup` | `Mathlib/LinearAlgebra/SymplecticGroup.lean:102` | The submonoid preserving J; J is defined at :59 with blocks (0,−1;1,0). This is Sp, not the required similitude group GSp. |
| `LieAlgebra.Symplectic.sp` | `Mathlib/Algebra/Lie/Classical.lean:157` | The skew-adjoint matrix Lie subalgebra for J, supporting the dimension-10 tangent object, not GSp-valued deformation rings. |
| `groupCohomology` | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:183` | Homology of the group-cochain complex of a representation in `Rep k G`, with values in `ModuleCat k`. It is not the continuous arithmetic Selmer complex with local conditions. |
| `TauCeti.completedGroupAlgebra` | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` | Compatible families over open-normal quotients; binders at :109 and compatibility subalgebra at :117. The definition assumes a commutative coefficient ring and a topological group carrier, not coefficient completeness or profiniteness. Those are supplied in the arithmetic use. |

Object searches in both pinned libraries for ordinary Hecke/Hida objects, polarized deformation rings, RACSDC objects, and reasonable residual symplectic images did not locate the missing arithmetic carriers. The existing matrix, Lie, group-cohomology and completed-group-algebra objects above do not supply them. The file has no declaration that duplicates a pinned theorem or a declaration at a readable roadmap head.

| README headline | Coverage in `Suggested.lean` module docstring | Why a few simple definitions on native carriers do not suffice |
| --- | --- | --- |
| 1.2(4), dyadic Taylor–Wiles presentations | Explicitly named | Needs arithmetic decomposition groups, local-condition dual Selmer groups and universal polarized deformation rings. |
| 3.2(b), dimension ≥1+n[F⁺:ℚ] | Explicitly named | Needs the actual ordinary polarized deformation ring, not an arbitrary commutative ring. |
| 4.7, dyadic ordinary finiteness | Explicitly named | Needs that ring and the ordinary RACSDC seed carrier. |
| 4.8, dyadic ordinary reduced R=T | Explicitly named | Also needs definite-unitary algebraic modular forms and their ordinary Hecke algebra. |
| 5.3, GSp₄-reasonable Taylor–Wiles places | Explicitly named | Needs the arithmetic Selmer and deformation interfaces; finite matrix reasonableness alone cannot state this theorem. |
| 6.3, symplectic ordinary reduced R=T | Explicitly named | Needs GSp₄ automorphic and Galois carriers, Hilbert–Siegel Hida modules, and flag-image deformation rings. |
| 6.4, selected symplectic finiteness | Explicitly named | Needs the same selected-component ring and seed as 6.3. |

The seven headlines include the two intermediate deep results expressly identified by the file. There are **0 named declarations, 0 sorried theorems, 0 definitions, 0 instances and 0 examples**. Thus the requested one-tactic probe covers an empty set: there is nothing to replace with `simp`, `rfl`, `infer_instance` or a single library lemma. Likewise the `#check @name` binder audit has zero cases; no implicit standing hypothesis can be lost. No stand-in is offered for a missing carrier. Backticked external identifiers in the README all occur in the table above; none purports to be a new declaration of this package.

The prescribed `lake env lean` invocation on `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/Suggested.lean`, run from the pinned content checkout, completed with exit code **0**, no diagnostics and no warnings. It has exactly one `import Mathlib`, the required module docstring, and the required namespace. No Tau Ceti object build was needed. No Lean command was left running.

### Supplier resolution and duplication by object

Read the board package index before assessing ownership. Ran the supplied roadmap resolver and object searches using `roadmaps grep`, then opened relevant suppliers with `roadmaps show`. The resolver reported no missing cross-roadmap citation or Lean name; its warning that it had not inspected the library pins was addressed by the manual pin inspection above. The overlap report contains no conflicting head, dropped cited id, or id defined only by an unnamed open revision. The following records the resolved current citations, including scope-only deferrals. Each file below is `TauCetiRoadmap/<name>/README.md` at the main copy or the indicated open head read through the service; numbers after section identifiers are README line numbers.

| Supplier / readable head | Sections and line witnesses resolved | Ownership comparison |
| --- | --- | --- |
| PotentialAutomorphyInfrastructurePartII, #2135 | 0.2:366; 0.9:490; 1.3:598; 3.1:732; 3.2:760; 3.5:814; 3.6:834; 3.9:892; 3.11:939; 4.1:1041; 4.4:1110; 4.6:1138; 5.2:1209; 5.4:1244 | Base-change/descent statements used at 2 are all-prime. The ordinary constructions imported as comparison are odd-prime; this package owns their dyadic extension, full-kernel equivalence and near-adequate Λ presentation. The positive-depth image-algebra definitions agree. |
| AutomorphicFormsOnReductiveGroups, #1037 | 7.4:1218; 7.5:1245 | Owns coefficient-module forms, weighted double cosets, stabilizers, smallness and automorphic realization. This package imports these carriers and specializes the operators/ordinary theory. |
| ArithmeticGaloisRepresentations, #856 | 7.4:4649; 7.5:4827; 7.9:5242; 7.11:5397 | Owns polarized/symplectic groups, ad⁰ trace condition, adequacy, and vast/tidy images. Full-adjoint dyadic variants and general reasonable-image prime construction here are distinct. |
| LocalGaloisDeformationRings, #923 | F.2.6:745; 1.3:1308; 1.4:1333; 1.9:1406; 1.17:1508; 2.17:1944; 2.22:2034; 2.23:2048; 2.24:2072; 2.29:2204; 6.24:3324; 6.27:3354; 6.29:3411; 6.31:3504; 6.35:3574 | Local rings, framing, ordinary flag image, Ihara geometry and generic points remain here. The general dyadic component and semisimple GSp₄ interfaces are explicitly declared extensions, not falsely claimed supplied. |
| GlobalGaloisDeformations, #920 | 3.3:405; 4.2:712; 4.8:888; 4.9:925; 4.10:953; 4.11:996; 8.1:1877; 8.2:1939; 8.3:1963; 8.4:1995 | Generic representability/restriction and rank-two determinant torsors imported. The existing nonpolarized weight theory does not own the polarized dyadic full-kernel theory. |
| DeformationAndDerivedPatchingAlgebra, #1034 | 1.12:281; 4.1:898; 4.2:914; 4.6:990; 5.2:1049; 5.3:1062; 5.4:1082; 5.5:1097; 6.1:1223; 6.3:1258; 6.5:1283; 6.7:1302; 8.2:1605; 8.3:1626; 8.4:1646; 8.5:1672; 9.6:1865 | Generic extraction, residual-fibre finiteness and support transport imported. Only the elementary depth part of 5.5 is used at 2; its odd-prime balanced theorem is not silently extended. This package supplies the finite-free descent from the torsion weight algebra. |
| AutomorphicGaloisRepresentationsPartII, #1006 | GSp₄ construction:536; AG2.2:1285; AG2.3:1364; AG2.5 compatibility:1857, temperedness:2012 | All-prime RACSDC attachment and away-prime compatibility present. GSp₄ over ℚ does not supply all totally real fields; explicit gap retains that ownership. |
| PotentialAutomorphyInfrastructure, #1081 | 2.5:841; 3.44:1778; 3.47:1837 | Imports auxiliary CM fields, ordinary automorphy and preservation of ordinarity. Derived ordinary cohomology elsewhere in this supplier is a different arithmetic object from the dyadic definite-unitary theorem. |
| PotentialModularityAndCompatibleSystems, #1075 | 2.16:815; comparison with 8.3:1434 | Prescribed local completions permit enlargement of the global degree. Existing rank-two ordinary theory is odd-prime; it does not duplicate this arbitrary-rank dyadic extension. |
| SmoothRepresentationsOfLocalGroups, #1688 | SR.3.2:2710; generator:2744 | Bernstein blocks present; the stated cuspidal generator does not by itself supply the all-block/local-Langlands dictionary gap. |
| ModularityAndLanglandsExtensions, #1180 | 3.9:1882 | General/endoscopic GSp₄ transfer remains imported. |
| AutomorphicBundles, #1069 | 12.11:4928; 12.12:4981; 12.13:5010 | Former B5 numbering is mapped. Classical geometric Hecke actions are supplied; the Hilbert–Siegel ordinary module, auxiliary-level freeness and classicality are explicitly declared gaps. |
| EndoscopicTransferAndUnitaryTraceComparison, #999 | 13.2:5070 | Scope deferral of symplectic solvable descent; it is not re-planned here. |
| OrdinaryAutomorphicFormsAndModularityLifting, #1066 | Scope :3–15 | Base rank-two Skinner–Wiles direction is preserved. The introduction identifies the new dyadic higher-rank and symplectic endpoints. |

Nearest-open-work comparisons were made on scope and objects, not just spelling:

- `TauCetiRoadmap/GSp4NonregularModularityLifting/README.md:13` and :173–179, #1817, explicitly consume this roadmap's ordinary comparisons and selected finiteness. Its nonregular lifting/density direction is downstream, not a second owner.
- `TauCetiRoadmap/AbelianSurfacesModularity/README.md:384` and :504–522, #1746, handle specific finite residual images and applications. They do not own general GSp₄-reasonable Taylor–Wiles prime construction.
- `TauCetiRoadmap/AutomorphyLiftingBeyondTaylorWiles/README.md:7`–15, #1824, treats conditional cohomological lifting for restriction-of-scalars PGLₙ. It neither supplies nor duplicates the definite-unitary dyadic or selected GSp₄ Hida theorem here.
- `TauCetiRoadmap/AutomorphicBundlesPartII/README.md:15` and :1104–1106, #1823, excludes ownership of the projector and adds classical Hilbert–Siegel prime-to-p Hecke actions. It does not supply the three ordinary-module gaps.
- The additional object match `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:7247`–7275, #858, is a rank-two dyadic auxiliary-prime result for nonsolvable projective image. Its residual dual Selmer condition is different from the unavoidable one-dimensional polarized class and arbitrary-rank presentation here.

No double ownership, reciprocal handoff, reused fully qualified Lean name, forbidden supplier, or unowned proof-route prerequisite was found. No dependence on an unprovided open head was inferred merely from a title.

### Supplier order and conditional contracts

Every Needs line and supplier citation was checked against the allowed direction. The prescribed dependency check completed with exactly:

```text
depcheck: 236 roadmaps, 2146 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. In particular the component-support and density arguments use the earlier local/global/algebraic suppliers and this roadmap's §3.2(b), rather than assuming their own R=T conclusion.

The seven gap slugs agree between `design/plan.json` and the package README. Each has a named earlier supplier, exact mathematical hypotheses and an interface narrower than the supplier's whole subject. The related clauses form one needed interface in each case. None requests an already supplied object at the generality used here.

| Gap slug | README location / supplier | Minimality check |
| --- | --- | --- |
| dyadic-flag-ring-dimension | :91, LocalGaloisDeformationRings 6.24 | Existing theorem has trivial residual representation and large local degree; the gap supplies arbitrary flagged residual data and special-component placement used before preparation. |
| gsp4-semisimple-taylor-wiles-places | :92, LocalGaloisDeformationRings 2.17 | Existing regular-semisimple/four-distinct-eigenvalue statement is insufficient for Whitmore's centralizer Levi problem. |
| inertial-types-and-block-levels | :125, SmoothRepresentationsOfLocalGroups SR.3.2 | Needs the inertia-without-monodromy dictionary and one uniform level per whole block, beyond the stated cuspidal generator. |
| hilbert-siegel-hida-module-free | :134, AutomorphicBundles Layer 12 | Ordinary coherent H⁰ module over the weight algebra is additional to classical Hecke action. |
| hilbert-siegel-taylor-wiles-coinvariants | :135, AutomorphicBundles Layer 12 | Adds auxiliary-level Λ[Δ]-freeness and the augmentation identification; ordinary base-level freeness alone does not imply them. |
| hilbert-siegel-ordinary-classicality | :136, AutomorphicBundles Layer 12 | Adds arithmetic-weight automorphic identification, not implied by freeness or coinvariants. |
| gsp4-galois-representations-totally-real | :112, AutomorphicGaloisRepresentationsPartII, GSp₄ construction | Existing ℚ construction does not supply general totally real fields and the full weight range of the seed. |

These are acceptance conditions, not findings or claims that the suppliers already prove them.

## Not verifiable

- No required sampled text or repaired source passage was inaccessible. All source assertions above were checked against the cached versions identified by the manifest. The Ger19 preprint was read; its numbering was not independently equated with the final published numbering, and the package explicitly uses the preprint numbering.
- The seven declared supplier extensions are future contracts. Their completed formal proofs are not available; acceptance is conditional on those contracts as specified above.
- The additional scalar relation and component-placement work explicitly owned by §3.2(b) is a future target, not a proved consequence of the printed obstruction calculation. The arithmetic checks establish the distinction between nd and 1+nd; they do not prove the latter. This was settled in the preceding repair history and is not a new package defect.

## Source issues

The following are source errata or gaps encountered in the checked passages. They are kept separate from package findings: the package corrects or explicitly owns the relevant arithmetic work. The extra Ger19/Tho17 slips do not change a statement imported here at its stated generality.

- **Misprint** in Tho17 at §2.2, definition of the complex, printed p. 8 (line 337): the source says the higher local summands use the global Galois group; it should be the respective local Galois groups; affects a stated result; corrected in print at BCGP25 §5.4, p. 122 (lines 5518–5520).
- **Error** in Tho17 at Lemma 2.17(ii), printed p. 11 (line 476): the source says the real scalar-kernel dimension is one also at odd p; it should be zero at odd p, since positive cohomology of C₂ then vanishes; affects a stated result.
- **Misprint** in Tho17 at proof of Lemma 2.17(i), printed p. 11 (lines 480–483): the source says the tangent matrix X itself must be symmetric; it should be XA symmetric, retaining conjugation by the polarization matrix A; affects the proof.
- **Error** in Ger19 at Remark 2.4.6, preprint p. 14 (lines 627–631): the source says dualization gives an algebra isomorphism of full endomorphism algebras; it should be an anti-isomorphism on the dualizable modules in use, restricting to an isomorphism on the commutative Hecke algebras; affects a stated result.
- **Error** in BCGP25 at §5.4 after (5.4.3), printed p. 123 (lines 5567–5571): the source says cohomology vanishes outside degrees one and two; it should be one-dimensional in degree three in the absolutely irreducible dyadic situation; affects a stated result.
- **Misprint** in BCGP25 at Remark 5.4.4, (5.4.5), printed p. 124 (line 5598): the source says the last global H² group has scalar coefficients; it should be adjoint coefficients in the inflation–restriction sequence; affects a stated result.
- **Gap** in BCGP25 at Remark 5.4.4, printed p. 124 (lines 5601–5605): the source says scalar real restriction proves the required adjoint injectivity; it should be justified using a nonalternating real polarization, since the alternating case kills the scalar class; affects the proof.
- **Misprint** in BCGP25 at proof of Lemma 5.5.3, printed p. 125 (line 5645): the source says F⁺ lies inside the next real cyclotomic layer; it should be the least m with that layer not contained in F⁺, forming the compositum; affects the proof.
- **Misprint** in BCGP25 at proof of Lemma 5.5.3, printed p. 126 (lines 5680–5682): the source says the quadratic character and ramification belong to L/L⁺ and L⁺/L; it should be L⁺/F⁺ in both places; affects the proof.
- **Misprint** in BCGP25 at Proposition 5.5.6(i), printed p. 126 (line 5696): the source says the sign condition is on µ; it should be on the chosen lifted multiplier χ; affects a stated result.
- **Error** in BCGP25 at §5.7, ordinary-operator compatibility, printed p. 131 (lines 5919–5940): the source says compatibility includes spherical depth zero; it should be restricted to positive Iwahori depth, with spherical operators separate; affects a stated result.
- **Misprint** in BCGP25 at (5.7.3), printed p. 131 (line 5953): the source says the reduction target is one residue-field multiplicative group per place; it should be the diagonal residue torus, with n factors per place; affects a stated result.
- **Misprint** in BCGP25 at Lemma 5.7.7, printed p. 133 (line 6045): the source says the weight dimension is 1+n[F:ℚ]; it should be 1+n[F⁺:ℚ]; affects a stated result.
- **Gap** in BCGP25 at proof of Lemma 5.7.7, printed pp. 133–134 (lines 6046–6059): the source says the cited obstruction calculation gives the asserted dimension bound; it should be supplemented by the additional scalar relation needed after retaining h³=1; affects the proof.
- **Gap** in BCGP25 at proof of Lemma 5.7.7, printed p. 133 (lines 6046–6048): the source says the cited local ordinary component theorem applies before preparation; it should be supplemented for nontrivial residual data and small local degree; affects the proof.
- **Gap** in BCGP25 at Proposition 5.7.9, printed p. 134 (lines 6060–6075): the source says the specified levels alone supply the seed localization; it should be required that the seed has fixed vectors at the remaining tame places; affects a stated result.
- **Gap** in BCGP25 at proof of Theorem 5.7.14, printed pp. 135, 139 (lines 6118–6126, 6280–6291): the source says the listed preparation permits the final universal restriction map; it should be supplemented by uniform unipotent ramification of restrictions of all original lifts; affects the proof.
- **Misprint** in BCGP25 at proof of Theorem 5.7.14, printed p. 137 (line 6229): the source says the support is that of the primed patched module; it should be the unprimed module over the field then in use; affects the proof.
- **Misprint** in BCGP25 at proof of Theorem 5.7.14, printed p. 138 (line 6261): the source says T′ consists only of R′ and the new auxiliary place; it should be augmented by every dyadic place of L⁺; affects the proof.
- **Gap** in BCGP25 at §6.3 before Hypothesis 6.3.1, printed p. 146 (lines 6623–6624, 6642–6644): the source says Theorem 1.8.17 supplies the seed in the stated weight range; it should be supplemented by the regular-weight GSp₄ attachment theorem beyond the ordinary weight-two case; affects the proof.
- **Misprint** in BCGP25 at §6.3, local characters, printed p. 147 (lines 6668–6670): the source says each place uses parameters indexed by p; it should be the parameters indexed by the particular place v above p; affects a stated result.
- **Gap** in WHI22 at Proposition 3.18, printed p. 22 (lines 1013–1046): the source says the stated detection hypotheses suffice for the auxiliary-prime argument; it should be supplemented by H⁰(F,ad⁰ρ̄)=0 used by Lemma 3.16; affects the proof.

For the additional source-only controls: in characteristic 3, H¹(C₂,M)=0; for A=Ψ₂ and X=diag(1,0) in characteristic 2, X+AXᵗA⁻¹=I₂≠0 despite X being symmetric. For dualization on O², f=E₁₂ and g=E₂₁ give (fg)ᵗ=E₁₁ but fᵗgᵗ=E₂₂. The package uses the dyadic nonalternating µ statement, the correct polarized tangent construction and commutative Hecke images, respectively.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "2984461158c0b34d4ec7f3f0afbbc76fdebc865b", "job": "REV-PKG-OrdinaryAutomorphicFormsAndModularityLiftingPartII~5", "model": "gpt-6-astra", "worker": "chris-4"} -->
