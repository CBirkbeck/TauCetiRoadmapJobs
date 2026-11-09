# Review of UnboundedOperators (pull request #1027 at 88a3bc1)
Folder: `TauCetiRoadmap/OperatorTheory/UnboundedOperators/`
**Verdict:** needs changes

This is an incremental re-review of the 9 lines that changed since `fea2b39`, all in `README.md` (§2.3 and the Layer 2 Dependencies). There is one P3 finding and no blocking finding. The previous R01 is repaired at `:405`. The new finding is in the sentence of the next paragraph that the same repair rewrote. Below, `README.md` and `Suggested.lean` mean the two files of this folder.

## R01 (P3) — The rewritten Fourier-paragraph sentence gives the commutant step approximants it cannot use

**Location.** `README.md:407`: "simple-function approximation of a bounded Borel symbol at a vector x is against `μ_A^x+μ_A^(Cx)`, for the bounded operator C of the commutant step, … or is by uniformly bounded pointwise approximants, which converge strongly at every vector".

**Claim.**
- At the commutant step, C is known to commute only with `g[P_A]` for g in the closure of the resolvent ∗-algebra. These are continuous symbols on σ(A) that vanish at infinity.
- For a simple symbol s, `Cs[P_A]=s[P_A]C` is form (i) itself, which is the step's conclusion. So simple approximants make the step circular.
- Once (i) is known, simple symbols approximate a bounded Borel f uniformly, with `‖s_n[P_A]−f[P_A]‖≤sup|s_n−f|`. At that point no vector-dependent measure is needed.
- The second alternative, with continuous approximants, does not reach every bounded Borel f in one sequence when `P_A` has no finite control measure.
- The rewrite now ties this sentence to "the bounded operator C of the commutant step". It therefore contradicts `:405`, which correctly uses continuous compactly supported `f_n`, as Teschl does (`teschl line 4934`).

**Witness.** A = multiplication by λ on L²[0,1], s=`1_[0,1/2]`: `Cs[P_A]=s[P_A]C` is form (i) at Ω=[0,1/2], the step's conclusion. For A = multiplication by t on ℓ²(ℝ), only ∅ is `P_A`-null, and `1_ℚ` is no pointwise limit of continuous functions.

**Repair.** At `:407`, replace the sentence from "In the commutation proof, simple-function approximation" up to "converge strongly at every vector" with:

> In the commutation proof, a bounded Borel symbol is reached at a vector x by continuous compactly supported symbols converging in `L²(μ_A^x+μ_A^(Cx))`, as in the commutant step above. Alternatively, the Borel sets Ω with `CP_A(Ω)=P_A(Ω)C` contain the open intervals, because increasing continuous approximants converge strongly by `TauCeti.ProjValMeasure.tendsto_integral_apply_filter_of_dominated_convergence`. They are also closed under complements and countable disjoint unions, so they are all Borel sets by `MeasurableSpace.induction_on_inter` with `Real.borel_eq_generateFrom_Ioo_rat` and `Real.isPiSystem_Ioo_rat`. Simple symbols then approximate a bounded Borel symbol uniformly, in operator norm.

If the alternative is kept, add the two Mathlib names to the *Needs:* line at `:426`. The Tau Ceti lemma is already in the contracts (`:128`, SA-B53). Deleting the alternative is an equally good repair.

**Tested** on two instances.
- A = multiplication by λ on L²[0,1], C = multiplication by a bounded Borel φ (it commutes with every `R_A(z)`), x=1, Ω=[0,1/2]:
  - Take the ramps `g_n`: 1 on [0,1/2], 0 on [1/2+1/n,1], linear in between.
  - `∫|g_n−1_Ω|²(1+|φ|²)dλ≤(1+‖φ‖∞²)/n→0`.
  - So `CP_A(Ω)x=φ1_Ω=P_A(Ω)Cx`.
- On ℓ²(ℝ) with C = multiplication by a bounded φ:
  - The Dynkin class contains every `Ioo(a,b)`, since ramps increase to `1_(a,b)` pointwise.
  - Hence it contains ℚ, and `P(ℚ)C=CP(ℚ)=M_(φ1_ℚ)`.

## Previous findings

- R01 — repaired: `README.md:405`: "For x∈H, approximate f by continuous compactly supported `f_n` in `L²(μ_A^x+μ_A^(Cx))` … the sum is regular by `MeasureTheory.Measure.Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure` … gives both `f_n[P_A]x→f[P_A]x` and `f_n[P_A]Cx→f[P_A]Cx`". The negative-control Check is at `:439`; the paragraph after it is R01 above.

## Verified sound

**Gate and dependency check.**
- The worker's gate at `88a3bc1` has every rule at 0, including `build=0` (`OK`).
- My rerun of the brief's gate command has every rule at 0 except `depcheck=1: NOT IN ORDER: UnboundedOperators (insert it after its last supplier)`.
  - That rule reads the configured merge order, so it is not a finding.
  - The candidate order lists this roadmap at line 10, after VonNeumannAlgebras (5), CStarAlgebras (7), HilbertModules (8) and OperatorKTheory (9).
