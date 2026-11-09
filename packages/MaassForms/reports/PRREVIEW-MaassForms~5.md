# Review of MaassForms (pull request #1717 at 6d9c5c9)

**Verdict:** needs changes

Incremental re-review of the 36 changed lines since f79309d (the §4.4 Atkin–Lehner rewrite onto Tau Ceti's matrices, the matching Conventions bullet, supplier-contract bullet and Ordering line). The changed mathematics is correct and every newly cited declaration exists at the pin and says what the README says. The only findings are the two statement-hygiene hits the gate now reports on `Suggested.lean`, which is otherwise unchanged since f79309d; both are P3, and the repair below is tested. Acceptance needs a passing gate, so the verdict is needs changes with 0 blocking findings.

## R01 (P3) — `petersson` chooses its fundamental domain

**Location.** `TauCetiRoadmap/MaassForms/Suggested.lean:125–129`: "if h : ∃ F : Set ℍ, IsFundamentalDomain (gamma0PSL N) F volume then ∫ z in h.choose, …".

**Claim.** The gate's statement-hygiene rule: no choice in the body of a `def` (P3; "define the datum through a universal property, by `Quotient.lift`/descent, or take it as an argument").

**Witness.** The gate at 6d9c5c9: `statement-hygiene: line 128: P3 def petersson chooses its datum (h.choose)`.

**Repair (tested).** Integrate over a named fundamental domain instead of a chosen one: Tau Ceti's Dirichlet domain centred at `2i`, `TauCeti.dirichletDomain` (`TauCeti/MeasureTheory/Group/DirichletDomain/Basic.lean`, line 71), which `Subgroup.isFundamentalDomain_dirichletDomain` (`TauCeti/Analysis/Complex/Fuchsian/DirichletDomain.lean`, line 65) makes a fundamental domain of every discrete `Γ ≤ PSL(2, ℝ)` at a centre with trivial stabilizer. `2i` has trivial stabilizer in every `Γ̄₀(N) ≤ PSL(2, ℤ)`: an elliptic element fixes a point of the orbit of `i` or of `ρ`, whose imaginary parts are at most `1` and `√3/2`, and `Im(2i) = 2`. Add the import `TauCeti.MeasureTheory.Group.DirichletDomain.Basic` and replace the definition by

```lean
def petersson (N : ℕ) (f g : ℍ → ℂ) : ℂ :=
  ∫ z in TauCeti.dirichletDomain (gamma0PSL N) (pt 0 2), f z * (starRingEnd ℂ) (g z) ∂volume
```

with the proofs `petersson_zero_left := by simp [petersson]` and `petersson_smul_left := by simp only [petersson, Pi.smul_apply, smul_eq_mul, mul_assoc]; exact integral_const_mul c _`. A scratch copy with this change (and R02's) elaborates with exactly the 32 `sorry` warnings and no other diagnostic; `#check @petersson` returns the unchanged type `ℕ → (ℍ → ℂ) → (ℍ → ℂ) → ℂ`, and `newSpace`, `petersson_heckeOperator`, `petersson_add_left` and `exists_eigenvalue_near` are untouched. README §0.5 (line 551) then says the integral is over the Dirichlet domain centred at `2i` and keeps the target "independent of the fundamental domain for square-integrable automorphic `f, g`"; the docstring at line 121 drops "classically chosen".

## R02 (P3) — `completedLFunction` chooses its entire continuation

**Location.** `TauCetiRoadmap/MaassForms/Suggested.lean:519–525`: "if h : ∃ Λ : ℂ → ℂ, Differentiable ℂ Λ ∧ ∀ s : ℂ, 1 < s.re → Λ s = Λ₀ s then h.choose else Λ₀".

**Claim.** The same rule: a `def` whose body picks the continuation with `h.choose`.

**Witness.** The gate at 6d9c5c9: `statement-hygiene: line 524: P3 def completedLFunction chooses its datum (h.choose)`.

**Repair (tested).** State the continuation as a predicate with a real body and quantify the headlines over it, so the existence of the entire continuation is itself the headline:

```lean
def IsCompletedLFunction (N : ℕ) (lam : ℝ) (f : ℍ → ℂ) (Λ : ℂ → ℂ) : Prop :=
  Differentiable ℂ Λ ∧ ∀ s : ℂ, 1 < s.re →
    Λ s = (N : ℂ) ^ (s / 2) * Gammaℝ (s + parity f + besselOrder lam) *
      Gammaℝ (s + parity f - besselOrder lam) * lfunction f s

theorem exists_completedLFunction … (hf : IsNewform N χ lam f) :
    ∃ Λ : ℂ → ℂ, IsCompletedLFunction N lam f Λ := by sorry

theorem completedLFunction_functional_equation … (hf : IsNewform N χ lam f)
    {Λ Λ' : ℂ → ℂ} (hΛ : IsCompletedLFunction N lam f Λ)
    (hΛ' : IsCompletedLFunction N lam (conjugateReflection f) Λ') :
    ∃ c : ℂ, ‖c‖ = 1 ∧ frickeOperator N f = c • conjugateReflection f ∧
      ∀ s : ℂ, Λ s = c * (-1) ^ parity f * Λ' (1 - s) := by sorry
```

The scratch copy elaborates; the elaborated types are the README's (newform hypothesis, both spectral branches through `besselOrder`, unit-modulus Fricke scalar, conjugate-reflection partner). Since `Λ` is unique by the identity theorem, nothing is lost: `exists_completedLFunction` is the entirety headline of README §6.2, and the functional equation holds for the unique pair. README lines 1418 ("`completedLFunction f : ℂ → ℂ` as the function characterized …"), 1440 and 1441 then name `IsCompletedLFunction`, `exists_completedLFunction` and the two-continuation form; the module docstring needs no change.

## Previous findings

The previous report (at f79309d) was an acceptance with no findings. Its own "Previous findings" section recorded R01–R04 of the review at 151d335 as repaired; the lines it cites (README 254, 528, 556, 580–581, 855, 872 for R01/R03; 140, 390, 1556, 1720, 1933 for R02; 1629–1657 for R04) are outside the four hunks of this change (281–291, 343–356, 1068–1112, 1926–1952) and remain as the previous report read them.

No settled "not actionable in this package" finding exists to re-raise.

## Verified sound

### Gate, dependency check and elaboration

The gate rerun at 6d9c5c9 from the worktree:

```text
gate MaassForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=2 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
  statement-hygiene: line 128: P3 def `petersson` chooses its datum (`h.choose`); …
  statement-hygiene: line 524: P3 def `completedLFunction` chooses its datum (`h.choose`); …
  depcheck: NOT IN ORDER: MaassForms (insert it after its last supplier)
```

The two statement-hygiene lines are R01 and R02. The `NOT IN ORDER` line is the order-selection artefact the brief excludes (the default order does not list this roadmap); the movable check with the candidate order returns

```text
depcheck: 238 roadmaps, 2321 edges, 0 problem(s)
```

with no UPWARD or CYCLE line. The worker's gate (with the targeted build) reports `build=0`; `lake env lean` on `TauCetiRoadmap/MaassForms/Suggested.lean` from the worktree gave exactly 32 `declaration uses sorry` warnings and nothing else. `Suggested.lean` is byte-for-byte unchanged since f79309d, so the 72 elaborated signatures of the previous report stand; the four signatures the repair changes were re-elaborated with `#check` on the scratch copy (R01, R02). The outside-folder diff against `origin/main` is empty and the worktree is clean. The PR adds no supplier gap, no computational algorithm, no copied passage, no stand-in carrier and no option override.

### The changed passages against the pin

The worktree manifest pins Tau Ceti `358314d4` and Mathlib `f6090c70`. Every declaration the change cites was opened there:

| Declaration (file at Tau Ceti 358314d4) | What it states; agreement with the README |
|---|---|
| `IsAtkinLehnerMatrix N Q M` (`NumberTheory/ModularForms/AtkinLehner/Matrix.lean:116`) | `Q ∣ M₀₀`, `N ∣ M₁₀`, `Q ∣ M₁₁`, `det M = Q`: the README's `[Qa, b; Nc, Qd]`, `det W = Q`. |
| `atkinLehnerMatrix N Q` (`:166`) | `!![Q·gcdA Q (N/Q), −gcdB Q (N/Q); N, Q]`, the Bézout witness. |
| `isAtkinLehnerMatrix_atkinLehnerMatrix (h : Q ∥ N)` (`:171`) | as cited; `∥` is the scoped notation `TauCeti.ExactDivisor` for `Nat.IsExactDivisor` (`Data/Nat/ExactDivisor.lean:91`). |
| `IsAtkinLehnerMatrix.exists_mem_Gamma0_eq_mul_left` (`:280`) | `M' = γ·M` with `γ ∈ Γ₀(N)`: "two matrices for `Q` differ by `Γ₀(N)`". |
| `IsAtkinLehnerMatrix.exists_mem_Gamma0_mul_self` (`:357`) | `M·M = Q • γ`, `γ ∈ Γ₀(N)`: "`W² ∈ Q·Γ₀(N)`". |
| `IsAtkinLehnerMatrix.mul (hQRN : Q * R ∣ N)` (`:382`) | product is an Atkin–Lehner matrix for `Q·R`. |
| `IsAtkinLehnerMatrix.toHomUnits_gamma0Map_of_mul_eq_mul` (`:459`) | `γW = Wδ` gives label(δ) = label(γ) with its residue mod `Q` inverted and mod `N/Q` kept. |
| `atkinLehnerGL (hQ : 0 < Q) h : GL (Fin 2) ℝ` (`AtkinLehner/Operator.lean:86`) | entrywise real cast via `mkOfDetNeZero`. |
| `Gamma0_map_inv_conjAct_atkinLehnerGL_eq` (`:136`) | conjugation by `W⁻¹` preserves the image of `Γ₀(N)`: "`W` normalizes `Γ₀(N)`". |
| `atkinLehnerGL_mul` (`:372`) | `atkinLehnerGL hQ h * atkinLehnerGL hR h' = atkinLehnerGL _ (h.mul hQRN h')`. |
| `atkinLehnerGL_fricke (hN : 0 < N)` (`:464`) | `= frickeGL ℝ N`: "the `Q = N` member". |
| `atkinLehnerOperator` (`:157`) | `ModularForm ((Gamma0 N).map (mapGL ℝ)) k →ₗ[ℂ] …`: acts on `M_k(Γ₀(N))`, "not used" as the README says. |
| `coe_frickeGL_sq` (`Fricke/Matrix.lean:110`), `adjugateGL_eq_frickeGL_conj_bar` (`Fricke/AtkinLehnerBar.lean:60`) | still at the cited lines. |
| Mathlib `ModularForm.slash` (`NumberTheory/ModularForms/SlashActions.lean:90`, `:138`) | `σ γ (f (γ • x)) * |γ.det.val| ^ (k - 1) * denom γ x ^ (-k)`: at `k = 0` the factor is `|det γ|⁻¹`, exactly the factor the Conventions bullet says plain composition omits; `σ` is the identity for `det > 0`. |
| Mathlib `UpperHalfPlane.glAction` (`Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:181`) | `MulAction (GL (Fin 2) ℝ) ℍ` exists at the pin, so `atkinLehnerGL hQ h • z` is the Möbius action the README names. |

The same thirteen Tau Ceti names also exist in the `AtkinLehner/` and `Fricke/` files of Tau Ceti `2fd255d9`, the pin of `origin/main`'s manifest (the pull request does not touch `lake-manifest.json`; merging main moves the pin and is the worker's step, not a finding).

The supplier-contract bullet (README 349–352) names the two modules and the four declarations and says the operators there are not used: correct. The Ordering line adds `AtkinLehner` to Layer 4's inputs: consistent with the new `*Needs:*` line of §4.4. The proposed signature `atkinLehner N Q f z := f (atkinLehnerGL hQ (isAtkinLehnerMatrix_atkinLehnerMatrix hQN) • z)` type-checks by inspection (`hQN : Q ∥ N` feeds the Bézout theorem, `hQ : 0 < Q` feeds `atkinLehnerGL`); it is a README target with its intended signature, not a claim that `Suggested.lean` declares it (`readme-ids-missing=0`).

Dependents of the changed definition were reread: README 1137 (every `W_Q` preserves old- and newspace for trivial `χ`), 1180–1190 (`η_p(f)` the `W_{p^{v_p(N)}}`-eigenvalue, `ε_N = ∏ η_p`), 1395 and 1756 (bad Euler factors) and §6.2 (root number `ε_N(−1)^δ`) use `W_Q` only through properties the new definition keeps (same operator on `A(N, 1)`, now with a named matrix). None of the fifteen seeded targets lies in a changed passage; their locators are carried from the previous reports.

### Fresh adversarial computations (changed statements)

| Statement | Instances tried | Computed values on both sides / excluded model | Result; change |
|---|---|---|---|
| Plain composition versus Mathlib's weight-0 slash (Conventions, §4.4) | `N = 35`, `Q = 5`, `W = [15, 2; 35, 5]` | Mathlib: `(f ∣[0] W)(z) = f(W•z)·|5|⁻¹`; README: `f(W•z)`. With the slash, `W_Q²` would rescale by `1/25`, contradicting `W_Q² = 1`; plain composition gives the involution. | Pass; the bullet names the omitted factor correctly. |
| Independence of the matrix (trivial `χ`) | `N = 6`, `Q = 2`, `W = [−2, −1; 6, 2]`, `W' = [2, 1; 6, 4]` | both `det = 2` and Atkin–Lehner; `W'W⁻¹ = [−1, 0; −6, −1] ∈ Γ₀(6)`, label `−1`; `f(W'•z) = χ(−1) f(W•z)`: equal for trivial `χ`, sign-reversed for odd `χ`. | Pass; well-definedness is stated for `A(N, 1)` only, as it must be. |
| `W_Q² = 1` from `W² ∈ Q·Γ₀(N)` | `N = 6`, `Q = 2`: `W² = [−2, 0; 0, −2] = 2·(−I)`; `N = 35`, `Q = 5`: `W² = 5·[59, 8; 140, 19]` | `−I` acts trivially: `W_2² f = f` for every `f`. At `N = 35` the label `19 ≡ −1 (mod 5)`, `≡ 5 (mod 7)`, so `W_5² f = χ₅(−1)χ₇(5) f` on `A(35, χ)`: `= f` for trivial `χ`, not in general. | Pass; the square is claimed for trivial `χ` only. |
| Products `W_Q W_R` (`IsAtkinLehnerMatrix.mul`, `atkinLehnerGL_mul`) | `N = 6`, `W_2 = [−2, −1; 6, 2]`, `W_3 = [3, 1; 6, 3]` | `W_2W_3 = [−12, −5; 30, 12]`, `det 6`, entries `−12, 30, 12` all divisible by `6`: an Atkin–Lehner matrix for `Q = 6 = N`, so `W_2W_3 = W_6` on `A(6, 1)`. | Pass; agrees with the Check "At `N = 6`, `W₂W₃ = W₆`". |
| Fricke as the `Q = N` member (`atkinLehnerGL_fricke`) | `N = 2`, `[0, −1; 2, 0]` | `2 ∣ 0`, `2 ∣ 2`, `2 ∣ 0`, `det = 0·0 − (−1)·2 = 2`. | Pass. |
| Character transport `A(N, χ_Q χ') → A(N, χ̄_Q χ')` via `toHomUnits_gamma0Map_of_mul_eq_mul` | `N = 35`, `Q = 5`, `W = [15, 2; 35, 5]`, `γ = [8, 5; 35, 22]` (label `22`: `2 mod 5`, `1 mod 7`) | `δ = W⁻¹γW = [−223, −31; 1820, 253]`, `det 1`, `1820 = 35·52`, label `253 ≡ 8`: `3 = 2⁻¹ mod 5`, `1 mod 7`. For `f ∈ A(35, χ₅χ₇)`: `(Wf)(δ•z) = f(γ•W•z) = χ₅(2)χ₇(1)(Wf)(z) = χ̄₅(3)χ₇(1)(Wf)(z)`, so `Wf ∈ A(35, χ̄₅χ₇)`. The wrong model (label kept) would put `Wf` in `A(35, χ)` and fail at `χ₅` of order 4. | Pass. |
| R01 repair: `2i` in the free locus of `Γ̄₀(N)` | `γ = [a, b; c, d] ∈ PSL(2, ℤ)` | `Im(γ·2i) = 2/(4c² + d²)`; a nontrivial stabilizer would make `2i` an elliptic fixed point, hence in the orbit of `i` (`Im ≤ 1`) or `ρ` (`Im ≤ √3/2`); `Im(2i) = 2`. The Dirichlet domain at `2i` is then a fundamental domain for the discrete `Γ̄₀(N)` (`Fuchsian/DirichletDomain.lean:65`). | Pass; the repaired `petersson` has a real body. |
| R02 repair: `IsCompletedLFunction` on the zero function and on a newform | `f = 0`; normalized newform | `Λ₀ = 0` on `Re s > 1`, so `Λ = 0` is the unique entire continuation and the functional equation reads `0 = c·0`; for a newform `hf` excludes `0`, and uniqueness by the identity theorem makes the quantified equation equivalent to the original chosen-function form. | Pass; headlines keep their content. |

### Headline inventory (unchanged Lean; carried from the previous report)

Fourier–Whittaker expansion, finite multiplicity, the full newform theorem with its three conductor branches and cross-level strong multiplicity one, Selberg's 3/16, the level-one bound, the even-character Weyl law, absolute convergence, Euler product, entire completion, the character-dual functional equation and eigenvalue localization are stated; the self-adjoint realization, the character scattering matrix, the completed-`L`-function card, the Picard endpoints and quantitative coefficient recovery are named in the docstring as not statable with the carrier each lacks. R02 renames the entirety headline to `exists_completedLFunction` without changing its content. The one-tactic probes of the 32 admitted statements are carried from the previous reports (no statement changed).

### Ownership, overlaps and citations

The change replaces an inline matrix description by citations of Tau Ceti's `IsAtkinLehnerMatrix` family, removing a restatement of a pinned object rather than adding one; no new object is owned. The overlap tool lists no open pull request changing this roadmap, no dropped id in either direction and no id only an open revision defines; the closest roadmaps in vocabulary (BianchiModularForms, HalfIntegralWeightModularForms, CongruenceSpectralGap, HilbertModularForms, SiegelModularForms) are the previous report's and their boundaries were not reopened. The resolver's 14 leads are the previous report's: seven `IsNewform.*` names declared in `Suggested.lean` and seven LMFDB knowl or column identifiers.

### Carried adversarial computations

The following 151 rows carry the previous report's computed values for the statements the diff leaves untouched; the row on `completedLFunction`'s "choice definition" is superseded by R02 and its exceptional-branch value stands.

[r4]: PRREVIEW-MaassForms~4.md "Previous review of MaassForms at f79309d"
[r3]: PRREVIEW-MaassForms~3.md "Review of MaassForms at 151d335"

| Statement | Instances tried | Values on the two sides / excluded model | Result; provenance |
|---|---|---|---|
| Petersson/native comparison, Conventions and §0.5 | N=1, χ=1, f=i,g=1 and reversed | P(i,1)=iπ/3=inner(1,i); P(1,i)=−iπ/3=inner(i,1). Unswapped values have opposite signs. | Pass; R01 repaired. Carried from [r4]. |
| Index-scaled comparison, §0.5 | N=5, χ=1, D=2 | Γ₀ area=2π, Γ₁ area=4π; inner(1,i)/2=2πi=P(i,1); reversed values both −2πi. | Pass; degree and conjugation both needed. Carried from [r4]. |
| Native Hilbert product for Petersson norm | f=g=i, N=1,5; f=0 | Native diagonal divided by D gives π/3,2π,0; Petersson diagonal gives π/3,2π,0. Unscaled Γ₁ values are π/3,4π,0. | Pass; diagonal preserved. Carried from [r4]. |
| Cusp-period Check, §0.4 | N=4, cusp 0, g=1+2e(x/4) | Width=4/gcd(1,4)=4; one-width integral=4; constant term=1; full integral=4. | Pass; level now specified. Carried from [r4]. |
| Cusp-period negative control | N=12, cusp 1/3, same g | Width=12/gcd(9,12)=4; one-width integral=4; constant term=1; full integral=12, not 4. | Pass; R03 repaired on its refuting instance. Carried from [r4]. |
| Closed form/operator bridge, §3.2 | A=diag(0,2), f=(0,i),g=(0,1),D=1 | P(Af,g)=2i=inner(g,Af)=q(g,f); inner(Af,g)=−2i; both diagonal energies=2. | Pass; repair reaches operator domain. Carried from [r4]. |
| Positive rescaling, adjoints and orthogonality | Same A,D=2; e₁,e₂ | Rescaled energy=2/2=1 in both conventions; cross-pairing=0/2=0; A*=diag(0,2). | Pass; adjoint unchanged. Carried from [r4]. |
| Character Hecke adjoint, §4.2 | χ(n)=i, T=(1+i)/√2, f=i,g=1 | P(Tf,g)=(-1+i)/√2=iP(f,Tg); conjugate eigenvalue=(1−i)/√2=−i(1+i)/√2. | Pass; keep χ(n). Carried from [r4]. |
| Diamond projection, §3.1 | A=diag(0,2),D=diag(1,−1) | P+=diag(1,0),P−=diag(0,1),P+P−=0; AP+=P+A=0. | Pass; norm scaling changes no projection. Carried from [r4]. |
| Restricted resolvent, §3.2 | A=diag(0,2),P+ | (A+iI)⁻¹=diag(−i,(2−i)/5); restriction=−i=(0+i)⁻¹. | Pass; domain/resolvent restriction retained. Carried from [r4]. |
| Eigenvector and cusp restrictions, §§3.3–3.4 | Constant 1 at λ=0; odd χ | Δ1=0=0·1; cusp term=1 excludes it from cusp space. Odd-character projector gives 1−1=0, dimension/count=0. | Pass; no new positivity or nonemptiness claim. Carried from [r4]. |
| Gaussian covolume supplier | Gaussian index 60, subgroup volume 20G | 20G/60=G/3≈0.3053218647; 60·G/3=20G. | Pass; changed locators now name Layer 4. Carried from [r4]. |
| Source Fourier convention, §§7.3–7.4 | β=i,x=x₁+ix₂, coefficient 1 | Re(βx)=−x₂ in both formulas; term=yKν(2πy)e(−x₂), amplitude 1 rather than 2. | Pass; Then §3 (1), p.10. Carried from [r4]. |
| Nontrivial finite character sum | d=1+i,β=1,b=0,1 | Re(β/d)=1/2; sum=1+e(1/2)=0; d does not divide β. | Pass. Carried from [r4]. |
| Trivial finite character sum | d=1+i,β=d,b=0,1 | Re(β/d)=1; sum=1+e(1)=2=N(d). | Pass. Carried from [r4]. |
| Triviality in both directions | d=2,β=1 or 2,b=0,1,i,1+i | β=1 gives 1,−1,1,−1, sum 0; β=2 gives four ones, sum 4=N(d). Testing b=1,i forces both components of β/d integral. | Pass. Carried from [r4]. |
| Fourier index and height factors | (a,d,ν)=(1,1+i,1) and (1+i,1,1+i) | Inputs β=1+i and 1; outputs ν=1 and 1+i. Factors 2(1/√2)/√2=1 and √2/√2=1; β=νn/a² in both. | Pass. Carried from [r4]. |
| Nonzero frequency qualification | Constant function; ν=1 | Constant torus mode at 0=1, mode at 1=0; Kν(0) is outside positive-argument expansion. | Pass; ν≠0 excludes constant channel. Carried from [r4]. |
| Divisor representative modulo units | Replace a by ia | νn/(ia)²=−νn/a²; a_f at these indices agrees by a_f(−m)=a_f(m). | Pass; no R-even assumption for divisor choice. Carried from [r4]. |
| T₁ and Tᵢ | R-even/odd vectors | T₁ eigenvalue=1 on both; Tᵢ eigenvalues=1,−1; Tᵢ²=T₋₁=Id. | Pass; corrected Check distinguishes T₁. Carried from [r4]. |
| Product at prime above 2 | m=n=1+i,ν=1 | Divisors 1,1+i yield indices 2i and 1; both coefficient calculations give a(2i)+a(1). | Pass; ramified prime included. Carried from [r4]. |
| Unit and coprime products | m=n=i; m=1+i,n=3 | Unit product=T₋₁=Id=R²; coprime divisors give only T_(3+3i). | Pass. Carried from [r4]. |
| Adjugate inverse for adjoint | α=[1,1;0,1+i], n=1+i | adj(α)=[1+i,−1;0,1]; products in both orders=(1+i)I. Dividing by n gives I. | Pass; determinant remains n. Carried from [r4]. |
| Joint diagonalization | A=diag(1,−1),B=diag(2,3); zero space | AB=BA=diag(2,−3); joint lines have pairs (1,2),(−1,3), spanning ℂ². Zero-space span=top=0. | Pass; finite/symmetric hypotheses present. Carried from [r4]. |
| Ideal eigenvalues and Euler factor, §§7.4–7.5 | R=1,a(1)=1,π=1+i; formal recurrence a(π)=0 | a(iπ)=a(π); a(π²)=−1; at X=1/4 factor (1+X²)⁻¹=16/17. R=−1 gives unit-i eigenvalue −1, unsuitable for ideal indexing. | Pass; R-even restriction retained. Carried from [r4]. |
| Source zero-residue control | n=1, sole class b=0 modulo 1 | Roadmap has one identity term, T₁f=f; omitting zero residue gives 0. | Roadmap passes; source misprint below. Carried from [r4]. |
| Positive hyperbolic Laplacian, §0.1; `hyperbolicLaplacian` | f=1, y² | Δ1=0=0·1; Δy²=−2y²=2(1−2)y². Opposite sign gives +2y². | Retain.  Carried from [r4] (originally [r3]). |
| Unitary-weight conversion, §0.1 | k=0,1,1/2 | k²/4−k/2=0,−1/4,−3/16; direct differentiation of y^(−k/2)F gives the same shifts. | Retain; half weight is a coordinate test only.  Carried from [r4] (originally [r3]). |
| `IsSmoothOnUpperHalfPlane` | 1; abs(x); 1/y | Derivatives of 1 vanish; abs(x) has one-sided derivatives −1,+1; (1/y)'=−1/y² for y>0 although no boundary limit exists. | Retain open-domain restriction.  Carried from [r4] (originally [r3]). |
| Reflection commutes with Δ, §0.2 | x,x²,y² | Reflection values −x,x²,y²; Laplacian values 0,−2y²,−2y² in either order. | Retain.  Carried from [r4] (originally [r3]). |
| Positive dilation covariance, §0.2 | y², dilation 2 | Δ(4y²)=−8y²=(Δy²)(2z). | Retain.  Carried from [r4] (originally [r3]). |
| Energy identity, §0.2 | C² bump (1−x²)³(1−(y−2)²)³ on its rectangle | Integration by parts and the polynomial gradient integral both give 4194304/1156155; negative Laplacian convention would negate only the left value. | Retain scalar coordinate identity; the bridge is rechecked in the fresh table.  Carried from [r4] (originally [r3]). |
| `IsAutomorphic`, §0.3 | N=1 constant 1; N=3 odd χ; zero | Law at −I gives 1=1, 1=−1, 0=0 respectively. At T the multiplier is χ(1)=1. | Retain odd-character zero space.  Carried from [r4] (originally [r3]). |
| Noncommuting group actions, §0.3 | S:z↦−1/z, T:z↦z+1 at z=i | ST(i)=(−1+i)/2; TS(i)=1+i. The native slash law is imposed on the full group, not just its abelian generators separately. | Retain.  Carried from [r4] (originally [r3]). |
| Bare character space is not a Maass space | Weight zero slash law | Slash multiplier 1; no derivative or L² condition appears in its native definition. | Retain separate analytic predicates.  Carried from [r4] (originally [r3]). |
| `pt`, §0.4 | (x,y)=(0,1),(2,3) and y≤0 | Valid points have coordinates (0,1),(2,3). Nonpositive heights invoke ofComplex's junk branch, excluded by every cusp-integral test's y>0. | Retain.  Carried from [r4] (originally [r3]). |
| `cuspWidth` | N=4, cusp 0 and 1/2 | 4/gcd(1,4)=4; 4/gcd(4,4)=1. Replacing c² by c gives the wrong value 2 in the second case. | Retain.  Carried from [r4] (originally [r3]). |
| `cuspMultiplier`; regular versus irregular cusps | Trivial χ at N=4; cubic χ at N=9,cusp 1/3 | Multipliers 1 and e(1/3); the latter is not 1 and permits frequencies in ℤ+1/3. | Retain.  Carried from [r4] (originally [r3]). |
| Irregular full-period vanishing | N=9, w=1, g=e(x/3) | ∫₀⁹g=0; ∫₀¹g=(e(1/3)−1)/(2πi/3)≠0. | Retain full N-period condition.  Carried from [r4] (originally [r3]). |
| `IsCuspidal` | Zero; constant 1 at positive N | All integrals 0 versus Iσ(1,y)=N≠0. | Retain; checking only ∞ is not substituted for all cusps.  Carried from [r4] (originally [r3]). |
| `gamma0PSL`, effective action | I,−I,T | I·i=(−I)·i=i; T·i=1+i. I and −I have the same PSL image. | Retain; raw SL fundamental-domain predicate is unusable here.  Carried from [r4] (originally [r3]). |
| `IsSquareIntegrable`; quotient measure | Constant 1, N=1,2 | Squared norms π/3 and π; Γ₀ indices 1 and 3. | Retain unnormalized quotient measure.  Carried from [r4] (originally [r3]). |
| Effective Γ₀/Γ₁ index | N=1,…,7 | Degrees 1,1,1,1,2,1,3; φ(N)/2 alone would give 1/2 at N=1,2. | Retain explicit low-level cases.  Carried from [r4] (originally [r3]). |
| `petersson`, zero/scalar laws | f=0; f=i,g=1,N=1 | Pairings 0; iπ/3=i·P(1,1). Native inner(i,1)=−iπ/3. | First-slot linearity correct; the corrected ambient comparison is checked above.  Carried from [r4] (originally [r3]). |
| Petersson addition and norm | f=1,f'=i,g=1; f=2i,N=1 | P(1+i,1)=(1+i)π/3=P(1,1)+P(i,1); P(2i,2i)=4π/3. | Retain.  Carried from [r4] (originally [r3]). |
| `IsMaassForm`, §1.1 | Zero, λ=-1; constant 1,λ=0 | Δ0=(−1)0=0, norm²0; Δ1=0·1=0 and norm²π/3. | Retain zero in every eigenspace.  Carried from [r4] (originally [r3]). |
| `IsMaassCuspForm`; zero/scalar/additive closure | 0; f and −f at fixed λ | Cusp integral 0 for zero and f+(−f); Δ(cf)=cλf=λ(cf). | Retain closure scaffolding.  Carried from [r4] (originally [r3]). |
| `maassCuspSpace`; nonzero hypotheses | Odd χ; f=0 | Submodule is ⊥ for odd χ; zero belongs to it, so membership alone does not imply λ>0. | Retain explicit nonzero hypotheses.  Carried from [r4] (originally [r3]). |
| `spectralParameter`, §1.2 | λ=1/4,5/4,1/5 | sqrt(λ−1/4)=0,1,0; final 0 is total-function junk, not the exceptional spectral order. | Retain branch distinction.  Carried from [r4] (originally [r3]). |
| `besselOrder` | Same λ; λ=0 | Orders 0,i,sqrt(1/20),1/2; λ=1/4−ν² in each case. | Retain.  Carried from [r4] (originally [r3]). |
| Integral K, symmetry, §2.1 | ν=±1/2,u=1 | Both integrals 0.461068504447895; sqrt(π/2)e⁻¹ has the same value. | Retain supplier K rather than redeclare it.  Carried from [r4] (originally [r3]). |
| Imaginary-order bound by K₀ | ν=i,u=1 | Kᵢ(1)=0.2894280370; K₀(1)≈0.4210244382; absolute-value inequality holds. | Retain.  Carried from [r4] (originally [r3]). |
| K₀ small-argument constant | u=e⁻¹⁰ | K₀(u)=10.1159315214; −log(u/2)−γ=10.1159315157. | Retain constant log2−γ.  Carried from [r4] (originally [r3]). |
| K/I Wronskian orientation | (ν,u)=(1/2,1),(i,1),(0,2) | KI'−K'I=1,1,0.5; 1/u=1,1,0.5. Reverse orientation gives negatives. | Retain.  Carried from [r4] (originally [r3]). |
| Growing solution and threshold | ν=1/2,u=1; ν=0 | I₁/₂(1)=0.9376748882 versus K₁/₂(1)=0.4610685044; at threshold the second zero mode is sqrt(y)log(y). | Retain independent growing solution.  Carried from [r4] (originally [r3]). |
| K Mellin transform | s=2.5,ν=1.3i | Integral 0.726036530106716; gamma product 0.726036530106716. Re s=2.5>abs(Re ν)=0. | Retain convergence hypothesis.  Carried from [r4] (originally [r3]). |
| `fourierMode`, §2.2 | g=e(x), frequencies 1 and 0 | ∫₀¹e(x)e(−x)=1; ∫₀¹e(x)=0. | Retain Fourier sign.  Carried from [r4] (originally [r3]). |
| `fourierModeAt` | Width 4, g=e(x/4), v=1,0 | Normalized modes 1,0; omit 1/w and the first becomes 4. | Retain.  Carried from [r4] (originally [r3]). |
| Shifted mode orthogonality | κ=1/3,w=1, modes 1/3,4/3 | Matched integral 1; cross integral ∫₀¹e(±x)=0. | Retain nonintegral frequency.  Carried from [r4] (originally [r3]). |
| Mode differential equation | sqrt(y)Kν(2πabs(v)y/w) | Substitution gives eigenvalue 1/4−ν²; v↦−v leaves it unchanged, v=0 is separately treated. | Retain.  Carried from [r4] (originally [r3]). |
| Zero modes and cusp L² | Threshold sqrt(y), sqrt(y)log(y) | Squared cusp integrals grow as log Y and (log Y)³/3, respectively. | Retain zero constant term.  Carried from [r4] (originally [r3]). |
| `fourierCoefficient`, factor two | Mode α sqrt(y)Kν(2πabs(n)y) | Asymptotic limit is α/2; for α=2 it is 1, not 2. | Retain.  Carried from [r4] (originally [r3]). |
| `fourierCoefficientAt` | w=4, v=±1, mode 2sqrt(y)Kν(πy/2)e(vx/4) | Recovery factor sqrt(abs(v)/w)=1/2; coefficient 1 for both signs. | Retain absolute value and width.  Carried from [r4] (originally [r3]). |
| `fourierMode_eq`, all-cusp expansion | Zero form; one local mode, κ=1/3 | Both sides 0 for zero; matched local mode has coefficient 1 and reconstructed amplitude 2sqrt(y)Kν, other integer-offset modes 0. | Retain; local model is not asserted globally automorphic.  Carried from [r4] (originally [r3]). |
| `hasSum_fourierMode` | Zero; g=e(x/4) in a width-4 coordinate | Sum 0=0; one nonzero Fourier term reconstructs e(x/4). | Retain.  Carried from [r4] (originally [r3]). |
| `fourierCoefficient_injective` | f and 2f with a_f(1)=1; zero | First coefficients 1 and 2 distinguish forms; all-zero coefficients reconstruct zero. | Retain; no equality from only finitely many coefficients.  Carried from [r4] (originally [r3]). |
| `fourierCoefficient_le` | n=0; raw dilation d=4 of normalized f | At zero both sides are 0; a_(f(4z))(4)=2, compatible with C sqrt(4)=2C. | Retain sqrt(n) normalization.  Carried from [r4] (originally [r3]). |
| `decay_atImInfty` and all-cusp decay | Frequency 1; irregular frequency 1/3 | Kernel exponential rates e⁻²πy and e⁻²πy/3. A universal e⁻²πy at irregular cusps would fail. | Retain distinct rates.  Carried from [r4] (originally [r3]). |
| Nonnegative/nonzero eigenvalues, §2.5 | Zero at −1; constant 1 at 0 | Energy 0=−1·0 for zero; 0=0·π/3 for constant. Constant term 1 excludes the latter from cusp positivity. | Retain nonzero and cuspidal hypotheses.  Carried from [r4] (originally [r3]). |
| Diamond projector, §3.1 | Effective N=5 group C₂, character ±1 | P±=(1±D)/2; P±²=P±, P+P−=0 when D²=1. | Retain inverse-character projection convention.  Carried from [r4] (originally [r3]). |
| Odd character projection | N=3, χ(−1)=−1 | Central contributions 1+(−1)=0; projected subspace is zero. | Retain.  Carried from [r4] (originally [r3]). |
| Reducing restriction and resolvent, §3.2 | A=diag(0,2), constant coordinate | Restricted A=0; (A+i)⁻¹=−i, while the other coordinate gives (2−i)/5. | Retain domain-preserving restriction.  Carried from [r4] (originally [r3]). |
| Eigenvector regularity, §3.3 | Constant λ=0; zero | Weak equation has both sides 0; smooth representatives 1 and 0 respectively. | Retain PDE bootstrap with its supplied weak-domain input.  Carried from [r4] (originally [r3]). |
| Cuspidal compactness, §3.4 | Fourier frequencies abs(n)≥1 at y>Y | Horizontal Poincaré lower scale 4π²Y² versus zero for constant mode; tail factor (2πY)⁻²→0. | Retain exclusion of constant channels.  Carried from [r4] (originally [r3]). |
| Finite multiplicity and bounded spectrum | Zero space; model diag(1,1,2), T=1 | Dimension/count 0 for zero; multiplicity at 1 is 2, and N(1)=2. | Retain multiplicity, not distinct-value counting.  Carried from [r4] (originally [r3]). |
| Orthogonality/residual boundary, §3.5 | diag(1,2) eigenvectors; constant quotient function | Inner(e₁,e₂)=0; constant has eigenvalue 0 and nonzero constant term. | Retain residual constant separately from cusp space.  Carried from [r4] (originally [r3]). |
| `cuspCount` | T<0, odd χ; model double eigenvalue at T | Counts 0,0,2 respectively; a set-cardinality count would incorrectly give 1 for the last. | Retain finrank weighting and ≤ endpoint.  Carried from [r4] (originally [r3]). |
| `heckeOperator`, §4.1 | n=1; n=0 | T₁f=f because only (1,1),b=0 contributes; T₀ is junk 0 and positive-index theorems exclude it. | Retain.  Carried from [r4] (originally [r3]). |
| Hecke preservation | f=0; arbitrary positive n | Tₙ0=0, Δ0=λ0 and every cusp integral 0. | Retain; substantive nonzero case remains a target.  Carried from [r4] (originally [r3]). |
| `fourierCoefficient_heckeOperator` | m=n=p, p∤N | Coefficient at p of Tₚf is a(p²)+χ(p)a(1); for a(1)=1,a(p)=0 this is 0 iff a(p²)=−χ(p). | Retain.  Carried from [r4] (originally [r3]). |
| `heckeOperator_mul` | m=n=2; coprime m=2,n=3 | T₂²=T₄+χ(2)T₁; T₂T₃=T₆. At a₂=0,χ₂=1, a₄=−1. | Retain divisor normalization.  Carried from [r4] (originally [r3]). |
| `petersson_heckeOperator`, §4.2 | χ(n)=i,a=e(1/8) | conj(a)=(1−i)/sqrt(2)=−ia. Treating Tₙ as self-adjoint would force a real, which it is not. | Retain character adjoint; the ambient convention bridge is checked above.  Carried from [r4] (originally [r3]). |
| Joint diagonalization | One-dimensional eigenvalue e(1/8) | Real and imaginary parts are both 1/sqrt(2); each is a real symmetric scalar operator. | Retain use of real/imaginary parts for normal operators.  Carried from [r4] (originally [r3]). |
| `reflection`, `IsEven`, `IsOdd`, §4.3 | e(x)+e(−x), e(x)−e(−x),0 | Reflection signs +1,−1; zero satisfies both. First two values at x=0 are 2,0. | Retain parity exclusivity only for nonzero forms.  Carried from [r4] (originally [r3]). |
| `frickeOperator`, §4.4 | N=2; N=4,z=i/2 | W₂²=−2I on matrices but identity on ℍ; W₄(i/2)=i/2. | Retain projective action, no holomorphic scalar.  Carried from [r4] (originally [r3]). |
| Partial Atkin–Lehner unit rule | N=6,Q=2,R=3; Q=R=2 | Product indices 6 and 1; QR/gcd(Q,R)² gives those values. | Retain exact-divisor restriction.  Carried from [r4] (originally [r3]). |
| Character transport under Fricke | Cubic χ | χ↦χ̄=χ², distinct from χ; applying twice returns χ. | Retain pseudo-eigenvalue/two-form equation.  Carried from [r4] (originally [r3]). |
| `levelRaising`, `levelRaisingLinear`, §4.5 | d=1,2,4 | a_(f(dz))(d)=1,sqrt(2),2 for a_f(1)=1; a_(f(2z))(1)=0. | Retain raw dilation rather than normalized dilation.  Carried from [r4] (originally [r3]). |
| `oldSpace` and inclusion | N=1; level-one lift to N=4 | No positive proper divisor at N=1, so oldSpace=⊥; the old lift is included at N=4 and has level-four squared norm 6 times the original for d=1. | Retain.  Carried from [r4] (originally [r3]). |
| `newSpace` and `petersson_add_left` | Oldspace=⊥; sums orthogonal to oldspace | At N=1, newspace equals cusp space; two pairings 0+0=0 retain orthogonality. | Retain.  Carried from [r4] (originally [r3]). |
| `IsNewform` | 0,f,2f,f(2z), with a_f(1)=1 | First coefficients 0,1,2,0; only f passes normalization. | Retain normalization separate from submodule membership.  Carried from [r4] (originally [r3]). |
| `IsNewform.heckeOperator_eq` | n=1; ramified p with a(p)=0 | T₁f=1f; the zero local factor parameter forces Tₚf=0. | Retain theorem at all positive n.  Carried from [r4] (originally [r3]). |
| `IsNewform.fourierCoefficient_mul` | Good p, a(p)=0; bad p with α=1,c=0 | a(p²)=−χ(p); in trivial-character p=2 Steinberg branch, a(2)²=a(4)=1/2. | Retain good and bad divisor terms.  Carried from [r4] (originally [r3]). |
| Cross-level strong multiplicity one | f versus 2f and f(dz),d>1 | Positive first coefficients 1 versus 2 and 0; neither wrong model meets the normalized-newform hypotheses. | Retain comparison of newforms, not all oldforms.  Carried from [r4] (originally [r3]). |
| Bad-prime branch c=α | N=5, primitive even quadratic χ | α=c=1 and norm a(5)=1; trivial χ has c=0 and norm 1/sqrt(5), a different branch. | Retain new general-character Lean headline.  Carried from [r4] (originally [r3]). |
| Bad-prime branch α=1,c=0 | N=10, quadratic χ induced from 5,p=2 | Prime-to-p character value χ₅(2)=−1; a(2)²=−1/2, norm=1/sqrt(2). | Retain prime-to-p character factor; zero extension χ mod 10 at 2 is not substituted.  Carried from [r4] (originally [r3]). |
| Bad-prime branch α≥2,c<α | N=25,c=1 versus c=2 | α=2,c=1 ⇒ a(5)=0; c=2 ⇒ norm a(5)=1. | Retain exhaustive conductor distinction.  Carried from [r4] (originally [r3]). |
| `frickeSign` and sign theorem | Trivial χ, Wf=±f; f=0 | Branch values +1,−1; zero selects +1 as junk. Normalized-newform hypothesis excludes zero. | Retain.  Carried from [r4] (originally [r3]). |
| Newform reflection dichotomy | Nonzero even and odd forms | Reflection square is 1; eigenvalues +1 and −1; 0 cannot be a reflection eigenvalue of a nonzero vector. | Retain.  Carried from [r4] (originally [r3]). |
| Conjugate coefficients, §4.7 | e(x)+i e(2x) | Plain conjugation gives coefficients 1,−i at −1,−2; conjugate reflection gives 1,−i at +1,+2. | Retain distinction between the two conjugations.  Carried from [r4] (originally [r3]). |
| Normalized dual and self-duality | Odd normalized f; conjugate reflection | Plain conjugate first coefficient −1; conjugate-reflection first coefficient +1. Real positive coefficients are fixed by duality. | Retain.  Carried from [r4] (originally [r3]). |
| Selberg 3/16, §5.3 | Supplied lower bound 21/100 | 21/100−3/16=9/400>0; exceptional t at equality is 1/5. | Retain restriction to Γ₁(N), all characters.  Carried from [r4] (originally [r3]). |
| Level-one bound, §5.4 | Lower bound 3π²/2 | 3π²/2≈14.80440660>1/4; nonzero-eigenspace assumption excludes the zero subspace at λ=−1. | Retain.  Carried from [r4] (originally [r3]). |
| Selberg conjecture as proposition | Empty cusp space; hypothetical λ=1/5 | Vacuously true on empty spectrum; 1/5<1/4 would refute the conjecture on a nonzero cusp eigenspace. | Retain as hypothesis, not assertion.  Carried from [r4] (originally [r3]). |
| Regular cusp channels, §5.5 | N=1; N=9 cubic character and cusp 1/3 | One channel at N=1; irregular cusp has multiplier e(1/3) and contributes no constant-term channel. | Retain character-weighted comparison.  Carried from [r4] (originally [r3]). |
| Scattering functional equation | Level-one scalar φ(s)=ξ(2s−1)/ξ(2s) | ξ(u)=ξ(1−u) gives φ(s)φ(1−s)=1 wherever regular; at s=1/2 the continued scalar is −1, whose square is 1. | Retain meromorphic interpretation.  Carried from [r4] (originally [r3]). |
| `weyl_law` and leading constant | N=1; N=3 even versus odd χ | Index/12 is 1/12 and 1/3; odd-character count is identically 0, not asymptotic to X/3. | Retain even-character hypothesis.  Carried from [r4] (originally [r3]). |
| Scattering matrix size versus cusp count | N=4 trivial χ | Cusp count sum φ(gcd(d,4/d))=1+1+1=3; matrix is 3×3. | Retain; no one-channel shortcut.  Carried from [r4] (originally [r3]). |
| `lfunction`, §6.1 | Coefficients 1,2 at n=1,2; s=2 | Sum 1+2/4=3/2; n=0 contributes 0 even if its stored coefficient is nonzero. | Retain native LSeries convention.  Carried from [r4] (originally [r3]). |
| `lfunction_summable` | σ=5/4, ε=1/4 | Mean-square exponent 1+ε=5/4; complementary Cauchy–Schwarz exponent 2σ−1−ε=5/4>1. | Retain unconditional Re s>1.  Carried from [r4] (originally [r3]). |
| `lfunction_eulerProduct` | Good p with a(p)=0; bad p with a(p)=0 | Good factor (1+χ(p)p⁻²ˢ)⁻¹; bad factor 1 because χ(p)=0 too. | Retain all primes.  Carried from [r4] (originally [r3]). |
| `parity`, §6.2 | Nonzero even/odd; zero | δ=0,1; zero chooses 0. Root-sign multipliers 1,−1. | Retain newform hypothesis where dichotomy is used.  Carried from [r4] (originally [r3]). |
| `completedLFunction` | f=0; λ=1/5 and 1/4 | Unique entire extension of zero is 0; gamma shifts δ±sqrt(1/20), and δ,δ. | Retain choice definition and exceptional branch.  Carried from [r4] (originally [r3]). |
| Even Mellin constants | N=1, δ=0 | 4·2^(s−2)·(2π)⁻ˢ=π⁻ˢ; rescaling height by sqrt(N) supplies N^(s/2). | Retain factor-two convention.  Carried from [r4] (originally [r3]). |
| Odd Mellin constants | δ=1 | Axis value 0; derivative of paired ±n modes contributes 8πi n, and division by 2πi supplies Γℝ(s+1±ν). | Retain transverse derivative and N^(−1/4).  Carried from [r4] (originally [r3]). |
| `differentiable_completedLFunction` | Zero function; actual-newform hypotheses | Zero extension has derivative 0; using the total LSeries outside its convergence region is avoided by choosing the entire extension. | Retain substantive existence theorem; agreement alone would be padding.  Carried from [r4] (originally [r3]). |
| `conjugateReflection` | First coefficient 1, odd parity | Dual first coefficient conj(1)=1, unlike plain conjugation's −1. | Retain normalization.  Carried from [r4] (originally [r3]). |
| Functional equation | Trivial χ, Fricke ε=±1, δ=0,1 | Root numbers ε,−ε; applying twice multiplies by ε²=1. For general χ, the partner is χ̄. | Retain unit-modulus scalar and actual Fricke relation.  Carried from [r4] (originally [r3]). |
| Ramanujan/Satake equivalence, §6.3 | χ=1,a(p)=2 | Roots 1,1; a(pᵏ)=k+1=τ(pᵏ). | Retain use of unitary phase law.  Carried from [r4] (originally [r3]). |
| Wrong-model test for Satake converse | Arbitrary χ=-1,a(p)=2 | Polynomial roots 1±sqrt(2), not unit modulus despite abs(a)=2; this data violates the eigenform adjoint phase condition. | Retain restriction to genuine normalized eigenforms.  Carried from [r4] (originally [r3]). |
| Analytic conductor | N=1,δ=r=0,s=1/2; change N or δ | Values 49/4,49 for N=4,81/4 for δ=1. | Retain level and parity factors.  Carried from [r4] (originally [r3]). |
| Conductor order symmetry | N=1,δ=0,s=1/2,r=±1 | Both values 41/4+3sqrt(5)≈16.9582039325. | Retain unordered gamma shifts.  Carried from [r4] (originally [r3]). |
| L-function card, §6.4 | Real-place Maass newform | Two real gamma shifts, zero complex shifts give degree 2; positive level is its integral conductor. | Retain supplied card rather than redeclare it.  Carried from [r4] (originally [r3]). |
| H³ Laplacian, §7.1 | yˢ,s=0,1,2,3 | Δ₃yˢ=s(2−s)yˢ gives 0,y,0,−3y³; dropping y∂y would give the wrong middle values. | Retain drift term.  Carried from [r4] (originally [r3]). |
| H³ measure | Cusp y>Y, unit torus area | ∫Y∞y⁻³dy=1/(2Y²), versus 1/Y for the H² density. | Retain dimension-specific measure.  Carried from [r4] (originally [r3]). |
| Picard carrier and positivity, §7.2 | Constant 1; zero at λ=-1 | λ=0 with constant term 1; Δ₃0=(−1)0=0. Only the nonzero form enters positivity. | Retain repaired hypothesis.  Carried from [r4] (originally [r3]). |
| Picard cusp/stabilizer | Translations 1,i and rotation −1 | Fundamental translation area 1; applying rotation twice gives x; there is one ideal class/cusp for ℤ[i]. | Retain.  Carried from [r4] (originally [r3]). |
| H³ spectral branch | λ=0,1,2 | t=1, order0, r=1 respectively; λ=1−t² or 1+r² as appropriate. | Retain constants and threshold.  Carried from [r4] (originally [r3]). |
| H³ Fourier pairing, §7.3 | n=i, x=x₁+ix₂ | Re(nx)=−x₂, while Re(conj(n)x)=x₂. | Retain specified pairing.  Carried from [r4] (originally [r3]). |
| H³ zero frequency | Cuspidal f; constant 1 | Torus integral 0 versus 1; n=0 cannot be inserted into Kν(2πabs(n)y). | Retain separate constant mode.  Carried from [r4] (originally [r3]). |
| H³ modified Bessel mode | yKν(2πabs(n)y) | Substitution gives λ=1−ν²; for λ=0,ν=1, not the H² order1/2. | Retain.  Carried from [r4] (originally [r3]). |
| R,J coordinate symmetries, §7.4 | x₁²+x₂²; x₁²−x₂²; x₁x₂; x₁x₂(x₁²−x₂²) | Signs (++),(−+),(−−),(+−), respectively. | Retain four symmetry classes; local polynomial tests only.  Carried from [r4] (originally [r3]). |
| Gaussian divisor representative | Replace a by ia | νn/a² changes to −νn/a²; a_f(−m)=a_f(m) makes summand unchanged. | Retain; sign suffices for divisors, R-even is needed for ideal indexing.  Carried from [r4] (originally [r3]). |
| Gaussian eigenform normalization | J-odd,R-even form | J leaves coefficient at n=1 fixed, but eigenvalue −1 forces a(1)=−a(1)=0. | Retain normalized forms only where a(1)≠0.  Carried from [r4] (originally [r3]). |
| H³ Mellin transform, §7.5 | s=1,ν=i,abs(n)=1 | ∫yKᵢ(2πy)dy=0.0172896861564; Γ(1+i/2)Γ(1−i/2)/(4π²) matches. | Retain half arguments.  Carried from [r4] (originally [r3]). |
| H³ gamma normalization | s=r=1 | Γ(1+i/2)Γ(1−i/2)=0.6825694503; unhalved shifts give Γ(1+i)Γ(1−i)=0.2720290550. | Retain correct degree-four factor and conductor16.  Carried from [r4] (originally [r3]). |
| H³ ideal sum and completion | Four generators per nonzero ideal, R=J=+1 | Element sum is 4 times ideal sum; Γℂ product supplies factor4, so Λ equals four times the stated vertical Mellin integral. | Retain unit multiplicity.  Carried from [r4] (originally [r3]). |
| Invariant dictionary, §8.1 | Normalized level1 even/trivial form; dual | N=1,k=0,degree2; conjugating real coefficients preserves them. | Retain intrinsic invariants.  Carried from [r4] (originally [r3]). |
| Intrinsic prefix, §8.2 | N=1, trivial character; old lift f(2z) | Prefix (1,0,1) for normalized source; lift has a(1)=0 and does not receive a normalized-newform prefix by this construction. | Retain distinction from table indices.  Carried from [r4] (originally [r3]). |
| Spectral multiplicity versus Hecke multiplicity one | Humphries Theorem1.1 at N=9,25,225 | Density lower bounds 2/5,14/19,28/95; corresponding multiplicities at least2,2,4. Equal λ alone does not give equality of all Hecke eigenvalues. | Retain Humphries boundary.  Carried from [r4] (originally [r3]). |
| `exists_eigenvalue_near`, §8.3 | A=diag(1,2),g=(1,1)/sqrt(2),λ₀=3/2 | Residual norm 1/2; distance to spectrum 1/2. For an exact eigenvector both are 0. | Retain ≤ endpoints and domain.  Carried from [r4] (originally [r3]). |
| Nonzero residual hypothesis | g=0,λ₀=-1,η=0 | Residual 0≤0, but distance from nonnegative spectrum to −1 is at least1. | Retain g≠0.  Carried from [r4] (originally [r3]). |
| Rank-one isolation | Projection onto both eigenspaces of diag(1,2) | Rank2, Pg=g, but Ag=(1,2) for g=(1,1), not λg. | Retain rank-one hypothesis.  Carried from [r4] (originally [r3]). |
| Projection error and denominator | q=1/10,C₁=Cₙ=b=1,abs(ℓₙ(g))=1 | Norm bound q=.1; lower norm sqrt(.99); denominator .9; coefficient error bound 1/9+1/9=2/9. | Retain strict b>C₁q; equality would give denominator0.  Carried from [r4] (originally [r3]). |
| Zero residual coefficient recovery | q=0 | Both error terms 0; normalized projected vector has ℓ₁=1. | Retain bounded functional interpretation.  Carried from [r4] (originally [r3]). |
| Rigorous count semantics | k=0; negative interval radius | Zero count means empty spectral range, not an eigenvalue at midpoint; negative radius gives empty interval. | Retain.  Carried from [r4] (originally [r3]). |
| Eisenstein worked example | s=0 versus s=2 | E(z,0)=1 with norm²π/3; y² leading term has cusp norm (Y³−1)/3→∞. | Retain repaired Re s>1 rejection.  Carried from [r4] (originally [r3]). |
| Holomorphic comparison worked example | Nonzero weight k; F=0 | Weight drift shift k²/4−k/2 generally remains; at F=0 all equations have both sides0. | Retain nonzero rejection qualification.  Carried from [r4] (originally [r3]). |
| Level/index/cusp worked data | N=1,2,3,4,5,6,9 | (index,cusps)=(1,1),(3,2),(4,2),(6,3),(6,2),(12,4),(12,4). | Retain arithmetic values.  Carried from [r4] (originally [r3]). |
| Higher-level worked data | N=11,19,23,26,101,105 | (12,2),(20,2),(24,2),(42,4),(102,2),(192,8). | Retain arithmetic values.  Carried from [r4] (originally [r3]). |
| Displayed numerical Fourier checks | Printed level-one parameter R | λ=91.1413453364; KᵢR(2π)=6.827942759e−8; KᵢR(4π)=3.184740579e−8. | Formula checks only; no spectral certification.  Carried from [r4] (originally [r3]). |

## Not verifiable

No source was reopened this round: the changed passages cite only pinned Lean declarations, all read at the pin. The limitations below are inherited from the previous reports and unchanged:

- **iwaniec-spectral**, Chapters 1, 3–8 and 11; **iwaniec-topics**, Chapter 2; **bump**, §§1.9 and 2.1; **iwaniec-kowalski**, §5.1 (5.7), p. 95 and Chapter 15; **booker-strombergsson-then**, pp. 78–108: only publisher landing pages were reachable.
- **atkin-lehner**, Theorems 3/5, and **atkin-li**, Theorem 3: no legal full text; the general-character locators remain uncertified.
- **huxley**, pp. 141–156; **elstrodt-grunewald-mennicke**, Chapters 1–3, 6–8; **hejhal**, volume 2; **maass**, pp. 141–183; **roelcke**, 1953/1955; **roelcke-ii**, pp. 261–324; **selberg**, 1965 pp. 1–15: paywalled or no readable legal text.
- **lmfdb**: cached knowls only; current website revisions and numerical eigenvalue certification were not checked.

## Source issues

No source was opened this round; the five items of the previous report stand.

- none
