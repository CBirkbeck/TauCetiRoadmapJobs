<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1482#issuecomment-6395365584 -->
Review (codex) of fc307b1

Verdict: needs_changes

1. **F01** (P1) The general residue-field prerequisite has no owner

   **Location:** `packages/DiamondsAndVStacksPartII/design/plan.json:5827`, slug `completed-residue-fields-general-universal-homeomorphisms`; `packages/DiamondsAndVStacksPartII/README.md:36` and D7.1–D7.3. The plan says “The general assertion for arbitrary analytic pre-adic spaces … needs an argument”.

   **Claim:** The finite result and the residue-preserving result leave the general universal-homeomorphism assertion outside the owned programme. This declared gap has no supplier, section or `needs` field and no matching exact-contract paragraph. Under the review contract, an ownerless gap is blocking even when acknowledged honestly.

   **Witness:** SW20 line 3113 asserts the general characteristic-zero assertion. The plan has only `slug`, `title`, `neededBy`, `detail`; the README contains zero occurrences of this slug. A degree-two unramified field extension has one ordinary point but two geometric points.

   **Repair and test:** Own the general residue-preservation theorem explicitly in D7, including its field-extension separation prerequisite, and connect D7.3 to it; alternatively move that prerequisite to a named earlier owner with a precise matching gap contract. Preserve the finite theorem as an intermediate result. The required separation assertion must give two points after geometric base change for an unramified quadratic extension, and one for the identity; an ordinary homeomorphism alone must not pass. Do not erase the gap by permanently restricting the headline to finite maps.

2. **F02** (P1) The unrestricted component theorem has no owner

   **Location:** `packages/DiamondsAndVStacksPartII/design/plan.json:5835`, slug `closed-specializations-unrestricted-components`; `packages/DiamondsAndVStacksPartII/README.md:1564`. The plan says “Derive that condition from the other kimberlite axioms, or supply a proof in their absence”.

   **Claim:** D11.14 correctly states a conditional theorem, but the missing general result is an ownerless research obligation, absent from the exact contracts. It is not a declared, named supplier contract eligible for conditional acceptance.

   **Witness:** GLE line 1885 uses a common closed specialization. The plan has no supplier for this gap. In the ascending prime chain described in the plan, after deleting its maximal limit, the number of closed points is zero.

   **Repair and test:** Give the unrestricted component theorem an explicit owner and target in D11, retaining the present conditional theorem as an intermediate result. Its route must use the other kimberlite axioms, or prove the requisite closed-specialization consequence from them. Do not replace this with a false theorem about arbitrary locally noetherian topological spaces. On the punctured ascending-chain example the closed-specialization predicate must evaluate to false. This example refutes the topological inference, not the kimberlite theorem; the latter remains unverified at unrestricted generality.

3. **F03** (P1) Arc descent is cited as supplied without an eligible supplier text

   **Location:** `packages/DiamondsAndVStacksPartII/README.md:56`, especially line 58: “§1.7 supplies universal subtrusiveness … §7.8 supplies representable arc-descent”. Also D7.10, D7.6, D8.1 and D8.2.

   **Claim:** Several essential proof inputs are presented as supplied by `ArcTopologyAndDescent` rather than registered as gaps.

   **Witness:** `roadmaps grep` reports no match on main or at any open roadmap head. The package index has no such package. `packages/ArcTopologyAndDescent/design/README.md:219` contains design material, but there is no supplying package README in this checkout.

   **Repair and test:** Register precise named contracts, with matching plan and README slugs, for the consumed §1.2/§1.5/§1.7/§3.10/§7.8 statements, naming `ArcTopologyAndDescent` and its intended sections; cite them as contracts until an eligible supplying roadmap exists. Keep arbitrary-rank valuations and unrestricted perfect schemes. The cover contract must distinguish a v-cover from a merely surjective scheme map and give empty-cover truth values false for `Spec F_p`, true for the empty scheme. The design's existence and its position at line 119 of `merge-order/ORDER.txt` were both checked; neither establishes supplied mathematics.

4. **F04** (P1) A perfect field does not give the terminal v-sheaf

   **Location:** `packages/DiamondsAndVStacksPartII/README.md:1077`: “Spec(k)^⋄ = \* for a perfect field k”; repeated at line 1172: “both being Spd k = \*”.

   **Claim:** The maximal-diamond-open proof and the nilpotent example identify every perfect field's formal diamondification with the terminal object.

   **Witness:** Take `k = F_(p²)` and an algebraically closed perfectoid field C of characteristic p. `Hom(k,O_C)` has two embeddings; the terminal sheaf has one section. This works for p = 2 and p = 3.

   **Repair and test:** Replace the proof's equality by the fact that `Spd(k)` has nonempty reduction and is not a diamond, using D8.6–D8.7 and quasiseparatedness of this affine v-sheaf. Use the point's monomorphism, not an unjustified closed immersion for an arbitrary nonclosed point. Delete `= *` in the nilpotent example. Add the finite quadratic field check: two sections on C on both sides of the nilpotent-invariance comparison, versus one section for `Spd(F_p)`.

5. **F05** (P2) The empty diamond contradicts the formalization sentence

   **Location:** `packages/DiamondsAndVStacksPartII/README.md:667`: “so quasiseparated diamonds are not v-formalizing”.

   **Claim:** This universal exclusion drops the nonemptiness used in the immediately preceding implication.

   **Witness:** The empty sheaf is a quasiseparated diamond and is v-formalizing: its empty formal presentation covers it. The package itself records this at line 684. Both its reduction and its point set have cardinality zero.

   **Repair and test:** Say “nonempty quasiseparated diamonds are not v-formalizing”. Keep the existing empty check and explicitly contrast it with `Spd(Q_p)`: respectively v-formalizing = true and false, with empty reduction in both cases. GLE Proposition 4.8(4) has the same omitted exception; copying that exception is not justified by the locator.

6. **F06** (P2) The bounded-function headline already has an earlier owner

   **Location:** `packages/DiamondsAndVStacksPartII/README.md:1044`, D10.4; `packages/DiamondsAndVStacksPartII/Suggested.lean:24`.

   **Claim:** D10.4 proposes to prove de Jong's global recovery theorem as its own theorem.

   **Witness:** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:4073`, R07.2.27, `deJongBoundedFormalFunctions`, already states the same theorem for flat formally normal objects of `FS_O`, with restriction compatibility. Its new-roadmap head is `34f4657`.

   **Repair and test:** Delete the duplicate global target and import that named theorem in Scope, Exact supplier contracts and the consuming Needs lines. Retain a separately named local connectedness target if no earlier owner supplies it; it is needed by D11.15. Update the headline account accordingly. The earlier theorem covers both `O[[q]]` on the open disc and `O⟨T⟩` on the closed disc, and excludes `O⟨πt,t²⟩`, whose missing bounded function is t. Thus no new generality distinguishes the duplicated claim. Its supplier also records the published de Jong erratum; use the corrected supplier route.

7. **F07** (P2) Nonnoetherian formal pairs are used but their general theorem is omitted

   **Location:** `packages/DiamondsAndVStacksPartII/README.md:797`, D9.7, and line 1343, D11.4: “separated locally noetherian formal scheme”; compare D11.17 at line 1628.

   **Claim:** The formal-scheme prekimberlite, valuativity and kimberlite statements are restricted to locally noetherian objects, although the source supplies finitely generated ideals of definition and the final layer needs nonnoetherian integral perfectoid rings.

   **Witness:** GLE line 1504, Convention 1, and lines 1516 and 1683 cover formal Huber pairs with finitely generated defining ideals. `O_C`, for C a completed algebraic closure of Q_p, is p-adically complete with defining ideal `(p)` and is nonnoetherian.

   **Repair and test:** Add the general formal-pair statements, with the source's precise hypotheses, before D11.17, and route that proof through them. Obtain any missing formal-space carrier through a named supplier contract; keep the noetherian comparison as a specialization. For `O_C`, the resulting reduction is its perfect residue field, the analytic part is `Spd(C,O_C)`, and the specialization is the one-point map. This tests a required input that the present noetherian statements cannot instantiate.

8. **F08** (P2) The open comparison unnecessarily loses local finite type

   **Location:** `packages/DiamondsAndVStacksPartII/README.md:982` and line 995: “an open immersion for X separated of finite type”.

   **Claim:** D10.1 retains only the finite-type version of the comparison of its two scheme functors.

   **Witness:** AGLR, paragraph following Lemma 2.11, line 632, gives the open comparison for separated locally finite-type schemes. The disjoint union of infinitely many copies of `Spec O` is separated and locally finite type but not finite type.

   **Repair and test:** Replace “finite type” by “locally of finite type” in both occurrences. On the infinite disjoint union the comparison is the disjoint union of identity maps of `Spd O`, hence an open immersion; no quasicompactness is available or needed. Retain finite type only where a separate assertion actually needs it.

9. **F09** (P2) Three supplier gaps combine distinct, partly unspecified theorems

   **Location:** `packages/DiamondsAndVStacksPartII/README.md:66`, 74 and 76, and the corresponding entries of `packages/DiamondsAndVStacksPartII/design/plan.json`.

   **Claim:** The weak-normality gap combines a normalization criterion with a geometric-fibre Jacobson theorem; the residue gap combines finite-map residue theory with an arbitrary analytic stalk comparison; the pseudorigid gap combines Jacobson theory with unspecified “noetherian-type” flat localization.

   **Witness:** The first halves have different hypotheses and consumers from the second halves: D11.20 versus its finite-type special-fibre step; D7.1 versus D7.2; and LOU17 Proposition 4.6 versus flat rational localization. The phrase “noetherian-type” has no definition here.

   **Repair and test:** Split these into single-result contracts, retaining the existing slugs for one result and adding new slugs for the others, in both plan and README. State the finite-map, residue-characteristic, n ≥ 1, Tate/completeness and noetherian-ring-of-definition hypotheses explicitly. Reuse the existing strongly noetherian Tate localization theorem where it applies, and request only its missing extension. The stalk contract must yield `Z_p/p²` for the Q_p point; the finite residue contract must allow degree-two extensions; the geometric-fibre criterion must reject the separable quadratic residue extension. Name the appropriate contract at each consumer. The completed-étale-lift contract is not rejected merely because its single lifting equivalence includes localization and gluing compatibility.

10. **F10** (P1) The stated consumer creates a reverse supply edge

   **Location:** `packages/DiamondsAndVStacksPartII/README.md:1728`: “GeometricSatakeAndFusion uses D8–D11”; compare its supplier contract at line 96 and D10.15 at line 1238.

   **Claim:** The prose makes the same roadmap both an earlier supplier of integral Grassmannians and a consumer of this package's later kimberlite theory.

   **Witness:** `merge-order/ORDER.txt:147` places `GeometricSatakeAndFusion` before this roadmap at line 149. The actual later application is in `packages/GeometricSatakeAndFusionPartII/design/README.md:523`, whose local-model kimberlite target consumes D11.

   **Repair and test:** Attribute the downstream integral-model and connected-tube applications to `GeometricSatakeAndFusionPartII`, preserving `GeometricSatakeAndFusion` as the supplier. Update both Scope and Downstream consumers. The resulting direction is base GS0 → this D7–D11 → GS Part II LM.3. The mechanical checker currently reports no cycle because it does not turn this downstream prose into a consumed Needs edge; that does not make the declared two-way supply valid.

11. **F11** (P3) Supplier section names do not match the resolved texts

   **Location:** `packages/DiamondsAndVStacksPartII/README.md:15`, 84, 88 and 96.

   **Claim:** The objects exist, but several exact-contract locators name the wrong section or title.

   **Witness:** GS0's local models are in “Bounded admissible affine flag loci”, `TauCetiRoadmap/GeometricSatakeAndFusion/README.md:946`; C4.16 is “Images of proper maps in separated targets”, `TauCetiRoadmap/DiamondEtaleCohomology/README.md:1408`; perfectoid rational localization is P2.3, not P3.

   **Repair and test:** Replace the absent GS0 title “Integral local models and functoriality” by the actual target; correct the C4.16 title and route rational localization to `PerfectoidSpaces` P2.3. These are locator repairs rather than missing-object findings: the local-model morphism is explicitly present at GS0 line 954, the proper-image statement at C4.16 line 1410, and rational localization at P2.3 line 6235. Re-resolve those exact citations after editing.

12. **F12** (P3) Make the Tate plus-ring normalization explicit

   **Location:** `packages/DiamondsAndVStacksPartII/README.md:1628`: `Spd(B[1/π], B)` for arbitrary π-adically complete flat B, with integral closedness imposed only on A.

   **Claim:** This notation is harmless only with the customary convention of replacing B by its integral closure in `B[1/π]`; the stated conventions specify that replacement for quotient pairs but not here.

   **Witness:** Set `B = O⟨X,Y⟩/(Y²−π²X)`. Then `z=Y/π` satisfies `z²=X` and is outside B. Thus B is not an integrally closed plus ring, although the Tate spectrum with its bounds is meaningful.

   **Repair and test:** Define `B⁺` as that integral closure and write `Spd(B[1/π],B⁺)`, or declare this normalization convention explicitly. Do not restrict B to normal rings. The witness then has `B⁺=O⟨z⟩`; boundedness on B already forces `|z|²=|X|≤1`, so the point conditions are unchanged. This is a notation/interface defect, not a counterexample to AGLR's cover theorem.

13. **F13** (P1) The analytic scheme supplier stops at locally finite type

   **Location:** `packages/DiamondsAndVStacksPartII/README.md:982`: “Use the analytic functor … of AdicCoefficientsAndComparisons L1/mixed-characteristic-scheme-diamond”; the construction then ranges over O-schemes without a finiteness restriction.

   **Claim:** The general analytic functor is treated as supplied, although the cited supplier only constructs its locally finite-type restriction. The general formal/analytic comparison therefore uses an unowned extension.

   **Witness:** `TauCetiRoadmap/AdicCoefficientsAndComparisons/README.md:885` explicitly assumes X locally of finite type over O; its constructor at line 909 has the same domain. `Spec O[T₁,T₂,…]` is outside that domain.

   **Repair and test:** Own the extension to arbitrary O-schemes in D10.1, using marked untilts, the parent's pre-adic diamondification and gluing; state compatibility with the existing L1 functor on its actual domain. Alternatively register that exact extension as a named supplier gap. Do not narrow the two functors below AGLR Definition 2.10. On the infinite affine space, the extended analytic and formal section sets must respectively be sequences in R♯ and R♯⁺: `(ϖ⁻¹,0,…)` belongs only to the former, while `(ϖ,0,…)` belongs to both. Finite-coordinate restrictions recover the supplied functor.

Thirteen findings: six P1, five P2 and two P3. The extension is repairable; it does not re-plan the whole parent roadmap. There was no preceding review. Mathematical counterexamples below were checked independently; no package mathematics was delegated.

## Verified sound

The complete README, Lean file, metadata, manifest, plan gap list and board package index were read. The 73 numbered statements comprise 32 theorem blocks, ten lemma blocks, nineteen definitions, eleven constructions and one application. All 73 Needs lines and all seven layer-ending dependency paragraphs were inspected. All thirty definition/construction blocks have an API and at least three Checks. The tables below record the mathematical instances, including subordinate API assertions, rather than treating elaboration as a truth test.

The roadmap is a genuine extension of DiamondsAndVStacks D6. Its distinction between formal `Hom(A,R⁺)` and analytic `Hom(A,R)`, use of arbitrary primes including 2 and 3, strict valuation inequality, perfect discrete sources, completed étale lifts, relative generic fibre of the formal disc, algebraically closed residue field in D11.20, and the additional hypothesis in D11.14 all survive the indicated tests. No computational algorithm, copied source passage, source instruction, sorry'd data, forbidden import or `set_option` was found. Main-branch shape comparisons used `TauCetiRoadmap/PerfectoidSpaces/README.md`, `TauCetiRoadmap/AdicSpacesPartIII/README.md` and `TauCetiRoadmap/SchemeAndStackFoundations/README.md`.

The pinned revisions inspected were Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The build used the existing content checkout and manifest, without updating either library.

The authorized dependency command completed successfully and printed:

```text
depcheck: 49 roadmaps, 563 edges, 0 problem(s)
```

There were no UPWARD or CYCLE lines. This certifies the parsed graph, not the prose edge in R10 or the availability of R03's supplier.

`lake env lean <absolute path of packages/DiamondsAndVStacksPartII/Suggested.lean>`, run from the content checkout, exited 0 with no warnings. No Tau Ceti import or build was needed. There are zero named declarations, zero sorried theorems and zero examples: the requested per-declaration `#check @name` audit and one-tactic padding probe each have zero instances. Nothing was proved in place or added to the acceptance test.

