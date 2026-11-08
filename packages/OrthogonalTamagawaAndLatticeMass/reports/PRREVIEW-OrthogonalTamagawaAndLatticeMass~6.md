# Review of OrthogonalTamagawaAndLatticeMass (pull request #1222 at 85c425c)

**Verdict:** needs changes

This is an incremental re-review of the 6 lines of `README.md` changed since b7f1192. Three lines changed: 344, 541 and 555. `Suggested.lean` and every file outside the folder are unchanged.

- R04 (the §4.1/§4.2 *Needs:* lines) is repaired, and the exact masses it now cites check out.
- R01 (the Tau Ceti pin), R02 (the Weyl-group orders) and R03 (the unnamed revisions) are not repaired.
- The line 344 change moves one more Tau Ceti citation onto main's pin. Every file path the README cites now resolves at main's Tau Ceti pin `2fd255d`. Six of them still do not resolve at this branch's pin `a91d3aa`, so R01 now has a single consistent repair.

## R01 (P2) — The pinned Tau Ceti lacks the rank-24 declarations and the regulator file the README cites

Carried from the previous R01; not repaired. This head's line 344 adds one more path that exists only at main's pin.

**Location.** `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md`:

- Line 30, relied on at lines 9, 551, 553 and 555: "The rank-24 lattices of §4.2 are native: `TauCeti.RootfulNiemeierType` … `TauCeti.leechLattice` …".
- Line 344, changed at this head: "`TauCeti.NumberField.Units.mult_abs_log_eq_index_mul_regulator` in `TauCeti/NumberTheory/NumberField/Units/Regulator/Basic.lean`".

**Claim.** The named declarations and files are in the pinned Tau Ceti.

**Witness.** `lake-manifest.json` still pins Tau Ceti `a91d3aa`, with Mathlib `6b7abb3` on `v4.35.0-rc3`. At `a91d3aa`:

- There is no `Rank24` directory, and `leechLattice`, `RootfulNiemeierType` and `map_span_vectorsOfNorm` occur nowhere.
- `Units/Regulator/` does not exist. The theorem is at `Units/Regulator.lean:68`.

Of the 11 Tau Ceti file paths the README cites, all 11 exist at main's pin `2fd255d`. At `a91d3aa`, six are missing: five under `Rank24/`, plus `Regulator/Basic.lean`.

**Repair.** Merge or rebase onto current main, so that the manifest pins Tau Ceti `2fd255d` (Mathlib `1b1ccf4`, `v4.36.0-rc2`), then re-run the targeted build. The README needs no further change.

Tested at `2fd255d`:

- `mult_abs_log_eq_index_mul_regulator` is at `Regulator/Basic.lean:88`, with a statement identical to the one at `a91d3aa:68`.
- The rank-24 names are at:
  - `Rank24/RootSystems.lean:19`
  - `Rank24/Niemeier.lean:200`
  - `Rank24/Leech/Basic.lean:236`
  - `Rank24/Leech/Minimum.lean:189`
  - `PosDef/RepresentationNumber.lean:179`
- The four `TauCeti.*` imports of `Suggested.lean` exist there.

The other option of the earlier report (keep `a91d3aa`) would now also require reverting line 344 to `Units/Regulator.lean`.

## R02 (P2) — Layer 4's Weyl-group orders of types D, E₆ and E₇ have no supplier

Carried from the previous R02; not repaired. Lines 58, 553 and 582 are unchanged, and line 555 changed only by adding §3.2.

**Location.**

- Line 58: "these are the root and glue stabilizer inputs of Layer 4. The classification of root systems is not an input".
- Line 553: "its recorded finite factor is |O(L)/W(R(L))|, to be multiplied by the Weyl order".
- Line 555: the *Needs:* line, which names no source for any Weyl order.

**Claim.** RootSystems Layer 5 and Layer 6 §6.1, IntegralLattices §6G and the cited Tau Ceti declarations supply the root-side inputs of the §4.2 orders.

**Witness.**

