# PORT-EllipticKTheory

Branch: `roadmap/elliptic-k-theory`.
Head commit: c768968ea96bd927434966866354c1337cf5315f.
Base: `ae2562c`, with an initially empty `git status --short`.

The committed change contains only `TauCetiRoadmap/EllipticKTheory/README.md`, `TauCetiRoadmap/EllipticKTheory/Suggested.lean` and `TauCetiRoadmap/EllipticKTheory/metadata.toml`. The topic remains `math.KT`. Nothing was pushed, and no pull request, issue or comment was written.

## Validation

Targeted build: `lake build TauCetiRoadmap.EllipticKTheory.Suggested`, exit 0.

Exact outcome line:

```text
Build completed successfully (9059 jobs).
```

Warning count: **7**, all warnings stating “declaration uses `sorry`”, one per headline theorem. There are no other warnings or errors. The seven statements and eight supporting definitions/structures/abbreviations are preserved; only the module docstring was expanded to identify the additional unstatable prerequisites.

Exact gate summary:

```text
gate EllipticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate requires a clean worktree: its pre-commit run had every content counter zero and `dirty=1` for the new folder. The final run is against the committed, clean worktree. `git diff --check` also passes. No Lean process remains running.

Exact dependency-check output, using the supplied order and `--movable`:

```text
depcheck: 38 roadmaps, 388 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. WeightsInEtaleCohomology remains an earlier supplier; the order file was not edited.

## Draft pull request body

Build the low-degree algebraic K-theory of regular curves and its concrete Weierstrass interfaces, through localization at every closed point, coniveau and Adams weights, isogeny transfers and the K-groups of elliptic curves over finite fields. The arithmetic layers construct minimal regular models over S-integers, the model-independent integral part of K₂, and Bloch symbol classes with residue, transfer and descent formulas, so regulators can consume a single library of curve K-theory and integral classes.

AI assistance: Codex (GPT-6), including the port, source checks, signature comparison and computed mathematics audit recorded in this report.

## Suppliers still carried by new-roadmap pull requests

- ArithmeticGaloisDuality.
- ArithmeticKTheory.
- DeligneWeightsAndPurity.
- EtaleDualityAndPerverseSheaves.
- GeneralAlgebraicKTheory.
- K2SymbolsBrauer.
- K3BlochGroups.
- KTheoryFiniteLocalFields.
- KTheoryLowDegrees.
- MotivesAndAlgebraicCycles.
- MotivicEtaleKTheory.
- NeronModelsAndSemistableAbelianVarieties.
- RelativeJacobiansAndIntegralCurveModels.
- SchemeKTheoryOperations.
- SelmerIwasawaCohomology.
- StableHomotopyKTheory.
- WeightsInEtaleCohomology.

Roadmaps already on main, including StableReduction, SchemeAndStackFoundations, EnhancedDerivedSheaves, ModularCurves, JacobianChallenge and ProfiniteCohomology, are consumed from main. Their open revision/progress work is not a dependency.

## Port and mathematics changes

No statement moved from the accepted `Suggested.lean` to the README: the accepted file already has the required acceptance-test shape. No new headline can be stated on the additional K-theory/motivic carriers at the pins, so the docstring identifies those missing carriers without adding stand-ins.

The README retains the eight-layer development, exact hypotheses and locators, definition APIs, Checks, three worked examples and the divided Bloch-class normalization. API catalogues were rewritten as prose bullets, with no extra Lean declarations. The integral regular-curve motivic tower remains in §4.5, including its layers, convergence, Adams action and smooth comparison; the general supplied rational character is not reconstructed.

The upstream mathematics pass made these concrete fixes:

1. Replaced the four open-ended demands that other suppliers add prerequisites by owned targets: general noetherian Adams operations (§4.0a), field weight-one/model and continuity adapters (§4.0b), the supplied tower's Adams and finite-coefficient étale compatibility (§4.0c), and function-field Steinberg homology (§5.5). Their domains, maps, required laws, source locators and numerical negative controls are explicit. Section 4.0c precedes its curve and finite-field consumers, so there is no local forward dependency.
2. Distinguished the regular-curve integral tower from the rational character already supplied by MotivicEtaleKTheory §§2.2–2.3. Removed independent rational-projector and generalized-coefficient-weight proof requests; SchemeKTheoryOperations §6.9 supplies these with its endpoint and Bockstein hypotheses. The imperfect-field curve and square-zero scalar-extension Check remains.
3. Replaced the general divisor/Picard re-comparison by the Weierstrass and open-restriction compatibility square in §2.3. Imported the native degree/principal-divisor comparison. Removed redundant local aliases for supplied K₀ class formulas and K-theory functoriality; §2.6 reads the supplied square-zero product rather than requesting it again.
4. Imported K3BlochGroups §2.2's integral indecomposable/motivic edge. Section 4.6 retains the curve statement about base-field weight two and the shifted coniveau weights three and four.
5. Made the fibre assertion used in §§7.3 and 8.3 a named target, badFibreG1_rank in §6.10, over all number fields and residue characteristics. Its normalization/localization proof route and graph/Frobenius Checks give dimensions 1, 0, 0 for split multiplicative, non-split multiplicative and additive examples.
6. Defined the parameterized functions v_u, w_u and h_u used in §8.3, with u≠0,1,−1, nonzero rational-function denominators, their divisors and three discriminating Checks. Previously §8.1 supplied formulas only at u=4 while §8.3 invoked the family at u=1/3. The computed discriminants are 921600 and 1024/6561; the excluded parameters have discriminant zero.
7. Added the standing universe convention and explicit definition-API lists for the Euler characteristic, special first K-group, integral parts, tame values, candidates, certificates, zero cycles, models and Bloch classes. The seven Lean signatures retain their original generality.
8. Specified the branch incidence graph for bad fibres, with singular-point vertices as well as component vertices. At a type IV triple point it has E=3,V=4 and first Betti number zero; the pairwise-intersection triangle would incorrectly give one. This makes the additive-reduction proof route precise.
9. Replaced “four rational Frobenius eigenvalues” in the genus-two Check by a four-dimensional rational Tate module and four roots over an algebraic closure, counted with multiplicity. No rationality of individual Weil roots is asserted. Also made the degree-zero weight-one negative control explicitly an unshifted model.
10. Corrected the exact-couple supplier locator to StableHomotopyKTheory §§7.21–7.29, including §7.22. The model, tame-symbol, Frobenius and ICM normalizations remain unchanged.

## Ownership and citation resolution

The sweep used `roadmaps list`, object searches through `roadmaps grep`, and `roadmaps show` across every indexed open roadmap head and main, plus the board package files and the supplied sibling checkouts. The final citation run used the index of 2026-10-24T23:09:21Z, containing 342 open roadmap pull requests. It reports no unresolved cross-roadmap citation and no unresolved local Lean name. Its non-roadmap-name limitation was handled by searching the actual pinned source checkouts directly.

The retained new prerequisites have no owner with their full stated domain in the material inspected. SchemeKTheoryOperations §6.8 has its stated regular ample-family and quasi-projective scopes; the noetherian pullback extension in §4.0a extends that interface without duplicating it. The available SchemeKTheoryOperationsPartII design concerns formal-scheme supported K₀ and intersection degrees, rather than these higher ordinary-scheme operations. ArithmeticKTheory §3.2 owns the general Dedekind criterion and number-field Steinberg homology, not its function-field input. MotivicEtaleKTheory supplies rational cycle comparison; it explicitly excludes finite-coefficient étale descent. The retained regular-curve tower extends the smooth supplied tower integrally to regular curves over arbitrary fields. Those distinctions explain ownership here.

The supplier replacements and duplication removals are recorded only in the README's Scope and ownership section. They include the general divisor dictionary, rational projectors and coefficient decomposition, elliptic rank–Picard product, field indecomposable K₃ edge, and the rational regular-scheme cycle comparison. No declaration here has the fully qualified name of a declaration in another inspected roadmap. The three source-package and open-head findings about higher K-theory/finite-field ownership were checked as mathematical claims rather than adopted as instructions.

The five initial citation leads resolve as follows. In this table, gakt denotes the inspected `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md` head, sko the inspected `TauCetiRoadmap/SchemeKTheoryOperations/README.md` head, and native paths are relative to the pinned Tau Ceti repository.

