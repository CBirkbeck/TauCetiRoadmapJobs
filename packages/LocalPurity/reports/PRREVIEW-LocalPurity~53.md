# Review of LocalPurity (pull request #1854 at f743cc2)

**Verdict:** needs changes

This is a full review. The folder changed by 942 lines since `63ceb10`. Eight of the nine previous findings are repaired; the push gate still fails on `outside-folder` (R02, the previous R06). The rewrite leaves three Stacks results that the §1.3 routes depend on with no owner (R01). LocalPurity at #1808's head states those three results as targets, and #1808 conflicts with this head in this folder (R03).

## R01 (P1) — §1.3 routes rest on four Stacks results that nothing owns

- **Location.** `TauCetiRoadmap/LocalPurity/README.md` lines 352–358:
  - "specialize formal module gluing along `A → Â` … (More on Algebra, Proposition 15.91.16 (05ER)) … The target here is the finite-morphism specialization, not a second general gluing theory";
  - "use formal-section comparison (… 52.12.7 (0EII)) and its finite-locally-free completion criterion (Lemma 52.15.1 (0EKP))".

  The §1.3 *Needs:* line (362–366) names none of these.
- **Claim.** Two targets this roadmap owns depend on results that are not targets here, not in a named supplier section, and not pinned declarations:
  - *finite_extend_of_completion* (0BLH) depends on formal glueing (05ER) and its preservation of properties (05EU);
  - *completion_fullyFaithful_of_localCohomology* (0EKS) depends on 0EII and 0EKP. The Stacks proof of 0EKS is 0EKP followed by 0EII (`stacks-0EKS` lines 2200–2202), so all of that target's content is unowned.

  The phrase "not a second general gluing theory" points to a first owner, and there is none.

  PurityForFlatCohomology consumes "LocalPurity §1.3 (formal-section comparisons on punctured spectra)" (its README line 1225, at its open head). This head does not state that comparison.
- **Witness.**
  - `05ER`, `0EII` and `0EKP` occur nowhere in the pinned Mathlib or Tau Ceti.
  - SchemeAndStackFoundations §4.8 (main and this head) states no completion criterion.
  - AdicSpacesPartIII §F0.8 on main owns only Lemma 15.91.17 (0ALK), README line 3873.
- **Repair.** In §1.3, add three "Prove" targets with the hypotheses of their tags. LocalPurity at #1808's head (README lines ~370–440) already words them this way.
  - *formalGlueing_equiv* (05ER with 05EU): for a flat `R → S` and `I = (f_1, …, f_t)` with `R/I → S/IS` bijective, `Can` and `H⁰` are quasi-inverse equivalences between `R`-modules and glueing data (05EL). Finiteness, finite presentation and flatness hold for `M` iff they hold for `M ⊗_R S` and every `M_{f_i}`. Both functors are compatible with `⊗`, hence with algebras and finite algebras.
  - *formalSections_of_localCohomology* (0EII): `A` Noetherian and `f`-adically complete, `f ∈ 𝔞`, `M` finite, and `H¹_𝔞(M)`, `H²_𝔞(M)` killed by a power of `f`. Then `Γ(U, M~) → lim Γ(U, M~/fⁿM~)` is bijective, where `U = Spec A ∖ V(𝔞)`.
  - *completion_fullyFaithful_of_sections* (0EKP): conditions (1) ⇒ (2) ⇒ (3) ⇔ (4) of the tag.

  Then:
  - add three rows to the Stacks alignment table;
  - list the three targets in the §1.3 *Needs:* line and in the routes of 0BLH and 0EKS;
  - add the following discriminating Checks. I computed each this round.
    - **05ER.** `R = ℤ`, `S = ℚ`, `f_1 = p`: `R/pR = 𝔽_p → S/pS = 0` is not bijective, and `Can(𝔽_p) = (𝔽_p ⊗ ℚ, (𝔽_p)_p) = (0, 0) = Can(0)`. So the bijectivity hypothesis cannot be dropped.
    - **0EII, hypothesis fails.** `A = k⟦x, y⟧`, `𝔞 = 𝔪`, `f = x`, `M = A`: in `H²_𝔪(A)`, `xⁿ · x^(−n−1)y⁻¹ = x⁻¹y⁻¹ ≠ 0` for every `n`, so no power of `x` kills `H²_𝔪(A)`. Correspondingly, `Γ(U, 𝒪/x) = k((y)) ≠ k⟦y⟧`: `y⁻¹` is not in the image of `A`, and the conclusion fails.
    - **0EII, hypothesis holds.** `A = k⟦x, y, z⟧`, `f = z`: `H¹ = H² = 0`, and the conclusion holds.

