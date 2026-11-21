# Review of Regularity (pull request #2631 at ed0a541)

**Verdict:** needs changes

**Summary.** Changes are needed, for one sentence: an example of Layer 7 says that pair regularity of a small cell with itself fails whenever some pair color has positive density there, and a two-vertex cell with two colors swapped by the reversal is a counterexample (R01). Everything else recomputes: the ten layers of the roadmap on main are all present with their statements, every statement sampled agrees with the declaration that the pinned Tau Ceti proves, the two headline statements agree with their Lean signatures, and the cited theorems of Rödl–Schacht, Nagle–Rödl–Schacht, Terry and Lovász–Szegedy are at their locators. There are two small corrections and one format note, none blocking, and one licence fact for the human reviewers.

## R01 (P2) — Pair regularity of a small cell with itself fails only when some color has density above `ε` there, not as soon as one has positive density

In the Examples of Layer 7, second bullet (line 972), the README says of a cell `A` with `2 ≤ |A|` and `ε |A| ≤ 1` that "pair regularity on `(A, A)` fails as soon as some color has positive density on `(A, A)`". A reader who uses this to decide when a diagonal pair must be repaired (the route of §8.2 depends on exactly this) gets the wrong criterion.

The box `{u} × {u}` has density `0` for every color, so the test it imposes is `d_c(A, A) ≤ ε` for each color `c`; it fails only for a color of density greater than `ε`. Take `A = {u, v}`, `ε = 1/2` (so `ε |A| = 1`), and two colors `a ≠ b` exchanged by the reversal, with `(u, v)` colored `a` and `(v, u)` colored `b`. Both colors have density `1/2` on `(A, A)`. Every pair of nonempty subsets has each density in `[0, 1]`, hence within `1/2` of `1/2`, so `(A, A)` is `1/2`-regular in the sense of §5.3 (`TauCeti.PairColorSystem.IsRegularPair`, `TauCeti/Combinatorics/Hypergraph/PairColor/Regular.lean` line 77), although both colors have positive density.

The smallest repair: "so pair regularity on `(A, A)` fails as soon as some color has density greater than `ε` on `(A, A)`, for instance when there is a single pair color". The Check of §8.1 and the second example of Layer 8, which treat the single-color case, are correct as they stand.

## C01 — The description says the revision does not change `Suggested.lean`, while the pull request removes 163 declarations from it

The description's last section opens "This revision does not change `Suggested.lean`." Against main, the pull request rewrites that file: 163 declarations are removed and three are kept (the definition of §8.1 and the two headline theorems), restated. A reader of the description cannot tell that the Lean targets of Layers 0 to 7 and of §9.1 to §9.3 have left the file.

Text that would be right: "`Suggested.lean` now states only the two headline theorems, the strong approximation theorem of §8.2 and its composition with counting from §9.4, with the definition of §8.1 they need. The 163 other declarations of the file on main are removed: the pinned Tau Ceti proves them, and each is named on an `*In Tau Ceti:*` line of its layer."

## C02 — The counting schedule is antitone in `n` only for `ε ≥ 0`

In §9.2 (line 1276) the sentence "The schedule is antitone in `n`" carries no sign condition, while the sentences on either side state theirs (`ε > 0` before, `ε ≥ 0` after). For `ε = −1` and `k = 2` the schedule is `−1/96` at `n = 1` and `−1/192` at `n = 2`, so it increases. The library lemma `TauCeti.inducedCountingSchedule3_antitone` (`TauCeti/Combinatorics/Hypergraph/Triadic/CountingParameters.lean`, line 125) assumes `0 ≤ ε`. A repair: "For `ε ≥ 0` the schedule is antitone in `n`."

## N01 — Three citations of the graph layers have no theorem number

§3.2 cites Frieze–Kannan by title only, and §4.2 cites Tao by title and Zhao by chapter. A theorem or section number for each (as the arity-3 layers give) would let a reader find the statement compared.

## Previous findings

