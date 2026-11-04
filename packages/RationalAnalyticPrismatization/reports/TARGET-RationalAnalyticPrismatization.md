# TARGET-RationalAnalyticPrismatization: triage report

**Verdict:** `design`. **Name:** `RationalAnalyticPrismatization`. **Base:** none. **Owner:** none.

The brief for the design job is `packages/RationalAnalyticPrismatization/target.md`. The sources are recorded in `packages/RationalAnalyticPrismatization/sources.toml` (17 entries, `sources check`: 0 problems). No text was missing, so there is no `needs-references.toml`.

## What I searched

**Source.** I fetched the target's source through the sources service: ALRS, from the author's page, 193 pages. I read:

- the introduction (ALRS line 1 – ALRS line 625);
- the statements of §§2–6 and Appendix A, including Definition 4.1.1 (ALRS line 2953) and Theorems 5.1.1, 6.1.1–6.5.8 (ALRS line 4738 – ALRS line 8952);
- §§6.6–6.7 (ALRS line 8985 – ALRS line 9305);
- the bibliography (ALRS line 10286 onward).

Its foundation, ABLB (arXiv:2510.15196v2, 129 pages), I read for its table of contents and for the definitions and theorems ALRS relies on: Gelfand rings, Gelfand stacks, derived Berkovich spaces, de Rham stacks, Hyodo–Kato stacks.

**Library and roadmaps.** I searched by mathematical object, not only by name. Every search used `roadmaps grep` over all open roadmap pull requests at their heads and over main, plus a recursive grep of the board packages:

- Gelfand rings and stacks; `2510.15196`; analytic de Rham stack; Hyodo–Kato stack; analytic prismatization; prismatization; twistor; nilperfectoid; derived Berkovich;
- analytic stacks; Gestalten; six-functor formalisms (Heyer–Mann, Scholze); `!-able`; suave; descendable;
- Sen operator and Sen theory, including geometric Sen theory; locally analytic vectors; decompletion;
- Banach–Colmez; Hodge–Tate stack; Faltings' extension; Breuil–Kisin twist; prismatic logarithm; Cartier–Witt;
- Simpson; Riemann–Hilbert; pro-étale cohomology; p-adic Poincaré duality; first Chern class;
- Robba; Berger–Colmez and Cherbonnier–Colmez; solid locally analytic representations; Hyodo–Kato;
- the arXiv numbers of ALBM, AM24, RCSen, Bosco, CGN, RC24, Hauck.

For each of these roadmaps I saved the README and read its scope section and the relevant layers:

- PrismaticCohomology I–IV, RelativeFarguesFontaine, FarguesFontaineDiamonds, HodgeTateAndCanonicalSubgroups;
- LocallyAnalyticDistributions, SolidAnalyticRings, PadicHodgeTheory, VectorBundlesAndIsocrystals, VStackSheavesAndLisseCategories;
- PhiGammaModulesAndIwasawaCohomology, CohomologyComparisons and its Part II, ClassicalAdicEtaleCohomology and its Part II;
- CompletedCohomologyPartII, CompletedCohomologyAndLocalGlobalCompatibility, TropicalAndBerkovichArithmetic, DiamondsAndVStacks, AdicSpacesPartIV (main), EnhancedDerivedSheaves (main), SchemeAndStackFoundations (main).

Board designs and packages read:

- on this branch: MotivesAndAlgebraicCyclesPartII, LocallyAnalyticRepresentationsOfLocalGroups, LocallyAnalyticDistributionsPartII, PadicHodgeParametersInLocallyAnalyticRepresentations, RelativeFarguesFontainePartII, CstConjectureForDaggerVarieties, AutomorphicBundlesPartII, HigherHidaAndColemanTheory (review report);
- at their review heads, read-only through the GitHub contents API as the board index instructs: PadicHodgeTheoryPartII, VectorBundlesAndIsocrystalsPartII, VStackSheavesAndLisseCategoriesPartII, CrystallineCohomologyPartII, SchemeAndStackFoundationsPartII, ShimuraVarietiesPartII, HigherHidaAndColemanTheory, CompletedCohomologyAndLocalGlobalCompatibilityPartII.

I also grepped the pinned Tau Ceti (`a91d3aa`) and Mathlib (`6b7abb3`) sources for prismatization, Gelfand rings, locally analytic vectors, Sen operators, Hyodo–Kato and de Rham stacks, nilperfectoid and Banach–Colmez. There were no hits. The pins contain light condensed modules (`Mathlib/Condensed/Light/*`) and the integer solidity predicate (`Mathlib/Condensed/Solid.lean`).

## What I found

**Consolidation (step 0).** None of the three open targets is a merge.

