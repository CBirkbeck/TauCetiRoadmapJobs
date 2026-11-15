<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17047#issuecomment-6903335602 -->
Red team round 2 pass b (claude) of 347e4ae

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) submultiplicativity of `‖·‖_{cb,p}` fails in `[0, ∞]` when the factors are `0` and `∞`

   **Location.** `packages/SchattenClassesAndSchurMultipliers/README.md:719`:
   "`‖S ∘ T‖_{cb,p} ≤ ‖S‖_{cb,p} ‖T‖_{cb,p}`; `‖·‖_{cb,p}` is a seminorm in `[0, ∞]`."

   **Claim.** For arbitrary linear maps `S, T` on `S₂`, every `1 ≤ p ≤ ∞`, with values in `[0, ∞]` and
   no finiteness hypothesis.

   **Witness.** `p = 1` on `ℓ²(ℕ)`, `w₀ = diag(1/(j+1))`: `S` fixes `w₀` and is `0` on `S₁`
   (`‖S‖_{cb,1} = 0`); `T(A) = ⟨e₀, A e₀⟩ w₀` (`‖T E₀₀‖₁ = ∞`). Then `S T E₀₀ = w₀`, so
   `‖S ∘ T‖_{cb,1} = ∞ > 0 · ∞`.

   Here `S` is the map of the README's own Check at `:771-777`. The README reads `0 · ∞` as `0` (`:776`), and states the finiteness hypothesis for the
   interpolation law of the same list (`:726-729`) but not here. The other mixed case is sound:
   `‖T‖_{cb,p} = 0` gives `T^{(m)} A = 0` whenever `‖A‖_p < ∞`, so the left side is `0`. For `p ≥ 2`
   every `A ∈ S₂` has `‖A‖_p < ∞`, so `‖S‖_p = 0` forces `S = 0`. The consumers (§3.5, Schur
   multipliers, where a zero norm forces `M = 0`) are not affected.

   **Repair.** Replace the bullet at `README.md:719` by:

   > - `‖S ∘ T‖_{cb,p} ≤ ‖S‖_{cb,p} ‖T‖_{cb,p}` when both norms are finite, and more generally unless
   >   `‖S‖_{cb,p} = 0` and `‖T‖_{cb,p} = ∞`; that case occurs only for `p < 2`, since for `p ≥ 2` a map
   >   of norm `0` vanishes on `S₂`. The same holds for `‖·‖_p`. `‖·‖_{cb,p}` is a seminorm in `[0, ∞]`.

   and add to the Checks of §1.4:

   > - Composition needs the exclusion: at `p = 1` on `ℓ²(ℕ)`, with `T` the map of the interpolation Check
   >   (`‖T‖_{cb,1} = 0`) and `R(A) = ⟨e₀, A e₀⟩ w₀` (`‖R E₀₀‖₁ = ‖w₀‖₁ = ∞`), `T R E₀₀ = w₀`, so
   >   `‖T ∘ R‖₁ = ∞` while `‖T‖_{cb,1} ‖R‖_{cb,1} = 0 · ∞`.

   Tested on the witness: the repaired law excludes `(0, ∞)`; in the reverse order `R ∘ T` vanishes on
   `S₁`, norm `0 ≤ ∞ · 0`.

2. **F02** (P3) §1.4: the map `A ↦ V A W` is typed on spaces the section does not define

   **Location.** `README.md:720`: "For bounded `V : K → K'` and `W : H' → H`, the map `A ↦ V A W` has
   `‖·‖_{cb,p} ≤ ‖V‖ ‖W‖`".

   **Claim.** The amplification and the norms `‖·‖_p`, `‖·‖_{cb,p}` of §1.4 apply to this map.

   **Witness.** `README.md:708`: the section defines them for "a linear map `T : S₂(H) → S₂(K)`", with
   `S₂(H)` operators on `H`. For `A` on `H`, `V A` needs `V` defined on `H`; with `V : K → K'` the
   product exists only for `A : H → K`, a rectangular class with no amplification norm here.

   **Repair.** "For bounded `V : H → K` and `W : K → H`, the map `A ↦ V A W : S₂(H) → S₂(K)` has
   `‖·‖_{cb,p} ≤ ‖V‖ ‖W‖`; for an isometry `U : H → K` the map `A ↦ U A U*` is a complete isometry
   `S₂(H) → S₂(K)`, and `B ↦ U* B U : S₂(K) → S₂(H)` a complete contraction left inverse to it."
   Tested on the uses: §2.4 (`ι(A) = V A V*`, `P(B) = V* B V` with `V : L²(𝒜) → L²(𝓑)`; `A ↦ U A U*`
   with `U : L²(ν) → L²(μ)`) all have this shape.

