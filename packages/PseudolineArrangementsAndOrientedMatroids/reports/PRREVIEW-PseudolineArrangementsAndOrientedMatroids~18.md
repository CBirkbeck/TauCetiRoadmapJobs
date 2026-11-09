# Review of PseudolineArrangementsAndOrientedMatroids (pull request #1523 at d0c914d)

**Verdict:** needs changes

Incremental re-review of the 93 lines of `TauCetiRoadmap/PseudolineArrangementsAndOrientedMatroids/README.md` changed since 17149ad (57 insertions, 36 deletions, `Suggested.lean` byte-identical). Three of the four findings of the previous report are repaired and the fourth is repaired in all but one bullet; the changed passages introduce no new defect. One P3 finding remains, carried from the previous report.

## R01 (P3) — The folder-80 notes are cited in the Research context but have no References entry

- **Location:** `TauCetiRoadmap/PseudolineArrangementsAndOrientedMatroids/README.md` lines 1709–1712: "Grothendieck's notes on pseudoline arrangements include the classification of 3.8 (b) and the listing of 3.8 (c) (Montpellier fonds, folder 80, pp. 20, 22 and 24 for the classification, p. 28 for the listing, https://grothendieck.umontpellier.fr/80.pdf)". The `## References` list (lines 1715–1804) has no entry for it.
- **Claim:** every other work the Research context cites (Vakil 2006, Lund–Purdy–Smith 2014, Green–Tao 2013) has a References entry; this one has none. The previous report asked for it (its R03, last bullet), as did the report before that.
- **Witness:** `grep -n 'folder 80\|80.pdf'` on the README returns only lines 1711 and 1712, both inside the Research context paragraph.
- **Repair:** add to `## References`, next to the *Esquisse* entry: "- A. Grothendieck, manuscript notes on pseudoline arrangements, Université de Montpellier, fonds Grothendieck, folder 80, https://grothendieck.umontpellier.fr/80.pdf (pp. 20, 22, 24 and 28; the classification of 3.8 (b) and the listing of 3.8 (c))."
- **Tested:** the entry repeats the pages the Research context names, so the two agree; nothing else cites the notes.

## Previous findings

- R01 — repaired: README lines 1004–1008 read "`Chirotope.isChirotope_flipFun`: for a uniform `χ` on a finite `E` the flip at a triangle is a chirotope … `Chirotope.exists_triangle_of_flipFun`: for a uniform `χ` on a finite `E`, if the flip at three distinct elements is a chirotope, they are the walls of a triangle". The near-pencil negative control is the third Check (lines 1028–1030) and Richter-Gebert–Ziegler §6.3.3, p. 175 is cited. The README now has the generality of `Suggested.lean` lines 548–554 (`[Finite E]`, `IsUniform`). Values recomputed in the table.
- R02 — repaired: 5.4 (lines 1120–1126) draws the extension by 3.6 through its simplification (1.7) and a lexicographic line at infinity, reads the localization off by 3.3 and 3.5, and perturbs the wire; its *Needs:* line (1130) is "1.7, 2.5, 2.7, 3.3, 3.5, 3.6, 5.1, 5.2"; Layer 5 Dependencies (1167–1168) read "5.4 uses 1.7, 3.3, 3.5, 3.6 and 5.1–5.2"; the build paragraph (228–229) says "draws positions with 3.6 in 5.4"; Layer 3 Dependencies (897) read "3.7 uses 0.3, 1.5, 1.6 and Layer 2". The *Needs:* lines of 3.3, 3.5 (2.2, 2.7, 3.2, 3.3) and 3.6 (1.5, 1.7, 2.7, 3.3) name no Layer 5 target, so no cycle arises. The route is checked on the Check's instance in the table.
- R03 — partly repaired: the locators for 1.3 (lines 398–400), 3.4 (721–725), 5.3 (1102–1103), 8.4 (ii) (1462–1464, Bandelt–Chepoi–Knauer 2018, §4, Proposition 3) and 1.5 (447, BLSWZ §3.3 for minors) are added and verified below; the BLSWZ and Bandelt–Chepoi–Knauer References entries (1717–1723, 1768–1770) follow. The folder-80 References entry is still missing: R01 of this report.
- R04 — repaired: 3.5 line 744 reads "(ii), for every `n`, `MonotoneArrangement.isPathConnected_cell`"; the elaborated signature (`Suggested.lean` line 475) quantifies over every `n`.

## Verified sound

### Gate, order and Lean

