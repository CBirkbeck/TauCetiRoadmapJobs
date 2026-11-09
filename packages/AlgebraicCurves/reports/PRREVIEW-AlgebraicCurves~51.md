# Review of AlgebraicCurves (pull request #1854 at 30817b1)

**Verdict:** needs changes

Nine findings, all P3; none blocking. The gate fails on two files outside the pull request's registered folders, so the folder cannot be accepted at this head. The mathematics checks out: every headline theorem the README and the `Suggested.lean` docstring name exists at the Tau Ceti pin, elaborates and is free of `sorryAx`. The remaining findings are citation, generality and shape repairs.

## R01 (P3) — Gate fails: two edits outside the pull request's roadmap folders

- **Location.** `Completed/ArithmeticDirichletSeries/README.md` (1 line) and `TauCetiRoadmap/SymplecticGeometry/README.md` (3 lines). The worker's gate at 30817b1 reports `outside-folder=2 … FAIL`.
- **Claim.** The pull request changes two folders that are not among its registered roadmap folders. While the gate fails, no folder of this pull request can be accepted.
- **Witness.** `git diff --stat origin/main...HEAD`, with the 17 registered folders excluded, lists exactly these two files. The description names them as the ArithmeticDirichletSeries and SymplecticGeometry loop cuts.
- **Repair.** Do one of the following, then rerun the gate and expect `outside-folder=0`:
  - move the two hunks into their own pull request; or
  - register `Completed/ArithmeticDirichletSeries/` and `TauCetiRoadmap/SymplecticGeometry/` as folders of this pull request on the board.

## R02 (P3) — Layer 10 Kummer covers: the general-`n` ramification data is already pinned, under fewer hypotheses than listed

- **Location.** `TauCetiRoadmap/AlgebraicCurves/README.md` lines 1441–1456: "hypotheses of record, all four required … Only after (a)–(d): the ramification data `e(P′∣P) = n / r_P` … the general-`n` equality is built here".
- **Claim.**
  - The README plans to build a theorem the pin already proves.
  - It says the ramification index and different exponent need hypothesis (c), a primitive `n`-th root of unity in `k`, and hypothesis (d), irreducibility of `Tⁿ − u`. Neither is needed.
- **Witness.** `TauCeti.Place.ramificationIdx_eq_of_pow_eq` (`TauCeti/FieldTheory/FunctionField/Different/Radical.lean:259`) and `TauCeti.Place.differentExponent_add_one_eq_of_pow_eq` (`:269`). From `F′ = F(y)`, `yⁿ = u ≠ 0`, `n ≠ 0` in `k` and `F′/F` finite separable, they give `e = n / gcd(n, ord_P u)` and `d + 1 = n / gcd(n, ord_P u)`, sorry-free. Test: `y³ = x` over `ℚ(x)`, which has no primitive cube root of unity. At `P_(X)` the formula gives `e = 3` and `d = 2`, which is correct.
- **Repair.**
  - Cite both pinned names for every `n`, with their hypotheses.
  - Delete "the general-`n` equality is built here".
  - Say that (c) and (d) are needed only for the Galois/cyclic structure, for `[F′ : F] = n`, and for the closed genus formula built on them; they are not needed for `e` and `d`.
  - Keep the prime-`n` and `r_P = 1` names as corollaries.

## R03 (P3) — Results proved at the pin are planned as targets without their pinned names

- **Location.** README lines 372–373 state the rule: "where it does, the layer cites the pinned name and states the remaining targets against it". It is broken at:
  - lines 621–628 (Prop. 1.5.9, Thm. 1.5.14);
  - line 652 (Prop. 1.6.6);
  - lines 751–753 (Prop. 3.1.9);
  - lines 1230–1233 (Prop. 4.2.9);
  - lines 1309–1311 (Prop. 6.1.6(b), 6.1.7);
  - lines 1741–1747 (12D).
