# GATE-DifferentialGeometry~2 — answers to the review of `a565de6`

One review comment (CBirkbeck, 2026-10-30, F01–F07) is answered below as H01–H15: F05 makes three
points and F07 seven. Repairs are in commits `14a4c616` and `e8165fc3` on the pull-request branch (not pushed).

## H01 (CBirkbeck) — applied differently

`exists_isOrientationPreservingAt_pullback` (`TauCetiRoadmap/DifferentialGeometry/Suggested.lean:634`) now takes `(hcard : Fintype.card ι = Module.finrank ℝ E)`, and `Manifold.Orientation.pullback` (`:688`) takes the same hypothesis with default proof `by simp`. This is used instead of `[Nonempty M]` because it is necessary and sufficient. For nonempty `M` it follows from `card_eq` of `o'` and the invertible differential. For empty `M` it is exactly the condition for an orientation indexed by `ι` to exist, so `[Nonempty M]` would wrongly exclude empty `M` with matching dimensions. The default is needed because `TauCetiRoadmap/AlgebraicTopology/GeneralModelOrientation.lean:126` (on main) calls `Manifold.Orientation.pullback hf (by norm_num) o`, and `simp` closes `Fintype.card (Fin m) = finrank ℝ (EuclideanSpace ℝ (Fin m))` there (the build passes). README 2.2 (`README.md:612`) states the hypothesis and adds the empty-manifold negative-control Check (`:638`).

## H02 (CBirkbeck) — applied

`Distribution.exists_leaf` (`Suggested.lean:1107`) is under `[IsManifold I ∞ M] [BoundarylessManifold I M] [T2Space M]` and `D.IsInvolutive`. Its leaf contains `x`, is connected and injectively immersed, and contains the image of every connected integral manifold that *meets* it, with `SecondCountableTopology M → SecondCountableTopology N.carrier`. This stronger maximality gives the partition directly: two leaves that meet contain each other. So no separate partition statement is needed, and the README says so (`README.md:829`, with three Checks). "Leaves (4.3)" is gone from the module docstring's list of statements that are not statable.

## H03 (CBirkbeck) — applied

Added `Green.verticalCell` and `Green.horizontalCell` (`Suggested.lean:1319, 1323`), plus `Green.green_verticalCell` (`:1333`, `∫ x in a..b, (P (x + ℓ x·I) − P (x + u x·I)) = −∫_V Py`) and its twin `Green.green_horizontalCell` (`:1347`, `∫ y in c..d, (Q (u y + y·I) − Q (ℓ y + y·I)) = ∫_H Qx`). The hypotheses are exactly those of README 5.6.2: continuous graphs with `ℓ ≤ u`, `P` continuous on the cell, slice `HasDerivAt` at every point, and area integrability. The fibre-measurability premise is derived by Fubini, as the README already asked. The README (`:1172–1216`) now says the one-cell boundary side is an ordinary interval integral and that Henstock–Kurzweil integrals are for the arcs of the finite divisions. Its Checks are the unit square (`−1 = −1` for `P = y`, `1 = 1` for `Q = x`), `ℓ = u`, and `P = |x − 1/2|`. The module docstring (`:42`) lists the division theorems as not statable for want of the oriented boundary-chain carrier.

## H04 (CBirkbeck) — answered

Confirmed. The targeted build exits 0. The only diagnostics from `TauCetiRoadmap/DifferentialGeometry/Suggested.lean` are its 59 `declaration uses sorry`. The module-system, `letI`, overlapping-instance and unused-variable warnings all come from `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` and `TauCetiRoadmap/MorseNovikov/Suggested.lean`, which this branch does not change (gate `outside-folder=0`). The brief's gate command has no build counter, and it now passes (`OK`).

## H05 (CBirkbeck) — applied differently

`Suggested.lean` goes from 134 theorems to 60 (59 with `sorry`; two of them are the chart-sign laws of the constructed pullback, H08), and its imports from fourteen `TauCeti.*` modules to ten. What was deleted:

