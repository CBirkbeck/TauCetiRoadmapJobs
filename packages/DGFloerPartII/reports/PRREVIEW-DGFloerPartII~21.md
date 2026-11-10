# Review of DGFloerPartII (pull request #1799 at 4def45e)

**Verdict:** needs changes

This is an incremental re-review of the 66 changed lines since `05e7c01`: 53 insertions and 13
deletions in `README.md` and `Suggested.lean`. Nothing changed outside the folder.

- R01 (P2) and R02 (P3) are carried from review 20. The pull-request description they concern is
  unchanged at this head.
- Review 20's R03 is repaired. The README now cites Tau Ceti's double cover `S³ → SO(3)` and
  `π₁(SO(n)) ≅ ℤ/2`, and the route it describes elaborates at the pins (scratch probe below).
- This report's R03 (P3) is new and comes from that repair. The repair consumes three Mathlib
  declarations that the From Mathlib contract does not list. 4.3's *Needs:* also omits two of
  them, although the Layer 4 Dependencies assign them to 4.3.

The gate passes with the moved order and the targeted build.

## R01 (P2) — Not repaired: main's DGFloer still owns Theorem B, §§6.3–6.4 and §7, and the description does not order DGFloer #1798 first

**Location.**

- README lines 42–43: "The base roadmap, cited as **DGFloer** by layer and item, owns every other
  numbered statement of the source".
