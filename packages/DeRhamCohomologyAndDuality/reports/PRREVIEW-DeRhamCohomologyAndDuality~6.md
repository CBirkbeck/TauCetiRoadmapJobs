# Review of DeRhamCohomologyAndDuality (pull request #2085 at 420558d)

**Verdict:** needs changes

Full review. The roadmap has been on main since 992793b9 (2026-11-09 08:12), with the content last reviewed at 1b57dbe. This pull request changes `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md` only: 5 insertions and 17 deletions against main, the whole difference from 1b57dbe. It moves the ComplexKahlerGeometry K5a sentence into *Scope and ownership*, and it deletes both the sentence naming ComplexKahlerGeometry K6.1 as a consumer and the `## Downstream consumers` section. `Suggested.lean` is unchanged, and nothing outside the folder changes.

Two things are new since the last review:

- **The deletion itself.** Its stated premise is that this roadmap is unmerged, so ComplexKahlerGeometry on main cannot consume it. That premise has been false since 992793b9.
- **The Tau Ceti pin.** All earlier reviews were run against Tau Ceti 358314d (2026-10-07). Main's pin, bumped on 2026-11-05 to 2fd255d, adds a library this roadmap was never reconciled with: smooth singular chains, the manifold de Rham complex, top-form integration, fundamental classes and a local-primitive theory of `1`-forms. R02–R04 come from this.

The gate passes and the dependency check reports no problem.

## Previous findings

- **R01 (settled), the boundaryless relative-integration contract with ComplexKahlerGeometry.** Not repaired, and acted on by this pull request. It is re-raised below as R01, with the reason the settlement no longer covers it.
- **R02, *Downstream consumers* names ComplexKahlerGeometry K6.1 only.** Moot: the bullet is deleted at this head. A grep of the README for "arrangement", "Lie group" and "singular-image" is still empty.
- **R03, Mathlib primitives contract and §1.3 holomorphic Check.** Still repaired. `README.md:120–126` and `:270–279` are untouched by the diff.

## R01 (P2) — The diff deletes the consumer record but keeps sole ownership, leaving two owners

Re-raised: R01.

**Location.** `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:73–75`: "The relative smooth chain comparison (§2.4), the relative form complex of an open pair, relative integration and the relative de Rham isomorphism (§§3.1–3.3), and the compact-support integration formula (§4.1) have a single owner, this roadmap". The diff deletes main `README.md:74–76` and `:693–704`.

**Claim.** After the diff the README still claims sole ownership of §§2.4, 3.1–3.3 and 4.1, but it no longer records the consumer. Two other texts disagree with it:

- **ComplexKahlerGeometry K6.1 on main consumes these objects.** It cites them under DifferentialGeometry labels for sections that DifferentialGeometry does not plan. The deleted bullet was the only text on main that resolved those labels to their owner.
- **ComplexKahlerGeometry at the head of #1234 claims the same statements for K6.1.RelativeIntegration** and names this roadmap as their consumer. #1234 is the revision into which #1398 was merged.

This roadmap and #1234 therefore each say they own the objects and hand the other the consumer role. The pull request's premise — that this roadmap is unmerged — has been false since 992793b9.

**Why the settlement no longer covers it.** The earlier settlement held because this folder could not act, and a human would choose between the two heads. The human overlap comment of 2026-11-06 chose this roadmap as owner. This pull request now acts on the question itself and deletes the record that carried out that choice, on a premise that no longer holds.

**Witness.**

- ComplexKahlerGeometry main `README.md:1382`: "DG8.4's open-pair cone sends `(α′,0)`…"
- ComplexKahlerGeometry main `README.md:1396–1397`: "DG9.3's compactly supported relative integration formula and DG8.3's smooth/continuous relative-chain comparison".
- DifferentialGeometry main 8.3–8.5 and 9.3 (`README.md:836–875`) plan the absolute theory only.
- #1234 head 5577d7d, `README.md:1979–1981`: "owns these boundaryless open-pair statements; DeRhamCohomologyAndDuality §§2.4, 3.1–3.3 and 4.1 … consume these instances".

**Repair.** Restore the deleted scope sentence (main `:74–76`) and the `## Downstream consumers` bullet (main `:693–704`). Keep the K5a sentence where this diff moved it (`:68–71`). This is the only repair available inside this folder:

