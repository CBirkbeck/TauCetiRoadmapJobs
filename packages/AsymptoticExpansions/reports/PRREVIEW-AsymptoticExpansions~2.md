# Review of AsymptoticExpansions (pull request #1857 at dcc019c)

**Verdict:** needs changes

Two blocking findings (P2) and six P3 findings. No statement in `Suggested.lean` was found false. The source ids `dlmf21` … `dlmf29` below are the DLMF section pages §2.1 … §2.9, read through the sources service.

## Previous review (at 9824db0): repair status

| Id | Status at dcc019c | Evidence |
|---|---|---|
| R01 (P2) second owner of 4.2, 8.2, 8.6, 8.7 | repaired | SpecialFunctionsParabolicCylinder at its head: "The general asymptotic and contour tools … are consumed from AsymptoticExpansions" (its README lines 102–104); its supplier contract cites §§3.3, 4.2, 4.3, 8.2, 8.6, 8.7 (lines 203–225). This README now has `## Downstream consumers` (lines 1334–1345). |
| R02 (P2) statable headlines absent | partly | 6.1 `hasAsymptoticExpansion_fourier`, 6.2(c) `isBigO_stationaryPhase_remainder` and 13.2 `sum_Icc_eq_abelPlana` were added. 6.2(d) and the contour/saddle-point theorem 5.4–5.5 are still absent, and the docstring does not list them as not statable. See R02 below. |
| R03 (P3) TeX and pull-request numbers | repaired | Gate `tex=0`, `prnum=0`. The Mathlib pull requests are now cited as links, as the repository README's "Defer to Mathlib" rule asks ("Cite what you find"). The word "open" in that text is covered by R08. |
| R04 (P3) module-system warning | repaired | `Suggested.lean` lines 1–4 and 22 (`module`, `public import`, `@[expose] public section`). `lake env lean` exits 0 with only the 38 `sorry` warnings. |
| R05 (P3) README shape and timeless style | partly | The headings now follow the house shape, every layer has `### Examples` and `### Dependencies`, and seven definitions gained `**Checks.**` lists. Still open: no Checks for the two notions of 1.1 or for `mellinContOscTop` (R07); the heading "do not implement" (R08); and the per-target `*Needs:*` lines were dropped instead of kept (R06). |
| R06 (P3) padding | partly | Six of the eight declarations were deleted. `isAsymptoticScale_inv_pow` remains and still closes in one term (R03 below). `hasAsymptoticExpansion_of_hasSum` remains; it states the DLMF sentence at `dlmf21` lines 573–575 and is not a one-tactic consequence, so it is not raised again. |
| R07 (P3) Tau Ceti Laplace file | repaired | README lines 196–202 and 529–531 cite the three `TauCeti.*_cexp_neg_mul` declarations. All three exist at the pin (`TauCeti/Analysis/Complex/LaplaceTransform.lean` lines 46, 119, 168, namespace `TauCeti`). |
| R08 (P3) Lean names absent from README | repaired | All 52 declaration names occur in the README. The four inside code spans or blocks are `bleisteinF` and `bleisteinG` (lines 722–723), `laplaceCoeff` (574) and `rayLaplaceDomain` (498). |

## R01 (P2) — `laurentCoeff` duplicates Tau Ceti's `circleLaurentCoeff`, and the ownership table says Tau Ceti lacks it

Location: `TauCetiRoadmap/AsymptoticExpansions/README.md` lines 65–67 ("auxiliary results … which neither Mathlib nor Tau Ceti provides") and 77 ("The Laurent coefficients `f_n` of a function on a punctured disc | 13.6"), and 13.6 (lines 1298–1316). `TauCetiRoadmap/AsymptoticExpansions/Suggested.lean` line 600 (`def laurentCoeff`).

Claim: 13.6 defines `laurentCoeff f ρ n = (2πi)⁻¹ ∮_{|z|=ρ} z^{−n−1} f(z) dz`, says it is independent of `ρ`, and owns it as missing from the libraries. Its Checks are the monomial value, linearity, and the index shift under multiplication by `z`.

Witness: at the pinned Tau Ceti, `TauCeti/Analysis/Complex/Laurent/Basic.lean` defines `TauCeti.circleLaurentCoeff f c R n = (2πi)⁻¹ • ∮ z in C(c, R), (z − c)^(−n−1) • f z` (line 49). It also proves independence of the radius (`circleLaurentCoeff_eq_of_differentiable_on_annulus_off_countable`, line 123), the monomial value (`circleLaurentCoeff_sub_zpow_smul`, line 145), additivity (`circleLaurentCoeff_add`, line 87) and the Cauchy estimate (`norm_circleLaurentCoeff_le`, line 100).

Repair: delete `laurentCoeff` from `Suggested.lean` and add `public import TauCeti.Analysis.Complex.Laurent.Basic`. State Darboux's theorem with `TauCeti.circleLaurentCoeff f 0 ρ n` in place of `laurentCoeff f ρ n`. In the README:
- delete the table row at line 77;
- cite the four declarations above under `### From Tau Ceti` and at 13.6;
- turn the first and third Checks of 13.6 into citations of `circleLaurentCoeff_sub_zpow_smul` and `circleLaurentCoeff_add`;
- keep the `1/(1 − z)` value as a Check of 13.6's theorem.

