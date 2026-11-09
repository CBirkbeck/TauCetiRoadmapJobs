# Review of DGFloerPartII (pull request #1799 at 58c40ae)

**Verdict:** needs changes

This is an incremental re-review of the 12 changed lines since 9e65f2b. Only the first bullet of
`## Downstream consumers` in `TauCetiRoadmap/DGFloerPartII/README.md` (lines 1879–1885) changed.
`Suggested.lean` is unchanged, and nothing outside the folder changed.

- **Previous findings.**
  - The README side of R01 is repaired: Downstream consumers now offers 4.2a–4.2c to
    TopologicalKTheory only in T7, and I traced that offer as acyclic.
  - R01's second repair item, the description's ordering of TopologicalKTheory #1807, is still
    missing. #1807 still consumes 4.2a and 4.2b in T1.6 (R02 below).
  - R02 and R03 concern the pull request description, which has not changed (R01 and R03 below).
- **Gate.** My re-run fails only on `depcheck`, against the unmoved board order. With
  `--movable` this is the `moved:` case with 0 problems, so it is not a defect (details under
  Verified sound). `lake env lean` gives 23 `sorry` warnings and nothing else.

## R01 (P2) — Not repaired: main's DGFloer and two AlgebraicTopology revisions own this material, and the order against them is not stated

This carries R02 of the review at 9e65f2b, which was itself carried from earlier rounds. No repair
report gives a reason for leaving it.

**Location.**

- README lines 41–42: "The base roadmap, cited as **DGFloer** by layer and item, owns every other
  numbered statement of the source".
- The description's merge-order paragraph still ends "#1742 (GeneralAlgebraicKTheoryPartII) →
  **this pull request** (#1799)".

**Claim.** This roadmap is the only owner of Theorem B, §§6.3–6.4, §7 and 1.0's convenient
category.

**Witness.**

- Main's DGFloer (e7bcd5e) still owns Theorem B (Layer 10 item 5, line 1562) and Layer 11
  (line 1577). DGFloer #1798 (3166898, lines 50–54) moves them here.
- AlgebraicTopology #1652 (287181d, line 138) and #1663 (8b51fe6, line 138) each claim single
  ownership of the compact-generation coreflection.

**Repair.** In the description's merge-order paragraph:

- **DGFloer.** Put #1798 (DGFloer) before this pull request. The README needs no change. Every
  DGFloer id it cites resolves on main and at 3166898; for example, Layer 10 items 2–5 are
  §§10.2–10.5 there (headings at lines 3952–4065) and Layer 11 is §§11.1–11.3 (lines 4194–4291).
- **AlgebraicTopology.** State whether this pull request or AlgebraicTopology #1652/#1663 merges
  first. If AlgebraicTopology merges first:
  - cut 1.0's coreflection, convenient products, exponential law and pointed smash and
    suspension–loop constructions to a citation of its Stage 4 item 8;
  - keep in 1.0 only the sequential-colimit bullet and the raw-quotient comparison.

**Tested.**

- With #1798 merged first, main's DGFloer owns none of 1.3, 1.4, Layer 2, 3.2 or Layer 4 when this
  pull request merges.
- #1798 line 54 says that DGFloerPartII consumes DGFloer and supplies nothing to it. This agrees
  with the README's last Downstream consumers bullet (line 1886).

## R02 (P3) — Partly repaired: TopologicalKTheory #1807 still consumes 4.2a–4.2b in T1.6, and the description does not order it after this pull request

This carries the unrepaired second item of R01 of the review at 9e65f2b.

**Location.**

- README lines 1883–1885: "It cannot consume 4.2a–4.2c in T1.5–T1.6 or in T2's `K` and `KO`
  groups: GeneralizedCohomology G4.0a–G4.0b consume those sections".
- The description's merge-order paragraph names no #1807.

**Claim.** The README's restriction to T7 settles the supply direction between this roadmap and
TopologicalKTheory.

**Witness.** TopologicalKTheory #1807 (e444d15), T1.6a, lines 498–500: "Own the loop comparisons
ΩBO≃O … equivalent to DGFloerPartII 4.2a's stable `O`". T1.6d, lines 824–825, compares with
"DGFloerPartII 4.2b's Grassmannian member Ω₇".

**Why it matters.**

- If #1807 merges as it stands, the section-level cycle that the README now excludes appears on
  main: T1.6a → 4.2a → G4.0b → G4.0a → T1.5–T1.6.
- The last edge is main's GeneralizedCohomology line 2612.
- The README is right, and the citations that have to move are #1807's. The only repair this pull
  request can make is to state the order.

**Repair.** Add to the description's merge-order paragraph:

> #1807 (TopologicalKTheory) merges after this pull request, and only once its T1.6a and T1.6d
> citations of 4.2a–4.2b have moved to T7, as this roadmap's Downstream consumers requires.

The README needs no change.

**Tested.** With the consumption in T7, no path from T7 returns to 4.2a–4.2c. The adversarial
rows on the Downstream bullet below trace every external supplier of 4.2a–4.2c. Each consumes
TopologicalKTheory at most in T1, T1.5–T1.6, T2 or T6.6, never in T7.

## R03 (P3) — Not repaired: the pull request description is stale

This carries R03 of the review at 9e65f2b. No repair report gives a reason for leaving it.

**Location.** The description says:

- "`Suggested.lean` states the rotation family at a fixed pole, the low-rank values of
  `π_(n−1)(SO(n))` and its torsion for odd `n`";
- "HomotopySpheres' James construction and Bott periodicity";
- "compares the base's raw mapping-space carriers with HomotopySpheres' convenient ones".

**Claim.** The description describes this head.

**Witness.**

- `Suggested.lean` declares no rotation family. It does state Theorem B (line 117), the capacity
  theorems (lines 138–214) and Theorem G (line 340).
- `HomotopySpheres` occurs nowhere in the folder.
- The James construction is GeneralAlgebraicKTheoryPartII §4.30b (README line 346), and 4.2a–4.2c
  prove Bott periodicity.

**Repair.**

- Regenerate the description's summary and its last paragraph from the README Summary (lines
  3–26) and the module docstring of `Suggested.lean`.
