# Review of DiophantineApproximationAndTranscendence (pull request #1906 at 6b8e3ce)

**Verdict:** needs changes

The head repairs all thirteen findings of the previous review (see "Previous findings" under `## Verified sound`). The gate and the dependency check pass. One P2 and seven P3 findings remain. Several come from the repair itself: target labels were stripped mechanically, and the pruned `Suggested.lean` still re-defines pinned Tau Ceti carriers.

## R01 (P2) — The absolute quantitative Subspace theorem is statable but only its `K`-point case is stated

**Location.** `TauCetiRoadmap/DiophantineApproximationAndTranscendence/Suggested.lean` lines 439–458 (`subspace_theorem_for_systems`, docstring "for forms and points over `K` (`D = 1`)"). README line 2023: "normalize |Lᵢv(σx)|v/|σx|v≤A_vH(x)^dᵢv for every Galois σ … log(3ε⁻¹RD)".

**Claim.** The Summary promises the "absolute quantitative Subspace theorem". README line 2023 states EF13 Thm. 3.1 for points x ∈ ℚ̄ⁿ, forms of coefficient degree ≤ D, and the maximum over σ ∈ G_K. The Lean statement fixes D = 1 and x : Fin n → K. This is a special case: covering all ℚ̄-points by K-subspaces does not follow from applying the K-rational statement over each K(x) separately.

The module docstring lists as not statable only the absolute *parametric* theorem, which needs a twisted height on ℚ̄ⁿ. Thm. 3.1 needs no twisted height.

**Witness.** EF13 lines 523–568 (§§3.1–3.3, pp. 13–14) use only three ingredients:
- a chosen extension of ‖·‖_v to ℚ̄;
- G_K = Gal(ℚ̄/K);
- the absolute height H(x).

All three exist at the pins: Mathlib's `AbsoluteValue (AlgebraicClosure K) ℝ`, `AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K`, and `TauCeti.absoluteProjectiveTupleHeight` (`TauCeti/NumberTheory/Height/ProjectiveTuple.lean:80`). `padic_subspace_theorem` (lines 290–299) already takes chosen extensions as data.

**Repair.** State `subspace_theorem_for_systems` as README line 2023 does:
- x : Fin n → AlgebraicClosure K;
- data w : Place K → AbsoluteValue (AlgebraicClosure K) ℝ, with a hypothesis that w v restricts to `normAbs v` on K;
- forms with coefficients in AlgebraicClosure K and [K(L):K] ≤ D;
- the inequality for every σ;
- H := `TauCeti.absoluteProjectiveTupleHeight`;
- the bound 10⁹·2^(2n)·n¹⁴·ε⁻³·log(3RD/ε)·log(log(3RD)/ε).

Then delete the K-point form; it becomes a README Check (the case D = 1 with x ∈ Kⁿ, where the maximum over σ is attained at σ = id).

## R02 (P3) — `Suggested.lean` re-defines carriers that pinned Tau Ceti already provides

**Location.** `Suggested.lean` lines 85–263, and the module docstring at lines 33–37: "several have equal Tau Ceti counterparts, which the headline statements below use where no importing roadmap depends on the local name".

**Claim.** Twenty local definitions duplicate pinned Tau Ceti declarations. Four headlines use local copies instead of the Tau Ceti objects:
- `absolutePerturbedUnitEquation` uses `absoluteLogHeightAff`;
- `sharp_roths_lemma` uses `height2`;
- the two general-position theorems use `InGeneralPosition`;
- the unit-equation theorems use `IsNondegenerateSolution`.

No headline here uses the other sixteen. The repository README says: "prototype the new interface against that implementation instead of restating it behind a private stand-in".

**Witness.** The pinned declarations:
- `irrationalityExponent`: `TauCeti/NumberTheory/DiophantineApproximation/Exponent.lean:46`.
- `linearFormExponent` and `mahlerExponent`: `LinearFormExponent.lean:127` and `:458`.
- `algebraicApproximationExponent`: `AlgebraicExponent.lean:92`.
- `absoluteProjectiveTupleHeight` and `absoluteLogHeightAff`: `Height/ProjectiveTuple.lean:80` and `:296`.
- `Matrix.mulHeight`: `Height/Matrix.lean:79`.
- `MvPolynomial.hasseDeriv`: `Algebra/MvPolynomial/HasseDeriv/Basic.lean:85`.
- `MvPolynomial.weightedIndex`: `RingTheory/MvPolynomial/WeightedIndex.lean:83`.
- `MvPolynomial.mulHeight` and `logHeight`: `Height/MvPolynomial.lean:82` and `:86`.
- `plucker`: `LinearAlgebra/ExteriorPower/Plucker.lean:104`.
- `Submodule.relativeSubspaceHeight`: `Height/Subspace/Basic.lean:83`.
- `height2` and `arakelovMulHeight`: `Height/Arakelov/Basic.lean:65` and `:123`.
- `Submodule.relativeSubspaceArakelovHeight` and `subspaceHeight`: `Arakelov/Subspace/Basic.lean:86` and `:292`.
- `InGeneralPosition`: `LinearIndependent/GeneralPosition.lean:39`.
- `IsNondegenerateSolution` and `IsNondegenerateHomogeneousSolution`: `UnitEquation/Nondegenerate.lean:63` and `:68`.

