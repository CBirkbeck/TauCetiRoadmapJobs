# Review of SuperconnectionsAndMathaiQuillenForms (pull request #2297 at 16ea243)

**Verdict:** needs changes

## R01 (P3) — The orientation of the zero locus in 5.3 has no witness

**Location:** TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:945–947: “`Z = s⁻¹(0)` oriented by CharacteristicClasses C2, item 3 … (b) `∫_M φ ∧ e_(∇,βs) → ∫_Z φ` as `β → ∞` for every form `φ`”.
**Claim:** For odd `r` and non-closed `φ`, (b) holds for only one of the two orientation rules for `Z`. C2, item 3 says “the specified orientation” without stating the rule, and no Check of 5.3 computes a case that separates them.
**Witness:** `T²`, trivial line, `s = sin 2πx`, `φ = f dy` supported near `x = 0`: `φ ∧ e_(d,βs) = −f g_β(s) s′ dx∧dy → −∫ f(0,y) dy`. Orienting `Z` normal-first gives `+∫ f(0,y) dy`.
**Repair:** State in 5.3: “`Z` is oriented tangent-first: an oriented basis of `T_pZ` followed by normal vectors that `∇s(p)` maps to an oriented basis of `E_p` is oriented in `T_pM`; for even `r` the order is immaterial.” Add the Check above with its value `−∫ f(0,y) dy` (and `+∫ f(½,y) dy` at `x = ½`, where `s′ < 0`), and say that this is the orientation taken from C2, item 3.

## R02 (P3) — The locators of 4.1 do not contain `str[∇, α] = d str(α)`

