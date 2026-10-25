<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1467#issuecomment-6395090391 -->
Review (claude) of b314373

Verdict: needs changes

1. **F01** (P1) Gap G1 has no supplier; it is this roadmap's own open problem

   - **Location.** `design/plan.json`, `gaps[0]` (id `DiophantineApproximationAndTranscendencePartII/G1`, no `supplier` field). Also `packages/DiophantineApproximationAndTranscendencePartII/README.md` line 861: "The corresponding generalization problem is to specify a base-point-sensitive sampling geometry and prove its rank theorem from the general potential-theory interface."
   - **Claim.** The plan declares a gap with supplier `none`. That is an unowned prerequisite, and the README states it as an open problem. The house rules forbid "deferred" scope.
   - **Witness.** The brief lists this gap with supplier `none`. No target needs it. The node it is attached to (AA.5/compact-counterexample = README §5.2) is complete without it: φ = 8z·exp(−20z) has |φ| ≤ 6e^(−5) ≈ 0.040 on K, so the numerator is 0 while the rank is at least 1.
   - **Repair.**
     - Remove the G1 entry from the plan's `gaps`, or get the maintainer decision that the gap's own text asks for.
     - In the README, delete the "generalization problem" paragraph at line 861 and replace it with one sentence in `## Scope and ownership`: "The unrestricted compact-set form of CDT25 (2.5.28) is false (§5.2); no compact-set generalization is part of this roadmap."
     - Tested: §5.1 and §5.2 are unchanged, and both still resolve, with suppliers ClassicalArithmeticCompletion §§6.18, 6.40 and gap:complex-logarithmic-equilibrium.

2. **F02** (P2) `multiplier_rank_bound` follows from `mean_rank_bound` (padding)

   - **Location.** `Suggested.lean` lines 62–85 (`multiplierLogBound`, `multiplier_rank_bound`).
   - **Claim.** This is CDT25 Lemma 2.0.8, an input lemma. It is strictly weaker than `mean_rank_bound`, which the same file states, so it is not a headline.
   - **Witness.** CDT25 Remark 2.3.3 (lines 886–907): if h(0) = 1, then J(g) ≤ max(sup log|h|, sup log|hg|), so Theorem 2.0.1 implies Lemma 2.0.8. ConformalMappingPartII §3.8 states the same inequality.
   - **Repair.**
     - Delete both declarations and the then-empty `/-! ## Layer 1 … -/` comment.
     - README §1.4 and §1.5 keep their statements. Remove the backticks from `multiplierLogBound` (line 283) and `multiplier_rank_bound` (line 309).
     - Tested on φ = g = 2z, h = 1 − 2z, family {1}: the remaining `mean_rank_bound` gives 1 ≤ e ≈ 2.72, which is stronger than the deleted 1 ≤ e·log 6/log 2 ≈ 7.03.

3. **F03** (P2) Layer 3 declarations are inputs to the third proof route (padding)

   - **Location.** `Suggested.lean` lines 137–168 (`circleDiscrepancy`, `fekete_circle`, `vandermonde_discrepancy_gap`).
   - **Claim.** These are CDT25 Definition 2.5.4 and Lemmas 2.5.3 and 2.5.9. They feed only the damping route, which re-proves the theorem `mean_rank_bound` already states. They are not headlines.
   - **Witness.** README line 611: "The Vandermonde-damped coefficient bounds yield the same rank bound m≤eJ(g)/logλ as §2.1". CDT25 line 1018 calls §2.5 an alternative proof of Theorem 2.0.1.
   - **Repair.**
     - Delete the three declarations and the Layer 3 section comment.
     - README §§3.1, 3.6 and 3.8 keep their statements. Drop the backticks at lines 433, 543 and 577.
     - Tested: nothing else in `Suggested.lean` mentions these names.

4. **F04** (P2) `eisenstein_denominators` is an input lemma (padding)

   - **Location.** `Suggested.lean` lines 45–58.
   - **Claim.** Eisenstein's theorem feeds §0.5, which feeds §1.2. The Summary (README line 3) does not name it as an end theorem. Its second conjunct is also a one-line consequence of its first.
   - **Witness.**
     - README line 221 is "*Needs:* §0.4; …" (for §0.5), and line 263 is "*Needs:* §0.5; …" (for §1.2).
     - For the second conjunct: if n ≥ 1, (cM)^n·a_n = c^(n−1)·(cM^n·a_n), and n = 0 is the hypothesis itself.
   - **Repair.**
     - Delete the declaration.
     - README §0.4 (line 189) keeps "Prove …" without the backticked name. The README remains the owner of the target; no other roadmap plans it: FormalLaurentPuiseux, Part I and all open pull requests were searched.

5. **F05** (P2) `andre_algebraicity` is a special case of `arithmetic_algebraicity` (padding)

   - **Location.** `Suggested.lean` lines 126–135. Its docstring says "derived from Theorem 2.0.1 by shrinking the parameter disc".
   - **Claim.** It is the case p = x, pSeries = χ = X of `arithmetic_algebraicity`, after replacing φ, u by φ(rz), u(rz).
   - **Witness.** README line 369: "Use p=x, χ=t; the integral pullback of p is t. Apply arithmetic algebraicity."
   - **Repair.**
     - Delete the declaration. README §2.3 keeps the target; drop the backticks at line 367.
     - Tested on f = √(1−4x), φ = (1−e^(8z))/4, r = 3/4. φ(3z/4) is analytic near the closed disc with derivative modulus 3/2 > 1, g = φ(3z/4), u = e^(3z), and `subst X X` and `subst X f` are integral. All hypotheses of `arithmetic_algebraicity` hold, so its conclusion covers the deleted statement.

6. **F06** (P2) Supplier drift: "descent" credited to DiophantineApproximationAndTranscendence §5.1

   - **Location.** README line 47: "with sum and product closure, descent and complex initial-value existence and uniqueness on positive-radius discs". Line 653 depends on it: "rationality of f also gives D-finiteness over ℚ by coefficient-linear-system descent." Line 673 cites §5.1 as the input.
   - **Claim.** §5.1 on main provides no coefficient-field descent.
   - **Witness.** DiophantineApproximationAndTranscendence §5.1 on main (its README lines 2928–2966) offers `IsDFinite.add`, `.mul`, `.derivative`, `.mono` (ascent, k ⊆ k′ only), `isDFinite_polynomial`, `isDFinite_iff_pRecursive` and the disc initial-value theorems. It has no descent.
   - **Repair.**
     - Delete "descent" from line 47.
     - Either state the line-653 clause as this roadmap's own claim with its route, or delete the clause, since nothing consumes it. The route: expand the ℚ̄[x]-coefficients of an annihilator in a ℚ-basis of the finitely many algebraic numbers involved. Because f has rational coefficients, each basis component is a ℚ[x]-annihilator, and the leading one is nonzero.
     - Test: f = 1/(1−x) has the annihilator (1−x)f′ − f = 0 over ℚ.

7. **F07** (P3) Formal inversion is used but the pinned declaration is not cited

   - **Location.** README line 207 ("recursive formal inversion over ℤ has integral coefficients") and line 795 ("Formal inversion exists because p(0)=0 and p′(0)=1"). The From Mathlib contract (lines 29–37) and the *Needs:* lines of §0.5 and §4.8 omit it.
   - **Witness.** Mathlib `PowerSeries.substInv` in `Mathlib/RingTheory/PowerSeries/Substitution.lean` (line 456), with `subst_substInv_right` (line 510) and `subst_substInv_left` (line 542). It applies to series with zero constant coefficient and invertible linear coefficient over a commutative ring, including ℤ.
   - **Repair.** Cite these three declarations in From Mathlib and in the *Needs:* of §0.5 and §4.8. Test: for P = X + X⁴/32 over ℚ, `substInv` begins X − X⁴/32, as in the §4.8 Check.

8. **F08** (P3) Module docstring gives the wrong missing carrier for the centred capacity theorem

   - **Location.** `Suggested.lean` lines 12–13: "The centred capacity rank theorem also lacks the general logarithmic capacity and equilibrium-measure interface."
   - **Witness.** For the centred disc or circle of radius r, the §5.1 numerator is `Real.circleAverage (fun z => Real.log (max 1 ‖g z‖)) 0 r` and the capacity is r (ClassicalArithmeticCompletion §6.40). What is actually missing is the span W, the same carrier the docstring already names.
   - **Repair.** Replace the sentence with: "The centred capacity rank theorem bounds the same span W and lacks the same carrier."

9. **F09** (P3) Repeated sentences (style)

   - **Location.**
     - Line 239: two sentences both say the pair 1, p refutes the ℚ-independence version.
     - Lines 371 and 383: the CDT25 (1.1.4)–(1.1.5) benchmark paragraph appears twice, once as prose and once as a Check.
     - Lines 511, 581, 599, 711, 823 and 839 each restate their preceding sentence.
   - **Repair.** Keep one copy of each. Line 383 is better removed, since a Check should be a computation.

10. **F10** (P3) Plan prerequisite edges name a roadmap that exists nowhere

   - **Location.** `design/plan.json`, eight node prerequisites. For example, AA.5/compact-counterexample lists "LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1/capacity" and "…:LP.1/equilibrium".
   - **Witness.** The name is absent from main, from the 354 open roadmap pull requests (`roadmaps list`), from the board packages index and from ORDER.txt. ClassicalArithmeticCompletion (main) line 23 names it only as a future consumer.
   - **Repair.**
     - The maintainer repoints those plan edges to ClassicalArithmeticCompletion §§6.18, 6.40 and gap:complex-logarithmic-equilibrium, as the README already does. Plan nodes are frozen after the design, so this is the maintainer's call.
     - Non-blocking: the README deliverable and the depcheck are consistent.

Ten findings: one P1, five P2 (six blocking), four P3. The mathematics is in good shape. Every sampled locator checks out, the two corrections the package makes to CDT25 hold up (I recomputed both), all cited library declarations and supplier sections exist, and `Suggested.lean` elaborates with only `sorry` warnings. The blocking findings are: an unowned gap (G1); four groups of `Suggested.lean` declarations that are padding under the headline rule (input lemmas, a statement implied by another one, a special case); and one supplier contract that credits a statement to Part I §5.1 that §5.1 does not make.

