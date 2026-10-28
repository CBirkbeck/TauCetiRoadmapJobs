# Polylogarithms human-review responses

Commit: `1ef12b02b1801138f8849df60e32531d04ee2d77` (parent `4696a1a07b88021687c890c11f5a14095986e7c1`). Only `TauCetiRoadmap/Polylogarithms/README.md` and `TauCetiRoadmap/Polylogarithms/Suggested.lean` changed; nothing was pushed.

## H01 (CBirkbeck) — applied

`TauCetiRoadmap/Polylogarithms/README.md:149` replaces the unrestricted zero-on-degenerate vector extension with a cocycle on four projective points, equivalently four nonzero vectors, and requires its identity on every five projective points (G04 line 307, formula (12)). The Checks at lines 158–160 compute the surviving repeated-point faces as D(i)−D(i)=0 and the excluded zero-vector extension as D(i)≠0.

## H02 (CBirkbeck) — applied

`TauCetiRoadmap/Polylogarithms/README.md:1139` replaces the degree-zero identification with higherArakelovChow(X,n,i)=H²ⁿ⁻ⁱ(Cone(P′)[−1]), so the Green presentation is at i=0 and cohomological degree 2n (G04 line 988, Definition 2.13, equation (35), and Proposition 2.14). The API and Checks at lines 1144–1159 now put the n=1 and n=2 pairs in degrees 2 and 4 and declare the second-coordinate sign that makes the graph boundary (div f,−log|f|); `TauCetiRoadmap/Polylogarithms/Suggested.lean:16` records the same grading and missing carriers.

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/Polylogarithms/README.md:905` separates ordinary degree r and ordinary d from Deligne degree k=r+1 and its critical second-order differential: a Green form has r=2p−2 and k=2p−1 (BUR line 2948, Corollary 3.8). At lines 914 and 917, −log|z| has ordinary derivative −Re(dz/z) without a Dirac term, while its critical normalized Deligne differential is −δ₀; the p=2 check gives ordinary/Deligne/output degrees 2/3/4.

## H04 (CBirkbeck) — applied

`TauCetiRoadmap/Polylogarithms/README.md:17`, line 121 and lines 827–855 replace local mandates for the abstract supported regulator and shared auxiliary complexes with imports from MotivicEtaleKTheory §§5.1–5.4 and 6.1–6.3, transporting every diagram arrow through J, retaining good truncation, the support colimit and the supplier’s quasi-projective scope for the supported regulator (BFT line 257, Proposition 4.3 at line 266). D_AH, β, the full current dictionary and the concrete restriction-fiber/Wang comparisons remain local, with explicit chain-square, empty/full-support and connecting-sign Checks; their ownership matches `TauCetiRoadmap/MotivicEtaleKTheory/README.md:13`, line 527 and line 591.

## H05 (CBirkbeck) — applied differently

K3BlochGroups was already a direct supplier in the Scope and in the weight-two presentation target; `TauCetiRoadmap/Polylogarithms/README.md:99` now calls it a direct prerequisite explicitly, and line 103 retains its exact §4.21 declarations, verified at head `000a2ba`. The prerequisite inventory for the reply must include K3BlochGroups, BorelRegulators and MotivicEtaleKTheory; the recomputed supplier closure has 33 roadmaps and 302 edges with zero problems, while pull-request text and the merge-order file are outside the authorized edits.

## H06 (CBirkbeck) — applied

`TauCetiRoadmap/Polylogarithms/README.md:99`, line 105, line 111 and line 705 replace the obsolete BorelRegulators §7.1 and missing-contract label with §2.3 for real injectivity/isomorphism, §§5.3–5.4 for lattice/covolume/rational-basis determinants, §5.1 for the totally real even case, and §3.4 for Tamagawa normalization. These contracts were verified at supplied-checkout head `b8bd21c`, including the π^(n−1) conversion and the empty determinants π²=6ζ(2), π⁴=90ζ(4) (BOR77 line 590, Remark 6.3).

## H07 (CBirkbeck) — applied differently

`TauCetiRoadmap/Polylogarithms/README.md:115` and all later uses replace MotivicEtaleKTheory Layer 4/§9.1/§12.2 with §§1.1–1.4, 2.1–2.4, 3.3–3.4, 4.1–4.2, 5.1–5.4, 6.1–6.3 and 7.1–7.4 according to the consumed construction, verified at head `9bcd1b6`, removing the obsolete missing-contract label. The actual supplier §1.1 also uses BFT’s infinity-face normalization, so lines 1017–1030 replace the alleged smaller normalization with the supplied normalization/degeneracy-quotient isomorphism and retain J₁=−1 (BFT line 82).

## H08 (CBirkbeck) — answered

The unrestricted rational H-space gap remains at `TauCetiRoadmap/Polylogarithms/README.md:101`, with its uses in §§2.2 and 3.8 unchanged: StableHomotopyKTheory §3.37 at head `00bfbf7` still assumes finite-type rational homology. The prime valuations give identity matrices on arbitrarily many rational prime units, so H₁ over ℚ is infinite dimensional and the new Borel/Deligne suppliers do not close this gap.

## H09 (CBirkbeck) — applied

`TauCetiRoadmap/Polylogarithms/README.md:145` scopes the nonzero order-two diagonal to ℚ(√−3), where the sixth-root factor detects it in ℤ/2. The same Check now computes its image over ℂ as w⊗w=4(t⊗t)=0 for t²=w, while the strict exterior boundary is zero over either field.

## H10 (CBirkbeck) — applied

`TauCetiRoadmap/Polylogarithms/README.md:24`, line 358, line 415, line 478, line 582, line 674 and line 744 distinguish retention of the endpoint generator from nonvanishing of its quotient class, restricting the nonzero witness to ℚ via L₃(1)=ζ(3)>0. The new characteristic-two Check computes R(1,1,1)=7[1], hence [1]₃=0 over 𝔽₂(t), while the raw weight-four [1] remains a cycle over every infinite field because u(1)=0.

## H11 (CBirkbeck) — applied differently

`TauCetiRoadmap/Polylogarithms/README.md:1239` adds the unique degree-normalized functorial characteristic-zero system of Bolbachan’s Theorem 1.8 in the explicit five-term quotient (BOL line 145 and line 238), with the raw differential/residue and analytic Chow-sign adapters at line 1241 and the D(i), 2D(i) witnesses at lines 1259–1260 (BOL line 254, Corollary 1.11, and line 260). Lines 1299 and 1345 use this route for characteristic-zero descent/comparison while retaining the prescribed line-value identification, positive-characteristic descent and higher-weight conjectures; the reference at line 1503 uses the v4 author’s name Vasily Bolbachan and date 21 February 2023, rather than the review’s Andrei attribution (BOL line 5).

## Validation

The final target build exited 0:

```text
lake build TauCetiRoadmap.Polylogarithms.Suggested
Build completed successfully (8976 jobs).
```

It emitted the nine expected admitted-theorem warnings, with no errors. A separate scratch module contained `#check @name` for every one of the 24 named declarations and elaborated successfully through the same target build before its temporary checks were removed; every elaborated type was compared with the README. No declaration lost a needed binder and no declaration signature changed: the only Lean edit is the module docstring explaining the corrected Green grading and the unstatable characteristic-zero reciprocity headline.

