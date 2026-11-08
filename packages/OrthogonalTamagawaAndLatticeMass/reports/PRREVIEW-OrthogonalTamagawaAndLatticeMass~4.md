# Review of OrthogonalTamagawaAndLatticeMass (pull request #1222 at 36e40db)

**Verdict:** needs changes

This is an incremental re-review of the 31 lines that changed since f61a4d2. The new text is mathematically correct. It moves the rank-24 lattices to Tau Ceti and Rank24LatticeConstructions, the Leech order to CFSGBasicProperties P2-L, and non-isometry to IntegralLattices §6E, and every number it adds recomputes. Three problems remain. The branch's pinned Tau Ceti does not contain the rank-24 declarations the new supplier contract names. Two of the cited ids exist only in open revisions that the description does not name. One Needs line was left behind by the narrowing.

## R01 (P2) — The rank-24 Tau Ceti contract names declarations absent at the branch's pin

**Location.** `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md` line 30, used again at lines 9, 551, 553, 555 and 582: "The rank-24 lattices of §4.2 are native: `TauCeti.RootfulNiemeierType` … in `TauCeti/LinearAlgebra/IntegralLattice/Rank24/RootSystems.lean`; `RootfulNiemeierType.lattice` … in `…/Rank24/Niemeier.lean`; `TauCeti.leechLattice` …"

**Claim.** The README says these 21 declarations and five files are part of the pinned Tau Ceti, and §4.2's route and *Needs:* line rely on them.

**Witness.** The branch's `lake-manifest.json` pins Tau Ceti `a91d3aa` (2026-10-05). At that commit, `TauCeti/LinearAlgebra/IntegralLattice/` has no `Rank24` directory. A recursive search finds no `leechLattice`, no `RootfulNiemeierType` and no `map_span_vectorsOfNorm`. All 21 names exist at main's pin `2fd255d`, which is 520 commits ahead of this branch.