Ownership: the package owns real content. It covers the arithmetic holonomicity theorem of CDT25 §2 with its three proofs, the integral holonomic ring, and the corrected Corollary 2.0.5 and (2.5.28). It is not an alias. No other roadmap plans this material: `roadmaps grep` over main and the 354 open roadmap pull requests finds no match for "arithmetic algebraization" or "holonomy rank". ConformalMappingPartII owns only CDT25 Lemma 2.3.1, the meromorphic-basis and pole-clearing inputs, and §§4–6 material. ModularCurvesPartII and AlgebraicModularFormsAndSerreWeights cite only CDT25 §4. The Part I roadmap DiophantineApproximationAndTranscendence is on main; the open pull request by rwst revises it. The package imports Part I by name and section (§5.1, and §§0.2–0.3, 2.8, 5.1–5.3 in Scope) and plans none of it again.

## Adversarial pass

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Convention: Taylor normalization | F = x² | iteratedDeriv 2 at 0 is 2; 2/2! = 1 = coefficient. Unscaled gives 2 ≠ 1 | sound | — |
| Convention: Haar normalization | g = 2z | J = log 2 ≈ 0.693; arclength version 2π log 2 ≈ 4.355 | sound | — |
| Convention: Vandermonde sign | (1, −1) | ∏_(i<j)(z_i − z_j) = 2; `det_vandermonde` = −2; both have norm 2 = 2^(2/2) | sound | source misprint listed below |
| `IntegralSeries` / lattices (§0.1) | Σ(x/2)^n; constant 1/2; χ = t + t²/4 | Scale 1 gives coefficient 1/2 ∉ ℤ, scale 2 gives 1. Constant 1/2 fails every M. χ: ordinary M = 2 gives 4·¼ = 1; tangent M = 2 gives ½; tangent M = 4 gives 1 | sound | — |
| `Uniformizes` (§0.2) | (2z, X, 2z) vs (2z, X, 3z) | F = id; coefficients (0, 1, 0, …) match; F∘φ = 2z ≠ 3z, so the second fails. φ(0) ≠ 0 is junk; every theorem has `hφ0` | sound | — |
| `positiveLogMean` | g ≡ 2, ½, 0 | log 2; 0 (raw mean −0.693); 0 | sound | — |
| `rationalFunctionField` | p = X, X², 2 | ℚ(X) contains X⁻¹ (a ℚ-span would not). finrank over ℚ(X²) is max(2, 0) = 2. p = 2 gives ℚ with native finrank 0 | sound | — |
| `multiplierLogBound` | (h, g) = (1, 1), (1+z, 0), (1−2z, 2z) | log 1 = 0; boundary sups 2 and 0 give log 2; sups 3 and 6 give log 6 ≈ 1.79 | sound | R02 |
| `circleDiscrepancy` | singleton; 3rd roots; (1, 1, −1); antipodal; d = 0 | 1; 1/3; 2/3 (arc around the double point); 1/2; guard 0 vs raw supremum 1 | sound | R03 |
| §0.3 (CDT25 Lemma 1.1.2) | 1 + x², R = 2; Σx^n at R = 1 | Taking r = 3/2 gives \|a_n\| ≤ C(2/3)^n < 1 eventually; at R = 1 every coefficient is 1 (not a polynomial) | sound | — |
| `eisenstein_denominators` (§0.4) | ½; √(1−4u); 0 | c = 2, M = 1 gives (1, 0, …); coefficients 1, −2, −2, −4, −10 are integral with c = M = 1; trivial for 0 | true | R04 |
| §0.5 | p = x + x⁴/32; p = x² | χ = t − t⁴/32 + t⁷/256 + …; M = 4 gives 4³/32 = 2 and 4⁶/256 = 16. For x², χ = t and M = 1 | sound | — |
| §1.1 | f = (1, p), D = 2; d = 1, f = 1 | p·f₁ = 1·f₂, so only ℚ(p)-independence works. {1, x} has determinant 1 | sound | — |
| §1.2 | d = 2, α = 3; d = 1, κ = ½; d/(d!)^(1/d) | 6 = C(4,2) vs 9; D/α → 3 and rows/surplus = ½ = κ; 1 ≤ e at d = 1, 10/10!^(0.1) ≈ 2.21 ≤ e | sound | — |
| §1.3 | F = x₁ − x₂, χ = t + t²/2, φ = 2z + z²; χ = 2t | Lowest part 2z₁ − 2z₂, \|c\|·2^β = 2. The non-tangent χ = 2t gives an integral pullback but coefficient ½ | sound | — |
| §1.4 | φ = 2z, p = x, h = 1, m = 1 | Limiting right side e·log 2 ≈ 1.88 ≥ log 2 ≈ 0.69 | sound | — |
| `multiplier_rank_bound` (§1.5) | h = 1 − 2z, g = 2z | 1 ≤ 7.03; implied by 1 ≤ e via J = log 2 ≤ A = log 6 | true | R02 |
| `mean_rank_bound` (§2.1) | m = 0; {1} with φ = 2z; {1, √(1−4x)} with φ = (1−e^(8z))/4 | 0 ≤ RHS (RHS ≥ 0). 1 ≤ e. J ≈ 1.890 (computed) gives RHS ≈ 7.41 ≥ 2. Hypotheses match CDT25 Theorem 2.0.1; the published page shows φ on the closed disc | sound | — |
| `arithmetic_algebraicity` (§2.2) | √(1−4x); 0 | Annihilators Y² − (1−4x) and Y; not rational | sound | second conjunct is redundant (ℚ(x)/ℚ(p) is finite); no change |
| `andre_algebraicity` (§2.3) | λ = 2 with r = ¾ and r = ¼; Σx^(2^k) with φ = z | rλ = 1.5 > 1 vs 0.5; λ = 1 gives a transcendental example | true | R05 |
| §2.4 (Lemma 2.4.2) | 3z₁²z₂; 1 − z; z₂^100 + z₁ | log 3 = log 3; 0 ≤ 0 (Jensen); lex-minimal (0, 100) ≠ total-degree-minimal (1, 0) | sound | — |
| §2.5 | p = x, φ = 2z, m = 1; (0, 100) | 1 ≤ e; coefficient scales by 2^100 | sound | — |
| §3.2 (continuity of D) | (δ_(e^(i/n)) + δ_(e^(−i/n)))/2; n-gon | D = 1 − 1/(πn) → 1 = D(δ₁); 1/n → 0. Both semicontinuities were checked via the atom-avoiding mesh | sound | — |
| §3.3 (Koksma) | cos(2πt) at singleton 1; constant | error 1 ≤ 4·1; 0 ≤ 0 | sound | — |
| §3.4 (Erdős–Turán) | d-gon with K = d − 1; singleton with K = 1 | 3/d ≥ 1/d; 9/2 ≥ 1 | sound | — |
| §3.5 | Re z; h = 2z; h = 1 − z | variation ∫₀¹ 2π\|sin 2πt\| dt = 4; constant log 2 gives 0; finite at z = 1 | sound | — |
| `fekete_circle` (§3.6) | d = 1; (1, −1); (1, 1); 3rd roots; (1, i, −1, e^(iπ/4)) | 1 = 1; 2 = 2; 0 < 2; 5.196 = 3^1.5; 4.33 < 16 | true | R03 |
| §3.7 | Haar; antipodal probability | I = 0; diagonal +∞ (off-diagonal part −(log 2)/2) | sound | — |
| `vandermonde_discrepancy_gap` (§3.8) | d = 1; repeated points; n-gon; antipodal with cutoff A | D = 1 but \|V\| = 1, so the bound needs d₀ ≥ 2 (allowed by the existential); V = 0; D = 1/d < ε eventually; A/2 − (log 2)/2 | true | R03 |
| §3.9 | d = 2, F = x₁ − x₂, φ = 2z, M = 1; S = 0 | H = 2(z₁ − z₂)², coefficients (2, −4, 2); lex-max coefficient 2 = λ^β with β = 1 (not 4); M = 0 gives V⁰ = 1 | sound | — |
| §3.10 | κ = ½; log d/d | 3^(1/d) → 1; 0.347 at d = 2 | sound | — |
| H (§4.1) | 1; exp x; exp(x/(1−x)) with χ = L/(1+L) | 1 ∈ H(ℂ); coefficient ½ ∉ ℤ; f∘χ = 1/(1−t) is integral and (1−x)²f′ − f = 0, but the essential singularity at 1 puts f outside H | sound | — |
| §4.2 | x·1, ½·1, 1/(1−x)² | in H; not integral; pole at 1 with a first-order equation | sound | — |
| W, V (§4.3) | p = x + x⁴/32 | ℚ(x) ⊆ V with [ℚ(x):ℚ(p)] = max(4, 0) = 4; x⁻¹ ∈ V | sound | — |
| §4.4 | 1/(1−x) with q = 1 − t; 1/(1 − 2x²) with q = 1 − 2t² | q(p)f = 1; both conjugate singularities cleared | sound | — |
| §4.5 | U = ℂ, p = x, χ = t, φ = 2z | dim W ≤ e, so 1 ≤ dim W ≤ 2 | sound | — |
| §4.6 | p = x², χ = t | x ∈ H gives W = V; degree 2 | sound | — |
| §4.7 | ℂ∖{1} with 1 − e^(2z); 𝔻 | never 1, φ′(0) = −2; Schwarz gives \|φ′(0)\| ≤ 1 | sound | — |
| §4.8 | p = x + x⁴/32, φ = 2z | \|p(2z)\| = 2\|1 + z³/4\| ∈ [1.5, 2.5], so J = log 2 exactly (Jensen, no zeros). Exact B = e ≈ 2.718; the README's bound gives B ≤ 3.593. dim_ℚ(p) V ≥ 4 | sound (sharper than stated) | — |
| §5.1 | r = ½ with φ = 4z, and with φ = 2z | rλ = 2, J_r = log 2, B = e; rλ = 1, denominator 0, excluded | sound | — |
| §5.2 | K = closedDisk(½, ¼), φ = 8z·e^(−20z) | \|φ\| ≤ 6e^(−5) ≈ 0.0404 (numerical max on ∂K ≈ 0.0135); denominator log 8 + log ¼ = log 2 > 0; numerator 0; rank ≥ 1 | sound | — |
| gap:complex-logarithmic-equilibrium | circle of radius 2; point | minimal energy −log 2, capacity 2; point mass has energy +∞ and capacity 0 | precise, minimal, declared in both places | — |

