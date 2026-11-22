# Review of HeightsForLogSingularMetrics (pull request #2894 at b34d4ea)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HeightsForLogSingularMetrics/`
**Verdict:** accepted

**Summary.** Accepted on an incremental re-review of the 14 lines changed since `ab8344f`: the three repairs to the mathematics and provenance (16.1 for `g ≥ 1`, bounded losses before the choice of `m` in 0.4, the Conventions sentence on targets without a locator) are correct and introduce no false statement, and the title and description now agree with this head. There is one small correction (the new Conventions sentence, read literally, also covers 4.3b (a), which the README says it does not prove) and one format note, neither blocking. Left for a human, as before: 16.1 (a) and the Layer 0 and Layer 14 theorems have no refereed source, and the formal proof that carries 44 of the 51 locators could not be read from a legal place.

## C01 — The new Conventions sentence also covers 4.3b (a), which is not this roadmap's own

A reader applying the rule added to Conventions (lines 22–24), "A target that names neither [FormalProof] nor a source with a locator … is this roadmap's own statement, proved by the route written at it", to 4.3b (a) (line 100) gets the wrong provenance: (a) names neither, yet it ends "This is used here, not proved: it is ChowFormsAndHeightsOfSubvarieties §6.2 (a7) for the dual bundle", and Scope and ownership (line 218) gives that roadmap as the owner. No stated result is affected, since 4.3b (a) says what it is in its own text.

The smallest change: "A target that names neither [FormalProof], nor a source with a locator, nor a section of another roadmap as its statement (as 4.3b (a) does) …".

## N01 — The generated list of open suppliers still names HeightsRationalPointsAndObstructions

The description's prose now lists HeightsRationalPointsAndObstructions §§5.9b, 5.17a, 5.17d, 5.17f among the roadmaps on main (it is there, with those sections), while the generated `depends-on` and `merge-order` blocks below it still list it as an open supplier (#1017). The blocks are refreshed by their tool; nothing in the author's text needs to change.

## Previous findings

The previous report (of `ab8344f`) had no finding; its small corrections and format note are accounted for here.

