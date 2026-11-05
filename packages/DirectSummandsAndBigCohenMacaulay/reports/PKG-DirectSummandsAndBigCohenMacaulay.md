# PKG-DirectSummandsAndBigCohenMacaulay

The package preserves all **52** accepted targets in eight layers, with every design API, Check and worked example. `packages/DirectSummandsAndBigCohenMacaulay/README.md` has **191** Checks. `Suggested.lean` contains eleven definitions with real bodies and nineteen headline theorems. The final main-file elaboration exits successfully with exactly **19** `sorry` warnings and no other messages. The dependency check reports **0 problems**.

Only the named deliverables and scratch work were edited. `metadata.toml` retains `topic = "math.AC"`. A structural comparison and a text comparison outside the top-level `gaps` value confirm that no other part of `design/plan.json` changed. No helper agents or GitHub writes were used, and no Lean process remains running.

## Inputs, coverage and upstream shape

The standalone `design/review.json` is absent. The accepted review is embedded in `design/plan.json`, dated 2026-10-18, with 52 target verdicts and source issues E1–E22. Its non-blocking mathematical notes were checked against the delivered statements. The inherited package and its audit were retained where sound. No suspicious instruction was encountered in the data read.

The supplied content checkout is the main snapshot `7bd35ba3`. The final resolver uses main `bfaaff1` and the index of 2026-10-25T05:45:13Z; the five main supplier READMEs were reread through the roadmap tool and agree byte-for-byte with the supplied copies after discarding the tool’s header. Both the manifest and checked-out libraries give Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The upstream shapes read are `TauCetiRoadmap/PerfectoidSpaces/README.md`, `TauCetiRoadmap/AdicEtaleGeometry/README.md` and `Completed/Multiquadratic/README.md`; metadata was compared with PerfectoidSpaces.

The design skeleton was regenerated from all 52 nodes, including statements, hypotheses, APIs, tests, acceptance examples, sources, prerequisites and proof steps. Its coverage map matches §§0.1–7.8. All eight layers end in Examples and Dependencies. The nine native predicates and two complex/unit definitions have prose API lists and at least three discriminating Checks; the full modification construction now also has its quotient, map, universal property and three explicit Checks.

## Headline list fixed before Suggested.lean


The following list was saved before writing the acceptance file. Names below are in `TauCetiRoadmap.DirectSummandsAndBigCohenMacaulay`.

| Headline | Verdict |
|---|---|
| Completion balances arbitrary big Cohen–Macaulay modules | Stated: `completion_balanced`. |
| Balanced big Cohen–Macaulay modules over regular local rings are faithfully flat | Stated: `balanced_faithfullyFlat`. |
| Pure algebras over complete Noetherian local rings split | Stated: `complete_pure_split`. |
| Characteristic-p direct summands | Stated: `directSummand_charP`. |
| André’s theorem for all finite injective algebras over W(k)[[T₁,…,Tₙ]] | Stated: `andre_unramified`. |
| Bhatt’s complete mixed-characteristic regular-local theorem, ramified and unramified | Stated: `bhatt_mixed`. |
| Perfectoid covers of regular local rings and their almost faithful flatness | Not statable at the pins: Integral perfectoid algebra and almost-module carriers. |
| Full/partial modification criterion and its double-sequence version | Not statable at the pins: The degree-bounded pointed modification, full algebra modification and finite/double-sequence carriers, with their finite-witness comparison. |
| Almost Cohen–Macaulay algebras yield balanced big Cohen–Macaulay algebras | Stated: `almostCM_exists_balanced`. |
| R⁺ is balanced in characteristic p for local domains that are quotients of Gorenstein local rings | Stated: `absoluteIntegralClosure_charP`. |
| Balanced-algebra existence in equal characteristic zero | Stated: `exists_balanced_charZero`. |
| Balanced-algebra existence for every Noetherian local ring | Stated: `exists_balanced`. |
| Weak functoriality for injective complete mixed-characteristic domain maps with regular target and separable residue extension | Stated: `weakFunctoriality_regularTarget`. |
| The direct summand theorem for every Noetherian regular ring | Stated: `directSummand`. |
| Faithfully flat domination of finite covers | Stated: `finiteCover_flatDomination`. |
| Splitting into R⁺ over complete regular local rings | Stated: `absoluteIntegralClosure_split`. |
| The monomial theorem, in its standard noncontainment form | Stated: `monomial_noncontainment`. |
| Cohen–Macaulay descent for the pure mixed-characteristic local maps of the design | Stated: `pureSubring_cohenMacaulay`. |
| Finite covers killing positive coherent derived cohomology in characteristic p | Not statable at the pins: The canonical finite-cover comparison between the two relative derived pushforward functors, with its coherent positive-truncation interface. The pushforward objects themselves are native. |
| Splinters are exactly derived splinters in characteristic p | Stated: `splinter_iff_derivedSplinter_charP`. |
| Derived splitting over regular ℚ-algebras | Stated: `derivedDirectSummand_charZero`. |
| The derived direct summand theorem | Stated: `derivedDirectSummand`. |

The characteristic-p R⁺ theorem is stated in its full Gorenstein-quotient generality. The absence of a predicate named “Gorenstein” does not make it unstatable: finite self-injective dimension is available as `CategoryTheory.HasInjectiveDimensionLE (ModuleCat.of A A) n`, and the signature supplies a Noetherian local Gorenstein cover and its actual surjection to R. No complete-local special case substitutes for this theorem. The almost-Cohen–Macaulay hypothesis is also statable directly on native roots and ideal colons; it has a real definition rather than an unspecified almost-regularity field.

The monomial signature is the standard deep noncontainment assertion for m<n, including dimension zero. The positive-dimensional membership direction for m≥n is elementary divisibility and remains in the README. The pure-subring signature concludes that every parameter list is regular on B itself, which is the finite-ring Cohen–Macaulay criterion of SchemeAndStackFoundations §0.17.

## Corrections to the inherited package

- **Derived headlines restored.** The earlier file incorrectly classified the derived splitting theorems as unstatable. At the actual pin, Mathlib supplies additive pushforward on sheaves of modules, Grothendieck abelianness of the source, bounded-below right derived functors and their unit, and the geometric map O_Y→f_*O_X. `structureComplex` and `derivedUnit` specialize these native constructions with real bodies. `DerivedSplinter` tests that actual unit on proper surjective covers of Spec R; `Splinter` supplies the matching finite-cover predicate. The three derived splitting headlines are now stated, not replaced by degreewise cohomology or a free predicate. The README identifies the affine D(R) formulation through the supplied affine quasicoherent comparison. Only the full relative cohomology-killing comparison remains unstatable among the geometric headlines.
- **Generality of separability.** The old `SeparableResidueMap` used `Algebra.IsSeparable`, which entails algebraicity at the pin (`Mathlib/FieldTheory/Separable.lean:569`). André §4.4 permits separable residue extensions in the general field-extension sense. The predicate now uses `Algebra.IsTranscendentalSeparable` (`Mathlib/FieldTheory/TranscendentalSeparable.lean:72`) on the residue map induced by the specified local ring map. This restores the intended generality of `weakFunctoriality_regularTarget` and `pureSubring_cohenMacaulay`. The new Check 𝔽₂→𝔽₂(t) has transcendence degree 1 and separating basis t; it occurs for a faithfully flat local map of complete DVRs. An unrelated residue algebra structure remains excluded.
- **Quadratic trace.** The Check using the basis 1,√a now assumes a nonsquare. For a=1 the extension has degree 1 and Tr(1)=1, so the old unqualified value 2 was false. The trace theorem, which uses the actual extension degree and assumes it is invertible, is unchanged.
- **Boundary hypotheses.** The first-parameter quotient law and §4.6(b) explicitly require positive dimension. The coefficient-perfection statement §4.7(4) explicitly requires residue characteristic p. No headline was narrowed.
- **Full versus partial modifications.** The full polynomial-algebra quotient and its actual constant map are stated explicitly alongside the pointed scalar-polynomial module quotient. The Checks compute t²=0 in the full quotient and t²≠0 in the fixed-relation partial colimit. The finite bad-witness comparison remains its own theorem; no algebra structure is inferred from that module colimit.
- **Direction and choice.** The cone paragraph now uses an isomorphism of triangles between different cone choices. The weak-functoriality root-divisibility Check uses π=2, π′=4, with positive valuation for the allowed quotient and negative valuation for the reversed one.
- **Supplier facts and gaps.** The regular-surjection kernel theorem is imported from DeformationAndDerivedPatchingAlgebra §3.4, not requested as a gap in §3.2. Secant parameter-list existence, permutations and positive powers are imported from DeformationAndDerivedPatchingAlgebraPartII §K0.3; only the radical/transport bridge remains a gap there. The redundant request for all of PerfectoidSpacesPartII RA.0–RA.5 was deleted because these are stated in its permitted earlier design. Its ramified multi-element extension remains an exact gap.
- **Dependency evidence.** The earlier report's absence-from-order diagnosis is obsolete: PerfectoidSpacesPartII and this roadmap are adjacent in the supplied order, after the patching roadmaps, and the exact required dependency invocation succeeds. No order file was edited.

The earlier mathematical repairs remain: reducedness in the splinter definition; a nonzero maximal-ideal quotient for big modules; arbitrary-module completion rather than a finite-module substitute; separate height and Tor-degree indices; coefficient-compatible normal forms with zero constant term obtained by a unit; completion before choosing domain components; maximal-dimensional components for p-torsion rings; positive rank for the finite-free unit argument; the empty-parameter exception to the monomial equivalence; generic surjectivity in proper almost splitting; and a general non-Noetherian perfectoid-base domination contract. The characteristic-zero R⁺ warning was retained after reading BMPSTWW line 574: its trace obstruction is explicitly stated there.

## Source resolution

The manifest has fourteen lifetime keys: thirteen certified legal sources and settled, uncertified HH95. No settled source was requested again. The additional Stacks algebra chapter was fetched through the sources service under the existing STACKS key for tag 030O. Its definition was read at STACKS line 4671; it matches the native general separability class. The two earlier chapter extractions remain in `additional_texts`, with their hashes and line locators. No source extraction or source passage was copied into a deliverable.

Exact anchors used include ANDRE18B line 638 (big/almost definitions), line 664 (modifications), line 692 (almost-CM criteria), line 720 (existence), line 741 (faithful flatness), line 769 (almost squares), line 779 (regular-target construction), line 822 (pure-subring theorem), line 867 (purity) and line 912 (Hochster criterion); BHATT18 line 451 (complete flatness), line 469 (perfectoid covers), line 547 (Artin–Rees), line 563 (finite theorem), line 604 (derived theorem) and line 616 (proper almost splitting); HOCHSTER02 line 172 (full quotient), line 225 (partial quotient), line 249 (criterion) and line 258 (denominator lemma); HEITMANNMA18 line 123 (double sequences); HUNEKELYUBEZNIK line 75 (every finite intermediate extension); BMPSTWW line 507 (arbitrary modules), line 561 (existence) and line 574 (characteristic-zero trace obstruction); DATTAMURAYAMA line 1315 (non-F-solid Henselian DVR); BHATT12 line 38 (splinter equivalence) and line 42 (finite cohomology killing); CHASE60 line 139 (coherent products); KOVACS00 line 11 (rational-source hypothesis). The Stacks higher-coherence locator STACKS line 2350 belongs to its coherent chapter extraction; the Hom base-change locator STACKS line 13484 belongs to its more-algebra extraction.

HH95 remains cited only by its published locators. Its detailed characteristic-zero specialization proof is not certified by an unread paywalled text. No missing-reference request remains open. Source validation gives:

```text
packages/DirectSummandsAndBigCohenMacaulay/sources.toml: 0 problem(s)
```

## Duplication sweep and supplier ownership