## Verified sound

- **Elaboration.**
  - `lake env lean` on `Suggested.lean`, run from the content checkout, exits 0. The only output is seven "declaration uses `sorry`" warnings, at lines 48, 68, 91, 111, 129, 151 and 163.
  - The file has one `import Mathlib`, no `set_option`, no sorry'd data, no `lemma`, a docstring on every declaration, and Layer section comments in README order.
- **Binder scan.** I ran `#check @name` for all 13 declarations in one scratch file. Every elaborated type matches its README statement. There are no section variables, so no binder can be lost.
- **One-tactic probes.** Each of the 7 theorems was tried with `simp`, `rfl`, `infer_instance` and `aesop`: 28 probes, all failed. The padding findings rest on implication and special-case arguments (R02–R05), not on one-tactic closure.
- **Depcheck** (`gate --depcheck … --movable`): `depcheck: 49 roadmaps, 558 edges, 0 problem(s)`. No UPWARD or CYCLE line. All suppliers come before this roadmap in ORDER.txt: GeometryOfNumbersAndQuadraticArithmetic (78), ClassicalArithmeticCompletion (105, also on main), ConformalMappingPartII (113), ProbabilisticAndMetricNumberTheory (265); this roadmap is at 266. Part I is on main. No roadmap cites this package, so there is no cycle.
- **Library declarations opened at the pins (24)**, all present at the cited file and line:
  - Mathlib: `PowerSeries.coeff` (Basic 76), `coeff_rescale` (583), `subst` (Substitution 155, docstring; def at 157), `substAlgHom` (170), `RatFunc.coeToLaurentSeries` (LaurentSeries 391), `RatFunc.liftAlgebra` (RatFunc/Basic 756), `RatFunc.finrank_eq_max_natDegree` (IntermediateField 162), `IsAlgebraic.exists_integral_multiple` (Algebraic/Integral 146), `Int.Matrix.exists_ne_zero_int_vec_norm_le` (SiegelsLemma 155), `fieldOfFiniteDimensional` (FiniteDimensional/Basic 521), `Stirling.factorial_isEquivalent_stirling` (246), `Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le` (Liouville 42, hypotheses as stated), `AnalyticOnNhd.circleAverage_log_norm` (JensenFormula 375; nonzero radius and nonzero centre value), `Real.circleAverage` (CircleAverage 55, factor (2π)⁻¹), `Matrix.det_vandermonde` (219, product of v_j − v_i), `gramSchmidtOrthonormalBasis_det` (374), `eVariationOn` (BoundedVariation 60), `LipschitzWith.comp_boundedVariationOn` (1256), Prokhorov `isCompact_setOfPred_finiteMeasure_le_of_isCompact` (183), `ProbabilityMeasure.tendsto_iff_forall_integral_tendsto` (365), `ProbabilityMeasure.continuous_prod` (FiniteMeasureProd 144, hypotheses as stated), `tendsto_measure_of_null_frontier_of_tendsto` (Portmanteau 353).
  - Tau Ceti: `empiricalMeasureOfFintype` (54), `integral_empiricalMeasureOfFintype` (100, needs strongly measurable f and a complete target), `DifferentiableOn.torusIntegral_prod_sub_inv_smul` (CauchyIntegralPolydisc 116).
  - The RatFunc → LaurentSeries algebra in the Lean file is Mathlib's scoped `liftAlgebra`, which the file opens.
- **Cross-roadmap citations resolved (5 suppliers, 15 sections).**
  - DiophantineApproximationAndTranscendence §5.1 (main, and the same section at the open revision): correct except "descent" (R06).
  - ConformalMappingPartII at its open head: §§0.1–0.6 (equations, jets, continuation, global solutions, meromorphic local bases, rational pole clearing), §1.3–1.4 (pointed radius, extremality) and §3.5–3.7 (phase, smoothing, quotient representation) say what the contract claims. Its §3.8 is the witness for R02.
  - ProbabilisticAndMetricNumberTheory §2.7 at its open head: strict-cut star discrepancy, guarded empty value, `koksma`, and `erdos_turan` with constant 3.
  - GeometryOfNumbersAndQuadraticArithmetic §0.1 (0.1.1 `orthonormal_coordinate_hadamard`, 0.1.2 `hermitian_gram_hadamard`) at its open head.
  - ClassicalArithmeticCompletion §6.18 (transfinite diameter, unordered pairs, exponent 2/(n(n−1))), §6.19 (Chebyshev norms) and §6.40 (d(closedBall(b, R)) = R, d([a, b]) = |b − a|/4) on main.
  - `roadmaps resolve` lists nothing missing, and I confirm that.
- **Declared gap gap:complex-logarithmic-equilibrium.**
  - Precise: nonempty compact K; uniqueness only at positive capacity; circles and discs of positive radius.
  - Minimal: ClassicalArithmeticCompletion on main has transfinite diameter and disc values but no logarithmic energy or equilibrium measure; a grep found only a condenser Dirichlet energy.
  - Declared under the supplier's subsection (README line 67) with the same slug in the plan's `gaps`.
  - Ownership note, not a finding: ArithmeticDynamics §2.5 (later in the order, 268) plans an archimedean mutual energy for mass-zero continuous-potential measures, and RandomMatrices Milestone 9 plans a weighted logarithmic energy on ℝ. Pointing the gap at the earlier ClassicalArithmeticCompletion is the right direction. The intake may cross-reference both.
- **Headlines.**
  - The README's headline theorems are §2.1 (mean bound), §2.2 (algebraicity), §4.5–4.7 (holonomic W bound, V comparison, integral-coordinate finiteness) and §5.1 (centred capacity).
  - §2.1 and §2.2 are stated faithfully.
  - §4.5–4.7 and §5.1 are correctly declared not statable. The integral holonomic ring needs the full-meromorphic-basis carrier owned by ConformalMappingPartII §0.5, which is absent at the pins; defining a local copy would rebuild another roadmap's object.
  - No statable headline is missing.
  - The sharper constant-2 bound of Bost–Charles (CDT25 Remark 2.5.29, line 1389) is a different theorem from a different source, not a narrowing of CDT25 Theorem 2.0.1.
- **README shape.** All required headings are present. Every layer ends with Examples and Dependencies. There are no LaTeX delimiters, process words or pull-request numbers. Every definition has three or more discriminating Checks (§0.1: 5; §0.2: 11; §1.4: 3; §3.1: 6; §4.1: 6; §4.3: 5). Every backticked own name is declared in `Suggested.lean`.
- **Sources: seeded sample (15 targets) plus the Lean-bearing locators.** Every theorem number, page, hypothesis and statement was checked against CDT25, BB11 and Saff10:
  - 0.3: Lemma 1.1.2, p.629, line 145.
  - 1.1 and 1.2: Lemma 2.1.2 and its proof, pp.637–638, lines 546, 604. The README restricts the height constant to d ≥ d₁(κ), a conservative narrowing that does not affect any headline.
  - 1.4: (2.2.1)–(2.2.3), pp.638–639, lines 614–707.
  - 2.3: §1.1.1, p.630, line 169.
  - 2.5: §2.4.6, pp.642–643, line 973.
  - 3.5: Definition 2.5.5 and (2.5.6), p.645, line 1096; the log⁺ use is at line 1245.
  - 3.10: §2.5.25, pp.648–649, lines 1327–1363.
  - 4.1–4.3: Definition 2.0.4, pp.635–636, lines 467–485.
  - 4.6–4.8: Corollary 2.0.5, p.636, lines 489–510.
  - 5.1: (2.5.28), p.649, line 1364.
  - Lean-bearing locators: BB11 §1, p.1 (line 26), Theorem 6.1, p.10 (line 543), and §8, p.14 (line 764); CDT25 Theorem 2.0.1 (line 440); Lemma 2.0.8 (line 519); Lemmas 2.5.3 and 2.5.9 (lines 1063, 1134).
  - Saff10: Lemmas 1.6–1.7, Definition 1.8 and Theorem 1.9 (lines 272–300) and Example 1.10 (line 387).
  - I rendered the published pages 635–636 from the cached offprint to confirm details the text extraction loses: φ is defined on the closed disc in Theorem 2.0.1 and Corollary 2.0.5, and the operator in Definition 2.0.4 is over ℚ̄(x).
  - No locator is flagged as unverified in the package. No source was fetched, and `sources.toml` is unchanged.

## Not verifiable

- **Published errata for CDT25.** I did not run my own web search. The design record says a bounded search, which I could not repeat offline, found none. I rely on that and on my independent recomputation of E1 and E2.
- **Bost–Charles, Corollary 8.3.5.** Not read (no local copy); it is used only in my remark above.
- **CDT25 pp.639–641 (Lemma 2.3.1).** Read only where it bears on the inherited ConformalMappingPartII issues listed below.

## Source issues

- **Error** in CDT25 at Corollary 2.0.5, (2.0.7), printed p.636: the source says the ℚ(p)-dimension of the ℚ(x)-span V is at most e·J/log|φ′(0)| for any rational tangent coordinate (p = x + x⁴/32, φ = 2z gives dimension ≥ 4 > e); it should be that bound for the ℚ(p)-span W, with the factor [ℚ(x):ℚ(p)] for V unless the coordinate is integral; affects a stated result.
- **Error** in CDT25 at §2.5.27, (2.5.28), printed p.649: the source says the capacity bound holds for every compact K inside the open unit disc; it should be restricted to discs and circles centred at 0 (it fails for the disc of centre ½ and radius ¼ with φ = 8z·e^(−20z)); affects a stated result.
- **Misprint** in CDT25 at (2.5.2), printed p.644: the source says the product over i < j of (z_i − z_j) equals the Vandermonde determinant; it should be that the determinant equals this product times (−1)^(d(d−1)/2); affects nothing.
- **Error** in CDT25 at the proof of Lemma 2.3.1, (2.3.2), printed p.640: the source says the displayed quotient of two exponentials equals G; it should be that quotient multiplied by the unit G(0)/|G(0)|, or an equality of moduli only; affects the proof.
- **Misprint** in CDT25 at the proof of Lemma 2.3.1, printed p.641: the source says the supremum of |h| is bounded by the mean of log⁺|g|; it should be the supremum of log|h|; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b314373", "job": "REV-PKG-DiophantineApproximationAndTranscendencePartII", "model": "opus", "worker": "fable-rev102"} -->

