# Review of OrthogonalTamagawaAndLatticeMass (pull request #1222 at d4f1571)

**Verdict:** accepted

Incremental re-review of the 81 lines changed since `cd58321` (README 44, `Suggested.lean` 37). All five findings of the previous report are repaired, the repairs introduce no new problem, and the gate passes. No finding remains.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 61–70 state `finite_genusClasses_of_isIndefinite` under `/-! ## Layer 0: native and scheme dictionaries -/` with the requested signature; the docstring bullet is split into Spin approximation and Eichler's equality; README §0.3 (line 196) names the theorem.
- R02 — repaired: README line 39 now cites the lemma "in `TauCeti/LinearAlgebra/IntegralLattice/Milgram.lean`", for `finrank ℚ V`, "which is the rank by `TauCeti.IntegralLattice.finrank_carrier`"; §3.1 (line 459) says the same.
- R03 — repaired: README line 16 keeps `genusClasses` for full classes, "except in §§0.3 and 1.1, which work with the proper classes in the genus, `TauCeti.IntegralLattice.genusProperClasses`", and separates §1.4's SL₂(ℤ)-classes of binary forms.
- R04 — repaired: §0.0 (lines 112–120) states its three bullets on `Matrix.isometryMatrices G` and its unit group; the From Tau Ceti contract (line 30) and the *Needs* line carry the submonoid and its three lemmas.
- R05 — repaired: the section comments read "Layer 3: even-unimodular specialization and exact arithmetic" and "Layer 4: automorphism orders and class counts", matching README lines 455 and 506; Layer 0 matches line 106.

## Verified sound

### Gate, dependency check, elaboration, binder audit, padding probe

- **Gate.** The worker's `gate.md` reports `OK`; my rerun at `d4f1571` prints `OK` with all 27 counters 0.
- **Other changes.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check** (`--movable --pr 1222`) printed:

  ```text
  depcheck: 233 roadmaps, 2263 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line. The change adds no supplier: the new §0.3 text cites only IntegralLattices (main) and Tau Ceti.
- **Elaboration.** `lake env lean` of `Suggested.lean` at the pins (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`) prints exactly eight ``declaration uses `sorry` `` warnings, at lines 67, 81, 99, 123, 133, 139, 144 and 150, and nothing else.
- **Binder audit.** The file has no `variable` or `include`. The elaborated type of the one new declaration is `∀ {V} [AddCommGroup V] [Module ℚ V] (L : IntegralLattice V) [L.IsNondegenerate], L.IsIndefinite → 3 ≤ Module.finrank ℤ ↥L.carrier → L.genusClasses.Finite`, which is the statement of README line 196. The seven other types are unchanged from the previous report. The entry "`,` (class, line 66)" in `signatures.md` is a scanner artefact: line 66 is a docstring line that begins with the word "class,"; the file declares no class.
- **Padding probe.** `first | rfl | (simp; done) | infer_instance | exact?` on a scratch copy of `finite_genusClasses_of_isIndefinite`, with `ProperClassNumber`, `Binary/ClassNumber` and `IndefiniteIsometry` imported as well, fails ("`exact?` could not close the goal"). Loogle has no hit for `L.genusClasses.Finite` beyond the definite and binary cases, and no other roadmap's Lean file states this conclusion (`roadmaps grep --lean-only 'genusClasses\.Finite'` returns only this file). It is a headline, not padding.

### Library declarations opened at the pin (Tau Ceti `2fd255d9`), 24 newly cited or re-cited

