<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7601#issuecomment-6721216987 -->
Review (claude) of 54b8d0b

Verdict: needs_changes

1. **F01** (P3) a 2.1 API bullet depends on Layer 6

   Location: `packages/SpectralSequencesAndConvergence/design/README.md` line 458–459, "A bidegree
   assignment transports along isomorphisms of spectral sequences, and along the page shift of 6.1,
   which changes `e` by the shift."; `design/plan.json` target 2.1, api `transport`.

   Claim: the bullet is provable in Layer 2, whose Dependencies are Layer 1 and Mathlib.

   Witness: the page shift is constructed in 6.1 (README line 1078–1079, "Construct the *page shift*: for
   `E : SpectralSequence C c r₀` and `k : ℤ`, the spectral sequence with page `r` equal to
   `E.page (r + k)`"); plan 2.1 lists no `target:6.1`, and 6.1 lists no `target:2.1`. This is the pattern
   of round 2's F03 (a 3.1 bullet depending on 7.1), now in Layer 2.

   Repair: in 2.1 keep "A bidegree assignment transports along isomorphisms of spectral sequences." and
   move the shift clause to 6.1 as an API bullet: "If `(fil, deg, e)` is a bidegree assignment (2.1) for
   `E`, then `(fil, deg, e − k)` is one for the shift of `E` by `k`." with 6.1's *Needs:* adding 2.1 and
   plan 6.1 adding `target:2.1` and the api entry (plan 2.1's `transport` keeps isomorphisms only).
   Tested on the instance that fixes the sign: the new page `r` carries the old relation of page `r + k`,
   so `fil′ = fil + (r + k) − e = fil + r − (e − k)`; for 6.3's couple (`k = 1`, page `r` of the couple
   is native page `r + 1`) the classical assignment of 2.1 with `e = 1` on native positions becomes
   `e = 0` on the couple's pages, and `d_r` raises fil by `r`, Stacks' bidegree `(r, −r + 1)`
   (stacks-012K line 3012).

2. **F02** (P3) 7.2's cycle-tower bullet omits 1.2 from its `*Needs:*` line

   Location: `packages/SpectralSequencesAndConvergence/design/README.md` line 1239–1240, "Under these
   hypotheses, the cycle tower of a spectral sequence whose first page has objects of finite length is
   Mittag–Leffler. The tower of 7.4 below then has `RE_∞ = 0`."; line 1235–1236, "*Needs:* 7.1; Mathlib
   `EnoughProjectives`, `CountableAB4Star`."; plan 7.2 prerequisites.

   Claim: 7.2's route needs only 7.1 and the two Mathlib classes.

   Witness: the cycle tower `Z_r(pq)` is 1.2's construction; neither the README line nor plan 7.2
   (`['target:7.1', 'mathlib:CategoryTheory.EnoughProjectives', 'mathlib:CategoryTheory.CountableAB4Star']`)
   names 1.2. The second sentence points forward to 7.4, whose third Check already states it ("If every
   first-page object has finite length, the cycle towers are Mittag–Leffler and `RE_∞ = 0` (7.2)"). This
   is the pattern of round 2's F02 (a `*Needs:*` line short of what a bullet uses).

   Repair: "*Needs:* 7.1; 1.2 for the cycle-tower bullet; Mathlib `EnoughProjectives`,
   `CountableAB4Star`.", delete the sentence "The tower of 7.4 below then has `RE_∞ = 0`." (7.4's Check
   keeps it), and add `target:1.2` to plan 7.2. Tested on the Check it governs: in `ModuleCat ℤ` with
   first-page object `ℤ/4` at a position, the descending chain `Z_r` takes at most three values
   (`ℤ/4 ⊋ 2ℤ/4 ⊋ 0`), so it is eventually constant, Mittag–Leffler, and `lim¹_r Z_r = 0`; with `ℤ` at a
   position (not finite length) the chain `ℓ^{r−1}ℤ` of the 1.4 complex never stabilises and its
   `lim¹ = ℤ_ℓ/ℤ ≠ 0`.

Files reviewed: `packages/SpectralSequencesAndConvergence/design/README.md`,
`packages/SpectralSequencesAndConvergence/design/plan.json`,
`packages/SpectralSequencesAndConvergence/sources.toml`. Previous review: round 2 (eight findings, all
P3) and its repair report (eight applied, one applied differently). No `Suggested.lean` exists at the
design stage, so the elaboration, the `#check` comparison, the one-tactic probe and the
headline-absence check are not applicable: not available (this lane does not elaborate; say so in the
report). The two findings below are P3 and nothing is blocking; a repair of any priority asks for
changes, so the verdict is needs changes and a fix round applies them before the port.

## The eight repairs of round 2

| Id | Status | Repaired passage (at most 40 words) and check |
|---|---|---|
| F01 (P3) | repaired | README 714–718: "If `E_2^{p,q} = 0` for `q ∉ {0, 1}` and the sequence converges in degree `n + 1`, then … is exact: only `d_2` is nonzero, `E_∞^{n+1,0}` is its cokernel and `E_∞^{n,1}` its kernel". Plan 3.6 statement says "convergence in degree n+1". Recomputed on the Hopf pages below. |
| F02 (P3) | repaired | README 651–652: "*Needs:* 3.1, 3.2, 2.2; 2.3 for the weak Serre classes and for the page-step identity behind the Euler identity." Plan 3.4 lists `target:2.3`. The repair's pattern pass also added "7.2 for the epimorphic-limit bullet" to 7.3 (line 1260); plan 7.3 lists `target:7.2`. |
| F03 (P3) | repaired (differently) | 3.1 line 573–574: "Complete implies separated: a subobject below every `F^p X` maps to zero in every `X / F^p X`, hence to zero in their limit `X`. The characterisation of completeness through lim¹ is in 7.1." 7.1 line 1186–1199 states both directions with the partial-sum route; *Needs:* 3.1 (line 1201); fourth Check (1215–1220); Conventions 118–120 point to 7.1; 7.5 cites "7.1, completeness through lim¹". The stronger forward direction (countable products only) is verified in the table below. |
| F04 (P3) | repaired | README 1120–1125: "`D = ℤ/ℓ²`, `i = ×ℓ`, `E = ℤ/ℓ ⊕ ℤ/ℓ`, `j(x) = (x mod ℓ, 0)` and `k(a, b) = ℓb`. It is exact: … `Z_2 = k^{−1}(im i) = k^{−1}(ℓℤ/ℓ²) = E`. The wrong model gives `k^{−1}(im i²) = k^{−1}(0) = ℤ/ℓ ⊕ 0 ⊊ E`." Recomputed below. |
| F05 (P3) | repaired | Downstream consumers (line 1383–1393) list SchemeKTheoryOperations, nine étale/crystalline roadmaps and five homotopy roadmaps; no circle-method bullet. Layer 3 Examples keep browning-sawin2020 (line 746–753). |
| F06 (P3) | repaired | References line 1406: "weibel1994: … §§3.5, 5.2, 5.5, 5.9 (uncertified)"; manifest locator agrees. The helle-rognes2024 entry (1400–1403) now lists Lemmas 2.2, 2.6, 3.4, 3.13–3.15 and the cited Definitions, Remarks, (3.1) and Example 8.1; manifest locator agrees. |
| F07 (P3) | repaired | README 337–338: "(stacks-012K line 2612–2624, the construction after Definition 20.1, tag 011N; helle-rognes2024 line 65–70, Lemma 2.2)". stacks-012K 2598 opens Definition 20.1 and 2612–2624 is the tower construction. Plan 1.2 locator agrees. |
| F08 (P3) | repaired | README 186–195 lists `Mathlib/CategoryTheory/Abelian/GrothendieckCategory/Basic.lean` and the three further files. At the pin: `IsGrothendieckAbelian` GrothendieckCategory/Basic.lean 70; `HasCountableProducts` Countable.lean 61, `HasCountableCoproducts` 108; `HasExactColimitsOfShape` HasExactLimitsOfShape.lean 47; `EnoughProjectives` Projective/Basic.lean 77; `CountableAB4Star` GrothendieckAxioms/Basic.lean 126, `AB5` 152. |

No finding of round 2 was marked not actionable.

## Verified sound

**Principles.** No route-specific shortcut (every theorem is stated over an arbitrary abelian category
with its exactness hypotheses named at the target). No re-planning: DGFloer Layer 1 item 3,
AlgebraicTopology Stage 6 item 0, DerivedModuleAlgebra §S.1 and StableHomotopyKTheory §7.26 appear
as instances or Checks, each with the clause saying how the abelian-category statement differs. No
computational algorithm, no copied passage (the convergence dictionary of the Conventions is in the
roadmap's words), no `set_option`, no sorry'd data (no Lean at this stage). Gate output, verbatim:

    candidate: SpectralSequencesAndConvergence is not in the merge order yet; checked as if placed after StableHomotopyKTheory (the intake inserts it when its design is accepted)
    depcheck: 237 roadmaps, 2343 edges, 0 problem(s)

No UPWARD or CYCLE line. Declared gaps: none (`plan.json` `gaps = []`). `roadmaps resolve` leads:
`DoubleComplex.eInftyIsoGr`, `DoubleComplex.page_eq_eInfty`, `DoubleComplex.fiveTerm_exact` (README
276–277) are DerivedModuleAlgebra's planned names, present on main in
`TauCetiRoadmap/DerivedModuleAlgebra/README.md` §S.1 (line 2316 onward) and its `Suggested.lean`
line 1328–1331, and the README cites them as that roadmap's targets, not as pinned declarations.

**Plan.** `plan.json` parses: 7 layers, 31 targets, 99 tests (3 to 4 per target), every target with a
locator, a hypotheses list and prerequisites. Every README `*Needs:*` line was compared with its
target's `target:` prerequisites: all 31 agree (the only gap is the bullet of R02, missing from both).
No forward `target:` prerequisite in the plan; the only forward reference in the README is R01's.

**Suppliers resolved this round.** StableHomotopyKTheory at its open head: §7.22 (line 2616–2635:
bigraded exact couple of degrees `a, b, c`, derived couple `D′ = image i`, `E′ = H(E, jk)` of degrees
`a, b − a, c`, `d_r` of degree `c + b − (r − 1)a`, the tuple couple with `i² = i`, the homological
degrees `(−r, r − 1)`), §7.21 (2594), §7.23–7.25 (2639–2669), §7.26 (2681, Boardman for towers of
spectra with the same two Checks as 7.4's first two). On main: DGFloer Layer 1 item 3 (README line
621, "The spectral sequence of a filtered complex", Weibel's classical convergence at 635 and complete
convergence at 649) and item 2 (the Serre spectral sequence, line 140–142); AlgebraicTopology Stage 6
item 0 (line 952 onward: `δ(x)_n = x_n − f_n(x_{n+1})`, `lim¹ = coker δ`, six-term sequence,
Mittag–Leffler vanishing, Milnor sequences); DerivedModuleAlgebra §S.1 (above); SchemeAndStackFoundations
§2.2 (line 3309, Leray and Čech); ComplexKahlerGeometry K8 (line 1535, Frölicher); HeegaardFloer
(its filtered complexes, line 1028–1133); MorseTheory (line 885, consuming DGFloer Layer 1 item 3).
SchemeKTheoryOperations is an open roadmap in the merge order (line 34), named only as an instance
and a consumer. No supplier is later in the merge order; StableHomotopyKTheory is at line 13.

**Ownership against open pull requests** (by object, on main and the 469 indexed heads, via
`roadmaps grep`): "limit page", "infinite cycles", `Z_∞`: hits are adelic or Shimura-variety uses of
the symbol, none a spectral-sequence limit page; "conditional(ly) convergence", "whole-plane": the only
spectral-sequence hits are StableHomotopyKTheory §7.26 (line 2682–2688, the instance this roadmap
cites) and its reference list; "bidegree assignment", "lim¹ in an abelian category",
`FilteredObject`: no hit. The overlaps file lists no pull request changing this roadmap, no dropped id
and no revision-only id; the closest roadmaps (DerivedModuleAlgebra, StableHomotopyKTheory,
AlgebraicTopology, DGFloer) are cited as instances or suppliers with the clause distinguishing their
scope. No second owner.

**Library names at the pins** (opened this round, file and line). Mathlib: `IsFirstQuadrant`
(`HasSpectralSequence.lean` 394: `isZero₁` for `j ≤ 0`, `isZero₂` for `n < i`), `IsThirdQuadrant` (437:
`isZero₁` for `0 < i`, `isZero₂` for `j ≤ n`), `isZero₁_of_isFirstQuadrant` 402,
`isZero₂_of_isFirstQuadrant` 406 (the names 4.5's Check uses), `coreE₂Cohomological` (143: `deg = p+q`,
`i₀ = q − r + 2`, `i₁ = q`, `i₂ = q + 1`, `i₃ = q + r − 1`), `coreE₂CohomologicalNat` (174, the same
formulas with casts), `coreE₂CohomologicalFin` (214), `coreE₂HomologicalNat` (256: `deg = −p − q`,
`i₁ = −q`, shape `spectralSequenceNat (−r, r − 1)`); `spectralSequenceNat` (`ComplexShape.lean` 36,
`Rel a b ↔ a.1 + u.1 = b.1 ∧ a.2 + u.2 = b.2` in `ℤ`, so no natural-number subtraction);
`SpectralSequence.Hom` (`SpectralSequence/Basic.lean` 51), `pageXIsoOfEq` 60, `pageFunctor` 90,
`pageHomologyNatIso` 99, `CohomologicalSpectralSequence` 109, `E₂CohomologicalSpectralSequence` 114,
the `Nat` and `Fin` abbreviations 118, 128; `EulerCharSigns` (`EulerCharacteristic.lean` 56) with
instances only for `up ℤ`, `down ℤ`, `up ℕ`, `down ℕ` (74–89), so 2.3's instance for `up' (r, 1 − r)` is
new; `eulerChar` (119, `∑ᶠ χ · finrank` over `[Ring R]`, so the field case of 2.3 is covered);
`Filtration X I` as `I ⥤ MonoOver X` (`Filtration/Basic.lean` 44, so `ℤᵒᵖ` gives a decreasing family),
`FilteredObject` 73, `Hom` 90, `IsStrictHom` 145; no exhaustive, separated or complete predicate exists
in that directory; `E` (`SpectralObject/Page.lean` 65), `cycles`, `opcycles` (`Cycles.lean` 59, 63),
`spectralSequencePageXIso` (`SpectralSequence.lean` 488), `spectralSequenceFirstPageXIso`
(`FirstPage.lean` 78: page `r₀` at `pq` ≅ `H^{deg}(i₁ ≤ i₂)`, as 4.1 uses it);
`Triangulated.SpectralObject` (`Triangulated/SpectralObject.lean` 44), `mapHomologicalFunctor` 245,
`spectralObjectMappingCone` (`HomotopyCategory/SpectralObject.lean` 46); `EInt` (`WithBotTop.lean` 81);
`HasFiniteBiproducts` (`Biproducts.lean` 370); `IsSerreClass` (`SerreClass/Basic.lean` 45);
`Subobject.ofLE` 292, `pullback` 572, `«exists»` 736 (`Subobject/Basic.lean`); `imageSubobject`,
`kernelSubobject` (`Subobject/Limits.lean`); `isoHomologyι` 583, `isoHomologyπ` 630
(`ShortComplex/HomologicalComplex.lean`); the F08 files above. Tau Ceti: every name of the "From Tau
Ceti" section found by grep of its file (`abutment`, `abutmentFiltration`, `EInftyIsoCokernel` 92 and
`EInfty` in `SpectralObject/Abutment.lean`; `isIso_hom_app_abutment_of_isIso_page` in
`SpectralObject/Comparison.lean`, read in full: vanishing of `H^m(⊥ ≤ i)` for `i ≤ a`, `m ∈ {n, n+1}`,
and of `H^m(i ≤ ⊤)` for `i ≥ b`, `m ∈ {n−1, n}`, on `X` and `Y`, iso on every object of a page `r ≥ 2`,
exactly as 4.6's bullet compares; `towerDifference` (`TowerDifference.lean` 77, `π_n − π_{n+1} ≫ F.map`),
`towerDifference_naturality`, `isLimitConeOfTowerDifference`, `IsProZero.isIso_towerDifference`;
`filtrationFunctor` (`Filtered/SpectralObject.lean` 304, from a monotone `ℤ → Subobject K`);
`spectralSequence_first_page_d_eq` (`Filtered/FirstPage.lean` 89, docstring 18–26 with McCleary's
`s = −q − 1`, `t = p + 2q + 1`, agreeing with the Conventions and 5.1);
`sum_negOnePow_X_eq_sum_negOnePow_homology` (`GrothendieckGroup/EulerCharacteristic.lean` 165:
`hzero`, degreewise `hrel`, `IsStrictlyGE a`, `IsStrictlyLE b`, as 2.3's regrouped route supplies);
`ModuleTower.lim` (`Tower/Basic.lean` 170), `limOne`, `IsMittagLeffler`,
`subsingleton_limOne_of_isMittagLeffler`; `rowFiltrationSpectralSequence` and its `PageXIsoEInfty`
(`Bicomplex.lean`); `AdditiveInvariant`; and the remaining filtered-complex names in
`Filtered/Convergence.lean`, `Exhaustive.lean`, `Comparison.lean`, `Stabilization.lean`,
`Naturality.lean`, `SpectralObject/Map.lean`, `SpectralSequenceMap.lean`).

**Sources: the seeded sample**, read at the locators in the cached texts (no author-flagged
unverified locator exists).
2.1: stacks-012K 2981–2992 (bigrading `E_0^{p,q} = gr^p K^{p+q}`, `p + q` total, `p` filtration, `q`
complementary degree) and 3010–3014 (Lemma 24.2, tag 012M, `d_r` of bidegree `(r, −r + 1)`).
2.3: 1158–1161 (weak Serre subcategory, Definition 10.1 (2)), 3175–3197 (Lemma 24.12, tag 0BDW, for
filtered complexes with finite filtrations; its even–odd page step at 3185–3191; the README's
"3185–3195" covers the step and the finiteness remark).
3.1: 2349–2368 (Definition 19.1, tag 0121: decreasing filtration, finite, `⋂` and `⋃` existing,
separated, exhaustive); helle-rognes2024 81–84 (Definition 2.5: Hausdorff `F^{−∞}G = 0`, complete
`RF^{−∞}G = 0`, exhaustive).
3.2: 3131–3143 (Definition 24.9, tag 012U: weakly converges, abuts, converges with regularity and
`H^n = lim H^n/F^p H^n`); helle-rognes2024 94–98 (Definition 2.7, exhaustive inside "weakly",
Hausdorff for "converges", complete for "strongly"); weibel1994 5.2.11 uncertified.
3.3: 3055–3061 (Lemma 24.4, tag 012O, morphism of filtered complexes gives a morphism of spectral
sequences compatible with bigradings).
3.4: 3152–3174 (Lemma 24.11 (2)–(4), tag 012W: finite filtration on `H^n`, convergence, weak Serre
class), 3175–3197 (Lemma 24.12).
3.6: weibel1994 §5.2 exercises and mccleary2001 Ch. 2, both uncertified; the mathematics is checked in
the table.
4.1: helle-rognes2024 291–298 (Definition 4.5: `Z_r^s = Ker(∂ : E_1^s → H(s−r, s−1))`,
`B_r^s = Im(∂ : H(s, s+r−1) → E_1^s)`), 299–303 (Remark 4.6, the image and kernel forms), 334–335
(Remark 4.10, agreement with Lemma 2.2's towers). With `s = q + 1` and Helle–Rognes page `r` = native
page `r + 1` these are 4.1's two formulas.
4.2: helle-rognes2024 145–152 (Definition 3.6, `F^s A^∞ = Im(ι_s)`, `F^s A^{−∞} = Ker(π_s)`).
4.5: 3202–3240 (Lemma 24.13, tag 0BK5, hypotheses `p₀(n)`, `p₁(n)` for every `n`; the proof uses
`p₀(n), p₀(n+1), p₁(n−1), p₁(n)`), applied through 4.4.
4.6: weibel1994 5.2.12 uncertified; Tau Ceti `isIso_hom_app_abutment_of_isIso_page` read as above.
5.1: 3038–3054 (Lemma 24.3, tag 012N: (1) `d_1` is the boundary map of
`0 → gr^{p+1} → F^p/F^{p+2} → gr^p → 0`; (2) `d(F^p) ⊂ F^{p+1}` gives `E_1^{p,q} = gr^p K^{p+q}`),
3055–3061 (Lemma 24.4).
5.3: 3202–3240 (Lemma 24.13), 3152–3168 (Lemma 24.11 (1)–(3)).
5.4: weibel1994 5.5.1 uncertified; stacks-012K 3202–3210 (the statement of Lemma 24.13).
7.1: weibel1994 §3.5 uncertified; helle-rognes2024 71–84 (Definitions 2.3, 2.5, Remark 2.4, `Rlim`),
85–93 (Lemma 2.6 and its proof, `F_jG ≅ lim_i F_jG/F_iG` at line 92).
Also read for the repairs and findings: stacks-012K 2598–2624 (Definition 20.1 and the towers),
2625–2637 (Definition 20.2, degeneration), 2653, 2687 (tags 011Q, 011T), 2834–2838 (§23, tag 012A,
Definition 23.1 012B), 3062–3071 (Definition 24.5, tag 012P), 3072 (Lemma 24.6, tag 012Q), 3107–3130
(Definition 24.7, tag 0BDU; Lemma 24.8, tag 0BDV), 3144–3151 (Lemma 24.10, tag 012V), 3715–3735
(Definition 31.2, tag 02N0; Lemma 31.3, tag 02N1; Neeman at 3720–3724); helle-rognes2024 13–25
(Boardman's half-plane results and `W`), 65–70 (Lemma 2.2), 104–114 (Definition 3.1), 136–144
(Definition 3.3, Lemma 3.4, Remark 3.5), 153–178 (Definition 3.7, Theorems 3.9, 3.10, Definition 3.11),
185–214 (Lemmas 3.13–3.15), 226–228 (the sequence (3.1) citing Boardman 3.4(b)). Every tag the
README and manifest name was found at its lemma. The manifest `cited_for` lists agree with the
README's citations section by section.

**Adversarial table** (the sampled targets, the repaired passages, the headline theorems and the two
findings' targets; rows marked † carry over the computed values of round 2 for text no repair
touched).

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 presentation (not in round 2's table) | `A = ℤ`, `B = 4ℤ`, `Z = ℤ`, `X = ℤ/4`; `X = 0`; `ℤ/2` inside `ℤ/4` | preimages of `0 ≤ 2ℤ/4ℤ ≤ ℤ/4` are `4ℤ ≤ 2ℤ ≤ ℤ`; `(B′, Z′) = (4ℤ, 2ℤ)` presents `2ℤ/4ℤ = ℤ/2`; third isomorphism theorem `Z′/B′ = (Z′/B)/(B′/B) = K/I`; `X = 0` forces `B = Z`; `(0, 2ℤ/4)` and `(2ℤ/4, ℤ/4)` both present `ℤ/2` | holds |
| 2.1 cohomological assignment | `(p, q) → (p + r, q + 1 − r)` | `fil′ = p + r = fil + r`, `e = 0`; `deg′ = p + q + 1` | holds |
| 2.1 homological `ℕ × ℕ` | `spectralSequenceNat (−r, r − 1)`: `(p, q) → (p − r, q + r − 1)` in `ℤ` | `fil′ = −(p − r) = fil + r`, `e = 0`; `deg′ = −p − q + 1` | holds |
| 2.1 classical on native positions | `(p, q) ↦ (−q − 1, p + q)` | `fil′ = −(q + 1 − r) − 1 = fil + r − 1`, `e = 1`; `deg′ = deg + 1`; injective (`q` from fil, `p` from deg) | holds |
| 2.1 wrong models (Check) | `(p, q) ↦ (q, p + q)`; `(p, q) ↦ (p, p)` | fil changes by `1 − r`, equal to `r − e` only for `e = 2r − 1`, not fixed; `(0, 1)` and `(0, 2)` collide | refuted as the Check says |
| 2.1 page shift (R01) | shift by `k`; 6.3's `k = 1` with the classical assignment | new page `r` has the old relation of page `r + k`: `fil′ = fil + r − (e − k)`; `e = 1 ↦ 0`, `d_r` raises fil by `r` as Stacks' `(r, −r + 1)` | holds; the clause belongs to 6.1 |
| 2.3 page step | `E_2^{0,1} = ℤ/4`, `E_2^{2,0} = ℤ/2`, `d_2` onto, `v` = length | `v(E_r) = v(H) + v(im d_out) + v(im d_in)`, the two images of one differential carry opposite signs `(−1)^{deg}`, `(−1)^{deg+1}`; page 2: `−2 + 1 = −1`; page 3: `E_3^{0,1} = ℤ/2`, `E_3^{2,0} = 0`, `−1 + 0 = −1` | holds |
| 2.3 regrouped complex | the same pages | `T^1 = ℤ/4`, `T^2 = ℤ/2`, `d = d_2`; `H^1 = ℤ/2`, `H^2 = 0`; `d ∘ d` at `(pq, pq″)` is the single term `d_r d_r = 0`; kernel and image split by position, so `H^n(T) = ⊕_{deg = n} E_{r+1}` | holds |
| 2.3 Mathlib bullet | `C = ModuleCat k`, finite-dimensional pages | `eulerChar = ∑ᶠ χ · finrank` (`EulerCharacteristic.lean` 119); support finite under the hypothesis; `χ(p, q) = (−1)^{p+q}` flips along `up' (r, 1 − r)` since `p + r + q + 1 − r = p + q + 1`; no `up'` instance at the pin | holds |
| 2.3 Serre hypothesis (Check) | `0 → k → k^{(ℕ)} → k^{(ℕ)} → 0` | finrank `0 ≠ 1 + 0` | holds |
| 3.1 predicates | `ℓ`-adic `ℤ`; `ℓ`-adic `ℤ_ℓ`; constant; zero; `ℤ/4` vs `ℤ/2 ⊕ ℤ/2` | `ℤ`: `⋃ = ℤ`, `⋂ ℓ^pℤ = 0`, `lim ℤ/ℓ^p = ℤ_ℓ ≠ ℤ`; `ℤ_ℓ`: limit `ℤ_ℓ`; constant: join `X`, meet `X ≠ 0`; zero: meet `0`, join `0 ≠ X`; `gr^0 = gr^1 = ℤ/2` on both, not isomorphic | hold |
| 3.1 finite ⇒ complete; five-lemma induction | `F^a = X`, `F^b = 0`; `f` iso on all `gr^p` | tower `X/F^p` constant `X` for `p ≥ b`, limit `X`; induction down from `b″ = max(b, b′)` on `0 → F^{p+1} → F^p → gr^p → 0` gives iso on every `F^p`, then on `X = F^{a″}` | holds |
| 3.1 complete ⇒ separated | kernel of `X → ∏ X/F^n` | a subobject maps to `0` in `∏` iff into each factor iff below each `F^n`; kernel = meet; `X → lim` iso ⇒ kernel `0` | holds |
| 3.2 Checks | `d_1 = ×2`; `ℓ`-adic `ℤ` in degree `0`; zero + constant | `E_2^{0,0} = 0`, `E_2^{1,0} = ℤ/2 = gr^1 H^1`, `gr^0 H^1 = 0 = E^{0,1}`, finite ⇒ strong; `E_1^{p,−p} = ℓ^pℤ/ℓ^{p+1}ℤ = ℤ/ℓ` (`p ≥ 0`), `0` for `p < 0`, exhaustive, separated, not complete; `gr = 0 = E_∞`, weak in `{0}`, not separated | hold |
| 3.2 "`gr^s H^n = 0` off the image" | `ℕ × ℕ`, `(p, q) ↦ (p, p + q)`; classical assignment | degree `n` image `0 ≤ s ≤ n`, matching 4.5's `F^0 = H^n`, `F^{n+1} = 0`; classical: every `(s, n)` is `(p, p + q)` with `p = s`, no constraint | consistent |
| 3.3 Checks | identity; `(−1, id)`; `(0, 0)` to zero | `−1` commutes with `d` and the homology isos, so a `Hom`; `β′ ∘ (−1) = −β ≠ β = gr^0(id) ∘ β` on `ℤ`; zero target makes both sides `0` | hold |
| 3.4 finite ⇒ strong; Serre | `ℤ/4` vs `ℤ/2 ⊕ ℤ/2`; `E_∞` all zero | finite ⇒ exhaustive, separated, complete; `gr^p = 0` all `p` with `F^a = H^n`, `F^b = 0` ⇒ `H^n = 0`; lengths `2 = 1 + 1` in both cases; `E_∞ ≅ E_r` in `P` when the limit is reached on page `r` (a subquotient of `E_r` alone need not be in a weak Serre class) | holds |
| 3.4 Euler bullet (F02) | finitely many nonzero positions on page `r`, all stabilising by page `r′` (2.2) | 2.3 page steps `r → r′`: `Σ (−1)^{deg} v(E_r) = Σ (−1)^{deg} v(E_{r′})`; `E_{r′} = E_∞` at nonzero positions; `v(H^n) = Σ_p v(gr^p) = Σ_{deg = n} v(E_∞)`; `ℤ/4` instance: `(−1)^n · 2` on both sides | holds |
| 3.6 vanishing | `E_r^{p,n−p} = 0` all `p` | `E_∞ = 0` (vanishing persists), `gr^p = 0`, `F^p` constant; exhaustive ⇒ `F^p = H^n`, separated ⇒ `F^p = 0` | holds (needs convergence, as stated) |
| 3.6 dimension count | `×2 ⊗ ℚ`, `n = 1`; equality case | page-2 sum `1`, `dim H^1 = 0`, strict since `d_2 ≠ 0`; `dim E_∞ = dim E_r` iff `B_r = B_∞`, `Z_∞ = Z_r` iff every later `d` at the position is zero (1.2) | holds |
| 3.6 two columns | `p ∈ {0, 1}` | `d_r` moves `p` by `r ≥ 2`: zero; `F^2 = F^3 = ⋯`, meet ⇒ `F^2 = 0`; `F^0 = F^{−1} = ⋯`, join ⇒ `F^0 = H^n`; `0 → E_2^{1,n−1} → H^n → E_2^{0,n} → 0` | holds |
| 3.6 two rows (F01) | `q ∈ {0, 1}`; Hopf pages `n + 1 = 0, 1, 2, 3` | from `q = 1`: `q′ = 2 − r ∈ {0, 1}` iff `r = 2`; from `q = 0`: `1 − r < 0`; `E_∞^{n+1,0} = coker d_2`, `E_∞^{n,1} = ker d_2`, `F^{n+2} = 0`, `F^n = H^{n+1}` from degree `n + 1` alone; Hopf: `H^0 = ℤ`, `H^1 = ker(≅) = 0`, `H^2 = coker(≅) = 0`, `H^3 = ℤ` | holds; degree `n` unused |
| 3.6 first quadrant edges and five-term | `(n, 0)`, `(0, n)`; degrees `1, 2` | into `(n, 0)` from `(n − r, r − 1)` possible, out of it impossible (`q < 0`): `E_∞^{n,0}` a quotient; `F^{n+1} H^n = 0` by separation since `gr^p = 0` for `p > n`; into `(0, n)` impossible: `E_∞^{0,n} ⊆ E_2^{0,n}`; `F^0 = H^n` by exhaustiveness; `E_∞^{1,0} = E_2^{1,0}`, `E_∞^{0,1} = ker d_2`, `E_∞^{2,0} = coker d_2 = F^2 H^2 ↪ H^2` (separation in degree `2`) | holds |
| 3.6 general `m ≥ 1` | `E_2^{p,q} = 0` for `0 < q < m`; `m = 0` Check | `j < m`: only `(j, 0)` in degree `j`, entering from `(j − r, r − 1)` with `1 ≤ r − 1 ≤ j − 1 < m` zero, so `E_2^{j,0} = H^j`; degree `m`: `(m, 0)`, `(0, m)`, `d_{m+1} : (0, m) → (m + 1, 0)` the only differential; `m = 0`: `0 → ℤ →id ℤ →id ℤ → 0 → 0` not exact at `H^0` | holds |
| 4.1 formulas at `r = 2`; monotonicity | `i₀ = q`, `i₃ = q + 1`; `r′ ≥ r` | `H(q ≤ q) = 0` gives `Z_2 = ⊤`, `B_2 = ⊥`; `δ_{i₀} = H^{n+1}((i₀′ ≤ q) → (i₀ ≤ q)) ∘ δ_{i₀′}` for `i₀′ ≤ i₀`, so `Z_{r′} ≤ Z_r`; dually `B_r ≤ B_{r′}` | holds |
| 4.1 `×2` Check | native `(1, −1)`, `r = 3` | `G_{−1} = F^1 = (0 → ℤ)`, `G_0 = K`, `G_{−2} = 0`; `H^0(−1 ≤ 0) = H^0(ℤ → 0) = ℤ`, `H^1(−2 ≤ −1) = H^1(0 → ℤ) = ℤ`; connecting map of `0 → (0 → ℤ) → K → (ℤ → 0) → 0` is `x ↦ 2x`; `Z_3 = 0` | holds |
| 4.1 Helle–Rognes dictionary | `s = q + 1`, HR page `r` = native `r + 1` | HR `Ker(E_1^s → H(s − r, s − 1)) = Ker(H(q ≤ q + 1) → H(q + 1 − r, q))`, native `i₀ = q − (r + 1) + 2 = q + 1 − r`; HR `Im(H(s, s + r − 1))` = `Im(H(q + 1, q + r))`, native `i₃ = q + (r + 1) − 1 = q + r` | agree |
| 4.2 filtration | `×2`, `n = 1`; `IsFirstQuadrant` | `F^3 H^1 = abutmentFiltration (−1) 1 = im(H^1(0 → ℤ) = ℤ → ℤ/2) = ℤ/2 = H^1`; `F^4 = abutmentFiltration (−2) 1 = 0`; `gr^3 = ℤ/2` at native `(3, −2)`; `F^0 H^n = abutmentFiltration (n + 1) n = H^n` since `H^n(n + 1 ≤ ⊤) = 0` (`isZero₂`, `n < n + 1`); `F^{n+1} H^n = abutmentFiltration 0 n = 0` (`isZero₁`, `j = 0`) | holds |
| 4.2 graded piece | `gr^p = F^p/F^{p+1}` | `F^{p+1} = abutmentFiltration (n − p) n → F^p = abutmentFiltration (n − p + 1) n`, cokernel `EInfty (n − p) n` (Tau Ceti `EInftyIsoCokernel`, the step `q → q + 1` with `q = n − p`) | holds |
| 4.5 first quadrant | `a = min(0, n + 1)`, `b = n + 1` | `isZero₁` (`j ≤ 0`): `H^n(⊥ ≤ i) = H^{n+1}(⊥ ≤ i) = 0` for `i ≤ a ≤ 0`; `isZero₂`: `H^{n−1}(j ≤ ⊤) = 0` for `j ≥ n`, `H^n(j ≤ ⊤) = 0` for `j ≥ n + 1`, so `H^n(⊥ ≤ j) → H^n(⊥ ≤ ⊤)` iso for `j ≥ b`; `a ≤ b`; `n < 0`: `a = b = n + 1`, `F^0 = H^n = 0` | holds |
| 4.5 third quadrant | `a = min(m, 1)`, `b = 1`; `m = −2`; `m ≥ 1` | `isZero₂` (`j ≤ m`): `H^m(⊥ ≤ i) = 0` for `i ≤ m`, `H^{m+1}(⊥ ≤ i) = 0` for `i ≤ m + 1`, so for `i ≤ a`; `isZero₁` (`0 < i`): `H^{m−1}(j ≤ ⊤) = H^m(j ≤ ⊤) = 0` for `j ≥ 1`; `m ≤ 0`: `F^s = H^m` for `s ≤ m`, `F^s = 0` for `s ≥ 1`, so `gr^s ≠ 0` only for `m ≤ s ≤ 0`, i.e. `(p, q) = (−s, s − m)` with `0 ≤ p ≤ −m`; `m = −2`: `(p, 2 − p)`, `0 ≤ p ≤ 2`; `m ≥ 1`: `H^m(⊥ ≤ 1) = 0 = H^m(1 ≤ ⊤)` ⇒ `H^m = 0` | holds |
| 4.5 `EInfty (−q) m` at `(p, q)` | `s = −p`, `m = −p − q` | `gr^s H^m = EInfty (m − s) m = EInfty (−q) m` | holds |
| 4.6 vs Tau Ceti | `Comparison.lean` theorem read | Tau Ceti: `H^m(⊥ ≤ i) = 0`, `m ∈ {n, n+1}`, `i ≤ a`; `H^m(i ≤ ⊤) = 0`, `m ∈ {n−1, n}`, `i ≥ b`; iso on every object of page `r ≥ 2`. 4.4: the same at `⊥`; at `⊤` only the iso in degree `n`, which the two vanishings imply via `H^{n−1}(j ≤ ⊤) → H^n(⊥ ≤ j) → H^n(⊥ ≤ ⊤) → H^n(j ≤ ⊤)` | holds; weaker as claimed |
| 4.6 Checks | identity; zero morphism to `0` | identity components give the identity of 3.3; zero target: `E′ = 0`, `H′ = 0`, compatibility `0 = 0` | hold |
| 5.1 dictionary | `(a, b) ↦ (−b − 1, a + b)`, `e = 1` | classical `(p, q)` at `(2p + q + 1, −p − 1)`: fil `= p`, deg `= p + q`; `E_1^{p,q}` = page `2` at `q′ = −p − 1`: `H^{p+q}(G_{−p}/G_{−p−1}) = H^{p+q}(F^p/F^{p+1})`; Tau Ceti's `s = −q′ − 1 = p`, `t = (2p + q + 1) + 2(−p − 1) + 1 = q`; page-2 shape `(2, −1)` = `(r, 1 − r)` | holds |
| 5.1 `d_1` | Tau Ceti `F_q/F_{q−1} → F_{q+1}/F_{q−1} → F_{q+1}/F_q` at `q = −p − 1` | `G_{−p−1}/G_{−p−2} = gr^{p+1}`, `G_{−p}/G_{−p−2} = F^p/F^{p+2}`, `G_{−p}/G_{−p−1} = gr^p`: Stacks Lemma 24.3 (1) | holds |
| 5.1 Checks | stupid filtration of `×2`; trivial filtration; `G_t := F^t` | `gr^0 = (ℤ → 0)`, `gr^1 = (0 → ℤ)`, `E_1^{0,0} = E_1^{1,0} = ℤ`, `d_1 = +2`, `E_2 = (0, ℤ/2)`; `E_1^{0,q} = H^q(K)`, `d_1 : E_1^{0,q} → E_1^{1,q} = 0`; antitone `F^t` is not monotone unless constant | hold |
| 5.3 ↔ 4.4 | `G_t = F^{−t}` | `H^m(⊥ ≤ i) = H^m(F^{−i}K) = 0` for `i ≤ −p₀ =: a`, `m ∈ {n, n+1}`; iso for `j ≥ −p₁ =: b`; `a ≤ b` iff `p₁ ≤ p₀`; 4.4's `F^{p′} = H^n` for `p′ ≤ n + 1 − b`, `0` for `p′ ≥ n + 1 − a`, with `p′ = p + n + 1` (5.2): `F^{p₁} H^n = H^n`, `F^{p₀} H^n = 0` | holds |
| 5.3 degreewise finite | finite on `K^{n−1}, K^n, K^{n+1}` | `H^{n+1}(F^sK) = 0` once `F^sK^{n+1} = 0`; `H^n(F^sK) = 0` once `F^sK^n = 0`; iso once `F^s = K` on `K^{n−1}, K^n, K^{n+1}`; `E_1^{p,n−p} = H^n(gr^p K) = 0` when `gr^p K^n = 0`: bounded in degree `n` | holds |
| 5.3 Checks | stupid `×2`; zero outside `0, 1`; 1.4 complex | finite in every degree, strong (3.2); finiteness on `0` trivial; `H^1(F^sK) = ℓ^{s−1}ℤ/0 ≠ 0` for `s ≥ 1` (`F^sK^0 = 0`), hypothesis in degree `n + 1 = 1` fails, `Z_r(0,0) = ℓ^{r−1}ℤ` never constant | hold |
| 5.4 hypotheses | exhaustive on `K^{n−1}, K^n`; bounded below on `K^n, K^{n+1}` | cycle side: `i = min(q, −p₀)`, `H^{n+1}(F^{−i}K) = 0` since `F^{−i}K^{n+1} = 0` ⇒ `Z_r = Zᵗ` for `r ≥ q − i + 2`, regular; `F^pH^n = 0` for `p ≥ p₀` since `Z^n(F^pK) ⊆ F^pK^n = 0`; exhaustive on `K^n`: `⋃_p (F^pK^n ∩ Z^n) = Z^n` under exact sequential colimits ⇒ images join to `H^n` | holds |
| 5.4 continuity | `colim_j G_j/G_{q+1} → K/G_{q+1}` | iso in degree `n − 1`, mono in degree `n` (colimit of monos) ⇒ cycles in degree `n − 1` agree, boundaries of the colimit contained in those of `K/G_{q+1}` ⇒ `H^{n−1}` epi; exact colimits commute with cohomology ⇒ `colim H^{n−1}(q + 1 ≤ j) ↠ H^{n−1}(q + 1 ≤ ⊤)`, 4.3's hypothesis | holds |
| 5.4 Checks | non-exhaustive complex, `n = 0`; `ℓ`-adic `ℤ` | `gr^0 K = (0 → ℤ)`, `E_1^{0,0} = E_∞^{0,0} = ℤ`, `H^0(K) = coker(id) = 0`, weak convergence fails; `ℓ`-adic: exhaustive, `F^pK^0 = ℓ^pℤ ≠ 0` for all `p`, converges but `ℤ` not complete | hold |
| 4.3 boundary side (used by 4.4, 5.3, 5.4) | `j ≥ q + 1`, `H^n(⊥ ≤ j) → H^n(⊥ ≤ ⊤)` mono | LES of `⊥ ≤ j ≤ ⊤`: `δ = 0` so `H^{n−1}(⊥ ≤ ⊤) ↠ H^{n−1}(j ≤ ⊤)`; for `x ∈ H^{n−1}(q + 1 ≤ ⊤)` lift its image to `z`, `z′` its image in `H^{n−1}(q + 1 ≤ ⊤)`; triples `(q ≤ q ≤ ⊤) → (q ≤ q + 1 ≤ ⊤)` with `H^n(q ≤ q) = 0` give `δ_⊤(z′) = 0`; `x − z′ = ι_j(w)`, `δ_⊤(x) = δ_j(w)`: `Bᵗ ⊆ B_{j−q+1}` | holds |
| 7.1 complete ⇒ `lim¹ = 0` (F03, forward direction) | `σ_n = Σ_{k<n} π_k` followed by `F^k X → X` | `((1 − s)σ)_n = σ_n − σ_{n+1} = −ι_nπ_n` with Tau Ceti's `π_n − π_{n+1} ≫ F.map` on the constant tower; `q_nσ_n − t_n q_{n+1}σ_{n+1} = −q_nι_nπ_n = 0`, so `q ∘ σ` is a cone, lifts to `c`; `q_n(c − σ_n) = 0` ⇒ `Δc − σ = ι τ`; `(1 − s)(Δc − σ) = 0 + ι` and `(1 − s)ιτ = ι(1 − s)τ` (naturality) with `ι` mono ⇒ `(1 − s)τ = 1` | holds with countable products only |
| 7.1 converse (F03) | six-term sequence of `0 → F^n X → X → X/F^n X → 0` | `0 → lim F^n → X → lim X/F^n → lim¹ F^n → lim¹ X = 0` (`CountableAB4Star`; `(1 − s)Δ` split by partial sums); separated: `lim F^n = 0`; `lim¹ F^n = 0` ⇒ `X → lim X/F^n` iso | holds |
| 7.1 Checks (F03) | `ℓ`-adic `ℤ`; `ℤ_ℓ`; constant `X ≠ 0` | tower `ℓ^nℤ` ≅ tower `×ℓ` on `ℤ` (divide by `ℓ^n`): `lim¹ = ℤ_ℓ/ℤ ≠ 0`, not complete, both sides false; `ℤ_ℓ`: `0 → 0 → ℤ_ℓ →≅ lim ℤ_ℓ/ℓ^n → lim¹ → 0` ⇒ `lim¹ = 0`; constant: identity tower `lim¹ = 0`, meet `X ≠ 0`, `lim X/F^p = 0 ≠ X` | hold |
| 7.1 Checks | constant tower; `×ℓ`; `ℤ/ℓ` with zero maps | `x_n = −Σ_{k<n} y_k` solves `(1 − s)x = y`, `lim¹ = 0`, `lim = A`; `⋂ ℓ^nℤ = 0`, `lim¹ = ℤ_ℓ/ℤ` from `0 → ℤ → ℤ_ℓ → lim¹ → 0`; pro-zero: `1 − s` iso, `lim = lim¹ = 0`, images stabilise at `0` | hold |
| 7.1 cofinal invariance (additive, with products) | subsequence `φ` | chain map `a_k = π_{φ(k)}`, `a′_k = Σ_{m=φ(k)}^{φ(k+1)−1} F(m → φ(k)) π_m`: `(a′(1 − s)x)_k = x_{φ(k)} − F(φ(k+1) → φ(k)) x_{φ(k+1)} = ((1 − s′)a x)_k`; finite sums of transitions only | holds |
| 7.2 cycle-tower bullet (R02) | `ℤ/4` at a position; `ℤ` in the 1.4 complex | `Z_r` takes at most three values, eventually constant, `lim¹ = 0`; `ℓ^{r−1}ℤ` never constant, `lim¹ = ℤ_ℓ/ℤ` | holds; needs 1.2 |
| 6.2 wrong model (F04) | `ℓ = 2`; `ℓ = 3` | `ker i = ℓℤ/ℓ² = im k` (`k(a, b) = ℓb`), `ker j = ℓℤ/ℓ² = im i`, `ker k = ℤ/ℓ ⊕ 0 = im j`, `jk(a, b) = j(ℓb) = (0, 0)`, `Z_2 = k^{−1}(ℓℤ/ℓ²) = E`, wrong `k^{−1}(0) = ℤ/ℓ ⊕ 0`; the wrong `Z_2` is the true `Z_3` (`d_2(a, b) = (b, 0)`) | holds |
| 2.2 (headline) † | 1.4 complex `n = 0`; `×2`, `n = 1`; first quadrant | degree `1` infinite, no claim, `Z_r(0,0) = ℓ^{r−1}ℤ`; degree `0` and `2` finite, `(0, 1)` stabilises from `3`; `r > max(p, q + 1)` from `(f + r − e, n + 1)` and `(f − r + e, n − 1)` | holds |
| 3.5 (headline) † | separation; completeness; (iii) | `E = 0`, `H^0 = ℤ` constant, `h = 0` not iso; `ℤ → ℤ_ℓ` with `gr^p = ℤ/ℓ` both sides, `h` not onto; exhaustive + exact colimits: `colim_p F^p/F^{p′} = H/F^{p′}`, complete: `H = lim_{p′} H/F^{p′}`, limits and colimits of isos | holds |
| 4.4 (headline) † | `a ≤ q < b`; `q ≥ b`; `q < a`; `×2` with `a = −2`, `b = 0` | `max(q − a + 2, b − q + 1) ≤ b − a + 1`; `q ≥ b`: page `q − a + 2`, `gr^{n−q} = 0`; `q < a`: page-2 object `0`; `F^p = H^1` for `p ≤ 2`, `0` for `p ≥ 4` | holds |
| 7.4 (headline) † | Theorems 3.9, 3.10 under `s ↦ −s`; Example 8.1 | HR: weak + exhaustive, `RF^{−∞} = 0`, `F^{−∞}A^∞ ≅ W`; README: weak + exhaustive + `lim¹ F^s = 0`, meet `≅ W^n`; 8.1: `W^0 ≅ ∏k/⨁k ≠ 0`, `RE_∞ = 0`, `A^{+∞} = 0 = RA^{+∞}`, `F^s = A^{−∞}` | holds |
| 7.5 (headline) † | `ℓ`-adic `ℤ_ℓ`; `ℓ`-adic `ℤ`; route | complete, `E_1^{p,−p} = ℤ/ℓ`, `W^0 = 0`, strong; `ℤ`: hypothesis and conclusion both fail; `1 − s` iso on `∏ F^sK` ⇒ `lim = lim¹ = 0` on `H^n(F^sK)` | holds |

**Shape and completeness.** 31 targets, each definition with an API list and at least three Checks
(3 everywhere, 4 in 1.4, 3.5, 3.6, 5.1, 6.3, 7.1, 7.4); every layer ends with Examples and
Dependencies; Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
build, Downstream consumers, References present; no line over 100 characters; no LaTeX delimiters;
no process words, pull-request numbers, dates or machine paths; the only "lemma" occurrences are
source labels ("Lemma 24.8") and "five-lemma induction". Every theorem carries its hypotheses in the
sentence and a locator. Manifest: every cited work recorded; `cited_for` lists agree with the README
section by section; the helle-rognes2024 locator lists exactly the cited items.

**Headline theorems for the package stage** (from the Summary): the stabilisation theorems of 2.2;
the comparison theorem 3.5; the consequences 3.6; the tower and limit-page identifications 4.1, 4.3;
convergence in a range of degrees 4.4 and the quadrant cases 4.5; the filtered-complex theorems 5.3,
5.4; the exact-couple identification 6.3; Boardman's theorems 7.4; the complete convergence theorem
7.5. Statable at the pins once the few definitions of Layers 1–3 (towers, limit page, bidegree
assignment, convergence structure) have real bodies on `SpectralSequence`, `FilteredObject` and
`Subobject`: 2.2, 3.5, 3.6, 4.4, 4.5, 5.3, 5.4 and 7.5's strong-convergence clause (its `W^n` is
writable on the tower `H^n(F^sK)` with lim¹ as the cokernel of `towerDifference`). 6.1–6.3 and 7.4
need StableHomotopyKTheory §7.22's exact-couple carrier, which is in a pull request and cannot be
imported: the package names them in its module docstring as not statable, with that reason, rather
than keeping a local copy of the supplier's structure.

## Not verifiable

- weibel1994 (Definitions 5.2.5, 5.2.11, Theorem 5.2.12, Theorems 5.5.1, 5.5.10, §§3.5, 5.9),
  boardman1999 (3.4(b), 5.10, 7.1, 8.2, 8.10, 8.13), eilenberg-moore1962 §7, mccleary2001 Ch. 2–3,
  massey1952, cartan-eilenberg1956 Ch. XV: settled as uncertified in the manifest and cited by locator
  only. Boardman's numbers agree with helle-rognes2024's citations of them (line 13–25, 76, 153, 163,
  166, 169, 201, 226), which is all that could be checked.
- The sign `+2` of the first differential in the Conventions' witness rests on Tau Ceti
  `spectralSequence_first_page_d_eq` identifying it with Mathlib's connecting map; read at
  `TauCeti/Algebra/Homology/SpectralSequence/Filtered/FirstPage.lean` line 89–101, not run.
- Elaboration, `#check` comparison and the one-tactic probe: not available (design stage, no
  `Suggested.lean`; this lane does not elaborate).

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "54b8d0be6f7127b157645b27e2a0160b69e516b6", "job": "REV-DESIGN-SpectralSequencesAndConvergence~3", "model": "fable", "worker": "chris-x9"} -->