---

<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1467#issuecomment-6395258421 -->
Review (codex) of b314373

Verdict: needs_changes

1. **F01** (P1) The arbitrary-compact obligation is still unowned

   **Location:** `packages/DiophantineApproximationAndTranscendencePartII/README.md:861`: “The corresponding generalization problem is to specify a base-point-sensitive sampling geometry and prove its rank theorem”. Also `packages/DiophantineApproximationAndTranscendencePartII/design/plan.json:2020`.

   **Claim:** The package retains the arbitrary-compact generalization as an obligation, but does not resolve or declare its ownership. G1 is not an ordinary conditional supplier contract.

   **Witness:** The G1 entry at plan lines 2020–2028 has no supplier. README line 67 declares only `gap:complex-logarithmic-equilibrium`; the exact G1 identifier occurs nowhere in the README. Its translated-disc test gives numerator 0 and rank at least 1.

   **Exact repair:** Use the scope-decision alternative already specified in G1: obtain and record the maintainer decision releasing the arbitrary-compact replacement obligation, then close G1 consistently in the permitted gap metadata and the README. Retain both the centred theorem and the counterexample. Until that decision, expose the exact G1 identifier and its unresolved ownership in the supplier-contract section and keep the package blocked. Simply omitting the slug does not discharge it. If the generalization is retained instead, it needs a named owner and an exact valid statement before this finding can close.

   **Repair test:** The unchanged instance K=closedDisk(1/2,1/4), φ(z)=8z exp(−20z), p=x, χ=t has capacity 1/4, denominator log 2, numerator 0 and rank at least 1. Closing the unsupported general target leaves this as a negative Check and leaves §5.1 applicable only to its stated centred shapes. No false general theorem should be introduced to satisfy the obligation. This is a contract defect, not a refutation of §5.1 or a reason to re-plan the entire roadmap.

2. **F02** (P3) Attribute coefficient descent to the local target

   **Location:** `packages/DiophantineApproximationAndTranscendencePartII/README.md:47`: “with sum and product closure, descent and complex initial-value existence and uniqueness”.

   **Claim:** The base roadmap's §5.1 supplies descent of D-finiteness from algebraic coefficients to rational coefficients.

   **Witness:** `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:2928` supplies D-finiteness, closure, scalar enlargement and initial values; it does not state coefficient-field descent. The package itself states this descent at README line 653.

   **Exact repair:** Remove “descent” from the imported §5.1 contract, and explicitly identify the coefficient-linear-system descent in this package's §4.1 as its owner. No new supplier gap is needed: the local target already states it.

   **Repair test:** For rational f, a bounded-order, bounded-degree annihilator over ℚ̄ is a nonzero solution of coefficient equations over ℚ. Their finite-dimensional rational row span has the same rank after extension to ℚ̄, hence has a nonzero rational kernel vector. For f=exp(x), the coefficient vector (−1,1) of f′−f gives rank 1 and kernel dimension 1 over both fields. This local argument supplies exactly the descent the imported contract overstates.

3. **F03** (P3) Correct the pinned substitution line locator

   **Location:** `packages/DiophantineApproximationAndTranscendencePartII/README.md:29`: “lines 155 and 170”.

   **Claim:** `PowerSeries.subst` starts at line 155 of the pinned substitution file.

   **Witness:** `Mathlib/RingTheory/PowerSeries/Substitution.lean:155` is blank; `PowerSeries.subst` starts at line 157. `PowerSeries.substAlgHom` does start at line 170.

   **Exact repair:** Change “lines 155 and 170” to “lines 157 and 170”.

   **Repair test:** The declaration at line 157 takes the inner series first. Substituting χ=t into f=x² gives t², with quadratic coefficient 1; the locator correction preserves the package's substitution direction.

## Verified sound

There was no earlier package review to reconcile. I read all four authored package files, all 35 numbered mathematical sections, all 40 listed API assertions, every Check, the worked examples and all 35 `Needs` lines. I compared the shape with the main-branch DiophantineApproximationAndTranscendence and ClassicalArithmeticCompletion roadmaps. The six layers have Examples and Dependencies sections. The definitions have discriminating positive and negative controls; the real-bodied Lean definitions agree with the prose. The manuscript develops the stated general arithmetic theorem, including ramified p=x², rather than a modular-function shortcut. No executable algorithm, copied source passage, sorry-valued data, forbidden import, `set_option`, admitted example or process-dependent instruction was found in the authored acceptance test. Source text was treated as evidence only.

The seven Lean theorem statements survive the mathematical tests below. This is not a claim that their admitted proofs have been formalized. The main obstruction to acceptance is R01. R02 and R03 are non-blocking corrections.

### Source verification

All three manifest works were legally available in the supplied line-numbered cache. Their versions agree with the manifest: CDT25 is the published offprint with journal pagination 627–702; BB11 is arXiv v2; Saff10 is arXiv v1 with journal pagination. Visual inspection of BB11 p.1 and CDT25 p.635 also confirmed the reversed tail exponent and the algebraic-closure overbars; extraction loss of an overbar was not counted as an error. No extra work was fetched, no manifest entry was rewritten, and no missing-source request was needed. No locator in the package is marked unverified or uncertified.

Every one of the 15 seeded targets was checked against the actual passage, including its surrounding hypotheses:

| Target | Source passage opened | Result and concrete verification |
|---|---|---|
| 0.3 integral series beyond radius one | CDT25 line 145, Lemma 1.1.2, p.629 | Integer coefficients and R>1 are explicit. For Σxⁿ at R=1, aₙ=1 never vanishes; for a polynomial, aₙ=0 eventually. |
| 1.1 separate-variable independence | CDT25 line 604, proof of Lemma 2.1.2, p.638 | Source uses ℚ(p)-independence. The package's coefficient-functional proof avoids evaluating unrestricted formal series at nonzero points. The family 1,p under the weaker ℚ-premise duplicates p. |
| 1.2 auxiliary construction | CDT25 line 546, Lemma 2.1.2; CDT25 line 574 and CDT25 line 599, pp.637–638 | D/α and the Siegel surplus exponent match. The cofinal d restriction repairs the source's excessive all-d uniformity; see the source issue below. At d=2, α=3 there are 6 strict total-degree constraints. |
| 1.4 multiplier extrapolation | CDT25 line 614 and CDT25 line 632, equations (2.2.1)–(2.2.3), pp.638–639 | Nonzero lowest coefficient, h(0)=1 and λ>1 are retained. h=g=1 gives A=0. |
| 2.3 André open-disc criterion | CDT25 line 169, §1.1.1, pp.630–631; CDT25 line 242, equations (1.1.4)–(1.1.5), p.631 | The open-disc statement is derived by restriction, not falsely attributed to the closed-disc theorem verbatim. λ=2 and r=3/4 give new derivative 3/2. |
| 2.5 logarithmic averaging route | CDT25 line 973 and CDT25 line 1001, §2.4.6, equations (2.4.7)–(2.4.10), pp.642–643 | Least lexicographic coefficient, not least total degree. For z₂¹⁰⁰+z₁, substitution by 2z scales that coefficient by 2¹⁰⁰. |
| 3.5 variation | CDT25 line 1096, Definition 2.5.5 and (2.5.6), p.645; CDT25 line 1245, p.647 | The package explicitly fixes differentiation in turns and extends the positive-log argument to complex h by a 1-Lipschitz radial map. Re z has variation 4; h=0 has variation 0. |
| 3.10 damping limit | CDT25 line 1327 and CDT25 line 1356, §2.5.25, pp.648–649 | Limit order α,d,κ,ε and pre-damping exponent β agree. log d/d tends to 0; at d=2 it is log 2/2, not 0. |
| 4.1 holonomic germs | CDT25 line 467 and CDT25 line 479, Definition 2.0.4 and its local-basis explanation, pp.635–636 | Full meromorphic bases, including poles, are what the source means. exp(1/(x−α)) has trivial topological monodromy but fails this condition. |
| 4.2 closure | CDT25 line 473, pp.635–636 | Source calls H a ring. The package supplies the direct-sum/tensor/subquotient argument, with arithmetic closure separately checked. Multiplication by 1/2 fails integrality of 1. |
| 4.3 scalar spans | CDT25 line 473, Definition 2.0.4, p.635; CDT25 line 498, p.636 | Source V is the ℚ(x)-span. W is explicitly introduced as the different ℚ(p)-span. For p=x² the scalar extension degree is 2. |
| 4.6 fields and V bounds | CDT25 line 489 and CDT25 line 502, Corollary 2.0.5 and proof, p.636 | This is a correction and a supplied finite-domain argument, not the printed erroneous V bound. The safe factor is n=[ℚ(x):ℚ(p)]. |
| 4.7 integral-coordinate finiteness | CDT25 line 489, first assertion of Corollary 2.0.5, p.636 | χ integral permits p=x. φ=1−exp(2z) maps to ℂ∖{1}, fixes 0, and has derivative −2; no hyperbolic radius is assigned there. |
| 4.8 scalar-span counterexample | CDT25 line 467 and CDT25 line 492, Definition 2.0.4 and (2.0.7), pp.635–636 | All printed premises hold. Degree 4 exceeds e log(5/2)/log 2≈3.593373119. |
| 5.1 centred capacity normalization | CDT25 line 1364, (2.5.28), p.649; Saff10 line 387, Example 1.10, p.173 | Supported centred special case after rescaling and correcting the scalar span. r=1/2, φ=4z give numerator log 2 and denominator log 2. |

