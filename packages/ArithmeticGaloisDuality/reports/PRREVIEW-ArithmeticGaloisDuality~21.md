# Review of ArithmeticGaloisDuality (pull request #3177 at 5d66223)

**Verdict:** accepted

**Summary.** An incremental re-review of the one line changed since `5a08539`: the Dependencies list of Layer R02.5 now names ProfiniteCohomology Layer 2, which the corollary *Cocycle form* of §R02.5.1 consumes. The line is correct, and the corollary was recomputed against ProfiniteCohomology §2.1 as this head rewords it; the counts and the Check at `F = ℚ`, `M = 𝔽_p` still come out equal. Accepted with no finding, no small correction and no format note; nothing is left for a human to decide.

## Previous findings

- The previous review (of `5a08539`) had no finding and no small correction.
- N01 (format note) — repaired: the Dependencies list of Layer R02.5 (line 6407) now reads "TauCetiRoadmap ProfiniteCohomology: Layer 2", matching the *Needs:* line of *Cocycle form* (line 6252).

## Verified sound

| Statement | Instance | Computed: one side | Computed: other side | Result |
|---|---|---|---|---|
| Layer R02.5 Dependencies, the added line | every *Needs:* of §R02.5.1 naming ProfiniteCohomology | *Cocycle form* needs ProfiniteCohomology §2.1 (line 6252) | §2.1 lies in "Layer 2: the explicit low-degree complex" of ProfiniteCohomology at this head | the line names the right layer |
| *Cocycle form*, the two counts, against §2.1 as reworded (`π` any additive map with kernel `B¹`) | `W = 𝓛_v ⊇ B¹`, `π` the class map, `π(W) = L_v` | `#𝓛_v = #L_v · #B¹(G_v, M)`, `#B¹ = #M / #H⁰` | §2.1: `card W = card π(W) · card B¹` when `B¹ ≤ W`; `card B¹ · card H⁰ = card M` | agree; the rewording changes nothing the corollary uses |
| §2.1 Check cited through the corollary | `C₂` by sign on `ℤ/3`, `W = B¹` | `Z¹ = B¹`, 3 elements; `H⁰ = 0`, `H¹ = 0` | `3 = 1 · 3`; `3 · 1 = 1 · 3` | holds |
| First Check of *Cocycle form* | `F = ℚ`, `M = 𝔽_p`, `p` odd, `L_v` unramified, `L_∞ = 0` | `#Z¹_L = 1` (trivial action, `H¹_L = 0`); `#Z¹_{L^⊥} = #B¹(G_ℚ, μ_p) = p/1 = p`; left `1/p` | finite `v`: `#𝓛_v = p · p/p = p`, factor `1`; `∞`: `#𝓛_∞ = 1`, factor `1/p` | `1/p = 1/p` |

The rows for the untouched statements stand as in the previous review, of `5a08539`.

- Source locators checked against the text: 0; the changed line cites no source, and no target of the seeded sample falls in it.
- Library declarations opened at the pin: `TauCeti.ContCohomology.explicitH1AddEquivContinuousCohomology` (`TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologyComparison.lean:44`), named by the reworded §2.1 target.
- Cross-roadmap citations resolved at this head: ProfiniteCohomology Layer 2 and §2.1 *Cocycle counts from class counts*; ProfiniteCohomology Conventions *Coefficient rings* and *Counting* (both still present under those names).
- Record of layers: 8 layers at the merge base, the same 8 ids and titles at the head; no heading removed or added; `Suggested.lean` unchanged.
- Changes outside the folder: only the pull request's own folders ClassFieldTheory, ProfiniteCohomology and SelmerIwasawaCohomology.
- Pull request text: the title and description still describe the change to this folder (the corollary, its Check, the two cited conventions, no `Suggested.lean` change); the added Dependencies line needs no mention.
- Dependency check: `depcheck: 94 roadmaps, 1066 edges, 0 problem(s)`; no UPWARD or CYCLE line. Automatic checks: every check of the worker's run passed.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ArithmeticGaloisDuality/Suggested.lean` gives 12 `sorry` warnings and no other message. The file is unchanged, so no one-tactic probe and no `#check` comparison was run again.

Overlap check: the scopes read in the previous review (SelmerIwasawaCohomology, NoncommutativeAndEquivariantIwasawa, EulerSystemsAndKolyvaginSystems, GlobalGaloisDeformationsPartII, CohomologyOfGroups, ShortGRH) were not read again, since the change is one Dependencies line that states no object; nothing shared. No id is dropped on either side. Two other open pull requests change this roadmap (#3027, adding §D7.6a, and #3184, on §D7.3); both merge cleanly with this one and neither touches Layer R02.5.

Source independence: 1 passage compared (changed passages only) with 0 sources, none shared: the added line is a supplier citation and cites no source; largest share MilneADT, at least 45 of the README's locators; contents not compared, since the change adds, removes and reorders no layer.

Research link: The Greenberg–Wiles formula (Darmon–Diamond–Taylor, Theorems 2.18–2.19) is the Selmer-group count behind Taylor–Wiles and Khare–Wintenberger patching, derived from Poitou–Tate duality (Milne 2006; Lim 2012); the added corollary restates it for cocycles. Rests on the README's summary and §R02.5.1.

## Not verifiable

- Darmon–Diamond–Taylor, Theorems 2.18 and 2.19, the source of the untouched formula the corollary is derived from: not opened this round; the corollary was checked against the formula as the README states it and against its computed Checks.

## Source issues

- none

## For the human reviewers

- none