The sweep used the pinned source files, main, the 352 open roadmap heads in the supplied index and board packages, with object searches through the supplied roadmap tools and `rg`. Searches included tensor-unit injections, regular sequences and parameter ideals, completions, arbitrary-module local cohomology, injective hulls and Matlis duality, full/partial modifications, Frobenius and trace, Kummer and annular towers, flat products, self-injective dimension, proper derived units and the end theorems. Main roadmaps were read on main; new roadmap contracts were read at their available heads. An open revision of a main roadmap was used only as an ownership lead, never as a replacement supplier contract.

| Construction removed from local ownership | Exact supplier or pin | Kept contribution |
|---|---|---|
| Native regular-ring and regular-local definitions | Mathlib `RingTheory/RegularLocalRing/Defs.lean`, lines 51 and 92 | Splinter conclusions, not a new regular-ring predicate |
| Weak and genuine regular sequences | Mathlib `RingTheory/Regular/RegularSequence.lean`, lines 135 and 146 | Arbitrary big/balanced module predicates, with nonzero quotient |
| Ordinary flatness and faithful flatness | Mathlib `RingTheory/Flat/Basic.lean`; `RingTheory/Flat/FaithfullyFlat/Basic.lean`, line 63 | Applications to balanced modules and domination |
| Completion carrier and finite-module completion | Mathlib `AdicCompletion`, `IsAdicComplete`; DeformationAndDerivedPatchingAlgebra §§1.13–1.15 | Arbitrary-module balancing |
| Generic Čech/Ext-colimit comparison and filtered-colimit local cohomology | DeformationAndDerivedPatchingAlgebraPartII §K0.1; SchemeAndStackFoundations §2.7 | Completion/change-of-parameters argument; characteristic-p finite-extension killing |
| Koszul carrier and native derived Hom/towers | DerivedModuleAlgebra §§0.K.1, 1.T.1, 1.1.1 | The finite perfect dual’s obstruction calculation and finite filtration |
| Injective-envelope interface | Tau Ceti `Algebra/Module/Injective/Envelope/Basic.lean` and `CategoryTheory/Injective/Envelope.lean` | Complete-local pure-to-split application |
| Arbitrary-residue-field Matlis duality and End(E)=R̂ | DerivedModuleAlgebra §1.M.2 | Tensor–Hom retraction proof, without arbitrary double duality |
| Regular local domain theorem | Tau Ceti `RingTheory/RegularLocalRing/Basic.lean`, line 123, `TauCeti.IsRegularLocalRing.isDomain` | Domain use in the absolute integral closure and reductions |
| Global/projective dimension over regular local rings and Kunz | EnhancedDerivedSheaves §E1.6 | Balanced-module flatness and Frobenius retraction |
| Cohen presentations, residue extensions, flat completion and finite completion factors | DeformationAndDerivedPatchingAlgebra §§1.9–1.14 | Coefficient-compatible mixed regular-local normal form and the relative gaps |
| Finite-module Artin–Rees Hom pro-isomorphism and lim¹ | DeformationAndDerivedPatchingAlgebra §1.15 | Adic splitting criterion and the degreewise finite-complex extension |
| Ordinary flatness from a complete reduction | DerivedDeRhamCohomology §1.10 | Application in the perfectoid-cover proof; no new supplier gap for this existing statement |
| Pseudo-coherent/perfect carriers and minimal models | DerivedModuleAlgebra §1.E.0; DeformationAndDerivedPatchingAlgebra §7.3 | The actual finite/proper unit cone |
| Generic distinguished-triangle vanishing/splitting test | Mathlib `CategoryTheory.Pretriangulated.Triangle.coyoneda_exact₃`, `exists_iso_binaryBiproduct_of_distTriang`; EnhancedDerivedSheaves §E1.8 | The algebra-unit Ext class and its reductions |
| Finite products of flat modules and finite faithful-product criterion | Tau Ceti `RingTheory/Flat/Pi.lean`, lines 62 and 75 | Arbitrary products over a coherent ring, explicitly a wider index set |
| Proper coherent pushforward | StableReduction Layer 2 | The finite affine Čech bound and regular-local perfection of the proper-unit cone |
| Quasicoherent flat/Tor-independent base change | SchemeAndStackFoundations §§2.6, 2.18 | Transport of these specific unit obstructions |
| Integral perfectoid models, root extension, almost purity and almost adjoints | PerfectoidSpaces P0–P3, especially P1.24–P1.25; PerfectoidQuotients §§0.7, 1.3–1.4 | The regular-local cover and commutative-algebra consequences |
| Principal ramification/Riemann theory, Kummer towers, tensor purity and Krull detection | PerfectoidSpacesPartII design §§RA.0–RA.5 | Earlier supplier design, read by RA section; no local duplication |
| Characteristic-zero resolution | ResolutionOfSingularitiesCharacteristicZero §5.5 | Derived splitting and the additional GR/approximation bridge |
| Ordinary bounded-below sheaf-derived pushforward and geometric unit | Mathlib `AlgebraicGeometry/Modules/Sheaf.lean:52,165`, `Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean:46,95`, `Algebra/Category/ModuleCat/Sheaf/PullbackFree.lean:59` | Two real adapters; no new pushforward or derived-category construction |
| General field-extension separability | Mathlib `FieldTheory/TranscendentalSeparable.lean:72` | The specialization to the actual induced residue map only |
| Regular-local surjection kernel generated by parameter prefix | DeformationAndDerivedPatchingAlgebra §3.4 | Its coefficient-compatible application in §3.1; deleted the redundant supplier gap |
| Secant parameter-list existence, dimension formula, permutations and positive powers | DeformationAndDerivedPatchingAlgebraPartII §K0.3 | The native parameter predicate and supplied radical/transport bridge; no competing parameter theory |

The board matches outside this roadmap were also inspected by object. AdicSpacesPartIIPartII concerns bounded extension on normal rigid spaces, not quantitative perfectoid annuli. StableReductionPartII uses a direct-summand property of a linear section projection, not the commutative-algebra direct summand theorem. The other parameter-system and Matlis hits are applications to purity, K-theory, deformation theory, dynamics or automorphic coefficients. They do not own the general big-module, pointed-modification or splinter constructions. No retained declaration uses another roadmap's fully qualified name.

PerfectoidSpacesPartII is supplied explicitly by this brief and occurs immediately before DirectSummandsAndBigCohenMacaulay in `merge-order/ORDER.txt`. Its RA.0–RA.5 sections were read in `packages/PerfectoidSpacesPartII/design/README.md`. The resolver still reports its absence from main and the open-head publication index; that index does not search board designs. This is a publication-index limitation, not an upward dependency. Its ordinary RA contracts are not a supplier gap. No foundational notion needed from a later roadmap was moved down: all suppliers are at the pins, on main, or explicitly permitted earlier roadmaps.

## Mathematical support and exact gaps

The four accepted proof obligations are retained: finite-equation characteristic-p specialization in §4.10; arbitrary-module completion and change of parameters in §0.5; the full/pointed finite bad-witness comparison in §4.3; and the characteristic-zero projective, field-extension and approximation bridges in §7.7. Their sources support the headline results, but the package does not claim the proof sketches discharge these obligations. In particular, the pointed quotient is a corrected construction whose full-algebra comparison is a theorem to prove.

The six supplier gaps are `ramified-multielement-kummer`, `common-cohen-extension`, `finite-parameter-subring`, `parameter-systems`, `perfectoid-base-modification-domination` and `grauert-riemenschneider`. Each has matching `slug`, `needs`, `supplier` and `section` fields in the top-level `gaps` list and an exact sentence in the corresponding README supplier subsection. General separability is explicit in the common-Cohen extension contract. The parameter-system bridge belongs to DeformationAndDerivedPatchingAlgebraPartII §K0.3. Ordinary complete flatness, proper coherence, and regular-surjection kernels are stated supplier theorems and have no added gap.

## Computed adversarial pass

The tables record actual values on explicit instances; they are not proofs of the general admitted theorems. All 52 target statements, defining predicates, API laws, conventions, gap contracts and source corrections were compared with these values. The final Check register uses the specific Check's own instance; it replaces inherited rows that reused unrelated section witnesses. Equalities and iff statements include both valid and failing sides where appropriate. The principal negative controls are the node, cusp, zero module/algebra, rationalized DVR module, smaller-dimensional component, square-zero noncoherent ring, inseparable field extension, square radicand and vertical proper cover. The Reynolds witness includes nonabelian S₃; p=2 and p=3 are both exercised.

### Additional corrections and construction laws

| Statement | Instances tried | Computed values | Result | Change |
|---|---|---|---|---|
| General separability in the Lean residue predicate | 𝔽₂→𝔽₂(t); 𝔽₂(t)→𝔽₂(t^(1/2)) | first has separating transcendence basis t and degree 1 above it; second has inseparable degree 2 and derivative 0 | Corrected | Use the pinned general separability class; keep the induced field algebra. |
| Full modification definition | T=R[t]/xt, k=0,u₁=t | target T/(t)=R; images of 1,t,t² are 1,0,0 | Pass | Explicit polynomial-algebra quotient. |
| Full modification relation law | relation yx=xy on R=k⟦x,y⟧ | in R[X]/(x−xX), [x]=x[X] | Pass | Actual constant algebra map specified. |
| Full modification evaluation law | same relation, X↦1 | x−x·1=0; every constant r maps to r | Pass | Universal property preserves the given T-map. |
| Full modification retraction law | zero relation y·0=x·0 | target R[X]/xX, X≠0 and xX=0; evaluation X↦0 fixes 1 | Pass | Retraction does not imply a free complement. |
| Residue-characteristic convention in coefficient perfection | ℤ₂ versus ℚ | residue characteristics 2 and 0; p=2 has prime value true and is a unit in ℚ | Corrected | §4.7(4) explicitly requires residue characteristic p. |
| First-parameter quotient and almost-CM criterion (b) | field with empty parameters; DVR with parameter 4 | field has length 0 and no first entry; DVR quotient ℤ₂/4≠0 | Corrected | Explicitly require d≥1 where x₁ is used. |
| Choice of cone | identity triangle and multiplication-by-2 triangle | cone objects 0 and ℤ/2; boundaries 0 and 1∈Ext¹=ℤ/2 | Clarified | Compare different cone choices by a triangle isomorphism, without identifying their carriers. |

