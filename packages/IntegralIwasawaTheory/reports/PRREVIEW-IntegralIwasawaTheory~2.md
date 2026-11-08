# Review of IntegralIwasawaTheory (pull request #1306 at ae7b458)

**Verdict:** needs changes

One blocking finding: the new §§4.1a–4.1e, and the Lean block that goes with them, plan a second time the p-adic Baker–Brumer layer that LinearFormsInLogarithms already owns. There are five P3 findings, two of which repeat the previous review's padding and unused-hypothesis findings because they were not repaired. My re-run of the gate at this head passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with only `sorry` warnings. The fifteen seeded locators check out apart from the slips listed under R06.

## R01 (P2) — §§4.1a–4.1e re-plan LinearFormsInLogarithms Layer 8 (two owners of p-adic Baker–Brumer)

Location: `TauCetiRoadmap/IntegralIwasawaTheory/README.md` line 11 ("Sections 4.1a–4.1e prove Brumer's p-adic form of Baker's theorem … together with the exponential, arithmetic and interpolation API it needs"), §§4.1a–4.1e (lines 558–683), the contract paragraph at line 49 and the build-order paragraph at line 60. `TauCetiRoadmap/IntegralIwasawaTheory/Suggested.lean` lines 163–433 (`section BakerBrumer`, 35 declarations).

