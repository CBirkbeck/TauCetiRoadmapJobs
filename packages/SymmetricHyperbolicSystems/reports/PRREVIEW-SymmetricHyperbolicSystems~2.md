# Review of SymmetricHyperbolicSystems (pull request #2246 at 97d9e01)

**Verdict:** needs changes

## R01 (P2) — Layers 4–6 never assume the `Aⁱ` symmetric, and the one-step inequality fails without it

**Location:** `TauCetiRoadmap/SymmetricHyperbolicSystems/README.md:489–490`: "Throughout this layer and Layers 5 and 6, `n ≥ 1` and `A⁰ = 1`." The hypotheses at lines 532–533 (§4.2), 556 (§4.3) and 617 (§5.2) add only CFL, `L` and `M`.

**Claim:** The README's one-step inequality, stability, uniform bounds and the Layer 6 hypotheses omit symmetry of the `Aⁱ`. The Lean (`hsymm` in `sqrt_gridNormSq_friedrichsStep_le`, `exists_isClassicalSolution_of_A0_eq_one`, `tendsto_friedrichs`) carries it. Without symmetry the weights are not positive semidefinite, and the bound is false.

**Witness:** `n = 1`, `N = 2`, `A¹ = [[0,1],[−1,0]]` (so `⟪A¹ξ,ξ⟫ = 0`: CFL holds with `μ = 1`, `L = M = 0`), `B = F = 0`, `h = k = 1`, `v(j) = (cos(jπ/4), −sin(jπ/4))` for `0 ≤ j ≤ 7`. Then `‖v‖²_h = 8` and `‖Qv‖²_h = 14`.

**Repair:** Replace lines 489–490 with: "Throughout this layer and Layers 5 and 6, `n ≥ 1`, `A⁰ = 1` and every `Aⁱ(t,x)` is symmetric." Tested: with `Aⁱ` symmetric, CFL makes the weights `(2n)⁻¹ ± (μ/2)Aⁱ` positive semidefinite, and §4.2's computation goes through.

## R02 (P2) — §7.2 states the normalization equivalence with no hypotheses, and it fails unless `A⁰` is `C¹`

**Location:** `TauCetiRoadmap/SymmetricHyperbolicSystems/README.md:766–767`: "and prove: `u` is a classical solution of `S` with source `F` on `[0,T]` if and only if `v = (A⁰)^{1/2} u` is a classical solution of `S.normalize` with source `P F`."

**Claim:** `isClassicalSolution_normalize_iff` assumes `S.IsSymmetricHyperbolic lam` and that `A⁰` is `C¹`. The README states neither, and the equivalence is false without the `C¹` hypothesis.

**Witness:** `n = N = 1`, `A⁰ = (1 + |t − T/2|)²`, `A¹ = B = 0`, `F = A⁰`, `u = t`. Then `u` is a classical solution, but `v = t + t|t − T/2|` has one-sided `t`-derivatives `1 + T/2` and `1 − T/2` at `T/2`, so it is not `C¹`.

**Repair:** "and prove, for `S` symmetric hyperbolic with constant `λ` and `A⁰` of class `C¹` (so that `P` is `C¹`): `u` is a classical solution of `S` with source `F` on `[0,T]` if and only if `v = (A⁰)^{1/2} u` is a classical solution of `S.normalize` with source `P F`."

## R03 (P3) — Ten of the fifteen sampled targets still have no locator (previous R05, partly repaired)

**Location:** `TauCetiRoadmap/SymmetricHyperbolicSystems/README.md`: §1.1 (lines 188–208), §3.1–§3.3, §4.3, §5.2, §6.1, §6.2, §7.1 and §7.3. The only Layer 4–6 locator, at lines 489–490, gives no page: "the method of finite differences of John 1982, Ch. 5 §3 (b)".

**Claim:** Locators were added at §1.2, §2.1, §2.2, §2.3, §4.1, §4.2 and §6.3. The sections listed above still state theorems without a theorem, page or equation number.

**Witness:** Searching those sections for `Theorem|Lemma|Proposition|Definition|p\. ` finds no match.

**Repair:**
- At §3.2, §3.3, §4.3, §5.1, §5.2, §6.1 and §6.2, cite John 1982, Ch. 5 §3 (b) with the page of each step.
- At §1.1, cite a textbook, for example "(Rudin, *Principles of Mathematical Analysis*, 3rd ed., Theorem 9.21)", and add it to the references.
- At §7.1 and §7.3, cite the source of the reduction to `A⁰ = 1`, or state at the claim that the result is assembled from the cited §6.2, §7.1 and §7.2.

