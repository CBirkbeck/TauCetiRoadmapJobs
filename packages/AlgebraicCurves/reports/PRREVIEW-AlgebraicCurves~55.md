# Review of AlgebraicCurves (pull request #1854 at ca8a8df)

**Verdict:** needs changes

This is an incremental re-review of 0 changed lines since 81fee5f.
- `git diff 81fee5f HEAD -- TauCetiRoadmap/AlgebraicCurves lake-manifest.json lean-toolchain` is empty, so the folder and the pins are the same.
- Eight findings are carried under their old numbers:
  - R01, because the gate still fails;
  - R02–R08, because the folder is byte-identical.
- R09 is repaired, in the package manifest.
- R10 is new. Since 81fee5f, #1808's head has moved, and both #1807 and #1808 now carry a rewritten copy of this folder that conflicts with this head.
- All findings are P3; none is blocking.
- The gate fails (`outside-folder=2`), so the folder cannot be accepted at this head.

## R01 (P3) — Gate fails: two edits outside the pull request's roadmap folders

- **Location.** `Completed/ArithmeticDirichletSeries/README.md` (1 line) and `TauCetiRoadmap/SymplecticGeometry/README.md` (3 lines).
- **Claim.** The pull request edits two folders that are not among its 17 registered roadmap folders. While the gate fails, no folder of this pull request can be accepted.
- **Witness.**
  - The worker's gate at ca8a8df reports `outside-folder=2 … FAIL` and lists exactly these two files.
  - `git diff --stat origin/main...HEAD`, with the 17 registered folders excluded, gives `2 files changed, 4 insertions(+), 4 deletions(-)`.
- **Repair.** Do one of the following, then rerun the gate and expect `outside-folder=0`:
  - move both hunks into a pull request of their own; or
  - register `Completed/ArithmeticDirichletSeries/` and `TauCetiRoadmap/SymplecticGeometry/` as folders of this pull request.

  #1808 now also changes both files, so the first option may come for free once the order with #1808 is settled (R10).

## R02 (P3) — Layer 10 Kummer covers: the general-`n` ramification data is already pinned, under fewer hypotheses than listed

- **Location.** `TauCetiRoadmap/AlgebraicCurves/README.md` lines 1441–1456. Quoted: "hypotheses of record, all four required … Only after (a)–(d): the ramification data `e(P′∣P) = n / r_P` … the general-`n` equality is built here".
- **Claim.**
  - The README plans to build a theorem the pin already proves.
  - It says the ramification index and different exponent need (c), a primitive `n`-th root of unity, and (d), irreducibility of `Tⁿ − u`. They need neither.
- **Witness.**
  - `TauCeti.Place.ramificationIdx_eq_of_pow_eq` (`TauCeti/FieldTheory/FunctionField/Different/Radical.lean:259`) and `TauCeti.Place.differentExponent_add_one_eq_of_pow_eq` (`:269`) are sorry-free.
  - Their hypotheses are `F⟮y⟯ = ⊤`, `yⁿ = u`, `(n : k) ≠ 0` and `u ≠ 0`. The section variables add only that `F′/F` is finite and separable.
- **Repair.**
  - Cite both pinned names for every `n`, with those hypotheses.
  - Delete "the general-`n` equality is built here".
  - Say that (c) and (d) are needed only for the cyclic Galois structure, for `[F′ : F] = n`, and for the closed genus formula.
  - Keep the prime-`n` and `r_P = 1` names as corollaries.
  - Tested on `y³ = x` over `ℚ(x)`, where (c) fails: at `P_(x)` the formula gives `e = 3, d = 2`.
  - Tested on `y⁴ = x²` with `F′ = F(y)`, where (d) fails: at `P_(x)` it gives `e = 4/gcd(4, 2) = 2`.

## R03 (P3) — Results proved at the pin are planned as targets without their pinned names

- **Location.** The rule is stated at README lines 372–373: "where it does, the layer cites the pinned name and states the remaining targets against it". It is broken at:
  - lines 621–628 (Prop. 1.5.9, Thm. 1.5.14);
  - line 652 (Prop. 1.6.6);
  - lines 751–753 (Prop. 3.1.9);
  - lines 1230–1233 (Prop. 4.2.9);
  - lines 1309–1311 (Prop. 6.1.6(b), 6.1.7);
  - lines 1741–1747 (12D).
