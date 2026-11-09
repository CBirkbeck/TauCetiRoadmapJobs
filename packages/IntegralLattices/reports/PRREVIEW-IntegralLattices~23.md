# Review of IntegralLattices (pull request #1797 at 40734d4)

**Verdict:** needs changes

This head adopted main's version of the folder (`f2f59c78`) and repaired the previous review's R06–R08 on it. The gate, the build and the dependency check pass for this folder. What is left falls into three groups:

- A large part of what the roadmap still plans as targets is already proved in Tau Ceti at the pin (`2fd255d99`), and the module docstring says two of those headlines cannot be stated at all (R01, R03–R07).
- Open pull request #617 carries its own rewrite of this folder that already cites most of those native results, and the two heads conflict (R02).
- Three Checks or references are wrong (R08–R10).

## R01 (P2) — The docstring says B2 and B3 cannot be stated at the pins; Tau Ceti proves both, and Layer B re-plans them

- **Location.** `Suggested.lean:93–97`: "the quadratic algebra `QuadraticAlgebra ℚ Δ 0` … carries no `NumberField` instance and the order `ℤ[(Δ+√Δ)/2]` is not a `NumberFieldOrder` of it … and no ring class field exists at the pin." Also README B1–B5 (1097–1330), e.g. 1259: "This roadmap proves the composite".
- **Claim.** All three premises are false at the pin, and the headlines are already proved there. Layer B nonetheless frames as targets the norm form, content and discriminant, the order, orientation invariance (B1), both form–ideal bijections and the split class group (B2), composition and the ring class field (B3), `SO(L)` against the norm-one units and the ambiguous-class criterion (B4), and reduction and the class count (B5). §*From Tau Ceti* has no row for `NumberTheory/IntegralLattice/Binary/` or `NumberTheory/BinaryQuadraticForm/`.
- **Witness.**
  - `QuadraticAlgebra.instNumberField` (`NumberTheory/NumberField/QuadraticAlgebra.lean:41`).
  - `QuadraticOrder.numberFieldOrder` (`QuadraticOrder/Field.lean:39`).
  - `ringClassField` and `ringClassArtinEquiv` (`ClassFieldTheory/ClassFields/RingClass/Field.lean:111, 178`).
  - `posDefProperClassEquivPic` (`BinaryQuadraticForm/Ideal/PicEquivalence.lean:55`), `properClassEquivNarrowPic` (`Ideal/Narrow/Equivalence.lean:106`), `posDefProperClassEquivGal` (`Ideal/RingClassField.lean:83`).
- **Repair.**
  1. In `Suggested.lean`, move B2/B3 from "not statable" to the "proved in Tau Ceti" paragraph with these three names.
  2. Add §*From Tau Ceti* rows for the native binary theory:
     - B1: `binaryNormForm`, `binaryContent`, `binaryDiscriminant` (`Binary/NormForm.lean`); `binaryOrder`, `binaryNumberFieldOrder`, `binaryOrderEquivProductOfSq` (`Binary/Order.lean:43, 106, 141`); `binaryProperClass` (`Binary/Orientation.lean:95`).
     - B2/B3: `splitProperClassEquivUnits` (`BinaryQuadraticForm/Split/Composition.lean:133`); `exists_posDefProperClassToPic_mul_posDefProperClassToPic_eq` and `exists_properClassToNarrowPic_mul_properClassToNarrowPic_eq` (`Ideal/Composition.lean:206`, `Ideal/Narrow/Composition.lean:153`).
     - B4: `specialOrthogonalGroupEquivNormOneUnits` (`Binary/NormOne.lean:72`); `index_specialOrthogonalGroup_eq_two_iff_narrowPicClass_sq_eq_one` and `IsPosDef.index_specialOrthogonalGroup_eq_two_iff_picClass_sq_eq_one` (`Binary/Ambiguous.lean:55, 79`); `card_isometry_binaryDeterminant23` (`Binary/Determinant23.lean:268`).
     - B5: `picClass_primitiveReducedForms_bijective` (`BinaryQuadraticForm/Ideal/ClassNumber.lean:93`); `finite_orbitRel_quotient_primitiveForms` (`BinaryQuadraticForm/FiniteClasses.lean`).
  3. Rewrite B1–B5 as native with their Checks kept. The targets that remain are:
     - the genus as a coset of the squares (B3), with a source locator, which this paragraph lacks today;
     - distinct indefinite cycles giving distinct classes (B5);
     - B6–B8.
  4. Replace the claim at 1081 that the binary theory is absent with a citation of Tau Ceti's `BinaryQuadraticForm`.