The final gate exited 0:

```text
gate Polylogarithms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The final dependency check exited 0; its complete output is:

```text
depcheck: 33 roadmaps, 302 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The worktree is clean. Citation resolution against main `d225eaf`, the indexed open heads and the specified pinned packages reports no unresolved cross-roadmap citations or Lean names. The build manifest equals the content repository’s manifest: Mathlib `6b7abb3` and Tau Ceti `a91d3aa`.

### Ownership, sources and declaration checks

Ownership was searched by object across main, the board packages and the open roadmap heads, including the supplied sibling checkouts. The shared support diagrams and abstract supported realization belong to MotivicEtaleKTheory; the normalized-current adapter and shifted D_AH comparison are additional explicit-current constructions owned here. The characteristic-zero reciprocity theorem concerns the same curve/function-field Bloch objects already targeted here; the search found no separate supplier owning that construction. No notion moved upward in the supply order and no existing roadmap was replanned. The downstream weight-four boundary was checked against `packages/ZagierConjecturePolylogarithms/design/README.md`; it is not imported as a supplier. Existing-roadmap progress pull requests were not used in place of main.

The main-shape examples read were `TauCetiRoadmap/AlgebraicCurves/README.md` and `TauCetiRoadmap/ComplexTori/README.md`. All previously listed source works have their supplied legal cached extractions; no missing text remains. The new certified BOL entry is recorded in `scratch/new-sources.toml` for incorporation into `packages/Polylogarithms/sources.toml`: that manifest is outside this job’s two-file edit authorization. Its single key is BOL, arXiv 2108.11862v4, SHA-256 `207fe334b3ab7df2fbf86a58ead626ca95e1bf62e8f984c3aede53523a30baa2`, fetched from the open arXiv repository, with v4 pagination and citations to §§5.14, 5.16–5.17.

| Evidence at the specified copies | Checked content |
| --- | --- |
| G04 line 307 | Fixed projective point in formula (12), not the zero vector |
| G04 line 388; line 988 | Cycle cochain degree 2n−i; higher Arakelov group is H²ⁿ⁻ⁱ |
| BUR line 2948; line 3066 | Ordinary logarithmic integrability/current compatibility and Green class comparison |
| BFT line 82; line 257; line 307 | Infinity normalization; supported auxiliary diagram; shifted comparison differential |
| BOR77 line 590 | Totally real rank-zero period formula |
| BOL line 111; line 145; line 210; line 238; line 254 | Characteristic-zero hypothesis; explicit quotient; homotopy equations; unique functorial system; analytic comparison |
| `TauCetiRoadmap/MotivicEtaleKTheory/README.md:527`, head `9bcd1b6` | Shared Aₚ/Aₚ,S/Hₚ, good truncation and J; §6.2 abstract support regulator; §7.2 independent character comparison |
| `TauCetiRoadmap/BorelRegulators/README.md:286`, head `b8bd21c` | Real isomorphism; §5.1 zero-rank theorem; §§5.3–5.4 lattice and covolume |
| `TauCetiRoadmap/K3BlochGroups/README.md:1670`, head `000a2ba` | Exact rational-function rigidity/specialization/presentation imports |
| StableHomotopyKTheory §3.37, head `00bfbf7` | Finite-type hypothesis remains present |
| `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57` | Actual source-shift-first mapping cone, with its component differential maps |
| `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44`, line 69 | Locally finite coefficient functions; weighted map requires quasi-compactness and does not impose codimension |
| `TauCeti/Analysis/Complex/ContinuousLog/Basic.lean:161` | Existence of a continuous logarithm on a set; no automatic global branch |
| `TauCeti/FieldTheory/FunctionField/Place/Residue.lean:113`, line 185 | Residue unit requires a valuation-zero proof; product rule retains that domain |
| `TauCeti/NumberTheory/LocalField/Logarithm.lean:285` | Deep-unit injectivity requires e<(p−1)i, including the depth restriction at p=2 |

The object searches at the pins did not find manifold-test-form current complexes, curve-function-field Bloch complexes or the higher-cycle Deligne regulator carriers required to state the repaired headlines; the docstring therefore keeps them unstatable instead of adding free-function or Prop stand-ins. The following type checks account for all named declarations; the nontrivial prime-valuation example also passes the build.