- The dependency check against the candidate order:

```
depcheck: 239 roadmaps, 2355 edges, 0 problem(s)
```

- There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the family folder is empty. Since `fea2b39`, only `README.md` changed (9 lines); `Suggested.lean` is byte-identical.

**Elaboration and signatures.**
- `lake env lean` on `Suggested.lean` gives 22 warnings, all "declaration uses `sorry`", and no other diagnostic.
- I elaborated one scratch file: `Suggested.lean` plus `#check @…` for all 30 declarations. It has no error and prints 30 types.
- No statement changed, so r11's signature comparison and one-tactic probe stand: 22 headline theorems, no padding, no lost binder.

**Adversarial table.**
- Conventions: inner products are conjugate-linear in the first slot, `R_A(z)=(zI−A)⁻¹` and `U(t)=exp(itA)`.
- Rows marked (r11) carry the previous report's row for an untouched statement, by its r11 number. Rows marked **new** compute the changed passages.

| # | Statement | Instances | Values computed on each side | Result; change |
|---|---|---|---|---|
| 1 | `existsUnique_spectralIntegral` | r11 row 1 | unchanged (r11) | true (r11) |
| 2 | §1.4, §1.5, `existsUnique_maximal_multiplier`, `existsUnique_projValMeasure_of_normal` | r11 rows 2–5 | unchanged (r11) | true (r11) |
| 3 | `commute_resolvent_iff_commute_stoneGroup` (Pauli, real point, A=B, H=0) | r11 rows 6–8 | [R_X(i),R_Z(i)]=(XZ−ZX)/4≠0, U(π/2)V(π/2)=−XZ≠−ZX; R_A(½)=diag(2,−2) (r11) | true (r11) |
| 4 | §2.3 Lemma 4.4 step; converse via `J_f`; separability remark | r11 rows 10, 12, 13 | unchanged text (r11). The new per-vector step uses only the finite measure `μ^x+μ^(Cx)` and no countable basis | true |
| 5 | §2.3 commutant step `:405` (**new**) | A=diag(0,1), C=diag(2,3), x=(1,1), f=`1_{1}` | μ^x+μ^(Cx)=5δ₀+10δ₁; f_n(0)=0, f_n(1)=1 gives ∫\|f_n−f\|²=0; Cf[P]x=C(0,1)=(0,3); f[P]Cx=P({1})(2,3)=(0,3) | true; prev. R01 repaired |
| 6 | same, continuous spectrum (**new**) | A=M_λ on L²[0,1], C=M_φ, x=1, Ω=[0,½] | ramps g_n: ∫\|g_n−1_Ω\|²(1+\|φ\|²)dλ≤(1+‖φ‖∞²)/n→0; g_n x→1_Ω, g_n φ→1_Ω φ | true |
| 7 | norm-identity step `:405` (**new**) | `norm_sq_integral_apply` on f_n−f | ‖(f_n−f)[P]x‖²=∫\|f_n−f\|²dμ^x≤∫\|f_n−f\|²d(μ^x+μ^(Cx)), and the same at Cx. f_n continuous with compact support is a `BoundedBorelFunction`; `map_sub` of the ∗-hom | true |
| 8 | regularity claim `:405` (**new**) | instance hypotheses on ℝ | `Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure` needs pseudometrizable, σ-compact, Borel and locally finite: ℝ ✓; (μ^x+μ^(Cx))(ℝ)=‖x‖²+‖Cx‖²<∞ and finite⇒locally finite ✓; `exists_hasCompactSupport_eLpNorm_sub_le` needs R1, weakly locally compact, regular, p=2≠∞ ✓ | true |
| 9 | domination alternative `:405` (**new**) | C=diag(2,3), x=(1,1); C=X, x=e₁ | 4δ₀+9δ₁≤9δ₀+9δ₁=‖C‖²μ^x ✓; for the non-commuting X, μ^(Xe₁)=δ₁≰δ₀=‖X‖²μ^(e₁), so commutation is used, through ∫\|g\|²dμ^(Cx)=‖Cg[P]x‖²≤‖C‖²∫\|g\|²dμ^x and regularity | true |
| 10 | new Check `:439` (**new**) | A=diag(0,1), x=e₁, e₂=Xx; C=diag(2,3), x=(1,1) | μ^(e₁)=δ₀, μ^(e₂)=δ₁; ∫\|0−1_{1}\|²dδ₀=0, but 0≠e₂=P({1})e₂; second part as row 5; C=diag(2,3) commutes with R_A(½)=diag(2,−2) as in the Check at `:437` | true; consistent with rows 3, 5 and 9 |
| 11 | `J_f` sentence `:407` (**new**) | A=M_λ on L²[0,1], s=`1_[0,½]`; A=M_t on ℓ²(ℝ), f=`1_ℚ` | Cs[P_A]=s[P_A]C is form (i) at [0,½]; P_A-null ⇔ ∅; `1_ℚ` is nowhere continuous, so it is not Baire class 1 | **R01** |
| 12 | *Needs:* `:426`, Dependencies `:497` (**new**) | each new route input | `Regular.of_…`→Mathlib (on the line) ✓; `norm_sq_integral_apply`→Tau Ceti (on the line, contracts `:117`, SA-B52) ✓; "regularity of finite Borel measures on ℝ" added at `:497` ✓; no later layer cited | consistent |
| 13 | §2.4 API, joint PVM, §2.6 | r11 row 14 | unchanged (r11) | true (r11) |
| 14 | `discreteSpectrum`, `essentialSpectrum`, `notMem_essentialSpectrum_iff`, `exists_spectralType_decomposition`, §3.5 | r11 rows 15–17 | unchanged (r11) | true (r11) |
| 15 | `resolventSet_alternatives_of_isClosed_symmetric`, `existsUnique_selfAdjoint_of_closed_form`, `friedrichs_extension_extremal`, §4.8 | r11 rows 17–20 | unchanged (r11) | true (r11) |
| 16 | `integralOperator_counterexample`, Nelson theorems, Weyl, Kato–Rellich, branches, `isSelfAdjoint_closure_neg_laplacian_add_potential` | r11 rows 21–22 | unchanged (r11) | true (r11) |
| 17 | tensor sum, tensor product, Stone factorization, milestone map, `smulSub`, layer dependencies | r11 rows 23–25 | unchanged (r11) | true (r11) |

