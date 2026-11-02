# Review of ModularForms (pull request #1706 at 852d48b)
**Verdict:** needs changes

## R01 (P1) — The §8.0 analytic comparison has no owned proof inputs

**Location:** `TauCetiRoadmap/ModularForms/README.md:603–612` ("Prove the characteristic-zero comparison: over ℂ, evaluation on E_z … gives linear isomorphisms from M_k^arith(N,ℂ) and S_k^arith(N,ℂ) to the native analytic modular and cusp spaces") and the `*Needs:*` line at 644–647.

**Claim:** The comparison, hence `rationalCuspFormSpan`, the weight-one lattice of §8.1, `weightOneCoefficientField`, `weightOneCoefficientIntegral` and the weight-one case of `existsUniqueGaloisConjugate`, follow from ModularCurves Layers 1–5 and §§9A–9B plus Mathlib carriers.

**Witness:** Surjectivity onto the analytic cusp space needs three results the Needs line does not name and nothing cited provides: (i) every elliptic curve over ℂ with a μ_N-marking is some (E_z, 1/N), i.e. the analytic moduli interpretation of Γ₁(N)\ℍ; (ii) a rule on all ℂ-algebras is determined by the universal family (representability for N ≥ 4, a rigidifying cover for N ≤ 3); (iii) a holomorphic section of ω^k on Γ₁(N)\ℍ extending over the cusps is algebraic (GAGA on the compact curve). Deligne–Serre defer exactly this to Deligne–Rapoport VII §4 (deligne-serre lines 176–177, 194–195). ModularCurves on main (README lines 1398–1410) states that no roadmap owns the uniformisation or the scheme–analytic comparison and that ModularForms "takes on no scheme–analytic comparison"; the only planned owners, ComplexComparisonPartII and AlgebraicModularFormsAndSerreWeights §1.5, are in the merge order and so later than this on-main roadmap. Instance: for f = η(z)η(23z) ∈ S₁(Γ₁(23)), nothing owned shows that σ(f), σ ∈ Aut(ℂ), is again a cusp form; the weight-13 Δ-trick of §8.1 gives bounded denominators only for a form already known to be rational (deligne-serre lines 221–224).

**Repair:** Either own the inputs or defer the statements. (a) Own: add to §8.0 three named targets with sources and Needs — uniformization of complex elliptic curves with level structure and the analytic universal family; the universal property of the level-N moduli over ℂ-algebras (ModularCurves §5A gives Y₁(N) for N ≥ 4; state the rigidifying-cover descent for N ≤ 3); extension of ω^k over the cusps and algebraicity of its holomorphic sections on X₁(N) — and say in Scope that this roadmap now owns this scheme–analytic comparison, so that ModularCurves' remark is superseded. (b) Defer: prove `rationalCuspFormSpan` and `existsUniqueGaloisConjugate` for k ≥ 2 by the Hecke-pairing route (the native integral Hecke algebra `HeckeRing.GL2.isIntegral_heckeTCuspNat`, `HeckeSlash/Finite.lean:154`, k ≥ 2, and the perfect pairing ⟨T,f⟩ = a₁(Tf)), restrict the two headlines to `2 ≤ k`, and move the weight-one headlines with §8.0 to a Part II that consumes AlgebraicModularFormsAndSerreWeights §1.5. Under (a), the instance above is covered by (iii) applied to σ(f)'s expansion; under (b), f is simply outside the stated range.

## R02 (P3) — The Tate curve is planned again

**Location:** `TauCetiRoadmap/ModularForms/README.md:594–601` ("Construct the formal Tate evaluation for these rules: the Tate curve over K((q)), its canonical embedding μ_N↪Tate(q) and differential dt/t").

**Claim:** The Tate curve is a target of §8.0.

**Witness:** ModularCurves on main, Layer 10 item 2 (README lines 2243–2247), plans "the groups T[N] and the Tate curve over ℤ[1/N]((q)) with its subgroup schemes … built here as its own milestone".

