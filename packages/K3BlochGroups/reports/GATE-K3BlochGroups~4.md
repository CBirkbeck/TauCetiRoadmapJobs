## H01 (CBirkbeck) — answered

The competing construction mandates are confirmed: `TauCetiRoadmap/ColemanIntegration/README.md:1458` still constructs the integral pre-Bloch quotient, antisymmetric cokernel, boundary and Bloch kernel independently, and `TauCetiRoadmap/PolylogarithmFunctions/README.md:1069` still assigns those constructions to ColemanIntegration. **H01 remains unresolved:** `TauCetiRoadmap/K3BlochGroups/README.md:15`, `:683`, `:724` and `:2273` already specify the shared owner and the natural presentation equivalences correctly; closing the finding requires changing the two consumer contracts, which this job does not authorize editing.

### Evidence and required reconciliation

| Evidence | Consequence |
| --- | --- |
| ColemanIntegration §L2.Fb, lines 1458 and 1466–1471, at the indexed open head: the reduced five-term quotient, antisymmetric quotient, symbol, boundary, kernel, universal properties and field maps are its construction targets. Its line 1478 lists inputs without K3BlochGroups; its README contains no K3BlochGroups reference. | The conflict survives independently of the spelling of the unreduced presentation here. |
| PolylogarithmFunctions, Downstream consumers, line 1069, at the indexed open head: the ColemanIntegration paragraph retains its symbol constructions, field maps and algebraic Bloch groups. | The analytic supplier's ownership description also needs amendment. |
| K3BlochGroups §§3.4–3.5, lines 683 and 724, specify mutually inverse symbol-preserving presentation maps, field naturality, their boundary square and restriction to kernels. Its downstream contract, lines 2273–2275, distinguishes equivalence from definitional equality. | No missing local comparison was identified. Reasserting ownership or adding another local equivalence would leave both competing mandates intact. |
| Weibel VI.5, opening and Definition VI.5.1, PDF p.495: weibel line 29550, weibel line 29553 and weibel line 29564. | Omitting the raw generator [1] and explicitly killing it give equivalent presentations with the same ordered boundary. This does not make separately constructed Lean quotients definitionally equal. |
| Polylogarithms, Scope and ownership and supplier contract, lines 12 and 103; HabiroNahmSeries §From TauCetiRoadmap.K3BlochGroups, line 78, in the supplied open checkouts. | Both consume the shared carriers from K3BlochGroups. HabiroNahmSeries' description of Coleman's evaluation does not amend Coleman's own contract. |
| At main 82e5289bf8b92392296479fd440df88d82008701 neither ColemanIntegration nor PolylogarithmFunctions is a merged folder. The prescribed merge order places PolylogarithmFunctions, K3BlochGroups and ColemanIntegration at lines 42, 113 and 153 respectively. | Retain K3BlochGroups as the earlier shared owner. Importing ColemanIntegration here would reverse the permitted supply direction. No construction or ownership was moved. |

The required consumer repair is concrete: ColemanIntegration §L2.Fb must consume the shared symbols, pre-Bloch quotient, antisymmetric quotient, boundary, Bloch kernel, universal properties and field maps, preserve public names through aliases where possible, and list K3BlochGroups Layer 3 as an input. Its evaluation, branch descent and projective adapters remain its targets; PolylogarithmFunctions' ColemanIntegration paragraph must assign the shared algebraic objects to K3BlochGroups and retain the analytic and p-adic work at its existing owners. This report does not recommend resolving H01.

Ownership searches covered main and the indexed open roadmap heads, the board packages and all 32 supplied sibling roadmap folders, by pre-Bloch presentations, integral five-term quotients and antisymmetric tensor cokernels. The relevant overlaps in Polylogarithms, HabiroNahmSeries and HabiroNumberFields consume the K3BlochGroups objects; none supplies an earlier replacement for this interface. No new construction, source, supplier or declaration was introduced.

