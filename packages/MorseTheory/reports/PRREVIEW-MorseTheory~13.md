# Review of MorseTheory (pull request #1682 at fadc182)

**Verdict:** needs changes

This is a full re-review of `TauCetiRoadmap/MorseTheory/` at head fadc182161aa63ba6f3cfb2582858fc40ba3b419. The folder changed by 587 lines since 8315f03, the head the previous review read. There are six findings, three of them blocking.

R01 has the same root cause as the previous review's R01: the branch is still not rebased. R02 and R04 only apply once the rebase moves the pins to main's.

## R01 (P1) — The branch is still not rebased, so the "pinned" Tau Ceti contract and `Suggested.lean`'s docstring cite 73 declarations missing from this head's pin

**Location:** `TauCetiRoadmap/MorseTheory/README.md:40–42`: "The pinned Tau Ceti Morse library already proves a large part of Layers 1–4 and 6, and the targets it proves are consumed by the names that the Tau Ceti contract lists, not restated". The same claim recurs in:
- the Tau Ceti contract, lines 140–261 and 283–315;
- the "pinned as" sentences of §1.2–§6.1;
- `TauCetiRoadmap/MorseTheory/Suggested.lean:21–34`.

**Claim:** This head's `lake-manifest.json` still pins Tau Ceti a91d3aaf, Mathlib 6b7abb3c and Lean v4.35.0-rc3. At that pin, 73 distinct declarations backticked in the README exist only at main's pin, Tau Ceti 2fd255d, and so do 36 of the Tau Ceti files the README cites. At this head that has four consequences:
- **The deferred targets have no owner.** Every target of Layers 1–4 and 6 that the README defers as pinned is an unowned prerequisite: the layers defer it and `Suggested.lean` omits it. Examples are `TauCeti.criticalPoints`, `TauCeti.exists_sublevelDeformation`, `TauCeti.IsMorse.exists_relCWComplex_sublevel_deformation`, `TauCeti.lsCategoryCount_univ_le_totalCriticalCount` and `TauCeti.exists_tendsto_maximalIntegralCurve_neg_mgradient`.
- **§4.3 and §4.4 rest on missing declarations.** The Reeb theorem of §4.3 is missing. So are all three inputs of §4.4:
  - Brown's Theorem 0, via `IsOpen.image_of_continuousOn_of_injOn`;
  - the boundary clause, via `Homeomorph.coe_apply_mem_frontier_iff`;
  - the final gluing, via `TauCeti.nonempty_homeomorph_sphere_of_union_closedBall`.
- **`Suggested.lean`'s docstring names missing declarations.** It lists eleven declarations "proved at the pinned Tau Ceti", and none of them exists at a91d3aaf. Its lines 18–19 call the inlined set "the defining body of `TauCeti.criticalPoints I f`", which does not exist there either.
- **The links point at the wrong commit.** The source links at README lines 536, 537, 588 and 627 point at Tau Ceti commit 2fd255d, not at this pin.

The gate passes only because `Suggested.lean` imports three modules that exist at both pins. The merge base is still ffcc9d31, and `git merge-tree --write-tree origin/main HEAD` reports CONFLICT in both `README.md` and `Suggested.lean`.

**Witness:** At a91d3aaf, `TauCeti/Geometry/Manifold/Morse/` holds only `Basic.lean`, `Index.lean`, `Prod.lean` and `Sphere/`. At 2fd255d the same directory has `CriticalPoints.lean:87`, `Deformation.lean:199`, `Reeb.lean:148`, `RelCWComplex.lean:298` and `LusternikSchnirelmann.lean:185`.

**Exact repair:**
1. Rebase onto main 3b3f7ef, or merge `origin/main`. Resolve `README.md` and `Suggested.lean` to this head's text. This brings main's `lake-manifest.json` and `lean-toolchain`: Tau Ceti 2fd255d, Mathlib 1b1ccf4 and Lean v4.36.0-rc2.
2. In `Suggested.lean`, import `TauCeti.Geometry.Manifold.Morse.CriticalPoints` and `TauCeti.Geometry.Manifold.Riemannian.Gradient.Basic`. Then replace the inlined bodies by the native names that the README Conventions (lines 76–80) already use:
   - `TauCeti.criticalPoints I f` for the critical set;
   - `TauCeti.totalCriticalCount I f = 2` in the two §4.4 hypotheses;
   - `(TauCeti.criticalCount I f j).toNat` in `strong_morse_inequalities`, which equals the current `ncard` because `Set.ncard` is `ENat.toNat ∘ encard`;
   - `-TauCeti.Manifold.mgradient I f` in `exists_compactTrapped_gradient_limit`.

   Delete docstring lines 18–19.
