# Review response

The three distinct consumer-contract points are confirmed and remain outstanding. “Answered” below records the evidence and required consumer change; it does not claim closure. Neither authorized roadmap file needs a further supplier repair, and the consumer files are read-only for this job. No roadmap edit or commit was made; head remains 5b6774f79865aeed5e271658a267efc7c6bcb66c.

Verification used main 5f173a7b9ac37eb6b62d01eb3db5047b92d19363 and the indexed open heads: ColemanIntegration ae078af76fc2ca886eeaa0e171727cefc6953365, PolylogarithmFunctions 860558b4bf0670a5316a49df6d785cd5b6dddf13, and PadicHodgeRegulators 1a3728ef48d5f726ffd525e76e682946829ccc9d. Ownership searches covered the shared pre-Bloch presentation, tensor cokernel, boundary and kernel in main, the indexed open roadmaps and board packages; K3BlochGroups is the algebraic owner because these are the integral carriers of its Suslin sequence, while ColemanIntegration supplies their analytic evaluation. No ownership or prerequisite was moved, and no new declaration was introduced.

Weibel VI.5.1, weibel line 29550, distinguishes the antisymmetric cokernel from the exterior square; weibel line 29553 specifies the unreduced presentation, and weibel line 29564 specifies its boundary and kernel. Removing the generator [1] together with its killing relation gives the reduced presentation with identical admissible five-term relations; the resulting inverse maps fix every other symbol, and generator extensionality proves boundary and field-map compatibility. For the review's orientation eP:Pₛ≃P꜀, use the inverse of §3.4's reduced-to-unreduced equivalence; eQ identifies the identical tensor relation quotients, eB is its kernel restriction, and evaluation transport is Dₛ=D꜀∘eP.

The pins were verified as Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Object searches found no native pre-Bloch/Bloch carrier there; TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean:126 defines the negative eigenspace, which differs from the required cokernel already for the rank-one integral module (0 versus ℤ/2). Cross-roadmap resolution found no missing roadmap citation; the supplied `uce.source_superperfect` lead resolves to StableHomotopyKTheory §3.29's planned API, rather than a pinned library declaration.

All 13 supplied elaborated `#check @name` types were compared with their declarations and README statements: the field, infinitude, finiteness, characteristic, coefficient-identity and size hypotheses are retained, and all 13 names occur in the README. No binder or signature changed, so the supplied single elaboration remains applicable. The following computed controls cover the shared interface and the unchanged acceptance declarations; they are tests of the statements, not proofs of their general forms. Finite SL₂ comparisons use hutchinson2013 line 704 and line 861; the symmetric-group range agrees with kerz line 82 after replacing its n by n+1.

