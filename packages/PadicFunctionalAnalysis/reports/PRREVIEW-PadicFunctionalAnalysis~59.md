# Review of PadicFunctionalAnalysis (pull request #1807 at afdd14a)

**Verdict:** accepted

This is an incremental re-review of the 124 lines of `TauCetiRoadmap/PadicFunctionalAnalysis/` that changed since `d18ec2a`, in `README.md` and `Suggested.lean`. The pins are unchanged.

- All four findings of the previous review are repaired.
- The repairs introduce no new defect.
- The gate, the dependency check, elaboration, the signature comparison and the padding probe all pass.

This report has no findings.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 237–255 state `exists_powerSeries_hasSum_weight_factor`, with `d₁ u₀ c` quantified inside the second clause and `‖PowerSeries.coeff 0 F‖ = 1` added. The docstring (lines 26–28, 48–52) now lists §5.5; README lines 33, 224 and 1485–1497 name it.
- R02 — repaired: README lines 440–445 now read "for a finite-dimensional ultrametric normed space `V` (`IsUltrametricDist`) … ([CM] Remark 1.2.28, p. 70, and Corollary 1.2.31, p. 72)". The Layer 1 Checks (lines 493–502) add the (N) and `ℓ¹` examples.
- R03 — repaired: README lines 138–144: "A power-multiplicative norm, in particular a multiplicative one, makes this equivalent to `‖T_κ‖<1` (`TauCeti.isTopologicallyNilpotent_iff_norm_lt_one_of_isPowMul`); in general `‖T_κ‖` can be `1`".
- R04 — repaired:
  - Convention 9 (lines 126–129) fixes `r_p=p^(−1/(p−1))` and a numeral index as a level: "`r_p=2⁻¹` while `r_2=2^(−1/4)`".
  - Lines 1250–1252 and 1590 now read "`‖2‖=2⁻¹=r_p` at `p=2`".

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

**Gate.**
- The worker's gate at `afdd14a` reports every counter zero, `build=0`, `OK`.
- My run of `gate … --base origin/main` reports `outside-folder=26` and zero for every other counter it prints:

  ```text
  gate PadicFunctionalAnalysis: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=26 source-material=0 FAIL
  ```

- The 26 files are `README.md` and `Suggested.lean` in the 13 folders that the brief names as this pull request's own. The diff from `origin/main` (`5fc1aa8`) that excludes these 14 folders is empty.
- In this folder, only `README.md` and `Suggested.lean` differ from main.
- The files changed outside the folder since `d18ec2a` (BordismFormalGroups, ClassifyingSpaces, RigidAnalyticGeometry, TopologicalKTheory) are all among those 13 folders. Of them, only RigidAnalyticGeometry cites this roadmap: Layer 1 and §2.4, both present at this head.

**Dependency check.**

```text
depcheck: 236 roadmaps, 2135 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/PadicFunctionalAnalysis/Suggested.lean` exits 0. The only output is eleven `declaration uses sorry` warnings, at lines 74, 84, 98, 142, 166, 175, 189, 202, 218, 237 and 263.

**Signatures.**
- I elaborated `#check @` for all 13 declarations in one scratch file. Every elaborated type equals the one in `signatures.md`.
- `exists_powerSeries_hasSum_weight_factor` carries all its `K` binders in its own signature. Each of `NormedField`, `NormedAlgebra ℚ_[p]`, `Algebra ℤ_[p]`, `IsBoundedSMul ℤ_[p]`, `IsUltrametricDist` and `CompleteSpace` is present, and no binder is lost.

**Padding probe.**
- I ran `first | rfl | infer_instance | (simp; done) | (simp_all; done) | aesop | decide | exact?` on a scratch copy of `exists_powerSeries_hasSum_weight_factor`. It fails: `simp` leaves both clauses open and `aesop` fails.
- Its first clause needs `exp(s·log(1+t))=(1+t)^s` over an arbitrary complete `K`. At the pin this exists only over `ℚ_p` (`Padic.log_exp`, `Padic.exp_log`, `NumberTheory/Padics/ExpLog.lean:109, 115`), and Mathlib's `Logarithm.lean` lists ultrametric convergence as a TODO. So the theorem is not padding.