- The previous review, of head 42247a3, had no finding. Its one small correction (the second term of the exceptional-route prediction bound described as a sum over transversal placements) is repaired: the third bullet of §9.3 now states the term, `m^(k choose 2) (k choose 2) ε · n^k`, and says that it pays the lower-route counting error once for each route of each transversal placement, which that term bounds.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / library or source) | Result | Change |
|---|---|---|---|---|
| §0.1 uniform hypergraphs | `r = 3`, `n = 4`; `n < r` | complete: 4 edges, density 1; two edges: 1/2; by `(4)_3`: 4/24 = 1/6; `n < r`: `n choose r = 0`, density 0 | holds | none |
| §0.2 induced copies | `V = {0..3}`, one red triple | red 3-pattern: 6; all-blue 4-pattern: 0; red-to-red only: 24; `n < k`: 0 | holds | none |
| §0.3 densities | one triple; `K₄⁽³⁾` minus an edge; path; edgeless; `r = 0` | `6m`; 1/5, 1/9, 6/5; inj 12, hom 12 + 18 = 30, 15/128; 24, 48, 3/16; 4, 4/9, 2/3; 81/81, 0; single edge at `r = 0`: 1 or 0 both sides | holds | none |
| §0.3 at `r = 2` | definitions at the pin | `homDensityFin`: `|Hom| / n^k`; `injHomDensity`: injective homs over `(n)_k`; both match §0.3 | holds | none |
| §1.1 block density | `|s| < r`; `s = univ` | 0; the edge density of §0.1 (library lemmas with these hypotheses) | holds | none |
| §1.2 Check and Layer 1 examples | `K_{2,1}`; `K₃`; complete 3-graph on 3 vertices | 4/9, 4/9, Mathlib 1/2 → 4/9; 4/9, 2/3, gap 6/81 + 12/81 = 2/9, deviation 4/9 ≤ 0.471; 2/9, 4/81 | holds | none |
| §1.4 energy comparison | library statement on `Fin m` | graphon partition energy over `P.cellPartition` equals `weightedEnergy G P`; transported form along `V ≃ Fin m` present | matches | none |
| §2.1 almost-refinement | `s = {1..10}`, `P₀`, `P` of the Check | cell `{1}` misses 1 > `δ · 1` for `δ < 1`; cell `{2..10}` misses 1 ≤ `9δ`; global count 2/10 | holds | none |
| §2.3 no large host | library statement | hypotheses: `P₀` equipartition, `0 < ε`; small host: singletons; bound `bound ε ⌈2l/ε⌉` | matches | none |
| §3.2 and Layer 3 example | `C₄`, one part; library bound | deviation `−½(a₁ − a₂)(b₁ − b₂)`, maximum 2 = 16/8; cut norm 1/8; `4^⌈1/ε²⌉` and `4^⌈1/ε²⌉ · #P₀` | holds | none |
| §4.1 exact refinement | library statements | `nestedRefinementBound δ l = bound δ (initialBound δ 0 · l) ≥ l`; second form with `l ≤ |V|`, `l₀ = max l #P₀` | matches | none |
| §4.3 induced counting | library statement; three-vertex hosts | only `0 < F #P` and cell bound `m`; `3τ + 12τ = 15τ`, Mathlib bad-pair mass `< 4ε n²`; counts 0, 6, 2 | matches | none |
| §5.1 graded complexes | filled triangle; face above rank | 6 copies; count 0 when a face has more than `s` elements; both round trips with their hypotheses | holds | none |
| §5.2 pair-color density | singleton with itself; two-element cell | 0 and sum 0; 2/2 = 1 against 2/4 by `|s||t|` | holds | none |
| §6.1 polyads | bounds | support ≤ `|c₀||c₁||c₂|`; at most `t³ m³`; `faceKey = ![k₁₂, k₀₂, k₀₁]` | matches | none |
| §6.3 and Layer 6 examples | six vertices, three cells; one cell | 8 triples; subpolyad 6, red 4, 2/3; `6 N_c / (n)_3` | holds | none |
| §7.1 Check, worked example | restriction to `{0}`, `{2,3}`, `{4,5}` | 4 of 8 triples, blue 1 against 1/2; top-regular exactly for `δ ≥ 1/2` | holds | none |
| §7.2 vertex-box comparison | `|s| = 2`, `ε = 1/2`, `δ = 1/8`, one color | box-regular; `{u} × {u}` deviation 1 > 1/2; library hypotheses `δ ≤ ε²`, `2δ ≤ ε²`, `2 ≤ ε|s|` | holds | none |
| Layer 7, second example | `|A| = 2`, `ε = 1/2`, colors `a`, `rev a` | densities 1/2, 1/2 (positive); every test deviates by ≤ 1/2; pair is regular | sentence false | R01 |
| §8.1 definition and Check | elaborated type; cell with `2 ≤ |A| ≤ 1/f` | five conjuncts in README order; `{v}, {v}`: 0 against 1; regular iff size 1 or > `1/f` | matches | none |
| §8.2 headline | source; `t₀ ≥ 1` on empty host; `F ≥ 1` | Theorem 14: schedule `ε(a)`, edits `νn^k`, perfect regularity; Lemma 25: `s` classes; empty host has 0 cells; `B = t₀³ + t₀ + 1` | supported | none |
| §9.2 parameters | `k = 3`, `ε = 1/10`; `ε = −1`, `k = 2` | 1/1620, `1/(3240 n³)`, 720, `ε/8`; schedule −1/96 at `n = 1`, −1/192 at `n = 2` | antitone needs `ε ≥ 0` | C02 |
| §9.2 local counting | library statement | error `((k choose 2) ε + (k choose 3) η) ∏|φ(i)|`, rank 1, transversal, no density floor | matches | none |
| §9.4 headline | six charges; single cell; Check 2 | `ε/6 + ε/6 + ε/6 + ε/12 + ε/6 + ε/6 = 11ε/12`; 114 against 931/5; 1/8, `(m−1)/(4(2m−1))`, `(m−2)/(4(2m−1))`; 255/4096 > 1/17 | holds | none |
| Record against main | ten layers, items of each | ids 0–9 kept; named bound, complexity predicate, rank schedule, dense-route threshold and slack restated as inequalities, existential bound and rank one | kept | none |
| Description against the change | `Suggested.lean` | description: unchanged; change: 163 declarations removed, 3 kept | contradicted | C01 |

