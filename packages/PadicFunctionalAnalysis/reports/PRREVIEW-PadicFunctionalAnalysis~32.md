# Review of PadicFunctionalAnalysis (pull request #1807 at ac36c47)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/PadicFunctionalAnalysis/` at `ac36c47` (README 1302 lines, `Suggested.lean` 163 lines, eight sorried theorems). The pins are unchanged since the previous review (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`). The worker's gate passes. `lake env lean TauCetiRoadmap/PadicFunctionalAnalysis/Suggested.lean` exits 0 in 7 s with exactly eight `declaration uses sorry` warnings (lines 60, 69, 81, 103, 112, 126, 138, 150). The dependency check prints `depcheck: 230 roadmaps, 2316 edges, 0 problem(s)` with no UPWARD, CYCLE or `moved:` line. The two blocking findings are a headline that can be stated on the pinned carriers but is absent (R01) and a level convention in §5.5 that leaves the statement undefined at small levels (R02).

## R01 (P2) — The unbounded Amice bijection of §4.7 is statable at the pins; the docstring says it is not

Location: `Suggested.lean` lines 33–35, "The unbounded Amice bijection of §4.7: the pinned direct limit `TauCeti.LocallyAnalytic` carries no topology, and there is no pinned carrier for the distributions dual to it." README lines 18–19 name "the algebraic distributions on `ℤ_p` and their unbounded Amice transform" among the central targets, and §4.7 lines 882–892 state them.

Claim: the headline cannot be stated without a global topology on `LA(ℤ_p,K)` or a pinned distribution carrier.

Witness: the README's own carrier (§4.7, lines 882–885) is linear forms on `LocallyAnalytic p K K` that are continuous on every stage. That is a `Submodule` with a three-line body. `PowerSeries.OnOpenDisc` is pinned (`RingTheory/PowerSeries/OpenDisc/Basic.lean:100`). The statement below elaborates.

Repair: add the following under the Layer 4 section comment and import `TauCeti.NumberTheory.Padics.Distribution.LocallyAnalytic` and `TauCeti.RingTheory.PowerSeries.OpenDisc.Basic`. I inserted it into a copy of the file just before `/-! ## Layer 5 … -/`. `lake env lean` exits 0 with nine `sorry` warnings and nothing else.

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

At level 0, `amiceTerm p 0 n e` has disc coefficients `n!·(w choose n)·e`, so `binomialLA K n` evaluates to `x ↦ (x choose n)`. The statement is Colmez's Théorème II.2.2 (Col lines 1457–1504, p. 30). There, distributions are defined exactly as linear forms continuous on each `LA_h`. Then:

- name `distributions`, `binomialLA` and `amiceTransform_distribution_bijective` in §4.7 (bullets 1 and 3), in line 28 and in "How to read the build";
- cite [Col] Théorème II.2.2 and [ST] Theorem 2.2 at the §4.7 target;
- drop §4.7 from the docstring's list of headlines that are not statable.

## R02 (P2) — §5.5 uses `h` as the unit level, but §5.4 uses it as the principal-part level; the statement is undefined for `h < v_p(q)`

Location: README §5.5 lines 1097–1101: "for a field-valued weight satisfying §5.4 at level `h`, extend its principal-unit part analytically to `1+p^h𝒪_K` … Put `t_h=κ(exp(p^h))−1`". The *Needs:* line (1113) cites `exists_eval_eq_principalChar_iff`, whose `h` is the principal-part level (§5.4 lines 1065–1082 reserve `h'` for the unit level).

Claim: §5.5 holds for every weight that satisfies §5.4 at level `h`.

Witness: `κ(x)=x` over `ℚ_p` satisfies §5.4 at level `h=0` (Check, lines 1166–1170). §5.5 then needs `t_0=κ(exp(1))−1`. But `exp(1)` diverges in `ℚ_p`, because `|1| ≥ r_p`, and `1+𝒪_K` contains `0`.

