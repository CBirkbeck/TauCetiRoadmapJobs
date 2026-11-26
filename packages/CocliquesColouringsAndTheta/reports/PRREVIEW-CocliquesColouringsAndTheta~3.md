# Review of CocliquesColouringsAndTheta (pull request #3068 at db42b12)

**Verdict:** accepted

**Summary.** Accepted: the 106 changed lines add links to the supplier roadmaps that are on main and write `SimpleGraph` without `_root_.` in the two local Kneser-graph definitions; no statement changes, every link target exists on main, and the file elaborates as before. One small correction is carried over (two Brouwer–Haemers locators, unchanged, read again in this round), not blocking, and there are no format notes. The locators into Godsil–Royle, Biggs and Knauer–Knauer remain unchecked against the texts, which is left to the human reviewers.

## C01 — Two Brouwer–Haemers locators still do not match the edition the References name

This is C01 of the two previous reviews; the passages are unchanged at this head: "[BH, Theorem 3.5.5a, p. 40]" in 1.1 (README line 126, and the docstring at `Suggested.lean` line 233), and "[BH, Proposition 3.7.5, p. 45]" in 6.1 (README line 526). The References give the 2012 Springer edition, so a reader looks there for both.

Read again in this round, in the two versions on Brouwer's own pages. In the 2011 proof of the book, whose pages agree with the printed ones in Chapter 3, p. 40 carries Theorem 3.5.5 followed by no 3.5.5a (BH proof copy line 2011); Theorem 3.5.5a exists only in the authors' later online version, on its p. 48 (BH online version line 2119). Proposition 3.7.5 is stated at the foot of p. 44 and its proof, with the remarks on edge-transitive and strongly regular graphs, is on p. 45 (BH proof copy lines 2213–2227). The printed Springer volume itself was not read. Cite the online version for 3.5.5a, and write "pp. 44–45" for Proposition 3.7.5; the two "[BH, p. 45]" for the equality remarks are right.

## Previous findings

- C01 — not repaired: "[BH, Theorem 3.5.5a, p. 40]" and "[BH, Proposition 3.7.5, p. 45]" stand as before; carried as C01 above. (The previous report had no finding R01, R02, …; its only remark was this correction.)

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Local copies `kneserGraphOf`, `kneserGraph` (type now written `SimpleGraph`) | elaborated types; text against TopologicalCombinatorics on main; `K(5,2)`; `K(3,2)`; `k = 0` | `SimpleGraph ↑𝓕` and `SimpleGraph ↑{s \| #s = k}`, the root structure; identical to main's lines 119–127; 10 vertices, degree 3; no edge; one vertex, no loop | same object as before, now a verbatim copy | none |
| Supplier contract, TopologicalCombinatorics 3.1 (cited by the changed text) | `v = 5, k = 2`; `v = 3, k = 2`; `k = 0` | degree `C(3,2) = 3` = Petersen; two 2-subsets of a 3-set meet, no edge; `k ≥ 1` is asked on both sides | agrees with 3.1 on main | none |
| Supplier contract, AssociationSchemes 5.2 (cited by the changed text) | `n = 5, k = 2`; `n = 4, k = 2` | star has `C(4,1) = 4 = α` of Petersen; `{12, 13, 23}` has `3 = C(3,1)` members and is no star, excluded by `2k < n` | agrees with 5.2 on main | none |
| Supplier contract, StronglyRegularAndMooreGraphs 1.2 | Petersen `(10, 3, 0, 1)`; `K₄` | spectrum `{3, 1, −2}`, `−2 < 1 < 3`; `K₄` has two eigenvalues, excluded by "not complete" (`G ≠ ⊤` on main) | agrees with 1.2 on main | none |

The rows for the statements the change does not touch stand as in the previous review, of `24091c9`.

