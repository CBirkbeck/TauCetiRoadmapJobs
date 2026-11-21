# Review of GluedTargetAndDivisionInequality (pull request #2922 at 51011ab)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GluedTargetAndDivisionInequality/`
**Verdict:** needs changes

**Summary.** Changes are needed for two findings. The bound for the maximal slope of the target (8.24 (a)) rests on a bound for the denominators of the test values that is stated nowhere, in a form (linear in `b`) that the conclusion `x^C·b` needs; and the route of 8.23 asserts `0 < D⁻_j`, which fails at the last step `j = m`. Everything else I recomputed holds (Layer 7, the Checks of 8.1–8.10, the cancellations of 8.22, the depth table, the passage 8.21). There are four small corrections and two format notes, none blocking. The human reviewers have the scope and licence of the formal proof the roadmap follows to decide: its text could not be read.

## R01 (P2) — The bound `μ_max(R_0) + log 𝔫 ≤ x^C·b` of 8.24 (a) uses a bound for the denominators `d_F(𝔭)` of the test values that no target, supplier section or library declaration states.

8.24 (a) feeds `H₀` into 8.21 (b) and so into the division inequality 8.22; an implementer who reaches term (4) of its slope test has nothing to prove and nothing to cite. The term is `2Σ_𝔭ϱ(𝔭)d_F(𝔭)`, for integers `d_F(𝔭)` with `v_{ξ_𝔭}(M̃_{ξ_𝔭}) ⊂ 𝔭^{−d_F(𝔭)}M`. Such integers exist trivially (take them large); the content is that some choice has a small sum, and the route says of it only that it "is of polynomial size; this bound is a statement of [FormalProof] of its own, distinct from 8.24b, and its proof is not given here" (lines 1453–1454), and then that "the bounds of the terms (4), (5) linear in `b` are not given here" (lines 1463–1464).

The form matters: `b = e^{x^ε}`, so a bound of size `b²` is not `≤ x^C·b` for any exponent `C` chosen after `ε`. The conclusion therefore needs exactly the statement that is missing: in which quantities the sum is polynomial, and that it is linear in `b`. The companion bound for the bottom norms was made a target with its exact form (8.24b (i)–(ii)); this one was not.

The smallest change: state the bound as a target beside 8.24b, with its quantifiers and its explicit right side (as 8.24b (ii) does for `Σ_𝔭ϱ(𝔭)d_l(𝔭)`), give the file and declaration of [FormalProof] that states it, and cite that target in term (4). If term (5) also needs a bound not already given by 8.24a (d), 8.24b (ii) and ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b, state it the same way.

## R02 (P2) — The route of 8.23 (a) (iv) asserts `0 < D⁻_j` for every step, which is false at `j = m`.

In the degree count (line 1325) the route writes `0 < D⁻_j = Σ_τΣ_{c<q_j}(e′_{j+c}(τ) − w_j(τ) − c − (t + 1)/2) ≤ f·q_j·max_τ(…)`. Since `q_j = m − j` (table of symbols; `W_j` has signature `(k + j − 1, m − j)`), at the last step `q_m = 0`, the sum is empty, and the chain reads `0 < 0 ≤ 0`. 8.23 is stated for every step `j`. Only the upper bound is used, so nothing downstream changes: write `0 ≤ D⁻_j`, with `D⁻_j ≥ f·q_j` (rows `≥ 1`) if a lower bound is wanted.

## C01 — The route of 8.24a (d) gives the twist term `3h_sq·v_𝔭(ℓ)/ℓ²`, not the stated `2h_sq·v_𝔭(ℓ)/ℓ²`; the stated bound is true, by a cancellation the route does not mention.

The route (lines 1389–1393) counts four index families and applies the upper bound (c) "where it is in the numerator". Three of the four are numerators: the reflected range `1 − e_□ … 0` and the range `1 … h_□` of `A(ξ)`, and the `p_□` numerators of the tower. Each use of (c) costs `v_𝔭(ℓ)/ℓ²`, so that count gives up to `3h_sq`. The statement holds because the tower factor collapses: its numerators are at `s ∈ [e + q_□ − p_□ + 1, e + q_□]`, its denominators at `s ∈ [e + 1, e + q_□]`, and `p_□ ≤ q_□ ≤ p_□ + 1`, so the product is `1` or `ρ_ξ(e + 1)^{−1}`. Then only `e_□ + h_□ ≤ 2h_sq` numerators remain. Say so in the route (the coefficients `4` and `5` are then generous).