The actual pinned checkouts identify Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, matching the manifest. Object searches there found no pre-Bloch/Bloch presentation to replace these targets; `TauCeti.antisymmetricTensors` in `TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean:126` is the flip's negative eigenspace, with membership at line 133, rather than the integral cokernel. The citation resolver reported no missing cross-roadmap references; its external library-name scan was unavailable, so the pinned searches were separate. The supplied citation lead `uce.source_superperfect` is expressly a target of StableHomotopyKTheory §3.29, not a purported pinned declaration.

### Adversarial mathematics

No mathematical statement was added or changed. These computations recheck the interface at issue and every declaration of the unchanged acceptance file; they do not certify every theorem in all six layers. Finite presentations below use every admissible pair, rather than a selected relation.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Reduced/unreduced equivalence, §3.4 | 𝔽₂, 𝔽₃ | Reduced free ranks 0,1; unreduced free ranks 1,2; killing [1] gives 0 and ℤ on both sides. | Both directions agree; forgetting [1]=0 fails. | None. |
| The equivalence with nonempty relation sets | 𝔽₄=𝔽₂[ω], ω²+ω+1=0 | Both presentations have matrix ((3,−2),(−2,3)), Smith factors (1,5), quotient ℤ/5, and symbols [ω]↦1, [ω²]↦4. | Characteristic two is included. | None. |
| Preservation of the signed relation | ℚ, (4,2) | Both sides have arguments (4,2,1/2,3/2,3) with coefficients (1,−1,1,−1,1); denominators are 4,1/2,−1, all nonzero. | Same relation and admissibility. | None. |
| Boundary order, §3.5 | ℚ, [3] | (v₂∧v₃)(3∧(−2))=0·0−1·1=−1; reversing factors gives +1. | The sign is determined independently of the kernel. | None. |
| Commuting boundary square | 𝔽₅, [2],[3],[4] | Both presentations give classes (2,1,0) modulo 6 and boundaries (0,1,0) modulo 2. | Same map on generators. | None. |
| Restriction to Bloch kernels | 𝔽₂, 𝔽₃, 𝔽₄, 𝔽₅ | On both sides the kernels are 0, 2ℤ⊂ℤ, ℤ/5, and {0,2,4}⊂ℤ/6. At 𝔽₅, [3] has boundary 1 and is excluded. | The equivalence restricts to the actual kernels. | None. |
| Evaluation transported through the inverse equivalence | 𝔽₅, reduced evaluation [3]↦1 in ℤ/6 | Transport sends [2],[3],[4] to 2,1,0 and the Bloch generator [2] to 2; a zero map gives 0,0,0. | Symbol preservation determines transport. | None. |
| Naturality and composition | 𝔽₄ Frobenius | Both routes send [ω] from 1 to 4 modulo 5 and have boundary 0; the square sends 1 to 4²=1 modulo 5. | Field-map and composition conventions agree. | None. |
| `antisymSquare` | A=0, ℤ, ℤ/2, ℤ/3 over ℤ | Cokernels are 0, ℤ/2, ℤ/2, 0; their cyclic exterior squares are 0. For A=ℤ the flip's negative eigenspace is 0. | Distinguishes the three tensor objects. | None. |
| `antisymSquare_diagonal_exact` | A=0, ℤ, ℤ² | For 0 all terms are 0; for ℤ the kernel is ℤ/2=A/2A; for ℤ² the projection (ℤ/2)²⊕ℤ→ℤ sends (a,b,c)↦c, with e₁∧e₁↦(1,0,0) and e₁∧e₂↦1. | Diagonal kernel and quotient agree. | None. |
| `preBlochRawSymbol` | ℚ at 0,1,2 | Values are 0,[1],[2], with two distinct nonzero basis vectors at 1 and 2. | Raw one is retained. | None. |
| `preBloch` | 𝔽₂, 𝔽₃, 𝔽₄, 𝔽₅ | Quotients are 0, ℤ, ℤ/5, ℤ/6; the 𝔽₅ reduced relation matrix has Smith factors (1,1,6). | Small-field cases agree with both presentations. | None. |
| `preBlochSymbol` | 𝔽₅ at 0,1,2,3,4 | Values 0,0,2,1,0 modulo 6; [2] has order 3 and [3] order 6. | Killing every symbol gives the wrong values. | None. |
| `generalLinearStabilization` | ℚ, ranks 0,1 | Empty matrix↦(1); (2)↦diag(2,1), inverse diag(1/2,1), product I₂ and determinant 2. | Correct direction and last block. | None. |
| `generalLinear_homology_stable` | ℚ, (n,i)=(0,0),(1,1); excluded (0,1) | H₀ map ℤ→ℤ is identity; determinant identifies the second map with identity on ℚˣ; excluded H₁ map 0→ℚˣ misses 2. | Lower endpoints and degree bound discriminate. | None. |
| `cyclicHomology_power_map` | C₁; C₇ with a=2 and j=1,2,3; a=0 | Positive homology of C₁ is 0=ℤ/1; C₇ multipliers are 2,4,1 modulo 7; the zero power gives multiplier 0. | Weight two in degree three; j≥1 excludes degree zero. | None. |
| `symmetricGroup_homology_stable` | (n,i)=(0,0),(2,1); excluded (1,1) | H₀ map is identity on ℤ; H₁(Σ₂)→H₁(Σ₃) is identity on ℤ/2; excluded H₁(Σ₁)→H₁(Σ₂) is 0→ℤ/2. | Includes a nonabelian target; n≥2i distinguishes failure. | None. |
| `finite_sl2_localized_homology` | q=2,3,4,5,7,8,9,16,27 | Source orders from Corollary 3.6 and target q²−1 are 3,8,15,24,48,63,80,255,728. | Includes non-prime cardinalities and SL₂(𝔽₂)=S₃. | None. |
| `finite_sl2_integral_homology` | Same q, characteristics 2,3,2,5,7,2,3,2,3 | Source orders from Corollary 3.6 and Lemma 3.14 and target formula are 6,24,30,120,48,126,240,255,2184. | All seven exceptional sizes and two ordinary sizes discriminate localization. | None. |
| `finiteBloch_order` | q=4,5; excluded 2,3 | Actual finite kernels have orders 5,3, equal to q+1 and (q+1)/2; excluded kernels are 0 and 2ℤ≅ℤ. | q≥4 and the antisymmetric target matter. | None. |
| `blochC_order_six` | Real detector; excluded 𝔽₅ | In units π²: ρ([2])=1/12, ρ([−1])=−1/4, ρ(c)=−1/6; 2c,3c,6c give −1/3,−1/2,−1≡0 modulo ℤ. Over 𝔽₅, c=2 modulo 6 has order 3. | Consistent with the formally real hypothesis and an integral period. | None. |