| Declaration | Elaborated hypotheses compared with README | Signature change |
| --- | --- | --- |
| polylog | Natural weight and complex argument | None |
| singleValued | Natural weight and complex argument | None |
| blochWigner | Complex argument | None |
| unitVector | Field F and element of F | None |
| FiveTermFunction | Field F; rational module V; function F→V | None |
| trilogCyclic | Field F; additive commutative group V; function and three field arguments | None |
| TrilogRelationFunction | Field F; rational module V; explicit inversion/three-term/admissible 22-term conditions | None |
| IsCycle3 | Field F; finitely supported rational symbol sum; all rational-module five-term tests | None |
| periodMatrix | Field F; common row/column index; embeddings and finite symbol columns | None |
| normalizedPeriod | Field/NumberField F; finite index with decidable equality; natural weight | None |
| lobachevsky | Real angle and the stated interval integral | None |
| blochWigner_lobachevsky | Strictly positive imaginary part | None |
| idealRegion | Complex argument; explicit real-shape branch | None |
| signedIdealVolume | Complex argument and product Lebesgue integral | None |
| idealRegion_finiteVolume | Nonzero imaginary part | None |
| idealTetrahedron_volume | Nonzero imaginary part | None |
| blochWigner_kummer | z≠0 and z≠1 | None |
| singleValued_three_relations | Actual TrilogRelationFunction on singleValued 3 | None |
| zagier_three_exists | Field/NumberField; equivalence indexing all infinite places; actual IsCycle3 and q≠0 | None |
| zagier_three_everyFamily | Same indexing and actual cycle hypotheses; q may be zero | None |
| zagierExistence_totallyRealEven | Field/NumberField/totally real; 2≤n and Even n; Fin 0 rows/columns | None |
| ellipticCharacter | Discrete full ℤ-lattice in ℂ; frequency and point | None |
| ellipticTrilogSummand | Same lattice hypotheses; three points; zero-sum nonzero-frequency subtype | None |
| ellipticTrilogKernel_summable | Same lattice hypotheses; every three complex points; full constrained frequency subtype | None |

## Adversarial mathematics pass

