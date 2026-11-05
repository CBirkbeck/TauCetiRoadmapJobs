# Triage report: TARGET-SymplecticAlmostComplexStructures

Verdict: **duplicate**. The space 𝒥(M, ω) of compatible almost complex structures, its tame and
relative variants, their C^∞ topology, completeness, Baire property, nonemptiness and
contractibility are each owned already: by the pinned Tau Ceti library (definitions and the
metric g_J), ComplexKahlerGeometry K5a on main (the Fréchet topology on smooth sections),
HeegaardFloer §4.1 (F2.1) on main and at pull request #1794 (the spaces, nonemptiness, the
contraction fixing J₀ and relative extension on closed spatial regions), AnalyticStableMaps
pull request #987 §2.1, §2.13, §2.18–§2.21 and §10.1 (complete metrizability and Baire
genericity on compact and on arbitrary targets, including the space fixed outside a precompact
open set; tame contractibility), and Mathlib (`BaireSpace`, `dense_iInter_of_isOpen`).

## What was searched

- **Open targets and designs on the board.** The thirty-nine entries listed in the brief were
  compared by object. None concerns almost complex structures, Whitney topologies on section
  spaces or Baire genericity; the nearest are RiemannianManifoldsWithConvexBoundary,
  LorentzianGeometry, QuasiregularMaps and SobolevMapsBetweenManifolds, which share only the
  manifold setting. No `merge-into`.
- **Board packages.** `packages/` holds a folder `SymplecticAlmostComplexStructures` with an empty
  `reports/` directory only (created for this job). The packages index names no symplectic or
  almost-complex package under review. Related packages on the board (CharacteristicClasses,
  ComplexKahlerGeometry, DifferentialGeometry, FukayaTheory, GromovWittenTheory, HamiltonianSystems,
  HeegaardFloer, PseudoholomorphicCurveAnalysis, RiemannianGeometry, SymplecticFieldTheory,
  AnalyticStableMaps) were checked through `roadmaps show` at their heads.
- **Roadmap greps** (`roadmaps grep`, main and open heads): `contractib` near `compatible`/`tame`,
  `whitney`, `baire`, `super-rigid`, `SymplecticAlmostComplexStructures`. Hits that matter:
  AnalyticStableMaps #987 lines 60, 252–263, 405–414, 465–512, 946–952 of the shown README
  (`roadmaps show AnalyticStableMaps --pr 987`); HeegaardFloer #1794 lines 2047–2183 (§4.1, F2.1),
  and the same paragraph on main at `TauCetiRoadmap/HeegaardFloer/README.md` line 2176;
  ComplexKahlerGeometry main README lines 718–726 (K5a Fréchet section topology and
  SmoothSectionMontel); GeometricTopology #903 lines 1190–1213 (§3.1, weak = Whitney on compact
  sources); FukayaTheory #1045 line 424 (`BaireSpace` consumed for residual sets);
  SymplecticGeometry main line 100 (S1 consumes HeegaardFloer F2.1's compatible-structure family).
  No roadmap mentions super-rigidity; the suggested name is unused.
- **Library.** `TauCeti/Geometry/Symplectic/AlmostComplex.lean` (`AlmostComplexStructure`,
  `SymplecticForm`, `Tames`, `Compatible`), `CompatibleMetric.lean` (`associatedBilinForm`,
  `innerProductCore`), `TameMetric.lean` (`symmetrizedBilinForm`), `ExistsCompatible.lean`
  (`exists_compatible`, `exists_tames`), `Manifold/AlmostComplex.lean`
  (`SmoothAlmostComplexStructure`), `Manifold/TwoForm.lean` (`SmoothTwoForm.Tames`, `.Invariant`,
  `.Compatible`, with the pointwise reductions), `Geometry/Manifold/ContMDiffMap/WeakWhitney.lean`
  and `Chart/Topology.lean` (weak Whitney topology on maps), `Analysis/Fredholm/SardSmale.lean`.
  Mathlib: `Mathlib/Topology/Baire/{Lemmas,CompleteMetrizable,LocallyCompactRegular}.lean`. No
  strong Whitney topology and no Fréchet section space is in either library yet.
- **Sources.** Wendl's paper was read from arXiv (wendl-superrigidity, certified): lines 166–186
  give the space 𝒥(M, ω; 𝒰, J_fix) with its C^∞ topology, the compatibility convention
  ω(·, J·) a Riemannian metric, Remark 1.3 on tame and arbitrary structures, and the Baire
  vocabulary; the main theorems at lines 201, 266, 290 and 777 are the statements a future
  super-rigidity target would quote. Gromov 1985 is in an open repository (EuDML landing page
  pointing to GDZ volume PPN356556735_0082), but both the EuDML page and the GDZ viewer served
  only navigation HTML with no article text, and Gromov's IHES author page answers with server
  errors; the service had marked the entry certified on the viewer page, which was changed by
  hand to uncertified so that the locator is not claimed as verified. McDuff–Salamon (both books),
  Hirsch and Audin–Lafontaine are paywalled and are recorded as uncertified, cited by locator;
  the two McDuff–Salamon entries were added to `sources.toml` by hand because the service
  reported "no legal source found" rather than "uncertified" for the OUP and AMS landing pages.
  No text is outstanding, so no `needs-references.toml` is left.

## Why duplicate rather than design or Part II

The target's own statement of why it matters ("what is missing is the topology and the
contractibility") is answered by the owners: HeegaardFloer F2.1 owns the contractibility, in the
relative form that is 𝒥(M, ω; 𝒰, J_fix), and AnalyticStableMaps §2.1 owns the complete
metrizable C^∞ topology and the Baire property, with ComplexKahlerGeometry K5a supplying the
Fréchet section space. The consumers the target names (PseudoholomorphicCurveAnalysis,
AnalyticStableMaps, GromovWittenTheory, FukayaTheory) already import those sections; a new roadmap
would plan the same theory a second time, which the principles forbid, and could not be a Part II
of any of them because it would add nothing after their end.

The only unowned content is the strong (fine) Whitney C^∞ topology on sections over a noncompact
manifold, its coincidence with the weak topology on the relative space, and the weak-versus-strong
example on noncompact M. No consumer uses the strong topology: every genericity statement found
is in the compact-C^k topology, and Wendl's remark that his space carries "its natural
C^∞-topology" (wendl-superrigidity line 174) is satisfied by the weak topology on a space whose
elements differ only on a compact set. This remainder is recorded in `target.md` as a note for
the authors of HeegaardFloer F2.1 and AnalyticStableMaps §2.1, together with two small gaps in
their wording (continuity of the contraction on noncompact M for the compact-C^k topology; the
unstated dependence of §2.1's completeness on K5a for noncompact targets).

## Files written

- `packages/SymplecticAlmostComplexStructures/target.md`
- `packages/SymplecticAlmostComplexStructures/sources.toml` (six entries: Wendl certified, the
  other five uncertified and cited by locator)
- this report

Nothing suspicious was found in any fetched text.
