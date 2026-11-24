# Review of StronglyRegularGraphsAndDesigns (pull request #3061 at be20d40)

**Verdict:** needs changes

**Summary.** Changes are needed, for two sentences that assert false mathematics; every stated theorem and every `Suggested.lean` signature survived the computed checks. The opening overview says that finite projective planes are the symmetric designs with `λ = 1`, which the roadmap's own Check in 5.4 refutes (the triangle), and the proof route of 2.1 derives `2k − μ ≤ n − 2` from the parameter relation, which fails for `(10, 6, 4, 2)`. There are four small corrections and two format notes, none blocking. Six of the seven cited books could not be read legally, so most locators are unverified; that and a disagreement of Brouwer–Haemers page numbers with three sibling roadmaps are left to the human reviewers.

## R01 (P2) — The overview's sentence that finite projective planes are the symmetric designs with `λ = 1` is false for the roadmap's own definition of a design, and the next sentence drops the hypotheses of 5.5

A reader of the overview (line 23) takes away an equivalence that the layers do not state and that fails. With `Design.IsSymmetricDesign` as defined in the Conventions (`2 ≤ k < v`, `0 < ℓ`), the triangle is a symmetric `2`-`(3, 2, 1)` design: `v = b = 3`, `k = 2`, every two points on one block. It is not a `Configuration.ProjectivePlane`, since `exists_config` at the pinned Mathlib (`Mathlib/Combinatorics/Configuration.lean`, line 334) needs a line missing two distinct points. The negative control of 5.4 says exactly this, and 5.4 itself assumes `2 ≤ q`.

The same kind of slip is in the following bullet (line 25): "a strongly regular graph with `λ = μ` or `μ = λ + 2` gives a symmetric design on its vertices". For Mathlib's predicate the edgeless graph on `n ≥ 2` vertices satisfies `IsSRGWith n 0 0 0`, with `λ = μ = 0`, and its adjacency relation is no design (`0 < ℓ` fails); `2K₂` with `(4, 1, 0, 0)` is another instance. Section 5.5 carries `2 ≤ k < n`, `0 < ℓ` and `1 ≤ k`, `k + 1 < n`.

The smallest change: "finite projective planes are the symmetric designs with `λ = 1` and `k ≥ 3`", and "under the nondegeneracy conditions of 5.5" (or the conditions themselves) in the bullet on strongly regular graphs.

## R02 (P2) — In the proof route of 2.1, `2k − μ ≤ n − 2` does not follow from the parameter relation

An implementer who follows the route (line 244: "`2k − μ ≤ n − 2` and `2k − ℓ ≤ n` follow from the parameter relation") is stuck at the first inequality. The parameters `(n, k, ℓ, μ) = (10, 6, 4, 2)` satisfy everything 1.2 provides: `μ = 2 ≤ 6`, `ℓ = 4 < 6` and `k (k − ℓ − 1) = 6 = (n − k − 1) μ`. Yet `2k − μ = 10 > 8 = n − 2`. So no arithmetic from 1.2 gives the inequality; it needs the graph. (The second inequality does follow: `n − k − 1 = k (k − ℓ − 1)/μ ≥ k − ℓ − 1` when `0 < μ ≤ k`, and `ℓ = k − 1` when `μ = 0`.) The statement of 2.1 is not affected.

The smallest change: take both from the count of a union of two neighbourhoods. Mathlib has `SimpleGraph.IsSRGWith.card_neighborFinset_union_of_not_adj` (`|N(v) ∪ N(w)| = 2k − μ` for distinct nonadjacent `v`, `w`; the union misses `v` and `w`, so `2k − μ ≤ n − 2`) and `SimpleGraph.IsSRGWith.card_neighborFinset_union_of_adj` (`2k − ℓ ≤ n`), in `Mathlib/Combinatorics/SimpleGraph/StronglyRegular.lean`, lines 108 and 114. Add the two names to the `*Needs:*` line of 2.1.