- the one-tactic lemmas;
- the proved-in-place restatements;
- API laws (bilinearity, id/comp, evaluation formulas);
- specializations of kept statements (scalar wedge, flux form, finite-dimensional slab adapters, simply connected case);
- Check mirrors (`mpullback_eq_flat`, sign gate, `Δ‖x‖²`);
- the unused definitions (`wedgeMul`, `RoughForm.restrict`, `RoughForm.interior`, `IsOrientationReversingAt`, `OrientationLift.signAt`, `OrientationCover` and `proj`/`deck`, `Distribution.IsIntegralManifold`, `IsNullSet`, `boundaryRestriction`, `oneForm`, `intervalBox`, the density scalar action).

Each deleted statement stays in the README as prose. Kept against the review's list, with evidence:

- `toFlow_apply`, `toFlow`, `isCompleteVectorField_of_compactSpace`, `closedForms` (with `mextDerivₗ`, `mextDeriv_add`, `mextDeriv_smul`, `isSmoothForm_mextDeriv_infty`), `fullSimplex`, `fullSimplexEquivStdSimplex` and `Density` are used by Lean files that import this module and are in the required build (MorseNovikov, AlgebraicTopology `OrientationComparison`, ComplexKahlerGeometry).
- `CurvatureForm` (lines 200 and 874), `bracketWedge` (874) and `volume_circle` (796) are cited by name in `TauCetiRoadmap/SmoothBundlesConnections/README.md` on main. `circleAngularForm` (and its body `planeAngularForm`) is cited in `TauCetiRoadmap/MorseNovikov/README.md:152`, and `RoughDensity` in `TauCetiRoadmap/ComplexKahlerGeometry/README.md` (main).

## H06 (CBirkbeck) — applied differently

The structure is dropped, together with README 3.6 and the helpers `smoothInteriorOpen`, `smoothInterior_boundaryless`, `sigmaCompactSpace_open_of_charted` and `smoothInterior_sigmaCompact`. The 3.6 existence theorem is not stated, because DeRhamCohomologyAndDuality at its head (`1b57dbe`) owns the strict inward cone, inward fields, the semiflow and inward domination. That is its §§2.1–2.2, with `exists_smooth_inward_deformation`, and it is earlier in the merge order. Stating it here would duplicate that owner. *Scope and ownership* (`README.md:51`) and *Boundary and corners* (`:148`) now cite DeRhamCohomologyAndDuality §§2.1–2.2. The claims that DeRhamCohomologyAndDuality and GeometricTopology consume a DifferentialGeometry 3.6 are removed.

## H07 (CBirkbeck) — applied

Every declaration name in `Suggested.lean` now occurs in `README.md`. The five named local instances became anonymous, and every backticked name of this roadmap's own in the README is declared (gate `readme-ids-missing=0`; mechanical cross-check of both directions, no misses).

## H08 (CBirkbeck) — applied differently