### Target statements

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| §0.1: Linear unit retraction | ℤ⊆ℤ[i]; ℝ⊆ℂ; node normalization | ρ(1)=1, ρ(i)=0; Re(i²)=−1≠0=Re(i)²; x∈(x+y)S but x∉(x+y)R | Pass | Retain linearity, not multiplicativity. |
| §0.2: Splinter predicate | k; k[ε]/ε²; k[t²,t³]⊆k[t] | field unit projection 1↦1; ε²=0 with ε≠0; quotient of cusp extension has basis t and rank 0 | Pass | Reducedness remains explicit. |
| §0.3: Big module for a parameter list | k⟦X,Y⟧; zero module; ℚ over ℤ_(p) | successive quotients k⟦Y⟧,k; zero module quotient 0; ℚ/pℚ=0 although multiplication by p is injective | Pass | Nonzero maximal-ideal quotient retained. |
| §0.4: Balanced big module | R=k⟦X⟧, M=R and R/(X) | R/XR=k and X has kernel 0 on R; X·1=0 on R/(X), with 1≠0 | Pass | All parameter systems, arbitrary modules. |
| §0.5: Completion balances | R=k[X]_(X), M=R; M=0 | completion k⟦X⟧, X-kernel 0 and quotient k; completion of 0 and its residue quotient are 0 | Pass | Import generic Čech comparison; retain completion proof. |
| §0.6: Balanced implies faithful flatness | DVR A, C=A; C=Frac A | Tor_i(A/I,A)=0 for i>0, A/ϖA=k; Frac A/ϖ Frac A=0 | Pass | Separate height h from Tor degree i. |
| §0.7: Unit obstruction | id_A; 2:ℤ→ℤ; ℤ⊆ℤ[i] | cones 0, ℤ/2, ℤ; Ext classes 0,1∈ℤ/2,0 | Pass | Positive-rank finite free algebra required. |
| §0.8: Completion/component reductions | S=A×A/I with I≠0 | first projection has kernel 0 on A; second has kernel I; each diagonal unit maps to 1 | Pass | Complete before choosing a domain component. |
| §0.9: Divided trace | ℚ(√2); a=1; φ=(1+√5)/2 | quadratic traces (2,0), degree-one trace 1; Tr(φ)/2=1/2∉ℤ | Corrected | Require a nonsquare in the quadratic-basis Check. |
| §0.10: Dimension at most two | field and DVR; k[ε]/ε² over k | coefficient functional takes 1↦1, ε↦0; a finite torsion-free DVR module has torsion 0 | Pass | The target algebra need not be reduced. |
| §1.1: Endomorphism criterion | 𝔽₂⟦X⟧ with X↦X²; V⟦X⟧ with r fixed | rank 2 over the image; intersections of (X^{2ʲ}) are 0 and of (r,X^{2ʲ}) are (r) | Pass | r=0 or r regular, and injective extension endomorphism. |
| §1.2: Complete pure algebras split | field; non-F-solid Henselian DVR V | field projection has value 1; Hom_V(V^{1/p},V)=0, so every functional takes 1↦0 | Pass | Completeness cannot be replaced by Henselian excellence. |
| §1.3: Characteristic-p direct summand | p=2,3, A=𝔽_p⟦X⟧⊆A[X^{1/p}] | basis lengths 2 and 3; projections take 1↦1 and each fractional monomial↦0 | Pass | No restriction to odd primes or perfect original residue field. |
| §2.1: Adic splitting criterion | A=ℤ, I=ℤ, S=ℤ/2; M=ℤ/2 | all I-power quotients 0, but 1 has no retraction; Hom(M,ℤ)=0 versus Hom(M,ℤ/2ⁿ)=ℤ/2 with zero next-to-previous map | Pass | Jacobson condition and pro-comparison, not levelwise equality. |
| §2.2: Splitting modulo pᵐ | A=ℤ₂, g=1, m=1,2 | class of pg is 0 mod 2 and 2≠0 mod 4; splitting at level 2 reduces to level 1 | Pass | Detect first at m≥2. |
| §2.3: Unramified Witt-series theorem | n=0, k=𝔽₂; n=1 | base ring ℤ₂; a free basis containing 1 gives coefficients (1,0); adjoining one formal variable preserves that value | Pass | Zero variables included. |
| §3.1: Coefficient-compatible normal form | p−(p²+X²); p−X² | u=1−p is a unit and normalized f=X²/(1−p) has constant 0; p=X² in the ramified example | Pass | Zero constant term is normalized, not inferred from m². |
| §3.2: Perfectoid regular-local cover | A₀=ℤ₂; ramified p=X² | root valuations 1,1/2,1/4,…; gᵖ=p·u with u a unit; p becomes rooted in A | Pass | The K° structure belongs to A, not A′. |
| §3.3: Almost faithful flatness | A₀=ℤ₂, A=O_K, M=𝔽₂ | 2^{1/2} has valuation 1/2<1, so its class mod 2 is nonzero; Tor_i(A₀,A)=0 for i>0 | Pass | Almost zero does not erase the residue module. |
| §3.4: Obstruction detection | p=2, g=1, m=2,3 | p²g is 0 mod 4 and 4≠0 mod 8; nonzero Ext generator over ℤ₂ remains 1 modulo 2 | Pass | m≥3 and perfect-complex Hom comparison retained. |
| §3.5: Annular almost splitting | g=1; 𝔽₄/𝔽₂ | annular equation U=pⁿ gives the identity model; Tr(1)=0, Tr(ω)=1 and Tr(ω·1)=1 | Pass | Faithfulness, rather than invertible degree, fixes trace splitting. |
| §3.6: Annular limit argument | constant tower V; zero perfect complex | lim V=V, lim¹V=0; both Hom groups for Q=0 are 0 | Pass | Finite filtration and the relevant lim¹ are explicit. |
| §3.7: Bhatt mixed theorem | Y²−X−p over ℤ_p⟦X⟧, p=2,3 | basis 1,Y; ρ(1)=1,ρ(Y)=0; discriminant 4(X+p), with g mod p=X≠0 | Pass | p=2 is included, with its discriminant p-part. |
| §4.1: Almost Cohen–Macaulay predicate | D=O_K over ℤ₂; singular k⟦X,Y⟧/(XY,Y²), π=1; D=0 | parameter colon 0 in O_K, root valuation 1/2<1; singular colon contains Y≠0 and 1·Y=Y; zero algebra surviving-root condition false | Pass | Both colon annihilation and surviving root are required. |
| §4.2: Pointed partial modification | T=R[t]/(Xt), k=0; zero M | scalar quotient retains t²≠0, full quotient sends t²↦0; e=0 belongs to m·0 | Pass | No algebra structure inferred from the module colimit. |
| §4.3: Modification criterion | R=k⟦X⟧; T=R/(X) | evaluation preserves 1≠0 for R; relation X·1=0 gives partial quotient 0 for T, hence badness | Proof target retained | The finite full/pointed bad-witness comparison is separate. |
| §4.4: Denominator extension lemma | N=1,D=2; N=0,D=1; α(e)=0 versus 1 | ND+D+N=5 and 1; c^{-1}(c^{-2})²=c^{-5}; relation evaluates to x versus 0 | Pass | Degree bound positive and α(e)=1 explicit. |
| §4.5: Almost CM gives balanced CM | B=ℤ₂,D=O_K | v(2^{1/2ʰ})=2^{-h}<1=v(2), so the root is not in 2D; a bad sequence would force the opposite containment | Pass | No asserted algebra factorization through D. |
| §4.6: Almost-CM criteria | A=ℤ₂, x₁=4, g=1 | 2∈(π)∩A but 2∉4A; first parameter acts injectively on the torsion-free model | Pass | Specify the acting root setup and the surviving contraction. |
| §4.7: Big-CM reductions | B=ℤ₂⟦X,Y⟧/(2X,2Y) | dimensions of quotients by (2) and (X,Y) are 2 and 1; (2+X,Y) gives quotient ℤ₂/4 | Pass | Use a maximal-dimensional prime quotient. |
| §4.8: Mixed-characteristic balanced existence | B=ℤ₂⟦X,Y⟧/(2X) | dim B=2, char B=0; maximal-dimensional quotient B/(2)=𝔽₂⟦X,Y⟧ has char 2 and dimension 2 | Pass | p-torsion rings require the characteristic-p branch. |
| §4.9: Characteristic-p absolute integral closure | R=𝔽₂, A=𝔽₂, n=0 | self-injective dimension 0; empty parameters; R⁺/mR⁺=algebraic closure≠0 | Pass | Full Gorenstein-cover generality stated natively. |
| §4.10: Equal-characteristic-zero balanced existence | R=ℚ[ε]/ε², C=ℚ | dim R=0, εC=0, C/m_RC=ℚ≠0 | Proof target retained | Existence does not require an injective algebra map. |
| §4.11: Balanced existence in all characteristics | R=𝔽₂[ε]/ε², C=𝔽₂ | dim 0; empty list; m_RC=0 and residue dimension 1 | Pass | No reducedness or p-torsion-freeness requirement. |
| §4.12: Weak functoriality from almost squares | identity square; π=2,π′=4 in O_K | identity quotient 1; nonidentity root quotient has valuation 2^(−n), reverse quotient −2^(−n)<0 | Pass | Added a witness distinguishing the two divisibility directions. |
| §5.1: General direct summand | R=0,S=0; normal cubic Frobenius | 0=1 makes the unique retraction valid; c²≠0 in A/(a,b), but its image lies in (a,b)S | Pass | Zero global ring allowed; normality alone insufficient. |
| §5.2: Coherent flat products | ∏ℤ; empty product; R=k⊕V with V²=0 | integer multiplication has kernel 0; empty product residue 0; (x₁,x₂,…) is x₀-torsion outside VM | Pass | Infinite/coherent variant separated from the finite native theorem. |
| §5.3: Flat domination | S=ℤ₂×𝔽₂ over ℤ₂ | project to ℤ₂ with ρ(1)=1; Tor₁(𝔽₂,𝔽₂)=𝔽₂ on the smaller component | Pass | Choose a component receiving the base injectively. |
| §5.4: Absolute integral closure splits | complete DVR; Henselian nonsolid DVR | finite torsion-free subalgebra has basis coefficient 1↦1; nonsolid root algebra has dual 0 | Pass | Completeness retained; finite subalgebras need not be DVRs. |
| §5.5: Contraction and monomial theorem | k⟦X,Y⟧, n=2,m=1,2; d=0 | XY mod (X²,Y²)≠0, X²Y² mod that ideal=0; empty product 1∉0 for all exponents | Pass | The iff membership form requires d≥1. |
| §6.1: Purity under completion and compatible coefficients | k[X]_(X)→k[X,Y]_(X,Y) | evaluation Y=0 sends each Xⁿ to Xⁿ before and after completion; induced residue map is id_k | Pass | Common coefficient base change, not unrelated extensions. |
| §6.2: Weak functoriality with regular target | semistable target; ℤ₂→completion₂(ℤ₂[t]_(2)) | first has 2=TV∈m²; second has residue 𝔽₂(t), transcendence degree 1 and separating basis t | Corrected | General separability replaces algebraic separability in the actual induced residue map. |
| §6.3: CM descent with a CM square | identity on k⟦X,Y⟧ | (0):X=0 and (X):Y=(X); final quotient k≠0 | Pass | Contract each colon through the faithfully flat algebra, then the pure map. |
| §6.4: Pure mixed-characteristic subring is CM | ℤ₃⟦X²⟧⊆ℤ₃⟦X⟧ under C₂ | Reynolds(a+bX)=a, ρ(1)=1; residue map identity; parameter quotient 𝔽₃ has dimension 1 | Pass | The averaging denominator is 2, a unit at p=3, unavailable at p=2. |
| §7.1: Derived-splinter predicate | proper elliptic curve over field K; normal elliptic cone | RΓ(E,O)=K[0]⊕K[−1], projection of unit=1; cone has dim H¹(O_E)=1 obstructing rationality | Pass | Finite-only definition is excluded. |
| §7.2: Proper cohomology and unit-cone perfection | finite affine cover; elliptic curve E/k | with t affines, alternating terms are 0 in degrees ≥t; E has cohomology dimensions (1,1,0,…) | Pass | Perfection need not mean degree-zero concentration. |
| §7.3: Derived obstruction reductions | Spec(A×A)→Spec A | either generic component closure is Spec A, whose unit and projection compose to 1 | Pass | Pseudo-coherent Hom base change, then completion. |
| §7.4: Proper perfectoid almost splitting | Spec(A/p)→Spec A; identity cover | generic source empty; p·p^{1/pʰ}≠0 in torsion-free A but p acts as 0 on A/p; identity composite=1 | Pass | Generic surjectivity and non-Noetherian domination supplied explicitly. |
| §7.5: Finite cohomology-killing cover | [2] on E/𝔽₂; [3] on E/𝔽₃; identity | maps on H¹ are scalars 2=0,3=0,1≠0; positive amplitude is one | Pass | Ordinary affine cohomology is not a local-cohomology test. |
| §7.6: Splinter iff derived splinter in char p | field; characteristic-p node | field derived retraction on degree zero=1; node’s x is in the extended ideal but not in the original ideal | Pass | Lift the killed derived map to H⁰ preserving the unit. |
| §7.7: Characteristic-zero derived splitting | E/ℂ→Spec ℂ; elliptic cone | unit (1,0) in ℂ[0]⊕ℂ[−1] projects to 1 although H¹ has dimension 1; cone not rational | Proof target retained | Retain projective, field and approximation bridges. |
| §7.8: Derived direct summand | identity; blow-up of regular surface at closed point | RΓ=R[0] in both cases, H^{>0}=0, composite unit/retraction=1 | Pass | General proper surjective statement retained, not merely finite covers. |

### Definition and construction API laws

Each index refers to the ordered prose interface bullets of the indicated subsection.

