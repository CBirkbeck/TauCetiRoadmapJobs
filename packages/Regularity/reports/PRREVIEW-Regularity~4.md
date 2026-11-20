# Review of Regularity (pull request #2631 at 42247a3)

**Verdict:** accepted

**Summary.** Accepted, with one small correction and no format notes. The head is the one the previous review read, so the whole roadmap was checked again from the start: every Check and worked example recomputes, the two headline statements agree with their Lean signatures, and the approximation theorem of §8.2 is supported by Rödl–Schacht's Theorem 14 and Lemma 25 together with the diagonal repair the route describes. The small correction of the previous review stands unrepaired: one sentence after the Scope table describes a library error term as a sum over transversal placements when the term is the larger sum over all placements (C01). One licence fact is left for the human reviewers.

## C01 — The second term of `exceptional_route_prediction_mass_le` is the sum over all placements, which only bounds the sum over the transversal ones

In the paragraph after the Scope table (line 574) the README says of this library lemma that its "second term is the lower-route counting error summed over all routes of all transversal placements". A reader who takes this as the content of the term underestimates it. In Tau Ceti `Combinatorics/Hypergraph/Triadic/ExceptionalPrediction.lean`, line 182, the term is `m^(k choose 2) · (k choose 2) · ε · |V|^k`: the per-route bound `(k choose 2) · ε` times the cell-size product, added over the `m^(k choose 2)` routes of every placement, the cell-size products of all placements adding up to `|V|^k`. With `k = 3`, three cells of size `s` and one pair color, the six transversal placements give `18εs³` and the term is `81εs³`.

A repair: "whose second term, `m^(k choose 2) · (k choose 2) · ε · |V|^k`, bounds the lower-route counting error summed over all routes of all transversal placements".

## Previous findings

