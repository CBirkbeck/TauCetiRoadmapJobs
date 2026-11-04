# Review of McKaySkewGroup (pull request #223 at 4b2d3c1)

**Verdict:** needs changes

Full review of the five specified files. There are five findings: three P1, one P2 and one P3. The supplied gate passes, but it does not establish that the three companion Lean files meet the rules imposed on them by this review.

Previous findings were checked first, against this head:

| Previous finding | Passage at this head and disposition |
| --- | --- |
| R01: companion files | **Not repaired.** `McKayClassificationTargets.lean:38–39` still has `canonicalClassEquiv ... := sorry`; `GeometricMcKayTargets.lean:351–354` still admits `clusterScheme`, `resolution` and `resolutionMap`. All three companions are unchanged. See R01. |
| R02: highest root supplier | **Repaired.** README §1.1 now makes the lemma local: “the dominant root is unique and is the highest root”. It assumes a nonempty connected simply-laced diagram, uses height reduction and the strict fundamental domain, and tests disconnected and non-simply-laced failures. RootSystems Layer 4 actually supplies the chamber statement. |
| R03: character recognition | **Repaired.** README supplier contract now names `FDRep.nonempty_iso_of_character_eq` and `FDRep.finrank_hom_eq_sum_of_character_eq`. Both exist in the pinned `TauCeti/RepresentationTheory/CharacterTable/Determined.lean:117,127`; their finite-group/characteristic-zero hypotheses are recorded. |
| R04: curved carriers | **Repaired in README and Suggested.lean.** The docstring now distinguishes existing curved DG modules and scalar duplexes from “duplexes over a parity-graded algebra whose odd elements exchange the two components”. The left-module adapter uses curvature `−c`, as the native square requires. The obsolete geometric/curved stand-ins in companions remain covered by R01. |
| R05: centre ownership | **Repaired.** README §5.3 says the block-scalar algebra map is “CharacterTheory Layer 2's ... map ... consumed as it is”; the new map is explicitly the linear trace-coordinate map. This does not repair the different centre-domain error in §6.3 identified below. |
| R06: manifest and invertibility | **Partly repaired.** README:178–181 now carries invertibility of the group order for the pinned representation-theoretic input. There is still no `sources.toml`; see R05. |
| R07: dependencies, wording, unused hypothesis | **Repaired.** §§0.1, 4.2 and 5.1 now have `*Needs:*` lines; the identified process wording is gone; the unnecessary nontrivial-group hypothesis was removed from the zigzag headline. |

No repair report available to this review marks these findings “not actionable in this package”.

## R01 (P1) — The companion files still admit data and fail elaboration

**Location:** `TauCetiRoadmap/McKaySkewGroup/CBHTraceControls.lean:132–133`: `scalarStarRepresentation ... := sorry`; `McKayClassificationTargets.lean:38–46`; `GeometricMcKayTargets.lean:189,351–354`.

**Claim:** The three companions are subject to the same Lean form rules as Suggested.lean. They contain admitted mathematical data, statements depending on that data, forbidden roadmap/submodule imports and catalogues of Checks. They also refer to declarations removed from Suggested.lean. The passing targeted build does not import these files.

**Witness:** A scratch copy of `CBHTraceControls.lean` fails at lines 46–47 on `DeformedPreprojectiveAlgebra` and `deformedPreprojectiveIdeal`, reaching 100 errors. `GeometricMcKayTargets.lean:351–354` constructs both schemes and their morphism with `sorry`.

**Repair:** Delete all three companion files. Their mathematical program and small controls belong in the README; keep the nine genuine acceptance theorems in Suggested.lean. Do not replace the admitted schemes, representations or equivalences by empty predicates. For the concrete witness, deletion removes the dangling uppercase algebra name and admitted scalar-star map; the retained Suggested.lean already elaborates independently. The README retains the matrix-unit calculation `E₁₀E₀₁−E₀₁E₁₀ = diag(−1,1)`.

## R02 (P1) — A vertex idempotent is outside the domain of the centre lift

**Location:** `TauCetiRoadmap/McKaySkewGroup/README.md:1464–1467`: “The centre lift sends the vertex idempotent `e_c` ...”; “the two-block central element `e_c + e_l`”.

**Claim:** The map constructed in §6.3 has domain `Z(B)`, where `B=e(Λ(V)⋊Γ)e`. The central vertex of the graph is being confused with a central element of its zigzag algebra. Neither `e_c` nor `e_c+e_l` belongs to this centre.

**Witness:** In the Q₈ corner, choose a nonzero degree-one arrow `a:c→l`. With the stated later-factor-first convention, `e_c a=0` but `a e_c=a≠0`. For `e_c+e_l`, use an arrow to a different leaf.

**Repair:** Replace this Check by a genuine central input, for example `Ωe_c`, with `Ω=x∧y`, and its lift `Ω(E^c₁₁+E^c₂₂)`; similarly use `Ω(e_c+e_l)`. Keep `θ(e)=1`. Test centrality against a degree-one arrow: both products are now zero because exterior degree three vanishes. Against degree-zero group elements, the determinant-one condition fixes Ω and the block projector commutes. Distinguish the centre of `ℂ[Γ]` from the centre of the whole exterior skew algebra. The general centre-isomorphism construction need not change.

## R03 (P2) — The root-quotient API omits validity of the affine type

**Location:** `TauCetiRoadmap/McKaySkewGroup/README.md:725–734`: “For `x, y` ... `x · C y` equals the finite Cartan form of the images”.