The docstring lists these headline groups and their missing carriers: D7.3, D7.6, D7.8, D7.10, D7.11; D8.3–D8.6; D9.7, D9.14; D10.2, D10.4, D10.10–D10.15; D11.6, D11.13–D11.15, D11.18 and D11.20. Every listed theorem involves a missing perfectoid site, small-v-sheaf category, formal-scheme/generic-fibre construction or kimberlite construction. Abstract sheaves on an already supplied site do not supply these carriers. No statable headline was found missing, and there is no Lean padding. R06 concerns ownership of a headline, not padding.

### Source verification

No author locator was flagged unverified. The seeded sample supplies only repeated labels (“Lemma”, “Theorem”, “Construction”, “Definition”), without identifying the selected occurrences. To avoid guessing its targets, every numbered block's principal locator was checked, and the cited proof steps and additional locators were read across all eight supplied texts. The source column in the statement table identifies the extracted passage; theorem/section numbers and printed pages were compared with the README. The source versions are those of the manifest, including GLE v4, AGLR v2, KPZ v3 and GLX v3. KPZ Lemma 3.4.1 is on v3 printed page 29; the README correctly distinguishes published page 28.

The source supports the corrected or explicitly conditional statements, subject to the findings and source errata below. In particular, the finite residue-field argument is a supplied proof obligation extending the source's assertion, not a proof found verbatim in SW20. D10.14's flat-closure argument is synthesized from generic density and closed-image/v-closure facts; KPZ supplies the local-model instance. D11.20 deliberately strengthens the residue-field hypothesis of the printed proposition and gives the necessary argument. None of these distinctions was hidden by a “certified” manifest status.

### Pinned declarations opened

Paths in this table are relative to the corresponding pinned library root. These are existing objects to import, not new targets.