### The new §5.5 headline: `exists_powerSeries_hasSum_weight_factor`

**Statement.**
- `hκ : ‖κ.coord‖ < amiceRadius p h` is §5.4's level criterion.
- `1+t=κ(γ^(p^h))` with `γ=padicUnitsGenerator p=exp(q)` (`UnitsDecomposition/Logarithm.lean:243, 247`). So `1+t=κ(exp(p^(h+v_p(q))))=(1+T_κ)^(p^h)`.
- §4.6's equivalence (README line 1049, stated for a multiplicative norm, which `K` has as a field) turns `‖T_κ‖<r_h` into `‖t‖<r_p`.

**Proof of the first clause** (checked):
- For `x∈1+p^(h')ℤ_p`, `s=log x/p^(h')∈ℤ_p` and `x=γ^(p^h s)`, so `κ(x)=(1+t)^s`.
- `‖log(1+t)‖=‖t‖<r_p`, because `‖t^(n−1)/n‖<r_p^(n−1)p^(v_p(n))≤1` for `n≥2`.
- `exp(n·log(1+t))=(1+t)^n` for `n∈ℕ` (exp is additive on the `r_p`-ball), and both sides are continuous in `s`.

**Proof of the second clause** (checked):
- `w=u₀+cz/d₁` has Gauss norm `≤‖p^(h')‖`, so `log(1+w)/p^(h')` has Gauss norm `≤ sup_n p^(−h'(n−1)+v_p(n))≤1`, with coefficients tending to `0`.
- `G=λ·log(1+w)/p^(h')` with `λ=log(1+t)` has Gauss norm `<r_p`. Then `‖G^k/k!‖<p^(−1/(p−1))` for `k≥1` and tends to `0`, so `exp G` is a restricted series of Gauss norm one.
- Evaluation at `‖z‖≤1` commutes with both sums.
- `‖κ(d₁)‖=1`, since the image of the compact `ℤ_pˣ` under `x↦‖κ(x)‖` is a compact subgroup of `ℝ_(>0)`.

**Mathlib's exp and log** are tsums of the right series:
- `NormedSpace.log` (`Analysis/Normed/Algebra/Logarithm.lean:90`) is `Σ' ((−1)^(n+1)/n)•(x−1)^n`, with junk value `0` only off convergence or without a ℚ-algebra.
- `NormedSpace.exp` (`Exponential.lean:128`) is the same for the exponential.
- Every point where the statement evaluates them lies in the convergence disc.

**The algebra map.** The `Algebra ℤ_[p] K` instance has no scalar-tower hypothesis, but `IsBoundedSMul` gives `‖algebraMap a‖≤‖a‖`. A Lipschitz ring map agrees with the canonical one on the dense `ℕ`, so `algebraMap ℤ_[p] K` is the canonical map.

**README and Lean agree.**
- Lines 1485–1497 state the Lean form: `h'=h+v_p(q)`, `d=d₁(1+u₀)` with `cz+d=d₁(1+u₀+cz/d₁)` (expanded: `d₁+d₁u₀+cz`), and Gauss norm one read as coefficients `≤1` and constant term of norm one.
- The *Needs:* line (1514–1520) adds `NormedSpace.exp`, `NormedSpace.log` and `PowerSeries`.
- The Layer 5 Check at line 1621 (`κ(x)=x`, `F=cz+d`) is the `h=0` instance.
- The new sentence "The unit disc is the case `r=1` …" holds: `‖c‖≤‖p^(h')‖≤‖q‖<r_p`, and `‖c‖‖t‖<‖p^(h')‖r_p`.

### §1.3 and the Layer 1 Checks

