# PKG-DirectSummandsAndBigCohenMacaulay

The package expands all 52 accepted design targets into eight layers in `packages/DirectSummandsAndBigCohenMacaulay/README.md`, preserving their API facts, Checks and worked examples. `Suggested.lean` has seven transparent predicates and sixteen headline theorems. Its final elaboration succeeds with exactly **16** warnings, each ``warning: declaration uses `sorry` ``; there are no errors and no other messages. No data definition is admitted.

Only the four package files, the top-level `gaps` value of `design/plan.json`, and this report were changed. The original four design-gap entries are preserved, each with a stable `slug`. Eight supplier-gap entries were added. A structural comparison with the original JSON shows that `gaps` is the only changed top-level key. No helper agents were used.

## Inputs and provenance

The standalone `design/review.json` and pre-existing reports named in the brief were absent. The acceptance evidence available was `design/plan.json`’s embedded review, dated 2026-10-18, including its 52 per-node verdicts and source issues E1–E22. I applied its mathematical notes after checking the claims. No fetched text was treated as an instruction; no suspicious instruction was encountered.

The content checkout is main at `a07e2024f391f3022520c3f8ad194912b3eab614`. The actual pins, confirmed both in the manifest and in the package checkouts, are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These replace the older baselines quoted in the design. Upstream shapes read were `TauCetiRoadmap/PerfectoidSpaces/README.md`, `TauCetiRoadmap/AdicEtaleGeometry/README.md`, and `Completed/Multiquadratic/README.md`; metadata was compared with `TauCetiRoadmap/PerfectoidSpaces/metadata.toml`.

The skeleton was generated from all node statements, hypotheses, proof steps, APIs, tests, acceptance examples, locators and prerequisites before prose expansion. The README has eight Layer headings, eight Examples endings and eight Dependencies endings. A coverage map checks all 52 nodes against their numbered subsections.

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
| Finite covers killing positive coherent derived cohomology in characteristic p | Not statable at the pins: The module-valued derived geometric pushforward with its natural map on positive truncations. |
| Splinters are exactly derived splinters in characteristic p | Not statable at the pins: The A-module-valued derived global-sections unit needed to define derived splinters. |
| Derived splitting over regular ℚ-algebras | Not statable at the pins: The same derived global-sections unit, with its scheme base-change interface. |
| The derived direct summand theorem | Not statable at the pins: The same A-module-valued derived global-sections unit. Degreewise abelian-group cohomology is insufficient. |

The characteristic-p R⁺ theorem is stated in its full Gorenstein-quotient generality. The absence of a predicate named “Gorenstein” does not make it unstatable: finite self-injective dimension is available as `CategoryTheory.HasInjectiveDimensionLE (ModuleCat.of A A) n`, and the signature supplies a Noetherian local Gorenstein cover and its actual surjection to R. No complete-local special case substitutes for this theorem. The almost-Cohen–Macaulay hypothesis is also statable directly on native roots and ideal colons; it has a real definition rather than an unspecified almost-regularity field.

The monomial signature is the standard deep noncontainment assertion for m<n, including dimension zero. The positive-dimensional membership direction for m≥n is elementary divisibility and remains in the README. The pure-subring signature concludes that every parameter list is regular on B itself, which is the finite-ring Cohen–Macaulay criterion of SchemeAndStackFoundations §0.17.

## Source resolution and corrections

There are fourteen lifetime source keys: thirteen certified legal texts and HH95, which the service recorded as `uncertified` because its DOI resolves to a paywall. HH95 remains a published-locator citation and is not an unresolved request. All initial works were attempted before any decision about missing references. Hochster 1973 was fetched after verifying the publisher’s public archive and supplying `publisher-open`; Hochster 2002 was read from the service’s OCR extraction. No source text was copied into the package or report. Every entry has authors, title, year, locator scheme, locators, cited sections and service provenance; Stacks’ two chapter extractions are recorded under its one key.

The Datta–Murayama work at arXiv:2007.10383v1 is **Excellence, F-singularities, and solidity**, with an appendix by Karen E. Smith, rather than the title supplied in the design. Its Proposition 5.4.1(iii) is at DATTAMURAYAMA line 1315. The non-F-solid excellent Henselian DVR counterexample is the intended one. The title and author attribution were corrected without creating another key. Chase’s *Direct products of modules*, Theorem 2.1, p.460 (CHASE60 line 139), was added to support the coherent-ring generality of §5.2. Bhatt’s published DOI was checked and recorded as `10.1007/s00222-017-0768-7`; the statements and pages use arXiv v2.

Other passage anchors checked include ANDRE18B lines 638–719 (big/almost Cohen–Macaulayness and modifications), 720–824 (existence, flat domination and weak functoriality), 867–937 (purity and Hochster’s criterion); BHATT18 lines 469–545 (ramified covers), 547–595 (Artin–Rees and the finite theorem), 604–632 and footnote 8 (the derived theorem); HOCHSTER02 lines 225–264 (the scalar quotient, criterion and denominator bound); HUNEKELYUBEZNIK lines 75–82 and Corollary 2.3 (all finite intermediate domains); HOCHSTERLC lines 623 and 687 (endomorphisms of the injective hull and duality); BMPSTWW lines 507–568 and 672 (arbitrary modules, completion and splinters); BHATT12 lines 38–45 and 378–397 (cohomology killing and derived splinters); KOVACS00 lines 11, 50 and 90 (the actual hypotheses and GR vanishing).

The additional corrections to the expanded design are:

- A finite free algebra used to force a zero extension obstruction has **positive rank**; the zero algebra cannot supply a unit retraction over a nonzero ring.
- Finite domain subalgebras of R⁺ over a complete DVR need not be DVRs. They are torsion-free finite modules, which is sufficient for the purity argument. For R=k⟦t²⟧ the subalgebra k⟦t²,t³⟧ is a finite domain of rank two but is not integrally closed: t is integral and absent.
- The dimension-sensitive quotient Check uses B=ℤ₂⟦X,Y⟧/(2X,2Y), its dimension-two quotient by (2), its dimension-one quotient by (X,Y), and the genuine parameter list (2+X,Y), whose quotient is ℤ₂/4. Using (X,Y) as parameters would be false.
- Coherence is necessary for arbitrary products; the square-zero infinite-dimensional algebra in §5.2 supplies an explicit nonflat product, rather than an uncomputed appeal to a theorem name.
- The characteristic-zero normal nonsplinter Check is explicit in characteristic two: c² is nonzero modulo (a,b) in the normal cubic, while z⁴=x³z+y³z belongs to the extended ideal after Frobenius.
- The perfectoid proper almost-splitting route uses an explicit adic modification-domination gap. SchemeAndStackFoundations §4.12’s Noetherian statement is not applied to a non-Noetherian perfectoid base.

## Duplication sweep and supplier ownership

Object searches were run against the actual pinned Mathlib and Tau Ceti files, the roadmaps on main, the tool’s index of 330 open heads, and every board package. The searches covered the ring/module predicates, tensor-unit injections, parameter lists and their colons, module completion, local cohomology and Čech comparisons, Matlis duality, full/partial modifications, Kummer and annular towers, trace splitting, arbitrary flat products, Gorenstein self-injective dimension, proper derived units, cohomology-killing covers, and the end theorems. Open-head searches used the provided roadmap tools. Existing-roadmap revisions were used only as search leads: the actual contracts of PerfectoidSpaces, DerivedModuleAlgebra, EnhancedDerivedSheaves, SchemeAndStackFoundations and StableReduction were checked on main. New-roadmap contracts were read at the available heads.

Every deletion or change of ownership from an apparent local target/API is listed below. No whole design target is silently discarded: where a design node contained a generic theorem plus a local application, the generic theorem is imported and the application is retained.

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
| Principal ramification/Riemann theory, Kummer towers, tensor purity and Krull detection | PerfectoidSpacesPartII design §§RA.0–RA.5 | Imported analytic contract only; availability limitation below |
| Characteristic-zero resolution | ResolutionOfSingularitiesCharacteristicZero §5.5 | Derived splitting and the additional GR/approximation bridge |

