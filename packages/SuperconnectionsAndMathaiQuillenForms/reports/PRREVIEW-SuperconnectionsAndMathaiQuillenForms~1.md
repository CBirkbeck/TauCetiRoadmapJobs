# Review of SuperconnectionsAndMathaiQuillenForms (pull request #2297 at a2bbc95)

**Verdict:** needs changes

## R01 (P1) — 6.2: the identity `tr(F(dF)^(2k)) = 2^(2k+1) tr(P(dP)^(2k))` is false at `k = 0`, by the section's own Check

**Location:** `TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md` lines 677–681 and 690: "`tr(F(dF)^(2k)) = 2^(2k+1) tr(P(dP)^(2k))` with `P = (1 + F)/2`" and "`k = 0`: `tr(F) = 2 dim W − dim V`".
**Claim:** `k` is unquantified and the Check instantiates `k = 0`, where the identity and the class formula `2^(2k+1) k! (2π/i)^k ch_k(W)` both give `2 dim W`.
**Witness:** `F = 2P − 1`: `tr(F(dF)^(2k)) = 2^(2k+1) tr(P(dP)^(2k)) − 2^(2k) tr((dP)^(2k))`; the last term is `0` only for `k ≥ 1`; at `k = 0` it is `dim V`.
**Repair:** State both for `k ≥ 1`. Replace the Check by: "`k = 0` is excluded: `tr(F) = 2 dim W − dim V` while `2 tr(P) = 2 dim W`; the identity uses `tr((dP)^(2k)) = 0`, which needs `k ≥ 1`."

## R02 (P2) — 2.6: Duhamel's formula is already proved at the pinned Tau Ceti

**Location:** README lines 154 and 364–373 ("**From Tau Ceti.** Nothing is consumed from the Tau Ceti library."; "Prove `hasDerivAt_exp_duhamel`"); `Suggested.lean` lines 192–198.
**Claim:** The target restates a pinned theorem and the supplier contract denies it.
**Witness:** `TauCeti.hasFDerivAt_exp` (`TauCeti/Analysis/SpecialFunctions/Exponential.lean:267`) and `TauCeti.expFDeriv_apply_eq_integral` (same file, 378). A scratch probe proves `hasDerivAt_exp_duhamel` from them by `comp_hasDerivAt` and `intervalIntegral.integral_comp_sub_left`.
**Repair:** Delete target 2.6 and `hasDerivAt_exp_duhamel`; remove Duhamel from Summary and "Owned here"; cite both declarations under "From Tau Ceti" (integrand `exp((1 − s)x) y exp(sx)`); in 4.3 and 4.4 replace "2.6" by those names; move the trace corollary `d/dt τ(exp F) = τ(F′ exp F)` to 4.3 as an API bullet.

## R03 (P2) — 1.2: the super tensor product is Mathlib's `GradedTensorProduct`, restated on matrices and not cited

**Location:** README lines 216–222 ("Prove `superMul_assoc` and `IsSuperHomogeneous.superMul` (parities add), the matrix form of the associativity of the super tensor product"); `Suggested.lean` lines 74–95.
**Claim:** The ring `A ⊗̂ End(R^(m|n))` with Quillen's sign exists at the pin; associativity is not a new theorem.
**Witness:** `Mathlib/LinearAlgebra/TensorProduct/Graded/Internal.lean:175` `instRing : Ring (𝒜 ᵍ⊗[R] ℬ)`; line 182 `tmul_coe_mul_coe_tmul` has sign `(-1)^(j₁ * i₂)`, Convention 1's rule; `Module (ZMod 2) (Additive ℤˣ)` at `Mathlib/Data/ZMod/IntUnitsPower.lean:44`.
**Repair:** In 1.2 define the block-parity grading `ℬ : ZMod 2 → Submodule R (Matrix (m ⊕ n) (m ⊕ n) R)` with its `GradedAlgebra` instance, take `A ⊗̂ End(R^(m|n))` to be `𝒜 ᵍ⊗[R] ℬ`, and replace `superMul_assoc` and `IsSuperHomogeneous.superMul` by one comparison target: the `R`-linear equivalence `𝒜 ᵍ⊗[R] ℬ ≃ Matrix (m ⊕ n) (m ⊕ n) A`, `a ᵍ⊗ₜ E k l ↦ a E k l`, carries the product to `superMul` and the tensor grading to `IsSuperHomogeneous`. Add `GradedTensorProduct` to "From Mathlib". Tested on 1.2's Check: `(1 ᵍ⊗ₜ E₂₁)(e ᵍ⊗ₜ E₁₁) = (−1)^(1·1) e ᵍ⊗ₜ E₂₁`.