**Repair.** Merge current main into the branch, or rebase onto it, so that the manifest pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4` (toolchain v4.36.0-rc2). Then re-run the targeted build. The README text can stay as it is. I checked every cited name at `2fd255d`, at the cited file:

- `Rank24/RootSystems.lean`: lines 43 and 216.
- `Rank24/Niemeier.lean`: lines 84, 154, 158, 163, 169, 179 and 200.
- `Rank24/Leech/Basic.lean`: lines 236, 285, 289, 299 and 304.
- `Rank24/Leech/Minimum.lean`: lines 173 and 189.
- `PosDef/RepresentationNumber.lean`: line 179.
- The four separately glued models: `A1TwentyFour.lean:376`, `A2Twelfth.lean:383`, `D4Six/Lattice.lean:126` and `A11D7E6.lean:321`.
- The glue orders: `Glue/IdentifiedRows.lean`, lines 94, 140, 266 and 328.

If the branch has to stay on `a91d3aa`, the lattices are not native there. §4.2 would then have to consume them from Rank24LatticeConstructions Layers 3 and 6 alone, and cite the pinned `IntegralLattice.Isometry.carrierEquiv_image_vectorsOfNorm` (`PosDef/RepresentationNumber.lean:161`) in place of `map_span_vectorsOfNorm`.

## R02 (P3) — Ids defined only by two open revisions, neither named in the description

**Location.** README line 34: "§§4A–4C and N0–N1 for class, genus and proper spinor-genus carriers; … §6E … (its statement for two table rows assumes that each row's root sublattice is the row's displayed root lattice)". Line 58: "Layer 5 (§§5.1–5.3) … and Layer 6 §6.1". The same ids appear at lines 9, 169, 539, 541, 551, 553, 555 and 582.

**Claim.** These IntegralLattices and RootSystems ids are supplier sections.

**Witness.**

- Main's IntegralLattices has no N0 or N1. Its §6E (line 1668) constructs the 24 lattices and proves their root systems unconditionally, and its 2C (line 785) is a milestone, not a native label. The head of the IntegralLattices revision #1239 has N0 at line 1429, N1 at line 1468, the conditional §6E at line 2110, and 2C as a native label (line 455).
- Main's RootSystems ends at Layer 3. Layer 5 (line 905) and §6.1 (line 1037) exist only at the head of the RootSystems revision #1196.
- The description names neither revision.

**Repair.** List the IntegralLattices revision #1239 and the RootSystems revision #1196 in the description's depends-on block and merge-order paragraph, as suppliers that merge first. The README already cites both roadmaps by name and section; it needs no change for this finding.

## R03 (P3) — §4.1 still cites "RootSystems Layers 5–6", and Layer 3 §3.1 is in no *Needs:* line

**Location.** README line 539: "The automorphism orders are deductions from RootSystems Layers 5–6 and IntegralLattices §§6D/6G". Line 541: "*Needs:* … RootSystems Layers 5–6; §3.1."

**Claim.** The narrowed supplier contract (line 58) and the Layer 4 Dependencies (line 582) say Layer 4 uses RootSystems Layer 3 §3.1, Layer 5 and Layer 6 §6.1.

**Witness.**

- At the RootSystems revision head, Layer 6 also contains §6.2, "Positive invariant forms and squared lengths" (line 1062). Neither rank-16 order uses it. W(E₈)≀S₂, of order 2·696729600² = 970864271032320000, needs only §§5.1–5.2 and §6.1. W(D₁₆), of order 2¹⁵·16! = 685597979049984000, needs only §5.2.
- Layer 3 §3.1 is named as a Layer 4 input at lines 58 and 582, but no Layer 4 *Needs:* line cites it.

**Repair.**

- At lines 539 and 541, write "RootSystems Layer 5 and Layer 6 §6.1".
- Then either add "RootSystems Layer 3 §3.1" to the §4.1 and §4.2 *Needs:* lines, if the component types are read through the classification, or delete §3.1 from lines 58 and 582.

## Previous findings

- none. The previous review, at f61a4d2, raised no findings; its R01–R05 belonged to the review before it and were recorded there as repaired. This head therefore has no earlier finding to account for. R01–R03 above are new problems introduced by this round's repair.

## Verified sound

### Gate, build and Lean form

- **Scope of the change.** Only `README.md` changed in the folder (22 insertions, 9 deletions). Nothing changed outside the folder. `Suggested.lean` is byte-identical to f61a4d2.
- **Gate.** The full gate, run again on this head, printed `OK` with every counter at 0. The worker's gate also records `build=0`.
- **Elaboration.** `lake env lean` of `Suggested.lean` at the branch's pins gave exactly five `declaration uses 'sorry'` warnings, at lines 109, 116, 120, 124 and 128.
- **Binder check.** A scratch copy with `#check @name` for all **17 declarations** elaborated. Each type matches `signatures.md` and its README statement: `evenUnimodularMass_eq` keeps `0 < n` and `8 ∣ n`, and the class counts 2 and 24 and the bounds 10⁷ and 10⁵¹ use the even-unimodular `GramClass` subtype. No binder was lost.
- **Padding probe.** Replacing each `sorry` by `simp` left all five theorems unproved. One made no progress and four had unsolved goals. `rfl` failed on all five. There is no padding.
- **Headlines.** The inventory is unchanged from the previous report. The five statable lattice headlines are stated. The docstring names the unstatable ones (0.1, 0.1a, 0.3, 1.1–1.4 and 2.1–2.2), each with the carrier it lacks.

**Dependency check, run again:**

