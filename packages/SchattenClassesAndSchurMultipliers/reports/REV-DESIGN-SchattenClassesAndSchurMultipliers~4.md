<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13838#issuecomment-6798250902 -->
Review (claude) of 29ae8c8

Verdict: needs_changes

1. **F01** (P2) The kernel gap asks the supplier for a trace formula this roadmap already derives

   **Location:** `packages/SchattenClassesAndSchurMultipliers/design/README.md` 365–367 ("must provide §0.8 and the first assertion of §0.10 for arbitrary σ-finite measure spaces"), 645–651, 658; `design/plan.json`, gap `sigma-finite-hilbert-schmidt-kernels`, field `needs` ("and Tr(T_1 T_2) = int int K_1(x, y) K_2(y, x) …").

   **Claim:** Both the kernel embedding and the trace formula are missing and must come from AutomorphicSpectralTheory.

   **Witness:** README 612–613 already states `⟨k_A, k_B⟩ = Tr(A* B)`, and 642 states `k_{A*}(y, x) = conj k_A(x, y)`. Hence `Tr(AC) = ⟨k_{A*}, k_C⟩ = ∫∫ k_A(x, y) k_C(y, x)`, for two spaces at once.

   **Exact repair:** Delete the trace-formula clause from the gap's `needs` and `detail` in plan.json, from the README contract (lines 362–367: keep §0.9, drop §0.10 and "the first assertion of §0.10"), from the Scope bullet (line 84) and from the §2.2 Needs line. In §2.2 prove the trace formula, for `A ∈ S₂(L²(ν), L²(μ))` and `C ∈ S₂(L²(μ), L²(ν))`, from the polarised kernel isometry of §2.1 applied to the pair `(A*, C)` and the adjoint kernel; the disjoint-union argument is then not needed. The gap's section becomes `§0.8`. Tested on the instances of the section: `A = E₁₂`, `C = E₂₁`: `k_{A*} = 1_{(2,1)}`, `⟨k_{A*}, k_C⟩ = 1 = Tr(AC)`; `A = iE₁₂`: `k_{A*} = −i·1_{(2,1)}`, `conj(−i)·1 = i = Tr(AC)`.

2. **F02** (P3) The layer-level dependencies name Layer 4 where no target uses it

   **Location:** README 402–404: "Layer 5 needs Layers 3 and 4 … Layer 7 needs Layers 4 and 5. Layer 8 needs Layers 4 and 5"; the Dependencies of Layers 5, 7 and 8 (lines 1118, 1328, 1408).

   **Claim:** Layers 5, 7 and 8 wait for Layer 4.

   **Witness:** No `*Needs:*` line of §5.1–§5.3, §7.1–§7.3, §8.1–§8.2 cites a §4 target, and plan.json lists no `target:4.x` among their prerequisites. Layer 5 does use Layer 2 (§2.2, §2.4, §2.5), which line 402 omits.

   **Exact repair:** Line 402–405: "Layer 5 needs Layers 2 and 3. … Layer 7 needs Layers 3 and 5. Layer 8 needs Layers 1, 3 and 5. Layer 9 needs Layers 3, 4 and 8. … Layer 11 needs Layers 2, 3, 4, 7 and 10." Dependencies: Layer 5 "Layers 2–3", Layer 7 "Layers 3 and 5", Layer 8 "Layers 1, 3 and 5".

3. **F03** (P3) §9.1 is placed behind §6.4 for one Check

   **Location:** README 1434–1435 and 1439 ("*Needs:* §3.1, §3.3, §3.7, §6.4"); plan.json target 9.1, prerequisite `target:6.4`.

   **Claim:** The Toeplitz symbol needs the Grothendieck–Haagerup theorem on σ-finite spaces.

   **Witness:** Only the `cos` Check uses §6.4; line 1574 says so ("§6.4 in a Check"). The prerequisite puts §9.1, hence §9.3 and §9.5, behind §6.4 with its suppliers V13b and B4.0.

   **Exact repair:** Replace the Check's bound by the average of two characters: `M_{cos(2π⟨a, ·⟩)} = (M_{e_a} + M_{e_{−a}})/2`, each `S_{M_{e_{±a}}}` a conjugation by a diagonal unitary, so every norm is at most `(1 + 1)/2 = 1`. Remove §6.4 from the Needs line and `target:6.4` from plan 9.1; change line 1574 to "Layers 3, 4, 8". The factorisation stays as an example in §6.4, where it already is.

4. **F04** (P3) plan.json and the README disagree on the prerequisites of 5.2 and 5.3

   **Location:** plan.json targets 5.2 and 5.3 (`target:3.5`); README 1084 and 1107 ("§3.6").

   **Claim:** The two files list the same prerequisites.

   **Witness:** Mechanical comparison of the 45 Needs lines with the plan: the only differences among this roadmap's own targets are 5.2 and 5.3, where the plan has 3.5 and the README §3.6. Both routes use the stabilisation on `Ω × ℕ` (§3.6).

   **Exact repair:** In plan.json replace `target:3.5` by `target:3.6` in targets 5.2 and 5.3 (3.6 already requires 3.5).