- RootSystems Layer 5 is at revision lines 905–1022. It proves that the full automorphism group of a root system is the Weyl group extended by the based diagram automorphisms (Aut = W ⋊ based). It gives no |W|.
- The IntegralLattices revision, line 2191, says that RootSystems "proves no type-specific value".
- At main's Tau Ceti pin, only type A and E₈ are native:
  - `RootPairing.card_weylGroup_of_hasCartanType_A`, at `Weyl/TypeA/Basic.lean:275`;
  - `card_weylGroup_typeE₈RootLattice`, at `RootLattice/TypeE/WeylGroup.lean:277`.
- Neither pin has an order for Dₙ, E₆ or E₇.
- Fourteen of the 23 rows need one of those orders: A₅⁴D₄, D₄⁶, A₇²D₅², A₉²D₆, D₆⁴, A₁₁D₇E₆, E₆⁴, D₈³, A₁₅D₉, A₁₇E₇, D₁₀E₇², D₁₂², D₁₆E₈ and D₂₄.

**Repair.** Name each order's supplier in line 58, in line 555 and in line 582:

- **Type A.** Cite RootSystems Layer 3 §3.2, on main (line 562; the order (n+1)! is at line 570). After R01's rebase, the native `RootPairing.card_weylGroup_of_hasCartanType_A` also works.
- **E₈.** Cite IntegralLattices §6G, or the native `card_weylGroup_typeE₈RootLattice` after the rebase.
- **Dₙ, E₆ and E₇.** Either state them as §4.2 targets, or cite ReflectionInvariantTheory §3 (`∏ᵢ dᵢ=|W|`, main line 52) with §4's degree table (main lines 86–88). For the targets, one route each:
  - W(Dₙ) is the even-sign subgroup of the signed permutations, of order 2ⁿ⁻¹·n!.
  - W(E₆) acts transitively on its 72 roots with root stabilizer W(A₅), so its order is 72·720.
  - W(E₇) acts transitively on its 126 roots with root stabilizer W(D₆), so its order is 126·23040.

Tested this round:

- The degree products are 51840 (E₆), 2903040 (E₇) and 192 = 2³·4! (D₄), and D₂₄ gives 2²³·24!.
- Each of the 23 table orders divided by its Weyl order is an integer glue factor: 244823040, 190080, 2688, 240, 48, 2160, 24, 8, 12, 4, 24, 2, 48, 4, 6, 2, 2, 2, 2, 2, 1, 6, 1.
- With the Leech order, the 24 reciprocals sum exactly to `bernoulliFullMass 12`.

## R03 (P3) — Ids defined only by two open revisions, which the description does not name

Carried from the previous R03; not repaired.

**Location.**

- README line 34: "§§4A–4C and N0–N1 for class, genus and proper spinor-genus carriers; … §6E … (its statement for two table rows assumes …)".
- Line 58: "Consume RootSystems Layer 5 (§§5.1–5.3) … and Layer 6 §6.1". The same RootSystems ids appear at lines 9, 539, 541, 553, 555 and 582.

**Claim.** These ids are supplier sections.

**Witness.**

- Main's RootSystems ends at Layer 3; its §3.2 starts at line 562. Layer 5 and §6.1 exist only at the head of revision #1196 (lines 905 and 1037).
- IntegralLattices N0 and N1 exist only at the head of revision #1239 (lines 1429 and 1468). Main has no **N0** or **N1** label.
- The description's depends-on block lists #792, #1175, #999 and #851 only. Its merge-order chain names neither #1239 nor #1196.

**Repair.** List the IntegralLattices revision #1239 and the RootSystems revision #1196 in the description's depends-on block and merge-order paragraph, as suppliers that merge first. The README needs no change.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `a91d3aa`, which has no `Rank24` directory. Line 344 now cites `Units/Regulator/Basic.lean`, which also exists only at main's `2fd255d`. Raised again as R01.
- R02 — not repaired: lines 58, 553 and 582 are unchanged, and line 555 adds only "§3.2's exact evaluation of M₂₄". No supplier is named for the Dₙ, E₆ and E₇ Weyl orders. Raised again as R02.
- R03 — not repaired: the description's depends-on block still lists only #792, #1175, #999 and #851, and the merge-order chain names neither #1239 nor #1196. Raised again as R03.
- R04 — repaired: line 541 reads "§3.1's mass formula and §3.2's exact evaluation of M₁₆", and line 555 adds "and §3.2's exact evaluation of M₂₄". §3.2 (line 515) evaluates M8–M40, and line 582's "Layers 0/3" covers it. The repair introduced nothing new.