- TARGET-ProetaleCohomologyOfPAdicCurvesAndTowers (#401) concerns pro-étale cohomology of p-adic curves and of the Drinfeld tower. Its natural sources (Colmez–Dospinescu–Nizioł) use syntomic methods on curves, not Gelfand stacks or prismatization. At most it is a later consumer of the twistor-stack duality.
- TARGET-RefinedTraceMethodsPartII and TARGET-AnabelianGeometryAndNonabelianChabautyPartII are unrelated.

No open design plans Gelfand stacks or analytic prismatization.

**Duplication (step 1).** Nothing owns the target's objects. The nearest neighbours are different objects:

- *Integral prismatic chain.* PrismaticCohomology I–IV are integral and formal-scheme based. Part II §§4.3–4.14 builds WCart and WCart^HT ≅ B𝔾_m^♯ with its Sen operator. Part III §6.10 builds the integral prismatic logarithm. These are analogues of ALRS §§4.4, 4.10, not the same objects.
- *Analytic prismatic F-crystals.* CohomologyComparisons §2.24 builds the Guo–Reinecke crystals: vector bundles on Spec A minus V(p,I) for integral prisms. This is a different notion from the rational analytic prisms of ALRS Definition 4.1.1.
- *Fargues–Fontaine and Banach–Colmez geometry.* RelativeFarguesFontaine, VectorBundlesAndIsocrystals (VB3 Banach–Colmez spaces) and FarguesFontaineDiamonds give adic/v-sheaf geometry over perfectoid bases. ALRS realises Fargues–Fontaine curves and Banach–Colmez spaces as Gelfand stacks on nilperfectoids, whose de Rham stacks are the classical objects. These are suppliers.
- *Locally analytic and solid theory.* LocallyAnalyticDistributions explicitly excludes solid and condensed analysis. LocallyAnalyticRepresentationsOfLocalGroups LR.2–LR.3 (board design) owns derived and solid locally analytic vectors for linear representations. ALRS §5 needs the semilinear, Gelfand-stack version, so LR.2–LR.3 are suppliers.
- *Classical p-adic Hodge inputs.* PadicHodgeTheory owns Faltings' extension (§2.3), Sen theory for C-representations (§4.4) and Scholze's Riemann–Hilbert functor (§7.1, `associatedLocalSystem`). PhiGammaModulesAndIwasawaCohomology §1.4 owns the cyclotomic decompletion of Robba (φ,Γ)-modules. ClassicalAdicEtaleCohomologyPartII §5.9 owns rational Poincaré duality for smooth proper rigid spaces. ALRS gives new stack-theoretic proofs and the partially proper versions; the classical statements become comparison targets and Checks.
- *Other near misses.* HodgeTateAndCanonicalSubgroups concerns Shimura period maps, log Faltings' extension and DLLZ decompletion of Kummer towers, which are different. SolidAnalyticRings concerns spectral solid coefficients. VStackSheavesAndLisseCategories VS2.2 supplies solid E-coefficients, analytic measures and AnSpec of discrete rings, but no analytic stacks with the !-topology.

**Part II (step 2).** No existing roadmap is continued in the same direction. The geometric framework is new, so the verdict is `design`.

**Unowned foundations.** The general analytic-stack layer has no owner on main, in the open pull requests or on the board: Clausen–Scholze analytic stacks for !-equivalences, the quasi-coherent six-functor formalism, the Heyer–Mann extension theorem, suave/prim maps and Betti stacks. MotivesAndAlgebraicCyclesPartII (merge order 220) imports it as `AnalyticStacks:AS.0–AS.1`. AutomorphicBundlesPartII records it as gap G-solid. The HigherHidaAndColemanTheory review found that `AnalyticStacks` exists nowhere.

This roadmap cannot own that layer. Its own last supplier is LocallyAnalyticRepresentationsOfLocalGroups (302), so if it owned AnalyticStacks, MotivesAndAlgebraicCyclesPartII would consume a later roadmap. The brief therefore records the layer as a supplier gap with an explicit contract and asks a human to file an AnalyticStacks target.

The Gelfand-stack foundations of ABLB are needed only here at present, so they stay inside this roadmap as its first layers. Their interface is frozen early so that they can be split out later.

**Generality (step 3).** The filed wording matches the generality the sources support:

- ℚ_p-coefficients, the source's own restriction (ALRS line 551);
- arbitrary Gelfand stacks for the constructions, †-cohesive ones for the cartesian descriptions;
- the main comparison for smooth partially proper rigid spaces over finite K/ℚ_p (Theorem 6.3.1) and over perfectoid bases (Theorem 6.2.1).

The arithmetic case X = GSpec(K) and the toric charts are Checks. The extensions sketched in ALRS footnotes 48 and 50 are recorded as non-targets.

**Name (step 4).** `RationalAnalyticPrismatization` is unused by any roadmap, pull request or package. The board created the package folder for this job.

**Suppliers and consumers (step 5).** Both are listed in the brief with merge-order lines. The provisional placement is immediately after LocallyAnalyticRepresentationsOfLocalGroups, and after a future AnalyticStacks entry. No current roadmap later in the order consumes this one.

**Sources (step 6).** All 17 works were fetched legally (author pages and arXiv).

- Berger–Colmez first resolved only to a publisher landing page. The arXiv copy (1405.5430v1) was then found and fetched, so no request remains.
- Version notes record where the cited numbering differs from what ALRS cites:
  - ABLB v2 numbering differs from ALRS's citations; for example, ALRS calls the Gelfand-ring definition 3.3.1, and in v2 it is 3.1.1.
  - Sch13 gives Faltings' extension as Corollary 6.14.
  - AHLB's main theorem is Theorem 1.2.

## Observations for other owners

LocallyAnalyticRepresentationsOfLocalGroups LR.2 and CompletedCohomologyPartII F.4 both plan the derived locally analytic vectors functor RLA. This lies outside this triage. It is noted in the brief so that the owners can consolidate.

## Untrusted text

Nothing in the issue form, the fetched papers or the roadmap and package texts asked me to run commands, change files outside the job, or contact services. The ALRS acknowledgements contain a light-hearted "AI disclosure" (ALRS line 623). It is not an instruction and was ignored.

## Not done

The triage writes no Lean and makes no merge-order edit, as the brief requires.