## R02 (P3) — Gate `outside-folder`: two files outside the declared folders (previous R06, not repaired)

- **Location.**
  - `Completed/ArithmeticDirichletSeries/README.md`: 1 line changed ("`LFunctions` consumes this package alongside its own character-specific continuation").
  - `TauCetiRoadmap/SymplecticGeometry/README.md`: 3 lines changed (the CG6 sentence).
- **Claim.** The pull request edits two roadmap folders that the brief does not declare as its own, so neither gets a review. The gate fails, and no folder of this pull request can be accepted while it does.
- **Witness.** With the 17 declared folders excluded, `git diff --stat origin/main...HEAD` lists exactly these two files (4 insertions, 4 deletions). The worker's gate and this round's rerun both report them under `outside-folder`.
- **Repair.** Move the two edits to a pull request of their own, or declare both folders as this pull request's own. Then rerun the gate.

## R03 (P3) — #1808 rewrites this folder differently and conflicts with this head, but the description calls it independent

- **Location.**
  - The description's merge-order paragraph: "#1808 is independent of this pull request."
  - `TauCetiRoadmap/LocalPurity/README.md` and `Suggested.lean`.
- **Claim.** Both pull requests replace this folder, with different text, so whichever merges second has to be rebased. Neither says which one that is. The two versions differ in substance: #1808's §1.3 owns formal glueing, formal sections and the completion criterion (R01), and this head's does not.
- **Witness.**
  - The overlap report: "#1808 and #1854 conflict in … `TauCetiRoadmap/LocalPurity/README.md`, `TauCetiRoadmap/LocalPurity/Suggested.lean`".
  - `diff` of #1808's head (`d724946`) against this head: 794 differing README lines, and module docstring lines 14–18 of `Suggested.lean`.
- **Repair.**
  - Replace "#1808 is independent" by a stated order for this folder. Either drop LocalPurity from one of the two pull requests, or rebase this folder on #1808's §1.3. The second option also repairs R01.
  - #1807 (`5004f71`) also changes this folder, but its order (#1807 → this pull request) is stated and the overlap report finds no conflict.

## R04 (P3) — *Needs:* lines omit inputs that their routes use and that the pins or a supplier provide

- **Location.**
  - §1.3 *Needs:* (README 362–366) and §1.4 *Needs:* (381).
  - §2.1, lines 431–432: "`A ⧸ Ideal.span {f}` regular of dimension `d − 1 ≥ 2` (`TauCeti.IsRegularLocalRing.quotient_span_singleton`)".
  - §2.2, lines 484–486 and *Needs:* 487–490: "the local extensions glue by *restrictOpen_fullyFaithful_of_depth*".
- **Claim.** Each item below is a step of a stated route with no matching entry in the *Needs:* line.
  - (a) The proof of 0BLI chooses a finite `Z′ → X′` "by Zariski's main theorem" (`stacks-0BMA` lines 2296–2297).
  - (b) The proof of 0BLL descends étaleness along `A → Â` (lines 2429–2430).
  - (c) The reductions to `Â` in 0BM6 and 0BLS carry the `H¹_𝔪`/`H²_𝔪` hypotheses to `Â` by flat base change of local cohomology (lines 2348–2349, 2453–2454).
  - (d) `quotient_span_singleton` concludes only `IsRegularLocalRing (R ⧸ span {x})` (elaborated this round); it says nothing about dimension.
  - (e) *finiteEtale_extend_of_regular_codimTwo* glues objects, but `Scheme.Cover.glueMorphisms` glues only morphisms.
