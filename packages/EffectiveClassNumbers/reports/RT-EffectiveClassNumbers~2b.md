<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/133#issuecomment-6335050063 -->
Red team round 2 pass b (claude) of 0f9bd9b

Verdict: needs_changes

1. **F01** (P3) The θ(15), θ(84) example does not elaborate

   **Location:** `packages/EffectiveClassNumbers/Suggested.lean:139`: “example : ramifiedWeight 15 = 1 / 4 ∧ ramifiedWeight 84 = 1 / 12 := by”.

   **Claim:** The proof script is a proved example, but at the pinned Mathlib it fails in three places: line 144 (`norm_num at h ⊢; linarith`: the goal is already closed by `norm_num`, so `linarith` raises “no goals”), lines 156–157 (`Nat.primeFactors 15 = {3, 5}` and `Nat.primeFactors 84 = {2, 3, 7}` by `decide`: the kernel cannot reduce `Nat.primeFactorsList`), and line 158 (the final `norm_num [ramifiedWeight, h15, h84, Finset.sup_insert, h2, h3]` leaves the two products over `({3, 5}).erase 5` and `({2, 3, 7}).erase 7` unsolved).

   **Witness:** A probe copy of the file without its `TauCeti.*` imports, elaborated at the pinned Mathlib: “Tactic `decide` failed to reduce … reduction got stuck at (Nat.primeFactorsList 15).dedup.isPerm …” and “unsolved goals ⊢ ∏ x ∈ {3, 5}.erase 5, (1 - ↑⌊2 * √↑x⌋₊ / (↑x + 1)) = 1 / 4 ∧ …”. The repair below elaborates in a second probe copy.

   **Exact repair text:**

   ```lean
   /-- §0.3: removing the largest prime, and ignoring prime multiplicities, gives these two
   nonempty products. -/
   example : ramifiedWeight 15 = 1 / 4 ∧ ramifiedWeight 84 = 1 / 12 := by
     have h2 : ⌊2 * Real.sqrt 2⌋₊ = 2 := by
       apply (Nat.floor_eq_iff (by positivity)).2
       constructor
       · have h := Real.le_sqrt_of_sq_le (show (1 : ℝ) ^ 2 ≤ 2 by norm_num)
         norm_num at h ⊢
       · have h := (Real.sqrt_lt (by norm_num : (0 : ℝ) ≤ 2)
           (by norm_num : (0 : ℝ) ≤ 3 / 2)).2 (by norm_num : (2 : ℝ) < (3 / 2) ^ 2)
         norm_num at h ⊢; linarith
     have h3 : ⌊2 * Real.sqrt 3⌋₊ = 3 := by
       apply (Nat.floor_eq_iff (by positivity)).2
       constructor
       · have h := Real.le_sqrt_of_sq_le (show (3 / 2 : ℝ) ^ 2 ≤ 3 by norm_num)
         norm_num at h ⊢; linarith
       · have h := (Real.sqrt_lt (by norm_num : (0 : ℝ) ≤ 3)
           (by norm_num : (0 : ℝ) ≤ 2)).2 (by norm_num : (3 : ℝ) < 2 ^ 2)
         norm_num at h ⊢; linarith
     have h15 : Nat.primeFactors 15 = {3, 5} := by
       rw [show (15 : ℕ) = 3 * 5 by norm_num, Nat.primeFactors_mul (by norm_num) (by norm_num),
         Nat.Prime.primeFactors (by norm_num), Nat.Prime.primeFactors (by norm_num)]
       rfl
     have h84 : Nat.primeFactors 84 = {2, 3, 7} := by
       rw [show (84 : ℕ) = 2 ^ 2 * (3 * 7) by norm_num,
         Nat.primeFactors_mul (by norm_num) (by norm_num),
         Nat.primeFactors_prime_pow (by norm_num) (by norm_num),
         Nat.primeFactors_mul (by norm_num) (by norm_num),
         Nat.Prime.primeFactors (by norm_num), Nat.Prime.primeFactors (by norm_num)]
       rfl
     have e15 : (Nat.primeFactors 15).erase ((Nat.primeFactors 15).sup id) = {3} := by
       rw [h15]; decide
     have e84 : (Nat.primeFactors 84).erase ((Nat.primeFactors 84).sup id) = {2, 3} := by
       rw [h84]; decide
     rw [ramifiedWeight, ramifiedWeight, e15, e84]
     rw [Finset.prod_singleton, Finset.prod_insert (by decide), Finset.prod_singleton]
     norm_num [h2, h3]
   ```

