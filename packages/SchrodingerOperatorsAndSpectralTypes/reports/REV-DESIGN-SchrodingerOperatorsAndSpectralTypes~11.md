<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13815#issuecomment-6899525488 -->
Review (claude) of 6ce05fc

Verdict: accepted
Conditional on the announced gaps: `weyl-criterion`, `spectral-integral-resolvent`

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

No finding. The three findings of round 10 (all P3) are repaired, and the passages the repairs
rewrote are correct. The acceptance is conditional on the two declared supplier gaps
`gap:weyl-criterion` and `gap:spectral-integral-resolvent`; both are precise, minimal and declared
in `design/plan.json` and in the README, so they are contracts, not findings. The last repair
report marked nothing "not actionable", so nothing is re-raised. This review changed no file of
the design and added nothing to the manifest. Line numbers refer to
`packages/SchrodingerOperatorsAndSpectralTypes/design/README.md` unless another file is named.

## Previous findings, checked first

| Round 10 finding | Status | Repaired passage and what was verified |
|---|---|---|
| F01 (P3): Downstream consumers names four earlier roadmaps | repaired | Lines 1614–1617: "Roadmaps on the scattering theory of Schrödinger operators … (Layer 1)" and "Roadmaps on the spectral geometry and heat kernels of complete noncompact manifolds … (3.6, 3.7, 3.9)". The third bullet no longer repeats the subjects. `design/plan.json`: `"consumers": []`. A search of the README and the plan for RelativisticQuantumFieldTheory, SpectralManifolds, PositiveMass and RicciFlow finds nothing. |
| F02 (P3): single-vector route of 1.4(1) does not cover `σ_pp` | repaired | Lines 593–596: "For `σ_pp`: if `P_A({λ}) ≠ 0`, a nonzero `f ∈ ran P_A({λ})` has `μ_f = ‖f‖²δ_λ` … otherwise `μ_{P_pp f_n}({λ}) = ‖P_A({λ}) P_pp f_n‖² = 0` and the annulus argument applies". Lines 590–592 also fix the choice that makes the annuli distinct. Recomputed below. |
| F03 (P3): "Glazman's lemma" a bare route input | repaired (differently from the proposal, and correctly) | Lines 662–679: the variational count is stated for every self-adjoint `A` and real `λ` and both bounds are proved; *Needs:* (line 679–680) and plan target 1.6b gain UO-A01–UO-A02; a Check is added (lines 686–690). The repair report's objection to the round-10 proposal holds: teschl line 5075–5077 is the injectivity argument, which gives only `dim L ≤ dim ran P_A((−∞, λ))`. Recomputed below. |

Adversarial pass on the changed passages and the repaired patterns elsewhere: rows 1.4(1) and 1.6
of the table. Other named results used as route inputs were listed again (Green's formula,
Poincaré inequality, Duhamel's formula, Weyl's theorem, Weyl's criterion, Rosenblum's lemma,
Parseval, Plancherel): each is stated where it is used, is a section of this roadmap, a supplier
item, a pinned declaration or the declared gap. No other single-vector construction occurs (1.5
uses 1.4(1) pointwise). No roadmap is named as a consumer.

## Verified sound

**Scope of this round.** The three repairs; the fifteen seeded targets (1.2, 1.4, 1.5, 1.6, 1.8,
1.9, 2.1, 2.2, 2.3, 3.2, 3.5, 3.7, 3.8, 4.2, 4.4) in full with their locators; the contracts and
both gaps; the six maintainer notes; the plan (44 targets: 26 theorems, 17 definitions, 1 example;
no dangling `target:` prerequisite; every definition has API entries and at least three tests;
every target a locator); the manifest (21 entries, 8 certified, 13 uncertified; every key cited in
the README is recorded and every recorded key is cited). Sections outside the sample and untouched
by the repairs (1.1, 1.3, 1.7, 3.1, 3.3, 3.4, 3.6, 3.9, 3.10, 4.1, 4.3, 4.5) were read in full;
their rows of the round-10 table carry computed values and are relied on.

