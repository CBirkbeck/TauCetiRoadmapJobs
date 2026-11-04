# Triage report: TARGET-ProetaleCohomologyOfPAdicCurvesAndTowers

**Verdict: `design`**, name `ProetaleCohomologyOfPAdicCurvesAndTowers` (the suggested name; no roadmap, pull request or package uses it). The brief for the design job is in `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/target.md`.

## What I searched

- **Open targets and designs on the board.** I compared the target by mathematical object with TARGET-RefinedTraceMethodsPartII and DESIGN-RationalAnalyticPrismatization. For the latter I read `packages/RationalAnalyticPrismatization/target.md` and its report.
- **The roadmap repository.** I searched main and the 367 open roadmap pull requests with `roadmaps grep`. The searches covered:
  - the Drinfeld half-plane, half-space and tower;
  - Schneider–Stuhler and generalized Steinberg representations;
  - Stein spaces, syntomic cohomology, pro-étale cohomology;
  - every citation of Nizioł (154 lines, in 20 roadmaps), followed by the relevant sections in context.

  I read in full the relevant layers of:
  - EndoscopicTransferAndUnitaryTraceComparison (Layer 12);
  - PadicLocalLanglandsForGL2Qp (§6.9);
  - LocallyAnalyticDistributions (§0.CR.6.6);
  - CohomologyComparisons (§§4.8–4.12);
  - CohomologyComparisonsPartII (Layer 4);
  - ClassicalAdicEtaleCohomology (§§4.6–4.7);
  - VectorBundlesAndIsocrystals (the semistable period-space example);
  - HilbertModularVarietiesAndShimuraCurves (R18.5);
  - TropicalAndBerkovichArithmetic (§§2.12–2.20);
  - SolidAnalyticRings (scope);
  - CrystallineCohomology (CR.6).