- Source locators checked against the text: 13. RodlSchacht2007Reg lines 254–262 (Theorem 14), 282–300 (Definition 15), 311–317 (Theorem 17), 473–489 (Lemma 25); RodlSchacht2007Count lines 120, 158, 186 (cross-numbering 2.13, 2.16), 189–199 (Theorem 10), 239–250 (Theorem 13); NagleRodlSchacht2006 lines 224–232 (Definition 9), 251–259 (Theorem 12), 299–312 (Corollary 15); Terry2024 lines 328–337 (p. 9), 359–362 (p. 10), 1803–1804 (p. 49); LovaszSzegedy2006 lines 53–58 (§1), 222–227 (§2.4).
- Library declarations opened at the pinned Tau Ceti: about 60, among them `Combinatorics/Hypergraph/Basic.lean` lines 153, 182, 195, 247; `PairColor/Regular.lean` lines 77, 245, 292; `PairColor/VertexBox.lean` lines 126, 159, 174; `Polyad/TopRegular.lean` lines 88, 109, 169; `Polyad/Rank.lean` line 129; `Triadic/Basic.lean` lines 104, 201, 260, 296, 364; `Triadic/CountingParameters.lean` lines 48, 53, 60, 125; `Triadic/PlacedCounting.lean` line 490; `Triadic/InducedCounting.lean` lines 77, 110; `Triadic/ErrorDecomposition.lean` line 159; `Regularity/Graph/FriezeKannan.lean` lines 159, 187; `Regularity/Graph/SeededRegularity.lean` lines 66, 170, 202, 242; `Regularity/Graph/StrongRegularity.lean` lines 139, 160, 222; `DenseGraphLimits/HomDensity/Finite.lean` lines 99, 108. Mathlib: `Combinatorics/SimpleGraph/Regularity/Uniform.lean` line 380, `Regularity/Lemma.lean` line 76, `Combinatorics/Hypergraph/Basic.lean` (no uniformity, density or counting declaration).
- All 326 backticked library names of the README were searched at the pins; every one is declared. The named items of the README on main that the head no longer names (the rank schedule, the dense-route threshold, the slack, the complexity predicate, the named bound) are declared nowhere in the pinned Tau Ceti.
- Cross-roadmap citations resolved on main: DenseGraphLimits Layer 9a (its README line 412, alignment left to this roadmap at line 420), Exchangeability Layer 8 (line 931), CoboundaryExpansion's citation of Layer 5 (its lines 44, 197, 862), kept as §5.1.
- Dependency check: `depcheck: 80 roadmaps, 862 edges, 0 problem(s)`. The automatic checks all passed on this head. The pull request changes nothing outside the folder.
- Elaboration: `Suggested.lean` gives only the `sorry` warning on line 69. The three elaborated types were compared with §8.1, §8.2 and §9.4; no binder is lost. The file is unchanged since the head the previous review probed; by reading, no single tactic closes the sorried existence theorem, and the second theorem is proved from it.
- Headline theorems: the approximation theorem of §8.2 and its composition with counting of §9.4; both are stated, none is declared not statable, nothing is padding.