| Statement | Instance | Computed values | Result | Change |
|---|---|---|---|---|
| §0.1 interface 1 | ρ on basis 1,i | values (1,0), hence ρ(1)=1 | Pass | Prose law; no padded Lean declaration. |
| §0.1 interface 2 | evaluation on a+b·i | ev(a·ρ)=a; image ideal is ℤ | Pass | Prose law; no padded Lean declaration. |
| §0.1 interface 3 | ℤ⊆ℤ[i]⊆ℤ[i][X] | evaluate X=0 then take constant coefficient: 1↦1,i↦0,X↦0 | Pass | Prose law; no padded Lean declaration. |
| §0.1 interface 4 | same factorization | restriction still sends 1↦1 and i↦0 | Pass | Prose law; no padded Lean declaration. |
| §0.1 interface 5 | base change ℤ→𝔽₂ | basis 1,i survives in 𝔽₂[i]; retraction values (1,0), even though (i+1)²=0 | Pass | Prose law; no padded Lean declaration. |
| §0.1 interface 6 | Gaussian inclusion; ℤ→ℚ | tensor-unit retraction composes to id; on ℤ/2 the rational tensor map sends 1↦0 | Pass | Prose law; no padded Lean declaration. |
| §0.1 interface 7 | ℤ⊆ℤ[i] | kernel of the scalar map is {0} because coefficient of 1 is unchanged | Pass | Prose law; no padded Lean declaration. |
| §0.1 interface 8 | localize ℤ⊆ℤ[i] at a maximal ideal | localized coefficient functional has values (1,0) | Pass | Prose law; no padded Lean declaration. |
| §0.1 interface 9 | ℤ_(2)→ℤ₂ with Gaussian algebra | value 1 of evaluation remains 1 before and after the faithful completion | Pass | Prose law; no padded Lean declaration. |
| §0.2 interface 1 | k and k[ε]/ε² | k is reduced with unit projection; ε²=0,ε≠0 rejects dual numbers | Pass | Prose law; no padded Lean declaration. |
| §0.2 interface 2 | 𝔽₂⊆𝔽₄ | basis 1,ω has projection (1,0) | Pass | Prose law; no padded Lean declaration. |
| §0.2 interface 3 | 𝔽₂⊆algebraic closure | every finite stage has coefficient retraction of value 1; tensor-unit kernel 0 | Pass | Prose law; no padded Lean declaration. |
| §0.2 interface 4 | field ideals (0),(1) | contractions are (0),(1), respectively | Pass | Prose law; no padded Lean declaration. |
| §0.2 interface 5 | cusp k[t²,t³] | integral element t is absent; torsion quotient has basis t and is nonzero | Pass | Prose law; no padded Lean declaration. |
| §0.2 interface 6 | field relabeling by ring isomorphism | 1 maps to 1 and the inverse takes it back to 1 | Pass | Prose law; no padded Lean declaration. |
| §0.2 interface 7 | 𝔽₂ and ℤ₂ | the identity finite cover has projection 1↦1 | Pass | Prose law; no padded Lean declaration. |
| §0.3 interface 1 | M=0 and M=R=k⟦X,Y⟧ | maximal quotients 0 and k; kernel of X on R is 0 | Pass | Prose law; no padded Lean declaration. |
| §0.3 interface 2 | R with list X,Y | native final quotient and maximal quotient both k | Pass | Prose law; no padded Lean declaration. |
| §0.3 interface 3 | R with list X,Y | a witnessing list exists, with successive quotients k⟦Y⟧ and k | Pass | Prose law; no padded Lean declaration. |
| §0.3 interface 4 | R² with coordinate swap | residue quotient k² maps bijectively to k² | Pass | Prose law; no padded Lean declaration. |
| §0.3 interface 5 | R/XR | tail Y acts injectively on k⟦Y⟧ and quotient is k | Pass | Prose law; no padded Lean declaration. |
| §0.3 interface 6 | R, t=2 | XY has nonzero class in R/(X²,Y²) | Pass | Prose law; no padded Lean declaration. |
| §0.4 interface 1 | R=k⟦X⟧ and R/(X) | quotients k and k, but X has kernels 0 and R/(X), respectively | Pass | Prose law; no padded Lean declaration. |
| §0.4 interface 2 | R with parameter X² | X² kernel 0 and quotient has basis 1,X | Pass | Prose law; no padded Lean declaration. |
| §0.4 interface 3 | k⟦X⟧→k⟦T⟧, X↦T² | parameter quotient is k[T]/T², dimension 2≠0 | Pass | Prose law; no padded Lean declaration. |
| §0.4 interface 4 | DVR A and Frac A | Tor₁(-,A)=0 and residue k; Frac A residue 0 excludes faithfulness | Pass | Prose law; no padded Lean declaration. |
| §0.7 interface 1 | 2:ℤ→ℤ | cone ℤ/2; boundary 1 in Ext¹=ℤ/2 | Pass | Prose law; no padded Lean declaration. |
| §0.7 interface 2 | identity and multiplication by 2 | boundary values 0 and 1, respectively | Pass | Prose law; no padded Lean declaration. |
| §0.7 interface 3 | Gaussian algebra | quotient free on i, so Yoneda class is 0 | Pass | Prose law; no padded Lean declaration. |
| §0.7 interface 4 | base change 2:ℤ→ℤ to ℚ | nonzero Ext class 1 maps to 0; 2 is now invertible | Pass | Prose law; no padded Lean declaration. |
| §0.7 interface 5 | ℤ_(2)→ℤ₂ | Ext generator 1 in 𝔽₂ stays 1 under faithful flatness | Pass | Prose law; no padded Lean declaration. |
| §0.7 interface 6 | A=ℤ₂,Q=A/2 | zero class gives all zero reductions; class 1 gives class 1 at every positive p-power level | Pass | Prose law; no padded Lean declaration. |
| §3.2 interface 1 | A₀=ℤ₂ | cover contains roots with valuations 1,1/2,1/4,… | Pass | Prose law; no padded Lean declaration. |
| §3.2 interface 2 | same cover | Frobenius carries a root of valuation 1/2 to 2, valuation 1 | Pass | Prose law; no padded Lean declaration. |
| §3.2 interface 3 | root sequence of 2 | (2^{1/2^{n+1}})²=2^{1/2ⁿ}, with r₀=2 | Pass | Prose law; no padded Lean declaration. |
| §3.2 interface 4 | unramified ℤ₂ base | residue tensor A/2A≠0; 2-action kernel 0 | Pass | Prose law; no padded Lean declaration. |
| §3.2 interface 5 | M=A₀ free | Tor_i(A₀,A)=0 for every i>0 | Pass | Prose law; no padded Lean declaration. |
| §4.1 interface 1 | O_K over ℤ₂; π=1 in singular ring | root ideal survives mod 2; singular colon contains Y and 1·Y=Y≠0 | Pass | Prose law; no padded Lean declaration. |
| §4.1 interface 2 | D=k⟦X,Y⟧, π=1 | all parameter colons are zero; 1 survives mod (X,Y) | Pass | Prose law; no padded Lean declaration. |
| §4.1 interface 3 | ℤ₂⊆ℤ₂[√2] inside O_K | roots with valuation 1/4 survive both the (2) and (√2) extended maximal ideals; p-colon zero | Pass | Prose law; no padded Lean declaration. |
| §4.1 interface 4 | same torsion-free model | each root multiplied by the zero colon class gives 0 | Pass | Prose law; no padded Lean declaration. |
| §4.2 interface 1 | k=0,T=R[t]/Xt | constant map sends t↦0, t²↦nonzero class and 1↦1 | Pass | Prose law; no padded Lean declaration. |
| §4.2 interface 2 | relation y·x=x·y in R=k⟦x,y⟧ | F=x−xX gives [x]=x[X] | Pass | Prose law; no padded Lean declaration. |
| §4.2 interface 3 | evaluate X=1 with α(e)=1 | α(F)=x−x=0 and β(e′)=1 | Pass | Prose law; no padded Lean declaration. |
| §4.2 interface 4 | T=R/(X), k=0 | final module 0; transported 1=0 lies in m·0 | Pass | Prose law; no padded Lean declaration. |
| §4.2 interface 5 | fixed relation t in R[t]/Xt | partial colimit t²≠0; full algebra quotient t²=0 | Pass | Prose law; no padded Lean declaration. |
| §4.2 interface 6 | identity on pointed relation data | 1 and X map to 1 and X; composing twice gives the same values | Pass | Prose law; no padded Lean declaration. |
| §7.1 interface 1 | E/K proper | RΓ=K[0]⊕K[−1], unit (1,0) has projection 1 | Pass | Prose law; no padded Lean declaration. |
| §7.1 interface 2 | finite 𝔽₄/𝔽₂ | higher cohomology 0 and unit coefficient retraction (1,0) | Pass | Prose law; no padded Lean declaration. |
| §7.1 interface 3 | identity proper cover | the chosen left inverse is id, value on 1 is 1 | Pass | Prose law; no padded Lean declaration. |
| §7.1 interface 4 | complete-local identity cover | localized/completed obstruction is 0 at every maximal ideal and global obstruction is 0 | Pass | Prose law; no padded Lean declaration. |
| §7.1 interface 5 | regular field base | degree-zero projection takes unit to 1, even with a nonzero H¹ summand | Pass | Prose law; no padded Lean declaration. |

### Additional predicate and convention statements

| Statement | Instances tried | Computed values | Result | Change |
|---|---|---|---|---|
| Parameter-system dimension and radical | k, k⟦X⟧ with (X²), list (1) | lengths 0,1,1; radicals 0,(X),(1); last radical differs from m | Pass | Native transparent predicate |
| Parameter permutation API | (X,Y) and (Y,X) in k⟦X,Y⟧ | lengths 2 and generated ideals (X,Y) on both sides | Pass | Supplier view |
| Parameter positive-power API | (X²,Y³) in k⟦X,Y⟧ | radical (X,Y); quotient basis 1,X times 1,Y,Y² has dimension 6 | Pass | Positive powers required |
| Parameter isomorphism API | X↦U,Y↦V | generated ideal maps from (X,Y) to (U,V), length 2 | Pass | Actual isomorphism used |
| Purity composition API | R→R[X]→R[X,Y] | evaluation X=Y=0 composes with the unit to 1 | Pass | Native tensor expression |
| Purity base-change API | ℤ⊆ℤ[i] after ℤ→𝔽₂ | basis 1,i; tensor-unit projection values (1,0) | Pass | Nilpotent fibre allowed |
| Purity filtered-colimit API | finite subfields in an algebraic closure of 𝔽₂ | unit 1 survives every stage, tensor-unit kernel 0 in the union | Pass | No finite-generation assertion for the union |
| Purity first-factor API | R→R[X]→R[X,Y] | composite projection and its restriction both take 1↦1 | Pass | Direction is toward the first factor |
| Separable residue predicate | 𝔽₂(t)→𝔽₂(t^{1/2}) | total degree 2, separable degree 1, inseparable degree 2 | Pass | Induced residue map fixed |
| Separable residue identity API | id_𝔽₂ | degree 1, separable degree 1 | Pass | Unit maps to unit |
| Separable residue composition API | 𝔽₂→𝔽₄→𝔽₁₆ | degrees 2,2,4; all separable | Pass | Maps composed compatibly |
| Separable residue isomorphism API | ω↦ω+1 in 𝔽₄ | minimal polynomial Z²+Z+1 unchanged and derivative 1≠0 | Pass | Prescribed field map retained |
| Local versus global zero rings | field and zero ring | local field 1≠0; global zero ring 1=0 | Pass | IsLocalRing excludes zero; general regular statement includes it |
| Regular versus weakly regular | M=0; M=Frac DVR | weak action kernels 0; final quotient 0 in each case | Pass | Never erase the nonzero quotient clause |
| Mixed characteristic versus ℚ-algebra | ℤ₂, ℚ | char ℤ₂=0 but 2 is a nonunit; 1/2∈ℚ | Pass | Trace theorem requires invertible degree |
| Root orientation | root systems of 2 | r₀=2, r₁²=2, r₂²=r₁; valuations 1,1/2,1/4 | Pass | Compatible data, not independent roots |
| Obstruction shift and direction | 0→ℤ→²ℤ→ℤ/2→0 | boundary ℤ/2→ℤ[1] is 1∈ℤ/2; reverse/degree-zero Hom is 0 | Pass | Same convention in Layers 0,2,3,7 |
| Denominator convention | N=1,D=2; c=1 | exponent 5; with c=1 the denominator equals 1 | Pass | c regular; no division by zero |
| Empty parameter list | d=0, n=1,m=0 and m=1 | product 1, power ideal 0, membership false for both m | Pass | The iff requires positive dimension |
| Universe/cardinality convention | finite ring, countable ring, finite presentations | finitely many generators and countably many stages have cardinal at most ℵ₀; a finite test module needs only the base universe | Pass | Explicit independent carrier universes; small purity tests |
| Prime restriction in AlmostCMFor | p=0,1,2,3 | prime predicates false,false,true,true | Pass | Explicit binders exclude junk exponents |
| Scalar maps in weak square | T maps to T; p maps to TV | γ(ι_B(T))=ι_B′(T), γ(ι_B(p))=TV=ι_B′(p) | Pass | Ring-map square specified on every b |
| Derived versus ordinary cohomology | E/k and Spec R | E has H¹=k, Spec R has H^{>0}=0 | Pass | Affine ordinary cohomology is not a local-cohomology witness |

