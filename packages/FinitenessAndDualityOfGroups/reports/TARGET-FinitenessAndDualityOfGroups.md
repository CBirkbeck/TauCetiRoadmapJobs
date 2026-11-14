# Triage report — TARGET-FinitenessAndDualityOfGroups

**Verdict: design**, name `FinitenessAndDualityOfGroups` (the suggested name; not used by any
roadmap on main, open roadmap pull request or board package).

This is the second run. The first run's request for `Bieri1981` was answered by waiving it
(`packages/FinitenessAndDualityOfGroups/sources.toml`, status `waived`). Its deliverables were not
in the board checkout, so every check below was repeated against the current main, open pull
requests, board packages and pins. The answered key is not requested again.

## What was searched

**Open targets and designs on the board.** The only other open job listed is
DESIGN-VirtualFundamentalClassPartII (virtual classes of Deligne–Mumford stacks). It shares no
object with this target, so there is no merge. I also read every board package that has a
`target.md` or design for overlap by object. CohomologyOfGroups (`packages/CohomologyOfGroups`,
designed, merge-order position 318) is the nearest. Its design README excludes this target's
subject in its Scope (the bullet "Finiteness conditions, cohomological and virtual cohomological
dimension, duality groups, Euler characteristics and Farrell cohomology are not planned here")
and names this roadmap in "Downstream consumers". Its `target.md` records it as open target
#14492. So it is a supplier, and two designs would not plan the same theory.

**Roadmaps on main and open roadmap pull requests** (`roadmaps grep`, 466 open pull requests and
main). I searched by object, not only by name. Outcomes by term:
- "cohomological dimension": 201 hits, all étale, Galois or profinite apart from those named
  below.
- "duality group": one hit, Completed/ProfiniteProPGroups line 1655, which says profinite duality
  groups are not built.
- "type FP" / `FP_n` / "type FL": no group-theoretic hit.
- "Farrell": hits are Farrell–Jones and Farrell–Taylor–Wagoner, plus BordismFormalGroups' profinite
  Brown–Farrell resolution for Morava stabilizer groups. That resolution is continuous and owned
  there, so it is not this target.
- "Eilenberg–Ganea", "Poincaré duality group": no match anywhere.
- "virtual cohomological dimension" / `vcd`: three hits, all uses rather than definitions —
  GeometryOfNumbersAndQuadraticArithmetic (Galois `cd_p`), ArithmeticKTheory (#1418) and
  PosetHomotopyAndSubgroupComplexes (#2296).
- "Hattori–Stallings": EtaleCohomologyFoundations §F.10.3 on main (the trace over any ring, a
  supplier); CohomologicalPointCounting/TraceFormula (#196); RefinedTraceMethods (#1493, `K₀`
  trace).
- "rational Euler characteristic" / "Euler characteristic of a group": only #2296, plus ∞-category
  hits about finite spectra.
- "geometric dimension": only algebro-geometric uses.

**Instances read in full context** (none owns the general theory):
- ArithmeticKTheory §3.2 (#1418) proves the Borel–Serre duality of torsion-free finite-index
  subgroups of `Aut(P)` with the Steinberg dualizing module, and its own "duality API". This is
  an instance of target 5.4–5.5; it is compared, not restated.
- MotivicStructuresInModuliOfCurves (board, §2.1) owns Harer's `vcd` bound as an input "no
  roadmap owns". It is a consumer.
- FuchsianOrbifolds (main) Layer 5 item 6 defines the orbifold Euler characteristic by signature,
  with `χ_orb(PSL(2,ℤ)) = −1/6`. It is used for a Check.
- BianchiModularForms §9.3 states the orbifold Euler characteristic of Bianchi groups (an
  instance).
- PosetHomotopyAndSubgroupComplexes (#2296) leaves Brown's `p`-fractional theorem out (lines
  100–107 of its README). That is a non-goal here too.
- ArithmeticLocallySymmetricSpaces (#871) and its Part II state no duality group, `vcd` or group
  Euler characteristic.

**Libraries (pins of `lake-manifest.json`).** Mathlib has nothing named for these objects. It has
the carriers, `groupCohomologyIsoExt`, `HasProjectiveDimensionLE`, `projectiveDimension`,
`Group.IsFinitelyPresented` and `tateCohomology`. Pinned Tau Ceti has substantial module-level
foundations:
- `TauCeti.Huber.IsPseudoCoherentOver`, over any `Ring`, with two-out-of-three lemmas; `FP_n` is
  this for the trivial module over the group ring.
- `TauCeti.Module.IsFPD` with `isFPD_iff_hasProjectiveDimensionLE`; this is `FP`.
- `TauCeti.leastENatBound`, whose docstring names cohomological dimensions as its use.
- `TauCeti.ExactStructure.CompleteResolution` with its comparison theorem, and
  `CochainComplex.IsTotallyAcyclic`, which is limited to finitely generated terms.
- `TauCeti.cellularResolutionOfIsAspherical` and the group-homology directed-union lemma.
- `TauCeti.trace_ofModule'_eq_zero_of_dvd_orderOf` and
  `TauCeti.nonempty_linearEquiv_of_projective_of_tensorRat`; these are the inputs for Swan's
  theorem.
- A *profinite* `TauCeti.cohomologicalDimension` (continuous cohomology with discrete torsion
  coefficients). The discrete invariant needs another name; this is recorded as a risk and a
  comparison target, 2.6.

None of these is a group-level finiteness, dimension, duality, Euler-characteristic or Farrell
statement, so the verdict is not `duplicate`.

## Why `design`, not `part-ii`

CohomologyOfGroups is the only candidate base. It is not on main: it is a board design in the
merge order. More importantly, this target does not continue its direction. That roadmap owns
operations on the (co)homology functors. This one is a new theory, homological finiteness and
dimension, which consumes those operations throughout and has different sources. CohomologyOfGroups
itself plans this as a separate later roadmap. ProfiniteCohomology Layer 11 is the profinite
analogue with different carriers. GorensteinHomologicalAlgebra (#323) builds complete resolutions
over rings and excludes complete cohomology of groups.

## Generality

The filed wording is kept at a commutative ring `R` with `ℤ` as the instance. I made these
changes for generality or correctness:
- **Torsion.** "Finite cd ⇒ torsion-free" becomes the general statement: `cd_R` of a finite group
  is `0` or `∞` according to whether its order is a unit of `R`. The `ℤ` statement is the
  instance.
- **Euler characteristic.** It is stated at Brown's generality, groups of *finite homological
  type*, which contains the groups with a finite-index `FL` subgroup that were filed. Two
  characteristics are kept apart: the naive Hattori–Stallings one and the rational-homology one.
  They are identified only for type `FL`, because the general identification is the Bass
  conjecture (a non-goal).
- **Multiplicativity in extensions** is Brown's virtually-`FP` statement.
- **The amalgam formula** is the instance of the equivariant Euler characteristic of an action on
  an acyclic complex.
- **Swan's theorem.** Brown's proofs need it in its rational and mod-`p` forms. No roadmap states
  it, so it becomes target 6.2, with a short route through two pinned declarations.
- **Brown's criterion** is stated degree by degree, in the exact form of `Brown1975` Theorem 2.
- **Farrell cohomology** takes coefficients in `Rep R G`.
- **Kept over `ℤ`.** Serre's theorem stays over `ℤ` until a readable source gives an `R`-form.

## Sources

| key | status | read |
|---|---|---|
| `Serre1971Bourbaki` | certified (Numdam) | §1 lines 26–86, line 214 |
| `BieriEckmann1973` | certified (GDZ, OCR) | Definition 1.1 (line 116) through Theorem 4.6 (line 624) |
| `BieriEckmann1974` | certified (GDZ, OCR) | Proposition 1.2 (line 135), §3 (lines 252–334) |
| `Brown1974` | certified (GDZ, OCR) | §§1, 3–6, Appendix A (lines 125–1355) |
| `Brown1975` | certified (GDZ, OCR) | Theorems 1–3 and corollaries (lines 72–215) |
| `Bieri1981` | waived (settled) | cited by locator |
| `Serre1971Prospects`, `EilenbergGanea1957`, `Wall1961`, `Farrell1977`, `BrownGTM87` | uncertified (paywalled) | cited by locator only |

`Brown1975` (*Homological criteria for finiteness*) was not among the filed sources. It is the
open source of the exact `FP_n` criterion the target asks for, and of the theorem that duality
groups are of type `FP`. I kept to Brown's book (`BrownGTM87`) only at section level, as a
coverage checklist.

**How the manifest was completed.**
- The sources service recorded `BrownGTM87` and `Farrell1977` as `uncertified` itself (paywalled
  DOI prefixes).
- It filed `EilenbergGanea1957`, `Wall1961` and `Serre1971Prospects` as missing. The DOI landing
  pages of the first two are JSTOR and a Cambridge Core abstract page, hosts on none of its lists;
  it found no copy of the third.
- All three are paywalled. The target filed each to be "cited by locator", and the brief's rule
  for a paywalled theorem is `uncertified`. I therefore recorded them as `uncertified`, with their
  DOIs and a `version_note` explaining this, and dropped them from `needs-references.toml`.
- The service had also left `authors`/`title`/`year` empty on URL fetches; I filled them in.
- `sources check` reports 0 problems. No text is requested in this run: every cited work is
  certified, `uncertified` or waived.
- If a reviewer prefers these three to go through a human request, that is the only change
  needed. No final target depends on their text: `Brown1974` reports Serre's cited statements at
  lines 354, 402, 474 and 612, and Eilenberg–Ganea is also located in `BrownGTM87` §VIII.7.

**Citation check.** `roadmaps resolve` on `target.md` reports one lead: "CohomologyOfGroups §3.5"
is not a roadmap on main or in an open pull request. That is expected, because CohomologyOfGroups
is a board design (`packages/CohomologyOfGroups/design/README.md`, merge order position 318); its
section numbers were read there. Every backticked Lean name was checked by hand against the
pinned Mathlib and Tau Ceti, since the tool could not check pinned names on this host.

## Points for the designer and for review

- **Complete resolutions.** The pinned totally acyclic complexes require finitely generated terms,
  and #323 is outside the board's merge order. The fallback is named in Risks.
- **SL₂(ℤ).** `SL₂(ℤ) ≅ ℤ/4 ∗_{ℤ/2} ℤ/6` has no owner, and three Checks use it.
- **Merge order.** This roadmap should come after CohomologyOfGroups and before
  MotivicStructuresInModuliOfCurves (§2.1), so that `vcd` has a supplier there.
- **No suspicious instructions** were found in any fetched page, pull request or README.
