# Review of GlobalHolomorphicFunctions (pull request #992 at dac43fb)

**Verdict:** needs changes

This is a full review. The head is the one the previous review read, and the folder has 0 changed lines since then. There are two blocking findings (P2) and six P3 findings.

## R01 (P2) — ComplexKahlerGeometry at the head of #1234 also owns four objects this roadmap owns

**Location.** `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:69`–70: "ComplexKahlerGeometry K2 owns parameter-dependent solvers, and K5a owns the complex-coefficient de Rham comparison; they consume this roadmap's scalar results and complex two-form exactness." The same claim is made at `:71`–72 (K3 and Layer 0.4) and `:2473`–2481 (Downstream consumers).

**Claim.** ComplexKahlerGeometry consumes, and does not own, four things here:
- Layer 2.5's finite-rank Runge operator;
- Layer 7.1's scalar ∂̄ solver;
- Layer 7.2's complex two-form exactness;
- Layer 0.4's identification of finite principal parts with circle coefficients.

**Witness.** In #1234 (ComplexKahlerGeometry, head af80ecf):
- `README.md:598`–599 says "The finite-rank operator and its estimate are this roadmap's own";
- `:1926`–1935 is K5a.PlanarTwoForms;
- `Suggested.lean:154`, `exists_mixed_parameter_dbar_solution`, contains the planar solver;
- the README never names GlobalHolomorphicFunctions.

**Why it matters.** On main, ComplexKahlerGeometry consumes all four (`README.md:35`, `:198`–200, `:345`, `:1637`), so this README is right about main. At #1234's head the revision builds each one itself:

| This roadmap | #1234 at af80ecf |
|---|---|
| `exists_finite_rank_runge_operator` (`Suggested.lean:154`): collar `L`, `sup_K‖f − Af‖ ≤ ε sup_L‖f‖`, and the pole-pushing Runge theorem of 2.5 | K2.FiniteRankRunge (`README.md:591`–620): the same collar and estimate, plus "Prove Runge's theorem for (Ω,K) in the form used here", by pole pushing |
| `exists_smooth_conjWirtingerDeriv_eq` (`Suggested.lean:267`) | `exists_mixed_parameter_dbar_solution` with `P` and `Q` points (`Suggested.lean:154`; `README.md:1931`–1932 uses it as the scalar solver) |
| `exists_mextDeriv_eq_complex_two_form` (`Suggested.lean:304`) | K5a.PlanarTwoForms: "The passage from the scalar solver to two-forms is this roadmap's own" |
| 0.4's last bullet (`README.md:797`–801): the coefficient of `X^(k+1)` in `principalPart` is the circle coefficient `a_(−k−1)` at every small radius | K3 (`README.md:909`–918): "prove that the coefficient of order −(k+1) of `principalPart φ` is `circleLaurentCoeff f a ρ (−(k+1))`" |

Both pull requests are open. Whichever merges second leaves two owners of each row.

**Repair.** Choose one owner per row and record the merge order in both descriptions.

- **(a) Keep the four here.** This is the direction main records. #1234 restores main's citations of Layers 2.5, 7.1, 7.2 and 0.4 in place of K2.FiniteRankRunge's Runge and operator proofs, the point case of its solver, K5a.PlanarTwoForms' solver step and the K3 coefficient comparison. This pull request's description says that #1234 is rebased on it and merges after it. This README needs no change.
- **(b) Cede them to ComplexKahlerGeometry.**
  - Delete the three Lean statements and their targets in 2.5, 7.1 and 7.2, and the last bullet's coefficient claim in 0.4.
  - Add a `From TauCetiRoadmap.ComplexKahlerGeometry` contract that cites K2.FiniteRankRunge, K2's solver and K5a.PlanarTwoForms.
  - Name #1234 in the merge-order paragraph.
  - Rewrite `:62`–72 and `:2473`–2481. The HF2 circularity argument at `:65`–68 then changes, because 7.2, 7.4 and Hyperfunctions all sit behind K2.

**Test.** After the repair, `roadmaps grep -i 'finite-rank Runge'` should list a single owner. Today it lists two: #992 and #1234.

## R02 (P2) — The Laurent decomposition of Layer 0.4 is a headline that can be stated at the pins, and `Suggested.lean` omits it

**Location.**
- `README.md:6`–7 (Summary): "Develop the comparison metric …, Cauchy–Green, the local Laurent decomposition on annuli, global smooth ∂̄ solvability, Cousin I, …".
- `:77`–81: "Layer 0.4 owns the Laurent expansion of a function holomorphic on an annulus".
- `Suggested.lean:38`–39: "Every headline theorem of the roadmap is statable at the pins."

**Claim.** Every headline that can be stated at the pins is stated.

**Witness.** `Suggested.lean` has no Laurent statement. Its carrier, `TauCeti.circleLaurentCoeff`, is at `TauCeti/Analysis/Complex/Laurent/Basic.lean:49`. The statement below elaborates in a copy of `Suggested.lean`: 23 `sorry` warnings, no error. ComplexKahlerGeometry K3 consumes the decomposition (main `README.md:345`).

**Why it is a headline.**
- It is a named classical theorem: Rainer, Theorem 7.4 and Corollary 7.5, p. 15.
- The Summary lists it beside ∂̄ solvability and Cousin I, both of which are stated.
- Scope gives it to this roadmap.
- Layers 2.5 and 4.1 and a downstream roadmap consume it.

