# Review of UnboundedOperators (pull request #1027 at cfd0df5)
Folder: `TauCetiRoadmap/OperatorTheory/UnboundedOperators/`
**Verdict:** accepted

This incremental re-review covers the 16 lines that changed since `88a3bc1`. All of them are in `README.md`:
- the From Tau Ceti contract at `:111–121`;
- the Fourier/commutation paragraph of §2.3 at `:412`;
- the §2.3 *Needs:* line at `:431`;
- a new §2.3 Check at `:445`;
- the Layer 2 Dependencies at `:503`.

`Suggested.lean` is byte-identical to the previous head. The previous R01 is repaired, and I found no new finding. Below, `README.md` and `Suggested.lean` mean the two files of this folder.

## Previous findings

- R01 — repaired: `README.md:412`: "the approximants of a bounded Borel symbol are continuous, not simple … A route with no vector-dependent measure goes through Borel sets … Only then do simple symbols enter". The three Mathlib names are on the *Needs:* line `:431`.

## Verified sound

**Gate and dependency check.**
- The worker's gate at `cfd0df5` passes. Every rule is 0, including `build=0` (`OK`).
- I reran the brief's gate command. Every rule is 0 except `depcheck=1: NOT IN ORDER: UnboundedOperators (insert it after its last supplier)`.
  - That rule reads the configured merge order, not the candidate order, so it is not a finding.
  - The candidate order lists this roadmap at line 10. Its suppliers come earlier: VonNeumannAlgebras (5), CStarAlgebras (7), HilbertModules (8) and OperatorKTheory (9).
- The dependency check against the candidate order prints this, with no UPWARD, CYCLE or `moved:` line:

```
depcheck: 239 roadmaps, 2355 edges, 0 problem(s)
```

- `git diff --stat origin/main...HEAD` outside the family folder is empty.
- Since `88a3bc1`, only `README.md` changed (11 insertions, 5 deletions).

**Elaboration and signatures.**
- `lake env lean` on `Suggested.lean` gives 22 warnings, all "declaration uses `sorry`", and no other diagnostic.
- I also elaborated a scratch copy with `#check @…` for all 30 declarations. It prints them with no error.
- No statement changed, so the r11 signature comparison and one-tactic probe stand: 22 headline theorems, no padding and no lost binder.

**Lean probe of the new Borel-set route.**
- I wrote a scratch file that imports `Mathlib` and `TauCeti.Analysis.InnerProductSpace.ProjValMeasure.DominatedConvergence`. It proves the route's three steps for a `TauCeti.ProjValMeasure ℝ H` and a bounded C, with no `sorry`, and elaborates with 0 errors.
  1. If C commutes with the integrals of uniformly bounded symbols that converge pointwise to `1_Ω`, then C commutes with `P(Ω)`. This step uses `tendsto_integral_apply_filter_of_dominated_convergence` and `integral_indicator`.
  2. Commutation with `P(Ioo a b)` for rational a<b gives commutation with every `P(Ω)`. This step uses `MeasurableSpace.induction_on_inter` with `BorelSpace.measurable_eq.trans Real.borel_eq_generateFrom_Ioo_rat`, `Real.isPiSystem_Ioo_rat`, `proj_empty`, `proj_compl` and `hasSum_proj_of_pairwise_disjoint` (mapped through C by `HasSum.mapL`).
  3. Commutation with every `P(Ω)` gives commutation with every `P.integral f`. This step uses `integral_ofSimpleFunc`, `DenseRange.induction_on` with `denseRange_ofSimpleFunc`, and the closed set cut out by `continuous_integral`.
- Step 1 also needs ramps for each interval. For `Ioo a b`, `g_n=min(1,n·dist(·,(a,b)ᶜ))` is continuous, supported in `[a,b]`, takes values in [0,1], increases in n and tends to `1_(a,b)` pointwise.
- The input "C commutes with every continuous g vanishing at infinity" is the density step of `:410`. That step was checked in r11 and r12.

