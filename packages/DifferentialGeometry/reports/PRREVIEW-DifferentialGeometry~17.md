# Review of DifferentialGeometry (pull request #886 at af91579)

**Verdict:** needs changes

This is an incremental re-review of the 69 lines changed since `b5e32fc`.

- **Repaired:** the previous R02–R05. The 2.3 chart now has the right direction. The `exp(i t³)` refutation credits the right theorem. `compatible_chartedSpaceComap` is now cited at the revision that has it. The Lie-groups name has an old → new line.
- **Not repaired:** the previous R01 (stale pin, conflict with main) and R06 (the description states no merge order). R01 is still the only blocking finding.
- **New:** the new 2.4 paragraph names two results of Tau Ceti's orientation cover. The same modules prove most of the rest of 2.4, which the README still plans (R02, P3).

The gate passes. `Suggested.lean` elaborates with `sorry` as its only warning. The dependency check reports 0 problems.

## R01 (P2) — Written against Tau Ceti `358314d4`; main pins `2fd255d9`, which proves or declares much of this file, and `Suggested.lean` conflicts with main

Re-raised: H01 (and H02). The board has no newer repair report. The reason the last one gave was that merging main is outside a repair job's files. That reason says who has to act; it does not make the folder mergeable. So the finding stands, and it needs the worker or a human.

**Location.**

- `lake-manifest.json` still pins Tau Ceti `358314d4`, with Lean `v4.35.0-rc3`. Main (`000abc14`) pins `2fd255d9`, with Lean `v4.36.0-rc2`.
- README 316–317 still record both hashes.
- This round adds five more clauses that compare the two revisions: README 254–255, 342–344, 914–915 and 927, and `Suggested.lean:50–55`.

**Claim.** Everything in r15 and r16 R01 still holds:

- 22 of the 60 admissions are proved sorry-free at `2fd255d9`.
- These carriers are native there: `flowOf`, `mgradient`, `laplaceBeltrami`, `fullSimplex`, `Orientation`, `OrientationLift`, `IntegralManifold` and `integralTopForm`.

One of the 22 is `orientable_of_forall_index_ne_two` (`Suggested.lean:764`). The new 2.4 text now points straight at the module that proves it (R02).

**Witness.** `git merge-tree --write-tree HEAD origin/main` lists `TauCetiRoadmap/DifferentialGeometry/Suggested.lean` at stages 1, 2 and 3. At `2fd255d9`, `Orientation/Cover/FundamentalGroup.lean:41` proves `TauCeti.Manifold.orientable_of_forall_index_ne_two` with 0 `sorry`.

**Repair.** Follow r15 R01 steps 1–7, with r16's two additions and one more:

1. **Take none of main's sorry'd definitions when resolving `Suggested.lean`.** Leave out `IsCoveringMap.inducedChartedSpace … := sorry` (main `Suggested.lean:1048–1050`), `OrientationCover.topologicalSpace := sorry` (`:1142–1143`) and `canonicalOrientation := sorry` (`:1190–1192`).
2. **Shorten the docstring's "not statable" list.** Drop the 2.4 clause (`Suggested.lean:50–55`), now that the pin has the cover.
3. **Remove the revision comparisons.** After the merge, replace every "at the Tau Ceti revision the content repository pins" clause with a plain *From Tau Ceti* citation: README 48, 254, 263, 316–317, 333, 344, 914–915, 927 and 1086.

The finding is repaired when `git merge-tree` reports no conflict and the targeted build passes at `2fd255d9`.

## R02 (P3) — 2.4's new paragraph cites two results of Tau Ceti's orientation cover and leaves the rest, which the same modules prove, as targets

**Location.**

- README 927–936 reads: "two of these equivalences are proved for a `C¹` manifold `M` modelled on a finite-dimensional space: … ; 2.4 consumes them by name there."
- The *Needs:* line, README 949–950, still reads: "Tau Ceti's universal-cover classification (`AlgebraicTopology/UniversalCover/`) for `orientable_of_forall_index_ne_two`".
- The "Already in the library" paragraph (README 48–56) lists layers 6–10 and leaves out 2.4.