The comparison metric of 2.2 is also in the Summary, but it is Rainer's Exercise 19 and used only inside this roadmap; I do not ask for it.

**Repair.**
- Add `import TauCeti.Analysis.Complex.Laurent.Basic` after the existing `TauCeti` imports.
- Add the theorem below to the Layer 0 section.
- Name `exists_laurent_decomposition` in 0.4 and in the module docstring's list of headlines.
- Uniqueness, the derivative law and the classification of singularities stay README targets.

```lean
/-- **Laurent decomposition on an annulus.** For `f` holomorphic on `r₁ < |z - c| < r₂`, with
`0 ≤ r₁ < r₂ ≤ ∞`, and a radius `r₁ < ρ < r₂`, the series of the circle Laurent coefficients at
radius `ρ` splits `f` into a part holomorphic on `|z - c| < r₂` and a part holomorphic on
`|z - c| > r₁` tending to zero at infinity (Rainer, Theorem 7.4 and Corollary 7.5, p. 15). -/
theorem exists_laurent_decomposition {f : ℂ → ℂ} {c : ℂ} {r₁ ρ : ℝ} {r₂ : ENNReal}
    (hr₁ : 0 ≤ r₁) (hρ₁ : r₁ < ρ) (hρ₂ : ENNReal.ofReal ρ < r₂)
    (hf : DifferentiableOn ℂ f {z | r₁ < ‖z - c‖ ∧ edist z c < r₂}) :
    ∃ fp fm : ℂ → ℂ,
      DifferentiableOn ℂ fp (Metric.eball c r₂) ∧
      DifferentiableOn ℂ fm {z | r₁ < ‖z - c‖} ∧
      Tendsto fm (cocompact ℂ) (𝓝 0) ∧
      (∀ z ∈ Metric.eball c r₂,
        HasSum (fun n : ℕ => TauCeti.circleLaurentCoeff f c ρ n * (z - c) ^ n) (fp z)) ∧
      (∀ z, r₁ < ‖z - c‖ →
        HasSum (fun k : ℕ => TauCeti.circleLaurentCoeff f c ρ (-((k : ℤ) + 1)) *
          (z - c) ^ (-((k : ℤ) + 1))) (fm z)) ∧
      ∀ z, r₁ < ‖z - c‖ → edist z c < r₂ → f z = fp z + fm z := by
  sorry
```

**Tested** on `f = 1/(z(z−1))`, `c = 0`, with circle coefficients computed over 4000 nodes:
- `r₁ = 0`, `r₂ = 1`, `ρ = 1/2`: `a_(−3..2) = 0, 0, −1, −1, −1, −1`, and `fp(1/2) + fm(1/2) = −4 = f(1/2)`.
- `r₁ = 1`, `r₂ = ∞`, `ρ = 3`: `a_0 = a_1 = a_(−1) = 0` and `a_(−2) = 1`, so `fp = 0` and `fm = f`, which tends to 0.

## R03 (P3) — RealAnalyticGeometry on main also owns scalar Cousin I, and Scope records only Hyperfunctions

**Location.** `README.md:62`–68 records that Hyperfunctions HF2 covers Layers 7.1 and 7.4 for `n = 1`, and says why the one-variable case is owned here. No other owner is named.

**Witness.** On main, `TauCetiRoadmap/RealAnalyticGeometry/README.md:811`–812 reads "Obtain scalar `H^k(X,O)=0`, k>0, … own the scalar Cousin-I splitting", for every Stein manifold X (`:730`–731). An open subset of ℂ is a Stein manifold. That route consumes ComplexKahlerGeometry K2 (`:812`).

**Repair.** After `:68`, add: "RealAnalyticGeometry R3.2 (item 1) owns scalar Cousin I and `H^k(X,𝒪)=0` on every Stein manifold, which covers Layer 7.4. Its route consumes ComplexKahlerGeometry K2, which consumes Layer 7.1, so the one-variable case is owned here."

**Test.** The two-set cover of ℂ∖{0} by the two slit planes, with `c₁₂ = 1` on `Im > 0` and `0` on `Im < 0`, is solved by `b₁ = 1 − log₁/(2πi)`, `b₂ = −Log/(2πi)`. The values of `b₁ − b₂` are 1 at `i` and at `2+0.5i`, and 0 at `−i` and at `−3−0.1i`. So 7.4's statement is the `n = 1`, `X ⊆ ℂ` case of RealAnalyticGeometry's.

## R04 (P3) — Tau Ceti's polynomial hull is not cited, although it is `holomorphicHull univ K`

**Location.**
- `README.md:1096`–1106 defines `holomorphicHull`.
- `:1353`–1354: "Specialize to polynomial approximation on compact `K ⊂ ℂ` iff `ℂ \ K` is connected."
- Neither the Scope nor the From Tau Ceti contracts (`:205`–365) mention the polynomial hull.

**Witness.** `TauCeti/Analysis/Complex/PolynomialHull/Basic.lean` defines `TauCeti.polynomialHull` on `ι → ℂ` by the same universal-bound clause (`:102`). The same file has `IsPolynomiallyConvex` (`:109`), `polynomialHull_empty` (`:129`), `polynomialHull_polynomialHull` (`:134`) and `isPolynomiallyConvex_closedBall` (`:252`).

