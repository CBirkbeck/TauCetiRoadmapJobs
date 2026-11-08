# Review of LocalPurity (pull request #1854 at c07dda7)

**Verdict:** needs changes

Within this folder the pull request changes only the README's supplier for Stacks 0AFS (from
PurityOfBranchLocus §0.3 to SchemeAndStackFoundations §4.13). This is a full review of the folder.
The common thread of R01–R04: much of Layers 0–1 and the dimension-two case of §2.1 is already
proved in Tau Ceti at the pin. Neither the README nor `Suggested.lean` reflects that, and the new
0AFS citation points at a roadmap for a pinned instance.

## R01 (P2) — The headlines are stated through private stand-ins for pinned Tau Ceti definitions

- **Location.** `TauCetiRoadmap/LocalPurity/Suggested.lean` lines 63–96 define `finiteEtale`,
  `FEt`, `FEt.pullback`, `puncturedSpectrum` and `PurityHolds`. The headlines at lines 104–137 are
  stated through them. README lines 209–212: "When replacing the prototype `FEt U` by Tau Ceti's
  newer `FiniteEtaleScheme U` (not at this roadmap's pin), identify the carrier equivalence…".
- **Claim.** The pinned Tau Ceti has all five objects, so 0BMA (1) and 0EY7 are forced through a
  second carrier. The README's own Scope (lines 58–66) promises "builds no second carrier" and
  cites `TauCeti.FiniteEtaleScheme` at the pin, so lines 209–212 are false and contradict it. The
  README also names the end theorems `IsLocalRing.purityHolds_of_isRegularLocalRing` and
  `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` (lines 42–44, cited under these names by
  AbhyankarLemma and PurityOfBranchLocus), but the Lean file declares them without those
  namespaces.
- **Witness.** These are all at the pin:
  - `TauCeti/AlgebraicGeometry/FiniteEtale/PuncturedSpectrum.lean:63`, `def PurityHolds : Prop := (restrictPunctured R).EssSurj`;
  - `TauCeti/AlgebraicGeometry/PuncturedSpectrum.lean:52`, `def puncturedSpectrum`;
  - `TauCeti/AlgebraicGeometry/FiniteEtale/Fiber.lean:51`, `pullback`.

  The open PurityForFlatCohomology README, lines 86–90, already cites them as realising
  LocalPurity §1.1.
- **Repair.**
  - Delete the five declarations.
  - Import `TauCeti.AlgebraicGeometry.FiniteEtale.PuncturedSpectrum`.
  - State the headlines on the Tau Ceti carriers, in the namespaces the README uses:

    ```lean
    theorem IsLocalRing.purityHolds_of_isRegularLocalRing (A : Type u) [CommRing A]
        [IsRegularLocalRing A] (hd : 2 ≤ ringKrullDim A) : TauCeti.IsLocalRing.PurityHolds A := by
      sorry

    theorem AlgebraicGeometry.finiteEtale_extend_of_purity {X : Scheme.{u}} [IsNoetherian X]
        (U : X.Opens) (h : ∀ x : X, x ∉ U → TauCeti.IsLocalRing.PurityHolds (X.presheaf.stalk x)) :
        (TauCeti.FiniteEtaleScheme.pullback U.ι).EssSurj := by
      sorry
    ```

    State `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` with its current binders.
  - Delete the sentence at README lines 209–212.

  I tested this: a scratch file with these three statements (plus the global corollary of R09)
  elaborates at the pins with `sorry` as the only warning, and `#check @…` shows every binder kept.

## R02 (P2) — The README says Tau Ceti lacks this material, and plans targets that are already proved at the pin

- **Location.** README lines 17–18: "None of them has finite étale covers of punctured spectra or
  local purity." Also "This roadmap owns" (lines 48–56) and the "Prove …" sentences of §0.1
  (135–143), §0.2 (154–165), §1.1 (182–189), §1.2 (196–209), the d = 2 step of §2.1 and
  `restrictOpen_fullyFaithful_of_depth` in §2.2.
- **Claim.** The sentence at lines 17–18 is false, and these targets duplicate pinned
  declarations. §0.2 also narrows 0BJF to a local base, although Stacks 49.3.1 (0BJF) states it
  for any finite locally free morphism and the pinned theorem holds over any commutative ring.
- **Witness.** Pinned `TauCeti/AlgebraicGeometry/FiniteEtale/Extension.lean:110–111` has
  `@[stacks 0BLK] theorem extends_iff_sections_finiteEtale`, the README's §1.2 name.
  `TauCeti/RingTheory/Etale/Discriminant.lean:122` has `etale_iff_isUnit_discr` with no
  `IsLocalRing` binder.
- **Repair.** Add "From Tau Ceti" supplier entries, by exact name and module, and replace each
  matching "Prove `X`" by a one-line citation. Keep the section numbers: consumers cite §§1.1,
  1.3, 2.1 and 2.2.

  | README target | Pinned Tau Ceti declaration (module) |
  | --- | --- |
  | §0.1 `flat_of_isCohenMacaulay` (00R4) | `TauCeti.Algebra.flat_of_isCohenMacaulay` (`RingTheory.RegularLocalRing.MiracleFlatness`, line 72) |
  | §0.1 `flat_of_normal_dim_two` | `TauCeti.Algebra.flat_of_normal_dim_two` (same module, line 90) |
  | §0.2 trace-form criterion | `TauCeti.Algebra.etale_iff_traceForm_nondegenerate` (`RingTheory.Etale.Discriminant`, line 66) |
  | §0.2 `etale_iff_isUnit_discr` | `TauCeti.Algebra.etale_iff_isUnit_discr`, any commutative base (line 122) |
  | §0.2 localization form | `TauCeti.Algebra.isUnit_discr_localization_iff` (line 144) |
  | §1.1 punctured spectrum, restriction, purity | `TauCeti.IsLocalRing.puncturedSpectrum`, `restrictPunctured`, `PurityHolds` (`AlgebraicGeometry.PuncturedSpectrum`, `AlgebraicGeometry.FiniteEtale.PuncturedSpectrum`) |
  | §1.1 API | `TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen`, `isCompact_puncturedSpectrum`, `restrictPunctured_faithful_of_one_le_depth` (and the sharper `restrictPunctured_faithful_iff`) |
  | §1.2 0BM8 | affine form `TauCeti.AlgebraicGeometry.Spec.presheaf_map_leTop_bijective_of_isIntegral` (`AlgebraicGeometry.PuncturedSpectrum.Sections`, line 110) |
  | §1.2 0BLK | `TauCeti.IsLocalRing.extends_iff_sections_finiteEtale` |
  | §1.2 0BM9 | the category `TauCeti.IsLocalRing.FiniteNormalPuncturedEtaleAlg` and full faithfulness `TauCeti.IsLocalRing.restrictPuncturedSpec.fullyFaithful` (`AlgebraicGeometry.FiniteEtale.FiniteNormal`, lines 88, 204) |
  | §2.1 (2) for d = 2 | `TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two` (`RingTheory.RegularLocalRing.Purity`, line 75) |
  | §2.1 Check `A × A/𝔪` | `TauCeti.IsLocalRing.not_flat_prod_residueField` (`RingTheory.Etale.ProdResidueField`, line 147) |
  | §2.2 affine full faithfulness | `TauCeti.FiniteEtaleScheme.fullyFaithfulPullbackιOfTwoLeDepth` (`AlgebraicGeometry.FiniteEtale.FullyFaithful`, line 105) |

  Keep as targets only what the pins lack:
  - 0BM8 in its scheme form;
  - the essential surjectivity half of the corrected 0BM9 (`finiteNormalEquiv`);
  - §§1.3–1.4;
  - 0BMA (1) in every dimension, and (2) for d ≥ 3;
  - §2.2 apart from the affine full faithfulness.

  Rewrite lines 12–18 to say what Tau Ceti has.

## R03 (P2) — The new supplier for 0AFS, depth `d` and normality restates pinned Tau Ceti results

- **Location.** These lines were changed by this pull request: README 33–40, 71–76, 270–271,
  286–291 and 326–329. Also Convention 4 (lines 116–117), Scope lines 77–81, and
  `Suggested.lean` lines 17–19: "Conditions whose Mathlib API does not exist at the pinned version
  (depth, Cohen–Macaulay) are not stated here".
- **Claim.** §§2.1–2.2 now wait on a SchemeAndStackFoundations §4.13 target (built through global
  dimension, Auslander–Buchsbaum and Koszul inputs) for three facts the pins already prove:
  - a regular local ring is a regular ring (0AFS);
  - a regular local ring of dimension `d` has depth `d`;
  - a regular local ring is normal.

  Depth and Cohen–Macaulayness also exist at the pins, so the `Suggested.lean` docstring is false.
- **Witness.**
  - `TauCeti/RingTheory/RegularLocalRing/ProjectiveDimension.lean:440–441`: `@[stacks 0AFS "second sentence"] instance isRegularRing_of_isRegularLocalRing`.
  - `…/RegularLocalRing/CohenMacaulay.lean:110`: `depth_eq_ringKrullDim`.
  - Mathlib `RingTheory/Depth/Basic.lean:78`: `IsLocalRing.depth`.
- **Repair.**
  - Cite, from Tau Ceti:
    - `TauCeti.isRegularRing_of_isRegularLocalRing` (`RingTheory.RegularLocalRing.ProjectiveDimension`);
    - `TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim` and `TauCeti.IsRegularLocalRing.isCohenMacaulay` (`RingTheory.RegularLocalRing.CohenMacaulay`);
    - for normality, `TauCeti.IsRegularRing.isIntegrallyClosed` (`RingTheory.RegularLocalRing.Normal`) with `TauCeti.IsRegularLocalRing.isDomain`.

    With these two imports, `IsDomain (Localization.AtPrime p) ∧ IsIntegrallyClosed (Localization.AtPrime p)`
    closes by `⟨inferInstance, inferInstance⟩` for every prime of a regular local ring (tested in
    scratch).
  - Convention 4: depth is Mathlib's `IsLocalRing.depth (ModuleCat.of A A)`, the form Tau Ceti's
    `extends_iff_sections_finiteEtale` uses. Cohen–Macaulay is Tau Ceti's `Module.IsCohenMacaulay`
    / `TauCeti.Ring.IsCohenMacaulay`.
  - Cite SchemeAndStackFoundations §§0.17 and 4.13 only for what the pins lack. Update the
    diagram line 34 and the *Needs* of §§2.1–2.2 accordingly.
  - Rewrite `Suggested.lean` lines 16–19.

## R04 (P3) — Padding in `Suggested.lean`

- **Location.** `Suggested.lean` lines 37–41 (`flat_of_normal_dim_two`), 46–49
  (`etale_iff_traceForm_nondegenerate`), 54–57 (`etale_iff_isUnit_discr`) and 126–128
  (`not_flat_prod_residueField`, which also mirrors the README Check `test_closed_point_factor`).
- **Claim.** Each one closes with a single library lemma.
- **Witness.** On a scratch copy:
  - `exact TauCeti.Algebra.flat_of_normal_dim_two hinj hdim` closes the first;
  - `exact TauCeti.Algebra.etale_iff_traceForm_nondegenerate K B` closes the second;
  - `exact TauCeti.Algebra.etale_iff_isUnit_discr A B b` closes the third;
  - `TauCeti.IsLocalRing.not_flat_prod_residueField` closes the fourth, once `¬ IsField A` is
    read off `hd`.
- **Repair.** Delete them from `Suggested.lean`, together with `section Layer0`. The README keeps
  them as citations (R02).

## R05 (P3) — Gate `readme-ids-missing` (4)

- **Location.** README line 187 `puncturedSpectrum_eq_iSup_basicOpen`, lines 251–252
  `finiteEtale_extend_of_hypersurface` and `finiteEtale_extend_of_localCohomology` (the former
  again at 285), and line 322 `finiteEtale_extend_of_regular_codimTwo`.
- **Claim.** The README presents these four names as this roadmap's declarations, but
  `Suggested.lean` declares none of them.
- **Witness.** The gate at c07dda7 reports `readme-ids-missing=4` with exactly these names.
- **Repair.**
  - Cite the first by its pinned name, `TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen`
    (R02).
  - State the other three in prose without a backticked name. For example, "the local Lefschetz
    extension theorem of §1.4", and at line 285 "§1.4 lifts the inductive extension".
  - Rerun the gate.

## R06 (P3) — Gate `outside-folder` (2)

- **Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 and
  `TauCetiRoadmap/SymplecticGeometry/README.md` lines 76–78.
- **Claim.** The pull request edits two roadmap folders that are not among its declared roadmap
  folders, so they get no review of their own.
- **Witness.** `git diff --stat origin/main...HEAD`, with the declared folders excluded, lists
  exactly these two files.
- **Repair.** Move the two edits to their own pull request, or declare both folders as this pull
  request's own so that each is reviewed.

## R07 (P3) — The §1.1 and §1.2 definitions lack discriminating Checks

- **Location.** §1.1 (lines 182–192) defines the punctured spectrum and `PurityHolds` and has no
  `**Checks.**` block. §1.2 defines `FiniteNormalPuncturedEtaleAlg` and has one Check (216–219).
- **Claim.** Each definition needs at least three Checks.
- **Witness.** The README has no Check block between lines 182 and 194, and exactly one bullet at
  lines 216–219.
- **Repair.** Add these Checks. Each was computed for this review.

  For §1.1:
  - **`A` a field.** The punctured spectrum is empty and purity holds. Restriction is not
    faithful: the two projections `A × A → A` agree over `∅`. So the depth `≥ 1` hypothesis of
    faithfulness cannot be dropped.
  - **`A = ℤ_(p)`, `p` odd.** `U = Spec ℚ`, and the cover `Spec ℚ(√p)` does not extend: an
    extension would be `ℤ_(p)[√p]`, whose discriminant `4p` is not a unit. So purity fails in
    dimension one, and §2.1 needs `2 ≤ dim`.
  - **`A = k⟦x, y⟧`.** `U = D(x) ∪ D(y)` is quasi-compact but not affine, since `Γ(U, 𝒪) = A`.

  For §1.2, over `A = k⟦x, y⟧` with `char k ≠ 2`:
  - **`A × A`** (the split cover) is in the category.
  - **`A[z]/(z² − x)`** is finite, normal and torsion free, but ramified at `(z)`, which lies over
    `(x) ≠ 𝔪`. It is excluded.
  - **`A × A/𝔪`** is excluded by torsion-freeness (the existing Check).

## R08 (P3) — README shape and timeless wording

- **Location.** The README has none of the following:
  - `## Exact supplier contracts` (the contracts are Scope bullets, lines 58–96);
  - `## How to read the build` (the table and diagram at lines 25–35 stand in for it);
  - `### Examples` or `### Dependencies` closing any layer;
  - `## Downstream consumers` (consumers appear at lines 20–23 and 98–100).

  It also has process wording: lines 209–212 ("prototype", "newer", "not at this roadmap's pin"),
  line 276 ("remains a separate corollary") and line 277 ("now gives").
- **Claim.** These depart from the house shape and the timeless rule.
- **Witness.** `grep '^## \|^### '` over the README lists none of the five headings.
- **Repair.**
  - Move the supplier bullets into `## Exact supplier contracts` with subsections `From Mathlib`,
    `From Tau Ceti` and `From TauCetiRoadmap.SchemeAndStackFoundations`.
  - Add a one-paragraph `## How to read the build`.
  - End each layer with `### Examples` and `### Dependencies`.
  - Put PurityOfBranchLocus §2.1 and AbhyankarLemma §§2.1–2.2 under `## Downstream consumers`.
  - Reword the three phrases.

## R09 (P3) — Locators: an uncited SGA 1 reference, the SGA 1 result actually proved, and a missing tag

- **Location.** README line 388 cites SGA 1, Exposé X, Théorème 3.1, and nothing in the body uses
  it. Line 322 marks `finiteEtale_extend_of_regular_codimTwo` as *API*, and the alignment row at
  line 362 gives "—". Line 252 cites "Lemma 58.20.6" without its tag.
- **Claim.** SGA 1 X 3.1 is purity of the branch locus, which is PurityOfBranchLocus' theorem. The
  SGA 1 result proved here is Corollaire 3.3: for regular locally Noetherian `X` and `Z` of
  codimension `≥ 2`, restriction of étale covers to `X ∖ Z` is an equivalence. Its essential
  surjectivity is `finiteEtale_extend_of_regular_codimTwo`, which requires regularity only along
  `X ∖ U`. The sources manifest already records Corollaire 3.3 for §2.2.
- **Witness.**
  - sga1 line 8394: Exposé X, Corollaire 3.3, printed p. 213.
  - sga1 line 8359: Théorème 3.1, p. 212, about a quasi-finite dominant morphism.
  - stacks-0BMA line 2449: Lemma 20.6 is tag 0BLS.
- **Repair.**
  - Cite "SGA 1, Exposé X, Corollaire 3.3, p. 213 (essential surjectivity; regularity required
    only along `X ∖ U`)" at `finiteEtale_extend_of_regular_codimTwo`, and in its alignment row.
  - Replace the Théorème 3.1 reference by Corollaire 3.3.
  - Write "Lemma 58.20.6 (0BLS)".