## R04 (P2) — 3.2: the Pfaffian is defined only over `ℚ`-algebras

**Location:** README lines 418–421 ("`pfaffian Σ = (r!)⁻¹ ∫_B (skewForm Σ)^r` for a `2r × 2r` matrix over a commutative `ℚ`-algebra"); `Suggested.lean` lines 224–236 (`[Algebra ℚ R]`).
**Claim:** `Pf`, `Pf² = det` and `Pf(BΣBᵀ) = det B · Pf(Σ)` hold for alternating matrices over every commutative ring; the `1/r!` definition excludes `ℤ` and characteristic `p`.
**Witness:** `Σ = [[0, 1], [−1, 0]]` over `ℤ` or `𝔽₂`: `Pf = 1`, `Pf² = 1 = det`, not expressible with `[Algebra ℚ R]`. `TauCeti/LinearAlgebra/Matrix/Determinant/Skew.lean:28` names the arbitrary-ring identity as the missing statement.
**Repair:** Over a commutative ring define `Pf(Σ) = ∫_B ω^[r]`, `ω^[r] = ∑_(p₁ < ⋯ < p_r) ∏ₜ Σ_(pₜ) e_(iₜ) e_(jₜ)` over increasing `r`-tuples of pairs `pₜ = (iₜ < jₜ)`; state both identities for alternating `Σ` (`Σᵀ = −Σ` and zero diagonal); keep `Pf(Σ) = (r!)⁻¹ ∫_B ω^r` as a theorem over `ℚ`-algebras. Add the negative control: over `𝔽₂`, `Σ = [[1, 1], [1, 1]]` satisfies `Σᵀ = −Σ`, has `Pf = 1` and `det = 0`. Tested: the witness gives `ω^[1] = e₀e₁`, `Pf = 1`.

## R05 (P3) — `Suggested.lean`: two declarations are padding

**Location:** `Suggested.lean` lines 161–163 (`superTrace_dMat`) and 240–243 (`integral_gaussian_density`).
**Claim:** The first is linearity of `d` over a finite sum; the second is a Mathlib lemma renormalised and names no object of the roadmap.
**Witness:** A scratch probe closes the first with `simp [superTrace, dMat, map_sub, map_sum]`, and the second from `GaussianFourier.integral_rexp_neg_mul_sq_norm` (`Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330`, `b = 1/2`) with `integral_const_mul` and `Real.rpow_add`.
**Repair:** Delete both from `Suggested.lean`. The README keeps the statements in prose, without the backticked names, citing the Mathlib lemma in 3.3's `*Needs:*`.

## R06 (P3) — `Suggested.lean` docstring: two of the three "missing carriers" exist at the pin

**Location:** `Suggested.lean` lines 26–28: "lacking bundle-valued differential forms on manifolds, the exterior covariant derivative and de Rham cohomology at the pins".
**Claim:** The stated reason for not stating Layers 4, 5 and 6.2 is false for bundle-valued forms and de Rham cohomology.
**Witness:** `TauCeti.SmoothBundleForm` (`TauCeti/Geometry/Manifold/DifferentialForm/Smooth.lean:130`) with `wedgeWith` (`…/Wedge/Smooth/Bundle.lean:172`); `TauCeti.deRhamCohomology` (`TauCeti/Geometry/Manifold/DeRham/Basic.lean:127`).
**Repair:** Name what each headline actually lacks at the pin (the exterior covariant derivative on `SmoothBundleForm`, the ℤ/2-graded algebra `Ω(M, End E)` with its exponential, fibre integration), re-examine which headlines of Layers 4, 5 and 6.2 become statable on these carriers, and list the Tau Ceti declarations that Layers 4–5 use under "From Tau Ceti".

