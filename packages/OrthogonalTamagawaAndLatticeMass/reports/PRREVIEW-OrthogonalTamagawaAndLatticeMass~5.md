# Review of OrthogonalTamagawaAndLatticeMass (pull request #1222 at b7f1192)

**Verdict:** needs changes

Incremental re-review of the 10 lines of `README.md` changed since 36e40db; `Suggested.lean` and every file outside the folder are unchanged. The previous R03 (the RootSystems citations in §4.1) is repaired, and the new claim that the root-system classification is not an input of Layer 4 is correct. The previous R01 (the Tau Ceti pin) and R02 (unnamed revision suppliers) are not repaired. Checking the narrowed RootSystems contract against the §4.2 route shows that the Weyl-group orders the route multiplies by have no supplier (R02 below), and that two Layer 4 *Needs:* lines omit §3.2 (R04).

## R01 (P2) — The pinned Tau Ceti still lacks the rank-24 declarations named in the supplier contract

Carried from the previous R01; not repaired.

**Location.** `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md` line 30, relied on at lines 9, 551, 553 and 555: "The rank-24 lattices of §4.2 are native: `TauCeti.RootfulNiemeierType` … in `TauCeti/LinearAlgebra/IntegralLattice/Rank24/RootSystems.lean`; … `TauCeti.leechLattice` …"

**Claim.** The 21 named declarations, in five `Rank24/…` files and `PosDef/RepresentationNumber.lean`, are in the pinned Tau Ceti.

