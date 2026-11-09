# Review of DiophantineApproximationAndTranscendence (pull request #1906 at d46d487)

**Verdict:** needs changes

The gate, the dependency check and the elaboration all pass. Seven of the previous review's eight findings are repaired; R03 is partly repaired (see R02 below). One P2 and three P3 findings remain.

## R01 (P2) — The explicit §4.4 bounds are statable, but `Suggested.lean` states only finiteness

**Location.**
- `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md` line 2850 (`baker_superelliptic`): "Explicitly (Bérczes–Evertse–Győry 2013, Theorems 2.1 and 2.2 with K=ℚ, S={∞} …): every solution satisfies log max(1, |x|), log max(1, |y|)≤(6N)^(14n³N³)·e^(8n²N³ĥ)".
- Line 2854 (`schinzel_tijdeman`): "Explicitly (… Theorem 2.3 …): n≤(10N²)^(40N)·e^(11Nĥ)".
- Line 2806 (`tijdeman_gap`): "y−x≥y(e log y/log 2)⁻C".
- `Suggested.lean` lines 729–746 and 697–699, and the module docstring at lines 55–56: "the Layer 4 statements below give the explicit exponent bounds that carry it".

**Claim.** The README states these three targets with explicit bounds. The Lean declarations of the same names state only finiteness (`baker_superelliptic`), `∃ C` (`schinzel_tijdeman`) or `∃ c₁ c₂` (`tijdeman_gap`).

The BEG13 bounds use only integers, real logarithms and `Real.exp`, so they are statable at the pins. The module docstring's claim that the Layer 4 statements carry explicit bounds is therefore false for §4.4. The README and the Lean differ in strength under one name.

**Witness.** BEG13 lines 129–141 (Thms. 2.1–2.3, p. 4) at `K = ℚ`, `S = {∞}`: s = d = |D_K| = Q_S = P_S = 1, and ĥ = log max(1, |b|, |aᵢ|). This gives exactly the README's three bounds.

**Repair.** State the explicit forms. The following elaborates against the pins with only `sorry` warnings:

```lean
theorem baker_superelliptic … :
    let N : ℝ := f.natDegree
    let h : ℝ := Real.log (max 1 (max |(b : ℝ)| ((f.support.sup fun i ↦ (f.coeff i).natAbs : ℕ) : ℝ)))
    let B : ℝ := if 3 ≤ n then (6 * N) ^ (14 * (n : ℝ) ^ 3 * N ^ 3) * Real.exp (8 * (n : ℝ) ^ 2 * N ^ 3 * h)
      else (4 * N) ^ (2 ^ 12 * N ^ 4) * Real.exp (50 * N ^ 4 * h)
    {p : ℤ × ℤ | b * p.2 ^ n = f.eval p.1}.Finite ∧
      ∀ x y : ℤ, b * y ^ n = f.eval x → Real.log (max 1 |(x : ℝ)|) ≤ B ∧ Real.log (max 1 |(y : ℝ)|) ≤ B
```

For `schinzel_tijdeman`, conclude `(n : ℝ) ≤ (10 * N ^ 2) ^ (40 * N) * Real.exp (11 * N * h)` for every solution with `y ∉ {0, ±1}`.

For `tijdeman_gap`, take the Baker bound as a hypothesis, as `sUnitEquation_exponent_bound` does, and conclude `y / (Real.exp 1 * Real.log y / Real.log 2) ^ C ≤ y - x`. Alternatively, keep the existential form and change the README to match.

Checked on y³ = 2x(x − 3) (solutions (−1, 2) and (4, 2), ĥ = log 6) and on y³ = x² − 1 ((3, 2), ĥ = 0): both bounds hold.

## R02 (P3) — Four Layer 3 inputs of the Layer 4 table have no labelled statement

This finding is partly re-raised from R03 of the previous review: that repair covered the fifteen names listed there, but not these four.

**Location.**
- README line 2741–2745 (the Layer 4 table): "matveev_rat; absorb its 2/3 prefactor …", "baker_lower_bound_prod_sub_one, or matveev_prod_sub_one", "yu_rat, with the sign −1".
- The dependency trace at lines 2562–2565.