**Repair:** Cite ModularCurves Layer 10 for the Tate curve over ℤ((q)) and its base change to K((q)); keep here only the canonical μ_N-embedding for every N, dt/t and the evaluation of rules, saying that ModularCurves' layer carries a prime-level standing hypothesis that the curve itself does not use.

## R03 (P3) — The j-input ownership move is stated as a fact about FuchsianOrbifolds

**Location:** `TauCetiRoadmap/ModularForms/README.md:22–28` ("The normalized j-function inputs belong with its Layer 6 … it supplies no j-input module back to it").

**Claim:** FuchsianOrbifolds Layer 6 owns j = E₄³/Δ, its invariance, expansion and elliptic orders.

**Witness:** FuchsianOrbifolds on main says the opposite: its ownership section (README lines 84–88) assigns the normalized level-one j-function to the modular-forms roadmap, and its Layer 6 (lines 344–347) "consumes the modular-forms roadmap's normalized j-function". Neither Mathlib nor Tau Ceti at the pin has a j-invariant. NoncongruenceModularForms (open pull request) cites "ModularForms `JInputs`" (its README lines 1184, 1205).

**Repair:** Write the Scope sentence as the move it is: "formerly a level-one input of this roadmap; FuchsianOrbifolds Layer 6 is to construct j from Mathlib's E₄, E₆ and Δ, and this roadmap consumes nothing of it". The move is recorded below for the intake; FuchsianOrbifolds and NoncongruenceModularForms update their own citations.

## R04 (P3) — The PolynomialGaloisGroups citation names a section that does not exist

**Location:** `TauCetiRoadmap/ModularForms/README.md:30–31, 224–226` ("Layer 4, 'Group criteria that bypass resolvents'").

**Claim:** The prime-degree-plus-transposition criterion is in PolynomialGaloisGroups Layer 4.

**Witness:** `Completed/PolynomialGaloisGroups/README.md` has no section of that name; Layer 4 (line 777) is "resolvents"; the criterion "A transitive subgroup of S_p of prime degree that contains a transposition is S_p" is a bullet of "The recognition theorems" in Layer 1 (line 639), with *Needs:* Mathlib `Equiv.Perm.subgroup_eq_top_of_swap_mem`.

**Repair:** Cite "PolynomialGaloisGroups Layer 1, the recognition theorems" and the Mathlib declaration; keep the factorization-type contract citation (its line 122) as is.

## R05 (P3) — A contracted declaration is cited under the wrong namespace

**Location:** `TauCetiRoadmap/ModularForms/README.md:168`.

**Claim:** The Fricke–Hecke relation is `HeckeRing.GL2.normalizedFrickeOperatorCusp_heckeTCuspNat_of_mem_cuspFormCharSpace`.

**Witness:** `#check` of that name fails at the pin; the theorem is `TauCeti.normalizedFrickeOperatorCusp_heckeTCuspNat_of_mem_cuspFormCharSpace` (`TauCeti/NumberTheory/ModularForms/Fricke/Hecke.lean:35` opens `namespace TauCeti`, theorem at line 158). Its statement is 𝒲_N Tₙ f = χ(n) Tₙ 𝒲_N f, as the README says.

**Repair:** Rename the citation to the `TauCeti.` name.

## R06 (P3) — The level-Nm² twist theorem has no locator

**Location:** `TauCetiRoadmap/ModularForms/README.md:781–784` ("Prove modularity and cuspidality at level Nm² with nebentypus χψ²"); `TauCetiRoadmap/ModularForms/Suggested.lean:97–99` ("the modulus-sensitive twist theorem").

**Claim:** The Atkin–Li locator covers the headline.

**Witness:** Atkin–Li Theorem 3.1 is cited for the primitive sharp level lcm(N, r·cond(χψ), r²); the Nm² statement for an arbitrary character modulo m is a different theorem (its proof writes ψ(n) as a finite Fourier sum Σ_v c_v e(nv/m) and translates f by v/m, which conjugates Γ₁(Nm²) into Γ₁(N)).