| Statement | Instances tried | Values compared | Result | Change |
| --- | --- | --- | --- | --- |
| `antisymSquare` | M=0; R=M=ℤ; M=ℤ/3 over ℤ | Cokernels 0, ℤ/2, 0; exterior square of ℤ is 0 and its negative flip eigenspace is 0 | Retains the required diagonal torsion | None |
| `antisymSquare_diagonal_exact` | A=ℤ, ℤ/2, ℤ/3 | (A/2A, kernel, exterior square)=(ℤ/2,ℤ/2,0), (ℤ/2,ℤ/2,0), (0,0,0); for A=ℤ, diagonals of 1 and 3 agree, those of 0 and 1 differ | Both directions of the diagonal equality agree with divisibility by 2 | None |
| `preBlochRawSymbol` | F=ℚ, x=0,1,2 | Values 0, the basis vector [1], the distinct basis vector [2] | Raw one is retained before quotienting | None |
| `preBloch` | F₂,F₃,F₄,F₅,F₇ | Reduced relation matrices have Smith factors (), (), (1,5), (1,1,6), (1,1,1,1,8), with free ranks 0,1,0,0,0; unreduced presentation adds the single killed [1] | Both presentations give 0,ℤ,ℤ/5,ℤ/6,ℤ/8 respectively | None |
| `preBlochSymbol` | x=0,1; F₅ with x=2,3,4 | Quotient values at 0,1 are 0; over F₅ the values are 2,1,0 in ℤ/6 | Orders of [2] and [3] are 3 and 6, excluding the zero map | None |
| `generalLinearStabilization` | n=0; F=ℚ,n=1,g=(2) | Empty identity maps to (1); (2) maps to diag(2,1), with determinant 2 and inverse diag(1/2,1) | Identity block and direction agree | None |
| `generalLinear_homology_stable` | n=i=0; F=ℚ,n=i=1; excluded n=0,i=1 | H₀ map ℤ→ℤ sends 1 to 1; degree-one map identifies ℚˣ→ℚˣ by determinant; excluded map 0→ℚˣ is not onto | Range and infinite-field binder remain explicit | None |
| `cyclicHomology_power_map` | m=1; m=7,a=2,j=1,2,3; a=0,j=2 | Trivial group gives 0; multipliers modulo 7 are 2,4,1; the zero-power map gives multiplier 0 in positive degree | Weight is j, giving weight two on H₃ | None |
| `symmetricGroup_homology_stable` | n=i=0; n=2,i=1; excluded n=i=1 | H₀ is identity ℤ→ℤ; H₁(C₂)→H₁(S₃) is identity on ℤ/2; excluded H₁(Σ₁)→H₁(Σ₂) is 0→ℤ/2 | Nonabelian S₃ and small-rank controls match the range | None |
| `finite_sl2_localized_homology` | q=2,3,4,5 | q²−1=3,8,15,24 respectively; localized H₃ has the same cyclic orders | Includes characteristics 2 and 3 | None |
| `finite_sl2_integral_homology` | q=2,3,4,5,8,9,27; q=11 | Exceptional orders p(q²−1)=6,24,30,120,126,240,2184; at q=11 the order is 120 with zero 11-primary part | Exceptional set agrees with the source's degree-three list | None |
| `finiteBloch_order` | q=4,5,7; excluded q=3 | Direct presentation and boundary calculations give kernel orders 5,3,4, equal to q+1,(q+1)/2,(q+1)/2; at q=3 the kernel is 2ℤ, not finite | Bound q≥4 is necessary | None |
| `blochC_order_six` | F=ℚ,ℝ; negative control F₅ | Real detector gives ρ([2])+ρ([−1])=π²/12−π²/4=−π²/6 modulo π², with 2ρ(c)=−π²/3, 3ρ(c)=−π²/2 nonzero and 6ρ(c)=0; over F₅ c=2 in ℤ/6 has order 3 | Formally-real hypothesis excludes the negative control; no embedding of an arbitrary formally real field into ℝ is assumed | None |
| §3.4 reduced/unreduced adapter | F₂,F₃; ℚ at (4,2) | Both small-field pairs give 0 and ℤ on [−1]; the rational relation maps to [4]−[2]+[1/2]−[3/2]+[3]=0 | Generator-preserving inverse exists without a size restriction | None |
| §3.5 boundary sign | ℚ, symbol [3] | v₂(3)v₃(−2)−v₃(3)v₂(−2)=0·0−1·1=−1; reversed order gives +1 | Sign is fixed beyond the kernel | None |
| §3.5 five-term boundary square | ℚ, pair (4,2) | In coordinates (s∧s,2∧2,3∧3,s∧2,s∧3,2∧3), s=−1, the five boundary vectors are (0,0,0,0,0,2), (0,0,0,1,0,0), (0,1,0,0,0,0), (0,1,0,1,1,1), (0,0,0,0,1,−1); their signed sum is (0,0,0,0,0,0), reducing the first five coordinates modulo 2 | Both presentations give the same zero boundary | None |
| §3.5 Bloch kernel and induced eB | F₅ | P=ℤ/6 with [3]=1, [2]=2; ∂(k)=k modulo 2; both kernels are {0,2,4}≃ℤ/3 | Replacing Qₛ by the exterior square would give a kernel of order 6 | None |
| §3.5 kernel membership in both directions | ℚ, [2], [−1], c | ∂[2]=∂[−1]=the nonzero sign–2 class; their sum has boundary 1+1=0 modulo 2 | Individual symbols fail membership, their sum satisfies it | None |
| §3.4 symbol law beyond abstract isomorphism | F₅, eP=−id as wrong model | ∂(−[3])=−1=1 modulo 2 still commutes, but eP([3])=5≠1 and eP([2])=4≠2 modulo 6 | A commuting square and an abstract isomorphism do not replace symbol preservation | None |
| §§3.4–3.5 evaluation transport | F₅; test additive target ℤ/6 with evaluation [3]↦1 | Correct Ds([3])=Dc(eP[3])=1 and Ds([2])=2; the wrong −id gives 5 and 4 | Transport must use the symbol-preserving equivalence, including on B | None |
| §§3.4–3.5 field-map naturality | F₅→F₂₅ | A generator of units C₄ maps to 6 times a generator of C₂₄; on Qₛ the multiplier is 6²=36=0 modulo 2; both boundary-square routes send [3] to 0 | Naturality does not incorrectly require injectivity on tensor cokernels | None |

## H01 (CBirkbeck) — answered

ColemanIntegration §L2.Fb still constructs the integral symbol quotient, tensor cokernel, boundary and Bloch kernel locally in `TauCetiRoadmap/ColemanIntegration/README.md:1458`, assigns their universal properties and field maps locally at lines 1466–1471, and omits the K3BlochGroups prerequisite at line 1478. K3BlochGroups already exports the required equivalences and analytic ownership boundary at `TauCetiRoadmap/K3BlochGroups/README.md:692`, line 733 and lines 2282–2284; Coleman must adopt those carriers or their symbol-preserving adapters and the Layer 3 prerequisite, so this consumer-side repair remains open outside the permitted files.

## H02 (CBirkbeck) — answered

The ColemanIntegration paragraph in `TauCetiRoadmap/PolylogarithmFunctions/README.md:1069` still assigns symbol constructions, algebraic field maps and Bloch groups to Coleman, despite the K3 ownership recognized at line 1061 and `TauCetiRoadmap/K3BlochGroups/README.md:15`. That sentence must assign the shared integral algebraic API to K3BlochGroups §§3.1, 3.3–3.5 and retain Coleman's evaluation, branch descent and projective-coordinate transport; the consumer text is read-only here and the finding remains open.

## H03 (CBirkbeck) — answered

`TauCetiRoadmap/PadicHodgeRegulators/README.md:59` still splits the algebraic carriers between Coleman and K3, and line 821 descends evaluation to Coleman's P(K) before restricting to Suslin's B(K) without identifying the carriers. Its contract must take P,Qₛ,∂,B and their field maps from K3BlochGroups and evaluation from Coleman, or specify the supplied eP,eQ,eB with ∂꜀∘eP=eQ∘∂ₛ and Dₛ=D꜀∘eP; K3BlochGroups §§3.4–3.5 already supplies these identifications, so the consumer-side repair remains open outside the permitted files.

Build exit status: 0; eight expected admitted-theorem warnings. Exact build outcome:

```text
Build completed successfully (8976 jobs).
```

Dependency check exit status: 0; no UPWARD or CYCLE line, and no moved line:

```text
depcheck: 50 roadmaps, 580 edges, 0 problem(s)
```

Gate exit status: 0. This checks the K3 supplier branch and does not close the three consumer findings. Exact gate summary:

```text
gate K3BlochGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
