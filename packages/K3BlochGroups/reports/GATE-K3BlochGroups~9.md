The shared-interface finding contains three distinct consumer repairs, recorded below in their order of appearance. “Answered” records verification and an explicit outstanding repair; none of these points is claimed resolved.

## H01 (CBirkbeck) — answered

`TauCetiRoadmap/ColemanIntegration/README.md:1458`, at head `ae078af`, independently constructs the reduced pre-Bloch quotient, tensor cokernel, boundary and Bloch kernel; lines 1466–1471 assign their universal properties and field maps locally, and line 1478 omits K3BlochGroups from the prerequisites. The required consumer change is to use K3BlochGroups Layer 3 aliases or an explicit presentation adapter and add that prerequisite; `TauCetiRoadmap/K3BlochGroups/README.md:692`, line 733 and lines 2282–2284 already supply the natural symbol/boundary/kernel equivalences and correct supply direction, so this repair remains outstanding in a file outside the authorized edits.

## H02 (CBirkbeck) — answered

`TauCetiRoadmap/PolylogarithmFunctions/README.md:1069`, at head `860558b`, assigns the algebraic symbol constructions, field maps and Bloch groups to ColemanIntegration, conflicting with its K3BlochGroups paragraph at line 1061 and `TauCetiRoadmap/K3BlochGroups/README.md:15`. That sentence must assign the algebraic carriers and maps to K3BlochGroups Layer 3 while retaining Coleman's evaluation, branch descent and coordinate transport; editing the already consistent K3BlochGroups ownership paragraph cannot fix this outstanding consumer sentence.

## H03 (CBirkbeck) — answered

`TauCetiRoadmap/PadicHodgeRegulators/README.md:59`, at head `1a3728e`, imports P/B from ColemanIntegration but the boundary and Suslin/root interfaces from K3BlochGroups, and lines 821–832 use these together without an identification. The consumer must use common aliases or specify symbol-preserving equivalences eP:Pₛ→P꜀ and eQ:Qₛ→Q꜀ with ∂꜀∘eP=eQ∘∂ₛ, their induced kernel equivalence eB, and evaluation Dₛ=D꜀∘eP, all natural in field embeddings; this outstanding repair belongs to the consumer, while the supplier transport is already specified at `TauCetiRoadmap/K3BlochGroups/README.md:692` and line 733.

Build: `lake build TauCetiRoadmap.K3BlochGroups.Suggested` exited 0 with eight expected theorem-`sorry` warnings. Exact completion line:

```text
Build completed successfully (8976 jobs).
```

Gate exited 0. Exact summary line:

```text
gate K3BlochGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The prescribed dependency check exited 0 and produced exactly:

```text
depcheck: 48 roadmaps, 552 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The merge order places PolylogarithmFunctions at line 42, K3BlochGroups at line 110, ColemanIntegration at line 151 and PadicHodgeRegulators at line 209; no ownership or prerequisite was moved. The consumer contracts remain unresolved despite the successful supplier checks. No roadmap file changed, so no commit was made and nothing was pushed.

**Evidence and ownership.** Main was checked at `5078569`; the indexed open heads for ColemanIntegration and PolylogarithmFunctions match the reviewed heads, and the supplied PadicHodgeRegulators checkout is `1a3728ef48d5f726ffd525e76e682946829ccc9d`. Object searches covered main and indexed open roadmap READMEs and board package READMEs, with the PadicHodgeRegulators contract also read in its supplied checkout; ColemanIntegration's independent construction is the competing ownership claim, while Polylogarithms and HabiroNahmSeries explicitly consume the K3BlochGroups carriers. K3BlochGroups retains the earlier integral algebraic ownership; the later Coleman stage owns analytic evaluation, as its downstream contract already states. These searches are an ownership check, not an assertion of a complete mathematical audit of unrelated open roadmaps.

The unreduced presentation, antisymmetric cokernel, boundary and kernel agree with weibel line 29550 through line 29567, Definition VI.5.1, PDF p.495. The reduced presentation and matching five-term arguments agree with hutchinson2013 line 145 through line 190, §2.2, pp.4–5. Killing the unreduced generator [1] and preserving every remaining generator gives mutually inverse presentation maps; the tensor quotient universal property supplies the symbol-preserving identification if a consumer also constructs its tensor target separately. These facts justify the requested transport, but do not turn separately defined quotients into definitionally equal carriers.

