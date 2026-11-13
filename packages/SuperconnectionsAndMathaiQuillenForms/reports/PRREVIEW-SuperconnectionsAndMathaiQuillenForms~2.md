# Review of SuperconnectionsAndMathaiQuillenForms (pull request #2297 at edffd72)

**Verdict:** needs changes

## R01 (P1) — 6.2: the manifolds `Gr(V)` and `U(V)` and the tautological bundle have no owner

**Location:** `TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md` lines 825–838: "On the manifold `Gr(V)` of self-adjoint involutions `F` … and on `U(V)`, prove that …"; "*Needs:* 1.3, 4.3; CharacteristicClasses C4, item 2; DifferentialGeometry Layers 0–1, 6."
**Claim:** The smooth structures on `{F | F* = F, F² = 1}` and on `U(V)`, and the smooth bundle `W` with connection `P d P`, are used and are neither targets nor cited.
**Witness:** `Suggested.lean` lines 40–42: 6.2 is not stated, "lacking the manifold structures of the space of self-adjoint involutions of `ℂⁿ` and of `Matrix.unitaryGroup` at the pins". No `*Needs:*` item supplies them.
**Repair:** Cite LieGroups Layer 2 (the classical matrix groups as embedded Lie subgroups of `GL_n`) for `U(V)`. Add to 6.2 the target: "`{F ∈ Herm(V) | F² = 1}` is a closed embedded submanifold of the real vector space `Herm(V)`, with tangent space `{Ḟ | FḞ + ḞF = 0}` at `F`; its components are the `U(V)`-conjugation orbits `tr F = 2k − N`, of dimension `2k(N − k)`; the image of `P = (1 + F)/2` is a smooth subbundle `W` of the trivial bundle, with connection `P d P`", with Checks `V = ℂ` (two points) and `V = ℂ²` (point ⊔ `S²` ⊔ point, `F = x·σ`). Add both to `*Needs:*`, Dependencies and the supplier contracts. Tested on `V = ℂ`: dimension `0`, `tr(F(dF)^(2k)) = 0 = ch_k(W)` for `k ≥ 1`.

## R02 (P2) — 1.1: supercommutativity of the exterior algebra is a pinned Mathlib lemma

**Location:** README lines 235–238 ("Prove `isSuperCommutative_exteriorAlgebra` … Route: check it on products of generators … induction on length"); `Suggested.lean` lines 63–67.
**Claim:** The target, and its route, restate a Mathlib theorem at `Q = 0`.
**Witness:** `CliffordAlgebra.map_mul_map_of_isOrtho_of_mem_evenOdd` (`Mathlib/LinearAlgebra/CliffordAlgebra/Prod.lean:54`): `map f₁ m₁ * map f₂ m₂ = (-1 : ℤˣ) ^ (i₂ * i₁) • (map f₂ m₂ * map f₁ m₁)`. With `f₁ = f₂ = QuadraticMap.Isometry.id 0` a seven-line scratch proof closes the theorem.
**Repair:** Delete `isSuperCommutative_exteriorAlgebra` from `Suggested.lean` and from the Summary's end theorems. In 1.1 replace the sentence by: "The exterior algebra, graded by `CliffordAlgebra.evenOdd` of the zero form, satisfies `IsSuperCommutative`: Mathlib's `CliffordAlgebra.map_mul_map_of_isOrtho_of_mem_evenOdd` with both isometries the identity, every two vectors being orthogonal for the zero form." Add the lemma to "From Mathlib" (`LinearAlgebra/CliffordAlgebra/Prod`).

## R03 (P2) — 3.2: the Pfaffian has an owner on main, RandomMatrices §8.5