Additional passages read: BB11 line 26 and BB11 line 543, §1 p.1 and Theorem 6.1 pp.10–11; BB11 line 764, §8 p.14; Saff10 line 272, Saff10 line 297, Saff10 line 310, Saff10 line 326 and Saff10 line 387, pp.171–173; CDT25 line 519, CDT25 line 711, CDT25 line 758, CDT25 line 820, CDT25 line 936, CDT25 line 1063, CDT25 line 1082, CDT25 line 1110, CDT25 line 1134, CDT25 line 1181 and CDT25 line 1235. These cover denominator descent, all three analytic routes, every source-supported convention and the two explicit source counterexamples.

### Computed adversarial table

The following 108 rows record the computed pass. In the table, API numbers follow the bullet order within their subsection. “Retain” means the tested statement survived; a calculation is evidence on the stated instances, not a substitute for the proof route. The standing characteristic-zero fields exclude positive-characteristic and inseparable variants. Empty/rank-zero cases are checked where their carriers are admitted; no DVR, nonabelian group or scheme hypothesis is silently being asserted.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| Convention: coefficients and factorials | F=x², n=0,1,2 | coefficients (0,0,1); derivatives (0,0,2); 2/2!=1 | Matches | Retain |
| Convention: arithmetic substitution | χ=t and χ=t/2; f=x² | f∘χ=t² versus t²/4; coefficient 1 versus 1/4 | Inner argument is χ | Retain; R03 locator |
| Convention: normalized circle mass | g=2z and g=1/2 | J=log 2 versus arclength 2π log 2; J(1/2)=0 versus raw mean −log 2 | Cutoff and mass fixed | Retain |
| Convention: Vandermonde sign | d=1; z=(1,−1) | 1=1; product 2, determinant −2, sign (−1)¹ | Sign correct in package | Retain |
| Convention: limit order and factorial factor | κ=1/2; d=1,2,10,100 | 3^(1/d)→1; d/(d!)^(1/d)=1,√2,≈2.208125,≈2.632085→e | Limits as specified | Retain |
| 0.1 ordinary lattice definition | Σ(x/2)ⁿ; f=1/2; f=0 | at M=2 coefficients all 1; at M=1 coefficient 1/2; constant remains 1/2; zero gives 0 | Membership and nonmembership distinguished | Retain |
| 0.1 tangent lattice definition | χ=t+t²/4; M=1,2,4 | normalized quadratic coefficients 1/4,1/2,1; ordinary M=2 coefficient 1 | Stronger lattice needed | Retain |
| 0.1 IntegralSeries definition | 0,1,1+x/2 | coefficients 0; (1,0,…); offending 1/2 | True,true,false | Retain |
| 0.1 API 1: coefficient characterization | f=1+x/2, M=2 | scaled coefficients (1,1); all integers | Both directions hold | Retain |
| 0.1 API 2: rescale image | f=1+x/2, M=2 | f(2x)=1+x, integer image (1,1) | Both directions hold | Retain |
| 0.1 API 3: subring and scale one | f=x/2, h=1+x/2, M=2 | (f+h)(2x)=1+2x; (fh)(2x)=x+x²; at M=1, 1+x is integral | Closure and scale-one image | Retain |
| 0.1 API 4: divisibility of scales | M=2,N=4,f=Σ(x/2)ⁿ | Mⁿaₙ=1; Nⁿaₙ=2ⁿ | Inclusion in correct direction | Retain |
| 0.1 API 5: constants | c=2,1/2; M=1,4 | M⁰c=2 or 1/2 for both M | Scale cannot repair a constant | Retain |
| 0.1 API 6: normalized tangent equivalence | χ=t+t²/4,M=4 | χ(4t)/4=t+t²; 4^(2−1)/4=1 | Both descriptions agree | Retain |
| 0.2 Uniformizes definition | φ=2z,f=x,g=2z; negative branch of √(1−4x); φ=0 | correct pullback 2z; branch values 1≠−1; deriv(0)=0 fails every rank premise | Germ and nondegeneracy constraints work | Retain |
| 0.2 positiveLogMean definition | g=0,1/2,2,2z | J=0,0,log 2,log 2 | Real body gives cutoff mean | Retain |
| 0.2 rationalFunctionField definition | p=x,x²,0,2 | generated fields ℚ(x),ℚ(x²),ℚ,ℚ; degrees 1,2,∞,∞ | Not a linear span | Retain |
| 0.2 API 1: central coefficient | f=x² and constant f=1 | F″(0)/2=1; g(0)=1=a₀ | n=0 and factorial handled | Retain |
| 0.2 API 2: germ uniqueness | φ=2z,F=x,F₂=−x | compositions 2z and −2z differ; only first has coefficients of x | Wrong branch excluded | Retain |
| 0.2 API 3: ring operations | f=x,h=x²,φ=2z | u(f+h)=2z+4z²; u(fh)=8z³; u(0)=0,u(1)=1 | Equals sum/product of realizations | Retain |
| 0.2 API 4: shrink | φ=2z;r=3/4,1/4 | new derivative 3/2,1/2; first >1, second <1 | Analytic restriction versus size separated | Retain |
| 0.2 API 5: Taylor substitution | f=x²,φ=2z+z² | composed series 4z²+4z³+z⁴ | Coefficients agree with substitution | Retain |
| 0.2 API 6: common convergence radius | f₁=1/(1−x), f₂=1/(1−2x) | individual radii 1 and 1/2; common radius 1/4 works | Finite-family minimum positive | Retain |
| 0.2 API 7: constant means | c=0,1/2,2 | 0=log 1; 0=log 1; log 2=log 2 | Correct at zero | Retain |
| 0.2 API 8: generated-field minimality | p=x² | x² and 1/x² belong; x does not; every containing field contains ℚ(x²) | Field closure, not span | Retain |
| 0.2 API 9: constant/nonconstant fields | p=x² versus p=2 | finite degree 2 versus infinite extension and native finrank 0 | Zero finrank not interpreted as degree zero | Retain |
| 0.2 API 10: affine coordinate change | p=x², a=2,b=3 | x²=( (2x²+3)−3 )/2; generated fields equal | a≠0 essential | Retain |
| 0.2 API 11: rotation and positivity | g=2z, rotation i; g=1/2 | J(2iz)=log 2=J(2z); J(1/2)=0≥0 | Finite, normalized, rotation-invariant | Retain |
| 0.2 rational pole Check | f=1/(1−x), φ=2z | candidate u=1/(1−2z) has pole at z=1/2 | Closed-disc holomorphy fails | Retain |
| 0.3 integral overconvergence | f=1+x²,R=2,r=3/2; f=Σxⁿ,R=1 | for n≥3,0≤C(2/3)ⁿ; at R=1 coefficients remain 1 | Strict radius necessary | Retain |
| 0.4 Eisenstein theorem | f=0,1/2,√(1−4x) | c=M=1 for zero; c=2,M=1 gives constant 1; sqrt coefficients 1,−2,−2,−4 already integral | Scalar c needed exactly at nonintegral constant | Retain |
| 0.4 absorption and Puiseux | a₀ integral,n=1,2; f=1+x^(1/2)/2 | (cM)ⁿaₙ=c^(n−1)(cMⁿaₙ); with u=x^(1/2),M=2 gives 1+u | n=0 handled separately, N>0 | Retain |
| 0.4 finite coefficient field/tail argument | f=√2+√(1−4x) | coefficients in ℚ(√2); P_Y has finite order; truncating beyond it gives linear coefficient a≠0 | Recurrence stays in one finite field | Retain |
| 0.5 uniform inverse denominators | p=x,χ=t; p=x²,χ=t; p=x+x⁴/32,χ=p⁻¹ | M=1 works in first two; χ₄=−1/32 in third; p(4x)/4=x+2x⁴ has integral inverse | Ramification and nonintegral χ covered | Retain |
| 0.5 same-scale inverse API | χ=t+t²/4, M=4 | χ(4t)/4=t+t²; τ(4x)/4=x−x²+2x³−5x⁴+… | Both tangent lattices integral | Retain |
| 1.1 tensor independence | p=x,f=1,d=1,D=2; d=2,D=2; wrong family 1,p | matrices I₂,I₄, determinants 1,1; wrong family p·1−1·p=0 | Required scalar field exact | Retain |
| 1.2 auxiliary existence/count | d=2,α=3; d=1,κ=1/2,m=1 | 6 constraints versus 9 box entries; D/α→3; rows/surplus→1/2 | Counts and surplus match | Retain |
| 1.2 uniform C and cofinal d | p=x+2,f=1,d=1; κ small | nonzero P(T) divisible by (T−2)^α has some coefficient ≥2^α, so height/α≥log 2; d≥log(1+1/κ) instead gives dD/α≤e²+o(1) | Package avoids source's invalid all-d claim | Retain cofinal restriction |
| 1.3 integral lowest jet | F=x₁−x₂,φ=2z+z²; β=0,F=1 | lowest parts x₁−x₂ and 2z₁−2z₂; coefficient modulus 2=2¹; constant case 1=2⁰ | Exponent is original order | Retain |
| 1.3 tangent and multiplier guards | χ=2t,F=x/2; h=1−2z,D=1 | Fχ=t integral but original coefficient 1/2; h(0)=1 leaves lowest coefficient unchanged | Tangency indispensable, zeros of h allowed | Retain |
| 1.4 multiplier definition | (h,g)=(1,1),(1,2z),(1+z,0) | sup maxima 1,2,2; A=0,log 2,log 2 | Real body correct | Retain |
| 1.4 API 1: two-sup formula | h=1−2z,g=2z | sup∣h∣=3, sup∣hg∣=6; pointwise-max supremum 6 | Both formulas give log 6 | Retain |
| 1.4 API 2: nonnegative A | h=1,g=0; missing normalization h=0 | normalized sup=1,A=0; h=0 totalized log=0 but cannot satisfy h(0)=1 | Maximum-principle guard present | Retain |
| 1.4 API 3: exponential equivalence | h=1,g=2z,a=log 2 or 0 | 2≤exp(log 2)=2 true; 2≤exp 0=1 false; A≤a has same answers | Both directions tested | Retain |
| 1.4 extrapolation | p=x,χ=t,φ=2z,m=1,h=1 | limiting comparison log 2≤e log 2, approximately .693≤1.884 | Correct logarithm and denominator | Retain |
| 1.5 multiplier rank | same data; h=1−2z; empty family | 1≤e; 1≤e log 6/log 2≈7.03; 0≤same nonnegative bound | Empty family handled outside auxiliary lemma | Retain |
| 2.1 integrated rank | p=x,φ=Rz,R=2;m=1,0; λ=1 | 1≤e and 0≤e; log 1=0 fails strict premise | Correct range and total-function guard | Retain |
| 2.1 quotient phase input | g=i; g=h=1 | reconstruction without phase gives 1≠i; norms 1 and J=0; A(1,1)=0 | Supplied corrected quotient has right normalization | Retain |
| 2.2 algebraicity from powers | f=√(1−4x),0,1 | f²−(1−4x)=0; Y and Y−1 annihilate 0,1; sqrt degree 2≠rational degree 1 | Conclusion is algebraicity | Retain |
| 2.2 uniformity in power count | same scalar data, fixed B | if all powers independent, m=floor(B)+1>B; for f=1 rank is already 1 | No conclusion hidden in premises | Retain |
| 2.3 open-disc criterion | f=√(1−4x),φ=(1−exp(8z))/4 | φ′(0)=−2; u=exp(4z); u²=exp(8z)=1−4φ | Correct germ and strict expansion | Retain |
| 2.3 binomial integrality | m=2 and m=3 | initial coefficients (1,−2,−2,−4), (1,−3,−9,−45); M/m²>1 when M>m² | Valuation argument covers primes dividing m and not dividing m | Retain |
| 2.3 threshold controls | −log(1−x); Σx^(2^k); modular F | log has a₂=1/2 and fails integrality; lacunary φ=id has derivative 1 and dense singularities; F∘φ coefficients 4,−32+36=4 | Boundary examples do not satisfy strict premise | Retain |
| 2.4 logarithmic first-coefficient inequality | G=3z₁²z₂,1−z,z₂¹⁰⁰+z₁ | log∣c∣=log 3=mean; 0=mean for 1−z; vector (0,100), coefficient 1 and mean 0 | Zero set null; lex order distinct from total degree | Retain |
| 2.4 excluded zero germ | G=0 | no least nonzero coefficient; native log 0=0 cannot create one | Nonzero-germ hypothesis essential | Retain |
| 2.5 Jensen rank route | p=x,φ=2z; G=z₂¹⁰⁰+z₁ | log 2≤e log 2; least coefficient after scaling 2¹⁰⁰ versus total-order coefficient 2 | Route's β≥α is sufficient | Retain |
| 3.1 tuple discrepancy definition | empty,singleton,antipodal,regular triangle | D=0,1,1/2,1/3; unguarded empty expression has supremum 1 | Guard and circular cuts correct | Retain |
| 3.1 measure discrepancy definition | Haar,δ₁,uniform antipodal | 0,1,1/2 | Non-Haar models distinguished | Retain |
| 3.1 API 1: half-open arcs | arc length 0,1; singleton inside tiny arc ℓ | mass errors 0,0,1−ℓ→1 | Endpoint convention and supremum correct | Retain |
| 3.1 API 2: rotated stars | singleton at angle 1/2 | fixed star 1/2; cut through point gives star 1; supremum 1 | Not ordinary fixed-cut star discrepancy | Retain |
| 3.1 API 3: lower/upper bounds | roots d=1,2,3; identical d=3 | D=1,1/2,1/3 attains lower bounds; identical points D=1 | Both endpoints attained | Retain |
| 3.1 API 4: permutations | (1,1,−1) and (−1,1,1) | both mass at 1 is 2/3, D=2/3 | Multiplicity retained | Retain |
| 3.1 API 5: rotations | (1,−1) and (i,−i) | both D=1/2 | Rotation invariance | Retain |
| 3.1 API 6: repetition | (1,−1) repeated twice | weights 2/4=1/2; D remains 1/2, not 1/4 | Population and support distinguished | Retain |
| 3.1 API 7: empirical comparison | (1,1,−1) | empirical masses (2/3,1/3), both discrepancies 2/3; support-uniform value 1/2 | Native empirical law matches | Retain |
| 3.1 API 8: Haar characterization | Haar versus δ₁ | every Haar arc mass ℓ, error 0; shrinking arc about 1 gives error→1 | Zero iff Haar survives | Retain |
| 3.2 weak continuity | νₙ=(δ_exp(i/n)+δ_exp(−i/n))/2; roots d | D₁≈.681690,D₂≈.840845→1=D(δ₁); 1/d→0=D(Haar) | Atoms do not invalidate scalar continuity | Retain |
| 3.3 circular Koksma | g=Re z,singleton 1; constant c | error 1≤4·1; constant error c−c=0=0·D | Turns and pointwise values retained | Retain |
| 3.3 jump control | indicator of a semicircle, sample at included endpoint | variation 2, integral 1/2, singleton value 1, error 1/2≤2 | Sampling at a jump allowed | Retain |
| 3.4 circular Erdős–Turán | regular d-gon,K=d−1; singleton,K=1 | means 0 for 1≤k<d, so 1/d≤3/d; singleton 1≤9/2 | Rotation preserves Fourier moduli and constant 3 | Retain |
| 3.5 positive-log variation | h=0,z,2z,1−z | variations 0,0,0,2 log 2; value at boundary zero is 0 | No log singularity after cutoff | Retain |
| 3.5 C¹ variation and Lipschitz bridge | g=Re z; radial norms 0,1,2 | variation ∫2π∣sin(2πt)∣dt=4; log 2−0≤2−1=1 | Angular derivative and 1-Lipschitz estimate match | Retain |
| 3.6 Fekete maximum/equality | d=1; (1,−1),(1,1),(1,i); regular triangle | norms 1,2,0,√2,3√3; bounds 1,2,2,2,3√3 | Equality exactly polygon in these cases | Retain |
| 3.7 energy lower bound/uniqueness | Haar,δ₁,antipodal empirical measure | I=0,+∞,+∞; deleting diagonals would give −(log 2)/2 | Positive-capacity supplier contract needed | Retain conditionally |
| 3.7 kernel and capacity sign | circle radius 2; singleton | minimum −log 2, exp(−minimum)=2; singleton +∞ gives capacity 0 | Reciprocal convention excluded | Retain |
| 3.8 discrepancy gap | collisions; regular d-gon | 0<exp(−cd²); regular norm d^(d/2)>1 but D=1/d<fixed ε eventually | Quantifier order and large-d cutoff necessary | Retain |
| 3.8 truncated empirical energy | antipodal pair,A>0 | integral A/2−(log 2)/2; off-diagonal term −(log 2)/2; correction A/d=A/2 | d-limit must precede A-limit | Retain |
| 3.9 damping and derivative exponent | F=x₁−x₂,φ=2z,M=1 | H=2(z₁−z₂)², coefficients 2,−4,2; lower scale λ^β=2, not 4 | Order before damping correct | Retain |
| 3.9 ceiling and zero exponent | S=1,D=3,c=1,d=2; S=0 | ceil(3/2)=2; bad exponent dDS−cMd²=6−8=−2≤0; S=0 gives M=0,V⁰=1 | Ceiling and collision boundary correct | Retain |
| 3.10 final damping limit | κ=1/2; d=2 and d→∞ | 3^(1/d)→1; log 2/2≈.346574 versus limit 0; final m≤eJ/log λ | Same factor e, no circular proof | Retain |
| 4.1 H definition | 1,1/(1−x),exp x,χ=t | first two have integral coefficients; exp coefficient a₂=1/2 | Arithmetic and differential conditions independent | Retain |
| 4.1 essential-singularity control | L=−log(1−t),χ=L/(1+L),f=exp(x/(1−x)) | χ₁=1, χ₂=−1/2; fχ=exp L=1/(1−t); essential singularity at 1 | Integral D-finite does not imply H membership | Retain |
| 4.1 API 1: exact membership | f=1 and essential example above | first satisfies both conjuncts; second has integral pullback but fails full meromorphic basis | Wrong larger model excluded | Retain |
| 4.1 API 2: zero and one | any U,χ; operator ∂ | pullback coefficients 0 and (1,0,…); derivatives both 0 | H is not zero-only | Retain |
| 4.1 API 3: ring closure | f=1/(1−x),χ=t | f+1 coefficients (2,1,1,…); −f coefficients −1; f² coefficients n+1 | All remain integral with meromorphic poles | Retain |
| 4.1 API 4: restrict U | essential example; U'=disk(0,1/2)⊂ℂ | singularity 1 absent from U', present in ℂ; membership can increase on restriction | Inclusion direction correct | Retain |
| 4.1 API 5: ℤ[x]/ℤ[p] action | χ=t,p=x²,f=1 | xf=x and pf=x²; coefficients 1; multiplying by 1/2 gives 1/2 | Correct scalar ring | Retain |
| 4.1 API 6: D-finite descent | f=exp x; order 1,degree 0 coefficients | equation b₀+b₁=0 has rank 1 and kernel span (−1,1) over ℚ and ℚ̄ | Local descent works | R02 attribution |
| 4.1 local-basis/jet controls | xy′+y=0; x²y′+y=0; y‴=0 | bases x⁻¹ versus exp(1/x); pole order 1 versus essential; x² jet (0,0,2) | Full meromorphic condition and jet normalization exact | Retain |
| 4.2 closure theorem | f=1/(1−x) and f²; arbitrary rational multiplier | annihilators (1−x)∂−1 and (1−x)∂−2; (1/2)·1 has noninteger a₀ | Products allowed, unrestricted rational action not on H | Retain |
| 4.3 W definition | p=x and p=x²,χ=t | W spans over ℚ(x) or ℚ(x²); 1,x independent over ℚ(x²) | Scalar field part of type | Retain |
| 4.3 V definition | any admissible data | 1∈H, so x⁻¹·1∈V; x⁻¹ is not a power series | Laurent ambient necessary | Retain |
| 4.3 API 1: finite W expressions | p=x²,χ=t | x=p⁰·x and 1/p=p⁻¹·1 are W elements | Finite scalar combinations | Retain |
| 4.3 API 2: finite V expressions | f=1 | x⁻¹·f=x⁻¹, one generator and rational coefficient | Correct larger span | Retain |
| 4.3 API 3: subalgebras and scalar inclusion | 1∈H; scalars 1/p,1/x | (1/p)·1∈W and (1/x)·1∈V; each multiplied by p or x gives 1 | Domain and nonzero unit retained | Retain |
| 4.3 API 4: W⊆V and V=ℚ(x)W | p=x² | every W combination becomes a V combination; x⁻¹·1 generated from W by ℚ(x) | Both inclusions of span identity | Retain |
| 4.3 API 5: integral χ after finiteness | χ=t,p=x² | x∈H; field W contains x and x⁻¹, hence ℚ(x); scalar degree still 2 | W=V does not identify base fields | Retain |
| 4.3 API 6: source V | χ=t,p=x | both source and package are span over ℚ(x) of the same H | Equality of definitions | Retain |
| 4.4 simultaneous pole clearing | f=1/(1−x); f=1/(1−2x²), p=x | q=1−t gives q(p)f=1; q=1−2t² clears ±1/√2; q=i(1−t) gives i | Rational integral multiplier essential | Retain |
| 4.4 injectivity and singular base point | q≠0,p nonconstant; xy′−2y=0 | q(p)≠0; x² has formal and analytic solution x²; meromorphic fundamental frame converts formal solutions to constant coordinates | Initial germ exists even if chosen equation singular at 0 | Retain |
| 4.5 W rank theorem | U=ℂ,p=x,χ=t,φ=2z | 1≤dim W≤e; integer dimension ≤2; λ=1 gives denominator 0 | Uniform family bound yields finiteness | Retain |
| 4.6 field/scalar comparison | p=x²,χ=t; degree-four example | n=2 and W=V possible; in degree-four example dim over ℚ(p) V≥4 while B≈3.593373, safe nB≈14.37349 | Factor n cannot be discarded | Retain |
| 4.6 native finite-domain guard | one-dimensional field algebra; zero ring | rank 1 with 1≠0; zero ring cannot embed as the unital subalgebra used here | No degenerate field structure | Retain |
| 4.7 integral coordinate/map radius | U=ℂ,φ=2z; U=𝔻; U=ℂ∖{1},φ=1−exp(2z) | derivatives 2; at most 1; −2 respectively | Hyperbolic equivalence has correct domain | Retain |
| 4.8 source scalar counterexample | p=x+x⁴/32,χ=p⁻¹,φ=2z | χ=t−t⁴/32+…; pχ=t; degree 4; ∣p(2z)∣≤5/2; B≤3.593373119<4 | Source refuted; package correction survives | Retain |
| 5.1 centred circle/disc bound | r=1/2,φ=4z,p=x; φ=2z | capacity 1/2; derivative product 2, numerator log 2, denominator log 2, B=e; second product 1, denominator 0 | Strict denominator and base point retained | Retain conditionally |
| 5.2 arbitrary-compact obstruction | K=closedDisk(1/2,1/4),φ=8z exp(−20z) | ∣φ∣≤6e⁻⁵≈.040427682<1; cap=1/4; denominator log 2; numerator 0; rank≥1 | Proposed general bound would say 1≤0 | R01 contract; retain counterexample |
| Worked modular normalization | F coefficients 1,4,36; φ=q−8q²+… | Fφ=1+4q+(−32+36)q²+…=1+4q+4q²+… | Factor 16/theta-square convention matches source | Retain |