- **Claim.** These bullets plan, as work still to do, statements the pinned Tau Ceti proves. That is duplication by object.
- **Witness.** `TauCeti.Place.degreeOneAddEquivDegreeZeroClassGroup` (`FieldTheory/FunctionField/Elliptic/Basic.lean:264`) proves Prop. 6.1.6(b)/6.1.7, sorry-free. `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.equivFunctionFieldDivisor` (`AlgebraicGeometry/WeilDivisor/Scheme/FunctionField.lean:78`) is the 12D dictionary.
- **Repair.** At each bullet, cite the pinned name with its pinned hypotheses, and keep as targets only what remains. Every row is unchanged at the pin; the FieldTheory paths are under `TauCeti/FieldTheory/FunctionField/`.

  | README result | Pinned name | File and line |
  |---|---|---|
  | `dim_F Ω_F = 1` (Prop. 1.5.9) | `TauCeti.finrank_weilDifferentialSpace` | `Differential/Dimension.lean:245` |
  | `L(W − D) ≃ Ω_F(D)` (Thm. 1.5.14) | `TauCeti.riemannRochSpaceEquivWeilDifferentialFiltration` | `Differential/CanonicalDivisor.lean:365` |
  | `(x)_∞ = nP`, `n ≥ 2g` (Prop. 1.6.6) | `TauCeti.Place.exists_poles_eq_natCast_zsmul_ofPoint` | `Consequences/HighDegree.lean:271` |
  | `Con` of a principal divisor (Prop. 3.1.9) | `TauCeti.Divisor.conorm_principal`, `TauCeti.Divisor.conormClassGroup` | `Divisor/Conorm.lean:413`, `:455` |
  | Residue transformation (Prop. 4.2.9) | `TauCeti.Place.residue_eq_coeff_laurentSeriesExpansion_mul_derivative`; residue-field form `…residueResidueField_eq_coeff_laurentSeriesExpansionResidueField_mul_derivative` | `Place/Expansion/Laurent/ChangeOfUniformizer.lean:69`, `:166` |
  | Degree-one places ≅ `Cl⁰(F)` (Prop. 6.1.6(b)) | `TauCeti.Place.degreeOneEquivDegreeZeroClassGroup` | `Elliptic/Basic.lean:167` |
  | Group law (Prop. 6.1.7) | `TauCeti.Place.degreeOneAddEquivDegreeZeroClassGroup`, `TauCeti.Place.degreeOneAddCommGroup_add_eq_iff` | `Elliptic/Basic.lean:264`, `:294` |
  | 12D dictionary, principal divisors matched | `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.equivFunctionFieldDivisor`, `…equivFunctionFieldDivisor_principal` | `AlgebraicGeometry/WeilDivisor/Scheme/FunctionField.lean:78`, `:380` |

  For Prop. 4.2.9, keep as a target only non-rational places with separable residue extension.

## R04 (P3) — Three headline theorems are not cited at their layer, though the README and `Suggested.lean` say every headline is

- **Location.**
  - The `Suggested.lean` docstring: "is cited at its layer of the README by its pinned name".
  - README lines 352–354.
  - The Layer 11 bullet "The Hurwitz `84(g−1)` bound" (lines 1545–1551): "for `g ≥ 2` and `char k = 0` (or `gcd(|G|, char k) = 1`) … `G ≤ Aut(F/k̄)`".
- **Claim.**
  - Three headlines are cited at no layer:
    - genus invariance under finite separable constant extension (Layer 8);
    - the hyperelliptic genus (Layer 10);
    - the Hurwitz bound (Layer 11).
  - Layer 11 also states the bound below the pinned generality.
- **Witness.**
  - `grep -n` at this head finds `genus_eq_genus_of_constantCompositum_eq_top` only at line 353 and `natCard_le_eighty_four_mul_genus_sub_one` only at line 354.
  - It finds `genus_eq_of_sq_eq` only at line 1818, in the worked examples.
  - The pinned bound (`Automorphism/HurwitzBound.lean:83`) allows any exact `k` and places tame over `F^G`.
