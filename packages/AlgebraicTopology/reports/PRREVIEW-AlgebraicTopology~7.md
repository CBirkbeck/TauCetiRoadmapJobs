# Review of AlgebraicTopology (pull request #1652 at bdd456c)

**Verdict:** needs changes

## R01 (P2) — Compact generation still has two owners

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:119` and `:749`: “Layer 4.0 owns the single compact-generation coreflection, convenient products, exponentials and foundational pointed suspension–loop adjunction”.

**Claim:** These generic constructions belong to this roadmap even though the paragraph acknowledges that HomotopySpheres constructs the same foundation.

**Witness:** `TauCetiRoadmap/HomotopySpheres/README.md:663`, at the supplied head, owns precisely the coreflection, counit, products, exponentials and CW comparisons. Its §3A.1 needs only native topology; §3A.2 explicitly isolates the early adjunction from stable applications.

**Repair:** Consume HomotopySpheres §3A.1 as the owner of the generic foundation. Identify the foundation-only suspension–loop portion of §3A.2 separately from its later Puppe/relative-homotopy applications; do not import the latter back into their prerequisites. Keep this roadmap's additional raw-quotient comparisons and interval-last normalization. Update Scope, contracts and item-specific dependencies accordingly. On the point and interval, both proposed coreflections already give the same spaces and identity counits; on pointed S⁰ the two adjunctions both send degree +1 to winding +1. These instances need comparisons with one construction, not two constructions. This is the unresolved previous R03, not an objection to the raw-quotient extension.

## R02 (P2) — Import the existing module-tower foundation

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:1505`–:1539: “Define δ on the product” and “This is the shared generic tower API”; `TauCetiRoadmap/AlgebraicTopology/Suggested.lean:105`–:131.

**Claim:** This roadmap owns the module difference map, lim/lim¹, their six-term sequence and Mittag–Leffler vanishing, integer-graded Milnor sequences, derived-limit cone and specified-homotopy-square comparisons.

**Witness:** On main, `TauCetiRoadmap/DerivedModuleAlgebra/README.md:1403`–:1424 owns the identical module-tower interface and explicitly supplies AlgebraicTopology; :1489 and :1542 supply vanishing and Milnor; §1.1 at :1573 supplies cones, cofinality and square homotopies.

**Repair:** Import DerivedModuleAlgebra §§1.T.1 and 1.1 by name in Scope and supplier contracts. Replace the duplicated generic targets with the actual singular/cellular restriction-tower adapters and their topological comparisons. Delete `towerDifference` and its two surjectivity declarations from Suggested.lean when they no longer serve an owned headline; update its docstring accordingly. Both descriptions give δ(3,1,0,…)=(2,1,0,…) for identity bonds, and δ=id, lim=lim¹=0 for zero bonds. The imported theory also retains the nonzero obstruction for ×2 on ℤ and the integer-degree Milnor shift, so this repair preserves the tested mathematics and generality. This is an additional finding from the full ownership pass, not a claim that a pinned library already proves the signatures.

## R03 (P3) — Finish the locator repairs

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:1982`: “using DifferentialGeometry Layer 2.4's outward-first S² orientation”. Also `:2329` (§7.2) and `:2802` (§8.9).

**Claim:** The cited supplier supplies that orientation, and the theorem targets have exact supporting locators.

**Witness:** On main, `TauCetiRoadmap/DifferentialGeometry/README.md:363` defines the orientation double cover; outward-first boundary orientation is §5.1, `:507`. §7.2 has no claim-level locator; §8.9's later reference to Vector Bundles §3.3 omits its proposition and pages.

**Repair:** Replace the §2.4 citation with DifferentialGeometry §5.1 plus this roadmap's §§2.5, 4.6 and 6.3 sphere comparison. Attach Hatcher 2.44, p.146 and §2.2 Exercise 20, p.157 to homotopy/product Euler invariance, and explicitly derive the bundle formula from §5.5's finite Euler sums. For obstruction theory cite Hatcher, Vector Bundles and K-Theory §3.3, pp.99–102, especially Lemma 3.18 and Proposition 3.19; distinguish its untwisted statement from the local-system extension constructed here. Retain ∂[I]=[1]−[0], χ(S²×S²)=4=2·2, and δd=m(k−1)=km−m. This is the remaining part of previous R06; the other named repairs below are recognized.

## R04 (P3) — Add Checks for the end invariants

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:2574`: “First own the single predicate simply connected at infinity”, followed by ends, connectedness at infinity and the stable image group at an end.

**Claim:** These are specified definitions with APIs, but they have no three discriminating Checks. The preceding interval/point/proper-retraction Checks test different objects.

**Witness:** ℝ has two ends, both with stable group 0, and is simply connected at infinity; ℝ² has one end with group ℤ and is not; ℝ³ has one end with group 0 and is.

**Repair:** Add these three computations explicitly for each relevant predicate: numbers of ends 2,1,1; connected at infinity false,true,true; simple connectivity at infinity true,false,true; stable end groups (0,0),ℤ,0. Include the bounding-loop witness in ℝ². This excludes confusing one end with simple connectivity at infinity, or requiring one end in the latter definition. Keep these Checks in the README.

## Verified sound

The review read the entire README and Suggested.lean, checked all seven previous findings before the fresh pass, examined all 15 seeded source targets, compared all 34 elaborated declarations with their prose, and tested all 20 admitted theorems for elementary padding. Four findings remain: two P2 and two P3. No mathematical counterexample to a headline theorem was found in the computations below. This is not a proof of the admitted theorems.

**Previous findings, checked against this head.**