No other readable roadmap owns the general splinter predicates, arbitrary big/balanced module predicates, pointed partial-modification finite-witness comparison, general direct summand theorem, R⁺ characteristic-p theorem or derived direct summand theorem. The two board hits outside this package and PerfectoidSpacesPartII concerned coefficient Matlis duality in automorphic applications; they do not own these constructions. No declaration takes another roadmap’s fully qualified name.

## Availability and mathematical support limits

PerfectoidSpacesPartII is present only as `packages/PerfectoidSpacesPartII/design/README.md` and `design/plan.json`. Its RA contracts were read there, but it is absent from main, the open-head roadmap index and the supplied merge order. It is also absent from the brief’s enumerated earlier suppliers. Thus its supply authorization cannot be certified from this brief. The accepted design explicitly builds on it; duplicating its six layers here would re-plan existing work. The package preserves that ownership, records `gap:ramification-and-riemann-inputs`, and does **not** claim that this gap makes the unlisted supplier authorized. Intake must establish its position before this package can have a fully certified supplier chain. This is the one unresolved cross-roadmap citation reported by the resolver. No notion was moved from a known later roadmap: no later supplier is used; this unlisted design is an availability/order inconsistency, not evidence that its six layers should be duplicated.

The four inherited proof obligations remain visible as mathematical targets: the characteristic-zero finite-equation specialization argument (§4.10), the arbitrary-module completion/change-of-parameters proof (§0.5), the full/pointed finite bad-witness comparison (§4.3), and the characteristic-zero projective, field and approximation bridges (§7.7). The Čech-comparison part of the old G3 note is supplied by DeformationAndDerivedPatchingAlgebraPartII §K0.1. The original `gaps` notes are retained with stable slugs as design history; the README and exact contracts state the verified ownership. HH95’s detailed specialization argument was not certified from its paywalled text; existence itself is explicitly recalled in the certified ANDRE18B and BMPSTWW texts. The manuscript does not present an unproved full-algebra comparison as a consequence of a module colimit, nor infer algebra maps from pointed linear evaluation maps.

The eight added supplier gaps are the exact sentences under their supplier subsections, with matching `slug`, `needs`, `supplier`, and `section` values in `design/plan.json`: ramification-and-riemann-inputs; ramified-multielement-kummer; common-cohen-extension; finite-parameter-subring; regular-surjection-kernel; parameter-systems; perfectoid-base-modification-domination; and grauert-riemenschneider. StableReduction coherence is an existing contract and has no new gap. DerivedDeRhamCohomology §1.10 already states the complete-reduction criterion and has no new gap.

## Computed adversarial pass

These are small algebraic and geometric calculations, not assertions that an admitted general theorem has been proved. Exact arithmetic was also recomputed in scratch for the 𝔽₄ trace, the four surviving monomials modulo (X²,Y²), the bounds 5 and 1, root valuations 1,1/2,1/4,1/8, Frobenius lengths 2 and 3, the partial/full truncated quotient bases, the p-adic partial sums 4,68,16777284, and the nonabelian Reynolds coefficient 2/6=1/3. Each main target, each definition API law, the additional native predicate conventions, and the source repairs has its own row. All README Checks and worked examples were compared with their section theorem; the final Check register below records the witness used for each. Indices, directions of maps and scalar towers were checked in both the prose and the elaborated signatures.

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
| §0.9: Divided trace | quadratic basis 1,√a; φ=(1+√5)/2 over ℤ | Tr(1)=2, Tr(√a)=0; Tr(φ)/2=1/2∉ℤ | Pass | Invertibility of the degree, or ℚ-algebra hypothesis. |
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
| §4.12: Weak functoriality from almost squares | identity square over ℤ₂ | each root maps to itself and divides itself with quotient 1; induced denominator exponent unchanged | Pass | Transport roots in the stated divisibility direction. |
| §5.1: General direct summand | R=0,S=0; normal cubic Frobenius | 0=1 makes the unique retraction valid; c²≠0 in A/(a,b), but its image lies in (a,b)S | Pass | Zero global ring allowed; normality alone insufficient. |
| §5.2: Coherent flat products | ∏ℤ; empty product; R=k⊕V with V²=0 | integer multiplication has kernel 0; empty product residue 0; (x₁,x₂,…) is x₀-torsion outside VM | Pass | Infinite/coherent variant separated from the finite native theorem. |
| §5.3: Flat domination | S=ℤ₂×𝔽₂ over ℤ₂ | project to ℤ₂ with ρ(1)=1; Tor₁(𝔽₂,𝔽₂)=𝔽₂ on the smaller component | Pass | Choose a component receiving the base injectively. |
| §5.4: Absolute integral closure splits | complete DVR; Henselian nonsolid DVR | finite torsion-free subalgebra has basis coefficient 1↦1; nonsolid root algebra has dual 0 | Pass | Completeness retained; finite subalgebras need not be DVRs. |
| §5.5: Contraction and monomial theorem | k⟦X,Y⟧, n=2,m=1,2; d=0 | XY mod (X²,Y²)≠0, X²Y² mod that ideal=0; empty product 1∉0 for all exponents | Pass | The iff membership form requires d≥1. |
| §6.1: Purity under completion and compatible coefficients | k[X]_(X)→k[X,Y]_(X,Y) | evaluation Y=0 sends each Xⁿ to Xⁿ before and after completion; induced residue map is id_k | Pass | Common coefficient base change, not unrelated extensions. |
| §6.2: Weak functoriality with regular target | ℤ₂⟦T⟧→ℤ₂⟦T,V⟧/(TV−2) | 2=TV lies in m²; residue map 𝔽₂→𝔽₂ has separable degree 1; parameter quotients are nonzero | Pass | Ramified regular target is included. |
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
| Ramification/Riemann contract | g=1 and the p-root tower | annular comparison id; lim¹ of the constant tower 0; rₙ=rₙ₊₁ᵖ gives root-ideal square equal to itself | Contract example only | Availability gap remains |
| Ramified multi-element Kummer contract | ℤ₂⟦T,V⟧/(TV−2) | dim 2, parameters T,V; 2=TV∈m²; two named discriminants T,V | Contract example only | Ramified target cannot be replaced by an unramified one |
| Common Cohen extension contract | k=k′=𝔽₂; k′=𝔽₄ | completed tensors ℤ₂ and W(𝔽₄), respectively; comparison maps identities, coefficient ranks 1 and 2 | Contract example only | Common map, not separate extensions |
| Finite parameter subring contract | B=ℤ₂⟦X⟧ with (4,X) | quotient B/(4,X)=ℤ/4; coefficient series map T↦X has rank 1 and kernel 0 | Contract example only | Actual coefficient map fixed |
| Regular-surjection kernel contract | k⟦X,Y⟧→k⟦Y⟧ | kernel (X), dimensions 2 and 1, one regular generator | Contract example only | Dimension difference retained |
| Parameter-system transport contract | field; (X²) in k⟦X⟧; unequal-dimensional components | radicals 0,(X); lengths 0,1; component dimensions 2 and 1 | Contract example only | Dimension-sensitive transport |
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

### Final README Check register

The subsection and Check index identify the exact statement. General compatibility Checks are instantiated on the explicit small example recorded here; these are discriminating tests, not proofs of their universal claims.