- The previous review, of this same head, had no finding. Its one small correction (C01 above) is not repaired: line 574 reads as it did.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / library or source) | Result | Change |
|---|---|---|---|---|
| §0.1 Check 1 (one triple) | 6 vertices, edges 012, 013, 245, 135 | brute force: hom = inj = 24, `t = 1/9`, `t₀ = 1/5`; `n choose 3` normalisation gives 6/5 | holds | none |
| §0.1 Check 2 (`K₄⁽³⁾` minus an edge) | pattern 012, 013 on four vertices | brute force: inj 12, hom 30, `t = 15/128`, `t₀ = 1/2`; 18 non-injective, all identify vertices 2, 3; complete host 24, 48 | holds | none |
| §0.1 Checks 3, 4 and Examples | path with `K₂`; edgeless on 4 in 3 vertices; `K₃` in `K₃`; `K₂` in `C₄` | (4, 4, 4/9, 2/3); (81, 0, 1, 0); (6, 6, 2/9, 1); (8, 8, 1/2, 2/3) | holds | none |
| §0.1 comparison at `r = 2` | `n < k`; `n = 0`, `k = 0` | `injHomDensity` divides by `descFactorial`, 0 for `n < k`; `homDensityFin` gives 1 at `0⁰`; both match §0.1 | holds | none |
| §0.1 single-edge identity | `r = 0`; `n < r` | `r! · |E|` over `(n)_r` equals `|E| / (n choose r)`; `r = 0`: 1 or 0 on both sides; `n < r`: 0 = 0 | holds | none |
| §8.1 definition against Lean | elaborated type; `ε, F` arbitrary reals | five conjuncts in README order; `F` at cells + pair colors (`LowerSkeletonRegular`), `F C.complexity`, `R C.complexity`, `C.complexity ≤ b` | matches | none |
| §8.1 Check (constant coloring) | cell sizes 1, 2 with `f = 1/2`, 3 with `f = 1/2` | size 1: 0 = 0; size 2: `({v},{v})` density 0 against 1; size 3: test sets ≥ 2, density 1 | holds | none |
| §8.1 monotonicity and edit transfer | `ε ≤ ε'`, `F ≤ F'`, `R' ≤ R`; `R' = 0`; `δ ≥ 0` | `IsRegularPair.mono`, `IsTopRegularOverPolyad.mono`, `of_rank_le` need no sign condition; edit discrepancy ≥ 0 gives `δ ≥ 0` | holds | none |
| §8.2 headline against the source | RodlSchacht2007Reg lines 254–262, 473–489 | perfect rank-one `ε(a)`-regularity, pair classes regular on distinct cells, `s` classes edited by `νn³` each; rank bridged by `2^r δ ≤ ε'²` | supported | none |
| §8.2 diagonal and bound `B` | intra-cell pairs one color; cell size against `1/F(t + m)` | regular iff cell size 1 or > `1/f`; `B ≥ T · max 1/F` possible since `B` bounds host and complexity | holds | none |
| §8.2 Check 1 | `t₀ = 1`, `V = ∅`; `κ₃ = Fin 1`, `\|V\| = B < t₀` | empty host has 0 cells < 1; `\|V\| = B` gives ≤ `B` cells < `t₀` | holds | none |
| §8.2 Check 2 (`F ≥ 1`) | `t₀ = 1, 2`; `t₀ = 0` | every pair regular at ≥ 1; densities in [0, 1] give top regularity; complexity `t₀³ + t₀ + 1`; `t₀ = 0` needs 3 > 1, excluded | holds | none |
| §8.2 headline (Lean) | elaborated type | `0 < ε`, `∀ n, 0 < F n`, `∀ n, 1 ≤ R n`, `t₀`; `∃ B` before `V`; cells controlled ∧ approximation at `B` | matches README | none |
| §9.4 parameters and Example | `k = 3`, `ε = 1/10`; `k ≤ 1` | 1/1620; `1/(3240 n³)`; `⌈720⌉ = 720`; route budget `ε/8`; `⌈0⌉ = 0` for `k ≤ 1` | holds | none |
| §9.4 six charges | library proof, `InducedCounting.lean` line 110 | `ε/6`, `ε/6`, `2 · ε/6`, `ε/12`, `ε/6`: sum `11ε/12 ≤ ε` | holds | none |
| §9.4 Check 1 (single cell) | `n = 7`, 19 triples | `(7)_3 · 114/210 = 114`; with `n³`: `343 · 114/210 = 931/5` | holds | none |
| §9.4 Check 2 (no top regularity) | polyads with 3, 2, 1 distinct cells | red densities `1/8`, `(m−1)/(4(2m−1))`, `(m−2)/(4(2m−1))`, all ≤ 1/8; gap `1/16 − 1/4096 = 255/4096 > 1/17` | holds | none |
| §9.4 composed headline (Lean) | the proof term | §8.2 at the three counting parameters, positivity lemmas, library lemma at rank `R C.complexity ≥ 1`; no `sorry` | matches README | none |
| Worked examples | `K_{2,1}`; `C₄`; polyad on `{0..5}` | energies 4/9, 4/9, Mathlib 1/2 → 4/9; cut discrepancy 0 and 2, cut norm 1/8; density 1/2, box density 1 | holds | none |
| Scope note on the exceptional prediction | `k = 3`, three cells of size `s`, `m = 1` | transversal sum `18εs³`; library term `81εs³` | imprecise | C01 |

