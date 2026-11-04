# Review of ModularForms (pull request #1706 at 852d48b)
**Verdict:** needs changes

The head under review is the head the previous review read (852d48b): the folder has no changed lines since that review, so none of its six findings is repaired. Each was re-verified independently below rather than carried over, and the whole roadmap was reviewed again; the sampled targets, the headline theorems and the worked examples were recomputed.

## R01 (P1) — The §8.0 analytic comparison still has no owned proof inputs

**Location:** `TauCetiRoadmap/ModularForms/README.md:603–612` ("Prove the characteristic-zero comparison: over ℂ, evaluation on E_z … gives linear isomorphisms from M_k^arith(N,ℂ) and S_k^arith(N,ℂ) to the native analytic modular and cusp spaces on Γ₁(N)") and its `*Needs:*` line at 644–647. Unrepaired since the previous review (its R01); the head is unchanged.

**Claim:** The comparison, hence `rationalCuspFormSpan` at k = 1, the weight-one lattice of §8.1, `weightOneCoefficientField`, `weightOneCoefficientIntegral` and the weight-one case of `existsUniqueGaloisConjugate`, are proved from ModularCurves Layers 1–5 and §§9A–9B plus Mathlib carriers.

**Witness:** The map arithmetic → analytic and its injectivity are fine, and the field-base-change bullet is provable for N ≥ 4 from the affine fine curve of ModularCurves §5A (sections of a coherent sheaf on an affine scheme commute with field extension, and the cusp conditions are K-linear conditions on Tate expansions). Surjectivity onto the analytic space is not: an analytic form on Γ₁(N) becomes a rule on ℂ-algebras only through (i) the uniformisation of Y₁(N)(ℂ) by Γ₁(N)\ℍ as a Riemann surface with ω trivialised by dz, and (ii) algebraicity of a holomorphic section of ω^k extending over the cusps of X₁(N)^an (GAGA on a compact curve, or the equality of the meromorphic and rational function fields). Deligne–Serre state the identification without proof and defer exactly this to Deligne–Rapoport VII §4 (deligne-serre lines 176–177 and 194–195), and prove (2.6.1) through sections on the algebraic stack (lines 200–201). Nothing cited provides (i) or (ii): ModularCurves on main lists complex uniformisation among what it does not include (its README lines 44–46) and records that no roadmap owns the scheme–analytic comparison (lines 1407–1410); the two roadmaps that plan it, ComplexComparisonPartII (merge order line 39) and AlgebraicModularFormsAndSerreWeights §1.5 (merge order line 85, "All-weight analytic comparison" via ComplexComparisonPartII GAGA), are later than this on-main roadmap and cannot be cited. Instance: for f = η(z)η(23z) ∈ S₁(Γ₁(23)) and σ ∈ Aut(ℂ), the roadmap has no owned statement that σ(f) is again a cusp form; the Δ-trick of §8.1 bounds denominators only of a form already known to be rational (deligne-serre lines 221–224).

**Repair:** Either own the inputs or defer the statements. (a) Own: add to §8.0 named targets with sources and Needs for the analytic uniformisation of Y₁(N)(ℂ) with its universal family and level structure, the universal property over ℂ-algebras (ModularCurves §5A for N ≥ 4; the rigidifying-cover descent of its §4C for N ≤ 3), and the extension of ω^k over the cusps with algebraicity of its holomorphic sections on X₁(N), and state in Scope that this roadmap now owns this scheme–analytic comparison so that ModularCurves' remark is superseded. (b) Defer: prove `rationalCuspFormSpan` and `existsUniqueGaloisConjugate` for k ≥ 2 by the Hecke-pairing route (the pinned `TauCeti.isIntegral_heckeTCuspNat`, `ModularForms/HeckeSlash/Finite.lean:154`, k ≥ 2, and the perfect pairing ⟨T, f⟩ = a₁(Tf)), restrict those two headlines to `2 ≤ k`, and move §8.0 with the two weight-one headlines to a Part II that consumes AlgebraicModularFormsAndSerreWeights §1.5. Under (a) the instance is covered by algebraicity applied to σ(f)'s expansion; under (b) it is outside the stated range.