| Previous finding | Current passage and result |
|---|---|
| R01, nerve order | Repaired. README:2477–2481 now has d₂=g, d₀=h, d₁=hg. For g=(12), h=(23), hg=(132) sends 1 to 3; gh=(123) sends 1 to 2. This agrees with the native composition. |
| R02, missing Serre carrier | Repaired. README:1258 says “Define a Serre fibration” by cube lifting, and :1262 says “with no surjectivity built in”. It constructs the disc/cube adapter required by DGFloer instead of claiming it exists at the pins. |
| R03, duplicate foundation | Not repaired. README:121–123 says the HomotopySpheres constructions “coincide with this foundation”; §4.0 still constructs them. See R01. |
| R04, relative homology duplication | Repaired. README:213–224 names the native relative homology/map/functor and empty-pair isomorphism, with the preadditive/coproduct/homology hypotheses. The duplicate §2.2 is absent. |
| R05, cofibration-only Hurewicz | Repaired. README:2382 treats arbitrary based topological pairs; :2517–2525 states relative Hurewicz with A nonempty and simply connected and the connectivity premise, without a cofibration premise. |
| R06, locators | Partly repaired. Coordinate signs now cite Hatcher 3B.1, pp.269–270, 3B.6, p.276 and 3.27, p.236; §4.4 gives a derivation; §5.7 names small-chain Proposition 2.21 and the filtered-complex supplier; §6.1 cites §3.H, pp.328–334; §6.5 distinguishes the linking reference from its extension. The stale :1982 citation remains (R03). |
| R07, mapping prerequisites | Repaired. README:2977–3019 supplies separate tests for metric realization, ANR/ANE and domination: vertex distance 2, shrinking wedge points, circle annulus, Cantor non-example, and constant circle composite acting by 0 rather than 1 on H₁. |

No supplied repair report marks these findings “not actionable in this package”; none is treated as settled on that ground.

**Gate, build, signatures and Lean form.** The worker's gate for this exact head reports every counter zero and `OK`, including `build`, `stray-files`, `outside-folder`, `sorry-data`, `set_option`, imports and README names. The outside-folder diff is empty. The requested independent dependency command returned:

```text
depcheck: 205 roadmaps, 1643 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. This does not detect the duplicate owners in R01–R02. The module was independently elaborated with `lake env lean` on its absolute input filename from the designated checkout: exit 0, only the 20 expected `sorry` warnings. A scratch copy appended `#check @name` for every one of the 34 declarations; all elaborated, with no lost standing hypothesis. No source file or manifest was changed.

The padding probe tried closing every admitted theorem with `rfl`, `simp`, or `infer_instance`; all 20 reached the marked fallback. Native candidates were inspected as well: finite-dimensional cellular comparison does not close the arbitrary-dimensional target; Euler–Poincaré is not homotopy/product/cover multiplicativity in one lemma; abstract model-category Whitehead does not provide the topological CW theorem; eventual-range Mittag–Leffler results do not already state surjectivity of this module difference map. No one-library-lemma padding was identified. The probe is evidence about these tactics and candidates, not a claim to have searched every possible proof.

There are 14 supporting definitions/structures/abbreviations with real bodies and 20 theorem signatures. The sole Mathlib import and five individual Tau Ceti imports match the used carriers. No admitted data, option override, computational algorithm, free placeholder condition or copied source passage was found. The layer headings, examples and dependency paragraphs are present. R03 and R04 record the remaining claim-level locator/Check defects.

**Headline coverage.** The README's deep endpoints are Brouwer; arbitrary-dimensional cellular comparison; transfer; Wang and Künneth; Serre and Cartan–Leray/descent; inverse limits and Milnor sequences; LS cup length; orientation and Poincaré–Lefschetz duality; Euler invariance; absolute/relative Hurewicz; ordinary/homological/proper Whitehead; manifold CW type and homology-sphere recognition; nonabelian classifying spaces; obstruction theory; ordinary representability and EM loop comparisons. The 20 statable acceptance declarations are recorded individually in the table below. The docstring names the missing canonical maps, filtrations, normalized EM family, relative homotopy, supported comparisons and orientation/cap carriers for the unavailable forms. The §6.5 linking consequences were also tested; they use the same missing fundamental-class/duality normalization. No additional headline was forced through a stand-in, and no additional statable canonical headline was identified as absent. The two tower surjectivity headlines duplicate the main-roadmap supplier and must leave this acceptance file under R02. The characteristic-two closed-manifold duality is explicitly a statable form of the larger duality target, not a replacement for the integral/twisted target.

**Pinned declarations actually inspected.** Paths below are relative to the named library at its pin. Mathlib is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Pin and file:line | Evidence and limitation |
|---|---|
| Mathlib `Mathlib/CategoryTheory/SingleObj.lean:62`, :76 | Composition of x then y is y*x. It is not the commutative special case. |
| Mathlib `Mathlib/AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:41`; `Mathlib/Topology/Category/CompactlyGenerated.lean:32`, :77 | Fundamental-group multiplication is reversed path composition. The native compact-generation category and fully faithful inclusion exist, without separation as a field; the adjunction is the roadmap-owned extension in R01. |
| Tau Ceti `TauCeti/AlgebraicTopology/FundamentalGroup/TopologicalMonoid.lean:54`, :108, :118 | `MulOneClass` and continuous multiplication suffice for `cast_map_prod_mul` and `instCommGroup`; associativity and connectedness are not assumptions. |
| Tau Ceti `TauCeti/AlgebraicTopology/Singular/Relative.lean:190`, :223, :234, :241, :248 | Cokernel chains, relative homology and induced-map identities/functor; abelian hypotheses belong to the short exact sequence separately. |
| Tau Ceti `TauCeti/AlgebraicTopology/Singular/Empty.lean:129`, :148 | `singularHomologyInclIso` goes from absolute to relative homology; its component is the quotient-induced map. |
| Tau Ceti `TauCeti/AlgebraicTopology/Cohomology/Twisted/Basic.lean:79`; `Relative.lean:77` | Bodies apply `linearYonedaObj` to twisted chains. These are Hom-valued cochains, not direct L-valued cochains for arbitrary nonreflexive fibres. |
| Tau Ceti `TauCeti/AlgebraicTopology/Cellular/Comparison.lean:81`, :108 | `cellularSingularHomologyIso` retains finite dimension and exact cell-indexed coproducts. The new arbitrary-dimensional theorem is a genuine extension. |
| Tau Ceti `TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/Singular.lean:141` | Alternating homology rank equals coefficient rank times cell count; not already the three Euler headlines. |
| Mathlib `Mathlib/Topology/CWComplex/Classical/Basic.lean:135` | Fields specify characteristic maps, weak topology and closure finiteness, not a `T2Space` field. The roadmap explicitly supplies separation. |
| Mathlib `Mathlib/Topology/Covering/Basic.lean:287` | `IsCoveringMap` is evenly covered at every base point; it has no surjectivity conjunct. Zero sheets must be retained. |
| Tau Ceti `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:123` | K(G,1) is `IsAspherical` (path connected and π_(n+2) trivial) plus a fundamental-group equivalence. The target uses an actual nerve realization and vertex, not arbitrary prescribed homology. |
| Mathlib `Mathlib/CategoryTheory/CofilteredSystem.lean:137`, :262 | Eventual-range Mittag–Leffler and surjective eventual-range maps exist. The module difference operator theorem still requires its argument. |
| Mathlib `Mathlib/AlgebraicTopology/ModelCategory/Homotopy.lean:226` | Abstract Whitehead requires cofibrant/fibrant objects and weak equivalence in a model category; it is not a one-lemma proof of the stated CW result. |