- **Repair.**
  - **Layer 8, constant-extension bullet.** Cite `TauCeti.genus_eq_genus_of_constantCompositum_eq_top`: `k′/k` finite separable, `k` exact in `F`, `F′ = F·k′`.
  - **Layer 10, hyperelliptic bullet.** Cite `TauCeti.genus_eq_of_sq_eq`: `2 ≠ 0` in `k`, `f` squarefree with `deg f > 0`, `y² = f`, so `g = (deg f − 1)/2`.
  - **Layer 11, Hurwitz-bound bullet.** Cite `TauCeti.natCard_le_eighty_four_mul_genus_sub_one` with its hypotheses. Keep the `k̄`/gcd statement as the special case `…_of_not_dvd` (`:166`), and the characteristic-0 statement as `…_of_charZero` (`:186`).

## R05 (P3) — The route decision and the scheme-side inventory say the pins have no scheme divisors or dimension theory; they do

- **Location.**
  - README lines 41–43: "no coherent cohomology, no scheme dimension theory, no divisors on schemes".
  - Lines 309–310: "No divisors, no `Pic(X)`, no dimension theory, no coherent cohomology".
- **Claim.** These "lacks" claims are false at the pins. They also contradict the README's own Layer 12D–12E citations.
- **Witness.**
  - Mathlib pin: `AlgebraicGeometry.AlgebraicCycle.weilDivisors` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:164`), `Mathlib/AlgebraicGeometry/OrderOfVanishing.lean`, and `ringKrullDim_stalk_eq_coheight` (`Mathlib/AlgebraicGeometry/Properties.lean:375`).
  - Tau Ceti pin: `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/`.
- **Repair.**
  - State the inventory as it is at the pins:
    - Mathlib has Weil divisors as algebraic cycles, order of vanishing and stalk dimension, but no `Pic`, no named `ℙⁿ` and no finiteness theorem for coherent cohomology.
    - Tau Ceti has scheme Weil divisors with principal divisors, and the `H⁰`/`H¹` comparisons of 12E.
  - Justify the function-field-first route by the proof of Riemann–Roch, not by an empty scheme side.

## R06 (P3) — "Portfolio ownership": what BelyiMaps is said to consume is not what BelyiMaps cites

- **Location.** README lines 32–34: "`BelyiMaps` consumes the pinned carriers `TauCeti.IsFunctionField`, `TauCeti.Place` and `TauCeti.Divisor`".
- **Claim.** The claim does not resolve against BelyiMaps on main.
- **Witness.**
  - BelyiMaps on main (db5e748), README lines 544 and 546, lists as "exact declarations":
    - `AlgebraicCurves.IsFunctionField`, `AlgebraicCurves.Place`, `AlgebraicCurves.Divisor`;
    - `AlgebraicCurves.riemannRochSpace`, `AlgebraicCurves.genus`.
  - None of these exists at the pins or in this `Suggested.lean`.
- **Repair.**
  - Say "supplies BelyiMaps the pinned `TauCeti.IsFunctionField`, `TauCeti.Place`, `TauCeti.Divisor`, `TauCeti.riemannRochSpace` and `TauCeti.genus`".
  - In the consumers section, record that BelyiMaps' supplier table must name these pinned declarations.
  - Keep "does not define a parallel place, divisor, or Riemann–Roch theory". It is true: BelyiMaps on main, lines 183–186.

## R07 (P3) — Wrong pinned file path

- **Location.** README line 346: `TauCeti/FieldTheory/FunctionField/Elliptic/WeierstrassEquation.lean`.
- **Claim.** No file with that path exists at the pinned Tau Ceti.
- **Witness.** `ls` of that path fails at the pin. `TauCeti.Place.exists_isWeierstrassCoordinates_of_genus_eq_one` is declared at `TauCeti/FieldTheory/FunctionField/Elliptic/Weierstrass/Equation.lean:343`.
- **Repair.** Replace the path with `TauCeti/FieldTheory/FunctionField/Elliptic/Weierstrass/Equation.lean`.

## R08 (P3) — README shape and timeless wording

- **Location.**
  - The headings at lines 78, 107, 163, 183, 370, 400, 1874 and 1986.
  - "a future … roadmap" at lines 67, 81, 89, 102, 668, 691, 1134, 1410, 1790, 1942, 1973 and 2048.
  - "no further current consumer" (line 1918) and "no current roadmap owns" (lines 2046–2047).
  - "of the day" (line 1744) and "until that exact native" (line 1577).
  - "*(Library list.)*" at lines 1956–1984.
- **Claim.** The README lacks the house sections and carries process wording.
- **Witness.**
  - There is no `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build` or `## Downstream consumers`.
  - CurvesOverFiniteFields and HyperellipticCurves are in the merge order, so "future" is stale.