## R02 (P3) — Open pull request #617 rewrites this folder differently and conflicts; the branch also conflicts with main

- **Location.** The whole folder, which the pull request's description never mentions.
- **Claim.** Both heads change the same targets differently, and neither states an order.
  - #617's head of `TauCetiRoadmap/IntegralLattices/` already consumes the natives of R01 and R03–R07 instead of restating them. It states only the sufficiency half of 5J, and compares the 7E Riemannian measure with Tau Ceti's Haar measure.
  - Separately, `git merge-tree --write-tree origin/main HEAD` reports content conflicts in this folder's `README.md` and `Suggested.lean`. This branch never merged main: its merge base is still `eaf17b1`.
- **Witness.** The overlaps tool: "#617 and #1797 conflict in `TauCetiRoadmap/IntegralLattices/README.md`, `…/Suggested.lean`". #617's docstring lists `infinite_isometry_of_isIndefinite`, `Matrix.localDensityCount`, `sum_inv_natCard_isometry_eq_mass_iff` and `posDefProperClassEquivPic` as native. #1411's copy of `Suggested.lean` is byte-identical to main's.
- **Repair.** Let one pull request own this folder's revision. Since #617 already contains R06–R08 and the native alignment, drop the folder from this pull request:
  1. Merge `origin/main`.
  2. Resolve `README.md`, `Suggested.lean`, `STATUS.md` and `PROGRESS.md` to main's versions, so that `git diff origin/main HEAD -- TauCetiRoadmap/IntegralLattices` is empty.
  3. Say in the description that #617 carries the folder.

  If this pull request keeps the folder instead, rebase it on #617's head and say so. Either way, R08–R10 and the 1H item of R07 are also present at #617's head (its README lines 879 and 3228 and its 1H paragraph), and the pull request that carries the folder must fix them.

## R03 (P3) — `infinite_isometry_of_isIndefinite` (4F) closes in one tactic from the native theorem of the same name

- **Location.** `Suggested.lean:322–325`; README 1753.
- **Witness.** On a scratch copy, the proof `exact TauCeti.IntegralLattice.infinite_isometry_of_isIndefinite (by rwa [L.finrank_carrier]) hL` elaborates, leaving 23 sorries instead of 24. The native theorem is at `NumberTheory/IntegralLattice/IndefiniteIsometry.lean:171`.
- **Repair.** Delete the theorem from `Suggested.lean`, name the native theorem in the docstring's "proved in Tau Ceti" list and in 4F, and add the file to §*From Tau Ceti*.

## R04 (P3) — The 7C definition and both 7C headlines restate native `Matrix.localDensityCount` and its theorems

- **Location.** `Suggested.lean:652–685` (`localDensityCount`, `localDensityCount_succ_eq`, `localDensityCount_eq_of_odd_of_not_dvd`); README 2467–2481.
- **Witness.** All of these are in `NumberTheory/IntegralLattice/LocalDensity/Basic.lean`:
  - `Matrix.localDensityCount` (:110);
  - `localDensityCount_succ_of_dvd` (:508) and `localDensityCount_div_pow_of_det_ne_zero` (:599), which stabilize from `r > 2v_p(2 det A)`;
  - `tendsto_localDensityCount_div_of_card_eq_two_mul_add_one` and `…_two_mul_add_two` (:711, :737), the same closed values with `ε = ((−1)^{m+1} det | p)`;
  - `tendsto_localDensityCount_div_hyperbolicPlane_three` (:762).
