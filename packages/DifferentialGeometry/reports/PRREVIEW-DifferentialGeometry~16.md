# Review of DifferentialGeometry (pull request #886 at b5e32fc)

**Verdict:** needs changes

This is an incremental re-review of the 64 lines changed since `3d4316f`.

- **Repaired:** the previous R02. Section 2.3 now cites Tau Ceti's `IsLocalHomeomorph.chartedSpaceComap`, which is present at the folder's pin, so this roadmap no longer defines anything there that would need Checks.
- **Not repaired:** the previous R01 (stale pin and conflict with main) and R03 (the description states no merge order). R01 is still the only blocking finding.
- **New:** the rewritten 2.3 text has four P3 defects (R02–R05).

The gate passes. `Suggested.lean` elaborates with `sorry` as its only warning. The dependency check reports 0 problems.

## R01 (P2) — Written against Tau Ceti `358314d4`; main pins `2fd255d9`, which proves or declares much of this file, and `Suggested.lean` conflicts with main

Re-raised: H01 (and H02). The board has no newer repair report, so these are the ids from the last one this review could read. Their reason, that merging main is outside a repair job's files, says who has to act. It does not make the folder mergeable, so the finding stands, and it needs the worker or a human.

**Location.**

- `lake-manifest.json` still pins Tau Ceti `358314d4` with Lean `v4.35.0-rc3`. Main (`8192659d`) pins `2fd255d9` with Lean `v4.36.0-rc2`.
- `Suggested.lean:50–52`, rewritten this round, reads: "the equivalences of 2.4 lack the orientation double cover with its topology (2.4), from which Tau Ceti's `IsLocalHomeomorph.chartedSpaceComap` (2.3) would give its smooth structure".

**Claim.** Everything in r15 R01 still holds. At `2fd255d9`:

- 22 of the 60 admissions are proved there, sorry-free.
- These carriers are native there: `flowOf`, `mgradient`, `laplaceBeltrami`, `fullSimplex`, `Orientation`, `OrientationLift`, `IntegralManifold` and `integralTopForm`.
- README 315–318 still records both revision hashes.

This round adds one more stale claim. The rewritten docstring clause above is false at main's pin, because Tau Ceti there builds the orientation double cover, with charts from `chartedSpaceComap`, and proves the equivalences of 2.4.

One of r15's repair steps is done: the gradient sentence (r15 README 385) is deleted.

**Witness.** `git merge-tree --write-tree HEAD origin/main` lists `DifferentialGeometry/Suggested.lean` at stages 1, 2 and 3. At `2fd255d9`:

- `Orientation/Cover/Basic.lean:71` is `orientable_iff_exists_section` and `:79` is `orientable_iff_not_connectedSpace`.
- `Cover/Smooth.lean:46–47` takes its charts from `chartedSpaceComap`.
- None of these files contains a `sorry`.

**Repair.** Follow r15 R01 steps 1–7, with two additions.

1. **Take none of main's sorry'd definitions when resolving `Suggested.lean`.** Main's copy declares data with `sorry` bodies: `IsCoveringMap.inducedChartedSpace … := sorry` (main `Suggested.lean:1048–1050`), `OrientationCover.topologicalSpace := sorry` (`:1143–1144`) and `canonicalOrientation := sorry` (`:1189–1191`). This head correctly has none of them. Keep only the adapter names that main's importers use (r15 R01 step 2).
2. **Remove the 2.4 clause from the docstring's list of statements that are not statable.** Cite 2.4's equivalences under *From Tau Ceti* as `TauCeti.Manifold.OrientationCover.orientable_iff_exists_section` and `orientable_iff_not_connectedSpace`.

The finding is repaired when `git merge-tree` reports no conflict and the targeted build passes at `2fd255d9`.

## R02 (P3) — 2.3 describes the pulled-back chart in the wrong direction

**Location.** README 898–900 reads: "`IsLocalHomeomorph.chartedSpaceComap` is the charted structure on `X` whose chart at `x` is the local inverse of `p` at `x` followed by the chart of `M` at `p x`".

**Claim.** The composite described does not typecheck:

- the local inverse of `p` at `x` maps an open subset of `M` into `X`;
- the chart of `M` at `p x` takes points of `M`, not of `X`.

The chart is actually `p`, restricted to the sheet through `x`, followed by the chart of `M` at `p x`. The clause that follows ("it reads `y` as the chart of `M` at `p x` reads `p y`") is correct, and it is inconsistent with the quoted clause.