## C01 — Nica does assume connectivity in the three-eigenvalue theorem

In 1.3 (line 192): "Nica states the converse direction for regular graphs without connectivity; the Checks show that it is needed." In the arXiv version of the text (arXiv:1609.08072v1, where the theorem is numbered 9.11), the opening section on notions says that graphs are assumed connected unless otherwise mentioned (N line 110), so the theorem is stated for connected graphs and is correct there. The Check with `2K_{3,3}` is still a good one for the hypothesis. Would "Nica assumes connectivity throughout; the Checks show that it is needed" do? I read the arXiv version, not the EMS edition cited; if the book drops the convention, keep the sentence and say where.

## C02 — The one-sentence boundary claims more than the section it closes

In Scope and ownership (line 776): "everything about a strongly regular graph except its spectrum and the consequences of the spectrum, and everything about a single `2`-design, is here". The same section places outside the scope the constructions from codes, geometries and groups and Hadamard matrices, leaves the Paley graphs to PaleyGraphsAndCharacterSums and the correspondence with regular two-graphs to no roadmap, and lists polarities and rank-three graphs as beyond the roadmap. A reader looking for an owner of, say, residual designs would be sent here wrongly. The pull request description repeats the sentence. A sentence that lists what is here (the equation, the two-class scheme, the families of Layer 3, the designs of Layers 5 and 6) would be true.

## C03 — Six statements of `Suggested.lean` are API or small cases, not headlines

`IsSRGWith.le_of_ne_top`, `IsSRGWith.lt_of_ne_bot`, `IsSRGWith.param_eq_real` and `IsTwoDesign.card_blocks_mul` are one-count lemmas used by later targets; `cycleGraph_five_isSRGWith` is a check on five vertices; `projectivePlane_order_ne_six` is the Bruck–Ryser theorem at one value. None closed with one tactic in my probe (`decide`, `simp`, `simp_all`, `exact_mod_cast` with `SimpleGraph.IsSRGWith.param_eq`), so they are not vacuous, but as acceptance tests they ask an implementer for little beyond what the neighbouring headline already asks. If they are kept as sanity checks, say so in their docstrings; otherwise the README keeps them as targets.

## C04 — `IsSRGWith.param_eq_real` needs a vertex, not an edge

The statement of 1.2 assumes `G ≠ ⊥`. For an edgeless graph on a nonempty type both sides vanish: `k = 0`, and `μ = 0` or `n = 1` (for `IsSRGWith 3 0 7 0`: `0 · (0 − 7 − 1) = 0 = (3 − 0 − 1) · 0`). The hypothesis only excludes the empty vertex type, where `IsSRGWith 0 k ℓ μ` holds for all parameters. The hypothesis `0 < n` of Mathlib's `SimpleGraph.IsSRGWith.param_eq` would state the result at its natural generality; `G ≠ ⊥` is also fine if the consumers only have that.

## N01 — The trailing block of forty `#check` lines in `Suggested.lean` repeats the supplier contracts of the README; the `/-! ## … -/` header above it has no declaration under it. Either is harmless; the README list is the one a reader uses.

## N02 — The section "Beyond this roadmap (a roadmap for a roadmap; do not implement)" holds three statements that belong to no layer, against the house rule that nothing is deferred. Since they are attributed and clearly marked, a line in Scope and ownership naming them as outside the scope would say the same.

## Questions for the author