### Supplier-gap statement witnesses

| Statement | Instances tried | Computed values | Result | Change |
|---|---|---|---|---|
| Ramification/Riemann supplier contract | g=1 and the p-root tower | annular comparison id; lim¹ of the constant tower 0; rₙ=rₙ₊₁ᵖ gives root-ideal square equal to itself | Contract example only | Read from the explicitly permitted earlier supplier’s design |
| Ramified multi-element Kummer contract | ℤ₂⟦T,V⟧/(TV−2) | dim 2, parameters T,V; 2=TV∈m²; two named elements T,V | Contract example only | Ramified target cannot be replaced by an unramified one |
| Common Cohen extension contract | k=k′=𝔽₂; k′=𝔽₄ | completed tensors ℤ₂ and W(𝔽₄), respectively; comparison maps identities, coefficient ranks 1 and 2 | Contract example only | Common map, not separate extensions |
| Finite parameter subring contract | B=ℤ₂⟦X⟧ with (4,X) | quotient B/(4,X)=ℤ/4; coefficient series map T↦X has rank 1 and kernel 0 | Contract example only | Actual coefficient map fixed |
| Regular-surjection kernel supplier theorem | k⟦X,Y⟧→k⟦Y⟧ | kernel (X), dimensions 2 and 1, one regular generator | Pass on this instance | Import DeformationAndDerivedPatchingAlgebra §3.4; no gap. |
| Parameter-system radical/transport contract | field; (X²) in k⟦X⟧; unequal-dimensional components | radicals 0,(X); lengths 0,1; component dimensions 2 and 1 | Contract example only | Dimension-sensitive transport |
| Perfectoid-base adic domination contract | A=O_K, Y=Spec A, ideal (pᴺ) | regular principal ideal gives identity blow-up; chart ratio pᴺ/pᴺ=1; completed identity unchanged | Contract example only | Does not invoke a Noetherian theorem on A |
| GR vanishing contract | identity of smooth Spec K and field extension K→L | positive higher direct images 0; ω=K in degree 0 and K⊗_K L=L | Contract example only | General vanishing remains the supplier gap |

### Source issues E1–E22

The labels identify the accepted design’s issues, not copied source passages. The repairs are incorporated in the section prose rather than a source-correction appendix.

| Statement | Instances tried | Computed values | Result | Change |
|---|---|---|---|---|
| E1: domain of free-summand functional | basis containing λ(1) | μ(λ(1))=1 on M | Pass | Functional defined on M, not an unnamed module |
| E2: dividing by a power of r | DVR, λ with image rⁿR | λ/rⁿ has a value outside rR; multiplication by r is injective | Pass | Added r regular or zero; no counterexample to the printed theorem claimed |
| E3: arbitrary double Matlis dual | M=⊕_ℕ k over k | choose L on ∏k vanishing on every coordinate vector but with L(1,1,…)=1; no evaluation by a finite-support m has those values | Pass | Use D(Hᵈ_m(S))=Hom(S,R̂), not arbitrary biduality |
| E4: noncomplete DVR splitting | Datta–Murayama V | Hom_V(V^{1/p},V)=0, while a retraction would take 1 to 1≠0 | Pass | Require complete R for R→R⁺ splitting |
| E5: ring receiving roots of p | πᵖ=pv, adjoining v-roots | p^{1/p}=π/v^{1/p}, lying in A; the input A′ has not been given that root | Pass | K°-structure on A |
| E6: integral versus generic base | O_K | p≠0 is a nonunit; 1/p is absent from O_K | Pass | K°-algebra, not K-algebra |
| E7: finite extension in theorem | R→R×R | diagonal unit projection sends 1↦1 | Pass | Quantify B as finite and injective |
| E8: trace hypothesis | quadratic integer φ | Tr(φ)/2=1/2∉ℤ | Pass | ℚ-algebra or invertible degree |
| E9: generic reducedness | K[ε]/ε² over K | ε²=0 and generic nilpotent survives; quotient by (ε) is K | Pass | Choose domain component before discriminant |
| E10: completion in Hom limit | ℤ_(2) versus ℤ₂ | lim ℤ/2ⁿ=ℤ₂; the series ∑_{n≥2}2^{n!} has reductions 4 mod 8, 68 mod 128 and 16777284 mod 2²⁵, and is not rational | Pass | Complete first, then choose domain component |
| E11: coefficient multiplication in module quotient | M=R²,e=e₁ | eX∈M[X]; no product e₁e₂ is defined | Pass | Scalar polynomial multipliers only |
| E12: linear versus algebra factorization | Re:ℂ→ℝ | Re(1)=1, Re(i)=0, Re(i²)=−1≠0 | Pass | Pointed linear maps do not assert an algebra factorization |
| E13: primed base in square | identity base B′=ℤ₂ | primed maximal quotient D′/m_B′D′≠0; identity sends root to same root | Pass | All primed parameters tested over B′ |
| E14: non-dominating components | ℤ₂×𝔽₂ | Tor₁^{ℤ₂}(𝔽₂,𝔽₂)=𝔽₂≠0; ℤ₂ component is flat | Pass | Keep a component over zero |
| E15: empty monomial | d=0, m=n=1 | product 1 and ideal 0; membership false although m≥n | Pass | Positive-dimensional iff |
| E16: derived local reduction | generator in Ext¹_{ℤ_(2)}(𝔽₂,R) | faithful completion sends 1↦1; rationalization sends 1↦0 | Pass | Pseudo-coherence and faithful completed-local test |
| E17: empty generic fibre | Spec(A/p) | p acts as 0 on target, p·p^{1/pʰ}≠0 on source | Pass | Generic surjectivity |
| E18: independent height/Tor indices | A=k⟦x,y⟧,P=(x),h=1,i=2 | height 1 differs from degree 2; Tor₂(A/(x),A)=0 | Pass | Correct exact segment and independent h |
| E19: coefficient ring of dual | ℤ⊆ℤ[i] | coefficient functional has values (1,0); ℤ has no prescribed ℤ[i]-action | Pass | Hom over ℤ, generally over R |
| E20: Frobenius length factor | d=1,p=2 and p=3 | lengths of k⟦x⟧/(x²),(x³) are 2 and 3, not d=1 | Pass | Factor pᵈ |
| E21: fixed-relation colimit | T=k⟦x⟧[t]/xt | partial quotient t²≠0; full quotient t²=0 | Pass | Retain separate finite-witness comparison |
| E22: distinguished coefficient | M=R²,e=e₁,u=xe₂, relation y·u=x·ye₂ | evaluation X=1 gives x when α(e₁)=0, and 0 when α(e₁)=1=α(e₂) | Pass | Normalize α(e)=1 for evaluation |

### Native geometric definitions and their API

| Statement | Instances tried | Computed values | Result | Change |
|---|---|---|---|---|
| Structure complex definition | Spec 𝔽₂; empty scheme; Spec k[ε]/ε² | degree-zero sections 𝔽₂,0,k[ε]/ε²; all other terms 0; ε≠0 retained | Pass | Real single-complex specialization. |
| Structure complex support law | Spec 𝔽₂ | terms in degrees −1,0,1 are 0,O_X,0; differential 0 | Pass | Bounded below by zero. |
| Structure complex cohomology law | same point | H⁰=𝔽₂ and Hⁱ=0 for i≠0 | Pass | No higher cohomology introduced by the single complex. |
| Structure complex isomorphism transport | relabel Spec 𝔽₂ as an isomorphic point | 1 maps to 1 in degree zero; all other terms remain 0 | Pass | Supplied sheaf comparison used. |
| Derived geometric unit definition and source/target law | finite diagonal cover Spec(A×A)→Spec A | unit a↦(a,a), target degree-zero algebra A²; first projection returns a | Pass | Compose the native geometric unit with the native derived-functor unit. |
| Degree-zero geometric unit law | Spec(ℤ/2)→Spec ℤ | map 1↦1,2↦0; no retraction since 2≠0 in ℤ | Pass | Map determined by the actual scheme morphism. |
| Identity and left-inverse law | identity of Spec k | unit and retraction both id; composite value on 1 is 1 | Pass | Correct direction O_Y→Rf_*O_X. |
| Splinter and derived-splinter predicates | finite field cover; elliptic cone; zero ring | field coefficient retraction value 1; cone has resolution H¹ of dimension 1; zero structure sheaf has identity 0 | Pass | Actual finite and proper cover quantifiers, with Noetherianity. |
| Characteristic-p equivalence headline | field and node in char 2 | both properties true for the field; both false for the node by failed contraction of (x+y) | Pass on these instances | Stated on the actual predicates. |
| Characteristic-zero derived headline | proper elliptic curve over ℂ | RΓ=ℂ[0]⊕ℂ[−1]; unit (1,0) projects to 1 | Pass on this instance | Higher cohomology need not vanish. |
| General derived headline | finite Gaussian cover and regular-surface blow-up | finite coefficient retraction values 1,0; blow-up has RΓ=R[0], unit id | Pass on these instances | Full proper-surjective conclusion restored. |

### README Check register