**Claim.** The paragraph says that 2.4 consumes "them", the two equivalences. A reader therefore takes the rest of 2.4 as work still to do. Yet at the same pin, the modules the paragraph cites (and the involution module) are sorry-free and also provide:

- the canonical orientation of the cover;
- the deck involution, as a diffeomorphism that reverses that orientation and has no fixed point;
- the π₁ criterion. It needs only `[ConnectedSpace M]`; `Suggested.lean:764` also assumes `T2Space` and `LocallyPathConnectedSpace`;
- the invariant and anti-invariant parts, with their sum, their compact support for a proper `τ`, and the descent criterion.

The README's own rule (README 51–52) is that a subsection that is already in the library names its declarations and plans nothing again. 2.4 breaks it.

**Witness.** At `2fd255d9`, all sorry-free:

- the canonical orientation: `Cover/Smooth.lean:108`;
- the orientation-reversing deck diffeomorphism: `:149` and `:170`;
- no fixed point: `Topology/VectorBundle/Orientation/Cover.lean:216`;
- the π₁ criterion: `Cover/FundamentalGroup.lean:41`;
- the descent API: `Cover/Descent.lean:68` and `DifferentialForm/Involution.lean:42`, `:48`, `:123`, `:234`.

**Repair.**

1. **Rewrite the 2.4 paragraph.** In README 929–936, replace everything from "two of these equivalences are proved" to "consumes them by name there." with:

   > for a `C¹` manifold `M` modelled on a finite-dimensional space, Tau Ceti proves:
   >
   > - the canonical orientation of the cover (`TauCeti.Manifold.OrientationCover.canonicalOrientation`);
   > - the deck involution as a diffeomorphism reversing it (`deckDiffeomorph`, `isOrientationReversingAt_deck`, `Orientation/Cover/Smooth.lean`), with no fixed point (`TauCeti.VectorBundleOrientationCover.deck_ne_self`);
   > - `TauCeti.Orientable I M` exactly when the projection has a continuous section (`orientable_iff_exists_section`), and, for connected `M`, exactly when the cover is not connected (`orientable_iff_not_connectedSpace`, `Orientation/Cover/Basic.lean`);
   > - the π₁ criterion for connected `M`, with no separation hypothesis (`TauCeti.Manifold.orientable_of_forall_index_ne_two`, `Orientation/Cover/FundamentalGroup.lean`);
   > - the descent API except its commutation with `d`: `TauCeti.invariantPart`, `TauCeti.antiInvariantPart`, `TauCeti.invariantPart_add_antiInvariantPart` and `TauCeti.isCompact_tsupport_invariantPart` (`DifferentialForm/Involution.lean`), and `TauCeti.Manifold.OrientationCover.exists_mpullback_proj_eq_iff` (`Orientation/Cover/Descent.lean`).
   >
   > 2.4 consumes them by name there. What remains a target is the triviality of the cover, the commutation of `(1 ± τ^*)/2` with `d` for a `C²` involution, and the orientation of `Sⁿ` with its antipodal sign.

2. **Repoint the *Needs:* line.** Make the π₁ item "`TauCeti.Manifold.orientable_of_forall_index_ne_two` at the content repository's pin".
3. **Add 2.4 to the scope paragraph.** In README 48–51, insert "the orientation double cover of 2.4 with its canonical orientation, deck involution, the two equivalences, the π₁ criterion and the descent criterion".
4. **Delete the admitted theorem.** The admission at `Suggested.lean:764` is deleted under R01 step 2 of r15.

I checked these citations on four instances, each against the cited hypotheses:

- `S²` (π₁ trivial) is orientable.
- `ℝP²` fails the hypothesis, because `{1}` has index 2.
- `S¹` fails it too (`2ℤ` has index 2), although `S¹` is orientable, so the criterion is only sufficient.
- `S¹ ⊔ Möbius` shows why `[ConnectedSpace M]` is needed in `orientable_iff_not_connectedSpace`: its cover is disconnected, but `M` is not orientable.

## R03 (P3) — Two other open pull requests change this folder, and the description states no order

Re-raised: H06, the last known id. This is r16 R06 carried forward. The reason given before was that the description is outside the job's files. It still fails, because the worker or the author can edit the description.