- A revision of an existing roadmap is never a supplier, so ComplexKahlerGeometry at #1234's head cannot be cited.
- Both roadmaps are now on main, so K6.1 can consume §§2.4, 3.1–3.3 and 4.1 there. #1234 is then rebased onto main to cite them in place of its K6.1.RelativeIntegration (i)–(iii).

If ComplexKahlerGeometry is instead to own these instances, close this pull request and, after #1234 merges, recast §§2.4, 3.1–3.3 and 4.1 as with-corners extensions consuming K6.1.RelativeIntegration (i)–(iii), deleting `:73–77`.

Tested: with the restored text, every item the bullet lists matches a line of K6.1 on main (rows 1–2 of the table).

## R02 (P2) — Layer 1 restates Tau Ceti's local-primitive theory on a second carrier, at lower generality

**Location.**

- `README.md:202–204`: "DifferentialGeometry 6.3 integrates smooth `1`-forms along smooth paths. Here forms and paths are only continuous".
- §1.1 at `:208–219`: `HasLocalPotentials` on `φ : C(Ω, ℂ →L[ℝ] F)`, with its uniqueness, locality and pullback bullets.
- `Suggested.lean:45–57`.

**Claim.** The pinned Tau Ceti already has most of what Layer 1 builds:

- the predicate `TauCeti.IsPrimitiveOn φ g U`, for any `RoughForm I M F 1`, requiring only that `g` be differentiable;
- its API for restriction, uniqueness up to constants and pullback;
- the covering space of local primitives `TauCeti.PrimitiveSpace`, which integrates closed forms along *continuous* paths;
- the theorem that a closed `C^r` `1`-form on a simply connected manifold is exact.

Layer 1 cites none of these. It restates the predicate and its API on planar covector fields, and it states the headline only for open subsets of `ℂ`. The pinned route (`PrimitiveSpace.isCoveringMap_proj` and path lifting) uses closedness only to obtain local primitives, so it works on every manifold. The contrast drawn at `:202–204` is therefore no longer accurate at the pin.

**Witness.** In Tau Ceti `Geometry/Manifold/DifferentialForm/LocalPrimitive.lean`:

- `:31` describes the covering space as the integration theory of closed `1`-forms along continuous paths;
- `:70` declares `structure IsPrimitiveOn`;
- `:156` is `IsPrimitiveOn.eventuallyEq_add_const`, `:117` is `IsPrimitiveOn.mpullback`, `:280` is `isCoveringMap_proj`.

`Geometry/Manifold/DeRham/SimplyConnected.lean:69` is `exists_mextDeriv_eq_of_simplyConnectedSpace`. Both predicates give the same verdict on all four §1.1 Checks (row 3).

**Repair.** Recast Layer 1 on Tau Ceti's carrier:

- **§1.1:** a `1`-form has local primitives when every point lies in an open `U` with some `g` satisfying `TauCeti.IsPrimitiveOn φ g U`. The planar covector field is the `𝓘(ℝ, ℂ)` instance on `Ω` as an open submanifold. Cite `IsPrimitiveOn.mono`, `IsPrimitiveOn.eventuallyEq_add_const` and `IsPrimitiveOn.mpullback` for the locality, uniqueness and pullback bullets. Cite `TauCeti.exists_contMDiff_isPrimitiveOn` (`:265`) for the closed `C^r` bullet.
- **§1.2:** state it as `PrimitiveSpace.isCoveringMap_proj` with "closed `C^r`" replaced by "has local primitives".
- **§1.3:** state the headline as below. Keep the planar, holomorphic and `curveIntegral` statements as Checks.
- **Contracts:** list all of these under *From Tau Ceti*, and rewrite `:202–204`.

The headline as proposed elaborates at the pins with only the `sorry` warning, after `lake build TauCeti.Geometry.Manifold.DifferentialForm.LocalPrimitive`:

```lean
theorem exists_isPrimitiveOn_univ_of_simplyConnectedSpace [FiniteDimensional ℝ E]
    [IsManifold I ∞ M] [SimplyConnectedSpace M] {φ : TauCeti.RoughForm I M F 1}
    (hφ : ∀ x : M, ∃ (g : M → F) (U : Set M), x ∈ U ∧ TauCeti.IsPrimitiveOn φ g U) :
    ∃ g : M → F, TauCeti.IsPrimitiveOn φ g univ :=
  sorry
```

On `S¹` with `dθ` the hypothesis holds and the conclusion fails, so simple connectivity is needed (row 7).

## R03 (P2) — The "Not statable at the pins" list is false at the pin, and §2.4 is statable

**Location.** `Suggested.lean:20–28`:

- "§§2.3–2.4 need DifferentialGeometry 8.3's smooth singular chain complex, which is not in Tau Ceti";
- §§3.1–3.3 "need the manifold de Rham complex";
- §4.1 "needs integration of top forms … and AlgebraicTopology 6.3's fundamental classes".

**Claim.** At the pin (Tau Ceti 2fd255d) the smooth singular chains, the manifold de Rham complex, top-form integration and the fundamental classes all exist, so these stated reasons are false. The docstring classes §2.4's relative comparison as a headline, and it is statable on the pinned carriers. What is genuinely missing is narrower:

- the de Rham integration cochain map: there is no Stokes for smooth simplices and no `deRhamHom`, only the simplex-level `TauCeti.SmoothSimplex.integral`;
- a `TauCeti.HomologicalOrientation` built from a `Manifold.Orientation`: Tau Ceti has only the chart-level generator `OpenPartialHomeomorph.localOrientationOfOrientedChart`.

**Witness.** In Tau Ceti:

- `TauCeti.smoothSingularSubcomplex`: `Geometry/Manifold/SmoothSingular/Basic.lean:77`;
- `TauCeti.deRhamComplex`: `Geometry/Manifold/DeRham/Basic.lean:45`;
- `TauCeti.integralTopForm`: `Geometry/Manifold/DifferentialForm/Integration/TopForm.lean:518`;
- `HomologicalOrientation.fundamentalClassOn` and `realFundamentalClass`: `AlgebraicTopology/Singular/LocalHomology/FundamentalClass.lean:139, 248`.

None of these exists at the old pin 358314d.

**Repair.**

- **State §2.4 in `Suggested.lean`.** The block below elaborates at the pins with only the `sorry` warning. Name the three abbreviations and the theorem in §2.4 of the README.
- **Remove §2.3 from the list.** It is the route lemma to §2.4, not one of the Summary's end theorems, and it stays a README target.
- **Correct the reasons for the remaining items.**
  - §§3.1–3.3: the relative complex itself is definable from `TauCeti.deRhamComplex.map`, `HomologicalComplex.extend` and `CochainComplex.mappingCocone`. §3.3 lacks the integration cochain map.
  - §4.1: lacks that map and the tangent-to-homological orientation passage.
  - §4.2: additionally lacks §3.3's relative class.

```lean
noncomputable abbrev singularPairIn (W : Set X) : SSetPair :=
  ((TopCat.of X).smallSingularSubcomplex ![W]).pair

noncomputable abbrev smoothPairIn (W : Set X) : SSetPair :=
  SSetPair.of (SSet.Subcomplex.homOfLE
    (inf_le_left : TauCeti.smoothSingularSubcomplex I X ⊓
      (TopCat.of X).smallSingularSubcomplex ![W] ≤ TauCeti.smoothSingularSubcomplex I X))

noncomputable abbrev smoothPairToSingular (W : Set X) :
    smoothPairIn I X W ⟶ singularPairIn X W :=
  SSetPair.homMk (SSet.Subcomplex.homOfLE inf_le_right)
    (TauCeti.smoothSingularSubcomplex I X).ι

theorem quasiIso_smoothPairToSingular [FiniteDimensional ℝ E] [IsManifold I ∞ X] [T2Space X]
    [SigmaCompactSpace X] {W : Set X} (hW : IsOpen W) :
    QuasiIso (SSetPair.chainComplexMap (smoothPairToSingular I X W) (ModuleCat.of ℝ ℝ)) :=
  sorry
```

