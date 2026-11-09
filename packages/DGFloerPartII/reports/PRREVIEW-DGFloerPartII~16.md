# Review of DGFloerPartII (pull request #1799 at ba8a414)

**Verdict:** needs changes

This is a full review of the folder at `ba8a414`, the head the previous review read. The folder,
the description and the files outside the folder are unchanged since then. Main moved from
`a94a93cf` to `1bea8354`, and no supplier roadmap on main changed in between.

Four findings:

- **R01 (P2)** carries the previous review's ownership finding.
- **R02 (P3)** carries the stale description, with two more stale phrases.
- **R03 (P3)** and **R04 (P3)** are new.

The gate passes against the moved order, with the build. Ordering and description are R01–R02.

## R01 (P2) — Not repaired: main's DGFloer still owns Theorem B, §§6.3–6.4 and §7, and the description does not put DGFloer #1798 first

**Location.**

- `TauCetiRoadmap/DGFloerPartII/README.md` lines 41–43: "The base roadmap, cited as **DGFloer** by
  layer and item, owns every other numbered statement of the source".
- The description's merge-order paragraph ends "#1742 (GeneralAlgebraicKTheoryPartII) → **this
  pull request** (#1799)". It does not mention #1798.

**Claim.** This roadmap is the single owner of the following:

- Theorem B;
- the numbered statements of §§6.3–6.4 and §7;
- their homogeneous carriers, explicit degrees and projective loop-space computations.

**Witness.**

- On main (`1bea8354`), `TauCetiRoadmap/DGFloer/README.md` still holds:
  - Layer 1 items 7–8 (lines 834, 841);
  - Layer 5 item 7 (line 1053);
  - Layer 10 item 5, "Theorems A, B, C … (Theorems 5.10, 5.14, 5.15)" (line 1562);
  - Layer 11, "manifolds abundant with 2-spheres, and knotted hypersurfaces" (line 1577).
- Only #1798 (`8019db8`) hands this material over, at its lines 50–54 and 4281–4283.

**Repair.** The README needs no change. Add this to the description's merge-order paragraph:

> #1798 (DGFloer) merges before this pull request or together with it. It moves the source's
> Theorem B, §§6.3–6.4 and §7, with the homogeneous carriers, explicit degree computations and
> projective loop-space computations they rest on, out of DGFloer's Layers 1, 5, 10 and 11 and
> into this roadmap. Every DGFloer id this README cites resolves on main and at #1798, through
> #1798's numbering note (its line 150).

**Tested.** This README's "Layer 11 … finite covering `T × K → G`" (line 89) is #1798's Layer 11,
"the finite cover of a compact connected Lie group" (its line 4127). Its "Layer 4 item 5 (the
base's §4.1)" is #1798's §4.1 (its line 1590 and numbering note). #1798 also names its Layer 4
item 5 as its Layer 4 item 1.

## R02 (P3) — Not repaired: the description is stale

**Location.** The description says:

- "HomotopySpheres' James construction and Bott periodicity";
- "compares the base's raw mapping-space carriers with HomotopySpheres' convenient ones";
- "its boundaries vanishing by a Hopf-fibration rank count rather than degree gaps";
- "TangentialBordism's compact-image embedding";
- "`Suggested.lean` states the rotation family at a fixed pole".

The second and third phrases are new to this review.

**Witness.**

- The folder has 0 occurrences of "HomotopySpheres". 1.0 builds the convenient carriers.
- 2.3 (README lines 977–979) uses the degree gaps for `ΩHPᵈ`.
- 3.1 uses TangentialBordism B5 and B6.3 (README lines 1118–1119).
- `Suggested.lean` has 0 occurrences of "rotation".

**Repair.** Make six edits to the description:

- **Summary.** Replace "HomotopySpheres' James construction and Bott periodicity" with
  "GeneralAlgebraicKTheoryPartII's James construction and Bott–Samelson theorem; real Bott
  periodicity is proved here (4.2a–4.2c)".
- **Approach.** Replace "its boundaries vanishing by a Hopf-fibration rank count rather than degree
  gaps" with "the boundaries for `ΩCPᵈ` vanishing by a Hopf-fibration rank count rather than
  degree gaps, and those for `ΩHPᵈ` by the degree gaps once the Thom model is built".
- **Layer 1 sentence.** Replace "with HomotopySpheres' convenient ones" with "with the convenient
  carriers of 1.0, built here on Mathlib's `CompactlyGenerated`".
- **Layer 3 sentence.** Replace "TangentialBordism's compact-image embedding" with
  "TangentialBordism B5's structured Pontryagin–Thom and B6.3's rational oriented-bordism
  surjection".
- **Layer 4 sentence.** After "Layer 4 proves", insert "real Bott periodicity of the stable
  orthogonal group by the Clifford chain (4.2a–4.2c),".
- **Last sentence.** Replace it with:

  > `Suggested.lean` states the compact-generation coreflection and the product criterion of
  > 1.0; Theorem B; the finiteness of the capacity in Theorem I for spheres, for manifolds covered
  > by diffeomorphisms, for non-aspherical compact Lie groups, and for `CPᵈ` and `HPᵈ`; the
  > finite-to-stable range and real Bott periodicity of `π_i(SO(n))`; Lemma 6.35's seven
  > low-rank values, its splitting for odd `n ≥ 17` and its torsion for every odd `n`; and
  > Theorem G.

**Tested.** Every name and statement in the replacement is at `Suggested.lean` lines 94, 103, 120,
141–224, 256–291, 297–338 and 354.

## R03 (P3) — `Suggested.lean`'s module docstring names two missing carriers that the pins have

**Location.** `TauCetiRoadmap/DGFloerPartII/Suggested.lean` makes two claims:

- Lines 66–68: "their hypotheses are a map of fibre bundles into the evaluation fibration
  `Map(S², Q) → Q` … and neither library has that fibration".
- Lines 73–75: "The Clifford chain and the index bounds of README 4.2b–4.2c need the energy on its
  path spaces, which neither library has".

**Claim.** The pins lack the evaluation fibration and the energy of paths.

**Witness.** Pinned Tau Ceti has all four:

- `TauCeti.mappingSpaceEval` (`TauCeti/Topology/MappingSpace/Evaluation.lean` line 48), the
  evaluation `Map(B, X) → X` with the based maps as fibre;
- `TauCeti.HasHomotopyExtensionProperty.isHurewiczFibration_restrict` (`Fibration.lean` line 41);
- `TauCeti.Manifold.energy` (`Geometry/Manifold/Riemannian/Energy.lean` line 64);
- `TauCeti.Manifold.IsConjugateOn` (`Riemannian/Jacobi/Conjugate.lean` line 80).

**Repair.** Make two replacements in the docstring.

- **Lines 66–68.** From "their hypotheses are" to "that fibration.", replace the text with:

  > their hypotheses are a smooth fibre bundle over `Q` whose fibre is a closed oriented manifold,
  > mapped over `Q` into `Map(S², Q)` with a nonzero fibre class, or abundance itself. Tau Ceti has
  > the evaluation `TauCeti.mappingSpaceEval` and the restriction fibration
  > `TauCeti.HasHomotopyExtensionProperty.isHurewiczFibration_restrict`. Mathlib proves
  > `IsManifold` for a bundle total space only for vector bundles, so neither such a fibre bundle
  > nor the unit-sphere bundle of Proposition 6.23 has a carrier.

- **Lines 73–75.** Replace "need the energy on its path spaces, which neither library has" with:

  > need a Riemannian manifold structure on the members `Ω_k(n)` of the chain. These are subsets of
  > `O(n)` that are not subgroups, so Tau Ceti's slice charts for closed subgroups do not apply.
  > Tau Ceti's `TauCeti.Manifold.energy` and `TauCeti.Manifold.IsConjugateOn` apply once that
  > structure exists.

**Tested.** I checked each claim of the new wording at the pins:

- Mathlib's `IsManifold` instance on `TotalSpace F E` (`Mathlib/Geometry/Manifold/VectorBundle/Basic.lean`
  line 468) assumes a vector bundle.