| Statement | Instances tried | Computed values | Result | Change |
|---|---|---|---|---|
| §0.1 Check 1 | R=ℤ, S=ℤ[X] | evaluation gives 1↦1, X↦0, X²↦0 | Pass on this instance | No further change. |
| §0.1 Check 2 | R=ℤ, identity and diagonal | id(1)=1; first projection (1,1)↦1 | Pass on this instance | No further change. |
| §0.1 Check 3 | ℤ⊆ℤ[i] | coefficient values ρ(1)=1, ρ(i)=0 | Pass on this instance | No further change. |
| §0.1 Check 4 | node normalization | x=(x,y)(1,0) upstairs; required constants downstairs are 1 and 0 | Pass on this instance | No further change. |
| §0.1 Check 5 | ℤ⊆ℚ | Hom(ℚ,ℤ)=0; every functional takes 1↦0 | Pass on this instance | No further change. |
| §0.1 Check 6 | ℤ⊆ℤ[i], a finite free algebra | coefficient retraction has value 1; tensor-unit kernel is 0 for every module | Pass on this instance | No further change. |
| §0.1 Check 7 | 𝔽₂⊆𝔽₄ | basis 1,ω gives coefficient values (1,0) | Pass on this instance | No further change. |
| §0.1 Check 8 | node and ideal (x+y) | x lies in its extension and not its contraction; constants 1≠0 | Pass on this instance | No further change. |
| §0.1 Check 9 | ℝ⊆ℂ | Re(i²)=−1 while Re(i)²=0 | Pass on this instance | No further change. |
| §0.1 Check 10 | K nonzero, S=0 | any linear map takes 1_S=0 to 0≠1_K | Pass on this instance | No further change. |
| §0.2 Check 1 | 𝔽₂⊆𝔽₄ | unit projection 1↦1 | Pass on this instance | No further change. |
| §0.2 Check 2 | ℤ⊆ℤ[i] | 1 has coordinates (1,0), primitive; coefficient retraction value 1 | Pass on this instance | No further change. |
| §0.2 Check 3 | k[ε]/ε² | ε²=0 with ε≠0; reducedness false despite self-injectivity | Pass on this instance | No further change. |
| §0.2 Check 4 | node normalization | (x+y)S contains x; (x+y)R does not | Pass on this instance | No further change. |
| §0.2 Check 5 | cusp k[t²,t³]⊆k[t] | quotient has basis t, nonzero but generic rank 0 | Pass on this instance | No further change. |
| §0.2 Check 6 | ℚ[T] versus ℚ[t²,t³] | first integrally closed with trace splittings; second misses integral element t | Pass on this instance | No further change. |
| §0.2 Check 7 | K=ℚ | basis coefficient on any finite extension sends 1↦1 | Pass on this instance | No further change. |
| §0.2 Check 8 | ℚ[T] versus rational cusp | normality and splinterhood both true for the first, both false for the cusp | Pass on this instance | No further change. |
| §0.2 Check 9 | node | (x,y)(1,0)=(x,0); the two required constant coefficients 1 and 0 disagree | Pass on this instance | No further change. |
| §0.3 Check 1 | R=k⟦X,Y⟧ | successive quotients k⟦Y⟧ and k; scalar kernels 0 and 0 | Pass on this instance | No further change. |
| §0.3 Check 2 | R=k, M=k and M=0 | empty list; maximal quotients k≠0 and 0 | Pass on this instance | No further change. |
| §0.3 Check 3 | R=ℤ_(p), M=ℚ | p-kernel 0 but ℚ/pℚ=0 | Pass on this instance | No further change. |
| §0.3 Check 4 | k⟦X,Y⟧/(XY,Y²), list X | XY=0 with Y≠0; dimension 1 and depth 0 | Pass on this instance | No further change. |
| §0.3 Check 5 | R with list X,Y; M=0 | native regular and big predicates both true on R, both false on 0 | Pass on this instance | No further change. |
| §0.3 Check 6 | R=k⟦X⟧ with parameter X | X-kernel 0, final quotient k | Pass on this instance | No further change. |
| §0.3 Check 7 | M=0 | weak scalar kernels 0, maximal quotient 0 | Pass on this instance | No further change. |
| §0.3 Check 8 | R=k, empty list | length 0=dimension, generated radical 0=m | Pass on this instance | No further change. |
| §0.3 Check 9 | k⟦X⟧, lists X² and 1 | length 1; radicals (X)=m and (1)≠m | Pass on this instance | No further change. |
| §0.4 Check 1 | R=k⟦X⟧, parameters X and X² | both kernels 0; quotients have dimensions 1 and 2 | Pass on this instance | No further change. |
| §0.4 Check 2 | R=k, M=k² | empty list, maximal quotient k²≠0 | Pass on this instance | No further change. |
| §0.4 Check 3 | R=k⟦X⟧, modules R and k | depths 1 and 0 versus ring dimension 1 | Pass on this instance | No further change. |
| §0.4 Check 4 | R=k⟦X,Y⟧, M=R/(X) | depth 1=2−1; X·1=0 with 1≠0 | Pass on this instance | No further change. |
| §0.4 Check 5 | DVR A, C=A | Tor₁(A/I,A)=0; C/ϖC=k≠0 | Pass on this instance | No further change. |
| §0.4 Check 6 | R=k⟦X⟧, M=k | X·1=0, kernel k≠0 | Pass on this instance | No further change. |
| §0.5 Check 1 | R=k[X]_(X), M=R | both completed module and tensor with R̂ equal k⟦X⟧ | Pass on this instance | No further change. |
| §0.5 Check 2 | same R | completion X-kernel 0, residue k | Pass on this instance | No further change. |
| §0.5 Check 3 | M=0 | completion 0, residue 0 | Pass on this instance | No further change. |
| §0.6 Check 1 | DVR A, C=A | ϖ-kernel 0 and quotient k≠0 | Pass on this instance | No further change. |
| §0.6 Check 2 | C=Frac A | ϖ-kernel 0 but quotient 0, so flat and not faithful | Pass on this instance | No further change. |
| §0.7 Check 1 | ℤ⊆ℤ[i] | quotient free on i, Ext¹ class 0, coefficient retraction value 1 | Pass on this instance | No further change. |
| §0.7 Check 2 | id_A | cone 0 and connecting morphism 0 | Pass on this instance | No further change. |
| §0.7 Check 3 | cusp A⊆k[t] | quotient k·t; Hom_A(k,A)=0 and extension class nonzero | Pass on this instance | No further change. |
| §0.7 Check 4 | 2:ℤ→ℤ | cone ℤ/2 and boundary class 1 in ℤ/2 | Pass on this instance | No further change. |
| §0.7 Check 5 | base change 2:ℤ→ℤ to ℚ | Ext class 1 maps to 0; rational map 2 has inverse 1/2 | Pass on this instance | No further change. |
| §0.7 Check 6 | ℤ⊆ℤ[i]; zero algebra | positive-rank quotient free on i gives Ext¹=0; zero algebra has unit image 0 | Pass on this instance | No further change. |
| §0.8 Check 1 | identity bases ℚ,𝔽₂,ℤ₂ | characteristics (0,0),(2,2),(0,2); each unit retraction value 1 | Pass on this instance | No further change. |
| §0.8 Check 2 | S=A×A/I | first projection kernel on A is 0, second is I | Pass on this instance | No further change. |
| §0.9 Check 1 | φ=(1+√5)/2 | Tr(1)=2, Tr(φ)=1; divided value 1/2∉ℤ | Pass on this instance | No further change. |
| §0.9 Check 2 | ℚ⊆ℚ(√2) | trace values on 1,√2 are 2,0; divided values 1,0 | Pass on this instance | No further change. |
| §0.9 Check 3 | ℚ⊆ℚ(√1)=ℚ | degree 1, Tr(1)=1, and the repeated pair 1,1 is dependent | Pass on this instance | No further change. |
| §0.10 Check 1 | ℤ₂⊆ℤ₂[√2] | finite free basis 1,√2 gives retraction (1,0) | Pass on this instance | No further change. |
| §0.10 Check 2 | ℤ₂⟦X,Y⟧⊆ℤ₂⟦X,Y⟧[U]/(U²−X) | dimension 3, free basis 1,U, coefficient values 1,0 | Pass on this instance | No further change. |
| §0.10 Check 3 | k⊆k[ε]/ε² | basis 1,ε, retraction values 1,0 while ε²=0 | Pass on this instance | No further change. |
| §1.1 Check 1 | 𝔽₂⟦X⟧ with Frobenius | image-rank 2, intersection of (X^(2ʲ)) is 0 | Pass on this instance | No further change. |
| §1.1 Check 2 | V⟦X⟧ with X↦X² | basis 1,X, ideals (ϖ,X^(2ʲ)), intersection (ϖ) | Pass on this instance | No further change. |
| §1.1 Check 3 | 𝔽₂⟦X⟧, r=0 | rank 2 and intersection 0=rR | Pass on this instance | No further change. |
| §1.2 Check 1 | 𝔽₂⊆𝔽₄ | coefficient projection sends 1↦1 | Pass on this instance | No further change. |
| §1.2 Check 2 | Datta–Murayama DVR V | Hom_V(V^(1/p),V)=0, so every possible unit value is 0≠1 | Pass on this instance | No further change. |
| §1.2 Check 3 | identity algebra | m⊗1 maps back to m, kernel 0 | Pass on this instance | No further change. |
| §1.2 Check 4 | ℤ→ℚ, M=ℤ/2 | 1≠0 maps to 0 in M⊗ℚ=0 | Pass on this instance | No further change. |
| §1.2 Check 5 | R→R×R | m maps to (m,m); first projection returns m | Pass on this instance | No further change. |
| §1.3 Check 1 | 𝔽₂⟦X⟧⊆𝔽₂⟦X^(1/2)⟧ | fractional basis 1,X^(1/2), projection values 1,0 | Pass on this instance | No further change. |
| §1.3 Check 2 | p=2 and 3 | basis lengths 2 and 3; projections (1,0) and (1,0,0) | Pass on this instance | No further change. |
| §2.1 Check 1 | ℤ₂⊆ℤ₂[i] | coefficient values (1,0) at every quotient modulo 2ⁿ and in the limit | Pass on this instance | No further change. |
| §2.1 Check 2 | ℤ, I=ℤ, S=ℤ/2 | all I-power quotients 0 but any S→ℤ has value 0 at 1 | Pass on this instance | No further change. |
| §2.1 Check 3 | M=ℤ/2 | Hom(M,ℤ)=0; Hom(M,ℤ/2ⁿ)={0,2^(n−1)} with next transition zero | Pass on this instance | No further change. |
| §2.2 Check 1 | ℤ₂⊆W(𝔽₄), g=1 | unramified generic extension, basis contains 1, coefficient retraction value 1 | Pass on this instance | No further change. |
| §2.2 Check 2 | ℤ₂,g=1 | pg modulo 2 is 0; modulo 4 it is 2≠0 | Pass on this instance | No further change. |
| §2.3 Check 1 | A=ℤ₂,g=2, root degree 2 | A[√2] is free on 1,√2; coefficient values 1,0 | Pass on this instance | No further change. |
| §2.3 Check 2 | A=ℤ₂ | each finite subalgebra in A⁺ has pure unit; complete-pure retraction has value 1 | Pass on this instance | No further change. |
| §3.1 Check 1 | ℤ₂⟦X₁,X₂⟧/(2−X₁²) | 2=X₁²∈m²; f has constant coefficient 0 | Pass on this instance | No further change. |
| §3.1 Check 2 | p=2,f₀=4+X² | u=−1 and normalized f=−X²; −(2−4−X²)=2+X² | Pass on this instance | No further change. |
| §3.2 Check 1 | A₀=ℤ₂ | cover O_K has root valuations 1,1/2,1/4,… | Pass on this instance | No further change. |
| §3.2 Check 2 | unramified A₀=ℤ₂ | 2-kernel in O_K is 0 and O_K/2≠0 | Pass on this instance | No further change. |
| §3.2 Check 3 | O_K with p=2 | Frobenius sends 2^(1/4) mod √2 to √2 mod 2, a nonzero class | Pass on this instance | No further change. |
| §3.2 Check 4 | O_K | any finite root subset has least valuation 2^(−N); next root has smaller value 2^(−N−1) | Pass on this instance | No further change. |
| §3.2 Check 5 | ℤ₂ with zero variables | completed root extension is O_K, residue characteristic 2 | Pass on this instance | No further change. |
| §3.2 Check 6 | p=2 | root values 1,1/2,1/4,1/8; no positive minimum in the generated ideal | Pass on this instance | No further change. |
| §3.3 Check 1 | M=𝔽₂ over ℤ₂ | M⊗O_K=O_K/2, and √2·1 has nonzero class | Pass on this instance | No further change. |
| §3.3 Check 2 | O_K/2 | v(√2)=1/2<1=v(2), so √2 mod 2≠0 | Pass on this instance | No further change. |
| §3.4 Check 1 | α₀=0 | every reduced and base-changed class equals 0; the nonzero premise is false | Pass on this instance | No further change. |
| §3.4 Check 2 | p=2,g=1 | p²g=4 is 0 mod 4 and 4≠0 mod 8 | Pass on this instance | No further change. |
| §3.5 Check 1 | g=1 | each annulus has U=pⁿ; its map from A∞ is the identity | Pass on this instance | No further change. |
| §3.5 Check 2 | g=1,n=1 | quotient equation U−p=0 eliminates U, giving A∞ | Pass on this instance | No further change. |
| §3.5 Check 3 | 𝔽₄=𝔽₂[ω] | Tr(1)=0, Tr(ω)=1 and Tr(ω·1)=1 | Pass on this instance | No further change. |
| §3.6 Check 1 | B₀=A₀ and proper identity | the respective unit cones are both 0; both obstruction limits are 0 | Pass on this instance | No further change. |
| §3.6 Check 2 | constant tower V; Q=0 | lim V=V, lim¹V=0; Hom(0,−)=0 | Pass on this instance | No further change. |
| §3.7 Check 1 | p=3, B=A[Y]/(Y²−X−3) | basis 1,Y; retraction values 1,0; discriminant 4(X+3) | Pass on this instance | No further change. |
| §3.7 Check 2 | p=2 | discriminant 4(X+2), p-part 4 and g mod 2=X≠0; same retraction values 1,0 | Pass on this instance | No further change. |
| §4.1 Check 1 | D=k⟦X⟧,π=1 | root ideal D, parameter colon 0, unit survives mod X | Pass on this instance | No further change. |
| §4.1 Check 2 | D=O_K over ℤ₂,π=2 | 2-kernel 0 and √2∉2D by valuations 1/2<1 | Pass on this instance | No further change. |
| §4.1 Check 3 | k⟦X,Y⟧/(XY,Y²),π=1 | (0:X)=(Y)≠0 and 1·Y=Y≠0 | Pass on this instance | No further change. |
| §4.1 Check 4 | B=k,D=k,π=1 | no parameter colons; root ideal k not contained in mD=0 | Pass on this instance | No further change. |
| §4.1 Check 5 | André construction, B=ℤ₂, g=1 | x₁=4 regular; contracted scalar 2 has nonzero class mod 4 | Pass on this instance | No further change. |
| §4.1 Check 6 | D=0 | all colons 0 but every root is 0∈mD | Pass on this instance | No further change. |
| §4.2 Check 1 | R=k⟦x,y⟧, relation yx=xy | F=x−xX gives [x]=x[X] | Pass on this instance | No further change. |
| §4.2 Check 2 | k=0, M=R[t]/xt,u₁=t | quotient M/Rt; distinguished image [1]≠0 | Pass on this instance | No further change. |
| §4.2 Check 3 | zero relation on R=k⟦x,y⟧, N=1 | partial target R⊕(R/(x))X, xX=0 and X≠0 | Pass on this instance | No further change. |
| §4.2 Check 4 | k⟦X,Y⟧/(XY,Y²),u₁=Y | partial quotient kills Y≠0 and keeps 1 | Pass on this instance | No further change. |
| §4.2 Check 5 | R[t]/xt,u₁=t | scalar quotient retains t²≠0; full quotient t²=0 | Pass on this instance | No further change. |
| §4.2 Check 6 | relation yx=xy, X↦1 | evaluation kills F=x−xX and fixes all constants | Pass on this instance | No further change. |
| §4.2 Check 7 | M=0,e=0 | partial target 0, and e′=0 belongs to m·0 | Pass on this instance | No further change. |
| §4.2 Check 8 | full k=0 modification of R[t]/xt | quotient R, images of 1,t,t² are 1,0,0 | Pass on this instance | No further change. |
| §4.2 Check 9 | full quotient R[X]/(x−xX) | X↦1 gives x−x=0; composite on R is id | Pass on this instance | No further change. |
| §4.2 Check 10 | full zero-relation quotient R[X]/xX | X≠0, xX=0; evaluation X↦0 fixes R | Pass on this instance | No further change. |
| §4.3 Check 1 | R=k⟦X⟧ with its own regular parameter | evaluation at every stage preserves 1 mod X as 1≠0 | Pass on this instance | No further change. |
| §4.3 Check 2 | T=R/(X), relation X·1=0 | partial quotient T/R·1=0, hence terminal 1=0 | Pass on this instance | No further change. |
| §4.4 Check 1 | c=1,T=k⟦x,y⟧ | colon (x):y=(x); all powers of c equal 1, so no denominator remains | Pass on this instance | No further change. |
| §4.4 Check 2 | N=1,D=2 and N=0,D=1 | exponents 5 and 1; c^(−1)(c^(−2))²=c^(−5) | Pass on this instance | No further change. |
| §4.4 Check 3 | M=R², e=e₁ | evaluation gives x when α(e₁)=0, and x−x=0 when α(e₁)=α(e₂)=1 | Pass on this instance | No further change. |
| §4.5 Check 1 | D=B=k⟦X⟧ | completed algebra itself, X-kernel 0, quotient k≠0 | Pass on this instance | No further change. |
| §4.5 Check 2 | O_K over ℤ₂,h=1 | v(√2)=1/2<1, so √2∉2O_K | Pass on this instance | No further change. |
| §4.6 Check 1 | B=ℤ₂,g=1,x₁=4 | (π)∩ℤ₂=(2); 2∉(4) | Pass on this instance | No further change. |
| §4.6 Check 2 | same base modulo 4 | scalar 2≠0 while x₁=4=0; D remains 4-torsion-free | Pass on this instance | No further change. |
| §4.7 Check 1 | ℤ₂⟦x,y⟧/(xy)→ℤ₂⟦y⟧ | both dimensions 2; parameters 2,x+y map to 2,y, final quotient 𝔽₂ | Pass on this instance | No further change. |
| §4.7 Check 2 | ℤ₂⟦X,Y⟧/(2X,2Y) | component dimensions 2 and 1; quotient by (2+X,Y) is ℤ₂/4; smaller image list (2,0) has second scalar 0 | Pass on this instance | No further change. |
| §4.8 Check 1 | ℤ₂ and B=ℤ₂⟦x,y,z⟧/(xy−2z) | first has balanced algebra itself; second has dimension 3 but cotangent dimension 4, hence singular | Pass on this instance | No further change. |
| §4.8 Check 2 | ℤ₂⟦X,Y⟧/(2X) | char 0, dimension 2; quotient by (2) is 𝔽₂⟦X,Y⟧ of dimension 2 | Pass on this instance | No further change. |
| §4.9 Check 1 | R=𝔽₂⟦X,Y⟧ | in R⁺ successive parameter colons are 0,(X)R⁺; residue nonzero by lying over | Pass on this instance | No further change. |
| §4.9 Check 2 | normal cone over E×ℙ¹ in char 0 with finite regular normalization base | H²_m has a degree-zero summand H¹(E×ℙ¹,O)=ℂ; divided trace retracts this nonzero summand from R⁺ | Pass on this instance | No further change. |
| §4.9 Check 3 | R=𝔽₂ | empty list, maximal quotient algebraic closure ≠0 | Pass on this instance | No further change. |
| §4.10 Check 1 | B=ℚ⟦X⟧ | B itself has X-kernel 0 and residue ℚ | Pass on this instance | No further change. |
| §4.10 Check 2 | R=ℚ[ε]/ε²,C=ℚ | dimension 0, εC=0, maximal quotient ℚ≠0 | Pass on this instance | No further change. |
| §4.11 Check 1 | R=k⟦X,Y⟧,t=2 | XY mod (X²,Y²)≠0 | Pass on this instance | No further change. |
| §4.11 Check 2 | R=𝔽₂[ε]/ε²,C=𝔽₂ | empty list, maximal quotient 𝔽₂, kernel of R→C is (ε)≠0 | Pass on this instance | No further change. |
| §4.12 Check 1 | identity square with B=D=ℤ₂,π=1 | root quotient 1, balanced algebra B with residue 𝔽₂ | Pass on this instance | No further change. |
| §4.12 Check 2 | identity square with D=O_K,π=2 | each root divided by itself equals 1 | Pass on this instance | No further change. |
| §4.12 Check 3 | O_K,π=2,π′=4 | root quotient 2^(1/2ⁿ), valuation 2^(−n); inverse-direction quotient has valuation −2^(−n)<0 | Pass on this instance | No further change. |
| §5.1 Check 1 | finite free extension over ℤ₂⟦X,Y⟧ | base dimension 3, basis 1,U; coefficient retraction 1,0 | Pass on this instance | No further change. |
| §5.1 Check 2 | normal characteristic-two cubic and reduced node | cubic c²≠0 mod (a,b) but its image is 0 mod (x²,y²); node needs unequal constants 1,0 | Pass on this instance | No further change. |
| §5.1 Check 3 | R=S=0 | unique linear map has ρ(1)=ρ(0)=0=1 | Pass on this instance | No further change. |
| §5.1 Check 4 | normal cubic Frobenius | c² survives in 𝔽₂[c]/c³; z⁴=(x³+y³)z∈(x²,y²)S | Pass on this instance | No further change. |
| §5.2 Check 1 | I={1,2}, M_i=ℤ | product ℤ²; multiplication by n≠0 has kernel 0 | Pass on this instance | No further change. |
| §5.2 Check 2 | R=k⊕V,V²=0 | x₀ kills vector (x₁,x₂,…), whose coordinates have unbounded span and so do not lie in VM | Pass on this instance | No further change. |
| §5.2 Check 3 | empty product over k≠0 | module 0, Tor groups 0, maximal quotient 0 so not faithful | Pass on this instance | No further change. |
| §5.2 Check 4 | ∏_Iℤ | n(a_i)=0 implies every a_i=0 for n≠0 | Pass on this instance | No further change. |
| §5.2 Check 5 | same square-zero R | x₀-vector product 0; every element of VM has coordinates in one finite-dimensional subspace, but (x₁,x₂,…) does not | Pass on this instance | No further change. |
| §5.3 Check 1 | S=k[ε]/ε²,T=k | quotient sends 1↦1,ε↦0; T is faithful flat over k | Pass on this instance | No further change. |
| §5.3 Check 2 | ℤ₂⊆ℤ₂[i] | T=S is free and faithful, tensor-unit retraction coefficient values 1,0 | Pass on this instance | No further change. |
| §5.3 Check 3 | S=ℤ₂×𝔽₂ | first projection gives T=ℤ₂, residue 𝔽₂; other component has 2-action zero | Pass on this instance | No further change. |
| §5.4 Check 1 | ℤ₂[t²,t³]⊂ℤ₂[t], t²=2 | finite subalgebra free on 1,t³ but t is integral and absent; coefficient value on 1 is 1 | Pass on this instance | No further change. |
| §5.4 Check 2 | R=𝔽₂⟦X⟧ | R⁺ is torsion-free with nonzero X-quotient; the complete-pure retraction has value 1 | Pass on this instance | No further change. |
| §5.4 Check 3 | K=𝔽₂(t) | algebraic closure contains K, basis extending 1 gives coefficient projection 1↦1 | Pass on this instance | No further change. |
| §5.5 Check 1 | node, s=x+y,n=2 | s mod s²≠0, s² mod s²=0 | Pass on this instance | No further change. |
| §5.5 Check 2 | contracted ideal in ℤ₂⊆ℤ₂[i] | (2)S∩ℤ₂=(2); monomial over k⟦X⟧: X∉(X²) | Pass on this instance | No further change. |
| §5.5 Check 3 | d=0,m=n=1 | product 1, generated ideal 0, membership false | Pass on this instance | No further change. |
| §5.5 Check 4 | k⟦X,Y⟧,n=2 | residue basis 1,X,Y,XY; XY nonzero, X²Y²=0,1≠0 | Pass on this instance | No further change. |
| §6.1 Check 1 | k[X]_(X)→k[X,Y]_(X,Y) | evaluation Y=0 fixes Xⁿ; completed evaluation does the same | Pass on this instance | No further change. |
| §6.1 Check 2 | completed split map | X⁰↦1,X↦X,X²↦X² and Y↦0 | Pass on this instance | No further change. |
| §6.2 Check 1 | ℤ₂⟦T⟧→ℤ₂⟦T,V⟧/(TV−2) | target dimension 2, parameters T,V,2=TV∈m² | Pass on this instance | No further change. |
| §6.2 Check 2 | inseparable field test 𝔽₂(t)→𝔽₂(t^(1/2)) | degree 2 and derivative of Z²−t is 0; hypothesis of this roadmap fails | Pass on this instance | No further change. |
| §6.2 Check 3 | V=U−T,p=2 | T²−TU+2=2−TV; target cotangent dimension 2 equals dimension 2 | Pass on this instance | No further change. |
| §6.2 Check 4 | 𝔽₂→𝔽₂(t) | separating basis {t}; degree over 𝔽₂(t) is 1; transcendence degree 1 so not algebraic | Pass on this instance | No further change. |
| §6.2 Check 5 | id_𝔽₂ | separable degree 1, inseparable degree 1 | Pass on this instance | No further change. |
| §6.2 Check 6 | 𝔽₂→𝔽₄ | degree 2 and derivative of Z²+Z+1 is 1 | Pass on this instance | No further change. |
| §6.2 Check 7 | 𝔽₂(t)→𝔽₂(t^(1/2)) | total degree 2, separable degree 1, inseparable degree 2 | Pass on this instance | No further change. |
| §6.3 Check 1 | identity square over k⟦X,Y⟧ | X-kernel 0, Y-kernel modulo X is 0, residue k | Pass on this instance | No further change. |
| §6.3 Check 2 | k⟦X,Y⟧ | (0):X=0 and (X):Y=(X) | Pass on this instance | No further change. |
| §6.4 Check 1 | C₂ on ℤ₃⟦X⟧ | (f(X)+f(−X))/2 keeps even coefficients, takes 1↦1 | Pass on this instance | No further change. |
| §6.4 Check 2 | identity over 𝔽₂⟦X⟧ and ℚ⟦X⟧ | both depth 1=dimension 1; equal-characteristic theorems have these CM values | Pass on this instance | No further change. |
| §6.4 Check 3 | C₂, p=3 versus p=2 | average on 1,X is 1,0 when 2 invertible; 1/2∉ℤ₂ | Pass on this instance | No further change. |
| §6.4 Check 4 | group {1} | denominator 1, average is id and 1↦1 | Pass on this instance | No further change. |
| §6.4 Check 5 | S₃ over ℤ₅ | each variable occurs twice in orbit of X₁; coefficient 2/6=1/3, average of 1 is 1 | Pass on this instance | No further change. |
| §7.1 Check 1 | E/K | RΓ=K[0]⊕K[−1], unit (1,0), projection gives 1 | Pass on this instance | No further change. |
| §7.1 Check 2 | finite affine 𝔽₄/𝔽₂ | RΓ=𝔽₄[0], higher groups 0, coefficient retraction value 1 | Pass on this instance | No further change. |
| §7.1 Check 3 | complex elliptic cone | resolution H¹ has dimension 1; rational singularity condition fails although normality holds | Pass on this instance | No further change. |
| §7.1 Check 4 | field and node in char 2 | field satisfies both properties with unit value 1; node fails both by x∉(x+y)R but x∈(x+y)S | Pass on this instance | No further change. |
| §7.1 Check 5 | complex smooth point versus elliptic cone; characteristic-two field | rational/derived properties true,true at point and false,false at cone; field splinter and derived both true | Pass on this instance | No further change. |
| §7.1 Check 6 | identity and elliptic cone | identity cone 0; cone resolution H¹ dimension 1 separates derived from finite splitting | Pass on this instance | No further change. |
| §7.1 Check 7 | Spec 𝔽₂ | structure sheaf in degree zero has sections 𝔽₂; terms in degrees −1 and 1 are zero | Pass on this instance | No further change. |
| §7.1 Check 8 | empty scheme | structure sheaf 0, all terms and differentials 0 | Pass on this instance | No further change. |
| §7.1 Check 9 | Spec k[ε]/ε² | degree-zero sections retain ε≠0,ε²=0; reduction would have ε=0 | Pass on this instance | No further change. |
| §7.1 Check 10 | Spec(A×A)→Spec A | degree-zero unit a↦(a,a), projection returns a | Pass on this instance | No further change. |
| §7.1 Check 11 | Spec(ℤ/2)→Spec ℤ | unit 1↦1,2↦0; retraction would give 2=0 in ℤ | Pass on this instance | No further change. |
| §7.2 Check 1 | A=k,B=k[ε]/ε² | RΓ=B[0], dimension 2, projective dimension 0 | Pass on this instance | No further change. |
| §7.2 Check 2 | E/k | cohomology dimensions (1,1,0,0,…) | Pass on this instance | No further change. |
| §7.2 Check 3 | affine line | H⁰=k[T] has independent basis 1,T,T²,… of infinite dimension | Pass on this instance | No further change. |
| §7.3 Check 1 | Spec(A×A) | degree-zero algebra A²; either component has unit retraction value 1 | Pass on this instance | No further change. |
| §7.3 Check 2 | same finite cover | closure of either generic point is Spec A; composed unit id | Pass on this instance | No further change. |
| §7.4 Check 1 | Y=Spec(A×A) | first projection retracts diagonal unit with value 1; higher cohomology 0 | Pass on this instance | No further change. |
| §7.4 Check 2 | Y=Spec(A/p), A=O_K | generic fibre empty; p acts by 0 on target but p·p^(1/pʰ)≠0 in A | Pass on this instance | No further change. |
| §7.5 Check 1 | E/𝔽₂,[2] | H¹ map scalar 2=0, positive truncation has amplitude one; Spec R has H^{>0}=0 already | Pass on this instance | No further change. |
| §7.5 Check 2 | E in char 2 and 3 | maps [2]* and [3]* act by 0; identity acts by 1≠0 | Pass on this instance | No further change. |
| §7.6 Check 1 | A=𝔽₂⟦X,Y⟧, identity proper cover | derived unit id and obstruction 0 | Pass on this instance | No further change. |
| §7.6 Check 2 | field versus node in char 2 | field unit projection value 1; node ideal contraction fails on x | Pass on this instance | No further change. |
| §7.7 Check 1 | K=ℂ,E/K | unit (1,0) in ℂ[0]⊕ℂ[−1], projection value 1 | Pass on this instance | No further change. |
| §7.7 Check 2 | ℚ⊆ℚ(√2) and complex elliptic cone | divided trace values 1,0; cone resolution H¹ dimension 1 | Pass on this instance | No further change. |
| §7.7 Check 3 | E/ℂ | H¹ dimension 1, yet derived projection of (1,0) equals 1 | Pass on this instance | No further change. |
| §7.8 Check 1 | finite ℤ₂⊆ℤ₂[i] | RΓ=S[0], coefficient retraction 1,0 | Pass on this instance | No further change. |
| §7.8 Check 2 | blow-up of closed point of k⟦X,Y⟧ | H⁰=R,H^{>0}=0; unit is id under this comparison | Pass on this instance | No further change. |
| §7.8 Check 3 | same blow-up and identity cover | in both cases RΓ=R[0], cone 0, retraction composite id | Pass on this instance | No further change. |