Repair: in §5.5, use the unit level `h' ≥ v_p(q)`, that is principal level `h'−v_p(q)` in `exists_eval_eq_principalChar_iff`. Write `1+p^(h')𝒪_K`, `‖c‖≤‖p^(h')‖` and `t_(h')=κ(exp(p^(h')))−1`. Tested: for `κ(x)=x` and `h'=v_p(q)` we get `‖t_(h')‖=‖q‖<r_p`, and `κ(cz+d)=cz+d` has Gauss norm `max(‖c‖,‖d‖)=1` on the closed unit disc. With `r=1` the two radius conditions read `‖c‖<r_p` and `‖c‖‖t_(h')‖<‖p^(h')‖r_p`; both hold.

## R03 (P3) — §3.2: `NormOneClass R` is offered as a case of `NormSMulClass R R`

Location: README lines 625–627: "when `E≠0` and the action satisfies `NormSMulClass R E` (in particular for `E=R` with `NormOneClass R`), its operator norm is `‖g‖`, attained on a nonzero constant function".

Claim: `E=R` with `NormOneClass R` is an instance of `NormSMulClass R E`.

Witness: `R=E=ℚ_p×ℚ_p` with the sup norm is `NormOneClass`, but `‖(1,0)·(0,1)‖=0≠1=‖(1,0)‖‖(0,1)‖`. The conclusion still holds there, but only on the constant `1`: the constant `(0,1)` gives `sup‖g(x)(0,1)‖<‖g‖` for `g=(p⁻¹,1)`.

Repair: state two cases: "when `E≠0` and `NormSMulClass R E`, attained on any nonzero constant; or when `E=R` with `NormOneClass R`, attained on the constant `1`".

## R04 (P3) — §1.3: distances to a subspace need not lie in `r^ℤ∪{0}`

Location: README lines 369–372: "the distances from a vector to a closed subspace lie in the discrete set `r^ℤ∪{0}`, so their infimum is attained."

Claim: the norm values of a finite-dimensional space over a discretely valued field lie in `|K|`.

Witness: on `V=ℚ_p` with the norm `‖x‖=p^(1/2)|x|_p`, the distance from `1` to the subspace `0` is `p^(1/2)∉p^ℤ`.

Repair: the norm values on `V∖{0}` lie in at most `dim V` cosets `c_i r^ℤ`, because vectors whose norms lie in distinct cosets are orthogonal, hence independent. That finite union, together with `0`, is discrete in `(0,∞)`, so the infimum is attained. Tested on the witness: one coset, `p^(1/2)p^ℤ`.

## R05 (P3) — §2.3 drops the discrete-norm hypothesis of the pinned Serre theorems

Location: README lines 465–467: "over a residue field every module is potentially orthonormalisable, isometrically exactly when its nonzero norms lie in the value group".

Claim: these are the pinned `TauCeti.isPotentiallyONable_of_discrete_norm` and `TauCeti.isONable_iff_discrete_norm`.

Witness: both need a complete norm-one ring with maximal `unitBallIdeal` and `hR : ∀ a, zpowCeil ‖ϖ‖ ‖a‖ = ‖a‖`, i.e. discrete scalar norms (`Bases/DiscreteNorm.lean` 37–38, 67–71). Serre Proposition 1 assumes a discrete valuation (Serre lines 60–62).

Repair: "over a complete discretely normed ring whose residue ring is a field (for example a complete discretely valued field)".

## R06 (P3) — The §0.1 and §1.1 targets follow in one step from pinned declarations

Location: §0.1 lines 200–202 ("a family of null families is summable in the sup-norm space when its sup norms tend to zero"); §1.1 lines 343–346 (the zero-module Neumann inverse has norm zero).

Claim: these are remaining targets.

Witness: both close in one step at the pins. §0.1 is `NonarchimedeanAddGroup.summable_of_tendsto_cofinite_zero (tendsto_zero_iff_norm_tendsto_zero.mpr hf)`, using the pinned instance `ZeroAtInftyContinuousMap.instIsUltrametricDist` (`Topology/MetricSpace/Ultra/ContinuousMaps.lean:44`). §1.1 is `simp [Subsingleton.elim (… : E →L[R] E) 0]` with `[Subsingleton E]`. Both probes elaborate.

Repair: move the §0.1 statement into its "In the pinned library" paragraph, citing those two names. Delete the §1.1 target; the same fact is already the Check at lines 406–407.

## R07 (P3) — The downstream mapping for PadicMeasuresIwasawaAlgebras omits `TCoord` and the clause citations

Location: README lines 1230–1244 map the PadicMeasuresIwasawaAlgebras names to pinned declarations.