## Verified sound

### Gate, build and Lean form

- **Scope of the change.** `git diff b7f11926 HEAD --stat` touches one file, `README.md`, with 3 insertions and 3 deletions. The diff of `origin/main...HEAD` outside the folder is empty.
- **Gate.** The full gate, run again on this head, printed `OK` with every counter at 0. The worker's gate also records `build=0`.
- **Dependency check**, run again:

  ```text
  depcheck: 244 roadmaps, 2462 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` of `Suggested.lean` at the branch pins gave exactly five warnings, `declaration uses 'sorry'`, at lines 109, 116, 120, 124 and 128.
- **Binder check.** A scratch copy with `#check @name` for all **17 declarations** elaborated. Every type is identical to `signatures.md`. `evenUnimodularMass_eq` keeps `0 < n` and `8 ∣ n`, and the four class-count statements use the `evenUnimodularClasses` subtype. Nothing changed.
- **Padding probe.** Each `sorry` was replaced by `simp`, by `rfl` and by `decide`, and all **15 attempts fail**. `simp` makes no progress on one theorem and leaves unsolved goals on four. `rfl` fails on all five. `decide` rejects one goal for its free variables and fails to reduce the other four. There is no padding.
- **Headlines.** The inventory is unchanged. The five statable lattice headlines are stated: the mass formula and the class counts in ranks 16, 24, 32 and 40. The docstring names 0.1, 0.1a, 0.3, 1.1–1.4 and 2.1–2.2 as not statable, each with the carrier it lacks.

### Library declarations opened (13)

| Declaration | Pin, file:line | Use |
| --- | --- | --- |
| `TauCeti.NumberField.Units.mult_abs_log_eq_index_mul_regulator` | `a91d3aa` `Units/Regulator.lean:68`; `2fd255d` `Units/Regulator/Basic.lean:88` | Line 344. Identical statements at both pins: `w.mult * \|log (w u)\| = index(closure{u} ⊔ torsion) * regulator K` in unit rank 1 |
| `TauCeti.GlobalNumberFields.NumberFieldOrder.card_narrowPic` | both pins, `NarrowPic/Kernel.lean:198` | Line 344: `Nat.card (NarrowPic O) = Nat.card (Pic O) * O.unitSignatures.index`. Its docstring says this also holds for infinite Picard groups, which matches line 344's "not a finiteness proof" |
| `RootPairing.card_weylGroup_of_hasCartanType_A` | `2fd255d` `Weyl/TypeA/Basic.lean:275`; absent at `a91d3aa` | R02 |
| `card_weylGroup_typeE₈RootLattice` | `2fd255d` `RootLattice/TypeE/WeylGroup.lean:277` | R02 |
| Rank-24 names (5) | `2fd255d` lines listed in R01; absent at `a91d3aa` | R01 |
| `bernoulli_one`, `sum_bernoulli`, `bernoulliPowerSeries_mul_exp_sub_one` | Mathlib `6b7abb3` `NumberTheory/Bernoulli.lean:204/223/268` | §3.2, now cited by lines 541 and 555. `sum_bernoulli n` gives `Σ_{k<n} C(n,k)B_k = [n=1]`, so at n=k+1≥2 the sum is 0, as line 515 says |
| `IsCompact.exists_isMinOn`, `exists_rat_btwn` | Mathlib `6b7abb3` `Topology/Order/Compact.lean:228`, `Algebra/Order/Archimedean/Basic.lean:369` | Line 541 |

All 11 Tau Ceti file paths in the README were checked at both pins. All 11 exist at `2fd255d`, and five exist at `a91d3aa` (R01).

### Cross-roadmap citations resolved (8)