**Library declarations opened at the pins.**
- Tau Ceti, all new in the contract at `:115–121`:
  - `TauCeti.ProjValMeasure.proj_compl` (`Analysis/InnerProductSpace/ProjValMeasure/Basic.lean:266`): `P.proj Bᶜ _ = id − P.proj B hB`;
  - `TauCeti.ProjValMeasure.hasSum_proj_of_pairwise_disjoint` (`Basic.lean:524`): a `HasSum` at each vector for a pairwise disjoint ℕ-indexed family. The README's "same file" is correct for both.
  - `TauCeti.ProjValMeasure.continuous_integral` (`ProjValMeasure/Integral.lean:248`);
  - `TauCeti.BoundedBorelFunction.denseRange_ofSimpleFunc` (`TauCeti/MeasureTheory/Function/BoundedBorel.lean:349`), which approximates through `SimpleFunc.approxOn` uniformly, matching "uniformly" at `:412`.
- Tau Ceti, not named by the route:
  - `integral_indicator` (`Integral.lean:270`) and `integral_ofSimpleFunc` (`:263`) are basic API of the contracted `TauCeti.ProjValMeasure.integral`.
  - `tendsto_integral_apply_filter_of_dominated_convergence` (`DominatedConvergence.lean:77`) needs a `P.ae` bound and `P.ae` convergence. The ramps give both everywhere.
- Mathlib:
  - `MeasurableSpace.induction_on_inter` (`MeasureTheory/PiSystem.lean:713`) takes the cases ∅, basic, complement and disjoint ℕ-union;
  - `Real.borel_eq_generateFrom_Ioo_rat` (`MeasureTheory/Constructions/BorelSpace/Real.lean:44`) and `Real.isPiSystem_Ioo_rat` (`:88`).
- No pinned Tau Ceti or Mathlib lemma already gives commutation of an operator with a PVM integral. A grep of the `ProjValMeasure` folder and of the pins for commute/`Commute` with `proj` or a spectral measure finds none. So the route is not restating a library result.

**Adversarial table.**
- Conventions: `R_A(z)=(zI−A)⁻¹`, `U(t)=exp(itA)`, and `μ_A^x(Ω)=⟪x,P_A(Ω)x⟫`.
- Rows marked (r12) carry the previous report's rows for untouched statements. Rows marked **new** compute the changed passages.

| # | Statement | Instances | Values computed on each side | Result; change |
|---|---|---|---|---|
| 1 | `existsUnique_spectralIntegral`, §1.4–§1.5, `existsUnique_maximal_multiplier`, `existsUnique_projValMeasure_of_normal` | r12 rows 1–2 | unchanged (r12) | true (r12) |
| 2 | `commute_resolvent_iff_commute_stoneGroup` | r12 row 3 | `[R_X(i),R_Z(i)]=(XZ−ZX)/4≠0`, `U(π/2)V(π/2)=−XZ≠−ZX`, `R_A(½)=diag(2,−2)` (r12) | true (r12) |
| 3 | §2.3 Lemma 4.4 step, per-vector commutant step, domination alternative, Check `:444` | r12 rows 4–10 | unchanged text (r12) | true (r12) |
| 4 | contract `proj_compl` `:115` (**new**) | A=diag(0,1), B={0} | `P({0}ᶜ)=P({1})=diag(0,1)`; `1−P({0})=I−diag(1,0)=diag(0,1)` | true |
| 5 | contract `hasSum_proj_of_pairwise_disjoint` `:116` (**new**) | A=diag(0,1), f n={n}, ξ=(a,b) | `ΣP({n})ξ=(a,0)+(0,b)+0+…=(a,b)`; `P(ℕ)ξ=P({0,1})ξ=(a,b)` | true |
| 6 | contracts `continuous_integral`, `denseRange_ofSimpleFunc` `:120–121` (**new**) | A=M_λ on L²[0,1], f=λ·1_[0,1], s_n=⌊nλ⌋/n·1_[0,1] | `sup\|f−s_n\|≤1/n`, so `‖s_n[P]−f[P]‖≤1/n→0` | true |
| 7 | `:412` "continuous, not simple" (**new**) | A=M_λ on L²[0,1], s=1_[0,½] | `Cs[P_A]=s[P_A]C` is `CP_A([0,½])=P_A([0,½])C`, form (i), the step's conclusion | true; prev. R01 repaired |
| 8 | `:412` Borel route, open intervals (**new**) | A=M_λ on L²[0,1], C=M_φ, x=1, Ω=(0,½), g_n=min(1,n·dist(·,Ωᶜ)) | `g_n(0.1)=min(1,0.1n)=1` for n≥10, `g_n(0)=g_n(0.7)=0`; `‖(g_n−1_Ω)x‖²≤λ{0<dist<1/n}=2/n→0` | true; Lean step 1 |
| 9 | `:412` π–λ step (**new**) | ℓ²(ℝ), C=M_φ; control: A=diag(0,1), C=X | `CP(ℚ)=M_(φ1_ℚ)=P(ℚ)C`. Control: `XP({0})=[[0,0],[1,0]]≠[[0,1],[0,0]]=P({0})X`, consistent with `X·diag(2,−2)≠diag(2,−2)·X` | true; Lean step 2 |
| 10 | `:412` simple, then uniform (**new**) | A=diag(0,1), s=2·1_{0}+3·1_{1}, C=diag(5,7) | `s[P]=diag(2,3)`; `Cs[P]=diag(10,21)=s[P]C` | true; Lean step 3 |
| 11 | `:412` one pointwise sequence fails without a finite control measure (**new**) | A=M_t on ℓ²(ℝ), f=1_ℚ | `g_n[P]δ_t=g_n(t)δ_t` forces `g_n→1_ℚ` at every t. A Baire-1 limit has a comeagre set of continuity points, and `1_ℚ` has none. With a finite control ν, L²(ν) approximants have an a.e.-convergent subsequence | true |
| 12 | Check `:445`, both routes reach `P(ℚ)` (**new**) | x=δ₀+δ_√2, φ≡2 | `μ^x+μ^(Cx)=5δ₀+5δ_√2`, mass 10=‖x‖²+‖Cx‖²=2+8; `CP(ℚ)x=2δ₀=P(ℚ)(2δ₀+2δ_√2)` | true |
| 13 | Check `:445`, only ∅ is null (**new**) | Ω={t} | `P({t})δ_t=δ_t≠0`. A finite ν with ν({t})>0 for all t∈ℝ would have uncountably many atoms, which is impossible | true |
| 14 | *Needs:* `:431`, Dependencies `:503` (**new**) | each new route input | Needs has 3 Mathlib and 5 Tau Ceti names, all at the pins (above) and the Tau Ceti ones in the contracts. Dependencies adds π–λ with rational intervals, the bounded integral, dominated convergence, continuity in the symbol and countable additivity. No roadmap is cited | consistent |
| 15 | §2.4 API, joint PVM, §2.6; Layers 3–6 headlines | r12 rows 13–17 | unchanged (r12) | true (r12) |