**Principles.** No route-specific shortcut: arbitrary `ℋ` (separability only in 1.4(4)), every
self-adjoint `A`, every `d ≥ 1`, disconnected, zero-dimensional and empty manifolds. Existing
roadmaps are consumed and not planned again (UO-C03's subspaces, QuantumFoundations §8.2's `H₀`,
RiemannianGeometry R5c's closed-manifold theory, VariationalMethods 4.4's compact case). One
direction of supply (gate below). No copied passage and no algorithm. A design has no
`Suggested.lean`, hence no sorry'd data and no `set_option`. A search of the README for TeX
delimiters, pull-request numbers, machine paths, HTML anchors, "round", "so far", "checkpoint",
"handoff", "optional", "deferred" and the keyword `lemma` finds only the names "Rosenblum's lemma"
and "Glazman's lemma".

**Adversarial table** (values computed this round; sampled targets, headline theorems, repaired
passages).

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.2 four identities | `M_x ⊕ 1/2` on `L²[0,1] ⊕ ℂ`, `f = (1, 1)`; `f = √2·1_{[0,1]}`; Cantor measure | `μ_f = Leb|[0,1] + δ_{1/2}`, atom set `{1/2}`, `μ_{P_pp f} = δ_{1/2}`; `2Leb` against the reversed `4Leb`; singular part `c`, atomless, `μ_{P_pp f} = 0` | correct | none |
| 1.4(1) route, `σ_ac` | `I_{1/n} ∖ {λ} = ⋃_{m ≥ n} J_m` | `μ_{P_ac f_n}({λ}) = 0` and `μ_{P_ac f_n}(I_{1/n}) > 0` force some `J_m`, `m ≥ n`, charged; with `m_k` strictly increasing the pieces are orthogonal, `μ_g = Σ|c_k|²μ_k`, and `J_{m_k} ⊆ I_ε` once `1/m_k < ε` | correct | none |
| 1.4(1) route, `σ_pp` | `A = 5` on `ℂ`, `λ = 5`; `diag(1/k)`, `λ = 0` | `P_A({5}) = 1`, `f = 1`, `μ_f = δ₅` charges every `(5 − ε, 5 + ε)`; `P_A({0}) = 0`, `δ_{1/k}` charges `J_m` iff `m = k − 1`, `f = Σ k⁻¹e_k` has atomic part `Σ k⁻²δ_{1/k}` charging every `(−ε, ε)` | correct | none |
| 1.4(1) route, without the distinct-annuli choice | `diag(1/k)`, `f₁ = f₂ = e₃` | both steps may pick `J₂ ∋ 1/3`; weights `1, −1` give `0`; with `n₂ > m₁ = 2`, `m₂ ≥ 3` | the stated choice is needed and is stated | none |
| 1.4(3) | `μ_f ≪ μ_ψ`, `h = dμ_{ψ,ac}/dLeb` | `μ_{f,ac}(I_ε) > 0 ⇒ μ_{ψ,ac}(I_ε) > 0 ⇔ Leb(I_ε ∩ {h > 0}) > 0` | correct | none |
| 1.4 Checks | `(0,1)^ess`; `ℚ^ess`; `diag(1,2)`, `(1,0)` | `[0,1]`; `∅`; `δ₂` not `≪ δ₁` | correct | none |
| 1.5 three items | `M_x` on `L²([0,1] ∪ [2,3])`; `a = b`, `A = 0`; fat Cantor `K` | `J ⊆ (0,1)`: mass `Leb(J) > 0`; mass of `(1,2)` is `0`; right side vacuous, `{a} ⊄ ∅`; `K^ess` has empty interior | both directions correct | none |
| 1.5 third item, (⇒) | finite Borel `μ`, `μ((a,b)) > 0` | `(a,b) ∖ supp μ` is `μ`-null, so `supp μ ∩ (a,b) ≠ ∅`; `supp μ_{P_ac f} ⊆ σ_ac` | correct | none |
| 1.6 values | `diag(1,3,5)`; `M_x` on `L²[0,1]`; `−1 ⊕ H₀`; `ℋ = 0` | `1, 3, 5, +∞`; `0, 0, …`; `−1, 0, 0, …`; `μ₁ = inf ∅ = +∞ = inf σ_ess` | correct | none |
| 1.6 variational count, `≥` | `diag(1,3,5)`, `λ = 4`, `L = span(e₁, e₂)` | `L ∩ span(e₃) = 0`, `P((−∞,4))` is the identity on `L`, `2 ≤ 2` | correct | none |
| 1.6 variational count, `≤` | same, `B_m = [4 − m, 4 − 1/m]` | `m = 1`: `{3}`, dimension `1`; `m = 3`: `[1, 11/3]`, dimension `2`; form `≤ 11/3 < 4` | correct | none |
| 1.6 strictness | `diag(1,3,5)`, `λ = 3` | `dim ran P((−∞,3)) = 1`; `e₂` has form `3 = 3‖e₂‖²`, excluded; with `≤` the count would be `2` | strict inequality needed, stated | none |
| 1.6 count, infinite case | `M_x` on `L²(ℝ)`, `λ = 0` | `span{1_{[−j−1,−j]}}_{j ≤ k}` has form `Σ|c_j|²(−j − ½) < 0`; supremum `∞ = dim ran P((−∞,0))` | correct, in `ℕ ∪ {∞}` | none |
| 1.6 count from the obstacles | `diag(1,3,5)`, `λ = 3`; `−1 ⊕ H₀`, `λ = −1/2` | `d = 1`: `μ₁ = 1 < 3`, obstacle `e₁` leaves form `≥ 3`, `μ₂ ≥ 3`; `μ₁ = −1`, `μ₂ ≥ 0 > −1/2`, count `1` | correct | none |
| 1.6 finite rank below `inf σ_ess` | `A` bounded below, `λ < inf σ_ess` | `σ(A) ∩ (−∞, λ]` compact, covered by finitely many finite-rank windows (UO-C02) | uses the standing lower bound, which 1.6 has | none |
| 1.8 definition laws | `|λ|^{−1/4}1_{[−1,1]}`; `m = −1, 0, 1`; `H = 0` on `ℂ` | `{h ≤ m²} = {|λ| ≥ m⁻⁴}`, tail `2·2m⁻² = 4/m²`; `1 ≤ m²` fails only at `m = 0`; `∫ 1 dt = ∞ > 0` | correct | none |
| 1.8 Rosenblum bound | `M_λ`, `x = m·1_{[0,1]}`, `C = ⟨φ,·⟩φ` | `∫|∫conj(φ)x e^{−itλ}dλ|²dt = 2π∫|φx|² = 2πm²` = `2πm²‖C‖²_HS` | constant sharp | none |
| 1.8 square root | `diag((−1)^{n+1}/n²)` | `|V|^{1/2} = diag(1/n)`, energy `Σ n⁻² = π²/6` = sum of singular values | correct | none |
| 1.9 Duhamel sign | `u ↦ ⟪e^{−iuH₂}ψ, Je^{−iuH₁}φ⟫` | derivative `i⟪H₂ψ_u, Jφ_u⟫ − i⟪ψ_u, JH₁φ_u⟫ = i⟪ψ_u, Cφ_u⟫` (first slot conjugate-linear) | correct | none |
| 1.9 intertwining | `W(t) = e^{itH₂}Je^{−itH₁}` | `e^{isH₂}W(t) = e^{i(t+s)H₂}Je^{−i(t+s)H₁}e^{isH₁} = W(t+s)e^{isH₁}` | correct | none |
| 1.9 completeness (c) | `x = Ω_±(H₁,H₂)y` | `‖e^{itH₂}e^{−itH₁}x − y‖ = ‖x − e^{itH₁}e^{−itH₂}y‖ → 0` | correct | none |
| 1.9 Checks | `V = 0`, `diag(1,2)`; `diag(1/n²)`, `V = −diag(1/n²)`; `M_x`, `2M_x`, `1_{[0,1]}` | `W_± = 0`, `Ω_± = 1`; `H₂ = 0`, `e^{−it/n²}c_n` has no limit; `⟪x, e^{itx}x⟫ = (e^{it} − 1)/(it) → 0`, distance `1` | correct | none |
| 2.1 Gaussians | `e^{−πx²/n²}` | `‖u‖² = n/√2`; `‖u′‖² = (4π²/n⁴)·(n²/4π)·(n/√2) = π/(n√2)`; quotient `π/n²` | correct | none |
| 2.1 equivalence | `A = 2` on `ℂ`; `M_x`; `ℋ = 0` | holds iff `γ ≤ 2`; all three false; all three true | correct | none |
| 2.2 bounds | `diag(0,1) + diag(1,−1)`; `V = c` | `diag(1,0)`, `λ₀ = 0 ∈ [−1, 1]`; equality both sides; graph norms: `‖(A+V)x‖ + ‖x‖ ≤ (1 + ‖V‖)(‖Ax‖ + ‖x‖)` | correct | none |
| 2.3 resolvent bound | `sup_{λ ≥ γ}|λ|/(λ − μ)`, `d = γ − μ` | for `λ > 0` monotone between its value at `γ` (or `0`) and `1`; for `λ ∈ [γ, 0]` decreasing from `|γ|/d`; supremum `max(1, |γ|/d)`; `a/d + b < 1 ⇔ d > a/(1 − b)`, `(a + b|γ|)/d < 1 ⇔ d > a + b|γ|` | correct | none |
| 2.3 Checks | `A = 2`, `V = 1`, `μ = 0`; scalar `A = λ ≥ γ`, `V = −(a + b|λ|)` | `R_A(0) = −1/2`, `(1 + 1/2)·2 = 3`; `λ − a − b|λ|` is increasing in `λ`, minimum `γ − a − b|γ|` at `γ` | correct | none |
| 3.2 | `(0,1)`; countable discrete `X` | `−u″ + u = 0` has `eˣ, e^{−x} ∈ L²(0,1)`; `Δ₀ = 0`, closure `0` on `ℓ²(X)` | correct | none |
| 3.5 cutoffs | clamp, step `φ`; `(0,1)` | clamp `1 ⇒ g ≥ 7/8 ⇒ φ = 1`; clamp `0 ⇒ g ≤ 1/8 ⇒ φ = 0`; `|grad| ≤ 2·(2/k) = 4/k`; `1 ≤ (4/k)(1/2)` fails for `k > 2`; slope `1/(3/4) = 4/3 < 2` | correct | none |
| 3.7 `λ₁⁺ = λ₁` | point; `ℝ`; circle; `ℝ²/ℤ²` | `+∞ = +∞`; `0 = μ₂ = inf σ_ess`; `λ₁ = λ₂ = 1`, `μ₂ = μ₃ = 1` in R5c's numbering; `4π²` four times | correct | none |
| 3.7 general case | connected, finite volume, `m = inf(σ ∖ {0}) > 0` | `m < inf σ_ess`: `m` is a discrete eigenvalue, `μ₂ = m`; `m = inf σ_ess`: no eigenvalue in `(0, m)`, `μ₂ = m` | correct | none |
| 3.8 `κ`, eigenspace identity | `conj(u)v`; circle, `μ = 1`; `N` points; `∅` | real part `⟪Re u, Re v⟫ + ⟪Im u, Im v⟫`, imaginary `⟪Re u, Im v⟫ − ⟪Im u, Re v⟫`; dimensions `2` and `2`; `0` for `k < N` then `+∞`; all `+∞` | correct | none |
| 4.2 density, form | `e^{−πx²}`, `d = 1` | density `e^{−λ/(2π)}/(2π√λ)`, mass `(2π)⁻¹Γ(1/2)(2π)^{1/2} = 2^{−1/2}`; `q(u) = 4π²·(1/(4π))·2^{−1/2} = π/√2` | correct | none |
| 4.4 square well | `k = 0.739` | `tan k = 0.911`, `k tan k = 0.673`, `√(1 − k²) = 0.674`, `E = −0.454 ∈ [−1, 0)` | correct | none |
| 4.4 Checks | `V = 1`; `V = 1_{B_1}`, `d = 3` | `σ_ess = [1, ∞) ≠ [0, ∞)`, decay clause not applicable; `σ ⊆ [0,∞)` and `σ_ess = [0,∞)` give `σ = [0,∞)` | correct | none |
| Downstream consumers | lines 1614–1620 | no roadmap of the merge order named | correct | none |

