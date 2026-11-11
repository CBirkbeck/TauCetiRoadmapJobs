# Review of SpecialFunctionsStruve (pull request #2129 at 3c308f7)

**Verdict:** needs changes

This is an incremental re-review of the 39 lines changed since `e5efb18` (only `Suggested.lean` changed). There are three findings: one P1 and two P3.

- The gate now passes: the forbidden import is gone and the file builds (previous R01, R02 repaired).
- The previous R03 (the false sector of 11.11.8) and R04 (the dropped case of 11.10.4) are untouched at this head: the README and the two Lean statements read exactly as before. They are written again as R01 and R02.
- The repair added two declarations that the README never names (R03).

## R01 (P1) — DLMF 11.11.8 is false for `0 < λ < 1` near the negative axis, and `isBigO_angerWeberA_scaled` states it

**Location.**

- README lines 983–984: "DLMF 11.11.8–11.11.9: for fixed `λ > 0`, `𝐀_ν(λν) ∼ π⁻¹ ∑ₖ (2k)! a_k(λ) ν^{−2k−1}` as `ν → ∞` in `|ph ν| ≤ π − δ`".
- README lines 1012–1013 (the rotation of the path "extends them to `|ph ν| ≤ π − δ`").
- `Suggested.lean` lines 355–361 (`=O[sectorAtTop (π - δ)]`).

**Claim.** For every `λ > 0`, `δ ∈ (0, π)` and `N`, the remainder is `O(ν^{−2N−1})` along `sectorAtTop (π − δ)`.

**Witness** (from the previous review, whose computation stands since neither passage changed). At `λ = 0.1`, `δ = 0.2`, `ν = 20e^{2.9i}` the Lean definition gives `|𝐀_ν(λν)| = 3.79 × 10⁹`; the series gives `0.0145`. Along that ray: `3.7 × 10⁴`, `3.8 × 10⁹`, `4.5 × 10¹⁴` at `|ν| = 10, 20, 30`. The branch points `u = −μ(λ) ± πi` of `u = λ sinh t + t` stop the rotation at `|ph ν| = π − arctan(−μ(λ)/π)`.

**Repair.** In 8.3, state 11.11.8 in `|ph ν| ≤ π − θ(λ) − δ`, with `θ(λ) = arctan(−μ(λ)/π)` for `0 < λ < 1` (`μ(λ)` of 11.11.12) and `θ(λ) = 0` for `λ ≥ 1`; replace the route sentence by rotation up to the branch points `−μ(λ) ± πi`; add `λ = 0.1`, `ν = 20e^{2.9i}` as a negative-control Check. In Lean, use the filter

`sectorAtTop (π - max 0 (Real.arctan ((Real.log ((1 + √(1 - lam ^ 2)) / lam) - √(1 - lam ^ 2)) / π)) - δ)`

Tested again on a scratch copy of this head together with the repair of R02: 26 `sorry` warnings, no error. At `λ = 0.1` the sector ends at `2.575 − δ`, which excludes the refuting ray. When this is repaired, add 11.11.8 to the description's list of corrected DLMF statements.

## R02 (P3) — 11.10.4 drops DLMF's case `Re z = 0`, `Re ν > 0`

**Location.**

- README line 860: "DLMF 11.10.4: `𝐀_ν(z) = π⁻¹ ∫₀^∞ e^{−νt − z sinh t} dt` for `Re z > 0`, absolutely convergent".
- `Suggested.lean` lines 326–329 (`hz : 0 < z.re`).

**Claim.** This is 11.10.4 with its hypotheses.

**Witness.** DLMF §11.10 also states 11.10.4 for `Re z = 0`, `Re ν > 0`. Lean definition = integral at `(ν, z) = (0.7, 2i)`: `0.0680813748 − 0.1305948462i`; at `(1, −1.5i)`: `0.1044051261 + 0.1239113116i` (previous review).

**Repair.** Add "and for `Re z = 0`, `Re ν > 0`" in 7.1. In Lean, use `(hz : 0 < z.re ∨ (z.re = 0 ∧ 0 < ν.re))`; it elaborates on a scratch copy of this head (26 `sorry` warnings, no error).

## R03 (P3) — `eulerIntegral` and `IsEulerContinuation` are declared in `Suggested.lean` and named nowhere in the README

**Location.** `Suggested.lean` lines 39–51 (the two new definitions); README lines 241–246 (the SpecialFunctionsHypergeometric contract), which names only "`Complex.gaussHypergeometric a b c z`, the principal branch on `1 − z ∈ slitPlane`".

