<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7601#issuecomment-6700530267 -->
Review (claude) of 8775b2e

Verdict: needs_changes

1. **F01** (P1) 2.2 claims stabilisation from finiteness in one total degree

   Location: `design/README.md` line 475–476, "If finitely many positions of total degree `n` are
   nonzero on page `r₀`, every position of total degree `n` stabilises."

   Claim: finitely many nonzero positions in total degree `n` on the first page force stabilisation of
   every position of total degree `n`.

   Witness: the roadmap's own filtered complex of 1.4 (README line 412–421): on page `1` the only
   nonzero position of total degree `0` is `(0, 0)` (`E_1^{p,−p} = H^0(gr^p K) = 0` for `p ≠ 0`), yet
   `Z_r(0,0) = ℓ^{r−1}ℤ` strictly decreases, so `(0, 0)` is not regular; 2.2's second Check says so
   itself. The leaving differentials land in total degree `n + 1`, the entering ones start in total
   degree `n − 1`; finiteness in degree `n` says nothing about either.

   Repair: replace the bullet by "If finitely many positions of total degrees `n − 1` and `n + 1` are
   nonzero on page `r₀`, every position of total degree `n` stabilises: the page-`r` differential
   leaving `pq` has its target at `(fil pq + r − e, n + 1)` and the entering one its source at
   `(fil pq − r + e, n − 1)`, both outside the finite set of nonzero positions for large `r`, and
   vanishing persists to later pages." On the 1.4 example degree `1` has infinitely many nonzero
   positions, so the repaired statement no longer applies, which agrees with the Check.

2. **F02** (P2) 7.4 and 7.5 use "complete" in a sense that contradicts 3.1

   Location: `design/README.md` line 1227–1229, "the filtration of `A^{−∞}` is exhaustive and
   complete (`lim¹_s F^s = 0`), and the meet `F^{+∞} = lim_s F^s` is isomorphic to `W^n`"; line
   1261–1262, "which is exhaustive and complete, and that the separation defect of `H^n` is `W^n`";
   `design/plan.json` target 7.4 statement "exhaustive complete filtration"; target 7.5 "exhaustive
   complete induced filtration".

   Claim: under conditional convergence to the colimit and `RE_∞ = 0` the filtration of the target is
   complete.

   Witness: 3.1 defines complete as "`X ≅ lim_p X / F^p X`" and its API states "Complete implies
   separated" (README line 547). helle-rognes2024 line 84 defines complete as `RF^{−∞}G = 0` only and
   Hausdorff as `F^{−∞}G = 0`; Theorem 3.9 (helle-rognes2024 line 163–165) gives complete in that
   weaker sense with `F^{−∞}A^∞ ≅ W`. helle-rognes2024 line 943–967, Example 8.1: `A^s = ∏_{i≥|s|} k`,
   `lim = lim¹ = 0` at the limit end, `E_∞ = 0`, `RE_∞ = 0`, `F^s A^∞ = A^∞` for every `s`, so
   `F^{−∞}A^∞ = W = ∏ k / ⨁ k ≠ 0`: the filtration is not separated, hence not complete in the sense
   of 3.1, although `lim¹_s F^s = 0`. The same clash is in 7.5 ("exhaustive and complete" with a
   nonzero separation defect `W^n`).

   Repair: in 7.4 write "the filtration of `A^{−∞}` is exhaustive and has `lim¹_s F^s = 0`
   (complete in the sense of helle-rognes2024 Definition 2.5; complete in the sense of 3.1 if and only
   if `W^n = 0`), and the meet `F^{+∞} = lim_s F^s` is isomorphic to `W^n`"; in 7.5 write "which is
   exhaustive with `lim¹_p F^p H^n = 0`, separated (and so complete in the sense of 3.1) if and only
   if `W^n = 0`, the separation defect `⋂_p F^p H^n` being `W^n`"; in the Conventions dictionary add
   "Helle–Rognes and Boardman call a filtration complete when `lim¹ = 0` and Hausdorff when the meet
   is `0`; here complete is the limit-cone condition of 3.1, which is both"; make the same change in
   the plan statements of 7.4 and 7.5. On Example 8.1 the repaired sentence reads
   `lim¹ = 0`, `⋂ F^s = ∏k/⨁k = W ≠ 0`, not complete in the sense of 3.1: correct.

3. **F03** (P2) 5.4 cites 4.3's continuity at `⊤` with hypotheses it does not have

   Location: `design/README.md` line 999–1000, "has a limit page there (`B_∞` exists by 4.3's
   continuity at `⊤`)", with 4.3 line 808–810, "If `C` has exact sequential colimits and the
   canonical maps `colim_j H^n(q ≤ j) → H^n(q ≤ ⊤)` are isomorphisms, then `B_∞` exists and equals
   `Bᵗ`"; `design/plan.json` target 4.3 statement "`colim_j H^n(q ≤ j) ≅ H^n(q ≤ ⊤)`".

   Claim: exhaustiveness on `K^{n−1}`, `K^n`, `K^{n+1}` gives 4.3's continuity isomorphism at the
   position of total degree `n`.

   Witness: the instance needed for `B_∞` at total degree `n` is
   `colim_j H^{n−1}(q + 1 ≤ j) → H^{n−1}(q + 1 ≤ ⊤)`, that is
   `colim_j H^{n−1}(G_j / G_{q+1}) → H^{n−1}(K / G_{q+1})`, and `H^{n−1}` involves `K^{n−2}`. Take
   `K = (ℤ →(id) ℤ)` in degrees `n − 2`, `n − 1`, with `G_j = 0` in degree `n − 2` for every finite `j`
   and `G_j = K` in degree `n − 1`: the filtration is exhaustive on `K^{n−1}`, `K^n`, `K^{n+1}`,
   `colim_j H^{n−1}(G_j) = H^{n−1}(0 → ℤ) = ℤ`, but `H^{n−1}(K) = 0`: an epimorphism, not an
   isomorphism. The proof of `B_∞ = Bᵗ` only needs the epimorphism (the join of the images of
   `H^{n−1}(q+1 ≤ j)` in `H^{n−1}(q+1 ≤ ⊤)` is everything, and the image of a join under `δ` is the
   join of the images).

   Repair: state 4.3's continuity item as "If `C` has exact sequential colimits and the canonical map
   `colim_j H^{n−1}(q + 1 ≤ j) → H^{n−1}(q + 1 ≤ ⊤)` is an epimorphism, then `B_∞(p, q)` exists and
   equals `Bᵗ`" (and in the plan statement); in 5.4 say "exhaustive on `K^{n−1}` and `K^n` (which
   makes that map an epimorphism in degree `n − 1`) and bounded below on `K^n` and `K^{n+1}`", dropping
   the unused exhaustiveness on `K^{n+1}`. On the witness the repaired 4.3 applies (the map is onto)
   and 5.4's conclusion `B_∞ = Bᵗ` holds.