Object searches additionally covered native Serre-fibration names, Hurewicz maps, Brouwer, Euler products/covers, local cochains, compact generation, relative homology and proper deformation. No pinned Serre-fibration morphism property or canonical Hurewicz map was found. The review did not substitute a newer library for either pin.

**Ownership and supply.** Searches used `roadmaps grep`/`list`, main, the supplied sibling files and board packages, by object rather than just proposed declaration name. Main ClassifyingSpaces, GeneralizedCohomology and completed UniversalCovers were read as shape/ownership comparisons. Existing-roadmap revisions were not used as suppliers in place of main. No different-roadmap fully qualified name collision was identified among the retained declarations. Relevant contracts resolved as follows:

| Owner and resolved location | Boundary checked |
|---|---|
| `TauCetiRoadmap/DerivedModuleAlgebra/README.md:1403`, :1489, :1542, :1573 | Generic module towers and derived limits are already owned on main, independently of topology; R02. The reviewed main file’s last change is a751fc46. |
| `Completed/UniversalCovers/README.md:1`–:85, scope and construction targets | Universal covers, deck/basepoint transport are imported; the raw bar is an application, not a second universal-cover theory. |
| `TauCetiRoadmap/ClassifyingSpaces/README.md:150` onward, Stages 3–4 | Maps, pointed uniqueness and cellular/bar resolutions; raw nerve construction and identity-normalized comparison are distinguished in §8.8. |
| `TauCetiRoadmap/DGFloer/README.md:445` onward, Layer 1 items 1–4, and Layer 2 item 3 | Degree-one Hurewicz, fibration LES, filtered/Serre sequences, normalized abelian EM family and loop comparison. The newer Serre carrier named there is replaced here by the owned §5.0 adapter. Constructor inputs precede representability. |
| `TauCetiRoadmap/HomotopySpheres/README.md:663`, :678 at its supplied head | Generic compact generation/adjunction is an earlier independent owner: R01. Its stable and Puppe outputs are not prerequisites here. |
| `TauCetiRoadmap/GeneralizedCohomology/README.md:234` | Foundation-only realization product comparison uses the HomotopySpheres foundation, independently of ordinary representability. |
| `TauCetiRoadmap/DifferentialGeometry/README.md:340`, :363, :507 | Orientations/pullbacks, orientation cover and outward-first boundary; sphere homological comparison remains local work. One stale locator: R03. |
| `TauCetiRoadmap/GeometricTopology/README.md:206`, :930 | Collars and the smoothing/triangulation comparison item 1 provide the indicated smooth, Hausdorff, second-countable manifold inputs. |
| `TauCetiRoadmap/TopologicalKTheory/README.md:328`, :578 | Fixed-rank/stable Grassmannian carriers and rank-one comparisons precede classification; no dependence on the later ordinary EM identification is imported. |
| `TauCetiRoadmap/CharacteristicClasses/README.md:334` onward, C1.2a S0–S5; C1.5; C2.0 | S0–S4 support colimits/pullback/homotopies are generic and earlier; S5 is a separate compatibility target. Projective comparisons and bundle-cell consumers use the same base-first cube normalization. |
| `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1407`, :1458 | Projective carrier and even cells precede the Euler computation; the later Hodge/cup/duality lane is not used to construct those cells. |
| `TauCetiRoadmap/TopologicalSheafCohomology/README.md:107`–:155 | Raw Čech refinements, homotopies and colimit remain there; the base roadmap does not reconstruct them. |
| Supplied AlgebraicTopologyPartII, Scope and AlgebraicTopology contract | Its configuration/semialgebraic extension consumes the base; it does not supersede the generic objects reviewed here. |
| Supplied DeRhamCohomologyAndDuality, Scope | It explicitly leaves singular chains, cochains, orientations and fundamental classes to AlgebraicTopology. Its de Rham comparison is distinct. |
| `TauCetiRoadmap/HeegaardFloer/README.md:584`–:595 | The Morse chain/cochain comparison consumes AT6.4 and explicitly leaves generic relative cap/duality to AT; it is not another generic duality owner. |

Consumer citations were also resolved on main: BanachAlgebras A8 (:1116–:1151), MorseTheory M2 (:124) and M4 (:458–:549), AffineMorseLefschetz A4 (:208 onward), RiemannianGeometry (:123–:128 and :546–:554), and FuchsianOrbifolds (:80–:82) refer to the indicated finite-span Brouwer, CW/pair, categorical-cover, suspension or finite-CW interfaces. These are consumers, not extra prerequisites.

All *Needs:* lines were read. Native suppliers, local layer prerequisites and the named earlier sections explain the proof routes, subject to the ownership corrections R01–R02. No declared supplier gap is present. No new upward edge or unowned prerequisite was established; §6.0 instead duplicates an existing main-roadmap owner (R02). This conclusion uses item-level separation: e.g. DGFloer's EM constructor precedes AT8.10, CC's S0–S4 precede supported cellular comparison, and CKG's cells precede AT7.4. The mechanical result alone would not establish these separations.

**Seeded source audit.** All fetched texts came through the source service from author, institutional, publisher-open or Numdam copies. Source identifiers below refer to its line-numbered extractions, not copied passages. The README does not flag an additional locator “unverified”. The 15 required targets were checked as follows; “partial” identifies the precise limit of certification.