**Repair:** Add the locator for the Nm² statement (Shimura, Introduction, Proposition 3.64, or Miyake, Lemma 4.3.10(2)) in the README and in the docstring.

## Verified sound

**Repair status of the previous review (faa2da4).** R01 repaired: §3.1 now sums over M ≠ N (README:424–427) and the Check "allowing M=N would give old dimension 1" is present. R02 repaired: §1.1 divides by δ = [±Γ:Γ] (README:275–296), the Δ check gives 12/12. R03 repaired: the Stokes target is gone; the period contract says no boundary-cancellation assertion is required (README:181–187) and §11.1 keeps the weight-two counterexample as a Check. R04 repaired: §9.2 distinguishes the zero-extended modulus-m twist (level Nm²) from the primitive sharp bound. R05 repaired: §6.1 states 𝒲_Q Tₙ f = χ_Q(n) Tₙ 𝒲_Q f with the quartic-character Check. R06 repaired: the worked example uses 37 and records that 17 fails squarefreeness; recomputed below. R07 repaired: the functional-equation contract requires cusp forms on both carriers. R08 partly repaired: the missing inputs are now named targets in §8.0, but their own proof inputs are unowned (R01 above). R09 repaired on this roadmap's side: the j-inputs are no longer supplied from here; the move is R03. R10 repaired: the former "build" blocks are supplier contracts, all 62 of whose declarations resolve at the pin (below). R11 repaired: no checker; the weight-60 example is a worked example citing PolynomialGaloisGroups (section name drift R04). R12 repaired: ten headlines are stated, the dimension formulas, analytic Riemann–Roch, the p-adic comparison and the arithmetic-form carrier are named in the docstring as not statable. R13–R18 repaired: the supplied gate is all zero (`set_option=0 … build=0 OK`). R19 repaired: house shape, Checks per definition, Needs per target, Examples and Dependencies per layer; Rhodes–Shemanske now cited at §3.1 Proposition 3.2 and §3.2 Lemma 3.3, confirmed at rhodes-shemanske lines 364–366 and 410–411; Popa–Zagier title corrected. R20 repaired: the LeanBridge locator resolves (leanbridge lines 39–45 quintic, 698–718 theorem, namespace at line 32).