- `IsPosDef.finite_genusClasses`, `IsNegDef.finite_genusClasses`: `NumberTheory/IntegralLattice/ClassNumber.lean` 173, 188.
- `finite_genusClasses_of_finrank_eq_two`: `Binary/ClassNumber.lean` 93; it takes `[L.IsNondegenerate]` and `finrank ℤ L = 2`, no definiteness, so the README's "the conclusion holds in rank two" is exact.
- `genusProperClasses`: `ProperClassNumber.lean` 75, the preimage of `genusClasses` under `toIsometryQuotient`. `finite_genusProperClasses_iff` (131): `L.genusProperClasses.Finite ↔ L.genusClasses.Finite`, with no hypothesis, as the §0.3 route uses it.
- `properMass`: `Mass.lean` 100. `properMass_eq_two_mul_mass` (154) needs `L.genusClasses.Finite` and `0 < finrank ℤ L`, both stated in README line 36. `mass_eq_one_of_finrank_eq_zero` (252), `mass_eq_inv_two_of_finrank_eq_one` (264), `properMass_eq_one_of_finrank_eq_one` (270).
- `IsIndefinite`: `Signature.lean` 188, `0 < sigPos ∧ 0 < sigNeg` ("both signature indices positive"). `IsNondegenerate`: `Basic.lean` 154, a class on `L.form.Nondegenerate`. `finrank_carrier`: `Basic.lean` 126, `finrank ℤ L = finrank ℚ V` ("same file" is right).
- `infinite_isometry_of_isIndefinite`: `IndefiniteIsometry.lean` 171, `[L.IsNondegenerate]`, `3 ≤ finrank ℤ L`, `L.IsIndefinite` ⊢ `Infinite (Isometry L L)`.
- `Matrix.isometryMatrices`: `LinearAlgebra/Matrix/IsometryMatrices/Basic.lean` 79, a `Submonoid`. `isUnit_det_of_mem_isometryMatrices` (151) assumes `IsUnit A.det`, so it does not cover det G = 2, as §0.0 says. `nonsing_inv_mem_isometryMatrices` (159) assumes `IsUnit X.det`, which §0.0 supplies from (det A)² det G = det G. `natCard_isometryMatrices_transpose_mul_mul` (272) assumes `IsUnit P.det`.
- `IntegralLattice.Isometry.det`: `Isometry/Group.lean` 143, `Isometry L L →* ℤˣ`. `specialOrthogonalGroup.toMatrix` (343), a monoid homomorphism to `Matrix.SpecialLinearGroup ι ℤ`; `toMatrix_injective` (354).
- `BilinForm.isIsometry_toLin_iff_mem_isometryMatrices`: `LinearAlgebra/BilinearForm/Isometry.lean` 303. `IsometryQuotient`: `Isometry/Class.lean` 53.
- `eight_dvd_finrank_of_isEven_isUnimodular_isPosDef`: `Milgram.lean` 381, conclusion `8 ∣ Module.finrank ℚ V`.
- `BinaryQuadraticForm.posDefProperClassEquivPic` (`Ideal/PicEquivalence.lean` 55, domain `PosDefProperClass n`) and `properClassEquivNarrowPic` (`Ideal/Narrow/Equivalence.lean` 106, domain the `SL(2, ℤ)`-orbits of `primitiveForms D`): classes of forms, not of lattices, as line 16 says.
- **Docstring absences.** `NumberTheory/QuadraticForm/OrthogonalGroup/FiniteAdelic.lean` line 79 fixes `[Module ℚ V]`: the adelic Spin point groups are over ℚ only. A grep for a spinor genus at the pin finds only spinor norms and their images.

### Cross-roadmap citations resolved (IntegralLattices on main)

- Line 1531: the branch "indefinite, rank at least 3" is assigned to this roadmap as "4D and the rank-`≥ 3` half of 4E"; lines 1529–1530 keep the definite case (2G) and the indefinite binary case (4E) there. This matches the reworded Scope paragraph (README line 9) and "Downstream consumers" (line 573).
- Line 1423: "OTM §0.3 consumes 4A–4C and N0–N1"; headings N0 (1429), N1 (1468), 4A (1507), 4B (1537), 4C (1581) exist.
- 4C, lines 1600–1610: for rank ≥ 2 the group `ProperSpinorGenusClassGroup L` is finite, and for rank ≥ 3 the proper spinor genera in the genus are in bijection with it. This is the finiteness input of the §0.3 route.
- 4C, lines 1611–1618: in rank two with nonsquare Δ, C_L is the subgroup of squares of the narrow Picard group and the proper spinor genera are the cosets of C_L². This is the "rank-two count" of the new Check.

### Adversarial table

