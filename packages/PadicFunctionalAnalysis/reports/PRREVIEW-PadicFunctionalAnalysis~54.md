# Review of PadicFunctionalAnalysis (pull request #1807 at 7b607c3)

**Verdict:** needs changes

This is an incremental re-review of 0 changed lines since `3adc047`:
- `git diff 3adc047 7b607c3 -- TauCetiRoadmap/PadicFunctionalAnalysis` is empty;
- the pins are unchanged (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`);
- no repair report exists for the previous round.

None of the eleven previous findings is repaired. Each is restated below, with its witness re-checked at this head and on main `3090489`. R01 and R02 are blocking. The worker's gate, the dependency check and elaboration all pass.

## R01 (P2) — The unbounded Amice bijection of §4.7 is statable at the pins; the docstring says it is not

**Location.** `Suggested.lean` lines 33–35: "The unbounded Amice bijection of §4.7: the pinned direct limit `TauCeti.LocallyAnalytic` carries no topology, and there is no pinned carrier for the distributions dual to it." README §4.7 (lines 882–892) and the opening (lines 18–19) make it a central target.

**Claim.** Stating the headline needs a global topology on `LA(ℤ_p,K)` or a pinned distribution carrier.

**Witness.** Colmez defines a distribution as a linear form whose restriction to every `LA_h` is continuous (Col lines 1457–1459), so no global topology is needed. Over the pinned `TauCeti.LocallyAnalytic` (`Distribution/LocallyAnalytic.lean:45`, `ofStage` :55) that is a three-line `Submodule`. The target carrier `PowerSeries.OnOpenDisc` is pinned (`RingTheory/PowerSeries/OpenDisc/Basic.lean:100`).

**Why it matters.** LocallyAnalyticDistributions consumes this bijection from §4.7: its README lines 156, 182–184 and 1496 at its open head.

**Repair.**
1. Add `public import TauCeti.NumberTheory.Padics.Distribution.LocallyAnalytic` and `public import TauCeti.RingTheory.PowerSeries.OpenDisc.Basic`, then add this block under the Layer 4 section comment:

   ```lean
   /-- Locally analytic distributions on `ℤ_p` (§4.7): `K`-linear functionals on the algebraic
   direct limit `LA(ℤ_p, K)` whose restriction to every analytic stage is continuous. -/
   def distributions (K : Type*) [NormedField K] [NormedAlgebra ℚ_[p] K] [Algebra ℤ_[p] K]
       [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K] [CompleteSpace K] :
       Submodule K (TauCeti.LocallyAnalytic p K K →ₗ[K] K) where
     carrier := {μ | ∀ h, Continuous (μ ∘ₗ TauCeti.LocallyAnalytic.ofStage K h)}
     zero_mem' h := by rw [LinearMap.zero_comp]; exact continuous_zero
     add_mem' hμ hν h := by simpa [LinearMap.add_comp] using (hμ h).add (hν h)
     smul_mem' c μ hμ h := by simpa [LinearMap.smul_comp] using (hμ h).const_smul c

   /-- The binomial function `x ↦ (x choose n)` as a level-zero vector of `LA(ℤ_p, K)`. -/
   def binomialLA (K : Type*) [NormedField K] [NormedAlgebra ℚ_[p] K] [Algebra ℤ_[p] K]
       [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K] [CompleteSpace K] (n : ℕ) :
       TauCeti.LocallyAnalytic p K K :=
     TauCeti.LocallyAnalytic.ofStage K 0
       (TauCeti.AnalyticStage.amiceTerm p 0 n (((n.factorial : ℚ_[p])⁻¹) • (1 : K)))

   /-- The unbounded Amice transform (§4.7; [Col] Théorème II.2.2, [ST] Theorem 2.2):
   `μ ↦ ∑ₙ μ((x choose n)) Tⁿ` is a bijection from the distributions onto the series on the
   open unit disc. -/
   theorem amiceTransform_distribution_bijective (K : Type*) [NormedField K]
       [NormedAlgebra ℚ_[p] K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K]
       [CompleteSpace K] :
       (∀ μ ∈ distributions (p := p) K,
           (PowerSeries.mk fun n ↦ μ (binomialLA (p := p) K n)).OnOpenDisc 1) ∧
         ∀ F : PowerSeries K, F.OnOpenDisc 1 →
           ∃! μ, μ ∈ distributions (p := p) K ∧ ∀ n, μ (binomialLA (p := p) K n) = F.coeff n := by
     sorry
   ```

2. Name `distributions`, `binomialLA` and `amiceTransform_distribution_bijective` in §4.7 (bullets 1 and 3), at line 28 and in "How to read the build".
3. Cite [Col] Théorème II.2.2 (Col line 1502, p. 30) and [ST] Theorem 2.2 (ST line 316, p. 9) at the §4.7 target.
4. Remove §4.7 from the docstring's list of headlines that are not statable.

**Tested this round.**
- The block, spliced into a scratch copy of this head's `Suggested.lean` with the two imports, elaborates with exit 0 and nine `sorry` warnings and nothing else.
- `binomialLA K n` is `x ↦ (x choose n)`, because `amiceTerm p 0 n e` has coefficients `n!·(x choose n)·e` (`Amice/Basis.lean:427`).
- For `μ = f ↦ f'(0)`, the moments `b_n=(−1)^(n−1)/n` give `log(1+T)`. Since `|1/n|·rⁿ ≤ n·rⁿ → 0` for every `r<1`, this series lies on the open disc.
- The moments `b_n=1/n!` give `exp(T)`, which converges only for `|T| < r_p < 1`, so it is not on the open disc and `D_1` is unbounded. Both sides of the bijection exclude it.

## R02 (P2) — §5.5 uses `h` for the unit level, but §5.4 uses it for the principal-part level; the statement is undefined when `h < v_p(q)`

**Location.** README §5.5, lines 1097–1100: "for a field-valued weight satisfying §5.4 at level `h`, extend its principal-unit part analytically to `1+p^h𝒪_K` … Put `t_h=κ(exp(p^h))−1`." The *Needs:* line (1113) cites `exists_eval_eq_principalChar_iff`, where `h` is the principal-part level. §5.4 (lines 1072–1082) writes the unit level as `h'=h+v_p(q)`.

**Claim.** §5.5 applies to every weight that satisfies §5.4 at level `h`.

**Witness.** The weight `κ(x)=x` over `ℚ_p` satisfies §5.4 at `h=0`: `‖T_κ‖=‖q‖<r_0`, which is the Check at lines 1166–1170. §5.5 at `h=0` then needs `t_0=κ(exp 1)−1`, but `exp(1)` diverges in `ℚ_p` because `|1|=1 ≥ r_p`.

**Repair.**
- In §5.5, use the unit level `h' ≥ v_p(q)`, which is principal-part level `h'−v_p(q)` in `exists_eval_eq_principalChar_iff`.
- Write `1+p^(h')𝒪_K`, `‖c‖≤‖p^(h')‖` and `t_(h')=κ(exp(p^(h')))−1`.

**Tested** on the refuting instance `κ(x)=x`, with `h'=v_p(q)` and `r=1`:
- `‖t_(h')‖=‖exp(q)−1‖=‖q‖`, and `κ(cz+d)=cz+d` has Gauss norm `max(‖c‖,1)=1`.
- The first radius condition is `‖c‖≤‖q‖<r_p`: `p⁻¹<p^(−1/(p−1))` for odd `p`, and `1/4<1/2` at `p=2`.
- The second is `‖c‖‖q‖≤‖q‖²<‖q‖r_p`. Both hold.

## R03 (P3) — §3.2 offers `E=R` with `NormOneClass R` as a case of `NormSMulClass R E`

**Location.** README lines 625–627: "when `E≠0` and the action satisfies `NormSMulClass R E` (in particular for `E=R` with `NormOneClass R`), its operator norm is `‖g‖`, attained on a nonzero constant function".

**Claim.** `NormOneClass R` makes `E=R` an instance of `NormSMulClass R E`.

**Witness.** Take `R=E=ℚ_p×ℚ_p` with the sup norm. It is `NormOneClass`, but `‖(1,0)·(0,1)‖=0≠1`. With `g=(p⁻¹,1)`, `‖g‖=p`: the constant `(0,1)` gives ratio `1`, and only the constant `1` attains `p`.

**Repair.** State two cases:
- "when `E≠0` with `NormSMulClass R E`, attained on every nonzero constant";
- "when `E=R` with `NormOneClass R`, attained on the constant `1`".

Add `NormOneClass R` to the *Needs:* line for the second case.

**Tested.** On the witness, the constant `1` gives `‖g·1‖=‖g‖=p`.

## R04 (P3) — §1.3 says distances to a subspace lie in `r^ℤ∪{0}`; they need not

**Location.** README lines 370–372: "the distances from a vector to a closed subspace lie in the discrete set `r^ℤ∪{0}`, so their infimum is attained."

**Claim.** The norm values of a finite-dimensional space over a discretely valued field lie in `|K|`.

**Witness.** On `V=ℚ_p`, `‖x‖=p^(1/2)|x|_p` is a valid ultrametric `ℚ_p`-norm, and `d(1,{0})=p^(1/2)∉p^ℤ`.

**Repair.** Replace the sentence with this argument:
- the nonzero norm values lie in at most `dim V` cosets `c_i r^ℤ`;
- vectors whose norms lie in distinct cosets are orthogonal, hence independent;
- a finite union of such cosets, with `0`, meets every interval `[s,2s]` with `s>0` in finitely many points, so a positive infimum is attained.

**Tested.** The witness's norm values form the single coset `p^(1/2)p^ℤ`.

## R05 (P3) — §2.3 drops the discrete-norm hypothesis of the pinned Serre theorems

**Location.** README lines 465–468: "over a residue field every module is potentially orthonormalisable, isometrically exactly when its nonzero norms lie in the value group (`TauCeti.isPotentiallyONable_of_discrete_norm`, `TauCeti.isONable_iff_discrete_norm`)".

**Claim.** The cited declarations prove this over every ring with residue field.

**Witness.** Both declarations take `ϖ : NormedRing.PseudoUniformizer R` and `hR : ∀ a, zpowCeil ‖ϖ‖ ‖a‖ = ‖a‖` (`Bases/DiscreteNorm.lean:46–47, 67–71`). `ℂ_p` has a residue field (`unitBallIdeal` is maximal), but `zpowCeil p⁻¹ (p^(−1/2)) = 1 ≠ p^(−1/2)`. Serre Proposition 1 also assumes a discrete valuation (Serre lines 60–62).

**Repair.** Say "over a complete discretely normed ring whose residue ring is a field (for example a complete discretely valued field)".

## R06 (P3) — The §0.1 and §1.1 targets follow in one step from pinned declarations

**Location.**
- §0.1, lines 200–202: "a family of null families is summable in the sup-norm space when its sup norms tend to zero".
- §1.1, lines 343–346: "the zero-module case of Neumann inversion, where the inverse has norm zero".

**Claim.** These are remaining targets.

**Witness.** Both close in one step at the pins. I re-ran both this round, in a scratch file importing `RingOpNorm.Banach` and `Ultra.ContinuousMaps`; it exits 0 with no output:
- §0.1 is `NonarchimedeanAddGroup.summable_of_tendsto_cofinite_zero (tendsto_zero_iff_norm_tendsto_zero.mpr hf)` on `C₀(J,E)`.
- §1.1 is `simp [Subsingleton.elim ((oneSub t ht).symm : E →L[R] E) 0]` under `[Subsingleton E]`.

**Repair.**
- Move the §0.1 statement into its "In the pinned library" paragraph, citing the lemma and `ZeroAtInftyContinuousMap.instIsUltrametricDist` (`Topology/MetricSpace/Ultra/ContinuousMaps.lean:44`).
- Delete the §1.1 target; the same fact is already the Check at lines 406–407.

## R07 (P3) — The downstream mapping for PadicMeasuresIwasawaAlgebras omits `TCoord` and the clause citations

**Location.** README lines 1230–1244, which map the PadicMeasuresIwasawaAlgebras names to pinned declarations.

**Claim.** Every name and locator of this roadmap that PadicMeasuresIwasawaAlgebras cites can be followed after this change.

**Witness.** PadicMeasuresIwasawaAlgebras on main `3090489` breaks in two ways:
- line 364 cites `TauCetiRoadmap.PadicFunctionalAnalysis.TCoord`, which main's `Suggested.lean` declares (line 336) and this head drops without a mapping;
- lines 352–367 cite "§3.4, clause 1/4/5", "§5.2, clause 2" and "§5.3, clause 4, second sentence", but this head numbers no clauses.

**Repair.**
1. Add "`TCoord` is `TauCeti.WeightSpace.coord`".
2. Add one sentence mapping the clauses:
   - §3.4 clauses 1, 4 and 5 become §3.4 "In the pinned library";
   - §5.1 clause 1 becomes §5.1;
   - §5.2 clauses 1–2 become §5.2 "In the pinned library";
   - §5.3 clauses 1 and 3 become the §5.3 adic target;
   - §5.3 clause 4 becomes §5.3 "The Amice-coordinate comparison";
   - §5.3 clause 5 becomes the pinned `TauCeti.measureFun` paragraph.

## R08 (P3) — Targets without a `*Needs:*` line, and one line for several targets in §§4.5 and 5.6

**Location.**
- §4.4, fourth bullet (lines 806–808);
- §4.7, bullets 1, 3 and 4 (lines 882–885, 890–898);
- §5.3, the adic target (lines 1033–1043) and separation by weights (lines 1055–1061);
- §5.6, one *Needs:* line (1151–1156) for six targets: the construction, convolution, `H≃ℤ_p[[T,U]]/(TU−p)`, gauge and completeness, evaluation, and joint injectivity;
- §4.5, one *Needs:* line (828–833) for log, exp, inverses, `(1+t)^x` and the local-field comparison.

**Claim.** Every target lists what its statement and its route need.

**Witness.** The ranges above. The two §5.3 targets carry three headlines of `Suggested.lean`: `exists_character_of_hasEval`, `eq_aeval_binomialSeries` and `measurePairing_injective`.

**Repair.** Add the missing lines. For example:
- adic target: Mathlib `PowerSeries.HasEval`, `PowerSeries.aeval` and `PowerSeries.binomialSeries`, with `TauCeti.padicIntUnitsEquivZModUnitsProd`, `TauCeti.WeightSpace.finiteChar` and `TauCeti.WeightSpace.coord`;
- separation by weights: `ContinuousMonoidHom.characterIntegralAlgHom` and `LocallyConstant.denseRange_toContinuousMap`;
- §4.4 transition: `amiceMap_bijective_and_norm_eq` and `TauCeti.norm_factorial_le_mul_amiceRadius_succ_pow`.

Split the §4.5 and §5.6 lines per target.

## R09 (P3) — Targets stated as nouns or without their scope

**Location.**
- §2.6 line 544: "Permutation operators;" with no statement.
- §4.1 lines 713–715: "compare it with `TauCeti.AnalyticStage`", with no comparison stated.
- §4.7 lines 893–898: a list of nouns.
- §2.4 lines 486–488: "show that `K'⊗̂_K(−)` preserves strict exactness", without the countable-type hypothesis.

**Claim.** Each promised interface is a statement with its hypotheses.

**Witness.** The pinned `ZeroAtInftyContinuousMap.congrLeft` (`ZeroAtInfty/Basic.lean:169`) is already a linear isometric equivalence. The §2.4 route is the proof of [Conrad] Lemma 1.1.5 (Conrad lines 298–302), which gets the continuous section from countable type.

**Repair.**
- §2.6: state the matrix of `congrLeft σ` (it is `δ_{i,σ j}`), or cut the item.
- §4.1: state the comparison as an isometry `AnalyticStage p h E ≃ ∏_a E⟨w⟩` compatible with `eval`.
- §4.7: state each bullet item as a theorem with its hypotheses: point masses `(1+T)^x`, convolution going to multiplication, and the comparison with measure convolution.
- §2.4: restrict to strict short exact sequences whose middle term has countable type.

## R10 (P3) — Missing or wrong locators

**Location and witness.**
- "[ST]" at README line 933 has no locator. The Amice–Fourier isomorphism is ST Theorem 2.2 (ST line 316, p. 9).
- "[Am]" has no locator at README lines 702, 780 and 932, or at `Suggested.lean` lines 55, 66 and 74.
  - The normal basis of `A_h` is Amice Théorème 2 (Amice line 1226, p. 150).
  - The order-`h` criterion is Théorème 3 with Corollaire 1(b)–(c), applied to `u_n=n` (lines 1532 and 1604–1617, pp. 159–161).
- §2.6 line 552 says "Follow [Buz] Lemma 2.3(b)". The finite injective coordinate set it describes is Lemma 2.3(a); part (b) is closedness (Buz lines 330–332).
- The §4.6 target (lines 847–861) has no source. The "if" direction is the proof of [Col] Lemme II.2.1 (Col lines 1492–1501, p. 30).
- §5.5 has no source. The expansion `[cz+d]=[d₀](1+T)^(log((cz+d)/d₀)/q)` is in the proof of [LWX] Proposition 3.14 (LWX lines 1141–1166, p. 21).
- [RJW] Remark 3.47 is cited for `exists_character_of_hasEval` and `measurePairing_injective`. It uses `ℤ_pˣ=μ_(p−1)×(1+pℤ_p)` (RJW lines 1492–1496), which holds for odd `p` only, while the statements here include `p=2`.

**Repair.**
- Add the locators above, and write "[Buz] Lemma 2.3(a)–(b)".
- Cite [RJW] diagram (3.4), p. 18 (RJW lines 947–956), for the §5.3 comparison.
- Say that `p=2` follows by the same density argument with `q=4`.

## R11 (P3) — README shape and process wording

**Location.**
- Line 1 reads `# P-adic functional analysis`, and there is no `**Summary.**` paragraph.
- "How to read the build" is at line 1195, after Layer 5.
- "Still to formalise:" appears at lines 311, 695 and 924.

**Claim.** The README follows the house shape and is timeless.

**Witness.** The house shape asks for `# Roadmap: <title>`, an opening `**Summary.**` paragraph, and "How to read the build" before Layer 0. "Still to formalise" is process narrative.

**Repair.**
- Retitle to `# Roadmap: p-adic functional analysis` and open the first paragraph with `**Summary.**`.
- Move "How to read the build" before Layer 0.
- Make the three "Still to formalise" items ordinary Check bullets.

## Previous findings

- R01 — not repaired: `Suggested.lean` 33–35 still reads "The unbounded Amice bijection of §4.7: the pinned direct limit `TauCeti.LocallyAnalytic` carries no topology, and there is no pinned carrier for the distributions dual to it."
- R02 — not repaired: §5.5 (1097–1100) still reads "for a field-valued weight satisfying §5.4 at level `h`, extend its principal-unit part analytically to `1+p^h𝒪_K` … Put `t_h=κ(exp(p^h))−1`."
- R03 — not repaired: §3.2 (625–627) still reads "`NormSMulClass R E` (in particular for `E=R` with `NormOneClass R`)".
- R04 — not repaired: §1.3 (370–372) still reads "the distances from a vector to a closed subspace lie in the discrete set `r^ℤ∪{0}`".
- R05 — not repaired: §2.3 (465–466) still reads "over a residue field every module is potentially orthonormalisable".
- R06 — not repaired: §0.1 (200–202) "Target: a family of null families is summable…" and §1.1 (343–346) "Target: the zero-module case of Neumann inversion" are unchanged.
- R07 — not repaired: "Downstream consumers" (1230–1244) still has no `TCoord` line and no clause mapping.
- R08 — not repaired: §4.4 bullet 4, §4.7 bullets 1, 3 and 4, and both §5.3 targets still lack a *Needs:* line; §§4.5 and 5.6 still have one line each.
- R09 — not repaired: "Permutation operators;" (544), "compare it with `TauCeti.AnalyticStage`" (714), the §4.7 noun list (893–898) and the §2.4 corollary (486–488) are unchanged.
- R10 — not repaired: "[ST]" (933), "[Am]" (702, 780, 932; Lean 55, 66, 74), "[Buz] Lemma 2.3(b)" (552), no source in §§4.6 and 5.5, and [RJW] Remark 3.47 still cited for `p=2`.
- R11 — not repaired: line 1 is still `# P-adic functional analysis`, "How to read the build" is still at 1195, and "Still to formalise" is still at 311, 695 and 924.

## Verified sound

### Gate, dependency check and elaboration

**Gate.** The worker's gate at `7b607c3` reports every counter zero, `build=0` included: `OK`. My own run of `gate … --base origin/main` reports `outside-folder=25` and zero for every other counter. All 25 files lie in the 13 folders the brief names as the pull request's own; I counted them by folder from `git diff --name-only origin/main...HEAD`, and the brief's exclusion diff is empty. This is not a finding.

**Dependency check.** Output:

```text
depcheck: 236 roadmaps, 2267 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/PadicFunctionalAnalysis/Suggested.lean` exits 0 in 9 s. The only output is eight `declaration uses sorry` warnings, at lines 60, 69, 81, 103, 112, 126, 138 and 150.

**Signatures.** I put `#check @` for all eight declarations in one scratch copy and elaborated it once. Each elaborated type matches `signatures.md` after whitespace normalisation: 8 of 8, nothing changed. The binders still match README §§4.4, 4.6, 5.3 and 5.4:
- `[IsLinearTopology S S] … [ContinuousSMul ℤ_[p] S]` on both adic theorems;
- `[NormMulClass K] [NormOneClass K] … [NormSMulClass ℚ_[p] K]` on both level theorems.

**Padding probe.** I replaced every `sorry` by `first | rfl | infer_instance | (simp; done) | aesop`. None of the eight closes: the errors are unsolved goals, or "aesop failed", at lines 63, 72, 87, 106, 116, 131, 140 and 156.

**Repair probes.** The R01 block elaborates (exit 0, nine `sorry` warnings), and both R06 one-step proofs elaborate (exit 0, no output).

### Pinned declarations re-opened this round

Files are under `TauCeti/` at `2fd255d9`.

| Declaration | File:line |
| --- | --- |
| `LocallyAnalytic`, `LocallyAnalytic.ofStage` | `NumberTheory/Padics/Distribution/LocallyAnalytic.lean:45, 55` |
| `PowerSeries.OnOpenDisc` | `RingTheory/PowerSeries/OpenDisc/Basic.lean:100` |
| `isONable_iff_discrete_norm`, `isPotentiallyONable_of_discrete_norm` (hypotheses `ϖ`, `hR`) | `Analysis/Normed/Module/Bases/DiscreteNorm.lean:46–47, 67–71` |
| `unitBallIdeal`, an ideal of `Subring.unitClosedBall R` | `Analysis/Normed/Ring/UnitBall.lean:90` |
| `AnalyticStage.amiceTerm`, `amiceTerm_apply` | `NumberTheory/Padics/Distribution/Amice/Basis.lean:422, 427` |
| `ContinuousLinearMap.oneSub`, `ringOpNorm_oneSub_symm` (`[Nontrivial E]`) | `Analysis/Normed/Operator/RingOpNorm/Banach.lean:343, 390` |
| `ZeroAtInftyContinuousMap.instIsUltrametricDist` | `Topology/MetricSpace/Ultra/ContinuousMaps.lean:44` |

The earlier rounds' table of about 60 opened declarations stands, because the pins are identical. The citations tool reports no README Lean name that is found nowhere.

### Cross-roadmap citations, re-resolved on main `3090489`

**Suppliers.** Since `35884a8`, main touched only the `PROGRESS.md` files of LocalFieldsRamification and ProfiniteProPGroups; no supplier README changed. Every cited section resolves:
- RestrictedPowerSeries §0.3 (224), §1.1 (247), §2.1 (306), §2.2 (324), §2.3 (340) and §7.1 (704);
- NewtonPolygons Layer 1 (442) and §1.1 (444);
- AdicSpaces Layer 0 (`Completed/`, line 135);
- LocalFieldsRamification Layer 1 (`Completed/`, line 281), with deep units at 393;
- ProfiniteProPGroups Layer 9 (`Completed/`, line 2106) and `powerSeriesCoordinate` (2287, 2297).

**Consumers on main.** AdicSpacesPartII, AdicSpacesPartIII, CompactOperators and PadicMeasuresIwasawaAlgebras are unchanged since `35884a8`. They cite §0.4, §§2.2/2.4, §3.4, §§5.1–5.3 and §5.3, and every one of these exists at this head. The broken names and clauses are R07.

**Consumer in this pull request.** RigidAnalyticGeometry cites §1.2, Layer 1 and §2.4 (lines 361, 384, 412, 471, 593, 700, 1096 and 1121), and all three exist here.

### Ownership and overlaps

**Ownership.** `roadmaps grep -i Amice --readme-only` over the open heads and main finds no second owner of the unbounded Amice transform or of the annular ring `H`:
- LocallyAnalyticDistributions declares that PadicFunctionalAnalysis owns the analytic stages (its line 55) and consumes §§4.4 and 4.7;
- ColemanIntegration and PadicDifferentialEquationsAndRigidCohomology use the bounded Mahler–Amice bijection and their own coefficient spaces.

**Other pull requests that change this folder.**
- #1854 carries the folder exactly as at `4faa251c`, an ancestor of this head.
- #1808 carries a different revision of this folder: its README differs from this head in 430 lines. This pull request's description says the stacked #1808 follows it, so the order is stated and this is not a finding. That revision already makes some of the repairs above: a `**Summary.**` title paragraph, "How to read the build" moved up, `[Buz] Lemma 2.3(a)–(b)`, and a §4.7 distribution headline `bijOn_amiceTransformLA`. It leaves R03, R05, R06, R07 and R09 as they are here. I did not review that revision; it is a lead for the author.

**Overlaps tool.** No id is dropped, and no id is defined only by an open revision.

### Adversarial table

Rows marked (r38) are carried from the previous report, because the statements are unchanged. Rows marked "this round" were recomputed.

| Statement | Instance | Left side | Right side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| `amiceMap_bijective_and_norm_eq` (r38) | `E=0` | `C₀(ℕ,0)=0` | `LA_h(0)=0`, norms 0 | holds | none |
| same (r38) | `h=0, p=2, E=ℤ_2`, column `n=2` | `e_(0,2)=x²−x ↦ (0,−1,1)` | unit-triangular, isometric | holds | none |
| same (r38) | `E=𝔽_p`, trivial norm | matrix unit upper-triangular mod `p` | `‖Mc‖=1=‖c‖` | holds | none |
| `isOrthonormalBasis_amiceTerm` (r38) | `p=2, h=1, n=2` | disc 0: `2w²−w` | unit coefficient at `w^⌊n/2⌋=w` | matches pinned reduction | none |
| `exists_eval_eq_addChar_iff` (r38) | `p=2, h=0, t=2` | `3^x ∉ LA_0` | `‖2‖=1/2`, not `<r_0=1/2` | both false | none |
| same (r38) | `p=3, t=ζ_3−1, h=0/1` | `ζ^x ∉ LA_0`, `∈ LA_1` | `3^(−1/2)=r_0`; `<r_1=3^(−1/6)` | agree | none |
| §4.7 Check (r38) | `p=2`, `‖t‖=2^(−1/2)` | `r_1=2^(−1/2)`: fails strictly | `r_2=2^(−1/4)`: holds | consistent with §4.6 | none |
| §4.7 Check `χ_p` (r38) | `p=2` | `‖2‖=1/2=r_0`: not level 0 | `1/2<r_1=2^(−1/2)` | level 1 | none |
| `exists_character_of_hasEval` (r38) | `S=0`; `S=ℤ_p, z=p`; `S=ℤ_p[ε]/ε², z=ε` | trivial; `κ(γ)=1+p`; `1+s(x)ε` | coord `0`; `p`; `ε` | holds | none |
| `eq_aeval_binomialSeries` (r38) | `x=γ`, `x=ω(δ)` | `κ(γ)=1+T`; `κ(ωδ)` | `1·(1+T)`; `finiteChar δ·1` | agree | none |
| `amiceTransform_completedGroupAlgebra_compat` (r38) | `μ=δ_a` | `coord((1+T)^a)=[ofAdd a]` | `[ofAdd a]` | agree | none |
| `measurePairing_injective` (r38) | `μ=δ_1−δ_(1+p)` | `∫x dμ=−p≠0` | separated | holds | none |
| `exists_eval_eq_principalChar_iff`, this round | `κ(x)=x`, `p=2`; `p` odd | `‖4‖=1/4`; `‖p‖=p⁻¹` | `<r_0=1/2`; `<r_0=p^(−1/(p−1))` | level 0 | none |
| §5.4 level formula (r38) | `p=2, h'=2` | `p^(−q/(p^(h')(p−1)))=2^(−1)` | `r_0=1/2` | agree | none |
| §5.2 valuation (r38) | `p=5, m=2`; `p=2, m=3` | `v(ζ_5−1)=1/4`; `v=1` | `1/(5^0·4)`; `1/2^0` | agree | none |
| R01 transform, this round | `μ=f↦f'(0)` | `b_n=(−1)^(n−1)/n` | `log(1+T)`, `n·rⁿ→0` for `r<1` | on open disc, not bounded | R01 |
| R01 transform, this round | `b_n=1/n!` | `D_1` unbounded | `exp(T)`, radius `r_p<1` | excluded on both sides | R01 |
| R01 probe, this round | block spliced into the head | exit 0 | 9 `sorry` warnings | statable | R01 |
| R02 §5.5, this round | `κ(x)=x`, principal level 0 | `t_0=κ(exp 1)−1` | `exp(1)` diverges (`|1|≥r_p`) | undefined | R02 |
| R02 repaired, this round | `κ(x)=x, h'=v_p(q), r=1` | `‖c‖‖q‖≤‖q‖²` | `<‖q‖r_p` (`p⁻¹<p^(−1/(p−1))`; `1/4<1/2`) | holds | R02 |
| R03 §3.2, this round | `R=E=ℚ_p², g=(p⁻¹,1)` | constant `(0,1)`: ratio `1` | `‖g‖=p`; constant `1`: ratio `p` | `NormSMulClass` fails | R03 |
| R04 §1.3, this round | `‖x‖=p^(1/2)|x|_p` | `d(1,0)=p^(1/2)` | `∉p^ℤ` | sketch false | R04 |
| R05 §2.3, this round | `𝒪_(ℂ_p)`, `a=p^(1/2)` | `zpowCeil p⁻¹ (p^(−1/2))=1` | `≠p^(−1/2)` | `hR` fails | R05 |
| R06 probes, this round | `C₀(J,E)`; `Subsingleton E` | one Mathlib lemma; one `simp` | exit 0, no output | one step at the pins | R06 |
| §0.4 Check (r38) | `A₀={x≡y mod p²}`, `ϖ=(p,p²)` | `g(1)=1, g(ϖ)=a⁻¹` | `g(1+ϖ)=a²>1` | as claimed | none |
| §5.6 gauge (r38) | `U`, `p`, `U^j` | `‖U‖=1`, `‖p‖=α` | partial sums of `ΣU^j` diverge | as claimed | none |
| §5.3 at `p=2` (r38) | `ℤ_2[C_2]` | residue `𝔽_2[δ]/(δ−1)²` | local, maximal ideal `(2,δ−1)` | as claimed | none |

### Seeded sample and source locators

No sampled target falls in a changed passage, because nothing in this folder changed. The README marks no locator as unverified.

I re-read these locators, on which the findings rely:
- ST Theorem 2.2 (ST line 316, p. 9);
- Buz Lemma 2.3(a)–(c) (Buz lines 328–334);
- Col Théorème II.2.2 (Col line 1502);
- RJW Remark 3.47 (RJW lines 1492–1496);
- LWX Proposition 3.14 (LWX line 1141);
- Amice Théorème 2 (Amice line 1226);
- Serre Proposition 1 (Serre lines 60–62);
- Conrad, the proof of Lemma 1.1.5 (Conrad lines 298–302).

### Remark on untouched text

This is a remark on text the previous review passed, not a finding. The scope table (line 41) and §5.5 (lines 1110–1112) leave matrix actions and automorphy-factor cocycles to "quaternionic modular-form theory". This roadmap consumes neither, so no supply edge is affected.

## Not verifiable

- [Sch] Schneider, [BGR] Bosch–Güntzer–Remmert and [Bel] Bellaïche are settled as uncertified and cited by locator only. The §2.4 claims cited to [Sch] §10 were checked instead against the pinned declarations and the proof of [Conrad] Lemma 1.1.5.
- [Am] is an OCR'd scan with garbled inequalities. The form of Corollaire 1(c) was checked against Colmez I.4.7–I.4.8 in an earlier round.
- Ownership against open pull requests was checked through `roadmaps grep` over the open heads and main, `roadmaps show` for #1808 and #1854, and the overlaps index.

## Source issues

- none