## R07 (P3) — pull request description repeats the false reason

**Location:** Description, "Acceptance test": "the docstring says so with the carriers they lack: bundle-valued differential forms, the exterior covariant derivative and de Rham cohomology".
**Claim:** The head's pinned Tau Ceti has two of the three.
**Witness:** As R06.
**Repair:** "…with the carriers they lack at the pins: the exterior covariant derivative on Tau Ceti's bundle-valued forms, the graded algebra `Ω(M, End E)` and fibre integration."

## R08 (P3) — 5.2: the operator that annihilates `S_(∇,s)` is `∇ + ι_s` under Conventions 1 and 4

**Location:** README lines 582–584: "`exp(−S_(∇,s))` is closed for the operator `d − ι_s` on `Ω(M, ΛE*)`".
**Claim:** With forms written to the left and the Koszul rule, `ι_s(ω ⊗ e) = (−1)^(|ω|) ω ⊗ ι_s e`, the sign is `+`.
**Witness:** `r = 1`, trivial flat `E`, `S = ½s² + ds · e`: `d(½s²) = s ds`, `ι_s(ds · e) = −s ds`; `(d + ι_s)S = 0`, `(d − ι_s)S = 2s ds`.
**Repair:** "`exp(−S_(∇,s))` is closed for the odd derivation `∇ + ι_s` of `Ω(M) ⊗̂ ΛE*`, where `ι_s(ω ⊗ e) = (−1)^(|ω|) ω ⊗ ι_s e`"; add the witness above as a Check of 5.2.

## R09 (P3) — Convention 2: `φ` is defined on even forms and applied to an odd form

**Location:** README lines 110–111 and 523–524: "`φ` multiplies forms of degree `2k` by `(2πi)^(−k)`"; "primitive `φ ∫₁^∞ str(X exp(−𝔸_t²)) dt`".
**Claim:** The primitive has odd degree, where `φ` has no value.
**Witness:** `str(X exp(−𝔸_t²))` has components of degree `2k − 1` only (`X` odd, `str` kills odd endomorphisms).
**Repair:** In Convention 2: "`φ` multiplies forms of degree `2k` and of degree `2k − 1` by `(2πi)^(−k)`, so that `φ d = d φ` on odd forms." Tested: `β` of degree `2k − 1` gives `φ(dβ) = (2πi)^(−k) dβ = d(φβ)`.

## R10 (P3) — locators are not exact, and one does not support its statement

**Location:** README, 48 locators in Layers 1–6; for example line 239: "(Quillen 1985; Berline–Getzler–Vergne, §1.3; Wu 2006, §2.3)".
**Claim:** "Quillen 1985" (12 times), "Mathai–Quillen 1986" (7), "Quillen 1988" (2), "Berline–Getzler–Vergne, Ch. 2" and "Ch. 9" carry no section, statement number or page. Wu §2.3 defines `str` only. "Garcia 2016" has a reference entry dated 2018.
**Witness:** Wu2006 lines 218–220 define the supertrace and its `Ω(M)`-linear extension; the vanishing on supercommutators is at Garcia2018 lines 1071–1072, for `End(V)`.
**Repair:** Give each of these a section or statement number and a page; in 1.3 replace "Wu 2006, §2.3" by "Garcia, §A.1 (the case `A = ℂ`)"; use one year for Garcia in text and References.

## R11 (P3) — Convention 3: a sentence without a verb

