<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7601#issuecomment-6705550421 -->
Review (claude) of 5a1749e

Verdict: needs_changes

1. **F01** (P3) 3.6's two-row sequence assumes convergence in a degree it does not use

   Location: `design/README.md` line 709–712, "If `E_2^{p,q} = 0` for `q ∉ {0, 1}` and the sequence
   converges in degrees `n` and `n + 1`, then `E_2^{n−1,1} →(d_2) E_2^{n+1,0} → H^{n+1} → E_2^{n,1}
   →(d_2) E_2^{n+2,0}` is exact."

   Claim: the displayed sequence needs convergence in degrees `n` and `n + 1`.

   Witness: every term is an `E_2` or `H^{n+1}`. Exactness at `E_2^{n+1,0}` needs
   `F^{n+2} H^{n+1} = 0`; at `H^{n+1}` needs `F^n H^{n+1} = H^{n+1}` and `gr^{n+1}`, `gr^n`; at
   `E_2^{n,1}` needs `E_∞^{n,1} = ker d_2`. All are statements about `H^{n+1}`; `H^n` never enters.

   Repair: write "converges in degree `n + 1`" for the displayed sequence, and keep "Over all `n` with
   convergence these splice into a long exact sequence" (which uses every degree). On the Hopf Check
   the sequence for `H^2` (`n = 1`) uses `F^1 H^2 = H^2`, `F^3 H^2 = 0` only: `H^2 = coker d_2 = 0`.

2. **F02** (P3) 3.4's `*Needs:*` line omits 2.3

   Location: `design/README.md` line 647, "*Needs:* 3.1, 3.2, 2.2."; the Euler bullet at line 649–651
   "`Σ_n (−1)^n v(H^n) = Σ_pq (−1)^{deg pq} v(E_r(pq))`".

   Claim: the section's route needs only 3.1, 3.2 and 2.2.

   Witness: the Euler identity passes from page `r` to the page where the limit is reached by 2.3's
   page-step identity; `design/plan.json` target 3.4 lists `target:2.3` among its prerequisites.

   Repair: "*Needs:* 3.1, 3.2, 2.2; 2.3 for the Euler identity." On the first Check (`ℤ/4` versus
   `ℤ/2 ⊕ ℤ/2`, `v` = length) the identity reads `2 = 1 + 1` on either side, unchanged.

3. **F03** (P3) a 3.1 API bullet depends on Layer 7

   Location: `design/README.md` line 569–570, "complete is equivalent to separated together with
   `lim¹_p F^p X = 0` (with lim¹ of Layer 7.1)"; line 561–562, "*Needs:* Mathlib `FilteredObject`,
   `Filtration`, `Subobject`, `IsLimit`."; Layer 3 Dependencies, line 751.

   Claim: Layer 3 depends on Layers 1 and 2 only.

   Witness: lim¹ is defined in 7.1; the bullet cannot be proved in Layer 3. No cycle: 7.1's *Needs:*
   line names Tau Ceti and Mathlib only. The Conventions (line 118–120) and 7.4, 7.5 use this
   equivalence, so it must live somewhere.

   Repair: move the bullet to 7.1 as "A filtration complete in the sense of 3.1 is separated with
   `lim¹_p F^p X = 0`, and conversely under `CountableAB4Star`", with the six-term route
   (`0 → lim F^p → X → lim X/F^p → lim¹ F^p → 0`, the constant tower having `lim¹ = 0`), and let
   3.1 keep "Complete implies separated" with a pointer "the converse with `lim¹` is 7.1". On the
   `ℓ`-adic Checks: `ℤ` has meet `0`, `lim¹ ℓ^pℤ = ℤ_ℓ/ℤ ≠ 0`, not complete; `ℤ_ℓ` has both `0`,
   complete.

4. **F04** (P3) 6.2's wrong-model Check names only half of the couple

   Location: `design/README.md` line 1114–1116, "On the Bockstein couple of `ℤ/ℓ²` (`D = ℤ/ℓ²`,
   `i = ×ℓ`) it would make `Z_2` smaller than the cycles of `d_1`."

   Claim: the Check is computable as written.

   Witness: exactness only fixes `E` up to the extension `0 → ℤ/ℓ → E → ℤ/ℓ → 0`; `j` and `k` are not
   named, so `Z_2 = k^{−1}(im i)` cannot be evaluated by a reader.

   Repair: write "with `E = ℤ/ℓ ⊕ ℤ/ℓ`, `j(x) = (x mod ℓ, 0)`, `k(a, b) = ℓb`: `ker i = ℓℤ/ℓ² = im k`,
   `ker j = im i`, `ker k = ℤ/ℓ ⊕ 0 = im j`, `d_1 = jk = 0`, `Z_2 = k^{−1}(ℓℤ/ℓ²) = E`, while the wrong
   model gives `k^{−1}(im i²) = k^{−1}(0) = ℤ/ℓ ⊕ 0 ⊊ E`". Values checked: `jk(a,b) = j(ℓb) = (0,0)`.

5. **F05** (P3) a downstream consumer that names no roadmap

   Location: `design/README.md` line 1365–1366, "A roadmap on the geometric circle method, whose main
   theorem is strong convergence in a range of degrees (the Example of Layer 3)."

   Claim: such a roadmap exists or is named.

   Witness: `roadmaps grep` for "Browning" and "geometric circle method" on main and at the 466 open
   heads finds only ArithmeticStatisticsPartVIII (Browning–Le Boudec–Sawin, a different paper) and
   no roadmap on browning-sawin2020.

   Repair: delete the bullet (the Layer 3 Examples paragraph keeps browning-sawin2020 as a worked
   instance), or name the roadmap once it exists.

6. **F06** (P3) References list a Weibel section no target cites

   Location: `design/README.md` line 1378, "weibel1994: … §§3.5, 5.2, 5.4, 5.5, 5.9 (uncertified)".

   Claim: §5.4 is cited. Witness: no target cites §5.4 (grep of the README), and
   `sources.toml`'s weibel1994 `locator` lists §§3.5, 5.2, 5.5, 5.9 only.

   Repair: "§§3.5, 5.2, 5.5, 5.9".

7. **F07** (P3) 1.2's Stacks locator names the definition for the paragraph after it

   Location: `design/README.md` line 332–333, "(stacks-012K line 2612–2624, Definition 20.1, tag
   011N; …)".

   Claim: lines 2612–2624 are Definition 20.1. Witness: stacks-012K line 2598–2605 is Definition
   20.1 (a spectral sequence and its morphisms); line 2612–2624 is the construction of
   `B_r ⊂ Z_r ⊂ E_1` that follows it, which is what 1.2 constructs.

   Repair: "(stacks-012K line 2612–2624, the construction after Definition 20.1, tag 011N; …)".