| Declaration | File and line | Definition/hypothesis inspected; consequence |
|---|---|---|
| `AlgebraicGeometry.Scheme` | `Mathlib/AlgebraicGeometry/Scheme.lean:40` | Locally ringed space with local affine charts; it does not include separatedness or noetherianness. |
| `PrimeSpectrum` | `Mathlib/RingTheory/Spectrum/Prime/Defs.lean:34` | Ideal with primality; properness excludes a point of Spec 0. |
| `PrimeSpectrum.zeroLocus` | `Mathlib/RingTheory/Spectrum/Prime/Basic.lean:137` | Membership is containment of the specified set in the prime ideal. |
| `PerfectRing` | `Mathlib/FieldTheory/Perfect.lean:44` | Only bijectivity of the p-power map; characteristic and primality must be supplied separately. |
| `PerfectClosure` | `Mathlib/FieldTheory/PerfectClosure.lean:68` | Quotient of `(n,x)` by the Frobenius relation, with `[CommRing]`, `[Fact p.Prime]`, `[CharP]`; not inverse-limit perfection. |
| `Valuation` | `Mathlib/RingTheory/Valuation/Basic.lean:78` | Multiplicative zero-preserving map with the nonarchimedean inequality. |
| `Valuation.integer`, `ltIdeal`, `mem_ltIdeal_iff` | `Mathlib/RingTheory/Valuation/Integers.lean:32`, 386, 411 | The strict ideal lives on the integer subring; membership is `v(x)<γ`, not `≤γ`. |
| `ValuationSubring.valuation_lt_one_iff` | `Mathlib/RingTheory/Valuation/ValuationSubring.lean:212` | Maximal-ideal membership iff valuation strictly below one. |
| `IsIntegrallyClosed` | `Mathlib/RingTheory/IntegralClosure/IntegrallyClosed.lean:74` | Integral closedness in `FractionRing`; no domain field is bundled. |
| `CategoryTheory.Adjunction` | `Mathlib/CategoryTheory/Adjunction/Basic.lean:108` | Unit `id→F⋙G`, counit `G⋙F→id`; reduction is on the right. |
| `CategoryTheory.IsPullback` | `Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/Defs.lean:61` | Commutative square plus a limiting cone. |
| `PreservesLimitsOfShape` | `Mathlib/CategoryTheory/Limits/Preserves/Basic.lean:67` | Preservation of every limit of the specified diagram shape. |
| `constructibleTopology` | `Mathlib/Topology/Spectral/ConstructibleTopology.lean:42` | Generated by compact opens and their complements; no automatic compact Hausdorff hypothesis. |
| `IsSpectralMap` | `Mathlib/Topology/Spectral/Hom.lean:42` | Continuous and inverse images of compact opens compact. The README separately states its local convention. |
| `Specializes` | `Mathlib/Topology/Defs/Filter.lean:206` | `𝓝 x ≤ 𝓝 y`, hence the generic-to-special direction. |
| `Topology.IsQuotientMap` | `Mathlib/Topology/Defs/Induced.lean:166` | Coinducing and surjective; no separation axiom. |
| `ConnectedComponents` | `Mathlib/Topology/Connected/Clopen.lean:510` | Quotient by the connected-component setoid. |
| `PreconnectedSpace`, `IsClopen` | `Mathlib/Topology/Connected/Basic.lean:697`; `Mathlib/Topology/Defs/Basic.lean:111` | Preconnectedness does not assert nonemptiness; clopen means closed and open. |
| `TauCeti.ValuationSpectrum.spa` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean:101` | Continuous valuations bounded on the specified subring; set-level construction allows an arbitrary subring. |
| `TauCeti.ValuationSpectrum.IsAnalyticPoint` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Analytic.lean:72` | Support is not open. |
| `PreAdicSpace`, `SheafyPreAdicSpace` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Basic.lean:40`; `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Sheaf.lean:53` | Presheafed space, local stalks and residue valuations; latter restricts to sheafy objects. Neither constructs a perfectoid v-site. |
| `TauCeti.Huber.PairOfDefinition.flat_toCompletionLoc` | `TauCeti/RingTheory/Huber/LocalizationTopology/Laurent/Flat.lean:804` | Complete separated strongly noetherian Tate base; `HasDenominatorPower` and an away-localization presentation. Supplies the existing flat structure map, not every undefined “noetherian-type” case. |
| `CategoryTheory.Sheaf` | `Mathlib/CategoryTheory/Sites/Sheaf.lean:299` | Full subcategory of sheaves for a specified Grothendieck topology J; does not construct the perfectoid category or its v-topology. |

### Ownership and resolved cross-roadmap contracts

Object searches used both pinned libraries, the main roadmap tree, the supplied board checkout and `roadmaps grep` over main and open heads. Searches covered olivine spectra, reduction adjunctions, kimberlites, formalizations, v-closures, perfect schemes, absolute weak normalization, bounded functions, formal specialization triples and generic fibres. Search results were followed to the defining paragraphs; name-only matches were not treated as ownership evidence. No fully qualified declaration can collide with this acceptance test, since it declares none.

| Supplier and inspected revision | Resolved sections / repository-relative README lines | Resolution |
|---|---|---|
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1068` (§0.14), 1394 (§0.21), 1475 (§0.23), 1508 (§0.23a), 1565 (§0.24), 1604 (§0.25), 1640 (§0.26), 5448 (§4.9), 5487 (§4.10) | Henselian finite-étale lifting; excellence/completions; universal homeomorphisms; elementwise-nil étale invariance; perfection/pfp; characteristic-p weak normality; formal functions and completion of morphisms between given proper schemes. Mixed-characteristic/formal extensions are gaps, not supplied results. |
| AdicSpacesPartII, main | `TauCetiRoadmap/AdicSpacesPartII/README.md:3085`, 3557, 4071, 4990, 7466, 7522, 7577, 7618, 8542, 8968, 9228, 9806 | R0.6–R0.7 maps/fibre products, R0.9 affinoid Jacobson, R0.13 finite maps, R0.19.1–.4 patch/quotient facts, R1.2 relative scheme–adic product, R1.3–.4 analytification, R1.7 rigid–adic comparison. Pseudorigid extensions remain contracts. |
| AdicSpacesPartIII, main | `TauCetiRoadmap/AdicSpacesPartIII/README.md:1052`, 1310, 2075, 2450, 2729, 3272, 3525, 4356, 4615, 4986, 7714 | F0.2–.8 formal carriers/completions and adapters; R2.2–.4 generic fibres, specialization/tubes; R2.9 FS and Berthelot representability. Its existing explicit Huber comparison is the topologically finite-type case, so D10.2's relative lfft comparison is a distinct extension. |
| PerfectoidSpaces, main | `TauCetiRoadmap/PerfectoidSpaces/README.md:4912`, 5049, 5197, 6235, 6528, 9976, 10074 | P1.22 marked untilts, P1.24 integral rings, P1.27 tilting, P2.3 rational localization, P2.5 residues, P3.20/P3.22 étale tilting. Retain integral subrings and markings. |
| DiamondsAndVStacks, new head `7c7453f` | `TauCetiRoadmap/DiamondsAndVStacks/README.md:979`, 1889, 1933, 2524, 2719, 3211, 4050, 4199, 4514, 4584, 5207, 5382, 5437, 5656, 5700 | D0.1/.23/.24 topology and cutoffs; D1.1/.4/.9 disconnected covers; D2.2/.3/.7/.8 v-descent and cutoff comparison; D3.6–.10 étale/immersion/torsor inputs. |
| Same supplier | `TauCetiRoadmap/DiamondsAndVStacks/README.md:6019`, 6317, 6627, 6745, 6810, 7131, 7307, 7664, 7958, 8922, 9030, 9092, 9216, 9297, 9381, 9605, 9672, 9757 | D4 smallness/underlying spaces and detection; D5 spatiality/local structure/finite étale permanence; D6.1–.9 analytic and pre-adic diamondification, integral Galois quotient, point map, seminormal rigid full faithfulness. D7 formal scheme diamondification is a different convention from the analytic scheme functor. |
| DiamondEtaleCohomology, new head `3c67283` | `TauCetiRoadmap/DiamondEtaleCohomology/README.md:1202`, 1238, 1246, 1254, 1262, 1288, 1296, 1408, 2499 | C4.1–.7 proper/partially proper maps, C4.16 proper images, C8.24 one-point profinite quotient. Partial properness includes uniqueness, not just existence of lifts. |
| AdicCoefficientsAndComparisons, new head `248aad6` | `TauCetiRoadmap/AdicCoefficientsAndComparisons/README.md:776` (L1) | Characteristic-p analytic convention has affine values `Hom(A,R)`; mixed-characteristic analogue supplies only D10.1's locally finite-type restriction (R13). It does not own the formal bounded convention. |
| GeometricSatakeAndFusion, new head `0652974` | `TauCetiRoadmap/GeometricSatakeAndFusion/README.md:802`, 842, 946 | Integral bounded families, parahoric ind-properness and bounded admissible flag/local-model objects. R10–R11 address the reverse consumer claim and wrong target title. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory, new head `34f4657` | `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:4029`, 4073 | R07.2.27 already owns global bounded-function recovery; R06. |
| CommRingFactorizationSystems, new head `391c077` | `TauCetiRoadmap/CommRingFactorizationSystems/README.md:696`, 820 | F1 supplies the ring predicates; F6 supplies absolute weak normalization's universal property. Scheme gluing, finiteness and formal completion are genuinely additional contracts. Do not recreate the ring-level construction when filling them. |
| ArcTopologyAndDescent | `packages/ArcTopologyAndDescent/design/README.md:219`, 277, 297, 572, 929 | Design locations exist, but eligible supplied roadmap text is absent: R03. |

The five named gap slugs match between README and plan. `completed-etale-lifts` requests completed qc separated étale lifting beyond finite étale henselian equivalence; that is a real extension. `absolute-weak-normality-formal` requests scheme/formal compatibility beyond the existing ring construction. R09 isolates the compound requests in the remaining three. The two ownerless gaps are R01–R02. No gap is silently treated as an implemented theorem.


### Adversarial statement table

Each row identifies a numbered statement; API identities are expanded in the next table. In these computations O is a complete mixed-characteristic DVR with uniformizer π, and C is an algebraically closed perfectoid field when used as a geometric test. Counts of sections are on the specified field test, not counts of scheme points. Values “true/false” are evaluations of the stated predicates. Tests do not purport to replace proofs.

