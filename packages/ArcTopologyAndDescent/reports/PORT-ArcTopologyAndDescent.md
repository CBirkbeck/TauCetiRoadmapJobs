# PORT-ArcTopologyAndDescent

Branch: `roadmap/arc-topology-and-descent`.
Head commit: `dc09dafec42dbc137cb5669979573fccdf1ce734`.
Base: `9c6e95d`; initial `git status --short` was empty. Only `TauCetiRoadmap/ArcTopologyAndDescent/{README.md,Suggested.lean,metadata.toml}` is committed.

## Validation

Build command: `lake build TauCetiRoadmap.ArcTopologyAndDescent.Suggested`.

Exact outcome:

```text
Build completed successfully (9011 jobs).
```

Warning count: **5**, all “declaration uses `sorry`”. There are no other warnings or errors. The ten-signature scratch elaboration also exited 0 with the same five sorry warnings.

The ten declarations were mechanically elaborated in a scratch copy with `#check @name` for each declaration. I compared every expanded signature against §§2.7, 7.8 and 10.0–10.8. No binder was lost and no signature repair was needed. Both affine-transition systems and limit witnesses, all qcqs hypotheses, the prime-p hypothesis, the actual pullback-square witness, both field-completeness hypotheses, the strict finite-type presentation and the coefficient predicates survive. The file retains its five headline theorems and exactly their five real-bodied supporting predicates. No mathematics moved from Lean to README; no additional headline is statable without constructing one of the heavy interfaces identified in its module docstring. The new proper comparison in §9.6 additionally needs adic analytification and its étale-topos comparison, so has no Lean stand-in.

Final gate summary:

```text
gate ArcTopologyAndDescent: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The two pre-commit gate runs failed only the clean-tree check (first the untracked folder, then the three staged additions); all content counters were zero. The required exact gate invocation passes after the commit, with `dirty=0` and `outside-folder=0`.

Dependency check output:

```text
depcheck: 202 roadmaps, 1336 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Neither the merge order nor tooling was edited.

## Draft pull request body

Build the general arc-topology and its excision theory, from valuation intervals and finitary v-descent to unrestricted Milnor excision and formal glueing. The roadmap develops differential and perfect-complex arc-descent, completed generic fibres and finite-ideal complete covers, with integral perfectoid hyperdescent and Artin–Grothendieck vanishing for arbitrary torsion on affinoid algebras as applications. The general coefficient and parameter ranges give later geometric comparisons shared descent interfaces.

The accepted package is ported with its detailed API and discriminating Checks. The acceptance module states the five headline theorems supported by the pinned native carriers and explains the missing carriers for the others. Codex assisted with this port, citation and ownership searches, signature validation and the mathematical checks recorded here.

## Dependencies that are new roadmap pull requests

- AdicSpaces, Layers 0–1 and §2.1.
- ClassicalAdicEtaleCohomology, §§2.5–2.6 and 6.1–6.3.
- DerivedDeRhamCohomology, §§2.1–2.26.
- DiamondsAndVStacks, §§D0.6, D0.11–D0.12, D0.16, D0.18 and D0.22.
- GeneralAlgebraicKTheory, §§8.5–8.6, 10.9 and 10.12.
- PerfectoidQuotients, §§0.4–0.6.
- PrismaticCohomology, §2.0 and §§0.79–0.82 with its perfect-prism contracts.
- ResolutionOfSingularitiesCharacteristicZero, §§5.1–5.2.
- SchemeKTheoryOperations, §§3.4 and 4.10.

All nine are earlier suppliers. Existing-roadmap revision pull requests were not treated as dependencies: the contracts of SchemeAndStackFoundations, EnhancedDerivedSheaves, EtaleCohomologyFoundations, PerfectoidSpaces and the other main-branch roadmaps were checked on `9c6e95d`.

## Port changes and upstream mathematics pass

1. Updated the README's Mathlib and Tau Ceti revision contracts to the actual worktree pins: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. The imported individual Huber module and all used declarations exist there. Lean needed no import repair.
2. Corrected the supplier range for proper analytic comparison. ClassicalAdicEtaleCohomology §2.5 explicitly restricts its Example 3.2.11 application to noetherian A and excludes the strongly noetherian Tate extension. The full source statement is BM21 line 2170. Added §9.6 as the explicit extended target, with its source, map, proof inputs and three computed Checks, instead of claiming the supplier already proves the extension. The ownership sweep found coherent GAGA in AdicSpacesPartIII, which concerns coherent sheaves, not this torsion étale comparison. No later supplier was introduced.
3. Added an explicit three-item API and three Checks to §3.6's product-spectrum/component construction. The values distinguish two principal components, the empty product and a nonprincipal higher-rank component. The latter uses n≥1; at n=0 the middle valuation would be zero.
4. Replaced the dangling folder-local `sources.toml` reference with `packages/ArcTopologyAndDescent/sources.toml` and identified the source versions in References. The target folder contains only the three requested files. Removed a duplicated MAT22 source label and expressed the Huber access limitation without a review-status claim.

No theorem was weakened, no coefficient range was narrowed, no algorithm was added, and no target statement was deleted. `Suggested.lean` is byte-for-byte the accepted package file. The new §9.6 makes an existing prose promise into a target; all 84 original numbered targets remain, giving 85 numbered targets.

## Supplier and duplication audit

`roadmaps grep` searched main and the indexed open heads by the objects: arc/v covers, arc topology/descent, Milnor excision, universal spectral submersions, valuation ultraproducts, coherent representables, Perf descent, universally effective epimorphisms, h-differentials, Tannaka reconstruction and proper henselian/analytic comparisons. I read the relevant supplier passages returned by `roadmaps show` and the corresponding main-branch passages directly. Available board package READMEs and designs were also searched. The supplied sibling heads were included in the indexed open-head search; EtaleDualityAndPerverseSheavesPartII explicitly assigns the valuation-product and complete-arc interfaces to this roadmap. No ownership claim is based on the absence of a local file alone.

The product-spectrum result is owned here: DiamondsAndVStacks §D0.22 supplies ordinary sheaves on profinite sets and ultraproduct stalks, not the ring-product connected-component theorem or its infinity-categorical extension. The arc upgrade of Perf is owned here: SchemeKTheoryOperations §4.10 supplies v-hyperdescent. MotivesAndAlgebraicCyclesPartII's design concerns Banach-ring arc geometry; its carrier and descent problem differ from the scheme v-to-arc criterion here. AnalyticStacks' Tannaka reference concerns analytic stacks, rather than the qcqs algebraic-space Perf reconstruction contract. PerfectoidQuotientsPartII's design assigns tilting of complete arc covers to this roadmap. The ordinary categorical and algebraic ingredients remain with their named suppliers.

No further duplicate target required removal. Existing supplier replacements in the accepted package were preserved and recorded only in README Scope and ownership: scheme v/arc predicates and torsion/constructible descent; spectral submersions and their limit theorem; ordinary Boolean sheaves; perfect-scheme Perf v-descent; perfection, algebraic spaces, derived forms and completion; integral perfectoid and tilt carriers; nonpositive K-theory excision. The new §9.6 records how its stronger range differs from the supplied noetherian theorem.

`roadmaps resolve` reports no unresolved cross-roadmap citations or Lean names. Its library-name check explicitly lacked pins on its host, so I checked library declarations in this worktree instead. The original three leads resolve as follows:

| Lead | Verified owner |
| --- | --- |
| `Arc.Cover.ofVCover` | PrismaticCohomology §2.0, in the cover API immediately after `Arc.Cover`; a planned supplier declaration, not a pinned theorem. |
| `Etale.artinSchreier_vanishing` | SchemeAndStackFoundations §2.11, with `artinSchreier_sequence`; characteristic-p constant coefficients only. |
| `Topos.isQuasiseparated_iff_of_cover` | AdicSpacesPartII §R0.19.10; a coherent cover and quasi-compact relation criterion, not the absent general coherent-site theorem. |

## Conditional contracts retained from acceptance

The accepted review announces five conditions. Four are explicit additional supplier contracts and remain explicit, rather than being represented as existing theorems:

