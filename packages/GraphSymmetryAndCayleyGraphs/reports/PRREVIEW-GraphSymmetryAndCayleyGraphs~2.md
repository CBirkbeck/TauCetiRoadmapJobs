# Review of GraphSymmetryAndCayleyGraphs (pull request #3060 at fbfdff8)

**Verdict:** needs changes

**Summary.** Changes are needed for two reasons. The statement of Weiss's theorem in the closing section is false as written: a `7`-arc-transitive graph is also `6`-arc-transitive. And the spectral characterizations of walk-regularity in Layer 2 are the all-vertices case of the cospectral-vertex equivalences that the open roadmap SpectralQuantumWalks owns in its Layer 1, which the scope section does not mention. Both findings of the previous review are repaired, every stated target survived the degenerate-case pass, and `Suggested.lean` elaborates with `sorry` as its only warning. There is one small correction and one format note, neither blocking. No source text could be read this round, so wording and arrangement were not compared with any source; that is left to the human reviewers.

## R01 (P2) — Weiss's theorem is stated for `s`-arc-transitive graphs, for which `s ≠ 6` is false

A reader who takes the sentence as the target of the future roadmap gets a statement that the graphs named two lines later refute. In "Beyond this roadmap" (README line 849): "A finite connected `s`-arc-transitive graph of minimum degree at least `3` has `s ≤ 7` and `s ≠ 6`".

By the roadmap's own monotonicity (7.1, `IsSArcTransitive.of_succ`, minimum degree at least `2`), a `7`-arc-transitive graph of minimum degree at least `3` is `6`-arc-transitive. Such graphs exist, and the same bullet says so ("the generalized polygons attaining `s = 7`"): the incidence graph of a generalized hexagon admitting a duality is one. So `s = 6` occurs for "`s`-arc-transitive". What Weiss proves excludes `6` only as the largest value: no such graph is `8`-arc-transitive, and one that is `s`-arc-transitive but not `(s + 1)`-arc-transitive has `s ≤ 5` or `s = 7`.

Smallest change: "A finite connected graph of minimum degree at least `3` is not `8`-arc-transitive, and if it is `s`-arc-transitive but not `(s + 1)`-arc-transitive then `s ≤ 5` or `s = 7`."

## R02 (P2) — The spectral characterizations of walk-regularity have a second owner: Layer 1 of the open roadmap SpectralQuantumWalks owns the same equivalences for pairs of vertices

Two roadmaps that plan the same three-way equivalence give an implementer two targets for one argument and no rule for which carrier wins. Layer 2 here states that a graph is walk-regular (equal closed-walk counts at all vertices) exactly when every `P_θ` has constant diagonal (2.1) and exactly when all vertex-deleted characteristic polynomials coincide (2.2), and that vertex-transitive graphs are walk-regular (2.3); the scope section lists under "Owned here" "walk-regular graphs … and the spectral characterizations of walk-regularity".

SpectralQuantumWalks (a new roadmap, open) lists under what it owns "local spectral support, cospectrality and strong cospectrality", and its Layer 1 plans "cospectral vertices via equal local multiplicities, with equivalent deleted-characteristic-polynomial and closed-walk-count formulations" and "automorphism orbits imply cospectrality", after the projector expansion grouped by distinct eigenvalues in its Layer 0. Its local multiplicities are the diagonal entries `(E_λ)_{u,u}`. Walk-regularity is the statement that every two vertices are cospectral, so 2.1 and 2.2 are those equivalences quantified over all pairs, and 2.3 is the orbit statement for a transitive group. The scope section here names SpectralQuantumWalks only for its Layer 7 (character diagonalizations).

