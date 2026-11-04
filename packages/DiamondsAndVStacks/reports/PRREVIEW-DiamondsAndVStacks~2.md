# Review of DiamondsAndVStacks (pull request #820 at fff269b)

**Verdict:** needs changes

## R01 (P2) — The acceptance test still imports a roadmap

**Location.** `TauCetiRoadmap/DiamondsAndVStacks/Suggested.lean:8`: “import TauCetiRoadmap.PerfectoidSpaces.Suggested”. The module docstring at line 14 explicitly includes that roadmap among its foundations.

**Claim.** The acceptance test must use the pinned libraries. The gate fails `imports=1`. The perfectoid-space and perfectoid-ring signatures are being made statable by importing a supplier's proposed implementation, rather than by using a carrier at the pins. This is previous R01, **not repaired**.

**Witness.** `Perfd`, `isAffinoidPerfectoid` and `IsPerfectoidTateRing` come from `TauCetiRoadmap/PerfectoidSpaces/Suggested.lean`, not the pinned libraries. Removing the import requires removing the signatures that use these carriers.

**Repair.** Delete that import and the corresponding `open`. Remove the perfectoid-dependent declarations from the acceptance test; name affinoidness, automatic flatness, v-subcanonicity, function descent and affinoid v-cohomology in its docstring with the missing perfectoid carriers. Keep their full statements in the README. Retain only native-carrier definitions needed for retained headlines; the generic `vPrecoverage` has a real native body. Update the README's description of imports at lines 345–348. A scratch copy with the import and dependent blocks removed was elaborated to test this route; it does not require weakening the mathematical targets.

## R02 (P3) — Three boundary examples remain in the acceptance test

**Location.** `TauCetiRoadmap/DiamondsAndVStacks/Suggested.lean:150`, `:270`, `:353`: “example : ¬ IsCutoffCardinal Cardinal.aleph0”, “Subsingleton ((structurePresheaf p).obj …)”, and “IsEmpty (BerkovichSpectrum R 0)”.

**Claim.** These cutoff, empty-space and zero-normalizer Checks are not headlines. Previous R06 is **partly repaired**: the other listed padding was deleted.

**Witness.** The examples compute, respectively, false from `ℵ₀ < ℵ₀`, the one-element section ring on the empty space, and an empty seminorm space from `0 = 1/2`. All three already elaborate with proofs.

**Repair.** Delete them from `Suggested.lean`, including their Check comments. Keep the three mathematical Checks in the README. The computed values above remain unchanged; proving these examples in place is not the requested repair.

## R03 (P3) — Correct the inverse-topology locator in both files