## Verified sound

**Gate and build.**
- I reran the gate at c07dda7. It reports `readme-ids-missing=4` and `outside-folder`. Two of the
  outside-folder entries are real (R05, R06); the other 32 are the pull request's declared
  folders. It reports `set_option`, sorry-data, imports, statement-hygiene, stray-files, depcheck,
  metadata and the remaining checks as 0.
- The dependency check prints `depcheck: 238 roadmaps, 2344 edges, 0 problem(s)`: no UPWARD or
  CYCLE line. LocalPurity's suppliers are Mathlib, Tau Ceti and SchemeAndStackFoundations (on
  main).
- `lake env lean` on `Suggested.lean` gives 7 warnings, all `declaration uses 'sorry'`.

**Signature check.** I ran `#check @…` for all 12 declarations in one scratch copy. Every
elaborated type keeps its binders and matches its README statement; nothing was lost from a
section `variable`. The repaired file of R01 also keeps all binders.

**Library declarations opened at the pins, with file and line.**
- Mathlib:
  - `IsRegularLocalRing` (`RegularLocalRing/Defs.lean:52`), `IsRegularRing` (:93) and
    `IsRegularLocalRing.of_isRegularRing_of_isLocalRing` (:115);
  - `IsLocalRing.depth` (`Depth/Basic.lean:78`, Ext-based, `ℕ∞`-valued);
  - `Module.IsTorsionFree` (`Module/Torsion/Free.lean:48`; for a domain this is the usual
    torsion-freeness);
  - `@[stacks 00H8]` at `IntegralClosure/GoingDown.lean:48`, `@[stacks 00ON]` at
    `KrullsHeightTheorem.lean:483`, `@[stacks 0BIL]` at `Trace/Basic.lean:501, 507`.
