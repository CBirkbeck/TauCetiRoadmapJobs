# Review of AlgebraicCurves (pull request #1854 at 81fee5f)

**Verdict:** needs changes

This is an incremental re-review.
- `TauCetiRoadmap/AlgebraicCurves/` is byte-identical between 30817b1 and 81fee5f. `git diff --stat 30817b18 HEAD` touches only `TauCetiRoadmap/ReductiveGroups/`.
- `lake-manifest.json` and `lean-toolchain` are unchanged, so the pins are the same.
- None of the nine findings of the previous review is repaired. All nine are carried below under their old numbers.
- Each witness was rechecked at this head and at the pins before it was carried.
- All nine findings are P3; none is blocking.
- The gate still fails (`outside-folder=2`), so the folder cannot be accepted at this head.

## R01 (P3) — Gate fails: two edits outside the pull request's roadmap folders

- **Location.** `Completed/ArithmeticDirichletSeries/README.md` (1 line) and `TauCetiRoadmap/SymplecticGeometry/README.md` (3 lines).
- **Claim.** The pull request edits two folders that are not among its 17 registered roadmap folders. While the gate fails, no folder of this pull request can be accepted.
- **Witness.**
  - The worker's gate at 81fee5f reports `outside-folder=2 … FAIL` and lists exactly these two files.
  - `git diff --stat origin/main...HEAD`, with the 17 registered folders excluded, gives `2 files changed, 4 insertions(+), 4 deletions(-)`.
- **Repair.** Do one of the following, then rerun the gate and expect `outside-folder=0`:
  - move both hunks (the ArithmeticDirichletSeries and SymplecticGeometry loop cuts) into a pull request of their own; or
  - register `Completed/ArithmeticDirichletSeries/` and `TauCetiRoadmap/SymplecticGeometry/` as folders of this pull request.

## R02 (P3) — Layer 10 Kummer covers: the general-`n` ramification data is already pinned, under fewer hypotheses than listed

- **Location.** `TauCetiRoadmap/AlgebraicCurves/README.md` lines 1441–1456. Quoted: "hypotheses of record, all four required … Only after (a)–(d): the ramification data `e(P′∣P) = n / r_P` … the general-`n` equality is built here".
- **Claim.**
  - The README plans to build a theorem the pin already proves.
  - It says the ramification index and the different exponent need hypothesis (c), a primitive `n`-th root of unity, and hypothesis (d), irreducibility of `Tⁿ − u`. They need neither.
- **Witness.**
  - `TauCeti.Place.ramificationIdx_eq_of_pow_eq` (`TauCeti/FieldTheory/FunctionField/Different/Radical.lean:259`) and `TauCeti.Place.differentExponent_add_one_eq_of_pow_eq` (`:269`) are sorry-free.
  - Their hypotheses are `F⟮y⟯ = ⊤`, `yⁿ = u`, `(n : k) ≠ 0` and `u ≠ 0`. The section variables add only that `F′/F` is finite and separable.
- **Repair.**
  - Cite both pinned names for every `n`, with those hypotheses.
  - Delete "the general-`n` equality is built here".
  - Say that (c) and (d) are needed only for the cyclic Galois structure, for `[F′ : F] = n`, and for the closed genus formula. They are not needed for `e` and `d`.
  - Keep the prime-`n` and `r_P = 1` names as corollaries.
  - Tested on `y³ = x` over `ℚ(x)`, where (c) fails: at `P_(x)` the formula gives `e = 3, d = 2`.
  - Tested on `y² = x`, read as `y⁴ = x²`, where (d) fails: at `P_(x)` it gives `e = 4/gcd(4, 2) = 2`.

## R03 (P3) — Results proved at the pin are planned as targets without their pinned names

- **Location.** README lines 372–373 state the rule: "where it does, the layer cites the pinned name and states the remaining targets against it". The rule is broken at:
  - lines 621–628 (Prop. 1.5.9, Thm. 1.5.14);
  - line 652 (Prop. 1.6.6);
  - lines 751–753 (Prop. 3.1.9);
  - lines 1230–1233 (Prop. 4.2.9);
  - lines 1309–1311 (Prop. 6.1.6(b), 6.1.7);
  - lines 1741–1747 (12D).