5. **F05** (P3) Eight consumed Mathlib declarations are absent from the supplier contract

   **Location:** README 169–234 (`### From Mathlib`).

   **Claim:** The contract lists the declarations consumed, by name.

   **Witness:** Cited in Needs lines or routes but not in the contract: `WithLp` (579), `MeasureTheory.integral_prod` (633), `MeasureTheory.Measure.withDensity` (779), `Matrix.toEuclideanCLM`, `Matrix.kroneckerMap` (874), `Matrix.transpose` (681), `geometric_hahn_banach_point_closed` (1206), `ContDiffBump.ae_convolution_tendsto_right_of_locallyIntegrable` (1563).

   **Exact repair:** Add one contract bullet per group with what is assumed: the Hilbert sum `WithLp 2`; Fubini for integrable functions on `μ.prod ν`; the measure with density; matrices as operators on `EuclideanSpace` and the Kronecker product; the separation of a point from a closed convex set; almost-everywhere convergence of `φ_i ⋆ g` to a locally integrable `g` for normalised bumps with bounded ratio of radii. All eight exist at the pin (files under Verified sound).

6. **F06** (P3) A Check of §7.3 states more than its source

   **Location:** README 1313–1315: "whether norm and completely bounded norm agree for all of them at `1 < p < ∞`, `p ≠ 2`, is not known (lafforgue-delasalle-2011 lines 281–285)".

   **Claim:** The source says the question is open for the multipliers of `M₂`.

   **Witness:** lafforgue-delasalle-2011 lines 281–285 state a conjecture for `S_p(ℓ²)` and that no multiplier on any `S_p^n` is known to have different norm and completely bounded norm. They do not say that equality is unproved for `n = 2`.

   **Exact repair:** "…so its Schur multipliers are those of `M₂`, to which the proof does not apply (a two-point space cannot be refined); the source records that no Schur multiplier on `S_p^n` with different norm and completely bounded norm is known, and conjectures that one exists on `S_p(ℓ²)` (lafforgue-delasalle-2011 Conjecture 1.8, lines 281–285)."

7. **F07** (P3) §5.2 admits the empty family

   **Location:** README 1068–1070; plan.json target 5.2.

   **Claim:** `‖f‖ = sup_α ‖f_α‖` for every directed family generating `𝓑`.

   **Witness:** Empty family, `𝓑 = {∅, Ω}`, `μ(Ω) = 1`, `f = 1`: `L²(𝓑) = ℂ` and the left side is `1`; the supremum over the empty family is `0`. Mathlib's `Directed` does not include nonemptiness.

   **Exact repair:** "Let `(𝓑_α)` be a nonempty directed family…", and the same hypothesis in plan 5.2. With one member `𝓑₀ = 𝓑` the instance reads `1 = 1`.

8. **F08** (P3) The Fourier side of §9.5 uses the compression bound outside the class §9.3 states it for

   **Location:** README 1545–1546: "for `g ∈ L² ∩ Lᵖ`, §9.3 gives `… ≤ ‖S_{M_m}‖_p ‖g‖_p`"; §9.3, line 1487: "for `g ∈ L¹ ∩ L^∞(ℝⁿ; F_k)` … `‖Λ_F(g)‖_p ≤ |F|^{1/p} ‖g‖_{Lᵖ(S_p^k)}`".

   **Claim:** The second inequality follows from §9.3 as stated.

   **Witness:** It needs `‖Λ_{Q_R}(g)‖_p ≤ |Q_R|^{1/p}‖g‖_p` for `g ∈ L² ∩ Lᵖ`. For `n = 1`, `p = 4`, `g(ξ) = (1 + |ξ|)^{−0.6}` lies in `L² ∩ L⁴` (`∫(1 + |ξ|)^{−1.2} < ∞`) and not in `L¹`.

   **Exact repair:** State the first bullet of §9.3 for `g ∈ L² ∩ Lᵖ(ℝⁿ; S_p^k)` (and `g ∈ L² ∩ L^∞` at `p = ∞`), with the step: truncations `g_j = g·1_{‖g‖ ≤ j}·1_{|ξ| ≤ j}` lie in `L¹ ∩ L^∞`, `‖g_j‖_p ≤ ‖g‖_p`, `Λ_F(g_j) → Λ_F(g)` in `S₂` since `‖Λ_F(h)‖₂ ≤ |F|^{1/2}‖h‖₂`, and the gauge is lower semicontinuous (§1.1). Mirror it in plan 9.3. On the witness the bound then reads `‖Λ_F(g)‖₄ ≤ |F|^{1/4}‖g‖₄` with both sides finite.

Eight findings: one P2 and seven P3. The eleven findings of round 3 are all repaired. The blocking finding is about a declared supplier gap that asks for more than is missing; the mathematics of the roadmap's own targets passed the adversarial pass.

Reviewed: `packages/SchattenClassesAndSchurMultipliers/design/README.md` (1,993 lines, read in full), `design/plan.json` (11 layers, 45 targets, 2 gaps) and `sources.toml` (16 entries). There is no `Suggested.lean` at the design stage. Elaboration: **not available (this lane does not elaborate)**; no Lean process was started.

## Previous findings, checked first

The round 3 report numbers its findings R01–R11; the repair report marks all eleven applied and none as not actionable. To avoid a clash with this round's numbering they are written `r3-R01` … `r3-R11` here.

