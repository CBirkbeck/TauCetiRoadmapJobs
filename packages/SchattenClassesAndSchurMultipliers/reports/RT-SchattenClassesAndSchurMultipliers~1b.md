<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17047#issuecomment-6902399544 -->
Red team round 1 pass b (claude) of 0cf1df5

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) "any separable Hilbert space" is false for a fixed finite-dimensional one

   Location: `packages/SchattenClassesAndSchurMultipliers/README.md:1441` — "The infimum is unchanged when
   `ℓ²(ℕ)` is replaced by any separable complex Hilbert space `K`, each of which embeds isometrically
   into `ℓ²(ℕ)`"; and `README.md:18` — "through `ℓ²(ℕ)`, equivalently through any separable Hilbert space".

   Claim: for every separable `K` the infimum over `K`-valued factorisations equals `‖M‖_H`.

   Witness: `K = ℂ`, `M = [[1, 2], [2, 1]]` on `{1, 2}`. `⟨ξ_i, η_j⟩ = conj(ξ_i) η_j` has rank ≤ 1, `M` has
   rank 2 (determinant −3): no factorisation, infimum `∞`, while `‖M‖_H = 2` (README §6.2 Check 1). The
   embedding argument gives only "≥ `‖M‖_H`" for each `K`.

   Repair (README.md:1441–1444, first bullet of §6.2), replace the first sentence by:

   > The infimum is unchanged when the factorisations are allowed to take values in arbitrary separable
   > complex Hilbert spaces `K` (the infimum over all such `K` and all factorisations through them), or in
   > one fixed infinite-dimensional separable `K`: every separable `K` embeds isometrically into `ℓ²(ℕ)`,
   > and `ℓ²(ℕ)` is unitarily equivalent to every infinite-dimensional separable `K`. For a fixed `K` of
   > finite dimension the infimum can be larger: `K = ℂ` admits only symbols of rank at most one, so it
   > gives `∞` for `[[1, 2], [2, 1]]`, whose constant is `2`. The infimum is also unchanged when the maps
   > are required to be strongly measurable: …

   and add to the §6.2 Checks: "`[[1, 2], [2, 1]]` has no factorisation through `K = ℂ` (rank 2), so the
   Hilbert space cannot be fixed of dimension 1; through `ℂ²` the value `2` is attained." In the Summary
   (README.md:18–19) replace "equivalently through any separable Hilbert space" by "equivalently through
   separable Hilbert spaces, all of them allowed". Tested on the witness: the repaired text asserts `2` for
   the infimum over all separable `K` (attained in `ℂ²`) and `∞` for `K = ℂ`.