| Statement | Instances tried | Values computed on both sides | Result / change | Source passage inspected |
|---|---|---|---|---|
| D7.1 Finite residue preservation | Identity; cusp normalization; unramified quadratic extension | Identity and cusp have completed residue degree 1 on both sides. Quadratic extension: ordinary point counts 1→1, geometric fibre count 2≠1; thus it fails universal injectivity. | Finite theorem survives; general ownership R01. | SW20 line 3113 |
| D7.2 Integral stalk comparison modulo pⁿ | Identity Q_p, n=1,2; Q_p(√p)/Q_p | Identity gives F_p=F_p and Z/p²=Z/p². Ramified extension modulo p gives F_p[ε]/ε² versus F_p (p² versus p elements), so missing residue-isomorphism would be false. | Residue hypothesis essential; n≥1 explicit. | SW20 line 3131 |
| D7.3 Invariance of analytic diamondification | Cusp; nilpotent thickening; quadratic extension | Cusp parameter t is recovered uniquely from t²,t³ on reduced integrally closed tests; nilpotent maps to 0. Degree-two separable extension has two geometric sections versus one. | Conditional theorem survives; R01 covers unrestricted result. | SW20 line 3120 |
| D7.4 Formal scheme functor | A=F_p[T]; square-zero thickening; zero ring | Sections send T to R⁺, not all R: ϖ allowed, ϖ⁻¹ excluded. ε maps to 0; Hom(0,R⁺)=∅ for nonzero tests, so the empty scheme stays empty. | Survives; formal/analytic conventions distinguished. | SW20 line 6282; GLE line 1108; AGLR line 598 |
| D7.5 Minimal image point | Field; DVR; empty source | Field image has one point. DVR image {generic,closed} has largest prime (π). Empty image has zero candidates. | Nonemptiness and qc explicitly retained. | SW20 line 6461 |
| D7.7 Olivine spectrum | Discrete F_p[[u]]; F_p; Tate field | Discrete power-series ring: Spa has 3 points, Spo has 4; one fibre of h has 2 points. F_p gives 1=1; Tate field gives h-fibre size 1. | Survives; replacing Spo by Spa fails 4≠3. | GLE line 527 |
| D7.8 Spd–Spo comparison | Z_p; F_p; Tate C | Z_p gives 2 points on each side, F_p 1=1, Spa(C,O_C) 1=1. Generic-to-special direction agrees. | Survives with stated homeomorphism hypotheses. | GLE line 700 |
| D7.9 Schematic closed loci | B=F_p×F_p, I=0,(1,0),B | Zero loci have respectively 2,1,0 points on both descriptions. I=0 is not prime. | Correctly repairs source's prime-ideal misprint. | GLE line 1084 |
| D7.10 v-cover detection | Identity; two-point surjection; empty family | Identity is cover and epi (true,true); folding two copies of Spec F_p is (true,true). Empty family over nonempty target is (false,false), over ∅ (true,true). | Mathematics survives; missing supplier R03. | GLE line 1119 |
| D7.6 Perfect-scheme full faithfulness | Spec F_p and Spec F_(p²); imperfect F_p(t) | Endomorphism counts are 1=1 and 2=2. Inverse Frobenius on F_p(t)^perf sends t to t^(1/p), absent from F_p(t). | Perfectness excludes the extra map; R03 affects proof supply. | SW20 line 6290; GLE line 1253 |
| D7.11 Perfect discrete-source full faithfulness | Spd F_p→Spd Z_p; imperfect source | Both Hom sets to Z_p have one reduction map. An imperfect source acquires inverse Frobenius after perfection: t^(1/p) is present on one side, absent on the unperfected ring side. | Survives for perfect discrete sources. | GLE line 997 |
| D8.1 Scheme-v-sheaf category/cutoffs | Representable F_p, empty scheme, two points | Yoneda gives one endomorphism of F_p; product of two two-point representables has 4 sections over an algebraically closed field at every cutoff; empty cover forces one section at ∅. | Survives on κ-small objects; R03 affects ownership of descent. | GLE line 1151 |
| D8.2 Underlying space | Perfect DVR; F_p; zero ring | Spaces have respectively 2,1,0 points. DVR opens are ∅,{generic},{generic,closed}, agreeing with Zariski rather than the discrete two-point topology. | Survives; quotient topology is essential. | GLE line 1229 |
| D8.3 Extension of diamondification | Two-point coproduct; product; coequalizer | At an algebraically closed field, 1+1=2 sections, 2×2=4 sections; coequalizing the swap of two points gives 1 on both sides. | Finite limits and colimits agree in these tests. | GLE line 1193 |
| D8.4 Reduction/right adjoint | Spd Z_p; Spd Q_p; Spd(F_p[T]) | Reductions are Spec F_p (1 point), ∅ (0 points), Spec F_p[T^(1/p∞)] respectively. Hom(Spec F_p,red Spd Z_p) and Hom(*,Spd Z_p) each have 1 element. | Adjunction direction and p-torsion test survive. | GLE line 1224; AGLR line 815 |
| D8.5 Reduced scheme-v-sheaves | Perfect finite fields; product; empty | Unit on Spec F_(p²) gives identical two embeddings into an algebraically closed field. Product unit on two two-point schemes gives 4→4; empty gives 0→0 on nonempty field tests. | Survives; Spd Z_p itself is not an object of the scheme-v-sheaf category. | GLE line 1252 |
| D8.6 Reduction of Huber pairs | Tate C; O_C; discrete F_p[T] | For C, C·C°°=C, quotient 0, spectrum empty. For O_C, quotient is residue k; for discrete F_p[T], topological nilradical 0 and perfection adds T^(1/pⁿ). | Correct ambient ideal and normalized plus ring survive. | GLE line 1262; AGLR line 815 |
| D8.7 Quasiseparated diamonds have empty reduction | Spa(C,O_C); empty diamond; terminal sheaf | First two have reduction ∅; terminal Spd F_p has reduction Spec F_p with 1 point and therefore cannot be a diamond. | Survives; does not say every empty-reduction sheaf is a diamond. | GLE line 1273 |
| D8.8 Formal adicness | Identity; (p,q)-adic formal disc; discrete versus Tate field | Identity reduction square has pullback F. Formal disc special fibre includes q≠0 characteristic-p analytic points, while reduction has q=0: not Cartesian. Discrete F_p((t))→F_p is adic but not formally adic; Tate→discrete field gives the reverse distinction. | Survives; distinct topologies are retained. | GLE line 1293; AGLR line 823 |
| D8.9 Adic iff formally adic for formal pairs | Z_p→Z_p; Z_p→Z_p[[q]] | Identity ideals (p) and (p) are cofinal: (true,true). In formal disc, q^m∉(p) for every m, so (p,q)^m⊄(p): (false,false). | Survives; not asserted for arbitrary Huber pairs. | GLE line 1307 |
| D8.10 Formal p-adicness/closedness/separation | Identity Z_p; completion at origin; empty subsheaf | Identity is formally p-adic and separated. Origin completion has open image but reduction square lacks nonzero q special points, so not formally adic. Empty immersion is closed and formally adic. | Survives; closedness alone is not formal closedness. | GLE line 1327 |
| D8.11 Formal separation of Spd Z_p | One untilt versus two different untilts; identity | Equal untilt data give one diagonal lift; incompatible marked untilts give no lift. On the special fibre the diagonal is the identity of Spd F_p. | Survives; retaining the marking excludes spurious identifications. | GLE line 1340 |
| D8.12 Counit injectivity criterion | Spd Z_p; representable perfect scheme; pullback along identity | Counit is the one-point special subfunctor of Z_p, hence injective; representable unit/counit gives identity. Pullback over identity is the same one-point subfunctor. | Both directions agree on these nonempty and identity cases. | GLE line 1354 |
| D8.13 Formal closed reductions | A=Z_p⟨T⟩, J=(p,T), J=A | Reductions are Spec F_p and ∅, matching zero loci {T=0} and ∅. J=(T) is not open in the p-adic topology and cannot be substituted for the required open ideal. | Survives with open-ideal hypothesis. | GLE line 1367 |
| D9.1 Tate specialization | DVR point; two-rank valuation; unit ideal/zero ring | Strict ideal sends π to 0 in k and excludes 1; centre is (π), not (0). Two-rank Spa and Spec of residue valuation ring both have 2 points. Zero ring gives ∅→∅. | Survives; strict inequality and specialization direction fixed. | GLE line 1393 |
| D9.2 Formalization | Spd Z_p; Spd Q_p; empty diamond | Formalizing values are true,false,true. Reductions have cardinalities 1,0,0. The last value contradicts the unrestricted exclusion of qs diamonds. | R05; positive definitions/equivalences survive. | GLE line 1409; AGLR line 830 |
| D9.3 Unique formalization | Maps to Spd Z_p; identity; product | A fixed marked untilt has exactly 1 integral extension. Two equal component extensions give 1 ordered pair; different restrictions give 0 compatible extensions. | Survives under formal separation. | GLE line 1441 |
| D9.4 Specializing sheaves | Spd Z_p; Spd Q_p; ∅; Spd F_p | Predicate values true,false,true,true; corresponding formalizations of admissible tests are unique, nonexistent, vacuous, unique. | Survives; formal separation alone would wrongly admit Q_p. | GLE line 1471 |
| D9.5 Specialization of specializing sheaves | Z_p; formal disc; identity | Z_p's two points map to the sole closed special point. On the disc Gauss gives ideal (0), and a classical residue ā gives (T−ā). Identity commutation gives the same ideals on both routes. | Survives; not all points of a disc specialize to its origin. | GLE line 1472 |
| D9.6 Prekimberlite and analytic locus | Spd Z_p; ∅; nonempty qs diamond | Z_p decomposes into generic diamond (1 point) and reduced part (1 point). ∅ decomposes 0=0+0. Q_p is excluded because it is not v-locally formal. | Survives; arbitrary diamonds are not admitted trivially. | GLE line 1498; AGLR line 850 |
| D9.7 Formal schemes as prekimberlites | Z_p⟨T⟩; Z_p[[q]]; O_C | Reductions are F_p[T]^perf, F_p and k_C. Formal disc has a characteristic-p analytic point with q≠0, so full analytic locus exceeds generic fibre. O_C is excluded by the written noetherian hypothesis. | R07; noetherian instances survive. | GLE line 1516; SW13 line 561 |
| D9.8 Formal neighbourhood | Origin in Spf O⟨T⟩; whole reduction; empty | Completion is O[[T]], whole gives O⟨T⟩, empty gives 0/empty. Rank-two points can lie in the set-theoretic special fibre but outside its open tube. | Survives; sheaf-theoretic formal neighbourhood is not a pointwise fibre. | GLE line 1540; AGLR line 884 |
| D9.9 Constructible neighbourhood open | Origin; whole; generic point of perfect affine line | Origin neighbourhood is an open formal disc although {origin} is not Zariski open. Whole gives identity. The generic point is not a constructible locally closed subset in this example. | Survives with constructibility; formal adicness requires open S. | GLE line 1575; AGLR line 905 |
| D9.10 Heuer sheaf | A=F_p[T]^perf, R=C; perfect field; zero ring | Sections are elements of k_C; T=ϖ and T=0 have the same image 0, unlike the formal functor. Field reduction gives the field scheme; zero ring has no sections on nonzero tests. | Survives; quotient R⁺/R°° is essential. | GLE line 1589 |
| D9.11 Specialization morphism | Formal line, T=ϖ and T=1 | Images in the Heuer line are 0 and 1. Pullback over {0} retains ϖ and excludes 1; the space-level specialization gives exactly the same decisions. | Survives; excludes the zero map as a model of SP. | GLE line 1615 |
| D9.12 Completed étale lifting | R⁺ versus R⁺×R⁺[1/ϖ] | Both reduce modulo ϖ to R⁺/ϖ. Ordinary algebras are unequal; completed second algebra is R⁺×0≅R⁺, so completed lifts agree. | Correctly repairs ordinary-lift uniqueness; supplier gap remains. | GLE line 1623 |
| D9.13 Étale formal neighbourhood category | F=Spd Z_p, V=Spec F_(p²); empty; identity | The lift is Spd W(F_(p²)); geometric special fibre has 2 points, so it is not an open subobject of the one-point base. Empty lifts to ∅ and identity to F. | Survives; maps rather than just open subsets are required. | GLE line 1639 |
| D9.14 Étale reduction equivalence | Finite unramified quadratic cover; identity | Reduction/lift recovers W(F_(p²)) and F_(p²); automorphism group has order 2 on both sides. Identity gives order 1; empty object is preserved. | Survives conditional on completed-lift contract. | GLE line 1646 |
| D10.1 Two scheme functors | A¹_O; Spec F; proper P¹; infinite disjoint union | Formal affine line permits ϖ but excludes ϖ⁻¹; analytic permits both. Spec F has formal side ∅ and analytic side Spd F. Proper P¹ compares isomorphically; infinite copies of Spec O give an open identity comparison. | R08 restores locally finite type; R13 owns the arbitrary-scheme extension. | AGLR line 598 |
| D10.2 Relative generic-fibre comparison | O⟨T⟩; O[[q]]; O/π | Both functors give closed disc, open disc and ∅ respectively. The all-analytic locus of O[[q]] additionally contains q≠0, π=0 points. | Distinct extension survives; absolute analytic locus would be wrong. | SW13 line 587; DJ95 line 2525; SW20 line 6484 |
| D10.3 Normality of generic fibres | O⟨T⟩; cusp; product O×O | Generic rings F⟨T⟩ and F×F are normal. Cusp F⟨t²,t³⟩ is not: t is integral and absent. | Survives; no hidden domain hypothesis imposed globally. | DJ95 line 2756 |
| D10.4 Bounded functions and local connectedness | Open/closed discs; cusp-order ring; π-torsion | Bounds recover O[[q]] and O⟨T⟩. In O⟨πt,t²⟩, t is bounded but absent. O/π has nonzero formal functions and empty generic fibre. Complete local normal disc has one component. | Global claim duplicated: R06. Local connectedness is noncircular. | DJ95 line 2988; LOU17 line 575; SW20 line 6499 |
| D10.5 Classical specialization | O⟨T⟩, T=π and T=1 | Both specialization constructions give closed residues (T) and (T−1), respectively. The valuation test is π<1 and 1=1. | Survives under the stated residue-field hypothesis. | DJ95 line 2610; GLX line 714; SW20 line 6484 |
| D10.6 Maximal diamond open | Spf Z_p; Spf W(F_(p²)) | Generic opens are Spd Q_p and Spd W(F_(p²))[1/p]. Special functors have respectively 1 and 2 sections on algebraically closed characteristic-p tests; neither is a diamond. | Theorem survives; proof equality false: R04. | SW20 line 6484; GLE line 1273 |
| D10.7 Generic density | Flat disc; pure special fibre; rank-two valuation ring | Flat tft disc has dense generic locus. Spf F_p has empty generic locus and one point. In the explicit rank-two example below, nonempty N_(t≪1) has zero intersection with generic locus. | Survives with lfft hypotheses; flatness alone is insufficient. | AGLR line 763; LOU17 line 186; SW20 line 6484 |
| D10.8 Closed immersion criterion | Identity; closed origin; generic open in Spd O | Identity and origin have closed images and mono=true. Generic open is qc and mono but its image is not closed, so it is not a closed immersion. | Both directions survive; closed-image condition cannot be dropped. | AGLR line 471; KPZ line 1319 |
| D10.9 v-closure | Empty/full subsheaf; open disc inside closed disc; rank-two singleton | Closures of ∅ and whole are ∅ and whole. Ordinary closure of the open disc omits Gauss; weakly generalizing closed closure contains Gauss. Closed rank-two singleton fails weak generalization. | Survives; ordinary topological closure is not the definition. | AGLR line 496; GLE line 381 |
| D10.10 Formal specialization triples | Formal disc, maps q↦q and q↦π+q² | The two maps are distinct on generic fibres and each sends (π,q) into (π,q). Their special maps are q↦q and q↦q². q↦1 is not continuous and does not preserve specialization. | Survives; allows non-adic continuous maps. | SW20 line 6492; LOU17 line 642 |
| D10.11 Formal full faithfulness | Formal disc; cusp normalization; square-zero special fibre | Endomorphisms are q↦g with g∈(π,q). Cusp normalization is diamond-isomorphic but not formally isomorphic. k[ε]/ε² and k give the same functor; for k=F_(p²) it has 2, not 1, geometric sections. | Main theorem survives; example equality R04. | SW20 line 6484; KPZ line 1319 |
| D10.12 Proper normal integral recovery | P¹_O; projective cusp | Identity and T↦T² have distinct generic maps and distinct diamond maps. Projective cusp normalization has identical diamond but nonisomorphic schemes; normality excludes it. | Survives; properness supplies formal GAGA. | KPZ line 852; AGLR line 778 |
| D10.13 Absolute weak normalization | Cusp; perfect F_p algebra; nonperfect F_p(t) | Cusp AWN is O⟨t⟩ with t²,t³ recovered. In characteristic p the equation forces arbitrary pth roots: F_p(t) fails because t^(1/p) is absent; its perfection passes. | Survives; uses elementary coupled root equations, not arbitrary characteristic-zero roots. | AGLR line 671 |
| D10.14 Flat closures | Section T=0 in P¹_F; empty U; extra vertical component | Flat closure is P¹_O's zero section and its v-closure agrees. Empty U gives ∅. Adding a reduced vertical component leaves generic U unchanged but adds special points, so flatness fails the proposed conclusion. | Survives with proper ambient model and flat closure. | KPZ line 1319; AGLR line 541 |
| D10.15 Unique models/maps | GL_n, d=0,n; n=0; fixed isomorphism | Grassmannians are Spec O for d=0,n, including n=d=0; prescribed identity has exactly one lift. For P¹_O, different automorphisms exist but only one lifts a fixed diamond isomorphism. | Survives; uniqueness is relative to prescribed data, not unmarked isomorphism. | SW20 line 7494; KPZ line 1319 |
| D11.1 Valuative prekimberlite | Spd O; formal open subdisc; identity | SP for Spd O extends every compatible rank-one point uniquely. A formal open subscheme remains valuative although its inclusion need not be partially proper. Identity extension count is 1. | Survives; relative partial properness is not confused with absolute properness. | GLE line 1682 |
| D11.2 Smelted pairs | Full analytic disc; open residue disc; small closed disc; ∅ | Whole and open residue disc have inclusion partially proper=true; a small closed disc as an open adic subspace misses boundary specializations, so false. Empty D gives a valid smelted pair with empty sp image. | Survives; openness alone does not suffice. | GLE line 1707; GLX line 714 |
| D11.3 Kimberlites | Spd O; formal tft disc; doubled origin; ∅ | For the first two, inverse images of affine reduction opens are spatial qc. Doubled origin fails separation. Empty analytic locus has compact inverse image ∅ and passes vacuously. | Survives; kimberlite need not have surjective specialization. | GLE line 1707; AGLR line 799 |
| D11.4 Formal schemes give kimberlites | Spf O; formal q-disc; Spf O_C | Spf O gives one analytic point. q-disc analytic locus is covered by rational charts from p,q, including π=0 analytic points. O_C gives one generic point but is omitted by noetherianness. | R07; finite-generator chart argument extends beyond noetherian case. | GLE line 1516; AGLR line 799; GLX line 670 |
| D11.5 Tubes | Origin in closed disc; rank-two closed point; whole/empty | Origin tube is open disc. Rank-two point fibre is {y} but interior is ∅. Whole and empty tubes are D and ∅. | Survives; fibre and tube have sizes 1 and 0 in the negative control. | GLE line 1718; AGLR line 884 |
| D11.6 Spectral/closed specialization | Spd O; tft disc; non-qc open disc | Point specialization is closed; each qc source/target chart has compact-open inverse images. Open disc can be non-qc, so local spectrality does not imply globally qc. | Survives under the explicitly local convention. | GLE line 1730 |
| D11.7 Permanence | Closed special fibre; empty immersion; unramified cover | Special fibre is a kimberlite with analytic locus ∅. Empty pullback remains ∅. Unramified quadratic neighbour has two geometric sheets, each with the same valuative property. | Survives; no unintended flatness conclusion. | GLE line 1747 |
| D11.8 Constructibly Jacobson | Rank-one point; tft disc; rank-two two-point space | Point rank-one set has patch closure size 1=whole. Tft disc rank-one points meet every nonempty patch open. In two-point rank-two Spa, singleton rank-two is patch open and meets rank-one set in 0 points. | Survives; ordinary density would be too weak. | GLE line 1787 |
| D11.9 Tube density | Origin in tft disc; two-point non-cJ space | Disc tube contains all rank-one points in the fibre and is dense in it. In non-cJ case tube is ∅, fibre {y}, closures ∅≠{y}. | Survives; cJ hypothesis has a separating witness. | GLE line 1783 |
| D11.10 Enough facets | C-point; tft affine line; fibre product; field extension | Identity is a one-chart cover of point/line. Product of lines has two coordinates, again one tft chart; base extension C→C′ gives C′⟨T⟩. Rank-one density agrees on all these charts. | Survives; smooth-untilt clause is not arbitrary untilt geometry. | GLE line 1838 |
| D11.11 Rich pairs | Flat tft formal disc; pure F_p[T]^perf; ∅ | Disc has cJ=true, locally noetherian reduction=true, sp surjective=true. Pure special object has empty analytic source but nonempty reduction, hence false. Empty pair satisfies all three with ∅→∅ surjective. | Survives; nonempty reduction prevents vacuous richness. | GLE line 1856; GLX line 851 |
| D11.12 Topological normality | Normal formal disc; O⟨x,y⟩/(x(x−π)); empty pair | Normal closed-point tube has 1 component. Two-branch model has two disjoint generic discs over the same reduced line, so each tube has 2 components and fails. Empty pair has no closed points to test. | Survives; connected includes nonempty. | GLE line 1856; GLX line 891 |
| D11.13 Quotient specialization | Spd O; two-branch model; pure special object | Map to a point is quotient because its preimage opens are ∅ and whole. Two-branch model still has quotient sp despite 2 components upstairs. Pure special object's ∅→nonempty map fails surjectivity. | Survives; quotient does not imply component bijection. | GLE line 1862 |
| D11.14 Connected-component bijection | Normal connected model; disjoint union; two branches; punctured chain | Component counts are 1=1 and 2=2 for normal examples. Two-branch model gives 2≠1 and fails topological normality. Punctured chain has zero closed points and fails closed-specialization hypothesis. | Conditional theorem survives; R02 concerns unrestricted ownership. | GLE line 1881; GLX line 891 |
| D11.16 π-adic notions | Spd O; O⟨T⟩; (π,q)-adic O[[q]]; pure special scheme | First two have analytic=generic and special=red⋄. Formal q-disc has characteristic-p analytic points q≠0, hence analytic≠generic and is not π-adic. Pure special scheme has analytic=generic=∅. | Survives; π-adic is stronger than being over Spd O. | AGLR line 823 |
| D11.17 Flat π-adic kimberlites | Spd O; nonzero discrete k-algebra; empty; nonnormal B | Flat values true,false,true. Discrete k-algebra has generic ∅ and nonempty reduction. For B=O⟨πt,t²⟩, generic integral closure adds t without changing bounded valuations. | Cover theorem survives; plus convention R12, general formal input R07. | AGLR line 908 |
| D11.15 Normal formal components | Normal disc; unramified degree-two point; two disjoint discs | Tubes have 1 component even over a degree-two residue extension: one unramified field/open disc, not two disconnected points before geometric base change. Global counts are 1=1 and 2=2. | Survives; non-geometric connectedness is used consistently here. | DJ95 line 2899; GLE line 1771; GLX line 714 |
| D11.18 Kimberlite triples | Spd O; finite unramified quadratic model; empty | Generic and special automorphism groups have compatible order 2 for the unramified model; only commuting pairs occur. Identity model gives one compatible triple map; empty-to-empty gives one. Completed unramified base change preserves the required square. | Survives with all three K conditions and qc/separatedness. | AGLR line 983 |
| D11.19 Proper criterion | Spd O; pure special Spd k; empty | Spd O is proper with dense generic fibre and flat. Spd k has generic ∅, not dense in its nonempty space, and is not flat. Empty has dense ∅ in ∅ and is flat. | Survives; properness alone is insufficient. | AGLR line 1029 |
| D11.20 Normality from connected tubes | Algebraically closed residue; A=Z_p+pO_L for unramified quadratic L | Over algebraically closed k, one point in a finite closed fibre has residue degree 1. The order A has one connected tube (Spa L), but normalization residue degree 2 and A≠O_L; after geometric base change the tube has 2 components. | Corrected theorem survives; merely perfect k would be false, also at p=2,3. | AGLR line 1044 |

