# Review of ContactGeometry (pull request #2684 at 71e7c7e)
Folder: `TauCetiRoadmap/SymplecticGeometry/ContactGeometry/`
**Verdict:** accepted

**Summary.** Accepted: there is no finding. The four explicit anchors added before the Layer 1, 4, 5 and 6 headings match, character for character, the `#cg1--…`, `#cg4--…`, `#cg5--…` and `#cg6--…` links in the SymplecticGeometry family README and in CotangentLagrangian on main, so the deferred broken-link point is settled. There are five small corrections and no format notes, none blocking. Three carry over from the previous round, untouched by this change: the Summary's "contact predicate fixed here", the §6.1 headline without a locator, and the unnamed owner of the frame completion in §1.1. Two are new. The description still says that the anchors no longer exist. The family README paragraph whose links now resolve describes Layer 1 and Layer 4 in terms this README no longer supports. Nothing is left for a human to decide.

## C01 — The description still says that the old heading anchors no longer exist and that the linking files must be updated, which this head contradicts

A reader of the description would go and edit the SymplecticGeometry README and CotangentLagrangian for nothing. Under "What changed in form", the description says: "The heading anchors `#cg1--…`, `#cg4--…`, `#cg5--…` and `#cg6--…` no longer exist. The SymplecticGeometry root README and CotangentLagrangian link to them; those links need updating in those files." At this head, README lines 110, 488, 606 and 811 define exactly those four ids, immediately before the Layer 1, 4, 5 and 6 headings. The ids match the links at lines 70, 73, 74 and 76 of the family README and at lines 364, 379, 380 and 736 of CotangentLagrangian on main.

Replacing the bullet with this would make it right: "The old heading anchors `#cg1--…`, `#cg4--…`, `#cg5--…` and `#cg6--…` are kept as explicit anchors before the Layer 1, 4, 5 and 6 headings, so the links to them from the SymplecticGeometry README and CotangentLagrangian still resolve."

## C02 — The Summary says CotangentLagrangian uses "the contact predicate fixed here", although the predicate is Tau Ceti's

The previous round raised this as C01, and it is not repaired. A reader of the overview infers that this roadmap owns the contact predicate, while CotangentLagrangian is also listed as its supplier. The Summary, lines 35–36, reads "CotangentLagrangian the Liouville form and the unit cosphere bundle, and it uses the contact predicate fixed here". Convention 5 (line 88) adopts Tau Ceti's `TauCeti.SmoothForm.IsContactForm`, which is defined at Tau Ceti `Geometry/Contact/Basic.lean:100`.

Downstream consumers (lines 905–907) already says the right thing: CotangentLagrangian uses "the contact predicate of the Conventions (Tau Ceti's `TauCeti.SmoothForm.IsContactForm`)". The previous report wrongly said that this passage repeats the claim. Only the Summary needs the change, for example "… and it uses Tau Ceti's contact predicate, the one adopted in the Conventions".

## C03 — The Jacobi-bracket headline of §6.1 still cites no source, although two of the cited texts state the correspondence it rests on

This is the previous round's C02, not repaired. Section 6.1 (lines 815–840) carries no locator. Neither do the docstrings of `jacobiBracket`, `contactHamiltonianVectorField_jacobiBracket` and `jacobiBracket_jacobi` in `Suggested.lean`. So the one headline tested in Lean without a reference is this one.

Two of the cited texts would serve. Kriegl–Michor 43.15, p. 472 (KrieglMichor1997 lines 21623–21632) states that contact vector fields form a Lie algebra, mapped bijectively onto `C^∞(M)` by contraction with `α`. Geiges, Theorem 2.22, p. 16 (GeigesHandbook lines 530–546) states the same correspondence with the equations of Convention 7. Either one, cited at §6.1 and in the three docstrings, would do.

## C04 — §1.1 and §1.2 complete a frame of `D` to a frame of `TM` and make `ξ⁰` a line subbundle without naming the roadmap that owns that subbundle API