**Gate and Lean.** Pins: branch and main manifests agree (Tau Ceti 358314d4, Mathlib f6090c70). `lake env lean TauCetiRoadmap/ModularForms/Suggested.lean` exits 0 with exactly ten `declaration uses sorry` warnings. The dependency check rerun printed `depcheck: 205 roadmaps, 1572 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. Elaborated types of the ten declarations were compared with the README statements; none lost a binder (hk, NeZero and the Finset S are explicit). One-tactic probe: a scratch copy with every `sorry` replaced by `simp` fails on all ten (eight "no progress", two unsolved goals), so nothing closes in one tactic; no declaration restates a definition or a Check. Outside-folder diff is empty; the folder's `STATUS.md`, `PROGRESS.md` and `metadata.toml` are the generated files already on main. `sorry`'d data, `set_option`, `lemma`, LaTeX and process words: none. Both pull-request numbers and absolute paths: none in the folder.

**Supplier contracts resolved at the pin.** A scratch file with 63 `#check @name` lines, after `lake build` of the 32 Tau Ceti modules it imports, elaborated with one error (R05). Representative hypotheses read: `numberField_CoefficientField` and `Newform.isIntegral_qExpansion_coeff` carry `2 ≤ k` as the README says; `atkinLehnerSign` requires `f.χ = 1`; `satakeParameters_eq_exp_satakeAngle` requires a prime, the Ramanujan bound and `dirichletLift p = 1`; `L_eulerProduct_tprod` requires `k/2 + 1 < Re s`; `sturm_bound_finiteIndex_SL2Z` uses the full index `Γ.index` and `(k·index).toNat/12`, matching B in §9.3; `cuspFormsOld` (`Newforms/Basic.lean:105`) imposes `M ≠ N`; `Newform` (`Newforms/Newform.lean:104`) bundles nonzero, character membership, good eigenvalues, newness and a₁ = 1; `satakeParameters` (`Satake.lean:91`) is the root multiset of X² − a_pX + χ(p)p^{k−1} with χ extended by zero; `hurwitzClassNumber` (`HurwitzClassNumber.lean:84`) has H(0) = −1/12 and weighted reduced forms, `hurwitzClassNumber_three`, `_four` give 1/3, 1/2; `frickeCompletedL_functional_equation` (`FunctionalEquation.lean:324`) has cusp forms on both carriers, width one, 0 < k and g = (√N)^{2−k}·(f ∣ frickeGL N), giving Λ_N(k−s,f) = iᵏ Λ_N(s,g) as in Conventions; Mathlib `CuspFormClass.exists_sum_range_norm_sq_qExpansion_coeff_le_of_mem_strictPeriods` (`Bounds.lean:352`) has `k : ℕ`, `[Γ.IsArithmetic]`, a positive strict period; `Polynomial.dickson 2 a` satisfies D₀ = 1, D₁ = X, D_{m+2} = X·D_{m+1} − a·D_m (`Dickson.lean:63`), so `dickson 2 n (k−2)` evaluated at t is the coefficient of x^{k−2} in (1 − tx + nx²)⁻¹; `CuspForm.discriminant` exists (`Discriminant.lean:236`); `heckeTCompositeGamma0` is at `HeckeRing/GL2/Gamma0/Diagonal/Composite.lean:118`; the `PeriodPolynomial/` (3 files) and `TraceFormula/` (13 files) directories exist. Mathlib's `ModularFormClass.qExpansion_isBigO` gives a_n = O(n^k), i.e. abscissa ≤ k + 1, so `modularFormAbscissaLeWeight` (abscissa ≤ k) is a genuine extension, not a duplicate.

**Cross-roadmap citations resolved.** FuchsianOrbifolds (main): Layers 0–6 exist with the stated content (Layer 1 elliptic points, Layer 3 cusps and q-coordinates, Layer 5 degree/divisor pullback/Riemann–Hurwitz with the explicit statement that the genus comparison is owned by ModularForms 10B, Layer 6 X(1) ≃ ℙ¹); the j-input direction is R03. ModularCurves (main): Layers 1–5, §§9A–9B exist; Layer 10 plans the Tate curve (R02) and documents the unowned analytic comparison (R01). PolynomialGaloisGroups (Completed): the factorization-type contract section exists at line 122; Layer-4 section name does not (R04). AlgebraicModularFormsAndSerreWeights (open pull request, merge order line 84) consumes ModularForms "Layers 0, 4–5, 8, 8G, 8W, 10C" under the old numbering and plans its own stack-section analytic comparison in §1.5 via ComplexComparisonPartII; it is later than this roadmap, so it is not a supplier and the two comparisons are on different carriers (rules on families here, stack sections there). NoncongruenceModularForms (open pull request) consumes ModularForms Layers 1, 3, 10B–10C as this README's Downstream section says. No open pull request declares any of the ten fully qualified names of `Suggested.lean` (`roadmaps grep` on the ten names found only this folder). Ownership against open pull requests without files in this brief was not checked.

**Ownership move recorded.** The normalized j-function inputs (j = E₄³/Δ, j − 1728 = E₆²/Δ, invariance, q-expansion, elliptic orders) move from ModularForms to FuchsianOrbifolds Layer 6; ModularForms consumes none of them (§10A uses only X(1) ≃ ℙ¹). FuchsianOrbifolds on main and NoncongruenceModularForms still cite ModularForms for them.