**Repair.**
- Cite these declarations in From Tau Ceti.
- In 2.1, add a comparison target. For compact `K ⊆ ℂ`, `holomorphicHull univ K` is the image of `TauCeti.polynomialHull` of `K` under `ℂ ≃ (Fin 1 → ℂ)`. The proof is that Taylor polynomials of an entire function converge uniformly on `K`.
- State 2.5's polynomial case as: `K` is polynomially convex iff `ℂ ∖ K` is connected iff polynomials are dense in `O(K)`.
- Add a Check: for the unit circle both hulls are the closed unit disc. The function `z` excludes `1.5`, since `1.5 > 1`, and the maximum principle includes `0.5`.

## R05 (P3) — Layer 2.4 promises a rectangle/wedge-integral comparison that it never states

**Location.** `README.md:1312`–1313: "Supply the rectangle/wedge-integral comparison to this contour API."

**Claim.** This is a target of 2.4.

**Witness.** No statement, hypotheses, Check or consumer follows. Layer 0.2's Morera bridge (`:617`–623) works directly with Mathlib's `Complex.IsConservativeOn` and `TauCeti.morera` (`TauCeti/Analysis/Complex/Conformal/Morera.lean:40`). `wedgeIntegral` is at `Mathlib/Analysis/Complex/HasPrimitives.lean:96`.

**Repair.** State it, or delete the sentence. Statement:

> For `z, w ∈ ℂ` and `f` continuous on the boundary of `Rectangle z w`, the Tau Ceti contour integral over the closed polygon `z → w.re + z.im·i → w → z.re + w.im·i → z` equals `wedgeIntegral z w f + wedgeIntegral w z f`.

Add three Checks:
- reversing the corners negates both sides;
- a degenerate rectangle gives 0;
- `f = z̄` on the unit square gives `2i`.

**Tested.** For `f = z̄`, `z = 0`, `w = 1+i`, the sum of the two wedge integrals is `2.0000000i`, and so is the four-segment contour integral (20000 nodes per edge).

## R06 (P3) — Two sampled targets, 6.5 and 7.2, have no source locator

**Location.**
- 6.5 ends with "These are the explicit local-pole calculations for the preceding examples." (`README.md:2177`–2178), with no locator.
- 7.2 (`:2263`–2386) cites no source for its exactness theorems.

**Witness.**
- 6.5's rule, that `f′/f` has residue `m` at a zero of order `m`, is Rainer, Theorem 8.2 and its proof, pp. 18–19 (rainer lines 941, 963).
- 7.2 obtains both exactness theorems from the scalar solver, which is Rainer, Theorem 12.2, p. 31 (rainer line 1630).

**Repair.**
- At the end of 6.5's first paragraph, add "(Rainer, Theorem 8.2 and its proof, pp. 18–19, rainer lines 941 and 963)".
- In 7.2, after "apply GH5 to `h`", add "(Rainer, Theorem 12.2, p. 31, rainer line 1630, applied to `h` and to `h/2`)".

**Tested.**
- For `(z−1)²(z+2)`, the residue of `f′/f` at 1 is `2.000000`.
- `−π tan(πz)` has residue `1.000000` at `1/2` and `0` at `0`, as 6.5's third Check says.

## R07 (P3) — 6.3 gives the direction of `z ↦ −iz` backwards

**Location.** `README.md:1989`–1991: "after the substitution `z↦−iz`, which carries the right and left half-planes and the imaginary axis to the upper and lower half-planes and the real axis."

**Witness.** `−i·1 = −i`, so `z ↦ −iz` sends the right half-plane to the lower half-plane. It is the upper half-plane that it carries onto the right one: `−i·i = 1`.

**Repair.** Replace the clause with: "with `P_n(z) = p_n(−iz)` for Rainer's `p_n`; the map `z ↦ −iz` carries the upper and lower half-planes and the real axis onto the right and left half-planes and the imaginary axis."

**Tested.** For `Im z > 0`, `Re(−iz) = Im z > 0`, so `P_n(z) → 1`. For `z ∈ ℝ`, `−iz ∈ iℝ`, so `P_n(z) → 0`.

## R08 (P3) — The pull-request description still declares #886 a dependency and describes files the folder lacks

This is R01 of the previous review, unchanged since the ninth review. The fix is in the description, not the folder.

**Location.** The description of #992 contains:
- "- [ ] depends on: #886";
- "`ProductCotangentTargets.lean` supplies eight actual formula definitions";
- "twenty-eight intentional proof-target admissions";
- the depends-on entry "#886 DifferentialGeometry";
- the merge-order line "#886 (DifferentialGeometry) → **this pull request** (#992)".

**Witness.** `README.md:27` says "DifferentialGeometry is not a supplier". DifferentialGeometry is on main, so #886 is a revision and never a dependency. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`, and the build gives 22 `sorry` warnings.

**Repair.**
- Delete the #886 task line; the depends-on and merge-order blocks are generated from it.
- Delete the passages about `ProductCotangentTargets.lean`, the "GH4 paired-cotangent proof", the 28/18 admission counts and the ZerosOfLFunctions #253 coordination paragraph (ZerosOfLFunctions is on main).
- Name the suppliers as the README does: ZerosOfLFunctions, AnalyticNumberTheoryPartI and ConformalMapping, all on main.
- Add the order with #1234 that R01 settles.

**Test.** The dependency check (below) reports `0 problem(s)`, so after the repair the depends-on block is empty.

## Previous findings

- R01 of the previous review (the description) is not repaired. The description still contains "- [ ] depends on: #886" and "twenty-eight intentional proof-target admissions". It is carried as R08.