- **Repair.**
  1. Delete the three declarations and name the natives in the docstring.
  2. Rewrite the 7C bullets for stabilization, basis independence (`localDensity_transpose_mul_mul`, :551) and the unramified value as native, with the `U`-at-3 test pointing to :762.
  3. Keep as targets the `[K_p : K_p⁺]` bullet, the normalization dictionary and the Conway–Sloane §12 dictionary.

## R05 (P3) — The 5J structures restate native definitions verbatim, and the necessity half is native

- **Location.** `Suggested.lean:459–489` (`TwoElementaryAdmissible`, `TwoElementaryLatticeWithInvariants`, `exists_twoElementaryLattice_iff`); README 2034–2036: "`Suggested.lean` pins them as `TwoElementaryAdmissible`".
- **Witness.** The same fields and bodies are in `TauCeti.IntegralLattice.TwoElementaryAdmissible` and `TwoElementaryLatticeWithInvariants` (`LinearAlgebra/IntegralLattice/TwoElementary.lean:81, 285`). Necessity is `TwoElementaryLatticeWithInvariants.twoElementaryAdmissible` (:303). The four boundary witnesses are checked by `not_twoElementaryAdmissible_boundary_witnesses`.
- **Repair.** Delete both definitions. Replace the `↔` with the sufficiency half on the native predicates: `TauCeti.IntegralLattice.TwoElementaryAdmissible δ tp tm a → TauCeti.IntegralLattice.TwoElementaryLatticeWithInvariants δ tp tm a`. Cite necessity in 5J. Tested on `(1; 1, 0, 1)`, which is admissible and realized by `⟨2⟩`.

## R06 (P3) — 4E and 9B restate native theorems in Gram form without citing them, and 7A/7G plan native masses

- **Location.** `Suggested.lean:307–311` (`finite_genusClasses_rank_two`) and `:798–821` (`IsGenusMass`, `isometric_mem_of_sum_eq_genusMass`); README 1712, 2438–2442, 2620–2626, 2721–2727.
- **Witness.**
  - 4E: `finite_genusClasses_of_finrank_eq_two` (`NumberTheory/IntegralLattice/Binary/ClassNumber.lean:93`), with no definiteness hypothesis.
  - 7A, 7G: `mass` and `properMass` (`Mass.lean:91, 100`); `properMass_eq_two_mul_mass` (:154); the rank-0/1 values (:252, :264).
  - 9B: `sum_inv_natCard_isometry_eq_mass_iff` (:221).
- **Repair.** Delete the three declarations and name the natives in the docstring. Rewrite 4E (rank 2), 7A, 7G (ranks 0 and 1) and 9B as native, keeping their Checks. Unlike 2G, 6C, 6D and 6H, none of these statements names the native theorem it reads.

## R07 (P3) — §*From Tau Ceti* omits further native modules that discharge milestones still written as targets

- **Location.** README 433–475 (no row for any of the files below) and the milestones listed with them.
- **Witness.** `gaussSign_oddCyclic` (`FiniteBilinearModule/OddCyclic/GaussSum.lean:255`); `SameGenus` (`NumberTheory/IntegralLattice/Genus.lean:77`); `IsNeighbor` (`Neighbor/Basic.lean:54`); `orthogonalGroupVolume_eq_prod` (`Geometry/Euclidean/Volume/OrthogonalGroup.lean:446`). The table under Repair gives one native result per milestone.
- **Repair.** The milestones and their native results:

