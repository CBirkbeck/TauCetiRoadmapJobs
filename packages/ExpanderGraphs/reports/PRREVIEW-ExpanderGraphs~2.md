# Review of ExpanderGraphs (pull request #3069 at d4bb48c)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 23 lines changed since `faf24d8` found the three small corrections and two format notes of the previous review all repaired, and no repair introduced a new problem. The changed numerical value, the new Summary sentence on the Margulis multigraphs and the new library and supplier sentences were each recomputed or opened at the pin. No finding, no small correction and no format note remains; one question about the numbering of [Ni] is still open. As before, the humans who approve should note that the source cited most (Davidoff–Sarnak–Valette) was not read.

## Questions for the author

- Are "Theorem 11.7, p. 116" and "Theorem 11.15, p. 118" of [Ni] (2.1, line 199, and the References, line 940) the numbers of the 2018 EMS edition? In the arXiv version (1609.08072v1), the only one that could be read, the bound `β ≥ λ₂/2` is Theorem 12.7 (p. 83) and `β ≤ √(2dλ₂)` is Theorem 12.15 (p. 85). The published book could not be opened, so its numbering was not checked.

## Previous findings

The previous review, of `faf24d8`, had no finding (R); its small corrections and format notes are accounted for here.

- C01 — repaired: "the latter is a target of FactorRigidity 3.2" (line 762); "Tau Ceti has Serre graphs and their trees" (line 805); "a target there; used in 8.2" (line 895).
- C02 — repaired: "the Margulis multigraphs on `ℤ/m × ℤ/m` have second eigenvalue at most `8 - ε` for one `ε > 0` and every `m`" (Summary, lines 32–33), which is what 8.2 states.
- C03 — repaired: "largest eigenvalues `2.6286`, `2.8040` and `2.8264`" (4.3, line 377).
- N01 — repaired: the section comment of `Suggested.lean` (line 611) reads "Layer 9: spectra of random graphs", as the README's heading (line 677).
- N02 — repaired: "Spielman states it for the sum of `k` random perfect matchings, a multigraph model [Sp, §43.2, p. 341]" (line 911).

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Summary, Margulis sentence, against 8.2 and `exists_pos_eigenvalues₀_margulis_le` | `m = 1, 2, 3, 4, 8, 16` with the four maps of `margulisMap` | every vertex has `8` incidences; second eigenvalues `3.4641, 4.4142, 5.4319, 6.9880, 7.5483`; `m = 1`: one vertex, Lean hypothesis `2 ≤ card` fails, vacuous | Summary now states 8.2 |
| 4.3 Check, balls in the `3`- and `4`-regular tree | radius `5, 20, 80`, radial tridiagonal quotient, Sturm bisection | `2.628596, 2.803970, 2.826449`; `3.183341, 3.431735, 3.461620` | `2.8264` correct |
| Scope sentence: tree of 4.1 for even `k` is the Cayley tree of the free group of rank `k/2` | `k = 0, 2, 4` | trivial group, one vertex; `ℤ`, bi-infinite path; `F₂`, degree `4` | true |
| Library and supplier claims of the repaired C01 | pinned Tau Ceti; FactorRigidity on main | `RelativePropertyT`, `HasAlmostInvariantVectors`: 0 files at the pin; Serre `IsTree` present; `relativePropertyT_inl_slTwo` is a `sorry` target of 3.2 | claims now true |
| Friedman bullet, [Sp, §43.2, p. 341] | Sp line 13113–13118; contents line 522 | section "43.2" starts on printed p. 341; sum of `d` random perfect matchings, possibly a multigraph | locator supports the new sentence |

The rows for the untouched statements stand as in the previous review, of `faf24d8`.

- Source locators checked against the text: 1 (Sp §43.2, Sp lines 522 and 13113–13118).
- Library declarations opened at the pin: `IsTree` for Serre graphs (`TauCeti/Combinatorics/Graph/Serre/Tree.lean:47`); a search of the pinned Tau Ceti for `RelativePropertyT`, `HasAlmostInvariantVectors` (no file) and for Cayley graphs (only Cayley–Dickson and Cayley–Hamilton files).
- Cross-roadmap citations resolved: FactorRigidity 3.1 and 3.2 on main (README lines 256 and 292–296; `relativePropertyT_inl_slTwo` at `TauCetiRoadmap/FactorRigidity/Suggested.lean:83`, with `sorry`); no cited id is found nowhere, and no open pull request drops an id this README cites.
- Dependency check: `depcheck: 129 roadmaps, 1437 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/ExpanderGraphs/Suggested.lean`: 26 `sorry` warnings, no error; the only Lean change is a section comment, so the signatures and the padding probe stand as in the previous review.
- Pull request text: title and description agree with this head (26 statements, three Tau Ceti imports, FactorRigidity 3.2 described as a target, no change outside the folder).
- Overlap check: read RamanujanGraphs, ExpanderWalksAndCodes, SpectralGraphBounds, GraphSymmetryAndCayleyGraphs, IharaZetaFunction, CoboundaryExpansion and KestenAmenabilityAndSpectralRadius (scopes read in the previous review; the change touches no ownership, and a search of the open heads and main for the isoperimetric constant and the Margulis graphs showed no other owner); `2`-lifts, tree numbers and bipartite Ramanujan graphs: RamanujanGraphs (cited); `IsRamanujan` and `iharaZeta`: IharaZetaFunction (cited); the regular tree as a graph, the Euler product, the isoperimetric constant of finite graphs, the Margulis multigraphs: this roadmap.

Source independence: changed passages only; 2 passages compared with 1 source (Sp), none shared; largest share DSV, 23 of 46 bracketed citations; contents of DSV not compared, since neither its text nor its contents page was read, and the change adds, removes and reorders no layer.

Research link: Layer 7 states the Lubotzky–Phillips–Sarnak graphs as in Davidoff–Sarnak–Valette (2003); Layer 3 uses the bipartite Ramanujan graphs of Marcus–Spielman–Srivastava; Layer 9 is Füredi–Komlós (1981), with Vu (2007), Friedman (2008) and Bordenave (2020) named as continuations. Rests on the README's references.

## Not verifiable

- [DSV], [KS], [Lu], [BH], [VM], Füredi–Komlós, Vu, Friedman, Bordenave: not read, as in the previous review; the change touches none of their locators except the Friedman bullet, whose [BH, §4.1, p. 67] locator for the uniform model stays unverified.
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