Claim: every PFA name and locator that PadicMeasuresIwasawaAlgebras cites can be followed after this change.

Witness: PadicMeasuresIwasawaAlgebras on main, line 364, cites `TauCetiRoadmap.PadicFunctionalAnalysis.TCoord`. That `def` is in main's `Suggested.lean` (line 336) and is dropped here without a mapping. Lines 366 and 922 cite "§5.3, clause 4, second sentence", and this head's §5.3 has no such clause.

Repair: add "`TCoord` is `TauCeti.WeightSpace.coord`". Add one line mapping the clause citations: §5.3 clause 4 becomes §5.3 "The Amice-coordinate comparison"; §5.3 clauses 1 and 3 become the §5.3 adic target; §5.3 clause 5 becomes the pinned `TauCeti.measureFun` paragraph; §3.4 clauses 1, 4 and 5 become §3.4 "In the pinned library".

## R08 (P3) — Targets still without a `*Needs:*` line, and one line covering several targets in §§4.5 and 5.6

Location:
- §4.4 fourth bullet (lines 806–808);
- §4.7 bullets 1, 3 and 4 (lines 882–885, 890–898);
- §5.3 adic target (1033–1043) and separation by weights (1055–1061);
- §5.6 has a single *Needs:* line (1151–1156) for the construction, convolution, `H≃ℤ_p[[T,U]]/(TU−p)`, gauge, completeness, evaluation and joint injectivity; §4.5 has one line (828–833) for log, exp, inverses, `(1+t)^x` and the local-field comparison.

Claim: every target lists what its statement and route need.

Witness: the line ranges above. The two §5.3 targets are headline theorems of `Suggested.lean` (`exists_character_of_hasEval`, `eq_aeval_binomialSeries`, `measurePairing_injective`).

Repair: add the missing *Needs:* lines, for example:
- the adic target: Mathlib `PowerSeries.HasEval`, `PowerSeries.aeval` and `PowerSeries.binomialSeries`, with `TauCeti.padicIntUnitsEquivZModUnitsProd`, `TauCeti.WeightSpace.finiteChar` and `TauCeti.WeightSpace.coord`;
- separation by weights: `ContinuousMonoidHom.characterIntegralAlgHom` and `LocallyConstant.denseRange_toContinuousMap`;
- the §4.4 transition: `amiceMap_bijective_and_norm_eq` and `TauCeti.norm_factorial_le_mul_amiceRadius_succ_pow`.

Split the §4.5 and §5.6 lines per target.

## R09 (P3) — Targets stated as nouns or without their scope

Location:
- §2.6 line 544: "Permutation operators;" with no statement. The pinned `ZeroAtInftyContinuousMap.congrLeft` (`ZeroAtInfty/Basic.lean:169`) is already a linear isometric equivalence.
- §4.1 line 714: "compare it with `TauCeti.AnalyticStage`", with no comparison stated.
- §4.7 lines 893–898: a list of nouns.
- §2.4 lines 486–488: "show that `K'⊗̂_K(−)` preserves strict exactness", without the countable-type hypothesis.

Claim: each promised interface is a statement with hypotheses.

Witness: the route of the §2.4 corollary is the proof of [Conrad] Lemma 1.1.5 (Conrad lines 298–302), which uses countable type to obtain a continuous section. No statement here covers sequences that do not split.

Repair:
- §2.6: state the permutation target (for example, the matrix of `congrLeft σ` is `δ_{i,σ j}`) or cut it.
- §4.1: state the comparison as an isometry `AnalyticStage p h E ≃ ∏_a E⟨w⟩` compatible with `eval`.
- §4.7: state each bullet item as a theorem.
- §2.4: restrict to strict short exact sequences whose middle term has countable type.

## R10 (P3) — Locators