**Seeded source sample.** deligne-serre (Numdam, 65b390f6…): §2.1 at lines 127–151 (rule on (E, α: μ_N ↪ E) with values in ω^k, holomorphy via generalized curves, the Laurent remark at 150–151); (2.2.1) diamonds at 152–153; (2.4.1)–(2.4.2) at 171–174 including division by (2πi du)^k; Tate curve and (2.5.1) at 178–188; (2.6.1) S_K = K ⊗ S_ℚ at 199 with the descent criterion at 202–205; Proposition 2.7 (2.7.1)–(2.7.4) at 206–213 and its proof at 214–220; Remark 2.8 (Δ-trick to weight 13) at 221–224. popa-zagier (arXiv 1711.00327v2, 56905e98…): weights w(M) at 63–69, Theorem 1 at 72, H conventions including H(0) = −1/12 and H(−u²) = −u/2 at 100–104, Proposition 2 (Hecke-equivariant M⊕S ≃ W_w, w > 0 even) at 197, Proposition 3 at 213, Corollary 1 at 228–232, equation (4) at 235–240, the remark that tr M − tr S = σ_{k−1}(n) at 243. stein (author page, b50e81d4…): (5.3.1) with c₀ at 3809–3825, Theorem 5.8 (k ≥ 1, exception k = 2, χ = ψ = 1, corrected E₂) at 3829–3833, Theorem 5.9 (basis) at 3834–3835. diamond-shurman-errata (author page, b3d2f00f…): pages 74–75 (period 2h at an irregular cusp independent of k; half-integral order exactly when the cusp is irregular and k is odd) at 49–58, page 81 at 59–66, page 90 at 68. rhodes-shemanske (author page, da2a014e…): Lemma 3.1 at 333, Proposition 3.2 (GL_n(ℚ) ring generated by the integral subring and p⁻¹I) at 364–366, §3.2 local rings and the p-adic ring at 380–402, Lemma 3.3 (coset decompositions pass to GL_n(ℤ_p)) at 410–411; it is a dated draft with "Draft Remark" notes, as the README's citation says. leanbridge (GitHub raw at f0afa3e2…, d441dd13…): quintic at 39–45, namespace at 32, theorem with hypotheses on coefficients 0–5 at 701–708.

**Adversarial pass.** Values computed on each side; "retain" means the instance agrees with the statement as written.

