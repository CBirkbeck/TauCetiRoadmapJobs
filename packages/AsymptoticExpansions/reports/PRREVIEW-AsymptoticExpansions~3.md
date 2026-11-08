# Review of AsymptoticExpansions (pull request #1857 at d4973cb)

**Verdict:** needs changes

One P3 finding, which is the only failing check of the push gate; no blocking finding. No statement in `Suggested.lean` was found false. The source ids `dlmf21` … `dlmf29` below are the DLMF section pages §2.1 … §2.9 in the sources cache, and `dlmf28` is the §2.8 page fetched this round; `dlmf210` is discussed under `## Not verifiable`.

## Previous review (at dcc019c): repair status

| Id | Status at d4973cb | Evidence |
|---|---|---|
| R01 (P2) `laurentCoeff` duplicated Tau Ceti's `circleLaurentCoeff` | repaired | `Suggested.lean` line 4 imports `TauCeti.Analysis.Complex.Laurent.Basic`; `laurentCoeff` is gone; `tendsto_circleLaurentCoeff_sub` (lines 670–678) is stated with `TauCeti.circleLaurentCoeff f 0 ρ n`. README: the table row is deleted (lines 69–80), the four Tau Ceti declarations are cited under `### From Tau Ceti` (lines 201–206) and at 13.6 (lines 1485–1511); the `1/(1 − z)` value is kept as a Check (line 1502). All four names elaborate at the pin (`#check`, scratch file). |
| R02 (P2) statable headlines absent | repaired | 5.4 `hasAsymptoticExpansion_laplace_contour` (lines 255–286) and 6.2(d) `hasAsymptoticExpansion_stationaryPhase` for `b = ∞` (lines 339–365) are stated; the module docstring (lines 13–17) names Handelsman–Lew 8.4 as not statable, with the missing carrier, and says why 5.5 is not stated separately (two applications of 5.4). Both new statements are checked in the table below. |
| R03 (P3) padding `isAsymptoticScale_inv_pow` | repaired | Deleted from `Suggested.lean`; README line 325 keeps the prose "these are asymptotic scales" without a backticked name. |
| R04 (P3) library citations | repaired | README line 538 writes `Real.integral_rpow_mul_exp_neg_mul_Ioi`; 4.1 (lines 546–548) attaches the target's own name and cites `Complex.integral_cpow_mul_exp_neg_mul_Ioi` as the real case; `TauCeti.integral_rpow_mul_one_add_rpow` is cited at lines 207–209, 1108–1113 and in the table row at line 76 (`TauCeti/Analysis/SpecialFunctions/Beta.lean` line 456 at the pin: `∫ x in Ioi 0, x ^ (a − 1) * (1 + x) ^ (−(a + b)) = beta a b` for real `a, b > 0`). |
| R05 (P3) convergence hypotheses | repaired | Conventions (lines 160–162) define DLMF's uniform convergence; 3.2 (lines 483–486) and 6.1 (lines 749–753) use it, with the integrability form kept as a Check (lines 488–491); `hasAsymptoticExpansion_fourier` carries `hunif` (lines 299–300) and an eventual existence clause; Watson's lemma keeps absolute convergence with the exclusion recorded at lines 100–104 and 1555–1556. |
| R06 (P3) build order and `*Needs:*` | repaired | `formalCpow` is defined in 1.4 (README lines 356–360, `Suggested.lean` lines 109–112) and 5.1 cites it (line 654). Every one of the 57 `### k.n` targets has a `*Needs:*` line (`grep -c` = 57); a scan of every `*Needs:*` token finds no forward reference and no cycle. |
| R07 (P3) Checks for 1.1 and `mellinContOscTop` | repaired | 1.1 has three Checks (lines 297–305); `mellinContOscTop` has three Checks (lines 1010–1017), the two new ones recomputed below. |
| R08 (P3) scope wording | partly | `## Excluded material` (lines 1543–1567) states each item as an exclusion with its owner; "open" is gone. The pull-request number written at line 156 is R01 below. |

## R01 (P3) — A pull-request number in the README (gate `prnum`)

Location: `TauCetiRoadmap/AsymptoticExpansions/README.md` line 156: "`laplace` of Mathlib pull request #40582 (Laplace transform; see".

Claim: the README names no pull request by number (the gate rule `prnum`).