Rows 1–16 of the previous report (`genusMass_eq` on I₃, I₄, E₈; the `3 ≤ n` hypothesis; `genusMass_eq_rank_two` on seven binary forms; `evenUnimodularMass_eq` and its hypotheses; the rank-16, 24, 32 and 40 counts; the Weyl orders; §§0.1a, 1.4a, 1.4c) concern statements the diff leaves untouched and are carried forward from the report at `cd58321` with their values. Its rows 17 and 18 recorded R01 and R02 and are replaced by rows 17 and 22 below.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1–16 | as in the report at `cd58321` | as there | as there (e.g. I₃: 1/48; E₈: 1/696729600; rank 24: Σ = M₂₄ exactly; 2M₃₂ = 80618465.87…) | True | none |
| 17 | `finite_genusClasses_of_isIndefinite`: hypotheses | degenerate L; rank 2; rank 0, 1; definite | `IsIndefinite` alone allows a radical, hence `[L.IsNondegenerate]`; rank 2: conclusion true by the native binary theorem, so `3 ≤ rank` is a route hypothesis (the README says so); ranks 0, 1: nondegenerate ⇒ definite, `IsIndefinite` false; definite: native theorems | Statement true; not vacuous (x² + y² − z²) | none |
| 18 | §0.3 Check, x² + y² − z² | native mass | rank 3, signature (2,1), det −1 ≠ 0; `infinite_isometry_of_isIndefinite` applies to every lattice of the genus; `Nat.card` of an infinite group is 0, each weight 0⁻¹ = 0, `mass` = 0 | True | none |
| 19 | §0.3 Check, discriminant 229 | reduced forms, cycles, unit | 14 reduced primitive forms in 3 cycles of lengths 6, 6, 2; (−9,7,5), (−9,11,3), (−1,15,1) lie one in each; discriminants 49+180 = 121+108 = 225+4 = 229; unit (15+√229)/2 of norm −1; narrow class group of order 3 = its squares; one genus (229 prime); [C_L : C_L²] = [3 : 3] = 1 proper spinor genus against 3 proper classes | True: Eichler's equality fails in rank 2 | none |
| 20 | §0.3 "class finiteness for every nondegenerate lattice" | case split | nondegenerate ⇒ sigPos + sigNeg = rank; sigNeg = 0: `IsPosDef`; sigPos = 0: `IsNegDef`; both positive: rank 2 native, rank ≥ 3 the headline; rank 1 cannot have both | Exhaustive | none |
| 21 | §0.0 on `Matrix.isometryMatrices G` | G = diag(1,2); G = [[1,1],[1,3]] | (det A)²·2 = 2 ⇒ det A = ±1; diag(1,2): a² + 2c² = 1, b² + 2d² = 2 ⇒ 4 sign matrices, 2 of determinant 1 (index 2); [[1,1],[1,3]] = PᵀGP for P = [[1,1],[0,1]]: brute force over entries in [−6,6] gives 4 solutions; `isUnit_det_of_mem_isometryMatrices` needs det G a unit and does not apply | True; Check matches | none |
| 22 | Line 39, eight divides the rank | file and conclusion | `Milgram.lean` 381, `8 ∣ finrank ℚ V`; `finrank_carrier` converts to `finrank ℤ L` | Citation exact | none |
| 23 | Line 16/36, proper versus full mass | A₂; rank 1 | m⁺ = 1/6 = 2·(1/12); rank one: m = 1/2, m⁺ = 1 (native lemmas at `Mass.lean` 264, 270); `properMass_eq_two_mul_mass` requires positive rank: rank 0 has m = m⁺ = 1 | Conventions consistent | none |

### Sources and overlaps

- The changed passages add one external locator, O'Meara 104:5 (docstring) beside 104:4–5 (README §0.3); see Not verifiable. The seeded sample falls in changed text at §§0.0, 0.3, 1.1 and 3.1; the changed sentences there cite only Tau Ceti and IntegralLattices, checked above. The Belolipetsky–Gan §2 locator in §1.1 is unchanged (`BelolipetskyGan` lines 68 and 83–99, as in the previous report).
- `overlaps.md`: no open pull request changes this roadmap, drops an id it cites or is its only definer. `citations.md`: the one lead, `IntegralQuadraticLattice.ofCarrier`, is a GeometryOfNumbersAndQuadraticArithmetic §2.2 name, resolved at that head in the previous report and untouched by this change.
- The description's "eight headline theorems" and its Layer 0 summary agree with the head.

## Not verifiable

- **O'Meara, *Introduction to Quadratic Forms*, 104:4–5 (§0.3) and 104:5 (the docstring of `finite_genusClasses_of_isIndefinite`).** The manifest records it as uncertified and settled; it is cited by its locator alone.

## Source issues

- none