- Which printing do the Brouwer–Haemers page numbers refer to? This README has Theorem 9.1.2 on p. 117, Theorem 9.1.3 on p. 118, §9.1.7 (iv) on p. 119 and Theorem 11.4.2 on p. 171; StronglyRegularAndMooreGraphs 1.2 and 3.5 give pp. 115, 116 and 117 for the first three, and AssociationSchemes 3.1 gives p. 167 for the last. I could not read either the printed book or another legal copy, so I cannot say which is right.
- In 1.3, is it the case that Brouwer–Haemers state Theorem 9.1.2 (iii) without regularity? The counterexample in the Checks (`K₂` with two isolated vertices, restricted eigenvalues `−1` and `0`) is correct; I could not read the theorem to confirm the attribution, and if it holds it is an error in the source worth recording.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 equation, both directions | empty `V`; one vertex; `K_n`; edgeless; Petersen; `C₆` | diagonal `(k−μ)+μ = k`, edge `ℓ`, nonedge `μ`; Petersen `A² = −A+2I+J`; `C₆` nonedge entries `1` and `0` | holds | none |
| 1.1 real coefficients | graph with edge and nonedge; `⊤`; `⊥` | `k = b+c`, `ℓ = a+c`, `μ = c`; `⊤`, `⊥` by Mathlib's two lemmas | holds | none |
| 1.2 parameter bounds | `K₃` as `(3,2,1,5)`; edgeless `(3,0,7,0)`; Petersen; `3K₃` | `5 > 2`; `7 > 0`; `3·2 = 6·1`; `2·0 = 6·0` | holds; hypotheses needed for the bounds | C04 for the relation |
| 1.3 two restricted eigenvalues | `3K₃`; `C₆`; star `K_{1,3}`; `K₂ ∪ 2K₁` | `{2,−1}`; `{1,−1,−2}`; `{0}`; `{−1,0}` with degrees `1,1,0,0` | holds; regularity needed | none |
| 1.3 three eigenvalues | `2K_{3,3}`; empty `V` | eigenvalues `3,0,−3`, common neighbours `0` and `3` on nonedges; `Connected` false on empty | holds; connectivity needed | C01 (attribution) |
| 2.1 complement roots | Petersen/`T(5)`; `3K₃`/`K_{3×3}`; `(16,5,0,2)`; parameters `(10,6,4,2)` | `Δ' = Δ`; `(1,−2)↔(1,−2)`; `(2,−1)→(0,−3)`; `(1,−3)→(2,−2)`; `2k−μ = 10 > 8` | statement holds; route step fails | R02 |
| 2.2 two classes | Petersen; `K₄`; `C₆` | `(1,1)` counts `3,0,1`; class `2` empty; counts `1` and `0` inside class `2` | holds | none |
| 2.3 idempotents, eigenmatrix | Petersen; `(16,5,0,2)`; `3K₃`; `2K₂`; `K_{m×a}` | `J/n+E_r+E_s = I`; `A = kJ/n+rE_r+sE_s`; rows `(1,3,6),(1,1,−2),(1,−2,1)`; `tr E_r = 5, 2, 1` | holds, also at `μ = 0` and `μ = k` | none |
| 2.4 Krein | `(28,9,0,4)`; Petersen; `3K₃`; `K_{3×2}`; `(16,5,0,2)` | `24 ≤ 16` fails, `q²₂₂ = −4/9`; `0≤4, 3≤4`; `0≤0, 0≤9`; `4≤4, −2≤2`; `0≤24, 8≤8` | holds | none |
| 3.1 families (truncated parameters) | `T(m)`, `K_m □ K_m` for `m = 0..7`; `K_{m×a}`, `mK_a` for `m, a = 0..4` | all 66 instances satisfy the stated parameters by enumeration | holds | none |
| 3.2 pentagon, Petersen, Hoffman–Singleton | the Lean relation on `Bool × ZMod 5 × ZMod 5`; pentagram step `+1` | `(50, {7}, {0}, {1})`; with step `+1` nonedge counts `{0,1,2}`, the named pair has `2` | holds; definition pinned by the control | C03 (pentagon) |
| 4.1 uniqueness | labelled completions; pentagonal prism | `8/2 = 4` hexagons with the three pairs antipodal; prism nonedges `10, 10, 10` with `0, 1, 2` common neighbours | Checks true | none |
| 5.1 designs, Gram identity, rank | Fano; `AG(2,3)`; two Fanos; one block `{1,2,3}`; `k = 1` | `r = 3, 4, 6`; `b = 7, 12, 14`; `NNᵀ` first row `3,1,…,1`; `r = ℓ` singular; infinite `L` impossible | holds | none |
| 5.2 symmetric designs, dual | Fano; complement `(7,4,2)`; `AG(2,3)` | `bk = vr`; `NᵀN = N⁻¹(NNᵀ)N`; blocks meet in `1`, `2`; `0` or `1` | holds | none |
| 5.3 incidence graph spectrum | Fano; triangle; `PG(2,3)` | `k + ℓ(v−1) = k²`; `3,−3,(±√2)⁶`; `2,−2,(±1)²`; total `2v` | holds; agrees with N Theorem 9.18 (arXiv) | none |
| 5.4 projective planes | order `q ≥ 2`; triangle `q = 1` | `1 < order` in Mathlib gives `2 ≤ k`; triangle: each line misses one point | holds; overview sentence false | R01 |
| 5.5 designs and SRGs | `AG(2,3)`; pairs of a 6-set; two Fanos; `J(6,3)`; edgeless; `C₄` | `(12,2,1,0)`, `(12,9,6,9)`; `(15,6,1,3)`, `(15,8,4,4)`; `(14,1,0,0)`, `(14,12,10,12)`; `{0,4}`; `ℓ = 0` | holds with the stated hypotheses | R01 |
| 6.1 determinant, even case | Fano; `(16,6,2)`; `(22,7,2)` | `det² = 576 = 3²·2⁶`; `4`; `42 = 42`, `5` not a square | holds | none |
| 6.2 congruence, odd case | `(7,3,1)`; `(13,4,1)`; `(111,11,1)`; `v ≡ 1, 3 (mod 4)` | `m+ℓv = k²`; `ℓv = k²−m`; `1 = 2−1`; `1 = 0+1`; `1 = 10−9`; cancellation leaves `⟨1,mv⟩≅⟨m,v⟩`, `⟨m,mv⟩≅⟨1,v⟩` | holds | none |
| 6.3 Bruck–Ryser | `q ≤ 30`; `q = 6`; `q = 10` | `q(q+1)/2` odd iff `q ≡ 1,2 (mod 4)`; exceptions `6,14,21,22,30`; `10 = 9+1` | holds | C03 (order six) |