Tested on a scratch file against the pin (exit 0):
- `laurentCoeff f ρ n = TauCeti.circleLaurentCoeff f 0 ρ n` closes by unfolding and `ring` on the exponent (`−(n+1) = −n−1`);
- the monomial Check `circleLaurentCoeff (fun z => z ^ k) 0 ρ n = if n = k then 1 else 0` is `simpa using circleLaurentCoeff_sub_zpow_smul 1 0 hρ k n`;
- the restated `tendsto_laurentCoeff_sub` elaborates.

## R02 (P2) — Statable headline theorems are still absent, and the docstring lists none as not statable

Location: `TauCetiRoadmap/AsymptoticExpansions/Suggested.lean` lines 9–13 ("not exhaustive … Stationary phase (6.2) is stated for a finite upper limit `b` … the case `p(b) = ∞` of the README is not stated here"). README 5.4–5.5 (lines 612–630) and 6.2(d) (lines 672–675).

Claim: the file states the headline theorems that are statable at the pins, and names in its docstring each headline that is not statable.

Witness: "Laplace's method and saddle points" is the title of Layer 5, and the README's coverage list (line 15) names saddle points. DLMF 2.4.12 and 2.4.15 (`dlmf24` lines 540–575, 687–750) have no declaration in the file. 6.2(d), the case `p(b) = ∞` that the Fresnel example uses, is omitted with no reason. A draft 6.2(d) for `b = ∞` elaborates at the pins (scratch file, exit 0). It uses the same hypotheses as `isBigO_stationaryPhase_remainder`, with `Tendsto p atTop atTop`, `Tendsto (P 0) atTop (𝓝 0)` and the uniform Cauchy condition of 2.3.22.

Repair: add two theorems to `Suggested.lean`.
- 6.2(d) for `b = +∞`: an `∃ F` with the improper integral `Tendsto (fun T => ∫ t in a..T, …) atTop (𝓝 (F x))` for large `x`, and `HasAsymptoticExpansion atTop` of `e^{−ixp(a)} F` in the scale `x^{−(s+λ)/μ}`.
- 5.4, Laplace's method on a contour: a path `γ : ℝ → ℂ` that is `C¹` and straight on `[0, τ₀]`; `p` and `q` holomorphic on an open set containing `γ '' Ioi 0`; conditions (b) and (c) of `dlmf24` lines 523–536 written with `cexp (θ * I)`; the conclusion along `comap re atTop ⊓ 𝓟 {ζ | θ₁ ≤ ζ.im ≤ θ₂}` in logarithmic coordinates.

The finished theorems must reproduce the README's own examples:
- Fresnel: `½ √(π/x) e^{iπ/4}` with `b₀ = ½`;
- for 5.5, `p = t²`, `q = 1` through `t₀ = 0`: `2 Γ(½) b₀ z^{−1/2} = √(π/z)` with `b₀ = ½` and `b₂ = 0`.

Then add to the module docstring a sentence naming any headline theorem left unstated (for example Handelsman–Lew 8.4), with the carrier it lacks. The "not exhaustive" note can stay: the repository README asks for it.

## R03 (P3) — Padding: `isAsymptoticScale_inv_pow` closes with one library term

Location: `TauCetiRoadmap/AsymptoticExpansions/Suggested.lean` line 55. README line 294 ("these are asymptotic scales (`isAsymptoticScale_inv_pow` at infinity)").

Claim: the file states only headline theorems and the definitions they need.

Witness: on a scratch copy, `fun n => ((isLittleO_pow_pow_cobounded_of_lt n.lt_succ_self).inv_rev (Eventually.of_forall fun z h => by simp_all)).mono inf_le_left` closes it (exit 0, no warnings). The lemma used is `Asymptotics.isLittleO_pow_pow_cobounded_of_lt` (`Mathlib/Analysis/Asymptotics/SpecificAsymptotics.lean` line 44).

Repair: delete the declaration from `Suggested.lean`. In README 1.3, keep the statement in prose and drop the backticked name, so that the gate's name check passes.

## R04 (P3) — Library citations: Euler's second Beta integral exists in Tau Ceti, and two names are wrong

Location: README line 75 (2.6.4 row of the ownership table), 9.1 (lines 965–968), `### From Tau Ceti` (lines 192–208); line 463 (`integral_rpow_mul_exp_neg_mul_Ioi`); lines 471–472 ("from Mathlib's real case (`integral_cpow_mul_exp_neg_mul_Ioi_of_re_pos`)").

Claim: neither library provides 2.6.4; the cited Mathlib names exist as written.