| Round 3 finding | Status | Repaired passage and what was recomputed |
|---|---|---|
| r3-R01, `condExp` is zero on non-integrable inputs | Repaired | README 716: "`MeasureTheory.condExpL2` for `𝒜 ⊗ 𝒜 ⊆ 𝓑 ⊗ 𝓑`, which is `Q ⊗ Q`"; new §2.5, line 740: "define `E[φ | 𝒜]` as the class of `MeasureTheory.condExp 𝒜 (w · μ) φ`". Counting `ℕ`, `φ = 1`: `E = 1`, native value `0`. Masses `(1, 3)`, trivial `𝒜`: `(a + 3b)/4`. |
| r3-R02, norming element reversed | Repaired | README 319: "consumed in the form `|X|^{p−1}u*/‖X‖_p^{p−1}`". `X = E₁₂`: `|X|u* = E₂₁`, `Tr(XE₂₁) = 1`; reversed order `0`. §1.2 general: `Tr(XY) = Σ s_i^p/‖X‖_p^{p−1} = ‖X‖_p`, `‖Y‖_{p'} = (Σ s_i^p)^{1/p'}/‖X‖_p^{p−1} = 1`. |
| r3-R03, zero auxiliary space | Repaired | README 912: "for every σ-finite `(Ω', ν)` with `ν ≠ 0`". One point, `M = 1`: `(1, 1)` for a one-point `Ω'`, `(1, 0)` for `ν = 0`. |
| r3-R04, sesquilinear pairing | Repaired | README 1193: "`= ⟨ᾱ, S_M(a) β⟩`". `α = (1, i)/√2`, `β = (1, 1)/√2`, `a = I`, `M = diag(1, i)`: `1/2 + i·i/2 = 0` on both sides; unconjugated `1`. |
| r3-R05, `n ≥ 1` in Layer 10 | Repaired | README 1579: "Throughout this layer `n ≥ 1`". `n = 0`: `‖1‖_{BMO} = 0`, `‖1‖₂ = 1`. |
| r3-R06, unbounded smooth symbol | Repaired | README 1763: "When `|||M|||_{HMS} < ∞`, `M` defines a class in `L^∞`"; 1860: "with `‖M‖_∞ < ∞`". `M = x`: gauge `∞`, no multiplier. `sin y₁`: row part `1`, column part `∞`. |
| r3-R07, example of infinite gauge | Repaired | README 1925: "`M(x, y) = φ((x − y)/⟨x⟩)` … `φ` a Schwartz function". Recomputed: `|x − y|^k‖D_y^k M‖ = |t|^k‖D^kφ(t)‖`; `|x − y|^k‖D_x^k t‖ ≤ C_k(|t|^{k+1} + |t|^k)`; both bounded for Schwartz `φ`. The `n = 1` bound `2 sup|φ| + 4 sup|φ′|` follows from `|∂_x t| ≤ 2/D`. |
| r3-R08, zero-space Checks | Repaired | README 449 ("`d ≥ 1`"), 455 ("`α ≥ 1`"), 572 ("`H ≠ 0`"), 893–895 ("`μ ≠ 0`", "`m ≥ 2`"), 1146 ("nonempty `ι`"), each with its norm-`0` companion. |
| r3-R09, Check outside its carrier | Repaired | README 1618: "`f(z) = e^{2πiz} e`". `⨍_Q|f − f_Q|² = (1 − |⨍_Q e^{2πiz}|²)e`, equal to `e` at `Q = 𝕋`: seminorm `1`. |
| r3-R10, forward prerequisite | Repaired | §11.2 is the Littlewood–Paley target and §11.3 the twisted multipliers. Mechanical check of plan.json: 0 forward prerequisites among 45 targets. |
| r3-R11, zero constants | Repaired | README 1708: "If `C₂` or `C_∞` is `0`, the hypotheses hold with `C₂ + ε` and `C_∞ + ε`". Positive constants: `‖Ψ(it)‖_{BMO} ≤ 1`, `‖Ψ(1 + it)‖₂ = ‖A‖_p^{p/2} = 1`, `Ψ(2/p) = C_∞^{2/p−1}C₂^{−2/p}TA`. |

Repaired patterns searched in the rest of the design: uses of `condExp` outside a finite measure (none: §5.3, §6.4, §7.2, §8.2 reduce to a finite measure first); norm-one claims on possibly zero carriers (none left); sesquilinear conversions (§6.3, §6.4, §9.1 recomputed); the order of polar factors (§9.3, §10.4 correct); symbols used without a boundedness hypothesis (none).

## Verified sound

### Principles and shape

- No route-specific shortcut, no re-planned roadmap, no algorithm, no copied passage, no `set_option`, no sorry'd data (there is no Lean file). The roadmap keeps arbitrary σ-finite spaces throughout; it defines the compact endpoint because OperatorIdeals OI-B80 is `B(H)`.
- Organisation: the eleven layers are named by their mathematics and no sentence says the roadmap follows a source. Forced order: 1, 2 → 3 → 4, 5 → 6 (§6.4 uses §5.1), 7 (uses §5.2), 8 (uses §5.1) → 9 (uses §8.2) and 10 → 11 (uses §7.3, §10.4). Only the relative order of Layers 6, 7 and 8 is free; the principal source places its factorisation theorem before its conditional-expectation lemmas, the roadmap after them, so the arrangement is the roadmap's own.
- Shape: 45 targets, 45 Needs lines, 11 `### Examples` and 11 `### Dependencies`. The 17 definition and construction targets have API bullets and between 3 and 5 Checks each (1.1: 5, 1.4: 5, 2.1: 4, 2.3: 3, 2.5: 4, 3.1: 4, 3.5: 3, 6.2: 3, 7.1: 3, 9.1: 3, 9.2: 3, 9.3: 3, 10.1: 3, 10.2: 4, 10.3: 3, 11.1: 5, 11.3: 3). Every theorem has hypotheses and a locator. No LaTeX delimiters, pull-request numbers, job ids or machine paths in the README.
- Three roadmaps on main were read for shape: `TauCetiRoadmap/NoncommutativeIntegration/README.md`, `TauCetiRoadmap/BanachSpaceTheory/README.md`, `TauCetiRoadmap/OperatorTheory/ToeplitzOperators/README.md`.