## R02 (P3) — The Tate curve is planned again

**Location:** `TauCetiRoadmap/ModularForms/README.md:594–596` ("Construct the formal Tate evaluation for these rules: the Tate curve over K((q)), its canonical embedding μ_N↪Tate(q) and differential dt/t"). Unrepaired (previous R02).

**Claim:** The Tate curve over K((q)) is a target of §8.0.

**Witness:** ModularCurves on main, Layer 10 item 2 (README lines 2243–2247), builds "the groups T[N] and the Tate curve over ℤ[1/N]((q)) with its subgroup schemes" as its own milestone.

**Repair:** Cite ModularCurves Layer 10 for the Tate curve and base-change it to K((q)); keep here only the canonical μ_N-embedding for every N, dt/t and the evaluation of rules.

## R03 (P3) — The j-input ownership move is stated as a fact about FuchsianOrbifolds

**Location:** `TauCetiRoadmap/ModularForms/README.md:22–26` ("The normalized j-function inputs belong with its Layer 6 … it supplies no j-input module back to it"). Unrepaired (previous R03).

**Claim:** FuchsianOrbifolds Layer 6 owns j = E₄³/Δ, its invariance, expansion and elliptic orders.

**Witness:** FuchsianOrbifolds on main says the reverse: its ownership list (README lines 84–86) assigns "the normalized level-one j-function, modular invariance, q-expansion, and exact elliptic orders" to the modular-forms roadmap, and its Layer 6 (lines 344–345) "consumes the modular-forms roadmap's normalized j-function". NoncongruenceModularForms (open pull request) still cites "ModularForms `JInputs`".

**Repair:** Write the sentence as the move it is ("formerly a level-one input of this roadmap; FuchsianOrbifolds Layer 6 is to construct j from Mathlib's E₄, E₆ and Δ, and this roadmap consumes nothing of it"). The move is recorded below for the intake.

## R04 (P3) — The PolynomialGaloisGroups citation names a section that does not exist

**Location:** `TauCetiRoadmap/ModularForms/README.md:30–31` and `224–226` ("Layer 4, 'Group criteria that bypass resolvents'"). Unrepaired (previous R04).

**Claim:** The prime-degree-plus-transposition criterion is in PolynomialGaloisGroups Layer 4.

**Witness:** `Completed/PolynomialGaloisGroups/README.md` line 777 heads Layer 4 "resolvents"; the criterion is a bullet of Layer 1 at line 639, with *Needs:* Mathlib `Equiv.Perm.subgroup_eq_top_of_swap_mem`. The contract section "What this roadmap consumes from the Number Field Arithmetic roadmap" exists at line 122.

**Repair:** Cite "PolynomialGaloisGroups Layer 1, the recognition theorems" and the Mathlib declaration.

## R05 (P3) — A contracted declaration is cited under the wrong namespace

**Location:** `TauCetiRoadmap/ModularForms/README.md:168`. Unrepaired (previous R05).

**Claim:** The Fricke–Hecke relation is `HeckeRing.GL2.normalizedFrickeOperatorCusp_heckeTCuspNat_of_mem_cuspFormCharSpace`.

**Witness:** `TauCeti/NumberTheory/ModularForms/Fricke/Hecke.lean` opens `namespace TauCeti` at line 35 and declares the theorem at line 158; the `HeckeRing.GL2.` name does not exist at the pin (the only name of the 74 contracted declarations that fails to resolve).

**Repair:** Rename the citation to `TauCeti.normalizedFrickeOperatorCusp_heckeTCuspNat_of_mem_cuspFormCharSpace`.

## R06 (P3) — The level-Nm² twist theorem has no locator

