<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12769#issuecomment-6894856105 -->
Review (claude) of c7e9432

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) Second copy of a roadmap that is on main

   **Location.** The whole package: `packages/SobolevMapsBetweenManifolds/README.md:1`
   "# Roadmap: sobolev maps between manifolds" and
   `packages/SobolevMapsBetweenManifolds/Suggested.lean:32`
   "namespace TauCetiRoadmap.SobolevMapsBetweenManifolds".

   **Claim.** The package adds the roadmap folder `TauCetiRoadmap/SobolevMapsBetweenManifolds` as a
   new roadmap.

   **Witness.** Main (`1a19c9f`) has `TauCetiRoadmap/SobolevMapsBetweenManifolds/` (README 1905 lines,
   `Suggested.lean` 603 lines), added by commit `7767aa4` of 2026-11-13, "SobolevMapsBetweenManifolds:
   roadmap". Same folder, same namespace, different text.

   **Confirmation that it is a copy and not a revision.** The package text is not main's with changes:

   - Main has 11 layers and 42 numbered sections; the package has 8 layers and 29. The first 60 lines
     of the two READMEs differ in 114 diff lines; the titles differ in capitalisation.
   - `Suggested.lean` on main declares 42 names, the package 21. Only two names are common,
     `MemLpLoc` and `MemW1pLoc`, and both have different signatures under the same fully qualified
     name. Main (`TauCetiRoadmap/SobolevMapsBetweenManifolds/Suggested.lean:66`, `:71`) writes
     `MemLpLoc (p) (U : Set E) (u : E → F)` and `MemW1pLoc (p) (Ω : Opens E) (u)` against `volume`.
     The package (`Suggested.lean:37`, `:52`) writes `MemLpLoc μ p s g` and `MemW1pLoc μ p s u` with
     an explicit measure and a bare set.
   - Main's README is listed in the content repository's roadmap list (`README.md:194`).

   **Ids main defines that this text lacks.**

   - Sections with no counterpart here: §2.5 (pullback by submersions), §2.6 (locality on measurable
     equality sets), §4.7–§4.8 (colocal weak differentiability and the colocal weak differential),
     §5.4 (intrinsic energy classes of measurable maps), §7.2 (maps from surfaces), §7.3 (compact
     manifolds and the bundle carrier), §9.2–§9.3 (smooth retractive embeddings, smooth
     approximation), §10.1–§10.4 (the space `W^{1,p}_ι(M, N)`, Morrey, density for `p ≥ n`,
     comparison with intrinsic weak maps), §11.1–§11.3 (degree, failure of density below `n`).
     Layers 9, 10 and 11 as layers; main's Layer 8 (pullback of differential forms, §8.1–§8.3).
   - Numbers that exist in both texts with different content, so a citation by number changes
     meaning:

     | Main | This package |
     |---|---|
     | §1.1 local Lebesgue and Sobolev classes | §1.1 local Lebesgue classes only |
     | §2.1 chain rules and the composition operator | §2.1 null sets under `C¹` maps |
     | §2.2 change of variables | §2.2 precomposition with local diffeomorphisms |
     | §2.3 local mollification | §2.3 postcomposition, bounded derivative |
     | §2.4 Banach-valued Morrey estimates | §2.4 postcomposition of continuous maps |
     | §3.1 null sets, positive densities, a.e. filter | §3.1 chartwise null sets are Riemannian null sets |
     | §8.1–§8.3 pullback of forms | §8.1–§8.4 immersions and the extrinsic class |
     | §9.1 the extrinsic characterisation | §8.2 |
     | §10.1, §10.4 extrinsic space, independence of the embedding | §8.3, §8.4 |

   - Lean names main declares that this file lacks (40): `IsSobolevMap` and its lemmas
     (`.of_locally`, `.comp_contMDiff`, `.comp_submersion`, `.exists_hasWeakMFDeriv`,
     `.exists_smooth_approx_rel`, `.integrableOn_orientedJacobian`,
     `.isColocallyWeaklyDifferentiable`), `HasWeakMFDeriv` (with `.ae_eq`, `.comp_contMDiff`,
     `.comp_submersion`), `HasWeakMFDerivFun`, `HasColocalWeakMFDeriv` (with `.ae_eq`),
     `IsColocallyWeaklyDifferentiable` (with `.exists_hasColocalWeakMFDeriv`),
     `IsChartAEMeasurableMap`, `IsChartMeasurableMFDeriv`, `MemW1pLocM`, `TendstoSobolevLoc`,
     `chartDomain`, `orientedJacobian`, `orientedJacobian_comp`, `orientedJacobian_self`,
     `abs_orientedJacobian`, `abs_orientedJacobian_le`, `memW1pLoc_iSup_iff`,
     `MemW1pLoc.comp_contDiffOn`, `MemW1pLoc.comp_contDiffOn_diffeo`,
     `MemW1pLoc.exists_continuousOn_ae_eq`, `isSobolevMap_iff_forall_maximalAtlas`,
     `isSobolevMap_of_contMDiff`, `isSobolevMap_iff_memW1pLocM_comp_immersion`,
     `isSobolevMap_iff_exists_hasColocalWeakMFDeriv`,
     `memW1pLocM_comp_iff_exists_hasColocalWeakMFDeriv`, `exists_smooth_approx_of_ae_mem_range`,
     `exists_smooth_approx_of_controlledRetraction`, `not_exists_smooth_sphere_approx_radial`.
   - The package hands to a "Part II" (README lines 131–136, 1736–1744) the density of smooth maps,
     approximation and Sobolev maps into more general targets. Main's Layers 9–11 already own
     density for `p ≥ dim M`, relative smooth approximation and the `x/|x|` obstruction.

   **What this text has that main lacks and is worth carrying over.** Each item was checked against
   main's files.

   - §6.4, Jacobian measures and the change of variables for `C¹` open embeddings
     (`jacobian_changeOfVariables`). Main's Layer 6 ends at §6.3; "Jacobian measure" and
     `IsOpenEmbedding` do not occur in main's README.
   - Lindelöf sources with no separation axiom, and the non-Lindelöf negative control of §3.3
     (`ℝ × D` with `D` discrete). Main's sources are Hausdorff and second countable
     (`TauCetiRoadmap/SobolevMapsBetweenManifolds/README.md:154`); "Lindelöf" does not occur there.
   - §3.1 as a direct theorem, `isNullSet_iff_riemannianVolume_eq_zero`, for a continuous metric on a
     `C¹` Lindelöf manifold whose model may have boundary, for arbitrary (not only measurable) sets.
     Main's §3.1 (lines 636–640) consumes RiemannianGeometry R4.6 for smooth metrics and reaches
     continuous metrics through positive continuous density measures. The Lean statement
     `euclidean_volume` (flat Riemannian volume of an open subset is the restricted ambient volume)
     has no counterpart among main's 42 declarations.
   - `J_f ∈ L^{p/n}_loc` for every `1 ≤ p ≤ ∞` and `n ≥ 1`, with the `n = 0` case separate (§6.3).
     Main's §6.3 (line 1231) states it for `p ≥ n` only.
   - The signed chart formula for `J_f` in arbitrary preferred charts, with orientation signs and
     `TauCeti.chartVolumeDensity`, stated in Lean inside `jacobian_hadamard_integrability`.
     `chartVolumeDensity` does not occur in main's README.
   - The negative control for T7, `ι₂(s) = (s, exp(exp s))` on `N = ℝ` with `u = log log(1/|x|)`,
     which shows compactness of the target is needed; it does not occur in main.

   **Exact repair.** The package cannot be ported as a new roadmap. It becomes one of two things, and
   which is the author's decision:

   1. a revision of main's roadmap: start from main's
      `TauCetiRoadmap/SobolevMapsBetweenManifolds/README.md` and `Suggested.lean`, keep every section
      number and every Lean name main defines (or give an old → new numbering table), and make the
      six additions above in main's text, at main's numbering (§6.4 as a new section after main's
      §6.3; the Lindelöf weakening in main's Conventions and §3.1, §3.3, §4.3; the `p/n` range in
      main's §6.3; the T7 control in main's §10.4), with `MemLpLoc` and `MemW1pLoc` kept at main's
      signatures; or
   2. the package is closed in favour of main's roadmap.

   For option 1, QuasiregularMaps (open) cites this roadmap at §1.2, §3.1, §4.2–§4.5, §5.1,
   §6.1–§6.3 and §7.1. Main defines a section at each of these numbers, so a revision that keeps
   main's numbering leaves those citations resolvable.

   Tested on the instance that refuted the original: with main's folder as the base, the name
   collision on `TauCetiRoadmap.SobolevMapsBetweenManifolds.MemLpLoc` and `.MemW1pLoc` disappears,
   and none of main's 42 names or 42 section ids is dropped.