## R04 (P3) — §3.1's matrix Leibniz rule restates a pinned Tau Ceti lemma

**Location:** `TauCetiRoadmap/SymmetricHyperbolicSystems/README.md:398–401`: "The matrix Leibniz rule … and its iterate … extending Mathlib's scalar `fwdDiff_smul`". Lines 169 and 172–173 also say Tau Ceti offers nothing else: "These are the only Tau Ceti declarations consumed" and "Nothing else in Mathlib or Tau Ceti treats … grid functions on `ℤⁿ`".

**Claim:** Tau Ceti proves the iterated discrete Leibniz rule for coefficients in any ring, commutative or not, on any additive monoid. That covers matrices acting on `ℝᴺ` over `ℤⁿ`. Mathlib's `fwdDiff_smul` is not scalar-only: it allows a noncommutative `[Ring R]`.

**Witness:** `TauCeti.fwdDiff_iter_smul` (`TauCeti/Algebra/Group/ForwardDiff.lean:102`), applied to `f j = Matrix.toLin' (a j)`, gives `Δ^m(a *ᵥ v)(j) = Σ C(m,i) Δ^i a(j) *ᵥ Δ^{m−i} v(j + i eᵢ)`. The six-line proof elaborates with `lake env lean`.

**Repair:**
- Under "From Tau Ceti", add: "`TauCeti.fwdDiff_iter_smul` (`TauCeti/Algebra/Group/ForwardDiff.lean:102`): the iterated discrete Leibniz rule over a possibly noncommutative ring, used with `j ↦ Matrix.toLin' (a j)`."
- Rewrite the bullet: "the one-direction iterate is that lemma; the coefficient-shifted form below is the same lemma with step `−eᵢ` at `j + αᵢeᵢ`; the target is the multi-index composite."
- Delete "the only Tau Ceti declarations consumed" and the words "or grid functions on `ℤⁿ`".

## R05 (P3) — §7.1's proof route cites lemmas that do not apply as stated

**Location:** `TauCetiRoadmap/SymmetricHyperbolicSystems/README.md:744–745`: "then `norm_iteratedFDeriv_comp_le` bounds the composites". Also line 736: "`Matrix.PosSemidef.inv_sqrt` identifies `(CFC.sqrt A)⁻¹` with `A ^ (−1/2 : ℝ)`".

**Claim:** `norm_iteratedFDeriv_comp_le` requires `hg : ContDiff 𝕜 N g` on the whole space, and `CFC.sqrt` is not `C¹` there. `inv_sqrt` proves `(CFC.sqrt A)⁻¹ = CFC.sqrt A⁻¹`, not the rpow form.

**Witness:** For `N = 1`, `CFC.sqrt a = √(max a 0)`, which is not differentiable at `0`. See `Mathlib/Analysis/Calculus/ContDiff/Bounds.lean:511` (`hg`) and `Mathlib/Analysis/Matrix/Order.lean:137` (the statement of `inv_sqrt`).

**Repair:**
- Line 745: "then `norm_iteratedFDerivWithin_comp_le` (`Mathlib/Analysis/Calculus/ContDiff/Bounds.lean:444`), with `t = {P | P.PosDef}` (open, hence `UniqueDiffOn`) and `s = univ`, bounds the composites".
- Line 736: "`Matrix.PosSemidef.inv_sqrt` with `CFC.sqrt_eq_rpow` and `CFC.rpow_neg` (`Mathlib/Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Rpow/Basic.lean:633,516`) identifies …".
- Add the three names to the supplier contracts.

## R06 (P3) — The §6.1 support radius `R₁` is too small by up to `h`

**Location:** `TauCetiRoadmap/SymmetricHyperbolicSystems/README.md:664–665`: "they vanish outside `‖x‖_∞ ≤ R₁ = R + 2 + (T + 1)/μ`".

**Claim:** For `t ∈ (t_m, t_{m+1}]`, `W_{h,i}` interpolates `D₊ᵢu^{m+1}`, whose interpolant reaches `‖x‖_∞ < R + mh + 3h`. When `(T+1)/μ` lies just above a multiple of `h`, this exceeds `R₁`.

**Witness:** `n = N = 1`, `A¹ = B = F = 0`, `μ = h = 1`, `R = 0.99`, `T + 1 = 1.005`, `u₀(0) ≠ 0`. For `t ∈ (1, 1.005]`, `W_{h,1}(t, −3.998) = (t − 1)·0.002·u₀(0)/4 ≠ 0`, while `R₁ = 3.995`.