- Source locators checked against the text in this round: 3 (Theorem 3.5.5, Theorem 3.5.5a, Proposition 3.7.5 with the two remarks after it), in two versions of Brouwer–Haemers; the seeded sample falls in no changed passage.
- Links: the ten distinct relative links (`../<Name>/README.md`) all resolve to a README on main; the roadmaps left unlinked (GraphSymmetryAndCayleyGraphs, TuttePolynomialAndArrangements, AsymptoticSpectra, DelsarteTheoryOfCodesAndDesigns, PaleyGraphsAndCharacterSums, EquitableOperatorReduction) are not on main.
- Cross-roadmap citations resolved on main: every section id of the changed passages exists with the cited subject (GraphSpectra 1.2, 1.7, 2.4, 2.6, 3.4; SpectralGraphBounds 1.1, 1.2, 2.1, 3.1, 3.2; GraphColouring 1.1, 2.1, 2.2; LovaszThetaFunction 1.1, 1.3, 2.1, 3.1, 4.1, 4.2, 4.3, 5.1; TopologicalCombinatorics 3.1, 3.3; AssociationSchemes 4.2, 5.1, 5.2; StronglyRegularAndMooreGraphs 1.1, 1.2); five were opened and read.
- Dependency check: `depcheck: 101 roadmaps, 1129 edges, 0 problem(s)`; no upward or cyclic edge. No file changed outside the folder.
- Automatic checks: all passed at this head. Elaboration: `Suggested.lean` elaborates with 32 `sorry` warnings, the `#check` output of the pinned declarations and nothing else; no `set_option`; the elaborated types of the two touched definitions were compared with the README and with the supplier.
- Padding and headlines: the diff changes no theorem; nothing to probe.
- Pull request text: title and description agree with this head (32 headlines, 11 definitions, the suppliers on main and the three open ones); the change of this round needs no statement there.
- Overlap check: read LovaszThetaFunction, SpectralGraphBounds, GraphSpectra, AssociationSchemes, GraphSymmetryAndCayleyGraphs (scope sections, as in the previous reviews; the change adds no object); the fractional cover number with attainment and duality is owned by AsymptoticSpectra 2.3 and cited from here; nothing else shared.

Source independence: changed passages only; the diff adds link markup and no prose; 2 passages compared with 1 source (the two items of 6.1 beside Brouwer–Haemers §3.7, proof copy lines 2213–2227), none shared beyond the formula and a three-word standard phrase; largest share Godsil–Royle, 28 of 60 locators, text and contents not readable; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: the theta function and Haemers' bound are the two standard upper bounds on the Shannon capacity (Lovász 1979, Haemers 1979, as Brouwer–Haemers §3.7 give them); cores, fractional colourings and Kneser graphs are Godsil–Royle Chapters 6–7 (2001). Rests on the README's sources and the Brouwer–Haemers text.

## Not verifiable

- Godsil–Royle, *Algebraic Graph Theory* (28 locators: 1.2, Layers 4, 5 and 7): a Springer book with no open copy; the statements were checked as mathematics by the earlier reviews, the theorem numbers and pages were not.
- Biggs, *Algebraic Graph Theory*, 2nd ed. (14 locators, Layer 3): no open copy.
- Knauer–Knauer, *Algebraic Graph Theory*, 2nd ed. (2 locators, 4.3): no open copy.
- Brouwer–Haemers, *Spectra of Graphs*, the printed 2012 volume: read only through the authors' 2011 proof and their later online version.

## Source issues

- none

## For the human reviewers

- **Not tested.** Godsil–Royle carries the largest share of the locators (28 of 60) and its text and table of contents could not be read: the wording and arrangement checks were not made against it, nor against Biggs or Knauer–Knauer.
- **Scope.** `Suggested.lean` carries verbatim local copies of 16 definitions and instances of seven supplier roadmaps (lines 44–209), three of them still open pull requests, as the sibling spectral-graph roadmaps do; whether that practice is accepted is yours to decide.