- **Claim.** These bullets plan, as work still to do, statements the pinned Tau Ceti proves. That is duplication by object.
- **Witness.** Two examples:
  - `TauCeti.Place.degreeOneAddEquivDegreeZeroClassGroup` (`FieldTheory/FunctionField/Elliptic/Basic.lean:264`) proves Prop. 6.1.6(b) and 6.1.7, sorry-free.
  - `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.equivFunctionFieldDivisor` (`AlgebraicGeometry/WeilDivisor/Scheme/FunctionField.lean:78`) is the 12D dictionary.
- **Repair.** At each bullet, cite the pinned name with its pinned hypotheses, and keep as targets only what remains. Every row was rechecked at the pin this round.

  | README result | Pinned name | File and line |
  |---|---|---|
  | `dim_F Ω_F = 1` (Prop. 1.5.9) | `TauCeti.finrank_weilDifferentialSpace` | `Differential/Dimension.lean:245` |
  | Duality `L(W − D) ≃ Ω_F(D)` (Thm. 1.5.14) | `TauCeti.riemannRochSpaceEquivWeilDifferentialFiltration` | `Differential/CanonicalDivisor.lean:365` |
  | `(x)_∞ = nP` for `n ≥ 2g` (Prop. 1.6.6) | `TauCeti.Place.exists_poles_eq_natCast_zsmul_ofPoint` | `Consequences/HighDegree.lean:271` |
  | `Con` of a principal divisor is principal (Prop. 3.1.9) | `TauCeti.Divisor.conorm_principal`; also `TauCeti.Divisor.conormClassGroup` | `Divisor/Conorm.lean:413`; `:455` |
  | Residue transformation formula (Prop. 4.2.9), rational place | `TauCeti.Place.residue_eq_coeff_laurentSeriesExpansion_mul_derivative` | `Place/Expansion/Laurent/ChangeOfUniformizer.lean:69` |
  | Residue transformation formula, residue-field form | `…residueResidueField_eq_coeff_laurentSeriesExpansionResidueField_mul_derivative` | same file, `:166` |
  | Degree-one places ≅ `Cl⁰(F)` (Prop. 6.1.6(b)) | `TauCeti.Place.degreeOneEquivDegreeZeroClassGroup` | `Elliptic/Basic.lean:167` |
  | Group law on degree-one places (Prop. 6.1.7) | `TauCeti.Place.degreeOneAddEquivDegreeZeroClassGroup`, `TauCeti.Place.degreeOneAddCommGroup_add_eq_iff` | `Elliptic/Basic.lean:264`, `:294` |
  | 12D: Weil divisors on the model ≅ `Divisor k F`, principal divisors matched | `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.equivFunctionFieldDivisor`, `…equivFunctionFieldDivisor_principal` | `AlgebraicGeometry/WeilDivisor/Scheme/FunctionField.lean:78`, `:380` |

  The FieldTheory paths are under `TauCeti/FieldTheory/FunctionField/`. For Prop. 4.2.9, keep as a target only the part neither pinned form covers: non-rational places with separable residue extension.

## R04 (P3) — Three headline theorems are not cited at their layer, though the README and `Suggested.lean` say every headline is

- **Location.**
  - The `Suggested.lean` docstring: "is cited at its layer of the README by its pinned name".
  - README lines 352–354.
  - The Layer 11 bullet "The Hurwitz `84(g−1)` bound" (lines 1545–1551), which states the bound "for `g ≥ 2` and `char k = 0` (or `gcd(|G|, char k) = 1`) … `G ≤ Aut(F/k̄)`".
- **Claim.**
  - Three headlines are cited at no layer:
    - genus invariance under finite separable constant extension (Layer 8);
    - the hyperelliptic genus (Layer 10);
    - the Hurwitz bound (Layer 11).
  - Layer 11 also states the bound below the pinned generality.
- **Witness.**
  - `genus_eq_genus_of_constantCompositum_eq_top` occurs only at line 353.
  - `natCard_le_eighty_four_mul_genus_sub_one` occurs only at line 354.
  - `genus_eq_of_sq_eq` occurs only at line 1818.
  - The pinned bound (`Automorphism/HurwitzBound.lean:83`) allows any exact `k` and tame places over `F^G`.