8. **F08** (P3) `IsGrothendieckAbelian` is filed under the wrong Mathlib module

   Location: `design/README.md` line 185–190, "`AB5`, `EnoughProjectives`, `IsGrothendieckAbelian`, …
   (`Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/Basic.lean`, …)".

   Claim: the class is declared in that file. Witness: at the pin it is
   `Mathlib/CategoryTheory/Abelian/GrothendieckCategory/Basic.lean` line 70; `CountableAB4Star` (line
   126) and `AB5` (line 152) are in the GrothendieckAxioms file.

   Repair: add `Mathlib/CategoryTheory/Abelian/GrothendieckCategory/Basic.lean` to the bullet's file
   list. No target uses `IsGrothendieckAbelian` in a proof route, so nothing else changes.

Files reviewed: `packages/SpectralSequencesAndConvergence/design/README.md`,
`packages/SpectralSequencesAndConvergence/design/plan.json`,
`packages/SpectralSequencesAndConvergence/sources.toml`. Previous review: round 1 (nine findings) and
its repair report (nine applied). No `Suggested.lean` exists at the design stage, so the
elaboration, the `#check` comparison, the one-tactic probe and the headline-absence check are not
applicable: not available (this lane does not elaborate; say so in the report). The eight findings
below are all P3, none blocking; each is a repair, so the verdict is needs changes and a fix round
applies them before the package stage.

## The nine repairs of round 1

| Id | Status | Repaired passage (quoted at most 40 words) and check |
|---|---|---|
| F01 (P1) | repaired | README 2.2: "If finitely many positions of total degrees `n − 1` and `n + 1` are nonzero on page `r₀`, every position `pq` of total degree `n` stabilises." Second Check records the refuting instance; plan 2.2 has `stabilizesAt_of_finite_adjacentDegrees`. Recomputed below. |
| F02 (P2) | repaired | README 7.4: "exhaustive and has `lim¹_s F^s = 0` (complete in the sense of helle-rognes2024 Definition 2.5; complete in the sense of 3.1 if and only if `W^n = 0`)"; 7.5: "separated, and then complete in the sense of 3.1, if and only if `W^n = 0`"; Conventions contrast the two senses; plan 7.4, 7.5 match. |
| F03 (P2) | repaired | README 4.3: "`colim_{j ≥ q+1} H^{n−1}(q + 1 ≤ j) → H^{n−1}(q + 1 ≤ ⊤)` is an epimorphism, then `B_∞(p, q)` exists and equals `Bᵗ`", with the join-of-images proof and the epi-not-iso witness; 5.4 assumes exhaustiveness on `K^{n−1}` and `K^n` only; plan 4.3, 5.4 match. |
| F04 (P3) | repaired | 4.2 "(helle-rognes2024 line 145–152, Definition 3.6 …)", 4.5 "(stacks-012K line 3202–3240, Lemma 24.13 … applied through 4.4)", 4.6 "(weibel1994 Theorem 5.2.12, uncertified, applied through 3.5)"; manifest `cited_for` of stacks-012K includes 4.5. |
| F05 (P3) | repaired | 3.4 "tag 012W, in its filtered-complex form"; also 3.2 (Definition 24.9) and the Euler bullet (Lemma 24.12). stacks-012K line 3131, 3152, 3175 each open with a filtered complex. |
| F06 (P3) | repaired | 2.3 "Regroup the finitely many nonzero positions by total degree into the `ℤ`-indexed complex whose degree-`n` term is the finite direct sum …"; *Needs:* adds `HasFiniteBiproducts` (`Mathlib/CategoryTheory/Limits/Shapes/Biproducts.lean` line 370). |
| F07 (P3) | repaired | 7.4 fourth Check "*A nonzero whole-plane obstruction* (helle-rognes2024 line 943–967, Example 8.1 …) `W^0 ≅ ∏ k / ⨁ k ≠ 0`"; plan test `whole_plane_obstruction_nonzero`. Recomputed below. |
| F08 (P3) | repaired | plan.json has 31 targets, none numbered 3.7; browning-sawin2020 `cited_for = ["Layer 3 Examples"]`; the README's Layer 3 Examples paragraph is unchanged. |
| F09 (P3) | repaired | 7.1 "(in any additive category with the products and with the kernel and cokernel of the product–difference maps, which lim and lim¹ need to be defined)". |

## Verified sound

**Principles.** No route-specific shortcut; no re-planning (DGFloer Layer 1 item 3's module
theorems, AlgebraicTopology Stage 6 item 0's module towers, DerivedModuleAlgebra §S.1's double
complex and StableHomotopyKTheory §7.26's towers of spectra are instances or Checks, each marked as
differing by generality); no computational algorithm; no copied passage; no `set_option` or sorry'd
data (no Lean at this stage). Gate output:

    candidate: SpectralSequencesAndConvergence is not in the merge order yet; checked as if placed after StableHomotopyKTheory (the intake inserts it when its design is accepted)
    depcheck: 240 roadmaps, 2369 edges, 0 problem(s)

No UPWARD or CYCLE line. Declared gaps: none. `roadmaps resolve` on the README: no cross-roadmap
citation and no Lean name found nowhere. `plan.json` parses: 7 layers, 31 targets, 98 tests, every
target with at least three tests, a locator and a hypotheses list; the plan statements of 2.2,
2.3, 3.4, 4.3, 4.6, 5.4, 7.4, 7.5 agree with the README after the repairs.

**Suppliers resolved this round.** StableHomotopyKTheory at its open head: §7.22 (bigraded exact
couples of degrees `a, b, c`, derived couple `D′ = im i`, `E′ = H(E, jk)` of degrees `a, b − a, c`,
`d_r` of degree `c + b − (r − 1)a`, the tuple couple with `i² = i`) and §7.26 (Boardman's
`A⁺, RA⁺, A⁻, RE∞, W`, the same three Checks as 7.4's first three) exist as cited. On main:
DGFloer Layer 1 item 3 ("The spectral sequence of a filtered complex", module complexes, the
dictionary "cohomological `E_r^{p,q}` is native page `r + 1` at `(2p + q + 1, −p − 1)`" and the
cohomological Weibel 5.5.10 and 5.5.1(2)); DGFloer Layer 1 item 2 (`arbitraryCWSerreSpectralSequence`
and its cohomological form); AlgebraicTopology Stage 6 item 0 (lim, lim¹ as `coker δ`, six-term,
Mittag–Leffler vanishing, Milnor sequences, README line 952–973); DerivedModuleAlgebra §S.1
(`DoubleComplex.spectralSequence`, `abutmentFiltration`, `eInftyIsoGr`, `page_eq_eInfty`,
`fiveTerm_exact`, README line 2345–2353); SchemeAndStackFoundations §2.2 (Leray and Čech);
ComplexKahlerGeometry K8 (Frölicher); HeegaardFloer (its own finite filtered complexes);
MorseTheory (consumes DGFloer Layer 1 item 3). The open pull request #963 revises DGFloer; the
README cites DGFloer as on main, which is right.

**Ownership against open pull requests** (by object, on main and the 466 indexed heads): "exact
couple" hits are instances or consumers of StableHomotopyKTheory §§7.21–7.27 (SchemeKTheoryOperations'
coniveau couple, TangentialBordism's homotopy couple, ArithmeticLocallySymmetricSpaces,
DerivedDeRhamCohomology, PurityForFlatCohomology, ChromaticHomotopyTheory, EllipticKTheory); no
roadmap declares a bidegree assignment, an Euler characteristic of pages, convergence structures
in a set of degrees, exhaustive/separated/complete predicates on `FilteredObject`, or lim¹ in an
abelian category (CstConjectureForDaggerVarieties' gap asks LocallyAnalyticDistributions for Roos
derived limits in a quasi-abelian category of locally convex spaces, a different carrier;
KTheoryFiniteLocalFields §5.12's "infinite cycles" are permanent cycles of one THH spectral
sequence). No second owner.

