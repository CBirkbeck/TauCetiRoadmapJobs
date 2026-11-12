<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13838#issuecomment-6799307110 -->
Review (claude) of 031642d

Verdict: needs_changes

1. **F01** (P3) §8.2 uses a continuous symbol as a class of `L^∞(μ ⊗ μ)` without the measurability step

   **Location:** `packages/SchattenClassesAndSchurMultipliers/design/README.md` 1394–1399 ("Let `M : X × X → ℂ` be continuous … `M` is `μ ⊗ μ`-essentially bounded and `‖S_M‖_p ≤ C`") and the route, 1405–1424; `design/plan.json` target 8.2.

   **Claim:** A continuous `M` on `X × X` defines a class for `μ.prod μ` (product σ-algebra, Conventions line 121–123).

   **Witness:** `X` discrete with more than continuum many points, `μ = δ_{x₀}`, `M` the indicator of the diagonal: continuous, and not measurable for the product σ-algebra. At the pin `Prod.opensMeasurableSpace` needs `SecondCountableTopologyEither` (`Mathlib/MeasureTheory/Constructions/BorelSpace/Basic.lean:406`).

   **Exact repair:** The statement is true; the route lacks its first step. Add to §8.2, after the reduction to a finite Radon measure: "`M` is almost everywhere strongly measurable for `μ.prod μ`: choose compact sets `K_j` increasing with `μ(X ∖ ⋃_j K_j) = 0` (`MeasurableSet.exists_isCompact_lt_add`); on `K_j × K_j` the real and imaginary parts of `M` are uniform limits of finite sums `Σ f_i(x) g_i(y)` of continuous functions (Stone–Weierstrass, `ContinuousMap.subalgebra_topologicalClosure_eq_top_of_separatesPoints`), so `M · 1_{K_j × K_j}` is measurable for the product σ-algebra, and the complement of `⋃_j K_j × K_j` is `μ ⊗ μ`-null." Add the Stone–Weierstrass declaration to `### From Mathlib` and to the Needs line and plan prerequisites of 8.2. On the witness: `K = {x₀}`, `M · 1_{K × K} = 1_{(x₀, x₀)}` is measurable and equals `M` off a null set; the class is the constant `1` and `‖S_M‖_p = 1`, the norm of the `1 × 1` restriction to `supp μ = {x₀}`.

2. **F02** (P3) The route of §7.3 passes to a probability measure, which the zero measure does not have

   **Location:** README 1339: "Route: pass to an equivalent probability measure (§3.7, §7.1)".

   **Claim:** Every atomless σ-finite measure is equivalent to a probability measure.

   **Witness:** `μ = 0` is σ-finite and atomless (README 1312, and Conventions line 124 allow it); the only measure equivalent to it is `0`, of mass `0 ≠ 1`.

   **Exact repair:** "pass to an equivalent finite measure (§3.7, §7.1)". The rest of the route uses only finiteness: §7.2 is stated for a finite measure and §7.1 splits sets of finite measure. On the witness: the equivalent finite measure is `0`, every `L²` space is `0`, and the theorem reads `0 = 0`. §8.2 (line 1405) and §6.4 (line 1253) already say "finite".

3. **F03** (P3) "Gaussian measures" as an example of atomless spaces includes a point mass at the pin

   **Location:** README 1365: "Lebesgue measure on `ℝⁿ` and on `[0, 1]`; Gaussian measures; any atomless σ-finite space."

   **Claim:** Gaussian measures are atomless.

   **Witness:** `ProbabilityTheory.gaussianReal_zero_var` (`Mathlib/Probability/Distributions/Gaussian/Real.lean:227`): `gaussianReal μ 0 = Measure.dirac μ`, whose singleton `{μ}` is an atom; `L²` is `ℂ` and §7.3 does not apply.

   **Exact repair:** "Gaussian measures with nondegenerate covariance (on `ℝ`, positive variance)". Test: `gaussianReal 0 1` has a density, so singletons are null, and on the standard Borel space `ℝ` it is atomless by the third bullet of §7.1.