**Sources read at their locators** (the seeded §2.3 target, the only sampled target in the changed passages; the changed lines add no locator).
- `teschl` Lemma 4.4, printed p.115, at `teschl line 4904`.
- Lemma 4.5 and its proof, p.116, at `teschl line 4926–4943`.
- Lemma 4.9 with its proof through Schwartz functions, p.117, at `teschl line 4967–4975`. This supports the converse via `J_f`.
- (4.24)–(4.25) at `teschl line 4978–4981` and Problem 4.2 at `teschl line 4985`, both p.117.
- (5.5), p.126, at `teschl line 5279`.
- All of these match `:410`.
- The other seeded targets are untouched since r10–r12 read their locators.

**Ownership and overlaps.**
- The overlap listing reports no pull request changing this roadmap, no dropped id and no id that only an open revision defines.
- The changed passages state no new object. They repair the proof route of a §2.3 target this roadmap owns and cite only pinned declarations.
- The resolver's one lead, `applyWord`, is `CommonInvariantDomain.applyWord`, declared in `Suggested.lean`.

**README form.** The changed lines have no LaTeX, process words, pull-request numbers or machine paths. The new Check names no Lean counterpart.

**Remarks on untouched text (no change requested).**
- The From Mathlib contract (`:23–43`) still omits §2.3's Mathlib inputs. They are named on the *Needs:* line `:431`.
- The sentence "Exponentials are not Lebesgue-L¹ functions" now follows the commutation route at `:412`. It concerns `J_f`.

## Not verifiable

- **Kato (1995), Nelson (1959) and Weidmann (1987)** are settled as uncertified. No changed passage relies on them.

## Source issues

- **Gap** in teschl at Lemma 4.5 (proof), printed p.116: the source says choosing `f_n→f` in `L²(dμ_ψ)` gives `f_n(A)Bψ→f(A)Bψ`; it should be convergence in `L²(μ_ψ+μ_(Bψ))`, or a prior bound `μ_(Bψ)≤‖B‖²μ_ψ` from the continuous case; affects the proof.