This is the previous round's C03, not repaired. The *Needs* lines of §1.1 (lines 139–141) and §1.2 (lines 174–178) name no owner for these steps. On main, LieGroupoidsPoisson §G0.1 develops the generic smooth-subbundle API: local frames of a subbundle extend to frames of the ambient bundle, and kernels of constant-rank bundle maps are subbundles (its README lines 368–380). LieGroupoidsPoisson does not consume this roadmap: it mentions ContactGeometry once, as leaving Poisson theory to it. Adding "LieGroupoidsPoisson §G0.1 (subbundle frames and kernels)" to both *Needs* lines and to the supplier contracts would keep the API from being planned twice.

## C05 — The family README paragraph whose links these anchors restore describes Layers 1 and 4 in terms this README does not support

With the anchors in place, a reader can follow the family README's links into this README. What they find there contradicts two clauses of that paragraph (family README lines 70–75):

- "ContactGeometry CG1 owns the contact predicate": Layer 1 consumes Tau Ceti's predicate (line 118), and Scope and ownership lists it as in the library (lines 923–924).
- "CG4 and CG5 consume the cosphere application": Layer 4 (lines 490–604) cites no CotangentLagrangian section. Only §5.6, and §6.4 through it, use §2.2 (C2.2); Downstream consumers (lines 905–907) says the same.

The family index is part of this pull request's folder tree. Rewording the two clauses there would align it with this README, for example "CG1 builds the contact line and the line-valued Levi form on Tau Ceti's contact predicate; CG5 (§5.6) consumes the cosphere application".

## Previous findings

- C01 — not repaired: the Summary (lines 35–36) still reads "it uses the contact predicate fixed here". Downstream consumers (lines 905–907) already names Tau Ceti's predicate, so only the Summary needs the change (C02 above).
- C02 — not repaired: §6.1 (lines 815–840) and the docstrings of `jacobiBracket`, `contactHamiltonianVectorField_jacobiBracket` and `jacobiBracket_jacobi` still carry no locator (C03 above).
- C03 — not repaired: the *Needs* lines of §1.1 (lines 139–141) and §1.2 (lines 174–178) still name no owner for frame completion and line subbundles (C04 above).

## Deferred findings

- D01 — resolved: explicit anchors `cg1--…`, `cg4--…`, `cg5--…`, `cg6--…` at README lines 110, 488, 606, 811 match the family README links at lines 70–76.

## Verified sound

| Statement | Instances tried | Roadmap side | My side | Result |
|---|---|---|---|---|
| Anchor `cg1--contact-distributions-contact-line-and-cooriented-forms` (line 110) | family README line 70; CotangentLagrangian main lines 364, 736 | id precedes the Layer 1 heading (line 112) | link fragments equal the id, character for character; the target is Layer 1 | resolves |
| Anchor `cg4--symplectization-and-contactization` (line 488) | family README line 73; CotangentLagrangian main line 379 | id precedes the Layer 4 heading (line 490) | fragments equal the id; Layer 4 cites no CotangentLagrangian section (C05) | resolves |
| Anchor `cg5--isotropic-and-legendrian-neighborhoods` (line 606) | family README line 74; CotangentLagrangian main line 380 | id precedes the Layer 5 heading (line 608) | fragments equal the id; §5.6 consumes C2.2 | resolves |
| Anchor `cg6--contactjacobi-interface-floer-boundary` (line 811) | family README line 76 | id precedes the Layer 6 heading (line 813) | fragment equals the id; §6.4 gives the DGFloer sign adapter | resolves |
| §6.1 `jacobiBracket`, `contactHamiltonianVectorField_jacobiBracket` (C03) | `x, y, z` on `(ℝ³, dz − x dy)` | `{x,y} = −1`, `{y,z} = y`, `{z,x} = 0`, `[X_x,X_y] = −∂_z = X_(−1)` | `X_H = (xH_z+H_y)∂_x − H_x∂_y + (H−xH_x)∂_z`; `dα(−∂_y, ∂_x) = −1`; `X_(−1) = −∂_z` | holds |
| §6.1 `jacobiBracket_jacobi`, `n = 0` | `(ℝ, dz)`; coordinates of ℝ³ | Jacobi identity; `−1 + 0 + 1 = 0` | `X_H = H∂_z`, `{f,g} = fg′ − gf′ = [f∂, g∂]` coefficient; `{z,−1} = 1`, `{y,0} = 0` | holds |
| §6.1 Leibniz API | `f = z`, `g = h = y` | `{f,gh} = g{f,h} + h{f,g} − gh{f,1}` | `{z,y²} = −y²`; `2y(−y) − y²(−1) = −y²`, since `{z,1} = −Rz = −1` | holds |
| §1.1 quotient bundle by frame completion (C04) | `ξ = ker(dz − x dy)`, frame `∂_x`, `∂_y + x∂_z`; completions `∂_z` and `∂_z + ∂_x` | rank-1 quotient, transition from the complementary block | `∂_x ∈ ξ`, so both completions agree mod `ξ`: transition `1`; `α` sends the class of `∂_z` to `1` | holds |
| Summary sentence on the predicate (C02) | Convention 5; Downstream consumers | "the contact predicate fixed here" (lines 35–36) | the predicate is `TauCeti.SmoothForm.IsContactForm` (Tau Ceti `Geometry/Contact/Basic.lean:100`); line 905 names it | misleads; C02 |

