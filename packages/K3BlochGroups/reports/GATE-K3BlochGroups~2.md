## H01 (CBirkbeck) — applied differently

The dependency K3BlochGroups Layer 3 → ColemanIntegration L2.Fb is now explicit at `TauCetiRoadmap/K3BlochGroups/README.md:2275`, with the cross-ratio and Rogers inputs supplied independently by PolylogarithmFunctions. **H01 remains unresolved:** ColemanIntegration §L2.Fb at `ae078af` still constructs the integral carriers, and PolylogarithmFunctions “Downstream consumers” at `860558b` still assigns them to ColemanIntegration; reconciling those two contracts requires edits outside the authorized files, while importing the later ColemanIntegration here would reverse the supplied order (positions 114 and 154).

## H02 (CBirkbeck) — applied

The unrestricted AlgebraicCurves 12A supplier claim becomes a proper-curve overlap contract at `TauCetiRoadmap/K3BlochGroups/README.md:121`; §3.12 now specifies the local adapter on every smooth connected curve using the pinned regularity, dimension and DVR results, the native fraction field, the actual closed-point residue field, the rational-point identification, and agreement with 12A's order at lines 897–904. The all-smooth-curve relation set is retained, the dependency is corrected throughout at lines 941 and 1076, and lines 932–935 compute affine-line, characteristic-two, nonrational-point, proper-overlap, singular and nonreduced controls.

### Sources, ownership and interfaces

AlgebraicCurves on main `eafdde4`, Layer 12A, defines its curve carrier to be integral, proper and dimension one (`TauCetiRoadmap/AlgebraicCurves/README.md:1102`); its contract therefore does not include the affine line. The dimension-one regular-local DVR step is also explicit at weibel line 1470 (I.3.8, proof, combined PDF p.32). The original all-smooth-curve relation set and its specialization argument occur at goncharov line 764 and goncharov line 782 (§1.9, pp.221–222); the repair adds the local interface without replacing that relation set by proper or rational curves. These are existing source keys; no new cited work or missing reference was introduced, and the settled waived citations were not reopened.

The content manifest and checked package heads agree: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The added supplier declarations were read at those pins:

| Input | Pinned locator and actual scope |
| --- | --- |
| Smooth-stalk regularity | `TauCeti/AlgebraicGeometry/Morphisms/Smooth/Regular.lean:39`: smooth over a locally Noetherian scheme with regular stalks; no properness or perfect-field assumption. |
| Closed-point dimension | `TauCeti/AlgebraicGeometry/Morphisms/Smooth/RelativeDimension.lean:83`: smooth relative dimension n over a field gives stalk dimension n at every closed point; no properness or residue-separability assumption. |
| DVR criterion | `TauCeti/RingTheory/RegularLocalRing/Basic.lean:171`: under `IsRegularLocalRing R`, DVR iff dimension one. Mathlib's class extends both local and Noetherian ring classes (`Mathlib/RingTheory/RegularLocalRing/Defs.lean:51`). |
| Native function field | `Mathlib/AlgebraicGeometry/FunctionField.lean:37` defines it as `X.presheaf.stalk (genericPoint X)` under irreducibility; integrality is needed for its field structure. The stalk fraction-ring instance is at line 163 and assumes `IsIntegral X`. |
| Native residue field | `Mathlib/AlgebraicGeometry/ResidueField.lean:45` defines it as `IsLocalRing.ResidueField (X.presheaf.stalk x)`; the quotient map is at line 54 and `descResidueField` at line 78. This definition does not identify it with the base field. |

Ownership was searched by object in main, board packages, the indexed open-roadmap heads and all 32 supplied sibling roadmap folders. The existing shared-Bloch conflict is exactly ColemanIntegration §L2.Fb versus K3BlochGroups Layer 3; Polylogarithms “Scope and ownership” and HabiroNahmSeries’s K3BlochGroups supplier contract already use the latter allocation. K3SurfacesAndSymplecticBoundedness §6.0b concerns localization of genus-one surface models, not this projective-symbol specialization adapter; SchemeAndStackFoundations §4.13 owns general scheme regularity, and the needed stalk results already exist at the pin and are imported rather than planned again. Section 3.12 owns only their local specialization and compatibility adapter within its existing all-smooth-curve scope; no notion was imported from a later roadmap.

The cross-roadmap citations were resolved against main and the available open heads, with the cited supplier sections inspected. The resolver reports no unknown roadmap citations or roadmap Lean names; its separate library-name phase was unavailable, so the added library inputs were verified directly at the pins. The earlier `uce.source_superperfect` lead is an explicit target of StableHomotopyKTheory §3.29, not a claim that the pin implements it. No acceptance declaration was assigned another roadmap's fully qualified name.

### Elaborated signatures

All 13 mechanically elaborated `#check @name` types supplied for this head were compared with the corresponding README statements; the scratch signature file contains all 13 checks. `TauCetiRoadmap/K3BlochGroups/Suggested.lean` is byte-for-byte unchanged from `000a2ba`, so these are still its types and no re-elaboration after a Lean edit was required: no binders, hypotheses or signatures changed. In particular the types retain the infinite-field hypothesis, homological bounds, nonzero cyclic order, identity coefficient maps, finite-field and characteristic instances, q≥4 and formal reality where required; the local adapter is a README interface, not an additional acceptance headline.