One finding, P1, blocking. The package is a second copy of a roadmap that main has gained. As the
rubric says for this case, it is the round's only finding and the remaining review steps were
stopped once it was confirmed: repairing the statements of a copy that cannot merge is wasted work.
What was checked before that point is recorded under `## Verified sound`. No file of the package
was edited by this review.

## Verified sound

Recorded for the next round; none of it changes the verdict.

- **Previous finding (round 5, F01, P3): repaired.** `README.md:250–251` now reads
  "`integral_withDensity_eq_integral_toReal_smul₀`
  (`Mathlib/MeasureTheory/Integral/Bochner/ContinuousLinearMap.lean:311`, root namespace)"; the
  §6.4 text (line 1435) and the §6.4 `*Needs:*` line (line 1495) carry the same root-namespace
  name. No other occurrence of the old spelling remains in the README.
- **Elaboration.** `lake env lean` on `packages/SobolevMapsBetweenManifolds/Suggested.lean` from
  the content checkout: exit 0, 16 warnings, each "declaration uses `sorry`", no error. No
  `TauCeti.*` module had to be built.
- **Dependency check**, the brief's command:

  ```text
  depcheck: 245 roadmaps, 2229 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line.
- **Mathematics read before the copy was confirmed.** I read the README and the Lean file in full
  and recomputed the worked values of the Checks. A sample of what was computed: §1.2 Cantor
  values `c(1/4) = 1/3`, `c(3/4) = 2/3`; §2.3 mollified `x³` is `x³ + 3σ²ε²x`, so the derivative
  difference is `3σ²ε²` with `L¹(−1,1)` norm `6σ²ε²`, and `3σ²ε² > 6x²` iff `|x| < σε/√2`; §4.6(a)
  `2·Df(2y) = sign(y)|2y|^{−1/2}` equals the derivative of `√2|y|^{1/2}`; §6.2 chart formula in
  model bases `a`, `b`: `sign(a)sign(b) · a/(2b) · 2|b| / (|a|/2) = 2`; §6.3 disc sum: adjacent
  centres `2r_k` apart against radii `3r_k/2`, inner halves contribute `π/(4k)`; §6.4 `z²` on the
  annulus: `30π` against area `15π`; §8.4 `2π ∫_0^{1/e} dr/(r log²(1/r)) = 2π` and
  `exp(exp(u)) = 1/|x|`. I found no false statement in this pass. This is not a completed
  adversarial table and is not offered as one.
- **Maintainer notes.** None were left.
- **Overlap ledger.** `scratch/overlaps.md` lists no pull request changing this roadmap and no
  dropped id; it was computed for pull requests and does not flag the copy, which I confirmed by
  reading main's folder.

Overlap check: read main's SobolevMapsBetweenManifolds (the same roadmap, owner: main) and
QuasiregularMaps (a consumer through declared gaps; nothing shared). The other closest roadmaps
(SobolevDifferentialForms, DifferentialGeometry, PseudoholomorphicCurveAnalysis) were not re-read
this round: the audit stopped at the second copy.

## Not verifiable

- Steps 2 to 8 of the review (the seeded source sample, the full adversarial table, the
  duplication audit beyond the second copy, the supplier audit beyond the dependency check, shape,
  the one-tactic padding probe, the wording and arrangement comparison) were not carried out: the
  rubric stops the round at a confirmed second copy. They are owed on whatever text replaces this
  one.
- Source independence: not assessed this round, for the same reason; no source text was opened.

## Source issues

- none

## For the human reviewers

- **Scope.** Main gained `TauCetiRoadmap/SobolevMapsBetweenManifolds` on 2026-11-13 (commit `7767aa4`). This package is a different text under the same name. Whether it becomes a revision of main's text or is closed is the author's decision.
- **Not tested.** The wording and arrangement comparison against the sources was not run this round; Ziemer1989, Mazya2011, Rickman1993, Lee2012 and Bethuel1991 remain uncertified in `packages/SobolevMapsBetweenManifolds/sources.toml`.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c7e943295b2868225d9dae0f7e222d70b6776a97", "job": "REV-PKG-SobolevMapsBetweenManifolds~6", "model": "fable", "worker": "chris-x29"} -->