Witness: the worker's gate and my run both end `prnum=1 … FAIL` with exactly this line. The same pull request is already cited as a link at line 246, which the gate accepts.

Repair: at line 156 write "`laplace` of Mathlib's Laplace-transform pull request (cited under [Exact supplier contracts](#from-mathlib))", so that the number appears only in the link of line 246. This removes the only bare `#NNNNN` in the README; the rule matches nothing else (the five pull-request citations at lines 246–262 are links).

## Verified sound

**Gate and dependencies.**
- The worker's gate at d4973cb: every check 0 except `prnum=1`; `build=0`.
- My gate run (with the board's merge order): identical text-scanner results, plus `depcheck: NOT IN ORDER: AsymptoticExpansions (insert it after its last supplier)`, which is the not-yet-inserted case and not a finding.
- `gate --depcheck … --order merge-order-candidate.txt --movable`: `depcheck: 245 roadmaps, 2468 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AsymptoticExpansions'` is empty; the folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.
- Needs-line scan (scratch script over all 57 targets): no `*Needs:*` token points at a later or equal target, no cycle. 15 targets need only Mathlib or Tau Ceti.

**Elaboration.** `lake env lean TauCetiRoadmap/AsymptoticExpansions/Suggested.lean`: exit 0 in 10 s, 39 warnings, all `declaration uses 'sorry'`. 52 declarations (13 definitions with real bodies, 39 theorems); no `set_option`, no `lemma`, no sorry'd data; imports `Mathlib`, `TauCeti.Analysis.Complex.Laurent.Basic` and `TauCeti.Analysis.Contour.Residue.Basic`, all at the pin (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9 of `lake-manifest.json`).

**`#check @name` sweep.** All 52 declarations in one scratch file importing the built module (exit 0 on those lines), compared with `signatures.md` and the README: no section binder is lost; `IsAsymptoticScale` carries `[NormedField 𝕜]`, `HasAsymptoticExpansion` carries `[NormedAddCommGroup E] [NormedSpace 𝕜 E]`; the two new theorems carry every hypothesis the README states for 5.4 and 6.2(d). Nothing changed.

**Padding probe.** Every one of the 39 sorried theorems was tried on a scratch copy with `first | rfl | (simp; done) | infer_instance | (norm_num; done)`: none closed (39 `sorry` warnings remain, exit 0). No declaration restates a definition, mirrors a Check or computes a value.

**Library declarations opened at the pin** (`#check`, exit 0): `TauCeti.circleLaurentCoeff` (`Laurent/Basic.lean` line 49), `TauCeti.circleLaurentCoeff_eq_of_differentiable_on_annulus_off_countable` (line 123), `TauCeti.circleLaurentCoeff_sub_zpow_smul` (line 145), `TauCeti.circleLaurentCoeff_add` (line 87), `TauCeti.norm_circleLaurentCoeff_le` (line 100), `Real.integral_rpow_mul_exp_neg_mul_Ioi`, `Complex.integral_cpow_mul_exp_neg_mul_Ioi` (real rate `r : ℝ` only, as the README says), `HasFPowerSeriesAt.isBigO_sub_partialSum_pow`, `Complex.VerticalIntegrable`, `mellin_differentiableAt_of_isBigO_rpow`, `tendsto_integral_exp_inner_smul_cocompact`, `norm_le_gronwallBound_of_norm_deriv_right_le`, `TauCeti.Contour.residue`, `Complex.GammaIntegral_eq_mellin`, `mellinInv_mellin_eq`, `Real.tendsto_harmonic_sub_log`, `riemannZeta_one_sub`, `Complex.digamma`, `HasStrictFDerivAt.implicitFunction`, `HasStrictDerivAt.to_localInverse`, `Finset.sum_range_by_parts`, `hasDerivAt_bernoulliFun`, `bernoulliFun_eq_integral`, `periodizedBernoulli`, `ODE_solution_unique`, `IsPicardLindelof`, `Stirling.factorial_isEquivalent_stirling`, `PowerSeries.substInvOfIsUnit`, `PowerSeries.binomialSeries`, `PowerSeries.subst`, `Ring.choose`, `descPochhammer`, `Real.eulerMascheroniConstant`, `Complex.betaIntegral`, `MellinConvergent`, `mellinInv`, `Complex.tanh`, `Asymptotics.IsEquivalent`. Read in source at the pin (modules not imported by the file): `TauCeti.integral_rpow_mul_one_add_rpow` (`Beta.lean` line 456), `TauCeti.wronskian_eq_of_hasDerivAt` (`ODE/Wronskian.lean` line 31), `TauCeti.differentiable_intervalIntegral_mul_cexp_neg_mul`, `TauCeti.integrableOn_mul_cexp_neg_mul`, `TauCeti.differentiableOn_integral_mul_cexp_neg_mul` (`Complex/LaplaceTransform.lean` lines 46, 119, 168), `TauCeti.IsFrobeniusIntegrableAt` (`ODE/Frobenius.lean` line 94).

**Duplication by object.** Grep of the pinned Mathlib for Watson, Euler–Maclaurin, Abel–Plana, stationary phase, Liouville–Green, Volterra, asymptotic scale or expansion, Darboux's method and a Laplace transform: nothing (`Analysis/Calculus/Darboux.lean` is Darboux's theorem on derivatives). The only `norm_Gamma` lemmas are `Gamma/Beta.lean` lines 453–470. The two names the citation scanner flags (`Asymptotics.IsAsymptoticScale`, `Asymptotics.HasAsymptoticExpansion`) are this roadmap's own targets in their intended namespace (README lines 116–128).

