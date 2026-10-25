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