Location and witness:
- "[ST]" (line 933) has no locator; the Amice–Fourier isomorphism is ST Theorem 2.2 (ST line 316, p. 9).
- "[Am]" (lines 702, 780, 932; `Suggested.lean` 55, 66, 74) has no locator. The normal basis of `A_h` is Amice Théorème 2 (line 1226, p. 150), applied to `u_n=n`; the order-`h` criterion is Théorème 3 with Corollaire 1(b)–(c) (lines 1532, 1606–1617, pp. 159–161).
- §2.6 line 552 cites "[Buz] Lemma 2.3(b)" for the finite injective coordinate set, which is Lemma 2.3(a) (Buz lines 328–342).
- The §4.6 target has no locator in the README; the "if" direction is the proof of [Col] Lemme II.2.1 (Col lines 1495–1500, p. 30).
- §5.5 has none; the expansion of `κ(cz+d)` is in the proof of [LWX] Proposition 3.14 (LWX lines 1141–1166, p. 21).
- [RJW] Remark 3.47, cited for `exists_character_of_hasEval` and `measurePairing_injective`, works under RJW's standing odd-`p` assumption (RJW lines 404, 1993); the statements here include `p=2`.

Repair: add these locators. Cite [RJW] diagram (3.4), p. 18 (RJW lines 947–956) for the comparison of §5.3. Say that `p=2` follows by the same density argument with `q=4`.

## R11 (P3) — README shape and process wording

Location: line 1 `# P-adic functional analysis` with no `**Summary.**` paragraph; "How to read the build" at line 1195, after Layer 5; "Still to formalise:" at lines 311, 695 and 924.

Claim: the README follows the house shape and is timeless.

Witness: 129 of the READMEs on main open with `# Roadmap…`; the shape puts "How to read the build" before Layer 0. "Still to formalise" is process narrative.

Repair: use the title `# Roadmap: p-adic functional analysis` with a `**Summary.**` paragraph, move "How to read the build" before Layer 0, and turn the three "Still to formalise" items into ordinary Checks.

## Previous findings

- **R01 (analytic-level headlines absent) — repaired.** `exists_eval_eq_addChar_iff` (`Suggested.lean` 81–88) and `exists_eval_eq_principalChar_iff` (150–157) are stated with `TauCeti.amiceRadius p h`. README §4.6 (847–851), §5.4 (1065–1069) and "How to read the build" (1202–1206) name them, and the module imports `Amice/Character`.
- **R02 (§3.2 "exactly when" fails for `E=0`) — repaired.** Lines 623–630 scope the converse to `E≠0` with `NormSMulClass R E`. The negative control `E=0, g=p⁻¹` is the Check at 685–688. A new defect in the same sentence is R03.
- **R03 (`matrixCoeffInputFirst`) — repaired.** The declaration is gone, and §2.6 (533–543) describes the adapter in words without an own backticked name.
- **R04 (§5.5 and §5.6 not named in the docstring) — repaired.** Docstring lines 33–39 name §4.7, §5.5 and §5.6. The §4.7 reason does not hold (R01 here).
- **R05 (shape and locators) — partly repaired.** `### Examples` and `### Dependencies` now close every layer (304/320, 397/409, 574/594, 675/699, 900/930, 1158/1189), and every target the previous review listed has a *Needs:* line. RestrictedPowerSeries §7.1 (171), LWX Lemma 3.15 (1148), Col Théorème I.4.7 and Corollaire I.4.8 are cited. Targets the previous list omitted still lack *Needs:* lines (R08 here).

## Verified sound

**Gate, change, elaboration.**
- The worker's gate at `ac36c47`: every counter is zero, `OK`.
- My run of `gate … --base origin/main` flags 20 outside-folder files. All are in AlgebraicCurves, AlgebraicTopology, BordismFormalGroups, CharacteristicClasses, ClassifyingSpaces, ComplexKahlerGeometry and the other folders the brief names as the pull request's own. The brief's diffstat outside the 14 named folders is empty.
- Depcheck: `depcheck: 230 roadmaps, 2316 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Elaboration: exit 0, eight `sorry` warnings.
- `#check @` on all eight declarations gives the same elaborated types as the worker's `signatures.md`. No section binder is dropped: `[IsLinearTopology S S] … [ContinuousSMul ℤ_[p] S]` is on both adic theorems and `[NormMulClass K] … [NormSMulClass ℚ_[p] K]` on both level theorems, matching README §§4.6, 5.3 and 5.4.
- Non-vacuity: the hypotheses instantiate at `K=ℚ_p` (§§4.6, 5.4), at `S=ℤ_p` (adic character) and at `E=ℚ_p` (Amice).