Cross-roadmap resolution found no missing citations. The reported `uce.source_superperfect` lead is explicitly an API target in StableHomotopyKTheory §3.29, `TauCetiRoadmap/StableHomotopyKTheory/README.md:1287`, rather than a declaration claimed to exist at a library pin. The confirmed pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; `TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean:126` defines the negative flip eigenspace, so it does not replace the integral cokernel. Mathlib's existing cyclic-homology computations are `Rep.FiniteCyclicGroup.groupHomologyIsoEven` and `groupHomologyIsoOdd` at `Mathlib/RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean:85` and line 122, separate from the power-map target. No new source was required; the three waived source entries remain settled.

**Elaborated signatures.** A single scratch file containing the unchanged acceptance module and `#check @name` for each of its 13 declarations was elaborated successfully. Every elaborated type was compared with its README statement: the commutative-ring/module binders, field and infinitude hypotheses, identity coefficient morphisms, finite-field prime/characteristic binders, q≥4 bound and formally-real hypothesis are all retained; no binder or statement changed. No declaration was added or given another roadmap's fully qualified name.

**Adversarial computations.** No statement was added or changed. The table records the pass on the shared interface implicated by H01–H03 and every unchanged acceptance declaration; source-based homology values are distinguished from direct presentation and arithmetic calculations.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| `antisymSquare`, README §3.1; Suggested line 33 | A=0, ℤ, ℤ/2, ℤ/3 over ℤ | Quotient by 1+flip gives respectively 0, ℤ/2, ℤ/2, 0; exterior squares are all 0 | Diagonal two-torsion is retained; exterior replacement fails | None |
| `antisymSquare_diagonal_exact`, README line 554; Suggested line 40 | A=ℤ² and A=0 | Qₛ(ℤ²)=(ℤ/2)²⊕ℤ; projection (a,b,c)↦c has kernel (ℤ/2)²=A/2A; for A=0 all terms are 0 | Both kernel containments and diagonal equivalence have the stated values | None |
| `preBlochRawSymbol`, README §3.3; Suggested line 54 | F=ℚ; x=0,1,2 | Raw values 0,[1],[2]; augmentation of the latter two is 1, against 0 for the zero element | One remains a genuine raw generator | None |
| `preBloch`, README §3.4; Suggested line 60 | F₂,F₃,F₄,F₅,F₇ | Reduced relation invariant factors: empty with free rank 0; empty with free rank 1; (1,5); (1,1,6); (1,1,1,1,8). Adding [1] and its killing relation adds only an invariant factor 1 | P=0,ℤ,ℤ/5,ℤ/6,ℤ/8 in both presentations | None |
| `preBlochSymbol`, README §3.4; Suggested line 69 | F₅, generator t=[3] | [0]=[1]=[4]=0; [2]=2t, [3]=t in ℤ/6, of orders 3 and 6 | Constant-zero symbol map is excluded | None |
| Five-term formula and admissibility, README §3.3 | ℚ, (x,y)=(4,2); (2,2); (2,1) | Admissible arguments are 4,2,1/2,3/2,3; (2,2) violates distinctness; (2,1) gives denominator 1−1⁻¹=0 | The two negative controls are excluded before division | None |
| Presentation equivalence and inverse, README line 692 | F₂,F₃,F₅ | Both composites send [2]↦[2] in F₃ and [3]↦[3]=t in F₅; the extra unreduced [1] goes to 0; F₂ gives 0→0 | Inverses preserve generators, including the exceptional fields | None |
| Presentation universal property, README §3.4 | P(F₅)=ℤ/6, identity and doubling | Values on ([2],[3],[4]) are (2,1,0) and (4,2,0); the relation [2]−2[3] evaluates to 0 for both | Relation-killing maps descend; their distinct generator values distinguish the maps | None |
| Field-map naturality, README §§3.4–3.5 | Frobenius on F₄=F₂(ω), ω²+ω+1=0 | Relations give [ω²]=−[ω] in ℤ/5; Frobenius is multiplication by −1 and its square is +1 in both presentations; boundaries are 0 in both | Adapter respects an actual nonidentity field map | None |
| Boundary rule and sign, README §3.5 | ℚ, x=3 | v₂(3)v₃(−2)−v₃(3)v₂(−2)=0·0−1·1=−1; swapping the factors gives +1 | Sign agrees with ∂[3]=3∧(−2) | None |
| Boundary square, README line 733 | F₅, ordered generators 2,3,4 | With primitive unit 2, logarithm products modulo 2 are 1·2=0, 3·3=1, 2·1=0; either presentation gives (0,1,0) | Same symbol boundary, with a nonzero value excluding the zero map | None |
| Induced Bloch-kernel equivalence, README line 733 | F₃,F₄,F₅,F₇ | Boundary kernels are 2ℤ, ℤ/5, 2(ℤ/6), 2(ℤ/8) on both sides, with orders infinite,5,3,4 | Restriction gives the same kernel, not all of P | None |
| Transport of evaluation, README line 2282 | Reduced P(F₅)→ℤ/6 sending [3]↦1 | Transport along the inverse presentation equivalence sends [3]↦1 and [2]↦2; its kernel restriction sends the Bloch generator [2]↦2, of order 3 | Composition direction preserves values and their restriction | None |
| Branch independence after kernel transport | z=[2]+[−1] over ℚ, branch difference 1 | ∂z=2∧(−1)+(−1)∧2=0; the branch-change term is 1·branchPair(0)=0 | Requires the commuting boundary square in addition to the presentation map | None |
| `generalLinearStabilization`, README line 1319; Suggested line 77 | n=0; n=1 over ℚ, units 2 and 3 | Empty matrix maps to (1); 2 maps to diag(2,1), inverse diag(1/2,1); product of the two images is diag(6,1), the image of 6 | Block map, inverse and multiplication agree | None |
| `generalLinear_homology_stable`, README line 1319; Suggested line 95 | ℚ, (n,i)=(0,0),(1,1); F₂,(1,1) as excluded control | First map is ℤ→ℤ, 1↦1; determinant identifies the second with ℚˣ→ℚˣ, 2↦2. Over F₂ the excluded H₁ map is 0→ℤ/2 because GL₂(F₂)=S₃ | Infinitude and degree binders are substantive; Suslin 1984 Theorem 3.4 remains a waived citation | None |
| `cyclicHomology_power_map`, README line 1538; Suggested line 108 | C₇,a=2,j=1,2; C₁; j=0 as excluded control | Generator maps to 2 in H₁ and 4 in H₃; C₁ gives 0=0. At j=0 natural subtraction gives degree 0, whose ℤ is not ℤ/7 | Weight and positive-degree hypotheses agree | None |
| `symmetricGroup_homology_stable`, README line 1539; Suggested line 120 | (n,i)=(0,0),(2,1); (1,1) excluded | H₀ map is 1↦1 on ℤ; S₂→S₃ sends the sign generator 1↦1 in ℤ/2; S₁→S₂ would give 0→ℤ/2 | Range 2i≤n agrees with kerz line 82 after shifting n by one | None |
| `finite_sl2_localized_homology`, README §5.2; Suggested line 133 | q=2,3,4,5,7 | hutchinson2013 line 704 gives orders 3,8,15,24,48; direct q²−1 gives 3,8,15,24,48 | Characteristic localization agrees in the small fields | None |
| `finite_sl2_integral_homology`, README §5.2; Suggested line 145 | q=2,3,4,5,7,8,9,27 | hutchinson2013 line 861 combined with line 704 gives orders 6,24,30,120,48,126,240,2184; the displayed conditional gives exactly those numbers | Characteristic-primary exceptions retained, including p=2 and 3 | None |
| `finiteBloch_order`, README §5.5; Suggested line 157 | q=4,5,7; q=2,3 excluded | Direct presentation kernels have orders 5,3,4; q+1 or (q+1)/2 gives 5,3,4. At q=2 the kernel is 0 rather than order 3; at q=3 it is infinite rather than order 2 | q≥4 is required; agrees with hutchinson2013 line 1675 and line 1679 | None |
| `blochC_order_six`, README line 1993; Suggested line 170 | ℚ→ℝ; F₄ as excluded control | Rogers values are ρ[2]=π²/12 and ρ[−1]=−π²/4, so ρ(c)=−π²/6; 2ρ(c)=−π²/3 and 3ρ(c)=−π²/2 are nonzero modulo π², while 6ρ(c)=−π²=0. In F₄, c=[ω]+[ω²]=0 | Formal reality cannot be dropped; order is measured in the subgroup or ambient P equally | None |

No repetition of a supplier equivalence, change of integral convention, narrowing to selected fields, or additional acceptance declaration would implement H01–H03. Actual consumer revisions remain necessary before these findings can be closed.