## Verified sound

### Gate, build and Lean form
- **Gate.** I ran it myself on dac43fb. The output ends with every counter at 0 and `OK`, and it exits 0 in 9.9 s. The worker's run, which includes the targeted build, also reports OK.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalHolomorphicFunctions'` is empty.
- **Build.** `lake env lean` on `TauCetiRoadmap/GlobalHolomorphicFunctions/Suggested.lean` exits 0 in 13.4 s. The only messages are 22 "declaration uses `sorry`" warnings, at lines 51, 72, 91, 109, 129, 141, 154, 172, 182, 191, 199, 213, 225, 238, 250, 267, 276, 287, 304, 312, 320 and 327. The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`.
- **Signatures.** A scratch copy with `#check @name` for all 24 declarations elaborates.
  - Every elaborated type keeps its binders: `[SeminormedCommRing R]`, `[Countable S]`, `hΩ`, `hE`, `hEΩ`, `hRunge`, `hU`, `hKU`, `hbounded`, `hclosure`, `htrace`, `hindex`, `hf`, `hcover`, `hcycle`.
  - Each type matches its README statement in generality. 4.1's Lean form takes any germ meromorphic at `a`, which is equivalent to a finite principal part.
  - No change from `scratch/signatures.md`.
- **One-tactic probe.** I replaced every `sorry` by `first | rfl | infer_instance | (simp; done) | trivial | sorry`. All 22 theorems still warn, so none closes in one tactic.
  - Two are short corollaries, but not padding by this test: the sharp bound is a ten-line induction, and `exists_smooth_closed_completion` takes five lines from the solver.
- **Form.**
  - Imports: `import Mathlib` plus five `TauCeti.*` modules, all present at the pin.
  - No `set_option`, `lemma`, sorry'd data, `#eval` or `True` placeholder.
  - `IsRungeCompactPair` and `holomorphicHull` have real bodies.
- **Headlines.** The README has no explicit list, so I took the Summary and the Scope ownership statements. The following are stated:
  - Looman–Menchoff (0.2);
  - the sharp product bound (1.4);
  - the weighted and native-divisor genus-one products (1.2);
  - the Runge equivalence, the hull equality and the finite-rank operator (2.5);
  - zero-free approximation and zero and signed divisor realization (3.1);
  - branchwise noncontinuation (3.2);
  - Mittag–Leffler, isolated singularities and the quotient (4.1);
  - Cauchy–Pompeiu on a cycle (6.4);
  - the solver and closed completion, scalar and on forms (7.1, 7.2);
  - complex and real two-form exactness and `H²_dR = 0` (7.2);
  - Cousin I (7.4).

  Only the Laurent decomposition (0.4) is missing (R02).

### Dependency check