The block uses `X : Type`, as the Conventions require, and imports `TauCeti.Geometry.Manifold.SmoothSingular.Basic` and `TauCeti.AlgebraicTopology.Singular.Subdivision.Small.Chains`. At `W = ∅` the small subcomplex is empty and the statement is the absolute smoothing equivalence; at `W = X` both relative complexes vanish (row 11).

## R04 (P3) — The supplier contracts cite as roadmap targets declarations that are at the pin, some under names that do not exist

**Location.**

- `README.md:166–177`: "5.1–5.3: … `integralTopForm`", "6.1, 6.4: `deRhamComplex`, `deRhamCohomology`, `closedForms`, `exactForms`", "8.3: `SmoothSimplex`, `smoothSingularChainComplex`, `smoothToSingular`".
- §1.1 `:213`, `:215–216`: "DifferentialGeometry 6.2's flat Poincaré lemma".
- §4.1 `:539–543`: the dimension-zero and embedding formulas.
- AlgebraicTopology 6.3's classes, `:183–187`.

**Claim.** The rule is that what exists at the pins is cited with its exact name and file. These objects are now Tau Ceti declarations, not open roadmap targets. Two of the names, `smoothSingularChainComplex` and `smoothToSingular`, exist at neither pin: the pinned design is the subcomplex `TauCeti.smoothSingularSubcomplex` of the singular simplicial set, with inclusion `SSet.chainComplexMap (smoothSingularSubcomplex I M).ι`. Parts of §4.1 are pinned theorems:

- the `I.interior M → M` case of the embedding formula is `TauCeti.integralTopForm_mpullback_subtypeVal`;
- the dimension-zero formula is `TauCeti.integralTopForm_ofFunction_finite_zeroDim`.

**Witness.** In Tau Ceti:

- `Geometry/Manifold/DifferentialForm/Integration/OpenSubset.lean:71`;
- `Integration/ZeroDim.lean:67` (a signed sum of values);
- `Analysis/Calculus/DifferentialForm/Poincare.lean:393`, `StarConvex.exists_contDiffOn_forall_extDeriv_eq` (complete `F`);
- `Geometry/Convex/FullSimplex.lean:44`.

DifferentialGeometry's own open revision #886 already cites them this way (head 3d4316f, `README.md:1811`, `:1942`).

**Repair.** Under *From Tau Ceti*, add each with its file:

- `Geometry/Manifold/DeRham/`: `TauCeti.deRhamComplex`, `TauCeti.deRhamCohomology`, `TauCeti.closedForms`, `TauCeti.exactForms`, `TauCeti.deRhamComplex.map`, `TauCeti.compactlySupportedDeRhamComplex`;
- `Geometry/Manifold/SmoothSingular/`: `TauCeti.smoothSingularSubcomplex`, `TauCeti.SmoothSimplex`, `TauCeti.smoothSingularSubcomplexMap`, `TauCeti.SmoothSimplex.integral`;
- `Geometry/Convex/FullSimplex.lean`: `TauCeti.fullSimplex`;
- `Geometry/Manifold/DifferentialForm/Integration/`: `TauCeti.integralTopForm`, `TauCeti.integralTopForm_mpullback_subtypeVal`, `TauCeti.integralTopForm_ofFunction_finite_zeroDim`;
- the flat and manifold Poincaré lemmas: `StarConvex.exists_contDiffOn_forall_extDeriv_eq` and `TauCeti.exists_mextDeriv_eq_nhds`;
- `AlgebraicTopology/Singular/LocalHomology/FundamentalClass.lean`: `TauCeti.HomologicalOrientation.fundamentalClassOn`, `fundamentalClass`, `realFundamentalClass`.

Delete `smoothSingularChainComplex` and `smoothToSingular`. Keep the DifferentialGeometry and AlgebraicTopology sections only for what is not at the pin:

- DifferentialGeometry 8.3's smoothing equivalence;
- 8.4's Stokes for simplices, `chainIntegral` and `deRhamHom`;
- 8.5's `deRhamEquiv`;
- AlgebraicTopology 6.3's `RelativeTwistedClassDatum`, class factory and support-enlargement law (absent at the pin).

## Verified sound

**Gate (run on this head).**

```text
gate DeRhamCohomologyAndDuality: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate adds `build=0`.

**Dependency check (`--movable`, board order, main).**

```text
depcheck: 237 roadmaps, 2309 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The roadmap is at line 395 of 398 in the board's merge order.