- Neither library has a `ChartedSpace`, `IsManifold` or `LieGroup` instance on
  `Matrix.orthogonalGroup`.
- `Subgroup.isManifold_chartedSpaceOfIsSliceChart` (`TauCeti/Geometry/Lie/Subgroup/Manifold.lean`)
  is stated for subgroups.

The docstring's other two claims hold at the pins. No shriek or Umkehr map exists. No smooth
structure on `G ⧸ H` exists beyond discrete normal `H` (`TauCeti/Geometry/Manifold/Algebra/LieGroup.lean`).

## R04 (P3) — 4.2: the odd-case construction introduces `q` and then uses `x`

**Location.** `TauCetiRoadmap/DGFloerPartII/README.md` lines 1285–1289: "For `q` in the fibre, put
`V_x = u(x)^⊥` in the ambient rank-`n+1` Euclidean bundle and take the unit sphere in
`V_x ∩ v(x)^⊥` … the equator `S^(n−2)` through `x`".

**Claim.** The construction is stated at a point that the sentence introduces.

**Witness.** The sentence introduces `q`, which is never used. Every later symbol (`V_x`, `u(x)`,
`v(x)`, "through `x`") refers to the undefined `x`. Line 1281 uses `q ∈ Q` for the even case.

**Repair.** In line 1285, replace "For `q` in the fibre, put `V_x = u(x)^⊥` in the ambient
rank-`n+1` Euclidean bundle" with:

> For `x ∈ Q`, a unit vector in the fibre of the ambient rank-`n+1` Euclidean bundle, put
> `V_x = u(x)^⊥` in that fibre

