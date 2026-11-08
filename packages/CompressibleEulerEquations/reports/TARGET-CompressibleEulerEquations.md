# Triage report: TARGET-CompressibleEulerEquations (jobs issue #6000)

Verdict: **design**, name **CompressibleEulerEquations**, no base, no owner. Brief at
`packages/CompressibleEulerEquations/target.md`; manifest at `packages/CompressibleEulerEquations/sources.toml`
(18 entries, `sources check` clean). No `needs-references.toml` is left: the four works the previous run could
not read (Christodoulou 2007, Hawking–Ellis, O'Neill, Friedrichs) were waived by a human on the jobs issue and
are cited by locator.

## Two runs

This job ran twice. The first run (2026-11-04) did the searches, fetched the open sources, drafted the brief
and stopped for the four unreadable texts. When the human's answer arrived the manifest held only the four
waived entries, so this run re-recorded the fourteen other sources through the service (all from the cache),
re-checked every line locator the brief cites against the cached extractions, and updated the brief for a
change on the board: LorentzianGeometry, cited by the target as "Definition #51 of the same series", was an
open target (#6011) on 2026-11-04 and is now `DESIGN-LorentzianGeometry` (#6251) with
`packages/LorentzianGeometry/target.md`.

## What was searched

Mathematical objects looked for: the compressible (isentropic, barotropic or full) Euler system; symmetric
hyperbolic systems, the Friedrichs energy identity and local well-posedness in `H^s`; finite speed of
propagation for first-order hyperbolic systems; Lorentzian metrics, Lipschitz causal curves, domains of
dependence and Cauchy developments; the acoustical metric; developments of characteristic data; the maximal
development of an initial data set.

- The board's open targets and designs (the brief's list), `packages/*/target.md` and `packages/*/README.md`
  by grep for `compressible`, `symmetric hyperbolic`, `acoustical`, and the packages-under-review index
  (`AnalyticNumberTheory`, `AutomorphicCongruences`, `LawrenceVenkateshMethod`,
  `LogicAndDefinabilityInNumberTheory`: unrelated).
- The merge order `merge-order/ORDER.txt`: no hyperbolic PDE, fluid or Lorentzian roadmap on it.
- The roadmap repository at main: `TauCetiRoadmap/PDE`, `RiemannianGeometry`, `DifferentialGeometry`,
  `Completed/HopfRinow`.
- The open roadmap pull requests (index of 2026-11-05) through `roadmaps grep` for `compressible euler`,
  `symmetric hyperbolic`, `acoustical metric`, `domain of dependence`, `maximal development`, and on the first
  run also `finite speed of propagation`, `quasilinear`, `Lorentzian`, `null hypersurface`, `Cauchy horizon`,
  `semi-Riemannian`, `pseudo-Riemannian`; the full READMEs of PDE (#93), IncompressibleFlows (#237) and
  RelativisticQuantumFieldTheory (#1772) through `roadmaps show`.
- The pinned Mathlib and Tau Ceti: `Mathlib/Analysis/Distribution/Sobolev.lean`,
  `Mathlib/Geometry/Manifold/Riemannian`, `Mathlib/Analysis/ODE`, `TauCeti/Analysis/PDE`,
  `TauCeti/Analysis/Sobolev`, `TauCeti/Analysis/ODE`, `TauCeti/Geometry/Manifold/Riemannian`, and greps for
  `Lorentz`, `Minkowski`, `symmetric hyperbolic`, `compressible`, `acoustic`.

## What was found

- **No owner.** The only hits for "compressible" are IncompressibleFlows (#237), which builds incompressible
  Euler and Navier–Stokes on tori and Euclidean space and excludes the compressible system; PDE (main and #93)
  owns Sobolev spaces, elliptic and parabolic theory and Strichartz estimates for the flat wave equation but no
  first-order hyperbolic system; RelativisticQuantumFieldTheory (#1772, RQFT1) owns linear Klein–Gordon, Dirac
  and Maxwell on fixed Minkowski space with flat finite propagation, nothing quasilinear. The pinned libraries
  have no Lorentzian metric, no causal curve, no symmetric hyperbolic system; they do have `MemSobolev`,
  `W^{k,p}`, Bessel comparison, Picard–Lindelöf and Grönwall.
- **Not a Part II.** No roadmap stops where this one starts: the nearest, IncompressibleFlows, is a sibling
  consumer of PDE with a different system, and LorentzianGeometry is a definitions roadmap that names this
  target as its consumer.
- **No merge.** `DESIGN-LorentzianGeometry` (#6251) is the only design in the same area. Its Scope owns
  Lorentzian scalar products, metrics of finite regularity on manifolds with corners, time orientation,
  piecewise `C¹` causal curves, extensions, null hypersurfaces and generators, and characteristic hypersurfaces
  of `□_g`; it records the acoustical form only as an example and Check, declares "the compressible Euler
  theory of the acoustical metric (domains of dependence of a solution, developments, characteristic
  boundaries)" out of its scope, assigns causality theory proper (domains of dependence, Lipschitz causal
  curves) to a causality Part II, and places itself before this roadmap in the merge order. The two designs
  plan different theories with a declared supplier relation, so this is supply, not overlap. The other designs
  on the board (hyperbolic dynamics, hard spheres, Gaussian isoperimetry, complex Hessian equations, and the
  rest) share no object with the target.
- **Generality.** The filed statement is already at library generality (general `n`, both carriers, general
  equation of state with `p′ > 0`, polytropic law as instance). The brief adds: the symmetric hyperbolic
  local well-posedness theorem is stated for a general quasilinear symmetric hyperbolic system with
  compressible Euler as its instance, since it is the library's first; the non-isentropic system is carried
  alongside for the design to decide; `n = 2`, `n = 3` and the polytropic law are Checks.
- **Name.** `CompressibleEulerEquations` is used by no roadmap on main, no open pull request and no package;
  kept.
- **Annals references.** "Ann. of Math. 202 (2025), no. 2, arts. 2 and 3" are Luo–Yu, *On the stability of
  multi-dimensional rarefaction waves* I (631–752) and II (753–855), arXiv:2302.09714 and 2305.06308; both read
  from arXiv (OCR extractions of image-only scans). The issue form's arXiv id 1110.0214 for Chruściel's
  causality notes is wrong; the notes are arXiv:1110.6706, as LorentzianGeometry's manifest also records.

## Changes to the brief in this run

- LorentzianGeometry is cited as a design (#6251) by its layers and target numbers; the brief now imports its
  piecewise `C¹` causal curves, null hypersurfaces, null generators (its target 9 hypotheses: `g ∈ C¹`,
  hypersurface `C²`, null normal `C¹`) and `C^{1,1}` geodesic uniqueness, and owns the locally Lipschitz
  causal curves of the sound cone and the domain of dependence of the acoustical metric on the Galilean
  carrier, because LorentzianGeometry explicitly leaves Lipschitz curves and domains of dependence to a
  causality Part II that does not exist. A new Risk records this split and the one-way comparison to prove.
- Minguzzi's *Lorentzian causality theory* (Living Reviews) is now certified from the INSPIRE mirror of the
  publisher's open-access text, the same copy LorentzianGeometry's manifest records; the brief cites its
  Lipschitz-parametrisation remark and Definition 3.1 by line.
- Manifest years set to the publication years with `version_note` saying which arXiv version was read and
  that the locators are to it.

## Sources status

Certified (open repository): ChristodoulouMiao2014, Christodoulou2019, Speck2016, LukSpeck2018,
AbbresciaSpeck2022, LuoYu2023a, LuoYu2023b, BarGinouxPfaffle2007, Chrusciel2011, MinguzziCone2019,
Minguzzi2019. Uncertified (paywalled, cited by locator): Kato1975, Majda1984, Dafermos2016. Waived by a
human: Christodoulou2007, HawkingEllis1973, ONeill1983, Friedrichs1954. Nothing outstanding; no suspicious
instructions were found in any fetched text.