4. **F04** (P3) three targets without a source locator in the README

   Location: `design/README.md` 4.2 (line 767–776), 4.5 (line 857–871), 4.6 (line 884–895).

   Claim: every theorem carries a locator. 4.2 cites only a Tau Ceti file, 4.5 and 4.6 cite nothing.
   `design/plan.json` has them: 4.2 helle-rognes2024 line 145–152, Definition 3.6; 4.5 stacks-012K
   line 3202–3240, Lemma 24.13 applied; 4.6 weibel1994 Theorem 5.2.12 applied (uncertified).

   Repair: copy those three locators into the README sentences, in parentheses at the claim.

5. **F05** (P3) 3.4's locator is the filtered-complex lemma, cited for the abstract statement

   Location: `design/README.md` line 625–626, "(stacks-012K line 3152–3174, Lemma 24.11 (2)–(4), tag
   012W; …)".

   Claim: Lemma 24.11 states "weak convergence in degree `n` together with a finite filtration of `H^n`
   gives strong convergence". stacks-012K line 3152–3158 states it for a filtered complex whose
   filtration on each `K^n` is finite; the abstract form is the roadmap's.

   Repair: write "(stacks-012K line 3152–3174, Lemma 24.11 (2)–(4), tag 012W, in its filtered-complex
   form; …)", as 4.3 and 4.4 already do.

6. **F06** (P3) 2.3's Euler–Poincaré engine is ℤ-indexed, the page is not

   Location: `design/README.md` line 498–500, "*Needs:* 2.1; Mathlib `ComplexShape.EulerCharSigns`;
   Tau Ceti `HomologicalComplex.sum_negOnePow_X_eq_sum_negOnePow_homology`."

   Claim: the Tau Ceti engine applies to a page of shape `ComplexShape.up' (r, 1 − r)` on `ℤ × ℤ`.
   At the pin, `TauCeti/CategoryTheory/GrothendieckGroup/EulerCharacteristic.lean` line 165 states it
   for `K : CochainComplex A ℤ` with `K.IsStrictlyGE a`, `K.IsStrictlyLE b` and `Int.negOnePow`.

   Repair: add to the route "regroup the finitely many nonzero positions by total degree into a
   ℤ-indexed complex of finite direct sums (in `P` by closure under extensions), whose homology is the
   direct sum of the homologies, and apply the engine to it; or run Stacks' even–odd argument of
   stacks-012K line 3185–3191 directly".