**Location:** `TauCetiRoadmap/ModularForms/README.md:781–784` ("Prove modularity and cuspidality at level Nm² with nebentypus χψ² transported to that level"); `Suggested.lean:97–99`. Unrepaired (previous R06).

**Claim:** Atkin–Li Theorem 3.1 covers the headline.

**Witness:** Theorem 3.1 is cited for the primitive sharp level lcm(N, r·cond(χψ), r²); the Nm² statement for an arbitrary (imprimitive) character modulo m is a different theorem, proved by writing ψ(n) as a finite Fourier sum over additive characters modulo m and conjugating Γ₁(Nm²) into Γ₁(N) by (1, v/m; 0, 1).

**Repair:** Add the locator for the Nm² statement (Shimura, Proposition 3.64, or Miyake, Lemma 4.3.10(2)) in the README and in the docstring.

## Verified sound

**Repair status.** The folder is byte-identical to the head of the previous review (0 changed lines), so none of its findings R01–R06 is repaired; each is re-verified above with its witness re-read at the source, on main or at the pin.

**Gate and Lean.** Pins: Tau Ceti 358314d4, Mathlib f6090c70. The worker's gate is all zero (`set_option=0 … depcheck=0 … build=0 OK`). My rerun of the dependency check printed `depcheck: 204 roadmaps, 1682 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. `lake env lean TauCetiRoadmap/ModularForms/Suggested.lean` exits 0 with exactly ten `declaration uses sorry` warnings. One-tactic probe: a scratch copy with every `sorry` replaced by `simp` fails on all ten (seven "no progress", three unsolved goals), so nothing closes in one tactic; no declaration restates a definition, mirrors a Check or computes a value. The ten elaborated types were compared with the README statements: `crossLevelStrongMultiplicityOne` carries `1 ≤ k`, the finite set `S` and both `NeZero` instances explicitly; `modularFormAbscissaLeWeight` carries `0 < k`; `rationalCuspFormSpan` and `existsUniqueGaloisConjugate` carry `1 ≤ k`; `eichlerSelbergTrace` carries `4 ≤ k`, `Even k` and `NeZero n`; `newspaceDimension` and `existsCoefficientTwist` quantify over every integer weight as the README does. No binder was lost. Outside-folder diff is empty; `STATUS.md`, `PROGRESS.md` and `metadata.toml` are the generated files already on main. No `lemma`, `set_option`, LaTeX delimiter, process word or pull-request number in the folder.