Witness: Tau Ceti's `TauCeti.integral_rpow_mul_one_add_rpow` (`TauCeti/Analysis/SpecialFunctions/Beta.lean` line 456) is 2.6.4 at `x = 1` for real `α, β > 0`. `#check` at the pin: `integral_rpow_mul_exp_neg_mul_Ioi` is unknown; `Real.integral_rpow_mul_exp_neg_mul_Ioi` exists. Mathlib's real case is `Complex.integral_cpow_mul_exp_neg_mul_Ioi`.

Repair:
- Cite `TauCeti.integral_rpow_mul_one_add_rpow` under `### From Tau Ceti` and at 9.1. Change the table row to say that 9.1 extends it to complex `α, β` with positive real parts and to every `x > 0` (by `t = xu`: `x^{−β} B(α, β)`; check `α = β = ½`, `x = 1`: `π`).
- Write `Real.integral_rpow_mul_exp_neg_mul_Ioi` at line 463.
- At 4.1 write "from Mathlib's real case `Complex.integral_cpow_mul_exp_neg_mul_Ioi`", and attach the target's own name to the target sentence.

## R05 (P3) — Convergence hypotheses narrower than the DLMF statements they cite

Location: README Conventions lines 152–154 ("Absolute convergence is assumed throughout"); 3.2 lines 421–423 and 6.1 lines 647–649 (`q^{(s)} → 0` and `q^{(s+1)}` integrable); `Suggested.lean` lines 261–262 (`hint`, `hlim`).

Claim: 3.2 (`b = ∞`), 3.3 and 6.1 are DLMF 2.3.5, 2.3.8 and 2.3.20.

Witness:
- DLMF assumes only that each `∫ e^{ixt} q^{(s)}` converges uniformly for large `x` (`dlmf23` lines 211–213, 884–888), and that the Laplace integral converges (lines 318–319, 402–403).
- `q(t) = sin t / t` meets the DLMF hypothesis for `x ≥ 2`, but `q′ = cos t/t − sin t/t²` is not integrable on `[1, ∞)`.
- `q(t) = (d/dt) cos(e^{t²})` has a Laplace integral that converges for every `x > 0` and never converges absolutely.

Repair: state 3.2 (`b = ∞`) and 6.1 with DLMF's uniform-convergence hypothesis, written as 6.2(d) already writes it. In Lean: `∀ s, ∃ x₀, ∀ ε > 0, ∃ c, ∀ x ≥ x₀, ∀ T' ≥ T ≥ c, ‖∫ t in T..T', cexp (x * t * I) * q^{(s)} t‖ ≤ ε`. Keep the integrability form as a Check that implies it, by one integration by parts. Either state Watson's lemma (3.3, 4.2) under convergence of the Laplace integral at some `x₀`, or record under `## Scope and ownership` that the conditionally convergent case is excluded, and why.

## R06 (P3) — Build order: Layer 1 uses a Layer 5 definition, and no target has its own `*Needs:*` line

Location: README 1.4 lines 323–326 ("`f ^ r ∼ formalCpow ℓ r P` (5.1)"); 5.1 line 567. All of Layers 1–13: `grep -c '*Needs:*'` gives 0. For example, Layer 13's Dependencies (line 1329: "Layers 1, 3 and 5") is the only dependency statement for 13.1.

Claim: targets are in build order, and each target's needs are listed item by item.

Witness: `formalCpow` is defined in Layer 5 but used in a Layer 1 theorem. Euler–Maclaurin (13.1) needs only `bernoulliFun` and integration by parts, yet its only dependency line points it at Layers 3 and 5. ZerosOfLFunctions on main has 51 `*Needs:*` lines.

Repair: move the definition of `formalCpow` and its three Checks to 1.4, and let 5.1 cite it. Restore a `*Needs:*` line at the end of each `### k.n` target, keeping `### Dependencies` as the per-layer union. Examples: 13.1: Mathlib `bernoulliFun`, `hasDerivAt_bernoulliFun`, integration by parts. 13.5: 5.4–5.5 and ZerosOfLFunctions §1.2. 8.7: 8.6, `mellinInv_mellin_eq`, `Complex.GammaIntegral_eq_mellin`.

## R07 (P3) — Checks missing for the two central notions and for `mellinContOscTop`

Location: README 1.1 (lines 265–279: API bullets, no `**Checks.**`); 8.3 lines 884–890 (three Checks, one of them about `mellinContOscTop`).

Claim: every definition has at least three discriminating Checks.

Witness: `IsAsymptoticScale` and `HasAsymptoticExpansion` have no Checks list. `mellinContOscTop` has one Check, and that Check holds for any definition that agrees at `p = 1` with a single term.

Repair: add `**Checks.**` to 1.1.
- `n ↦ x⁻ⁿ` along `atTop` is a scale; along `𝓝[>] 0` it is not, since each ratio is `x⁻¹ → ∞`.
- Along `atTop`, `e^{−x}` has the zero expansion in `x⁻ⁿ`, so an expansion does not determine `f`.
- Rescaling: `f = 1` has coefficients `(1, 0, …)` in `x⁻ⁿ` and `(½, 0, …)` in `2x⁻ⁿ` (move the example from line 355).