4. **F04** (P3) The contract for V13b lists an interface that V13b does not state

   **Location:** README 335–336: "V13b: the Hilbert-space ultraproduct `∏_𝒰 H_n` of a sequence of Hilbert spaces along an ultrafilter, with its quotient inner product, completeness and coordinatewise norms (§6.4)"; the Needs line of §6.4 (1270).

   **Claim:** VonNeumannAlgebras V13b states the ultraproduct with these three properties.

   **Witness:** `TauCetiRoadmap/VonNeumannAlgebras/README.md` 5182–5184 and 5210, in §13.2 (V13b): the ultraproduct is built inside the route of one theorem ("of a sequence of counterexamples"; "the Hilbert-space version is built here"), with no API bullet.

   **Exact repair:** The object is planned there, so the citation stands; make it exact and own what is assumed. Contract: "V13b (§13.2): the Hilbert-space ultraproduct of a sequence of Hilbert spaces along an ultrafilter, built there in the route of the uniqueness of the injective factor of type III₁." In the route of §6.4 state the facts used as steps proved from that construction: `⟨[x_n], [y_n]⟩ = lim_𝒰 ⟨x_n, y_n⟩` for bounded sequences, hence `‖[x_n]‖ = lim_𝒰 ‖x_n‖`, and completeness. Test on `H_n = ℂ`: `⟨[1], [i]⟩ = i`, `‖[1 + 1/n]‖ = 1`, and the ultraproduct is `ℂ`.

Four findings, all P3; no P1 or P2. The eight findings of round 4 are all repaired. Each of the four findings carries a repair, so the verdict asks for changes: a fix round applies them. The two declared supplier gaps, `sigma-finite-hilbert-schmidt-kernels` and `semifinite-martingale-bmo-interpolation`, are precise contracts and are not findings.

Reviewed: `packages/SchattenClassesAndSchurMultipliers/design/README.md` (2,047 lines, read in full), `design/plan.json` (11 layers, 45 targets, 2 gaps) and `sources.toml` (16 entries). There is no `Suggested.lean` at the design stage. Elaboration: **not available (this lane does not elaborate)**; no Lean process was started. No maintainer notes were left for this roadmap.

## Previous findings, checked first

The round 4 review numbers its findings F01–F08; the repair report marks all eight applied and none as not actionable.

| Round 4 finding | Status | Repaired passage and what was recomputed |
|---|---|---|
| F01 (P2), gap asked for the trace formula | Repaired | README 394–395: "The trace formula is not part of the request: §2.2 derives it from §0.8, §0.9 and the adjoint kernel"; 678–682 gives the route; plan gap `section` is `§0.8`. Recomputed: `A : L²(ν) → L²(μ)`, `C : L²(μ) → L²(ν)`, so `A*, C ∈ S₂(L²(μ), L²(ν))` with kernels in `L²(ν ⊗ μ)`, `⟨k_{A*}, k_C⟩ = Tr((A*)*C) = Tr(AC)`; `A = iE₁₂`, `C = E₂₁`: `conj(−i)·1 = i = Tr(AC)`. |
| F02 (P3), layer-level dependencies | Repaired | README 430–434: "Layer 5 needs Layers 2 and 3 … Layer 7 needs Layers 3 and 5. Layer 8 needs Layers 1, 3 and 5. Layer 9 needs Layers 1, 3, 4 and 8". My script over the 45 plan targets gives the unions 2:{1}, 3:{1,2}, 4:{1,2,3}, 5:{2,3}, 6:{1,3,4,5}, 7:{3,5}, 8:{1,3,5}, 9:{1,3,4,8}, 10:{1,3}, 11:{2,3,4,7,10}, equal to the paragraph and to the eleven Dependencies lines. |
| F03 (P3), §9.1 behind §6.4 | Repaired | README 1477–1483: "`M_m = (M_{e_a} + M_{e_{−a}})/2` … `(1 + 1)/2 = 1`"; Needs line 1487 has no §6.4. Recomputed: kernel `cos(2π⟨a, x − y⟩)u(x)u(y) = c(x)u(x)c(y)u(y) + s(x)u(x)s(y)u(y)`, a sum of two positive rank-one operators, norm `≥ ‖cu‖² → 1`. |
| F04 (P3), plan 5.2 and 5.3 | Repaired | plan targets 5.2 and 5.3 list `target:3.6`; script: no target whose README Needs line and plan prerequisites differ. |
| F05 (P3), eight Mathlib names missing from the contract | Repaired | README 235–259 has the eight bullets and `lp`. Each opened at the pin (list below). |
| F06 (P3), §7.3 Check overstated its source | Repaired | README 1353–1357: "the source records that no Schur multiplier on `S_p^n` with different norm and completely bounded norm is known, and conjectures that one exists on `S_p(ℓ²)`". lafforgue-delasalle-2011 lines 281–285 read: this is what they say. |
| F07 (P3), empty family in §5.2 | Repaired | README 1103: "Let `(𝓑_α)` be a nonempty directed family"; the negative control is at 1117–1120 (`1` against `0`). |
| F08 (P3), §9.3 class of `g` | Repaired | README 1535: "for `1 ≤ p ≤ ∞` and `g ∈ L² ∩ Lᵖ(ℝⁿ; S_p^k)`", with the truncation step 1540–1545. Recomputed: `∫∫_{F×F} ‖ȟ(s − t)‖² = ∫ ‖ȟ(u)‖² |F ∩ (F + u)| du ≤ |F|‖h‖₂²`. |