2. **F02** (P2) §9.3 uses a noncommutative `Lᵖ` identification that no supplier states

   Location: `README.md:1873–1876` — "the semifinite algebra `L^∞(ℝⁿ) ⊗̄ F_k` with the trace
   `g ↦ ∫ Tr g(ξ) dξ`, whose `Lᵖ` norm on bounded `g` is `‖g‖_{Lᵖ(S_p^k)}` because `|g|^p` is computed
   pointwise (NoncommutativeIntegration §1.5 at `k = 1`)".

   Claim: the interpolation step (NoncommutativeIntegration §2.6) may be applied with
   `Lᵖ(L^∞(ℝⁿ) ⊗̄ M_k) = Lᵖ(ℝⁿ; S_p^k)` for every `k`.

   Witness: on main, `TauCetiRoadmap/NoncommutativeIntegration/README.md:880` (§4.4) is "For a probability
   space (Ω,P) and 1≤p<∞"; its §1.5 (line 363) covers `L∞(Ω,μ)` and `B(H)` only. Lebesgue measure on `ℝⁿ`
   with `k ≥ 2` is in neither.

   The step is an input of the proof plan with no owner, and it is not a target here.

   Repair: add to §9.2 (after the bullet "At `p = 2`", README.md:1833) the target

   > - For `1 ≤ p < ∞` the `Lᵖ` space of the semifinite algebra `L^∞(ℝⁿ) ⊗̄ M_k` with the trace
   >   `g ↦ ∫ Tr g(ξ) dξ` is `Lᵖ(ℝⁿ; S_p^k)` with the norm `‖·‖_{Lᵖ(S_p^k)}`, and the algebra itself carries
   >   the essential supremum of the operator norms. Route: for a bounded `g` vanishing off a set of finite
   >   measure, `g*g` is a matrix of bounded functions whose polynomials are computed pointwise; uniform
   >   approximation of `t ↦ t^{p/2}` on `[0, ‖g‖_∞²]` gives `|g|^p(ξ) = |g(ξ)|^p` almost everywhere, so the
   >   trace of `|g|^p` is `∫ Tr |g(ξ)|^p dξ`; such `g` are dense on both sides (NoncommutativeIntegration
   >   §1.3; simple functions). NoncommutativeIntegration §4.4 states the identification for probability
   >   spaces and its §1.5 for `k = 1`; this is the σ-finite matrix case. For `g = 1_{[0, 2]} E₁₁` (`n = 1`,
   >   `k = 2`) both sides are `2^{1/p}`.

   and in §9.3 replace "(NoncommutativeIntegration §1.5 at `k = 1`)" by "(§9.2)"; add
   "NoncommutativeIntegration §1.3, §1.5" to the *Needs* of §9.2. Tested on the instance: `|g|^p = g`,
   trace `= ∫_0^2 1 = 2`, and `‖g‖^p_{Lᵖ(S_p^2)} = ∫_0^2 ‖E₁₁‖_p^p = 2`; the measure is infinite, so §4.4
   does not apply and the new target does.

3. **F03** (P3) §7.2: "all of the same measure" does not say within which set

   Location: `README.md:1606–1607` — "every minimal nonempty set of `𝒜` is a union of minimal nonempty sets
   of `𝓑` all of the same measure".

   Claim: read as one common measure for all minimal sets of `𝓑`, the lemma does not cover its use in §7.3,
   where each minimal set `A` of `𝒜` is cut into `n` pieces of measure `μ(A)/n`, a value depending on `A`.

   Witness: lafforgue-delasalle-2011 line 490 (per atom of `𝒜`). Instance: `Ω = {1,2,3,4}`, masses
   `(1,1,3,3)`, `𝒜` generated by `{1,2}`, `{3,4}`: needed by §7.3 with `n = 2`, excluded by the global reading.

   Repair: "every minimal nonempty set `A` of `𝒜` is a union of minimal nonempty sets of `𝓑` that all have
   one measure, a value which may depend on `A`". Add after the route: "On `{1, 2, 3, 4}` with masses
   `(1, 1, 3, 3)` and `𝒜` generated by `{1, 2}` and `{3, 4}` the hypothesis holds (values `1` and `3`), and
   the permutations are the four elements of the group generated by `(1 2)` and `(3 4)`; with masses
   `(1, 2, 3, 3)` it fails, and `(1 2)` is not measure preserving." Tested on the instance: hypothesis holds
   under the repaired wording.

4. **F04** (P3) §9.3 *Needs* and the Layer 9 dependencies omit Layer 2

   Location: `README.md:1903–1904` (*Needs* of §9.3), `README.md:1974–1975` (Layer 9 Dependencies),
   `README.md:570` ("Layer 9 needs Layers 1, 3, 4 and 8").

   Claim: §9.3 needs only §1.1, §1.4, §3.5, §4.1, §9.1.

   Witness: `README.md:1862–1864` defines `Λ_F(g)` by its kernel (§2.1); `README.md:1884` uses
   `Tr(Λ_F(g) Λ_F(h)) = ∫ tr(ǧ(u) ȟ(−u)) |F ∩ (F + u)| du`, the trace formula of §2.2; line 1889–1890
   "by comparing kernels".

   Repair: *Needs* of §9.3: "§1.1, §1.4, §2.1, §2.2, §3.5, §4.1, §9.1; …"; Layer 9 Dependencies: "Layers 1
   (§1.1, §1.4), 2 (§2.1, §2.2), 3, 4 and 8; …"; line 570: "Layer 9 needs Layers 1, 2 (§2.1, §2.2), 3, 4 and
   8." No order changes (Layer 2 precedes Layer 3 already).