**Padding probe.** Each of the eight sorries was replaced in turn by `simp`, `rfl`, `infer_instance` and `aesop`; none closes (`simp` makes no progress or leaves goals at 64, 72, 88, 106, 116, 131, 140, 157). `exists_eval_eq_principalChar_iff` closes by `rw [TauCeti.WeightSpace.principalChar_eq_addChar_of_value_at_one]; exact exists_eval_eq_addChar_iff h κ.tendsto_coord_pow`. That uses a sibling theorem rather than a library lemma, and the theorem is the §5.4 weight-level headline the previous review requested, so it is kept.

**Pinned names.** All 338 backticked Lean-shaped names of the README resolve:
- 247 by `#check` against built modules;
- 80 in unbuilt modules by a namespace-aware search of the pinned sources;
- `TauCeti.RingOpNorm` is a namespace (`RingOpNorm.lean:156`);
- the 4 own names are declared in `Suggested.lean`, and the 6 consumer names are mapped in "Downstream consumers".

I opened these declarations and checked their hypotheses against the prose (files under `TauCeti/` unless marked Mathlib):

| Area | Declarations (file:line) |
| --- | --- |
| Analytic stages and the direct limit | `AnalyticStage` (Distribution/AnalyticStage.lean:107), `AnalyticStage.eval` (:194); `LocallyAnalytic` (Distribution/LocallyAnalytic.lean:45), `ofStage` (:55); `PowerSeries.OnOpenDisc` (RingTheory/PowerSeries/OpenDisc/Basic.lean:100) |
| Amice | `amiceTerm` (Amice/Basis.lean:422), `amiceMap` (:494), `norm_coeff_amicePolynomial_mod_div`; `amiceRadius` (Amice/Norm.lean:98), `onOpenDisc_iff_forall_hasGaussNorm_amiceRadius` (:313); `amiceCharCoeff` (Amice/Character.lean:88), `tendsto_amiceCharCoeff_iff` (:161), `eval_addCharExpansion` (:216), `exists_eval_eq_addChar` (:279) |
| Weights and measures | `WeightSpace` (WeightSpace.lean:81), `weightTest` (:94), `finiteChar` (:112), `principalChar` (:122), `coord` (:156), `principalChar_eq_addChar_of_value_at_one` (:185), `ofCoord` (:229), `weightSpaceEquiv` (:287); Mathlib `AbstractMeasure` (NumberTheory/Padics/Measure/Basic.lean:40); `characterIntegralAlgHom` (Measure/CharacterIntegral.lean:92) |
| Bases | `IsOrthonormalFamily` (Bases/Orthonormal.lean:95), `IsOrthonormalBasis` (:107); `isONable_iff_discrete_norm` (Bases/DiscreteNorm.lean:46), `isPotentiallyONable_of_discrete_norm` (:67); `ResidueModule.isOrthonormalBasis_iff` (Bases/ResidueBasis.lean:300), `isONable_iff_free_residueModule` (:326); `exists_isTOrthogonalBasis_of_dense_span` (Bases/CountableType.lean:118); `exists_continuousLinearEquiv_prod_of_countableType` (Bases/Splitting.lean:87) |
| Operators | `ofBijectiveOfIsTate` (RingOpNorm/OpenMapping.lean:240), `isOpenMap_of_isTate` (:282), `exists_preimage_norm_le_of_isTate` (:294), `isStrictMap_of_isClosed_range_of_isTate` (:301), `continuous_of_isClosed_graph_of_isTate` (:423); `oneSub` (RingOpNorm/Banach.lean:343), `ringOpNorm_oneSub_symm` (:390); `ringOpNorm_zero` (RingOpNorm.lean:223) |
| Model spaces | `instIsBoundedSMul` (ZeroAtInfty/Basic.lean:50), `congrLeft` (:169); `linearCombinationEquiv` (ZeroAtInfty/LinearCombination.lean:284); `exists_norm_coe_eq_norm` (ZeroAtInfty/Discrete.lean:405), `dense_setOf_finite_support` (:430), `hasSum_smul_single_one` (:465), `sumEquiv` (:531), `curryEquiv` (:654); `isometry_toZeroAtInftySMulCLM` (ZeroAtInfty/Triangular.lean:122), `surjective_toZeroAtInftySMulCLM` (:181), `toZeroAtInftySMulLinearIsometryEquiv` (:233), which hold for any complete ultrametric `E`; `instIsUltrametricDist` (Topology/MetricSpace/Ultra/ContinuousMaps.lean:44) |
| Completed tensor and group algebras | `CompletedTensor` (RingTheory/Huber/BanachModule/CompletedTensor.lean:201), `lift` (:314), `map` (:383); `powerSeriesCoordinate` (CompletedGroupAlgebra/PowerSeries.lean:350); `prodPowerSeriesCoordinate` (ProductCoordinate.lean:91); `domCongr` (Map.lean:171); `IsProP.aeval_binomialSeries` (ProP/BinomialSeries.lean:68), which is ℤ_p-valued only, so no duplicate of `eq_aeval_binomialSeries` |