- **Gate.** The brief's gate command, run by me at d0c914d8: every counter is 0 (set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, metadata, stray-files, dirty, outside-folder, source-material) except `depcheck=1`, whose line is "NOT IN ORDER: PseudolineArrangementsAndOrientedMatroids (insert it after its last supplier)", which is not a defect before placement. The worker's gate on this head is 0 everywhere, including `build=0`.
- **Dependency check** against the candidate order with `--movable`: `depcheck: 236 roadmaps, 2262 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Outside the folder:** `git diff --stat origin/main...HEAD` outside the roadmap folder is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- **Elaboration:** `Suggested.lean` is unchanged since 17149ad (`git diff 17149ad..HEAD` on it is empty). `lake env lean` exits 0 with 51 warnings, all "declaration uses `sorry`", one per sorried theorem.
- **Signatures against the changed README statements** (from the worker's elaborated signatures, re-read declaration by declaration): `isChirotope_flipFun`, `exists_triangle_of_flipFun` and `reflTransGen_mutationStep` carry `[Finite E]` and `IsUniform χ.toFun` (README 4.5 now says so); `isPathConnected_cell` has no hypothesis on `n` (README "for every `n`"); `range_signAt` has `2 ≤ n` (README "for `n ≥ 2`"); `chiFun_ofLines` has `v none = ![0, 0, 1]`, `v (some i) = ![-1, a i, b i]` (README 3.4); `levi_enlargement` has `[Finite E]`, `Y, Z` nonzero covectors, an extension with `none` not a loop, and the two extensions by `0` as covectors (the README's first clause; its second clause, "parallel to no element", is a README-only refinement, as at the previous head). No binder is lost (the worker's check reports 0).
- **One-tactic probe:** every `sorry` of a scratch copy replaced by `first | rfl | (simp; done) | infer_instance | trivial | (norm_num; done) | omega | decide | (aesop; done)` (the last theorem's term-mode `sorry` with `by first | …`). 51 errors at 51 distinct lines, 0 `sorry` warnings: no theorem closes.
- **Headlines:** unchanged since the previous report, which listed them; nothing in the diff adds or removes a headline.

### Sources read for the changed locators (and the sampled targets that fall in changed passages)

Printed pages: for the Handbook chapters the printed page is the file page plus 158 (chapter 6) or 124 (chapter 5), checked at the running heads.

| Target | Locator at this head | Source lines | Result |
|---|---|---|---|
| 1.3 | Richter-Gebert–Ziegler 2017, §6.2.3, p. 167, (CHI1) | richtergebertziegler2017 line 371–373 (file page 9 = p. 167): a chirotope is an alternating sign map whose support is a matroid | ✓ |
| 1.3 | §6.3.1, pp. 172–173: loops; uniform = values in `{+, −}` | line 592–595 (p. 172) loops and coloops; line 605–607 (p. 173) uniform iff the chirotope takes values in `{+, −}` | ✓ |
| 1.5 (sampled) | BLSWZ §3.3 (minors); §3.4, §3.6 (duality) | BLSWZ not readable; the Handbook points to BLSWZ §3.3 for minors, line 576–577 | ✓ as far as readable |
| 3.4 | §6.2.3, p. 168: chirotope of a vector configuration = sign of determinants | line 392–393 (file page 10 = p. 168) defines `χ_X` as `sign det` | ✓ |
| 3.5 (sampled) | Theorem 6.2.4, p. 169, first half, rank 3 | line 463–468 (p. 169): essential pseudosphere arrangement gives the covectors of an oriented matroid | ✓ |
| 4.5 | §6.3.3, p. 175, the triangle flip; Ringel | line 715–725 (file page 17 = p. 175): pushing one side over the opposite vertex, Ringel's connectivity | ✓ |
| 4.5 | Felsner–Goodman 2017, p. 133 | felsnergoodman2017 line 379–384 (file page 9 = p. 133): triangle flip and Theorem 5.2.8 | ✓ |
| 5.3 (sampled) | Felsner–Goodman 2017, Theorem 5.1.1, p. 126, two distinct points not on a common pseudoline | line 84–87 (file page 2 = p. 126): exactly that hypothesis and conclusion | ✓ |
| 8.4 (ii) | Bandelt–Chepoi–Knauer 2018, §4, Proposition 3, p. 12 of arXiv:1507.06111v3 | bandeltchepoiknauer2018 line 435 (§4 "Tope graphs"), line 478 (page 12): a simple COM is determined by its tope graph up to reorientation; line 476–477: it generalizes [9] = Björner–Edelman–Ziegler 1990 (line 1563–1564) | ✓ |
| 8.4 (ii) | "in particular a simple oriented matroid" | BCK's simplicity is (N1) every element takes all three values and (N2) every pair has covectors with products of both signs (line 376–380). A loopless oriented matroid without parallel pairs satisfies both: `0` from the zero covector and `±` from a cocircuit nonzero at `e`; for `e ≠ f` non-parallel, a cocircuit `X` with `X e = 0 ≠ X f` composed with a tope `T` and with `−T` gives products `T e · X f` and `−T e · X f` | ✓ |
| 1.6 (sampled) | FG §5.1, p. 126; §5.2, p. 131 | line 47–50 (isomorphism classes = reorientation classes); line 297–303 (file page 7 = p. 131, abstract order types) | ✓ |
| 4.1 (sampled) | FG Theorem 5.2.1, p. 129 | line 211–218 (file page 5 = p. 129), conditions (i)–(iii), (iii) = not all switch at once | ✓ |
| 4.3 (sampled) | FG Theorem 5.2.8, p. 133 | line 382–384 | ✓ |
| 7.3 (sampled) | Wilson 2012, §7, p. 272 | wilson2012 line 264–266 (file page 8 = p. 272): a symmetry is a permutation commuting with each `rᵢ` | ✓ |
| 8.1 (sampled) | Wilson 2012, §5, p. 270 | line 187–190 (file page 6 = p. 270): orbits of the group generated by the products `rᵢ rⱼ`; orientable iff the flag graph is bipartite | ✓ |
| 7.1 (sampled) | Tau Ceti `CoxeterSystem.commute_simple_of_eq_two` | `TauCeti/GroupTheory/Coxeter/Basic.lean` line 113 at pin 2fd255d9 | ✓ |
| 9.4 (sampled) | Tau Ceti `TriangleGroup.natCard_two_three_{three,four,five}`, `equivIcosahedral` | `TauCeti/GroupTheory/TriangleGroup/Polyhedral.lean` lines 404 (12), 414 (24), 424 (60), 460 | ✓ |

The remaining sampled targets lie in untouched text: 0.1, 5.2 (BLSWZ, not readable), 3.2 (a definition of this roadmap; its Checks were computed in the previous report), 7.5 (Wilson p. 270 and Tau Ceti `MonoidHom.quotientComapStabilizerEquiv`, verified in the previous report), 8.3 (Mathlib `Graph`, verified in the previous report), 9.4's Coxeter–Moser (not readable).

### Cross-roadmap citations (main at 1bea835)

- RootSystems §1.3: `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md` line 515 ("1.3 Faithfulness and transport"), `geometric_faithfulness` at its `Suggested.lean` line 73, as cited at README lines 57 and 1653–1655.
- GraphConnectivityAndFlows Target 1.1: present on main (its README lines 34, 162, 640), cited at README lines 57, 1430–1431, 1452.
- Overlaps: no open pull request changes this roadmap, no id is dropped in either direction; the closest open roadmap is SurfaceTopology (#271), on the never-cite list, and `GMap` stays owned here, as in the previous report.

### Adversarial table

Values for the changed statements were computed by enumeration in a scratch script (sign vectors from `3 × 3` determinants, covectors as compositions of cocircuits, walls as the elements whose zeroing stays in the covector set) or by hand. Rows for untouched statements carry the previous report's values.

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 4.5 `isChirotope_flipFun`, `exists_triangle_of_flipFun` (uniform, finite) | alternating chirotope on 5 (moment curve `t = 0..4`); near-pencil `e₁, e₂, e₁ + e₂, e₃` | 22 topes, triangles `012, 014, 034, 123, 234` (1-based: `123, 125, 145, 234, 345`); flips there have 0 three-term violations, flips at the other five triples 48 each (over `λ` and ordered `a, b, c, d`); near-pencil: `χ(e₁, e₂, e₁ + e₂) = 0`, the flip equals `χ` with 0 violations, 12 topes whose wall sets are `{e₁, e₂, e₃}`, `{e₁, e₁ + e₂, e₃}`, `{e₂, e₁ + e₂, e₃}`, none `{e₁, e₂, e₁ + e₂}` | true; the new Check is correct and separates the hypothesis | none |
| 3.4 `chiFun_ofLines` locator identity | 2000 random integer `(a, b)` with distinct slopes; the lines of 3.1 | `det [(-1, aᵢ, bᵢ); (-1, aⱼ, bⱼ); (-1, aₖ, bₖ)] = (aᵢ − aⱼ)(aⱼ − aₖ)(crossX j k − crossX i j)` with `crossX p q = (b_q − b_p)/(a_p − a_q)`, exactly in every instance; `det` with `(0, 0, 1)` is `aᵢ − aⱼ`; for 3.1 both are `1` | true | none |
| 3.5 (ii) for every `n` | `n = 0, 1` | `n = 0`: one cell, `ℝ²`; `n = 1`: the two open half-planes and the graph, each path-connected; Lean has no `n` hypothesis | true | none |
| 3.5 (i) `n ≥ 2` kept | `n = 0, 1` | `chiFun = 0`, covector set `{0}`, right side empty while `signAt` has a value | hypothesis needed | none |
| 5.3 `levi_enlargement` with the new locator | two vertices on `e`; `Z = −Y` | first clause met by the parallel extension of 5.2, whose covectors contain `(Y, 0)` and `(Z, 0)`; FG 5.1.1's hypothesis is the README's second clause | true | none |
| 5.4 route | the position `v none = e₁` of the third Check | simplification of `χ'` is `χ` (`none ∥ e₁`); the lexicographic extension `[e₁⁺, e₂⁺, e₃⁺]` is nonzero on all three cocircuit pairs (no point lies on three independent lines), so 3.6 applies to a simple chirotope with a generic line at infinity; moving `e₁`'s wire above or below each of its two vertices keeps one crossing with every other wire (the wires of smaller slope are crossed left of the vertex, those of larger slope right of it) and gives the four generic positions `e₁ + ε(±e₂ ± e₃)` of the Check | route sound, no cycle | none |
| 1.3 (locator) | the Check's `(1,0,0), (2,0,0), (0,1,0), (0,0,1)` | the first two span rank 1 and lie in no basis: not simple, no loop | true | none |
| 8.4 (ii) BCK step | a loopless oriented matroid without parallel pairs | (N1), (N2) as derived above | the README's specialization holds | none |
| 0.3, 0.4 | as in the previous report (17149ad) | projective plane, one dart, `{0,2}`-residue: 1 orbit / connected; `hfix` needed; 4 flags lift to two residues | true | none |
| 1.1, 1.2, 1.4, 1.5, 1.6 | as in the previous report | rank 0 gives `±1`; `χ12χ34, −χ13χ24, χ14χ23 = 1, 1, 1` fails; 0 violations in 468750 instances; dual values `1, −1, 1`; `−χ` for odd rank | true | none |
| 2.2, 2.3, 2.7 | as in the previous report | 6 cocircuits and 13 covectors; 20 and 83; wall counts `{3: 10, 4: 10, 5: 2}` on 22 topes; forced circular order on two elements | true | none |
| 3.3, 3.6, 3.8 | as in the previous report | `sign(2 − 1) = 1`; `R = {none}` for the negative chirotope; Melchior `Σ(3 − ν(v)) ≥ 3` | true | none |
| 4.4 | as in the previous report | 2, 16, 768 reduced words give 2, 8, 62 signotopes | true | none |
| 5.5, 6.1, 6.3, 6.4 | as in the previous report | `n = 3, e = id, R = ∅`; shear to `p = −1`; `det C = 0` against the value `1` at `(6,7,8)`; sharp at 9 elements | true | none |
| 7.2–7.5, 8.1 | as in the previous report | `p i = 0` gives no relation; `2 = 2`, `2 < 3`, `Nonempty` and `Finite` needed; 4 vertices of the tetrahedron; `adj 0 · adj 1 = adj 2` on the projective plane | true | none |
| 9.1–9.6, 10.2 | as in the previous report | 24/24, 48/24; index 2; `H₃`: length 15, `120/2 = 60`, `(6, 15, 10)`; `{3,6}` at `n = 2..6`: 24, 108, 192, 300, 432; `orderOf = M i j` | true | none |

