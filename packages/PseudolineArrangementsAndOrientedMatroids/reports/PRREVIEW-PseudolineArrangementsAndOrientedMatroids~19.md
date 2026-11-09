# Review of PseudolineArrangementsAndOrientedMatroids (pull request #1523 at 0661565)

**Verdict:** accepted

Incremental re-review of the 7 lines of `TauCetiRoadmap/PseudolineArrangementsAndOrientedMatroids/README.md` changed since d0c914d (5 insertions, 2 deletions; `Suggested.lean` byte-identical). The one finding of the previous report is repaired, the repair introduces no new problem, and no finding remains.

## Previous findings

- R01 — repaired: README lines 1790–1793 read "A. Grothendieck, *Systèmes de pseudo-droites : notes manuscrites*, undated (from 1981), unpublished manuscript, 72 pp., Fonds Alexandre Grothendieck, Université de Montpellier, folder 80"; the Research context (line 1711) now ends "see References". The entry was checked against the scan (below).

## Verified sound

### The changed passage, against the source

The folder-80 scan was fetched through the sources service from the Montpellier archive (institutional copy, sha256 `c3cc8767…`, 73 PDF pages: a cover and 72 numbered leaves) and its pages rendered and read as images. PDF page `k + 1` carries printed page `k`; the README's pages are the printed ones.

| Claim of the new entry | What the scan shows | Result |
|---|---|---|
| Title, "undated (from 1981)", 72 pp., folder 80 | Cover: the series title on combinatorial geometry and topology, the subtitle on systems of pseudolines as manuscript notes with no date, shelf mark 80, 72 pages, bracketed date "from 1981" | ✓ |
| pp. 20, 22 and 24: the classification of 3.8 (b) | p. 20: four drawings (4 lines in general position; 5 in general position; 5 in special position, three through one point and two through another; the 6-line complete quadrangle) and the statement that an arrangement without bigonal pseudoline that is not the first contains one of the other three. p. 22: the case list by whether a bigonal pseudoline exists (pencil plus a line, two pencils plus the line through their centres; without one: two pencils `p ≥ q ≥ 2`, simple arrangements of 4 and of 5). p. 24: the theorem that outside those families, with no 5 lines in general position, the arrangement is the complete quadrangle or the quadrangle with a diagonal; and that an arrangement without bigonal line is the 4-line type or contains one of three types (3+2, 5 general, quadrangle) | ✓ agrees with 3.8 (b): four elements, or one of five in general position, three-plus-two, a complete quadrangle |
| p. 28: the listing of 3.8 (c) | p. 28: a lemma for `N ≥ 5` pseudolines with no bigonal one: they can be numbered `D₁, …, D_N` so that `D₁..D₄` is of the 4-line general type (or `D₁..D₆` the quadrangle) and each later `Dᵢ` is not bigonal in the arrangement of the first `i` | ✓ agrees with 3.8 (c) (`m = 4` or `m = 6`, no bigonal element in each initial restriction) |

Nothing else in the README cites the notes (`grep 'folder 80\|80.pdf'`: lines 1711 and 1791–1792 only). The notes are cited for attribution in the Research context; no target takes its proof from them (3.8 (b) and (c) carry their own routes), so the handwritten source bears no statement of the roadmap.

### Gate, order and Lean

