## H01 (CBirkbeck) — applied differently

In `TauCetiRoadmap/K3BlochGroups/README.md`, lines 15, 2273 and 2275, assertions that ColemanIntegration already consumes aliases were replaced by the interface exported here, the distinction between presentation equivalence and definitional equality, and the downstream supply direction; `Suggested.lean` is unchanged. **H01 remains unresolved:** ColemanIntegration §L2.Fb still independently constructs the shared carriers and PolylogarithmFunctions still assigns them to ColemanIntegration, so the local correction does not establish agreement of the consumer contracts and the necessary edits to those two roadmaps are outside the authorized files.

### Evidence and outstanding repair

| Evidence | Consequence |
| --- | --- |
| `TauCetiRoadmap/ColemanIntegration/README.md:1458`, head ae078af76fc2ca886eeaa0e171727cefc6953365: reduced symbols, integral five-term quotient, antisymmetric tensor quotient, boundary and kernel are construction targets; lines 1468–1471 assign their universal property and field maps; line 1478 lists inputs without K3BlochGroups. | The ownership conflict is real. The presentation is mathematically compatible, but its contract does not import the shared carriers. |
| `TauCetiRoadmap/PolylogarithmFunctions/README.md:1069`, head 860558b4bf0670a5316a49df6d785cd5b6dddf13: ColemanIntegration retains its symbol constructions, field-map API and algebraic Bloch groups. | The second consumer-facing contract also needs amendment. |
| `TauCetiRoadmap/Polylogarithms/README.md:12` and `:103`, supplied head 1ef12b0: K3BlochGroups Layers 3–4 supply the pre-Bloch group, boundary, Bloch kernel and comparison. `TauCetiRoadmap/HabiroNahmSeries/README.md:78` likewise consumes K3BlochGroups §§3.1, 3.3–3.5. | Retaining the shared owner here agrees with those consumers. Their assertions about Coleman's use of the carrier do not amend Coleman's own contract. |
| The main checkout and origin/main both identify fe5400174e8f9e8ce96423e5122b6dc4c5acf632; neither ColemanIntegration nor PolylogarithmFunctions is on main. The open-roadmap inventory marks both as new. The merge order places PolylogarithmFunctions at line 43, K3BlochGroups at 114, and ColemanIntegration at 154. | No merged roadmap is reassigned. K3BlochGroups remains the earlier shared owner; importing ColemanIntegration would reverse the required direction. No ownership or order file was changed. |
| Weibel VI.5, opening and Definition VI.5.1, PDF p.495: weibel line 29550, weibel line 29553 and weibel line 29564. | The unreduced quotient kills [1], the reduced quotient omits that generator, and both use the same ordered boundary and antisymmetric cokernel. Their equivalence does not make independently defined Lean quotients definitionally equal. |

Closing H01 still requires ColemanIntegration §L2.Fb to import the shared symbols, pre-Bloch group, antisymmetric quotient, boundary, Bloch kernel and field maps through explicit aliases or transport, and to record Layer 3 as an input; its p-adic evaluation, branch descent and coordinate adapters stay there. PolylogarithmFunctions' ColemanIntegration paragraph must give the same ownership. No additional local alias can replace those changes, and this report does not recommend resolving the finding.

Ownership searches covered the main roadmaps, board packages, the supplied sibling checkouts and the indexed open roadmap heads, by pre-Bloch presentations, five-term relations and antisymmetric tensor quotients. The retained ownership matches Polylogarithms and HabiroNahmSeries; ColemanIntegration is the conflicting construction mandate. No new construction, declaration name, source or supplier was added.

The library searches used the actual Mathlib revision 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti revision a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, matching the manifest. The native `TauCeti.antisymmetricTensors` at `TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean:126` is the flip's negative eigenspace, with commutative-ring and module hypotheses; it does not impose invertibility of two and is not the integral cokernel used here. The citation lead `uce.source_superperfect` is an explicit target of StableHomotopyKTheory §3.29, not a claimed pinned declaration; its supplier contract contains that name. The citation resolver found no unresolved cross-roadmap references; its library-name scan was unavailable, so the relevant pinned searches were performed separately.

### Adversarial mathematics