**Supplier contracts at the pin.** All 74 backticked declaration names in `## Exact supplier contracts` were located in the pinned sources; 73 resolve, one does not (R05). Hypotheses read: `Newform` (`Newforms/Newform.lean:104`) extends `EigenformAwayFromLevel` with `isNew` and `isNorm`, so a newform is a nonzero good eigenform in `cuspFormsNew` with a₁ = 1 as Conventions say; `cuspFormsOld` (`Newforms/Basic.lean:105`) ranges over `d * M ∣ N ∧ M ≠ N`; `CoefficientField` (`Newforms/Fields.lean:48`) is an `IntermediateField ℚ ℂ`, and `numberField_CoefficientField` with `isIntegral_qExpansion_coeff` (`NumberField.lean:153–157`) carry `2 ≤ k`, so the weight-one headlines are genuine extensions; `isIntegral_heckeTCuspNat` (`HeckeSlash/Finite.lean:154`) has `2 ≤ k`; `satakeParameters` (`Satake.lean:91`) is the root multiset of X² − a_pX + χ(p)p^{k−1} with `dirichletLift` the zero extension (`Newform.lean:134`); `hurwitzClassNumber` (`HurwitzClassNumber.lean:84`) has H(0) = −1/12 and `_three`, `_four` give 1/3, 1/2; `frickeCompletedL_functional_equation` (`FunctionalEquation.lean:324`) needs cusp forms on both carriers, strict width one, 0 < k and g = (√N)^{2−k}·(f ∣[k] frickeGL N), giving Λ(k−s,f) = iᵏΛ(s,g); `sturm_bound_finiteIndex_SL2Z` (`SturmBound.lean:87`) uses the full `Γ.index` and `(k·index).toNat/12`, matching B in §9.3; `valence_formula_finiteIndex` (`Norm/Cusps.lean:468`) sums interior orders weighted by 2/|Stab_Γ P| and orders over `CuspTranslationOrbit` (orbits of T on SL₂(ℤ)/Γ, line 107), with mass k·[SL₂(ℤ):Γ]/12; `pLocalSubring` (`GLn/PrimeDecomposition.lean:178`) is the subring generated by the monotone diagonal p-power cosets and `heckeGen k` has k+1 entries equal to p (`PolynomialRing/Basic.lean:94`), as §2.1 says; `heckeTCompositeGamma0` (`Composite.lean:118`) is the ordered product of the prime-power recurrence terms; Mathlib `CuspFormClass.exists_sum_range_norm_sq_qExpansion_coeff_le_of_mem_strictPeriods` (`Bounds.lean:352`) has `k : ℕ`, `[Γ.IsArithmetic]`, `0 < h`, `h ∈ Γ.strictPeriods`; `ModularFormClass.qExpansion_isBigO` gives a_n = O(n^k), abscissa ≤ k+1, so `modularFormAbscissaLeWeight` is not a duplicate; `Polynomial.dickson` (`Dickson.lean:63`) has D₀ = 3 − k, D₁ = X, D_{m+2} = X·D_{m+1} − a·D_m, so `dickson 2 n (k−2)` is p_{k−2}(t,n) of Popa–Zagier.

**Cross-roadmap citations resolved.** FuchsianOrbifolds (main): Layers 0–6 exist; Layer 5 is degree, divisor pullback and topological Riemann–Hurwitz with no analytic Riemann–Roch (lines 80–83); the j direction is R03. ModularCurves (main): Layers 1–5 (headings at lines 445–1425), §§9A–9B (1808, 1880), §5A `Y₁(N)` for N ≥ 4 (1284), §4C rigidifiers (1100), Layer 10 Tate curve (R02), the unowned comparison (R01). PolynomialGaloisGroups (Completed): contract section at line 122; Layer-4 name drift (R04). AlgebraicModularFormsAndSerreWeights (open head, merge order 85): its §1.5 "All-weight analytic comparison" identifies stack sections of ω^k with analytic forms through ComplexComparisonPartII, and its §2.9 bounds denominators; it is later than this roadmap, so it is a consumer, and since a rule on elliptic families is a section on the stack, the two plans are one object whose earlier owner is this roadmap: the intake should have AlgebraicModularFormsAndSerreWeights consume §8.0 once R01 is settled. NoncongruenceModularForms (open) consumes Layer 1 and 10B as the Downstream section says; QSeriesPartitionsAndMockModularForms (open) declares `gap:vector-bundle-dolbeault` on Layer 10B (vector-bundle Dolbeault, duality and vanishing), which §10B does not supply (line bundles only): a consumer's declared contract, not a finding here. EllipticCurveModularityPartII (open) builds Martin's weight-two Γ₀(N) newspace expression consuming "ModularForms Layers 3 and 10": a specialisation, not a second owner of `newspaceDimension`. No open pull request declares any of the ten fully qualified names of `Suggested.lean`, and no other roadmap plans the level-one Eichler–Selberg formula (BianchiModularForms plans the Bianchi analogue). Ownership against open pull requests without files in the brief was not checked.

**Ownership move recorded.** The normalized j-function inputs move from ModularForms to FuchsianOrbifolds Layer 6; ModularForms consumes none of them (§10A uses only X(1) ≃ ℙ¹). FuchsianOrbifolds on main and NoncongruenceModularForms still cite ModularForms for them.