- **Board packages.** I read `scratch/board-packages-index.txt` first, then the designs in the board checkout that mention this target or the Colmez–Dospinescu–Nizioł papers:
  - ScholzeFunctorAndModpCohomologyOfTheLubinTateTower (README, plan.json and its two reviews);
  - ModularityAndLanglandsExtensionsPartII (R4, G3);
  - CstConjectureForDaggerVarieties (CS.1 and the G-ANALYTIC contract);
  - ModpRepresentationsOfGL2OverLocalFields (MP.0, MP.2);
  - LocallyAnalyticDistributionsPartII and LocallyAnalyticRepresentationsOfLocalGroups (routes of PAPER-COLMEZ-DOSPINESCU-NIZIOL-20).

  For PadicLocalLanglandsForGL2QpPartII (#392), whose README lives at its own head, I fetched `packages/PadicLocalLanglandsForGL2QpPartII/design/README.md` at 642e432 read-only and read its scope, supplier contracts and Layer 4, together with both reviews in the board checkout.
- **Merge order.** I read `merge-order/ORDER.txt` and computed the positions of every supplier and consumer.
- **Pinned libraries.** I ran GitHub code search on TauCeti and Mathlib and read the pinned files. Mathlib at 6b7abb3 has `Mathlib/AlgebraicGeometry/Sites/Proetale.lean` and `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean` (`ellAdicSheaf`, `EllAdicCohomology`), for schemes only. Neither library has rigid or dagger pro-étale cohomology, Hyodo–Kato cohomology, Drinfeld spaces or generalized Steinberg representations.
- **Sources.** I read the introductions and the cited statements of CDN-CURVES, CDN-STEIN, CDN20, CDN23 §2, CDN-DUKE, DAT06 (§§3–4), GK05, CN-I, CN-II, CGN23 and THO24 (§3). All were fetched through the sources service.

## What I found

**Consolidation (step 0): no merge.**
- RationalAnalyticPrismatization plans Gelfand stacks and analytic prismatization. Its own report reaches the same conclusion from the other side, and calls this target at most a later consumer of twistor-stack duality, which here belongs to the proposed Part II.
- RefinedTraceMethodsPartII (Hochschild and cyclotomic traces) shares no object.

**Ownership (step 1): no owner, but many neighbours.**
- **EndoscopicTransferAndUnitaryTraceComparison** Layer 12 owns the Lubin–Tate and Drinfeld towers as spaces, their ℓ-adic compactly supported cohomology, and three p-adic side lemmas from CDN (§§12.10, 12.19, 12.21). It does not own the p-adic cohomology computations.
- **LocallyAnalyticDistributions** §0.CR.6.6 owns the Hyodo–Kato cohomology of Stein curves and towers, a supplier. CohomologyComparisonsPartII §§4.2–4.5 owns the local syntomic-to-nearby-cycles comparison, also a supplier.
- **CohomologyComparisons** owns the proper case. Its §4.12 says the proper-curve fundamental sequence is "supplied elsewhere".
- **CstConjectureForDaggerVarieties** CS.1 states the model-free Stein and dagger-affinoid fundamental diagram over C in all dimensions (CN-II Theorem 6.14). It routes its syntomic input to an unowned contract, G-ANALYTIC, and says the model-based Stein route is narrower and not represented there. Hence:
  - the curve case of that statement (T2) is imported, not restated;
  - the semistable G_K-equivariant refinement (T5) is new here;
  - the overlap is recorded as a risk.
- **PadicLocalLanglandsForGL2QpPartII** (board) plans the F = ℚ_p tower diagram (§4.1) and the d = 1 half-plane cohomology (§4.2), after its first review split the old gap G7 and told it to keep the rest. It treats F = ℚ_p only and leaves CDN20 Théorème 0.6 and the general-F diagram to "the GL₂(F) theory". That package consumes the Scholze-functor nodes, so it follows this roadmap in the order. The duplication is therefore resolved by moving ownership of the general geometric statements here, with §§4.1–4.2 importing them.
- **ScholzeFunctorAndModpCohomologyOfTheLubinTateTower** (board, position 311) declares its gap `proetale-finite-presentation`, CDN23 Théorème 2.1, with this roadmap as its named supplier. The paper extraction routed items 2-thm-2-1, 2-prop-semistable, 2-cpcf and 2-cpcf-lemmas here. The Bloch–Kato–Hyodo item is already ClassicalAdicEtaleCohomology §4.7.
- **ModularityAndLanglandsExtensionsPartII** R4 routes "the derived Drinfeld input" for Thorne 2024 §§3–5 here. Reading THO24 §3 shows that this input is Dat's compactly supported ℓ-adic complex of the Drinfeld half-space Ω^{n−1} with coefficients E, O_E or O_E/ϖ^c (THO24 Theorems 3.5–3.6, from DAT06 Théorème 3.1.1 and Proposition 4.2.2). It is not p-adic cohomology. It is placed here as T6(d), because the half-space chapter computes the same object in every coefficient theory. The derived-tensor concentration stays with the consumer.
- Nothing on main, in the open pull requests or on the board computes the cohomology of Drinfeld half-spaces of dimension at least two in any theory: searches for Schneider–Stuhler, Drinfeld symmetric space and Orlik found only citations of Grosse-Klönne for monodromy on dagger spaces.

**New roadmap or Part II (step 2).** No existing roadmap continues in this direction. EndoscopicTransferAndUnitaryTraceComparison stops at ℓ-adic tower cohomology, and LocallyAnalyticDistributions stops at Hyodo–Kato cohomology. The verdict is therefore `design`, not `part-ii`.

**Generality (step 3).** The target is widened in four directions:
- all curves (affinoid, overconvergent, Stein, proper);
- every finite F/ℚ_p for the tower;
- every dimension and every coefficient theory for Ω^d;
- semistable Stein spaces of any dimension.

The source's assumption v_p(C^×) = ℚ (CDN-CURVES line 92, explained at CDN-CURVES line 124) is flagged for the design to remove through B_cris or to keep as the source's own restriction. The special cases (Drinfeld's H¹ computation, the F = ℚ_p diagram, disc, annulus, affine space) become Checks.

**Scope cut.** Duality and compact supports (CGN23 Theorem 1.1, in solid ℚ_p-vector spaces), together with CDN20 Théorème 0.6 (compactly supported de Rham cohomology of the two towers), are proposed as ProetaleCohomologyOfPAdicCurvesAndTowersPartII. They need the solid formalism of VStackSheavesAndLisseCategories and a compactly supported syntomic comparison, and no current consumer asks for them.

**Merge order.** The last supplier is ModpRepresentationsOfGL2OverLocalFields (308), needed only for T7(d)–(e), so the roadmap is inserted at 309, before ScholzeFunctorAndModpCohomologyOfTheLubinTateTower (311). There is one cycle hazard: Strauch's connected components of the tower, needed in T7(b)–(c), are planned only in SZ.0 of the later Scholze-functor package. The recommended fix, recorded under Risks in target.md, is to move the Drinfeld-side component theorem here.

## Sources

Twelve works are recorded in `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/sources.toml`. Eleven are open texts: arXiv, plus Numdam for DAT06. SS91 (Invent. Math. 105) resolves only to a paywalled page and is recorded as `uncertified`, cited by its locator. Its statements are restated in CDN-STEIN Theorem 5.8 and §5.3, which is the readable account used.

While re-trying SS91 with a citation string, the service wrote a `[[missing]]` entry to the scratch `needs-references.toml`. SS91 is already settled as `uncertified`, so I deleted that file; nothing needs a human answer.

Version notes:
- CDN-CURVES has no journal version.
- CDN-STEIN, CDN20, CDN-DUKE, CN-I and GK05 are cited by their arXiv numbering.
- CDN23 theorem numbers agree with the Forum Math. Pi version as cited by the Scholze-functor design; its pages differ.

## Suspicious text

None of the issue text, board files or fetched sources contained instructions.