The four worked examples compute, respectively: incompatible node constants 1 and 0; the ramified equation p=TV and the zero-divisor T in the special fibre; t²≠0 in the partial quotient and t²=0 in the full quotient; and XY≠0 but X²Y²=0 modulo (X²,Y²), with 1∉0 for the empty parameter list.

## Lean elaboration and explicit-binder audit

The final command `lake env lean` on `packages/DirectSummandsAndBigCohenMacaulay/Suggested.lean`, run from the content checkout with the required absolute argument, exits **0**. There are exactly **19** warnings. The sole warning message, repeated nineteen times, is:

```text
warning: declaration uses `sorry`
```

There are no errors or other main-file messages. The only Tau Ceti import, `TauCeti.RingTheory.RegularLocalRing.Basic`, has an available object file and supplies the regular-local domain instance used by the R⁺ signatures. No build, toolchain update or cache download was needed.

A fresh scratch copy with `#check @name` for all **30** declarations was elaborated after the residue-predicate change and the addition of the derived headlines. Every printed type was compared with its README statement. No required binder disappeared. The local/Noetherian module binders remain on the three big-module predicates and the almost predicate; completeness remains on completion-sensitive splittings; primality and residue characteristic remain on almostness and mixed-characteristic statements; finite-module and injectivity assumptions remain on every finite cover; the actual Gorenstein cover, surjection and self-injective-dimension bound remain; and weak functoriality retains locality, both complete mixed-characteristic rings, injectivity, induced-map separability and the entire coefficient-square equation. Independent source and target universes and the intended existence universes remain. The new complex and derived-unit definitions have only a scheme or scheme map as argument; the standard derived-category choice is Mathlib’s native one. The three derived headlines retain Noetherian regularity, the ℚ-algebra or prime-characteristic assumptions where required, and the proper/surjective quantifiers in the body of the actual predicate. The separability correction is in the real body of the residue predicate, whose printed type is still Prop; inspecting that body confirms the general native separability class is used.