- **Witness.** For (d), `#check @TauCeti.IsRegularLocalRing.quotient_span_singleton` gives `x ∈ maximalIdeal R → x ∉ maximalIdeal R ^ 2 → IsRegularLocalRing (R ⧸ Ideal.span {x})`, with no dimension conclusion.
- **Repair.** Add to the *Needs:* lines:
  - (a) Mathlib `Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean`: `f.toNormalization` is an open immersion for `f` locally quasi-finite, of finite type, separated and quasi-compact (instance at line 358). Also name the passage to a finite `Z′` (More on Morphisms, Lemma 37.43.3, as the Stacks proof cites it) as a step of *restrictHypersurface_fullyFaithful_of_completion*.
  - (b) Mathlib `Algebra.Etale.of_etale_tensorProduct_of_faithfullyFlat` (`Mathlib/RingTheory/Etale/Descent.lean:79`).
  - (c) SchemeAndStackFoundations §2.7 `localCohomology_flat_baseChange`, at line 3507 of its README on main.
  - (d) Mathlib `ringKrullDim_quotient_span_singleton_succ_eq_ringKrullDim_of_mem_jacobson` (`Mathlib/RingTheory/KrullDimension/Regular.lean:122`).
  - (e) Mathlib `AlgebraicGeometry.Scheme.GlueData` (`Mathlib/AlgebraicGeometry/Gluing.lean:91`), and `Scheme.Opens.stalkIso` for the stalks of an affine open.

  For (d), the route then reads `dim A/(f) + 1 = d`. On `A = k⟦x, y, z⟧`, `f = z` this gives `dim k⟦x, y⟧ = 2`.

## Previous findings

- **R01 (stand-ins) — repaired.**
  - `Suggested.lean` line 2: `import TauCeti.AlgebraicGeometry.FiniteEtale.PuncturedSpectrum`.
  - Line 35 concludes `TauCeti.IsLocalRing.PurityHolds A`; lines 60 and 73 conclude `(TauCeti.FiniteEtaleScheme.pullback U.ι).EssSurj`.
  - The five private declarations are gone, and "prototype … not at this roadmap's pin" is gone from the README.
- **R02 (Tau Ceti said to lack this material) — repaired.**
  - README 15–20 now names what Tau Ceti supplies, and Layer 0 is deleted.
  - §1.1 is notation over Tau Ceti's carriers. §1.2 owns only the essential surjectivity half of 0BM9.
  - §2.1 starts at `TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two` (lines 428–429), and §2.2 globalizes `fullyFaithfulPullbackιOfTwoLeDepth` (475–476).
  - The 0BM8 scheme form is dropped with a correct reason: `IsFinite` extends `IsAffineHom` (pinned `Mathlib/AlgebraicGeometry/Morphisms/Finite.lean:41`).
- **R03 (SchemeAndStackFoundations for 0AFS, depth, normality) — repaired.** Convention 4 (101–102) reads "its depth is Mathlib's `IsLocalRing.depth (ModuleCat.of A A)`". The Tau Ceti contracts at 184–192 name `isRegularRing_of_isRegularLocalRing`, `IsRegularRing.isIntegrallyClosed` with its module, and `depth_eq_ringKrullDim`.
- **R04 (padding) — repaired.** `Suggested.lean` declares only the four headlines.
- **R05 (`readme-ids-missing`) — repaired.** The gate reports `readme-ids-missing=0`, and targets without a declaration are in italics (Convention 6).
- **R06 (`outside-folder`) — not repaired.** It is R02 above.
- **R07 (Checks) — repaired.** §1.1 has 3 Checks (263–275) and §1.2 has 4 (309–326).
- **R08 (shape, wording) — repaired.**
  - `## Exact supplier contracts` is at line 122, `## How to read the build` at 227, `### Examples` and `### Dependencies` at 383/398 and 503/517, and `## Downstream consumers` at 552.
  - A grep for "prototype", "now", "current", "removed" or "round" finds nothing.
- **R09 (locators) — repaired.**
  - Line 370 reads "Lemma 58.20.6 (0BLS)". References 590–593 cite SGA 1 X Corollaires 3.2 and 3.3, and lines 478–481 cite Corollaire 3.3 at the target.
  - The alignment row keeps "—" in its Stacks column, which is correct: there is no Stacks tag.

## Verified sound

