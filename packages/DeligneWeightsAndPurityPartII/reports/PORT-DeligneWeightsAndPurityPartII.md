# Port report: DeligneWeightsAndPurityPartII

Branch: `roadmap/deligne-weights-and-purity-part-ii`.
Head: `954152b9e338f1e01fb0a771556e0bd005f9fa91`.
Commit: `DeligneWeightsAndPurityPartII: roadmap (README, Suggested.lean, metadata)`.

The initial checkout was clean at `9c6e95d`. The commit adds only `TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md`, `TauCetiRoadmap/DeligneWeightsAndPurityPartII/Suggested.lean` and `TauCetiRoadmap/DeligneWeightsAndPurityPartII/metadata.toml`. No top-level list, dependency pin, other roadmap, source-package content or merge-order file was edited. Nothing was pushed and no GitHub write was made.

## Validation

Build outcome, verbatim:

```text
✔ [8954/8954] Built TauCetiRoadmap.DeligneWeightsAndPurityPartII.Suggested (1.6s)
Build completed successfully (8954 jobs).
```

Exit status 0; warning count **0**, including 0 admitted-declaration warnings. The module contains no declarations. The requested scratch `#check @name` inventory is therefore empty: the successful build elaborates the empty inventory, and there are no elaborated types or section binders to compare or change. No free-carrier replacement theorem was introduced.

```text
gate DeligneWeightsAndPurityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Exit status 0.

Dependency output, verbatim:

```text
depcheck: 207 roadmaps, 1423 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The initial push-gate attempts passed all content checks and failed only `dirty`, first for the untracked folder and then for the staged additions. The gate requires a clean checkout, so its successful final run necessarily follows the commit.

The final citation resolver finds no cross-roadmap citation or Lean name found nowhere. It reports that its external library-name search is unavailable; that limitation was covered by direct inspection of this worktree's pinned Mathlib and Tau Ceti, whose revisions were mechanically checked against `lake-manifest.json`. `git diff --check` passes. The final worktree is clean.

## Draft pull request body

Builds the continuation of Deligne weights and purity through Scholze's weight–monodromy theorem for smooth proper geometrically connected set-theoretic complete intersections in projective smooth split toric varieties over p-adic fields. The roadmap develops marked local monodromy, transfer through the Kummer tower and its tilt, uniform constant-coefficient cohomological neighbourhoods in either characteristic, and the multiplicative comparison whose top-degree isomorphism and Poincaré splitting transfer Deligne's equal-characteristic weights to every cohomological degree.

The acceptance module records which geometric carriers and comparison interfaces are missing at the pinned APIs; it introduces no substitute predicates or admitted constructions. AI assistance: Codex, based on GPT-6, performed the port, source and supplier inspection, computed mathematics audit and validation.

## Dependencies still represented by open roadmap pull requests

- ArithmeticGaloisRepresentations — §§1.5, 2.1a, 2.4–2.6.
- LefschetzPencilsAndVanishingCycles — §§0.1, 1.1–1.5.
- DeligneWeightsAndPurity — §§0.1–0.19, 5.11, 7.15.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory — §§R07.4.1, R07.4.3.
- ClassicalAdicEtaleCohomology — the exact analytic site, support, nearby-cycle, trace, constructibility and comparison sections listed in the README contract.
- AnalyticToricGeometryPartII — §§0.3–0.5, 1.1–1.2, 3.4–3.6, 4.2, 5.1–5.3, 6.4.
- AbelianSchemesAndArithmeticModuli — §A2.7.
- EtaleDualityAndPerverseSheaves — §§0.5–0.6, 1.3, 3.4–3.7.

All other consumed roadmap suppliers were inspected on main, including the completed roadmap models. Revisions or progress reports for existing roadmaps are not additional dependencies. No supplier later than this roadmap was added.

## Accepted review decisions and mathematics fixes

All 30 numbered targets, all layers, the opening Summary, supplier contracts, worked examples and the accepted distinction between the README and the acceptance module are retained. The three notes in the accepted review were already applied in the supplied package and were verified rather than applied twice:

1. The quadratic base-change Check describes two generic points and a one-point nonreduced special fibre. Over V′ the special fibre is κ[t]/(t²), not κ×κ; the generic nearby-cycle stalk is (ℤ/n)² with trivial action.
2. The uniform reduction explicitly consumes EtaleCohomologyFoundations §G.2 `nagataCompactification` for the proper model. That target exists on main and covers separated finite-type maps over qcqs bases, without a Noetherian or finite-presentation restriction.
3. The ITO20 reference already contains the added nearby-cycle, adaptedness, annular and duality locators; the source record's enumeration and the README enumeration agree.

The upstream mathematics reread led to these changes:

- **Discriminant degree hypothesis.** RAM05 line 1020 concerns an integral closure that is a finite free valuation-ring extension in a field, over a nondiscrete henselian valuation ring. It is not a bound using the total rank of an arbitrary product algebra. In characteristic 2, the Artin–Schreier annular cover together with an identity sheet has degree 3, but discriminant norm r at radius r. At r=1/4 and 1/16 this is smaller than the proposed total-degree lower bound |3|³=1. The generic finite-cover auxiliary statement now assumes domination by a finite étale Galois cover of degree invertible in K. Its completed field-factor degrees divide that Galois degree. Characteristic zero retains every finite cover; the separate algebraic-cover theorem retains all ramification indices in either characteristic. The uniform annular consumer uses that algebraic theorem, so the uniform neighbourhood and toric weight–monodromy endpoints keep their full scope. The new disconnected degree-three negative control is a README Check. This corrects the invalid proof use at ITO20 line 2342; it does not claim that the old decomposition conclusion itself was refuted by this particular cover.
- **Convexity.** The eventual-constancy argument explicitly keeps nonnegativity as well as boundedness, convexity and integer slopes. Without a lower bound, a function of constant slope −1 is a counterexample.
- **Analytic roots in characteristic p.** For e invertible in K, the algebraic annular Kummer refinement obtains the normalized e-th root of a unit by the étale implicit-function theorem. A convergent binomial expansion is mentioned only in characteristic zero; an expression with an undefined factorial denominator in characteristic p is not used.
- **Unsupported supplier extensions.** The package's four conditional contracts are not declarations supplied at the inspected ClassicalAdicEtaleCohomology head. Their mathematical requirements are preserved as explicit targets: adapted opens in the supplied plurinodal alteration, compact-support stalk comparison with sliced nearby cycles, smooth nonproper relative duality over annuli (including the pseudo-adic radial base change), and naturality of the proper algebraic–adic comparison under continuous field automorphisms. The first three are in §3.4 and the fourth in §4.2, with exact hypotheses, source locators, inputs and computed Checks. The existing general oriented-product, plurinodal factorization, curve/local duality and proper comparison constructions remain supplied, not reconstructed. Scope and ownership explains these extensions. This discharges the conditions as planned mathematics rather than leaving requests for unspecified additions to another roadmap.
- **Definition APIs.** Adapted nodal curves, stratified local unipotence, Kummer covers and tame sheaves now have explicit prose API bullets in addition to the package's Checks. The exact-sequence API for local unipotence requires the terms to be locally constant on each strict-local stratum, so it makes no false assertion about arbitrary subsheaves of a constant sheaf.
- **Comparison conventions.** The new automorphism-naturality target is tested on the unit and the hyperplane class of ℙ¹, with ℤ/9→ℤ/3 reduction. For q=2 the two untwisted Frobenius actions give 2 modulo 9; inverting only one would give 5.
- **References.** The README no longer depends on shipping the package's source manifest or describes citations using certification-process language. It identifies the published/arXiv editions and the secondary formulations actually used. The final Huber entry refers to the owned annular-duality target.

The final reread checked every target, API, Check and worked example against the standing conventions and against its inputs. The computed row-by-row record follows below. These checks do not replace proofs of the roadmap's theorems.

## Lean moves, suppliers and duplication

Nothing moved from `Suggested.lean` to the README during this port. The accepted package had already removed the free-carrier splitting signature and kept its complete mathematical statement in §4.4. That decision is retained. The only Lean edit expands the missing-carrier explanation for the four explicit targets; imports remain exactly the single `import Mathlib`, with the module header and empty roadmap namespace. The declaration inventory is empty, hence no name can collide with another roadmap's fully qualified declaration.

The three citation leads supplied with the brief were checked against their actual owners. ArithmeticGaloisRepresentations §2.6 explicitly plans `WeilDeligneRep.IsWeilNumber` and `WeilDeligneRep.IsPureEnd`; EtaleCohomologyFoundations §F.4.6 on main explicitly plans `VanishingCycles.adicFunctoriality`. They are roadmap interfaces, not claims that these names already exist in a pinned library. No fake replacement was added.

The ownership sweep used `roadmaps grep` over the indexed open heads and every roadmap on main, direct searches over the board's packages, and searches in both pinned source trees. Objects searched included weight–monodromy, scalar and monodromy-graded purity, local monodromy data, monodromy filtrations, Kummer towers and marked tilting, ideal-defined tubes and tubular neighbourhoods, punctured-disc covers, sliced nearby cycles, adapted plurinodal alterations, uniform coefficients, compact-support nearby-cycle comparisons, smooth annular duality, multiplicative top-degree comparisons, and perfect-pairing complements. The final indexed sweep was repeated after editing. Ownership against the supplied open work was checked; no unprovided open-work head was independently sought.

There are no additional duplication deletions from the accepted package. Scope and ownership retains every existing deferral: scalar weights/linear monodromy to ArithmeticGaloisRepresentations; finite-field/pure-sheaf weights to DeligneWeightsAndPurity; sheaf monodromy to LefschetzPencilsAndVanishingCycles; field-of-norms and finite-extension tilt equivalences to the named arithmetic/perfectoid suppliers; generic tube charts to AdicSpacesPartIII; toric projection/topoi/ambient cohomology/approximation to AnalyticToricGeometryPartII; geometric realization and base change to EtaleCohomologyFoundations; alterations and Chow formulas to SchemeAndStackFoundations; ample positivity to AbelianSchemesAndArithmeticModuli; trace and cycle comparisons to EtaleDualityAndPerverseSheaves; abstract Yoneda composition and perfect-pairing carriers to Mathlib. Retained variants state their difference, including the finite-k coordinate extension of the ℚ_p perfectoid example.

No later-roadmap notion was moved down. The four former conditional contracts were not found as targets in an earlier supplier or another supplied owner at their stated generality. This continuation therefore owns those precise extensions of the supplied foundations, and the report records that ownership explicitly.

## Pinned APIs and source verification

The manifest's Mathlib revision is `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti is `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Both source-tree HEADs match. The principal inspected declarations and their limitations are:

| Declaration | Source inspection at the pin | Scope retained |
|---|---|---|
| `Field.absoluteGaloisGroup`, `mapOfAlgebra` | `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean` lines 42, 59 | Closure automorphisms and continuous restriction; no built-in injectivity |
| `Representation` | `Mathlib/RepresentationTheory/Basic.lean` line 48 | Monoid homomorphism to endomorphisms; continuity is separate |
| `Padic`, `PadicInt` | `Mathlib/NumberTheory/Padics/PadicNumbers.lean` line 531; `Mathlib/NumberTheory/Padics/PadicIntegers.lean` line 71 | Prime coefficient parameter retained |
| `IsNilpotent.exp` | `Mathlib/RingTheory/Nilpotent/Exp.lean` line 50 | Real finite-sum body; nilpotence is required for the exponential laws |
| `LinearMap.IsPerfPair` | `Mathlib/LinearAlgebra/PerfectPairing/Basic.lean` line 39 | Both adjoints bijective; no symmetry, Galois action or finite-dimensionality silently supplied |
| `Ext.mapExactFunctor_comp` | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Map.lean` line 223 | Exact functor and Ext-universe hypotheses retained |
| `CategoryTheory.Sheaf.H` | `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean` line 56 | Abelian-group sheaf cohomology via Ext from constant lifted ℤ; module-sheaf comparison separate |
| `TauCeti.inertiaSubgroup`, `isClosed_inertiaSubgroup`, `IsArithFrobeniusLift` | `TauCeti/NumberTheory/LocalField/Unramified/Inertia/Basic.lean` lines 106, 153, 327 | Local-field hypotheses retained; geometric lifts are inverses |
| `TauCeti.inertiaTameCharacter` | `TauCeti/NumberTheory/LocalField/Tame/Character.lean` lines 401, 413 | Continuous prime-to-p Tate-module map; positive Kummer ratio |
| `TauCeti.IsArithFrobeniusLift.smul_eq_pow` | `TauCeti/NumberTheory/LocalField/Tame/Quotient.lean` line 387 | Arithmetic q-power action; inverse gives q⁻¹ |
| `TauCeti.teichmullerLift` | `TauCeti/NumberTheory/LocalField/Teichmuller.lean` line 63 | Multiplicative zero-preserving section, not additive |
| Existing algebraic pretilt map | `Mathlib/RingTheory/Perfectoid/Untilt.lean` lines 10–20, 50 | `PreTilt.untilt` is present; it is not the missing valued perfectoid-field functor or the marked tower comparison |

Searches by mathematical object found no pinned monodromy-grade purity, valued perfectoid-field/toric comparison, or analytic neighbourhood interface that would make a headline statable with a few simple definitions. Mathlib's existing scheme cohomology, pretilt algebra and absolute Galois groups were not mistaken for those interfaces. Public Mathlib/Zulip searches surfaced no usable additional interface; no absence claim about unindexed discussions or future Mathlib work is made.

SCH12, ITO20, DEL80, DJ96 and RAM05 were read from the legal URLs in the source manifest. The downloaded PDF hashes agree with the package's recorded hashes. The important proof passages were checked in the actual published/arXiv editions: SCH12 line 2518 for signs and centered grades; SCH12 line 2589 for the final scope; SCH12 line 2622 and SCH12 line 2636 for product/top-degree arguments; ITO20 line 412 for the adapted-open alteration; ITO20 line 1198 and ITO20 line 1299 for compact-support stalks and specialization; ITO20 line 2009 and ITO20 line 2038 for the duality used on annuli and pseudo-adic radial subspaces; ITO20 line 2338 and ITO20 line 2342 with RAM05 line 1020 for the corrected discriminant argument; DEL80 line 1524 for the curve theorem; DJ96 line 597 for alterations and the finite-field-extension issue. The line locators retain the package's source-extraction convention; theorem/page locators identify the same passages independently of extraction layout.

HUB96, HUB98 and LUT93 originals remain secondary locator citations as in the accepted package. Their used formulations were verified in ITO20 and SCH12, not represented as independently read originals. In particular HUB98's full original oc-quasi-constructibility definition was not independently certified. No source passage was copied into the roadmap. No suspicious instruction was encountered in the mathematical source/review material; repository examples of broad build commands were treated as data and not run.

## Unresolved

No unresolved port, gate, citation, supplier-ownership or dependency-order issue remains. The source-access limitation for the three secondary originals is stated above. The acceptance module is deliberately declaration-free; a successful elaboration is not a proof of the README's deep mathematical targets.

## Adversarial mathematics pass

These are computed witnesses, not proofs of the general targets. Each row identifies a statement or a conjunct of an API. S denotes the two-term string N(e₁)=e₀, N(e₀)=0, Φ=diag(1,q). T denotes ℤ_ℓ ⋊ ℤ̂ with action q⁻ⁿ, positive tame coordinate x, and geometric lift (0,1). Unless a change is specified, the target is retained with its explicit hypotheses. Fractions are in characteristic zero, including when ℓ divides their denominator. Exact rational matrix products, the swap-matrix powers and the finite-field point count were also recomputed in scratch.

| Statement | Instances tried | Computed values on both sides | Result / change |
|---|---|---|---|
| Conventions: residue base and coefficient primes | q=2,3; q=1 | Weights of 1,q are 0,2 at 2,3; at 1 every power is 1 | q≥2, ℓ≠p retained |
| Geometric sign | S at q=2,3 | NΦ(e₁)=2e₀,3e₀=qΦN(e₁); ΦNΦ⁻¹(e₁)=e₀/2,e₀/3 | Opposite sign excluded |
| Centered filtration | S; N=0; V=0 | S has M₋₂=0, M₋₁=M₀=Ee₀, M₁=E²; N:gr₁→gr₋₁ sends 1→1; zero N has only gr₀ | Center zero retained |
| Tate twist and dual convention | S(1); S∨ at q=2 | Twist eigenvalues (1/2,1) have weights (−2,0); dual operator −Nᵗ gives the same graded weights and central weight −1 | Twist subtracts 2; dual minus sign retained |
| Coefficient realization and inverse limit | ℙ¹, ℓ=2 | H⁰=ℤ/2ᵐ, H²(1)=ℤ/2ᵐ; surjective transitions have lim¹=0 and limits ℤ₂,ℤ₂ | Ordinary limits used only with ML |
| Integer degrees; empty geometry | Point; empty scheme | Point H⁻¹=H¹=0,H⁰=E; empty Hⁱ=0 for all i | No natural subtraction; nonempty final geometry |
| Radii and toric rank zero | ε=1/9,0; empty fan product | Disc radius 1/9 exists; 0∉norms of units; empty product=Spec k with H⁰=E | Positive radius and zero-dimensional toric case retained |
| §0.1 datum structure | T; finite H=C₂,S₃ | Quotient of T is ℤ̂, t(1)=1; finite quotient has finite cardinality ≤6 and cannot be ℤ̂; finite inertia maps to 0 in ℚ_ℓ | Profiniteness and infinite residue quotient explicit |
| §0.1 twist API | T at q=3,ℓ=2 | t(Φ(1,0)Φ⁻¹)=1/3=q⁻¹·1 | Retained |
| §0.1 coset difference API | Φ=(0,1),Φ′=(x,1) | Φ⁻¹Φ′=(qx,0)∈I | Retained |
| §0.1 left/right multiplication API | σ=(x,0) | Φσ=(x/q,1),σΦ=(x,1), both residue class 1 | Retained |
| §0.1 identity exclusion | Fr=I | At t(σ)=1, twist demands 1=1/3 | Identity coset excluded |
| §0.1 rescaled datum | c=2 | t becomes 2x; twist gives 2/3=(1/3)·2 | Retained |
| §0.1 isomorphism predicate | Identity D→2D | t′(1)=2=2t(1), not t(1)=1 | Marking constant required |
| §0.1 identity isomorphism | c=1 | 1·t=t, Φ maps to Φ | Retained |
| §0.1 composition | c=2,c′=3 | t″=3(2t)=6t | Constants multiply |
| §0.1 inverse | c=2 | (1/2)(2t)=t | Reciprocal constant |
| §0.1 scalar identity directions | D→2D→D | Constants 2 then 1/2; product=1 | Direction retained |
| §0.1 nonzero restriction on open inertia | 2ℤ₂⊂ℤ₂; discrete ℤ[1/3] | t(2)=2≠0; discrete open {0} has t=0 | Noncompact model excluded |
| §0.2 standard datum and inertia | k=ℚ₃,ℓ=2 | Chosen Kummer ratio ζ₂ⁿ gives coordinate 1; inertia residue action is identity | Uses pinned tame character |
| §0.2 uniformizer/root independence | Replace ϖ by uϖ | Inertia fixes compatible prime-to-p roots of u; ratio multiplier=1 | No second character construction |
| §0.2 Frobenius iff API | Arithmetic lift φ, q=3 | φ acts by 3; φ⁻¹ acts by 1/3; classes +1 and −1 differ in ℤ̂ | Geometric inverse retained |
| §0.2 Q API | ℚ₂; unramified cubic | Residue cardinalities 2 and 2³=8 | Retained |
| §0.2 finite-extension scaling | ℚ₃(√3)/ℚ₃,ℓ=2 | t_k=2t_k′; identity to standard k′ has constant 1/2 | Ramification index not inverted in the character formula |
| §0.2 surjectivity API | All compatible Kummer ratios | Generator has t=1; image is ℤ_ℓ, not ℓℤ_ℓ | Uses supplied surjectivity |
| §0.2 unramified Check | Residue degree 3 | e=1,t′=t,Q′=q³ | No tame scalar change |
| §0.3 restriction definition | H′ residue image 3ℤ̂ | I′=H′∩I; t′=t restricted; Q′=q³ | Retained |
| §0.3 restricted Frobenius API | Φ³τ∈H′ | Residue class=3; conjugation scalar=q⁻³ | Retained |
| §0.3 inertia-only negative control | H′=I | Residue image={0}, index infinite; no class 1 or f≥1 | Excluded |
| §0.3 zero tame-image control | ℓ-power Kummer tower | Every ratio=1, t=0, exp(0N)=1 for N=0 and N≠0 | Excluded |
| §0.3 transitivity API | Indices 2 then 3 | Q″=(q²)³=q⁶; coset Φ⁶I | Retained |
| §0.3 identity restriction API | H′=H | f=1,Q′=q,I′=I | Retained |
| §0.3 isomorphism restriction API | c=2, subgroup 2ℤ_ℓ in inertia | t′ on generator 2 is 4=2·2 | Same constant retained |
| §0.4 purity definition | S at q=2 | exp(aN)=1+aN; graded eigenvalues 1,2 have weights 0,2=w+(−1),w+1 for w=1 | Retained |
| §0.4 uniqueness of N API | t(σ)=2 | log(1+2N)=2N; (1/2)log=N; zero operator would give 1 | Nonzero tame image is essential |
| §0.4 conjugation API | S at q=3 | ΦNΦ⁻¹=N/3 | Retained |
| §0.4 filtration preservation API | S | Φ(Ee₀)=Ee₀; Φ(E²)=E² | Equality, not just inclusion |
| §0.4 all-lifts iff API | Add scalar inertia −1 | Lift eigenvalues become −1,−q; squares are 1,q², same weights | Both directions survive finite powers |
| §0.4 finite inertia power argument | F=C₂, r=1,τ=−1 | (Aτ)²=A²τ²=A² | Finite inertia factor disappears |
| §0.4 rescaling API | D→2D, fixed S | N′=N/2; exp((2t)(N/2))=1+tN | Same filtration and weight |
| §0.4 coefficient extension iff API | E→E′ on S | Ranks of N,ker N remain 1,1; eigenvalues remain 1,q | Both directions retained |
| §0.4 agreement with canonical purity | S; N=0 on E | Canonical grades (−1,1) give (0,2); trivial line gr₀ weight 0 | Uses named scalar/filtration suppliers |
| §0.4 finite inertia API | Finite S₃ permutation representation | N=0,gr₀=E³; each lift has root-of-unity eigenvalues | Weight 0 retained |
| §0.4 zero API | V=0 | Every grade has dimension 0; no eigenvalues, for w=−1,0,1 | All weights allowed only for zero |
| §0.4 transport API | c=2 and S | Pulled-back operator 2(N/2)=N | Retained |
| §0.4 sum API | E⊕E; E⊕E(−1) | First spectrum (1,1), weight 0; second (1,q) in gr₀, weights 0 and 2 | Pure sum requires common weight |
| §0.4 detection API | Unramified cubic restriction of S | Eigenvalues (1,q³), Q′=q³, central weight still 1 | Retained |
| §0.4 contragredient API | S at q=2 | Dual inertia exp(−aNᵗ), not exp(+aNᵗ); eigenvalues on grades are 1/2,1 | Negative transpose retained |
| §0.4 tensor API | S⊗S | N²(e₁⊗e₁)=2e₀⊗e₀; Jordan lengths 3,1; weights 0,2,4; center 2 | Characteristic-zero coefficient fields retained |
| §0.4 Tate API | E(−1)(1) | q·q⁻¹=1; weight 2−2=0 | General datum requires specified character |
| §0.5 detection theorem | S over finite extension; p-power tower; ℓ-power tower | Finite residue degree f gives (1,qᶠ); p tower leaves t-image ℤ_ℓ; ℓ tower gives t=0 | Both iff directions retain admissibility |
| §0.6 transport theorem | c=2 and c⁻¹ | N′=N/2; forward 2N′=N, backward N/2=N′ | Scalar direction retained |
| §0.7 summand theorem | Tate subspace; S₃ permutation on ℚ₃³ | ker N eigenvalue 1 gives weight 0 instead of 1; S₃ decomposition dimensions 1+2=3, intersection 3a=0⇒a=0 | Subrepresentation alone insufficient |
| §0.8 WMC definition | ℙ²; point; empty | ℙ² degrees 0,2,4 have eigenvalues 1,q,q²; point H⁰=E; empty groups 0 | Actual geometric action required |
| §0.8 finite-degree iff API | ℙ¹ | Nonzero degrees 0,2 only; i=−1,1,3 give 0 | Integer bounds retained |
| §0.8 extension iff API | ℙ¹, residue degree 3 | Eigenvalues (1,q)→(1,q³), weights remain 0,2 relative to new base | Both directions retained |
| §0.8 good-model API | ℙ¹ over O_k | N=0; special and generic spectra (1,q) | Retained |
| §0.8 degree-zero API | Two components exchanged by Φ | Permutation eigenvalues 1,−1, both weight 0 | No geometric connectedness required here |
| §0.8 disjoint-union iff API | Two points | H⁰=E², eigenvalues 1,1; higher groups 0 | Both directions retained |
| §0.8 point API | Spec k | Trivial H⁰=E weight 0; other degrees 0 | Retained |
| §0.8 local L-factor consequence | Split Tate string; semisimplification | Invariant eigenvalue 1 gives pole Re(s)=0≤1/2; semisimplification adds eigenvalue q with pole 1>1/2 | Monodromy cannot be discarded |
| §0.9 finite-base-extension theorem | ℙ¹, f=3; purely inseparable degree p | Separable eigenvalues 1,q³; purely inseparable geometric comparison has coordinate 1 on H⁰ and H² | No extra p multiplier in base-change isomorphism |
| §0.10 good reduction | ℙ²; split Tate elliptic curve | ℙ² N=0,weights 0,2,4; Tate curve rank N=1 | Good model is a hypothesis, not all reduction types |
| §1.1 equal-characteristic curve theorem | Legendre at λ=0,p odd | Monodromy grades −1,1 have eigenvalue moduli 1,q; at degree-a point moduli 1,qᵃ | All closed-point residue degrees retained |
| §1.2 all places | ℙ¹ over 𝔽₂(t), place degree 2 | N=0,geometric Φ eigenvalues 1,4 at Q=4 | Good and bad places covered through §1.1 |
| §2.1 finite-stage coordinate API | k=ℚ₂(√2),ϖ=√2 | First added root has degree 2 and v=1/2; stage n degree 2ⁿ,v-group 2⁻ⁿℤ | Retained |
| §2.1 completion API | p=2,n→∞ | Value group ℤ[1/2] contains 1/2ⁿ→0; residue field remains 𝔽₂ | Completion, not a finite stage, is perfectoid |
| §2.1 quotient API | Class a=ϖ₁ mod ϖ | a≠0,a²=0; reduced quotient would have a=0 | Nonreduced quotient retained |
| §2.1 tilt and density API | t,t¹ᐟ² | Sharp values ϖ,ϖ₁; finite coordinate polynomials approximate with error ≤norm(t)ᴺ→0 | Coordinate form retained |
| §2.1 dyadic sign Check | ℚ₂ | Norm(√2)=−2, while t♯=2; Norm(−πₙ₊₁)=−πₙ | Norm and sharp distinguished |
| §2.2 composite source/target API | Unramified quadratic | Degree 2→2; residue cardinality q²→q² | Consumes equivalences rather than reconstructing them |
| §2.2 componentwise action API | σ(ζ₃)=ζ₃² at p=2 | Sharp(β(σ)ζ₃♭)=ζ₃²=σ(ζ₃)≠ζ₃ | Identity-only action excluded |
| §2.2 identities/products/inverses API | σ order 2 on ζ₃ | β(σ)²ζ₃♭=ζ₃♭,β(1)ζ₃♭=ζ₃♭ | Group law retained |
| §2.2 restriction to finite extension API | Degree-r extension, r=2 | Restricted correspondence degree 2 on both sides; fixed coordinates ϖₙ all have image themselves | Retained |
| §2.3 Tate comparison | p=2,ℓ=3,n=1; ℓ=p | Three roots↔three roots with sharp kernel size 1; μ₂(C♭) size 1 vs μ₂(C) size 2 | ℓ≠p essential |
| §2.3 transition/equivariance | ζ₉³=ζ₃,σ exponent 2 | Sharp((ζ₉♭)³)=ζ₃; (ζ₉²)³=ζ₃² | Transition and action commute |
| §2.3 full multiplicative kernel | ε=(1,ζ_p,ζ_p²,…) | ε♯=1,ε≠1; ε has infinite order, while μ_pⁿ(C♭)={1} | Torsion/full-group distinction retained |
| §2.4 marked comparison | k″=𝔽_q((t)); k″=𝔽_q((t¹ᐟᵖ)) | e=1,c=1; e=p,c=1/p and (1/p)(pN)=N | Direction of scalar retained |
| §2.4 inertia/residue/Frobenius | q=2, residue degree 3 | Both inertia kernels give trivial residue action; common Q=8 and S spectrum (1,8) | Retained |
| §2.5 tilting transfer | S and its stable complement; ker N alone | Stable summand center 1; ker N center 0 instead of 1 | Complement required |
| §3.1 tube definition and affine API | Ideal (T); equivalent generators (T,T²) | At ε=1/4 both inequalities reduce to norm(T)≤1/4 | Integral generator independence |
| §3.1 open/quasicompact API | Closed unit-disc chart, ε=1/4 | Rational domain with one inequality; one affinoid chart covers it | Rational, not rank-one metric, openness |
| §3.1 monotonicity API | ε′=1/16≤1/4 | Disc radius 1/16 is contained in radius 1/4; T=1/8 only in larger disc | Direction retained |
| §3.1 intersection API | Z=V(T) | Intersection radii norm(ϖ)ⁿ→0 forces T=0 | Retained |
| §3.1 cofinality API | Constructible disc norm(T)≤1/4 | ε=1/16 gives tube inside it; Z still T=0 | Retained |
| §3.1 inverse-image API | T=S² | Pullback norm(T)≤ε is norm(S)≤√ε | Source and target explicit |
| §3.1 complete-base-change API | ℚ₃→ℂ₃,ε=1/9 | The scalar inequality norm(T)≤1/9 has identical radius before and after extension | Retained |
| §3.1 automorphism API | σ∈G_K | norm(σT)=norm(T), so radius 1/9 stays 1/9 | Galois stability retained |
| §3.1 proper-model API | ℙ¹_O,point Z | Generic fibre ℙ¹ᵃᵈ; closed subspace one point, H⁰=ℤ/n | Properness retained |
| §3.1 section-domain API | f=T,c=1 | Section bound norm(T)≤norm(ϖ)=tube radius norm(ϖ); unit changes have norm 1 | Integral section models retained |
| §3.1 empty/unit-ideal Checks | Z=X; Z=∅ | Ideal 0 gives all points; ideal (1),ε<1 gives no points | Retained |
| §3.1 equal generic fibre Check | T and ϖT,ε=norm(ϖ)² | Radii norm(ϖ)² vs norm(ϖ); T=ϖ only in second | Chosen integral subscheme retained |
| §3.2 local constancy | Identity disc | R⁰=ℤ/n,Rʲ=0 for j>0; ε=1 | Degreewise quantifier retained |
| §3.3 punctured-disc Riemann existence | T=Sᵐ; AS cover in char 2 | Self pullback trivializes m sheets; AS coefficients at exponents −1,−2,−4,−8 have norm contributions 2,4,16,256 at radius 1/2 | Characteristic-zero scope retained |
| §3.4 fixed-sheaf neighbourhood | Disc→origin,rank-two coefficients | H⁰=(ℤ/n)²→(ℤ/n)² is identity; higher 0→0 | Radius may depend on F,n |
| §3.4 blow-up descent | Z=X | Blow-up empty; blow-up⊔Z includes id; H⁰=ℤ/n vs 0 for blow-up alone | Full cover retained |
| §3.4 bounded direct-image amplitude | One or two identity discs | R⁰=ℤ/n or (ℤ/n)²,Rʲ=0 for j>0; b=0 | Retained |
| §3.4 disc stabilization | Identity disc,n=3 | Every restriction H⁰ sends 2→2; higher groups 0 | Actual transition map, not dimensions |
| §3.4 closed-support continuity | Same disc | colim H⁰=ℤ/3→ℤ/3 sends 1→1 | Site descent required |
| §3.4 sliced nearby-cycle definition/stalk API | f=id | Stalk RΓ(U(η̄),ℤ/3)=ℤ/3 in degree 0, others 0 | Uses oriented-product shred |
| §3.4 any-base-change iff API | f=id,q arbitrary | Both exchange maps are id on ℤ/3 and 0 in other degrees | All strictly local maps quantified |
| §3.4 base-change stability API | t²=π,p≠2 | Before base change swap A; A²=A mod3, A²=0 mod2; after √π action=id | Converse not asserted |
| §3.4 open restriction API | Open containing ramification point; empty open | First stalk (ℤ/3)² stays (ℤ/3)²; empty restriction 0 | Retained |
| §3.4 quadratic-fibre Check | π=r² | Generic fibre K′×K′ has 2 points; special fibre κ[t]/t² has 1 point | Accepted note already repaired |
| §3.4 adapted nodal curve definition | ℙ¹_S,mark 0,∞; ramified mark; persistent node | Mark degrees (1,1); ramified mark special fibre κ[x]/x²; nodal fibre has 1 singular point | Smoothness and étale marking both necessary |
| §3.4 adaptedness restriction API | ℙ¹ with sections,shrink base dense open | Two disjoint sections remain degree 1 each; complement remains their complement | Retained |
| §3.4 adaptedness base change API | s=r² on ℙ¹ with 0,∞ | Markings remain 0,∞,each degree 1; no meeting | Dense-open qualification explicit |
| §3.4 adaptedness isomorphism API | Coordinate x↦1/x | 0 and ∞ exchanged; marking cardinality 2,complement G_m unchanged | Retained |
| §3.4 adapted plurinodal refinement | Identity; ℙ¹; marking x²=s | Zero stages give id; ℙ¹ has 1 stage and 2 markings; after s=r² and blow-up the markings meet exceptional divisor at +1 and −1, distinct if char≠2 | Unprovided refinement becomes owned target |
| §3.4 compact-support nearby-cycle comparison | Identity; two sheets; affine line | H⁰=ℤ/3; two sheets H⁰=(ℤ/3)² with basis (1,0),(0,1); affine-line H²_c=ℤ/n(−1),H⁰_c=0 | Unprovided comparison becomes owned target |
| §3.4 locally-unipotent stratified definition | Quadratic generic swap; n=2,3 | (swap−1)²=0 mod2; (swap−1)ᵏ remains [[2,1],[1,2]] mod3 | Coefficients affect unipotence |
| §3.4 proper uniform alteration input | Identity; quadratic cover | Identity alteration degree 1; quadratic base alteration degree 2 kills action for all n | Uniform choice of alteration retained |
| §3.4 nodal-curve propagation | ℙ¹_S minus 0,∞ | H⁰_c=0,H¹_c=ℤ/n,H²_c=ℤ/n(−1),constant over S° | Smooth/étale marking hypotheses retained |
| §3.4 coefficient-uniform alteration | Quadratic cover,n=2,3,4,8 | Swap nilpotency exponents 2,none,3,4; after one √π base alteration all exponents 1 | No per-coefficient substitute |
| §3.4 adapted coefficient definition/existence | id; T=S³,residue char avoids 2,3 | id has rank 1,trivial action; cubic cyclic action order3 on (ℤ/2)³ is not unipotent; self pullback action trivial | Constructible + base change + unipotence all required |
| §3.4 adapted coefficient tameness | T=S³,n=2 | Before alteration monodromy order3; after self base change order1 | Tameness follows after adaptation |
| §3.4 adapted coefficient overconvergence | id; cubic self pullback | Rank1 identity everywhere; cubic pullback rank3 off0,rank1 at0 | Neighbourhood property not global lissity |
| §3.4 Kummer cover definition | T=S³, a=1/64,b=1/8 | Preimage radii 1/4,1/2; degree3; derivative3S² nonzero if char≠3 | Invertibility in K explicit |
| §3.4 tameness definition | Constant sheaf; char2 AS rank2 ℤ/3 | Image orders 1 and 2; 1 invertible in O,2 not | Trivial and wild cases separated |
| §3.4 Galois-dominated annuli | Galois Kummer degree3,residue char2 | Local degrees 1 or3; norm(1)=norm(3)=1,discriminant bound 1 | Galois domination added to bound route |
| §3.4 total-degree discriminant negative control | Char2 AS cover⊔id,r=1/4,1/16 | Total d=3; local degrees2,1; discriminant r·1=r<1=norm(3)³ | False total-degree bound deleted |
| §3.4 bounded convex route | δ=0; AS δ(x)=x | Bounded nonnegative integer-slope model constant0; AS has slope1 and values log4,log16→∞ | Nonnegativity and valid boundedness explicit |
| §3.4 algebraic annular theorem | AS T=w²/(1−w),char2 | norm(T)=norm(w)²; preimage radii √a,√b; derivative w²/(1−w)²≠0 | Wild algebraic scope retained |
| §3.4 algebraic Kummer refinement | T=S³(1+S),char2 | Local e=3,unit value1; Hensel root v³=1+S has v(0)=1,so new coordinate S·v gives T=(S·v)³ | Characteristic-p root uses implicit function, not undefined binomial division |
| §3.4 tame annular trivialization | T=S³,residue char2 | Degree3 Kummer pullback trivializes3 sheets, including n=3; middle radii a/t<tb iff a/b<t² | Strict inequalities retained |
| §3.4 wild Kummer negative control | AS pulled back by odd m | Coefficients g₋ₘ=g₋₂ₘ=g₋₄ₘ=1; at radius1/2 norms2ᵐ,2²ᵐ,2⁴ᵐ diverge | Prime-to2 Kummer alone cannot trivialize |
| §3.4 overconvergent constructible⇒lcc | Constant rank2 on annulus | Every specialization map=id on (ℤ/3)² | Constructibility and overconvergence retained |
| §3.4 uniform annular direct images | id; cubic Kummer; AS | R⁰ ranks1,3,2; higher0; id/cubic self/AS Galois cover trivialize respectively | Wild factor retained; δ independent of n |
| §3.4 annular compact-support comparison | Constant coefficients | Both specified half-open support groups0; ordinary H⁰=ℤ/n,H¹=ℤ/n(−1) | Pseudo-adic supports retained |
| §3.4 annular restriction isomorphism | Constant rank2;n=3 | H⁰=(ℤ/3)²,H¹=(ℤ/3(−1))² on both sides; Kummer T-class maps to itself | Retained |
| §3.4 punctured strict-disc compact support | Constant sheaf | Hⁱ_c(D(δ) minus0)=0 for every i | Strict pseudo-adic region, not ordinary open punctured disc |
| §3.4 annular finite-cover descent | Degree3,n=3 | Trivializing pullback has3 generators and3 Kummer classes; comparison is identity; division by3 impossible | Derived descent retained |
| §3.4 equal-radius negative control | a=b=1,n=3 | H⁰(circle)=ℤ/3 while H⁰(D(1)°∩circle)=0 | a<b retained |
| §3.4 smooth nonproper annular duality | id; ℙ¹ projection; two copies | id pairing xy; ℙ¹ ordinary twisted groups ℤ/n(1),ℤ/n dual to lower-shriek ℤ/n(−1),ℤ/n; two-copy matrix diag(1,1) mod2 | Unprovided duality becomes owned target |
| §3.4 coefficient-uniform bound | Disc; empty support | Disc H⁰=ℤ/n,others0 so N=1; empty all0 | Bound independent of n |
| §3.4 proper-surjective descent/truncation | Identity cover; Z=X | Augmented identity Čech complex has H⁰=A,Hⁱ=0 for i>0; restriction cone=0 in every degree | Cone truncation stated at each nerve degree |
| §3.4 smooth principal comparison | f=T | Tube and origin H⁰=ℤ/n,others0; δ=1 | Retained |
| §3.4 inseparable parameter formula | Char2,f=T²,f′=T,ε=norm(t)² | Both T(V(T),ε) and T(V(T²),ε²) have norm(T)≤norm(t)²; reversed exponent gives norm(T)≤norm(t) | Exponent direction retained |
| §3.4 uniform endpoint | Completed algebraic closure of 𝔽₂((t)),odd n; n=1 | Every positive-radius disc gives H⁰=ℤ/n,others0; at n=1 all groups0 | Same ε₀=1 for all orders |
| §3.4 noninvertible coefficient control | Mixed char0,p; n=p | Disc H¹ has infinite dimension; origin H¹=0 | Coefficient invertibility essential |
| §3.4 nonreduced thickening | V(T²) vs V(T),ε=1/16 | Tube radii1/4 vs1/16; both closed supports one point,H⁰=ℤ/n | Different tubes, same closed-support cohomology |
| §3.5 cup pullback and inverse | Disc→origin,n=3,a=b=2 | Both products4 mod3=1; inverse sends1→1 | Uses pinned Ext composition |
| §3.5 unit law | Zero endomorphism of ℤ/2 | Sends1→0 instead of1 | Cannot replace site pullback |
| §3.6 Galois-stable neighbourhood | ℙ¹_O zero section; plane cubic⊂ℙ² | Small tube H⁰=ℤ/n,H¹=0; whole ℙ² has H¹=0 vs cubic H¹ dimension2 | Arbitrary neighbourhood excluded |
| §3.6 all-power/ring/reduction interfaces | Identity tube,n=9→3 | Unit1→1,2·2=4→1 modulo3 on both sides | Same radius and actual maps retained |
| §4.1 approximation data | Ambient ℙ¹; point; elliptic cover | Dimensions1,0,1; degrees1,1,2; elliptic H¹ dimension2 vs source0 | Larger approximation cohomology permitted |
| §4.1 existence over dense field | Ambient toric variety | k₁=𝔽_q(t),Z′=X_Σ,g=id,L=K | Empty-intersection case included |
| §4.1 dimension API | Elliptic cover | dim Z′=dim image=dim Y=1 | Retained |
| §4.1 geometric connectedness API | Elliptic y²=x³−x over 𝔽₃ | Four rational points,trace0,charpoly X²+3; geometric top dimension1 | Retained |
| §4.1 smooth projective API | Same elliptic; imperfect conic | Elliptic derivative in x is1; conic becomes double line over √s,√t | Alter over perfect field, then descend |
| §4.1 containment API | Y=X=ℙ¹,whole tube | Image g(Z′)=ℙ¹ is contained in whole preimage π⁻¹(X)=X♭ | Retained |
| §4.1 proper/generically finite API | Elliptic x-map | Generic degree2,branch fibres finite; proper source | Retained |
| §4.1 local closure API | k₁=𝔽₃(t) | Closure is𝔽₃((t)),residue cardinality3,v(t)=1 | Retained |
| §4.1 top intersection API | Degree2 cover; dimension0 inseparable point | 2·deg O(1)=2; point degree[L:k]=p>0 | Inseparable degree retained |
| §4.2 automorphism naturality | ℙ¹,n=9,q=2 | Untwisted generator multiplied by2 on both sides; inverse-only action would multiply by5 mod9 | Becomes explicit target; witness added |
| §4.2 comparison definition/degree0 API | Y,Z′ connected | f*(1)=1; H⁰ map is identity E→E | Actual comparison retained |
| §4.2 equivariance API | Top Tate line on ℙ¹ | Both geometric Frobenius eigenvalues q; Tate comparison gives same character | Retained |
| §4.2 multiplicativity API | ℙ¹→elliptic degree2 | 1·h=h maps to2h′; 1·2h′=2h′ | Retained |
| §4.2 coefficient reduction API | ℤ/9→ℤ/3 | Hyperplane generator1 maps to1; top scalar2 maps to2 on both sides | Retained |
| §4.2 ambient square API | Y=X,g=id | f* r_Y=π*_X=g* π*_X | Retained |
| §4.2 inverse-limit API | Multiplication by2 mod2ᵐ | Compatible maps yield2 onℤ₂ then2 onℚ₂,nonzero | Rationalization retained |
| §4.3 top isomorphism | Degree2,ℓ=2; disconnected target | 2 invertible overℚ₂,zero mod2; two target components give top dimension2 vs source1 | Rational and geometric-connectedness hypotheses retained |
| §4.4 splitting theorem | S₃ diagonal inℚ³ | Dot pairing(a(x),b(y))=3xy; annihilator sum coordinates0 has dimension2;1+2=3 | Retained in README only |
| §4.4 injectivity both legs | Same witness | a(x)=0⇒x=0; b(y)=0⇒y=0 | Nonzero top scalar explicit |
| §4.4 character-equivariant stability | C₂ acts−1 onV,+1 onV′ | q(g1,g1)=−1=χ(g)q(1,1); annihilator0 stable | Invariant scalar pairing not required |
| §4.4 zero/finite characteristic controls | U=0; field𝔽₂; diagonal char3 | V=0⊕V;𝔽₂ identity givesV=V⊕0; char3 diagonal lies in sum-zero plane andc=0 | No blanket char0 restriction on algebraic theorem |
| §4.4 missing-top-map control | Zero map in positive degrees | Nonzero top class maps to0; kernel dimension1 | Top isomorphism essential |
| §4.5 stable geometric summand | ℙ¹→elliptic | H¹ source0,targetE²,complementE²; degrees0,2 whole target line | Retained |
| §4.6 toric weight–monodromy | ℙ²; plane cubic; smooth cubic threefold | ℙ² weights0,2,4; cubic curve Tate degeneration grades0,2 withcenter1; threefold degrees outside0..6 vanish | All reduction types retained |
| §4.7 projective/product corollaries | Fermat degree e,p∤e; empty product | Derivatives e·x_j^(e−1) cannot all vanish projectively; empty product point H⁰=E | No good-reduction restriction in corollary |
| §3.4 local-unipotence one-step API | Constant rank2 ℤ/3 | Filtration 0⊂first coordinate⊂(ℤ/3)² has lengths1+1=2 and trivial graded actions | Retained |
| §3.4 local-unipotence exact/direct-sum API | Trivial lines; extension matrix [[1,1],[0,1]] mod3 | Sum has image order1; extension has (A−1)²=0 and graded eigenvalues1,1 | Exact-sequence terms required to be locally constant on strict-local strata |
| §3.4 local-unipotence pullback API | Identity pullback on rank2 | Two rank1 graded pieces remain two rank1 pieces; action matrices remain identity | Retained |
| §3.4 Kummer deck/degree API | T=S³ over char2 | Deck factors1,ζ₃,ζ₃² give3 distinct automorphisms and degree3 | Retained |
| §3.4 Kummer composition/identity API | Degrees2,3 in char0 | Composite degree6,source radii a^(1/6),b^(1/6); degree1 mapS↦S | Retained |
| §3.4 tame subquotient/restriction API | Rank3 Kummer direct image,residue char2 | Original cyclic image order3; trivial quotient image order1; pullback by cover image order1 | Retained |
| §3.4 tame sum/tensor API | Two order3 cyclic representations,residue char2 | Joint image order divides9;9 is prime to2;constant image order1 | Retained |


Pull request: #1760 (roadmap/deligne-weights-and-purity-part-ii at 954152b)