- C01 (16.1 (a) admitted `g = 0`) — repaired: "a principally polarised abelian variety of dimension `g ≥ 1`" in the Summary (line 5), in 16.1 (a) (line 181) and in the fourth bullet of the `Suggested.lean` docstring (line 55); (b1) refers to "`A` as in (a)".
- C02 (the integer `m ≥ sup_t ε_i(t)` need not exist) — repaired: 0.4 (c) (line 44) "after shrinking `t₀` so that the losses `ε_i(t)` … are bounded (they tend to `0`)"; the route of (b) (line 46) "after shrinking `t₀` so that the losses are bounded".
- C03 (targets with neither a source nor a statement of ownership) — repaired, with the residue C01 above: Conventions (lines 22–24) now says such a target "is this roadmap's own statement, proved by the route written at it: no source is claimed for it".
- C04 (the description's sentence on the family index) — repaired: the description names #2911, #2910 and #2923 as identical and the other seven as differing; the comparison at their heads confirms each (table).
- C05 (HeightsRationalPointsAndObstructions missing among suppliers on main) — repaired in the prose; the generated blocks are N01 above.
- N01 (References without a locator) — repaired: Conventions says that "a References entry that names its section without a theorem or page is background for it".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 16.1 (a) with `g ≥ 1` | `g = 0`; `g = 1`; (b1) at `g = 0` | `g = 0` now excluded, so `μ̂_max` is only taken of a nonzero lattice; `g = 1`: `−h(X) ≤ C·log(3 + max(h, 0))`, as in the Example (line 202); (b1) at `g = 0`: no `A` of dimension `≥ 1` and `≤ 0`, vacuous | consistent with SlopesOfHermitianVectorBundles §2.1 (nonzero `Ē`) and with the Checks | none |
| 0.4 (c), choice of `m` after shrinking `t₀` | loss `ε(t) = 1/(t₀ − t)` on `(0, t₀)`; `ε(t) = t` | first: `sup` over `(0, t₀)` is `∞`, over `(0, t₀/2)` is `2/t₀`, so `m = ⌈2/t₀⌉` exists; second: `sup = t₀`; `ε → 0` gives a `t₁` with `ε < 1` on `(0, t₁)`, so shrinking always works | `m` exists; every conclusion of (b), (c) is a statement as `t → 0` or for small `t` and is unchanged by shrinking | none |
| 0.4 route of (b), `m ≥ max(sup_t ε(t), m₀)` | same two families | finite after shrinking, as above; `L̄_{i,t} + mĀ` has curvature `≥ (m − ε_i(t))ω ≥ 0` | as stated | none |
| Conventions sentence on targets without a locator | 0.4 (a), (b); 14.1 (a), (b); 14.2 (a)–(c); 4.3a (a), (c); 4.3b (a), (c) | each of the first nine has a route at it (lines 46, 88, 106, 138, 155) and names no source; 4.3b (a) is "used here, not proved" | true of the instances it lists; too wide for 4.3b (a) | C01 |
| Description, family index against the sibling heads | index at the heads of #2911, #2910, #2923; #2879, #2909, #2880, #2891, #2884; #2882, #2883 | identical (0 differing lines) at the first three; two hunks (first sentence, sentence on the repository) at the next five; those two plus hunks in other sub-roadmaps' entries at #2882 and #2883; the entry for this roadmap identical in all | description's sentence correct | none |

The rows for the statements the change does not touch stand as in the previous review, of `ab8344f`.

- Source locators checked against the text: none in the changed passages (they add or alter no locator); the seeded sample falls in them only at 0.4 (c) and 16.1 (a), whose changed sentences cite no source.
- Library declarations opened at the pins: none new; the changed docstring line names no declaration.
- Cross-roadmap citations resolved in the changed text and the description: SlopesOfHermitianVectorBundles §2.1 (the maximal slope "of a nonzero sub-bundle", Conventions line 15); HeightsRationalPointsAndObstructions §§5.9b, 5.17a, 5.17d, 5.17f on main; ChowFormsAndHeightsOfSubvarieties listed above this roadmap in the family index (lines 125–131).
- Dependency check: `depcheck: 168 roadmaps, 1965 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no message. The file declares nothing (one `import Mathlib`, a docstring, the namespace), so there is no signature to compare and no one-tactic probe to run; nothing is padding.
- Headlines: unchanged, (1) 0.4 (b)–(c); (2) 4.3b (b); (3) 14.1 (a), (c); (4) 16.1 (a), now for `g ≥ 1` in the Summary, in 16.1 and in the docstring alike; none statable at the pins, each named in the docstring with what it lacks.
- Changes outside the folder: only the three files of the family index, the pull request's own, unchanged since `ab8344f`. The worker's automatic checks all passed at this head.
- Pull request text: the title (adds a roadmap) and each paragraph of the description were read against this head: a new folder of 346 lines with no declaration; positive dimension in 16.1 (a); the Conventions rule on targets without a locator; suppliers on main and in open pull requests as the README's supplier contracts give them.

Overlap check: read ChowFormsAndHeightsOfSubvarieties, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, SingularHermitianMetricsAndL2Methods, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, ArakelovGeometryAndAbelianHeights, HeightsRationalPointsAndObstructions as in the previous review (the change adds no object and no citation, and the overlap lists are the same); the height of the projective space of a Hermitian vector bundle: owner ChowFormsAndHeightsOfSubvarieties §6.2 (a7), cited here; regularisation and mixed measures of log-log weights: owner SingularHermitianMetricsAndL2Methods §§7.7–7.8, cited here; arithmetic intersection numbers on singular models: owner HeightsRationalPointsAndObstructions §5.17a, cited here; nothing owned twice.

Source independence: changed passages only: 3 passages compared with 0 sources (the Conventions sentence, the clause on shrinking `t₀` in 0.4 (c) and in the route of (b); none cites or paraphrases a source), none shared; largest share [FormalProof], 44 of 51 locators, whose text could not be read; the change adds, removes and reorders no layer, so the arrangement was not compared again: independent of the readable sources, not tested against [FormalProof].

Research link: Layer 4 extends Moriwaki's generalised Hodge index theorem (2009) and Zhang's theorem of successive minima (1995) to log-log singular metrics; Layer 16 complements Bost's linear slope bound (1996) using Moret-Bailly's key formula (1990); Layers 0, 14, 16 are inputs of Alpöge's formal proof (2026). Rests on the README and the sources read.

## Not verifiable

- [FormalProof]: none of the files named in the README could be read from a legal place; the forms recorded in 0.4 (c), 4.3a (b), (d), 4.3b, 14.1 (c), 14.2 (d) and 16.1 (b) were not compared with it. In particular, whether its (b1) is stated for `g ≥ 0` as line 183 records was not checked.
- 16.1 (a) with an absolute constant: the two questions of the previous review on step (3) of the route (the trivialisation behind the iterated derivatives, and the supremum bound with `O(g⁴)`) are untouched by this change and remain open; no written account exists to check them against.
- The index of the family at the sibling heads was read through the tool that prints an open roadmap at its head, as of the index of 2026-11-22; ownership against open pull requests was not searched again beyond the six roadmaps of the overlap line.

## Source issues

- none

## For the human reviewers

- Scope: 16.1 (a) is "not attributed to a published source" (README line 218); by Conventions (lines 22–24) 0.4 (a), (b), 14.1 (a), (b) and 14.2 (a)–(c) claim no source; the Announcement (lines 45–49) says no written account of the proof exists yet.
- Licence: the family index (lines 13–15) reports that the repository of [FormalProof] says the proof was published without a licence and is mirrored for verification only; this README names 38 of its file paths with declaration names.
- Licence: the Announcement is recorded as read from its author's own page (`alpo.ge`); please confirm the host.
- Not tested: [FormalProof] carries 44 of 51 locators and could not be read legally; its wording, its statements and its arrangement (including the origin of the ids 0.4, 4.3a, 4.3b, 14.1, 14.2, 16.1) were not compared.
