<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2381#issuecomment-6670907759 -->
Review (claude) of 38d3cc7

Verdict: needs_changes

1. **F01** (P3) 1.4 cites a passage of Dospinescu–Le Bras that does not contain the statement

   Location: `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md` line 356, the citation "(Schneider–Teitelbaum 2003, Proposition 6.4, p. 34, and Lemma 3.6, p. 11; Dospinescu–Le Bras, §1.1, p. 4)".

   Claim: the five statements of 1.4 (abelian category, strictness, closed subrepresentations, finitely generated submodules and finitely presented modules, finite length and Jordan–Hölder) are supported at the three locators.

   Witness: DLB17 lines 134–173 (printed p. 4, §1.1) define the category Ban^adm(G), the analytic and smooth vectors of a Banach representation and state Théorème 1.2; nothing on that page concerns the category of admissible locally analytic representations, strictness or finite length. A search of the whole text for "longueur" and "Jordan" finds no such statement anywhere. ST03 line 1343 (Proposition 6.4, p. 34) gives (i)–(iii) and ST03 lines 430–448 (Lemma 3.6 and the paragraph after it, p. 11) give (iv); (v) follows from 1.3 and Lemma 3.6.

   Repair: delete "; Dospinescu–Le Bras, §1.1, p. 4" from the citation. Nothing else changes; the two Schneider–Teitelbaum locators cover (i)–(iv), and (v) is derived in the proof route.

2. **F02** (P3) 2.1 cites Lemma 3.4 of Schneider–Teitelbaum (Israel J.) on the wrong pages

   Location: `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md` line 483, "(Schneider–Teitelbaum 2002, Israel J., §3, Lemma 3.4, pp. 13–14; …)".

   Claim: Lemma 3.4 is printed on pages 13–14.

   Witness: ST02B line 492 is the marker of page 14 and line 514 is the statement of Lemma 3.4; its proof runs past the page-15 marker at line 528. The printed folios at lines 491 and 527 read 13 and 14, so the lemma occupies printed pages 14–15.

   Repair: replace "pp. 13–14" by "pp. 14–15" in 2.1. The statement (admissible if and only if the dual is finitely generated over K[[G]]) is as the README quotes it.

3. **F03** (P3) Layer 1 cites Layer 2 (1.2 (iv) needs 2.1) and its dependency list omits it

   Location: `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md` line 323, "(iv) for an admissible Banach representation B (2.1) the locally analytic vectors B^la are strongly admissible", and line 331, "*Needs:* 1.1; 2.1 for (iv); …"; line 475 (Layer 1 Dependencies) lists no Layer 2 target, while line 577 (Layer 2 Dependencies) lists "Layers 0–1".

   Claim: a target of Layer 1 uses a definition made in Layer 2, so the layer graph has the edge Layer 1 → Layer 2 as well as Layer 2 → Layer 1 (2.2 needs 1.2 and 1.4), and the Layer 1 dependency list does not record the forward edge.

   Witness: at the target level there is no cycle (2.1 needs nothing from Layer 1), but "Layer k in build order" and "every layer its dependencies" are both violated: the README's own Layer 1 dependency list is incomplete and Layers 1 and 2 depend on each other at layer level.

   Repair: in 1.2 (iv) replace "for an admissible Banach representation B (2.1)" by "for an admissible unitary Banach representation B of a compact open subgroup H (PadicLocalLanglandsForGL2Qp §0.1)" and delete "2.1 for (iv)" from the *Needs:* line of 1.2. The non-unitary case already lives in Layer 2: 2.1 (ii) reduces an admissible Banach representation of G to a unitary one of H, and 2.2 (iv) states that Π^la is very strongly admissible; add to the proof route of 2.2 (i) the words "after restriction to H by 2.1 (ii)". Tested on the instance that motivated the clause: for G = ℚ_p^× and the character x ↦ x (admissible, not unitary), 2.1 (ii) restricts to ℤ_p^×, where the character is unitary, and 1.2 (iv) in its repaired form applies there; strong admissibility is tested on one compact open subgroup (1.2 API), so the conclusion for G is unchanged.