- The description's merge-order paragraph ends "#1742 (GeneralAlgebraicKTheoryPartII) → **this
  pull request** (#1799)". #1798 appears nowhere in the description.

**Claim.** This roadmap is the single owner of the following:

- Theorem B, with the Theorem B forms of Corollaries D and E;
- every numbered statement of §§6.3–6.4 and §7;
- the carriers and computations these statements rest on.

**Witness.** Main is now at `f8836c4`; since `3090489` only `TauCetiRoadmap/PDE/` has changed.
Main's `TauCetiRoadmap/DGFloer/README.md` still owns all of the above:

- Theorem B at Layer 10 item 5, line 1567 ("Multiple realization and Theorem5.14/TheoremB").
- Layer 11 at line 1577.

Only DGFloer #1798 hands them over. It is now at `c3d8506`, still a draft; the handover is at its
lines 38–39 and 50–54, with the numbering note at lines 182–198.

**Repair.** Append this sentence to the description's merge-order paragraph:

> #1798 (DGFloer) merges before this pull request or together with it: it moves the source's
> Theorem B, §§6.3–6.4 and §7 out of DGFloer's Layers 10 and 11 into this roadmap, with the
> homogeneous carriers, explicit degree computations and projective loop-space computations they
> rest on.

The README needs no change.

**Tested.**

- At `c3d8506` the numbering note maps Layer 10 item 5's Theorem B to §§3.2–3.3, and Layer 11
  items 1–6 to §§4.1–4.6.
- Layer 10 item 5 keeps its number for Theorems A and C, and Layer 11 item 3 keeps its number for
  `T × K → G`. Those are the uses this README cites.
- `overlaps.md` lists no dropped id.

## R02 (P3) — Not repaired: the description is stale

**Location.** These five passages of the description are stale:

- "HomotopySpheres' James construction and Bott periodicity";
- "compares the base's raw mapping-space carriers with HomotopySpheres' convenient ones";
- "its boundaries vanishing by a Hopf-fibration rank count rather than degree gaps";
- "TangentialBordism's compact-image embedding";
- "`Suggested.lean` states the rotation family at a fixed pole, the low-rank values of
  `π_(n−1)(SO(n))` and its torsion for odd `n`".

**Witness.** Each passage contradicts the folder at this head:

- "HomotopySpheres" occurs 0 times in `README.md` and 0 times in `Suggested.lean`.
- "compact-image" occurs 0 times in `README.md`.
- 2.3 infers the `ΩHPᵈ` boundaries from the degree gaps (README lines 1049–1050).
- 3.1 consumes TangentialBordism B5 and B6.3 (README lines 1189 and 1197).
- "rotation" occurs 0 times in `Suggested.lean`.

**Repair.** Make five edits to the description:

1. Replace "HomotopySpheres' James construction and Bott periodicity" with
   "GeneralAlgebraicKTheoryPartII's James construction and Bott–Samelson theorem".
2. Replace "with HomotopySpheres' convenient ones" with "with the convenient carriers of 1.0 on
   Mathlib's `CompactlyGenerated`".
3. Replace "its boundaries vanishing by a Hopf-fibration rank count rather than degree gaps" with
   "the boundaries for `ΩCPᵈ` vanishing by a Hopf-fibration rank count, and those for `ΩHPᵈ` by
   the degree gaps once the Thom model is built".
4. Replace "TangentialBordism's compact-image embedding" with "TangentialBordism B5's structured
   Pontryagin–Thom and B6.3's rational oriented-bordism surjection".
5. Replace the last sentence with:

   > `Suggested.lean` states:
   >
   > - the compact-generation coreflection and product criterion of 1.0;
   > - Theorem B;
   > - the finiteness of the capacity in Theorem I for fibered families of 2-spheres, for sphere
   >   bundles over highly connected bases, for spheres, for manifolds `ℓ`-covered by
   >   diffeomorphisms, for non-aspherical compact Lie groups, and for `CPᵈ` and `HPᵈ`;
   > - the finite-to-stable range and the finite-rank Bott statements for `SO(n)`;
   > - Lemma 6.35's seven low-rank values, its splitting for odd `n ≥ 17` and its torsion for every
   >   odd `n`;
   > - Theorem G.

**Tested.** `Suggested.lean` declares every statement the replacement names. The declarations are
at lines 106, 115, 132, 164, 192, 219, 247, 262, 280, 310, 323, 362–395, 403–443 and 460, the same
lines as at `05e7c01`.

## R03 (P3) — The repair's Mathlib declarations are missing from the From Mathlib contract, and 4.3's *Needs:* omits two of them

**Location.**

- README lines 312–313, in the From Tau Ceti subsection: "Composed by Mathlib's
  `IsCoveringMap.comp_homeomorph` and `IsCoveringMap.homeomorph_comp`".
- README line 320: "Mathlib's `HomotopyGroup.pi1MulEquivFundamentalGroup`".
- 4.3's *Needs:* (lines 1853–1861) ends "Mathlib `HomotopyGroup.Pi`, `IsOfFinOrder`,
  `Matrix.specialOrthogonalGroup`."
- The Layer 4 Dependencies (lines 2158–2159) list "`IsCoveringMap.comp_homeomorph` and
  `IsCoveringMap.homeomorph_comp` (4.3)".

**Claim.** The supplier contracts list, per supplier, every declaration the roadmap consumes. A
target's *Needs:* line lists what its route uses, item by item.

**Witness.** The From Mathlib subsection (lines 154–220) contains none of the three names. 4.3's
route to `π₂(SO(3)) = 0` uses both composition lemmas: the probe below builds the covering with
them. The Layer 4 Dependencies assign both lemmas to 4.3; 4.3's *Needs:* omits them.

**Repair.**

1. In From Mathlib, edit the first bullet. After "with their group structure
   (`Mathlib/Topology/Homotopy/HomotopyGroup.lean`)", insert ", and
   `HomotopyGroup.pi1MulEquivFundamentalGroup`, the isomorphism `π_ 1 X x ≃* FundamentalGroup X x`
   of the same file, through which 4.2c reads its case `i = 1`". Then add this bullet:

   > - `IsCoveringMap.comp_homeomorph` and `IsCoveringMap.homeomorph_comp`
   >   (`Mathlib/Topology/Covering/Basic.lean`): a covering map composed with a homeomorphism on
   >   either side is a covering map; 4.3 assembles the double cover `S³ → SO(3)` with them.

2. In 4.3's *Needs:* (line 1860), insert `IsCoveringMap.comp_homeomorph` and
   `IsCoveringMap.homeomorph_comp` after Mathlib `HomotopyGroup.Pi`.

**Tested.** At Mathlib `1b1ccf4` the three names are at these places:

- `IsCoveringMap.comp_homeomorph`: `Topology/Covering/Basic.lean` line 388.
- `IsCoveringMap.homeomorph_comp`: the same file, line 392.
- `HomotopyGroup.pi1MulEquivFundamentalGroup`: `Topology/Homotopy/HomotopyGroup.lean` line 628,
  with type `HomotopyGroup.Pi 1 X x ≃* FundamentalGroup X x`.

The scratch probe uses exactly these names together with the Tau Ceti names of the contract, and
it elaborates with exit 0.

## Previous findings

- R01 — not repaired: README lines 42–43 are unchanged, and the description's merge-order
  paragraph still ends "#1742 (GeneralAlgebraicKTheoryPartII) → **this pull request** (#1799)"
  without naming #1798. Carried as R01.
- R02 — not repaired: the description still says "HomotopySpheres' James construction and Bott
  periodicity", "TangentialBordism's compact-image embedding" and "states the rotation family at a
  fixed pole". Carried as R02.
- R03 — repaired: README lines 298–316 cite `CliffordAlgebra.isCoveringMap_realCliffordSpinProjectionZero`,
  `TauCeti.realSpinThreeHomeomorphQuaternionSphere` and
  `TauCeti.QuadraticMap.matrixSpecialOrthogonalContinuousMulEquivRealCliffordForm`. 4.3's *Needs:*
  (lines 1857–1859) and the Layer 4 Dependencies (lines 2151–2153) name them. The contract gap is
  this report's R03.

The brief names no repair report, so neither R01 nor R02 is marked "not actionable in this
package".

## Verified sound

### Gate, dependency check, build

- **The worker's gate** (`gate.md`): every check is 0, and the result is `OK`.
- **The brief's gate command, with the configured order.** The result is `FAIL`, from one line:
  `depcheck: UPWARD: DGFloerPartII (#46) -> GeneralAlgebraicKTheoryPartII (#335) at README lines
  [423, 737, 958, 1460, 2133]`. This is the moved case: the configured order lists this roadmap
  above a supplier, and the worker moves it when it submits.
- **The same command with `--order merge-order-moved.txt --build`.** Every check is 0, `build=0`,
  and the result is `OK`.
- **The brief's dependency check:**

      depcheck: 235 roadmaps, 2266 edges, 0 problem(s)

- **Other checks.**
  - `git diff --stat origin/main...HEAD` outside the folder is empty.
  - The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

### The changed contract text, against the pins (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`)

| Name | Pinned file and line | What the README says | What the pin says |
| --- | --- | --- | --- |
| `CliffordAlgebra.isCoveringMap_realCliffordSpinProjectionZero` | `Topology/Algebra/CliffordAlgebra/Spin/Covering.lean` 114 | a covering for `n ≥ 1` once Spin is compact | `[NeZero n] [CompactSpace (realCliffordSpinGroupZero n)]`, conclusion `IsCoveringMap (realCliffordSpinProjectionZero n)` |
| `CliffordAlgebra.realCliffordSpinProjectionZero` | same file, 53 | Spin of `realCliffordForm n 0` onto its special orthogonal group | `realCliffordSpinGroupZero n →ₜ* QuadraticMap.specialOrthogonalGroup (realCliffordForm n 0)` |
| `CliffordAlgebra.instCompactSpaceRealCliffordSpinGroupZero` | `…/Spin/Compact.lean` 265 | compact for every `n` | an instance for every `n : ℕ`, with a `zero` branch |
| `TauCeti.realSpinThreeHomeomorphQuaternionSphere` | `…/Spin/SimplyConnected.lean` 124 | `Spin(3)` is homeomorphic to the unit sphere of `ℍ` | `spinGroup (realCliffordForm 3 0) ≃ₜ sphere (0 : ℍ[ℝ]) 1` |
| `TauCeti.QuadraticMap.matrixSpecialOrthogonalContinuousMulEquivRealCliffordForm` | `Topology/Algebra/QuadraticForm/RealSpecialOrthogonal.lean` 139 | a topological group isomorphism; a matrix acts by its linear map | `≃ₜ*`; the `_apply` lemma (line 147) gives `Matrix.toLin' A x` |
| `TauCeti.specialOrthogonalGroupFundamentalGroupMulEquiv` | `…/Spin/UniversalCover.lean` 237 | `π₁(SO(n), 1) = ℤ/2` for `n ≥ 3` | `(hn : 3 ≤ n) : FundamentalGroup (Matrix.specialOrthogonalGroup (Fin n) ℝ) 1 ≃* Multiplicative (ZMod 2)` |
| `IsCoveringMap.homotopyGroupPiMulEquiv` | `Topology/Homotopy/HomotopyGroup/Covering.lean` 174 | `π_(n+2)` isomorphisms | `π_ (n + 2) E e ≃* π_ (n + 2) X (p e)` |
| `TauCeti.subsingleton_homotopyGroup_sphere_of_lt` | `AlgebraicTopology/Sphere/HomotopyGroup.lean` 66 | `π₂(S³) = 0` | `finrank ℝ E = n + 1` and `Nat.card N < n` give `Subsingleton` |
| Mathlib `comp_homeomorph`, `homeomorph_comp`, `pi1MulEquivFundamentalGroup` | see R03 | as cited | as cited |

### Elaboration of the stated route

I ran `lake env lean` on a scratch file. It imports Mathlib and the seven Tau Ceti modules, and
`#check`s all ten names. It then proves both claims of the changed text, with exit 0 and only a
style-linter warning:

```lean
example : Subsingleton (HomotopyGroup.Pi 2 (SO 3) 1) := by
  let e := TauCeti.QuadraticMap.matrixSpecialOrthogonalContinuousMulEquivRealCliffordForm 3
  let h := TauCeti.realSpinThreeHomeomorphQuaternionSphere
  let p : Metric.sphere (0 : ℍ[ℝ]) 1 → SO 3 :=
    e.toHomeomorph.symm ∘ (CliffordAlgebra.realCliffordSpinProjectionZero 3) ∘ h.symm
  have hp : IsCoveringMap p :=
    ((CliffordAlgebra.isCoveringMap_realCliffordSpinProjectionZero 3).comp_homeomorph
      h.symm).homeomorph_comp e.toHomeomorph.symm
  have hp1 : p (h 1) = 1 := by
    simp only [p, Function.comp_apply, Homeomorph.symm_apply_apply]
    rw [map_one]
    exact map_one e.symm
  have iso := hp.homotopyGroupPiMulEquiv (h 1) 0
  rw [hp1] at iso
  haveI : Subsingleton (HomotopyGroup.Pi (0 + 2) (Metric.sphere (0 : ℍ[ℝ]) 1) (h 1)) :=
    TauCeti.subsingleton_homotopyGroup_sphere_of_lt (n := 3)
      (by rw [Quaternion.finrank_eq_four]) (by simp) _
  exact iso.symm.toEquiv.subsingleton

example (m : ℕ) (hm : 0 + 3 ≤ m) :
    Nonempty (HomotopyGroup.Pi (0 + 1) (SO m) 1 ≃* Multiplicative (ZMod 2)) :=
  ⟨HomotopyGroup.pi1MulEquivFundamentalGroup.trans
    (TauCeti.specialOrthogonalGroupFundamentalGroupMulEquiv m (by omega))⟩
```

The second example has the type of `nonempty_pi_SO_mulEquiv_zmod_two 0 m`. The following are
therefore true as written:

- README lines 312–316, which say the double cover sends the image of `1 ∈ Spin(3)` to the
  identity and gives `π₂(SO(3)) = 0`;
- lines 1750–1752 (the case `i = 1` for every `r ≥ 3`);
- lines 1817–1818 (4.3's first low-rank value);
- the new docstring of `subsingleton_pi2_SO3`.

### Suggested.lean

- **The only change** is the docstring of `subsingleton_pi2_SO3` (lines 401–402).
  - Its type is unchanged: `Subsingleton (HomotopyGroup.Pi 2 (SO 3) 1)` (`signatures.md`). It
    matches README 4.3.
  - All 31 declarations are at the same lines as at `05e7c01`. `signatures.md` lists 33 entries;
    its `of` (line 130) and `on` (line 298) are words from docstrings, not declarations.
- **One-tactic probe.** I ran `first | infer_instance | rfl | (simp; done) | decide | exact?` on
  `Subsingleton (π_ 2 (SO 3) 1)`. The scratch file imported the seven Spin and covering modules,
  which is more than `Suggested.lean` imports. The result was "`exact?` could not close the goal",
  so the declaration is not padding by the probe.
- **Remark (no change asked).** With the cited names the goal closes in the 15-line term above.
  The statement is untouched, and review 20 kept it as the first of Lemma 6.35's seven values.
- **Library near-matches.** `library-matches.md` lists no Loogle hit for `Subsingleton, SO`. No
  pinned declaration states `π₂(SO(3)) = 0` or `π_i(SO(m)) ≅ ℤ/2` for general `i`; the Tau Ceti
  value is the special case `i = 1`.

### Seeded sample where the diff touches it

- **4.3.** Lemma 6.35 is at `bdho-cotangent` line 5073 (printed p. 117). The value
  `π₂(SO(3)) = 0` is at line 5076, read there from [Jap87] Table 6.VII. The README's double-cover
  route gives the same value, and the probe confirms it. The `ℤ/4` misprint at line 5076 is
  already recorded in review 20's Source issues.
- **Other sampled targets** (1.1, 1.2, 1.4, 1.5, 2.1–2.5, 3.2, 4.1, 4.2, 4.2b, 4.5): the diff does
  not touch them. Review 20's sample rows stand.

### Adversarial table

Rows 1–33 and 35–36 are carried unchanged from review 20's table. Their statements are untouched:
Theorem B, the capacity statements, Theorem G, the 4.2a range, the Bott statements, the low-rank
values and the splitting. Row 34 is replaced, and rows 37–41 are new for the changed text.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1–33, 35–36 | as in review 20 | as in review 20 | as in review 20 | true or sharp | none |
| 34 | 4.3 double cover, `π₂(SO(3)) = 0` (README 298–316, 1817–1818; Lean docstring) | `p = e⁻¹ ∘ π ∘ h⁻¹` at `n = 3`, base point `h 1` | `p(h 1) = e⁻¹(π(1)) = e⁻¹(1) = 1`. `finrank ℝ ℍ = 4 = 3 + 1` and `Nat.card (Fin 2) = 2 < 3`, so `π_(0+2)(S³)` is trivial. The iso carries it to `π₂(SO(3), 1)`. | true; elaborates | none |
| 37 | Covering lemma's range "`n ≥ 1`", compactness "every `n`" (README 299–305) | `n = 0, 1, 3` | `n = 0`: `NeZero 0` is false, so it is excluded as stated; the instance's `zero` branch still gives compactness. `n = 1`: `Spin(1) = {±1} → SO(1) = {1}`, a 2-sheeted cover of a point. `n = 3`: row 34. | as stated | none |
| 38 | `π₁(SO(n)) ≅ ℤ/2` for `n ≥ 3` (README 317–322) | `n = 2, 3, 4` | `n = 2`: `π₁(SO(2)) = π₁(S¹) = ℤ`, and `hn : 3 ≤ 2` is false, so the bound is needed. `n = 3`: `SO(3) ≅ ℝP³`, `π₁ = ℤ/2`. `n = 4`: `S³ × S³ → SO(4)` is 2:1 from a simply connected group, `ℤ/2`. | as stated | none |
| 39 | 4.2c "in degree `i = 1` … for every `r ≥ 3`" (README 1750–1752) | `j = 0, m = 3`; `j = 7, m = 10` | `j = 0`: `0 % 8 = 0` and `j + 3 ≤ m` is `3 ≤ m`, Tau Ceti's `hn`. `j = 7` (`i = 8`): Tau Ceti says nothing, and the README claims only `i = 1`. | as stated | none |
| 40 | 4.2a range Check with the cited value (README 1583–1585) | `(r, i) = (2, 1)` | `ℤ → ℤ/2` sends the plane-rotation loop to the nontrivial class, so it is onto. The kernel is `2ℤ ≠ 0`, so it is not injective. The cited value is at `n = 3 ≥ 3`. | as stated | none |
| 41 | Docstring: the cover "induces an isomorphism on `π₂`" | degrees 1 and 2 | Degree 1: `π₁(S³) = 0 → π₁(SO(3)) = ℤ/2` is not onto, so the `n + 2` indexing of `homotopyGroupPiMulEquiv` matters. Degree 2: isomorphism. | as stated | none |

### Citations and ownership

- **Library names.** All ten names the diff adds resolve at the pins, in the files the README
  gives (table above).
- **Main.** Main moved from `3090489` to `f8836c4` and touched only `TauCetiRoadmap/PDE/`. Every
  roadmap citation review 20 resolved still resolves.
- **`overlaps.md`.** Its "only an open revision defines GeneralizedCohomology G4.0b" is a false
  positive: main defines G4.0b in item text at line 1082 of `TauCetiRoadmap/GeneralizedCohomology/README.md`.
  `overlaps.md` lists no dropped id, and no other open pull request changes this roadmap.
- **Ownership.** The diff plans no new object. It cites Tau Ceti for the double cover and for
  `π₁(SO(n))` instead of planning them.

## Not verifiable

None of these texts is in the sources cache. The values that depend on them were recomputed in
review 20's table and in rows 34–41:

- Ziller, *The free loop space of globally symmetric spaces*.
- Milnor, *Morse Theory* §§22–24.
- Bott 1959.
- Steenrod.
- Milnor–Stasheff.
- Pontryagin, Chapter II.
- Thom 1954.
- BDHO, *Morse homology with DG coefficients*.
- [Jap87], Tables 6.VII–6.VIII. Of these texts only [Jap87] bears on a changed passage, as the
  source's citation for `π₂(SO(3)) = 0`.

## Source issues

- none