| Milestone (README line) | Native at the pin |
| --- | --- |
| 1H odd-prime value (651) | `FiniteQuadraticModule.gaussSign_oddCyclic` (`FiniteBilinearModule/OddCyclic/GaussSum.lean:255`), `k²(1−p) + 2k(1−(θ\|p))` |
| 3B existence and ranks (829–833) | `IsSymm.exists_isJordanSplitting` over a DVR, `IsJordanSplitting.finrank_eq_of_equivalent` (`BilinearForm/JordanSplitting/Basic.lean:380, 490`) |
| 3C at odd `p` (855–859) | `localIntegralForm_equivalent_iff_forall_equivalent_restrict` (`NumberTheory/IntegralLattice/JordanSplitting.lean:92`) |
| 3D unimodular dyadic (878–880) | `IsSymm.equivalent_iff_two_dvd_iff_and_isSquare_det_mul_det_and_eight_dvd` (`Padics/BilinearForm/Unimodular.lean:69`), `…_of_odd` (`OddUnimodular.lean:386`) |
| 3F (915–922) | `SameGenus` (`Genus.lean:77`), `sameGenus_iff_localIntegralForm_equivalent_primeFactors` (:216) |
| 4A (1551–1555) | `genusClasses`, `classNumber` (`ClassNumber.lean:76, 144`), `genusProperClasses`, `properClassNumber` (`ProperClassNumber.lean:75, 153`) |
| 4G (1766–1783) | `IsNeighbor` with `symm` and `determinant_eq` (`Neighbor/Basic.lean:54`), `neighbor`, `isNeighbor_neighbor`, `exists_isNeighbor_of_not_dvd_discriminant` (`Neighbor/Isotropic.lean`), `isNeighborBasisChange_iff_rank_eq_one`, `IsNeighbor.sameGenus` (`NumberTheory/IntegralLattice/Neighbor.lean:43`) |
| 5A easy halves (1842–1851) | `SameGenus.nonempty_isometry_discriminantQuadraticModule`, `…BilinearModule` (`Localization/Discriminant/Form.lean:433, 422`) |
| 7E values (2572–2586) | `orthogonalGroupMeasure`, `orthogonalGroupVolume_eq_prod`, `specialOrthogonalGroupVolume_eq_prod`, `orthogonalGroupVolume_eq_two_mul_specialOrthogonalGroupVolume`, `two_mul_pi_rpow_mul_prod_Gamma_eq_two_pow_div_orthogonalGroupVolume` (`Geometry/Euclidean/Volume/OrthogonalGroup.lean:344–516`) |

  Then:
  1. Add one row per file to §*From Tau Ceti*.
  2. Rewrite each listed milestone so that only the non-native part stays a target. The remaining targets are:
     - 1H: nothing;
     - 3B: the dyadic norm-ideal bullet;
     - 3F: nothing;
     - 5A: the converse;
     - 7E: the comparison of the Riemannian measure of `−tr(XY)/2` with `orthogonalGroupMeasure`, which the native file says it does not formalize.
  3. Remove 1H from the 8S export table.
  4. Make `GramSameGenus` the native `SameGenus` read on `ofGramMatrix`.

## R08 (P3) — A 3C Check compares two equal determinant classes as different

- **Location.** README 868–869: "a splitting `⟨1⟩ ⊕ ⟨3⟩` would have determinant class `3 ≠ 3·4 = 12` and is wrong."
- **Witness.** `12/3 = 4 = 2²` is a unit square in `ℤ₃`, so the two classes are equal. What separates the splittings is the scale-1 constituent: unit `1` against `2`, with `(2|3) = −1`.
- **Repair.** "a splitting `⟨1⟩ ⊕ ⟨3⟩` has the same determinant class (`3 = 12·2⁻²`), but its scale-1 constituent has unit class `1` against `2`, and `(2|3) = −1`, so it is not a Jordan splitting of `A₂` at 3."

## R09 (P3) — The 4G Check's vector fails the construction's own divisibility condition

- **Location.** README 1777: "choose `v ∈ L` primitive with `β(v, v) ≡ 0 (mod 2p²)`"; README 1789: "`v = (11, 2)` has `β(v, v) = 125 ≡ 0 (mod 50)`".
- **Witness.** `125 = 2·50 + 25 ≡ 25 (mod 50)`. Native `neighbor` (`Neighbor/Isotropic.lean:232`) needs only `p² ∣ β(v,v)`; `isEven_neighbor` adds `2p²` to keep an even `L` even.
- **Repair.**
  - Construction: "`p² ∣ β(v, v)`, and `2p² ∣ β(v, v)` when `L` is even".
  - Check: "`β(v, v) = 125 = 5·25`".
  - Tested: `(11/5, 2/5)` has norm `5`. `β((11/5, 2/5), x) = (11a + 2b)/5 ∈ ℤ` on `L_v`. The basis `(3/5, −4/5)`, `(−4/5, −3/5)` lies in `M`, as N0's Check uses.