### Adversarial mathematics pass

The table covers every added mathematical clause and Check, together with every retained acceptance declaration. Homology orders taken from the existing sources are distinguished from the evaluated order formulas; the finite presentation relation matrices and their maximal-minor gcds were recomputed directly.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Stage supply direction | PolylogarithmFunctions, K3BlochGroups, ColemanIntegration | Order positions 43 < 114 < 154; analytic arrows 43→114 and 43→154, shared carrier arrow 114→154. | Correct direction; external duplicate mandates still conflict | Explicit arrow, H01 kept open |
| Smooth connected integral carrier | Affine line; disconnected union of two affine lines; empty scheme | F[t] is a domain; on the union (1,0)(0,1)=0 with both factors nonzero; empty scheme has no closed point or rational-point pair. | Connectedness/nonemptiness and the native integral carrier have their intended scope | Adapter hypotheses explicit |
| Closed-point regularity and dimension | 𝔸¹_F at (t), versus its generic point | At (t), maximal ideal/cotangent dimension = 1 and ring dimension = 1; generic stalk F(t) has dimension 0 and is a field rather than a DVR. | Closed-point hypothesis excludes dimension zero | Pinned inputs named |
| Native fraction field | O=F[t]_(t), f=t and 1/t | O injects t↦t; Frac(O)=F(t), t·(1/t)=1; t has no inverse in O itself. | Fraction field is fixed by the stalk injection | Fraction-field contract added |
| Rational residue identification | 𝔸¹_F at 0 and 1, F=ℚ and 𝔽₂ | t maps to 0 and 1 respectively; every a∈F maps to a in both stalk residues, and the two residue/base-field composites send a to a. | Identification is an F-algebra identification | Rational-point condition explicit |
| General closed-point residue field | 𝔸¹_ℝ at (t²+1) | Residue t↦i, t²+1↦0; [κ(x):ℝ]=2, whereas a rational point has degree 1. | Arbitrary residues cannot be replaced by F | Nonrational Check added |
| Inseparable residue control | 𝔸¹ over F=𝔽₂(s), x=(t²−s) | κ(x)=F(s^(1/2)), degree 2 and inseparable; vₓ(t²−s)=1, residue t=s^(1/2), (residue t)²=s. | Smooth curve still gives a DVR without residue separability | No extra restriction introduced |
| Valuation normalization | 𝔸¹_F at 0, n=0,1,2,−1 | v(tⁿ)=0,1,2,−1; inverse convention gives 0,−1,−2,1 and doubled convention gives 0,2,4,−2. | Uniformizer value +1 fixes sign and scale | Normalization and witness added |
| Total projective specialization | 0, ∞, t, t⁻¹, 1+t at 0 | Specializations 0,∞,0,∞,1; zero is handled separately, with no valuation of 0 required. | All branches and both projective endpoints determined | Map domain and endpoint values explicit |
| Characteristic-two affine points | 𝔸¹_𝔽₂ at 0 and 1 | At 0, v(t)=1, v(t⁻¹)=−1, v(1+t)=0, residues 0,∞,1; at 1, t↦1 and t−1=t+1↦0. | Both rational points remain distinct at p=2 | Characteristic-two Check added |
| Linear extension to symbols | α=[t]+[1−t], points 0 and 1 | sp₀α=[0]+[1], sp₁α=[1]+[0], difference 0; dα=(1−t)∧t+t∧(1−t)=0. | Existing cycle-difference construction uses the specified map | Extension source and target explicit |
| Open-neighbourhood compatibility | 𝔸¹_F⊂P¹_F at 0 | Both stalks are F[t]_(t), both fraction fields F(t), both v(t)=1 and residues of 1+t are 1. | Maps agree through actual stalk identifications | Open restriction API added |
| Proper-curve order overlap | P¹ at 0 and ∞, s=1/t | At 0, v(t)=ord₀(t)=1; at ∞, v(s)=ord∞(s)=1 and v(t)=ord∞(t)=−1; both specializations send t at ∞ to ∞. | Equality of orders fixes the actual map, not just its kernel | Proper-overlap comparison added |
| Singular negative control | Cusp F[t²,t³] at its origin | m/m² has basis t²,t³ and dimension 2; local ring dimension 1. | 2≠1 excludes regularity and the DVR conclusion | Negative-control Check added |
| Nonreduced negative control | F[t,ε]/(ε²) at (t,ε) | ε≠0, ε·ε=0; a domain would force ε=0. | Native stalk cannot be replaced by its reduction | Negative-control Check added |
| Local boundary specialization with the adapter | f=t, 1+t, t⁻¹ at 0 | Specialized boundaries are d([0])=0, d([1])=0, d([∞])=0; their unit-unit residues have a factor 1 or a torsion factor −1, hence vanish rationally. | Adapter matches the existing DVR boundary lemma | Dependency repaired, lemma unchanged |
| Boundary sign retained | F=ℚ, [3] | v₂-v₃ pairing gives ∂[3]=3∧(−2)↦−1 and (1−3)∧3↦+1. | Goncharov boundary stays −∂ | No sign change |
| antisymSquare | ℤ-module ℤ, C₂, C₃, zero module | Tensor cokernels C₂,C₂,0,0; exterior square of ℤ is 0, differing from C₂. | Diagonal torsion retained | Unchanged |
| antisymSquare_diagonal_exact | A=0, ℤ, C₂, C₃, ℤ² | Diagonal kernels 0,C₂,C₂,0,(C₂)²; on ℤ² projection (a,b,c)↦c sends (1,0,0)↦0 and (0,0,1)↦1. In ℤ, diagonals at 1,3 agree because 1−3=2(−1); at 1,2 they differ. | Exactness and both directions of the diagonal relation pass | Unchanged |
| preBlochRawSymbol | F₂, inputs 0 and 1 | Values 0 and a nonzero free generator; only the quotient kills the latter. | Raw and quotient symbols distinguished | Unchanged |
| preBloch | F₂,F₃,F₄,F₅ | Reduced presentations: 0,ℤ,C₅,C₆; maximal-minor gcds 1,0,5,6. F₄ relation rows (3,−2),(−2,3) have determinant 5; F₅ rows include [4]=0 and [2]=2[3], with remaining relation 6[3]=0. Adding raw [1] and killing it gives the same groups. | Integral presentations agree | Unchanged |
| preBlochSymbol | F₅, inputs 0,1,2,3,4 | Coordinates on [3] in C₆: 0,0,2,1,0; orders at 2 and 3 are 3 and 6. | Zero symbol map excluded | Unchanged |
| generalLinearStabilization | n=0,1 over ℚ | Empty matrix↦(1); (2)↦diag(2,1), inverse diag(1/2,1), product I₂ and determinant 2. | Actual block inclusion retained | Unchanged |
| generalLinear_homology_stable | (n,i)=(0,0),(1,1), excluded (0,1) | H₀ map sends 1↦1; determinant H₁ map sends 2↦2; excluded 0→ℚˣ misses 2. | Degree range and coefficient identity matter | Unchanged |
| cyclicHomology_power_map | m=7,a=2,j=1,2; m=1; excluded j=0 | Multipliers 2¹=2 and 2²=4 mod 7; at m=1 both groups 0; j=0 gives degree 0 by natural subtraction, with H₀=ℤ rather than C₇. | Weight and index restriction pass | Unchanged |
| symmetricGroup_homology_stable | (n,i)=(0,0),(2,1), excluded (1,1) | H₀ map 1↦1; C₂=Σ₂→Σ₃=S₃ induces C₂→C₂ on H₁ with transposition↦1; excluded Σ₁→Σ₂ gives 0→C₂. | Includes a nonabelian test | Unchanged |
| finite_sl2_localized_homology | q=2,3,4,5,7,8,9,27 | Source orders from hutchinson2013 line 704 after localization: 3,8,15,24,48,63,80,728; evaluating q²−1 gives the same list. | Small characteristics retained | Unchanged |
| finite_sl2_integral_homology | Same q, with p=2,3,2,5,7,2,3,3 | Source orders from hutchinson2013 line 704 and line 861: 6,24,30,120,48,126,240,2184; conditional p(q²−1) formula gives the same list, without a p-factor at q=7. | Exception list retained | Unchanged |
| finiteBloch_order | F₄,F₅; excluded F₂,F₃ | At F₄, Qₛ(C₃)=0 and kernel order 5=q+1; at F₅, C₆→C₂ sends [3]↦1 and kernel has order 3=(q+1)/2. At F₂ kernel 0≠C₃; at F₃ kernel 2ℤ≠C₂. | q≥4 is essential | Unchanged |
| blochC_order_six | ℚ and real-closed extension; F₅ negative control | Rogers detector c has coefficient 1/12−1/4=−1/6; its multiples 2,3,6 give −1/3,−1/2,−1 modulo ℤ. Over F₅, c=2[3] has order 3. | Exact order six and formal reality distinguished | Unchanged |

### Build and gate outcomes

Commit: `09988f3` — `K3BlochGroups: review repairs (nonproper smooth-curve adapter and explicit consumer order)`. Only `TauCetiRoadmap/K3BlochGroups/README.md` changed; the worktree is clean, and nothing was pushed.

`lake build TauCetiRoadmap.K3BlochGroups.Suggested` exited 0 with the eight intended theorem-`sorry` warnings and no errors:

```text
Build completed successfully (8976 jobs).
```

The first gate found a TeX-style stalk subscript and the uncommitted README; the notation was corrected and the change committed. The final gate exited 0:

```text
gate K3BlochGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The requested dependency check with `--movable` exited 0; its complete output has no UPWARD, CYCLE or moved line:

```text
depcheck: 33 roadmaps, 303 edges, 0 problem(s)
```