The finite SL₂ source comparisons are hutchinson2013 line 704 and hutchinson2013 line 861; finite Bloch orders are hutchinson2013 line 1675 and hutchinson2013 line 1679. The table evaluates small presentations and compares source formulas; it does not turn an admitted build into a proof of the general homology theorems.

### Elaborated signatures

All 13 supplied mechanically elaborated `#check @name` types were compared with the README: the five tensor/symbol declarations with §§3.1 and 3.3–3.4; the matrix inclusion and GL theorem with §4.8; cyclic and symmetric stability with §4.15; the two SL₂ theorems with §5.2; the finite Bloch theorem with §5.5; and the order-six theorem with §5.8. The commutative-ring/module instances, field instances, infinite-field hypothesis, degree bounds, identity coefficient maps, finite-field and prime-characteristic hypotheses, cardinality bound and formally real hypothesis occur in the required types. No binder or generality mismatch was found, and none changed. The acceptance file is byte-for-byte unchanged from the supplied elaboration; no fresh scratch elaboration is claimed.

### Build, dependency check and gate

Both authorized roadmap files are unchanged at 044bdcb1fc2fd91ab737a03f80cfcf07af956539; the working tree is clean. No repair commit was created and nothing was pushed.

`lake build TauCetiRoadmap.K3BlochGroups.Suggested` exited 0 with eight admitted-theorem warnings and the exact completion line:

```text
Build completed successfully (8976 jobs).
```

The movable dependency check exited 0 with exactly:

```text
depcheck: 33 roadmaps, 311 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. ColemanIntegration remains a downstream consumer, not a supplier.

The full gate exited 0 with exactly:

```text
gate K3BlochGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