2. **F02** (P3) The inverse-Mellin negative-control example does not elaborate

   **Location:** `packages/EffectiveClassNumbers/Suggested.lean:257`: “example : inverseMellinKernel 0 3 1 = 0 ∧ inverseMellinKernel 0 2 2 = 0 ∧ inverseMellinKernel (-1) 2 (1 / 16) < inverseMellinKernel (-1) 2 (1 / 4) := by”.

   **Claim:** The two auxiliary facts at lines 259–262 are not closed: after `rw [show (4 : ℝ) = 2 ^ (2 : ℕ) by norm_num, Real.log_pow]` the goal is `↑2 * Real.log 2 = 2 * Real.log 2` (a natural-number cast on the left), and likewise `↑4 * Real.log 2 = 4 * Real.log 2` for 16.

   **Witness:** The same probe copy: “unsolved goals ⊢ ↑2 * Real.log 2 = 2 * Real.log 2” at the `hlog4` line and “⊢ ↑4 * Real.log 2 = 4 * Real.log 2” at the `hlog16` line. With the repair below the whole example elaborates.

   **Exact repair text:** replace lines 259–262 by

   ```lean
     have hlog4 : Real.log (4 : ℝ) = 2 * Real.log 2 := by
       rw [show (4 : ℝ) = 2 ^ (2 : ℕ) by norm_num, Real.log_pow]; norm_num
     have hlog16 : Real.log (16 : ℝ) = 4 * Real.log 2 := by
       rw [show (16 : ℝ) = 2 ^ (4 : ℕ) by norm_num, Real.log_pow]; norm_num
   ```

3. **F03** (P3) The C₅₅(2), C₅₅(3) example does not elaborate

   **Location:** `packages/EffectiveClassNumbers/Suggested.lean:669`: “example : primeMajorant 55 2 = 55 * (3 / (3 - 2 * Real.sqrt 2)) ∧ primeMajorant 55 3 = …”.

   **Claim:** After `norm_num [primeMajorant, Finset.prod_range_succ, Nat.nth_prime_zero_eq_two, Nat.nth_prime_one_eq_three]` the second conjunct has the product inside one inverse expanded, and `ring` cannot identify `(12 - √2 * 8 + √2 * √3 * 4 - √3 * 6)⁻¹` with `(3 - √2 * 2)⁻¹ * (4 - √3 * 2)⁻¹`.

   **Witness:** The same probe copy: “unsolved goals ⊢ (12 - √2 * 8 + √2 * √3 * 4 - √3 * 6)⁻¹ * 660 = (3 - √2 * 2)⁻¹ * (4 - √3 * 2)⁻¹ * 660”. The repair below elaborates.

   **Exact repair text:** replace lines 671–673 by

   ```lean
     simp only [primeMajorant, Finset.prod_range_succ, Finset.prod_range_zero,
       Nat.nth_prime_zero_eq_two, Nat.nth_prime_one_eq_three]
     norm_num
     ring
   ```

4. **F04** (P3) The 1333963 inert-pattern example does not elaborate

   **Location:** `packages/EffectiveClassNumbers/Suggested.lean:808`: “example : IsInertPrime 43 1333963 ∧ IsInertPrime 47 1333963 := by”.

   **Claim:** Line 818, `interval_cases q <;> norm_num at hq ⊢`, fails on each of the 31 composite values of q in 3..47: `norm_num at hq` closes the goal from the false primality hypothesis and the `⊢` location then raises “No goals to be solved”.

   **Witness:** The same probe copy: 31 errors “No goals to be solved” at that line. The repair below elaborates.

   **Exact repair text:** replace line 818 by

   ```lean
         interval_cases q <;> first | (norm_num at hq; done) | norm_num
   ```

5. **F05** (P3) Two proved blocks emit non-`sorry` diagnostics

   **Location:** `packages/EffectiveClassNumbers/Suggested.lean:219`: “simpa using Complex.Gamma_nat_eq_factorial 1”; `packages/EffectiveClassNumbers/Suggested.lean:723`: “constructor <;> norm_num [effectiveKappa] <;> rfl”.

   **Claim:** At the pin, `simp` alone closes `Complex.Gamma 2 = 1` (linter “simp already closes the goal”), and `norm_num [effectiveKappa]` already closes both κ equalities, so the trailing `rfl` is never executed (unused-tactic linter). Only `declaration uses 'sorry'` warnings are acceptable.

   **Witness:** The probe copy reports both linter warnings; `example : Complex.Gamma 2 = 1 := by simp` elaborates in a second probe copy.

   **Exact repair text:** line 219: `have hΓ : Complex.Gamma 2 = 1 := by simp`; line 723: `constructor <;> norm_num [effectiveKappa]`.

