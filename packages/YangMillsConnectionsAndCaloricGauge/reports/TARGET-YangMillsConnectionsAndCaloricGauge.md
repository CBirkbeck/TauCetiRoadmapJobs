# Triage of TARGET-YangMillsConnectionsAndCaloricGauge

**Verdict: design.** Name `YangMillsConnectionsAndCaloricGauge` (the suggested name; unused by any
roadmap, pull request or package). Brief: `packages/YangMillsConnectionsAndCaloricGauge/target.md`.
Manifest: `packages/YangMillsConnectionsAndCaloricGauge/sources.toml` (12 entries, `sources check`
reports 0 problems). Two texts are requested in the job's `needs-references.toml` (see below);
nothing in the brief depends on them.

## What I searched

- **Consolidation against the board.** Every open target and design in the brief's list, by
  object. None plans finite-energy connections on `ℝ⁴`, the Yang–Mills heat flow, caloric
  connections or topological classes of rough connections. The nearest are
  `DESIGN-SobolevMapsBetweenManifolds` (`W^{1,p}_loc` classes of continuous maps between manifolds:
  a possible supplier of language for `G`-valued Sobolev maps, but Oh–Tataru's `G^{2,d/2}_loc` maps
  are matrix-valued and not continuous in the critical case, so it is not an overlap),
  `DESIGN-LorentzianGeometry` and `DESIGN-CompressibleEulerEquations` (different equations). No
  `merge-into`.