The rows for the statements this change does not touch stand as in the previous review, of `dade1f8`.

- Source locators checked against the text: 2 (KrieglMichor1997 43.15, lines 21603–21632, pp. 471–472; GeigesHandbook Theorem 2.22, lines 519–546, p. 16), for C03.
- Library declarations opened at the pin:
  - Tau Ceti `SmoothForm.IsContactForm` (`Geometry/Contact/Basic.lean:100`) and `contactHamiltonianVectorField` (`Geometry/Contact/Hamiltonian.lean:187`);
  - Tau Ceti `reebVectorField` (`Geometry/Contact/Reeb.lean:75`) and `IsContMDiffDistribution.exists_local_annihilator` (`Geometry/Manifold/Distribution/Annihilator.lean:57`).
- Cross-roadmap citations resolved on main:
  - the four anchor targets, from SymplecticGeometry README lines 70–76 and CotangentLagrangian lines 364, 379–380 and 736;
  - LieGroupoidsPoisson §G0.1 (lines 299–380), and its only mention of ContactGeometry (line 2026);
  - the open revisions of CotangentLagrangian and SymplecticGeometry use no `#cg…` fragment.
- Automatic checks: the gate is OK on every check. Dependency check: `depcheck: 182 roadmaps, 2072 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives 8 `declaration uses 'sorry'` warnings and no error. The file is unchanged since `dade1f8`, so the binder comparison and the one-tactic probe of the previous review stand.
- Ownership against open work: no object changed; the overlap report lists no open pull request changing this roadmap and no dropped id.

Overlap check: read CotangentLagrangian (main and its open revision), SymplecticGeometry (main and its open revision), HamiltonianReduction, DGFloer and HamiltonianSystems, as in the previous review. The change adds only anchors, so the owners stand: the cosphere forms are CotangentLagrangian §2.2's; the contact-type conditions are DGFloer Layer 6's; the §4.3 collar is this roadmap's; the contact predicate is Tau Ceti's (C02, C05).

Source independence: changed passages only. The four added lines are HTML anchors with no prose, so nothing was compared and nothing is shared. No layer was added, removed or reordered, so the arrangement was not compared again. The largest share of locators is CourteGuillermouNotes, 11 of 21, and the contents were found independent in the previous review.

Research link: §5.4 is Lychagin's Legendrian neighbourhood theorem, which Kriegl–Michor (1997, Theorem 43.19) use to make the contactomorphism group a regular Lie group. Geiges (2006, §§2.4–2.5) uses Gray stability, Darboux and the neighbourhood theorems for isotopy extension and global existence results. DGFloer's Corollary E consumes the §4.3 collar. This rests on KrieglMichor1997 §43, GeigesHandbook and the DGFloer README.

## Not verifiable

- none

## Source issues

- **Misprint** in GeigesHandbook at Theorem 2.22, p. 16: the source says the correspondence is with smooth functions into the positive reals; it should be all smooth real-valued functions, since `α(X)` takes any sign and the proof treats arbitrary `H`; affects nothing.

## For the human reviewers

- none