In a scratch probe, `local = TauCeti.… := rfl` closes for `irrationalityExponent`, `algebraicApproximationExponent`, `plucker`, `MvPolynomial.mulHeight` and both nondegeneracy predicates.

**Repair.**
- State the four headlines with `TauCeti.absoluteLogHeightAff`, `TauCeti.height2`, `TauCeti.InGeneralPosition` and `TauCeti.IsNondegenerateSolution`.
- SubspaceTheorem and Completed/HeightsAndUnits import some of these local names. Keep each such name only as an `abbrev` whose body is the Tau Ceti declaration; delete the rest.
- Name the Tau Ceti declarations under "From Tau Ceti".

Tested in a scratch copy: replacing `irrationalityExponent`, `relativeSubspaceHeight` (→ `Submodule.relativeSubspaceHeight`), `height2`, `InGeneralPosition` and `IsNondegenerateSolution` by such aliases elaborates with no new message.

## R03 (P3) — Stripped target labels leave dangling references and broken sentences

**Location.** The README *Needs:* lines and prose still use names whose defining sentence no longer carries them:
- `closedFormRecurrence` (1148);
- `smallHeightHyperplaneBound` (1087);
- `unitEquationHeightAssembly` (1111);
- `mulHeight_pow_finrank` (45, 218, 226, 228, 236, 248, 257, 281, 1267, 3900);
- `prod_infinitePlace_comap_pow_mult` (208, 216, 1294);
- `height2_baseExtension` (1306);
- `absoluteBinarySmallBasis` (1439);
- `algebraic_mahler_rational` (3339, 3504);
- `eFunction_minimal_equation_zero` (3204, 3217, 3224);
- `matveevParameterChoice` (2493, 2556);
- `yuParameterChoice` and `yuQuantitativeExtrapolation` (2654);
- `yuOneFactorBound` (2664).

The defining sentences now read, for example, "Prove for a complex recurrence" (1024), "prove b·w=1 has at most" (1041), "Build for h_aff(x)>4n log n use the" (1081), "Build for A∈GL₂(𝔄_K), r≥1, there are" (1413), "Prove for the same system put" (2025) and "Prove a q-Mahler" (3314).

**Claim.** The repair removed "`name`:" from each defining sentence and left the references in place. A reader of "*Needs:* mulHeight_pow_finrank" cannot find the statement meant. Other roadmaps cite these names.

