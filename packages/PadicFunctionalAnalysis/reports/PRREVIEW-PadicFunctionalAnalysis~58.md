# Review of PadicFunctionalAnalysis (pull request #1807 at d18ec2a)

**Verdict:** needs changes

This is a full re-review: the folder changed by 176 lines since `8e289d9`. The pins are unchanged. Both findings of the previous review are repaired (see "Previous findings" at the end). This review has four findings:

- **R01 (P2, blocking):** §5.5's headline can be stated at the pins, although the module docstring says it cannot.
- **R02–R04 (P3):** a missing locator and hypothesis in §1.3, an overclaim in Convention 10, and a radius symbol `r_2` that means two different radii.

The gate (apart from this pull request's own folders), the dependency check, elaboration, the signature comparison and the padding probe all pass.

## R01 (P2) — §5.5's scalar analytic factor is statable at the pins; the docstring says it is not

**Location.**
- `Suggested.lean` lines 45–47: "The scalar analytic factors of §5.5: no pinned declaration extends a weight analytically from `1 + p^(h') ℤ_p` to `1 + p^(h') 𝒪_K` …, and the expansion of `κ(cz + d)` needs that extension."
- README §5.5 (lines 1449–1460) defines that extension by the explicit formula `κ(1+u)=exp((log(1+u)/p^(h'))·log(1+t_(h')))`.

**Claim.** The docstring names a missing pinned declaration, not a missing carrier. The extension is the README's own formula, and both series in it are native carriers at the pin: Mathlib's `NormedSpace.exp` and `NormedSpace.log` (`Analysis/Normed/Algebra/Logarithm.lean:90`). So the headline needs no new definition.

**Witness.** The block below, spliced after `exists_eval_eq_weight_iff` into a scratch copy of `Suggested.lean`, elaborates against the pins. The command exits 0, and the only output is eleven `declaration uses sorry` warnings.

**Repair.**
1. Add this block to `Suggested.lean` after `exists_eval_eq_weight_iff`:

   ```lean
   /-- **Scalar analytic factors of a weight** (§5.5; [LWX] Proposition 3.14, p. 21, in its proof,
   for the universal case at `h' = v_p(q)`). Let `K` be a complete normed extension of `ℚ_p`,
   `h' = h + v_p(q)` a unit level and `κ` a `K`-valued weight with `‖T_κ‖ < r_h`, so that
   `1 + t = κ(exp(p^(h')))` has `‖t‖ < r_p`. Then `κ(y) = exp((log y/p^(h')) log(1 + t))` on
   `1 + p^(h') ℤ_p`, and this formula extends `κ` to `1 + p^(h') 𝒪_K`. For `d = d₁(1 + u₀)` with
   `d₁ ∈ ℤ_pˣ`, `‖u₀‖ ≤ ‖p^(h')‖`, and `‖c‖ ≤ ‖p^(h')‖`, the factor
   `κ(cz + d) = κ(d₁) exp((log(1 + u₀ + cz/d₁)/p^(h')) log(1 + t))` is, on the closed unit disc, the
   sum of a power series with coefficients of norm at most one, whose constant term `κ(d)` has norm
   one. -/
   theorem exists_powerSeries_hasSum_weight_factor (h : ℕ) {K : Type*} [NormedField K]
       [NormedAlgebra ℚ_[p] K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K]
       [CompleteSpace K] (κ : TauCeti.WeightSpace p K) (hκ : ‖κ.coord‖ < TauCeti.amiceRadius p h)
       (d₁ : ℤ_[p]ˣ) (u₀ c : K) (hu₀ : ‖u₀‖ ≤ ‖(p : K) ^ (h + TauCeti.padicUnitsDepth p)‖)
       (hc : ‖c‖ ≤ ‖(p : K) ^ (h + TauCeti.padicUnitsDepth p)‖) :
       (∀ x : ℤ_[p]ˣ, ‖(x : ℤ_[p]) - 1‖ ≤ ‖(p : ℤ_[p]) ^ (h + TauCeti.padicUnitsDepth p)‖ →
           (κ x : K) = NormedSpace.exp
             (NormedSpace.log (algebraMap ℤ_[p] K x) / (p : K) ^ (h + TauCeti.padicUnitsDepth p) *
               NormedSpace.log (κ (TauCeti.padicUnitsGenerator p ^ p ^ h) : K))) ∧
       ∃ F : PowerSeries K, (∀ n, ‖PowerSeries.coeff n F‖ ≤ 1) ∧
         ∀ z : K, ‖z‖ ≤ 1 →
           HasSum (fun n ↦ PowerSeries.coeff n F * z ^ n)
             ((κ d₁ : K) * NormedSpace.exp
               (NormedSpace.log (1 + u₀ + c * z / algebraMap ℤ_[p] K d₁) /
                   (p : K) ^ (h + TauCeti.padicUnitsDepth p) *
                 NormedSpace.log (κ (TauCeti.padicUnitsGenerator p ^ p ^ h) : K))) := by
     sorry
   ```

   Notes on the statement:
   - `hκ` is §5.5's hypothesis `‖t_(h')‖<r_p`, read through §4.6's equivalence `‖(1+t)^(p^h)−1‖<r_p ⇔ ‖t‖<r_h`.
   - `γ^(p^h)=exp(p^(h'))`.
   - `d=d₁(1+u₀)` covers the README's `d∈ℤ_pˣ(1+p^(h')𝒪_K)`.
2. In the module docstring:
   - add "the scalar analytic factors of §5.5" to the list of stated headlines, with `NormedSpace.exp` and `NormedSpace.log` among the carriers;
   - replace "Two headline targets are not stated here. The scalar analytic factors of §5.5: … needs that extension." with "One headline target is not stated here:", followed by the existing §5.6 sentence.
3. In the README:
   - name `exists_powerSeries_hasSum_weight_factor` in the §5.5 target;
   - add it to the list at lines 210–217;
   - change line 33 to "§§4.4, 4.6, 4.7, 5.3, 5.4, 5.5 and 5.6".

**Tested.**
- **Trivial weight.** `t=0` and `log 1=0`, so both conjuncts read `1=exp 0`, and `F=1`.
- **`κ(x)=x`, odd `p`, `h=0` (`h'=1`).**
  - `log(1+t)=log(exp p)=p`, so the factor is `d₁·exp(log(1+u₀+cz/d₁))=cz+d`.
  - Its coefficients are `d` and `c`, of norms `1` and `≤p⁻¹`.
  - On `1+pℤ_p` the first conjunct reads `exp(log x)=x`.