### Adversarial table

| Statement | Instances | Values computed on each side | Result / change |
|---|---|---|---|
| §1.1 extended gauge | identity of `ℓ²`; `V = 0` with non-compact `X`; `P_α` | `‖1‖_p = ∞` for all `p ≤ ∞`; `‖VXW‖_∞ = 0 ≤ 0·∞ = 0`; `‖P_α‖_p = α^{1/p}`, `‖P_α‖_∞ = 1` | sound |
| §1.2 norming | `X = E₁₂`, `p = 2`; general finite rank | `Tr(XE₂₁) = 1 = ‖X‖₂`; `Tr(XY) = Σ s_i^p/‖X‖_p^{p−1}`, `‖Y‖_{p'} = 1`; `Y_α = P_αY_αP_α` since `u_i, v_i ∈ range P_α` | sound |
| §1.3 (sampled) | `p₀ = p₁ = ∞`; `C₀ = 0`; `T = 2·id`, `p₀ = 2`, `p₁ = ∞`, `θ = 1/2`, `A = I₂` | `p_θ = ∞`, bound `C₀^{1−θ}C₁^θ ≥ min(C₀, C₁)`; `T = 0` on finite rank; `2·2^{1/4} = 2.3784` on both sides | sound |
| §1.4 duality and stabilisation | transpose on `M_n`; discontinuous `T` | `‖t‖_∞ = 1`, `‖t‖_{cb,∞} = n` (flip ↦ `n`·projection), `‖t‖_{cb,2} = 1`; duality uses only finite-rank `B` and Hölder, so it holds for every linear `T`; `Tr((T⊗id)(A)P_FBP_F) = Tr((T⊗id)(P_FAP_F)B)` | sound |
| §2.1, §2.2 kernel and trace | `E₁₂`; `iE₁₂`; `min(x, y)` | `E₁₂δ₂ = δ₁`; `⟨k_{A*}, k_C⟩ = i = Tr(AC)`; `Σ((j+½)π)^{−4} = 1/6 = ∫∫min²` | R01 |
| §2.3 (sampled) | `iE₁₂`; `[[1,1],[0,0]]`; `D_i` | `∫(A^Tf)g = ⟨A*Jf, g⟩ = ∫f(Ag)`; `(iE₁₂)^T = iE₂₁`, adjoint `−iE₂₁`; singular values `√2, 0` for both; `D_i^T = i`, `D_i* = −i`; `(A^T)* = JAJ = (A*)^T` | sound |
| §2.4 | `ν = 2μ` on a point; `k = u⊗u`, `u_j = 1/(j+1)` | `(UAU*f)(x) = √h(x)∫k√h f dμ`; `‖k‖₂ = π²/6`, `Σk = ∞`, `condExpL2 k = k` | sound |
| §2.5 (new) | counting `ℕ`; unit intervals of `ℝ`; trivial `𝒜` on Lebesgue `ℝ`; masses `(1, 3)` | `E[1] = 1` (native `0`); `1/2` on each interval; every constant satisfies the identity (σ-finiteness needed); `(a + 3b)/4`; module property `⟨g, φk⟩ = ∫conj(g)k·φ = ⟨g, E[φ]k⟩` | sound |
| §3.1 (sampled) | `[[1,2],[3,4]]`; `1_{x<y}` on the constant kernel; `1_{x=y}`; `μ = 0` | norm `4` at `E₂₂`; `‖S_M A‖₂² = 1/2`; `0`; `0 = 0` | sound |
| §3.2 headline | `M = 1_{(1,2)}` | `M̃ = 1_{(2,1)}`: `S_M(E₁₂)* = E₂₁ = S_{M̃}(E₂₁)`, `S_{M̃}(E₁₂) = 0` | sound |
| §3.4 | `[[1,1],[0,1]]` at `A = [[√2,1],[−1,√2]]/√3` | `B*B = [[2,√2],[√2,3]]/3`, trace `5/3`, determinant `4/9`, eigenvalues `4/3, 1/3`; norm `2/√3` | sound |
| §3.6 | one point, `M = 1` | `(1, 1)` and `(1, 0)`; `S_{M'} = S_M ⊗ id` on `A⊗B` with kernel `k_A(x,y)k_B(ω,ω')` | sound |
| §3.7 (sampled) | `ν = δ₀ ≪ δ₀ + δ₁`, `[[1,2],[2,1]]`; conjugate symbol | `S^μ_M(UAU*) = U S^ν_M(A)U*`, norms `1 ≤ 2`; `J S_M(JAJ)J` has kernel `conj(M·conj k_A) = M̄k_A` | sound |
| §4.1, §4.2 headline | `1_{(1,2)}`; triangular truncation, `p = 4` | `Tr(S_M(A)B) = A₁₂B₂₁ = Tr(A S_{M^t}B)`; `θ = 1/2`: `(2/√3)^{1/2} = 1.0746` | sound |
| §5.1 | `{1,2}`, trivial `𝒜` | averages `3/2 ≤ 2`, `3/4 ≤ 2/√3 = 1.1547`, `1/4 ≤ 1` | sound |
| §5.2 (sampled) | dyadic `[0,1]`, `1_{x<y}`; empty family | `f₀ = 1/2`; `f₁ = [[1/2, 1],[0, 1/2]]`, norm `≥ 1`; empty family `1` against `0` | R07 |
| §5.3 (sampled) | four points, two blocks, `[[1,2],[2,1]]`; trivial `𝒜` on `{1,2}`, `φ = c` | `2 = 2` (Kronecker with `J₂`); `|c| = |c|`; `L²(𝒜) = 0` forces `μ = 0` | sound |
| §6.1 (sampled, headline) | `[[2,1],[1,1]]`; `[[1,2],[2,1]]`; empty `ι` | `(D_vAD_v*)_{ij} = v_iA_{ij}conj v_j`; `Σ_k‖D_{v_k}*x‖² = Σ_j|x_j|²M_{jj} ≤ max_j M_{jj}‖x‖²`; norms `2` at `E₁₁`; eigenvalue `−1`, norm `2 ≠ 1`; `0` | sound |
| §6.2, §6.3 | `[[1,2],[2,1]]`; `α = (1,i)/√2` instance | `⟨ξ_j, η_k⟩ = 3/2 − v_jv_k/2`, `‖ξ‖² = 2`; `0 = 0` against `1` | sound |
| §6.4 (sampled, headline) | `cos(x − y)`; elementary symbols | `(V_ξ*(A⊗1)V_ηf)(x) = ∫k_A⟨ξ(x), η(y)⟩f`; `(e^{i(y−x)} + e^{i(x−y)})/2 = cos(x − y)`, norms `1`; `⟨a(u), b(v)⟩ = ∫∫conj(u)vM` | sound |
| §7.1 (sampled) | atom of a σ-finite measure; `μ ⊗ ν` with a candidate atom `C ⊆ S × S'`; cocountable measure | finite mass, so `ν(B) = ν(A) ⇒ ν(A∖B) = 0` and equivalence preserves atoms; slices of mass `≤ μ(S)ν(S')/n → 0` cannot carry `(μ⊗ν)(C) > 0`; singletons null, whole space an atom | sound |
| §7.2, §7.3 (sampled, headline) | two cells; refinement into `n` equal parts | average over `σ, σ'` equals the conditional expectation because the masses are equal; `L²(𝓑')` has masses `μ(A_i)/n`, `L²(𝒜)⊗ℓ²_n` masses `μ(A_i)`: a constant factor `n` (§3.7) | sound; R06 for one Check |
| §8.2 headline | `δ₀ + δ₁`; `M = x`; `1_{x=y}`; `μ = 0` | `2`; second condition only with `C = ∞`; `0` against `1`; `0 ≤ C` on both sides | sound |
| §9.1 (sampled) | `e_a`; translate; dilation; `cos` | `e_a(x − y) = e_a(x)conj e_a(y)`; kernel `m(x − t − y)k_A(x, y)`; conjugation by `D_s` gives `m((x − y)/s)`; `(1 + 1)/2 = 1` | sound; R03 |
| §9.2 | `e_a`; modulation; transpose | `T_{e_a}f = f(· + a)`; `T_m(e_sf) = e_sT_{m(·+s)}f`; `∫(T_mf)g = ∫m(ξ)𝓕f(ξ)𝓕g(−ξ) = ∫fT_{m(−·)}g` | sound |
| §9.3 (sampled) | `g = 1_{[−½,½]}`; `g = w|g|`; pairing | `ǧ(0) = 1`, `Tr Λ_F = |F| = |F|‖g‖₁`; `u = w|g|^{1/2}`, `v = |g|^{1/2}`, `‖u‖₂² = ‖g‖_{L¹(S₁)}`, bound `|F|‖g‖₁`; `∫ǧ(u)ȟ(−u)du = ∫𝓕(ǧ)h = ∫gh`; `𝓕⁻¹(g(· − a)) = e_aǧ` | sound; R08 for its use |
| §9.4 | `n = 1`, `p = ∞`, `T = R/10, 10R`; `p = 1`; interior `p` | `R(R² + T²)^{−1/2} = 0.9950, 0.0995`; `(1 + R²/T²)^{−n/2}`; `‖f^{p−1}‖_{p'} = ‖f‖_p^{p−1} = 1`, `∫fg = 1` | sound |
| §9.5 (sampled, headline) | `m = 0, 1, e_a, cos`; `m = 1_{(0,∞)}`, `p = ∞` | `𝓕(m𝓕⁻¹g) = T_{m(−·)}g = RT_mRg`; `0, 1, 1, 1` on both sides; `∞ = ∞` (Riesz projection, triangular truncation) | sound; R08 |
| §10.1 (sampled) | partition column, `N = 4`; `1_{[0,½)}e`; `e^{2πiz}e` | `Σ_ka_k(1 − 2a_k + Σa_j²) = 1 − Σa_k²`, maximum `3/4`, `0.866`; row matrix `diag(a) − aaᵀ` is real symmetric, so real unit vectors suffice and Popoviciu gives `≤ 1/2`, attained at `a = (½, ½)`, `0.707`; `1/2`; `1` | sound |
| §10.2 (sampled) | dilation; translation; `π'(A) = U_zA`; `n = 0` | `U_zD_t = D_tU_{z/t}`; `τ_aU_z = e^{−2πi⟨z,a⟩}U_zτ_a`; `‖A*A − A*N_QA‖ → ‖A‖²` since `A` is compact; `0` against `1` | sound |
| §10.3 | thresholds; `n = 2`, `k = 0` | `√n8^{−k} ≤ 2^{−k} ⇔ 4^k ≥ √n`; `2^{−k} − 2√n8^{−k} ≥ 2^{−k}/2 ⇔ 4^k ≥ 4√n`; `0.9√2 = 1.27 ≥ 1` with equal labels | sound |
| §10.4 | `T = id`; `T = 0`; positive constants | `C_np ≥ 1`; `0 ≤ 0` through `ε`; exponents `1 − 2/p` and `2/p` sum to `1` | sound |
| §11.1 | `sign(x − y)`; `ξ/√(1 + ξ²)`; `x` | `2`; `2·(1/√2)(3/2)^{−3/2} = 0.770`, total `2.770`; `∞` | sound |
| §11.2 | `N = 1`; support of `ψ_j` | `2^{j−1} ≤ |ξ| ≤ 2^{j+1}`; exponents `n − 2σ`, `n + 2`, `n + 2 − 2σ` | sound |
| §11.3, §11.4 | frequency bookkeeping; `sin y₁` | `M_c(x, x − y) = M(x, y)`, `M_r(y − x, y) = M(x, y)`; `∂_ξM_c = −(∂_yM)(x, x − ξ)`; row part `1`, column part `∞` | sound |
| §11.5 headline | `M = 1`; `p ↦ p'` | `1 ≤ C_n·4·2`, so `C_n ≥ 1/8`; `p'²/(p' − 1) = p²/(p − 1)`; `max(p, p') ≤ p²/(p − 1) ≤ 2max(p, p')` | sound |
| Layer 11 examples | `φ((x − y)/⟨x⟩)`; product test | `M(0, −s) = φ(s)` against `φ(s/⟨x⟩) → φ(0)`; `M(x,y)M(y,x) = φ(0)² ≠ 0` fails at `x = 0`, large `|y|` | sound |