**Location:** README lines 119–120: "Quillen's skew-adjoint form `[[0, −T*], [T, 0]]` and writes the character with `exp(𝔸²)`".
**Claim:** The sentence does not say who uses which convention.
**Witness:** The line as quoted.
**Repair:** "Quillen uses the skew-adjoint `[[0, −T*], [T, 0]]` and writes the character with `exp(𝔸²)`; …".

## R12 (P3) — 6.1: the build paragraph and the `*Needs:*` line disagree

**Location:** README lines 184–185 ("whose algebra (6.1) uses only Mathlib") against line 661 ("*Needs:* SelfAdjointSpectralTheory SA-D24, SA-D27; Mathlib …") and line 704.
**Claim:** One of the two is wrong; a statement about finite complex matrices does not need the unbounded-operator Cayley transform.
**Witness:** `g*g = (1 + X)⁻¹(1 − X)(1 + X)(1 − X)⁻¹ = 1`, since `1 ± X` commute and `(1 ± X)* = 1 ∓ X`; `X = (iθ)`: `|(1 + iθ)/(1 − iθ)| = 1`.
**Repair:** Drop SA-D24 and SA-D27 from 6.1's `*Needs:*`, from Layer 6's Dependencies and from the supplier contracts; keep `g = −U_(−iX)` in Convention 5 and Scope as the comparison; give the route above.

## R13 (P3) — definitions carry no API lists, and two routes use facts that are not targets

**Location:** README line 313: "Route: `d(F^k) = −[Θ, F^k]` by 2.2, and `str` kills supercommutators (1.3)"; lines 220–221: "`σ` is an algebra automorphism with `σ² = 1`".
**Claim:** 2.2 proves only `[𝔸, F] = 0`; passing to `F^k` needs the Leibniz rule of `covD` over `superMul`, stated nowhere. No definition has an API bullet list.
**Witness:** `k = 2`: `[Θ, F ⋆ F] = [Θ, F] ⋆ F + F ⋆ [Θ, F]` is used and is not a target.
**Repair:** Add API bullets: `parityInv` is an `R`-algebra automorphism, an involution, `±1` on `𝒜 0`, `𝒜 1`, and `d σ = −σ d`; `superMul` is `R`-bilinear with unit `1`; for `X` of parity `p`, `covD (p + q) (X ⋆ Y) = covD p X ⋆ Y + (−1)^p X ⋆ covD q Y`; `superTrace` is `R`-linear and `str(covD p X) = d str X` on a supercommutative `A`.

## R14 (P3) — 2.4, third Check: the argument fails when 2 is a zero divisor

**Location:** README lines 342–344: "so is the left, since `str(Θ⁴) = str(Θ ⋆ Θ³) = −str(Θ³ ⋆ Θ) = −str(Θ⁴)` by 1.3".
**Claim:** This gives `2 str(Θ⁴) = 0`, not `str(Θ⁴) = 0`.
**Witness:** `A = 𝔽₂[x]`, `x` odd (supercommutative), `m = 1`, `n = 0`, `Θ = (x)`: `str(Θ⁴) = x⁴ ≠ 0`; with `∂ = x d/dx`, `∂ x⁴ = 4x⁴ = 0`.
**Repair:** "the left side is `∑_(i=0..3) str(Θ^i ⋆ ∂Θ ⋆ Θ^(3−i)) = (1 − 1 + 1 − 1) str(∂Θ ⋆ Θ³) = 0` by 1.3; `str(Θ⁴)` itself need not vanish (`A = 𝔽₂[x]`, `x` odd, `Θ = (x)`: `x⁴`)."

## R15 (P3) — 2.1: `SuperDGA` is not related to Tau Ceti's `IsDGAlgebra`