Repaired patterns searched in the rest of the design: suprema over possibly empty families (none left: levels `m, k ≥ 1`, cubes); gap requests for what the roadmap derives (none: §2.1–§2.4 consume only `kernel_apply`, `kernel_unique`, `kernel_norm`); statements used outside the class they are stated for (§9.5 now inside §9.3's class); passages changed by the repair were recomputed (rows marked "changed" below). The pattern of the earlier rounds, a step that fails on the zero measure, gave R02.

## Verified sound

### Principles and shape

- No route-specific shortcut, no re-planned roadmap, no algorithm, no copied passage, no `set_option`, no sorry'd data (no Lean file). Arbitrary σ-finite spaces are kept throughout.
- Organisation: eleven layers named by their mathematics; no sentence says the roadmap follows a source. The order 1, 2 → 3 → 4, 5 → 6, 7, 8 → 9 and 10 → 11 is forced by the Needs lines except the relative order of Layers 6, 7 and 8; the principal source states its factorisation theorem before its conditional-expectation lemmas and the roadmap after them.
- Shape: 45 targets, 45 Needs lines, 11 `### Examples`, 11 `### Dependencies`; the 17 definition and construction targets (1.1, 1.4, 2.1, 2.3, 2.5, 3.1, 3.5, 6.2, 7.1, 9.1, 9.2, 9.3, 10.1, 10.2, 10.3, 11.1, 11.3) each have API bullets and at least three Checks; every plan target has a statement, hypotheses and a locator (script). No LaTeX delimiters, pull-request numbers, job ids, round labels or machine paths in the README (grep). Eleven lines exceed 102 characters (for instance line 574); no rule of the rubric is broken by them.
- Plan against README: 0 forward prerequisites; 0 differences between Needs lines and plan prerequisites; gaps `2.1, 2.2, 2.4 → sigma-finite-hilbert-schmidt-kernels` and `10.4 → semifinite-martingale-bmo-interpolation`, same slugs in the README contracts (lines 361–379 and 392–398).

### Adversarial table

Sampled targets, headline theorems and every target a finding touches; each row was recomputed this round.

| Statement | Instances | Values computed on each side | Result / change |
|---|---|---|---|
| §1.1 extended gauge (sampled) | identity of `ℓ²`; `P_α`; `diag(1/(j+1))` | `‖1‖_p = ∞` for every `p ≤ ∞`; `‖P_α‖_p = α^{1/p}`, `‖P_α‖_∞ = 1`; `π²/6` at `p = 2`, `∞` at `p = 1` | sound |
| §1.3 (sampled) | triangular truncation on `M₂`, `p₀ = 1`, `p₁ = ∞`, `θ = 1/2`; `p₀ = p₁ = ∞` | `C₀ = C₁ = 2/√3`, bound `1.1547` at `p = 2`, true norm `1`; `p_θ = ∞`, bound `≥ min(C₀, C₁)` | sound |
| §1.4 duality | arbitrary linear `T`, `T^♯` | `‖T‖_p = sup_{B finite rank} ‖T^♯B‖_{p'} ≤ ‖T^♯‖_{p'}` and symmetrically by cyclicity; transpose on `M_n`: `1`, `n`, `1` | sound |
| §2.1 polarised isometry (changed) | `A = E₁₂`, `B = iE₁₂` | `⟨1_{(1,2)}, i·1_{(1,2)}⟩ = i = Tr(E₂₁·iE₁₂) = Σ_j⟨Ae_j, Be_j⟩` | sound |
| §2.2 trace formula (changed) | `iE₁₂, E₂₁`; two spaces `{1}`, `{2}` | `i = i`, unconjugated adjoint kernel `−i`; `1 = 1` | sound |
| §2.3 | `A^T = JA*J` | `⟨JA^Tf, g⟩ = ⟨Jf, Ag⟩ = ∫f(Ag)`; `(A^T)* = JAJ = (A*)^T`; `Tr(JA*J) = conj Tr(A*) = Tr A` | sound |
| §2.4 change of measure | `h = dν/dμ` | `∫|√h g|²dμ = ∫|g|²dν`; `(UAU*f)(x) = √h(x)∫k_A(x, y)√h(y)f(y)dμ(y)` | sound |
| §2.5 (sampled) | counting `ℕ`; unit intervals of `ℝ`; masses `(1, 3)` with `w = (c, c)` | `E[1] = 1` against native `0`; `1/2`; `(ca + 3cb)/(4c) = (a + 3b)/4`; uniqueness from `∫_A|ψ|² = 0` on finite-measure `A ∈ 𝒜` | sound |
| §3.1 (sampled) | `[[1,2],[3,4]]`; `1_{x<y}` on kernel `1` | norm `4` at `E₂₂`; `∫∫1_{x<y} = 1/2` | sound |
| §3.2 headline | `M = 1_{(1,2)}` | `S_M(E₁₂)* = E₂₁ = S_{M̃}(E₂₁)`; `S_{M̃}(E₁₂) = 0` | sound |
| §3.4 (sampled) | `[[1,1],[0,1]]` at `[[√2,1],[−1,√2]]/√3` | columns orthonormal (`√2 − √2 = 0`); `B*B = [[2,√2],[√2,3]]/3`, trace `5/3`, determinant `4/9`, eigenvalues `4/3`, `1/3`; norm `2/√3` | sound |
| §3.5 | `[[1,2],[2,1]]` | `(3/2)J − (1/2)vvᵀ`: diagonal `3/2 − 1/2 = 1`, off-diagonal `3/2 + 1/2 = 2`; bound `2`, attained at `E₁₂` | sound |
| §3.6 (sampled) | one point, `M = 1`; `dim L²(ν) = d` | `(1, 1)` for a point mass, `(1, 0)` for `ν = 0`; `sup_m ‖(S_M)^{(dm)}‖ = ‖S_M‖_{cb}` | sound |
| §4.1, §4.2 (sampled, headline) | `1_{(1,2)}`; truncation at `p = 4` | `Tr(S_M(A)B) = A₁₂B₂₁ = Tr(A S_{M^t}B)`; `(2/√3)^{1/2} = 1.0746` between `1` and `1.1547` | sound |
| §5.1 | `{1,2}`, trivial `𝒜` | `6/4 = 3/2 ≤ 2`; `3/4 ≤ 1.1547`; `1/4 ≤ 1` | sound |
| §5.2 (changed) | empty family; dyadic `1_{x<y}` | `1` against `0`, excluded; `f₀ = 1/2`, `f₁ = [[1/2, 1],[0, 1/2]]` | sound |
| §6.1 headline | `[[2,1],[1,1]]`; `[[1,2],[2,1]]`; empty `ι` | `2` at `E₁₁`; eigenvalue `−1`, norm `2 ≠ 1`; `0` | sound |
| §6.2 (sampled) | `[[1,2],[2,1]]` | `⟨ξ_j, η_k⟩ = 3/2 − v_jv_k/2 ∈ {1, 2}`, `‖ξ_j‖² = 3/2 + 1/2 = 2`; lower bound `|M(1,2)| = 2` | sound |
| §6.3 (sampled) | `α = (1, i)/√2`, `β = (1,1)/√2`, `a = I`, `M = diag(1, i)` | `ψ = diag(1/2, i/2)`, `Σψ_{ij}M_{ij} = 1/2 + i·i/2 = 0 = ⟨ᾱ, S_M(a)β⟩`; unconjugated `1` | sound |
| §6.4 (sampled, headline) | `cos(x − y)`; `a, b` in the ultraproduct; `H_n = ℂ` | `(e^{−ix}e^{iy} + e^{ix}e^{−iy})/2 = cos(x − y)`; `⟨∫uξ_n, ∫vη_n⟩ = ∫∫conj(u)v M_n`; `⟨[1], [i]⟩ = i` | sound; R04 for the supplier citation |
| §7.3 headline | Lebesgue `[0,1]`; `μ = 0` | refinement into `n` equal parts gives the level-`n` amplification; `0 = 0`, but no equivalent probability measure | R02 |
| Layer 7 examples | `gaussianReal μ 0` | `= δ_μ`, atom `{μ}` | R03 |
| §8.2 (sampled, headline) | `δ₀ + δ₁`; `M = x`; `1_{x=y}` on `[0,1]`; discrete `X`, `δ_{x₀}`, diagonal | `2`; second condition only with `C = ∞`; `0` against `1`; continuous, not product-measurable, class `1`, norm `1` | sound; R01 |
| §9.1 (changed) | `V_t`; `cos` | kernel of `V_t⁻¹S_{M_m}(V_tA)` is `m(x − t − y)k_A(x, y)`; `‖S(u⊗u*)‖ ≥ ‖cu‖² → 1` | sound |
| §9.3 (changed) | `p = 1`; pairing | `‖Λ_F(uv)‖₁ ≤ |F|^{1/2}‖u‖₂·|F|^{1/2}‖v‖₂ = |F|‖g‖₁`; `∫ǧ(u)ȟ(−u)du = ∫g h` | sound |
| §9.4 | `n = 1`, `p = ∞`; `p = 1` | `R(R² + T²)^{−1/2} = 0.995` at `T = R/10`, `0.0995` at `T = 10R`; `(1 + R²/T²)^{−n/2}` | sound |
| §9.5 headline | `g ∈ L² ∩ Lᵖ`; `m = e_a` | `𝓕 m 𝓕⁻¹ = R T_m R`; `‖RT_mRg‖_p ≤ liminf|Q_R|^{−1/p}‖S_{M_m}Λ(g)‖_p ≤ ‖S_{M_m}‖_p‖g‖_p`; `1 = 1` | sound |
| §10.1 (sampled) | partition column, `N ≥ 3` | `⨍f*f − f_Q*f_Q = (1 − Σa_k²)E₁₁`, maximum `1 − 1/N`; rows `diag(a) − aaᵀ`, at `a = (1/2, 1/2)` eigenvalues `1/2, 0`; `N = 4`: `0.866`, `0.707` | sound |
| §10.2 | rank-one projection `u ⊗ u*` | `⨍_Q|π − π_Q|² = N_Q − N_Q²` with `0 ≤ N_Q ≤ 1`, top eigenvalue running from `1` to `0`, so the seminorm is `≥ 1/2`: consistent with definiteness | sound |
| §10.3 (sampled) | thresholds; `n = 2`, `k = 0` | `√n 8^{−k} ≤ 2^{−k} ⇔ 4^k ≥ √n`; `2^{−k} − 2√n 8^{−k} ≥ 2^{−k}/2 ⇔ 4^k ≥ 4√n`; `0.9√2 = 1.27 ≥ 1` with equal labels | sound |
| §10.4 | operator form; `Ψ = e^{λz}A` | `‖Ψ(it)‖_{BMO} ≤ 1`, `‖Ψ(1 + it)‖₂ = ‖A‖_p^{p/2} = 1`, `Ψ(2/p) = C_∞^{2/p−1}C₂^{−2/p}TA`; optimising `λ` gives `‖A‖_p ≤ C_n p‖A‖_{BMO}^{1−2/p}‖A‖₂^{2/p}` | sound |
| §11.1 | `ξ/√(1 + ξ²)`; `sin x₁` | maximum of `|ξ|(1 + ξ²)^{−3/2}` at `ξ² = 1/2`: `0.3849`, twice `0.770`, total `2.770`; `∞` with norm `1` | sound |
| §11.2 (sampled) | support of `ψ_j`; `N = 1` | `2^{j−1} ≤ |ξ| ≤ 2^{j+1}`; exponents `n − 2σ_n`, `n + 2`, `n + 2 − 2σ_n` by scaling | sound |
| §11.3 (sampled) | Toeplitz; entry `(x, y)` | `M_c(x, ξ) = m(ξ)`; frequency `x − y`: `M_c(x, x − y) = M(x, y)`; rows, frequency `y − x`: `M_r(y − x, y) = M(x, y)` | sound |
| §11.5 headline | `M = 1`; `p ↦ p'` | `1 ≤ C_n·4·2`; `max(p, p') ≤ p²/(p − 1) ≤ 2max(p, p')` (second: `p ≥ 2 ⇔ p²/(p−1) ≤ 2p`) | sound |
| Layer 11 examples | `sin t₁` in dimension two, `R = 10` | `D = 11.05`, `R/D = 0.905`, `(0.786 + 6.177)/122.1·100 = 5.70` | sound |

### Sources

All fifteen sampled targets were checked at their locators in the cached texts; every locator agrees with the statement cited. The author flags no locator as unverified.

| Target | Passages read | Result |
|---|---|---|
| 1.1 | lafforgue-delasalle-2011 lines 174–179; cgpt-2023 lines 209–214 | compact endpoint with the operator norm, in both |
| 1.3 | lafforgue-delasalle-2011 lines 246–252; cgpt-2023 line 486 | as cited; exponents exchanged at line 249 |
| 2.5 | lafforgue-delasalle-2011 lines 356–359, 422–424 | setting (6) and the reduction by an `𝒜`-measurable density |
| 3.1 | lafforgue-delasalle-2011 lines 226–238; cgpt-2023 lines 220–229 | as cited |
| 3.4 | lafforgue-delasalle-2011 lines 213–218; pisier-grothendieck-2012 lines 767–772 | as cited |
| 3.6 | lafforgue-delasalle-2011 lines 254–259, 262–266 | Lemma 1.5, Remark 1.6 (every σ-finite `(Ω, ν)`) |
| 4.2 | lafforgue-delasalle-2011 lines 246–252 | as cited |
| 6.2 | lafforgue-delasalle-2011 lines 274–278; cgpt-2023 lines 89–93; pisier-grothendieck-2012 lines 656–665 | separable Hilbert space, `L^∞` norms; (3.9), (3.10) |
| 6.3 | pisier-grothendieck-2012 lines 781–802, 2086–2088, 3439, 3541–3545 | Proposition 3.3 and its proof, Remark 13.4, Lemma 23.1, Remark 23.4 |
| 6.4 | lafforgue-delasalle-2011 lines 274–300; cgpt-2023 lines 89–94 | Theorem 1.7 and the reduction (5) to maps `L¹(μ) → H` |
| 8.2 | lafforgue-delasalle-2011 lines 524–560; cgpt-2023 lines 232–237; caspers-delasalle-2015 lines 282–288 | Theorem 1.19 with strict bounds and `C > 0`; the roadmap's non-strict form is the correct one |
| 10.1 | cgpt-2023 lines 246–263, 683; mei-2007 lines 96–110 | as cited |
| 10.3 | cgpt-2023 lines 348–379 | `m_k`, `p_k`, `π_k`, `J_k`, Lemma 1.3 (no threshold on `k` in the source) |
| 11.2 | cgpt-2023 lines 768–796, 866–872, 967–972, 995–999 | (2.12), (2.13) and the three estimates |
| 11.3 | cgpt-2023 lines 572–584, 592–608, 668–686, 704–718 | (2.2), (2.5), (2.8), (2.9) |

Also read: cgpt-2023 lines 149–154 (Theorem A), 466–484 (Lemma 1.4), 565–571, 906–912; caspers-delasalle-2015 lines 449, 485, 529, 543, 626; neuwirth-ricard-2011 line 516; mei-2007 line 3218. All 16 cited works have a manifest key, and each README citation falls under its key's `cited_for`; no entry was added or changed, and no text was requested.

### Suppliers and order

Dependency check output:

```
candidate: SchattenClassesAndSchurMultipliers is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 207 roadmaps, 1918 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Citations resolved this round:

| Supplier | Where | Resolved |
|---|---|---|
| OperatorTheory/OperatorIdeals (main) | `TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md` 144–225, 349–375, 463–488, 540–563 | OI-A12, A23, A25, A27–A30, A38, A40, B29, B32, B35, B41, B76, B80 (the `p = ∞` family has gauge `‖T‖`), B88, C01, C13, C14 |
| VonNeumannAlgebras (main) | `TauCetiRoadmap/VonNeumannAlgebras/README.md` 1006, 1299–1312, 5183–5210 | V2.RectangularL2 (arbitrary measures); V4.Core (`S₂(H, K)`, cyclicity of Hilbert–Schmidt pairings, `B(H) = S₁*`); the Hilbert-space ultraproduct of V13b, built inside a route of §13.2 (R04) |
| NoncommutativeIntegration (main) | `TauCetiRoadmap/NoncommutativeIntegration/README.md` 286, 321, 360, 453, 498, 566, 594, 841, 878–885, 1243, 1423 | §1.3–§1.5, §2.1, §2.3, §2.5, §2.6, §4.3, §4.4 (probability space, `1 ≤ p < ∞`, norm `∫‖f(ω)‖_p^p`), §7.3, §8.4 |
| CStarAlgebras (main) | `TauCetiRoadmap/CStarAlgebras/README.md` 435, 918 | C1.6, C3.2 |
| BanachSpaceTheory (main) | `TauCetiRoadmap/BanachSpaceTheory/README.md` 359, 381–385 | B4.0: reflexive real `Y`, finite `μ`, `m.variation ≪ μ`, Bochner density with the variation formula; a complex Hilbert space is a reflexive real space |
| AutomorphicSpectralTheory (open, new roadmap) | its README at the open head, 240–257, 261–271, 275–283 | §0.8 on σ-finite standard Borel spaces with `kernel_apply`, `kernel_unique`, `kernel_norm`; §0.9 `tr(BC) = Σ_j⟪B⁎e_j, Ce_j⟫`; §0.10 needs only §0.8 and §0.9 |

Gaps. `sigma-finite-hilbert-schmidt-kernels`: precise (the three statements, on arbitrary σ-finite spaces), declared in both files, supplier named. Minimality: V2.RectangularL2 and V4.Core give the unitary `L²(μ ⊗ ν) ≅ S₂` on main, but the operator with its integral formula is the object AutomorphicSpectralTheory §0.8 owns, so asking its owner for the generality keeps one owner. `semifinite-martingale-bmo-interpolation`: precise (algebra, filtration, norms, the class of `Ψ`, the constant `Cp`), minimal (NoncommutativeIntegration §8.4 on main is finite-tracial), declared in both files. Neither is a finding.

Overlaps: the overlap file lists no conflicting head, no dropped id and no id that only an open revision defines; no roadmap cites this one. Ownership by object (`roadmaps grep` on main and at the open heads): analytic Schur multiplier, operator-valued and matrix BMO, Fourier–Schur transference, completely bounded maps on Schatten classes and double operator integrals have no other owner (the "Schur multiplier" hits are the group-cohomological one; NoncommutativeIntegration line 74 leaves Schur multipliers out); "Hilbert–Schmidt kernel" is AutomorphicSpectralTheory §0.8, cited; the Haagerup tensor product of CStarAlgebras (line 1179) is a different object from the factorisation constant of §6.2; the atomless hits on main are standard Borel statements, and `TauCetiRoadmap/CompactOperators/README.md` line 79 constructs no Schatten theory. The closest open roadmaps of the overlap file (BanachSpaceTheory, YangMillsConnectionsAndCaloricGauge, QuantumFoundations, QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups, ProbabilisticAndMetricNumberTheory) own none of these objects.

### Pinned libraries

Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Every backticked library name of the contract was located at the pin (67 names, by script, with the doubtful ones opened):

- `Mathlib/MeasureTheory/Function/ConditionalExpectation/Basic.lean`: `condExp` 101 (explicit `m`; zero unless `SigmaFinite (μ.trim hm) ∧ Integrable f μ`), `condExp_of_not_integrable` 171, `setIntegral_condExp` 231, `ae_eq_condExp_of_forall_setIntegral_eq` 253, `condExp_condExp_of_le` 342, `ContinuousLinearMap.comp_condExp_comm` 357; `…/CondexpL2.lean`: `condExpL2` 68.
- `Mathlib/MeasureTheory/Measure/Regular.lean`: `MeasurableSet.exists_isCompact_lt_add` 821, `IsCompact.exists_isOpen_lt_add` 930 (`InnerRegularCompactLTTop`, `IsLocallyFiniteMeasure`, `R1Space`, `BorelSpace`, as the contract says); `Mathlib/Topology/UrysohnsLemma.lean`: `exists_continuousMap_one_of_isCompact_subset_isOpen` 529; `Mathlib/MeasureTheory/Function/ContinuousMapDense.lean` 142.
- `Mathlib/Analysis/Complex/Hadamard.lean`: `norm_le_interpStrip_of_mem_verticalClosedStrip` 592; `Mathlib/Analysis/Fourier/LpSpace.lean`: `fourierTransformₗᵢ` 51; `Mathlib/Analysis/Matrix/Order.lean` 188, 214; `Mathlib/Analysis/CStarAlgebra/Matrix.lean` 101; `Mathlib/Analysis/Normed/Lp/WithLp.lean` 49; `Mathlib/Analysis/InnerProductSpace/PiL2.lean` 84; `Mathlib/Analysis/LocallyConvex/Separation.lean` 223; `Mathlib/Analysis/Calculus/BumpFunction/Convolution.lean` 103; `Mathlib/Probability/Martingale/Convergence.lean` 361; `Mathlib/MeasureTheory/Integral/Lebesgue/Countable.lean` 227; `Mathlib/MeasureTheory/Measure/Typeclasses/NullSingletonClass.lean` 31, alias `NoAtoms` 35.
- `Mathlib/Analysis/Distribution/FourierMultiplier.lean` defines multipliers on Schwartz functions and tempered distributions for symbols of temperate growth: the README's "no Fourier multiplier with an `L^∞` symbol" holds. No Schatten class or trace class in Mathlib (grep).
- `TauCeti/Analysis/OperatorIdeal/Family/Schatten.lean` 48, 64, 81, 93, 101, 109; `…/TraceClass.lean` 59, 90; `…/HilbertSchmidt.lean` 65, 112; `TauCeti/Analysis/OperatorIdeal/ApproximationNumber/Basic.lean` 77 (zero-based); `TauCeti/Analysis/Fourier/L2Multiplier.lean` 88 (`F` explicit, symbol in `Lp ℂ ∞ volume`), 126, 159, 177, 299; `TauCeti/Analysis/Fourier/MihlinHormander.lean` 300; `TauCeti/Analysis/Distribution/SchwartzSpace/LittlewoodPaley.lean` 87 (symbol `ContDiffOn ℝ ∞` off the origin), 196; `TauCeti/MeasureTheory/Measure/Atom.lean` 59 (measurable, positive mass, subsets null or full); `TauCeti/MeasureTheory/Measure/AtomlessStandardBorel/Transport.lean` 115. Tau Ceti has no atomless predicate, no kernel operator and no operator trace beyond the Dixmier trace file.

### Headlines

The six headline groups of the Summary: the multiplier algebra with duality and interpolation (§3.2, §4.1, §4.2), the Schur product theorem (§6.1), Grothendieck–Haagerup (§6.3, §6.4), the atomless and continuous-symbol theorems (§7.3, §8.2), Fourier–Schur transference (§9.5), the Hörmander–Mikhlin–Schur theorem (§11.5). Each is a target with hypotheses and a locator, and each has a row above. There is no `Suggested.lean` to probe for padding or absent headlines at this stage.

## Not verifiable

- The nine works recorded as uncertified (reed-simon-1-1980, simon-trace-ideals-2005, gohberg-krein-1969, paulsen-2002, pisier-similarity-2001, horn-johnson-topics-1991, grafakos-classical-2014, musat-2003, jrwz-2020): not available legally to this run; cited by locator only.
- The estimates inside the proofs of cgpt-2023 behind §10.3 (Lemma 1.3, lines 380–454) and §11.3–§11.4 (lines 628–1041): statements, hypotheses, sign conventions and scale exponents were checked; the localised intertwining of §11.3 and the far-part estimate of §11.4 were not re-derived.
- The constant `O(p)` of the martingale interpolation gap rests on jrwz-2020 (uncertified) through cgpt-2023 lines 481–484.
- Agreement of the preprint numbering with the published versions was not compared; the manifest names the versions read.
- Elaboration, the one-tactic probe and the `#check` audit: not available (this lane does not elaborate, and the design has no Lean file).

## Source issues

- **Misprint** in lafforgue-delasalle-2011 at Remark 1.4, printed p. 6 (line 249): the source says `S_q` is the interpolation space between `S_p` and `S_{p'}` for `2 ≤ p ≤ q`; it should be `S_p` between `S_q` and `S_{q'}`, with `1/p = θ/q' + (1 − θ)/q`; affects nothing.
- **Error** in lafforgue-delasalle-2011 at Remark 1.6, printed p. 7 (lines 262–266): the source says the completely bounded norm is unchanged for every auxiliary σ-finite space; it should require a nonzero auxiliary measure, the zero measure giving norm zero; affects a stated result.
- **Misprint** in lafforgue-delasalle-2011 at the proof of Lemma 1.9, printed p. 8 (line 348): the source says the conjugation embeds into the Schatten class of the `ν`-space; it should be the Schatten class of the `μ`-space; affects nothing.
- **Gap** in lafforgue-delasalle-2011 at §1.4, printed p. 12 (lines 487–488): the source says an atom is a measurable set that cannot be split into two sets of positive measure; it should also require positive measure, or every null set is an atom; affects a stated result.
- **Error** in lafforgue-delasalle-2011 at Theorem 1.19, printed p. 13 (lines 524–531): the source says norm strictly below `C` globally is equivalent to norm strictly below `C` on every finite subset of the support; it should use non-strict bounds (on `ℕ`, `M(i, j) = 1 − 1/(i + 1)`, `C = 1`); affects a stated result.
- **Gap** in lafforgue-delasalle-2011 at Theorem 1.19, printed p. 13 (lines 522–527): the source says a continuous symbol on a locally compact space defines a multiplier; it should first show the symbol is almost everywhere measurable for the product σ-algebra, automatic only for second-countable spaces; affects the proof.
- **Error** in caspers-delasalle-2015 at Theorem 3.1, printed p. 6 (lines 282–288): the source says the strict bound `K` globally is equivalent to the strict bound `K` on every restriction; it should use non-strict bounds, by the same example; affects a stated result.
- **Gap** in cgpt-2023 at §1.2 before Lemma 1.3, printed p. 8 (lines 375–378): the source says the periodised operator has mean zero for every `k`; it should require `4^k ≥ √n`, since two points of one grid cube can be at distance `≥ 2^{−k}` when `n ≥ 2`; affects the proof.
- **Misprint** in cgpt-2023 at the proof of Theorem A, printed p. 15 (line 910): the source says the `ξ`-derivative of `M_c(x, ξ)` is a signed `ξ`-derivative of `M` at `(x, x − ξ)`; it should be the `y`-derivative of `M` there; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "031642d5a151b1a9a7a8aeb67ebbaff061ca3c96", "job": "REV-DESIGN-SchattenClassesAndSchurMultipliers~5", "model": "fable", "worker": "chris-x10"} -->
