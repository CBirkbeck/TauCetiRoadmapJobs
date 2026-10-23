# K3BlochGroups repair report

The first twelve finding sections correspond, in order, to RT-K3BlochGroups_r2a; the last two correspond to RT-K3BlochGroups_r2b. Their original F01/F02 identifiers are repeated deliberately. The overlapping related-work findings share one repair, recorded under both identifiers. Earlier-round verification tables contain no additional unresolved findings.

## F01 (P2) — applied

Pass a. Arithmetic gap → direct contracts with ArithmeticKTheory §§3.2–3.4, 4.1–4.4, 5.1, 5.3–5.4 and 8.10. Verified the supplied head's rank, primewise invariants, integral tables and examples. Deleted only the obsolete gap; replaced every occurrence in ownership, contracts, Layer 2 dependencies, §5.7 and Layer 5 dependencies. The real-closed gap remains.

## F02 (P1) — applied

Pass a. Independent projective foundations → import PolylogarithmFunctions §5.8 and transport its reciprocal on distinct tuples. That section explicitly owns the homogeneous comparison, invariance and normalize_five. Updated ownership, exact contracts, §3.2 and Layer 3 dependencies. Retained only the adapter, triple stabilizer/orbits and five-face calculation. Reciprocal controls give (1/3,3) and (3,1/3).

## F03 (P2) — applied

Pass a. Added generalLinear_homology_stable, symmetricGroup_homology_stable and finite_sl2_integral_homology on native homology carriers, plus the real-bodied block inclusion generalLinearStabilization. Updated §§4.8, 4.15, 5.2 and the module headline list. Sources: suslin-1984, Theorem 3.4 (waived); kerz line 82; hutchinson2013 lines 704 and 861. All inclusion coefficient morphisms are explicitly identities.

## F04 (P1) — applied

Pass a. General finite-word exactness in §5.4 → §4.0, before both consumers. §5.4 retains the projective-line specialization and hyperhomology comparison. Added the empty augmentation convention and five-letter rank calculation. Kerz's length indexing is explicit: A₀=ℤ, Aₖ=Cₖ₋₁. Evidence: kerz lines 15–23 and 36–79. Updated §4.15 and Layer 4 dependencies.

## F05 (P2) — applied

Pass a. Unrestricted characteristic-p coefficient vanishing → vanishing only in degrees n≥1, with unique p-divisibility obtained from adjacent positive-degree coefficient sequences. Degree zero is ℤ/p. Added the negative control at 𝔽̄₂. The route now uses KTheoryFiniteLocalFields §5.17 rather than applying prime-to-characteristic rigidity at p. Evidence: weibel lines 28137–28144; supplier geisserLevine_fieldComparison.

## F06 (P1) — not actionable in this package: the positive-characteristic integral torsion theorem requires its supplier

Pass a. Connected §§2.2 and 4.18 to KTheoryFiniteLocalFields §§5.17, 6.5a and ArithmeticKTheory §5.2. The latter explicitly supplies characteristic-zero suslinTorsionComparison. Added gap:algebraically-closed-charp-k3-torsion, with matching README/plan contracts and weight-two/Bockstein controls. Only KTheoryFiniteLocalFields can add the missing integral theorem; this package does not claim its coefficient calculation already supplies it. Evidence: weibel line 28322.

## F07 (P3) — applied

Pass a. Unsupported BorelRegulators, PadicHodgeRegulators D.2, HabiroNumberFields section-specific assertions and AlgebraicTopologyPartII AT2.4 → resolved ownership statements or anticipated consumers. Removed occurrences in ownership, §1.5, Layer 5 dependencies and downstream consumers. Retained the wedge theorem with Hatcher Example 4.52 (hatcher line 16500), and the verified Polylogarithms Layers 2/4 contract. Empty, one-sphere and two-sphere values are 0,ℤ,ℤ³.

## F08 (P1) — applied

Pass a. Unspecified low-stem supply → StableHomotopyKTheory §7.1 for η,η², HomotopySpheres Stage 9 item 1 for π₃ˢ=ℤ/24{ν}, and FourManifolds F7.0b for η³=12ν. Read both additional supplier targets. Added the Hopf-generator identification, exact contracts and §4.16/Layer 4 dependencies. The 𝔽₂ witness now computes ℤ/24 divided by {0,12}, giving ℤ/12.

## F09 (P3) — applied

Pass a. Removed the cited defining-law and automatic-zero Checks, retaining their API laws. Replaced §2.4 with ℚ, ℚ(i), 𝔽₅ computations. The pattern sweep also removes repeats in §§1.3, 2.1–2.2, 3.3, 4.12, 6.3–6.5; §§3.12 and 6.6 receive nonzero sign/composition controls. No Lean padding was added. Quotient, boundary and fibre blocks retain substantive controls.

## F10 (P3) — applied

Pass a. Unspecified degreewise sign → K2SymbolsBrauer §11.3's right-linear, parameter-last identity D₃m₃=m₂rᵥ,₃. Retained SchemeKTheoryOperations §§3.6 and 4.7 for transport and splitting. Updated exact contracts, §4.21 and Layer 4 dependencies. The second boundary of {2,t,π} is 1/2, not 2; in degree two at 5 the two residue values are 2 and 3.

## F11 (P2) — applied