Add two Checks for `mellinContOscTop`. Both were computed for this review.
- For `f(t) = e^{iκt}(t^{−1} + t^{−2})`, `β_k = k + 1`, `b₀ = b₁ = 1`: the values at `n = 1` and `n = 2` agree, both `oscTail κ (z − 1) + oscTail κ (z − 2)`.
- For `p = 2`, `f(t) = e^{iκt²} t^{−3}` (`β₀ = 3`): the value is `½ oscTail κ ((z − 3)/2)`, which a definition without the factor `p⁻¹` or with unscaled `z − β_k` gets wrong.

## R08 (P3) — Scope wording: "a roadmap for a roadmap; do not implement" and an "open" pull request

Location: README line 1347 (`## Beyond this roadmap (a roadmap for a roadmap; do not implement)`), line 1349 ("the natural continuation"); lines 151 and 230 ("Mathlib's open Laplace-transform pull request").

Claim: the README is timeless and definite about scope.

Witness: "do not implement" is an instruction to contributors. "Natural continuation" and "a roadmap for a roadmap" present excluded material as later work. "Open" stops being true when the Mathlib pull request lands or closes.

Repair: rename the section `## Excluded material` (or merge it into "What it does not own"), and state each item as an exclusion, with its owner where one exists:
- the special-function roadmaps;
- SpecialFunctionsEiLiErfIncompleteGamma for 2.5.49 and §2.11(ii);
- ZerosOfLFunctions §§1.2–1.3.

Write "Mathlib pull request #40582 (Laplace transform)" without "open".

## Verified sound

**Gate and dependencies.**
- `gate --depcheck … --movable`: `depcheck: 240 roadmaps, 2429 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- The worker's gate at dcc019c: every check 0, `build=0`, OK.
- My full gate run: every text scanner 0, `stray-files=0`, `outside-folder=0`, plus one line `depcheck: NOT IN ORDER: AsymptoticExpansions (insert it after its last supplier)`. This roadmap is not yet in the merge order, which at this stage is not a finding.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AsymptoticExpansions'` is empty.

**Elaboration.** `lake env lean TauCetiRoadmap/AsymptoticExpansions/Suggested.lean`: exit 0 in 22 s, 38 warnings, all `declaration uses 'sorry'`. The file has 52 declarations (14 definitions with real bodies, 38 theorems), no `set_option`, no `lemma`, no sorry'd data, and imports `Mathlib` and `TauCeti.Analysis.Contour.Residue.Basic` (both exist at the pin).

**`#check @name` sweep.** All 52 declarations were checked on a scratch copy (exit 0) and compared with `signatures.md` and the README: no section binder is lost. `IsAsymptoticScale` carries `[NormedField 𝕜]`, and `HasAsymptoticExpansion` carries `[NormedAddCommGroup E] [NormedSpace 𝕜 E]`. `ContDiffOn ℝ (↑⊤)` in 6.1, 6.2 and 11.4 is `C^∞`. Nothing changed.