**Gate and build.**
- The gate was rerun at `f743cc2`. Every text check is 0 except `outside-folder` (R02). In particular `readme-ids-missing`, `statement-hygiene`, `sorry-data`, `set_option`, `imports`, `stray-files` and `depcheck` are all 0.
- The rerun's summary line stops before the build step. The worker's gate reports `build=0`, and my own elaboration below agrees.
- `lake env lean TauCetiRoadmap/LocalPurity/Suggested.lean` gives exactly 4 warnings, `declaration uses 'sorry'`, at lines 34, 45, 58 and 69.
- The dependency check prints `depcheck: 236 roadmaps, 2265 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- The suppliers (Mathlib, Tau Ceti, SchemeAndStackFoundations) are on main, and LocalPurity is on main. The README names no open roadmap as a supplier; PurityForFlatCohomology appears only as a consumer.
- Folder contents: README, `Suggested.lean`, `metadata.toml`, and the generated `STATUS.md`/`PROGRESS.md`, which are unchanged from main.

**Signature check.** One scratch file was elaborated once: a copy of `Suggested.lean` with `#check @name` for all 4 declarations and 62 cited library names.
- Each elaborated type matches its README statement.
- No binder is lost: clause (2) keeps `[Module.Finite A B] [Module.IsTorsionFree A B]`, `hnormal` and `hpunct`; `finiteEtale_extend_of_purity` keeps `[IsNoetherian X]`; `…_regular_codimTwo` keeps `[IsLocallyNoetherian X]`.
- With `pp.fullNames`, `maximalIdeal` in clause (2) is `IsLocalRing.maximalIdeal`. The full names are `TauCetiRoadmap.LocalPurity.IsLocalRing.purityHolds_of_isRegularLocalRing` and `TauCetiRoadmap.LocalPurity.Algebra.etale_of_finiteNormal_of_isRegularLocalRing`, which agree with Convention 6. The citation resolver's two "found nowhere" leads are these, this roadmap's own names.
- Nothing in the file changed.

**Padding probe.** `exact?` fails to close clause (1), clause (2) and 0EY7 in a scratch file without the roadmap's own declarations. `…_regular_codimTwo` has the same conclusion as 0EY7 and is no weaker. No pinned declaration states `EssSurj` of a finite-étale restriction: a grep for `EssSurj` under `TauCeti/AlgebraicGeometry` finds none. Nothing is padding.