**Sources (the seeded sample).** The author flags no locator as unverified. Read at the text this
round: teschl line 1780 (§1.2, separability), 3043–3046 ((2.68), `R_A(z) = (A − z)⁻¹`), 2914–2917
and 2960–2966 (Theorems 2.12, 2.13), 4315–4332 ((3.79), Lemma 3.15, p. 104), 4350–4366 (maximal
spectral vector, Lemma 3.16), 4388–4427 ((3.83), Lemma 3.19, (3.85), unitary invariance),
5044–5057 (Theorem 4.10, p. 119, Corollary 4.11), 5063–5077 (Theorem 4.12(i) and the injectivity
step of its proof), 5683–5720 (Lemma 6.3, Theorem 6.4, p. 135), 6277–6281 (Lemma 6.17, p. 145),
7086–7143 ((7.22)–(7.24), Theorem 7.8, Lemma 7.9, (7.26), p. 168), 9578–9589 (Theorem 10.2, p. 222);
kato57 line 21–35 (Theorem 1, (1.1)–(1.3)) and 92–111 (Lemma 2.1, (2.7), constant `2πm²`);
yafaev04 line 116–122 (Definition 1.3), 136–140 (Theorem 1.4), 191–206 (Theorem 1.8, Lemma 1.9);
rosenblum57 line 70–72 (Theorem 1.6), 80–95 (the weak-to-strong step) and its §§3–4 headings;
bms02 line 128–129, 151–157, 245–246 and 252–256 (Corollary 2.10, Remark 2.12); hm23 line 41–47
and 104–105. Every number and page agrees and every passage supports its statement, with the
differences the README states (arbitrary `ℋ`; (1), (2) of 1.4 and all of 1.5 deduced here; the
count of 1.6 proved here; every bounded `V` in 4.4, Theorem 10.2 covering the decaying clause
only; the disconnected case of 3.6). Sections 3.5 and 3.8 rest on uncertified texts on the source
side (below). Nothing was fetched; no `needs-references.toml` was written.