- 22 Mathlib names the README cites resolve by `#check`: `Algebra.discr`, `Algebra.traceForm`,
  `Algebra.trace_localization`, `Algebra.TensorProduct.basis`, `Module.free_of_flat_of_isLocalRing`,
  `Module.flat_of_isLocalized_maximal`, `Ideal.height_le_one_of_isPrincipal_of_mem_minimalPrimes`,
  `MorphismProperty.Over.pullback`, `IsLocalRing.closedPoint`, `AdicCompletion.flat_of_isNoetherian`,
  `localCohomology`, `Algebra.IsEtaleAt`, and others. A bare `IsNoetherian` is ambiguous at the
  root namespace; in §2.2 it means `AlgebraicGeometry.IsNoetherian`.
- Tau Ceti: the 24 declarations of R02 and R03, checked with `#check` in one scratch file and
  opened in their source files.
  `TauCeti.IsRegularLocalRing.isDomain` (`RegularLocalRing/Basic.lean:164`) and
  `quotient_span_singleton` (:188) are cited correctly.

**Cross-roadmap citations resolved.**
- At this head, every SchemeAndStackFoundations name the README cites is where it is cited (16
  names), including the new §4.13 `isRegularRing_of_isRegularLocalRing` and
  `IsRegularLocalRing.isCohenMacaulay` (lines 5658, 5691):
  - §0.6 `coherent_hartogs`;
  - §0.9 `finite_presentation_limits`;
  - §0.14 `henselian_finiteEtale_equivalence`;
  - §0.17 `Module.depth`, `IsLocalRing.depth`, `Ring.IsCohenMacaulay`,
    `Ring.IsCohenMacaulay.of_isRegularRing`, `Module.SatisfiesSerreS`,
    `isCohenMacaulay_iff_forall_satisfiesSerreS`;
  - §2.7 `depth_localCohomology_vanishing`, `localCohomology_module_comparison`;
  - §4.8 `CoherentFormalModule`;
  - §4.13 `serre_normality_criterion`, `IsRegular.isNormal`.