**Location.** The pull-request description (data). It contains neither `334` nor `1187` (0 matches).

**Claim.** Both pull requests conflict with this head, and the description does not say which merges first:

- #334 replaces this folder.
- #1187 bumps Tau Ceti to `ab00ba392`, which is an ancestor of main's `2fd255d9`.

**Witness.** The overlap report at this head says: "#334 and #886 conflict in `…/README.md`, `…/Suggested.lean`" and "#886 and #1187 conflict in … `TauCetiRoadmap/DifferentialGeometry/Suggested.lean`, … `lake-manifest.json`".

**Repair.** Add one sentence to the description, not to the README:

> This head supersedes #334; for this folder #1187 is subsumed by main's Tau Ceti pin, and its conflict disappears once this branch merges main.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d4`. `git merge-tree HEAD origin/main` (`000abc14`) still conflicts in `Suggested.lean`. README 316–317 keep both hashes. Re-raised as R01.
- R02 — repaired: README 903–907 now read "the restriction of `p` to an open neighbourhood of `x` that `p` maps homeomorphically onto an open subset of `M` (the inverse of the local inverse of `p` at `x`), followed by the chart of `M` at `p x`".
- R03 — repaired: README 2447–2451 now read "`IsLocalHomeomorph.isLocalDiffeomorph_chartedSpaceComap` gives the same conclusion: `p` is a local diffeomorphism for the pulled-back structure, so it would be one for any compatible structure, but for the standard structure it is not one".
- R04 — repaired: README 254–255 and 914–915 now place `compatible_chartedSpaceComap` "at the Tau Ceti revision the content repository pins". It is at `Comap.lean:194` there, and absent at `358314d4`.
- R05 — repaired: README 918–920 now read "The Lie-groups roadmap cites the structure as `IsCoveringMap.inducedChartedSpace H hp`; for a covering map `hp : IsCoveringMap p` that name stands for `hp.isLocalHomeomorph.chartedSpaceComap (H := H)`."
- R06 — not repaired: the description still contains neither `334` nor `1187` (0 matches). Re-raised as R03.

## Verified sound

**Gate.** My rerun of `gate … DifferentialGeometry --base origin/main` reports every scanner at `0` and `OK`. The worker's run, which includes the targeted build, reports every check passed. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DifferentialGeometry'` is empty.

**Dependency check** (`--movable`):

    depcheck: 235 roadmaps, 2259 edges, 0 problem(s)

It prints no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/DifferentialGeometry/Suggested.lean` exits 0 in 35 s. It gives 60 `declaration uses 'sorry'` warnings and no other diagnostic.

**Signatures and padding.** Since `b5e32fc`, the diff of `Suggested.lean` touches only the module docstring (lines 50–55). So the 121 declarations and their binders are the ones r15 checked with `#check @…`. r15's padding probe still applies: of the 60 admissions, none closes with one tactic.

**Lean probe of the changed 2.3 text.** A scratch file importing `Mathlib` and Tau Ceti's `Instances/Comap` elaborates with exit 0. It checks three things:

- `hp.isLocalHomeomorph.chartedSpaceComap (H := H) : ChartedSpace H X` for `hp : IsCoveringMap p`. This is the type of main's `IsCoveringMap.inducedChartedSpace H hp` (main `Suggested.lean:1048`).
- `chartAt H x y = chartAt H (p x) (p y)` under that structure.
- `⇑(hp.localInverseAt x).symm = p`.

**Library declarations opened for the changed passages (21).**

- Tau Ceti `358314d4`, `Instances/Comap.lean`:
  - `chartedSpaceComap` (`:66`), with body `(hp.localInverseAt x).symm.trans (chartAt H (p x))`;
  - `chartAt_chartedSpaceComap_apply` (`:81`);
  - `isManifold_chartedSpaceComap` (`:96`, with `[IsManifold I n B]`);
  - `contMDiff_chartedSpaceComap_iff` ("continuous ∧ `C^n` composite");
  - `isLocalDiffeomorph_chartedSpaceComap`, with no extra hypothesis.

  The file has 0 occurrences of `compatible_chartedSpaceComap`.
