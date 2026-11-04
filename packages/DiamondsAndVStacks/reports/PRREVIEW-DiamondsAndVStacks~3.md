# Review of DiamondsAndVStacks (pull request #820 at 45a9638)

**Verdict:** needs changes

## R01 (P2) — The acceptance test still imports a roadmap

**Location.** `TauCetiRoadmap/DiamondsAndVStacks/Suggested.lean:8`: “import TauCetiRoadmap.PerfectoidSpaces.Suggested”. The module docstring at line 14 explicitly includes that roadmap among its foundations.

**Claim.** The gate fails `imports=1`. Perfectoid-space and perfectoid-ring headlines use a supplier roadmap’s proposed carriers, contrary to the pinned-library acceptance-test rule. Previous R01 is **not repaired**.

**Witness.** `Perfd`, `isAffinoidPerfectoid` and `IsPerfectoidTateRing` come from `TauCetiRoadmap/PerfectoidSpaces/Suggested.lean`, not the pinned libraries. Removing the import requires removing the signatures that use these carriers.

**Repair.** Delete that import and the corresponding `open`. Remove the perfectoid-dependent declarations from the acceptance test; name affinoidness, automatic flatness, v-subcanonicity, function descent and affinoid v-cohomology in its docstring with the missing perfectoid carriers. Keep their full statements in the README. Retain only native-carrier definitions needed for retained headlines; also delete `vPrecoverage` if no retained headline needs it. Update the README's description of imports at lines 345–348. A scratch copy with the import and dependent blocks removed was elaborated to test this route; it does not require weakening the mathematical targets.

## R02 (P3) — Three boundary examples remain in the acceptance test

**Location.** `TauCetiRoadmap/DiamondsAndVStacks/Suggested.lean:150`, `:270`, `:353`: “example : ¬ IsCutoffCardinal Cardinal.aleph0”, “Subsingleton ((structurePresheaf p).obj …)”, and “IsEmpty (BerkovichSpectrum R 0)”.

**Claim.** These cutoff, empty-space and zero-normalizer Checks are not headlines. Previous R02 is **not repaired**: the Lean file is unchanged.

**Witness.** The examples compute, respectively, false from `ℵ₀ < ℵ₀`, the one-element section ring on the empty space, and an empty seminorm space from `0 = 1/2`. All three already elaborate with proofs.

**Repair.** Delete them from `Suggested.lean`, including their Check comments. Keep the three mathematical Checks in the README. 

## R03 (P3) — Correct the inverse-topology locator in both files