The remaining proof mechanisms were checked at their stated generality. The inverse-denominator construction treats p′(0)=0 by an Nth-root coordinate. The Eisenstein tail argument chooses N strictly greater than the order of P_Y(x,f), so its higher-Y terms have order at least 2N>N+s and the constant term is divisible by x^(N+s). The finite number field includes only finitely many initial coefficients before the recurrence determines the rest. In §2.4 the nonzero coefficient function supplies the negative-part bound needed for Fubini; totalized log at zeros is used only after nullness. In §3.2 mesh endpoints avoid atoms, and enlargement/inscription costs at most twice the mesh length in Haar mass, rather than falsely asserting uniform convergence of atomic distribution functions. In §4.2 a horizontal meromorphic frame identifies differential subquotients with constant subspaces, so apparent singularities do not introduce essential singularities. At a singular initial point in §4.4, the inverse meromorphic fundamental matrix sends a formal solution jet to a vector with derivative zero; its constant coordinates recover a convergent meromorphic solution, and the absence of negative powers makes this particular solution holomorphic. These checks close the relevant local proof steps without narrowing their statements.

### Pinned-library audit

Pins read from the manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following declarations and their surrounding binders were opened, rather than inferred from their names:

| Object / exact declaration | Pinned file and line | Scope checked |
|---|---|---|
| `PowerSeries.coeff`, `PowerSeries.coeff_rescale` | `Mathlib/RingTheory/PowerSeries/Basic.lean:76`, line 583 | Native coefficient map; aⁿ rescaling, including n=0. |
| `PowerSeries.HasSubst`, `PowerSeries.subst`, `PowerSeries.substAlgHom` | `Mathlib/RingTheory/PowerSeries/Substitution.lean:39`, lines 157,170 | HasSubst is nilpotence of the constant coefficient, not convergence. Zero constant suffices over the fields here. |
| `PowerSeries.subst_substInvOfIsUnit_right`, `PowerSeries.coeff_one_substInvOfIsUnit` | `Mathlib/RingTheory/PowerSeries/Substitution.lean:588`, line 582 | Existing formal inverse infrastructure; no new generic inverse-series construction is required. |
| `RatFunc.coeToLaurentSeries` | `Mathlib/RingTheory/LaurentSeries.lean:391` | Coercion is the algebra map; rationals with poles require Laurent, not power, series. |
| `RatFunc.liftAlgebra` | `Mathlib/FieldTheory/RatFunc/Basic.lean:756` | Scoped instance used by the algebraicity signatures. |
| `IntermediateField.adjoin` | `Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean:34` | Subfield closure of the algebra-map range together with the specified elements. No finiteness built into this definition. |
| `RatFunc.finrank_eq_max_natDegree` | `Mathlib/FieldTheory/RatFunc/IntermediateField.lean:162` | Constants have finrank 0 because the extension is infinite; nonconstant p supplies the finite-degree interpretation. |
| `IsAlgebraic.exists_integral_multiple` | `Mathlib/RingTheory/Algebraic/Integral.lean:146` | Clears one algebraic element, not all series coefficients uniformly. No duplication of Eisenstein's uniform conclusion. |
| `Int.Matrix.exists_ne_zero_int_vec_norm_le` | `Mathlib/NumberTheory/SiegelsLemma.lean:155` | Positive row count and strictly more columns; exponent rows/(columns−rows). Zero rows handled separately in the package. |
| `fieldOfFiniteDimensional` | `Mathlib/LinearAlgebra/FiniteDimensional/Basic.lean:521` | Field base, commutative domain algebra, finite dimension; no zero ring allowed. |
| `Stirling.factorial_isEquivalent_stirling` | `Mathlib/Analysis/SpecialFunctions/Stirling.lean:246` | Supplies factorial asymptotic; d/(d!)^(1/d)→e is the derived use, not the literal declaration. |
| `Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le` | `Mathlib/Analysis/Complex/Liouville.lean:42` | Complete target, positive radius, DiffContOnCl; derivative bound n!C/Rⁿ. |
| `AnalyticOnNhd.circleAverage_log_norm` | `Mathlib/Analysis/Complex/JensenFormula.lean:375` | Nonzero radius and nonzero central value; factoring the zero order is necessary. |
| `Real.circleAverage` | `Mathlib/MeasureTheory/Integral/CircleAverage.lean:55` | `(2π)⁻¹` times the angular integral; definition alone asserts no integrability. |
| `ValueDistribution.proximity`, `ValueDistribution.proximity_top` | `Mathlib/Analysis/Complex/ValueDistribution/Proximity/Basic.lean:49`, line 76 | Existing positive-log circle mean. The package's simple unit-radius specialization is permitted for its headline signatures, not a second general Nevanlinna theory. |
| `Matrix.det_vandermonde` | `Mathlib/LinearAlgebra/Vandermonde.lean:219` | Product uses v_j−v_i. Equality-case norm theorem is additional content. |
| `InnerProductSpace.gramSchmidtOrthonormalBasis_det` | `Mathlib/Analysis/InnerProductSpace/GramSchmidtOrtho.lean:374` | Supplies determinant factors in a full finite-dimensional orthonormal basis, used for equality analysis. |
| `eVariationOn`, `LipschitzWith.comp_boundedVariationOn` | `Mathlib/Topology/EMetricSpace/BoundedVariation.lean:60`, line 1256 | Finite monotone partition sums; no continuity in the definition. Composition requires finite variation. |
| `isCompact_setOfPred_finiteMeasure_le_of_isCompact` | `Mathlib/MeasureTheory/Measure/Prokhorov.lean:183` | Surrounding line 65 includes Hausdorff and Borel hypotheses; bounded mass and compact support. |
| `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto` | `Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean:365` | Bounded continuous real test functions, not arbitrary discontinuous arc indicators. |
| `MeasureTheory.ProbabilityMeasure.continuous_prod` | `Mathlib/MeasureTheory/Measure/FiniteMeasureProd.lean:144` | Second countability, pseudometrizability and measurable opens; satisfied by the circle. |
| `MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto` | `Mathlib/MeasureTheory/Measure/Portmanteau.lean:353` | Null frontier, measurable opens, outer approximation by closed sets. |
| `MeasureTheory.instMetrizableSpaceProbabilityMeasure` | `Mathlib/MeasureTheory/Measure/LevyProkhorovMetric.lean:695` | Separable pseudometrizable Borel space; supplies the sequential compactness route on the circle. |
| `TauCeti.Probability.empiricalMeasureOfFintype`, `TauCeti.Probability.integral_empiricalMeasureOfFintype` | `TauCeti/Probability/Process/EmpiricalMeasure.lean:54`, line 100 | Fintype and Nonempty at line 49; strongly measurable integrand and complete real normed target for the integral. |
| `DifferentiableOn.torusIntegral_prod_sub_inv_smul` | `TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean:116` | Closed-polydisc differentiability, an interior point and complete target; factor `(2πi)^n`. For z₁z₂ the normalized coefficient is 1. |