**Library declarations opened (66 `#check`s, all resolved at the pins: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`).** 43 Tau Ceti declarations, among them:
- `PurityHolds` (`FiniteEtale/PuncturedSpectrum.lean:63`), `restrictPunctured_faithful_iff` (:92), `restrictPunctured_faithful_of_one_le_depth` (:119);
- `puncturedSpectrum` (`PuncturedSpectrum.lean:52`), `puncturedSpectrum_eq_iSup_basicOpen` (:81), `isCompact_puncturedSpectrum_of_fg_maximalIdeal` (:111);
- `presheaf_map_leTop_bijective_of_isIntegral` (`PuncturedSpectrum/Sections.lean:110`), `…_of_isIntegrallyClosed` (:129), `isIso_appTop_pullback_fst_puncturedSpectrum` (:190);
- `extends_iff_sections_finiteEtale` (`FiniteEtale/Extension.lean:111`, hypothesis depth `≥ 2`);
- `finiteNormalPuncturedEtale` (`FiniteNormal.lean:71`: finite, torsion free, normal at all primes, `IsEtaleAt` off `𝔪`), `restrictPuncturedSpec` (:132), `restrictPuncturedSpec.fullyFaithful` (:204: Noetherian, integrally closed domain, `2 ≤ dim`);
- `fullyFaithfulPullbackιOfTwoLeDepth` (`FullyFaithful.lean:105`) and `…OfIsLocalRing` (:120);
- `equivOver` (`MorphismProperty.lean:39`), `pullbackCompEquivOver` (:46), `finiteEtaleCommAlgCatOpEquivFiniteEtaleScheme` (`Basic.lean:171`);
- `etale_of_finiteNormal_of_ringKrullDim_eq_two` (`RegularLocalRing/Purity.lean:75`: normal at maximal ideals, unramified off `𝔪`), `etale_of_isUnramifiedAt_of_two_le_ringKrullDim` (`Etale/Purity.lean:70`);
- `flat_of_isCohenMacaulay` (`MiracleFlatness.lean:72`), `flat_of_normal_dim_two` (:90), `free_of_normal_dim_two` (:104);
- `etale_iff_traceForm_nondegenerate` (`Discriminant.lean:66`), `etale_iff_isUnit_discr` (:122, any commutative base), `isUnit_discr_localization_iff` (:144);
- the four `…_prod_residueField` lemmas (`ProdResidueField.lean:82, 133, 147, 153`);
- `IsRegularLocalRing.isDomain` (`Basic.lean:164`), `quotient_span_singleton` (:188), `isRegularRing_of_isRegularLocalRing` (`ProjectiveDimension.lean:441`), `IsRegularRing.isIntegrallyClosed` (`Normal.lean:55`, explicit `R`), `depth_eq_ringKrullDim` (`CohenMacaulay.lean:110`), `isCohenMacaulay` (:125);
- `IsLocalRing.two_le_depth_of_isIntegrallyClosed` (`CohenMacaulay/Normal.lean:144`, root namespace `IsLocalRing`, as the README says);
- the Serre criterion (`SerreCondition/Normal.lean:214`), `Module.IsCohenMacaulay` (`CohenMacaulay/Basic.lean:67`) and `Ring.IsCohenMacaulay` (`CohenMacaulay/Ring.lean:40`).

19 Mathlib declarations:
- `IsRegularLocalRing` (`RegularLocalRing/Defs.lean:52`, `spanFinrank 𝔪 = dim`) and `IsRegularLocalRing.of_isRegularRing_of_isLocalRing`;
- `IsLocalRing.depth` (an Ext-vanishing supremum valued in `ℕ∞`, `Depth/Basic.lean:65–71`, tagged 00LI);
- `Algebra.IsEtaleAt` (formally étale localization, `Etale/Locus.lean:35`);
- `IsIntegralClosure.finite` (needs separable `L/K`, `A` Noetherian integrally closed), `AdicCompletion.flat_of_isNoetherian`, `localCohomology`, `Scheme.Cover.glueMorphisms`, `MorphismProperty.Over.pullback`, `IsLocallyNoetherian`, `IsNoetherian`, `IsAffineOpen` and `IsLocalRing.closedPoint`.

**Cross-roadmap citations resolved.**
- SchemeAndStackFoundations, on main and at this head: §0.9 (heading 848, `finite_presentation_limits` 859), §0.14 (1068, *henselian_finiteEtale_equivalence* 1080), §2.7 (3482, `localCohomology_module_comparison` 3499, `depth_localCohomology_vanishing` 3512), §4.7 (5339) and §4.8 (5383, `CoherentFormalModule` 5393). The descriptions in the contracts match.
- Downstream:
  - PurityOfBranchLocus at this head cites §2.1 and `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` (lines 55–57, 253).
  - AbhyankarLemma on main cites §§2.1–2.2 and its four names (lines 55–58, 265–268).
  - PurityForFlatCohomology (open) cites §§1.3, 2.1, 2.2 (lines 104–106, 594–598); its line 1225 is part of R01.
  - CrystallineCohomology (open) cites §§2.1–2.2, `finiteEtale_extend_of_regular_codimTwo` and fully faithful restriction.
  - All resolve at this head.

**Overlaps and ownership.**
- No id this README cites is dropped by an open pull request, none is defined only by an open revision, and this pull request drops no cited LocalPurity id. Layer 0 is gone, but no roadmap cites §0.x.
- A search by tag (0BMA, 0EY7, 0BM9, 0BLM, 0BLS, 0BLH, 0BLL, 0EL8, 0BM6, 0BLJ, 0EKS, 0BLI) over main and all open heads finds no second owner, only consumers and LocalPurity's own versions at #1807 and #1808 (R03).
- `Suggested.lean` reuses no fully qualified name of another roadmap.

**Provenance claims.** I opened the external repository at commit `d28f90d` (author's public GitHub).
- `library/Pcf/Stacks/Purity/` contains `Tag0BM9Equivalence.lean`, `HypersurfaceLiftingComplete.lean`, `Tag0BMA.lean` and `Tag0BMAClauses.lean`.
- `finiteNormalAlgebraToPuncturedCover_essSurj` and `puncturedFiniteEtaleCoverEquivalence` (both with `2 ≤ ringKrullDim R` over a Noetherian integrally closed local domain) are in `Tag0BM9Equivalence.lean`.
- `puncturedSpectrumPurity_of_isRegularLocalRing` is in `Tag0BMA.lean`. None of these uses `sorry`.

**Seeded sample: every locator re-read at its source line.**
- **1.1.**
  - 0BM7: `stacks-0BMA` line 2357; Section 58.20 defines purity as essential surjectivity.
  - 0BL6 (Section 58.5): line 529.
  - SGA 2 X Définitions 3.1–3.2: `sga2` lines 3377–3384, printed p. 94. *Pur* means an equivalence for every open `V`, so a field is not *pur*, as the first §1.1 Check says.
- **1.2.** 0BM8 (line 2366, p. 50), 0BLK (2380, p. 51) and 0BM9 (2391, p. 51). The 0BM9 statement as written is refuted by `A × A/𝔪` (Source issues).
- **1.3.**
  - 0BLF, 0BLH, 0BLI, 0BM6 and 0BLJ: lines 2245, 2266, 2283, 2342, 2351.
  - 0BLL: line 2421. 0EL8: line 2028.
  - 0EKS, 0EII and 0EKP: `stacks-0EKS` lines 2193, 1923, 2094.
  - 05ER and 05EU: `stacks-09ZL` lines 11528, 11624. 09ZL: line 1758.
  - Each README paraphrase has the tag's hypotheses: henselian pair, depth `≥ 3`, `f`-adic completeness, annihilation of `H¹`/`H²`.
- **1.4.**
  - 0BLS: line 2449. 0BLM: line 2459, depth `≥ 3` only, no henselian hypothesis.
  - The remark before 0EK6: lines 2431–2433, which support the second §1.4 Example.
- **2.1.**
  - 0BMA: line 2503, p. 53.
  - SGA 2 X Théorème 3.4 (i): `sga2` line 3390.
  - SGA 1 X Corollaire 3.2: `sga1` lines 8370–8374. It is for local `B` quasi-finite over `A`, proved there only for `dim A = 2` (lines 8380–8388), as the README says.
  - 00NP, 00NQ, 0AFS, 0567 and 031S: `stacks-00R4` lines 11920, 11925, 12566, 20195, 20161.
- **2.2.**
  - 0EY7: `stacks-0BMA` line 2604, "open immersion of Noetherian schemes such that purity holds for 𝒪_{X,x}, x ∉ U".
  - 0BQ5 and 0EY3: `stacks-0BQ5` lines 2571, 2627.
  - SGA 2 X Proposition 3.3: `sga2` line 3386.
  - SGA 1 X Corollaire 3.3: `sga1` line 8394, regular `X` and codimension `≥ 2`.
- The README flags no locator as unverified.

**Adversarial pass.** Values were computed by hand, except the rows marked Lean.

| Statement | Instances tried | Values computed | Result, change |
| --- | --- | --- | --- |
| Clause (1) `IsLocalRing.purityHolds_of_isRegularLocalRing` | `d = 0` (field); `ℤ_(p)`; `k⟦x,y⟧`; `ℤ_p⟦x⟧`; `k[x²,xy,y²]_(0)` | field: `2 ≤ 0` false (and purity holds vacuously, `U = ∅`); `ℤ_(p)`: `hd` false, and `ℚ(√p)` has normalization `ℤ_(p)[√p]` with `disc = 4p ∉ A^×`, so purity fails; `k⟦x,y⟧`: `U ⊔ U ↦ A × A`; `ℤ_p⟦x⟧`: `d = 2`, covered; cone: `edim = 3 > 2 = dim`, so not regular and purity fails | sound; `hd` and regularity are both needed |
| Clause (2) `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` | `B = 0`; `A × κ`; `A[z]/(z²−x)`; `A[z]/(z²−u)`, `u ∈ A^×`; `ℤ_(p)[√p]` | `0`: no primes, so the hypotheses are vacuous and `0` is étale; `A × κ`: `x·(0,1) = 0`, so not torsion free, and dropping the hypothesis makes it false (pinned `not_flat_prod_residueField`); `z²−x`: at `(z)` over `(x) ≠ 𝔪`, `x = z²`, so `hpunct` fails; `z²−u`: `disc = 4u ∈ A^×`, étale; `ℤ_(p)[√p]`: `d = 1`, `hd` false, `disc 4p`, not étale | sound; `A`, `B` share universe `u` (Convention 1) |
| 0EY7 `finiteEtale_extend_of_purity` | `U = ⊤`; `Spec ℤ_(p)`, `U = {η}`; `Spec(k × k)`, `U` one point; `U = ∅` | `⊤`: no `x ∉ U`, pullback along `⊤.ι` is an equivalence; `{η}`: purity fails at `𝔪` and the conclusion fails (`ℚ(√p)`); `k × k`: the other stalk is `k` with `U_x = ∅`, purity holds, and `V ↦ V ⊔ ∅` extends; `∅`: `FÉt(∅) = {∅}` extends | sound |
| `finiteEtale_extend_of_regular_codimTwo` | `𝔸² ∖ 0`; `𝔸² ∖ {x=0}`; cone minus vertex; `𝔸³ ∖ L`; `U = X` | origin regular, `dim 2`, holds; generic point of the line has `dim 1`, so the hypothesis fails and the conclusion fails (`t² = x`); vertex not regular, hypothesis and conclusion fail (`±1` cover); `L`: `dim 2` at the generic point, `dim 3` at closed points, holds; `U = X` vacuous | sound; both conditions are needed |
| *restrictPuncturedSpec_essSurj* (corrected 0BM9, no dimension bound) | field; `ℤ_(p)`; `k⟦x,y⟧` | field: `U = ∅`, `∅ = ` restriction of `Spec A`; `ℤ_(p)`: `Spec ℚ(√p) ↦ ℤ_(p)[√p]`, Eisenstein, so a DVR, torsion free, étale at `(0)`; `k⟦x,y⟧`: `U ⊔ U ↦ A × A`; the zero algebra lies in the category, so `∅` is hit | sound in every dimension |
| *finiteNormalEquiv*, global sections as quasi-inverse | `k⟦x,y⟧`; `ℤ_(p)` | `Γ(U ⊔ U) = A × A` (depth 2); `ℤ_(p)`: `Γ(Spec ℚ(√p)) = ℚ(√p)`, not finite over `A` | needs `dim ≥ 2`, which is stated |
| Convention 5: Stacks 0BM9 and 0BMA (2) as written | `A = k⟦x,y⟧`, `B = A × κ` | `B_{𝔭×κ} = A_𝔭`, `B_{A×0} = κ`: normal; `Spec B ×_X U = U ⊔ ∅`: étale; `Γ(U) = A ≠ A × κ`; not flat | both Stacks statements are false; the correction is needed |
| Convention 3, normal local ring | `k[x,y]/(xy)` at the origin; `A × A` | the first is not a domain, so not normal; the second is normal but not local | agrees with 00GV |
| Convention 4, depth | `k⟦x,y⟧`; `k⟦x,y,z⟧/(z²,xz,yz)` | depth `2 = dim`; `z` lies in the socle, so depth `0 < dim 2` | agrees with 00LI |
| §1.1 statements | field; `k⟦x,y⟧`; `ℤ_(p)` | faithful iff `dim > 0` (pinned iff), field: projections `A×A → A` agree over `∅`; `U = D(x) ∪ D(y)`, `Γ = A`, not affine; `depth ℤ_(p) = 1 < 2`, so no full faithfulness claim | sound |
| 0BLS / 0BLM (§1.4) | `k⟦x,y,z⟧`, `f = z`; complete normal domain with `dim ≥ 3`, `depth 2`; `f = 0` | `H¹ = H² = 0` (depth 3); `depth A_𝔭 + dim A/𝔭 ≥ 3` for `𝔭 ≠ 𝔪`, so `H¹_𝔪`, `H²_𝔪` have finite length and are killed by `𝔪ⁿ ∋ fⁿ`; `f = 0`: `0¹` kills everything, `X₀ = X`, and the statement is trivially true | sound; Example 2 is correct |
| *restrictOpen_fullyFaithful_of_depth* | `X = Spec k`, `U = ∅`; `𝔸² ∖ 0` | depth `0 < 2`, hypothesis fails, and the conclusion fails (two projections); depth 2, `Γ(U) = k[x,y]` | the hypothesis is needed and present |
| *spread_from_localScheme* (0BQ5/0EY3) | `S = Spec ℤ`, `U = ∅`, `s = (p)` | `V = ∅`; a finitely presented `Y/ℤ_(p)` spreads to some `D(n)`, `p ∤ n` | sound; retrocompactness is stated |
| §1.1 Checks (3) | as written | projections; `disc 4p`; `Γ(U) = A` with `depth 2` | all correct |
| §1.2 Checks (4) | as written | `A×A` in the category; `z²−x` ramified at `(z)`; `A×κ`: `x·(0,1)=0`; `ℤ_(p)[√p]`: `Γ = ℚ(√p)` | all correct and discriminating |
| §2.1 Checks (3) | as written | `A×κ` not flat; cone: `edim 3`, `±1` free off 0, `char ≠ 2`; `ℤ_(p)[√p]`, `disc 4p` | all correct |
| §2.2 Checks (3) | as written | `ℚ(√p)` over `η`; origin of `𝔸²`, depth 2; `U = X` | all correct |
| Examples, Layers 1–2 (6) | as written | `k⟦x,y,z⟧`: henselian (complete), depth 3; 0EK6 remark; `z² − x` ramified; induction runs once; `𝔸³ ∖ L`; `t² = x` over `𝔸² ∖ {x=0}`, `dim 1` | all correct |
| Clauses (1) and (2): padding probe (Lean) | `exact?` on clause (1), clause (2) and 0EY7 | all three fail ("could not close the goal") | not padding |
| §1.3 routes (05ER, 0EII, 0EKP) | owner search | no target, supplier section or pinned declaration | R01 |

## Not verifiable

- Ownership against open pull requests was checked through the roadmap index at the heads (`roadmaps grep`, overlap report). LocalPurity's own versions at #1807 and #1808 were read only for R03; they have their own reviews.
- EtaleHomotopyTypes (open) addresses two contracts to LocalPurity (`gap:relative-etale-depth`, `gap:relative-homotopical-purity`). They are a consumer's declared gaps, which the intake announces on this roadmap's job. They are neither in this folder's change nor findings here.
- Every sampled text was readable in the cache (Stacks chapter PDFs, SGA 1 arXiv math/0206203, SGA 2 arXiv math/0511279); nothing in the sample was unreadable.

## Source issues

- **Error** in stacks-0BMA at Lemma 58.20.3 (0BM9), p. 51: the source says global sections give an equivalence onto all finite normal A-algebras étale over U; it should restrict to A-torsion-free algebras, since A × A/𝔪 lies in that category and is no Γ(V, 𝒪_V); affects a stated result.
- **Error** in stacks-0BMA at Lemma 58.21.3 (0BMA), part (2), p. 53: the source says every finite normal B with finite étale restriction to the punctured spectrum is étale; it should assume B torsion free over A, as A × A/𝔪 is such a B and not flat; affects a stated result.
- **Misprint** in stacks-0BQ5 at Lemma 32.20.4 (0EY3), p. 54: the source takes the open U′ inside X; it should be inside the base scheme S of Lemma 32.20.3; affects nothing.
- **Gap** in stacks-0BMA at Lemma 58.19.4 (0BLI), p. 49: the source obtains a finite Z′ → X′ with W′ = Z′ ×_{X′} U′ from Zariski's main theorem and omits the detail; it should show why the restriction to U′ is exactly W′; affects the proof.
- **Gap** in stacks-0BMA at Lemma 58.20.2 (0BLK), p. 51: the source omits the implication (2) ⇒ (1); it should construct Y as Spec B and check its restriction is V; affects nothing (Tau Ceti proves the lemma).
- **Gap** in sga2 at Exposé X, Proposition 3.3, p. 94: the source states the pointwise criterion for purity of a pair and leaves its proof to the reader; it should prove or cite it; affects nothing (the roadmap's route is Stacks 0EY7 with gluing).
