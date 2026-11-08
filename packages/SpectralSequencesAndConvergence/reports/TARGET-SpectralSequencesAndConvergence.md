# TARGET-SpectralSequencesAndConvergence: triage report

Verdict: **design**, name `SpectralSequencesAndConvergence` (the suggested name, unused by any
roadmap, pull request, package or merge-order line). The brief is `packages/SpectralSequencesAndConvergence/target.md`.

## What was searched

- **Open targets and designs on the board.** Every statement in the job's list was compared by
  object. None plans spectral sequences, limit pages, convergence or exact couples;
  HochschildHomologyAndHKR (#6158) and GaloisActionOnEtaleCohomology (#6149) are future consumers
  at most. No merge.
- **Roadmaps on main and at the open heads** (`roadmaps grep`, patterns for limit page, E_∞,
  exact couple, conditional convergence, Boardman, spectral object, abutment, filtered complex,
  comparison theorem). Hits with ownership content:
  - DGFloer on main, Layer 1 item 3: the spectral sequence of an increasing filtered chain
    complex of modules over a ring on Mathlib's `SpectralObject`, Weibel's classical convergence
    theorem 5.5.1(2) and the cohomological complete convergence theorem 5.5.10 in that setting;
    item 2: Serre spectral sequences. Module-level only; no limit page, no convergence structure,
    no comparison theorem, no exact couples. It cites a Tau Ceti file
    `TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean` at a commit later
    than the pin; the pinned Tau Ceti (rev 358314d) has no spectral-sequence file.
  - DerivedModuleAlgebra on main: first-quadrant double-complex spectral sequence of modules with
    abutment filtration, E_∞ ≅ gr, stabilisation bound, edge maps and five-term sequence; §1.T.1
    towers, lim, lim¹, Mittag–Leffler for modules. AlgebraicTopology on main, Stage 6.0: lim and
    lim¹ for abelian-group towers.
  - StableHomotopyKTheory (#1227, merge order line 13): §7.22 bigraded exact couples and derived
    couples in any abelian category; §7.23 spectral object of a filtered spectrum identified with
    Mathlib's pages; §7.24–7.26 convergence for filtered spectra, including Boardman's
    conditional convergence for towers of spectra (abelian groups). Spectrum-flavoured; the
    abelian-category exact couple of §7.22 is the one real overlap and becomes a supplier.
  - Instances only (no general theory): HeegaardFloer, MorseTheory, ComplexKahlerGeometry K8,
    SchemeAndStackFoundations (Leray, Čech) on main; ArithmeticGaloisDuality (#858),
    LefschetzPencilsAndVanishingCycles (#873), ArithmeticLocallySymmetricSpaces (#871),
    DerivedDeRhamCohomology (#868), SchemeKTheoryOperations (#1229), TangentialBordism (#942),
    ClassicalAdicEtaleCohomology (#875), CrystallineCohomology (#857), WeightsInEtaleCohomology
    (#1001), PadicDifferentialEquationsAndRigidCohomology (#1002), the Part II pull requests
    AlgebraicTopologyPartII (#1694), DGFloerPartII (#1799), StableHomotopyKTheoryPartII (#1733).
    Each re-derives finite convergence, "E_2 = E_∞" or dimension counts by hand; they are the
    consumers.
- **Board packages** (568 folders and the packages-under-review index): no package on spectral
  sequences; `packages/SpectralSequencesAndConvergence/` existed only as an empty reports folder
  created for this job.
- **Mathlib (pinned).** `Mathlib/Algebra/Homology/SpectralSequence/Basic.lean` defines the
  category of spectral sequences as pages plus homology-to-next-page isomorphisms;
  `Mathlib/Algebra/Homology/SpectralObject/` builds the spectral sequence of a spectral object
  with `HasSpectralSequence`, the E₂ cores and the `IsFirstQuadrant`/`IsThirdQuadrant` classes;
  `Mathlib/Algebra/Homology/HomotopyCategory/SpectralObject.lean` gives the mapping-cone spectral
  object of a filtered cochain complex; `Mathlib/CategoryTheory/Triangulated/SpectralObject.lean`
  records as a TODO that convergence remains to be studied. No E_∞, abutment, convergence,
  exact couple or filtered-complex convergence theorem exists. Grothendieck axioms
  (`HasExactLimitsOfShape`, `CountableAB4Star`, `AB5`, `IsGrothendieckAbelian`) and
  `HasCountableProducts` exist; lim¹ exists only as Mittag–Leffler on types.
- **Tau Ceti (pinned).** No spectral-sequence, abutment or exact-couple declarations.

## Why the verdict

Not a duplicate: no roadmap or library file owns limit pages, convergence as a structure on a
pair, conditional convergence in an abelian category, the comparison theorem, or the
identification of Mathlib's spectral-object sequences as convergent. Not a Part II: the nearest
owners (DGFloer Layer 1 item 3, StableHomotopyKTheory §§7.22–7.26) treat the subject as an
auxiliary tool inside Floer theory and stable homotopy; a general homological-algebra roadmap
does not continue either in its direction, and DGFloer already has a Part II. Not a merge: no
open target or design overlaps. So: a new design, built on DGFloer, DerivedModuleAlgebra and
AlgebraicTopology on main and on StableHomotopyKTheory §7.22 (hence inserted in the merge order
after StableHomotopyKTheory).

Generality: the filed statement is already at the abelian-category level; the only special case
in it ("filtration finite in each degree") becomes a Check of the exhaustive-and-bounded and
complete-convergence theorems. Convergence in a set of total degrees is made the general form.

## Sources

Fetched through the sources service into `packages/SpectralSequencesAndConvergence/sources.toml`:

- `stacks-012K` (certified, open repository): the whole "Homological Algebra" chapter; §§20–25
  and §31 supply the open spine for targets 1, 2, 4, 6 and the bounded cases of 5.
- `browning-sawin2020` (certified, arXiv 1711.10451v3): Theorems 1.1 and 2.7 and Proposition
  2.5, the convergence-in-a-range statement behind target 10. This is the Annals 191 (2020)
  no. 3 paper the issue refers to; the preprint numbering was used.
- `helle-rognes2024` (certified, author page at the University of Oslo): the open formulation of
  Boardman's definitions and theorems (Definitions 2.3, 2.5, 2.7, 3.3, 3.6, 3.7, 3.11; Theorems
  3.9, 3.10), used for target 3's locators.
- `eilenberg-moore1962` (uncertified): the service treats the publisher's page as paywalled;
  cited by DOI and section.
- Weibel, Boardman, McCleary, Massey and Cartan–Eilenberg: paywalled, cited by locator only.
  The service could not record them during this run because its arXiv search was rate-limited
  (HTTP 429) and it reported "network trouble" instead of "uncertified" on three runs; the
  five entries were therefore written into the manifest by hand as `uncertified`, with DOI,
  authors, title, year and locators, in the same form the service used for Eilenberg–Moore.
  Boardman's author page at Johns Hopkins answered 403; a copy on a University of Oslo course
  page was found but not used, since it is a publisher PDF on a course site, not an author or
  repository copy. Boardman's theorem numbers in the brief come from Helle–Rognes's citations
  (8.10, 8.13) and from StableHomotopyKTheory's (5.10, 7.1, 8.2) and are marked as such.

No `needs-references.toml` was written: every unread work is a published text citable by its
locator, and the open substitutes cover the statements the design needs.

## Suspicious text

None. No fetched text or roadmap passage contained instructions.
