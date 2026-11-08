# Review of OrthogonalTamagawaAndLatticeMass (pull request #1222 at 91f8383)

**Verdict:** needs changes

This is an incremental re-review of the 31 lines of `README.md` changed since 85c425c (22 insertions, 9 deletions). `Suggested.lean` is unchanged, and nothing outside the folder changed.

- **Repaired:** the previous R02. Lines 9, 32, 60, 541–546, 562–567, 575 and 595 now name a supplier for every Weyl order. Types A and E₈ are native. Dₙ, E₆ and E₇ are §4.1 targets, and the orders, degree products and rank-24 sums all check out (table below).
- **Not repaired:** the previous R01 (the Tau Ceti pin) and R03 (the unnamed revisions). They are raised again as R01 and R04.
- **New:** the repair introduced two P3 defects in the new §4.1 target: R02 (route inputs and carriers) and R03 (no locator).

## R01 (P2) — The pinned Tau Ceti lacks most of the files the README cites, now including the new Weyl-order files

Carried from the previous R01; not repaired. The repair of the previous R02 added six more paths that exist only at main's pin.

**Location.** `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md`:

- Line 32: "`RootPairing.card_weylGroup_of_hasCartanType_A` in `TauCeti/LinearAlgebra/RootSystem/Weyl/TypeA/Basic.lean` … `Weyl/CartanType.lean` … `Weyl/Orbit/Basic.lean` … `Weyl/ParabolicQuotient.lean`".
- Line 30: the `Rank24/` files.
- Line 344: `Units/Regulator/Basic.lean`.

**Claim.** The named declarations are in the pinned Tau Ceti.

**Witness.** `lake-manifest.json` still pins Tau Ceti `a91d3aa` (Mathlib `6b7abb3`), and the merge base with `origin/main` is `63aa5ee`. Of the 18 `TauCeti/…lean` paths the README cites:

- all 18 exist at main's pin `2fd255d`;
- 12 are missing at `a91d3aa`.

The six new missing ones are:

- `Weyl/TypeA/Basic.lean`
- `RootLattice/TypeE/WeylGroup.lean`
- `SimplyConnectedRootDatum/E8/Automorphism.lean`
- `Weyl/CartanType.lean`
- `Weyl/Orbit/Basic.lean`
- `Weyl/ParabolicQuotient.lean`

**Repair.** Merge or rebase onto current main, so that the manifest pins Tau Ceti `2fd255d` (Mathlib `1b1ccf4`, `v4.36.0-rc2`), then re-run the targeted build. The README needs no further change: every declaration it cites resolves at `2fd255d` (lines listed under Verified sound).

## R02 (P3) — The §4.1 Weyl-order routes leave their key inputs unnamed and mix Weyl-group carriers

New: introduced by the repair of the previous R02.

**Location.**

- Line 32: "use these native root-system declarations, all for finite reduced crystallographic root systems over ℚ with a chosen base".
- Line 543: "each order may be computed on one model of its type".
- Line 546: "That subgroup is the Weyl group of the root subsystem those simple roots span".
- Line 565: "E₈ from the native `TauCeti.IntegralLattice.card_weylGroup_typeE₈RootLattice`".

**Claim.**

- Line 32 says the listed declarations are all statements about root systems over ℚ.
- Line 543 says rigidity lets each order be computed on a model, but names no model.
- The E₆/E₇ routes and the §4.1 *Needs:* line (line 550) give no input for the step from the parabolic stabilizer to a Weyl group of type A₅ or D₆.

**Witness** at `2fd255d`:

- `TypeDRoot n` is `{x : Fin n → ℤ // x ⬝ᵥ x = 2}` (`ClassicalTypeD.lean:108`), which is not a root pairing.
- `card_weylGroup_typeE₈RootLattice` is about `IntegralLattice.weylGroup` (`Isometry/Reflection.lean:161`).
- `e8SimplyConnectedRootDatum` is over ℤ (`E8/Datum.lean:105`).
- Rigidity (`CartanType.lean:62`) needs both systems over one ring.

**Repair.**