- 1.1 compares the base roadmap's raw carriers with 1.0's convenient carriers, which are owned
  here.
- 3.1 uses TangentialBordism B5 and B6.3, not a "compact-image embedding".
- Add the merge-order statements of R01 and R02.

**Tested.** After regeneration, the description names no HomotopySpheres supply. Every Lean name
it mentions is one of the 27 declarations of `Suggested.lean`.

## Previous findings

- R01 — partly repaired: lines 1879–1885 now read "TopologicalKTheory can consume 4.2a–4.2c in
  T7 … It cannot consume 4.2a–4.2c in T1.5–T1.6 or in T2's `K` and `KO` groups". The
  description's ordering of #1807 (repair item 2) is absent, and #1807 still cites 4.2a–4.2b in
  T1.6 (R02).
- R02 — not repaired: the description's merge-order paragraph still ends "#1742
  (GeneralAlgebraicKTheoryPartII) → this pull request (#1799)" and names neither DGFloer #1798
  nor AlgebraicTopology #1652/#1663 (R01).
- R03 — not repaired: the description still says `Suggested.lean` states "the rotation family at
  a fixed pole", and it still cites "HomotopySpheres' James construction and Bott periodicity"
  (R03).

## Verified sound

**Gate.**

- My run of the push gate on this head:

      gate DGFloerPartII: … depcheck=1 … FAIL
        depcheck: UPWARD: DGFloerPartII (#46) -> GeneralAlgebraicKTheoryPartII (#333) at README lines [346, 653, 864, 1278, 1859]

  Every other scanner is 0.
- This is a false positive of the unmoved board order, which lists this roadmap at line 46. The
  same check with `--movable` on that order prints:

      moved: DGFloerPartII moved in the merge order from #46 to #333, right after its last supplier GeneralAlgebraicKTheoryPartII; checked as moved (the worker moves it there when it submits)
      depcheck: 238 roadmaps, 2322 edges, 0 problem(s)

- The dependency check of the brief, against the moved order, prints
  `depcheck: 238 roadmaps, 2322 edges, 0 problem(s)`. In that order, TangentialBordism is line 14,
  GeneralAlgebraicKTheoryPartII line 332 and DGFloerPartII line 333.
- The worker's gate on this head passes every check, including `build`.

**Build and Lean form.**

- `lake env lean` on `TauCetiRoadmap/DGFloerPartII/Suggested.lean` exits 0 in 18 s. It prints
  exactly 23 messages, all "declaration uses `sorry`", at lines 91, 100, 117, 138, 153, 171, 201,
  214, 253, 260, 267, 273, 280, 286, 294, 297, 300, 304, 308, 312, 316, 323 and 340. These are the
  previous review's lines.
- `git diff 9e65f2b HEAD` touches only `README.md`. The `#check @` comparison of all 27
  declarations and the one-tactic padding probe (all 23 goals fail) therefore stand from the review
  at aeddaae.
- The elaborated-signature listing has 29 entries. Two of them, `of` (line 115) and `on` (line 189),
  are misparses of the docstring words "class of" and "structure on", so the file has 27
  declarations.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. `git diff --stat
  origin/main...HEAD` outside the folder is empty. The pins are Mathlib 1b1ccf4b and Tau Ceti
  2fd255d9.

**The changed bullet, claim by claim.**

- **"can consume 4.2a–4.2c in T7, its real `K`-theory".** T7 is "Real K-theory and concrete
  acceptance calculations" on main (TopologicalKTheory line 1517) and at #1807 (line 1427).
- **The comparisons with `BO` are TopologicalKTheory's.** #1807 owns `ΩBO≃O` (line 498). A
  `roadmaps grep` for `ΩBO`, `Ω BO ≃` and `ℤ × BO ≃` on main and at all 469 open heads finds no
  other owner.
- **G4.0a–G4.0b consume T1.5–T1.6 and T2's `K` and `KO` groups.** On main's
  GeneralizedCohomology:
  - G4.0a cites T1's finite embedding (line 995) and T1.5–T1.6's colimit construction (line 1000);
  - its scalar-forgetting maps go to TopologicalKTheory's `K`/`KO` groups (lines 1075–1076);
  - G4.0b consumes G4.0a (line 2608), and G4.0a–G4.0b consume T1.5–T1.6 (line 2612).
- **4.2a–4.2b consume G4.0b for `Sp(r)` and the quaternionic Grassmannians.**
  - The *Needs:* lines of 4.2a (1340–1341) and 4.2b (1398) name G4.0b.
  - The objects are at 4.2a line 1311 (`Sp(r)`) and 4.2b lines 1374–1378 (`G_p(ℍ^(4m))`).
  - The supplier contract (lines 371–374) says the same.
- **Nothing else in the README contradicts the bullet.** `TopologicalKTheory` occurs only in this
  bullet. `BO` and `KO` occur only in lines 1880–1883.

**Library declarations opened at the pins.** These are the 4.2a–4.2c inputs behind what the
bullet hands on:

- `HomotopyGroup.pathLoopSpaceMulEquiv`, `TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean:321`;
- `TauCeti.realClifford_classification`, `TauCeti/LinearAlgebra/CliffordAlgebra/Classification.lean:339`;
- `TauCeti.subsingleton_homotopyGroup_sphere_of_lt`, `TauCeti/AlgebraicTopology/Sphere/HomotopyGroup.lean:66`;
- `TauCeti.homotopyGroupSphereAddEquiv`, `TauCeti/AlgebraicTopology/Sphere/HomotopyGroup.lean:110`;
- Mathlib `HomotopyGroup.Pi`, `Mathlib/Topology/Homotopy/HomotopyGroup.lean:460`.

**Cross-roadmap citations resolved** (main at e7bcd5e; open heads at the 05:47 index):

- **TopologicalKTheory #1807 (e444d15).**
  - Its supplier entry is at line 192.
  - It consumes 4.2a in T1.6a (lines 498–500) and 4.2b in T1.6d (lines 824–825). This is R02.
  - It consumes 4.2a–4.2c in T7 at lines 1506, 1526, 1538, 1577 and 1627, as the bullet offers.
- **Main's TopologicalKTheory.**
  - Lines 1733–1734: T7.0 consumes neither the real Bott proof nor characteristic classes.
  - T6 precedes T7, and T6.6 consumes no T7.
- **Main's SpinGeometry.** T7 feeds only G5.0/G6.0 (line 64). G4.1, which G4.0a consumes, uses
  native covers and SpinRepresentations L7 (lines 850–853).
- **Main's AlgebraicTopology.** It supplies T7.0 (lines 746, 1650) and consumes TopologicalKTheory
  only in T1.6 (lines 123, 2112).
- **Main's RiemannianGeometry.** R1 consumes T6.6 (line 287).
- **Main's CharacteristicClasses.** It consumes T7.4 only at line 1753. That is far from C1.1b,
  which G4.0a uses.
- **No TopologicalKTheory citation.** ComplexKahlerGeometry, MorseTheory, GeometricTopology,
  DGFloer and RepresentationTheory/LieGroups contain none.
- **DGFloer #1798 (3166898).** Every DGFloer id cited here resolves, from Layer 1 items 1–6
  (§§1.1–1.6) to Layer 11 (§§11.1–11.3); Layer 4 item 5 is written "(the base's §4.1)", which
  matches #1798's §4.1.
- **Citations of this roadmap.** `roadmaps grep DGFloerPartII` finds them only in #1798 (4
  lines) and #1807 (8 lines).

**Ownership.** I searched by object, on main and at the open heads, for the stable loop and
Grassmannian comparisons with `BO` and for real `KO` periodicity. Only TopologicalKTheory states
them, as the bullet says. The two ordering conflicts are R01 and R02. The overlap listing (`roadmaps overlaps`) lists
no dropped ids and no other pull request changing this roadmap.

**Seeded source sample, where it falls in the changed passages.** The bullet hands on 4.2c.

| Target | Locator checked | Result |
| --- | --- | --- |
| 4.2c, homotopy periodicity | `eschenburg-hanke-bott` lines 240–246 (Theorem 2, p. 7): the shifts `π_k(G) = π_(k−4)(P₄)` for `SO_(4n)`, `SU_(2n)`, `Sp_n`; with `n = 16m`, `P₄ = Sp(2m) = Sp_(n/8)` | agrees with 4.2c's `Sp ≃ Ω⁴O` and 4.2b's `Ω₄ ≅ Sp(2m)` |
| 4.2c, module dimensions | `eschenburg-hanke-bott` lines 284–293 (Theorem 3, p. 8): one irreducible module unless `k ≡ 3 (mod 4)` | agrees with `m_j` and 4.2c's two-module exception |
| 4.2c, index bounds | `eschenburg-hanke-bott` lines 299–303 (Theorem 4, p. 8): the nonminimal index is at least `β`, and `β → ∞` | supports "every `λ_k` grows without bound"; the explicit `λ_k` are Milnor §24 (not verifiable) |

The other sampled targets (1.0–1.5, 2.2, 2.5, 2.6, 3.3, 4.1–4.4, 4.6) are untouched. They were
checked in the reviews at aeddaae and 9e65f2b.

**Adversarial table.** Rows marked "new" were computed for the changed bullet. Rows marked
"carried" are the review at 9e65f2b's, for statements this diff leaves untouched.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Downstream bullet: the T7 offer is acyclic (new) | every external supplier of 4.2a–4.2c and their TopologicalKTheory edges | GeneralizedCohomology G4.0a: T1, T1.5–T1.6, T2. RiemannianGeometry R1–R3: T6.6. AlgebraicTopology Stage 4/8: T1.6 only (8.12), and it supplies T7.0. SpinGeometry G4.1: none. SmoothBundlesConnections, LieGroups L2, ComplexKahlerGeometry K7, MorseTheory M5, GeometricTopology L1, DGFloer L1/L5: none. No supplier consumes T7 | acyclic | none |
| Downstream bullet: no consumption in T1.5–T2 (new) | #1807's T1.6a, the wrong placement | T1.6a → 4.2a (#1807 line 500); 4.2a → G4.0b (README line 1341); G4.0b → G4.0a (GeneralizedCohomology line 2608); G4.0a → T1.5–T1.6 (line 2612): a 4-edge cycle | the bullet excludes it | R02 (description) |
| Downstream bullet: the G5 path (new) | T7.0 → G5.0 (GeneralizedCohomology line 1463); G5.0's low-homotopy supplement ← real Bott (line 2588) | G5 is consumed by 1.5 and 3.1, not by 4.2a–4.2c. T7.0 consumes no real Bott (TopologicalKTheory 1733–1734) | no cycle | none |
| `ΩBO ≃ O` against 4.2c's list (new) | `π_i`, `i = 0..7` | `π_(i+1)(BO)`: ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0, ℤ; `π_i(O)` (4.2c): ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0, ℤ | consistent | none |
| `Ω₇ ≃ ℤ × BO` (new) | `π₀`; the component `d = 0`, `m = 2, 3` | `π₀(Ω₇) = ℤ` through `d` (4.2c), and `π₀(ℤ × BO) = ℤ`. `π₁(G_m(ℝ^(2m))) = ℤ/2` for `m ≥ 2`, which is `π₁(BO)` | consistent | none |
| `KO` periodicity from the eight maps (new) | `π_i(ℤ × BO)`, `i = 0..7`; `π₀` along the chain | ℤ, ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0, which is TopologicalKTheory T7 item 1's `KO` coefficient list. `π₀Ω(U/O) = π₁(U/O) = ℤ = π₀(Ω₇)` and `π₀Ω(Sp/U) = π₁(Sp/U) = 0`, so `Ω₇ ≃ Ω⁸Ω₇` holds on all components | consistent | none |
| 4.2c, `Ω₃` as a colimit (carried) | `m = 1, 2`; `d = 0, ±2, 3` | stages `p = 0..4` and `p = 0..8`; `d = 3` first at `m = 2`; dimension of the `d = 0` stage `16m²`: 16, 64 | as stated | none |
| 4.2c, `Ω₇` as a colimit (carried) | `m = 1, 2` | stages `p = 0..2`, `0..4`; `p ↦ p + 1` preserves `p − m`; `dim G_m(ℝ^(2m)) = m²`: 1, 4 | as stated | none |
| 4.2c, eight equivalences, low degrees (carried) | `π₀` against `π₁` | `π₀(Ω₃) = ℤ = π₁(U/Sp)`; `π₀(Ω₇) = ℤ = π₁(U/O)`; `π₀(O) = ℤ/2 = π₁(G_m(ℝ^(2m)))`, `m ≥ 2`; `π₃(Sp) = ℤ = π₄(G₂(ℍ⁴))` | consistent | none |
| 4.2c Check, tangent space at `J₃` (carried) | `n = 16`, `ℍ⁴` | `dim 𝔰𝔭(4) = 36 = 2·10 + 16`; `dim G₂(ℍ⁴) = 16` | as stated | none |
| 4.6 Check, rational essentiality (carried) | `T⁸ # (S³ × S⁵)`; control `T⁸` | `π₂ = 0`, `π₃ ⊗ ℚ ≠ 0`; `T⁸` fails B's hypothesis | separates the notions | none |
| 2.6, `CPᵈ` class (carried) | `CP¹`; `d = 2` | fibre degree 1; `dim = 2d` | `±g` | none |
| 2.6, `HPᵈ` class (carried) | `d = 1, 2` | degree 2; `dim = 4d + 2` = 6, 10 | `±2g` | none |
| 1.4, `deg τ_u = 1 + (−1)ⁿ` (carried) | `n = 2, 3, 4` | 2, 0, 2 | as stated | none |
| 1.4, rotation family (carried) | `n = 1, 2, 3` | 2, 0, 2; `H₂(SO(3)) = 0`; `H₃(SO(4)) = ℤ²` | as stated | none |
| 4.2, Proposition 6.17 (carried) | `n = 2, 4` | `deg τ = ±2`, `x̄ = −x`, `β_* = ∓2x²` | as stated | none |
| Theorem G (Lean) (carried) | `T⁸ # (S³ × S⁵)`, `k = 3`; `Y = pt`; `S = ∅` | hypotheses hold; `⊤ ⊔ ⊥ = ⊤`; `0 = 0·[Y]` needs `hd` | true; `hd` is needed | none |
| Theorem G, `ℓ` (carried) | `k = 2, 3, 4` | `ℓ` = 2, 2, 6; `n` ≥ 5, 6, 11 | matches the source | none |
| 4.2c index bounds (carried) | `n = 16m` | `8m−1`, `4m−1`, `2m−1`, `2m−1`, `2m−1`, `m−1`; `(n/m_k − |c|)/4` | as stated | none |
| `m_j` (carried) | `j = 0..8` | 1, 2, 4, 4, 8, 8, 8, 8, 16 | as stated | none |
| Stable groups (carried) | `i = 1..8` | ℤ/2, 0, ℤ, 0, 0, 0, ℤ, ℤ/2 | as stated | none |
| Lean Bott ranges (carried) | smallest `m` per class | `π₂(SO 4) = 0`, `π₁(SO 3) = ℤ/2`, `π₃(SO 5) = ℤ`, `π₉(SO 11) = ℤ/2`; `π₃(SO 4) = ℤ²` | bounds needed | none |
| Lemma 6.35 (Lean) (carried) | `n = 3..15`; `n = 4` | 0, ℤ/2, 0, (ℤ/2)², ℤ/2, ℤ/2, ℤ/2; `π₃(SO 4) = ℤ²` | `Odd` needed | none |
| 4.3 splitting (carried) | `n = 3, 7` | `0 ⊕ ℤ/2` against `π₂(SO 3) = π₆(SO 7) = 0` | as stated | none |
| 2.1 indices (carried) | `CP²`, `k = 2`; `HP¹` | `5 = 2·2·1 + 1`; `6k − 3` | as stated | none |
| 2.2 / 2.3 degrees (carried) | `CP²`; `HP²` | 0, 1, 4, 5, 8, 9; 3, 10, 13, 20 | as stated | none |
| 2.5 bidegrees (carried) | `CPᵈ`, `HPᵈ` | `E_(2d,1) → E_(0,2d)`; `E_(4d,3) → E_(0,4d+2)` | as stated | none |
| Theorem B (Lean) (carried) | `T^r`; `ℝP³`; `U = ∅`; `S² ⊔ T²` | `hQ` false; `π₃ = ℤ`; `H_n(∅) = 0`; connectedness needed | true | none |
| 3.3 sign (carried) | `T*ℝ²`, `σ = q₁dq₂` | `ω + dq₁∧dq₂` | as stated | none |
| 4.2a ranges (carried) | `U(r)`, `Sp(r)` | `i ≤ 2r − 1`, `i ≤ 4r + 1` | as stated | none |
| 1.3 quaternion Check (carried) | `v = (1, j)`, `λ = i` | `vλ = (i, −k)`; `iv = (i, k)` | as stated | none |
| 1.0 product Check (carried) | `ℝ/ℤ₊`, `ℚ` | `X ×_k ℚ` strictly finer | as stated | none |
| Capacity theorems (Lean) (carried) | `CP⁰`; `S¹`; `ℓ = 0`; `T^r` | 0; `n ≥ 2`; `A = 0`; `¬IsAspherical` false | true | none |

**Headline theorems.** These are carried, since `Suggested.lean` is unchanged.

- Theorem B: line 117.
- Theorem I's spheres, Lie groups, covered manifolds, `CPᵈ` and `HPᵈ`: lines 138–214.
- Theorem G: line 340.
- The finite-rank Bott ranges and Lemma 6.35: lines 253–324.
- 1.0's convenient category: lines 91 and 100.
- Not statable at the pins, and named in the docstring: Theorem H, fibered families, sphere
  bundles, products and Proposition 6.36, and stable `O`.
- The diff adds no headline. The comparisons with `BO` belong to TopologicalKTheory.

**Remarks on untouched text** (no change requested):

- The Scope paragraph (lines 113–116) defers the comparison of `Ω₃` with stable quaternionic
  bundles "see Downstream consumers", but that section names only the `Ω₇`/`BO` comparison.
- #1798's consumer list (line 4359) omits Layer 0, Layer 3 and Layer 6 item 5, which this README
  also cites. That is #1798's text.

## Not verifiable

- **Milnor, *Morse Theory*, §§22–24** (paywalled): the explicit index bounds and the colimit
  identifications of 4.2c. The values were recomputed above, and `eschenburg-hanke-bott` Theorems
  2–4 support the qualitative statements.
- **R. Bott, *The stable homotopy of the classical groups*, Ann. of Math. 70 (1959)** (paywalled).
- **Carried from the reviews at aeddaae and 9e65f2b; untouched by this diff:**
  - Ziller (Invent. Math. 41, 1977);
  - BDHO, *Morse homology with DG coefficients*;
  - Thom (1954); Jap87;
  - Hatcher, Steenrod, Milnor–Stasheff, Pontryagin and Munkres.

## Source issues

- none
