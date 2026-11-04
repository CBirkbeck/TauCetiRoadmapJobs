# PORT-RootSystemsPartII

Branch: `roadmap/root-systems-part-ii`. Head: `08d4a191484e86a34ccddeeca9275fa079c5bb7f`.

The clean starting tree was `c994070`. The commit adds only `TauCetiRoadmap/RootSystemsPartII/README.md`, `TauCetiRoadmap/RootSystemsPartII/Suggested.lean` and `TauCetiRoadmap/RootSystemsPartII/metadata.toml`. No push or GitHub write was performed. This is an author mathematics pass assisted by Codex, not an independent review.

## Validation

Final module build: `Build completed successfully (8961 jobs).`

Warning count: **10**, all `declaration uses sorry`; no other warnings or errors. The module-system header and public imports are retained from the package: importing the module-based Mathlib without that header produced a module-system warning; private imports inside the module did not expose names to its public section. The retained imports are exactly Mathlib, TauCeti.LinearAlgebra.RootSystem.Chamber and TauCeti.LinearAlgebra.RootSystem.DynkinType. All exist at the pins and supply declarations used by the signatures.

Push gate summary, verbatim:

```text
gate RootSystemsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency-direction output, verbatim:

```text
depcheck: 186 roadmaps, 1133 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The citation resolver, against main `c994070` and the supplied 414-head index, reports no unresolved roadmap citations or Lean names. Its external-library check is unavailable on its host; every external supplier was therefore checked independently against the local pinned sources. Mathlib is `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti is `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`, matching `lake-manifest.json`.

## Draft pull request body

Build integral dominance and finite diagram folding on the RootSystems roadmap: prove the ordinary Stembridge step, realize distinct root-orbit sums for every finite reduced crystallographic based system, identify invariant chambers and exact integral cones, and export an existential positive-coroot step to cocharacter groups with central directions and torsion. Orthogonal folds, adjacent even-A reversal and component cycles are included; the fixed-Weyl comparison is a separate output. This supplies the finite combinatorial choice needed before relative root-subgroup geometry.

Authored and checked with Codex assistance.

## Dependencies and ownership

Dependencies that are still new-roadmap pull requests: **none**. All four cited roadmap owners are present on main: RepresentationTheory.RootSystems Layers 1, 2, 4, 5 and 6; RepresentationTheory.LieHighestWeight Layers 2 and 6 (scope boundary); ReductiveGroups §9A.1b; ReductiveGroupsPartII §RG2.1.4, *Minuscule coweights and the dominance order*, and §RG2.4.3, *Dominant inertia-coinvariant cocharacters*. Their section text was read at main, rather than importing revisions to existing roadmaps. The latter titles are named paragraphs within the numbered sections.

The shape was compared with the main RootSystems and ReflectionInvariantTheory roadmaps and the main FinancialMathematics roadmap. Ownership searches used the provided roadmaps list, object searches across main and all indexed open heads, the named sibling checkouts where relevant, and the board packages. Queries included distinct orbit sums, root orbits, folding, fixed Weyl subgroups, diagram automorphisms, component returns, Stembridge steps, positive cones and dominance. No claim of unverified absence is inferred from declaration-name searches alone.

ReductiveGroups §9A.1b contains the ADE distinct/projection/full-sum comparisons, invariant simple-root basis and component-return transport. Those remain suppliers. The extension here identifies the unsigned image of all root-orbit sums on arbitrary real native pairings and all crystallographic component types, including exchanged B₂ components. Its fixed-Weyl comparison is an equality of actions on the fixed root space, not a fixed Lie algebra or finite-field root group. CFSGBasicProperties' twisted finite-group construction, LieHighestWeight's weight characters and affine alcoves, KacMoody's singular/affine realizations, McKaySkewGroup's graded-complex folding and the geometric consumer in GeometricSatakeAndFusionPartII concern different objects. The latter explicitly consumes this finite folding theorem. No later roadmap supplies a prerequisite and no notion had to move down from a later owner. No declaration was given another roadmap's fully qualified name.

### Supplier replacements and duplication removals

No additional duplicate target was found in the accepted package. Its existing removals, recorded only in README Scope and ownership, were retained: native positive monoids/chambers/finite dominant intervals; finite classification, numbered matrices, diagram permutations, type-A datum and base change; the three numbered B₂/F₄/G₂ rigidity cases; general highest-weight lattice theory; signed ADE Lie folding and its component-return and lattice interfaces; actual reductive-group and coinvariant realizations. The retained arbitrary-pairing rigidity theorem extends the three numbered cases. The retained cone/order API uses the one native monoid and flipped coweight convention.

Key supplier evidence at the pins:

| Object consumed | Exact pinned file and declaration location |
|---|---|
| Perfect pairing, indexed embeddings and reflection equations; spanning mixin | `Mathlib/LinearAlgebra/RootSystem/Defs.lean:81` RootPairing; `Defs.lean:120` IsRootSystem |
| Independent simples, signed integral expansions and flipped base | `Mathlib/LinearAlgebra/RootSystem/Base.lean:68` Base; `Base.lean:90` Base.flip; `Base.lean:699` Base.IsPos.induction_on_reflect |
| Negative-pairing root sum, requiring nonopposite roots | `Mathlib/LinearAlgebra/RootSystem/Finite/Lemmas.lean:228` RootPairing.root_add_root_mem_of_pairingIn_neg |
| Simple Cartan signs, nonsingularity and Cartan transport | `Mathlib/LinearAlgebra/RootSystem/CartanMatrix.lean:130`, `CartanMatrix.lean:172`, `CartanMatrix.lean:355` |
| Contravariant coweight and forward weight maps | `Mathlib/LinearAlgebra/RootSystem/Hom.lean` RootPairing.Hom fields; `Hom.lean:565` RootPairing.Aut |
| Finite sum form and positive root-span restriction | `Mathlib/LinearAlgebra/RootSystem/Finite/CanonicalBilinear.lean:85`, `CanonicalBilinear.lean:92`; `Finite/Nondegenerate.lean:208` |
| Uniqueness with specified pairing and roots | `Mathlib/LinearAlgebra/RootSystem/Basic.lean:197` RootPairing.IsRootSystem.ext; `Mathlib/LinearAlgebra/Reflection.lean:339` Module.Dual.eq_of_preReflection_mapsTo |
| Root-span pairing and both embedded families | `Mathlib/LinearAlgebra/RootSystem/BaseChange.lean:71`, `BaseChange.lean:110`, `BaseChange.lean:114`, `BaseChange.lean:118`, `BaseChange.lean:126`; balancedness `Finite/Nondegenerate.lean:307`, anisotropy `Finite/Nondegenerate.lean:410` |
| Fixed submodule, dual, centralizer and simply-laced condition | `Mathlib/LinearAlgebra/FixedSubmodule.lean:31`; `Mathlib/LinearAlgebra/Dual/Defs.lean:61`; `Mathlib/GroupTheory/Subgroup/Centralizer.lean:30`; `Mathlib/LinearAlgebra/Matrix/Cartan/Basic.lean:399` |
| Positive monoid and coordinates, height, integrality, pointedness | `TauCeti/LinearAlgebra/RootSystem/Positive.lean:280`, `Positive.lean:285`, `Positive.lean:258`, `Positive.lean:310`, `Positive.lean:339`, `Positive.lean:358` |
| Closed chamber and finite dominant integral intervals | `TauCeti/LinearAlgebra/RootSystem/Chamber.lean:135`; `DominantCone.lean:119` |
| Weyl faithfulness, finiteness, inversion and wall descent | `TauCeti/LinearAlgebra/RootSystem/Weyl/Group.lean:153`, `Group.lean:337`; `Inversions/StrongExchange.lean:189`, `Inversions/Exchange.lean:122`; `FundamentalDomain.lean:127`, `FundamentalDomain.lean:188` |
| Valid finite classification and numbered matrices | `TauCeti/LinearAlgebra/RootSystem/FiniteType/Classification.lean:127`; `DynkinType.lean:222`, `DynkinType.lean:416` |
| Tree, adjacency, oriented symmetry and component irreducibility | `TauCeti/LinearAlgebra/RootSystem/FiniteType/Diagram.lean:244`, `Diagram.lean:85`; `DiagramPermutations.lean:386`; `FiniteType/Irreducible.lean:255` |
| Type-A datum, Cartan realization and reversal | `TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/A.lean:307`, `A.lean:603`, `A.lean:705`, `A.lean:747` |
| Numbered rigidity | `TauCeti/LinearAlgebra/RootSystem/SpecialNodePermutations.lean:248`, `SpecialNodePermutations.lean:259`, `SpecialNodePermutations.lean:273` |
| Real base change, base and preserved axioms | `TauCeti/LinearAlgebra/RootSystem/BaseChange.lean:124`, `BaseChange.lean:190`, `BaseChange.lean:199`, `BaseChange.lean:207`, `BaseChange.lean:235`, `BaseChange.lean:261` |

The native RootPairing fields are literally `root : ι ↪ M`, `coroot : ι ↪ N`, `root_coroot_two` and the two reflection equations, together with an IsPerfPair instance. They do not impose spanning, reducedness, crystallographicity or finiteness. Base's signed-expansion fields use AddSubmonoid.closure, not a real cone. Native posRootCone is literally `AddSubmonoid.closure (P.root '' b.support)`; dominantChamber is literally `{x | ∀ i ∈ b.support, 0 ≤ P.coroot' i x}`. These observations were checked from definitions, not inferred from names. The restriction/positivity instances use a chosen Fintype from Finite; the README keeps that distinction. No newer library was used.

## Package decisions, port changes and final reviewer pass

The accepted review records zero findings, zero blocking findings and no non-blocking notes. Its decisions are retained after independent checking. No statement moved from Lean to README: all ten admitted headline theorems and five simple supporting definitions/structures satisfy the acceptance-test rule. No theorem was weakened and no additional headline was missing. The native realization bundle has actual pairing/base data and literal realization equations, with no empty condition or admitted data. API facts, numerical examples and Checks remain prose.

The final README read found two clarifications to make:

- §2.1 now has explicit image-index controls: A₂ reversal has six roots, four orbits and two image vectors; identity A₂ has six distinct image vectors and excludes zero; empty input has no image index; A₄ reversal has twenty roots, twelve orbits and eight image vectors, with doubled short roots absent. The newly mentioned f₁ is defined in that Check as α₁+α₂+α₃+α₄. This supplies three discriminating image-definition cases without adding Lean padding.
- §4.2's phrase “both giving 2” was ambiguous between the period-two sum vector and the coefficient of twice that vector. It now says that the period-two sum is α₁+α₂ and the tested vector 2(α₁+α₂) has coefficient 2. The mathematical claim is unchanged.

Lean's Layer 2–4 comment titles were matched to the README. Metadata remains the single key `topic = "math.RT"`, matching the main representation-theory folders. No other content change was needed. All source attributions distinguish the orthogonal theorem from the derived adjacent-A and arbitrary-component extensions.

### Elaborated binder audit

I compared every supplied elaborated signature with its README statement, then elaborated a fresh scratch list containing `#check @name` for all 15 declarations through the required module build and inspected every resulting type. The temporary checks were removed before the final build. No binder repair was needed.

| Declaration | Binders compared with README |
|---|---|
| stembridge_step | Finite, reduced, crystallographic, base, both dominant endpoints, distinctness and exact cone difference; no spanning or endpoint-integrality assumption |
| orbitIndices | Native pairing, Finite root indices, automorphism and starting index |
| orbitSum | Same binders; actual finite sum in M |
| foldedIndices | Same pairing/Finite/automorphism, actual image Set M |
| OrbitSumRealization | Pairing/Finite/base/automorphism retained; native fixed-space and dual carriers and all realization fields |
| fixedWeylGroup | Pairing and automorphism; no unnecessary finiteness binder |
| fixed_weyl_group | Finite, spanning, reduced, crystallographic, basedness, simply-laced Cartan matrix, orthogonal simple orbits, arbitrary realization and action equality |
| indexEquiv_eq_self_of_multiple_edge | Nonempty as well as finite, spanning, reduced, crystallographic and irreducible; basedness and nonsimply-laced premise |
| simpleOrbit_pairing_eq_zero_or_typeA_even | Same irreducible arena, simply-laced premise; positive n and simultaneous Cartan/reversal numbering |
| general_fold | Finite spanning reduced crystallographic pairing, base and based automorphism; no assumed fold |
| invariant_weight_transport | Same arena, arbitrary realization, fixed-space vector; integrality only in the implication, not chamber equivalence |
| invariant_cone_transport | Same arena and realization; both monoid and subgroup equivalences on fixed vectors |
| invariant_step | Both fixed dominant endpoints, distinctness, basedness and exact integral difference; no endpoint integrality |
| ambient_coroot_step | Both finite-dimensional ambient modules, finite/reduced/crystallographic without spanning; subgroup contains all roots; all endpoint conditions retained |
| torsion_lattice_coroot_step | Independent universe for A, actual action and root equivariance, root realization, injectivity on generated root subgroup, actual endpoint fixedness and exact lifted monoid budget |

## Source checks

I read the legal author-copy extracts used by the manifest: Rap00 line 64, Rap00 line 172 and Rap00 line 191 through Rap00 line 214; Stem08 line 8 through Stem08 line 107; KZ25 line 2179 through KZ25 line 2220 and KZ25 line 2320 through KZ25 line 2350. These include the entire maximal-root proof and the relevant height-descent argument. The same three author-hosted PDFs were also opened online; the cached PDF hashes match all three source-manifest hashes. All locators use the identified author version. The general-real-endpoint extension follows the maximal-root proof's sign inequalities, not a claim that Rapoport states that broader formulation. The component and even-A extensions are explicitly derived. No passage is copied into the roadmap. The author preprint's arbitrary-orbit inference is tested below; the report makes no claim about a different published version.

The upstream shape search covered Mathlib pull requests and public Lean Zulip results for root-system folding/automorphisms and Stembridge. It supplied no additional API decision to adopt. This does not assert that no upstream work exists; the port follows the native pinned RootPairing/Aut/Base design and retains the roadmap's general construction targets. Fetched text was used as data only; no suspicious instruction-bearing passage was acted on.

## Adversarial mathematics pass

The following values were recomputed for this port. Coordinates are simple-root coordinates, except where stated. A₂ uses [[2,−1],[−1,2]], D₄ has central node 2, and simply-laced roots have squared length 2. API rows refer to the corresponding individual prose statements, not proposed Lean declarations. Each test is evidence about the stated identity or definition, not a proof of its universal theorem. “Retain” records the absence of a needed mathematical change after the displayed computation.

A fresh exact-rational computation generated roots by reflection closure from the Cartan matrices, formed distinct orbit images, checked reflection closure/reducedness/integral pairings, regrouped invariant natural coordinates, and searched for ordinary and invariant steps. It checked 16 systems, 322 coefficient regroupings, 9,459 ordinary endpoint/budget instances and 2,349 invariant endpoint/budget instances with zero failures. Endpoint values and budget coefficients range over {0,1,2}; higher ranks were checked for root images and regrouping only. The finite computations and the following hand computations were performed by this agent.

| Statement | Instances tried | Computed values on each side | Result | Change |
|---|---|---|---|---|
| Finite reduced real arena and rank zero | Empty, A₁, A₂ | Root counts 0,2,6; ranks 0,1,2 | Rank zero admitted outside nonempty case theorem | Retain |
| Independent universes and finite indices | Empty index and A₂ | Empty orbit image count 0; finite A₂ root count 6 | No cardinal/countability hypothesis enters sums | Retain |
| Perfect pairing does not imply root spanning | Rootless real line, pairing xy | Pairing at (1,1)=1; root span={0} while V=ℝ | Ambient center permitted | Retain |
| Closed chamber convention | A₂ vectors 0, α₁ | Values (0,0), (2,−1); membership true,false | Wall included, negative value excluded | Retain |
| Root-row Cartan convention | A₃ outer/middle blocks | Norms 4,2; cross −2; 2(−2)/2=−2, 2(−2)/4=−1 | Agrees with supplier transpose | Retain |
| Forward root and contravariant coroot directions | D₄ triality | Root indices 1→3→4→1; coroot pullback 3→1→4→3 | Inverse directions differ at order 3 | Retain |
| Flipped action convention | Same D₄ action | Inverse coroot pullback takes 1→3; inverse root action takes 3→1 | Dual forward action is inverse original pullback | Retain |
| Canonical form has central kernel | A₁ root α and central z | Root value 2²+(−2)²=8; central value 0²+0²=0 | Positivity restricted to root span | Retain |
| Canonical form invariant under based action | A₂ α₁, α₂ | Squares of six coroot values sum to 12 on each | Reindexing gives same form | Retain |
| Length rescaling preserves coroot ratios | A₁ canonical and normalized | Norms 8 and 2; 2·8/8=2·2/2=2 | Positive component rescaling allowed | Retain |
| Positive-period distinct sum | D₄ outer orbit, periods 3,6 | Distinct (1,0,1,1); full (1,0,1,1),(2,0,2,2); factors 1,2 | No zero-period division | Retain |
| §1.1 definition and coordinate criterion | A₂ x=(0,1), y=(1,1) | Difference (1,0)=1α₁+0α₂; both tests true | Native integral monoid | Retain |
| §1.1 reflexivity | A₂ x=(0,1) | x−x=(0,0); natural coefficients (0,0) | Comparison true | Retain |
| §1.1 transitivity | A₂ 0,(1,0),(1,1) | Differences (1,0)+(0,1)=(1,1) | Composite comparison true | Retain |
| §1.1 antisymmetry | A₁ coefficients n and −n | n=0 gives 0,0; n=1 gives 1,−1 | Both nonnegative only at equality | Retain |
| §1.1 translation | A₂ preceding x,y, translate (3,−2) | Endpoints (3,−1),(4,−1); difference (1,0) on both sides | Preserves and reflects comparison | Retain |
| §1.1 based equivalence | A₂ reversal | Difference (1,0) maps to (0,1); both in ℕ² | Both directions hold | Retain |
| §1.1 integral endpoint coordinates | A₂ a=(0,1), b=(1,1) | b−a=(1,0); inequalities 0≤1,1≤1 | Coordinate and monoid tests agree | Retain |
| §1.1 rational-cone converse needs integrality | PGL₂ root 2, endpoints 0,1,2 | Coefficients 0,1/2,1; monoid answers true,false,true; rational answers true,true,true | Unsaturated cone required | Retain |
| §1.1 flipped coroot convention | PGL₂ cocharacters | Positive coroot 2; 2−0=1·2, 1−0=(1/2)·2 | Same integral order in supplier | Retain |
| §1.1 empty and incomparable cases | Rootless line; A₂ (1,0),(0,1) | Rootless monoid {0}; A₂ differences (−1,1),(1,−1) | Nonzero central and mixed-sign differences fail | Retain |
| §1.1 topology versus algebraic cone | ℕα in real A₁ line | α/2 has coefficient 1/2, outside discrete closed ℕα, inside real conical hull | Closure alone does not saturate | Retain |
| §1.2 ordinary step | A₂ λ=0, μ=(1,1) | Simple values (2,−1),(−1,2); highest-root values (1,1); residual (0,0) | Highest root supplies step | Retain |
| §1.2 maximal-root first branch | A₂ β=α₁+α₂ | β+α₁=(2,1) absent; pairing with α₁∨=1≥0 | Negative-pairing alternative impossible | Retain |
| §1.2 maximal-root saturated coefficient branch | A₂ μ=β=(1,1), λ=0 | Unused coefficients (0,0); λ+β=μ with values (1,1) | Off-diagonal subtraction route agrees | Retain |
| §1.2 nonintegral endpoints | A₁ λ=α/10, μ=11α/10 | Coroot values 1/5,11/5; increment α; residual 0 | Endpoint-integrality assumption unnecessary | Retain |
| §1.2 central directions and subgroup landing | A₁ λ=z, μ=z+2α | Increment α; residual α; central coordinate z in both endpoints and step | No spanning assumption needed | Retain |
| §1.2 strictness and zero budget | Equal endpoints; rank zero | Budget 0; every positive root has height≥1, so residual height<0 | Hypotheses exclude nonexistent step | Retain |
| §2.1 orbitIndices and membership | D₄ starting node 1 | Orbit {1,3,4}, contains 1; cardinal 3 | Positive distinct finite orbit | Retain |
| §2.1 orbit stability | Same orbit | σ{1,3,4}={3,4,1}={1,3,4} | Set stable | Retain |
| §2.1 representative independence of index set | Starting nodes 1 and 3 | Both yield {1,3,4} | Same index set | Retain |
| §2.1 orbitSum and fixedness | D₄ outer root | Sum (1,0,1,1); permuted sum (1,0,1,1) | Actual fixed vector | Retain |
| §2.1 sum independent of representative | D₄ starts 1 and 4 | Both sums (1,0,1,1) | Representative-free | Retain |
| §2.1 fixed-root sum | Identity A₁ | Orbit {α}; sum α, while period-two full sum 2α | Distinct convention excludes repeated sum | Retain |
| §2.1 full-period multiplier | A₂ start α₁, m=2,4 | S₂=(1,1), S₄=(2,2); m/d=1,2 | Correct period factor | Retain |
| §2.1 positive nonzero sum | A₂ reversal simple orbit | Two positive heights 1+1=2; sum (1,1)≠0 | Zero and average models excluded | Retain |
| §2.1 intertwining equivalence | A₃ relabel outer nodes | {1,3} maps to {3,1}; sum (1,0,1) maps to itself | Orbit and vector transports agree | Retain |
| §2.1 foldedIndices image, collisions | A₂ reversal | Six roots, four orbits, two vectors ±(1,1); two positive lifts of (1,1) | Image subtype required | Added explicit cardinalities |
| §2.1 foldedIndices identity and empty cases | Identity A₂; empty system | Image counts 6,0; zero absent in both | Empty image is not singleton empty sum | Added Check |
| §2.1 foldedIndices excludes monoid closure | A₄ reversal | Twenty roots, twelve orbits, eight images; f₁ present, 2f₁ absent | Image differs from quotient and generated monoid | Added Check |
| §2.2 orthogonal fold root characterization | A₃ reversal | Twelve original roots; eight images, four positive images; every positive image has a positive lift | Both set inclusions verified | Retain |
| §2.2 simple sums and integral expansions | A₃ β₁=(1,0,1), β₂=(0,1,0) | Positive folded coordinates (1,0),(0,1),(1,1),(1,2) | Integral base and signs correct | Retain |
| §2.2 realization evaluation field | A₁ f(α)=1 | f(α)=1, f(2α)=2; zero pairing gives 0,0, double pairing 2,4 | Literal evaluation excludes rescaling | Retain |
| §2.2 realization root and support fields | A₃ simple blocks | Roots β₁=(1,0,1), β₂=(0,1,0); 2β₁=(2,0,2) absent | Literal root and base equations identify object | Retain |
| §2.2 realization spanning/reduced/integer fields | A₃ fold | Rank 2; eight roots; Cartan entries 2,−2,−1; ±2β₁ absent | Native fields satisfied | Retain |
| §2.2 uniqueness of coroot functional | A₃ β₂ reflection in β₁ | Correct coefficient −1 gives β₂+β₁=(1,1,1), present; −2 gives (2,1,2), absent | Root closure excludes wrong functional | Retain |
| §2.2 equal-root realization comparison | Identity A₁ | α maps to α; normalized coroot value 2; reflection α↦−α in both | Native uniqueness applies, base support same singleton | Retain |
| §2.2 orthogonal norm identity | A₃ outer block | 2+2+2·0=4=2·2; center norm 2=2·1 | Formula valid under orthogonality | Retain |
| §2.2 Cartan denominator block | A₃ and D₄ | A₃ −2/1=−2,−2/2=−1; D₄ −3/1=−3,−3/3=−1 | Column block is denominator | Retain |
| §2.2 simple-coordinate spanning of fixed space | A₃ invariant (a,b,a) | aβ₁+bβ₂=(a,b,a); at a=2,b=3 gives (2,3,2) | Independent spanning orbit basis | Retain |
| §2.2 commuting block reflection | A₃ s₁s₃ | β₁↦−β₁; β₂↦β₂+β₁; s₁α₃=α₃, s₃α₁=α₁ | Same folded reflection | Retain |
| §2.2 identity and empty realizations | Identity A₁; empty spanning pairing | Root counts 2,0; dimensions 1,0 | Identity specialization correct | Retain |
| §2.2 functoriality | A₃ outer-node exchange | β₁↦β₁, β₂↦β₂; Cartan remains [[2,−2],[−1,2]] | Intertwiner preserves root/base/pairing | Retain |
| §2.2 height descent | A₃ γ=(1,2,1)=β₁+2β₂ | Pairing with β₂∨=2; reflection gives (1,0,1)=β₁; height 4→2 | Positive descent; finite source input valid | Retain |
| §2.2 nonorthogonal negative control | A₂ reversal | Actual norm (α₁+α₂)²=2; orthogonal formula would give 4 | Hypothesis distinguishes branches | Retain |
| §2.3 fixed-space definition and inclusion | A₂ reversal | σ(t,t)=(t,t); σ(1,−1)=(−1,1) | Equation admits diagonal, excludes anti-diagonal | Retain |
| §2.3 addition in fixed space | Diagonals (1,1),(2,2) | σ((1,1)+(2,2))=(3,3)=(1,1)+(2,2) | Additive closure | Retain |
| §2.3 scalar and zero closure | Scalar 2 and (1,1) | σ(2,2)=(2,2); σ(0,0)=(0,0) | Linear submodule | Retain |
| §2.3 injective inclusion, identity action | A₂ id and reversal | Inclusion (t,t)↦(t,t) has zero kernel; id fixes both (1,0),(0,1) | Correct full/diagonal subspaces | Retain |
| §2.3 centralizer membership | A₂ id, a=(12), b=(23) | aσ=σa=a; bσ=σb=b; ab=(123)≠ba=(132) | Fixed group may be nonabelian | Retain |
| §2.3 subgroup inclusion maps | Same S₃ elements | Inclusion(ab)=(123)=inclusion(a)inclusion(b); inclusion(a⁻¹)=(12) | Identity/product/inverse laws | Retain |
| §2.3 closure and restricted action | σ=id on A₂ | Fixed subgroup has six elements; a²=1; (ab)³=1; action (ab)x=a(bx) | Actual group action, not pointwise stabilizer | Retain |
| §2.3 fixed_weyl_group | A₃, D₄, identity A₁ | Original orders 24,192,2; centralizer orders 8,12,2; restriction kernels all 1; folded orders 8,12,2 | Faithful isomorphism counts agree | Retain |
| §2.3 right inversion descent | Longest A₃ and D₄ elements | Counts 6−2=4 and 12−3=9 after outer block multiplication | Exact decrement, right direction | Retain |
| §2.3 open-chamber fixed witness | A₃ choose ρ with values (1,1,1) | σρ=ρ; orbit sum 2ρ has values (2,2,2) | Strictly dominant and fixed, stabilizer 1 | Retain |
| §2.3 rank-zero output | Empty spanning root system | Fixed-space dimension 0, both Weyl orders 1 | No missing simple index | Retain |
| §3.1 nonsimply-laced rigidity theorem | B₂, B₃, C₃, F₄, G₂ | Cartan-preserving permutation counts 1,1,1,1,1 | Only identity; numbered suppliers used for three finite cases | Retain |
| §3.1 oriented-edge negative control | B₂, G₂ node swaps | Off-diagonal pairs (−2,−1),(−3,−1) become (−1,−2),(−1,−3) | Graph symmetry is not a based automorphism | Retain |
| §3.1 simply-laced orbit dichotomy | A₃, A₄, A₂, D₄ | Internal simple pairings 0,−1,−1,0 respectively; exceptional ranks 4=2·2,2=2·1 | Orthogonal or even-A reversal | Retain |
| §3.1 Cartan numbering and reversal equation | A₄ numbering 1,2,3,4 | Reversal 1↔4,2↔3; A₄ matrix unchanged; n=2≥1 | Actual numbered exception present | Retain |
| §3.1 adjacent orbit uniqueness | A₄ | Outer pair 1,4 has distance 3 and pairing 0; middle pair 2,3 distance 1 and pairing −1 | Exactly one nonorthogonal orbit | Retain |
| §3.1 tree-center argument | A₄, D₄ | A₄ center edge {2,3} exchanged; D₄ branch 2 fixed and outer nodes distance 1 | Adjacent vertices cannot share distance to a fixed vertex | Retain |
| §3.1 empty/rank-one controls | Empty; A₁ | Empty has 0 roots and fails Nonempty; A₁ Cartan [2] is simply laced with identity orbit | No spurious nonsimply-laced rank-one case | Retain |
| §3.2 even-A root-image theorem | A₂, A₄, A₆ | Root counts 6,20,42; image counts 2,8,18=2n² for n=1,2,3 | Reduced Bₙ image, B₁ read as A₁ | Retain |
| §3.2 absence of doubled short roots | Same three systems | Each fᵢ present; count of 2fᵢ in image 0 | Excludes nonreduced BC replacement | Retain |
| §3.2 specified simple base | A₄ | β₁=f₁−f₂, β₂=f₂; norms 4,2; f₁=β₁+β₂ | Integral signed expansion and order agree | Retain |
| §3.2 folded coroot values | A₄ x=f₁ | Original values (1,0,0,1); folded values (1,0) | Ordinary orbit multiplier 1 | Retain |
| §3.2 adjacent-middle factor | A₂ x=f=α₁+α₂ | Original values (1,1); numerator 2(f,f)=4, denominator (f,f)=2; folded value 2 | Middle multiplier 2 | Retain |
| §3.2 two positive lifts of short root | A₄ f₁ | (e₁−e₃)+(e₃−e₅)=e₁−e₅=f₁; singleton lift also e₁−e₅ | Orbit sizes 2 and 1, same actual vector | Retain |
| §3.2 transport between numbered models | A₂ root/weight lattices | Simple-root matrix determinant 3; root lattice index 3; real dimension 2 on each | Real equivalence does not equate integral lattices | Retain |
| §3.2 intertwining transport | A₄ changing simple numbering by reversal | β₁ and β₂ fixed as sums; norms 4,2 and entries −2,−1 on each side | Transported root/base/pairing agree | Retain |
| §3.3 component-return fixed-space definition | Two swapped B₂ components | σ(u,v)=(v,u); fixed equation v=u; return τ=id | Domain is Eᶜ^τ, target diagonal fixed space | Retain |
| §3.3 projection/diagonal inverse | Same, u=(1,0) | D(u)=(1,0,1,0); projection D(u)=(1,0); D projection(Du)=Du | Both inverse equations | Retain |
| §3.3 distinct-orbit sum transport | Same long simple root | τ-orbit size 1 with vector (1,0); σ-orbit size 2 with sum (1,0,1,0) | D takes actual distinct sums to distinct sums | Retain |
| §3.3 bilinear scaling | Same B₂ long/short roots | Norms 4,2 and cross −2 become 8,4 and cross −4; c=2 | Form multiplied by 2 | Retain |
| §3.3 Cartan-ratio cancellation | Same | 2(−4)/4=−2, 2(−4)/8=−1; original entries −2,−1 | Positive factor cancels | Retain |
| §3.3 natural coefficient transport | Same simple-block combination | D(2α₁+3α₂)=(2,3,2,3), folded coefficients (2,3) | No averaging/division of natural coefficients | Retain |
| §3.3 change of starting component | Same swap, u=(2,3) | First projection gives (2,3); second projection also (2,3); σDu=Du=(2,3,2,3) | Conjugated return and inclusion diagram agree | Retain |
| §3.3 nontrivial return | Two D₄, σ(x,y)=(τy,x), τ triality | Outer orbit size 6=2·3, central size 2=2·1; norms 12,4; entries −3,−1 | Combined cycle and internal action retained | Retain |
| §3.3 c=1 and empty cases | Single component; no roots | D=id, form factor 1; empty assembly 0 cycles, 0 roots, dimension 0 | No denominator c=0 occurs | Retain |
| §3.3 irreducible component decomposition | A₁⊕A₁ | Roots ±(1,0),±(0,1); cross inner product 0; (1,1) absent | Roots stay in one connected block | Retain |
| §3.4 general_fold | All 16 computed systems | Image counts 0,2,6,2,8,8,18,12,48,8,18,18,48,12,8,12 | Every image reduced/crystallographic/reflection-stable | Retain |
| §3.4 positive root lifting | A₄, E₆, two swapped B₂ | Positive image counts 4,24,4 equal positive-orbit image counts 4,24,4 | Both positivity inclusions | Retain |
| §3.4 simple orbit bases | D₄ and A₄ | Blocks {1,3,4},{2} and {1,4},{2,3}; base ranks 2,2 | Simple-sum supports independent and spanning | Retain |
| §3.4 branch compatibility | A₃, A₄, identity B₂, two B₂ swap | Folded Cartan matrices all [[2,−2],[−1,2]]; swapped norms 8,4 versus B₂ 4,2 | Actual vector scaling distinguished from same Cartan type | Retain |
| §3.4 based equivalence functoriality | Identity on B₂; A₃ outer exchange | Roots map to themselves in first case, outer simples exchange in second; folded vectors unchanged | Named objects transported, not arbitrary carriers | Retain |
| §3.4 direct-sum union, not sums | Identity and swap on A₁⊕A₁ | Identity image four roots excludes (1,1); swap image ±(1,1) has two roots | Separate cycles and single cycle distinguished | Retain |
| §3.4 empty pairing | Empty spanning system | Fixed dimension 0, root and base counts 0 | Empty pairing meets native fields | Retain |
| §3.4 integral root-lattice embedding | A₃ fixed vector (2,−1,2) | Folded integer coordinates (2,−1); expansion 2β₁−β₂=(2,−1,2) | Inclusion is actual unsaturated root lattice | Retain |
| §4.1 invariant_weight_transport chamber iff | A₂ x=f,f/2,0,−f | Original values (1,1),(1/2,1/2),(0,0),(−1,−1); folded 2,1,0,−2 | Answers true,true,true,false on both sides | Retain |
| §4.1 forward integrality only | A₂ x=f and f/2 | Integer original values 1 give integer folded 2; folded integer 1 has original values 1/2 | Converse not claimed | Retain |
| §4.1 orthogonal coroot formula | A₃ fixed original values (d,e,d) | Outer numerator 4d, denominator 4 gives d; center 2e/2=e | No spurious orbit-size factor | Retain |
| §4.1 adjacent coroot formula | A₂ original values d,d | Numerator 4d, denominator 2 gives 2d; d=1 gives 2 | Positive factor 2, not 1/2 | Retain |
| §4.1 component-cycle cancellation | Two swapped A₃ folds | Outer numerator/norm 8d/8=d; center 4e/4=e | Same multipliers after cycle transport | Retain |
| §4.1 nonvanishing denominators | A₃, A₂, D₄ folded simples | Norm lists (4,2),(2),(6,2), all strictly positive | No division at zero | Retain |
| §4.2 invariant_cone_transport monoid iff | A₂ δ=cf, c=2,1/2,−1,0 | Original coefficients (c,c), folded c; membership true,false,false,true on both sides | Exact monoid equality in both directions | Retain |
| §4.2 invariant_cone_transport subgroup iff | Same δ | Integer membership true,false,true,true on each side | Negative coefficient allowed in lattice only | Retain |
| §4.2 unique coefficient regrouping | A₃ (a,b,a), a=2,b=3 | Original (2,3,2), folded (2,3), expansion 2β₁+3β₂=(2,3,2) | Both expansion directions, no division | Retain |
| §4.2 dominance of differences for nonintegral endpoints | A₂ λ=f/2, μ=3f/2 | Endpoint original values 1/2,3/2; difference f has original coefficients (1,1), folded coefficient 1 | Difference comparison independent of weight integrality | Retain |
| §4.2 full sum versus distinct sum coefficient | A₂ δ=2f, periods 2 and 4 | S₂=f, S₄=2f; coefficient of δ is 2 relative to f, 1 relative to 2f | Ambiguous vector/coefficient wording corrected | Clarified Check |
| §4.2 rootless and central negative control | Empty roots, nonzero fixed z | Both monoids/lattices {0}; z has simple-coroot values 0 but z∉{0} | Chamber does not imply root-cone membership | Retain |
| §4.3 invariant_step | A₂ λ=0, μ=f | Select f; fixedness σf=f; folded value 2; residual 0; β≠0 | Valid step with two possible original lifts | Retain |
| §4.3 ordinary specialization | Identity A₁ λ=0, μ=2α | Orbit size 1, β=α, residual α, simple-coroot value 2 | Exactly ordinary step | Retain |
| §4.3 arbitrary eligible orbit negative control | D₄ λ=2ρ, μ=λ+θ | θ=(1,2,1,1); endpoint values (2,2,2,2),(2,3,2,2); candidate α₁+α₂ has values (1,1,−1,−1); sum (1,3,1,1) leaves (0,−1,0,0) | Source inference fails, existential statement survives | Retain |
| §4.3 existential repair in same D₄ example | Select fixed highest root θ | Orbit size 1; step θ; endpoint values (2,3,2,2); remaining budget (0,0,0,0) | Choice required by theorem exists | Retain |
| §4.3 subgroup landing without stability | A₁⊕center with L=ℤα+ℤz, σz=(3/2)z | L contains α; σz=(3/2)z∉L; fixed endpoints 0,α admit β=α∈L | No σ-stability of L needed | Retain |
| §4.3 empty case | Rank zero | Q⁺={0}; comparable difference 0; distinctness false | No false existence conclusion | Retain |
| §4.4 ambient_coroot_step | GL₂ λ=(c,c), μ=(c+1,c−1) | Root increment (1,−1), value 2; residual (0,0); coordinate sum 2c throughout | Original center and subgroup preserved | Retain |
| §4.4 root-span/central-kernel splitting | GL₂ v=(3,1) | p(v)=(1,−1), z(v)=(2,2); sum=(3,1); root value 2 before/after projection | V=E⊕Z with coroot values preserved | Retain |
| §4.4 projection equivariance | Swap on two A₁ components plus central doubling | p(σ(α₁,z))=α₂=σ(p(α₁,z)); central coordinate z→2z | Root and central summands stable | Retain |
| §4.4 projected endpoint difference | GL₂ endpoints (c,c),(c+1,c−1) | Projected endpoints 0,(1,−1); projected difference (1,−1)=original difference | Exact budget survives projection | Retain |
| §4.4 root-span restriction definition | GL₂ E,E′ both root lines | Root and coroot (1,−1); restricted pairing at them 2=ambient dot product 2 | Actual paired spans used | Retain |
| §4.4 perfect-pairing negative control | Pair E with all ambient dual ℝ² | Central functional (1,1) evaluates to 0 on (1,−1) | Larger dual would be degenerate | Retain |
| §4.4 restriction preserves axioms/base/action | GL₂ with identity based action | Roots ±(1,−1), simple count 1, Cartan [2] before/after, σ fixes root | Reduced, integral, same support and permutation | Retain |
| §4.4 restriction chamber iff | GL₂ x=±(1,−1) | Coroot values 2,−2 in both systems; membership true,false in each | Chamber intersection correct both ways | Retain |
| §4.4 restriction positive-monoid iff | GL₂ x=k(1,−1), k=1,1/2,−1 | Coefficients k; membership true,false,false in each | Native integral cone preserved | Retain |
| §4.4 restriction orbit sums | Identity GL₂ root pairing | Singleton sum (1,−1) in E, inclusion gives same ambient vector | Orbit comparison uses same index action | Retain |
| §4.4 restriction for spanning input | A₁ | E=V; root α, coroot α∨, diagonal pairing 2 on both sides | No rescaling of paired data | Retain |
| §4.4 restriction for torus | Rootless real line | E=E′=0, simple count 0, Q⁺={0} before/after inclusion | Zero-space restriction, ambient center allowed | Retain |
| §4.4 no finite-order central hypothesis | Rootless line with σz=2z | σ²z=4z≠z for z≠0; root budget always 0 | Comparable endpoints equal despite infinite-order center | Retain |
| §4.4 torsion_lattice_coroot_step | A=ℤ⊕ℤ/2, r=(2,0), f(n,t)=n | λ=(0,1), μ=(2,1); β=(2,0); λ+β=(2,1), residual (0,0); realized β=2 | Exact group conclusion and torsion retained | Retain |
| §4.4 exact-budget separation of endpoints | Same A, λ=(0,0), μ=(0,1) | Real images 0=0; difference (0,1)∉ℕ(2,0) | Pure torsion difference excluded | Retain |
| §4.4 actual fixedness versus real fixedness | τ(n,t)=(n,t+n mod 2) | fτ(1,0)=1=f(1,0), but τ(1,0)=(1,1)≠(1,0); τ(2,0)=(2,0) | Endpoint-fixedness hypothesis essential | Retain |
| §4.4 realization injective on root subgroup | Same A | Root subgroup 2ℤ⊕0; f(2n,0)=2n; kernel there {0}, whole kernel 0⊕ℤ/2 | Exactly restricted injectivity | Retain |
| §4.4 nonzero step lifts from root realization | Same r | f(r)=2≠0, so r=(2,0)≠0; fake zero realization sends it to 0 and violates hreal | No arbitrary lifted representative | Retain |
| §4.4 actual orbit equivariance | Two swapped roots in ℤ²⊕ℤ/2 | β=(1,1,0); swap β=β; fβ=(1,1) | Root equivariance fixes full lifted sum | Retain |
| §4.4 lifted residual budget | A₁ in ℤ⊕ℤ/2, λ=(0,1), μ=(4,1) | Initial difference (4,0)=2r; β=r=(2,0); residual r | Both natural-monoid conclusions hold in A | Retain |
| §4.4 torsion of a different order | ℤ⊕ℤ/3, r=(2,0), λ=(0,2), μ=(2,2) | β=(2,0), endpoint (2,2), residual (0,0); torsion remains 2 | No prime-two restriction | Retain |
| Worked A₂ normalization and cone distinction | x=f/2 and difference f | Weight values original 1/2, folded 1; difference coefficients original (1,1), folded 1 | Weight-lattice surjectivity differs from root-cone equality | Retain |
| Worked D₄ orbit budget | Bad orbit and fixed θ | Center budgets consumed 3 and 2 against available 2; residual center −1 and 0 | Examples agree with existential theorem | Retain |
| Worked parity and central coordinates | PGL₂, GL₂, torus, ℤ⊕ℤ/2 | Step 2 not 1; sum coordinate 2c; rootless comparison equality; torsion coordinate 1 retained | All four comparisons agree with §4.4 | Retain |

The tests apply only to the stated real, finite, reduced, crystallographic arena. Positive characteristic, nonreduced and affine root systems are excluded; no denominator is used on rank-zero roots or a length-zero cycle. Torsion is tested in the abelian cocharacter group, not by replacing the coefficient field. The nonabelian S₃ and cyclic A₁ Weyl examples distinguish conjugation-fixed subgroups from pointwise fixed spaces. Scalar rescaling, zero pairings, doubled short roots, saturated cones and arbitrary lifts all fail explicit laws or controls above. The proof routes use only the named native inputs and earlier layer targets; no target is used to prove itself.

## Computed system matrix

| Input/action | Original roots | Root orbits | Image roots / positive image roots | Folded simple squared norms | Ordinary / invariant endpoint tests |
|---|---:|---:|---|---|---|
| empty | 0 | 0 | 0 / 0 | [] | 0 / 0 |
| A1 | 2 | 2 | 2 / 1 | [2] | 6 / 6 |
| A2 identity | 6 | 6 | 6 / 3 | [2, 2] | 54 / 54 |
| A2 reversal | 6 | 4 | 2 / 1 | [2] | 54 / 6 |
| A3 reversal | 12 | 8 | 8 / 4 | [4, 2] | 366 / 42 |
| A4 reversal | 20 | 12 | 8 / 4 | [4, 2] | 2313 / 51 |
| A6 reversal | 42 | 24 | 18 / 9 | [4, 4, 2] | 0 / 0 |
| D4 triality | 24 | 12 | 12 / 6 | [6, 2] | 2025 / 27 |
| E6 reversal | 72 | 48 | 48 / 24 | [4, 2, 4, 2] | 0 / 0 |
| B2 identity | 8 | 8 | 8 / 4 | [4, 2] | 42 / 42 |
| B3 identity | 18 | 18 | 18 / 9 | [4, 4, 2] | 279 / 279 |
| C3 identity | 18 | 18 | 18 / 9 | [2, 2, 4] | 255 / 255 |
| F4 identity | 48 | 48 | 48 / 24 | [4, 4, 2, 2] | 1518 / 1518 |
| G2 identity | 12 | 12 | 12 / 6 | [6, 2] | 27 / 27 |
| two B2 swap | 16 | 8 | 8 / 4 | [8, 4] | 2520 / 42 |
| two D4 triality return | 48 | 12 | 12 / 6 | [12, 4] | 0 / 0 |

## Unresolved items

None. There is no supplier gap, missing headline, unverified cross-roadmap locator or failed mathematical control. The build admits the ten target proofs by design; it is an elaboration check, not a proof of the roadmap. No outside-folder repository change is included.


Pull request: #1731 (roadmap/root-systems-part-ii at 08d4a19)