1. In line 32, drop "all … over ℚ".
2. At line 543 and in line 550, name the models:
   - `TauCeti.DynkinType.rationalRootSystem` with `hasCartanType_rationalRootSystem` (`SimplyConnectedRootDatum/Rational.lean:80/199`). Its roots are indexed by `Fin t.numRoots`, which also gives the 72 and 126 roots.
   - For the coordinate computation, `TauCeti.DynkinType.typeDSimplyConnectedRootDatum` with `hasCartanType_typeDSimplyConnectedRootDatum` (`D/Basic.lean:485`), which is built on `TypeDRoot`, transported to ℚ by `TauCeti.weylGroupBaseChangeEquiv` (`Weyl/BaseChange.lean:111`).
3. For line 546:
   - Name `CoxeterSystem.parabolicHom_injective` and `CoxeterSystem.range_parabolicHom` (`GroupTheory/Coxeter/Restriction.lean:168/106`), applied to `TauCeti.weylCoxeterSystem` of an A₅ (resp. D₆) model and of P. They identify the parabolic subgroup with that model's Weyl group, because the Coxeter matrices agree on J.
   - Name `RootPairing.Base.pairingIn_highestRoot_nonneg` (`HighestRoot.lean:192`) for "θ is dominant".
4. In lines 9, 565 and 567, take the E₈ factor of a root-pairing component from `card_weylGroup_e8SimplyConnectedRootDatum` (`E8/Automorphism.lean:200`), through `weylGroupBaseChangeEquiv` and rigidity. Alternatively, say which bridge identifies `IntegralLattice.weylGroup` with the root-pairing Weyl group, so that all five types use one carrier.

Tested: every declaration named above exists at `2fd255d` with the hypotheses described. The pairings of θ give J = {1,3,4,5,6} (A₅) in E₆ and J = {2,…,7} (D₆) in E₇.

## R03 (P3) — The new Weyl-order target has no source locator

New: introduced by the repair of the previous R02.

**Location.** Line 541: "Prove that |W(P)| = 2ⁿ⁻¹·n! when t = Dₙ with n ≥ 4, |W(P)| = 51840 … E₆, and |W(P)| = 2903040 … E₇."

**Claim.** This is a theorem target. It carries no locator, and the References list no source for Weyl group orders.

**Witness.**

- Lines 541–546 and 554–556 cite only Tau Ceti declarations and ReflectionInvariantTheory.
- The References (lines 601–611) list Cho, Belolipetsky–Gan, Milne, Conway–Sloane, O'Meara, Chenevier–Lannes and Borcherds. None of them is cited for these orders.
- Chenevier–Lannes v2 does not tabulate W orders: searching it for 51840 and 2903040 finds nothing.

**Repair.** At line 541, add a standard-textbook locator for each of the three orders, and add the work to the References and to `sources.toml`. One option is Bourbaki, *Lie Groups and Lie Algebras*, Ch. 4–6, Plates IV, V and VI; the native Tau Ceti files already cite Plate I for type A. Record it as `uncertified` if no legal text is found.

## R04 (P3) — Ids defined only by two open revisions, which the description does not name

Carried from the previous R03; not repaired.

**Location.**

- Line 34: "§§4A–4C and N0–N1 for class, genus and proper spinor-genus carriers".
- Line 60: "Consume RootSystems Layer 5 (§§5.1–5.3) … and Layer 6 §6.1". The same RootSystems ids appear at lines 9, 548, 550, 565, 567 and 595.

**Claim.** These ids are supplier sections.

**Witness.**

- IntegralLattices N0 and N1 are at revision #1239 head `2a9d69b`, lines 1429 and 1468, and are absent on main.
- RootSystems Layer 5 and §6.1 are at revision #1196 head `16d2d99`, lines 905 and 1037. Main's RootSystems ends at Layer 3.
- The description's depends-on block still lists only #792, #1175, #999 and #851.