**Suppliers resolved.**
- ZerosOfLFunctions on main: `### 1.2 Stirling on the sector` (line 459) and `### 1.3 Vertical strips` (line 469) say what the contract consumes, with `S_δ = {|arg s| < π − δ, ‖s‖ > 1}`. Both headings survive at the heads of the two open ZerosOfLFunctions revisions (#1907 lines 459, 469; #1913 lines 496, 506).
- ContourIntegration is in `Completed/`. `TauCeti.Contour.residue` is at `TauCeti/Analysis/Contour/Residue/Basic.lean` line 80.
- ZerosOfLFunctions is merge-order line 85, earlier than this roadmap.

**Library declarations opened at the pins** (`#check` exit 0): `PowerSeries.substInvOfIsUnit` (takes only `IsUnit (coeff 1 P)`; `RingTheory/PowerSeries/Substitution.lean` line 567), `PowerSeries.subst`, `PowerSeries.binomialSeries`, `HasFPowerSeriesAt.isBigO_sub_partialSum_pow`, `ODE_solution_unique`, `IsPicardLindelof`, `Complex.integral_cpow_mul_exp_neg_mul_Ioi` (real rate `r : ℝ` only), `Real.integral_rpow_mul_exp_neg_mul_Ioi`, `Complex.GammaIntegral_eq_mellin`, `mellin_differentiableAt_of_isBigO_rpow`, `mellinInv_mellin_eq`, `Complex.VerticalIntegrable`, `Real.tendsto_harmonic_sub_log`, `norm_le_gronwallBound_of_norm_deriv_right_le`, `Stirling.factorial_isEquivalent_stirling`, `periodizedBernoulli`, `Complex.digamma`, `riemannZeta_one_sub`, `Real.eulerMascheroniConstant`, `Complex.betaIntegral`, `HasStrictFDerivAt.implicitFunction`, `HasStrictDerivAt.to_localInverse`, `Finset.sum_range_by_parts`, `hasDerivAt_bernoulliFun`, `bernoulliFun_eq_integral`, `tendsto_integral_exp_inner_smul_cocompact`, `descPochhammer`, `Ring.choose`, `Set.ofPred`, `Real.sign`, `TauCeti.Contour.residue`. Read in source at the pin: `TauCeti.wronskian_eq_of_hasDerivAt` (`TauCeti/Analysis/ODE/Wronskian.lean` line 31) and `TauCeti.IsFrobeniusIntegrableAt` (`TauCeti/Analysis/ODE/Frobenius.lean`).

**Duplication by object.**
- Mathlib has no complex-rate Gamma integral (4.1), no vertical-strip Gamma bound (8.6), and no Euler–Maclaurin, Abel–Plana, Watson, stationary-phase, Liouville–Green or Volterra declaration. The only `norm_Gamma` lemmas are the `‖Γ(s)‖ ≤ ‖Γ(s+1)‖` family in `Gamma/Beta.lean` lines 453–470.
- Tau Ceti has none of these either. Its `LinearRecurrence/OrderTwo.lean` treats constant coefficients only, which Layer 12 does not need. The exceptions are R01 and R04.
- The two names the citation scanner flagged (`Asymptotics.IsAsymptoticScale`, `Asymptotics.HasAsymptoticExpansion`) are this roadmap's own target names in their Tau Ceti namespace (README Conventions lines 117–123).

**Ownership against open pull requests.** I grepped main and the 472 open heads (`roadmaps grep`) for Euler–Maclaurin, Abel–Plana, Watson's lemma, stationary phase, Laplace's method, saddle point and steepest descent, Liouville–Green and WKB, Darboux's method, Stieltjes transform, Borel–Ritt, Bleistein and Chester–Friedman–Ursell, Volterra, reversion, and asymptotic expansion. No second owner was found:
- SpecialFunctionsParabolicCylinder, SpecialFunctionsEiLiErfIncompleteGamma and SpecialFunctionsAiry all consume this roadmap and cite existing sections (§§1.5, 2, 3.1–3.3, 4.2, 4.3, 5.2, 5.4, 8.1, 8.2, 8.6, 8.7, 10.2, 12.1);
- ComputationalNumberTheory uses Euler–Maclaurin only for Hurwitz zeta (DLMF 25.11.4);
- QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups treats nonstationary phase on Lie groups;
- HabiroNahmSeries and NoncompactQuantumSymmetry use their own WKB normalisations.

`overlaps.md` lists no dropped ids and no other pull request changing this roadmap. No declaration of `Suggested.lean` reuses a fully qualified name of another roadmap.

**Seeded sample, read in the DLMF text.**
- 1.2: `dlmf21` lines 143–299, and 252–254 for the sector remark (`x = 1 + it`).
- 1.4: `dlmf21` lines 615–620 (operations, "substitution, logarithms, and powers").
- 1.5: `dlmf21` lines 378–443 (2.1.11–2.1.12, Ritt's theorem with `O` and `o`).
- 2.1: `dlmf22` lines 49–83.
- 3.5: `dlmf23` lines 450–514 (2.3.10–2.3.12). The README's local integrability and general `α_s` is the extension of Bleistein–Handelsman §4.1 that DLMF names at line 404.
- 5.4: `dlmf24` lines 443–575 (conditions (a)–(c), 2.4.13).
- 5.5: `dlmf24` lines 626–750 (2.4.14–2.4.16, `|θ + 2ω + ω₀| ≤ π/2`).
- 7.2: `dlmf23` lines 1078–1360 (2.3.24–2.3.33).
- 8.3: `dlmf25` lines 681–1062 (2.5.17–2.5.28, Table 2.5.1).
- 9.1: `dlmf26` lines 151–155.
- 10.5: `dlmf27` lines 713–743.
- 11.1: `dlmf27` lines 793–938.
- 12.2: `dlmf29` lines 342–492.
- Also: 6.1 and 6.2, `dlmf23` lines 884–1049; the 10.4 recursion, `dlmf27` lines 470–545; 12.1, `dlmf29` lines 200–318.

Each supports the README statement as written, except for the narrowing recorded in R05 and the two source misprints below, which the README already corrects.

**Adversarial table** (values computed for this review):

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.2 order examples | `e^{−z}` at `z = 1 + it`; `sin(πn + 1/n)` | `|e^{−z}| = e^{−1}` ↛ 0; `|(−1)ⁿ sin(1/n)| ≤ 1/|n|` | agree with DLMF | none |
| `HasAsymptoticExpansion.unique` | first index `m` where `a`, `b` differ | `φ_m(b_m − a_m) = O(φ_{m+1}) = o(φ_m)`; on the frequent set `φ_m ≠ 0`, `‖b_m − a_m‖ ≤ ε` | true | none |
| `isAsymptoticScale_inv_pow` | `X` bounded; `X = ℂ` | `⊥`: vacuous; ratio `z⁻¹ → 0` | true, one term | R03 |
| `hasAsymptoticExpansion_inv_pow_iff` | `X` bounded; both directions | both sides true along `⊥`; `zⁿ(f − S_n) − a_n = zⁿ(f − S_{n+1}) = O(z⁻¹)` | true | none |
| `hasAsymptoticExpansion_of_hasSum` | `f = 1/(z−1)`, `R = 1`; `R < 0` at `z = 0` | `∑_{s≥1} z^{−s} = 1/(z−1)` for `|z| > 1`; `(0^0)⁻¹a₀ = a₀`, higher terms 0 | true | none |
| `pow_mul` | `w ≡ 0` | `f = p₀`, `g = q₀` eventually; `fg = p₀q₀`, remainder `O(0^N) = 0` | true | none |
| `pow_substInv` | `P = X + X²` | `Q = X − X² + 2X³ + …`: `Q + Q² = X + O(X⁴)` | true | none |
| `formalCpow`, 1.4 powers | `r = 1`; `r + r′` | `e^{ℓ}·e^{−ℓ}P = P`; `(1+X)^r(1+X)^{r′} = (1+X)^{r+r′}` | true; forward reference | R06 |
| 1.5, 2.1.11–12 | `f = t^{−2}`; `f = t^{−1}` | `∫ₓ^∞ t^{−2} = x⁻¹ = −x^{−1}/(−1)`; `F = log x − log x₀ ∼ log x` | agree | none |
| Ritt, `isBigO_deriv_of_isBigO_sector` | `f = e^{−z}`, `θ = π/2`, `ν = 0`; boundary ray | `|f| ≤ 1` on the open sector; `|f′| = e^{−Re z} = O(|z|⁻¹)` for `|arg z| ≤ θ′ < π/2`; at `z = it`, `|f′| = 1`: closed subsectors needed | true | none |
| Borel–Ritt | `θ ≥ π` excluded | the closed sector `|arg z| ≤ π` is `ℂ`: a nonconvergent series cannot expand an `f` holomorphic near `∞` | `θ < π` is right | none |
| 2.1 inversion | `f = x + 1/x`, `a = 1` | `x(y) = (y + √(y² − 4))/2 ∼ y`, `f(a) = 2` | agree | none |
| `reversionCoeff`, 2.2.8 | `f = x + f₀ + f₁/x`; `f = x + f₀` | `F₂ = ½[X³](1 + f₀X + f₁X²)² = f₀f₁`; direct `x = y − f₀ − f₁/y − f₀f₁/y²`; `[X^{s+1}](1 + f₀X)^s = 0` | agree | none |
| 3.5 general kernels | `f = e^{−t²}` (`κ = 2`), `q = 1` | `∫ e^{−x²t²} = √π/(2x)`; `𝓜f(1)x⁻¹ = (√π/2)x⁻¹` | agree | none |
| 3.2, 6.1 hypotheses | `q = sin t/t` | DLMF uniform convergence holds for `x ≥ 2`; `∫₁^∞ |q′| = ∞` | README narrower | R05 |
| 4.1 | `s = 2`, `z = 1 + 2i` | `∫ t e^{−zt} = z^{−2} = Γ(2)z^{−2}` | agree | name, R04 |
| `hasAsymptoticExpansion_laplace_sector` | `q = t^{−1/2}`; `δ ≥ π/2` | `√π z^{−1/2}` exactly; sector is `[0, ∞)` or empty | true | none |
| `rayLaplace` | `q = t^{α−1}`; `q = t^{−1/2}`, `θ = ±3π/4` | `e^{iθ}e^{iθ(α−1)}Γ(α)e^{−α(ζ+iθ)} = Γ(α)e^{−αζ}`; `J_{3π/4}(log R − iπ) = √π R^{−1/2} e^{iπ/2} = i√(π/R)` | Checks hold | none |
| `exists_inverseLaplace_hasExpansion` | `Q = z^{−α}` | Bromwich: `t^{α−1}/Γ(α)`; `Q′ = −αz^{−α−1}` matches `hexp'` | true | none |
| `laplaceCoeff`, 2.3.17 | `b₁` | `μ⁻¹p₀^{−(λ+1)/μ}(q₁ − (λ+1)p₁q₀/(μp₀))` | agrees with Check | none |
| `hasAsymptoticExpansion_laplace_method` | `p = t²`, `q = 1`, `a = 0` | `b₀ = ½`, `Γ(½)·½·x^{−1/2} = ½√(π/x)` | agree | none |
| 5.4 | `p = t`, `ω = 0`, `q = 1` | `I = 1/z = Γ(1)b₀z^{−1}`, `b₀ = 1`; 2.4.13 gives `|θ| ≤ π/2` | true; absent from Lean | R02 |
| 5.5, 2.4.15–16 | `p = t²`, `q = 1` on `ℝ` | `b₀ = (2p″)^{−1/2} = ½`, `b₂ = 0` (`p‴ = p⁗ = q′ = q″ = 0`); `2Γ(½)·½·z^{−1/2} = √(π/z)` | agree | R02 |
| `hasAsymptoticExpansion_fourier` | `q = e^{−t}` | exact `1/(1 − ix) = −∑(ix)^{−s−1} = ∑(−1)^s i^{s+1}x^{−s−1}`; formula `e^{iπ(s+1)/2}Γ(s+1)(−1)^s/s!` gives the same | agree | R05 |
| `isBigO_stationaryPhase_remainder` | `p = t`, `q = 1` on `[0, 1]`; sign at `b` | `(e^{ix} − 1)/(ix) − i/x + e^{ix}(i/x) = 0`; `(−1)^s(ix)^{−s−1} = −(i/x)^{s+1}`, matching `dlmf23` line 1013 | true | none |
| 6.2(d) | Fresnel `p = t²` | `½√(π/x)e^{iπ/4}`; draft for `b = ∞` elaborates | statable, absent | R02 |
| 7.1 sign of `a` | `α < 0`, `t = 0 > α` | DLMF: `w(α,0) = a + |a| = 2a ≠ 0`; README `a = sgn(α)·…`: `w(α,0) = 0` | README right | source issue |
| `bleisteinF`, `norm_bleistein_remainder_le` | `w = τ/√x`; `N = 0`; `C < 0` | `∫ e^{−x(w²/2 − aw)}(w−a)^s w^{λ−1} = x^{−(s+λ)/2}F_s(a√x)`; `N = 0`: `‖∫‖ ≤ Cx^{−λ/2}G₀`; `C < 0` with `N ≥ 1` is vacuous | true | none |
| 7.2 Checks | `λ = 2`, `y = 0`; `λ = 1` | `F₀(0) = ∫τe^{−τ²/2} = 1 = 2^0Γ(1)`; `F₁(y) = [−e^{−τ²/2+yτ}]₀^∞ = 1` | agree | none |
| `exists_cubic_normal_form` | `t³/3 − αt`; `t³/3 + α²t` (`hmix = 0`) | `w = t`, `ζ = α`, `η = 0`; second: `ζ = −α²` also satisfies the conclusion (`hmix` serves the route only) | true | none (note) |
| `integral_vertical_sub_eq_two_pi_mul_sum_residue` | `F = 1/(t(1−t))`, `c = ½`, `d = −½` | `∫dy/(¼ + y²) = 2π`, left line `0`, `Res₀ = 1`: `2π − 0 = 2π·1`; orientation `i(∫_c − ∫_d) = 2πi∑Res` | true | none |
| `exists_norm_Gamma_le` | `x = ½` | `|Γ(½+iy)|² = π/cosh πy ≤ 2πe^{−π|y|}` | `K = 0`, `C = √(2π)` | none |
| `integral_Gamma_mul_cpow_neg` | `w = 1` | `∫Γ(c+iy)dy = 2π/e`; `|w^{−iy}| = e^{y arg w}` | true | none |
| `mellinContAtZero_spec` | `n < m` on the overlap; `f = e^{−t}` | difference `∑_{n≤k<m}a_k[1/(z+α_k) − ∫₀¹t^{z+α_k−1}] = 0` for `Re(z+α_k) > 0`; residue at `−k` is `(−1)^k/k!` | true | none |
| `mellinContAtTop` Check | `f = (1+t)⁻¹` | `Res_{k+1} π/sin πz = (−1)^{k+1} = −b_k` | agree | none |
| `oscTail`, `oscTail_spec` | `w = 1`; `κ ↦ −κ` | `i sgnκ e^{iκ}/|κ| = ie^{iκ}/κ`; `conj` symmetry from `conj(u^{w−1}) = ū^{w̄−1}` | agree | none |
| `exists_entire_mellinContOscTop` | `f = e^{iκt}(t⁻¹ + t⁻²)` | `n = 1` and `n = 2` both give `oscTail(z−1) + oscTail(z−2)`; `u = t^p` gives `p⁻¹oscTail((z−β)/p)` | true | Check, R07 |
| 9.1 | `α = β = ½`, `x = 1`; `α = β = 1` | `∫t^{−1/2}(1+t)⁻¹ = π = Γ(½)²/Γ(1)`; `x⁻¹` | agree | R04 |
| `stieltjes_eq` | `n = 0`; `0 < α < 1` poles | identity is `∫f/(t+z) = ∫f/(t+z)`; `β_k = k + α ∉ ℤ`, so `𝓜f(s)` at `s = 1..n` is off the poles | true | none |
| `exists_volterra_solution` | `K = 0`; Picard bound | `h = 0`, bound `0`; `|h_{n+1} − h_n| ≤ PΦΨⁿ/n!` from `−dΨ = PQ|ψ|` | true | none |
| `regularSingular_solution` | `f = 0`, `g = −2z⁻²`, `ρ = 2` | `Q(2+s) = s² + 3s ≠ 0`, `a_s = 0`, `w = z²` | true | none |
| `exists_rankOne_solution` | `f = −1 + 2z⁻²`, `g = −z⁻² − 2z⁻³ + z⁻⁴`, `λ₁ = 0` | `μ = 0`; `ha`: `−a₁ = g₂ = −1`, `−2a₂ = 2a₁ + g₂a₁ + g₃ = −1`: `a₁ = 1`, `a₂ = ½`; `e^{1/z}` solves | true | none |
| 10.5 Fabry | expand `F`, `G` | `F = (2f₁ − 1)t⁻¹ + …`, so `F₀ = 0`; `G = 4(g₁ − ½f₀f₁) + O(t⁻²)` with `g₀ = f₀²/4` | agree | none |
| `liouvilleGreen_recessive` | `f = 1`, `g = 0`; `f = x²` | `Φ = 0`, `w = e^{−(x−c)}`; `Φ = (3/4)x⁻³`, integrable at `∞` | true | none |
| `exists_caseI_solution` | `ψ = 0`; formal check | `W = e^{uξ}`; `2A′_{s+1} + A_s″ − ψA_s = 0` equals 2.8.13 | true | none |
| `exists_difference_solution` | `w(n+2) − 3w(n+1) + 2w(n)`, `ρ = 2` | `α = 0`; `ha` at `s = 1`: `C(0, 2) = 0`, so `a₁ = 0`, `w = 2ⁿ` | true | none |
| 12.2 labelling | `w(n+2) − 2w(n+1) + w(n)` | `2α² − 2α = 0`, `α₁ = 0 ≤ α₂ = 1`; solutions `1` and `n` (2.9.13 with `c = 0`) | exhaustive | none |
| Layer 12 `g(n) ≠ 0` | README counterexample | `w(2) = 0` forces `A + 4B = 0`; `(1, 0, 0, …)` solves | hypothesis needed | none |
| `sum_Icc_eq_eulerMaclaurin` | `f = x⁴`, `[0, 1]`, `m = 2` | `1/5 + 1/2 + (1/6)/2·4 + ∫(B₄ − B₄(x)) = 1/5 + 1/2 + 1/3 − 1/30 = 1` | true | none |
| `sum_Icc_eq_abelPlana` | `f = z²`, `a = 0`, `n = 2`; reflection | `5 = 8/3 + 2 + 1/3`; `f(x − iy) = conj f(x + iy)` gives `−2Im f(a+iy) + 2Im f(n+iy)` | true | none |
| 13.2 Bernoulli terms | Taylor of `Im f(n+iy)` | `2(2j+1)!ζ(2j+2)/(2π)^{2j+2}·(−1)^j/(2j+1)! = B_{2j+2}/(2j+2)!` | agree | none |
| `tendsto_sum_mul_log_sub`, 13.3 | both constants | `1/12 − ζ′(−1) = 0.08333 + 0.16542 = 0.24875`; `(γ + log 2π)/12 − ζ′(2)/(2π²) = 0.20126 + 0.04750 = 0.24876` | agree | none |
| `tendsto_laurentCoeff_sub` | `f − g = h` continuous to `|z| = r` | `rⁿ(f_n − g_n) = (2π)⁻¹∫h(re^{iθ})e^{−inθ}dθ → 0` both ways | true | carrier, R01 |

**README Checks evaluated against their theorems:** those of 2.3, 4.3, 5.1, 7.2, 8.3 and 13.6, the examples of Layers 1, 3–13, the `X = {c}` remark of 1.3, the `(1, 0, 0, …)` counterexample of Layer 12, and the uniqueness counterexample of 11.2 (`e^{x−c} + C sinh x ∼ e^{x−c}` as `x → 0+`). All are consistent.

## Not verifiable

- DLMF §2.10 (13.1, 13.2, 13.3, 13.6: the equation numbers 2.10.1–2.10.32 and their exact forms). Every URL tried through the sources service (`https://dlmf.nist.gov/2.10`, `#i`, `2.10.i`, `2.10.ii`, `http://dlmf.nist.gov/2.10`) resolves to the figure `2.10.F1.pdf`, whose OCR is two lines of axis labels. The statements of 13.1, 13.2 and 13.3 were checked by computation instead (table).
- Olver, *Asymptotics and Special Functions* (Chapter 6 §10, Chapter 7 §2, Chapter 8), Olver 1994 (*Methods Appl. Anal.* 1), Wong and Li 1992, Chester–Friedman–Ursell 1957, Bleistein–Handelsman 1975, Wong 1989, Handelsman–Lew 1970 and Temme 2015 are paywalled books and journals; they were not read.
- The current state and content of the Mathlib pull requests cited at README lines 230–247 were not fetched. The pinned `Mathlib/Tactic/ComputeAsymptotics/Multiseries/` directory exists.

## Source issues

- **Misprint** in DLMF at 2.3.26–2.3.27 (§2.3(v), `dlmf23` lines 1149–1202): the source takes `a` as the positive square root, so for `α < 0` the point `t = 0` maps to `w = 2a`; it should be `a = sgn(α)(2p(α,0) − 2p(α,α))^{1/2}`, which the source's own requirement that `t = 0` correspond to `w = 0` forces; affects a stated result.
- **Error** in DLMF at §2.7(ii), the sentence after 2.7.13 (`dlmf27` lines 539–540): the source says the formal series diverge unless they terminate; it should say "unless `Λ_j = 0`". For `f = −1 + 2z⁻²`, `g = −z⁻² − 2z⁻³ + z⁻⁴`, both normalized series are the convergent, non-terminating `∑ z^{−s}/s!`; affects a stated result.