Claim: LinearFormsInLogarithms is an open pull request (#451, by another author) that adds a new roadmap folder, and its Layer 8 "Baker's theorem over `ℂ_[p]`" already plans this material. Its §§8.1–8.5 cover the exponential disc, ultrametric Liouville, many zeros, exponential polynomials and Hermite interpolation; §§8.6–8.9 the auxiliary function, arithmetic and parameters; §8.10 the theorem. The previous head consumed §8.10. This head drops that citation and plans the same layer here, statement for statement:

| here | LinearFormsInLogarithms `Suggested.lean` at its head |
|---|---|
| `expTwistDeriv` (same body `(derivative + c • LinearMap.id) ^ m`), `_eq_sum`, `natDegree_…_le`, `norm_coeff_…_le` | `Polynomial.expDerivFactor` (line 624) and its three lemmas (629–641) |
| `iterate_derivative_mul_rescale_exp`, `norm_coeff_mul_rescale_exp_mul_pow_le`, `hasSum_coeff_mul_rescale_exp` | `PowerSeries.iterate_derivative_coe_mul_rescale_exp` (647), `…norm_coeff_coe_mul_rescale_exp_mul_pow_le` (548), `…hasSum_coeff_coe_mul_rescale_exp` (537) |
| `ofReal_padicExpRadius_le_radius_expSeries`, `padicExp_add`, `norm_padicExp_sub_one`, `injOn_padicExp` | `PadicExp.le_radius_expSeries` (516), `PadicExp.exp_add` (521), `PadicExp.norm_exp_sub_one` (527), `PadicExp.injOn_exp` (532) |
| `one_le_house_pow_mul_norm_of_isUltrametricDist`, `exists_siegelConstant_linear` | `NumberField.one_le_pow_mul_norm_embedding_of_isUltrametricDist`, `NumberField.house.exists_const_ne_zero_int_vec_house_le` (322) |
| `norm_coeff_le_of_hasseDeriv_evalAt_eq_zero`, `exists_iterate_derivative_eval_eq_ite` | `PowerSeries.norm_coeff_le_of_ofScalarsSum_iterate_derivative_eq_zero`, `Polynomial.exists_iterate_derivative_eval_eq_ite_of_isUltrametricDist` |
| `bakerBrumer_expDisc`, `bakerBrumer_expDisc_transcendental` | `PadicBaker.eq_zero_of_add_sum_mul_eq_zero` (658), `PadicBaker.transcendental_add_sum_mul` (667) |

Even the README Checks are the same: `expTwistDeriv c 1 X = 1+cX` against the wrong sign `1−cX`, and `expTwistDeriv c m 1 = c^m`. The differences are small: Hasse derivatives in place of ordinary ones, and a general complete algebraically closed L in place of `ℂ_[p]`.

Witness: in its Downstream consumers, the LinearFormsInLogarithms README lists "The integral Iwasawa theory roadmap, for the algebraic-number form of Baker–Brumer and abelian Leopoldt: 8.10". On main, `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md` lines 57 and 2638 consume LinearFormsInLogarithms §§8.1–8.5 and §8.10 for these same objects.

Repair:
- Delete §§4.1a–4.1e, the README paragraphs at lines 49 and 60, and the §§4.1a–4.1e clause in the Layer 4 Dependencies.
- Delete `Suggested.lean` lines 163–433 and the docstring paragraph beginning "Brumer's `p`-adic form of Baker's theorem".
- Restore the supplier contract "LinearFormsInLogarithms §8.10 (`PadicBaker.eq_zero_of_add_sum_mul_eq_zero`)" for §§4.2–4.4.
- Keep in §4.2, as targets here, only the logarithm facts that LinearFormsInLogarithms does not plan: `log∘exp`, `exp∘log` and `‖log y‖=‖y−1‖` on the disc. Name Tau Ceti's `Padic.log_exp`, `Padic.exp_log` and `Padic.norm_log` (`TauCeti/NumberTheory/Padics/ExpLog.lean` lines 102–115) as their `ℚ_p` closed-disc case.

I tested this against the instance: §8.10 and `PadicBaker.eq_zero_of_add_sum_mul_eq_zero` exist at the LinearFormsInLogarithms head (4ff34d9). With that citation in place at 5d2ed25, the dependency check reported 0 problems. The pull request's own merge-order paragraph still lists LinearFormsInLogarithms. If ownership is meant to move into this roadmap instead, that has to be agreed with LinearFormsInLogarithms first: one owner, cited by the other. This README cannot settle that on its own.

## R02 (P3) — The Baker block's supporting API in `Suggested.lean` is padding

Location: `Suggested.lean` lines 169–391: `padicExpRadius_pos`, `padicExpRadius_lt_one`, `inv_lt_padicExpRadius_iff`, the nine exp/log disc lemmas, `inv_abs_le_norm_intCast`, `one_le_house_pow_mul_norm_of_isUltrametricDist`, the house and denominator lemmas, both Siegel forms, the two many-zeros bounds, both Hermite forms, `expTwistDeriv` with its three lemmas, and the three exponential-polynomial lemmas.

Claim: none of these is a headline theorem. Each is a step of the proof of `bakerBrumer_expDisc`, so `Suggested.lean` has become an API catalogue. `expTwistDeriv` is a definition that no headline needs.

Witness: I ran the one-tactic probe on a scratch copy elaborated with `lake env lean`; neither proof gave an error. `padicExpRadius_pos` closes with `exact Real.rpow_pos_of_pos (by exact_mod_cast (Fact.out : p.Prime).pos) _`. `padicExpRadius_lt_one` closes with a single `exact Real.rpow_lt_one_of_one_lt_of_neg …`. `inv_lt_padicExpRadius_iff` computes a small value: at p=2 both sides are false, since `1/2 < 2⁻¹` fails.

Repair: delete them from `Suggested.lean`; the README keeps the statements. Applying R01 removes the whole block anyway. This finding stands even if ownership stays here, in which case only the headline `bakerBrumer_expDisc` and its definition `padicExpRadius` would remain.

## R03 (P3) — `StarkSystems` block is still padding (previous R01, not repaired)

Location: `Suggested.lean` lines 79–106 (`exteriorBidual`, `toExteriorBidual`, `toExteriorBidual_ιMulti`, `toExteriorBidual_natural`). README line 1821: "This roadmap owns these as targets, in the namespace `TauCeti.StarkSystems`".

Claim: no headline uses these declarations. `toExteriorBidual_ιMulti` is proved in place by `exact exteriorPower.pairingDual_ιMulti_ιMulti φ u`. The sorried `toExteriorBidual_natural` closes on a scratch copy with `ext; simp [toExteriorBidual, exteriorPower.pairingDual]` (no error). The README also gives the namespace `TauCeti.StarkSystems`, while the Lean file declares `TauCetiRoadmap.IntegralIwasawaTheory.StarkSystems.*`. The previous review's R02 was reworded but not resolved.

Repair: delete lines 79–106 and the docstring paragraph "Section 12.6 also uses Mathlib's exterior powers …". §12.6 keeps the four statements as targets. With the Lean names gone, the namespace sentence names only the planned library home, and it no longer conflicts with a declared Lean name.

## R04 (P3) — `primePowerHasseUnitIndex_one` is narrower than its source (previous R07, not repaired)

Location: `Suggested.lean` line 136, `(hp : p ≠ 2)`. README line 189: "For odd p prove `primePowerHasseUnitIndex_one`".

Claim: the cited source states Hasse index 1 for 2-power conductors as well, and the Lean conclusion holds without `hp`.

Witness: Sharifi, Lemma 4.2.17 (sharifi line 3293, p. 106) gives `Q_F=1` for `F=ℚ(μ_m)`, `m≥3`, `m≢2 mod 4`, m a prime power, which includes `m=2^a`. For p=2, a=2 (`ℚ(i)`) the units `{±1,±i}` are torsion, so `indexRealUnits = 1`. For p=2, a=1 (`K=ℚ`) the real units are all units, so the index is 1.

Repair: drop `hp`, and write "for every prime power `p^a`" in §1.5 and in the docstring.

## R05 (P3) — The pinned Tau Ceti character group rings and quadratic presentations are not cited

Location: README line 43 ("In §6.1, `TauCeti.jointEval_injective` and the full-rank character-image lattice give the injection `O[Δ]→∏_ψ O`") and line 1181 ("The required square presentation means a map between projectives of equal componentwise rank").

Claim: Tau Ceti at the pin already proves the joint-evaluation injectivity and has quadratic presentations. The README cites PadicMeasuresIwasawaAlgebras' sorried placeholder instead, and defines "square presentation" again.

Witness:
- `Set.jointEval_injective` and `Set.charGroupRing` are in `TauCeti/Algebra/MonoidAlgebra/CharGroupRing.lean` (theorem at line 260).
- `TauCeti.QuadraticPresentation`, `QuadraticPresentation.fittingIdeal_eq`, `.baseChange` and `isQuadraticallyPresented_of_finite_maximalSpectrum` are in `TauCeti/Algebra/Module/Presentation/Quadratic.lean`.
- `TauCeti.jointEval_injective` exists only as a `sorry` in PadicMeasuresIwasawaAlgebras `Suggested.lean` line 833 on main.

Repair: add both modules to "From Tau Ceti" with these names. Cite `Set.jointEval_injective` at line 43, and in §8.4 state the square presentation as a `TauCeti.QuadraticPresentation`, keeping injectivity as the separate assertion. PadicMeasuresIwasawaAlgebras §6.1 stays the supplier for the finite-index lattice comparison.

## R06 (P3) — Remaining locator slips

Location and witness:
- (a) Line 174: "RJW, Lemma 12.18 and Corollary 12.19, p. 186". Lemma 12.18 is on journal p. 185 (rjw line 3659, running head 185); Corollary 12.19 is on p. 186. This is the part of the previous R06 that was not repaired.
- (b) Lines 420 and 1546: "Sharifi, Proposition 3.3.9, pp. 86–88". The proposition starts on p. 87 (sharifi line 2606; p. 87 begins at line 2603).
- (c) Lines 842 and 1305: "Dasgupta–Kakde–Silliman–Wang, §3.1, Lemma 3.1 and Theorems 3.2–3.3, pp. 21–24". §3.1 begins on p. 22 (dksw line 742). Theorems 3.2–3.3 are in §3.2, on p. 24 (dksw lines 817–836).

Repair: (a) "pp. 185–186"; (b) "pp. 87–88"; (c) "§§3.1–3.2, Lemma 3.1 and Theorems 3.2–3.3, pp. 22–24".

## Verified sound

**Repair of the previous review's findings (at 5d2ed25).**

| previous | status at ae7b458 | passage |
|---|---|---|
| R01 StarkSystems padding | not repaired (R03 here) | `Suggested.lean` lines 79–106 unchanged |
| R02 `TauCeti.StarkSystems` vs Lean namespace | reworded, not resolved (folded into R03) | line 1821 "owns these as targets, in the namespace `TauCeti.StarkSystems`" |
| R03 Sharifi §3.2 item numbers | repaired | lines 303 "3.2.18–3.2.19, pp. 78, 83"; 466 "Lemma 3.2.13 and the proof of Theorem 3.2.14"; 349 "3.2.15 and Corollary 3.2.16"; 334–336 "3.2.20–3.2.21"; 314 "Definition 3.3.5, p. 86" |
| R04 AWS pages | repaired | lines 485 "Theorem 2.1.20, p. 11"; 941 "pp. 21–22"; 1078 "pp. 21–23"; 1223–1245 "pp. 42–43, 47", "pp. 43–44", "pp. 43–45"; verified against the aws running heads (lines 1416–1694) |
| R05 Katz entry | repaired | References line 1887 |
| R06 one-page slips | partly (R06(a) here) | lines 152 and 176 now p. 185; line 796 "Washington 1975, Lemma 4 and proof, p. 185"; line 174 still p. 186 |
| R07 unused `hp` | not repaired (R04 here) | `Suggested.lean` line 136 |

**Gate, build, dependency check.**
- The worker's gate.md lists two `build` warnings ("imports `Mathlib` … consider adding `module`").
- My re-run of the same gate command at this head reports every check 0, `OK`, exit 0. The warning did not reproduce. 116 of the 142 roadmaps on main also start without `module`.
- Dependency check: `depcheck: 240 roadmaps, 2376 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/IntegralIwasawaTheory'` is empty. The folder holds README.md, Suggested.lean and metadata.toml.
- `lake env lean TauCetiRoadmap/IntegralIwasawaTheory/Suggested.lean`: 39 `declaration uses sorry` warnings and nothing else, exit 0.
- I compared the worker's 50 elaborated signatures with the README statements. Every binder is kept; for `bakerBrumer_expDisc` that includes `[CompleteSpace L] [IsAlgClosed L]`. The headline signatures (§§1.5, 3.3, 5.6, 7.4) have the README's generality, except for R04.

**Headline theorems.** The README's headlines are:
- §11.7 `integralDeterminantMainConjecture` and its presentation;
- §3.3 `classNumberGrowth`;
- §5.6 `ferreroWashington`;
- §§1.5–1.6 the Hasse and circular-unit indices;
- §4.4 abelian Leopoldt;
- §2.6 weak Leopoldt;
- §7.4/7.7 the Vandiver statements;
- §9.2 Mazur–Wiles over ℚ;
- §9.7 the finite CM Fitting identity;
- §12.5 Brumer–Stark.

The file states five of them on native carriers, plus `bakerBrumer_expDisc`, which is LinearFormsInLogarithms' headline (R01). The docstring names the rest as not statable, each with its missing carrier, and I agree with each judgement. Nothing is forced through a stand-in. One-tactic probe results are in R02 and R03. The five native headline statements have not changed since 5d2ed25 (the `Suggested.lean` diff is 283 insertions and 0 deletions), so the previous review's probe on them, in which `simp` made no progress, still applies.

**Adversarial pass (values on each side).**

| statement | instance | values computed | result |
|---|---|---|---|
| §2.1 `classGroupLimit` | constant system `ℤ/p`, identity norms; S=∅ | limit `ℤ/p` (order p), while `⊗ℚ_p` would give 0; S=∅ gives the ordinary system | holds; Sharifi Def 3.2.3 p. 78 (line 2353), Defs 3.2.18–3.2.19 p. 83 (2490–2493) |
| §2.5 `χ₂=−r₂` | K=ℚ; K=ℚ(i) | `Σ_{v∣∞}h⁰ − [K:ℚ]`: 1−1=0=−r₂; 1−2=−1=−r₂ | holds |
| §2.4a degree-two Check | `G=ℤ_p²`, H first factor, `D_p` | `H²(H,D_p)=0`, `H¹(Γ,H¹(H,D_p))=D_p=H²(G,D_p)` | holds |
| §2.7 `E_∞[2]=0` | K=ℚ(i), p=2 | `N(ζ_{2^{n+3}})=−ζ²_{2^{n+3}}`, so the limit of `μ` is `ℤ₂(1)`, torsion-free; `N(−1)=1` kills ±1 families | holds; Sharifi Prop 3.3.6 needs p odd or no real places (line 2589); the dyadic part rests on NSW (Not verifiable) |
| §4.1a radius | p=2: x=2; p=3; y=−1 at 2 | `ρ₂=1/2=‖2‖`, `‖2ⁿ/n!‖=2^{−s₂(n)}=1/2` at `n=2^k`, so the series diverges; `3^{−1/2}≈0.577>1/3`; `log(−1)=0`, `exp(log(−1))=1≠−1` | Checks and `inv_lt_padicExpRadius_iff` correct |
| `NormedSpace.exp` | definition at the pin | `if Nonempty (Algebra ℚ 𝔸) then (expSeries ℚ 𝔸).sum x else 1` (Exponential.lean:128), so the tsum is taken in L's topology: p-adic, with value 0 where divergent | the p-adic statements mean what they say |
| §4.1b Liouville | K=ℚ, x=p, c=1, H=p; x=p/2 | `1≤p·p⁻¹=1`; non-integral `(p/2)(1/p)=1/2<1` | Checks correct |
| §4.1c many zeros | `f=X²−X`, A={0,1}, S=1 | best `M=r²`; bound `r²·r⁻²=1`, attained by `±1` | correct; `evalAt` is a tsum (EvalAt.lean:100), but `‖coeff_k D^{(j)}f‖≤Mr^{−k}→0`, so the hypothesis is not junk-satisfied |
| §4.1c `expTwistDeriv` | (c,1,X); (0,3,X⁴); p=2, ψ=4, r=2 | `1+cX` (elaborated); `24X`; `‖4^k/k!‖2^k=2^{v₂(k!)−k}≤1` | Checks correct |
| §4.1d `∂F_m=ΣF_{m+1_o}` | general; k=0, D=1 | `E'+ψE` with `ψ=t₀θ+Σc_rλ_r` gives `F_{m+1_0}+ΣF_{m+1_r}`; `(e^{λ₀X})'=θe^{λ₀X}` iff `λ₀=θ` | correct |
| §4.1d (a)–(b) sizes | `c₁(t)`, E | `δc_r` has house `≤δD+DG≤2DG`; `δ^{m₀}E(X^u)(ℓ)` has house `≤(2DG)^{m₀}ℓ^D`; k=0, D=h=1 gives E=2G⁴ (2 and 32); 2·2 equations against 4 unknowns | correct |
| §4.1d (c) `δ≤G` Check | p=5, α′=1/6, δ=6, G=1 | `‖λ₀‖=1/5 < (2G)^{−1}=1/2`, so the bound fails without `δ≤G`; with G=6, `1/12≤1/5` | Check correct |
| §4.1e exponents | X=2ⁿ | `(8k+13)(k+2)−4(k+2)(2k+3)=k+2`; cond. 4: `X^{9k²+48k+59}` vs `X^{8k²+37k+39}`; cond. 3: `2^{J*−J−1}X^{12k+23+J}` vs `X^{12k+22+J}` | the argument closes (the mathematics is sound; R01 is about ownership) |
| §4.2 kernel | α=p; α=ζ | `log_p p=0` with `p=ζp^k` for ζ=1, k=1; roots of unity | correct; Sharifi Thm 1.5.17 (line 962, p. 33) covers p-adic units, and §4.2 states the power reduction |
| §4.4 abelian Leopoldt | ℚ(√5) | r=1; ε has infinite order and is not of the form `ζp^k`, so `log_p ε≠0` | holds; Sharifi Thm 1.5.21 (line 1047, p. 35) has no restriction on p |
| §6.0 divisor `2^t` | all/no real places in Σ′; ζ_ℚ(0) | `2^d` / 1; DKSW Thm 1.2 has `t=#(S∞∩Σ′)` (dksw 167–169, p. 5); smoothing at 3: `(1−3)(−1/2)=1`, at 2: `1/2` | holds |
| §6.4 twist | `M=ℤ_p` trivial, f=T | `M(−r)`: γ acts by `u^{−r}`, `#M_Γ=|u^r−1|_p⁻¹`, `M^Γ=0` (r≠0); r=0 infinite | matches Kolster Lemma 1.1 (line 98–104, p. 6) |
| §7.3 `q_a(b)` | conjugation; p=3, b=2 | `c̄=ζ^{1−b}c`, phase `ζ^{(1−b)/2}` real; `−1/2≡1 mod 3`; mod π: `ω(b)⁻¹b≡1` | correct; RJW Lemmas 12.18, 12.20–12.22, Thm 12.23 at pp. 185–188 (lines 3659–3790) |
| §8.3 Selmer | product vs sum | DK (29) product over `w∉Σ_H∪Σ′_H` (dk 685–689, p. 19); `Σ_w ord_w` is in the product image, not the sum image | holds; Lemma 3.1 and (30)–(31) on pp. 19–20 |
| §9.1 Eisenstein | p=691, k=12 | `12≢0 mod 690`; `τ(2)=−24`, `1+2¹¹=2049`, `2049+24=3·691` | Check correct; AWS Def 4.3.1 (line 1620, p. 47), `ξ(v^s−1)=L_p(ω^k,s−1)` (1644), `T₀↦ξ/2` (1654) |
| §10.4 determinant | `[O –2→ O]` | degrees (1,2): `H²=O/2`, `Det⁻¹=(2)`; degrees (2,3): `H³=O/2`, `Det⁻¹=(1/2)` | consistent with Conventions and §11.7 (H³ contributes `T⁻¹`) |
| §10.6 dyadic factor | d=0,1,2; D with γ=3 | 1, (2), (4); `D^Γ=D[2]` order 2, `D_Γ=D/2D=0` | holds; Kurihara Lemma 4.2 (line 924, p. 25) |
| §12.3 special values | F=ℚ, n=2, p=2; p=3 | `v₂(−1/12)=−2`, `v₂(24)=3`, sum 1, so H² has order 2; p=3: ψ=ω²=1, `v₃(−1/12)+v₃(24)=−1+1=0` | holds; RW Thm A.1 (line 2357, p. 45) |
| `classNumberGrowth` | n=0; `e_n=n−1` | layer 0 = fixed field of the whole group = K; `(μ,λ,ν)=(0,1,−1)` needs ν∈ℤ | holds |
| `ferreroWashington` | E=ℚ, p=2 | `ℚ(μ_{2^{n+1}})` have odd class number, `(λ,ν)=(0,0)` | holds |
| `primePowerCircularUnitIndex` | p=2, a=2; p=5, a=1 | generators −1, i, 1−i, 2, 1+i ⊃ units `{±1,±i}`: both indices 1 = h(ℚ); ℚ(ζ₅): index 1 = h(ℚ(√5)) | holds |
| `primePowerHasseUnitIndex_one` | ℚ(i); ℚ | units = torsion, index 1; real units = all, index 1 | holds without `hp` (R04) |
| `vandiver_propagation` | p=3; p=37 | ℚ(ζ₃)⁺=ℚ, h=1; 37 irregular, yet the condition holds | holds |
| `bakerBrumer_expDisc` | ℓ=1 in ℂ_p; ℓ₂=2ℓ₁; ι empty | `exp 1=0` (junk) with `−1+1·1=0`, excluded by `‖1‖=1>ρ`; excluded by ℚ-independence; `β₀=0` | statement correct (R01 concerns ownership) |

**Library declarations opened at the pins.**
- Mathlib: `NormedSpace.exp` and `expSeries` (Analysis/Normed/Algebra/Exponential.lean:108, 128), `exp_add_of_mem_ball` (438), `NormedSpace.log` (Analysis/Normed/Algebra/Logarithm.lean), `NumberField.house.exists_ne_zero_int_vec_house_le` (NumberTheory/NumberField/House.lean:348, which needs `0<p` and `a≠0`, as the README says), `house_prod_le` (54, a product over `Finset K`), `one_le_house_of_isIntegral` (93), `house_sum_le_sum_house` (45), `house_nat_mul` (69), `house_intCast` (74), `IsUltrametricDist.of_normedAlgebra` (Analysis/Normed/Algebra/Ultra.lean:41), `Nat.Prime.sub_one_mul_multiplicity_factorial` (PadicVal/Basic.lean:691), `PadicComplex.isAlgClosed` (Padics/Complex.lean:244), `Polynomial.factorial_smul_hasseDeriv` (Algebra/Polynomial/HasseDeriv.lean:134), `Algebra.norm_eq_prod_embeddings` (RingTheory/Norm/Transitivity.lean:261), `exists_integral_multiples` (DedekindDomain/IntegralClosure.lean:115), `NumberField.of_module_finite` (NumberField/Basic.lean:65), `NormedField.toAbsoluteValue` (Normed/Unbundled/RingSeminorm.lean:482).
- Tau Ceti: `PowerSeries.evalAt` (RingTheory/PowerSeries/EvalAt.lean:96), `PowerSeries.hasseDeriv` and `factorial_smul_hasseDeriv` (HasseDeriv/Basic.lean:72, 218), `IsRestricted.evalAt_eq_zero_iff` (Weierstrass/Schwarz.lean:75), `IsRestricted.norm_evalAt_le_gaussNorm_mul_prod_pow` (Schwarz.lean:182), `gaussNorm_mul_of_isRestricted` (GaussNorm.lean:983), `IsNonarchimedean.apply_le_one_of_isIntegral_int` (Analysis/AbsoluteValue/Nonarchimedean.lean:131), `Padic.norm_exp_sub_one`/`norm_log`/`log_exp`/`exp_log` (NumberTheory/Padics/ExpLog.lean:95–115), `Set.jointEval_injective` (Algebra/MonoidAlgebra/CharGroupRing.lean:260), `TauCeti.QuadraticPresentation` (Algebra/Module/Presentation/Quadratic.lean), and the integer-unknown Siegel lemma in NumberTheory/NumberField/SiegelsLemma.lean, which is a different statement from §4.1b's.

**Cross-roadmap citations resolved.**
- IntegralHeckeAndGaloisDeterminants Layer 6 `IntegralRibet.local_ribet`, at its open head: README line 4960 under "Layer 6: integral Ribet modules and Fitting ideals", `Suggested.lean` line 581. It is earlier in the merge order (23 against 25).
- PadicMeasuresIwasawaAlgebras on main: §4.7 (line 2914, `growthTransition` Suggested 683), §5.1 (3172), §5.2 (3367), §6.1 (3447, `jointEval_injective` Suggested 833).
- LinearFormsInLogarithms Layer 8 at its head (R01).
- Ownership greps across the open heads: `exteriorBidual` is cited, not owned, by EulerSystemsAndKolyvaginSystems. EulerSystemsCyclotomicMainConjecture consumes Ferrero–Washington from this roadmap (its README line 222), and NoncommutativeAndEquivariantIwasawa uses it only as a known input. GL2ModularityLifting now cites §4.1e here (R01 affects it). I found no other second owner. `overlaps.md` reports no dropped ids and no other pull request changing this folder.

**Seeded sample** (theorem, page, hypotheses):
- 2.1: Sharifi Defs 3.2.3, 3.2.18–3.2.19 (above). Kurihara §3 begins on p. 15 (line 531, p odd, direct limit `A_{K∞}`).
- 2.5: NSW only, see Not verifiable.
- 2.7: Sharifi Thm 1.5.4 p. 29 (line 800); Props 3.3.6, 3.3.9 and Cors 3.3.10, 3.3.14 on pp. 86–89 (lines 2589–2668).
- 4.1a, 4.1d: see Not verifiable. The mathematics was recomputed in the table.
- 4.2: Sharifi Thm 1.5.17 p. 33.
- 4.4: Sharifi Thm 1.5.21 pp. 35–36, Lemma 1.4.12 p. 26 (line 723).
- 6.0: DKSW Thm 1.2 pp. 4–5; slip (c) in R06.
- 6.4: Kolster Lemmas 1.1–1.2, pp. 6–7 (lines 98, 126).
- 7.3: RJW as in the table.
- 8.3: DK §3.1 pp. 19–20; Kurihara Prop 2.11 p. 13 (line 464).
- 9.1: AWS Defs 4.2.1–4.2.6 pp. 42–43 (1445–1488), Remark 4.3.2 p. 47 (1626), Thms 4.2.5, 4.2.7 p. 43, 4.2.9 and Cor 4.2.12 p. 44, Thm 4.3.3 pp. 47–48.
- 10.4: Kolster Props 3.1–3.2 p. 14 (lines 383, 391); Kurihara Thm 4.1 p. 24 (882) and the three remarks on p. 27 (993).
- 10.6: Kurihara Lemma 4.2 p. 25; slip (b) in R06.
- 12.3: Kolster Props 3.1–3.2 p. 14; RW Thm A.1 p. 45.

## Not verifiable

- NSW, *Cohomology of Number Fields* 2.3 (§§2.0, 2.5, 2.7, 10.0, 10.5): the sources service returns the author's landing page (`NSW2e/`) as HTML, with and without the file path. The 2.5 locators (Thm 8.3.20, 8.7.5–8.7.7, 5.6.15–5.6.17) and the dyadic half of 2.7 (Lemma 10.3.13, Cor 10.3.24) are unread.
- Baker, *Transcendental Number Theory*, Ch. 2 (§§4.1c–4.1e): a Cambridge book, not open. Brumer 1967 (§4.1e): DOI 10.1112/s0025579300003703 leads to Wiley, HTTP 403. Koblitz, GTM 58 (§4.1a) and Hindry–Silverman, GTM 201 (§4.1b): Springer books, not open. Rousseau, exposé 11 (Numdam, read) proves only the homogeneous form (theorem on p. 11-01, rousseau line 38). The β₀ form rests on Baker Ch. 2.
- Burns–Kurihara–Sano (§10.0), Ribes–Zalesskii (§2.4a), Kolster 1989, Greenberg 1983, Yamashita 1984: as in the previous review (paywalled or refused). I did not re-read Deligne–Ribet (OCR) or Sinnott 1984 in this round.
- Ownership against the open pull requests that the brief lists only by name was checked only through `roadmaps grep` and `roadmaps show`, by object (Baker–Brumer, Ferrero–Washington, exterior bidual, abelian Leopoldt).

## Source issues

- **Error** in rjw at Theorem A.3 (Iwasawa), journal p. 200 (rjw line 4242): the source says the constant ν in `e_n=μpⁿ+λn+ν` is a non-negative integer; it should be an arbitrary integer, as in Sharifi Theorem 3.2.14 (`ν∈ℤ`, sharifi line 2462); affects a stated result.