- **Claim.** These bullets plan, as work still to do, statements the pinned Tau Ceti proves. That is duplication by object.
- **Witness.**
  - Prop. 6.1.6(b)/6.1.7 is `TauCeti.Place.degreeOneAddEquivDegreeZeroClassGroup` (`Elliptic/Basic.lean:264`), sorry-free.
  - The 12D dictionary is `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.equivFunctionFieldDivisor` (`AlgebraicGeometry/WeilDivisor/Scheme/FunctionField.lean:78`, principal divisors at `:380`).
- **Repair.** Cite at each bullet, with the pinned hypotheses, and keep as targets only what remains:

  | README result | Pinned name | File and line |
  |---|---|---|
  | `dim_F Ω_F = 1` (Prop. 1.5.9) | `TauCeti.finrank_weilDifferentialSpace` | `Differential/Dimension.lean:245` |
  | Duality `L(W − D) ≃ Ω_F(D)` (Thm. 1.5.14) | `TauCeti.riemannRochSpaceEquivWeilDifferentialFiltration` | `Differential/CanonicalDivisor.lean:365` |
  | `(x)_∞ = nP` for `n ≥ 2g` (Prop. 1.6.6) | `TauCeti.Place.exists_poles_eq_natCast_zsmul_ofPoint` | `Consequences/HighDegree.lean:271` |
  | `Con` of a principal divisor is principal (Prop. 3.1.9) | `TauCeti.Divisor.conorm_principal` (also `conormClassGroup`, `:455`) | `Divisor/Conorm.lean:413` |
  | Residue transformation formula (Prop. 4.2.9), rational place | `TauCeti.Place.residue_eq_coeff_laurentSeriesExpansion_mul_derivative` | `Place/Expansion/Laurent/ChangeOfUniformizer.lean:69` |
  | Residue transformation formula, residue-field form | (residue-field version of the above) | same file, `:166` |
  | Degree-one places ≅ `Cl⁰(F)` (Prop. 6.1.6(b)) | `TauCeti.Place.degreeOneEquivDegreeZeroClassGroup` | `Elliptic/Basic.lean:167` |
  | Group law on degree-one places (Prop. 6.1.7) | `TauCeti.Place.degreeOneAddEquivDegreeZeroClassGroup`, `TauCeti.Place.degreeOneAddCommGroup_add_eq_iff` | `Elliptic/Basic.lean:264`, `:294` |
  | 12D: Weil divisors on the model ≅ `Divisor k F` | `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.equivFunctionFieldDivisor` and `…_principal` | `AlgebraicGeometry/WeilDivisor/Scheme/FunctionField.lean:78`, `:380` |

  The FieldTheory paths are under `TauCeti/FieldTheory/FunctionField/`; the 12D path is under `TauCeti/`. For Prop. 4.2.9, keep as a target only the part neither pinned form covers: non-rational places with separable residue extension.

## R04 (P3) — Three headline theorems are not cited at their layer, though the README and `Suggested.lean` say every headline is

- **Location.**
  - The `Suggested.lean` docstring: "is cited at its layer of the README by its pinned name".
  - README lines 347–348.
  - The Layer 11 bullet "The Hurwitz `84(g−1)` bound" (lines 1545–1551).
- **Claim.** Three headlines are cited at no layer:
  - genus invariance under finite separable constant extension (Layer 8);
  - the hyperelliptic genus (Layer 10);
  - the Hurwitz bound (Layer 11).

  Separately, Layer 11 states the Hurwitz bound only over `k̄` with `gcd(|G|, char k) = 1`. The pinned theorem is more general.
- **Witness.**
  - `genus_eq_genus_of_constantCompositum_eq_top` appears only at line 353.
  - `natCard_le_eighty_four_mul_genus_sub_one` appears only at line 354.
  - `genus_eq_of_sq_eq` appears only at line 1818 (worked examples).
  - The pinned bound assumes an arbitrary exact `k` and every place of `F` tame over `F^G`.