3. On README line 552, rename `TauCeti.isFredholm_of_finiteDimensional` to `ContinuousLinearMap.isFredholm_of_finiteDimensional` (`TauCeti/Analysis/Fredholm/Basic.lean:68` at 2fd255d). It is the only README name that exists at a91d3aaf but not at 2fd255d.
4. Re-elaborate `Suggested.lean` and re-run the gate at the new pins.
5. Update the pull request's title and description. They still announce "Palais–Smale compactness and nonproper gradient convergence", "M6.1 with the sequential condition" and `PalaisSmaleTargets.lean`. README lines 65–70 place all of that outside this roadmap.

Tested at 2fd255d: every contract entry I opened carries the hypotheses the README states (list under Verified sound). The four names in step 2 exist there, in the files given.

## R02 (P2) — Once rebased, §1.1, §4.1 and §4.3 claim to own four objects that pinned Tau Ceti already proves, and the contract does not cite them

**Location:**
- `README.md:396`: "Own the single boundaryless-model transport on a named `def` type synonym M′ carrying M's topology".
- `README.md:1051–1052`: "The cellular route owned here adds the rank description of the coefficients of Q".
- `README.md:1054`: "Prove subgroups of free abelian groups of arbitrary rank are free".
- `README.md:1251–1254`: "also prove … The equality is `c_j(−f)=c_(m−j)(f)` for 0≤j≤m".

**Claim:** At Tau Ceti 2fd255d, which R01 brings, each of these is a pinned declaration that the Tau Ceti contract (lines 127–320) does not name. For §1.1, the contract cites only the file `Morse/ModelTransport.lean` (line 154) and the pseudo-gradient transport (line 223). It does not cite the transport `TauCeti.BoundarylessModel` itself, and it does not cite `ModelTransport/Immersion.lean`.

| README target | Pinned at 2fd255d |
| --- | --- |
| §1.1, the model-transport synonym with its chart, immersion, critical and index comparisons | `TauCeti.BoundarylessModel` (`TauCeti/Geometry/Manifold/ModelTransport/Boundaryless.lean:35`), with `ModelTransport/Immersion.lean:62–176` and `Morse/ModelTransport.lean:35–91` |
| §4.1, Q's coefficients are the ranks of the cellular differentials | `TauCeti.sum_range_monomial_natCard_cell_mul_finrank_eq_of_cwComplex` (`TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/MorseInequalities.lean:148`); relative form at `:95` |
| §4.1, submodules of free modules over a PID are free, in any rank | `Submodule.free_of_isPrincipalIdealRing` (`TauCeti/LinearAlgebra/FreeModule/PID.lean:42`) |
| §4.3, `c_j(−f)=c_(m−j)(f)` | `TauCeti.IsMorse.criticalCount_neg` (`TauCeti/Geometry/Manifold/Morse/CriticalPoints.lean:426`), for `j ≤ dim M` |

So after the rebase this roadmap and Tau Ceti both own each object.

**Witness:** The CW identity at `MorseInequalities.lean:148` states, in ℕ[X], `Σ cᵢ·dim M·Xⁱ = Σ bᵢXⁱ + (1+X)·Σ rank(dᵢ₊₁)Xⁱ`. That is §4.1's rank description verbatim. `criticalCount_neg` states `criticalCount I (-f) j = criticalCount I f (finrank ℝ E - j)`.

**Exact repair:** after R01:
1. Delete the four target sentences.
2. List the four declarations, with their files, under "From Tau Ceti" and in the Scope paragraph of pinned results.
3. Rewrite §4.1's owned content as "apply the pinned CW identity to the CW model of §2.4".
4. Keep in §1.1 only what the three model-transport files do not provide.
5. Keep §4.3's parity and odd-dimensional Euler corollaries, citing `criticalCount_neg` for the equality.

Tested:
- RP² cells (1,1,1) over ℚ have d₁ = 0 and d₂ = 2. The pinned identity gives Q = rank d₁ + rank d₂·t = t, which is §4.1's Check "C=1+t+t², B=1, Q=t".
- S² with c(f) = (2,1,1) gives c(−f) = (c₂,c₁,c₀) = (1,1,2), which is §4.3's Check.

## R03 (P2) — Two open AlgebraicTopology revisions drop seven AT target names that §2.4 and §4.2 cite as suppliers

**Location:**
- `README.md:883–885`: "Consume Mathlib TopCat pushouts and AT4.5's `relativeCWPushout`, `relativeCWPushoutCWModel`, `homotopyPushoutGluingComparison`, `cofibrationTowerHomotopyEquivalence` and `cwSubcomplexTowerUnion`".
- `README.md:890`, `898` and `901`, which cite `relativeCWPushoutCWModel`, `diskBoundaryRelCW` and `cwSubcomplexTowerUnion`.
- `README.md:344` and `1082`, which cite "the supplement's `normalizedLSCategory`".

**Claim:** On main, AlgebraicTopology names these targets at lines 624, 644, 658, 683, 700, 716 and 1102. Two open revisions of AlgebraicTopology remove all seven names:
- #1652 at head 4e825d6;
- #1663 at head 8029fe9.