```text
depcheck: 235 roadmaps, 2266 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The merge order places GlobalHolomorphicFunctions at line 97, after ZerosOfLFunctions (48) and AnalyticNumberTheoryPartI (50). ConformalMapping, Hyperfunctions and ComplexKahlerGeometry are on main.

### Seeded source sample (15 targets)

All four sources are in the cache.

| Target | Locator in the README | Checked at | Result |
|---|---|---|---|
| 0.2 Looman–Menchoff | Gray–Morris Thm 3, p. 247; App. Lemma 1, pp. 252–254 | gray-morris lines 66–70 (hypotheses (i)–(iii) on a domain); 315–325; 338–394 | Correct. The README drops connectedness, which is fine because the claim is local. Lemma 1 is false as printed (Source issues); the README adds `1/2 ≤ w/h ≤ 2`. |
| 0.3 Cauchy–Green | Rainer Thm 10.2, pp. 23–24; Thm 10.3, p. 24 | rainer 1255–1257 (`u = −π⁻¹∫f/(ζ−z)`), 1295–1298 | Correct. The sign `(1/π)∫f∂̄α/(ξ−ζ)` agrees with (10.6). |
| 0.4 Laurent | L7.1, C7.2 p. 14; L7.3 pp. 14–15; T7.4, C7.5 p. 15; T7.6 p. 16 | rainer 674, 682, 692, 716, 754, 790 | Correct. C7.5 gives uniqueness of the splitting with `f₋ → 0`. |
| 1.2 genus-one products | Rainer Thm 14.3, pp. 35–36 | rainer 1868–1880 | Correct, as the product theorem used. |
| 1.4 sharp majorant | proof of Prop 14.2, p. 35 | rainer 1843–1853 (monomial comparison) | Correct. |
| 2.1 hulls | Lemma 11.3 (1), (2), (4), pp. 27–28; Thm 12.1 proof, p. 31 | rainer 1437–1443, 1609–1611 | Correct. Item (5) is not used. |
| 2.3 `O(K)` | §11, p. 25 | rainer 1333–1335 ("in general it is not closed") | Correct. |
| 2.4 contour estimate | none in the literature; derived from `intervalIntegral.norm_integral_le_of_norm_le` and `Cycle.norm_integral_le_of_norm_le_const` (`TauCeti/Analysis/Contour/Cycle/Basic.lean:400`) | both declarations opened | The estimate is sound. The comparison sentence is R05. |
| 2.5 Runge | Thm 11.1, p. 25; Thm 11.7, p. 29; L11.3 (3) | rainer 1338–1344, 1550–1554, 1440 | Correct. Rainer's "domain" is a nonempty open set (rainer line 81). |
| 6.1 products | DLMF (4.22.2), (4.22.3), (5.8.2); `TauCeti.hasSum_cotTerm_two_mul` | dlmf-4-22 lines 77–80, 104–109 (`z ≠ nπ`); dlmf-5-8 line 79; `TanhSeries.lean:64` | Correct at the argument `πz`. |
| 6.2 theta and ratios | Thm 14.3 | rainer 1868 | Correct. |
| 6.4 Cauchy–Pompeiu | Prop 10.1, p. 23 | rainer 1216–1220, 1253 (`dξdη = −(2i)⁻¹dζ∧dζ̄`) | Correct. The −π⁻¹ area sign follows. |
| 6.5 log-derivatives | none | Theorem 8.2 found at rainer 941, 963 | R06. |
| 7.1 solver | Thm 12.2, p. 31 | rainer 1630–1633 | Correct. |
| 7.2 forms | none | Theorem 12.2 found at rainer 1630 | R06. |

Further locators checked:
- 3.1: Lemma 15.1, Prop 15.2, Thm 15.3 at rainer 1934, 1950, 1997.
- 3.2: Thm 15.5 at rainer 2086.
- 4.1: Thms 12.1, 15.6, 15.7 at rainer 1603, 2116, 2126.
- 1.1 and 1.3: Remark 15.4 at rainer 2030.
- 2.2: (11.2) and Exercises 19–20 at rainer 1316–1332.
- 6.3: Exercise 22 at rainer 1592 (direction slip in R07).
- 7.4: Prop 12.3 and Thm 12.4 at rainer 1658, 1689; the convention `f_i − f_j = f_ij` matches `b i − b j = c i j`.

### Library declarations opened at the pins

**Mathlib.**
- `Finset.norm_prod_one_add_sub_one_le` (`Analysis/SpecialFunctions/Log/Summable.lean:137`, under `[NormedCommRing R] [NormOneClass R]`, `:129`).
- `tprod_one_add_ne_zero_of_summable` (`:214`, needs `CompleteSpace`, `NormMulClass` and nonzero factors).
- `cot_series_rep` and `cotTerm_identity` (`Trigonometric/Cotangent.lean:233`, `:207`).
- `HasProdLocallyUniformlyOn_euler_sin_prod` (`:136`).
- `logDeriv_prod` (`Analysis/Calculus/LogDeriv.lean:104`).
- `wedgeIntegral` and `IsConservativeOn` (`Analysis/Complex/HasPrimitives.lean:96`, `:111`).
- `Complex.volume_closedBall` (`MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:427`).
- `ComplexMeasure.HaveLebesgueDecomposition`, `rnDeriv` and `singularPart_add_withDensity_rnDeriv_eq` (`VectorMeasure/Decomposition/Lebesgue.lean:414`–440).
- `ComplexMeasure.absolutelyContinuous_ennreal_iff` (`Measure/Complex.lean:113`).
- `TendstoLocallyUniformlyOn.deriv` (`Analysis/Complex/LocallyUniformLimit.lean:154`).
- `contMDiffAt_subtype_iff` (`Geometry/Manifold/ContMDiff/Basic.lean:363`).
- `Metric.eball` (`Topology/EMetricSpace/Defs.lean:64`).

In all, 52 Mathlib names cited by the README and its supplier sections resolve at the pin.

**Tau Ceti.**
- `IsFilledIn` (`Topology/FilledIn.lean:61`). Its relative compactness is "compact closure contained in Ω", the same set as on the right of `holomorphicHull_eq_fill`.
- `IsOpen.isFilledIn_closedBall_sdiff_thickening` and `IsOpen.exists_isFilledIn_compact_exhaustion` (`Analysis/Normed/Module/Exhaustion.lean:57`, `:86`). The second builds the 2.1 stages internally (`:89`) but does not export them, as the README says.
- Pompeiu identities (`Analysis/Complex/Pompeiu/Basic.lean:163`, `:219`, `:261`, `:286`).
- `circleLaurentCoeff` (`Analysis/Complex/Laurent/Basic.lean:49`).
- `Cycle.green_winding` (`Analysis/Green/Cycle.lean:36`). It needs `IsIn`, `C¹` fields and `IsNullHomologous`, as stated at `README.md:348`.
- `Cycle.homologyCauchyTheorem` (`Contour/Cycle/HomologyCauchy.lean:261`).
- `Cycle.exists_int_windingNumber_of_not_mem_trace` (`Cycle/Winding.lean:137`).
- `IsPiecewiseC1On.windingNumber_eq_of_mem_connectedComponentIn` (`Winding/LocallyConstant.lean:138`).
- `IsJordanCurve.*` (`PlaneSeparation/Inside.lean:103`–190).
- `deRhamCohomology.mk_surjective` and `mk_eq_zero_iff`, and `mem_closedForms_of_finrank_le` (`Geometry/Manifold/DeRham/Basic.lean:159`, `:170`, `:121`).
- `mpullback_complexDz` (`DifferentialForm/Plane/Complex.lean:103`).
- `norm_tprod_one_add_sub_one_le` (`Analysis/Normed/Ring/InfiniteProd.lean:47`). It is an infinite-product exponential bound, not the sharp finite bound, so 1.4 duplicates nothing.

**Not found at the pins.** I found no Looman–Menchoff, Runge, Mittag–Leffler, Weierstrass divisor theorem, global ∂̄ solver, Cousin theorem or annulus Laurent expansion. The nearest objects are:
- the Fuchsian-cusp Laurent `q`-expansion (`Complex/Fuchsian/Cusp/Laurent.lean`);
- the compact-support potential `exists_contDiff_conjWirtingerDeriv_apply_one_eq_of_hasCompactSupport`;
- `polynomialHull` (R04);
- the Jordan index theorem of ConformalMapping §5.6, which is not at the Tau Ceti pin, so it is correctly cited from the roadmap on main.

### Cross-roadmap citations resolved

- **ZerosOfLFunctions 5.1–5.4** (main `README.md:929`–987). 5.2 has `E₁`, `deriv E₁ z = −z exp z`, `logDeriv`, and `‖E₁ z − 1‖ ≤ C‖z‖²` for `‖z‖ ≤ 1/2`, as the contract says.
- **AnalyticNumberTheoryPartI §0.15** (`:530`–552). It has `elementaryFactor`, `exists_entire_primary_product_exact` over any countable index (`Suggested.lean:346`, `:351`) and the fibre-grouping bullet (`:537`).
- **AnalyticNumberTheoryPartI §0.15a** (`:554`). `exists_entire_exp_mul_of_divisor_eq` (`:363`) carries both nonvanishing hypotheses.
- **ConformalMapping §5.3 and §5.6** (`Completed/ConformalMapping/README.md:787`, `:906`). `jordan_index_of_isPiecewiseC1On` (`Suggested.lean:640`) matches the contract, including `σ ∈ {1, −1}` and `0` off `filledHull`.
- **Hyperfunctions HF2** MalgrangeTopVanishing (main `:190`–235) matches `README.md:62`–68.
- **ComplexKahlerGeometry on main** (`:35`, `:198`–200, `:345`, `:1637`) matches Downstream consumers; see R01 for #1234.
- `overlaps.md` and `citations.md` report nothing.

**Ownership searches** (`roadmaps grep -i --readme-only`): Looman, Runge, Mittag, Cousin, Pompeiu, holomorphic hull, polynomially convex, natural boundary / domain of holomorphy, Weierstrass theorem, finite-rank Runge, GlobalHolomorphicFunctions. The hits that matter are #1234 (R01) and RealAnalyticGeometry (R03). The others are unrelated or consumers:
- AdicSpacesPartIV (rigid Runge immersions);
- the Mittag-Leffler condition for towers;
- SchemeAndStackFoundations' Cousin complexes;
- ComplexComparisonPartII #848, which consumes K2.

### Adversarial pass

`S` is `Suggested.lean` and `R` is `README.md`. All values were computed this round with my own scripts. Series are truncated as stated, circle integrals use 4000–20000 nodes, and areas use polar grids.

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| S Looman–Menchoff (0.2) | `z²` at `1+i`; `z̄`; `exp(−z⁻⁴)`, `f(0)=0`; `Ω=∅` | `f_y = −2+2i = i f_x`; `f_y = −i`, `i f_x = i`, excluded by CR; difference quotients at 0 are `0, 0` (t = 0.1, 0.05), but `|f| = 11.489, 64.388, 2244.077` at r = 0.8, 0.7, 0.6 on arg π/4, excluded by `hcont`; vacuous | Pass | none |
| R 0.2 balanced estimate | `[0,20]×[0,1]`, `E` the two corners, `φ = y(20−x)(1−e^{−10x})`, `N=1` | left side `198.010` against `5N·m(R∖E) = 100`; the N-Lipschitz conditions hold, with violation `0` | Pass (the README carries the aspect ratio) | none (source issue) |
| R 0.3 normalization | radial `ψ=(1−r²)³`; kernel on the unit disc | `∫ψ′ = −1.000000 = −φ(0)`; `∫|ζ|⁻¹ = 6.283185 = 2π` | Pass | none |
| R 0.4 coefficients and splitting | `1/(z(z−1))`, ρ = 1/2 and 2 | `a_{−3..2} = 0,0,−1,−1,−1,−1`; `a_{−4..1} = 1,1,1,0,0,0`; split `−4 = −4` at 1/2, `0.5 = 0.5` at 2 | Pass | none |
| R 0.4 essential singularity and principal part | `e^{1/z}`; `(z+1)/z²` | `a_{−1},a_{−2},a_{−3},a_0,a_1 = 1, 0.5, 0.166667, 1, 0`; tail `0.0016152`; `a_{−3..1} = 0,1,1,0,0`, i.e. `X²+X` | Pass | none |
| Candidate `exists_laurent_decomposition` (R02) | `1/(z(z−1))`, `(r₁,r₂,ρ) = (1,∞,3)`; elaboration | `a_0=a_1=a_{−1}=0`, `a_{−2}=1`, so `fp=0` and `fm=f`; 23 `sorry`, 0 errors | Pass | add (R02) |
| R 1.1 primary-factor derivatives | `E₂′(−1)`; `E₁′(1)`; `E_p′/E_p` at `0.3+0.4i`, p = 0, 1, 3 | `−0.6065307 = −e^{−1/2}`; `−2.7182818 = −e`; `−1.0769231−0.6153846i`, `−0.0769231−0.6153846i`, `0.1530769+0.0246154i`, each equal to `−w^p/(1−w)`; `log|E₁(1/2)| = −0.193147 ≤ 0.25` | Pass | none |
| S `exists_entire_genusOne_product` (1.2) | `S={n²}`, `z=2+i`, 2·10⁵ factors; `S={1}`, `m=2`; `S=∅` | `−0.4312778−9.3328073i` against `e^{π²z/6} sin(π√z)/(π√z) = −0.4312778−9.3328073i`; `(1−z)²e^{2z} = 0.6795705` at 1/2, order 2 at 1; `F=1` | Pass | none |
| S `exists_entire_genusOne_product_of_divisor` | `D=2[1]`; `D=[1]−[2]`; `D 0 = 1` | divisor 2 at 1; excluded by `hD`; excluded by `hDzero` | Pass | none |
| R 1.3 logarithmic derivative | `∏_{n≤N}(1−z²/n²)` on `|z−0.5i|=0.3` | `sup|P′/P−F′/F| = 0.1520, 0.0317, 0.0080` for N = 10, 50, 200 | Pass | none |
| S sharp bound (1.4) | 20000 random complex families of size 0–7, some with `u₀=−1`; `ℤ₃`, `u=(3,3)`; norm `2|z|`, `u=(1,1)`; empty | `max(lhs−rhs) = 2.2·10⁻¹⁶`; `0.3333 ≤ 0.7778`; `6 ≤ 8`; `0 ≤ 0` | Pass | none |
| R 1.5 uniform tail | `X=ℕ`, `u_n = [x=n]/(n+1)` | tail at `N=9` is `0.1`; `Σ sup = Σ1/(n+1)` diverges | Pass | none |
| R 2.1 explicit stages | unit disc, `K_0, K_1, K_2` | radii `0, 0.5000, 0.6667`, and `0 ∈ int K_1` | Pass | none |
| S `holomorphicHull`, `holomorphicHull_eq_fill`, `IsRungeCompactPair` | `{2≤|z|≤3}` in `D₄`; in `{1<|z|<4}`; unit circle in ℂ; `K=∅` | hull = closed 3-disc on both sides; hull = `K` (`|1/1.5| = 0.667 > 0.5`); closed unit disc on both sides, as the polynomial hull (R04); `∅` (`B=−1`) | Pass | cite (R04) |
| R 2.2 metric | constants differing by 1; constants `1/(n+1)` | `0.500000`; `0.500000, 0.333333, 0.142857 = 1/(n+2)` | Pass | none |
| R 2.3 `O(K)` not closed | `Σzⁿ/(n+1)²` along the radius | `Σ n r^{n−1}/(n+1)² = 1.238, 3.078, 5.281` at r = 0.9, 0.99, 0.999 | Pass | none |
| R 2.4 wedge comparison (R05) | `f=z̄`, `z=0`, `w=1+i` | wedge sum `2.0000000i`; square contour `2.0000000i` | Fail: not stated | state or cut (R05) |
| S Runge equivalence (2.5) | annulus in `D₄`, `f=1/z`; `K=∅` | `∮dz/z = 2πi` against `0` for every disc-holomorphic `g`, so both sides are false; both sides true | Pass | none |
| S `exists_finite_rank_runge_operator` | `K` = closed unit disc, `Ω=ℂ`, `L` = closed disc of radius 1.6, 60 nodes on `|ζ|=1.5`, `g_j` degree-199 Taylor polynomials | `sup_K|f−Af|/sup_L|f| = 1.9·10⁻¹¹, 1.5·10⁻¹¹, 2.5·10⁻¹³, 1.7·10⁻¹¹` for `1/(z−3)`, `e^z`, `z¹⁰`, `1/(z+2.6i)`, with one operator for all four | Pass | owner (R01) |
| S zero-free approximation (3.1) | `K={1≤|z|≤2}`, `Ω=ℂ∖{0}`, `u=z−1/2` | `G_N(1) = 0.6065307, 0.5134171, 0.5000412` for N = 1, 3, 10, tending to 0.5; winding on `|z|=3/2` of `(z−1/2)/(z−3)` is `1.0000` and of `(z−1/2)/z` is `0.0000` | Pass | none |
| S zero orders, signed divisor, quotient | `m=0`; `2[0]−[1]`; `F=cot` | `f=1`; `z²/(z−1)`, orders 2 and −1; `(cos, sin)`, with `sin ≠ 0` codiscretely | Pass | none |
| S boundary germ (3.2) | `Ω=ℂ∖{0}`, `f=sin(1/z)`; `Ω=∅`, `ℂ` | zeros `1/(kπ) → 0` force order `⊤` for any meromorphic extension at 0, while `f(2/π) = 1`; frontier empty | Pass | none |
| S Mittag–Leffler and isolated singularities (4.1) | `E=ℤ`, `P_n=1/(z−n)`; `U₀=B(0,1/2)`, `φ₀=1/z+1/(z−1/2)` | `π cot(πi) = −3.1533481i` against `−i(1+2S₁) = −3.1533471i`; `f=1/z`, remainder `−1/(z−1/2)` analytic at 0 | Pass | none |
| R 6.1 cosine and Gamma products | `cos(πz)` at `0.2−0.3i`; `1/Γ(1/2)` | `1.1957245+0.6397076i` against product `1.1957245+0.6397072i`; `0.5641896` against `0.5641897` | Pass | none |
| R 6.1 tangent expansion | `z=0.3+0.2i` | `−π tan(πz) = −1.8790445−3.1898155i`, paired sum `−1.8790430−3.1898145i`; `π cot 2πz − (π/2) cot πz = −0.9395222−1.5949078i`, which is half | Pass | none |
| R 6.1 shifted sine | `α=0.3`, `z=0.7+0.2i`, `|n| ≤ 2·10⁵` | `−0.6704840i` against `0.0000009−0.6704855i` | Pass | none |
| R 6.2 theta, `e^z−1`, shells | `r=0.4`, `z=0.2+0.7i`; `z=0.9+2.1i`; N = 1, 2, 3, 10 | ratio `1.5654995−1.3186021i = r⁻¹e^{−z}`; `−2.2417210+2.1231524i` against `−2.2417211+2.1231535i`; 4, 8, 12, 40 points, `Σ|λ|⁻³ = 4, 1.9142, 0.8637, 0.0798 ≤ 11.3137, 2.8284, 1.2571, 0.1131` | Pass | none |
| R 6.3 half-plane substitution (R07) | images of `1` and `i` under `z↦−iz`; crescent at `−1/2` | `−i` (lower) and `1` (right); `|z| = 0.5`, `|2z−1| = 2` | Fail on direction | reword (R07) |
| S `cauchyPompeiu` (6.4) | `Δ = D(0,1)∖B̄(0.4,0.3)`, `f = z²z̄+z̄²`, `∂̄f = z²+2z̄`, `ξ = −0.5+0.1i` | boundary `−0.5851921+0.0916318i`, area/π `−0.6951932−0.0343687i`; formula `0.1100011+0.1260004i` against `f(ξ) = 0.11+0.126i`; with the area sign reversed, `−1.2804+0.0573i` | Pass | none |
| R 6.4 boundary cycle | unreversed and reversed annulus; overlapping holes | `2.0000` and `0.0000` at 0, `1.0000` at 3/2; `−1.0000` at 0 | Pass | none |
| R 6.5 residues (R06) | `(z−1)²(z+2)` at 1; `−π tan(πz)` at 1/2 and 0 | `2.000000`; `1.000000`, `0.000000` | Pass | locator (R06) |
| S `exists_smooth_conjWirtingerDeriv_eq` (7.1) | `f=zz̄²`, `u=zz̄³/3` at `0.3+0.8i` | `u_x+iu_y = 0.43800−1.16800i = 2f` | Pass | owner (R01) |
| S `exists_smooth_closed_completion` | `f=z̄z²`, `g=zz̄²` at `0.3+0.8i` | `g_x+ig_y = 2.92000 = f_x−if_y` | Pass | none |
| S `exists_smooth_closed_completion_form` | `f=z`, `g=z̄`; `g=0` | `∂f−∂̄g = 1−1 = 0`; `g=0` leaves `dz∧dz̄`, of value `−2i` on `(1,i)` | Pass | none |
| S complex exactness (7.2) | `η = z̄ dz∧dz̄`, `β = −(z̄²/2)dz` at `0.3+0.8i` | `dβ(1,i) = −1.60000−0.60000i = η(1,i)`; with `+u dz`, `1.6+0.6i` | Pass | owner (R01), locator (R06) |
| S real exactness and `H²_dR` (7.2) | `h=1+x²`, `u = z̄/2 + (z²z̄+zz̄²+z̄³/3)/8`; circle | `(Re u)_x−(Im u)_y = 1.09000 = h`; swapped `−0.12000`; on `S¹` every one-form is closed but `H¹ = ℝ` | Pass | none |
| R 7.3 disc moments | (0,0), (1,0), (1,1), (2,2), (3,3) | `3.141593, 0, 1.570796, 1.047197, 0.785398` against `π/(m+1)` and `0` | Pass | none |
| S `additive_cousin_I` (7.4) | slit-plane cover of `ℂ∖{0}`; one-set cover | `b₁−b₂ = 1, 1, 0, 0` at `i`, `2+0.5i`, `−i`, `−3−0.1i`; `3c₁₁ = 0` | Pass | record (R03) |

The table has 38 rows. It covers the 15 sampled targets, all 22 theorems and both definitions of `Suggested.lean`, and every target a finding touches.

## Not verifiable

- None. All four sources in the manifest (rainer, gray-morris, dlmf-4-22, dlmf-5-8) are in the cache and certified, and I read every locator above there. No locator in the README is flagged as unverified.

## Source issues

- **Error** in gray-morris at Appendix, Lemma 1, p. 253: the source asserts the `5N·m(R−E)` bound for every closed rectangle R; it should restrict R to bounded side ratio, since `[0,20]×[0,1]` with E the two corners gives 198.0 against 100; affects the proof.
- **Gap** in rainer at proof of Proposition 15.2, p. 37: the source applies Lemma 15.1 near K without naming the domain whose complement contains `b_i` and `a_j` in one component; it should apply it on ℂ∖P for a path P from `b_i` to `a_j` inside `V_j`; affects the proof.
- **Misprint** in rainer at proof of Proposition 15.2, p. 37: the source concludes `|f−G|_K < 2ε` while the proposition asserts ε; it should run the argument with ε/2; affects nothing.
- **Misprint** in rainer at proof of Theorem 14.3, p. 36: the source says the uniformly Cauchy partial products make `f_N` uniformly convergent; it should say `p_N`; affects nothing.
- **Gap** in rainer at proof of Theorem 15.7, p. 40: the source applies Theorem 12.1, which needs singular parts holomorphic on ℂ minus the point, to `φ_a/g`, given only near a; it should first replace it by its negative Laurent part (Corollary 7.5); affects the proof.