6. **F06** (P3) Two sorried targets close by short scripts from Mathlib

   **Location:** `packages/EffectiveClassNumbers/Suggested.lean:714`: “theorem effectiveKappa_pos (q : ℚ) (hq : 0 < q) : 0 < effectiveKappa q := by sorry”; `packages/EffectiveClassNumbers/Suggested.lean:394`: “theorem curve139_source_equation (X Y : ℚ) : curve139.toAffine.Equation X Y ↔ …”.

   **Claim:** Both are stated as targets (README §4.6 “`effectiveKappa_pos` (κ(q) > 0 for q > 0)”, §2.1 “`curve139_source_equation` (the substitution …)”) but are immediate: the first is a case split on the three branches of the definition, the second is the identity between the two affine equations with the constant ratio −64/139³ (the target polynomial equals −64/2685619 times `Y² + Y − (X³ − X² − 64403X − 6220110)`).

   **Witness:** Both scripts below elaborate in a probe copy at the pinned Mathlib (the curve definition `⟨0, -1, 1, -64403, -6220110⟩` and `WeierstrassCurve.Affine.equation_iff`).

   **Exact repair text:**

   ```lean
   theorem effectiveKappa_pos (q : ℚ) (hq : 0 < q) : 0 < effectiveKappa q := by
     unfold effectiveKappa; split_ifs <;> first | linarith | positivity

   theorem curve139_source_equation (X Y : ℚ) :
       curve139.toAffine.Equation X Y ↔
         (-139 : ℚ) * ((8 * Y + 4) / 139 ^ 2) ^ 2 =
           ((4 * X + 462) / (-139)) ^ 3 + 10 * ((4 * X + 462) / (-139)) ^ 2 -
             20 * ((4 * X + 462) / (-139)) + 8 := by
     rw [WeierstrassCurve.Affine.equation_iff]; simp only [curve139]
     constructor <;> intro h
     · linear_combination (-64 / 2685619 : ℚ) * h
     · linear_combination (-2685619 / 64 : ℚ) * h
   ```

## Verified sound