- **`p=2`, sign weight, `h=0` (`h'=2`).** `T=0` and `κ=1` on `1+4ℤ_2`, and the formula gives `exp(0)=1`.
- **Convergence.**
  - The series `log(1+u₀+cz/d₁)/p^(h')` has Gauss norm `≤1`, since `h'(n−1)≥v_p(n)`, and `‖log(1+t)‖=‖t‖<r_p`.
  - So the argument `G` of `exp` has Gauss norm `<r_p`.
  - By §4.5's bound `‖G^k/k!‖≤‖G‖(‖G‖/r_p)^(k−1)`, `exp G` has coefficients of norm `≤1` and constant term of norm `1`.
- **Padding probe.** `first | rfl | infer_instance | (simp; done) | (simp_all; done) | aesop` does not close the statement.
- **Why §5.6 is different.** Its Banach–Tate gauge needs a `NormedRing` instance on `H[1/T]` whose axioms are themselves the target. So the docstring's reason holds there, and that sentence stays.

## R02 (P3) — §1.3: the orthogonal-basis target has no locator and does not state ultrametricity

**Location.** README lines 429–431: "Target: over a complete discretely valued field `K` with value group `r^ℤ`, prove the orthogonal version (`t=1`, …) for a finite-dimensional normed space `V`".

**Claim.** An orthogonal basis exists for every finite-dimensional normed space over such a `K`. No source is given for this.

**Witness.**
- `ℚ_p²` with `‖(x,y)‖=|x|_p+|y|_p` is a normed `ℚ_p`-space.
- An orthogonal basis would make the norm ultrametric (`‖Σa_ie_i‖=max‖a_ie_i‖`), but `‖(1,0)+(0,1)‖=2>1`.
- The pinned `TauCeti.exists_basis_isTOrthogonalFamily` (`Analysis/Normed/Module/Bases/CountableType.lean:145`) assumes `[IsUltrametricDist E]`.