| Lead | Resolution |
| --- | --- |
| KGroup.ofRing_colimit | gakt line 441, §3.2; a supplier target, not an alleged pinned implementation. |
| Scheme.K.pushforward_affine | sko line 536, §2.3; finite B perfect over A, with restriction-of-scalars comparison. |
| Scheme.cartan_isEquiv_of_regular | sko line 610, §2.6; regular noetherian scheme Cartan comparison. |
| RegularProperModel.genericFibreInclusion | Declared in `TauCetiRoadmap/EllipticKTheory/Suggested.lean`, with its actual marked source and target. |
| TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.GenusOne | This is the module `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/GenusOne.lean`, not a declaration. The README identifies it as a module and cites degreeOneEquivPicZero. |

## Pinned interfaces and mechanical signature check

Mathlib is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The manifest and toolchain were not changed. All six individual Tau Ceti imports exist and supply names used by the acceptance file: projective model, residue units, principal divisors, Frobenius trace, function-field instance and point/place identification. The only Mathlib import is `import Mathlib`.

A scratch file with `#check @name` for all 15 explicit declarations elaborated successfully. Each elaborated type was compared with the README, including the field and finite-field binders, ellipticity and i≥1, the actual regularity/flatness/properness fields, the over-F marking, NumberField and finite S, both minimality hypotheses, and the support/divisor/tame-value hypotheses of Bloch's correction. Zero binders were dropped; no signature repair was needed. The definitions deliberately have their wider domains: twistedFrobeniusKernel uses the nonsingular point group of any equation, and RegularProperModel bundles data over an arbitrary commutative base with a field algebra; arithmetic existence and terminality have their explicit number-field and ellipticity binders.

| Native object used | Pin evidence and boundary |
| --- | --- |
| Weierstrass projective scheme | `TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/ProjModel.lean`, lines 75, 80, 85: projModel, projModelOver, properness. `Integral.lean` line 60 does not require ellipticity; `Smooth.lean` line 176 does. |
| Geometric integrality | `Mathlib/AlgebraicGeometry/Geometrically/Integral.lean` line 40: geometric integrality of the morphism, meaning integral base changes to field-valued points. It is not a synonym for smoothness. |
| Function fields | `Mathlib/AlgebraicGeometry/FunctionField.lean` line 148, functionField_isFractionRing_of_isAffineOpen, with integral-scheme hypothesis. |
| Function-field predicate | `TauCeti/FieldTheory/FunctionField/Basic.lean` line 49: `∃ x : F, Transcendental k x ∧ FiniteDimensional k⟮x⟯ F`. It imposes neither perfect constants nor separable generation. |
| Place | `TauCeti/FieldTheory/FunctionField/Place/Basic.lean` line 100: a normalized surjective valuation trivial on constants. Finite residue degree is a theorem under IsFunctionField, rather than a field of the Place structure. |
| Residue unit | `TauCeti/FieldTheory/FunctionField/Place/Residue.lean` line 113: input f is a field unit and ord(f)=0; output is a residue-field unit. Zero denominators are excluded by these carriers. |
| General divisor comparison | `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/FunctionField.lean`, lines 74, 207, 336: actual reindexing, degree and principal-divisor identities, with proper/valuative and dimension hypotheses. |
| Picard equivalence | `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Picard.lean` line 253 and `Scheme/GenusOne.lean` line 83 onward: the noetherian, codimension-one DVR, dimension, properness, genus and constant-field hypotheses remain in the contracts. |
| Finite Frobenius | `Mathlib/FieldTheory/Finite/Basic.lean` line 333: frobeniusAlgHom over the finite base, hence q-power, rather than a merely p-power field map. |
| Marked-map uniqueness | `Mathlib/AlgebraicGeometry/Morphisms/Separated.lean` line 288: reduced source, dominant test map and separated target over the base. Flat models supply the dense generic fibre. |
| Dedekind flatness | `Mathlib/RingTheory/Flat/TorsionFree.lean` line 137: IsDedekindDomain.flat_iff_torsion_eq_bot; no replacement of a general DVR by ℤ_p occurs. |

## Source audit

Source identifiers below denote the legal copies identified by `packages/EllipticKTheory/sources.toml`; line numbers are those of their line-numbered extracted texts. New identifiers bgmn, kock-zanchetta, kahn-levine and quillen1974 denote the linked primary sources added to the README References, with the indicated retrieved-page line numbers. No source manifest was edited.

| Mathematical passage checked | Evidence read |
| --- | --- |
| Finite generation and its independent homology input | weibel line 19053 through line 19066; quillen1974 line 202 through line 215, printed p. 7. This distinguishes finite generation from finiteness and avoids using Harder to prove its own input. |
| Harder and geometric/integral/coefficient groups | weibel line 30619 through line 30640 and line 30690 through line 30727. The two odd summands, extra elliptic twist, and missing bar in the proof are separated. |
| Twisted cohomological descent | weibel line 30748 through line 30770, with twist at least two; the trivial untwisted rational H¹ counterexample is retained. |
| K₃ of ℚ | weibel line 28431 and line 29646: ℤ/48, distinguishing it from the indecomposable ℤ/24 quotient. |
| Integral regular-curve tower and Adams action | levine line 2644 through line 2671 and line 3399 through line 3455. The source is regular over a regular base of dimension at most one, not restricted to curves smooth over a perfect field. |
| Global surface resolution | stacks line 216035 through line 216066, Tag 0BGP: normalization finite, finite singular locus of the normalization and normal completions; not a claim that every unnormalized excellent surface already has isolated singularities. |
| Global contraction and factorization | stacks line 216220 through line 216246 and line 216434 through line 216459, Tags 0C5J and 0C2N. The target may be any noetherian base in the stated projective contraction theorem. |
| Minimal-model definitions and uniqueness | conrad line 274, line 342, line 362 through line 365 and line 536; the generic marking and the distinction between integral equation and regular minimal model remain explicit. |
| Parameterized symbol family and integrality obstruction | dgjk line 1396 through line 1429 and line 1464 through line 1482. The same functions are used at u=4 and u=1/3; the residue at the denominator prime is 1/w. |
| Nonconstant symbol | dgjk line 1472 through line 1478 and line 1494 through line 1521: the two specializations are 0 and {−1,1+u}. |
| General operation extension | bgmn line 61 through line 74, Theorem 1.1; kock-zanchetta line 579 through line 604, including its more restrictive comparison domain. No spectrum-level integral Adams operation is inferred. |
| Weight-one field complex | kahn-levine line 4110 through line 4182, Proposition 4.8.1 and its proof, printed p. 51. This replaces an inappropriate use of Levine Proposition 6.8, which concerns localization compatibility. |

Bloch's integral ICM convention and the divided quotient convention are retained exactly as accepted: C times the divided class is the image of the integral ICM construction, and the correcting symbol has the function in the first slot. The new local calculation gives 8·(1/8)=1, whereas reversing that slot gives 64. The accepted distinctions between rational integrality, actual residue values and norms, and generic versus vertical residues remain intact.

## Computed adversarial mathematics pass

The following table records the pass statement by statement, including conventions and definition APIs. Point enumeration, the finite and rational Weierstrass addition formulas, tame leading-unit arithmetic, discriminants and integer order formulas were also run in a scratch Python check using exact integer/fraction arithmetic. Other entries are explicit symbolic computations performed during the pass. These are falsification witnesses, not proofs of the admitted headline theorems. There are 224 rows, including the additional integral-tower and parameter-family rows.