| Statement | Instances tried | Computed values | Result | Change |
|---|---|---|---|---|
| §0.1 Check 1 | ℤ⊆ℤ[i]; ℝ⊆ℂ; node normalization | ρ(1)=1, ρ(i)=0; Re(i²)=−1≠0=Re(i)²; x∈(x+y)S but x∉(x+y)R | Pass | Agrees with the stated hypotheses. |
| §0.1 Check 2 | ℤ⊆ℤ[i]; ℝ⊆ℂ; node normalization | ρ(1)=1, ρ(i)=0; Re(i²)=−1≠0=Re(i)²; x∈(x+y)S but x∉(x+y)R | Pass | Agrees with the stated hypotheses. |
| §0.1 Check 3 | ℤ⊆ℤ[i] | coefficient projection: 1↦1,i↦0; quotient free on i | Pass | Agrees with the stated hypotheses. |
| §0.1 Check 4 | ℤ⊆ℤ[i]; ℝ⊆ℂ; node normalization | ρ(1)=1, ρ(i)=0; Re(i²)=−1≠0=Re(i)²; x∈(x+y)S but x∉(x+y)R | Pass | Agrees with the stated hypotheses. |
| §0.1 Check 5 | ℚ over ℤ_(p), or ℤ→ℚ | pℚ=ℚ and ℚ/pℚ=0; Hom_ℤ(ℚ,ℤ)=0 | Pass | Agrees with the stated hypotheses. |
| §0.1 Check 6 | ℤ⊆ℤ[i]; ℝ⊆ℂ; node normalization | ρ(1)=1, ρ(i)=0; Re(i²)=−1≠0=Re(i)²; x∈(x+y)S but x∉(x+y)R | Pass | Agrees with the stated hypotheses. |
| §0.1 Check 7 | ℤ⊆ℤ[i]; ℝ⊆ℂ; node normalization | ρ(1)=1, ρ(i)=0; Re(i²)=−1≠0=Re(i)²; x∈(x+y)S but x∉(x+y)R | Pass | Agrees with the stated hypotheses. |
| §0.1 Check 8 | node normalization | x=(x,y)(1,0) upstairs; required constant coefficients 1 and 0 cannot agree downstairs | Pass | Agrees with the stated hypotheses. |
| §0.1 Check 9 | ℤ⊆ℤ[i]; ℝ⊆ℂ; node normalization | ρ(1)=1, ρ(i)=0; Re(i²)=−1≠0=Re(i)²; x∈(x+y)S but x∉(x+y)R | Pass | Agrees with the stated hypotheses. |
| §0.1 Check 10 | ℤ⊆ℤ[i]; ℝ⊆ℂ; node normalization | ρ(1)=1, ρ(i)=0; Re(i²)=−1≠0=Re(i)²; x∈(x+y)S but x∉(x+y)R | Pass | Agrees with the stated hypotheses. |
| §0.2 Check 1 | R=k, m=0 | empty parameter list; M/mM=M; nonzero algebra has a unit coefficient projection 1↦1 | Pass | Agrees with the stated hypotheses. |
| §0.2 Check 2 | k; k[ε]/ε²; k[t²,t³]⊆k[t] | field unit projection 1↦1; ε²=0 with ε≠0; quotient of cusp extension has basis t and rank 0 | Pass | Agrees with the stated hypotheses. |
| §0.2 Check 3 | k; k[ε]/ε²; k[t²,t³]⊆k[t] | field unit projection 1↦1; ε²=0 with ε≠0; quotient of cusp extension has basis t and rank 0 | Pass | Agrees with the stated hypotheses. |
| §0.2 Check 4 | node normalization | x=(x,y)(1,0) upstairs; required constant coefficients 1 and 0 cannot agree downstairs | Pass | Agrees with the stated hypotheses. |
| §0.2 Check 5 | k; k[ε]/ε²; k[t²,t³]⊆k[t] | field unit projection 1↦1; ε²=0 with ε≠0; quotient of cusp extension has basis t and rank 0 | Pass | Agrees with the stated hypotheses. |
| §0.2 Check 6 | k; k[ε]/ε²; k[t²,t³]⊆k[t] | field unit projection 1↦1; ε²=0 with ε≠0; quotient of cusp extension has basis t and rank 0 | Pass | Agrees with the stated hypotheses. |
| §0.2 Check 7 | R=k, m=0 | empty parameter list; M/mM=M; nonzero algebra has a unit coefficient projection 1↦1 | Pass | Agrees with the stated hypotheses. |
| §0.2 Check 8 | k; k[ε]/ε²; k[t²,t³]⊆k[t] | field unit projection 1↦1; ε²=0 with ε≠0; quotient of cusp extension has basis t and rank 0 | Pass | Agrees with the stated hypotheses. |
| §0.2 Check 9 | node normalization | x=(x,y)(1,0) upstairs; required constant coefficients 1 and 0 cannot agree downstairs | Pass | Agrees with the stated hypotheses. |
| §0.3 Check 1 | k⟦X,Y⟧; zero module; ℚ over ℤ_(p) | successive quotients k⟦Y⟧,k; zero module quotient 0; ℚ/pℚ=0 although multiplication by p is injective | Pass | Agrees with the stated hypotheses. |
| §0.3 Check 2 | R=k, m=0 | empty parameter list; M/mM=M; nonzero algebra has a unit coefficient projection 1↦1 | Pass | Agrees with the stated hypotheses. |
| §0.3 Check 3 | ℚ over ℤ_(p), or ℤ→ℚ | pℚ=ℚ and ℚ/pℚ=0; Hom_ℤ(ℚ,ℤ)=0 | Pass | Agrees with the stated hypotheses. |
| §0.3 Check 4 | k⟦X,Y⟧; zero module; ℚ over ℤ_(p) | successive quotients k⟦Y⟧,k; zero module quotient 0; ℚ/pℚ=0 although multiplication by p is injective | Pass | Agrees with the stated hypotheses. |
| §0.3 Check 5 | k⟦X,Y⟧; zero module; ℚ over ℤ_(p) | successive quotients k⟦Y⟧,k; zero module quotient 0; ℚ/pℚ=0 although multiplication by p is injective | Pass | Agrees with the stated hypotheses. |
| §0.3 Check 6 | k⟦X,Y⟧; zero module; ℚ over ℤ_(p) | successive quotients k⟦Y⟧,k; zero module quotient 0; ℚ/pℚ=0 although multiplication by p is injective | Pass | Agrees with the stated hypotheses. |
| §0.3 Check 7 | zero carrier | maximal-ideal quotient 0; surviving-root condition false; weak action kernel 0 | Pass | Agrees with the stated hypotheses. |
| §0.3 Check 8 | dimension zero / empty list | length 0, product 1, generated ideal 0; 1∉0 | Pass | Agrees with the stated hypotheses. |
| §0.3 Check 9 | k⟦X,Y⟧; zero module; ℚ over ℤ_(p) | successive quotients k⟦Y⟧,k; zero module quotient 0; ℚ/pℚ=0 although multiplication by p is injective | Pass | Agrees with the stated hypotheses. |
| §0.4 Check 1 | R=k⟦X⟧, M=R and R/(X) | R/XR=k and X has kernel 0 on R; X·1=0 on R/(X), with 1≠0 | Pass | Agrees with the stated hypotheses. |
| §0.4 Check 2 | R=k, m=0 | empty parameter list; M/mM=M; nonzero algebra has a unit coefficient projection 1↦1 | Pass | Agrees with the stated hypotheses. |
| §0.4 Check 3 | R=k⟦X⟧, M=R and R/(X) | R/XR=k and X has kernel 0 on R; X·1=0 on R/(X), with 1≠0 | Pass | Agrees with the stated hypotheses. |
| §0.4 Check 4 | R=k⟦X⟧, M=R and R/(X) | R/XR=k and X has kernel 0 on R; X·1=0 on R/(X), with 1≠0 | Pass | Agrees with the stated hypotheses. |
| §0.4 Check 5 | R=k⟦X⟧, M=R and R/(X) | R/XR=k and X has kernel 0 on R; X·1=0 on R/(X), with 1≠0 | Pass | Agrees with the stated hypotheses. |
| §0.4 Check 6 | R=k⟦X⟧, M=R and R/(X) | R/XR=k and X has kernel 0 on R; X·1=0 on R/(X), with 1≠0 | Pass | Agrees with the stated hypotheses. |
| §0.5 Check 1 | R=k[X]_(X), M=R; M=0 | completion k⟦X⟧, X-kernel 0 and quotient k; completion of 0 and its residue quotient are 0 | Pass | Agrees with the stated hypotheses. |
| §0.5 Check 2 | R=k[X]_(X), M=R; M=0 | completion k⟦X⟧, X-kernel 0 and quotient k; completion of 0 and its residue quotient are 0 | Pass | Agrees with the stated hypotheses. |
| §0.5 Check 3 | zero carrier | maximal-ideal quotient 0; surviving-root condition false; weak action kernel 0 | Pass | Agrees with the stated hypotheses. |
| §0.6 Check 1 | DVR A, C=A; C=Frac A | Tor_i(A/I,A)=0 for i>0, A/ϖA=k; Frac A/ϖ Frac A=0 | Pass | Agrees with the stated hypotheses. |
| §0.6 Check 2 | DVR A, C=A; C=Frac A | Tor_i(A/I,A)=0 for i>0, A/ϖA=k; Frac A/ϖ Frac A=0 | Pass | Agrees with the stated hypotheses. |
| §0.7 Check 1 | id_A; 2:ℤ→ℤ; ℤ⊆ℤ[i] | cones 0, ℤ/2, ℤ; Ext classes 0,1∈ℤ/2,0 | Pass | Agrees with the stated hypotheses. |
| §0.7 Check 2 | id_A; 2:ℤ→ℤ; ℤ⊆ℤ[i] | cones 0, ℤ/2, ℤ; Ext classes 0,1∈ℤ/2,0 | Pass | Agrees with the stated hypotheses. |
| §0.7 Check 3 | id_A; 2:ℤ→ℤ; ℤ⊆ℤ[i] | cones 0, ℤ/2, ℤ; Ext classes 0,1∈ℤ/2,0 | Pass | Agrees with the stated hypotheses. |
| §0.7 Check 4 | id_A; 2:ℤ→ℤ; ℤ⊆ℤ[i] | cones 0, ℤ/2, ℤ; Ext classes 0,1∈ℤ/2,0 | Pass | Agrees with the stated hypotheses. |
| §0.7 Check 5 | id_A; 2:ℤ→ℤ; ℤ⊆ℤ[i] | cones 0, ℤ/2, ℤ; Ext classes 0,1∈ℤ/2,0 | Pass | Agrees with the stated hypotheses. |
| §0.7 Check 6 | ℤ⊆ℤ[i] | coefficient projection: 1↦1,i↦0; quotient free on i | Pass | Agrees with the stated hypotheses. |
| §0.8 Check 1 | S=A×A/I with I≠0 | first projection has kernel 0 on A; second has kernel I; each diagonal unit maps to 1 | Pass | Agrees with the stated hypotheses. |
| §0.8 Check 2 | S=A×A/I with I≠0 | first projection has kernel 0 on A; second has kernel I; each diagonal unit maps to 1 | Pass | Agrees with the stated hypotheses. |
| §0.9 Check 1 | quadratic integer φ=(1+√5)/2 | Tr(φ)=1, divided trace 1/2∉ℤ | Pass | Agrees with the stated hypotheses. |
| §0.9 Check 2 | quadratic basis 1,√a; φ=(1+√5)/2 over ℤ | Tr(1)=2, Tr(√a)=0; Tr(φ)/2=1/2∉ℤ | Pass | Agrees with the stated hypotheses. |
| §0.10 Check 1 | field and DVR; k[ε]/ε² over k | coefficient functional takes 1↦1, ε↦0; a finite torsion-free DVR module has torsion 0 | Pass | Agrees with the stated hypotheses. |
| §0.10 Check 2 | field and DVR; k[ε]/ε² over k | coefficient functional takes 1↦1, ε↦0; a finite torsion-free DVR module has torsion 0 | Pass | Agrees with the stated hypotheses. |
| §0.10 Check 3 | field and DVR; k[ε]/ε² over k | coefficient functional takes 1↦1, ε↦0; a finite torsion-free DVR module has torsion 0 | Pass | Agrees with the stated hypotheses. |
| §1.1 Check 1 | 𝔽₂⟦X⟧ with X↦X²; V⟦X⟧ with r fixed | rank 2 over the image; intersections of (X^{2ʲ}) are 0 and of (r,X^{2ʲ}) are (r) | Pass | Agrees with the stated hypotheses. |
| §1.1 Check 2 | 𝔽₂⟦X⟧ with X↦X²; V⟦X⟧ with r fixed | rank 2 over the image; intersections of (X^{2ʲ}) are 0 and of (r,X^{2ʲ}) are (r) | Pass | Agrees with the stated hypotheses. |
| §1.1 Check 3 | 𝔽₂⟦X⟧ with X↦X²; V⟦X⟧ with r fixed | rank 2 over the image; intersections of (X^{2ʲ}) are 0 and of (r,X^{2ʲ}) are (r) | Pass | Agrees with the stated hypotheses. |
| §1.2 Check 1 | field; non-F-solid Henselian DVR V | field projection has value 1; Hom_V(V^{1/p},V)=0, so every functional takes 1↦0 | Pass | Agrees with the stated hypotheses. |
| §1.2 Check 2 | excellent Henselian nonsolid DVR V | Hom_V(V^{1/p},V)=0; required value ρ(1)=1 is impossible | Pass | Agrees with the stated hypotheses. |
| §1.2 Check 3 | field; non-F-solid Henselian DVR V | field projection has value 1; Hom_V(V^{1/p},V)=0, so every functional takes 1↦0 | Pass | Agrees with the stated hypotheses. |
| §1.2 Check 4 | ℚ over ℤ_(p), or ℤ→ℚ | pℚ=ℚ and ℚ/pℚ=0; Hom_ℤ(ℚ,ℤ)=0 | Pass | Agrees with the stated hypotheses. |
| §1.2 Check 5 | field; non-F-solid Henselian DVR V | field projection has value 1; Hom_V(V^{1/p},V)=0, so every functional takes 1↦0 | Pass | Agrees with the stated hypotheses. |
| §1.3 Check 1 | p=2,3, A=𝔽_p⟦X⟧⊆A[X^{1/p}] | basis lengths 2 and 3; projections take 1↦1 and each fractional monomial↦0 | Pass | Agrees with the stated hypotheses. |
| §1.3 Check 2 | quadratic integer φ=(1+√5)/2 | Tr(φ)=1, divided trace 1/2∉ℤ | Pass | Agrees with the stated hypotheses. |
| §2.1 Check 1 | A=ℤ, I=ℤ, S=ℤ/2; M=ℤ/2 | all I-power quotients 0, but 1 has no retraction; Hom(M,ℤ)=0 versus Hom(M,ℤ/2ⁿ)=ℤ/2 with zero next-to-previous map | Pass | Agrees with the stated hypotheses. |
| §2.1 Check 2 | A=ℤ, I=ℤ, S=ℤ/2; M=ℤ/2 | all I-power quotients 0, but 1 has no retraction; Hom(M,ℤ)=0 versus Hom(M,ℤ/2ⁿ)=ℤ/2 with zero next-to-previous map | Pass | Agrees with the stated hypotheses. |
| §2.1 Check 3 | A=ℤ, I=ℤ, S=ℤ/2; M=ℤ/2 | all I-power quotients 0, but 1 has no retraction; Hom(M,ℤ)=0 versus Hom(M,ℤ/2ⁿ)=ℤ/2 with zero next-to-previous map | Pass | Agrees with the stated hypotheses. |
| §2.2 Check 1 | A=ℤ₂, g=1, m=1,2 | class of pg is 0 mod 2 and 2≠0 mod 4; splitting at level 2 reduces to level 1 | Pass | Agrees with the stated hypotheses. |
| §2.2 Check 2 | A=ℤ₂, g=1, m=1,2 | class of pg is 0 mod 2 and 2≠0 mod 4; splitting at level 2 reduces to level 1 | Pass | Agrees with the stated hypotheses. |
| §2.3 Check 1 | n=0, k=𝔽₂; n=1 | base ring ℤ₂; a free basis containing 1 gives coefficients (1,0); adjoining one formal variable preserves that value | Pass | Agrees with the stated hypotheses. |
| §2.3 Check 2 | n=0, k=𝔽₂; n=1 | base ring ℤ₂; a free basis containing 1 gives coefficients (1,0); adjoining one formal variable preserves that value | Pass | Agrees with the stated hypotheses. |
| §3.1 Check 1 | p−(p²+X²); p−X² | u=1−p is a unit and normalized f=X²/(1−p) has constant 0; p=X² in the ramified example | Pass | Agrees with the stated hypotheses. |
| §3.1 Check 2 | p−(p²+X²); p−X² | u=1−p is a unit and normalized f=X²/(1−p) has constant 0; p=X² in the ramified example | Pass | Agrees with the stated hypotheses. |
| §3.2 Check 1 | A₀=ℤ₂; ramified p=X² | root valuations 1,1/2,1/4,…; gᵖ=p·u with u a unit; p becomes rooted in A | Pass | Agrees with the stated hypotheses. |
| §3.2 Check 2 | A₀=ℤ₂; ramified p=X² | root valuations 1,1/2,1/4,…; gᵖ=p·u with u a unit; p becomes rooted in A | Pass | Agrees with the stated hypotheses. |
| §3.2 Check 3 | A₀=ℤ₂; ramified p=X² | root valuations 1,1/2,1/4,…; gᵖ=p·u with u a unit; p becomes rooted in A | Pass | Agrees with the stated hypotheses. |
| §3.2 Check 4 | A₀=ℤ₂; ramified p=X² | root valuations 1,1/2,1/4,…; gᵖ=p·u with u a unit; p becomes rooted in A | Pass | Agrees with the stated hypotheses. |
| §3.2 Check 5 | A₀=ℤ₂; ramified p=X² | root valuations 1,1/2,1/4,…; gᵖ=p·u with u a unit; p becomes rooted in A | Pass | Agrees with the stated hypotheses. |
| §3.2 Check 6 | quadratic integer φ=(1+√5)/2 | Tr(φ)=1, divided trace 1/2∉ℤ | Pass | Agrees with the stated hypotheses. |
| §3.3 Check 1 | A₀=ℤ₂, A=O_K, M=𝔽₂ | 2^{1/2} has valuation 1/2<1, so its class mod 2 is nonzero; Tor_i(A₀,A)=0 for i>0 | Pass | Agrees with the stated hypotheses. |
| §3.3 Check 2 | quadratic integer φ=(1+√5)/2 | Tr(φ)=1, divided trace 1/2∉ℤ | Pass | Agrees with the stated hypotheses. |
| §3.4 Check 1 | p=2, g=1, m=2,3 | p²g is 0 mod 4 and 4≠0 mod 8; nonzero Ext generator over ℤ₂ remains 1 modulo 2 | Pass | Agrees with the stated hypotheses. |
| §3.4 Check 2 | p=2, g=1, m=2,3 | p²g is 0 mod 4 and 4≠0 mod 8; nonzero Ext generator over ℤ₂ remains 1 modulo 2 | Pass | Agrees with the stated hypotheses. |
| §3.5 Check 1 | g=1; 𝔽₄/𝔽₂ | annular equation U=pⁿ gives the identity model; Tr(1)=0, Tr(ω)=1 and Tr(ω·1)=1 | Pass | Agrees with the stated hypotheses. |
| §3.5 Check 2 | g=1; 𝔽₄/𝔽₂ | annular equation U=pⁿ gives the identity model; Tr(1)=0, Tr(ω)=1 and Tr(ω·1)=1 | Pass | Agrees with the stated hypotheses. |
| §3.5 Check 3 | 𝔽₄/𝔽₂ | Tr(1)=0,Tr(ω)=1; z↦Tr(ωz) takes 1↦1 | Pass | Agrees with the stated hypotheses. |
| §3.6 Check 1 | constant tower V; zero perfect complex | lim V=V, lim¹V=0; both Hom groups for Q=0 are 0 | Pass | Agrees with the stated hypotheses. |
| §3.6 Check 2 | constant tower V; zero perfect complex | lim V=V, lim¹V=0; both Hom groups for Q=0 are 0 | Pass | Agrees with the stated hypotheses. |
| §3.7 Check 1 | Y²−X−p over ℤ_p⟦X⟧, p=2,3 | basis 1,Y; ρ(1)=1,ρ(Y)=0; discriminant 4(X+p), with g mod p=X≠0 | Pass | Agrees with the stated hypotheses. |
| §3.7 Check 2 | Y²−X−p over ℤ_p⟦X⟧, p=2,3 | basis 1,Y; ρ(1)=1,ρ(Y)=0; discriminant 4(X+p), with g mod p=X≠0 | Pass | Agrees with the stated hypotheses. |
| §4.1 Check 1 | D=O_K over ℤ₂; singular k⟦X,Y⟧/(XY,Y²), π=1; D=0 | parameter colon 0 in O_K, root valuation 1/2<1; singular colon contains Y≠0 and 1·Y=Y; zero algebra surviving-root condition false | Pass | Agrees with the stated hypotheses. |
| §4.1 Check 2 | D=O_K over ℤ₂; singular k⟦X,Y⟧/(XY,Y²), π=1; D=0 | parameter colon 0 in O_K, root valuation 1/2<1; singular colon contains Y≠0 and 1·Y=Y; zero algebra surviving-root condition false | Pass | Agrees with the stated hypotheses. |
| §4.1 Check 3 | D=O_K over ℤ₂; singular k⟦X,Y⟧/(XY,Y²), π=1; D=0 | parameter colon 0 in O_K, root valuation 1/2<1; singular colon contains Y≠0 and 1·Y=Y; zero algebra surviving-root condition false | Pass | Agrees with the stated hypotheses. |
| §4.1 Check 4 | R=k, m=0 | empty parameter list; M/mM=M; nonzero algebra has a unit coefficient projection 1↦1 | Pass | Agrees with the stated hypotheses. |
| §4.1 Check 5 | D=O_K over ℤ₂; singular k⟦X,Y⟧/(XY,Y²), π=1; D=0 | parameter colon 0 in O_K, root valuation 1/2<1; singular colon contains Y≠0 and 1·Y=Y; zero algebra surviving-root condition false | Pass | Agrees with the stated hypotheses. |
| §4.1 Check 6 | zero carrier | maximal-ideal quotient 0; surviving-root condition false; weak action kernel 0 | Pass | Agrees with the stated hypotheses. |
| §4.2 Check 1 | T=R[t]/(Xt), k=0; zero M | scalar quotient retains t²≠0, full quotient sends t²↦0; e=0 belongs to m·0 | Pass | Agrees with the stated hypotheses. |
| §4.2 Check 2 | T=R[t]/(Xt), k=0; zero M | scalar quotient retains t²≠0, full quotient sends t²↦0; e=0 belongs to m·0 | Pass | Agrees with the stated hypotheses. |
| §4.2 Check 3 | trivial relation y·0=x·0, degree 1 | partial quotient R⊕(R/(x))X has a nonzero x-torsion summand | Pass | Agrees with the stated hypotheses. |
| §4.2 Check 4 | T=R[t]/(Xt), k=0; zero M | scalar quotient retains t²≠0, full quotient sends t²↦0; e=0 belongs to m·0 | Pass | Agrees with the stated hypotheses. |
| §4.2 Check 5 | R[t]/(xt) | t²≠0 modulo Rt; t²=0 modulo Tt | Pass | Agrees with the stated hypotheses. |
| §4.2 Check 6 | trivial relation y·0=x·0, degree 1 | partial quotient R⊕(R/(x))X has a nonzero x-torsion summand | Pass | Agrees with the stated hypotheses. |
| §4.2 Check 7 | zero carrier | maximal-ideal quotient 0; surviving-root condition false; weak action kernel 0 | Pass | Agrees with the stated hypotheses. |
| §4.3 Check 1 | R=k⟦X⟧; T=R/(X) | evaluation preserves 1≠0 for R; relation X·1=0 gives partial quotient 0 for T, hence badness | Pass | Agrees with the stated hypotheses. |
| §4.3 Check 2 | R=k⟦X⟧; T=R/(X) | evaluation preserves 1≠0 for R; relation X·1=0 gives partial quotient 0 for T, hence badness | Pass | Agrees with the stated hypotheses. |
| §4.4 Check 1 | c=1 | all powers c^{-N}=1 and denominator bound gives the submodule T | Pass | Agrees with the stated hypotheses. |
| §4.4 Check 2 | N=1,D=2 and N=0,D=1 | exponents 5 and 1; c^{-1}(c^{-2})²=c^{-5} | Pass | Agrees with the stated hypotheses. |
| §4.4 Check 3 | R² with e=e₁, u=xe₂ | evaluation relation x−0=x≠0 versus x−x=0 after normalization | Pass | Agrees with the stated hypotheses. |
| §4.5 Check 1 | B=ℤ₂,D=O_K | v(2^{1/2ʰ})=2^{-h}<1=v(2), so the root is not in 2D; a bad sequence would force the opposite containment | Pass | Agrees with the stated hypotheses. |
| §4.5 Check 2 | quadratic integer φ=(1+√5)/2 | Tr(φ)=1, divided trace 1/2∉ℤ | Pass | Agrees with the stated hypotheses. |
| §4.6 Check 1 | A=ℤ₂, x₁=4, g=1 | 2∈(π)∩A but 2∉4A; first parameter acts injectively on the torsion-free model | Pass | Agrees with the stated hypotheses. |
| §4.6 Check 2 | A=ℤ₂, x₁=4, g=1 | 2∈(π)∩A but 2∉4A; first parameter acts injectively on the torsion-free model | Pass | Agrees with the stated hypotheses. |
| §4.7 Check 1 | B=ℤ₂⟦X,Y⟧/(2X,2Y) | dimensions of quotients by (2) and (X,Y) are 2 and 1; (2+X,Y) gives quotient ℤ₂/4 | Pass | Agrees with the stated hypotheses. |
| §4.7 Check 2 | unequal-dimensional components | dimensions 2 and 1; parameter quotient ℤ₂/4; image list (2,0) on smaller component | Pass | Agrees with the stated hypotheses. |
| §4.8 Check 1 | B=ℤ₂⟦X,Y⟧/(2X) | dim B=2, char B=0; maximal-dimensional quotient B/(2)=𝔽₂⟦X,Y⟧ has char 2 and dimension 2 | Pass | Agrees with the stated hypotheses. |
| §4.8 Check 2 | mixed ring with p-torsion | char B=0, dim B=2; B/(2)=𝔽₂⟦X,Y⟧ has char 2 and dim 2 | Pass | Agrees with the stated hypotheses. |
| §4.9 Check 1 | R=𝔽₂, A=𝔽₂, n=0 | self-injective dimension 0; empty parameters; R⁺/mR⁺=algebraic closure≠0 | Pass | Agrees with the stated hypotheses. |
| §4.9 Check 2 | R=𝔽₂, A=𝔽₂, n=0 | self-injective dimension 0; empty parameters; R⁺/mR⁺=algebraic closure≠0 | Pass | Agrees with the stated hypotheses. |
| §4.9 Check 3 | dimension zero / empty list | length 0, product 1, generated ideal 0; 1∉0 | Pass | Agrees with the stated hypotheses. |
| §4.10 Check 1 | R=ℚ[ε]/ε², C=ℚ | dim R=0, εC=0, C/m_RC=ℚ≠0 | Pass | Agrees with the stated hypotheses. |
| §4.10 Check 2 | R=ℚ[ε]/ε², C=ℚ | dim R=0, εC=0, C/m_RC=ℚ≠0 | Pass | Agrees with the stated hypotheses. |
| §4.11 Check 1 | R=𝔽₂[ε]/ε², C=𝔽₂ | dim 0; empty list; m_RC=0 and residue dimension 1 | Pass | Agrees with the stated hypotheses. |
| §4.11 Check 2 | dimension zero / empty list | length 0, product 1, generated ideal 0; 1∉0 | Pass | Agrees with the stated hypotheses. |
| §4.12 Check 1 | identity square over ℤ₂ | each root maps to itself and divides itself with quotient 1; induced denominator exponent unchanged | Pass | Agrees with the stated hypotheses. |
| §4.12 Check 2 | identity square over ℤ₂ | each root maps to itself and divides itself with quotient 1; induced denominator exponent unchanged | Pass | Agrees with the stated hypotheses. |
| §5.1 Check 1 | R=0,S=0; normal cubic Frobenius | 0=1 makes the unique retraction valid; c²≠0 in A/(a,b), but its image lies in (a,b)S | Pass | Agrees with the stated hypotheses. |
| §5.1 Check 2 | R=0,S=0; normal cubic Frobenius | 0=1 makes the unique retraction valid; c²≠0 in A/(a,b), but its image lies in (a,b)S | Pass | Agrees with the stated hypotheses. |
| §5.1 Check 3 | R=0,S=0; normal cubic Frobenius | 0=1 makes the unique retraction valid; c²≠0 in A/(a,b), but its image lies in (a,b)S | Pass | Agrees with the stated hypotheses. |
| §5.1 Check 4 | normal cubic Frobenius | c²≠0 in 𝔽₂[c]/c³, while z⁴=x³z+y³z∈(x²,y²) | Pass | Agrees with the stated hypotheses. |
| §5.2 Check 1 | ∏ℤ; empty product; R=k⊕V with V²=0 | integer multiplication has kernel 0; empty product residue 0; (x₁,x₂,…) is x₀-torsion outside VM | Pass | Agrees with the stated hypotheses. |
| §5.2 Check 2 | ∏ℤ; empty product; R=k⊕V with V²=0 | integer multiplication has kernel 0; empty product residue 0; (x₁,x₂,…) is x₀-torsion outside VM | Pass | Agrees with the stated hypotheses. |
| §5.2 Check 3 | empty product of modules over nonzero k | module 0 is flat; residue quotient 0, so it is not faithfully flat | Pass | Agrees with the stated hypotheses. |
| §5.2 Check 4 | ∏ℤ; empty product; R=k⊕V with V²=0 | integer multiplication has kernel 0; empty product residue 0; (x₁,x₂,…) is x₀-torsion outside VM | Pass | Agrees with the stated hypotheses. |
| §5.2 Check 5 | square-zero R=k⊕V and M=R^ℕ | x₀·(x₁,x₂,…)=0; vector not in VM since its coordinates have infinite span | Pass | Agrees with the stated hypotheses. |
| §5.3 Check 1 | S=ℤ₂×𝔽₂ over ℤ₂ | project to ℤ₂ with ρ(1)=1; Tor₁(𝔽₂,𝔽₂)=𝔽₂ on the smaller component | Pass | Agrees with the stated hypotheses. |
| §5.3 Check 2 | S=ℤ₂×𝔽₂ over ℤ₂ | project to ℤ₂ with ρ(1)=1; Tor₁(𝔽₂,𝔽₂)=𝔽₂ on the smaller component | Pass | Agrees with the stated hypotheses. |
| §5.3 Check 3 | S=ℤ₂×𝔽₂ over ℤ₂ | project to ℤ₂ with ρ(1)=1; Tor₁(𝔽₂,𝔽₂)=𝔽₂ on the smaller component | Pass | Agrees with the stated hypotheses. |
| §5.4 Check 1 | complete DVR; Henselian nonsolid DVR | finite torsion-free subalgebra has basis coefficient 1↦1; nonsolid root algebra has dual 0 | Pass | Agrees with the stated hypotheses. |
| §5.4 Check 2 | complete DVR; Henselian nonsolid DVR | finite torsion-free subalgebra has basis coefficient 1↦1; nonsolid root algebra has dual 0 | Pass | Agrees with the stated hypotheses. |
| §5.4 Check 3 | complete DVR; Henselian nonsolid DVR | finite torsion-free subalgebra has basis coefficient 1↦1; nonsolid root algebra has dual 0 | Pass | Agrees with the stated hypotheses. |
| §5.5 Check 1 | node normalization | x=(x,y)(1,0) upstairs; required constant coefficients 1 and 0 cannot agree downstairs | Pass | Agrees with the stated hypotheses. |
| §5.5 Check 2 | k⟦X,Y⟧, n=2,m=1,2; d=0 | XY mod (X²,Y²)≠0, X²Y² mod that ideal=0; empty product 1∉0 for all exponents | Pass | Agrees with the stated hypotheses. |
| §5.5 Check 3 | k⟦X,Y⟧, n=2,m=1,2; d=0 | XY mod (X²,Y²)≠0, X²Y² mod that ideal=0; empty product 1∉0 for all exponents | Pass | Agrees with the stated hypotheses. |
| §5.5 Check 4 | k⟦X,Y⟧, n=2,m=1,2; d=0 | XY mod (X²,Y²)≠0, X²Y² mod that ideal=0; empty product 1∉0 for all exponents | Pass | Agrees with the stated hypotheses. |
| §6.1 Check 1 | k[X]_(X)→k[X,Y]_(X,Y) | evaluation Y=0 sends each Xⁿ to Xⁿ before and after completion; induced residue map is id_k | Pass | Agrees with the stated hypotheses. |
| §6.1 Check 2 | k[X]_(X)→k[X,Y]_(X,Y) | evaluation Y=0 sends each Xⁿ to Xⁿ before and after completion; induced residue map is id_k | Pass | Agrees with the stated hypotheses. |
| §6.2 Check 1 | ℤ₂⟦T⟧→ℤ₂⟦T,V⟧/(TV−2) | 2=TV lies in m²; residue map 𝔽₂→𝔽₂ has separable degree 1; parameter quotients are nonzero | Pass | Agrees with the stated hypotheses. |
| §6.2 Check 2 | ℤ₂⟦T⟧→ℤ₂⟦T,V⟧/(TV−2) | 2=TV lies in m²; residue map 𝔽₂→𝔽₂ has separable degree 1; parameter quotients are nonzero | Pass | Agrees with the stated hypotheses. |
| §6.2 Check 3 | ℤ₂⟦T⟧→ℤ₂⟦T,V⟧/(TV−2) | 2=TV lies in m²; residue map 𝔽₂→𝔽₂ has separable degree 1; parameter quotients are nonzero | Pass | Agrees with the stated hypotheses. |
| §6.2 Check 4 | ℤ₂⟦T⟧→ℤ₂⟦T,V⟧/(TV−2) | 2=TV lies in m²; residue map 𝔽₂→𝔽₂ has separable degree 1; parameter quotients are nonzero | Pass | Agrees with the stated hypotheses. |
| §6.2 Check 5 | 𝔽₂→𝔽₄ | separable degree 2, inseparable degree 1 | Pass | Agrees with the stated hypotheses. |
| §6.2 Check 6 | 𝔽₂(t)→𝔽₂(t^{1/2}) | total degree 2,separable degree 1,inseparable degree 2 | Pass | Agrees with the stated hypotheses. |
| §6.3 Check 1 | identity on k⟦X,Y⟧ | (0):X=0 and (X):Y=(X); final quotient k≠0 | Pass | Agrees with the stated hypotheses. |
| §6.3 Check 2 | identity on k⟦X,Y⟧ | (0):X=0 and (X):Y=(X); final quotient k≠0 | Pass | Agrees with the stated hypotheses. |
| §6.4 Check 1 | ℤ₃⟦X²⟧⊆ℤ₃⟦X⟧ under C₂ | Reynolds(a+bX)=a, ρ(1)=1; residue map identity; parameter quotient 𝔽₃ has dimension 1 | Pass | Agrees with the stated hypotheses. |
| §6.4 Check 2 | ℤ₃⟦X²⟧⊆ℤ₃⟦X⟧ under C₂ | Reynolds(a+bX)=a, ρ(1)=1; residue map identity; parameter quotient 𝔽₃ has dimension 1 | Pass | Agrees with the stated hypotheses. |
| §6.4 Check 3 | quadratic integer φ=(1+√5)/2 | Tr(φ)=1, divided trace 1/2∉ℤ | Pass | Agrees with the stated hypotheses. |
| §6.4 Check 4 | group of order 1 | Reynolds average is id and takes 1 to 1 | Pass | Agrees with the stated hypotheses. |
| §6.4 Check 5 | nonabelian S₃ on three variables over ℤ₅ | each variable occurs twice in the six-term orbit sum; coefficient 2/6=1/3; unit average 1 | Pass | Agrees with the stated hypotheses. |
| §7.1 Check 1 | R=k, m=0 | empty parameter list; M/mM=M; nonzero algebra has a unit coefficient projection 1↦1 | Pass | Agrees with the stated hypotheses. |
| §7.1 Check 2 | proper elliptic curve over field K; normal elliptic cone | RΓ(E,O)=K[0]⊕K[−1], projection of unit=1; cone has dim H¹(O_E)=1 obstructing rationality | Pass | Agrees with the stated hypotheses. |
| §7.1 Check 3 | elliptic curve over field / normal cone | curve cohomology dimensions (1,1,0,…), unit degree-zero projection 1; cone is not rational | Pass | Agrees with the stated hypotheses. |
| §7.1 Check 4 | proper elliptic curve over field K; normal elliptic cone | RΓ(E,O)=K[0]⊕K[−1], projection of unit=1; cone has dim H¹(O_E)=1 obstructing rationality | Pass | Agrees with the stated hypotheses. |
| §7.1 Check 5 | proper elliptic curve over field K; normal elliptic cone | RΓ(E,O)=K[0]⊕K[−1], projection of unit=1; cone has dim H¹(O_E)=1 obstructing rationality | Pass | Agrees with the stated hypotheses. |
| §7.1 Check 6 | elliptic curve over field / normal cone | curve cohomology dimensions (1,1,0,…), unit degree-zero projection 1; cone is not rational | Pass | Agrees with the stated hypotheses. |
| §7.2 Check 1 | finite affine cover; elliptic curve E/k | with t affines, alternating terms are 0 in degrees ≥t; E has cohomology dimensions (1,1,0,…) | Pass | Agrees with the stated hypotheses. |
| §7.2 Check 2 | elliptic curve over field / normal cone | curve cohomology dimensions (1,1,0,…), unit degree-zero projection 1; cone is not rational | Pass | Agrees with the stated hypotheses. |
| §7.2 Check 3 | Spec k[T]→Spec k | H⁰=k[T] has independent basis 1,T,T²,… and infinite dimension; morphism is not proper | Pass | Agrees with the stated hypotheses. |
| §7.3 Check 1 | Spec(A×A)→Spec A | either generic component closure is Spec A, whose unit and projection compose to 1 | Pass | Agrees with the stated hypotheses. |
| §7.3 Check 2 | Spec(A×A)→Spec A | either generic component closure is Spec A, whose unit and projection compose to 1 | Pass | Agrees with the stated hypotheses. |
| §7.4 Check 1 | Spec(A/p)→Spec A; identity cover | generic source empty; p·p^{1/pʰ}≠0 in torsion-free A but p acts as 0 on A/p; identity composite=1 | Pass | Agrees with the stated hypotheses. |
| §7.4 Check 2 | vertical proper cover | generic fibre empty, p acts by 0 on target and p·p^{1/pʰ}≠0 on source | Pass | Agrees with the stated hypotheses. |
| §7.5 Check 1 | elliptic multiplication in characteristic 2 and 3 | H¹ maps by 2=0 and 3=0, identity maps by 1≠0 | Pass | Agrees with the stated hypotheses. |
| §7.5 Check 2 | elliptic multiplication in characteristic 2 and 3 | H¹ maps by 2=0 and 3=0, identity maps by 1≠0 | Pass | Agrees with the stated hypotheses. |
| §7.6 Check 1 | field; characteristic-p node | field derived retraction on degree zero=1; node’s x is in the extended ideal but not in the original ideal | Pass | Agrees with the stated hypotheses. |
| §7.6 Check 2 | field; characteristic-p node | field derived retraction on degree zero=1; node’s x is in the extended ideal but not in the original ideal | Pass | Agrees with the stated hypotheses. |
| §7.7 Check 1 | E/ℂ→Spec ℂ; elliptic cone | unit (1,0) in ℂ[0]⊕ℂ[−1] projects to 1 although H¹ has dimension 1; cone not rational | Pass | Agrees with the stated hypotheses. |
| §7.7 Check 2 | elliptic curve over field / normal cone | curve cohomology dimensions (1,1,0,…), unit degree-zero projection 1; cone is not rational | Pass | Agrees with the stated hypotheses. |
| §7.7 Check 3 | elliptic curve over field / normal cone | curve cohomology dimensions (1,1,0,…), unit degree-zero projection 1; cone is not rational | Pass | Agrees with the stated hypotheses. |
| §7.8 Check 1 | identity; blow-up of regular surface at closed point | RΓ=R[0] in both cases, H^{>0}=0, composite unit/retraction=1 | Pass | Agrees with the stated hypotheses. |
| §7.8 Check 2 | blow-up of k⟦X,Y⟧ at (X,Y) | H⁰=R, H^{>0}=0, derived unit is an isomorphism | Pass | Agrees with the stated hypotheses. |
| §7.8 Check 3 | blow-up of k⟦X,Y⟧ at (X,Y) | H⁰=R, H^{>0}=0, derived unit is an isomorphism | Pass | Agrees with the stated hypotheses. |

