# Review of AlgebraicTopology (pull request #1652 at 7a3f77d)

**Verdict:** needs changes

## R01 (P1) — The nonabelian nerve Check reverses composition

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:2382` (“the 2-simplex (g,h) has faces d₂=g, d₀=h, d₁=gh”).

**Claim:** Traversing the edge g and then h has middle face gh, compatibly with the native nerve and the edge-preserving cubical comparison.

**Witness:** `Mathlib/CategoryTheory/SingleObj.lean:62` defines composition by `y * x`; line 76 identifies `f ≫ g` with `g * f`. For g=(12), h=(23), gh=(123), whereas hg=(132). Section 8.8 correctly uses the latter traversal convention.

**Repair:** Replace d₁=gh and the traversal product by d₁=hg and hg, and reverse which product the negative control rejects. Keep edge g mapped to loop g. In the scratch Lean probe, with g swapping 0,1 and h swapping 1,2, `(g*h) 0 = 1` and `(h*g) 0 = 2` both prove by `decide`; native composition equals the latter product by `rfl`. This repairs the example without changing §8.8's group identification.

## R02 (P1) — The Serre comparison consumes a carrier absent at the pins

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:1236` (“Compare with the library's Serre-fibration carrier, the morphism property on `TopCat` used by DGFloer Layer 1 item 2”).

**Claim:** The cube predicate can be compared to an existing library morphism property, then used to instantiate DGFloer's sequences.

**Witness:** Neither pinned library contains `serreFibrations` or `mem_serreFibrations_iff_cube`. `TauCetiRoadmap/DGFloer/README.md:445` and `:480` consume those interfaces from a newer Tau Ceti commit; they do not construct them.

**Repair:** Give the missing morphism-property/disc/cube interface an owner at these pins. The minimal local repair is to make §5.0 construct that interface from its actual lifting predicate, prove the disc/cube equivalence, and state precisely how the DGFloer sequence targets use it. Replace the nonexistent-library assertion throughout the scope and supplier contract. Do not change pins or wait for Mathlib. The resulting interface must include the already computed product lift `(H(z,t),a(z))`, admit ∅→B, and reject {0}→I: at t=1 the last map can produce only 0, whereas H(1)=1. No declared gap currently covers this input.

## R03 (P2) — Compact generation has two owners

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:118` (“Layer 4.0 owns the compact-generation coreflection … HomotopySpheres consumes these foundations”).

**Claim:** HomotopySpheres and GeneralizedCohomology consume this roadmap's new generic convenient-space foundations.

**Witness:** The supplied HomotopySpheres head, `TauCetiRoadmap/HomotopySpheres/README.md:663`, owns the same coreflection, counit, products and exponentials in §3A.1. GeneralizedCohomology G2.1, `README.md:234`, still consumes that foundation. HomotopySpheres §3A.1 needs only native inputs.

**Repair:** Import HomotopySpheres §3A.1's foundation by section and delete the duplicate generic construction in §4.0. Retain genuinely new raw-quotient, CW and normalization comparisons. Resolve the suspension–loop portion separately against §3A.2, extracting only the foundation needed before relative homotopy so that its later Puppe sequence does not become a prerequisite. Update the ownership claims to match the actual supplier; a unilateral sentence that the other roadmap consumes this one does not transfer ownership. On a point and on I, both proposed coreflections have the same topology and identity counit; the repair supplies that one object and the same I×I product, rather than two interchangeable constructions.

## R04 (P2) — Relative homology and its empty-pair comparison are already supplied

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:456` (“Define the relative homology functor … Prove functoriality, compatibility with composition, and the comparison”).

**Claim:** Section 2.2 owns these constructions in preadditive categorical coefficient generality.

**Witness:** Pinned `TauCeti/AlgebraicTopology/Singular/Relative.lean:223,234,241,248` supplies `TopPair.singularHomology`, identity/composition laws and `singularHomologyFunctor`; `Singular/Empty.lean:129` supplies the natural `singularHomologyInclIso`, with its actual quotient-induced component at line 148.

**Repair:** Delete §2.2 as an owned target and cite these exact declarations and hypotheses in the supplier contracts; repoint its consumers there. Keep the separate local-system extensions. For (*,∅), the native comparison sends the H₀ coefficient m to the same m; for (X,X), relative homology is zero; composing two identity pair maps acts as m↦m. These are already the proposed APIs, at the stated categorical generality.

## R05 (P2) — Relative homotopy is unnecessarily restricted to cofibrations

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:2289` (“State relative groups for NDR pairs/cofibrations, rather than attaching them to arbitrary inclusions without hypotheses”); §8.4, line 2421.

**Claim:** The general relative-group carrier, its exact sequence and relative Hurewicz are restricted to NDR/cofibration pairs.

**Witness:** Hatcher defines relative groups for based pairs at `hatcher line 14958`; Theorem 4.32, p.366 (`hatcher line 15962`), needs connectivity and nonempty simply connected A, not a cofibration. For (ℝ,(0,1),1/2), all relative groups and homology vanish, but A is not closed.

**Repair:** Construct relative homotopy and its exact sequence on arbitrary based topological pairs. State relative Hurewicz for n≥2, an (n−1)-connected pair and nonempty simply connected A, retaining the degree-two group argument. Keep NDR/CW assumptions on the quotient and skeletal results that actually use them. The displayed nonclosed pair then has 0→0 as the Hurewicz isomorphism in every n≥2; it is no longer excluded from a general theory the source supports.

## R06 (P3) — Several sampled claims have no precise locator, and one supplier locator is wrong

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:1414` (“McCleary … Chapters 1--2”); §§2.5, 4.4, 6.1, 6.5 and 8.1; supplier contract at line 295.

**Claim:** Each construction and theorem has an exact supporting source or a stated derivation from precisely cited inputs.

**Witness:** The cover-descent construction has only a chapter-wide citation. The coordinate normalization, quotient-sign comparisons, direct local cochains and torsion-linking theorem lack claim-level locators. DifferentialGeometry §2.4 is the orientation double cover, not the cited outward-first sphere orientation.

**Repair:** Give the theorem/section and printed page for each of these claims, or explicitly identify it as a construction derived from earlier named results and give the derivation's inputs. For relative Hurewicz use Hatcher 4.32, p.366; for cellular approximation use 4.8, p.349; for local coefficients distinguish §3.H, pp.328–333, from constant-coefficient duality. Replace the DifferentialGeometry §2.4 citation by its §5.1 boundary-orientation API plus the local sphere comparison actually constructed here. A cover by two copies of a point must still give H₀=R; the orientation comparison must still give ∂[I]=[1]−[0]; a linking reference must support the exponent giving +1/5 on L(5,1) and skew symmetry in dimension five. Unreadable sources are listed below, not assumed to validate these claims.

## R07 (P3) — The new mapping-space prerequisites lack discriminating Checks

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:2829` (“Construct the metric realization K_m … Develop the metric ANR/ANE neighborhood-retraction/extension API”).

**Claim:** Section 8.11a defines a metric realization, ANR/ANE interfaces and domination data with their distinguishing APIs.

**Witness:** The three Checks at lines 2929–2934 test C(*,Y), C(∅,Y) and components of ΩS¹. None tests the metric-realization topology, an ANR/ANE witness, or the requirement that a domination composite be homotopic to identity.

**Repair:** Add at least three discriminating Checks for each of those definitions. For the realization, include Δ⁰, Δ¹ (ℓ¹ distance between its vertices is 2), and an infinite wedge distinguishing weak from metric topology. For ANR/ANE include a Euclidean retract, the annular retraction onto S¹, and the Cantor set as a non-ANR. For domination include identity, the constant domination of a contractible interval, and S¹ with a proposed constant composite: the latter acts by 0 on H₁, whereas identity acts by 1, so it must fail. These test the introduced objects themselves; keep them in the README.

## Verified sound

Read both files, seven previous findings, gate, signatures, normative rules, and main ClassifyingSpaces, UniversalCovers and GeneralizedCohomology as shape comparisons. Head verified; outside-folder diff empty; no PR edits. No algorithm, copied passage, sorry-valued data, `set_option`, foreign roadmap import or admitted example found.

**Previous findings, checked before the full pass.**

| Previous finding | Passage at this head | Disposition |
| --- | --- | --- |
| r5 R01, duplicated monoid π₁ | README:210, “Native `FundamentalGroup.cast_map_prod_mul` and `FundamentalGroup.instCommGroup`”; §1.6 consumes them. | Repaired. The additional naturality and composition comparison are distinguished. |
| r5 R02, missing headlines | Suggested.lean:298–336, `FiniteCWTypeModel`, both compact-manifold theorems and the homology-sphere theorem; README §8.7 names them. | Repaired. All four added declarations were elaborated and their full signatures inspected. |
| r5 R03, removed names cited by consumers | README:2993–3012 maps the old interfaces to the sup-ball, suspension, CW pushout, finite-span Brouwer, based-pair, category and finite-CW-type sections. | Repaired as requested: mathematical interfaces remain locatable without reinstating an API catalogue. |
| r5 R04, duplicated local-system definition | README:543, “Consume the native `LocalCoefficientSystem R X`”. | Repaired. The direct-cochain convention is separately specified. |
| r5 R05, four source locators | Transfer now cites the paragraph before 3G.1, p.321; Brouwer cites 2.15, p.114; function spaces cite A.14–A.16, pp.530–531; sphere recognition cites 4.32/4.33, pp.366–367. | Repaired for those four items. R06 concerns other claims and a supplier mismatch. |
| r5 R06, Euler Check and missing Checks | §4.5 now gives 3−1=2 for the bad cell count; §§3.1, 5.6, 6.1, 6.5, 8.2, 8.3 now have Checks. | Partly repaired: the requested blocks exist, but §8.2's nonabelian Check is false (R01). The new unnormalized prism calculation is correct, including T[v]=[v,v]. |
| r5 R07, prose cleanup | Layer labels and most glued formulas were corrected. README:1641 still has “equal to∞”; Suggested.lean:376 still calls Layer 8.5 “Stage 8.5”. | Substantially repaired; these remaining typographic points are nonblocking notes. Abbreviations should be expanded where first used. |

**Gate and Lean.** The worker's full gate at this head passes: every reported scanner counter is zero and the targeted module build succeeds. The independent dependency command returned:

```text
depcheck: 205 roadmaps, 1606 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Absence of this roadmap from the order is not a finding. The graph check does not resolve the content or pin mismatches in R02–R03.

Independent `lake env lean` succeeded with only 20 `sorry` warnings. A scratch `#check @name` run for all 34 declarations also succeeded; the types match the supplied extraction, with no dropped binders. Duality retains compactness, Hausdorffness, connectedness and 2=0; CW models retain actual equivalences and finiteness where required; Whitehead fixes the specified map; sphere recognition retains simple connectivity and n≥2.

Probed all 20 admitted theorems with closing `rfl`, `simp` and `infer_instance` branches: none closed. No one-lemma proof was found in the matching pinned APIs: cellular comparison still requires finite dimension; native Euler identities alone do not prove the three headlines. No Lean padding found. R04 concerns README duplication.

**Headline coverage.** The 20 statements cover Brouwer; arbitrary-dimensional cellular comparison; transfer; two tower-surjectivity theorems; LS; 2=0 duality; three Euler results; four Whitehead forms; two compact-manifold CW-type results; homology-sphere recognition; mapping-space CW type; nerve K(G,1); and proper deformation rectification. Their 14 supporting declarations have real bodies.

The docstring names the unstated headlines and missing carriers/maps: Wang/Künneth filtrations, Serre/Cartan–Leray, twisted/boundary/integral duality, Hurewicz maps, complex/skeletal Milnor sequences, normalized representability/EM loops, obstruction classes, proper Whitehead, and pair/marked/noncompact CW models. No further missing statable headline was established; source limitations remain below.

**Pinned declarations opened: 12 groups of APIs.** Mathlib pin: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Paths in this table are library-relative.

| Object and locator | Actual content checked |
| --- | --- |
| `Mathlib/CategoryTheory/SingleObj.lean:62,76` | Composition is reversed multiplication; R01. |
| `Mathlib/AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:41` | `FundamentalGroup.mul_def`: p*q is q traversed before p, agreeing with §8.8. |
| `TauCeti/AlgebraicTopology/FundamentalGroup/TopologicalMonoid.lean:108,118` | Pointwise loop multiplication and commutative π₁ already provided. |
| `TauCeti/AlgebraicTopology/LocalCoefficient.lean:43` | Functor from the fundamental groupoid to modules; no projectivity or reflexivity built in. |
| `TauCeti/AlgebraicTopology/Singular/Relative.lean:223,234,241,248` | Relative homology, induced maps, composition and functor; R04. |
| `TauCeti/AlgebraicTopology/Singular/Empty.lean:129,148` | Natural absolute/empty-relative comparison and quotient-induced component. |
| `TauCeti/AlgebraicTopology/Cellular/Comparison.lean:80,109` | The homology isomorphism has a finite-dimensional CW hypothesis and exact coproduct inputs. |
| `TauCeti/AlgebraicTopology/Cohomology/Cap/Basic.lean:101` | Native cap uses actual pairing maps and p+q=n; supports the Lean duality formulation. |
| `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59,123` | Aspherical includes path connectedness; K(G,1) includes the actual nonabelian fundamental-group isomorphism. |
| `Mathlib/Topology/Covering/Basic.lean:287` | Covering predicate is even covering at each target point; surjectivity is not included. Degree-zero empty covers must be retained. |
| `TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/Basic.lean:141,169`; `Singular.lean:141` in that directory | Native alternating cell count and Euler–Poincaré comparison under finite CW hypotheses. |
| `TauCeti/AlgebraicTopology/FundamentalGroupoid/CoverGeneration.lean:104`; `Cech/Colimit.lean:141` | Cover generation and the Čech cocone's universal property already supplied. |

Object searches also covered twisted chains/cochains, disk/sphere homology, mapping cylinders and homotopy extension. No R02 Serre identifier occurs in either pin. The citation resolver found no unresolved roadmap names but did not check libraries; local searches supplied that check.

**Ownership audit.** Used `roadmaps grep`, main, provided heads and board packages by object. No different readable roadmap declaring a retained fully qualified name was found; older AlgebraicTopology revisions are the same owner. Raw nerve versus Milnor models, direct L-cochains versus dual-system cochains, and arbitrary versus finite CW dimension are distinct extensions. R03 duplicates the same object.

| Citation resolved | Content and direction checked |
| --- | --- |
| `Completed/UniversalCovers`, construction/deck/basepoint stages | Existing covering object is consumed, with its connectedness/local hypotheses. |
| GeometricTopology, Layer 1 and smoothing/triangulation item 1 (`README.md:930`), Layer 11 | Smooth triangulation supplies §8.7; the ordered-realization mention is a consumer route. |
| DifferentialGeometry §§2.1–2.2 (`README.md:345`), 5.1 (`:507`), 9.3 (`:872`), 10 (`:877`) | Tangent and boundary orientations precede homological classes; integration and smooth-degree comparison are later. The §2.4 sphere locator is wrong (R06). |
| DGFloer Layer 1 items 1–4 (`README.md:453` onward), Layer 2 item 3 | Degree-one Hurewicz and direct connected-map comparison are distinguished from this roadmap's higher Hurewicz; filtered complexes and normalized abelian EM family are named. Native Serre carrier unavailable here (R02). |
| ClassifyingSpaces Stage 3 items 11–15 (`README.md:177`), Stage 4 items 16–18 (`:222`) | CW uniqueness and bar-resolution/model comparisons are inputs to §8.8b, not §8.8a's raw nerve. |
| GeneralizedCohomology G2.1 (`README.md:234`) | Foundation-only realization-product comparison exists; its compact-generation ownership is inconsistent with §4.0's claim (R03). |
| TopologicalKTheory T1.6 and T7.0 | Infinite fixed-rank projective/Grassmannian models are supplied; T7.0 consumes this roadmap's product/connectivity result. |
| CharacteristicClasses C1.2a (`README.md:331`), C1.5, C2.0 (`:552`), C3 (`:720`) | S0–S4 support inputs are separate from S5; finite projective comparisons are consumed; C2.0 and the Milnor applications are consumers. |
| ComplexKahlerGeometry K7.1 (`README.md:1407`), K7.2 (`:1444`) | CPⁿ model and finite CW structure give χ=n+1. |
| TopologicalSheafCohomology §§1.1–1.2 (`README.md:106,126`) | Raw Čech/refinement theory remains elsewhere; §5.6 is the finite open-cover chain double complex. |
| HomotopySpheres supplied head §3A.1 (`README.md:663`), §3A.2 (`:678`) | Earlier foundation is already owned there; importing only the independent foundation avoids importing Puppe theory back into its prerequisite. |
| Supplied AlgebraicTopologyPartII and DeRhamCohomologyAndDuality heads | Configuration/real-locus and de Rham extensions have distinct objects; no re-planning of either found. |
| Consumer citations: MorseTheory M2/M4/M5, ImplicitAtlases §0.7, FourManifolds end theory, CStarClassification CL8, RiemannianGeometry R3, SmoothBundlesConnections B6.1, BanachAlgebras A8, AffineMorseLefschetz A4 | These were searched as consumers of disk attachments, category, supported/proper topology, lim¹, connectivity, coefficient sequences, Brouwer and Milnor algebra. They supply no missing generic foundation merely by citing it. |

Read every `*Needs:*` line. The supported/ordinary, raw-bar/model-comparison and mapping-CW/EM-loop splits avoid circular proof routes; R02–R03 remain.

**Seeded source sample: 15 targets.** No locator is explicitly marked unverified. Legal texts were fetched through the sources service. Brown's updated author-hosted third edition preserves the sampled theorem/page numbers.

| Target | Text read and result |
| --- | --- |
| 1.2 Cover naturality | Brown 3.6.4, p.91 (`brown-groupoids line 3995`), path subdivision by a Lebesgue number; 6.7.2, pp.240–241 (`line 9394`, `line 9424`) for the pushout relations. General Čech/refinement naturality is the native supplier, not a stronger theorem attributed to this two-open source. |
| 1.4 Two-open pushouts | Brown 6.7.2, p.240, with interiors covering and the representative set meeting each component. Taking all points gives the groupoid version; taking one point needs the stated connectedness conditions. |
| 2.1 Relative chain quotients | Hatcher §2.1, p.115 (`hatcher line 5024`): quotient chains and induced differential for arbitrary subspaces; degreewise split free chains explain the quotient/short-exact-sequence comparison. Categorical generality comes from the pin. |
| 2.2 Relative homology | Hatcher pp.115–117 (`line 5033`, `line 5101`), Theorem 2.16. Supports the mathematics, but it is already supplied (R04). |
| 2.5 Coordinate orientations | Hatcher's relative disk/sphere and cellular calculations support the generator groups, not the stated radial formulas and their whole system of normalizations at an exact locator. The formulas and low-dimensional signs were computed below; source attribution remains incomplete (R06). |
| 3.1 Subdivision and prism | Hatcher §2.1, pp.121–122 (`line 5300` through `line 5385`): cone recursion and ∂T+T∂=id−Sd agree, including the unnormalized degenerate terms. Local transport is an extension, not claimed to be the constant-coefficient source theorem verbatim. |
| 4.2 Cellular differentials | Hatcher Lemma 2.34, p.137 (`line 5963`), and cellular boundary formula, p.140 (`line 6081`). The n=1 boundary is endpoint subtraction; higher entries are attaching degrees. |
| 4.4 Pointed quotients and suspension | Native reduced zero-sphere comparison and Hatcher's quotient/suspension material support the basic objects; no exact locator pins all added-point and interval-last signed homeomorphisms. The n=0 and interchange tests below check the chosen normalization; R06. |
| 5.7 Cover-descent spectral sequence | The filtered-complex construction has a named DGFloer supplier. McCleary Chapters 1–2 was not legally readable as full text; no theorem/page is specified. The E¹ term and two-member examples were computed, not certified from that citation. |
| 6.1 Direct local-system cochains | Backward transport agrees with dualizing chains and differs from forward transport over F₅. The roadmap gives no precise local-coefficient theorem locator; Dold was returned uncertified. Hatcher §3.H is the relevant local-coefficient section, not solely §§3.1–3.3. |
| 6.3 Orientation/fundamental classes | Hatcher Lemma 3.27, p.236 (`line 10255`), proves the compact-support local-image lemma with the hypotheses in its surrounding orientation discussion; 3.26, p.235 (`line 10225`), is the closed connected case. The arbitrary local-system extension, coefficient normalization and recharting are explicitly new proofs here. They are not certified simply by citing 3.27. |
| 6.5 Linking and degree | No exact locator for nonsingularity, the stated symmetry exponent or Wu/lens examples; chapter-wide Hatcher/Dold citations do not identify one. Numerical tests below agree with the asserted sign; source certification incomplete (R06). |
| 8.1 Relative homotopy/connectivity | Hatcher §4.1, p.343 (`line 14958`), defines relative homotopy for arbitrary based pairs. Theorem 4.8, p.349 (`line 15205`), gives relative cellular approximation; the dimension bound is its immediate skeletal application. The NDR restriction is unnecessary (R05). |
| 8.3 Absolute Hurewicz | Hatcher 4.32, p.366 (`line 15961`): n≥2 and (n−1)-connected X, vanishing reduced homology below n. The declared degree-one supplier is separate. |
| 8.4 Relative Hurewicz | Hatcher 4.32, p.366 (`line 15962`): n≥2, (n−1)-connected pair, A nonempty simply connected. This supplies a less restricted theorem than the roadmap (R05); the group-to-abelian-group issue in degree two is retained. |

Additional opened locators: Hatcher's transfer paragraph before 3G.1, p.321 (`line 14023`); mapping-space Propositions A.14–A.16, pp.530–531; Corollary 4.33, p.367; Milnor's CW-type Theorems 2–3 and Corollary 3 (`milnor-cw line 190`, `line 209`, `line 218`); Milnor's Morse Lemmas 3.6–3.7 (`milnor-morse line 3624`, `line 3537`); Farrell–Taylor–Wagoner Corollary 4.9 (`ftw line 735`). The latter keeps finite dimension, local finiteness and simple connectivity at infinity. Two Milnor source misprints were confirmed on the scanned printed page, not inferred solely from OCR; they are recorded at the end.

**Computed adversarial table: 204 rows.** Pass means agreement on the instance, not a universal proof. Rows cover all numbered sections, sampled targets, headlines and supplementary conventions. Negative controls include empty, zero, disconnected, nonabelian, characteristic-two, nonreflexive and nonproper cases.

| Statement | Instances tried | Computed values on the two routes | Result / change |
| --- | --- | --- | --- |
| 1.1 cover diagrams | Empty X; point covered twice | Empty colimit has 0 objects; two point groupoids glued over a point give 1 object, equal to Π₁(*). | Pass; consume native carrier. |
| 1.2 subdivision generation | I with overlapping opens; identity path | Subpaths concatenate to t↦t; inserting a constant segment gives the same endpoint-fixed class, identity in π₁(I)=0. | Pass. |
| 1.2 Čech relations/naturality | Identity refinement of two opens | Both induced cocones send each local path to its original global class; identity path maps to 1 on both routes. | Pass. |
| 1.3 based pushout | Two contractible overlapping intervals | 1 amalgamated over 1 with 1 is 1, equal to π₁(I). | Pass with nonempty connected intersection. |
| 1.4 groupoid pushout | S¹ covered by two arcs | Intersection has 2 components; groupoid gluing gives ℤ. Falsely replacing the intersection by one based trivial group gives 1. | Pass; retain multiple objects. |
| 1.5 circle and wedges | One circle; two circles | π₁=ℤ and F(a,b); abelianizations ℤ and ℤ². Commutator in F(a,b) is nontrivial despite image 0 in ℤ². | Pass. |
| 1.6 pointwise product | Circle loops of winding 2,3 | Pointwise product winding 5; fundamental-group product also 3+2=5. | Pass; native theorem. |
| 1.6 naturality | Squaring on circle, windings 2,3 | Image of product has winding 10; product of images has 4+6=10. | Pass. |
| 2.1 relative chain quotient | (*,∅), (X,X) | Quotients C(*)/0=C(*); C(X)/C(X)=0. Induced boundary in second case is 0. | Pass. |
| 2.2 relative homology/functor | H₀(*,∅;M); identity composites | m↦m on both comparison routes; id∘id=id. Hₙ(X,X)=0. | Pass mathematically; R04 duplicate. |
| 2.3 pair boundary | (I,{0,1}) | Boundary of positive interval is (−1,+1); kernel of sum ℤ²→ℤ is ℤ(−1,+1). | Pass. |
| 2.3 triple | B=A⊆X and B=∅ | First case H(A,B)=0 and remaining map id; second recovers pair sequence with zero initial complex. | Pass. |
| 2.4 reduced/unreduced, additivity | Two points; empty space | H₀=ℤ², reduced kernel ℤ(1,−1); empty ordinary and nonnegative reduced groups both 0. | Pass in stated nonnegative grading. |
| 2.5 cube orientation | n=0,1,2 | Augmentation 1; ∂I=[1]−[0]; ∂(I×I)=right−left−top+bottom. Unsigned two triangles leave twice the diagonal. | Pass; exact attribution R06. |
| 2.5 radial homeomorphism | x=(1,1); x=0 | Sup-ball→disk sends x to (1/√2,1/√2), Euclidean norm 1; 0 maps to 0 without division. Inverse recovers (1,1). | Pass; zero branch essential. |
| 2.5 coordinate/permutation law | Swap two coordinates; empty permutation | Determinants −1 and 1; class multipliers −1 and 1 respectively. | Pass. |
| 2.5 sphere reference | S⁰={q,−q} | [q]−[−q] has local images (1,−1), augmentation 0; [q]+[−q] gives (1,1), augmentation 2. | Pass; excludes wrong H₀ class. |
| 2.6 twisted chain transport | Circle with monodromy −1 on ℤ | First-face transport minus last face gives −2 on a coefficient; constant system gives 0. | Pass; native first-vertex convention. |
| 2.6 pullback/relative/LES | Constant system on (I,∂I) | Boundary coefficient pair (−m,m); its sum 0; identity pullback preserves m. | Pass. |
| 2.7 Brouwer headline | Point; [0,1], f(t)=1−t | Fixed point is the point; equation t=1−t gives t=1/2. Empty C would have no witness. | Pass; nonempty hypothesis present. |
| 2.7 finite-span extension | Segment in an infinite-dimensional normed space | Span dimension 1; the same reflection fixes its midpoint. No ambient finite-dimensional assumption is needed for this extension. | Pass; README extension distinct from Lean headline. |
| 2.7 no-retraction route | I→∂I, purported retraction | Inclusion H₀(∂I)=ℤ²→ℤ sums coordinates, so cannot have a left inverse: (1,−1) maps to 0. | Pass. |
| 3.1 subdivision | Edge [v₀,v₁] | ∂([b,v₁]−[b,v₀])=[v₁]−[v₀]=∂edge; plus sign gives [v₁]+[v₀]−2[b]. | Pass. |
| 3.1 prism at n=0 | [v] | T[v]=[v,v]≠0 in unnormalized chains; ∂T=0=id−Sd. | Pass. |
| 3.1 prism at n=1 | Edge σ | ∂Tσ+T∂σ=σ−[b,v₁]+[b,v₀]=σ−Sdσ; degenerate-edge coefficients cancel. | Pass. |
| 3.2 small-chain inclusion | Cover by all X; subdivided interval | All-X inclusion is id and homology id. Two-subinterval subdivision has endpoints [1]−[0], same as original interval. | Pass. |
| 3.3 excision | (ℝ,ℝ∖{0}), excising outside (−1,1) | H₁ on both sides ℤ, other positive groups 0; local positive generator maps to +1. | Pass with closure/interior hypothesis. |
| 3.4 Mayer–Vietoris sign | Two opens with point intersection | m↦(m,−m), followed by addition gives 0. Unsigned pair gives 2m over ℤ. | Pass. |
| 3.5 sphere connecting map | Two arcs covering S¹ | Kernel of ℤ²→ℤ² with columns (1,−1) is ℤ(1,−1); H₁(S¹)=ℤ. | Pass. |
| 4.0 coreflection/counit | Point, I | k(*)=* and kI=I; counits are identity, compact-test maps unchanged. | Values agree; R03 ownership. |
| 4.0 products/exponential | I×I; maps from point | k(I×I)=I²; C(*,I)≅I; evaluation returns the same t. | Values agree; R03 ownership. |
| 4.0 pointed adjunction | S⁰→ΩS¹ | Components of based maps are ℤ on each side of [ΣS⁰,S¹]≅[S⁰,ΩS¹]. Constant map corresponds to 0. | Pass instance; reconcile supplier R03. |
| 4.1 cellular groups | Infinite discrete set J, module M | C₀=⊕J M, not ∏J M. A vector nonzero at every j is excluded; singleton-supported m is included. | Pass. |
| 4.2 cellular differential | RP²; interval | RP²: d₂=2,d₁=0, d₁d₂=0; interval: d₁(1)=(−1,1). | Pass. |
| 4.3 comparison headline | RP² with ℤ; pair (X,X) | H₁=ℤ/2,H₂=0 on cellular and singular sides; zero on both sides of the diagonal pair. | Pass. |
| 4.3 arbitrary dimension | CP∞ in fixed degree 2r | Skeleta CPᵏ give H₂r=ℤ for k≥r; filtered colimit ℤ equals singular H₂r. | Pass; finite-dimensional pin does not alone state this. |
| 4.3 local cell coefficients | Point with fibre ℤ/2 over ℤ | Cellular C₀=ℤ/2, singular H₀=ℤ/2; a free-ℤ-cell assertion would give ℤ and fail. | Pass. |
| 4.4 pointed quotient | X=∅,B=∅; X=*,B=∅; B=X | Quotients *, S⁰, * respectively; reduced H₀=0,ℤ,0, equal to relative H₀. | Pass. |
| 4.4 disk/cube quotient | D⁰; oriented I | Disk point maps to −p and added point to p, coefficient +1 on [−p]−[p]; I maps to winding +1. | Pass; R06 locator. |
| 4.4 raw/Kelley comparison | Compact spheres and I quotients | Compact Hausdorff quotients already k-spaces: counit and inverse are identity on every equivalence class. | Pass. |
| 4.4 smash units/associativity | S⁰∧S¹; three zero-spheres | Nonbasepoint acts as identity; both parenthesizations have one nonbasepoint, with coefficient 1. | Pass. |
| 4.4 interchange degree | m=n=1; m=2,n=1 | Degrees −1 and +1, equal to (−1)^(mn). | Pass. |
| 4.4 native sphere unit | n=0, native pole p or −p | Comparison ε₀=+1 or −1; interval boundary coefficient is −ε₀ relative to the based generator. | Pass; no arbitrary pole is silently fixed. |
| 4.4 disk relative cells | D⁰ and (D²,S¹) | Relative cell counts: one degree-0 or one degree-2 cell; corresponding relative homology ℤ in that degree. | Pass. |
| 4.4 coproduct pairs | Two intervals with boundaries | Relative C₁=ℤ², H₁=ℤ²; labels remain two separate generators. | Pass. |
| 4.5 NDR/cofibration and quotient | (I,{0}); (I,∂I) | I/{0} contractible; I/∂I=S¹ with H₁=ℤ. Collapsing a contractible subspace and collapsing all endpoints differ. | Pass. |
| 4.5 attachment transport | Attach interval endpoints to one point | Result S¹, cells (1,1), χ=0. Replacement by a homotopy-equivalent point preserves this model. | Pass. |
| 4.5 relative CW pushout | Attach D¹ along S⁰ to a point | Correct relative pushout has one old 0-cell and one 1-cell: 1−1=0; wrongly retaining two attaching cells gives 3−1=2. | Pass repaired Check. |
| 4.5 mapping cylinder and cone | Identity on S¹ | Cylinder retracts to S¹, H₁=ℤ; its mapping cone is contractible, H₁=0. | Pass; prevents conflation. |
| 4.5 CW products | S¹×S¹ | Cell counts (1,2,1), χ=0; tensor differential 0 agrees with torus homology ranks (1,2,1). | Pass with Kelley product comparison. |
| 4.5 strict sequential colimit | S⁰⊂S¹⊂… | Each fixed positive πq eventually maps into πq(Sⁿ)=0 for n>q; colimit S∞ is weakly contractible. A single finite sphere is not substituted. | Pass instance. |
| 4.5 homotopy invariance of attachments | Two constant attaching maps S⁰→I | Both quotients have a circle with a contractible tail; H₁=ℤ on both, χ=0. | Pass. |
| 4.6 projective cells | RP¹,RP²,RP³ | Ordinary cellular d alternates 0,2,0; H₁=ℤ,ℤ/2,ℤ/2 respectively. | Pass. |
| 4.6 sign local system | RP² with ε | Twisted d₁=±2,d₂=0; H₂=ℤ,H₁=0,H₀=ℤ/2. | Pass. |
| 4.7 simplicial realization | Δ⁰, Δ¹, simplicial circle | Cells (1), (2,1), (1,1); homology respectively ℤ in degree 0, ℤ in degree 0, ℤ in degrees 0,1. | Pass. |
| 4.7 simplex/ball comparison | Boundary direction (1,0) in the displayed 2-simplex map | Barycentric image (0,2/3,1/3) has sum 1, nonnegative coordinates and one zero coordinate. | Pass. |
| 5.0 cube lifting | Product B×F→B | Lift (H(z,t),a(z)) projects to H and at 0 equals (H(z,0),a(z))=g. | Pass formula; R02 missing comparison input. |
| 5.0 nonsurjective/failed lifting | ∅→B; {0}→I | First has no initial cube maps, hence vacuous lifting; second would require 0=H(1)=1. | Pass definition tests. |
| 5.0 composites/pullbacks | Identity; product pulled back along f:C→B | Composite lift unchanged; pullback is C×F and lift projects to H_C on both routes. | Pass. |
| 5.1 Eilenberg–Zilber sign | I×I | Two shuffle terms have coefficients +1,−1; shared diagonal cancels. | Pass native product convention. |
| 5.1 Künneth tensor/Tor | RP²×RP² over ℤ | H₁=(ℤ/2)²; H₂=ℤ/2 from tensor; H₃=ℤ/2 from Tor₁. Deleting Tor would give 0 in degree 3. | Pass with PID hypotheses. |
| 5.1 general coefficients | Zero module; fields F₂,F₃ | Zero module gives 0 on all sides; over either field Tor positive degrees is 0. | Pass; no division by cover degree imposed. |
| 5.2 Wang | Mapping torus of id:S¹→S¹ | 1−f*=0; H₁=ℤ²,H₂=ℤ, equal to torus homology. | Pass. |
| 5.2 Wang nontrivial monodromy | Mapping torus of degree −1 circle homeomorphism | 1−f*=2 on H₁; H₁=ℤ⊕ℤ/2,H₂=0, equal to Klein bottle. | Pass. |
| 5.3 transfer headline | Two points→point over ℤ | t(m)=(m,m); projection sums to 2m=d·m. | Pass. |
| 5.3 transfer in dividing characteristic | Same cover over F₂ | t(1)=(1,1)≠0; projection 1+1=0=2·1. Zero transfer fails the specified lift sum. | Pass, excludes vacuous existence. |
| 5.3 degree zero/identity | ∅→B; identity cover | d=0 gives t=0 and composite 0; d=1 gives t=id and composite id. | Pass. |
| 5.3 transfer naturality | Pull back two-point cover to two points | Each base generator maps to its two lifts; either route gives two coefficient-1 summands over that generator. | Pass. |
| 5.3 Cartan–Leray | Trivial group action | Only p=0 group-homology column remains, E²₀q=Hq(X), equal to quotient homology. | Pass instance; filtration not certified by a group isomorphism alone. |
| 5.4 torus | Dimensions 0,1,2 | Homology ranks (1), (1,1), (1,2,1), matching binomial coefficients; ∧³ℤ²=0. | Pass. |
| 5.5 Serre applications | Trivial fibration S¹×S¹→S¹ | E² entries ℤ in bidegrees (0,0),(1,0),(0,1),(1,1); totals have ranks (1,2,1). | Pass example; R02 supplier. |
| 5.6 cover double complex | Two identical point opens | Čech differential R→R² is c↦(−c,c); augmentation (a,b)↦a+b has that kernel. | Pass; opposite of the chosen MV injection is an explicit sign adapter. |
| 5.6 total differential | A bidegree-(1,1) element | Mixed terms are −∂δc+δ∂c=0; without the (−1)^p factor they add to 2∂δc over ℤ. | Pass. |
| 5.7 cover descent | One point open; two identical point opens; empty cover of ∅ | E¹ has R alone, or R→R² with homology R, or 0; abutment H₀ is R,R,0. | Pass values; locator R06/unreadable McCleary. |
| 6.0 towerDifference definition | Identity bonds, x=(3,1,0,…) | δx=(2,1,0,…), opposite convention (−2,−1,0,…); kernel constant sequences. | Pass. |
| 6.0 surjective-bond headline | Identity ℤ tower | For target a, x₀=0 and xₙ₊₁=xₙ−aₙ give δx=a; ker≅ℤ,coker=0. | Pass. |
| 6.0 Mittag–Leffler headline | Zero ℤ bonds | Eventual image 0 stabilizes, δ=id, ker=coker=0; individual bonds not surjective. | Pass; genuinely broader than preceding statement. |
| 6.0 failure without stabilization | ×2 ℤ tower; target (1,0,1,0,…) | x₀≡1+4+…+4^(k−1) mod 4^k; hence 3x₀+1 divisible by every 4^k, requiring x₀=−1/3∉ℤ. | Pass negative control. |
| 6.0 functoriality/shift/product | Identity towers ℤ and ℤ²; map ×3 | δ(3x)=3δx; shift preserves constant kernel ℤ; product kernel ℤ² and coker 0. | Pass. |
| 6.0 six-term sequence | Constant split sequence 0→ℤ→ℤ²→ℤ→0 | Limits ℤ→ℤ²→ℤ, all lim¹ terms 0; kernel of projection equals first summand. | Pass. |
| 6.0 cochain Milnor | Constant tower ℤ concentrated in degree 0 | k=0 sequence 0→0→ℤ→ℤ→0; other k all 0. | Pass. |
| 6.0 chain Milnor/reindexing | Constant ℤ in chain degree 1 | H₁=ℤ, cohomology in degree −1=ℤ; neighboring lim¹ term 0. | Pass; j+1 shift retained. |
| 6.0 derived-limit cone | ×2 tower of degree-zero ℤ modules | Cone has H¹=coker δ≠0 by preceding target, equivalently homological H₋₁≠0; truncation to ℕ would erase it. | Pass. |
| 6.0 homotopy-square dependence | Zero maps A→B with A⁰=ℤ, B⁻¹=ℤ, other terms 0; homotopies 0 and id | Cone off-diagonal entries are 0 and id; difference sends generator 1 to 1, not 0. | Pass: no unjustified independence claimed. |
| 6.1 direct local cochains | Circle, F₅ monodromy u=2 | δa=(u⁻¹−1)a=(3−1)a=2a; forward transport gives a. | Pass; direction discriminated. |
| 6.1 nonreflexive coefficients | Point, ℤ-module ℤ/2 | Direct H⁰=ℤ/2; Hom(ℤ/2,ℤ)=0 and double dual 0. | Pass; reflexivity not silently assumed. |
| 6.1 cellular direct cochains | RP², sign system | δ⁰=±2,δ¹=0; H⁰=0,H¹=ℤ/2,H²=ℤ. | Pass. |
| 6.1 products versus sums | Countably many isolated points, coefficients ℤ | Cochains ∏ℕℤ include constant 1; chains ⊕ℕℤ exclude that infinite-support vector. | Pass. |
| 6.1 skeletal inverse limit | CP∞ in degree 2 | H²(CPᵏ)=ℤ for k≥1, restriction id; lim=ℤ,lim¹=0, equal to H²(CP∞). | Pass. |
| 6.1 UCT | RP² over ℤ, n=2 | Ext¹(H₁,ℤ)=ℤ/2 and Hom(H₂,ℤ)=0; H²=ℤ/2. | Pass with coefficient hypotheses. |
| 6.1 Bockstein | RP², 0→ℤ→×2ℤ→F₂→0 | Degree-one mod-2 generator lifts to a cochain with differential 2; Bockstein is the nonzero class in H²(−;ℤ)=ℤ/2. | Pass. |
| 6.2 singularCohomology definition | Point, circle | Native specialization H⁰(*)=R,H¹(*)=0; H¹(S¹)=R. | Pass, simple alias serving headlines. |
| 6.2 cupProduct and signs | Oriented T², degree-one a,b | ⟨a∪b,[T²]⟩=1; ⟨b∪a,[T²]⟩=−1; a²=b²=0. | Pass. |
| 6.2 cup unit/naturality | Point, R; coefficient map ℤ→F₂ | 1∪r=r; coefficient image of −1 equals 1 in F₂ on either route. | Pass. |
| 6.2 cap boundary sign | Edge e, 0-cochain values a₀,a₁ | Left ∂(e⌢a)=a₀([1]−[0]); right a₁[1]−a₀[0]−(a₁−a₀)[1] equals it. | Pass. |
| 6.2 cap transport | Edge with fibre transport u | Back-face coefficient is u times the paired front coefficient; constant transport u=1 recovers that coefficient. Reversing edge uses u⁻¹. | Pass. |
| 6.2 relative cap | (I,∂I) | Capping relative [I] with relative degree-one generator gives positive point class in H₀(I)=ℤ; capping by absolute 1 leaves relative [I]. | Pass distinct targets. |
| 6.2 relative cup/connecting sign | Degree p=1, interval boundary adapter | δ(i*a∪b)=−a∪δb while δ(b∪i*a)=δb∪a; for p=0 the first multiplier is +1. | Pass sign values; retain excisive triads. |
| 6.2 LSCategoricalCover | Empty set; point; two isolated points | Cover sizes 0,1,2; no categorical open can contract across the two discrete components. | Pass. |
| 6.2 lsCategoryCount | Empty, point, circle | Infimum attained at 0,1,2 respectively; no finite-cover hypothesis forces a finite value for arbitrary spaces. | Pass. |
| 6.2 LSPositiveCupProduct | Point and torus | Point has no positive-degree nonzero factor; torus a∪b has degree 2 and length 2, evaluation 1. | Pass; excludes degree-zero units. |
| 6.2 lsCupLength | Point; S¹; T²; zero ring | Values 0,1,2,0; unit in degree 0 does not yield infinite length. | Pass. |
| 6.2 LS bound headline | Nonempty point, S¹,T² | Bounds 1≤1,2≤2,3≤3. Empty space would demand 1≤0, explaining `[Nonempty X]`. | Pass. |
| 6.2 category monotonicity/union | Two separate points in a discrete two-point space | Each singleton count 1, union count 2≤1+1; empty subset count 0≤1. | Pass. |
| 6.2 category deformation/invariance | I contracted to one point | Category counts both 1, inequality 1≤1; changing to empty B cannot satisfy image inclusion. | Pass. |
| 6.2 normalized category/coproduct | Point; disjoint union of two circles | Normalized point value 0; unnormalized coproduct count 2+2=4. A single globally categorical component-spanning open is impossible. | Pass. |
| 6.2 local contractibility→finite cover | Compact interval | Ambient contractions give a single categorical cover, count 1<∞. | Pass; no intrinsic-contractibility upgrade used. |
| 6.2 point chain contraction | Unnormalized singular point complex over R | d₁=0,d₂=id,d₃=0; H₀=R, positive H=0. Hom gives the same cohomology over arbitrary R. | Pass; hereditary UCT not needed. |
| 6.2 compact/cofinite supports | ℝ with integer vertices; compact [0,1] | Take B=(−∞,−1]∪[2,∞); [0,1]⊂ℝ∖B=(−1,2)⊂[−1,2]. B is cofinite; coefficient support stays finite. | Pass instance. |
| 6.2 supported cellular differential | Oriented line, vertex coefficient 1 at 0 | Coboundary has coefficients +1 on incoming edge and −1 on outgoing edge; only 2 edges, equal to singular supported class boundary. | Pass local finiteness. |
| 6.2 proper pullback | Translation x↦x+1 on ℝ | Support [0,1] pulls back to [−1,0]; finite cell supports remain finite. Constant map would pull back a point-support neighborhood to all ℝ. | Pass properness distinction. |
| 6.3 orientation fibre | ℝᵐ at 0, m=0,1,2 | Local H_m=ℤ; ordered simplex edge matrix I+J has determinant m+1=1,2,3, always positive. | Pass. |
| 6.3 boundary versus interior | [0,∞) at 0 | Ordinary local H₁([0,∞),(0,∞))=0, but ambient orientation fibre ℤ. | Pass; boundary fibre not misdefined. |
| 6.3 recharting/interior inclusion | Half-line interior (0,∞); identity linear equivalence | Carrier inclusion derivative 1; pulled-back orientation +1, equal to original on interior. Dimension-zero model is a singleton. | Pass. |
| 6.3 inverse linear reparameterization | e:ℝ→ℝ, e(x)=2x | Recharted inclusion derivative e⁻¹=1/2, not 2; determinant sign is +1 either way. | Pass specified derivative. |
| 6.3 orientation transport | Möbius central loop | Fibre monodromy −1; transport-compatible generator section impossible since z=−z forces z=0 in ℤ. | Pass. |
| 6.3 orientation-square pairing | Generators o and −o | o⊗o↦1 and (−o)⊗(−o)↦1; a single sign reversal sends paired value to −1. | Pass. |
| 6.3 local coefficient comparison | Ball, constant L=ℤ/2; L=ℤ | L⊗or≅L gives 1⊗[ball]↦1; integral coefficient 1 leaves [ball] unchanged. | Pass; sign and nonfree fibres retained. |
| 6.3 restriction/scalar change | Nested balls; ℤ→F₃ | Positive local class maps to +1 on each ball; reducing coefficient 2 gives 2 on both routes. | Pass. |
| 6.3 ball-local sections | Connected interval; two disjoint intervals | Compatible sections are one constant integer, respectively ℤ²; arbitrary jumping function on one interval fails locality. | Pass. |
| 6.3 compact-support lemma | K=∅; K={0}⊂ℝ; two points | H₁(ℝ,ℝ∖K)=0,ℤ,ℤ² respectively; local-image maps 0,identity,identity; H₂=0. | Pass finite examples. |
| 6.3 smooth orientation equivalence | Connected oriented interval | Generator sections +1 and −1 give exactly two orientations; zero section is not a generator and is excluded. | Pass. |
| 6.3 determinant action | diag(−1,1); diag(2,3); 0-dimensional identity | Local multipliers −1,+1,+1, matching determinant signs −1,+1,+1. | Pass. |
| 6.3 derivative-to-map homotopy | f(x)=2x+x² near 0 | H_s(y)=2y+sy², H₀(y)=2y; for 0<‖y‖<1, coefficient 2+sy>1 so image is nonzero. | Pass; displayed denominator has a separate s=0 branch. |
| 6.3 chart/model sign independence | Reverse model orientation and chart lift together | Product (+1)(+1)=1 changes to (−1)(−1)=1; reversing just the orientation changes class to −1. | Pass. |
| 6.3 compact fundamental class | Circle; two circles; noncompact line | H₁=ℤ,ℤ²,0 respectively; connected compact top-class conclusion does not extend to the other cases as one ℤ. | Pass. |
| 6.3 twisted fundamental class | RP² | H₂(RP²;or)=ℤ but H₂(RP²;ℤ)=0; mod 2 the twist becomes trivial and H₂=F₂. | Pass. |
| 6.3 boundary sign | Positive I; positive oriented disk | ∂[I]=[1]−[0]; disk boundary counterclockwise has winding +1. | Pass. |
| 6.3 sphere/zero-sphere comparison | Boundary of positive interval | Boundary [q]−[−q] equals early s₀ and is −1 times the later based generator [−q]−[q]. | Pass cross-layer sign. |
| 6.3 product boundary | I×I | ∂(I×I)=∂I×I−I×∂I; right−left−top+bottom on both routes. | Pass. |
| 6.3 gluing boundary classes | [0,1] glued to [1,2] | Boundaries [1]−[0]+[2]−[1]=[2]−[0]; internal boundary cancels. | Pass. |
| 6.4 closed duality headline | Point; S¹ over F₂ | At n=0 cap with 1 is R→R identity; S¹ swaps H⁰,H¹ with H₁,H₀, each F₂→F₂ multiplication by 1. | Pass. |
| 6.4 2=0 versus 2-torsion | RP² over F₂; ring ℤ/4 | Mod 2 all three groups F₂ and duality holds; in ℤ/4, 2≠0, so the Lean headline excludes this ring. | Pass hypothesis scope. |
| 6.4 boundary duality | (I,∂I), ℤ | H⁰(I)=ℤ≅H₁(I,∂I); H¹(I,∂I)=ℤ≅H₀(I); H¹(I)=H₀(I,∂I)=0. | Pass. |
| 6.4 noncompact support | ℝ | H_c¹=ℤ≅H₀; H_c⁰=0≅H₁. Ordinary H¹=0 would give the wrong left side. | Pass. |
| 6.4 twisted duality | RP² with L=ℤ | H⁰=ℤ≅H₂(or); H²=ℤ/2≅H₀(or); H¹=H₁(or)=0. | Pass. |
| 6.5 degree/intersection | S² identity, antipodal; oriented T² | Degrees +1,−1; torus intersection matrix on a,b is [[0,1],[−1,0]]. | Pass. |
| 6.5 torsion linking | RP³, generator | Pairing 1/2 mod ℤ gives nonzero character ℤ/2→ℚ/ℤ; zero pairing has kernel ℤ/2. | Pass; locator R06. |
| 6.5 lens discrimination | L(5,1),L(5,2) | Self-linking coefficients up to squares/orientation lie in {1,4}/5 and {2,3}/5, disjoint. Both H₁=ℤ/5. | Pass. |
| 6.5 symmetry | (n,i)=(3,1),(5,2) | Exponents 4 and 9 give +1,−1. Wu self-link 1/2 equals −1/2 in ℚ/ℤ; 1/5 does not equal −1/5. | Pass. |
| 7.1 finiteCWEulerCharacteristic | Empty, point, circle, S² | Native alternating counts 0,1,0,2. | Pass definition. |
| 7.2 homotopy-invariance headline | Interval and point | Interval count 2−1=1 equals point count 1. | Pass. |
| 7.2 product headline | S²×S²; S¹×S¹ | Counts 1+2+1=4=2·2; 1−2+1=0=0·0. | Pass. |
| 7.3 cover headline | Two points→point; d-fold circle; empty cover | χ values 2=2·1, 0=d·0, 0=0·χ(B). | Pass includes d=0. |
| 7.4 standard values | RP²,RP³,CP²,genus-2 surface | Alternating counts 1,0,3,−2; CP² n+1=3, surface 2−2g=−2. | Pass. |
| 8.1 based-pair carrier | (I,{0},0); (I,∅) | First has one chosen subspace point; second has 0 possible basepoints. | Pass; no invented point. |
| 8.1 relative groups/LES | (D²,S¹), (X,X), (ℝ,(0,1)) | π₂(D²,S¹)=ℤ, π₁(D²,S¹)=*; diagonal relative groups 0; nonclosed contractible pair has relative groups 0. | Last must be admitted: R05. |
| 8.1 cell-dimension range | (RP²,RP¹), λ=2 | Relative π₁=*; π₁ inclusion ℤ→ℤ/2 is surjective, kernel 2ℤ≠0. | Pass endpoint distinction. |
| 8.1 transported connectivity | Identity commuting square on preceding pair | Induced π₀ maps are bijections and π₁ surjection is still reduction mod 2, with same kernel. | Pass; actual square required. |
| 8.1 Kelley product homotopy | S¹×S¹, q=0,1 | One component; π₁=ℤ², projections (m,n)↦m,n; counit acts identically. | Pass. |
| 8.2 Kan/cubical normalization | Oriented simplicial circle | Positive edge maps to winding +1 and Hurewicz +1; reverse orientation gives −1. | Pass abelian test. |
| 8.2 nonabelian nerve | S₃, g=(12),h=(23) | Native d₁=hg=(132); README says gh=(123). On label 1 these send to 3 and 2 respectively. | Fail; R01. |
| 8.2 simplicial-group Moore | Constant S₃ | Nₙ=1 for n≥1, π₀=S₃ of order 6, positive π=0; abelianization would have order 2. | Pass. |
| 8.2 simplicial abelian Moore | Free simplicial abelian circle | N₀=ℤ,N₁=ℤ,d=0,N₂=0; H₀=H₁=ℤ. Unnormalized ranks 1,2,3 give same homology. | Pass. |
| 8.2 realization unit | Constant simplicial point; simplicial circle after Kan replacement | Components map 1→1; circle π₁ generator maps +1→+1. | Pass instance. |
| 8.3 Hurewicz definition/naturality | S¹ degree k; map of degree 2 | h(k)=k; composite image 2k equals degree-2 homology map applied to k. | Pass. |
| 8.3 degree-one abelianization | Wedge S¹∨S¹ | a^m b^n↦(m,n); commutator↦(0,0), although commutator≠1 in F₂. | Pass. |
| 8.3 absolute Hurewicz | S² and antipodal map | π₂=H₂=ℤ; identity→+1, antipodal→−1; reduced H₀,H₁ both 0. | Pass. |
| 8.4 relative Hurewicz | (D³,S²), n=3; (ℝ,(0,1)), n=2 | First π₃=H₃=ℤ and lower relative groups 0; second map 0→0 is an isomorphism. | Pass mathematics; restore second domain via R05. |
| 8.5 CWTypeModel | Point, circle, contractible interval | Actual models have homology ranks 1; (1,1); 1, with homotopy equivalence to original. A carrier alone gives no such equivalence. | Pass. |
| 8.5 ordinaryWhitehead | Identity S²; degree-2 map S¹ | Identity induces id on every group; degree-2 π₁ map ℤ→ℤ misses 1 and fails hypotheses. | Pass. |
| 8.5 components clause | Empty→point | All based positive tests on source are vacuous, but π₀ map ∅→{*} is not surjective. | Pass; prevents false empty equivalence. |
| 8.5 ordinaryWhitehead_cwType | Projection I→point with point models | Components 1→1, higher groups 0→0; constant section and contraction provide the required equivalence with forward map fixed. | Pass. |
| 8.5 homologicalWhitehead | Identity S²; degree-1 map from Poincaré homology sphere to S³ | Identity homology maps id; second also homology isomorphism but π₁ has order 120 versus 1, violating simple connectivity. | Pass negative control. |
| 8.5 homologicalWhitehead_cwType | I→point | H₀=ℤ→ℤ identity, positive H=0; actual map is the homotopy equivalence's forward map. | Pass. |
| 8.5 proper inverse definition | idℝ; ℝ→point | id has proper inverse and identity cylinder homotopy; constant map preimage of compact point is noncompact ℝ. | Pass. |
| 8.5 joint properness | H(t,x)=x−tx² on [0,1]×ℝ | Each slice is proper; H(1/n,n)=0 and n→∞, so joint zero-fibre is noncompact. | Pass negative control; slicewise condition insufficient. |
| 8.5 proper HEP definition | A=X; A=∅, proper f | For A=X choose K=H; for A=∅ choose K(t,x)=f(x), inverse image of compact C is I×f⁻¹C, compact. | Pass. |
| 8.5 proper rectification headline | X=ℝ×I, A=ℝ×{0} | r(x,t)=(x,0), r∘incl=id; H(s,(x,t))=(x,(1−s)t), fixing A and proper over compact subsets. | Pass noncompact example. |
| 8.5 proper Whitehead hypotheses | Identity ray; identity line | Ray has one end, line two; identity induces id on ordinary H₀=ℤ and on compact-support groups. Simply-connected-at-infinity condition is checked separately, not inferred from end count. | Pass instances. |
| 8.6 sphere quotient sign | n=0; n=1 positive loop | Nonbasepoint is −p; interval traversal gives winding +1. Reflection changes winding to −1. | Pass with §4.4. |
| 8.7 FiniteCWTypeModel | Point and interval | Finite models with cell counts 1 and (2,1); actual equivalences retained. Infinite discrete ℕ is not a finite CW type (H₀ infinite rank). | Pass. |
| 8.7 compact manifold headline | Point n=0; closed S¹ | Finite models have χ=1 and 0; both satisfy Hausdorff/compact/second-countable binders. | Pass. |
| 8.7 boundary-manifold headline | I, dimension 1 | Finite model 2 vertices+1 edge; χ=1. n=0 half-space is excluded by NeZero. | Pass. |
| 8.7 boundary-pair/marked models | (I,∂I), marked endpoint | Relative H₁=ℤ, marked point retained as 0-cell; unmarked point-model equivalence alone would lose the pair data. | Pass; docstring correctly distinguishes missing carrier. |
| 8.7 noncompact models | ℝ triangulated by integer intervals | Countably many cells, each point meets finitely many; finite subcomplexes cannot cover ℝ. | Pass local-finiteness distinction. |
| 8.7 homology-sphere headline | S²; Poincaré 3-sphere | S² has H₂=ℤ, other positive H=0 and π₁=1; Poincaré example has π₁ order 120 and is excluded. | Pass. |
| 8.8 groupClassifyingSpace/basepoint | G=1,ℤ,S₃ | Native nerve has 1 vertex in each case; intended π₁ groups 1,ℤ,S₃, positive higher π=0. Basepoint is that vertex. | Pass instances. |
| 8.8 EMOne headline | G=S₃ versus its abelianization | Required π₁ has 6 elements, not 2; simple connectedness would incorrectly force 1. | Pass signature, R01 local convention. |
| 8.8 edge composition/model comparison | g then h in native SingleObj nerve | Middle face hg; edge normalization sends g to g, and multiplication p*q traverses q then p. | Pass §8.8; reconcile §8.2. |
| 8.9 obstruction cocycle | Extend degree-k S¹→S¹ across D² | Obstruction in π₁(S¹)=ℤ is k; extension iff k=0. | Pass. |
| 8.9 difference class | Two boundary loops degrees k,l | Difference k−l; k=l gives 0, degrees 1 and 0 give 1. | Pass relative normalization. |
| 8.9 connectivity/coefficients | Target S²; target S¹ with nontrivial action data | π₁(S²)=0 removes first obstruction; for S¹ a degree-one loop retains obstruction 1. | Pass; coefficients/monodromy not discarded. |
| 8.10 representability | Point n=0; two circles n=1 | H⁰(*;A)=A and maps to discrete K(A,0) give A; H¹(S¹∨S¹;ℤ)=ℤ² and maps to K(ℤ,1) have two integer windings. | Pass. |
| 8.10 universal-class normalization | K(ℤ,1), positive circle | Pullback evaluation 1; composing degree k gives k, not −k. | Pass. |
| 8.10 empty/relative | ∅; (X,X) | Mapping-class sets have one element, cohomology group 0; relative maps fixed everywhere are constant class. | Pass. |
| 8.11 mapping-space headline | X=*,Y=S²; X=∅,Y=∅ | C(*,S²)=S²,H₂=ℤ; C(∅,∅)=*,H₀=ℤ. | Pass. |
| 8.11 relative mapping-space CW type | Based maps S¹→S¹ | Components indexed by ℤ; based constant map lies in 0 and degree-one map in 1. | Pass. |
| 8.11 weak/metric realization | Δ⁰,Δ¹; countable wedge of edges | Vertex distance 2 in ℓ¹ realization; on edge j choose distance 1/j from common vertex: converges metrically, but not in weak topology with radius 1/(2j) on edge j. | Pass examples; add Checks R07. |
| 8.11 metric ANR/ANE | ℝ; S¹⊂annulus; Cantor set | Retractions (x,y)↦x and z↦z/‖z‖ restrict to identity; Cantor has no locally contractible neighborhoods, hence no metric ANR. | Add these distinguishing controls, R07. |
| 8.11 convex embedding/extension | Two points at distance 1; interval-valued endpoint data | Embed as 0,1 in ℝ with convex hull [0,1]; values 0,1 extend by t↦t. No completeness hypothesis is used. | Pass. |
| 8.11 local diagonal homotopy | S¹ with nearby pairs | If x≠−y, normalized straight segment joins x to y; diagonal x=y is constant. Antipodal midpoint would be 0 and is excluded. | Pass; no global uniform contraction asserted. |
| 8.11 ANR products/open subsets | ℝ²; open annulus | ℝ² contractible with coordinatewise extension; annulus retracts to S¹, so H₁=ℤ rather than 0. | Pass; ANR does not mean contractible. |
| 8.11 domination/telescope | Point; I; proposed constant domination of S¹ | Identity composite=1; interval constant composite homotopic to id; circle constant composite gives 0 on H₁ versus identity 1. | Add Check excluding last, R07. |
| 8.11 k preserves homotopies | I and constant contraction | kI=I and cylinder comparison fixes (x,t); endpoint maps remain id and constant. | Pass instance; foundation ownership R03. |
| 8.11 EM-loop comparison | n=0,A=ℤ; A=0 | ΩK(ℤ,1) components ℤ, constant loop 0; zero coefficient EM family contractible, components singleton. | Pass. |
| 8.11 cone suspension degree zero | B=two points, cochain (0,1); B=point | Difference class on suspension circle evaluates 1; constant class on point maps to 0 in H¹(interval)=0. | Pass. |
| 8.11 added-point suspension | B=point; B=∅ | Σ(B₊)=S¹ with H̃¹=ℤ for point; empty B gives Σ(*)=*, while unreduced two-apex space is S⁰. | Pass; ordinary and reduced conventions differ. |
| 8.11 reflected/interval-first sign | n=0 and n=1 | Reflection times coordinate move gives degrees (−1)^(n+1)=−1,+1. | Pass. |
| 8.11 pair/mapping-cone adapter | (I,∂I), endpoint cochain 1 at endpoint 1 | Pair boundary evaluates +1; right-cone collapse orientation is −1, and factor (−1)^(0+1) restores +1. | Pass. |
| 8.11 cross-product suspension | q=1 versus q=2 | Moving last interval past b gives multipliers −1 and +1; keeping order (X,Y,I) gives multiplier +1. | Pass; no cup-ring preservation asserted. |
| 8.12 classical EM models | RP∞,CP∞; finite RP¹,CP¹ | π₁(RP∞)=ℤ/2,π₂(CP∞)=ℤ; finite RP¹ has π₁=ℤ, finite CP¹ has π₃=ℤ. | Pass distinction. |
| 8.12 generator/coefficient change | CP¹, complex and conjugate orientations; ℤ→ℤ/2 | h evaluates +1 and −1; both reduce to 1 mod 2. | Pass. |
| 8.12 circle normalization | AddCircle period 1, t mod ℤ | Endpoint 1=0 mod ℤ; loop winds +1, constant loop 0. | Pass. |

## Not verifiable

The review is finished. These texts were not used as checked theorem evidence; no source manifest was edited.

- **eilenberg-steenrod**, Chapters I–III: De Gruyter DOI landing page only; ordinary pair assertions independently checked in Hatcher and the pins.
- **whitehead**, Chapters II–VII: bibliographic lookup found no legal readable full text. Hatcher supports the sampled relative/cellular results.
- **may**, simplicial/Kan comparison: no legal full text resolved; chapter locators remain unchecked.
- **mccleary**, Chapters 1–2: Cambridge landing page only; sampled cover-descent locator uncertified and imprecise.
- **weibel**, Chapters 3 and 5: Cambridge landing page only; general coefficient/UCT statements not source-certified.
- **brown-cohomology**, Chapter VII: no legal full text resolved; Cartan–Leray locators unchecked.
- **dold**, Chapters VII–VIII: service returned **uncertified** publisher source. This settled paywalled item was not added to missing requests; linking/local-coefficient claims remain uncertified.
- **freedman-quinn**, §7.7: no legal readable text resolved. Reading Farrell–Taylor–Wagoner does not verify all other end-theoretic claims.
- **strom**, cofibration products: DOI lookup and publisher download URLs returned no readable text.

The missing-reference list removes subsequently fetched Brown, Serre and Milnor texts. No source text was copied into the worktree or report. Serre and Hatcher's vector-bundle PDFs were fetched; their full developments were not source-certified. Ownership conclusions use main, pins and supplied readable heads.

## Source issues

- **Misprint** in milnor-cw at proof of Theorem 2, concluding paragraph, printed page 276: the source says the weak/strong realization comparison completes Theorem 3; it should be Theorem 2; affects the proof.
- **Misprint** in milnor-cw at proof of Corollary 3, printed page 276: the source says Theorem 4 supplies the mapping-space triad; it should be Theorem 3; affects the proof.