**Repair.** In the pull-request description, list revisions #1239 (IntegralLattices) and #1196 (RootSystems) in the depends-on block and in the merge-order paragraph, as suppliers that merge first. The README needs no change.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `a91d3aa`. 12 of the 18 cited Tau Ceti paths are missing there, including the six new Weyl-order files of line 32. Raised again as R01.
- R02 — repaired: line 541 states |W(Dₙ)| = 2ⁿ⁻¹·n!, |W(E₆)| = 51840 and |W(E₇)| = 2903040 as §4.1 targets. Lines 9, 60, 565, 567 and 595 cite native A and E₈ orders and §4.1. The repair introduced R02 and R03.
- R03 — not repaired: the description's depends-on block still lists #792, #1175, #999 and #851 only, and the merge-order chain names neither #1239 nor #1196. Raised again as R04.
- R04 (the §3.2 citations in the §4.1/§4.2 *Needs:* lines) — repaired in the previous round. Lines 550 and 567 still read "§3.2's exact evaluation of M₁₆" and "of M₂₄"; nothing regressed.

## Verified sound

### Gate, build and Lean form

- **Scope of the change.** `git diff 85c425c HEAD --stat` touches only `README.md`. The diff of `origin/main...HEAD` outside the folder is empty.
- **Gate.** The full gate, re-run on this head, printed `OK` with every counter at 0. The worker's gate also records `build=0`.
- **Dependency check**, re-run:

  ```text
  depcheck: 236 roadmaps, 2420 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` of `Suggested.lean` at the branch pins gave exactly five warnings, `declaration uses 'sorry'`, at lines 109, 116, 120, 124 and 128.
- **Binder check.** A scratch copy with `#check @name` for all **17 declarations** elaborated. Every type is identical to `signatures.md`. `evenUnimodularMass_eq` keeps `0 < n` and `8 ∣ n`. Nothing changed.
- **Padding and headlines.** The file is unchanged, so the previous probe (all 15 one-tactic attempts fail) and the headline inventory carry over.
- **The new target is not a headline.** The §4.1 Weyl-order target is an intermediate target, and keeping it out of `Suggested.lean` is correct (it would compute small values).

### Library declarations opened at Tau Ceti `2fd255d` (19) and Mathlib (2 pins)

| Declaration | File:line | What it says |
| --- | --- | --- |
| `RootPairing.card_weylGroup_of_hasCartanType_A` | `RootSystem/Weyl/TypeA/Basic.lean:275` | (n+1)! for a base of type Aₙ, n ≥ 1. Over ℚ, finite, crystallographic, reduced |
| `TauCeti.IntegralLattice.card_isometry_typeE₈RootLattice`, `card_weylGroup_typeE₈RootLattice` | `IntegralLattice/RootLattice/TypeE/WeylGroup.lean:272/277` | 696729600 for the native E₈ lattice's `Isometry` group and `IntegralLattice.weylGroup` |
| `IntegralLattice.weylGroup` | `IntegralLattice/Isometry/Reflection.lean:161` | The closure of the norm-2 reflections, a subgroup of `Isometry L L` (R02) |
| `TauCeti.DynkinType.card_weylGroup_e8SimplyConnectedRootDatum` | `SimplyConnectedRootDatum/E8/Automorphism.lean:200` | 696729600 for the E₈ datum over ℤ (`E8/Datum.lean:105`) |
| `TauCeti.nonempty_weylGroup_mulEquiv_of_hasCartanType` | `Weyl/CartanType.lean:62` | Isomorphic Weyl groups for the same Cartan type, both systems over one ring R (CharZero, IsDomain) |
| `TauCeti.DynkinType.TypeDRoot` | `ClassicalTypeD.lean:108` | `{x : Fin n → ℤ // x ⬝ᵥ x = 2}` |
| `TauCeti.exists_mem_support_weylGroupToPerm_eq` | `Weyl/Orbit/Basic.lean:58` | Every root index is a Weyl image of a simple one |
| `RootPairing.parabolic_wallIndices_eq_stabilizer` | `Weyl/ParabolicQuotient.lean:135` | A dominant weight's stabilizer is the parabolic subgroup on its walls. Ordered R, `P.flip.IsReduced` |
| `TauCeti.DynkinType.rationalRootSystem`, `hasCartanType_rationalRootSystem` | `SimplyConnectedRootDatum/Rational.lean:80/199` | A ℚ-model of each valid type (R02) |
| `typeDSimplyConnectedRootDatum`, `hasCartanType_typeDSimplyConnectedRootDatum` | `SimplyConnectedRootDatum/D/Basic.lean:485` | The Dₙ datum, built on `TypeDRoot` (R02) |
| `TauCeti.weylGroupBaseChangeEquiv` | `Weyl/BaseChange.lean:111` | Weyl group isomorphism under scalar extension (R02) |
| `CoxeterSystem.range_parabolicHom`, `parabolicHom_injective` | `GroupTheory/Coxeter/Restriction.lean:106/168` | A standard parabolic subgroup is the Coxeter group of the restricted matrix (R02) |
| `TauCeti.weylCoxeterSystem` | `RootSystem/Coxeter/Presentation.lean:167` | The Weyl group as a Coxeter system for `coxeterMatrixOfBase` |
| `RootPairing.Base.pairingIn_highestRoot_nonneg` | `RootSystem/HighestRoot.lean:192` | The highest root is dominant |
| Dihedral orders (`card_weylGroup_of_card_support_eq_two`, `_A_two`, `_B_two`, `_G2`) | `Weyl/Dihedral.lean:102/146/152/158` | Line 60's "rank-two dihedral orders … native" |

