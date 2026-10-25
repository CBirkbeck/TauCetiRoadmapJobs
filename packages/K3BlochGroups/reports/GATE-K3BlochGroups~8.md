The review's shared ownership finding has three independently actionable consumer-contract points, recorded below in their order of appearance. All three are substantiated and remain open: their repairs require edits outside the two authorized K3BlochGroups files; no roadmap content was changed and no commit was made.

## H01 (CBirkbeck) — answered

ColemanIntegration at ae078af still constructs separate integral carriers in `TauCetiRoadmap/ColemanIntegration/README.md:1458`, assigns their universal properties and field maps locally at lines 1466–1471, and omits K3BlochGroups from the prerequisites at line 1478; it needs shared-carrier aliases or explicit natural transport, with K3BlochGroups Layer 3 as a prerequisite. The supplier already specifies those carriers, the symbol-preserving presentation equivalence, the boundary/kernel square and the direction of supply in `TauCetiRoadmap/K3BlochGroups/README.md:15`, lines 692, 733 and 2282–2284, so this finding cannot be closed by another supplier-only edit and the consumer repair remains outstanding.

## H02 (CBirkbeck) — answered

PolylogarithmFunctions at 860558b assigns the algebraic symbol constructions, field-map API and Bloch groups to ColemanIntegration in `TauCetiRoadmap/PolylogarithmFunctions/README.md:1069`, despite recognizing K3BlochGroups at line 1061. That ownership sentence needs to assign the shared integral carriers and algebraic field maps to K3BlochGroups Layer 3, retaining Coleman's evaluation and its descent; this file is outside the authorized edit scope and remains unchanged.

## H03 (CBirkbeck) — answered

PadicHodgeRegulators at 1a3728e imports P/B from ColemanIntegration and the boundary from K3BlochGroups in `TauCetiRoadmap/PadicHodgeRegulators/README.md:59`, then combines them in §3.3 at lines 821–834 without specifying a carrier identification. Its contract needs P, Qₛ, the boundary, B and field maps from K3BlochGroups §§3.1, 3.3–3.5 and evaluation from ColemanIntegration §L2.Fb, either on aliases or transported through the natural presentation/kernel equivalences; this consumer repair is outside the authorized files and remains outstanding.

### Ownership and source evidence

- The content main branch is 4aeb1cc1f6feb6ec6d7ac4e892307d67006acbd2; ColemanIntegration, PolylogarithmFunctions and K3BlochGroups are absent there and are indexed as new roadmaps, with the unchanged heads cited above. The read-only open-roadmap survey, supplied sibling checkouts and board-package object search covered the integral pre-Bloch presentation, antisymmetric square and Bloch kernel; these are not transfers of an existing main-roadmap construction.
- K3BlochGroups Layer 3 remains the owner: the shared presentation, integral convention comparisons and Suslin boundary belong together, before their analytic consumers. The merge order places PolylogarithmFunctions, K3BlochGroups, ColemanIntegration and PadicHodgeRegulators at positions 42, 110, 151 and 209 respectively; no ownership move or reverse prerequisite was introduced.
- The same ownership is explicitly consumed by `TauCetiRoadmap/Polylogarithms/README.md:108` and `TauCetiRoadmap/HabiroNahmSeries/README.md:78`, with Coleman's evaluation distinguished at line 145 of the latter. These were read at their supplied open heads; ownership against open pull requests was checked, not inferred from the review.
- The legal cached source fixes Qₛ as the quotient by symmetric tensors and distinguishes its diagonal subgroup from the exterior square: weibel line 29550, VI.5 opening, PDF p.495. The unreduced presentation, admissible five-term relation, boundary and kernel are weibel line 29553, Definition VI.5.1, PDF p.495; the small-field exceptions are weibel line 29568, Remark VI.5.1.1.
- The library revisions match the supplied manifest: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Object searches found native free abelian groups and quotient/tensor machinery, rather than an existing shared Bloch carrier; `FreeAbelianGroup.of`, `lift`, `lift_unique` and `lift_ext` are in `Mathlib/GroupTheory/FreeAbelianGroup.lean:108`, lines 112, 128 and 134, while `TauCeti.antisymmetricTensors` in `TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean:126` is the negative eigenspace, not this cokernel.
- The citation resolver reports no missing cross-roadmap citations. Its supplied lead concerning `uce.source_superperfect` is a planned supplier declaration, explicitly present in StableHomotopyKTheory §3.29 at head 00bfbf7 (`TauCetiRoadmap/StableHomotopyKTheory/README.md:1287`); K3BlochGroups attributes it to that section, not to a pinned implementation.