The repair changes ownership descriptions only. The table records computations for each mathematical assertion retained in the changed paragraphs, their defining interfaces, and every declaration of the unchanged Lean acceptance file; it does not claim a new proof of all six layers. Small finite presentations were evaluated directly from all admissible pairs, including characteristic two.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Reduced/unreduced presentation equivalence, §§3.3–3.4; README line 15 | 𝔽₂, 𝔽₃ | Reduced free ranks 0,1; unreduced free ranks 1,2; killing [1] leaves quotient ranks 0,1 on both sides. | Both directions agree; omitting the [1] relation fails. | Preserve equivalence; remove the claim of consumer aliases. |
| The same equivalence with five-term relations | 𝔽₄=𝔽₂[ω], ω²+ω+1=0 | Both presentations give relation matrix ((3,−2),(−2,3)), Smith factors (1,5), and quotient ℤ/5; [ω]↦1 and [ω²]↦4 on both sides. | No restriction to odd characteristic. | No mathematical change. |
| Preservation of each signed relation | ℚ, (x,y)=(4,2) | Arguments on both sides are (4,2,1/2,3/2,3), with coefficients (1,−1,1,−1,1); denominator factors are 4,1/2,−1, all nonzero. | Relation and signs preserved. | No mathematical change. |
| Ordered boundary exported in README line 2273 | ℚ, [3] | v₂∧v₃ applied to 3∧(−2) gives 0·0−1·1=−1; reversing the order gives +1. | Sign is determined, beyond agreement of kernels. | Preserve the ordered boundary. |
| Boundary square, §3.5; README lines 15 and 2273 | 𝔽₅, ordered symbols [2],[3],[4] | Both presentations have classes (2,1,0) in ℤ/6 and boundaries (0,1,0) in ℤ/2. | Commuting square holds on generators. | Retain the square, without identifying external types. |
| Induced equivalence of Bloch kernels | 𝔽₂, 𝔽₃, 𝔽₄, 𝔽₅ | Kernels on both sides: 0; 2ℤ inside ℤ; ℤ/5; {0,2,4} inside ℤ/6≅P(𝔽₅). At 𝔽₅, [3] has boundary 1 and is excluded. | Kernel restriction is distinct from equivalence of ambient groups alone. | No mathematical change. |
| Evaluation transport along the inverse presentation equivalence, README line 2273 | 𝔽₅; evaluation P_red→ℤ/6 with [3]↦1 | Transport sends [2],[3],[4] to 2,1,0 in ℤ/6; on B it sends generator [2] to 2. The zero evaluation would give 0,0,0. | Symbol preservation determines the transported evaluation; kernel restriction agrees. | Describe transport as an offered interface. |
| Naturality of presentation and boundary maps; README lines 15 and 2273 | 𝔽₄ Frobenius z↦z²; identity and its square | Frobenius sends class 1↦4↦1 modulo 5; both routes send [ω] to 4 and have boundary 0. The square acts by 4²=1 modulo 5. | Field-map, identity and composition conventions agree. | No mathematical change. |
| Presentation equivalence versus definitional equality, README line 2273 | 𝔽₃ free generators | Unreduced free group has two basis elements [1],[−1], reduced free group one; the respective quotients both give ℤ after [1]=0. | Isomorphic presentations need an explicit map; equal group invariants do not identify Lean carriers. | State this distinction explicitly. |
| `antisymSquare` | A=0, ℤ, ℤ/2, ℤ/3 over ℤ | Cokernels are 0, ℤ/2, ℤ/2, 0; exterior squares are all 0. For ℤ the tensor-flip negative eigenspace is 0. | Retains the required diagonal, unlike the competing objects. | None. |
| `antisymSquare_diagonal_exact` | A=0, ℤ, ℤ² | For ℤ: kernel ℤ/2=A/2A. For ℤ²: Q=(ℤ/2)²⊕ℤ, projection (a,b,c)↦c, diagonal e₁↦(1,0,0), off-diagonal e₁∧e₂↦1; for 0 all terms are 0. | Kernel and diagonal relations agree in both directions. | None. |
| `preBlochRawSymbol` | ℚ at 0,1,2 | Raw values 0,[1],[2]; [1] and [2] are distinct nonzero basis vectors. | Raw and quotient symbol conventions differ as required. | None. |
| `preBloch` | 𝔽₂, 𝔽₃, 𝔽₄, 𝔽₅ | Quotients 0, ℤ, ℤ/5, ℤ/6; at 𝔽₅ the full reduced relation matrix has Smith factors (1,1,6). | Small-field exceptions retained. | None. |
| `preBlochSymbol` | 𝔽₅ at 0,1,2,3,4 | Quotient values 0,0,2,1,0 modulo 6; [2] and [3] have orders 3 and 6. | The zero-symbol map fails the nonzero controls. | None. |
| `generalLinearStabilization` | F=ℚ, n=0,1 | Empty matrix↦(1); (2)↦diag(2,1), inverse diag(1/2,1), product I₂, determinant 2. | Actual block inclusion has the stated direction and last block. | None. |
| `generalLinear_homology_stable` | (n,i)=(0,0),(1,1),(0,1), F=ℚ | First map H₀ is identity ℤ→ℤ; second is identity ℚˣ→ℚˣ via determinant; excluded third is 0→ℚˣ, missing 2. | The range i≤n is necessary at its lower endpoint. | None. |
| `cyclicHomology_power_map` | C₁; C₇, a=2, j=1,2,3; a=0 | C₁ has positive homology 0=ℤ/1. The C₇ multipliers are 2,4,1 modulo 7 in degrees 1,3,5; power zero gives multiplier 0. | Degree-three weight is two, not one; j≥1 prevents the degree-zero substitution. | None. |
| `symmetricGroup_homology_stable` | (n,i)=(0,0),(1,1),(2,1) | H₀ map ℤ→ℤ is identity; excluded H₁ map Σ₁→Σ₂ is 0→ℤ/2; admitted Σ₂→Σ₃ is identity ℤ/2→ℤ/2. | Range n≥2i discriminates the first failure. | None. |
| `finite_sl2_localized_homology` | q=2,3,4,5,7,8,9,16,27 | Cyclic orders q²−1 are 3,8,15,24,48,63,80,255,728 on the source calculation and target. | Includes S₃=SL₂(𝔽₂), characteristic two and three, and non-prime q. | None. |
| `finite_sl2_integral_homology` | Same q | Integral orders are 6,24,30,120,48,126,240,255,2184; localization removes respectively factors 2,3,2,5,1,2,3,1,3. | All exceptional cardinalities and two ordinary cases distinguish the formula from its localized version. | None. |
| `finiteBloch_order` | q=4,5; excluded q=2,3 | Actual kernels have orders 5 and 3, matching q+1 and (q+1)/2; at 2,3 the kernels are 0 and 2ℤ≅ℤ instead. | The q≥4 hypothesis and antisymmetric target matter. | None. |
| `blochC_order_six` | ℝ detector; negative control 𝔽₅ | In units π², ρ([2])=1/12, ρ([−1])=−1/4, hence ρ(c)=−1/6; multiples 2c,3c,6c have values −1/3,−1/2,−1≡0 modulo ℤ. At 𝔽₅, c=2 modulo 6 has order 3. | Exact order six is consistent with the formally-real hypothesis; the finite field is excluded. | None. |