**Location:** README lines 46–48: "**Owned here.** … the Pfaffian of an alternating matrix over a commutative ring as a Berezin integral with its identities"; 3.2, lines 513–521.
**Claim:** A roadmap on main already develops Pfaffians with the same two identities; Scope names no other owner and does not say how 3.2 differs.
**Witness:** `TauCetiRoadmap/RandomMatrices/README.md` lines 1295–1313: "Develop Pfaffians, de Bruijn integration …", Checks `Pf [[0,a],[-a,0]] = a`, `Pf² = det`, `Pf(BABᵀ) = det B · Pf A`.
**Repair:** Add to Scope: "**Shared with RandomMatrices.** RandomMatrices §8.5 develops the Pfaffians of real skew matrices for its GOE kernels. 3.2 is the definition over every commutative ring, as the Berezin integral of the divided power, with `Pf² = det` and `Pf(BΣBᵀ) = det B Pf(Σ)` for alternating matrices; over `ℝ` it is RandomMatrices' Pfaffian." Add as a Check of 3.2 that both give `Pf([[0,a],[−a,0]]) = a` and, for `4 × 4`, `Σ₀₁Σ₂₃ − Σ₀₂Σ₁₃ + Σ₀₃Σ₁₂` (RandomMatrices' `a₁₂a₃₄ − a₁₃a₂₄ + a₁₄a₂₃`). Tested: the two formulas agree term by term.

## R04 (P2) — 4.4 (b): the kernel bundle is asserted, not supplied

**Location:** README lines 660–662 and 670: "if `ker T` and `ker T*` have locally constant rank, so that `K = ker X` is a ℤ/2-graded subbundle with the compressed connection `∇^K = P_K ∇ P_K`"; "*Needs:* 2.5, 4.3; Tau Ceti `TauCeti.expFDeriv_apply_eq_integral`; DifferentialGeometry Layer 6."
**Claim:** That the kernel of a smooth endomorphism of locally constant kernel rank is a smooth subbundle with smooth projection is used and is neither a target nor a cited supplier.
**Witness:** None of 2.5, 4.3, the Tau Ceti declaration or DifferentialGeometry Layer 6 states it; DifferentialGeometry and SmoothBundlesConnections B1.0 treat only kernel distributions of submersions.
**Repair:** Add to 4.4, before (b): "Prove that for a smooth self-adjoint endomorphism `X` of a Hermitian bundle whose kernel has locally constant rank, `P_K = (1/2πi) ∮_(|z|=ε) (z − X)⁻¹ dz` is, for small `ε` locally, a smooth projection onto `ker X`, so `ker X` is a smooth subbundle, graded when `X` is odd." Tested on the section's Check `T = z`: the rank jumps at `0`, no such `ε` exists there, and `P_K` is discontinuous.

## R05 (P3) — 5.3 (a): the route uses CharacteristicClasses C5, item 5, which is not cited

**Location:** README lines 748–752: "(a) by 5.2, Stokes and CharacteristicClasses C2, item 3, which identifies the class of `e(E)` with the Poincaré dual of `Z`"; "*Needs:* 3.3, 5.1, 5.2; CharacteristicClasses C2, item 3; DifferentialGeometry Layers 2, 5."
**Claim:** C2, item 3 is about the topological Euler class; passing to the class of `Pf(R/2π)` is another section.
**Witness:** `TauCetiRoadmap/CharacteristicClasses/README.md` line 1335: "C5.5 proves the Euler/Pfaffian comparison"; lines 1413–1417 (C5, item 5) "identify C4's Pfaffian class with the real image of the integral Euler class".
**Repair:** Add "CharacteristicClasses C5, item 5 (the Pfaffian class is the real image of the Euler class)" to 5.3's `*Needs:*`, to Layer 5's Dependencies and to "From CharacteristicClasses". (Deriving (a) from (b) and the `β`-independence of 5.2 needs neither.)

## R06 (P3) — 5.3 (c) has no locator

**Location:** README lines 746–747: "`∫_M Pf(R/2π) = ∑_(s(p)=0) sign det(∇s(p)) = χ(M)` (Wu 2006, §2.2, (2.6), p. 2, for (a) and (b))".
**Claim:** The locator covers (a) and (b) only.
**Witness:** The parenthesis as quoted; Wu2006 lines 23–26 (§1, p. 1) state the count of zeros of a vector field and its equality with the Euler characteristic.
**Repair:** "(Wu 2006, §2.2, (2.6), p. 2, for (a) and (b); Wu 2006, §1, p. 1, and CharacteristicClasses C2, item 3, for (c))".

## R07 (P3) — 6.1: the correspondence is with graphs, not all subspaces, and only one direction is a target

**Location:** README lines 803–805: "this is Quillen's correspondence between odd skew-adjoint `X`, unitaries `g` with `εgε = g⁻¹` and `−1 ∉ spec(g)`, and subspaces `W`".
**Claim:** Only subspaces `W` with `W ∩ E⁻ = 0` and `dim W = m` occur, and the converse map is stated nowhere.
**Witness:** `εg w = w` iff `w ∈ (1 − X)E⁺ = {(v, −Tv)}`, the graph of `−T`. `W = E⁻` gives `εg = −ε`, `g = −1`, which is excluded.
**Repair:** "…and subspaces `W` with `W ∩ E⁻ = 0` and `dim W = m`: for `X = [[0, −T*], [T, 0]]`, `W = (1 − X)E⁺` is the graph of `−T`. Prove the converse: a unitary `g` with `εgε = g⁻¹` and `−1 ∉ spec(g)` is `cayley X` for the odd skew-adjoint `X = (g − 1)(g + 1)⁻¹`." Tested on the second Check: `T = a`, `W` spanned by `(1, −a)`.

## R08 (P3) — 2.1: nothing supplies `GradedAlgebra (parityGrading 𝒜)`

**Location:** README lines 359–360 ("if `TauCeti.IsDGAlgebra 𝒜 d` and the parity regrading is a grading"); `Suggested.lean` lines 259–260 (`[GradedAlgebra (parityGrading 𝒜)]`).
**Claim:** The hypothesis always holds, but no target or pinned instance provides it, so the comparison applies to no ℤ-graded algebra as stated.
**Witness:** On a scratch copy, `example {𝒜 : ℤ → Submodule R A} [GradedAlgebra 𝒜] : GradedAlgebra (parityGrading 𝒜) := by infer_instance` fails; `Mathlib/RingTheory/GradedAlgebra/Basic.lean` has no regrading along `ℤ → ZMod 2`.
**Repair:** Add to 2.1's API: "For a ℤ-graded algebra `𝒜`, `parityGrading 𝒜` is a `ZMod 2`-graded algebra: `1 ∈ 𝒜 0`, `𝒜 p · 𝒜 q ⊆ 𝒜 (p + q)`, and the component of parity `i` of `a` is the sum of its components of degrees `≡ i`." Tested on `ℤ[x]` graded by degree: even and odd polynomials.

## R09 (P3) — definitions without API lists (previous R13, partly repaired)

**Location:** README 3.1 (lines 494–509), 6.1 (800–821), 4.1, 4.2, 5.1, 5.2: a definition followed by Checks only.
**Claim:** `berezin`, `grading`, `cayley`, the bundle supertrace, superconnections, the fibrewise Berezin integral and `e_(∇,s)` have no `**API.**` bullets.
**Witness:** 3.1 passes from "*Needs:*" (line 500) to "**Checks.**" (line 503).
**Repair:** Add, for 3.1: "`∫_B` vanishes on `⋀^i` for `i ≠ n`; `∫_B e_(σ0) ⋯ e_(σ(n−1)) = sign σ`; `∫_B (ι_v x) = 0`." For 6.1: "`ε² = 1`, `ε* = ε`; `cayley 0 = 1`; `cayley X` commutes with `X`; for skew-adjoint `X`, `(cayley X)* = cayley (−X) = (cayley X)⁻¹` and `X = (g − 1)(g + 1)⁻¹`." For 4.1–5.2: linearity over `Ω(M)`, naturality under pullback, and compatibility with direct sums, one bullet each. Tested: `X = (iθ)`: `(g − 1)/(g + 1) = iθ`.

## R10 (P3) — locators that are not exact (previous R10, partly repaired)

**Location:** README lines 664–665: "Berline–Getzler–Vergne, Ch. 9, "The Index Bundle", pp. 263–310, for (b)"; lines 805–806 and 831–832: "Quillen 1988, … as described in its review Zbl 0671.57013".
**Claim:** A 48-page chapter is not a locator for one limit theorem, and a review is cited where the paper's section or statement number belongs.
**Witness:** The two parentheses as quoted; no section, statement or page of Quillen 1988 appears in 6.1 or 6.2.
**Repair:** Give the section and statement number of the finite-dimensional limit theorem in Chapter 9, and the section and page of Quillen 1988 for the correspondence and for `γ_(2k)`, `γ_(2k−1)`; keep the review only as where the statement was read.

## R11 (P3) — process words in the README

**Location:** README lines 53–55: "A search of the roadmaps on main, of the open pull requests and of the maintainers' packages for superconnection … finds no other owner"; line 862: "No roadmap on main or in the open pull requests consumes …".
**Claim:** Both sentences describe the state of the repository at one date.
**Witness:** The sentences as quoted ("open pull requests", "maintainers' packages").
**Repair:** "No other roadmap owns superconnections, the supertrace on `A ⊗̂ End(R^(m|n))`, the Berezin integral, the Mathai–Quillen forms, the Thom form, Quillen's character or the graded Cayley transform." and "No roadmap consumes SuperconnectionsAndMathaiQuillenForms."

## R12 (P3) — `Suggested.lean`: titles differ from the README's

**Location:** `Suggested.lean` line 7 ("# Superconnections and Mathai–Quillen forms: target signatures"), line 10 ("against the pinned Mathlib"), line 403 ("## Layer 6: the Cayley transform of odd skew-adjoint endomorphisms").
**Claim:** The module title and the Layer 6 heading are not the README's, and the file is also stated against Tau Ceti.
**Witness:** README line 1 and line 796 ("## Layer 6: the Cayley transform and invariant character forms"); `Suggested.lean` line 4 imports `TauCeti.Algebra.Homology.DG.Algebra.Defs`.
**Repair:** "# Superconnections, Quillen's character forms and Mathai–Quillen forms: target signatures"; "against the pinned Mathlib and Tau Ceti"; "/-! ## Layer 6: the Cayley transform and invariant character forms -/".

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 exterior algebra supercommutative | `Λ(R²)`; `Q = 0` in Mathlib's lemma | `e₀e₁ = −e₁e₀`; lemma gives `(−1)^(i₂i₁)`, scratch proof closes | holds; in Mathlib | R02 |
| 1.2 `superMatrixEquiv_mul`, parity of `a ᵍ⊗ₜ b` | `m = n = 1`, `A = Λ(R¹)`; general pure tensors | `E₂₁ ⋆ eE₁₁ = σ(e)E₂₁ = −eE₂₁ = (−1)^(1·1)`; entry `b_kl a ∈ 𝒜 i` when `│k│+│l│ = j`, else `0` | holds | none |
| 1.3 `str(X ⋆ Y) = (−1)^(pq) str(Y ⋆ X)` | `E₁₂`, `E₂₁` over `ℤ`; general term, `e = │k│+│l│` | `1`, `−1`; signs `(−1)^(│k│+e(q+e))` and `(−1)^(│l│+e(p+e))`, entries swap by `(−1)^((p+e)(q+e))`, ratio `(−1)^(pq)` | holds | none |
| 2.1 `exists_superDGA_of_isDGAlgebra` | `a ∈ 𝒜 p`; instance search | `σ(a) = (−1)^p a = p.negOnePow • a`, `d𝒜 p ⊆ 𝒜 (p+1)`; `infer_instance` fails for the regrading | holds | R08 |
| 2.2 Bianchi | general odd `Θ`; `Θ = [[0,1],[1,0]]`, `d = 0` | `d(Θ⋆Θ) = dΘ⋆Θ − Θ⋆dΘ`, `[Θ,F] = Θ⋆dΘ − dΘ⋆Θ`, sum `0`; wrong sign `2Θ³ = 2Θ` | holds | none |
| 2.3 `d str(F^k) = 0` | `k = 0`; `A = ℂ`, `d = 0` | `d((m − n)·1) = 0`; `tr((T*T)^k) − tr((TT*)^k) = 0`, `k ≥ 1` | holds | none |
| 2.4 transgression | `k = 0`; `𝔽₂[x]`, `Θ = (x)`, `k = 1`; series | `str(∂Θ⋆Θ) + str(Θ⋆∂Θ) = 0`; `∂x⁴ = 4x⁴ = 0 = 2d(…)`; `∂ str e^(−F) = −d str(∂Θ e^(−F))` | holds | none |
| 2.5 `tr e^(−tT*T) − tr e^(−tTT*) = m − n` | `T = (1, 0)`; `m = 0`, `n = 1`; `T = 0` | `(e^(−t) + 1) − e^(−t) = 1`; `0 − 1 = −1`; `m − n` | holds | none |
| 3.1 `berezin_map` | swap on `Λ(R²)`; `n = 0` | `det = −1`, `∫_B e₁e₀ = −1`; `det = 1`, identity | holds | R09 |
| 3.2 Pfaffian identities | `2×2`; `4×4`; `r = 0`; `𝔽₂`, `Σ = [[1,1],[1,1]]`, `B = [[1,1],[0,1]]` | `a`, `a² = det`; three sets, signs `+ − +`; `1 = det`; `Pf(BΣBᵀ) = 0 ≠ 1 = det B·Pf Σ` without zero diagonal | holds for alternating `Σ` | R03 |
| 3.3 Gaussian density | `r = 0`, `1` | `1`; `√(2π)/√(2π)`; Wu2006 lines 99–100 | holds | none |
| Convention 4 sign | `r = 1, 2`, general | `(−1)^r(−1)^(r(r−1)/2) = (−1)^(r(r+1)/2)`: `−dx₁`, `−dx₁dx₂`; Wu2006 lines 90–99 | holds | none |
| 4.1 supertrace on `Ω(M, End E)` | sign rule against both sources | Garcia2018 line 1078 `(−1)^(deg η deg u)`; Wu2006 line 217 `(−1)^(│T││β│)`; Convention 1 the same | agrees | R09 |
| 4.3 character form, Convention 2 | line bundle `F = i dα`; Garcia's normalisation | `φ(−F) = −dα/2π = (i/2π)F`; `(2πi)^(−p)(−F)^p = (−2πi)^(−p)F^p`, Garcia2018 line 1098 | holds | none |
| 4.4 character of `∇ + tX` | `T = z` on `ℝ²`; primitive against Wu | `str((dX)²) = 2dz∧dz̄`, `ch = −(t²/π)e^(−t²│z│²)dx∧dy`, integral `−1`; Wu2006 lines 232–238 give the same sign | (a) holds | R04, R10 |
| 5.1 Euler form | `r = 2`, `R = [[0,−dα],[dα,0]]`; odd `r` | `Pf(R) = −dα`, `e = −dα/2π`, CharacteristicClasses README line 207; `0`, Wu2006 line 71 | holds | R09 |
| 5.2 `e_(∇,s)` | `s = 0`, `r` even; `s = x`; `r = 1` operator | `(−1)^(r(r+1)/2)(−1)^(r/2) = 1`; Gaussian of integral `1`; `(d + ι_s)S = s ds − s ds = 0` | holds | R09 |
| 5.3 localization, Poincaré–Hopf | `s = x` on `ℝʳ`, `ω = 1`; `S²`; flat `T²` | `∫e = 1 = sign det(1)`; `2 = 2`; `0 = 0`; (a) Wu2006 lines 176–184 | holds | R05, R06 |
| 5.4 Thom form | `M` a point; `r = 1`; `ρ(y) = y/√(1−│y│²)` | Gaussian, integral `1`; `0*τ = 0 = e(∇)`; `exp(−│y│²/(2(1−│y│²)))` flat at `│y│ = 1`; Wu2006 lines 199–210 | holds | none |
| 6.1 Cayley transform | `X = [[0,−a],[a,0]]`; `X = diag(iθ, 0)`; `W = E⁻` | `εg(1,−a) = (1,−a)`, `W = (1−X)E⁺`; `εgε = g ≠ g⁻¹`; `g = −1` excluded; `U_(−iX) = −g` | theorems hold; prose overclaims | R07, R09, R10 |
| 6.2 invariant forms | `k ≥ 1`; `k = 0`; `ℂP¹`; `U(1)` | `2^(2k+1)tr(P(dP)^(2k)) − 2^(2k)·0`; `2 dim W − dim V ≠ 2 dim W`, excluded; `−1`; `2πi` | holds for `k ≥ 1` | R01, R10 |

| Previous finding | Passage at this head | Status |
|---|---|---|
| R01 (6.2, `k = 0`) | "for `k ≥ 1` `tr(F(dF)^(2k)) = 2^(2k+1) tr(P(dP)^(2k))`"; "`k = 0` is excluded" | repaired |
| R02 (Duhamel) | "**From Tau Ceti** … `TauCeti.hasFDerivAt_exp` … `TauCeti.expFDeriv_apply_eq_integral`"; target 2.6 and its declaration are gone | repaired |
| R03 (`GradedTensorProduct`) | "`A ⊗̂ End(R^(m|n))` is Mathlib's `𝒜 ᵍ⊗[R] blockGrading R m n`"; `superMatrixEquiv_mul` | repaired |
| R04 (Pfaffian over rings) | "`pfaffian Σ = ∫_B skewFormDivPow Σ r`"; "The zero diagonal is needed: over `𝔽₂` …" | repaired |
| R05 (padding) | `superTrace_dMat` and `integral_gaussian_density` are not in `Suggested.lean` | repaired |
| R06, R07 (missing carriers) | "the headlines lack, at the pins, the exterior covariant derivative of a connection on `TauCeti.SmoothBundleForm` …" | repaired |
| R08 (`∇ + ι_s`) | "closed for the odd derivation `∇ + ι_s` of `Ω(M) ⊗̂ ΛE*`" | repaired |
| R09 (`φ` on odd forms) | "of degree `2k` and of degree `2k − 1` by `(2πi)^(−k)`" | repaired |
| R10 (locators) | "Garcia 2018, §A.1, (A.1) and (A.4), p. 23"; "Ch. 9, "The Index Bundle", pp. 263–310" | partly: R10 |
| R11, R12, R14, R15 | "Quillen 1988 uses the skew-adjoint …"; 6.1 "*Needs:* Mathlib …"; "`(1 − 1 + 1 − 1) str(∂Θ ⋆ Θ³)`"; `exists_superDGA_of_isDGAlgebra` | repaired |
| R13 (API lists) | **API.** blocks in 1.1–1.3, 2.1–2.3, 3.2, 4.3 | partly: R09 |

- Source locators checked against the text: 21 (Wu2006 §1, §2.1, (2.1), (2.3)–(2.7), §2.3 with (2.8) and the formula after it, §3.1, §5; Garcia2018 (A.1)–(A.5), (A.7)–(A.9), (A.11), (A.15)).
- Library declarations opened at the pins: `CliffordAlgebra.map_mul_map_of_isOrtho_of_mem_evenOdd` (`Mathlib/LinearAlgebra/CliffordAlgebra/Prod.lean:54`), `Matrix.trace_mul_pow_comm_of_ne_zero` (`…/Matrix/Trace.lean:172`), `GaussianFourier.integral_rexp_neg_mul_sq_norm` (`…/Gaussian/FourierTransform.lean:330`), `TauCeti.IsDGAlgebra` (`TauCeti/Algebra/Homology/DG/Algebra/Defs.lean:206`), `TauCeti.hasFDerivAt_exp` and `TauCeti.expFDeriv_apply_eq_integral` (`…/SpecialFunctions/Exponential.lean:267, 378`), `TauCeti.CurvatureForm`, `SmoothBundleForm.wedgeWith`, `TauCeti.deRhamCohomology`, `TauCeti.gradedTensorGrading` (ℤ-indexed only). No Pfaffian, Berezin integral or matrix Cayley transform at either pin.
- Cross-roadmap citations resolved on main: CharacteristicClasses Conventions, C2 items 1, 3, 5, C4 items 1–2; DifferentialGeometry Layers 0, 1, 2, 5, 6; SmoothBundlesConnections B3.3, B4.1; SelfAdjointSpectralTheory SA-D24, SA-D27; HeegaardFloer F0.0; NoncommutativeGeometry N1–N2; SymplecticFieldTheory §0.3; IndexTheory 8.2.
- Dependency check: `depcheck: 240 roadmaps, 2170 edges, 0 problem(s)`; the worker's gate passed every check; nothing changes outside the folder.
- Elaboration: `Suggested.lean` elaborates with 16 `sorry` warnings and nothing else. The one-tactic probe (`rfl`, `simp`, `simp` with all definitions, `infer_instance`) closes none of the 16; the targeted probe of R02 closes one.
- `#check` comparison: the 10 dropped binders are `Fintype` and `DecidableEq` instances that the types do not mention; each elaborated type agrees with its README statement.
- Duplication audit: no other roadmap, on main or open, states a supertrace on `A ⊗̂ End`, a superconnection, a Berezin integral or a Mathai–Quillen form; no fully qualified name of `Suggested.lean` occurs in another roadmap's Lean file; AbelianSchemesAndArithmeticModuli A5.4 and SiegelModularForms use a Pfaffian identity and define none.
- Overlap check: read SpinGeometry, IndexTheory (the only roadmaps the three lists name) and, by object, RandomMatrices and CharacteristicClasses; shared: the Pfaffian, owner RandomMatrices §8.5 (R03); `e(TM)[M] = χ(M)`, owner CharacteristicClasses C2 item 3, consumed by 5.3 and re-derived by IndexTheory 7.1.

Source independence: 12 passages compared with 2 sources (Wu2006, Garcia2018), none shared beyond forced phrases (longest run 8 words, README 5.4 against Wu2006 line 200); largest share Wu2006, 22 of 51 locators; contents compared with Wu2006: Layer 3 ↔ §2.1 in part, Layer 5 ↔ §2.2, Layer 4 ↔ §2.3 in part, in a different order, and Layers 1, 2, 6 have no counterpart: independent. The contents of Berline–Getzler–Vergne (14 locators) could not be read.

## Not verifiable

- Berline–Getzler–Vergne 1992 (§1.3, §1.4, §1.6, Proposition 1.41, Ch. 9): paywalled, settled as uncertified; Garcia2018 line 1114 confirms only that Proposition 1.41 is the transgression formula.
- Quillen 1988 and its review Zbl 0671.57013 (6.1, 6.2): the paper is paywalled, and the zbMATH page refused the request (HTTP 403); the correspondence and the forms `γ_(2k)`, `γ_(2k−1)` were checked by computation only.
- 4.4 (b): the limit `ch(𝔸_t) → ch(K⁺) − ch(K⁻)` rests on Berline–Getzler–Vergne, Ch. 9 alone; only the point case (2.5) was computed.
- That no roadmap owns a smooth structure on complex Grassmannians rests on searches for the words, not on a reading of every roadmap.

## Source issues

- **Misprint** in Wu2006 at (2.6), printed page 2: the source says the closed test form has degree `n − m` under `n ≥ m`, letters not defined for the bundle there; it should be degree `dim M − r` with `dim M ≥ r`; affects nothing.
- **Misprint** in Garcia2018 at (A.8), printed page 24: the source says the Chern–Weil forms of the two summands are indexed by `j = 1, 2`; it should be `j = 0, 1`, the indices of `E₀`, `E₁`; affects nothing.

## For the human reviewers

- **Scope.** README lines 892–893 mention Quillen's unpublished notebooks (Clay Mathematics Institute) in "Research context"; no target cites them.
- **Not tested.** 6.1 and 6.2 cite Quillen 1988 through its zbMATH review, which could not be opened; Berline–Getzler–Vergne's contents page could not be read, so the arrangement was compared with Wu2006 only.