| Statement | Instances tried | Computed values on the two routes | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: curves and all closed points | ℙ¹/ℚ, V(t²+1), infinity | Residue degrees 2,1; divisor degree 2−2=0; rational-point-only degree would be −2 | Agrees on these instances | Retained with these hypotheses |
| Conventions: regular versus smooth | F=𝔽₂(t), (y−x)²=t | Local regular model has one parameter; after adjoining √t, ε²=0 with ε≠0; smoothness fails | Agrees on these instances | Retained with these hypotheses |
| Conventions: Weierstrass origin | [X:Y:Z]=[0:1:0] | Cubic value 0; Y=1 and Z=0; affine Z-chart excludes exactly this point at infinity | Agrees on these instances | Retained with these hypotheses |
| Conventions: K/G and rank signs | 0→O(−x)→O→O_x→0 | [O_x]=1−[O(−x)]; rank 1−1=0, determinant degree +deg(x) | Agrees on these instances | Retained with these hypotheses |
| Conventions: tame orientation | u=2, π=t, characteristic zero | ∂{u,π}=2; ∂{π,u}=1/2; product=1 | Agrees on these instances | Retained with these hypotheses |
| Conventions: residue norm | quadratic residue x₀²+2x₀+4=0 | N(x₀)=4; N(1/x₀)=1/4, whereas 1/x₀ is not rational | Agrees on these instances | Retained with these hypotheses |
| Conventions: Frobenius/Tate twist | y²=x³−x over 𝔽₃ | Point count 4; a₃=0; det π=3, det arithmetic H¹=1/3, det geometric H¹=3, det H¹(2)=27 | Agrees on these instances | Retained with these hypotheses |
| Conventions: marked S-integers | S=∅ and S={2,3} over ℚ | Bases ℤ and ℤ[1/6]; restriction at an un-inverted prime is identity | Agrees on these instances | Retained with these hypotheses |
| Conventions: coefficients | K₂(𝔽₃;ℤ/2) | Integral K₂=0; coefficient K₂=K₁[2]=ℤ/2; quotient-only model gives 0 | Agrees on these instances | Retained with these hypotheses |
| Conventions: universes | one small scheme, finite two-chart cover | Two charts and both base rings remain in u; sheaf category lies in u+1; no extra points appear on enlarging universe | Agrees on these instances | Retained with these hypotheses |
| §1.1 EllipticScheme.charts | Z=1 and Y=1 on y²=x³−x | Z-chart relation y²−x³+x=0; origin lies in Y-chart with X=Z=0 | Agrees on these instances | Retained with these hypotheses |
| §1.1 EllipticScheme.cover | Y=Z=0 | Equation forces X³=0 and hence X=0 over any field; no projective point remains uncovered | Agrees on these instances | Retained with these hypotheses |
| §1.1 zeroSection_mem | O=[0:1:0] | Residue degree 1; Y-chart membership=1, Z-chart membership=0 | Agrees on these instances | Retained with these hypotheses |
| §1.1 ellipticity boundary | y²=x³ over 𝔽₅ | Six projective points versus five nonsingular group points; (0,0) has two zero partials | Agrees on these instances | Retained with these hypotheses |
| §1.2 geometricallyIntegral | y²=x³; extension to algebraic closure | Cusp coordinate ring is a domain of dimension 1; h⁰=1,h¹=1, χ=0; smoothness fails | Agrees on these instances | Retained with these hypotheses |
| §1.2 cubic cohomology and dimension | smooth cubic and cusp cubic | Degree 3 gives arithmetic genus (3−1)(3−2)/2=1 in both cases; h⁰−h¹=0 | Agrees on these instances | Retained with these hypotheses |
| §1.3 regularity/DVR adapter | smooth cubic versus cusp at origin | Smooth closed stalk dimension=embedding dimension=1; cusp values are 1 and 2, so the latter is excluded | Agrees on these instances | Retained with these hypotheses |
| §1.4 closedPointEquivPlace_compat | 36a1, y=3 and x²+2x+4=0 | Residue degree=2 and order(y−3)=1 on both sides; origin degree=1 | Agrees on these instances | Retained with these hypotheses |
| §1.5 pointsDivisor_compat | P=(2,1) on y²=x³−x over 𝔽₅ | 2P=(0,0), −P=(2,4); both point/class routes send P to P−O, not O−P | Agrees on these instances | Retained with these hypotheses |
| §1.6 isogeny degree diagram | id, [2] over ℚ | Generic degrees 1 and 4; geometric kernel sizes 1 and 4 | Agrees on these instances | Retained with these hypotheses |
| §1.6 separability/differential diagram | [2] over ℚ and Frobenius over 𝔽₂ | Differential scalars 2 and 0; separability respectively true and false | Agrees on these instances | Retained with these hypotheses |
| §1.6 kernel diagram | [2] on y²=x³−x over ℚ | Four rational kernel points O,(0,0),(1,0),(−1,0); scheme rank=4 | Agrees on these instances | Retained with these hypotheses |
| §1.6 divisor pullback diagram | t=s² on ℙ¹ | Pullback of [0] is 2[0]; e·f=2·1=2 equals generic degree | Agrees on these instances | Retained with these hypotheses |
| §1.6 zeroHom and its line pullback | constant map to O, identity map | Constant image is O and pulls O(O) to degree 0; identity pulls it to degree 1; only the constant has zero composite with each pointed map | Agrees on these instances | Retained with these hypotheses |
| §2.1 rankDet_natural | line bundle O(1), degree-two self-map of ℙ¹ | Pullback rank=1 and determinant degree=2; class coordinate (1,1) becomes (1,2) | Agrees on these instances | Retained with these hypotheses |
| §2.1 supplied skyscraper sign | V(t²+1) on ℙ¹ | Rank 0, determinant degree +2; inverse-line convention gives −2 and is rejected | Agrees on these instances | General class formulas are supplier inputs |
| §2.2 eulerChar definition | O(n) on ℙ¹, n=−1,0,1 | χ values 0,1,2 equal n+1; degree values −1,0,1 differ | Agrees on these instances | Retained with these hypotheses |
| §2.2 eulerChar_additive | 0→O(−1)→O→O_x→0, deg x=1 | χ(O)=1=χ(O(−1))+χ(O_x)=0+1 | Agrees on these instances | Retained with these hypotheses |
| §2.2 pushforwardToBase_eq_eulerChar | elliptic O and O(O) | Pushforward values 0 and 1 equal Euler values 1−1 and 1−0 | Agrees on these instances | Retained with these hypotheses |
| §2.2 exact-constant-field condition | ℙ¹_𝔽₄ viewed over 𝔽₂ | χ(O)=dim_𝔽₂ 𝔽₄=2; unrestricted 1−g gives 1 | Agrees on these instances | Retained with these hypotheses |
| §2.3 Weierstrass divisor/Picard compatibility | divisor O on E; affine line test | Positive point class degree=1; on 𝔸¹ principal [0] gives Pic=0; full ℙ¹ class has degree=1 | Agrees on these instances | General dictionary replaced by suppliers; retained chart diagram |
| §2.4 pointed Picard diagram | O(P), O(O) | Degree/point coordinates (1,P),(1,O); degree-zero difference has coordinate P | Agrees on these instances | Retained with these hypotheses |
| §2.4 degree-index boundary | real anisotropic conic | All closed degrees are 2; degree image=2ℤ, so a degree-one splitting has no input | Agrees on these instances | Retained with these hypotheses |
| §2.5 lineBundleDescent_injective | real elliptic two-torsion P=(0,0) | Class P−O has order 2 before and after complexification; zero class still maps to zero | Agrees on these instances | Retained with these hypotheses |
| §2.5 rational-point surjectivity | real conic versus pointed elliptic curve | Invariant geometric degree-one class: real conic image degrees 2ℤ excludes it; elliptic O(O) has degree 1 and descends | Agrees on these instances | Retained with these hypotheses |
| §2.6 supplied elliptic ring coordinates | r₁=2,d₁=3;r₂=4,d₂=5 | Product rank=8, degree=2·5+4·3=22; pure degree class (0,1) squares to (0,0) | Agrees on these instances | Retained with these hypotheses |
| §2.7 weierstrassCompatibility | E/𝔽₅ above, P=(2,1) | Point group order=8, K₀=ℤ²⊕ℤ/4⊕ℤ/2; skyscraper difference has P=(2,1), not (2,4) | Agrees on these instances | Retained with these hypotheses |
| §3.1 localization low-degree tail | ℙ¹_ℚ, t²+1 | Divisor coefficients +1,−2 with degrees 2,1; total 0; O maps to generic rank 1 | Agrees on these instances | Retained with these hypotheses |
| §3.1 all-point residue term | {t,t²+1} at quadratic point | Residue i, inverse residue −i, norms i·(−i)=1 in either convention; omission loses i≠1 | Agrees on these instances | Retained with these hypotheses |
| §3.2 curveBoundary_two_eq_tame | unit 2 and uniformiser t | Left boundary {2,t}=2, right boundary=1/2; kernels agree and orientations differ | Agrees on these instances | Retained with these hypotheses |
| §3.3 curveBoundary_one_eq_div | t²+1 and t⁻¹ on ℙ¹ | Boundary vectors (1,−2) and (−1,+1); total weighted degrees 0,0 | Agrees on these instances | Retained with these hypotheses |
| §3.3 curveTransfer_zero | rational and quadratic closed points | Skyscraper ranks 0,0; determinant degrees 1,2 | Agrees on these instances | Retained with these hypotheses |
| §3.3 curveGenericRank | O and O_x | Generic values 1 and 0; degree(det O)=0 cannot replace the surjective rank | Agrees on these instances | Retained with these hypotheses |
| §3.4 restriction | ℙ¹→𝔸¹→𝔾_m on div(t) | [0]−[∞]→[0]→0; Z=∅ gives the same original vector | Agrees on these instances | Retained with these hypotheses |
| §3.5 finite pullback | t=s², {2,t} | Residue 2 pulls back to 2²=4; e=2 and residue degree=1 give generic degree 2 | Agrees on these instances | Retained with these hypotheses |
| §3.6 finite transfer | quadratic field extension, constant 2 in K₁ | Restriction 2; norm 4=2²; identity extension gives norm 2 | Agrees on these instances | Retained with these hypotheses |
| §3.7 rational K₂ injection | ℙ¹_ℚ and infinity-supported {−1,−1} | Supported class order 2 and generic value 0; tensor ℚ sends both source class and kernel to 0 | Agrees on these instances | Retained with these hypotheses |
| §3.8 finite-field K₂ injection | ℙ¹_𝔽₂, quadratic point t²+t+1 | Residue θ has θ³=1 and θ≠1; K₂ of finite residue fields is 0, so preceding term is 0 | Agrees on these instances | Retained with these hypotheses |
| §4.0a noetherianAdams construction | ℙ¹ class z²=0 | ψ²z=2z; ψ³ψ²z=6z=ψ⁶z | Agrees on these instances | New explicit prerequisite |
| §4.0a pullback law | dual numbers over ℚ→ℚ | Unit 1+ε maps to 1; ψ² gives 1+2ε before reduction and 1 after reduction on both routes | Agrees on these instances | Retained with these hypotheses |
| §4.0a product and identity laws | z²=0; ψ¹ | ψ²(z²)=0=(2z)²; ψ¹z=z; ψ²ψ³z=6z | Agrees on these instances | Retained with these hypotheses |
| §4.0a normalization laws | rank-two vector space; unit 2 | ψ²[ℚ²]=2, ψ²[2]=[4]; zero operation gives 0 and fails rank | Agrees on these instances | Retained with these hypotheses |
| §4.0b fieldMotivicAdapters | F=ℚ | H¹ weight one has unit 2 of valuation 1; H⁰=H²=0; unshifted units would put 2 in H⁰ | Agrees on these instances | New explicit field-model adapter |
| §4.0b finite norm compatibility | 𝔽₂(t)/𝔽₂(t²) | N(t)=t² in base field; degree 2 norm of a base unit c is c² | Agrees on these instances | Retained with these hypotheses |
| §4.0b fieldMotivicContinuity | 𝔽₂(s,t) and finitely generated subfields | {s,t} is defined at stage 𝔽₂(s,t); dlog(s)∧dlog(t) has coefficient 1, not 0 | Agrees on these instances | Retained with these hypotheses |
| §4.0b coefficient triangle compatibility | n=0,p=2,ν=1,2 | Integral diagonal ℤ; coefficient diagonals ℤ/2,ℤ/4; reduction sends 1 to 1 | Agrees on these instances | Retained with these hypotheses |
| §4.1 curveK1Image | ℙ¹_F and affine line | Proper image F×; on 𝔾_m unit t has divisor 0 on the open but is not constant | Agrees on these instances | Retained with these hypotheses |
| §4.1 curveSK1 definition | ℙ¹_𝔽₃ and 𝔸¹_𝔽₃ | Kernel orders 2 and 1 respectively; proper chart-wise zero SK₁ does not imply proper zero | Agrees on these instances | Retained with these hypotheses |
| §4.1 range and cokernel | ℙ¹_𝔽₃ | Closed-point image has order 2; tame-symbol cokernel also order 2 via norm | Agrees on these instances | Retained with these hypotheses |
| §4.1 constant-unit splitting | ℙ¹_𝔽₃ | K₁ order 4 splits into constant order 2 and SK₁ order 2 | Agrees on these instances | Retained with these hypotheses |
| §4.1 norm law | quadratic point, unit i | π_*i_x*i=N(i)=i·(−i)=1 | Agrees on these instances | Retained with these hypotheses |
| §4.1 affine stable SK₁ comparison | 𝔽₃[t] | determinant kernel=0; generic-restriction kernel=0 | Agrees on these instances | Retained with these hypotheses |
| §4.2 basePoint_pushforward | π∘P= id on 𝔽₃ | Pushforward of −1 returns −1; composite is identity on the group of order 2 | Agrees on these instances | Retained with these hypotheses |
| §4.2 basePoint_split and V | ℙ¹_𝔽₃ | V=0; two summands each order 2 give total order 4 | Agrees on these instances | Retained with these hypotheses |
| §4.2 basePoint_pullback_zero | self-intersection at a rational point | λ₋₁(conormal)=1−1=0; a disjoint closed point gives empty fibre and value 0 | Agrees on these instances | Retained with these hypotheses |
| §4.3 curveConiveau | dimension 1 and dimension 0 | Column counts 2 and 1; all d_r with r≥2 have absent target; F²=0 | Agrees on these instances | Retained with these hypotheses |
| §4.3 filtration/cokernel law | K₃(ℙ¹_ℚ) | Left term ℤ/48, quotient ℤ/48, total order 2304=48² | Agrees on these instances | Retained with these hypotheses |
| §4.3 affine filtration | 𝔸¹_ℚ | F¹K₃=0; generic field summand remains ℤ/48 | Agrees on these instances | Retained with these hypotheses |
| §4.4 curveK3_extension | 37a1 and origin | Origin pushforward has order 48 and restricts generically to 0; kernel-only group misses at least 48 elements | Agrees on these instances | Retained with these hypotheses |
| §4.5 curveWeightFiltrationComparison on K₀ | ℙ¹ | ψ² on rank/degree is diag(1,2); z²=0; rank-zero eigenvalue 2 | Agrees on these instances | Retained with these hypotheses |
| §4.5 curveWeightFiltrationComparison on K₁ | ℙ¹, unit 2 over ℚ | Constant [2] maps to [4] (weight 1); infinity-supported [2] maps to 4[2] (weight 2) | Agrees on these instances | Retained with these hypotheses |
| §4.5 regular base-change boundary | 𝔽₂(t), (y−x)²=t | After √t extension ε²=0, ε≠0; regular comparison unavailable, while rank and unit pullback still exist | Agrees on these instances | Retained with these hypotheses |
| §4.5 supplied generalized weights | 0→ℤ/5→ℤ/25→ℤ/5→0, ψ=12 | Endpoint scalar 2; middle ψ−2=10≠0, (ψ−2)²=100=0 modulo25 | Agrees on these instances | Kept as supplier input, no duplicate decomposition target |
| §4.5 rational projector denominators | ℙ², z³=0 | Weight-one vector z+z²/2; integral vector 2z+z² gives lattice index 2 | Agrees on these instances | Retained with these hypotheses |
| §4.6 supplied field K₃ edge | ℚ and ℚ(i) | Rational indecomposable dimensions 0 and 1, agreeing with r₂=0,1 | Agrees on these instances | Integral field edge imported from K3BlochGroups §2.2 |
| §4.6 K3_curve_weights | infinity pushforward of residue weights 2,3 | Gysin adds 1; image weights 3,4; weight 2 contribution from F¹ is 0 | Agrees on these instances | Retained with these hypotheses |
| §4.0c motivicTowerComparison Adams layers | rank and divisor on ℙ¹ | ψ² eigenvalues 1 and 2; cycle coefficients +1,+1 | Agrees on these instances | New tower compatibility target; rational character imported |
| §4.0c finite coefficient comparison | Spec 𝔽₃,m=2 | K₂/m=0 but K₂(;ℤ/2)=ℤ/2; coefficient edge retains its nonzero order-two class | Agrees on these instances | Retained with these hypotheses |
| §4.0c Bockstein and divisible colimit | ℙ¹_𝔽̄₂,ℓ=3; m=1 | Degree-two divisible group has two ℚ₃/ℤ₃ summands; arithmetic K₁(ℙ¹_𝔽₂)=0; m=1 group=0 | Agrees on these instances | Retained with these hypotheses |
| §5.1 pullback/composition specialization | id and generic point | id gives identity; O_X restricts to rank 1, and O_x to rank 0 at the generic point | Agrees on these instances | Retained with these hypotheses |
| §5.1 KPushforward_eq_transfer | finite quadratic field extension | Norm of constant 2 is 4=2²; restriction sends2 to2 | Agrees on these instances | Retained with these hypotheses |
| §5.1 isogeny_finiteFlat | [2] over ℚ and zero map | [2] rank 4 and fibre length4; zero map has one-dimensional fibre and no finite rank | Agrees on these instances | Retained with these hypotheses |
| §5.1 structure pushforward | ℙ¹ O(−1), elliptic O(O) | Values0 and 1 agree with Euler values 0 and 1 | Agrees on these instances | Retained with these hypotheses |
| §5.2 isogeny_pushPull | [3] and separable degree 2 map | Unit classes become (9,0,O) and (2,0,P_f), P_f≠O; degree alone fails for the latter | Agrees on these instances | Retained with these hypotheses |
| §5.3 pushforwardStructureSheaf_class | isogeny degree d=2 | rank 2; degree χ(f_*O)−2χ(O)=0−0=0 | Agrees on these instances | Retained with these hypotheses |
| §5.3 isogeny_rankDet_action | d=2, input (r,e,P)=(1,1,O) | Output (2,2,P_f); evaluation at unit (1,0,O) gives (2,0,P_f) | Agrees on these instances | Retained with these hypotheses |
| §5.3 separable determinant law | degree 2 étale map | L_f²=O gives 2P_f=O; P_f can be nonzero | Agrees on these instances | Retained with these hypotheses |
| §5.3 odd multiplication determinant | [3] | L is killed by 2 and 3; gcd(2,3)=1 gives L=O; push-pull=9 | Agrees on these instances | Retained with these hypotheses |
| §5.3 degree-two nontrivial determinant | ℚ, trace decomposition | h⁰(f_*O)=1 and h⁰(O)=1 give h⁰(L)=0; trivial line has h⁰=1, so L is nontrivial | Agrees on these instances | Retained with these hypotheses |
| §5.4 supplied projective-line basis | O,O(−1),O_infinity | (a,b)=(1,0),(0,1),(1,−1); rank-degree=(1,0),(1,−1),(0,1) | Agrees on these instances | General bundle and basis theorems stay with suppliers |
| §5.4 projectiveLine_finiteField | q=2,i=1,2 | K₁=0,K₂=0,K₃=(ℤ/3)²; orders 1,1,9 | Agrees on these instances | Retained with these hypotheses |
| §5.4 elliptic_K0_generated_iff | two curves over 𝔽₂ | Point groups orders 5 and 1; proposed two generators omit ℤ/5 in first and generate ℤ² in second | Agrees on these instances | Retained with these hypotheses |
| §5.5 closedPoints_coprimeDegrees | ℙ¹ over 𝔽₂ | Closed counts degree 2=(4−2)/2=1, degree 3=(8−2)/3=2; gcd(2,3)=1 | Agrees on these instances | Retained with these hypotheses |
| §5.5 degreeOneZeroCycle definition | degrees2,3 | Cycle [x₃]−[x₂] has degree 3−2=1; zero cycle has degree 0 and is rejected | Agrees on these instances | Retained with these hypotheses |
| §5.5 zeroCycle_splitting | same cycle on K₀(𝔽₂)=ℤ | Weighted res/norm composite=3−2=1; single degree 2 point gives 2 | Agrees on these instances | Retained with these hypotheses |
| §5.5 zeroCycle_SK1_section | q=3, base unit−1 | Composite exponent3−2=1, so −1 returns −1 | Agrees on these instances | Retained with these hypotheses |
| §5.5 BMS_functionField | 𝔽₃[t] and 𝔽₃[t,t⁻¹] | Stable SK₁=0 for both; K₁ units are ℤ/2 and ℤ/2⊕ℤ | Agrees on these instances | Retained with these hypotheses |
| §5.5 functionFieldSteinbergHomology rank1 | 𝔽₂[t],𝔽₃[t],𝔽₂[t,t⁻¹] | H₀=ℤ in all; H₁=0,ℤ/2,ℤ respectively | Agrees on these instances | New owned input; finite generation, not finiteness for all affine curves |
| §5.5 curveFiniteGeneration | 𝔽₃[t,t⁻¹] | K₁=ℤ/2⊕ℤ has one infinite generator; finitely generated but not finite | Agrees on these instances | Retained with these hypotheses |
| §5.5 reciprocitySequence_exact | q=3, closed degrees2,3 | gcd(3²−1,3³−1)=gcd(8,26)=2=q−1; norm cokernel order 2 | Agrees on these instances | Retained with these hypotheses |
| §5.5 tameKernel_finite | ℙ¹_𝔽₂ and elliptic a=−2 | K₂ orders 1 and 13; both prime to2, multiplication by 2 bijective | Agrees on these instances | Retained with these hypotheses |
| §5.6 constantFieldReduction | ℙ¹_𝔽₄ over 𝔽₂ | Exact constants have cardinal4; K₁=(ℤ/3)² order 9, not1 | Agrees on these instances | Retained with these hypotheses |
| §5.6 disconnected decomposition | ℙ¹_𝔽₂ disjoint union ℙ¹_𝔽₄ | K₁ orders 1·9=9; zero first factor does not erase second | Agrees on these instances | Retained with these hypotheses |
| §5.6 harder | ℙ¹ over 𝔽₂, n=1,2,3 | K-group orders 1,1,9 prime to2; n=0 has ℤ² and is excluded | Agrees on these instances | Retained with these hypotheses |
| §5.6 properness boundary | 𝔾_m/𝔽₂ | K₁=ℤ infinite, versus K₁(ℙ¹)=0 | Agrees on these instances | Retained with these hypotheses |
| §5.7 curveEInvariant | ℙ¹_𝔽₃, unit−1 | e(π*−1)=−1; zero retraction gives 1 and fails | Agrees on these instances | Retained with these hypotheses |
| §5.7 curveCoefficientEdge and splitting | ℙ¹_𝔽̄₃,ℓ=2, order 4 class | edge∘section sends1/4 to1/4; arithmetic Frobenius sends both paths to3/4 | Agrees on these instances | Retained with these hypotheses |
| §5.7 curveEInvariant_naturality | 𝔽₃→𝔽₉, unit−1 | Restriction−1; norm(−1)=(−1)^4=1=(−1)^2, agreeing with degree 2 | Agrees on these instances | Retained with these hypotheses |
| §5.7 geometricK_galoisModule odd | geometric ℙ¹, i=1 | Two root-of-unity summands; over q=3 Frobenius sends1/4 to3/4 in each | Agrees on these instances | Retained with these hypotheses |
| §5.7 geometricK_galoisModule even | elliptic E, i=1 and 2 | Integral torsion twists1 and 2; coefficient degree 1 twist0 and degree 3 twist1; difference exactly1 | Agrees on these instances | Retained with these hypotheses |
| §5.8 cohomologyDescent | E/𝔽₃, a=0,j=2 | Tate det3, H¹ det1/3, twisted H¹ det27; eigenvalue absolute values 3^(3/2)>1 | Agrees on these instances | Retained with these hypotheses |
| §5.8 j=0 negative control | Spec 𝔽_q,ℚ_ℓ trivial action | H¹=ℚ_ℓ, while geometric H¹=0; j≥2 excludes this false invariants claim | Agrees on these instances | Retained with these hypotheses |
| §5.8 invertible Kummer coefficient | ℙ¹_𝔽̄₂, n=2,3 | H²(μ₂)=0 versus ℤ/2≠0; H²(μ₃)=ℤ/3 | Agrees on these instances | Retained with these hypotheses |
| §5.8 procyclic coefficients | trivial discrete ℤ,ℤ/3 and compact ℤ_ℓ | Continuous H¹ values 0,ℤ/3,ℤ_ℓ; coinvariantsℤ,ℤ/3,ℤ_ℓ; only first disagrees | Agrees on these instances | Retained with these hypotheses |
| §5.8 genus boundary | ℙ¹ and genus2 Jacobian | Geometric H¹ ranks0 and 4; determinant on rank 0 is 1, with no eigenvalue1 present | Agrees on these instances | Retained with these hypotheses |
| §5.9 positiveK_descent | n=1,q=3 | Two invariant geometric root groups each have order 2; arithmetic K₁ order 4 | Agrees on these instances | Retained with these hypotheses |
| §5.9 constant-field base change | q=3,r=2, root of order 8 | Arithmetic generator exponent3 becomes 9≡1 mod8 after base change; fixed subgroup changes accordingly | Agrees on these instances | Retained with these hypotheses |
| §5.10 twistedFrobeniusKernel definition | rational order 2 point over 𝔽₃ | q−1=2 kills it, gcd(2,3)=1; P belongs to B₁ | Agrees on these instances | Retained with these hypotheses |
| §5.10 zero,addition,negation API | annihilators2,3 over characteristic5 | Product annihilator6, gcd(6,5)=1; zero annihilator1; negation keeps2 or3 | Agrees on these instances | Retained with these hypotheses |
| §5.10 base-change membership iff | rational order 2 point over 𝔽₃, i=0,1 | q^0−1=0 and q−1=2 both annihilate it; both routes yield membership | Agrees on these instances | Retained with these hypotheses |
| §5.10 field-map transport | identity map on E/𝔽₃ | Point(0,0) maps to itself and satisfies3P=P; inverse identity composite is P | Agrees on these instances | Retained with these hypotheses |
| §5.10 characteristic-torsion exclusion | ordinary E/𝔽₂, P=(0,1) | 2P=0 with P≠0; every odd annihilator acts as identity on P, so P∉B₀ | Agrees on these instances | Retained with these hypotheses |
| §5.11 finiteFieldK_odd | q=2,3,i=1,2 | Orders(q^i−1)² are1,9 and 4,64 respectively | Agrees on these instances | Retained with these hypotheses |
| §5.11 finiteFieldK_even/cokernel | q=2,a=−2,i=1 | det(1−2π)=13; rational-lattice kernel0 but torsion kernel/cokernel order 13 | Agrees on these instances | Retained with these hypotheses |
| §5.11 card_twistedFrobeniusKernel | (q,a,i)=(2,−2,1),(2,−2,2),(2,2,1),(2,2,2),(3,0,1) | D_i values 13,41,5,25,28; each D_i≡1 mod p | Agrees on these instances | Retained with these hypotheses |
| §5.11 i=0 negative control | ordinary E/𝔽₂ of order 4 | D₀=#E=4 but prime-to2 B₀ order 1; assumption i≥1 retained | Agrees on these instances | Retained with these hypotheses |
| §5.11 invariant-factor boundary | group order 25 | ℤ/25 and(ℤ/5)² both order 25; order formula alone cannot choose them | Agrees on these instances | Retained with these hypotheses |
| §6.1 RegularProperModel definition | 37a1 over ℤ and over ℤ[1/37] | Δ=37; total-space singular candidate F(5,18)=222=6·37, not0 mod37²; after inversion Δ is a unit | Agrees on these instances | Retained with these hypotheses |
| §6.1 generic marking law | s↦s+1 on ℚ(s) | Image of s is s+1≠s, so absolute isomorphism fails over-base triangle; identity gives s=s | Agrees on these instances | Retained with these hypotheses |
| §6.1 fibre multiplicity API | base uniformiser at multiplicity m=2 | ord_C(π)=2 equals fibre generic length2; reduced model with multiplicity1 would give1 | Agrees on these instances | Retained with these hypotheses |
| §6.1 weierstrassModel_regular_iff | 37a1 type I₁ versus11a1 type I₅ | F(5,18)=222≢0 mod37²; F_11a1(5,5)=0 with both derivatives divisible11; fibres have1 versus5 geometric components | Agrees on these instances | Retained with these hypotheses |
| §6.1 rescaling boundary | y²=x³−81x at 3 | F and both linear terms vanish in(3,x,y)²; good generic curve does not make this equation regular | Agrees on these instances | Retained with these hypotheses |
| §6.1 Néron boundary | 37a1 at 37 | Smooth locus is nonsplit torus with point countq+1=38, while proper nodal curve adds1 point; Néron model not proper | Agrees on these instances | Retained with these hypotheses |
| §6.2 excellentSurfaceResolution | Spec ℤ[t] and xy=z² | Regular example identity; node vertex dimension 2, embedding dimension 3; singularity must change | Agrees on these instances | Retained with these hypotheses |
| §6.2 weierstrassModel_resolution | 37a1 and 11a1 | First identity over 37, second changes fibre 11; unit-discriminant locus unchanged in both | Agrees on these instances | Retained with these hypotheses |
| §6.3 genericFibreInclusion | identity marking and composable base maps | i_M followed by base map equals fixed C→Spec F→Spec O; both send each base scalar a to a | Agrees on these instances | Retained with these hypotheses |
| §6.3 Hom definition and Hom.ext | 37a1 generic P=(0,0) | Identity givesP=(0,0); involution gives(0,−1), so Hom.generic rejects it | Agrees on these instances | Retained with these hypotheses |
| §6.3 identity/composition category laws | identity model maps | id∘id= id; unique marked endomorphism count 1 | Agrees on these instances | Retained with these hypotheses |
| §6.3 Hom.subsingleton | two putative maps agreeing on generic fibre | At each generic rational function their values agree; equal marked maps count≤1; model identity exists and gives count 1 | Agrees on these instances | Retained with these hypotheses |
| §6.3 IsMinimal definition | minimal M and blow-up at a fibre point | M identity outgoing map is isomorphism; blow-down has exceptional ℙ¹ and fibre dimension 1, so blown-up model fails | Agrees on these instances | Retained with these hypotheses |
| §6.3 local adapters | localizing at v then taking generic fibre | Both generic fields equal F and marked generic map= id; local fibre at v unchanged, all other inverted fibres disappear | Agrees on these instances | Retained with these hypotheses |
| §6.4 regularModels_linked | M and Bl_P(M) | Common modelBl_P(M); maps are blow-down andid, with generic degrees1,1 | Agrees on these instances | Retained with these hypotheses |
| §6.5 globalExceptionalContraction | blow-up of(2,t) on Spec ℤ[t] | Exceptional normal bundle degree −1; contraction recovers embedding dimension 2 at(2,t) | Agrees on these instances | Retained with these hypotheses |
| §6.5 exists_locallyMinimal | smooth model and its one-point blow-up | Exceptional component counts0 and 1; one contraction changes1→0 | Agrees on these instances | Retained with these hypotheses |
| §6.5 normal-bundle exclusion | whole smooth fibre | Normal line degree 0 differs from exceptional degree −1, so fibre is not contracted | Agrees on these instances | Retained with these hypotheses |
| §6.6 globalBlowdownFactorisation | blow-down b and constant map on exceptional curve | Exceptional image has1 point; factor map on base is identityentity; composition givesb again | Agrees on these instances | Retained with these hypotheses |
| §6.6 locallyMinimal_terminal | X=M and X=Bl_P(M) | Marked morphism counts1 and 1, realized byidentity andblow-down | Agrees on these instances | Retained with these hypotheses |
| §6.6 minimality_local_criterion | smooth/nodal37a1 and point blow-up | Minimality/local criterion/terminality truth values(1,1,1) for M and(0,0,0) for blow-up | Agrees on these instances | Retained with these hypotheses |
| §6.6 exists_minimalRegularProperModel | 37a1, S=∅ and{37} | Marked regular minimal models have genus1 generic fibre and 0 exceptional curves over both bases | Agrees on these instances | Retained with these hypotheses |
| §6.7 minimal_unique | same model with fixed marking | Exactly1 marked isomorphism= id; involution sends(0,0)→(0,−1) and is excluded | Agrees on these instances | Retained with these hypotheses |
| §6.7 minimal_localisation | S=∅,S′={37}, and S′=S | 37-fibre removed and all retained local models unchanged; equality of prime sets givesid | Agrees on these instances | Retained with these hypotheses |
| §6.8 integralPart/integralPartS definitions | zero class and S=∅ | Both images contain0; S=∅ gives the same image, not a larger kernel-defined space | Agrees on these instances | Retained with these hypotheses |
| §6.8 finite_S_exhaustion | class descending to model[1/6] | Finite support S={2,3}; zero class already at ∅; no infinite-prime input required | Agrees on these instances | Retained with these hypotheses |
| §6.8 inclusion and monotonicity | S=∅⊂{2} for 37a1 | Images equal rationally and integrally here, since good fibre K₁ over 𝔽₂ is 0 | Agrees on these instances | Retained with these hypotheses |
| §6.8 horizontal unramified image | constant symbols{−1,3} | All horizontal orders 0 give tame 1; rational constant K₂ class 0 belongs to integral image | Agrees on these instances | Retained with these hypotheses |
| §6.8 integralPart_model_independent | M and blow-up M′ | Generic restriction of π* is identity; j*π_*a=j′*a, so two image inclusions are equal, each containing 0 | Agrees on these instances | Retained with these hypotheses |
| §6.9 goodPrime_no_condition | good fibres over 𝔽₂,𝔽₃ | K₁ orders(q−1)²=1,4; rational cokernel0 in both; integral surjectivity immediate only in first | Agrees on these instances | Retained with these hypotheses |
| §6.10 badFibreG1_rank | split I₁,nonsplit I₁,type II | Graph H₁ dimensions 1,1,0; Frobenius+1,−1,empty; invariant dimensions 1,0,0 | Agrees on these instances | Added exact named fibre theorem used downstream |
| §6.10 integralPart_iff_vertical | {−1,3}, multiplicity m=1,2 | Vertical residues −1,+1, both tensor to0; literal unit value 1 is stronger than rational integrality | Agrees on these instances | Retained with these hypotheses |
| §6.10 vertical obstruction | u=1/3,ord(v)=1,ord(w)=0 | Residue1/w; divisor[∞]−[0] has coefficients +1,−1; m-th power nonzero for everym≠0 | Agrees on these instances | Retained with these hypotheses |
| §7.1 tameValue definition | f=2t²,g=3t³ | order quotient2·3−3·2=0; tame=8/9 | Agrees on these instances | Retained with these hypotheses |
| §7.1 leading-unit/uniformiser law | replace t by 5t | (2/25)³/(3/125)²=8/9=8/9 | Agrees on these instances | Retained with these hypotheses |
| §7.1 zero-order law | unit residues 2,3 | 2⁰/3⁰=1; unit f=g=1 gives 1 | Agrees on these instances | Retained with these hypotheses |
| §7.1 multiplicativity | units2,3 and uniformiser t | tame{6,t}=6=2·3; second-variable exponent2 gives tame{2,t²}=4 | Agrees on these instances | Retained with these hypotheses |
| §7.1 swap law | {2,t},{t,2} | 2 and 1/2 multiply to1 | Agrees on these instances | Retained with these hypotheses |
| §7.1 diagonal sign | f=t and f=t² | tame{f,f}=−1,+1; both become1 in residue characteristic2 | Agrees on these instances | Retained with these hypotheses |
| §7.1 Steinberg law | {t,1−t} at 0,1,infinity | Tame values 1,1,(−1)(−1)=1; f=0,1 excluded by unit inputs | Agrees on these instances | Retained with these hypotheses |
| §7.1 SymbolCandidate definition | empty sum and Steinberg singleton | Empty coefficients all 0; singleton coefficient 1≠0 but K₂ image0 | Agrees on these instances | Retained with these hypotheses |
| §7.1 SymbolCandidate.tame | coefficients 1,−1 with local values 2,3 | Value2/3; equal symbols cancel coefficients 1−1=0 and give1 | Agrees on these instances | Retained with these hypotheses |
| §7.1 SymbolCandidate.toK2 comparison | Steinberg singleton | K₂ image0; every tame value 1 equals boundary of0 | Agrees on these instances | Retained with these hypotheses |
| §7.2 SymbolCertificate definition | zero and singleton{2,t} | Empty support proves0; singleton residue2≠1 at 0 forbids a certificate | Agrees on these instances | Retained with these hypotheses |
| §7.2 tame_eq_one_everywhere | 11a3 corrected candidate | Local vectors(−1,−1,1,1)·(−1,−1,1,1)=(1,1,1,1) | Agrees on these instances | Retained with these hypotheses |
| §7.2 nonempty_iff | same corrected and uncorrected candidates | Corrected all 4 values 1 gives witness; uncorrected two values −1≠1 give no witness | Agrees on these instances | Retained with these hypotheses |
| §7.2 sound | corrected11a3 candidate | Generic boundary vector(1,1,1,1) is zero in additive group notation; hence class belongs to localization image | Agrees on these instances | Retained with these hypotheses |
| §7.2 residue-not-norm condition | 36a1,{x−1,−1} at x=1 | Residue−1≠1 in quadratic field; norm(−1)=+1; norm-only witness would be false | Agrees on these instances | Retained with these hypotheses |
| §7.3 IntegralCertificate definition | 11a3,S′={11} | x,y vertical orders 0,0; every component tame 1; smoothness fails at 11 so empty prime set is rejected | Agrees on these instances | Retained with these hypotheses |
| §7.3 enlargement/forgetting API | add one good prime to S′ | New orders 0,0 and tame 1; horizontal tuple stays(1,1,1,1) | Agrees on these instances | Retained with these hypotheses |
| §7.3 IntegralCertificate.sound | constant units c,d | Horizontal orders 0,0 and vertical orders 0,0 give1 everywhere; rational class 0 is integral | Agrees on these instances | Retained with these hypotheses |
| §7.4 tame_last_point | 11a3 last pointO | Other 3 corrected residues 1; total norm  product 1 forces last degree-one value 1 | Agrees on these instances | Retained with these hypotheses |
| §7.4 last higher-degree norm only | 36a1 degree 2 place | Only value −1, norm(−1)=1; assertion value 1 would be false | Agrees on these instances | Retained with these hypotheses |
| §7.4 inseparable norm multiplicity | 𝔽₂(s),{s,t²−s} | Values s,s⁻²; norms s²,s⁻² multiply1; unweighted product s⁻¹≠1 | Agrees on these instances | Retained with these hypotheses |
| §7.5 blochRho/divisor law | C=2, y²=x³−x | div(1/y)=3O−P₀−P₁−P₋₁; coefficients sum 3−1−1−1=0 and point sum O | Agrees on these instances | Retained with these hypotheses |
| §7.5 constant-choice and base-change API | ρ→cρ, c≠0 | div(cρ)−div(ρ)=0; after extension, difference 0; C=1 prescribed divisor 0 | Agrees on these instances | Retained with these hypotheses |
| §7.5 torsionFunction_divisor_compat | P₀=(0,0),C=2 | div(x)=2P₀−2O; P₀−O is not principal because P₀≠O | Agrees on these instances | Retained with these hypotheses |
| §7.5 characteristic restriction | ordinary E/𝔽₂,C=2 | Geometric 2-torsion has 2 points,sum P≠O; full prime-to-p two-torsion has 4 points,sum O | Agrees on these instances | Retained with these hypotheses |
| §7.6 blochCorrection | C=3,c=2 at P and O | At P: 8·1/8=1; wrong correction order 8·8=64; at O reciprocity gives 1 | Agrees on these instances | Retained with these hypotheses |
| §7.6 trivial subgroup | T={O},S=∅,C=1 | A degree-zero divisor supported only at O has coefficient 0; f,g constant; tame 1 | Agrees on these instances | Retained with these hypotheses |
| §7.6 11a3 correction | C=5,local values −1,−1,1,1 | (−1)^5·(−1)^−5=1 twice; remaining values 1; origin value 1 | Agrees on these instances | Retained with these hypotheses |
| §7.7 tame kernel and Q_E | constant {s,t} over ℚ(s,t) | t-residue s has infinite order before Q_E, then quotient value 0; constants lie in the tame kernel of E | Agrees on these instances | Retained with these hypotheses |
| §7.7 blochClassLift definition | formal A=3[s]+[t],C=3 | A/3 coefficients 1,1/3;3(A/3)=A has coefficients 3,1 | Agrees on these instances | Retained with these hypotheses |
| §7.7 blochClass quotient | two lifts differ by constant {s,t} | Difference is generally nonzero before Q_E and 0 after Q_E; lift is not canonical | Agrees on these instances | Retained with these hypotheses |
| §7.7 wellDefined/change_correction | correction difference {h,ζ},ζⁿ=1 | n{h,ζ}={h,1}=0; difference killed by the torsion quotient | Agrees on these instances | Retained with these hypotheses |
| §7.7 change_function | ρ→cρ | Raw difference C{c,f_a}; after correcting its divisor and quotienting constants/torsion the value is 0 | Agrees on these instances | Retained with these hypotheses |
| §7.7 blochClass_eq_Bloch | C=3 formal correction A | C·(A/C)=A, not 3A; opposite-entry correction has local value 8 instead of 1/8 | Agrees on these instances | Retained with these hypotheses |
| §7.7 C=2 obstruction | a=(0,0),ρ=1/y,f_a=x | Raw tame vector (−1,1,−1,1); obstruction(1,0)⊗(−1); doubling quartic values at ±1 are 4,4 | Agrees on these instances | Retained with these hypotheses |
| §7.7 corrected C=2 lift | 2{1/y,x}+{x,−1}+{x+1,−1} | Raw values squared all 1; correction powers (−1)^±2=1; lift=A/2 in tame kernel tensor | Agrees on these instances | Retained with these hypotheses |
| §7.7 empty class family | C=1 | E[1]={O}; nonzero index set empty; count 0; divisor0; denominator 1 | Agrees on these instances | Retained with these hypotheses |
| §7.7 three-point relation | torsion difference orders 2,3,6 | lcm 6; ratios 3,2,1 have gcd 1; relation module has rank at most 1 | Agrees on these instances | Retained with these hypotheses |
| §7.8 transfer_tame | E:y²=x³−2x,L=ℚ(√2) | Norm β={x²−2,y}; quadratic residue product (1/4)(2x₀)=x₀/2=1/x₀ | Agrees on these instances | Retained with these hypotheses |
| §7.8 projection formula and res/norm | quadratic extension,constant 2 | res2=2,N2=4=2²; resNβ=β+σβ; identity extension gives β | Agrees on these instances | Retained with these hypotheses |
| §7.9 galoisDescent | quadratic G={1,σ} | Nres=2;resN=1+σ; on invariants rational inverse N/2 gives identity | Agrees on these instances | Retained with these hypotheses |
| §7.9 integral boundary | a={−1,−1},order 2 | Nres(a)=2a=0; no integral injectivity follows | Agrees on these instances | Retained with these hypotheses |
| §7.9 quotient descent | G=1 and constant difference {s,t} | Both quotient lifts differ by 0; actual difference has nonzero t-residue s; quotient and lift are distinct | Agrees on these instances | Retained with these hypotheses |
| §7.9 descent versus integrality | u=1/3 over ℚ | G-invariant by definition over ℚ; vertical residue 1/w has divisor [∞]−[0]≠0 | Agrees on these instances | Retained with these hypotheses |
| §8.1 equation and torsion | E₄, points(4,20),(−4,12) | Equation differences 0,0; both double to (0,0),which doubles to O; orders 4,4 | Agrees on these instances | Retained with these hypotheses |
| §8.1 discriminant normalization | u=4 | 16·4⁴·15²=921600; fourth power would give 207360000 | Agrees on these instances | Retained with these hypotheses |
| §8.1 v divisor | points −16,0,−1,O | orders +1,−1,−1,+1; weighted degree 0 | Agrees on these instances | Retained with these hypotheses |
| §8.1 w divisor | zeros(−4,−12),(4,20); poles(−4,12),(4,−20) | orders +1,+1,−1,−1; numerator intersection factor (x+1)(16−x²); x=−1 cancels | Agrees on these instances | Retained with these hypotheses |
| §8.1 h divisor | (−1,0),(4,−20),(−4,−12),O | orders +1,+1,−1,−1; total 0 | Agrees on these instances | Retained with these hypotheses |
| §8.1 example_certificate_E4 | ordered 8-point support | Each symbol tame vector (−1,1,−1,1,1,−1,1,−1); coordinate products all 1 | Agrees on these instances | Retained with these hypotheses |
| §8.1 example_E4_not_constant | P=(0,0),Q=(−16,0) | h(P)=1,h(Q)=5; specializations 0,{−1,5}; tame at 5=−1≠1 | Agrees on these instances | Retained with these hypotheses |
| §8.2 example_degree_two_residue | {y−3,x} on 36a1 | Five values 1/2,1/x₀,−2,−4,1; quadratic norm 1/4; product 1 | Agrees on these instances | Retained with these hypotheses |
| §8.2 raw product negative control | x₀=−1+√−3 | Raw product 4/x₀=−1−√−3≠1; norm product 1 | Agrees on these instances | Retained with these hypotheses |
| §8.3 example_bad_fibre(a) | 11a3,prime 11 | Fibre I₁,Δ=−11,ord_Dx=ord_Dy=0;vertical tame 1;S′={11} | Agrees on these instances | Retained with these hypotheses |
| §8.3 example_bad_fibre(b) | u=1/3,V=0 component | 4vw=−3(v²−1)(w²−1);ordv=1,ordw=0;residue w⁻¹ with infinite divisor [∞]−[0] | Agrees on these instances | Retained with these hypotheses |
| §8.3 every nonzero multiple | m=−1,1,2 | Residue divisors −([∞]−[0]),[∞]−[0],2([∞]−[0]),all nonzero; m=0 gives 0 | Agrees on these instances | Retained with these hypotheses |
| §8.3 integrality positive example | u=4 | 4u=16 integral; the source gives integrality of 2α; u=1/3 gives 4u=4/3,excludes the condition | Agrees on these instances | Retained with these hypotheses |
| §4.5 regularCurveMotivicTower definition | X=ℙ¹ and X=Spec(𝔽₂(t)[x,y]/((y−x)²−t)) | Both products with Δ^m remain regular; after √t scalar extension the second has ε²=0 and is excluded from the regular comparison | Agrees on these instances | Retained with these hypotheses |
| §4.5 regularCurveMotivicTower_layers | ℙ¹ weight zero and weight one | Layer cycle values of O and O_point are +1 in weights 0 and 1; reversed divisor gives −1 | Agrees on these instances | Retained with these hypotheses |
| §4.5 regularCurveMotivicTower_converges | K₀(ℙ¹) | Two surviving integral pieces ℤ,ℤ give K₀=ℤ²; no additional filtration term at weight 2 | Agrees on these instances | Retained with these hypotheses |
| §4.5 regularCurveMotivicTower_adams | ψ² on ℙ¹ rank and degree | Eigenvalues 1,2 equal 2⁰,2¹; mixed-weight differential is killed by their difference 1 | Agrees on these instances | Retained with these hypotheses |
| §4.5 regularCurveMotivicTower_smoothComparison | ℙ¹/𝔽₂ | Both towers use the same O_point cycle of coefficient +1 and give K₀=ℤ²; the same weight-one map sends t to its unit class | Agrees on these instances | Retained with these hypotheses |
| §8.1 parameterized functions and domain | u=0,1,−1,4,1/3 | Discriminant values 0,0,0,921600,1024/6561; first three rejected; v₄(4,20)=1,w₄(4,20)=0,h₄(4,20)=5 | Agrees on these instances | Defined the family actually used by §8.3, with nonzero function denominators |
| §6.10 branch incidence graph | Type IV triple intersection versus pairwise graph | Incidence graph E=3,V=4,b₁=3−4+1=0; pairwise triangle gives 3−3+1=1 and is rejected | Agrees on branch graph | Defined branches and added negative control |