### Sources

All fifteen sampled targets were checked at their locators in the cached texts; every locator agrees with the statement cited. No locator is flagged as unverified by the author.

| Target | Passages read | Result |
|---|---|---|
| 1.3 | lafforgue-delasalle-2011 lines 174–190, 246–252; cgpt-2023 lines 485–488 | compact endpoint and interpolation as cited; the exchanged exponents at line 249 are corrected in §4.2 |
| 2.3 | lafforgue-delasalle-2011 lines 226–232, 244; pisier-grothendieck-2012 line 2086 | bilinear identification; transposition has completely bounded norm `n` |
| 3.1 | lafforgue-delasalle-2011 lines 226–238; cgpt-2023 lines 220–229 | as cited |
| 3.7 | lafforgue-delasalle-2011 lines 339–349 (Lemma 1.9) | `ν ≪ μ`, both norms; target of the embedding misprinted at line 348, corrected in §2.4 |
| 5.2 | lafforgue-delasalle-2011 lines 383–413 (Lemma 1.11, Remark 1.12) | filtration and directed-set forms, norm and completely bounded norm |
| 5.3 | lafforgue-delasalle-2011 lines 415–443 (Lemma 1.13, Question 1.14) | completely bounded norms only; the reduction by an `𝒜`-measurable density is at 422–424 |
| 6.1 | pisier-grothendieck-2012 lines 767–772 | diagonal form only; the positive-symbol theorem rests on the uncertified texts and on `Matrix.PosSemidef.hadamard`, `Matrix.PosSemidef.kronecker` |
| 6.4 | lafforgue-delasalle-2011 lines 274–300, 330–337; cgpt-2023 lines 89–94 | separable Hilbert space, σ-finite space, `p ∈ {1, ∞}` |
| 7.1 | lafforgue-delasalle-2011 lines 487–488 | atom convention; positive mass added by the roadmap |
| 7.3 | lafforgue-delasalle-2011 lines 505–520; cgpt-2023 line 231 | as cited |
| 9.1 | cgpt-2023 lines 59–66; caspers-delasalle-2015 lines 26–34; lafforgue-delasalle-2011 lines 597–600 | `m(x − y)` and `φ(st⁻¹)`; the third text uses `φ(g⁻¹h)`, the transposed symbol |
| 9.3 | caspers-delasalle-2015 lines 529–548 | Theorem 5.1 for `1 ≤ p ≤ ∞`; Theorem 5.2 for `1 < p < ∞`, amenable `G` |
| 9.5 | cgpt-2023 lines 70–72; caspers-delasalle-2015 lines 485–490, 626–629; neuwirth-ricard-2011 lines 516–522 | the sources assume `φ ∈ M_{CB}A(G)`; the `L^∞` and endpoint forms are the roadmap's, by §9.3, §9.4 and §8.2 |
| 10.1 | cgpt-2023 lines 246–263; mei-2007 lines 96–110 | as cited |
| 10.2 | cgpt-2023 lines 264–289 | as cited |