| Target | Locator and text checked | Assessment |
|---|---|---|
| 1.6 | Hatcher §3.C p.281, hatcher line 12154; pinned topological-monoid declarations above; Hatcher Example 4A.3 p.422, line 18248 | p.281 defines H-spaces; it does not itself state the whole comparison. The exact native declarations and commutativity give the claimed concatenation/naturality derivation. |
| 2.1 | Hatcher pp.115–116, hatcher line 5024 | Relative quotient complex and induced differential agree; native quotient supplies the categorical version. |
| 2.5 | Hatcher 3B.1 pp.269–270, line 11607; 3B.6 pp.275–276, line 11898; 3.27 p.236 | Product orientation and boundary sign are the ingredients, not an assertion that Hatcher defines the native sup-ball map. That map is explicitly constructed here. |
| 2.7 | Hatcher 2.15 p.114, line 5005 | No-retraction/Brouwer disk theorem supports the route. General nonempty compact convex sets are reduced to their finite-dimensional affine span; rank zero is treated separately. |
| 3.4 | Hatcher pp.149–150, line 6503; §3.H pp.333–334, lines 14565 and 14604 | Ordinary (i,−j)/sum sequence and local-coefficient extension; the small-chain construction here supplies the extension's details. |
| 4.2 | Hatcher p.140, line 6081 | Cellular attaching-degree formula for n>1, with endpoint incidence for n=1. It agrees with the signed interval and RP² tests. |
| 5.0 | Hatcher Proposition 4.48 pp.379–380, line 16461 | Bundles have the CW homotopy lifting property. Compact-cube subdivisions do not assume a paracompact base. Disc/cube and empty-map conventions are supplied here. |
| 5.1 | Hatcher 3B.5 p.274, line 11810; 3B.6 p.275, line 11898 | PID exact sequence and noncanonical splitting supported. General-ring spectral sequence/hereditary extension is not certified from unreadable Weibel; see Not verifiable. |
| 5.3 | Hatcher §3.G pp.321–322, lines 14023–14054 | Sum of all lifts, composite multiplication by degree, and finite-group averaging with degree invertible. Does not justify discarding characteristic-dividing-degree cases. |
| 7.2 | Hatcher 2.44 p.146, line 6371; §2.2 Exercise 20 p.157, line 6854 | Homotopy/product formula supported; add exact locators and identify bundle spectral-sequence derivation (R03). |
| 7.3 | Hatcher §2.2 Exercises 21–22 p.157, lines 6854–6858 | Additivity for subcomplexes and d-sheeted cover formula; cell lifting is a direct derivation. |
| 7.4 | CKG K7.1–K7.2 at the main locations above; Hatcher 2.44 | Even cells give n+1; sphere and torus counts give the displayed values. This is a supplier-based calculation, not a separate projective-space construction. |
| 8.3 | Hatcher 4.32 p.366, lines 15961–15984 | Absolute n≥2 connectivity and Hurewicz isomorphism; degree one remains the separately named abelianization supplier. |
| 8.8 | Hatcher 1B.8–1B.9 p.90, lines 3897–3920; native SingleObj; ClassifyingSpaces Stages 3–4 | Classification/uniqueness and the repaired order supported. The all-degree local-cochain comparison is an additional construction, not contained verbatim in 1B.9. Brown's group-cohomology reference remains unreadable. |
| 8.9 | Hatcher Vector Bundles §3.3 pp.99–102, hatcher-vb lines 3842–3957; Lemma 3.18/Proposition 3.19 | Fixed-cochain zero versus class zero and adjustment by a difference cochain are distinct. The source's displayed section assumes simple fibres and trivial base action; the arbitrary-monodromy extension here must be proved, as stated. R03 requests precise locators. |