4. **F04** (P3) Scope does not name the GL_2(ℚ_p) cases of 1.6 and 5.2 that PadicLocalLanglandsForGL2Qp already states

   Location: `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md` lines 19–30 (the deferrals of the Scope section) and the Checks of 1.6 (lines 395–400) and 5.2 (lines 865–870).

   Claim: locally algebraic vectors and the locally analytic principal series are constructed here in general; the special case 𝐆 = GL_2, L = ℚ_p is already stated by a supplier and the README does not say so.

   Witness: PadicLocalLanglandsForGL2Qp (head 84416ad) §2.4, "GL₂ locally algebraic vectors inside the analytic-vector functor" (README line 749: Π^alg = ⊕_W W ⊗ Hom_𝔤(W, Π^an)^sm over W = Sym^(k−1) ⊗ det^a), and §4.8, "Locally analytic vectors of the unitary principal series (trianguline case)" (README lines 1588–1605: the locally analytic principal series of GL_2(ℚ_p) with its central action, the special subrepresentation when δ_s = x^k and St^an). The present README's 1.6 and 5.2 state the general split-group versions and are not duplications, but the house rule asks that a kept variant say in one clause how it differs from what a supplier states.

   Repair: add to the Scope deferrals one bullet, "**GL_2(ℚ_p) special cases.** The locally algebraic vectors of an admissible representation of GL_2(ℚ_p) and the locally analytic principal series of GL_2(ℚ_p) with its special subrepresentation and St^an (PadicLocalLanglandsForGL2Qp §§2.4 and 4.8); 1.6 and 5.2 state the constructions for a split reductive 𝐆 over L and specialise to them." Add to 1.6 the Check "Compatibility: for G = GL_2(ℚ_p), V_lalg is the decomposition ⊕_W W ⊗ Hom_𝔤(W, V)^sm of PadicLocalLanglandsForGL2Qp §2.4" and to 5.2 the Check "Compatibility: for 𝐆 = GL_2 and L = ℚ_p, PS(χ) is the locally analytic principal series of PadicLocalLanglandsForGL2Qp §4.8". Tested on the instance: for χ = χ_sm z^((k,0)) the 1.6 Check at line 400 and §2.4's W = Sym^k ⊗ det^0 name the same locally algebraic subspace (Ind χ_sm)^∞ ⊗ Sym^k E².

Four findings, all P3 (two locator slips, one build-order forward reference, one scope clause). No principle is violated, no statement was refuted, every sampled locator but one supports its claim, every supplier citation resolves at the supplier's current head, the seven declared gaps are precise and minimal, and `Suggested.lean` elaborates with no message. The verdict is `needs_changes` only because each finding is a repair the fix worker should apply before the port.

## Verified sound

**Principles.** No route-specific shortcut (the GL_n application is stated for all n ≥ 1 and all finite L/ℚ_p, with the endpoint statements requiring n ≥ 2 and saying so); no roadmap is re-planned (the compact theory, admissibility, analytic vectors, Jacquet modules, charts and the smooth theory are imported by section, checked below); no copied passage (locators only); no algorithm; `Suggested.lean` has no declaration, hence no sorry'd data and no `set_option`; the single import is `import Mathlib`. No fetched text contained an instruction; nothing suspicious to quote.

**Elaboration.** `lake env lean` on `packages/LocallyAnalyticRepresentationsOfLocalGroups/Suggested.lean` from the content checkout: exit 0, no output (no warning, no `sorry`). The file declares only the namespace, so the `#check @name` comparison and the one-tactic padding probe have nothing to run on; I say so rather than claim a probe. The module docstring names each headline and the carrier it lacks.

**Headline theorems and statability at the pins.** README headlines: (1) the Schneider–Teitelbaum anti-equivalence for non-compact G (1.3) and Breuil's Ext¹ identification (1.8); (2) Pan's strong LA-acyclicity (2.5); (3) BCGP's Grothendieck property and the comparison of solid derived vectors with Pan's functors (3.7, 3.8); (4) Schraen's spectral sequence (5.5); (5) the Orlik–Strauch irreducibility and Jordan–Hölder theorems (6.4, 6.5); (6) the adjunctions of Emerton and Breuil (7.5, 7.6); (7) Ding's theorems (8.8–8.14, 9.6–9.7, 10.5–10.7). Checked at the pins: `Mathlib/Topology/Algebra/Module/LocallyConvex.lean:50` (`LocallyConvexSpace` requires `[PartialOrder 𝕜]`), `Mathlib/Analysis/LocallyConvex/Barrelled.lean:90–93` (`BarrelledSpace` through real-valued `Seminorm`), `Mathlib/Condensed/Solid.lean:48,83` (only `profiniteSolid` and the predicate `CondensedMod.IsSolid`; no solid E-vector spaces over a p-adic field, no solidified group ring), `TauCeti/Algebra/Lie/HighestWeight/Verma.lean:140–146,195,525` (`VermaModule` and `irreducibleQuotient` for `[IsKilling K L]` with a base; gl_n is not Killing and there is no category O), no locally analytic function space with values in a locally convex space, no distribution algebra and no Fréchet–Stein algebra anywhere in Mathlib or Tau Ceti (searches for `LocallyAnalytic`, `Coadmissible`, `FrechetStein` return nothing; the only `Distribution` in Tau Ceti is `TauCeti/Geometry/Lie/InvariantVectorField/Distribution.lean:84`, a tangent distribution). Each headline needs at least one of these carriers, so the empty file is the correct acceptance test. No padding.