**Pinned libraries** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, the pins of the manifest and of the
plan's baseline). Located this round by file and line:
`ContinuousLinearMap.nuclearENorm` (`TauCeti/Analysis/OperatorIdeal/Nuclear/Basic.lean:53`, the sum
of the singular values; it carries no trace, only the gauge) and
`isCompactOperator_of_nuclearENorm_ne_top` (:153); `hilbertSchmidtEnergy_indep`
(`TauCeti/Analysis/InnerProductSpace/HilbertSchmidt/Basic.lean`);
`isCompactOperator_of_hilbertSchmidtEnergy_ne_top` (`HilbertSchmidt/Columns.lean`);
`IsSelfAdjoint.hasCompactResolvent_iff_isCompactOperator_resolvent` (`LinearPMap/CompactResolvent.lean`);
`IsSelfAdjoint.exists_hilbertBasis_forall_apply_eq_smul_of_hasCompactResolvent` (`LinearPMap/Eigenbasis.lean`);
`LinearPMap.IsReducing.isSelfAdjoint_restrict` (`LinearPMap/Reducing.lean`);
`IsSelfAdjoint.add_of_isRelativelyBounded` (`LinearPMap/KatoRellich.lean`);
`IsSelfAdjoint.isFormalAdjoint` (`LinearPMap/SelfAdjoint.lean`); `LinearPMap.resolvent_sub_resolvent`;
`HasCompactSupport.mgradient` (`TauCeti/Geometry/Manifold/Riemannian/Gradient/Basic.lean:116`) and
`contMDiff_mgradient`; `TauCeti.isLocallyFiniteMeasure_riemannianVolume` (`VolumeDensity/Volume.lean`);
`TauCeti.HyperbolicMetric` (`Riemannian/Hyperbolic.lean`); `TauCeti.Wkp`
(`TauCeti/Analysis/Sobolev/Wkp/Basic.lean:145`); `TauCeti.Complexification`
(`TauCeti/Analysis/Normed/Module/Complexification.lean:82`) and
`WithLp.instComplexificationCompleteSpace`; the directory
`TauCeti/Analysis/InnerProductSpace/ProjValMeasure/` (no resolvent statement in it, which is what
`gap:spectral-integral-resolvent` asks for). Mathlib: `mutuallySingular_singularPart`
(`Mathlib/MeasureTheory/Measure/Decomposition/Lebesgue.lean:106`), `adjoint_apply_of_not_dense`
(`Mathlib/Analysis/InnerProductSpace/LinearPMap.lean:172`),
`memSobolev_iff_exists_smulLeftCLM_fourier` (`Mathlib/Analysis/Distribution/Sobolev.lean:222`),
`laplacian_eq_fourierMultiplierCLM` (`FourierMultiplier.lean:107`), `IsCompactOperator.comp_clm` and
`isCompactOperator_of_tendsto` (`Mathlib/Analysis/Normed/Operator/Compact/Basic.lean:271, 459`),
`MeasureTheory.Lp.fourierTransformₗᵢ` (`Mathlib/Analysis/Fourier/LpSpace.lean`). The remaining
names of the contract are those round 10 located by file and line at the same pins.
`CompactFormPair.eigenvalue_eq_rayleighMinMax` is VariationalMethods 4.4's
(`TauCetiRoadmap/VariationalMethods/Suggested.lean` line 171) and is attributed to it at line 84;
the README attributes no backticked Lean name to this roadmap.