**Claim:** The definition accepts every native `AffineDynkinType`, but the API asserts `Cδ=0` and form preservation without `t.Valid`. Validity is present in the later headline and in the pinned null-vector and deletion theorems; it is not a standing convention for this earlier API.

**Witness:** At `t=.A 0`, the native carrier has one node, `C=[2]`, `δ=[1]` and finite rank zero. For `x=y=[1]`, the two asserted forms are `2` and `0`. Four concrete native computations elaborate with `decide`.

**Repair:** Add `t.Valid` to the root-quotient API assertions using the Cartan/null-vector/deletion results; the additive definition itself may remain total. Add `.A 0` as a negative-control Check. Retain the trivial-group singleton matrix `[0]` as a separate construction, as §2.1 already does. On valid `.A 1`, the repaired formula sends `(1,0)` to `−1` and both forms are `2`; `.A 0` is excluded rather than identified with the trivial-group matrix. Suggested.lean's headline already has the required hypothesis.

## R04 (P1) — The averaging-image prerequisite is attributed to a supplier that does not provide it

**Location:** `TauCetiRoadmap/McKaySkewGroup/README.md:287–288`: “AlgebraicVectorBundles L0: finite locally free sheaves with rank, tensor, Hom, determinant, pullback and averaging images”.

**Claim:** AlgebraicVectorBundles L0 does not state an averaging-image construction or a theorem that such images are finite locally free. The contract presents that prerequisite of §7.5 as supplied. There is no declared gap covering it. Naming the isotypic decomposition in §7.5 does not resolve this conflicting ownership claim.

**Witness:** `TauCetiRoadmap/AlgebraicVectorBundles/README.md:215–268` supplies locally free sheaves and the affine finite-projective comparison, with tensor/Hom/rank/determinant/pullback operations; it contains no group action, Reynolds projector or averaging-image target.

**Repair:** Remove “averaging images” from that supplier contract. Explicitly make the needed image construction part of §7.5: over a complex scheme, for a finite group acting on a finite locally free sheaf, construct the Reynolds idempotent and its finite locally free image, using the affine finite-projective comparison and the direct-summand argument; then apply it to `ρ_i* ⊗ R` and prove the rank from the regular fibres. Alternatively cite an actual earlier owner of precisely that construction. Test over `A=ℂ[ε]/ε²` with C₂ swapping the two basis vectors of A²: the projector is `½[[1,1],[1,1]]`, its image is the free rank-one summand A·(1,1), and its kernel is A·(1,−1). Their sum is A². This supplies the missing construction on a nonreduced base without assuming constant rank merely from terminology.

## R05 (P3) — The source manifest is still absent

**Location:** `TauCetiRoadmap/McKaySkewGroup/README.md:2092–2129` (References), and inline citations at §§1.1 and 5.1.

**Claim:** There are thirteen bibliography entries plus the inline Isaacs, Conze and Tikaradze works, but no `TauCetiRoadmap/McKaySkewGroup/sources.toml`. The required source identities, legal-access results and version-specific locators cannot be recovered from the package manifest.

**Witness:** The folder contains the README and four Lean files, with no manifest. In particular, the FKS bibliography distinguishes journal and arXiv pagination but records neither source version metadata nor access status in a manifest.

**Repair:** Add the sixteen works under one stable key per work, with the prescribed schema, precise locators and source-service metadata. Combine preprint/published versions in one entry. Record inaccessible texts honestly as uncertified where appropriate. Test the FKS entry against §8.3, arXiv v1 p.30, and the CBH entry against the distinct published theorem/section locators; do not copy cached source text into the repository. This review changed no manifest.

## Verified sound

The checks below are finite adversarial witnesses and source/API checks, not proofs of the admitted headline theorems. All five files and all README layers were read. The companion files cannot serve as mathematical acceptance tests until R01 is resolved.

Build and signature evidence:

- Head verified as `4b2d3c1250c5ee1ba0233818dd1942bb7bfbfe90`. The worktree was clean; the diff outside `TauCetiRoadmap/McKaySkewGroup` was empty.
- The worker gate reports every check zero and `OK`, including `build=0`, `depcheck=0`, `stray-files=0` and `outside-folder=0`.
- Independently ran `lake build TauCetiRoadmap.McKaySkewGroup.Suggested` and direct `lake env lean` on Suggested.lean: both passed, with only the nine admitted-theorem warnings.
- A scratch copy appended `#check @name` for all 24 declarations: nine theorems and fifteen definitions/instances. All elaborated; comparison with the README found no lost hypothesis in those nine headlines. In particular `Finite`, the faithful two-dimensional determinant-one assumptions, and the explicit validity argument of the representation-ring theorem remain in their signatures. No production file was changed.
- A scratch one-tactic probe tried `simp`, `rfl` and `infer_instance` on each of the nine theorem bodies; none discharged a theorem. Inspection of the relevant pinned statements found no single existing lemma giving any of those full headline conclusions. The companion catalogues are not exempt from padding rules; deletion is included in R01.
- The `.A 0` probe verified invalidity, diagonal Cartan entry `2`, mark `1`, and deleted rank `0`, using native definitions with `decide`.

The dependency command, using the supplied merge order, main content and `--movable`, returned:

```text
depcheck: 189 roadmaps, 1159 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. No merge-order file was changed.

Adversarial computations follow. Each row names the statement tested and gives actual values on the compared sides. “Retain” means the displayed instance agrees, not that sampling proves the general theorem.

| ID / statement | Instances and computed values | Result / change |
| --- | --- | --- |
| A01 §0.1 cyclic model | Order 1: generator `I`, determinant 1, subgroup cardinality 1. Order 2: generator `−I`, square `I`, cardinality 2. | Retain; no exclusion of the trivial group. |
| A02 §0.1 binary dihedral relations | Q₈: `i²=j²=−1`, `jij⁻¹=−i=i⁻¹`; order `8=4·2`. At parameter 1, the presentation has order 4 and is cyclic. | Retain bound `n≥2`. |
| A03 §0.1 exceptional quaternion norms | Golden-ratio vector `(0,1,φ,φ⁻¹)/2`: norm square `(1+(φ+1)+(2−φ))/4=1`; coordinate families have `8+16+96=120` elements. | Retain; sign/permutation restriction matters. |
| A04 §0.2 rotation pole equation | C₂ has two pole orbits of stabilizer 2: sum `1/2+1/2=1=2−2/2`. Tetrahedral `(2,3,3)`: `1/2+2/3+2/3=11/6=2−2/12`. | Retain. |
| A05 §0.2 pole bounds | Octahedral `(2,3,4)` gives `23/12=2−2/24`; icosahedral `(2,3,5)` gives `59/30=2−2/60`; trivial group gives empty sum `0=2−2`. | Retain separate trivial case. |
| A06 headline classification | `1,C₂,Q₈,2T,2O,2I` have orders `1,2,8,24,48,120`; `SL₂(F₃)` has `3(9−1)=24`, `SL₂(F₅)` has `5(25−1)=120`. | All displayed branches compatible. |
| A07 headline conjugacy | Trivial subgroup: conjugator `I` gives `H.map(conj I)=H`. For a cyclic diagonal subgroup, exchanging the two eigenspaces sends a generator to its inverse and preserves the subgroup. | Retain; subgroup conjugacy does not prescribe the given abstract isomorphism. |
| A08 headline order-48 conjugacy | `C₄₈`, dicyclic parameter 12 and `2O` all have order 48; their numbers of one-dimensional characters are respectively 48, 4 and 2. | The two exclusions distinguish the intended case. |
| A09 §1.1 matrix at trivial group | `V=1⊕1`: multiplicity matrix `[2]`, `C=2I−M=[0]`, δ=1, nullspace rank 1, sum of squares 1. | Retain separate singleton case. |
| A10 §1.1 C₂ double edge | `V=sign⊕sign`: `M=[[0,2],[2,0]]`, `C=[[2,−2],[−2,2]]`, `C(1,1)=0`, squares sum 2. | Retain multiplicity two, not a simple edge. |
| A11 §1.1 Q₈ star | Four one-dimensional simples and V of dimension 2: `V⊗V=Σχ`, `V⊗χ=V`; centre row gives `4−4=0`, leaf row `2−2=0`; `4·1²+2²=8`. | Retain. |
| A12 §1.1 faithfulness/determinant controls | S₃ standard representation has determinant −1 on a transposition and `V⊗V=1⊕sign⊕V`, producing a diagonal multiplicity 1. C₂ trivial two-dimensional representation gives diagonal multiplicity 2 and disconnected support. | Both excluded by the stated hypotheses. |
| A13 §1.1 weighted positive form | Q₈ with x equal to the centre basis vector: `xᵀCx=2`; weighted edge sum `4·(2·1)·(1/2−0)²=2`. With x=δ both are 0. | Retain weights and normalization. |
| A14 §1.1 highest-root lemma | A₂: dominant root `α₁+α₂` has pairings `(1,1)`; a simple root has `(2,−1)`. A₁⊕A₁ has two dominant roots. B₂ has dominant roots of two lengths. | Repaired connected/simply-laced assumptions discriminate. |
| A15 §1.2 labelling definition | Q₈ centre must have mark 2; assigning it a leaf predicts dimension 1 instead of 2. Assigning a nontrivial character to the affine node violates the trivial-class clause. | Labels are marked, not arbitrary graph bijections. |
| A16 headline existence of McKay labelling | C₂ produces valid `.A 1` and Q₈ valid `.D 4`, with matrices and marks of A10–A11. Trivial group produces `[0]`, not a valid affine diagram. | Retain nontriviality in this theorem. |
| A17 headline converse for valid types | `.A 1→C₂`; `.D 4→Q₈`; exceptional squared marks give 24, 48, 120. `.A 0` has validity false. | Retain `Valid`. |
| A18 §2.1 representation-ring multiplication | C₂ basis `(1,s)`: `[V]=2s`, regular class `r=1+s`; `2s·r=2+2s=2r`. Q₈: `[V](Σχ+2[V])=4[V]+2Σχ=2r`. | Retain both identities. |
| A19 §2.1 integral radical | C₂: `C(a,b)=(2(a−b),2(b−a))`; kernel consists of `(n,n)=nδ`, including negative n. Singleton `[0]` kernel is all ℤ. | Integral quotient, not merely rational. |
| A20 rootLatticeQuotientMap body | C₂: `q(a,b)=b−a`; q(1,0)=−1, q(0,1)=1, q(1,1)=0. q(0,−3)=−3. | Additivity/surjectivity compatible. |
| A21 headline representation-ring/root form | C₂ x=(1,0): affine norm 2, finite norm `2(−1)²=2`; x=δ gives 0 on both sides. Q₈ deleted marks `(2,1,1,1)` have finite norm `2(4+3)−2·6=2`. | Retain headline with `Valid`. |
| A22 §2.2 unrestricted API | `.A 0`, x=y=1: affine norm 2; map to rank-zero lattice has norm 0. | Fails; R03. |
| A23 §3.1 skew multiplication | C₂ acts by x↦−x: `(1#g)(x#1)=−x#g`, acting on 1 gives −x; reversed untwisted multiplication gives +x. | Retain left-action convention. |
| A24 §3.1 equivariant modules | k with trivial action: skew modules are k[C₂]-modules; trivial and sign give two simple classes, versus one for k-modules. Their direct sum has dimension 2. | Forgetting the group action fails. |
| A25 §3.2 symmetric action | C₂ sign on x: x maps to −x, x² maps to x²; applying g twice sends x to x. Degree-zero coefficient 1 stays 1. | Retain automorphism/action/commuting-scalar definitions. |
| A26 §3.2 exterior action | On V with g=−I, x,y map to −x,−y and Ω maps to Ω; `x∧x=0`. Zero V gives exterior algebra k and identity action. | Retain. |
| A27 §3.2 tensor action | g=−I sends `x⊗y` to `x⊗y` and x to −x; x⊗x remains nonzero, unlike the exterior quotient. Identity sends every word to itself. | Retain. |
| A28 §3.3 right dual formula | C₂ sign, coefficient φ at g: dual coordinate is `g·φ=−φ`; multiplying at the endpoint introduces the same −1 as the skew action. Trivial group gives φ itself. | Detects omitted group action in the dual identification. |
| A29 §3.3 canonical Koszul augmentation | k[x]: complex `B --x--> B → k` has cokernel k, dimension 1. Identity differential with zero augmentation has cokernel 0 and image 0 in k. | Canonical surjective augmentation excludes the wrong model. |
| A30 §3.3 unbounded Koszul terms | Dual numbers: every K_n has dimension 1; `ker(x)=kx=im(x)`. A finite truncation leaves terminal kernel dimension 1. | Retain unbounded relative Koszulity. |
| A31 §3.3 quadratic intersections | R=span(x⊗y) in k²⊗k²: K₃=0. R=x⊗k²: K₃=x⊗x⊗k² has dimension 2; R⊗k² has dimension 4. | Intersection definition discriminates. |
| A32 §3.3 generality/duality | V=k, Γ=1: Sym(V) has dimensions `(1,1,1,…)`; its dual exterior algebra `(1,1,0,…)`. For S=ℚ[t], the outer free bimodule's right dual is ℚ[t]^ℕ, uncountable, whereas every finite module over ℚ[x,y] is countable. | No algebra/dual identification; finite separable base hypothesis retained. |
| A33 §4.1 full primitive corner | Q₈ matrix block: `E₁₁E₁₁+E₂₁E₁₂=I₂`, but keeping only E₁₁ gives rank 1, not rank 2. Including all four scalar blocks gives 1 in the group algebra. | Retain primitive, not central, basic idempotent. |
| A34 IsMcKayQuiver / preprojective headline | Γ=1: one loop doubles to two loops and relation `xy−yx=0`, giving k[x,y]. C₂: Kronecker arrows double to two arrows in each direction, matching M entry 2. | Headline includes both boundary cases. |
| A35 zigzag headline | Q₈ exterior skew algebra dimension `4·8=32`; basic D̃₄ zigzag dimension `2·5+2·4=18`; Morita equivalence does not claim equal algebra dimensions. | Retain corner equivalence. |
| A36 §4.2 cyclic relation | C₃ skew ratios are −1 at three vertices, product −1; ordinary ratios have product +1. C₄ product is +1 and alternating vertex rescaling is consistent. | Odd cycle remains skew; no invalid ordinary-zigzag identification. |
| A37 §4.2 exceptional small cycles | Trivial exterior algebra has dimension 4, versus 2 for the isolated-vertex ordinary zigzag convention. C₂ exterior skew degree-one dimension is 4, two arrows each way. | Separate singleton/double-edge cases retained. |
| A38 §5.1 trace coordinate | Q₈ central block scalar f_c=1 has trace λ_c=2; leaves f=1 have trace 1. Thus λ_c/δ_c=1, not 2. | Retain endpoint dimension factor. |
| A39 §5.2 scalar-star test | `a=E₁₀,a*=E₀₁`: commutator `diag(−1,1)`; vertex dimensions `(1,1)`, scalar weighted trace `−1+1=0`. Both arrows nonzero generate Mat₂. | Scalar weights admit the displayed simple. |
| A40 §5.2 trace-star exclusion | Trace weights `(−2,1)` force `−2d_c+d_l=0`. With total dimension 2 and nonnegative dimensions, d_c≥1 would force total≥3; d_c=0 forces d_l=0. Remaining leaf simples have dimension 1. | No corresponding two-dimensional simple; normalization is discriminating. |
| A41 §5.3 centre vs trace | Q₈ central projector z_c: `Tr(z_c²)=2`, but `Tr(z_c)²=4`; block scalar square `1²=1`. | Trace map linear, not an algebra equivalence. |
| A42 §5.3 deformed relator/scaling | λ=0 gives the same relator ideal as Π⁰. Scaling both matrix arrows by 2 gives `diag(−4,4)=4λ`, not 2λ; scaling one gives 2λ. | Directions and powers agree. |
| A43 §5.3 orientation reversal | `a↦a*`, `a*↦−a`: new commutator `−a*a+aa*=aa*−a*a`; vertex weights unchanged. | Retain. |
| A44 CBHAlgebra / CBH headline | Γ=1,z=0: both presentations k[x,y]. Γ=1,z=1: both `[x,y]=1`. C₂ uses Kronecker, not a single edge. | Boundary presentations agree; primary CBH locator uncertified below. |
| A45 §5.3 characteristic control | Over F₂, `D=E₀₁,T=E₁₀` give `[D,T]=diag(1,−1)=I₂`; trace is 0. In characteristic zero trace of identity on dimension d is d, not 0 for d>0. | No characteristic-p extension of nonexistence. |
| A46 §6.1 native curvature adapter | FKS d²=c, native left d²=−w: w=−c gives −(−c)=c; w=c gives −c. At c=0 both give 0. | Retain sign and zero case. |
| A47 §6.1 parity/tensor curvature | Odd a,m: right adapter sign is −1. Bimodule curvature `(c'−c)` plus input c gives c'. At c'=3,c=1: `2+1=3`. | Retain graded opposite and source/target order. |
| A48 §6.2 reflection parameters | Adjacent a,b and t=(2,3): s_a gives (−2,5), then s_b gives (3,−5), then s_a gives (−3,−2). Opposite braid word also gives (−3,−2); s_a² gives (2,3). | Retain braid and inverse parameter formulas. |
| A49 §6.2 zero parameter | For adjacent vertices, t=(0,3) gives s_a(t)=(0,3); the duplex retains its comultiplication component despite the zero parameter. The inverse theorem requires t_a≠0. | Boundary scope retained. |
| A50 §6.3 Morita inverse | In Mat₂, `q_r p_s=E₁rE_s₁=δ_rs E₁₁`; `Σp_rq_r=I₂`. Hence Ψ⁻¹Ψ(p_s⊗n)=p_s⊗n, not twice that vector. | Tensor/Hom inverse normalization agrees. |
| A51 §6.3 centre Check | Arrow a:c→l: `e_ca=0`, `ae_c=a`; after Ω multiplication both sides 0. Compression of E₁₂ is `E₁₁E₁₂E₁₁=0≠E₁₂`. | First equality fails for proposed central input; R02. Noncentral compression control is sound. |
| A52 §6.3 curvature in Hom inverse | q odd: `(Df)(q)=−d(f(q))`; applying D twice gives `d²(f(q))`, since `(−1)²=1`. q even gives the same square without either sign. | Retain homogeneous-map differential. |
| A53 §6.4 crossed multiplication | In C₂ sign example, moving g past x contributes −x; moving twice contributes x. Treating the tensor factors as independent untwisted products gives +x at the first move. | Crossed actions required. |
| A54 §6.4 Fourier idempotent | Q₈ two-dimensional block: identity coefficient `δ_cχ_c(1)/8=4/8=1/2`. Omitting δ_c gives 1/4, producing z_c/2, whose square z_c/4 differs from z_c/2. | Retain dimension factor. |
| A55 §6.4 kernel size | A has dimension 32 for Q₈; `Ae_c` has dimension `4δ_c=8`, so tensor block dimension 64. Leaf block has dimension `4²=16`. | Endpoint-dependent sizes retained. |
| A56 §6.4 adjoint normalization | Scalar M=1, G_A=2,G_U=4 gives D=1/2. Scaling G_A by 3 and G_U by 2 gives D'=3/4=(3/2)D. | Matches α/β, not β/α. |
| A57 §6.5 ordered composites | Q₈ maps displayed in README give scalars `(1,−2)` on dimensions `(2,1)`; traces `(2,−2)`. Rescale by 1/2: scalars `(1/2,−1)`, traces `(1,−1)`. | Weighted equation correct; raw antisymmetry false in source. |
| A58 §6.5 coordinate inverse | Example δ_b=2,c_ab=1,s_ab=3,s_ba=1/6,x_ab=6: x̂=2,ĉ=1/2, ε̂=1,y=6,ŷ=2; inverse `(δ_bs_ba)⁻¹ŷ=3·2=6`. | Dictionary and inverse agree. |
| A59 §6.5 curvature conjugation | κ_c=2κ_l, reflecting at leaf with f_l=3 changes f_c by 6, whereas unweighted reflection changes it by 3. Equal κ gives coefficient 1. | Retain diagonal conjugation. |
| A60 §6.5 kernel rescaling | μ=Δ=1,t=2,r=3,(v,w)=(5,7): map-after-D gives `(−14,15)`; D'-after-map on `(5,21)` gives `(−(2/3)21,15)=(−14,15)`. | Coefficient and adjoint must change together. |
| A61 §7.1 quotient and dual coordinates | Γ=1: invariant ring S and quotient identity. For C₂, x²,xy,y² fixed; at the origin quotient fibre has basis 1,x,y, length 3 rather than group order 2. | No unwarranted flatness. |
| A62 §7.1 freeness/conjugation | −I fixes only 0; diag(1,−1) fixes the x-axis but has determinant −1. g=I induces identity on invariants and Spec; composing g and g⁻¹ induces identity. | SL₂ and contravariant coordinate convention retained. |
| A63 §7.2 cyclic presentation | C₂: X=x²,Y=y²,Z=xy gives XY=Z². n=1 gives X=x,Y=y,Z=xy and eliminates Z. At t² coefficient, Molien series has 3, whereas omitting Z gives 2. | Kernel/generation and small case agree. |
| A64 §7.2 binary dihedral | m=2,x=1,y=2: X=−30,Y=17,Z=4; `X²=900=4(289−64)`. Under s:(x,y)↦(−y,x), w and A−B both change sign. | Relation and invariance agree. |
| A65 §7.2 exceptional weights | E₆ relation degrees `24=24=24`; E₇ `36=36=12+24`; E₈ `60=60=60`. Lowest degree products `48,96,240=2·(24,48,120)`. | Homogeneity/Hilbert leading coefficient agree; Springer locator uncertified. |
| A66 §7.3 minimal resolution | A₁ exceptional P¹ has normal degree −2 and intersection matrix [−2], negative of finite Cartan [2]. Trivial group has empty exceptional matrix and identity resolution. | Supplier specialization agrees. |
| A67 §7.4 cluster condition | C₂ cluster algebra basis `(1,x)` has dimension 2 and character `(2,0)`, regular. Origin quotient fibre basis `(1,x,y)` has character `(3,−1)`, not regular. | Cluster is not the whole quotient fibre. |
| A68 §7.4 nonreduced base | Over ℂ[ε]/ε², relation `x²=ε`, with y proportional to x on the chart, leaves free basis `(1,x)` of rank 2; reduction gives x²=0, still rank 2. | Relative finite-flat definition detects infinitesimal families. |
| A69 §7.5 tautological sign | C₂ sign multiplicity bundle is O(1), degree +1; its dual degree −1. Trivial summand O has degree 0. | Hom direction matches KV00. |
| A70 §7.5 exceptional lattice | C₂ trivial class maps to −E, sign to E; regular maps to 0; `(−E)²=−2`, negative of McKay norm 2. | Integral map/sign agree. |
| A71 §7.5 fundamental cycle | Q₈ deleted D₄: coefficients `(2,1,1,1)` yield intersections `(−1,0,0,0)`; `(1,1,1,1)` yields centre intersection +1. | Anti-nef minimality witness discriminates. |
| A72 §7.5 averaging images / R04 | Over A=ℂ[ε]/ε², swap matrix S satisfies S²=I; P=(I+S)/2 has P²=P, image rank 1, kernel rank 1, and image⊕kernel rank 2. | Mathematical repair works; cited supplier does not state it. |
| A73 §7.6 Lie comparison | A₁ gives rank 1, two roots, Lie dimension 3. E₈ gives rank 8, 240 roots, dimension 248. Trivial group gives rank 0 and dimension 0. Affine A₁ minimal Cartan dimension is `2·2−1=3`. | Finite Lie algebra and full affine realization distinguished. |

Headline coverage: the README's end results are Klein classification/conjugacy; McKay labelling and its converse; the representation-ring/root-lattice quotient; relative quadratic Koszul duality; polynomial/preprojective and exterior/zigzag corner comparisons; CBH deformation with trace weights; FKS reflection/Weyl functors and their Γ-side comparison; and geometric McKay. The nine retained theorem declarations cover the statable classification, labelling, lattice and corner statements. Suggested.lean:46–67 names the remaining relative, parity-curved and geometric headlines and the missing carriers. The small-group exceptions are retained in the README instead of false simple-graph signatures. No new absent statable headline was established by this audit; the companion stand-ins remain forbidden by R01.

Source sample, resolved against actual text rather than titles (fifteen requested targets):

| Sampled target | Locator checked and outcome |
| --- | --- |
| 1.2 McKay labelling | McK80 Props.1–2, printed p.183 (`McK80 line 68`), support connectivity/duality; full classification uses Ste85 §1(1)–(5),(8), printed pp.587–591 (`Ste85 line 36`, `Ste85 line 104`, `Ste85 line 152`). Finite complex SU₂ scope matches. The singleton and double edge are handled separately. |
| 2.1 representation-ring multiplication | Ste85 §1(1)–(3), printed pp.587–588 (`Ste85 line 36`, `Ste85 line 52`): dimension-vector equation. The ring identities are its semisimple representation-ring translation; A18 computes both cyclic and nonabelian cases. |
| 2.2 regular-class quotient | Ste85 §1(3)–(5), printed pp.588–590 (`Ste85 line 52`, `Ste85 line 73`, `Ste85 line 104`). Integral saturation additionally uses the affine mark 1, explicitly present in the roadmap; the unrestricted API error is R03, not an error in Steinberg. |
| 3.1 skew/equivariant modules | HK01 arXiv v2 §6.2, p.12, equation (38) (`HK01 line 546`, `HK01 line 551`) has the stated left skew multiplication. The module equivalence follows by restriction and the displayed inverse action; the native multiplication is consumed. |
| 3.2 three algebra actions | HK01 §6.2, p.12, (38)–(41) (`HK01 line 546`, `HK01 line 564`) uses the induced symmetric/exterior actions. Tensor extension is via the native universal property, not attributed to an additional HK theorem. Degree-zero/one/two tests are A25–A27. |
| 3.3 relative duality | HK01 Prop.13 (p.12) and Cor.3 (p.13), arXiv v2 (`HK01 line 568`, `HK01 line 578`); handedness warning immediately follows. HK works over ℂ. The nonmodular-field extension is a target here using the separable group-algebra base and DGAInfinity's general framework, not a verbatim general-field theorem of HK. |
| 4.2 cyclic groups | HK01 §6.3, arXiv v2 pp.13–14, Props.16–17 and (42) (`HK01 line 601`, `HK01 line 616`, `HK01 line 618`, `HK01 line 626`). Binary means containing −I; odd cyclic groups give skew ratios. The README preserves this distinction. |
| 5.2 Q₈ normalization | Direct trace/matrix calculation A38–A40. Tikaradze §2 p.4 (`Tikaradze line 135`) confirms the parameter is the block scalar multiplied by the dimension. Primary CBH and Conze locators remain uncertified below. |
| 5.3 CBH centre/comparison | CBK22 Introduction, arXiv v3 p.1 (`CBK22 line 24`, `CBK22 line 34`) confirms the later-factor-first relation and finite quiver scope. It does not certify CBH98 Theorem 0.1; that distinction is retained. |
| 6.3 curved Morita | FKS05 arXiv v1 §2.4, p.12 (`FKS05 line 462`) gives the curved bimodule convention; §8.1–8.3 (`FKS05 line 1120`, `FKS05 line 1150`) gives the exterior-skew setting. The explicit native-Hom/Morita adapter is the roadmap's construction. The erroneous centre Check is R02. |
| 6.4 reflection transport | FKS05 graph reflection construction (`FKS05 line 741`), Theorems1–2 (`FKS05 line 990`) and §9.3, preprint pp.36–37 (`FKS05 line 1381`) support the kernel/reflection comparison. The source and roadmap keep nonzero/orbit-generic conditions for inverses. Raw endpoint scalars require the correction recorded below. |
| 7.1 quotient/conjugation | Resolved native affine quotient and finite-group quotient declarations; ReflectionInvariantTheory §1 supplies polynomial invariants and finite generation. A61–A62 check the fibre, determinant and functor direction. This is not a claim that SchemeAndStackFoundations' projective quotient theorem alone applies to affine space. |
| 7.2 invariant presentations | Cyclic/dihedral relations computed in A63–A64. Springer §4.5 remains uncertified; the exceptional degree calculations in A65 are independent consistency tests, not verification of the generation theorem. |
| 7.3 minimal resolution | NilpotentOrbits N6–N8, especially N8's explicit resolutions, supplies the surfaces and exceptional intersections. BKR01 Theorem1.2, arXiv v2 p.4 (`BKR01 line 122`), under its smooth quasiprojective complex variety and equivariantly trivial canonical-bundle assumptions (`BKR01 line 91`), identifies G-Hilb as crepant for dimension at most three; the dimension-two application meets them. |
| 7.5 tautological/exceptional lattice | KV00 §2.1 Proposition and Lemma, arXiv v2 p.5 (`KV00 line 179`, `KV00 line 193`), with `Hom_G(ρ,V)` fixed at `KV00 line 54`, gives incidence and positive O(1) restrictions. GSV83 printed p.412 (`GSV83 line 117`) corroborates the Chern-class convention. Rei97 §4.5 Proposition, preprint p.84 (`Rei97 line 3697`), supplies the numerical fundamental cycle. The marks/minimality argument is local, using the repaired highest-root lemma. |

Additional readable checks: CL18 Theorem1 p.10 (`CL18 line 681`) supports the explicit exceptional quaternion sets; CBK22 Theorems1.2–1.3 pp.2–3 (`CBK22 line 89`, `CBK22 line 96`) distinguishes equivalences at nonzero parameters from zero-parameter kernel/cokernel functors. No explicitly flagged unverified mathematical locator elsewhere in the README was left out of the source inventory.

Pinned-library audit: the following files/declarations were opened at the manifest pins. Paths here are relative to the named library, not a newer checkout.

| Pinned file and line | Declaration/content checked |
| --- | --- |
| Mathlib `Algebra/SkewMonoidAlgebra/Basic.lean:742,779,1042`; `Lift.lean:30` | `liftNCRingHom`, ring structure, `single_mul_single`, `liftNCAlgHom`; native skew algebra is consumed, not reconstructed. |
| Mathlib `RepresentationTheory/Character.lean:223,245` | `FDRep.scalar_product_char_eq_finrank_equivariant`, `FDRep.char_orthonormal`; invertible group cardinality is a real input. |
| Tau Ceti `RepresentationTheory/CharacterTable/Determined.lean:117,127` | The two character-recognition/Hom-dimension theorems used to repair previous R03. |
| Tau Ceti `LinearAlgebra/RootSystem/AffineDynkinType/Basic.lean:135,154,177,411,500,519,658` | Node count, `Valid`, `IsGraphical`, diagonal Cartan entries, marks, affine node, and null-vector theorem. `IsGraphical` does not imply `Valid`; the null-vector theorem explicitly requires validity. |
| Tau Ceti `LinearAlgebra/RootSystem/AffineDynkinType/Deletion.lean:83,131,384` | Finite type, Bourbaki inclusion and valid-type principal-submatrix comparison. |
| Tau Ceti `RingTheory/Morita/Corner.lean:388` | `IsIdempotentElem.cornerEquivalence`; inverse is the Hom/coinduction functor, not definitionally the tensor functor. The roadmap constructs the comparison. |
| Tau Ceti `Algebra/Homology/Curved/Module/Defs.lean:65` | `IsCurvedDGLeftModule`: graded Leibniz and square `−w`, both required. |
| Tau Ceti `Algebra/Homology/Curved/Duplex.lean:92`; `Frobenius.lean:174,255` | Scalar duplex carrier and its split Frobenius/stable-homotopy machinery; these do not themselves provide odd algebra actions exchanging parity pieces. |
| Tau Ceti `AlgebraicGeometry/Quotient/FiniteGroup/Affine.lean:54,60,65,73,85` | Integral/surjective projection, finite projection over a finite-type invariant base, and orbit-fibre theorem. The general theorem asserts neither flatness nor finite presentation. |

Ownership and supplier checks were by object, using the roadmap service's grep over supplied open heads and main, pinned-library searches, and board package searches. Main contains no earlier McKaySkewGroup roadmap to extend. Generic representation-ring, simple-class, group-algebra, corner and ordinary quiver carriers are native or deferred; the new ownership here is the finite SL₂ representation-specific comparisons and the transported Γ-side constructions. Open revisions of existing suppliers were not substituted for their main-branch contracts. No duplicate fully qualified name of the retained Suggested.lean declarations was found in the searched suppliers.

Cross-roadmap contracts resolved against their text:

| Supplier | Resolved location and consumed object |
| --- | --- |
| CharacterTheory | Main Layer2/3, `README.md:221–262`: Wedderburn blocks, centre, complete characters and central projectors. Character recognition instead comes from the pin above. |
| LieGroups | Main `README.md:479–485`: SU₂→SO₃ double cover and kernel. CompactGroups/ClassicalGroups are scope deferrals for the ambient groups, not a new source of classification here. |
| RootSystems | Main `README.md:296–315`, Layer4: strict chamber fundamental domain; Layer5: finite ADE classification. |
| ReductiveGroups | Main `README.md:1125–1141`, 9A.1a: norm-two shell, height reduction and root-sum test. |
| ZigzagPreprojective | Main `README.md:35–55,126–138,435–447`: graph/skew-zigzag ownership and transfer through supplied Morita data. It leaves the group-specific McKay comparison here. |
| QuiverRepresentations | Main `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:270–310`, Layer3: primitive idempotents and finite-dimensional basic-algebra Morita reduction; the actual McKay corner presentation is additional. |
| DGAInfinity | Main `README.md:629–674`, Layer11: separable semisimple base, right bimodule dual, relative quadratic theory. |
| GrothendieckEulerForms | Main `README.md:283–330`, Layer3: finite/linear graded resolutions, with the linear condition at 313–322. |
| StablePeriodicCurved | Main `README.md:154–198,411–446`: ideals/stable quotients and right curved modules with graded-opposite sign conventions. |
| NilpotentOrbits | Main `README.md:369–451`, N6–N8: ADE equations, explicit resolutions and completed slice comparison; the geometric McKay identification is additional. |
| ReflectionInvariantTheory | Main `README.md:7–17`, §1: induced polynomial action, Reynolds, Molien and finite generation, consuming the native integral-extension theorem. |
| GroebnerGeometry | Main `README.md:63–101`, G1: ideals, standard monomials and normal forms. The roadmap uses these mathematically, without adding an executable algorithm. |
| SchemeAndStackFoundations | Main `README.md:2624–2677,5706–5717,6567–6719,6987–7019`: quotient contracts, projective Hilbert functors, Chow/degree/Chern and coherent K-theory. Affine G-clusters are an open-family specialization developed here. |
| AlgebraicVectorBundles | Main `README.md:215–268`, L0: finite locally free sheaves, rank, tensor, Hom, determinant and pullback. The unsupported attribution of averaging images is R04; the isotypic construction must have explicit ownership in McKay §7.5. |
| KacMoody | Supplied new-roadmap head, `README.md:20–41`, KM0–KM1: full singular realization and full Lie presentation, rather than only the derived H/E/F quotient. |

The existing-roadmap shape was compared with RootSystems, CharacterTheory and ReflectionInvariantTheory on main. The reviewed README has the requested high-level sections, per-layer examples/dependencies, and substantive discriminating Checks. It contains no copied source passage or computational algorithm identified by this review. The general relative/nonmodular and odd-cycle cases are retained; no “good primes only” restriction was introduced. There are no declared supplier gaps to condition acceptance on.

## Not verifiable

- **CBH98**, Theorem0.1 and §§3–4: the source service reached the Project Euclid DOI landing page but no readable legal full text. The parameter normalization is independently supported by Tikaradze §2 and computed above; that is not certification of the primary theorem's locator or its complete proof.
- **CS03**, §6.5: the service reached the Taylor & Francis publisher page and found no accessible legal text. CL18 supplies an independent readable check of the coordinate sets, but not verification of this book locator.
- **Isaacs**, Theorem4.3: title resolution and institutional searches found no readable legal copy. The Burnside–Brauer proof route was inspected mathematically, but this theorem number/page is not certified.
- **Conze99**, printed p.3 before Theorem0.9: the author's legal PDF was fetched; it is image-only and the available extraction/OCR could not read that page. The trace identity was checked independently with Tikaradze and Q₈.
- **Spr77**, §§4.4–4.5: the source service reports an uncertified publisher/paywall locator. No circumvention was attempted, and the settled uncertified result is not a new request for the same text. Exceptional invariant generation and the exact book numbering remain uncertified.
- The companion files' dependent mathematical signatures cannot be certified as actual Lean statements: their carriers are admitted or unresolved. R01 records the concrete elaboration failure. Finite calculations about their intended objects do not make those files valid.

The missing-source list was consolidated for the worker. No report of unavailable text is being treated as evidence that the cited mathematics is false, and no source file was copied into the repository.

## Source issues

- **Error** in FKS05 at §8.3, arXiv v1 p.30: the source says raw scalar composites on opposite endpoints are antisymmetric; it should be their traces, weighted by the dimensions of the endpoint representations, are antisymmetric; affects a stated result.

The witness is `FKS05 line 1168` and A57: scalar composites 1 and −2 have sum −1, while their traces 2 and −2 have sum 0. The roadmap's §6.5 corrects this interpretation. No published correction was verified.