## C02 — The clauses whose routes are "not given here" name [FormalProof] only as a whole repository, so a reader cannot find what supports them.

This concerns 8.19e (c), 8.20 (o), 8.20 (v) (the base-level bound with the factor `D_0`), 8.20 (vii) (a)–(h) with (P3), (P5), step (3) of 8.20a at the orbits of type (O) that do not alternate, the gauge point of 8.24a (b), 8.24b (i), and the multiplicities of 8.21 (c). Other roadmaps of the family give the file and the declaration (for example SeesawForThetaChains §6.14 and §6.15). Give the same here for each of these clauses.

## C03 — The sub-mean-value inequality that 8.3 takes "from Mathlib" is not in Mathlib at the pin; Tau Ceti has it.

The *Needs* line of 8.3 (line 532) and the Mathlib contract (line 1553) list "the mean-value inequality for subharmonic functions". The pinned Mathlib has no subharmonic functions; its mean-value statements are for holomorphic functions on circles in one variable (`DiffContOnCl.circleAverage`, `Mathlib/Analysis/Complex/MeanValue.lean:108`). The inequality over balls is `le_setAverage_ball_of_laplacian_nonneg` in `TauCeti/Analysis/InnerProductSpace/Harmonic/MeanValue/Basic.lean:464` (a `C²` function with nonnegative Laplacian is at most its average over a ball). Move the item to a "From Tau Ceti" contract with that name. The weighted form the route uses, `|f(a)|²e^{−φ(a)} ≤ (n!/(π^n r^{2n}))·e^{Ar²}·∫_{B(a,r)}|f|²e^{−φ}`, is also SingularHermitianMetricsAndL2Methods §3.7 (a), listed above this roadmap in the family index; citing it would do as well.

## C04 — In the route of 8.21 (c), `g` and `m` change meaning within one sentence.

Line 1236 writes `g^k(1 − g^{−1}) ≤ m ≤ g^k(1 + g^{−1})^r` "at one place", five lines after `g := min(g₀, g₁)`. With that `g` the upper bound fails at a place above the larger type prime, where the multiplicity is about `N(v)^k`. The bound meant is FiniteReductiveGroups §2.8 (b) with `q_v = N(v)`, as the next clause (`g_v`) and `n̄ = ∏_v N(v)^k` show; and `m` here is a multiplicity, not the length of the chain. Write `q_v^k(1 − q_v^{−1}) ≤ m(σ_v) ≤ q_v^k(1 + q_v^{−1})^r`.

## N01 — The module docstring of `Suggested.lean` (line 23) names `TauCeti.subspaceHeight`; the declaration is `Submodule.subspaceHeight` (`TauCeti/NumberTheory/Height/Arakelov/Subspace/Basic.lean:292`), and the first name does not resolve.