**Seeded source sample.** deligne-serre (Numdam, cache 65b390f6): §2.1 at lines 127–151 (rule on (E, α: μ_N ↪ E) valued in ω^k, holomorphy via generalized curves, the Laurent remark at 150–151, printed p. 510); (2.2.1) at 152–153; (2.4.1)–(2.4.2) at 171–174 with the division by (2πi du)^k; the unproved identification at 176–177; Tate curve and (2.5.1) at 178–188; the deferral to Deligne–Rapoport VII §4 at 194–195; (2.6.1) at 199 with the stack argument at 200–201 and the descent criterion at 202–205; Proposition 2.7 at 206–213 with proof at 214–220; Remark 2.8 at 221–224. stein (author page, b50e81d4): (5.3.1) with c₀ at 3809–3825 (printed p. 88), Theorem 5.8 at 3829–3833, Theorem 5.9 at 3834–3835. diamond-shurman-errata (author page, b3d2f00f): pp. 74–75 at 49–58 (period 2h at an irregular cusp independent of k; half-integral order exactly when the cusp is irregular and k odd), p. 81 at 59–66, p. 90 at 68. popa-zagier (arXiv 1711.00327v2, 56905e98): weights w(M) at 63–69, Theorem 1 at 72–75, H conventions with H(0) = −1/12 and H(−u²) = −u/2 at 100–104, Proposition 2 at 197–210, Proposition 3 at 213–215, p_w definition at 225–227, Corollary 1 at 228–232, equation (4) at 235–240, tr M − tr S = σ_{k−1}(n) at 243. rhodes-shemanske (author manuscript, da2a014e): Lemma 3.1 at 333, Proposition 3.2 at 364–366, §3.2 at 380–402, Lemma 3.3 at 410–411. leanbridge (GitHub raw, d441dd13): namespace at 32, quintic at 39–45, theorem with hypotheses on coefficients 0–5 at 701–708.

**Adversarial pass.** Values computed on each side; "retain" means the instance agrees with the statement as written.