**Witness.** At both pins, `Comap.lean:68` reads `chartAt x := (hp.localInverseAt x).symm.trans (chartAt H (p x))`. Mathlib types `localInverseAt` as `OpenPartialHomeomorph Y X` for `f : X → Y` (`Topology/IsLocalHomeomorph.lean:286`), and `:294` proves `(localInverseAt x).symm = f`.

**Repair.** Replace the quoted clause with: "whose chart at `x` is the restriction of `p` to an open neighbourhood of `x` that `p` maps homeomorphically onto an open subset of `M` (the inverse of the local inverse of `p` at `x`), followed by the chart of `M` at `p x`".

Test it on `p(t) = exp(it)`. The chart at `t₀` reads `t` as the chart of `S¹` at `exp(it₀)` reads `exp(it)`. With an angle chart this is `t + c`, which agrees with `chartAt_chartedSpaceComap_apply`.

## R03 (P3) — The `exp(i t³)` refutation credits the uniqueness theorem with its converse

**Location.** README 2429–2430 reads: "The uniqueness of 2.3 gives the same conclusion: for the standard structure `p` is not a local diffeomorphism, since its derivative `3t² · i exp(i t³)` vanishes at `0`."

**Claim.** README 906–908 states the uniqueness this way: a `C^n` structure for which `p` is a local diffeomorphism is compatible with the pulled-back structure. On the standard `ℝ` that hypothesis fails, because `p'(0) = 0`, so the uniqueness theorem says nothing about the standard structure.

The conclusion is still right, but it comes from two different facts:

- `p` is a local diffeomorphism for the pulled-back structure;
- compatible structures have the same local diffeomorphisms.

**Witness.** `compatible_chartedSpaceComap` (Tau Ceti `2fd255d9`, `Comap.lean:194`) takes the hypothesis `hpc : IsLocalDiffeomorph I I n p`. For `p(t) = exp(i t³)` with the standard charts, `p'(0) = 3·0²·i = 0`, so `hpc` is false.

**Repair.** Replace "The uniqueness of 2.3 gives the same conclusion:" with:

> `IsLocalHomeomorph.isLocalDiffeomorph_chartedSpaceComap` gives the same conclusion: `p` is a local diffeomorphism for the pulled-back structure, so it would be one for any compatible structure, but

Keep the rest of the sentence.

## R04 (P3) — `compatible_chartedSpaceComap` is cited in `Comap.lean` but is absent at the folder's Tau Ceti pin

**Location.**

- README 250–257 (*From Tau Ceti*, smooth structures on covers) lists `IsLocalHomeomorph.compatible_chartedSpaceComap` among the declarations of `Geometry/Manifold/Instances/Comap.lean`.
- README 906–908 cites it as 2.3's uniqueness.

**Claim.** The de Rham bullet (README 315–318) says which revision it cites; this bullet does not. Read at the folder's pin, it cites a declaration that does not exist there. Every other name that the bullet and 2.3 cite does exist at that pin.

**Witness.**

- At `358314d4`, `Comap.lean` has 186 lines and 0 occurrences of `compatible_chartedSpaceComap`.
- At `2fd255d9`, the theorem is at `Comap.lean:194`, and `Projectivization/Atlas.lean:162` uses it.

**Repair.** Merging main (R01 step 1) makes the citation true at the folder's pin. Until then, list `compatible_chartedSpaceComap` among the declarations cited at the content repository's pin (README 315–318), not in the unmarked bullet.

## R05 (P3) — 2.3 drops the name that the Lie-groups roadmap cites, with no old → new line

**Location.** README 910–911 reads: "2.4 and the Lie-groups roadmap's simply connected covers consume these names."

**Claim.** On main, the Lie-groups roadmap cites 2.3 as `IsCoveringMap.inducedChartedSpace`. That is the name main's DifferentialGeometry gives 2.3, in its README (357–360) and in `Suggested.lean:1048`. This head keeps the id 2.3 but drops the name and gives no mapping. So the quoted sentence is false of main's Lie-groups text, and that citation breaks at the merge.

**Witness.**

- Main's `RepresentationTheory/LieGroups/README.md:524–525` reads: "the differential-geometry roadmap's 2.3 (`IsCoveringMap.inducedChartedSpace`), consumed here".
- This head's README contains 0 occurrences of `inducedChartedSpace`.

**Repair.** In 2.3, replace the quoted sentence with:

> 2.4 and the Lie-groups roadmap's simply connected covers consume 2.3; the name `IsCoveringMap.inducedChartedSpace H hp` under which they cite it is `hp.isLocalHomeomorph.chartedSpaceComap`.

