<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17047#issuecomment-6903308921 -->
Red team round 2 pass a (claude) of 347e4ae

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the cubes of `𝕋ⁿ` are not determined, and translation invariance fails under one reading

   **Location.** `packages/SchattenClassesAndSchurMultipliers/README.md:2089-2090` ("cubes are
   axis-parallel cubes of positive side, in `𝕋ⁿ` of side at most `1`"), `:2097` ("The same definitions
   on `𝕋ⁿ`"), `:2105` ("Invariance under translations, dilations and the reflection of the variable").

   **Claim.** `‖f‖_{BMO^c(𝕋ⁿ)}` is a defined number and is invariant under translations of `𝕋ⁿ`.

   **Witness.** `n = 1`, `f(z) = z·e` on `[0, 1)`, `e` a rank-one projection. Intervals inside `[0, 1)`
   (the reading of cgpt-2023 line 380, cubes inside a fundamental domain): variance `L²/12 ≤ 1/12`,
   seminorm `0.289`. The arc `[3/4, 5/4)`: variance `7/48`, seminorm `≥ 0.382`. The translate by `1/2`
   has the jump inside `[0, 1)` and seminorm `≥ 0.382` under either reading.

   No Check of §10.1 separates the two readings (all three take their extreme value on `Q = 𝕋` or on
   an interval inside `[0, 1)`).

   **Repair.** In the Layer 10 header replace "in `𝕋ⁿ` of side at most `1`" by:

   > a cube of `𝕋ⁿ` is the image under `ℝⁿ → 𝕋ⁿ` of a cube of `ℝⁿ` of side at most `1`, so it may wrap
   > around, and the average of `f` over it is the average of the `1`-periodic lift of `f` over that
   > cube of `ℝⁿ`.

   In §10.1 replace the invariance bullet by "Invariance under translations and the reflection of the
   variable, on `ℝⁿ` and on `𝕋ⁿ`, under dilations on `ℝⁿ`, and under `f ↦ U f V` for unitaries `U`, `V`."
   Add the Check:

   > - Cubes of `𝕋` wrap around: for `f(z) = z·e` on `[0, 1)` the intervals inside `[0, 1)` give at
   >   most `(1/12)^{1/2} ≈ 0.289`, while the arc `[3/4, 5/4)` gives `(7/48)^{1/2} ≈ 0.382` and the arcs
   >   `[1 − h, 1 + h)` give `(1/4 − h/2 + h²/3)^{1/2} → 1/2`; so `‖f‖_{BMO^c} = 1/2`, the value of every
   >   translate of `f`. A definition by intervals of one fundamental domain would not be translation
   >   invariant.

   In §10.3, after the statement of Lemma 1.3, add: "cgpt-2023 takes the cubes inside `[−1/2, 1/2]ⁿ`
   (line 380); since `π_k J_k(A)` is `1`-periodic, a wrapped cube lifts to a cube of `ℝⁿ` of side at
   most `1` and the same argument applies." Tested on the witness: under the repaired definition `f` and
   its translate both have seminorm `1/2`; the dyadic comparison of §10.1 is unchanged (dyadic cubes are
   cubes under both readings).

2. **F02** (P3) Lemma 1.3 route: the rescaled cubes have side up to `8^k`, not `8^k/2`

   **Location.** `packages/SchattenClassesAndSchurMultipliers/README.md:2194-2195` ("by rescaling cubes
   of `𝕋ⁿ` to cubes of side up to `8^k/2` in `ℝⁿ`").

   **Claim.** Every cube of `𝕋ⁿ` rescales to a cube of side at most `8^k/2`.

   **Witness.** cgpt-2023 lines 380 and 405: `Q = 8^k S` with `S ⊂ [−1/2, 1/2]ⁿ`, so
   `Q ⊂ [−8^k/2, 8^k/2]ⁿ` has side up to `8^k`. Instance: `S = 𝕋ⁿ` (side `1`), the cube of the `k = 0`
   term of the dyadic comparison of §10.1, rescales to side `8^k > 8^k/2`.

   **Repair.** Replace by "by rescaling the cubes of `𝕋ⁿ`, of side at most `1`, by the factor `8^k` to
   cubes of side at most `8^k` in `ℝⁿ`". Tested on the instance: `𝕋ⁿ` gives side `8^k`, covered.

3. **F03** (P3) a Check label contradicts its own instance

   **Location.** `packages/SchattenClassesAndSchurMultipliers/README.md:1929-1930` ("Tracial picture, a
   projection of infinite-measure support: `n = 1`, `k = 2`, `g = 1_{[0, 2]} E₁₁`").

   **Claim.** The projection `g` has support of infinite measure.

   **Witness.** The support of `1_{[0, 2]} E₁₁` is `[0, 2]`, of measure `2`; the Check itself computes
   `τ₂(|g|^p) = 2`. A projection of infinite-measure support is `1_{[0, ∞)} E₁₁` of `README.md:1940`,
   which lies in no `Lᵖ`.

   **Repair.** Replace the label by "Tracial picture, a projection of finite trace on a space of
   infinite measure:". The values of the Check (`2`, `2^{1/p}`, `1`) are unchanged.

4. **F04** (P3) §9.3 and §9.5 use the restriction invariance of §3.7 without listing it

   **Location.** `packages/SchattenClassesAndSchurMultipliers/README.md:1996-1998` (*Needs* of §9.3) and
   `:2070-2071` (*Needs* of §9.5: "§3.3, §4.2, §8.2, §9.1–§9.4").

   **Claim.** The intertwining of §9.3 and the Fourier side of §9.5 need nothing of §3.7.

   **Witness.** `README.md:1950-1951`: `Λ_F(g)` is an operator on `L²(F)^k`; `:1977`: `S_{M_m}(Λ_F(g))`
   is the multiplier of `M_m` restricted to `F × F`; `:2040`:
   `‖S_{M_m}(Λ_{Q_R}(g))‖_p ≤ ‖S_{M_m}‖_p ‖Λ_{Q_R}(g)‖_p` is the Restriction bullet of §3.7 (`:1234-1235`).

   **Repair.** *Needs* of §9.3: add "§3.7 (restriction of the symbol to `F × F`)" after §3.5. *Needs* of
   §9.5: "§3.3, §3.7, §4.2, §8.2, §9.1–§9.4". No order changes: Layer 9 already needs Layer 3.

Four P3 findings (S01–S04), all in Layers 9 and 10 of `packages/SchattenClassesAndSchurMultipliers/README.md`.
No P1 or P2 finding. No Lean statement was found false as typed. All eight findings of round 1 are
repaired at this head and no repair introduced an error.
`packages/SchattenClassesAndSchurMultipliers/README.md` (2528 lines) and
`packages/SchattenClassesAndSchurMultipliers/Suggested.lean` (289 lines) were read in full. No Lean
was run (read-only pass); the elaborated types were read from the worker's signature listing.

## Round 1 findings at this head

| Finding | Repaired passage (file:line, quoted) | Status | Witness recomputed |
|---|---|---|---|
| 1a/F01 (transference cited beyond the sources' hypotheses) | `README.md:2029-2036`: "state Theorem 4.2 and Corollary 5.3 for symbols in `M_cbA(G)` … and Theorem 5.2 for `1 < p < ∞` (line 543); cgpt-2023 states (FS) with no hypothesis on `m`"; `Suggested.lean:245-246`: "for symbols in `M_cbA(ℝⁿ)`, extended to `L^∞` symbols in README §9.5" | repaired | caspers-delasalle-2015 lines 485–486, 543, 626 and cgpt-2023 lines 62–72 read; `m = sign`, `p = 2`: both sides `‖m‖_∞ = 1` |
| 1a/F02 (tracial reading of NoncommutativeIntegration §4.4) | `README.md:466-474` (new §3.5 bullet; §4.4 "stated for the Haagerup spaces … Read through NoncommutativeIntegration §3.5 and §1.5"); `README.md:2189`, `2216`, `2263`, `2276` | repaired | `TauCetiRoadmap/NoncommutativeIntegration/README.md:755-764` (§3.5 identifies tracial `Lp(M,τ)` with the Haagerup model) and `:878-881` (§4.4, probability space) |
| 1b/F01 (fixed finite-dimensional `K`) | `README.md:1473-1479`: "one fixed infinite-dimensional separable `K` … For one fixed `K` of finite dimension `d` the infimum can be larger"; Check at `1494-1498`; Summary `18-19` | repaired | `K = ℂ`, `[[1,2],[2,1]]`: rank ≤ 1 against determinant `−3`, infimum `∞`; through `ℂ²`: `‖ξ_j‖² = 3/2 + 1/2 = 2`, value `2` |
| 1b/F02 (unowned `Lᵖ(ℝⁿ; S_p^k)` identification) | `README.md:1892-1910` (new target "The tracial picture of `Lᵖ(ℝⁿ; S_p^k)`"), Checks `1929-1941`, §9.3 `1961-1964` "(the tracial picture of §9.2)" | repaired; one Check label wrong, S03 | `1_{[0,2]}E₁₁`: `τ₂ = 2`, norm `2^{1/p}`; `1_{[0,1]}[[1,1],[0,0]]`: `a*a = [[1,1],[1,1]]`, singular values `√2, 0`, norm `√2` against entrywise `2^{1/p}` |
| 1b/F03 (equal measure per set of `𝒜`) | `README.md:1649-1651`: "that all have one measure, a value which may depend on `A`"; Checks `1663-1673` | repaired | masses `(1,1,3,3)`: values `1`, `3`; masses `(1,2,3,3)`: weights `(1·1, 1·2, 2·1, 2·2)/9` against `1/4` |
| 1b/F04 (§9.3 needs Layer 2) | `README.md:1996-1998`: "§2.1 (`Λ_F(g)` is defined by its kernel …), §2.2 (the trace formula …), §3.1, §3.5"; `583`; `2082` | repaired; one further edge missing, S04 | — |
| 1b/F05 (§2.4 without Checks) | `README.md:948-964` (three Checks) | repaired | `P(ι(a)) = (a/2)·4/2 = a`; kernel constant `2c = 1/2`, `c = 1/4`; `C_φδ₁ = δ₃`, `C_φδ₂ = δ₁`, `E₃₁`; `U*U = 1`, `UU* = E₀₀` |
| 1b/F06 (docstring line starting with `theorem`) | `Suggested.lean:16-19`: "so that no operator is defined here whose construction is itself a theorem" | repaired | the signature listing has 19 declarations, none named `is` |

## Dependency check

    depcheck: 237 roadmaps, 2245 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The roadmap is at line 310 of `merge-order/ORDER.txt`, after
NoncommutativeIntegration (309), AutomorphicSpectralTheory (100), CStarAlgebras (7) and
VonNeumannAlgebras (5); BanachSpaceTheory and OperatorTheory are on main; BochnerSpaces is an open
pull request that adds a new roadmap folder.

## Record of the pass: `Suggested.lean` (19 declarations)

Context: section `Gauge`, `E F` complex Hilbert and complete; section `Schur`, `{Ω} [MeasurableSpace Ω]`
and `{μ}` from line 92, with `[SigmaFinite μ]`, `hM : MemLp M ∞ (μ.prod μ)` and `[Fact (1 ≤ p)]` in
each theorem's own signature; section `Continuous`, `X` locally compact, T2, Borel, `μ` explicit
with `SigmaFinite`, `IsFiniteMeasureOnCompacts`, `InnerRegularCompactLTTop`. Elaborated types
compared with the README statements: none lost a binder.

| Declaration | Instances tried | Values on each side | Result |
|---|---|---|---|
| `schattenGauge` | identity of `ℓ²(ℕ)`; rank-one projection; `diag(1/(j+1))` | `∞` at every `p` (not compact at `∞`); `1`; `(π²/6)^{1/2}` at `2`, `∞` at `1`, `1` at `∞` | agrees with §1.1 |
| `IsKernelOperator` | `{1,2}`, `k = 1_{(1,2)}` | `Tδ₂ = δ₁`, `T = E₁₂`; transposed convention `E₂₁` | row convention fixed |
| `schurNorm` | `[[1,2],[3,4]]`, `p = 2`; `μ = 0`; `M(x,y) = x`, `k = u ⊗ v` with `u = 1_{[1,∞)}/x` | `4` at `E₂₂`; `0`; `M·k = 1_{[1,∞)}(x)1_{[0,1]}(y)` not in `L²`, no `B`, pair skipped | agrees with §3.3 when `M ∈ L^∞` |
| `schurCbNorm` | `m = 0`; `M = 1`, `μ ≠ 0` | `0`; `1` | level `0` harmless |
| `schurNorm_two_eq` | `μ = 0`; `[[1,2],[2,1]]` | `0 = 0 = 0`; `2 = 2 = ‖M‖_∞` | true |
| `schurNorm_eq_of_holderConjugate` | `(1,∞)`, `[[1,1],[0,1]]`; `M = 1_{(1,2)}` | truncated unitary has `B*B = [[2,√2],[√2,3]]/3`, eigenvalues `4/3`, `1/3`, so `≥ 2/√3` at both; `Tr(S_M(A)B) = A₁₂B₂₁ = Tr(A S_{M^t}(B))` | true |
| `schurNorm_interpolation` | endpoints `(∞, c > 0)`; `(∞, 0)`; `p₀ = 2`, `p₁ = ∞`, `θ = 1/2` on the truncation | `∞^{1/2}·c^{1/2} = ∞`; cannot occur (zero endpoint forces `M = 0`); `p = 4`, bound `(2/√3)^{1/2} = 1.0746` | true without finiteness |
| `schurNorm_mono_of_abs_inv_sub_le` | `p = 2`; `p = ∞` | hypothesis `0 ≤ …` always; `1/2 ≤ |1/q − 1/2|` forces `q ∈ {1, ∞}` | true |
| `schurNorm_of_posSemidef` | `[[2,1],[1,1]]`; empty `ι`; `[[1,2],[2,1]]` | `2` at `E₁₁`; `⨆ ∅ = 0`; not PSD, `2 ≠ 1` | true |
| `haagerupNorm` | `[[1,2],[2,1]]`; `ξ = 0`, `‖η‖_∞ = ∞`; `μ = 0` | `2`; `0·∞ = 0` with `M = 0` a.e.; `0` | agrees with §6.2 |
| `schurNorm_eq_haagerupNorm` | `[[1,2],[2,1]]`; `cos(x − y)` | `S_M(E₁₂) = 2E₁₂`, bound `3/2 + 1/2 = 2`, `‖M‖_H = 2`; `⟨ξ(x), η(y)⟩ = (e^{i(y−x)} + e^{i(x−y)})/2`, all `1` | true |
| `schurNorm_eq_schurCbNorm_of_forall_not_isAtom` | `μ = 0`; counting on `{1,2}`; countable–cocountable | `0 = 0`; excluded (`{1}` is an atom); excluded (the space is an atom) | hypothesis is the right one |
| `schurNorm_le_iff_of_continuous` | `μ = 0`; `δ₀ + δ₁`, `M` with values `[[1,2],[2,1]]`; `M(x,y) = x`, Lebesgue | support empty, both true; `2 ≤ C` on both sides (`N = 2`), `N = 1` gives `1 ≤ C`; left false, right false at `N = 1`, `s = C + 1` | true; complement of the support is null (σ-finite, inner regular on finite-measure sets) |
| `schurCbNorm_le_iff_of_continuous` | same; distinct points of `X × Fin m` | repeated `x` with distinct levels gives the amplified matrices | true |
| `lpSchattenNorm` | `1_{[0,1]}[[1,1],[0,0]]`; `k = 0` | `√2` at every `p`; `0` | agrees with §9.2 |
| `fourierMultiplierCbNorm` | `m = e_a`; `m = cos(2π⟨a,·⟩)`, `p = 1` | `T_m f = f(· + a)`, `1`; `‖T_m f‖₁ = ‖f‖₁` for `f ≥ 0`, `1` | agrees with §9.2; pin: `fourierMultiplierCLM F m f = 𝓕⁻(m • 𝓕 f)` |
| `schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm` | `n = 0`, `m = 2i`; `m = sign`, `p = 2`; `m = e_a` | `2 = 2`; `1 = 1`; `1 = 1` | true |
| `hmsNorm` | `sign(x − y)`; `ξ/√(1+ξ²)`; `Finset.range (n/2 + 2)` at `n = 1, 2, 3, 4` | `2`; `2 + 2·(1/√2)(3/2)^{−3/2} = 2 + 4/(3√3) = 2.770`; `k ≤ 1, 2, 2, 3 = σ_n` | agrees with §11.1 |
| `schurNorm_le_hmsNorm` | `M = 1`, `p = 2`; `p ↦ p'` | `1 ≤ C·4·2`, `C ≥ 1/8`; `p'²/(p' − 1) = p²/(p − 1)` | consistent with cgpt-2023 lines 149–154 and 1042–1043 |

Headline theorems of the Summary: the `S₂` isometry; duality and transposition; log-convexity;
monotonicity; the Schur product theorem with norms; Grothendieck–Haagerup; the atomless theorem;
continuous symbols (norm and completely bounded form); Fourier–Schur transference;
Hörmander–Mikhlin–Schur. All are stated. Not stated and named in the module docstring with the
missing carrier: multiplicativity and `*`-compatibility of `M ↦ S_M`. Padding probe: no declaration
follows by one tactic or one pinned lemma, restates a definition or mirrors a Check.

## Record of the pass: README targets (45)

| Target | Instances recomputed | Values | Result |
|---|---|---|---|
| 1.1 | `diag(1/(j+1))`; compressions of the identity | `π²/6`, `‖·‖₁ = ∞`; `α^{1/p} → ∞` against `1` at `p = ∞` | sound |
| 1.2 | `E₁₂`, `p = 2` | `|X|u* = E₂₂E₂₁ = E₂₁`, pairing `1`; `u*|X| = 0` | sound |
| 1.3 | `Tr(A)E₁₁` on `M_n` | `C₀ = 1`, `C₁ = n`, `n^θ = n^{1−1/p_θ}`; exchanged `n^{1/4} < n^{3/4}` | sound |
| 1.4 | transpose; the unbounded `T` fixing `w₀` | flip unitary to `n` × rank-one projection; `‖T‖₁ = 0`, `‖T‖₂ = ∞`, `‖T‖_{4/3} ≥ 1`; a map with a `♯`-adjoint is `S₂`-bounded | sound |
| 2.1 | `min(x,y)` | `(16/π⁴)(π⁴/96) = 1/6 = ∫∫ min²` | sound |
| 2.2 | `iE₁₂` | `conj(−i) = i`; without conjugation `−i` | sound |
| 2.3 | `(A*)^T`, `(A^T)*` | both `J A J` | sound |
| 2.4 | the three Checks; change of measure | as in the table of round 1 findings; `√h(x) k^ν(x,y) √h(y)` | sound |
| 2.5 | adjoint of `g ↦ g(1)·1`, masses `(1,3)`; `{1,2,3,4}` | `(φ(1) + 3φ(2))·1_{{1}}`, `1 ↦ (4,0)`; `(1/2,1/2,0,0)`, mean `1/4` | sound |
| 3.1–3.3 | `[[1,2],[3,4]]`; `1_{x<y}` | `4`; `1/2` | sound |
| 3.4 | truncation on `M₂` | columns of `A` orthonormal; eigenvalues `4/3`, `1/3` | sound |
| 3.5–3.7 | `(3/2)J − (1/2)vvᵀ`; masses `(1,3)` | diagonal `1`, off-diagonal `2`; `[[k₁₁, √3k₁₂],[√3k₂₁, 3k₂₂]]` | sound |
| 4.1–4.3 | `1_{(1,2)}`; `1_{x=y}` on `ℕ` | `A₁₂B₂₁`; diagonal projection, norm `1` | sound |
| 5.1–5.3 | averages on `{1,2}`; dyadic `1_{x<y}` | `3/2`, `3/4`, `1/4`; `1/2`, `[[1/2,1],[0,1/2]]` | sound |
| 6.1 | `[[2,1],[1,1]]` | `2`; `M^t = M̄` PSD with the same diagonal | sound |
| 6.2 | `ξ_j = (√(3/2), v_j/√2)` | `3/2 − v_jv_k/2`, norms² `2`; `K = ℂ` gives `∞` | sound |
| 6.3 | `α = (1,i)/√2`, `M = diag(1,i)` | `1/2 + i·i/2 = 0`; unconjugated `1` | sound |
| 6.4 | `cos(x−y)`; `K_n = ℂ` | coordinates `(D_{e^{−ix}}AD_{e^{ix}} + D_{e^{ix}}AD_{e^{−ix}})/2`; `⟨[1],[i]⟩ = i` | sound |
| 7.1 | `[0,2]`, `t = 1/2`; `μ ⊗ ν` | ratio `1/4`; atomless by the density `x ↦ ν(E_x)` and splitting `{density > ε}` | sound |
| 7.2 | masses `(1,2,3,3)` | `(1,2,2,4)/9` against `1/4` | sound |
| 7.3 | chain of the route | amplification on `L²(𝓑')`, then §7.2 on `E[M|𝓑'⊗𝓑']`, tower law, §5.1 | sound |
| 8.1–8.2 | `M = x`; two-point matrices | `|M(s,t)| ≤ C` from matrix units; `C = ∞` only | sound |
| 9.1 | covariance; `cos` | kernel `m(x − t − y)k(x,y)`; `c(x)c(y) + s(x)s(y)`, norm `→ 1` | sound |
| 9.2 | modulation; tracial Checks | `m(ξ)𝓕f(ξ − s)`; `2^{1/p}`, `√2`, `k^{1/p}` | S03 |
| 9.3 | `1_{[−1/2,1/2]}`; pairing; `p = 1` factorisation | `|F|`; `|F ∩ (F+u)|`; `|u|² = |g|^{1/2}w*w|g|^{1/2} = |g|` | S04 |
| 9.4 | Gaussian masses; modulated test | `(1 + R²/T²)^{−n/2}`, `0.995`, `0.0995`; entries `e_{s_i − s_j} a_{ij} f_R` give `Σ m(s_i − s_j) a_{ij} b_{ji}` | sound |
| 9.5 | `𝓕 m 𝓕⁻¹`; `n = 0` | `R T_m R`, on `e_a`: `f(· − a)`; `2 = 2` | sound |
| 10.1 | column `Σ 1_{I_k}E_{k1}`; `e^{2πiz}e`; sawtooth | `1 − Σa_k²`, `diag(a) − aaᵀ` with eigenvalues `1/2, 0` at `I₁ ∪ I₂`; `1`; `1/12` against `7/48` | S01 |
| 10.2 | `π'(A) = U_zA`; `n = 0` | `A*A − A*(⨍U)*(⨍U)A → A*A`; seminorm `0` | sound |
| 10.3 | thresholds; small and large cubes | `4^k ≥ √n`, `4^k ≥ 4√n`; `2π·4^k·2√n·8^{−k}`, `1/(4^k·2^{−k})` | S02 |
| 10.4 | operator form; `n = 0` | `λ_i = ln(C_∞/C₂) + (p/2) ln s_i` real, boundary norms `≤ 1`; `e^{−R/2} ≤ 4C e^{−R}` fails | sound |
| 11.1 | see `hmsNorm`; `sin x₁` | `∞`, norm `1` | sound |
| 11.2 | scaling at `N = 1` | `2^{j(n−2σ)}`, `2^{j(n+2)}`, `2^{j(n+2−2σ)}` | sound |
| 11.3–11.4 | `M_c`, `M_r` on the entry `(x,y)` | `M_c(x, x−y) = M(x,y)`, `M_r(y−x, y) = M(x,y)`; `∂_ξ^γ M_c = (−1)^{|γ|}(∂_y^γ M)(x, x−ξ)` | sound |
| 11.5 | constants; dimension-two example | `p (C_n|||M|||)^{1−2/p}(|||M|||/2)^{2/p}`; `D = 11.05`, `0.786 + 6.18`, `5.70` at `R = 10` | sound |

## Verified sound

- Declarations read: 19 (8 definitions, 11 theorems). Targets read: 45 (§1.1–§11.5).
- Locators verified against the cached texts in this pass: 28 (lafforgue-delasalle-2011 lines 246–252,
  262, 274–278, 281–285, 346–349, 356–359, 442, 487–490, 505–507, 524–530; cgpt-2023 lines 59–72, 79,
  149–154, 231–237, 247–252, 313–318, 348–378, 379–454, 471–484, 506, 910, 1042–1046;
  caspers-delasalle-2015 lines 26–34, 483, 485–487, 529–531, 543–545, 626–628). All point at the
  stated result. The locators added by the round 1 repair are among them.
- Checks and worked examples recomputed: about 60 (values in the tables above); none refutes a theorem of
  the roadmap.
- Sibling citations checked at main or at the open head: NoncommutativeIntegration §1.3, §1.5, §2.1,
  §2.3, §2.5, §2.6, §3.5, §4.4, §8.4 (main); VonNeumannAlgebras V2 (completed tensor products),
  V2.RectangularL2 (it proves `κ = μ.prod ν` for σ-finite measures), V4.Core, V13b (§13.2, the
  Hilbert-space ultraproduct with quotient inner product, completeness and coordinate norm) (main);
  CStarAlgebras C1.6, C3.2 (main); BanachSpaceTheory B4.0 (main); OperatorIdeals OI-A12, OI-A38,
  OI-B80 and UnboundedOperators §5.1 (UO-E01) (main); AutomorphicSpectralTheory §0.8, §0.9, §0.10 at
  its open head (§0.8 is for σ-finite standard Borel spaces, as the README says); BochnerSpaces §4.2,
  §7.4, §7.5 at its open head (the `L∞` contraction as adjoint of the `L¹` projection under a σ-finite
  trim, the divisibility of atomless finite measures, the Fubini isometry).
- Pinned declarations checked by grep at the pins: 34 Mathlib names and 21 Tau Ceti names of the
  supplier contracts, with their files; none missing. `ENNReal.HolderConjugate` is in
  `Mathlib/Basic/ENNReal/Holder.lean` at this pin; `MeasureTheory.Measure.IsAtom` is "measurable,
  positive, every measurable subset null or of full measure"; `MeasureTheory.Measure.support` is the
  set of points all of whose neighbourhoods have positive measure.
- Ownership: searched main and the open heads by object (Schur and Herz–Schur multipliers, Schur
  product theorem, Haagerup factorisation, Hörmander–Mikhlin–Schur, Fourier–Schur transference,
  operator-valued and matrix BMO, the eight definition names). No second owner.
  NoncommutativeIntegration §8.4 owns the finite-tracial martingale `BMO_C`; the cube seminorms of
  Layer 10 are a different object and the semifinite martingale form is the declared gap.
  `TauCetiRoadmap.OperatorIdeals.schattenGauge` on main has a different fully qualified name.
- Declared gaps: both slugs are in `design/plan.json` and under `## Exact supplier contracts`, each
  with a named supplier and one statement with its hypotheses. Not raised.
- Policy: `git diff --stat origin/main...HEAD` touches only
  `packages/SchattenClassesAndSchurMultipliers/` (README.md, Suggested.lean, metadata.toml, five
  reports). No pull-request number, process narrative, `lemma`, `set_option`, `#eval` or machine path
  in the README or the Lean file; imports are `import Mathlib` and five `TauCeti.*` modules; every
  target has a locator; the sixteen cited works each have one key in `sources.toml`.
- Signatures: the elaborated types of the worker's listing were compared with the README statements
  declaration by declaration; nothing changed. No `#check` file was elaborated in this pass.

Source independence: 13 passages compared with 3 sources (lafforgue-delasalle-2011 lines 274–278, 487–492, 505–507, 524–530; cgpt-2023 lines 59–72, 149–154, 247–252, 348–378, 379–454, 471–484; caspers-delasalle-2015 lines 26–34, 485–487, 529–545), none shared beyond four consecutive words; largest share lafforgue-delasalle-2011, 43 of 129 locators; contents compared with lafforgue-delasalle-2011 (§1.1–§1.5: its §1.2 is spread over Layers 3, 4 and 6, its §1.3 is part of §2.4 and §3.7, its §1.4 is spread over Layers 5 and 7, and Layers 2, 9, 10 and 11 have no counterpart) and with cgpt-2023 (§1.1, §1.2, §2): independent.

## Not verifiable

- The nine uncertified sources (pisier-similarity-2001, grafakos-classical-2014,
  simon-trace-ideals-2005, gohberg-krein-1969, reed-simon-1-1980, paulsen-2002,
  horn-johnson-topics-1991, musat-2003, jrwz-2020): cited by locator only; texts not read.
- The upper bound `‖S_M‖_∞ ≤ 2/√3` for the triangular truncation on `M₂`: only the lower bound was
  recomputed.
- Elaboration: no Lean was run; the comparison used the worker's signature listing and the repair
  report's statement that the file elaborates with 11 `sorry` warnings.
- The localised intertwining of §11.3 and the far-part estimate of §11.4 (cgpt-2023 lines 595–608 and
  859–1026): statements, symbols and exponents were checked; the proof was not followed line by line.
- Whether BochnerSpaces §7.5 reads "atomless" as "no `IsAtom` set": its text does not define the word;
  the README fixes the reading and shows the other one false.
- OperatorIdeals ids other than OI-A12, OI-A38, OI-B80 were confirmed by the citation resolver only.

## Source issues

- **Misprint** in lafforgue-delasalle-2011 at Remark 1.4, printed page 6: the source says the class of the larger exponent `q` is the interpolation space between the classes of `p` and `p′`; it should be the class of `p` between those of `q` and `q′`; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at the proof of Lemma 1.9, printed page 8: the source says the embedding by the square root of the density lands in the Schatten class of the `ν`-space; it should be the Schatten class of the `μ`-space; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at §1.4, printed page 9: the source says the conditional expectation on the product goes to the bounded functions of the product of the larger σ-algebra; it should be the product of the smaller σ-algebra; affects nothing.
- **Error** in lafforgue-delasalle-2011 at Remark 1.6, printed page 7: the source says the stabilised symbol has the same completely bounded norm for every σ-finite second factor; it should exclude the zero measure, where every norm is zero; affects nothing.
- **Gap** in lafforgue-delasalle-2011 at the definition before Lemma 1.17, printed page 12: the source says an atom is a measurable set that cannot be split into two sets of positive measure; it should also require positive measure; affects nothing.
- **Error** in cgpt-2023 at §1.2, printed page 8: the source says the periodised, strip-removed operator has mean zero for every `k`; it should require `4^k ≥ √n` (two points of one unit cube of the plane can be at distance `1.27`); affects the proof.
- **Gap** in cgpt-2023 at the proof of Theorem 1.1, printed page 10: the source says the Schatten norm of `A` is the limit of the norms of the strip-removed operators; it should be the lower bound by their lower limit, which is what is used; affects the proof.
- **Misprint** in cgpt-2023 at §2, the display before (2.15): the source says the frequency derivative of the column symbol is a frequency derivative of `M` at the shifted point; it should be the derivative of `M` in its second variable there; affects nothing.

## For the human reviewers

- **Licence.** Nine cited works are recorded `uncertified` in `packages/SchattenClassesAndSchurMultipliers/sources.toml` (seven books, musat-2003, jrwz-2020); they are cited by chapter or theorem number and their texts were not read.
- **Licence.** README locators into lafforgue-delasalle-2011, cgpt-2023, caspers-delasalle-2015 and mei-2007 are line numbers of the arXiv versions named under References; their numbering was not compared with the published versions.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "347e4ae3b44466b6194088c86bc53f3ccd2f802c", "job": "RT-SchattenClassesAndSchurMultipliers~2a", "model": "fable", "worker": "chris-x83"} -->
