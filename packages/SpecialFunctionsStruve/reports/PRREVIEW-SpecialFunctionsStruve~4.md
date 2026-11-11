# Review of SpecialFunctionsStruve (pull request #2129 at 27b55fb)

**Verdict:** needs changes

This is an incremental re-review of the 117 lines changed since `3c308f7` (README and `Suggested.lean`). All three findings of the previous review are repaired, and each repair is mathematically right (computed below). One P3 remains. It was introduced by the repair: the summary now lists 11.11.8 among the corrections and points the reader to a section that does not mention it. The gate passes and the dependency check is clean.

## R01 (P3) — the summary sends the reader to *Prior formalization* for the 11.11.8 correction, which that section does not mention

**Location.** README lines 39–40: "The roadmap states the corrected forms of DLMF 11.4.15, 11.7.12, 11.11.6, 11.11.8 and 11.11.18–11.11.19 (see [Prior formalization](#prior-formalization))."

**Claim.** Each listed correction is documented in *Prior formalization*.

**Witness.** README lines 1129–1131 list "11.4.15, 11.7.12, 11.11.6 and 11.11.18–11.11.19, which its errata note records". 11.11.8 is not among them. Its correction is stated and argued only in 8.3 (lines 986–989, 1016–1025, 1030–1033). The pull-request description also keeps 11.11.8 out of the errata-note list.

**Repair.** Split the pointer: "The roadmap states the corrected forms of DLMF 11.4.15, 11.7.12, 11.11.6 and 11.11.18–11.11.19 (see [Prior formalization](#prior-formalization)) and the corrected sector of 11.11.8 (8.3)." Checked: every number covered by each pointer then appears at its target (line 1130 for the first group, line 986 for 11.11.8).

## Previous findings

- R01 — repaired: README 986–988 "`|ph ν| ≤ π − θ(λ) − δ`, where `θ(λ) = arctan(−μ(λ)/π)` for `0 < λ < 1` and `θ(λ) = 0` for `λ ≥ 1`"; route 1016–1025 rotates up to the branch points `−μ(λ) ± πi`; negative-control Check 1030–1033; Lean 362–363 filter `π - max 0 (Real.arctan …) - δ`.
- R02 — repaired: README 862–863 "for `Re z > 0`, and for `Re z = 0` with `Re ν > 0`, absolutely convergent"; Lean 326 `(hz : 0 < z.re ∨ (z.re = 0 ∧ 0 < ν.re))`.
- R03 — repaired: README 244–246 "`Suggested.lean` copies together with its auxiliary definitions `eulerIntegral` and `IsEulerContinuation`".

## Verified sound

### The repair of the 11.11.8 sector (README 8.3, `isBigO_angerWeberA_scaled`)

- **Source.** DLMF-11.11 lines 349–355 print 11.11.8 for fixed `λ > 0` in `|ph ν| ≤ π − δ`. Lines 388–391 record a 1.1.2 clarification of that constraint, which does not narrow it. Line 580 and the TeX of 11.11.12 give `μ = √(1 − λ²) − ln((1 + √(1 − λ²))/λ)`. Lines 404–408 give `a₀ = 1/(1 + λ)` and `a₁ = −λ/(2(1 + λ)⁴)`, as the README quotes. Release 1.2.8 of 2026-09-15 (lines 934–935) is the release the References cite.
- **The route, recomputed.**
  - For `u = t + λ sinh t`, `du/dt = 0` at `cosh t = −1/λ`.
  - For `0 < λ < 1` this gives `t = arccosh(1/λ) + (2k + 1)πi`, with values `u = −μ + (2k + 1)πi`. The nearest in angle are `−μ ± πi`, at `ph u = ±(π/2 − arctan(−μ/π))`.
  - `−μ > 0` because `artanh s > s` for `s = √(1 − λ²) ∈ (0, 1)`.
  - For `λ ≥ 1`, `t = ±iy + 2πik` with `cos y = −1/λ`, so every critical value is imaginary. For the phase `λ sinh t − t` with `λ > 1`, `cos y = 1/λ` and the values `i(±(λ sin y − y) − 2πk)` are imaginary as well. This matches the README's `u = ±i(λ sin y ± y)` with `cos y = ∓1/λ`.
  - AsymptoticExpansions 4.3 on main (its README line 562) turns holomorphy of `q` in `|ph u| < π/2 − θ` into the expansion in closed substrips of `|Im ζ| < π − θ`. That is exactly `|ph ν| ≤ π − θ − δ`.