### Adversarial API table

These 165 rows cover every bullet in the thirty construction/definition API blocks. “README” means `packages/DiamondsAndVStacksPartII/README.md`; each pointer identifies the exact assertion, including duplicate formulations. Each computation records the compared values; agreement means agreement on that instance, subject to the findings on ownership and generality.

| Statement | Instances and computed values on the two descriptions | Result / change |
|---|---|---|
| D7.4 API 1, README:163 | On F_p[T], identity sends T to T; composing T↦T+1 twice gives T+2 on both functorial routes (T at p=2). | Agrees on these instances. |
| D7.4 API 2, README:164 | On C, Hom(F_p[T],O_C)=O_C; T=ϖ is included and T=ϖ⁻¹ is excluded on both descriptions. | Agrees on these instances. |
| D7.4 API 3, README:165 | For F_p[ε]/ε², every map to perfect R⁺ sends ε to 0; both functors equal that of F_p. | Agrees on these instances. |
| D7.4 API 4, README:166 | A¹×A¹ evaluated on C is O_C² on either side; the empty fibre product of disjoint components has zero sections. | Agrees on these instances. |
| D7.4 API 5, README:167 | For g=T, T=1 is allowed and T=ϖ is excluded after localization: unit=1 versus nonunit=0 in each description. | Agrees on these instances. |
| D7.4 API 6, README:168 | For ideal (T), both closed-subfunctor descriptions retain exactly T=0; ideal (1) retains no section. | Agrees on these instances. |
| D7.4 API 7, README:169 | Discrete Spa(F_p[T],F_p[T]) imposes the same bound as the formal functor: ϖ passes, ϖ⁻¹ fails. | Agrees on these instances. |
| D7.7 API 1, README:212 | Identity fixes (h,a); for u↦u² the h- and a-values both square under pullback, so composition squares twice to fourth powers. | Agrees on these instances. |
| D7.7 API 2, README:213 | Discrete F_p[[u]] has h-fibre sizes 1,1,2, summing to 4 over 3 points; every point is hit. | Agrees on these instances. |
| D7.7 API 3, README:214 | At a u-adic h, ∣u∣≤∣1∣≠0 is true; the reversed inequality is false. At support (u), ∣u∣≠0 is false. | Agrees on these instances. |
| D7.7 API 4, README:215 | For the two points over the microbial u-adic h, ∣u∣ᵃ<1 is respectively false and true; N distinguishes them. | Agrees on these instances. |
| D7.7 API 5, README:216 | The discrete microbial fibre has size 2; the field and Tate fibres have size 1, not 2. | Agrees on these instances. |
| D7.7 API 6, README:217 | For Tate C,O_C, both Spo and Spa have 1 point and the only opens ∅ and whole. | Agrees on these instances. |
| D7.7 API 7, README:218 | Z_p and its already-completed ring give the same two points; the completion map fixes each support. | Agrees on these instances. |
| D7.7 API 8, README:219 | For (B,B), boundedness gives no b with 1<∣b∣ᵃ: bounded locus is all Spo. For a Tate field, a pseudouniformizer inverse has value >1 and excludes the point. | Agrees on these instances. |
| D8.1 API 1, README:334 | Perfect representables ∅, Spec F_p and two points give 0,1,2 sections on an algebraically closed field; the category distinguishes all three. | Agrees on these instances. |
| D8.1 API 2, README:335 | End(Spec F_(p²)) and endomorphisms of its represented sheaf each have 2 elements. | Agrees on these instances. |
| D8.1 API 3, README:336 | For the two-point representable at κ<λ, extension then restriction gives the same 2 sections; adjoint Hom sets both have 2 elements against a point. | Agrees on these instances. |
| D8.1 API 4, README:337 | The sectionwise product of two two-point schemes has 4 sections; equalizer of identity and swap has 0. | Agrees on these instances. |
| D8.2 API 1, README:363 | The two maps Spec F_p→Spec F_p⊔Spec F_p select distinct points 0,1; identity and composition retain the selected point. | Agrees on these instances. |
| D8.2 API 2, README:364 | A perfect valuation DVR has two primes; its represented sheaf has the same generic and special points with three opens, not four. | Agrees on these instances. |
| D8.2 API 3, README:365 | Present a point by two points: relation has 4 pairs and quotient has 1 class on both descriptions. | Agrees on these instances. |
| D8.2 API 4, README:366 | The fold 2→1 hits the sole target point; ∅→1 fails surjectivity on both sheaves and spaces. | Agrees on these instances. |
| D8.3 API 1, README:392 | Identity of the two-point scheme becomes identity on two components; swapping twice gives identity on both sides. | Agrees on these instances. |
| D8.3 API 2, README:393 | For Spec F_p[T], sections on C equal O_C by both constructions. | Agrees on these instances. |
| D8.3 API 3, README:394 | Two two-point representables have product with 4 geometric sections; both diamondifications give 4. | Agrees on these instances. |
| D8.3 API 4, README:395 | Coproduct of two points has 2 geometric sections; quotient of their swap has 1, on both sides. | Agrees on these instances. |
| D8.4 API 1, README:421 | Identity on Spd Z_p reduces to identity on Spec F_p; reducing a composite twice gives the same sole point. | Agrees on these instances. |
| D8.4 API 2, README:422 | For S=Spec F_p and F=Spd Z_p, the two adjoint Hom sets each have 1 element; for F=Spd Q_p both have 0. | Agrees on these instances. |
| D8.4 API 3, README:423 | At R=F_p, evaluation of red Spd Z_p and of Spd Z_p on Spd F_p each gives the unique reduction map. | Agrees on these instances. |
| D8.4 API 4, README:424 | Reducing Spd Z_p×Spd Z_p gives a one-point represented product; products of two finite two-point special schemes have 4 sections on either side. | Agrees on these instances. |
| D8.4 API 5, README:425 | The counit for Spd Z_p selects the special point; it does not select the generic point. | Agrees on these instances. |
| D8.4 API 6, README:426 | For S=Spec F_(p²), the unit induces the identity on its two embeddings into an algebraically closed field. | Agrees on these instances. |
| D8.5 API 1, README:454 | Unit on Spec F_p is 1→1 and on ∅ is 0→0 at a nonempty field test; both are bijective. | Agrees on these instances. |
| D8.5 API 2, README:455 | For perfect F_(p²), the unit preserves exactly 2 embeddings, with no extra inverse-Frobenius map. | Agrees on these instances. |
| D8.5 API 3, README:456 | Take G=Spec F_p and F=two F_p-points: Hom sets before and after ⋄ both have 2 elements. | Agrees on these instances. |
| D8.5 API 4, README:457 | Product of two reduced two-point schemes gives 4 sections and unit 4→4; equalizer of identity/swap gives 0→0. | Agrees on these instances. |
| D8.8 API 1, README:508 | For id Spd Z_p the reduction pullback is Spd F_p; for the formal q-disc it omits the q≠0 characteristic-p analytic points. | Agrees on these instances. |
| D8.8 API 2, README:509 | For two formal open immersions with underlying open sets U⊂V⊂X, both composite pullbacks have reduction U; identity example gives 1=1. | Agrees on these instances. |
| D8.8 API 3, README:510 | Base-changing id F along G→F gives id G; its reduction square is Gred×Gred Gred=Gred. | Agrees on these instances. |
| D8.8 API 4, README:511 | The swap of two formal components has reduction swap; its pullback square contains the same 2 components. | Agrees on these instances. |
| D8.8 API 5, README:512 | For the identity of Spd Z_p, both subsheaves in the asserted equality are its single special component. | Agrees on these instances. |
| D8.8 API 6, README:513 | For Spd W(F_(p²))→Spd Z_p, both counit routes send each special-field embedding to the unique F_p embedding. | Agrees on these instances. |
| D8.10 API 1, README:552 | Spd Z_p has identity reduction square, true; the (p,q)-adic formal disc has extra q≠0 special points, false. | Agrees on these instances. |
| D8.10 API 2, README:553 | The identity and ∅→Spd Z_p are closed and formally adic; completion at a closed point has open image but is not formally adic. | Agrees on these instances. |
| D8.10 API 3, README:554 | The diagonal of two disjoint formal points selects the two matching components out of four, a formally closed subset. | Agrees on these instances. |
| D8.10 API 4, README:555 | Composing inclusions of component sets {0}⊂{0,1}⊂{0,1,2} gives {0} on both sides and is formally closed. | Agrees on these instances. |
| D8.10 API 5, README:556 | Pulling {0}⊂{0,1} back to {1} gives ∅; its reduction pullback is also ∅. | Agrees on these instances. |
| D8.10 API 6, README:557 | For Spd O, the formally closed diagonal is in particular closed; the doubled-origin diagonal is not closed and fails both predicates. | Agrees on these instances. |
| D8.10 API 7, README:558 | A single formal component inside two formally separated components has one matching diagonal component and remains formally separated. | Agrees on these instances. |
| D9.1 API 1, README:637 | At the O-valued point, π has value <1 and 1 has value 1, yielding centre (π). | Agrees on these instances. |
| D9.1 API 2, README:638 | At the same point π and π² lie in the strict ideal, 1 does not; the quotient O/(π)=k is a domain. | Agrees on these instances. |
| D9.1 API 3, README:639 | D(1) pulls back to all points, D(0) to ∅. D(T) on a bounded disc retains T=1 and excludes T=π. | Agrees on these instances. |
| D9.1 API 4, README:640 | For a two-rank field pair, the two Spa points map onto the generic and closed primes of the residue valuation ring. | Agrees on these instances. |
| D9.1 API 5, README:641 | For that two-point space, closed sets ∅,{closed},whole map to the same closed sets; inverse compact opens are ∅,{generic},whole. | Agrees on these instances. |
| D9.1 API 6, README:642 | Under T↦U², a point with residue U=a has centre T−a² by either composite. | Agrees on these instances. |
| D9.1 API 7, README:643 | A strictly totally disconnected product of two algebraically closed rank-one fields gives 2 discrete points on both sides. | Agrees on these instances. |
| D9.2 API 1, README:671 | For Spd Z_p a fixed marked untilt extends integrally exactly once; for Spd Q_p no extension across its special point exists. | Agrees on these instances. |
| D9.2 API 2, README:672 | For Spd O_C the identity perfectoid test already formalizes; the required refinement has degree 1. | Agrees on these instances. |
| D9.2 API 3, README:673 | Spd O_C is covered by itself; ∅ is covered by the empty family. Both presentations have surjective underlying maps. | Agrees on these instances. |
| D9.2 API 4, README:674 | For Spd Z_p both predicates are true; for Spd Q_p both false; for ∅ both true. | Agrees on these instances. |
| D9.2 API 5, README:675 | For B=Z_p⟨T⟩, a map T↦a∈R⁺ extends with the same a; T↦ϖ⁻¹ was never an admissible formal-pair map. | Agrees on these instances. |
| D9.2 API 6, README:676 | The fold of two copies of Spd Z_p onto one gives a v-formalizing image; the empty surjective image remains empty. | Agrees on these instances. |
| D9.2 API 7, README:677 | Spd Z_p has nonempty reduction of cardinality 1. The empty sheaf has reduction of cardinality 0 and is excluded by the hypothesis. | Agrees on these instances. |
| D9.4 API 1, README:714 | Spd Z_p satisfies both predicates; Spd Q_p is separated but fails v-local formality, so the conjunction is false. | Agrees on these instances. |
| D9.4 API 2, README:715 | Product of two formal two-point sheaves over the terminal formal point has 4 formal components and is specializing. | Agrees on these instances. |
| D9.4 API 3, README:716 | Spd Z_p⟨T⟩ formalizes each bounded image of T; the reduction is F_p[T]^perf. | Agrees on these instances. |
| D9.4 API 4, README:717 | Two formalizations of T↦a with the same marked untilt must both send T to a: extension count ≤1. | Agrees on these instances. |
| D9.5 API 1, README:743 | For Spd Z_p, both generic and special points map to the unique point of Spec F_p; inverse opens are ∅ and whole. | Agrees on these instances. |
| D9.5 API 2, README:744 | At T=π in the generic disc, both Tate and formal specialization have ideal (T) modulo π. | Agrees on these instances. |
| D9.5 API 3, README:745 | Under T↦U² and residue U=a, both naturality composites give T=a². | Agrees on these instances. |
| D9.5 API 4, README:746 | On a formal disc the inverse of D(T) contains T=1 and excludes T=π, agreeing with the open valuation condition. | Agrees on these instances. |
| D9.5 API 5, README:747 | For Spd(F_p[T]^perf), a valuation of support (T) maps to the scheme prime (T), independent of the higher valuation data. | Agrees on these instances. |
| D9.6 API 1, README:773 | Spd Z_p has reduction Spec F_p and closed counit; Spd Q_p fails v-local formality despite empty reduction being representable. | Agrees on these instances. |
| D9.6 API 2, README:774 | The analytic complement in Spd Z_p is its generic point; in the empty object it is ∅. | Agrees on these instances. |
| D9.6 API 3, README:775 | For Spd Z_p⟨T⟩ the representing ring is F_p[T]^perf; dual numbers instead reduce to F_p. | Agrees on these instances. |
| D9.6 API 4, README:776 | For Spd Z_p the counit is its closed special component, whose own reduction square is an identity. | Agrees on these instances. |
| D9.6 API 5, README:777 | For Spd Z_p the disjoint point counts are 2=1+1; for ∅ they are 0=0+0. | Agrees on these instances. |
| D9.8 API 1, README:819 | For origin S in the reduced line, the formal neighbour is Spd O[[T]], not the raw one-point fibre. | Agrees on these instances. |
| D9.8 API 2, README:820 | Pull origin back along T=1: resulting neighbour and pullback are both ∅. Along T=0 both give the whole source. | Agrees on these instances. |
| D9.8 API 3, README:821 | A formal map T↦π factors through the origin completion because its reduced image is 0; T↦1 factors through neither side. | Agrees on these instances. |
| D9.8 API 4, README:822 | Reduction of O[[T]] in its (π,T)-topology is k, the origin; full neighbour reduces to k[T]^perf. | Agrees on these instances. |
| D9.8 API 5, README:823 | Completing O⟨T⟩ along (π,T) gives O[[T]]; along the unit ideal gives 0. | Agrees on these instances. |
| D9.8 API 6, README:824 | For S equal to the full reduced line, the defining fibre product is F×base base=F. | Agrees on these instances. |
| D9.10 API 1, README:862 | On a geometric field test the Heuer affine line is k_C; its zero and one sections are distinct. | Agrees on these instances. |
| D9.10 API 2, README:863 | Hom(F_p[T]^perf,O_C/m_C)=k_C; ϖ and 0 have the same class 0. | Agrees on these instances. |
| D9.10 API 3, README:864 | Reduction at discrete perfect R kills no nonzero element, so the represented reduction has sections Hom(A,R) on both sides. | Agrees on these instances. |
| D9.10 API 4, README:865 | Product of Heuer lines has k_C² sections; D(T) retains exactly nonzero residue classes. | Agrees on these instances. |
| D9.10 API 5, README:866 | The natural map sends ϖ to 0 and 1 to 1, excluding both the identity on O_C and the zero transformation. | Agrees on these instances. |
| D9.10 API 6, README:867 | For a totally disconnected algebraically closed field point, both evaluations give Hom(A,k_C); A=F_p[T]^perf yields k_C. | Agrees on these instances. |
| D9.11 API 1, README:892 | On the formal line, T=π maps to residue 0 and T=1 maps to residue 1. | Agrees on these instances. |
| D9.11 API 2, README:893 | The induced point maps at T=π both have centre (T); at T=1 both have centre (T−1). | Agrees on these instances. |
| D9.11 API 3, README:894 | Pulling back the Heuer origin keeps T=π and rejects T=1, exactly as the origin formal neighbour. | Agrees on these instances. |
| D9.11 API 4, README:895 | Two equal sections T=π have one diagonal identification; distinct images T=0,T=1 have none, as required by a separated map. | Agrees on these instances. |
| D9.11 API 5, README:896 | For T↦U², SP sends U=a to residue a² by either route; at a=π both values are 0. | Agrees on these instances. |
| D9.13 API 1, README:933 | Identity, empty neighbour and unramified degree-two neighbour are three distinct objects; their geometric fibres have sizes 1,0,2. | Agrees on these instances. |
| D9.13 API 2, README:934 | Pullback of Spec F_(p²) through SP of Spd Z_p gives Spd W(F_(p²)), with 2 geometric special points. | Agrees on these instances. |
| D9.13 API 3, README:935 | Reduction of the unramified lift is F_(p²), giving 2 embeddings into algebraically closed k, equal to V. | Agrees on these instances. |
| D9.13 API 4, README:936 | An automorphism of the quadratic unramified neighbour is qc, formally adic, étale and separated; identity and Frobenius each preserve 2 sheets. | Agrees on these instances. |
| D9.13 API 5, README:937 | For open-and-closed component V={0} of two special points, both constructions select exactly the first formal component. | Agrees on these instances. |
| D10.1 API 1, README:990 | Formal A¹_O on an untilt gives R^(♯+); ϖ is allowed, ϖ⁻¹ excluded. | Agrees on these instances. |
| D10.1 API 2, README:991 | For O[T], π-adic completion O⟨T⟩ has the same maps into complete R^(♯+); both give bounded T-images. | Agrees on these instances. |
| D10.1 API 3, README:992 | For A¹_O, analytification and analytic diamond functor each allow T=ϖ⁻¹; they agree on unbounded affine coordinates. | Agrees on these instances. |
| D10.1 API 4, README:993 | The comparison is inclusion of the bounded coordinates; ϖ maps to itself and no new section maps to ϖ⁻¹. | Agrees on these instances. |
| D10.1 API 5, README:994 | For separated A¹_O, two bounded points with equal analytic T-coordinate are equal: fibre cardinality at most 1. | Agrees on these instances. |
| D10.1 API 6, README:995 | For infinitely many disjoint Spec O components, both sides coincide componentwise and the map is open; finite type is unnecessary (R08). | Restore local finite type: R08. |
| D10.1 API 7, README:996 | For P¹_O a field-valued point [a:b] can be scaled so a,b are integral and one is a unit; hence both functors contain the same point. | Agrees on these instances. |
| D10.9 API 1, README:1123 | The intersection of all closed subsheaves containing ∅ is ∅; for X itself it is X. | Agrees on these instances. |
| D10.9 API 2, README:1124 | The closure of the open residue disc contains it and also the rank-one Gauss point absent from its ordinary closure. | Agrees on these instances. |
| D10.9 API 3, README:1125 | If a closed sub-v-sheaf contains the residue disc, it contains its rank-two boundary specializations and their rank-one generizations, hence Gauss. | Agrees on these instances. |
| D10.9 API 4, README:1126 | In the two-point rank-two Spa, {closed} fails weak generalization while {generic,closed} passes. | Agrees on these instances. |
| D10.9 API 5, README:1127 | Identity image is the whole two-point space and passes; a supposed singleton closed-rank-two image would violate the forced generic point. | Agrees on these instances. |
| D10.9 API 6, README:1128 | The full closed two-point subset corresponds to the whole sheaf; ∅ corresponds to the empty sheaf. The closed singleton is excluded from the domain of classification. | Agrees on these instances. |
| D10.9 API 7, README:1129 | For the residue-disc image, both v-closure and weakly generalizing closed closure contain Gauss; ordinary closure does not. | Agrees on these instances. |
| D10.9 API 8, README:1130 | For an open-and-closed component Z of X, closure intersects that component componentwise; Y in the other component gives ∅ on both sides. | Agrees on these instances. |
| D11.1 API 1, README:1262 | For Spd O, a compatible valuation specialization lifts once; for the identity map the extension is fixed and unique. | Agrees on these instances. |
| D11.1 API 2, README:1263 | For Spf O and the formal disc, the integral centre supplied by each valued point extends through the same completed local ring. | Agrees on these instances. |
| D11.1 API 3, README:1264 | The identity and a closed formal component over Spd O have one required lift; the inherited SP has the same count. | Agrees on these instances. |
| D11.1 API 4, README:1265 | An unramified quadratic neighbour has 2 geometric sheets, each with a unique valuative extension; the empty neighbour has no test point. | Agrees on these instances. |
| D11.1 API 5, README:1266 | For the two-point spectrum of a valuation ring, generic→closed is preserved by sp; the reversed direction is not introduced. | Agrees on these instances. |
| D11.2 API 1, README:1291 | Whole analytic disc and open residue disc pass; a small closed rational subdisc fails the partial-proper inclusion condition. | Agrees on these instances. |
| D11.2 API 2, README:1292 | For Spd O, restriction of sp to its one generic point still has value the sole special point. | Agrees on these instances. |
| D11.2 API 3, README:1293 | For Spd O, F^an has one point and is locally spatial and qs, giving a valid pair; empty analytic locus gives empty D. | Agrees on these instances. |
| D11.2 API 4, README:1294 | For a formal O[[q]]-disc, the relative generic fibre omits characteristic-p analytic points but gives the allowed open pair. | Agrees on these instances. |
| D11.2 API 5, README:1295 | Under T↦U², a generic residue a specializes to a² by either pair-map composite. | Agrees on these instances. |
| D11.3 API 1, README:1321 | Spd O has compact one-point sp fibre; doubled origin fails the required separatedness before qc is considered. | Agrees on these instances. |
| D11.3 API 2, README:1322 | For the affine reduced line, the inverse image is the spatial closed disc; for the empty affine, inverse image is ∅, also spatial. | Agrees on these instances. |
| D11.3 API 3, README:1323 | For Spd O the canonical smelted pair has D=Spd F; for a pure special scheme it has D=∅. | Agrees on these instances. |
| D11.5 API 1, README:1361 | Origin completion O[[T]] intersected with the generic closed disc gives the open residue disc. | Agrees on these instances. |
| D11.5 API 2, README:1362 | Origin formal neighbour with its open-disc generic part is smelted; choosing empty S gives the empty pair. | Agrees on these instances. |
| D11.5 API 3, README:1363 | For a rank-two closed point fibre {y}, interior is ∅; for origin in the tft disc interior is its open tube. | Agrees on these instances. |
| D11.5 API 4, README:1364 | The residue disc is open in the closed adic disc; the raw singleton {rank-two closed point} is not open. | Agrees on these instances. |
| D11.5 API 5, README:1365 | Under T↦U², preimage of the origin tube is ∣U∣<1 since ∣U∣²<1 iff ∣U∣<1, equal to the tube of the pulled-back reduction. | Agrees on these instances. |
| D11.8 API 1, README:1427 | For a rank-one point patch closure is the whole point; for two-point rank-two Spa it misses the closed singleton. | Agrees on these instances. |
| D11.8 API 2, README:1428 | The fold of two rank-one points onto one has dense rank-one sets of sizes 2 and 1, so the image is cJ. | Agrees on these instances. |
| D11.8 API 3, README:1429 | An open component of two rank-one points has rank-one set of size 1 equal to itself; ∅ has closure ∅. | Agrees on these instances. |
| D11.8 API 4, README:1430 | A finite étale quadratic cover of a rank-one geometric point splits into 2 rank-one points, hence is cJ. | Agrees on these instances. |
| D11.8 API 5, README:1431 | The free C₂-torsor of two points over one has cJ total/base with patch closures of sizes 2 and 1. | Agrees on these instances. |
| D11.8 API 6, README:1432 | A field point and the tft closed disc have rank-one points in every nonempty rational constructible cell; the rank-two singleton example is not tft over (K,O_K). | Agrees on these instances. |
| D11.8 API 7, README:1433 | The singleton patch open {rank-two point} has 0 rank-one points; this exactly detects the failed predicate. | Agrees on these instances. |
| D11.10 API 1, README:1472 | The C-affine line has the identity tft cover with 1 chart; ∅ has an empty cover. | Agrees on these instances. |
| D11.10 API 2, README:1473 | Base extension sends C⟨T⟩ to C′⟨T⟩, still 1 tft chart and the same coordinate T. | Agrees on these instances. |
| D11.10 API 3, README:1474 | Product of two affine-line charts is C⟨T,U⟩ with 2 coordinates and a single tft chart. | Agrees on these instances. |
| D11.10 API 4, README:1475 | For the C-point and affine line, the rank-one set has patch closure equal to the whole space; the two-rank singleton obstruction does not occur. | Agrees on these instances. |
| D11.10 API 5, README:1476 | A smooth untilt point or disc has relative dimensions 0 or 1 and produces the corresponding finite-type facet cover. | Agrees on these instances. |
| D11.11 API 1, README:1502 | Tft flat disc: three conditions (true,true,true). Pure special line: cJ empty=true and reduction locally noetherian=true, but surjective sp=false. | Agrees on these instances. |
| D11.11 API 2, README:1503 | For Spd O with full analytic part, source and reduced point counts are 1 and 1, so the canonical pair is rich. | Agrees on these instances. |
| D11.11 API 3, README:1504 | For the nonempty pure special field, image cardinality 0 differs from target cardinality 1; richness excludes it. | Agrees on these instances. |
| D11.11 API 4, README:1505 | Origin formal neighbour of a rich formal disc has open-disc source, one-point reduced target and nonempty fibre, retaining richness. | Agrees on these instances. |
| D11.11 API 5, README:1506 | Unramified quadratic neighbour has two geometric special points and a generic point above each after geometric base change, so surjectivity persists. | Agrees on these instances. |
| D11.12 API 1, README:1533 | Normal formal disc has one component per closed tube; the x(x−π) model has two and fails. | Agrees on these instances. |
| D11.12 API 2, README:1534 | At a closed point of the normal disc tube component count is 1 and nonempty; the empty tube has connected=false despite preconnected=true. | Agrees on these instances. |
| D11.12 API 3, README:1535 | Completing again at the unique reduced point of an origin formal neighbour leaves the same one-component open disc. | Agrees on these instances. |
| D11.16 API 1, README:1602 | Spd O meets all structural conditions; the formal q-disc fails formal adicness because its special fibre has q≠0 analytic points. | Agrees on these instances. |
| D11.16 API 2, README:1603 | For Spd O the generic fibre is a spatial point, sp is qc, and SP has one valuative lift. | Agrees on these instances. |
| D11.16 API 3, README:1604 | For Spd O both formulations are true; for the q-disc formal structure condition is false in both formulations. | Agrees on these instances. |
| D11.16 API 4, README:1605 | For pure Spd k both notions of π-adic kimberlite hold with empty generic fibre; flatness is not asserted. | Agrees on these instances. |
| D11.16 API 5, README:1606 | For Spd O, analytic=generic=Spd F and special=red⋄=Spd k; the q-disc violates the first equality and is excluded. | Agrees on these instances. |
| D11.16 API 6, README:1607 | Identity fixes the generic point, special point and sp; composition of two identities gives the same triple. | Agrees on these instances. |
| D11.16 API 7, README:1608 | For Spd O the only closed generic subsets are ∅ and the point; their images are closed. For a proper unramified cover, both geometric special points have closed images. | Agrees on these instances. |
| D11.17 API 1, README:1636 | Spd O is covered by an integral perfectoid valuation extension with surjective generic and special maps; ∅ uses zero charts. | Agrees; general formal input R07 and plus convention R12. |
| D11.17 API 2, README:1637 | O is flat, complete and integrally closed in F, so the criterion gives flat=true; its sp image has one point. | Agrees; general formal input R07 and plus convention R12. |
| D11.17 API 3, README:1638 | O⟨πt,t²⟩ is a flat finite-type completion although nonnormal; finite normalization O⟨t⟩ supplies its cover. | Agrees; general formal input R07 and plus convention R12. |
| D11.17 API 4, README:1639 | For Spd O, image size 1 equals target size 1. For the empty object, 0=0. | Agrees; general formal input R07 and plus convention R12. |
| D11.17 API 5, README:1640 | Proper Spd k has sp image size 0 and target size 1, so does not meet the converse hypothesis; proper Spd O meets it and is flat. | Agrees; general formal input R07 and plus convention R12. |