**Repair.**
- Write "for a finite-dimensional ultrametric normed space `V` (`IsUltrametricDist`)".
- Add a locator for the `t=1` statement, for example in [Sch] or [BGR]. Both are settled as uncertified, so cite them by locator alone.
- The cached [Serre] does not cover this case. Its Proposition 1, p. 70 (Serre lines 60–62), assumes condition (N), that norms lie in `|K|` (Serre line 46), which §1.3 drops.

Convention 1 already lists `IsUltrametricDist` as a native structure, which is why this is P3 and not P2.

**Tested.** With ultrametricity, the route's step "norms in distinct cosets give `‖Σa_iv_i‖=max‖a_iv_i‖`" is the strict-triangle equality. The `ℓ¹` example above is then excluded.

## R03 (P3) — Convention 10: "only a multiplicative norm" contradicts §0.2

**Location.** README lines 134–136: "A normed-ring weight has a topologically nilpotent coordinate; only a multiplicative norm makes this equivalent to `‖T_κ‖<1`."

**Claim.** Without a multiplicative norm, topological nilpotence of `T_κ` and `‖T_κ‖<1` are not equivalent.

**Witness.**
- §0.2 cites `TauCeti.isTopologicallyNilpotent_iff_norm_lt_one_of_isPowMul` (`Analysis/Normed/Ring/UnitBall.lean:140`): power-multiplicativity suffices.
- On `ℚ_p×ℚ_p` with the sup norm, which is power-multiplicative but not multiplicative (`(1,0)(0,1)=0`), the weight `x↦(x,1)` has `T=(exp(q)−1,0)`. Its norm is `‖q‖<1`, and it is topologically nilpotent.

**Repair.** Replace the sentence with: "only a power-multiplicative norm, in particular a multiplicative one, makes this equivalent to `‖T_κ‖<1` (`TauCeti.isTopologicallyNilpotent_iff_norm_lt_one_of_isPowMul`); in general `‖T_κ‖` can be `1`, as for the dual-number weight in the Layer 5 Checks."

**Tested.**
- In `ℚ_p×ℚ_p`, `(p,p)` has norm `p⁻¹` and is topologically nilpotent, while `(1,0)` has norm `1` and is idempotent: the equivalence holds.
- In the max-norm dual numbers, `ε` is nilpotent with `‖ε‖=1`: the equivalence fails, as the Layer 5 Check says.

## R04 (P3) — `r_2` names two different radii in the Checks

**Location.**
- README line 1206: "`r_1=2^(−1/2)` and `r_2=2^(−1/4)`". This is the level radius `r_h` at `h=2`.
- Lines 1224–1225: "`‖4‖=4⁻¹<r_2=2⁻¹`; `exp(2)` diverges in `ℚ_2`, since `‖2‖=2⁻¹=r_2`".
- Line 1550: "`‖2‖=2⁻¹=r_2`".
- In the last two, `r_2` is the exponential radius `r_p` at `p=2`.

**Witness.** With line 1206's `r_2=2^(−1/4)`, line 1225's equation `2⁻¹=r_2` is false.

**Repair.** At lines 1224, 1225 and 1550, write `r_p=2⁻¹` (with `p=2`), or `r_0=2⁻¹`, since `r_0=r_p`.

**Tested.** `TauCeti.amiceRadius 2 0=2^(−1/(1·1))=2⁻¹` and `TauCeti.amiceRadius 2 2=2^(−1/4)`.

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

**Gate.**
- The worker's gate at `d18ec2a` reports every counter zero: `OK`.
- My run of `gate … --base origin/main` reports `outside-folder=26` and zero for every other counter it prints. The 26 files are `README.md` and `Suggested.lean` in the 13 folders that the brief names as this pull request's own, and the exclusion diff is empty. This is not a finding.
- Within this folder, only `README.md` and `Suggested.lean` differ from main.

**Dependency check.**

```text
depcheck: 229 roadmaps, 2124 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/PadicFunctionalAnalysis/Suggested.lean` exits 0. The only output is ten `declaration uses sorry` warnings, at lines 72, 82, 96, 140, 164, 173, 187, 200, 216 and 231.

**Signatures.**
- I elaborated `#check @` for all 12 declarations in one scratch file. All 12 elaborated types equal those in `signatures.md`, so no binder is lost.
- The entry `of` in `signatures.md` is the tool reading the docstring words "structure of" at line 48; it is not a declaration.
- `exists_eval_eq_weight_iff` carries its own `K` binders and agrees with §5.4: the stage `LA_(h+v_p(q))(K)`, evaluation restricted to `ℤ_pˣ`, and `TauCeti.amiceRadius p h`.