**Location:** README lines 271–276 ("Define the structure `SuperDGA 𝒜`: an `R`-linear map `d` that is odd …") and line 154.
**Claim:** The pinned Tau Ceti has ℤ-graded differential graded algebras with the same three axioms; the README neither cites them nor says how its `ZMod 2` structure differs. `SuperDGA` also carries no commutativity, against its docstring "A supercommutative differential graded algebra".
**Witness:** `TauCeti.IsDGAlgebra (𝒜 : ℤ → Submodule R A) d` at `TauCeti/Algebra/Homology/DG/Algebra/Defs.lean:206`: `map_mem`, `sq_zero`, `leibniz` with `p.negOnePow`.
**Repair:** Cite `TauCeti.IsDGAlgebra` under "From Tau Ceti"; add to 2.1 the target "a ℤ-graded `IsDGAlgebra 𝒜 d` gives a `SuperDGA` on the parity grading `i ↦ ⨆_(p ≡ i mod 2) 𝒜 p`", by which the forms on `ℝᵈ` become an instance; say in one clause that `SuperDGA` is the `ZMod 2`-graded notion; drop "supercommutative" from the docstring.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 exterior algebra supercommutative | `Λ(R²)`; `R = 𝔽₂` | `e₀e₁ = −e₁e₀`; `e₀(e₀e₁) = 0 = (e₀e₁)e₀`; over `𝔽₂` all signs are `+1` and `Λ` is commutative | holds | none |
| 1.2 `superMul` associative, parities add | `m = n = 1`, `A = Λ(R¹)`; general triple sum | `E₂₁ ⋆ eE₁₁ = σ(e)E₂₁ = −eE₂₁`; both bracketings `∑ X_ki σ^(k+i)(Y_ij) σ^(k+j)(Z_jl)` | holds | R03 |
| 1.3 `str(X ⋆ Y) = (−1)^(pq) str(Y ⋆ X)` | `E₁₂`, `E₂₁` over `ℤ`; general term | `1` and `−1`, `p = q = 1`; term signs `(−1)^(k+eq+e)` and `(−1)^(l+pq+qe)`, `e = k + l`, ratio `(−1)^(pq)` | holds | R10 (locator) |
| 2.1 `dMat` an odd derivation | homogeneous `X` of parity `p`; `dx · y` on `ℝ²` | `d(X ⋆ Y) = dX ⋆ Y + (−1)^p X ⋆ dY` using `dσ = −σd`; `d(dx·y) = −dx∧dy` both ways | holds | R15 |
| 2.2 Bianchi | general odd `Θ`; `Θ = [[0,1],[1,0]]`, `d = 0` | `dF = dΘ⋆Θ − Θ⋆dΘ`, `[Θ,F] = Θ⋆dΘ − dΘ⋆Θ`, sum `0`; wrong sign gives `2Θ³ = 2Θ` | holds | none |
| 2.3 `d str(F^k) = 0` | `k = 0`; `A = R`, `d = 0`; `k = 2` | `d(m − n) = 0`; `tr((T*T)^k) − tr((TT*)^k) = 0`; needs `covD` Leibniz | holds | R05, R13 |
| 2.4 transgression | `k = 0`; `k = 1`, `d = 0`; `𝔽₂[x]` | `d str(∂Θ) + str(∂Θ⋆Θ + Θ⋆∂Θ) = d str(∂Θ)`; alternating sum `0 = 0`; `str(Θ⁴) = x⁴`, `∂ = 0` on it | holds | R14 |
| 2.5 `tr exp(−tT*T) − tr exp(−tTT*) = m − n` | `T = (1, 0)`; `T = 0`; `m = 0`, `n = 1` | `(e^(−t) + 1) − e^(−t) = 1 = 2 − 1`; `m − n`; `0 − 1 = −1` | holds | none |
| 2.6 Duhamel | `F(s) = [[1, s], [0, 0]]` | integrand `e^u F′`, integral `(e − 1)F′`; derivative of `[[e, s(e−1)], [0, 1]]` is `(e − 1)F′` | holds; in Tau Ceti | R02 |
| 3.1 `berezin_map` | swap of `e₀`, `e₁`; `n = 0` | `det = −1`, `∫_B e₁e₀ = −1`; `det = 1`, `Λ(f) = id` | holds | none |
| 3.2 Pfaffian identities | `2 × 2`; `4 × 4`; `r = 0`; `𝔽₂` | `a² = det`; `ω² = 2(Σ₀₁Σ₂₃ − Σ₀₂Σ₁₃ + Σ₀₃Σ₁₂)`; `1 = det`; `Λ(B)ω_Σ = ω_(BΣBᵀ)`; no value over `𝔽₂` | holds over `ℚ`-algebras | R04 |
| 3.3 Gaussian density | `r = 0`, `r = 1` | `1`; `√(2π)/√(2π) = 1`; probe closes from Mathlib | holds | R05 |
| Convention 4 sign | `r = 1, 2`, general | `(−1)^r (−1)^(r(r−1)/2) = (−1)^(r(r+1)/2)`: `−dx₁`, `−dx₁dx₂`; Wu2006 lines 90–99, 160–167 agree | holds | none |
| 4.1 supertrace on `Ω(M, End E)` | Koszul rule against source | Garcia2018 lines 1075–1083: `(ω⊗u)(η⊗v) = (−1)^(deg η deg u)`, `str(ω⊗u) = ω str u`; same as Convention 1 | agrees | none |
| 4.2 superconnections | even and odd `u` of degree 0 | `(∇+u)²(fs) − f(∇+u)²s = u(df s) + df∧us`: `2df∧us` (even), `0` (odd); Garcia2018 line 1086 | holds | none |
| 4.3 and Convention 2 | line bundle `F = i dα`; series of 2.4 | `φ(−F) = −dα/2π = (i/2π)F`; `∂ str exp(−F) = −d str(∂Θ exp(−F))`; Garcia2018 line 1113 with `exp(+)` | holds | R02 (Needs) |
| 4.4 character of `∇ + tX` | `T = z` on `ℝ²`; primitive sign | `str((dX)²) = 2dz∧dz̄`; `ch = −(t²/π)e^(−t²│z│²)dx∧dy`, integral `−1`; `str e^(−𝔸₁²) = d∫₁^∞ str(X e^(−𝔸_t²))dt` | holds | R09 |
| 5.1 Euler form | `r = 2`, `R = [[0, −dα], [dα, 0]]`; odd `r` | `Pf(R) = −dα`, `e = −dα/2π`, CharacteristicClasses README line 207; `0`; Wu2006 lines 145–149 | holds | none |
| 5.2 `e_(∇,s)` | `s = 0`, even `r`; `s = βx`; `r = 1` operator | `(−1)^(r(r+1)/2)(−1)^(r/2) = 1`; integral `1`; `(d − ι_s)S = 2s ds`, `(d + ι_s)S = 0` | statement holds | R08 |
| 5.3 localization, Poincaré–Hopf | `S²`; flat `T²`; odd dimension | `2 = 2`; `0 = 0`; `e(∇) = 0 = χ`; (a) at Wu2006 lines 176–184 | holds | none |
| 5.4 Thom form | `M` a point; `r = 1` | Gaussian of integral `1`; `0*τ = 0 = e(∇)`; Wu2006 lines 199–201, 209–210 | holds | none |
| 6.1 Cayley transform | `X = [[0, −a], [a, 0]]`; `X = diag(iθ, 0)`; Convention 5 | `g = (1+a²)⁻¹[[1−a², −2a], [2a, 1−a²]]`, `εg(1, −a) = (1, −a)`; `εgε = g ≠ g⁻¹`; `U_(−iX) = −g` | holds | R12 |
| 6.2 invariant forms | `k ≥ 1`; `k = 0` | `2^(2k+1)tr(P(dP)^(2k)) − 2^(2k)tr((dP)^(2k))`, last `0`; `2 dim W − dim V` against `2 dim W` | false at `k = 0` | R01 |