| Statement | Instances | Values on the two sides | Result; change |
|---|---|---|---|
| Conventions: Hecke recurrence | Δ, p = 2, 3 | a₂a₃ = (−24)(252) = −6048 = a₆; a₂² − 2¹¹ = 576 − 2048 = −1472 = a₄ | retain |
| Conventions: bad prime | η²η(11z)², p = 11 | a₁₂₁ = a₁₁² − χ(11)·11 = 1 − 0 = 1; with χ(11) = 1 it would be −10 | retain |
| Conventions: FE sign | k = 2, w₁₁ = −1; Δ, w = +1 | i²(−1) = 1; i¹²(1) = 1 | retain |
| 0.1 constant terms | χ odd mod 3, k = 1 | B_{1,χ} = (1/3 − 1/2) − (2/3 − 1/2) = −1/3; both orderings a₀ = 1/6; Stein's (5.3.1) gives 0 for (χ,1) | README correct; source issue below |
| 0.1 corrected E₂ | t = 2 | 1 − 24q − 72q² minus 2 − 48q² = −1 − 24q − 24q² | retain |
| 0.1 E₄ normalization | k = 4 | −B₄/8 = 1/240; 240·(1/240) = 1 | retain |
| 1.1 δ factor | Δ, Γ = SL₂(ℤ); Γ(3) | δ = 1, ord∞ = 1 = 12/12; Γ(3) full index 24 = |SL₂(𝔽₃)|, −I ∉ Γ(3), δ = 2 | retain |
| 1.1 irregular order | exponents 1, 3 in q_{2h} | orders 1/2, 3/2; product exponent 4, order 2 = 1/2 + 3/2 | retain (errata lines 49–58) |
| 2.1 rank two | p = 2 | T(1,2)² = T(1,4) + (p+1)T(2,2) = T(1,4) + 3T(2,2); leading coefficient 1 | retain |
| 2.1 exponent vector | X₁ᵃX₂ᵇ | leading coset diag(p^b, p^{a+b}); e₁ = b, e₂ − e₁ = a | retain |
| 2.2 degrees | diag(1,p), pI | p + 1 (3 at p = 2); 1; (pI)(p⁻¹I) = 1 after localization | retain; R–S Prop 3.2 confirms the p⁻¹I generation |
| 3.1 oldspace | N = 11, 22; k = 2 | 11: proper sources S₂(1) = 0, old 0, new 1; 22: f, f(2z) with leading q, q², old 2, new 2 − 2 = 0 | retain (M ≠ N) |
| 4.1 primitive associate | Δ(z) + cΔ(2z) at level 2 | a₁ = 1 ∀c, a₂ = −24 + c; associate Δ, conductor 1 | retain |
| 5.1 negative controls | Δ at level 2 (old); 2Δ | not in `cuspFormsNew 2 12`; a₁ = 2 ≠ 1 | retain; Lean quantifies over `Newform` |
| 5.1 same-level case | f = g = Δ, S = {2,3} | N = M = 1, χ = 1, functions equal | retain |
| 6.1 commutation scalar | χ mod 5, χ(2) = i, E₃^{1,χ} | a₂ = 1 + 4i; companion E₃^{χ̄,1} has a₂ = 4 − i; i(4 − i) = 1 + 4i ≠ 4 − i | retain; pinned relation has χ(n) |
| 6.1 exact divisors | N = 12 | Q ∈ {1,3,4,12}; gcd(2,6) = 2 excludes 2 | retain |
| 7.1 Eisenstein pole | E₄ | L = 240ζ(s)ζ(s−3), abscissa 4 = k, pole at 4 | retain (≤, not entire) |
| 7.1 weight one | Σ_{n≤X}|a_n|² = O(X) | dyadic Cauchy–Schwarz: X^{1/2}·O(X^{1/2}) = O(X); Σ X^{1−σ} converges iff σ > 1 | retain |
| 7.1 Hecke bound alone | cusp form, k | Mathlib O(n^{k/2}) gives abscissa ≤ k/2 + 1 ≤ k iff k ≥ 2; k = 1 needs the mean-square route | retain; Needs lists it |
| 8.0 normalization | Δ, dt/t = 2πi du | both normalizations q − 24q²; omitting 2πi scales by (2πi)¹² | retain |
| 8.0 descent criterion | √2Δ over ℚ(√2); Δ/11 | a₁ = √2 ∉ ℚ, no descent; a₁ = 1/11 ∈ ℚ, descends | retain (D–S lines 202–205) |
| 8.0 inputs | f = η(z)η(23z), σ ∈ Aut(ℂ) | σ(f) a cusp form only through the comparison; its inputs unowned | R01 |
| 8.1 bounded denominators | Δ/11; η(z)η(23z) | 11·(Δ/11) has a₁ = 1; fΔ = q² − 25q³ + …, Δ⁻¹ recovers (1, −1) | retain |
| 8.1 lattice rank | N = 1; rank r with denominator D | S₁ = 0 so rank 0; Db₁,…,Db_r span dimension r | retain |
| 8.2 norm factors | K = ℚ(√2), a = √2; a = 1 | (X − √2)(X + √2) = X² − 2; (X − 1)² | retain |
| 9.1 Satake | Δ, p = 2; level 11, p = 11 | X² + 24X + 2048, sum −24, product 2048; roots {1, 0}, product 0 | retain |
| 9.1 angle | a_p = 0, k = 1; a_p = 2; a_p = 3 | roots ±i, θ = π/2; root 1 double, θ = 0; 3 > 2 no angle | retain |
| 9.2 twist level | Δ, trivial ψ mod 2 | (a₁,a₂) = (1,0) = (1 − V₂U₂)Δ, level 1·2² = 4; primitive twist is Δ | retain; locator R06 |
| 9.2 depletion idempotent | q − 24q² + 252q³ | (1 − V₂U₂) gives q + 252q³; twice gives the same | retain |
| 9.3 Sturm length | Γ₁(13), k = 2; N = 3, k = 1 | B = ⌊2·168/12⌋ = 28; B = ⌊8/12⌋ = 0 and S₁(Γ₁(3)) = 0 | retain |
| 9.3 trace vector | quadratic orbit a₂ = √2 | (Tr a₁, Tr a₂) = (2, 0) vs representative (1, √2) | retain |
| 9.3 letters | positions 25, 26 | z, ba | retain |
| 10A genus | Γ₀(11), Γ₀(2), Γ₁(13), level 1 | 1 + 1 − 1 = 1; 1 + 1/4 − 1/4 − 1 = 0; 1 + 84/12 − 12/2 = 2 (168 would give 9); 1 + 1/12 − 1/4 − 1/3 − 1/2 = 0 | retain |
| 10B Riemann–Roch | ℙ¹: 𝒪(−2), 𝒪(−1), 𝒪; genus 1: 𝒪 | χ = −1, 0, 1 = deg + 1; (1,1), χ = 0 = 0 + 1 − 1 | retain |
| 10B Riemann–Hurwitz | id, z ↦ z² on ℙ¹; genus 1 double cover | −2 = −2 + 0; −2 = −4 + 2; 0 = −4 + 4 | retain |
| 10C even weight | level 1, k = 12; Γ₀(11), k = 2 | M: −11 + 3 + 4 + 6 = 2, S: −11 + 3 + 4 + 5 = 1; M₂ = 0 + 2 = 2, S₂ = g = 1 | retain |
| 10C odd weight | Γ(3): g = 0, ε₃ = 0, c_reg = 4 | k = 3: M = −2 + 6 = 4, S = −2 + 2 = 0; k = 1: c_reg = 4 > −2 so S₁ = 0, M₁ = 2 | retain |
| 10C β = μ∗μ | p, p², p³ | β = −2, 1, 0; (β∗σ₀)(p) = 2 − 2 = 0, (p²) = 3 − 4 + 1 = 0, (p³) = 4 − 6 + 2 = 0 | retain |
| 10C newspace identity | Γ₀(22); Γ₁(22); Γ₁(13); N = 1 | 2 − 2·1 − 2·0 + 4·0 = 0; g(X₁(22)) = 1 + 180/12 − 20/2 = 6, 6 − 2·1 − 0 = 4; 2; dim S_k − 0 = dim S_k with `cuspFormsNew 1 k = ⊤` | retain |
| 11.1 P_k | k = 12, n = 1, 2; k = 4 | P₁₂(0,1) = −1, P₁₂(±1,1) = −1, P₁₂(±2,1) = 11; P₁₂(0,2) = −32, P₁₂(±1,2) = 23, P₁₂(±2,2) = 32; P₄(t,1) = t² − 1 | matches `dickson 2 n (k−2)` recurrence |
| 11.1 traces | (k,n) = (4,1), (12,1), (12,2) | class sums −1, −3, 46; divisor sums 1, 1, 2; traces 0, 1, −24 = τ(2) | retain |
| 11.1 composite vs single coset | k = 12, n = 4 | −1472 = τ(4); single coset −2496; scalar coset 4⁵ = 1024; −2496 + 1024 = −1472 | retain |
| 11.1 PZ form vs README form | general n, k | PZ's all-t sum with H(−u²) = −u/2 plus tr M − tr S = σ_{k−1}: hyperbolic t = ±(d+d′) contribute (1/4)Σ_{ordered, d≠d′}(max^{k−1} − min^{k−1}); with −(1/2)σ_{k−1} = −(1/4)Σ_{ordered}(max^{k−1} + min^{k−1}) this is −(1/2)Σ_{dd′=n} min(d,d′)^{k−1} | README form equivalent to Corollary 1 |
| 11.1 k = 2 exclusion | k = 2, n = 1 | P₂ ≡ 1; class sum H(4) + 2H(3) + 2H(0) = 1/2 + 2/3 − 1/6 = 1; formula −1/2 − 1/2 = −1 vs dim S₂ = 0 | retain k ≥ 4 |
| Worked example mod 17 | quintic | roots 6, 9, 10; (X − 6)²(X − 10)²(X − 9); gcd with derivative X² + X + 9 | README correct |
| Worked example mod 37 | quintic | (X − 16)(X − 22)(X − 23)(X² + 30X + 34); gcd 1; disc 24, 24¹⁸ ≡ 36 ≡ −1 | README correct |
| Worked example mod 83 | quintic | no roots, gcd(X⁸³ − X, F) = 1, X^{83⁵} ≡ X mod F, gcd(F,F′) = 1 | squarefree irreducible |
| Worked example eta | η(z)η(11z); η(z)η(23z) | (1+11)/24 = 1/2, multiplier −1; (1+23)/24 = 1 | retain |
| `existsCoefficientTwist` | m = 1; n = 0 | ψ(0) = 1 for m = 1 and a₀(f) = 0; for m > 1 ψ(0) = 0 | retain |
| `crossLevelStrongMultiplicityOne` | k ≤ 0 | no `Newform N k` exists (spaces zero); `1 ≤ k` harmless | retain |
| `existsUniqueGaloisConjugate` | Δ, σ = id | g = Δ unique by `Newform.ext` on coefficients and χ | retain |