Pass a. F : Type → F : Type u, with both localized coefficient objects lifted to ULift.{u}. Applied the same convention to the new integral SL₂ and GL stability statements. Updated exact contracts and §5.2. Native groupHomology requires matching group/ring universes (Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:224). Both finite homology signatures instantiate at ULift (ZMod 2).

## F12 (P3) — applied

Pass a. The zero rational symbol {2,3,5} → {t₁,t₂,t₃} over ℚ(t₁,t₂,t₃). Successive last-slot residues give 1; the Chern composite gives residue 2, reversed ordering −2, zero composite 0. Added K2SymbolsBrauer Layer 9 to §2.2's Needs. The general coefficient formula remains +1,−1,+2, from KTheoryFiniteLocalFields §6.10's diagonalChernMilnor.

## F01 (P2) — applied

Pass b. Added finiteBloch_order: an existential additive boundary determined on actual preBloch symbols, with its kernel additively equivalent to the cyclic group of the stated order for q≥4. No ad hoc Bloch carrier is introduced. Updated §5.5 and the module headline list. Evidence: hutchinson2013 lines 1676–1679 and 1731; the q=2,3 exclusions remain explicit.

## F02 (P3) — applied

Pass b. Removed BorelRegulators §8.5 together with pass a F07's repair. Removed ArithmeticQuantumTopology from both the merge-order claim and downstream consumers. Searches on main and the indexed open heads do not supply either claimed roadmap. Retained only anticipated descriptions for unreadable consumer interfaces; no mathematical target or verified Polylogarithms interface was deleted.

## Required checks and gate outcomes

- Elaborated packages/K3BlochGroups/Suggested.lean from the pinned content checkout, passing its absolute filename as required: exit 0; exactly eight `declaration uses 'sorry'` warnings, at lines 40, 94, 107, 119, 132, 144, 156 and 169; no errors. There are no TauCeti imports to build.
- Elaborated one scratch copy with `#check @name` for **all thirteen declarations**, then two applications at ULift (ZMod 2): exit 0, the same eight warnings, no errors. Inspected every printed type. No section hypothesis disappeared. In particular Infinite F, both stability ranges, primality/characteristic, the q≥4 bound, formal reality and identity coefficient maps all remain present. The former Type-zero restriction is now genuinely universe-polymorphic; the block inclusion itself requires Field F but correctly does not require infinitude.
- Dependency command: the prescribed `tauceti-roadmap ... gate --depcheck packages/K3BlochGroups/README.md --name K3BlochGroups --order merge-order-main.txt --movable`, with the configured filenames expanded as instructed: exit 0. Exact output:

```text
depcheck: 25 roadmaps, 220 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line is emitted. Neither tooling nor merge order was edited.

- Citation resolution after the edits: exit 0, no cross-roadmap citation found nowhere and no Lean name found nowhere. Its native-library discovery reports no pinned Lake packages on its host; native signatures were therefore verified separately against the specified pins through elaboration and source reads, rather than treating that resolver as library evidence.
- `git diff --check`: exit 0. README/Lean name comparison: all thirteen declared names occur in the README; no declaration was deleted. No new imported module, sorry'd data, set_option or admitted example occurs.
- No gate failures were separately supplied in the brief. No missing source was added: the twelve certified and three waived lifetime source keys remain settled. Kerz's cited_for now includes §4.0. No waived text was requested.

## Signature and ownership audit

The library revisions match content/lake-manifest.json: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The thirteen-declaration inventory is five simple definitions and eight admitted headlines. The added block inclusion has a real inverse block and proved homomorphism laws. The finite Bloch boundary is uniquely fixed on generators, including the killed symbol of one; it is not a free predicate or assumed conclusion.

Read the main AlgebraicTopology and GlobalNumberFields roadmaps for shape. Rechecked the external sections through the readable main copies or new-roadmap heads: AlgebraicTopology Stages 2–5/8; UniversalCovers Stages 2–3; AlgebraicCurves sublayer 12A; GlobalNumberFields Layer 1; RealAlgebraicGeometry Layers 1/6; StableHomotopyKTheory §§1.17, 1.30, 1.32, 3.26–3.29, 3.31–3.32, 4.14, 5.19, 6.3, 7.1, 7.27; GeneralAlgebraicKTheory §§1.8, 3.2–3.4, 3.12, 7.4, 13.8a–c; AlgebraicKTheory A5; K2SymbolsBrauer's symbol, residue and signature sections, especially §11.3; KTheoryFiniteLocalFields §§1.5, 1.8, 3.0/3.0a, 5.17, 6.5a, 6.10; SchemeKTheoryOperations §§3.6, 4.7, 5.5, 6.4; PolylogarithmFunctions §§5.8, 6.1, 6.3–6.5; ArithmeticKTheory §§3.2–3.4, 4.1–4.4, 5.1–5.4, 8.10. The new stem contracts resolve exactly to HomotopySpheres Stage 9 item 1 and FourManifolds F7.0b. Polylogarithms Layers 2/4 explicitly consume these Bloch conventions and rational-curve results.

The native source checks include Mathlib/GroupTheory/Perm/ViaEmbedding.lean:42, Mathlib/Data/Fin/SuccPred.lean:95, Mathlib/Data/Matrix/Block.lean:213/298, Mathlib/LinearAlgebra/Matrix/Reindex.lean:82 and Mathlib/Algebra/Ring/ULift.lean:111. Tau Ceti's tensor negative eigenspace is at TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean:126, affine invariance at TauCeti/Algebra/Field/LinearFractional.lean:51, Shapiro inverse at TauCeti/RepresentationTheory/Homological/GroupHomology/Shapiro.lean:98, connecting naturality at its LongExactSequence.lean:106, and Mackey at TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction/Mackey/AllDegrees.lean:279. A supplier's future declaration, such as uce.source_superperfect, is checked in that supplier's target, not misclassified as missing at the pins.

Ownership searches used roadmaps grep/show, main, board packages and every supplied sibling checkout, by cross-ratio, Bloch presentation, finite homology, stability, injective words and torsion objects. The provided open work was checked; no unprovided checkout was sought. PolylogarithmFunctions owns the general projective construction, ArithmeticKTheory the arithmetic tables and characteristic-zero torsion comparison, and K2SymbolsBrauer the signed residue comparison. The additional acceptance statements describe already-owned targets of §§4.8, 4.15, 5.2 and 5.5 here. No earlier supplier was found for their remaining field stability, symmetric stability, finite unstable SL₂ or Bloch-presentation theorems, and no declaration adopts another readable roadmap's fully qualified name.

The general word theorem changes its location, not its owner. The remaining positive-characteristic integral torsion input is assigned to KTheoryFiniteLocalFields §6.5a through the explicit gap; the coefficients alone were not promoted to a torsion isomorphism. The RealAlgebraicGeometry gap remains justified by its Layer 6's explicit restriction to ℝ. The readable sources support the new statements; suslin-1984, suslin-1991 and bloch remain waived, so their primary locators are not represented as newly certified text.

## Adversarial mathematics ledger

Each row records a statement or construction and the actual discriminating values used. Augmented word degrees are lengths; their ordinary complex degrees are one lower. Finite-group orders below are positive integers, not natural-number formulas extrapolated to a nonexistent field of size one. Tests are witnesses and boundary checks, not proofs of admitted headlines.

| Statement | Instances tried | Computed values on the two sides / wrong model | Result | Change |
| --- | --- | --- | --- | --- |
| Ring and field conventions | Zero ring; 𝔽₂; ℤ/4 | St(0)=1 and K₃(0)=0; 𝔽₂ has 0≠1; ℤ/4 has 2²=0 and is excluded as a field | Domains separate the degenerate ring from field targets | None |
| Integral coefficients in universe u | ZMod 2 and ULift (ZMod 2) | q=2 in both cases; q²−1=3 in both, with group and coefficients both in Type u | No field is excluded by universe | Lift both coefficient occurrences |
| Homological comparison c_A | All carriers ℤ/5, q(x)=2x, other maps identities | q⁻¹(1)=3, whereas q(1)=2; identity comparison gives 1 | Distinguishes direction | Retained |
| Steinberg plus carrier | A=0,ℤ,ℚ | At 0 all positive homotopy groups are 0; at ℤ, π₂(BSt⁺)=0 versus π₂(BE⁺)=ℤ/2; at ℚ, π₁(BGL⁺)=ℚˣ versus π₁(BSt⁺)=1 | Distinguishes three spaces | None |
| Bar evaluation and boundaries | Trivial group and g≠1 | d₄[1,1,1,1]=[1,1,1], so ev=0 on a nonzero chain; d₃[g,1,1]=[1,1]−[g,1]≠0 | Cycles are required | Removed generic zero-law repeats |
| Ring-induced tuple map | ℤ→𝔽₂ on x₁₂(1) and x₁₂(2) | Images are x₁₂(1)≠1 and x₁₂(0)=1; coefficients remain integers | Entry maps and coefficient maps differ | None |
| Wedge π₃ | Empty, one and two copies of S² | 0, ℤ and ℤ³ respectively; the last has two Hopf coordinates and one mixed coordinate | Arbitrary-index statement includes boundaries | Added explicit small cases |
| Hopf addition formula | a=ι₁,b=ι₂ in S²∨S² | Pinch composite coordinates (1,1,1); sum of pure Hopf classes (1,1,0) | Mixed coefficient is +1 | Kept oriented target |
| Hopf-unit comparison | Transposition over ℤ and 𝔽₂ | Determinants −1 and +1; minus-one operation vanishes in characteristic two | Same stabilization convention | None |
| Hopf/Hurewicz kernel | K(ℤ,2), K(ℤ,3), A=ℤ | (π₃,H₃)=(0,0),(ℤ,ℤ); K₃(ℤ)→H₃(E(ℤ)) has orders 48→24 and kernel 2 | Kernel need not split | Retained |
| Degree-three Milnor image | ℚ; ℚ(i); 𝔽₅ | Source groups ℤ/2,0,0; ambient groups ℤ/48,ℤ⊕ℤ/24,ℤ/24 | Image is not all torsion | Removed defining-rule Check |
| Indecomposable quotient | Same fields | ℤ/48 divided by {0,24}=ℤ/24; (ℤ⊕ℤ/24)/0 unchanged; (ℤ/24)/0 unchanged | Quotient is not torsion-free quotient | Direct arithmetic suppliers |
| Degree-three diagonal Chern coefficient | x={t₁,t₂,t₃}; transposed first entries | Iterated residues of x,2x,−2x,0 are 1,2,−2,0; transposition changes 2 to −2 | Separates sign and zero maps | Replaced rational zero symbol |
| Former rational Chern witness | {2,3,5} in K₃ᴹ(ℚ) | Sign coordinate 0; residues of 0,2·0,−2·0 all 0 | Former control was vacuous | Explicitly excluded as detector |
| Characteristic-two Milnor branch | 𝔽₂(t₁,t₂,t₃); Prüfer 2-group | Iterated residue of 2x is 2 in ℤ, hence nonzero; Prüfer element 1/2 is nonzero but twice it is 0 | Divisibility alone does not imply torsion-freeness | Retained native no-p-torsion input |
| Characteristic-p finite coefficients | Ω=𝔽̄₂, n=0,1,4 | K₀(;ℤ/2)=ℤ/2; K₁(;ℤ/2)=K₄(;ℤ/2)=0 | Degree zero refutes unqualified vanishing | Added n≥1 |
| K₄ all-prime divisibility | Ω=𝔽̄₂, r=2,5 | K₄=0, so K₄/r=0; at r=5 the coefficient/Bockstein groups both have order 5, while at r=2 both are 0 | Includes the defining prime | Connected coefficient/torsion inputs |
| Characteristic-zero K₄ route | Ω algebraically closed, r=2 | K₄(;ℤ/2)=ℤ/2→K₃[2]=ℤ/2 sends the normalized generator to 1; its kernel K₄/2 is 0 | No odd-prime restriction | ArithmeticKTheory §5.2 |
| Weight-two degree-zero edge | Ω algebraically closed, char≠2 | K₄(Ω)/2=0; the surjection onto H⁰(Ω,ℤ(2)) gives H⁰/2=0, while finite étale H⁰(μ₂⊗²)=ℤ/2 | Étale group itself is not zero | Route retained with exact suppliers |
| Number-field signature basis | ℚ and the two real places of ℚ(√2) | {−1,−1,−1} gives 1 over ℚ; units −√2,√2 give coordinates (1,0),(0,1) in ordered real embeddings | Constant generator cannot isolate both places | Removed automatic zero test |
| Totally imaginary decomposables | ℚ(i) | Real-place index set empty; Milnor K₃=0, D=0, ambient torsion ℤ/24 remains nonzero | D is not ambient torsion | Retained |
| Stable special-linear Hurewicz | ℚ; ℚ(i); 𝔽₅ | 1↦1 and 24↦0 in 48→24; free/torsion coordinates survive over ℚ(i); at 𝔽₅ source/target orders 24, whereas P has order 6 | Three nonzero controls | Replaced §2.4 Checks |
| Rationalization | ℚ and ℚ(i) | Ranks of both K₃ and K₃ind are 0 and 1; Milnor rationalization has rank 0 in both | Rational rank loses the order-two image | Direct rank contract |
| antisymSquare | A=0,ℤ,ℤ/2,ℤ/3 | Cokernels 0,ℤ/2,ℤ/2,0; ordinary exterior squares all 0 | Integral diagonals matter | Kept definition |
| antisymSquare_diagonal_exact | A=ℤ² | Source (ℤ/2)²⊕ℤ; p(a,b,c)=c, kernel (ℤ/2)²; e₁∧e₁=(1,0,0), e₁∧e₂=(0,0,1) | Kernel is precisely A/2A | Kept headline |
| Antisymmetric eigenspace comparison | R=M=ℤ and R=M=ℚ | Over ℤ cokernel ℤ/2 versus eigenspace 0; over ℚ both 0 | Invertibility of 2 is essential | Removed generic symmetry Check only |
| Projective reciprocal adapter | (0,∞,1,3),(∞,0,1,3) over ℚ | Supplier values 1/3,3; adapter values 3,1/3; products 1,1 | Normalization fixed in both orders | Imported foundations |
| Cross-ratio covariance | Translate (0,∞,1,2) by +1 | Tuple becomes (1,∞,2,3), with cr=2 before and after | GL₂ transport preserves value | Retained |
| Cross-ratio orbit and triple stabilizer | 𝔽₂,𝔽₃ and diag(2,1) over ℚ | At 𝔽₂ both orbit set and F−{0,1} are empty; over 𝔽₃ every quadruple value is 2; diag(2,1) sends 1 to 1/2, while scalar diag(2,2) fixes it | Distinctness and scalar stabilizer agree | Kept adapter-specific targets |
| Five deletion faces | (0,∞,1,2,3) | Faces 1/2,3/4,3/2,3,2; alternating sum [1/2]−[3/4]+[3/2]−[3]+[2]=R(2,3) | Same ordered symbol relation | Recomputed with adapter |
| preBlochRawSymbol | 0,1,2 over ℚ | Values 0,[1],[2] in the free unit group; last two are distinct nonzero basis vectors | Raw one is not reduced one | Kept simple definition |
| Five-term generator | (2,3), x=y, y=1 | R(2,3) has the five values above; raw R(x,x)=[1]; y=1 gives zero denominator and is inadmissible | Admissibility excludes junk division | Retained |
| Finite five-term certificate | No pairs with k=1; indicator (2,3) | Evaluations [1] and [2]−[3]+[3/2]−[3/4]+[1/2]; the latter has five nonzero free coefficients | Certificate evaluation is not zero map | Removed uniqueness-law Check |
| preBloch and preBlochSymbol | q=2,3,4,5 | P=0,ℤ,ℤ/5,ℤ/6; at q=4 relation determinant 3·3−(−2)²=5; at q=5 [2]=2[3],[4]=0, ord[3]=6 | Zero quotient and extra-free-generator models fail | Removed defining-law Checks |
| Suslin boundary sign | [3] over ℚ | β(3∧(−2))=0·0−1·1=−1; reversed order gives +1 | Sign is detected outside the kernel | Retained |
| Suslin boundary/kernel | 𝔽₅ with unit generator 2 | ∂[3]=9 mod2=1, ∂[2]=2 mod2=0; kernel of ℤ/6→ℤ/2 has order 3 | Exterior target would give kernel order 6 | Retained controls |
| Universal c and inversion | q=4,5,7,11 | ord(c)=1,3,2,6; at q=4 ω³=1≠ω and 2c=3c=0 | Characteristic-two root has order three | Retained corrected convention |
| Small fields | q=2,3 | B(𝔽₂)=0; B(𝔽₃)=2ℤ≅ℤ, because ∂[−1]=1 in ℤ/2 | Order formulas 3 and 2 would be false | Kept exclusions |
| Exterior replacement | q=3,5 | B̃=ℤ,ℤ/6; B=2ℤ,ℤ/3; quotient by B is ℤ/2 in each case | Distinct kernel conventions | Retained |
| Full-tensor lecture kernel | 𝔽₅ | R(2,3)=[4], λ([4])=2 in ℤ/4; λ(2[4])=0; μ(2[4])=0 but μ(4[3])=2c≠0 | Relation subgroup is not contained in raw kernel | Retained |
| Lecture obstruction | q=2,3,5 | At 2, E=L=0; at 3, E=0 and μ:2ℤ→2ℤ is identity; at 5, 4[3] has nonzero image of order 3 | Obstruction and kernel distinguish cases | Retained |
| Generic projective presentation | q=2,3,5 | G₂gen=0,ℤ,ℤ/6; at 5 its boundary kernel has order 3 | Generic presentation is not Bloch kernel | Retained |
| Rational all-curve comparison | q=2,3 | At 2 source/target/kernel=0; at 3 P⊗ℚ=ℚ, G₂curv=0, Kcurv=ℚ | Universal isomorphism would fail | Conditional all-curve claim unchanged |
| Rational boundary sign | class(3) over ℚ | β(∂[3])=−1, β(δcurv(class(3)))=+1 | Nonzero sign control replaces formula repeat | New Check |
| Older extended convention | 𝔽₂ and 𝔽₁₁ | B_old orders 3 and 6; Suslin orders 1 and 6 | Small-field extension adds a class | Retained |
| Exterior extended relation | ξ₂,₁ over ℚ | Boundary 2∧(−1), sign/valuation pairing 1 mod2≠0; negative-unit boundary 0 | Intersection repair is necessary only for exterior version | Retained |
| Negative-unit tensor target | 𝔽₃,𝔽₅ | Q_neg=ℤ/2,0; at 5 the imposed tensor is 3 in ℤ/4 and generates it; Q_s(𝔽₅)=ℤ/2 | Targets cannot be interchanged | Retained |
| Published projective quotient | q=2,3,11 | B_new=ℤ/3,0,ℤ/3, versus B_old=ℤ/3,ℤ/2,ℤ/6 | Nontrivial convention controls remain | Removed defining boundary-zero Check |
| Exact convention maps | q=5,7,11 | κ_new has group orders 3→3,4→2,6→3; kernels have orders 1,2,2 | No universal integral equivalence | Retained |
| Finite injective words, empty set | m=0 | A₀ rank 1, no boundaries, H₀=ℤ | Top survives, not acyclic | Added convention |
| Finite injective words, one letter | m=1 | Chain ranks (1,1), boundary rank 1, homology ranks (0,0) | Augmentation is exact | General target moved earlier |
| Finite injective words, two letters | m=2 | Chain ranks (1,2,2), boundary ranks (1,1), homology ranks (0,0,1) | Ordinary H₁=ℤ | Same target |
| Finite injective words, three letters | m=3 | Chain ranks (1,3,6,6), boundary ranks (1,2,4), homology ranks (0,0,0,2) | Ordinary top H₂=ℤ² | Same target |
| Finite injective words, four letters | m=4 | Chain ranks (1,4,12,24,24), boundary ranks (1,3,9,15), homology ranks (0,0,0,0,9) | No lower homology | Recomputed |
| Finite configuration at q=4 | m=5 | Chain ranks (1,5,20,60,120,120), boundary ranks (1,4,16,44,76), top rank 44 and all lower augmented ranks 0 | Ordinary H₁,H₂,H₃ vanish, H₄ survives | Added range Check; §5.4 specializes §4.0 |
| Infinite ordered words | Any finite-support cycle, then fresh x | d(x,c)=c−(x,dc)=c when dc=0 | Fresh-point contraction has coefficient +1 | Infinite hypothesis retained |
| Hyperhomology comparison | G=1,X of size 2 | H₁(G,C)=ℤ but H₁(G,ℤ)=0 | Acyclicity cannot be dropped | Retained |
| Independent-vector chains | n=0; (e₁,e₂); (e₁,2e₁) | Caug at rank 0 is ℤ; d(e₁,e₂)=e₂−e₁; determinant(e₁,2e₁)=0 | Distinct vectors alone do not define frames | Retained |
| Affine frame action | Shear ((1,0),(1,1)) | (1,0) maps to (1,1), not (1,0) | Lower-coordinate action is nontrivial | Retained |
| Scalar acyclicity | F=ℚ,V=ℚ,j=1; finite negative control F=𝔽₂ | Scalar 2−1 acts as identity on H₁(V)=ℚ, so coinvariants 0; for 𝔽₂ the scalar group is trivial and H₁=ℤ/2 | Infinite-field restriction is material | Retained |
| Frame algebra and e | n=0,1,2 | S₀=ℤ; S₁=Fˣ; e maps to (0,1) in K₂ᴹ⊕ℤ; 1·e=e | Rank-two extra summand is nonzero | Retained |
| Connecting map δ₁ | [2] over ℚ | δ₁[2]=⟨2⟩, represented by multiplicative unit 2; negative convention gives 1/2 | Ordered normalization is detected | Retained |
| Milnor retraction θ | {−1,−1,−1} over ℝ | Retraction returns the nonzero order-two symbol; coefficient 2 would return 0 | Injectivity is not a rank claim | Retained |
| Unstable SL₂ symbol relations | Steinberg pair (2,−1) and (1,b) | s(2,−1)=s(2,1)=0 in coinvariants; s(1,b)=0; ordered Milnor symbol {2,1−2}=0 | Relation and ordered-torus normalizations agree | Retained |
| Frame-algebra splitting | e and its Milnor retraction | e↦(0,1), retraction(e)=0; the integer coordinate stays 1 | Milnor and e images have zero intersection | Retained |
| generalLinearStabilization | n=0; g=(2) over ℚ | Empty matrix↦(1); g↦diag(2,1), inverse diag(1/2,1), product I₂, determinant 2 | Actual block inclusion, with real inverse | Added definition |
| generalLinear_homology_stable | (n,i)=(0,0),(1,1); outside range (0,1) | H₀ map ℤ→ℤ is identity; H₁ map ℚˣ→ℚˣ is identity by determinant; outside range 0→ℚˣ misses 2 | Range includes precisely the stated boundaries | Added headline |
| Torus and monomial groups | F=𝔽₂,𝔽₃,n=2 | At 2, |T₂|=1,|M₂|=2; at 3, |M₂|=2²·2=8 while |GL₂|=8·6=48 | Monomial group is generally proper | Retained |
| Configuration coinvariants | Triple and quadruple degrees | Triple deletion sum 1−1+1=1, quadruple sum 1−1+1−1=0; low row homology ℤ,0,0,P | Correct parity and degree of P | Recomputed with cross-ratio adapter |
| Rank-two face matrices | a=2; a=0,1 | det(A,B,C)=(−1,−2,2); at 0, C singular; at 1, A,B singular | Denominators and action domain hold | Retained |
| Rank-two d³ splitting | a=3 and valuation pairing | Raw total-differential pair (1,−1)↦(0,−1); inverse recovers (1,−1) | Sign/coordinate change agrees with ∂[3] | Retained |
| Determinant-one torus in d³ target | Ordered degree-two tensor | Raw (2,−2)↦(0,−2); changing the second sign would give (4,2) | Same shear is used in finite refined comparison | Retained |
| Rank-two edge/Bloch image | [2] over ℚ; finite negative control 𝔽₄ | ∂[2]=2∧(−1)≠0; H₂(GL₂(𝔽₄))=ℤ/2 versus Λ²𝔽₄ˣ⊕K₂(𝔽₄)=0 | Infinite hypothesis cannot be dropped | Removed definition-repeat Check |
| General-position and alternating cone complexes | Collinear triple; finite sizes 3,4 | determinant of ((1,0,0),(0,1,0),(1,1,0))=0; alternating-cone top ranks 3,8, distinct from ordered-word ranks 2,9 | Complexes are distinct | Retained |
| Rank-three map ψ′ | a=2 over ℚ; five rotations over 𝔽₁₁ | ψ′ gives [2] with nonzero boundary; five rotations sum to 2c, of order 3 at q=11 | Chain values are not all Bloch cycles | Retained |
| Permutation basis Γ | Integer matrix in §4.15 | det Γ=1; conjugate P₁₂ has entry (2,3)=1; double swap retains lower-right swap | Valid in characteristic two | Retained |
| cyclicHomology_power_map | m=1,7; a=0,2; j=1,2 | m=1 group 0; a=0 gives 0; on H₁ exponent 1 gives 2, on H₃ exponent 2 gives 4 mod7 | Weight two is not weight one | Kept headline |
| Different-order cyclic inclusion | C₂→C₄ on H₃ | 1↦2 mod4, of order 2, rather than applying same-order power-square rule | Inclusion is injective | Retained |
| symmetricGroup_homology_stable | (n,i)=(0,0),(2,1); outside range (1,1) | ℤ→ℤ identity; ℤ/2→ℤ/2 isomorphism; outside range 0→ℤ/2 is not onto | 2i≤n has correct endpoint | Added headline |
| Permutation primary image | Sylow C₅⊂Σ₆; C₃ factors | Power two acts by 4 mod5, stable equation 4z=z forces z=0; C₃ images generate 2c of order at most 3 | No spurious 2- or 5-primary Bloch image | Retained |
| Stable Hopf cube | π₃ˢ=ℤ/24 | η³=12ν has order 2; quotient size 24/2=12; −12ν=12ν | Abstract stem order alone was insufficient | Added exact suppliers |
| Monomial indecomposable homotopy | F=𝔽₂,ℚ | At 2, ℤ/24/⟨12⟩=ℤ/12; at ℚ, ℤ/4⊕ℤ/12 has order 48=2·2·12 | Same cube convention throughout | Explicit quotient witness |
| Cyclic second Chern class | Weights +1,−1, modulus 5 | u+(−u)=0; c₂=−u²=4u² mod5; e after Bockstein is −c₂=+u² | Fixes e-invariant sign | Supplier linkage added |
| Closure detector weight | ζ₅↦ζ₅²; C₇ power two | Weight-two multipliers 4 mod5 and 4 mod7; untwisted multiplier 2 differs in each | Naturality needs the twist | Added characteristic-two control |
| Positive-characteristic torsion gap | Ω char2, modulus 5 and modulus 2 | K₄(;ℤ/5)=μ₅⊗² has order 5, normalized Bockstein requires order-five integral torsion; K₄(;ℤ/2)=0 | Coefficients do not define the integral comparison | Explicit supplier gap |
| Tor versus ordinary tensor | Divisible torsion μ and μ(ℚ)=C₂ | μ⊗μ=0; Tor(C₂,C₂)=C₂ and its detector sends the nonzero class to nonzero 2-torsion | Zero tensor target is wrong | Retained |
| Doubling γδ versus detector | μ(ℚ)=C₂ | Tor projection multiplies by 2, hence is 0; closure detector on its generator has value of order 2 | Doubling map is not the detector | Retained |
| Enhanced Tor/root models | ℚ,𝔽₄,𝔽₅ | T̃(ℚ)=C₄ versus Tor=C₂; at 4 squaring exchanges ω,ω²; μ̃(𝔽₅)=μ₈ of order 8 | Root model is not natural weight one | Retained |
| Infinite Suslin sequence | ℚ | Orders 4→24→6; kernel representatives 0,6,12,18; ordinary Tor would give 2·6=12≠24 | Enhanced kernel is necessary | Retained |
| Degree-three residue comparison | {2,t,π} over ℚ(t)((π)) | r₃ gives {2,t}; D₃m₃=m₂{2,t}; next D₂ gives 1/2, while negation gives 2 | Positive degree-three sign is discriminating | Imported §11.3 |
| Degree-two residue comparison | {2,5} at 5 | Milnor value 2; Quillen value 2⁻¹=3 mod5 | Sign parity is not interchangeable | New paired Check |
| Rational-function rigidity | F=𝔽₂,𝔽₃ | K₃ind orders 3,8 persist in F(t); B(F) is respectively 0,ℤ and is excluded from the combined large-field statement | K₃ rigidity is not small-field Bloch rigidity | Retained |
| Rational-curve relation [1] | R(tx,ty), t=0; [s]+[1−s] | First specialization is [1]; second endpoint difference is 2[∞]−[1]−[0] | Degenerate relation cannot be omitted | Retained |
| Finite-field K-theory maps | q=2,d=2 | K₃ orders 3→15; compatible restriction 1↦5, transfer 1↦1; composites give 2 mod3 and 5 mod15 | Degree and geometric-series factors agree | Retained |
| Multiplication Cartan matrix | 𝔽₄/𝔽₂ and ω²=ω+1 | Matrix ((0,1),(1,1)), determinant 1, trace 1; multiplication by 0 has determinant 0 | Unit/norm-one domain is essential | Retained |
| Finite-group homology duality | C₂ in degrees d=0,1 | H₀=ℤ but H¹=0; H₁=C₂ and H²=C₂ are dual | Positive-degree hypothesis is essential | Retained |
| Quaternion periodicity | Q₈ | H₁=C₂²,H₂=0,H₃=C₈, whereas cyclic C₈ has H₁=C₈ | Nonabelian control | Retained |
| finite_sl2_localized_homology | q=2,3,4,5,7,8,9,27 | Cyclic orders 3,8,15,24,48,63,80,728 | Includes p=2,3 and every field size | Universe repair |
| finite_sl2_integral_homology | Same cardinalities | Orders 6,24,30,120,48,126,240,2184; exceptional factors respectively 2,3,2,5,1,2,3,3 | Formula matches defining-primary table | Added headline |
| Actual finite stabilization | q=4,5,7 | Integral→K₃ orders 30→15,120→24,48→48; kernels have orders 2,5,1 | Localization removes precisely characteristic-primary classes | Retained |
| Finite embedding compatibility | 𝔽₂⊂𝔽₄; 𝔽₃⊂𝔽₉ | Localized source images have orders 3 in 15 and 8 in 80 | Actual maps are injective in both characteristics | Retained |
| Refined square-class boundary | 𝔽₄,𝔽₅ | At 4 GF=1, λ₁=0; at 5 λ₁[2]=0 and λ₁[3]=2(1−ε)≠0 | Dropping coefficients changes kernel | Retained |
| Finite refined edge λ | q=4,5,7 | Kernel sizes 30/5=6,120/3=40,48/4=12 | Integral and localized kernels differ | Retained |
| finiteBloch_order | q=4,5,7,11 | Kernel groups C₅,C₃,C₄,C₆; formulas give 5,3,4,6 | Correct parity and q≥4 boundary | Added headline |
| Finite enhanced kernel | q=4,5,7 | K₃/B orders 15/5=3,24/3=8,48/4=12 | q−1 versus 2(q−1) is detected | Retained |
| Odd coefficient/Cartan theorem | (q,n)=(4,5),(5,3),(7,3) | All five groups at (4,5) are C₅; at (5,3) C₃; at (7,3), K₃/3=C₃ but B/3=0 and gcd(3,6)=3 | Coprimality hypothesis is necessary | Retained |
| Arithmetic supplier examples | ℚ,ℚ(i) | (r₁,r₂,w₂)=(1,0,24),(0,1,24) give C₄₈ and ℤ⊕C₂₄ | Ambient arithmetic precedes quotient | Replaced obsolete gap |
| Formally real order-six headline | c=[2]+[−1] over ℝ | ρ[2]=π²/12,ρ[−1]=−π²/4, sum −π²/6 of exact order 6 modπ²; half-period quotient would give order 3 | Universal bound and nonzero detector agree | Kept blochC_order_six |
| Elementary transfer of finite certificates | No pairs, k=1; ξ=[2]−[3] | k[1] is a nonzero free basis vector; ξ has augmentation 0 but two nonzero coordinates | Equality patterns, not augmentation, are transferred | Real-closed gap retained |
| Purely inseparable field naturality | 𝔽₂(t)→𝔽₂(s), t↦s² | Boundary transports to s²∧(1−s)²=4(s∧(1−s)); the ordered (s,1−s) valuation pairing gives 4, not 0 | Integral coefficients do not acquire characteristic two | Retained field-general map |
| Tensor quotient at junk moduli | P(𝔽₅)=C₆, n=0,1,3 | P/0P=C₆, P/1P=0, P/3P=C₃; modulus zero is the integral quotient | No natural-number division shortcut | Retained |
| Five-term certificate transport | Indicator (2,3); ξ=[2] over ℚ | First evaluation is the five-symbol relation and becomes 0 in P/n; second has boundary 2∧(−1)≠0 and admits no certificate | A zero evaluation map would fail | Removed empty zero Check |
| Boundary certificate mixed coordinate | [2]+[−1] and [2] over ℚ | Mixed totals (0−1)+(1−0)=0 versus −1 mod2=1 | Accepts c, rejects [2] | Removed tautological validity/zero Checks |
| Boundary certificate diagonal | [ω] and 2[ω] over ℚ(√−3) | Exponent product 1·5=5 mod2=1; doubled product 10 mod2=0 | Exterior-only test would accept [ω] wrongly | Retained |
| rootMultiple | δ:ℤ→ℤ/2,x=1,m=2; b=2,m=3 | Underlying kernel values 2 and 6; raw x=1 has boundary 1, not 0 | Multiplication cannot be omitted | Removed annihilator-zero Check |
| rootCoefficient | Same δ, coefficients ℤ/5 | Annihilator 2 gives 1·3=3; annihilator 4 gives 2·4=8=3; raw tensor image is 2·3=1 | Different annihilators agree with unit denominators | Removed x=0 Check |
| Nonflat coefficient negative control | 2ℤ→ℤ tensored with ℤ/2 | Nonzero kernel tensor generator 2 maps to 0; 2 has no inverse in ℤ/2 | Projection alone does not determine class | Retained |
| Suslin lift fibre | ℤ/24→ℤ/6 over 1 and 0 | Fibres {1,7,13,19} and {0,6,12,18}; sixfold multiples of first are 6,18,6,18≠0 | No additive section | Removed automatic zero-fibre Checks |
| Finite bar lift witnesses | G=1; g≠1 | [1,1,1] represents 0 but is a nonzero finite chain; [g,1,1] has boundary [1,1]−[g,1]≠0 | Chain equality differs from homology equality | Retained |
| Mixed finite/infinite naturality | 𝔽₄→𝔽₄(t)→𝔽₄(t)(s) | Both paths carry [ω] to the same order-five class; [ω²]=4[ω] along both paths; reciprocal normalization would interchange 1 and 4 | Nonzero composition control | Replaced zero-class repeat |
| Genuine finite coefficient group | ℚ,n=5 | K₃/5=0, but {2,−31} has residue 2 of order 5 in 𝔽₃₁ˣ and 5{2,−31}={32,−31}=0 | K₂[5] and K₃(;ℤ/5) are nonzero | Retained |
| Even-modulus Chern correction | ℝ,m=2, Bott β | c₂(2β)=1 but 2c₂(β)=0 | Universal degree-two additivity is false | Retained; weibel-chern lines 398–403 |

## Maintainer consequences

The required external change is gap:algebraically-closed-charp-k3-torsion at KTheoryFiniteLocalFields §6.5a; it specifies an integral natural map and its Bott/Bockstein normalization. The unrelated real-closed-elementary-transfer gap remains. The arithmetic gap is deleted because its results are readable at ArithmeticKTheory's supplied head; no arithmetic theorem was moved here.

New dependency edges identify the two stem suppliers, with no dependency cycle reported. PolylogarithmFunctions remains the sole owner of projective cross-ratio foundations; K2SymbolsBrauer remains the sole owner of the general residue comparison. No old acceptance name was renamed or removed. Consumers acquire four additional headline names and one block-inclusion definition, and §5.4 now cites the earlier finite-word target in §4.0. No other package, merge-order file, tooling, issue, pull request or commit was changed. A fresh independent review is still required.