**Claim.** README and Lean agree: every Lean name appears in the README (the rule the first review's finding on missing names enforced, and which held for all declarations at `e5efb18`).

**Witness.** A search of the README for `eulerIntegral` and for `IsEulerContinuation` finds nothing; the other local copies are each named there (`Complex.besselY` line 123, `TauCeti.scorerHi` line 238, `TauCeti.fresnelC`/`fresnelS` line 251).

**Repair.** Extend the contract bullet at README line 244, for example: "`Complex.gaussHypergeometric a b c z`, the principal branch on `1 − z ∈ slitPlane`, which is `Γ(c)` times the continuation in `b` and `c` (`IsEulerContinuation`) of Euler's integral 15.6.1 (`eulerIntegral`)". This matches SpecialFunctionsHypergeometric's Conventions (its README lines 181–189) and names both declarations.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 3–4 import only `Mathlib` and `TauCeti.Analysis.SpecialFunctions.RegularizedHypergeometric`; `lommelCapitalS_eq_laplace` uses the local `gaussHypergeometric` (lines 39–60); build passes with 26 `sorry` warnings.
- R02 — repaired: the gate shows `imports=0`.
- R03 — not repaired: README 983–984 still "as `ν → ∞` in `|ph ν| ≤ π − δ`"; Lean line 360 still `=O[sectorAtTop (π - δ)]`. Written again as R01.
- R04 — not repaired: README 860 still "for `Re z > 0`, absolutely convergent"; Lean line 327 still `(hz : 0 < z.re)`. Written again as R02.

## Verified sound

### The changed passages

- **The local copies are faithful.** `eulerIntegral` and `IsEulerContinuation` (lines 39–51) are character for character the definitions of SpecialFunctionsHypergeometric on main (`Suggested.lean` lines 51–60 there). The local `gaussHypergeometric` (lines 53–60) is `Gamma c *` the body of that roadmap's `regularizedGaussHypergeometric` (lines 68–72 there), which is what its `gaussHypergeometric` (line 75) unfolds to; same junk value `0` off the cut plane.
- **The definition determines its object.** A continuation is unique: for `Re c > 0` the strip `0 < Re b < Re c` fixes the entire function of `b`; for `Re b > 0` the half-plane `Re c > Re b` fixes the entire function of `c`; the remaining `(b, c)` follow from entireness in `b`. The most plausible wrong model, the regularized `𝐅` without `Γ(c)`, differs at `c = ½` by the factor `√π = 1.7724…` and is excluded by the values below. In the theorem `1 − z = 1 + t² ≥ 1` lies in the slit plane, so the junk branch is never taken.
- **No name clash.** The copies are `TauCetiRoadmap.SpecialFunctionsStruve.eulerIntegral`, `.IsEulerContinuation`, `.gaussHypergeometric`; the supplier's are in `TauCetiRoadmap.SpecialFunctionsHypergeometric`. Neither the pinned Mathlib nor the pinned Tau Ceti has an `eulerIntegral` or an `IsEulerContinuation` (searched both trees; `library-matches.md` has no hit).
- **No sorry'd data, no `set_option`, no roadmap import** in the changed lines; each new definition has a real body and a docstring.
- **Module docstring** (lines 14–20) describes the copies as they are in the file.

### Gate, build, dependency check

- **Gate** (run again with `--build` and the merge order): every scanner `0`, `build=0`, `OK`. Nothing changed outside the folder.
- **Elaboration.** `lake env lean` on `Suggested.lean`: 26 `declaration uses sorry` warnings, the 13 pinned `#check` outputs, nothing else.
- **Dependency check.** `depcheck: 236 roadmaps, 2137 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line.
- **Signatures.** The elaborated types of the three new definitions (`ℂ → ℂ → ℂ → ℂ → ℂ`, `(ℂ → ℂ → ℂ → ℂ → ℂ) → Prop`, `ℂ → ℂ → ℂ → ℂ → ℂ`) and of `lommelCapitalS_eq_laplace` (`∀ (μ ν : ℂ) {z : ℂ}, 0 < z.re → …`, with the local `gaussHypergeometric ((1 - μ + ν) / 2) ((1 - μ - ν) / 2) (1 / 2) (-↑t ^ 2)`) agree with README lines 799–801. The file has no `variable` block; no binder is lost.
- **Padding probe** on the changed theorem: `first | rfl | (simp; done) | (simp [gaussHypergeometric, eulerIntegral, IsEulerContinuation, lommelCapitalS]; done) | (norm_num; done) | (fun_prop; done) | sorry` leaves it open (still 26 `sorry` warnings).

### Citations and overlaps

- Resolved again: SpecialFunctionsHypergeometric on main — its Conventions (`gaussHypergeometric`, README lines 161 and 181–191 there) and the three definitions in its `Suggested.lean`. 4 declarations opened there (lines 51, 57, 68, 75).
- `overlaps.md` lists no open pull request that changes this roadmap and no dropped id. The nine names of `citations.md` are the supplier names the previous review resolved (SpecialFunctionsBessel, SpecialFunctionsAiry, SpecialFunctionsEiLiErfIncompleteGamma, AsymptoticExpansions); the README did not change.
- Ownership: no other roadmap declares these three names in the `SpecialFunctionsStruve` namespace; the Gauss function stays owned by SpecialFunctionsHypergeometric, and the copy is local to the acceptance file as for `besselY`.

### The pull request's text

Read against this head: "`Suggested.lean` imports only Mathlib and Tau Ceti's `RegularizedHypergeometric`", "local copies of … the Gauss function `F`" and "26 headlines" all hold (lines 3–4; lines 39–60; 26 `sorry` warnings). No sentence is contradicted by the head, and the change since `e5efb18` removes no section, declaration or supplier.

### Adversarial table

Rows marked "this review" were computed now, in double precision, from the copied definitions: `F` is `Γ(½)` times the Euler integral (double-exponential quadrature), which is the third clause of `IsEulerContinuation` where `0 < Re b < ½`; `S_{μ,ν}` is 11.9.5 with series for `s_{μ,ν}`, `J_ν`, `Y_ν`. The other rows are carried from the review at `e5efb18`, whose statements this diff leaves untouched.

| Statement | Instances and values | Result | Computed in |
|---|---|---|---|
| `eulerIntegral`, `gaussHypergeometric` (local copies) | `F(½, 0.2; ½; −t²)` vs `(1 + t²)^{−0.2}` at `t = 0.5, 1.7, 6`: `0.95635241` vs `0.95635250`, `0.76209661` vs `0.76209670`, `0.48569046` vs `0.48569055`; against the `₂F₁` series at `(a, b, c, z) = (0.45 − 0.05i, 0.25 − 0.05i, ½, −0.49)`: `0.9153417097 + 0.0253070884i` vs `0.9153417082 + 0.0253070881i`. Without `Γ(c)` every value would be smaller by `√π` | the copy is the Gauss function `F` | this review |
| `IsEulerContinuation` | satisfied by `𝐅` (values above in the strip); fails for `Γ(c)𝐅` (off by `√π` in the strip) and for `0`; uniqueness argument above | determines `𝐅` | this review |
| `lommelCapitalS_eq_laplace` (restated on the local `F`) | `(μ, ν, z) = (0.3 + 0.1i, 0.2, 1.5 + 0.5i)`: definition `0.6510757496 − 0.0810950060i`, Laplace `0.6510757507 − 0.0810950058i`; `(0.3, 0.3, 1.2 + 0.4i)`: `0.7595545816 − 0.1452847805i` vs `0.7595545050 − 0.1452847628i`; `(0.2, 0.1, 2)`: `0.5281656` vs `0.5281628` (quadrature error at the weaker endpoint exponent) | holds | this review |
| 1.1 Checks | `𝐇₀(1) = 0.56865662705`, `𝐋₀(1) = 0.71024318594`, `𝐇₁(1) = 0.1984573362`, `𝐇_{0.3}(2+i) = 1.0479605148 + 0.22137059751i`, `𝐊₀(1) = 0.48039966283`, `𝐌₀(1) = −0.55582269181` | as README | previous review |
| `𝐋_ν = −ie^{−iνπ/2}𝐇_ν(iz)` | `ν = 0.3`, `z = 0.7+0.4i`: both `0.28667885554 + 0.25469099348i` | holds | previous review |
| `struveH_ode` | `(0.3+0.2i, −1+0.5i)`: both `−0.10284272 − 0.43376522i`; `(−3/2, 2−i)`: lhs `1.1 × 10⁻⁹`, rhs `0`; `(2, −2+0.1i)`: both `−0.42441318 + 0.02122066i` | holds, also where `1/Γ(ν+½) = 0` | previous review |
| `struveH_half`, 2.1 Checks | `z = 1, −1+0.5i, 0.3−2i`: `0.36678569278`, `−0.25428467184 − 0.36298315905i`, `−0.71046158836 − 1.4054502011i` on both sides; `𝐇_{−1/2}(1) = 0.67139670714`, `𝐋_{1/2}(1) = 0.43331565379`, `𝐇_{1/2}(3) = 0.91670768676` | holds | previous review |
| `struveH_relative_bound` | `ν = 0`, `z = 1`, `d = 3/2`: `|ϑ| = 0.1067562590 < 0.1209069419`. Printed 11.4.15 at `ν = 1000`, `|z|²/4 = |ν+3/2|`: `ϑ = 1.02944` > printed `0.66667`, < corrected `1.14552` | correction right | previous review |
| `struveH_recurrence` | `(0.3+0.2i, −1+0.5i)`: both `0.29582727708 + 0.37707989822i`; `(−3/2, 2+i)`: both `0.87935131088 − 0.1815546866i`; `(0, 1)`: both `0.63661977237 = 2/π` | holds at a pole of `Γ` | previous review |
| `struveH_eq_integral` | `(0.3, −1+0.5i)`: both `−0.4817337314 − 0.2231595208i`; `(−0.3+i, 2+i)`: both `0.7318264102 + 0.3363024547i`; `(0.4+0.3i, 1.5−0.7i)`: both `0.7922677456 − 0.5065908943i` | holds | previous review |
| `struveK_eq_integral`, 11.5.3 | `(−1, 1)`: both `−0.34305038513`; `(3.2, 0.5−3i)`: `−0.28168795457 − 0.10905547729i` vs `−0.28168795456 − …`; `(−2.5+i, 1+2i)`: both `−0.53221748841 − 0.3828890287i`; `𝐊₀(10)` by 11.5.3: `0.063072516404` | holds for every `ν` | previous review |
| 3.2 Example (11.5.4) | `ν = ½`, `z = 1`: both `−0.50435923446` | holds | previous review |
| `struveH_mellinBarnes` | `(ν, x, c) = (3, 1.2, −0.4)`: lhs `−0.57785365i`, rhs `−0.57785366i` | holds | previous review |
| `isBigO_struveK_sub_sum` | `𝐊₀(10) = 0.0630725164` between `0.0630253575` and `0.0630826532` (two, three terms) | sign statement holds | previous review |
| 4.2 Check | `∫₀^8 𝐌₀ + (2/π)(ln 16 + γ) = 0.0054568877425`, first term `0.0049735919716` | as README | previous review |
| `struveScaledCoeff` vs 11.6.8 | exact rationals, `λ = 2`: `1, 1/2, 1/4, 1/16, −7/128` from both; `λ = 3/7`: all five equal | equals 11.6.8 | previous review |
| `isBigO_struveK_scaled` | `λ = 2`, remainder over next term, `N = 1, 2, 3`: `ν = 30`: `1.034, 1.021, 0.839`; `ν = 60`: `1.017, 1.012, 0.932`; `ν = 60e^{i}`: `1.0089−0.0142i, 1.0072−0.0098i, 0.973+0.057i`; `ν = 60e^{−1.2i}`: `1.0059+0.0157i, 1.0052+0.0112i, 0.986−0.060i` | holds | previous review |
| `struveL_isEquivalent_besselI` | `λ = 2`: `𝐋/I = 0.99986533, 0.99999995, 1.0000000` at `ν = 10, 20, 40`; `ν = 40e^{1.3i}`: `1.000008 − 0.000042i`; `λ = ½`: `0.9535 − 0.2231i`, `1.0695 − 0.0590i` at `ν = 20e^{−i}, 40e^{−i}` | tends to `1` | previous review |
| `hasDerivAt_besselJ_struveH` | `(0.3+0.2i, −1+0.5i)`: both `−0.0586268365 + 0.300173363i`; `(1.5, 2+i)`: both `1.29162197 + 1.82740036i`; `(−2.3+0.4i, 0.7−1.2i)`: both `−1.26564315 − 0.444924679i`. At `ν = −3/2` the bracket is `0.63661977237` | holds; hypothesis needed | previous review |
| 11.7.6 | `ν = 0.3+0.2i`, `z = −1+0.5i`: README form res `4.5 × 10⁻¹³`, DLMF's printed form res `0.342` | README form right | previous review |
| `integral_struveH_mul_struveH` | `μ = ν = ½`: right side `√π/(2Γ(3/2)) = 1`, left side `(2/π)∫₀^∞(1−cos t)²t⁻² dt = 1`; `μ = 3`, `ν = −2`: the integrand is `∼ c t^{1/2} cos(t − φ)` | holds; DLMF's hypothesis insufficient | previous review |
| 5.3 | 11.7.13 at `a = 2`: both `0.13700342101` | holds | previous review |
| 6.1 Checks | `s_{.5,.2}(1.3) = 0.58290015167`, `S_{.5,.2}(1.3) = 0.83162460055`, `S_{0,0}(1) = 0.75461002577 = (π/2)𝐊₀(1)`, `S_{−1,0}(1) = 0.4422364520`, `S_{2,1}(2) = 2`, `S_{1,0} = 1` | as README | previous review |
| `differentiable_lommelCapitalS` | `S_{−1+h,0}(1)` at `h = 10⁻³, −10⁻³, 10⁻³i`: `0.442493161`, `0.441979872`, `0.442236388 + 0.000256649i` around `0.442236452` | removable | previous review |
| `lommelCapitalS_ode` | `(0.5+0.3i, 0.2, 1.3+0.4i)`: both `0.7827281 − 0.0446416i`; doubly exceptional `(−1, 0, 1.2+0.3i)` via the Laplace form: both `0.5767012687 − 0.3075740099i`; `(0.3, 0.3, −1+0.5i)`: both `−0.2766431 − 0.8825283i` | holds | previous review |
| 6.2 | 11.9.7 and 11.9.8 at `(0.5, 0.2, 1.3)`: both `0.58290015167` | holds | previous review |
| Laplace representation (6.3) | `(μ, ν, z)` = `(0.3+0.1i, 0.2, 1.5+0.5i)`: `0.6510757496 − 0.081095006i` both (README Check); `(−1, 0, 1)`, `(2, 1, 2)`, `(1.7, −0.4+0.3i, 0.8−0.6i)`, `(−2.5, 0.5+0.2i, 2)`, `(0.3, 0.3, 1.2+0.4i)`, `(−3, 2, 1.5)`, `(0.5, 0.2, 1.3)`: `|R − S| ≤ 2 × 10⁻⁹` | holds at all parameters | previous review |
| Hankel representation (6.3) | `(0.2, 0.3, 2)`: both `0.53377778818`; variation of parameters `s = 1.1233236368` on both sides | holds | previous review |
| `isBigO_lommelCapitalS_sub_sum` | remainder over next term, `N = 1, 2, 3`, `z = 40e^{0.6i}`: `(0.3+0.1i, 0.2)`: `0.9986, 0.9953, 0.9897`; `(−1, 0)`: `0.9962, 0.9912, 0.9839` (the `|z| = 20` values are further from `1`) | holds | previous review |
| 7.1 Checks | `𝐉_{1/2}(1) = 0.85516530968`, `𝐄_{1/2}(1) = 0.09950754264`, `𝐀_{1/2}(1) = 0.18376860254`, `𝐀₀(1) = 0.24019983142 = 𝐊₀(1)/2`, `𝐀₁(1) = 0.14678469362` (= the integral) | as README | previous review |
| `differentiable_angerWeberA` | `𝐀_{1∓10⁻⁶}(1) = 0.14678475461, 0.1467846332` around `0.14678469362` | the cases glue | previous review |
| `angerWeberA_eq_integral` | `(2, 1.3)`: `0.093581260282` vs `0.093581260283`; `(−3, 0.8)`: both `10.660330748`; on `Re z = 0` (R04): `(0.7, 2i)`: both `0.0680813748 − 0.1305948462i`; `(1, −1.5i)`: both `0.1044051261 + 0.1239113116i` | holds; narrowed (R04) | previous review |
| `angerJ_eq_besselJ_add` | `𝐉₂(1.3) = J₂(1.3) = 0.18302669877`; `𝐉₋₃(−1+0.5i) = J₋₃ = 0.0066844974 − 0.0269712100i`; `ν = 0.3+0.5i`: both `0.49000880214 − 0.52176518596i` | holds at integers | previous review |
| 7.2 | `𝐄₀(1) = −0.56865662705`, `𝐄₁(1) = 0.43816243617 = 2/π − 𝐇₁(1)`, `𝐉_{0.3}(0) = 0.85839369133`; 11.10.17: both `0.90475169903`; 11.10.18: both `−0.16315998701` | holds | previous review |
| Layer 7 Example | `𝐀_{−1/2}(1) = 0.33159132538 = −Y_{1/2}(1) − 𝐄_{1/2}(1)` | holds | previous review |
| `angerJ_neg_half` | `z = 1`: `0.09950754264`; `−1+0.5i`: `0.9151680458 + 0.0057784949i`; `0.3−2i`: `1.112451701 + 1.584522631i`; `−3−0.1i`: `0.1509240148 − 0.0490360309i`; both sides at each | holds on the slit plane | previous review |
| 8.1 (11.11.4) | `ν = 0.3+0.2i`, `z = 40e^{0.8i}`, remainder over next term, `N = 2, 3, 4`: `0.963+0.010i`, `1.014−0.140i`, `0.934+0.021i` | holds | previous review |
| 8.2 (11.11.5) | bracket error × `|ν|²` at `ν = 40.5`, `½+10i`, `40e^{i}+½`: `0.978, 0.954, 0.986` | bounded; no correction needed | previous review |
| `isBigO_weberE_large_order` | error × `|ν|²/e^{π|Im ν|}`: `0.2385, 0.514, 0.2464`; DLMF's form at `½+10i`: `1.05 × 10¹³` | corrected form bounded | previous review |
| `angerScaledCoeff` vs 11.11.9 | exact rationals, `k ≤ 3`, at `λ = 7/10, 2, 1/3`: all equal | equals 11.11.9 | previous review |
| `isBigO_angerWeberA_scaled` (R03) | `λ = 0.1`, `ph 2.4`, `|ν| = 20`: `−0.0106711 − 0.0097706i` vs `−0.0106707 − 0.0097709i`; `ph 2.9`: `|𝐀| = 3.7 × 10⁴, 3.8 × 10⁹, 4.5 × 10¹⁴` vs `≈ 0.01`; `λ = 0.7`, `ph 3.12`: `2.09` vs `0.0094`; `λ = 1`, `ph 3.0`: `|J/sin|` falls from `4.9 × 10⁻³` to `4.7 × 10⁻⁴` (`|ν| = 10 → 15`) | false for `λ < 1` | previous review |
| `isBigO_angerWeberA_transition` | error × `|ν|` at `|ν| = 100, 400, 1600`, `a = 1+i`: `0.0399, 0.0405, 0.0407` (`ph 0`, `1.0`), `0.0401, 0.0405, 0.0407` (`ph 1.4`); `a = −2`: `24.9, 23.0, 22.4` (`ph 0`), `24.2, 22.8, 22.3` (`ph 1.0`), `23.5, 22.6, 22.2` (`ph 1.4`) | bounded for complex `ν` | previous review |
| 8.4 Checks | `Hi(0) = 0.40995108496 = 2/(3^{7/6}Γ(⅔))`; `𝐀_{−10}(10) = 0.23669402848`, leading term `0.23974084887` | as README | previous review |
| `angerJ_self_isEquivalent` | `ν = 100`: ratio `0.999971`; `ν = 20e^{0.3i}`: `−1.426 × 10⁶ − 2.406 × 10⁶ i`; `ν = 10e^{0.3i}`: `−383.7 + 147.9i` | holds for real `ν` only, as stated | previous review |

Remark on untouched text, no change asked: the *Not recomputed* items of the previous review (11.6.5 at `|ν| = 300`, 11.7.9–11.7.11, 11.11.17 at `|ph ν| ≥ π/2`) were not recomputed here either.

## Not verifiable

- **DLMF not re-read this round.** The diff changes no source-backed statement, so the seeded sample falls on untouched text that the previous review compared with DLMF §§11.2–11.11 (Release 1.2.8); R01 and R02 rest on that reading and on its computations.
- **Secondary sources** (Watson 1944, Olver 1974/1997, Babister 1967, Dingle 1973, Nemes 2014) were not fetched; no changed passage cites them.
- **Precision.** The new values are double precision with quadrature errors of `10⁻⁷` to `3 × 10⁻⁶`; the wrong normalisation would differ in the first digit.

## Source issues

- **Error** in DLMF §11.11 at 11.11.8, online section 11.11(iii): the source says the expansion of `𝐀_ν(λν)` holds for every fixed `λ > 0` in `|ph ν| ≤ π − δ`; it should be `|ph ν| ≤ π − arctan(−μ(λ)/π) − δ` for `0 < λ < 1`; affects a stated result.