| Statement | Instances | Values on the two sides | Result; change |
|---|---|---|---|
| Conventions: Hecke recurrence | Δ, p = 2, 3 | a₂a₃ = (−24)(252) = −6048 = a₆; a₂² − 2¹¹ = 576 − 2048 = −1472 = a₄ | retain |
| Conventions: bad prime | η²η(11z)², p = 11 | a₁₂₁ = a₁₁² − χ(11)·11 = 1 − 0 = 1; a unit value at 11 gives 1 − 11 = −10 | retain |
| Conventions: FE sign | k = 2, w₁₁ = −1; Δ | i²·(−1) = 1; i¹²·1 = 1 | retain |
| 0.1 constant terms | χ odd mod 3, k = 1 | B_{1,χ} = (1/3 − 1/2) − (2/3 − 1/2) = −1/3; D–S normalisation a₀ = δ(ψ)L(0,φ)/2 + δ(φ)L(0,ψ)/2 = 1/6 in both orderings; Stein c₀ = 0 for (χ,1) | retain; source issue |
| 0.1 weight two | ψ = 1 | a₀ = L(−1,φ)/2 = −B_{2,φ}/4; general k: −B_{k,φ}/(2k) = Stein's c₀ | retain |
| 0.1 corrected E₂ | t = 2 | (1 − 24q − 72q²) − 2(1 − 24q²) = −1 − 24q − 24q² | retain |
| 0.1 E₄ | k = 4 | −B₄/8 = 1/240; 240·(1/240) = 1 | retain |
| 1.1 δ and the native cusp term | Γ₁(5), Δ; level one | geometric widths 1,1,5,5 sum 12 = projective index, Σ ord = 12 = 12·12/12; native `CuspTranslationOrbit` counts each regular cusp twice (cosets γ, −γ) when −I ∉ Γ, mass 24 = 12·24/12; dividing by δ = 2 recovers 12; Δ at level one δ = 1, ord = 1 = 12/12 | retain |
| 1.1 irregular order | exponents 1, 3 in q_{2h} | orders 1/2, 3/2; product exponent 4, order 2 = 1/2 + 3/2 | retain (errata 49–58) |
| 1.1 Eisenstein masses | E₄, E₆ | zeros at ρ (e = 3) and i (e = 2): 1/3 = 4/12, 1/2 = 6/12 | retain |
| 2.1 generators | heckeGen k | k+1 entries p (`heckeGenExponent`): one, …, n entries | retain |
| 2.1 rank two | p = 2 | T(1,2)² = T(1,4) + 3·T(2,2); leading coefficient 1 | retain |
| 2.2 degrees | diag(1,p), pI | p + 1 = 3 at p = 2; 1; (pI)(p⁻¹I) = 1 after localisation (R–S 364–366) | retain |
| 3.1 oldspace | N = 11, 22, k = 2 | 11: S₂(1) = 0, old 0, new 1; 22: f, f(2z) leading q, q², old 2, new 0 | retain (M ≠ N) |
| 4.1 primitive associate | Δ(z) + cΔ(2z) | a₁ = 1 ∀c, a₂ = −24 + c; associate Δ, conductor 1 | retain |
| 5.1 controls | Δ at level 2; 2Δ; f = g = Δ, S = {2,3} | not in `cuspFormsNew 2 12`; a₁ = 2 ≠ 1; N = M = 1, χ = 1, equal | retain |
| 6.1 commutation scalar | χ mod 5, χ(2) = i, E₃^{1,χ} | a₂ = 1 + 4i; companion a₂ = 4 − i; χ(2)⁻¹(1 + 4i) = (−i)(1 + 4i) = 4 − i, so 𝒲T₂f = χ(2)T₂𝒲f | retain; pinned relation has χ(n) |
| 6.1 exact divisors | N = 12 | {1,3,4,12}; gcd(2,6) = 2 excludes 2 | retain |
| 7.1 Eisenstein pole | E₄ | 240ζ(s)ζ(s−3), abscissa 4 = k, pole at 4 | retain (≤, not entire) |
| 7.1 weight one | mean square O(X) | dyadic Cauchy–Schwarz X^{1/2}·O(X^{1/2}) = O(X); Σ X^{1−σ} converges iff σ > 1; Hecke alone gives k/2 + 1 = 3/2 | retain; Needs lists the Mathlib bound |
| 8.0 normalisation | Δ, dt/t = 2πi du | both give q − 24q²; omitting 2πi scales by (2πi)¹² | retain |
| 8.0 descent | √2Δ over ℚ(√2); Δ/11 | a₁ = √2 ∉ ℚ; a₁ = 1/11 ∈ ℚ (D–S 202–205) | retain |
| 8.0 base change | N ≥ 4, K ⊂ K′ | affine fine Y₁(N): H⁰ commutes with ⊗_K K′; cusp conditions K-linear | provable from Needs |
| 8.0 surjectivity | f = η(z)η(23z), σ ∈ Aut(ℂ) | σ(f) a cusp form only through uniformisation + GAGA; neither owned | R01 |
| 8.1 bounded denominators | Δ/11; fΔ | 11·(Δ/11) has a₁ = 1; (q − q² − q³)(q − 24q²) = q² − 25q³ + …; Δ⁻¹ recovers (1, −1) | retain |
| 8.1 Uₚ-stability | p ∣ N | (Uₚf)∣R_d = Uₚ(f∣R_d) has coefficients a_{pn}(f∣R_d) ∈ ℤ; rational expansion ⇒ rational form by the descent criterion | retain |
| 8.1 lattice rank | N = 1; rank r, denominator D | S₁ = 0, rank 0; Db₁,…,Db_r span dimension r | retain |
| 8.2 norm factors | K = ℚ(√2), a = √2; a = 1 | X² − 2; (X − 1)² | retain |
| 9.1 Satake | Δ, p = 2; level 11, p = 11 | X² + 24X + 2048, sum −24, product 2048; {1, 0}, product 0 | retain |
| 9.1 angle | a_p = 0, k = 1; 2; 3 | ±i, θ = π/2; double root 1, θ = 0; 3 > 2 no angle | retain |
| 9.2 twist level | ψ mod m arbitrary | ψ(n) = Σ_v c_v e(nv/m); (1,v/m;0,1)⁻¹Γ₁(Nm²)(1,v/m;0,1) ⊂ Γ₁(N); cusp forms preserved | true; locator R06 |
| 9.2 depletion | Δ, trivial ψ mod 2 | (a₁,a₂) = (1,0), level 4; (1 − V₂U₂)(q − 24q² + 252q³) = q + 252q³, idempotent | retain |
| 9.3 Sturm length | Γ₁(13), k = 2; N = 3, k = 1 | B = ⌊2·168/12⌋ = 28 (full index, as the pinned theorem); B = 0 and S₁(Γ₁(3)) = 0 | retain |
| 9.3 separation | O ≠ O′ with equal vectors | Tr_O − Tr_{O′} ∈ S_k(Γ₁(N)) nonzero by independence of distinct newforms, vanishes to order > B: contradiction | retain |
| 9.3 trace vector, letters | a₂ = √2; positions 25, 26 | (2, 0) vs (1, √2); z, ba | retain |
| 10A genus | Γ₀(11), Γ₀(2), Γ₁(13), level 1 | 1 + 1 − 1 = 1; 1 + 1/4 − 1/4 − 1 = 0; 1 + 84/12 − 12/2 = 2 (168 gives 9); 1 + 1/12 − 1/4 − 1/3 − 1/2 = 0 | retain |
| 10A Γ₁(22) | index, cusps | 484·(3/4)(120/121) = 360, projective 180; cusps (1/2)Σφ(d)φ(22/d) = 20; g = 1 + 15 − 10 = 6 | retain |
| 10B Riemann–Roch | ℙ¹: 𝒪(−2), 𝒪(−1), 𝒪; genus 1: 𝒪 | χ = −1, 0, 1 = deg + 1; (1,1), χ = 0 | retain |
| 10B Riemann–Hurwitz | id, z ↦ z², genus-1 double cover | −2 = −2 + 0; −2 = −4 + 2; 0 = −4 + 4 | retain |
| 10C even weight | level 1 k = 12; Γ₀(11) k = 2 | M: −11 + 3 + 4 + 6 = 2, S: 1; M₂ = 2, S₂ = 1 | retain |
| 10C odd weight | Γ(3): g = 0, ε₃ = 0, 4 regular cusps | k = 3: M = −2 + 6 = 4, S = −2 + 2 = 0; k = 1: 4 > −2 so S₁ = 0, M₁ = 2; agrees with dim M_k(Γ(3)) = k + 1 | retain |
| 10C β = μ∗μ | p, p², p³; 6, 12 | 1, −2, 1, 0; β(6) = 4, β(12) = −2; (β∗σ₀)(n) = 0 at n = 2, 4, 8, 16, 6, 12 | retain |
| 10C newspace identity | Γ₀(22); Γ₁(22); Γ₁(13); N = 1 | 2 − 2 − 0 + 0 = 0; 6 − 2·1 − 0 = 4; 2 − 0 = 2; β(1)·dim S_k with `cuspFormsOld 1 k = ⊥` | retain |
| 11.1 P_k | k = 12, n = 1 | p₁₀(0,1) = −1, p₁₀(±1,1) = −1, p₁₀(±2,1) = 11 = (k−1)·1^{k−2} | retain |
| 11.1 class sums | (k,n) = (4,1), (12,1) | −1 and −1/2 − 2/3 − 11/6 = −3; traces 0, 1 | retain |
| 11.1 formula vs τ | k = 12, n = 1…5 | 1, −24, 252, −1472, 4830 = τ(n) | retain |
| 11.1 formula, other weights | k = 16, 24, 60 | (dim, tr T₂) = (1, 216), (2, 1080), (5, −449691864); the last equals minus the X⁴ coefficient of the weight-60 polynomial | retain |
| 11.1 composite vs single coset | k = 12, n = 4 | −1472 = −2496 + 1024, 1024 = 2^{k−2} | retain |
| 11.1 k = 2 exclusion | k = 2, n = 1, 2 | formula gives −1, −3 vs 0, 0 | retain k ≥ 4 |
| Worked example mod 17 | quintic | roots 6 (×2), 10 (×2), 9; gcd(F, F′) = X² + X + 9 | README correct |
| Worked example mod 37 | quintic | roots 16, 22, 23; cofactor X² + 30X + 34; gcd(F,F′) = 1; disc 24, 24¹⁸ ≡ 36 ≡ −1 | README correct |
| Worked example mod 83 | quintic | gcd(X⁸³ − X, F) = gcd(X^{83²} − X, F) = 1: irreducible; gcd(F,F′) = 1 | README correct |
| Worked example weight 60 | dim | 60/12 = 5 = T₁ trace | retain |
| Worked example eta | η(z)η(11z); η(z)η(23z) | 1 + 11 = 12 ≢ 0 (24); 1 + 23 = 24 | retain |
| `existsCoefficientTwist` | m = 1; n = 0 | ψ(0) = 1 and a₀(f) = 0; m > 1: ψ(0) = 0 | retain |
| `crossLevelStrongMultiplicityOne` | k ≤ 0 | no `Newform N k` exists; `1 ≤ k` harmless | retain |
| `existsUniqueGaloisConjugate` | Δ, σ = id | g = Δ, unique by `Newform.ext` on the cusp form | retain |
| `newspaceDimension` | k ≤ 0 | both sides 0 | retain |

