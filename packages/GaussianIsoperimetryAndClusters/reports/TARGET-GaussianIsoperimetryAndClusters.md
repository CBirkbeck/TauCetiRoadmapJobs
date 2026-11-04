# Triage report: TARGET-GaussianIsoperimetryAndClusters

Verdict: **design**, name kept as `GaussianIsoperimetryAndClusters`. Brief at
`packages/GaussianIsoperimetryAndClusters/target.md`; manifest at
`packages/GaussianIsoperimetryAndClusters/sources.toml`. No text is missing, so no
`needs-references.toml` was left.

## What was searched

- **Open targets and designs on the board.** Compared by object: the only neighbours are
  `TARGET-Varifolds` (#6026, varifolds on Riemannian manifolds, shares only the GMT supplier),
  `TARGET-SobolevMapsBetweenManifolds` (#6021) and `TARGET-RiemannianManifoldsWithConvexBoundary`
  (#6018); none defines weighted perimeter, clusters, Gaussian isoperimetry or symmetrisation.
  No merge.
- **Roadmaps on main, open pull requests, board packages** via `roadmaps grep` for
  `Gaussian perimeter`, `Gaussian isoperim`, `Ehrhard`, `Borell`, `Bobkov`, `Sudakov`,
  `double/multi bubble`, `cluster`, `weighted perimeter`, `Milman`, `isoperimetric profile`,
  `concentration of measure`, `log-Sobolev`, `Ornstein`, `Gaussian measure`, `Dvoretzky`.
  Hits: `RandomMatrices` 2.2 (Gaussian log-Sobolev and Poincaré, Herbst concentration — a
  neighbour, not the isoperimetric inequality); `BanachSpaceTheory` B7 (sphere/Gaussian
  concentration built ad hoc for Dvoretzky — a consumer); `OptimalTransport` (Gaussian
  barycenters, OU flow — unrelated); `TensorProductCombinatorics`, `McKaySkewGroup`,
  `PointProcesses` (other meanings of "cluster"/"weighted perimeter"). Nothing owns the target.
- **`GeometricMeasureTheory` and `Isoperimetry` READMEs** read in full: Euclidean perimeter only;
  Isoperimetry excludes anisotropic/curved isoperimetry and never mentions weights. GMT STATUS:
  G5 (De Giorgi) and G6 (Gauss–Green) not begun on main.
- **Pinned libraries.** Mathlib: `stdGaussian`, `gaussianReal`, `multivariateGaussian`,
  `IsGaussian`, `BoundedVariation`; no perimeter, BV or isoperimetric declarations. Tau Ceti:
  `stdGaussian_eq_withDensity`, `pi_gaussianReal_eq_withDensity`, Sobolev `W1p`; no `perimeter`
  declaration (the names in GMT's STATUS page are newer than the pin).

## Why `design`

The target is a coherent new library (weighted perimeter, clusters, Gaussian profile, Ehrhard
symmetrisation, the Gaussian isoperimetric theorem) that no roadmap owns and that does not
continue a single base in the same direction: it consumes GMT and Isoperimetry rather than
extending either, so it is not a Part II. The filed wording was kept, generalised where the
sources allow: perimeter, clusters and existence are stated for every smooth positive weight
`e^{−W}` (Milman–Neeman Section 3 and Theorem 4.1), the integrated inequality for every
Gaussian measure on a finite-dimensional inner product space, with the standard Gaussian as the
headline instance.

One scoping decision is flagged for the design author: the filer asks for "the statement of the
Gaussian multi-bubble theorem" as the summit. Its proof for `q ≥ 3` requires Almgren interface
regularity, the Taylor–White–Colombo–Edelen–Spolaor singular-set theorem and Milman–Neeman's
second-variation machinery, none of which any roadmap plans. Since `Suggested.lean` is an
acceptance test of theorems the roadmap will prove, the brief makes target 12 statement-level
(definitions and README statement, `q = 2` proved) and names the `q ≥ 3` theorem as the Part II.

## Sources: what was fetched and how

- Milman–Neeman (arXiv), CFMP (cvgmt preprint, institutional), Ledoux 1993 and 1999 (Numdam),
  Borell 1975 (GDZ scan, OCR), Ehrhard 1983 (Mathematica Scandinavica, free access, OCR): read
  and certified; locators in the brief are line numbers of the cached texts.
- Bobkov 1997: Project Euclid blocked the fetch; the author's UMN page copy was fetched but its
  text layer is glyph names and OCR is unusable. Cited by locator; the inequality is taken from
  Ledoux 1999 (1.11).
- Sudakov–Tsirelson 1974: Math-Net.Ru full text timed out three times (also via the Mathdoc
  mirror); recorded uncertified with its locator. Not needed for any target (Borell and CFMP
  cover the theorem).
- Maggi 2012: the author's cvgmt extract (front matter, contents, Part IV synopsis) was read;
  Chapter 29 is cited by locator. AFP 2000, Bogachev 1998, Carlen–Kerce 2001, Ledoux 1996
  (Saint-Flour; the author's page returned 502 twice): paywalled, uncertified, by locator.
- Nothing was read from a non-legal place. No source passage is copied into any file.

## Suspicious text

None encountered.