- **Repair.**
  - **Layer 8, constant-extension bullet.** Cite `TauCeti.genus_eq_genus_of_constantCompositum_eq_top`: `k′/k` finite separable, `k` exact in `F`, `F′ = F·k′`.
  - **Layer 10, hyperelliptic bullet.** Cite `TauCeti.genus_eq_of_sq_eq`: `2 ≠ 0` in `k`, `f` squarefree with `deg f > 0`, `y² = f`, so `g = (deg f − 1)/2`.
  - **Layer 11, Hurwitz-bound bullet.** Cite `TauCeti.natCard_le_eighty_four_mul_genus_sub_one` with its hypotheses, and keep the `k̄`/gcd statement as a special case.

## R05 (P3) — The route decision and the scheme-side inventory say the pins have no scheme divisors, dimension theory or coherent cohomology; they do

- **Location.**
  - README lines 41–43: "where it is empty (no coherent cohomology, no scheme dimension theory, no divisors on schemes".
  - Lines 309–310: "No divisors, no `Pic(X)`, no dimension theory, no coherent cohomology".
- **Claim.** These library "lacks" claims are false at the pins. They also contradict the README's own Layer 12D–12E citations of pinned scheme divisors and cohomology.
- **Witness.**
  - Mathlib pin: `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`, `Mathlib/AlgebraicGeometry/OrderOfVanishing.lean`, and `ringKrullDim_stalk_eq_coheight` (`Mathlib/AlgebraicGeometry/Properties.lean:375`).
  - Tau Ceti pin: `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/` and `Curves/Genus/BaseChange.lean`.
- **Repair.**
  - State the inventory as it is at the pins:
    - Mathlib has algebraic cycles, order of vanishing and stalk dimension, but no `Pic`, no named `ℙⁿ` and no coherent cohomology.
    - Tau Ceti has scheme Weil divisors over a field and the `H⁰`/`H¹` comparisons cited in 12E.
  - Justify the function-field-first route by the proof of Riemann–Roch, not by an empty scheme side.

## R06 (P3) — "Portfolio ownership": what BelyiMaps is said to consume is not what BelyiMaps cites