## R10 (P3) — The references cite milestones that do not exist here

- **Location.** README 3100–3103: "Corollary 1.13.3 (5C); Corollaries 1.13.4 and 1.13.5 (5D); Proposition 1.14.1 and Theorem 1.14.2 (5E); … Theorem 1.14.4 (5H); … Theorems 3.6.2 and 3.6.3 (5J)."
- **Witness.** Layer 5 has only 5A, 5B, 5F, 5G, 5I and 5J. README 124 and 1824 assign 1.13.x, 1.14.x and 3.6.3 to `IntegralLatticesPartII`.
- **Repair.** "… Corollary 1.10.2 (5B); Theorems 1.12.2 and 1.12.4 with Corollary 1.12.3 (5G); Proposition 1.15.1 and Corollary 1.15.2 (5I); Theorem 3.6.2 (5J); Theorems 1.13.1–1.13.2, Corollaries 1.13.3–1.13.5, Proposition 1.14.1, Theorems 1.14.2, 1.14.4 and 3.6.3 are `IntegralLatticesPartII`'s."

## Previous findings (r11 at `ea37f0f`)

| Finding | Status at this head | Evidence |
| --- | --- | --- |
| R01, stale folder and conflict with main | Partly repaired | The folder now carries main's content (`f2f59c78`, "adopt main's folder"). `git merge-tree` still conflicts in both files, because the branch never merged main (R02). |
| R02, depcheck UPWARD and CYCLE | Repaired | `depcheck: 238 roadmaps, 2334 edges, 0 problem(s)`. |
| R03, wrong B2 supplier name | Repaired | README 1163 cites `NumberFieldOrder.isProperFractionalIdeal_iff_isUnit_of_finrank_eq_two`, which is at the pin (`Orders/Quadratic/Basic.lean:143`). |
| R04, B7 fibre base and real measure | Repaired | README 1355–1357: "angular density `|dθ|`, of total volume `2π`"; the base is the squares in `NarrowPic` and `((ℤ/mℤ)ˣ)²` in the split case. |
| R05, R09–R13 (gate) | Repaired | `sorry-data=0 imports=0 sorry-examples=0 prnum=0 residue=0 statement-hygiene=0`. |
| R06, seven native headlines | Repaired | The seven are deleted from `Suggested.lean` and listed at its lines 53–74; §*From Tau Ceti* rows 458–467 were added; 1H, 1I, 1L, 2F, 6B, 6C and 6G were rewritten. All ten names were re-opened at the pin with matching statements. |
| R07, carrier display | Repaired | README 228–235 shows `isLattice`, `isSymm` and `le_dual`, as at `LinearAlgebra/IntegralLattice/Basic.lean:63–73`. |
| R08, Allcock–Gal–Mark locator | Repaired | README 899–901: "Theorem 6.2, p. 20 … Corollary 6.4, p. 21 … Theorem 5.1, p. 16". This matches `allcock-gal-mark2016` lines 686, 849 and 917, under the page markers at lines 684, 842 and 882. |

## Verified sound

**Gate.** I ran the gate on this head. Every IntegralLattices check is 0, including `sorry-data`, `imports`, `statement-hygiene`, `depcheck` and `stray-files`. The only non-zero count is `outside-folder=54`, and every one of those 54 paths is in the five folders the brief names as the pull request's own. The other-changes `git diff --stat` is empty. The worker's gate reports pass as well.

**Elaboration.** `lake env lean TauCetiRoadmap/IntegralLattices/Suggested.lean` exits 0 with 24 warnings, all of them `declaration uses sorry`. On a scratch copy, `#check @` of all 58 declarations shows every needed binder in its type: `[LindelofSpace]`, `[BorelSpace]`, the `ContMDiff` and immersion hypotheses of 7E, `[FiniteDimensional ℚ V]` in 5G, and the `IsNondegenerate` instances in 5A. No `def` has lost a section variable. The worker's resolver listed 15 names as "found nowhere"; they are this file's own declarations, and all 15 elaborate.