- **Repair.**
  - Open with a `**Summary.**` paragraph.
  - Merge "Scope boundaries" and "Portfolio ownership" into `## Scope and ownership`.
  - Merge "Standing hypotheses" and "Pinned conventions" into `## Conventions`.
  - Build `## Exact supplier contracts`, with subsections for Mathlib, Tau Ceti, FormalLaurentPuiseux §L1–L3, LocalFieldsRamification Layer 3 and JacobianChallenge Layers A–B.
  - Move the consumer rows into `## Downstream consumers`, without "future" or "current".
  - Delete "of the day", "until … available", the drafting instructions and the "(Library list.)" markers.

## R10 (P3) — #1807 and #1808 now carry a different copy of this folder; the description calls #1808 independent

- **Location.**
  - The description's merge-order paragraph: "#1101 → #1807 → this pull request … #1808 is independent of this pull request".
  - `TauCetiRoadmap/AlgebraicCurves/README.md` and `Suggested.lean` as a whole.
- **Claim.**
  - The heads of #1807 (cabeb14) and #1808 (4322423) both carry a rewritten copy of this folder, and each conflicts with this head in both files.
  - Nothing states the order with #1808.
  - This head's copy is older than the copy carried by the pull request the description puts first.
  - At 81fee5f, #1808's conflicts with this pull request were all outside this folder (previous review). This conflict is new.
- **Witness.** `git merge-file` was run on each file. Base: main's copy, which is the merge-base copy. Ours: this head. Theirs: the copy that `roadmaps show AlgebraicCurves --pr 1807` or `--pr 1808` prints.
  - For each of #1807 and #1808, the README gives 1 conflict hunk spanning nearly the whole file.
  - For each, `Suggested.lean` gives 3 conflict hunks.