**Library names at the pins** (opened this round): `IsFirstQuadrant` (`isZero₁`: `H^n(i ≤ j) = 0`
for `j ≤ 0`; `isZero₂`: for `n < i`) and `IsThirdQuadrant` (`isZero₁`: for `0 < i`; `isZero₂`: for
`j ≤ n`), `coreE₂Cohomological` (`i₀ = q − r + 2`, `i₁ = q`, `i₂ = q + 1`, `i₃ = q + r − 1`,
`deg = p + q`), `coreE₂CohomologicalNat`, `coreE₂CohomologicalFin`, `coreE₂HomologicalNat`
(`deg = −p − q`, `i₁ = −q`) at `Mathlib/Algebra/Homology/SpectralObject/HasSpectralSequence.lean`
394–455, 143–272; `SpectralSequence` (`page`, `iso`), `CohomologicalSpectralSequence` on `ℤ × ℤ`
with `up' (r, 1 − r)`, the `Nat` and `Fin` abbreviations (`SpectralSequence/Basic.lean` 36–134);
`spectralSequenceNat` (`Rel a b ↔ a + u = b`, `ComplexShape.lean` 36); `EulerCharSigns` (`χ : ι → ℤˣ`,
`χ_next`), `eulerChar` as a `finsum` of `χ · finrank` defaulting to `0` on infinite support,
`homologyEulerChar` (`EulerCharacteristic.lean` 56–175: no `eulerChar = homologyEulerChar` theorem
exists, so 2.3's bullet is this roadmap's statement in Mathlib's vocabulary); `Filtration X I`
(`I ⥤ MonoOver X`), `FilteredObject`, `Hom`, `IsStrictHom` (`Filtration/Basic.lean` 44–145);
`Subobject.«exists»`, `existsPullbackAdj` (`Subobject/Basic.lean` 736–757, the left adjoint used in
4.3's continuity argument), the complete lattice under well-poweredness, wide pullbacks, images and
coproducts (`Subobject/Lattice.lean` 569–719); `HasFiniteBiproducts` (370), `CountableAB4Star`
(126), `AB5` (152), `HasExactColimitsOfShape` (47), `isoHomologyπ`/`isoHomologyι` (630, 583),
`spectralObjectMappingCone` (46), `mapHomologicalFunctor` (245), `IsSerreClass` (45),
`isoMapFourδ₁Toδ₀'`/`δ₄Toδ₃'` (191, 224), `IsGrothendieckAbelian` (R08). Tau Ceti:
`isIso_hom_app_abutment_of_isIso_page` (`SpectralObject/Comparison.lean` 121: vanishing of
`H^m(⊥ ≤ i)` for `i ≤ a`, `m ∈ {n, n+1}` and of `H^m(i ≤ ⊤)` for `i ≥ b`, `m ∈ {n−1, n}`, iso on
every object of some page `r ≥ 2`, exactly as 4.6 compares); `isIso_hom_f_of_le`
(`SpectralSequence/Comparison.lean` 32, iso at every `pq` of page `r`); the Euler engine
`sum_negOnePow_X_eq_sum_negOnePow_homology` (`GrothendieckGroup/EulerCharacteristic.lean` 165:
`hzero`, the degreewise relation `hrel`, `IsStrictlyGE a`, `IsStrictlyLE b`, as 2.3's regrouped
route supplies); `filtrationFunctor` (`Filtered/SpectralObject.lean` 304, from a monotone
`ℤ → Subobject K`); `spectralSequence_first_page_d_eq` (`Filtered/FirstPage.lean` 89, the
connecting map of `F_q/F_{q−1} → F_{q+1}/F_{q−1} → F_{q+1}/F_q`, with the McCleary dictionary
`s = −q − 1`, `t = p + 2q + 1` in its module docstring, line 24–26, agreeing with the Conventions);
`towerDifference` (77), `isLimitConeOfTowerDifference` (122), `towerDifference_naturality` (150),
`IsProZero.isIso_towerDifference` (165); `ModuleTower.lim` (`Tower/Basic.lean` 170),
`limOne` (516 map), `IsMittagLeffler`, `subsingleton_limOne_of_isMittagLeffler`
(`MittagLeffler.lean` 191); `AbelianK0.AdditiveInvariant` (`GrothendieckGroup/Abelian.lean` 216);
`abutmentFiltrationι` (54), `abutmentFiltrationMap` (76), `EInftyIsoCokernel` (92),
`isZero_abutmentFiltration` (114), `isIso_abutmentFiltrationι` (123), `EInfty`
(`Abutment.lean`), `spectralSequencePageXIsoEInfty` (`Stabilization.lean` 51); and the remaining
cited names (`exists_mem_range_filtrationAbutmentFiltrationι`,
`filtrationSpectralSequencePageXIsoGradedOfExhaustive`,
`isIso_homologyMap_of_isIso_spectralSequence_page_of_exhaustive`,
`filtrationSpectralSequencePageXIsoGradedOfFinite`, `filtrationAbutmentIso`,
`toFiltrationAbutmentFiltration_comp_filtrationAbutmentIso_hom`,
`isIso_homologyMap_of_isIso_spectralSequence_page`, `rowFiltrationSpectralSequence` and its
`PageXIsoEInfty`, `spectralObjectMap`, `filtrationFunctorMap`, `isZero_spectralObject_H_bot/top`,
`filtrationSpectralSequencePageXIsoEInfty`, `spectralSequenceMap`, `spectralSequencePageXMap`,
`EMap`, `opcyclesMapOfHom`, `isIso_opcyclesMapOfHom_of_isIso`,
`spectralSequencePageXMap_comp_pageXIsoEInfty_hom`, `spectralSequenceFirstPageXIsoCokernel`,
`pageFunctor`, `pageHomologyNatIso`, `pageXIsoOfEq`, `SpectralSequenceDataCore`,
`HasSpectralSequence`, `spectralSequencePageXIso`, `spectralSequenceFirstPageXIso`, `EInt`,
`Subobject.ofLE`, `imageSubobject`, `kernelSubobject`, `HasCountableProducts`,
`HasCountableCoproducts`, `EnoughProjectives`, `ModuleCat.enoughProjectives`) found at the pins by
grep of their files.

**Sources: the seeded sample**, read at the locators in the cached texts. 1.2: stacks-012K line
2612–2624 (towers `B_r ⊂ Z_r ⊂ E_1` from `d_r`; see R07 for the label) and helle-rognes2024 line
65–70 (Lemma 2.2, the same induction). 1.3: line 3120–3125 (Lemma 24.8 (1), (2): regular iff
`Z_r^{p,q}` eventually constant, coregular iff `B_r^{p,q}`), line 2634–2637 (degeneration gives
`E_r = E_{r+1} = … = E_∞`). 2.2: line 3107–3116 (Definition 24.7: regular, coregular, bounded,
bounded below `E^{p,n−p}_{r₀} = 0` for `p ≥ b(n)`, bounded above), line 3120–3130 (Lemma 24.8
(3)–(5) and the persistence hint). 3.2: line 3131–3143 (Definition 24.9: weakly converges, abuts,
converges with regularity and `H^n = lim H^n/F^pH^n`) and helle-rognes2024 line 94–98 (Definition
2.7, exhaustiveness inside "weakly", Hausdorff for "converges", complete for "strongly"). 3.3: line
3055–3061 (Lemma 24.4, filtered complexes). 3.6: weibel1994 and mccleary2001 uncertified. 4.1:
helle-rognes2024 line 291–303 (Definition 4.5: `Z_r^s = Ker(∂ : E_1^s → H(s−r, s−1))`,
`B_r^s = Im(∂ : H(s, s+r−1) → E_1^s)`, Remark 4.6 the image and kernel forms) and line 334–335
(Remark 4.10): with `s = q + 1` and Helle–Rognes page `r` = native page `r + 1` these are 4.1's
formulas. 4.3: line 3072–3106 (Lemma 24.6 and (24.6.1), (24.6.2)), line 3144–3151 (Lemma 24.10).
4.4 and 4.5: line 3202–3240 (Lemma 24.13; its proof uses `p₀(n), p₀(n+1), p₁(n−1), p₁(n)`, and
the README's weaker `⊤`-side hypothesis in degree `n` is verified in the table). 4.6: weibel1994
5.2.12 uncertified. 5.1: line 3038–3054 (Lemma 24.3 (1): `d_1` is the connecting map of
`0 → gr^{p+1} → F^p/F^{p+2} → gr^p → 0`; (2): if `d(F^p) ⊂ F^{p+1}` then `E_1^{p,q} = gr^p K^{p+q}`
with `d_1` induced by `d`); line 3055–3061 (Lemma 24.4). 6.2: line 2687–2703 (Lemma 21.4:
`B_{r+1} = g(Ker α^r)`, `Z_{r+1} = f^{−1}(Im α^r)`, the rule `d_{r+1} x = g y` for `f x = α^r y`,
and the remark `B_∞ = g(⋃ Ker α^r) ⊂ Z_∞ = f^{−1}(⋂ Im α^r)`) and helle-rognes2024 line 136–144
(Definition 3.3, Lemma 3.4, Remark 3.5). 7.2: line 3715–3735 (Definition 31.2, Lemma 31.3 for
abelian groups, Neeman's remark at 3720–3724). 7.5: weibel1994 5.5.10 and eilenberg-moore1962 §7
uncertified. Also read for the repairs: line 2596–2605 (Definition 20.1), 2653–2686 (Definitions
21.1, 21.3, Lemma 21.2), 2834–2838 and 2900–2905 (§23), 2981–3014 (bigrading, Lemma 24.2),
3062–3071 (Definition 24.5), 3152–3197 (Lemmas 24.11, 24.12 and the even–odd argument), 1156–1162
(weak Serre subcategory), 2349–2368 (Definition 19.1); helle-rognes2024 line 10–26 (Boardman's
half-plane results and `W`), 71–84 (Definitions 2.3, 2.5, Remark 2.4), 145–178 (Definitions 3.6,
3.7, 3.11, Theorems 3.9, 3.10 exactly as 7.4 states them under `s ↦ −s`), 185–247 (Lemmas
3.13–3.15 and both proofs; Lemma 3.15 (c) is where epimorphic limit projections enter), 940–970
(Example 8.1). No author-flagged unverified locator exists.

**Adversarial table** (repaired passages, the sampled targets, the headline theorems).

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 2.2 finiteness bullet (F01) | 1.4 complex, `n = 0`; ×2 `E₂` example, `n = 1`; zero sequence | 1.4: degree `−1` empty, degree `1` has `(p, 1−p)`, `p ≥ 1`, all `ℤ/ℓ`: infinite, no claim, and `Z_r(0,0) = ℓ^{r−1}ℤ` not constant. ×2: degree `0` empty, degree `2` only `(2,0)`; leaving target of `(0,1)` at `(r, 2)` nonzero only for `r = 2`: stabilises from `3`, as 1.3's Check. Zero: from `r₀` | holds |
| 2.2 "finite in every degree ⇒ bounded" | first quadrant; `S_n = ∅` | `β(n) = 1 + max fil`, `α(n) = min fil − 1`; first quadrant `β(n) = n + 1`, `α(n) = −1`; empty degree: any bound | holds |
| 2.2 stabilisation page | `pq` of degree `n`, fil `f` | leaving target `(f + r − e, n+1)` zero iff `f + r − e ≥ β(n+1)`; entering source `(f − r + e, n−1)` zero iff `f − r + e ≤ α(n−1)` | holds |
| 2.2 first quadrant `r > max(p, q+1)` | `(1,0)`, `r = 2`; `(0,0)` | leaving at `q = 1 − r < 0`, entering at `p = 1 − r < 0`; `(0,0)` from page `2` since `max(0,1)+1 = 2` | holds |
| Conventions: two senses of "complete" (F02) | Example 8.1; `ℓ`-adic `ℤ`; `ℓ`-adic `ℤ_ℓ` | 8.1: `lim¹_s F^s = 0`, meet `∏k/⨁k ≠ 0`; `ℤ`: meet `0`, `lim¹ ℓ^pℤ = ℤ_ℓ/ℤ`; `ℤ_ℓ`: both `0` | consistent with 3.1 (R03 on placement) |
| 7.4 first theorem restated (F02) vs helle-rognes2024 Theorem 3.9 | `s ↦ −s` | HR: weakly (exhaustive) to `A^∞ = colim`, filtration complete (`RF^{−∞} = 0`), `F^{−∞}A^∞ ≅ W`; README: weak + exhaustive + `lim¹ F^s = 0`, meet `≅ W^n` | holds |
| 7.4 second theorem vs Theorem 3.10 | `s ↦ −s` | HR: strongly to `A^{−∞} = lim`, `RA^{−∞} ≅ W`; README: strongly to `A^{+∞}`, `RA^{+∞} ≅ W^n`; HR strong = 3.1 strong under `CountableAB4Star` | holds |
| 7.4 half-plane criterion 1 | `E_1^{s,·} = 0`, degrees `n−1, n`, `s < s₀` | couple segment `E^{s,n−1−s} →k A^{s+1} →i A^s →j E^{s,n−s}`: `i` iso for `s < s₀`; `A^{−∞} = A^{s₀}`, `ker(A^s → A^{−∞}) = 0` for `s ≤ s₀`, `W^n = colim 0 = 0`; weak + exhaustive + `lim¹ = 0` + meet `0` ⇒ 3.1-complete ⇒ strong | holds |
| 7.4 half-plane criterion 2 | vanishing for `s > s₁` in degrees `n−1, n, n+1` | `i` iso in degrees `n, n+1` for `s > s₁`; `Im^r A^s = Im^{s₁+1−s} A^s` for `r ≥ s₁ + 1 − s`; `Z_{r+1}(s, n−s) = k^{−1}(Im^r A^{s+1})` in degree `n+1` constant; `RE_∞ = 0`; `lim¹_r (ker ∩ Im^r) = 0`, `W^n = 0` | holds |
| 7.4 Example 8.1 Check (F07) | `A^s = ∏_{i≥|s|} k`, `m ≥ 1`, `r ≥ 2m` | `E_1^{s,−s} = coker i = k` (`s ≥ 0`), `E_1^{s,−1−s} = ker i = k` (`s < 0`); `i^{r}: A^{−m+1+r} → A^{−m+1}` has image `∏_{i ≥ max(m−1, r−m+1)}`, contains `e_{m−1}` iff `r ≤ 2m−2`: `Z_r(−m, m−1) = E` for `r ≤ 2m−1`, `0` from `2m`; `d_{2m−1}(e_{m−1}) = j(e_{m−1}) ≠ 0` in `E^{m−1,1−m}`; `A^{+∞} = ⋂ ∏_{i≥s} k = 0`; `A^0 → lim k^s = ∏k` iso so `RA^{+∞} = 0`; `A^{−∞} = ∏k/⨁k`, `F^s = A^{−∞}`; `ker(A^{−m} → A^{−∞}) ∩ Im^r A^{−m} = ⨁_{i ≥ r−m} k`, `lim¹_r = ∏_{i≥m}k/⨁_{i≥m}k`, `W^0 = ∏k/⨁k` = meet | holds; `W := 0` refuted |
| 7.5 restated (F02) | `ℓ`-adic `ℤ_ℓ`; `ℓ`-adic `ℤ`; first quadrant | `ℤ_ℓ`: complete, exhaustive, `E_1^{p,−p} = ℤ/ℓ` (`p ≥ 0`), regular, `E_1 = 0` for `p < 0` in degrees `−1, 0` ⇒ `W^0 = 0` ⇒ strong, `F^p H^0 = ℓ^pℤ_ℓ`; `ℤ`: hypothesis fails (`lim ℤ/ℓ^p = ℤ_ℓ ≠ ℤ`), conclusion fails; first quadrant: regular, bounded, reduces to 5.3 | holds |
| 7.5 route | `1 − s` on `∏_s F^s K` | complete ⇒ `lim = lim¹ = 0` on `F^s K^m`; `1 − s` mono and epi ⇒ iso of complexes; exact products: `H^n(∏ F^sK) = ∏ H^n(F^sK)`, so `lim_s H^n(F^sK) = lim¹_s = 0`; exhaustive + exact colimits: `colim H^n(F^sK) = H^n(K)` | holds |
| 4.3 continuity at `⊤` (F03) | shifted witness; ×2 at `(3,−2)` | witness `K = (ℤ →id ℤ)` in degrees `n−2, n−1`, `G_j = 0` in degree `n−2`, `ℤ` in degree `n−1` for `j ≥ q+2`: `colim_j H^{n−1}(G_j/G_{q+1}) = ℤ → H^{n−1}(K) = 0` epi, not iso; `H^n(q ≤ q+1) = 0` so `B_r = 0 = Bᵗ`. ×2: `colim_{j ≥ −1} H^0(−1 ≤ j) = ℤ → H^0(−1 ≤ ⊤) = ℤ` iso; `B_3 = 2ℤ = Bᵗ` | holds |
| 4.3 proof of continuity | `S ↪ T` test | `im(colim φ) ≤ S` iff `φ` factors through `S` iff each `φ_j` does iff each `im φ_j ≤ S`; `δ_⊤ ∘ ι_j = δ_{(q ≤ q+1 ≤ j)}`; `«exists» δ ⊣ pullback δ` preserves the join `⊤` | holds, no exactness |
| 4.3 cycle side | `i ≤ q`, `i′ = q − r + 2 ≤ i` | `δ_{i′} = H^{n+1}((⊥ ≤ q) → (i′ ≤ q)) ∘ δ_⊥`; `H^{n+1}(⊥ ≤ i′) = 0` makes that map mono at `i′ = i`; `Zᵗ ≤ Z_{r′} ≤ Z_r = Zᵗ` for `r′ ≥ r` | holds |
| 4.3 boundary side | `j ≥ q+1`, `H^n(⊥ ≤ j) → H^n(⊥ ≤ ⊤)` mono | mono ⇒ `H^{n−1}(⊥ ≤ ⊤) → H^{n−1}(j ≤ ⊤)` epi; for `x`, lift its image to `z`, `δ_⊤(z′) = 0` (triple `q ≤ q ≤ ⊤` to `q ≤ q+1 ≤ ⊤`, `H^n(q ≤ q) = 0`), `x − z′ = ι_j(w)`; `B_{j−q+1} = Bᵗ` | holds |
| 4.3 Checks | non-exhaustive complex; 1.4 complex; ×2 | `Bᵗ = im(ℤ → ℤ) = ℤ`, `B_r = H^{−1}(G_j/G_0) = 0`; `Zᵗ = ker(id) = 0 = ⋂ ℓ^{r−1}ℤ`; `max(q−i+2, j−q+1) = max(2, 3) = 3` at `q = −2`, `i = −2`, `j = 0` | hold |
| 5.4 hypotheses (F03) | non-exhaustive complex, `n = 0`; `K = ℤ` in degree `n+1`, `F^s = 0` | first: exhaustive on `K^0`, not on `K^{−1}`, `E_∞^{0,0} = ℤ ≠ 0 = gr^0 H^0`, fails as the Check says; second: not exhaustive on `K^{n+1}`, `E_1 = 0`, `H^n = 0`, strong in degree `n`: exhaustiveness on `K^{n+1}` is not needed | holds |
| 5.4 route | `colim_j G_j/G_{q+1} → K/G_{q+1}` | exact colimits: colimit of monos mono, image the join; iso in degree `n−1` (exhaustive), mono in degree `n`; same cycles in degree `n−1`, smaller boundaries ⇒ `H^{n−1}` epi; cycle side from `F^s K^{n+1} = 0`, `i = min(q, −p₀)`; `F^p H^n` exhaustive from `K^n` (same cycles argument), zero from `p₀` | holds |
| 2.3 regrouped route (F06) | `E_2^{0,1} = ℤ/4`, `E_2^{2,0} = ℤ/2`, `d_2` onto, `v` = length | `T^1 = ℤ/4`, `T^2 = ℤ/2`, `χ = −2 + 1 = −1`; `H^1(T) = ℤ/2`, `H^2(T) = 0`, `−1`; `d ∘ d` at `(pq, pq″)` is one term `d_r d_r = 0` (`next_eq` of the shape); `H^n(T) = ⊕_{deg = n} E_{r+1}` since each `pq` has one successor and one predecessor; `hrel` from `0 → ker → T^i → im → 0`, `0 → im → ker → H → 0` in `P` | holds |
| 2.3 Euler bullet vs Mathlib | `C = ModuleCat k`, `P` = finite-dimensional | `eulerChar (page r) = Σᶠ χ(pq) finrank E_r(pq)`, `homologyEulerChar = Σᶠ χ finrank E_{r+1}(pq)` via `E.iso`; `χ(pq) = (−1)^{p+q}` flips along `up' (r, 1−r)` | holds |
| 2.3 Serre hypothesis | `0 → k → k^{(ℕ)} → k^{(ℕ)} → 0` | finrank gives `0 ≠ 1 + 0` | holds |
| 7.1 invariance (F09) | lim¹ as `coker(1 − s)` | needs the cokernel; the Conventions' "defined whenever the product exists" is in the abelian `C` | holds |
| 1.2 towers | ×2 `E₂` example; API iffs | `Z_3(0,1) = ker(×2) = 0 = B_3(0,1)`; `Z_3(2,0) = ℤ`, `B_3(2,0) = 2ℤ`; `Z_{r+1} = Z_r` iff `ker d = ⊤` iff `d = 0`; `B_{r+1} = B_r` iff `im = ⊥`; `B_{r+1} := B_r` gives `E_3^{2,0} = ℤ` | holds |
| 1.3 | ×2 example | `(2,0)`: entering `d_2 ≠ 0`, stabilises from `3` not `2`; `(0,1)`: nothing enters from `(−2,2)`, leaving `d_2 ≠ 0`; degeneration at `3`, not at `2` | holds (loose "coregular from page 2" is a Check phrase) |
| 1.4 limit page | 1.4 complex | `gr^0 K = (ℤ → 0)`, `gr^p K = (0 → ℤ/ℓ)` for `p ≥ 1`, `gr^p = 0` for `p < 0`; `Z_1 = ℤ`, `Z_r = ℓ^{r−1}ℤ`, `Z_∞ = 0`, `E_∞^{0,0} = 0`, `H^0(K) = 0` | holds |
| 3.2 Checks | `d_1 = ×2`; `ℓ`-adic `ℤ`; zero + constant | `E_2^{0,0} = 0`, `E_2^{1,0} = ℤ/2 = gr^1 H^1`, `gr^0 H^1 = 0`, finite ⇒ strong; `E_1^{p,−p} = ℤ/ℓ = gr^p ℤ` (`p ≥ 0`), exhaustive, separated, not complete; `gr = 0 = E_∞`, constant filtration exhaustive and not separated | hold |
| 3.3 sign Check | `f = −1`, `h = id` | `gr^0(id) = 1 ≠ −1 = E_∞(f)`; `−1` commutes with `d` and the homology isos | holds |
| 3.6 vanishing | `E_r^{p,n−p} = 0` all `p` | `E_∞ = 0`, `gr^p = 0`, `F^p` constant, exhaustive and separated ⇒ `H^n = ⊤ = ⊥ = 0` | holds |
| 3.6 dimension count | ×2 `⊗ ℚ`, `n = 1` | page-2 sum `1`, `dim H^1 = 0`; `dim E_∞ ≤ dim E_r` with equality iff `Z_∞ = Z_r`, `B_∞ = B_r` iff all later `d` at the position vanish | holds |
| 3.6 two columns | `p ∈ {0,1}` | `d_r` moves `p` by `r ≥ 2`: zero; `F^2 = F^3 = ⋯`, meet ⇒ `F^2 = 0`; `F^0 = F^{−1} = ⋯`, join ⇒ `F^0 = H^n`; `0 → gr^1 → H^n → gr^0 → 0` | holds |
| 3.6 two rows | `q ∈ {0,1}`, `H^{n+1}` | only `d_2 : (p,1) → (p+2,0)`; `gr^{n+1} = coker d_2`, `gr^n = ker d_2`, `F^{n+2} = 0`, `F^n = H^{n+1}`; degree `n` unused | holds (R01) |
| 3.6 Hopf Check | `d_2 : E_2^{0,1} → E_2^{2,0}` iso | `H^1 = ker = 0`, `H^2 = coker = 0`, `H^0 = H^3 = ℤ` | holds |
| 3.6 first quadrant, general `m ≥ 1` | `E_2^{p,q} = 0` for `0 < q < m` | `j < m`: `gr^p H^j ≠ 0` only at `p = j`; entering `d_r` into `(j,0)` from `(j−r, r−1)` with `1 ≤ r−1 ≤ m−2`: zero; `E_∞^{j,0} = E_2^{j,0} = H^j`. `H^m`: `E_∞^{m,0} = E_2^{m,0}`, `E_∞^{0,m} = ker d_{m+1}`, `E_∞^{m+1,0} = coker d_{m+1}` | holds |
| 3.6 `m = 0` Check | only `E_2^{0,0} = ℤ` | `0 → ℤ →id ℤ →id ℤ → 0 → 0`, not exact at the middle | holds |
| 4.1 | `r = 2`; ×2 at `(1,−1)`, `r = 3` | `H(q ≤ q) = 0` gives `⊤`, `⊥`; `δ : H^0(G_0/G_{−1}) = ℤ → H^1(G_{−1}/G_{−2}) = ℤ` is `x ↦ 2x`, `Z_3 = 0` = classical `E_2^{0,0}` | holds |
| 4.2 | ×2, `n = 1`; `IsFirstQuadrant` | `F^3 H^1 = abutmentFiltration (−1) 1 = im(H^1(G_{−1}) → H^1(K)) = ℤ/2`, `F^4 = abutmentFiltration (−2) 1 = 0`; `F^0 H^n = abutmentFiltration (n+1) n = H^n` (`H^n(n+1 ≤ ⊤) = 0` by `isZero₂`), `F^{n+1} H^n = abutmentFiltration 0 n = 0` (`isZero₁`) | holds |
| 4.4 filtration | `a ≤ b` | `n − p + 1 ≤ a` iff `p ≥ n + 1 − a` ⇒ `F^p = 0`; `n − p + 1 ≥ b` iff `p ≤ n + 1 − b` ⇒ `F^p = H^n` | holds |
| 4.4 stabilisation pages | `a ≤ q < b`; `q ≥ b`; `q < a` | `i = a`, `j = b`: `max(q−a+2, b−q+1) ≤ b−a+1` iff `q ≤ b−1` and `q ≥ a`; `q ≥ b`: `j = q+1`, page `max(q−a+2, 2) = q−a+2`, `gr^{n−q} = 0` since `n − q ≤ n − b < n + 1 − b`; `q < a`: `H^n(⊥ ≤ q+1) = 0 = H^{n+1}(⊥ ≤ q)` ⇒ page-2 object `0` | holds |
| 4.4 Checks | ×2 `a = −2`, `b = 0`; non-exhaustive complex | `H^1(G_i) = H^1(F^{−i}) = 0` for `i ≤ −2`, `G_j = K` for `j ≥ 0`; `F^p = H^1` for `p ≤ 2`, `0` for `p ≥ 4`; `H^0(G_j) = ℤ → H^0(K) = 0` not mono | hold |
| 4.5 first quadrant at the pin | `a = min(0, n+1)`, `b = n+1` | `isZero₁` (`j ≤ 0`): `H^m(⊥ ≤ i) = 0` for `i ≤ a`; `isZero₂` (`m < i`): `H^{n−1}(j ≤ ⊤) = 0` for `j ≥ n`, `H^n(j ≤ ⊤) = 0` for `j ≥ n+1` ⇒ iso; `H^n = 0` for `n < 0` from `H^n(⊥ ≤ 0) = 0 = H^n(0 ≤ ⊤)` | holds |
| 4.5 third quadrant at the pin | `a = min(m, 1)`, `b = 1`, `m = −2` | `isZero₂` (`j ≤ m`): `H^m(⊥ ≤ i) = H^{m+1}(⊥ ≤ i) = 0` for `i ≤ a ≤ m`; `isZero₁` (`0 < i`): `H^{m−1}(j ≤ ⊤) = H^m(j ≤ ⊤) = 0` for `j ≥ 1`; `(p,q) ∈ ℕ×ℕ` is native `(−p, −q)`, shape `(−r, r−1)` ↦ `(r, 1−r)`; positions outside the quadrant vanish (`q′ ≥ 1` by `isZero₁`, `p′ ≥ 1` by `isZero₂`); `m = −2`: `(p, 2−p)`, `0 ≤ p ≤ 2` ↔ `−2 ≤ −q < 1` | holds |
| 4.6 | Tau Ceti line 121 vs 4.4 | Tau Ceti: `H^m(⊥ ≤ i) = 0`, `m ∈ {n, n+1}`, `i ≤ a`; `H^m(i ≤ ⊤) = 0`, `m ∈ {n−1, n}`, `i ≥ b`; 4.4: the same at `⊥`, and at `⊤` only the iso in degree `n`, implied by the two vanishings | holds |
| 5.1 dictionary | `(a, b) ↦ (−b−1, a+b)`, `e = 1` | native page `r+1` shape `(r+1, −r)`: fil `+r`, deg `+1`; classical `(p,q)` at `(2p+q+1, −p−1)`: fil `p`, deg `p+q`; `E_1^{p,q} = H^{p+q}(G_{−p}/G_{−p−1}) = H^{p+q}(F^p/F^{p+1})`; Tau Ceti's `F_q/F_{q−1} → F_{q+1}/F_{q−1} → F_{q+1}/F_q` at `q = −p−1` is `gr^{p+1} → F^p/F^{p+2} → gr^p` | holds |
| 5.1 Checks | ×2 stupid filtration; trivial; `G_t := F^t` | `E_1^{0,0} = H^0(ℤ → 0) = ℤ`, `E_1^{1,0} = H^1(0 → ℤ) = ℤ`, `d_1 = +2`, `E_2 = (0, ℤ/2)`; `E_1^{0,q} = H^q(K)`, one column; antitone `F` is not `Monotone` | hold |
| 5.2 | ×2; non-exhaustive; trivial | `F^1 H^1 = im(H^1(F^1) → H^1) = ℤ/2`, `F^2 = 0`; `gr^0 H^0 = 0 ⊊ E_∞^{0,0} = ℤ`; `F^0 = H^n`, `F^1 = 0`; classical `p` = E₂ index `p + n + 1` | holds |
| 5.3 ↔ 4.4 | `G_t = F^{−t}` | `H^m(⊥ ≤ i) = H^m(F^{−i}K) = 0` for `i ≤ −p₀ = a`; iso for `j ≥ −p₁ = b`; `a ≤ b` iff `p₁ ≤ p₀`; degreewise finite on `K^{n−1}, K^n, K^{n+1}` gives both | holds |
| 6.1 | degrees; tuple couple | `(1,0) − (r−1)(−1,1) = (r, 1−r)`; `(1,0) + (r−1)(−1,1) = (2−r, r−1)`; `ker j = {(x,0)} = im i`, `ker k = {(x,0)} = im j`, `ker i = {(0,y)} = im k`, `jk(x,y) = (y,0)`, `(jk)² = 0`, page `2 = 0` | holds |
| 6.2 | Stacks 21.4 (`α = i`, `g = j`, `f = k`); `r = 0`; Bockstein `ℤ` | `Z_{r+1} = k^{−1}(im i^r)`, `B_{r+1} = j(ker i^r)`; `Z_1 = E`, `B_1 = 0`; `ker i = 0 = im k`, `ker j = ℓℤ = im i`, `ker k = E = im j`, `B_r = 0`, `Z_r = E`, `E_∞ = ℤ/ℓ`; `Z_∞ = k^{−1}(⋂ im i^r)` (pullback preserves meets), `B_∞ = j(⋃ ker i^r)` (image preserves joins) | holds (R04 on the third Check) |
| 6.3 | degrees; ×2 tower | `i : H^n(⊥ ≤ q+1) → H^n(⊥ ≤ q+2)` degree `(−1,1)`, `k = δ` to `H^{n+1}(⊥ ≤ q)` degree `(2,−1)`, LES of `⊥ ≤ q ≤ q+1`; `(2,−1) + (r−1)(1,−1) = (r+1, −r)`; `A^p = H^1(⊥ ≤ 2−p) = H^1(F^{p−2})`: `0` (`p ≥ 4`), `ℤ` (`p = 3`), `ℤ/2` (`p ≤ 2`); `k = 0` breaks exactness: `ker k = ℤ ≠ 0 = im j` from `H^0(K) = 0` | holds |
| 7.1 Checks | constant; `×ℓ` on `ℤ`; `ℤ/ℓ` with zero maps | `lim = A`, `lim¹ = 0`; `⋂ ℓ^nℤ = 0`, `lim¹ = ℤ_ℓ/ℤ`; pro-zero: `1 − s` iso, both `0`, Mittag–Leffler with non-surjective maps | hold |
| 7.2 enough projectives ⇒ lim-acyclic epimorphic towers | `x = (x_n) : P → ∏F` | lift `y_{n+1}` with `f_n y_{n+1} = y_n − x_n` along the epi `f_n`; `(1 − s) y = x`; with `P ↠ ∏F` this makes `1 − s` epi; the same lifting gives `P → lim F` over any `P → F_n`, so `lim F → F_n` is epi | holds |
| 7.2 Mittag–Leffler ⇒ `lim¹ = 0` | stable images `G ⊆ F` | `G` epimorphic; `F_m → F_n/G_n` zero for `m ≫ n` so `F/G` pro-zero; `lim¹ G = 0 → lim¹ F → lim¹(F/G) = 0` | holds |
| 7.2 Checks | `ℤ/ℓ^{n+1} ↠ ℤ/ℓ^n`; `×ℓ`; finite groups | `lim = ℤ_ℓ`, `lim¹ = 0`, projections onto; images `ℓ^{m−n}ℤ` never stabilise, `lim¹ = ℤ_ℓ/ℤ`; descending images in a finite group stabilise | hold |
| 7.3 Check | `A^s = ℤ`, `i = ×ℓ` | `Im^r = ℓ^rℤ`, `Q^s = 0`, `RQ^s = ℤ_ℓ/ℤ`; `×ℓ` on `ℤ_ℓ/ℤ` injective (`ℓx ∈ ℤ`, `x ∈ ℤ_ℓ` ⇒ `x ∈ ℤ`) and onto (`ℤ_ℓ = ℓℤ_ℓ + ℤ`); `0 → 0 → ℤ_ℓ/ℤ → ℤ_ℓ/ℤ → 0` | holds |
| 3.5 (iii) (headline) | isos on `F^p/F^{p′}` | exhaustive + exact colimits: `colim_p F^p = H` as a subobject, `colim_p F^p/F^{p′} = H/F^{p′}`, a colimit of isos; complete: `H = lim_{p′} H/F^{p′}`, a limit of isos | holds |
| 3.5 Checks | separation; completeness | `E = 0`, `H^0 = ℤ` constant, `H′ = 0`: weak on both sides, `h = 0` not iso; `ℓ`-adic `ℤ → ℤ_ℓ`: `gr^p = ℤ/ℓ` both sides, `h` not onto | hold |
| 3.4 (headline) | `ℤ/4` vs `ℤ/2 ⊕ ℤ/2` | both strongly convergent, lengths `2`; finite ⇒ exhaustive, separated, complete; finitely many nonzero positions overall ⇒ every position stabilises (2.2, degrees `n ± 1` finite) ⇒ `E_∞ = E_{r′}` | holds |

**Shape and completeness.** 31 targets, each with an API list where it defines something and at
least three Checks (3 everywhere, 4 in 1.4, 3.5, 3.6, 5.1, 6.3, 7.4); every layer ends with
Examples and Dependencies; no LaTeX delimiters, no process words, no pull-request numbers, dates or
machine paths, no line over 100 characters; the only "lemma" is "five-lemma induction".
Hypotheses are in the sentences; every theorem carries a locator (R07 is a label slip, not a
missing locator). Manifest: every cited work recorded; `cited_for` lists agree with the README's
citations (stacks-012K adds 4.5, browning-sawin2020 drops 3.7, as the repair says).

**Headline theorems for the package stage** (from the Summary): the stabilisation theorems of 2.2;
the comparison theorem 3.5; the consequences 3.6; the tower and limit-page identifications 4.1,
4.3; convergence in a range of degrees 4.4 and the quadrant cases 4.5; the filtered-complex
theorems 5.3, 5.4; the exact-couple identification 6.3; Boardman's theorems 7.4; the complete
convergence theorem 7.5. Statable at the pins once the few definitions of Layers 1–3 (towers,
limit page, bidegree assignment, convergence structure) have real bodies on `SpectralSequence`,
`FilteredObject` and `Subobject`: 2.2, 3.5, 3.6, 4.4, 4.5, 5.3, 5.4, and 7.5's strong-convergence
clause (its `W^n` can be written on the tower `H^n(F^s K)` with lim¹ as a cokernel of
`towerDifference`). 6.1–6.3 and 7.4 need the exact-couple carrier of StableHomotopyKTheory §7.22,
which is in a pull request and cannot be imported: the package names them as not statable in its
module docstring rather than keeping a local duplicate of the supplier's structure.

## Not verifiable

- weibel1994 (Definitions 5.2.5, 5.2.11, Theorem 5.2.12, Theorems 5.5.1, 5.5.10, §§3.5, 5.9),
  boardman1999 (3.4(b), 5.10, 7.1, 8.2, 8.10, 8.13), eilenberg-moore1962 §7, mccleary2001,
  massey1952, cartan-eilenberg1956: settled as uncertified in the manifest and cited by locator
  only. Boardman's numbers agree with helle-rognes2024's citations of them (line 13–25, 76, 153,
  163, 166, 169, 185, 201, 226), which is all that could be checked.
- The sign `+2` of the first differential in the Conventions' witness rests on Tau Ceti
  `spectralSequence_first_page_d_eq` identifying it with Mathlib's connecting map; this lane does
  not elaborate, so the identification was read at `Filtered/FirstPage.lean` line 83–101, not run.
- Elaboration, `#check` comparison and the one-tactic probe: not available (design stage, no
  `Suggested.lean`; this lane does not elaborate).

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5a1749e69ce821fff21f4a0cd6514fecd8854970", "job": "REV-DESIGN-SpectralSequencesAndConvergence~2", "model": "fable", "worker": "chris-x9"} -->
