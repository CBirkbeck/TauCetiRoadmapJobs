# Review of LocalPurity (pull request #1807 at 70140e6)

**Verdict:** needs changes

Ten findings: three P2 and seven P3. The mathematics holds up; every sampled locator and every computed instance checks out (tables below). The defects are about ownership. The pinned Tau Ceti already proves most of Layer 0, all of §1.1, half of §1.2 and the dimension-two case of §2.1. The roadmap still owns those targets, says the libraries lack them, and builds its own copies of the carriers in `Suggested.lean`. The gate also fails (`readme-ids-missing=4`).

## R01 (P2) — `Suggested.lean` builds second carriers for pinned Tau Ceti objects

**Location.** `TauCetiRoadmap/LocalPurity/Suggested.lean:65–96` (`finiteEtale`, `FEt`, `FEt.pullback`, `puncturedSpectrum`, `PurityHolds`). Also README line 65–66, "the targets are stated for either carrier", and line 209–210, "Tau Ceti's newer `FiniteEtaleScheme U` (not at this roadmap's pin)".

**Claim.** The three headline theorems are stated against this file's own copies of the finite étale category, its pullback functor, the punctured spectrum and purity. The README (line 58–63) names Tau Ceti's category as the one carrier.

**Witness.** The pinned Tau Ceti has `TauCeti.FiniteEtaleScheme` (`AlgebraicGeometry/FiniteEtale/Basic.lean:66`), `TauCeti.FiniteEtaleScheme.pullback` (`FiniteEtale/Fiber.lean:51`), `TauCeti.IsLocalRing.puncturedSpectrum` (`AlgebraicGeometry/PuncturedSpectrum.lean:52`) and `TauCeti.IsLocalRing.PurityHolds` (`FiniteEtale/PuncturedSpectrum.lean:63`). A proof of Tau Ceti's `PurityHolds A` does not typecheck as this file's.

**Repair.**
- Delete the five declarations.
- Replace `import TauCeti.RingTheory.RegularLocalRing.Basic` by `import TauCeti.AlgebraicGeometry.FiniteEtale.PuncturedSpectrum`.
- State the headlines on the pinned carriers:

```lean
theorem purityHolds_of_isRegularLocalRing (A : Type u) [CommRing A] [IsRegularLocalRing A]
    (hd : 2 ≤ ringKrullDim A) : TauCeti.IsLocalRing.PurityHolds A := by
  sorry

theorem finiteEtale_extend_of_purity {X : Scheme.{u}} [IsNoetherian X] (U : X.Opens)
    (h : ∀ x : X, x ∉ U → TauCeti.IsLocalRing.PurityHolds (X.presheaf.stalk x)) :
    (TauCeti.FiniteEtaleScheme.pullback U.ι).EssSurj := by
  sorry
```

- Keep `etale_of_finiteNormal_of_isRegularLocalRing` unchanged.
- In the README:
  - delete "and the targets are stated for either carrier" and lines 209–212;
  - write `FiniteEtaleScheme U` for `FEt U` in §1.2;
  - name the restriction functor as `TauCeti.FiniteEtaleScheme.pullback` (or `TauCeti.IsLocalRing.restrictPunctured`), not Mathlib's `MorphismProperty.Over.pullback`.

**Tested.** I elaborated a scratch copy with exactly these three headlines and that single Tau Ceti import. It gives the three `sorry` warnings and nothing else.

## R02 (P2) — The README owns targets the pins already prove, and says the libraries lack them

**Location.** README line 14–18: "Tau Ceti has finite étale schemes over a base and regular local rings as domains; SchemeAndStackFoundations specifies depth, Cohen–Macaulay rings, … None of them has finite étale covers of punctured spectra or local purity." The same holds for:
- Layer 0, §1.1, parts of §1.2 and §2.1;
- Convention 4 ("depth is SchemeAndStackFoundations' `IsLocalRing.depth`");
- the Scope bullets on depth, Cohen–Macaulay and 0AFS (line 70–81);
- the `## Provenance` table.

**Claim.** The roadmap owns, and plans to build, the objects and theorems in the table below. Its prerequisites for depth, Cohen–Macaulay rings and Serre's theorem come from SchemeAndStackFoundations §§0.17 and 4.13.