**Cross-roadmap citations, resolved this round.**
- On main (`adf01c6`): AdicSpaces Layer 0 (`Completed/`, line 135); RestrictedPowerSeries §§0.3 (224), 1.1 (247), 2.1 (306), 2.2 (324), 2.3 (340) and 7.1 (704); NewtonPolygons Layer 1 (442) and §1.1 (444); ProfiniteProPGroups "Layer 9 prerequisites" (`Completed/`, 1656) with `powerSeriesCoordinate` (1796–1810); LocalFieldsRamification Layer 1, deep units (`Completed/`, 447).
- Consumers: AdicSpacesPartII (340–341), AdicSpacesPartIII (100, 118, 598, 606), CompactOperators (24) and RigidAnalyticGeometry (31 at this head) cite §§0.4, 1.2 and 2.1–2.4, which all exist here. PadicMeasuresIwasawaAlgebras (352–367) is covered by R07.
- LocallyAnalyticDistributions #854 (lines 156, 175, 182–184) consumes §4.4 and "the algebraic Amice bijection" of §4.7, which is what makes R01 matter.
- Ownership: searching the open roadmap pull requests and main for Amice, halo/`TU−p`, weight space and analytic level finds no second owner of Amice's theorem, the distribution carrier, the adic universal character, the ℤ_p Amice-coordinate comparison, separation by weights or `H`. DirichletPadicLFunctions #1039, PadicDifferentialEquationsAndRigidCohomology #1002 and ColemanIntegration #1043 consume, they do not own.
- Overlaps: #1808 and #1854 conflict with #1807 only in other folders, and the description orders #1808 after #1807. No id this README cites is dropped or defined only by an open revision.

**Seeded sample (sources read at the locator).**

| Target | Source passage | Result |
| --- | --- | --- |
| 1.2 | JN §2.1 line 422 (open mapping via Huber) and Buz Prop. 2.1 (lines 181–194) | support the pinned mapping theorems |
| 2.1 | JN Def. 2.1.5 (429–431) and Serre p. 70 Exemple and Prop. 3 (55–59, 116–127) | support `C₀(I,R)` and bounded families as operators |
| 2.2 | JN Def. 2.1.5 (432–437) and Buz p. 7 (221–233) | (Pr) and ON bases; the projection target holds (ONB of `ℚ_p²`, `J={1}`: `‖a e₁‖=|a|≤max`) |
| 2.3 | Serre Prop. 1 and Lemme 1 (60–81) | discreteness assumed: R05 |
| 2.4 | Conrad Lemma 1.1.5 proof (298–302) | countable type gives a section, then base change: R09 scope |
| 2.6 | Buz Lemma 2.3(a)–(b) (328–358), extended to Banach–Tate by JN lines 443–446 | supported; R10 for the (a)/(b) locator |
| 3.2 | Mah Theorem 1 (156–158) | pinned |
| 4.1–4.2 | Col §I.4.1–I.4.4 (628–689): disc coordinate `(x−a)/p^h`, independence of the representative (677–678) | supported |
| 4.4 | Col Théorème I.4.7, Lemme I.4.9 (712–746), Corollaire I.4.8 (714–720); Amice Théorème 2 (1226), Théorème 3 and Corollaire 1 (1532, 1606–1617) | supported; centres `−j` and "degree at most `m(n)`" agree with lines 744–746 |
| 4.5 | standard; LocalFieldsRamification Layer 1 | no locator needed |
| 4.6 | Col lines 1495–1500 | "if" direction; "only if" by the README's route |
| 5.3 | RJW Prop. 3.16 (816), diagram (3.4) (947–956), Thm. 3.25 (959), Remark 3.47 (1492–1516, odd `p`) | supported; R10 |
| 5.5 | LWX Prop. 3.14 (1141–1166) | supported; R10 |
| 5.6 | LWX Lemma 3.15 (1215–1218) | `ℤ_p⟦T,pT⁻¹⟧⊗ℤ_p[Δ]` and `m_Λ Λ_{>1/p}=(T)` match |