- Source locators checked against the text: 14. RodlSchacht2007Reg lines 254–262 (Theorem 14), 282–300 (Definition 15), 311–317 (Theorem 17), 473–489 (Lemma 25); RodlSchacht2007Count lines 120, 158, 186 (the 2.13 and 2.16 cross-numbering), 189–199 (Theorem 10), 239–250 (Theorem 13); NagleRodlSchacht2006 lines 224–232, 251–259, 299–312; Terry2024 lines 328–337 (p. 9), 359–362 (p. 10), 1803–1804 (p. 49); LovaszSzegedy2006 lines 53–58, 222–227.
- Library declarations opened at Tau Ceti 2fd255d: 24, among them `PairColor/Regular.lean` lines 77, 245, 292; `PairColor/Density.lean` line 36; `Polyad/TopRegular.lean` lines 88, 109; `Polyad/Rank.lean` line 129; `Triadic/Basic.lean` lines 88, 104, 201, 239, 260, 296, 364; `Triadic/CountingParameters.lean` lines 48, 53, 60; `Triadic/Nontransversal.lean` lines 80, 223; `Triadic/InducedCounting.lean` line 110; `Triadic/ErrorDecomposition.lean` line 159; `Triadic/TopRegularization.lean` line 207; `DenseGraphLimits/HomDensity/Finite.lean` lines 99, 108.
- Every backticked library name of the README (332 names) was searched at the pins; the only ones not found are the roadmap's own two theorems, structure field names and the external library's names in the Provenance table.
- Cross-roadmap citations resolved on main: DenseGraphLimits Layer 9a (line 420 of its README), Exchangeability Layer 8 (line 931), CoboundaryExpansion's citation of Layer 5 (its lines 43, 158), which the Scope table resolves.
- Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`. Automatic checks rerun: all passed. The pull request changes nothing outside the folder.
- Elaboration: `Suggested.lean` gives only the `sorry` warning on line 69. The three elaborated types were compared with §8.1, §8.2 and §9.4 and no binder is lost. One-tactic probe on the sorried theorem (`simp`, `rfl`, `infer_instance`, `trivial`): none closes it.
- Headline theorems: the approximation theorem of §8.2 and its composition with counting of §9.4; both are stated in `Suggested.lean`, and none is declared not statable. Nothing in the file is padding.
- The pull request's description agrees with the head: nine Checks, seven Tau Ceti imports, the three kept layers, the renumbering 9A–9D to §9.1–§9.4, the changed locators.

Overlap check: read DenseGraphLimits (main and its open revision), EquitableOperatorReduction (open), and, by search for the objects, RamseyNumbers (open), Exchangeability and CoboundaryExpansion (main). The graph homomorphism and injective densities are owned by DenseGraphLimits and cited in §0.1; the alignment at `r = 2` is this roadmap's by DenseGraphLimits Layer 9a. RamseyNumbers owns Ramsey numbers of complete uniform hypergraphs, not their homomorphism densities. Tau Ceti's labelled copies of graded complexes are a different carrier from §0.1's uniform hypergraphs. Nothing else is shared.

Source independence: 8 passages compared with 5 sources (the statements of §8.1 and §8.2 and the docstring of the sorried theorem against RodlSchacht2007Reg Theorem 14 and Lemma 25; Convention 9 against its Definition 15; the two sentences of §9.4 on the sources against RodlSchacht2007Count lines 152–155 and NagleRodlSchacht2006 lines 261–275; the definitions of §0.1 against LovaszSzegedy2006 lines 55–58 and 223–227; the References note against Terry2024 line 328), none shared beyond forced phrases of at most 5 words; largest share RodlSchacht2007Reg, 15 of 29 locators; contents compared with RodlSchacht2007Reg (notation, regular complexes, partitions, main results, auxiliary results, outline, the two implications): independent, the roadmap's three layers being densities, approximation and counting.

Research link: Layer 8 is the arity-3 regular approximation lemma of Rödl–Schacht (2007, Theorem 14 with Lemma 25), and Layer 9 the induced counting used with it (Rödl–Schacht 2007; Nagle–Rödl–Schacht 2006), the inputs to hypergraph removal. Rests on README §8.2 and §9.4 and on RodlSchacht2007Reg §1.

## Not verifiable

- The printed numbering of the two Rödl–Schacht papers and of Nagle–Rödl–Schacht: the publishers' pages are paywalled. The README cites the authors' versions explicitly, and those were read.
- The Provenance table's descriptions of declarations in the external `regularity-lemmata` library: its files were not opened.
- Terry2024 was read through OCR; the three passages cited are legible, with some symbols garbled.

## Source issues

- none

## For the human reviewers

- Licence: the Provenance section (README lines 484–531) cites the public Lean libraries `cameronfreer/regularity-lemmata`, at a pinned commit, and `cameronfreer/graphon` as source references. Their files and licences were not opened in this review; the three `Suggested.lean` names differ from the names the table quotes.
