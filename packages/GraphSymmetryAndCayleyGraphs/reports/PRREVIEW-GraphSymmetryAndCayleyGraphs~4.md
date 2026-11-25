# Review of GraphSymmetryAndCayleyGraphs (pull request #3060 at 40bdeda)

**Verdict:** needs changes

**Summary.** Both findings of the previous review are repaired: Weiss's theorem is now stated correctly, and the spectral characterizations of walk-regularity are recorded in prose with SpectralQuantumWalks Layer 1 named as the owner of cospectrality. One finding remains, introduced by the repair: the README now reproduces two sentences of its sources in quotation marks (Godsil–Royle in 7.1, Godsil in 2.2), which a roadmap may not do; each is replaced by a clause in the roadmap's own words. There is one small correction (the description lists two suppliers as open that are on main) and one format note, neither blocking. No source text could be read, so the two locators the repair adds are left to the human reviewers.

## R01 (P2) — Two sentences of the sources are reproduced in quotation marks in the README (7.1 and 2.2)

A roadmap is published under the project's licence and states its sources' results in its own words with locators; it carries no passage of a source, attributed or not. The repair of this round added two.

In 7.1, under Monotonicity (README lines 703–704), a sentence of 22 words is given in quotation marks as the text of [GR, §4.1, p. 59], beginning "If s ≥ 1, then it is both obvious and easy to prove …". In 2.2 (README line 304) a sentence of 14 words is given in quotation marks as the definition in [G, Chapter 5, §3, p. 81], beginning "A graph G is walk-regular if …". Neither book could be read this round, so the witness is the README itself, which presents both as the sources' sentences. The first is expository prose, not a formula; the second repeats what the sentence before it already says in the roadmap's words.

Smallest change. In 7.1: "[GR, §4.1, p. 59] asserts this for every `s ≥ 1` with no degree condition and without proof, for the definition used here, transitivity on `s`-arcs; for it the condition is needed (Checks)." In 2.2: end the sentence at the locator ("This is the definition of walk-regularity in [G, Chapter 5, §3, p. 81].") and delete the quoted sentence. The mathematics around both stays as it is.

## C01 — The description lists SpectralGraphBounds and TopologicalCombinatorics under "Open PRs"; both are on main

Under "Suppliers, by section" the description has "Open PRs: … #2722 SpectralGraphBounds 1.1 (`adjEigenvalues`). #2872 TopologicalCombinatorics 3.1 (Kneser graphs)." Both roadmaps are on the main branch (the generated dependency block below already shows them ticked), so the only supplier still open is GraphSpectra. Would read correctly with the two lines moved under "On main" and cited by roadmap and section. The rest of the description agrees with this head: 37 `sorry` statements, three proved sanity checks, 14 own and 6 copied definitions, and the SpectralQuantumWalks boundary paragraph.

## N01 — After the three characterizations left the targets, two `*Needs:*` lines keep inputs that only the prose facts use: `Matrix.charpoly_map` in 2.2 (the transfer from `ℝ` to `ℤ`) and 1.1 in 2.3 (vertex-transitivity). Dropping them, or saying they serve the recorded facts, keeps an implementer of the targets from waiting on them.

## Previous findings

- R01 — repaired: "A finite connected graph of minimum degree at least `3` is not `8`-arc-transitive, and if it is `s`-arc-transitive but not `(s + 1)`-arc-transitive then `s ≤ 5` or `s = 7`".
- R02 — repaired: 2.1–2.3 mark the three statements "Not a target here"; scope: "cospectral vertices, their formulations … and the cospectrality of vertices in one automorphism orbit: SpectralQuantumWalks, Layer 1"; the three Lean statements are gone. The repair introduced R01 above.
- C01 — repaired: "every automorphism of the line graph of a connected graph comes from exactly one automorphism of the graph".
- N01 — repaired: the docstring of `exists_isMatching_verts_eq_compl_singleton` now cites "§3.5, the remark before Theorem 3.5.1", as README 6.2 does.
- The two questions of the previous review are answered in the text of 2.1, 2.2 and 7.1 (Godsil defines walk-regularity by the vertex-deleted polynomials; Godsil–Royle state monotonicity with no degree condition); the answers could not be checked against the books.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.1 `Aʰ = ∑ θʰ P_θ` (now in the Summary) | `P₃`, `h = 2`; `K₂`, `h = 0, 1` | `P₃` end: `2·¼ + 0·½ + 2·¼ = 1` = degree; middle: `2·½ + 2·½ = 2`; `K₂`: `P₁ + P₋₁ = I`, `P₁ − P₋₁ = A` | holds | none |
| 2.2 vertex-deleted formula (now in the Summary) | `P₃`, end and middle | end: `t(t²−2)·(t²−1)/(t(t²−2)) = t²−1 = p_{K₂}`; middle: `t(t²−2)·t/(t²−2) = t² = p_{2K₁}` | holds off the spectrum | none |
| 2.3 walk-regular ⇒ regular; triangles at `h = 3` | `K₃`, `K₄`, `K_{1,3}` | `(A³)_{xx}`: `2 = 2·1`; `6 = 2·3`; `K_{1,3}`: `(A²)_{xx}` is `3` and `1`, not walk-regular | holds | N01 |
| 2.1, 2.2 recorded equivalences (not targets) | `P₃`; `K₂` | `P₀` diagonal `(½, 0, ½)`; deleted polynomials `t²−1`, `t²`; closed walks of length 2: `1`, `2`; `K₂`: all constant | consistent | R01 (quotation only) |
| 2.3 Check, degrees | `C₅`, `K₄`, Petersen, `Q₃` | `2`, `3 = n − 1`, `3`, `3` | true | none |
| 7.1 monotonicity, both definitions | `K_{1,3}`; `nK₂`; edgeless | first: six 2-arcs in one orbit, two orbits of 1-arcs, fails without degree ≥ 2; second: `K_{1,3}` not vertex-transitive; `nK₂`: no 2-arcs, one 1-arc per vertex, holds | both claims true | R01 (quotation only) |
| Weiss's theorem (closing section) | generalized hexagon with duality; Tutte 8-cage; Heawood | maximal `s`: `7`; `5`; `4`; each is `≤ 5` or `= 7`; agrees with 7.2 (`s ≤ 5` cubic) | consistent | none |
| Summary, Whitney's automorphism theorem | `2K₂` | `8` automorphisms against `2` for `2K₁`; excluded by "connected" | holds | none |