Additional full-text checks: brown-groupoids 6.7.2 p.240, line 9424 and 3.6.4 p.91, line 3995 (the author's corrected third-edition file has matching numbering); milnor-cw Theorem 3/Corollary 3 p.276, lines 209–223 (compact source, general W distinct from countable W₀); conway-friedl-herrmann Proposition 1.2 p.494, lines 38–66, Lemma 2.5 p.502 and Lemma 2.6 pp.503–504, lines 345–451 (lens sign versus the more general derived linking statement); ftw Theorem 4.2 pp.17–18, lines 600–639 and Corollary 4.9 p.21, lines 752–758 (finite dimension, local finiteness, simple connectivity and simple connectivity at infinity); strom Theorem 2, lines 82–98 (closed cofibration criterion). Serre's institutional text was retrieved; its cohomological product theorem, serre line 1147, retains the total-degree sign. No claim of complete certification of every source chapter is made.

**Adversarial computations.** In the tables, 0 for a group means the trivial group/module. Each row records an actual instance and its values; “retain” means no mathematical change on that test. Negative controls fail a stated premise, rather than refute a theorem under its premises. The 140 rows cover the seeded targets, all acceptance theorems, the new definitions/conventions and every finding.

| Statement | Instances tried | Values on the two sides / discriminating value | Result; change |
|---|---|---|---|
| 1.1 cover groupoid | Two arcs covering S¹, intersection two components | Two objects and two overlap components yield one loop ℤ; replacing overlap by one component yields 0 | Retain groupoid formulation |
| 1.2 refinement naturality | Identity refinement; repeated point cover | Induced π₁ maps id on ℤ; point group 0 on both diagrams | Retain |
| 1.3 based presentation | Wedge of two circles | Free group F₂, commutator aba⁻¹b⁻¹≠1; abelian replacement ℤ² kills it | Retain connectedness premises |
| 1.4 two-open pushout | S¹ and two arcs | Pushout π₁=ℤ, not the pushout 0 of two based trivial groups with disconnected overlap suppressed | Retain |
| 1.5 wedge values | Zero, one, two circles | Free groups 1,ℤ,F₂ on both descriptions | Retain empty wedge point |
| 1.6 multiplication | Circle winding 2 and −1; discrete S₃ | Pointwise/concatenated winding 1=2+(−1); π₁(discrete S₃)=0 | Retain no connectedness premise |
| 1.6 naturality | Circle squaring, windings 2 and 3 | 2(2+3)=10=4+6; wrong one-factor map gives 7 | Retain |
| 1.6 nontrivial torsion | SO(3), nonzero loop twice | 1+1=0 in ℤ/2; pointwise square also 0 | Retain |
| 2.1 quotient chains | (*,∅), (*,*), empty pair | C(*),0,0; relative H₀=R,0,0 respectively | Retain native quotient |
| 2.3 pair LES sign | (I,∂I) | ∂[I]=[1]−[0]; augmentation gives 1−1=0 | Retain |
| 2.3 triple | A=B=X | All relative terms 0; every composite 0 | Retain |
| 2.4 homotopy/additivity | I; two points | H₀(I)=R=H₀(*); H₀(two points)=R⊕R | Retain |
| 2.5 cube orientation | n=0,1,2 | Point augmentation +1; interval right−left; square right−left−top+bottom | Retain all low dimensions |
| 2.5 radial map | x=(1,1); x=0 | x↦(1/√2,1/√2), Euclidean norm 1; inverse gives (1,1); 0↦0 | Retain zero branch |
| 2.5 product sign | Two oriented intervals | Swapping factors has determinant −1; (−1)^(1·1)=−1 | Retain base-first order |
| 2.5 local S⁰ orientation | q=+1 and q=−1 | Positive local reduced generators [q]−[−q] are opposite | Retain marked-point distinction |
| 2.6 local chains | S¹ monodromy u=2 over 𝔽₅ | Transport differential u−1=1; constant system gives 0 | Retain actual transport |
| 2.7 Brouwer headline | Point; f(t)=1−t on I | f(0)=0 on point; f(1/2)=1/2 on I | Retain rank-zero and positive cases |
| 2.7 convex degeneration | Segment in ℝ²; empty set; translation on ℝ | Segment reflection fixes midpoint; empty has no point; x↦x+1 has no fixed point | Retain nonempty/compact premises |
| 2.7 radial gauge | Unit interval centered at 0, boundary x=1 | Gauge(1)=1; radial retraction fixes 1; at center use separate value | Retain denominator control |
| 3.1 subdivision | Oriented edge, midpoint b | Sd[v₀,v₁]=[b,v₁]−[b,v₀], boundary [v₁]−[v₀] | Retain sign |
| 3.1 prism | Point v | T[v]=[v,v], boundary [v]−[v]=0=id−Sd | Retain degeneracies |
| 3.2 small chains | Point covered twice | Augmented cover computes H₀=R, not R² | Retain |
| 3.3 local excision | Interval I=[−1,1] and smaller neighborhood of 0, constant R | H₁(I,I−{0})=R on both excised local pairs | Retain interior condition |
| 3.4 local MV | Intersection generator a=3 over ℤ | a↦(3,−3)↦0; wrong signs give 6 | Retain |
| 3.5 spheres | S⁰,S¹,S² | Reduced homology R in degrees 0,1,2 respectively; unreduced H₀(S⁰)=R² | Retain |
| 4.0 coreflection | ∅,*,I | k∅=∅, k*=*, kI=I; counit endpoints 0↦0,1↦1 | Sound values; R01 ownership |
| 4.0 adjunction | Pointed S⁰, degree-one circle map | Adjunct loop winding +1; reflected interval −1 | Sound values; R01 ownership |
| 4.1 cellular groups | One edge with two vertices | C₁=ℤ, C₀=ℤ²; boundary column (−1,1) | Retain native carrier |
| 4.2 cellular differentials | RP², constant ℤ | d₂=2, d₁=0; d₁d₂=0; H₁=ℤ/2 | Retain |
| 4.3 comparison headline | Infinite wedge of spheres, one per positive dimension | In each positive degree cellular and singular H are ℤ; no finite global dimension | Retain extension beyond pin |
| 4.3 infinite coproduct | Countably many S¹ | H₁=⊕ℕℤ on both sides, not ∏ℕℤ | Retain direct sum |
| 4.4 based quotient | X=*, B=∅ and B=X | X/∅ has two points; X/X one point | Retain added basepoint |
| 4.4 sphere quotient | I/∂I | Relative H₁=ℤ and reduced circle H₁=ℤ; generator +1 after normalization | Retain |
| 4.4 suspension | Pointed S⁰; based point | Suspensions S¹ and point, reduced groups ℤ and 0 | Retain marked meridian collapse |
| 4.4 smash symmetry | S¹∧S¹ | Fundamental class multiplies by −1 under swap, agreeing with (−1)^(1·1)=−1 | Retain degree product sign |
| 4.5 HEP | (I,{0}); identity pair | H(t,0)=0 extends by constant 0; identity extension equals prescribed homotopy | Retain |
| 4.5 relative pushout | Attach D¹ by two endpoints to * | Quotient S¹, one 0-cell and one 1-cell; H₁=ℤ | Retain arbitrary attaching map |
| 4.5 homotopic gluing | Endpoints attached to contractible interval, then to point | Both models homotopy equivalent to S¹; H₀=H₁=ℤ | Retain actual comparison maps |
| 4.5 tower colimit | Increasing finite discrete subsets of ℕ | Union ℕ, H₀=⊕ℕℤ; limit of finite direct sums same | Retain |
| 4.5 cylinder | f=id_* | Cylinder I, projection to point; gf homotopic id_I | Retain native model |
| 4.5 compact image | Sphere mapped constantly into infinite CW union | Image is one vertex, hence finite subcomplex; whole infinite union need not be finite | Retain local finite-stage statement |
| 4.6 projective cells | RP⁰, RP¹, RP² | Cell counts (1),(1,1),(1,1,1); χ=1,0,1 | Retain |
| 4.6 sign local system | RP² with sign ℤ | d₂=0,d₁=±2; H₂=ℤ, H₀=ℤ/2; differs from constant coefficients | Retain |
| 4.6 orientation control | RP¹ | Orientation monodromy +1, nontrivial sign system −1 | Retain dimension dependence |
| 4.7 simplicial realization | Δ⁰, Δ¹, Δ² | Cell counts 1; (2,1); (3,3,1); Euler 1 each | Retain degeneracies excluded |
| 4.7 radial simplex chart | n=2, z=(1,0) | Boundary weights (0,2/3,1/3), sum 1; center (1/3,1/3,1/3) | Retain coordinate order |
| 5.0 Serre predicate | Identity; B×F→B | Lift H for id; lift (H,a) for projection gives pĤ=H and Ĥ₀=g | Retain |
| 5.0 disc/cube | n=0 and n=1 | Point maps agree; I→[−1,1], t↦2t−1, endpoints preserved by product with time | Retain |
| 5.0 no-surjectivity convention | ∅→B; {0}→I | First has no initial cube map; second would require 0=1 at terminal time | Retain separate surjectivity |
| 5.1 field Künneth | S¹×S¹ over 𝔽₂ and 𝔽₃ | Betti ranks (1,2,1), equal tensor degree sums | Retain both characteristics |
| 5.1 PID Tor term | RP²×RP² over ℤ, degree 3 | Tensor contribution 0; Tor₁(ℤ/2,ℤ/2)=ℤ/2; H₃=ℤ/2 | Retain Tor |
| 5.1 general-ring control | R=𝔽₂[ε]/ε², module R/(ε) | Tor_p(R/(ε),R/(ε))=𝔽₂ for every p≥0; cannot universally truncate to p≤1 | Retain spectral sequence rather than PID formula |
| 5.1 zero ring | R=0 | Every term and abutment 0 | Retain |
| 5.2 Wang | Mapping torus of id on S¹ | id−f*=0; H₁=ℤ², H₂=ℤ | Retain |
| 5.2 Wang sign | Reflection of S¹ | id−f*=1−(−1)=2; mapping-torus H₁=ℤ⊕ℤ/2 | Retain |
| 5.3 transfer headline | Two-point cover of point over ℤ and 𝔽₂ | tr(1)=(1,1), p*tr(1)=2 (or 0 mod2); tr itself is nonzero mod2 | Retain all-lifts equation |
| 5.3 empty cover | ∅→* of degree 0 | tr=0, p*tr=0=0·id | Retain |
| 5.3 circle cover | z↦z³ | On H₁, p*=3, tr=1; composite 3 | Retain source/target direction |
| 5.3 averaging control | Double universal cover of RP² over 𝔽₂ | H¹(base)=𝔽₂, H¹(S²)=0; pullback not injective | Retain invertibility premise |
| 5.4 torus | n=0,1,2 | Exterior ranks (1), (1,1), (1,2,1) | Retain zero-rank point |
| 5.5 Serre | Hopf S¹→S³→S² | d₂:ℤ→ℤ is ±1, so H₁,H₂(total)=0; trivial monodromy alone does not collapse | Retain |
| 5.6 double complex sign | Element in bidegree (1,1) | Cross terms from δ and vertical ∂ have coefficients +1 and −1, sum 0 | Retain total differential |
| 5.7 cover descent | Repeated two-open point cover | C₀=R²,C₁=R, d(a)=(a,−a); H₀=R,H₁=0 | Retain |
| 6.0 tower difference definition | Identity tower, x=(3,1,0,…) | Δx=(2,1,0,…); kernel consists of constant sequences | Mathematics retained; import R02 |
| 6.0 surjectivity headline | Identity tower, arbitrary y | x₀=0, x_n=−Σ_(j<n)y_j; x_n−x_(n+1)=y_n | Mathematics retained; import R02 |
| 6.0 ML headline | Zero bonding maps on ℤ | Stable images 0; Δ=id on ∏ℤ, hence cokernel 0 | ML is weaker than surjective bonds; import R02 |
| 6.0 non-ML control | ×2 tower, y=(1,0,1,0,…) | A solution forces x₀=1+4+16+…=−1/3 in ℤ₂; no integral x₀ | Retain hypothesis in imported theory; R02 |
| 6.0 cone/Milnor | Identity tower of degree-zero ℤ complexes | lim H₀=ℤ, lim¹ H₀=0; cone model has H₀=ℤ and no shifted spurious group | Retain integer grading in imported theory; R02 |
| 6.1 direct local differential | S¹, u=2 in 𝔽₅ | u⁻¹−1=3−1=2, not u−1=1; squaring the cochain differential is 0 | Retain inverse transport |
| 6.1 UCT | RP², coefficients ℤ | H¹=0, H²=ℤ/2 from Ext¹(H₁,ℤ); Hom(H₂,ℤ)=0 | Retain Ext |
| 6.1 Bockstein | RP², 0→ℤ→×2ℤ→𝔽₂→0 | β(nonzero H¹ mod2)=generator of H² integral ℤ/2 | Retain positive inclusion |
| 6.1 sign cohomology | RP², orientation sign ℤ | Cochain maps ±2 then 0; H⁰=0,H¹=ℤ/2,H²=ℤ | Retain |
| 6.2 cup sign | Torus degree-one a,b over ℤ | a∪b evaluates +1, b∪a evaluates −1, a²=b²=0 | Retain |
| 6.2 cap sign | Edge c=[01], 0-cochain φ | ∂(c⌢φ)=φ(0)([1]−[0]); ∂c⌢φ−c⌢δφ has the same value | Retain front-face convention |
| 6.2 LS definitions | Point; circle; empty; zero ring | Cup lengths 0,1,0,0; category counts 1,2,0,≥1 for nonempty space | Retain nonempty premise |
| 6.2 LS headline | S¹; T² | 1+1=2≤2; 2+1=3≤3 | Retain ambient categorical cover count |
| 6.2 supported cochains | Infinite discrete ℕ | Compact supports give ⊕ℕR; unrestricted cochains ∏ℕR | Retain support distinction |
| 6.2 proper pullback | id_ℝ; ℝ→* | id pulls compact K to K; constant map pulls {*} to noncompact ℝ | Retain properness |
| 6.3 local orientation | ℝ⁰ and ℝ¹ | Local top groups ℤ,ℤ; signed point coefficient ±1; reflection in ℝ¹ acts −1 | Retain dimension zero |
| 6.3 simplex normalization | m=1,2 | det(I+J)=2,3, both positive; reference simplex maps to + local generator | Retain |
| 6.3 tensor square | Sign monodromy −1 | (−1)⊗(−1) acts +1, hence or⊗or is constant ℤ | Retain |
| 6.3 boundary orientation | I and oriented square | Endpoints −[0]+[1]; square right−left−top+bottom | Retain; R03 citation only |
| 6.3 RP² orientation | Antipodal map on S² | Degree (−1)³=−1; descent is the sign system; H²(or)=ℤ | Retain |
| 6.3 marked sphere sign | S⁰ based at positive pole | Distinguished reduced generator opposite its positive-pole local generator; σ₀=−1 | Retain pole convention |
| 6.4 characteristic-two headline | RP² over 𝔽₂ | Betti ranks 1,1,1; cap pairs degrees p and 2−p bijectively | Retain |
| 6.4 non-field coefficients | RP² over ℤ/4 | H₂=ℤ/2 versus H⁰=ℤ/4: untwisted cap cannot be bijective; 2≠0 | Retain h2, do not weaken it |
| 6.4 zero ring | Any permitted manifold, R=0 | Source/target zero modules; unique μ and unique bijection | Retain |
| 6.4 boundary duality | (I,∂I) | H⁰(I)=ℤ≅H₁(I,∂I); H¹(I)=0≅H₀(I,∂I) | Retain relative target |
| 6.4 triad | I with incoming/outgoing single endpoints | H*(I,{0})=0=H_(1−*)(I,{1}) | Retain |
| 6.5 linking | RP³; positively quotient-oriented L(5,1),L(5,2) | Values 1/2, −1/5, −2/5 modulo ℤ; reversed orientation negates them | Retain source orientation |
| 6.5 linking symmetry | n=3,i=1; n=5,i=2 | Exponents (2)(2)=4 gives +; (3)(3)=9 gives −; 1/2=−1/2 modℤ | Retain torsion-two skew case |
| 7.1 Euler definition | Empty, point, interval | Cell sums 0,1,2−1=1; homology sums 0,1,1 | Retain native invariant |
| 7.2 homotopy headline | I≃* | χ(I)=1=χ(*) | Retain |
| 7.2 product headline | S²×S²; empty×S² | 4=2·2; 0=0·2 | Retain |
| 7.2 bundle | Twisted S² bundle over S¹ | χ(total)=0=χ(S¹)χ(S²); monodromy does not alter Euler sum | Retain derivation |
| 7.3 cover headline | S²→RP², degree2; empty cover | 2=2·1; 0=0·χ(B) | Retain |
| 7.3 excision/additivity | Circle as two closed arcs meeting in two vertices | 0=1+1−2 | Retain subcomplex/excision premise |
| 7.4 standard values | S⁰,S¹,S²; T⁰,T¹; CP⁰,CP¹,CP² | 2,0,2; 1,0; 1,2,3 | Retain n>0 condition for torus zero |
| 8.1 relative homotopy | (*,*); (D²,S¹) | All relative groups 0 in first; π₂(D²,S¹)=ℤ, boundary to π₁(S¹) is +1 under normalization | Retain based subspace |
| 8.1 nonabelian control | Cone on S¹∨S¹ relative to base | π₂≅F₂, not ℤ² | Retain low-degree nonabelian structure |
| 8.1 cellular connectivity | S² with one 0-cell and one 2-cell | π₁=0, first nonzero π₂=ℤ | Retain dimension range |
| 8.2 Kan/cubical | Point and S¹ | π₁=0 and ℤ in both models; higher groups of S¹ vanish | Retain actual comparison |
| 8.2 nerve convention | g=(12),h=(23) in S₃ | d₁=hg=(132); 1↦3, versus gh sending 1↦2 | Repaired previous R01 |
| 8.3 absolute Hurewicz | S²; degree −1 map | π₂=ℤ→H₂=ℤ sends 1↦1, and −1↦−1 | Retain normalized map |
| 8.3 degree one | S¹∨S¹ | F₂→ℤ², commutator↦0; not an isomorphism | Retain separate abelianization |
| 8.4 relative Hurewicz | (ℝ,(0,1),1/2) | Relative π and H all 0, although inclusion is not closed cofibration | Retain restored generality |
| 8.4 missing-simple-connectivity control | Cone on S¹∨S¹ relative to base | π₂=F₂, H₂=ℤ²; commutator nonzero then zero | Retain simply connected A |
| 8.5 ordinary Whitehead headline | Degree1 and degree2 maps S¹→S¹ | π₁ maps ×1 and ×2; only first bijective and a homotopy equivalence | Retain specified map |
| 8.5 component condition | ∅→* | Positive-group condition vacuous, component map 0→1 not bijective | Retain π₀ |
| 8.5 CW-type Whitehead headline | Point models for intervals, any interval contraction map | π₀ bijection, positive groups 0→0; actual map is homotopy equivalence | Retain models |
| 8.5 homological Whitehead headline | S² degree1 versus degree2 | H₂ maps 1 and 2; only first an integral isomorphism | Retain integral coefficients |
| 8.5 homological CW-type headline | Contractible CW-type X,Y | H₀ map id_ℤ, higher maps 0→0; inverse obtained through point models | Retain actual-map conclusion |
| 8.5 proper inverse definition | I→* versus ℝ→* | Compact preimage I versus noncompact ℝ | Retain proper, not ordinary inverse |
| 8.5 proper extension/SDR headline | A=X; {0}⊂I | r=id,H=x; r=0,H=(1−t)x respectively, compact inverse images | Retain fixed-subspace equality |
| 8.5 ends / SC infinity | ℝ,ℝ²,ℝ³ | Ends 2,1,1; end groups 0,ℤ,0; SC infinity true,false,true | R04 add these Checks |
| 8.5 proper Whitehead | id_ℝ; ℝ→* | id is iso on H₀ and H_c¹=ℤ; collapse changes H_c¹ ℤ to 0 and is not proper | Retain support/proper premises |
| 8.5 controlled chain contraction | Two-term complex ℤ→idℤ | s=id in reverse degree, ds+sd=id; full and finite-support dual acyclic | Retain two-acyclicity route |
| 8.6 sphere normalization | I/∂I and coordinate reflection | Generator +1; reflection −1 in both π₁ and H₁ | Retain |
| 8.7 closed manifold headline | Empty; circle; two points | Finite CW models have 0 cells; one 0/one 1 cell; two 0-cells | Retain no connectedness assumption |
| 8.7 boundary manifold headline | I; D² | Finite CW homotopy type point, χ=1; half-space dimensions 1 and 2 | Retain positive boundary dimension |
| 8.7 homology sphere headline | S²; Poincaré homology 3-sphere | S² meets n=2, π₂=H₂=ℤ; second has nontrivial π₁ despite sphere homology | Retain simple connectivity |
| 8.8 BG headline | G=1,ℤ,S₃ | π₁=1,ℤ,S₃ and π₂=0; abelianizing S₃ would give order2 instead of6 | Retain nonabelian scope |
| 8.8 coefficient convention | Circle monodromy 2 over 𝔽₅, inverted edge | Direct δ=2; relabeling edge by inverse turns native action differential into 2 | Retain label inversion |
| 8.8 classification | X=S¹,G=S₃ | Based maps correspond to six elements; unbased maps to three conjugacy classes | Retain distinction |
| 8.9 fixed obstruction | D², boundary degree1 to S¹ | c(e²)=1, no extension; to S² obstruction group0 and extension exists | Retain |
| 8.9 difference sign | Boundary degrees1 and3, attaching degree2 | c₀=2,c₁=6,d=2,δd=4=6−2 | Retain |
| 8.9 class versus cochain | D² with boundary 1-cell, target S¹ | H²(D²;ℤ)=0 so [c]=0, but fixed c=1; changing degree to0 permits extension | Retain two criteria |
| 8.9 connectedness | Y=S²⊔{*}, basepoint isolated | Based π₂=0 versus sphere-component class1; no transporting path | Retain hypothesis |
| 8.10 ordinary representation | S¹,A=ℤ,n=1; two points,n=0 | Map classes ℤ=H¹(S¹;ℤ); A²=H⁰(two points;A), not A | Retain degree0/components |
| 8.10 relative form | (I,∂I),A=ℤ,n=1 | Relative map classes ℤ=H¹(I,∂I;ℤ) | Retain marked boundary |
| 8.11 mapping-space headline | X=∅; X=point; Y=point | Mapping spaces point; Y; point respectively, with corresponding CW models | Retain compact-open topology |
| 8.11 metric realization | Δ⁰; Δ¹; infinite wedge | Distances 0; vertex distance2; chosen wedge points have distances2/j→0 | Repaired previous R07 |
| 8.11 ANR/ANE | ℝ; S¹; Cantor set | Identity/retraction x↦x/‖x‖ fix targets; connected interval image cannot retract onto nontrivial Cantor subset | Retain |
| 8.11 domination | Empty identity; I through point; S¹ through point | Composites id; constant≃id; H₁ map0≠1 respectively | Retain homotopy-id condition |
| 8.11 EM loops | K(ℤ,1),K(ℤ,2) | π₀ΩK(ℤ,1)=ℤ; π₁ΩK(ℤ,2)=ℤ, other positive groups0 | Retain n=1 component case |
| 8.11 suspension sign | Degree n=0,1 and product with degree q=1 | Right suspension multipliers +1,−1 relative to cone convention; external swap factor −1 | Retain interval-last rule |
| 8.11 empty-subspace convention | B=∅; B=point | Based cofiber retains added point; reduced suspension of pointed point is point, unreduced two-apex suspension is I | Retain distinctions |
| 8.12 projective EM | RP∞,CP∞; RP¹,CP¹ | Infinite π₁=ℤ/2 and π₂=ℤ respectively; finite RP¹ has π₁=ℤ, CP¹ has π₃=ℤ | Retain infinite carriers |
| 8.12 class normalization | CP¹ hyperplane class and tautological line | Evaluation h=+1; tautological first Chern class −1 | Retain supplier convention |

## Not verifiable

The source service was asked for every bibliographic reference and the additional explicitly cited primary texts. Legal full text was obtained for Hatcher, Hatcher Vector Bundles, Ronald Brown, Milnor CW, Serre, Strøm, Conway–Friedl–Herrmann and Farrell–Taylor–Wagoner. The following limits remain; no inaccessible passage is treated as verified and no source manifest was edited. They do not replace the concrete ownership finding with a request to park this review.

- **eilenberg-steenrod**, Chapters I–III: publisher DOI landing page found, no readable full text obtained. Categorical coefficient generality was checked at the pin, not certified from that book.
- **whitehead**, Chapters II–VII: the title lookup yielded no legal full text. Hatcher verifies the sampled absolute/relative Hurewicz statements; this does not certify every Whitehead citation.
- **dold**, Chapters VII–VIII: service returned an uncertified paywalled reference. Treated as settled availability, not a renewed missing-text request.
- **may**, simplicial comparison chapters: no legal full text returned by the title lookup. Native carrier inspection and elementary examples do not prove the full Kan/realization comparison.
- **mccleary**, Chapters 1–2: Cambridge DOI landing page found without full text. Filtration convergence beyond the directly inspected sources is not source-certified here.
- **weibel**, Chapters 3 and 5: Cambridge DOI landing page found without full text. In particular the hereditary-ring/general-ring Künneth and universal-coefficient extensions are not verified against their cited text.
- **brown-cohomology**, Chapter VII: no legal full text returned. The all-degree arbitrary-group cochain/cup comparison and Cartan–Leray citation remain uncertified, although the nonabelian convention was tested directly.
- **freedman-quinn**, §7.7: no legal full text returned. The image-stability convention and its comparison with the source cannot be certified; the ℝ, ℝ² and ℝ³ computations do not settle the general theorem.
- **milnor-morse**, Lemmas 3.6–3.7: the title lookup resolved to a review rather than the book; that result was not accepted as the cited source. The smooth-triangulation supplier was checked independently.
- General ANR ingredients attributed to Dugundji, Arens–Eells and Wojdysławski were read as ingredients in Milnor's proof, not independently certified against those original papers. No unseen original-paper locator is endorsed.

Open-work ownership was checked against the supplied relevant heads and the roadmap index/object searches, not against unprovided unpublished work. Searches are not evidence that every similarly named construction in every open branch has identical hypotheses. In particular R01 and R02 have directly opened matching owners; no speculative duplicate is reported.

## Source issues

- **Misprint** in milnor-cw at proof of Theorem 2, concluding paragraph, printed page 276: the source says the weak/strong realization comparison completes Theorem 3; it should be Theorem 2; affects the proof.
- **Misprint** in milnor-cw at proof of Corollary 3, printed page 276: the source says Theorem 4 supplies the mapping-space triad; it should be Theorem 3; affects the proof.
- **Misprint** in conway-friedl-herrmann at proof of Lemma 2.6, printed page 504: the source says the reductions of g and f have degrees k and l respectively; it should be l and k respectively; affects nothing.
- **Misprint** in hatcher-vb at proof of Proposition 3.19, printed page 101: the source says two difference-cochain subscripts are s,t; it should be s,s′, the two sections defined in that proof; affects nothing.