**Padding probe.** I replaced each of the 10 `sorry`s with `first | rfl | infer_instance | (simp; done) | (simp_all; done) | aesop | decide | exact?`. All 10 fail, so none is padding.
- No Tau Ceti file mentions both `WeightSpace` and `AnalyticStage`, so `exists_eval_eq_weight_iff` is not at the pin.
- The proved `example` (lines 129–134) tests the `(n!)⁻¹` normalisation of `binomialLA`.

### Library names at the pins (333 resolved)

**Resolution.** All 333 qualified backticked names in the README resolve at the pins:
- 303 by `#check @` against Mathlib and 619 built Tau Ceti modules;
- 30 by source in unbuilt modules. For example, `ContinuousLinearMap.rowNorm` is in `Analysis/Normed/Operator/RowCompact.lean`, `ZeroAtInftyContinuousMap.diagonalCLM` in `Topology/ContinuousMap/ZeroAtInfty/Diagonal.lean`, and `TauCeti.Huber.BanachModule.CompletedTensor.lift`/`map` in `RingTheory/Huber/BanachModule/CompletedTensor.lean:314, 383`.

**Opened and compared with the README:**
- **Weights and stages.**
  - `TauCeti.amiceRadius` (`NumberTheory/Padics/Distribution/Amice/Norm.lean:98`, `p^(−1/((p−1)p^h))`);
  - `TauCeti.padicUnitsDepth` (`UnitsDecomposition/Logarithm.lean:75`), `TauCeti.padicUnitsGenerator` (`:243`) and `unitsPrincipalLogEquiv` (`:217`);
  - `TauCeti.WeightSpace` (`WeightSpace.lean:81`, continuous `ℤ_pˣ→Rˣ`), `coord` (`:156`) and `principalChar_eq_addChar_of_value_at_one` (`:185`);
  - `TauCeti.AnalyticStage` (`Distribution/AnalyticStage.lean:107`) and `eval` (`:194`);
  - `TauCeti.AnalyticStage.eval_natCast_val_add_mul`, whose formula is §4.1's: `eval c (a+p^h w)=Σ' wⁿ•c(a,n)`.
- **Amice characters and basis.**
  - `eval_addCharExpansion` (`Amice/Character.lean:216`), `tendsto_amiceCharCoeff_iff` (`:161`) and `exists_eval_eq_addChar` (`:279`);
  - `eval_amiceTerm` (`Amice/Basis.lean:469`) and `norm_amiceMap_le` (`:537`).
- **Other Tau Ceti carriers.**
  - `PowerSeries.OnOpenDisc` (`RingTheory/PowerSeries/OpenDisc/Basic.lean:100`: restricted at every `r<R₀`);
  - `prodPowerSeriesCoordinate` (`…/CompletedGroupAlgebra/ProductCoordinate.lean:91`);
  - `exists_basis_isTOrthogonalFamily` (`Bases/CountableType.lean:145`);
  - `isTopologicallyNilpotent_iff_norm_lt_one_of_isPowMul` (`Ring/UnitBall.lean:140`).
- **Mathlib exp and log.**
  - `NormedSpace.log` (`Analysis/Normed/Algebra/Logarithm.lean:90`): its junk value is `0`, and ultrametric convergence is still a TODO there, so §4.5's first target is not at the pin.
  - `NormedSpace.exp_add_of_mem_ball` (`Analysis/Normed/Algebra/Exponential.lean:438`): it requires a `NormedCommRing` with `NormedAlgebra 𝕂`, `CharZero 𝕂`, and both points in the ball of radius `expSeries` radius. These are exactly §4.5's hypotheses.
- **Measures, operators and functions** (elaborated types):
  - §3.4: `AbstractMeasure.norm_toCLMEquiv_eq_iSup_coeff`, `AbstractMeasure.mem_range_amiceTransform_iff` (Tate normed commutative ring), `AbstractMeasure.amiceTransform_phiMeasure` (`A(φμ)=A(μ)∘((1+T)^p−1)`), `AbstractMeasure.existsUnique_integral_iff_norm_le_one`;
  - §1.1: `ContinuousLinearMap.ringOpNorm_oneSub_symm` (`[Nontrivial E]`, matching "for a nonzero module"), `ContinuousLinearMap.ringOpNorm_eq_opNorm`, `TauCeti.NormedRing.IsTate.bound_of_continuous`;
  - §3.1: `LocallyConstant.denseRange_toContinuousMap` (compact, Hausdorff, totally disconnected);
  - §3.3: `PadicInt.vanDerPutCoeff_id`;
  - §4.5: `PadicInt.continuous_binomialSeries`;
  - §0.1: `NonarchimedeanAddGroup.summable_iff_tendsto_cofinite_zero`, `Filter.Tendsto.exists_forall_norm_le` and `exists_norm_eq_ciSup` (`[Nonempty ι]`), `HasSum.norm_lt_of_forall_norm_lt` (`0<B`, which covers the empty family) and `HasSum.norm_eq_of_forall_norm_lt`.

### Seeded sample and locators

Each entry was checked at its line and page, with its hypotheses and against the statement as written.

**Pinned declarations only.** No external source is cited for these; each was checked against its elaborated type above.
- §0.1 and §0.2.
- §1.1.
- §3.1, §3.3 and §3.4.
- §4.1: RestrictedPowerSeries §0.3 (module-valued coefficients) and §1.3 (the unit-radius isometry onto `C₀(σ→₀ℕ,E)`) supply the comparison.

**Layer 0.**
- §0.3: [JN] Lemmas 2.1.6–2.1.7, p. 9 (JN lines 460–492). These are the power comparisons with constants `C₁,C₂,s`, and footnote 3 (JN line 500) records the correction the README calls "corrected".
- §0.4:
  - [JN] Remark 2.1.3(1), p. 8 (JN lines 397–402), with `ϖ` in a ring of definition;
  - [KL] Remark 2.4.4, p. 39 (KL lines 1538–1544), which omits that condition (see Source issues).

**Layer 1.** §1.3 has no locator: R02.

**Layer 2.** §2.6 cites:
- [Buz] Lemma 2.3(a)–(b), p. 10 (Buz lines 328–358): a Noetherian `A` and a finite `P` in an ONable module; a finite injective `π_S`; `P` closed. The README's route is this proof.
- [JN] §2.1 (JN lines 443–446), which carries the lemma over to Noetherian Banach–Tate rings.

**Layer 4.**
- §4.5, the new locators:
  - [Buz] §8, p. 62 (Buz lines 2188–2193): log converges for `|t|<1`, exp for `|t|<p^(−1/(p−1))`, and they are inverse between the open discs. The README's wording matches.
  - [Col] §I.6, p. 27 (Col lines 1339–1352): `n(δ)≥1` with `v_p(δ(x)−1)≥v_p(2p)`, and the expansion. With `δ` equal to `y^x` on `1+2pℤ_p` and trivial on `p` and on `μ(ℚ_p)`, `w(δ)=x` and `n(δ)=v_p(2p)` are valid choices (but see Source issues).
- §4.7:
  - [Col] §II.2, p. 29 (Col lines 1457–1461): linear forms continuous on each `LA_h`, as in `distributions`;
  - Lemme II.2.1, p. 30 (Col line 1492);
  - Théorème II.2.2, p. 30 (Col lines 1502–1504): `v_(B(0,u_h))(A_μ)≥v_(LA_h)(μ)≥v_(B(0,u_(h+1)))(A_μ)−1`, which is the README's `S_h≤‖μ‖_h≤pS_(h+1)`;
  - §II.3 no. 2, p. 31 (Col lines 1567–1570);
  - §II.4 no. 6, p. 36 (Col lines 1899–1912): the convolution `φ(x+y)` with `A_(λ∗µ)=A_λA_µ`; and Lemme II.4.2 (Col line 1915);
  - [ST] Theorem 2.2, p. 9 (ST line 316).

**Layer 5.**
- §5.2:
  - [LWX] Notation 2.1, p. 8 (LWX lines 349–356), and §1.14 (LWX lines 337–338: `q=4` at `p=2`);
  - [RJW] Remark 3.47, pp. 25–26 (RJW lines 1492–1509): `μ_(p−1)×(1+pℤ_p)` and `p−1` copies of `B(0,1)`, for odd `p` only, as the README says.
- §5.4: [Col] §I.6, p. 27 (Col lines 1339–1354). The README uses only "on some `1+p^nℤ_p`", which is unaffected by the source issue below.
- §5.5:
  - [LWX] Proposition 3.14, p. 21 (LWX line 1141). Its proof (LWX lines 1159–1165) gives `[cz+d]=[d₀](1+T)^(log((cz+d)/d₀)/q)`.
  - [LWX] Lemma 3.15, p. 21 (LWX lines 1215–1218), for §5.6.

### Cross-roadmap citations and ownership

**Suppliers.** All are on main at `8101f2c`:
- RestrictedPowerSeries §0.3 (line 224), §1.1 (247), §1.3 (277), §§2.1–2.3 (306, 324, 340), §2.4 (Strassmann, 364, used in the §5.4 Check) and §7.1 (704). §2.2's contractive substitution covers composing with `σ`, `τ` and `w'=aw` over a complete `K`.
- NewtonPolygons Layer 1 and §1.1 (442, 444).
- AdicSpaces Layer 0 (135).
- ProfiniteProPGroups Layer 9 prerequisites (2192, 2287).
- LocalFieldsRamification Layer 1 (281), with `deepUnitExpLogEquiv` (411).