The final register contains 180 individual Checks. The four Worked examples are the node-contraction, ramified regular-target, scalar/full modification and monomial computations appearing explicitly in the main table. They give respectively unequal required constants 1 and 0; p=TV in m²; t²≠0 versus t²=0; and XY≠0 versus X²Y²=0 in the indicated quotient.

## Lean elaboration, binders and identifier audit

The only extra Tau Ceti import is `TauCeti.RingTheory.RegularLocalRing.Basic`; its domain instance is used for the absolute integral closure signatures. The permitted targeted build `lake build TauCeti.RingTheory.RegularLocalRing.Basic` completed successfully. The final acceptance file was then elaborated with the requested `lake env lean` command from the content checkout, using the package’s absolute file argument only in the command, never in a deliverable. Exit status was zero. Exact main-file warning count: **16**. The only warning text was ``warning: declaration uses `sorry` ``. There were no other messages to reproduce.

A separate scratch file containing the final signatures and `#check @name` for all **23** declarations was elaborated once. I compared every printed type against the README. No required hypothesis disappeared. In particular, completeness is present in the complete-pure, mixed regular-local, R⁺-splitting and weak-functoriality signatures; finite-module and injectivity hypotheses are present in all finite-cover signatures; the full Gorenstein cover and its finite self-injective-dimension bound survive; both mixed-characteristic residue hypotheses, locality, separability of the induced map and the coefficient-square equality survive. The parameter, big, balanced and almost predicates explicitly retain their Noetherian local binders; the almost predicate also retains primality and residue characteristic. Purity and both purity-based headlines allow independent universes for source and target. No signature was repaired by a section variable or an option override.