**Sources read at their locators.**
- `teschl` printed p.116, Lemma 4.5 and its proof (`teschl line 4926–4943`): the source approximates by `f_n∈C∞(σ(A))` in `L²(dμ_ψ)`. The README's account of the gap at `:405` is accurate.
- `teschl` p.115, Lemma 4.4 (`teschl line 4904–4914`): one z outside K suffices, as the README says.
- The other seeded targets (§§1.1, 1.6, 2.1, 2.4, 2.6, 3.3, 3.4, 4.4, 4.8, 5.1–5.5, 6.4) are untouched since r10/r11 read their locators.

**Library declarations opened at the pins.**
- Mathlib:
  - `MeasureTheory.Measure.Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure` (`MeasureTheory/Measure/Regular.lean:1183`), an instance on pseudometrizable σ-compact Borel spaces;
  - `IsFiniteMeasure.toIsLocallyFiniteMeasure` (`MeasureTheory/Measure/Typeclasses/Finite.lean:299`);
  - `MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le` (`MeasureTheory/Function/ContinuousMapDense.lean:142`);
  - for the repair: `MeasurableSpace.induction_on_inter` (`MeasureTheory/PiSystem.lean:713`), `Real.borel_eq_generateFrom_Ioo_rat` (`MeasureTheory/Constructions/BorelSpace/Real.lean:44`) and `Real.isPiSystem_Ioo_rat` (`:88`).
- Tau Ceti:
  - `TauCeti.ProjValMeasure.norm_sq_integral_apply` (`Analysis/InnerProductSpace/ProjValMeasure/Integral.lean:305`), for a `BoundedBorelFunction` symbol;
  - the `ProjValMeasure` structure with `diag_finite` (`ProjValMeasure/Basic.lean:91`, `:98`);
  - `TauCeti.ProjValMeasure.tendsto_integral_apply_filter_of_dominated_convergence` (`ProjValMeasure/DominatedConvergence.lean:77`), whose hypotheses are a bound and convergence `P.ae`.

**Cross-roadmap citations resolved** (main at `b0fe353`).
- SelfAdjointSpectralTheory SA-E01 (`:1202`) defines `P_A` as the Cayley PVM reindexed along κ. It keeps the `ProjValMeasure` carrier (`:260`), so the Tau Ceti norm identity applies to it.
- SA-E05 (`:1211`) and SA-E08 (`:1217`) are unchanged.
- The resolver's one lead, `applyWord`, is `CommonInvariantDomain.applyWord`, declared in `Suggested.lean` (r11).

**Ownership and overlaps.**
- The overlap listing reports no pull request changing this roadmap, no dropped id and no id that only an open revision defines.
- The changed passages state no new object; they repair a proof route of §2.3, which this roadmap owns.

**README form.** The new text has no LaTeX, no process words, no pull-request numbers and no machine paths.

**Remarks on untouched text (no change requested).**
- The From Mathlib contracts paragraph (`:23–43`) does not list §2.3's Mathlib inputs (Fuglede, Stone–Weierstrass, compactly supported approximation, and now regularity). They are named on the *Needs:* line `:426`.
- The pull-request description still describes earlier heads.

## Not verifiable

- **Kato (1995), Nelson (1959) and Weidmann (1987)** are settled as uncertified. No changed passage relies on them.

## Source issues

- **Gap** in teschl at Lemma 4.5 (proof), printed p.116: the source says choosing `f_n→f` in `L²(dμ_ψ)` gives `f_n(A)Bψ→f(A)Bψ`; it should be convergence in `L²(μ_ψ+μ_(Bψ))`, or a prior bound `μ_(Bψ)≤‖B‖²μ_ψ` from the continuous case; affects the proof.