- Tau Ceti `2fd255d9`:
  - `Instances/Comap.lean:194`, `compatible_chartedSpaceComap`. It takes `[IsManifold I n B] [c : ChartedSpace H M] [IsManifold I n M] (hpc : IsLocalDiffeomorph I I n p)` and concludes compatibility in `contDiffGroupoid n I`, as README 912–915 say.
  - `Orientation/Cover/Basic.lean`: `:55`, `OrientationCover`; `:63`, `isCoveringMap_proj`; `:71`, `orientable_iff_exists_section`; `:79`, `orientable_iff_not_connectedSpace` with `[ConnectedSpace M]`. All of them sit under `[FiniteDimensional ℝ E] [IsManifold I 1 M]`, which is README's "a `C¹` manifold modelled on a finite-dimensional space".
  - `Orientation/Basic.lean:263`, `TauCeti.Orientable`, which takes the two arguments `I M`, as written in README 931.
  - `Orientation/Cover/Smooth.lean:46–47`, charts `(isCoveringMap_proj I M).isLocalHomeomorph.chartedSpaceComap`, as README 928–929 say. The same file has `:108`, `:137`, `:149` and `:170` (R02).
  - `FundamentalGroup.lean:41`; `VectorBundle/Orientation/Cover.lean:216`; `Descent.lean:68`; `Involution.lean:42`, `:48`, `:123`, `:234` (R02).

  None of these files contains a `sorry`.
- Mathlib: `IsLocalHomeomorph.localInverseAt` (`Topology/IsLocalHomeomorph.lean:286`, typed `OpenPartialHomeomorph Y X`) and `localInverseAt_symm` (`:294`).

**The rewritten file lists (README 315–344).**

- I checked all 43 module paths of the de Rham bullet (21 `DeRham/*`, 2 `SmoothSingular/*`, `Measure`, `RegularValue`, 2 `Sard/*`, `Degree/Basic`, the new `Orientation/Sign`, 4 `Orientation/Cover/*`, the new `ContMDiff/OnSubset`, `HomotopyOperator`, `Poincare`, 4 `Integration/*` including the new `Path`, `FullSimplex`, `Exhaustion`, `Analysis/…/Poincare`). Every one is absent at `358314d4` and present at `2fd255d9`, as the bullet says.
- Of the 11 algebraic-topology paths, exactly the three that the new sentence names (`Cohomology/UniversalCoefficient`, `Cohomology/MayerVietoris/Basic`, `Singular/BrouwerFixedPoint`) are absent at `358314d4`. The other 8 exist at both revisions.

**Docstring clause (`Suggested.lean:50–55`).** It is true at both revisions. `358314d4` has 0 files mentioning `OrientationCover`; `2fd255d9` has the two cited theorems at `Basic.lean:71` and `:79`.

**Cross-roadmap citations of the changed passages.**

