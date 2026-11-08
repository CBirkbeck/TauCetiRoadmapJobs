# Review of ModularForms (pull request #1706 at 3453d2b)
**Verdict:** needs changes

This is an incremental re-review of the 114 lines changed since a24d49a, all in `TauCetiRoadmap/ModularForms/README.md`. The changed passages are:
- Scope (lines 25–36);
- three supplier-contract additions (lines 125–129, 197–201, 249–252);
- the earlier-label table (lines 321–340);
- §0.2, with the reciprocity law, the Kronecker form, the rewritten criterion and cusp-order paragraph, four new Checks, the split *Needs:* line and the Dependencies sentence (lines 402–487);
- Downstream consumers (lines 1500–1502);
- References (lines 1548–1558).

`Suggested.lean` is byte-identical to a24d49a.

## R01 (P3) — The new §0.2 routes use inputs that no contract or *Needs:* item names

**Location.** `TauCetiRoadmap/ModularForms/README.md`:
- 406–407: "apply the residue theorem to cot(πz)cot(πhz)cot(πcz) on a period strip".
- 472: "for the reciprocity law, the Dedekind sum and the residue theorem".
- 486–487: "Only the analytic, character, Eisenstein, eta, Kronecker-symbol and Jacobi-reciprocity supplier contracts enter this layer."
- 418–420: the Kronecker-form route uses "ε(γTⁿ)=e(n/24)ε(γ) by the translation law, the inversion law relates ε(γS) to ε(γ)".

**Claim.** There are two gaps.
- **The residue theorem has no supplier.** The pinned Mathlib has none: a grep of `Mathlib/Analysis` for a residue theorem finds nothing. Tau Ceti has one, but no contract names it. So the Dependencies sentence at 486–487 does not hold for the reciprocity route.
- **The Kronecker-form item is incomplete.** Its *Needs:* item (lines 472–474) lists `etaTransformation`, the reciprocity law, the Kronecker symbol and quadratic reciprocity. Its route also uses the translation and inversion laws, and the item does not list them.

**Witness.** `TauCeti.Contour.classicalResidueTheorem_starConvex` (`TauCeti/Analysis/Contour/StarConvex.lean:193`). For f holomorphic on Ω∖S and meromorphic at S, and a closed piecewise-C¹ curve in a star-convex open set Ω that avoids S, it gives ∫ f = 2πi Σ_s wind(s)·res_s f.

**Repair.**
- Add a Tau Ceti contract bullet: "`TauCeti.Contour.classicalResidueTheorem_starConvex` in `TauCeti/Analysis/Contour/StarConvex.lean`: the residue theorem for a closed piecewise-C¹ curve in a star-convex open set, used for the reciprocity law of §0.2." Give the full path, because the list's paths otherwise start at `TauCeti/NumberTheory/`.
- On line 472, name that declaration in place of "the residue theorem".
- In the Kronecker-form item, add "the translation and inversion laws".
- At line 486, add "residue-theorem" to the list of contracts.

**Test.** The declaration fits the route as stated. Take the boundary of a period rectangle with real part in [−ϵ, 1−ϵ] and imaginary part in [−T, T], and let Ω be a slightly larger open rectangle, which is convex. The integrand cot(πz)cot(πhz)cot(πcz) is meromorphic with poles in (1/h)ℤ ∪ (1/c)ℤ. Choose ϵ outside that set, so the boundary avoids S, which is then the finite set of poles inside.

## R02 (P3) — HalfIntegralWeightModularForms' consumption of this roadmap is listed incompletely

**Location.** `README.md`:
- 32–33: "It consumes Layers 0, 2–4, 7, 8 and 8G of this roadmap".
- 1500–1502: "… the cusp orders of eta quotients from §0.2, besides Layers 0, 2–4, 7, 8 and 8G."

**Claim.** Both lists read as exhaustive, and both omit Layers 1, 5 and 10, which that roadmap also consumes. This arose in the repair of the previous R02.