3. **F03** (P3) §3.3, the README anchor of the Lean definition `schurNorm`, has no Checks

   **Location.** `README.md:1121-1139` (§3.3: "which is the definition `schurNorm` of
   `Suggested.lean`"); the section ends at its *Needs* line with no **Checks.** block and no worked
   instance.

   **Claim.** Each definition has at least three discriminating Checks.

   **Witness.** No instance between `README.md:1121` and `:1139`. The normalisation of the supremum
   (`‖A‖_p ≤ 1`, not `‖A‖₂ ≤ 1`) and the strictness of the lower semicontinuity are pinned nowhere.

   **Repair.** Add before the *Needs* line of §3.3:

   > **Checks.**
   >
   > - A one-point space of mass `w > 0` and `M = c`: `L² = ℂ`, the operator `a` has kernel `a/w`,
   >   `S_M(a) = c a` and `‖S_M‖_p = |c|` for every `p`, whatever `w`.
   > - The supremum is over `‖A‖_p ≤ 1`: on `{1, 2}` with counting measure and `M = 1`, `S_M = id` and
   >   `‖S_M‖₁ = 1`; normalising `A` in `S₂` instead would give `sup { ‖A‖₁ : ‖A‖₂ ≤ 1 } = √2`, attained
   >   at `A = 1/√2`.
   > - The norm is not the essential supremum of the symbol for `p ≠ 2`: the triangular truncation on
   >   `M₂` has `‖M‖_∞ = 1` and `‖S_M‖_∞ = 2/√3` (§3.4).
   > - Lower semicontinuity can be strict: on `ℕ` with counting measure, `M_k = 1_{(k,k)} → 0`
   >   everywhere with `‖M_k‖_∞ = 1`; `S_{M_k}(A) = A_{kk} E_{kk}` has `‖S_{M_k}‖_p = 1` for every `p`
   >   (attained at `E_{kk}`), while the limit multiplier is `0`.

   Each value was computed as shown (`‖1/√2‖₂ = 1`, `‖1/√2‖₁ = 2/√2 = √2`).

4. **F04** (P3) §9.2 Check label says "infinite-measure support" for a set of measure `2`

   **Location.** `README.md:1929`: "Tracial picture, a projection of infinite-measure support: `n = 1`,
   `k = 2`, `g = 1_{[0, 2]} E₁₁`".

   **Claim.** The projection `g` has support of infinite measure.

   **Witness.** `|[0, 2]| = 2`, and the Check itself computes `τ₂(|g|^p) = 2`. A projection of
   infinite-measure support has `τ = ∞` and lies in no `Lᵖ`, `p < ∞`, as the last Check of the same
   list says of `1_{[0, ∞)} E₁₁` (`README.md:1940-1941`).

   **Repair.** Replace the label by "Tracial picture on a space of infinite measure:"; the rest of the
   bullet stands (`2^{1/p}` on both sides, `1` at `p = ∞`).

5. **F05** (P3) §9.4 uses the Fourier transform of a Gaussian and names no declaration for it

   **Location.** `README.md:2012-2013` ("with a nonnegative Gaussian weight of total mass
   `∫ f_R g_R → 1` and of width at most `1/R` in `ξ`") and the *Needs* line `README.md:2021`
   ("§9.2; Mathlib `MeasureTheory.Lp.fourierTransformₗᵢ`").

   **Claim.** Every input of the route is a target, a supplier section or a named pinned declaration.

   **Witness.** The route needs `𝓕 γ_T = Tⁿ γ_{1/T}`. It is pinned as `fourier_gaussian_innerProductSpace`
   (`Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:353`), which the supplier
   contracts and the *Needs* line do not list.

   **Repair.** Add to "From Mathlib": "`fourier_gaussian_innerProductSpace`
   (`Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean`): on a finite-dimensional real
   inner product space `V`, the Fourier transform of `v ↦ e^{−b‖v‖²}` (`Re b > 0`) is
   `(π/b)^{dim V/2} e^{−π²‖w‖²/b}`; with `b = π/T²` this is `𝓕 γ_T = Tⁿ γ_{1/T}` (§9.4)." and append
   the name to the *Needs* line of §9.4. Tested: `b = π/T²` gives `(T²)^{n/2} e^{−πT²|w|²}`.

One P2 finding (a law of §1.4 that is false in `[0, ∞]` for general linear maps) and four P3
findings. No Lean statement was found false as typed. `packages/SchattenClassesAndSchurMultipliers/README.md`
(2528 lines) and `packages/SchattenClassesAndSchurMultipliers/Suggested.lean` (289 lines) were read
in full. No Lean was run (read-only pass); the elaborated types of the worker's signature listing
(19 declarations) were compared with the README statement by statement.

## Round 1 findings at this head

| Earlier finding | Repaired passage at 347e4ae | Status |
|---|---|---|
| 1a/F01 (P3), transference cited beyond the sources' hypotheses | `README.md:2029-2036`: "state Theorem 4.2 and Corollary 5.3 for symbols in `M_cbA(G)` … and Theorem 5.2 for `1 < p < ∞` … The statement here … is reached by the route below"; `Suggested.lean:245-246`: "for symbols in `M_cbA(ℝⁿ)`, extended to `L^∞` symbols in README §9.5" | repaired; caspers-delasalle-2015 lines 449–451 and 529–531 reread, they agree with the new sentence |
| 1a/F02 (P3), tracial reading of §10.3/§10.4 | `README.md:466-468`: "§3.5: for a semifinite trace `τ` on `M`, the tracial `Lᵖ(M, τ)` … is the weight-independent Haagerup `Lᵖ(M)`"; `README.md:2189`: "read tracially through its §1.5 and §3.5"; *Needs* at `:2216`, `:2263` | repaired; NoncommutativeIntegration §3.5 and §4.4 on main reread (its lines 755–766, 878–886) |
| 1b/F01 (P2), fixed finite-dimensional `K` | `README.md:1477-1479`: "For one fixed `K` of finite dimension `d` the infimum can be larger, since a factorisation through `K` writes `M` as a sum of at most `d` elementary symbols"; Check at `:1494-1498`; Summary `:18-19` | repaired; `[[1, 2], [2, 1]]`: determinant `−3`, rank `2`, through `ℂ` infimum `∞`, through `ℂ²` value `2` |
| 1b/F02 (P2), unowned `Lᵖ(ℝⁿ; S_p^k)` identification | `README.md:1892-1910`, new target "The tracial picture of `Lᵖ(ℝⁿ; S_p^k)`"; `:1963` "(the tracial picture of §9.2)"; *Needs* `:1945` | repaired; one new slip in a Check label, S04 below |
| 1b/F03 (P3), "same measure" within which set | `README.md:1649-1651`: "every minimal nonempty set `A` of `𝒜` is a union of minimal nonempty sets of `𝓑` that all have one measure, a value which may depend on `A`" | repaired; lafforgue-delasalle-2011 lines 489–490 reread |
| 1b/F04 (P3), Layer 2 missing from §9.3 | `README.md:1996-1998`: "§2.1 (`Λ_F(g)` is defined by its kernel …), §2.2 (the trace formula …)"; `:583`; `:2082` | repaired |
| 1b/F05 (P3), §2.4 without Checks | `README.md:948-964`, three Checks | repaired; recomputed: `P(E₁₁) = 1/2`, kernel `1/4`; `C_φ E₁₂ C_φ* = E₃₁` (with `φ⁻¹`: `E₂₃`); `U*U = 1`, `UU* = E₀₀` |
| 1b/F06 (P3), phantom declaration | `Suggested.lean:16-17`: "so that no operator is defined here whose / construction is itself a theorem:" | repaired; the signature listing now has 19 declarations |

No finding of the repair report is marked `not actionable in this package`, so nothing is re-raised.

## Verified sound

**Dependency check** (the brief's command, run at this head):

    depcheck: 237 roadmaps, 2245 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The roadmap is line 310 of `merge-order/ORDER.txt`, after
NoncommutativeIntegration (309) and AutomorphicSpectralTheory (100). BochnerSpaces is another
author's open pull request that adds a new roadmap folder, which the rules admit. The pull request
changes only `packages/SchattenClassesAndSchurMultipliers/` (`git diff --stat origin/main...HEAD`:
README.md, Suggested.lean, metadata.toml and five reports).

**Counts.** Declarations read: 19 (8 definitions, 11 theorems). Targets read: 45 (§1.1–§11.5).
Source locators reread against the cached texts in this pass: 31 (lafforgue-delasalle-2011 14,
cgpt-2023 11, caspers-delasalle-2015 3, pisier-grothendieck-2012 2, mei-2007 1). Checks and worked
examples recomputed: 58. Sibling citations opened at the owner: 19 sections plus 24 OperatorIdeals
ids. Pinned declarations grepped: 31 Mathlib names, 18 Mathlib file paths, 17 Tau Ceti names, 10 Tau
Ceti files; none missing.

**Record of the pass: `Suggested.lean`.** Context: section `Gauge` has `E F` complex, complete
(both `CompleteSpace` instances are in the elaborated type of `schattenGauge`); section `Schur` has
`{Ω} [MeasurableSpace Ω]`, and `{μ}` from line 92; each theorem carries `[SigmaFinite μ]`,
`MemLp M ∞ (μ.prod μ)` and `[Fact (1 ≤ p)]` in its own signature; section `Continuous` has `X`
locally compact, T2, Borel, with `μ` and its three instances explicit. The binders `⨆ j, …` bind at
precedence 60, above `=` and `∧`, so the conjunctions parse as intended.

| Declaration | Instances tried | Values on each side | Result |
|---|---|---|---|
| `schattenGauge` | `diag(1/(j+1))` at `p = 1, 2, ∞`; identity of `ℓ²(ℕ)` at `∞` | `∞`, `π/√6`, `1`; `∞` (not compact) | as §1.1 |
| `IsKernelOperator` | point of mass `w`, `k = c`; `{1,2}`, `1_{(1,2)}` | `T = cw`; `E₁₂` (not `E₂₁`) | row convention |
| `schurNorm` | point of mass `w`, `M = c`; `{1,2}`, `M = 1`, `p = 1` | `\|c\|`; `1` (the `S₂`-normalised model gives `√2`) | as §3.3; see S03 |
| `schurCbNorm` | point mass, `M = c`; level `m = 0` | `\|c\|` at every `m ≥ 1`; `0` | as §3.5 |
| `schurNorm_two_eq` | mass `5`, `M = 3i`; `M = 1_{(k,k)}` on `ℕ`; `μ = 0` | `3 = 3 = 3`; `1`; `0` | true |
| `schurNorm_eq_of_holderConjugate` | `1_{(1,2)}` and its swap, `(p,q) = (1,∞)`; triangular; `p = q = 2` | `1 = 1`; `2/√3` four times; trivial | true |
| `schurNorm_interpolation` | `p₀ = 1`, `p₁ = ∞`, `θ = 1/2`, triangular on `M₂`; on `ℕ` | `1 ≤ 2/√3`; `1 ≤ ∞` | true; a zero endpoint forces `M = 0` |
| `schurNorm_mono_of_abs_inv_sub_le` | `(p,q) = (4, 4/3)` both ways; `(∞, 2)` | `1/4 = 1/4`, equality as duality gives; `1/2 ≤ 0` false, nothing claimed (`2/√3 > 1`) | true |
| `schurNorm_of_posSemidef` | `[[1, i], [−i, 1]]`; one point, `M = (0)`; empty `ι` | `= vv*`, unitary conjugation, `1 = max diag`; `0 = 0`; `0 = ⨆ ∅` | true |
| `haagerupNorm` | `[[1, i], [−i, 1]]`, `ξ = η = (1, i)` in `ℂ`; `ξ = 0`, `‖η‖_∞ = ∞` | `conj(ξ_j) η_k = M_{jk}`, norms `1`, value `1`; `0 · ∞ = 0` only with `M = 0` | agrees with the previous row |
| `schurNorm_eq_haagerupNorm` | the same matrix; triangular truncation on `ℕ` | `1` five times; `∞` five times (no bounded factorisation) | true |
| `schurNorm_eq_schurCbNorm_of_forall_not_isAtom` | Lebesgue on `[0,1]`, `1_{x<y}`, `p = 2`; Lebesgue `+ δ₀` | `1 = 1`; excluded (`{0}` is an atom) | Tau Ceti `IsAtom` read at the pin: measurable, positive, subsets of measure `0` or `μ A` |
| `schurNorm_le_iff_of_continuous`, cb form | `e^{i(x−y)}` on `[0,1]`, `C = 1` and `C = 1/2`; discrete `{0,1}`, `μ = δ₀`; `μ = 0` | both true; both false (`N = 1`, `\|M(s,s)\| = 1`); `\|M(0,0)\| ≤ C` both; both true | true; the complement of the support is null for a σ-finite measure with `InnerRegularCompactLTTop` |
| `lpSchattenNorm` | `1_{[0,1]} I₂`, `p = 1, 2, ∞` | `2`, `√2`, `1` | as §9.2 |
| `fourierMultiplierCbNorm` | `m = 1`; `n = 0`, `m = c`; `k = 0` | `1`; `\|c\|`; `0` | as §9.2 |
| `schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm` | `m = 1`; `m = cos`; `n = 0` | `1 = 1`; `1 = 1`; `\|m(0)\|` both | true |
| `hmsNorm` | `M = 1`, `n = 1, 2`; `M(x,y) = x`; `sign(x − y)` | `2`, `2`; `∞`; `2` | `Finset.range (n/2 + 2)` is `k = 0, …, σ_n` |
| `schurNorm_le_hmsNorm` | `sign(x − y)`, `p = 2`; quantifier order | `1 = 1 ≤ C · 4 · 2`; `∃ C, ∀ M, ∀ p` | as cgpt-2023 lines 149–154 and 1042–1046 |

Headline theorems (README Summary): isometry on `S₂`; duality and transposition; log-convexity;
monotonicity; Schur product norm formula; Grothendieck–Haagerup; atomless theorem; continuous
symbols (norm and cb); transference; Hörmander–Mikhlin–Schur. All are stated. The one not stated
(multiplicativity and `*`-compatibility of `M ↦ S_M`) is named in the module docstring with the
missing carrier. One-tactic probe: no declaration follows from one pinned lemma or restates a
definition (`Matrix.PosSemidef.hadamard` gives positivity, not the norm formula).

**Record of the pass: README targets.**

| Target | Instances recomputed | Values | Result |
|---|---|---|---|
| 1.1 | non-compact `X` at `q = ∞`; lower semicontinuity at `∞` | `Σ aₙ^p = ∞` for every `p`; non-compact operators form an open set | sound |
| 1.2 | `p = 1` with `‖B‖ ≤ 1`; `E₁₂` | `Tr(X P_d) → π²/6`; `\|X\|u* = E₂₁`, `u*\|X\| = 0` | sound |
| 1.3 | `Tr(A)E₁₁` on `M_n` | `n^θ = n^{1−1/p_θ}`; exchanged exponents `n^{1/4} < n^{3/4}` | sound |
| 1.4 | composition with norms `(0, ∞)` and `(∞, 0)`; duality at `p = 1`; transpose | `∞ ≰ 0`; `0 ≤ 0`; `t^♯ = t`, `n` | S01, S02 |
| 2.1 | `min(x, y)` | `(16/π⁴)(π⁴/96) = 1/6 = 2 ∫_0^1 y³/3` | sound |
| 2.2–2.3 | `i E₁₂`; `[[1,1],[0,0]]` | `i` (not `−i`); `i E₂₁` against `−i E₂₁`; `√2` | sound |
| 2.4 | the three new Checks; kernel of `U A U*` | `1/2`, `1/4`; `E₃₁`; `E₀₀`; `√h(x) k(x,y) √h(y)` by substitution `dν = h dμ` | sound |
| 2.5 | masses `(1,3)`; adjoint of `g ↦ g(1)·1` | `(a + 3b)/4`; `(φ(1) + 3φ(2), 0)`, `1 ↦ (4, 0)` | sound |
| 3.1–3.2 | `[[1,2],[3,4]]`; `1_{(1,2)}` | `4`; `S_{M̃}(E₁₂) = 0` | sound |
| 3.3 | finite-rank reduction at `p = ∞`; strict lower semicontinuity | truncations converge in `S₂`, gauge lower semicontinuous; `0 < 1` | sound; S03 |
| 3.4–3.7 | `(3/2)J − (1/2)vvᵀ`; masses `(1,3)` | entries `1, 2`; `2` | sound |
| 4.1–4.3 | `1_{(1,2)}`; zero endpoint | `A₁₂B₂₁`; `M = 0` | sound |
| 5.1–5.3 | averages; dyadic `1_{x<y}`; empty family | `3/2 ≤ 2`, `3/4 ≤ 1.1547`, `1/4 ≤ 1`; `1/2`, `≥ 1`; `1` against `0` | sound |
| 6.1 | `[[2,1],[1,1]]`; `[[1,2],[2,1]]` | `2`; `2 ≠ 1` | sound |
| 6.2 | factorisation of `[[1,2],[2,1]]`; `K = ℂ` | `3/2 ∓ 1/2`, norms² `2`; rank `≤ 1` against determinant `−3` | sound |
| 6.3 | `α = (1, i)/√2`, `M = diag(1, i)` | `1/2 + i·i/2 = 0`; unconjugated `1` | sound |
| 6.4 | `cos(x − y)`; zero and infinite factor norms | `1` five times; `M = 0`, or bound `∞` | sound |
| 7.1 | product with σ-finite `ν`; σ-finite atom of infinite measure | split the density `x ↦ ν(E_x)`; each finite piece has measure `0`, so none | sound |
| 7.2–7.3 | masses `(1,1,3,3)`, `(1,2,3,3)` | holds; weights `(1,2,2,4)/9` against `1/4` | sound |
| 8.1–8.2 | support without isolated points and purely atomic `μ`; `M = x` | nearby distinct support points realise amplifications; `C = ∞` only | sound |
| 9.1–9.2 | covariance kernel; modulation; tracial Checks | `m(x − t − y) k_A(x, y)`; `e_s T_{m(·+s)}`; `2^{1/p}`, `√2`, `k^{1/p}` | sound; S04 |
| 9.3 | `p = 1` factorisation `g = uv`; pairing | `u = w\|g\|^{1/2}`, `\|u\|² = \|v\|² = \|g\|`; `\|F ∩ (F − u)\| = \|F ∩ (F + u)\|` | sound |
| 9.4 | Gaussian masses | `(1 + R²/T²)^{−n/2}`, `(1 + T²/R²)^{−n/2}`; `0.995`, `0.0995` | sound; S05 |
| 9.5 | `R T_m R`; `n = 0` | `𝓕(m 𝓕⁻¹ g) = R 𝓕⁻¹(m 𝓕 R g)`; `\|m(0)\|` | sound |
| 10.1 | column `Σ 1_{I_k} E_{k1}` | `1 − Σ a_k²`, `(1 − 1/N)^{1/2}`; `diag(a) − aaᵀ`, `2^{−1/2}`; `0.866`, `0.707` | sound |
| 10.2 | `π′(A) = U_z A`; `n = 0` | `A*A − \|mean\|² → A*A`; seminorm `0` | sound |
| 10.3 | thresholds | `√n 8^{−k} ≤ 2^{−k} ⇔ 4^k ≥ √n`; `2√n 8^{−k} ≤ 2^{−k}/2 ⇔ 4^k ≥ 4√n` | sound |
| 10.4 | operator form | `λ_j = ln C_∞ − ln C₂ + (p/2) ln s_j` real; boundary norms `≤ 1`; `Ψ(2/p) = C_∞^{2/p−1} C₂^{−2/p} T A` | sound |
| 11.1 | `ξ/√(1+ξ²)` | maximum at `ξ = 1/√2`: `2/(3√3)`, term `4/(3√3) ≈ 0.770` | sound |
| 11.3–11.4 | `M_c(x, x − y)`, `M_r(y − x, y)`; near part | `M(x, y)` both; `5^{n/2} ‖M‖_∞ ‖A‖` | sound |
| 11.5 and examples | `p p′`; `φ((x−y)/⟨x⟩)`; dimension two | `max(p, p′) ≤ p²/(p−1)`; `\|t\|^{k+1} + \|t\|^k`; `∂² t₁ = R/D²`, `5.70` at `R = 10` | sound |

**Suppliers opened at the owner.** NoncommutativeIntegration §1.3, §1.5, §2.1, §2.3, §2.5, §2.6,
§3.5, §4.4 on main (all with the cited content; §2.5 includes the endpoint `L^∞ = M`).
VonNeumannAlgebras V2 (completed Hilbert tensor products), V2.RectangularL2 (the unitary, and its
agreement with `μ.prod ν` for σ-finite measures), V4.Core and §13.2 (V13b) on main and at the head
of its open revision: the ids are unchanged there. BanachSpaceTheory B4.0 at the head of its open
revision: the id is kept in the heading. AutomorphicSpectralTheory §0.8–§0.10 at its open head
(`kernel_apply`, `kernel_unique`, `kernel_norm`; standard Borel, as the README says). BochnerSpaces
§4.2, §7.4, §7.5 at its open head (Fubini isometry with section formula; the `L^∞` contraction as
adjoint of the `L¹` projection under a σ-finite trim; divisibility of atomless finite measures).
OperatorIdeals on main: OI-A12, A23, A25–A30, A38–A40, B29, B32–B35, B41, B76, B80, B83, B88, C01,
C13, C14 read; each says what the README uses it for.

NoncommutativeIntegration §2.1 on main still writes the norming element as `u*|x|^(p−1)`, which is
`0` for `x = E₁₂`; the package states the form it consumes (`|X|^{p−1}u*`) and builds it in §1.2, so
nothing here depends on that text.

**Gaps.** Both slugs are in `design/plan.json` and in the supplier contracts with the same supplier;
each `needs` is one statement with its hypotheses; neither asks for what the pins or main provide
(no kernel operator on `Lp` at either pin; NoncommutativeIntegration §8.4 is finite-tracial).

**Ownership.** Searched main and the open heads by object: Schur and Herz–Schur multipliers,
Hadamard multipliers, operator-valued, matrix and martingale BMO, Hilbert–Schmidt kernels, the
compact endpoint, and the eight definition names. No second owner. `schattenGauge` on main is
`TauCetiRoadmap.OperatorIdeals.schattenGauge`, another namespace and another object.

**Policy.** No pull-request number, process narrative, `lemma`, `set_option`, `#eval` or machine
path in the README or the Lean file; imports are `import Mathlib` and five `TauCeti.*` modules that
exist at the pin; sixteen cited works, each under one key of `sources.toml`.

**Source independence:** 14 passages compared with 5 sources (lafforgue-delasalle-2011 lines 174–179, 226–238, 246–252, 274–278, 487–492, 505–507, 524–534; cgpt-2023 lines 149–154, 246–252, 471–484, 1042–1046; caspers-delasalle-2015 lines 449–451, 529–531; pisier-grothendieck-2012 lines 781–782; mei-2007 lines 96–103), none shared beyond the wording the mathematics forces; largest share lafforgue-delasalle-2011, 42 of 113 locators; contents compared with lafforgue-delasalle-2011 (§1.1–§1.5, lines 180, 212, 338, 352, 521): independent. Its §1.2 is spread over Layers 3, 4 and 6, its §1.3 is one target of Layer 3, its §1.4 is spread over Layers 2, 5 and 7, and Layers 9–11 have no counterpart; Layer 5 precedes Layer 6 because the *Needs* line of §6.4 names §5.1.

## Not verifiable

- The nine works settled as uncertified (pisier-similarity-2001, grafakos-classical-2014,
  simon-trace-ideals-2005, gohberg-krein-1969, reed-simon-1-1980, paulsen-2002,
  horn-johnson-topics-1991, musat-2003, jrwz-2020): cited by chapter or theorem number; texts not
  read.
- Elaboration: no Lean was run; the comparison of types used the worker's signature listing, and no
  `#check` file was elaborated in this pass.
- The upper bound `‖S_M‖_∞ ≤ 2/√3` for the triangular truncation on `M₂`: taken as the known value;
  only the lower bound (eigenvalues `4/3`, `1/3`) was recomputed.
- The proofs of Theorems 1.7, 1.18 and 1.19 of lafforgue-delasalle-2011 and of Theorem A of
  cgpt-2023: statements, hypotheses and boundary cases were checked; the internal steps of
  cgpt-2023 Lemma 1.3 and of the localised intertwining (§10.3, §11.3) were read, not recomputed.
- BochnerSpaces §7.5 does not define "atomless"; the README fixes the reading by `IsAtom`. Whether
  that roadmap adopts it cannot be settled from its text.

## Source issues

- **Misprint** in lafforgue-delasalle-2011 at Remark 1.4, printed page 6 (line 249): the source says the class of the larger exponent q is the interpolation space between the classes of p and p′; it should be the class of p between those of q and q′; affects nothing.
- **Error** in lafforgue-delasalle-2011 at Remark 1.6, printed page 7 (line 262): the source says the stabilised symbol keeps the completely bounded norm for every σ-finite second factor; it should exclude the zero measure, where every norm is zero; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at the proof of Lemma 1.9, printed page 8 (line 348): the source says the embedding by the square root of the density lands in the Schatten class of the ν-space; it should be that of the μ-space; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at §1.4, printed page 9 (line 359): the source says the conditional expectation on the product goes to the bounded functions of the product of the larger σ-algebra; it should be the product of the smaller one; affects nothing.
- **Gap** in lafforgue-delasalle-2011 at the definition before Lemma 1.17, printed page 12 (lines 487–488): the source says an atom is a measurable set that cannot be split into two sets of positive measure; it should also require positive measure; affects nothing.
- **Error** in cgpt-2023 at §1.2, printed page 8 (lines 375–378): the source says the periodised, strip-removed operator has mean zero for every k; it should require 4^k ≥ √n (it fails for n = 2, k = 0); affects the proof.
- **Gap** in cgpt-2023 at the proof of Theorem 1.1, printed page 10 (line 506): the source says the Schatten norm of A is the limit of the norms of the strip-removed operators; it should be the lower bound by their lower limit, which suffices; affects the proof.
- **Misprint** in cgpt-2023 at §2, printed page 15 (line 910): the source says the frequency derivative of the column symbol is a frequency derivative of M at the shifted point; it should be the derivative of M in its second variable there; affects nothing.

## For the human reviewers

- **Licence.** `packages/SchattenClassesAndSchurMultipliers/sources.toml` records nine works as `uncertified` (books and two journal articles); they are cited by chapter or theorem number and their texts were not read.
- **Licence.** The `version_note` fields of `packages/SchattenClassesAndSchurMultipliers/sources.toml` say that lafforgue-delasalle-2011 and mei-2007 are cited by the numbering of their arXiv versions, not compared with the published versions.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "347e4ae3b44466b6194088c86bc53f3ccd2f802c", "job": "RT-SchattenClassesAndSchurMultipliers~2b", "model": "fable", "worker": "chris-x88"} -->