Also read: lafforgue-delasalle-2011 lines 262–268, 281–285, 356–381, 489–501, 524–535, 553–560; cgpt-2023 lines 146–154, 313–392, 466–484; pisier-grothendieck-2012 lines 654–665, 779–801; caspers-delasalle-2015 lines 282–287, 449–454, 638–642. All 16 cited works have a manifest key; no entry was added or changed, and no text was requested.

### Suppliers and order

Dependency check output:

```
candidate: SchattenClassesAndSchurMultipliers is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 223 roadmaps, 1971 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Citations resolved this round:

| Supplier | Where | Resolved |
|---|---|---|
| OperatorTheory/OperatorIdeals (main) | `TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md` 144, 168–181, 196, 220–225, 349–375, 463–488, 540–563 | OI-A12, A23, A25–A30, A38–A40, B29, B32, B41, B76, B80, B88, C01, C13, C14 exist with the cited content |
| VonNeumannAlgebras (main) | `TauCetiRoadmap/VonNeumannAlgebras/README.md` 1006, 1299, V13b | V2.RectangularL2, V4.Core, V13b |
| NoncommutativeIntegration (main) | `TauCetiRoadmap/NoncommutativeIntegration/README.md` 286, 321, 360, 453, 498, 566, 594, 841, 878, 1243, 1423 | §1.3, §1.4, §1.5, §2.1, §2.3 (regularisation at 510), §2.5 (`p₁ = ∞` included), §2.6, §4.3 (Takesaki expectation), §4.4 (probability space, `p < ∞`), §7.3, §8.4 (`E_n|a − E_{n−1}a|²`, the convention of the gap) |
| CStarAlgebras (main) | `TauCetiRoadmap/CStarAlgebras/README.md` 435, 918 | C1.6, C3.2 |
| BanachSpaceTheory (main) | `TauCetiRoadmap/BanachSpaceTheory/README.md` 359, 380–396 | B4.0: Bochner density for a reflexive target, finite `μ`, finite variation `≪ μ`, with the variation formula; the open revision keeps the id |
| AutomorphicSpectralTheory (open, new roadmap) | its README at the open head, 240–249, 261, 275–277 | §0.8 on σ-finite standard Borel spaces, `kernel_apply`, `kernel_unique`, `kernel_norm`; §0.9; §0.10 `kernel_trace_diagonal` |

Gaps. `semifinite-martingale-bmo-interpolation`: precise (algebra, filtration, norms, the class of `Ψ`, the constant `Cp`), minimal (NoncommutativeIntegration §8.4 on main is finite-tracial), same slug in plan.json and in the README contract. `sigma-finite-hilbert-schmidt-kernels`: precise and declared in both files; not minimal, R01. After R01 an acceptance can be conditional on both.

Overlaps: the supplied overlap file lists no conflicting head, no dropped id and no id defined only by an open revision. Of the closest roadmaps, OperatorTheory/UnboundedOperators (`TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md` 922–932, 1140) owns maximal-domain operators of measurable kernels, not the Hilbert–Schmidt kernel identification; the others were compared in round 3 and their scopes are unchanged. `roadmaps grep` by object (analytic Schur multiplier, atomless and Sierpiński, operator-valued and matrix BMO, Haagerup factorisation, Fourier–Schur transference, Schur product, Hilbert–Schmidt kernel) finds no second owner: the hits for "Schur multiplier" are the group-cohomological one, NoncommutativeIntegration line 74 leaves Schur multipliers outside its scope, and its BMO (1426) is the finite-tracial martingale space. No roadmap cites this one.

### Pinned libraries

Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` (unchanged since round 3, whose table of 26 files stands). Opened or located again this round:

- `Mathlib/MeasureTheory/Function/ConditionalExpectation/Basic.lean`: `condExp_of_not_integrable` 171, `setIntegral_condExp` 231, `ae_eq_condExp_of_forall_setIntegral_eq` 253, `condExp_condExp_of_le` 342, `ContinuousLinearMap.comp_condExp_comm` 357.
- `Mathlib/MeasureTheory/Function/ConditionalExpectation/CondexpL2.lean`: `condExpL2` 68; `…/AEMeasurable.lean`: `lpMeas` 88.
- `Mathlib/MeasureTheory/Integral/Lebesgue/Countable.lean`: `exists_pos_lintegral_lt_of_sigmaFinite` 227; `Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean`: `lintegral_trim` 466; `Mathlib/MeasureTheory/Measure/WithDensity.lean`: `withDensity` 39.
- `Mathlib/Analysis/InnerProductSpace/Spectrum.lean`: `LinearMap.IsSymmetric.eigenvectorBasis` 297.
- `Mathlib/Probability/Martingale/Convergence.lean`: `Integrable.tendsto_ae_condExp` 361 (integrable `g`, strongly measurable for `⨆ n, ℱ n`).
- `Mathlib/Analysis/Matrix/Order.lean`: `PosSemidef.kronecker` 188, `PosSemidef.hadamard` 214; `Mathlib/LinearAlgebra/Matrix/Kronecker.lean`: `kroneckerMap` 55; `Mathlib/Analysis/CStarAlgebra/Matrix.lean`: `toEuclideanCLM` 101.
- `Mathlib/Analysis/LocallyConvex/Separation.lean`: `geometric_hahn_banach_point_closed` 223; `Mathlib/Analysis/Calculus/BumpFunction/Convolution.lean`: `ContDiffBump.ae_convolution_tendsto_right_of_locallyIntegrable` 103 (normalised bumps, bounded ratio of radii, locally integrable `g`); `Mathlib/MeasureTheory/Integral/Prod.lean`: `integral_prod` 443.
- `Mathlib/MeasureTheory/Measure/Typeclasses/NullSingletonClass.lean`: `NullSingletonClass` 31, deprecated alias `NoAtoms` 35; its module docstring says the atomless condition implies null singletons and not conversely, as the README reports.
- `TauCeti/MeasureTheory/Measure/Atom.lean`: `MeasureTheory.Measure.IsAtom` 59 (measurable, positive mass, subsets null or of full mass; no finiteness), point-mass description 105–124; `TauCeti/MeasureTheory/Measure/AtomlessStandardBorel/Transport.lean`: `exists_subset_measure_eq_of_nullSingleton` 115 (`StandardBorelSpace`, `μ s ≠ ∞`).
- `TauCeti/Analysis/OperatorIdeal/Family/Schatten.lean` 48, 64, 81, 93, 101, 109; `…/TraceClass.lean` 59, 90; `…/HilbertSchmidt.lean` 65, 112; `TauCeti/Analysis/Fourier/L2Multiplier.lean` 88, 126, 159, 177, 299; `TauCeti/Analysis/Fourier/MihlinHormander.lean` 300; `TauCeti/Analysis/Distribution/SchwartzSpace/LittlewoodPaley.lean` 87, 196.