## N02 — LocalGainOfThetaChains §4.16 (ii) is stated "under the hypotheses of 4.10 and of 4.10a"; the *Needs* line of 7.14 (line 375) and the supplier contract list §4.10 but not §4.10a.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 7.12 and `pairing_integral_of_localDivision` (headline 1) | `ℚ`, `N = 6ℤ`; `ℚ(i)`, `𝔭 = (2+i)` | `τ = (1,1)`: `N′ = ℤ`; `τ₂ = 2`: `N′ = ½ℤ`. `(2+i)/(2−i)`: `v_𝔭 = 1`, `v_{c𝔭} = −1`. `R = c(𝔭)^{−1}`: `B(N,R) = 𝔭^{−1}` | holds; Lean equals README; `d ∉ c^{−1}𝔭 ⇔ v_𝔭(c d) = 1` |
| 7.13, 7.14 | `c_𝕃` involution; `σ̃₀` | `c^{−1}(𝔭) = c_𝕃(𝔭)`; `conj∘σ₀∘c_𝕃 = σ₀`; `τ_𝔭 = σ_𝔭 = ⌊e_𝔭𝔊_u(𝔭)⌋` is the exponent in `I_u^{−1}` | holds; hypotheses of Seesaw §6.14, §6.15 carried |
| 8.1 | `m = 1`, `λ_1 = (1, 4)` | `‖B‖² = sup F₁²/(F₁² + 4F₂²) = 1`; bound `1`; `max` version `1/4` | holds |
| 8.2 | `N = 1`, `Th = e^{u²/2}`, `n = 6` | left `1.0806e8`, `2(2n/e)^{2n} = 1.0956e8`, right `1.0067e11`; `((n+1)/n)^{n/2} ≤ e^{1/2}`; `π^{−N}∫e^{−θ\|u\|²/2} = (2n+2)^N` | holds |
| 8.3 | `ρ = √g` | `\|G(u)\|² = \|Th\|²e^{−\|u\|²}e^{\|u−z\|²}`; multiplicity `≤ (1 + 4ρ/√(πh))^{2g}`; `vol B_ρ = (πg)^g/g!` | holds; library attribution C03 |
| 8.4 | `N = 1`, `ν = (n)` | `\|c_n n!\|² = n!·C(n, n/2)/2^n ≈ √(2/(πn))·n!` | holds |
| 8.5c | `E = K`; Kronecker limit formula | mean of `log(y\|η\|⁴) = γ − log(2√D) − L′/L`, so class mean `= γ + log(2π/√D) − L′/L`; `log(rd_E/√D) = log N(𝔡)/[E:ℚ]`; `N(𝔞₀𝔡) = N(𝔡)^{1/2}` | holds, sign `−` |
| 8.7 | `λ = (1,0)`, `G′ = (a)`; `λ = (a)`, `n = 0` | `br∘br^* = 1/g`; rescaled form gives `a`; `β(\|t\|²g)^{−a}` | holds |
| 8.8 | rows of `a⁺_{j,τ}` | same formula as LocalGainOfThetaChains table (§4.9f (d)); Fischer norm is IntegralWeyl §3.1 | holds as cited |
| 8.9 (headline 2) | `κ` of 8.1 | `ι_1^*ι_1 = (𝔫/\|P_1\|)∏λ_j` gives `−log 𝔫 + log\|P_1\|` in `h_u`; error of 8.6 under `SizeT_u`: `C f m³N_m²La` | holds |
| 8.10 | (b) entrywise; (a) | `a⁺_{j,τ,i−1} − ν_{j,τ,i} = (j−1)t + δ_{i−1}Δ_w`; hooks of row `i` are `≥ μ_i, …, 1`; `ph(0) = 0 > ph(1) = −1` | holds |
| 8.20 | (iii), (iv), (vi) | `Σ_𝔭ϱ(𝔭)v_𝔭(n) = log n`; `[P_jM : (P_jM)^∨] ≤ e_𝔭η_j + D_0e_𝔭(𝔧_j + v_ℓ(N))`; `Σ_ℓ 2 log ℓ/ℓ² = 0.98618` | holds |
| 8.20a | `g = 13`, `T = 3`, `e_𝔩 = 12`, `e₁ = 2`, `ν* = 1/12` | `E = 2⌈39⌉ = 78`, `78/24 = 13/4 ≤ 3 + 13/24`; type sum `4T − D^H_j = 4T + 2F_j` | holds |
| 8.20b | depth errors; (N5) count; Weyl sum | `2(aE_j + 1)`, `−2F_j`, `4T`; excluded vectors `≤ N_c(N_c+1)^{N_c−1} < (N_c+1)^{N_c}`; `30\|Φ_th\| ≤ 15f` gives `16x^εB₀` (Congruence §7.16a (3) (b)) | holds |
| 8.21 | `(𝒪_𝕃, c\|·\|)`; `ℚ(i)`, `e = (2−i)^{−1}`; weights | `−μ = 2 log c` (sum version `4 log c`); Gram valuations `−1, −1`, indices `0, −1`; `2δ/(1−δ) ≤ 3δ`; `e^{2fr/g} ≤ 1 + 4fr/g` | holds; notation C04 |
| 8.22 (headline 3) | (D4), `m = 1..6` | `p_j − q_j − k = 2j−1−m`; `Σ_j(2j−1−m) = 0` for each `m`; remainder `≤ f m²(ϑ+1)La`; `f m b La ≤ 2B₀` | holds |
| 8.23 | (a) (iv), (v); (b); `j = m` | `Σ_{𝔭\|π}2ϱ(𝔭)e_𝔭 = log g_i`; `ph′ = log y ∈ [0, log M]`; `D⁻_m = 0` (empty sum) | statement holds; route R02 |
| 8.24a | `p_□ + q_□`; tower indices | `⌊(n−1)/2⌋ + ⌊n/2⌋ = n − 1`; numerators `[e+q−p+1, e+q] ⊂ [e+1, e+q]` | (d) holds; route C01 |
| 8.24 | slope test in `μ = 2μ̂`; term (4) | finite places add `2Σϱ(𝔭)a(𝔭)`; `b² ≰ x^C·b` | slope test holds; term (4) R01 |