**Suppliers, resolved now** (main at `1a19c9f`, open heads of the index of this job).
UnboundedOperators (`TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md`): §1.1 UO-A01
(line 241: maximal second-moment domain, cutoffs), §1.2 UO-A02 (259: every self-adjoint `A` is
`id[P_A]`; the resolvent step is stated for `P_A`), §1.6 UO-A06 (303), §1.7 UO-A07 (309), §2.3
UO-B03 (408: (i) projections, (ii) resolvents, (iii) groups), §3.1 UO-C01 (523), §3.2 UO-C02 (533:
two definitions, their equivalence, unitary invariance, finite-rank windows; Lemma 6.17 is a
locator and a step of the Fredholm proof, not an item), §3.3 UO-C03 (552: the three subspaces on a
bare `TauCeti.ProjValMeasure ℝ H`, restriction self-adjointness in the finite-control case,
`σ(A_pp) = closure σ_p(A)`, the union formula), §4.7 UO-D06 (703), §5.1 UO-E01, §5.4 UO-E04, §5.6
UO-E05, §5.7 UO-E06 (900–1033). SelfAdjointSpectralTheory: SA-B44, SA-B85, SA-C12, SA-C19, SA-C25,
SA-C39, SA-C54, SA-C86, SA-D12, SA-D22, SA-E05, SA-E08, SA-E11–SA-E13 (lines 1226–1231: lower,
upper and two-sided form bounds from spectral support, as the route of 1.6 uses them), SA-E26,
SA-E30, SA-E44, SA-E47 (lines 420–1324). VariationalMethods 4.4 and 5.1 (782, 839).
RiemannianGeometry R5c (3715) and R7.1–R7.8 (4300). ComplexKahlerGeometry K5a and
K5a.ComponentwiseCompact (2092). HilbertModules H6 (705). SmoothBundlesConnections B2.2 (605).
PseudodifferentialOperators P1.0. PDE §1.2 (720), §1.3 (769), §6.3 F26 (2309). DifferentialGeometry
Layer 12 (2796; items 12.2–12.5). OperatorIdeals OI-B29 onwards (349). FuchsianOrbifolds Layer 3
(563). ComplexCurveModuli D6 (139). GeometricTopology §7.1 (6685). Completed/HopfRinow. At their
open heads: QuantumFoundations §8.2 (the free Hamiltonian on `L²(ℝⁿ)`, `H²` domain, both cores,
`M_(4π²|ξ|²/(2m))`, the density formula quoted in 4.2) and §9.5; CongruenceSpectralGap §0.2 and
§0.6; AutomorphicSpectralTheory §1.16a and §§4.1–4.4; MaassForms §0.1. `roadmaps resolve`: no
cross-roadmap citation and no Lean name found nowhere. `overlaps.md`: no pull request changes this
roadmap, no cited id dropped, none defined by an open revision only, no second copy (the roadmap is
not on main).