### Conventions, negative controls and proof-route details

| Statement or convention | Instances | Computed values | Result / change |
|---|---|---|---|
| Characteristic and primes | p=2,3; `F_p[ε]/ε²` | Frobenius fixes F_p, sends ε to 0 for both primes; perfection is F_p in both cases. | No good-prime exclusion. |
| Strict versus weak inequality | π,1 in O; bounded inverse | `v(π)<1`, `v(1)=1`, `v(π⁻¹)>1`; strict ideal contains π and excludes 1, while a ≤1 definition would contain 1. | Same witness checked in D7, D9, D11 and the valuation supplier. |
| Direction of specialization | Spec O | `(0)` specializes to `(π)`; closed singleton is `{(π)}`, not `{(0)}`. | Matches native `Specializes` and both generic-fibre suppliers. |
| Connected versus preconnected | ∅, singleton, two discrete points | Preconnected: true,true,false. Connected: false,true,false. | Empty closed tubes cannot satisfy the connected-tube hypothesis. |
| Total-function degeneracies | Zero ring; unit ideal; empty family | Spec 0=∅; V(1)=∅; empty cover has image ∅ and is surjective exactly for target ∅. | No 0/0, natural subtraction, polynomial-degree convention or out-of-range index is used by a target. |
| Cutoffs/universes | Finite representables; κ-small versus larger arbitrary affine | Two-point sheaf has 2 sections at both κ and λ; a ring of cardinality >κ is not silently an object of the κ-site. | Cutoff extension and its direction retained; no single small site quantifies over every ring in every universe. |
| Finite/infinite residue and coefficient regimes | Unramified O_L/O; ramified `O[√π]`; equal characteristic | Unramified residue degree 2; ramified reduction has nonzero square-zero class; equal-characteristic field has no characteristic-zero completed residue hypothesis. | The mixed-characteristic headlines do not silently extend to equal characteristic; the characteristic-p perfect-scheme layer does apply there. |
| Nonabelian descent data | Constant torsor for C₂; for S₃ | Regular torsor fibres have 2 and 6 elements; relations have 4 and 36 pairs; quotient has 1 class in both cases. | No commutativity enters profinite-torsor descent. An infinite discrete group is not profinite, hence outside the compact torsor supplier contract. |
| Formal-disc topology | `(π,q)` versus `(π)` on O[[q]] | In the first, q is topologically nilpotent; the relative generic fibre is the open disc. The analytic locus also contains π=0,q≠0 points. | D10.2 and AdicSpacesPartIII R2.9 agree; the full analytic locus is never substituted for the relative fibre. |
| Explicit high-rank negative control | K=completion of Q_p(t) for the Gauss valuation; V=preimage of F_p[t]_(t) in O_K | Composite additive values are `v(p)=(1,0)`, `v(t)=(0,1)`. The point with p=0 and t-adic analytic valuation lies in `N_(t≪1)`; generic analytic valuations coarsen to Gauss and give `∣t∣=1`, hence miss that open. | Supplies a concrete V for the existential high-rank Checks in D10.7/D11.17; mere rank alone is not the calculation. |
| Closed-specialization obstruction | Perfect valuation ring with primes `p₀⊊p₁⊊…⊊m`, delete m | Every remaining point specializes further; closed-point count 0. Each initial finite-chain open has finitely many closed subsets and is noetherian. | Refutes only the bare topological inference. A Hahn valuation with value group the lexicographic direct sum of countably many copies of Q over a perfect characteristic-p field realizes such a perfect valuation ring. |
| Weak normality negative control | A=Z_p+pO_L for unramified quadratic L/Q_p | A/pO_L=F_p, normalization residue field F_(p²); generic fibre is L. Any birational universal-homeomorphism intermediate order must have residue F_p, hence lie in A; nevertheless A≠O_L. | Validates the package's correction of AGLR 2.39. Geometric connectedness would distinguish the two conjugate residue embeddings; ordinary connectedness does not. |