- Source locators checked against the text: 10 (Wu2006 §2.1, (2.1), (2.3), (2.4)–(2.5), (2.6), (2.7), §2.3; Garcia2018 §A.1, (A.9), §A.2–A.3).
- Library declarations opened at the pins: `Matrix.trace_mul_pow_comm_of_ne_zero` (`Mathlib/LinearAlgebra/Matrix/Trace.lean:172`), `exteriorPower.alternatingMapLinearEquiv` (`…/ExteriorPower/Basic.lean:212`), `ExteriorAlgebra.gradedAlgebra` (`…/ExteriorAlgebra/Grading.lean:75`), `CliffordAlgebra.gradedAlgebra` (`…/CliffordAlgebra/Grading.lean:114`), and those named in R02–R06 and R15. No Pfaffian, supertrace or Berezin integral at either pin.
- Cross-roadmap citations resolved on main: CharacteristicClasses Conventions, C2 items 1, 3, 5, C4 items 1–2; DifferentialGeometry Layers 0, 1, 2, 5, 6; SmoothBundlesConnections B3.3, B4.1; SelfAdjointSpectralTheory SA-D24, SA-D27; SymplecticFieldTheory §0.3; HeegaardFloer F0.0; IndexTheory 8.2; NoncommutativeGeometry scope.
- Dependency check: `depcheck: 240 roadmaps, 2176 edges, 0 problem(s)`. The worker's gate passed every check.
- Elaboration: a scratch copy of `Suggested.lean` elaborates with `sorry` as the only warning; one-tactic probe (`simp` with the definitions unfolded, `rfl`) closes none of the 17 theorems; targeted probes close three (R02, R05).
- `#check` comparison: the 11 dropped binders are `Fintype`/`DecidableEq` instances that the types do not need; nothing changes.
- Duplication audit: no other roadmap, on main or open, states a supertrace on `A ⊗̂ End`, a superconnection, a Berezin integral or a Mathai–Quillen form; AbelianSchemesAndArithmeticModuli A5.4 uses a Pfaffian identity and defines none.
- Overlap check: read IndexTheory, SpinGeometry, CalibratedGeometry; nothing shared.