- `halfSpaceOutwardUnitNormal`, its smoothness theorem and `halfSpaceBoundaryFlux` are deleted. `integrable_divergence_and_boundaryFlux` and `integral_divergence_eq_boundaryFlux` (`Suggested.lean:1601, 1623`) take any `N` with `‖N x‖ = 1`, `IsOutwardPointing` and orthogonality to `dι(T_x∂M)`. These laws determine `N` pointwise, so the statement is equivalent and contains no choice. `exists_halfSpaceOutwardUnitNormal` (`:1587`) supplies a smooth such `N`, so the hypothesis is satisfiable.
- `halfSpaceBoundaryVolume`'s docstring (`:1578`) says the continuity instance comes from the admitted `halfSpaceBoundaryMetric_continuous`. The measure does not depend on the proof, since the instance is a `Prop`.
- `Manifold.Orientation.pullback` (`Suggested.lean:688`) is now constructed by descent, with no choice in its body: `Classical.choose (exists_isOrientationPreservingAt_pullback …)` → `Quotient.mk OrientationLift.setoid {…}`. The lift's model orientation `μ` is `Basis.orientation` of `Module.finBasisOfFinrankEq ℝ E hcard.symm` reindexed by `(Fintype.equivFin ι).symm`. Its chart signs are the new `Manifold.Orientation.pullbackSign` (`:647`): at a point `y` of the chart at `x`, the sign comparing `μ` with `orientationAt o' (f y)` carried back by `(hf.mfderivToContinuousLinearEquiv _ y).symm`, times the sign of `det` of the chart change from `y` to `x` within `range I`. The two lift laws are the admitted `Manifold.Orientation.continuous_pullbackSign` (`:660`) and `Manifold.Orientation.pullbackSign_mul_pullbackSign` (`:670`). Replacing `μ` by `−μ` negates every sign, which is the diagonal flip, so the class does not depend on the basis. This is the construction `TauCeti.Manifold.Orientation.pullback` uses at main's Tau Ceti pin (`Geometry/Manifold/Orientation/Pullback.lean:173`), which this branch's pin `358314d` lacks. The signature is unchanged. `AlgebraicTopology/GeneralModelOrientation.lean:126` builds in the required build. `AlgebraicTopology/BoundaryInteriorComparison.lean:97` makes the same call (`pullback hf (by norm_num) o`) but is not in that build, so it was not compiled. README 2.2 (`README.md:619–631`) describes the construction and the two laws and adds three Checks (`:642–656`): basis independence, base point, and an atlas on `ℝ` on which the tangent factor alone would break the coordinate-change law. The gate's `statement-hygiene` item is cleared.

## H09 (CBirkbeck) — applied

Fixed in the README: `target12.6`, `theorem5.3`, `theorem5.5b`, `Layer12.5`, `milestone12.6`, `layers0–1`, `with5.4's`, `theorems5.6`, `Stokes5.3`, `integration5.5a`, `comparison12.6`, `Ch.16`, `Thm.16.25/16.32`, and the blank line splitting the bullet (now `README.md:162–166`). Fixed in Lean docstrings: `Layer3.6`, `DG3.5`, `DG12.1`, `DG12.5`, `README12.2/12.5`. "DG2's/DG5.1's/DG5.5b's" in this roadmap's own README now read "Layer 2's/5.1's/5.5b's".

## H10 (CBirkbeck) — applied

The three "(to be declared as RoughForm.mapCoeff / SmoothForm.mapCoeff / SmoothFaceStructure)" phrases are removed. The objects are named in prose: coefficient postcomposition `L_*ω`, and the smooth face structure bundling the local quadrant data.

## H11 (CBirkbeck) — applied differently

The README now has:

- the opening **Summary.**;
- `## Scope and ownership`, holding the ownership paragraph and the former *Relation to sibling roadmaps*, moved up;
- `## Exact supplier contracts`, with `### From Mathlib`, `### From Tau Ceti` and a new `### From TauCetiRoadmap.GeometricMeasureTheory` (G1–G2);
- `## How to read the build`, the former *Ordering*, placed before the layers;
- `## References` (Lee, Tu, Wiedijk's list, the AFP `Green` entry).

**Checks.** lists were added where this round changed statements (0.1, 2.1, 2.2, 4.4, 5.6.2). Per-definition API and Checks lists for every remaining definition, and per-layer `### Examples` / `### Dependencies`, are not added. The per-layer *Acceptance* paragraphs play that role. Writing them for some forty definitions is authoring beyond this review.

## H12 (CBirkbeck) — applied

`Suggested.lean:61` now reads "DeRhamCohomologyAndDuality, which consumes this roadmap"; the module docstring was rewritten to the acceptance-test form.

## H13 (CBirkbeck) — applied

`[DecidableEq ι]` is removed from the Layer 2 section variables (`Suggested.lean:518`); the elaborated signatures contain no `DecidableEq`. `omit [CompleteSpace E] in` is added to `exists_flowOf_one_eq`, `hasDerivAt_mpullback_flowOf`, `exists_chart_mfderiv_eq_const` and `timeDependentFlowDomain_eq_univ` (`:849, 874, 885, 963`). These are the four statements that also carry `[FiniteDimensional ℝ E]`; the review named two.

## H14 (CBirkbeck) — answered

Confirmed and left unchanged. DifferentialGeometry 5.6.1 and *Rectifiable curves* consume GeometricMeasureTheory G1, and GeometricMeasureTheory G6 consumes 5.6.3, so the supply is acyclic at the target level. `depcheck` reports 0 problems with G1 now listed as a supplier contract. Making supply single-direction at roadmap level would mean moving either the BV line-integral construction to GeometricMeasureTheory or G1's AC facts here. That is an ownership change between two roadmaps on main, for the operators.

## H15 (CBirkbeck) — disputed

The citations do dangle, but "the repointing belongs to those roadmaps" is not available. At its head `1b57dbe` (2026-11-07, after this review), DeRhamCohomologyAndDuality is "DifferentialGeometry, Part II". Its *Scope and ownership* and *From TauCetiRoadmap.DifferentialGeometry* import DifferentialGeometry 6.1, 6.3, 6.4, 8.3, 8.4, 8.5, 9.3, 10 and 11 by section. This branch deletes those layers and assigns them to DeRhamCohomologyAndDuality (`README.md:33–36`). After both merge, the de Rham complex, Mayer–Vietoris, smooth chains, the de Rham theorem, duality, degree and hairy ball have no owner. The binding rule is to keep a dropped id or map it to its new home, and there is no home. So either this branch keeps layers 6–11, or DeRhamCohomologyAndDuality takes them back, and the merge order must name the choice. I did not reverse this branch's central move without that decision. The only id that does have a new home is mapped: citations of 5.5 now point to 5.5a/5.5b (`README.md:29`).

## Build

`lake build TauCetiRoadmap.DifferentialGeometry.Suggested TauCetiRoadmap.AlgebraicTopology.GeneralModelOrientation TauCetiRoadmap.AlgebraicTopology.OrientationComparison TauCetiRoadmap.ComplexKahlerGeometry.Suggested TauCetiRoadmap.MorseNovikov.Suggested TauCetiRoadmap.SymplecticGeometry.ContactGeometry.Suggested`: **exit 0, "Build completed successfully (9171 jobs)"**. `TauCetiRoadmap/DifferentialGeometry/Suggested.lean` emits 59 `declaration uses sorry` (57 before, plus `continuous_pullbackSign` and `pullbackSign_mul_pullbackSign`) and no other diagnostic; `Manifold.Orientation.pullback` itself emits none. The other modules emit their own pre-existing warnings (H04), and `GeneralModelOrientation`, which calls `pullback`, builds unchanged.

## Gate

    gate DifferentialGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

This is the gate at `e8165fc3`. The previous run's single failure was `statement-hygiene: line 649: P3 def Manifold.Orientation.pullback chooses its datum (Classical.choose)`, and it is cleared by the construction in H08. The added declarations pass `sorry-data` (no data body is `sorry`; only the two `Prop` laws are admitted) and `readme-ids-missing`.

## Dependency check

    depcheck: 239 roadmaps, 2432 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README: no cross-roadmap citation or Lean name found nowhere.

## Signature check

A scratch file imported the built module and issued `#check @…` for all 118 declarations; all elaborated. I compared each changed statement's elaborated binders with its README statement:

- `exists_leaf` keeps `[IsManifold I 1 M] [FiniteDimensional ℝ E]` from the section;
- `green_verticalCell` carries exactly the five hypotheses of 5.6.2;
- the divergence statements carry the smooth half-space, T2, second-countable, σ-compact and Borel hypotheses and both metric instances;
- `pullback`'s `hcard` elaborates as an `autoParam`;
- no binder was lost; the only binders dropped are `[DecidableEq ι]` and the redundant `[CompleteSpace E]` (H13);
- for the pullback repair, a second scratch file issued `#check @…` for `pullbackSign`, `continuous_pullbackSign`, `pullbackSign_mul_pullbackSign`, `pullback` and `exists_isOrientationPreservingAt_pullback`. All elaborated with no error or warning:
  - `pullbackSign` carries `[FiniteDimensional ℝ E']` and no `IsManifold` instance, since it is data;
  - `continuous_pullbackSign` carries `[FiniteDimensional ℝ E] [FiniteDimensional ℝ E'] [IsManifold I n M] [IsManifold I' n M']`;
  - `pullbackSign_mul_pullbackSign` carries `[IsManifold I n M]` only, as README 2.2 says (the tangent factors cancel, so `M'`'s atlas plays no part);
  - `pullback`'s binders are exactly those of the previous run, `hcard` still an `autoParam`.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_isOrientationPreservingAt_pullback` + `hcard` | empty `M` on `ℝ²`, `M' = ℝ`, `ι = Fin 1`; empty `M`, equal dims; nonempty `M` | `card_eq` forces `1 = 2` (no orientation) vs `hcard : 1 = 2` false (excluded); equal dims: one lift exists, sign data vacuous; nonempty: `mfderiv` iso gives `finrank E = finrank E'` | true with `hcard`; false without | hypothesis added (H01) |
| `pullback` default `by simp` | `Fin m`, `EuclideanSpace ℝ (Fin m)` | `card (Fin m) = m = finrank` | closes; importer builds | autoParam |
| `exists_leaf` | rank 0; rank `dim M`; irrational torus line; `M = ∅`; non-second-countable `M` | leaves = points; = components; carrier `ℝ`, image dense; vacuous; implication vacuous | true | new |
| `exists_leaf` maximality | disconnected `N'` = two plaques of different leaves | meets leaf, not contained | excluded by `ConnectedSpace N'.carrier` | Check |
| `green_verticalCell` | unit square `P = y`; `ℓ = u`; `ℓ > u` at a point; `P = \|x − ½\|`; `a = b` | `−1 = −1`; `0 = 0`; LHS `≠ 0`, RHS slice empty (excluded by `ℓ ≤ u`); `0 = 0`; excluded by `a < b` | true | new |
| `green_horizontalCell` | unit square `Q = x`; clockwise convention | `1 = 1`; would give `−1 ≠ 1` | true, sign pinned | new |
| `exists_halfSpaceOutwardUnitNormal` | `n = 0` half-line | `T∂M = 0`, `N(0) = −e₀`, unique | true | merged smoothness |
| `integral_divergence_eq_boundaryFlux` with `hN` | half-line, `X` compactly supported; `X = 1` unsupported | `∫₀^∞ X′ = −X(0)` and `⟪X(0), −e₀⟫ = −X(0)`; boundary mass `1`; `X = 1` excluded by support hypothesis | true; equivalent to chosen-normal form since laws determine `N` | normal as hypothesis |
| `halfSpaceBoundaryMetric_continuous` | same statement via local instance | elaborated type names `halfSpaceBoundaryMetric` | unchanged | `letI` removed |
| four `omit [CompleteSpace E]` statements | finite-dimensional `E` | finite-dimensional ⇒ complete, so truth unchanged | true | binder dropped |
| Layer 2 without `[DecidableEq ι]` | `orientationAt` decides in `ℤˣ` | no use of `ι`-equality | unchanged | binder dropped |
| `toFlow` body | complete field | `map_add′`, `map_zero′` from `maximalIntegralCurve_add`, `maximalIntegralCurve_zero` | compiles, no new admitted step | proofs inlined |
| README 0.1 Checks | `(dx ∧ dy)(e₁, e₂)`; degree zero; Lie bracket | `1·1 − 0·0 = 1`; `wedgeWith μ c ψ = μ c ∘ ψ`; associativity ⇔ associativity of `μ` | consistent with `wedgeWith_flip`/`assoc` | added |
| README 0.1 norm bound | `k = l = 0`; general | `C(0,0) = 1`, `‖μ c d‖ ≤ ‖μ‖\|c\|\|d\|`; shuffle count `C(k+l, k)` | true | prose |
| README 2.1 Check | empty `M` | flip identifies the two lifts: one orientation, `o.neg = o` | consistent with `eq_or_eq_neg`; shows why `o.neg ≠ o` needs nonemptiness | added |
| README 2.2 Checks | `ℝ → S¹`; antipodal on `S¹`, `S²` | `γ′(0) = (0,1)` positive at `(1,0)`; `(−1)^(n+1) = +1, −1` | consistent with 2.4 | added |
| `pullbackSign` tangent factor | `μ ↦ −μ` with `card ι = finrank E`; carried-back orientation `a = μ`, `a = −μ` | `a = μ`: `+1 ↦ −1`; `a = −μ`: `−1 ↦ +1` (needs `μ ≠ −μ`, `Module.Ray.ne_neg_self`) | factor negated, proved in a scratch `example` | basis independence Check |
| `pullbackSign` transition factor at `y = x` | any model with corners, including boundary points | change of chart = `id` on `(extChartAt I x).target`, a neighbourhood within `range I`; unique derivative on `range I`; `det id = 1 > 0` | factor `+1`, proved in a scratch `example` | base-point Check |
| `orientationAt (pullback …) x` | `hcard`; `ω x := (df_x)⁻¹ · orientationAt o' (f x)` | `if ω x = μ then μ else −μ = ω x`, because `ω x ∈ {μ, −μ}` (`Orientation.eq_or_eq_neg`) | `f` preserves orientation at `x` with `e = mfderivToContinuousLinearEquiv` | docstring: witness of the existence theorem |
| `pullbackSign_mul_pullbackSign` | `x = x'`; atlas `{t ↦ t on t ≥ 0, t ↦ −t on t < 0}` on `ℝ`, `f = id`, `μ` standard, `y = 1`, `x = 0`, `x' = −1` | `x = x'`: `1 = sign det id = 1`; atlas: `(+1)(+1) · (+1)(−1) = −1 = sign det(t ↦ −t)`; tangent factor alone gives `+1 ≠ −1` | true; the transition factor is needed | new theorem, Check |
| `continuous_pullbackSign` | same atlas, chart at `−1`, `y` across `0`; `M = ∅` | sign `−1` at `y = 1` and at `y = −1` (tangent `−1`, transition `+1`), constant across the chart jump at `0`; vacuous on `∅` | true (local constancy is chart-independent) | new theorem |
| `pullback` vs `f = id`, `o' = o` | any `M` | tangent orientations `id⁻¹ · orientationAt o x`, so by `Manifold.Orientation.ext` the result is `o` | consistent with Tau Ceti's `pullback_id` at main's pin | none |

## Ownership, overlaps and pins

- **DeRhamCohomologyAndDuality (head `1b57dbe`).** It disagrees with this branch in both directions: H15 (layers 6–11 owned by neither side) and H06 (inward domination, now cited here as its own). The split needs one decision before either merges. Nothing in this roadmap's README is defined only by an open revision.
- **Other close roadmaps.** ComplexKahlerGeometry (#1398), CalibratedGeometry (#946) and GlobalHolomorphicFunctions (#992) consume or disclaim this roadmap's layers 0–5 and 12. They show no second owner.
- **Open pull requests changing this folder.** #334 and the pin bump #1187 conflict with this branch in `README.md`/`Suggested.lean`; one must be rebased on the other.
- **Pins.** This branch builds against Tau Ceti `358314d`, but main pins `2fd255d` (`a891cd19`). At that pin:
  - `TauCeti.Manifold.Orientation.pullback` (`Geometry/Manifold/Orientation/Pullback.lean:173`) is the same descent construction as H08's, under the weaker hypothesis of a `C¹` map with invertible differential, together with `isOrientationPreservingAt_pullback`, `eq_pullback_iff` and functoriality. Re-targeting 2.2 onto it at the pin bump deletes `pullbackSign` and its two laws;
  - `TauCeti.Geometry.Manifold.Riemannian.Sphere` does not exist (imported here for the round metric);
  - Tau Ceti already implements much of layers 0–3 as `TauCeti.*` declarations, under `Geometry/Manifold/{DifferentialForm,Orientation,Flow,DeRham}`. Examples are `TauCeti.RoughForm` and `TauCeti.mextDeriv`, and `TauCetiRoadmap/DGFloer` cites `TauCeti.SmoothBundleForm.eval₂`.

  Merging main will therefore need the import repaired, and the README's supplier contracts and Lean carriers re-targeted onto those declarations. That cannot be built in this worktree (manifest untouched). The import this round removed (`TauCeti.Analysis.Contour.PiecewiseC1On`, renamed at main's pin) is no longer needed.
- **Dropped declaration names cited elsewhere.** Main roadmaps cite `CurvatureForm`, `SmoothBundleForm`, `bracketWedge`, `volume_circle`, `circleAngularForm` and `RoughDensity`; all are kept. Open pull requests and GlobalHolomorphicFunctions cite Tau Ceti's own `wedgeWith_apply_one_one`/`mextDeriv_ofFunction` (Tau Ceti files), not this file.

## Sources

No source was fetched. The roadmap has no `sources.toml`, and this job may not create one. The one new locator, [Lee, Thm. 19.21] for global leaves (also the review's), cites a paywalled textbook and is recorded here as `uncertified`. No `needs-references.toml` was written. The review text contains no instruction to run commands or change scope.