**Checks count.** Every subsection with a definition has at least three discriminating Checks (0.1: 5; 1.1: 4; 2.1: 4; 2.2: 3; 3.1: 3; 4.1: 3; 5.1: 3; 6.1: 4; 7.1: 4; 8.0: 7; 8.1: 5; 8.2: 4; 9.1: 7; 9.2: 4; 9.3: 7; 10A: 4; 10B: 4 + 4 + 3; 10C: 3 + 4 + 4; 11.1: 7).

## Not verifiable

- Diamond–Shurman (Propositions 5.9.1, 5.8.4, Theorems 3.5.1, 3.6.1, 5.8.3, §§3.2–3.9, 4.5–4.8, 5.2, 6.5), Miyake (Theorem 4.6.19, Corollary 4.6.20, Lemma 4.3.10), Shimura (Theorem 3.20, Proposition 3.64), Atkin–Li (Theorem 3.1), Forster (§§12–19) and Sturm (LNM 1240): the sources service resolves each only to a paywalled Springer page (recorded uncertified) or, for Shimura, to no legal copy. Their theorem numbers are taken on the roadmap's word; every statement attributed to them was checked mathematically in the table above.
- Deligne–Rapoport VII §4 (the comparison Deligne–Serre cite) was not fetched; R01 rests on the Deligne–Serre text and ModularCurves' own statement, not on its content.
- The live LMFDB character-orbit ordering was not compared with §9.3's convention; the README disclaims agreement.
- Open pull requests the brief names without files were not searched for ownership.

## Source issues

- **Error** in stein at §5.3, display (5.3.1) with Theorem 5.8, printed p.88: the source gives the constant term of the weight-one series with a nontrivial first character and trivial second character as zero; it should be minus one half of the first generalized Bernoulli number of the first character, by the symmetry of the weight-one coefficients; affects a stated result (weight one only).
- **Misprint** in rhodes-shemanske at Lemma 3.1's proof, printed p.9, lines 350–354: the source calls a map into a coset space a homomorphism with a kernel; it should be a map of sets whose fibre over the identity coset is the stated subgroup; affects nothing.