The rows of the previous review for the untouched statements stand as in that review, of `fbfdff8`.

- Source locators checked against the text: 0 (no cited text is readable; Godsil–Royle and Brouwer–Haemers are recorded as paywalled). The repair adds one locator, [GR, §4.1, p. 60], and moves [G, Chapter 5, §3, p. 81] from the closed-walk definition to the polynomial one.
- Cross-roadmap citations resolved: SpectralQuantumWalks Layer 1 at its open head (README lines 105–114: local multiplicities `(E_λ)_{u,u}`, cospectral vertices with deleted-characteristic-polynomial and closed-walk formulations, automorphism orbits imply cospectrality). No other roadmap, open or on main, mentions walk-regularity or cites 2.1–2.3 of this one; ExpanderGraphs, CocliquesColouringsAndTheta and DistanceRegularGraphsCodesAndPolygons cite 1.1, 1.3, 3.1, 4.1 and Layer 7, all unchanged.
- The three removed Lean names occur nowhere in the README or the Lean file.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 37 `sorry` warnings and no other warning or error. No statement was changed, so no new one-tactic probe; 60 declarations = 37 + 3 proved + 20 definitions.
- Dependency check output: `depcheck: 124 roadmaps, 1404 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing outside the roadmap folder is changed.
- Overlap check: read SpectralQuantumWalks (the changed passages concern it alone), and the unchanged lists CocliquesColouringsAndTheta, GraphSpectra, DistanceRegularGraphsCodesAndPolygons, ExpanderGraphs, StronglyRegularGraphsAndDesigns as cited above; cospectral vertices and their three formulations: SpectralQuantumWalks, cited here; walk-regularity, its regularity, the power expansion and the vertex-deleted formula: this roadmap; nothing else shared.

Source independence: changed passages only: 6 changed passages read, 2 of them quotations presented as the sources' sentences (R01), compared with 0 sources (no cited text readable); largest share Godsil–Royle, 30 of 59 locator brackets, text and contents not readable; no layer added, removed or reordered, arrangement not compared again.

Research link: Layer 5 states the Cayley-spectrum formulas (Brouwer–Haemers 2012, Krebs–Shaheen 2011) that the open ExpanderGraphs roadmap builds on; Layer 7 is Tutte 1947, the cubic case of Weiss 1981; 6.3 is Babai 1979; 9.2 is Erdős–Rényi 1963. Rests on the README (References, Downstream consumers, Beyond this roadmap) only.

## Not verifiable

- [GR, §4.1, pp. 59–60]: that the book asserts monotonicity with no degree condition, and that it gives a second definition through vertex stabilizers on p. 60. Springer, paywalled. If the first is as the README says, it is an entry for the errata register, which this review cannot make without the text.
- [G, Chapter 5, §3, p. 81]: that Godsil defines walk-regularity by the vertex-deleted characteristic polynomials and derives the closed-walk property. No legal copy.
- All other locators: as in the previous review.

Automatic checks set aside as false positives: the section comment "Library declarations consumed" at the end of `Suggested.lean` was reported as a header with no declaration under it; it is followed by `#check` lines pinning library declarations, which the form rules allow.

## Source issues

- none

## For the human reviewers

- Not tested: Godsil–Royle carries 30 of the 59 locator brackets (README References); neither its text nor its contents page, nor any other cited source, could be read, so wording and arrangement were not compared with a source.
- Licence: the sources service recorded Brouwer–Haemers and Godsil–Royle as paywalled and uncertified; the copy of Brouwer–Haemers on its first author's page was refused by the service as not shown to be an author's page.