- Head: the clone of the pull-request head prints `0f9bd9b`. Files read in full: `packages/EffectiveClassNumbers/README.md` (984 lines), `Suggested.lean` (865 lines), `sources.toml` (11 entries), `metadata.toml`, `design/plan.json` (one gap), the round-1 repair report, both round-1 passes, the fix comment and round-2 pass a.
- Declarations read: 103 (66 theorems, 11 definitions, 2 instances, 24 examples), each with its explicit binders (no `variable`/`include` block exists). Every `theorem`/`def`/`instance` name (79) occurs in the README; `theorem` only, no `lemma`, no `set_option`, no `#eval`/`#print`, no `True` placeholder, no sorried data; single `import Mathlib` plus seven `TauCeti.*` modules that all exist in the pinned Tau Ceti source (`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`) and are each used; at most two examples per kept definition (11 definitions checked); title lower-case without proper names; no process words or issue numbers in README or docstrings.
- Targets read: every bold target block of §§0.1–5.8 and the C1–C4 block, with the adversarial instances d = 3, 4 (extra units), d = 20 (t = 2), ℚ(i) (radicand −1), prime powers (empty θ-product), p = 2 as split/inert/ramified, P(d) = ∅, G ≡ 0 and Ψ ≡ 0, s = 0 versus 2 for the totalized product, D = 1 and even D for the twist, r = 1 versus r = 3 for the kernel series, q ≤ 0, q ≥ 1 for κ, H = 1 for the cutoff, x < 2 and composite p for `IsInertPrime`. Checked true as typed: `splitPrime_size` (norm argument, b ≠ 0 from 𝔭 ≠ 𝔭̄, including d = 3, 4), `liouville_agreement`, `reducedForm_four_mul_c_sq_ge` against the pinned `IsReducedForm` (|b| ≤ a ≤ c with the boundary sign) and `discrim`, `positiveMellin_comparison` (hinge representation of the convex nonincreasing kernel, a ≥ 0 and m ≥ 2 needed, Tonelli with the integrated hypothesis), `fundamentalContour` (reflection reverses orientation and sign), `truncatedResidue` against the pinned Laurent-coefficient `TauCeti.Contour.residue`, the C1 coefficient bounds in `oesterleTechnical` (ζ(2s−1)² has coefficient m·τ(m) at m²), `analyticRank_parity` (identity theorem on Re s > 0, a₁ = 1 excludes L ≡ 0), `twist_LFunction_coeff` (the pinned `quadraticTwistOf t n` with trace 1 and norm (1−D)/4 has parameter discriminant D; Mathlib's `localPolynomial` takes the minimal model, so `LFunction` is model-independent), `centralDerivative_series` (Fricke sign for w = −1, integration by parts gives 2·r!·Σ (a_n/n)G_r(2πn/√N)), `bgzKernel_hasDerivAt` and `bgzKernel_le`, `effectiveLogarithmic_bound` (the 2^(45+⌈256/δ⌉)h^δ derivation and the q ≥ 1 branch), `effective_cutoff` (exponents 604, 605), the §5.6 chain and `classThree_cutoff`.
- Checks recomputed (41): Δ, c₄, c₆ of the three curves (37·139⁶ = 266864328286957, 3091360 = 139²·160, 5392722952 = (−139)³·(−2008), 5077, 336); point counts #E(𝔽_p) and a_p of `curve37` at 3, 5, 7, 11, 13, 139 (1, 0, −1, 3, −4, −4; six points at 5), of `curve5077` at 2, 3, 5 (−2, −3, −4), of `curve139` at 3, 7 (5, 9); the nonsplit node of E₅₀₇₇ at x = 92 with 1104 a non-residue mod 5077; χ_(−139)(p) at 3, 5, 7, 11, 13, 37 and the root numbers w(E₁₃₉) = −1, w(E₅₀₇₇ ⊗ χ_(−7)) = +1 with 5077 split in ℚ(√−7) and conductor 248773; #E₅₀₇₇(𝔽₉) = 7, #E₅₀₇₇(𝔽₂₅) = 20; the point (−156, 77); the substitution ratio −64/139³; θ(0), θ(907), θ(15) = 1/4, θ(84) = 1/12, θ(20) = 1/3 and the factors 1/3, 1/4, 1/3, 3/8, 1/2, 1/2 at 2…13 (≥ 1/2 for p ≥ 11); α²+β² = −262, B(1) = 19321/19584, B′(1)/B(1) = 11·log 139/408, G₁₃₉(1)/(1+1/139) = 1 − ε/35; C₅₅(2) = 961.690…; 165/log 10 = 71.66; 4·43³, 4·67³, 4·163³; 77683 = 131·593; 115147 = 113·1019, 123204 = 4·3·10267, the conductors mod 8 and χ(2) = −1, −1, 0; (−17923/3) = −1; 5077 ≡ 17 mod 23 a non-residue; κ exponents 302 and 814; the reduced forms of discriminants −23, −20, −907, −4, −16, −12, −139 and the sixteen class-number-three discriminants ≤ 907; I_(0,2)(1/2) = log 2, I_(1,2)(1/2) = 2 log 2, I_(−1,2)(1/16) = (log 2)/4 < (log 2)/2; the Mellin transform 4π/d of the comparison measure at s = 2; the nonaxial values 6, 6, 8, 8, 12, 12 of (1,1,6); the §1.4 two-atom example; the §1.5 Gaussian integrals 1/(2√π) and 1/2; the n = 2 term of BGZ's Table 2; c₅ = πN^(3/2)/12; Σ_(j<5) p_j^(−1/2) ≈ 2.41 versus 3.52; L(1, χ_(−907)) ≈ 0.313; θ(84)·C_c(3) ≈ 10.9c.
- Locators verified against the cached legal copies (26 groups, page numbers against the `=== page N ===` markers and the printed running heads): O85 Theorem 1 and P(d), θ(d) p. 310 (lines 88–94), §1.3 and §1.4 p. 312 (lines 131–155), C1–C4 p. 314 (line 212), §3.3 p. 315 (line 255), Proposition 1 p. 317 (line 319), Theorem 2 and P(d) p. 318 (lines 351–355), §§4.2–4.3 pp. 320–321 (lines 398–436), §5.1 constants 7000 and 55 p. 321 (lines 444–447); GZ86 (6.3) p. 230 (line 278), Proposition (7.4) p. 231 (line 329), (8.1), (8.2), C(1) = 55 and 907 p. 232 (lines 340–358); BGZ85 (7) p. 475 (line 127), rank-three basis p. 475 (lines 142–150), (12) p. 478 (line 234), (14) p. 479 (lines 276–278), Table 2 p. 480 (lines 286–301); MW74 Theorem p. 530 (line 70), Table I p. 537 (lines 257–277), §5 pp. 539–540 (lines 348–361); LLS70 Table III p. 440 (lines 527–575), class-number-three application pp. 445–447 (lines 1039–1133); GZ83 Corollary 6 and proof p. 87 (lines 95–115: the η-quotient, the divisor 3(0)−3(∞), D = −139, the model and the conductor 714877); G77 §1 p. 219 (line 27); DEL73 §8 (8.12.1)–(8.12.4) printed p. 572 (lines 1972–1980); COG04 Lecture 9 §§3–6 printed pp. 71–74 (lines 3248–3394); DLMF §5.11(ii) (line 46).
- Supplier citations checked: IntegralLattices (active on main, Layer B heading present), ImaginaryQuadraticClassNumber (active; headings H1.1–H1.3, H2.1–H2.4, H3.1 present; the cited `exists_negative_squarefree_presentation`, `classNumber_congr`, `quadratic_LFunction_siegel`, `imaginary_classNumber_lower_bound` present in its `Suggested.lean`), EllipticCurves, ModularForms, ModularCurves (active on main), ContourIntegration (headed as Completed, not `TauCetiRoadmap.X`), AnalyticNumberTheoryPartI, AutomorphicLFunctionsAndLocalFactors, EllipticCurveModularity, EffectiveDiophantineMethods (not on main, at lines 75, 72, 122, 130 of the pull request's `merge-order/ORDER.txt`, all above EffectiveClassNumbers at line 131). The one declared gap `fundamental-reduced-forms-primitive` names its supplier (ImaginaryQuadraticClassNumber H1.3) in both README and `design/plan.json` and is consumed by §0.2.
- Dependency gate, run with the main-branch configuration (whose merge order does not yet contain the imported package; the pull request's own `merge-order/ORDER.txt` lists it at line 131):

```text
NOT IN ORDER: EffectiveClassNumbers (insert it after its last supplier)
depcheck: 8 roadmaps, 52 edges, 1 problem(s)
```

  No UPWARD or CYCLE line; “not in order” is the intake's insertion, not a defect.
- Not re-raised: every round-1 finding (A-F01–F24, B-F01–F15) is repaired at this head as the round-2 pass a table records, and R02's primitivity adapter is the declared gap; round-2 pass a's S01 (Gamma strip estimates supplier), S02 (minimal model in `LFunction_coeff_eq`), S03 (missing `curve5077_twist7_central_bounds` signature), S04 (`merge-order/ORDER.txt` in the diff), S05 (factorial normalization Check), S06 (k = 1 explanation), S07 (converse of `isFundamentalDiscriminant_discr`), S08 (parity owner AL.5), S09 (Frobenius duality) are independent of the findings above and are not repeated.

## Not verifiable

- Elaboration of `Suggested.lean` as submitted: not elaborated with its imports, because the review Lake setup holds no compiled `.olean` for the seven imported `TauCeti.*` modules (their sources exist at the pinned Tau Ceti) and the brief forbids a build. A probe copy without the `TauCeti.*` import lines was elaborated at the pinned Mathlib: every declaration not mentioning a `TauCeti.*` name elaborated, with exactly the non-`sorry` diagnostics reported in F01–F05; the declarations mentioning `TauCeti.*` names (`isFundamentalDiscriminant_discr`, `reducedForm_four_mul_c_sq_ge`, `reducedForms_small_counts`, the two `decide` examples of §0.2, `truncatedResidue`, `twist_LFunction_coeff`, `mordellWeilRank_eq_three`, `curve5077_height_gap`, `rankThree_139`, `rankThree_5077`, `exceptional_5077`) could not be checked; in particular whether `decide` evaluates `TauCeti.reducedForms 23` and `TauCeti.reducedForms 20` in the kernel is unverified.
- O88 §§8–9: settled as uncertified, cited by locator only; nothing above depends on it.
- Large certificates (the two 2-descents, the height Gram matrices and regulators, the rational enclosures of L′, L‴ and the twisted central value, the 7000/55 constant enclosures, the Montgomery–Weinberger endpoint signs and window exclusions, minimality of 1432817816347): checked against the sources' statements, not re-run.