**Suppliers resolved.** ZerosOfLFunctions on main: `### 1.2 Stirling on the sector` (line 459, DLMF 5.11.1 on `S_δ`) and `### 1.3 Vertical strips` (line 469, DLMF 5.11.9 uniformly for `σ ∈ [a, b]`), exactly what the contract (README lines 181–189) consumes; ZerosOfLFunctions is merge-order line 85, this roadmap line 398. ContourIntegration is in `Completed/`, `TauCeti.Contour.residue` at the pin.

**Consumers and ownership against open pull requests.** At their heads, SpecialFunctionsParabolicCylinder cites §§3.3, 4.2, 4.3, 8.2, 8.6, 8.7; SpecialFunctionsEiLiErfIncompleteGamma cites §§1.2, 3.1, 3.3, 4.2–4.3, 5.2–5.4, 8.1, 8.2, 8.6, 8.7, 12.1; SpecialFunctionsAiry cites §§1.5, 3.1, 3.2, 4.2–4.3, 8.2, 8.6, 10.2. Every cited id exists at this head, and none of the three cites a Lean name of this roadmap other than `HasAsymptoticExpansion`; none cites `laurentCoeff` or `isAsymptoticScale_inv_pow` (grep of all 478 open heads and main: the only `laurentCoeff` hits are TorsionCohomologyInfrastructure's unrelated `laurentCoeffIdeal`). ExplicitZetaBounds at its head consumes §13.1 `sum_Icc_eq_eulerMaclaurin` with the hypotheses stated here (its README lines 343–346) and Layer 5; it owns explicit Stirling remainders with decimal constants, a different object from the qualitative bound of 8.6. No second owner of any row of the ownership table (README lines 69–80) was found. `overlaps.md` lists no dropped ids and no other pull request changing this roadmap.

**Seeded sample, read in the DLMF text at the locators** (each supports the README statement as written):
- 1.4: `dlmf21` lines 615–620 (substitution, logarithms and powers permissible; the precise rules are the roadmap's, with `formalCpow` checked below).
- 3.2: `dlmf23` lines 174–251 (2.3.4; 2.3.5 under "converges as `t → ∞` uniformly for all sufficiently large `x`"; the `n`th error `x^{−n} 𝒱_{a,b}(q^{(n−1)})`).
- 3.5: `dlmf23` lines 450–552 (2.3.10–2.3.12; DLMF asks piecewise continuity, the README's local integrability is the Bleistein–Handelsman generality named at line 404).
- 5.4 (for the new theorem): `dlmf24` lines 443–575 (2.4.10–2.4.13; conditions (a)–(c) and the branch rule).
- 6.2(d) (for the new theorem): `dlmf23` lines 926–1049 (conditions (a)–(d), 2.3.21–2.3.23, "if (d) applies the second sum is absent").
- 8.2: `dlmf25` lines 263–356 (2.5.6–2.5.7 and the shift to the right).
- 8.5: `dlmf25` lines 1408–1692 (2.5.37–2.5.44: `κ = 0`, `c > −1`, `l ≥ 2`, `δ`, the remainder `O(ζ^{l−δ−1})`, no exponent a positive integer).
- 8.6 and 8.7: no DLMF locator; the route through ZerosOfLFunctions §1.3 (DLMF 5.11.9, its README line 471) and `mellinInv_mellin_eq` is checked by the computed rows below.
- 9.3: `dlmf26` lines 1174–1675 (2.6.33–2.6.35, 2.6.45–2.6.47 with `δ_n` and `f_{n,j}`).
- 9.4: `dlmf26` lines 1894–2183 (2.6.54–2.6.62, `α ≠ β`, `δ_n(x) = ∫ f_n(t) h_n(xt) dt`; the order estimate is attributed to Wong, recomputed below).
- 10.1: Olver's book is not readable (below); the statement is checked by computation.
- 10.4: `dlmf27` lines 321–711 (2.7.7–2.7.18; the recursion 2.7.11, sectors 2.7.15–2.7.16, Stokes relations 2.7.17, 2.7.18).
- 10.5: `dlmf27` lines 713–743 (2.7.19 and the dichotomy).
- 11.3: `dlmf28` lines 126–241 (2.8.2–2.8.5).
- 11.4: `dlmf28` lines 393–537 (2.8.10–2.8.13, `Δ_j(α_j)`, bounded `𝒱(A₁)`, `𝒱(A_n)`, uniform and differentiable).
- 13.6: read on the DLMF site, §2.10(iv) (2.10.25–2.10.32: conditions (a)–(c), (b′) with `σ_j > 0`, the `|n|^{−m}` refinement); also 2.10.1 (remainder with `B_{2m} − B̃_{2m}`) and 2.10.2 (with only the `a`-integral and the `n`-end expanded, which the README's exact formula plus its Taylor expansion reproduce).

**Adversarial table** (values computed for this review):

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Checks | `x⁻ⁿ` along `𝓝[>] 0`; `e^{−x}`; `ψ = 2φ` | ratio `x⁻¹ → ∞`, not a scale; `e^{−x} = O(x^{−N})` all `N`; `1 = 1·φ₀ = ½·ψ₀`, and `1·ψ₀ − 1 = 1 ≠ O(x⁻¹)` | all three hold | none |
| `HasAsymptoticExpansion.unique` | first index `m` with `a_m ≠ b_m` | `φ_m(b_m − a_m) = O(φ_{m+1}) = o(φ_m)`; on the frequent set `φ_m ≠ 0` this forces `b_m = a_m` | true | none |
| `hasAsymptoticExpansion_inv_pow_iff` | `X` bounded; `f = 1/(z − 1)` | filter `⊥`, both sides true; `zⁿ(f − ∑_{s<n} z^{−s}) = zⁿ·z^{−n}/(1 − z⁻¹)·… → 1 = a_n` for `n ≥ 1`, `a₀ = 0` | true | none |
| `hasAsymptoticExpansion_of_hasSum` | `f = 1/(z − 1)`, `R = 1` | `∑_{s≥1} z^{−s} = 1/(z − 1)` for `|z| > 1`; remainder `z^{−N}/(1 − z⁻¹) = O(z^{−N})` | true | none |
| `formalCpow` Checks (1.4) | `r = 1`; `r + r′`; `P = 1 + X`; `ℓ ↦ ℓ + 2πi` | `binomialSeries 1 = 1 + X`, so `e^ℓ·e^{−ℓ}P = P`; `subst` is a ring map, so `(1+Y)^r(1+Y)^{r′} = (1+Y)^{r+r′}`; `subst X = id`; `C(e^{r(ℓ+2πi)}) = e^{2πir}C(e^{rℓ})` and `e^{−ℓ−2πi} = e^{−ℓ}` | all four hold; `e^{2πir} = 1` iff `r ∈ ℤ` | none |
| `laplaceCoeff` with `ℓ = log‖p₀‖ + iψ₀` (5.4) | `p₀ = ‖p₀‖e^{iψ₀}` | `exp ℓ = p₀`, so `C(e^{−ℓ})P − 1` has zero constant term and `subst` applies | consistent | none |
| `hasAsymptoticExpansion_laplace_contour` | `γ(τ) = τ`, `p = t`, `q = 1`, `a = 0`, `ψ = ψ₀ = 0`, `μ = λ = 1`, `[θ₁, θ₂] ⊂ (−π/2, π/2)` | `hpos`: `Re(e^{iθ}τ) = τ cos θ > 0`; `haway`: `≥ T cos θ₂`; `hconv`: `∫₀^∞ e^{−e^ζ τ}dτ` converges absolutely for `Re e^ζ > 0`; `hbranch`: `|θ| ≤ π/2`; value `e^{−ζ} = Γ(1)·b₀·e^{−ζ}` with `b₀ = [X⁰](1·1^{−1}) = 1` | true; agrees with README example (line 733) | none |
| same, branch rule | `p = t²` on `γ(τ) = τe^{iω}`, `μ = 2`, `p₀ = 1`, `ψ₀ = 0` | DLMF 2.4.13 reads `|θ + 2ω| ≤ π/2`, as `hbranch`; for `ω = π/2`, `θ = 0`: `|π| > π/2` excluded, and indeed `∫₀^∞ e^{+zτ²}idτ` diverges there | hypothesis is the right one | none |
| `hasAsymptoticExpansion_stationaryPhase` (6.2(d)) | Fresnel `p = t²`, `q = 1`, `a = 0`, `μ = 2`, `λ = 1` | `P₀ = 1/(2t) → 0`; `∫_T^{T′}e^{ixt²}dt = [e^{ixt²}/(2ixt)] + ∫e^{ixt²}/(2ixt²)`, so `‖·‖ ≤ 3/(2xT)`, uniform for `x ≥ x₀ > 0`; coefficient `e^{iπ/4}Γ(½)·½·x^{−1/2} = ½√(π/x)e^{iπ/4}` | true; agrees with README example (line 796) | none |
| same, derivative expansions | `k = 1`, `p − p(a) = (t − a)^μ` | `descPochhammer 1` at `μ` is `μ`; `μ(t − a)^{μ−1}` | matches `hpexp` | none |
| `hasAsymptoticExpansion_fourier` with `hunif` | `q = e^{−t}` | `∫_T^{T′}e^{(ix−1)t} = (e^{(ix−1)T′} − e^{(ix−1)T})/(ix − 1)`, norm `≤ 2e^{−T}` for all `x ≥ 0`; value `1/(1 − ix) = ∑ i^{s+1}(−1)^s x^{−s−1}` | true | none |
| 3.2 Check (integration by parts) | `q = sin t/t` | `|∫_T^{T′} e^{ixt}q| ≤ 2/((x − 1)T)` for `x ≥ 2`; `∫₁^∞|q′| = ∞` | DLMF hypothesis strictly weaker | none |
| 3.5 | `f = e^{−t²}`, `q = 1` | `∫e^{−x²t²}dt = √π/(2x) = 𝓜f(1)x⁻¹` | agree | none |
| 5.5 docstring claim | `p = t²`, `q = 1` through `t₀ = 0` | two halves (`ω = 0`, `ω = π`, `μ = 2`, `λ = 1`): each `½Γ(½)z^{−1/2}`, sum `√(π/z)` exact; `b₂ = 0` | 2.4.15 is the sum of two 5.4 instances | none |
| 8.2 `integral_vertical_sub_eq_two_pi_mul_sum_residue` | `F = 1/(t(1 − t))`, `c = ½`, `d = −½` | `∫dy/(¼ + y²) = 2π`; line `Re t = −½`: `0`; `Res₀ = 1`: `2π − 0 = 2π·1` | true | none |
| 8.5 (2.5.44) | `h = 1/(1 + t)`, `b_n = (−1)^n`, `β_n = n + 1` | every `β_n` is a positive integer, so 2.5.44 is excluded and 2.5.43 gives the `log ζ` terms of the README example (line 1081) | consistent | none |
| `exists_norm_Gamma_le` | `x = ½`; `x = −½`, `η = ½` | `|Γ(½ + iy)|² = π/cosh πy ≤ 2πe^{−π|y|}`: `K = 0`, `C = √(2π)`; at `x = −½` the condition excludes nothing and `Γ(−½ + iy) = Γ(½ + iy)/(−½ + iy)` | true | none |
| `integral_Gamma_mul_cpow_neg` | `w = 1`; `w = i`, `c = 1` | `∫Γ(c + iy)dy = 2π/e`; `|i^{−1−iy}| = e^{πy/2}` against `|Γ(1 + iy)| ∼ √(2π|y|)e^{−π|y|/2}`: integrand not integrable at `w = i`, so `Re w > 0` is needed and 8.6's `θ < π/2` is the right domination | true | none |
| `mellinContOscTop` Checks | `f = e^{iκt}(t⁻¹ + t⁻²)`, `n = 1, 2`; `f = e^{iκt²}t⁻³`, `p = 2` | `n = 1`: `∫₁^∞ t^{z−3}e^{iκt}dt + oscTail(z − 1)`, Lebesgue-convergent for `Re z < 2` and equal to `oscTail(z − 2)` by `oscTail_spec` (`w = z − 2`); `n = 2`: integral `0`, sum `oscTail(z−1) + oscTail(z−2)`; `u = t²`: `∫₁^∞ t^{z−4}e^{iκt²}dt = ½∫₁^∞ u^{(z−5)/2}e^{iκu}du = ½oscTail((z − 3)/2)` | both Checks hold | none |
| `oscTail_spec` boundary | `w = 1` | `∫₁^T e^{iκu}du` has no limit; `oscTail κ 1 = ie^{iκ}/κ` | `Re w < 1` needed | none |
| 9.3 | `f = t^{−α}` exactly, `n = 1`, `0 < α < 1` | `I^μ f(x) = Γ(1 − α)/Γ(μ + 1 − α)·x^{μ−α}` (Beta integral); `f_1 = 0`, `δ_1 = 0`; the continued transform `mellinContAtTop f a (k ↦ k + α) 1 z = 1/(z − α) + 0 − 1/(z − α) = 0`, so `c_1 = −𝓜f(1) = 0` | 2.6.45 agrees | none |
| 9.4 remainder order | `f_n = O(t^{n+α−1})` at `0`, `h_n(u) = O(u^{1−n−β})` at `0`, `O(u^{−n−β})` at `∞` | `∫₀^{1/x}`: `x^{−n−α}/(α − β + 1)`; `∫_{1/x}^∞`: `x^{−n−β}·O(x^{β−α})` if `α < β`, `O(x^{−n−β})` if `α > β` | `O(x^{−n−min(α,β)})` | none |
| `exists_volterra_solution` | `K = 0`; Picard bound | `h = 0`, bound `0`; `|h_{n+1} − h_n| ≤ PΦΨⁿ/n!` | true | none |
| `exists_rankOne_solution` | `f = −1 + 2z⁻²`, `g = −z⁻² − 2z⁻³ + z⁻⁴`, `λ₁ = 0`, `λ₂ = 1` | `w = e^{1/z}`: `w″ + fw′ + gw = e^{1/z}[2z⁻³ + z⁻⁴ + z⁻² − 2z⁻⁴ − z⁻² − 2z⁻³ + z⁻⁴] = 0`; `w = e^{z+1/z}` likewise `0`; `μ_j = 0`; `a_s = 1/s!` from 2.7.11 | true; formal series converge without terminating | none |
| 10.5 Fabry | general `f, g` with `g₀ = f₀²/4` | `W = e^{f₀t²/2}w(t²)`: `W″ + [2t(f − f₀) − 1/t]W′ + 4t²(g − ½f₀f + ¼f₀²)W = 0`; `F = (2f₁ − 1)/t + …`, `G = (4g₁ − 2f₀f₁) + (4g₂ − 2f₀f₂)/t² + …` | `F₀ = 0`, `G₀ = 4g₁ − 2f₀f₁`, `G₁ = 0` | none |
| 11.3 | 2.8.2–2.8.4 | `ψ = ż²g + ż^{1/2}(ż^{−1/2})¨`; Case I `ż²f = 1` gives `u² + ψ` | agree | none |
| `exists_caseI_solution` | `ψ = 0`; derivative line | `A_s = 0` for `s ≥ 1`, `W = e^{uξ}`; differentiating `e^{uξ}(∑A_su^{−s} + O(u^{−n}))` gives `∑(uA_s + A_s′)u^{−s} + O(u^{1−n})` | true | none |
| `exists_difference_solution` | `w(n+2) − 3w(n+1) + 2w(n)`, `ρ = 2` | `α = 0`, `a_s = 0` for `s ≥ 1`, `w = 2ⁿ` | true | none |
| `sum_Icc_eq_eulerMaclaurin` | `f = x⁴`, `[0, 1]`, `m = 2` | `∫ = 1/5`; `½f(0) + ½f(1) = 1/2`; `B₂/2!·(f′(1) − f′(0)) = 1/3`; remainder `B₄ − ∫₀¹B₄ = −1/30`; sum `30/30 = 1 = f(0) + f(1)` | true | none |
| `sum_Icc_eq_abelPlana` vs DLMF 2.10.2 | `f = z²`, `a = 0`, `n = 2` | README: `5 = 8/3 + 2 + 1/3`; DLMF form: `2∫ 2ny/(e^{2πy} − 1)dy = n/6 = B₂/2!·f′(n)` | both agree | none |
| `tendsto_sum_mul_log_sub` | both constants | `1/12 − ζ′(−1) = 0.24875`; `(γ + log 2π)/12 − ζ′(2)/(2π²) = 0.24876` | agree | none |
| `tendsto_circleLaurentCoeff_sub` and the 13.6 Checks | `f = 1/(1 − z) + 1/(2 − z)`, `g = 1/(1 − z)`, `r = 1` | `f − g = ½∑(z/2)ⁿ`: `f_n − g_n = 2^{−n−1}` (`n ≥ 0`), `0` (`n < 0`); `1ⁿ·2^{−n−1} → 0` as `n → ±∞` | true | none |
| 7.1 sign of `a` | `α < 0`, `t = 0 > α` | DLMF: `w(α, 0) = a + |a| = 2a ≠ 0`; README `a = sgn(α)(…)^{1/2}`: `w(α, 0) = 0` | README right | source issue |

**README Checks evaluated against their theorems:** those of 1.1, 1.4, 2.3, 4.3, 5.1, 7.2, 8.3 (both lists), 13.6, the examples of Layers 1, 3–13, and the `(1, 0, 0, …)` counterexample of Layer 12. All are consistent with the theorems of their sections and with each other.

**Shape.** House headings, `**Summary.**`, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, thirteen layers each ending with `### Examples` and `### Dependencies`, Downstream consumers, Excluded material, References. Each of the 13 definitions has at least three Checks; every theorem has its hypotheses and a locator; no `**T0nn**` blocks, no LaTeX, no process narrative. The README's generality equals the Lean's in every compared statement (13.1 asks `C^{2m}` where DLMF asks absolute integrability of `f^{(2m)}`, the standard formal reading; noted, not a finding).

## Not verifiable

- DLMF §2.10 is not in the sources cache: every URL form through the sources service (`2.10`, `2.10.i`, `2.10.iv`, `2.10.E29`, with and without `--licence-class institutional`) resolves to the figure `2.10.F1.pdf`, and the service recorded that figure under the key `dlmf210` in the board package's `sources.toml` (the file was created by the service during this review's fetches, together with `dlmf28` for §2.8, which did fetch). The `dlmf210` entry points at a two-line OCR of axis labels, not the section text; it should not be relied on. §2.10 was read on the DLMF site for this review.
- Olver, *Asymptotics and Special Functions* (Chapter 6 §10 for 10.1, Chapter 7 §2, Chapter 10), Olver 1994, Wong 1989, Wong and Li 1992, Bleistein–Handelsman 1975, Chester–Friedman–Ursell 1957, Handelsman–Lew 1970 and Temme 2015 are paywalled; not read. 10.1 and the 9.4 remainder order were checked by computation instead.
- The Mathlib pull requests cited at README lines 246–262 were not fetched.

## Source issues

- **Misprint** in DLMF at 2.3.26–2.3.27 (§2.3(v), `dlmf23` lines 1149–1202): the source takes `a` as the positive square root, so for `α < 0` the point `t = 0` maps to `w = 2a`; it should be `a = sgn(α)(2p(α,0) − 2p(α,α))^{1/2}`, which the source's own requirement that `t = 0` correspond to `w = 0` forces; affects a stated result.
- **Error** in DLMF at §2.7(ii), the sentence after 2.7.13 (`dlmf27` lines 539–540): the source says the formal series diverge unless they terminate; it should say "unless `Λ_j = 0`". For `f = −1 + 2z⁻²`, `g = −z⁻² − 2z⁻³ + z⁻⁴` both normalized series are the convergent, non-terminating `∑ z^{−s}/s!` (verified above); affects a stated result.