### Computed adversarial pass

No statement was added or changed. The following computations test the shared contract under review and the unchanged acceptance statements; computations of predicted homology orders are arithmetic consistency checks, not proofs of the admitted theorems.

| Statement | Instances tried | Computed values on the two sides | Result; change |
| --- | --- | --- | --- |
| Qₛ is a cokernel retaining diagonal torsion (§3.1; `antisymSquare`) | A=0, ℤ, ℤ/2, ℤ/3 | Qₛ values 0, ℤ/2, ℤ/2, 0; exterior squares all 0; negative eigenspace for ℤ is 0 | Distinguishes all three objects; none |
| Antisymmetry and the doubled diagonal (§3.1) | Ordered basis e₁,e₂ of ℤ² | e₁∧e₂=+1, e₂∧e₁=−1 in the free summand; sum 0; twice either diagonal is 0 in (ℤ/2)² | Sign and torsion retained; none |
| Diagonal additivity (§3.1) | a=e₁, b=e₂ | (a+b)∧(a+b)=(1,1,0)=a∧a+b∧b in (ℤ/2)²⊕ℤ | Cross terms cancel; none |
| Exterior projection and diagonal exactness (`antisymSquare_diagonal_exact`) | A=0 and ℤ² | Zero case: 0→0→0; for ℤ², p(a,b,c)=c, p(e₁∧e₁)=0, p(e₁∧e₂)=1; diagonal classes of e₁ and 3e₁ agree and their difference is −2e₁, whereas those of e₁ and 0 differ | Tests the kernel and both directions of the parity criterion; none |
| Antisymmetric universal property (§3.1) | A=ℤ; target ℤ/2 versus ℤ | Pairing (a,b)↦ab mod 2 has f(1,1)+f(1,1)=0 and sends the diagonal to 1; integer multiplication gives 1+1=2≠0 and cannot factor | Wrong exterior or unqualified tensor factorization excluded; none |
| Raw symbol (`preBlochRawSymbol`, §3.3) | F=ℚ, x=0,1,2 | Values 0, free basis vector [1], free basis vector [2]; the last two are distinct nonzero vectors | Killing [1] is a quotient relation; none |
| Five-term admissibility and ordered relation (§3.3) | (x,y)=(2,3),(4,2) in ℚ; x=y; y=1 | Argument lists (2,3,3/2,3/4,1/2) and (4,2,1/2,3/2,3); admissible denominators are nonzero; x=y is excluded and y=1 makes 1−y=0 | No totalized division used in the relation; none |
| Integral pre-Bloch quotient (`preBloch`, §3.4) | F₂,F₃,F₅ | Reduced relation matrices have 0 generators, one generator with no relations, and F₅ relations [4]=0, 3[2]=0, [2]=2[3]; outputs 0, ℤ, ℤ/6 | Both presentations retain the small-field behavior; none |
| Quotient symbol (`preBlochSymbol`, §3.4) | F₅, x=0,1,2,3,4 | Values 0,0,2g,g,0 for g of order 6; orders of [2] and [3] are 3 and 6 | Zero-map substitute fails; none |
| Pre-Bloch universal property (§3.4) | F₅, map [3]↦1 in ℤ/6 | Relations evaluate to 0, 6=0, 2−2=0; the attempted map [3]↦1 in ℤ/5 gives 6=1≠0 | Precisely relation-killing maps descend; none |
| Reduced/unreduced inverse maps (§3.4) | F₂,F₃,F₅ | [1]↦0 in one composite; surviving generators return to themselves in both composites: no generator, [−1], and g respectively | Equivalence preserves symbols, not independent quotient types definitionally; none |
| Boundary normalization (§3.5) | ℚ, [3] and [2] | v₂∧v₃ on ∂[3] gives 0·0−1·1=−1; sign∧v₂ on ∂[2] gives 0·0−1·1=1 mod 2 | Fixes the ordered boundary; none |
| Five-term boundary vanishing (§3.5) | ℚ, relation (4,2), detected by v₂∧v₃ | Boundary values 2−0+0−1+(−1)=0 | Compatible with the presentation; none |
| Integral Bloch kernel and boundary square (§3.5) | F₃,F₅ | F₃: ∂(n[−1])=n mod 2, kernel 2ℤ; F₅: ∂g=1 mod 2, kernel {0,2g,4g}; each reduced/unreduced image gives the same boundary | Exterior replacement would give kernels ℤ and ℤ/6; none |
| Complement cycle (§3.5) | ℚ, x=2 | ∂([2]+[−1])=2∧(−1)+(−1)∧2=0, while sign∧v₂ detects ∂[2] as 1 mod 2 | Kernel restriction is substantive; none |
| Natural symbol and boundary maps (§§3.4–3.5) | Frobenius on F₄=F₂(ω), ω²+ω+1=0 | Relations 3[ω]−2[ω²]=0 and 3[ω²]−2[ω]=0 give P=ℤ/5 and [ω²]=4[ω]; Frobenius squared acts by 4²=1 mod 5, and Qₛ(F₄)=0 on both boundary paths | Maps transport consistently; none |
| Evaluation transport and restriction to kernels (§§3.4–3.5) | F₅, reduced evaluation g↦1 in ℤ/6 | Transported values [3]↦1 and [2]↦2; restriction to B gives {0,2,4}; zero transport would instead give {0} | An explicit equivalence is needed in the consumer; none |
| Block inclusion (`generalLinearStabilization`, §4.8) | n=0; g=(2) over ℚ | Empty matrix maps to (1); (2) maps to diag(2,1), inverse diag(1/2,1); product diag(1,1) | Native carrier and inverse agree; none |
| GL homology stability (`generalLinear_homology_stable`, §4.8) | n=i=0; n=i=1 over ℚ | H₀ map ℤ→ℤ sends 1↦1; H₁ map identifies ℚˣ with the determinant abelianization and sends 2↦2 | Included range and identity coefficients agree; none |
| Cyclic power action (`cyclicHomology_power_map`, §4.15) | m=1; m=7,a=2,j=2; a=0 | Trivial positive homology 0→0; multiplier 2²=4 mod 7 sends 1↦4; a=0 gives multiplier 0 | Distinguishes weight two from multiplier 2; none |
| Symmetric-group stability (`symmetricGroup_homology_stable`, §4.15) | (n,i)=(0,0),(2,1); excluded (1,1) | H₀ map 1↦1; abelianizations C₂→C₂ send a transposition to a transposition; excluded map 0→C₂ is not onto | Bound 2i≤n excludes the failure; none |
| Localized finite SL₂ homology (`finite_sl2_localized_homology`, §5.2) | q=2,3,4 | q²−1=3,8,15; removing characteristic-primary factors from integral orders 6,24,30 gives 3,8,15 | Arithmetic agrees with localization; none |
| Integral finite SL₂ homology (`finite_sl2_integral_homology`, §5.2) | q=2,3,4,5,7 | Exceptional formula gives 2·3=6, 3·8=24, 2·15=30, 5·24=120; nonexceptional q=7 gives 48 | Exception membership and characteristic factors agree; none |
| Finite Bloch order (`finiteBloch_order`, §5.5) | q=4,5,7; excluded q=2,3 | Boundary kernels have orders 5,3,4, matching q+1 or (q+1)/2; q=2 gives 0 and q=3 gives infinite cyclic 2ℤ | Size bound preserves the counterexamples; none |
| Formally real universal class (`blochC_order_six`, §5.8) | ℚ and ℝ, detector normalized by π² | c has detector −1/6 mod ℤ; 2c gives −1/3, 3c gives −1/2, 6c gives −1=0 | Order exactly 6; none |

### Elaborated signatures

Compared every one of the 13 declarations with the README using the supplied elaboration of the scratch file containing `#check @name` for each declaration. The five definitions retain their ring/module/field arguments; the eight theorem signatures retain the abelian-group, infinite-field, nonzero cyclic order, degree bounds, identity coefficient-map conditions, finite-field/characteristic hypotheses, q≥4 and formally-real hypothesis respectively, with the stated universe lifts; no dropped binder or generality mismatch required a change, and the unchanged file did not require another elaboration pass.

### Build and gates

`lake build TauCetiRoadmap.K3BlochGroups.Suggested` exited 0, with eight expected theorem `sorry` warnings and no errors. Exact final line:

```text
Build completed successfully (8976 jobs).
```

The prescribed dependency check exited 0, with no UPWARD or CYCLE line and no moved line. Its complete output was:

```text
depcheck: 48 roadmaps, 554 edges, 0 problem(s)
```

The full gate exited 0. Exact gate summary line:

```text
gate K3BlochGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