**Claim.** On main these four names were `Suggested.lean` declarations, and the README referred to them by those names. This head removes the declarations, as it should, but it does not label the README statements that replace them:
- `baker_lower_bound_prod_sub_one` is line 2429, "For fixed nonzero algebraic α₁,…,α_m, there is effective C′>0 …";
- `matveev_rat` is line 2523;
- `matveev_prod_sub_one` is line 2527;
- `yu_rat` is line 2695.

A reader of the table cannot find what is consumed. An open roadmap also cites one of them.

**Witness.** EffectiveDiophantineMethods `README.md:1701` (open pull request) cites "DiophantineApproximationAndTranscendence §3.7 `(yu_rat)`". `yu_rat` is declared nowhere at this head; main's `Suggested.lean:2698` declared it.

**Repair.** Label each statement in the form the gate accepts:
- "Prove baker_lower_bound_prod_sub_one: for fixed nonzero algebraic …" (line 2429);
- "Prove matveev_rat: for nonzero rational …" (line 2523);
- "Prove matveev_prod_sub_one: let L⊆ℂ …" (line 2527);
- "Prove yu_rat: let p be a prime …" (line 2695).

## R03 (P3) — The README says Tau Ceti carriers are not defined again, then "Define"s them

**Location.**
- README lines 12–15: "Its carriers (… approximation exponents, …) … are pinned Tau Ceti declarations … these sections build on them and do not define them again".
- Line 393: "Define `simultaneousExponent θ`".
- Lines 438 and 451: "Define `BadlyApproximable ξ`" and "Define `LittlewoodConjecture`".
- Line 2053: "Define `algebraicLogs`".
- Line 1122: "Define `LinearRecurrence.IsNondegenerate`".

**Claim.** Each of these is a pinned Tau Ceti definition with the same name and the same mathematics. The roadmap contradicts itself:
- `TauCeti.algebraicLogs` is listed under "From Tau Ceti" (line 84);
- `Suggested.lean` imports and uses `LinearRecurrence.IsNondegenerate` from Tau Ceti;
- §0.5 calls the four sibling exponents "Tau Ceti's" but "Define"s `simultaneousExponent`.

The same holds for:
- `primitiveMinpoly` and `mahlerMeasure` (lines 142 and 175);
- `Polynomial.l1Norm` (483) and `scalarSumHeight` (1025);
- `blockHomogenize` (1727);
- `hermiteIntegral`, `expEval`, `galConj`, `auxPoly` and `auxValue` (2073–2127);
- `boundedDivisors` (2759).

**Witness.** Pinned: `SimultaneousExponent.lean:61`; `BadlyApproximable.lean:62,248`; `AlgebraicLogs.lean:59`; `LinearRecurrence/Nondegenerate.lean:44`; `Minpoly/Primitive.lean:92`; `Height/MahlerMeasure.lean:66`; `Lindemann/HermiteIntegral.lean:65`, `ExpSum.lean:56,136`, `AuxPoly.lean:58`, `AuxValue.lean:68`; `Units/Balanced.lean:180`.

**Repair.** Use the wording §0.5 already uses for the irrationality exponent: "`X` is Tau Ceti's `TauCeti.X` (file)". Add these definitions to the Tau Ceti carrier sentence (line 88). Keep their API lists and Checks.

## R04 (P3) — Locator, statement and docstring slips

- **`gyoryEquation_exponent_bound`, README line 2888.** It cites "(E19, ch. 5, Thm. 5.18, p. 103.)" for explicit constants A = 2κs(log M + C) and B₀ = 2κsC.
  - Witness: E19-ch5 lines 632–636 state finiteness and effectivity only, with no proof ("Győry's proof is based on Corollary 5.3 …").
  - Repair: mark the bound "derived here" from BG96 §3, Lem. 1, (12) and the lemma of E19 Thm. 5.12, p. 95. I checked the derivation: the factor 2 covers complex places.
- **§3.3, README line 2184.** It states the Schneider auxiliary function with "a_(ij)∈𝓞_K … house(a_(ij))≤exp(…)".
  - Witness: E19-ch4 lines 505–519 (Lem. 4.22, p. 77) and the pinned `TauCeti.exists_schneider_auxiliary_algebraic` (`GelfondSchneider/SchneiderAuxiliary.lean:206`) give integers aᵢⱼ with |aᵢⱼ| ≤ exp(c(D₁ log L + D₂L)).
  - Repair: state the integer form, which is the stronger conclusion, and name the Tau Ceti theorem.