- **Location.** README lines 32–34: "`BelyiMaps` consumes the pinned carriers `TauCeti.IsFunctionField`, `TauCeti.Place` and `TauCeti.Divisor`".
- **Claim.** The cross-roadmap claim does not resolve against BelyiMaps as it stands.
- **Witness.**
  - BelyiMaps on main, README lines 544 and 546 (lines 561 and 563 at its open revision #767), lists as "exact declarations":
    - `AlgebraicCurves.IsFunctionField`, `AlgebraicCurves.Place`, `AlgebraicCurves.Divisor`;
    - `AlgebraicCurves.riemannRochSpace`, `AlgebraicCurves.genus`.
  - None of these exists at the pins or in this `Suggested.lean`.
- **Repair.**
  - State the supply from this side: "supplies BelyiMaps the pinned `TauCeti.IsFunctionField`, `TauCeti.Place`, `TauCeti.Divisor`, `TauCeti.riemannRochSpace` and `TauCeti.genus`".
  - In the consumers section, record that BelyiMaps' supplier table must name these pinned declarations.
  - Keep "does not define a parallel place, divisor, or Riemann–Roch theory". It is true: BelyiMaps on main, lines 183–186.

## R07 (P3) — Wrong pinned file path

- **Location.** README line 346: `TauCeti/FieldTheory/FunctionField/Elliptic/WeierstrassEquation.lean`.
- **Claim.** No file with that path exists at the pinned Tau Ceti.
- **Witness.** `TauCeti.Place.exists_isWeierstrassCoordinates_of_genus_eq_one` is declared at `TauCeti/FieldTheory/FunctionField/Elliptic/Weierstrass/Equation.lean:343`. `ls` of the cited path fails at the pin.
- **Repair.** Replace the path with `TauCeti/FieldTheory/FunctionField/Elliptic/Weierstrass/Equation.lean`.

## R08 (P3) — README shape and timeless wording

- **Location.**
  - The headings at lines 78, 107, 163, 183, 370, 400, 1874 and 1986.
  - "a future … roadmap" at lines 67, 81, 89, 102, 668, 691, 1134, 1410, 1790, 1942, 1973 and 2048.
  - "no further current consumer" (line 1918) and "no current roadmap owns" (lines 2046–2047).
  - "of the day" (line 1744) and "until that exact native" (line 1577).
  - Drafting and maintainer instructions at lines 1908–1911 and 2022–2024.
  - "*(Library list.)*" at lines 1956–1984.
  - LocalFieldsRamification cited without a section at lines 1115 and 1924.
- **Claim.** The README lacks the house sections and carries process wording.
- **Witness.**
  - There is no `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build` or `## Downstream consumers`.
  - CurvesOverFiniteFields and HyperellipticCurves are already in the merge order, so "future" is stale.
  - LocalFieldsRamification's Herbrand and Hasse–Arf results are in its Layer 3.
- **Repair.**
  - Open with a `**Summary.**` paragraph.
  - Merge "Scope boundaries" and "Portfolio ownership" into `## Scope and ownership`.
  - Merge "Standing hypotheses" and "Pinned conventions" into `## Conventions`.
  - Build `## Exact supplier contracts` with these subsections:
    - From Mathlib;
    - From Tau Ceti (the carriers and the headline names);
    - From TauCetiRoadmap.FormalLaurentPuiseux §L1–L3;
    - From TauCetiRoadmap.LocalFieldsRamification Layer 3;
    - From TauCetiRoadmap.JacobianChallenge Layers A–B.
  - Move the consumer rows and Coordination's consumer paragraphs into `## Downstream consumers`. Name consumers without "future" or "current".
  - Delete "of the day", "until … available", the drafting and maintainer instructions, and the "(Library list.)" markers.

## R09 (P3) — Two cited works are not in the roadmap's source manifest

- **Location.** README References: line 1954 (Q. Liu, *Algebraic Geometry and Arithmetic Curves*, Ch. 7; also cited at line 1565) and lines 1982–1983 (H.-W. Henn, *Funktionenkörper mit großer Automorphismengruppe*; also cited at line 1784).
- **Claim.** Every cited work must be recorded in the roadmap's `sources.toml`.
- **Witness.** The package `sources.toml` records 11 ids:
  - `Stichtenoth2009`, `Hartshorne1977`, `Serre1979`, `Fulton2008`, `Deuring1973`, `Goldschmidt2003`;
  - `Rosen2002`, `VillaSalvador2006`, `Roquette1970`, `Stichtenoth1973a`, `Stichtenoth1973b`.

  `grep -i 'liu\|henn'` on it finds nothing.
- **Repair.** Record both through the sources service, with the locators the README uses: Liu Ch. 7, and Henn's main theorem. Mark each `uncertified` if no legal copy is found.

## Previous findings

- R01 — not repaired: the worker's gate at 81fee5f still reports `outside-folder=2 … FAIL`, on `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`.
- R02 — not repaired: line 1455 still says "the general-`n` equality is built here", and "hypotheses of record, all four required" still stands at line 1442.
- R03 — not repaired: lines 621–628, 652, 751–753, 1230–1233, 1309–1311 and 1741–1747 still plan Prop. 1.5.9, 1.5.14, 1.6.6, 3.1.9, 4.2.9, 6.1.6(b)/6.1.7 and the 12D dictionary without their pinned names.
- R04 — not repaired: `genus_eq_genus_of_constantCompositum_eq_top`, `natCard_le_eighty_four_mul_genus_sub_one` and `genus_eq_of_sq_eq` still occur only at lines 353, 354 and 1818. Layer 11 still reads "for `g ≥ 2` and `char k = 0` (or `gcd(|G|, char k) = 1`)".
- R05 — not repaired: line 42 still reads "no coherent cohomology, no scheme dimension theory, no divisors on schemes", and lines 309–310 still read "No divisors, no `Pic(X)`, no dimension theory".
- R06 — not repaired: lines 32–34 still read "`BelyiMaps` consumes the pinned carriers `TauCeti.IsFunctionField`, `TauCeti.Place` and `TauCeti.Divisor`".
- R07 — not repaired: line 346 still names `TauCeti/FieldTheory/FunctionField/Elliptic/WeierstrassEquation.lean`.
- R08 — not repaired: the headings are still "Scope boundaries (what is deliberately not here)", "Standing hypotheses", "Pinned conventions", "What Mathlib already has (consume)"; "a future CurvesOverFiniteFields roadmap" is still at line 67.
- R09 — not repaired: the package `sources.toml` still has 11 ids, none for Liu or Henn.

No repair was made, so no repair introduced a new problem.

## Verified sound

**The change set.**
- `git diff 30817b18 HEAD -- TauCetiRoadmap/AlgebraicCurves` is empty.
- `git diff 30817b18 HEAD -- lake-manifest.json lean-toolchain` is empty.
- The only change since the last review is in `TauCetiRoadmap/ReductiveGroups/`, a registered folder of this pull request with a review of its own.
- No passage of this folder changed, so the full review steps had nothing new to apply to.

**Gate.**
- The worker's gate at 81fee5f: every scanner reports 0, including `build=0`, `depcheck=0`, `stray-files=0` and `statement-hygiene=0`. The one exception is `outside-folder=2` (R01).
- This review also ran the gate without the pull request's folder registration. It then lists the files of the sibling folders too (`outside-folder=35`).
- Excluding the 17 registered folders by hand leaves exactly the worker's two files.

**Elaboration.**
- `lake env lean TauCetiRoadmap/AlgebraicCurves/Suggested.lean`: exit 0, no messages, 7 s.
- Lean form:
  - one module docstring, titled "…: target signatures", saying that the roadmap is `README.md` and listing the 17 headline names;
  - `namespace TauCetiRoadmap.AlgebraicCurves`;
  - no declarations, no `set_option`, no sorry'd data;
  - a single `import Mathlib`.
- Since the file declares nothing, the `#check`/binder comparison has no declaration to run on, and no padding is possible.

**Headline theorems: all proved at the pin.** A scratch probe ran `#print axioms` on 21 pinned names. Every one reports exactly `[propext, Classical.choice, Quot.sound]`, and none uses `sorryAx`. The names were:
- the 17 headlines named in the `Suggested.lean` docstring:
  - `isFunctionField_iff_trdeg_eq_one`, `Divisor.degree_principal`, `isRiemannRochDivisor_weilDifferentialDivisor`;
  - `Divisor.two_mul_dim_le_degree_add_two`, `hurwitz_genus_formula`, `isDomain_tensorProduct_of_separating`;
  - `genus_eq_genus_of_constantCompositum_eq_top`, `genus_le_genus_of_constantCompositum_eq_top`;
  - `finrank_kaehlerDifferential_eq_one_of_separating`, `finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero`;
  - `genus_eq_of_sq_eq`, `finite_algEquiv_of_two_le_genus`, `natCard_le_eighty_four_mul_genus_sub_one`;
  - `AlgebraicGeometry.twoChartModel`, `AlgebraicGeometry.Scheme.isProjectiveOver_of_isCurveOver`;
  - `AlgebraicGeometry.RegularProjectiveCurveCat.equivFunctionFieldCat`, `AlgebraicGeometry.twoChartModel.genus_eq_genus`;
- four names behind the findings: `Place.ramificationIdx_eq_of_pow_eq`, `Place.differentExponent_add_one_eq_of_pow_eq`, `Place.degreeOneAddEquivDegreeZeroClassGroup`, `AlgebraicGeometry.SchemeWeilDivisor.equivFunctionFieldDivisor`.

So an empty `Suggested.lean` is correct. No statable headline is missing.

**Dependency check.**

```
depcheck: 239 roadmaps, 2349 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The suppliers JacobianChallenge, FormalLaurentPuiseux and LocalFieldsRamification (Completed) are all on main at bebc607.

**Pinned declarations opened this round (file:line at the pin).**
- `TauCeti/FieldTheory/FunctionField/`:
  - `Different/Radical.lean:259` and `:269`, with the section variables at lines 69–73;
  - `Differential/Dimension.lean:245`;
  - `Differential/CanonicalDivisor.lean:365`;
  - `Consequences/HighDegree.lean:271`;
  - `Divisor/Conorm.lean:413` and `:455`;
  - `Place/Expansion/Laurent/ChangeOfUniformizer.lean:69` and `:166`;
  - `Elliptic/Basic.lean:167`, `:264` and `:294`;
  - `Elliptic/Weierstrass/Equation.lean:343`;
  - `Automorphism/HurwitzBound.lean:83`;
  - `ConstantExtension/Genus/Basic.lean:273`;
  - `Hyperelliptic/Genus/Basic.lean:339`.
- `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/FunctionField.lean:78` and `:380`.
- Mathlib: `AlgebraicGeometry/AlgebraicCycle/Basic.lean`, `AlgebraicGeometry/OrderOfVanishing.lean`, and `AlgebraicGeometry/Properties.lean:375`.

**Cross-roadmap citations resolved this round.**
- BelyiMaps on main: lines 183–186 (deferral) and lines 544 and 546 (its supplier table).
- BelyiMaps at #767: lines 561 and 563.
- The citations tool reports no cross-roadmap citation or Lean name of this README as found nowhere.
- `scratch/overlaps.md`: no id cited here is dropped by an open pull request, no id is defined only by an open revision, and no id of this folder is dropped.

**Overlap with open pull requests.**
- #1807 conflicts in this folder. The pull request's description states the order (#1101 → #1807 → this pull request), so this is not a finding.
- #1808 changes this roadmap, but its conflicts with this pull request are all in other folders.
- Closest in vocabulary: CanonicalModelsAndGonality (#1726), which defers places, divisors and Riemann–Roch to AlgebraicCurves (previous review, its line 28). No second owner was found.

**Seeded sample.** None of the three targets lies in a changed passage. The incremental checks were:
- *Riemann–Hurwitz* (line 864). Fulton2008 lines 4266–4280 were re-read. Problem 8.36 begins on printed p. 110, and part (c), the formula in characteristic 0, is on printed p. 111. It is the special case `[k′ : k] = 1`, with tame `deg Diff = Σ(e − 1)`, of the cross-multiplied form stated at line 867.
- *Portfolio ownership.* It still fails as R06; the BelyiMaps lines were re-resolved this round.
- *Route decision (pinned).* Its library claims still fail as R05, rechecked at the Mathlib pin.

**Remarks on untouched text.** None beyond the carried findings.

### Adversarial table

Rows marked *r51* are carried from the previous report, `PRREVIEW-AlgebraicCurves_r51`, because the folder and the pins are unchanged. Rows marked *r53* were recomputed this round for the targets a finding touches.

| Statement | Instances tried | Values computed (left / right) | Result | Change | From |
|---|---|---|---|---|---|
| `isFunctionField_iff_trdeg_eq_one` [EssFiniteType] | `F = k`; `RatFunc k`; `k(x, y)`; algebraic closure of `k(x)` | false/0; true/1; false/2; without `EssFiniteType`: false vs 1 | holds; `EssFiniteType` load-bearing | none | r51 |
| `Divisor.degree_principal` (no exactness) | `x ∈ k(x)`; `x − i ∈ ℂ(x)/ℝ`; `c ∈ kˣ` | `1 − 1 = 0`; `2 − 2 = 0`; `0` | holds | none | r51 |
| Riemann–Roch, `W = −2P_∞`, `g = 0` | `D = 0, 3P_∞, −P_∞`; `ℂ(x)/ℝ` | `1 = 0+1+0`; `4 = 3+1+0`; `0 = −1+1+0`; `ℓ(0) = 2`, excluded by exactness | holds | none | r51 |
| Clifford, arbitrary exact `k` | `g = 0`; `g = 1`, `deg 0`; `g = 2`, `D = W` | vacuous; `2 ≤ 2`; `4 ≤ 4` | holds | none | r51 |
| Hurwitz, cross-multiplied | identity; `y² = x³ − x`/ℚ; `y² + y = x³`/𝔽₂ | `2g−2 = 2g−2+0`; `0 = −4+4`; `0 = −4+4` (wild, `d = 4`) | holds | none | r51 |
| Hurwitz, `y² = x⁵ − 1` over ℚ | branch places `(x−1)` (deg 1), `Φ₅` (deg 4), `∞` (deg 1) | `deg Diff = 1+4+1 = 6`; `1·(2g′−2) = 2·(−2)+6 = 2`, so `g′ = 2` | holds | none | r53 |
| Hurwitz: inputs of the two negative examples | `𝔽_p(s, x)/k(x)`; `𝔽_p(s, x)` over `𝔽_p(t)` | `k′ = 𝔽_p(s)` inseparable over `k`; the first breaks `F′/F` separable, the second exactness | correct | none | r51 |
| `isDomain_tensorProduct_of_separating` | `A = k`; `ℂ ⊗_ℝ ℂ(x)`; `y^p = a + bx^p` | domain; `≅ ℂ(x)²`, excluded by exactness; nilpotent, excluded by separating hypothesis | holds | none | r51 |
| `genus_eq_genus_of_constantCompositum_eq_top` | `k′ = k`; `y² = x³ − t`, `k′ = 𝔽₃(t^{1/3})` | `g = g`; `1 → 0`, excluded by `[IsSeparable k k′]` | holds | R04 | r51 |
| `genus_le_genus_of_constantCompositum_eq_top` | `ℂ(x)/ℝ`, `k′ = ℂ`; `y² = x^p − t` | `0 ≤ 0`; `0 ≤ (p−1)/2` | holds | none | r51 |
| `finrank_kaehlerDifferential_eq_one_of_separating` | `k(x)`; `y^p = a + bx^p` | dim 1; no separating element, excluded | holds | none | r51 |
| Residue theorem | `dx/x`, `dx` on `k(x)`; `dx/(x²+1)`/ℚ | `1 + (−1) = 0`; `0`; `Tr(1/(2i)) = 0` | holds | none | r51 |
| `genus_eq_of_sq_eq` (ℕ division) | `deg f = 1, …, 6` | `(d−1)/2 = 0, 0, 1, 1, 2, 2` against the known genera `0, 0, 1, 1, 2, 2` | holds | R04 | r53 |
| `finite_algEquiv_of_two_le_genus` | `g = 0`; `g = 1`; Klein quartic | `PGL₂(k)` infinite (excluded); `E(k)` infinite (excluded); `168` | holds | none | r51 |
| `natCard_le_eighty_four_mul_genus_sub_one` | `G = 1`; Klein, `g = 3`; Hermitian `q = 41` (wild) | `1 ≤ 84`; `168 = 84·2`; `68921 > 68796`, excluded by tameness | holds over any exact `k` | R04 | r53 |
| Kummer `e`, `d`, pinned general `n` | `y³ = x`/ℚ (no `ζ₃`) at `P_(x)`, `P_∞`, other `P` | `e = 3/gcd(3,1) = 3`, `d = 2`; `e = 3`; `e = 3/3 = 1`; Hurwitz `2g′−2 = −6+2+2`, so `g′ = 0` | holds without (c) | R02 | r53 |
| Kummer, (d) failing | `y⁴ = x²` with `F′ = F(y)`, `y² = x` | at `P_(x)`: `4/gcd(4,2) = 2`, which is the true `e` of `y² = x` | holds without (d) | R02 | r53 |
| Degree-one places ≅ `Cl⁰(F)` | `y² = x³ − x` over ℚ | 4 degree-one places (`O`, `(0,0)`, `(±1,0)`); `Cl⁰ ≅ E(ℚ) ≅ (ℤ/2)²`, order 4 | holds | R03 | r53 |
| Negative control `y² = x³ + a` over `𝔽₂(a)` | `F/k(y)` of degree 3 | `2g−2 = −6+4+2 = 0`, so `g = 1`; `Δ = 0` | correct | none | r51 |
| Artin–Schreier infinity chart | `w + w² + z³ = 0` | `ord w = 3`, `ord z = 1`, `d = 4 = (2−1)(3+1)` | correct | none | r51 |
| Fierce `V₄` example | `y² + ty = s`, `z² + tz = u` | `e = 1`, `f_ins = 4`, `d = 2`; Hilbert sum `3`; `f·d = 8` | correct | none | r51 |
| Imperfect constant extension | `P = (t^p − a)`; `P = (t)` | `e = p`; `e = 1`, purely inseparable residue extension of degree `p` | correct | none | r51 |
| Plane curve `genus_eq_of_isHomogeneous` | `d = 1, 2, 3, 4` | `0, 0, 1, 3` | holds | none | r51 |
| Weierstrass gaps, `y² = x⁵ − 1` | branch point; `(0, i)` | `{1, 3}`; `{1, 2}` | correct | none | r51 |
| Anti-equivalence | `ℙ¹ ↔ k(x)`; `ℂ(x)` over ℝ | dominant morphisms correspond to `k`-algebra maps; `ℙ¹_ℂ` over ℝ ↔ `ℂ(x)` | holds | none | r51 |

## Not verifiable

- **Stichtenoth2009** (settled as uncertified, paywalled). Not read: Thm. 3.4.13, Prop. 3.7.3 and the other Stichtenoth numbers. The statements were checked mathematically and against the pin; Hurwitz was also checked against Fulton2008 lines 4266–4280.
- **Hartshorne1977, Deuring1973, Goldschmidt2003, VillaSalvador2006, Rosen2002, Serre1979, Roquette1970, Stichtenoth1973a, Stichtenoth1973b.** All settled as uncertified; none was read.
- **Liu2002, Henn1978.** These are not in the manifest (R09). This review edits no manifest and did not fetch them.

## Source issues

- none