**Dependency check.**

```text
depcheck: 238 roadmaps, 2334 edges, 0 problem(s)
```

**Cross-roadmap citations resolved.**

- QFI `hilbertSymbol_productFormula`: this pull request's `QuadraticFormInvariants/Suggested.lean:195`.
- Global Quadratic Forms `hasseMinkowski_equivalent` and `equivalent_of_locallyEquivalent`: main, `Suggested.lean:439, 544`.
- Global Number Fields `picEquivUnitsIdealClassMonoid` and `finite_narrowPic`: main, `Completed/GlobalNumberFields/Suggested.lean:798, 991`; "Layer 11" at its README 571.
- Orthogonal and Spin Groups `spinorNorm_reflection`, `transvectionLiftHom` and `orthogonalBaseChangeReal`: `Completed/OrthogonalSpinGroups/Suggested.lean:420, 904, 1025`; 0C, 2C and 2F at its README 368, 684 and 717.
- Class Field Theory `ringClassArtinMap` and `gal_ringClassField_equiv_pic`: main README 1850–1851; `hilbertProductFormula` at 150.
- Root Systems §3.1: main README 687.
- DifferentialGeometry 12.1 and 12.4: main README 915 and 923.
- OTM §§0.3, 1.1–1.4, 2.1–2.3, 3.1, 4.1, 4.2: #1222 head, README 185–634.
- Rank24LatticeConstructions Layers 3 and 6: main README.

**Ownership.**