Remark on untouched text (no change requested): the 4.5 Check "the flips at the five other triples violate 7200 instances each" counts instances in a convention that differs from mine (48 per triple over `λ` and ordered `a, b, c, d`); the count is nonzero in every convention, which is what the Check uses.

## Not verifiable

- **BLSWZ, *Oriented Matroids*** (paywalled CUP book): the new §3.3 citation in 1.5 is checked only through the Handbook's pointer (richtergebertziegler2017 line 576–577).
- **Grothendieck, folder 80:** an image-only scan; OCR is not installed on this worker. The pages the Research context names are unchecked (as in the previous report).
- **Paywalled or not found:** Levi 1926, Ringel 1956, Roudneff–Sturmfels 1988, Björner–Edelman–Ziegler 1990 (cited beside the readable Bandelt–Chepoi–Knauer locator), Goodman–Pollack 1984; the *Esquisse*; Coxeter–Moser.
- **Handbook chapters 5 and 6:** read in the editors' preliminary versions (July 16 and August 10, 2017); printed pages are those of their running heads.
- **Wilson 2012:** read from the cached MDPI text; the sources service found no legal source for its DOI today, so a fresh fetch was not possible.
- This review edits no manifest and writes no `needs-references.toml`; the four texts it read are in the sources cache.

## Source issues

- none