- Source locators checked against the text: 3 (N Theorems 8.11, 8.15, 8.18, read as Theorems 9.11, 9.15, 9.18 of arXiv:1609.08072v1, N lines 2655, 2716–2733, 2772); all support the statements; the other 59 locators are in texts I could not read.
- Library declarations checked at the pin: the 33 Mathlib ones the file pins, 14 of them opened in source (`Combinatorics/SimpleGraph/StronglyRegular.lean` lines 51, 61, 87, 108, 114, 160, 169, 206; `Combinatorics/Configuration.lean` lines 72, 216, 334, 351, 415, 438, and the rest through `#check`) and 7 in Tau Ceti (`LinearAlgebra/Matrix/Rank.lean` line 191; `QuadraticForm/Witt/Cancellation.lean` lines 196, 205; `Witt/Round.lean` lines 44, 61; `QuadraticForm/Representation.lean` lines 174, 197); every one exists with the signature the README states.
- Cross-roadmap citations resolved: 25 sections, each found at the head of its open pull request or on main, those a statement relies on read in full (GraphSpectra 1.2, 2.4, 2.5, 3.2, 3.8; StronglyRegularAndMooreGraphs 1.1–1.5, 2.1, 3.1–3.5; AssociationSchemes 1.1, 1.2, 2.1, 3.1, 5.1; PeriodicNonnegativeMatrices 3.3; SpectralGraphBounds 1.1; TopologicalCombinatorics 3.1; LinearAlgebraMethodInCombinatorics 1.3; the neighbours' sections). The twelve copied definitions agree with their owners' text; each has its own fully qualified name.
- Elaboration: `Suggested.lean` elaborates at the pins with 40 `sorry` warnings and no error; 40 theorems, no `set_option`, no sorried data. `#check @name` types compared with the README: the dropped instance binders (`DecidableEq`, `Fintype`) are unused by the definitions concerned; nothing changed.
- Padding probe: nine statements tried with one tactic; none closed.
- Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD or CYCLE line. The six open suppliers are pull requests that add new roadmaps.
- Duplication: no other roadmap, open or on main, states `2`-designs, symmetric designs, the Bruck–Ryser–Chowla theorem, the two-class scheme of a graph, or the strong regularity of the families of Layer 3; Mathlib has `IsSRGWith` for none of them. Ownership was checked against the open pull requests with the search tool.
- Overlap check: read StronglyRegularAndMooreGraphs, GraphSpectra, AssociationSchemes, GraphSymmetryAndCayleyGraphs, PaleyGraphsAndCharacterSums, DelsarteTheoryOfCodesAndDesigns; nothing shared (the roots `r`, `s` are owned by StronglyRegularAndMooreGraphs 1.2 and copied; the Krein conditions for schemes are AssociationSchemes 3.1 and specialized here; Fisher's inequality is LinearAlgebraMethodInCombinatorics 1.3 and cited).

Source independence: 5 passages compared with 1 source (N), none shared; largest share BH, about 33 of 62 locators; contents of BH not read, and by the README's own locators the layers do not follow a run of its sections (Layer 1 ↔ §9.1.3, Layer 2 ↔ §11.1–11.4 and §9.1.8, Layer 3 ↔ §9.1.1 and §9.1.7, Layer 5 ↔ GR §5.10, Layer 6 ↔ BVM §8.3.1).

Research link: Layers 1–4 state the theory of strongly regular graphs treated in Brouwer–Van Maldeghem 2022 and Brouwer–Haemers 2012; Layer 6 is the Bruck–Ryser–Chowla theorem as in Brouwer–Van Maldeghem, Theorem 8.3.1; the uniqueness of the Hoffman–Singleton graph (Hoffman–Singleton 1960) is named as the extension. Rests on the README's references.

## Not verifiable

- BH (Brouwer–Haemers, *Spectra of Graphs*): paywalled at the publisher; the copy on the first author's page was refused because its address does not name him. All 33 locators unverified, including the attribution in 1.3.
- BVM (Brouwer–Van Maldeghem): same situation; 7 locators unverified, including Theorem 8.3.1 for 6.1 and 6.2.
- GR (Godsil–Royle), CRS, BCN, Biggs: no legal copy found; 19 locators unverified (all of 5.1, 5.2, 5.4).
- N (Nica): read in the arXiv version, where the three theorems are numbered 9.11, 9.15 and 9.18 on pp. 55–58; the EMS numbering 8.11, 8.15, 8.18 and pp. 76–80 were not seen.
- Hoffman–Singleton 1960: not read; cited only in the section beyond the roadmap.

Automatic checks set aside as false positives: none (the header without a declaration under it is real and is N01).

## Source issues

- none

## For the human reviewers

- Not tested: BH has the largest share of the locators (about 33 of 62) and could not be read, nor its table of contents; wording and arrangement were compared with N only.
- Licence: BH and BVM are on the first author's own page at an address that does not carry his name, so the sources service refused them; a human can confirm the page and supply the texts.
- Locators: BH page numbers here differ by 2 to 4 pages from StronglyRegularAndMooreGraphs 1.2 and 3.5 and AssociationSchemes 3.1 for the same theorems (README line 133 against those sections); one set is not the printed pagination.
- Practice: `Suggested.lean` copies twelve definitions from six roadmaps that are still open pull requests (lines 44–181), under its own namespace; whether that is the wanted way to state targets before the suppliers merge is a project decision.