| Contract | Supplier and exact extent still needed |
| --- | --- |
| coherent-topos-pushouts | SchemeAndStackFoundations §2.5: coherent sheafified representables for essentially small finite-limit sites with finite covering subfamilies. Its main text gives filtered-cohomology colimits; it does not state this coherence theorem. |
| algebraic-space-perf-tannaka | SchemeAndStackFoundations §1.4: coherent exact symmetric-monoidal Perf reconstruction for qcqs target algebraic spaces and arbitrary source algebraic spaces. Section 1.4 constructs the category, not this equivalence. BH16 line 86 supports the mathematical contract. |
| constructible-etale-space-descent | SchemeAndStackFoundations §§1.2–1.10: effective qcqs étale-space descent along quasi-compact universally subtrusive maps and the constructible finite-set sheaf equivalence. The existing §1.2 states fppf descent, not the full v-descent contract. RYD10 line 1023 supplies the required generality. |
| perfectoid-tate-constant-comparison | ClassicalAdicEtaleCohomology §2.6: compatibility for the torsion-free image of a general integral perfectoid and replacement by its powerbounded model, including restriction and tilting. The supplied comparison has p-torsion-free R=(R[1/p])° as hypotheses. |

The fifth announced condition, bounded-torsion-punctured-approximation, is retained as an acceptance caveat, but the accepted README no longer consumes the stronger finite-étale equivalence on arbitrary opens. Section 8.9 proves its cohomological open/support comparison from supplied punctured henselian comparison and localization; §10.1 first removes bounded parameter torsion and then applies the actual regular-parameter theorem AdicEtaleGeometry §A1.0.5(a). No new claim that this stronger approximation is supplied was introduced. These conditions require supplier extensions; the port does not silently discharge them or edit their roadmaps.

## Pinned declaration audit

The following definitions were opened at the actual pins. Short native defining expressions below are evidence for the stated scope, not replacements for those definitions.

| File, line | Definition or theorem and consequence |
| --- | --- |
| `Mathlib/RingTheory/Valuation/ValuationRing.lean`, lines 56–64 and 406 | `PreValuationRing` requires total divisibility; `ValuationRing` additionally has an explicit `IsDomain` binder. Total divisibility alone permits the zero ring. |
| `Mathlib/Algebra/Group/Units/Hom.lean`, line 270 | `IsLocalHom` has `map_nonunit : ∀ a, IsUnit (f a) → IsUnit a`; injectivity is separate. |
| `Mathlib/RingTheory/Flat/TorsionFree.lean`, line 92; `Mathlib/RingTheory/Flat/FaithfullyFlat/Algebra.lean`, line 60 | Flatness versus torsion over a Bézout domain, and faithful flatness of a flat local map between local rings. |
| `Mathlib/RingTheory/KrullDimension/Basic.lean`, line 30 | `Ring.KrullDimLE` is an upper bound, allowing a dimension bound larger than the actual dimension. |
| `Mathlib/FieldTheory/IsAlgClosed/Basic.lean`, line 78 | `IsAlgClosed.exists_root` applies to fields; it does not supply the zero-divisor-permitting aic ring predicate. |
| `Mathlib/ModelTheory/Ultraproducts.lean`, lines 93 and 154 | `FirstOrder.Language.Ultraproduct.sentence_realize` uses nonempty structures. Each fixed-degree monic-root statement is first order; a rank-one bound is not inferred. |
| `Mathlib/Topology/Spectral/Basic.lean`, line 38; `Mathlib/Topology/Spectral/Hom.lean`, line 42 | Spectral spaces include T₀, compactness, quasi-sobriety, quasi-separatedness and compact-open bases. Spectral maps preserve compact-open inverse images; openness reflection is additional. |
| `Mathlib/AlgebraicGeometry/Morphisms/Affine.lean`, line 47; `Mathlib/CategoryTheory/Filtered/Basic.lean`, line 590 | `IsAffineHom` uses affine inverse images; `IsCofiltered` includes nonemptiness. |
| `Mathlib/CategoryTheory/Limits/Cones.lean`, lines 116 and 373; `Mathlib/CategoryTheory/Limits/IsLimit.lean`, line 49 | Native cones, postcomposition and limit witnesses give the actual induced map. |
| `Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean`, line 39; `Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/Defs.lean`, line 61; `Mathlib/CategoryTheory/EffectiveEpi/Basic.lean`, line 71 | Full subcategories retain every underlying arrow; actual pullback squares and effective-epi descent include uniqueness. |
| `Mathlib/AlgebraicGeometry/Sites/Etale.lean`, line 50; `Mathlib/AlgebraicGeometry/Sites/AffineEtale.lean`, lines 59, 140 and 149; `Mathlib/AlgebraicGeometry/Sites/EtalePoint.lean`, lines 62, 146 and 156 | Native small étale topology, affine basis equivalence, Grothendieck abelian category and geometric enough points, without noetherianity. |
| `Mathlib/GroupTheory/Torsion.lean`, line 56 | `IsMulTorsion` generates `IsAddTorsion`; finite order is elementwise, not a uniform exponent. |
| `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean`, line 56; `Mathlib/CategoryTheory/Abelian/GrothendieckCategory/HasExt.lean`, line 36; `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`, line 87 | Ext-defined `Sheaf.H`, Ext on Grothendieck abelian categories and ordinary `DerivedCategory`; these do not construct the coherent geometric descent functors. |
| `Mathlib/RingTheory/AdicCompletion/Basic.lean`, lines 56 and 171; `Mathlib/RingTheory/AdicCompletion/Completeness.lean`, lines 151 and 181 | `IsAdicComplete` combines Hausdorffness and precompleteness; completion is the quotient inverse limit; finite generation supplies the evaluation kernel and completeness theorem. |
| `Mathlib/RingTheory/MvPowerSeries/Restricted.lean`, lines 33 and 107 | Restricted-series predicate and subring on the native formal-series carrier. |
| `Mathlib/RingTheory/IntegralClosure/IsIntegral/AlmostIntegral.lean`, lines 26, 31 and 86 | Almost integrality uses an arbitrary regular denominator; noetherian integral comparison has a nonzerodivisor-preservation hypothesis. Fixed t-power denominators in §9.7 are a different condition. |
| `TauCeti/RingTheory/Huber/TopologicallyFiniteType.lean`, lines 133, 150, 207 and 273 | Strict finite type requires an open quotient presentation with compatible scalar map; quotients and identity presentations are supplied. The general predicate does not itself add target completeness or Hausdorffness. |

Native `Scheme` is in `Mathlib/AlgebraicGeometry/Scheme.lean`, line 40, and `GrothendieckTopology` in `Mathlib/CategoryTheory/Sites/Grothendieck.lean`, line 72. The exact fully qualified namespace search found no match on main or an indexed open head.

The pinned object search also found `TauCeti/CategoryTheory/Action/Tannaka.lean`: its G-set reconstruction does not supply algebraic-space Perf reconstruction. No pinned theorem matching any of the five acceptance conclusions was found. The absence claims in the Lean docstring concern coherent geometric interfaces, not the absence of generic categorical foundations.

## Sources and untrusted material

I read the legal cached texts identified by the accepted source manifest, checking the numbered statements and the proof steps used in the port. In particular: BM21 lines 1040–1098 retain the repaired kernel case; BM21 lines 1110–1144 retain the aic hypothesis and strict interval extensions; BM21 lines 2170–2198 support §9.6; BM21 line 2450 uses the corrected maximum estimate; BH16 line 86 states reconstruction for arbitrary source and qcqs target; RYD10 line 1023 states quasi-compact universally subtrusive descent. BS22 line 2594 distinguishes formal complete tests from pseudouniformizer tests; CS24 lines 711–821 include zero-image tests and finite ideals. No passages were copied into the roadmap. HUB96 remains a paywalled, printed-locator citation without direct text verification.

Public searches for Mathlib arc-topology work and Zulip discussions returned no specific competing scheme arc-topology interface. This is a limited search, not an assertion of nonexistence. The search result from the Mathlib review dashboard included contributor-template commands such as “git commit --author=... --allow-empty”; these were treated as untrusted quoted data, not instructions, and were not executed. No fetched command or review instruction changed the task, no credential was read, and no GitHub write was made.