- **Gate.** The worker's gate on this head: every counter 0, `build=0`, OK. Run again by me with the brief's command: every counter 0 except `depcheck=1`, whose line is "NOT IN ORDER: PseudolineArrangementsAndOrientedMatroids (insert it after its last supplier)", which is not a defect before placement.
- **Dependency check** against the candidate order with `--movable`: `depcheck: 236 roadmaps, 2263 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Outside the folder:** `git diff --stat origin/main...HEAD` outside the roadmap folder is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with 51 warnings, all "declaration uses `sorry`", no error. The file is unchanged since d0c914d (`git diff d0c914d..HEAD` on it is empty), so the previous report's signature comparison (0 lost binders) and one-tactic probe (51 errors on 51 theorems, none closes) stand.
- **Headlines:** the diff touches no statement; the list of the earlier reports stands.

### Cross-roadmap citations (main at 3090489)

- RootSystems §1.3: `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md` line 515, `geometric_faithfulness` at its `Suggested.lean` line 73.
- GraphConnectivityAndFlows Target 1.1: its README lines 34, 162 and 224.
- Overlaps: no open pull request changes this roadmap and no id is dropped in either direction; the closest open roadmap in vocabulary is SurfaceTopology, which is not cited as a supplier.

### Adversarial table

The diff changes no statement, Check or convention; the one changed passage is a bibliographic entry, whose row gives what was read. The other rows carry the previous report's values (review at d0c914d), which themselves carry those of the report at 17149ad where marked.

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| References entry for folder 80, and 3.8 (b), (c) as attributed | the scan's cover and printed pp. 20, 22, 24, 28 | 72 pages and "from 1981" on the cover; p. 20 four configurations (4; 5 general; 3+2; quadrangle); p. 28 numbering with initial segment of 4 or 6 lines | entry and attribution correct | none |
| 3.8 (a)–(c) | previous report | Melchior `Σ(3 − ν(v)) ≥ 3`; quadrangle: 6 elements, 4 triple points, 3 double points, each element on 3 vertices | true | none |
| 4.5 `isChirotope_flipFun`, `exists_triangle_of_flipFun` | previous report: alternating chirotope on 5; near-pencil | 22 topes, 5 triangles, 0 violations at triangles and 48 at each other triple; near-pencil flip equals `χ`, no tope with walls `{e₁, e₂, e₁ + e₂}` | true | none |
| 3.4 `chiFun_ofLines` | previous report: 2000 random integer instances | determinant equals `(aᵢ − aⱼ)(aⱼ − aₖ)(crossX j k − crossX i j)` exactly; with `(0,0,1)` it is `aᵢ − aⱼ` | true | none |
| 3.5 (i), (ii) | previous report: `n = 0, 1` | (ii): one cell, resp. two half-planes and a graph, all path-connected; (i): covector set `{0}`, right side empty, so `n ≥ 2` needed | true | none |
| 5.3 `levi_enlargement`, 5.4 route | previous report | parallel extension contains `(Y, 0)`, `(Z, 0)`; four generic positions `e₁ + ε(±e₂ ± e₃)` | true | none |
| 1.3, 8.4 (ii) | previous report | `(1,0,0), (2,0,0)` span rank 1: not simple, no loop; (N1), (N2) hold for loopless without parallel pairs | true | none |
| 0.3, 0.4 | previous report | projective plane, one dart: 1 orbit; 4 flags lift to two residues | true | none |
| 1.1, 1.2, 1.4, 1.5, 1.6 | previous report | rank 0 gives `±1`; `1, 1, 1` fails the three-term relation; 0 violations in 468750 instances; dual values `1, −1, 1`; `−χ` for odd rank | true | none |
| 2.2, 2.3, 2.7 | previous report | 6 cocircuits, 13 covectors; 20 and 83; wall counts `{3: 10, 4: 10, 5: 2}` on 22 topes | true | none |
| 3.3, 3.6 | previous report | `sign(2 − 1) = 1`; `R = {none}` for the negative chirotope | true | none |
| 4.1–4.4 | previous report | 2, 16, 768 reduced words give 2, 8, 62 signotopes | true | none |
| 5.2, 5.5, 6.1, 6.3, 6.4 | previous report | `n = 3, e = id, R = ∅`; shear to `p = −1`; `det C = 0` against `1` at `(6,7,8)`; sharp at 9 elements | true | none |
| 7.2–7.5, 8.1–8.3 | previous report | `p i = 0` gives no relation; `2 = 2`, `2 < 3`; 4 vertices of the tetrahedron; `adj 0 · adj 1 = adj 2` on the projective plane | true | none |
| 9.1–9.6, 10.2 | previous report | 24/24, 48/24; `H₃`: length 15, `120/2 = 60`, `(6, 15, 10)`; `{3,6}` at `n = 2..6`: 24, 108, 192, 300, 432; `orderOf = M i j` | true | none |

The seeded sample (0.2, 1.2, 2.3, 4.1, 4.2, 5.2, 5.3, 6.3, 7.3, 7.4, 8.1, 8.2, 8.3, 9.6, 10.2) falls entirely in untouched text; its locators were read in the earlier reports (Felsner–Goodman Theorems 5.1.1 and 5.2.1, Wilson §5 and §7, Araujo-Pardo–Hubard–Oliveros–Schulte Theorem 3.1 among them) and are not re-read here.

## Not verifiable

- **Folder 80** is handwriting, read by eye from rendered pages (no OCR on this worker): the drawings, type labels and the shape of the statements on pp. 20, 22, 24 and 28 are legible and are what the table reports; individual words of the running text are not all legible, and nothing in the roadmap depends on them.
- **Carried from the previous report, untouched here:** BLSWZ *Oriented Matroids*, Levi 1926, Ringel 1956, Roudneff–Sturmfels 1988, Björner–Edelman–Ziegler 1990, Goodman–Pollack 1984, the *Esquisse*, Coxeter–Moser (paywalled or not found); the Handbook chapters were read in the editors' preliminary versions.
- This review edits no manifest and writes no `needs-references.toml`.

## Source issues

- none