The file contains exactly one `import Mathlib`, the one used Tau Ceti module, seven predicates with real bodies, sixteen theorems and sixteen `sorry` proof bodies. It contains no `set_option`, admitted data, admitted examples, replacement free predicates, API padding or boundary-case declarations. Every one of the 23 declaration names appears in the README. There are no backticked undeclared own names. The missing derived and perfectoid headlines are listed in the module docstring with their missing carriers.

The resolver reports no missing Lean names, but explicitly says that it did not check external library names on its own host. Those names were therefore checked independently against the actual supplied pinned files and, for the retained signatures, by elaboration. The resolver’s remaining roadmap lead is the unlisted PerfectoidSpacesPartII design, described above.

Source-manifest validation output:

```text
packages/DirectSummandsAndBigCohenMacaulay/sources.toml: 0 problem(s)
```

## Mechanical repairs and validation

The notation repair encloses the 230 TeX syntax markers in 223 inline formula code spans. Removing backtick delimiters from the two README versions gives identical text, so every statement, hypothesis, API fact, Check, worked example and supplier contract is unchanged. The four inherited proof-gap records have the slugs `equal-char-zero-existence-proof`, `char-zero-derived-splitting-bridges`, `arbitrary-module-completion-proof`, and `pointed-modification-finite-witness`; their previous fields and the eight supplier-gap records are unchanged. Only the top-level `gaps` value differs from the accepted plan.