- **Duplication sweep.** I grepped `2fd255d` for every `card … weylGroup` theorem. It has type A, A₂, B₂, G₂, the rank-two dihedral orders, the type-A datum, the PGL diagonal datum and E₈, but nothing for Dₙ, E₆ or E₇. Mathlib at `6b7abb3` and at `1b1ccf4` has no Weyl group order at all. Line 32's "Tau Ceti states no Weyl group order of type Dₙ, E₆ or E₇" holds.
- **Pin coverage.** All 18 cited Tau Ceti paths were checked at both pins (R01).

### Cross-roadmap citations and ownership resolved (7)

| Citation | Where checked | Result |
| --- | --- | --- |
| Line 9: "IntegralLattices §6G uses \|W(E₇)\| and \|W(D₆)\| only as steps" | main lines 1680–1689; #1239 head `2a9d69b`, lines 2182–2196 | Orbit chain 240·126·23040 for \|O(E₈)\|, with W(E₇) and W(D₆) as stabilizers. True |
| Line 60: RootSystems' only type-specific orders are (n+1)! (§3.2) and the dihedral orders | main line 570 (§3.2), lines 22 and 232–234; #1196 head `16d2d99`, lines 368 and 378 | True. No D, E₆, E₇ or E₈ order at either |
| Line 556: ReflectionInvariantTheory §3 `∏dᵢ=\|W\|`, §4 degree table | main lines 52 and 86–89 | Present. The table is "acceptance examples", not targets |
| "no supplier states" the D, E₆ and E₇ orders | `roadmaps grep` for 51840, 2903040, W(D…/W(E…, "order of the Weyl group" | Only this roadmap and IntegralLattices §6G (as steps). RootSystemsPartII (#1731) states none and is later in the merge order (line 204 vs 150), so this roadmap is the owner, as the notion moves down |
| IntegralLattices labels 2G/6C/6D/6E/6G/9B | main lines 813/1655/1661/1668/1680/2041 | Present. N0/N1 only at #1239 (R04) |
| RootSystems Layer 5/§6.1 | #1196 lines 905/1037 | Present at the revision only (R04) |
| Consumers of §4.1 | `roadmaps grep OrthogonalTamagawaAndLatticeMass` | LatticePackingsAndPerfectForms and IntegralLattices (labels 7I/4D). None depends on the new Weyl target's wording |

The overlaps file lists no pull request that changes this roadmap or drops an id it cites. Its revision-only ids are as before: the IntegralLattices labels other than N0–N1 are on main (a false positive), and the RootSystems Layers 5/6 and N0/N1 are R04.

### Sources (seeded targets in the changed lines)

ChenevierLannes v2 (arXiv 1409.7616v2) was fetched through the sources service into a scratch manifest; no manifest was edited.

- **4.1.** Corollary 3.6 is at ChenevierLannes line 1589; the page footer at line 1627 reads 41. It supports `rank16_classNumber`.
- **The new Weyl-order target** in §4.1 has no locator (R03). Its mathematics was checked by computation (table).
- **4.2.** Theorems 3.16–3.17 are at ChenevierLannes lines 1886–1893, with the footer 48 at line 1897.
- **The other 13 seeded targets** (0.0, 0.1, 0.2, 1.1–1.4, 2.1–2.3, 3.1, 3.2, 4.3) lie outside the changed lines. Their checks carry over from the previous reports.

### Adversarial table: changed statements (computed this round)

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §4.1: \|W(Dₙ)\| = 2ⁿ⁻¹·n!, n ≥ 4 | n = 4, 5, 6, 16, 24; boundary n = 2, 3 | 192, 1920, 23040, 685597979049984000, 2²³·24!. n = 3 gives 24 = \|W(A₃)\| = 4!, and n = 2 gives 4 = \|W(A₁²)\|, so the restriction n ≥ 4 loses nothing. Degree product 2·4·…·(2n−2)·n = 2ⁿ⁻¹n! for n = 4…24 | True | none |
| D route: reflections | s_{eᵢ+eⱼ}(eᵢ) = eᵢ − (eᵢ·(eᵢ+eⱼ))(eᵢ+eⱼ) | = −eⱼ; s_{eᵢ−eⱼ}s_{eᵢ+eⱼ}(eᵢ) = −eᵢ | Negates i and j, as stated | none |
| Wrong model: all signed permutations | D₄ | 384 = 2·192. A single sign change swaps α₃ = e₃−e₄ and α₄ = e₃+e₄ and fixes α₁, α₂ | Excluded by the Check at line 554 | none |
| §4.1: \|W(E₆)\| = 51840 | orbit × stabilizer; degrees; prime factors | 72·720 = 51840 = 2·5·6·8·9·12 = 2⁷·3⁴·5 | True | none |
| §4.1: \|W(E₇)\| = 2903040 | same | 126·23040 = 2903040 = 2·6·8·10·12·14·18 = 2¹⁰·3⁴·5·7 | True | none |
| E route: stabilizer types | the highest root θ in Bourbaki numbering | E₆: θ = (1,2,2,3,2,1), pairings (0,1,0,0,0,0), so J = {1,3,4,5,6} = A₅. E₇: θ = (2,2,3,4,3,2,1), pairings (1,0,…,0), so J = {2,…,7} = D₆. Root counts 72 and 126 | Types as stated | inputs unnamed (R02) |
| E route: transitivity | ⟨α,β^∨⟩ = −1 | s_β(α) = α+β, s_α(α+β) = −α+β+α = β | True | none |
| Check line 555: Aut(E₆) | wrong model W = Aut | 2·51840 = 103680. Substituting it into rows A₁₁D₇E₆ and E₆⁴ makes the 24-term sum ≠ M₂₄ (computed) | Discriminating | none |
| Check line 556: E₈ | orbit chain | 240·2903040 = 696729600 = native order | Consistent | none |
| Line 548: rank-16 orders | W(E₈)≀S₂; W(D₁₆) | 2·696729600² = 970864271032320000; 2¹⁵·16! = 685597979049984000; reciprocal sum 691/277667181515243520000 = M₁₆ | Exact | none |
| Line 565: \|W(R(L))\| times the glue factor | 23 rows plus Leech | The 24-term reciprocal sum is 1027637932586061520960267/129477933340026851560636148613120000000 = M₂₄ exactly | Exact | carrier of the E₈ factor (R02) |
| Check line 575: D₄⁶; 14 rows | 384 for \|W(D₄)\|; row count | 192⁶·2160 = 108208436847575040, and 384 multiplies it by 64, giving a sum/M₂₄ ratio of 0.99885. Rows with a D, E₆ or E₇ component: 14 | True and discriminating | none |
| Line 32 blanket "all … over ℚ" | `TypeDRoot`, E₈ datum, E₈ lattice | ℤⁿ subtype; RootDatum over ℤ; `IntegralLattice.weylGroup` | False for 4 of the 8 declarations | R02 |
| Line 9/32/60: no other owner of the D, E₆ and E₇ orders | Tau Ceti `2fd255d`; Mathlib (2 pins); 6 roadmaps | No such theorem or target (sweep above) | True | none |
| Headlines `rank16_classNumber`, `rank24_classNumber` | the mass sums above | M₁₆, M₂₄ exact | Consistent | none |
| `rank32/40_classNumber_lower_bound` | 2M₃₂, 2M₄₀ | 80618465.871…; 8.786…·10⁵¹ | Hold | none |

### Adversarial table: unchanged statements carried forward

These rows were not recomputed this round. Each cites the previous review (~6), which carried the older rows from ~5, ~4 and ~3.

| Statement | Values (source) | Result |
| --- | --- | --- |
| `evenUnimodularMass_eq` guards | n = 8: 1/696729600; n = 4: 0 vs 1/576; n = 0: 1 vs 0 (~6) | Both hypotheses needed |
| Line 344: s, h⁺/h, R⁺/R, h⁺R⁺ = 2hR | D = 5, 8, 12, disc 136: s = 4, 4, 2, 2; ratios 1, 1, 2, 2; 0.962424 = 0.962424 … (~6) | True |
| Line 344 readings of `card_narrowPic`, `mult_abs_log…` | index 4/s; 0.962424 = 2·0.481212 (~6) | True |
| Line 9: definite finiteness, 2C | diag(1,2): 4; x²−2y²: (3,2), (17,12) (~5) | Definiteness needed |
| Line 30: glue orders of the four excluded rows | 4096² = 2²⁴; 729² = 3¹²; 64² = 4⁶; 12² (~4) | Unimodular |
| A₁²⁴ Check; Leech | Golay weights 4096; minimum 4 vs 2; 196560 (~4) | Discriminating |
| §0.3, §0.1a, Dickson, rank-zero guards | det −1 reflection; F₂: 2 vs 6; GL₂ 6 vs 2 (~3) | Correct |
| §0.2, §1.1, §1.4 | diag(16, 1/4); 9/25 + 16/25 = 1; π/(3√3), 1/12 (~3) | Correct |
| Filtration, Cho density, §2.3 general mass | 2, 2, 4, 2, 1; α = 2β; A₂ 1/12, E₈ 1/696729600 (~3) | Correct |
| Smooth model, special fibre, good primes | 1 point; 2 vs 1; 8/9, 64/81 (~3) | Correct |
| §4.1 coercivity, determinant | μ = 1, c = 1/2; rank 0 c = 1; det ±1 (~3) | Correct |
| Gram universe, O/SO, Spin, gauges | [1], [2] vs [0]; rank 0: 1, 1; V₃ = 8π² (~3) | Correct |
| Bernoulli sign, range; rank-24 injectivity | B₀ + 2B₁ = 0; B₃₈; ≤ 23 with a repeat (~3) | Correct |

### Remarks on untouched text (no change requested)

- Line 565's A₁²⁴ glue factor is |M₂₄| = 244823040. The SporadicOrders roadmap on main owns that order (`card_M24`, line 12), and §4.2 could cite it.

## Not verifiable

- **O'Meara 104:4–5.** Uncertified in the README and unchanged.
- **A legal text for the Weyl-group orders** (Bourbaki's plates, Humphreys). Paywalled and not opened. R03 asks for a locator, to be recorded as `uncertified` if no legal text is found. The orders were instead verified by computation.
- **The build at main's pins.** The commands this review may run use `a91d3aa`/`6b7abb3`. The declarations of R01 and R02 were read in the main checkout's `2fd255d` sources and not elaborated there.
- **Locators outside the diff.** The Borcherds, Conway–Sloane, Cho, Belolipetsky–Gan and Milne locators are untouched by the diff and were not reopened.

## Source issues

- **Misprint** in ChenevierLannes at Chapter II, Theorem 3.16, printed p.48: the source says every even unimodular lattice without roots is the Leech lattice; it should be restricted to dimension 24, as the surrounding section is (Leech⊕Leech is rootless in rank 48); affects nothing. Re-observed at ChenevierLannes line 1886.