**Location.** `TauCetiRoadmap/DiamondsAndVStacks/README.md:1005`: “([Hoc69] Proposition 8, p. 52, the source of these properties”; `Suggested.lean:66`, `:72`, `:77`, `:83` still attribute the comparison theorems to KL15 Definition 8.1.4.

**Claim.** The primary-source repair of previous R09 is only partial. Proposition 8 is on printed page **54**, not 52; KL15's definition names the dual topology but does not state this collection of comparison theorems.

**Witness.** Hoc69 line 468 identifies page 54; lines 476–484 give spectrality, order reversal and equality of patch topologies. Involutivity and the map criterion follow from the complementary compact-open bases.

**Repair.** Cite Hoc69 Proposition 8 and its proof, printed page 54, in both files; identify the last two assertions as consequences of the compact-open description. On the DVR spectrum the opens `∅,{η},X` become `∅,{s},X`, then return to `∅,{η},X`; both patch topologies are discrete. Thus the correction supports the actual comparisons, not just existence of a second topology.

## R04 (P3) — ECD 11.3 does not state the general stack descent claim

**Location.** `TauCetiRoadmap/DiamondsAndVStacks/README.md:2062` and `:2069`: the atlas relation cites “Proposition 11.3(ii)”, and category-valued quotient descent cites “Proposition 11.3(iii), p. 54”.

**Claim.** ECD 11.3 concerns pro-étale equivalence relations of perfectoid spaces. Its third part concerns replacing a presentation. It is not the claimed universal property of arbitrary sheaf groupoids with category-valued targets. Stacks 044U states the groupoid-valued version.

**Witness.** ECD lines 2236–2244 give the diamond presentation statements. Stacks stackification, Tag 044U, lines 1360–1385 of the groupoids-in-algebraic-spaces chapter, assumes a target stack in groupoids.

**Repair.** Use SchemeAndStackFoundations §§1.18 and 1.21 for the generic relation and universal property. Explain the category-valued extension through §1.18's `Stack.stackificationUniversal`, identifying functors from the presenting groupoid with descent data, including modifications. Keep ECD 11.3 for D4's geometric specialization. For the point site and the one-object groupoid of ℤ, descent includes a chosen automorphism; for target `[1]`, modifications can be noninvertible. This route retains both features without restricting the intended target category.

## R05 (P3) — Remove the catalogue of undeclared own Lean names

**Location.** `TauCetiRoadmap/DiamondsAndVStacks/README.md:350`: own carriers and theorems are called “suggested names for targets specified in this README only”; at `:2070`, `Stack.quotient_descent` is one such name, and at `:2080` a Check is labelled `s0_26_free_discrete_quotient`.

**Claim.** The prescribed README form permits an own backticked API name only when it is declared in `Suggested.lean`, and requires prose Checks without claimed Lean counterparts. The repeated catalogue convention contradicts that rule. A local explanation cannot waive it; adding all these declarations would also violate the acceptance-test rule.

**Witness.** The Lean file has 47 named declarations. Neither of the two example names occurs as a declaration. README line 2900 explicitly calls the geometric Check names suggested Lean examples.

**Repair.** Express the own README-only API and Checks in prose, keeping the defined mathematical objects, signatures, hypotheses, locators and computations. Preserve actual library/supplier names and the names of retained Lean declarations. For example, the free-action Check still computes trivial stabilizers and quotient `X/G` after its invented identifier is removed. Delete the conflicting catalogue convention.

## R06 (P3) — One obsolete supplier namespace remains

**Location.** `TauCetiRoadmap/DiamondsAndVStacks/README.md:769`: “`AdicEtaleGeometry.YonedaAdicSpace` (a target of its §A1.16)”.

**Claim.** Previous R08 is **partly repaired**. The `Stack.*` corrections and the unqualified `CAff` contract are present, but this remaining spelling does not name the supplier's proposed geometric namespace.

**Witness.** `TauCetiRoadmap/AdicEtaleGeometry/README.md:175` places `YonedaAdicSpace` and `CAff` under Tau Ceti's root namespace. The contract at this roadmap's line 819 already uses that spelling.

**Repair.** Write `YonedaAdicSpace`, attributed to AdicEtaleGeometry §A1.16, consistently with line 819. This is a name repair: the affine comparison still sends the chosen complete pair to its Yoneda spectrum, including its chosen plus ring.

## Verified sound

The failing import prevents acceptance independently of the mathematical checks below.

**Previous review, checked first.** The supplied material contains no finding marked “not actionable in this package”.

| Previous finding | Head passage and disposition |
|---|---|
| R01, roadmap import | Lean line 8 still imports the PerfectoidSpaces roadmap. **Not repaired**, R01 above. |
| R02, big-site cohomology | Lean lines 288–332 introduce `PerfdKappa` and require `EssentiallySmall.{u} (PerfdKappa p κ)`. **Repaired as a size/signature issue**; R01 still applies to the carrier. |
| R03, chosen sorry-derived ring | Lean line 404 says “∃ B : CommRingCat.{u}, ∃ f : A →+* B”. The chosen `snRing`/`snMap` declarations are absent. **Repaired**; the existence theorem and lifting property remain. |
| R04, duplicated generic stacks | README line 2056 says “This subsection constructs neither and states their specialisation”. Generic construction recipes were removed and main §§1.18/1.21 resolved. **Repaired as ownership**; R04 above is a different locator issue. |
| R05, gate residue | Worker gate reports `residue=0`. **Repaired**. |
| R06, padding | README lines 945–946 still mention “the three proved examples”. Other previously listed padding is absent. **Partly repaired**, R02 above. |
| R07, omitted unstatable headlines | Lean lines 21–27 name the étale-site comparison, seminormal full faithfulness and integral almost acyclicity, with missing carriers. **Repaired for those three**; the remaining import-dependent headlines need the R01 treatment. |
| R08, supplier spellings | README lines 819 and 869–870 use `CAff`, `Stack.stackification`, `Stack.twoFibreProduct`, `Stack.quotient`. **Partly repaired**, remaining occurrence in R06. |
| R09, dual-topology source | README line 1005 now cites Hoc69 Proposition 8. **Partly repaired**, R03. |
| R10, nondiscriminating Checks | README lines 1339–1348 require cofinality, including failure of a constant sequence; lines 2117–2126 distinguish Boolean negation from a constant restriction. **Repaired in the cited examples**. Their identifier style is addressed separately in R05. |

**Gate, build and scope.** Head verified; worktree clean; outside-folder diff empty. This is a new roadmap, not a re-planning. I read README/CONTRIBUTING and compared main's PerfectoidSpaces, AdicSpacesPartII and SchemeAndStackFoundations. All seven layers have Examples/Dependencies. No algorithm, sorry'd data body, `set_option`, stray source or outside edit was found.

The worker's gate at this head reports `imports=1`, `build=0`, and zero on every other listed rule: `set_option`, `blob`, `latex`, `tex`, `prnum`, `sorry-data`, `sorry-examples`, `residue`, `private-paths`, `mathlib-subimports`, `no-import-mathlib`, `lean-lines`, `forbidden`, `dropped`, `readme-ids-missing`, `empty-sections`, `round-labels`, `long-fences`, `layer-ids`, `target-ids`, `depcheck`, `metadata`, `stray-files`, `dirty`, `outside-folder`, `source-material`. Overall: **FAIL**. Zero `build` means no build failure, not that the import is permitted.

I built the missing pinned module `TauCeti.Topology.Spectral.ProConstructible`, then ran the prescribed `lake env lean` elaboration of the target: success, with only 31 `sorry` warnings. A scratch signature file checked all **47 named declarations** (31 theorems, 14 definitions, two abbreviations). Both anonymous instances and all three proved examples also elaborated. The flatness signatures retain completeness, Hausdorffness, continuity, plus preservation and the pseudouniformizer; the limit theorem retains both systems' spectral transition maps; the seminormal bijectivity theorem retains reducedness of the target. No additional dropped binder was found. The two cohomology signatures now use objectwise `Sheaf.H'`, the small-site assumption and the larger Ext universe.

All **31** admitted theorems resisted `simp`, `rfl` and `infer_instance` in a scratch copy. Object searches found no direct pinned replacement. `Sheaf.H.equiv₀` concerns a terminal object, not arbitrary-object `H'`. The three boundary examples remain R02 despite their proofs.

**Dependency check output.**

```text
depcheck: 164 roadmaps, 1162 edges, 0 problem(s)
```

No UPWARD or CYCLE line. DiamondsAndVStacks follows all fourteen named earlier suppliers. I read the `Needs` lines and supplier contracts. PerfectoidTowers, subsequent diamond cohomology and six-operation roadmaps are consumers, not inputs. The geometric small-chart universe restriction is kept separately from cardinal cutoff bounds. A large perfectoid field does not become `Small.{0}` merely by increasing κ.

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
| `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean:101` | `spa` includes continuity and the bound on the supplied plus ring. It is not all valuations of the underlying ring. |
| `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Completion/Homeomorph.lean:93` | `spaCompletionHomeomorph` uses `completionPlus`; its valuation-pullback formula is at 101. D6 adds the marked-untilt comparison, not another spectrum-completion theorem. |
| `TauCeti/RingTheory/Huber/Padic/Basic.lean:104` | `PadicInt.not_isTateRing` distinguishes integral `Spd ℤ_p` from Tate-pair `Spd`. |
| `TauCeti/Topology/Sheaves/Flasque.lean:156` | `subsingleton_H_succ_of_isFlasque` supplies higher vanishing after flasqueness; it does not prove a constant sheaf is flasque on an irreducible space. |

**Ownership and supplier resolution.** Object searches used `roadmaps grep`, main, supplied open checkouts and board packages. No identical fully qualified declaration name was found. Main-roadmap revisions are not new suppliers. Resolved contracts:

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

`packages/ArcTopologyAndDescent/design/README.md:386` also defines spectral submersions, but cites this roadmap at line 416. This earlier roadmap remains the owner; that consumer should import it. Searches of the supplied TropicalAndBerkovichArithmetic and AnalyticStacks work found no competing normalized `Spa` comparison. Ownership against index hits with no supplied checkout was **not checked**; no finding relies on them.

**Headline inventory.** The three end results are the analytic étale-site equivalence (D6.5), subcanonicity/function descent/affinoid v-acyclicity (D2.7–D2.8), and seminormal rigid full faithfulness (D6.9). Intermediate deep results are spectral quotient/Hochster duality and realization, Fargues' split-cover criterion, affinoidness and automatic flatness, w-localization and strictly disconnected covers, cutoff independence, effective perfectoid descent, diamond quotient/presentation theorems, spatial permanence and finite-stage comparisons, the normalized Berkovich/Hausdorff comparison, integral Galois quotient and affine seminormal reflection. Native topology, cardinal, seminorm and commutative-ring headlines have signatures. The geometric diamond/rigid carriers are absent from the pins, and the docstring correctly names the three missing geometric end results. Perfectoid-dependent signatures must receive the same treatment under R01. No additional statable deep headline was identified as missing.

**Seeded sources.** All 15 sample entries were checked, including both “Geometric construction Checks” and the chart/torsor/quotient “Geometric carrier Checks”. No locator marked unverified was found. All fetches used the sources service; no sources were copied into the repository. The ECD text is arXiv 1709.07343v4, KL16 is arXiv 1602.06899v3, HK is arXiv 2308.11064v2, and the Berkeley text is the 27 March 2020 author copy. Page numbers below are printed pages unless identified as transcription pages.

| Sample target | Text opened and comparison |
|---|---|
| Two-fibre products and groupoid quotients, D0.26 | ECD lines 2236–2244, Proposition 11.3, p. 54; Stacks stackification, groupoids chapter lines 1360–1385, 044U, p. 29. Generic category-valued claim needs the attribution repair R04. |
| Automatic flatness, D1.6 | ECD lines 1582–1603, Proposition 7.23, pp. 38–39. Totally disconnected base, chosen integral elements, pseudouniformizer and the extra surjectivity for faithful flatness agree. |
| Geometric construction Checks, w-localization | ECD lines 1381–1391, Proposition 7.12, p. 34. Specialization pairs and the counit agree; “left adjoint” in the source is a misprint. |
| Geometric construction Checks, strictly disconnected cover | ECD lines 1502–1525, Lemma 7.18, pp. 36–37. Affinoid, pro-étale, surjective and universally open clauses agree. |
| Cutoff independence and small sheaves, D2.3 | ECD lines 1622–1655, Proposition 8.2, pp. 39–40. The restriction/extension and degree/coefficient ranges agree; arbitrary large-site cohomology is not being asserted. |
| Effective affinoid v-descent, D3.3 | ECD lines 1819–1837, Proposition 9.3, p. 44. The totally disconnected base and surjective affinoid cover are retained. |
| Geometric carrier Checks | README lines 3393–3550, 5553–5660 and 6704–6726 compared with ECD §§3, 10–12, and the resolved perfectoid/Yoneda suppliers. The chosen plus ring, lifted chart universe and quotient relation remain explicit. |
| Size of the limit, D5.3 | ECD lines 2606–2618, Lemma 11.22, p. 63, and lines 3043–3055, Lemma 12.17, p. 73. Uniform stage bounds and the index bound are distinct; small-chart resizing is not inferred from a cardinal bound. |
| Locally closed generalizing subdiamonds, D5.9 | HK lines 637–672, §2.1, p. 14, with ECD Proposition 11.20. Generalizing is essential: the closed point alone in a rank-two specialization chain does not define the claimed subdiamond. |
| Berkovich realization on the geometric site | ECD lines 3261–3317, Propositions 13.9–13.11, pp. 79–80. Rank-one/maximal generalization and the qcqs separated hypotheses match. |
| Integral Galois quotient, D6.7 | Berkeley lines 6230–6260, Proposition 18.1.2, pp. 161–162. Integral quotient is retained despite special-fibre inertia; it is not asserted to be a free torsor everywhere. |
| Formal comparison for resolution | Temkin-resolution lines 687–706, §§2.4.9–2.4.11, p. 15; lines 844–859, Theorem 3.1.5, p. 18. Rig-regularity, locally principal formal varieties and compatible regular maps are retained. |
| Seminormal rigid full faithfulness | Berkeley lines 3153–3172, Theorem 10.2.3, p. 78; KL16 lines 6258–6281, Theorem 8.2.3, pp. 162–163. Fixed field and seminormal source agree. The roadmap's reduced-overlap equalizer avoids the false pushforward assertion in the cited proof. |
| Subintegral maps and seminormal lifting | Stacks seminormalization lines 5184–5220, 0CND, pp. 113–114, and 5483–5496, 0H3G, p. 120; KL16 lines 762–771, Lemma 1.4.5, p. 20. Integrality, residue-field isomorphisms and reduced-target condition agree. |
| Unique comparison of seminormal reflections | Stacks seminormalization lines 5382–5387, 0EUR(3)–(4), p. 118, with 0H3G. Uniqueness is relative to the unit, not uniqueness of an unmarked isomorphism. |

Additional text checks: Hoc69 lines 476–484 (R03); SGA 4 VI lines 6832–6864 (5.1–5.4, transcription pp. 167–168), 9076–9088 (8.7.1, p. 223), 9135–9138 (8.7.3, p. 224), and 9171–9179 (8.7.7, p. 225). Coherence provides the required compatibility of derived direct images with filtered colimits. This resolves the previous review's SGA access limitation. Arc Definition 2.14, Remark 2.15 and Lemma 2.17, BS15 Definition 2.1.1/Lemma 2.1.4, ECD Lemma 4.1 and Theorem 8.7/Proposition 8.8, and the GLX and KL16 passages listed under Source issues were also opened.

**Computed adversarial cases: 210 rows.** `S={η,s}` has opens `∅,{η},S` and specialization `η→s`. `C` is a complete algebraically closed perfectoid field; `K` a complete characteristic-zero nonarchimedean field for rigid geometry. “✓” records consistency of the computed instance, not a proof of the universal theorem. Perfectoid-carrier rows remain subject to R01.

| D0 statement | Instance | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Local spectrality | Infinite discrete union of field spectra | Each chart has one point and is compact; whole space has infinitely many singleton opens and no finite subcover | ✓ | — |
| `inverseTopology` | S; infinite discrete ℕ | S: opens become ∅,{s},S; ℕ: complements of finite sets generate the cofinite topology | ✓ | R03 locator |
| `spectralSpace_inverseTopology` | S | η→s originally; s→η in the dual; both finite T₀ topologies are spectral | ✓ | R03 |
| `inverseTopology_inverse` | S | ∅,{η},S → ∅,{s},S → ∅,{η},S | ✓ | R03 |
| `inverseTopology_constructible` | S | Both patch topologies have all four subsets open | ✓ | R03 |
| `inverseTopology_map` | Identity; endpoint swap on S | Identity preserves compact opens in both; swap fails continuity in both | ✓ | R03 |
| Profinite components | S; two discrete points | π₀(S)=1, compact Hausdorff; π₀(2)=2 discrete | ✓ | — |
| Component clopens | S→π₀(S) | Pullbacks of ∅ and {*} are ∅ and S; {η} is not pulled back | ✓ | — |
| Pro-constructible quotient T₀ | Diagonal and universal relations on S | Quotients S and 1 respectively; saturation distinguishes points only in the first | ✓ | — |
| Invariant neighborhoods | Discrete {0,1,2}, relation 0∼1 | Saturation of {0} is {0,1}; neighborhood of the other orbit is {2} | ✓ | — |
| Spectral quotient criterion | Diagonal; universal relation; empty X | Quotients X, 1 (X nonempty), ∅; preimages of their basis opens are compact | ✓ | — |
| Quotient basis hypothesis | Profinite presentation of [0,1] | Quotient has only ∅ and [0,1] compact open; these do not form a basis at 1/2 | ✓ | — |
| Open spectral quotient | Finite discrete two-sheeted cover | Invariant opens are unions of fibres; quotient opens and compact opens coincide | ✓ | — |
| `IsSpectralSubmersion` | Patch S→S | Preimage of {s} is compact open, but {s} is not open in S; predicate false | ✓ | — |
| Constructible criterion | Same patch map | {s} is patch-clopen on target and already detects failure; both formulations false | ✓ | — |
| Composition of submersions | 4→2→1 discrete quotient maps | Composite has fibre size 4; inverse images of both target opens are compact open | ✓ | — |
| Limit of submersions | Truncations {0,1}ⁿ⁺¹→{0,1}ⁿ | Limit shift on {0,1}^ℕ has two-element fibres; a length-n cylinder pulls back to length n+1 | ✓ | — |
| Bounded pro-objects | Finite diagrams; Cantor presentation | Finite index has finitely many arrows; standard Cantor index has ℵ₀ arrows, so fails a finite bound | ✓ | — |
| Double-limit Hom direction | Constant finite sets A,B | `lim_j colim_i Hom(A,B)=B^A`, not `A^B`; cardinalities for 2→3 are 9 versus 8 | ✓ | — |
| Ordinal assembly | Countable reversed natural-number index | Constant full stages exhaust all objects/arrows; a constant singleton stage misses arrow 2→1 | ✓ | — |
| Countable cofinal sequence | ℕᵒᵖ | Identity reaches every n; sequence constantly 0 misses every n>0 | ✓ | — |
| Stage-limit restrictions | Binary strings, stages n and n+1 | Projection deletes last bit; compatible family yields its length-n prefix | ✓ | — |
| Assembly cone | Constant family with value a | Every stage evaluates to a; replacing one leg by a distinct b breaks compatibility | ✓ | — |
| Hochster realization | ∅, point, S | Spectra of zero ring, field, DVR have respectively 0,1,2 points with the required orders | ✓ | — |
| Marked realization | S and opposite S | A homeomorphism sends generic to generic; endpoint swap is not a self-homeomorphism of S | ✓ | — |
| Closed-relation Hausdorff quotient | Cantor→[0,1] | Kernel is closed; quotient is [0,1], compact Hausdorff though not spectral | ✓ | — |
| Closedness is essential | ℤ translates ℤ_p | Orbits dense; orbit quotient indiscrete with more than one point, hence not Hausdorff | ✓ | — |
| Projective presentation | Finite discrete 2 | Its Stone–Čech presentation is 2→2; kernel is the diagonal, not the four-element total relation | ✓ | — |
| Filtered sections/cohomology | Point with coefficients ℤ/2ⁿ under ×2 | Both degree-zero colimits are the Prüfer 2-group; both higher groups are 0 | ✓ | — |
| Quasicompactness requirement | Discrete ℕ, finite-support subsheaves | Colimit of global sections is ⊕ℕ ℤ; global sections of colimit are ∏ℕ ℤ; (1,1,…) lies only in latter | ✓ | — |
| Nonabelian H¹ and classifying prestack | Point, G=S₃ or C₂ | One torsor class; trivial torsor automorphisms have respectively 6 or 2 elements | ✓ | — |
| Extension of structure group | Trivial torsor, S₃→1 | Class maps to the trivial class; six automorphisms map to the unique identity | ✓ | — |
| Čech-to-derived comparison | Identity cover of a point | H⁰=A, higher groups 0 on both sides; first differential a↦a−a=0 | ✓ | — |
| Leray direction | Identity map | R⁰id_*=id; Rⁿid_*=0 for n>0; E₂ has only its q=0 row | ✓ | — |
| Flasque constant sheaf | S, coefficient A | Nonempty opens carry A and restriction A→A is identity; restriction to ∅ is A→0, surjective | ✓ | — |
| Coherent-topos limit cohomology | One-stage point topos | Limit equals point; both H⁰=A and Hⁿ=0 for n>0 | ✓ | — |
| Noninvertible coefficient transition | Point diagram ℤ→ℤ by ×2 | Colimit coefficients and H⁰ are ℤ[1/2]; requiring invertibility would wrongly exclude the diagram | ✓ | — |
| Direct-image sections/evaluation | One-stage Bℤ; discrete 2 | Section categories retain ℤ automorphisms or two objects respectively; evaluation fixes each arrow | ✓ | — |
| Ordinary sheaves on profinite sets | Discrete 2, values A,B | Sections on whole space are A×B; empty clopen value is terminal | ✓ | — |
| Disjoint descent | Two singleton clopens, one empty value | Whole value A×∅=∅; imposing a nonempty whole value fails descent | ✓ | — |
| Partial sections and germ equivalence | Principal ultrafilter at 0 on {0,1} | A section on {0} gives its value a; no value at 1 is required; two germs equal iff their 0-values equal | ✓ | — |
| Ultrafilter stalk with empty factor | A₀={a}, A₁=∅, ultrafilter at 0 | Partial-section stalk has one element; total product A₀×A₁ is empty | ✓ | — |
| Product-presheaf stalk comparison | Principal ultrafilter at i | Germ of a product section maps to aᵢ; swapping labels changes the value | ✓ | — |
| Clopen restriction equivalence | Discrete 2 | Restriction and extension return A×B on whole space, A and B on singleton opens | ✓ | — |
| `IsCutoffCardinal` | 0, ℵ₀, ℶ_ω | 0 and ℵ₀ fail uncountability; ℶ_ω has cofinality ℵ₀ and fails the cofinality clause | ✓ | R02 removes Lean Check |
| Cofinal cutoff existence | Successive strong-limit closure as ECD 4.1 | Set κ₀>λ, κᵢ₊₁=ℶ_(κᵢ⁺), continuously to ω₁: κ=sup κᵢ has cf κ=ℵ₁; cf κᵢ₊₁=κᵢ⁺ gives arbitrarily large cofinalities below κ | ✓ | — |
| Completion cardinality | Dense ℚ⊂ℝ | Dense cardinal ℵ₀, completion 2^ℵ₀=ℵ₀^ℵ₀; a bound by ℵ₀ alone fails | ✓ | — |
| Stackification | Discrete two-point sheaf; B(S₃) | First retains two classes and trivial stabilizers; second has one class with six automorphisms | ✓ | — |
| Two-fibre product | *→BG←*, G=C₂ or S₃ | Objects are G, hence 2 or 6; strict pullback has one object | ✓ | R04 attribution |
| Category-valued fibre product | [1]→1←1 | Result is [1], with one noninvertible arrow; groupoid-only replacement loses it | ✓ | R04 |
| Quotient relation | Pair groupoid on two points | Quotient is 1; relation and fibre square both have four elements | ✓ | R04 |
| Quotient is a sheaf iff stabilizers trivial | Free C₂ action on 2; trivial action on 1 | First quotient is 1 with stabilizer 1; second is BC₂ with stabilizer C₂ | ✓ | R04/R05 |
| Category-valued quotient descent | Bℤ into Bℤ; Bℤ into [1] | First remembers homomorphism 1↦m for every m∈ℤ; second admits noninvertible modifications between constant objects | ✓ | R04 |
| Isomorphism classes | Discrete 2; connected pair groupoid on 2 | Class sets have 2 and 1 elements respectively | ✓ | — |
| Boolean restriction fixture | Proper arrow and identities | Proper map true↦false, false↦true; identity fixes both; constant false fails identity at true | ✓ | R05 labels |

| D1 statement | Instance | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| `OpenCoversSplit` | S; infinite discrete set | S cover must contain S, giving a constant choice; singleton cover of discrete set has identity choice | ✓ | — |
| qcqs in total disconnectedness | Infinite discrete union of fields | Split covers=true but compactness=false; total-disconnected-perfectoid predicate=false | ✓ | — |
| Split-cover iff unique closed point | S; three-point fork η→a,η→b | S: one closed point and splitting; fork: two closed points and cover {η,a},{η,b} cannot split continuously | ✓ | — |
| Split-cover cohomology/epi criterion | Finite discrete 2 | Epimorphisms are componentwise surjective; Γ is product of two surjections; Hⁿ=0 for n>0 | ✓ | — |
| Erroneous finite-colimit variant | Same discrete 2 | Γ(1⊔1) has 4 elements; Γ(1)⊔Γ(1) has 2 | Source false | Keep epi formulation |
| Totally disconnected implies affinoid | Two field components; empty space | Global rings C×C and 0; spectra have 2 and 0 components respectively | ✓ | R01 for Lean |
| Strict total disconnectedness | Algebraically closed field; nonsplit finite extension L/K | First finite étale covers split; Spa(L)→Spa(K) has no K-section when [L:K]>1 | ✓ | — |
| Relative cover-splitting predicate | Identity; nonsplit field cover | Identity section=id; a field retraction L→K would force degree 1 | ✓ | — |
| Pro-constructible generalizing subset | S, subsets {η}, {s}, ∅ | {η} and ∅ are generalizing; {s} fails because η generalizes s | ✓ | — |
| Automatic integral flatness | Identity; split two-sheet cover | Mod-ϖ maps A→A and A→A² have free ranks 1 and 2 | ✓ | R01 for Lean |
| Faithfully flat refinement | Empty source; nonempty identity | A→0 is flat but not faithful for A≠0; identity is faithfully flat | ✓ | R01 for Lean |
| Prime and characteristic scope | p=2,3; characteristic p field | Same mod-ϖ free ranks 1 and 2; no division by p−1 or requirement p≠2 enters | ✓ | — |
| `IsWLocalSpace` | S; finite discrete 2 | Closed loci {s} and 2 are closed; component spaces are 1 and 2 | ✓ | — |
| Closed points→components homeomorphism | S; empty space | Maps {s}→1 and ∅→∅ are bijective homeomorphisms | ✓ | — |
| w-strict locality | Algebraically closed field | One closed point; every finite étale algebra is Cⁿ and has a component section for n>0 | ✓ | — |
| W-localization carrier | S | Specialization pairs are (η,η),(s,η),(s,s), three points rather than two | ✓ | — |
| Counit `toBase` | Same three pairs | Generalizing endpoint map has fibre { (η,η),(s,η) } at η and { (s,s) } at s | ✓ | — |
| Component label | Same three pairs | Special endpoint fibres are {(η,η)} and {(s,η),(s,s)}; labels are two patch-discrete points | ✓ | — |
| Component-fibre comparison | Label s; label η | Generalizations are {η,s} and {η}; corresponding fibres have 2 and 1 points | ✓ | — |
| W-local functoriality | Swap of discrete 2 | (x,x)↦(1−x,1−x); applying swap twice returns (x,x) | ✓ | — |
| W-local map condition | Map point→S selecting η | Spectral map=true; closed-point preservation=false, so not a w-local map | ✓ | — |
| W-local adjunction direction | Counit on S | Three-point w-local space maps to two-point S; Hom from w-local W is represented on the right | ✓ | Source misprint only |
| Geometric w-localization Checks | Rank-two field spectrum S | Point fibres have sizes 2 and 1 as above; a two-point identity construction misses the second η-lift | ✓ | — |
| Universally open strict cover | C; empty base | Identity C→C is an admissible cover; empty base has empty cover space | ✓ | — |
| Strict-cover nonexample | Perfectoid K with nonsplit finite étale L | Identity on K fails splitting of Spa(L)→Spa(K), although it is universally open | ✓ | — |
| Pro-étale criterion over strict base | n copies of Spa(C), n=0,1,2 | Discrete fibres of sizes n give pro-étale maps; no invertibility of n is required | ✓ | — |
| Topological classification | Base Spa(C), profinite S₀ | Geometric product has points S₀; component pullback over the one-point base is S₀ | ✓ | — |
| Affinoid versus locally pro-étale | Finite discrete 2; discrete ℕ | Both locally pro-étale; only 2 is compact and eligible for the affinoid slice | ✓ | — |
| Component map | Identity on rank-two S | x↦(x,[x]); fibre product S×₁1=S, so comparison is identity | ✓ | — |
| Chosen plus-ring carrier | C⁺ preimage of proper residue valuation ring V | 1,ϖ∈C⁺; a unit lifting a∉V is in O_C but not C⁺ | ✓ | — |
| Affine ring/pair projections | Same C,C⁺ | Ring projection=C; pair projection retains C⁺, not O_C | ✓ | — |
| Chart and Hom universe lifts | Two-point chart | Object still has 2 points; Hom lift wraps each morphism once without identifying distinct maps | ✓ | — |
| Small-chart restriction | Field of cardinality outside universe 0 | Its spectrum can have one point, yet its section field is not Small.{0}; chart predicate fails | ✓ | — |
| Chart coproduct closure | Empty, singleton, two affine charts | Underlying coproduct has 0,1,2 summands; restriction to each summand recovers its own ring | ✓ | — |
| Affine map direction | Swap C×C | Ring swaps factors and spectrum swaps the two points; identity fixes both | ✓ | — |
| Tilting comparison | Characteristic-p perfectoid field | Tilt is the same perfect field; valuation comparison is identity, with the chosen plus ring retained | ✓ | — |

| D2 statement | Instance | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Pro-étale covering condition | Finite split cover; empty cover | n>0 sheets cover a point; zero sheets cover only empty target | ✓ | — |
| `vPrecoverage` | Same finite covers | A compact open point is image of one sheet; image union for empty family is ∅ | ✓ | — |
| Generic precoverage does not imply point surjectivity | Topological ℚ | Every compact open is ∅; empty family satisfies the condition although ℚ is nonempty | ✓ | Keep perfectoid hypotheses |
| Singleton v-cover iff surjective | Two points→point; ∅→point | Both properties true for first, both false for second | ✓ | R01 for Lean |
| `perfdToTop` and v-topology | Identity field spectrum | Map is identity on valuations; identity presieve covers and generates maximal sieve | ✓ | R01 |
| `PerfdKappa` | Finite-size object; too-large field | Bound holds for first; fails once ring cardinal ≥κ, even with one topological point | ✓ | R01 |
| κ-site sheafification | Small full subcategory, identity topology | Small-model transport returns the same presheaf up to equivalence; no free big-site instance is assumed | ✓ | R01 |
| Cutoff independence | κ=κ′; enlargement with same representable | Restriction/extension unit is identity in first; sections on the fixed representable stay its original set | ✓ | — |
| Cohomological coefficient ranges | Point, nonabelian S₃ | H⁰ is S₃, H¹ is one torsor class; no abelian H²(S₃-coefficients) is asserted | ✓ | — |
| Algebraic topos qc object | Point versus infinite discrete ℕ | Finite covers suffice for point; singleton cover of ℕ has no finite subcover | ✓ | — |
| Pro-étale/étale comparison | Algebraically closed field | Finite étale objects Cⁿ remain finite sets n; degree-zero sections unchanged | ✓ | — |
| `structurePresheaf` | Spa(C), disjoint union of two, ∅ | Values are C, C×C and 0; pullback along a component is its coordinate projection | ✓ | R01/R02 |
| Integral structure presheaf | Same affine C,C⁺ | Integral sections are C⁺; chosen unit outside C⁺ is rejected despite lying in O_C | ✓ | — |
| Function v-descent | Split cover C→C×C | Equalizer of two maps to C⁴ consists exactly of diagonal pairs (a,a), hence is C | ✓ | R01 |
| v-subcanonicity | Same split cover, target Z | Two local maps glue iff equal on overlap; resulting global map is unique | ✓ | R01 |
| Additive structure sheaf | Same split cover | Equalizer of additive groups is diagonal C; forgetting multiplication does not add matching sections | ✓ | R01 |
| H⁰ of structure sheaf | Affinoid field; empty object | Both sides are (C,+); empty case both 0 | ✓ | R01 |
| Positive v-acyclicity | Affinoid field; n=0 in n+1 | H¹=0, while H⁰=C≠0; index n+1 excludes the false zero-degree assertion | ✓ | R01 |
| Integral almost acyclicity | Almost module killed by every element of the almost ideal | Its almostification is 0; ordinary module can remain nonzero | ✓ | Keep almost qualifier |
| Vector-bundle comparison | Ranks 0,1,2 over C | Both sites give zero, C and C²; automorphisms at rank 2 are GL₂(C), not merely scalar units | ✓ | — |

| D3 statement | Instance | Computed values on the two sides | Result | Change |
| Morphism v-descent | Split two-sheet cover of X | Compatible pair (f₀,f₁) has f₀=f₁; global Hom equals its matching equalizer | ✓ | — |
| Descent of function-cut subsets | Function 0; unit of norm >1 | Inequality defines whole space for 0 and empty space for that unit, before and after pullback | ✓ | — |
| Totally disconnected-base reconstruction | Identity and Galois field cover L/K | Identity reconstructs R; in Galois case (L)^G=K and overlap ring is ∏_G L | ✓ | — |
| Effective affinoid descent | Empty source over empty base; split two sheets | Descended rings 0 and R respectively; arbitrary unrelated overlap maps are not descent data | ✓ | — |
| Separated pro-étale descent | Finite split sets over C | Matching n-sheet covers descend to n sheets; diagonal remains a closed finite subset | ✓ | — |
| Separated étale/finite étale stacks | Degree 0,1,2 covers | Descent preserves degrees 0,1,2; degree 2 object retains the swap automorphism | ✓ | — |
| Quasi-pro-étale definition | Identity; base change to strict point | Identity remains pro-étale; finite n-sheet pullback remains n-sheet pro-étale | ✓ | — |
| Étale and finite étale relative definitions | Disjoint n points over point | All finite n are finite étale; infinite discrete ℕ is étale but not finite étale | ✓ | — |
| Sub-v-sheaf injection criterion | Empty subset; whole subset of a point | Geometric fibres respectively empty or singleton; two-point fibre violates injectivity | ✓ | — |
| Open immersion | Inclusion of one component of 2 | Image singleton open; pullback over that component is identity, over other component empty | ✓ | — |
| Closed immersion | Same clopen inclusion | Image closed; fibre diagonal is identity; open and closed can hold simultaneously | ✓ | — |
| Separatedness convention | BG→*, nontrivial finite G | Diagonal has fibres Isom(P,Q), not monomorphisms; proper-diagonal convention alone would give wrong answer | ✓ | — |
| Locally separatedness | Doubled origin with finitely many branches | Diagonal is open locally near each branch; distinct origins remain distinct | ✓ | — |
| Zero-truncated maps | Discrete 2→*; BG→* | First fibres are sets and qualify; BG fibre has nontrivial automorphisms and fails | ✓ | — |
| Diagonal on restrictions | Boolean negation fixture | Restricted diagonal of true is (false,false), not (true,false) | ✓ | — |
| v-local morphism tests | Split cover of target | Pullbacks are identical copies of the map; conjunction of local tests equals original test | ✓ | — |
| Continuous-map v-sheaf | Split cover X⊔X→X | Matching continuous maps (f,f) descend uniquely to f, for arbitrary target topology | ✓ | R01 for Lean |
| Locally profinite torsor | Trivial S₃-torsor over point | Six sheets; orbit quotient has one point; transition g,h acts by gh, not hg | ✓ | — |
| Open-subgroup quotient tower | G=ℤ_p, K=pⁿℤ_p | Quotient has pⁿ points, successive maps have p-element fibres; inverse limit is ℤ_p | ✓ | — |
| Torsor relation and geometric carriers | G=C₂, two points | Relation has four arrows and fibre square has four points; diagonal alone would have only two | ✓ | — |

| D4 statement | Instance | Computed values on the two sides | Result | Change |
| Diamond presentation | Identity equivalence relation on X | X/R=X and relation is diagonal; universal relation on nonempty finite discrete X gives one point | ✓ | — |
| Pro-étale relation versus group action | Nontrivial trivial action on a point | Action groupoid has stabilizer G and is not a monic equivalence relation; BG is not a diamond sheaf | ✓ | — |
| Quotient relation recovered | Free C₂ action on 2 | X×_{X/G}X has 4 elements, same as G×X | ✓ | — |
| Refinement independence | Replace point atlas by two sheets | Refined relation is four-element pair groupoid; both quotients have one element | ✓ | — |
| Atlas criterion | Empty diamond; representable point | Empty atlas covers empty object; identity atlas covers point | ✓ | — |
| Diamonds are v-sheaves | Free two-sheet quotient | v-matching sections compute the same one-element quotient | ✓ | — |
| Underlying-space field points | C with rank-two plus ring | Specialization chain has η and s; testing only rank-one points would keep η and lose s | ✓ | — |
| Common field extension equivalence | Same point after two field extensions | Both presentations map to one class; reparametrizing the extension does not create another point | ✓ | — |
| Open-subfunctor correspondence | S | Opens ∅,{η},S give three subfunctors; closed singleton {s} is not an open subfunctor | ✓ | — |
| Compact Hausdorff spaces embed | Finite 2; interval | Underlying spaces remain 2 and [0,1]; interval is not replaced by a profinite space | ✓ | — |
| Small v-sheaf/stack | Representable point; BG for finite G | Both have small atlases; BG still retains its stabilizer rather than becoming its one-point class sheaf | ✓ | — |
| Underlying space of a stack | BG | One isomorphism-class point; automorphism group G remains in the stack, not in its point set | ✓ | — |
| Geometric surjectivity | Two points→point; ∅→point | First covers the unique class; second misses it | ✓ | — |
| Geometric isomorphism criterion | Map 2→1 | Surjective but two points in its fibre, so injectivity/isomorphism test fails | ✓ | — |
| Small quotients | C₂ acting freely on 2 | Sheaf quotient has one section/class; kernel relation is four-element total relation | ✓ | — |
| Quotient carrier Check | Fold Bool→1 | Kernel contains all four pairs; equality relation contains two, so it cannot be used as the kernel | ✓ | — |
| Proper maps | Finite sets; infinite discrete ℕ→* | Finite maps compact and closed; infinite source is not quasicompact | ✓ | — |
| Size obstruction | Discrete set of cardinal ≥κ | Point set already violates <κ although each individual point is small | ✓ | — |

| D5 statement | Instance | Computed values on the two sides | Result | Change |
| Spatial versus locally spatial | Finite discrete 2; infinite discrete ℕ | Both locally spatial; only finite one quasicompact, hence spatial | ✓ | — |
| Spectral underlying topology | Rank-two S | Compact-open basis is ∅,{η},S; no Hausdorff assumption, since η and s cannot be separated | ✓ | — |
| Quasicompact injection permanence | {η}→S | Domain is a one-point spectral space; image is pro-constructible and generalizing | ✓ | — |
| Finite étale permanence | n copies of spatial point | n=0,1,2 give spectral spaces with that many points | ✓ | — |
| Cofiltered diamond limit | Binary finite quotients | Stage sizes 2ⁿ; limit point set has size 2^ℵ₀ and profinite topology | ✓ | — |
| Finite-stage étale comparison | Clopen of binary inverse limit | Compact clopen depends on finitely many coordinates, hence comes from one finite stage | ✓ | — |
| Size of limit | Fewer than κ coordinates, uniform μ<κ | Number of tuples ≤μ^λ<κ by strong-limit bounds; κ independent Boolean coordinates instead give 2^κ≥κ | ✓ | — |
| Size versus chart universe | One-point field outside Type 0 | Topological size=1 but section-ring size not Small.{0}; increasing κ does not fix resizing | ✓ | — |
| Universally open spatial presentation | Finite discrete 2 | Identity is surjective, pro-étale and universally open; a map selecting one point fails surjectivity | ✓ | — |
| Quasi-pro-étale permanence | Profinite product over a point | Fibre products S₀×T₀ are profinite; pointwise product counts multiply for finite sets | ✓ | — |
| Two-out-of-three locality hypothesis | Infinitely many doubled points accumulating | Every branch may be locally spatial; diagonal neighborhoods at the accumulation point need not be open | ✓ | Keep locally separated clause |
| Local structure of étale maps | Two disjoint sheets over point | Each sheet is an open copy of base; total map is not an open immersion because fibre size=2 | ✓ | — |
| Localization | Rank-two S at η and at s | Generalization sets are {η} and {η,s} respectively, not their specialization closures | ✓ | — |
| Locally closed generalizing subset | S, {η}, {s}, ∅ | {η} produces generic subdiamond; {s} fails generalizing; ∅ produces empty diamond | ✓ | — |
| Profinite product/closed projection | {0,1}×S→S | Two-sheet projection sends closed fibres to closed sets; compact fibre gives closed projection | ✓ | — |
| Spatial v-sheaf criterion | Identity cover of a point | Cover point is strictly disconnected; its unique image supplies the required surjectivity | ✓ | — |
| Relative representability | Identity; finite discrete cover | Base change gives the base itself or finitely many copies, hence preserves the relevant spatial class | ✓ | — |
| Three locality clauses for representability | Split target cover | Pullbacks and their overlap reconstruct identical copies; weaker separatedness conclusions are not silently upgraded | ✓ | — |
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
| Marked untilt carrier | Characteristic-p field and identity marking | Tilt identification is id; changing marking by a nontrivial automorphism changes the marked datum | ✓ | — |
| `Spd ℤ_p` integral base | p in ℤ_p and ℚ_p | p is nonunit in ℤ_p, unit in ℚ_p; only latter is a Tate pseudouniformizer | ✓ | — |
| Primitive untilt equation | Mixed-characteristic presentation | θ([ϖ♭]−ϖ)=ϖ−ϖ=0; replacing subtraction by addition gives 2ϖ, nonzero in characteristic zero | ✓ | — |
| Untilts v-descend | Split two-sheet cover | Two untilts with matching marking glue to the original; forgetting the marking permits extra automorphisms | ✓ | — |
| Tate-pair spatial diamond | Perfectoid pair with trivial torsor group | Atlas is original perfectoid object; quotient relation is diagonal and underlying Spa is unchanged | ✓ | — |
| Completed pair comparison | Already complete pair | Completion map=id; plus closure stays original closed integral subring | ✓ | — |
| Rational gluing | Whole rational subset; empty subset | Diamond restrictions recover whole object and empty object respectively | ✓ | — |
| Analytic diamondification | Perfectoid field and its tilt | Diamond identifies via the specified tilt equivalence, not an unmarked arbitrary field isomorphism | ✓ | — |
| Étale-site equivalence | Spa(C), finite n-sheet covers | Objects on both sides have n sheets; maps are functions of the sheet sets, with permutations retained | ✓ | — |
| Finite étale comparison | C²/C | Two idempotents and the swap automorphism survive diamondification | ✓ | — |
| Pre-adic diamondification carrier | Non-Tate integral pair ℤ_p | Mapping functor is defined despite failure of IsTateRing; analytic-only carrier would omit it | ✓ | — |
| Integral smallness | Affine pair with fixed generating cardinal λ | Images of λ generators lie in a sufficiently bounded closed perfectoid subpair; one uniform bound depends on λ, not on the map | ✓ | — |
| Galois quotient | Finite Galois L/K | Generic geometric fibre has [L:K] points and quotient one; special inertia may fix points | ✓ | — |
| Galois action convention | g=(12), h=(23) in S₃ | g·(h·f)=f∘h⁻¹∘g⁻¹=f∘(gh)⁻¹; gh=(123), whereas hg=(132) | ✓ | — |
| Integral quotient is not everywhere torsor | Totally ramified quadratic extension | Generic fibre size 2; residue extension degree 1 and special inertia size 2 | ✓ | — |
| Analytic-locus comparison | ℤ_p, generic versus special valuation | Generic support does not contain p; special support contains p; inverting p retains only generic locus | ✓ | — |
| Pre-adic point topology warning | Rank-two valuation and rank-one coarsening | Both may send p to a value <1, but only cofinal powers give topological nilpotence; rank-two infinitesimal powers need not cross every threshold | ✓ | — |
| Formal resolution comparison | Cusp u²=t³ | Resolution parametrization t=s²,u=s³ gives s⁶=s⁶; pullback of equation is zero | ✓ | — |
| Rig-regular restriction | K[[t]]⟨u,v⟩/(uv) | After inverting t, u=v=0 remains singular; input is not rig-regular and is excluded | ✓ | — |
| Relative algebraic/analytic resolution | Node uv=0 | Normalization has two smooth branches on both sides; over crossing fibre has 2 points, not 1 | ✓ | — |
| `IsSeminormalRing` square–cube convention | Field, z=a | x=a³,y=a² gives x²=y³=a⁶; swapping roots generally fails x=z³,y=z² | ✓ | — |
| Seminormal positive and negative examples | Field; cusp K[t²,t³] | Field has unique root; in cusp x=t³,y=t² require missing z=t | ✓ | — |
| Reducedness requirement | K[ε]/ε² | ε≠0 but ε²=0, so IsReduced is false before the root test | ✓ | — |
| Characteristic 2 and 3 | 𝔽₂; 𝔽₃ | 𝔽₂ pairs (0,0),(1,1) have roots 0,1; 𝔽₃ adds (2,1) with root 2 | ✓ | — |
| Zero-ring seminormality | Zero ring | Exactly one x,y,z; 0=1 and every lifting equality holds uniquely; reducedness is vacuous | ✓ | — |
| Products and equalizers | Fields K×K; branch equalizer | Roots are componentwise; equalizer forces identical residues, so roots retain matching residue | ✓ | — |
| `IsSubintegral` | Cusp→K[t] | Integral t satisfies T²−t²; prime points correspond and residue extensions have degree 1 | ✓ | — |
| Residue-field clause essential | 𝔽_p(s)→𝔽_p(s^(1/p)) | Both spectra singleton and extension integral; residue map has degree p>1, so not subintegral | ✓ | — |
| `subintegral_lift` | Cusp→K[t], evaluation t²↦a²,t³↦a³ | Unique extension sends t↦a; any other b has b²=a²,b³=a³, hence b=a in a reduced field | ✓ | — |
| Lifting across nilpotents | K[ε]/ε²→K, seminormal target T | Every map sends ε to 0; unique factorization through K | ✓ | — |
| Bijective subintegral map | Identity K; K→K[ε]/ε² | First bijective; second subintegral but not surjective, excluded because target not reduced | ✓ | — |
| Existence of seminormalization | Zero ring; field; cusp | Targets respectively 0, K, K[t]; units subintegral in each case | ✓ | — |
| Unique marked comparison | 𝔽₄ with identity unit | Identity respects unit; Frobenius a↦a² moves a∉𝔽₂ and fails the unit triangle | ✓ | — |
| Principal localization | Cusp, invert t² | t=t³/t² now belongs to localized ring; reflection/localization both give K[t,t⁻¹] | ✓ | — |
| Compatible functions on a seminormal node | A=K⟨u,v⟩/(uv), B=K⟨u⟩×K⟨v⟩ | A={(f,g):f(0)=g(0)}; B contains (1,0), A does not | ✓ | Source error recorded |
| Reduced-overlap equalizer | Same normalization | Equalizer condition is f(0)=g(0), recovering A exactly; product B alone is too large | ✓ | — |
| Seminormal structure-sheaf comparison | Node; cusp | Node recovers compatible pairs A; cusp gains t, so O→ν_*Ô is not asserted iso without seminormality | ✓ | — |
| Seminormal rigid full faithfulness | Seminormal source point; nilpotent target thickening | Reduced test-source maps kill ε, agreeing with ordinary maps; allowing nonseminormal cusp source would lose its distinction from normalization | ✓ | — |
| Rational restriction of reflection | Smooth affinoid disc | Ring already seminormal, unit=id; rational restriction returns the same rational algebra | ✓ | — |

## Not verifiable

- **Huber96**, Definition 1.6.5, Proposition 1.6.7 and §2.1/Proposition 2.1.4: the sources service found publisher material behind access restrictions, not an open full text. These supplier-background locators remain uncertified. I checked the corresponding roadmap contracts and did not infer the book's wording from them. None is one of the seeded targets above.
- Ownership against open pull requests without a supplied checkout was not checked. The searches of the supplied checkouts, main and board packages are recorded above; index hits alone are not treated as verified ownership claims.
- No exhaustive proof certification is claimed for the thousands of API clauses and Checks. The complete text was read; the table records computed tests across the layers, all Lean headline signatures and all seeded/finding targets. Source certification is the stated sample plus the additional locators listed above, not every bibliography locator.

## Source issues

- **Error** in ECD at Lemma 7.2(iii), printed page 29: the source says global sections preserve finite colimits of set-valued sheaves under the split-cover condition; it should be preservation of epimorphisms, since the two-point example gives four versus two elements; affects a stated result.
- **Misprint** in ECD at Proposition 7.12, printed page 34: the source says w-localization is left adjoint to inclusion; it should be right adjoint, with counit from the specialization-pair space to the original space; affects a stated result.
- **Error** in GLX at Lemma 3.2, printed page 16: the source says components commute with the locally profinite orbit quotient; it should be restricted, for example to compact groups acting on spectral spaces; dense integer orbits refute the unrestricted claim; affects a stated result.
- **Error** in KL16 at Remark 8.1.4, printed page 159, used in Theorem 8.2.3, printed page 163: the source says resolution pushforward of functions equals the structure sheaf for a seminormal space; it should be the equalizer of branch functions over the reduced overlap; node normalization alone has extra functions; affects the proof.

- **Misprint** in SGA 4 VI at Remark 8.7.8, transcription page 226: the source says the relevant cohomological hypothesis is in 8.6.7; it should be 8.7.7, the immediately preceding cohomology corollary; affects nothing.
