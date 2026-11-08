# Review of OrthogonalTamagawaAndLatticeMass (pull request #1222 at be1d8b4)

**Verdict:** needs changes

This is an incremental re-review of the 52 lines of `README.md` changed since 91f8383 (37 insertions, 15 deletions). `Suggested.lean` is unchanged (`git diff 91f8383 HEAD` on it is empty), and nothing outside the folder changed.

- **Repaired:** the previous R02 (Weyl-order route inputs and carriers), R03 (locator for the Weyl orders) and R04 (ids defined only by open revisions; both revisions have since merged into main). The new text names the pinned models, the base-change and parabolic inputs, the Fomin–Reading table, and the three new suppliers of the A₁²⁴ factor (Rank24LatticeConstructions Layer 4, CFSGBasicProperties P2-L, SporadicOrders O1); every citation resolves and every number recomputes (tables below).
- **Not repaired:** the previous R01, the Tau Ceti pin of the branch. It is raised again as R01. It is the only finding.

## R01 (P2) — The branch pins a Tau Ceti that lacks the cited root-system and rank-24 files

Carried from the previous R01; not repaired. The repair of R02 added nine more declarations that resolve only at main's pin.

**Location.** `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md`:

- Lines 34–46: "`RootPairing.card_weylGroup_of_hasCartanType_A` in `TauCeti/LinearAlgebra/RootSystem/Weyl/TypeA/Basic.lean`", "`TauCeti.weylGroupBaseChangeEquiv` in `…/Weyl/BaseChange.lean`", "`CoxeterSystem.parabolicHom` in `TauCeti/GroupTheory/Coxeter/Restriction.lean`", and the rest of the list.
- Line 30: the `Rank24/` files. Line 569: the *Needs:* line naming the same declarations.

**Claim.** The named declarations are in the pinned Tau Ceti.

**Witness.** `lake-manifest.json` on the branch still pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`; the merge base with `origin/main` is `63aa5ee`, and main pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4`. Of the 25 distinct `TauCeti/…lean` paths the README cites:

- all 25 exist at `2fd255d`, and every declaration named in the changed lines was opened there (file and line under Verified sound);
- 15 are missing at `a91d3aa`: `GroupTheory/Coxeter/Restriction.lean`, the five `IntegralLattice/Rank24/` files, `RootLattice/TypeE/WeylGroup.lean`, `RootSystem/HighestRoot.lean`, `SimplyConnectedRootDatum/E8/Automorphism.lean`, `Weyl/BaseChange.lean`, `Weyl/CartanType.lean`, `Weyl/Orbit/Basic.lean`, `Weyl/ParabolicQuotient.lean`, `Weyl/TypeA/Basic.lean`, `NumberField/Units/Regulator/Basic.lean`;
- two cited declarations whose files do exist at `a91d3aa` are absent there: `TauCeti.DynkinType.rationalRootSystem_def` (`Rational.lean`) and `TauCeti.weylCoxeterSystem` (`Coxeter/Presentation.lean`).

**Repair.** Merge `origin/main` into the branch (`git merge-tree --write-tree HEAD origin/main` is conflict-free, and main touches nothing in the folder), so that the manifest pins Tau Ceti `2fd255d` / Mathlib `1b1ccf4`; then re-run the targeted build. The README needs no change: every declaration it cites resolves at `2fd255d`.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `a91d3aa`; 15 of the 25 cited `TauCeti/…lean` paths, and two further cited declarations, are missing there. Raised again as R01.
- R02 — repaired: lines 32–46 name each declaration's carrier (`RootPairing.weylGroup` of a rational root system, `IntegralLattice.weylGroup` on the lattice side); line 561 names the model `TauCeti.DynkinType.rationalRootSystem t ht` with `rationalBase`, `hasCartanType_rationalRootSystem`, `rationalRootSystem_def` and `weylGroupBaseChangeEquiv`; line 565 names `pairingIn_highestRoot_nonneg`, `parabolic_wallIndices_eq_stabilizer`, `weylCoxeterSystem`, `parabolicHom_injective` and `range_parabolicHom` for the stabilizer; lines 9, 74, 563 and 585 take the E₈ factor from `card_weylGroup_e8SimplyConnectedRootDatum`. All on one carrier; no new problem introduced.
- R03 — repaired: line 559 cites "Fomin–Reading, arXiv v3, §2.5, Figure 2.8, p.24" and line 632 lists the work; the manifest records it as `FominReading`. The figure gives Dₙ: 2ⁿ⁻¹n!, E₆: 2⁷3⁴5, E₇: 2¹⁰3⁴5·7, E₈: 2¹⁴3⁵5²7 (FominReading lines 913–925, page marker 24 at line 897, §2.5 heading at line 846).
- R04 — repaired by the merge of the cited revisions into main, with no change to the folder needed: main's `TauCetiRoadmap/IntegralLattices/README.md` now has N0 and N1 (lines 1429 and 1468), and main's `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md` has Layer 5 (§§5.1–5.3, lines 905–993) and §6.1 (line 1037). The description's depends-on block no longer needs them.

