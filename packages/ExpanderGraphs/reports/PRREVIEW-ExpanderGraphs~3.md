# Review of ExpanderGraphs (pull request #3069 at aa0742e)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 71 lines changed since `d4bb48c` found that the change only turns the names of six suppliers (GraphSpectra, SpectralGraphBounds, LaplacianEigenvaluesOfGraphs, KernelsAndSpectralMethods, IharaZetaFunction, MatchingPolynomial) into links, in the Summary, the scope list and the supplier contracts; no statement, section number or Lean declaration changed. All six are on main, each cited section exists there under the cited number, and the fourteen definitions said to be copied from them agree with their files on main. There is no finding, no small correction and no format note; one question about the numbering of [Ni] stays open, and the humans who approve should note, as before, that the source cited most (Davidoff–Sarnak–Valette) was not read.

## Questions for the author

- Are "Theorem 11.7, p. 116" and "Theorem 11.15, p. 118" of [Ni] (2.1 and the References) the numbers of the 2018 EMS edition? In the arXiv version (1609.08072v1), the only one that could be read, the bound `β ≥ λ₂/2` is Theorem 12.7 (p. 83) and `β ≤ √(2dλ₂)` is Theorem 12.15 (p. 85). The published book could not be opened, so its numbering was not checked. (Carried from the previous review; the change does not touch it.)

## Previous findings

The previous review, of `d4bb48c`, had no finding, no small correction and no format note; there is nothing to account for. Its open question is carried above.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Supplier contract, GraphSpectra 1.2 (changed line): for `k`-regular `G`, `ν_{i+1} = k - θ_{n-i}`, so `ν_{n-1} = k - θ₂` | `K₂`, `K₃`, `C₄` | `K₂`: θ = (1, −1), ν = (2, 0), `ν₁ = 1 − (−1) = 2`; `K₃`: θ = (2, −1, −1), ν = (3, 3, 0), `ν₂ = 2 + 1 = 3`; `C₄`: θ = (2, 0, 0, −2), ν = (4, 2, 2, 0), `ν₃ = 2 − 0 = 2` | true; agrees with GraphSpectra 1.2 on main (README line 178) |
| Supplier contract, LaplacianEigenvaluesOfGraphs 1.1 (changed line): `algebraicConnectivity` is the value at index `n - 2` for `n ≥ 2`, `0` otherwise | `K₁`, `K₂`, `K₃` | `n = 1`: `0`; `K₂`: index `0` of (2, 0) is `2 = ν₁`; `K₃`: index `1` of (3, 3, 0) is `3 = ν₂` | index `n − 2` (from `0`) is `ν_{n-1}`; definition identical to the one on main |
| "copied verbatim into `Suggested.lean`" (changed lines for SpectralGraphBounds, LaplacianEigenvaluesOfGraphs, KernelsAndSpectralMethods, IharaZetaFunction, MatchingPolynomial) | the 14 definitions named, each against the supplier's `Suggested.lean` on main | 14 of 14 bodies identical up to whitespace | true |
| The new links | each `../<Name>/README.md` target, at this head and on main | 15 distinct targets; 9 present at the head; the 6 new ones are absent from the branch (it predates them) and present on main | resolve once merged |

The rows for the untouched statements stand as in the previous review, of `d4bb48c`. No target of the seeded sample falls in a changed passage.

- Source locators checked against the text: 0 (the change adds or alters no locator).
- Library declarations opened at the pin: none new; the change names no library declaration.
- Cross-roadmap citations resolved: on main, GraphSpectra 1.2 and 3.2 (README lines 169, 654), SpectralGraphBounds 1.1 (75), LaplacianEigenvaluesOfGraphs 1.1 (67), KernelsAndSpectralMethods 1.1, 2.2, 3.1, 3.2 (90, 210, 279, 287), IharaZetaFunction 1.2, 2.1, 5.3 (109, 159, 431), MatchingPolynomial 2.1 (135); at their open heads, GraphSymmetryAndCayleyGraphs 3.1, LaplacianSpectraAndSpanningTrees 6.4, RamanujanGraphs 3.1, 3.3, 5.1. No cited id is found nowhere and no open pull request drops one.
- Dependency check: `depcheck: 101 roadmaps, 1130 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/ExpanderGraphs/Suggested.lean`: 26 `sorry` warnings, no error. The file is unchanged since `d4bb48c`, so the signature comparison and the padding probe stand as in the earlier reviews.
- Pull request text: title and description agree with this head (26 statements, three Tau Ceti imports; the nine suppliers listed as on main are on main, the three listed as open are open as #3060, #3063, #3018; no change outside the folder).
- Overlap check: read RamanujanGraphs, ExpanderWalksAndCodes, GraphSymmetryAndCayleyGraphs, LaplacianSpectraAndSpanningTrees, SpectralGraphBounds, IharaZetaFunction and MatchingPolynomial (scopes read in the earlier reviews; the change touches no ownership); `2`-lifts, tree numbers and bipartite Ramanujan graphs: RamanujanGraphs (cited); `IsRamanujan` and `iharaZeta`: IharaZetaFunction (cited); Cayley graphs: GraphSymmetryAndCayleyGraphs (cited); the isoperimetric constant of finite graphs, the regular tree as a graph, the Euler product, the Margulis multigraphs: this roadmap.

Source independence: changed passages only; 0 passages compared with 0 sources, since the change adds link markup and no prose; largest share DSV, 23 of 46 bracketed citations; contents of DSV not compared, since neither its text nor its contents page was read, and the change adds, removes and reorders no layer.

Research link: Layer 7 states the Lubotzky–Phillips–Sarnak graphs as in Davidoff–Sarnak–Valette (2003); Layer 3 uses the bipartite Ramanujan graphs of Marcus–Spielman–Srivastava; Layer 9 is Füredi–Komlós (1981), with Vu (2007), Friedman (2008) and Bordenave (2020) named as continuations. Rests on the README's references.

## Not verifiable

- [DSV], [KS], [Lu], [BH], [VM], Füredi–Komlós, Vu, Friedman, Bordenave: not read, as in the earlier reviews; the change touches none of their locators.
- [Ni] page and theorem numbers of the 2018 edition: only the arXiv version was read (see the question).
- Ownership against open pull requests was checked through the roadmap search over the open heads and main, not against every sibling checkout.

Automatic checks set aside as false positives: the heading "Library declarations consumed" at the end of `Suggested.lean` was reported as a section heading with no declaration under it; it is followed by `#check` lines that pin library declarations, which the form rules allow.

## Source issues

- none

## For the human reviewers

- Not tested: [DSV], the source with the largest share of the locators (23 of 46), could not be read, nor its contents page; wording and arrangement were not compared with it.
- Licence: [Sp] is an unpublished author's manuscript (2025) on the author's own page, cited in 5.2 and under "Beyond this roadmap".
- Licence: copies of [BH] and [Lu] exist on pages that appear to be an author's own, but the host could not be classified, so they were not read.
- Sources: five of the seven books were unread; twelve of fifteen sampled targets were checked by computation only, not against their locators.