**Witness.** Inbound citations of the stripped names:
- On main: ClassicalArithmeticCompletion `README.md:119` and `:3547` (§2.4 `closedFormRecurrence`).
- ArithmeticDynamics (#1335) `README.md:190` and `:2011` (§0.2 `prod_infinitePlace_comap_pow_mult`, `mulHeight_pow_finrank`).
- FaltingsFinitenessAndIsogenyTheorems (#1004) `README.md:405` and `:407`.
- AdelicAlgebraicGroups (#792) `README.md:3341` (`height2_baseExtension`).
- EffectiveDiophantineMethods (#1046) `README.md:1704` (`yuOneFactorBound`).

**Repair.** Restore each name, unbackticked, as the label of its statement, for example "Prove mulHeight_pow_finrank: for a finite tuple x over number fields K⊆L, …". The gate accepts this form (compare "Prove finiteRankHeightPacking:" at line 1066). Then re-read every "Prove for" and "Build for" sentence (1024, 1041, 1081, 1413, 1466, 1540, 1994, 2019, 2025, 2474, 2587, 2634, 3176, 3185, 3314, 3592).

## R04 (P3) — The rational Matveev constant is attributed to E19 Thm. 5.4, which has a 24-times larger constant

**Location.**
- README line 2515: "C′=(e/2)m^(4.5)30^(m+3)∏max(1,log H(aᵢ)) … (E19, ch. 5, §5.1, Thm. 5.4, p. 87.)"
- Line 2794: "C₁=1+(e/2)2^(4.5)30⁵max(1,log a)max(1,log b). (E19, ch. 5, Thm. 5.4, Corollary 5.5, pp. 87-88.)"
- `Suggested.lean` line 617: "made explicit with Matveev's constant (Theorem 5.4, `m = 2`)".

**Claim.** The statements are true, but the cited theorem does not give this constant.

**Witness.**
- E19-ch5 line 93 gives C′ = 12e·m^4.5·30^(m+3)·∏max(1, log H(aⱼ)), with no factor 2/3. For m = 2 that is about 1.79·10¹⁰.
- The README's (e/2)·2^4.5·30⁵ ≈ 7.47·10⁸ is Matveev's Corollary 2.3 constant min{(en/2)·30^(n+3)·n^3.5, 2^(6n+20)}, taken with κ = 1, D = 1 and n = 2.

**Repair.** Cite Matveev, §2, Cor. 2.3, p. 1219 (through §3.6 `matveev`) for both constants. Cite E19 Cor. 5.5, p. 88 for the deduction, and mention E19 Thm. 5.4 only as the weaker published constant 12e·m^4.5·30^(m+3). Change the Lean docstring accordingly.

## R05 (P3) — `ncard_zeros_simple_recurrence_le`: the README and the Lean statement differ in generality

**Location.** README line 1150: "for n≥3, distinct αᵢ≠0 and aᵢ≠0 in characteristic zero". `Suggested.lean` line 371: `[Field K] [IsAlgClosed K] [CharZero K]`.

**Claim.** The Lean statement assumes an algebraically closed field; the README states it for any field of characteristic zero.

**Witness.** ESS02 line 239 (Thm. 1.2, p. 812) assumes K algebraically closed. The README's own statement for `card_nondegenerate_solutions_le` (line 1120) supplies the reduction: embed K into its algebraic closure.

**Repair.** Drop `[IsAlgClosed K]` from the Lean statement and add that one-sentence reduction to README line 1150, as line 1120 does. (Alternatively, write "algebraically closed" in the README.)

## R06 (P3) — The IntegralLattices citation quotes headings that no longer exist

**Location.** README line 85: "IntegralLattices, Layer 0A “integral lattices” and Layer 2 “definite lattices”, supplies the quadratic-lattice carrier and its bounded-norm finiteness". The same pair is cited at line 33.

**Claim.** On main, IntegralLattices `README.md:536` has "Layer 0: the native foundation", which "has no targets"; 0A is a label for a Tau Ceti row. Its `README.md:685` is "Layer 2: Minkowski's second theorem and reduction". It states that bounded-norm finiteness is native in Tau Ceti.

**Witness.** The pinned declarations are `TauCeti.IntegralLattice` (`TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63`) and `TauCeti.IntegralLattice.IsPosDef.finite_setOf_norm_le` (`…/IntegralLattice/PosDef/Finite.lean:92`).

**Repair.** Move both declarations to "From Tau Ceti" by name and file, and delete the IntegralLattices supplier sentence at lines 33 and 85.

## R07 (P3) — Docstrings give labels instead of the mathematics

**Location.** `Suggested.lean` lines 265, 274, 287, 301, 316, 330, 341, 350, 356, 364, 370, 407, 419 and 439. Examples: "`Layer 2 subspace theorem and its exceptional subspaces` (Schmidt; Evertse Theorem 7.1)" and "`Layer 2 s unit equation finiteness`". Lines 595 and 599 read "The proposition.", and line 398 reads "The conditions (2.4)–(2.9) on `(L, c)`."

**Claim.** The brief requires "a docstring on every declaration stating the mathematics". These docstrings name a label or an equation number.

**Witness.** Line 595 (`SchanuelConjecture.algebraicIndependent_exp_one_pi`) is documented only as "The proposition."

**Repair.** Write one sentence of mathematics for each declaration. For example: "Schmidt's Subspace theorem: the nonzero integer points with ∏|Lᵢ(x)| ≤ C‖x‖^(−δ) lie in finitely many proper rational subspaces (E19, Thm. 7.1, p. 138)." For line 595: "Schanuel's conjecture implies that e and π are algebraically independent."

## R08 (P3) — Locator slips found in the sample

**Location, witness and repair.**
- **README lines 348 and 352** cite "E19, ch. 2, Corollary 2.7, p. 22". Cor. 2.7 is stated on p. 21 (E19-ch2 lines 333–341, page footer 21 at line 347); p. 22 holds its proof. Repair: "Cor. 2.7, p. 21".
- **README line 2998** cites "(B06, Thm. 1.3, p. 8.)" for the monomial-system construction. Thm. 1.3 is on p. 2 (B06 line 87); the construction is in its proof on p. 8 (lines 338–341). Repair: "B06, proof of Thm. 1.3, p. 8".
- **README line 299** cites "E19, ch. 1, Thm. 1.7, p. 5" for the bound d(2⌊B⌋₊+1)^(d+1). Thm. 1.7 states countability; only the proof of (ii) (E19-ch1 lines 145–153) gives qualitative finiteness, and no count. Repair: "proof of Thm. 1.7(ii), p. 5"; the count rests on Wu, Thm. 3.4.

## Verified sound

**Previous findings.** All thirteen are repaired:
- **R01.** `LinearFormsInLogarithms` occurs 0 times. §3.4 states the Schwarz, Thue–Siegel and interpolation lemmas as its own targets (lines 2241–2257, W00 locators). §3.2 uses `TauCeti.linearIndependent_exp` (line 2152).
- **R02.** Both upward suppliers are gone; the depcheck reports 0 problems.
- **R03.** `relativeSubspaceHeight` is now `Height.mulHeight (plucker …)` with no `sorry` (line 222). It is a duplicate of a Tau Ceti declaration; see R02.
- **R04.** The gate reports latex, tex and prnum at 0. The §1.4 displays are code spans.
- **R05.** README line 81 lists the Hasse Wronskian API under From Tau Ceti.
- **R06.** Only two Wronskian theorems remain, each with a docstring, in the Layer 1 section, and named at README line 712 and line 716.
- **R07.** Divisibility is "over every field" (line 714). `[CharZero K]` appears only on the summed bound.
- **R08.** The new bounds are marked "Derived here from … P22, Def. 3.3.1, p. 85" (lines 712, 714 and 716).
- **R09.** sorry-examples is 0 and the name catalogues are gone.
- **R10.** `TauCeti.sUnitsRatMulEquiv` is cited (line 2741). `letI` is replaced by `instAlgebraRatFuncAdjoin`.
- **R11.** §5.7 says the consequences are "those of §3.8 … this section does not restate them".
- **R12.** The kebab-case labels are gone.
- **R13.** The four slips are fixed (lines 348, 906, 381 and 3274).

**Gate and dependency check.** I reran the gate on this head. Every rule reported 0 and the gate ended `OK`; my rerun printed no build key, while the worker's gate.md records build=0. The dependency check printed `depcheck: 238 roadmaps, 2352 edges, 0 problem(s)`.

**Elaboration.** `lake env lean` on `Suggested.lean` gives 49 `sorry` warnings, 14 `#check` outputs and no other message.

**Signatures.** I compared the 78 elaborated signatures in `signatures.md` with the source. The one flagged binder, `[NumberField K]` on `IsTwistedData`, is unused: the structure needs only `Place K` and `[Field K]`. The theorems keep `[NumberField K]` (for example `parametric_subspace_theorem` and `padic_subspace_theorem`).

**One-tactic probe.** I replaced every `sorry` in a scratch copy by `first | rfl | simp | infer_instance | norm_num`. All 49 theorems failed to close, so none is padding by this test.

**Library declarations opened at the pins.**
- Tau Ceti: `LinearRecurrence.IsNondegenerate` (`Algebra/LinearRecurrence/Nondegenerate.lean:44`, which requires charPoly coefficient 0 to be nonzero, so the order-1 recurrence with coefficient 0 is excluded); `TauCeti.twistedHeight` (`Height/Twisted/Basic.lean:182`, which uses Q^(−c)); `PowerSeries.IsDFinite` (`RingTheory/PowerSeries/DFinite.lean:80`); `linearIndependent_exp` and `algebraicIndependent_exp` (`Lindemann/Theorem.lean:53`, `:85`); `transcendental_rpow` (`GelfondSchneider/Theorem.lean:210`); `algebraicLogs` (`AlgebraicLogs.lean:59`); and the twenty declarations listed under R02.
- Mathlib: `EisensteinSeries.E2` (`E2/Defs.lean:61`, normalised); `ModularForm.E₄` and `E₆` (`EisensteinSeries/Basic.lean:47–54`, normalised); `Orientation.volumeForm_robust'` (`Orientation.lean:235`).
- Every backticked name in the supplier contracts (lines 40–95) resolves at the pins.

**Cross-roadmap citations resolved on main.**
- GlobalNumberFields Layer 0 (Completed, line 241).
- EffectiveBounds Layer 0 (Completed, line 94).
- AlgebraicCurves Layer 9 (line 1099).
- ContourIntegration Layers 2 and 3 (Completed, lines 158 and 184).
- ReductiveGroups Layers 0, 3 and 4 (lines 129, 234 and 432).
- DifferentialGeometry Layers 0 and 6 (lines 268 and 782).
- IntegralLattices: see R06.

**Ownership against open pull requests.**
- EffectiveDiophantineMethods (#1046) consumes this roadmap's §§3.6–3.7 and 4.1–4.5 by name (its `README.md:37`, `:1617` and `:1660`), so supply runs in one direction.
- DiophantineApproximationAndTranscendencePartII (#1693) consumes §§0.2–0.3, 2.8 and 5.1–5.3 (its line 9).
- LinearFormsInLogarithms is not cited.
- `overlaps.md` reports no other open pull request changing this folder.

**Sources.** Five texts were fetched this round on a scratch copy of the manifest; the board manifest is unchanged (md5 8fd0c700…): B06 (arXiv math/0405549v3), AF22 (arXiv 2210.14528v1), B08 (archive.math.arizona.edu), BEG13 (arXiv 1301.7168v1) and EF13 (arXiv 1008.2340v1).

### Sampled locators confirmed

| Target | Locators confirmed |
| --- | --- |
| 0.0 | E19-ch2 Lem. 2.8 pp. 23–24 (line 409); Thm. 2.9 pp. 24–27 (lines 439, 528–558); Cor. 2.6 p. 20 (line 303); Exercise 2.11 p. 31 (line 655) |
| 0.1 | E19-ch3 §3.1 p. 41, with F for (1+2√3)/5 at line 76; Exercise 3.1 p. 41 (line 77); Lem. 3.7 pp. 42–43 (lines 122–128) |
| 0.3 | E19-ch3 Exercise 3.6(ii)–(iii) p. 58 (lines 794–799); Exercise 3.7(i) p. 60 (line 833, see Source issues); Lem. 3.19 p. 52 (line 568); Thm. 3.20 pp. 52–53 (line 579, A > 1; README's A ≥ 1 follows by a limit) |
| 0.4 | E19-ch1 Thm. 1.1 p. 1; Thm. 1.3 p. 2; Thm. 1.4 p. 3 (line 73); Lem. 1.9 p. 6 (line 169); E19-ch2 Cor. 2.7(i)–(ii) p. 21; Exercise 2.6 p. 22 (line 363); Cor. 2.21 p. 33; Thm. 2.22 p. 34 |
| 0.6 | E19-ch2 Exercise 2.7 and the badly approximable definition p. 23 (lines 394–402); Littlewood's conjecture p. 23 (line 388); the product ≤ 1 remark p. 22 (lines 377–384) |
| 2.3 | E19-ch8 Thm. 8.6 p. 161; Thm. 8.7 p. 162; derivation 8.7 ⇒ 8.6 p. 163; Thm. 8.8 p. 164; Thm. 8.10 and the factorisation p. 165; Lem. 8.11 p. 165; Thm. 8.12 p. 167 (any field of characteristic 0); definitions in §8.3 pp. 168–169; Thm. 8.13 p. 168; Lem. 8.15–8.16 and Thm. 8.14 pp. 170–171 |
| 2.4 | ESS02 Thm. 1.1 p. 808 (line 43, (6n)^(3n)(r+1)); Thm. 1.2 pp. 812–813 (lines 239–258, algebraically closed K, n ≥ 3); Thm. 2.1 p. 815 (line 356); h = log H(1, x) at (2.3)–(2.4), line 321; E19-ch8 §8.4 pp. 172–175 and Thm. 8.18 p. 174 |
| 3.2 | E19-ch4 Thm. 4.8 and Cor. 4.9–4.10 p. 67; Thm. 4.11 p. 68 with f_k on p. 70; Lem. 4.12 p. 71; Lem. 4.13–4.15 p. 72; Exercise 4.3 p. 73 |
| 3.3 | E19-ch4 Thm. 4.16, Cor. 4.17 and Cor. 4.18 p. 73; Thm. 4.19 pp. 73–74; Cor. 4.20 p. 74; Thm. 4.21 pp. 76 and 82; Lem. 4.22 p. 77; Lem. 4.23 and Exercise 4.5 p. 79; Lem. 4.24 and 4.26 p. 80; Lem. 4.27 pp. 80–81 |
| 4.2 | E19-ch5 Cor. 5.5 p. 88; Thm. 5.6 p. 89; Tijdeman's Catalan result pp. 88–89. Thm. 5.4 p. 87 has a different constant (R04) |
| 4.4 | E19-ch5 Thm. 5.14 p. 98; the example y³ = 2x(x−3) pp. 98–99; Thm. 5.15 p. 99; BEG13 Thms. 2.1–2.3 p. 4 (lines 129–141) with K = ℚ, S = {∞} giving exactly the README's three bounds |
| 4.5 | E19-ch5 Exercise 5.9(i) p. 106; Thm. 5.16 p. 101; Thm. 5.17 pp. 101–102; Thm. 5.18 pp. 102–103 |
| 5.3 | B08 Def. 4.4.1, Thm. 4.4.2 and Thm. 4.4.3 p. 20; Lem. 5.2.1 p. 22; Thm. 5.1.2 and Prop. 5.3.1 pp. 21–24 |
| 5.4 | B06 Thms. 1.1–1.3 p. 2; Cor. 2.2 p. 3; B08 Thm. 3.4.1 p. 14; Cor. 3.4.2 with the quotient argument in its proof p. 15 |
| 5.5 | AF22 Thm. 1.1, with system (1.1) f = A f(z^q) and regular points at lines 34–54, p. 1–2 |

### Adversarial table

| Statement | Instance | Values (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| §0.0 minima | ℤ², [−2,2]×[−1,1] | (1,0) ∈ λB ⇔ λ ≥ 1/2; (0,1) ⇔ λ ≥ 1 | (1/2, 1) | none |
| §0.0 Minkowski II | ℤ², [−4,4]×[−1,1] | 16·(1/4)·1 = 4 = 2²; 16·(1/4)² = 1 < 2 = 2²/2! | holds | none |
| §0.0 lower bound | ℤ^d, cross-polytope | (2^d/d!)·1 = 2^d/d! | equality | none |
| §0.0 Gram | rows (1,0), (1,1) | Gram [[1,1],[1,2]] has det 1; ∏‖v‖² = 2 | holds | none |
| §0.1 F_x | (1+2√3)/5 | 25X²−10X−11; H = 25 (E19-ch3 line 76) | holds | none |
| §0.1 H(x⁻¹) | 2/3 | F = 3X−2 and 2X−3; H = 3 = 3 | holds | none |
| §0.1 size bounds | x = 2/3, H = 3 | 1/4 ≤ 2/3 ≤ 4 | holds | none |
| §0.3 count | d = 1, B = 1; d = 0 | {−1,0,1}: 3 ≤ 9; empty set, bound 0 | holds | none |
| §0.3 central binomial | k = 2, 5 | 2√3 ≈ 3.46 ≤ 4; 10√6 ≈ 24.5 ≤ 32 | holds | none |
| §0.3 den/house | z = 1/2; z = i | 1/2 ≥ 1/2; 1 ≥ 1 (equalities; E19's strict form fails) | README right | Source issues |
| §0.3 H ≤ (2·house)^d | √2; φ | 2 ≤ 8; 1 ≤ (2φ)² ≈ 10.5 | holds | none |
| §0.3 Lem. 3.19 | conjugate bound | √8/3 ≈ 0.943 < 1 | holds | none |
| §0.3 Siegel | d=1, M=1, N=2, A=1, a=(1,1) | x = (1,−1): 1 ≤ 6¹ | holds | none |
| §0.4 Dirichlet | m=n=1, √2, Q=2 | y=1, x=1: 0.414 ≤ 1/2 | holds | none |
| §0.4 Cor. 2.7(ii) | 1, √2 | (3,2): \|2√2−3\| = 0.172 ≤ 1/2 | holds | none |
| §0.4 Lem. 1.9 | α = a/b | \|x−αy\| = \|bx−ay\|/b ≥ 1/b | cannot tend to 0 | none |
| §0.6 BadlyApproximable √2 | q = 1, 2, 5 | 0.414, 0.343, 0.355 | stays positive | none |
| §0.6 Littlewood Check | α ∈ ℚ | y = den α gives a zero product | holds | none |
| §2.3 p-adic Roth with min | S = {∞, p}, only the p-factor small | via Thm. 8.7: \|x\|\|y\|\|y\|_p²\|ξ−α_p\|_p ≤ C·H^(2−κ) | finite | none |
| §2.3 Thue–Mahler | coprimality dropped | (2^k x, 2^k y) infinite; Lean has `IsCoprime` | holds | none |
| §2.3 nondegenerate Check | α = (1,−1,1), x = (2,2,1) | subsum 2−2 = 0 | degenerate | none |
| §2.4 IsNondegenerate | coeffs ![−1,0] | X²+1, ratio −1 has order 2 | degenerate | none |
| `skolem_mahler_lech_simple` | order 1, coefficient 0, u = (1,0,0,…) | charPoly X, coefficient 0 is 0, so not nondegenerate | excluded | none |
| ESS02 vs E19 bound | n, r | ESS02 (6n)^(3n)(r+1); E19 p. 169 gives (6n)^(4n)(r+1) | README follows ESS02 | Source issues |
| §2.4 h_aff | (1/3, 1/3) | log H(3,1,1) = log 3; projective value 0 | holds | none |
| `absolutePerturbedUnitEquation` | z_k = (1/(2^k+1), …), n = 2 | log(2^k+1) > ½·e^(−10⁶)(1 + log(2^k+1)) | budget excludes the family | none |
| §2.4 covering, n ≥ 3 | x₁−x₂ = 0 in ⟨2⟩ | (2^k, 2^k) fills the line | n ≥ 3 needed | none |
| `ncard_zeros_simple_recurrence_le` | n = 2 | at most 1 zero; the Lean adds IsAlgClosed | README ≠ Lean | R05 |
| §3.2 `auxPoly` | {0,1}, l=1, p=2; {0}, p=3 | X³−2X²+X; X²/2 | holds | none |
| §3.2 `auxValue` | single 0 1 | f^(p−1)(0) = l^p gives −l^p | holds | none |
| §3.2 Lem. 4.13 | A_γ | A^p = l^(tp)∏(γ−γ′)^p = E19 (4.13) | holds | none |
| §3.3 Lem. 4.26 | T = 3R | \|w−aᵢ\| ≥ T−R = 2T/3 | T ≥ 3R suffices | none |
| `transcendental_exp_mul` | l = 2πik, β irrational | e^(2πikβ) = (−1)^(2kβ), base −1 ≠ 0, 1 | E19 Thm. 4.16 applies | none |
| §3.3 Cor. 4.17 | λ = πi, β = −iα | βλ = πα | holds | none |
| `schneiderLang` | d₀=0, n=1, d₁=2 | e^(x₁y), e^(x₂y) both algebraic ⇒ x₂/x₁ ∈ ℚ̄∖ℚ contradicts GS | holds | none |
| Baker | (log 2, log 3); (log 2, log 4) | independent over ℚ̄; the second pair is excluded by ℚ-independence | holds | none |
| `baker_lower_bound` | m = 0 | \|γ\| ≥ M(γ)⁻¹ ≥ B^(−D) ≥ (eB)^(−D) | C = D works | none |
| `matveev` | A_n not maximal | README reorders so A_n is maximal, giving B ≤ B* | holds | none |
| rational Matveev / C₁ | m = 2 | Matveev Cor. 2.3: e·30⁵·2^3.5 ≈ 7.47·10⁸ < 2³²; E19: 12e·2^4.5·30⁵ ≈ 1.79·10¹⁰ | true, wrong locator | R04 |
| lemma x ≤ a + b·log x | a = 2, b = 1 | the solutions stop at x ≈ 3.146; bound 4 + 2(log 2 − 1) = 3.386 | holds | none |
| `pow_sub_pow_eq_finite` | a=3, b=2, k=1 | (1,1), (2,3): max 3, far below the bound | holds | none |
| `tijdeman_gap` | S = {2,3}, 8 < 9 | 1 ≥ 9/(c₁(log 9)^c₂) for c₁(log 9)^c₂ ≥ 9 | satisfiable | none |
| §4.4 superelliptic example | x = 0, 3 | 2x − 2(x−3) = 6; \|A\| = 18; 18² = 324 | holds | none |
| §4.4 BEG13 | K = ℚ, S = {∞} | s = d = \|D_K\| = Q_S = 1: (6N)^(14n³N³)e^(8n²N³ĥ); (4N)^(2¹²N⁴)e^(50N⁴ĥ); (10N²)^(40N)e^(11Nĥ) | equal to the README | none |
| `baker_superelliptic` | n = 2, deg f = 2 | y² = 2x²+1 has infinitely many solutions | hypothesis needed | none |
| `sUnitEquation_exponent_bound` | S = {2,3}, C = 1.4 | e^1.4 = 4.06 ≥ 4 covers v₂(3^b−1) = 2+v₂(b); bound 5.64 ≥ 3 at (9, −8) | holds | none |
| §4.5 Examples | a=4, b=2; a=2, b=2 | v₂(24) = 3 = 2+1; v₂(8) = 3 > 2 | holds | none |
| §5.3 iterates | T = 1−X, M = 1; T = M = 1 | P₂ = (1+1)/2 = 1; P₂ = 1/2 | holds | none |
| §5.3 Galochkin | T = 1, M = I | q_s = s! is not ≤ C^s | fails, as stated | none |
| `galochkin_chudnovsky` | B08 Thm. 4.4.2 | b > C\|a\|^(n+1) > 0 matches q > C\|p\|^(n+1), p ≠ 0 | holds | none |
| B08 quotient | f = (z−1)e^z | b_n = n!·Σ_{k≤n}(k−1)/k! = −1, the coefficients of −e^z | holds | none |
| `siegel_shidlovskii` | f = e^z, ξ = 1 | trdeg ℚ(e) = 1 = trdeg ℂ(z)(e^z) | holds | none |
| `IsMahlerRegularPoint` | A = (1−2z)⁻¹, α = 2^(−1/2) | q = 2: α² = 1/2 is a pole; q = 3: 2^(−3^ℓ/2) ≠ 1/2 | depends on q | none |
| `nishioka` | AF22 (1.1) | f = A f(z^q); regular ⇔ A(α^(q^k)) defined and invertible ⇔ no poles of A or A⁻¹ | conventions agree | none |
| `transcendental_fredholm` | F(z) = z + F(z²) | matrix [[1,z],[0,1]], determinant 1, no poles | holds | none |
| `nesterenko` | τ = i | E₆(i) = 0, so s = {q, E₂, E₄} | holds | none |
| `ax_schanuel` | F = ℂ((t)), D = d/dt, x = t, y = e^t | 1 + 1 ≤ trdeg ℂ(t, e^t) = 2 | holds | none |
| `ax_lindemann_weierstrass` | f = (t, √2·t) | trdeg ℂ[f] = 1; e^t and e^(√2t) independent | holds | none |
| Schanuel ⇒ e, π | x = (1, πi) | trdeg ℚ(πi, e) ≥ 2 | holds | none |
| `natDegree_add_derivative_orders_le` | (1, X^m); (1, 1) | (m−1)+1 ≤ m; W = 0, so the hypothesis is needed | holds | none |
| `sum_multiplicity_lower_bounds_le_natDegree` | span(1, X³), S = {0,1} | (4−2)+(2−2) = 2 ≤ deg 3X² = 2 | equality | none |
| `subspace_theorem` | x = 0 | ‖0‖^(−δ) = 0, so 0 ≤ 0; 0 lies in every V | holds | none |
| `padic_subspace_theorem` | x = p^k·y | the left side is fixed (product formula), the right side shrinks by p^(−kε) | holds | none |
| `schmidt_normForm` | ℚ(i); ℚ(√2) with M = 𝓞_K | x²+y² = c is finite; for ℚ(√2), h fails (L = K, μ = 1) | holds | none |
| `finite_approximation_bounded_degree` | d = 0 | no primitive irreducible F of degree 0 | empty set | none |
| `parametric_subspace_theorem` | R = 1, δ = 1 | log 3 > 0; log(log 3) = 0.094 > 0 | well defined | none |
| `subspace_theorem_for_systems` | x ∈ ℚ̄ⁿ∖Kⁿ, D = 1 | EF13 (3.7) covers it; the Lean form omits it | narrower | R01 |
| `transcendental_tsum_inv_pow_three_pow` | b = 2 | q = 2^(3^(K+1)), error ≈ q^(−3), exponent 3 > 2 | Roth applies | none |

## Not verifiable

- **Matveev (Izv. Math. 64, 2000).** The text was not opened. The README's Cor. 2.3 constant is consistent with the standard statement and with its own reordering remark.
- **André, Corollary 1.7.1** (the comparison over ℂ(z) and ℚ̄(z) in §5.4): not opened.
- **E95/E96** (sharp Roth lemma, E96 Lemma 23): not opened.
- **Not opened in this review:** Wu, Yang, Kirby, Singer, Fischler–Rivoal, Yu 1990/1994, BG96, Tzanakis–de Weger, Schmidt small points, Roy–Thunder, KW26 and Soundararajan–Petrow. No sampled target rests on them alone.
- **Nishioka (LNM 1631).** Paywalled; AF22 Thm. 1.1 was used instead.
- **The board manifest** records 7 of the roughly 45 cited works. The texts fetched this round are recorded only in a scratch manifest.

## Source issues

- **Error** in E19-ch3 at Exercise 3.7(i), p. 60: the source says a nonzero algebraic α of degree d has \|α\| strictly greater than den(α)^(−d)·house(α)^(1−d); it should be ≥, since equality holds for α = 1/2 and for every root of unity; affects a stated result.
- **Misprint** in E19-ch8 at §8.3, p. 169: the source says Evertse–Schlickewei–Schmidt bound the nondegenerate solutions by exp((6n)^(4n)(r+1)); it should be exp((6n)^(3n)(r+1)), as in ESS02 Thm. 1.1, p. 808; affects nothing.
- **Misprint** in E19-ch8 at Lemma 8.15, p. 170: the source says the solutions of (8.14) lie in proper subspaces of the hyperplane H; it should refer to the homogeneous equation (8.15), which defines H; affects nothing.
- **Misprint** in B08 at the proof of Corollary 3.4.2, p. 15: the source bounds n!·\|f_k\|/k! for k > n by dividing by (n−k)!; it should divide by (k−n)!; affects nothing.