Duplication by object at the pins: Tau Ceti's `TauCeti/Analysis/OperatorIdeal/Family/DixmierTrace.lean` and `TauCeti/Analysis/InnerProductSpace/Trace/` hold the Dixmier trace and finite-dimensional traces, not an operator trace on the trace class; no file of either library has a conditional expectation of bounded functions for a measure σ-finite on the sub-σ-algebra, a Sierpiński theorem for `IsAtom`-atomless measures off standard Borel spaces, an analytic Schur multiplier, or an operator-valued BMO. The README's "has no" statements hold.

### Headlines

The six headline groups of the Summary are the multiplier algebra with duality and interpolation (§3.2, §4.1, §4.2), the Schur product theorem (§6.1), Grothendieck–Haagerup (§6.3, §6.4), the atomless and continuous-symbol theorems (§7.3, §8.2), Fourier–Schur transference (§9.5) and the Hörmander–Mikhlin–Schur theorem (§11.5). Each is a target with hypotheses and a locator and each has a row above. There is no `Suggested.lean` to probe for padding or absent headlines at this stage.

## Not verifiable

- The nine works recorded as uncertified (reed-simon-1-1980, simon-trace-ideals-2005, gohberg-krein-1969, paulsen-2002, pisier-similarity-2001, horn-johnson-topics-1991, grafakos-classical-2014, musat-2003, jrwz-2020): their texts are not available legally to this run; they are cited by locator only.
- The proof steps of cgpt-2023 behind §10.3 (Lemma 1.3, lines 380–454) and §11.3–§11.4 (lines 628–1041): the statements, hypotheses and sign conventions were checked against the text, and the scale exponents recomputed; the full estimates were not re-derived this round.
- The constant `O(p)` of the martingale interpolation gap rests on jrwz-2020 (uncertified) through cgpt-2023 lines 481–484.
- Agreement of the preprint numbering with the published versions was not compared; the manifest names the versions read.
- Elaboration, the one-tactic probe and the `#check` audit: not available (this lane does not elaborate, and the design has no Lean file).

## Source issues

- **Misprint** in lafforgue-delasalle-2011 at Remark 1.4, printed p. 6 (line 249): the source says `S_q` is the interpolation space between `S_p` and `S_{p'}` for `2 ≤ p ≤ q`; it should be `S_p` between `S_q` and `S_{q'}`, with `1/p = θ/q' + (1 − θ)/q`; affects nothing.
- **Error** in lafforgue-delasalle-2011 at Remark 1.6, printed p. 7 (lines 262–266): the source says the completely bounded norm is unchanged for every auxiliary σ-finite space; it should require a nonzero auxiliary measure, the zero measure giving norm zero; affects a stated result.
- **Misprint** in lafforgue-delasalle-2011 at the proof of Lemma 1.9, printed p. 8 (line 348): the source says the conjugation embeds into the Schatten class of the `ν`-space; it should be the Schatten class of the `μ`-space; affects nothing.
- **Gap** in lafforgue-delasalle-2011 at §1.4, printed p. 12 (lines 487–488): the source says an atom is a measurable set that cannot be split into two sets of positive measure; it should also require positive measure, or every null set is an atom; affects a stated result.
- **Error** in lafforgue-delasalle-2011 at Theorem 1.19, printed p. 13 (lines 524–531): the source says norm strictly below `C` globally is equivalent to norm strictly below `C` on every finite subset of the support; it should use non-strict bounds (on `ℕ`, `M(i, j) = 1 − 1/(i + 1)`, `C = 1`); affects a stated result.
- **Error** in caspers-delasalle-2015 at Theorem 3.1, printed p. 6 (lines 282–287): the source says the strict bound `K` globally is equivalent to the strict bound `K` on every restriction; it should use non-strict bounds, by the same example; affects a stated result.
- **Gap** in cgpt-2023 at §1.2 before Lemma 1.3, printed p. 8 (lines 375–378): the source says the periodised operator has mean zero for every `k`; it should require `4^k ≥ √n`, since two points of one grid cube can be at distance `≥ 2^{−k}` when `n ≥ 2`; affects the proof.
- **Error** in lafforgue-delasalle-2011 at the opening of §2, printed p. 15 (lines 590–593): the source says a Haar measure is σ-finite exactly when the group is second countable; it should say second countability suffices (an uncountable product of two-element groups is compact, with finite Haar measure); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "29ae8c8293c41d0f9064f98e5fbde156112ee785", "job": "REV-DESIGN-SchattenClassesAndSchurMultipliers~4", "model": "fable", "worker": "chris-l"} -->