**Repair:** "they vanish outside `‖x‖_∞ ≤ R₁ = R + 3 + (T + 1)/μ`". This holds because `t_m ≤ T + 1` gives `mh ≤ (T+1)/μ`, and `h ≤ 1`. The compact set `K` at line 668 then needs no other change.

## R07 (P3) — `matDt` and `matDx` have no Check, and `IsClassicalSolution` has one

**Location:** `TauCetiRoadmap/SymmetricHyperbolicSystems/README.md:232–246` (the §1.2 Checks) and 58–63 (the Conventions that define `matDt` and `matDx`).

**Claim:** Each definition needs three discriminating Checks. The §1.2 Checks test transport, the wave system, the Jordan block and `λ ≤ 1`. Only the first concerns `IsClassicalSolution`, and none computes `matDt` or `matDx`.

**Witness:** The four `**Checks.**` bullets at lines 234–246. Of these, only the transport bullet asserts that something is a classical solution, and no bullet asserts that something fails to be one.

**Repair:** Add these Checks to §1.2 (values computed):
- `M(t,x) = t x₁ • [[0,1],[1,0]]` on `ℝ × ℝ²`: `matDt M t x = x₁[[0,1],[1,0]]`, `matDx M 0 t x = t[[0,1],[1,0]]`, `matDx M 1 t x = 0`.
- `P(t) = diag(t, 1)`: `matDt (P·P) 1 = diag(2,0) = matDt P·P + P·matDt P`, while `matDt P·matDt P = diag(1,0)`.
- `M(t) = |t| • 1`: `matDt M 0 = 0` (Mathlib's junk `deriv`), which is why statements about `matDt` assume `C¹`.
- `u(t,x) = |x − t|` solves `∂ₜu + ∂ₓu = 0` off the line `x = t` but is not a classical solution, because `uncurry u` is not `C¹`.
- For `T < 0` the set `Icc 0 T ×ˢ univ` is empty, so every `u` is a classical solution; the existence theorems therefore assume `0 < T`.
- With `A⁰ = 1`, `Aʲ = B = F = 0`, every `u(t,x) = g(x)` with `g` of class `C¹` is a classical solution: the predicate does not fix `u 0`.

## R08 (P3) — §2.3's single *Needs:* line covers four results with different needs

**Location:** `TauCetiRoadmap/SymmetricHyperbolicSystems/README.md:373`: "*Needs:* §2.2; §1.2 linearity."

**Claim:** Only uniqueness needs §2.2. The integrated identity and the energy estimate need §2.1, differentiation under the integral, integration by parts and Grönwall. They are blocked behind §2.2, and their real inputs are not listed.

**Witness:** Line 337 says the identity "is §2.1 integrated over `[0,t] × ℝⁿ`", and its route uses no cone or weight from §2.2.

**Repair:** "*Needs:* uniqueness: §2.2, §1.2 (linearity, speed). Integrated identity: §2.1; Mathlib's `hasDerivAt_integral_of_dominated_loc_of_deriv_le` and `integral_bilinear_fderiv_right_eq_neg_left_of_integrable`. Energy estimate: the integrated identity and `norm_le_gronwallBound_of_norm_deriv_right_le`. Time reversal: §1.2."

## R09 (P3) — The description's Layer 7 line describes the previous head (previous R02, repaired in the folder only)

**Location:** The pull-request description: "7. General A⁰: the smooth square root of positive definite matrices (Mathlib's matrix functional calculus and the inverse function theorem) and normalization."

**Claim:** The head does not prove smoothness of the square root and does not use the inverse function theorem. It consumes Tau Ceti's lemmas, and §7.1 is a derivative-bounds target.

**Witness:** `README.md:729–732`: "### 7.1 Derivative bounds for the square root … (Tau Ceti `Matrix.contDiffOn_sqrt`, `Matrix.contDiffOn_rpow`)". `Suggested.lean:333` declares `exists_bound_iteratedFDeriv_sqrt_comp`.

**Repair:** "7. General A⁰: uniform bounds for the derivatives of the square root of a positive definite matrix-valued function and of its inverse (smoothness from Tau Ceti's `Matrix.contDiffOn_sqrt` and `Matrix.contDiffOn_rpow`), and normalization."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 `contDiffOn_one_of_hasDerivAt_single` | `f = x₁x₂`; `x₁x₂/(x₁²+x₂²)`; `ι = ∅` | `fderiv f x v = x₂v₁ + x₁v₂`; `f(t,t) = ½ ≠ f(0)`; one-point domain, trivially `C¹` | holds; not at the pins (searched) | R03 |
| §1.2 `IsClassicalSolution`, `matDt` | `|x − t|`; `T = −1`; `P = diag(t,1)` | not `C¹` on `x = t`; empty slab, so any `u`; `matDt(P²)(1) = diag(2,0) ≠ diag(1,0)` | sound; Checks missing | R07 |
| §1.2 `IsSymmetricHyperbolic`, speed | `A⁰ = 1`, `λ = 2`; Jordan block; `n = 2`, `M = 1`, `λ = 1` | `2 ≤ 1` false; `A⁰A¹` symmetric forces `A⁰₁₁ = 0`; speed `√2` | holds | none |
| §2.1 energy identity | product rule; Métivier's `K`; Jordan block with `u = (1,x)` | `K = ∂ₜA⁰ + Σ∂ⱼAʲ − B − Bᵀ` (Métivier's is its negative); `1 ≠ 0 + 2` | holds; locator verified | none |
| §2.2 `eq_zero_of_isClassicalSolution_of_cone` | transport `a = 1`, data on `(−2,−1)`, `c < 1`; `n = 0`; `c = R = 0` | overlap `(−1+ct, −1+t) ≠ ∅`; ODE uniqueness; closed cone fails at `x₀` | holds | none |
| §2.3 `eqOn_of_isClassicalSolution` | `n = 2`, `M = 1`; `N = 0` | `|ω·a| ≤ √2‖ω‖M`, speed `√n M/λ`; trivial | holds | none |
| §2.3 `integral_dotProduct_A0_sub_eq` | constant coefficients, `B = F = 0`; support of `F` | `K = 0`, `E(t) = E(0)`; `F = S.apply u = 0` for `‖x‖ > R`, so integrals finite | holds | R08 |
| §2.3 `integral_dotProduct_A0_le` | `B = −β•1`, `λ = 1` | `e^{2βt}E₀ ≤ e^{(2β+1)t}E₀`; Grönwall `E ≤ e^{at}(E₀ + ∫‖F‖²)`, `a = (κ+1)/λ` | holds | none |
| §3.1 grid toolkit | SBP `δ₀`; Leibniz `a = j`, `v = δ₁`; restriction `N = 3`, `R = 1`, `h = 0.01` | `−1 = −1`; `h⁻¹ = h⁻¹`; `6.03 ≤ 4·3` | holds; Leibniz at the pin | R04 |
| §3.2 `dotProduct_self_le_sum_gridNormSq` | `n = 1, 2`, `δ₀`; `n = 0` | `1 ≤ h + 2/h`; `1 ≤ h² + 4 + 4/h²`; `|v|² = |v|²` | holds | R03 |
| §3.3 `interp`, `norm_interp_sub_le` | `n = 1`, `δ₀`; `x = (h/2,h/2)`; `n = 0` | hat function, Lipschitz `1/h`; `¼` (triangles give `½`, `0`); `0 ≤ L·0` | holds | R03 |
| §4.1 `friedrichsStep`, `friedrichs` | Lax–Friedrichs; `A = 0`, `v = δ₀` | `½(1−μa)v_{j+1} + ½(1+μa)v_{j−1}`; `Qv = ½(δ₁+δ₋₁)`, `‖Qv‖² = h/2` | holds | none |
| §4.2 `dotProduct_sum_mulVec_le` | weights `2, −1`, `v = (1,−1)`; empty `s` | `9 > 1` without positivity; `Σ W = 0 = 1` forces `N = 0` | holds | none |
| §4.2 `sqrt_gridNormSq_friedrichsStep_le` | antisymmetric `A¹`, `μ = h = 1`, `v(j) = (cos jπ/4, −sin jπ/4)` | README form: `‖Qv‖² = 14 > 8`; Lean `hsymm` excludes it | Lean holds; README false | R01 |
| §4.3 stability | discrete Grönwall | `a_m ≤ (1+kc)^m a₀ + kΣ(1+kc)^{m−1−l}f_l ≤ e^{cmk}(a₀ + kΣf_l)` | holds given symmetry | R01, R03 |
| §5.2 uniform bounds | constant coefficients; `r = 0`; `r = n + 3` | `‖D^αu^m‖ ≤ ‖D^αu⁰‖`; order `max(r,1)`; `|β| + n ≤ n + 3` for `|β| ≤ 3` | holds given symmetry | R01, R03 |
| §6.1 compactness | `A = B = F = 0`, `μ = h = 1`, `R = 0.99`, `T + 1 = 1.005` | `W(t, −3.998) ≠ 0` while `R₁ = 3.995` | radius off by `h` | R06 |
| §6.2 `exists_isClassicalSolution_of_A0_eq_one` | transport `a = μ = 1`; extension to `t < 0` | `u^{m+1}_j = u^m_{j−1}`, exact; `wᵢ(0,·) = ∂ᵢu₀`, `∂ₜ = G(0,·)` on both sides | holds | R01, R03 |
| §6.3 `tendsto_friedrichs` | `T = 0`; `T < 0`; `μa = 1` | only `m = 0`, error `0`; vacuous; error `0` at grid points | holds | none |
| §7.1 `exists_bound_iteratedFDeriv_sqrt_comp` | `[[2,1],[1,2]]`; `sin²x + ε`; `N = 1` | root `½[[√3+1,√3−1],[√3−1,√3+1]]`; `f''(0) = ε^{−1/2}`; `√(max a 0)` not `C¹` | holds; route cites wrong lemma | R05 |
| §7.2 `normalize`, `isClassicalSolution_normalize_iff` | `diag(1,4)`; `e^{2t}`; `λ•1`; `A⁰ = (1+|t−T/2|)²` | `A¹' = diag(1,¼)`; `B' = −1`; `Aʲ/λ`; one-sided derivatives `1 ± T/2` | Lean holds; README lacks hypotheses | R02 |
| §7.3 `exists_isClassicalSolution` | `diag(1,4)`, `A¹ = 1`, `supp u₀ ⊆ [−1,1]` | supports `[t−1,t+1]`, `[t/4−1,t/4+1]`, inside `|x| ≤ 1 + t` | holds | R03 |

