# Triage report: TARGET-Varifolds

Verdict: `design`, name `Varifolds`. Brief at `packages/Varifolds/target.md`, manifest at
`packages/Varifolds/sources.toml`. No text is outstanding; no `needs-references.toml` request.

## What was searched

- Consolidation against the board. Every open target and design listed in the brief was compared
  by object. None plans varifolds, the Grassmann bundle, first variation of a measure, or
  monotonicity. `DESIGN-GaussianIsoperimetryAndClusters` (`packages/GaussianIsoperimetryAndClusters/target.md`
  line 196 and 236) records this target as "shares the GMT supplier only; no overlap" and notes that
  its multi-bubble theorem needs interface regularity nobody plans. `DESIGN-RiemannianManifoldsWithConvexBoundary`,
  `DESIGN-QuasiregularMaps`, `TARGET-SobolevMapsBetweenManifolds` and `DESIGN-LorentzianGeometry`
  share Riemannian or Sobolev suppliers only. No merge.
- Ownership on main and at the open heads. `roadmaps grep` for varifold, Allard, monotonicity
  formula, first variation, tangent cone, stationary integral and min-max. Hits: `GeometricMeasureTheory`
  README line 12 excludes currents, varifolds and minimising regularity (its G2 owns Euclidean
  rectifiability, approximate tangent planes, area and coarea); `GeometricCurrents` README G6
  (lines 668–699) constructs the unoriented Grassmann bundle and the auxiliary rectifiable
  varifold of an integral current with restriction, weight, weak convergence, push-forward, first
  variation under ambient flows, monotonicity with Riemannian error bounds, rescaling and tangent
  cones, for its regularity proof, and its line 855 states it is not a theorem about stable
  varifolds; all other "first variation" and "tangent cone" hits are unrelated (variational
  bicomplex, Ricci flow cones, algebraic tangent cones). No roadmap, pull request or package
  defines a general varifold, the Riesz decomposition of the first variation, Allard's
  rectifiability or compactness theorems, or varifold tangents of a general varifold.
- The board's package index (`board-packages-index.txt`: four imported packages, none geometric)
  and the merge order (`CalibratedGeometry` at line 214; `GeometricCurrents`, `GeometricMeasureTheory`,
  `RiemannianGeometry`, `PositiveScalarCurvature` on main).
- Pull request heads read: `CalibratedGeometry` #946 (C1.4 owns the oriented Grassmannian and
  Stiefel manifold; no varifold), `PositiveMass` #956 (consumes `GeometricCurrents` G1–G7, not
  varifolds), `RiemannianGeometry` #1327 (same R5a/R5b content as main).
- Libraries. Mathlib: `Module.Grassmannian` is the algebraic functor only; no varifold, no
  rectifiable set; Riesz–Markov–Kakutani, Hausdorff measure, Portmanteau, tightness and
  `IsRiemannianManifold` exist. Tau Ceti: Prokhorov's theorem, Portmanteau, flows of vector
  fields on manifolds, Riemannian volume density, first variation of energy; nothing on
  rectifiability or Grassmann bundles.
- Consumers claimed by the filing. `PositiveScalarCurvature` on main (sections P1–P6) is the
  Gromov–Lawson surgery route and uses no minimal hypersurface or varifold; the filing's claim
  that it consumes varifolds is wrong. `CalibratedGeometry` does not mention varifolds. The real
  present-day relation is the comparison with `GeometricCurrents` G6's auxiliary varifold.

## Why `design`

- Not a duplicate: nothing owns the general Radon-measure varifold or the Allard theorems.
- Not a Part II: `GeometricMeasureTheory` is Euclidean and excludes varifolds by design, and the
  repository already made currents a separate roadmap rather than a GMT Part II;
  `GeometricCurrents` goes in a different direction (currents, homology, minimising regularity)
  and its varifold is an auxiliary device. The new roadmap sits after both and imports them.
- Not a merge: no open target or design plans the same theory.
- Generality raised: all codimensions for the smooth case, full Riesz decomposition instead of
  "no generalised boundary", Allard's monotonicity for locally bounded first variation instead of
  the stationary case only, and Allard's rectifiability and integral compactness theorems made
  targets because the filing names them as required inputs and nobody supplies them.

## Sources

- `Simon1983`: the 1983 ANU edition is open access on the ANU Mathematical Sciences Institute
  site (institutional repository; the Project Euclid table of contents page is JavaScript-only
  and yielded no text). Fetched and read: §9, §11, §15–§17, §19, §38–§42; every target carries a
  line locator. Simon's 2014 Stanford revision was fetched first under the same key and then
  replaced by the 1983 edition the filing cites; the manifest records the version note.
- `Simon2023`: arXiv 2101.06401v2, read; Theorem 1.1 (lines 89–96) and Theorem 3.7 (lines
  432–441). Published Ann. of Math. 197 (2023) no. 3, DOI recorded.
- `EdelenSpolaor2023`: identified as the "Annals 198 (2023), no. 3, second article" of the filing
  (DOI 10.4007/annals.2023.198.3.2); arXiv 1910.00441v1 read; Definition 1.1.1 and Theorem 1.4
  (lines 104–141) use exactly the notions the filing lists.
- `Allard1972` (JSTOR), `Federer1969` (Springer), `Maggi2012` (CUP): paywalled, recorded
  `uncertified` with DOI and locators. Maggi's cvgmt page carries only a synopsis extract. The
  service's automatic recording covered Federer; Allard and Maggi were entered by hand in the
  same schema and the manifest passes `sources check`. Nothing is requested: every statement they
  would support is also located in `Simon1983`.

## Risks worth the design's attention

The ownership boundary with `GeometricCurrents` G6, the proof of Allard's integral compactness
theorem (only stated in Simon; proved in the paywalled Allard), the intrinsic Riemannian
monotonicity constant without a Nash embedding, and the mean-curvature convention (averaged H in
`RiemannianGeometry` versus trace in Simon). All are written in `target.md`.

No suspicious instructions were found in any fetched text.