- **`schmidt_normForm`, README line 953.** It reads "in its finiteness direction: … have finitely many solutions iff M contains no μ𝓞_L". The Lean (lines 332–337) states only (i)⇒(ii) of E19 Thm. 7.13 (E19-ch7 line 459, p. 149).
  - Repair: replace "iff" by "if", since the converse is the preceding paragraph.
- **README line 2220.** "(DALAG Theorem 1.4.)" uses an undefined abbreviation.
  - Repair: delete it; the W00 citation in the same parenthesis covers it.
- **`Suggested.lean` line 905.** The `nishioka` docstring names the theorem but does not state its conclusion.
  - Repair: "… the transcendence degree over ℚ of the values fᵢ(α) equals that of the fᵢ over ℂ(z) (AF22, Thm. 1.1)".
- **§1.7 locators "(E96, §7, Lem. 26, p. 68, pp. 295–296.)", eleven occurrences.** These mix the preprint page (E96 line 3183 is on preprint p. 68) with journal pages, while the References entry links the preprint.
  - Repair: write "preprint p. 68".

## Verified sound

**Previous findings.**
- **R01: repaired.** `subspace_theorem_for_systems` (`Suggested.lean` lines 480–503) now takes x : Fin n → AlgebraicClosure K, chosen extensions `w` restricting to `normAbs`, and forms over K̄ with [K(L):K] ≤ D. The inequality holds for every σ, H is `TauCeti.absoluteProjectiveTupleHeight`, and subspaces are defined over K. EF13 lines 523–575 (§§3.1–3.3, Thm. 3.1, pp. 13–14) match hypothesis by hypothesis.
- **R02: repaired.** The four headlines use `TauCeti.absoluteLogHeightAff`, `TauCeti.height2`, `TauCeti.InGeneralPosition` and `TauCeti.IsNondegenerateSolution`. Each of the 16 kept abbreviations is used by SubspaceTheorem or Completed/HeightsAndUnits (counted per name).
- **R03: partly repaired.** The fifteen listed labels are restored, for example "Prove closedFormRecurrence:" at line 1011 and "Prove matveevParameterChoice:" at line 2482. See R02.
- **R04: repaired.** Lines 2515, 2523 and 2802 and `Suggested.lean` 684–685 cite Matveev Cor. 2.3. E19 Thm. 5.4 is now named only for its larger constant (E19-ch5 p. 87).
- **R05: repaired.** `[IsAlgClosed K]` is gone (`Suggested.lean` line 388), and the README adds the embedding reduction.
- **R06: repaired.** Line 38 names `TauCeti.IntegralLattice` and `TauCeti.IntegralLattice.IsPosDef.finite_setOf_norm_le`.
- **R07: repaired except for `nishioka` (R04).**
- **R08: repaired.** Lines 343/347 give "Cor. 2.7, p. 21", line 3006 "proof of Thm. 1.3, p. 8", and line 294 "proof of Thm. 1.7(ii), p. 5; Wu …".

**Gate, dependency check and builds.**
- The gate rerun on this head ends `OK`, with every rule at 0.
- The dependency check prints `depcheck: 238 roadmaps, 2347 edges, 0 problem(s)`.
- `lake env lean` on `Suggested.lean` gives 49 `sorry` warnings, 14 `#check` outputs and nothing else.
- A scratch copy of `Completed/HeightsAndUnits/Suggested.lean`, which imports this module but is not in the targeted build, elaborates against this head with 0 errors and 70 `sorry` warnings.
- **Signatures.** All 89 `#check @name` entries elaborate. The flagged `[NumberField K]` on `IsTwistedData` is unused, since its fields need only `Place K` and `[Field K]`.
- **One-tactic probe.** I replaced each `sorry` by `first | rfl | simp | infer_instance | norm_num | trivial`. All 49 theorems fail, so none is padding.
- Every Lean name appears in the README.