The content of the first six stays where the README already points: Stage 4 item 4 and item 5 on main and in #1663, and §4.4 and §4.5 in #1652. It just loses its Lean names. #1663 keeps the normalized category only as prose, at line 1247, and #1652 drops it. When either revision merges, these supplier citations no longer resolve.

**Witness:** `grep -c` at both heads gives 0 for each of the seven names. In #1652, line 1118 reads "Own the CW model of a relative CW pushout" and line 1820 states `lsCupLength_add_one_le_categoryCount`, with no normalized category.

**Exact repair:**
1. In §2.4, keep "AlgebraicTopology §4.4–§4.5". Replace the six backticked names by descriptions:
   - the disk–boundary relative CW pairs and their coproducts (§4.4);
   - the relative CW pushout and its CW model, the homotopy-pushout gluing comparison, the cofibration-tower homotopy equivalence and the CW subcomplex tower union (§4.5).
2. In lines 344 and 1082, drop `normalizedLSCategory`.
3. State §4.2's corollary with unnormalized counts: `#Crit(f) ≥ TauCeti.lsCategoryCount M univ ≥ lsCupLength M R + 1`. This uses the pinned LS bound and AT's cup-length bound, which main (line 1122) and both heads state.

Tested on S¹:
- lsCategoryCount = 2 and cupLength(S¹;ℤ) = 1 give 2 ≥ 1 + 1.
- The height function has 2 ≥ 2 critical points.
- The descriptions resolve at main lines 535–716, at #1652 lines 902–1205 and at #1663 lines 680–806.

## R04 (P3) — Once rebased, the layers keep construction plans for targets the contract itself lists as pinned

**Location:** `README.md:459–470`: "Construct a manifold Morse chart from the preferred-coordinate vector-space Morse lemma … This gives `TauCeti.IsMorse.finite_criticalPoints_inter`". The same pattern appears in:
- §1.2, lines 432–440;
- §2.1, lines 545–657;
- §2.2, lines 686–728;
- §3.1, lines 946–959;
- §4.2, lines 1123–1185;
- §6.1, lines 1531–1548.

**Claim:** Each of these passages is a target, written as "Construct", "Prove" or "Own", whose result the Tau Ceti contract (lines 145–261) and the passage's own "pinned as" sentence say Tau Ceti 2fd255d proves. The README rule says a target that exists elsewhere is deleted and listed under Scope, and that Scope is the only place that says "already in the library". Here about 270 lines re-specify finished work. For example, §2.1 prescribes the section-zero inputs of an atlas that is pinned as:
- `TauCeti.regularLevelChartedSpace` (`RegularValue/Level.lean:234`);
- `TauCeti.scalarRegularSublevelChartedSpace` (`Scalar/Sublevel.lean:473`);
- `TauCeti.boundary_scalarRegularSublevel` (`:652`).

**Witness:** Line 533 says these pinned atlases "realize the construction specified here", while lines 545–657 still instruct how to derive `hf`, `hFred`, `hsurj` and `hindex` for `sectionZeroChartedSpace`.

**Exact repair:** after R01, in each listed passage:
1. Replace the construction prose by a one-line citation of the pinned declaration.
2. Keep its Checks only where they test something still owned.

Keep construction prose only for the owned remainder that lines 56–63 already list:
- the handle homeomorphism and the chart-change comparisons of §2.2–§2.3;
- the CW model of §2.4;
- the polynomial and integral forms of §4.1, less R02;
- the cup-length and component corollaries of §4.2;
- the applications of §4.3;
- §4.4;
- Layer 5;
- §6.1's passage to arbitrary forward curves.

Tested on §2.1: all eight declarations in contract lines 168–186 exist at 2fd255d (lines in Verified sound). The section's Checks for f = x and f = x² remain valid as tests of `TauCeti.exists_regularFiber_smoothEmbedding`.

## R05 (P3) — The gate, re-run with the brief's command, fails `dropped` on three mentions of HomotopySpheres

**Location:**
- `README.md:17–19`: "The symmetric-space and Bott applications use the same broken-path carrier and the attachments here, following HomotopySpheres §4B."
- `README.md:1493` and `1610`, which name it again as a consumer.

**Claim:** The project's dropped-names list contains `HomotopySpheres`, and the gate refuses any mention of a listed name (rule "no name of the project's dropped-names list").

The worker's `gate.md` recorded `dropped=0` on this same head. My run of `tauceti-roadmap … gate <worktree> MorseTheory --base origin/main` printed `dropped=3 … FAIL`. All three mentions are consumer notes; no target depends on them.

**Witness:** The gate output reads "dropped: line 19: HomotopySpheres §4B.", "dropped: line 1493: …" and "dropped: line 1610: RiemannianGeometry R3 and HomotopySpheres §4B use the finite Morse/Bott".