**Consumers.** All are on main:
- AdicSpacesPartII §R0.4 (2270);
- AdicSpacesPartIII R3.6 (95–101);
- CompactOperators (24);
- PadicMeasuresIwasawaAlgebras.

**Ownership against open pull requests.**
- `roadmaps grep PadicFunctionalAnalysis` shows that LocallyAnalyticDistributions (open) cites §§1.4, 2.1, 2.2, 2.6, 4.3, 4.4, 4.6 and 4.7 as its supplier, and PerfectoidTowers (open) cites §§2.2–2.4. All of these sections exist.
- LocallyAnalyticDistributions restates the generator change `T′=(1+T)^u−1`, which is this roadmap's §5.2 target, already on main (main README line 877). By the ownership rule, the open roadmap is the one to cite. This is not a finding here.
- No open roadmap states §5.4's weight criterion.
- The §5.3 isomorphism `Λ≃ℤ_p[Δ]⟦T⟧` is a central remaining target, not an end theorem. The pinned `prodPowerSeriesCoordinate` covers the product case.

**Overlaps.** #1808 and #1854 also change this folder. The description's merge-order block orders "`PadicFunctionalAnalysis`: this pull request → #1808 → #1854". No dropped or revision-only id is listed.

### Adversarial table

| Statement | Instance | Left side | Right side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| `amiceMap_bijective_and_norm_eq` | `p=2,h=1,E=ℤ_2`, `c=single 2 1` | discs: `2w²−w`, `2w²+w`; stage norm `max(‖−1‖,‖2‖)=1` | `‖single 2 1‖=1` | isometric | none |
| same | `E=0` | `C₀(ℕ,0)=0` | `LA_h(0)=0` | bijective, norms 0 | none |
| `isOrthonormalBasis_amiceTerm` | `p=2,h=1,n=0,1,2` | `(1;1)`, `(0,2;1,2)`, `(0,−1,2;0,1,2)` | mod 2: `(1;1)`, `(0,0;1,0)`, `(0,1,0;0,1,0)` | independent, norm 1 | none |
| `exists_eval_eq_addChar_iff` | `p=2,h=0,t=2` | coordinates `2ⁿ/n!`, `v=s_2(n)`, not `→∞` | `‖2‖=2⁻¹=r_0`, not `<` | both false | none |
| same | `p=3,h=0,t=3` | `v(3ⁿ/n!)=(n+s_3(n))/2→∞` | `3⁻¹<3^(−1/2)` | both true | none |
| §4.6 radius equivalence | `p=2,h=1,t=√2` | `‖(1+t)²−1‖=‖2(1+√2)‖=2⁻¹`, not `<r_p` | `‖t‖=2^(−1/2)=r_1`, not `<` | both fail | none |
| `amiceTransform_distribution_bijective` | `μ'(f)=f'(0)` | `b_n=(−1)^(n−1)/n`, `‖μ'‖_h=p^h` | `log(1+T)` on the open disc, unbounded | distribution, not measure | none |
| same | `b_n=1/n!` | `D_0=1`; at level 1 `‖⌊n/p⌋!/n!‖=p^⌊n/p⌋→∞` | `exp(T)` has radius `r_p<1` | excluded on both sides | none |
| `binomialLA` | `p=2,n=2` | level 0: `(x²−x)/2`, norm 2 | level 1: `2w²∓w`, norm 1 | `=‖m_h(2)‖⁻¹` | none |
| §4.7 convolution | `μ'∗μ'` | `b_2=1`, `b_3=−1` | `log(1+T)²`: `1,−1,11/12` | agree | none |
| `exists_character_of_hasEval` | `S=𝔽_p[ε]/ε²` discrete, `z=ε` | `κ(γ^s)=1+sε` | coordinate `ε` | unique | none |
| same | `p=2,S=ℤ_2,z=2` | `κ(γ)=3` | `2` topologically nilpotent | holds | none |
| `eq_aeval_binomialSeries` | `κ=x^k`, `k` odd, `x=−1` | `ω(−1)^k·1=−1` | dropping the finite part: `1` | discriminates | none |
| `amiceTransform_completedGroupAlgebra_compat` | `μ=δ_a` | `(1+X)^a↦[ofAdd a]` | `completedGroupAlgebraEquiv δ_(ofAdd a)=[ofAdd a]` | agree | none |
| `measurePairing_injective` | odd `p`, `δ_1−δ_(1+p)` | trivial weight: `0` | `κ=x`: `−p≠0` | separated | none |
| `exists_eval_eq_weight_iff` | trivial `κ` | `f=1` | `0<r_h` | both true | none |
| same | odd `p`, `κ=x`, `h=0` | `x` is a polynomial on each unit disc | `‖exp p−1‖=p⁻¹<p^(−1/(p−1))` | both true | none |
| same | `p=3`, `ψ` of conductor 9, `h=0` | 3 values on each coset of `1+3ℤ_3` | `‖ζ_3−1‖=3^(−1/2)=r_0` | both false | none |
| same | same `ψ`, `h=1` | constant on cosets of `1+9ℤ_3` | `3^(−1/2)<3^(−1/6)=r_1` | both true | none |
| same | `p=2`, sign weight, `h=0` | constant on cosets of `1+4ℤ_2` | `T=0<2⁻¹` | both true | none |
| same, unit level | `p=2`, sign weight, `h'=1` | `G(w)=±1` by parity of `w`; Strassmann: not analytic | `T=0<r_h` | would fail; Lean excludes `h'=1` | none |
| §5.4 route | `τ` at `h'=1`, `n=4`; `σ` at `h'=2` | `v(2³/4!)=0` | `v(4^(n−1)/n)≥n−1` | not null; null | none |
| R01 block | trivial `κ` | `t=0`, `log 1=0` | `κ(d₁)·exp 0=1` | `F=1` | R01 |
| same | `κ=x`, odd `p`, `h=0` | `log(exp p)=p` | `cz+d`, coefficient norms `1`, `≤p⁻¹` | holds | R01 |
| same | `p=2`, sign weight | `κ=1` on `1+4ℤ_2` | `exp(log x/4·log 1)=1` | holds | R01 |
| same | scratch splice | elaborates | exit 0, eleven `sorry`; probe does not close | statable | R01 |
| §1.3 | `ℚ_p²`, `‖(x,y)‖=|x|+|y|` | `‖(1,0)+(0,1)‖=2` | `max=1` | no orthogonal basis | R02 |
| Convention 10 | `ℚ_p×ℚ_p`, sup norm | `(1,0)(0,1)=0` | `(p,p)`: norm `p⁻¹`, nilpotent; `(1,0)`: norm 1, idempotent | equivalence holds | R03 |
| `r_2` | lines 1206 and 1225 | `amiceRadius 2 2=2^(−1/4)` | `‖2‖=2⁻¹` | `2⁻¹=r_2` false | R04 |
| §4.5 coefficient bound | odd `p`, `z=p`, `n=p` | `‖p^p/p!‖=p^(1−p)` | `‖z‖(‖z‖/r_p)^(p−1)=p^(1−p)` | sharp | none |
| §4.5 with [Col] | `p=2,t=4,x=1` | `5` | `exp(log 5)=5`, `‖4‖<2⁻¹` | agree, `n(δ)=2` | none |
| [Col] at `n(δ)=1` | `p=2,x=−1`, `δ(−1)=1`, `δ=y` on `1+4ℤ_2` | `δ(−1)=1=exp(log(−1))` | `Σ binom(1,n)(−2)ⁿ=−1` | source fails; README uses `n(δ)=2` | Source issues |
| `mem_span_iff_forall_eval_annulus` | `TU−p`; `T` | `t(p/t)−p=0`; `t≠0` | in span; `T∉(TU−p)` | agree | none |
| §5.2 valuations | `p=5,m=2`; `p=2,m=3` | `v(ζ_5−1)=1/4`; `ψ(γ)=−1`, `v(−2)=1` | `1/(5⁰·4)`; `1/2⁰` | agree | none |
| §0.3 Check | `a=p^(−n)` | `|a|²=p^(2n)` | `C|a|=Cp^n` | no linear `C` | none |
| §0.4 Checks | `(ℤ_p,p²,p)`; `N=max(|x|,|x|²)` | `g(p)=1`, `g(p²)=p⁻¹` | `g(p)²≠g(p²)`; `N(ϖ)N(ϖ⁻¹)=r⁻¹>1` | as stated | none |
| §1.1 Neumann | `E=0` | inverse norm `0` | pinned lemma needs `[Nontrivial E]` | consistent | none |
| §3.2 Check | `E=0`, `g=p⁻¹` | zero map, contractive | `‖g‖=p` | needs `E≠0` | none |
| §3.4 Check | `φδ₁` | `1+T↦(1+T)^p` | `δ_p` | agree | none |
| §5.5 Check | `κ=x`, `h'=v_p(q)`, `r=1` | `‖c‖‖q‖≤‖q‖²` | `<‖q‖r_p` | holds | none |
| §5.6 `H` Checks | `T⁻¹`; `ΣU^j` | `d_(−1)=1`, needs `v≥1`; `‖U^j‖=1` | non-unit; partial sums do not converge | as stated | none |