**Library declarations opened at the pins.**
- `TauCeti.linearIndependent_exp` and `algebraicIndependent_exp` (`Lindemann/Theorem.lean:53,85`).
- `transcendental_rpow` (`GelfondSchneider/Theorem.lean:210`).
- `Matrix.dirichlet_linearForms` and `dirichlet_linearForms_infinite`, `TauCeti.simultaneous_dirichlet` and `dirichlet_linearForm_infinite` (`Dirichlet.lean:127,145,186,207`).
- `kronecker_approximation` (`Kronecker.lean:87`).
- `BadlyApproximable`, `LittlewoodConjecture` and `littlewood_of_not_badlyApproximable` (`BadlyApproximable.lean:62,248,260`).
- `simultaneousExponent` and `inv_card_le_simultaneousExponent` (`SimultaneousExponent.lean:61,204`).
- `one_div_lt_abs_sub_convergent` and `irrationalityExponent_eq_one_add_limsup` (`ContinuedFractions.lean:161,252`).
- `deltaL_pos` (`Height/Twisted/Determinant.lean:71`).
- `finite_subspaceHeight_le` (`Arakelov/Subspace/Basic.lean:440`).
- `exists_schneider_auxiliary_algebraic` (`SchneiderAuxiliary.lean:206`).
- The definitions listed in R03.

**Cross-roadmap citations resolved on main.**
- GlobalNumberFields Layer 0 (Completed, line 241).
- EffectiveBounds Layer 0 (Completed, line 94).
- AlgebraicCurves Layer 9 (line 1099).
- ContourIntegration Layers 2–3 (Completed, lines 158 and 184).
- ReductiveGroups Layers 0, 3 and 4 (lines 129, 234 and 432).
- DifferentialGeometry Layers 0 and 6 (lines 268 and 782).

**Ownership.**
- LinearFormsInLogarithms and ArithmeticInterpolationDeterminants are not cited.
- These roadmaps consume this one by section only: ArithmeticDynamics (rev head, §§0, 2), EffectiveBoundsPartII (§2), DiophantineApproximationAndTranscendencePartII (§§0, 5) and EffectiveDiophantineMethods (§§0.2, 3.6, 3.7). The `yu_rat` citation is the exception (R02).
- No open pull request imports this module.
- `overlaps.md` lists no other pull request changing this folder.

**Sources.** E19 chapters 6–7, E96, BEG13 and BMS06 were fetched this round into a scratch manifest only; the board manifest is unchanged. B08 was read from the cache.