```text
depcheck: 239 roadmaps, 2429 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The two new suppliers, Rank24LatticeConstructions and CFSGBasicProperties, are both on main. Neither one, and neither RootSystems copy, mentions this roadmap, so they form no cycle.

### Supplier citations resolved (changed passages)

| Citation | Where checked | Result |
| --- | --- | --- |
| Rank24LatticeConstructions Layer 3 | main, lines 223–249 | 23 rows N_r = R_r glued along H_r; even, unimodular, positive definite, rank 24; root sublattice equals R_r via μ(w) ≥ 4. Matches line 62. |
| Rank24LatticeConstructions Layer 5 | main, lines 293–310 | A componentwise isometry plus permutation of equal-type components carrying H to H′ induces R_H ≅ R′_(H′). It explicitly states no stabilizer identification. |
| Rank24LatticeConstructions Layer 6 | main, lines 312–374 | `Leech = K.ofIsotropicSubgroup(H_s)`, minimum 4, no roots. Lines 15–20 exclude classification and uniqueness, as line 62 says. |
| CFSGBasicProperties P2-L | main, lines 528–562, table row 410 | Consumes Rank24LatticeConstructions Layer 6's Λ with form ½·dot. The faithful action on the 196560 minimal vectors proves `Co0 := Aut(Λ)` finite. Conway generators generate it, it computes the order, and Co1 = Co0/{±1}. Matches line 66. The open revision #698 keeps P2-L (its line 388) but constructs its own Λ; it is another author's revision, so main governs. |
| IntegralLattices N0, N1, 4A–4C, 4D, 4E | main lines 1273–1366; revision #1239 lines 82, 1415–1660 | 4D is Eichler's theorem with this roadmap as owner (main line 1359; revision line 82, mapped to §0.3). The rank ≥ 3 half of 4E is §0.3's. N0–N1 exist only at the revision (R02). |
| IntegralLattices 6C, 6D, 6E, 6G, 9B | main lines 1655–1689, 2041; revision lines 2054–2182, 2657 | The revision's 6E proves conditional separation from `components_multiset_injective` and `map_span_vectorsOfNorm`, plus Leech separation. 6G is 240·126·23040 = 696729600. In both copies 9B takes the mass as a hypothesis. |
| IntegralLattices consumes nothing here | revision lines 86–95 | 7H maps to §§2.3/3.1, 7I to §4.1 and 4D to §0.3, and the revision states that no milestone of it consumes this roadmap. Matches line 586. |
| RootSystems Layer 3 §3.1 | main line 506; revision line 687 | Classification independent of a base. |
| RootSystems Layer 5 §§5.1–5.3, Layer 6 §6.1 | revision #1196, lines 905–1060 | W complements the based subgroup. Oriented diagram automorphisms; lattice-preserving subgroups including permutations of isomorphic components; irreducible components. Matches line 58. |
| LatticePackingsAndPerfectForms consumes §§3.1, 4.1–4.2 | revision #1723, lines 110–121, 270–272 | It consumes this roadmap's §4 orders, masses and class counts, so the consumer line is correct. That roadmap also cites §4 for |O(E₈)| (IntegralLattices §6G) and for the Leech order (CFSGBasicProperties P2-L). This is a matter for its own review. |

**Pinned declarations.**

- At the branch's pin `a91d3aa`, these exist: `IntegralLattice.IsPosDef.finite_isometry` (`PosDef/Finite.lean`, doc line 43), `IntegralLattice.Isometry` between different ambient spaces (`Isometry/Basic.lean:74`), and `IntegralLattice.isLattice`, which spans the ambient space (`Basic.lean:69`), so §0.0's basis presentation applies to full-rank ambients.
- At main's pin `2fd255d`: `leechLattice_form` is `ConstructionA.form 2 = 2⁻¹·dot` (`ConstructionA/Basic.lean:132`), matching P2-L. `IdentifiedRows.lean` also proves μ(w) ≥ 4 for the table subgroups of A₁²⁴, D₄⁶ and A₁₁D₇E₆, but not A₂¹² (lines 107, 277, 340), and it has no named root-sublattice theorem for the table lattice of those four rows. Line 30's wording is therefore exact.

**Ownership.** I searched `roadmaps grep` over main and all open heads for "Niemeier", for `Co0`/`Aut(Λ)` and for 8315553613086720000.

- The 24 lattices are owned by Tau Ceti and Rank24LatticeConstructions.
- The Leech isometry group and its order are owned by CFSGBasicProperties P2-L.
- Non-isometry is owned by IntegralLattices §6E (revision).
- The 23 rootful orders and rank-24 completeness are owned here.

No second owner was found, and no `Suggested.lean` name collides.

**Overlaps file.**

- It lists IntegralLattices §§2C–9B as defined only at revision #1239. Main has all of them as bold labels, except N0–N1; R02 records N0–N1 and the revision-only content of §6E and 2C.
- RootSystems Layer 5 is revision-only, as R02 records.
- No open pull request drops an id cited here.

### Sources (changed seeded targets 0.3 and 4.2)

The ChenevierLannes v2 text was fetched again through the sources service (arXiv 1409.7616v2). Theorems 3.16–3.17 are at text lines 1886–1893, printed p.48 (page footer at line 1897, PDF page 53). Theorem 3.17 gives a bijection between rank-24 even unimodular classes and the 23 equi-Coxeter ADE systems plus the empty set, which supports `rank24_classNumber`. Corollary 3.6 is at line 1589, printed p.41.

The changed lines add no other source locator. The other 13 seeded targets, the Borcherds tables and the O'Meara status are unchanged, and the previous report's checks of them are carried forward.

### Adversarial table: changed statements (computed this round)

| Statement | Instances | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Line 9: definite finiteness is native (label 2C) | diag(1,2); x²−2y² | 4 sign isometries, finite. (3,2), (17,12), (99,70) all have norm 1, giving infinitely many integral automorphisms of the indefinite form | Definiteness hypothesis is necessary and is carried by `IsPosDef` | none |
| Line 30: native rank-24 declarations | Branch pin a91d3aa vs main pin 2fd255d | 0 of 21 names found vs 21 of 21 | Fails at the branch pin | R01 |
| Line 30: the four excluded rows are unimodular via glue orders | A₁²⁴, A₂¹², D₄⁶, A₁₁D₇E₆ | |H|² against |A_R|: 4096² = 2²⁴; 729² = 3¹²; 64² = 4⁶; 12² = 144 = 12·4·3 | All equal | none |
| Lines 30/62: root sublattice of the four rows | Glue minima | A₁²⁴: 8·½ = 4; A₂¹²: 6·⅔ = 4; D₄⁶: 4·1 = 4; A₁₁D₇E₆ words [kkk], k = 1..11: 4,4,4,4,6,4,6,4,4,4,4 | All ≥ 4, consistent with Layer 3; 23 − 4 = 19 native rows | none |
| Line 559: new A₁²⁴ Check | Golay enumerator; weights 8 and 4 | 1+759+2576+759+1 = 4096 = 2¹²; coset minimum 8/2 = 4 vs 4/2 = 2 (a root); roots 24·2 = 48 | Check is correct and discriminating | added Check |
| §4.2 / §6E: the root system separates, the count does not | E₈² vs D₁₆⁺; D₁₆E₈ vs E₈³; A₁₇E₇ vs D₁₀E₇² | 480 = 480; 720 = 720; 306+126 = 180+252 = 432 | Equal counts, distinct multisets | none |
| Line 551: Leech separation | Leech vs fewest-root row | Norm-2 set ∅ (minimum 4) vs 24·h(A₁) = 48 roots | Never isometric | none |
| Line 551: §0.0 transport of native lattices | Row ambient ∏ Fin(rankᵢ) → ℚ; Leech Fin 24 → ℚ | Ambient dimension 24 = `finrank` 24; carrier spans; Gram integral, symmetric, positive definite; Leech discriminant 1 | Distinct isometry classes give distinct `GramClass 24` classes | none |
| Line 553: O(N) = stabilizer of H in Aut(Φ) | D₂₄; A₂₄; E₈³ | |W(B₂₄)|/|W(D₂₄)| = 2 and the swap s↔c moves H, so factor 1; H = {0,5,10,15,20} = −H, so factor 2; H = 0, so factor |S₃| = 6 | Matches Borcherds factors 1, 2, 6 | none |
| Line 58: RootSystems Layer 5 complement | A₂; D₄ | 12 = 6·2; |W(D₄)| = 192, Aut = 192·6 = 1152 | Matches revision §§5.1–5.2 Checks | none |
| Line 66: Leech order from P2-L | Co1 = Co0/{±1} | |Co1| = 2²¹·3⁹·5⁴·7²·11·13·23 = 4157776806543360000; 2|Co1| = 8315553613086720000; 1104+97152+98304 = 196560 | Using Co1 doubles the reciprocal; the empty root action gives 1 | order consumed |
| Line 66: P2-L's Λ is native `leechLattice` | Form and shift | ½·dot on Fin 24 → ℚ; s = (−3/2, 1/2, …); B(s,s) = (9/4 + 23/4)/2 = 4 | Same lattice | none |
| §4.2: 24-term mass with consumed order | 23 proved orders + Leech | Σ 1/|O| = 1027637932586061520960267/129477933340026851560636148613120000000 = `bernoulliFullMass 12` | Exact equality | recomputed |
| §0.3: 4D label and interface | main 4D, revision 4D/N0/N1 | Main line 1359 assigns ownership to this roadmap; revision line 82 maps 4D to §0.3; N0/N1 at revision lines 1429/1468 only | Correct at the revision | R02 |
| §0.3: proper-to-full passage | U⊕⟨1⟩; I₃ | Reflection in e₃: det −1 and integral, so cls = cls⁺; I₃ has signature (3,0) and is excluded | Scope retained | none |
| Line 586: IntegralLattices consumes nothing | Revision lines 86–95; main 9B | 7H → §§2.3/3.1, 7I → §4.1, 4D → §0.3; 9B mass is a hypothesis | Single direction of supply | none |
| §4.1 vs line 582 | E₈², D₁₆⁺ | 970864271032320000 uses §§5.1–5.2 and §6.1; 685597979049984000 uses §5.2; §6.2 unused | Inconsistent citation | R03 |
| Line 9: §6G | O(E₈) | 240·126·23040 = 696729600 | Matches | none |

### Rank-24 order calculation (recomputed this round)

Each row is the Borcherds factor times the Weyl order. The Leech row is now consumed from P2-L.

| Root system | Factor × Weyl | Order |
| --- | --- | --- |
| Leech | P2-L, 2·|Co1| | 8315553613086720000 |
| A₁²⁴ | 244823040·2²⁴ | 4107449023856640 |
| A₂¹² | 190080·6¹² | 413762786426880 |
| A₃⁸ | 2688·24⁸ | 295882444505088 |
| A₄⁶ | 240·120⁶ | 716636160000000 |
| A₅⁴D₄ | 48·720⁴·192 | 2476694568960000 |
| D₄⁶ | 2160·192⁶ | 108208436847575040 |
| A₆⁴ | 24·5040⁴ | 15485790781440000 |
| A₇²D₅² | 8·40320²·1920² | 47943914618880000 |
| A₈³ | 12·362880³ | 573416710078464000 |
| A₉²D₆ | 4·(10!)²·23040 | 1213580338790400000 |
| D₆⁴ | 24·23040⁴ | 6763027302973440000 |
| A₁₁D₇E₆ | 2·12!·322560·51840 | 16019260472033280000 |
| E₆⁴ | 48·51840⁴ | 346657985428193280000 |
| A₁₂² | 4·(13!)² | 155103152174530560000 |
| D₈³ | 6·(2⁷·8!)³ | 824788751971516416000 |
| A₁₅D₉ | 2·16!·2⁸·9! | 3887340541213409280000 |
| A₁₇E₇ | 2·18!·2903040 | 37172693925353226240000 |
| D₁₀E₇² | 2·2⁹·10!·2903040² | 31316197926418513920000 |
| D₁₂² | 2·(2¹¹·12!)² | 1924703466207817236480000 |
| A₂₄ | 2·25! | 31022420086661971968000000 |
| D₁₆E₈ | 1·2¹⁵·16!·696729600 | 477676405704303732326400000 |
| E₈³ | 6·696729600³ | 2029289625631919702016000000 |
| D₂₄ | 1·2²³·24! | 5204698426366666226930810880000 |

### Adversarial table: unchanged statements carried forward

These rows are unchanged statements. Each row's values are carried from [the previous report](PRREVIEW-OrthogonalTamagawaAndLatticeMass~3.md), abbreviated **P3**, which itself carried some of them from its predecessor. They are carried evidence, not values recomputed this round. P3's "rank-24 mass identity" and "Leech/rootless guard" rows are replaced by the fresh rows above.

| Statement | Instances and values (P3) | Result |
| --- | --- | --- |
| §0.1a quadratic-preserving equations | xy over F₂: quadratic group of 2 elements, polar stabilizer of 6; the shear is excluded by q(1,1)=1 | Shear excluded (P3) |
| Point functor | Swap S: S²=I, q(Sv)=q(v); identity gives q(v)−q(v)=0 | Group law (P3) |
| Reduction, reduced vs nonreduced | q=z² on F₂ and F₂[ε]: reduced group 1, 1; μ₂ 1, 2 | Reduced restriction needed (P3) |
| Dickson convention | Split binary swap: det 1, rank(I−S)=1, Dickson value 1 | det 1 ≠ identity component (P3) |
| Split/nonsplit even orders | F₂: 2, 6; F₄: 6, 10; formula 2(q∓1) | Equal (P3) |
| Odd reduced order | z²+xy over F₂: 6 = 2(2²−1) | Equal (P3) |
| Rank-zero and singular guards | Zero space 1 vs formula 0; singular plane GL₂ 6 vs 2 | Guards needed (P3) |
| §0.2 inverse transpose | C=diag(1,4), M=[[0,1/2],[2,0]]: MCMᵀ=C, MᵀCM=diag(16,1/4), M⁻ᵀ preserves C | Correct direction (P3) |
| Stabilizer transport | C=[2], p=3: full/proper orders 2/1, volume ratio 2 | Distinction kept (P3) |
| §1.1 quotient inverse | Rational SO₃ rotation at 3: 9/25+16/25=1; [(1,1)]≠[(1,k)] before the K_f quotient | Correct (P3) |
| Conjugated action | k′=(gᵢ⁻¹δ_f gᵢ)k | Stated action (P3) |
| Finite quotient, S₃ | 36/6=6; then 1 | Correct (P3) |
| General quotient | ℤ on ℝ: ∞/∞ avoided; [0,1) has measure 1 | Guard (P3) |
| §1.4c coefficients | k=2 split/inert/ramified: 3, 1, 1 | Equal (P3) |
| Zeta comparison | Through T²: 1,2,3; 1,0,1; 1,1,1 | Equal (P3) |
| Imaginary constant | D=−3: L(1)=π/(3√3); mass 1/12 | Distinct (P3) |
| Imaginary conductor | D=−3, f=2: unit index 3, h(−12)=1 | Correct (P3) |
| Conductor local factors | f=1: 1; p=2 residue factors 1, 3, 2 | Correct (P3) |
| Real residue, narrow ratio | D=5: (1,2); D=12: (2,1); product 2 | Correct (P3) |
| Regulator subgroup | log η³ = 3R⁺ | Index 3 (P3) |
| Real nonmaximal order | D=5, f=2: η_f=ε⁶, R_f⁺=6R, h_f⁺=1 | Correct (P3) |
| Filtration Aᵢ | diag(1,2): both inclusions of index 2 | Correct (P3) |
| X, B, W, Y, Z | diag(1,2): sizes 2, 2, 4, 2, 1; dim B/Z=1 | Correct (P3) |
| Free even I₁ | [[1,1],[1,2]]: X=Z=1, B=W=Y=2 | Iᵉ₁ (P3) |
| Free even I₂, bound guard | [[1,1],[1,0]]: dim B/Z=0; adjoining ⟨2⟩ makes it bound | Correct (P3) |
| Frobenius semilinearity | F₄ squares 0,1,t+1,t; kernel 1 | Not linear (P3) |
| Hyperbolic radical | U: B has 4, zero locus 3, radical 1 | Radical only (P3) |
| Auxiliary dimensions | (1,1,1), (1,1,1), (1,1,0), (0,0,0), (0,0,0) | All ≤ 1 (P3) |
| Basis-change naturality | Swap on diag(1,2) | Transported (P3) |
| Unipotent point count | A⁰, A¹ over F₄ with C₂: 2, 8 | Lang agrees (P3) |
| Cho density | ⟨1⟩, ⟨2⟩, U: β = 2, 4, 2; α = 4, 8, 4 | α = 2β (P3) |
| §3.1 Bernoulli/full mass | Rank 8: 1/696729600; rank 16: 691/277667181515243520000 | Correct (P3) |
| §4.1 coercivity | diag(1,2): μ=1, c=1/2; rank 0: c=1 | Guard correct (P3) |
| Column/determinant bounds | entries ≤ 2, 4; det²·2=2 gives det ±1 | Consistent (P3) |
| Rank-16 orders | 970864271032320000, 685597979049984000; sum is the mass | Correct (P3) |
| §4.3 inequality | Weights 1/4, 1/2: 3/2 ≤ 2; rank 0: 2 > 1 | hn needed (P3) |
| Rank-32 bound | 80618465 < 2M₃₂ < 80618466 | > 10⁷ (P3) |
| Rank-40 bound | ⌊2M₄₀⌋ = 8786162893954707795924443121224722752459224292177832 | > 10⁵¹ (P3) |
| Gram universe | Rank 0 det 1; [1], [2] positive; [0] not | Correct (P3) |
| Native Gram lattice | [1] norm 1, [2] norm 2, carrier ℤ | Correct (P3) |
| Gram equivalence | [1]≁[2]; [1]~[4] over ℚ only | Integral needed (P3) |
| Basis transport | AᵀGA=[[1,1],[1,3]], det 2 on both sides | Same class (P3) |
| Setoid laws | A⁻¹A=I; A²: [[1,2],[2,6]] | Elaborates (P3) |
| Class map | det 2 vs 8 under diag(2,1) | Nonunit excluded (P3) |
| Full automorphism order | Empty 1; [1], [2]: 2; diag(1,2): 4 vs 2 | Full weight (P3) |
| Representative independence | diag(1,2) and [[1,1],[1,3]]: both 4 | Harmless (P3) |
| O/SO convention | M⁻ᵀ preserves C | Correct (P3) |
| Multiplicativity | (MN)⁻ᵀ=M⁻ᵀN⁻ᵀ; det −1 kept | Correct (P3) |
| O/SO low ranks | Rank 0: 1, 1; rank 1: 2, 1 | Split (P3) |
| Spin rank 0 | ±1 vs generated group of order 1 | Branch kept (P3) |
| Spin rank 1 | Kernel 2, SO 1 | Correct (P3) |
| Binary Spin torus | (e₁e₂)²=−1; ((3+4i)/5) has norm 1 | Torus (P3) |
| Nonabelian Spin | Q₈ → rotations of order 4, kernel 2 | Noncommutative (P3) |
| Spin dimensions | n=3,4,6: 3, 6, 15 | Consistent (P3) |
| Rank-four factors | Four squares: 2 factors; diag(1,1,1,2): 1 | Correct (P3) |
| Rational Spin image | Spinor norm 2 ≠ 1 mod squares | Not in image (P3) |
| Simply connected guard | SO₃ = PGL₂, kernel 2 | Not simply connected (P3) |
| Local stabilizer index | C=[2], p=3: 2 | Persists (P3) |
| Finite-reference change | Index-2 change halves the volume | Comparison needed (P3) |
| Strong approximation | Split SL₂ unipotent; definite ternary compact | Hypothesis (P3) |
| Factorwise noncompactness | 1 of 2 factors fails | Factorwise (P3) |
| Eichler scope | Split rank 3 is indefinite; positive ternary (3,0) | Rank ≥ 3 indefinite only (P3) |
| Full/proper masses | O=12, SO=6: ratio 2; splitting class 1/2 + 1/2 = 1 | Correct (P3) |
| Zero-rank quotient | Both masses 1 | Branch (P3) |
| Real gauge | V₃=8π², V₄=16π⁴ | Constants (P3) |
| Gauge product, I₃ | Mass 1/48 on both sides | Consistent (P3) |
| Integral rescaling | n=2: ×8 both sides; n=3: ×2⁶ | Cancels (P3) |
| Local reflection | U, v=(1,1), det −1 | Integral (P3) |
| General mass, A₂ | 1/12 | Matches (P3) |
| General mass, −23 | 3/4 = 1/4 + 1/2 | Matches (P3) |
| General mass, E₈ | 1/696729600 with dyadic factor 2⁸ | Matches (P3) |
| Density rank guard | n=0 gives 0 vs 1; n=1 gives 1/2 | Branches (P3) |
| Norm-content adapter | A₂: Δ=−3 both ways | Agree (P3) |
| Odd half-norm | diag(1,1): Q(1,0)=1/2 | Rejected (P3) |
| Content vs conductor | [[4,1],[1,6]] and its double: Δ=−23 | Order invariant (P3) |
| Polar matrix | A₂ 2B/g integral | Correct (P3) |
| Character level | D=−3, 5, 1 | Hypotheses kept (P3) |
| Endpoint deletion | 3/2, 1, 1/2 | Multiply (P3) |
| Genus conversion | Δ=−23: 3 proper, 2 full; mass 3/4 | Proper count (P3) |
| Split Euler branch | Partial products 2, 3, 15/4 diverge | Excluded (P3) |
| Smooth model, rank 0 | 1 point, 1 automorphism | No division (P3) |
| Unary special fibre | ⟨1⟩: 2 vs 1 points | Distinct (P3) |
| Congruence kernels | f=4, n=2: 4; n=1: 1 | Residue cardinal (P3) |
| Zero constituent | Components 2 vs wrong 1 | Kept (P3) |
| Cho exponent N | ⟨1⟩: 1; ⟨2⟩: 2; U: 2; U⁴: 8 | c term kept (P3) |
| Unary stabilization | ⟨1⟩: 4,4,4; ⟨2⟩: 4,8,8 | α₂ = 4, 8 (P3) |
| U density | 32/8 = 64/16 = 4 | Agrees (P3) |
| A₂ dyadic density | α₂ = 12, β₂ = 6 | Agrees (P3) |
| −23 dyadic density | α₂ = 4, β₂ = 2 | Agrees (P3) |
| Odd bad primes | β₃ = 6, β₂₃ = 46 | Agrees (P3) |
| Good-prime sign | U at 3: β₃ = 2/3 vs wrong 4/3 | Signed determinant (P3) |
| Good-prime convergence | 8/9, 64/81 | Exponents ≥ 2 (P3) |
| Even/unimodular predicates | [1] odd unimodular; [2] even, det 2 | Correct (P3) |
| Rank-8 discrimination | E₈ in, I₈ out | Parity needed (P3) |
| Finite-sum transport | {1/4, 1/2} sums to 3/4 | Finite (P3) |
| One genus | Trivial discriminant, signature 8/16 | Agree (P3) |
| Bernoulli sign | B₀+2B₁=0; +1/2 gives 2 | Native convention (P3) |
| Product boundary | m=0: 0 vs mass 1 | hn (P3) |
| Mass, rank 8 / 16 | 1/696729600; 691/277667181515243520000 | Matches (P3) |
| Evaluation range | B₃₈ = 2929993913841559/6 | Range correct (P3) |
| Rank-24 list injectivity | Repeated representative gives ≤ 23 | Injectivity needed (P3) |
| Central-isogeny exclusion | ℚ×/ℚ×² infinite, kernel 2 | No shortcut (P3) |

## Not verifiable

- **O'Meara, 104:4–5.** The citation is explicitly uncertified and its locator is unchanged. The previous reports record the legal searches. This review does not certify that book.
- **The build at main's pins.** The Lean commands this review may run are limited to the branch worktree at `a91d3aa`/`6b7abb3`. I therefore did not reproduce the elaboration of `Suggested.lean` at `2fd255d`/`1b1ccf4` that R01's repair needs. The worker's gate report states that a scratch build at main's pins succeeded with the same five warnings; the targeted build after the rebase settles it.
- **Unreopened locators.** The Borcherds tables and the unchanged Conway–Sloane, Cho and Belolipetsky–Gan locators were not reopened, because no changed line touches them. The previous report's checks stand.

## Source issues

- **Misprint** in ChenevierLannes at Chapter II, Theorem 3.16, printed p.48: the source says every even unimodular lattice without roots is the Leech lattice; it should be restricted to dimension 24, as the surrounding section is (Leech⊕Leech is a rootless counterexample in rank 48); affects nothing. Re-observed at text line 1886; the previous report recorded the same slip.