- **Repair.**
  - **Layer 8, constant-extension bullet.** Cite `TauCeti.genus_eq_genus_of_constantCompositum_eq_top`: `k′/k` separable, `k` exact in `F`, `F′ = F·k′`.
  - **Layer 10, hyperelliptic bullet.** Cite `TauCeti.genus_eq_of_sq_eq`: `2 ≠ 0` in `k`, `f` squarefree with `0 < deg f`, `F = k(x)(y)`, `y² = f`, giving `g = (deg f − 1)/2` in ℕ.
  - **Layer 11, Hurwitz-bound bullet.** Cite `TauCeti.natCard_le_eighty_four_mul_genus_sub_one` with its hypotheses, and record the `k̄`/gcd statement as a special case.

## R05 (P3) — The route decision and the scheme-side inventory say the pins have no scheme divisors, dimension theory or coherent cohomology; they do

- **Location.** README lines 41–43: "where it is empty (no coherent cohomology, no scheme dimension theory, no divisors on schemes". Also lines 309–310: "No divisors, no `Pic(X)`, no dimension theory, no coherent cohomology".
- **Claim.** These library "lacks" claims are false at the pins. They also contradict the README itself at lines 327–328 and 1683, and in 12E.
- **Witness.**
  - Mathlib pin: `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`, `Mathlib/AlgebraicGeometry/OrderOfVanishing.lean`, and `ringKrullDim_stalk_eq_coheight` (`Mathlib/AlgebraicGeometry/Properties.lean:375`).
  - Tau Ceti pin: `SchemeWeilDivisor` and `Scheme.Modules.Cohomology`, used by the 12E names the README cites.
- **Repair.** State the inventory as it is at the pins:
  - Mathlib has algebraic cycles, order of vanishing and stalk dimension, but no `Pic`, no named `ℙⁿ` and no coherent cohomology.
  - Tau Ceti has scheme Weil divisors over a field and the `H⁰`/`H¹` comparisons of 12E.

  Justify the function-field-first route by the proof of Riemann–Roch, not by an empty scheme side.

## R06 (P3) — "Portfolio ownership": what BelyiMaps is said to consume is not what BelyiMaps cites

