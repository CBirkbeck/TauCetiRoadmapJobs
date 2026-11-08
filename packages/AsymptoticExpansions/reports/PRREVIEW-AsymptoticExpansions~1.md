# Review of AsymptoticExpansions (pull request #1857 at 9824db0)

**Verdict:** needs changes

Two blocking findings (both P2) and six P3 findings. The mathematics of the 55 declarations of `Suggested.lean` and of the sampled README targets is sound: every locator of the seeded sample was found at the cited DLMF equation with the hypotheses the README states, and the adversarial table below found no false statement. The blocking findings are a second owner of four targets in another open roadmap and headline theorems that are statable at the pins but absent from `Suggested.lean`.

## R01 (P2) — Watson's lemma in a sector, the Gamma strip bound, the line shift and the Cahen–Mellin integral have a second owner

Location: `TauCetiRoadmap/AsymptoticExpansions/README.md` lines 68–82 ("What this roadmap owns": the line-shift identity, the pole-separated bound, the exponential Mellin inversion) and Milestones 4.2, 8.2, 8.6, 8.7.

Claim: the roadmap owns Watson's lemma in the sector `|ph z| ≤ π/2 − δ` (4.2), the line-shift identity with simple poles (8.2), the pole-separated bound `|Γ(x + iy)| ≤ C (1 + |y|)^K e^{−π|y|/2}` on vertical strips (8.6) and `∫_ℝ Γ(c + iy) w^{−c−iy} dy = 2π e^{−w}` (8.7).