No other roadmap, on main or at an open head, cites the old 2.3 names: `induced_unique`, `of_comp_isCoveringMap`, `induced_isManifold` and `induced_isLocalDiffeomorph` each have 0 hits.

## R06 (P3) — Two other open pull requests change this folder, and the description states no order

Re-raised: H06, the last known id. This is r15 R03, carried forward. The previous reason, that the description is outside the job's files, still fails: the worker or the author can edit the description.

**Location.** The pull-request description (data). It contains neither `334` nor `1187` (0 matches).

**Claim.** #334 replaces this folder. #1187 bumps Tau Ceti to `ab00ba392`, which is an ancestor of main's `2fd255d9`. Both conflict with this head.

**Witness.** The overlap report at this head says: "#334 and #886 conflict in `…/README.md`, `…/Suggested.lean`" and "#886 and #1187 conflict in … `TauCetiRoadmap/DifferentialGeometry/Suggested.lean`, … `lake-manifest.json`".

**Repair.** Add one sentence to the description, not to the README:

> This head supersedes #334; for this folder #1187 is subsumed by main's Tau Ceti pin, and its conflict disappears once this branch merges main.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d4`, `Suggested.lean` still conflicts with main `8192659d`, and README 316–317 keep both hashes. Only the gradient sentence was deleted. Re-raised as R01.
- R02 — repaired: README 894–911 now cites Tau Ceti's `chartedSpaceComap` (`Comap.lean:66`, at both pins) and plans nothing, so no Checks are owed. r15's premise that no such constructor existed was wrong. The rewrite introduced R02–R05.
- R03 — not repaired: the description still names neither #334 nor #1187. Re-raised as R06.

## Verified sound

**Gate.** My rerun of `gate … DifferentialGeometry --base origin/main` reports every scanner at `0` and `OK`. The worker's run, which includes the targeted build, reports `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DifferentialGeometry'` is empty.

**Dependency check** (`--movable`):

    depcheck: 236 roadmaps, 2281 edges, 0 problem(s)

It prints no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/DifferentialGeometry/Suggested.lean` exits 0 in 86 s, with 60 `declaration uses 'sorry'` warnings and no other diagnostic.

**Signatures and padding.** Since `3d4316f`, the diff of `Suggested.lean` touches only the module docstring (lines 50–52). The 121 declarations and their binders are the ones r15 checked with `#check @…`, and r15's padding probe still applies: of 60 admissions, none closes with one tactic. The two closures r15 found among the proved lemmas are part of R01.

**Library declarations opened for the changed passages (15).**

- Tau Ceti `358314d4`, `Geometry/Manifold/Instances/Comap.lean`:
  - `chartedSpaceComap` (`:65–66`) is an `@[instance_reducible] noncomputable def`, not an instance, as README 908–910 says.
  - `chartAt_chartedSpaceComap_apply` (`:81`).
  - `isManifold_chartedSpaceComap` (`:96`), which takes `[IsManifold I n B]`.
  - `contMDiffWithinAt`, `contMDiffAt`, `contMDiffOn` and `contMDiff_chartedSpaceComap_iff` (`:119`, `:134`, `:142`, `:150`), each "continuous and composite `C^n`".
  - `isLocalDiffeomorph_chartedSpaceComap` (`:168`).
- Tau Ceti `Instances/UniversalCover.lean:64`: `TauCeti.UniversalCover.instChartedSpace := (isCoveringMap x₀).isLocalHomeomorph.chartedSpaceComap`. This is the instance README 910 describes, on a type built together with its map.
- Tau Ceti `2fd255d9`, `Comap.lean:194`: `compatible_chartedSpaceComap`, compatibility of the two atlases in `contDiffGroupoid n I`.
- Mathlib:
  - `IsCoveringMap.isLocalHomeomorph` (`Topology/Covering/Basic.lean:339`).
  - `IsLocalHomeomorph.chartedSpace` (`Geometry/Manifold/ChartedSpace.lean:603`), which needs `Function.Surjective f`.
  - `MulAction.instChartedSpaceQuotient` (`Geometry/Manifold/Instances/Quotient.lean:49`), under `ProperlyDiscontinuousSMul`, `IsCancelSMul`, `ContinuousConstSMul`, `T2Space` and `LocallyCompactSpace`.
  - `IsLocalHomeomorph.localInverseAt` and `localInverseAt_symm` (`Topology/IsLocalHomeomorph.lean:286`, `:294`).