- **Repair.**
  - Make this folder byte-identical to #1807's copy, or drop it from this pull request. The description names no loop cut in AlgebraicCurves, and this pull request already took #1807's copy for ComplexKahlerGeometry and GeneralizedCohomology.
  - Then state the order with #1808 in the merge-order paragraph, for example "#1101 → #1807 → #1808 → this pull request".
  - Expect `roadmaps overlaps AlgebraicCurves` to show no conflict of this pull request in this folder.
  - What a rebase on #1807's copy repairs:
    - it carries the repairs of R04, R07 and R08;
    - R02, R03 and R06 stand there unchanged (#1807's README, lines 1801, 739–1645 and 31);
    - its route paragraph still says Mathlib has "no divisor on a scheme" (R05), which #1808's copy corrects.

## Previous findings

- R01 — not repaired: the worker's gate at ca8a8df still reports `outside-folder=2 … FAIL`, on `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`.
- R02 — not repaired: line 1455 still says "the general-`n` equality is built here", and line 1442 still says "hypotheses of record, all four required".
- R03 — not repaired: lines 621–628, 652, 751–753, 1230–1233, 1309–1311 and 1741–1747 still plan Prop. 1.5.9, 1.5.14, 1.6.6, 3.1.9, 4.2.9, 6.1.6(b)/6.1.7 and 12D without pinned names.
- R04 — not repaired: the three names still occur only at lines 353, 354 and 1818. Layer 11 still reads "for `g ≥ 2` and `char k = 0` (or `gcd(|G|, char k) = 1`)".
- R05 — not repaired: line 42 still reads "no coherent cohomology, no scheme dimension theory, no divisors on schemes", and lines 309–310 still read "No divisors, no `Pic(X)`, no dimension theory".
- R06 — not repaired: lines 32–34 still read "`BelyiMaps` consumes the pinned carriers `TauCeti.IsFunctionField`, `TauCeti.Place` and `TauCeti.Divisor`".
- R07 — not repaired: line 346 still names `TauCeti/FieldTheory/FunctionField/Elliptic/WeierstrassEquation.lean`.
- R08 — not repaired: the headings still include "Scope boundaries (what is deliberately not here)", "Standing hypotheses" and "Pinned conventions". Line 67 still reads "a future CurvesOverFiniteFields roadmap".
- R09 — repaired: the package `sources.toml` now records `Liu2002` ("Ch. 7", uncertified, cited for Layer 12) and `Henn1978` (Crelle 302, 96–115, GDZ open scan, cited for the scope exclusion).

The R09 repair touched only the manifest and introduced no problem in the folder; see the Henn remark under Not verifiable.

## Verified sound

**The change set.**
- `git diff 81fee5f HEAD -- TauCetiRoadmap/AlgebraicCurves lake-manifest.json lean-toolchain` is empty.
- Since 81fee5f, changes touch only eight registered sibling folders. Each has a review of its own: AlgebraicTopology, BanachSpaceTheory, BordismFormalGroups, CharacteristicClasses, ClassifyingSpaces, ComplexKahlerGeometry, GeneralizedCohomology and MorseNovikov.
- No passage of this folder changed, so the full review steps had no new passage to apply to.

**Gate.**
- The worker's gate at ca8a8df reports 0 for every scanner except `outside-folder=2` (R01), including `build`, `depcheck`, `stray-files` and `statement-hygiene`.
- This review reran the gate with `--base origin/main`, which does not know the folder registration. It reports `outside-folder=38`.
- `git diff --name-only origin/main...HEAD` lists 40 files: 2 in this folder, 36 in the 16 sibling folders, and the 2 files of R01.

**Elaboration.** `lake env lean TauCetiRoadmap/AlgebraicCurves/Suggested.lean` exits 0 with no messages, in 9 s.
- The file has one module docstring, titled "…: target signatures", which says the roadmap is `README.md`.
- It has `namespace TauCetiRoadmap.AlgebraicCurves`, no declarations, no `set_option`, and a single Mathlib import (`public import Mathlib`).
- With no declaration, there is nothing for the `#check`/binder comparison and no padding. The previous review's `#print axioms` probe on the 17 named headlines is unaffected, because the pins are unchanged.

**Dependency check.**

```
depcheck: 238 roadmaps, 2337 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Pinned declarations reopened this round (file:line at the pin).** Under `TauCeti/FieldTheory/FunctionField/`:
- `Different/Radical.lean:259`, `:269`;
- `Automorphism/HurwitzBound.lean:83`, `:166`, `:186`;
- `Automorphism/HigherGenus.lean:124` (section variable `[IsAlgClosed k]` at `:57`);
- `ConstantExtension/Genus/Basic.lean:273`;
- `Hyperelliptic/Genus/Basic.lean:339`;
- `Elliptic/Basic.lean:264`;
- `Elliptic/Weierstrass/Equation.lean:343`.

Elsewhere at the pins:
- Tau Ceti: `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/FunctionField.lean:78`.
- Mathlib: `AlgebraicGeometry/AlgebraicCycle/Basic.lean:164`, `AlgebraicGeometry/OrderOfVanishing.lean`, `AlgebraicGeometry/Properties.lean:375`.

Every witness of R02–R07 holds unchanged.

**Cross-roadmap citations resolved this round.**
- BelyiMaps on main (db5e748): lines 183–186 and 544, 546.
- The worker's `roadmaps resolve` run reports no citation or Lean name of this README as found nowhere.
- `roadmaps overlaps AlgebraicCurves` (recomputed) finds:
  - no id cited here that an open pull request drops;
  - no id defined only by an open revision;
  - no dropped id of this folder.

**Overlap with open pull requests.**
- #1807 conflicts in this folder. The description states #1807 → this pull request, and the stale-copy consequence is part of R10.
- #1808 conflicts in this folder with no stated order: R10.
- Closest in vocabulary: CanonicalModelsAndGonality (#1726), HyperellipticCurves (#1707) and FunctionFieldArithmetic (#1474). No new ownership question arises from an unchanged folder.

**Seeded sample.** None of the three targets is in a changed passage.
- *Riemann–Hurwitz* (README line 864). Fulton2008 lines 4266–4280 were re-read. Problem 8.36 starts on printed p. 110, and part (c), the formula in characteristic 0, is on printed p. 111. It is the case `[k′ : k] = 1`, tame, of the cross-multiplied form at line 867.
- *Portfolio ownership.* It fails as R06 (rechecked on main).
- *Route decision (pinned).* Its library claims fail as R05 (rechecked at the Mathlib pin).

**Remarks on untouched text.** No R-number and no change requested.
- Layer 11's finiteness headline (lines 1524–1544) is the pinned one: algebraically closed `k`, with the gaps at every place pairwise distinct in `k`.
- That hypothesis fails for the Hermitian curve `y³ + y = x⁴` over `𝔽̄₃`. The semigroup at `P_∞` is `⟨3, 4⟩`, the gaps are `{1, 2, 5}`, and `2 ≡ 5` mod 3. Yet `Aut` is finite there, of order `|PGU₃(3)| = 6048`.
- This README states the hypothesis and puts the general case out of scope (line 1784), so it agrees with itself. #1807's and #1808's copies state the general perfect-field theorem in `Suggested.lean`.

### Adversarial table

No statement changed. Rows marked *r53* are carried from `PRREVIEW-AlgebraicCurves_r53` (some of its rows were themselves carried from r51). Rows marked *r55* were computed this round for the sampled targets and the remark.

| Statement | Instances tried | Values computed (left / right) | Result | Change | From |
|---|---|---|---|---|---|
| `isFunctionField_iff_trdeg_eq_one` [EssFiniteType] | `F = k`; `RatFunc k`; `k(x, y)`; `k(x)` algebraic closure | false/0; true/1; false/2; without `EssFiniteType` false vs 1 | holds; `EssFiniteType` load-bearing | none | r53 |
| `Divisor.degree_principal` | `x ∈ k(x)`; `x − i ∈ ℂ(x)/ℝ`; `c ∈ kˣ` | `1 − 1 = 0`; `2 − 2 = 0`; `0` | holds | none | r53 |
| Riemann–Roch, `W = −2P_∞`, `g = 0` | `D = 0, 3P_∞, −P_∞`; `ℂ(x)/ℝ` | `1 = 0+1+0`; `4 = 3+1+0`; `0 = −1+1+0`; `ℓ(0) = 2` excluded by exactness | holds | none | r53 |
| Clifford, exact `k` | `g = 0`; `g = 1`, `deg 0`; `g = 2`, `D = W` | vacuous; `2 ≤ 2`; `4 ≤ 4` | holds | none | r53 |
| Hurwitz, cross-multiplied (sample) | identity; `y² = x³ − x`/ℚ; `y² + y = x³`/𝔽₂ | `2g−2 = 2g−2+0`; `0 = −4+4`; `0 = −4+4` (wild, `d = 4`) | holds | none | r53 |
| Hurwitz, `y² = x⁵ − 1`/ℚ (sample) | branch `(x−1)`, `Φ₅`, `∞` | `deg Diff = 1+4+1 = 6`; `2g′−2 = −4+6 = 2`, `g′ = 2` | holds | none | r53 |
| Hurwitz vs Fulton 8.36(c) (sample) | `[k′:k] = 1`, char 0, `y² = x³ − x` over `x` | Fulton: `0 = 2·(−2) + 4`; README form: `1·0 = 2·(−2) + 1·4` | agree | none | r55 |
| Route decision: pins lack scheme divisors (sample) | Mathlib `AlgebraicCycle.weilDivisors`, `ringKrullDim_stalk_eq_coheight` | README: none / pin: `Basic.lean:164`, `Properties.lean:375` present | claim false | R05 | r55 |
| Portfolio ownership: BelyiMaps consumes `TauCeti.*` (sample) | BelyiMaps main lines 544, 546 | README: `TauCeti.*` / BelyiMaps: `AlgebraicCurves.*`, 0 of 5 names exist | claim fails | R06 | r55 |
| `isDomain_tensorProduct_of_separating` | `A = k`; `ℂ ⊗_ℝ ℂ(x)`; `y^p = a + bx^p` | domain; `≅ ℂ(x)²` excluded by exactness; nilpotent excluded | holds | none | r53 |
| `genus_eq_genus_of_constantCompositum_eq_top` | `k′ = k`; `y² = x³ − t`, `k′ = 𝔽₃(t^{1/3})` | `g = g`; `1 → 0` excluded by separability | holds | R04 | r53 |
| `genus_le_genus_of_constantCompositum_eq_top` | `ℂ(x)/ℝ`, `k′ = ℂ`; `y² = x^p − t` | `0 ≤ 0`; `0 ≤ (p−1)/2` | holds | none | r53 |
| `finrank_kaehlerDifferential_eq_one_of_separating` | `k(x)`; `y^p = a + bx^p` | dim 1; no separating element, excluded | holds | none | r53 |
| Residue theorem | `dx/x`, `dx` on `k(x)`; `dx/(x²+1)`/ℚ | `1 + (−1) = 0`; `0`; `Tr(1/(2i)) = 0` | holds | none | r53 |
| `genus_eq_of_sq_eq` (ℕ division) | `deg f = 1, …, 6` | `(d−1)/2 = 0,0,1,1,2,2` vs genera `0,0,1,1,2,2` | holds | R04 | r53 |
| `finite_algEquiv_of_two_le_genus` | `g = 0`; `g = 1`; Klein quartic | `PGL₂(k)` infinite (excluded); `E(k)` infinite (excluded); `168` | holds | none | r53 |
| `finite_algEquiv_of_two_le_genus`, gap hypothesis (remark) | Hermitian `y³ + y = x⁴` over `𝔽̄₃`, `g = 3` | gaps at `P_∞`: `{1,2,5}`, `2 ≡ 5` (mod 3), hypothesis fails / `|Aut| = 27·28·8 = 6048`, finite | pinned form does not reach it; README states the hypothesis | remark | r55 |
| `natCard_le_eighty_four_mul_genus_sub_one` | `G = 1`; Klein `g = 3`; Hermitian `q = 41` (wild) | `1 ≤ 84`; `168 = 84·2`; `68921 > 68796`, excluded by tameness | holds over any exact `k` | R04 | r53 |
| Kummer `e`, `d`, pinned general `n` | `y³ = x`/ℚ (no `ζ₃`) at `P_(x)`, `P_∞` | `e = 3`, `d = 2`; `e = 3`; Hurwitz `2g′−2 = −6+2+2`, `g′ = 0` | holds without (c) | R02 | r53 |
| Kummer, (d) failing | `y⁴ = x²`, `F′ = F(y)` with `y² = x` | at `P_(x)`: `4/gcd(4,2) = 2`, the true `e` | holds without (d) | R02 | r53 |
| Degree-one places ≅ `Cl⁰(F)` | `y² = x³ − x`/ℚ | 4 degree-one places; `Cl⁰ ≅ (ℤ/2)²`, order 4 | holds | R03 | r53 |
| Negative control `y² = x³ + a`/`𝔽₂(a)` | `F/k(y)` degree 3 | `2g−2 = −6+4+2 = 0`, `g = 1`; `Δ = 0` | correct | none | r53 |
| Artin–Schreier infinity chart | `w + w² + z³ = 0` | `ord w = 3`, `ord z = 1`, `d = 4 = (2−1)(3+1)` | correct | none | r53 |
| Fierce `V₄` example | `y² + ty = s`, `z² + tz = u` | `e = 1`, `f_ins = 4`, `d = 2`; Hilbert sum 3; `f·d = 8` | correct | none | r53 |
| Imperfect constant extension | `P = (t^p − a)`; `P = (t)` | `e = p`; `e = 1`, inseparable residue degree `p` | correct | none | r53 |
| Plane curve genus | `d = 1, 2, 3, 4` | `0, 0, 1, 3` | holds | none | r53 |
| Weierstrass gaps, `y² = x⁵ − 1` | branch point; `(0, i)` | `{1, 3}`; `{1, 2}` | correct | none | r53 |
| Anti-equivalence | `ℙ¹ ↔ k(x)`; `ℂ(x)` over ℝ | dominant maps ↔ `k`-algebra maps; `ℙ¹_ℂ` over ℝ ↔ `ℂ(x)` | holds | none | r53 |

## Not verifiable

- **Henn1978.** The manifest records it as certified, from the GDZ open scan. Its cached extraction holds only the GDZ viewer page, 37 lines with no article text, so the paper was not read. The README cites it only by venue and pages, for a scope exclusion (lines 1784, 1982), so no locator depends on it.
- **Stichtenoth2009, Hartshorne1977, Serre1979, Deuring1973, Goldschmidt2003, Rosen2002, VillaSalvador2006, Roquette1970, Stichtenoth1973a, Stichtenoth1973b, Liu2002.** All are settled as uncertified (paywalled), and none was read. The statements were checked mathematically and against the pins.
- **Ownership against open pull requests.** It was checked only through the roadmaps tool's overlap and vocabulary lists, since the folder is unchanged.

## Source issues

- none