**Tested.** `V_x ∩ v(x)^⊥` has dimension `(n + 1) − 2 = n − 1` and contains `x`, because `u(x)`
and `v(x)` are tangent to the sphere fibre at `x`. Its unit sphere is the stated `S^(n−2)`, which
is Example 6.20's equator (`bdho-cotangent` lines 4807–4809).

## Previous findings

| Previous finding | Status at this head | Here |
| --- | --- | --- |
| R01 (P2): main's DGFloer still owns Theorem B etc.; #1798 not ordered | Not repaired. The description still ends "#1742 (GeneralAlgebraicKTheoryPartII) → **this pull request** (#1799)". Main's DGFloer lines 1562, 1567 and 1577 are unchanged. | R01 |
| R02 (P3): TopologicalKTheory #1807 consumes 4.2a–4.2b in T1.6 | No longer applies. At #1807's head (`edec751`), T7 starts at line 1409. Its citations of this roadmap are lines 196 (supplier list), 1492, 1539, 1555, 1575, 1587 and 1626 (all T7), and 1676–1678, which say "T1.5–T1.6 consume nothing from DGFloerPartII". This README's Downstream bullet (lines 1935–1941) agrees. | — |
| R03 (P3): stale description | Not repaired. The description is unchanged, and two more stale phrases were found. | R02 |
| R04 (P3): 4.3 splitting Check | Repaired at the previous head and still holds. README lines 1654–1663 are unchanged. | — |

The board has no repair report for `ba8a414`. No finding was marked "not actionable in this
package".

## Verified sound

### Gate, dependency check and build