The rewritten Mathlib covering-space bullet (README 233–237) is accurate: both Mathlib constructions put charts on the base of the cover.

**Cross-roadmap citations of the changed passages.**

- RicciFlow (#1023 head, README 51, 142, 596, 664, 1228, 1333) cites 2.3 only by id and by "smooth structures on covers", so it still resolves.
- The Lie-groups roadmap on main cites 2.3 by a dropped name (R05).
- The ownership bullet (README 108–110) and the scope paragraph (README 44–46) agree with 2.3.

**Overlaps.** The id §5.5 that this pull request drops is still mapped to 5.5a and 5.5b at README 37–39. No open pull request drops an id this README cites, and no id it cites is defined only by an open revision.

**Ownership.** The change removes the only duplication in its scope: 2.3's construction is Tau Ceti's and is no longer planned here. CKG #1807, #1854 and #1808 were not given with files; their READMEs, read through `roadmaps grep`, cite 12.3 only.

**Seeded sample (8 targets).** All eight lie outside the changed hunks. The first nine lines of each passage at this head (README 373, 1044, 1194, 1551, 1682, 1767, 1787 and 1802) are byte-identical to r15's lines 358, 1017, 1167, 1524, 1655, 1740, 1760 and 1775, so r15's verification stands. "Smooth 2-forms" remains out of date at main's pin; that is part of R01. The README flags no locator as unverified (0 matches).

**Headline theorems** (README 13–18). They are unchanged since r15 and are stated, or listed as not statable, as r15 recorded. The one rewritten clause, about 2.4, is in R01.

**Adversarial table.** Rows marked r15 are carried from the previous report for statements this diff leaves untouched; the other rows were computed in this review.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 2.3 chart formula (README 898–901) | Lean body vs prose; `p = exp(i·)` | Lean: `(localInverseAt x).symm.trans (chartAt H (p x))`, and `.symm = p` (Mathlib `:294`), so the chart is `chart_{p x} ∘ p`. Prose: chart composed after the local inverse `M → X`, which is ill-typed. With `exp(i·)`, the chart reads `t` as `t + c` | prose reversed; the "reads `p y`" clause is right | R02 |
| 2.3 smooth-lift criterion, `p = exp(i t³)`, `f = ∛` | `t = 2`; difference quotients at `0` | `∛2 = 1.259921`, `(∛2)³ = 2.000000`, `p(∛t) = exp(it)` exactly. `∛h / h` = `100.0` at `h = 10⁻³` and `10000.0` at `h = 10⁻⁶` | `∛` is smooth into the pulled-back structure but not into the standard one, so the structures are incompatible (README 2424–2429 holds) | none |
| 2.3 uniqueness applied to the standard `ℝ` (README 2429–2430) | hypothesis of `compatible_chartedSpaceComap` | `p'(t) = 3t²·i·exp(it³)`: `|p'(1)| = 3`, `p'(0) = 0`, so `hpc` is false and the theorem says nothing here. The conclusion follows from `isLocalDiffeomorph_chartedSpaceComap` (`:168`) and invariance under compatibility | conclusion true, attribution wrong | R03 |
| 2.3 uniqueness citation at the folder's pin | `grep` in `Comap.lean` at both pins | `358314d4`: 0 occurrences in 186 lines. `2fd255d9`: line 194 | absent at the folder's pin | R04 |
| 2.3 degenerate cases | `p = id_M`; `n = 0`; a non-surjective `(0,1) ↪ ℝ` | `id`: chart at `x` reads `y` as `chart_x(y)` (`:81`), the atlas of `M` restricted. `n = 0`: every local homeomorphism is a `C^0` local diffeomorphism. No surjectivity binder in `Comap.lean`, so "onto" in README 898 reads as "into", as in Tau Ceti's own docstring | holds | none |
| 2.3 consumers | Lie groups on main; RicciFlow #1023 | LieGroups README 524–525 cites `IsCoveringMap.inducedChartedSpace`, which has 0 occurrences at this head. RicciFlow cites only the id | Lie-groups citation broken | R05 |
| Mathlib covering-base bullet (README 233–237) | both declarations | `instChartedSpaceQuotient` on `orbitRel.Quotient G M`; `IsLocalHomeomorph.chartedSpace` with `Surjective f`; both build charts on the target of the covering map | true | none |
| `Suggested.lean:50–52`, "2.4 not statable" | both pins | `358314d4`: 0 `OrientationCover` files. `2fd255d9`: `isCoveringMap_proj` (`Cover/Basic.lean:63`), `:71`, `:79`, charts via `chartedSpaceComap` (`Cover/Smooth.lean:46–47`), 0 `sorry` | true at the folder's pin, false at main's | R01 |
| r15: `exists_isSliceChart_integralManifold` | `span e₁` on `ℝ²`; irrational leaf on `T²`; rank 0 | `IsSliceChart refl P₀ (range (u ↦ (u,0)))` and `finrank P₀.direction = 1` elaborate; the dense leaf lies in no line; rank 0 gives `{e x}` | true, non-vacuous | none |
| r15: `isCompleteVectorField_of_compactSpace`, `toFlow_apply` | branch vs main consumers | branch MorseNovikov `:220`, `:224`; main imports `Mathlib` only; native `Flow/Complete.lean:154` | padding after the merge | R01 |
| r15: headlines vs main's pin | 60 admissions | 22 proved sorry-free at `2fd255d9`; `green_ac_winding` identical | stale pin | R01 |
| r15: 5.5b facet signs on `Q²` | outward-first determinants | `det(−e₀,e₁) = −1`, `det(−e₁,e₀) = +1`; corner endpoints `+1`, `−1` | matches `(−1)^(i+1)` | none |
| r15: 5.5b product signs on `[0,1]²` | `ω = y dx` | `∫dω = −1.0`; top edge `−1.0`; without `(−1)^m` the sign is `+1` | holds | none |
| r15: 5.5b fibres | `Q²` at `(0,t)`, `(t,0)`, `(0,0)` | `1, 1, 2`; `2` at the square's corners | holds | none |
| r15: 5.1 half-space sign | boundary chart `x ↦ (0,x)` | `det(−e₀,e₁,…) = −1`; half-plane `det(−e₀,−e₁) = +1` | consistent with 5.5b | none |
| r15: 12.4 volume Checks | `diag(4,1)`; `X = x∂ₓ+y∂ᵧ`; `e^{2x}δ` | `√det g = 2.0`; `div = 2`; finite difference `2.000000` | holds | none |
| r15: 12.3 `hessian`, `mgradient` | `e^{2x}δ`, `f = x₁`; `diag(4,1)` | `Γ²₂₁ = 1`, `e^{−2x}·e^{2x} = 1.0`; `grad x₁ = ¼∂₁` | covariant, metric-dependent | none |
| r15: `integral_divergence_eq_boundaryFlux` | `[0,∞)`, `X = e^{−t}∂ₜ`; `X = 1` | `∫f' = −1.000000`, flux `−1`; `X = 1` fails `hSupport` | holds; the support hypothesis is needed | none |
| r15: punctured family | `α = 0.7` at `(0.8,−0.3)`; the circle | curl `0.7478685` both ways; loop integral `6.283185` for every `α` | closed iff `α = 1` | none |
| r15: ellipse, `θ = 2π√t`, HK gate, weak field | `a = 2`, `b = ½`; `h = t² sin t⁻²`; `P = |x−½|` | `3.141593` three ways; `3.14154`; `sin 1 = 0.841471`, `∫|h'|` grows (`3.033`, `4.568`); boundary `1.0` = area | holds | none |
| r15: `green_verticalCell` | unit square, `P = y` | `−1 = −1` | holds | none |
| r15: contact adapter | `S(x,y,z) = (y,x,z)` | `S^*(dz − x dy) = dz − y dx`; `α(∂z) = 1` | matches the pin | none |
| r15: `Density`, `m < dim` | `dim 3`, `m = 2` | `(2³ − 2²)·toFun v = 0` | forced to zero | none |
| r15: local flow, global law | `v = x²` at `0` | local flow `x/(1−tx)` extends | true as stated | none |
| r15: `timeDependentFlowDomain_eq_univ` | `J = (0,1)`; `(0,1)∪(2,3)` | the second is excluded by `OrdConnected` | holds | none |
| r15: hairy ball | `n = 0, 1, 2` | `S¹`: `ix` is nowhere zero; `S²`: zero at the poles | parity needed | none |
| r15: 8.3 corner route | `[0,∞)`, `x = 0`, `x₀ = 1` | `−ε ∉ range I` for `t < 0` | needs a time cutoff, which is allowed | none |

## Not verifiable

- [Lee] GTM 218, [Tu] GTM 275, [Bott–Tu] GTM 82 and [Milnor]: no legal open copy (the earlier fetch of Lee was `uncertified`). The change set adds no locator into any of them: 0 added lines contain `[Lee`. Tau Ceti's `Comap.lean` cites Lee, Chapter 4, which this review did not open.

## Source issues

- none