- LatticePackingsAndPerfectForms (#1723) consumes this roadmap (its README 7, 272, 1689, 1938) and owns the geometric invariants only.
- OTM (#1222) consumes §§0–7 and 9B by section (its README 48–51), not by Lean name.
- No object is owned twice, apart from the native restatements in R01 and R03–R07.
- The overlaps tool reports no dropped ids in either direction.
- #851 (GeometryOfNumbersAndQuadraticArithmetic) was not checked: the brief gives no checkout of it.

**Adversarial pass.** All values were computed in exact arithmetic. The density counts and binary automorphism orders were brute-forced in a scratch script, and `d16PlusGram` was checked by fraction-exact determinant and minors.

| Statement | Instances | Values computed (left / right) | Result |
| --- | --- | --- | --- |
| 2G `finite_classes_of_posDef` | `n=2,d=3`; `n=0`; `n=1,d=0` | reduced `[1,0;0,3]`, `[2,±1;±1,2]`: 2 classes; empty matrix: 1; none: `S=∅` | true; Gram reading of native `exists_finset_forall_exists_gramMatrix_mem`, cited |
| 4B double coset | `[1]`; `!![4,1;1,6]` | `K_p = {±1} = O(V_p)`, 1 point / 1 class; 2 points / `h = 2` | true |
| 4E rank 2 | `!![4,1;1,6]`; `U` | 2 classes; 1 class | true; native (R06) |
| 4F | probe | native call closes, 23 of 24 sorries left | padding (R03) |
| 5A `gramSameGenus_iff_of_isEven` | `E₈²`/`D₁₆⁺`; `U`/`⟨2⟩⊕⟨−2⟩` | `(16,0,0)`, trivial `q` both: same genus / same; `q = 0` vs values `1/4, 3/4`: different / different | true both ways |
| 5B choice-independence | `⟨6⟩` at 3; `⟨4⟩`, `⟨20⟩` at 2; `⟨2⟩`, `⟨10⟩` at 2 | `q(1)=1/3`, `θ=2`, `2·3=6` = gram det 6; `q = 1/8, 5/8` non-isometric, dets `4 = 1·4`, `20 = 5·4`; hypothesis fails (`HasCyclicTwoSummand`), ratio 5 | true; exception needed |
| 5B `exists_evenLattice_iff` | `(0,0,0)`, `(1,0,q₁⁽²⁾(2))`, `(1,0,q₁⁽³⁾(3))`, `(0,2,q₁⁽³⁾(3))` | zero lattice / conditions hold; `⟨2⟩` / cond. 1 `1≡1`, 4 off; none / sign `6 ≢ 1`; `A₂(−1)` / `−2 ≡ 6` | agree in all four |
| 5B Cor. 1.10.2 | `(8,0,0)`, `(1,1,0)` | `E₈`, `U` | true |
| 5G 1.12.2 | `S=⟨2⟩`, `(1,1)` | `e+f ∈ U` primitive, norm 2 / `⟨−2⟩` has `q=−1/4` | true |
| 5G 1.12.4 | `(1,0,1,1)`; `(1,0,0,0)`; `(0,0,1,0)` | `⟨2a⟩ ↪ U` via `e+af` / conditions hold; no injection into rank 0 / `1 ≤ 0` fails; no rank-1 even unimodular / `1 ≢ 0 (8)` | agree |
| 5J | `(1;1,0,1)`; `(0;4,0,0)` | `⟨2⟩`, admissible; no rank-4 even unimodular, fails cond. 4 (`4 ≢ 0 (8)`) | true; native defs (R05) |
| 6A even/odd | `U` vs `!![0,1;1,2]`; `⟨1⟩⊕⟨−1⟩` vs `!![1,1;1,0]` | basis `e, f+e`; det `−1`, odd, indefinite | true |
| 6C ≤ 8 / 9 | `n=0` vacuous; `I₉`, `E₈⊕I₁` | norm-1 counts 18, 2 | true |
| 6D | `d16PlusGram` | symmetric, det `1`, all 16 leading minors `> 0`, equals the Gram of `h, e₁−e₂, …, e₁₄+e₁₅` | true |
| 6E | `D₁₆E₈`, `E₈³`; any row vs Leech | `480+240 = 720` roots each, multisets differ; min 2 vs 4 | true |
| 6H | sums with `U` | both even unimodular of signature `(17,1)` | true |
| 7C stabilization | `U` at 2 | counts `6, 16, 32, 64` (`r = 1…4`), ratio 2 from `r = 2`, `α₂ = 4` | true; native (R04) |
| 7C odd value | `U`@3; `I₂`@3; `I₂`@5; `⟨a⟩` | `4, 12` → `4/3`; `8, 24` → `8/3`; `8` → `8/5`; `2` | true; native (R04) |
| 7E | `n = 0, 1, 2, 3` | `SO`: `1, 1, 2π, 8π²`; `O`: `1, 2, 4π`; Boya–Sudarshan–Tilma (6.4), (6.5), (6.9) at lines 659, 669, 684 | true |
| 9B | `!![4,1;1,6]` genus | brute-force `\|O\| = 4, 2`, `1/4+1/2 = 3/4` complete; three Gram matrices of one lattice sum to `3/4` and fail pairwise non-isometry | true; native (R06) |
| B1 (seeded) | `A₂`, `U`, `⟨1,−2⟩`, `!![4,1;1,6]` | `(c,Δ) = (2,−3), (2,1), (1,8), (2,−23)`; `⟨2e₁,e₂⟩`: content 1, det ×4 | true; native (R01) |
| B2 (seeded) | `Δ = 12` | same ideal `𝒪₁₂`; no equivalence (mod 3, and none with entries ≤ 6); `√12·𝒪 ~ √3·𝒪`, `N(2+√3) = +1` | true; native (R01) |
| B3 (seeded) | `Δ = 25`, `64`, `−23` | `(0,5,c)` pairwise inequivalent, genera `{1,4},{2,3}`, torus quotient order 2; `(ℤ/8)ˣ` all square to 1, quotient trivial; `Pic ≅ ℤ/3`, squares = all | true |
| B4 (seeded) | `!![4,1;1,6]`, `!![2,1;1,12]`, `A₂`, `U` | `\|O\| = \|SO\| = 2` (solve `92x² = 46εx`, `x = 0`); `\|O\| = 4`; 12; `\|O(U)\| = 4 = 2\|SO\|` | true; native (R01) |
| B5 (seeded) | `Δ = −23`, `−3` | reduced `(1,1,6), (2,±1,3)`; `(1,1,1)` | true; native (R01) |
| B6 (seeded) | `x²+y²`, `x²−3y²`, `U` | `T(ℤ)` of order 4; `±(2+√3)^ℤ`; `(t,t⁻¹)` | true |
| B7 (seeded) | `Δ = −4`, `12`, `1` | `2π/4 = π/2`; `log(2+√3) ≈ 1.317`; infinite, with kernel `ℤ̂ˣ` of volume 1 | true |
| B8 (seeded) | `A₂`; `!![4,1;1,6]` | `w=6, h⁺=1`, `m = 1/12`; `w=2, h⁺=3, a=1, h=2`, `m = 3/4 = h⁺/(2w) ≠ 1/2` | true |
| 3C Check | `A₂` at 3 | `12/3 = 4` a unit square | Check false (R08) |
| 4G Check | `v = (11,2)`, `p = 5` | `125 ≡ 25 (mod 50)`; `125 ≡ 0 (mod 25)` | Check false (R09) |
| 1H target | `θ = 2`, `p = 3`, `k = 1` | `−2 + 2·1·2 = 2` = the Check's `sign` | true; native (R07) |

**Headline theorems.** The README's principal results and the docstring were compared.
- Stated in `Suggested.lean`: 4B, 5A, 5B (with 1.9.1 and 1.10.2), 5G, 5J, 6A, 6E, and 7E's Riemannian volumes.
- Gram readings that cite their native theorem: 2G, 6C, 6D, 6H.
- Named as proved in Tau Ceti: 1H (Theorem 1.11.3), 1I, 1L, 2F, 6B, 6C (lattice form), 6G.
- Named as not statable: 3E/3G and 4C. These hold at the pin: there is no genus-symbol or spinor-genus carrier.
- The B2/B3 claim is false (R01). 4E, 4F, 7A, 7C, 7G and 9B are native (R03–R06).

**Library declarations opened at the pin.**
- Every name cited in R01 and R03–R07, at the lines given.
- The ten natives of §*From Tau Ceti* rows 458–467, with matching statements.
- `IntegralLattice` fields (`Basic.lean:63–73`).

**Sources checked.**
- `allcock-gal-mark2016`: lines 686–687, 849–852, 917–918. They support 3E as written: Theorem 6.2 is stated with sign walks on 2-adic symbols whose compartments already fuse oddities.
- `voight2023`: Definition 3.10 (line 230, p. 5), Lemma 3.12 (line 245, p. 6, with `p ∤ d`), Proposition 3.13(iii) (lines 261–262). These support 4G, whose `p² ∣ Q(v)` is `p² ∣ β(v,v)` here.
- `boya-sudarshan-tilma2003`: §6, (6.1) line 643 on p. 16, (6.5) line 669 and (6.9) line 684 on p. 17, with `−Tr[λ²] = 2` at line 655, matching the metric `−tr(XY)/2`.

## Not verifiable

- Seeded B2, B4, B5: Cox, *Primes of the form x² + ny²*, Theorems 2.8 (p. 27), 2.13 (p. 29), 3.9 (p. 50) and 7.7 (p. 137). This is a Wiley book with no open copy, and it is not in the manifest. The statements were checked mathematically (table above), not at the locators.
- Cohen, *A Course in Computational Algebraic Number Theory*, §§5.2, 5.6 (B2, B5): the manifest has it as `uncertified`.
- Conway–Sloane, *The mass formula* (B8, 7A, 7C, 7H): `waived`.
- Kawauchi–Kojima (1G): `uncertified`.
- Seeded B1, B3, B6 and B7 cite no source locator. B7 cites Dirichlet's unit theorem in the hard-theorems table at README 2955. B8 cites Conway–Sloane eq. (1) at 2946.
- Nikulin (Izv. 1979), O'Meara, Serre, Milnor–Husemoller, SPLAG, Cassels, Cho, Gan–Yu, van der Blij, Wall: paywalled journals or books. They were checked only through the computed instances above.

## Source issues

- none
