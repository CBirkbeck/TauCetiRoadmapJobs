# Review of PadicFunctionalAnalysis (pull request #1807 at 8e289d9)

**Verdict:** needs changes

This is a full re-review. The folder changed by 311 lines since `7959c07`, and the pins are unchanged (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`). Four of the five previous findings are repaired and one is partly repaired; see "Previous findings" at the end.

There are two findings:
- **R01 is blocking.** The docstring that the previous review's R02 told the author to write says that §5.4's coset form is not statable. In fact it elaborates on the pinned stage carrier. This corrects that review's suggested wording; deleting the principal-part form was still right.
- **R02** covers a §4.5 locator: the cited source does not state the result as the README attributes it.

The gate (apart from this pull request's own folders), the dependency check, elaboration and the padding probe all pass.

## R01 (P2) — §5.4's coset form is statable on `TauCeti.AnalyticStage`; the docstring says it is not

**Location.**
- `Suggested.lean` lines 44–45: "its form on `ℤ_pˣ`, analyticity of `κ` on the cosets of `1 + p^(h') ℤ_p`, needs locally analytic functions on `ℤ_pˣ`, and the only pinned carrier, `TauCeti.LocallyAnalytic`, lives on `ℤ_p`."
- README §5.4, lines 1379–1388: "What this section adds is the reading on `ℤ_pˣ` … `κ` is analytic on unit discs modulo `p^(h')` exactly when …". The Summary (line 11) lists "the analytic levels of weights" among the end theorems.

**Claim.** The headline that `κ` is analytic on the cosets of `1+p^(h')ℤ_p` exactly when `‖T_κ‖<r_(h'−v_p(q))` has no carrier at the pins.

**Witness.** For `h'≥1` the cosets of `1+p^(h')ℤ_p` are the discs `a+p^(h')ℤ_p`, `p∤a`, of `ℤ_p`. So analyticity on them means agreement on `ℤ_pˣ` with `TauCeti.AnalyticStage.eval ℤ_[p] f`, `f : TauCeti.AnalyticStage p h' K`. The block below elaborates.

**Repair.**
1. Add this block to `Suggested.lean`, after `measurePairing_injective`:

   ```lean
   /-- **The analytic level of a weight** (§5.4). For a weight `κ` with values in a complete
   ultrametric normed `ℚ_p`-algebra `K` with multiplicative norm, and a unit level
   `h' = h + v_p(q)`, `κ` is analytic on the unit discs modulo `p^(h')`, that is, agrees on `ℤ_pˣ`
   with the evaluation of a vector of the stage `LA_(h')(K)`, exactly when
   `‖T_κ‖ < r_h = p^(−q/((p−1)p^(h')))`. -/
   theorem exists_eval_eq_weight_iff (h : ℕ) {K : Type*} [NormedRing K] [NormMulClass K]
       [NormOneClass K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [Module ℚ_[p] K]
       [NormSMulClass ℚ_[p] K] [IsUltrametricDist K] [CompleteSpace K]
       (κ : TauCeti.WeightSpace p K) :
       (∃ f : TauCeti.AnalyticStage p (h + TauCeti.padicUnitsDepth p) K,
           ∀ x : ℤ_[p]ˣ, TauCeti.AnalyticStage.eval ℤ_[p] f (x : ℤ_[p]) = (κ x : K)) ↔
         ‖κ.coord‖ < TauCeti.amiceRadius p h := by
     sorry
   ```

   Writing `h' = h + padicUnitsDepth p` avoids natural-number subtraction and builds in `h'≥v_p(q)`. At `p=2` with `h'=1` the statement would be false: the sign weight is not analytic on `1+2ℤ_2`, and `exp(2)` diverges.
2. In the README:
   - name `exists_eval_eq_weight_iff` at the coset criterion (line 1383);
   - add it to the list at lines 210–215;
   - change line 33 to "§§4.4, 4.6, 4.7, 5.3, 5.4 and 5.6".
   - Add to the §5.4 *Needs:* line (1401–1404) the inputs of the coordinate change on a coset `a(1+p^(h')ℤ_p)`, with `x=a(1+p^(h')w)`. These are RestrictedPowerSeries §2.2 (substitution) and the first two targets of §4.5, which give two integral restricted series inverse to each other: `w↦log(1+p^(h')w)/p^(h')` and `y↦(exp(p^(h')y)−1)/p^(h')`.
3. In the docstring (lines 41–45), keep the principal-part sentence. Replace the rest with: the form on `ℤ_pˣ` is `exists_eval_eq_weight_iff`, on the stage carrier restricted to units. Then change "Three headline targets are not stated here" to name only §5.5 and the Banach–Tate structure of §5.6.

**Tested.**
- **Elaboration.** The block, spliced into a scratch copy of this head's `Suggested.lean`, elaborates with exit 0. The only output is ten `declaration uses sorry` warnings.
- **"If".** Write `x=a(1+p^(h')w)`, so that `κ(x)=κ(a)·(1+T')^(σ(w))`, where:
  - `T'=(1+T_κ)^(p^h)−1`;
  - `σ(w)=log(1+p^(h')w)/p^(h')` has integral coefficients, since `h'(n−1)≥v_p(n)`.

  Now `‖T'‖<r_p⇔‖T_κ‖<r_h` (§4.6). Then `exp(σ(w)log(1+T'))` is a restricted series in `w`, because `‖log(1+T')‖^n‖1/n!‖→0`.
- **"Only if".** Compose the series on the disc of `1` with `τ(y)=(exp(p^(h')y)−1)/p^(h')`, which is integral because `h'≥v_p(q)`. This gives `χ_(T')` at level 0. Then §4.6 at `h=0` gives `‖T'‖<r_p`.
- **Instances.**
  - The trivial weight: both sides are true (`0<r_h`).
  - `κ(x)=x` over `ℚ_p` at `h=0`: `x` is a polynomial, and `‖q‖<r_0`.
  - At `p=2`, the weight `x↦ε(x mod 4)` at `h=0`: it is constant on the unit discs mod 4, and `T=0`.
  - At odd `p`, `ψ` of conductor `p^m`: `‖ψ(γ)−1‖=r_(m−2)`, which is `<r_h` iff `h'=h+1≥m`. This matches the README's conductor bound `h'≥max(m,v_p(q))`.

## R02 (P3) — §4.5: [Col] §I.6 states the expansion for a base in `ℤ_p`, not over `ℂ_p`; the exponential facts have no locator

**Location.**
- README §4.5, second target, lines 976–978: "Over `ℂ_p` the identity is the expansion `exp(w log x)=Σ_n binom(w,n)(x−1)^n` of [Col] §I.6, p. 27, near `x=1`".
- First target, lines 967–970: only the logarithm is cited.

**Claim.** [Col] §I.6 states the identity `(1+t)^x=exp(x log(1+t))` for `t∈ℂ_p`, with exponent `x∈ℤ_p`.

**Witness.** [Col] line 1352 states `δ(x)=exp(w(δ)log x)=Σ binom(w(δ),n)(x−1)^n` for a base `x∈1+p^(n(δ))ℤ_p` and an exponent `w(δ)∈ℂ_p`. That is the transposed case. A base `1+t` with `t∈ℂ_p∖ℚ_p` is not covered.

**Repair.**
- Replace the sentence at lines 976–978 with: "Over `ℚ_p`, where `‖t‖<r_p` means `t∈2pℤ_p`, the identity is the case `w∈ℤ_p`, `y=1+t∈1+2pℤ_p`, of the expansion `exp(w log y)=Σ_n binom(w,n)(y−1)^n` of [Col] §I.6, p. 27 (with `n(δ)=v_p(2p)` for `δ=y^w`)."
- Keep the [Am] Proposition 15 and §16.2 clause; those are verified below.
- For the first target's exponential facts (domain `‖z‖<r_p`, `log∘exp`, `exp∘log`, `exp(z+z')`, the two bounds), add a standard locator. The pinned `NumberTheory/Padics/ExpLog.lean`, which proves the scalar case, cites Neukirch, *Algebraic Number Theory*, Chapter II, Proposition (5.5). If you cite it, add it to the references as uncertified.

**Tested.**
- Col lines 1344–1352 give `n(δ)` with `v_p(δ(x)−1)≥v_p(2p)` for `v_p(x−1)≥n(δ)`.
- For `δ=y^w` with `w∈ℤ_p`, `n(δ)=v_p(2p)` works. That is exactly the set `‖t‖<r_p` in `ℚ_p`: `pℤ_p` for odd `p` (`p⁻¹<p^(−1/(p−1))`), and `4ℤ_2` at `p=2` (`4⁻¹<2⁻¹=‖2‖`).

## Verified sound

### Gate, dependency check, elaboration, signatures

**Gate.**
- The worker's gate at `8e289d9` reports every counter zero: `OK`.
- My run of `gate … --base origin/main` reports `outside-folder=26` and zero for every other counter. The 26 files are `README.md` and `Suggested.lean` in the 13 folders that the brief names as this pull request's own, and the exclusion diff is empty. This is not a finding.
- `PROGRESS.md`, `STATUS.md` and `metadata.toml` are unchanged from main.

**Dependency check.**

```text
depcheck: 234 roadmaps, 2265 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/PadicFunctionalAnalysis/Suggested.lean` exits 0. The only output is nine `declaration uses sorry` warnings, at lines 72, 82, 96, 140, 164, 173, 187, 200 and 211.

**Signatures.** I elaborated `#check @` for all 11 declarations in one scratch file. Every elaborated type equals `signatures.md`, so no binder is lost, and each matches the README's generality.

**Padding probe.** I replaced every `sorry` by `first | rfl | infer_instance | (simp; done) | (simp_all; done) | aesop | decide`. None of the nine closes.
- `measurePairing_injective` is not a corollary of the pinned `TauCeti.measureFun_injective`. That lemma's input, `AbstractMeasure.units_eq_zero_of_positive_moments` (`Measure/Units/Moments.lean:62`), is stated for `ℤ_p`-valued measures only.
- The proved `example` (lines 129–134) checks the `(n!)⁻¹` normalisation of `binomialLA`, which is a nontrivial test of a kept definition.

### Library names resolved at the pins

- **All 332 qualified backticked names** in the README resolve:
  - 302 by `#check @` against Mathlib and 120 built Tau Ceti modules;
  - 30 by source in unbuilt modules. For example, `ContinuousLinearMap.mapCoeffs` is at `Topology/ContinuousMap/ZeroAtInfty/BaseChange.lean:47`, `ZeroAtInftyContinuousMap.diagonalCLM` at `ZeroAtInfty/Diagonal.lean:74`, `ContinuousLinearMap.rowNorm` at `Analysis/Normed/Operator/RowCompact.lean:91`, `TauCeti.Huber.BanachModule.CompletedTensor` with `lift`/`map` at `RingTheory/Huber/BanachModule/CompletedTensor.lean:201, 314, 383`, and `RingEquiv.exists_pos_norm_le_mul_rpow` at `Analysis/Normed/Ring/PowerComparison.lean:108`.
  - `TauCeti.RingOpNorm` is the namespace of the scoped instances, as line 96 says.
- **Opened and compared with the README:**
  - `HasSum.norm_eq_of_forall_norm_lt` (`Analysis/Normed/Group/NullFamily.lean:92`), the dominant-term input of §5.6;
  - `Matrix.isometry_toZeroAtInftySMulCLM`, `surjective_…` and `toZeroAtInftySMulLinearIsometryEquiv` (`ZeroAtInfty/Triangular.lean:122–240`), for §2.7;
  - `ZeroAtInftyContinuousMap.linearCombinationEquiv` (`LinearCombination.lean:284`, commutative ring with a multiplicative pseudo-uniformiser), for §2.5;
  - `ContinuousLinearMap.exists_preimage_norm_le_of_isTate` (`RingOpNorm/OpenMapping.lean:294`), for §1.2;
  - `TauCeti.exists_isOrthonormalBasis_iff` (`Bases/Orthonormal.lean:463`), for §2.2, whose statement is the displayed equivalence at README line 508;
  - `AbstractMeasure.mem_range_amiceTransform_iff` (`Measure/MahlerDuality.lean:186`, an `IsTate` section, so it covers fields through `IsTate.of_nontriviallyNormedField`) and Mathlib's `AbstractMeasure.injective_amiceTransform` and `coeff_amiceTransform` (`Measure/AmiceTransform.lean:83, 94`), for the new "Bounded measures" target and the restriction bullet;
  - `TauCeti.WeightSpace.coord`, `principalChar` and `principalChar_eq_addChar_of_value_at_one` (`WeightSpace.lean:122–188`), `TauCeti.padicUnitsDepth` (`UnitsDecomposition/Logarithm.lean:75`) and `TauCeti.AnalyticStage.eval` (`Distribution/AnalyticStage.lean:194`), for R01.
- **No pinned version of a headline.**
  - No Tau Ceti file mentions both `WeightSpace` and `AnalyticStage`.
  - Tau Ceti's `NodeAlgebra R a=R[x,y]/(xy−a)` (`RingTheory/Node/Basic.lean`) is the polynomial ring, not `ℤ_p⟦T,U⟧/(TU−p)`.
  - The pinned Banach-algebra logarithm lemmas (`Analysis/Normed/Algebra/Logarithm/Basic.lean:66–71`, `Inverse.lean:131`) assume `ContinuousSMul ℚ≥0 𝕂` or `NormedAlgebra ℚ A`, which exclude `ℚ_p`-algebras. So §4.5's first target is not at the pins.

### Seeded sample and locators

Each locator below was checked at its line, with its page, its hypotheses, and the statement as written.

- **§0.1, §1.2, §2.2, §2.5, §2.7.** These cite pinned declarations only; each was opened above.
- **§0.4.** [JN] Remark 2.1.3(1), p. 8 (JN lines 397–402): the norm `inf{a^(−n): r∈ϖ^nR₀}` with `ϖ` in a ring of definition. [KL] Remark 2.4.4, p. 39 (KL lines 1538–1544) omits that membership; see Source issues.
- **§1.4.** [JN] §2.1, p. 8 (JN lines 422–428): open mapping, and [BGR] §3.7.2–3.7.3 carried over to Noetherian Banach–Tate rings.
- **§2.3.** [Serre] Proposition 1, p. 70 (Serre lines 60–62), discrete valuation with condition (N), and the renorming at lines 49–51.
- **§3.2, §3.4.** No source beyond the pinned declarations; the §3.4 Checks are pinned examples.
- **§4.4.** [Am] Théorème 2, p. 150 (Amice page 35 of the scan, line 1226), with the scan's page offset of 115. [Col] Théorème I.4.7 and Corollaire I.4.8, p. 15 (Col lines 712–714).
- **§4.5.**
  - [Am] Proposition 15, p. 177 (Amice line 2121): continuous extension of `n↦a^n` to `ℤ_p` iff `v(a−1)>0`, with the binomial formula, for `a` in the completed algebraic closure.
  - [Am] §16.2, p. 177 (Amice lines 2131–2133): `a=exp p` gives `exp(px)`.
  - [Col] §I.6, p. 27 (Col lines 1331–1338): the logarithm series and its functional equation. The other use of this locator is R02.
- **§4.6.** [Col] Lemme II.2.1, p. 30 (Col line 1492), with [Am] Corollaire 1(c), p. 161.
- **§4.7.**
  - [Col] §II.2, p. 29 (Col line 1457);
  - Théorème II.2.2, p. 30 (Col line 1502);
  - §II.3 no. 2, p. 31 (Col lines 1567–1570): a series with bounded coefficients gives a measure, as the new "Bounded measures" target says;
  - §II.4 no. 6, p. 36 (Col lines 1899–1912): convolution `∫φ(x+y)λ(x)µ(y)` with `A_(λ∗µ)=A_λA_µ`, which is the README's convention, and Lemme II.4.2 (Col line 1915);
  - [ST] Theorem 2.2, p. 9 of arXiv math/0102012v1 (ST line 316), which is now stated in the reference entry.
- **§5.2, §5.3.**
  - [LWX] Notation 2.1, p. 8 (LWX lines 349–356): `Λ≅ℤ_p[Δ]⊗ℤ_p⟦T⟧`, `T=[exp(q)]−1`, every `ℂ_p`-valued character;
  - [LWX] §1.14, p. 8 (LWX line 338): `q=4` at `p=2`;
  - [RJW] Remark 3.47, pp. 25–26 (RJW lines 1492–1516): `p−1` copies of `B(0,1)`, and measures as bounded functions on `W`, for odd `p` (RJW line 404).
- **§5.4.** [Col] §I.6, p. 27 (Col lines 1339–1354): a continuous character of `ℚ_pˣ` is `exp(w log x)` on `1+p^(n(δ))ℤ_p`, hence analytic on the cosets.
- **§5.5.** [LWX] Proposition 3.14, p. 21 (LWX line 1141), whose proof at LWX lines 1159–1165 gives `[cz+d]=[d₀](1+T)^(log((cz+d)/d₀)/q)` for `c∈qℤ_p`, `d∈ℤ_pˣ`, that is `h'=v_p(q)`.

### Cross-roadmap citations (main `641eaf3` and open heads)

- **Suppliers, all on main:**
  - RestrictedPowerSeries §0.3 (line 224), §1.1 (247), §1.3 (277), §§2.1–2.3 (306, 324, 340) and §7.1 (704);
  - NewtonPolygons Layer 1 and §1.1 (442, 444);
  - AdicSpaces Layer 0 (135);
  - ProfiniteProPGroups Layer 9, completed group algebra and `powerSeriesCoordinate` (2192, 2287);
  - LocalFieldsRamification Layer 1 (281) with `deepUnitExpLogEquiv` (411).
- **Consumers.**
  - All 20 qualified `TauCetiRoadmap.PadicFunctionalAnalysis.*` names cited on main are mapped in the consumer table (lines 1594–1620).
  - QuaternionicModularForms (open) consumes §§4.6, 5.2–5.5 and §5.6's `H` as supplier, not owner.
  - LocallyAnalyticDistributions (open) defers to this roadmap the stages, Amice's theorem, distributions, point masses and convolution on `ℤ_p`, in its scope paragraph on Banach modules and stages. Its earlier scope bullet on the "operator dictionary" is that roadmap's own wording to settle.
  - ColemanIntegration (open) cites §4.5. Its L0.21, transcendence of a logarithm branch over Laurent series on an annulus, is a different statement from §5.6's joint injectivity.
  - DirichletPadicLFunctions (open) cites §§5.1–5.2, and both exist.
- **Overlaps.** #1808 and #1854 carry other revisions of this folder. The description's merge-order block orders them after this pull request. No dropped or revision-only id is listed, and `roadmaps grep` finds the removed `exists_eval_eq_principalChar_iff` cited nowhere outside this folder's revisions.

### Adversarial table

| Statement | Instance | Left side | Right side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| `amiceMap_bijective_and_norm_eq` | `E=0` | `C₀(ℕ,0)=0` | `LA_h(0)=0`, norms 0 | holds | none |
| same | `p=2,h=0,E=ℤ_2`, `n=2` | `e_(0,2)=x²−x ↦ (0,−1,1)` | norm 1 `=‖single 2 1‖` | holds | none |
| same | torsion `E=𝔽_p`, trivial norm | integral matrix with integral inverse (from `E=ℤ_p`) | acts on finitely supported vectors | bijective, isometric | none |
| `isOrthonormalBasis_amiceTerm` | `p=2,h=1`, `n=0,1,2` | `(1;1)`, `(0,2;1,2)`, `(0,−1,2;0,1,2)` | norms 1; reductions mod 2 independent | holds | none |
| `exists_eval_eq_addChar_iff` | `p=2,h=0,t=2` | `3^x=(−1)^x(−3)^x`, not level 0 | `‖2‖=1/2=r_0`, not `<` | both false | none |
| same | `p=3,h=0,t=3`; `p=2,h=1,t=2` | coords `→0`; level 1 | `1/3<3^(−1/2)`; `1/2<2^(−1/2)` | both true | none |
| `binomialLA` | `p=2,n=2` | level 0: `(0,−1/2,1/2)`, norm 2 | level 1: `2w²∓w`, norm 1 | `=‖m_h(2)‖⁻¹` | none |
| `amiceTransform_distribution_bijective` | `μ'(f)=f'(0)`; `b_n=1/n!` | `b_n=(−1)^(n−1)/n`; `D_0=1, D_1=∞` | `log(1+T)` on open disc; `exp(T)` radius `r_p<1` | holds; excluded both sides | none |
| §4.7 bounded measures | `δ_(−1)`; `μ'` | moments `(−1)^n`, bounded; `±1/n`, unbounded | `dirac(−1)`; `log(1+T)` not in range | consistent | none |
| §4.7 convolution | `δ_1∗δ_1`; `μ'∗μ'` | `δ_2` (`δ_0` under `f(x−y)`); `f''(0)`, `b_2=1`, `b_3=−1` | `(1+T)²`; `log(1+T)²` coeffs `1,−1,11/12` | discriminates | none |
| same, bound at `p=2` | `D_0(μ'∗μ')` | `sup‖2(n−1)!H_(n−1)‖=1/2` | `‖μ'‖_0²=1` | `≤`, strict | none |
| `exists_character_of_hasEval` | `S=0`; `S=ℤ_p,z=p`; discrete `ℤ_p[ε]/ε²,z=ε` | unique; `κ(γ)=1+p`; `1+s(x)ε` | coord `0`; `p`; `ε` | holds | none |
| `eq_aeval_binomialSeries` | `x=γ`; `x=ω(δ)` | `κ(γ)`; `κ(ωδ)` | `1·(1+T)`; `finiteChar δ·1` | agree | none |
| `amiceTransform_completedGroupAlgebra_compat` | `μ=δ_a`; `μ=0` | `(1+X)^a↦[ofAdd a]`; `0` | `[ofAdd a]`; `0` | agree | none |
| `measurePairing_injective` | `p` odd: `δ_1−δ_(1+p)`; `p=2`: `δ_1−δ_(−1)` | `κ=x`: `−p≠0`; `ε`: `2≠0` | trivial weight: `0` | separated | none |
| `mem_span_iff_forall_eval_annulus` | `TU−p`; `T`; `p` | `t(p/t)−p=0`; `t≠0`; `p≠0` | in span; image `T≠0` in `H`; image `p≠0` | agrees | none |
| same | `Σ_jU^j` | value `t/(t−p)≠0` | normal form `d_(−j)=p^j≠0` | not in span, agrees | none |
| same, junk value of `tsum` | any `f`, `p⁻¹<|t|<1` | `|a t^i(p/t)^j|≤|t|^i(p⁻¹/|t|)^j→0` | summable, true sum | no junk | none |
| same, normal form | `f=TU` | `d_0=a_11 p=p` | `d_m=Σ_(i−j=m)a_ij p^j` | matches | none |
| §5.4 coset form | trivial; `κ=x`, `h=0`; `p=2` sign | true; polynomial; constant on unit discs mod 4 | `0<r_h`; `‖q‖<r_0`; `T=0` | agree | R01 |
| same | odd `p`, `ψ` conductor `p^m` | analytic iff `h'≥m` | `r_(m−2)<r_h` iff `h≥m−1` | agree | R01 |
| same | scratch elaboration | block spliced | exit 0, ten `sorry` warnings | statable | R01 |
| §4.5 second target vs [Col] | Col line 1352 | base `∈1+p^(n(δ))ℤ_p`, exponent `∈ℂ_p` | README: base `1+t`, `t∈ℂ_p`, exponent `∈ℤ_p` | not covered | R02 |
| §5.6 `H` Checks | `T⁻¹`; `U⁻¹`; `‖U^j‖` | `d_(−1)=1`, `v=0<1`; `d_1=p⁻¹`; `U^j/T`: `v=j<j+1` | non-units; `‖U^j‖=1` | as stated | none |
| same, `p=2` | idempotent `a+bδ` | `a²+b²=a`, `b(2a−1)=0` | `2a−1` unit in local `H` (`2∈(T,U)`) | only `0,1` | none |
| Layer 5 at `p=2` | `x↦ε(x mod 4)`; `κ=x` | `exp(4)≡1 mod 4`, so `T=0` | `‖exp 4−1‖=1/4` | as stated | none |
| same, specialisation | `κ=x^k`, `x=−1`, `k` odd | `ω(−1)^k·1=−1` | dropping finite part: `1` | discriminates | none |
| same, generator change | `u=−1`, `κ=x` | `exp(−q)−1=−T/(1+T)`, norm `‖q‖` | `−T` off by `T²/(1+T)`, norm `‖q‖²` | as stated | none |
| §0.3 Checks | `|a|²≤C|a|`, `a=p^(−n)`; rounding `|a|=p^(−1/2)` | `p^(2n)≤Cp^n` fails; rounded `‖a·1‖=1` | power comparison exponent 2; `|a|·1=p^(−1/2)` | as stated | none |
| §0.4 `ϖ∉A₀` | `A₀={x≡y mod p²}`, `ϖ=(p,p²)` | `g(1)=1` (`n=0`), `g(ϖ)=a⁻¹`, `g(1+ϖ)=a²` (`n=−2`) | `max(1,a⁻¹)=1<a²` | ultrametricity fails | none |
| §2 transpose adapter | `v(a,b)=(b,a,0)`, `u(x,y,z)=(x,y)` | `B(v)B(u)=` swap | `B(u)B(v)`: `1` at `(0,1),(1,0)` only | as stated | none |
| §2 ONable Check | `‖x‖=p^(1/2)|x|_p` | norms `p^(1/2)p^ℤ` | disjoint from `p^ℤ` | not ONable | none |
| §2 shifts | backward; forward | entries `(i,i+1)`, norm 1 | entries `(i+1,i)`, isometry | as stated | none |
| §3.2 | `E=0`, `g=p⁻¹` | zero map, contractive | `‖g‖=p` | needs `E≠0` | none |
| §4.4 transition | `p=2,h=0,n=2` | `m_0(2)/m_1(2)=2` | `v=⌊2/2⌋=1` | Legendre holds | none |
| §5.4 level formula | `h=h'−v_p(q)` | `r_h=p^(−1/((p−1)p^h))` | `p^(−q/((p−1)p^(h')))` | equal | none |
| §5.5 | `κ=x`, `h'=v_p(q)`, `r=1` | `‖c‖‖q‖≤‖q‖²` | `<‖q‖r_p` | holds | none |
| §5.2 valuation | `p=5,m=2`; `p=2,m=3` | `v(ζ_5−1)=1/4`; `v(−2)=1` | `1/(p^0·4)`; `1/2^0` | agree | none |

## Not verifiable

- [Sch], [BGR] and [Bel] are settled as uncertified and cited by locator. [BGR] 2.7.1/4 and §3.7.3 were checked through their uses in [Conrad] and [JN] (JN lines 423–428).
- [Am] is an OCR'd scan with garbled formulas. Proposition 15 and §16.2 are clear in the text around them (Amice lines 2109–2133).
- [Mah] was not opened. Mahler's theorem is cited only through the pinned `PadicInt.mahlerEquiv`.
- Neukirch, Proposition II.(5.5), suggested in R02, was not read. It is the reference given by the pinned `NumberTheory/Padics/ExpLog.lean`.
- Ownership against open pull requests was checked with `roadmaps grep`, with `roadmaps show` for LocallyAnalyticDistributions, DirichletPadicLFunctions, ColemanPowerSeries, ColemanIntegration and QuaternionicModularForms, and with the overlaps index.

## Source issues

- **Gap** in KL at Remark 2.4.4, p. 39: the source says that for a topologically nilpotent unit `z` and any ring of definition `A₀`, `inf{cⁿ : z^(−n)x∈A₀}` is a Banach-ring norm; it should require `z∈A₀` (or a power of it), since `z=(p,p²)` with `A₀={x≡y mod p²}⊂ℚ_p²` breaks ultrametricity; affects a stated result.

## Previous findings

- **R01: repaired.**
  - `mem_span_iff_forall_eval_annulus` is stated (`Suggested.lean` lines 205–216) and named at README line 1476.
  - Line 33 reads "§§4.4, 4.6, 4.7, 5.3 and 5.6".
  - The docstring (lines 48–50) names the gauge on `H[1/T]` as the missing carrier.
- **R02: repaired as requested.** `exists_eval_eq_principalChar_iff` is gone, and README lines 1376–1379 read "This is §4.6's `exists_eval_eq_addChar_iff` at `t=T_κ`". The docstring sentence that this repair introduced is the subject of R01 above.
- **R03: repaired.**
  - Convolution has three Checks (lines 1161–1175).
  - The `H` Checks are split into four (lines 1530–1547).
  - The `p=2` Layer 5 Checks carry values (lines 1503–1518).
- **R04: partly repaired.**
  - Repaired:
    - §0.4: lines 344–346;
    - §1.4: lines 455–457;
    - §5.2: lines 1254–1255;
    - §5.3: lines 1303–1304;
    - §5.4: lines 1392–1394;
    - [ST]: lines 1650–1652.
  - Not repaired: for §4.5, lines 967–970 and 976–980 add [Col] §I.6 and [Am] Proposition 15/§16.2, but see R02.
- **R05: repaired.** The restriction bullet (lines 1059–1067) keeps only injectivity and `‖μ‖_h≤‖μ‖`. The image is the new "Bounded measures" target after the bijection (lines 1124–1132).