| Citation | Where checked | Result |
| --- | --- | --- |
| §3.2 (lines 541, 555) | this README, line 515 | "evaluate M8,M16,M24,M32,M40" from B₂…B₃₈ |
| Layer 4 Dependencies (line 582) | this README | "Layers 0/3" contains §§3.1/3.2, so it covers the repaired *Needs:* lines |
| RootSystems Layer 5, §6.1 | revision #1196 head `16d2d99` (folder `RepresentationTheory/RootSystems`), lines 905, 1037 | Present, at the same lines as before. Its Tau Ceti list (lines 362–384) has orders for type A, A₂, B₂ and G₂ only |
| RootSystems on main | main line 504 onward | Ends at Layer 3; §3.2 at line 562, with (n+1)! at line 570 |
| ReflectionInvariantTheory §§3–4 | main lines 52, 86–88 | `∏ᵢ dᵢ=\|W\|`, with degree multisets for D_r (r ≥ 4), E₆ and E₇ |
| IntegralLattices §§6C/6D/6E/6G/9B, N0/N1, line 2191 | revision #1239 head `2a9d69b` | Lines 2054/2076/2110/2182/2657/1429/1468 and 2191, unchanged since the last round |
| IntegralLattices labels on main | main README | 2C–9B are all present as bold labels (6G at line 1680); N0 and N1 are absent (R03) |
| LatticePackingsAndPerfectForms → this roadmap | revision #1723, line 270 | Cites "§4" (certificates, mass and class-number columns), consistent with Downstream consumers |

### Sources (seeded targets in the changed lines)

The ChenevierLannes v2 text (arXiv 1409.7616v2) was fetched through the sources service into a scratch manifest, which was then deleted; no manifest was edited.

- **Target 4.1, line 541's section.** Corollary 3.6 is at ChenevierLannes line 1589, in Chapter II (which begins at line 829). The footer at line 1627 reads 41, so the printed page is p.41. It states that a rank-16 even unimodular lattice is isomorphic to D₁₆⁺ or E₈⊕E₈, and that the two are not isomorphic. This supports `rank16_classNumber`.
- **Target 4.2, line 555's section** (not seeded). Theorems 3.16–3.17 are at lines 1886–1893, with the footer 48 at line 1897.
- **Target 1.4, line 344.** The paragraph carries no external locator. Its two Tau Ceti inputs were opened above.
- **Target 3.2**, now cited by lines 541 and 555. It has no external locator, and its Mathlib inputs were opened above.

The other 11 seeded targets (0.0, 0.1, 0.1a, 0.2, 0.3, 1.1, 1.2, 2.1, 2.2, 2.3, 3.1) lie outside the changed lines. Their checks from the previous reports are carried forward.

### Adversarial table: changed statements and headlines (computed this round)