**Declared gaps.** `gap:weyl-criterion` (UnboundedOperators UO-C02, §3.2) and
`gap:spectral-integral-resolvent` (UO-A02, §1.2). Each `needs` is one statement with its
hypotheses; each has a named supplier; each slug is in the plan's `gaps` and in the contract (lines
350–362). Minimality, checked this round: no Weyl criterion for the essential spectrum at the pins
(a search of both libraries for the criterion and for singular sequences finds nothing) nor in any
roadmap (`roadmaps grep` finds only the equidistribution criterion of other roadmaps and UO-C02's
own paragraph); no resolvent of the identity integral of a bare projection-valued measure at the
pin. They are contracts, not findings.

**Maintainer notes** (each is met at this head; none is raised).

1. Not held: lines 124–131 give UO-E06 only `L² + L^∞` on `ℝ³` and Coulomb to QuantumFoundations §9.5; lines 141–142 put `L^p` and the Kato class outside the roadmap.
2. Not held: lines 79–82 and 331–335 say UO-C03 gives restriction self-adjointness with a finite control measure, and 1.3 with SA-C19 in general.
3. Not held: every mention of Weyl's criterion carries `gap:weyl-criterion` (lines 68–69, 350–355, 1375–1378, 1424).
4. Not held: lines 1515–1523 state the passage from `(H₀ + 1)⁻¹` to `(H₀ − i)⁻¹` by the resolvent identity.
5. Not held: the last item of 1.1 (lines 467–474) rests on `gap:spectral-integral-resolvent`.
6. Not held: the contract lists SA-C86 and SA-E30 (lines 308–315), as the plan does.