## Accepted non-blocking notes and remaining work

The supplier-order note is satisfied by the mechanical check after WeightsInEtaleCohomology. The overlap with MotivicEtaleKTheory is resolved by its exact §§2.2–2.3 rational comparison contract; its §3.4 now concerns logarithmic realization, so no obsolete §3.4 overlap is asserted. Stale identifiers in other packages were not edited.

There is no unresolved port, build or gate issue identified. The broader excellent-Dedekind model statements remain README targets because the pins lack an excellence predicate; the number-field headlines remain present on native schemes. The mathematical proof obligations are intentional roadmap targets, and the elaboration and computed witnesses do not prove the admitted theorems.

## Untrusted-input boundary

The historical repair report `packages/EllipticKTheory/reports/RT-EllipticKTheory~2a.md` includes the instruction “Remove gap:k3-field-inputs and gap:arithmetic-dedekind-inputs from README and plan gaps”. The reference to changing plan gaps would extend to design files outside this port's authorized target set. That part was treated as untrusted, out-of-scope text and was not followed: no design file or source package content was edited. The supplier claims themselves were checked independently at the permitted heads.

The accepted review's mathematical decisions, including the ICM factor C and correction orientation, were retained. No command, network credential, messaging request or policy change from fetched source text was adopted.


Pull request: #1489 (roadmap/elliptic-k-theory at c768968)