## Not verifiable

- [Sch], [BGR] and [Bel] are settled as uncertified and cited by locator. R02 asks for a locator in one of the first two; I did not read them.
- [Am] is an OCR'd scan. Its §4.4 and §4.5 locators were checked in the previous review and are unchanged; they were not re-read.
- [Mah] was not opened. Mahler's theorem enters only through the pinned `PadicInt.mahlerEquiv`.
- Ownership against open pull requests was checked with `roadmaps grep`, with `roadmaps show LocallyAnalyticDistributions`, and with the overlaps index.

## Source issues

- **Gap** in KL at Remark 2.4.4, p. 39: the source says that for a topologically nilpotent unit `z` and a ring of definition `A₀`, `inf{cⁿ : z^(−n)x∈A₀}` makes `A` a Banach ring; it should require `z∈A₀` (after replacing `z` by a power), and `A` complete and Hausdorff; affects a stated result.
- **Error** in Col at §I.6, p. 27: the source says any `n(δ)≥1` with `v_p(δ(x)−1)≥v_p(2p)` on `1+p^(n(δ))ℤ_p` gives `δ(x)=Σ binom(w(δ),n)(x−1)ⁿ` there; it should require `n(δ)≥v_p(2p)`, since at `p=2`, `δ` trivial on `−1` with `δ(y)=y` on `1+4ℤ_2` allows `n(δ)=1` and fails at `x=−1`; affects a stated result.

## Previous findings (review of `8e289d9`)

- **R01 (P2), §5.4's coset form: repaired.**
  - `Suggested.lean` lines 205–223 state `exists_eval_eq_weight_iff` as proposed.
  - README line 216 lists it, and line 33 reads "§§4.4, 4.6, 4.7, 5.3, 5.4 and 5.6".
  - Lines 1408–1409 name it at the criterion. The route (lines 1412–1426) and the *Needs:* line (1438–1445) add RestrictedPowerSeries §2.2, with `Padic.log_exp` and `Padic.exp_log` for `σ` and `τ`.
  - The docstring (lines 39–43) now names it. The remaining §5.5 sentence of that docstring is this review's R01.
- **R02 (P3), §4.5 locators: repaired.**
  - Lines 984–991 now read the [Col] §I.6 expansion with the base in `ℚ_p`, `w(δ)=x` and `n(δ)=v_p(2p)`.
  - Lines 969–981 add [Buz] §8, p. 62, for the exponential and logarithm (verified above), with the coefficient bound and `NormedSpace.exp_add_of_mem_ball`.
  - The reference entry (lines 1686–1690) and the Layer 4 sources (line 1233) are updated.