**Checks count.** Every subsection with a definition has at least three discriminating Checks (0.1: 5; 1.1: 4; 2.1: 4; 2.2: 3; 3.1: 3; 4.1: 3; 5.1: 3; 6.1: 4; 7.1: 4; 8.0: 7; 8.1: 5; 8.2: 4; 9.1: 7; 9.2: 4; 9.3: 7; 10A: 4; 10B: 4 + 4 + 3; 10C: 3 + 4 + 4; 11.1: 7).

## Not verifiable

- Diamond–Shurman (Propositions 5.9.1, 5.8.4, Theorems 3.5.1, 3.6.1, 5.8.3, §§3.2–3.9, 4.5–4.8, 5.2, 6.5), Miyake (Theorem 4.6.19, Corollary 4.6.20, Lemma 4.3.10), Shimura (Theorem 3.20, Proposition 3.64), Atkin–Li (Theorem 3.1; the sources service resolves DOI 10.1007/BF01390245 only to a paywalled page), Forster (§§12–19) and Sturm (LNM 1240): paywalled or no legal copy; theorem numbers taken on the roadmap's word, every statement attributed to them checked mathematically in the table.
- Deligne–Rapoport VII §4 was not fetched; R01 rests on the Deligne–Serre text and on ModularCurves' own statement.
- The LMFDB character-orbit and trace-vector ordering was not compared with §9.3's convention; the README disclaims agreement.
- Open pull requests the brief names without files were not searched for ownership.

## Source issues

- **Error** in stein at §5.3, display (5.3.1) with Theorem 5.8, printed p.88: the source gives the weight-one constant term as zero whenever the first character is nontrivial; it should be minus one half of the first generalized Bernoulli number of the first character when the second character is trivial, by the symmetry of the weight-one coefficients; affects a stated result (weight one only).
- **Misprint** in rhodes-shemanske at Lemma 3.1, proof, printed p.9: the source calls the map of a group into a coset space a homomorphism with a kernel; it should be a map of sets whose fibre over the identity coset is the stated subgroup; affects nothing.