| Statement | Instances | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Line 344: s ∈ {2,4} and h⁺/h = 4/s | D = 5, 8 (fundamental unit of norm −1); D = 12 and ℚ(√34), disc 136 (norm +1) | s = 4, 4, 2, 2. h⁺/h = 1, 1, 2, 4/2 = 2, which equals 4/s = 1, 1, 2, 2 | True; ℚ(√34) separates "no norm −1 unit" from "h⁺ = h" | none |
| Line 344: R⁺/R = s/2 | same | R = 0.481212, 0.881374, 1.316958, 4.248291 (log(35+6√34)). R⁺ = 0.962424, 1.762747, 1.316958, 4.248291; ratios 2, 2, 1, 1 = s/2 | True | none |
| Line 344: h⁺R⁺ = 2hR | same | 0.962424 = 0.962424; 1.762747 = 1.762747; 2.633916 = 2.633916; 16.993164 = 16.993164 | True | none |
| Line 344 reading of `card_narrowPic` | real quadratic order, 2² = 4 sign patterns | index of the unit signatures = 4/s: 1 for D = 5, 2 for D = 12 | Supports h⁺/h | none |
| Line 344 reading of `mult_abs_log…` | D = 5, u = η = ε² | 1·\|log ε²\| = 0.962424, and index 2 · R 0.481212 = 0.962424 | Supports "index a multiplies R" | none |
| Line 344 file path | `a91d3aa` vs `2fd255d` | absent (`Regulator.lean:68`) vs present (`Regulator/Basic.lean:88`) | Branch pin only | R01 |
| Line 541: §3.2 supplies M₁₆ | B₂…B₁₄; two orders | B = 1/6, −1/30, 1/42, −1/30, 5/66, −691/2730, 7/6. M₁₆ = 691/277667181515243520000. 1/970864271032320000 + 1/685597979049984000 = M₁₆ exactly, and either term alone is smaller | Exact | none (R04 repaired) |
| Line 555: §3.2 supplies M₂₄ | B₂…B₂₂ (B₂₂ = 854513/138), B₁₂ = −691/2730 | M₂₄ = 1027637932586061520960267/129477933340026851560636148613120000000 = the 24-term reciprocal sum, exactly | Exact | none (R04 repaired) |
| Lines 553/555: root-side inputs | 23 rows | Weyl orders needed: (n+1)! (A), 2ⁿ⁻¹n! (D₄: 192), 51840 (E₆), 2903040 (E₇), 696729600 (E₈). Supplied: A (RootSystems §3.2 on main, uncited) and E₈ (§6G). D/E₆/E₇: none, in 14 rows | Gap | R02 |
| Glue factors | 23 rows | order ÷ Weyl order are all integers (listed under R02) | Consistent | none |
| `evenUnimodularMass_eq` | n = 8; n = 4; n = 0 | n = 8: `bernoulliFullMass 4` = 1/696729600 = 1/\|O(E₈)\|. n = 4: no even unimodular lattice, so mass 0 vs `bernoulliFullMass 2` = 1/576. n = 0: mass 1 vs `bernoulliFullMass 0` = \|1/0\|·… = 0 | Both hypotheses necessary and present | none |
| `rank16_classNumber` | E₈², D₁₆⁺ | 2 classes, with the reciprocal sum equal to M₁₆ (row above) | Consistent | none |
| `rank24_classNumber` | 24 lattices | the reciprocal sum equals M₂₄ (row above) | Consistent | none |
| `rank32_classNumber_lower_bound` | 2M₃₂ ≤ h₃₂ | 2M₃₂ = 80618465.871…, so h ≥ 80618466 > 10⁷ | Holds | none |
| `rank40_classNumber_lower_bound` | 2M₄₀ ≤ h₄₀ | 2M₄₀ = 8.786…·10⁵¹ > 10⁵¹ | Holds | none |

### Adversarial table: unchanged statements carried forward

These are not recomputed this round. Each row cites the previous review (~5), which carried them from ~4 or ~3.