Overlap check: read DenseGraphLimits (main and its open revision), EquitableOperatorReduction (open), and, by search for the objects, RamseyNumbers (open), Exchangeability and CoboundaryExpansion (main). The graph homomorphism and injective densities are owned by DenseGraphLimits and cited in §0.3; the alignment at `r = 2` is this roadmap's by DenseGraphLimits Layer 9a. RamseyNumbers owns Ramsey numbers of complete uniform hypergraphs, not their densities. Nothing else is shared.

Source independence: 8 passages compared with 5 sources (the statements of §8.1 and §8.2 and the docstring of the sorried theorem against RodlSchacht2007Reg Theorem 14 and Lemma 25; Convention 9 against its Definition 15; the sentences of §9.4 on the sources against RodlSchacht2007Count lines 147–155 and NagleRodlSchacht2006 lines 267–275; the definitions of §0.3 against LovaszSzegedy2006 lines 55–58 and 223–227; the References note against Terry2024 lines 328–337), none shared beyond forced phrases of at most 4 words; largest share RodlSchacht2007Reg, 15 of 31 locators; contents compared with RodlSchacht2007Reg (introduction, notation, regular complexes, partitions, main results, auxiliary results, outline, the two implications): independent.

Research link: Layer 8 is the arity-3 regular approximation lemma of Rödl–Schacht (2007, Theorem 14 with Lemma 25), and Layer 9 the induced counting used with it (Rödl–Schacht 2007; Nagle–Rödl–Schacht 2006), the inputs to hypergraph removal. Rests on README §8.2 and §9.4 and on RodlSchacht2007Reg §1.

## Not verifiable

- The printed numbering of the two Rödl–Schacht papers and of Nagle–Rödl–Schacht: the publishers' pages are paywalled. The README cites the authors' versions explicitly, and those were read.
- Frieze–Kannan, Tao and Zhao: cited without a theorem number (N01); their texts were not opened. The statements they are cited for are proved in the pinned Tau Ceti.
- The Provenance table's descriptions of declarations in the external `regularity-lemmata` library: its files were not opened.
- Terry2024 was read through OCR; the three passages cited are legible, with some symbols garbled.

## Source issues

- none

## For the human reviewers

- Licence: the Provenance section (README lines 1495–1542) cites the public Lean libraries `cameronfreer/regularity-lemmata`, at two pinned commits, and `cameronfreer/graphon` as source references. Their files and licences were not opened in this review.