Smallest change, either of two, as was done for EquitableOperatorReduction in 1.2. (a) Keep 2.1–2.3 as a variant and say so in the SpectralQuantumWalks bullet of "Not owned here", in one clause that states the difference (for instance: here the condition is on all vertices of a simple graph, stated on the real projections of GraphSpectra 3.9 and on characteristic polynomials over `ℤ`; cospectrality of two given vertices of a Hermitian matrix is that roadmap's Layer 1, which is not used). (b) Cite SpectralQuantumWalks Layer 1 for the pairwise equivalences and state walk-regularity as their all-pairs corollary.

## C01 — The opening summary of Whitney's automorphism theorem drops "connected"

In the Summary (README lines 30–32) the second clause reads "apart from four small graphs every automorphism of the line graph comes from exactly one automorphism of the graph". The subject "connected graphs" belongs to the first clause only, and without it the clause fails: `2K₂` has `8` automorphisms and its line graph `2K₁` has `2`, and `2K₂` is none of `K₂`, `K₄`, the diamond, the paw. Section 8.2 and `bijective_lineGraphAutHom` carry the hypothesis. Would read correctly as "… every automorphism of the line graph of a connected graph comes from exactly one automorphism of the graph".

## N01 — For the odd-order matching statement the README (6.2) cites "the remark before Theorem 3.5.1" of Godsil–Royle while the docstring of `exists_isMatching_verts_eq_compl_singleton` cites Theorem 3.5.1; one locator for both would let the two be matched.

## Questions for the author

- 2.1 gives [G, Chapter 5, §3, p. 81] as a locator for the closed-walk definition of walk-regularity, and 2.2 says the coincidence of the vertex-deleted characteristic polynomials "is the definition of walk-regularity in [G, Chapter 5, §3, p. 81]". Which of the two does Godsil take as the definition at that place? I could not read the book (no legal copy found).
- 7.1 says Godsil–Royle §4.1, p. 59 states monotonicity of `s`-arc-transitivity without a degree condition. Is that the book's sentence, or does its standing convention there already exclude vertices of degree one? The text could not be read; if it is as the README says, it belongs in the errata register.

## Earlier findings

- R01 of the previous review (the neighbour counts in the `P₃` control of 1.2): repaired. The Check now reads "the middle vertex has one neighbour in the cell `{end}`, the other end has none"; with `a – b – c` and cells `{a}`, `{b, c}` the counts into `{a}` are `1` and `0`.
- R02 (two owners of the equitability of orbit partitions): repaired. 1.2 now says "Orbit partitions are recorded here and are not targets", names EquitableOperatorReduction Layers 1 and 5 as the owner there and in the scope section, and the two Lean statements are gone.
- C01 (permutation-matrix convention in the sketch of 1.2): repaired; the sketch now has `(P_σ A)_{xy} = A_{σx, y}`, `(A P_σ)_{xy} = A_{x, σ⁻¹y}` and `P_φ f = f ∘ φ`, which is Mathlib's convention.
- C02 (two library claims without declarations): repaired; the sentence is removed.
- C03 (three statements that ask nothing): repaired; they are proved in `Suggested.lean` and marked as sanity checks in the README and in their docstrings.
- C04 (unused hypotheses of the retraction theorem): repaired; 4.1 assumes `Nonempty V` and finiteness, says what each is for, and has `2K₃` as a Check (`|Γ| = 72`, stabilizer `12`, `|S| = 24`, recomputed).
- N01: partly; the docstring title now reads "target signatures", and the file still opens with `module` and `public import` lines, which the automatic checks accept. N02 and N03: repaired.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 arc-transitive ⇒ vertex- and edge-transitive | `K_{1,3}`; `K₂ ⊔ K₁`; edgeless graph | `K_{1,3}`: two dart orbits; isolated vertex breaks VT; no edges and no isolated vertex forces `V` empty, both sides vacuous | holds | none |
| 1.1 orbit bipartition | `K_{1,3}`; `K₂ ⊔ K₁` | orbits `{centre}`, `{leaves}` are the classes; with isolated vertex the edge lies in one orbit | holds; hypothesis needed | none |
| 1.1 even degree | `C₅`; dart-orbit count | two dart orbits swapped by reversal give degree `2a`; `C₅` is arc-transitive, hypothesis fails | holds | none |
| 1.2 matrix criterion | `P₃`, end swap and end–middle swap | `(PA)_{xy} = A_{σx,y}`, `(AP)_{xy} = A_{x,σ⁻¹y}`; end swap: both true; end–middle: both false | holds | none |
| 1.2 simple spectrum | `K₂`; `C₄`; empty `V` | `1, −1`, swap² = 1; `C₄` eigenvalue `0` twice, rotation of order 4; empty: injective, trivial group | holds | none |
| 1.2 orbit prose and Checks | `K_{1,3}`; `P₃` cells `{a}`, `{b,c}` | centre `3, 0`; leaf `1, 0`; into `{a}`: `b` has 1, `c` has 0 | true | none |
| 1.3 Kneser vertex-transitive | `(Fin 4, 2)`; `(Fin 3, 2)`; infinite `α` | `3K₂` on 6 vertices; 3 vertices, no edge; `Equiv.Perm.exists_map_finset_eq` has no finiteness hypothesis | holds | none |
| 2.1 `Aʰ = ∑ θʰ P_θ`, projections | `K₂`; `h = 0`; `P₃`; `C₅` | `P₁ + P₋₁ = I`, `P₁ − P₋₁ = A`; `0⁰ = 1`; `P₀` diagonal `(½,0,½)`; closed walks `2, 0, 6` | holds | R02 (ownership) |
| 2.2 vertex-deleted formula and iff | `K₂`; `K₁`; `t = 1`; `P₃` | `(t²−1)(½/(t−1)+½/(t+1)) = t`; `t·(1/t) = 1`; `1` against `0`; `t²−1` vs `t²` | holds off the spectrum | R02 (ownership) |
| 2.3 walk-regular vs transitive | Chang graph from `4K₂` switching | `|Aut| = 384`, `384/28` not an integer; SRG `(28,12,6,4)` | Check holds | none |
| 3.1 regularity, connectivity | `ZMod 5` with `{1}`, `{2,3}`, `{0,±1}`; `mulCayley {1}` on `ZMod 5`; `ZMod 4`, `{2}`; `Sym(3)`; trivial group | degrees `2, 2, 2`; `x·1 = y` forces `x = y`, no edge; `2K₂`; `K_{3,3}`, `2K₃`; `S = ∅`: closure `⊥ = ⊤`, one vertex | holds | none |
| 3.2 Sabidussi, recognition | `ZMod 4` on `C₄`; `D₄` on `C₄`; empty `V` | `S = {1,3}`; non-free: `|S| = 4`, 4-regular on 8; empty: trivial subgroup regular, no group empty | holds; `Nonempty` needed | none |
| 3.3 normal Cayley graphs | `Q₈`, `{±i,±j}`; `Sym(3)`, `{(12),(123),(132)}` | `1·S = S`, `i·S = {±1,±k}`: `K_{4,4}`; `(13)(12)(13) = (23) ∉ S` | holds | none |
| 4.1 retraction | `C₅`; Petersen; `2K₃`; empty `V` | `|Γ| = 10`, `|S| = 4`; `12·3 = 36` on 120; `72`, `12`, `24`; `g⁻¹h ∈ S ⇔ gv ∼ hv` | holds; `Nonempty` needed | none |
| 4.2 Petersen | arc count; involution argument; `ZMod 10`, `{±1,5}` | `10·3·2·2 = 120`; `{a, σa}` fixed; 4-cycle `0,1,6,5` | holds | none |
| 5.1 characters | `ZMod 5`; `ZMod 2²`; `ZMod 8`, `{±1,4}`; `S = {1}` | `2cos(2πj/5)`; `2,0,0,−2`; `i − i + 1 = 1`; `ζ ∉ ℝ` | holds | none |
| 5.2 block decomposition | `Sym(3)` transpositions; `Sym(3)` mixed set; `ZMod 8`, `{2,6}` | `3, −3, 0⁴`; blocks `3`, `1`, `ρ(12) − 1` with `0, −2`; prism `3,1,0²,(−2)²`; eigenvalue 2 twice | holds | none |
| 5.3 normal connection sets | `Sym(3)` 3-cycles; `Q₈`; non-normal `S` | `2², (−1)⁴`; `4,0,0,−4` and `0⁴`; `(0−1−1)/2 = −1` not in prism spectrum | holds | none |
| 6.1 edge and vertex connectivity | `K₂`, `K₃`, `C₄`, `K₄`; atom bound | `κ′ = 1 = k`, `3 < 4`; `6 ≤ 6`; `6 ≤ 6`; `9 ≥ 8`; `a(k−a+1) ≥ k` for `a ≤ k` | holds; `3 ≤ card V` needed | none |
| 6.2 matchings | `C₅`; `P₃`; `3K₃`; one vertex; Petersen | `C₅ − v = P₄`; middle never missed; `K₂ ⊔ 2K₃` has none; empty matching; `6·5/15 = 2` per edge | holds | N01 |
| 6.3 long cycles | `K₃`, `C₄`, Petersen, `K₂` | `9 ≥ 9`; `16 ≥ 12`; `81 ≥ 30`; no cycle; `k ≥ 3` gives `κ ≥ 8/3` | holds | none |
| 7.1 `s`-arcs, monotonicity | `s = 0, 1`; `K_{1,3}`; `K₄` | all maps `Fin 1 → V`; adjacency; six 2-arcs regular under `Sym(3)`, not arc-transitive; `24` 2-arcs | holds; degree hypothesis needed | none |
| 7.2 girth bound, Tutte | `s = 0, 1`; `K₄`, `K_{3,3}`, Petersen, Heawood, 8-cage; `Cₙ` | `0 ≤ g`; `3 ≥ 2`; `4 ≥ 4`; `5 ≥ 4`; `6 = 6`, `336`; `8 = 8`, `1440`; `Cₙ` all `s` | holds | none |
| 8.2 Whitney automorphism | connected graphs on ≤ 4 vertices; `2K₂` | `K₂`: 2→1; paw 2 vs 4; diamond 4 vs 8; `K₄` 24 vs 48; six others bijective; `2K₂`: 8 vs 2 | holds for connected | C01 |
| 8.1 Whitney isomorphism | `K₃`, `K_{1,3}`; `K₁`, `2K₁`; paw | both line graphs `K₃`; empty line graphs; `L(paw)`: `cd` misses only `ab`, the diamond | holds | none |
| 9.1 Frucht | trivial group; `ZMod 2` | Frucht graph, 12 vertices, cubic (the empty graph also qualifies); `K₂` not cubic | holds | none |
| 9.2 asymmetry | `n = 0 … 6`; cycle bound | ratios `0,0,1,1,1,1`; `27008/32768 = 211/256`; moved pairs `≥ m(n−2)/2` | holds | none |
| Weiss's theorem (closing section) | incidence graph of a generalized hexagon with a duality | 7-arc-transitive, hence 6-arc-transitive by 7.1 | sentence false | R01 |

- Source locators checked against the text this round: 0 (no legal copy of any cited source was obtained; the six Brouwer–Haemers locators the previous review read are unchanged except that 3.1 now also cites §6.3 for regularity).
- Library declarations opened at the pin: Mathlib `Combinatorics/SimpleGraph/Cayley.lean:36, 96, 125, 145` (`mulCayley` needs only `[Mul M]`); Tau Ceti `Combinatorics/SimpleGraph/Connectivity/EdgeConnectivity.lean:49, 89, 94`, `VertexConnectivity.lean:331, 398, 564`, `RepresentationTheory/CharacterTable/Completeness.lean:237`; the 40 Mathlib and 10 Tau Ceti `#check` lines of `Suggested.lean` all elaborate. No declaration for vertex-, edge- or arc-transitivity, walk-regularity, Sabidussi, Frucht or Whitney's line-graph theorems exists at either pin.
- Cross-roadmap citations resolved at the open heads or on main: 17 (GraphSpectra 1.2, 2.3, 2.4, 3.9; SpectralGraphBounds 1.1; TopologicalCombinatorics 3.1; CharacterTheory 2.1, 3.6, 4.3; EquitableOperatorReduction Layers 1 and 5; MatchingTheory 5.2; LovaszThetaFunction 4.2; AssociationSchemes 5.2; PaleyGraphsAndCharacterSums 1.4, 2.1; PositiveDefiniteSequencesAndToeplitzForms 2.1; SpectralQuantumWalks Layer 7). The six copied supplier definitions agree with the suppliers' heads character for character in their bodies. The downstream claims agree with CocliquesColouringsAndTheta (1.1, 1.3, 4.1), ExpanderGraphs (3.1) and DistanceRegularGraphsCodesAndPolygons ("not used here").
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 40 `sorry` warnings and no other warning or error. All 63 elaborated signatures compared with the README; the one dropped binder is `[Finite V]` on the definition `lineGraphAutHom`, which does not need it. Nothing changed.
- One-tactic probes on a copy: 10 statements tried (`simp` with the definitions unfolded), none closes.
- Dependency check output: `depcheck: 129 roadmaps, 1437 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing outside the roadmap folder is changed.
- Pull request text: the counts (40 `sorry` headlines, 3 proved sanity checks, 14 definitions, 6 copied definitions), the supplier list and the boundary paragraph agree with the head.
- Overlap check: read CocliquesColouringsAndTheta, GraphSpectra, DistanceRegularGraphsCodesAndPolygons, ExpanderGraphs, StronglyRegularGraphsAndDesigns, GraphConnectivityAndFlows, and also EquitableOperatorReduction, SpectralQuantumWalks, CharacteristicPolynomialsAndStarComplements and MatchingTheory; cospectral vertices and their three formulations: SpectralQuantumWalks and, for all pairs, this roadmap (R02); equitable and orbit partitions: EquitableOperatorReduction; spectral projections, Petersen, Johnson and Hamming graphs: GraphSpectra; perfect matchings of even vertex-transitive graphs: MatchingTheory; edge and vertex connectivity: GraphConnectivityAndFlows; the transitivity notions, Cayley graphs as graphs, `s`-arcs: this roadmap, cited by the others; nothing else shared.

Source independence: 0 passages compared with 0 sources this round (no cited text could be read legally); largest share Godsil–Royle, 30 of 59 locator brackets, whose text and contents page could not be read; by the README's own locators the layers do not run in its section order (§3.2, then §§3.1 and 3.7, §3.9, §3.1 and §4.4, §§3.3–3.6, §§4.1–4.3, with Layers 2, 5, 8 and 9 from other sources), and 6.1–6.3 parallel §§3.3–3.6 where 6.3 needs 6.1.

Research link: Layer 5 states the Cayley-spectrum formulas (Brouwer–Haemers 2012, Krebs–Shaheen 2011) that the open ExpanderGraphs roadmap builds on; Layer 7 is Tutte 1947, the cubic case of Weiss 1981; 6.3 is Babai 1979; 9.2 is Erdős–Rényi 1963. Rests on the README (References, Downstream consumers, Beyond this roadmap) only.

## Not verifiable

- Godsil–Royle (all locators of 1.1, 3.1, 3.2, 4.1, 4.2, 6.1–6.3, 7.1, 7.2, and Figure 3.4): Springer, paywalled; the sources service found no legal copy.
- Brouwer–Haemers (1.2, 3.1, 5.1, 5.3, 2.3): the service resolves it only to the paywalled page and did not accept the address of the first author's page; not re-read this round.
- Biggs; Cvetković–Rowlinson–Simić (both books); Godsil, *Algebraic Combinatorics*; Knauer–Knauer; Krebs–Shaheen; Beineke–Wilson (Cameron, Alspach, Praeger): no legal copy sought beyond the previous round's result; the locators of 1.2, 2.1, 2.2, 5.1–5.3, 7.2, 8.2 and 9.2 were not checked against the text.
- Ownership against open pull requests was checked through the roadmap search over the open heads and main and by reading the ten roadmaps named in the overlap line, not by reading every open roadmap.

Automatic checks set aside as false positives: the section comment "Library declarations consumed" at the end of `Suggested.lean` was reported as a header with no declaration under it; it is followed by `#check` lines pinning library declarations, which the form rules allow.

## Source issues

- none

## For the human reviewers

- Not tested: Godsil–Royle carries 30 of the 59 locator brackets (README References); neither its text nor its contents page, nor any other cited source, could be read this round, so wording and arrangement were not compared with a source.
- Licence: the sources service recorded Brouwer–Haemers and Godsil–Royle as paywalled and uncertified; the copy of Brouwer–Haemers on its first author's page was refused by the service as not shown to be an author's page.