| Target | Locators confirmed (source line → printed page) |
| --- | --- |
| 0.0 | E19-ch2 Lem. 2.8 line 409 p. 23; Thm. 2.9 line 439 p. 24; Cor. 2.6 line 303 p. 20; Ex. 2.11 line 655 p. 31 |
| 0.4 | E19-ch2 Cor. 2.7 line 333 p. 21; Ex. 2.6 line 363 p. 22; Cor. 2.21 line 735 p. 33; Thm. 2.22 line 761 p. 34, proof pp. 35–36 |
| 1.3 | P22 Def. 3.2.1 line 4585 p. 80; Lem. 3.2.2 p. 80; Lem. 3.2.8–3.2.9 p. 83; Lem. 3.2.10 and Prop. 3.2.12 p. 84; Ex. 3.3 p. 85; Lem. 3.4.3 p. 90; §3.5.2 p. 98 (printed = PDF − 6) |
| 1.4 | P22 Def. 3.3.1 line 5061 p. 85 (ordinary derivatives; the Hasse normalisation is the README's own, with a Check); Prop. 3.3.3 p. 86; Thm. 3.3.7 p. 87; Lem. 3.3.8–3.3.9 p. 88; Ex. 3.5 p. 89; §3.4.5 p. 91; §3.4.6 p. 92; Lem. 3.4.8 p. 94 |
| 1.6 | E19-ch6 Thm. 6.2 line 111 p. 110; Ex. 6.1 p. 110; Thm. 6.3 line 144 p. 111; Cor. 6.4 line 189 p. 112; Ex. 6.5 line 904 p. 132; P22 Thm. 3.0.1 line 4191 p. 73 |
| 1.7 | E96 Lem. 26 line 3183, preprint p. 68 (R04); Lem. 23 line 2992 p. 64 |
| 2.2 | E19-ch7 Lem. 7.10 line 351 p. 146; Lem. 7.11 line 382 p. 147; Thm. 7.9 line 347 p. 146; Thm. 7.13 line 459 p. 149, converse pp. 149–150 |
| 2.4 | ESS02 Thm. 1.1 line 41 p. 808; Thm. 1.2 lines 239–258 pp. 812–813; Thm. 2.1 line 356 p. 815; (11.19) line 1275 p. 834; E19-ch8 Thm. 8.13 line 447 p. 168; Thm. 8.18 line 643 p. 174 |
| 2.8 | EF13 Thm. 1.1 p. 4; Thm. 2.1 p. 10; Thm. 2.3 p. 12; Thm. 3.1 pp. 13–14; Thm. 3.3 p. 15; Lem. 5.1 p. 23; Thm. 8.1 p. 34; Lem. 11.5 p. 47; Lem. 13.1 line 2159 p. 50 (C_K = \|D_K\|^(1/2D)); Prop. 13.6 p. 56; Thm. 16.1 p. 71; Prop. 17.5 p. 81 |
| 3.1–3.2 | E19-ch4 Thm. 4.1 p. 64; Cor. 4.3 p. 64; Lem. 4.4 p. 65; Thm. 4.8, Cor. 4.9–4.10 p. 67; Thm. 4.11 p. 68; Lem. 4.12 p. 71; Lem. 4.13–4.15 p. 72; Ex. 4.3 p. 73; W00 Thm. 1.2 line 736 |
| 3.3 | E19-ch4 Thm. 4.16, Cor. 4.17–4.18 p. 73; Thm. 4.21 p. 76; Lem. 4.22 p. 77 (R04); Lem. 4.23 and Ex. 4.5 p. 79; Lem. 4.24 and 4.26 p. 80; Lem. 4.27 pp. 80–81 |
| 3.4 | W00 (printed = PDF − 20) Lem. 2.4 p. 37; Prop. 4.7 p. 122; Lem. 4.8 p. 123; Lem. 4.9 p. 130; Prop. 4.10 p. 131; Lem. 4.11 p. 132; Lem. 4.12 p. 133; Lem. 4.13 p. 134; Cor. 4.2 line 6151 |
| 4.4 | E19-ch5 Thm. 5.14 line 500 p. 98 ("no multiple zeros" = separable); example (5.8) pp. 98–99; Thm. 5.15 line 532 p. 99; BEG13 Thms. 2.1–2.3 lines 129–141 p. 4 |
| 4.5 | E19-ch5 Thm. 5.16 p. 101; Thm. 5.17 lines 594–610 pp. 101–102; Thm. 5.18 line 632 p. 103 (R04); Ex. 5.9 p. 106 |
| 5.3 | B08 Def. 4.4.1 line 789, Thm. 4.4.2 line 793 and Thm. 4.4.3 line 802, all p. 20; Lem. 5.2.1 line 849 p. 22; Prop. 5.3.1 line 926 p. 23 |

### Adversarial table

| Statement | Instance | Values (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `natDegree_add_derivative_orders_le` | (1, X, X²); (1, 1); ℓ = 0 | 0 + 3 = 3 ≤ 0+1+2 (equality); W = 0 so 0+1 ≤ 0 fails without hW; 0 ≤ 0 | holds, hypothesis needed | none |
| `sum_multiplicity_lower_bounds_le_natDegree` | span(1, X^m), f = X^m, S = {0} | W = mX^(m−1): (m+1)−2 = m−1 = mult | equality | none |
| same, char 2 | span(1, X²) over 𝔽₂ | W = 2X = 0; bound 1 ≤ rootMultiplicity 0 = 0 | fails, so `[CharZero K]` is needed | none |
| same, ℓ = 1 | V = K·b₀ | mult W = mult f = m = (m+1)−1 | equality | none |
| §1.4 divisibility | column of f, (X−a)^m ∣ f | Dᵏf divisible by (X−a)^(m−k) ⊇ (X−a)^(m+1−ℓ) | holds in every characteristic | none |
| §1.4 genWronskian Check | W_(0,e₀)(x₀, x₁) | det[[x₀,x₁],[1,0]] = −x₁ | holds | none |
| `subspace_theorem_for_systems` | n = 2, S = {∞}, K = ℚ, forms X₁−√2X₂, X₂, d = (−2−ε, 0) | A_∞ = 1; condition \|p−θq\| ≤ H^(−1−ε) | Roth approximations | none |
| same, degenerate data | S = ∅ | Σd = 0 ≠ −n−ε, so S ≠ ∅, R ≥ 2, D ≥ 1 and 1/(3RD) ≠ 1/0 | well defined | none |
| same, x = 0 | H(0) = 1 < n^(n/ε) ≥ 4 | excluded twice | holds | none |
| `sharp_roths_lemma` vs E96 Lem. 23 | (7.3)–(7.4), H = Euclidean height (E96 lines 60–74) | d_h/d_(h+1) ≥ 2m²/Θ; H(x_h)^(d_h) ≥ (e^(Σd)H(F))^((3m²/Θ)^m) | identical | none |
| `absolutePerturbedUnitEquation` budget | ESS02 (2.10) uses 4n; README and Lean use 5n | 4n: q₀⁻¹(1+4n log n) + ½q₀⁻¹ > q₀⁻¹; 5n: below q₀⁻¹ | 5n is what the proof gives | Source issues |
| same, Check | x_k = (2^k, 1), z_k = ((2^k+1)⁻¹, (2^k+1)⁻¹) | h_aff(z_k) = log(2^k+1) > ½e^(−10⁶)(1 + k log 2) | excluded | none |
| `card_nondegenerate_solutions_le` | ESS02 (1.2) | exp((6n)^(3n)(r+1)) in both | holds | none |
| `ncard_zeros_simple_recurrence_le` | ESS02 (1.18); αᵢ = αⱼ | bound exp((6n)^(3n)); ratio 1 has finite order, so it is excluded | holds | none |
| `skolem_mahler_lech_simple` | order 0 | charPoly 1, so solution u = 0 contradicts hu₀ | vacuous, consistent | none |
| §2.4 Checks | (2, 1/2); (2, 2) | h_s = h_aff = 2 log 2; h_s = 2 log 2, h_aff = log 2 | hold | none |
| `finite_thueMahler` | S = ∅; coprimality dropped | \|F\| = 1 (Thue); (2^k x, 2^k y) infinite | `IsCoprime` needed | none |
| `schmidt_normForm` | ℚ(i), M = 𝓞; ℚ(√2), M = 𝓞 | x²+y² = c finite; L = K, μ = 1 violates h (Pell) | holds | R04 (README "iff") |
| `finite_approximation_bounded_degree` | d = 0; α of degree ≤ d | no primitive irreducible constant; F = minpoly α is one element | finite | none |
| `subspace_theorem` | n = 1 excluded; x = 0 | 0 ≤ C·0 = 0, so T must be nonempty (proper subspaces exist) | holds | none |
| `padic_subspace_theorem` | x = p^k y | left side fixed by the product formula, right side ×p^(−kε) | harmless | none |
| `transcendental_exp_of_isAlgebraic` | (α, 0) in `linearIndependent_exp` | relation 1·e^α − β·e^0 = 0 has nonzero coefficients | contradiction | none |
| `transcendental_exp_mul` | λ = 2πi, β = −i/2 | exp(βλ) = e^π | transcendental | none |
| `schneiderLang` vs W00 Cor. 4.2 | d₀ = n, y algebraic | xᵢ·yⱼ ≠ 0 algebraic gives Hermite–Lindemann | consistent | none |
| `baker_lower_bound` | naive vs absolute height at degree ≤ D | H_naive ≤ (2B)^D changes only C | equivalent | none |
| `laurent_mignotte_nesterenko` | a₁ = 2, a₂ = 3, b = (19, 12) | log\|Λ\| = −4.31 ≥ −24.34·441·log 2·log 3 = −8173 | holds; source normalisation not checked | Not verifiable |
| `pow_sub_pow_eq_finite` | a = 3, b = 2, k = 1 | solutions (1,1), (2,3), max 3 ≤ ≈ 10¹⁰ | holds | none |
| `tijdeman_gap` | x = 1, y = 2 | needs c₁(log 2)^(c₂) ≥ 2, so c₁ is chosen large | satisfiable | R01 |
| `unitEquation_exponent_bound` | E19 Thm. 5.12 proof | B ≤ κ log house y; \|σᵢy\| ≤ e^(−B/(κ(d−1))) gives B ≤ A + B₀ log B | derivation holds | none |
| `gyoryEquation_exponent_bound` | BG96 Lem. 1 place with ℓ_v ≤ −h/s; m_w ≤ 2 | Z ≤ 2κs(log M + C) + 2κsC log Z | true; locator wrong | R04 |
| lemma x ≤ a + b log x | a < 0 allowed | log t ≤ t − 1 at t = x/2b gives x ≤ 2a + 2b(log 2b − 1) | holds | none |
| `sUnitEquation_exponent_bound` | S = {2, 3}, C = 1.4 | max \|v_p\| = 3 (9 − 8 = 1) ≤ 4.04·log 4.04 = 5.64 | holds | none |
| `baker_superelliptic` | y² = 2x² + 1 | infinitely many; excluded by deg ≥ 3 for n = 2 | hypothesis needed | R01 |
| BEG13 at K = ℚ | s = d = \|D_K\| = Q_S = P_S = 1 | (6N)^(14n³N³)e^(8n²N³ĥ); (4N)^(2¹²N⁴)e^(50N⁴ĥ); (10N²)^(40N)e^(11Nĥ) | equal to README | R01 (absent in Lean) |
| §4.4 example | y³ = 2x(x−3) | 2x − 2(x−3) = 6; \|A\| = 18; 18² = 324 | holds | none |
| §3.3 Lem. 4.22 | E19 vs README | aᵢⱼ ∈ ℤ vs aᵢⱼ ∈ 𝓞_K | README weaker | R04 |
| §5.3 iterates | T = 1−X, M = 1; T = M = 1 | P_(m+1) = (0+1+m)/(m+1) = 1; P₂ = 1/2 | holds | none |
| `galochkin_chudnovsky` | B08 Thm. 4.4.2 + 4.4.3 | b > C\|a\|^(n+1) > 0 ↔ q > C\|p\|^(n+1), p ≠ 0 | holds | none |
| `nesterenko` / `algebraicIndependent_pi_exp_pi` | τ = i | E₆(i) = 0, E₂(i) = 3/π | π, e^π independent | none |
| `ax_schanuel` | F = ℂ((t)), x = t, y = e^t | 1 + 1 ≤ trdeg ℂ(t, e^t) = 2 | holds | none |
| `SchanuelConjecture.algebraicIndependent_exp_one_pi` | x = (1, πi) | trdeg ℚ(πi, e) ≥ 2 | holds | none |
| §1.3 Checks | h(2x₀+4); h(X²−1/4) | log 2; log 4 | hold | none |
| §2.8 Siegel Check | (1,1,0) twice, U = 2, V = 3 | √3·(√2·√2)¹ = 2√3 ≥ H₂(0,0,1) = 1 | holds | none |

## Not verifiable

- **LMN95** (J. Number Theory 55). Paywalled, recorded `uncertified`. `laurent_mignotte_nesterenko` reproduces E19-ch5 lines 681–692 exactly, with log H(aᵢ), which is below 1 at H(aᵢ) = 2. I could not check whether LMN's corollary requires log Aᵢ ≥ 1/D; the author should confirm against the published statement.
- **Matveev** (Izv. Math. 64): mathnet, not opened.
- **BG06 and Bombieri–Vaaler**: paywalled.
- **Not opened:** Schmidt 1967, Fukshansky, Yu 1990/1994, BG96, Tzanakis–de Weger, KW26, Soundararajan–Petrow, Kirby, AF22, Nishioka (paywalled), André, Singer, Fischler–Rivoal, Smyth, Sondow, Yang and Roy–Thunder. No finding rests on them.
- **E96 journal pagination** (pp. 295–296): only the preprint was read.

## Source issues

- **Gap** in ESS02 at §11, (11.19), p. 834: the source bounds n·h(z) using exp(−(5n)^(3n)), but hypotheses (2.10)/(6.3) only give exp(−(4n)^(3n)), and then the sum exceeds q₀(n)⁻¹; it should assume the 5n budget or adjust q₀; affects a stated result (Thm. 2.1 as stated).
- **Misprint** in E19-ch8 at §8.3, p. 169 (line 470): the source says Evertse–Schlickewei–Schmidt bound the nondegenerate solutions by exp((6n)^(4n)(r+1)); it should be exp((6n)^(3n)(r+1)), as in ESS02 Thm. 1.1, p. 808; affects nothing.