The finite SL₂ values use Hutchinson Corollary 3.6 and Lemma 3.14 (hutchinson2013 line 704 and hutchinson2013 line 861); the finite Bloch comparison uses Lemma 7.4 and Corollary 7.5 (hutchinson2013 line 1679 and hutchinson2013 line 1731). These are checks of the unchanged signatures, not claims that evaluating the formulas proves the general homology theorems.

### Signature comparison

I compared every one of the 13 supplied mechanically elaborated `#check @name` signatures with its README statement. The five tensor/symbol declarations match §§3.1, 3.3–3.4; the matrix inclusion and GL stability match §4.8; cyclic and symmetric stability match §4.15; the two finite SL₂ theorems match §5.2; the finite Bloch theorem matches §5.5; and the formally-real theorem matches §5.8. The explicit hypotheses retain `Infinite F`, the degree bounds, identity coefficient morphisms, prime characteristic, cardinality ≥4 and `IsFormallyReal F` where needed; there is no dropped binder and no type or hypothesis was changed. `Suggested.lean` is byte-for-byte unchanged, so the supplied elaboration remains applicable; no fresh scratch elaboration is claimed.

### Build, dependency check and gate

Commit: `044bdcb1fc2fd91ab737a03f80cfcf07af956539` — `K3BlochGroups: review repairs (clarify exported Bloch interface and downstream ownership)`. Only `TauCetiRoadmap/K3BlochGroups/README.md` changed; the working tree is clean. Nothing was pushed.

`lake build TauCetiRoadmap.K3BlochGroups.Suggested` exited 0, with eight expected admitted-theorem warnings and the exact completion line:

```text
Build completed successfully (8976 jobs).
```

The final movable dependency check exited 0 with exactly:

```text
depcheck: 33 roadmaps, 306 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line in that final check. The ColemanIntegration reference is in Downstream consumers, and no ColemanIntegration supplier was added.

The final full gate, run after committing, exited 0 with exactly:

```text
gate K3BlochGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The passing gate does not resolve the external ownership conflict described in H01.