Source independence: 11 passages compared with 2 sources (Wu2006, Garcia2018), none shared beyond forced phrases (longest run 7 words, README 5.4 against Wu2006 line 200); largest share Berline–Getzler–Vergne, 15 of 48 locators, text and table of contents not readable; by the section numbers the README cites, Layers 1 and 3 ↔ §1.3, Layers 2 and 4 ↔ §1.4, Layer 5 ↔ §1.6, which is not one to one.

## Not verifiable

- Quillen 1985, Mathai–Quillen 1986, Quillen 1988 (Topology) and Berline–Getzler–Vergne 1992: the sources service resolves each only to a paywalled page; recorded as uncertified.
- Sampled targets whose locators rest on those texts alone: 2.1, 2.2, 2.3, 2.5, 2.6 (Berline–Getzler–Vergne, Ch. 2), 4.4 (Ch. 9), 6.1 and 6.2 (Quillen 1988).
- Berline–Getzler–Vergne, Proposition 1.41: Garcia2018 line 1114 attributes the transgression formula to it; its closedness part and the §1.3, §1.4, §1.6 locators were not read.
- That the exterior covariant derivative on bundle-valued forms is absent from the pinned Tau Ceti rests on a search for its names, not on a reading of every module.

## Source issues

- **Misprint** in Wu2006 at (2.6), printed page 2: the source says the closed test form has degree `n − m` under the condition `n ≥ m`, letters not defined for the bundle there; it should be degree `dim M − r` with `dim M ≥ r`; affects nothing.

## For the human reviewers

- **Not tested.** Berline–Getzler–Vergne has the largest share of the locators (15 of 48); its text and table of contents could not be read, so wording and arrangement were not compared with it.
- **Scope.** README lines 739–740 mention Quillen's unpublished notebooks (Clay Mathematics Institute) in "Research context"; no target cites them.