5. **F05** (P3) §2.4 defines four maps and has no Checks

   Location: `README.md:899–937` (§2.4: `U`, `C_φ`, `ι`, `P`); the only worked instance is the
   `condExpL2`/`condExp` paragraph; the `(1, 3)` masses instance sits in §3.7.

   Claim: each definition has three discriminating Checks.

   Witness: no `**Checks.**` block between README.md:899 and 937; the kernel of `P(B)` and the direction of
   `C_φ` are pinned by no computed instance.

   Repair: add before the *Needs* line of §2.4:

   > **Checks.**
   >
   > - `{1, 2}` with counting measure and `𝒜` trivial: `L²(𝒜) = ℂ e` with `e = (1, 1)/√2`, `ι(a) = (a/2) J`
   >   (`J` the all-ones matrix) and `P(B) = ⟨e, B e⟩ = (Σ_{i,j} B_{ij})/2`. For `B = E₁₁`, `P(B)` is the scalar
   >   `1/2`, whose kernel for `μ` is the constant `c` with `∫ c dμ = 2c = 1/2`, so `c = 1/4`, the mean of
   >   `1_{(1,1)}` over the four points, as the projection onto `𝒜 ⊗ 𝒜`-measurable classes gives; reading
   >   the scalar `1/2` as the kernel would be wrong by the mass `2`.
   > - Direction of `C_φ`: on `{1, 2, 3}` with the cycle `φ = (1 → 2 → 3 → 1)`, `C_φ δ₁ = δ₁ ∘ φ = δ₃` and
   >   `C_φ δ₂ = δ₁`, so `C_φ E₁₂ C_φ* = E₃₁`, and `k_{E₁₂}(φ x, φ y) = 1` exactly at `(x, y) = (3, 1)`; the
   >   formula with `φ⁻¹` would give `E₂₃`.
   > - `ν = δ₀ ≪ μ = δ₀ + δ₁` on `{0, 1}`: `h = 1_{{0}}`, `U c = (c, 0)`, `U*U = 1` and `U U* = E₀₀ ≠ 1`, so `U`
   >   is an isometry and not a unitary; `μ ≪ ν` fails.

   Each value was computed as shown (`P(ι(a)) = (a/2)·4/2 = a`, consistent with `P ∘ ι = id`).

6. **F06** (P3) module docstring makes the tools report a phantom declaration `is`

   Location: `packages/SchattenClassesAndSchurMultipliers/Suggested.lean:16–17` — "so that no operator whose
   construction is itself a / theorem is defined here:".

   Claim: the file has 19 declarations.

   Witness: `scratch/signatures.md` lists "`is` (theorem, line 17)", "20 declarations" and "line 290: Unknown
   identifier `is`"; `scratch/library-matches.md` line 7 searches for it. Line 17 begins with "theorem is".

   Repair: rewrap so that no docstring line starts with `theorem`: "A Schur multiplier is stated through
   kernels, so that no operator is defined here whose construction is itself a theorem:
   `IsKernelOperator μ k T` says …". The statement of the file is unchanged.

Two P2 findings (one statement false as written, one unowned prerequisite of a proof plan) and four
P3 findings. No Lean statement was found false as typed. Lean was not run in this pass (read-only);
the elaborated types of `scratch/signatures.md` were compared with the README statement by statement.

Dependency check (run at this head):

    depcheck: 240 roadmaps, 2260 edges, 0 problem(s)

No UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` touches only
`packages/SchattenClassesAndSchurMultipliers/` (README.md, Suggested.lean, metadata.toml, four reports).

## Record of the pass: `Suggested.lean` (19 declarations)

Context: `Gauge` section `E F` complex Hilbert, complete (kept by `schattenGauge`, its type mentions
them); `Schur` section `{Ω} [MeasurableSpace Ω]`, `{μ}` from line 92; `[SigmaFinite μ]`, `hM`, `[Fact (1 ≤ p)]`
are in each signature (elaborated types compared: none lost). `Continuous` section: `X` locally compact,
T2, Borel; `μ` explicit with its three instances in the signatures.

| declaration | instances tried | values on each side | result |
|---|---|---|---|
| `schattenGauge` (def) | `1` on `ℓ²(ℕ)`; rank-one projection; `0` space; `p = ∞` non-compact | `∞` (all `p`); `1` (all `p`); `0`; `∞` | agrees with §1.1; pin: `gauge_schatten` is `(∑' aₙ^p)^{1/p}` in `ℝ≥0∞`, defined on every bounded map |
| `IsKernelOperator` (def) | `{1,2}`, `k = 1_{(1,2)}` | `T δ₂ = δ₁`, `T = E₁₂` | row convention as README; wrong model `E₂₁` excluded |
| `schurNorm` (def) | point of mass `w`, `M = c`; `μ = 0`; `{1,2}`, `[[1,2],[3,4]]`, `p = 2` | `\|c\|`; `0`; `4` | equals §3.3; `B` unique when `M ∈ L^∞` |
| `schurCbNorm` (def) | `m = 0`; `M = 1`, `μ ≠ 0` | `0`; `1` | level `0` harmless |
| `schurNorm_two_eq` | `μ = 0`; `[[1,2],[3,4]]`; `M = 1` on `ℕ` | `0 = 0`; `4 = 4`; `1 = 1` | true |
| `schurNorm_eq_of_holderConjugate` | `(p,q) = (1,∞)`, triangular `[[1,1],[0,1]]`; `M = 1_{(1,2)}` | `2/√3` both, transpose `2/√3`; `1 = 1` | true |
| `schurNorm_interpolation` | `p₀ = 2, p₁ = ∞, θ = 1/2` triangular; endpoint norm `0`; endpoint norm `∞` | `‖·‖₄ ≤ (2/√3)^{1/2} ≈ 1.0746`; `M = 0`, `0 ≤ 0·0`; rhs `∞` (other endpoint `> 0`) | true; `0·∞` cannot occur with `M ≠ 0` |
| `schurNorm_mono_of_abs_inv_sub_le` | `p = 2`, any `q`; `p = q'`; `p = ∞` (`p⁻¹.toReal = 0`) | `‖M‖_∞ ≤ ‖S_M‖_q`; equality; `1/2 ≤ \|1/q − 1/2\|` forces `q ∈ {1, ∞}` | true |
| `schurNorm_of_posSemidef` | empty `ι`; `[[2,1],[1,1]]`; `[[1,2],[2,1]]` (not PSD) | `0 = 0`; `2 = 2`; norm `2 ≠ 1` (hypothesis needed) | true |
| `haagerupNorm` (def) | `μ = 0`; `[[1,2],[2,1]]`; `ξ = 0`, `η` unbounded | `0`; `2`; `0·∞ = 0` with `M = 0` | agrees with §6.2 |
| `schurNorm_eq_haagerupNorm` | point mass, `M = c`; triangular on `M₂`; `M = 1` on `ℕ` | `\|c\|` four times; `2/√3` (factorisation at angles `0°,30°,60°,90°`, norms² `2/√3`); `1` | true |
| `schurNorm_eq_schurCbNorm_of_forall_not_isAtom` | `μ = 0`; counting on `{1,2}` (has atoms, excluded); countable–cocountable (is an atom, excluded) | `0 = 0`; —; — | hypothesis is Tau Ceti `IsAtom` (measurable, positive, subsets null or full) |
| `schurNorm_le_iff_of_continuous` | `μ = 0`; `N = 0`; `μ = δ₀ + δ₁`, `[[1,2],[2,1]]`; `M(x,y) = x`, Lebesgue; `C = 0` | both sides true; rhs trivially; `2 ≤ C` both; lhs false, rhs false at `N = 1`, `s = C + 1`; `M = 0` on `supp × supp` | true; complement of support null under `InnerRegularCompactLTTop` + σ-finite |
| `schurCbNorm_le_iff_of_continuous` | same | same with cb norms | true |
| `lpSchattenNorm` (def) | `k = 0`; `p = ∞` | `0`; ess sup of operator norm (`schatten_top`) | agrees with §9.2 |
| `fourierMultiplierCbNorm` (def) | `m = 1`; `m = 0`; `n = 0`, `m = 2i` | `1`; `0`; `2` | agrees with §9.2 |
| `schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm` | `n = 0`, `m = 2i`; `m = e_a`; `m = 1_{ξ>0}`, `p = 1` | `2 = 2`; `1 = 1`; `∞ = ∞` | true; holds for `m ∈ L^∞` by the mollification route of §9.5, beyond the continuous symbols of caspers-delasalle-2015 |
| `hmsNorm` (def) | `M = 1`; `sign(x − y)`, `n = 1`; `φ(x − y)`, `φ = ξ/√(1+ξ²)` | `2`; `2`; `2 + 4/(3√3)` | range `n/2 + 2` gives `k = 0..σ_n`; `k = 0` term is `2 ess sup \|M\|` |
| `schurNorm_le_hmsNorm` | `M = 1` | `1 ≤ C·4·2` at `p = 2`, so `C ≥ 1/8` | true as cgpt-2023 Theorem A with Remark 2.1; `n ≥ 1`, `1 < p < ∞` present |

Headline theorems (README Summary): isometry on `S₂`; duality and transposition; log-convexity;
monotonicity; Schur product theorem with norms; Grothendieck–Haagerup; atomless theorem; continuous
symbols (norm and cb); Fourier–Schur transference; Hörmander–Mikhlin–Schur. All are stated. Not stated
and named in the module docstring: multiplicativity and `*`-compatibility of `M ↦ S_M` (needs the kernel
map). Padding probe: no declaration follows by one tactic or one pinned lemma; none restates a
definition; none found.

## Record of the pass: README targets (45)

| target | instances recomputed | values | result |
|---|---|---|---|
| 1.1 | `diag(1/(j+1))`; identity; compression of identity | `π²/6`, `‖·‖₁ = ∞`; `d^{1/p}`, `∞`; `α^{1/p}` vs `1` at `p = ∞` | sound |
| 1.2 | `E₁₂`, `p = 2`; `diag((j+1)^{−2})`, `p = 1` | `\|X\|u* = E₂₁`, pairing `1`; `u*\|X\| = 0`; `π²/6` | sound |
| 1.3 | `Tr(A)E₁₁` on `M_n` | `C₀ = 1`, `C₁ = n`, bound `n^{1−1/p}` | sound |
| 1.4 | transpose on `M_n`; unbounded `T` with `‖T‖₁ = 0` | `1`, `n`, `1`, `n`; `1 ≤ 0·∞` avoided by finiteness | sound |
| 2.1 | `min(x,y)`; `1_{(1,2)}` | `1/6 = 1/6`; `E₁₂` | sound |
| 2.2 | `E₁₂E₂₁`; `iE₁₂` | `1`; `i` (not `−i`) | sound |
| 2.3 | `(iE₁₂)^T`; `[[1,1],[0,0]]` | `iE₂₁`; `√2` | sound |
| 2.4 | `ℓ²` kernel `u_i u_j` | `‖k‖₂ = π²/6`, sum `∞` | sound; R05 |
| 2.5 | masses `(1,3)`; adjoint of `g ↦ g(1)·1`; `{1,2,3,4}` | `(a+3b)/4`; `(4,0)`; `(1/2,1/2,0,0)`, mean `1/4` | sound |
| 3.1–3.3 | `[[1,2],[3,4]]`; `1_{x<y}` | `4`; `1/2` | sound |
| 3.4 | triangular truncation | unitary check, eigenvalues `4/3`, `1/3`, norm `2/√3` | sound |
| 3.5–3.7 | `[[1,2],[2,1]] = (3/2)J − (1/2)vvᵀ`; masses `(1,3)` | `2`; conjugated matrix `[[k₁₁,√3k₁₂],[√3k₂₁,3k₂₂]]` | sound |
| 4.1–4.3 | `1_{(1,2)}`; `p = 4` | `A₁₂B₂₁`; `1.0746` | sound |
| 5.1–5.3 | averages on `{1,2}`; dyadic `1_{x<y}` | `3/2 ≤ 2`, `3/4 ≤ 2/√3`, `1/4 ≤ 1`; `1/2`, `[[1/2,1],[0,1/2]]` | sound |
| 6.1 | `[[2,1],[1,1]]`, `[[1,2],[2,1]]` | `2`; `2 ≠ 1` | sound |
| 6.2 | factorisation of `[[1,2],[2,1]]` | `⟨ξ_j,η_k⟩ = 3/2 − v_jv_k/2`, norms² `2` | R01 |
| 6.3 | conjugation instance `α = (1,i)/√2` | `0` vs `1` | sound |
| 6.4 | `cos(x − y)`; route against lafforgue-delasalle-2011 lines 286–337 | `⟨ξ(x),η(y)⟩ = cos(x−y)`, norms `1` | sound |
| 7.1 | `[0,2]`, `t = 1/2`; product with σ-finite `ν`; σ-finite atom | ratio `1/4`; atomless by the density `x ↦ ν(E_x)`; finite | sound |
| 7.2 | masses `(1,1,3,3)` | hypothesis per set of `𝒜` | R03 |
| 7.3 | route against lines 508–520 | `n`-th amplification on `L²(𝓑′)` | sound |
| 8.1–8.2 | discrete `X`, `\|X\| > 𝔠`, `δ_{x₀}`; `M = x`; `1_{x=y}` | class `1`, norm `1`; `C = ∞` only; `0` vs `1` | sound |
| 9.1–9.2 | `e_a`; `cos`; modulation rule | `T_m f = f(· + a)`; `1`; `T_m(e_s f) = e_s T_{m(·+s)} f` | sound |
| 9.3 | `1_{[−1/2,1/2]}`; intertwining kernel | `\|F\|`; `m(s−t)ǧ(s−t)` | R02, R04 |
| 9.4 | Gaussian masses | `(1+R²/T²)^{−n/2}`; `0.995`, `0.0995` | sound |
| 9.5 | `n = 0`, `m = 2i`; `R T_m R` | `2`; `𝓕(m·𝓕⁻¹g) = R T_m R g` | sound |
| 10.1 | column `Σ 1_{I_k}E_{k1}`, `N = 4` | `0.866`, `0.707` | sound |
| 10.2 | `π′(A) = U_zA`; `n = 0` | `‖A‖`; seminorm `0` | sound |
| 10.3 | thresholds | `√n 8^{−k} ≤ 2^{−k} ⇔ 4^k ≥ √n`; `2√n 8^{−k} ≤ 2^{−k}/2 ⇔ 4^k ≥ 4√n`; `0.9√2 ≈ 1.27` | sound |
| 10.4 | operator form | boundary norms `≤ 1`, `Ψ(2/p) = C_∞^{2/p−1}C₂^{−2/p}TA`; `e^{−R/2} ≤ 4C e^{−R}` fails | sound |
| 11.1 | see `hmsNorm`; `σ_n` | `1, 2, 2, 3` | sound |
| 11.2 | scaling `N = 1` | `2^{j(n−2σ)}`, `2^{j(n+2)}`, `2^{j(n+2−2σ)}` | sound |
| 11.3–11.4 | `M_r(y−x, y)` with `σ(A)`; `sin y₁` | `M(x,y)`; `\|\|\|M\|\|\|_r = 1`, `\|\|\|M\|\|\|_c = ∞` | sound |
| 11.5 | `p p′`; dimension-two example | `max(p,p′) ≤ p²/(p−1) ≤ 2max`; `5.70` at `R = 10` | sound |

## Verified sound

- Declarations read: 19 (8 definitions, 11 theorems); each compared with its elaborated type and its
  README statement; no lost binder, no `set_option`, no sorry'd data, `theorem` only, one module docstring
  of the required form, imports `Mathlib` plus five `TauCeti.*` modules, all used and present at the pin.
- Targets read: 45 (§1.1–§11.5), all lines of the README (2418) and of `Suggested.lean` (288).
- Locators verified against the cached texts: every line locator of lafforgue-delasalle-2011 (43
  citations), cgpt-2023 (35), caspers-delasalle-2015 (10), pisier-grothendieck-2012 (8), mei-2007 (4),
  neuwirth-ricard-2011 (line 516), potapov-sukochev-2011 (lines 76, 339). All point at the stated
  result. The three source corrections the README makes (lafforgue-delasalle-2011 lines 249 and 348,
  cgpt-2023 lines 375–378 and 506) are right.
- Checks and worked examples recomputed: about 70 (values in the tables above); none refutes a theorem
  of the roadmap.
- Sibling citations checked at main or at the open head: OperatorIdeals 21 ids (OI-A12 … OI-C14);
  VonNeumannAlgebras V4.Core, V2 (completed tensor products), V2.RectangularL2, V13b (§13.2; the
  Hilbert-space ultraproduct is built inside the III₁ uniqueness route, as the README says);
  NoncommutativeIntegration §1.3, §1.4, §1.5, §2.1, §2.3, §2.5, §2.6, §4.3, §4.4, §7.3, §8.4;
  AutomorphicSpectralTheory §0.8, §0.9, §0.10; CStarAlgebras C1.6, C3.2; BanachSpaceTheory B4.0;
  UnboundedOperators §5.1 (UO-E01); BochnerSpaces §4.2, §7.4, §7.5. All exist with the cited content.
- Pinned declarations checked by grep at the pins: the Tau Ceti names (17) and the Mathlib names (about
  60) of the supplier contracts, with their files; all exist where cited (`ENNReal.HolderConjugate` is in
  `Mathlib/Basic/ENNReal/Holder.lean` at this pin). The claims "Mathlib/Tau Ceti has no …" hold at the pins
  (no Schatten class or infinite-dimensional trace in Mathlib; no kernel operator, compact endpoint or
  Schur multiplier in Tau Ceti; Tau Ceti's trace files are finite-dimensional).
- Ownership: searched main and the open heads by object (Schur/Herz–Schur multipliers, Schur product
  theorem, compact endpoint, Hilbert–Schmidt kernels, operator-valued and matrix BMO, transference,
  `L^∞` conditional expectation, the eight definition names). No second owner; no shared fully qualified
  name. The `L^∞` conditional expectation and the divisibility of atomless measures are cited from
  BochnerSpaces, the kernel operator from AutomorphicSpectralTheory.
- Declared gaps: both slugs are in `design/plan.json` and in the supplier contracts with the same
  supplier; each `needs` is one statement with its hypotheses. Not raised.
- The README's norming element `|X|^{p−1}u*` is the right order; the text of
  NoncommutativeIntegration §2.1 on main has `u*|x|^{p−1}`, which pairs to `0` on `E₁₂`. The package does
  not depend on it (§1.2 constructs its own).
- Policy: no pull-request numbers, no process narrative, no `lemma` declaration, every target has a
  locator, sixteen cited works are all in `sources.toml` under one key each.

## Not verifiable

- Chapter-level locators into texts settled as uncertified (simon-trace-ideals-2005 Ch. 2,
  gohberg-krein-1969 Ch. III, reed-simon-1-1980 §VI.6, paulsen-2002 Ch. 3 and 8, pisier-similarity-2001
  Ch. 5, horn-johnson-topics-1991 Ch. 5, grafakos-classical-2014 Theorem 6.2.7, musat-2003 Theorem 3.1,
  jrwz-2020): not read. The norm formula of §6.1 has only chapter-level locators; theorem numbers could
  not be supplied without the texts.
- Elaboration: no Lean was run in this pass; the comparison used `scratch/signatures.md`.
- Whether VonNeumannAlgebras will expose the Hilbert-space ultraproduct of V13b for an arbitrary sequence
  of Hilbert spaces and an arbitrary non-principal ultrafilter on `ℕ`: its text builds it for "a sequence
  of counterexamples" inside one route and names no target for it.
- The order `O(p)` of the constant in gap `semifinite-martingale-bmo-interpolation` rests on jrwz-2020 and
  musat-2003 (uncertified); only cgpt-2023 lines 471–484 was read.

Source independence: 12 passages compared with 4 sources (lafforgue-delasalle-2011, cgpt-2023, caspers-delasalle-2015, pisier-grothendieck-2012), none shared; largest share lafforgue-delasalle-2011, 43 of 124 locators; contents compared with lafforgue-delasalle-2011 (§1.1–§1.5; its §1.2 is spread over Layers 3, 4 and 6, its §1.4 over Layers 5 and 7, its §1.1 is part of Layer 1) and with cgpt-2023 (§1.2 and §2 against Layers 10 and 11, whose order §10.4 → §11.5 forces and whose sections are ordered differently from the source's steps): independent.

## Source issues

- **Misprint** in lafforgue-delasalle-2011 at Remark 1.4, printed page 6 (line 249): the source says the class of the larger exponent q is the interpolation space between the classes of p and p′; it should be the class of p between those of q and q′; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at the proof of Lemma 1.9, printed page 8 (line 348): the source says the embedding by the square root of the density lands in the Schatten class of the ν-space; it should be the Schatten class of the μ-space; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at §1.4, printed page 9 (line 359): the source says the conditional expectation on the product goes to the bounded functions of the larger product σ-algebra; it should be the product of the smaller σ-algebra; affects nothing.
- **Error** in lafforgue-delasalle-2011 at Remark 1.6, printed page 7 (line 262): the source says the stabilised symbol has the same completely bounded norm for every σ-finite second factor; it should exclude the zero measure, where the stabilised norm is zero; affects nothing.
- **Error** in cgpt-2023 at §1.2, printed page 8 (lines 375–378): the source says the periodised, strip-removed operator has mean zero for every k; it should require 4^k ≥ √n (it fails for n = 2, k = 0); affects nothing.
- **Gap** in cgpt-2023 at the proof of Theorem 1.1, printed page 10 (line 506): the source says the Schatten norm of A is the limit of the norms of the strip-removed operators; it should be only the lower bound by their lower limit, which suffices; affects nothing.
- **Misprint** in cgpt-2023 at §2, step 5 (line 910): the source says the derivative of the column symbol is a frequency derivative of M at the shifted point; it should be the derivative of M in its second variable there; affects nothing.

## For the human reviewers

- **Licence.** Nine cited works are recorded `uncertified` in `packages/SchattenClassesAndSchurMultipliers/sources.toml` (books and two journal articles); they are cited by chapter or theorem number only and their texts were not read in this pass.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0cf1df530fd157bd1a821a276b5ce097b33c16a3", "job": "RT-SchattenClassesAndSchurMultipliers~1b", "model": "fable", "worker": "chris-x52"} -->