**Dependency check.** Output of the gate: `depcheck: 241 roadmaps, 2432 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.

**Library declarations opened at the pins** (file and line): `CategoryTheory.Abelian.Ext` (`Mathlib/CategoryTheory/Abelian/Ext.lean`, `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean`), `DualNumber` (`Mathlib/Algebra/DualNumber.lean`), `UniversalEnvelopingAlgebra` (`Mathlib/Algebra/Lie/UniversalEnveloping.lean`), `continuousCohomology` (`Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131`), `TopRep` (`Mathlib/RepresentationTheory/Continuous/TopRep.lean:31`), `LieGroup` (`Mathlib/Geometry/Manifold/Algebra/LieGroup.lean`), `IsUltrametricDist` (`Mathlib/Topology/MetricSpace/Ultra/Basic.lean:46`), `TauCeti.completedGroupAlgebra` (`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`), `TauCeti.VermaModule` and `TauCeti.irreducibleQuotient` (as above). All exist with the stated meaning; the README's caveats (ordered scalars, real seminorms, Killing hypothesis) are correct.

**Supplier citations resolved** (every cross-roadmap section and target name in the README, at the head the brief gives):
- PadicLocalLanglandsForGL2Qp (#1312, 84416ad) §0.1 (README lines 206–239): LA(X, L) on locally F-analytic manifolds including non-compact ones through compact charts, D(H, L) with Dirac and convolution, Fréchet–Stein and coadmissible modules, admissibility of a locally analytic G-representation by restriction to compact open H with independence, the compact anti-equivalence, the unitary Banach category with Schikhof duality, and the analytic-vector statements. ✓
- CompletedCohomologyPartII (#1035, 1788162) F.1 (lines 184–200: admissible unitary Banach category, compact-open test) and F.4 (lines 242–255: V^la by analytic orbit maps, fixed-radius stages, compact-open restriction, F_v-variant, differentiated action, RLA(V) = RΓ_cts(H, C^la(H, V))). ✓
- OverconvergentAutomorphicForms (#1422, beb4bd7) §0.6 (lines 316–398): full character space Ẑ with Ẑ_0 × 𝔾_m^a, Mellin map, essentially admissible representations, finite-slope part with its universal property, the normalised positive Jacquet operator `[N₀ : mN₀m⁻¹]⁻¹ ∑ n m v` (line 388, the averaged form of Convention 5), J_P with M-action, independence of N_0, left exactness, smooth and locally algebraic comparisons. ✓ Its §0.4 "analytic induction" (lines 205–214) is the induction of a finite analytic coefficient on a chart, a different object from 5.1.
- SmoothRepresentationsOfLocalGroups (#1688, 4178a1e): all twenty cited target names found at the cited sections (SR.0.1 lines 618, 638; SR.0.2 line 699; SR.0.4 lines 866, 927; SR.0d.1 line 1659; SR.0d.2 line 1840; SR.2.1 lines 1900, 1919, 1963, 1973; SR.2.2 lines 2029, 2077, 2098, 2175; SR.2.3 line 2189; SR.3.1 lines 2605, 2672; SR.3.2 line 2780; SR.3.4 line 2983). ✓
- LocallyAnalyticDistributions (#854, 473fb50): §0.0 targets at lines 896, 911, 926, 958, 974; §0.2 targets at lines 1094 (Hahn–Banach), 1108 (Fréchet open mapping), 1136 (extensions of compact type); §0.3 target at line 1377. ✓
- LocallyAnalyticDistributionsPartII (design on the board, `packages/LocallyAnalyticDistributionsPartII/design/README.md`, in the merge order): all fourteen cited target ids `ND.0/p-valued-analytic-structure`, `ND.0/ordered-basis-chart`, `ND.1/distribution-algebra`, `ND.1/lie-algebra-in-distributions`, `ND.1/iwasawa-to-distributions`, `ND.1/open-subgroup-decomposition`, `ND.2/frechet-stein-algebra`, `ND.2/coadmissible-module`, `ND.2/coadmissible-theorems`, `ND.2/banach-steps`, `ND.2/frechet-stein-distribution`, `ND.2/faithful-flatness`, `ND.3/arens-michael-envelope`, `ND.6/banach-iwasawa-duality` exist both as README targets and as `plan.json` node ids. ✓
- ReductiveGroupsPartII (main) RG2.0.2 targets at lines 619, 640, 746; RG2.4.2 *iwahori-factorization* line 5834; RG2.4.4 *iwasawa-decomposition* line 6289. ✓ ReductiveGroups (main) Layers 1, 2, 7 at lines 176, 227, 627. ✓ LieHighestWeight (main, `TauCetiRoadmap/RepresentationTheory/LieHighestWeight`) Layers 3, 4, 5, 7, 9 at lines 405, 537, 567, 931, 1432; it has Verma modules and no category O. ✓ AdicSpacesPartIII (main) R3.4 *quasi-stein-space*, *quasi-stein-theorems-a-b* (lines 591, 594). ✓ PadicMeasuresIwasawaAlgebras (main) §1.7 (line 909). ✓ ArithmeticLocallySymmetricSpaces (#871, 360d0bc) ALS.4.5 (line 3594, Kostant for 𝐆 = Res_(F/ℚ)G over a splitting field; the gap asks exactly for the general split group). ✓ VStackSheavesAndLisseCategories (#1230, 3a80c09) §VS2.2 *Solid nonarchimedean coefficients* (line 729, which assigns the classical comparison to "the functional-analysis consumer") and §VS2.1 *derived-solid-tensor* (line 652). ✓
- Downstream consumers: PadicHodgeParametersInLocallyAnalyticRepresentations (board design) and TriangulineVarietyAndItsLocalModel (#1829, draft) exist; the latter's README lines 18 and 117 cite this roadmap for the inductions and Orlik–Strauch constituents. ✓

**Ownership by object** (`roadmaps grep` over the 457 open pull requests and main, read in full for every hit): locally analytic parabolic induction, locally analytic principal series of a split group, Orlik–Strauch functors, closed induction, balanced maps, very strong admissibility, coadmissible D(G, E)-modules for non-compact G, category O and Verma multiplicities, Kohlhaase homology, Pan's R^iLA, solid representations of Stein groups and locally profinite groups: no owner other than this roadmap. Hits in CompletedCohomologyAndLocalGlobalCompatibility (locally algebraic vectors of completed cohomology, GL_2(ℚ_p)), OverconvergentAutomorphicForms (§0.4, a different induction), SpringerResolutionAndCharacteristicCycles (no category O or Verma module) and PadicLocalLanglandsForGL2Qp (§§2.4, 4.8, the GL_2(ℚ_p) cases of R04) are consumers or special cases. Ownership against the board packages was checked through the board packages index the brief provides and the design folders present in the board checkout.

**Declared gaps.** The seven slugs in `design/plan.json` `gaps` (lines 7333–7372) are the seven stated under `## Exact supplier contracts` with `What <Supplier> must provide (gap:<slug>)`. Each has a named supplier earlier in the merge order, a one-sentence `needs` with its hypotheses, and asks for nothing already provided: barrelledness is not in LocallyAnalyticDistributions §0.0 (its targets are separation, limits, strict maps, tensors), the compact-type tensor duality is not there either, ALS.4.5 is stated only for Res_(F/ℚ)G, and SR.3 is over ℂ (README line 89 of the supplier: "Coefficients are … ℂ in SR.3"), so the four finite-coefficient forms are genuinely missing.

