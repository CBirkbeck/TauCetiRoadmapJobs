# Review of GraphSymmetryAndCayleyGraphs (pull request #3060 at 9460fd7)

**Verdict:** needs changes

**Summary.** Changes are needed, for two reasons: a Check in 1.2 justifies a true conclusion with false neighbour counts, and the equitability of automorphism-orbit partitions, which 1.2 states and the scope section claims, is also owned by the open roadmap EquitableOperatorReduction, which the README never names. Every stated theorem survived the degenerate-case pass and `Suggested.lean` elaborates with `sorry` as its only warning. There are four small corrections and three format notes, none blocking. One point is left to the human reviewers: the source with the largest share of the locators (Godsil–Royle) could not be read, so wording and arrangement were not compared with it.

## R01 (P2) — The negative control of 1.2 on `P₃` counts the neighbours in the wrong cell, and the counts it states are false

A reader who recomputes the Check finds that it does not exhibit the failure of equitability it announces. In the Checks of 1.2 (README line 207) the text says, of the partition of `P₃` into `{end}` and `{middle, other end}`: "the middle vertex has one neighbour in its own cell, the other end has none."

Write the path as `a – b – c` with cells `{a}` and `{b, c}`. The neighbours of `b` are `a` and `c`, one of them (`c`) in the cell `{b, c}`. The only neighbour of `c` is `b`, which lies in `{b, c}`: so `c` has one neighbour in its own cell, not none. Counted in the own cell, the two vertices agree (1 and 1), which is what an equitable partition would show. The partition is not equitable because of the other cell: `b` has one neighbour in `{a}` and `c` has none.

Smallest change: "the middle vertex has one neighbour in the cell `{end}`, the other end has none."

## R02 (P2) — The equitability of automorphism-orbit partitions has two owners: 1.2 here and the open roadmap EquitableOperatorReduction

Two roadmaps that each plan the same statement give an implementer two targets for one theorem and no rule for which carrier wins. In 1.2 (README lines 170–177) the items "Orbit-constant vectors" and "Orbits are equitable" state that `A` preserves the functions constant on the orbits of a group of automorphisms and that neighbour counts into an orbit are constant on orbits; the scope section (lines 871–872) lists under "Owned here" "the invariance of orbit-constant vectors and the equitability of orbit partitions of groups of automorphisms".