**Adversarial table** (every value computed).

| Statement | Instance | Left side | Right side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| `amiceMap_bijective_and_norm_eq` | `E=0` | `C₀(ℕ,0)=0` | `LA_h(0)=0`, norms 0 | holds | none |
| same | `h=0, p=2, E=ℤ_2`, column `n=2` | `x(x−1)=x²−x` ↦ `(0,−1,1)` | unit-triangular (Stirling), isometric | holds | none |
| same | `E=𝔽_p`, trivial norm | `M ≡` unit upper-triangular mod `p` | `‖Mc‖=1=‖c‖` on finitely supported `c` | holds | none |
| `isOrthonormalBasis_amiceTerm` | `p=2, h=1, n=2` | disc 0: `(2w choose 2)=2w²−w` | unit coefficient at `w^1=w^⌊n/2⌋`; disc 1: `w+2w²` | matches pinned reduction | none |
| `exists_eval_eq_addChar_iff` | `p=2, h=0, t=2` (`3^x`) | `3^x=(−1)^x(−3)^x`, not in `LA_0` | `‖2‖=1/2`, not `<r_0=1/2` | both false | none |
| same | `p=2, h=0, t=−4` | `(−3)^x=exp(x log(−3))`, `|log(−3)|=1/4` | `1/4<1/2` | both true | none |
| same | `p=3`, `t=ζ_3−1`, `h=0` / `h=1` | `ζ^x` locally constant mod 3: not in `LA_0`, in `LA_1` | `3^(−1/2)=r_0`; `<r_1=3^(−1/6)` | false/false; true/true | none |
| §4.6 `⇔ ‖(1+t)^(p^h)−1‖<r_p` | `‖t‖>r_p` vs `<r_p` | `‖(1+t)^p−1‖=‖t‖^p` resp. `‖t‖/p` | iterate `h` times: `<r_p ⇔ ‖t‖<r_h` | holds | none |
| `exists_character_of_hasEval` | `S=0`; `S=ℤ_p, z=p`; `S=ℤ_p[ε]/ε², z=ε`; `S=ℚ_p` | trivial `κ`; `κ(γ)=1+p`; `κ=1+s(x)ε` | coord `0`; `p`; `ε`; `IsLinearTopology ℚ_p ℚ_p` false | holds / excluded | none |
| `eq_aeval_binomialSeries` | `x=1, γ, ω(δ)` | `κ(1)=1`, `κ(γ)=1+T`, `κ(ω δ)` | `1·1`, `1·(1+T)`, `finiteChar δ·1` | agree | none |
| `amiceTransform_completedGroupAlgebra_compat` | `μ=δ_a`, `μ=0` | `coord((1+T)^a)=[ofAdd a]`; `0` | `equiv(δ_{ofAdd a})=[ofAdd a]`; `0` | agree | none |
| `measurePairing_injective` | `μ=δ_1−δ_{1+p}` | `∫x dμ=−p≠0` | separated | holds | none |
| `exists_eval_eq_principalChar_iff` | `κ(x)=x` over `ℚ_3` / `ℚ_2` | `‖T‖=‖exp(q)−1‖=1/3` / `1/4` | `<r_0=3^(−1/2)` / `<1/2` | level 0, both | none |
| §5.4 level formula | `p` odd, `h'=1` | `p^(−q/(p^(h')(p−1)))=p^(−1/(p−1))` | `r_0` at `h=h'−1=0` | agree | none |
| §5.4 conductor bound | `κ=x^kψ`, `h'≥max(m,v_p(q))` | `ψ(exp p^(h'))=1`, `‖exp(kp^(h'))−1‖≤p^(−h')` | `<r_p` (`p^(−1)<p^(−1/(p−1))`; at `p=2`, `1/4<1/2`) | holds | none |
| §5.2 valuation of `ψ(γ)−1` | `p=5, m=2`; `p=2, m=3` | `ζ_5−1`: `v=1/4`; `ψ(γ)=−1`: `v=1` | `1/(p^0·4)`; `1/2^0` | agree | none |
| §4.7 `D_h` (R01) | `b_n=1/n!` | `D_0=1`; `D_1=p^(⌊n/p⌋)→∞` | `Σ T^n/n!` not on open disc | consistent with Col II.2.2 | R01 |
| §4.7 transform (R01) | `μ=f↦f'(0)` | `b_n=(−1)^(n−1)/n` | `log(1+T)`, `r^n p^(v(n))→0` for `r<1` | on open disc | R01 |
| §5.5 (R02) | `κ(x)=x`, principal level 0 | `t_0=κ(exp 1)−1` | `exp(1)` diverges | undefined | R02 |
| §5.5 repaired | `κ(x)=x`, `h'=v_p(q)`, `r=1` | `κ(cz+d)=cz+d` | Gauss norm `max(‖c‖,1)=1` | holds | R02 |
| §3.2 (R03) | `R=E=ℚ_p²`, `g=(p⁻¹,1)` | constant `(0,1)`: `sup=1` | `‖g‖=p` | `NormSMulClass` fails; constant 1 attains `p` | R03 |
| §1.3 (R04) | `ℚ_p`, `‖x‖=p^(1/2)|x|` | `d(1,0)=p^(1/2)` | `∉p^ℤ` | sketch false | R04 |
| §0.1 / §1.1 (R06) | probes | one Mathlib lemma / one `simp` | elaborate | already pinned | R06 |
| §0.4 Check, `ϖ∉A₀` | `A₀={x≡y mod p²}`, `ϖ=(p,p²)` | `g(1)=1`, `g(ϖ)=a⁻¹` | `g(1+ϖ)=a²>1` | ultrametricity fails, as claimed | none |
| §0.4 Check `N=max(|x|,|x|²)` | `|ϖ|=r` | `N(ϖ)N(ϖ⁻¹)=r·r⁻²` | `=r⁻¹>1` | as claimed | none |
| §1 Check `|x|²` on `ℤ_p` | `x=p^k` | `|x|/|x|²=p^k` | unbounded | as claimed | none |
| §4.4 transition multiplier | `p=2, h=0, n=4` | `4!/2!=12` | `‖12‖_2=1/4=2^(−⌊4/2⌋)` | `→0`, as claimed | none |
| §4.7 Checks `χ_p` | `p=2` | `‖2‖=1/2=r_0` | `<r_1=2^(−1/2)` | level 1 | none |
| §5.6 gauge | `‖U‖`, `‖p‖`, `U^j` | `T^(−1)U=pT^(−2)∉H` | `‖U‖=1`, `‖p‖=α`, `‖U^j‖=1` | partial sums diverge, as claimed | none |
| §5.6 evaluation | `p⁻¹<|t|<1` | `|d_(−j)t^(−j)|≤(p|t|)^(−j)` | `→0` | converges | none |
| §5.6 `H≃ℤ_p[[T,U]]/(TU−p)` | `T^iU^j` | `p^(min)T^(i−j)` or `U^(j−i)` | `v(d_(−j))≥j` | normal forms agree | none |
| §5.3 at `p=2` | `ℤ_2[C_2]` | residue `𝔽_2[δ]/(δ−1)²` | local, maximal ideal `(2,δ−1)` | as claimed | none |

## Not verifiable

- [Sch] Schneider, *Nonarchimedean Functional Analysis*; [BGR] Bosch–Güntzer–Remmert; [Bel] Bellaïche, *The Eigenbook*: settled as uncertified and cited by locator only. The §2.4 countable-type statements cited to [Sch] §10 were checked against the pinned declarations and the proof of [Conrad] Lemma 1.1.5 instead.
- [Am] is an OCR'd scan. Théorèmes 2–3 and Corollaire 1 were read at Amice lines 1226, 1532 and 1606–1625; the OCR of the inequalities is garbled, so the exact form of (c) was checked against Colmez I.4.7–I.4.8.
- Ownership against open pull requests was checked through `roadmaps grep` over the 462 open heads and main, and through the overlaps index. #1808, which carries this folder stacked on #1807, was not read beyond that index.

## Source issues

- none
