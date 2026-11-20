# Review of Regularity (pull request #2631 at 4d44900)

**Verdict:** needs changes

**Summary.** The verdict is needs changes, for one finding: the first Check of §8.2 is false in two degenerate cases (t₀ = 0, and an empty top palette), and a one-clause hypothesis repairs it. The two headline theorems in `Suggested.lean` say what §8.2 and §9.4 say, and the sampled locators support the statements as written. These are Rödl–Schacht Theorems 14 and 17, Lemma 25 and Definition 15; the counting paper's Theorems 10 and 13; Nagle–Rödl–Schacht Definition 9, Theorem 12 and Corollary 15; Terry Definition 2.15 and Theorem 2.19; and Lovász–Szegedy §1 and §2.4. Every other Check and worked example recomputes. There are three small corrections, no format notes and two questions; the human reviewers have one licence fact to look at.

## R01 (P2) — The first Check of §8.2 fails for t₀ = 0 and for an empty top palette

As written, the Check claims two things the statement of §8.2 does not force at boundary values it admits (`t₀ : ℕ`, any finite `κ₃`). The Check reads (§8.2, Checks, line 306): "The bound satisfies `B ≥ t₀`, so no version without a large-host hypothesis holds."

The first failure is at t₀ = 0. On n vertices, take the partition into singletons, one pair color, all polyads and `H′ = H`. Each test set of a singleton cell is the whole cell, so pair-color regularity holds at every positive parameter (the library's `PairColorSystem.isRegularPair_singleton`). Each polyad support has at most one triple, so the only nonempty test union is the whole support, and top regularity holds at every positive tolerance. The complexity is `n + 1 + n³`. With `B₀` from §8.2 at t₀ = 0, every host then has a complex of complexity at most `max(B₀, B₀³ + B₀ + 1)`, so at t₀ = 0 a version without a large-host hypothesis does hold.

The second failure is an empty palette. `TauCeti.Colored3Graph κ₃ V` is a function from the triples of `V` to `κ₃` (Tau Ceti `Hypergraph/Colored/Basic.lean`, line 27). For `κ₃` empty, no set with at least three elements has a coloring. So `B = 3` satisfies `exists_strong_regular_approximation3` for every t₀, t₀ = 10 included, which contradicts "B ≥ t₀".

The smallest repair is: "For t₀ ≥ 1 no version without a large-host hypothesis holds (the empty host already fails), and when `κ₃` is nonempty every admissible bound satisfies `B ≥ t₀`." The rest of the Check can stay as it is.

## C01 — The guide to the build misstates what §0.1 depends on

"How to read the build" says (line 52) that §0.1 depends only on the carriers of Conventions 3 and 5. §0.1 uses no coloring of triples (Convention 5). Its last API bullet and its *Needs:* line use DenseGraphLimits' `homDensityFin` and `injHomDensity`, and Layer 0's own Dependencies (line 187) list them. A suitable replacement is: "§0.1 depends only on the uniform hypergraphs of Convention 3 and, for the comparison at `r = 2`, on DenseGraphLimits' graph densities."

## C02 — DenseGraphLimits is listed as a downstream consumer, although it is a supplier

The third bullet of "Downstream consumers" (line 477) lists DenseGraphLimits. That roadmap consumes nothing from this one: its Layer 9a says that neither roadmap depends on the density adapters. Conversely, §0.1 consumes its `homDensityFin` and `injHomDensity`. A reader can take the bullet for a supply cycle. The bullet's content would read correctly as part of the DenseGraphLimits item under "Owned elsewhere" in Scope and ownership, or under a heading such as "Interfaces".

## C03 — The Scope table compares the library with statements the README no longer contains

Several entries compare the library's statements with the roadmap's earlier wording, which a reader of this text cannot find:

- the last column says "smaller than `4^(⌈1/ε²⌉+1)`" (line 553), "constant `15` in place of `16`" (line 554), "the factor `k³` is `k choose 3`" (line 561) and "needs no large-host hypothesis" (line 552);
- the paragraph after the table says "in place of a rank schedule built from a required rank" (line 568).

Each would be self-contained if it stated the library's form alone, for example "the bound is `4^⌈1/ε²⌉`". Alternatively, each could name and cite the published statement being compared.

## Questions for the author

- The References say that the Rödl–Schacht theorem numbers are those of the preprint, and that the printed regularity paper renumbers them (2.13, 2.16). Are "Theorems 10 and 13" of *Counting Lemmas* and "Definition 9, Theorem 12, Corollary 15" of Nagle–Rödl–Schacht also preprint numbers? They are the numbers of the versions on Schacht's web page. I could not open the printed versions (Cambridge Core and Wiley are paywalled). If they are preprint numbers, the preprint sentence could cover both papers.
- The route of §8.2 says (lines 291–293) that the lower skeleton is regularized by `szemeredi_regularity` and `SimpleGraph.exists_regular_equipartition_almost_refining`, applied to the pair-color classes. Both allow an ε-fraction of non-uniform pairs. `PairSkeleton3.IsPairColorRegular` (Tau Ceti `Hypergraph/PairColor/Regular.lean`, line 245) admits none. Is the intended step to recolor the pairs of irregular cell pairs, as Rödl–Schacht's pair-level regular approximation does, and to charge the affected triples to the exceptional mass? The sketch does not say, and I could not settle the intended step from the text.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / library or source) | Result | Change |
|---|---|---|---|---|
| §0.1 densities (sampled) | one triple; 6 vertices, 4 edges | brute force hom = inj = 24; t₀ = 24/120 = 1/5, t = 24/216 = 1/9; `n choose 3` variant 6/5 | holds | none |
| §0.1 Check 2 | `K₄⁽³⁾` minus {1,2,3}; two triples sharing a pair | inj 12, hom 30, t₀ 1/2, t 15/128, 18 non-injective; complete: 24, 48, 3/16 | holds | none |
| §0.1 degenerate and r = 2 | path with `K₂`; edgeless 4-vertex pattern in 3 vertices; `K₃`, `C₄` | 4, 4, 4/9, 2/3; hom 81, inj 0, `(3)_4 = 0` so t₀ = 0; 6, 6; 8, 8 | holds | none |
| §0.1 against Lovász–Szegedy §1, §2.4 | normalizations | source t = hom/n^k (p. 2), t₀ = inj/(n)_k (p. 6); README equal, zero when `n < k` | supported | none |
| §8.1 definition | Lean body against README; constant coloring, t cells, one color | five conjuncts identical; complexity t+1+t³; cell regular iff size 1 or > 1/f | holds | none |
| §8.1 API | monotonicity, edit transfer | `IsPairColorRegular.mono`, `TopRegularOverMostPolyads.mono`, `Approximates3.trans` at pin; δ ≥ discrepancy ≥ 0 | holds | none |
| §8.2 headline (sampled) | RS Thm 14 (p. 6), Lemma 25 (p. 10), Thm 17 (p. 7) | perfect ε(a)-regularity, \|GΔH\| ≤ νn³, s classes, P ≺ O; take ν = ε/6, ε(a) ≤ min(F(t+m), F(cx)²/2^R(cx)) | supported | none |
| §8.2 rank bridge | `of_rank_one` (`Polyad/Rank.lean` l. 129) | rank one at δ gives rank r at ε′ when 2^r δ ≤ ε′², ε′ > 0; matches README | holds | none |
| §8.2 Check 1 | t₀ = 0 singleton complex; κ₃ empty, t₀ = 10 | complexity n+1+n³, all conditions hold; B = 3 valid, below t₀ | false | R01 |
| §8.2 Check 2 | F ≥ 1, t₀ ≥ 1 | test sets forced to whole cells; top deviation ≤ 1 ≤ F; complexity t₀+1+t₀³ ≤ B | holds | none |
| §8.2 example | one cell, one color | complexity 1+1+1 = 3; regular iff n = 1 or n > 1/f | holds | none |
| §9.4 counting estimate (sampled) | library lemma hypotheses (`InducedCounting.lean` l. 110) | §8.1 conjuncts plus cells and r ≥ 1; Lean derivation elaborates | holds | none |
| §9.4 parameters | k = 3, ε = 1/10, m = 2 | (1/60)/27 = 1/1620; 1/(3240 n³); ⌈720⌉ = 720; route budget ε/8 | holds | none |
| §9.4 Check 1 | n = 7, 19 triples of color c | prediction 6·19 = 114 = count; n³ variant 343·114/210 = 931/5 | holds | none |
| §9.4 Check 2 | n = 2tm, X half of each cell | count ≈ n⁴/16; red densities ≤ 1/8, (m−1)/(4(2m−1)), (m−2)/(4(2m−1)); gap 255/4096 ≈ 0.0623 > 1/17 | holds | none |
| §9.4 sources | RS Count Thms 10, 13 (pp. 4–5); NRS Thm 12, Cor 15 (pp. 5–6) | two-sided dense counting; two-sided cliques; general pattern from below | supported | none |
| Convention 9 | RS Def 15 (pp. 6–7); NRS Def 9 (p. 4) | unions of r not-necessarily-disjoint sub-hypergraphs of the polyad | supported | none |
| §8.1 Terry locators | Def 2.15 (p. 9), Thm 2.19 (p. 10), p. 49 | pair classes on V_i×V_j for all i, j including i = j; ε₂ evaluated at ℓ; arbitrary sub-bigraphs | supported | none |
| Worked examples | `K_{2,1}`; `C₄`; polyad on six vertices | weighted energy 4/9 and 4/9, Mathlib 1/2 to 4/9; cut discrepancy 2, cut norm 1/8; 8 triples, 1/2, box 1, δ ≥ 1/2 | holds | none |

- Source locators checked against the text: 15 (RodlSchacht2007Reg lines 254, 282, 311, 473, and the companion's citations at RodlSchacht2007Count lines 120 and 158; RodlSchacht2007Count lines 189 and 239; NagleRodlSchacht2006 lines 224, 251, 299; Terry2024 lines 328, 359, 1803; LovaszSzegedy2006 lines 57 and 222).
- Library declarations: all 265 library names the README backticks resolve at the pins (Tau Ceti 2fd255d, Mathlib 1b1ccf4). About 30 were opened in full, among them `Hypergraph/Triadic/Basic.lean` lines 88–364, `PairColor/Regular.lean` lines 77, 245 and 292, `Polyad/TopRegular.lean` line 88, `Triadic/CountingParameters.lean` lines 48–61 and `DenseGraphLimits/HomDensity/Finite.lean` lines 99 and 108.
- §0.1's hypergraph densities are absent at the Tau Ceti pin (there is no hom-density module under `Hypergraph/`), so this roadmap owns them.
- Cross-roadmap citations resolved: DenseGraphLimits Layer 9a (on main and at its open revision), Exchangeability Layer 8 (exchangeable arrays and Aldous–Hoover), and CoboundaryExpansion's "Regularity, Layer 5", which the Scope table maps to `TauCeti.HypergraphComplex`.
- Automatic checks: all passed. Dependency check output: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the `sorry` warning on line 69. `#check @` of all three declarations matches the README statements, and no binder is lost. The one-tactic probe (`simp`, `rfl`, `infer_instance`) does not close §8.2. Proving §8.2 for an arbitrary `R` from `max R 1` elaborates, so the hypothesis `R ≥ 1` is the source's convention and costs nothing.

Overlap check: read DenseGraphLimits (main and its open revision), EquitableOperatorReduction (open), Exchangeability and CoboundaryExpansion (main). The one shared object is the homomorphism and injective densities of finite graphs, owned by DenseGraphLimits and cited in §0.1. EquitableOperatorReduction excludes graph regularity. Nothing else is shared.

Source independence: 21 passages compared with 5 sources: the 15 locators, plus the Summary, Convention 8, the conditions of §8.1, the route list of §9.4 and the docstrings of §8.1 and §8.2 in `Suggested.lean`. None is shared beyond standard phrases, at most 5 consecutive words ("the number of injective homomorphisms", LovaszSzegedy2006 line 224). The largest share is RodlSchacht2007Reg, 12 of 31 locator mentions. Contents compared with RodlSchacht2007Reg §§1–6: independent. Layers 0 and 9 have no counterpart there, and Layer 8 matches only the statements of §2.4.

Research link: Layer 8 is the arity-3 case of the Rödl–Schacht regular approximation lemma (2007, Theorem 14 with Lemma 25), a core tool of the hypergraph regularity method. Layer 9 is the induced counting lemma used with it (Rödl–Schacht 2007; Nagle–Rödl–Schacht 2006), the input to hypergraph removal. Rests on README §8.2 and §9.4 and on RodlSchacht2007Reg §1.

## Not verifiable

- The printed numbering of Rödl–Schacht, *Counting Lemmas* (CPC 16, 887–901) and of Nagle–Rödl–Schacht (RSA 28): the Cambridge Core and Wiley pages are paywalled. The author-page versions were read.
- Terry2024 p. 49 is an image-only page, read through OCR. The sub-triad definition is legible; one inclusion reads as `E_{A′C′} ⊆ E_{AB}`, which may be an OCR slip, so it is not reported as a source issue.
- The Provenance table's descriptions of declarations in the external `regularity-lemmata` library: its files were not opened.

## Source issues

- none

## For the human reviewers

- The Provenance section (README lines 484–531) cites the public Lean library `cameronfreer/regularity-lemmata` at a pinned commit, and the library `cameronfreer/graphon`. The GitHub page of the former states Apache-2.0, and none of the three `Suggested.lean` names appears on its top-level page. Its files were not searched.