**Folder.** The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.DG"`), and the diff outside the folder is empty. The diff adds no process word, pull-request number or LaTeX delimiter. The README keeps no reference to the deleted section: a grep for "Downstream" and "K6.1" is empty.

**Lean.** `lake env lean` on a scratch copy of `Suggested.lean`, with `#check @name` appended for all eight declarations, gives only the four `sorry` warnings (lines 54, 73, 109, 122). The elaborated types match the README statements:

- §1.3 carries `IsOpen Ω` and `[SimplyConnectedSpace Ω]`, and no completeness.
- §2.2 carries `[FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]`.
- §5.2 carries four `FiniteDimensional` instances, `[BorelSpace P]` and an add-Haar measure.
- §5.3 carries three `FiniteDimensional` instances.

The dropped-binder lead on `incidenceEquation` (no `NormedSpace ℝ` instances) is benign: its body uses only subtraction in `V`, and both theorems that use it carry the instances.

**Padding probe.** Replacing each `sorry` with `first | rfl | simp | infer_instance | trivial | aesop` fails on all four theorems (errors at lines 57, 79, 117 and 132). There is no padding.

**Library declarations opened at the pins.** All of these elaborate.

- Mathlib (35):
  - `extDeriv`, `extDerivWithin`, `curveIntegral`, `Complex.IsExactOn`, `Complex.IsConservativeOn`;
  - `Complex.IsConservativeOn.isExactOn_ball`, `DifferentiableOn.isExactOn_ball` and `Complex.IsExactOn.differentiableOn`, all with `[CompleteSpace E]`, as §1.3's Check says;
  - `SimplyConnectedSpace.paths_homotopic`, `Continuous.exists_contMDiff_approx_and_eqOn`, `Continuous.exists_contDiff_approx_and_eqOn`;
  - `exists_contMDiffMap_one_nhds_of_subset_interior`, which carries `[NormalSpace M]`, discharged by `NormalSpace.of_paracompactSpace_r1Space`, `paracompact_of_locallyCompact_sigmaCompact`, `ModelWithCorners.locallyCompactSpace` and `ChartedSpace.locallyCompactSpace`, as `:136–141` says;
  - `exists_contMDiffSection_forall_mem_convex_of_local`, `IsOpen.exists_contDiff_support_eq`;
  - `ModelWithCorners.isOpen_interior` (needs `n ≠ 0`), `ModelWithCorners.convex_range`, `ModelWithCorners.isClosed_range`, `ModelWithCorners.nonempty_interior`, `ModelWithCorners.interior`, `ModelWithCorners.boundary`, `BoundarylessManifold`, `modelWithCornersEuclideanQuadrant`;
  - `CochainComplex.mappingCocone`, `ChainComplex.linearYonedaObj`, `HomologicalComplex.extend`, `ComplexShape.embeddingUpNat`, `CategoryTheory.ShortComplex.ShortExact`, `HomologicalComplex.homology`, `Homotopy`;
  - `ContinuousMap.HomotopyRel`, `ContinuousLinearMap.coprod`.
- Tau Ceti:
  - `TauCeti.IsRegularParameter` (`Analysis/Fredholm/LevelSet/GlobalParametric.lean:63`): its body, regularity at every solution through `(fderiv f (x, l)).comp (inl)`, matches §5.1;
  - `TauCeti.isMeagre_setOf_not_isRegularParameter` (complete, second-countable, Fredholm, order bound);
  - `TauCeti.addHaar_image_criticalPoints_eq_zero` (`Analysis/Calculus/Sard/OutermostStratum.lean:347`, threshold `finrank² + 1`);
  - `TauCeti.IsLocallyCollared.isCollared` (`Geometry/Manifold/Boundary/Collar/Brown.lean:459`, `[CompactSpace N] [T2Space M]`, met by `∂M` of compact `M` in §4.2);
  - `TopPair.singularCochainComplex` (`AlgebraicTopology/Cohomology/Relative.lean:119`);
  - `levelSetChart` (`Analysis/Fredholm/LevelSet/`);
  - plus the declarations cited in R02–R04.

**Cross-roadmap citations resolved on main (3f7196b).**