| Statement | Values (source) | Result |
| --- | --- | --- |
| Line 9: definite finiteness, label 2C | diag(1,2): 4 sign isometries; x²−2y²: (3,2), (17,12), (99,70) have norm 1 (~5/~4) | Definiteness needed |
| Line 9: Layer 5 owns Aut = W ⋊ based | A₁ 2 = 2·1; A₂ 12 = 6·2; D₄ 192·6 = 1152 (~5) | Owned at #1196 |
| Line 58: no classification needed | Γ orders 2, 2; 6, 2, 2 for E₈², D₁₆, E₈³, A₂₄, D₂₄ (~5) | True |
| Line 30: glue orders of the four excluded rows | 4096² = 2²⁴; 729² = 3¹²; 64² = 4⁶; 12² = 144 (~4) | Unimodular |
| Line 559: A₁²⁴ Check | 1+759+2576+759+1 = 4096; minimum 8/2 = 4 vs 4/2 = 2 (~4) | Discriminating |
| §6E separation; Leech | 480/720/432 root counts; ∅ vs 48 roots (~4) | Separates |
| Line 539: E₈² and D₁₆⁺ orders | 2·696729600²; 2¹⁵·16! (~5) | Correct |
| Line 66: Leech order | 2·\|Co1\| = 8315553613086720000; 196560 minimal vectors (~4) | Consumed |
| §0.3: proper-to-full | U⊕⟨1⟩ reflection det −1; I₃ excluded (~4) | Scope kept |
| §0.1a quadratic-preserving equations | xy over F₂: 2 vs 6 (~3) | Correct |
| Dickson; split/nonsplit orders | F₂: 2, 6; F₄: 6, 10 (~3) | Correct |
| Rank-zero/singular guards | 1 vs 0; GL₂ 6 vs 2 (~3) | Guards needed |
| §0.2 inverse transpose; stabilizer transport | MᵀCM = diag(16,1/4); full/proper 2/1 (~3) | Correct |
| §1.1 quotient, action, finiteness | 9/25+16/25 = 1; 36/6 = 6 (~3) | Correct |
| §1.4 imaginary constant and conductor | L(1) = π/(3√3), mass 1/12; h(−12) = 1 (~3) | Correct |
| §1.4 real residue and nonmaximal order | D = 5: (1,2); D = 12: (2,1); ε⁶, R_f⁺ = 6R (~3) | Correct |
| Filtration, X/B/W/Y/Z | diag(1,2): 2, 2, 4, 2, 1 (~3) | Correct |
| Unipotent count; Cho density | A⁰, A¹ over F₄: 2, 8; α = 2β (~3) | Correct |
| §2.3 general mass: A₂, −23, E₈ | 1/12; 3/4; 1/696729600 (~3) | Match |
| Density guards; character | n = 0: 0 vs 1; D = −3, 5, 1 (~3) | Correct |
| Smooth model, special fibre | 1 point; ⟨1⟩: 2 vs 1 (~3) | Correct |
| Cho N, stabilization, densities | 1, 2, 2, 8; α₂ = 4, 8 (~3) | Agree |
| Good-prime sign and convergence | U at 3: 2/3 vs 4/3; 8/9, 64/81 (~3) | Correct |
| §4.1 coercivity, determinant | μ = 1, c = 1/2; rank 0 c = 1; det ±1 (~3) | Correct |
| Gram universe, setoid, class map | [1], [2] positive, [0] not; A⁻¹A = I (~3) | Correct |
| O/SO, low ranks, Spin | rank 0: 1, 1; rank 1: 2, 1; dimensions 3, 6, 15 (~3) | Correct |
| Full/proper masses; real gauge | 12/6 = 2; V₃ = 8π², V₄ = 16π⁴ (~3) | Correct |
| Bernoulli sign; evaluation range | B₀ + 2B₁ = 0; B₃₈ = 2929993913841559/6 (~3; B₃₈ recomputed this round) | Correct |
| Rank-24 injectivity; isogeny exclusion | ≤ 23 with a repeat; ℚ×/ℚ×² infinite (~3) | Guards kept |

### Ownership

The change adds no object and no `Suggested.lean` name. It points one Tau Ceti citation at another file and adds one internal citation (§3.2) to each of two *Needs:* lines. Ownership against open pull requests: the overlaps file lists no pull request that changes this roadmap or drops an id it cites. Its revision-only ids are handled as in the previous round: the IntegralLattices labels other than N0–N1 are on main (a false positive), and RootSystems Layers 5/6 and N0/N1 are R03. The closest roadmaps (IntegralLattices, OrthogonalSpinGroups, ThetaSeries, LatticePackingsAndPerfectForms, GeometryOfNumbersAndQuadraticArithmetic) were compared in earlier rounds, and no changed line touches what they own.

## Not verifiable

- **O'Meara, 104:4–5.** Uncertified in the README and unchanged. The earlier reports record the legal searches.
- **The build at main's pins.** The Lean commands this review may run use the branch at `a91d3aa`/`6b7abb3`. R01's repair is confirmed by the targeted build after the rebase.
- **Unreopened locators.** The Borcherds tables and the Conway–Sloane, Cho, Belolipetsky–Gan and Milne locators are untouched by the diff and were not reopened.

## Source issues

- **Misprint** in ChenevierLannes at Chapter II, Theorem 3.16, printed p.48: the source says every even unimodular lattice without roots is the Leech lattice; it should be restricted to dimension 24, as the surrounding section is (Leech⊕Leech is rootless in rank 48); affects nothing. Re-observed at ChenevierLannes line 1886.