**[CM] locators.**
- Remark 1.2.28, printed p. 70 (CM lines 2960, 2988–2990): a discrete valuation field is spherically complete.
- Chapter 1's standing hypothesis that `k` is complete is at CM lines 495–496.
- Corollary 1.2.31, printed p. 72 (CM lines 3039, 3073–3075): a finite-rank ultrametrically seminormed space over a spherically complete field has an orthogonal basis.
- CM's "orthogonal" is the one-sided `α=1` inequality of Definition 1.2.4 (CM lines 2410–2414). This is the pinned `TauCeti.IsTOrthogonalFamily … 1` (`Analysis/Normed/Module/Bases/TOrthogonal.lean:73`).
- The README's sentence states exactly this.

**Manifest.** `sources.toml` records `CM` (arXiv `1903.10798v1`, certified, `cited_for = ["1.3"]`, version note). The reference entry (line 1741) and the Layer 1 sources (line 507) agree with it.

**Pinned hypotheses.**
- `TauCeti.isTOrthogonalFamily_one_iff` (`TOrthogonal.lean:101`) assumes `[IsUltrametricDist M]`.
- `TauCeti.exists_basis_isTOrthogonalFamily` (`CountableType.lean:145`, with `IsUltrametricDist E` in the `variable` at line 68) also assumes it.
- This matches "the one of the pinned `t<1` statement".

**[Serre] condition (N)** (Serre lines 37 and 46, printed p. 69, Serre line 52): `|x|` lies in the closure of the image of `Kˣ`. The new Check paraphrases this correctly.

### Conventions 9 and 10, and the radius Checks

**Convention 9.**
- `TauCeti.amiceRadius` (`Distribution/Amice/Norm.lean:98`) is `p^(−1/((p−1)p^h))`, so `r_0=r_p`.
- Every numeral-indexed radius in the README now denotes a level:
  - `r_1=2^(−1/2)`, `r_2=2^(−1/4)` at line 1233;
  - `r_1>2⁻¹` at line 1236;
  - `r_0` at lines 1234, 1601 and 1620.

**Convention 10.**
- `TauCeti.WeightSpace.tendsto_coord_pow` (`NumberTheory/Padics/WeightSpace.lean:174`) assumes `NormedRing`, `Algebra ℤ_[p]`, `IsBoundedSMul ℤ_[p]` and `IsUltrametricDist`. This is "an ultrametric normed ring with contractive `ℤ_p`-algebra structure".
- `TauCeti.isTopologicallyNilpotent_iff_norm_lt_one_of_isPowMul` (`Analysis/Normed/Ring/UnitBall.lean:140`) needs only `IsPowMul` on a seminormed ring.
- The cited dual-number weight is the Check at line 1648.

### Library declarations opened at the pins (14)

**Mathlib:** `NormedSpace.log` (`Logarithm.lean:90`) and `NormedSpace.exp` (`Exponential.lean:128`).

**Tau Ceti:**
- Orthogonality: `TauCeti.IsTOrthogonalFamily` (`TOrthogonal.lean:73`), `TauCeti.isTOrthogonalFamily_one_iff` (`:101`), `TauCeti.exists_basis_isTOrthogonalFamily` (`CountableType.lean:145`).
- Weight space: `TauCeti.WeightSpace` (`WeightSpace.lean:81`), `TauCeti.WeightSpace.coord` (`:156`), `tendsto_coord_pow` (`:174`), `norm_coord_lt_one` (`:180`).
- Norms: `TauCeti.isTopologicallyNilpotent_iff_norm_lt_one_of_isPowMul` (`UnitBall.lean:140`).
- Units: `TauCeti.padicUnitsDepth` (`Logarithm.lean:75`), `TauCeti.unitsPrincipalLogEquiv` (`:217`), `TauCeti.padicUnitsGenerator` (`:243`), `coe_padicUnitsGenerator` (`:247`).
- Radius: `TauCeti.amiceRadius` (`Norm.lean:98`).
- Exponential and logarithm on `ℚ_p`: `Padic.log_exp` and `Padic.exp_log` (`Padics/ExpLog.lean:109, 115`; `ℚ_p` only).

`roadmaps resolve` reports no unresolved name or citation.

### Seeded sample in the changed passages

**§1.3.** The [CM] and [Serre] locators were checked above.