The source routes and Needs edges were compared in build order. D7.10 precedes D7.6 despite its larger number, and D11.17 precedes D11.15 for the same reason: both are correctly ordered in the text. D11.15 uses the local analytic connectedness result, not D11.14 to prove its own tube hypothesis. The completed-étale step discards the generic-only component before uniqueness is asserted. The normality proof uses the finite normalization, connected nonempty factors, algebraically closed residue fields and the Jacobson geometric-fibre criterion in that order. These inputs are not conclusions smuggled into arbitrary data. The faults in available ownership and contracts are separately reported above.

## Not verifiable

- **The two unrestricted assertions in R01–R02.** The supplied texts contain the assertions but not the missing arguments identified in the plan. The finite residue theorem, residue-preserving variant and conditional component theorem were examined separately. No counterexample to either unrestricted geometric theorem is claimed.
- **DJ98, p. 175.** The sources service resolved de Jong's erratum only to a paywalled publisher record and added the single new key `DJ98` with status `uncertified`. Its text and the corrected proof step were not read. This settled status is not a missing-text request. The duplicate owner can be verified without reading the erratum.
- **Two relevant board package heads.** The supplied index lists `SchemeAndStackFoundationsPartII` at `accb0a0` and `VStackSheavesAndLisseCategoriesPartII` at `0987ba7`. Both README requests returned HTTP 404 through the connected GitHub reader and through the brief's read-only repository-content request. Their content could not be compared; this is not evidence that they lack an object. Other indexed board packages were not all fetched individually; the full local board tree was searched. Ownership against inaccessible board heads therefore remains limited.
- **Other authors' unspecified local checkout paths.** No filesystem paths for the long list of named sibling pull requests were supplied in the brief. Ownership was checked through the provided `roadmaps` service's current main/open-head index instead. No claim is made about an additional unprovided head or an inaccessible remote revision. All source text among the original eight cache entries was readable, including the cited DJ95 passages despite mathematical OCR imperfections.