**Witness.** HalfIntegralWeightModularForms (#1721 at 1a78fdd):
- line 623, Layer 1 Dependencies: "ModularForms Layers 0, 1, 3 and 10";
- line 604: "modular-forms roadmap Layers 0 and 10";
- line 1246: "modular-forms roadmap Layers 4, 5";
- line 358: "ModularForms Layers 0–10".

**Repair.** In both places, write "Layers 0–5, 7, 8, 8G and 10". These are the layers its specific citations name (lines 97–104, 604, 623, 751, 1246, 1275, 1435). The direction argument at line 33 is unchanged by this.

## Previous findings

- R01 — repaired: "Prove the reciprocity law of Dedekind sums … (Apostol, Theorem 3.7). … Then prove the Kronecker form of the multiplier … Evaluate each ε(γ_δ) by the Kronecker form" (README.md:402–444); the *Needs:* line names both. The repair's route leaves the input gap in R01 above.
- R02 — repaired: "HalfIntegralWeightModularForms §3.3 (… reciprocity law and the Kronecker form) and §3.4 (the cusp orders …) plan the same objects … so it takes these from §0.2" (README.md:29–36), with a Downstream entry at 1500–1502. Its layer list is R02 above.
- R03 — repaired: the Layer 8 row (README.md:334) names `TauCeti.heckeTCuspAlgebra` with its finiteness and puts weight one in §8.1. New rows cover Layers 1, 5, 7, 9 and 11, and the contract is at 249–252.

## Verified sound

### Gate, dependency check and Lean

- **Gate.** My rerun at 3453d2b reports every check 0 and OK, with the same counters as the worker's run. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ModularForms'` is empty.
- **Dependency check.** The output is `depcheck: 239 roadmaps, 2428 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean TauCetiRoadmap/ModularForms/Suggested.lean` exits 0. The only warnings are the eleven `declaration uses sorry`, at lines 42, 57, 66, 79, 88, 95, 101, 108, 122, 134 and 145.
- **Signatures.** `git diff a24d49a HEAD -- Suggested.lean` is empty. `#check @etaTransformation` on a scratch copy prints the type in the worker's signatures file verbatim: binder γ only, no `variable` block, nothing lost.
- **Probe.** The one-tactic probe and the headline review of the previous reports stand.
- **Headlines.** The new §0.2 targets (reciprocity, Kronecker form) are supporting lemmas, not headlines in the Summary, so their absence from `Suggested.lean` is correct.

### Library declarations opened at the pins (12 new)

Mathlib:
- `jacobiSym.at_neg_one` (`JacobiSymbol.lean:311`): J(−1|b)=χ₄ b for odd b:ℕ.
- `jacobiSym.at_two` (`:321`): J(2|b)=χ₈ b for odd b:ℕ.
- `jacobiSym.quadratic_reciprocity` (`:423`): J(a|b)=(−1)^((a/2)(b/2))·J(b|a) for odd a, b:ℕ. This matches the contract's "odd positive denominators".
- No Dedekind sum in Mathlib or Tau Ceti (case-insensitive grep of both). The new sentence at line 125 holds.

Tau Ceti:
- `TauCeti.forall_heckeTCompositeGamma0_eq_coeff_smul_iff` (`HeckeSlash/Nebentypus/CoefficientCriterion.lean:112`). For F∈`modFormCharSpace k χ` with a₁=1, Tₙ F=aₙF for all n≠0 holds iff aₙ is multiplicative on coprime indices and satisfies the prime recurrence with `MulChar.ofUnitHom χ` (zero-extended). This matches the contract.
- `TauCeti.heckeTCuspAlgebra` (`HeckeSlash/Finite.lean:51`) is `Algebra.adjoin ℤ` of Tₙ for n:ℕ+, with no diamonds. `heckeTCuspAlgebra_finite` (`:122`) gives `Module.Finite ℤ` under `2 ≤ k`, through the period pairing. This matches the contract.
- Names behind the new label rows:
  - `valence_formula_weighted` (`LevelOne/ValenceFormula.lean`) and `valence_formula_finiteIndex` (`Norm/Cusps.lean`);
  - `HeckeRing.GL2.Newform.basis` (`Newforms/OrthogonalBasis.lean:256`) and `Newform.eq_of_forall_notMem_qExpansion_coeff_eq` (`Newforms/StrongMultiplicityOne.lean:184`);
  - `analyticRank` and `analyticConductorAt` (`Newforms/AnalyticInvariants.lean`), `L_eulerProduct_tprod` and `frickeCompletedL_functional_equation`;
  - `satakeParameters_eq_exp_satakeAngle`, `hurwitzClassNumber` and `LevelOne/TraceFormula/`.
- `TauCeti.Contour.classicalResidueTheorem_starConvex` (`Analysis/Contour/StarConvex.lean:193`, see R01).

### README sections the new rows point to

- §6.1 line 720: pseudo-eigenvalues.
- §8.1 lines 906–910: a finite integral algebra for all positive indices in weight one.
- §8.2 line 942: characteristic polynomials of Tₙ.

### Sources (seeded sample)

Of the fifteen sampled targets, only "0.2 The eta transformation and eta quotients" falls in the diff. The other fourteen are unchanged and stand as verified in earlier reports.
- **stromberg-maass lines 192–197.** Line 192 is Remark 2.5, and equation (2.5) is at lines 195–196. The even-c case has exponent ((a+d)c−bd(c²−1)+3d−3−3cd)/24, the odd-c case ((a+d)c−bd(c²−1)−3c)/24, with c>0 in both. This matches README 411–414. The symbol glyphs are illegible in the OCR, so the orientation, (d/c) for odd c and (c/d) for even c, was checked by computation (table rows N2–N4).
- **rouse-webb lines 96–103.** Ligozat's theorem: for positive c, d, N with d∣N and gcd(c,d)=1, any eta quotient has order (N/24)Σ gcd(d,δ)²r_δ/(gcd(d,N/d)dδ) at c/d. Lines 42–51 define an eta quotient of level N with r_δ∈ℤ and no other condition. This supports "for every exponent vector, whether or not k is an integer". The paper is published in Adv. Math. 272 (2015), as the README says.
- **Manifest.** Both texts are recorded as `certified`, and `apostol-mfds` (Theorems 3.1, 3.4, 3.7) as `uncertified`.

### Cross-roadmap citations resolved

HalfIntegralWeightModularForms, read in its sibling checkout at 1a78fdd:
- **Normalisation.** Its §3.3 (lines 942–990) and its Conventions (lines 276–282) use ν_η(γ)=η(γz)/((cz+d)^(1/2)η(z)) with the principal root and the same two closed forms. Its Dedekind-sum value is e((a+d)/(24c)−s(d,c)/2−1/8). This agrees with Scope line 32 and §0.2.
- **Ligozat orders.** Its §3.4 order formula is Ligozat's, in the same local parameter.
- **Ownership.** At that head it still declares `dedekindSum`, `dedekindSum_reciprocity`, `eta_smul_eq_dedekind`, `eta_smul_eq_of_odd` and `eta_smul_eq_of_even` as its own (`Suggested.lean:290–316`).
- **Direction.** It consumes this roadmap (lines 97–104, 358, 623), and this roadmap is on main. So ModularForms §0.2 is the earlier owner, and the remaining duplicate is #1721's to remove by citing §0.2. Nothing in this folder can repair it.
- **Names.** No fully qualified name collides: `etaTransformation` is declared only here.

EllipticCurveModularity and AlgebraicModularFormsAndSerreWeights:
- The citing lines from the previous R03 (#1018 lines 1095 and 1972; #928 lines 354–356) now resolve through the rows for Layers 5, 7 and 8.
- `overlaps.md`'s eight dropped anchors all have an old → new row.

### Adversarial table

Rows N1–N16 are new, for the changed statements. Rows marked (r6) are carried from PRREVIEW-ModularForms~6 for statements the diff leaves untouched, with the values recorded there.

| Statement | Instances | Values on the two sides | Result; change |
|---|---|---|---|
| N1. Reciprocity law (406) | all coprime 1≤h,c≤40 | 979 pairs, 0 failures | holds; retain |
| N2. Reciprocity, degenerate and negative control | (1,1); (2,4) | 0=3/12−1/4; for (2,4): s=0 on both sides, but the right side is 21/96−1/4=−1/32 | coprimality is needed and stated |
| N3. Kronecker form vs Dedekind value (411–414) | 1≤c≤30, \|d\|≤45 | 1671 matrices, 0 mismatches | retain |
| N4. Kronecker form vs η(γτ)/(√(cτ+d)η(τ)) | c≤12, \|d\|≤15, three a's, three τ | 2061 evaluations, 0 failures (product truncated adaptively in Im γτ) | retain |
| N5. Wrong models of the symbol | swap (d/c)↔(c/d) at (1 2; 3 7); (2/−1) | (7/3)=1 but (3/7)=−1: the swap gives −e(−1/24), while the true value is e(−1/24); (−2/−1)=−1 and (−2/1)=1, so the sign factor bites only for a negative numerator | text at 416–418 correct |
| N6. c=1 base case (421) | (a b; 1 d) | both forms give e((a+d)/24−1/8) | retain |
| N7. Check (14 3; 23 5) | symbol, s(5,23) | (5/23)=−1; s(5,23)=7/46; both forms e(−1/6); dropping the symbol gives e(1/3) | correct |
| N8. Check (1 0; 2 1), (−1 0; 2 −1) | even c | e(−1/12), e(−1/6); Dedekind exp(−πi/6), exp(−πi/3); numeric true values equal | correct |
| N9. Check, reciprocity at (2,3) and s(1,c) | (2,3); c<60 | −1/18=14/72−1/4; 7/36 without −1/4; s(1,c)=(c−1)(c−2)/(12c) for all c<60 | correct |
| N10. Check η(z)η(23z) | γ₂₃=(14 69; 1 5); d=1, 2 | det 1; e(−1/6)·e(2/3)=−1=(−23/5); (1 0; 23 1): e(−23/24)e(−1/24)=1; (12 1; 23 2): (2/23)=1 and exponent sum −33, so 1 | correct |
| N11. Criterion via Kronecker form (424–444) | N=2, 4, 8, 11, 12, 23; ten quotients, including k=1, 3, 7 with odd powers of even δ and negative exponents | f(γτ)(cτ+d)^(−k)=χ(d)f(τ), χ=((−1)^k/d)∏(δ/d)^(r_δ), over c∈Nℤ with \|c\|≤3N (including c=0, c<0, d<0), 62–118 matrices each: 0 failures | retain |
| N12. c≤0 reduction (437–439) | −I; c<0 | f\|(−I)=(−1)ᵏf; χ(−1)=sign((−1)ᵏm)=(−1)ᵏ since m>0; χ(−1)χ(−d)=χ(d) | correct |
| N13. Cusp orders for every exponent vector, unit q^(1/w) (430–433) | θ=η(2z)⁵/(η(z)²η(4z)²) at 1/2 and 0; η(2z)¹² at 1/2; N=6 (1,−1,2,1) k=3/2 at 1/2, 1/3; N=9 (3,−1,1) at 1/3; N=12 (1,0,0,2,−1,0), congruences failing, at 1/6; η(z)η(11z) at 0 | Ligozat 1/4, 0, 1, 1/24, 2/3, 1/24, −1/8, 1/2; numeric leading exponent ×w: 0.2500, −0.0000, 1.0000, 0.0417, 0.6667, 0.0417, −0.1250, 0.4998 | holds, including k∉ℤ; retain |
| N14. Width w=N/gcd(d²,N) | ∞=1/N, 0, 1/2 at N=4 | 1, 4, 1; gcd(d²,N)=d·gcd(d,N/d) | retain |
| N15. Scope normalisation identity (32) | ν_η vs ε | 2πi(x/(24c)−s/2−1/8)=πi(x/(12c)−s−1/4) | correct |
| N16. Contracts: coefficient criterion; Hecke algebra; Jacobi | Δ; level 1, k=12; J(3\|7) | a₂a₃=−6048=a₆ and a₄=576−2048=−1472, so the criterion holds; S₁₂ has rank 1 and the algebra is ℤ, finite; −1=(−1)^(1·3)·J(7\|3)=−1 | correct |
| (r6) Translation law | Mathlib η at τ+1 | e^(πi/12) factor; the product is unchanged | retain |
| (r6) Inversion law, root choice | τ=i, 2i, −1+i | √(−iτ): 1, √2, 2^(1/4)e^(iπ/8); (√i)⁻¹√τ: the same values | retain |
| (r6) `etaTransformation` existence | c≠0; c=0 | (√w)²⁴=w¹²; c=0: ε²⁴=1 | retain |
| (r6) ε formula, numerically | 164 matrices × 3 τ | 0 failures | retain |
| (r6) ε at generators | T, S, −I, (2 1; 1 1) | e^(πi/12), e^(−πi/4), −i, 1 | retain |
| (r6) Check (1 0; n 1) | n=3 | s(1,3)=1/18; e^(−3πi/12); without −1/4 it gives 1 | retain |
| (r6) Lean Dedekind sum | 1≤r≤c−1; c=1 | `Int.fract`−1/2=((dr/c)); empty sum is 0 | retain |
| (r6) Lean context | binders | γ only; principal `Complex.sqrt` | retain |
| (r6) Check η²η(11·)², η(·)η(23·) orders | ∞, 0 | 1 and 1; 1 and 1 | retain |
| (r6) Check η(z)η(11z) | T | f(τ+1)=−f | retain |
| (r6) QSeries §5.2 conventions | T, S, −I, (1 0; 1 1) | e^(πi/12), e^(−πi/4), −i, e^(−πi/12) | agree |
| (r6) Bad-prime contract | η²η(11·)², p=11 | a₁₁²=1 | retain |
| (r6) `eta_neg_one_div_sq` | τ=i | η(i)²=η(i)² | retain |
| (r6) Scope with ModularCurvesPartII | curve, point, frame, multiplier | a₄=−g₂/4, a₆=−g₃/4; 1/N; dt/t=2πi du; (cz+d)⁻¹ | retain |
| (r6) EllipticPeriods §2.4 | g₂, g₃ | 4π⁴/3; 8π⁶/27 | retain |
| (r6) Tate curve over ℤ[1/N₀]((q)) | n≤5 | a₄=−5q−45q²−…, a₆=−q−23q²−…, integral | retain |
| (r6) §10D complex Tate normalisation | q=0 | −1/(4sin²πu)=t/(1−t)² | retain |
| (r6) Hecke recurrence | Δ, p=2, 3 | −6048; −1472 | retain |
| (r6) Bad prime | p=11 | a₁₂₁=1 vs −10 | retain |
| (r6) Functional-equation sign | level 11; Δ | +1; +1 | retain |
| (r6) 0.1 constant terms | χ mod 3, k=1 | B₁,χ=−1/3; a₀=1/6 | retain |
| (r6) 0.1 corrected E₂ | t=2 | −1−24q−24q² | retain |
| (r6) 1.1 δ and cusp term | Γ₁(5), Δ | widths 1,1,5,5; mass 24; ord 1 | retain |
| (r6) 1.1 irregular order | exponents 1, 3 | 2 | retain |
| (r6) 2.1 rank two, p=2 | T(1,2)² | T(1,4)+3T(2,2) | retain |
| (r6) 2.2 degrees | diag(1,p), pI | p+1; 1 | retain |
| (r6) 3.1 oldspace | N=11, 22 | old 0, new 1; old 2, new 0 | retain |
| (r6) 4.1 primitive associate | Δ(z)+cΔ(2z) | a₂=−24+c; conductor 1 | retain |
| (r6) 5.1 controls | Δ at level 2; 2Δ | not new; a₁=2 | retain |
| (r6) 6.1 commutation scalar | χ(2)=i mod 5, k=3 | 4−i≠1+4i | retain |
| (r6) 7.1 abscissa | E₄ | pole at 4 | retain |
| (r6) 8.0 normalisation, descent, cusp 0, N=1/M=4, N=2/M=5, N≤3, surjectivity | Δ; √2Δ, Δ/11; f(i); Γ₁(10); η(z)η(23z) | q−24q²; √2∉ℚ, 1/11∈ℚ; E₆(i)=0; Γ₁(2)∩Γ₁(5)=Γ₁(10); avatar of σ(φs^k) | retain |
| (r6) 8.1 bounded denominators | Δ/11; fΔ | a₁=1 after ×11; q²−25q³ | retain |
| (r6) 8.2 norm factors | √2; 1 | X²−2; (X−1)² | retain |
| (r6) 9.1 Satake | Δ p=2; level 11 p=11 | X²+24X+2048; {1,0} | retain |
| (r6) 9.2 twist level, depletion | ψ mod m; Δ mod 2 | Γ₁(Nm²); q+252q³ | retain |
| (r6) 9.3 Sturm length, letters | Γ₁(13) k=2; 25, 26 | B=28; z, ba | retain |
| (r6) 10A genus | Γ₀(11), Γ₀(2), Γ₁(13), Γ₁(22) | 1; 0; 2; 6 | retain |
| (r6) 10B Riemann–Roch, Hurwitz | ℙ¹; id, z², double cover | χ=deg+1; −2=−2+0; −2=−4+2; 0=−4+4 | retain |
| (r6) 10C dimensions, β=μ∗μ, newspace | level 1 k=12; Γ(3); 1,p,p²,p³,6,12; Γ₀(22), Γ₁(22), Γ₁(13) | 2, 1; 4, 0; 1,−2,1,0,4,−2; 0; 4; 2 | retain |
| (r6) 10D lattice, uniformisation, −1, order three, cusps, degree | m=2, 3; Y=℘′/2; N∣2; Γ₁(13) | 4π⁴/3, 8π⁶/27; Y²=X³−(g₂/4)X−g₃/4; 2/N∈ℤ+ℤz ⇔ N∣2; d=84 | retain |
| (r6) 11.1 trace formula | k=12 n=1…5; k=16, 24, 60; k=2 | 1, −24, 252, −1472, 4830; 216, 1080, −449691864; at k=2 the formula gives −1, −3 where the trace is 0, 0 | retain k≥4 |
| (r6) Weight-60 example | mod 17, 37, 83 | roots 6, 9, 10; 16, 22, 23; none | retain |
| (r6) `existsCoefficientTwist`, `crossLevelStrongMultiplicityOne`, `existsUniqueGaloisConjugate`, `newspaceDimension` | m=1, n=0; k≤0; Δ, σ=id; k≤0, N=1 | ψ(0)=1, a₀=0; no newform; g=Δ; 0=0, β(1)dim S_k | retain |

## Not verifiable

- **Apostol, *Modular Functions and Dirichlet Series in Number Theory*, Theorem 3.7** (new locator for reciprocity), alongside Theorems 3.1 and 3.4. This is `apostol-mfds`, settled as uncertified (DOI 10.1007/978-1-4612-0999-7, paywalled).
  - The reciprocity law was checked by computation instead (N1–N2).
  - HalfIntegralWeightModularForms §3.3 cites the same theorem number for the same law.
- **Ono, *The Web of Modularity*, Theorems 1.64–1.65.** No legal copy was found in the earlier rounds, and the package manifest has no entry for it.
  - The criterion and the orders were checked by computation instead (N11–N13).
  - The general cusp-order statement now rests on Rouse–Webb, which was read.
- **The Kronecker-symbol glyphs in stromberg-maass lines 195–196** are not legible in the OCR text. The exponents and the case split are legible; the symbol orientation was confirmed numerically (N3–N5).
- **The uncertified sources carried from earlier reports** (Diamond–Shurman, including Proposition 5.8.5 in the new coefficient-criterion contract; Miyake; Shimura; Atkin–Li; Forster; Sturm; Silverman) are cited by locator only. The new contract was checked against the pinned declaration instead.

## Source issues

- none