Object searches included formal substitution/inversion, algebraic-series denominators, D-finiteness and full meromorphic bases, positive logarithmic means, variation, empirical probabilities, Vandermonde determinants/equality, logarithmic energy/equilibrium and finite-dimensional scalar spans. No pinned implementation of the package's arithmetic mean-rank theorem, Eisenstein series-denominator theorem, holonomic arithmetic ring or discrepancy gap was found. Searches for Eisenstein also return modular Eisenstein series, which are different objects. Searches for “finite” were refined to avoid counting unrelated finite-module declarations.

### Ownership, suppliers and order

The board package index was read first. All 20 listed heads were searched by object: five had package READMEs, and fifteen were design-only at those heads and were searched through their design READMEs after the package paths returned 404. None contained these owned constructions. The open-roadmap tool was used for object searches and for the three relevant new supplier roadmaps below. Existing main-branch roadmaps were checked on main, not replaced by revisions in open work. An exact-name search found no main/open `Suggested.lean` declaring any of this package's seven theorem names or its fully qualified namespace.

| Supplier | Resolved text | Contract assessment and witness |
|---|---|---|
| DiophantineApproximationAndTranscendence | `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:2928`, §5.1; §§0.2–0.3,2.8,5.2–5.3 also inspected for ownership | D-finiteness, closure, initial values remain there. Ordinary x² jet is (0,0,2). Descent attribution needs R02; the arithmetic restriction is new here. |
| ConformalMappingPartII | Open-head `TauCetiRoadmap/ConformalMappingPartII/README.md:137`, §§0.1–0.6; line 289, §§1.3–1.4; line 555, §§3.5–3.7 | Full meromorphic bases, rational pole clearing, radius and quotient representation exist at those locators. x⁻¹ has pole order 1; exp(1/x) fails; disk radius 2 gives derivative 2 for the cover and 1/2 in the reverse direction; phase of i is i. |
| ProbabilisticAndMetricNumberTheory | Open-head `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:3086`, §2.7 | Strict-cut star discrepancy, guarded empty sample, Koksma with actual jump values, Erdős–Turán constant 3. Singleton 1/2 has star value 1/2, all-cut value 1. Circular adapters are distinct local targets. |
| GeometryOfNumbersAndQuadraticArithmetic | Open-head `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:238`, §0.1, numbered 0.1.1–0.1.2 | General Hadamard is imported, not reconstructed. Diagonal columns (2,0),(0,3) give determinant/product 6; (1,0),(1,1) give 1<√2. Regular-polygon equality is the new variant here. |
| ClassicalArithmeticCompletion | Main `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:12458`, §6.18; line 12493, §6.19; line 13054, §6.40 | Finite diameters, Chebyshev comparison, affine covariance, disc/segment values are present: δ₂(radius-2 disc)=4, limiting capacity=2, capacity([0,1])=1/4. General measure-energy construction and positive-capacity uniqueness are not supplied by those sections today. |