- **Location.** README lines 32–34: "`BelyiMaps` consumes the pinned carriers `TauCeti.IsFunctionField`, `TauCeti.Place` and `TauCeti.Divisor`".
- **Claim.** The cross-roadmap claim does not resolve against BelyiMaps as it is.
- **Witness.**
  - BelyiMaps README on main, line 544 (line 562 at its open revision #767), lists as "exact declarations" `AlgebraicCurves.IsFunctionField`, `AlgebraicCurves.Place` and `AlgebraicCurves.Divisor`.
  - Line 546 lists `AlgebraicCurves.riemannRochSpace` and `AlgebraicCurves.genus`.
  - None of these exists at the pins or in this `Suggested.lean`.
- **Repair.**
  - State the supply from this side: "supplies BelyiMaps the pinned `TauCeti.IsFunctionField`, `TauCeti.Place`, `TauCeti.Divisor`, `TauCeti.riemannRochSpace` and `TauCeti.genus`".
  - In the consumers section, record that BelyiMaps' supplier table must name these pinned declarations.
  - Keep "defines no parallel place, divisor or Riemann–Roch theory". It is true: BelyiMaps lines 185–186.

## R07 (P3) — Wrong pinned file path

- **Location.** README line 346: `TauCeti/FieldTheory/FunctionField/Elliptic/WeierstrassEquation.lean`.
- **Claim.** No file with that path exists at the pinned Tau Ceti.
- **Witness.** `TauCeti.Place.exists_isWeierstrassCoordinates_of_genus_eq_one` is declared at `TauCeti/FieldTheory/FunctionField/Elliptic/Weierstrass/Equation.lean:343`.
- **Repair.** Replace the path with `TauCeti/FieldTheory/FunctionField/Elliptic/Weierstrass/Equation.lean`.

## R08 (P3) — README shape and timeless wording

- **Location.**
  - Headings at lines 78, 107, 163, 183, 370, 400, 1874 and 1986.
  - "a future … roadmap" at lines 67, 81, 89, 102, 668, 691, 1134, 1410, 1790, 1942, 1973 and 2048.
  - "no further current consumer" (line 1918) and "no current roadmap owns" (line 2046).
  - "of the day" (line 1744) and "until that exact native predicate is available" (line 1577).
  - Drafting and maintainer instructions at lines 1908–1911 and 2022–2024.
  - "*(Library list.)*" markers at lines 1956–1984.
  - LocalFieldsRamification cited without a section at lines 1115 and 1924.
- **Claim.** The README lacks the house sections and carries process wording.
- **Witness.**
  - There is no `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build` or `## Downstream consumers`.
  - CurvesOverFiniteFields and HyperellipticCurves are already in the merge order, so "future" is stale.
  - LocalFieldsRamification's Herbrand and Hasse–Arf results are in its Layer 3 (its README lines 878 and 1022).
- **Repair.**
  - Open with a `**Summary.**` paragraph.
  - Merge "Scope boundaries" and "Portfolio ownership" into `## Scope and ownership`.
  - Merge "Standing hypotheses" and "Pinned conventions" into `## Conventions`.
  - Build `## Exact supplier contracts` from four sources, with these subsections:
    - From Mathlib;
    - From Tau Ceti: the pinned carriers and the headline names;
    - From TauCetiRoadmap.FormalLaurentPuiseux §L1–L3;
    - From TauCetiRoadmap.LocalFieldsRamification Layer 3;
    - From TauCetiRoadmap.JacobianChallenge Layers A–B.

    The sources are "What Mathlib already has", the Tau Ceti carriers paragraph, the supplier rows of the contracts table, and the supplier parts of Coordination.
  - Move the consumer rows and Coordination's consumers into `## Downstream consumers`.
  - Name consumers without "future" or "current".
  - Delete "of the day", "until … available", the drafting and maintainer instructions, and the "(Library list.)" markers.

## R09 (P3) — Two cited works are not in the roadmap's source manifest

- **Location.** README References: lines 1954–1956 (Q. Liu, *Algebraic Geometry and Arithmetic Curves*, Ch. 7) and lines 1982–1983 (H.-W. Henn, Crelle 302, 1978).
- **Claim.** Every cited work must be recorded in the roadmap's `sources.toml`.
- **Witness.** The package `sources.toml` records 11 ids, `Stichtenoth2009` through `Stichtenoth1973b`. It has no Liu entry and no Henn entry.
- **Repair.** Record both through the sources service, with the locators the README uses: Liu Ch. 7, and Henn's main theorem. Mark each `uncertified` if no legal copy is found.

## Verified sound

**Gate, build and dependencies.**
- Worker's gate at 30817b1: every scanner is 0 except `outside-folder=2` (R01); `build=0`.
- `lake env lean` on `TauCetiRoadmap/AlgebraicCurves/Suggested.lean`: exit 0, no messages.
- Lean form of `Suggested.lean`: one module docstring (title, "the roadmap is README.md", the headline list), the namespace `TauCetiRoadmap.AlgebraicCurves`, no declarations, no `set_option`, no sorry'd data. The `#check @name` comparison was done on all cited pinned names (below), because the file declares none; nothing needed changing.
- Dependency check:

  ```
  depcheck: 239 roadmaps, 2347 edges, 0 problem(s)
  ```

  There is no UPWARD or CYCLE line. Every supplier is on main: JacobianChallenge, FormalLaurentPuiseux, LocalFieldsRamification (Completed). EllipticCurves, BelyiMaps and ModularForms appear only as consumers or exclusions.

**Pinned names.** A scratch file of `#check @name` covered:
- all 169 backticked `TauCeti.*` names in the README;
- 5 names in other namespaces (`AlgebraicGeometry.Scheme.isProjectiveOver_of_isCurveOver`, `WeierstrassCurve.Affine.genus_functionField`, `…isIntegrallyClosed_coordinateRing`, `…isDedekindDomain_coordinateRing_of_isIntegrallyClosed`, `TauCeti.Place.exists_isWeierstrassCoordinates_of_genus_eq_one`);
- 21 cited Mathlib names.

Everything resolves except `FormallySmooth.of_algebraicIndependent_of_isSeparable`, which is the README's shorthand for `Algebra.FormallySmooth.of_algebraicIndependent_of_isSeparable` (`Mathlib/RingTheory/Smooth/Field.lean:44`).

**Sorry-freeness.** `#print axioms` on 27 declarations reports only `propext`, `Classical.choice` and `Quot.sound` (no `sorryAx`). The 27 are:
- the 17 headline declarations of the `Suggested.lean` docstring;
- `genus_functionField_eq_of_isPullback`, `genus_eq_of_isHomogeneous`, `differentExponent_eq_finsum_card_ramificationGroup_sub_one`, `SchemeWeilDivisor.genus_eq_genus_functionField`, `cohomologyOneDualEquivCohomologyZero`, `kaehlerDifferentialEquivWeilDifferentialOfSeparating`, `Divisor.finite_ker_degreeClass`;
- `ramificationIdx_eq_of_pow_eq`, `degreeOneAddEquivDegreeZeroClassGroup`, `riemannRochSpaceEquivWeilDifferentialFiltration`.

The docstring's claim that every headline is proved at the pin holds for these; the "cited at its layer" part fails (R04).

**Signatures compared with the README prose.** About 35 pinned signatures were read against their README statements. The definitions behind them were opened at the pin:
- `IsRiemannRochDivisor`: `ℓ(D) = deg D + 1 − g₀ + ℓ(W − D)` for all `D` (`RiemannRoch/Uniqueness.lean:60`);
- `genus` as an `sSup` (`RiemannRoch/Genus.lean:193`);
- `Divisor.different` (`Different/Divisor.lean:153`);
- `Place.IsTame`: separable residue extension and `e ≠ 0` in the residue field (`Different/Tame.lean:103`);
- `FunctionFieldCat` (`FieldTheory/FunctionField/Category.lean:46`);
- `RegularProjectiveCurveCat`, with dominant morphisms through `RegularProperCurveCat.Hom` (`AlgebraicGeometry/Curves/Category.lean:92`, `:164`);
- `IsCurveOver` (`Curves/Basic.lean:37`).

The README's hypotheses match for:
- trdeg (`EssFiniteType`);
- the product formula (no exactness);
- Riemann–Roch;
- Clifford (arbitrary exact `k`);
- Hurwitz;
- the tame-iff and `genus_le_genus`;
- the tensor-domain criterion;
- both constant-extension genus theorems;
- `dim Ω = 1`;
- the residue theorem;
- Abhyankar;
- Castelnuovo;
- rigidity;
- the genus-one ladder;
- the class-group bridge;
- plane curves;
- Layer 12A–12E.

**Seeded sample.**
- *Riemann–Hurwitz* (Layer 7, Stichtenoth Thm. 3.4.13). The cross-multiplied formula, the instance arguments `[FiniteDimensional k k′] [Algebra.IsSeparable k k′]` and the derivation of both from the stated hypotheses were checked:
  - finiteness: `IsFunctionField.finiteDimensional_baseExtension`;
  - separability: `minpoly.map_algebraMap_of_isIntegrallyClosedIn` with `Polynomial.separable_map`;
  - both negative examples were rechecked.

  Fulton's Problem 8.36(c) (Fulton2008 lines 4266–4280, printed p. 111; char 0, algebraically closed, so `[k′ : k] = 1` and `deg Diff = Σ(e − 1)`) is the special case of the README's formula. The Stichtenoth text is not readable (below).
- *Portfolio ownership.* Other roadmaps defer these objects to AlgebraicCurves: SchemeAndStackFoundations lines 123–124 and 188; CanonicalModelsAndGonality (#1726) line 28; ArithmeticDynamics (#1335) line 50; BelyiMaps lines 185–186. No second owner was found. The BelyiMaps carrier claim fails (R06).
- *Route decision (pinned).* Its cross-roadmap claims hold:
  - JacobianChallenge Layer B on main (line 139): `g := dim_k H¹(X, 𝒪_X)`, `χ(L) = deg L + 1 − g`;
  - EllipticCurves on main: "with no Riemann–Roch anywhere" (line 394), the place interface (line 357), the Layer 10 local-ring milestone (line 367).

  Its library claims fail (R05).

**Other cross-roadmap citations resolved.**
- FormalLaurentPuiseux §L1, §L2, §L3 (its lines 70, 112, 140).
- LocalFieldsRamification Layer 3 (Herbrand at line 878, Hasse–Arf at line 1022).
- ModularForms Layer 10, analytic Riemann–Roch chain §10B (its lines 42 and 1206).
- No README citation is dropped by an open pull request.
- Main's `Suggested.lean` declared `isDomain_tensorProduct_of_isSeparable`, `genus_le_genus_of_constantCompositum_eq_top` and `finite_algEquiv_of_two_le_genus`, all in `TauCetiRoadmap.AlgebraicCurves`. This pull request drops them, and they are cited nowhere on main or in any open roadmap pull request.

**Overlap with other open pull requests.**
- #1807 conflicts in `Suggested.lean`. The description states the order #1807 → this pull request, and this head already contains #1807's only README change (the last row of the contracts table).
- #1808's AlgebraicCurves files are byte-identical to this branch at 1e38897c. They differ from this head only in the Layer 7 Hurwitz paragraph, which #1808 leaves untouched, so there is no textual conflict in either order.

**Headline theorems.** The `Suggested.lean` docstring lists 17:
- `isFunctionField_iff_trdeg_eq_one`;
- `Divisor.degree_principal`;
- `isRiemannRochDivisor_weilDifferentialDivisor`;
- `Divisor.two_mul_dim_le_degree_add_two`;
- `hurwitz_genus_formula`;
- `isDomain_tensorProduct_of_separating`;
- `genus_eq_genus_of_constantCompositum_eq_top`;
- `genus_le_genus_of_constantCompositum_eq_top`;
- `finrank_kaehlerDifferential_eq_one_of_separating`;
- `finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero`;
- `genus_eq_of_sq_eq`;
- `finite_algEquiv_of_two_le_genus`;
- `natCard_le_eighty_four_mul_genus_sub_one`;
- `twoChartModel`;
- `Scheme.isProjectiveOver_of_isCurveOver`;
- `RegularProjectiveCurveCat.equivFunctionFieldCat`;
- `twoChartModel.genus_eq_genus`.

All 17 are proved at the pin, so an empty `Suggested.lean` is correct. There is no padding. I found no statable headline that is unproved at the pin and missing from the file.

**Fulton2008 locators.**
- `k` algebraically closed from Ch. 3, char 0 where convenient, Appendix A for char `p`: lines 80–83.
- §8.3 Prop. 5 and its corollaries: lines 3937, 3990–3993.
- §8.4 Prop. 6(2), char 0: line 4068.
- §8.5 Prop. 8: line 4122.
- §8.6 Brill–Noether proof via Noether's reduction lemma: lines 4162–4170.
- The word "repartition" does not occur in the text.

### Adversarial table

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| `isFunctionField_iff_trdeg_eq_one` [EssFiniteType] | `F = k`; `RatFunc k`; `k(x, y)`; `k(x)`-algebraic closure | false/0; true/1; false/2; without `EssFiniteType`: false vs 1 | holds; `EssFiniteType` is load-bearing | none |
| `Divisor.degree_principal` (no exactness) | `x ∈ k(x)`; `x − i ∈ ℂ(x)/ℝ`; `c ∈ kˣ` | `1 − 1 = 0`; `deg_ℝ: 2 − 2 = 0`; `0` | holds | none |
| Riemann–Roch, `W = −2P_∞` on `k(x)`, `g = 0` | `D = 0, 3P_∞, −P_∞`; `ℂ(x)/ℝ` | `1 = 0+1+0`; `4 = 3+1+0`; `0 = −1+1+0`; `ℓ(0) = 2`, excluded by `hex` | holds; guard correct | none |
| Clifford, arbitrary exact `k` | `g = 0`; `g = 1, deg 0`; `g = 2`, `D = W` | vacuous (`0 ≤ deg ≤ −2`); `2 ≤ 2`; `2·2 = 4 ≤ 2+2` (equality) | holds | none |
| Hurwitz, cross-multiplied | identity; `y² = x⁵ − 1`; `y² = x³ − x` over ℚ; separable `F·k′`, degree `m`; `y² + y = x³` over 𝔽₂ | `2g−2 = 2g−2+0`; `2 = −4+6`; `0 = −4+4`; `m(2g−2) = m(2g−2)+0`; `0 = −4+4` (wild, `d = 4`) | holds | none |
| Hurwitz: the two "both inputs needed" examples | `F′ = 𝔽_p(s, x)/k(x)`; `𝔽_p(s, x)` over `𝔽_p(t)` | `k′ = 𝔽_p(s)` inseparable over `k` in both; the first violates `F′/F` separable, the second exactness | correct | none |
| `isDomain_tensorProduct_of_separating` | `A = k`; `ℂ ⊗_ℝ ℂ(x)`; `y^p = a + bx^p` | `F`, a domain; `≅ ℂ(x)²`, excluded by exactness; `(y − a^{1/p} − b^{1/p}x)^p = 0`, excluded by the separating hypothesis | holds | none |
| `genus_eq_genus_of_constantCompositum_eq_top` | `k′ = k`; `y² = x³ − t`, `k′ = 𝔽₃(t^{1/3})` | `g = g`; `1 → 0`, excluded by `[IsSeparable k k′]` | holds | R04: cite at Layer 8 |
| `genus_le_genus_of_constantCompositum_eq_top` (no exactness) | `ℂ(x)/ℝ`, `k′ = ℂ`; `y² = x³ − t` | pinned `genus ℝ ℂ(x) = sSup (2(deg−ℓ)+1)⁺ = 0`, so `0 ≤ 0`; `0 ≤ 1` (strict) | holds | none |
| `finrank_kaehlerDifferential_eq_one_of_separating` | `k(x)`; inseparably generated `y^p = a + bx^p` | `Ω = F·dx`, dim 1; no separating `x`, so excluded (dimension jumps) | holds | none |
| Residue theorem (perfect `k`) | `dx/x`, `dx` on `k(x)`; `dx/(x²+1)` over ℚ | `1 + (−1) = 0`; `0`; `Tr_{ℚ(i)/ℚ}(1/(2i)) = 0`, `0` at ∞ | holds | none |
| `genus_eq_of_sq_eq` (ℕ division) | `deg f = 1, …, 6` | `0, 0, 1, 1, 2, 2` against the known genera | holds | R04: cite at Layer 10 |
| `finite_algEquiv_of_two_le_genus` | `g = 0`; `g = 1`; Klein quartic, char 0 | `PGL₂(k)` infinite (excluded); `E(k)` infinite (excluded); `168`, finite; gaps `≤ 2g−1` distinct in char 0 | holds | none |
| `natCard_le_eighty_four_mul_genus_sub_one` | `G = 1`; Klein, `g = 3`; Hermitian `q = 41` (wild); non-closed `k` | `1 ≤ 84`; `168 = 168`; `68921 > 84·819 = 68796`, excluded by tameness; degree weights only enlarge `2g₀ − 2 + Σ(1 − 1/e)deg Q`, minimum `1/42` | holds over any exact `k` | R04: cite with its generality |
| Kummer `e`, `d` (pinned, general `n`) | `y² = x` at `P_(X)`, `P_∞`, `P_(X−1)`; `y³ = x` over ℚ (no `ζ₃`) | `e = 2, 2, 1`; `e = 3`, `d = 2` | holds without (c), (d) | R02 |
| Negative control `y² = x³ + a` over 𝔽₂(a) | `F/k(y)` of degree 3 | `2g−2 = 3(−2) + 2·2 + 2·1 = 0`, so `g = 1`; `Δ = a₃⁴ = 0`; `v = y + √a`, `u = v/x` gives `x = u²`, `v = u³` | correct | none |
| Artin–Schreier infinity chart | `w + w² + z³ = 0` | `dw = z²dz`; `dt = (w²/z²)dz`; `ord w = 3`, `ord z = 1`, so `d = 4 = (2−1)(3+1)` | correct | none |
| Fierce `V₄` example | `y² + ty = s`, `z² + tz = u` | `e = 1`, `f_ins = 4`, `d = 1+1 = 2`; Hilbert sum `3`; `f·d = 8` | correct | none |
| Imperfect constant extension | `P = (t^p − a)`; `P = (t)` | `Con P = pQ`, `e = p`; `e = 1`, `κ(Q)/κ(P)` purely inseparable of degree `p` | correct | none |
| Genus drop `y² = x^p − t` | `u = y/(x−a)^{(p−1)/2}` | `u² = x − a`, `u^p = y`: the field is rational | correct | none |
| Plane curve `genus_eq_of_isHomogeneous` | `d = 0, 1, 2, 3, 4` (Klein) | vacuous (`G = 0` is singular); `0`; `0`; `1`; `3` | holds | none |
| Weierstrass gaps, `y² = x⁵ − 1` | branch point; `(0, i)` over ℚ(i) | `{1, 3}`; `{1, 2}`; `0⁵ − 1 ≠ 0` | correct | none |
| Exact-constants guard | `ℂ(x)/ℝ` | `[ℂ(x) : ℝ(x)] = 2`, so `IsFunctionField` holds; `ℓ(0) = 2` | correct | none |
| Anti-equivalence `RegularProjectiveCurveCat k ≌ (FunctionFieldCat k)ᵒᵖ` | `ℙ¹ ↔ k(x)`; `ℂ(x)` over ℝ | dominant morphisms against `k`-algebra maps; `ℙ¹_ℂ` regular projective over ℝ ↔ `ℂ(x)` (no exactness needed on either side) | holds | none |

## Not verifiable

- **Stichtenoth2009** (settled as uncertified, paywalled). Not read: Thm. 3.4.13 (Hurwitz), Ch. 1 to Ch. 6 numbering, the claimed Ch. 3 perfectness umbrella, Exercise 3.18, Rem. 1.6.9, Prop. 3.11.5. Searched for: the manifest entry and the sources cache. The Hurwitz statement was checked mathematically, against the pin, and against Fulton Problem 8.36(c).
- **Hartshorne1977** (I.6; IV.2; Ex. IV.2.5). Settled as uncertified.
- **Deuring1973, Goldschmidt2003, VillaSalvador2006, Rosen2002, Serre1979, Roquette1970, Stichtenoth1973a/b.** All settled as uncertified.
- **Liu2002, Henn1978.** Not in the manifest (R09). Not fetched by this review, which edits no manifest.

## Source issues

- none