## Verified sound

### Gate, build and Lean form

- **Scope of the change.** The diff since 91f8383 touches only `README.md` (37+/15−). `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Gate.** The worker's gate at this head printed `OK` with every counter at 0, including `build=0`.
- **Dependency check**, re-run on this head with `--movable`:

  ```text
  depcheck: 237 roadmaps, 2341 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line. The three suppliers the change adds (SporadicOrders, CFSGBasicProperties's Golay identification, Rank24LatticeConstructions Layer 4) are all roadmaps on main; SporadicOrders has no open pull request, CFSGBasicProperties only a draft docs pull request (#698).
- **Elaboration.** `lake env lean` of `Suggested.lean` at the branch pins (6 s) gave exactly five warnings, `declaration uses 'sorry'`, at lines 109, 116, 120, 124 and 128, and nothing else.
- **Binder check.** The file is unchanged since the previous round, whose `#check @name` pass over all 17 declarations matched `signatures.md`; this round's `signatures.md` lists the same 17 types (`evenUnimodularMass_eq` keeps `0 < n` and `8 ∣ n`; the four class-number headlines are closed statements). Nothing changed.
- **Padding and headlines.** Unchanged file: the previous one-tactic probe (15 attempts, none closes) and the headline inventory (`evenUnimodularMass_eq`, `rank16_classNumber`, `rank24_classNumber`, `rank32/40_classNumber_lower_bound`) carry over. The §4.1 Weyl-order target and the new A₁²⁴ factor are intermediate targets, rightly absent from the Lean file.

### Library declarations opened at Tau Ceti `2fd255d` (the content checkout's packages) and Mathlib

| Declaration | File:line | What it says, as checked against the README line |
| --- | --- | --- |
| `TauCeti.DynkinType.rationalRootSystem`, `rationalRootSystem_def`, `rationalBase` | `SimplyConnectedRootDatum/Rational.lean:80/88/95` | `RootPairing (Fin t.numRoots) ℚ (Fin t.rank → ℚ) (Fin t.rank → ℚ)`, equal to `rootPairingBaseChange ℚ (t.simplyConnectedRootDatum ht) …`; base supported on the first `t.rank` indices (line 36) |
| `hasCartanType_rationalRootSystem`; instances `IsCrystallographic`, `IsReduced`, `IsRootSystem`, `IsIrreducible` | `Rational.lean:199/137/133/182/206` | Cartan type t; the model is a root system, so `weylGroupToPerm_injective` applies (line 40, line 564) |
| `TauCeti.DynkinType.numRoots` | `NumberOfRoots.lean:45` | `E6 ↦ 72`, `E7 ↦ 126`, `E8 ↦ 240`, `D n ↦ 2n(n−1)` (line 36) |
| `TauCeti.weylGroupBaseChangeEquiv`, `weylGroupToPerm_weylGroupBaseChangeEquiv` | `Weyl/BaseChange.lean:111/130` | `P.weylGroup ≃* (rootPairingBaseChange S P hP).weylGroup` for `P` on `κ → R` with `hP : P.toLinearMap x y = x ⬝ᵥ y`, `[FaithfulSMul R S]`; same `weylGroupToPerm` (line 37) |
| `TauCeti.DynkinType.simplyConnectedRootDatum`, `_D`, `_E8` | `SimplyConnectedRootDatum/Assembly.lean:77/116/125` | Definition by cases; `D n ↦ typeDSimplyConnectedRootDatum n (valid_D.mp ht)`, `E8 ↦ e8SimplyConnectedRootDatum` (lines 38, 39, 563, 564) |
| `typeDSimplyConnectedRootDatum`, `root_…`, `coroot_…` | `SimplyConnectedRootDatum/D/Basic.lean:206/253/260` | `RootDatum (Fin (2n(n−1))) (Fin n → ℤ) (Fin n → ℤ)`, pairing `dotProductBilin`; root k in the fundamental-weight basis is `(typeDRootEquiv n hn k) ⬝ᵥ typeDSimpleRoot n hn j`, coroot k the simple-root coordinates of the same classical root; the reflection permutation is `typeDRootReflectionEquiv` conjugated by `typeDRootEquiv` (lines 169–172). So the pairing of root k with coroot l is the classical dot product of the two `±eᵢ±eⱼ`, as line 564 says |
| `TauCeti.DynkinType.TypeDRoot`, `typeDRootEquiv`, `typeDRootReflectionEquiv` | `ClassicalTypeD.lean:108/275/736` | `{x : Fin n → ℤ // x ⬝ᵥ x = 2}`; `Fin (2n(n−1)) ≃ TypeDRoot n` for `4 ≤ n`; the involutive permutation `v ↦ v − (v·u)u` (line 38) |
| `RootPairing.weylGroupToPerm_injective` | `Weyl/Group.lean:174` | Faithful on root indices under `[P.IsRootSystem]` (line 40) |
| `TauCeti.exists_mem_support_weylGroupToPerm_eq` | `Weyl/Orbit/Basic.lean:58` | Every root index is a Weyl image of a base index, `[CharZero R] [Finite ι] [IsDomain R]` (line 41) |
| `RootPairing.Base.highestRoot`, `pairingIn_highestRoot_nonneg` | `HighestRoot.lean:94/192` | A root of maximal height; `0 ≤ P.pairingIn ℤ b.highestRoot k` for `k ∈ b.support`, under `[CharZero R] [Finite ι] [Nonempty ι] [P.IsCrystallographic] [IsDomain R]` (line 42) |
| `RootPairing.parabolic_wallIndices_eq_stabilizer` | `Weyl/ParabolicQuotient.lean:135`, variables at 130 | `(weylCoxeterSystem P b).parabolic (P.wallIndices b lam) = MulAction.stabilizer P.weylGroup lam` for `lam ∈ dominantChamber P b`; `[LinearOrder R] [IsStrictOrderedRing R] [Finite ι] [P.IsCrystallographic] [P.IsReduced] [P.flip.IsReduced]` (line 43) |
| Mathlib `RootPairing.instFlipIsReduced` | `Mathlib/LinearAlgebra/RootSystem/Reduced.lean:202`, identical at `6b7abb3` and `1b1ccf4` | `[P.IsReduced] [IsTorsionFree R N] : P.flip.IsReduced`; a ℚ-module is torsion-free, so line 43's parenthesis holds |
| `TauCeti.weylCoxeterSystem` | `RootSystem/Coxeter/Presentation.lean:167` | `CoxeterSystem (coxeterMatrixOfBase P b) P.weylGroup`, by Tits' theorem, `[P.IsReduced]` (line 43) |
| `TauCeti.coxeterMatrixOfBase` | `RootSystem/Coxeter/Matrix.lean:278` | `CoxeterMatrix b.support` from the Cartan matrix (line 43; the README names no file for it) |
| `CoxeterSystem.parabolicHom`, `range_parabolicHom`, `parabolicHom_injective` | `GroupTheory/Coxeter/Restriction.lean:86/106/168` | For `f : B → B'` with `M i j = M' (f i) (f j)`: `W →* W'`, range `cs'.parabolic (Set.range f)`, injective (line 44, line 565) |
| `RootPairing.card_weylGroup_of_hasCartanType_A` | `Weyl/TypeA/Basic.lean:275`, variables at 256 | `Nat.card P.weylGroup = (n+1)!` for `1 ≤ n`, `P` over ℚ, finite, root system, crystallographic, reduced (line 34) |
| `TauCeti.nonempty_weylGroup_mulEquiv_of_hasCartanType` | `Weyl/CartanType.lean:62`, variables at 44–50 | Both systems over one `R` with `[CharZero R] [IsDomain R]`, finite, root systems, crystallographic, reduced (line 35) |
| `TauCeti.DynkinType.card_weylGroup_e8SimplyConnectedRootDatum` | `SimplyConnectedRootDatum/E8/Automorphism.lean:200` | `Nat.card e8SimplyConnectedRootDatum.weylGroup = 696729600` (lines 39, 563) |
| E₆ and E₇ pinned bases | `SimplyConnectedRootDatum/E6/Basic.lean:20–38`, `E7/Datum.lean:19–45` | Bourbaki numbering via `CartanMatrix.E 6/7`; the E₆ highest root has marks `(1,2,2,3,2,1)` (line 565's "Bourbaki numbering of the pinned bases") |

- **Pin coverage.** The 25 cited `TauCeti/…lean` paths were tested at both pins (R01).
- **Duplication.** Line 46's "Tau Ceti states no Weyl group order of type Dₙ, E₆ or E₇" was verified by sweep in the previous round at `2fd255d` and is unchanged; the type-E₈ order is cited, not restated.

### Cross-roadmap citations resolved (8)

| Citation | Where checked | Result |
| --- | --- | --- |
| Line 9, 86: SporadicOrders O1 owns the M₂₄ model and its order 244823040 | main `TauCetiRoadmap/SporadicOrders/README.md` lines 280–298 (Layer 1 = O1, carrier `M24 : Subgroup (Equiv.Perm (Fin 24))` as `Subgroup.closure {a, b}` from `M24G1-p24B0.m1/.m2`), 321, 407; line 12 `card_M24` | Present as described |
| Lines 9, 82, 585: CFSGBasicProperties P2-L identifies the P1 M₂₄ model with the full permutation automorphism group of the extended binary Golay code, compatibly with the coordinate actions | main `TauCetiRoadmap/CFSGBasicProperties/README.md` lines 530–537; table row 410 lists "identified code and lattice actions, Co1 recognition, mod-two module and Co2 stabilizer" | Present; line 82's list of what is not consumed matches the row |
| Line 78, 585, 587: Rank24LatticeConstructions Layer 4 carries the A₁²⁴ glue group to the extended binary Golay code of AlgebraicCodingTheory Layer 5 | main `TauCetiRoadmap/Rank24LatticeConstructions/README.md` lines 251–264 (permutation `p`, `a1TableToGolayMonomial`, "carried to the actual `extendedBinaryGolay.toAddSubgroup`") | Present |
| AlgebraicCodingTheory Layer 5 | main `Completed/AlgebraicCodingTheory/README.md` line 240 (Layer 5), 275 (`G₂₄` from `[I₁₂ | B]`); line 30 excludes the Mathieu identification, which P2-L owns | Consistent chain of ownership |
| Line 74: |W(E₈)| native for the pinned datum; lattice-side |O(E₈)| is IntegralLattices §6G | main `TauCetiRoadmap/IntegralLattices/README.md` line 2182 (6G) | Present |
| Lines 569, 587: IntegralLattices §§2C/2G/6C/6D/6E/6G/9B | main lines 2868 (2C, native), 716, 2054, 2076, 2110, 2182, 2657 | Present. Labels 0A–0G are rows of main's Tau Ceti table (line 536–558), so "§0E" resolves to a native row; the overlaps file's "only #1797 defines" lines are false positives (#1797's head carries the older copy with the same labels at lines 814–2042) |
| Lines 569, 587, 616: RootSystems Layer 5 (§§5.1–5.3) and Layer 6 §6.1 | main `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md` lines 905, 907, 944, 993, 1037; §3.2 at 727 | Present on main (R04 moot) |
| Line 575: ReflectionInvariantTheory §3/§4 | untouched; checked in the previous round | Carried |

The overlaps file lists no pull request that changes this roadmap and no id it cites that a pull request drops. Ownership of the Weyl orders of types Dₙ, E₆ and E₇ against open pull requests: RootSystemsPartII (#1731, merge order line 202, after this roadmap at 148) states none, as in the previous round.

### Sources (seeded targets in the changed lines)

- **4.1, Weyl orders.** FominReading (arXiv math/0505518v3): Lecture 2 heading at line 532, §2.5 "Coxeter element and Coxeter number" at line 846, page 24 at line 897, Figure 2.8 at lines 913–925 with the rows Dₙ `2ⁿ⁻¹n!`, E₆ `2⁷3⁴5`, E₇ `2¹⁰3⁴5·7`, E₈ `2¹⁴3⁵5²7`. The locator is exact. The notes state the table without proof (line 21), which is fine for a locator of values whose proof route is the roadmap's own.
- **4.2, A₁²⁴ factor and the 23 factors.** BorcherdsTables norm-zero table, lines 5–81: `a1.24 /244823040` (line 9), `a2.12 /190080`, `d4.6 /2160`, `d6.4 /24`, `d8.3 /6`, `d16e8 /1`, `d24 /1`, `e8.3 /6`, the Leech entry `/8315553613086720000` (line 6). With exactly these factors the 24 reciprocals sum to M₂₄ (table below).
- **4.1 rank 16 and 4.2 rank 24 (Chenevier–Lannes).** Untouched locators, checked in the previous round.
- **The other 13 seeded targets** (0.0–0.3, 1.1–1.4, 2.1–2.3, 3.1, 3.2, 4.3) lie outside the changed lines; their checks carry over.

### Adversarial table: changed statements (computed this round)

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Line 559: |W(Dₙ)| = 2ⁿ⁻¹n!, |W(E₆)| = 51840, |W(E₇)| = 2903040, |W(E₈)| = 696729600 | Figure 2.8 vs the stated factorizations | 2⁷3⁴5 = 51840; 2¹⁰3⁴5·7 = 2903040; 2¹⁴3⁵5²7 = 696729600; D₄…D₆: 192, 1920, 23040 | Agree | none |
| Line 561: rigidity then base change | P over ℚ, model over ℚ; datum over ℤ, S = ℚ | `nonempty_weylGroup_mulEquiv_of_hasCartanType` needs one ring (ℚ, ℚ); `weylGroupBaseChangeEquiv` needs `hP` = `toLinearMap_simplyConnectedRootDatum` and `FaithfulSMul ℤ ℚ` | Hypotheses in scope | none |
| Line 564: D route faithfulness | n = 4: fix e₁+e₂ and e₁−e₂ | Their sum 2e₁ fixed, so e₁ fixed; an element fixing all roots is the identity on ℤⁿ, n ≥ 2 | Faithful | none |
| Line 564: wrong model, all signed permutations | D₄ | 384 vs 192; a single sign change swaps α₃ = e₃−e₄ and α₄ = e₃+e₄ | Excluded by the Check at line 573 | none |
| Line 565: orbit × stabilizer | E₆: 72·6!; E₇: 126·2⁵·6! | 72·720 = 51840; 126·23040 = 2903040 | Equal to the stated orders | none |
| Line 565/576: walls of θ in Bourbaki numbering | Cθ with C = `CartanMatrix.E 6/7`, θ = (1,2,2,3,2,1), (2,2,3,4,3,2,1) | E₆ pairings (0,1,0,0,0,0) → J = {1,3,4,5,6}, chain 1–3–4–5–6 = A₅; E₇ pairings (1,0,0,0,0,0,0) → J = {2,…,7}, branch at 4 with arms 2, 3, 5–6–7 = D₆ | Types as stated | none |
| Line 576: wrong-wall models | E₆ without α₁: D₅; E₇ without α₇: E₆ | 72·2⁴·5! = 138240; 126·51840 = 6531840 | Discriminating, as stated | none |
| Line 565: `parabolicHom` identifies the stabilizer | f : support(A₅ model) → support(E₆ model) onto J | Coxeter entries agree on a chain (3 for neighbours, 2 otherwise); range = parabolic(J) = stabilizer; injective, so |Stab| = |W(A₅)| = 720 | Route closes | none |
| Line 585: A₁²⁴ glue action | W(A₁)²⁴ = {±1}²⁴ on (A₁*/A₁)²⁴ ≅ 𝔽₂²⁴ | −1 acts trivially on a group of exponent 2; the quotient Aut/W = S₂₄ fixes the code iff it is in Aut(G₂₄) = M₂₄ | Factor = |M₂₄| | none |
| Line 585: 23 Weyl factors × Borcherds factors + Leech | all 24 rows | Σ 1/|Aut| = 1027637932586061520960267/129477933340026851560636148613120000000 = M₂₄ exactly (with factors 1, 1, 6, 2, 2, 2, 2, 2, 6, 4, 2, 48, 4, 24, 12, 8, 24, 48, 2160, 240, 2688, 190080, 244823040) | Exact | none |
| Line 595: "fifteen rows … fourteen … E₈³" | the 23 root systems | Rows with a D or E component: 15; with D, E₆ or E₇: 14 (D₁₆E₈ counted by D₁₆); the odd one out is E₈³ | True | none |
| Line 595: D₄⁶ with 384 | 192⁶·2160 = 108208436847575040 | With 384: that row ×2⁶; the 24-term sum becomes 0.998854·M₂₄ ≠ M₂₄ | Discriminating | none |
| Line 596: A₁²⁴ order and share | 2²⁴·244823040 | = 4107449023856640 = 2³⁴3³5·7·11·23; 1/order ÷ M₂₄ = 0.030675 ≈ 3.07 % | True | none |
| Line 596: 24! variant | replace M₂₄ by S₂₄ in that row | Σ' = 0.969325·M₂₄ | True, as stated | none |
| Line 574: Aut(E₆) for W(E₆) | rows A₁₁D₇E₆ (×2) and E₆⁴ (×16) | sum ratio 0.9999957 ≠ 1 | Discriminating | none |
| Line 9/74: no supplier states the D, E₆, E₇ orders; E₈ native for the pinned datum | `2fd255d` sweep (previous round), RootSystems main, RootSystemsPartII #1731 | None states them; E₈ at `E8/Automorphism.lean:200` | True | none |
| Line 36: 72, 126, 240 roots | `numRoots` | `E6 ↦ 72`, `E7 ↦ 126`, `E8 ↦ 240` | True | none |
| Line 38: index-four sublattice | det `CartanMatrix.D n` | 4 for every n ≥ 4 | True | none |
| Headlines `rank16_classNumber`, `rank24_classNumber` | the sums above | M₁₆ = 691/277667181515243520000 = 1/970864271032320000 + 1/685597979049984000; M₂₄ exact | Consistent | none |

### Adversarial table: unchanged statements carried forward

Not recomputed this round; each cites the previous review (~7), which carried the older rows from ~6 to ~3.

| Statement | Values (source) | Result |
| --- | --- | --- |
| Line 548/567: rank-16 orders W(E₈)≀S₂ and W(D₁₆) | 970864271032320000, 685597979049984000, reciprocal sum M₁₆ (~7) | Exact |
| `evenUnimodularMass_eq` guards | n = 8: 1/696729600; n = 4: 0 vs 1/576; n = 0: 1 vs 0 (~6) | Both hypotheses needed |
| Line 344: s, h⁺/h, R⁺/R, h⁺R⁺ = 2hR | D = 5, 8, 12, disc 136 (~6) | True |
| Line 9: definite finiteness, 2C | diag(1,2): 4; x²−2y²: infinite (~5) | Definiteness needed |
| Line 30: glue orders of the four excluded rows | 2²⁴, 3¹², 4⁶, 12² (~4) | Unimodular |
| A₁²⁴ root count; Leech | Golay minimum 8 gives coset minimum 4; 196560 (~4) | Discriminating |
| §0.3, §0.1a, Dickson, rank-zero guards | det −1 reflection; 𝔽₂: 2 vs 6 (~3) | Correct |
| §0.2, §1.1, §1.4 | diag(16, 1/4); 9/25 + 16/25 = 1; π/(3√3), 1/12 (~3) | Correct |
| Filtration, Cho density, §2.3 general mass | 2, 2, 4, 2, 1; A₂ 1/12, E₈ 1/696729600 (~3) | Correct |
| Smooth model, special fibre, good primes | 1 point; 8/9, 64/81 (~3) | Correct |
| §4.1 coercivity, determinant | μ = 1, c = 1/2; rank 0 c = 1; det ±1 (~3) | Correct |
| Bernoulli sign, range; rank-24 injectivity | B₀ + 2B₁ = 0; B₃₈; ≤ 23 with a repeat (~3) | Correct |
| `rank32/40_classNumber_lower_bound` | 2M₃₂ ≈ 80618465.87; 2M₄₀ ≈ 8.79·10⁵¹ (~7) | Hold |

### Remarks on untouched or near-untouched text (no change requested)

- Line 86 says the M₂₄ model is generated by "the two permutations of its named ATLAS file"; SporadicOrders O1 reads them from two files, `M24G1-p24B0.m1` and `.m2`, of the one named representation. The meaning is clear.
- The overlaps file reports every IntegralLattices label as "only #1797 defines"; all of them are on main (lines above), so nothing depends on #1797.

## Not verifiable

- **O'Meara 104:4–5.** Uncertified in the README and unchanged.
- **Conway–Sloane IV.** Cached scan is image-only and this worker has no OCR; its locators are untouched by the diff and were not reopened.
- **The build at main's pins.** The commands this review may run use `a91d3aa`/`6b7abb3`. The declarations of R01 were read in the content checkout's `2fd255d` sources, not elaborated there.
- **Locators outside the diff.** Cho, Belolipetsky–Gan, Milne and Chenevier–Lannes were not reopened this round.

## Source issues

- none