The accepted review has no package findings or additional non-blocking repair requests. Its source notes remain respected: the kernel-containment correction (BM21 line 1040), the separate below-kernel case (BM21 line 1073), aic inheritance only for aic input (BM21 line 1110), use of Proposition 3.30 rather than the misnumbered 3.29 (BM21 line 977), the three-contracted-primes argument (BM21 line 978), maximum rather than minimum in the analytic norm estimate (BM21 line 2458), and the formal descent map with the correct source and direction (BS22 line 2660). These do not require copying or editing the source texts.

## Adversarial mathematics ledger

The table records concrete instance calculations, not proofs of universal statements. A pass means the instance agrees with the exact hypotheses; it does not discharge the roadmap theorem. Every numbered target has a row, followed by additional rows for the definition APIs and conventions. In the table, k is algebraically closed where an aic or cohomological calculation needs it. V₂ is the composite valuation ring of k((x))((y)), v(y)=(1,0), v(x)=(0,1), lexicographically ordered, with 0⊊p⊊m. V₁ is a nonfield rank-one valuation domain, aic when required. Λ is a nonzero finite coefficient ring unless specified otherwise.

| Statement | Instances tried | Computed values on the compared sides | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 aic ring | 0, k, Q, k×k | In 0 every evaluation is 0; in k every positive-degree monic splits. T²−2 has no rational root. In k×k roots are componentwise pairs. | Pass | None |
| §0.3 aic extension/cardinality | A=F₂, V=Fbar₂ | V₀=Fbar₂ is countable; max(2,ℵ₀)=ℵ₀. Identity extension has kernel 0 and reflects units. | Pass | None |
| §0.4 finite-rank approximation | k, k(x), V₂ | The rings k and k[x]_(x) have ranks 0 and 1. Intersecting V₂ with k(x) gives k[x]_(x); x is a nonunit in both it and V₂. | Pass | None |
| §0.5 prime splitting | V₂ at p; endpoints | y/xⁿ has value (1,−n)>0 and belongs to p. (1,1) has matching residues; (1,0) does not. At 0 and m one side is an identity. | Pass | None |
| §0.6 interval ring | [p,p], [0,p], [p,m], [0,m] | The rings are κ(p), (V₂)_p, V₂/p and V₂. The first shrinking branch inverts x; the second kills y. | Pass | None |
| §0.7 ind-smooth approximation | Q; Q[t]_(t); dual numbers | Ω¹(Q/Q)=0; Ω¹(Q[t]_(t)/Q)=Q[t]_(t)dt. Q[ε]/ε² has ε≠0 but ε²=0, unlike a filtered colimit of reduced smooth algebras. | Pass | None |
| §1.1 universal descent | Identity; split fold over F₂ | Fold equalizer has (0,0),(1,1), hence 2 elements, versus 4 unconstrained pairs. For Z[0], full identity totalization has H¹=0; the two-arrow homotopy equalizer has H¹=Z. | Pass | None |
| §1.3 h-site/blowup square | Z=∅; Z=X,Y=∅; blowup A² | First complement condition forces Y=X. Second cover is ∅⊔X→X. Blowup centre has inverse image P¹ with fibre dimension 1. | Pass | None |
| §1.4 h-descent iff | Terminal sheaf; boundary blowup | Terminal values give 1×₁1=1. With Z=X,Y=∅, the pushout of ∅→∅ and ∅→X is X in sets and spaces. Both implications preserve this boundary. | Pass | None |
| §1.5 perfection/v-sheaves | F_p[ε]/ε²; perfect V₂ | Frobenius sends ε to 0, so perfection is F_p. Perfect V₂ has 3 prime points while each split component has 2; the split is canonical/arc but not v. | Pass | None |
| §1.6 affine v-approximation | Polynomial tower; noncartesian x↦1 tower | Each polynomial stage has a zero-evaluation section. In the varying-base tower colim k[x]=k=colim k[x,x⁻¹], but every stage misses x=0; B_i⊗A_(i+1)=A_(i+1)≠B_(i+1). | Pass | None |
| §1.7 universal subtrusiveness iff v | Identity ∅; generic inclusion; rank-two split | ∅ has 0 specialization pairs. Generic inclusion misses m. The split hits all 3 points but has 0 comparable lifts of 0⇝m in one component. Thus surjectivity alone fails. | Pass | None |
| §2.2 arc versus v | F₂ point; noetherian A²; rank-two split | Point identity has 1 lift with W=V. A² cannot have a rank-one-component affine v-cover: 3 contracted primes exceed 2 points. Rank-two split is arc=true, v=false outside the noetherian-target condition. | Pass | None |
| §2.3 Milnor covers | I=0, I=A, V₂ at p | I=0 adds Spec A as an identity component; I=A forces B=A and adds ∅. Split rank-one intervals lift, while the identity rank-two valuation cannot invert x or kill y faithfully. | Pass | None |
| §2.4 specialization criterion | Identity V₁; Frac V₁; field | Identity has the pair 0⇝m; generic inclusion has 1 point and no lift of m. A field target has one constant specialization and a lift exactly when its fibre is nonempty. | Pass | None |
| §2.5 universal module injectivity iff | Identity; inversion; dual-number reduction | M=V₁/t² maps identically under identity. Nonzero V₁/t tensors to 0 under inversion. Every dual-number map to V kills ε, making reduction base change V→V. Both iff directions agree. | Pass | None |
| §2.7 spectral iff | Identity point; generic inclusion; V₂ split | Identity subsets ∅,* reflect openness. Generic inclusion has preimage of {m}=∅ compact open, but {m} is not open. Split has exactly 4 open inverse-image subsets among 8 subsets, namely ∅,{0},{0,p},all. | Pass | None |
| §2.7 affine-transition limit | One-object identity; polynomial folds; false cone | One-object map is f. Limit fold has two copies of Spec k[t₁,t₂,…] and W=V lifts. An empty apex cone gives 0 field lifts and is not a limit. | Pass | None |
| §3.1 cotruncated compacts | Sets; nonnegative derived target; spaces | Map(1,S) is a discrete set, truncation bound 0. For Z[−r] in the cohomological nonnegative target, the bound is at most r. Map(*,K(Z,n)) has π_n=Z for arbitrarily large n, so all spaces fail a finite bound. | Pass | None |
| §3.2 finitary functor | Terminal; A¹; infinitely generated affine | Terminal colimit is 1. Each polynomial element uses finitely many variables. Identity on k[x₁,x₂,…] uses every variable and has no finite-stage factorization. | Pass | None |
| §3.3 filtered colimits/totalization | Constant cosimplicial Z/n; identity tower | Both totalization orders give colim Z/n along divisibility = Q/Z; every cosimplicial arrow is identity. Identity affine-limit descent map stays identity. | Pass | None |
| §3.4 h-to-v descent | Finite constant set; point cohomology | For the split fold, both h and v equalizers are the diagonal finite set; for Spec k, H⁰=Λ and H¹=0 for both topologies. | Pass | None |
| §3.5 detecting families | Identity; finite opens; empty family | Identity pullback is f itself. The empty family returns true for every test, but empty→Spec F₂ has comparison F₂→1, with cardinalities 2→1, not an equivalence. | Pass | None |
| §3.6 product components | F₂×F₃; empty product; nonprincipal valuation product | Product ring size 6, spectrum size 2. Empty product=0, spectrum size 0. For a=[p], b=[p^i], n≥1, v(b)>n v(a)>0 on i>n. | Pass | Added API and Checks |
| §3.7 rank-one obstruction | k=F₂,F₃ | 0,p,m contract to 0,(y),(x,y), three distinct ideals. A connected rank-one component has at most 2 points; 3>2 in both characteristics. | Pass | None |
| §3.8 Boolean sheaf | I=∅, {1}, {1,2} | F(0)=1; unique singleton stalk=F(A); two-point global value=F(A₁)×F(A₂). For F=underlying sets on F₂×F₃ the product has 6 elements. | Pass | None |
| §3.9 ultraproduct detection | Two factors; infinite p-adic factors | Two principal stalks detect a pair of maps componentwise. Nonprincipal b=[p^i] has value larger than n[p] for every standard n; principal values alone do not exhaust βN. | Pass | None |
| §3.10 aic valuation detection | A=k; A=0 | For algebraically closed k the identity k→k is an aic valuation cover with 1 point. For 0 there are 0 nonzero valuation tests and its product is 0; the terminal sheaf value is 1. | Pass | None |
| §4.1 extended prime and largest prime | k→aic W, p=0; V→κ(m), p=0 | In the first case pW=0 but q=m_W, and W⊗_k k=W=W_(m_W), whereas W_(0)=Frac W. In the second ker=m is not contained in p; contracting 0 gives m≠0. | Pass | Existing kernel restriction retained |
| §4.2 finite-presentation persistence | Cartesian identity stages; noncartesian x↦1 | Identity stages give B_i⊗A=A and cover=true. The noncartesian limit is k→k although all stage inversions miss x=0. | Pass | None |
| §4.3 excision predicates | Underlying ring sets; terminal functor; split sheaf image | Compatible pairs give V₂; (1,1) is allowed and (1,0) rejected. Terminal comparison is 1→1×₁1=1. The proper v-sheaf image excludes the identity section of V₂, so its prime-square comparison fails. | Pass | None |
| §4.3 domain base change | Node k[x,y]/xy to k[y], k[x] | Pullback squares become k[y]→k[y], k→k and k[x]→k, k[x]→k. The pullbacks are k[y] and k[x], respectively. | Pass | None |
| §4.4 interval induction | One point; 3-point chain; accumulating chain | Field interval has length 0. Two adjacent subintervals have union {0,p,m}. In the accumulating chain the class omitting [0,p₁] has no strict upward extension from 0, so fails a hypothesis. | Pass | None |
| §4.5 universally descending split | pW=W; p below kernel; field inclusion | Tensor corners in the first two cases are respectively W,W,0,0 and W,0,W,0; both pull back to W. For k→W, q=m_W gives W rather than Frac W. | Pass | None |
| §4.6 three-way arc criterion | Terminal functor; v-sheaf image on perfect V₂ | Terminal values give all three properties true. The v-sheaf image has no identity section at V₂, hence excision=false and arc=false despite v=true. | Pass | None |
| §4.7 rank-one detection | Identity transformation; terminal sheaf; unbounded-space control | Identity comparisons on every valuation are identities. Terminal fibres have 1 point and all π_i=0. K(Z,n) has π_n=Z and defeats a single finite truncation bound as n varies. | Pass | None |
| §5.1 bounded site | ∅; nilpotent reduction; Q and Z_(p) family | Empty target has 0 tests. Every map from dual numbers to a domain kills ε. A finite subfamily omits some prime q and has 0 lifts of the closed F_q test. | Pass | None |
| §5.2 coherent pushout and points | {a}⊂{a,b}→{c}; nonmonic control | Pushout has 2 elements; relation pieces have sizes 2,1,1. A 2-element cover of 1 has a 4-element kernel pair. Nonmonic *←{0,1}→* has space pushout S¹, not a point. | Pass | Conditional coherent-site contract retained |
| §5.3 valuative detection for coherent sheaves | Identity representable; infinite localization family | Identity has one lift for each section. A finite localization subfamily misses an F_q section, while the infinite family has all valuative lifts but no finite cover. Source quasi-compactness is substantive. | Pass | None |
| §5.4 cardinal comparison | Small Spec F₂; initial sheaf | The same represented point has sections Hom(Spec F₂,Spec F₂) of size 1 at either cutoff; initial represented ∅ remains empty on a nonempty test. | Pass | None |
| §5.5 unrestricted Milnor pushout | Terminal values; nilpotent monomorphism | Terminal pullback is 1. Dual-number reduction sheafifies to an isomorphism, while raw affine-line values have sizes 4 and 2 over F₂. This distinguishes sheafified from raw representables. | Pass | None |
| §5.6 nonsubcanonicity | F₂[ε]/ε²→F₂ | Source ring has 4 elements, quotient has 2; all higher Čech terms equal the quotient. The class ε≠0 maps to 0, so the raw sheaf condition fails. | Pass | None |
| §6.1 strict-local valuation | k; aic V₁; closed skyscraper | Constant sections are Λ, H^q=0 for q>0. Closed skyscraper gives Λ on V₁ and 0 on Frac V₁, so the generic stalk cannot replace the closed stalk. | Pass | None |
| §6.2 strict-local detection | Spec F₂ versus Fbar₂ | H¹(F₂,F₃)=F₃ from the procyclic Galois group; H¹(Fbar₂,F₃)=0. Global values cannot simply be replaced by one strict-local value. | Pass | None |
| §6.5 finite valuation-chain objects | Rank 0, rank 1; split fold | Rank 0 gives FinSet. Rank 1 has a closed-to-generic injection S_closed→S_generic; D(t) has ∅→{*}, while the fold has {1,2}→{1,2}. | Pass | None |
| §6.6 étale-object arc-descent | Fold of a geometric point | A descent pair of finite sets with sizes 2 and 3 admits 0 gluing isomorphisms; matching two copies of a fixed 2-element set with an isomorphism descends to that set. | Pass | Conditional v-descent contract retained |
| §7.3 chain complexes | Rank 0; closed skyscraper; Λ=Z/4 | Rank 0 is one Dᵇ_fg vertex. Rank 1 skyscraper has Λ→0. Tor_i^(Z/4)(Z/2,Z/2)=Z/2 for every i≥0, so bounded constructible is larger than perfect. | Pass | None |
| §7.4 h-form functors | Point; affine line; dual numbers | F₀(k)=k; F₁(k)=0; F₁(k[t])=k[t]dt. F₀(k[ε]/ε²)=k, versus naive Ω⁰=k⊕kε. | Pass | None |
| §7.5 smooth comparison | k; k[t]; singular dual-number control | Both sides are k in degree 0 at i=0 on a point, and k[t]dt at i=1 on A¹. Raw Ω⁰ of dual numbers has dimension 2 but h-forms dimension 1. | Pass | None |
| §7.6 differential excision | Field valuation; aic V₂; prime ideal | For a field p=0 all prime-square maps have an identity side. In an aic value group each positive value γ has γ/2>0, giving p=p²; tensoring a flat differential module preserves the kernel square. | Pass | None |
| §7.7 Perf arc-hyperdescent | Perfect field; nilpotent perfection; fold | Perfection of F_p[ε]/ε²=F_p. Fold descent of k[0] gives k[0], rank 1 in degree 0 on both sides. Z/2 over Z/4 has nonzero Tor in every degree and is not a Perf control. | Pass | None |
| §7.8 perfect predicate | p=0,1,2,3,4; dual numbers; perfected polynomial | At p=0,1 nonzero schemes fail. F₂ at p=4 passes the raw predicate; prime hypothesis excludes it. ε^p=0≠ε, t has no pth root in F_p[t], and t^(1/p²) maps to t^(1/p). | Pass | None |
| §7.8 qcqs object property | Empty; perfect affine; infinite disjoint points | Empty and perfect affine satisfy all 3 conjuncts. Infinite discrete points have infinite open-component cover with no finite subcover, so compactness=false though perfection=true. | Pass | None |
| §7.8 universal effective epi iff | Identity; fold; ∅→Spec F_p; generic V₁ | Identity and fold satisfy both sides. Empty→point has 0 valuation lifts and two different maps to a 2-point scheme agreeing on ∅, so epi=false. Generic equalizer is Frac V₁≠V₁ and the closed test fails. | Pass | None |
| §8.1 formal datum | Z→Z_p; I=0,1; (x,y) | Quotients on both sides are Z/pⁿ. I=0 requires B=A; I=1 gives zero quotients for every map. (0,1),(1,0) lie in D(x)∪D(y), but neither lies in D(xy). | Pass | None |
| §8.4 rank-one completion | Complete V₁; field; V₂ at x | Complete V₁ maps identically, with kernel 0 and unchanged maximal ideal. A field has no nonzero nonunit t. In V₂, y=xⁿ(y/xⁿ) for all n, so completion kills y≠0; rank-one hypothesis excludes it. | Pass | None |
| §8.5 completion/open cover | I=0,1; V₂ at x | I=0 completion=A and open=∅. I=1 completion=0 and open=Spec A. Rank-two identity test cannot invert x on the open or kill y in the completion. | Pass | None |
| §8.6 formal glueing | Identity datum; I=0,1 | With identity datum, F(B)×_(F(U))F(U)=F(A). For I=0 the open value is terminal and B=A. For I=1 the two open maps are identities, so the pullback is F(A). | Pass | None |
| §8.7 rigidity | Constant functor; finite étale over Z_p; ring functor | Constant comparisons are identity. Finite étale categories over Z_p and F_p agree. Underlying rings differ: p≠0 in Z_p but p=0 in F_p. | Pass | None |
| §8.8 punctured rigid comparison | (Z_p,(p)), constants; I=0 | Completion is already Z_p, so both punctured terms are the same RΓ(Q_p,Λ). For I=0 both punctures are ∅ and both complexes are 0. | Pass | None |
| §8.9 open/support comparison | I=0; A complete; Z=∅ | A=Â gives identity on every U and support complex. Empty support gives 0→0. With parameter a=0, henselian completion is A and U can be arbitrary; no single-open substitution is used. | Pass | None |
| §9.1 arc_t topology | t=0,1; Z_p→Q_p | t=0 and t=1 have 0 pseudouniformizer tests, so all maps pass. At t=p, identity V=Z_p would have to make the nonunit p invertible in W, contradicting locality. | Pass | None |
| §9.2 Tate-pair detection | Identity Cp; empty source | Identity has 1 generic rank-one point and a lift; empty source has 0 points and misses it. Higher-rank specializations are not part of this rank-one count. | Pass | None |
| §9.3 arc_t equivalences | Identity; Z_p[x]/px→Z_p; inversion | A map to a p-torsion-free test sends px=0 to x=0, so precomposition is bijective. For V→V[1/t] with t nonunit, the identity V-map has 0 extensions. | Pass | None |
| §9.4 completed generic cohomology | Complete aic V₁; t=0,1 | Nondegenerate generic field gives Λ[0]. At t=0 localization is 0; at t=1 completion is 0; both yield the zero complex, not Λ[0]. | Pass | None |
| §9.5 hyperdescent | Identity hypercover; cohomological shifts | Identity totalization of Λ[0] is Λ[0]. Ω^∞ of Λ[0] is discrete and Ω^∞ of its k-fold spectral suspension has only π_k=Λ, fixing the finite truncation bound k. | Pass | None |
| §9.6 extended proper comparison | Empty; A=O_(C_p), X=one/two generic points | Empty gives 0=0. One point gives H⁰=Z/pⁿ and H^q=0 for q>0 on both sides; two points give (Z/pⁿ)². A is nonnoetherian but its completed generic field is strongly noetherian. | Pass | Made the promised extension an explicit target |
| §9.7 fixed-denominator closure | Z_p; unit t; rank-two V₂ | p^c(p⁻¹)^n=p^(c−n) leaves Z_p when n=c+1. Unit t gives A[1/t]=A. In V₂, x⁻¹ is ordinarily almost integral with denominator y, since v(y/xⁿ)=(1,−n)>0, but no fixed x^c clears all powers. | Pass | None |
| §9.8 equivalence invariance | Completion; killing p-torsion; arbitrary cover control | E_p(Z_p)=E_p(completion)=RΓ(Q_p,Λ). Killing the x-class in Z_p[x]/px leaves the same test maps. A cover such as V→V⟨T⟩ has distinct evaluations T=0,1, so cover alone is not uniqueness. | Pass | None |
| §9.9 universal homeomorphism | Purely inseparable field extension; dual numbers | Spec F_p(s^(1/p))→Spec F_p(s) is radicial with 1 geometric point over each point; their étale sites agree. Dual-number reduction has constant quotient Čech nerve and sheafification identifies both objects. | Pass | None |
| §9.10 common-closure excision | Identity; integral order inclusion at p | For identity A=B, square has identity vertical maps. For A=Z_p and B=A the total closures and both special/generic rings agree; with t=1 both special rings are 0 and generic equality forces A=B. | Pass | None |
| §10.0 affinoid presentation | 0 variables; unit quotient; K⟨T⟩/(T²) | 0 variables give K. Unit quotient gives 0. In the last quotient T≠0 but T²=0; reduction is not a hypothesis. | Pass | None |
| §10.0 torsion predicate | 0; Z/6; Z; direct sum Z/ℓʳ | 1 annihilates 0; 6 annihilates Z/6; n·1=n≠0 in Z for n>0. A finite-support section with largest r is killed by ℓʳ, with no common exponent across the whole direct sum. | Pass | None |
| §10.0 prime-power predicate | Z/ℓ²; Z/r, r≠ℓ; ℓ=0,1 | ℓ²·1=0 but ℓ·1≠0 in Z/ℓ². ℓⁿ·1≠0 in Z/r. At ℓ=0 every sheaf passes with n=1; at ℓ=1 only x=0 passes. | Pass | None |
| §10.1 rational-domain vanishing | (X,1) at 0; n=0; char p,n=1 | max(0,1)=1, min=0. A zero-dimensional geometric model has H^q=0 for q≥1. Artin–Schreier gives H^q=0 for q≥2 on a characteristic-p affine curve, matching q>1. | Pass | Existing maximum correction retained |
| §10.2 rational Mayer–Vietoris | f=1,g=0; f=g=1 | First two domains are ∅ and the whole space, intersection ∅, giving 0×₀RΓ(A,F)=RΓ(A,F). At f=g=1 all three algebras are A and the pullback is RΓ(A,F). | Pass | None |
| §10.3 shrinking tubes | r=0,1; f=0; f=1 | Relations U₀=f and πU₁=f agree under U₀↦πU₁. For f=0 all tubes are R; for f=1 all sufficiently small tubes are empty and R/f=0. | Pass | None |
| §10.5 valuation Künneth | R=R′=V₁; R=V₁/π; R=V₁[1/π] | Nondegenerate sides give F_ℓ⊗F_ℓ=F_ℓ. In either boundary case E_π=0, so both tensor and right-hand sides are 0. | Pass | None |
| §10.6 affinoid Künneth | K,K; K×K,K×K; 0,K | Dimensions of H⁰ are 1·1=1, 2·2=4 and 0·1=0; completed tensor rings are K, K⁴ and 0. | Pass | None |
| §10.7 constant bounds | d=0; contradiction arithmetic | A=K×K has H⁰=Λ² and H^q=0 for q>0. For d=0,1,2, a forbidden degree d+1 squares to 2,4,6, exceeding the general tensor bounds 1,3,5 by 1. | Pass | None |
| §10.8 arbitrary torsion bound | A=0,K,K×K; d=0,1 | The groups are 0, Λ and Λ² in degree 0, with higher groups 0 in these zero-dimensional examples. At bound d=1 the theorem begins at q=3, not q=2. | Pass | None |
| §10.8 sharper bound and trace | C₂,C₃; S₃; C_ℓ | Norms of residue primes are 1/2,1/3, not 1. For ℓ=2, Sylow index=3=1 mod2; for ℓ=3, index=2 and 2·2=1 mod3. In C_ℓ representations (g−1)^ℓ=0. | Pass | None |
| §11.1 complete-cover predicate | I=0,1; Z_p→Q_p | Zero-adic completion is V itself. Unit-adic completion is 0, so no nonzero complete valuation test exists. Z_p identity test cannot send p to a unit locally. | Pass | None |
| §11.2 products and qc opens | One/two factors; empty product | D(t) in rank-one V is Spec Frac V, one point instead of two. D((t,1)) has components Spec Frac V₁ and Spec V₂. Empty product has 0 components and one empty-cover section. | Pass | None |
| §11.3 formal-site comparison | p=0; dual numbers; pseudouniformizer control | Characteristic-p complete tests include fields and rank-one valuations. Every ε-map to them kills ε. Pseudouniformizer-only p-tests have 0 characteristic-p objects and cannot give the same topology. | Pass | None |
| §11.4 finite-ideal boundary formula | I=0,1,(x,y),(2,3) | For 0, R/I=R. For 1, all generic opens cover. Points (0,1),(1,0) each lie in one of D(x),D(y), neither in D(xy). In Z, D(2)∪D(3)=Spec Z but neither alone is all of it. | Pass | None |
| §11.5 completed/punctured hyperdescent | I=0,1; A=Z_p,I=(p) | At I=0 whole terms are RΓ(R,F), punctured terms 0. At I=1 both completion and henselization are 0, so all four terms are 0. At Z_p the completed and henselized comparisons are identities. | Pass | None |
| §12.2 generic perfectoid comparison | F_p; F_p×O_(C_p); completed root tower | First generic ring=0 and all groups=0. Second torsion-free image=O_(C_p), generic ring=C_p, H⁰=Z/pⁿ. Completed root tower is p-torsion-free and equals its powerbounded model. | Pass | Conditional model comparison retained |
| §12.4 formal-target descent | T=Spf Z_p; affine T with one coordinate; empty source | Base-compatible maps to Spf Z_p form a singleton. For T=Spf Z_p⟨T⟩, coordinate 0 and 1 give distinct maps, preserved by identity descent. Empty source has exactly one map to either target. | Pass | None |
| §12.5 proper henselian comparison | X=P¹ over (k[[t]],(t)), k algebraically closed of characteristic zero; constant F₂ | H⁰ on both sides is F₂; H² is F₂(−1), one-dimensional. For empty X all groups on both sides are 0. | Pass | None |
| §12.6 tilting cover iff | Identity O_(C_p); char-p identity with ϖ=0 | Identity lifts with W=V on both sides. In char p, 0^p divides p=0 and 0-adic completeness is automatic; perfect A has A♭=A and the predicates both reduce to ordinary arc. | Pass | None |
| §12.7 three hyperdescent maps | Identity over F_p; over 0 | Identity totalizations are F_p, F_p and W(F_p)=Z_p, respectively. For zero ring all three are 0. Direct perfection of an F_p-ring would not produce the Witt-vector Z_p value. | Pass | None |
| §0.1 field equivalence API | Algebraically closed k and Q | All monic quadratics split in k; T²−2 has 0 rational roots. A field is integrally closed in itself on both sides of the domain formulation. | Pass | None |
| §0.1 quotient API | k×k→k and k→0 | Roots project coordinatewise; a root pair (a,b) maps to a. In the zero quotient every polynomial value is 0. | Pass | None |
| §0.1 localization API | Aic V₁→Frac V₁ | A monic root integral over V₁ belongs to V₁; after inverting t it has the same polynomial value 0 in Frac V₁. | Pass | None |
| §0.1 domain equivalence API | Valuation ring of algebraic closure of Q_p | Fraction field is Qbar_p and roots of a monic integral polynomial have nonnegative valuation. The root value is 0 in the polynomial on both rings. | Pass | None |
| §0.6 spectrum order API | V₂ intervals | [0,p] has 2 points ordered 0⊂p, [p,m] has 2 ordered p⊂m; singleton [p,p] has 1. | Pass | None |
| §0.6 interval maps API | [0,m]⊃[0,p]⊃[p,p] | Ring maps send x to an invertible element and then its residue; y maps to y and then 0. The composite sends x↦x mod p and y↦0 by either route. | Pass | None |
| §0.6 aic inheritance API | Aic V₁ and its singleton intervals | Residue and fraction fields are algebraically closed; T²−a has a root in either field, giving value 0. | Pass | None |
| §0.6 shrinking-colimit API | Constant interval; [0,m]→[p,p] | Constant colimit=V₂. Invert V₂\p and quotient p to obtain κ(p), matching the singleton interval ring. | Pass | None |
| §1.1 split-map API | Fold over F₂ | Section chooses the first factor; 2 diagonal elements descend from 2 base elements. | Pass | None |
| §1.1 base-change API | Fold after base change k→k[t] | Source algebra becomes k[t]×k[t]; equalizer is {(a,a):a∈k[t]}≅k[t]. | Pass | None |
| §1.1 composition API | Two successive binary folds | Composite has 4 sheets; kernel-pair equality forces all 4 entries equal, giving k rather than k⁴. | Pass | None |
| §1.1 cancellation API | Split projections on 4→2→1 points | Both composites have sections; diagonal descent sets have cardinalities 2,2,2 over k=F₂. | Pass | None |
| §1.3 generator API | Open cover; identity blowup | Two affine opens generate their union by descent. Identity modification gives E=Z and square pullback F(X)×_(F(Z))F(Z)=F(X). | Pass | None |
| §1.3 base-change API | Blowup square over k→k′ | E=P¹_k base changes to P¹_k′; complement stays A²_k′\{0}. | Pass | None |
| §1.3 square arrows API | Z=X,Y=∅ | E=∅; four corners are ∅,∅,X,X, with the bottom map identity. | Pass | None |
| §2.5 affine agreement API | Spec F₂ identity | Ring and scheme tests both take W=V and yield the commuting identity square; the class 1 maps to 1. | Pass | None |
| §2.5 isomorphism transport API | k[x] with x↦x+1 | Inverse sends x↦x−1; both composites send x to x. A valuation lift transports by these inverse substitutions. | Pass | None |
| §2.5 composition/base-change API | Polynomial sections and dual-number reduction | Setting two variables to zero sends both to 0 under composition. Reduction base change to V gives V→V, an identity. | Pass | None |
| §2.5 cancellation API | A→A[x]→A[x,y] | A lift with x=y=0 restricts to x=0; every scalar a remains a. | Pass | None |
| §2.7 affine compatibility API | Rank-two split | Ring maps invert x on one branch and kill y on the other; spectra reverse these arrows to the same 3-point covering map. | Pass | None |
| §2.7 isomorphism API | Identity point and coordinate automorphism | Under x↦x+1 and its inverse the test map returns x to its original value; surjectivity remains 1→1 on a point. | Pass | None |
| §2.7 composition/base-change API | Folds after k→k[t] | Fibre has 4 points under double fold; a chosen component lifts with W=V. Base change keeps the zero-evaluation section. | Pass | None |
| §2.7 cancellation API | Two polynomial extensions | The lift y=0,x=0 projects to x=0 with unchanged valuation extension V→V. | Pass | None |
| §3.1 mapping-bound API | Compact finite set with 2 points | Map({0,1},S)=S² is 0-truncated for every discrete S, not just for singleton S. | Pass | None |
| §3.1 equivalence detection API | Map of sets S→T | Testing the compact singleton yields exactly S→T; a 2→1 constant map fails bijectivity on this test. | Pass | None |
| §3.1 bounded-derived API | Z[−1] and Λ[0] | Map(Z[−1],Λ[0]) has π₁=Λ, π_i=0 for i>1; the finite bound is 1. | Pass | None |
| §3.1 truncated-spaces API | 0-truncated spaces | Map(1,S)=S has π_i=0 for all i>0; all finite sets are compact with bound 0. | Pass | None |
| §3.2 affine criterion API | Representable A¹ and polynomial tower | colim k[t₁,…,t_n]=k[t₁,t₂,…] on both sides of the comparison. | Pass | None |
| §3.2 naturality API | x↦x² on A¹ | The colimit image of t₁ maps to t₁² both before and after taking the comparison. | Pass | None |
| §3.2 finite-limit API | Two A¹ section functors | Filtered colimit of A_i² maps bijectively to (colim A_i)²: a pair of polynomials occurs at the maximum of their two finite stages. | Pass | None |
| §3.2 torsion continuity API | Constant coefficient diagram at geometric point | RΓ(k,Z/n)=Z/n[0]; colimit along divisibility is Q/Z[0] on either side, with no higher cohomology. | Pass | None |
| §3.5 singleton API | Identity descent map | Pullback of f along id is f, not a new condition; an empty→point counterexample retains the comparison 2→1. | Pass | None |
| §3.5 composition API | 4-point→2-point→point folds | Each level has a section; after composing there are 4 lifts of a point, at least one, and equalizer cardinality remains 2 over F₂. | Pass | None |
| §3.5 limit API | Polynomial tower identity detecting family | Finite-stage section 0 extends to zero on every variable; its limit section still sends every t_i to 0. | Pass | None |
| §3.5 product API | Two identical field tests | Product map k→k² has a projection section, and its Čech equalizer is k with 2 elements when k=F₂. | Pass | None |
| §3.6 principal-fibre API | F₂×F₃ | Projection onto F₂ has spectrum a single point; the other projection has one point too, totaling 2 components. | Pass | Added prose API |
| §3.6 valuation-component API | V₁×k | Connected components have respectively 2 and 1 points, with the unique proper specialization only in the first. | Pass | Added prose API |
| §3.6 family naturality API | Two identity ring maps | Characteristic idempotents (1,0),(0,1) stay fixed, so both principal ultrafilters and their fibres remain fixed. | Pass | Added prose API |
| §3.8 stalk API | Two factors; B=A | Principal stalks are F(A₁),F(A₂); A⊗_A A_i=A_i, so the tensor variant gives the same stalks. | Pass | None |
| §3.8 global-section API | F underlying ring sets, F₂×F₃ | Global set has 2·3=6 elements, equal to the set of the product ring. | Pass | None |
| §3.8 naturality API | Ring endomorphism id on each factor | At every stalk and on globals the value is the identity; each element (a,b) maps to (a,b). | Pass | None |
| §3.8 equivalence API | Bijections on two factors | Product of bijections on 2- and 3-element sets is a bijection on the 6-element product. | Pass | None |
| §4.3 canonical comparison API | V₂, element 1 | 1↦(1,1), with residue 1=1; (1,0) is excluded by 1≠0 in κ(p). | Pass | None |
| §4.3 excision implies aic API | Endpoint p=0 | Pullback is V×_(Frac V)Frac V=V, with projection to V inverse to its comparison. | Pass | None |
| §4.3 endpoint API | p=m | V_m=V, κ(m)=V/m, giving V×_(V/m)V/m=V. | Pass | None |
| §4.3 pointwise-limit API | Product of two terminal functors | Every vertex is 1×1=1; its Milnor pullback and pointwise limit are both 1. | Pass | None |
| §5.1 finite-subfamily API | Infinite Z_(p) family | A finite selection p₁,…,p_r misses F_q for q outside the selection, with 0 compatible lifts; including Z_(q) gives one. | Pass | None |
| §5.1 affine-basis API | P¹_k covered by two A¹ charts | Intersection is G_m; both charts and their intersection use countable finite-variable coordinate rings if k is countable. | Pass | None |
| §5.1 bounded-tests API | Spec F₂ | Its aic test Fbar₂ is countable, hence <κ for uncountable κ; identity lift still uses W=V. | Pass | None |
| §5.1 cutoff API | Spec F₂ at κ<κ′ | Same one-point object lies in both sites; the represented identity section remains a singleton. | Pass | None |
| §7.4 finitary-value API | k[t₁,…,t_n] increasing to A | Ω¹(A/k)=⊕_(i≥1)A dt_i; each differential uses finitely many generators, matching colim Ω¹. | Pass | None |
| §7.4 smooth-value API | A¹ and a point | RΓ_Zar(A¹,Ω¹)=k[t]dt[0]; on the point it is 0. These are also the h-values. | Pass | None |
| §7.4 ind-smooth API | k[t]_(t) | Localized differential dt generates Vdt in degree 0; d(1/(1+t))=−dt/(1+t)² on both descriptions. | Pass | None |
| §7.4 Hodge shift API | A¹, i=1 | gr¹ is k[t]dt[−1]; it has H¹=k[t]dt and H⁰=0, fixing the negative shift. | Pass | None |
| §7.8 perfect open-restriction API | D(t) in perfected polynomial ring | Frobenius sends t^(−1/p) to t⁻¹ and has inverse on every localized monomial; p remains 0. | Pass | None |
| §7.8 affine equivalence API | F_p[t] versus its perfection | t has 0 pth roots in the first; it has t^(1/p) in the second, uniquely. The sectionwise predicates match. | Pass | None |
| §7.8 isomorphism API | Two-coordinate perfect polynomial swap | Swapping s,t twice returns s,t; Frobenius and swap both send s^(1/p) to t by either order. | Pass | None |
| §7.8 full morphism API | Fold of perfect points | Both component maps send 1↦1, preserve the unique F_p-structure and are retained; the fold is not injective on points. | Pass | None |
| §7.8 fibre-product API | Fold pulled back along itself | The product has 2·2=4 perfect affine field components; Frobenius is bijective on each. | Pass | None |
| §7.8 object-isomorphism API | ∅ and Spec F_p | Section rings of ∅ have 1 element; Spec F_p has p. Both are affine, qcqs and perfect for prime p. | Pass | None |
| §8.1 quotient-compatibility API | Z→Z_p, n=2→1 | Both quotient maps send a mod p² to a mod p, with 1↦1 and p↦0. | Pass | None |
| §8.1 completion API | A complete along I | A/Iⁿ=(Â)/Iⁿ on both sides, and for A=Z_p the comparison is the identity on pⁿ residue classes. | Pass | None |
| §8.1 base-change API | Z→Z_p along Z→F_p | The new map is F_p→F_p, I becomes 0, and every positive-power quotient is F_p on both sides. | Pass | None |
| §8.1 qc puncture API | I=(x,y) | U=D(x)∪D(y) has a finite 2-open cover; points (0,1),(1,0) each require a different open. | Pass | None |
| §8.1 zero ideal API | I=0, A→B | n=1 comparison is A→B itself, so a datum forces exactly an isomorphism. | Pass | None |
| §8.1 unit ideal API | I=A | Every quotient is 0 with 1 element; the unique map is an isomorphism regardless of A→B. | Pass | None |
| §8.7 pair-comparison API | Finite étale functor over Z_p→F_p | Unramified degree-r covers reduce to F_(pʳ); rank r is retained for r=1,2. | Pass | None |
| §8.7 limit API | Product of two constant functors at {0,1} | Every pair comparison is identity on a 4-element product. | Pass | None |
| §8.7 naturality API | Maps of constant-valued functors | For x↦x² on a constant ring-valued functor, both sides send x to x²; quotient comparison is identity. | Pass | None |
| §8.7 successive-quotient API | k[ε]/ε³→k[ε]/ε²→k, constant functor | Both comparisons and their composite are identity on the same value; underlying ring dimensions 3→2→1 show why rigidity is additional. | Pass | None |
| §9.1 composition API | Two identity covers of Z_p | The composite sends p to p, W=V=Z_p; no rank change occurs. | Pass | None |
| §9.1 arc-to-arc_t API | Split fold Z_p→Z_p² | Project onto one factor for every pseudouniformizer test; p stays a nonzero nonunit. | Pass | None |
| §9.1 complete aic API | O_(C_p), t=p | It is already complete aic rank one; W=V has valuation v(p)=1 and the identity lift. | Pass | None |
| §9.1 boundary-cover API | t=0 and t=1 | Added R/t factor is R at 0; added R[1/t] factor is R at 1. Either supplies an identity component. | Pass | None |
| §9.3 composition/base-change API | Identity and reduction | Two successive identity precompositions give the same Hom set. Reducing ε²=0 after base change to a domain kills ε and gives a unique factorization. | Pass | None |
| §9.3 diagonal API | Identity R→R | R⊗_R R=R; multiplication and both projections are identity, so diagonal tests are bijective. | Pass | None |
| §9.3 power-torsion API | Z_p[x]/px | p·x=0 and p≠0 in V force x=0; exactly one lift of each coefficient map remains. | Pass | None |
| §9.3 completion API | Z_p with t=p | Completion is Z_p; every Hom set is unchanged, in contrast to generic inversion with 0 lifts of the identity. | Pass | None |
| §9.3 integral-closure API | Integrally closed complete V₁ | Its integral closure in Frac V₁ is V₁, so restriction is identity on maps. | Pass | None |
| §9.4 henselian comparison API | Already henselian complete Z_p | Henselization and completion are Z_p, so both localized rings are Q_p and both cohomology objects coincide. | Pass | None |
| §9.4 continuity API | Constant algebra diagram at Z_p | Filtered colimit is Z_p and canonical comparison is identity on RΓ(Q_p,Λ). | Pass | None |
| §9.4 boundary API | R/t and R[1/t] | In the first t=0; in the second completion=0. Both completed localized rings have 1 element and all cohomology groups 0. | Pass | None |
| §9.4 functoriality API | Identity and zero-coordinate section | A section T↦0 sends each coefficient a to a; two identity compositions induce identity cohomology pullbacks. | Pass | None |
| §9.7 membership API | x=p⁻¹ over Z_p | For each chosen c, n=c+1 gives p^c x^n=p⁻¹∉Z_p; membership is false. Allowing c=n would incorrectly pass. | Pass | None |
| §9.7 integral inclusion API | x∈A | c=0 gives xⁿ∈A for every n, including n=0 where x⁰=1. | Pass | None |
| §9.7 noetherian equality API | A=Z_p | Both ordinary integral and fixed-p-denominator closures in Q_p are Z_p; p⁻¹ belongs to neither. | Pass | None |
| §9.7 test-bijection API | Complete rank-one V₁ | Negative v(x) makes c v(t)+n v(x)<0 for large n, contradicting membership; admitted x have nonnegative value and the map is unique inside Frac V₁. | Pass | None |
| §10.0 presentation transport API | K⟨T⟩, T↦−T | The continuous involution squares to identity and fixes every scalar; quotient presentation remains open and surjective. | Pass | None |
| §10.0 quotient API | K⟨T⟩/(T²), then /(T) | First quotient has K-basis 1,T; the second is K. The composite kills T and fixes 1. | Pass | None |
| §10.0 Tate presentation API | 0 variables | Completed series ring is K, and the structure map is identity, with 1↦1. | Pass | None |
| §10.0 torsion subquotient/extension API | 0→Z/2→Z/4→Z/2→0 | Annihilators of end terms are 2,2; their product 4 annihilates the middle; 2·1≠0 in Z/4 excludes using just one exponent. | Pass | None |
| §10.0 torsion restriction API | Constant Z/6 on geometric points | Every restricted section remains killed by 6; the section 1 is still nonzero on a nonempty point. | Pass | None |
| §10.0 affine-basis torsion API | Two-point affine cover, exponents 2 and 3 | Product exponent 6 kills both local sections, while 2 alone fails on Z/3 and 3 alone fails on Z/2. | Pass | None |
| §10.0 primary-to-torsion API | Z/ℓ², ℓ prime | ℓ²>0 and annihilates every section; the required positive annihilator is exactly a natural power. | Pass | None |
| §10.0 primary extension API | 0→Z/ℓ→Z/ℓ²→Z/ℓ→0 | Powers ℓ¹ and ℓ¹ multiply to ℓ², which kills 1; ℓ¹ does not. | Pass | None |
| §10.0 primary restriction/basis API | Two components with exponents ℓ,ℓ² | Common exponent ℓ² kills both; restricting to the first component needs only ℓ. | Pass | None |
| §11.1 zero-ideal API | V₁ with I=0 | V₁/0ⁿ=V₁ for every n≥1; completion=V₁ and ordinary arc tests are identical. | Pass | None |
| §11.1 ideal-inclusion API | 0⊂(p)⊂(1) over Z_p | Tests go from all rank-one valuations to p-complete ones to 0 tests. A cover passing the first class passes the smaller two classes. | Pass | None |
| §11.1 mod-I API | Z_p→Z_p identity | Reduction is F_p→F_p; every characteristic-p valuation test lifts identically, p=0. | Pass | None |
| §11.1 closure API | Identity, then polynomial-section maps | Composition chooses both coordinates 0; any complete valuation V remains V under base change and section lifting. | Pass | None |
| §11.1 faithful-flatness API | R→R² | Modulo Iⁿ, target module is two copies of R/Iⁿ, free of rank 2 and faithful; choosing either projection gives a valuative lift. | Pass | None |
| §11.4 generating-tuple API | (x,y) and (x,y,x+y) | At (0,1),(1,0), at least one generator is nonzero in each tuple; both generate the same ideal and the union of opens is unchanged. | Pass | None |
| §11.4 closure API | Identity and base-changed polynomial section | Every nonzero proper IV test lifts with W=V; setting coordinates 0 does not change IV. | Pass | None |
| §11.4 boundary equivalence API | IV=0,V, or (t) proper | Zero case factors through R/I; unit case factors through some R[1/f_j]; proper case requires the S-factor. With I=(2,3) on Z, at prime 2 the generator 3 is a unit and at prime 3 the generator 2 is a unit. | Pass | None |
| Convention: zero rings/domains | 0, F₂ | Spec 0=∅, ring size 1; Spec F₂ has 1 point, ring size 2. `IsDomain` excludes 0, not F₂. | Pass | None |
| Convention: valuation extension | Identity; V₁→Frac V₁; V₁→κ(m) | Identity kernel=0 and reflects units. Inversion has kernel 0 but sends t nonunit to a unit. Residue map is local but kills t≠0. | Pass | None |
| Convention: rank and parameter | Field; V₁; V₂ | Spectrum lengths are 0,1,2. A field has 0 nonzero nonunits. In V₂, x has value (0,1) and y=(1,0), so rank-one completion statements do not apply. | Pass | None |
| Convention: Milnor datum | Node and rank-two square | k[x]×_k k[y]=k[x,y]/xy. Elements (1,0) have unequal residues and are absent; Tor-independence is not an extra test. | Pass | None |
| Convention: variance/interval arrows | V₂→(V₂)_p and V₂→V₂/p | On rings x becomes a unit or y becomes 0; on spectra the maps point into Spec V₂ from the smaller two-point intervals. | Pass | None |
| Convention: cohomological signs | Z[−1] | H¹=Z, H⁰=0. Identity two-arrow homotopy equalizer adds this H¹ term, while full totalization does not. | Pass | None |
| Convention: bounded constructible versus Tor | Z/2 over Z/4 | One nonzero H⁰ group is finite, but Tor_i=Z/2 for every i≥0. | Pass | None |
| Convention: universes | Countable field and finite affine charts | Finite unions and products of countable chart rings stay countable, hence below uncountable κ; κ is not itself admitted as a chart cardinal. | Pass | None |
| Convention: inverse tilt | Perfect F_p[t^(1/p^∞)] | A compatible sequence for t is (t,t^(1/p),t^(1/p²),…); direct Frobenius sends the second coordinate to t. Witt vectors over F_p give Z_p, not F_p. | Pass | None |
| Convention: analytic norm and residue prime | C₂,C₃ | Norms ‖2‖=1/2 and ‖3‖=1/3; other primes have norm 1. Thus algebraic invertibility in the generic field does not imply residue invertibility. | Pass | None |
| Worked two-term tube transition | r=0→1 | U₀↦πU₁ and U₀−f↦πU₁−f=0. At r=1→2, πU₁−f↦π²U₂−f=0. | Pass | None |
| Supplier complete-pair and torsion quotient | N killed by π^c; identity complete model | On N the π-adic tower is stationary N once n≥c, hence completion=N. Inverting π sends N to 0; the quotient and original completed generic fibres both identify with R̂[1/π]. | Pass | None |
| Supplier artin–Schreier range | Fbar_p and F_p | On Fbar_p, x↦x^p−x is surjective and H¹(Z/p)=0. On F_p the map is 0 and H¹(F_p,Z/p)=Z/p; only q≥2 vanishing is used on arbitrary affine characteristic-p models. | Pass | None |
| Supplier coherent quotient relation | Two points→one point | Relation has 2·2=4 ordered pairs; quotient has 1 point and both are compact/coherent. The cover is not monic. | Pass | None |
| Supplier finite étale approximation | Complete Z_p, t=p | Both localized rings are Q_p, so the base-change functor is identity. After killing p-torsion in Z_p[x]/px, quotient is Z_p and p acts injectively. | Pass | None |
| Supplier normalized perfectoid model | F_p×O_(C_p) | Kernel of generic inversion is F_p×0, image O_(C_p), generic ring C_p. This is why the missing general-model compatibility cannot be replaced by applying the normalized theorem directly to A. | Pass | None |

## Unresolved and limits of verification

The four substantive supplier extensions above remain the accepted conditional contracts; the fifth review condition is tracked with its narrowed use explained. HUB96 full text was not verified. No other unresolved port defect was found. Source comparisons and the computed ledger are mathematical checks, not kernel proofs of the five admitted theorems. No sub-agents were used, and no push, pull request, issue or comment was created.


Pull request: #1755 (roadmap/arc-topology-and-descent at dc09daf)