7. **F07** (P3) no Check of 7.4 has a nonzero whole-plane obstruction

   Location: `design/README.md` line 1247–1252 (Checks of 7.4).

   Claim: the three Checks discriminate the definitions of 7.4. They are the three Checks of
   StableHomotopyKTheory §7.26 (its head, "The zero exact couple…", "D=ℤ, i=id and E=0…", "finite
   first-page groups…"); a model with `W^n := 0` passes all three, so nothing tests `W` or the
   theorem `F^{+∞} ≅ W^n`.

   Repair: add helle-rognes2024 line 943–967, Example 8.1, in the roadmap's indexing: over a field
   `k`, `A^s = ∏_{i ≥ |s|} k` with `i : A^{s+1} → A^s` the inclusion for `s ≥ 0` and the projection
   for `s < 0`; then `A^{+∞} = ⋂_s ∏_{i≥s} k = 0`, `RA^{+∞} = 0` (`A^0 → lim_s A^0/A^s = ∏ k` is an
   isomorphism), `A^{−∞} = ∏ k / ⨁ k`, `E_1^s = k` at every `s` with the differentials pairing `s ≥ 0`
   against `s < 0`, `E_∞ = 0`, `RE_∞ = 0`, `F^s A^{−∞} = A^{−∞}` for every `s`, so `W = ∏k/⨁k ≠ 0`:
   the spectral sequence converges weakly to `A^{−∞}` with `lim¹_s F^s = 0` but is not strongly
   convergent. (This is also the witness of R02.)

8. **F08** (P3) plan target 3.7 has no README section

   Location: `design/plan.json` target `3.7` (`CategoryTheory.SpectralSequence.Examples.rangeOfDegrees`,
   kind example, no tests); `sources.toml` entry `browning-sawin2020`, `cited_for = ["3.7", "Layer 3
   Examples"]`; the README has no §3.7, the content is the Layer 3 "Examples" paragraph (line
   718–727).

   Repair: delete target 3.7 from the plan (the README keeps the Examples paragraph) and change the
   manifest's `cited_for` to `["Layer 3 Examples"]`; or add "### 3.7" to the README with three Checks.
   The first is the smaller change.

9. **F09** (P3) 7.1 claims invariance in "any additive category with the products"

   Location: `design/README.md` line 1133–1134, "invariance under passage to a cofinal subsequence and
   under pro-isomorphism (in any additive category with the products)".

   Claim: lim¹ is defined there. It is the cokernel of `towerDifference`
   (`TauCeti/CategoryTheory/Preadditive/TowerDifference.lean` line 77), which needs that cokernel.

   Repair: "in any additive category with the products and with the kernel and cokernel of the
   product–difference maps".

Files reviewed: `packages/SpectralSequencesAndConvergence/design/README.md`,
`packages/SpectralSequencesAndConvergence/design/plan.json`,
`packages/SpectralSequencesAndConvergence/sources.toml`. No previous review. No `Suggested.lean`
exists at the design stage, so the elaboration, the one-tactic probe and the headline-absence check
are not applicable here (this lane does not elaborate); the headline list is given under
"Verified sound" for the package stage.

## Verified sound

**Principles.** No route-specific shortcut; no re-planning (DGFloer Layer 1 item 3, AlgebraicTopology
Stage 6 item 0 and DerivedModuleAlgebra §S.1 are left as module instances, StableHomotopyKTheory
§7.22 is consumed, §7.26 compared as an instance); no computational algorithm; no copied passage
(the Checks shared with StableHomotopyKTheory §7.22 and §7.26 are examples, not source text); no
`set_option`, no sorry'd data (no Lean file at this stage). Gate output:

    candidate: SpectralSequencesAndConvergence is not in the merge order yet; checked as if placed after StableHomotopyKTheory (the intake inserts it when its design is accepted)
    depcheck: 240 roadmaps, 2353 edges, 0 problem(s)

No UPWARD or CYCLE line. Declared gaps: none. Every listed downstream consumer sits below the
insertion point (SchemeKTheoryOperations at position 34, DerivedDeRhamCohomology 19, … ,
ChromaticHomotopyTheory 319, against insertion at 14).

**Suppliers resolved.** StableHomotopyKTheory is an open pull request (#1227) earlier in the merge
order; its head has §7.22 (bigraded exact couples, derived couple of degrees `a, b − a, c`, page
`r ≥ 1`, `d_r` of degree `c + b − (r − 1)a`) and §7.26 (Boardman's `W`, conditional convergence)
exactly as the README assumes. DGFloer Layer 1 item 3 on main states the same classical-to-native
dictionary (cohomological `E_r^{p,q}` = native page `r + 1` at `(2p + q + 1, −p − 1)`) and owns
Weibel 5.5.1(2) and 5.5.10 for module complexes; item 2 owns the Serre sequence. AlgebraicTopology
Stage 6 item 0 on main owns module towers, lim, lim¹, six-term and Milnor sequences.
DerivedModuleAlgebra §S.1 on main lists `DoubleComplex.abutmentFiltration`, `eInftyIsoGr`,
`page_eq_eInfty`, `fiveTerm_exact` as its API (README line 2345–2353; its Lean docstring lists them
as not declared), which resolves the three resolver leads. SchemeAndStackFoundations §2.2 (Leray and
Čech), ComplexKahlerGeometry K8 (Frölicher), HeegaardFloer (finite filtered complexes, its own
construction) and MorseTheory (consumes DGFloer) exist as cited. No open pull request and neither
pin declares an exact couple, a limit page, cycle towers, a bidegree assignment, or exhaustive,
separated and complete predicates on `FilteredObject` (grep of the heads and the pins: the only
hits are DerivedModuleAlgebra's module `limOne`, which the README already leaves to its owners).

**Library names at the pins** (all opened): Mathlib `SpectralSequence` and `Hom`, `pageFunctor`,
`pageHomologyNatIso`, `pageXIsoOfEq` (`Algebra/Homology/SpectralSequence/Basic.lean` 35–104),
`CohomologicalSpectralSequence`, `E₂CohomologicalSpectralSequence`, `…Nat`, `…Fin` (109–129),
`ComplexShape.up'` (`ComplexShape.lean` 163), `spectralSequenceNat`/`Fin`
(`SpectralSequence/ComplexShape.lean` 36, 47), `SpectralSequenceDataCore`, `coreE₂Cohomological`
(`SpectralObject/HasSpectralSequence.lean` 67, 143: `i₀ = q − r + 2`, `i₁ = q`, `i₂ = q + 1`,
`i₃ = q + r − 1`, `deg = p + q`), `coreE₂CohomologicalNat` 176, `coreE₂CohomologicalFin` 214,
`coreE₂HomologicalNat` 260 (`deg = −p − q`, `i₁ = −q`), `HasSpectralSequence` 303,
`IsFirstQuadrant` 394, `IsThirdQuadrant` 437, `isZero₁/₂_of_isFirstQuadrant` 402, 406,
`spectralSequencePageXIso` (`SpectralObject/SpectralSequence.lean` 488),
`spectralSequenceFirstPageXIso` (`FirstPage.lean` 78), `E` (`Page.lean` 65, the homology of
`H^{n₀}(f₃) → H^{n₁}(f₂) → H^{n₂}(f₁)`), `isoMapFourδ₁Toδ₀'` (`EpiMono.lean` 191),
`spectralObjectMappingCone`, `mapHomologicalFunctor`, `EInt` (`Order/WithBotTop.lean` 81),
`FilteredObject`, `FilteredObject.Hom`, `IsStrictHom` (`CategoryTheory/Filtration/Basic.lean` 73, 92,
145), `Subobject.pullback` (`Subobject/Basic.lean` 572), complete-lattice instance on `Subobject`
under well-poweredness, wide pullbacks, images and coproducts (`Subobject/Lattice.lean` 663–722, as
the README says), `HasCountableProducts`/`Coproducts` (`Limits/Shapes/Countable.lean` 61, 108),
`CountableAB4Star` (`GrothendieckAxioms/Basic.lean` 126), `HasExactColimitsOfShape`
(`Limits/HasExactLimitsOfShape.lean` 47), `AB5`, `AB4Star` for `ModuleCat` (`ModuleCat/AB.lean` 30,
38), `enoughProjectives` for `ModuleCat` under `Small.{v} R` (`ModuleCat/Projective.lean` 60),
`IsSerreClass` (`SerreClass/Basic.lean` 45: zero, subobjects, quotients, extensions, hence a weak
Serre class), `EulerCharSigns`, `eulerChar`, `homologyEulerChar` (`EulerCharacteristic.lean` 56,
148, 154). Tau Ceti: `isIso_hom_f_of_le` (`SpectralSequence/Comparison.lean` 32), `abutment`,
`abutmentFiltration` (the image of `H^n(⊥ ≤ q)`, increasing in `q`), `abutmentFiltrationι`,
`abutmentFiltrationMap`, `EInftyIsoCokernel`, `isZero_abutmentFiltration`,
`isIso_abutmentFiltrationι` (`SpectralObject/Abutment.lean` 44–134), `EInfty`,
`spectralSequencePageXIsoEInfty` with exactly the two vanishing hypotheses the README states
(`Stabilization.lean` 45, 51), `isIso_hom_app_abutment`, `isIso_hom_app_abutment_of_isIso_page`
(vanishing in degrees `n, n+1` at `⊥` and `n−1, n` at `⊤`, as 4.6 says),
`spectralSequencePageXMap_comp_pageXIsoEInfty_hom` (`SpectralObject/Comparison.lean` 42, 78, 121),
`spectralSequenceMap`, `spectralSequencePageXMap` (`SpectralSequenceMap.lean` 230, 64), `EMap`,
`opcyclesMapOfHom`, `isIso_opcyclesMapOfHom_of_isIso` (`Map.lean` 106, 223, 284),
`spectralObject`, `spectralObjectMap`, `filtrationFunctor` (requires `Monotone F`),
`spectralSequence`, `spectralSequenceFirstPageXIsoCokernel`
(`Filtered/SpectralObject.lean` 147, 191, 304, 409, 425), `filtrationFunctorMap`
(`Naturality.lean` 83), `spectralSequence_first_page_d_eq` (`FirstPage.lean` 89, the connecting map
of `F_q/F_{q−1} → F_{q+1}/F_{q−1} → F_{q+1}/F_q`), `isZero_spectralObject_H_bot/top`,
`filtrationSpectralSequencePageXIsoEInfty` (`Stabilization.lean` 44, 60, 83),
`filtrationAbutmentIso`, `toFiltrationAbutmentFiltration_comp_filtrationAbutmentIso_hom`,
`filtrationSpectralSequencePageXIsoGradedOfFinite` (`Convergence.lean` 51, 91, 118),
`isIso_homologyMap_of_isIso_spectralSequence_page` (`Comparison.lean` 70),
`exists_mem_range_filtrationAbutmentFiltrationι`,
`filtrationSpectralSequencePageXIsoGradedOfExhaustive`,
`isIso_homologyMap_of_isIso_spectralSequence_page_of_exhaustive` (`Exhaustive.lean` 102, 177, 200,
modules only), `rowFiltrationSpectralSequence`, `…PageXIsoEInfty` (`Bicomplex.lean` 410, 497),
`towerDifference`, `towerDifference_naturality`, `isLimitConeOfTowerDifference`,
`IsProZero.isIso_towerDifference` (`TowerDifference.lean` 77, 150, 122, 165), `ModuleTower.lim`,
`limOne`, `IsMittagLeffler`, `subsingleton_limOne_of_isMittagLeffler` (`Tower/Basic.lean` 170, 174,
`MittagLeffler.lean` 70, 191), `AdditiveInvariant` (`GrothendieckGroup/Abelian.lean` 216),
`sum_negOnePow_X_eq_sum_negOnePow_homology` (`EulerCharacteristic.lean` 165; see R06).

**Sources: the seeded sample.** Every locator of the sample was read at its line: 2.1 stacks-012K
line 2981–2992 (filtration, complementary, total degree) and 3010–3014 (Lemma 24.2, bidegree
`(r, −r + 1)`); 2.2 line 3107–3116 (Definition 24.7: bounded below is `E^{p,n−p}_{r₀} = 0` for
`p ≥ b(n)`, as the README) and 3120–3130 (Lemma 24.8 (1)–(5), including the hint "if
`E^{p,q}_r = 0` then `E^{p,q}_{r'} = 0` for `r' ≥ r`"); 2.3 line 3185–3195 (even–odd argument
of Lemma 24.12) and line 1158–1161 (weak Serre subcategory); 3.3 line 3055–3061 (Lemma 24.4);
3.6 weibel1994 and mccleary2001 uncertified (settled); 4.1 helle-rognes2024 line 291–303
(Definition 4.5, Remark 4.6) and 334–335 (Remark 4.10): their `Z_r^s`, `B_r^s` are the README's
with `s = q + 1` and page shift one; 4.2 helle-rognes2024 line 145–152 (Definition 3.6, image
filtration) in the plan only (R04); 4.3 stacks-012K line 3072–3106 (Lemma 24.6, (24.6.1),
(24.6.2)) and 3144–3151 (Lemma 24.10); 4.4 line 3202–3240 (Lemma 24.13: the proof uses
`p₀(n), p₀(n+1), p₁(n−1), p₁(n)`; the README's weaker `⊤`-side hypothesis in degree `n` alone is
verified below); 5.2 line 3062–3071 (Definition 24.5), 5.4 weibel1994 5.5.1 uncertified and
stacks-012K line 3202–3210; 6.1 line 2653–2686 (Definitions 21.1, 21.3, Lemma 21.2); 6.2 line
2687–2703 (Lemma 21.4: `B_{r+1} = g(Ker α^r)`, `Z_{r+1} = f^{−1}(Im α^r)`, i.e. `j(ker i^r)`,
`k^{−1}(im i^r)`) and helle-rognes2024 line 136–144; 6.3 line 2834–2905 (§23); 7.2 line
3715–3735 (Definition 31.2, Lemma 31.3, Neeman remark at 3720–3724); 7.3 helle-rognes2024 line
225–229 (sequence (3.1)) and 213–214 (Lemma 3.15 (c)); 7.4 helle-rognes2024 line 13–25, 71–80,
145–178, 163–168 (Theorems 3.9, 3.10 and their proofs at 215–247); Layer 3 Example
browning-sawin2020 line 57–75 (Theorem 1.1) and 568–587 (Theorem 2.7): first page supported in
`0 ≤ m ≤ d`, bidegree `(r, 1 − r)`, identification of the `i`th cohomology only above a bound,
odd differentials vanish, as the README reports. Also read for the Conventions and Layer 1:
line 2606–2637 (Definitions 20.1, 20.2, degeneration) and 2349–2368 (Definition 19.1).
No author-flagged unverified locator exists; the uncertified entries are cited by locator only.

**Adversarial table** (sampled targets, headline theorems, and the targets of the findings).

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions, classical dictionary `E_r^{p,q}` = native page `r+1` at `(2p+q+1, −p−1)` | `G_t = F^{−t}`, native `(P,Q)` carries `H^{P+Q}(G_{Q+1}/G_Q)` | `G_{Q+1}/G_Q = F^{−Q−1}/F^{−Q} = gr^{−Q−1}`, so `p = −Q−1`, `q = P+2Q+1`; inverse `Q = −p−1`, `P = 2p+q+1`; page offset `r₀ = 2` vs classical `E_1` | holds |
| Conventions witness `ℤ →(×2) ℤ` | `F^0 = K`, `F^1 = K^1`, `F^2 = 0` | `E_1^{0,0} = H^0(gr^0) = ℤ` at `(1,−1)`, `E_1^{1,0} = ℤ` at `(3,−2)`; page-2 relation `(1,−1) → (3,−2)` has bidegree `(2,−1)`; connecting map of `0 → gr^1 → K → gr^0 → 0` sends `1 ↦ d(1) = 2` | holds (sign rests on Tau Ceti `spectralSequence_first_page_d_eq`) |
| Conventions, `F^p H^n := abutmentFiltration (n−p+1) n`, `gr^p ≅ EInfty (n−p) n` | `n = 1`, `p = 3` on the witness | `abutmentFiltration (−1) 1 = im(H^1(G_{−1}) → H^1(K)) = im(ℤ → ℤ/2) = ℤ/2`, `abutmentFiltration (−2) 1 = 0`, `gr^3 = ℤ/2 = EInfty (−2) 1` at `(3,−2)`; classical `gr^1`, offset `n+1 = 2` | holds |
| 1.2 towers on the `×2` E₂ example | `(0,1)`, `(2,0)`, `d_2 = ×2` | `Z_3(0,1) = ker = 0 = B_3(0,1)`; `Z_3(2,0) = ℤ`, `B_3(2,0) = 2ℤ`; wrong model `B_{r+1} := B_r` gives `E_3^{2,0} = ℤ` | holds |
| 1.4 limit page not reached by a page | `K^0 = ℤ →(id) K^1 = ℤ`, `F^p K^1 = ℓ^{p−1}ℤ` (`p ≥ 1`) | `Z_r(0,0) = F^0 ∩ d^{−1}(F^r K^1) = ℓ^{r−1}ℤ`, `⋂ = 0`, `E_r^{0,0} ≅ ℤ ≠ 0 = E_∞^{0,0}`; `H^0(K) = 0` | holds |
| 2.1 cohomological assignment, `e` | relation `(p,q) → (p+r, q+1−r)` | deg `+1`, fil `+r`, `e = 0`; classical `(p,q) ↦ (−q−1, p+q)`: fil `−q−1 ↦ −q+r−2 = fil + r − 1`, `e = 1`; `(p,q) ↦ (q, p+q)`: fil `+1−r`, not of the form `r − e` | holds |
| 2.1 homological `coreE₂HomologicalNat` assignment `(p,q) ↦ (−p, −p−q)` | relation `(p,q) → (p−r, q+r−1)` | deg `−p−q ↦ −p−q+1`, fil `−p ↦ −p+r`, `e = 0`; agrees with Mathlib `deg = −p−q`, `i₁ = −q` | holds |
| 2.2 stabilisation page `r ≥ β(n+1) − fil + e`, `r ≥ fil − α(n−1) + e` | leaving target `(fil + r − e, n+1)`, entering source `(fil − r + e, n−1)` | target vanishes iff `fil + r − e ≥ β(n+1)`; source vanishes iff `fil − r + e ≤ α(n−1)` | holds |
| 2.2 first quadrant `E_r = E_∞` for `r > max(p, q+1)` | `(1,0)`, `r = 2` | leaving lands at `q = 1−r < 0`, entering starts at `p = 1−r < 0`; bound `r > 1` | holds |
| 2.2 "finitely many positions of total degree `n`" bullet | 1.4 example, `n = 0`, page `1` | one nonzero position `(0,0)`; `Z_r(0,0) = ℓ^{r−1}ℤ` not eventually constant | **false (R01)** |
| 2.3 Euler characteristic of pages | `E_2^{0,1} = ℤ/4`, `E_2^{2,0} = ℤ/2`, `d_2` onto, `v` = length | page 2: `−2 + 1 = −1`; page 3: `ker = ℤ/2`, coker `0`: `−1 + 0 = −1` | holds |
| 2.3 Serre-class hypothesis needed | `0 → k → k^{(ℕ)} → k^{(ℕ)} → 0`, `v = finrank` (Mathlib: `0` on infinite dimension) | `0 ≠ 1 + 0` | holds |
| 2.3 route through Tau Ceti engine | page of shape `up' (r,1−r)` on `ℤ×ℤ` | engine is for `CochainComplex A ℤ` strictly in `[a,b]` | needs regrouping (R06) |
| 2.3 `P` closed under kernels, cokernels, extensions ⇒ next page in `P` | `E_{r+1} = ker d_out / im d_in` | `im d_in = coker(ker d_in → E)` in `P`; `E_{r+1} = coker(im → ker)` in `P` | holds |
| 3.1 complete ⇔ separated + `lim¹ F^p = 0` under `CountableAB4Star` | six-term sequence of `0 → F^p → X → X/F^p → 0` | `0 → lim F^p → X → lim X/F^p → lim¹ F^p → 0` (constant tower has `lim¹ = 0`) | holds |
| 3.1 Checks | `ℓ`-adic on `ℤ`, `ℤ_ℓ`; constant; zero; `ℤ/4` vs `ℤ/2 ⊕ ℤ/2` | `lim ℤ/ℓ^p = ℤ_ℓ ≠ ℤ`; `gr^0 = gr^1 = ℤ/2` in both | hold |
| 3.2 Checks | `×2` complex; `ℓ`-adic on `ℤ`; zero sequence with constant `ℤ` | `E_∞^{1,0} = ℤ/2 = gr^1 H^1`, finite ⇒ strong; `gr^p ℤ = ℤ/ℓ = E_∞`, not complete; `gr = 0 = E_∞`, not separated | hold |
| 3.3 sign non-example | `f = −1` on pages, `h = id` on `H^0 = ℤ` | `gr^0(id) = 1 ≠ −1 = E_∞(f)` | holds |
| 3.4 finite filtration ⇒ strong; Euler identity | `H^n = ℤ/4` vs `ℤ/2 ⊕ ℤ/2` with `E_∞ = ℤ/2, ℤ/2` | both strongly convergent, `v(H^n) = 2`; `H^n` in `P` by extension closure; `E_∞ = E_{r'}` for `r'` large since finitely many nonzero positions overall | holds (locator R05) |
| 3.5 (iii) strong convergence + exact sequential colimits ⇒ `h_n` iso | `F^p/F^{p'}` iso by induction; `H/F^{p'} = colim_p F^p/F^{p'}` (exhaustive, exact colimits preserve monos); `H = lim H/F^{p'}` (complete) | isos pass to colimits and limits | holds |
| 3.5 Checks "separation needed", "completeness needed" | `E = 0`, `H = ℤ` constant, `H' = 0`; `ℓ`-adic `ℤ → ℤ_ℓ` | `gr = 0` both sides, `h = 0` not iso; `gr^p = ℤ/ℓ` both sides, `h` not onto | hold |
| 3.6 vanishing | `E_r^{p,n−p} = 0` all `p`, convergence | `gr^p H^n = 0` all `p`, exhaustive + separated ⇒ `H^n = F^0 = 0` | holds |
| 3.6 two columns | `E_2^{p,q} = 0` for `p ∉ {0,1}` | `d_r` shifts `p` by `r ≥ 2`; `F^2 = ⋂_{p≥2} F^p = 0`, `F^0 = ⋃ = H^n`; `0 → gr^1 → H^n → gr^0 → 0` | holds (only convergence in degree `n` needed) |
| 3.6 two rows | `q ∈ {0,1}`, `H^{n+1}` | only `d_2 ≠ 0`; `gr^{n+1} = coker(d_2 : E^{n−1,1} → E^{n+1,0})`, `gr^n = ker(d_2 : E^{n,1} → E^{n+2,0})` | holds; convergence in degree `n` unused for the displayed sequence (note) |
| 3.6 two-rows Check (Hopf) | `E_2^{0,0} = E_2^{0,1} = E_2^{2,0} = E_2^{2,1} = ℤ`, `d_2` iso | `H^1 = ker d_2 = 0`, `H^2 = coker d_2 = 0`, `H^0 = H^3 = ℤ` | holds |
| 3.6 extended five-term, `m ≥ 1` | `m = 0`, only `E_2^{0,0} = ℤ` | `0 → ℤ →(id) ℤ →(id) ℤ → 0 → 0` not exact at `H^0` | holds |
| 3.6 extended five-term, general `m ≥ 1` | `E_2^{p,q} = 0` for `0 < q < m` | `H^j = E_∞^{j,0} = E_2^{j,0}` for `j < m` (entering `d_r`, `2 ≤ r ≤ m`, from `q = r−1`); `E_∞^{0,m} = ker d_{m+1}`, `E_∞^{m+1,0} = coker d_{m+1}` | holds |
| 3.6 dimension count | `×2 ⊗ ℚ`, `n = 1` | page 2 sum `1` (`(0,1)` only), `H^1 = 0`; equality iff `Z_∞ = Z_r`, `B_∞ = B_r` iff all `d_{r'}` vanish | holds |
| 4.1 `Z_r`, `B_r` of a spectral object | `r = 2`; witness at `(1,−1)`, `r = 3` | `H(q ≤ q) = 0` gives `⊤`, `⊥`; `δ : H^0(−1 ≤ 0) = ℤ → H^1(−2 ≤ −1) = ℤ` is `×2`, kernel `0` | holds |
| 4.2 abutment filtered object | witness; `IsFirstQuadrant` | `F^3 H^1 = ℤ/2`, `F^4 H^1 = 0`; `F^0 H^n = abutmentFiltration (n+1) n = H^n` (`H^n(n+1 ≤ ⊤) = 0`), `F^{n+1} H^n = abutmentFiltration 0 n = 0` (`H^n(⊥ ≤ 0) = 0`) | holds |
| 4.3 cycle side `Z_r = Zᵗ` for `r ≥ q − i + 2` | `H^{n+1}(⊥ ≤ i) = 0`, `i ≤ q` | `H^{n+1}(⊥ ≤ q) → H^{n+1}(i ≤ q)` mono for `i = q−r+2`; `Zᵗ ≤ Z_{r'} ≤ Z_r = Zᵗ` for `r' ≥ r` | holds |
| 4.3 boundary side `B_r = Bᵗ` for `r ≥ j − q + 1` | `H^n(⊥ ≤ j) → H^n(⊥ ≤ ⊤)` mono, `j ≥ q+1` | mono ⇒ `H^{n−1}(⊥ ≤ ⊤) → H^{n−1}(j ≤ ⊤)` epi; for `x ∈ H^{n−1}(q+1 ≤ ⊤)` subtract the image `z'` of a lift (`δ(z') = 0` by exactness at `q ≤ q+1 ≤ ⊤`), `x − z'` comes from `H^{n−1}(q+1 ≤ j)`; `B_{r} ≤ B_{r'} ≤ Bᵗ` | holds |
| 4.3 continuity at `⊤` | `K = (ℤ →(id) ℤ)` in degrees `n−2, n−1`, `G_j` zero in degree `n−2` | `colim_j H^{n−1}(G_j) = ℤ`, `H^{n−1}(K) = 0`: epi, not iso | iso hypothesis stronger than 5.4 supplies (R03) |
| 4.3 Checks | non-exhaustive complex; 1.4 example; witness | `Bᵗ = im(H^{−1}(0 ≤ ⊤) = ℤ → ℤ) = ℤ`, `B_r = H^{−1}(F^{−r+2}/F^0) = 0`; `Zᵗ = ker(id : ℤ → ℤ) = 0`; `max(q−i+2, j−q+1) = max(2, 3) = 3` at `q = −2`, `i = −2`, `j = 0` | hold |
| 4.4 strong convergence in a range | `n ∈ I`, `a ≤ b` | `F^p = 0` for `n−p+1 ≤ a`, `F^p = H^n` for `n−p+1 ≥ b` (epi `H^n(⊥ ≤ j) → H^n(⊥ ≤ ⊤)`); positions `a ≤ q < b` stabilise from `max(q−a+2, b−q+1) ≤ b−a+1`; `q ≥ b`: `Bᵗ = B_2 = ⊥`, `EInfty q n = coker(H^n → H^n) = 0`, stabilises from `q−a+2`; `q < a`: `H^n(q ≤ q+1) = 0` from `H^n(⊥ ≤ q+1) = 0 = H^{n+1}(⊥ ≤ q)` | holds |
| 4.4 Checks | witness `a = −2`, `b = 0`, `n = 1`; `I = ∅`; non-exhaustive complex | `F^p = H^1` for `p ≤ 2`, `0` for `p ≥ 4`, `gr^3 ≠ 0`; `H^0(G_j) = ℤ → H^0(K) = 0` not mono | hold |
| 4.5 first quadrant | `a = min(0, n+1)`, `b = n+1` | `H^m(⊥ ≤ i) = 0` for `i ≤ 0` (`isZero₁`); `H^n(j ≤ ⊤) = 0` and `H^{n−1}(j ≤ ⊤) = 0` for `j ≥ n+1` (`isZero₂`) give the iso; `H^n(⊥ ≤ ⊤) = 0` for `n < 0` from `H^n(⊥ ≤ 0) = 0 = H^n(0 ≤ ⊤)` | holds |
| 4.5 third quadrant | `a = min(m, 1)`, `b = 1`, `m = −2` | `H^m(⊥ ≤ i) = 0` for `i ≤ m` (`isZero₂`), `H^{m+1}` for `i ≤ m+1`; `H^{m−1}(j ≤ ⊤) = H^m(j ≤ ⊤) = 0` for `j ≥ 1` (`isZero₁`); positions `(p, 2−p)`, `0 ≤ p ≤ 2` ↔ `−2 ≤ −q < 1` | holds |
| 4.6 comparison via 3.5 | identity; Tau Ceti `isIso_hom_app_abutment_of_isIso_page` | Tau Ceti needs vanishing in degrees `n, n+1` at `⊥`, `n−1, n` at `⊤`; 4.4 needs vanishing in `n, n+1` at `⊥` and an iso in degree `n` at `⊤`, implied by `H^{n−1}(b ≤ ⊤) = H^n(b ≤ ⊤) = 0` | holds |
| 5.1 first differential | witness; trivial filtration; `G_t := F^t` | `d_1 = +2`, `E_2^{0,0} = 0`, `E_2^{1,0} = ℤ/2`; `E_1^{0,q} = H^q(K)`; `F^t` antitone is not `Monotone`, refused by `filtrationFunctor` | hold |
| 5.2 induced filtration | witness; non-exhaustive complex; trivial | `F^1 H^1 = ℤ/2`, `F^2 H^1 = 0`; `gr^0 H^0 = 0 ⊊ E_∞^{0,0} = ℤ`; `F^0 = H^n`, `F^1 = 0` | hold |
| 5.3 hypotheses ↔ 4.4 | `H^m(⊥ ≤ i) = H^m(F^{−i} K)` | `i ≤ a ↔ s ≥ −a = p₀`; `j ≥ b ↔ s ≤ −b = p₁`; `F^{p₁} H^n = H^n`, `F^{p₀} H^n = 0` | holds |
| 5.3 degreewise finite ⇒ hypotheses | finite on `K^{n−1}, K^n, K^{n+1}` | `F^s K^m = 0` kills `H^m(F^s K)` (`m = n, n+1`); `F^s K^m = K^m` for `m = n−1, n, n+1` gives the iso in degree `n` | holds |
| 5.3 degree `n+1` needed | 1.4 example, `n = 0` | `H^1(F^s K) = ℓ^{s−1}ℤ ≠ 0` for all `s ≥ 1`; `(0,0)` does not stabilise | holds |
| 5.4 classical convergence | Stacks formulas | regular: `F^{p+r} K^{n+1} = 0` for `p + r ≥ p₀` makes `Z_r` constant; `B_∞ = Bᵗ`: `⋃_r d(F^{p−r+1}K^{n−1}) = d(K^{n−1})` needs exhaustive on `K^{n−1}` and exact colimits; exhaustive `F^p H^n`: exhaustive on `K^n`; separated and complete: `F^{p₀} H^n = 0` | holds with exhaustive on `K^{n−1}, K^n` and bounded below on `K^n, K^{n+1}`; route via 4.3 needs the epi form (R03) |
| 5.4 Checks | non-exhaustive complex; `ℓ`-adic on `ℤ` | bounded below, weak convergence fails; exhaustive, not bounded below, converges, `ℤ` not complete | hold |
| 6.1 degrees | `a = (−1,1)`, `b = 0`, `c = (1,0)`; wrong sign | `(1,0) − (r−1)(−1,1) = (r, 1−r)`; `(1,0) + (r−1)(−1,1) = (2−r, r−1)` | holds |
| 6.1 tuple couple | `D = E = ℤ²` | `ker j = {(x,0)} = im i`; `ker k = {(x,0)} = im j`; `ker i = {(0,y)} = im k`; `jk(x,y) = (y,0)`, `(jk)² = 0`, `i² = i`; page 2 `= {(x,0)}/{(y,0)} = 0` | holds |
| 6.2 towers of a couple | Stacks 21.4 with `i = α`, `j = g`, `k = f` | `Z_{r+1} = f^{−1}(Im α^r)`, `B_{r+1} = g(Ker α^r)`; `r = 0`: `Z_1 = E`, `B_1 = 0` | holds |
| 6.2 Bockstein Checks | `D = ℤ`, `i = ×ℓ`, `E = ℤ/ℓ`, `k = 0`; `D = ℤ/ℓ²`, `i = ×ℓ`, `E = ℤ/ℓ ⊕ ℤ/ℓ`, `j(x) = (x mod ℓ, 0)`, `k(a,b) = ℓb` | first: exact, `B_r = 0`, `Z_r = E`; second: `ker i = ℓℤ/ℓ² = im k`, `ker j = im i`, `ker k = ℤ/ℓ ⊕ 0 = im j`; `d_1 = jk = 0`, `Z_2 = k^{−1}(ℓℤ/ℓ²) = E`; wrong model `k^{−1}(0) = ℤ/ℓ ⊕ 0 ⊊ E` | hold |
| 6.3 couple of a spectral object | `E(p,q) = H^{p+q}(q ≤ q+1)`, `D(p,q) = H^{p+q}(⊥ ≤ q+1)` | `i : H^n(⊥ ≤ q+1) → H^n(⊥ ≤ q+2)` degree `(−1,1)`; `j` degree `(0,0)`; `k = δ : H^n(q ≤ q+1) → H^{n+1}(⊥ ≤ q)` degree `(2,−1)`; exact by the long exact sequence of `⊥ ≤ q ≤ q+1`; `jk` degree `(2,−1)` = native page 2; `(2,−1) + (r−1)(1,−1) = (r+1, −r)` | holds |
| 6.3 Checks | witness tower `A^p = H^1(⊥ ≤ 2−p)`; `k = 0` | `0` for `p ≥ 4`, `ℤ` at `p = 3`, `ℤ/2` for `p ≤ 2`; colim `ℤ/2`, lim `0`; images `F^p = H^1` for `p ≤ 3`, `0` for `p ≥ 4`, as 4.2; with `k = 0`: `ker k = ℤ`, `im j = 0` since `D(1,−1) = H^0(K) = 0` | hold |
| 7.1 Checks | constant; `×ℓ` on `ℤ`; `ℤ/ℓ` with zero maps | `lim = A`, `lim¹ = 0`; `lim = 0`, `lim¹ = ℤ_ℓ/ℤ`; pro-zero, `lim = lim¹ = 0`, Mittag–Leffler with non-surjective maps | hold |
| 7.2 enough projectives ⇒ lim-acyclic epimorphic towers | `(x_n) : T → ∏F`, `P ↠ T` projective | lift `y_{n+1}` with `f(y_{n+1}) = y_n − x_n` along the epi `f`; `(1−s)(y) = x` after the epi cover, so `1 − s` is epi; same for `lim F → F_0` | holds |
| 7.2 Mittag–Leffler ⇒ `lim¹ = 0` | stable images `G ⊆ F` | `G` epimorphic, `F/G` pro-zero; six-term: `lim¹ G = 0 → lim¹ F → lim¹(F/G) = 0` | holds |
| 7.3 Check `A^s = ℤ`, `i = ×ℓ` | `Im^r = ℓ^rℤ` | `Q^s = 0`, `RQ^s = lim¹_r ℓ^rℤ = ℤ_ℓ/ℤ`; `×ℓ` on `ℤ_ℓ/ℤ` injective (`ℓx ∈ ℤ ⇒ x ∈ ℤ`) and onto (`ℤ_ℓ = ℓℤ_ℓ + ℤ`); `0 → 0 → ℤ_ℓ/ℤ → ℤ_ℓ/ℤ → 0` | holds |
| 7.4 definitions vs helle-rognes2024 | Definitions 3.6, 3.7, 3.11 with `s ↦ −s` | `A^{−∞} = colim`, `A^{+∞} = lim`, conditional convergence to the colimit `lim = lim¹ = 0`, `W = colim_s lim¹_r (K^∞ ∩ Im^r)` | holds |
| 7.4 first theorem, "complete" | helle-rognes2024 Example 8.1 | `lim¹ F^s = 0`, `⋂ F^s = ∏k/⨁k ≠ 0`: not separated | **clash with 3.1 (R02)** |
| 7.4 half-plane criteria | `E = 0` for `s < s₀` in degrees `n−1, n`; `E = 0` for `s > s₁` in degrees `n−1, n, n+1` | `i : A^{s+1} → A^s` iso for `s < s₀` (`E^{s,·}` in degrees `n−1`, `n` flank `D` in degree `n`), kernel of `A^s → A^{−∞}` zero, `W = 0`; `Im^r A^s` in degrees `n, n+1` eventually constant, `Z_{r}` (through `Im^{r−1}` in degree `n+1`) eventually constant, `RE_∞ = 0`, `W = 0`; then Theorems 3.9/3.10 with `W = 0` | holds |
| 7.4 Checks | zero couple; `D = ℤ`, `i = id`, `E = 0`; finite length | all invariants `0`; `A^{±∞} = ℤ`, `RE_∞ = W = 0`; descending chains stabilise | hold, but no Check has `W ≠ 0` (R07) |
| 7.5 route | complete + exhaustive, regular | `lim F^s K^m = lim¹ F^s K^m = 0` (3.1), `1 − s` iso on `∏_s F^s K`, exact products give `lim = lim¹ = 0` on `H^n(F^s K)`; `A^{−∞} = H^n(K)` from exhaustiveness in degrees `n−1, n, n+1` (all degrees assumed) | holds; "complete" as in R02 |
| 7.5 Checks | `ℓ`-adic on `ℤ_ℓ`; on `ℤ`; first quadrant | `E_1 = gr = ℤ/ℓ`, `d = 0`, `F^p H^0 = ℓ^pℤ_ℓ` complete; `ℤ` not complete; reduces to 5.3 | hold |

**Shape and completeness.** 31 README targets, each with an API list where it defines something and
at least three Checks (counts: 3 everywhere, 4 in 3.6 and 6.3); every layer ends with Examples and
Dependencies; no LaTeX delimiters, no process words, no pull-request numbers, dates or machine
paths; the only "lemma" is the phrase "five-lemma induction". Hypotheses are in the sentences.
Locators: all present except R04.

**Headline theorems for the package stage** (from the Summary): the stabilisation theorems of 2.2;
the comparison theorem 3.5; the consequences of 3.6; the tower and limit-page identifications
4.1 and 4.3; convergence in a range of degrees 4.4 and the quadrant cases 4.5; the filtered-complex
theorems 5.3 and 5.4; the exact-couple identification 6.3; Boardman's theorems 7.4; the complete
convergence theorem 7.5. All carriers of 2.2, 3.5, 3.6, 4.4, 4.5, 5.3, 5.4 are statable at the pins
once the few definitions of Layers 1–3 (towers, limit page, bidegree assignment, convergence
structure) are given real bodies on `SpectralSequence`, `FilteredObject` and `Subobject`; 6.x and
7.4 need the exact-couple carrier of StableHomotopyKTheory §7.22, which is in a pull request and
cannot be imported, so the package should name them as not statable unless it keeps a local
structure.

**Ownership against open pull requests** was checked by object on the heads the tooling indexes
(grep for exact couples, limit pages, cycle towers, bidegree assignments, convergence structures,
exhaustive/separated/complete predicates, lim¹ in abelian categories): no second owner.

## Not verifiable

- weibel1994 (Definitions 5.2.5, 5.2.11, Theorem 5.2.12, Theorems 5.5.1, 5.5.10, §5.9),
  boardman1999, eilenberg-moore1962, mccleary2001, massey1952, cartan-eilenberg1956: settled as
  uncertified in the manifest; cited by locator only. Boardman's theorem numbers (7.1, 8.2, 8.10,
  8.13, 3.4(b), 5.10) agree with helle-rognes2024's and StableHomotopyKTheory §7.26's citations of
  them, which is all that could be checked.
- The sign of the first differential of the filtered-complex spectral sequence (Conventions witness
  `+2`) rests on Tau Ceti `spectralSequence_first_page_d_eq` identifying it with Mathlib's snake-lemma
  connecting map; this lane does not elaborate, so the identification was read, not run.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8775b2e88a766bca6b46b1db0680552211f7717c", "job": "REV-DESIGN-SpectralSequencesAndConvergence", "model": "fable", "worker": "chris-x17"} -->