No machine paths, credentials, network writes or author-file edits were used in the deliverables. The original README, Suggested.lean, metadata and plan were left unchanged. The source service's add-only DJ98 entry is the sole manifest addition; the original eight entries retain the author's values.

## Source issues

- **Gap** in SW20 at §10.2 before Proposition 10.2.1, p. 77 (SW20 line 3113): the source says characteristic-zero universal homeomorphisms preserve completed residue fields without supplying an argument; it should be justified at the stated analytic generality, beyond the finite separable-degree argument; affects the proof.
- **Error** in SW20 at Lemma 18.3.2, p. 166 (SW20 line 6461): the source says a quasicompact space mapping to a valuation spectrum has a minimal image point; it should be restricted to nonempty source; affects a stated result.
- **Misprint** in SW20 at Remark 21.4.2, p. 195 (SW20 line 7494): the source says flatness and reduced special fibre imply normality; it should be read with the normal generic fibre from the local-model setting; affects a stated result.
- **Misprint** in GLE at Proposition 1.19, p. 9, and Proposition 3.18, p. 25 (GLE lines 451 and 1271): the source says the reduced pair uses the displayed quotient of the original plus ring; it should be the integral closure of its image in the ambient quotient by the generated topologically nilpotent ideal; affects a stated result.
- **Misprint** in GLE at Proposition 2.36, p. 22 (GLE line 1091): the source says a schematic closed subset is supported on an open prime ideal; it should be an arbitrary open ideal; affects a stated result.
- **Misprint** in GLE at Proposition 4.8(4), p. 29 (GLE line 1437): the source says quasiseparated diamonds cannot be v-formalizing; it should be restricted to nonempty quasiseparated diamonds; affects a stated result.
- **Error** in GLE at proof of Lemma 4.25, p. 33 (GLE line 1638): the source says étale reduction data have a unique ordinary étale lift; it should be uniqueness after the specified completion, which removes generic-only components; affects the proof.
- **Misprint** in GLE at proof of Proposition 4.41, p. 36 (GLE line 1761): the source says the partial-properness argument runs from F to the Heuer sheaf of G's reduction; it should be the composite from G through F's specialization, then the separated-target argument for G's own specialization; affects the proof.
- **Misprint** in GLE at Proposition 4.45, p. 36 (GLE line 1789): the source says the constructible subset belongs to the underlying space of F; it should be a subset of the underlying reduction space; affects a stated result.
- **Gap** in GLE at proof of Lemma 4.55, p. 38 (GLE line 1885): the source says a common specialization can be chosen closed; it should be justified from additional kimberlite structure or an explicit closed-specialization hypothesis; affects the proof.
- **Error** in AGLR at Proposition 2.39, pp. 18–19 (AGLR line 1044): the source says connected closed-point tubes imply normality over an arbitrary perfect residue field; it should be restricted to algebraically closed residue field for this argument, or strengthened with geometric connectedness and its proof; affects a stated result.
- **Misprint** in LOU17 at proof of Corollary 6.6, p. 18 (LOU17 line 648): the source says formal functions equal all analytic functions on the generic fibre; it should be the bounded integral analytic functions; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "fc307b1d03fbe73b7e282a7787dca493f1842fc3", "job": "REV-PKG-DiamondsAndVStacksPartII", "model": "gpt-6-astra", "worker": "chris-8"} -->