- Source locators checked against the text: 3 (Bost1996 line 467–476, Prop. 4.3 on printed p. 131; Bost1996 line 771–780, App. A.2 on pp. 146–147; GaudronRemond2014 line 586–595, Lemme 3.9 and its proof).
- Library declarations opened at the pins: `FractionalIdeal.count` (`Mathlib/RingTheory/DedekindDomain/Factorization.lean:306`), `IsDedekindDomain.HeightOneSpectrum.valuation`, `DiffContOnCl.circleAverage` (`Mathlib/Analysis/Complex/MeanValue.lean:108`), `integral_rexp_neg_mul_sq_norm` (`Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330`), `volume_ball` (`Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:344`), `Submodule.subspaceHeight`, `le_setAverage_ball_of_laplacian_nonneg` (Tau Ceti, as in N01, C03).
- Cross-roadmap citations: every cited section of 28 roadmaps resolves to a heading at its open head or on main (about 170 ids). Read in text: Seesaw §§6.14, 6.15; LocalGain §4.16; Congruence §§7.11, 7.16a (3); ArithmeticVolumes §§8.19 (b), (c), 8.19b (ii); ThetaChains §2.8; IntegralWeyl §3.3; FiniteReductive §2.8; Slopes §§1.2a, 2.4; RowTower §5.8d; HeightsAndUnits 0.3; MathematicalStatisticsHighDimensional §1.4.
- Dependency check: `depcheck: 171 roadmaps, 1994 edges, 0 problem(s)`; no UPWARD or CYCLE line. Automatic checks: all passed.
- Elaboration: `Suggested.lean` elaborates with the `sorry` warning only. `#check` of the one declaration: its type matches README 7.12; the file has no section variables, so no binder can be lost.
- One-tactic probe: `simp`, `simp_all`, `aesop` leave the goal open; the theorem is not padding. Headlines 2 and 3 are named in the docstring as not statable, with the missing carriers (no Hermitian lattice over a ring of integers with Arakelov slope at the pins).
- Duplication: no roadmap on main or open states integrality after division, the Fock-model Taylor blocks or the glued target; the pinned Mathlib has no Bargmann or Fock-space file.
- No change outside the roadmap folder and the family index.

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, LocalGainOfThetaChains, RowTowerAndRallisIdentities, CongruenceModulesOfThetaLifts; nothing shared (the divided source, the glued target, `h_u` and the division inequality are owned here; the slopes of the divided sources are ThetaChainsAndFrobeniusPrimeSums §§9.1–9.2 and cite 7.13).

Source independence: 7 passages compared with 2 sources (Conventions on slopes, 7.12, 8.1, 8.3 route, 8.24 route and attribution, the docstring of `Suggested.lean`, against Bost1996 and GaudronRemond2014), none shared; largest share Bost1996, 2 of 3 exact locators; contents compared with Bost1996 (§§1–5, Appendices A–C): independent. [FormalProof], which the targets follow, could not be read: neither wording nor arrangement was compared with it.

Research link: Layers 7–8 give the integrality, heights and target slopes for the slope inequality of chains of theta lifts in Alpöge's formal proof (announced 2026) of the Riemann hypothesis for Dirichlet L-functions, by Bost's slope method (Bost 1996, Prop. 4.3). Rests on the README's Routes paragraph and References, and on Bost1996.

## Not verifiable

- [FormalProof] (a GitHub repository): the sources service finds no legal class for its host; no target gives a file or declaration in it, so the sampled targets were checked by computation and against the supplier sections they cite.
- [Announcement]: not fetched (same reason).
- Bost1996: the displayed formulas of Prop. 4.3 and App. A.2 are missing from the text layer; the surrounding prose matches the README's use.
- Bargmann 1961, Kronecker–Lerch 1897, Chowla–Selberg 1967, Frame–Robinson–Thrall 1954: cited without locators for classical ingredients; not fetched. The facts they are cited for were recomputed (8.2 (a), the class-mean formula, `∏μ_i! ≤ H(μ)`).

## Source issues

- none

## For the human reviewers

- Scope: the README says its mathematics "follows a complete formal proof" of the Riemann hypothesis for Dirichlet L-functions announced on 20 November 2026 (Routes paragraph; References). It is unrefereed, and no published source takes it up.
- Licence: [FormalProof] and [Announcement] are on hosts the sources service does not classify; neither the text nor its licence was read.
- Not tested: [FormalProof] could not be read, so wording and arrangement were not compared with it; the section numbers 7.12–8.24b continue a numbering shared across the family, whose origin was not checked.