- Previous review (at `c626af6`): repaired R01 (`Suggested.lean:119` uses `w`), R03 (lines 408–411, 112), R04 (331–339, 358–361), R06 (244–246), R07 (§3.3, §4.1, §7.2 have 3 Checks each), R08 (`### Examples` in every layer, 810–815, `Suggested.lean:277`), R09 (340–343), R10 (283–284), R11 (688–694); partly repaired R02 (description, see R09) and R05 (see R03).
- Gate: every check `0 OK` (`gate.md`); `lake env lean` on a copy elaborates with 0 errors and 14 `sorry` warnings.
- Signatures: `#check @` of 25 declarations in one file shows no lost section binder; every type matches its README statement except R01 and R02.
- Padding probe: `first | rfl | simp | infer_instance | positivity | aesop` closes none of the 14 theorems; `normalize`'s same-name hit is the unrelated GCD-monoid `normalize`.
- Library: 24 Mathlib file:line locators of the supplier contracts match at `1b1ccf4b` and Tau Ceti `Log.lean:98,106` at `2fd255d`; also opened `Bounds.lean:444`, `Rpow/Basic.lean:516,633`, `TauCeti/Algebra/Group/ForwardDiff.lean:102`; no `n`-variable partial-derivatives criterion exists in Mathlib or Tau Ceti.
- Sources checked: Métivier Definition 4.1.1 (line 21), Lemma 4.2.1 (line 108) and Proposition 4.2.3 (line 130; unspecified `C`, `γ`); CFL1928 Part II §2, pp. 61–62 (GDZ scan lines 1196–1253).
- Dependencies: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`; `git diff --stat origin/main...HEAD` outside the folder is empty; the roadmap is at line 408 of the merge order and cites no other roadmap as a supplier.
- Overlap check: read PDE, YangMillsConnectionsAndCaloricGauge and QuaternionicAnalysis, plus RelativisticQuantumFieldTheory §1.2 (Klein–Gordon only) and LorentzianGeometry's downstream-consumers paragraph; nothing shared.

## Not verifiable

- John1982 (Springer, DOI prefix 10.1007): the publisher is paywalled. "Ch. 5, §3 (a), (b)" is unchecked.
- Lax2006 (AMS Courant Lecture Notes 14): `pubs.ams.org/ebooks/cln/014` is not an open copy. Thm 4.3 p. 41, Thm 4.6 p. 44, (8.9)–(8.11) p. 84, Thm 8.1 p. 85, Thm 8.3 p. 87 and (8.69) p. 104 are unchecked.
- Rauch2005: the README's URL `dept.math.lsa.umich.edu/~rauch/speed3.pdf` redirects to `sites.lsa.umich.edu/jbrauch//speed3.pdf`, which returns HTTP 404. "Definition 6 and (7), p. 5" is unchecked.
- Friedrichs1954 (DOI 10.1002/cpa.3160070206): Wiley returned HTTP 403, and no open copy was found.

## Source issues

- none