The worker's gate command (configured order) gives one dependency failure:

    gate DGFloerPartII: … depcheck=1 … FAIL
      depcheck: UPWARD: DGFloerPartII (#46) -> GeneralAlgebraicKTheoryPartII (#335) at README lines [363, 677, 888, 1305, 1913]

This is the "moved" case, not a defect. The moved order lists GeneralAlgebraicKTheoryPartII at line
334, this roadmap at line 335 and TangentialBordism at line 14.

With `--order merge-order-moved.txt --build`:

    gate DGFloerPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK

The brief's dependency check:

    depcheck: 235 roadmaps, 2261 edges, 0 problem(s)

Other checks:

- `lake env lean TauCetiRoadmap/DGFloerPartII/Suggested.lean` exits 0 with exactly 24 messages, all
  "declaration uses `sorry`". They are at lines 94, 103, 120, 141, 156, 174, 204, 217, 256, 263,
  270, 276, 283, 289, 297, 300, 303, 307, 311, 315, 319, 328, 337 and 354.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`.

### Signatures and padding

- **Signatures.** I elaborated `#check @name` for all 28 declarations in one scratch file, after
  the targeted build. Every binder the README states is present, including:
  - `ConnectedSpace Q` and `T2Space Q` (Theorem B);
  - `T2Space M`, `ConnectedSpace M`, `hℓ` and `hM` (covered manifolds);
  - `LieGroup` with `CompactSpace` and `ConnectedSpace` (Lie groups);
  - `hk`, `hdim`, `hab`, `htr`, `hY`, `htriv`, `hd` and `hφU` (Theorem G);
  - `Odd (k + 3)` with `14 ≤ k` (splitting).

  Nothing changed. The worker's `signatures.md` lists two phantom entries, "of" and "on". These are
  docstring words its parser read as declarations; they are not declarations.
- **One-tactic probe.** I replaced every `sorry` with `first | infer_instance | rfl | (simp; done) |
  exact?` in a scratch copy. All 24 statements fail with "`exact?` could not close the goal". There
  is no padding.
- **Statability.** `compactlyGeneratedToTop` has no `IsLeftAdjoint` instance at the pin.
  `Mathlib/Condensed/TopCatAdjunction.lean`'s `compactlyGeneratedAdjunction` is for universes
  `(u, u+1)` and another functor.

### Headline theorems

- **Stated:**
  - Theorem B (5.14);
  - Theorem I's capacity form for spheres, for `ℓ`-covered manifolds, for non-aspherical compact
    Lie groups, and for `CPᵈ` and `HPᵈ`;
  - Theorem G;
  - Lemma 6.35 (values, splitting, torsion);
  - the finite-to-stable range and finite-rank real Bott periodicity;
  - 1.0's coreflection and product criterion.
- **Named as not statable:**
  - Theorem H and abundance (no shriek map; checked);
  - fibered families, sphere bundles and products (reason corrected in R03);
  - Proposition 6.36 (no `G ⧸ H` manifold; checked);
  - stable `O` (no carrier; checked);
  - the Clifford-chain index bounds (reason corrected in R03).
- **Statable but absent:** none. A fibered-family statement would need a smooth bundle with
  closed-manifold fibre, which the pins lack.

### Seeded source sample

Printed pages of `bdho-cotangent` are read from the page footers.

| Target | Locator checked | Result |
| --- | --- | --- |
| 1.2 | `bdho-cotangent` 4685–4687 (Prop 6.18, p. 108); Hatcher Thm 4J.1, p. 471 (author's page copy); GeneralAlgebraicKTheoryPartII §4.30b (#1742 `ca44359`, line 1212) | as stated |
| 1.3 | Hatcher not needed; Milnor–Stasheff and Steenrod not verifiable; Tau Ceti `stiefel`, `ComplexProjectiveSpace`, `QuaternionicProjectiveSpace` | dimensions and right lines recomputed below |
| 1.4 | 4720–4773 and footnote 4802–4803 (Prop 6.17 proof, pp. 109–110); 5122–5135 (second proof of 6.34, p. 118); Remark 6.19 at 4792–4796 | as stated |
| 2.1 | 5283–5288 (Prop 6.39 proof, p. 121: `C_k ≅ T¹_pHPⁿ`, dim `4n−1`, index `2(k−1)(2n+1)+3`, Ziller Thms 3 and 8) | indices recomputed below |
| 2.2 | 5218–5241 (Prop 6.38, p. 120); Ziller not verifiable | rank count recomputed; the source's "twice" is a source issue |
| 2.3 | 5283–5311 | gaps recomputed |
| 3.1 | 4273–4279 (Thm 5.14 proof, p. 98: Thom, `Nα = φ_*[S]`, `d = Nb`) | as stated; Thom 1954 not verifiable |
| 3.2 | 4267–4272 (Thm 5.14, p. 98), 4140–4150 (Thm 5.10, pp. 94–95), 243–246 (Thm B, p. 7), 4285–4288; Hatcher Thm 3.26, p. 236 | as stated, connectedness added with a Check |
| 3.3 | 265–292 (Cor D and proof, pp. 7–8); Tau Ceti translation lemma | sign recomputed |
| 4.1 | 4517–4546 (Def 6.11, Thm 6.12, p. 104); 415–426 (Def 1.7, Thm H, pp. 10–11); 4608–4616 (Prop 6.13, p. 106) | as stated |
| 4.2a | Steenrod not verifiable; Hatcher §4.2 by standard fibration sequences; Tau Ceti sphere lemmas | range recomputed |
| 4.2c | `eschenburg-hanke-bott` 264 (eq. (3)), 284–288 (Thm 3: modules `ℝ, ℂ, ℍ, ℍ, ℍ², ℂ⁴, 𝕆, 𝕆, 𝕆²`, two for `k ≡ 3 mod 4`), 299–306 (Thm 4); Milnor and Bott not verifiable | as stated |
| 4.3 | 5073–5094 (Lem 6.35, p. 117), 5095–5121, 5122–5139; 5037 (Prop 6.31), 5051–5062 (Def 6.32, Prop 6.33, p. 116); `css-derivative` 222, 249 | as stated, `π₈(SO(9))` corrected |
| 4.5 | 430–445 (Thm I, pp. 10–11), 5218, 5247 | as stated without `CaP²`; Thm I(ii) is a source issue |
| 4.6 | 5354–5372 (setting, Thm 7.1, pp. 123–124), 5382–5396 (Ex 7.4), 5404–5423 (Prop 7.5, kernel bound), 5429–5431 (degrees `3k−3`, `2k−2`), 5467–5501 (Lem 7.6), 5503–5539 (Lem 7.7 and its application, pp. 126–127) | as stated; `d ≥ 2` and the `k = n` bound are source issues |

### Adversarial table

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Theorem B (Lean) | `T^r`; `ℝP³`; `E = 0`; `c < min F`; `S² ⊔ T²` | `π₂(T^r) = 0`, `π_(ℓ+3)(T^r) = 0`: `hQ` false. `π₃(ℝP³) = ℤ`, `ℓ = 0`: `hQ` true. Point: all `π` trivial, `hQ` false. `U = ∅`: `H_n = 0`, `hU` false. `S² ⊔ T²`, `U = D*T²`: `H₂(U) = ℤ → ℤ²` nonzero but no contractible orbit, excluded by `ConnectedSpace` | true | none |
| Theorem B vs 5.14 | closed connected nonorientable `Q` | Hatcher 3.26: `H_n(Q; ℤ) = 0`, so `hU` is false; 5.14's orientability is implied | same generality | none |
| Theorem B route | `x ∈ π_ℓ` of infinite order, `d = Nb` | `d^m x ≠ 0` for every `m`, so `π_ℓ` is not `d^m`-torsion: condition 2 of Thm 5.10 (4146–4147) | sound | none |
| Theorem G (Lean) | `k = 2, 3, 4`; `k = n`; `T⁶ ⊔ (S² × S⁴)`, `S = ∅` | `if Even k then 2k−2 else k−1` gives `2, 2, 6`; `k ≥ 2` avoids ℕ-subtraction junk. `k = n`: `Y` is a point, the hypotheses hold, and the conclusion comes from `Sⁿ` abundant. `d = 0`: flat levels of `T*T⁶` carry only noncontractible orbits | `hd` needed; true | none |
| Lemma 7.7 at `m = 1` | `Y` 2-connected, `T⁸ # (S³ × S⁵)` | `E²_(1,0) = E²_(2,0) = 0`; nothing reaches `E_(0,1)`; `H₁(Ω²Q) ≅ H₁(total)` | holds for `m ≥ 1` | none |
| Sphere capacity (Lean) | `n = 0, 1, 2` | `S⁰`: `F` = 0 at one point and `a` at the other is admissible for every `a > 0` (`IsHZNormalized`, open max set), so the capacity is `∞`. `S¹ = T¹`: `∞`. `n = 2`: Prop 6.17 | `2 ≤ n` needed | none |
| Lie group capacity (Lean) | `T^r`; point; `SU(2)` | `IsAspherical T^r 1` true, so `hG` false. Point is aspherical. `π₃(SU(2)) = ℤ`, so `hG` true | true | none |
| Covered capacity (Lean) | `ℓ = 0`; `T^r`, `ℓ = 1`; `S³`, `ℓ = 2` | `hℓ` excludes `A = 0`. `T^r`: `hM` false. `S³`: `k = 1`, `π₂ = 0`, `x ∈ π₃ = ℤ`, `x^2 = 2x ≠ 0` | true | none |
| CP/HP capacity at `d = 0` (Lean) | `CP⁰`, `HP⁰` | `F` must vanish on a nonempty open subset of `W = {pt}`, so `F = 0` and the capacity is `0 < ⊤` | true | none |
| 4.2a range (Lean) | `(n, i) = (2,0), (2,1), (3,3), (4,3), (1,0)` | `(2,0)`: both connected. `(2,1)`: `ℤ → ℤ/2` onto, not injective; excluded by `i+2 ≤ n`. `(3,3)`: `ℤ → ℤ²` not onto; excluded. `(4,3)`: `ℤ² → ℤ` onto. `(1,0)`: point onto `π₀(SO(2))` | bounds sharp | none |
| Bott, stable values (Lean) | `(j, m) = (0,11), (1,4), (7,10), (2,5), (6,9)` | `π₉(SO(11)) = π₁(SO(11)) = ℤ/2`; `π₂(SO(4)) = 0`; `π₈(SO(10)) = ℤ/2`; `π₃(SO(5)) = ℤ`; `π₇(SO(9)) = ℤ` | as stated | none |
| Lemma 6.35 values (Lean) | `n = 3, …, 15` odd; `n = 4` | `0, ℤ/2, 0, (ℤ/2)², ℤ/2, ℤ/2, ℤ/2`; `π₃(SO(4)) = ℤ²` is not torsion and is excluded by `Odd (k+3)` | as stated | none |
| Splitting (Lean) | `n = 17, 19, 21, 23, 25` | stable `π_(n−1)(SO(n+1))` with `n−1 ≡ 0, 2, 4, 6, 0`: `ℤ/2, 0, 0, 0, ℤ/2`; Stiefel `ℤ/2` (Euler number 2); totals `(ℤ/2)², ℤ/2, ℤ/2, ℤ/2, (ℤ/2)²`; `n−1 ≤ (n+1)−2` stable | true | none |
| `π₈(SO(9))` | `css-derivative` 222, 249 | split stabilization, kernel `ℤ/2`, so `(ℤ/2)²`. `π₈(SO(8)) = (ℤ/2)³` is onto, since the finite group's image in `π₈(S⁸) = ℤ` is 0 | as stated | none |
| 1.0 coreflection, product (Lean) | metrizable `Y`; `ℝ/ℤ₊ × ℚ`; `ℝ/ℤ₊ × [0,1]`; `X = pt` | `kY = Y`, `k(kY) = kY`; the first product is not CG; the second is CG; at `X = pt` a locally compact Hausdorff space is CG (Mathlib instance); Strickland 2.6 (`strickland-cgwh` 122), Rezk 7.3 (`rezk-cg-spaces` 313) | true | none |
| 1.2 ring | `n = 2, 3`; `W = S⁰` | `H_k(ΩS²) = ℤ`, `x² ≠ 0`; graded commutativity would force `2x² = 0`; `n = 3`: degrees `0, 2, 4, …`; `J(S⁰) = ℕ` is not `ΩS¹` | as stated | none |
| 1.3 dimensions, right lines | `V_(n,2)`, `U(n)/U(n−2)`, `CPᵈ`, `HPᵈ`; `v = (1, j)`, `λ = i` | `n(n−1)/2 − (n−2)(n−3)/2 = 2n−3`; `n² − (n−2)² = 4n−4`; `(d+1)² − d² − 1 = 2d`; `(d+1)(2d+3) − d(2d+1) − 3 = 4d`; `vλ = (i, −k)` against the left multiple `(i, k)` | as stated | none |
| 1.3 scale | `CP¹` at radius `1/2` against `1` | length `π`, curvature `4`, area `π`; at radius `1`: `2π`, `1`, `4π`; energies scale by `4` | as stated | none |
| 1.4 degrees | `n = 1, 2, 3, 4` | rotation family `1 + (−1)^(n−1) = 2, 0, 2, 0`; Stiefel domain `1 + (−1)ⁿ = 0, 2, 0, 2`; `R p = cos θ p + sin θ u`, `R u = cos θ u − sin θ p`, `det R = 1` | as stated | none |
| 2.1 indices | `CPᵈ`, `HPᵈ`; `d = 1` | conjugate times `mπ/2` (multiplicity `1` or `3`) and `mπ` (multiplicity `2d−2` or `4d−4`); `(2k−1) + (k−1)(2d−2) = 2d(k−1)+1`; `3(2k−1) + (k−1)(4d−4) = 2(k−1)(2d+1)+3`; `d = 1`: `2k−1`, `6k−3` | as stated | none |
| 2.2–2.3 cells | `CP²`; `HP¹`, `HP²` | `a_(k+1) − b_k = 1` (CP), so the gaps do not decide; `CP²`: `0, 1, 4, 5, 8, 9` matches `H_*(S¹ × ΩS⁵)`. HP: gap `3`, within-level `4d−1`; `HP²`: `3, 10, 13, 20`; `H_(4d+2) = b₁` | as stated | none |
| 2.6 classes | `CP¹`; `HP¹` | `CP¹`: one component of the frames, `±x²`; full `n = 2` family `±2x²`. `HP¹`: fibre map `S² × S¹ → S³` is the `n = 3` rotation family, degree `2`; equals Prop 6.17's `±2x²` at `n = 4` | as stated | none |
| 3.1 realization | torsion `α`; `α = [Sⁿ]` | `S = ∅`, `0 = Nα`; identity, `N = 1` | as stated | none |
| 3.3 sign | `T*ℝ²`, `σ = q₁dq₂` | `Ψ'^*λ = p₁dq₁ + (p₂ − q₁)dq₂`; `−d` of it is `ω + dq₁∧dq₂`; Tau Ceti `τ_α^*ω = ω − π^*dα` at `α = −σ` | consistent | none |
| 4.1 abundance | point; `T^r`; `M × N` | the point's degree-0 class has zero reduced shriek; `Ω²T^r ≃ pt`; `deg(α × [N]) = deg α + dim N`, shriek `j_!α × 1` | as stated | none |
| 4.2 Serre comparison | twistor `S² → CP³ → S⁴` | `H₂(Ω²S⁴) = π₄(S⁴) = ℤ`; `π₃(CP³) = π₃(S⁷) = 0`, so `H₁(Ω²CP³) = 0` and `d₂ : E_(2,0) → E_(0,1)` is onto | `2n`-connectivity needed | none |
| 4.2 odd case | `V_x ∩ v(x)^⊥` | dimension `n−1`, unit sphere `S^(n−2)` through `x`; the source's tangent reading `x^⊥ ∩ u^⊥ ∩ v^⊥` gives `S^(n−3)` | README right; notation slip | R04 |
| 4.2b–4.2c data | `m = 1`; `k = 0, 1, 3, 4, 5, 7`; `k = 2, 6` | `dim Ω₁ = 64m² − 8m = n²/4 − n/2`; `λ_k = 8m−1, 4m−1, 2m−1, 2m−1, 2m−1, m−1`; `λ₂(c) = (4m − |c|)/4`, `λ₆(c) = (2m − |c|)/4`; `2p − (s+c) = Σ(a_h − 1) + Σ(|a_j| − 1) ≥ 0` | as stated | none |
| 4.2c stable groups | `i = 1, …, 8`; `m = 1` stage of `Ω₃` | `π₀(Ω_i)`: `2, 1, ℤ, 1, 1, 1, ℤ, 2`, giving `ℤ/2, 0, ℤ, 0, 0, 0, ℤ, ℤ/2`; `4p(4−p) = 0, 12, 16, 12, 0`; `dim 𝔰𝔭(4) = 36`, off-diagonal `16` | as stated | none |
| 4.3 range of the splitting | `n = 3, 7` | formula `0 ⊕ ℤ/2` at both; actual `π₂(SO(3)) = 0`, `π₆(SO(7)) = 0` | range `n ≥ 17` right | none |
| 4.3 proofs | `S³` | first proof `ℓ = 1` from the section `S³ → SO(4)`; second `ℓ = 2`; Prop 6.33 applies because `π₃ = ℤ` is not 2-torsion | as stated | none |
| 4.4 `ℝP²` | `diag(A, −1)`, `det A = −1` | action `−A` on `T_[e₃]ℝP²`, `det(−A) = −1`, so `χ = −1`; based lift `diag(−A, 1)σ̃` of degree `−1` | as stated | none |
| 4.5 metric independence | metrics `g`, `g′`, `λ` | `D*_g ⊂ λD*_g′`; both retract onto the zero section; `c°(λW) = λc°(W)` (Tau Ceti `contractibleHZCapacity_smul`, `_image`) | as stated | none |
| Docstring "not statable" claims | evaluation fibration; path energy; `G ⧸ H`; shriek; stable `O` | `TauCeti.mappingSpaceEval` and `TauCeti.Manifold.energy` are present; `G ⧸ H`, shriek and stable `O` are absent; `Matrix.orthogonalGroup` has no charted-space instance | two claims wrong | R03 |

### Citations and ownership

- **Suppliers on main** (unchanged since `a94a93cf`). Each cited section exists and says what is
  claimed:
  - GeneralizedCohomology: G2.10 (line 533), G4.0b (1082), G4.3–4.5 (1224–1253), G5 item 2
    (1523), G5 item 6 (2212).
  - ComplexKahlerGeometry: K7.1–K7.2 (1407, 1444).
  - SmoothBundlesConnections: B1.4, B2.2, B2.5, B6.2, B6.3 (421, 605, 802, 1668, 1716).
  - RiemannianGeometry: R1 (186; Hopf metrics 300–315, bi-invariant 264, `∇R` 191–208); R2
    (322); R3 (369–578).
  - MorseTheory M5 (857). GeometricTopology Layers 1 and 3 (783, 1429).
  - LieGroups Layer 2 (356).
  - AlgebraicTopology: Stage 4.4 (`reducedSuspensionSphereHomeomorph`, 544–580); Stage 4
    `cofibrationTowerHomotopyEquivalence` (683); 8.11a (1949).
- **Open suppliers.**
  - TangentialBordism #942 (`f212a45`): B5.1 (line 1430), B5.5 (1778) and B6.3 (2838, "Homology
    realization", rational SO surjection with geometric preimages).
  - GeneralAlgebraicKTheoryPartII #1742 (`ca44359`): §4.30b (line 1212).
- **Convenient category (1.0).** Main's AlgebraicTopology assigns it to HomotopySpheres §3A.1
  (its lines 115–119), which is on the never-cite list. AlgebraicTopology #1652 (`946a78a`) gives
  it to its §4.8 (line 1571). HomotopySpheres #1287 (`93d7033`, line 156) defers to that §4.8.
  A revision of a roadmap on main is never a dependency, so the notion moves down into 1.0, as
  review 14 settled. The fully qualified names differ by namespace.
- **Real Bott periodicity (4.2a–4.2c).** Main's TopologicalKTheory takes it from HomotopySpheres
  §4B (its lines 1605, 1635 and 1740), which is uncitable, so it moves down here. #1807 repoints
  T7 to this roadmap.
- **Theorem B and §§6.3–7.** Main's DGFloer is the other owner (R01).
- **Who cites this roadmap.** Nothing on main cites it. #1798 and #1807 do, consistently with this
  README.

### Library declarations opened at the pins

**Mathlib:**

- `Topology.IsQuotientMap.continuous_lift_prod_left` (`Topology/CompactOpen.lean` 587, with
  `[LocallyCompactSpace Y]`).
- `TopologicalSpace.generatedBy_eq_coinduced` (`Topology/Convenient/GeneratedBy.lean` 55).
- `Topology.ContinuousMapGeneratedBy.curryEquiv` and `.ev` (`HomSpace.lean` 96 and 120, under
  `∀ i, LocallyCompactSpace (X i)` and `IsGeneratedBy X (X i × X j)`).
- `GeneratedByTopCat.adj` (`Category.lean` 203).
- `to_compactlyCoherentSpace` and `of_compactlyCoherentSpace_of_t2`
  (`CompactlyGeneratedSpace.lean` 365 and 370).
- `FiberBundle.chartedSpace` (`Geometry/Manifold/VectorBundle/Basic.lean` 102).

**Tau Ceti:**

- `IsAspherical` (`EilenbergMacLane/Basic.lean` 59: `PathConnectedSpace` and `π_(n+2)`
  subsingleton).
- `HomotopyGroup.map` (`HomotopyGroup/Map.lean` 45).
- `subsingleton_homotopyGroup_sphere_of_lt` (`Sphere/HomotopyGroup.lean` 66).
- `homotopyGroupSphereAddEquiv` (110, spheres of dimension `n + 2`).
- `MooreLoopSpace.doubleFirstHomologySphereAddEquiv` (135).
- `IsCoveringMap.homotopyGroupPiMulEquiv` (`Covering.lean` 174).
- `pathLoopSpaceMulEquiv` (`LoopSpace.lean` 321).
- `TopCat.exists_subset_range_ι_of_isCompact`, `exists_lift_of_compactSpace` and
  `uCompactlyGeneratedSpace_of_isColimit` (`TopCat/Compact.lean` 88, 133 and 75).
- `isClosedEmbedding_ι_of_isColimit` (`ClosedEmbedding.lean` 158).
- `nonempty_ndrPair_iff` (`NDRPair.lean` 556).
- `realClifford_classification` (`Classification.lean` 339).
- `stiefel` (`Instances/Stiefel.lean` 162).
- `continuousOrthogonalToDiffSphere` (`Diffeomorphism/Sphere.lean` 315).
- `SmoothTwoForm.HasContractibleAlmostExistence` (`AlmostExistence.lean` 167: `∃ ε > 0`, almost
  every regular `c′` near `c`).
- `IsContractibleHZAdmissible` (`HoferZehnder.lean` 179).
- The four declarations of R03.

## Not verifiable

None of these texts is in the roadmap's manifest or the worker's cache under an author or
publisher copy, and this review edits no manifest:

- **Ziller, *The free loop space of globally symmetric spaces*, Theorems 3 and 8.** The indices
  were recomputed by conjugate points instead (table), and match the source's quotation at
  `bdho-cotangent` 5285–5288.
- **Milnor, *Morse Theory*, §§22–24; Bott, *The stable homotopy of the classical groups*.**
  Copies seen in the cache are on third-party course pages and were not used. Eschenburg–Hanke
  §§2–4 was checked instead.
- **Steenrod, *The Topology of Fibre Bundles*, §§7 and 23; Milnor–Stasheff, Chapter 5;
  Pontryagin, Chapter II; Thom 1954, Theorem II.29.** These are paywalled.
- **BDHO, *Morse homology with DG coefficients* (2025).** This is paywalled.
- **[Jap87] Appendix A, Tables 6.VII–6.VIII.** Not held. The values were recomputed from the
  fibrations and `css-derivative`.
- **Munkres, *Topology*, §22, Example 7.** This is paywalled. The `ℝ/ℤ₊ × ℚ` example is standard,
  and the Check only uses that the product is not CG.

Ownership was checked against the open pull requests whose files the brief gives, and against
#1807 through the `roadmaps` tool.

## Source issues

- **Error** in bdho-cotangent at proof of Lemma 6.35, printed p. 117: the source says `π₈(SO(9)) = ℤ/4`; it should be `(ℤ/2)²`, the stabilization to `π₈(SO) = ℤ/2` being split with kernel `ℤ/2` (css-derivative, proof of Lemma 2.2); affects nothing.
- **Error** in bdho-cotangent at proof of Proposition 6.38, printed p. 120: the source says the class `β_*(σ_p)_*[Σ_p]` is up to sign twice the first critical manifold's class; it should be a generator, the fibre circle map having degree `±1` (Remark 6.19 at `d = 1`); affects nothing.
- **Misprint** in bdho-cotangent at proof of Proposition 6.23, printed p. 113: the source says the fibre `Σ_p` consists of unit tangent vectors at `p` orthogonal to `u(p)`, `v(p)`, an `(n−3)`-sphere; it should be the fibre-sphere points orthogonal to them, Example 6.20's `(n−2)`-sphere; affects the proof.
- **Misprint** in bdho-cotangent at second proof of Proposition 6.34, printed p. 118: the source says it concludes with Proposition 6.29; it should be Proposition 6.33, since the proof shows only that `Sⁿ` is 2-covered; affects the proof.
- **Gap** in bdho-cotangent at Lemma 7.7, printed p. 126: the source says the lemma holds for `d ≥ 2`, yet p. 127 applies it with `d = 1` when `k = 2, 3`; it should be stated for `d ≥ 1`, which its proof covers; affects the proof.
- **Error** in bdho-cotangent at §7 before Theorem 7.1, printed p. 123: the source says `ℓ`-connectivity of `Y` forces `n ≥ 3k − 1` or `n ≥ 2k`; it should exclude `k = n`, where `Y` is a point and every hypothesis holds; affects nothing.
- **Gap** in bdho-cotangent at Proposition 6.36, printed p. 119: the source says `G/H` is abundant for every closed positive-dimensional `H`; it should treat nonorientable `G/H` separately, abundance (Definition 6.11) being defined only for oriented manifolds; affects a stated result.
- **Gap** in bdho-cotangent at Theorem I(ii), printed p. 11: the source says non-`K(π,1)` manifolds `ℓ`-covered by diffeomorphisms are abundant; it should add Proposition 6.33's condition that `π₂ ≠ 0` or the first higher group is not `ℓ`-torsion; affects a stated result.