**Witness.** This head's `lake-manifest.json` still pins Tau Ceti `a91d3aa` (2026-10-05), with Mathlib `6b7abb3` on `v4.35.0-rc3`. At that commit, `TauCeti/LinearAlgebra/IntegralLattice/` has 28 entries and no `Rank24` directory. A recursive search for `leechLattice`, `RootfulNiemeierType` and `map_span_vectorsOfNorm` finds nothing. Main's manifest pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4` on `v4.36.0-rc2`.

**Repair.** The previous report gave two options:

- Merge or rebase onto current main, so that the manifest pins Tau Ceti `2fd255d`, then re-run the targeted build. The README text can stay as it is; the previous report resolved all 21 names at `2fd255d`.
- Or keep `a91d3aa` and consume the lattices from Rank24LatticeConstructions Layers 3 and 6 alone, citing the pinned `IntegralLattice.Isometry.carrierEquiv_image_vectorsOfNorm` (`PosDef/RepresentationNumber.lean:161`) in place of `map_span_vectorsOfNorm`.

## R02 (P2) — Layer 4's Weyl-group orders have no supplier

**Location.** README line 58, changed at this head: "these are the root and glue stabilizer inputs of Layer 4. The classification of root systems is not an input". Line 553: "its recorded finite factor is |O(L)/W(R(L))|, to be multiplied by the Weyl order".

**Claim.** RootSystems Layer 5 and Layer 6 §6.1, together with IntegralLattices §6G, supply the root-side inputs of the §4.2 orders.

**Witness.**

- RootSystems Layer 5 proves Aut(Φ) = W ⋊ (based subgroup), at revision lines 905–1022. It gives no value of |W|.
- The IntegralLattices revision, line 2191, says that RootSystems "proves no type-specific value". Only |W(E₈)| = 696729600 is supplied (§6G).
- The rows E₆⁴, A₁₇E₇, D₁₀E₇² and A₁₁D₇E₆ need |W(E₆)| = 51840 or |W(E₇)| = 2903040.
- Twelve rows need |W(Dₙ)| = 2ⁿ⁻¹·n! (D₄ through D₂₄), and fourteen rows need |W(Aₙ)| = (n+1)!.
- So 22 of the 23 rows use an order that no target, cited section or pinned declaration provides.

**Repair.** Name the orders where they come from, in line 58 (or a new supplier paragraph), in §4.2's *Needs:* line (line 555) and in line 582:

- Type A: RootSystems Layer 3 §3.2, which is on main (line 570: order (n+1)!). It is a type-A identification, not the classification, so line 58's sentence stays true.
- E₈: IntegralLattices §6G.
- Dₙ, E₆ and E₇: either state them as §4.2 targets, or cite ReflectionInvariantTheory §3 (`∏ᵢ dᵢ=|W|`, main line 52) together with §4's degree multisets (main lines 86–88). For the targets, one route each:
  - W(Dₙ) is the even-sign subgroup of the signed permutations, of order 2ⁿ⁻¹·n!.
  - W(E₆) acts transitively on its 72 roots with root stabilizer W(A₅), so its order is 72·720.
  - W(E₇) acts transitively on its 126 roots with root stabilizer W(D₆), so its order is 126·23040, as in §6G's orbit chain.

Tested: the degree products give 2·5·6·8·9·12 = 51840 and 2·6·8·10·12·14·18 = 2903040. For D₄ the product 2·4·6·4 = 192 = 2³·4!. With these orders and the Borcherds factors, the 24 reciprocal orders sum exactly to `bernoulliFullMass 12`.

## R03 (P3) — Ids defined only by two open revisions, which the description does not name

Carried from the previous R02; not repaired.

**Location.** README line 34: "§§4A–4C and N0–N1 for class, genus and proper spinor-genus carriers; … §6E … (its statement for two table rows assumes …)". Line 58: "Consume RootSystems Layer 5 (§§5.1–5.3) … and Layer 6 §6.1". The same RootSystems ids appear at lines 9, 539, 541, 553, 555 and 582.

**Claim.** These IntegralLattices and RootSystems ids are supplier sections.

**Witness.**

- Main's RootSystems ends at Layer 3; its last section is §3.2, at line 562. Layer 5 and §6.1 exist only at the head of the RootSystems revision #1196 (lines 905 and 1037). Since this head dropped Layer 3 §3.1, every remaining RootSystems citation is revision-only.
- IntegralLattices N0 and N1 exist only at the head of revision #1239 (lines 1429 and 1468). The conditional §6E is at that head's line 2110.
- The description's depends-on block lists #792, #1175, #999 and #851 only, and its merge-order paragraph names neither #1239 nor #1196.

**Repair.** List the IntegralLattices revision #1239 and the RootSystems revision #1196 in the description's depends-on block and merge-order paragraph, as suppliers that merge first. The README needs no change for this finding.

## R04 (P3) — The §4.1 and §4.2 *Needs:* lines omit §3.2's mass evaluations

**Location.** Line 541, changed at this head: "*Needs:* §0.0's Gram/native comparison and §3.1's mass value; …". Line 539 says that "the mass-exhaustion route here uses §§3.1/3.2". Line 555: "§§0.0/3.1/4.1 for Gram transport and mass".

**Claim.** §3.1 supplies the numerical masses M₁₆ and M₂₄ that the exhaustion step compares with the reciprocal orders.

**Witness.**

- §3.1 proves only that the mass equals `bernoulliFullMass (n/2)`. The numerical values are §3.2's: line 515 says "evaluate M8,M16,M24,M32,M40".
- M₁₆ = 691/277667181515243520000 needs B₂ through B₁₄ (1/6, −1/30, 1/42, −1/30, 5/66, −691/2730, 7/6). Its 691 is the numerator of B₁₂.
- §4.3's *Needs:* line (line 568) already cites "the exact Bernoulli evaluations of §3.2".

**Repair.**

- Line 541: write "§3.1's mass value and §3.2's evaluation of M₁₆".
- Line 555: write "§§0.0/3.1/4.1 for Gram transport and mass, and §3.2's evaluation of M₂₄".

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `a91d3aa`, which has no `Rank24` directory, and line 30 still names `TauCeti.RootfulNiemeierType`, `TauCeti.leechLattice` and `IntegralLattice.Isometry.map_span_vectorsOfNorm` as native. Raised again as R01.
- R02 — not repaired: the description's depends-on block still lists only #792, #1175, #999 and #851, and the merge-order paragraph names neither #1239 nor #1196. Raised again as R03.
- R03 — repaired: line 539 reads "RootSystems Layer 5, RootSystems Layer 6 §6.1", and line 541 reads "RootSystems Layer 5 and Layer 6 §6.1". §3.1 is deleted from lines 9, 58 and 582, with "The classification of root systems is not an input". The repair introduced R02 (the contract now claims to be complete) and left R04 in the same *Needs:* line.

## Verified sound

### Gate, build and Lean form

- **Scope of the change.** One file changed: `README.md`, with 5 insertions and 5 deletions. `git diff 36e40dbc HEAD --stat` touches nothing else. The diff of `origin/main...HEAD` outside the folder is empty.
- **Gate.** The full gate, run again on this head, printed `OK` with every counter at 0. The worker's gate also records `build=0`.
- **Dependency check**, run again:

  ```text
  depcheck: 239 roadmaps, 2430 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line. Neither RootSystems copy (main, and revision #1196) mentions this roadmap, so the narrowed contract creates no cycle. ReflectionInvariantTheory, named in R02's repair, is on main and does not mention this roadmap either.
- **Elaboration.** `lake env lean` of `Suggested.lean` at the branch pins gave exactly five warnings, `declaration uses 'sorry'`, at lines 109, 116, 120, 124 and 128.
- **Binder check.** A scratch copy with `#check @name` for all **17 declarations** elaborated. Every type is identical to `signatures.md` and to the previous round. `evenUnimodularMass_eq` keeps `0 < n` and `8 ∣ n`, and the four class-count statements use the `evenUnimodularClasses` subtype. Nothing changed.
- **Padding probe.** Each `sorry` was replaced by `simp`, by `rfl` and by `decide`, and all 15 attempts fail. `simp` makes no progress on one theorem and leaves unsolved goals on four. `rfl` fails on all five. `decide` rejects one goal for its free variables and fails to reduce the other four. There is no padding.
- **Headlines.** The inventory is unchanged: the five statable lattice headlines are stated, and the docstring names 0.1, 0.1a, 0.3, 1.1–1.4 and 2.1–2.2 as not statable, each with the carrier it lacks.

### Citations resolved for the changed lines (9)

| Citation | Where checked | Result |
| --- | --- | --- |
| RootSystems Layer 5, §§5.1–5.3 (lines 9, 58) | revision #1196, lines 905–1022 | §5.1 `weyl_based_complement`; §5.2 `existsUnique_basedAut_of_cartanMatrix` (Cartan-preserving permutations of the base) and lattice-preserving subgroups, "include permutations of isomorphic components" (lines 977–978). Matches line 58. |
| RootSystems Layer 6 §6.1 (lines 9, 58, 539, 553, 582) | revision #1196, line 1037 | Components from the Cartan graph, independent of base and carried by equivalences. Matches line 9. |
| "classification is not an input" (line 58) | §4.1 and §4.2 routes | Each Γ is read off an explicit Cartan matrix. Non-isometry comes from IntegralLattices §6E, and completeness from §9B. No base-free type identification is used. |
| RootSystems on main | main line 504 onward | Ends at Layer 3; §3.2 gives the type-A order (n+1)! at line 570. This is the supplier for R02's type-A orders. |
| IntegralLattices §§6C/6D/6E/6G/9B, N0/N1 | revision #1239, lines 2054/2076/2110/2182/2657/1429/1468 | Present. §6E states its root-sublattice hypothesis, as line 34 says. On main, all except N0–N1 exist as bold labels (6G at line 1680). |
| IntegralLattices "no type-specific value" | revision #1239, line 2191 | Witness for R02. |
| ReflectionInvariantTheory §§3–4 | main, lines 52, 86–88 | `∏ᵢ dᵢ=|W|`, with degree multisets for Dᵣ (r ≥ 4), E₆ and E₇. A possible supplier for R02. |
| Mathlib `IsCompact.exists_isMinOn`, `exists_rat_btwn` (line 541) | pin `6b7abb3` | `Topology/Order/Compact.lean:228` and `Algebra/Order/Archimedean/Basic.lean:369`. |
| Overlaps file | 16 items | No open pull request changes this roadmap or drops an id it cites. Of its "revision-only" list, the IntegralLattices labels other than N0–N1 are bold labels on main (a false positive). RootSystems Layer 5/6 is genuinely revision-only (R03). |

### Sources (seeded targets in the changed lines)

The ChenevierLannes v2 text (arXiv 1409.7616v2) was fetched again through the sources service, into a scratch manifest that was then deleted; no manifest was edited.

- **Target 4.1.** Corollary 3.6 is at ChenevierLannes line 1589. Chapter II begins at line 829, and the page footer at line 1627 reads 41, so the printed page is p.41. It states that a rank-16 even unimodular lattice is isomorphic to D₁₆⁺ or E₈⊕E₈, and that the two are not isomorphic, which supports `rank16_classNumber`.
- **Target 4.2.** Theorems 3.16–3.17 are at lines 1886–1893, with the footer 48 at line 1897.

The other 13 seeded targets lie outside the changed lines, and their checks from the previous reports are carried forward.

### Adversarial table: changed statements (computed this round)

| Statement | Instances | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Line 9: Layer 5 owns Aut = W ⋊ based | A₁; A₂; D₄ | 2 = 2·1 and 12 = 6·2 (revision §5.1 Checks); D₄: six based automorphisms (§5.2 Checks), so 192·6 = 1152 | Owned at revision #1196 | none |
| Line 9: §6.1 owns components | A₁² vs A₂; E₈² | 2 components vs 1, and (1,1) is not a root of A₁²; E₈² has 2 components, exchanged by the interchange | Owned | none |
| Line 58: no classification needed | E₈², D₁₆; E₈³, A₂₄, D₂₄ | Γ orders from the explicit Cartan matrices: 2, 2; 6, 2, 2. Glue stabilizers: 2, 1; 6, 2, 1 (D₂₄'s s↔c moves H), which equal the Borcherds factors | True for the §§4.1–4.2 routes | none |
| Line 58: oriented vs unoriented diagrams | B₂ vs ADE | The B₂ swap turns (−2,−1) into (−1,−2) and is excluded; every Layer 4 system is simply laced, with a symmetric Cartan matrix, so the two notions agree | Harmless | none |
| Line 58: completeness of the root inputs | 23 rows | (n+1)! for A₁…A₂₄; 2ⁿ⁻¹n! for D₄…D₂₄; 51840 (E₆); 2903040 (E₇); 696729600 (E₈). Layer 5/§6.1 give none of these; IntegralLattices §6G gives only E₈ | 22 rows lack a supplier | R02 |
| Line 539: E₈² order | W(E₈)≀S₂ | 2·696729600² = 970864271032320000 | Correct | none |
| Line 539: D₁₆⁺ order | Aut(D₁₆) = signed permutations, order 2¹⁶·16! = 1371195958099968000; an odd sign change swaps s and c | Stabilizer of {0,s}: 2¹⁵·16! = 685597979049984000 | Correct; uses §§5.1–5.2 | none |
| Line 539: reciprocal sum | both orders; one only | 1/970864271032320000 + 1/685597979049984000 = 691/277667181515243520000 = `bernoulliFullMass 8`; either term alone is smaller | Exact | none |
| Line 539: Chenevier–Lannes locator | text | Line 1589, Chapter II (line 829), footer 41 | Correct | none |
| Line 541: *Needs:* vs route | M₁₆ | B₂…B₁₄ = 1/6, −1/30, 1/42, −1/30, 5/66, −691/2730, 7/6 come from §3.2; line 539 cites §§3.1/3.2, but the *Needs:* line cites §3.1 only | Omission | R04 |
| Line 582: Dependencies = union of *Needs:* | §§4.1–4.3 | IntegralLattices {0E,2C,2G,6C,6D,6G,9B} ∪ {2C,2G,6E,9B} ∪ {2C,2G} = 0E/2C/2G/6C–6E/6G/9B; RootSystems L5 and §6.1; Rank24LatticeConstructions L3/5/6; P2-L; Layers 0/3 (which cover §3.2) | Equal | none |
| §4.2 mass with degree-product Weyl orders | 23 rows + Leech | E₆: 2·5·6·8·9·12 = 51840. E₇: 2·6·8·10·12·14·18 = 2903040. Dₙ: 2·4·…·(2n−2)·n = 2ⁿ⁻¹n! (D₄ 192, D₂₄ 5204698426366666226930810880000). Σ 1/\|O\| = 1027637932586061520960267/129477933340026851560636148613120000000 = `bernoulliFullMass 12` | Exact | R02's repair tested |

### Rank-24 orders (carried from ~4, re-summed this round)

Each order is the Borcherds factor times the Weyl order. The 24 reciprocals were re-summed this round, with the Weyl orders taken from the degree products (row above).

- **Leech** (from P2-L): 8315553613086720000.
- **The 23 table rows:**

| Root system | Order |
| --- | --- |
| A₁²⁴ | 4107449023856640 |
| A₂¹² | 413762786426880 |
| A₃⁸ | 295882444505088 |
| A₄⁶ | 716636160000000 |
| A₅⁴D₄ | 2476694568960000 |
| D₄⁶ | 108208436847575040 |
| A₆⁴ | 15485790781440000 |
| A₇²D₅² | 47943914618880000 |
| A₈³ | 573416710078464000 |
| A₉²D₆ | 1213580338790400000 |
| D₆⁴ | 6763027302973440000 |
| A₁₁D₇E₆ | 16019260472033280000 |
| E₆⁴ | 346657985428193280000 |
| A₁₂² | 155103152174530560000 |
| D₈³ | 824788751971516416000 |
| A₁₅D₉ | 3887340541213409280000 |
| A₁₇E₇ | 37172693925353226240000 |
| D₁₀E₇² | 31316197926418513920000 |
| D₁₂² | 1924703466207817236480000 |
| A₂₄ | 31022420086661971968000000 |
| D₁₆E₈ | 477676405704303732326400000 |
| E₈³ | 2029289625631919702016000000 |
| D₂₄ | 5204698426366666226930810880000 |

### Adversarial table: unchanged statements carried forward

These are not recomputed this round. Each row cites the previous review (~4); the rows marked "(~3)" were carried by ~4 from the review before it.

| Statement | Values (source) | Result |
| --- | --- | --- |
| Line 9: definite finiteness, label 2C | diag(1,2): 4 sign isometries; x²−2y²: (3,2), (17,12), (99,70) have norm 1 (~4) | Definiteness needed |
| Line 30: glue orders of the four excluded rows | 4096² = 2²⁴; 729² = 3¹²; 64² = 4⁶; 12² = 144 (~4) | Unimodular |
| Lines 30/62: glue minima | A₁²⁴ 4; A₂¹² 4; D₄⁶ 4; A₁₁D₇E₆ words 4–6 (~4) | No new roots |
| Line 559: A₁²⁴ Check | 1+759+2576+759+1 = 4096; minimum 8/2 = 4 vs 4/2 = 2 (~4) | Discriminating |
| §6E: root system separates | 480 = 480; 720 = 720; 432 = 432 with distinct multisets (~4) | Separates |
| Line 551: Leech separation | ∅ vs 48 roots (~4) | Never isometric |
| Line 551: §0.0 transport | dimension 24, integral, symmetric, positive definite Gram matrices (~4) | Distinct classes |
| Line 553: O(N) = glue stabilizer | D₂₄ 1; A₂₄ 2; E₈³ 6 (~4) | Matches Borcherds |
| Line 66: Leech order | 2·\|Co1\| = 8315553613086720000; 196560 minimal vectors (~4) | Consumed |
| Line 66: P2-L's Λ is native | ½·dot; B(s,s) = 4 (~4) | Same lattice |
| §0.3: 4D, N0, N1 | main 4D owner line 1359; revision lines 82/1429/1468 (~4) | Revision-only (R03) |
| §0.3: proper-to-full | U⊕⟨1⟩ reflection det −1; I₃ excluded (~4) | Scope kept |
| Line 586: IntegralLattices consumes nothing | 7H → §§2.3/3.1, 7I → §4.1, 4D → §0.3 (~4) | One direction |
| §0.1a quadratic-preserving equations | xy over F₂: 2 vs 6; shear excluded (~3) | Correct |
| Point functor; reduced vs nonreduced | S² = I; μ₂ 1 vs 2 over F₂[ε] (~3) | Correct |
| Dickson; split/nonsplit and odd orders | Dickson 1; F₂: 2, 6; F₄: 6, 10; 6 = 2(2²−1) (~3) | Correct |
| Rank-zero/singular guards | 1 vs 0; GL₂ 6 vs 2 (~3) | Guards needed |
| §0.2 inverse transpose; stabilizer transport | MᵀCM = diag(16,1/4); full/proper 2/1 (~3) | Correct |
| §1.1 quotient, action, finiteness | 9/25+16/25 = 1; 36/6 = 6; ℤ on ℝ, [0,1) (~3) | Correct |
| §1.4c coefficients and zeta | 3,1,1; 1,2,3 / 1,0,1 / 1,1,1 (~3) | Equal |
| Imaginary constant and conductor | L(1) = π/(3√3), mass 1/12; D = −3, f = 2: h(−12) = 1 (~3) | Correct |
| Real residue, regulator, nonmaximal order | D = 5: (1,2); D = 12: (2,1); ε⁶, R_f⁺ = 6R (~3) | Correct |
| Filtration, X/B/W/Y/Z, I₁/I₂ | diag(1,2): 2,2,4,2,1; [[1,1],[1,2]]; [[1,1],[1,0]] (~3) | Correct |
| Frobenius, radical, dimensions | F₄ kernel 1; U radical 1; all dimensions ≤ 1 (~3) | Correct |
| Unipotent count; Cho density | A⁰, A¹ over F₄: 2, 8; β = 2, 4, 2 and α = 2β (~3) | Correct |
| §3.1 Bernoulli/full mass | 1/696729600; 691/277667181515243520000 (~3) | Correct |
| §4.1 coercivity, columns, determinant | μ = 1, c = 1/2; rank 0 c = 1; det ±1 (~3) | Correct |
| §4.3 inequality; rank 32/40 | 3/2 ≤ 2; rank 0: 2 > 1; 80618465 < 2M₃₂ < 80618466; ⌊2M₄₀⌋ ≈ 8.79·10⁵¹ (~3) | Bounds hold |
| Gram universe, native lattice, equivalence | [1], [2] positive, [0] not; [1] ≁ [2]; det 2 both sides (~3) | Correct |
| Setoid, class map, full order | A⁻¹A = I; det 2 vs 8; diag(1,2): 4 vs 2 (~3) | Correct |
| O/SO, low ranks, Spin | M⁻ᵀ; rank 0: 1, 1; rank 1: 2, 1; Q₈ kernel 2; dimensions 3, 6, 15 (~3) | Correct |
| Rank-four factors; rational Spin image; simply connected | 2 vs 1 factors; spinor norm 2; SO₃ = PGL₂ (~3) | Correct |
| Approximation and Eichler scope | split SL₂; definite ternary; signature (3,0) excluded (~3) | Hypotheses kept |
| Full/proper masses; real gauge | 12/6 = 2; V₃ = 8π², V₄ = 16π⁴; I₃ 1/48 (~3) | Correct |
| General mass: A₂, −23, E₈ | 1/12; 3/4; 1/696729600 (~3) | Match |
| Density guards; norm content; character | n = 0: 0 vs 1; Δ = −3, −23; D = −3, 5, 1 (~3) | Correct |
| Endpoint, genus conversion, split branch | 3/2, 1, 1/2; 3 proper, 2 full; 2, 3, 15/4 diverge (~3) | Correct |
| Smooth model, special fibre, kernels | 1 point; ⟨1⟩: 2 vs 1; f = 4: 4 (~3) | Correct |
| Cho N, stabilization, densities | 1, 2, 2, 8; α₂ = 4, 8; U 4; A₂ 12/6; −23 4/2; β₃ = 6, β₂₃ = 46 (~3) | Agree |
| Good-prime sign and convergence | U at 3: 2/3 vs 4/3; 8/9, 64/81 (~3) | Correct |
| Even/unimodular predicates; rank 8 | [1] odd; [2] det 2; E₈ in, I₈ out (~3) | Correct |
| Bernoulli sign; evaluation range | B₀ + 2B₁ = 0; B₃₈ = 2929993913841559/6 (~3) | Correct |
| Rank-24 injectivity; isogeny exclusion | ≤ 23 with a repeat; ℚ×/ℚ×² infinite (~3) | Guards kept |

### Ownership

The change adds no object. It deletes one supplier citation (RootSystems Layer 3 §3.1) and narrows two others; an object can lose an owner this way but cannot gain a second one. No `Suggested.lean` name changed. Ownership against open pull requests: the overlaps file lists no pull request that changes this roadmap or drops an id it cites. The closest roadmaps (IntegralLattices, OrthogonalSpinGroups, ThetaSeries, LatticePackingsAndPerfectForms, GeometryOfNumbersAndQuadraticArithmetic) were compared in earlier rounds, and no changed line touches what they own.

## Not verifiable

- **O'Meara, 104:4–5.** Uncertified in the README and unchanged. The earlier reports record the legal searches.
- **The build at main's pins.** The Lean commands this review may run are limited to the branch at `a91d3aa`/`6b7abb3`. R01's repair is settled by the targeted build after the rebase.
- **Unreopened locators.** The Borcherds tables and the Conway–Sloane, Cho, Belolipetsky–Gan and Milne locators are untouched by the diff and were not reopened.

## Source issues

- **Misprint** in ChenevierLannes at Chapter II, Theorem 3.16, printed p.48: the source says every even unimodular lattice without roots is the Leech lattice; it should be restricted to dimension 24, as the surrounding section is (Leech⊕Leech is rootless in rank 48); affects nothing. Re-observed at ChenevierLannes line 1886.