- **The growth claim and the edge, computed.** At `λ = 0.1` the edge is at `θ = 0.566511707`, `π − θ = 2.575080946`. The table below gives the remainder after two terms, times `|ν|⁵`, on four rays.
  - The fitted exponential rate is `0.0926` at `ph 2.60` and `−0.0934` at `ph 2.55`.
  - The README's exponent `−μ cos ψ − π|sin ψ|` predicts `0.0928` and `−0.0933`.
  - The edge therefore lies between `2.55` and `2.60`, where the README puts it.
- **Lean.** The elaborated type has the filter `Bornology.cobounded ℂ ⊓ 𝓟 {z | |z.arg| ≤ π - max 0 (Real.arctan ((Real.log ((1 + √(1 - lam ^ 2)) / lam) - √(1 - lam ^ 2)) / π)) - δ}`.
  - For `0 < λ < 1` the `arctan` argument is `−μ(λ)/π > 0`, so the `max` is `θ(λ)`.
  - For `λ ≥ 1` the docstring says the `max` is `0`. A scratch probe proves this without `sorry`, from `Real.sqrt_eq_zero_of_nonpos`, `Real.log_inv` and `Real.arctan_le_zero` (Mathlib `Analysis/SpecialFunctions/Trigonometric/Arctan.lean:243`).
  - README generality (`λ > 0`, `δ > 0`) equals the Lean signature's. Note, not a finding: when `δ ≥ π − θ(λ)` the sector is empty and the statement is vacuous; `hδπ : δ < π` does no harm.

### The repair of 11.10.4 (README 7.1, `angerWeberA_eq_integral`)

- **Source.** DLMF-11.10 line 228: 11.10.4 also holds when `Re z = 0` and `Re ν > 0`. The README and Lean hypotheses now match that.
- **Convergence.** On `Re z = 0` the integrand has modulus `e^{−t Re ν}`, so the integral converges absolutely exactly when `Re ν > 0`, as the README says.
- **Negative control.** At `ν = 0`, `z = 2i` the integrand has modulus `1` and is not integrable, so the Lean right side is `0`. The left side is `𝐀₀(2i) = 0.0362535457 − 0.1710757722i`. The conjunct `0 < ν.re` is therefore needed.
- **Corner `z = 0`** (allowed by the new hypothesis).
  - Mathlib `besselJ a x = (x / 2) ^ a * …` (`Analysis/SpecialFunctions/Bessel.lean:55`) gives `J_ν(0) = 0` for `ν ≠ 0`. With `𝐉_ν(0) = sin(νπ)/(πν)`, the definition gives `1/(πν)` off the integers.
  - At `ν = n ≥ 1` the derivative branch gives `cos(nπ)/n ÷ (π cos nπ) = 1/(πn)`.
  - Both agree with `π⁻¹ ∫₀^∞ e^{−νt} dt`.
- **Signature.** `@angerWeberA_eq_integral : ∀ {ν z : ℂ}, 0 < z.re ∨ z.re = 0 ∧ 0 < ν.re → angerWeberA ν z = (↑π)⁻¹ * ∫ (t : ℝ) in Ioi 0, cexp (-ν * ↑t - z * ↑(Real.sinh t))`. `ν` became implicit; it is determined by `hz`.

### The README names of the copies, and the moved definitions

- SpecialFunctionsHypergeometric on main (`e66bb0c`) names `eulerIntegral` and `IsEulerContinuation` as its auxiliary definitions (its README lines 181, 184) and declares them (`Suggested.lean` lines 51, 57). The contract at README 244–246 now names both.
- The diff moves the three copies below `fresnelS` with identical bodies.
- A constant probe shows that the now unqualified `gaussHypergeometric` in `lommelCapitalS_eq_laplace` elaborates to `TauCetiRoadmap.SpecialFunctionsStruve.Complex.gaussHypergeometric`. The pinned Mathlib and Tau Ceti have no declaration of that name (grep of both trees: 0 hits).

### Gate, elaboration, dependency check