The ANDRE18B and BHATT18 locator fields now collect section, theorem and page references without repeated proof descriptions. Every other source field, identity and provenance value is unchanged. Source validation reports zero problems. The README/Lean text scanners report zero findings, including `tex`, `latex` and `readme-ids-missing`; JSON gap validation and manifest-content checks also report zero problems. `Suggested.lean` and `metadata.toml` are byte-for-byte unchanged, so the elaboration and binder audits recorded above remain applicable; Lean was not rerun for these text-only repairs.

The dependency-only repair repeats both invocations and identifies the remaining order-registration diagnostic explicitly below. Only this report was edited for this repair; the README, Suggested.lean, metadata, sources manifest and design plan are unchanged. No merge-order or tooling file was changed, and Lean was not rerun.

## Dependency-check output

The exact mandated invocation, using the supplied README, name, order and `--movable`, exited with status 1 and produced:

```text
NOT IN ORDER: DirectSummandsAndBigCohenMacaulay (insert it after its last supplier)
depcheck: 27 roadmaps, 240 edges, 1 problem(s)
```

The CLI help distinguishes `--movable`, which handles a listed roadmap above its suppliers, from `--candidate`, which places an unlisted roadmap after its last supplier for the check. Because this roadmap is absent from `merge-order/ORDER.txt`, the candidate invocation was repeated with the same README, name, order and `--movable`, replacing `--depcheck` with `--candidate`. It exited with status 0 and produced:

```text
candidate: DirectSummandsAndBigCohenMacaulay is not in the merge order yet; checked as if placed after DeformationAndDerivedPatchingAlgebra (the intake inserts it when its design is accepted)
depcheck: 27 roadmaps, 240 edges, 0 problem(s)
```

The exact line `NOT IN ORDER: DirectSummandsAndBigCohenMacaulay (insert it after its last supplier)` is a false positive against the brief’s explicit rule that absence from the order before intake insertion is not a defect. The strict invocation still fails; no permitted package-file edit can register the roadmap in that separate order file. Intake must insert DirectSummandsAndBigCohenMacaulay immediately after DeformationAndDerivedPatchingAlgebra to clear this registration diagnostic. The brief prohibits editing the merge order or tooling, so neither was changed.

There is no UPWARD or CYCLE line for this roadmap. All recognized suppliers precede the candidate’s proposed insertion after DeformationAndDerivedPatchingAlgebra. This result does not certify the absent PerfectoidSpacesPartII supplier; the availability limitation and exact gap remain explicit. No mathematical statement, supplier contract, dependency or elaborated signature was changed for this repair, so the adversarial pass and elaboration results above remain applicable. No GitHub write was performed.