The acceptance file contains one `import Mathlib`, one used Tau Ceti import, eleven real definitions, nineteen `theorem` declarations and nineteen `sorry` proofs. It has no admitted data, extra API catalogue, `set_option`, examples or replacement free predicates. The unstatable perfectoid, modification and relative cohomology-killing headlines are listed with their missing carriers in the module docstring. Every declared name occurs in the README; no own backticked name is missing a declaration.

Native definitions were read at the pin. `IsLocalRing` extends `Nontrivial` (`Mathlib/RingTheory/LocalRing/Defs.lean:30`). `IsRegularLocalRing` extends local and Noetherian and equates maximal-ideal generator rank with dimension (`RingTheory/RegularLocalRing/Defs.lean:51`). `IsRegularRing` extends Noetherian and tests prime localizations (line 92). Weak regularity uses each prefix quotient and its scalar-injectivity condition (`RingTheory/Regular/RegularSequence.lean:135`); genuine regularity adds `top_ne_smul` (line 146), so the zero module is weakly regular but not regular. `IsAdicComplete` extends both Hausdorffness and precompleteness (`RingTheory/AdicCompletion/Basic.lean:56`); its completion carrier is the compatible quotient family (line 171). `Module.FaithfullyFlat` extends flatness and requires a nontrivial quotient at every maximal ideal (`RingTheory/Flat/FaithfullyFlat/Basic.lean:63`). General separability tests every finitely generated intermediate extension (`FieldTheory/TranscendentalSeparable.lean:72`), while algebraic separability implies algebraicity (`FieldTheory/Separable.lean:569`). The native finite self-injective-dimension condition is `CategoryTheory.HasInjectiveDimensionLE` (`CategoryTheory/Abelian/Injective/Dimension.lean:52`). Tau Ceti's product instance requires a finite index (`TauCeti/RingTheory/Flat/Pi.lean:62`); its faithful criterion is at line 75. Tau Ceti's scheme cohomology forgets to abelian groups (`TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61`), so it does not by itself give a derived unit. The added definitions instead use native sheaf-valued pushforward, `Functor.rightDerivedFunctorPlus` (line 46) and its unit (line 95) in `Mathlib/Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean`, together with `SheafOfModules.unitToPushforwardObjUnit` in `Mathlib/Algebra/Category/ModuleCat/Sheaf/PullbackFree.lean:59`. The native single-complex comparison in `Mathlib/Algebra/Homology/Additive.lean:262` needs only zero-morphism preservation and is valid for the additive pushforward; no false exactness assumption on pushforward is inserted.

## Mechanical validation and dependency check

The folder scanners return zero in every category: undeclared README identifiers, imports, missing Mathlib import, Mathlib subimports, admitted data, admitted examples, option overrides, process residue, TeX/LaTeX residue, private paths, target numbering, empty sections and long fences. Source validation reports zero problems. Only `gaps` changes structurally in `design/plan.json`, and all text outside that value is unchanged from the inherited package. No merge-order or tooling file was modified.

The exact mandated dependency command was rerun after the supplier and gap corrections. Its output is:

```text
depcheck: 48 roadmaps, 547 edges, 0 problem(s)
```

Exit status is **0**. There is no UPWARD or CYCLE line and no insertion or movement diagnostic. The resolver reports no missing Lean names. Its only roadmap lead is the PerfectoidSpacesPartII publication-index limitation explained above; pinned declarations were checked directly because the resolver host does not itself inspect these Lake packages.