Witness: the open roadmap SpecialFunctionsParabolicCylinder (pull request #1801, same author) owns the same four objects: its completion criterion item 7 is "Watson's lemma for Laplace integrals, with complex variable in a sector", its ownership paragraph says it "owns … the Watson theory of Milestones 1 and 7, … pole-separated Gamma bounds and Barnes integration tools of Milestone 6.6" (`TauCetiRoadmap/SpecialFunctionsParabolicCylinder/README.md` lines 65 and 91–93 at head cad1a20), its Milestone 6.6(c) states the identity `∫_ℝ Γ(c + iy) w^{−c−iy} dy = 2π e^{−w}` for `c > 0`, `Re w > 0` (line 660), and its Milestone 7 states Watson's lemma in the sector with the same hypotheses as 4.2 here (lines 727–744). Neither README cites the other (the parabolic-cylinder README contains no occurrence of `AsymptoticExpansions`). Two open roadmaps building the same object have no single owner.

Repair: this roadmap is the general toolkit and the natural owner. Add a `## Downstream consumers` section naming SpecialFunctionsParabolicCylinder as the consumer of 4.2, 8.2, 8.6 and 8.7 (by section), so that the other roadmap can cite `AsymptoticExpansions §4.2`, `§8.2`, `§8.6`, `§8.7` and drop its Milestone 7 and the general parts of 6.6(a)–(c); the merge-order paragraph of the parabolic-cylinder pull request then names this roadmap as its supplier. Until one of the two cedes, the gate's ownership rule is violated on both sides.

## R02 (P2) — Headline theorems statable at the pins are absent from `Suggested.lean`

Location: `TauCetiRoadmap/AsymptoticExpansions/Suggested.lean` lines 4–16 (module docstring: "The statements here suggest Lean forms for particular milestones … discharging all of them finishes neither a milestone nor the roadmap").

Claim: the file is the roadmap's acceptance test, stating the headline theorems statable at the pins and naming in the docstring those that are not.

Witness: Milestone 6 (stationary phase, DLMF 2.3.20–2.3.23) has no declaration in the file, although it is statable with the pinned carriers exactly as 4.2 is: `q : ℝ → ℂ`, the improper integral as `Tendsto (fun T => ∫ t in (0:ℝ)..T, cexp (x * t * I) * q t) atTop (𝓝 (F x))` and `HasAsymptoticExpansion atTop (fun s (x : ℝ) => (x : ℂ) ^ (-α s)) (fun s => cexp (π * I * α s / 2) * Gamma (α s) * c s) F`. The Abel–Plana formula (13.2) is likewise statable with `bernoulli`, `Complex.im` and `Real.exp`, and absent. The docstring names no theorem as not statable; it says the file "is not exhaustive". Watson's lemma, Laplace's method, stationary phase and Euler–Maclaurin are the four named methods of the summary (README lines 6–7 and 12–14), and one of the four is missing.

Repair: state the Fourier analogue of Watson's lemma (6.1) and the endpoint stationary-phase expansion (6.2), and the Abel–Plana identity (13.2), each with `sorry`; or, for any headline the author judges not statable at the pins, name it in the module docstring with the carrier it lacks. Rewrite the docstring in the acceptance-test form (the roadmap is `README.md`; this file states the headline theorems against the pinned APIs; the non-statable ones are listed).

## R03 (P3) — Gate: TeX-only syntax outside code spans and pull-request numbers

Location: `TauCetiRoadmap/AsymptoticExpansions/README.md` lines 853–854 and 973–974 (gate `tex` = 9); line 246 (gate `prnum` = 1) and lines 135, 159, 163, 165–166 (the same rule).

Claim: house style admits no `^{`, `_{`, `∑_{…}` outside code spans and no pull-request numbers.

Witness: the code span opened on line 853 (`` `a_{s,1} − Λ₁ (λ₁ − λ₂)^{−s} ∑_{j<J} … ``) closes on line 854, and the scanner reads code spans one line at a time, so both lines count as bare TeX; the same for the Abel–Plana display at lines 973–974. Line 246 reads "(the shape of Mathlib #40582)"; lines 135, 159, 163, 165–166 cite Mathlib pull requests #40582, #28291, #39429, #40572, #44746 by number.

Repair: put each of the two displays in an indented code block (one block per display); refer to the Mathlib work by name ("Mathlib's open Laplace-transform pull request", "the `compute_asymptotics` multiseries", "a closed first-order Euler–Maclaurin attempt") without numbers.

## R04 (P3) — Gate: the build emits Lake's module-system warning

Location: `TauCetiRoadmap/AsymptoticExpansions/Suggested.lean` lines 1–2.

Claim: the targeted build is clean except for `sorry`.

Witness: the worker's gate reports `build=2 FAIL` with "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`" (twice). At the pinned Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` both packages are module-system packages.

Repair: begin the file with `module`, a blank line, `public import Mathlib`, `public import TauCeti.Analysis.Contour.Residue.Basic`, the module docstring, then `@[expose] public section` before `noncomputable section`. (`module` alone makes every declaration private to importers.)

## R05 (P3) — README shape and timeless style

Location: `TauCetiRoadmap/AsymptoticExpansions/README.md` lines 1, 30–38, 40, 96, 135–136, 157–167, 179–188, 232, 262, 1021–1024.

Claim: the README follows the roadmap shape (`# Roadmap: …` with a `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k` with `### k.n` prose subsections each ending in `### Examples` and `### Dependencies`, `**Checks.**` lists per definition, `## Downstream consumers`, `## References`) and reads the same a year from now.

Witness: the headings are `## Scope and completion criterion`, `## Ownership and dependencies`, `## Mathlib and Tau Ceti inventory`, `## Prior formalization`, `## Milestone k` with numbered items; there is no supplier-contract section, no `### Examples`/`### Dependencies`, no `## Downstream consumers` (the consumers named at lines 112–118 are described as "the special-function roadmaps"), and no `**Checks.**` list for `reversionCoeff` (line 360), the ray integrals `J_θ` (line 433), `oscTail` (line 677), `mellinContAtZero`/`mellinContAtTop` (lines 654–666), `F_s`/`G_N` (line 567) or the Laurent coefficient `f_n` (line 1004); `formalCpow` and `laplaceCoeff` have their 2.3.17 checks. Process narrative: "open when checked on 2026-11-06" (136), "Inventory of pull-request states checked on 2026-11-06" (167), "Reused code carries attribution under the repository's porting guidance … (checked at commit `451f12a`)" (187–188), "do not implement" and "Contributors should not attempt it" (1021, 1024), and the file plan at lines 30–38.

Repair: rename the sections to the shape above and renumber `Milestone k` as `Layer k` with `### k.n` subsections (the target ids `4.2`, `8.6`, … then survive as citations); add `### Examples` and `### Dependencies` per layer (the existing `*Needs:*` lines become the dependencies); give each definition named above three discriminating `**Checks.**` bullets (for `reversionCoeff`: `F₀ = f₀`, `F₁ = f₁`, `F₂ = f₂ + f₀f₁` from the two-term witness below; for `oscTail`: the value at `w = 1` is `−e^{iκ}/(iκ)`, the sign flips with `κ`, and `Re w < 1` is needed for the improper integral; for `mellinContAtZero`: agreement with `mellin` on the common strip, the pole at `−α₀` with residue `a₀`, and the `n`-independence failing at `z = −α_k`); delete the dated inventory sentences and the "do not implement" instructions (the boundary section stays, as a list of deferrals with owners); move the file plan to a one-line suggested-home remark or drop it.

## R06 (P3) — Padding in `Suggested.lean`

Location: `TauCetiRoadmap/AsymptoticExpansions/Suggested.lean` lines 48, 54, 62, 75, 268, 274, 278, 283.

Claim: the file states only headline theorems and the definitions they need.

Witness (one-tactic probe on a scratch copy, elaborated with `lake env lean`, exit 0): `HasAsymptoticExpansion.add` closes with `fun N => by simpa [Finset.sum_add_distrib, smul_add, add_sub_add_comm] using (hf N).add (hg N)`; `HasAsymptoticExpansion.isLittleO` closes with `(hf (N + 1)).trans_isLittleO (hphi N)`. `isAsymptoticScale_inv_pow`, `hasAsymptoticExpansion_of_hasSum`, `integrableOn_bleisteinF`, `bleisteinG_nonneg`, `abs_bleisteinF_le` and `continuous_bleisteinF_bleisteinG` are API or boundary lemmas about a kept definition (nonnegativity of an integral of a nonnegative integrand, `|∫| ≤ ∫|·|`, continuity in a parameter).

Repair: delete these eight declarations from `Suggested.lean`; the README keeps them as API bullets of 1.1, 1.3 and 7.2. Keep `HasAsymptoticExpansion.unique` only if the author counts uniqueness as a headline of Milestone 1 (it is not one tactic); otherwise delete it too.

## R07 (P3) — The inventory omits Tau Ceti's Laplace-transform file at the pin

Location: `TauCetiRoadmap/AsymptoticExpansions/README.md` lines 135–139 and 169–176 (inventory), Milestone 4.4 (line 447).

Claim: "Mathlib pull request … defines `laplace f s` … The milestones write Laplace integrals out in exactly this shape"; Tau Ceti's inventory lists only `TauCeti/Analysis/Asymptotics/` and `TauCeti/Analysis/ODE/`.

Witness: at the pinned Tau Ceti `2fd255d9`, `TauCeti/Analysis/Complex/LaplaceTransform.lean` declares `TauCeti.differentiable_intervalIntegral_mul_cexp_neg_mul` (line 46: the truncated transform `z ↦ ∫ t in a..b, f t * cexp (-z * t)` is entire for interval-integrable `f`), `TauCeti.integrableOn_mul_cexp_neg_mul` (line 119) and `TauCeti.differentiableOn_integral_mul_cexp_neg_mul` (line 168: holomorphy on `0 < Re z` for a bounded measurable kernel on `[0, ∞)`). Milestone 4.4's "`Q` … holomorphic on `Re z > c`" is this theorem for bounded `q` after the shift `q ↦ e^{−ct} q`; the integrand order `f t * cexp (-z * t)` is the native one.

Repair: cite the three declarations in the Tau Ceti inventory and in 4.4's `*Needs:*` line, say that they cover bounded kernels and that 4.4 extends them to `e^{−ct} q` integrable; consider writing the Laplace integrals in the native order `q t * cexp (-(z * t))` so the extension is a rewrite.

## R08 (P3) — Lean declarations the README never names

Location: `TauCetiRoadmap/AsymptoticExpansions/Suggested.lean` lines 169, 173, 260, 264, 562 (`rayLaplace`, `rayLaplaceDomain`, `bleisteinF`, `bleisteinG`, `laurentCoeff`) and every theorem of the file.

Claim: README and Lean agree: every Lean name appears in the README.

Witness: a grep of the README for each of the 55 declared names finds `IsAsymptoticScale`, `HasAsymptoticExpansion`, `formalCpow`, `laplaceCoeff`, `reversionCoeff`, `mellinContAtZero`, `mellinContAtTop`, `mellinContOscTop` and `oscTail` only; the five definitions above are written in the README as `J_θ`, `S_θ`, `F_s`, `G_N` and `f_n` (lines 433, 567, 1004) without their Lean names, and no theorem name occurs (the README's 4.3 says "Prove: each `J_θ` is holomorphic" where the Lean states `rayLaplace_differentiableOn_and_eqOn`).

Repair: name each kept definition in its README sentence (`J_θ(ζ) = rayLaplace q θ ζ` on `rayLaplaceDomain σ θ`, `F_s = bleisteinF λ s`, `G_N = bleisteinG λ N`, `f_n = laurentCoeff f ρ n`), and give each headline theorem that stays in `Suggested.lean` its backticked name at the README claim it states, so that the gate's name check covers both directions.

## Verified sound

**Gate and dependencies.** `gate --depcheck … --movable`: `depcheck: 240 roadmaps, 2358 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. The worker's gate at 9824db0: every scanner 0 except `tex=9`, `prnum=1`, `build=2` (R03, R04). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AsymptoticExpansions'` is empty: no change outside the folder. Manifest pins Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`.

**Suppliers resolved.** ZerosOfLFunctions on main: `### 1.2 Stirling on the sector` (README line 459, `logGamma δ s = (s − 1/2) Complex.log s − s + Real.log (2π)/2 + O(1/‖s‖)` on `S_δ`, DLMF 5.11.1) and `### 1.3 Vertical strips` (line 469, `log ‖Γ(σ + it)‖ = (σ − 1/2) log |t| − π|t|/2 + log(2π)/2 + O(1/|t|)` uniformly for `σ ∈ [a, b]`, DLMF 5.11.9): both anchors exist and say what this README consumes. ContourIntegration is in `Completed/`; `TauCeti.Contour.residue` at the pin (`TauCeti/Analysis/Contour/Residue/Basic.lean` line 80) is the coefficient of `(z − z₀)⁻¹` of the Laurent expansion, `0` where `f` is analytic or not meromorphic, so `F t = g t / (t − p)` with `g` analytic gives residue `g p` as 8.2 needs. The import `TauCeti.Analysis.Contour.Residue.Basic` exists at the pin.

**Library declarations opened at the pins** (file, all present): `mellinInv_mellin_eq` (`Mathlib/Analysis/MellinInversion.lean` line 92, hypotheses `MellinConvergent f σ`, `VerticalIntegrable (mellin f) σ`, `ContinuousAt f x`, `0 < x`, as 8.1 says); `Complex.VerticalIntegrable` (`MellinTransform.lean` line 86); `PowerSeries.substInvOfIsUnit` (`RingTheory/PowerSeries/Substitution.lean` line 567, takes the `IsUnit` proof as in `hasAsymptoticExpansion_pow_substInv`); `PowerSeries.binomialSeries A r = mk fun n => Ring.choose r n • 1` (`RingTheory/PowerSeries/Binomial.lean` line 47, so `formalCpow` is `(1 + X)^r` scaled); `HasFPowerSeriesAt.isBigO_sub_partialSum_pow`, `tendsto_integral_exp_inner_smul_cocompact`, `Finset.sum_range_by_parts`, `hasDerivAt_bernoulliFun`, `bernoulliFun_eq_integral`, `Real.tendsto_harmonic_sub_log`, `norm_le_gronwallBound_of_norm_deriv_right_le`, `Complex.integral_cpow_mul_exp_neg_mul_Ioi`, `integral_rpow_mul_exp_neg_mul_Ioi`, `mellin_differentiableAt_of_isBigO_rpow`, `Complex.GammaIntegral_eq_mellin`, `HasStrictFDerivAt.implicitFunction`, `HasStrictDerivAt.to_localInverse`, `Stirling.factorial_isEquivalent_stirling`, `periodizedBernoulli`, `Complex.digamma`, `riemannZeta_one_sub`, `Real.eulerMascheroniConstant`, `Complex.betaIntegral`, `ODE_solution_unique`, `IsPicardLindelof`, `Set.ofPred`, `Real.sign`, `Ring.choose`; Tau Ceti `TauCeti.wronskian_eq_of_hasDerivAt` (`Analysis/ODE/Wronskian.lean` line 31) and `TauCeti.IsFrobeniusIntegrableAt` (`Analysis/ODE/Frobenius.lean`). Mathlib at the pin has no `IsAsymptoticScale`, `HasAsymptoticExpansion`, `IsOfAsymptoticClassAt`, `LaplaceConvergent` or Euler–Maclaurin declaration (grep of `Mathlib/`), as the inventory says; the two names the citation scanner flagged are this roadmap's own definitions.

**Signatures.** All 55 elaborated types in the worker's `signatures.md` were compared with the README: no section binder lost; `ContDiffOn ℝ (↑⊤)` in `exists_caseI_solution` is `C^∞` (the `∞` of `ContDiff` scope), as 11.4 says; `IsAsymptoticScale`/`HasAsymptoticExpansion` carry `[NormedField 𝕜] [NormedAddCommGroup E] [NormedSpace 𝕜 E]` as pinned.

**Ownership against open pull requests.** `roadmaps grep` over the 466 open heads and main for Euler–Maclaurin, Abel–Plana, Watson's lemma, Laplace's method, stationary phase, Liouville–Green, Borel–Ritt, Darboux's method, Cahen–Mellin, asymptotic scale: no second owner except SpecialFunctionsParabolicCylinder (R01); the "Darboux" hits are the symplectic theorem and the Darboux–Picard boundary theorem of ConformalMapping, unrelated; ZerosOfLFunctions names Euler–Maclaurin only as a route for its 1.2. Mathlib's `Finset.sum_range_by_parts` is cited, not restated (13.4).

**Seeded sample.** "What this roadmap owns" (README lines 68–82): each of the nine auxiliary results was checked against the pins (none of the Gamma integral with complex rate, `formalCpow`, the continued Mellin transforms, DLMF 2.6.4, the Volterra theorem, the pole-separated Gamma bound and the Cahen–Mellin integral exists in Mathlib or Tau Ceti at the pins; `Complex.integral_cpow_mul_exp_neg_mul_Ioi` has real rate only; `Complex.betaIntegral` is the `(0,1)` form, not 2.6.4). "What it does not own" and "The boundary in one sentence" (lines 84–147): the two suppliers exist as cited; the excluded §2.11 and uniform-expansion material is not planned anywhere in the folder.

**Locators read in the DLMF text** (fetched through the sources service, `dlmf22`, `dlmf23`, `dlmf24`, `dlmf25`, `dlmf26`, `dlmf27`, `dlmf29`): 2.2.7–2.2.8 (`dlmf22` lines 222, 249, 272–273: `F₀ = f₀`, `s F_s` the coefficient of `x⁻¹` in `f(x)^s`); 2.3.7 and the hypotheses (a)–(c) of §2.3(iii) (`dlmf23` lines 318–330, 626–676: `p′`, `q` continuous near `a`, minimum approached only at `a`, differentiable expansion of `p`, `p₀ > 0`, absolute convergence); 2.3.17 (`dlmf23` lines 747–754); 2.3.18 (line 781); 2.3.24–2.3.33 (lines 1110–1117, 1127, 1155–1159, 1182, 1202–1207, 1236, 1269, 1299, 1328, 1360: `F_s(y) = ∫₀^∞ exp(−½τ² + yτ)(τ − y)^s τ^{λ−1} dτ`, 2.3.32 with `x^{−λ/2}` and `F_s(a√x) x^{−s/2}`); §2.3(iv) conditions (a)–(d) and 2.3.23 (lines 930–1048); 2.4.2–2.4.5 (`dlmf24` lines 153–260: `c > 0`, `Re λ > 0`, `μ > 0`, expansion in `Re z ≥ c` and differentiable); 2.4.17–2.4.20 (lines 788–892: `p = w³/3 + a w² + b w + c`); 2.5.6–2.5.7, 2.5.17–2.5.18, 2.5.25–2.5.28 (`dlmf25` lines 272, 314, 685, 715, 975, 998, 1036, 1062); 2.6.17–2.6.30 (`dlmf26` lines 635–1049: `c_s = (−1)^s 𝓜f(s)/(s−1)!`, 2.6.27 `−∑_{s=1}^n (s−1)! c_s z^{−s}`, 2.6.30); 2.7.5, 2.7.10–2.7.18 (`dlmf27` lines 220, 418, 444, 475, 507, 545, 579, 607, 642–645, 679–682: the recursion, `μ_j`, the normalization `((λ₂ − λ₁) z)^{μ_j}`, the sectors `−3π/2 + δ … 3π/2 − δ` and `−π/2 + δ … 5π/2 − δ`, the connection formulas, `Λ₁ = −i e^{(μ₂−μ₁)πi} C₁/(2π)`, `Λ₂ = i C₂/(2π)`); 2.9.5–2.9.8 (`dlmf29` lines 204, 228, 253, 286). Every one supports the README statement as written.

**Adversarial table.** One row per declaration or sampled target; values on each side.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `HasAsymptoticExpansion.unique` | `N = 1`, scale, `∃ᶠ φ₀ ≠ 0` | `φ₀(a₀ − b₀) = O(φ₁) = o(φ₀)` ⇒ `‖a₀ − b₀‖ ≤ ε` on a frequent set ⇒ `a₀ = b₀`; `l = ⊥` excluded by `hne` | true | none |
| `isLittleO` | `N` | `f − S_{N+1} = O(φ_{N+1}) = o(φ_N)` | true, one term | R06 |
| `isAsymptoticScale_inv_pow` | `X` bounded; `X = ℂ` | filter `⊥`: vacuous; `z^{−n−1}/z^{−n} = 1/z → 0` | true | R06 |
| `hasAsymptoticExpansion_inv_pow_iff` | `X` unbounded, both directions | ⇐: `f − S_n = z^{−n}(a_n + o(1))`; ⇒: `z^n(f − S_n) − a_n = z^n(f − S_{n+1}) = O(z^{−1})` | true | none |
| `hasAsymptoticExpansion_of_hasSum` | `R < 0` | `z = 0`: `(0^0)⁻¹ a₀ = a₀`, higher terms `0⁻¹ = 0`: `f 0 = a₀`, harmless; tail `O(w^N)` on `|w| ≤ 1/(2R)` | true | R06 |
| `pow_mul`, `pow_inv` | `P = 1 + X`, `Q = 1 − X` | `(1 − w²)` vs `f g`; `f → p₀ ≠ 0` so `f⁻¹` is the true inverse eventually | true | none |
| `pow_subst` | `Q = X`, `y = id` | `P.subst X = P`; `σ∘y = O(w)` from `Q(0) = 0` and `hw` | true | none |
| `pow_substInv` | `P = X + X²`, `w = H∘y` | `σ = O(w)`, `w = O(σ)`; `R_N(P_N(σ) + O(σ^N)) = σ + O(σ^N)`; branch fixed by `Tendsto y l m` | true | none |
| Ritt `isBigO_deriv…` | `θ' < 0`; `θ = π`; `θ' = θ − ε` | empty sector: vacuous; disc radius `c|z|` with `c < sin ε` avoids the cut; Cauchy estimate `|f′| ≤ C|z|^ν/(c|z|)` | true | none |
| Borel–Ritt `exists_…sector` | boundary rays `|arg z| = θ` | `f` chosen holomorphic on opening `θ + ε < π`, so the closed-sector expansion includes the rays | true | none |
| `reversionCoeff`, 2.2.8 | `f = x + f₀ + f₁/x` | direct: `x = y − f₀ − f₁/y − f₀f₁/y² + …`; formula: `F₁ = [X²](1 + f₀X + f₁X²) = f₁`, `2F₂ = [X³](…)² = 2f₂ + 2f₀f₁` ⇒ `F₂ = f₀f₁` at `f₂ = 0` | agree | none |
| `hasAsymptoticExpansion_reversion` | `f` not continuous near `a` | `f = 1/(x − a)` on `(a, x₀)`: root `x(y) → a`, `y − x(y) ∼ y`: false without `hcont`; `hmono` unused (the root is given by `hx`, `x(y) → ∞` by continuity) | true; note | none (P3 note) |
| 4.1 Gamma integral | `s = 1`, `z = 1 + i` | `∫ e^{−(1+i)t} = 1/(1+i) = Γ(1)(1+i)^{−1}` | agree | none |
| Watson sector 4.2 | `δ > π/2`; `α_s = s + 1`, `q = 1` | sector empty: vacuous; `∫e^{−zt} = 1/z = Γ(1) z^{−1}`, `Re z ≥ |z| sin δ > σ` eventually | true | none |
| `rayLaplace`, gluing | `q = t^{−1/2}`, `θ = ±3π/4`, `z = −R` | `I_θ(−R) = ±i√(π/R)`: rays `3π/2` apart disagree in `z`; in `ζ` each `S_θ` has width `π` in `Im ζ`, union `(−α₂ − π/2, −α₁ + π/2)` of width `< 2π` | matches README | none |
| `hasAsymptoticExpansion_rayLaplace` | `q = t^{α−1}`, general `θ` | `J_θ = e^{iθ} e^{iθ(α−1)} Γ(α) e^{−α(ζ+iθ)} = Γ(α) e^{−αζ}` (`|Im ζ + θ| < π/2` keeps the principal log) | agree | none |
| 4.4 inverse Laplace | `Re α_N ≤ 1` | one integration by parts, line `σ = 1/t`: `(1/t) e ∫ |σ + iy|^{−Re α_N − 1} dy = O(t^{Re α_N − 1})`; `Re α_N > 1`: direct `O(σ^{1 − Re α_N})` | true | none |
| `laplaceCoeff`, 2.3.17 | `b₀`, `b₁` | `[X⁰](Q P^{−λ/μ})/μ = q₀ p₀^{−λ/μ}/μ`; `[X¹]/μ = p₀^{−(λ+1)/μ}(q₁/μ − (λ+1)p₁q₀/(μ²p₀))` | agree with `dlmf23` 748, 751 | none |
| `formalCpow` | `r = 1`, `n = 2` | `e^ℓ(1 + R)` with `R = e^{−ℓ}P − 1`, `R(0) = 0`: `binomialSeries` substitution legal; `r = 1` gives `P` | agree | none |
| 5.2 Laplace's method | `p(t) − p(a)` on `(a, a+ε)` vs `[c, ∞)` | `hmin` at `c = a + ε` gives `p > p(a)` on `[a+ε, ∞)`, `hp` gives `p₀(t−a)^μ(1 + o(1)) > 0` near `a`: integrability for all `x ≥ x₀`; `hp'` forces `deriv p ≠ 0` hence differentiability | true | none |
| `bleisteinF`, 2.3.32–33 | substitution `w = τ/√x` | `∫ e^{−x(w²/2 − aw)} (w − a)^s w^{λ−1} dw = x^{−(s+λ)/2} F_s(a√x)` | agree with `dlmf23` 1328, 1360 | none |
| `norm_bleistein_remainder_le` | `N = 0` | `|∫ e^{…} w^{λ−1} f| ≤ C x^{−λ/2} G₀(a√x)` with `G₀ = ∫ e^{−τ²/2 + yτ} τ^{λ−1}` | true | none |
| 7.1 sign of `a` | `α < 0` | DLMF 2.3.26–27: `w(α,0) = a + √(2p(α,0) − 2p(α,α)) = 2a ≠ 0`; README `a = sgn(α)√…`: `w(α,0) = 0` | README right | source issue |
| `exists_cubic_normal_form` | `p = t³/3 + αt²` (`hmix = 0`); `p = t³/3 + α²t` | `(t+α)³/3 − α²(t+α) + 2α³/3`; `w = t`, `ζ = −α²`: the form exists; `w = 0` excluded by `∂_t w ≠ 0` | true (hmix is CFU's hypothesis) | none |
| line shift 8.2 | rectangle `d ≤ Re ≤ c` counterclockwise | `i(∫_c − ∫_d) = 2πi ∑ Res` ⇒ `∫_c − ∫_d = 2π ∑ Res`; `g(p) = 0`: removable, residue `0` | agree | none |
| `mellinContAtZero_spec` | `m > n`, `z = −α_k` with `n ≤ k < m` | `M^m − M^n = ∑_{n≤k<m} a_k[1/(z+α_k) − ∫₀¹ t^{z−1+α_k}] = 0` for `Re z > −Re α_n`; at `z = −α_k` Lean's integral of the divergent integrand is `0`, so the exclusion `∀ k < max n m, z ≠ −α k` is needed | true as stated | none |
| `oscTail` | `κ > 0`; `κ < 0`; `w = 1` | `u = 1 + iy`: `i e^{iκ}∫(1+iy)^{w−1}e^{−κy}`; `u = 1 − iy`: `−i e^{iκ}∫(1−iy)^{w−1}e^{κy}`; `w = 1`: `i e^{iκ}/κ = −e^{iκ}/(iκ)` = `lim ∫₁^T e^{iκu}` (Abel) | agree with `Real.sign` form | none |
| `mellinContOscTop` | substitution `u = t^p` | `∫₁^∞ t^{z−1−β_k} e^{iκt^p} dt = p⁻¹ oscTail κ ((z−β_k)/p)`; absolute convergence of `∫₁^∞ t^{z−1} f` iff `Re z < Re β₀` | true | none |
| `stieltjes_eq` | `n = 1`; `n = 2` | `n=1`: `S = (π/sin πα) a₀ z^{−α} + 𝓜f(1) z^{−1} − z^{−1}∫ τ f₁/(τ+z)` with `𝓜f(1) = ∫₀¹ f − a₀/(1−α) + ∫₁^∞ f₁`; `n=2`: `… − a₁ z^{−1−α}(π/sin πα) + 𝓜f(1)z^{−1} − 𝓜f(2)z^{−2} + z^{−2}∫τ²f₂/(τ+z)`, `𝓜f(2) = ∫₀¹ t f + ∫₁^∞ t f₂ − a₀/(2−α) − a₁/(1−α)` | both agree with the Lean signs and `dlmf26` 948, 1049 | none |
| `exists_volterra_solution` | Picard iterates | `|h_{n+1} − h_n| ≤ P Φ Ψ^n/n!` (Φ decreasing), sum `≤ P Φ e^Ψ`; integrand bounded by `P(x)[Q|J| + Q|ψ| P Φ(x) e^{Ψ(x)}]` | true | none |
| `frobenius_solution` recursion | coefficient of `(z−z₀)^{ρ+s}` | `a_s(ρ+s)(ρ+s−1) + ∑_{r≤s}[f_{s−r}(ρ+r) + g_{s−r}]a_r = 0` ⇒ `ha` | agrees with `dlmf27` 220 | none |
| `exists_rankOne_solution` | README check `f = −1 + 2z⁻²`, `g = −z⁻² − 2z⁻³ + z⁻⁴` | roots `0, 1`; `μ = 0`; `ha` for `λ₁ = 0`: `−s a_s = s(s−1)a_{s−1} − a_{s−1} + (2−2s)a_{s−2} + a_{s−3}` gives `a₁..a₄ = 1, 1/2, 1/6, 1/24`; for `λ₂ = 1` the same values; `e^{1/z}`, `e^{z+1/z}` verified in the equation; `W(ζ) = exp(e^{−ζ})` is `2πi`-periodic so `C₁ = 0` | README check true | none |
| 10.4 equation in `ζ` | `w(z) = W(log z)` | `w″ + f w′ + g w = z^{−2}[W″ + (zf − 1)W′ + z²g W]` | matches | none |
| 10.4 normalization, 2.7.18 | `((λ₂−λ₁)z)^{μ_j}` | DLMF 2.7.14 uses the same factor (`dlmf27` 545), so `C_j`, `Λ_j` are DLMF's | matches | none |
| `liouvilleGreen_recessive` | `f = 1`, `g = 0` | `Φ = 0`, `ε = 0`, `w = e^{−(x−c)}` | true | none |
| `exists_caseI_solution` | `n = 0` | `W = 0` satisfies the equation and `O(1)`, `O(u)`: vacuous but true; content starts at `n = 1` | true | none |
| `exists_difference_solution`, 2.9.6–7 | order `1/n` and `1/n²` of `ρ^{−n}n^{−α}(w(n+2) + f w(n+1) + g w)` | `1/n`: `α(2ρ² + f₀ρ) = −(f₁ρ + g₁)` ⇒ `α = (f₁ρ + g₁)/(f₀ρ + 2g₀)`; `1/n²`: `ρ(f₀+2ρ)a₁ = 4ρ²C(α,2) + ρ(C(α,2)f₀ + αf₁ + f₂) + g₂` = `ha` at `s = 1` | agree with `dlmf29` 228, 253 | none |
| 12 tail form | `f(0) = g(0) = 0`, `f = −3`, `g = 2` for `n ≥ 1` | every solution has `w(2) = 0`; `(1, 0, 0, …)` is a solution: `hgne` needed | README right | none |
| `sum_Icc_eq_eulerMaclaurin` | `f = x²`, `a = 0`, `n = 1`, `m = 1` and `m = 2` | LHS `1`; RHS `1/3 + 1/2 + ∫₀¹(B₂ − B₂(x))dx = 1/3 + 1/2 + 1/6 = 1`; `m = 2`: `1/3 + 1/2 + (1/12)(2 − 0) + 0 = 1` | true | none |
| `tendsto_sum_mul_log_sub` | Glaisher constant | `∫₁ⁿ x log x = n²/2 log n − n²/4 + 1/4`, `B₂/2 (f′(n) − f′(1)) = log n/12`; limit `log A = 1/12 − ζ′(−1)`, real | true | none |
| `laurentCoeff`, Darboux | `n → −∞` | `r^n h_n = (2π)⁻¹∫₀^{2π} h(re^{iθ})e^{−inθ}dθ → 0` both ways by Riemann–Lebesgue; `ρ → r` by uniform continuity on the closed annulus | true | none |
| `exists_norm_Gamma_le` | `x ∈ [u, v]`, `|y| → ∞` | Stirling: `|Γ| ∼ √(2π)|y|^{x−1/2}e^{−π|y|/2}`, so `K ≥ v − 1/2` suffices; bounded `|y|` off poles: compact, continuous | true | none |
| `integral_Gamma_mul_cpow_neg` | `ds = i dy` | `(2πi)⁻¹ i ∫ Γ(c+iy)w^{−c−iy}dy = e^{−w}` ⇒ `2π e^{−w}`; `|w^{−iy}| = e^{y arg w}`, integrable for `|arg w| < π/2` | true | none |
| 13.3 constant | two forms | `(γ + log 2π)/12 − ζ′(2)/(2π²) = 1/12 − ζ′(−1)` (functional equation) | agree | none |

**Checks of the README evaluated against its theorems:** the `e^{1/z}` check of 10.4 against 2.7.12 (`Λ₁ = 0` with a convergent nonterminating series), the sign witness of 4.3, the `(1, 0, 0, …)` witness of Milestone 12, the uniqueness counterexample of 11.2 (`e^{x−c} + C sinh x ∼ e^{x−c}` as `x → 0+`), the `X = {c}` remark of 1.3: all consistent with the theorems they test.

**Not run:** the full `#check @name` sweep was not repeated (the worker's `signatures.md` has all 55 elaborated types; no change to the file was made).

## Not verifiable

- DLMF §2.10 (Euler–Maclaurin 2.10.1, Abel–Plana 2.10.2, the examples 2.10.3–2.10.8, Darboux 2.10.25–2.10.32): every fetch of `https://dlmf.nist.gov/2.10`, `2.10.i`, `2.10.E1`, `2.10.E2`, `2.10.E4` through the sources service resolved to the figure file `2.10.F1.pdf` (one image page, no text), so the section text could not be read through the service. The Euler–Maclaurin signature was checked by computation instead (table).
- DLMF §§2.1 and 2.8 were not fetched (not in the sample).
- Olver, *Asymptotics and Special Functions* (Chapter 6 §10, Chapter 7 §2); Olver 1994 (*Methods Appl. Anal.* 1); Wong and Li 1992; Chester–Friedman–Ursell 1957; Bleistein–Handelsman §4.1; Wong 1989: paywalled books and journals, cited by locator only.

## Source issues

- **Gap** in DLMF at 2.3.26–2.3.27 (§2.3(v)): the source gives `a` as the positive square root and takes the upper sign of 2.3.27 for `t > α`, which puts `w(α, 0) = 2a` when `α < 0`; it should be `a = sgn(α)(2p(α,0) − 2p(α,α))^{1/2}` so that `t = 0` maps to `w = 0`; affects a stated result (the README already states the signed form).
- **Error** in DLMF at §2.7(ii), the sentence after 2.7.13: the source says the formal series 2.7.8 diverge unless they terminate; it should say unless `Λ_j = 0`: for `f = −1 + 2z⁻²`, `g = −z⁻² − 2z⁻³ + z⁻⁴` both normalized series are the convergent nonterminating `∑ z^{−s}/s!` (solutions `e^{1/z}`, `e^{z+1/z}`, `C₁ = C₂ = 0`); affects a stated result (the README already records the correct form).