**Witness.** The pinned Tau Ceti proves 00R4 (`RegularLocalRing/MiracleFlatness.lean:72`), 0BJF (`Etale/Discriminant.lean:122`), 0BLK (`FiniteEtale/Extension.lean:111`) and 0AFS (`RegularLocalRing/ProjectiveDimension.lean:441`). Mathlib has `IsLocalRing.depth` (`Mathlib/RingTheory/Depth/Basic.lean:78`).

**Repair.**
1. Add `## Exact supplier contracts` with `From Mathlib` and `From Tau Ceti` subsections (see R07). List there every row of this table by full name and file.
2. Delete the duplicated target sentences.
3. Correct the Summary sentence and Convention 4.
4. Replace the §§0.17/4.13 citations for depth, Cohen–Macaulay, 0AFS and regular ⇒ normal by the pinned names.
5. Drop `## Provenance`.

| README item | Pinned declaration (file:line, pinned package) |
|---|---|
| §0.1 `flat_of_isCohenMacaulay` (00R4) | `TauCeti.Algebra.flat_of_isCohenMacaulay` (`TauCeti/RingTheory/RegularLocalRing/MiracleFlatness.lean:72`) |
| §0.1 `flat_of_normal_dim_two` | `TauCeti.Algebra.flat_of_normal_dim_two` (same file :90) |
| §0.2 trace-form criterion | `TauCeti.Algebra.etale_iff_traceForm_nondegenerate` (`TauCeti/RingTheory/Etale/Discriminant.lean:66`) |
| §0.2 discriminant criterion over a local base | `TauCeti.Algebra.etale_iff_isUnit_discr` (:122), over any commutative base, as 0BJF itself |
| §0.2 localization form | `TauCeti.Algebra.isUnit_discr_localization_iff` (:144) |
| §1.1 punctured spectrum, restriction functor, purity | `TauCeti.IsLocalRing.puncturedSpectrum` (`TauCeti/AlgebraicGeometry/PuncturedSpectrum.lean:52`), `TauCeti.IsLocalRing.restrictPunctured`, `TauCeti.IsLocalRing.PurityHolds` (`TauCeti/AlgebraicGeometry/FiniteEtale/PuncturedSpectrum.lean:55, 63`) |
| §1.1 API | `TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen` (`PuncturedSpectrum.lean:81`), `TauCeti.IsLocalRing.isCompact_puncturedSpectrum` (:99), `TauCeti.IsLocalRing.restrictPunctured_faithful_of_one_le_depth` (`FiniteEtale/PuncturedSpectrum.lean:119`) |
| §1.2 `extends_iff_sections_finiteEtale` (0BLK) | `TauCeti.IsLocalRing.extends_iff_sections_finiteEtale` (`TauCeti/AlgebraicGeometry/FiniteEtale/Extension.lean:111`) |
| §1.2 0BM8, affine form | `TauCeti.AlgebraicGeometry.Spec.presheaf_map_leTop_bijective_of_isIntegral` (`TauCeti/AlgebraicGeometry/PuncturedSpectrum/Sections.lean:110`) |
| §1.2 `FiniteNormalPuncturedEtaleAlg`, full-faithfulness half of 0BM9 (corrected) | `TauCeti.IsLocalRing.FiniteNormalPuncturedEtaleAlg` (`TauCeti/AlgebraicGeometry/FiniteEtale/FiniteNormal.lean:88`), `TauCeti.IsLocalRing.restrictPuncturedSpec.fullyFaithful` (:204) |
| §2.1 (2) in dimension two | `TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two` (`TauCeti/RingTheory/RegularLocalRing/Purity.lean:75`) |
| §2.2 affine case of `restrictOpen_fullyFaithful_of_depth` | `TauCeti.FiniteEtaleScheme.fullyFaithfulPullbackιOfTwoLeDepth` (`TauCeti/AlgebraicGeometry/FiniteEtale/FullyFaithful.lean:105`) |
| Convention 5 counterexample | `TauCeti.IsLocalRing.isEtaleAt_prod_residueField`, `…not_flat_prod_residueField`, `…not_etale_prod_residueField` (`TauCeti/RingTheory/Etale/ProdResidueField.lean:82, 147, 153`) |
| depth (Convention 4, all layers) | Mathlib `IsLocalRing.depth` (`Mathlib/RingTheory/Depth/Basic.lean:78`) |
| Cohen–Macaulay | Tau Ceti `Module.IsCohenMacaulay` (`TauCeti/RingTheory/CohenMacaulay/Basic.lean:67`) |
| regular local of dimension `d` has depth `d` | `TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim` (`TauCeti/RingTheory/RegularLocalRing/CohenMacaulay.lean:110`) |
| 0AFS: a regular local ring is `IsRegularRing` (this pull request's new §4.13 citation) | instance `TauCeti.isRegularRing_of_isRegularLocalRing` (`TauCeti/RingTheory/RegularLocalRing/ProjectiveDimension.lean:441`) |
| regular ⇒ normal (0567) | `TauCeti.IsRegularRing.isIntegrallyClosed` (`TauCeti/RingTheory/RegularLocalRing/Normal.lean:55`) |
| normal local, dimension ≥ 2 ⇒ depth ≥ 2 (the `(S₂)` step of §0.1/§2.1) | `IsLocalRing.two_le_depth_of_isIntegrallyClosed` (`TauCeti/RingTheory/CohenMacaulay/Normal.lean:144`) |

What stays owned here:
- the scheme form of 0BM8 and the essential-surjectivity half of 0BM9 (`finiteNormalEquiv`);
- all of §1.3 and §1.4;
- §2.1 (1), and (2) in dimension ≥ 3 with the induction;
- §2.2.

§1.1 is cited from outside (PurityForFlatCohomology, open pull request, README line 90). When it empties, add one line `§1.1 → Exact supplier contracts, From Tau Ceti`. No other cited id moves. Every pinned name in the table was checked with `#check` at the pin (types printed; see Verified sound).

## R03 (P2) — Miracle flatness (00R4) has a second roadmap owner and is already pinned

**Location.** README §0.1, line 135–143: "Prove `flat_of_isCohenMacaulay` (Stacks, Lemma 10.128.1 (00R4)) … ModularCurves §4D's miracle flatness between regular local schemes of equal dimension is the case of `flat_of_isCohenMacaulay` with `S` regular."

**Claim.** LocalPurity owns 00R4.

**Witness.** At the head of open pull request #1808, `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5850` makes *miracle_flatness* (00R4) a §4.13 target. Its `TauCetiRoadmap/ModularCurves/README.md:309` adds "Miracle flatness is SchemeAndStackFoundations §4.13's". The pinned Tau Ceti proves it (R02).

**Repair.**
- In this folder, delete the §0.1 targets and the ModularCurves §4D sentence.
- Cite `TauCeti.Algebra.flat_of_isCohenMacaulay` and `TauCeti.Algebra.flat_of_normal_dim_two` under `From Tau Ceti`.
- In the §2.1 route, write `TauCeti.Algebra.flat_of_isCohenMacaulay`.

That citation is correct whether #1808 merges before or after this pull request, so no order between the two is needed for this folder. Whether #1808 should cite the same declaration is for that pull request's own review.

## R04 (P3) — Padding: four theorems in `Suggested.lean` close in one step from pinned Tau Ceti

**Location.** `Suggested.lean:37–57` (`flat_of_normal_dim_two`, `etale_iff_traceForm_nondegenerate`, `etale_iff_isUnit_discr`) and `:126–128` (`not_flat_prod_residueField`).

**Claim.** These are acceptance-test statements. (`flat_of_normal_dim_two` is in any case not a headline.)

**Witness.** On scratch copies each closes by one `exact` of `TauCeti.Algebra.flat_of_normal_dim_two`, `TauCeti.Algebra.etale_iff_traceForm_nondegenerate`, `TauCeti.Algebra.etale_iff_isUnit_discr` or `TauCeti.IsLocalRing.not_flat_prod_residueField` (with `¬ IsField A` from `hd`). The last also mirrors two README Checks.

**Repair.** Delete the four theorems, and with them the Layer 0 section, from `Suggested.lean`. The README cites them as pinned declarations (R02) and keeps the counterexample as a Check.

## R05 (P3) — The module docstring is in catalogue form and misstates what the pins lack

**Location.** `Suggested.lean:4–20`: "The statements here suggest Lean forms for particular milestones, so that contributors and reviewers converge on names and signatures"; "Conditions whose Mathlib API does not exist at the pinned version (depth, Cohen–Macaulay) are not stated here".

**Witness.** Depth is Mathlib's `IsLocalRing.depth` (`Mathlib/RingTheory/Depth/Basic.lean:78`). Cohen–Macaulay is Tau Ceti's `Module.IsCohenMacaulay` (`TauCeti/RingTheory/CohenMacaulay/Basic.lean:67`). The file is the acceptance test, not a list of suggested names.

**Repair.** Replace the docstring by:

```lean
/-!
# Finite étale covers of punctured spectra and local purity: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti: purity for regular local rings in both forms
(Stacks 0BMA, the second with the torsion-free correction of README Convention 5) and extension
of finite étale covers across points where purity holds (Stacks 0EY7), on Tau Ceti's
`TauCeti.FiniteEtaleScheme` and `TauCeti.IsLocalRing.PurityHolds`. Every headline theorem is
statable at the pins.
-/
```

## R06 (P3) — Gate failure `readme-ids-missing` (4), plus two end-theorem names declared nowhere

**Location.**
- README line 187: `puncturedSpectrum_eq_iSup_basicOpen`.
- Lines 251–252, 285, 357: `finiteEtale_extend_of_hypersurface`, `finiteEtale_extend_of_localCohomology`.
- Lines 322, 362: `finiteEtale_extend_of_regular_codimTwo`.
- Lines 42–43 and 264: `IsLocalRing.purityHolds_of_isRegularLocalRing`, `Algebra.etale_of_finiteNormal_of_isRegularLocalRing`.

**Witness.** The gate reports `readme-ids-missing=4` for the first four names. `Suggested.lean` declares the end theorems as `TauCetiRoadmap.LocalPurity.purityHolds_of_isRegularLocalRing` and `…etale_of_finiteNormal_of_isRegularLocalRing` (signatures checked). No `IsLocalRing.` or `Algebra.` declaration exists at the pins.

**Repair.**
- Cite `puncturedSpectrum_eq_iSup_basicOpen` as `TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen` (R02).
- State the other three in prose without a backticked name, including in the alignment table: "the local Lefschetz extension theorem (0BLM)", "its route through Lemma 58.20.6 (0BLS)", "the corollary for regular local rings of dimension at least two off `U`".
- In lines 42–43 and 264, name the end theorems as `Suggested.lean` declares them.
- Rerun the gate.

## R07 (P3) — The README shape departs from the house form

**Location.** Whole README.

**Witness.** Missing: `## Exact supplier contracts` (contracts sit in Scope, line 58–96), `## How to read the build` (line 25–40 is a table and diagram), per-layer `### Examples` and `### Dependencies`, and `## Downstream consumers` (listed twice instead, line 20–23 and 98–100). Extra: `## Stacks alignment`, `## Provenance`.

**Repair.**
- Move the Scope bullets into `## Exact supplier contracts` with the three subsections.
- Replace lines 25–40 with a `## How to read the build` paragraph.
- End each layer with `### Examples` (the `A₁` cone `k[x², xy, y²]` and the algebra `A × A/𝔪` fit there) and `### Dependencies`.
- Write one `## Downstream consumers` section (PurityOfBranchLocus §2.1; AbhyankarLemma §§2.1–2.2) and delete the two duplicate sentences.
- Fold the alignment classes into the targets (Convention 5 already records the corrections) and drop Provenance (R02).

## R08 (P3) — Checks carry Lean-style names

**Location.** README lines 149, 170, 172, 217, 295, 298: `test_flat_needs_cohenMacaulay`, `test_discr_dual_numbers`, `test_discr_quadratic`, `test_closed_point_factor`, `test_closed_point_factor_not_etale`, `test_purity_needs_regular`.

**Witness.** The house rule is that a Check never names or claims a Lean counterpart. `test_flat_needs_cohenMacaulay` is also the label of a pinned Tau Ceti example (`TauCeti/Examples/RingTheory/CohenMacaulay/MiracleFlatness.lean:38`).

**Repair.** Delete the backticked labels and keep each Check's prose, which is correct (values in the table below).

## R09 (P3) — Process narrative in the README

**Location.**
- README line 209–210: "When replacing the prototype `FEt U` by Tau Ceti's newer `FiniteEtaleScheme U` (not at this roadmap's pin)".
- Line 272–277: "not the finite-local helper … remains a separate corollary, not the localization argument … now gives".

**Witness.** "prototype", "newer", "not at this roadmap's pin", "remains" and "now" are process words. Line 210 is also false: `TauCeti.FiniteEtaleScheme` is at the pin (`FiniteEtale/Basic.lean:66`), as the README's own line 61 says.

**Repair.**
- Delete lines 209–212.
- Rewrite the dimension-two step as: "For `d = 2`, localize at each maximal ideal `𝔮` of `B`. `B_𝔮` need not be finite over `A`, so apply miracle flatness (`TauCeti.Algebra.flat_of_isCohenMacaulay`) to `A → B_𝔮`: … Then `Module.flat_of_isLocalized_maximal` gives flatness of `B` over `A`, …".
- Drop the sentence on `flat_of_normal_dim_two`.

## R10 (P3) — Locators: Lemma 58.20.6 lacks its tag, and SGA 1 is cited for nothing here

**Location.** README line 251–252: "with its route through Lemma 58.20.6 as `finiteEtale_extend_of_localCohomology`". References line 388: "SGA 1, Exposé X, Théorème 3.1".

**Witness.**
- Stacks Lemma 58.20.6 is tag 0BLS (`stacks-pione` line 2449, p. 52). It is absent from the alignment table.
- SGA 1 X 3.1 (`SGA1` line 8359, printed p. 212) is purity of the branch locus, which PurityOfBranchLocus owns. No statement of this roadmap cites it.

**Repair.**
- Write "Lemma 58.20.6 (0BLS)" at the target.
- Either cite SGA 1 X 3.1 at the Summary sentence on PurityOfBranchLocus (line 20–21) or delete it from the References.

## Verified sound

**Source ids used below** (none is in the manifest yet; all fetched today from open repositories):
- `stacks-pione`: Stacks Ch. 58, Fundamental Groups of Schemes;
- `stacks-algebra`: Ch. 10;
- `stacks-discriminant`: Ch. 49;
- `stacks-limits`: Ch. 32;
- `stacks-algebraization`: Ch. 52;
- `stacks-more-algebra`: Ch. 15;
- `stacks-divisors`: Ch. 31;
- `SGA2`: arXiv math/0511279;
- `SGA1`: arXiv math/0206203.

**Sampled locators: 38 Stacks tags and 2 SGA theorems, each read at its statement.**

| Tag | Number | Location | Matches the README |
|---|---|---|---|
| 0BLF | Situation 58.19.1 | pione 2245 | ✓ |
| 0BLH | 58.19.3 | pione 2266 | finite `V → U`, finite `Y′` over the completion ⇒ finite `Y` ✓ |
| 0BLI | 58.19.4 | pione 2283 | henselian pair ✓ |
| 0BM6 | 58.19.6 | pione 2342 | `H¹_𝔪`, `H²_𝔪` killed by a power of `f`, henselian pair ✓ |
| 0BLJ | 58.19.7 | pione 2351 | depth ≥ 3 ✓ |
| 0BM7 | Section 58.20, first paragraph | pione 2357 | ✓ |
| 0BM8 | 58.20.1 | pione 2366 | ✓ |
| 0BLK | 58.20.2 | pione 2380 | depth ≥ 2 ✓ |
| 0BM9 | 58.20.3 | pione 2391 | see Source issues |
| 0BLL | 58.20.4 | pione 2421 | ✓ |
| 0BLS | 58.20.6 | pione 2449 | R10 |
| 0BLM | 58.20.7 | pione 2459 | depth ≥ 3; no henselian hypothesis, as the README says ✓ |
| 0BMA | 58.21.3 | pione 2503 | see Source issues |
| 0BMB | 58.21.4 | pione 2524 | ✓ |
| 0EY7 | 58.21.6 | pione 2604 | Noetherian `X` ✓ |
| 0EL8 | 58.17.1 | pione 2028 | ✓ |
| 0BL6 | Section 58.5 | pione 529 | ✓ |
| 0BN9 | 58.5.2 | pione 550 | ✓ |
| 00R4 | 10.128.1 | algebra 14937 | three hypotheses exactly as §0.1 states them ✓ |
| 0AFS | 10.110.6 | algebra 12566 | ✓ |
| 00NP | 10.106.2 | algebra 11920 | ✓ |
| 00NQ | 10.106.3 | algebra 11925 | ✓ |
| 0567 | 10.157.5 | algebra 20195 | ✓ |
| 00GV | Definition 10.37.11 | algebra 3976 | ✓ |
| 00H8 | 10.38.7 | algebra 4098 | ✓ |
| 00ON | 10.112.7 | algebra 12677 | ✓ |
| 031S | 10.157.4 | algebra 20161 | ✓ |
| 00HT | 10.39.18 (7) | algebra 4395 | the step from maximal ideals of `B` to flatness over `A` used in §2.1 ✓ |
| 0BJF | 49.3.1 | discriminant 269 | ✓ |
| 0BQ5 | 32.20.3 | limits 2571 | retrocompact `U`, `s ∉ U`, `V = Spec 𝒪_{S,s} ∩ U` ✓ |
| 0EY3 | 32.20.4 | limits 2627 | separated, proper, finite, étale ✓ |
| 0EKS | 52.15.5 | algebraization 2193 | ✓ |
| 0EII | 52.12.7 | algebraization 1923 | ✓ |
| 0EKP | 52.15.1 | algebraization 2094 | ✓ |
| 05ER | 15.91.16 | more-algebra 11528 | flat `A → Â` with `A/𝔪 ≅ Â/𝔪Â`, so the hypotheses hold ✓ |
| 05EU | Remark 15.91.20 | more-algebra 11624 | ✓ |
| 09ZL | 15.13.2 | more-algebra 1758 | ✓ |
| 0E9I | 31.5.11 | divisors 335 | ✓ |

- `SGA2` Exposé X, Théorème 3.4 (i) (line 3390, Exposé X): a regular Noetherian local ring of dimension ≥ 2 is pure ✓.
- `SGA1` Exposé X, Théorème 3.1 (line 8359): R10.

**Adversarial table.** It covers the sampled targets, the three headlines and every target a finding touches.

| Statement | Instances tried | Values computed (both sides) | Result | Change |
|---|---|---|---|---|
| 00R4 `flat_of_isCohenMacaulay` | (a) `R = k⟦x,y⟧ → S = R[z]/(z², xz, yz)`; (b) `R = k⟦x⟧ → S = k⟦x,y⟧/(xy)`; (c) `R` a field | (a) `dim S = 2 = 2 + dim S/𝔪_R S = 2 + 0`; `z` is killed by `𝔪_S`, so depth 0 ≠ 2 and `S` is not CM; `S ≅ R ⊕ k` is not flat. (b) `S` is CM of dimension 1, but `1 ≠ 1 + dim k⟦y⟧ = 2`; `x·y = 0`, so `S` is not flat. (c) dimension 0: every module is flat | true; each hypothesis needed | R02/R03 (pinned) |
| `flat_of_normal_dim_two` | `k⟦u,v⟧ ⊂ k⟦x,y⟧`, `u = x²`, `v = y²`, in char 0 and char 2 | basis `1, x, y, xy`: free of rank 4 in both | true; locality follows from finite + injective | R04 |
| trace-form criterion | `K = 𝔽₂`: `B = 𝔽₂[x]/(x²)`, `B = 𝔽₄`, `B = 0`; `K = 𝔽₂(t)`, `B = K(√t)` | Gram `[[0,0],[0,0]]`, det 0, not étale; Gram `[[0,1],[1,1]]`, det 1, étale; empty Gram is nondegenerate and `0` is étale; inseparable, so trace ≡ 0 and not étale | both directions hold in each case | R04 |
| `etale_iff_isUnit_discr` | `ℤ_(3)[x]/(x²−2)`; `ℤ_(3)[x]/(x²−3)`; `ℤ_(2)[x]/(x²+x+1)`; `ι` empty | disc 8, a unit, étale; disc 12 ∈ 3ℤ_(3), ramified; Gram `[[2,−1],[−1,−1]]`, det −3, a unit at 2, étale; empty basis gives disc 1 and `B = 0` is étale | true; narrower than 0BJF and than the pinned lemma | R02/R04 |
| Check (dual numbers) | `k[x]/(x²)`, basis `1, x` | `Tr 1 = 2`, `Tr x = Tr x² = 0`, det 0 | true | R08 (label only) |
| Check (quadratic) | `ℤ_(p)[x]/(x²−d)`, `p` odd | Gram `diag(2, 2d)`, det `4d`: a unit iff `d` is | true | R08 |
| `PurityHolds` (0BM7) | field; `ℤ_(p)`; `k⟦x,y⟧`; `k[x²,xy,y²]` at the origin | `U = ∅`, so it holds; `ℚ(√p)/ℚ`: the only finite candidate `ℤ_(p)[√p]` is ramified, so it fails; holds by 0BMA; the μ₂-cover fails. Wrong model "fully faithful": the `A₁` cone has depth 2, so restriction is fully faithful but not essentially surjective | determines the notion | R01 (carrier) |
| 0BM8 `spec_sections_of_depth` | `Spec A`, depth 2; `Spec(A × κ)` | `Γ(π⁻¹U) = A = Γ(Y)`; the `κ` point has depth 0 and `Γ(π⁻¹U) = A ≠ A × κ`, so the hypothesis is needed | true as stated | none |
| 0BLK | `A₁` cone, μ₂-cover `V` | `Γ(V) = k[x,y]` localized: closed fibre `k[x,y]/(x²,xy,y²)` has length 3 against generic rank 2, so it is not flat; `V` does not extend; both sides false | true | R02 (pinned) |
| 0BM9 corrected, `finiteNormalEquiv` | `B = A × κ`; `B = A` | `A × κ` is in Stacks' category but `Γ(Spec B ×_X U) = A`; `𝔪 ≠ 0` kills `κ`, so torsion-freeness excludes it; `B = A ↔ V = U`; `V → V′` gives `Γ(V′) → Γ(V)`, an anti-equivalence | corrected form true | none |
| 0BLL | `A₁` cone over `A` and over `Â` | length 3 against rank 2 on both sides: both false; regular `A`: both true | true | none |
| 0BLJ | `k⟦x,y,z⟧`, `f = z`; `k⟦x,y⟧`, `f = x` (depth 2) | depth 3: `U`, `U₀` simply connected, restriction is a bijection of finite sets; depth 2: `π₁(U) = 1` while `π₁(Spec k((y))) ≠ 1`, and restriction is still fully faithful. Depth 3 is sufficient, and is not claimed necessary | true | none |
| 0BLM | `k⟦x,y,z⟧`, `f = z`, `V = U ⊔ U`; cone `xy = z²` (depth 2, excluded), `f = z` | the split cover extends; on the cone, `V₀` on the branch `y = z = 0` is `k((u))/k((x))` with `u² = x`, not in the image from `X₀`, so hypothesis (2) fails: no counterexample | true | R06/R10 |
| 0BMA (1) | `ℤ_(p)` (`hd` fails); `A₁` cone (not regular); `k⟦x,y⟧` | `ℚ(√p)` does not extend; the μ₂-cover does not extend; true | each hypothesis needed | R01 |
| 0BMA (2) corrected | `A = k⟦x,y⟧`: `A × κ`; `A[t]/(t²−x)`; `A[t]/(t²−1−x)`; `B = 0`; char 2 `A[t]/(t²−x)` | torsion, so excluded; `q = (t)` lies over `(x) ≠ 𝔪` and is not étale, so `hpunct` fails and `B` is not étale; étale everywhere; hypotheses vacuous and `A → 0` étale; `q = 0` inseparable, so `hpunct` fails | true; all binders are in the signature | none |
| Convention 5 | `A = k⟦x,y⟧`, `B = A × κ` | local rings `A_𝔭` and `κ` are normal; `Spec B ×_X U = U`; `Tor₁(κ,κ) = κ² ≠ 0`, so `B` is not flat | true; refutes Stacks as written | Source issues |
| Check `A₁` cone | as 0BLK | length 3 against rank 2 | true | R08 |
| 0BQ5/0EY3 `spread_from_localScheme` | hypotheses against the source | retrocompact `U`, `s ∉ U`, `V`, the property list: equal | true | none |
| 0EY7 `finiteEtale_extend_of_purity` | `U = X`; `X = Spec k`, `U = ∅`; `X = Spec ℤ_(p)`, `U` = generic point | identity pullback is essentially surjective; purity at a field holds and FÉt over `∅` is trivial; purity fails at `ℤ_(p)`, and `ℚ(√p)` does not extend | true; `[IsNoetherian X]` is Stacks' "Noetherian" | R01 |
| `restrictOpen_fullyFaithful_of_depth` | `𝔸²`, `U = 𝔸² ∖ 0` | the Hom sheaf of finite locally free algebras has depth 2 at 0; sections extend uniquely | true | R02 (affine case pinned) |
| `finiteEtale_extend_of_regular_codimTwo` | generic point outside `U` | stalk dimension 0 < 2, so the hypothesis fails unless `X = ∅` | true | R06 |

**Lean.**
- `lake env lean` on `Suggested.lean`: 7 `sorry` warnings and nothing else.
- All 12 elaborated types in the worker's signatures file match their README statements; no section binder is lost.
- Mathlib `Algebra.IsEtaleAt` is formal étaleness of `B_q` (`Mathlib/RingTheory/Etale/Locus.lean:35`). That is étaleness at `q` for finite `B` over a Noetherian `A`, so the hypotheses of `etale_of_finiteNormal_of_isRegularLocalRing` say what the README says.
- `Module.IsTorsionFree` (`Mathlib/Algebra/Module/Torsion/Free.lean:48`) is the usual condition over a domain.
- `IsRegularLocalRing` extends `IsLocalRing` and `IsNoetherianRing` (`Mathlib/RingTheory/RegularLocalRing/Defs.lean:52`).
- `Module.flat_of_isLocalized_maximal` localizes at maximal ideals of `B`, as §2.1 needs (`Mathlib/RingTheory/Flat/Localization.lean:66`).
- Also opened: `traceForm_nondegenerate_tfae` (`@[stacks 0BIL]`, `Mathlib/RingTheory/Trace/Basic.lean:507`), `Algebra.HasGoingDown` (`Mathlib/RingTheory/Ideal/GoingDown.lean:44`), `Ideal.height_le_one_of_isPrincipal_of_mem_minimalPrimes` (`Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean:108`), `AdicCompletion.flat_of_isNoetherian`, `localCohomology`, `HenselianRing`.
- Every Tau Ceti name in the R02 table was checked with `#check` at the pin.
- Probes: four one-tactic closures (R04), and the repaired three-headline file (R01). `TauCeti.RingTheory.Etale.ProdResidueField` was built first with `lake build`, as the brief allows.

**Citations and order.**
- SchemeAndStackFoundations at this head resolves: §0.6 `coherent_hartogs` (line 707), §0.9 `finite_presentation_limits` (859), §0.14 *henselian_finiteEtale_equivalence* (1080), §0.17 names (1140–1173), §2.7 (3499, 3512), §4.8 `CoherentFormalModule` (5393), §4.13 0AFS chain (5662–5710). It cites LocalPurity only as a consumer (7481): no cycle.
- PurityOfBranchLocus line 32 and 56, AbhyankarLemma line 28 and 57 (on main), and PurityForFlatCohomology (open, line 86–93, 1084–1093) consume §§1.3, 2.1–2.2 only.
- The dependency check reports `depcheck: 240 roadmaps, 2435 edges, 0 problem(s)`.
- Overlaps:
  - #1808 and #1854 carry this README identical to this head (empty diff), so no conflict in this folder.
  - The order with #1808 is stated in the description.
  - No dropped ids.
- Ownership against the open heads: tags 0BLH, 0BLL, 0BLM, 0BM9, 0EKS, 0EL8, 0EII, 0EKP, 05ER, 0EY7 are searched; no second owner apart from R03. DirectSummandsAndBigCohenMacaulay (#1735) has no overlap.
- Declared gaps of this roadmap: none. The gaps EtaleHomotopyTypes (#1806) declares on LocalPurity (`relative-etale-depth`, `relative-homotopical-purity`) belong to that roadmap's review.

## Not verifiable

- The external repository named under `## Provenance` (github.com/tdupu/pcfawd-formalization) is not a pinned library and was not opened. R02 and R07 remove the section.
- Everything else cited was read at its locator.

## Source issues

- **Error** in Stacks (`stacks-pione`) at Lemma 58.20.3 (0BM9), p. 51: the source says global sections give an equivalence onto all finite normal `A`-algebras étale over `U`; it should restrict to algebras torsion free over `A`, since `A × κ(𝔪)` is in the target but in no image; affects a stated result.
- **Error** in Stacks (`stacks-pione`) at Lemma 58.21.3 (0BMA), part (2), p. 53: the source says a finite normal `B` inducing a finite étale map on punctured spectra is étale; it should require `B` torsion free over `A`, since `A × κ(𝔪)` satisfies the hypotheses and is not flat; affects a stated result.
- **Misprint** in Stacks (`stacks-limits`) at Lemma 32.20.4 (0EY3), p. 54: the source writes the open as `U ⊂ U′ ⊂ X`; it should be `U ⊂ U′ ⊂ S`, since `X` is the scheme over `U′`; affects nothing.