The named `complex-logarithmic-equilibrium` gap appears with the same slug and needs in plan lines 2031–2034 and README line 67. It specifies a coherent general energy interface and its necessary normalization/API, not unrelated missing inputs. Nonempty compact support, diagonal +∞, positive capacity for uniqueness and positive radius/nonzero affine slope are explicit. It does not request another construction of finite Fekete diameters or Chebyshev norms. Its absence from the supplier is therefore a declared contract, not a finding. The circle specialization in §3.7 consumes that contract; the genuinely new theorem is the uniform discrepancy gap in §3.8. Conditional acceptance would require this gap once R01 is resolved. No `conditional_gaps` field is emitted for a needs-changes verdict.

Every `Needs` edge is backward within the package: §0.4 precedes §0.5; auxiliary construction precedes all analytic arguments; §2.5 uses §2.4 rather than §2.1's analytic proof; §§3.7–3.9 lead to §3.10 without using the target mean bound; §§4.5–4.7 follow pole clearing; Layer 5 uses Layer 4. The nonempty auxiliary family requirement does not leak into the empty-family Lean rank statement. No move of ownership to a later roadmap is required.

The requested mechanical dependency command completed with exit status 0 and this output:

```text
depcheck: 49 roadmaps, 558 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This does not resolve G1: it has no supplier edge for the tool to validate.

### Headline coverage, Lean elaboration and padding

The README's seven statable headline families are Eisenstein denominators (§0.4), multiplier rank (§1.5), integrated rank (§2.1), arithmetic algebraicity (§2.2), André algebraicity (§2.3), Fekete equality (§3.6), and the Vandermonde discrepancy gap (§3.8). All seven are stated with `sorry`. The four remaining headline families are the W rank theorem (§4.5), fields/scalar-span comparison (§4.6), integral-coordinate holonomic finiteness (§4.7), and centred-capacity rank (§5.1). Each is named in the module docstring, with the missing differential-equation/full-meromorphic-basis/arithmetic-ring or capacity/equilibrium interface identified. The auxiliary and local coefficient estimates are supporting targets for these headlines. The two source counterexamples remain README Checks and computations, not acceptance-test padding.

`lake env lean` was run on the absolute pathname of `packages/DiophantineApproximationAndTranscendencePartII/Suggested.lean` from the pinned content checkout. It exited 0 with exactly seven warnings, all “declaration uses `sorry`”, at lines 48,68,91,111,129,151,163. There is exactly one import, `import Mathlib`; no Tau Ceti object-file build was needed. The file has 170 lines, six real-bodied definitions and seven theorems.

I generated a scratch copy with `#check @name` for every declaration and elaborated it separately. All 13 checks succeeded. The six definition types and seven theorem types match their README statements; no section binder was dropped. Explicit theorem binders retain nonconstant p, Laurent equality fixing pSeries, χ₀=0, χ₁=1, integral pullbacks, the relevant closed/open-disc analytic hypotheses, φ(0)=0, strict derivative expansion, actual germ realizations, ℚ(p)-independence, and h(0)=1 where needed. The denominator theorem has algebraicity over `RatFunc (AlgebraicClosure ℚ)`; Fekete has d>0; the discrepancy gap has ε>0, ε≤1 and a uniform d₀ before quantification over tuples.

A second scratch copy replaced each of the seven `sorry`s by alternatives that try to close the declaration using one `simp`, one `rfl`, or one `infer_instance`. All seven failed to close; the final alternative reported “type class instance expected” on each non-class theorem goal. Inspection of the pinned declarations also found no exact single library lemma with the omitted arithmetic or equality-case content. In particular, clearing one algebraic scalar is not uniform Eisenstein denominators; determinant expansion is not Fekete equality; the three algebraicity/rank theorems require the stated arithmetic constructions. No padding deletion is recommended.

Only this report and `review.json` were created in the package. README, Suggested.lean, metadata, sources and the design files were left unchanged.

## Not verifiable

- Ownership against unprovided open-head contents was not certified. The global index surfaced RandomMatrices Milestone 9 as a logarithmic-energy lead, but that roadmap is not among the open-head files authorized by this brief; I did not inspect its contents or claim that it supplies general compact-plane equilibrium theory. No result from it is used as a supplier here. For the authorized main, supplied relevant open heads and indexed board heads, the ownership checks above were completed.
- A valid theorem for G1's unrestricted compact generalization is not specified by the package. Its truth and complete proof route therefore cannot be verified; R01 records the ownership/scope action required. This is not an unread-source problem.

## Source issues

- **Error** in CDT25 at Corollary 2.0.5, equation (2.0.7), p.636 (CDT25 line 492): the source says the ℚ(x)-span has the same ℚ(p)-rank bound as the arithmetic generator span; it should be the W bound, with the extension-degree factor for V unless χ is integral; affects a stated result.
- **Error** in CDT25 at §2.5.27, equation (2.5.28), p.649 (CDT25 line 1364): the source says arbitrary compact sampling sets give the displayed capacity rank bound; it should be restricted to supported base-point geometry, including the centred cases; affects a stated result.
- **Misprint** in CDT25 at equation (2.5.2), p.644 (CDT25 line 1048): the source says the reversed-difference product equals the displayed Vandermonde determinant; it should be multiplied by (−1)^(d(d−1)/2); affects nothing.
- **Misprint** in CDT25 at equation (2.3.2), p.640 (CDT25 line 758): the source says boundary log-moduli reconstruct the complex function without a phase; it should be multiplied by G(0)/∣G(0)∣, as the constant G=i demonstrates; affects the proof.
- **Misprint** in CDT25 at proof of Lemma 2.3.1, p.641 (CDT25 line 820): the source says the supremum of ∣h∣ is bounded by the positive-log mean; it should be the supremum of log∣h∣, since g=h=1 gives 1≤0 otherwise; affects the proof.
- **Error** in CDT25 at proof of Lemma 2.5.9, p.646 (CDT25 line 1190): the source says every compact set has a unique energy-minimizing probability; it should be nonempty compact sets for existence and positive capacity for uniqueness; affects nothing.
- **Error** in CDT25 at Lemma 2.1.2, pp.637–638 (CDT25 line 546): the source says the height constant is uniform in κ for every fixed positive dimension; it should be a cofinal dimension range depending on κ, sufficient for the later limit; affects a stated result.
- **Misprint** in BB11 at §1, p.1 (BB11 line 40): the source says the tail series uses exponents N−k for k≥N; it should be exponents k−N, yielding a power series rather than unbounded negative powers; affects nothing.

For the auxiliary-uniformity source error, take d=m=1, p=x+2, f₁=1, χ=t and φ=2z. Writing F=P(p), order at least α at x=0 forces P(T)=(T−2)^α Q(T) with nonzero Q∈ℤ[T]. If bTʲ is Q's lowest nonzero term, P's coefficient of Tʲ is (−2)^α b, of magnitude at least 2^α. Thus height/α≥log 2 for every α, incompatible with κC for arbitrarily small κ and a fixed C. The package's cofinal-d restriction does not make that false assertion.

For the compact-uniqueness source error, K={0,1} has capacity zero and every probability on it has infinite energy. The two distinct point masses both minimize. The package retains the positive-capacity hypothesis and uses only the unit circle in that proof. No published correction is claimed for any source issue listed here.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b3143734368b753732706fbc29864c0ffe969083", "job": "REV-PKG-DiophantineApproximationAndTranscendencePartII", "model": "gpt-6-astra", "worker": "chris-7"} -->