**Exact repair:** Remove the roadmap name from the three sentences:
- line 19: "The symmetric-space and Bott applications use the same broken-path carrier and the attachments here.";
- line 1493: "RiemannianGeometry R3 and the Bott-periodicity path applications supply …";
- line 1610: "RiemannianGeometry R3 uses …".

Then `grep -c HomotopySpheres README.md` is 0 and the `dropped` scan has nothing to match.

## R06 (P3) — `bettiNumber`'s API is one sentence without hypotheses, and no Check pins its junk value

**Location:** `README.md:1062–1064`: "Define `bettiNumber` as the dimension over k of native singular homology. Its API includes homotopy invariance, coefficient-sensitive calculations and finite dimensionality on compact manifolds".

**Claim:** The README form requires each definition to list its API as bullets, each with hypotheses and conclusion. `bettiNumber` is the only definition in `Suggested.lean`, and its API is one clause. The missing hypotheses matter: `Module.finrank` returns 0 on infinite-dimensional homology, so `bettiNumber` is a total function with a junk value. None of the §4.1 Checks exercises that case; all of them use finite complexes.

**Witness:** For X = ℕ with the discrete topology, `H₀(X;k)` is the direct sum of countably many copies of k, which is infinite-dimensional. So `bettiNumber k ℕ 0 = 0`, although X has infinitely many path components.

**Exact repair:** Write three API bullets:
1. For a homotopy equivalence X ≃ Y in one universe, `bettiNumber k X j = bettiNumber k Y j`.
2. For a compact manifold M of dimension m, `H_j(M;k)` is finite-dimensional, so `bettiNumber` is its dimension, and it vanishes for j > m. After R01, cite `TauCeti.IsMorse.finite_singularHomology` (`Inequalities.lean:393`).
3. The value depends on k: for RP² at j = 1 it is 0 over ℚ and 1 over 𝔽₂.

Add the discrete-ℕ junk-value Check. Tested: RP² gives b₁ = 0 over ℚ and 1 over 𝔽₂, which matches §4.1's Checks. Discrete ℕ gives 0 where the true dimension is ℵ₀.

## Previous findings

- **R01 of the previous review (rebase onto main): not repaired.** The merge base is still ffcc9d31, and both files still conflict with main. The head added further citations that hold only at main's pin, for example `TauCeti.BoundarylessModel.IsMorse.exists_isAdaptedPseudoGradient`, `TauCeti.exists_bandHomeomorph` and `TauCeti.minCriticalCount`. This is R01 above.
- **R02 of the previous review (restatements of pinned Tau Ceti in `Suggested.lean`): repaired, except step 1.**
  - Repaired:
    - The three definitions and eight theorems are gone, and `Suggested.lean` now has 8 declarations.
    - Docstring lines 21–43 cite the pinned headlines and name only the handle comparison and the Morse–Bott attachment as not stated.
    - README §2.1 (lines 659–666) cites `TauCeti.exists_regularFiber_smoothEmbedding` with Lee, Corollary 5.14 and Proposition 5.38.
  - Not repaired: step 1, use `TauCeti.criticalPoints` and its counts. The author inlined the bodies instead, which is defensible at a91d3aaf, where `CriticalPoints.lean` does not exist. Step 2 of R01 now carries this.
- No repair report marks a finding "not actionable in this package".

## Verified sound

**Gate, dependencies, elaboration.**
- Worktree clean at fadc182. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/MorseTheory'` is empty.
- Dependency check: `depcheck: 244 roadmaps, 2464 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. All suppliers are roadmaps on main: DifferentialGeometry, AlgebraicTopology, GeometricTopology, CharacteristicClasses, ComplexKahlerGeometry, ComplexManifolds and DGFloer.
- Gate rerun: every check passes except `dropped=3` (R05).
- `lake env lean TauCetiRoadmap/MorseTheory/Suggested.lean` at the head's pins exits 0 in 7 s. Its only output is 7 `declaration uses sorry` warnings, at lines 67, 93, 108, 123, 146, 160 and 174.
- **Signatures.** A scratch copy with `set_option pp.universes true` and `#check @name` for all 8 declarations elaborated. Each type agrees with its README statement:
  - The standing binders (T2, second countable, boundaryless, finite-dimensional, `IsManifold I ∞`) are present on the five manifold theorems.
  - `omit` correctly drops them from Brown and the two-open-cell lemma.
  - `bettiNumber.{u_1}` puts k and X in one universe, as the Conventions say.
  - `exists_morseCWModel` has a free universe `u_4` for X. That is true: the critical set of a Morse function on a second-countable manifold is countable, so a CW model exists in every universe.

  Nothing changed after this check.
- **One-tactic probe.** I replaced each `sorry` by `first | rfl | simp | infer_instance | aesop | trivial | decide` and elaborated. All 7 theorems fail, so there is no padding.