The closing instruction of the notes is met at lines 127–131 and 1559–1563 (4.4 names UO-E06 as
its three-dimensional case). The ownership decisions of the notes were not reopened.

**Duplication.** `roadmaps grep` over main and the open heads for Kato–Rosenblum, Glazman and
essential closure: no match in any other text. The essential-spectrum Weyl criterion: only
UO-C02's paragraph. The variational count of 1.6 is owned here: VariationalMethods 4.4 states the
counting function for compact form pairs only, and the scope (lines 83–94) separates the two.
No object of the roadmap is stated at the pins under another name: the pinned libraries have the
projection-valued measures, the Kato–Rellich self-adjointness theorem, reducing subspaces and the
gauges, all cited and none restated.

Overlap check: read UnboundedOperators, VariationalMethods, SelfAdjointSpectralTheory (main; its open revision drops no cited id), QuantumFoundations, CongruenceSpectralGap, AutomorphicSpectralTheory; shared: pp/ac/sc subspaces — UnboundedOperators UO-C03; essential spectrum — UnboundedOperators UO-C02; strong commutation — UnboundedOperators UO-B03; `L² + L^∞` potentials on `ℝ³` — UnboundedOperators UO-E06; free Hamiltonian — QuantumFoundations §8.2; Courant–Fischer and counting for compact form pairs — VariationalMethods 4.4; congruence Laplacians — CongruenceSpectralGap §0.2 and AutomorphicSpectralTheory §1.16a; each cited, none owned twice.

