# Review of DGFloerPartII (pull request #1799 at 05e7c01)

**Verdict:** needs changes

This is a full review of the head that review 19 read. The folder, the pins, main (`3090489`) and the
pull-request description are all unchanged since that review.

- R01 (P2) and R02 (P3) are review 19's R01 and R02. The description still carries both defects.
- R03 (P3) is new. Pinned Tau Ceti already provides the double cover `S³ → SO(3)` that 4.3 rests on,
  and the README does not cite it.

The gate passes with the moved order and the targeted build.

## R01 (P2) — Not repaired: main's DGFloer still owns Theorem B, §§6.3–6.4 and §7, and the description does not order DGFloer #1798 first

**Location.**

- README lines 42–44: "The base roadmap, cited as **DGFloer** by layer and item, owns every other
  numbered statement of the source".
- The description's merge-order paragraph ends "#1742 (GeneralAlgebraicKTheoryPartII) → **this
  pull request** (#1799)". #1798 appears nowhere in the description.

**Claim.** This roadmap is the single owner of the following:

- Theorem B, with the Theorem B forms of Corollaries D and E;
- every numbered statement of §§6.3–6.4 and §7;
- the carriers and computations these statements rest on.

**Witness.** Main's `TauCetiRoadmap/DGFloer/README.md` still owns all of them:

- Theorem B at Layer 10 item 5: line 1562, with "Multiple realization and Theorem5.14/TheoremB" at
  line 1567.
- Abundance, Theorem H, fibered families, covering by diffeomorphisms with Lemma 6.35, homogeneous
  and projective spaces, Theorem I and Theorem G at Layer 11, line 1577.

Only DGFloer #1798 (`334507b`, draft) hands them over: its lines 38–39 and 50–54, with the
numbering map at lines 185–197.

**Repair.** Append this sentence to the description's merge-order paragraph:

> #1798 (DGFloer) merges before this pull request or together with it: it moves the source's
> Theorem B, §§6.3–6.4 and §7 out of DGFloer's Layers 10 and 11 into this roadmap, with the
> homogeneous carriers, explicit degree computations and projective loop-space computations they
> rest on.

The README needs no change. #1798 supplies no citation here; this roadmap cites DGFloer as it is on
main. So the sentence states an order, and the Depends-on list need not name #1798. This repair is
narrower than review 19's, which also added #1798 to the Depends-on list.

**Tested.** Every DGFloer id this README cites exists on main, and resolves at #1798 through its
numbering note (lines 150–197):

- Layer 1 items 1–6.
- Layer 2 items 1–3.
- Layer 3.
- Layer 4 item 5. At #1798 it is Layer 4 item 1.
- Layer 5 items 1–6.
- Layer 6 items 3–5.
- Layer 10 items 2–5. At #1798, Layer 10 item 5 keeps its number for Theorems A and C.
- Layer 11. At #1798, Layer 11 item 3 keeps its number for the finite cover `T × K → G` and the
  torus criterion.

`overlaps.md` lists no dropped id.

## R02 (P3) — Not repaired: the description is stale

**Location.** These five passages of the description are stale:

- "HomotopySpheres' James construction and Bott periodicity";
- "compares the base's raw mapping-space carriers with HomotopySpheres' convenient ones";
- "its boundaries vanishing by a Hopf-fibration rank count rather than degree gaps";
- "TangentialBordism's compact-image embedding";
- "`Suggested.lean` states the rotation family at a fixed pole, the low-rank values of
  `π_(n−1)(SO(n))` and its torsion for odd `n`".

**Witness.** Each passage contradicts the folder at this head:

- "HomotopySpheres" occurs 0 times in `README.md` and in `Suggested.lean`.
- "compact-image" occurs 0 times in `README.md`.
- 2.3 infers the `ΩHPᵈ` boundaries from the degree gaps (README lines 1024–1025).
- 3.1 consumes TangentialBordism B5 and B6.3 (README lines 1164–1166).
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

**Tested.** Every statement the replacement names is declared in `Suggested.lean`, at lines 106, 115,
132, 164, 192, 219, 247, 262, 280, 310, 323, 362–397, 403–444 and 460.

## R03 (P3) — 4.3 rests on the double cover `S³ → SO(3)` and names no owner; pinned Tau Ceti provides it

**Location.**

- README lines 295–297, in the contract bullet for `IsCoveringMap.homotopyGroupPiMulEquiv`: "4.3
  reads `π₂(SO(3)) ≅ π₂(S³)` off the double cover `S³ → SO(3)`".
- The 4.3 Check at lines 1830–1831.
- `subsingleton_pi2_SO3`'s docstring (`Suggested.lean` lines 401–402).
- 4.3's *Needs:* (lines 1823–1827) and the Layer 4 Dependencies (line 2116) name no source for the
  double cover.

**Claim.** The contract preamble (lines 151–152) says: "what the pins lack is a target of this
roadmap or of the named supplier". The double cover is neither a target here nor a named supplier
section, and the README cites no declaration for it.

**Witness.** Tau Ceti `2fd255d` provides the double cover:

- `CliffordAlgebra.isCoveringMap_realCliffordSpinProjectionZero`
  (`TauCeti/Topology/Algebra/CliffordAlgebra/Spin/Covering.lean` line 114).
- `TauCeti.realSpinThreeHomeomorphQuaternionSphere` (`…/Spin/SimplyConnected.lean` line 124).
- `TauCeti.QuadraticMap.matrixSpecialOrthogonalContinuousMulEquivRealCliffordForm`
  (`TauCeti/Topology/Algebra/QuadraticForm/RealSpecialOrthogonal.lean` line 139).

Separately, `TauCeti.specialOrthogonalGroupFundamentalGroupMulEquiv` (`…/Spin/UniversalCover.lean`
line 237) gives `π₁(SO(n)) ≅ ℤ/2` for `n ≥ 3`, which 4.2a's Check at line 1558 uses.

**Repair.**

1. After the `IsCoveringMap.homotopyGroupPiMulEquiv` bullet (README line 297), add:

   > - `CliffordAlgebra.isCoveringMap_realCliffordSpinProjectionZero`
   >   (`TauCeti/Topology/Algebra/CliffordAlgebra/Spin/Covering.lean`), that the projection of the
   >   compact real Spin group onto the special orthogonal group of `realCliffordForm n 0`, `n ≥ 1`,
   >   is a covering map; `TauCeti.realSpinThreeHomeomorphQuaternionSphere`
   >   (`TauCeti/Topology/Algebra/CliffordAlgebra/Spin/SimplyConnected.lean`), the homeomorphism of
   >   `Spin(3)` with the unit sphere of `ℍ`; and
   >   `TauCeti.QuadraticMap.matrixSpecialOrthogonalContinuousMulEquivRealCliffordForm`
   >   (`TauCeti/Topology/Algebra/QuadraticForm/RealSpecialOrthogonal.lean`), the identification of
   >   `Matrix.specialOrthogonalGroup (Fin n) ℝ` with that group. Composed, they are the double cover
   >   `S³ → SO(3)` of 4.3. `TauCeti.specialOrthogonalGroupFundamentalGroupMulEquiv`
   >   (`TauCeti/Topology/Algebra/CliffordAlgebra/Spin/UniversalCover.lean`) gives `π₁(SO(n)) ≅ ℤ/2`
   >   for `n ≥ 3`, the value in 4.2a's range Check.

2. In 4.3's *Needs:* (line 1826) and in the Layer 4 Dependencies (line 2116), insert the first three
   names after `IsCoveringMap.homotopyGroupPiMulEquiv`.

`subsingleton_pi2_SO3` stays in `Suggested.lean`: no pinned declaration states it, and the
one-tactic probe fails on it.

**Tested.** I ran `lake build` on the three Spin modules (8183 jobs, success), then elaborated a
scratch file. It has:

- `#check` of all four names;
- `CompactSpace (realCliffordSpinGroupZero 3)` by `inferInstance`;
- the example below, which elaborates with no error:

  ```lean
  IsCoveringMap (e.toHomeomorph.symm ∘ realCliffordSpinProjectionZero 3 ∘
    realSpinThreeHomeomorphQuaternionSphere.symm)
  ```

  Here `e` is the matrix comparison at `n = 3`. The proof is `comp_homeomorph` followed by
  `homeomorph_comp` (Mathlib `Topology/Covering/Basic.lean` lines 388 and 392).
- `Subsingleton (HomotopyGroup (Fin 2) (sphere (0 : ℍ) 1) x)` from
  `TauCeti.subsingleton_homotopyGroup_sphere_of_lt` with `finrank ℝ ℍ = 3 + 1`.

So `IsCoveringMap.homotopyGroupPiMulEquiv` reads `π₂(SO(3)) = 0` off these pinned declarations,
which is the route the 4.3 Check describes.

## Previous findings

- **R01 (review 19) — not repaired.** README lines 42–44 are unchanged. The description's
  Depends-on list still names only #1742 and #942, and its merge-order paragraph still ends at
  "#1742 → this pull request". Main's DGFloer still owns Theorem B (line 1567) and Layer 11
  (line 1577). Carried as R01, with a narrower repair.
- **R02 (review 19) — not repaired.** The description still contains:
  - "HomotopySpheres' James construction and Bott periodicity";
  - "TangentialBordism's compact-image embedding";
  - "`Suggested.lean` states the rotation family at a fixed pole".

  Carried as R02.

No repair report marks either finding "not actionable in this package", so neither is settled.

## Verified sound

### Gate, dependency check, build

- **The worker's gate** (`gate.md`) reports every check 0, `build=0` included.
- **The brief's gate command, with the configured order.** The result is `FAIL`, from one problem:
  `depcheck: UPWARD: DGFloerPartII (#46) -> GeneralAlgebraicKTheoryPartII (#335)`. This is the
  moved case: the configured order lists this roadmap above a supplier, and the worker moves it
  when it submits.
- **The same command with `--order merge-order-moved.txt --build`.** Every check is 0,
  `build=0`, and the result is `OK`.
- **The brief's dependency check:**

      depcheck: 235 roadmaps, 2266 edges, 0 problem(s)

  The moved order puts SmoothBundlesConnections at line 12, TangentialBordism at line 14,
  GeneralAlgebraicKTheoryPartII at line 334 and this roadmap at line 335.
- **Other checks.**
  - `git diff --stat origin/main...HEAD` outside the folder is empty.
  - The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

### Elaboration, signatures, padding

- **Elaboration.** `lake env lean` on a scratch copy, with `#check @name` for all 31
  declarations, exits 0. It prints 27 `sorry` warnings and nothing else: the 31 declarations less
  `SO`, `soBlockInclusion`, `soBlockInclusion_one` and the `CPᵈ` instance.
- **Signatures.** I compared each elaborated type with its README statement. Every hypothesis the
  README states is a binder, including:
  - Theorem B: `ConnectedSpace Q`, `hQ`, `hFc`, `hc`, `hU`;
  - fibered family: `CompactSpace F`, `hF`, `hp`, `hσ`, `he₀`, `hj`, `hσj`;
  - sphere bundles: `Even n`, `2 ≤ n`, `n % 4 = 3`, the connectivity bounds, `hu`, `hw`, `huw`;
  - Theorem G: `hdim`, `hab`, `htr`, `hY`, `htriv`, `hd`, `hdeg`, `hφU`.

  `S` needs no `CompactSpace` binder: `Q` is compact and `F` is compact, so finitely many
  `p⁻¹(K) ≅ K × F` cover `S`.
- **One-tactic probe.** I replaced every `sorry` by
  `first | infer_instance | rfl | (simp; done) | decide | exact?`. All 27 goals fail with "`exact?`
  could not close the goal". Padding: none.
- **Pinned near-matches.**
  - Mathlib states neither `compactlyGeneratedToTop` as a left adjoint nor a product criterion.
    `Condensed/TopCatAdjunction.lean` is a different adjunction, and
    `CompactlyGeneratedSpace.lean` line 355 is the weakly-locally-compact instance.
  - Tau Ceti has no real `IsManifold` instance on `ComplexProjectiveSpace`, so
    `instIsManifoldRealComplexProjectiveSpace` is needed.
  - No shriek or Umkehr map exists at the pins, and no smooth structure on `G ⧸ H`. The module
    docstring's "not statable" list holds.

### Headline theorems

- **Stated:**
  - Theorem B;
  - Theorem I's capacity forms: fibered families, both sphere-bundle cases, spheres, `ℓ`-covered
    manifolds, Lie groups, `CPᵈ` and `HPᵈ`;
  - Theorem G;
  - real Bott periodicity and the stable groups, in finite rank;
  - Lemma 6.35, with its values and splitting;
  - 1.0's coreflection and product criterion.
- **Named as not statable:**
  - Theorem H and abundance (no shriek map);
  - products (their hypothesis is abundance);
  - Proposition 6.36 (no smooth `G/H`);
  - the stable group `O` and the Clifford chain (no carriers).
- **Statable but absent:** none.

### Seeded source sample

Locators are `bdho-cotangent` line numbers, with printed pages, unless another source is named.

| Target | Checked against | Result |
| --- | --- | --- |
| 1.1 | No source locator. The metrizable lane holds: `C(S², Q)` with compact `S²` carries the uniform metric, is sequential, and so compactly generated, and the counit is a homeomorphism. The Dowker Check is the standard example. | as stated |
| 1.3 | Tau Ceti `Diffeomorph.cotangent` (`Diffeomorph/Cotangent.lean` 119), `mpullback_cotangent_symplecticForm` (`Bundle/Lift.lean` 88), `contractibleHZCapacity_image`, `TauCeti.stiefel` (`Instances/Stiefel.lean` 162). The Checks are recomputed in rows 22–23. | as stated |
| 1.4 | Proof of Prop 6.17: lines 4759–4773, pp. 109–110. Footnote 16: line 4802. Remark 6.19: line 4792, p. 110. Second proof of Prop 6.34: lines 5122–5139, p. 118. | as stated |
| 1.5 | GeneralizedCohomology G5 item 2 (main, line 1523); TangentialBordism B5.1 and B5.5 (#942 `3324fdd`, lines 1510 and 1863); DGFloer Layer 1 item 5 (main). Pontryagin's text is listed under Not verifiable. | as stated |
| 2.1 | The `HPᵈ` index `2(k−1)(2n+1)+3` and first index 3 [Zil77, Theorem 3]: lines 5283–5287, p. 122. The `CPᵈ` first index 1: line 5239, p. 121. Recomputed in row 13. | as stated |
| 2.2 | No new locator. The cell count is recomputed in row 14. | as stated |
| 2.4 | DGFloer Layer 4 item 5 and Layer 5 item 4 (main; #1798 maps the former to Layer 4 item 1). | as stated |
| 2.5 | GeneralizedCohomology G4.0 and G4.3–G4.5 (main, lines 938 and 1214–1246). Degrees in row 16. | as stated |
| 2.6 | Proof of Prop 6.39: lines 5252–5300, pp. 121–122 ("twice a generator", line 5272). Proof of Prop 6.38 says "twice" (line 5236, p. 120); see Source issues. | as stated |
| 3.3 | Corollary D: line 265. Corollary E: line 304. Sign recomputed in row 24. | as stated |
| 4.1 | Def 1.7: lines 415–423, pp. 10–11. Theorem H: line 424, p. 11. Def 6.11 and Theorem 6.12: lines 4517–4528, p. 104. Prop 6.13: line 4608, p. 106. | as stated |
| 4.2 | Def 6.14 and Prop 6.15: lines 4621–4643, pp. 106–107. Remark 2.10: line 1209, p. 28. Corollary 2.13: line 1237, p. 29. Remark 6.2: lines 4351–4353, p. 100. Prop 6.23 and Remarks 6.24–6.25: lines 4849–4881, p. 112. Hatcher Prop 4.48: `hatcher-at` line 16461. | as stated |
| 4.2b | `eschenburg-hanke-bott` §2 (line 184), §3 (lines 247–293), Theorem 3 table (line 288), §4 (lines 294–408). Milnor's text is listed under Not verifiable. | as stated |
| 4.4 | Prop 6.36: lines 5156–5200, pp. 119–120. Example 6.37: lines 5201–5210, p. 120. Remark 6.2 for `ℝPⁿ`: line 5216. | as stated |
| 4.5 | Theorem I: lines 430–445, p. 11. Props 6.38 and 6.39: lines 5218 and 5247, pp. 120–121. | as stated |
| 4.3 (finding R03) | Lemma 6.35: lines 5073–5094, p. 117, which prints `ℤ/4`. `css-derivative` line 222: the stabilization is split with kernel `ℤ/2`. Line 249: `π₈SO₈ = (ℤ/2)³` maps onto `π₈SO`. | as stated, apart from R03 |
| 4.6 | Theorem 7.1: lines 5354–5372, pp. 123–124. Lemma 7.7, stated for `d ≥ 2`: line 5503, p. 126. Applied with `d = k − 2` or `2k − 3`: line 5536, p. 127. | as stated |
| 3.2 | Theorem B: line 243. Theorem 5.14: lines 4267–4272, p. 98. Theorem 5.10, conditions 1–2: lines 4140–4147, p. 95. | as stated |
| 1.0 | `strickland-cgwh` Props 2.6, 2.11, 2.12, 2.20, 5.1, 5.7 and Cor 5.8 (lines 122, 159, 177, 290, 1033, 1086, 1096). `rezk-cg-spaces` 7.3, 8.6, 8.8, 9.2 (lines 313, 382, 409, 433); Rezk's "locally compact" includes Hausdorff (line 292), as `T2Space Y` does. Hatcher Theorem A.6 (line 22693). | as stated |

The README flags no locator as unverified.

### Adversarial table

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | Theorem B (Lean) | `T^r`; `ℝP³`; `Q` a point; `c < min F` | `π_(ℓ≥2)(T^r) = 0`: `hQ` false. `π₃(ℝP³) = ℤ` has infinite order: `hQ` true. A point has all `π` trivial: `hQ` false. `U = ∅` gives `H_n(∅) = 0`: `hU` false. | true, and vacuous where it must be | none |
| 2 | Theorem B route | `x ∈ π_ℓ` of infinite order, `d = Nb` | `d^m x ≠ 0` for every `m`, which is Theorem 5.10 condition 2 (lines 4146–4147) | sound | none |
| 3 | Theorem B connectedness | `Q = S² ⊔ T²`, `U = D*T²` flat | `H₂(U) = ℤ → H₂(Q) = ℤ²` is nonzero; the closed characteristics are flat geodesics of `T²`, none contractible | `ConnectedSpace Q` needed, and present | none |
| 4 | Capacity of `CP⁰`, `HP⁰` (Lean) | `T*pt = pt` | The only admissible `H` is 0, because it must vanish on a nonempty open set (Tau Ceti `IsHZNormalized`, line 114). Capacity `ofReal 0 = 0 < ⊤`. | true | none |
| 5 | Fibered family (Lean) | `dim Q = 0`; `F = ∅`; `SO(3) ⊔ SO(3) → S²` | `j_*[F] ∈ H_(dim F)(pt) = 0`: `hσj` false. `[∅] = 0`: false. Product `e₀` gives `2α′`; swap-and-reverse gives `0`. Reduction to `F₁ = SO(2)`, `Q̃ = S²`, `±α′ ≠ 0`. | true | none |
| 6 | Covering descent | `ρ : S² → ℝP²` | `H ∘ ρ̂` has the same maximum and support `ρ̂⁻¹(supp H)`, which is compact (2 sheets). A contractible orbit upstairs projects to one downstairs. `c°(D*ℝP²) ≤ c°(D*S²)` (Remark 6.2, line 4351). | true | none |
| 7 | Sphere bundle, even (Lean) | `B = pt`, `n = 2`; twistor `S² → CP³ → S⁴` | `S(V) = S²`. For the twistor fibration `π₄(S⁴) = ℤ`, so `hB` fails; `π₃(CP³) = 0` kills the Stiefel class in `H₁(Ω²CP³)`. | hypothesis sharp | none |
| 8 | Sphere bundle, odd (Lean) | `n = 3`, `B = pt`; `n = 5` | `u = ix`, `w = jx`: `⟨x, ix⟩ = 0` and `⟨ix, jx⟩ = ⟨x, −kx⟩ = 0`. `n % 4 = 1` is excluded: Radon–Hurwitz `ρ(6) − 1 = 1` field. | true | none |
| 9 | Spheres (Lean) | `n = 0, 1, 2` | `S⁰`: `H = a` on one point is admissible, capacity `∞`. `S¹ = T¹`: `∞`. `n = 2` holds by 4.2. | `2 ≤ n` needed and present | none |
| 10 | Lie groups (Lean) | `T^r`; `SU(2)`; `SO(3)` | `IsAspherical T^r`: `hG` false. `π₃(SU(2)) = ℤ` and `π₃(SO(3)) = ℤ`: not aspherical. | true | none |
| 11 | `ℓ`-covered (Lean) | `ℓ = 0`; `T^r`; `S³` with `ℓ = 2` | `ℓ = 0` is excluded by `hℓ`. `T^r`: every `π_(k+2) = 0`, so `hM` false. `S³`: `k = 1`, `x ∈ π₃ = ℤ`, `x² ≠ 1`. | true | none |
| 12 | Prop 6.33 hypothesis vs the Lean `hM` | `k = 0` | The `k = 0` disjunct gives an element of `π₂` with `x^ℓ ≠ 1`, which implies `Nontrivial π₂`. Source lines 5059–5062. | same class | none |
| 13 | 2.1 indices | `CP²`, `k = 2`; `HP²`, `k = 2` | `CP²`: `(2k−1) + (k−1)(2d−2) = 3 + 2 = 5 = 2·2·1 + 1`. `HP²`: `3·3 + 1·4 = 13 = 2·1·5 + 3`. | as stated | none |
| 14 | 2.2 cells | `CP²` | `0, 1, 4, 5, 8, 9`, against `H_*(S¹ × ΩS⁵)` in degrees `4k, 4k+1`. `a₂ − b₁ = 1`. | as stated | none |
| 15 | 2.3 cells | `HP²` | `3, 10, 13, 20`; gaps 3, 7, 3. `b₁ = 4d + 2 = 10`. | as stated | none |
| 16 | 2.5 total degrees | `d = 2` | `E_(2,4) → E_(0,5)`: 6 → 5. `E_(4,1) → E_(0,4)`: 5 → 4. `E_(4d,3) → E_(0,4d+2)`: `4d+3 → 4d+2`. | as stated | none |
| 17 | 2.6 factors | `CPᵈ` fibre `S¹ → S¹`; `HPᵈ` fibre `S² × S¹ → S³` | `CPᵈ`: degree `±1`, giving `±g`. `HPᵈ`: involution degree `(−1)(−1) = +1`, so degree 2, giving `±2g` (line 5272). | as stated; source error at line 5236 | none |
| 18 | 1.4 degrees | `n = 1..4` | `τ_u`: `1 + (−1)ⁿ` = 0, 2, 0, 2. Rotation family `1 + (−1)^(n−1)` = 2, 0, 2, 0. | as stated | none |
| 19 | 1.0 product criterion (Lean) | `X = pt`; `ℝ/ℤ₊ × ℚ` | `X = pt`: `Y` weakly locally compact T2, hence compactly generated (Mathlib line 355). `ℚ` is not locally compact; Munkres §22 Example 7 shows it fails there. | hypotheses right | none |
| 20 | 1.0 coreflection (Lean) | universes `u`, `w` | Not at the pins. The probe fails. `GeneratedByTopCat.adj` is at `Convenient/Category.lean` line 297. | as stated | none |
| 21 | 1.0 colimit Check | `q_r ∈ S^∞` | `{q_r} ∩ S^s = {q₁, …, q_s}`, which is finite, so the set is closed and discrete, while its norm limit is `e₀`. | as stated | none |
| 22 | 1.3 dimensions | `V_(3,2)`; `U(2)/U(0)` | `3 − 0 = 3 = 2·3 − 3`. `4 − 0 = 4 = 4·2 − 4`. | as stated | none |
| 23 | 1.3 right lines | `v = (1, j)`, `λ = i` | `vλ = (i, −k)`. The only left multiple with first entry `i` is `(i, k)`. | right quotient needed | none |
| 24 | 3.3 sign | `σ = q₁dq₂` on `T*ℝ²` | `Ψ′*λ = p₁dq₁ + (p₂ − q₁)dq₂`. `−d` of it is `ω + dq₁∧dq₂`. Tau Ceti `τ_α*ω = ω − π*dα` at `α = −σ`. | consistent | none |
| 25 | 4.2a range (Lean) | `(n, i) = (2,1), (3,3), (4,3), (1,0)` | `ℤ → ℤ/2` is onto, not injective; bijective needs `3 ≤ 2`. `ℤ → ℤ²` is not onto; surjective needs `4 ≤ 3`. `ℤ² → ℤ` is onto. `pt → pt`. | sharp | none |
| 26 | Bott, finite rank (Lean) | `j = 0, m = 11`; `j = 2, m = 13` | `π₉(SO) = ℤ/2 = π₁`. `π₁₁ = ℤ = π₃`. `m ≥ (j+9) + 2`. | as stated | none |
| 27 | Stable values (Lean) | `j = 0` (`i = 1`), `m = 3`; `j = 1` (`i = 2`), `m = 4`; `j = 2` (`i = 3`), `m = 5` | `π₁(SO(3)) = ℤ/2`, also Tau Ceti line 237. `π₂(SO(4)) = 0`. `π₃(SO(5)) = ℤ`. | as stated | none |
| 28 | Low-rank values (Lean) | `n = 3, 5, 7, 9, 11, 13, 15` | `0, ℤ/2, 0, (ℤ/2)², ℤ/2, ℤ/2, ℤ/2`. By the formula `π_(n−1)(O) ⊕ ℤ/2` at `n ≠ 3, 7`: `π₄, π₁₀, π₁₂, π₁₄(O) = 0` and `π₈(O) = ℤ/2`. | as stated | none |
| 29 | Splitting (Lean) | `k = 14` (`n = 17`); `k = 16`; `n = 7` | `π₁₆(O) ⊕ ℤ/2 = (ℤ/2)²`. `π₁₈(O) ⊕ ℤ/2 = ℤ/2`. At `n = 7` the formula gives `ℤ/2`, but `π₆(SO(7)) = 0`; `14 ≤ k` excludes it. | as stated | none |
| 30 | Lemma 6.35 (Lean) | `k = 0, 4` | `π₂(SO(3)) = 0`, `π₆(SO(7)) = 0`. `Odd (k+3)` admits only even `k`. | true | none |
| 31 | 4.2b energies | `k = 0`, `n = 16` | `π²·tr(JᵀJ) = 16π²`. One `±3i` pair: `π²(14 + 18) = π²(n + 16)`. | as stated | none |
| 32 | 4.2c bounds | `k = 0, m = 1`; `k = 2, m = 1` | `λ₀ = 16/2 − 1 = 7`, eigenvalue `(3+1)²/4 = 4`, so `t = 1/2`. `(4 − \|c\|)/4 = 0` at `\|c\| = 4`. | as stated | none |
| 33 | Theorem G (Lean) | `k = 2, 3, 4`; `d = 0`; `k = n` | `ℓ = 2, 2, 6`, so `m = 1, 1, 5`; Lemma 7.7 is applied at `d = 1` (line 5536). `T⁶ ⊔ S²×S⁴` with `S = ∅` fails without `hd`. At `k = n`, `Y = pt` and 4.2–4.3 give the conclusion. | true | none |
| 34 | 4.3 double cover (R03) | `S³ → Spin(3) → SO(3)` | The covering composite elaborates. `π₂(sphere(0 : ℍ) 1)` is a subsingleton (`Nat.card (Fin 2) = 2 < 3`). | as stated, citation missing | R03 |
| 35 | 4.4 `ℝP²` | `diag(A, −1)`, `det A = −1` | The lift is `diag(−A, 1)σ̃`, with `det(−A) = det A = −1`, so it lies in the degree `−1` component. | as stated | none |
| 36 | 4.5 metric change | dilation `λ` | `c°(λW) = λ c°(W)` (`contractibleHZCapacity_smul`, `_image`). | sound | none |

### Citations and ownership

- **Tau Ceti names.** All 47 Tau Ceti names in the From Tau Ceti contract (README lines 221–353)
  have a declaration at `2fd255d`. Each one I opened is in the file the README gives, for example: `pathLoopSpaceMulEquiv` (`LoopSpace.lean` 321), `realCliffordForm`
  (`RealForm/Basic.lean` 113), `continuous_eval_const` (`Diffeomorphism/Topology.lean` 111),
  `tangentRange` (`NormalSpace/Basic.lean` 44).
- **Mathlib names.** `existsUnique_continuousMap_lifts` (`Homotopy/Lifting.lean` 489),
  `continuous_lift_prod_left` (`CompactOpen.lean` 587), `curryEquiv` and `ev` (`HomSpace.lean` 96 and
  120), and both compact-coherence instances (lines 365 and 370).
- **Roadmap citations.** On main:
  - GeneralizedCohomology G2.10 (line 533), G4.0b (item text, line 1082), G5 item 2 (line 1523);
  - ComplexKahlerGeometry K7.1 (line 1407);
  - SmoothBundlesConnections B1.4, B2.2, B2.5, B6.2, B6.3 (lines 421, 605, 802, 1668, 1716);
  - RiemannianGeometry R1–R3 (lines 186, 322, 369);
  - MorseTheory M5 (line 857);
  - GeometricTopology Layers 1 and 3 (lines 783, 1429);
  - LieGroups Layer 2 (line 356);
  - AlgebraicTopology Stage 4 item 5 (`cofibrationTowerHomotopyEquivalence`, line 683), Stage 6
    item 5 (line 1560), Stage 8 items 5, 7 and 11a (lines 1700, 1811, 1949).

  At the open heads:
  - TangentialBordism #942 B5.1, B5.5 and B6.3 (lines 1510, 1863, 2957);
  - GeneralAlgebraicKTheoryPartII #1742 §4.30b (line 1212).
- **`overlaps.md`.** Its "only an open revision defines GeneralizedCohomology G4.0b" is a false
  positive: main defines G4.0b in item text at line 1082.
- **The convenient category (1.0).** This roadmap is its owner, for these reasons:
  - Main's AlgebraicTopology gives the coreflection to HomotopySpheres §3A.1 (its lines 115–119),
    which is on the never-cite list.
  - AlgebraicTopology #1652 (`c204943`) claims it in its §4.8 (lines 1795–1806). That pull request
    is a revision of a roadmap on main by another author, so this roadmap may not consume it, and
    the notion stays here.
  - The fully qualified names differ by namespace.
  - Once #1652 merges, the overlap can be settled by citing AlgebraicTopology §4.8 from here.
- **Real Bott periodicity (4.2a–4.2c).**
  - #1807 (`9d475e2`, draft) has TopologicalKTheory consume this roadmap's 4.2a–4.2c (its lines
    196 and 1676). TopologicalKTheory is on main, so that is an upward edge in #1807.
  - This README's Downstream section ("TopologicalKTheory consumes nothing from this roadmap")
    states the rule-consistent direction.
- **Other open pull requests.** No other open pull request changes this roadmap.
  - #963 (DGFloer) drops no id cited here.

## Not verifiable

None of these texts is in the sources cache, and no legal open copy was fetched. The values that
depend on them were recomputed in the table instead:

- Ziller, *The free loop space of globally symmetric spaces* (Theorems 3 and 8). The source quotes
  Theorem 3's index at line 5285.
- Milnor, *Morse Theory* §§22–24.
- Bott 1959.
- Steenrod.
- Milnor–Stasheff.
- Pontryagin, Chapter II.
- Thom 1954.
- BDHO, *Morse homology with DG coefficients*.
- [Jap87], Tables 6.VII–6.VIII.

## Source issues

- **Error** in bdho-cotangent at proof of Lemma 6.35, printed p. 117: the source says `π₈(SO(9))` is cyclic of order four; it should be `(ℤ/2)²`, the stabilization to `π₈(SO) = ℤ/2` being split with kernel `ℤ/2` (css-derivative, proof of Lemma 2.2); affects nothing.
- **Error** in bdho-cotangent at proof of Proposition 6.38, printed p. 120: the source says the `CPⁿ` class is up to sign twice the first critical manifold's class; it should be a generator, one frame `(v, Iv)` per direction (Remark 6.19 at `n = 1`); affects nothing.
- **Misprint** in bdho-cotangent at second proof of Proposition 6.34, printed p. 118: the source concludes with Proposition 6.29; it should cite Proposition 6.33, since the proof shows only that `Sⁿ` is 2-covered; affects the proof.
- **Misprint** in bdho-cotangent at proof of Proposition 6.23, printed p. 113: the source describes the odd-case fibre as an `(n−2)`-sphere of unit tangent vectors at `p` orthogonal to `u(p)`, `v(p)`; it should be Example 6.20's equator of sphere points; affects the proof.
- **Gap** in bdho-cotangent at Lemma 7.7, printed p. 126: the source states the lemma for `d ≥ 2`, yet p. 127 applies it with `d = 1` when `k = 2, 3`; it should be stated for `d ≥ 1`, which its proof covers; affects the proof.
- **Error** in bdho-cotangent at §7 before Theorem 7.1, printed p. 123: the source says `ℓ`-connectivity of `Y` forces `n ≥ 3k − 1` or `n ≥ 2k`; it should exclude `k = n`, where `Y` is a point and every hypothesis holds; affects nothing.
- **Gap** in bdho-cotangent at Definition 6.14 and proof of Proposition 6.15, printed p. 106: the source orients `Σ_p` freely and leaves `Σ`'s orientability unstated; it should require `Σ` orientable with the induced fibre orientation (Remark 2.10), which matters for disconnected fibres; affects the proof.
- **Gap** in bdho-cotangent at Proposition 6.13, printed p. 106: the source allows any closed oriented `N`; it should require `N` connected, Definition 6.11 applying only to connected manifolds; affects a stated result.
- **Gap** in bdho-cotangent at Proposition 6.36, printed p. 119: the source concludes abundance for every closed positive-dimensional `H`; it should treat nonorientable `G/H` separately, Definition 6.11 being stated for oriented manifolds; affects a stated result.
- **Gap** in bdho-cotangent at Theorem I(ii), printed p. 11: the source says non-`K(π,1)` manifolds covered in the sense of 6.26 and 6.32 are abundant; it should add Proposition 6.33's condition for `ℓ`-covering; affects a stated result.
- **Misprint** in eschenburg-hanke-bott at proof of Theorem 4, printed p. 9: the source calls each minimal invariant subspace an irreducible `Cl_k`-module; it should be a `Cl_(k+1)`-module, since `J_(k+1) = J_kJ′` also acts; affects nothing.
- **Misprint** in eschenburg-hanke-bott at proof of Theorem 4, Case 2, printed p. 10: the source derives `p + q ≥ r` from `|a_j| ≥ 0`; it should be `|a_j| ≥ 1`, every `a_j` being an odd integer; affects nothing.
- **Misprint** in eschenburg-hanke-bott at §1, table (2), printed p. 5: the source lists the first centriole of the `SO_(4n)` chain as `SO_(4n)/U_(4n)`; it should be `SO_(4n)/U_(2n)`; affects nothing.