- Lie groups, on main (`RepresentationTheory/LieGroups/README.md:525`), cites `IsCoveringMap.inducedChartedSpace`. README 918–920 now map that name.
- RicciFlow (#1023 head) cites 2.3 and 2.4 by id only (README 51, 596, 664, 1228, 1333, 1513, 1542, 1594, 1650). Both ids are kept.
- No roadmap, on main or at an open head, cites a name that this round drops.

**Overlaps.** The id §5.5 that this pull request drops is still mapped to 5.5a and 5.5b at README 37–39. No open pull request drops an id this README cites, and no id it cites is defined only by an open revision. The two conflicting pull requests are R03.

**Ownership.** 2.3 plans nothing; it cites Tau Ceti. 2.4's ownership against Tau Ceti at the content pin is R02. In the closest open roadmaps (DeRhamCohomologyAndDuality at #2085, CKG #1807/#1854/#1808, GlobalHolomorphicFunctions at #992), no new duplication arises from the changed passages. DeRhamCohomologyAndDuality consumes this roadmap and does not restate 2.3 or 2.4.

**Seeded sample (8 targets).** All eight lie outside this round's hunks (README 253–257, 318–344, 903–936, 2447–2451): README 378, 1062, 1212, 1556, 1569, 1785, 1805 and 1820. Their text is byte-identical to `b5e32fc`, so r15's verification stands. "Smooth 2-forms" is still out of date at main's pin; that is part of R01. The README flags no locator as unverified (0 matches).

**Headline theorems** (README 13–18, docstring 19–42). They are unchanged since r15. The one rewritten clause, about 2.4, is accurate at both revisions. The π₁ headline it sits next to is part of R01 and R02.

**Adversarial table.** Rows marked r15 or r16 are carried from those reports, for statements this diff leaves untouched. The other rows were computed in this review.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 2.3 chart formula, rewritten (README 903–907) | Lean probe; `p = exp(i·)`; `p = exp(i·³)`; `p = id` | Probe: `chartAt H x y = chartAt H (p x) (p y)` and `(localInverseAt x).symm = p` elaborate. `exp(i·)`: chart at `t₀` reads `t` as `t + c`, `c ∈ 2πℤ`. `exp(i·³)`: reads `t` as `t³ + c` (`t = 1.1 ↦ 1.331 + c`). `id`: chart of `M` | prose now matches Lean | none |
| 2.3 "into" (README 903) | non-surjective `(0,1) ↪ ℝ` | `Comap.lean` has no surjectivity binder; "into" is right | holds | none |
| 2.3 uniqueness, cited at main's pin (README 254–255, 912–915) | `grep` at both revisions | `358314d4`: 0 occurrences. `2fd255d9`: `:194`, with hypotheses as stated | holds | none |
| `exp(i t³)` refutation, rewritten (README 2447–2451) | derivative; pulled-back chart at `0`; compatibility | `p'(t) = 3t²·i·e^{it³}`: `|p'(0)| = 0`, `|p'(1)| = 3`, `|p'(2)| = 12`. In the pulled-back chart at `0`, `p` reads `u ↦ u`, with derivative `1`. Compatible structures make `id` a `C^n` diffeomorphism, so the local-diffeomorphism property transfers | true; the uniqueness theorem is correctly not invoked | none |
| Lie-groups name map (README 918–920) | main's signature; probe | main `:1048`: `IsCoveringMap.inducedChartedSpace (H) (hp : IsCoveringMap p) : ChartedSpace H X`; replacement elaborates at `ChartedSpace H X` | holds | none |
| 2.4 section equivalence (README 930–932) | `S¹`; Möbius band; `M = ∅`; `dim 0` point | `S¹`: section ✓, orientable ✓. Möbius: cover is a connected cylinder, no section, not orientable. `∅`: empty section, orientable. Point: two orientations of `ℝ`, section ✓ | holds both ways, with no connectedness needed | none |
| 2.4 connected equivalence (README 932–934) | `S¹`, `ℝP²`, `S¹ ⊔ Möbius` | `S¹`: cover has 2 components, orientable. `ℝP²`: cover `S²` connected, not orientable. `S¹ ⊔ Möbius`: cover has 3 components, yet not orientable | `[ConnectedSpace M]` is needed and is present | none |
| 2.4 what else is at the content pin | Tau Ceti `2fd255d9` | `Smooth.lean:108/137/149/170`, `Cover.lean:216`, `FundamentalGroup.lean:41` (only `[ConnectedSpace M]`, vs `Suggested.lean:764` with `T2Space` and `LocallyPathConnectedSpace`), `Descent.lean:68`, `Involution.lean:42–245`; no `d`-commutation lemma | 2.4 plans what is proved | R02 |
| π₁ criterion | `S²`, `ℝP²`, `S¹` | trivial π₁, so orientable; `{1}` has index 2 in `ℤ/2`, so the hypothesis fails; `2ℤ` has index 2 in `ℤ`, so it fails although `S¹` is orientable | sufficient only, as stated | none |
| AT sentence (README 342–344) | 11 paths at both revisions | 3 absent at `358314d4` and present at `2fd255d9`; 8 present at both | holds | none |
| De Rham bullet additions (README 323–327) | 43 paths at both revisions | all absent at `358314d4` and present at `2fd255d9` | holds | none |
| Docstring 2.4 clause (`Suggested.lean:50–55`) | both revisions | `358314d4`: 0 `OrientationCover`; `2fd255d9`: `:71`, `:79` | true at each revision | R01 (revision narrative) |
| r16: 2.3 smooth-lift criterion, `p = exp(i t³)`, `f = ∛` | `t = 2`; quotients at `0` | `(∛2)³ = 2.000000`; `∛h/h = 100.0` at `10⁻³` and `10000.0` at `10⁻⁶` | incompatible structures | none |
| r16: Mathlib covering-base bullet | both declarations | both chart the base of the cover | true | none |
| r15: `exists_isSliceChart_integralManifold` | `span e₁` on `ℝ²`; irrational leaf; rank 0 | slice elaborates; dense leaf lies in no line; rank 0 gives `{e x}` | true, non-vacuous | none |
| r15: `isCompleteVectorField_of_compactSpace`, `toFlow_apply` | branch vs main consumers | native `Flow/Complete.lean:154` | padding after the merge | R01 |
| r15: headlines vs main's pin | 60 admissions | 22 proved sorry-free at `2fd255d9` | stale pin | R01 |
| r15: 5.5b facet signs on `Q²` | outward-first determinants | `det(−e₀,e₁) = −1`, `det(−e₁,e₀) = +1` | matches `(−1)^(i+1)` | none |
| r15: 5.5b product signs on `[0,1]²` | `ω = y dx` | `∫dω = −1.0`; top edge `−1.0` | holds | none |
| r15: 5.5b fibres | `Q²` at `(0,t)`, `(t,0)`, `(0,0)` | `1, 1, 2` | holds | none |
| r15: 5.1 half-space sign | chart `x ↦ (0,x)` | `det(−e₀,e₁,…) = −1` | consistent with 5.5b | none |
| r15: 12.4 volume Checks | `diag(4,1)`; `X = x∂ₓ+y∂ᵧ` | `√det g = 2.0`; `div = 2` | holds | none |
| r15: 12.3 `hessian`, `mgradient` | `e^{2x}δ`; `diag(4,1)` | `Γ²₂₁ = 1`; `grad x₁ = ¼∂₁` | covariant, metric-dependent | none |
| r15: `integral_divergence_eq_boundaryFlux` | `[0,∞)`, `X = e^{−t}∂ₜ`; `X = 1` | `−1.000000` both sides; `X = 1` fails `hSupport` | holds | none |
| r15: punctured family | `α = 0.7`; the circle | curl `0.7478685` both ways; `6.283185` | closed iff `α = 1` | none |
| r15: ellipse, HK gate, weak field | `a = 2, b = ½`; `t² sin t⁻²`; `|x−½|` | `3.141593`; `sin 1 = 0.841471`; boundary `1.0` = area | holds | none |
| r15: `green_verticalCell` | unit square, `P = y` | `−1 = −1` | holds | none |
| r15: contact adapter | `S(x,y,z) = (y,x,z)` | `S^*(dz − x dy) = dz − y dx` | matches the pin | none |
| r15: `Density`, `m < dim` | `dim 3`, `m = 2` | `(2³ − 2²)·toFun v = 0` | forced to zero | none |
| r15: local flow, global law | `v = x²` at `0` | `x/(1−tx)` extends | true | none |
| r15: `timeDependentFlowDomain_eq_univ` | `(0,1)∪(2,3)` | excluded by `OrdConnected` | holds | none |
| r15: hairy ball | `n = 0, 1, 2` | `S¹`: `ix` is nowhere zero; `S²`: zero at the poles | parity needed | none |
| r15: 8.3 corner route | `[0,∞)`, `x₀ = 1` | `−ε ∉ range I` | needs a time cutoff | none |

**Remark on untouched text** (not a finding): the *Needs:* line at README 949–950 predates this round. R02 asks for its change only because the new paragraph now cites the module that proves the item.

## Not verifiable

- [Lee] GTM 218, [Tu] GTM 275, [Bott–Tu] GTM 82 and [Milnor]: no legal open copy (the earlier fetch of Lee was `uncertified`). The change set adds no new locator into any of them. The one locator in the changed lines, [Lee, Thm. 15.41–15.43] at README 927, is unchanged text.

## Source issues

- none