**Supplier-order gate.** Output of the prescribed command:

```
candidate: SchrodingerOperatorsAndSpectralTypes is not in the merge order yet; checked as if placed after QuantumFoundations (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2246 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every supplier in a *Needs:* line or a contract is on main or is
QuantumFoundations, which is earlier in the merge order; CongruenceSpectralGap,
AutomorphicSpectralTheory and MaassForms are named in the scope, the conventions and the Examples
only, and are earlier too. No roadmap of the never-cite list is cited.

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
build, four layers each ending with Examples and Dependencies, Downstream consumers, Worked
examples, References. Every definition has its API and at least three discriminating Checks;
every theorem its hypotheses and a locator. Layers 1 and 2 are independent of each other, as are
3 and 4 (lines 442–448); the only forced order is "Layers 3 and 4 need Layers 1 and 2". No layer
is named after a source's chapter and the README nowhere says it follows a source.

**Headline theorems.** The type projections realise the Lebesgue decomposition (1.2); the
characterisation of `σ_ac` and the interval criterion (1.4, 1.5); min–max below the essential
spectrum (1.6); Pearson and Kato–Rosenblum (1.9); essential self-adjointness on complete manifolds
(3.6); `[1/4, ∞) ⊆ σ_ess` from a cusp end (3.10); `−Δ + V` for bounded real `V` (4.4). A design
has no `Suggested.lean`: statability, the one-tactic padding probe, binders and imports are
package-stage checks.

Source independence: 25 passages compared with 6 sources (teschl 13, yafaev04 3, bms02 3, kato57 2, rosenblum57 2, hm23 2), none shared beyond standard names, formulas and forced hypothesis lists; largest share teschl, 39 of 96 source mentions in the body; contents compared with teschl: independent (Layer 1 draws on its §§2.5, 3.2, 3.3, 4.2–4.4 and 12.1 together with kato57, yafaev04 and rosenblum57, Layer 2 on §§4.3 and 6.1, Layer 3 on §2.3 only, Layer 4 on Chapters 7 and 10; no run of layers or sections maps one to one onto a run of its sections).

## Not verifiable

- Elaboration: not available (this lane does not elaborate). No Lean command was run.
- The thirteen settled uncertified texts (`strichartz83`, `chernoff73`, `kato76`, `cfks87`,
  `gaffney54`, `rs1`, `rs2`, `rs3`, `grigoryan09`, `chavel84`, `iwaniec02`, `lp76`, `pearson78`)
  were not read. Of the sampled targets, 3.5 rests on `gaffney54` and `grigoryan09` alone on the
  source side and 3.8 on `chavel84`; the Pearson clause of 1.9 rests on `pearson78` and `rs3` for
  the argument and on yafaev04 for the statement. Their statements were checked by computation and
  against RiemannianGeometry R5c and R7.8.
- `lp80` and `kps26` were not reopened this round (outside the seeded sample; an earlier round
  read them at the cited lines).
- The published numbering of the arXiv copies of `bms02`, `hm23` and `yafaev04` was not compared
  with the journal versions.
- Ownership against open pull requests was checked by object with `roadmaps grep` and by reading
  the roadmaps of the Overlap line; the other open heads were searched, not read.

## Source issues

- **Misprint** in teschl at Theorem 6.4, equation (6.3), printed page 135: the source says the second entry of the maximum is the ambient coefficient over the relative coefficient minus one; it should be over one minus the relative coefficient; affects a stated result.

## For the human reviewers

- **Licence.** `teschl` is read from the author's online edition of an AMS book; 39 of 96 source mentions point into it. The wording and arrangement checks found nothing shared (`packages/SchrodingerOperatorsAndSpectralTypes/sources.toml`, entry `teschl`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6ce05fc6594d8c416dbeb699c4602931eed4efea", "job": "REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~11", "model": "fable", "worker": "chris-x52"} -->