**§5.5.** [LWX] Proposition 3.14, p. 21 (LWX line 1141): `c∈qℤ_p`, `d∈ℤ_pˣ`. The universal expansion `[cz+d]=[d₀](1+T)^(log((cz+d)/d₀)/q)` is in its proof (LWX lines 1159–1165). This matches the docstring's "in the proof of [LWX] Proposition 3.14, p. 21", at `h'=v_p(q)`.

The other sampled targets (§§0.1, 0.2, 0.4, 2.1–2.4, 2.7, 4.3, 4.6, 5.1, 5.4, 5.6) are unchanged since `d18ec2a` and were verified in the previous review. Where the new text relies on §4.6 and §5.1, I re-checked them (rows below).

### Cross-roadmap citations and ownership

- `roadmaps grep` shows that §5.5 is consumed, not restated, by:
  - QuaternionicModularForms (open; README lines 441, 453, 1226, 1229);
  - AutomorphicGaloisRepresentations (open; lines 794, 1169, 1223).
- No other roadmap declares `exists_powerSeries_hasSum_weight_factor`. Main's README already assigns "scalar expansions of `κ(cz+d)`" to this roadmap.
- `overlaps.md`:
  - no dropped or revision-only id;
  - #1808 and #1854 also change this folder, and the description's merge-order block orders "`PadicFunctionalAnalysis`: this pull request → #1808 → #1854".

### Remarks

- `[IsUltrametricDist K]` in the new theorem is derivable from `NormedAlgebra ℚ_[p] K` (`IsUltrametricDist.of_normedAlgebra`, used at `WeightSpace.lean:199`). It matches the file's other §4.7 signatures and is harmless.
- The previous review's R02 witness assumed the equality form of orthogonality. Under the pinned one-sided `IsTOrthogonalFamily`, the `ℓ¹` standard basis is 1-orthogonal, as the new Check (lines 498–502) states. The repair stands, because the route uses the equality, which needs `IsUltrametricDist`.

### Adversarial table

Rows marked *(r58)* are carried from the review of `d18ec2a` for statements this diff leaves untouched. Every other row was computed this round.

| Statement | Instance | Left side | Right side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| `exists_powerSeries_hasSum_weight_factor` | trivial `κ`, any `h` | `T_κ=0<r_h`; clause 1: `κ(x)=1` | `exp(log x/p^(h')·log 1)=exp 0=1` | holds; `F=1`, `‖coeff₀‖=1` | none |
| same | `κ(x)=x`, odd `p`, `h=0` (`h'=1`) | `‖T_κ‖=p⁻¹<p^(−1/(p−1))`; `log γ=p`; clause 1 at `x=1+p`: `1+p` | `exp(log(1+p))=1+p` | holds; `F=d₁(1+u₀)+cX`, norms `1`, `≤p⁻¹` | none |
| same | `κ(x)=x`, `p=2`, `h=0` (`h'=2`) | `‖T_κ‖=4⁻¹<2⁻¹=r_0`; `log γ=4`; clause 1 at `x=5`: `5` | `exp(log 5)=5` | holds; `F=cz+d`, `‖c‖≤4⁻¹` | none |
| same | `p=2`, sign weight, any `h` | `T_κ=0`; `κ=1` on `1+2^(h+2)ℤ_2` | `exp(·log 1)=1`; clause 2: `F=κ(d₁)=±1` | holds | none |
| same, negative control on `hκ` | `p=3`, `ψ` of conductor 9, `h=0` | `‖ζ_3−1‖=3^(−1/2)=r_0`: `hκ` false; clause 1 at `x=γ`: `ζ_3` | `exp(1·log ζ_3)=exp 0=1` | clause 1 would fail; `hκ` excludes it | none |
| same | same `ψ`, `h=1` | `3^(−1/2)<3^(−1/6)=r_1`; `1+t=ψ(γ³)=1` | `ψ=1` on `1+9ℤ_3`; `exp(0)=1`; `F=ψ(d₁)` | holds | none |
| same, negative control on the level | `p=2`, `h'=1` (outside `h'=h+2`), sign weight, `x=−1` | `‖−2‖=2⁻¹≤‖2‖`; `κ(−1)=−1` | `exp(log(−1)/2·log 1)=1` | would fail; the Lean family has `h'≥2` | none |
| same, Gauss bound | `p=2,h=0`: `‖w^n/(4n)‖` | `n=1,2,4`: `1`, `2⁻¹`, `2⁻⁴` | `‖G^k/k!‖<2^(−s_2(k))≤2⁻¹`, `k≥1` | coefficients `≤1`, tending to `0` | none |
| same, constant term | `‖κ(d₁)‖`; `y=λ·log(1+u₀)/p^(h')` | compact image in `ℝ_(>0)` is `{1}` | `‖exp y−1‖=‖y‖≤‖t‖<r_p<1` | `‖coeff₀ F‖=1` | none |
| same, probe | scratch copy | elaborates, one `sorry` | `first … exact?` fails | not padding | none |
| §5.5, `r=1` sentence | odd `p`; `p=2` | `‖c‖≤p⁻¹<p^(−1/(p−1))`; `‖c‖≤4⁻¹<2⁻¹` | `‖c‖‖t‖<‖p^(h')‖r_p`, since `‖t‖<r_p` | both conditions hold | none |
| §4.6 equivalence (used by §5.5) | `p=2,h=1,t=√2` | `‖(1+t)²−1‖=‖2(1+√2)‖=2⁻¹`, not `<r_p` | `‖t‖=2^(−1/2)=r_1`, not `<` | both fail | none |
| §5.1 generator | `γ^(p^h)` | `coe_padicUnitsGenerator`: `γ=exp(p^(v_p(q)))` | `γ^(p^h)=exp(p^(h+v_p(q)))` | as docstring | none |
| §1.3 with [CM] | `K=ℚ_p` | complete DVF, spherically complete (Rem. 1.2.28) | Cor. 1.2.31: orthogonal basis | target supported | none |
| Layer 1 Check (N) | `ℚ_p²`, `max(|x|,p^(−1/2)|y|)` | standard basis: `‖xe₁+ye₂‖=max(|x|‖e₁‖,|y|‖e₂‖)` | `‖(0,1)‖=p^(−1/2)∉p^ℤ∪{0}` | orthogonal, not orthonormal; (N) fails | none |
| Layer 1 Check `ℓ¹` | `ℚ_p²`, `|x|+|y|` | `|x|+|y|≥max(|x|,|y|)` (one-sided holds) | `‖(1,1)‖=2>1=max` | equality fails without ultrametric | none |
| Convention 9 | `amiceRadius 2 0`, `2 2`, `3 0` | `2^(−1/1)=2⁻¹=r_p` | `2^(−1/4)`; `3^(−1/2)=r_0` | consistent with lines 1233–1236, 1601, 1620 | none |
| Convention 10 | max-norm `ℚ_p[ε]`, `s↦1+sε`; sup-norm `ℚ_p×ℚ_p`, `x↦(x,1)` | `T=ε`, `ε²=0`, `‖ε‖=1`, `‖ε²‖=0≠1` | `T=(exp q−1,0)`, `‖T‖=‖q‖<1`, power-multiplicative | nilpotent with norm 1; equivalence holds in the second | none |
| Lines 1250–1252, 1590 | `p=2` | `‖4‖=4⁻¹<2⁻¹=r_p` | `‖2ⁿ/n!‖=2^(−s_2(n))=2⁻¹` at `n=2^k` | `exp 4` converges, `exp 2` diverges | none |
| `amiceMap_bijective_and_norm_eq` *(r58)* | `p=2,h=1,E=ℤ_2`, `c=single 2 1` | stage norm `max(‖−1‖,‖2‖)=1` | `‖c‖=1` | isometric | none |
| same *(r58)* | `E=0` | `C₀(ℕ,0)=0` | `LA_h(0)=0` | bijective, norms 0 | none |
| `isOrthonormalBasis_amiceTerm` *(r58)* | `p=2,h=1,n=0,1,2` | `(1;1)`, `(0,2;1,2)`, `(0,−1,2;0,1,2)` | mod 2 independent | norm 1 | none |
| `exists_eval_eq_addChar_iff` *(r58)* | `p=2,h=0,t=2`; `p=3,h=0,t=3` | `v(2ⁿ/n!)=s_2(n)`; `v(3ⁿ/n!)→∞` | `2⁻¹=r_0`; `3⁻¹<3^(−1/2)` | both false; both true | none |
| `amiceTransform_distribution_bijective` *(r58)* | `μ'(f)=f'(0)`; `b_n=1/n!` | `‖μ'‖_h=p^h`; `p^⌊n/p⌋→∞` | `log(1+T)`; `exp T` radius `r_p<1` | distribution; excluded | none |
| `binomialLA` *(r58)* | `p=2,n=2` | level 0: norm 2 | level 1: norm 1 | `=‖m_h(2)‖⁻¹` | none |
| §4.7 convolution *(r58)* | `μ'∗μ'` | `b_2=1`, `b_3=−1` | `log(1+T)²`: `1,−1,11/12` | agree | none |
| `exists_character_of_hasEval` *(r58)* | `S=𝔽_p[ε]/ε²`; `S=ℤ_2,z=2` | `κ(γ^s)=1+sε`; `κ(γ)=3` | coordinate `ε`; `2` top. nilpotent | unique; holds | none |
| `eq_aeval_binomialSeries` *(r58)* | `κ=x^k`, `k` odd, `x=−1` | `ω(−1)^k=−1` | without finite part: `1` | discriminates | none |
| `amiceTransform_completedGroupAlgebra_compat` *(r58)* | `μ=δ_a` | `(1+X)^a↦[ofAdd a]` | `[ofAdd a]` | agree | none |
| `measurePairing_injective` *(r58)* | odd `p`, `δ_1−δ_(1+p)` | trivial weight: `0` | `κ=x`: `−p≠0` | separated | none |
| `exists_eval_eq_weight_iff` *(r58)* | trivial; `κ=x`, `h=0`; `p=3` `ψ` cond. 9 at `h=0,1`; `p=2` sign | `f=1`; `x`; 3 values / constant; constant on `1+4ℤ_2` | `0<r_h`; `p⁻¹<r_0`; `=r_0` / `<r_1`; `0<2⁻¹` | agree in each case | none |
| same, unit level *(r58)* | `p=2`, sign, `h'=1` | Strassmann: not analytic | `T=0<r_h` | Lean excludes `h'=1` | none |
| `mem_span_iff_forall_eval_annulus` *(r58)* | `TU−p`; `T` | `t(p/t)−p=0`; `t≠0` | in span; `T∉(TU−p)` | agree | none |
| §4.5 bound *(r58)* | odd `p`, `z=p`, `n=p` | `‖p^p/p!‖=p^(1−p)` | `‖z‖(‖z‖/r_p)^(p−1)=p^(1−p)` | sharp | none |
| §5.2 valuations *(r58)* | `p=5,m=2`; `p=2,m=3` | `v(ζ_5−1)=1/4`; `v(−2)=1` | `1/(5⁰·4)`; `1/2⁰` | agree | none |
| §§0.3, 0.4, 1.1, 3.2, 3.4 Checks *(r58)* | `a=p^(−n)`; `(ℤ_p,p²,p)`; `E=0`; `φδ₁` | `p^(2n)`; `g(p)²≠g(p²)`; norm 0; `(1+T)^p` | no linear `C`; as stated; consistent; `δ_p` | as stated | none |
| §5.6 `H` Checks *(r58)* | `T⁻¹`; `ΣU^j` | `d_(−1)=1` needs `v≥1`; `‖U^j‖=1` | non-unit; no convergence | as stated | none |

## Not verifiable

- [Sch], [BGR] and [Bel] are settled as uncertified and are cited by locator. None of the changed passages cites them.
- [Am] (an OCR'd scan) and [Mah] were not re-read. The changed passages do not cite them, and the previous review covers them.
- Ownership against open pull requests was checked with `roadmaps grep` for §5.5 and its declaration name, and with the overlaps index. I did not read the other open heads beyond the hits.

## Source issues

- none
