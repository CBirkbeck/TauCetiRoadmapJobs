# Triage report: TARGET-QuasiregularMaps

**Verdict: design**, name `QuasiregularMaps`, no base, no owner. The brief is
`packages/QuasiregularMaps/target.md`; the manifest is `packages/QuasiregularMaps/sources.toml`.

## What was searched

- **Open targets and designs on the board.** Every statement in the board list was compared by
  object. The only one sharing objects is `TARGET-SobolevMapsBetweenManifolds` (#6021), whose
  full issue text was read: it plans `W^{1,p}_loc(M, N)` for continuous maps, the weak
  differential, its operator norm, the Jacobian relative to the volume forms, Hadamard's
  inequality and the Euclidean chain rules, and names QuasiregularMaps as its consumer. That is
  a supplier relationship, not an overlap: the distortion inequality, the distortions `K_O`
  and `K_I`, metric and orientation invariance, composition, quasiregular ellipticity and the
  cohomological theorems are planned by neither. No merge. No other target or design
  (LorentzianGeometry, GaussianIsoperimetryAndClusters, Varifolds,
  RiemannianManifoldsWithConvexBoundary, SymplecticAlmostComplexStructures, …) touches
  quasiregular or quasiconformal maps.
- **Roadmaps on main and at the open heads** (`roadmaps grep`, case-insensitive, for
  quasiregular, quasiconformal, Reshetnyak, bounded distortion, outer/inner distortion,
  quasiregularly elliptic, Bonk, Pankka, Prywes, Rickman, Väisälä, Iwaniec, weak
  differential, Sobolev map, ACL, `W^{1,n}`, Jacobian determinant). Hits for "quasiregular"
  are the unrelated quasiregular semiperfectoid rings (CrystallineCohomology,
  DerivedDeRhamCohomology, AInfCohomology) and quasi-regular actions (FactorRigidity,
  VonNeumannAlgebras). Quasiconformal maps appear only in dimension two: TeichmullerGeometry
  (PR #1169) §7.4 through the Beltrami equation, PseudoholomorphicCurveAnalysis (PR #1793)
  Layer 1 and §4.1 (local Sobolev maps from surfaces with `kp > 2`, a weak differential for
  surfaces only), and a Gehring reference in the PDE head. ConformalMapping (Completed) and
  ConformalMappingPartII (PR #1407) stay in the plane. SobolevDifferentialForms (PR #1609)
  is scalar-valued forms on Euclidean domains. Nothing owns the target.
- **Packages under review** (`scratch/board-packages-index.txt`): four packages, none related.
  The board folders `packages/QuasiregularMaps`, `packages/SobolevDifferentialForms` and
  `packages/SurfaceTopology` hold only review reports.
- **Merge order** (`merge-order/ORDER.txt`): no entry for QuasiregularMaps or
  SobolevMapsBetweenManifolds; the suppliers PDE, DifferentialGeometry, RiemannianGeometry and
  GeometricMeasureTheory are on main.
- **Pinned libraries.** Mathlib has no Sobolev spaces, no quasiconformal maps, and
  `Orientation` only for modules; it has `IsRiemannianManifold` and the manifold instance on
  `Circle`. Tau Ceti has `W1p` and `Wkp` on open subsets of a Euclidean space
  (`TauCeti/Analysis/Sobolev/`), Morrey's embedding, `riemannianVolume` and
  `chartVolumeDensity` (`TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/`), and an
  oriented-atlas notion `TauCeti.Orientable` (`TauCeti/Geometry/Manifold/Orientation.lean`);
  nothing on maps into manifolds, Jacobians of Sobolev maps, or distortion.
- **Supplier READMEs on main.** PDE Lane A (weak derivatives, `W^{k,p}`, Morrey, the `p = n`
  borderline stated); DifferentialGeometry Layers 2 (orientations), 6–8 (de Rham cohomology,
  Mayer–Vietoris, de Rham theorem), 10 (degree), 12.4 (volume form, Riemannian measure), and
  its list of forbidden statements (none conflicts); RiemannianGeometry conventions;
  GeometricMeasureTheory G2 (area and coarea formulas).
- **Consumers.** FourManifolds (PR #936) classifies closed simply connected 4-manifolds by
  intersection form, which is what Heikkilä–Pankka's Corollary 1.2 combines with Theorem 1.1;
  SurfaceTopology and ConformalMappingPartII for the dimension-two comparison. The filed claim
  that the roadmap supplies DifferentialGeometry's de Rham cohomology has the direction
  reversed, and the brief says so.

## Sources

Fetched through the sources service: Heikkilä–Pankka (arXiv:2302.11440v2) and Prywes
(arXiv:1806.05306v1), both certified; Martio–Rickman–Väisälä 1969 from the Annales Fennici
Mathematici open archive (CC BY 4.0 stated on the article page; fetched with the
open-repository licence class; image-only scan, noisy recognised text), certified. Both
Annals DOIs were verified through Crossref and recorded with the arXiv versions as single
entries. Bonk–Heinonen: the DOI resolves to Springer (paywalled host); the Project Euclid
landing page and PDF link both answered the fetcher with a bot-protection page, and the
paper is not on arXiv; recorded as uncertified with the locators the two certified papers use
for it, and flagged for the design job. Rickman 1993, Väisälä 1971 and Gromov 1999 were
recorded uncertified by the service (Springer DOIs). Reshetnyak 1989 (AMS) and Iwaniec–Martin
2001 (OUP) were reported by the service as "no legal source" because their hosts are in no
licence class; both are paywalled monographs, so they were recorded by hand as uncertified
with their DOIs, and the scratch `needs-references.toml` was removed, since nothing in it was
other than a paywalled text to be cited by locator. Gromov 1981 (Ann. of Math. Stud. 97,
p. 200), the actual source of the question that Prywes answers, was added as an uncertified
entry. No text was copied; locators are `<source id> line N` against the cached extractions.

## Why the verdict

The target is a coherent, self-contained layer of geometric function theory that no roadmap,
pull request, package or library owns, and it is not a continuation of any existing roadmap
in the same direction: TeichmullerGeometry's quasiconformal maps are planar and defined
through a different equation, so a Part II there would change both the dimension and the
definition. It has a single clear supplier that is itself an open target
(SobolevMapsBetweenManifolds), on which the brief makes it depend by name, and on the main
branch it has PDE, DifferentialGeometry, RiemannianGeometry and GeometricMeasureTheory. The
generality is the manifold-valued definition of Bonk–Heinonen, Prywes and Heikkilä–Pankka
with the Euclidean `ACLⁿ` definition of Martio–Rickman–Väisälä recovered as a stated
equivalence. Three adjustments to the filed wording are recorded in the brief: Prywes's bound
is the sharp binomial bound, not a constant; the general composition theorem and the
ellipticity transfer along an arbitrary quasiregular map rest on Reshetnyak's theorem and
are stated targets, with the `C¹`-factor cases proved; and the direction of supply with
DifferentialGeometry is reversed.

## Risks carried to the design

The carrier roadmap has no design yet and must precede this one; `Suggested.lean` cannot
import it, so the acceptance file must state the Euclidean-domain theorems fully and choose a
library-expressible statement of "quasiregular map `ℝⁿ → N`" for the cohomological targets;
Reshetnyak's theorem is far above the library; the de Rham computation for `#^4(S² × S²)`
needs a product computation DifferentialGeometry does not list; five of the ten sources are
paywalled and cited by chapter, and Bonk–Heinonen needs a working fetch route or a local copy.

## Suspicious text

None. No fetched text asked for any action.