- **Roadmaps on main and at open pull-request heads** with `roadmaps grep` for `yang.?mills`,
  `caloric`, `instanton number|second Chern|Chern.?Weil`, `uhlenbeck`, `bogomol`, `heat flow`,
  `π₃`, `littlewood.?paley`, `homogeneous sobolev|Ḣ¹`, `coulomb gauge`. Findings:
  - `caloric`: no match anywhere.
  - Yang–Mills: SmoothBundlesConnections (main) stops before the Yang–Mills energy (its README lines
    19–21, 66–72) and leaves the closed-manifold energy to a Part II; FourManifolds (#936) Layer 5
    owns the `SU(2)` Yang–Mills calculus on closed four-manifolds, the normalisation
    `k = ⟨c₂,[M]⟩ = (8π²)⁻¹∫tr(F∧F)`, `E = 8π²k + 2‖F⁺‖²`, BPST, Uhlenbeck's small-curvature Coulomb
    gauge on the unit Euclidean 4-ball for `SU(2)`, removable singularities, compactness and the
    clutching-class-to-`c₂` comparison (FourManifolds README lines 2226–2320, 2542–2560);
    InstantonFloerTheory (#1083) consumes F5 and owns `SO(3)` adapters and the three-dimensional
    theory; LocalVariationalFieldTheory (main) owns the jet-level Yang–Mills Euler–Lagrange identity;
    SeibergWittenTheory (main) owns the abelian monopole theory; HamiltonianReduction R5 owns
    Sobolev gauge groups over surfaces; RicciFlow (#1023) owns parabolic theory on closed manifolds.
    None states connections on `ℝ⁴` with `L²` curvature, the good global gauge theorem, topological
    classes of rough connections, the heat flow on `ℝ⁴` or the caloric gauge.
  - `π₃`: StringOrientation (#948) and DGFloer (main, Layer 11 item 3) use the finite cover
    `T × K → G` and `π₃(K) ≠ 0`; HomotopySpheres (#284) has stable `π₃(SO) = ℤ`; nobody owns
    `π₃` of a general compact Lie group, which the brief lists as background (Mimura–Toda) rather
    than a target.
  - Littlewood–Paley, homogeneous Besov spaces, the heat semigroup on `ℝ^d`: PDE (main) §6.3,
    §7.1–7.2; the filed target names PseudodifferentialOperators for the projections, which is
    corrected in the brief (PDO Layer 5 consumes PDE §7.2).
  - Chern–Weil: CharacteristicClasses is on main (C4 curvature classes and integral comparison), not
    only at #1654 as the issue says.
- **The libraries at the pins.** Tau Ceti has `Analysis/Sobolev` (`W1p`, `Wkp`, weak derivatives,
  mollification, embeddings, Morrey, Rellich) on open subsets of a Euclidean space, no homogeneous
  spaces, nothing on connections, Yang–Mills or caloric gauges (grep for `yang`, `caloric`,
  `Hdot|HomogeneousSobolev`: no hit). Mathlib has `HomotopyGroup`, `Matrix.unitaryGroup`,
  `Matrix.specialUnitaryGroup`, Banach manifolds, Bessel-potential `H^{s,p}`.
- **The merge order.** FourManifolds is at line 125, RicciFlow 204, InstantonFloerTheory 278,
  GaugeQuiltFieldTheory 279; PDE, DifferentialGeometry, CharacteristicClasses, SmoothBundlesConnections,
  LieGroups, DGFloer and AlgebraicTopology are on main. The new roadmap's last supplier in the order is
  FourManifolds, so it is inserted after it.

## Why `design`

- Not a duplicate: no roadmap or library declaration owns any of the fourteen targets.
- Not a Part II: the candidate bases are SmoothBundlesConnections (whose planned Part II is the
  Yang–Mills energy on closed Riemannian manifolds, a different direction) and FourManifolds (compact
  `SU(2)` theory). The target is the noncompact, critical-regularity, general-`G` theory on `ℝ⁴` that
  the hyperbolic Yang–Mills programme needs; it imports both and continues neither.
- Generality raised where the sources support it: the topological-class layer in every `d ≥ 3` with
  `L^{d/2}` curvature (Oh–Tataru's arbitrary-class paper is stated for general `d`), all
  characteristic numbers `χ_f`, general compact `G` throughout, with `d = 4`, `f = −⟨·,·⟩` and
  `G = SU(2)` as specialisations and Checks. The heat-flow and caloric layers stay in `d = 4`
  because the dichotomy and threshold theorems use energy criticality.

## Sources

Fetched through the service and certified: the four Oh–Tataru arXiv texts (v2 of 1709.08599,
1709.08604, 1709.08606, 1709.09332), Gursky–Kelleher–Streets arXiv:1708.01157v3 (added: target 9,
the ground state energy, needs its energy gap, and the issue did not list it), and Råde's Crelle
paper from GDZ (image-only scan, recognised by OCR; the article PDF is the logical unit `LOG_0010`
of volume 431). All locators in the brief are `<source id> line N` into these texts.

Recorded uncertified, cited by locator: Freed–Uhlenbeck (Springer; I found no free copy on the
SLMath site, contrary to the issue's note), Donaldson–Kronheimer (OUP, HTTP 403), Bogomol'nyi (no
open copy), Mimura–Toda (AMS).

Requested in `needs-references.toml`: Uhlenbeck's two 1982 papers. Both are open access on Project
Euclid, but every fetch by the service (the `download/pdf_1` links, the article pages and the `.pdf`
links) returned the site's Incapsula "Request unsuccessful" page or HTTP 403. The service had first
recorded one of them as certified with the hash of that block page; I corrected both manifest entries
to `uncertified` with a `version_note` explaining the block, and listed them as missing with
everything tried. The brief does not depend on them: the statements used (Uhlenbeck's lemma on a
ball for general compact `G`, and the punctured-ball extension) are restated in the certified
Oh–Tataru text (`OhTataru-TopClass` lines 1358–1412), and the brief cites those lines. A local copy
or a waiver settles the request.

## Points for the design author

- The only real ownership tension is with FourManifolds F5 (`SU(2)` Uhlenbeck lemma and removable
  singularities on the unit 4-ball). The brief assigns the general-`G`, general-`d` ball lemmas to
  this roadmap and asks for F5's statement as a Check; a human may prefer to move ownership.
- The parabolic core (Theorems 5.9–5.11, 6.1, 6.6 of `OhTataru-YMHF`) and the homogeneous function
  spaces are the hard part; PDE Layers 6–7 are unbuilt at the pin. The design should decide early
  which of targets 10–12 are proved and which are stated with `sorry`, and should state the Lean
  headlines through carriers that exist.
- The Oh–Tataru locators are into arXiv v2; the published versions may renumber.

## Suspicious text

None. No fetched text or issue text contained instructions.