- **Gate.** The worker's gate is OK. My bare rerun reports `depcheck=1`, "NOT IN ORDER", because the configured order does not list this new roadmap yet. That is not a finding. Rerun with the candidate merge order and `--build`: every scanner `0`, `build=0`, `OK`. Nothing changed outside the folder (`git diff --stat origin/main...HEAD` outside it: empty).
- **Dependency check** (the brief's command): `depcheck: 237 roadmaps, 2140 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives 26 `declaration uses sorry` warnings and the 13 pinned `#check` outputs, nothing else.
- **Signatures.** I ran `#check @` on `angerWeberA_eq_integral`, `isBigO_angerWeberA_scaled`, `lommelCapitalS_eq_laplace`, `eulerIntegral`, `IsEulerContinuation` and `gaussHypergeometric` in one scratch file. Each agrees with its README statement. The file has no `variable` block, so no binder is lost.
- **Padding probe** on the two changed theorems: `first | rfl | (simp; done) | (simp [angerWeberA, angerJ]; done) | (norm_num; done) | sorry`, and the same with `angerScaledCoeff`, leave both open (28 = 26 + 2 `sorry` warnings).

### Citations, overlaps, ownership

- **AsymptoticExpansions.** The rewritten route cites AsymptoticExpansions 4.3 (rotation of the path) and 5.5 (saddle points). Both are on main at README lines 562 and 717 there. The open revision of AsymptoticExpansions (#2113, head `3d73056`) keeps §§4.2, 4.3, 5.4, 5.5 (its lines 553, 563, 700, 718).
- **Overlaps.** `overlaps.md` lists no open pull request that changes this roadmap and no dropped id. `roadmaps grep 'angerWeberA|Anger–Weber|Anger-Weber'` finds only this roadmap. The pinned trees have no Anger, Weber or Struve declaration.
- **Remark on untouched text, no change asked.** The nine names of `citations.md` lie in text this diff leaves alone; the earlier reviews resolved them as suppliers' intended names.

### The pull request's text

Read against this head, each of these holds:

- "imports only Mathlib and Tau Ceti's `RegularizedHypergeometric`" (lines 3–4);
- the local copies "(`Y_ν`, `I_ν`, `Hi`, the Fresnel integrals and the Gauss function `F`)" (lines 73–115);
- "26 headlines" (26 `sorry` warnings);
- the errata-note list, and the paragraph on 11.11.8's sector, which matches README 986–988 and Lean 362–363.

The change since `3c308f7` removes no section, declaration or supplier, so the description needs no change. R01 concerns the README only.

### Adversarial table

"This review" rows were computed now. The 11.11.8 and 11.10.4 values come from the definitions in double precision (Simpson for 11.10.1, series for `J_ν`, Stirling for `1/Γ`). mpmath at 40 digits gives the same values to 11–12 digits. Every other row is carried from the review at `3c308f7`, whose statements this diff leaves untouched.

| Statement | Instances and values | Result | Computed in |
|---|---|---|---|
| `isBigO_angerWeberA_scaled` (corrected sector) | `λ = 0.1`: `θ = 0.566511707`, edge `2.575080946`. Remainder after 2 terms × `|ν|⁵` at `|ν| = 20, 40, 60, 100`: `ph 2.50`: `2155, 182.6, 4.245, 0.0138`; `ph 2.55`: `8.9×10⁴, 3.1×10⁵, 3.0×10⁵, 7.0×10⁴` (rate `−0.0934`, predicted `−0.0933`); `ph 2.60`: `3.7×10⁶, 5.3×10⁸, 2.1×10¹⁰, 8.6×10¹²` (rate `0.0926`, predicted `0.0928`); `ph 2.65`: `1.5×10⁸ … 1.0×10²¹`. For `λ ≥ 1` the `max` is `0` (proved in a probe) | holds inside, fails outside; edge where stated | this review |
| 8.3 negative-control Check | `ν = 20e^{2.9i}`: `𝐀_ν(λν) = 896408725.09 − 3678483556.96i`, modulus `3.786131×10⁹`, leading term modulus `0.0144686`; `ν = 20e^{2.4i}`: `−0.010671051812 − 0.009770603238i`, modulus `0.0144684496` vs leading `−0.010669078 − 0.009773028i` | as README | this review |
| `angerWeberA_eq_integral` (extended) | definition vs integral: `(0.7, 2i)`: `0.0680813747607 − 0.1305948462193i` both; `(1, −1.5i)` (integer branch): `0.1044051260 + 0.1239113118i` vs `0.1044051261 + 0.1239113116i`; `(0.3+2i, −3i)`: `0.1441536429 + 0.1710234435i` both; `(2, 1.5i)` (integer branch): `0.0971586577 − 0.0699260073i` vs `0.0971586578 − 0.0699260072i`; `(0.05, 4i)`: `0.0047459429 − 0.0851426084i` both; control `Re z > 0`, `(20e^{i}, 2e^{i})`: `0.0078201250932 − 0.0121745503282i` both; `z = 0`: `1/(πν)` both; negative control `(0, 2i)`: `0.0362535457 − 0.1710757722i` vs Lean integral `0` | holds; hypothesis needed | this review |
| `eulerIntegral`, `gaussHypergeometric` (moved unchanged) | `F(½, 0.2; ½; −t²)` vs `(1 + t²)^{−0.2}` at `t = 0.5, 1.7, 6`: `0.95635241` vs `0.95635250`, `0.76209661` vs `0.76209670`, `0.48569046` vs `0.48569055`; `₂F₁` series at `(0.45 − 0.05i, 0.25 − 0.05i, ½, −0.49)`: `0.9153417097 + 0.0253070884i` vs `0.9153417082 + 0.0253070881i` | the copy is `F` | carried (3c308f7) |
| `IsEulerContinuation` (moved unchanged) | satisfied by `𝐅`; fails for `Γ(c)𝐅` (off by `√π`) and for `0` | determines `𝐅` | carried (3c308f7) |
| `lommelCapitalS_eq_laplace` (qualification dropped) | `(0.3+0.1i, 0.2, 1.5+0.5i)`: `0.6510757496 − 0.0810950060i` vs `0.6510757507 − 0.0810950058i`; `(0.3, 0.3, 1.2+0.4i)`: `0.7595545816 − 0.1452847805i` vs `0.7595545050 − 0.1452847628i`; the constant is the local copy (this review) | holds | carried (3c308f7) |
| 1.1 Checks | `𝐇₀(1) = 0.56865662705`, `𝐋₀(1) = 0.71024318594`, `𝐇₁(1) = 0.1984573362`, `𝐇_{0.3}(2+i) = 1.0479605148 + 0.22137059751i`, `𝐊₀(1) = 0.48039966283`, `𝐌₀(1) = −0.55582269181` | as README | carried (3c308f7) |
| `𝐋_ν = −ie^{−iνπ/2}𝐇_ν(iz)` | `ν = 0.3`, `z = 0.7+0.4i`: both `0.28667885554 + 0.25469099348i` | holds | carried (3c308f7) |
| `struveH_ode` | `(0.3+0.2i, −1+0.5i)`: both `−0.10284272 − 0.43376522i`; `(−3/2, 2−i)`: `1.1×10⁻⁹` vs `0`; `(2, −2+0.1i)`: both `−0.42441318 + 0.02122066i` | holds | carried (3c308f7) |
| `struveH_half`, 2.1 Checks | `z = 1, −1+0.5i, 0.3−2i`: `0.36678569278`, `−0.25428467184 − 0.36298315905i`, `−0.71046158836 − 1.4054502011i` both sides | holds | carried (3c308f7) |
| `struveH_relative_bound` | `ν = 0`, `z = 1`, `d = 3/2`: `|ϑ| = 0.1067562590 < 0.1209069419`; printed 11.4.15 fails at `ν = 1000` (`1.02944 > 0.66667`), corrected bound `1.14552` | correction right | carried (3c308f7) |
| `struveH_recurrence` | `(0.3+0.2i, −1+0.5i)`: both `0.29582727708 + 0.37707989822i`; `(−3/2, 2+i)`: both `0.87935131088 − 0.1815546866i`; `(0, 1)`: both `2/π` | holds | carried (3c308f7) |
| `struveH_eq_integral` | `(0.3, −1+0.5i)`: both `−0.4817337314 − 0.2231595208i`; `(−0.3+i, 2+i)`: both `0.7318264102 + 0.3363024547i` | holds | carried (3c308f7) |
| `struveK_eq_integral` | `(−1, 1)`: both `−0.34305038513`; `(−2.5+i, 1+2i)`: both `−0.53221748841 − 0.3828890287i` | holds | carried (3c308f7) |
| `struveH_mellinBarnes` | `(3, 1.2, −0.4)`: `−0.57785365i` vs `−0.57785366i` | holds | carried (3c308f7) |
| `isBigO_struveK_sub_sum` | `𝐊₀(10) = 0.0630725164` between `0.0630253575` and `0.0630826532` | holds | carried (3c308f7) |
| `struveScaledCoeff` vs 11.6.8 | `λ = 2`: `1, 1/2, 1/4, 1/16, −7/128` both; `λ = 3/7`: equal | equals 11.6.8 | carried (3c308f7) |
| `isBigO_struveK_scaled` | `λ = 2`, remainder over next term at `ν = 60`: `1.017, 1.012, 0.932`; `ν = 60e^{i}`: `1.0089−0.0142i, 1.0072−0.0098i, 0.973+0.057i` | holds | carried (3c308f7) |
| `struveL_isEquivalent_besselI` | `λ = 2`: `0.99986533, 0.99999995, 1.0000000` at `ν = 10, 20, 40`; `λ = ½`: `0.9535 − 0.2231i`, `1.0695 − 0.0590i` at `20e^{−i}, 40e^{−i}` | tends to `1` | carried (3c308f7) |
| `hasDerivAt_besselJ_struveH` | `(0.3+0.2i, −1+0.5i)`: both `−0.0586268365 + 0.300173363i`; `(1.5, 2+i)`: both `1.29162197 + 1.82740036i` | holds | carried (3c308f7) |
| `integral_struveH_mul_struveH` | `μ = ν = ½`: both sides `1` | holds | carried (3c308f7) |
| `differentiable_lommelCapitalS` | `S_{−1+h,0}(1)`, `h = ±10⁻³, 10⁻³i`: `0.442493161`, `0.441979872`, `0.442236388 + 0.000256649i` around `0.442236452` | removable | carried (3c308f7) |
| `lommelCapitalS_ode` | `(0.5+0.3i, 0.2, 1.3+0.4i)`: both `0.7827281 − 0.0446416i`; `(−1, 0, 1.2+0.3i)`: both `0.5767012687 − 0.3075740099i` | holds | carried (3c308f7) |
| `isBigO_lommelCapitalS_sub_sum` | remainder over next term, `z = 40e^{0.6i}`, `(0.3+0.1i, 0.2)`: `0.9986, 0.9953, 0.9897` | holds | carried (3c308f7) |
| 7.1 Checks | `𝐉_{1/2}(1) = 0.85516530968`, `𝐄_{1/2}(1) = 0.09950754264`, `𝐀_{1/2}(1) = 0.18376860254`, `𝐀₀(1) = 0.24019983142`, `𝐀₁(1) = 0.14678469362` | as README | carried (3c308f7) |
| `differentiable_angerWeberA` | `𝐀_{1∓10⁻⁶}(1) = 0.14678475461, 0.1467846332` around `0.14678469362` | glues | carried (3c308f7) |
| `angerJ_eq_besselJ_add` | `𝐉₂(1.3) = J₂(1.3) = 0.18302669877`; `ν = 0.3+0.5i`: both `0.49000880214 − 0.52176518596i` | holds | carried (3c308f7) |
| `angerJ_neg_half` | `z = 1`: `0.09950754264`; `−1+0.5i`: `0.9151680458 + 0.0057784949i`; both sides | holds | carried (3c308f7) |
| 8.1 (11.11.4) | `ν = 0.3+0.2i`, `z = 40e^{0.8i}`, remainder over next term: `0.963+0.010i`, `1.014−0.140i`, `0.934+0.021i` | holds | carried (3c308f7) |
| `isBigO_weberE_large_order` | error × `|ν|²/e^{π|Im ν|}`: `0.2385, 0.514, 0.2464`; DLMF's form at `½+10i`: `1.05×10¹³` | corrected form bounded | carried (3c308f7) |
| `angerScaledCoeff` vs 11.11.9 | exact rationals `k ≤ 3` at `λ = 7/10, 2, 1/3`: equal | equals 11.11.9 | carried (3c308f7) |
| `isBigO_angerWeberA_transition` | error × `|ν|` at `|ν| = 100, 400, 1600`, `a = 1+i`: `0.0399, 0.0405, 0.0407`; `a = −2`: `24.9, 23.0, 22.4` | bounded | carried (3c308f7) |
| `angerJ_self_isEquivalent` | `ν = 100`: ratio `0.999971` | holds for real `ν` | carried (3c308f7) |

## Not verifiable

- **Secondary sources for 11.11.8.** DLMF's sources for 11.11.8 include Nemes (2014b, 2014c). I read Part I (arXiv `1311.2522v2`, fetched through the sources service) only for its scope: Nemes2014b lines 17–19 say it treats `𝐀_{−ν}(νx)` with `x ≥ 1`, which is not 11.11.8's `𝐀_ν(λν)`. Part II, Watson 1944 and Olver 1974/1997 were not fetched. The corrected sector rests on the route and the computations above, not on them.
- **Untouched seeded targets.** The seeded sample falls on changed text only in 7.1 (11.10.4, checked against DLMF-11.10 line 228) and 8.3 (11.11.8 and 11.11.12, checked against DLMF-11.11 lines 349–355, 404–408, 580). The other sampled sections are untouched and were compared with DLMF in the earlier reviews.

## Source issues

- **Error** in DLMF-11.11 at 11.11.8, §11.11(iii) (DLMF-11.11 line 355): the source says the expansion of `𝐀_ν(λν)` holds for every fixed `λ > 0` in `|ph ν| ≤ π − δ`; it should be `|ph ν| ≤ π − arctan(−μ(λ)/π) − δ` for `0 < λ < 1`, with `μ(λ)` of 11.11.12; affects a stated result.