**Sources: the seeded sample**, every locator read at its line (printed pages as the README cites them):
- 0.5: ST02 line 527 (Proposition 3.2, p. 13): separately continuous module structure, extends U(g), G-maps are module maps. ✓ Also Lemma 3.1 (line 514, p. 13) and Corollary 3.3 (line 553, p. 14) for 0.4 and 0.6.
- 0.7: DLB17 lines 1153–1166 (Lemme 5.9, pp. 28–29): continuity of w ↦ (g ↦ λ(g·w)) for compact-type W, proved coset by coset and by reflexivity, exactly the route of 0.7. ✓
- 1.4: ST03 lines 1343–1358 (Proposition 6.4, p. 34) and 430–448 (Lemma 3.6, p. 11). ✓ The DLB locator is R01.
- 2.1: ST02B line 514 (Lemma 3.4; pages are R02), ST03 lines 1504–1524 (§7 and Theorem 7.1, p. 38), EM17 line 5927 (Proposition 6.2.4, p. 118) and line 5886 (Definition 6.2.1, p. 117). ✓
- 2.3: PAN22 lines 503–523 (Lemma 2.1.5 and Lemma 2.1.8, p. 12), 541–549 (Definition 2.2.1, pp. 12–13: strong LA-acyclicity as essentially zero direct systems), 550–570 (Lemma 2.2.2, p. 13, for 2.4), 573–598 (Theorem 2.2.3 and Corollary 2.2.4, pp. 13–14, for 2.5, with the Colmez–Dospinescu step and the strict-cochain argument the README reproduces). ✓
- 3.2: BCGP25 lines 1000–1038 (§§2.2.15–2.2.16, Remark 2.2.18, pp. 21–22: coaction axioms, D(𝔾) = O_𝔾^∨, the functor to D(𝔾)-modules) and RJRC22 lines 119–146 (§1.2.2, pp. 3–4). ✓ Remark 2.2.19 (line 1039, p. 22) for 3.3 and Lemma 2.2.14 (line 979, p. 21) for 3.1 (iv). ✓
- 3.4: BCGP25 lines 1044–1054 (§2.2.20, Definition 2.2.21, Remark 2.2.22, p. 22). ✓
- 3.8: BCGP25 lines 1096–1111 (§2.2.27, Remark 2.2.28, p. 23: the three actions, invariants for ∗_l ⊗ ∗_V, the evaluation map with the stray r′ recorded under Source issues), RJRC22 lines 1942–1954 (Definition 4.40, p. 39), 2065–2079 (Proposition 4.48, p. 41: admissible Banach ⇒ concentrated in degree 0, algebraic flatness), 180–215 (§1.2.3, Theorem 1.5, Corollary 1.6, pp. 4–5, for 3.9). ✓
- 5.3: DING25 lines 410–416 (§2.1, p. 10: dim Hom_sm = 1, dim Hom_σ = 2, dim Hom = 1 + d_K), 779–780 ((2.17), p. 19: the definition of Hom_g′), 1616–1624 (proof of Lemma 3.5, p. 40: Ext^i_T(χ, χ′) = 0 for χ ≠ χ′). ✓
- 5.4: SCH11 lines 1157–1173 (Remarque 3.9, printed p. 68: Kohlhaase's bar complex as the standard complex of the cotriple D(G) ⊗̂ −), 1766–1773 (paragraph before Corollaire 4.9, p. 82: Hausdorff H_q(N, Σ) are of compact type with a locally analytic L-action), 1787–1804 ((4.40)–(4.42) and Théorème 4.10, p. 82). ✓
- 6.2: OS15 lines 103–114 (main theorem (i)–(ii), p. 3), 712–722 (Proposition 4.2, pp. 18–19), 868–877 (Proposition 4.9(a), p. 22), BR16 lines 406–415 (Théorème 2.3(ii), p. 10). ✓
- 6.5: OS15 lines 1696–1719 (§6.2, (6.2.1), pp. 41–42), BR16 lines 435–470 (Proposition 2.4 and Corollaire 2.5 with proof, pp. 10–11) and 501–510 (Corollaire 2.7, p. 12, with finite-length π_Q as the README states), OR19 lines 42–51 (Theorem 1, p. 2, split G, trivial smooth argument, as the README restricts it). ✓
- 7.6: BR15 lines 511–520 ((18), p. 13, the unaveraged sum, "sans la torsion par le caractère module"), 530–536 (Proposition 4.2, p. 13), 596–603 (Théorème 4.3, p. 14), 650–654 (Remarque 4.4(i), pp. 15–16), BHS19 lines 3702–3705 ((5.9), printed p. 391, the sum with the factor δ_B) and 3716–3733 (Lemma 5.2.1, pp. 391–392, with V{δ_B⁻¹} and the very-strongly-admissible hypothesis), 3574–3580 (Remark 5.1.2, p. 388, the product-of-groups extension). ✓ The modulus bookkeeping is recomputed in the table.
- 8.10: DING25 lines 1637–1645 ((3.10)–(3.11), p. 41) and 1653–1658 (Remark 3.7, p. 41). ✓
- 8.11: DING25 lines 1646–1652 (Proposition 3.6, p. 41) and 1692–1701 (Remark 3.9, p. 42). ✓
- The README flags no locator as unverified; SCHN11, NFA02 and HUM08 are `uncertified` in the manifest and are under Not verifiable.
- Further locators opened while checking the sample: ST02 Proposition 2.3 (line 330, p. 9); ST01 Proposition 3.4 (line 519, p. 13); BR19 Lemme 2.1.1 (line 405, pp. 10–11); EMJ1 (0.4) (line 130, the adjunction with U(δ)) and (3.4.8) (line 1606); EMJ2 Lemma 0.3 (line 63, p. 2), Definitions 0.8, 0.11, 0.12 and Question 0.9 (lines 101–131, p. 3), Theorem 0.13 and Corollaries 0.14–0.15 (lines 142–150, p. 4), Proposition 2.1.2 (line 977, p. 21), Lemma 2.8.3 (line 2089, p. 45), Corollary 4.3.3 (line 2761, p. 58), Corollary 5.1.4 (line 2835, p. 60); DING25 Proposition 3.1 and Lemma 3.2 (lines 1488–1524, pp. 37–38), Proposition 3.8 (lines 1659–1691, pp. 41–42); SCH11 Proposition 4.7 (lines 1679–1697, pp. 79–80). All as cited.

**Manifest.** All 29 works cited under `## References` have exactly one key in `sources.toml` (29 entries); no local path; the three books are `uncertified`.

**Shape and style.** Headings as upstream; every definition with an API list and at least three Checks (counted: 0.2 five, 0.4 four, 1.1 four, 1.2 four, 1.6 four, 1.7 four, 2.1 four, 2.3 four, 3.1 three, 3.2 four, 3.4 three, 3.5 three, 3.8 four, 4.2 three, 4.3 three, 4.4 three, 5.1 five, 5.2 four, 5.4 three, 6.1 five, 7.3 three, 7.4 three, 8.1 five, 8.3 three, 8.5 six, 8.7 four, 9.1 three, 9.3 four, 9.5 four, 10.1 four, 10.2 four); every theorem with hypotheses and a locator; every layer with Examples and Dependencies; no LaTeX delimiters, no process words, no pull-request numbers, no machine paths (grep for `$`, `\(`, "so far", "checkpoint", "handoff", "packet", "pull request", "#NNN", home directories, "removed", "deferred", "optional" finds nothing); mathematics in Unicode with ASCII inside code spans. The README contains no backticked name of its own, so there is nothing for `Suggested.lean` to declare.

**Adversarial table** (sampled targets, headlines and the targets the findings touch; values computed on each side).

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Convention 5: index⁻¹ = δ_P(m) | GL_2(ℚ_p), m = diag(p,1), N_0 = N(ℤ_p) | [N_0 : mN_0m⁻¹] = p; Ad(m)e = pe, δ_B(m) = |p| = p⁻¹; averaged operator on 1 is 1 | holds |
| Convention 6: (u·ψ)_i = ψ_(u⁻¹(i)) | n = 3, u = (1 2 3), ψ on coordinate 1 | u⁻¹(2) = 1 so (u·ψ)_2 = ψ_1; w(φ) = (φ_3, φ_1, φ_2) | holds, matches DING25 line 1467 |
| Convention 7: δ_B, η | n = 2; n = 3 | δ_B = |t_1|^(n−1)…|t_n|^(1−n) from ∏_(i<j)|t_i/t_j|; η(t) = ∏|t_i|^(i−1) | holds |
| 0.1 (iv) L ⊗ E ≅ ∏_σ E | L = ℚ_p(√p), p odd | √p ⊗ 1 ↦ (√p, −√p); dim 2 = d_L | holds |
| 0.5 module structure | χ(a) = (1+p)^a on ℤ_p; trivial representation | x̃ acts by log(1+p), δ_1 by 1+p; μ acts by μ(1) so δ_a, δ_0 act alike | holds; faithfulness fails as the Check says |
| 0.7 continuity of F_λ | compact G, W = C^an(G), λ = ev_1; λ = 0 | F_λ = id; F_0 = 0 | holds |
| 0.8 Schur property | c_0(ℕ, E), e_n | ⟨e_n, (1,1,…)⟩ = 1 ≠ 0, ‖e_n‖ = 1 | not weakly null, consistent |
| 1.2 (iv) and R03 | G = ℚ_p^×, χ = x | p acts by p (no lattice); restriction to ℤ_p^× unitary; strong admissibility tested on ℤ_p^× | repaired form gives the same conclusion |
| 1.4 (v) finite length | V′ of finite abstract length | chains of closed submodules are chains of submodules; Lemma 3.6 | holds from 1.3 (R01 locator only) |
| 1.6 locally algebraic vectors | GL_2(ℚ_p), λ = (k,0); λ = (1,1) | B⁻-coinvariants of L(λ) = highest-weight line of weight λ; Frobenius gives L(λ) ⊗ (Ind χ_sm)^∞ ⊆ PS(χ_sm z^λ); for s·λ = (−1,k+1) no finite-dimensional quotient | holds |
| 1.7 Ext over D(ℤ_p) | E trivial | 0 → D →(δ_1−1) D → E → 0, Ext¹ = E/(δ_1−1)E = E | holds |
| 1.7 Ext¹(1,1) for ℚ_p^× | L = ℚ_p; p = 2 | Hom(ℤ × μ × (1+pℤ_p), E) = E·val ⊕ E·log: 2; smooth: 1 | holds |
| 1.10 (1) | GL_2(ℚ_p), Sym^k vs Sym^k′ | infinitesimal characters differ for k ≠ k′ | holds |
| 1.10 (2) and SCH11 Prop. 4.7(2) | generic principal series, fixed central character | (4.27): E_2^(p,q) with H¹ = H² = 0 of g′ gives Ext^n_(G,λ) = Ext^n_∞ for n ≤ 2; i_0 = 0, dim Ext¹_∞ = n − 1 ≠ 0 but printed form says 0 | printed form false; README's form holds |
| 1.10 (2) Check | GL_2(ℚ_p), W = 1, λ = 0 | Hom(PGL_2(ℚ_p), E) = 0 (abelianisation finite); Hom(ℚ_p^×, E)∘det: 2 | holds |
| 2.1 (ii) invariant lattice | compact H, Banach B | sup_(h∈H)‖h·v‖ finite by Banach–Steinhaus; unit ball is H-stable, open, bounded | holds |
| 2.1 non-example | c_0(ℕ,E), trivial ℤ_p | dual killed by augmentation ideal, infinite-dimensional | not admissible |
| 2.3 degenerate | G finite | G_0 = 1, C^an = ℚ_p, R^i = 0 for i ≥ 1 | holds |
| 2.5 B ⊗̂ M | B = ℚ_p trivial, M = c_0 | covered by Corollary 2.2.4 (PAN22 line 588) | holds |
| 3.1 (iii) roles | V = c_0(ℕ,E) | V^∨ = (∏O_E)[1/p]; Hom(V,V) ∋ id not compact | roles not exchangeable |
| 3.2 non-example | 𝔾 = ℤ_p + p𝔻, character trivial on p²ℤ_p | rigid function on p𝔻 taking one value on p²ℤ_p-cosets is constant | not analytic |
| 3.4 | M = ℤ_p; M finite | O_E[[T]][1/p]; E[M] | holds |
| 3.5 | ℤ_p^×, x^k, k ≠ 0 | 1 + p^n acts by (1+p^n)^k ≠ 1 | not smooth, x^k-smooth |
| 3.8 residual action | analytic χ, f(g) = χ(g)v | ∗_r: χ(h)v; ∗_r ⊗ ∗_V: χ(h)²v | equality with (∗_l∘∗_r) ⊗ ∗_V on invariants holds |
| 3.9 | ℤ_p, C(ℤ_p,E) | H⁰ = E, H¹ = 0 by Shapiro | holds, compact only |
| 4.5 (ii) radical layers | n = 2, λ = (1,1) | s·λ = s(λ+ρ) − ρ = (0,2); M⁻(−λ) length 2 | holds |
| 4.6 Kostant homology | GL_2, λ = (k,0) | lower: H_0 = (k,0), H_1 = s·λ = (−1,k+1); upper: λ^∨ = (0,−k), s·λ^∨ = (−k−1,1), dual (k+1,−1); H_0 = (0,k) | holds; formula −(w·(−w_0λ)) verified |
| 5.3 (3)–(4) | L = ℚ_p(√p), n = 2 | Hom 2·3 = 6, Hom_sm 2, Hom_g′ = 2 + 3 − 1 = 4, Hom_σ(L^×) = 2 | holds |
| 5.3 (1) | χ′ = χ|·|_L | same weight; δ_t − χ(t) separates | holds |
| 5.4 (iii) | GL_2, W = Sym^k, π = 1 upper N | H_1(n, E) = n of weight (1,−1); cuspidal π: J_N = 0 | holds |
| 5.5 | GL_2(ℚ_p), Σ = 1, ρ = z^((0,2)), P = B⁻ | H_0 weight (0,0), H_1 weight (−1,1); neither (0,2) | Ext = 0, holds |
| 6.1 sign | M⁻(μ), χ | W′ of weight −μ, F = (Ind z^(−μ)χ)^an | holds |
| 6.2 exact sequence | 0 → K → M⁻(−λ) → L⁻(−λ) → 0 | 0 → π_alg → PS → F(K) → 0 | holds |
| 6.4 non-example | GL_2, χ_1χ_2⁻¹ = |·| | (Ind χ)^∞ reducible so F(L(λ)′, χ) reducible | holds |
| 6.5 (2) socle | GL_3(ℚ_p) generic | 6 constituents, multiplicity one each | holds |
| 7.3 non-example | λ = (1,1), s·λ = (0,2) | ⟨(0,−2) + ρ⁻, (e_2−e_1)^∨⟩ = −1: M⁻((0,−2)) simple; ⟨(−1,−1) + ρ⁻, ·⟩ = 1: M⁻(−λ) not simple | holds |
| 7.5 Check | smooth δ, smooth V | Ind_(B⁻)δ = i_(B⁻)(δδ_B^(1/2)); second adjointness gives Hom_T(δδ_B, V_N) | holds |
| 7.6 modulus bookkeeping | Breuil (18) vs Emerton | Breuil's sum = δ_P⁻¹ × average; Hom_(M⁺,unav)(U, Π^(N_0)) = Hom_M(U(δ_P), J_P); with π_B = πδ_Q⁻¹ the right side is Hom_M(W′ ⊗ π, J_Q(Π)); BHS (5.9) = δ_B × sum = average | holds |
| 7.1 adjunction twist | EMJ1 (0.4) | L_M(U(δ), J_P(V)), as stated | holds |
| 8.1 | n = 3, blocks (2,1); h = (1,0) | θ^P = (0,0,−2); λ = (1,1) | holds |
| 8.3 | n = 2, L = ℚ_p | ηz^λ = |t_2| t_1^(λ_1)t_2^(λ_2) = z^h · t_2|t_2| | holds |
| 8.4 (3) new route | K = rad M⁻(−λ) | ⊕_(lg 1) M⁻(−s·λ) ↠ K, F(K) ↪ ⊕ Ind z^(s·λ)w(φ)η, socle ⊕ C(w,s); each C(w,s) ↪ F(K) | holds |
| 8.4 (4), 8.5 label | w = (1 2 3), w′ = (2 3)w, w″ = (1 2)w | w w′⁻¹ = (2 3) ∈ W_1, w w″⁻¹ = (1 2) ∉ W_1; w⁻¹({1}) = w′⁻¹({1}) = {3}; w({1}) = {2} ≠ w′({1}) = {3} | inverse-image label is the invariant one |
| 8.5 sign | GL_2, λ = (1,1) | C(w,s) = F(M⁻((0,−2)),·) = Ind z^((0,2)): central weight +2 = that of PS; z^((0,−2)) gives −2 | +s·λ confirmed |
| 8.8 | n = 1; n = 2, L = ℚ_p | 1 + d_L; lalg n; Ext¹ = (n−1) + (1+d_L) = n + d_L: 3 | holds |
| 8.9 | n = 2, λ = (1,1) | H_1(n⁻, det) weight (0,2) = ρ's algebraic part; H_0 weight (1,1) ≠ (0,2) | Ext¹ = E, holds |
| 8.10 non-injectivity | n = 2, L = ℚ_p | source 2·4 = 8, target 2 + 3 = 5 | holds |
| 8.11 | n = 2, L = ℚ_p; L = ℚ_p(√p) | E_2^(1,0) = Ext¹_T(ρ,ρ) = Hom(T,E): 4; 6; E_2^(0,1) = 0 | holds |
| 8.12 | n = 2; I ⊆ {1..n−1} variant (DING25 (3.12)) | (n + d_L) + (2^n − 2)d_L = 5; variant 4 ≠ 5 | full index set confirmed |
| 8.12 dimension chain | n = 2 | n + d_L = 3, n + nd_L = 4, (n−1)d_L = 1: 3 + 1 = 4 | surjective by dimensions |
| 8.14 | n = 2, L = ℚ_p | 2 ⊆ 3 ⊆ 4 ⊂ 5 | holds |
| 9.2 | n = 3, (2,1), standard filtration | labels {1},{2} (case 1), {1,2} (case 2); {3} absent | holds |
| 9.3–9.4 | B, G, (2,1) | (n−1)d_L, (2^n−2)d_L, 3d_L; dims n + nd_L, n + (2^n−1)d_L, 7 | holds |
| 9.5 kernel | three factors, dim A = 1, dim B = 2 | gr¹ = Σ_i dim B_i ∏_(j≠i) dim A_j = 6; reversed 12 | corrected kernel confirmed |
| 9.6 (1) | P = B; (2,1), L = ℚ_p | both sides 2n; 7 = 7 | holds |
| 9.7 | n = 3; partition of labels | {1},{2},{1,2} vs {3},{1,3},{2,3}; 2(n + 2d_L + (2^(n−1) − 2)d_L) − (n + d_L) = n + (2^n − 1)d_L | holds |
| 10.1 | Hom_(σ,g′) | n + 2 − 1 = n + 1 | holds |
| 10.3–10.7 | n = 2, d_L = 2; (2,1) | Ext¹_σ 3 vs 4; 5, 8, 2, 3 + 3 = 6; 7; 4 + 4 − 3 = 5 | holds |

## Not verifiable

- SCHN11 (Schneider, p-Adic Lie Groups: §13 p. 90, Proposition 6.4 pp. 42–43, for 0.1), NFA02 (Nonarchimedean Functional Analysis §6, for gap:barrelled-banach-steinhaus) and HUM08 (BGG category O, §§3.2, 9.3–9.4, Theorems 3.3, 4.6, 5.1, Proposition 9.3, for 4.3–4.5): paywalled books recorded `uncertified`; cited by locator only, as the manifest settles them.
- Ownership against open pull requests whose files the brief did not give beyond the `roadmaps grep` index was not checked by reading those files; the index search above is the check made.

## Source issues

- **Error** in SCH11 at Proposition 4.7(2), printed p. 80: the source says the fixed-central-character Ext groups vanish in every degree n ≠ i_0 with n ≤ i_0 + 2; it should be that they agree with smooth Ext in every degree n ≤ 2 (its own spectral sequence (4.27) with H¹ = H² = 0); affects a stated result.
- **Misprint** in DING25 at (3.1) and Lemma 3.2, arXiv v2 p. 37: the source says the inducing character is z^(−s_(i,σ)·λ)w(φ)η; it should be z^(+s_(i,σ)·λ)w(φ)η (the Orlik–Strauch functor negates the generating weight; central-weight test); affects nothing.
- **Misprint** in DING25 at the paragraph after Proposition 3.1, arXiv v2 p. 37: the source says the label of C(w, s_(i,σ)) is w({1,…,i}); it should be w⁻¹({1,…,i}), the invariant of the left coset W_i w of Proposition 3.1(4); affects nothing.
- **Misprint** in DING25 at Lemma 3.2(1), arXiv v2 p. 37: the source says Hom over T(ℚ_p); it should be over T(K); affects nothing.
- **Misprint** in DING25 at (3.12) and (3.15), arXiv v2 pp. 41–42: the source says the index set is I ⊂ {1,…,n−1}; it should be I ⊂ {1,…,n} with #I = i, the only choice giving the stated dimension n + (2^n − 1)d_K; affects a stated result.
- **Misprint** in BCGP25 at §2.2.27, p. 23: the source says the evaluation map is on O_(𝔾_(r′)) ⊗ V; it should be on O_(𝔾_r) ⊗ V at the radius r of the vectors being defined; affects nothing.
- **Gap** in DLB17 at Lemme 5.10, p. 29: the source says a sequence in a locally convex space over a spherically complete field is null if and only if it is weakly null, without proof; it should be proved by a Hahn–Banach gliding-hump argument on the seminormed quotients; affects the proof (of Lemme 5.9).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "38d3cc7fdde53b6a0b215fa368cdb11742414754", "job": "REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups", "model": "fable", "worker": "chris-x18"} -->