The entries below are instance tests and source/normalization checks, not proofs of the admitted headlines. G denotes D(i)>0 (the alternating-series computation gives approximately 0.915965594); ζ denotes ζ(3)>0. Numerical series checks agree within 3×10⁻¹⁰; exact rational, exterior and grading computations do not depend on those approximations. A zero written in an exterior calculation means the zero of the displayed rational exterior space, not an integral tame symbol.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Rational unit convention U(F) | x=1,−1,2 over ℚ | u(1)=u(−1)=0; ord₂u(2)=1, not 0 | Torsion and nonzero units distinguished | None |
| Odd endpoint convention | ℚ and 𝔽₂(t), weight 3 | L₃(1)=ζ over ℚ; R(1,1,1)=7[1] in characteristic 2, hence [1]=0 there | Retention is not universal nonvanishing | H10 |
| Bernoulli normalization | n=2,3 | coefficients (1,−1) and (1,−1,1/3) | Correct projection and signs | None |
| Complex branch convention | z=2 approached from above | Im Li₁(2)=−π and Im Li₂(2)=−π log 2; D(2)=−πlog2+πlog2=0 | Lower classical boundary cancels in D | None |
| Cross-ratio r | (∞,0,1,i), (0,∞,1,i) | i and 1/i=−i; values G and −G | Order and orientation pinned | None |
| Unnormalized alternation | alternating six-point class | 6! times class=720 times class | No hidden division by 720 | None |
| Shift differential | source degrees 2,3 | residue factors (+1,−1); adjacent shifted squares have opposite signs | Degree signs retained | None |
| Cube orientation J | q=0,1,2 | (1,−1,1); δJ₁=(−∂)(−1)=∂=J₀∂ | Arrows and complexes agree | H04/H07 |
| Embedding row counts and exponent | ℚ, ℚ(i); n=2,3 | (d,e)=(0,2),(1,0) over ℚ; (1,2),(1,3) over ℚ(i) | Native natural subtraction has intended nonnegative arguments | None |
| polylog | n=0,1,2; z=0,−1 | Li₀(0)=Li₁(0)=Li₂(0)=0; Li₂(−1)=−π²/12 | Native endpoint branches consistent | None |
| singleValued | n=0,2,3; z=0,1,−1 | empty sum at n=0 gives 0; L₂(1)=0; L₃(1)=ζ; L₃(−1)=−3ζ/4 | No headline uses n=0,1 junk values | None |
| blochWigner | 0,1,i,−i | 0,0,G,−G | Parity and endpoint conventions agree | None |
| blochWignerDesc | real field ℚ and ℚ(i) | real row 0; identity [i] gives G, conjugate gives −G | Quotient descent and selected rows agree | None |
| Integral antisymmetric boundary | w in ℚ(√−3) | strict wedge w∧w=0; antisymmetric diagonal detected as 1 in ℤ/2; twice gives 0 | Base field essential | H09 |
| Field-extension diagonal | same w in ℂ, t²=w | w⊗w=4(t⊗t)=0, versus order 2 before extension | Integral nonvanishing does not ascend | H09 |
| Projective cocycle value | distinct/repeated quadruples | (∞,0,1,i) gives G; (∞,∞,1,i) gives 0 | Correct positive and zero examples | H01 |
| Cocycle alternation/invariance | swap first two; scalar rescale | G maps to −G; scaling representatives gives G again | Domain is projective/nonzero vectors | H01 |
| Five-point cocycle, repeated points | (∞,∞,0,1,i) | surviving faces G−G=0; other three are 0 | Cocycle survives coincidences | H01 |
| Excluded zero-vector extension | (0,e₁,e₂,e₁+e₂,(i,1)) | alternating sum G+0+0+0+0=G≠0 | False extension rejected | H01 |
| stableK_hurewiczPrimitive | zero ring; degree-one unit 2 over ℚ | zero group maps to 0; determinant/Hurewicz sends 2 to u(2), ord₂=1 | No rank-zero or finite-type shortcut | H08 retained |
| Hurewicz naturality/inverse/rank filtration | identity ring map; class of 2 | forward-inverse coefficient 1; stabilization coefficient 1 | Zero and rescaled maps excluded | None |
| stableHomology_primitiveProjection | independent u(2),u(3); degrees 0,1,2 | e(1)=0, e(a)=a, e(ab)=ab−(ab+ab)/2=0 | Identity on all homology fails | None |
| Primitive Borel pairing | primitive a and product ab | primitive pairing preserved; pairing on ab=0 before/after projection | Pairing is not arbitrary cohomology | None |
| Unrestricted H-space need | primes 2,3,5,… over ℚ | valuations give identity matrices of every finite size; dim H₁ is infinite | Finite-type supplier theorem insufficient | H08 retained |
| borelCalibration_two | X=E₁₂,Y=E₂₁,Z=E₂₂ | Tr(X[Y,Z])=1 and Alt Tr(XYZ)=3 | Factor of three pinned | None |
| Borel period conversion | ℚ,n=3; ℚ(i),n=2 | Tate periods in ℚˣπ⁻²ζ and ℚˣπ⁻³ζ_F(2); row factors π² and π give expected exponents 0 and −2 | Coordinate powers preserved | H06 locators |
| Upper-half-space circumcenter | z=i; z real | c=(1+i)/2 with squared radius 1/2; real case selects ∅ before division | No real-shape denominator used | None |
| idealRegion | z=i at a base vertex, height 1 | sphere inequality 1/2≤1+1/2; height positive | Region contains allowed cusp points | None |
| idealRegion_finiteVolume and cusp tails | cusp area A; H and 2H | integral from H to ∞ is A/(2H²); at 2H it is A/(8H²) | Correct inverse-cube density | None |
| Truncation/exhaustion independence | exhaustion omitting a fixed open ball B | omitted integral on B>0, versus required omitted limit 0 | Union condition discriminates | None |
| signedIdealVolume | z=i,−i and real shapes | signs +1,−1,0; real region integral 0 | Orientation matches D | None |
| lobachevsky | θ=0,π/2,π and −θ | Λ values 0,0,0; Λ(−θ)=−Λ(θ) | Factor 2 inside logarithm essential | None |
| Lobachevsky reflection/duplication | θ=π/4 | Λ(π/2)=0=2Λ(π/4)+2Λ(3π/4) | Duplication signs consistent | None |
| blochWigner_lobachevsky | z=i | angles π/2,π/4,π/4; RHS=2Λ(π/4)=G=LHS | All angles positive and sum π | None |
| idealTetrahedron_volume | z=i and conjugate | +G and −G on geometric and analytic sides | Nonreal hypothesis retained | None |
| blochWigner_kummer | i,(1+i)/2,2,−1,1/2 | i gives (−1,i,i), RHS=(0+G+G)/2=G; latter real cases give 0=0 | Numerical residual below 3×10⁻¹⁰ | None |
| Fourier cutoffs | S₃(i), S₆(i) | 1−1/9=8/9; 8/9+1/25=209/225 | Starting index and cutoff agree | None |
| ℚ(i) weight-two special value | [i]₂ | π²G/2 divided by ζ(2)G is 3 | Discriminant and exponent agree | None |
| trilogCyclic | b(1)=1,b(−1)=−3/4; a=b=c=1 | raw block is [1]+[−1], hence ζ−3ζ/4=ζ/4; three blocks plus [−1] give 3ζ/4−3ζ/4=0 | Block and full relation agree | None |
| Coordinate 22-term relation | triples (1,1,1) and (2,2,2) over ℚ | R(1,1,1)=3[1]+4[−1]; analytic value 3ζ−3ζ=0; at (2,2,2) coefficient of [1/4] is −3 | Raw free-symbol relation distinguished from quotient zero | None |
| TrilogRelationFunction and singleValued_three_relations | x=2; b(x)=x | inversion test for b gives 2−1/2=3/2≠0; L₃(2)−L₃(1/2)=0 | Predicate has genuine negative control | None |
| Three-term normalized relation | x=2 over ℚ | 7ζ/8−3ζ/4+7ζ/8−ζ=0 | Endpoint correction indispensable | None |
| Analytic endpoint period | x=1 over ℚ | period ζ≈1.202056903>0, versus killed-endpoint value 0 | Nonvanishing restricted to justified fields | H10 |
| Weight-three explicit differential | [1], [3] over ℚ | δ₃[1]=[1]₂⊗0=0; δ₂[3]=u(2)∧u(3) with valuation determinant 1 | Cycle condition is quotient-valued | None |
| FiveTermFunction | zero function; b=indicator of 2 over ℚ | zero gives 0; at (2,3), b(2)−b(3)+b(3/2)−b(3/4)+b(1/2)=1 | Endpoints alone insufficient | None |
| unitVector | 0,1,2·3 | vectors 0,0,u(2)+u(3), with valuations (1,1,0) for 6 | Totalized zero and multiplicative additivity agree | None |
| IsCycle3 | zero sum, [1], [3] over ℚ | 0 and [1] give 0 tensor; [3] detected by coefficient (u2∧u3)⊗u3=1 | Universal test has positive/negative instances | None |
| Low-weight complex square | d²[x]₃ | (1−x)∧x∧x=0; at x=3 coefficient repeated u3 is 0 | Actual quotient differential squares to zero | None |
| Prime-unit independence example | 2,3,5 over ℚ | valuation matrix diag(1,1,1), off-diagonal 0 | Nontrivial proved example remains valid | None |
| resExterior uniformizer | ord_t, t∧2∧3, 2∧3∧5 | residues 2∧3 and 0; replacing t by 2t preserves 2∧3 | Uniformizer independence witnessed | None |
| Unit-part homomorphism | t and 2/t | unit parts 1 and 2; product unit part 2 | Killing nonunits would give 1·1≠2 | None |
| Weight-three raw symbol residue | [2]₂⊗t and [t]₂⊗2 | residues [2]₂ and 0 | Valuation is on tensor factor | None |
| Exterior/tame sign | t∧2 and t∧t | exterior residues 2 and 0 additively; tame values 1/2 and −1 multiplicatively | Rationalization cannot prove unsigned integral identity | None |
| Ramification law | t=s² and t∧2∧3 | residue after pullback 2(2∧3); degree factor RHS also 2(2∧3) | Factor e=2 retained | None |
| genericVectorConfig | q=1 tuples (1,2),(1,3); zero vector | two ratios 2 and 3 differ; zero has rank 0<1 | Individual scaling quotient excluded | None |
| Bigrassmannian truncation | m=3,4 | BC₃³=0; BC₄³=C₄(3); lower-row outgoing map=0 | Quotient rather than false subcomplex | None |
| Deletion/projection anticommutator | delete two distinct indices | coefficients +1 and −1, sum 0 | D²=0 | None |
| Triangle parameter | z=1,2 | determinants (z,−z,z,−1); ratio z²/z=z gives 1,2 | Ordered determinant convention fixed | None |
| Geometric endpoint comparison | T(1) over ℚ and 𝔽₂(t) | quotient values [1] with periods ζ over ℚ, zero class in characteristic 2 | Universal nonvanishing removed | H10 |
| Geometric degenerate relation | coincident point; three vs four collinear | repeated tuple class 0; T(1) retains ζ over ℚ despite three collinear side points | Wrong broader zero rule excluded | None |
| Seven-point reduction sign | auxiliary point put last vs first | moving across six positions is +1; boundary rearrangement adds −1 | Coefficients −(−1)^i retained | None |
| Projected ratio | moment parameters 1,2,3,5,7 | ratio 6/5; last-two swap 5/6 | Inverse convention excluded | None |
| Triple ratio | six moment parameters 1,2,3,5,7,11 | T=10/9; given nonconic tuple T=1 | Endpoint one is admissible | None |
| r₄ normalization | four vectors listed in §3.5 | coefficient 18 on u5∧u67∧u197; replacing −3 by 2 gives −12 | Lower scalar fixed before periods | None |
| r₅ deletion square | moment parameters 1,2,3,5,7 | δr₅ and r₄∂ both give 36u2∧u3∧u5 | Wedge sign and factor agree | None |
| r₆ geometric normalization | elementary triangle z=2,1 | values 18[2] and 18[1]; periods 18·7ζ/8 and 18ζ over ℚ | Kernel ambiguity not ignored | None |
| Top iterated-boundary control | nonconic tuple | coefficient −60 for 18M₃; raw alternating triple gives +300, times −1/5 gives −60 | Necessary control does not prove class equality | None |
| Gale duality | rank-two four-vector tuple of §3.6 | dual columns (−1,−1),(−2,−3),(1,0),(0,1); original times dual transpose=0 | Kernel construction, rank and double-dual dimensions agree | None |
| Gale-dual comparison sign | C and C* | M₃(C)+M₃(C*)=0; unnormalized Alt₆=720M₃ | Negative duality retained | None |
| Top Milnor quotient/transfer | Steinberg triple; degree-two extension | Steinberg class 0; Nres(s)=2s, whereas factorwise norms give 8s | General norm, not factorwise norm | None |
| Rank-two vanishing/stabilization | GL₂ class and stabilized GL₃ class | GL₂ image 0; GL₃→GL₄ coefficient 1 | No arbitrary rank scalars | None |
| Borel weight-three calibration | ℚ and general signature | row factor π²; exponents −2r₁−5r₂+2(r₁+r₂)=−3r₂ | Required period conversion retained | H06 locators |
| Cycle lifting/Borel image containment | endpoint cycle over ℚ | lift must preserve Borel period ζ; zero lift would give 0≠ζ | Full all-configuration obligation remains | None |
| periodMatrix | one raw column 2[1] over ℚ | entry 2ζ; zero column entry 0 | Linearity and actual object fixed | None |
| normalizedPeriod | ℚ n=3 and empty ℚ n=2 | value ζ and π²; det(empty)=1 | NumberField/Fintype/DecidableEq binders retained | None |
| zagier_three_exists | ℚ and ℚ(i), family [1] | Z=ζ and π³ζ/2=16ζ_F(3), with q=1,16 | All infinite rows required | None |
| zagier_three_everyFamily | zero column, two equal columns, scaling by 2 | determinants 0,0,2det; q=0,0,2q | Zero scalar is allowed | None |
| Rational-curve projective specialization | f=1/t at t=0; constant family | pole→∞→zero symbol; constant difference [a]−[a]=0 | Totalized finite evaluation excluded | None |
| Higher-symbol inversion | n=1,3,4; x=2 or1 | at n=1 correct valuation 1+(−1)=0; wrong sign gives 2; at x=1 n=3 gives 0, n=4 gives 2[1]=0 | Weight-one exception and odd endpoint retained | H10 clarification |
| Weight-two presentation transport | [3] over ℚ | local δ₂[3]=u2∧u3; supplier boundary is its negative | Supplier equality imported with sign | H05 |
| Higher complex d² | [3]⊗u3 | u2∧u3∧u3=0 | Repeated-unit square zero | None |
| Full K₃ versus indecomposable rigidity | {t,a,b} over ℚ(a,b)(t) | t-residue {a,b}; next a-residue unit b or its inverse, not 1 | Full Quillen K₃ cannot be called constant | None |
| Cycle constancy | constant cycle; raw [t]₃ | constant derivative 0; raw boundary [t]₂⊗u(t) not 0 | Arbitrary family not admitted as a cycle | None |
| Zagier assertion implications | rational basis vs zero columns | det(basis)≠0; det(0)=0 | Existence and every-family distinguished | None |
| Basis/row changes | column swap; conjugate embedding | determinant changes by −1; even row by −1, odd row by +1 | Rational proportionality invariant | None |
| explicitRawCycleFour membership | [1],[2] over ℚ | boundary [1]₃⊗u1=0; [2] detected by L₃⊗ord₂=7ζ/8≠0 | Class-zero test would reject valid cycle | H10 |
| Weight-four inverse pair | [x]+[x⁻¹], x≠0 | [x]₃⊗(u(x)+u(x⁻¹))=0 | Explicit and inductive cycle inclusion agrees | None |
| cycleObstruction well-definedness | replace lift x by x+k | difference a(k) has quotient class 0 in T/H | Choice of lift eliminated | None |
| cycleObstruction_zero_iff | p=a=id on ℚ; b=q=0 | ω(1)=1≠0; only cycle lift is 0; ω(0)=0 and lift 0 | Both directions and nonexample tested | None |
| Injective-target lifting | weight-three q isomorphism | ker q=0, ω([1])=0; lift [1] has equal period ζ | Weight-four injectivity not assumed | None |
| zagierExistence_totallyRealEven | ℚ n=2,4; ℚ(√2) n=2 | Z/ζ_F=6,90,24 respectively | Empty determinant is nonzero | H06 locator |
| Finite-place residue complex | p=t−a and t²+1 over ℚ | residue fields ℚ and ℚ(i); constants have all residues 0 | Nonrational places retained, infinity excluded | None |
| Conditional whole-complex transfer | identity; degrees 2 then3 | coefficients 1; composite 2·3=6 equals tower degree | Tower and primitive-element coherences retained as hypotheses | None |
| Degree-current adapter | m=2,q=−1,0,3; empty manifold | outside-range spaces 0; q=0 tests degree2; empty tests0 | No truncated-natural subtraction | None |
| Current differential convention | q=0,1 | signs −1,+1; d² coefficient cancels to 0 | Smooth form/current derivative agrees | None |
| Test LF topology | bumps escaping compacts | compact-open seminorms eventually 0; common-compact LF condition fails | Wrong continuous dual excluded | None |
| Dirac distribution derivative | test φ(x)=x near0 | δ₀(φ)=0; derivative current gives −φ′(0)=−1 | Coordinate derivative sign fixed | None |
| No arbitrary current product | bump δ at scale ε | squared mass scales ε⁻ᵐ, diverges as ε→0 | No canonical δ² asserted | None |
| Analytic cycle multiplicities | reduced/double line; degree-two map | coefficients 1,2; pushforward degree2 gives 2, not1 | Resolution hypothesis matters | None |
| Current resolutions | star-shaped chart degree0 and positive degree | constants survive with H⁰=ℝ; higher closed exact class0 | Quasi-isomorphism is not zero complex | None |
| Poincaré–Lelong | f=z,z², nowhere-zero unit | ddᶜlog=δ₀,2δ₀,0 | Divisor coefficient and sign fixed | None |
| BFT current dictionary | d=1,c=0,1; ordinary q=1,2 | factors (2πi)⁻¹,1; Koszul signs −1,+1 | Scalar and pairing order both transported | H04 boundary clarified |
| Critical Deligne degree dictionary | p=1,2 | Green ordinary degree0,2; Deligne degree1,3; differential ordinary output2,4 | First and second derivatives separated | H03 |
| Support/regulator geometric scope | smooth separated X; quasi-projective X | support fiber applies in the first scope; higher-cycle regulator has the quasi-projective hypothesis in addition | No unsupported general regulator imported | H04 |
| Current restriction fiber | support empty/full | fib(id) contractible with cohomology0; fib(C→0)=C | Concrete adapter has same values | H04 |
| Nested support adapter | {0}⊂{0,1}⊂𝔸¹ | 1→(1,0), composite equals direct inclusion | Direction preserved | H04 |
| Raw connecting versus boundary | log\|t\| and −log\|t\| | divisor coefficients −1,+1 | Adapter preserves both conventions | H04 |
| Auxiliary diagram identification | p=1,m=1 and r=2,1 | total degrees1,0; cube coefficients+1,−1 | Shared objects imported through J | H04 |
| Good truncation | nonclosed ordinary top form α | d_Dα≠0 excludes α; brutal truncation would set that image0 | No extra top cocycle | H04 |
| D_AH differential | arbitrary a₁ with chain maps g₁,ρ | d² last components dg₁a₁−g₁da₁=0 and −dρa₁+ρda₁=0 | Both opposite signs required | H04 |
| Cycle inclusion and β | cycle Z and base α | images (0,cl Z,0),(0,0,α); ψ images P_c(Z),φ(α) | Maps retain source/target and coefficients | H04 |
| β quasi-isomorphism route | quotient by base D_A | quotient is shifted cone of quasi-isomorphism g₁, so H=0; β induces coefficient1 | No arbitrary zero map used | H04 |
| Admissible Chow locus | zero cycle; component contained in face | zero has empty support and satisfies properness; contained component dimension exceeds expected by1 | Open-locus condition discriminates | None |
| Relative-cycle specialization/base change | x²=t; t=s²; s=0,1 | fiber length2; [s]+[−s]→2[0] at0, [1]+[−1] at1; char2 gives2[s] | Multiplicity preserved over nonreduced bases | None |
| Tautological Chow cycle and incidence | [H],2[H] | support equal, coefficients1,2 and Chow transforms differ by factor2 | Reduced support insufficient | None |
| Admissible face/vertex operations | point contained in face; projection degree2 | negative expected dimension gives0 when proper; projection coefficient2 | Domains and residue degrees retained | None |
| logarithmicCurrent_integrable | g=−log\|z\|; coefficient \|z\|⁻² | radial absolute integrals ∫₀^ε r·\|log r\|dr finite; ∫₀^ε dr/r infinite | Logarithmic condition not a label | H03 |
| Ordinary first derivative of Green form | p=1,z=i, v=1 or i | dg[v]=−Re(v/i)=0 or−1; d[g]=[dg], no point mass | Critical Deligne correction not ordinary d | H03 |
| Critical Green identity | p=1,g=−log\|z\| | ddᶜg=−δ₀; normalized d_D[g]=−δ₀; adding cycle gives0 | Ordinary r=0, Deligne k=1 | H03 |
| Basic logarithmic coefficient law | α=(z₁+z̄₁)i dz₂∧dz̄₂ | ∂∂̄α=0, but ∂α and ∂̄α each nonzero with coefficient i | Separate boundary closure required | None |
| Green-form pullback domain | smooth transverse map; map into divisor | smooth representative pulls back normally; log0 undefined on contained image | No unrestricted current pullback | None |
| r₀,r₁,r₂ coefficients | m=1,2,3 | log\|f\|; iη; coefficients 1/6 and −1/2 for r₂ | i² sign retained | None |
| r form constant factors | constant norm1 vs2 | log1=0, derivatives0; log2≠0 can survive locally | Integrated vanishing not local deletion | None |
| r current degree/cancellation | m=1,c=1 | ordinary degree m−1+2c=2; log\|z\| dz/z∧dz̄/z̄ has divergent ∫\|log r\|dr/r | Correct degree; cancellation proof required | None |
| Raw Deligne complex | n=1 | functions degree1; closed (1,1) currents degree2; top dlog gives2πiδ_div | Not uniform degree-minus-one at top | None |
| Raw simplex regulator | i=0,1 | P⁽²ⁿ⁾=(2πi)ⁿ[Y]; i=1 uses r₀ with ordinary degree2n−2 | No r₋₁ at endpoint | None |
| Real descent | conjugate cycle pair | conjugation interchanges summands and fixes their sum | All embeddings retained | None |
| Wang forms | m=0,1,2 | T₀=1,T₁=u,T₂=u(∂v−∂̄v)−v(∂u−∂̄u) | Alternation and factorials agree | None |
| Wang/r dictionary | negative logarithms; m=1,2 | T₁=−r₀,T₂=+r₁ | Odd sign retained | None |
| Wang boundary | one cube | −δ₀+δ∞, equal to d_D[−log\|t\|] | Face sign fixed | None |
| Wang degeneracy | a ratio identically1 | logarithm and derivatives0; form0 | Constant norm≠1 excluded from this reasoning | None |
| Cubical normalization comparison | cube degrees0,1 | same infinity-face kernel in both sources; ∂ signs+1 versus δ signs−1, J₁=−1 | Obsolete smaller normalization removed | H07 |
| Cubical regulator degree/value | p=1,m=0,1; point-unit2 | degree2,1; δ-unit gives−log2, supplied complex gives+log2 | Coherent J needed | H07 |
| Cubical regulator resolution/degeneracy | degree-one resolution; pulled-back degenerate cube | coefficient1 retained; degenerate regulator0 | Only admissible cycles used | None |
| Integration comparison φ | m=0; bidegree(r,−m) | W₀=1, φ=base current map; ordinary degree r+m−1 minus2m=r−m−1 | Correct Deligne degree r−m | H04 import |
| Green/Wang identity | m=0; subcritical r=1,2 | d_D[g]=[ω]−δ_Z; subcritical signs+1,−1 | No W₋₁ term at m=0 | None |
| ψ comparison | pure cycle/base; principal Green pair | ψ=P_c,φ respectively; −log term cancels divisor | Concrete comparison remains local work | H04 |
| Universal Beilinson comparison | unit2; line class O(1) | log2 in weight1 and normalized c₁ integral1 | Supplier character independent of explicit formula | H07 |
| Mixed forms/degree | (n,m)=(0,0),(1,0),(0,1),(1,1) | forms1,W₁,G₁,M₁,₁; degrees2p,2p−1,2p−1,2p−2 | Both indices count | None |
| Mixed differential signs | (n,m)=(1,1) | cross coefficients−1,+1 sum0; J values on axes−1,+1 | Orientation only in cube degree | H07 locators |
| Simplex coordinate normalization | multiply z₀ by−1 or2 | log\|−1\|=0, log2≠0 | Only unit-norm change gives same jet | None |
| Chow polylogarithm degree/twist | q=1,p=0; q=2,p=1 | output degree0,0; scalar log and −∫r₂/(2π) | Adjacent fiber factor cancels2πi | None |
| Resolved incidence regulator | double component; two-point collision | values2R; specialization2R(point) | Resolution cannot discard multiplicity | None |
| Family-current base change | submersion versus contained singular stratum | transverse smooth pullback exists; distribution pullback of log at0 undefined | Reconstruct from pulled-back cycle outside domain | None |
| Green Chow principal relation | div f,−log\|f\| on ℙ¹ | curvature δ_div−δ_div=0; positive log gives2δ_div | Pair convention coherent | H02 |
| arakelovMotivicComplex grading | n=1,2 | (cycle,Green) degrees (2,1)→fiber2 and (4,3)→fiber4 | Minus-one cone shift is not degree-zero reindexing | H02 |
| higherArakelovChow indexing | i=0,1; n=1,2 | cohomology degrees2,1 and4,3 | Green group at i=0 is H²ⁿ | H02 |
| Green pair cone differential | graph W of f | d(W,0)=(div f,−log\|f\|); d² second component−Pdc+d_DPc=0 | Coordinate negation made explicit | H02 |
| Green group at a point | Specℂ,p=1 | cycles0; constant r killed by unit e^(−r), so group0 | Higher-Chow index0, cohomology degree2 | H02 |
| Nonprincipal Green class | point divisor on ℙ¹ | degree and curvature integral1, versus principal degree0 | Quotient does not kill all pairs | None |
| Modified top Deligne target | top smooth closed ω | class of ω in D′ is0; in D may be nonzero | Quotient must precede cone | H02 |
| Curve homotopy fiber | zero residue map | fiber Γ(F,n)⊕target[−1]; second summand retained | Literal kernel would lose adjacent boundary | None |
| Curve finite pullback | t=s² | residue multiplicity doubles from1 to2 | Ramification factor retained | None |
| η jet and bilinearity | (f,g,df,dg)=(2,i,0,−1) | η=log2; swapping gives−log2 | A constant first argument need not vanish | None |
| η current residue | (z,c) on disc | dη=−2πlog\|c\|δ₀; tame(z,c)=c⁻¹ gives same log | Inversion sign required | None |
| Steinberg current | η(f,1−f) | derivative is dD(f); exchanged pair gives−dD(f) | One-form sign agrees with supplier | None |
| Integral tame product | t,t−a on ℙ¹ | unsigned product−1; infinity signed tame−1 changes total to1 | Rational exterior cannot replace integral law | None |
| Curve Chern comparison | ch₂,₂ versus c₂,₂ | factor−1, cup representative iη; both signs give stated positive η | Chern convention retained | H07 locator |
| Chow dilogarithm Steinberg value | (1−t)∧t∧(t−i) | h=[i], D(h)=G, ∫r₂=−2πG, P₂=G | Real integral prefactor pinned | H11 |
| Chow dilogarithm constants/alternation | c∧f∧g; exchange first two | integrated value0; exchange negates value | Proper-curve integrated law, not local vanishing | None |
| Strong reciprocity first triangle | t∧(t−1)∧(t−3) | Res=3∧(−2)=−u2∧u3≠0; h=−[3] gives same δ₂ | Target cannot be Bloch kernel | None |
| Strong reciprocity second triangle | [t]₂⊗(t−i) | h((1−t)∧t∧(t−i))=[i]; raw symbol residue=[i] | Both triangles tested | H11 |
| Curve-function-field domain | connected ℙ¹ versus ℙ¹⊔ℙ¹ | k(t) is a field; k(t)×k(t) has (1,0)(0,1)=0 with both factors nonzero | Connected curve hypothesis explicit | H11 |
| strongReciprocity_charZero scope | k algebraically closed of char0; k=F̄₂ | theorem covers first case; characteristic of latter is2≠0 | No extrapolation to positive characteristic | H11 |
| Characteristic-zero functoriality | t=s²; Steinberg with a=i | H on pullback=2[i], versus degree2 times[i]; identity gives[i] | Degree normalization correct | H11 |
| BOL chain sign adapter | [x]₂⊗g and π∧u∧v | d_B=−d_here, res_B,sym=−res_here,sym, res_B,ext=res_here,ext; −δ₂,B=δ₂,here | H itself satisfies our raw triangles | H11 |
| BOL analytic sign adapter | Steinberg with a=i | P_BOL=−G; local P₂=+G=−P_BOL; D(H)=G | Negative source Chow coordinate transported | H11 |
| Uniqueness boundary | one map versus functorial system | differences of arbitrary lifts lie in kerδ₂; degree-normalized system has difference0 by theorem | No unsupported uniqueness of isolated map | H11 |
| Rational reciprocity auxiliary point | two choices off finite divisor support | five-term difference has degree-weighted sum0 because Σ ord f=0 | Auxiliary point independence | None |
| Families and algebraic-number curves | constant family; cover of degree2 | parameter derivative0; pullback period doubled and divided by2 rationally | No integral division by2 claimed | None |
| Elliptic line formula | swap L₁,L₂; tangent divisor2P | wedge and sum negate; tangent contribution2[P] | External minus and multiplicities preserved | None |
| ellipticFiveTermDescent | y=0 chord; two parenthesizations | divisor(P)+(0)−(P)−(0)=0; both association divisors cancel to0 | Constants vanish; kernel-zero alone insufficient | H11 route added |
| Char2/3 elliptic scope | Y²Z+YZ²=X³; Y²Z=X³−XZ² | char2 gradient (X²,Z²,Y²), no projective common zero; char3 gradient (Z²,2YZ,Y²−2XZ), no point on cubic with all zero | No invert-six restriction introduced | None |
| Characteristic-zero line identification boundary | transported H versus prescribed line sum | constant chord gives0 on each; general line equality remains required in explicit quotient | Available theorem does not erase positive-characteristic descent | H11 |
| Plane-line normalization | l₀=x,l₁=y,l₂=z | (y+z)/x generally≠1 | Separate normalizing lemma still required | None |
| ρ₂ diagonal | f=1/2, df=1 | −dL₃=−4log²2/3; omission of correction gives0 | Factor1/3 necessary | None |
| ρ₂ constant second entry | g=2, nonconstant f | correction −α(1−f,f)log2/3 generally nonzero | Constants not discarded from representatives | None |
| ρ₂ five-term descent | actual five-term sum | D sum0 and exterior/α sum0, hence full form0 | Both components required | None |
| K₄ curve Chern restriction | ramified versus unramified class | nonzero residue excludes kernel; residue0 permits restriction | No isomorphism onto all H² asserted | H07 locator |
| Higher reciprocity conjecture | n=2,3,4 | n=2 tame product1; n=3 a=3 requires nonzero h; n=4 not supplied by weight3 | Conjectural boundary retained | H11 |
| Torus Fourier adapter | square lattice frequencies0,1 | Haar integrals1,0; oriented shear determinant1 | Probability normalization fixed | None |
| ellipticCharacter | γ=1 at i/4; γ=i at1/4 | exp(πi/2)=i and exp(−πi/2)=−i; at0 value1 | Symplectic sign and unit norm | None |
| ellipticTrilogSummand | triad (1,i,−1−i), x=y=z=0 | numerator−1+2i, denominator2, value−1/2+i, norm√5/2 | Nonzero even at equal inputs | None |
| Kernel swap/translation/scale | swap last frequencies; common translation; λ=2 | summand negated; character product1; scale factor1/32 | Paired sum at equal inputs0 | None |
| ellipticTrilogKernel_summable | dyadic R=2^k | shell bound k/2^k gives1/2,1/2,3/8,1/4,…; total Σk/2^k=2 | Summable full triad domain; zero frequencies excluded | None |
| Fourier logarithm and area factors | one triad | three log factors (−A/(2π))³, derivative π/A, area−2iA give iA³/(4π²); multiplying−4/3 gives−iA³/(3π²) | Exact constants precede limits | None |
| Kernel zero-mode/cycle restriction | add constant to log g | individual pairing changes by constant·∫α∧ω; summed exterior cycle relation kills aggregate | Divisor-only relation insufficient | None |
| Completed-unit logarithm rank | ℚ, imaginary quadratic; real quadratic | ranks0,0,1; empty minors1; quadratic row(a,−a) has deleted minors−a,a | All embeddings, not primes, index columns | None |
| Leopoldt diagnostic congruence | ℚ(√2),p=7 | 10²≡2, ε≡11, ε⁶≡15=1+14 mod49; valuation1 | Nonzero unit logarithm from depth estimate | None |
| Deep logarithm restrictions | p=2,−1; p not a unit | log(−1)=0 torsion; log_p(p)=0 despite p infinite order | Injectivity only on stated deep units | None |
| Weight-three differential at real points | z=1/2,2,−1 | coefficients4log²2/3,−log²2/3,0 | Radial term cannot be dropped | None |
| Weight-three differential on circle | z=i, v=i or−1 | radial0; angular−G | Same sign as −ρ₂ diagonal | None |
| Weight-three endpoint derivative/conjugation | z→1; z,v conjugated | \|z−1\|log²\|z−1\|→0; derivative unchanged by conjugation | Endpoint derivative0, parity consistent | None |