**Location.** `TauCetiRoadmap/DiamondsAndVStacks/README.md:1005`: “([Hoc69] Proposition 8, p. 52, the source of these properties”; `Suggested.lean:66`, `:72`, `:77`, `:83` still attribute the comparison theorems to KL15 Definition 8.1.4.

**Claim.** Previous R03 is **not repaired**. Proposition 8 is on printed page **54**, not 52; KL15's definition names the dual topology but does not state this collection of comparison theorems.

**Witness.** Hoc69 line 468 marks page 54; lines 476–484 establish spectrality, order reversal and equality of patch topologies. Involutivity and the map criterion follow from complementary compact-open bases.

**Repair.** Cite Hoc69 Proposition 8 and its proof, printed page 54, in both files; identify the last two assertions as consequences of the compact-open description. On the DVR spectrum the opens `∅,{η},X` become `∅,{s},X`, then return to `∅,{η},X`; both patch topologies are discrete. 

## R04 (P3) — ECD 11.3 does not state the general stack descent claim

**Location.** `TauCetiRoadmap/DiamondsAndVStacks/README.md:2062` and `:2069`: the atlas relation cites “Proposition 11.3(ii)”, and category-valued quotient descent cites “Proposition 11.3(iii), p. 54”.

**Claim.** ECD 11.3 concerns pro-étale equivalence relations of perfectoid spaces. Its third part concerns replacing a presentation. It is not the claimed universal property of arbitrary sheaf groupoids with category-valued targets. Stacks 044U states the groupoid-valued version.

**Witness.** ECD lines 2236–2244 give the diamond presentation statements. Stacks stackification, Tag 044U, lines 1360–1385 of the groupoids-in-algebraic-spaces chapter, assumes a target stack in groupoids.

**Repair.** Use SchemeAndStackFoundations §§1.18 and 1.21 for the generic relation and universal property. Explain the category-valued extension through §1.18's `Stack.stackificationUniversal`, identifying functors from the presenting groupoid with descent data, including modifications. Keep ECD 11.3 for D4's geometric specialization. For the point site and the one-object groupoid of ℤ, descent includes a chosen automorphism; for target `[1]`, modifications can be noninvertible. 

## R05 (P3) — Remove the catalogue of undeclared own Lean names

**Location.** `TauCetiRoadmap/DiamondsAndVStacks/README.md:350`: own carriers and theorems are called “suggested names for targets specified in this README only”; at `:2070`, `Stack.quotient_descent` is one such name, and at `:2080` a Check is labelled `s0_26_free_discrete_quotient`.

**Claim.** Own backticked API names must be declared in `Suggested.lean`; Checks must be prose. The catalogue convention violates both rules. Adding the entire catalogue to Lean would violate the acceptance-test rule too.

**Witness.** The Lean file has 47 named declarations. Neither of the two example names occurs as a declaration. The general naming convention remains at README lines 350 and 936; changing two local descriptions does not remove it.

**Repair.** Express the own README-only API and Checks in prose, keeping the defined mathematical objects, signatures, hypotheses, locators and computations. Preserve actual library/supplier names and the names of retained Lean declarations. For example, the free-action Check still computes trivial stabilizers and quotient `X/G` after its invented identifier is removed. Delete the conflicting catalogue convention.

## R06 (P3) — One obsolete supplier namespace remains

**Location.** `TauCetiRoadmap/DiamondsAndVStacks/README.md:769`: “`AdicEtaleGeometry.YonedaAdicSpace` (a target of its §A1.16)”.

**Claim.** Previous R06 is **not repaired**. This spelling does not name the supplier's proposed geometric namespace.

**Witness.** `TauCetiRoadmap/AdicEtaleGeometry/README.md:175` places `YonedaAdicSpace` and `CAff` under Tau Ceti's root namespace. The contract at this roadmap's line 819 already uses that spelling.

**Repair.** Write `YonedaAdicSpace`, attributed to AdicEtaleGeometry §A1.16, consistently with line 819. This is a name repair: the affine comparison still sends the chosen complete pair to its Yoneda spectrum, including its chosen plus ring.

## Verified sound

**Previous review, checked first.** Against the supplied second review, all six findings persist. No supplied repair report marks any finding “not actionable in this package”. The two changes since that reviewed head affect only README descriptions at lines 2544 and 4683; `Suggested.lean` is unchanged.

| Previous finding | Passage at this head and disposition |
|---|---|
| R01 | Lean 8: “import TauCetiRoadmap.PerfectoidSpaces.Suggested”. **Not repaired**. |
| R02 | Lean 150, 270, 353 retain the three proved `example` declarations. **Not repaired**. |
| R03 | README 1005: “Proposition 8, p. 52”; Lean 66 still cites “Definition 8.1.4”. **Not repaired**. |
| R04 | README 2069: “Proposition 11.3(iii), p. 54”. **Not repaired**. |
| R05 | README 350 retains “suggested names for targets specified in this README only”; 2544 now says “These are prose Checks only”. **Partly repaired locally**, catalogue and undeclared identifiers remain. |
| R06 | README 769 retains “AdicEtaleGeometry.YonedaAdicSpace”. **Not repaired**. |

**Gate, build and scope.** Head verified; worktree clean; outside-folder diff empty. This is a new roadmap, not a re-planning. I read README/CONTRIBUTING and compared main's PerfectoidSpaces, AdicSpacesPartII and SchemeAndStackFoundations. All seven layers have Examples/Dependencies. No algorithm, sorry'd data body, `set_option`, stray source or outside edit was found.

The worker's gate at this head is **FAIL**: `imports=1`, `build=0`, and every other listed rule is zero. The sole diagnostic is the roadmap import in R01. Successful elaboration does not make that import permitted.

I built the missing pinned module `TauCeti.Topology.Spectral.ProConstructible`, then ran the prescribed `lake env lean` elaboration of the target: success, with only 31 `sorry` warnings. A scratch signature file checked all **47 named declarations** (31 theorems, 14 definitions, two abbreviations). Both anonymous instances and all three proved examples also elaborated. The flatness signatures retain completeness, Hausdorffness, continuity, plus preservation and the pseudouniformizer; the limit theorem retains both systems' spectral transition maps; the seminormal bijectivity theorem retains reducedness of the target. No additional dropped binder was found. A native-only scratch copy, deleting the roadmap import and dependent blocks, also elaborated with only `sorry` warnings; this validates R01’s repair route. The two cohomology signatures now use objectwise `Sheaf.H'`, the small-site assumption and the larger Ext universe.

All **31** admitted theorems resisted `simp`, `rfl` and `infer_instance` in a scratch copy. Object searches found no direct pinned replacement. `Sheaf.H.equiv₀` concerns a terminal object, not arbitrary-object `H'`. The three boundary examples remain R02 despite their proofs.

**Dependency check output.**

```text
depcheck: 163 roadmaps, 1177 edges, 0 problem(s)
```

No UPWARD or CYCLE line. I read the `Needs` lines and supplier contracts. PerfectoidTowers, subsequent diamond cohomology and six-operation roadmaps are consumers, not inputs. Chart smallness and cardinal cutoffs remain distinct: increasing κ does not make a large field `Small.{0}`.

**Pinned declarations opened and compared by object.** Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Pinned file and line | Declaration/content and consequence |
|---|---|
| `Mathlib/Topology/Separation/Regular.lean:811` | `ConnectedComponents.t2` assumes compact Hausdorff X. It does not subsume the spectral, possibly non-Hausdorff theorem here. |
| `Mathlib/Topology/Separation/Hausdorff.lean:413` | `t2Setoid`, followed by `T2Quotient` and its lift, supplies the Hausdorff reflection; it does not identify that reflection with normalized seminorms. |
| `Mathlib/CategoryTheory/Sites/Equivalence.lean:215` | `hasSheafifyEssentiallySmallSite` supplies the instance now used at Lean line 298. |
| `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:69` | `cohomologyPresheafFunctor` is Ext from the free abelian sheaf on a representable; `H'` at line 84 is objectwise, whereas `H.equiv₀` at line 102 uses a terminal object. |
| `TauCeti/Topology/Spectral/ProConstructible.lean:112` | `IsProConstructible` is closedness in the constructible topology. Spectral-map continuity is at 189, compactness at 250, the subtype spectral map at 308 and spectrality at 365. These are inputs, not locally redefined predicates. |
| `TauCeti/RingTheory/Huber/Basic.lean:165` | `IsPseudoUniformizer` includes a unit and topological nilpotence; `IsTateRing` at 192 does not supply completeness or Hausdorffness. The main Berkovich and flatness signatures explicitly add them. |
| `TauCeti/RingTheory/Huber/Pair.lean:138` | `Pair` retains the chosen ring of integral elements. Replacing it silently by all power-bounded elements would lose the rank-two Check. |
| `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean:101` | `spa` requires continuity and the bound on the supplied plus ring; it alone assumes neither Huber nor Tate nor separation. |
| `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Completion/Homeomorph.lean:93` | `spaCompletionHomeomorph` uses `completionPlus`; its valuation-pullback formula is at 101. D6 adds the marked-untilt comparison, not another spectrum-completion theorem. |
| `TauCeti/RingTheory/Huber/Padic/Basic.lean:104` | `PadicInt.not_isTateRing` distinguishes integral `Spd ℤ_p` from Tate-pair `Spd`. |
| `TauCeti/Topology/Sheaves/Flasque.lean:156` | `subsingleton_H_succ_of_isFlasque` supplies higher vanishing after flasqueness; it does not prove a constant sheaf is flasque on an irreducible space. |

**Ownership and supplier resolution.** Object searches used `roadmaps grep`, main, supplied open checkouts and board packages; no duplicate fully qualified declaration was found in checked files. Main-roadmap revisions are not new suppliers. Resolved contracts:

| Supplier and repository-relative locator | Contract checked |
|---|---|
| `TauCetiRoadmap/AdicSpacesPartII/README.md:7466`, §§R0.19.1–R0.19.8 | Constructible/pro-constructible topology, generalizing quotients, spectral limits and finite-stage opens. |
| Same file `:7793`, §R0.19.9; `:8005`, §R0.19.10 | Generic pro-category and Hom formula; generic qcqs object/map predicates and algebraic topoi. Bounded presentations and the cohomological comparisons here are the retained variants. |
| `TauCetiRoadmap/PerfectoidSpaces/README.md:5134`, `:5230` | P1.26/P1.28 are **field-scoped** almost deformation results. D3.3 states its own totally disconnected-base application instead of pretending these prove an arbitrary-base version. |
| Same file `:7322`, `:7570`, `:9830`, `:10782`, `:11434` | P2.12 tilting, P2.16 fibre products, P3.19 étale vector-bundle descent, P4.12 closed geometry and P4.19 separatedness. |
| Same file `:12094`, `:12144`, `:12394` | P5.6 countable perfectoid hulls, P5.7 uniform size bounds and P5.12 finite-stage étale descent. |
| Same file `:13849`, `:13948`, `:14039`, `:14101`, `:14548`, `:14654`, `:14903`, `:15006` | P6 smallness predicates and closure, bounded affinoid pro-objects, pro-étale limits and stability. |
| Same file `:15153`, `:15178`, `:15287`, `:17284` | Continuous-function rings, the analytic perfectoid torsor record, its existence and the rigid pro-étale perfectoid basis. P6.17 explicitly assigns the v-sheaf statements to D6; its mention of this roadmap is an output interface, not a reverse proof dependency. |
| `TauCetiRoadmap/AdicEtaleGeometry/README.md:4752`, `:5886`, `:9246`, `:9428`, `:9541`, `:9605`, `:9818` | A1.12, A1.16 and A4.2–A4.5/A4.7 supply the sites, Yoneda-adic carrier and completed torsor towers. R06 concerns only a remaining spelling. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2745`, `:2951` | §§1.18/1.21 supply generic category-valued stackification, two-fibre products and groupoid quotients. The former explicitly includes modifications in its universal property. |
| Same file §§2.1–2.3, `:3388` §2.5, `:5472` §4.9 | Leray/Čech, torsor classes, coherent-site filtered colimits and proper Noetherian Stein factorization. D6 does not infer `f_*O=O` from seminormality alone. |
| `TauCetiRoadmap/RigidAnalyticGeometry/README.md:177`, `:205`, `:690` | Noetherian/excellent affinoids, finite-module topology and relative analytification with completed local comparisons. |
| `TauCetiRoadmap/AdicSpacesPartIII/README.md:9870`, `:11218`, `:12470` | Coherent kernels, proper relative GAGA and the general bounded Gel'fand spectrum. D5.13 adds the normalized Tate comparison. |
| `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:841`, `:873`, `:922`, `:944`, `:966`, `:981`, `:1017` | §§7.1–7.8: regular pullback, formal reduction, algebraization, thick-fibre comparison, strong resolution and the algebraic affinoid specialization. Analytic comparison remains D6.9's target. |

`packages/ArcTopologyAndDescent/design/README.md:386` also defines spectral submersions, but cites this roadmap at line 416. DiamondsAndVStacks remains the earlier owner; that consumer should import it. `TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:128` explicitly imports this roadmap’s normalized `Spa` comparison. The supplied AnalyticStacks head does not claim that construction. Ownership against index hits with no supplied checkout was **not checked**; no finding relies on them.

**Headline inventory.** End results: analytic étale-site equivalence (D6.5); v-subcanonicity, function descent and affinoid v-acyclicity (D2.7–D2.8); seminormal rigid full faithfulness (D6.9). Deep intermediates: spectral quotients, Hochster duality/realization, split-cover criterion, affinoidness/automatic flatness, disconnected covers, cutoff independence, effective descent, diamond presentations, spatial permanence/finite-stage comparison, Berkovich/Hausdorff comparison, integral Galois quotient and affine seminormal reflection. Native topology, cardinal, seminorm and ring headlines have signatures. The docstring names the missing geometric end results; imported perfectoid-dependent headlines need the same treatment under R01. No additional statable deep headline was identified as absent.

**Seeded sources: 15/15 targets checked.** No explicitly unverified locator was found. All bibliography fetches used the sources service; Huber96 remained uncertified. ECD is arXiv 1709.07343v4; Sch12 is the fetched author preprint; Berkeley is the 27 March 2020 author manuscript. Numbering below was compared with the linked texts. Derived universe/closure claims were checked as derivations, not misrepresented as verbatim source theorems.

| Sample target and README locator | Source text and hypothesis comparison |
|---|---|
| Spectral submersions, D0.11, 1179 | Arc lines 464–479, Definition 2.14/Remark 2.15, p. 12; spectrality, surjectivity and compact-open reflection retained. Limit argument: lines 495–518, Lemma 2.17, pp. 12–13. |
| Ordinal assembly, D0.14, 1285 | ECD lines 2606–2642, Lemma 11.22 proof, pp. 63–64, and 3056–3087, Lemma 12.17 proof, pp. 74–75. README supplies the intermediate assembly construction; it does not assert every cofiltered category has a cofinal ordinal. |
| Flasque constant sheaves, D0.20, 1618 | Stacks constant sheaves lines 1546–1551, Tag 02UW, p. 34. Irreducibility makes restrictions between nonempty opens identities; empty target sections are zero. |
| Closure and resizing of the charted carrier, 3284 | ECD lines 814–838, Definition 4.2/Remark 4.3/Proposition 4.4, pp. 20–21; lines 741–755, §§3.18–3.20, pp. 18–19; Sch12 lines 1865–1875, Proposition 6.18, p. 38. Finite rational-chart covers, completion and tensor-product arguments support the local universe closure. Singular-cardinal overclaims in ECD 4.4 are not used; see Source issues. |
| Geometric carrier Checks, 3392–3550, 5552–5590, 6703–6728 | ECD §§3, 10–12: lines 741–755, 2048–2070, 2236–2253. Chosen plus rings, actual lifted objects and the kernel relation are retained; the verified supplier contracts provide the geometric carriers. |
| Reconstruction over a totally disconnected base, 4711 | ECD lines 1819–1837, Proposition 9.3 proof, p. 44; Sch12 lines 949–970, Definition 5.1/Theorem 5.2, pp. 21–22. Flatness, Frobenius isomorphism, compatible roots and completeness are retained. The field theorem is not cited as an arbitrary-base theorem: extension/gluing over this base is an explicit target. |
| Pro-étale implies quasi-pro-étale, 5027 | ECD lines 2052–2070, Convention 10.2 and paragraph before Proposition 10.3, p. 50. Local separatedness is retained; the converse requires a strictly totally disconnected target. |
| Smallness of finite-subset indices, 7162 | ECD lines 2691–2707, proof of Proposition 11.24, p. 65, uses finite subsets. The universe equivalence is the README’s elementary derivation using singleton identity arrows, not a claim that ECD states Lean `Small`. |
| Two-out-of-three, 7326 | ECD lines 2806–2830, Proposition 11.30, pp. 68–69. Locally spatial objects, surjective first map and separated second map are retained, with the étale/finite étale refinements. |
| Spatial v-sheaf recognition, 7609 | ECD lines 3095–3155, Theorem 12.18, Remark 12.19 and Proposition 12.20, pp. 75–76; Berkeley lines 5958–5976, Theorem 17.3.9, pp. 154–155. Spatiality and point-covering quasi-pro-étale maps retained. |
| Representability descends, 7754 | ECD lines 3162–3205, Propositions 13.2(iii), 13.4(iv)–(v), pp. 77–78. Pro-étale surjections are distinguished from arbitrary v-covers. |
| Hausdorff/Berkovich homeomorphism Checks, 8097 | ECD lines 3261–3289, Definition 13.7–Proposition 13.9, p. 79. Source is perfectoid; the README’s general complete Tate version explicitly adds the Tate norm/rank-one route. Normalization is 1/2, with nonzero pseudouniformizer. |
| Descent of marked untilts, 8741 | ECD lines 3653–3695, Lemma 15.1 and proof, pp. 89–90. Prime, primitive ideal, fixed marking and v-cover remain part of the statement. |
| Smallness of X^◇, 9177 | ECD lines 1632–1655, Proposition 8.2 proof and following remark, pp. 39–40; Berkeley lines 6217–6228, §18.1/Lemma 18.1.1, p. 161, gives sheafiness. Uniform size bound and continuous-factorization proof are separate README targets. |
| Formal comparison for resolution, 9495 | Temkin-resolution lines 687–706, §§2.4.9–2.4.11, p. 15; 844–859, Theorem 3.1.5, p. 18. Rig-regularity, locally principal formal varieties and compatible regular maps are retained; supplier §§7.1–7.4 contain these interfaces. |

Additional source checks: Hoc69 lines 468–484 (R03); ECD lines 2236–2244 and Stacks stackification lines 1360–1385, Tag 044U (R04); ECD 7.2/7.12, GLX 3.2, KL16 8.1.4/8.2.3, SGA 4 VI 8.7.7–8.7.8 and ECD 4.4 (errata below). 

**Selected computed adversarial cases: 133 rows.** The table retains the seeded targets, headline evidence and finding witnesses from the 226-row pass; routine per-target rows are omitted. `S={η,s}` has opens `∅,{η},S` and specialization `η→s`. `C` is a complete algebraically closed perfectoid field; `K` a complete characteristic-zero nonarchimedean field for rigid geometry. “✓” records consistency of the computed instance, not a proof of the universal theorem. Perfectoid-carrier rows remain subject to R01.

| D0 statement | Instance | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| `inverseTopology` | S; infinite discrete ℕ | S: opens become ∅,{s},S; ℕ: complements of finite sets generate the cofinite topology | ✓ | R03 locator |
| `spectralSpace_inverseTopology` | S | η→s originally; s→η in the dual; both finite T₀ topologies are spectral | ✓ | R03 |
| `inverseTopology_inverse` | S | ∅,{η},S → ∅,{s},S → ∅,{η},S | ✓ | R03 |
| `inverseTopology_constructible` | S | Both patch topologies have all four subsets open | ✓ | R03 |
| `inverseTopology_map` | Identity; endpoint swap on S | Identity preserves compact opens in both; swap fails continuity in both | ✓ | R03 |
| Profinite components | S; two discrete points | π₀(S)=1, compact Hausdorff; π₀(2)=2 discrete | ✓ | — |
| Pro-constructible quotient T₀ | Diagonal and universal relations on S | Quotients S and 1 respectively; saturation distinguishes points only in the first | ✓ | — |
| Spectral quotient criterion | Diagonal; universal relation; empty X | Quotients X, 1 (X nonempty), ∅; preimages of their basis opens are compact | ✓ | — |
| Quotient basis hypothesis | Profinite presentation of [0,1] | Quotient has only ∅ and [0,1] compact open; these do not form a basis at 1/2 | ✓ | — |
| Open spectral quotient | Finite discrete two-sheeted cover | Invariant opens are unions of fibres; quotient opens and compact opens coincide | ✓ | — |
| `IsSpectralSubmersion` | Patch S→S | Preimage of {s} is compact open, but {s} is not open in S; predicate false | ✓ | — |
| Constructible criterion | Same patch map | {s} is patch-clopen on target and already detects failure; both formulations false | ✓ | — |
| Composition of submersions | 4→2→1 discrete quotient maps | Composite has fibre size 4; inverse images of both target opens are compact open | ✓ | — |
| Limit of submersions | Drop first bit {0,1}ⁿ⁺¹→{0,1}ⁿ; transitions drop last bit | Limit is shift with 2-element fibres; an n-cylinder pulls back to two (n+1)-cylinders | ✓ | — |
| Ordinal assembly | Countable reversed natural-number index | Constant full stages exhaust all objects/arrows; a constant singleton stage misses arrow 2→1 | ✓ | — |
| Hochster realization | ∅, point, S | Spectra of zero ring, field, DVR have respectively 0,1,2 points with the required orders | ✓ | — |
| Closed-relation Hausdorff quotient | Cantor→[0,1] | Kernel is closed; quotient is [0,1], compact Hausdorff though not spectral | ✓ | — |
| Filtered sections/cohomology | Point with coefficients ℤ/2ⁿ under ×2 | Both degree-zero colimits are the Prüfer 2-group; both higher groups are 0 | ✓ | — |
| Quasicompactness requirement | Discrete ℕ, finite-support subsheaves | Colimit of global sections is ⊕ℕ ℤ; global sections of colimit are ∏ℕ ℤ; (1,1,…) lies only in latter | ✓ | — |
| Flasque constant sheaf | S, coefficient A | Nonempty opens carry A and restriction A→A is identity; restriction to ∅ is A→0, surjective | ✓ | — |
| Coherent-topos limit cohomology | One-stage point topos | Limit equals point; both H⁰=A and Hⁿ=0 for n>0 | ✓ | — |
| Noninvertible coefficient transition | Point diagram ℤ→ℤ by ×2 | Colimit coefficients and H⁰ are ℤ[1/2]; requiring invertibility would wrongly exclude the diagram | ✓ | — |
| `IsCutoffCardinal` | 0, ℵ₀, ℶ_ω | 0 and ℵ₀ fail uncountability; ℶ_ω has cofinality ℵ₀ and fails the cofinality clause | ✓ | R02 removes Lean Check |
| Cofinal cutoff existence | Successive strong-limit closure as ECD 4.1 | Set κ₀>λ, κᵢ₊₁=ℶ_(κᵢ⁺), continuously to ω₁: κ=sup κᵢ has cf κ=ℵ₁; cf κᵢ₊₁=κᵢ⁺ gives arbitrarily large cofinalities below κ | ✓ | — |
| Singular cutoff cover bounds | κ singular, cf κ=ω₁; discs over fields with sizes λᵢ cofinal in κ | Number of charts ω₁<κ and each size λᵢ<κ, but union has at least sup λᵢ=κ points; uniform bound fails | Source false | Use supplier P6.3 uniform bound |
| Two-fibre product | *→BG←*, G=C₂ or S₃ | Objects are G, hence 2 or 6; strict pullback has one object | ✓ | R04 attribution |
| Category-valued fibre product | [1]→1←1 | Result is [1], with one noninvertible arrow; groupoid-only replacement loses it | ✓ | R04 |
| Quotient relation | Pair groupoid on two points | Quotient is 1; relation and fibre square both have four elements | ✓ | R04 |
| Quotient is a sheaf iff stabilizers trivial | Free C₂ action on 2; trivial action on 1 | First quotient is 1 with stabilizer 1; second is BC₂ with stabilizer C₂ | ✓ | R04/R05 |
| Category-valued quotient descent | Bℤ into Bℤ; Bℤ into [1] | First remembers homomorphism 1↦m for every m∈ℤ; second admits noninvertible modifications between constant objects | ✓ | R04 |
| Boolean restriction fixture | Proper arrow and identities | Proper map true↦false, false↦true; identity fixes both; constant false fails identity at true | ✓ | R05 labels |

| D1 statement | Instance | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| `OpenCoversSplit` | S; infinite discrete set | S cover must contain S, giving a constant choice; singleton cover of discrete set has identity choice | ✓ | — |
| qcqs in total disconnectedness | Infinite discrete union of fields | Split covers=true but compactness=false; total-disconnected-perfectoid predicate=false | ✓ | — |
| Split-cover iff unique closed point | S; three-point fork η→a,η→b | S: one closed point and splitting; fork: two closed points and cover {η,a},{η,b} cannot split continuously | ✓ | — |
| Split-cover cohomology/epi criterion | Finite discrete 2 | Epimorphisms are componentwise surjective; Γ is product of two surjections; Hⁿ=0 for n>0 | ✓ | — |
| Erroneous finite-colimit variant | Same discrete 2 | Γ(1⊔1) has 4 elements; Γ(1)⊔Γ(1) has 2 | Source false | Keep epi formulation |
| Totally disconnected implies affinoid | Two field components; empty space | Global rings C×C and 0; spectra have 2 and 0 components respectively | ✓ | R01 for Lean |
| Automatic integral flatness | Identity; split two-sheet cover | Mod-ϖ maps A→A and A→A² have free ranks 1 and 2 | ✓ | R01 for Lean |
| Faithfully flat refinement | Empty source; nonempty identity | A→0 is flat but not faithful for A≠0; identity is faithfully flat | ✓ | R01 for Lean |
| W-local adjunction direction | Counit on S | Three-point w-local space maps to two-point S; Hom from w-local W is represented on the right | ✓ | Source misprint only |
| Geometric w-localization Checks | Rank-two field spectrum S | Point fibres have sizes 2 and 1 as above; a two-point identity construction misses the second η-lift | ✓ | — |
| Universally open strict cover | C; empty base | Identity C→C is an admissible cover; empty base has empty cover space | ✓ | — |
| Topological classification | Base Spa(C), profinite S₀ | Geometric product has points S₀; component pullback over the one-point base is S₀ | ✓ | — |
| Chosen plus-ring carrier | C⁺ preimage of proper residue valuation ring V | 1,ϖ∈C⁺; a unit lifting a∉V is in O_C but not C⁺ | ✓ | — |
| Affine ring/pair projections | Same C,C⁺ | Ring projection=C; pair projection retains C⁺, not O_C | ✓ | — |
| Chart and Hom universe lifts | Two-point chart | Object still has 2 points; Hom lift wraps each morphism once without identifying distinct maps | ✓ | — |
| Small-chart restriction | Field of cardinality outside universe 0 | Its spectrum can have one point, yet its section field is not Small.{0}; chart predicate fails | ✓ | — |
| Chart coproduct closure | Empty, singleton, two affine charts | Underlying coproduct has 0,1,2 summands; restriction to each summand recovers its own ring | ✓ | — |
| Affine map direction | Swap C×C | Ring swaps factors and spectrum swaps the two points; identity fixes both | ✓ | — |
| Tilting comparison | Characteristic-p perfectoid field | Tilt is the same perfect field; valuation comparison is identity, with the chosen plus ring retained | ✓ | — |
| Chart resizing iff | Affine C in Type 0; one-point field L not Small.{0} | C and Spa(C) are small, so both sides true; L has one point but its section ring is large, so both sides false | ✓ | — |
| Charted pullback/tilt/étale closure | Two field factors; characteristic-p field; n-sheet finite étale cover | Tensor chart is formed in Type 0; tilt of perfect field is itself; rings Cⁿ stay small for n=0,1,2 | ✓ | — |
| Chartedness under large étale versus pro-étale maps | Type-indexed coproduct; product with Type→Bool | Coproduct charts each have ring C, although points are large; compact product has non-small point set and cannot have finitely many small charts | ✓ | — |

| D2 statement | Instance | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| `vPrecoverage` | Same finite covers | A compact open point is image of one sheet; image union for empty family is ∅ | ✓ | — |
| Generic precoverage does not imply point surjectivity | Topological ℚ | Every compact open is ∅; empty family satisfies the condition although ℚ is nonempty | ✓ | Keep perfectoid hypotheses |
| Singleton v-cover iff surjective | Two points→point; ∅→point | Both properties true for first, both false for second | ✓ | R01 for Lean |
| `perfdToTop` and v-topology | Identity field spectrum | Map is identity on valuations; identity presieve covers and generates maximal sieve | ✓ | R01 |
| `PerfdKappa` | Finite-size object; too-large field | Bound holds for first; fails once ring cardinal ≥κ, even with one topological point | ✓ | R01 |
| κ-site sheafification | One-object point site, two-element sheaf | Transport and sheafification return 2 sections; unit and counit each fix both elements | ✓ | R01 |
| Cutoff independence | κ=κ′; enlargement with same representable | Restriction/extension unit is identity in first; sections on the fixed representable stay its original set | ✓ | — |
| `structurePresheaf` | Spa(C), disjoint union of two, ∅ | Values are C, C×C and 0; pullback along a component is its coordinate projection | ✓ | R01/R02 |
| Function v-descent | Split cover C→C×C | Equalizer of two maps to C⁴ consists exactly of diagonal pairs (a,a), hence is C | ✓ | R01 |
| v-subcanonicity | Same split cover, target Z | Two local maps glue iff equal on overlap; resulting global map is unique | ✓ | R01 |
| Additive structure sheaf | Same split cover | Equalizer of additive groups is diagonal C; forgetting multiplication does not add matching sections | ✓ | R01 |
| H⁰ of structure sheaf | Affinoid field; empty object | Both sides are (C,+); empty case both 0 | ✓ | R01 |
| Positive v-acyclicity | Affinoid field; n=0 in n+1 | H¹=0, while H⁰=C≠0; index n+1 excludes the false zero-degree assertion | ✓ | R01 |
| Integral almost acyclicity | Almost module killed by every element of the almost ideal | Its almostification is 0; ordinary module can remain nonzero | ✓ | Keep almost qualifier |
| Vector-bundle comparison | Ranks 0,1,2 over C | Both sites give zero, C and C²; automorphisms at rank 2 are GL₂(C), not merely scalar units | ✓ | — |

| D3 statement | Instance | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Morphism v-descent | Split two-sheet cover of X | Compatible pair (f₀,f₁) has f₀=f₁; global Hom equals its matching equalizer | ✓ | — |
| Totally disconnected-base reconstruction | Identity and Galois field cover L/K | Identity reconstructs R; in Galois case (L)^G=K and overlap ring is ∏_G L | ✓ | — |
| Almost-perfectoid reconstruction | Base K₁×K₂ and reductions B₁×B₂ | Idempotents (1,0),(0,1) split both reduction and reconstruction; identity reconstructs K₁×K₂, zero reconstructs 0 | ✓ | — |
| Frobenius hypothesis for reconstruction | Ordinary polynomial reduction B=k[T], perfect k | Frobenius image=k[Tᵖ]; T is missing for p=2 and 3, so this wrong model is excluded | ✓ | — |
| Pro-étale implies quasi-pro-étale | Identity, two sheets, empty source over strict point | Strict-base pullbacks have respectively 1,2,0 sheets, all pro-étale; proper algebraically closed extension is v-cover but not pro-étale | ✓ | — |
| Effective affinoid descent | Empty source over empty base; split two sheets | Descended rings 0 and R respectively; arbitrary unrelated overlap maps are not descent data | ✓ | — |
| Separated pro-étale descent | Finite split sets over C | Matching n-sheet covers descend to n sheets; diagonal remains a closed finite subset | ✓ | — |
| Separated étale/finite étale stacks | Degree 0,1,2 covers | Descent preserves degrees 0,1,2; degree 2 object retains the swap automorphism | ✓ | — |
| Continuous-map v-sheaf | Split cover X⊔X→X | Matching continuous maps (f,f) descend uniquely to f, for arbitrary target topology | ✓ | R01 for Lean |
| Locally profinite torsor | Trivial S₃-torsor over point | Six sheets; orbit quotient has one point; transition g,h acts by gh, not hg | ✓ | — |
| Torsor relation and geometric carriers | G=C₂, two points | Relation has four arrows and fibre square has four points; diagonal alone would have only two | ✓ | — |

| D4 statement | Instance | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Diamond presentation | Identity equivalence relation on X | X/R=X and relation is diagonal; universal relation on nonempty finite discrete X gives one point | ✓ | — |
| Quotient relation recovered | Free C₂ action on 2 | X×_{X/G}X has 4 elements, same as G×X | ✓ | — |
| Underlying-space field points | C with rank-two plus ring | Specialization chain has η and s; testing only rank-one points would keep η and lose s | ✓ | — |
| Quotient carrier Check | Fold Bool→1 | Kernel contains all four pairs; equality relation contains two, so it cannot be used as the kernel | ✓ | — |

| D5 statement | Instance | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Spatial versus locally spatial | Finite discrete 2; infinite discrete ℕ | Both locally spatial; only finite one quasicompact, hence spatial | ✓ | — |
| Quasicompact injection permanence | {η}→S | Domain is a one-point spectral space; image is pro-constructible and generalizing | ✓ | — |
| Finite étale permanence | n copies of spatial point | n=0,1,2 give spectral spaces with that many points | ✓ | — |
| Cofiltered diamond limit | Binary finite quotients | Stage sizes 2ⁿ; limit point set has size 2^ℵ₀ and profinite topology | ✓ | — |
| Finite-stage étale comparison | Clopen of binary inverse limit | Compact clopen depends on finitely many coordinates, hence comes from one finite stage | ✓ | — |
| Size of limit | Fewer than κ coordinates, uniform μ<κ | Number of tuples ≤μ^λ<κ by strong-limit bounds; κ independent Boolean coordinates instead give 2^κ≥κ | ✓ | — |
| Size versus chart universe | One-point field outside Type 0 | Topological size=1 but section-ring size not Small.{0}; increasing κ does not fix resizing | ✓ | — |
| Smallness of finite-subset arrows | I=∅, Bool, ℕ, Type | Arrow counts 1, 3²=9, ℵ₀; singleton identities inject Type into arrows, so last is not Small.{0} | ✓ | — |
| Quasi-pro-étale permanence | Profinite product over a point | Fibre products S₀×T₀ are profinite; pointwise product counts multiply for finite sets | ✓ | — |
| Two-out-of-three refinements | Split maps 2→1→1 over Spa(C) | f,h have degree 2, g degree 1; all are finite étale, hence étale and quasi-pro-étale; f is surjective and g separated | ✓ | — |
| Spatial v-sheaf criterion | Identity cover of a point | Cover point is strictly disconnected; its unique image supplies the required surjectivity | ✓ | — |
| Diamond representability under pro-étale surjection | Split cover X⊔X→X and descent of n-point object | Two pullbacks and matching overlap recover n points for n=0,1,2; replacing cover by arbitrary v-cover does not satisfy the theorem’s premise | ✓ | — |
| `BerkovichSpectrum` normalization | ℚ₂, ϖ=2; ℚ₃, ϖ=3 | α(2)=1/2; α(3)=1/2 after exponent log(2)/log(3), not the unrenormalized 1/3 | ✓ | — |
| Normalization nonzero requirement | ϖ=0; zero ring | α(0)=0 cannot equal 1/2; zero ring also has 0=1 contradicting multiplicative seminorm axioms | ✓ | R02 removes example |
| Change of pseudouniformizer | ϖ versus ϖ² | If α(ϖ)=1/2, new β=α^(1/2) has β(ϖ²)=1/2 | ✓ | — |
| Pointwise topology | Finite product C×C | Two seminorms distinguish idempotent (1,0) by values 1 and 0 | ✓ | — |
| Berkovich/Hausdorff comparison | Rank-two field pair | Spa has two comparable points; Hausdorff quotient and normalized spectrum each have one | ✓ | — |
| Nilpotent insensitivity | K[ε]/ε² | α(ε)²=α(0)=0, hence α(ε)=0; spectrum equals that of K | ✓ | — |
| Berkovich realization on geometric site | S | q(η)=q(s)=*; maximal-generalization section sends * to η, and q∘section=id | ✓ | — |
| Hausdorff cohomology comparison | Point; two discrete points, abelian A | H⁰=A or A² on both sides; positive cohomology is 0 | ✓ | — |
| Compact quotient components | S₃ acting on 3; C₂ swapping 2 | Orbit spaces and component-orbit sets each have one point | ✓ | — |
| Compact quotient criterion, both directions | Trivial group on discrete 2 | LHS components equal iff x=y; RHS ∃g is also x=y | ✓ | — |
| Noncompact group exclusion | Dense ℤ in ℤ_p | π₀(ℤ_p/ℤ)=1; π₀(ℤ_p)/ℤ=ℤ_p/ℤ has more than one point | ✓ | Source correction retained |

| D6 statement | Instance | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Marked untilt carrier | Characteristic-p field and identity marking | Tilt identification is id; changing marking by a nontrivial automorphism changes the marked datum | ✓ | — |
| `Spd ℤ_p` integral base | p in ℤ_p and ℚ_p | p is nonunit in ℤ_p, unit in ℚ_p; only latter is a Tate pseudouniformizer | ✓ | — |
| Primitive untilt equation | ξ=p−[t], t♯=p | θ(ξ)=p−p=0; θ(p+[t])=2p≠0 in characteristic zero; c₀=−t, c₁=1 (odd p), 1+t² (p=2) | ✓ | — |
| Untilts v-descend | Split two-sheet cover | Two untilts with matching marking glue to the original; forgetting the marking permits extra automorphisms | ✓ | — |
| Tate-pair spatial diamond | Perfectoid pair with trivial torsor group | Atlas is original perfectoid object; quotient relation is diagonal and underlying Spa is unchanged | ✓ | — |
| Completed pair comparison | Already complete pair | Completion map=id; plus closure stays original closed integral subring | ✓ | — |
| Analytic diamondification | Perfectoid field and its tilt | Diamond identifies via the specified tilt equivalence, not an unmarked arbitrary field isomorphism | ✓ | — |
| Étale-site equivalence | Spa(C), finite n-sheet covers | Objects on both sides have n sheets; maps are functions of the sheet sets, with permutations retained | ✓ | — |
| Finite étale comparison | C²/C | Two idempotents and the swap automorphism survive diamondification | ✓ | — |
| Pre-adic diamondification carrier | Non-Tate integral pair ℤ_p | Mapping functor is defined despite failure of IsTateRing; analytic-only carrier would omit it | ✓ | — |
| Integral smallness | Affine pair of cardinal λ | With μ=(λ+ℵ₀)^ℵ₀, hull has size ≤μ and point set ≤2^(2^μ); choose cutoff κ>2^(2^μ) independently of the test map | ✓ | — |
| Galois quotient | Finite Galois L/K | Generic geometric fibre has [L:K] points and quotient one; special inertia may fix points | ✓ | — |
| Galois action convention | g=(12), h=(23) in S₃ | g·(h·f)=f∘h⁻¹∘g⁻¹=f∘(gh)⁻¹; gh=(123), whereas hg=(132) | ✓ | — |
| Integral quotient is not everywhere torsor | Totally ramified quadratic extension | Generic fibre size 2; residue extension degree 1 and special inertia size 2 | ✓ | — |
| Analytic-locus comparison | ℤ_p, generic versus special valuation | Generic support does not contain p; special support contains p; inverting p retains only generic locus | ✓ | — |
| Formal resolution comparison | Cusp u²=t³ | Resolution parametrization t=s²,u=s³ gives s⁶=s⁶; pullback of equation is zero | ✓ | — |
| Rig-regular restriction | K[[t]]⟨u,v⟩/(uv) | After inverting t, u=v=0 remains singular; input is not rig-regular and is excluded | ✓ | — |
| Relative algebraic/analytic resolution | Node uv=0 | Normalization has two smooth branches on both sides; over crossing fibre has 2 points, not 1 | ✓ | — |
| `subintegral_lift` | Cusp→K[t], evaluation t²↦a²,t³↦a³ | Unique extension sends t↦a; any other b has b²=a²,b³=a³, hence b=a in a reduced field | ✓ | — |
| Bijective subintegral map | Identity K; K→K[ε]/ε² | First bijective; second subintegral but not surjective, excluded because target not reduced | ✓ | — |
| Existence of seminormalization | Zero ring; field; cusp | Targets respectively 0, K, K[t]; units subintegral in each case | ✓ | — |
| Unique marked comparison | 𝔽₄ with identity unit | Identity respects unit; Frobenius a↦a² moves a∉𝔽₂ and fails the unit triangle | ✓ | — |
| Principal localization | Cusp, invert t² | t=t³/t² now belongs to localized ring; reflection/localization both give K[t,t⁻¹] | ✓ | — |
| Compatible functions on a seminormal node | A=K⟨u,v⟩/(uv), B=K⟨u⟩×K⟨v⟩ | A={(f,g):f(0)=g(0)}; B contains (1,0), A does not | ✓ | Source error recorded |
| Reduced-overlap equalizer | Same normalization | Equalizer condition is f(0)=g(0), recovering A exactly; product B alone is too large | ✓ | — |
| Seminormal structure-sheaf comparison | Node; cusp | Node recovers compatible pairs A; cusp gains t, so O→ν_*Ô is not asserted iso without seminormality | ✓ | — |
| Seminormal rigid full faithfulness | Seminormal source point; nilpotent target thickening | Reduced test-source maps kill ε, agreeing with ordinary maps; allowing nonseminormal cusp source would lose its distinction from normalization | ✓ | — |

## Not verifiable

- **Huber96**, Definition 1.6.5, Proposition 1.6.7 and §2.1/Proposition 2.1.4: the sources service found publisher material behind access restrictions, not an open full text. These supplier-background locators remain uncertified. I checked the corresponding roadmap contracts and did not infer the book's wording from them. None is one of the seeded targets above.
- Ownership against open pull requests without a supplied checkout was not checked. The searches of the supplied checkouts, main and board packages are recorded above; index hits alone are not treated as verified ownership claims.
- The finite-instance table is not a proof of the universal statements. The retained rows cover all seven layers, the seeded/finding targets and headline evidence; routine API rows are omitted. Source certification covers the stated sample and additional opened locators, not every bibliography locator.

## Source issues

- **Error** in ECD at Proposition 4.4, printed page 20: the source says fewer than κ affinoid charts of sizes below κ suffice for κ-smallness for any uncountable strong limit; it should be require a uniform bound or regular κ; at singular κ the union can have at least κ points; affects a stated result.
- **Error** in ECD at Lemma 7.2(iii), printed page 29: the source says split covers make global sections preserve finite colimits of set-valued sheaves; it should be preservation of epimorphisms; two discrete points give coproduct-section cardinalities four versus two; affects a stated result.
- **Misprint** in ECD at Proposition 7.12, printed page 34: the source says w-localization is left adjoint to inclusion; it should be right adjoint, with counit from the specialization-pair space to the original space; affects a stated result.
- **Misprint** in ECD at proof of Proposition 11.24, printed page 65, and proof of Theorem 12.18, printed page 75: the source says products over any subset retain the finite étale/open-composite form; it should be finite subsets, as required by the immediately following inverse-limit construction; affects the proof.
- **Misprint** in ECD at proof of Proposition 11.30, printed page 68: the source says the map from Y₂ to X₃ is named f; it should be g, since f has source Y₁ and target Y₂; affects nothing.
- **Error** in GLX at Lemma 3.2, printed page 16: the source says connected components commute with every locally profinite orbit quotient of small v-sheaves; it should be require extra separation, for example compact group and spectral source; dense integer orbits give one component but multiple component orbits; affects a stated result.
- **Error** in KL16 at Remark 8.1.4, printed page 159, used in Theorem 8.2.3, printed page 163: the source says resolution pushforward of functions equals the structure sheaf for a seminormal space; it should be an equalizer over the reduced overlap; node normalization contains (1,0), which does not descend; affects the proof.
- **Misprint** in SGA 4 VI at Remark 8.7.8, transcription page 226: the source says the cohomological hypothesis is in 8.6.7; it should be 8.7.7, the preceding cohomology corollary; affects nothing.