- ModularCurves §4D (miracle flatness between regular local schemes of equal dimension, line 1196)
  resolves on main and at the #1808 head.
- PurityOfBranchLocus §0.3 at this head defers 0AFS to SchemeAndStackFoundations §4.13, so the two
  READMEs agree.
- Downstream citations of LocalPurity from AbhyankarLemma (main), PurityOfBranchLocus, and the
  open PurityForFlatCohomology and CrystallineCohomology all point to §§1.1, 1.3, 2.1 and 2.2,
  which this head keeps.

**Overlaps.**
- #1807 and #1808 carry a LocalPurity README identical to this head's (diffed), so there is no
  conflict in this folder. This pull request's description states the order #1807 → this.
- No id this README cites is dropped by any open pull request.
- Ownership against open work: PurityForFlatCohomology (#1840) consumes LocalPurity and the Tau
  Ceti carriers. No open roadmap declares 0BMA, 0BM9, 0BLM or 0EY7 as its own. At this head, no
  new owner of miracle flatness appears: SchemeAndStackFoundations line 484 still defers it to
  ModularCurves 4D.

**Seeded locator sample, read in the cached texts.** All 31 locators are correct in number,
hypotheses and conclusion, except where R09 says otherwise.
- **0.1:** 00R4, `stacks-00R4` line 14937, p. 318.
- **0.2:** 0BJF, `stacks-0BJF` lines 269–285, pp. 6–7. The field step is in the proof, as the
  README says.
- **1.1:** 0BM7, `stacks-0BMA` line 2357, p. 50; the definition assumes Noetherian.
- **1.2:**
  - 0BM8, line 2366, p. 50;
  - 0BLK, line 2380, p. 51 (depth `≥ 2`);
  - 0BM9, line 2391, p. 51 (normal, dimension `≥ 2`; the torsion-free correction is needed, see
    Source issues).
- **1.3:**
  - 0BLF, line 2245, p. 48;
  - 0BLH, line 2266, p. 48;
  - 0BLL, line 2421, p. 52;
  - 0BLI, line 2283, p. 49 (henselian pair);
  - 0EL8, line 2028, p. 43;
  - 0EKS, `stacks-0EKS` line 2193, p. 48;
  - 0BM6, line 2342, p. 50;
  - 0BLJ, line 2351, p. 50 (depth `≥ 3`);
  - 05ER and 05EU, `stacks-09ZL` lines 11528 and 11624;
  - 0EII, line 1923, p. 41;
  - 0EKP, line 2094, p. 45.
- **1.4:** 0BLM, line 2459, p. 52 (depth `≥ 3`); 0BLS, line 2449; 09ZL, line 1758, p. 38.
- **2.1:**
  - 0BMA, line 2503, p. 53;
  - SGA 2 X Théorème 3.4 (i), `sga2` line 3390, printed p. 94;
  - 0AFS, `stacks-00R4` line 12566, p. 267;
  - 00NP and 00NQ, lines 11920–11928, p. 253;
  - 00H8, line 4098, p. 86;
  - 00ON, line 12677.
- **2.2:** 0EY7, line 2604, p. 56; 0BQ5 and 0EY3, `stacks-0BQ5` lines 2571 and 2627, p. 54.

**Adversarial pass.** Values were computed by hand or in Lean on the instances shown.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 0BMA (1) `purityHolds_of_isRegularLocalRing` | `d = 0` (field); `ℤ_(p)`; `k⟦x,y⟧`; `k[x²,xy,y²]_(0)` | field: `U = ∅`, purity holds, `hd` false; `ℤ_(p)`: `ℚ(√p)` needs `ℤ_(p)[√p]`, `disc = 4p ∉ A^×`, fails, `hd` false; `k⟦x,y⟧`: `U ⊔ U` extends to `X ⊔ X`; non-regular ring has embedding dimension `3 ≠ 2`, excluded | sound, `hd` needed |
| 0BMA (2) `etale_of_finiteNormal_…` | `B = 0`; `A`; `A × κ`; `A[z]/(z²−x)`; `A[z]/(z²−u)`, `u ∈ A^×` | `0`: hypotheses vacuous, `0` étale; `A × κ`: `x·(0,1) = 0`, not torsion free, excluded (and not flat); `z²−x`: `disc = 4x ∉ A^×`, `hpunct` fails at `(z)` over `(x)`; `z²−u`: `disc = 4u` unit, étale | sound |
| Convention 5 (`A × A/𝔪` normal, étale over `U`) | `A = k⟦x,y⟧` | `(A×κ)_{𝔭×κ} = A_𝔭`, `(A×κ)_{A×0} = κ`; `Spec(A×κ) ×_X U = U ⊔ ∅`; `Γ = A ≠ A×κ` | correction needed and correct |
| 0EY7 `finiteEtale_extend_of_purity` | `U = ⊤`; `X = Spec ℤ_(p)` with `U = {η}`; `U = ∅` | `⊤`: pullback is an equivalence; `{η}`: purity at the closed point fails and `ℚ(√p)` does not extend, so the hypothesis is exactly what fails; `∅`: `FÉt(∅) = {∅}` | sound |
| `flat_of_normal_dim_two` | `B = A/(x) = k⟦y⟧`; `B = A[z]/(z²−x)` | first: normal local domain, not injective, not flat (excluded by `hinj`); second: free on `1, z` | sound; padding (R04) |
| `etale_iff_traceForm_nondegenerate` | `K[x]/(x²)`; `𝔽_p(t^{1/p})/𝔽_p(t)`; `B = 0` | Gram `[[2,0],[0,0]]`, det 0, not étale; trace form ≡ 0, inseparable; `0`: both sides true | sound; padding |
| `etale_iff_isUnit_discr` | `ℤ_(p)[x]/(x²−d)`; empty basis, `B = 0` | `det [[2,0],[0,2d]] = 4d`: unit iff `d ∈ A^×`; empty basis: `det = 1`, `0` étale | sound; narrower than 0BJF (R02) |
| `not_flat_prod_residueField` | `A = k⟦x,y⟧` | `x·(0,1) = 0`, `x ≠ 0`: torsion, not flat | true; padding |
| `puncturedSpectrum`, `PurityHolds` (stand-ins) | compared with the Tau Ceti definitions | same carrier `{closedPoint}ᶜ`; same `EssSurj` of pullback along `ι`; different over-category type | duplicate (R01) |
| `restrictPunctured_faithful` (depth `≥ 1`) | `A` a field | `U = ∅`: the projections `A×A → A` agree after restriction, so not faithful; depth 0 is excluded | sound |
| 0BLK `extends_iff_sections_finiteEtale` | `A = ℤ_(p)` (depth 1) | `V = U` extends, but `Γ(V) = ℚ` is not finite over `A`, so the equivalence fails without depth `≥ 2` | hypothesis needed, present |
| `finiteNormalEquiv` (corrected 0BM9) | `B = A × κ`, `A[z]/(z²−x)`, `A × A` | the first two are outside the category; `Γ(U ⊔ U) = A × A` | sound with correction |
| 0BLM, d ≥ 3 step of §2.1 | `d = 3`, `f ∈ 𝔪∖𝔪²` | `A/f` regular of dimension 2, depth `A = 3 ≥ 3` | sound |
| `test_flat_needs_cohenMacaulay` | `S = k⟦x,y⟧[z]/(z²,xz,yz)` | `S ≅ R ⊕ κz`; `dim S = 2 = 2 + 0`; `z ∈ soc`, depth 0; not flat | Check correct |
| `test_discr_dual_numbers` | `k[x]/(x²)` | `Tr(1)=2`, `Tr(x)=Tr(x²)=0`, `disc = 0` (0 also in characteristic 2) | correct; the `char ≠ 2` hypothesis is unused |
| `test_discr_quadratic` | `ℤ_(p)`, `d` a unit, `d = p` | `4d` unit; `4p` not a unit | correct |
| `test_purity_needs_regular` | `A = k[x²,xy,y²]_(0)`, `B = k[x,y]_(0)`, `char ≠ 2` | `B` generated by `1, x, y`; `±1` acts freely off 0, so étale over `U`; an extension would make `B` étale over `A` (0BLK, depth 2), and `A` regular by descent; `edim A = 3 > 2` | Check correct |
| 0AFS via Tau Ceti | `A = k⟦x,y⟧`, `𝔭 = (x)` | `A_𝔭` a DVR; the instance gives `IsRegularRing A`; normal by `inferInstance` | pinned (R03) |

## Not verifiable

- Nothing in the seeded sample was unreadable. Every text came from the cached open copies:
  Stacks Project chapter PDFs, SGA 1 from arXiv math/0206203v2, and SGA 2 from arXiv
  math/0511279v1. The page numbers for SGA are those of these arXiv editions.
- EtaleHomotopyTypes (open) states two contracts addressed to LocalPurity
  (`gap:relative-etale-depth`, `gap:relative-homotopical-purity`). This roadmap does not declare
  them and they are not reviewed here.

## Source issues

- **Error** in stacks-0BMA at Lemma 58.20.3 (0BM9), p. 51: the source says global sections give an equivalence onto all finite normal A-algebras étale over U; it should restrict to A-torsion-free algebras, since A × A/𝔪 lies in that category but is no Γ(V, 𝒪_V); affects a stated result.
- **Error** in stacks-0BMA at Lemma 58.21.3 (0BMA), part (2), p. 53: the source says every finite normal B inducing finite étale punctured spectra is étale; it should assume B torsion free over A, as A × A/𝔪 is such a B and not flat; affects a stated result.
- **Misprint** in stacks-0BQ5 at Lemma 32.20.4 (0EY3), p. 54: the source takes the open U′ inside X; it should be inside the base scheme S of Lemma 32.20.3, X being the scheme over U′; affects nothing.