**Library declarations opened at Tau Ceti 2fd255d (main's pin), with hypotheses compared with the contract text:**
- `Deformation.lean`, standing T2, boundaryless, finite-dimensional and `IsManifold I ∞`:
  - `exists_sublevelDeformation`, line 199: `a ≤ b`, compact band, `mfderiv ≠ 0` on the band;
  - `exists_ambientSublevelDeformation`, line 283: no `a ≤ b` and no buffer;
  - `exists_criticalLevelDeformation`, line 315: δ > 0, U open, conclusion `0 < ε < δ`.
- `RelCWComplex.lean:298`: `0 < ε ≤ δ`, finite relative CW, cells ≃ index-m critical points on the level.
- `Inequalities.lean`, with factor `finrank k V`:
  - weak inequality at line 403;
  - strong inequality at line 414;
  - Euler's equality at line 429, for `finrank ℝ E ≤ n`.
- `LusternikSchnirelmann.lean:185`: compact M, `ContMDiff ∞`.
- `GradientFlow.lean`:
  - line 208, `ContMDiff 2`, trapped curve;
  - line 261, finite `criticalPoints ∩ K`;
  - line 282, proper and bounded below.
- `ExponentialConvergence.lean:303`: nondegenerate limit, `∀ᶠ t in atTop`.
- `Reeb.lean:148`: compact, T2, boundaryless, `IsMorse`, `totalCriticalCount = 2`.
- `Hemisphere.lean:377`: closed A and B, A ∪ B = univ, ball homeomorphisms matching A ∩ B with the unit sphere, `finrank E = finrank F + 1`.
- `InvarianceOfDomain.lean:160, 201, 257`: `ChartedSpace E M` and `ChartedSpace F N` with equal finrank.
- `Generic/Strong.lean`:
  - lines 267 and 290, sigma-compact;
  - line 110, relative approximation, `tsupport (g − f) ⊆ Cᶜ`;
  - line 279, proper approximation within 1.
- `NormalizedChart.lean:196`: f smooth near x.
- `CriticalPoints.lean:274`: `IsManifold I 1`.
- `ManifoldLevel.lean:257`: `1 ≤ m`, interior value, regular value; model `Fin (finrank E − finrank F) → ℝ`.
- `Sublevel.lean:162`: unique minimum, compact sublevel above it.
- `CriticalHessian.lean:71`: `ContMDiffAt 2`, critical point.
- `MinCriticalCount.lean:68`.
- `Topology/Homotopy/LusternikSchnirelmann.lean`: `pad` at line 182 needs `Nonempty X`; also lines 264 and 287.

**Also opened:**
- At both pins: `natCard_zerothHomotopy_sphere_compl_range_eq_two` (`JordanBrouwer.lean`, line 212 at a91d3aaf), for a continuous injection with `finrank F = finrank E + 1`.
- At both pins: the section-zero family (`Section/Chart.lean:123–263`), `boundaryChartedSpace` (`Boundary/Charts.lean:195`) and `sqrtNearOne`.
- At Mathlib, both pins: `onePointEquivSphereOfFinrankEq` and `Homeomorph.onePointCongr`.
- At Mathlib 1b1ccf4: `Topology.CWComplex` is a class of its own (`Topology/CWComplex/Classical/Basic.lean:135`), and `Manifold.riemannianEDist` is at `Riemannian/PathELength.lean:208`.
- A resolver over all 150 backticked README names: 72 exist at both pins, 73 distinct declarations and 36 files only at 2fd255d (R01), and one only at a91d3aaf (R01 step 3). The rest are this roadmap's own targets, hypothesis names or other roadmaps' names, checked below.

**Cross-roadmap citations, resolved on main (3b3f7ef):**
- DifferentialGeometry:
  - Layer 3, line 371;
  - Layer 5 and §5.1 `boundaryOrientation_spec`, lines 503–509; the anchor `#layer-5-integration-and-stokes-theorem` is from heading 503 and is kept at the #886 head, line 720;
  - §10.2 Sard, line 884;
  - §12.2 gradient and §12.3 Hessian, lines 918–922.
- AlgebraicTopology:
  - Stages 2, 4, 6 and 8, lines 326, 499, 946 and 1602;
  - Stage 4 items 4–6, lines 535, 635 and 789;
  - the Stage 6 item 1 integral UCT; the #1652 head keeps it in §6.1, line 1750;
  - the LS supplement, lines 1082–1122.
- GeometricTopology Layer 1, line 177.
- CharacteristicClasses C2.
- ComplexKahlerGeometry K1 (line 96) and K7.1–K7.2.
- ComplexManifolds Milestone 1, line 172, with its anchor.
- DGFloer Layer 1 item 3, the filtered-complex spectral object, line 621; kept at the #1798 head.
- HeegaardFloer Lane M, line 70.
- RiemannianGeometry R3.
- SymplecticGeometry/ConvexityToric T2, line 73.
- AffineMorseLefschetz.
- Both HeegaardFloer anchors into this roadmap, `#m2-…` at line 647 and `#m5-…` at line 1064, are mapped old → new at README lines 375–381. No open pull request cites another MorseTheory anchor (`roadmaps grep`).

**Ownership against open pull requests:**
- MorseNovikov (rev 1161) and RiemannianGeometry (rev 1327, rev 1683) consume MorseTheory by the labels M1–M6. This head keeps those labels in its layer headings.
- No other open roadmap states the two-critical-point sphere theorem or a Morse CW model.
- Brown's generalized Schoenflies theorem is owned by MorseTheory on main (main README line 668) and here. The GeometricTopology revision (rev 903, §2.2, line 1377) and FourManifolds (rev 936, gap `brown-schoenflies`, line 223) assign it to GeometricTopology. A revision is never a supplier and GeometricTopology on main does not own it, so those pull requests should cite MorseTheory §4.4. This is not a finding here.

**Sources, seeded sample.** Cohen–Iga–Norbury's printed page is the PDF page minus 13; for example, `cohen-iga-norbury` line 995 prints 27 on PDF page 40.

| Target | Locator | Checked at | Result |
| --- | --- | --- | --- |
| 1.1 | none (a construction) | adversarial row 1 | no locator needed; R02 |
| 1.2 | none (definitions) | row 2 | — |
| 1.3 | CIN Thm 5.3, pp. 36–37; Cor 5.4, p. 38 | cohen-iga-norbury lines 1322–1330, 1423–1424 | Morse lemma at a nondegenerate point of index λ; a Morse critical set is discrete |
| 2.1 | Lee, Cor 5.14, Prop 5.38 | uncertified (settled) | — |
| 2.2 | Milnor 1963, Thm 3.1, p. 12 | Not verifiable; CIN Thm 5.1, line 1202 (p. 33), agrees | — |
| 2.3 | Milnor 1963, Lemma 3.6, pp. 20–21 | Not verifiable | — |
| 2.4 | Milnor 1963, Thm 3.5, p. 20; CIN Thm 5.7, pp. 40–41 | cohen-iga-norbury lines 1519–1548 | closed M, Morse f, one λ-cell per index-λ point |
| 3.1 | Hirsch Ch. 2 §1; Ch. 6 Thm 1.2 | uncertified (settled) | — |
| 3.2 | Milnor 1963, Cor 6.7, p. 36 | Not verifiable | — |
| 4.1 | CIN Cor 5.11 and proof, p. 42 | lines 1569–1596 | closed M, field R; proof gives c_k = d_(k+1) + b_k + d_k, so Q's t^j coefficient is d_(j+1) = rank ∂_(j+1), as README line 1068 says |
| 4.2 | Weber Thm 1.1, p. 2; proof pp. 2–3 | weber-conley lines 62–67, 73–106 | C² f on a closed manifold; cat = least ℓ ≥ 1 with ℓ open nullhomotopic sets |
| 4.3 | CIN Application 5.13, p. 43 | line 1617–1619 | closed Mⁿ, Morse, two critical points ⇒ homeomorphic to Sⁿ |
| 4.4 | Milnor 1959, Thm 1(3), p. 440; Cor 1, p. 442 | milnor-1959 lines 53, 72–76, 109, 117–119 | compact M covered by two open sets diffeomorphic to ℝⁿ; Cor 1 gives homeomorphic to Sⁿ |
| 4.4 | Brown 1960, Thms 0–4, pp. 74–76; Thm 5, p. 76 | brown-1960 lines 25–36, 37–59, 60–68, 69–81, 84–100, 101–113 | README lines 1367–1377 paraphrase each correctly; collar over [0,1], middle sphere at 1/2; Thm 0 invokes invariance of domain (line 33) |
| 5.1 | CIN Thms 15.1, 15.4, 15.6–15.7, pp. 143, 146–148 | lines 4986, 5091, 5142, 5161 (PDF 156, 159, 160) | pages exact |
| 6.1 | CIN Thm 4.6, pp. 27–29 | lines 1022–1098 (PDF 40–42) | closed M, Morse f (Definition 4.2, line 873) |

**Adversarial table.** Every value was computed this round.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §1.1 model transport (sample) | f(x)=x rechart y=2x; half-line model | df/dy = 1/2, chain rule (1/2)·2 = 1; range [0,∞) ≠ ℝ = range of a boundaryless model | transport, not equality of coordinate derivatives | R02 (pinned as `BoundarylessModel`) |
| 2 | §1.2 Hessian and counts (sample) | −x²+y²; constant on S¹; f=0 and f=x² on ℝ; a point | Hessian diag(−2,2), c₁=1, c₀=c₂=0; encard = ⊤ while `Nat.card` = 0; λ(f)+λ(−f): 0+0 = 0 ≠ 1, 0+1 = 1; empty Hessian, count 1 | nondegeneracy needed for the complementary index | R04 |
| 3 | §1.3 normal forms and persistence (sample) | x²; x²+tx; x³−tx; δx² on [−1,1] and [−1/2,1/2] | chart y = x gives f = y², Hessian 2; branch −t/2, value −t²/4, index 0; ±√(t/3) for t>0, none for t<0, f″ = 0 at t=0; suprema (δ,2δ,2δ) and (δ/4,δ,2δ) | order 2 does not shrink | R04 |
| 4 | §2.1 levels and faces (sample) | f(x,y)=x at 0; x² at 0; dimension 0; f=x on [a,b] | model `Fin (2−1) → ℝ`, range span e₂ = ker(1,0); df = 0, tangent image 0 ≠ ker df = ℝ; `0 − 1 = 0` in ℕ; outward df = +1 at b, −1 at a | sound | R04 |
| 5 | §2.2 deformation and adapted fields (sample) | x², a=1, b=4; a=−1, b=4; −u²+v² | band [−2,−1]∪[1,2] critical-free, r(x) = sign(x) on \|x\|>1; band contains 0 and {f≤−1} = ∅, not a retract of [−2,2]; X=(2u,−2v): df(X) = −4u²−4v²; X=(−2u,−2v): +4u² on v=0 | hypotheses needed, sign pinned | R04 |
| 6 | §2.3 handle comparison (sample) | (x²−1)² with charts ±x√(2−x²); RP² at [0:0:1] | 1 − x²(2−x²) = (x²−1)²; α±(1) = ±√(1−1/√2) = ±0.5412 with f = 0.5000; {f≤1/2} = {0.541 ≤ \|x\| ≤ 1.307}, two components; 2 − f = (2X²+Y²)/(1+X²+Y²); retracted attaching map φ ↦ [cos φ/√2 : sin φ : 0] covers the core twice, degree +2, and −2 after reflection | Checks exact | none |
| 7 | `exists_morseCWModel` (headline, sample 2.4) | S² height; x² on ℝ; ∅; f=x on ℝ; discrete ℕ with f(n)=n | cells (1,0,1); one 0-cell; none; f=x is proper and not `BddBelow`, cells ↔ ∅ forces X = ∅ ≄ ℝ; ℵ₀ 0-cells; the critical set is countable, so universe u_4 is unconstrained | `BddBelow` necessary and present | none |
| 8 | §3.1 strong topology (sample) | tolerance e^(−x²) vs constant 0.01; δψ restricted to (0,1) | fails for x > √(ln 100) = 2.146; at 0<x<δ, δψ(x) = δ > x | strong ≠ compact-open; restriction to a non-closed open set is discontinuous | R04 |
| 9 | §3.2 exhaustion (sample) | x² with C⁰ error < 1; ∅; discrete ℕ | g > −1, {g≤b} ⊆ {x² < b+1} compact; the empty function is proper, bounded below and vacuously Morse; f(n)=n proper, a constant not | sound | R04 |
| 10 | `strong_morse_inequalities` (headline, sample 4.1) | RP² over ℚ and 𝔽₂; S² with c=(2,1,1); control c=(2,0,0,2), b=(1,0,0,1) | C−B = t+t² = (1+t)t; 𝔽₂: Q=0; C−B = 1+t, Q=1; 1+t³ = (1+t)(1−t+t²), coefficient −1 ∉ ℕ, and q₁ = (0−2)−(0−1) = −1 < 0 | ℕ[t] encodes the strong inequalities | R02 (CW rank form pinned) |
| 11 | `bettiNumber` (definition) | point; S¹; RP² over ℚ and 𝔽₂; discrete ℕ | (1,0,…); (1,1,0,…); (1,0,0) and (1,1,1); H₀ infinite-dimensional but value 0 | junk value unchecked | R06 |
| 12 | §4.2 LS bound (sample) | S¹ height; T² height; constant on S¹; ∅ | 2 ≤ 2; 3 ≤ 4; 2 ≤ ⊤; 0 ≤ 0; Weber's cat ≥ 1 equals `lsCategoryCount` for M ≠ ∅; cupLength(S¹)+1 = 2 ≤ 2 | sound | R03, R04 |
| 13 | §4.3 applications (sample) | CP¹, f = \|z₁\|²/(\|z₀\|²+\|z₁\|²); S² with c=(2,1,1) | near [1:w]: \|w\|²/(1+\|w\|²) ≈ \|w\|², index 0; near [u:1]: 1/(1+\|u\|²) ≈ 1−\|u\|², index 2; 2−1+1 = 2 = χ; c(−f) = (1,1,2) = (c₂,c₁,c₀) | sound | R02 (`criticalCount_neg`) |
| 14 | `nonempty_homeomorph_sphere_of_two_criticalPoints` (headline, sample 4.4) | h−h³/3 on S²; h² on S^m; two copies of S²; two points | h = cos r gives f = 2/3 − r⁴/4 + O(r⁶), Hessian 0, f(S) = −2/3; h²: count ⊤ (m≥2) or 4 (m=1), but 2 critical values; ≥ 4 critical points; {±1} = S⁰ | smooth-only statement correct | none |
| 15 | `exists_twoEuclideanOpenCover_of_two_criticalPoints` (headline) | round S¹, f=h; case a+ε > b−δ | ‖grad h‖ = √(1−h²), η = √3/2, η² = 3/4, (b−a)/η² = 8/3; K ⊆ {f ≤ b−δ} ⊆ {f < a+ε} ⊆ B, so T = 0 | flow estimate needs no normal form | none |
| 16 | `exists_closedBall_homeomorph_closure_of_bicollar` (headline) | m=0; m=1; equator of S² | S⁻¹ = ∅, Σ = ∅, A = {1}, B = {−1}, closures ≃ {0}, the iff reads false ↔ (‖0‖ = 1); two arcs with endpoints Σ; hemispheres with frontier the equator | Brown Thm 5 plus frontier clause | none |
| 17 | `nonempty_homeomorph_sphere_of_two_euclidean_opens` (headline) | S¹ as two arcs; a point with m=0; ℝ^m | glued arcs give S¹; 1 point ≠ 2 = #S⁰, so `0 < m` is needed; not compact; U ∩ V = ∅ would make U ≃ ℝ^m clopen and compact | sound | none |
| 18 | §5.1 Morse–Bott (sample) | y² vs y⁴; negative Möbius line; RP² cells | kernel span e₁ = T C vs ℝ²; H₀(S¹;ℤ^w) = ℤ/2 vs ℤ; E¹ = (ℤ,ℤ,ℤ), d = 2, E² = (ℤ, ℤ/2, 0) | sound | none |
| 19 | `exists_compactTrapped_gradient_limit` (headline, sample 6.1) | x², x₀ = 1; metric 4dx²; γ ≡ p; f = e^(−x) | γ = e^(−2t), E = e^(−4t), tail e^(−2t); grad = x/2, γ = e^(−t/2), distance 2e^(−t/2); distance 0; γ′ = e^(−γ) > 0, γ → ∞, trap fails | rate depends on metric, as the Check says | none |
| 20 | R01 citations | README names at a91d3aaf vs 2fd255d | 72 at both; 73 distinct declarations and 36 files only at 2fd255d; `TauCeti.isFredholm_of_finiteDimensional` only at a91d3aaf | contract empty at own pin | R01 |
| 21 | R03 AT names | seven names at main vs #1652 and #1663 | main lines 624–1102 vs 0 occurrences at each head | supplier ids dropped | R03 |
| 22 | R05 gate | worker `gate.md` vs rerun | `dropped=0` vs `dropped=3` | rerun fails | R05 |

## Not verifiable

- **Milnor, *Morse Theory* (1963).** The README uses it for §2.2 (Theorem 3.1, p. 12), §2.3 (Lemma 3.6, pp. 20–21), §2.4 (Theorem 3.5, p. 20) and §3.2 (Corollary 6.7, p. 36). The sources service, run into a scratch copy of the manifest, answered "no legal source found". The roadmap's `sources.toml` has no entry for this work. Where Cohen–Iga–Norbury Theorems 5.1 and 5.7 cover the same statements, the README agrees with them.
- **`hirsch-differential-topology` and `lee-smooth-manifolds`:** uncertified and settled; cited by locator.
- **Thomas Mark, Math240 Homework 11:** no legal text. It is used only for bibliographic attribution.
- **Elaboration at main's pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d):** only Lean commands run from this worktree are permitted, so I compared signatures by reading the 2fd255d sources. In particular, I did not check whether `Topology.RelCWComplex.cell (Set.univ) j` elaborates from a `Topology.CWComplex` instance at 1b1ccf4, where `CWComplex` is a separate class (line 135). R01 step 4 covers this.
- **Gate discrepancy:** I cannot tell which dropped-names list the worker's run used. R05 reports the rerun.
- **Ownership against ManifoldOptimization (#1506) and the second MorseNovikov pull request (#1854):** the brief gives no files for them, so ownership against them was not checked.

## Source issues

- **Misprint** in cohen-iga-norbury at Corollary 5.11 and its proof, p. 42: the source says the alternating sums over k have summands c_i(f) and b_i(M) with the fixed index i; it should be c_k(f) and b_k(M); affects nothing.
- **Gap** in brown-1960 at Theorem 1, proof, p. 75: the source says the maps h_i converge because consecutive sup-distances are below 1/(i+1); it should be that h_j agrees with h_i off Q_i and preserves h_i(Q_i), so the distance from h_j to h_i is below 1/i for all j > i; affects the proof.
- **Gap** in cohen-iga-norbury at Theorem 4.6, proof, p. 28: the source says the derivative of f∘γ tends to 0 because f∘γ is bounded and decreasing; it should be that −‖∇f‖²∘γ is integrable and uniformly continuous in t on compact M, hence tends to 0; affects the proof.
