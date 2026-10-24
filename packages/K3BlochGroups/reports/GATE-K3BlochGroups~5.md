## H01 (CBirkbeck) — answered

The shared-carrier conflict is confirmed and remains unresolved: `TauCetiRoadmap/ColemanIntegration/README.md:1458` and its API at line 1466 independently mandate the integral carriers and field maps (head `ae078af`), while `TauCetiRoadmap/PolylogarithmFunctions/README.md:1069` assigns those objects to ColemanIntegration (head `860558b`); the presentations and boundary agree with `weibel` line 29550 and line 29553. The required repair is for ColemanIntegration L2.Fb to consume K3BlochGroups §§3.1, 3.3–3.5 through aliases or symbol-preserving transport, and for PolylogarithmFunctions to acknowledge that ownership; both consumer files are outside the permitted edits, and the accurate local contract at `TauCetiRoadmap/K3BlochGroups/README.md:2282` cannot remove their independent construction mandates.

## H02 (CBirkbeck) — applied

`TauCetiRoadmap/K3BlochGroups/README.md:11`, line 25, line 89 and line 117 now assign the normalized finite-wedge decomposition and inverse to FourManifolds F2 (`TauCetiRoadmap/FourManifolds/README.md:129`, head `d09c2c0`), and line 311 replaces the independent product-of-spheres reconstruction with explicit generator compatibility under finite injections and reindexing. Line 312 retains the arbitrary-index extension, line 327 and line 335 add the F2 prerequisites, and the Checks at line 318 compute inclusions, swaps, finite support and the fold sign; the source supplies the finite basis, product-cell normalization and compactness passage at `hatcher` line 16500, line 16564 and line 16569.

## Verification

Commit: `a1e6c6951524c4c870e3baa5e42d871b26b7c2c3`, `K3BlochGroups: review repairs (reuse FourManifolds finite wedge decomposition)`.
Only `TauCetiRoadmap/K3BlochGroups/README.md` changed; `Suggested.lean` is unchanged. No push was made. H01 is an outstanding consumer-contract repair, not a resolved thread.

Ownership searches covered objects in main `82e5289`, the indexed open roadmap heads, the supplied sibling checkouts and the board packages. FourManifolds F2 owns the finite theorem; neither its text nor the other matches specify the finite-inclusion compatibility and arbitrary-index extension retained here. Polylogarithms Layer 2 and HabiroNahmSeries §§1.1, 1.5 consume the shared K3BlochGroups carriers; their contracts do not eliminate the conflicting ColemanIntegration mandate. No ownership moved to a later supplier, no generic carrier was added, and no Lean declaration was added or renamed.

Cross-roadmap citation resolution returned no missing citation. The reported `uce.source_superperfect` lead is a planned supplier API at StableHomotopyKTheory §3.29 (`TauCetiRoadmap/StableHomotopyKTheory/README.md:1288`), not a claim that the declaration exists at the pins. The finite-wedge import was checked against F2's actual generator normalizations, including its self-product relation. Sources already cover the repair; no additional source or unsettled reference was needed.

The library copies were confirmed at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. In particular, Mathlib `Mathlib/Topology/Homotopy/HSpaces.lean:65` bundles multiplication and based unit homotopies without associativity or commutativity, and Tau Ceti `TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean:126` defines the negative eigenspace, rather than the tensor cokernel. Object searches at these pins found no competing Bloch carrier or finite-wedge homotopy decomposition.

All 13 provided mechanically elaborated `#check @name` signatures were compared with their README statements. The scratch signature-check file contains the unchanged acceptance file verbatim and checks every declaration; the comparisons retain the field, infinitude, finiteness, characteristic, coefficient-identity, degree-range and formal-real hypotheses, and no binder or Lean signature changed.

### Adversarial mathematics pass

The table records the changed mathematical statements and their convention witnesses, the shared-presentation issue, and all retained acceptance declarations. Coordinate computations test the adapters and normalizations; they do not replace the general proofs requested by the roadmap.