**Location:** TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:711–713: “Prove that it is a graded trace and commutes with the exterior covariant derivative … `str[∇, α] = d str(α)` (Garcia 2018, §A.1, (A.2)–(A.4), p. 23; Wu 2006, §2.3)”.
**Claim:** The two locators define the algebra and the extended supertrace; neither states the identity with the covariant derivative.
**Witness:** Garcia2018 lines 1073–1083 give (A.2)–(A.4) and the left-module property only; Wu2006 lines 213–233 define `str` and the curvature. No derivative of a supertrace occurs before Garcia2018 line 1100.
**Repair:** Write “(Garcia 2018, §A.1, (A.1)–(A.4), p. 23, and Wu 2006, §2.3, for the algebra and the supertrace; `str[∇, α] = d str(α)` is 2.3's `str(covD δ Θ p X) = d str(X)` in a trivialization; Berline–Getzler–Vergne, §1.4)”.

## R03 (P3) — 4.4 (b), 6.1 and 6.2 still have no exact locator

**Location:** TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:817, 1034–1035, 1085–1086: “Ch. 9, "The Index Bundle", pp. 263–310, for (b)”; “as stated in its review Zbl 0671.57013” (twice).
**Claim:** Unrepaired from the previous review (its R09): a 48-page chapter range and a review identifier do not locate the kernel-limit theorem, the Cayley correspondence or the forms `γ_(2k)`, `γ_(2k−1)`.
**Witness:** The three passages are unchanged since `0c22c1f`. The package manifest already records BGV1992 at section 9.1, finer than the README's chapter range.
**Repair:** For (b) cite the section and theorem number of Berline–Getzler–Vergne §9.1 with its page. For 6.1 and 6.2 cite the section and page of Quillen 1988 for the correspondence and for each family of forms. Both texts stay uncertified; nothing is requested again.

## R04 (P3) — The definitions of 4.4 and 6.2 have no API list

**Location:** TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:827–830 and 1100–1105: the `*Needs:*` line is followed directly by “**Checks.**”.
**Claim:** 4.4 defines the projection `P_K` and the compressed connection `∇^K`; 6.2 defines the embedding `W ↦ F_W`, the tautological bundle and its connection `P d P`. Neither section has an **API.** block.
**Witness:** 4.1, 4.2, 4.3, 5.1, 5.2, 5.4 and 6.1 each have one; 4.4 and 6.2 pass from Needs to Checks.
**Repair:** 4.4: “`P_K² = P_K = P_K*` and `X P_K = P_K X = 0`; `P_K` is independent of `ρ` below the smallest nonzero `|eigenvalue|`; `f*P_K` is the projection of `f*X`; `P_(K ⊕ K′) = P_K ⊕ P_K′`; `∇^K` is Hermitian and grading-preserving.” 6.2: “`F_(uW) = u F_W u⁻¹` for `u ∈ U(V)`; `F_(W^⊥) = −F_W`; `W ↦ W ⊕ 0` for `V ⊂ V ⊕ V′` pulls `tr(P(dP)^(2k))` back to itself; `P d P` is Hermitian.” For `V = ℂ` the second gives `F_0 = −1 = −F_ℂ`.

## R05 (P3) — The description is written for an earlier head

**Location:** Pull request #2297, description: “SmoothBundlesConnections: B3.3 and B4.1.”; “which gives `∫ Pf(R/2π) = Σ ind = χ(M)`”; “If `X` is odd, `εgε = g⁻¹`.”
**Claim:** Unrepaired from the previous review (its R13), and further behind now: the description omits three suppliers, four contracts, two targets, one definition, one theorem and one source that the head has.
**Witness:** README.md:273–280 (GeneralizedCohomology G4.0b, LieGroups Layer 2, LieGroupoidsPoisson G0.1), :248–254 (two Tau Ceti contracts), :70–73 (RandomMatrices §8.5), :1213 (Knuth 1996); Suggested.lean:415, 437 (`cayleyInv`, `cayley_cayleyInv`).
**Repair:** Add: “Suppliers also include GeneralizedCohomology G4.0b, LieGroups Layer 2, LieGroupoidsPoisson G0.1, SmoothBundlesConnections B2.2, CharacteristicClasses C5, item 5, and Tau Ceti's `TauCeti.finiteGrassmannian`, `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` and `Matrix.ofStrictUpper`. Pfaffians are shared with RandomMatrices §8.5. Layer 4 constructs the contour-integral projection onto `ker X`; Layer 5 states `∫ e(∇) = Σ ind = χ(M)`, with `e(∇)` the orientation sign in rank zero; 6.1 has the converse `cayley_cayleyInv` with the definition `cayleyInv`; 6.2 proves the embedding `W ↦ 2P_W − 1`. Knuth, « Overlapping Pfaffians », arXiv:math/9503234, is read for 3.2.”

## Verified sound

| Statement | Instances | Left side computed | Right side computed | Result | Change |
|---|---|---|---|---|---|
| 1.1 `IsSuperCommutative`, `parityInv` | `Λ(ℤ²)`; trivially graded `M₂(ℤ)` | `e₀e₁`; `E₁₂E₂₁ = E₁₁` | `−e₁e₀`; `E₂₁E₁₂ = E₂₂` | exterior passes, matrix algebra excluded | — |
| 1.2 `superMatrixEquiv_mul` | `(1⊗E₂₁)(e⊗E₁₁)`; `(e⊗E₁₁)(1⊗E₁₂)` | `−e⊗E₂₁`; `+e⊗E₁₂` | `σ(e)E₂₁ = −eE₂₁`; `σ⁰`: `eE₁₂` | agrees | — |
| 1.2 `isSuperHomogeneous_superMatrixEquiv_tmul` | `e` odd, `E₁₂` block-odd | entry `e ∈ 𝒜 1` at `(inl, inr)` | `p + 0 + 1 = 1` gives `p = 0 = 1 + 1` | agrees | — |
| 1.3 `superTrace_superMul_comm` | `E₁₂, E₂₁`; general entry `a = X_kl`, `b = Y_lk`, `s = |k|+|l|` | `1`; sign `(−1)^(l+sq)` | `(−1)(−1)`; `(−1)^(pq)(−1)^(l+sq)` | agrees | — |
| 2.1 `exists_superDGA_of_isDGAlgebra` | `a ∈ 𝒜 p`, `p = −1, 2`; `dx·y` | `σ(a) = −a, +a`; `−dx∧dy` | `p.negOnePow = −1, +1`; `d(dx)y + σ(dx)dy` | agrees | — |
| 2.2 `bianchi` | general odd `Θ`; `d = 0`, `Θ = [[0,1],[1,0]]` | `dF = dΘΘ − ΘdΘ`; `Θ³ − Θ³` | `−[Θ,F] = dΘΘ − ΘdΘ`; `0` (wrong sign: `2Θ`) | agrees | — |
| 2.3 `isClosed_superTrace_superPow` | `k = 0`; `A = R`, `d = 0` | `d((m−n)·1) = 0`; `tr((T*T)^k) − tr((TT*)^k)` | `0`; `0` for `k ≥ 1` | agrees | — |
| 2.4 `transgression` | `k = 0`; `k = 1`, `d = 0`; `𝔽₂[x]`, `Θ = (x)` | `d str ∂Θ`; `(1−1+1−1)str(∂ΘΘ³)`; `4x⁴ = 0` | `d str ∂Θ`; `0`; `0` | agrees | — |
| 2.5 `trace_exp_sub_trace_exp` | `T = (1,0)`, `n=1, m=2`; `T : ℂ⁰ → ℂ` | `(e^(−t)+1) − e^(−t)`; `0 − 1` | `2 − 1`; `0 − 1` | agrees | — |
| 3.1 `berezin_map` | swap of `e₀, e₁`; `n = 0` | `∫_B e₁e₀ = −1`; `1` | `det·1 = −1`; `det(empty) = 1` | agrees | — |
| 3.2 `factorial_mul_pfaffian` | `J₂⊕J₂` over `ℤ`, `𝔽₂`; `r = 0` | `2·1`, `0·1`; `1` | `∫_B ω² = 2`, `0`; `∫_B 1 = 1` | agrees | — |
| 3.2 `pfaffian_sq` | `[[0,a],[−a,0]]`; `𝔽₂` all-ones; `r = 0` | `a²`; `1`; `1` | `a²`; `det = 0` (diagonal ≠ 0, excluded); `1` | agrees | — |
| 3.2 `pfaffian_mul_mul_transpose` | `r = 1` general `B`; `S = E₀₀`, `B = [[1,0],[1,1]]` | `a(B₀₀B₁₁ − B₀₁B₁₀)`; `1` | `det B · a`; `0` (not alternating, excluded) | agrees | — |
| 3.2 route to `Pf² = det` | `inr a ↦ 2a`, `inl a ↦ 2a+1` on `Matrix.J` | entry `(2a, 2a+1) = J(inr a, inl a) = 1` | `J₂ = [[0,1],[−1,0]]`, `Pf = det = 1` | agrees | — |
| 3.3 Gaussian density | `b = ½`, `r = 0, 1` | `(π/b)^(r/2) = 1, √(2π)` | `(2π)^(r/2)` | agrees | — |
| Convention 2, Garcia rescaling | `𝔸 = d + η` on `ℝ⁴`; general degree `k` | `1 + vol₄/(4π²)`; `(𝔸′²)_k = i^(2−k)(𝔸²)_k` | Garcia on `d − η`: `1 + vol₄/(4π²)`; `−(−i)^k(𝔸²)_k` | agrees | — |
| Convention 4, sign | `r = 1, 2` | `−dx₁`; `dx₁e₁dx₂e₂ = −dx₁dx₂e₁e₂` | `(−1)^(r(r+1)/2) = −1, −1` | agrees | — |
| 4.1 supertrace | one-form `ω`, odd `u`; identity | `0`; `(rk E⁺ − rk E⁻)ω` | `ω str u = 0`; `ω str 1` | agrees; locator R02 | R02 |
| 4.2 superconnections | even `u`; odd `u` | defect `2 df ∧ us` | `0` required; odd: `df us − df us = 0` | odd passes, even excluded | — |
| 4.3 character | `𝔸_t = d + itx dy`; `E⁻ = 0` | `d/dt = −i dx∧dy`; `(−1/(2πi))^k` | `−d(ix dy)`; `(i/2π)^k` | agrees | — |
| 4.4 (a) primitive | `∫₁^∞` of `d/dt str exp(−𝔸_t²)` | `−str exp(−𝔸₁²)` | `−d∫ str(X exp(−𝔸_t²))dt`; `φd = dφ` on odd forms | agrees | — |
| 4.4 Check `T = z` | `(dX)²` under Convention 1 | `str = dz dz̄ − (−dz dz̄) = 2dz∧dz̄`; `−(t²/π)e^(−t²|z|²)dx∧dy` | integral `−(t²/π)(π/t²) = −1` | agrees | — |
| 4.4 projection | `T = 0`; `T = z`, `|z| < ρ/2` | `∮ w⁻¹dw/(2πi) = 1`; Riesz projection `1` | `ker X` projection `1`; `0` at `z ≠ 0` | agrees; API R04 | R04 |
| 5.1 Euler form | `r = 2`, `R = [[0,−dα],[dα,0]]`; rank 0, negative point | `−dα/2π`; `∫_B 1 = −1` | `Pf(R/2π) = −dα/2π`; supplier sign `−1`, empty `Pf = +1` | agrees | — |
| 5.2 `s = 0`, direct sums | even `r`; ranks `r, r′` | `(−1)^(r/2)(−1)^(r/2)`; `(−1)^(rr′)` from reordering | `1`; prefactor difference `rr′` | agrees | — |
| 5.3 localization, Poincaré–Hopf | `S²`; `dim M = 0`; `T²`, `s = sin 2πx`, `φ = f dy` | `2`; `∑ o(p)² = #M`; `−∫f(0,y)dy` | `2`; `χ = #M`; tangent-first `−`, normal-first `+` | (c) agrees; (b) unpinned | R01 |
| 5.4 Thom form | rank 0, negative point; `ℝ ⊕ ℝ`; `r = 1` zero section | `(−1)(−1)`; `dx∧dy` Gaussian; `0*dx = 0` | `1`; value at `r = 2`; `e(∇) = 0` | agrees | — |
| 6.1 `isUnit_one_sub_of_skew`, `cayley_mem_unitaryGroup` | `X = [[0,−a],[a,0]]`; `X = (iθ)` | `det(1−X) = 1 + a²`; `|(1+iθ)/(1−iθ)|` | `≠ 0`; `1` | agrees | — |
| 6.1 `grading_mul_cayley_mul_grading` | same `X`; even `diag(iθ, 0)` | `εgε = gᵀ`; `εgε = g` | `g⁻¹ = gᵀ`; `g⁻¹ ≠ g` for `θ ≠ 0` | odd passes, even excluded | — |
| 6.1 `cayley_cayleyInv` | `X = cayleyInv g`; `g = −1` | `1+X = 2g(g+1)⁻¹`, `1−X = 2(g+1)⁻¹` | `cayley X = g`; `g + 1 = 0` excluded | agrees | — |
| 6.1 graph and Convention 5 | `W = (1−X)E⁺`; `A = −iX` | `g(1,−a) = (1,a)`, `ε ↦ (1,−a)`; `(−i)(1+X)(i(1−X))⁻¹` | graph of `−T`; `−g` | agrees | — |
| 6.2 invariant forms | `F = 2P−1`; `ℂP¹` at `z = 0` | `2^(2k+1)tr(P(dP)^(2k)) − 2^(2k)tr((dP)^(2k))`; `(i/2π)·2i dx∧dy` | second term `0` for `k ≥ 1`; `−(1/π)dx∧dy`, integral `−1` | agrees; API R04, locator R03 | R03, R04 |
| 6.2 regular-level control | `F = σ₃` | `Ḟ ↦ σ₃Ḟ + Ḟσ₃` has image `⟨1, σ₃⟩` | rank `2 < 4` | agrees | — |

| Previous finding (review at `0c22c1f`) | Passage at this head | Status |
|---|---|---|
| R01 rank-zero Euler sign | “`∫_B` is multiplication by the orientation sign `o`” (README.md:183–184); Checks :900, :965, :997 | repaired |
| R02 Koszul sign | “`c_s = (s∧) + (s∧)*` is odd and self-adjoint with `c_s² = |s|²`” (:852) | repaired |
| R03 ungraded superconnection | “`E⁻ = 0` and `𝔸 = ∇` an ordinary connection” (:789); control :791 | repaired |
| R04 Garcia comparison | “Garcia's form of `𝔸′ = ∑_j i^(1−j) 𝔸_j`” (:155) | repaired |
| R05 atomicity | “whose bundle map `α` … is `k`-atomic” (:1163–1164) | repaired |
| R06 resolvent circle | “encloses both eigenvalues, so its Riesz projection is `1`” (:841–842) | repaired |
| R07 transgression sign | “`𝔸_t = d + i t x dy`” (:797) | repaired |
| R08 factorial control | “over `𝔽₂`, `Σ = J₂ ⊕ J₂`” (:659) | repaired |
| R09 exact locators | :817, :1035, :1086 unchanged | not repaired: R03 |
| R10 Pfaffian locators | “Knuth 1996, §0, p. 2 … §6, p. 10 … p. 11” (:614–620) | repaired |
| R11 normal-form input | “`LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`” (:635, Needs :644–645) | repaired |
| R12 Thom-form API | API bullets :985–992 | repaired |
| R13 description | description unchanged | not repaired: R05 |

- Source locators checked against the text: 29 (Wu2006 12, Garcia2018 11, Knuth arXiv:math/9503234 3, HarveyLawson1994 3); all 15 sampled targets examined; defects are R02 and R03.
- Library declarations opened at the pins: Mathlib `LinearAlgebra/CliffordAlgebra/Prod.lean:54`, `LinearAlgebra/TensorProduct/Graded/Internal.lean:182`, `RingTheory/MatrixAlgebra.lean:206`, `LinearAlgebra/Matrix/Trace.lean:172`, `LinearAlgebra/Matrix/BilinearForm.lean:491`, `LinearAlgebra/SymplecticGroup.lean:59`, `Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330`, `Geometry/Manifold/SmoothEmbedding.lean:70`; Tau Ceti `Algebra/Homology/DG/Algebra/Defs.lean:206`, `Analysis/SpecialFunctions/Exponential.lean:267, 378`, `LinearAlgebra/BilinearForm/SymplecticBasis.lean:357`, `LinearAlgebra/Matrix/Alternating.lean:147`, `Geometry/Manifold/DifferentialForm/Curvature.lean:33`, `…/Wedge/Smooth/Bundle.lean:172`, `Geometry/Manifold/DeRham/Basic.lean:127`.
- No Pfaffian, Berezin integral, supertrace on supermatrices, Cayley transform, exterior covariant derivative on bundle-valued forms or manifold structure on `finiteGrassmannian` exists at the pins. Tau Ceti's `Matrix.isSquare_det_of_transpose_eq_neg_of_diag_eq_zero` (`LinearAlgebra/Matrix/Determinant/Skew.lean:62`) is the field case of `pfaffian_sq` without the Pfaffian; weaker, no duplication.
- Cross-roadmap citations resolved on main: CharacteristicClasses Conventions (README.md:157–210), C2 items 1, 3, 5, C4 items 1–2, C5 item 5; DifferentialGeometry Layers 0, 1, 2, 5, 6; SmoothBundlesConnections B2.2, B3.3, B4.1; GeneralizedCohomology G4.0b; RepresentationTheory/LieGroups Layer 2; LieGroupoidsPoisson G0.1; RandomMatrices §8.5; SelfAdjointSpectralTheory SA-D24, SA-D27; HeegaardFloer F0.0; SymplecticFieldTheory §0.3; IndexTheory 8.2.
- Gate: every worker check passed. Dependency check: `depcheck: 242 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean` at the pins: 16 `sorry` warnings, nothing else. The 49 elaborated signatures were compared with the README; the 10 flagged binders are `Fintype`/`DecidableEq` instances the types do not need; none is a lost hypothesis.
- Padding probe on a scratch copy: none of the 16 admitted theorems closes with `rfl`, `simp`, `infer_instance` or `simp` with the definitions unfolded; `exact?` closes none of `bianchi`, `trace_exp_sub_trace_exp`, `berezin_map`, `isUnit_one_sub_of_skew`, `cayley_mem_unitaryGroup`.
- Headlines: the 16 statable ones are stated; Layers 4, 5 and 6.2 are named in the module docstring with the carriers they lack, confirmed absent at the pins.

Overlap check: read RationalHomotopyModels, SpinGeometry, CalibratedGeometry, IndexTheory; nothing shared with the first, which works with ℤ-graded commutative DG algebras. Clifford modules and spinors: SpinGeometry. Real skew normal form and volume comparison: CalibratedGeometry §4.2. Index formulas and heat traces: IndexTheory. Pfaffians of real skew matrices: RandomMatrices §8.5, with 3.2 the commutative-ring variant stated in Scope. The lead “G4.0b only at an open revision” is false: main's TauCetiRoadmap/GeneralizedCohomology/README.md:1082 and :1149–1151 define it.

Source independence: 29 passages compared with 4 sources, none shared; largest share Wu2006, 23 of 54 locators (Berline–Getzler–Vergne 14, Garcia2018 12, Knuth 3, Quillen 1988 2); contents compared with Wu2006: independent (its §2.1, §2.2, §2.3 fall in Layers 3, 5, 4; Layers 1, 2, 6 have no counterpart). The texts and contents of BGV1992 and Quillen1988 could not be read.

## Not verifiable

- BGV1992 §§1.3, 1.4, 1.6, Proposition 1.41 and Ch. 9: settled uncertified, text not read.
- Quillen1988 for 6.1 and 6.2: settled uncertified; its review Zbl 0671.57013 returned HTTP 403 from zbMATH in this round, so the review's wording was not read either. Both sections were checked by their stated routes and instances only.
- Quillen1985 and MathaiQuillen1986 (Research context only): settled uncertified.
- Research context: Bismut 1986, Getzler 1983 and 1991, Atiyah–Bott 1984, Berline–Vergne 1983, Kalkman 1993, Atiyah–Jeffrey 1990, Bismut–Gillet–Soulé 1990, Chern 1944, Harvey–Semmes 1992, MacPherson 1974 and the Astérisque volume of Harvey–Lawson were not read; the listed Quillen notebooks were not located.

## Source issues

- **Misprint** in Wu2006 at (2.6), printed page 2: the source says the test form has degree n−m with n ≥ m, letters it does not define there; it should be dim M − r with dim M ≥ r; affects nothing.
- **Misprint** in Garcia2018 at (A.8), printed page 24: the source says the two Chern–Weil summands are indexed by j = 1, 2; it should be j = 0, 1; affects nothing.
- **Error** in Garcia2018 at the paragraph after (A.4), printed page 23: the source says the extended supertrace takes values in even forms; it should be parity-preserving, an odd form times an even endomorphism having odd supertrace; affects a stated result.

## For the human reviewers

- **Not tested.** BGV1992 (14 of 54 locators) and Quillen1988 were not readable: wording and arrangement were not compared with them, and the locators R03 asks for need someone with access to both texts.
- **Licence.** README.md:1213 and :1218 cite Knuth (arXiv:math/9503234) and Harvey–Lawson (arXiv:math/9407216), both read from arXiv; the package's `sources.toml` has no entry for either.