- **DifferentialGeometry:**
  - 0.1, 0.3–0.4 (`:272–306`) and 1.1–1.4 (`:315–333`);
  - 2.1–2.2 (`:345–356`);
  - Layer 3 boundaryless (`:76–77`, matching §2.2's use on the interior);
  - 5.1–5.3 (`:507–524`);
  - 6.1–6.4 (`:786–804`), 7 (`:806`);
  - 8.3 (`:836–844`), whose smoothing hypotheses carry no boundaryless restriction (`Suggested.lean:2583` there);
  - 8.4 (`:845–851`), 8.5 (`:852–860`), 9.3 (`:872–874`), 10, 11.
- **AlgebraicTopology 6.3:** `:82–88`, `:1205`, `:1319–1329` (support enlargement), `:1352`.
- **ComplexKahlerGeometry:** K5a (`:33–34`, `:939`; the new scope sentence is accurate) and K6.1 (`:1328`, `:1382`, `:1389`, `:1396–1397`).
- **HeegaardFloer:** F0.S is §2.1 (`:20`, `:71`).
- **GeometricTopology:** on main.
- **TangentialBordism §2.1:** at #942's head (`:408`), cited as adjacent, not as a supplier.

**Ownership against open pull requests.** These are the sibling checkouts plus `roadmaps grep`.

- **#1234 (ComplexKahlerGeometry):** the conflict in R01.
- **#886 (DifferentialGeometry, head 3d4316f):** consistent. It names this roadmap the owner of Layers 1–5 and of inward domination (`:55–58`, `:172–176`).
- **#1652 (AlgebraicTopology, head 456e2cb):** consistent. Its `:94–95` attributes the family transversality analogue to Layer 5 here.
- **#903 (GeometricTopology, head 5859c0d):** its Layer 1.1 (`:809–810`) states that the interior of a manifold with boundary includes as a homotopy equivalence, via collars. That is a different object from §2.2's smooth deformation over any convex model, and this README states no homotopy-equivalence target, so there is no double owner.
- **Citations of the deleted numbering:** the overlaps tool reports no dropped id, and `roadmaps grep 'DR\.[0-9]+\.[0-9]+'` finds no citation of DR.3.8 or DR.4.4 (only CrystallineCohomology's CR.DDR.*). Deleting the old → new numbering line therefore breaks no citation.

**Adversarial table** (all values computed at this head).

| # | Statement | Instances | Values computed | Result; change |
| --- | --- | --- | --- | --- |
| 1 | Scope `:73–77` after the diff | K6.1 on main; #1234 head | Main `:1382` consumes `(α′,0) ↦ [α′]_rel` as "DG8.4's"; `:1396–1397` consumes the compact-support formula and the relative chain comparison as DG9.3's and DG8.3's; DifferentialGeometry 8.4 plans `deRhamHom` absolute only (`:845–851`), 9.3 duality (`:872–874`); #1234 `:1979` "owns"; README "single owner, this roadmap" | Two claimants, consumer unrecorded; R01 |
| 2 | Moved K5a sentence `:68–71` | ComplexKahlerGeometry main | `:33–34` "K5a owns … complex-coefficient de Rham comparison"; `:939` computes `H¹_dR(ℂ∖{0};ℂ) ≃ ℂ` | Pass |
| 3 | §1.1 `HasLocalPotentials` against `IsPrimitiveOn` locally | `dx`; `x dy`; angular form on `ℂ∖{0}`; `d(|x|^(3/2))` | `g = Re`: both true. Mixed partials `0 ≠ 1`: both false. `arg` branches: both true locally, no global (loop `2π`). `g = |x|^(3/2)` differentiable with derivative `(3/2)|x|^(1/2) sgn x`, continuous and not `C¹` at `0`: both true | Same verdict on all four; R02 |
| 4 | §1.1 Checks | as row 3 | as row 3; the always-true predicate fails at `x dy`; the zero predicate fails at `dx` | Pass |
| 5 | §1.2 path integral | angular loop once, twice, reversed; `dx` along `t + iW(t)`; constant path; `dx` on `0 → 1 → 3` with potentials `x`, `x + 7` | `2π`, `4π`, `−2π`; `Re 1 − Re 0 = 1` with no derivative of the path; `0`; `(1 − 0) + (10 − 8) = 3` | Pass |
| 6 | §1.3 headline (Lean) | `Ω = ℂ`, `φ = Re`; slit plane; `ℂ∖{0}`; `Ω = ∅`; incomplete `F`; `f = 1/z` | `g = Re + c`; `arg`; loop integral `2π ≠ 0`, so no global potential; `SimplyConnectedSpace ∅` false (needs `Nonempty`); the route is finite sums of potential differences, so no completeness is used; `Log`, `∮dz/z = 2πi` | Pass |
| 7 | §1.3 on Tau Ceti's carrier (R02 probe) | elaboration; `M` a point; `S¹` with `dθ` | Elaborates with only `sorry`; `g` constant; local primitives exist, global fails (period `2π`), so `SimplyConnectedSpace` is necessary | Repair tested |
| 8 | §2.1 strict inward cone | `[0,∞)` at `0`; quadrant; interior point; constant field | Need `tv ≥ εt`: cone `(0,∞)`, `v = 0` fails at `−εt/2`. Open quadrant, `(1,0)` fails. All of `E`. `ball(y + t(q−x), ε₀t) = (1−t)y + t·ball(q + (y−x), ε₀) ⊆ C` for `0 < t ≤ 1` | Pass |
| 9 | §2.2 headline (Lean) | `[0,∞)`, `X = 1`; `[0,1]`, `X = 1/2 − x`; `X = x(1−x)`; quadrant, `X = (1,1)`; `M = ∅`; non-convex `C` | `Φ(0,x) = x + 1 ≥ 1`, `Φ(1,x) = x`, `Φ(t,x) > 0` for all `t ∈ ℝ`. `ψ(s,x) = 1/2 + (x−1/2)e^(−s)`, so `r(0) ≈ 0.316`, `r(1) ≈ 0.684`. `r(0) = 0` is not interior. `r(x) = x + (1,1)`. Empty case trivial. `{0} ∪ ⋃[1/(n+1)+εₙ, 1/n]` is excluded by `convex_range'` | Pass |
| 10 | §2.3 transfer | both identities; `N = M`; `[0,∞)` witness; point and `S¹` | `i_M j_* s r_* = j_* i_N s r_* ~ (jr)_* ~ id`; `j_* s r_* i_M = j_* s i_N r_* ~ j_* r_* ~ id` by the smooth prism; inverse `s`; `[0] ↦ [1]`, `∂(t ↦ t) = [1] − [0]`; the composite is `0` on `H₁(S¹) = ℝ` | Pass |
| 11 | §2.4 and the R03 probe | `(ℝ, ℝ∖{0})`; `W = ∅`; `W = X` | `0 → H₁(ℝ,W) → ℝ² →(sum) ℝ → H₀(ℝ,W) → 0`, so `H₁ ≅ ℝ` and `H₀ = 0`; `2t − 1` has `∂ = [1] − [−1] ↦ (1,−1)`; `smallSingularSubcomplex ![∅]` has no simplices, giving the absolute case; at `W = X` both relative complexes are `0`. The probe elaborates | Statable; R03 |
| 12 | §2.5 | `r(2)`, `r(−1)`, `r(0.3)`; `(3,4)`; `Q` on faces; `(t,t,t)` | `1, 0, 0.3`; `(0.6, 0.8)`; faces give `(y−z)², (x−z)², (x−y)²`; Hessian diagonal `2`, off-diagonal `−2`; `3t² − 6t² = −3t² < 0` | Pass |
| 13 | §3.1 signs | `d²`; coordinate map; `b` on `(ℝ, ℝ∖{0})`; degree `0` | `(0, dα|_W − dα|_W + d²β) = 0`; `(α,−β) ↦ (dα, −α|_W + dβ)`, the image of `(dα, α|_W − dβ)`; `0 − (b(1) − b(−1)) = −1`, so `−[(0,b)]` gives `1 = b(∂c)` and the opposite convention gives `−1`; `H⁰(ℝ, ℝ∖{0}) = 0` | Pass |
| 14 | §3.2 | `ψ dx`, `β = Ψ|_W`; `1/x` | `1 − (1 − 0) = 0`; `d(Ψ,0) = (ψdx, Ψ|_W)`; `1/x` does not extend to `ℝ` | Pass |
| 15 | §3.3 | `(ℝ, ℝ∖{0})`; `(ℝ², ℝ²∖{0})`; statability | `ℝ²/ℝ ≅ ℝ`; `H²(X,W) ≅ H¹(W) = ℝ` and `H¹(X,W) = 0`; `−(0 − 2π) = 2π`. At the pin there is no integration cochain map, so it is not statable, but for that reason and not the one stated | Pass; reason corrected in R03 |
| 16 | §4.1 | `S¹` both orientations; two points; `ℝ`, `K = [−1,1]`, `4t − 2`; `K′ = [−3,3]`, `8t − 4`; `2t − 1`; dimension `0` | `±2π` on both sides; `f(a) − f(b)` against `f(a) + f(b)`; `∂ = [2] − [−2] ⊂ ℝ∖K` and `∫_{−2}^{2}ψ = 1`; `1`; endpoints `±1 ∈ K`; `deRhamHom[ψdx] ∈ H¹(ℝ) = 0` while the pairing is `1`; `integralTopForm_ofFunction_finite_zeroDim` gives `Σ sign · g(x)`, as the README says | Pass; pinned pieces in R04 |
| 17 | §4.2 | `D¹`, `β = c₊, c₋`; `[0,1]`, `dx`, `x` | `−(c₊ − c₋)`; `1 − (1 − 0) = 0`, consistent with `(dx, x) = d(x, 0)` | Pass |
| 18 | §5.1 | `((1,2),3)`, `F = x + p`; `x² + p`, `j = 0`, `p = −1, 0, 1`; `W = ℝ`, `j = id` | `F(1,3) − j(2) = 2`; `±2` (regular), `0` (not), empty fibre (regular); `(u,v) ↦ 2xu − v` is onto | Pass |
| 19 | §5.2 headline (Lean) | `x² + p`; `x²`; `V = 0`; `P = 0` | `∂ₚ = 1`, bad set `{0}`; `htotal` fails at `(0,p)`, every `p` bad; all regular; Haar measure is `c·δ₀`, so the theorem reads "`0` is regular", which `htotal` gives | Pass |
| 20 | §5.3 headline (Lean) | `f = 0`, `β = x²`, `p = 1`, `x = 2`; `f = β = x²`, `j = 0`; `V = 0` | `4`; `β(x) > 0` gives `q ↦ β(x)q` onto, `β(x) = 0` gives `Dβ(x) = 0` and `hgood` applies; `x²(1+p)` has a critical zero for every `p`; `p = 0`, `‖0‖ < r` | Pass |
| 21 | Contracts `:171` | `smoothSingularChainComplex`, `smoothToSingular` | Neither name is at either pin; the pinned carrier is `TauCeti.smoothSingularSubcomplex` (`Basic.lean:77`) | R04 |
| 22 | Padding | four sorried theorems | All four fail the one-tactic probe | Pass |

The table covers the 15 sampled targets, the seven headlines (four stated, three not statable) and every target the findings touch.

## Not verifiable

- **Lee, *Introduction to Smooth Manifolds* (DOI 10.1007/978-1-4419-9982-5)** and **Bott–Tu, *Differential Forms in Algebraic Topology* (DOI 10.1007/978-1-4757-3951-0).** Both are recorded as `uncertified` (paywalled) in the manifest, so they were not fetched again. The sampled locators are cited by locator alone:
  - §2.2: Lee Prop. 2.28 and Thms. 9.24–9.26 (pp. 222–223);
  - §3.1: Bott–Tu Ch. I §6;
  - §4.1: Bott–Tu §5;
  - §5.2: Lee Thm. 6.35;
  - §5.3: Lee Thm. 6.36.

  The manifest's `cited_for` lists only "2.2" for `lee` and "3.1" for `bott-tu`, while the README also cites them at §§5.2–5.3 and §4.1.
- **Which of this roadmap and ComplexKahlerGeometry at #1234's head owns the boundaryless relative theory** cannot be settled inside this folder (R01). The rules allow only the restoration repair here, so the choice between that and recasting after #1234 merges is a human decision.

## Source issues

- none