EquitableOperatorReduction (pull request #257, a new roadmap, at its open head) plans the same: its Layer 1 lists the "equivalence among constant block-row sums, preservation of cell-constant vectors" and "automorphism-orbit partitions as equitable partitions" (README lines 112–119 there), and its Layer 5 lists the adapter "orbit partitions under graph automorphisms" for `SimpleGraph.adjMatrix` (line 189). GraphSpectra, this roadmap's own supplier, already names that roadmap as the owner of equitable partitions in its scope section. This README does not mention EquitableOperatorReduction anywhere; only the pull request's description says it "is not used".

Smallest change, either of two. (a) Cite EquitableOperatorReduction Layers 1 and 5 for the two items, list it under "Consumed, not restated", and drop the clause from "Owned here"; `card_adj_mem_orbit_eq` and `adjMatrix_mulVec_comp_eq` then leave `Suggested.lean`. (b) Keep the two items as a variant and say so in the scope section, in one clause that states how they differ from that roadmap's statements (for instance: stated directly for a subgroup of `G ≃g G` and neighbour counts, with no cell-map carrier and no quotient matrix), with EquitableOperatorReduction named under "Not owned here" as the owner of equitable partitions and their quotient matrices.

## C01 — The proof sketch of the matrix criterion uses the opposite convention for the permutation matrix from the one the statement names

The statement of 1.2 is made with `σ.permMatrix R`, and the sketch (README lines 190–191) says "the `(x, y)` entry of `P_σ A` is `A_{σ⁻¹x, y}` and that of `A P_σ` is `A_{x, σ y}`", then "`f ∘ φ⁻¹` is `P_φ f`". Mathlib's matrix has entry `(i, j)` equal to `1` when `j = σ i` (`PEquiv.toMatrix`, `Mathlib/Data/Matrix/PEquiv.lean:54`), so `(P_σ A)_{xy} = A_{σx, y}`, `(A P_σ)_{xy} = A_{x, σ⁻¹y}` and `P_φ f = f ∘ φ`; the vector `f ∘ φ⁻¹` is `P_{φ⁻¹} f`. This is also the convention of Brouwer–Haemers §1.6. The theorem is unaffected (both conventions give the same criterion), but an implementer following the sketch gets every index inverted. Either rewrite the two entries and the eigenspace step for `permMatrix`, or say that `P_σ` in the sketch denotes `σ⁻¹.permMatrix`.

## C02 — The scope section says Tau Ceti has two results that I could not find at the pin, and names no declaration

In "Scope and ownership" (README lines 922–924): "The Fourier isomorphism of the group algebra of a finite group and the characterization of non-backtracking walks through their edge lists are formalized in Tau Ceti; the routes of 5.2 and 7.1 may use them". At the pinned Tau Ceti, the only Fourier statements under `RepresentationTheory` concern compact groups and the circle; for finite groups there is the existence statement `TauCeti.exists_algEquiv_pi_matrix` (`RepresentationTheory/CharacterTable/Wedderburn.lean:135`), which 5.2 already cites, and no isomorphism given by `f ↦ (∑_g f(g) ρᵢ(g))ᵢ`. Under `Combinatorics` the only backtracking statements are path reduction for Serre graphs, not `SimpleGraph` walks. Name the two declarations with their modules, or drop the sentence.

## C03 — Three statements of `Suggested.lean` ask an implementer for nothing

On a copy of the file, `existsUnique_mulLeftHom_apply_eq` closes with one term, `⟨y * x⁻¹, inv_mul_cancel_right y x, fun g hg => eq_mul_inv_of_mul_eq hg⟩`: it is the statement that left multiplication in a group is regular, with `mulLeftHom` unfolded. `isWalkRegular_iff_adjMatrix_pow` closes with `simp [IsWalkRegular, adjMatrix_pow_apply_eq_card_walk]`. `circulantGraph_eq_addCayley` closes with `ext x y; simp [circulantGraph, addCayley_adj, neg_add_eq_sub]; grind`. If they are kept as sanity checks of the definitions, mark them as such in their docstrings; otherwise the README items carry them and the Lean file can state only what needs the roadmap's work (for the first, the regular action is already inside `exists_iso_mulCayley_iff`).

## C04 — The retraction theorem of 4.1 assumes connectivity and finiteness that its own route does not use

The suggested proof of `exists_retraction_mulCayley` takes `Γ = G ≃g G`, `S = cayleySet (G ≃g G) G v`, `r g = g v` and `f x` an automorphism carrying `v` to `x`; it uses a base vertex and vertex-transitivity only. On `2K₃`, which is vertex-transitive and disconnected, the same construction gives a retraction (`Γ` of order 72, `|S| = 24`). The hypothesis `G.Connected` serves only to make `V` nonempty, and `Fintype V` only to make `Γ` finite. The statement is true as written and matches Godsil–Royle's formulation; the README would be more accurate saying which hypotheses the conclusion needs (`Nonempty V`, with finiteness giving a finite group), or keeping them with a clause that they follow the source.

## N01 — `Suggested.lean` opens with `module`, `public import` lines and `@[expose] public section` where the house form is the single line `import Mathlib` followed by the `TauCeti.*` modules; its docstring title is "suggested statements" rather than "target signatures".

## N02 — For the regularity of Cayley graphs, 3.1 cites Brouwer–Haemers §1.4.9 "for commutative groups" while the Lean docstring cites §6.3; §6.3 states the valency `|S|` for arbitrary groups, so the README could cite it too.

## N03 — The Conventions say "All six are defined here" after a bullet that names five notions (the three transitivities, `s`-arcs, `IsSArcTransitive`); the sixth, `IsWalkRegular`, is in 2.1.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 arc-transitive ⇒ vertex- and edge-transitive | `K_{1,3}`; `K₂ ⊔ K₁`; empty `V` | `K_{1,3}`: darts leaf→centre and centre→leaf in 2 orbits, not arc-transitive; isolated vertex breaks VT; empty: both sides vacuous | holds | none |
| 1.1 `exists_orbit_bipartition` | `K_{1,3}`; `K₂ ⊔ K₁` | orbits `{centre}`, `{leaves}` = colour classes; with isolated vertex the edge lies in one orbit | holds; hypothesis needed | none |
| 1.1 even degree | `C₅`; count on dart orbits | two dart orbits swapped by reversal, `n·a = n·b`, degree `2a`; `C₅` arc-transitive so hypothesis fails | holds | none |
| 1.2 matrix criterion | `P₃`, end swap and end–middle swap; `permMatrix` entries | `(PA)_{xy} = A_{σx,y}`, `(AP)_{xy} = A_{x,σ⁻¹y}`; end swap: both sides true; end–middle: both false | holds; sketch uses other convention | C01 |
| 1.2 orbits equitable | `K_{1,3}`; `P₃` with cells `{a}`, `{b,c}` | centre 3 and 0, leaf 1; `P₃`: own-cell counts 1 and 1, counts into `{a}` 1 and 0 | theorem holds; Check's numbers false | R01, R02 |
| 1.2 simple spectrum | `K₂`; `C₄`; empty `V` | `K₂`: 1, −1, swap² = 1; `C₄`: 0 twice, rotation of order 4; `Fin 0 → ℝ` injective, group trivial | holds | none |
| 1.3 Kneser vertex-transitive | `(Fin 4, 2)`, `(Fin 3, 2)`; infinite `α` | 6 vertices, 3 disjoint pairs: `3K₂`; 3 vertices no edge; Mathlib lemma has no finiteness on the ground type | holds | none |
| 2.1 decomposition `Aʰ = ∑ θʰ P_θ` | `K₂`; `h = 0` with `θ = 0`; `P₃`; `C₅` | `P₁ + P₋₁ = I`, `P₁ − P₋₁ = A`; `0⁰ = 1`; `P₃` diagonal of `P₀` `(½,0,½)`; `C₅` closed walks 2, 0, 6 | holds | none |
| 2.2 vertex-deleted formula | `K₂`, `K₁`, `t = 1` on `K₂`; `P₃` | `(t²−1)(½/(t−1)+½/(t+1)) = t`; `t·(1/t) = 1`; at `t = 1`: 1 against 0; `t²−1` vs `t²` | holds off the spectrum | none |
| 2.3 walk-regular vs transitive | Chang graph from `4K₂` switching | `|Aut| = 384`, `384/28` not an integer, so not vertex-transitive; SRG `(28,12,6,4)` | Check holds | none |
| 3.1 Cayley regularity, connectivity | `ZMod 5`, `{1}`, `{2,3}`, `{0,±1}`; `ZMod 4`, `{2}`; `Sym(3)`; trivial group | degrees 2, 2, 2 (not 3); `2K₂`, `⟨2⟩` proper; `K_{3,3}`, `2K₃`; `S = ∅`, closure `⊥ = ⊤`, one vertex connected | holds | none |
| 3.2 Sabidussi | `ZMod 4` on `C₄`; `D₄` on `C₄`; empty `V` | `S = {1,3}`; non-free: `|S| = 4`, 4-regular on 8 vertices; adjacency `g⁻¹h ∈ S ⇔ h•v ∼ g•v` | holds; `Nonempty` needed | none |
| 3.2 left regular action | one-term proof | closes with `inv_mul_cancel_right`, `eq_mul_inv_of_mul_eq` | true, asks nothing | C03 |
| 4.1 retraction | `C₅`; Petersen; `2K₃` | `|Γ| = 10`, `|S| = 4`; `|S| = 12·3 = 36` on 120; `2K₃`: `|Γ| = 72`, `|S| = 24`, construction still works | holds; two hypotheses unused by route | C04 |
| 4.2 Petersen | arc count; `ZMod 10`, `{±1,5}` | `10·3·2·2 = 120`; 4-cycle `0,1,6,5`; intersecting 4-family is a star (triangle has 3) | holds | none |
| 5.1 characters | `ZMod 5`; `ZMod 2²`; `ZMod 8`, `{±1,4}`; `S = {1}` | `2cos(2πj/5)`; `2,0,0,−2`; `i − i + 1 = 1`; non-symmetric gives `ζ ∉ ℝ` | holds | none |
| 5.2 block decomposition | `Sym(3)` transpositions; `Sym(3)`, `{(12),(123),(132)}`; `ZMod 8`, `{2,6}` | `3, −3, 0⁴`; blocks `3`, `1`, `ρ(12) − 1` with `0, −2`: `3,1,0²,(−2)²` = prism; eigenvalue 2 twice | holds | none |
| 5.3 normal connection sets | `Sym(3)` 3-cycles; `Q₈`, `{±i,±j}`; non-normal `S` | `2², (−1)⁴`; `4, 0, 0, −4` and `0⁴`: `4, −4, 0⁶`; formula gives `−1`, not in `3,1,0²,(−2)²` | holds | none |
| 6.1 edge and vertex connectivity | `K₂`, `K₃`, `C₄`, `K₄` | `K₂`: κ′ = 1 = k, `3·1 < 4`; `K₃`: κ = 2, `6 ≤ 6`; `C₄`: κ = 2, `6 ≤ 6`; `K₄`: `9 ≥ 8` | holds; `3 ≤ card V` needed | none |
| 6.2 matchings | `C₅`; `P₃`; `3K₃`; one vertex | `C₅ − v = P₄`; middle of `P₃` never missed; `K₂ ⊔ 2K₃` has no perfect matching; `{v}ᶜ = ∅` | holds | none |
| 6.3 long cycles | `K₃`, `C₄`, Petersen, `K₂` | `9 ≥ 9`; `16 ≥ 12`; `81 ≥ 30`; `K₂` has no cycle; `k ≥ 3` gives `κ ≥ 8/3`, so 3-connected | holds | none |
| 7.1 `s`-arcs, monotonicity | `s = 0, 1`; `K_{1,3}`; `K₄` | every map `Fin 1 → V`; adjacency; six 2-arcs regular under `Sym(3)`, not 1-arc-transitive; `4·3·2 = 24` | holds; degree hypothesis needed | none |
| 7.2 girth bound, Tutte | `s = 0` (ℕ subtraction); `K₄`, `K_{3,3}`, Petersen, Heawood, 8-cage; `Cₙ` | `0 ≤ g`; `3 ≥ 2`; `4 ≥ 4`; `5 ≥ 4`; `6 = 6`, `14·3·8 = 336`; `8 = 8`, `30·3·16 = 1440` | holds | none |
| 8.1 Whitney isomorphism | `K₃`, `K_{1,3}`; `K₁`, `2K₁` | both line graphs `K₃`; empty line graphs, not isomorphic, `2K₁` disconnected | holds | none |
| 8.2 Whitney automorphism | all connected graphs on ≤ 4 vertices | `K₂`: 2→1; paw: 2 vs 4; diamond: 4 vs 8; `K₄`: 24 vs 48; `K₁, P₃, K₃, P₄, K_{1,3}, C₄` bijective | holds | none |
| 9.1 Frucht | trivial group; `ZMod 2` | Frucht graph, 12 vertices, cubic; `K₂` not cubic | holds | none |
| 9.2 asymmetry | `n = 0, 1, 2..5, 6` | ratios `0, 0, 1, 1, 1, 1`; `8·720 = 5760`, `(32768 − 5760)/32768 = 211/256`; 11 classes on 4 vertices | holds | none |

- Source locators checked against the text: 6, all in Brouwer–Haemers (author's copy): §1.4.9, §1.6, Corollary 1.6.1, §6.3, Proposition 6.3.1, §15.1; numbering and content agree.
- Library declarations opened at the pin: Mathlib `SimpleGraph/Cayley.lean:36, 97, 126, 145`, `SimpleGraph/Circulant.lean:32, 62`, `Data/Matrix/PEquiv.lean:54`, `Logic/Equiv/Fintype.lean:165`, `Algebra/Group/Action/Defs.lean:692`; Tau Ceti `SimpleGraph/Connectivity/EdgeConnectivity.lean:49, 89`, `VertexConnectivity.lean:217, 331, 398, 564`, `CharacterTable/Completeness.lean:237`, `Wedderburn.lean:135`, `CentralCharacter.lean:112, 130`.
- Cross-roadmap citations resolved: 13 (GraphSpectra 1.2, 2.3, 2.4, 3.9; SpectralGraphBounds 1.1; TopologicalCombinatorics 3.1; CharacterTheory 2.1, 3.6, 4.3; MatchingTheory 5.2; LovaszThetaFunction 4.2; AssociationSchemes 5.2; PaleyGraphsAndCharacterSums 1.4). The six supplier definitions copied into `Suggested.lean` agree with the suppliers' heads.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 45 `sorry` warnings and no other warning or error. All 65 elaborated signatures compared with the README; the one dropped binder is `[Finite V]` on the definition `lineGraphAutHom`, which does not need it.
- One-tactic probes on a copy: 10 statements tried, 3 close (C03).
- Dependency check output: `depcheck: 132 roadmaps, 1465 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Pull request text: the counts (45 theorems, 14 definitions, 6 copied definitions), the supplier list and the boundary paragraph agree with the head.
- Overlap check: read GraphSpectra, StronglyRegularGraphsAndDesigns, CharacteristicPolynomialsAndStarComplements, StronglyRegularAndMooreGraphs, MatchingTheory, GraphConnectivityAndFlows, and EquitableOperatorReduction; orbit partitions as equitable partitions: EquitableOperatorReduction and this roadmap both (R02); perfect matchings of even vertex-transitive graphs: MatchingTheory; spectral projections, Petersen, Johnson and Hamming graphs: GraphSpectra; edge and vertex connectivity: GraphConnectivityAndFlows; nothing else shared.

Source independence: 8 passages compared with 1 source (Brouwer–Haemers), none shared; largest share Godsil–Royle, 30 of 70 locators, whose text and contents page could not be read; by the README's own locators the layers do not follow its section order (§3.2, §3.7, §3.9, §4.4, §§3.3–3.6, §§4.1–4.3), with 6.1–6.3 parallel to §§3.3–3.6 where 6.3 needs 6.1.

Research link: Layer 5 states the Cayley-spectrum formulas of Brouwer–Haemers 2012 (Proposition 6.3.1) that the README's downstream expander roadmaps use; Layer 7 is the cubic case of the bound that Weiss 1981 extends to `s ≤ 7`; 6.3 is Babai 1979. Rests on the README (Downstream consumers, Beyond this roadmap) and Brouwer–Haemers §6.3.

## Not verifiable

- Godsil–Royle (all locators of 1.1, 3.1, 3.2, 4.1, 4.2, 6.1–6.3, 7.1, 7.2): Springer, paywalled; the sources service found no legal copy. This includes the README's remark that §4.1, p. 59 states monotonicity without the degree condition, and Figure 3.4.
- Biggs; Cvetković–Rowlinson–Simić (both books); Godsil, *Algebraic Combinatorics*; Knauer–Knauer; Krebs–Shaheen; Beineke–Wilson (Cameron, Alspach, Praeger): no legal copy found (an author-page address tried for Cameron's chapter returned 404). The locators of 2.1, 2.2, 5.2, 8.1, 8.2, 9.1 and 9.2 were not checked against the text.
- Brouwer–Haemers page numbers after Chapter 1: the author's copy has §6.3 on p. 92, Proposition 6.3.1 on p. 93 and §15.1 on pp. 217–218, where the README gives pp. 94, 95 and 222 for the Springer edition; section and proposition numbers agree, the Springer pagination was not seen.
- Ownership against open pull requests was checked through the roadmap search over the open heads and main, not by reading every open roadmap.

Automatic checks set aside as false positives: the section comment "Library declarations consumed" at the end of `Suggested.lean` was reported as a header with no declaration under it; it is followed by `#check` lines pinning library declarations, which the form rules allow.

## Source issues

- none

## For the human reviewers

- Not tested: Godsil–Royle carries 30 of the 70 locators (README References); its text and its contents page could not be read, so wording and arrangement were compared only with Brouwer–Haemers.