| Statement | Instances tried | Computed values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Imported finite π₃ decomposition and inverse | Wedges of 0, 1, 2, 3 spheres | Number of generators r+r(r−1)/2 = 0, 1, 3, 6; F2 gives 0, ℤ, ℤ³, ℤ⁶ | Agreement; omitting mixed generators gives rank 2 at r=2 | Import F2, remove duplicate construction |
| Map W(f) and its Hopf-generator rule | Inclusion {1,2} into {1,2,3} | η₁ ↦ (1,0,0,0,0,0); ι_f(1)η has the same coordinate vector | Agreement; zero map gives 0 | Explicit source, target and generator rule |
| Whitehead-generator rule | Same inclusion | [ι₁,ι₂] ↦ (0,0,0,1,0,0), exactly the target pair generator | Agreement; killing this coordinate fails | Explicit rule and negative control |
| Entire coordinate adapter and inverse compatibility | (1,2,3) in the two-sphere basis | Include then decompose: (1,2,0,3,0,0); insert coordinates then apply F2 inverse: same vector | Agreement | Require both decomposition and inverse square |
| Identity law | (1,2,3) | Identity transport = (1,2,3) = original vector | Agreement | Explicit identity law |
| Composition law | {1,2} ⊂ {1,2,3} ⊂ {1,2,3,4} | Both composite and direct inclusion give (1,2,0,0,3,0,0,0,0,0) | Agreement | Explicit composition law |
| Reindexing and pair orientation | Swap two sphere indices twice | (1,2,3) ↦ (2,1,3) ↦ (1,2,3); product orientation sign (−1)^(2·2)=+1 | Agreement; (2,1,−3) fails | Pin sign with a nonzero mixed coordinate |
| Arbitrary-index π₂ formula | Empty and countable CW wedges | Empty: 0=⊕∅ℤ; degree-two class ι₁+2ι₃ has coordinates (1,0,2,0,…) on both sides | Agreement | Preserve arbitrary index sets |
| Arbitrary-index π₃ formula and finite agreement | Countable CW wedge, η₁+2[ι₂,ι₃] | Finite support {1,2,3} gives (1,0,0,0,0,2); every enlargement gives the same six entries and zeros elsewhere | Agreement; an infinite-support product element is excluded by compactness | Explicit colimit passage and finite agreement |
| Naturality for arbitrary injections | Shift every countable index by one | η₁+2[ι₂,ι₃] ↦ η₂+2[ι₃,ι₄] by either transport; coefficients remain 1 and 2 | Agreement | Explicit injection naturality |
| H₃ of the CW wedge | Empty, finite and countable wedges | Cellular C₃=0 and C₄=0, hence ker(d₃)/im(d₄) is the zero group modulo the zero group, equal to 0 in every case | Agreement | Preserve cellular argument |
| Pinch–Hopf mixed coefficient and fold | Two summands; fold to S² | Fold of (1,1,1) = 1η+1η+2η=4η; degree-two postcomposition gives 2²η=4η | Agreement; omitted mixed term gives 2η | Add numerical normalization witness |
| Restriction of the coordinate rule to injections | Noninjective fold as negative control | Fold sends [ι₁,ι₂] to [ι,ι]=2η, rather than to a distinct-pair coordinate | Injection hypothesis is necessary | Keep injection hypothesis explicit |
| H-space Hopf additivity retained after import | K(ℤ,2), K(ℤ,3) | Hopf operation has target 0 in the first case and source 0 in the second; both additivity sides are 0 | Agreement | Retain the local H-space argument |
| Hopf–Hurewicz exactness retained after import | K(ℤ,2), K(ℤ,3) | Degree-three map is 0→0 with kernel 0, respectively ℤ→ℤ identity with kernel 0; Hopf image is 0 in both | Agreement | Retain exactness at full stated generality |
| Sphere-unit convention | Transposition over ℤ and characteristic 2 | det([[0,1],[1,0]])=−1; its characteristic-two value is 1=−1 | Agreement with [−1], trivial in characteristic 2 | Preserve witness |
| Reduced/unreduced presentation transport | 𝔽₂, 𝔽₃, and relation (4,2) over ℚ | Both 𝔽₂ groups are 0; both 𝔽₃ groups are ℤ[−1]; both relations have arguments (4,2,1/2,3/2,3) and signs (+,−,+,−,+) | Same presentations; this does not make two quotient types definitionally equal | No local carrier change; H01 remains open |
| Boundary transport and sign | [3] and [2] over ℚ | β(3∧(−2))=0·0−1·1=−1; opposite order gives +1; mod-2 sign/valuation pairing on 2∧(−1) gives 1 in either presentation | Correct sign and nonzero boundary preserved | No change |
| `antisymSquare` | R=M=ℤ, zero module, M=ℤ/3 | Cokernel of 2 is ℤ/2, 0, 0 respectively; exterior square of ℤ and negative eigenspace over ℤ are both 0 | Correct cokernel distinguished from plausible wrong objects | No change |
| `antisymSquare_diagonal_exact` | A=ℤ, ℤ/3, ℤ² | Diagonal kernels are ℤ/2, 0, (ℤ/2)², matching A/2A; for ℤ the diagonals at 1 and 3 agree because 1−3=2(−1), while those at 1 and 2 differ | Both directions of diagonal equality and kernel description agree | No change |
| `preBlochRawSymbol` | x=0,1,2 over ℚ | Raw values are 0, basis(1), basis(2); the last two are nonzero free generators | Correct unreduced carrier | No change |
| `preBloch` | 𝔽₂, 𝔽₃, 𝔽₅ | Kill [1]: 0, ℤ[−1], ℤ/6; for 𝔽₅ the gcd of maximal relation minors is 6, and [2],[3],[4] map to 2,1,0 mod 6 | Presentation checks agree | No change |
| `preBlochSymbol` | 0,1,2,3 over 𝔽₅ | Quotient values 0,0,2,1 mod 6; respective orders 1,1,3,6 | Zero symbol map excluded | No change |
| `generalLinearStabilization` | Rank 0 and rank 1, g=(2) over ℚ | Empty matrix ↦ (1); (2) ↦ diag(2,1), inverse diag(1/2,1), product I₂ | Correct unital block map | No change |
| `generalLinear_homology_stable` | n=i=0; n=i=1 over ℚ | H₀ map ℤ→ℤ sends 1↦1; H₁ map ℚˣ→GL₂(ℚ)ab sends 2 to determinant 2 | Identity and determinant checks agree; identity coefficient hypothesis retained | No change |
| `cyclicHomology_power_map` | m=1; m=7,a=2,j=1,2; a=0 | Positive homology at m=1 is 0; on C₇ the multipliers are 2¹=2 and 2²=4; constant map has multiplier 0 | Correct weight and trivial-group behavior | No change |
| `symmetricGroup_homology_stable` | n=i=0; n=2,i=1 with nonabelian target S₃ | H₀ map sends 1↦1; H₁(C₂)→H₁(S₃) is ℤ/2→ℤ/2 sending transposition class 1↦1 | Range and actual inclusion agree | No change |
| `finite_sl2_localized_homology` | q=2,3,4,5 | Integral orders 6,24,30,120 lose characteristic factors 2,3,2,5 and become 3,8,15,24 = q²−1 | Agreement with `hutchinson2013` line 704 | No change |
| `finite_sl2_integral_homology` | q=2,3,4,5,7,8,9,27 | Formula gives 6,24,30,120,48,126,240,2184; characteristic-primary factors are 2,3,2,5,1,2,3,3 | Agreement with the exception list at `hutchinson2013` line 861 | No change |
| `finiteBloch_order` | q=4,5; excluded q=3 | At q=4, Qₛ=0 and B=P=ℤ/5; at q=5, P=ℤ/6→ℤ/2 sends [3]↦1 and has kernel {0,2,4} of order 3; at q=3, B=2ℤ is infinite | Formula gives 5 and 3; cardinality hypothesis excludes counterexample | No change |
| `blochC_order_six` | ℚ→ℝ; excluded 𝔽₅ | ρ([2])+ρ([−1])=π²/12−π²/4=−π²/6; 2c and 3c detect −π²/3 and −π²/2, while 6c detects 0; over 𝔽₅, c has order 3 | Exact order 6; formal-real hypothesis retained | No change |

### Build and gate outcomes

`lake build TauCetiRoadmap.K3BlochGroups.Suggested` exited 0, with the eight expected admitted-theorem warnings and no errors:

```text
Build completed successfully (8976 jobs).
```

The final gate exited 0 on the committed, clean tree:

```text
gate K3BlochGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The requested movable dependency check exited 0, with no UPWARD, CYCLE or moved line; its complete output is:

```text
depcheck: 33 roadmaps, 311 edges, 0 problem(s)
```
