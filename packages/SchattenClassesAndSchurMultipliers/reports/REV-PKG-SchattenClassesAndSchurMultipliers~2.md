<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17047#issuecomment-6900775792 -->
Review (claude) of 2f44b25

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) The definiteness route of §10.2 uses the commutant of `L^∞(ℝⁿ)`, which nothing supplies

   - **Location.** `packages/SchattenClassesAndSchurMultipliers/README.md` lines 2011–2013: "`A`
     commutes with every `U_z` and hence with the multiplication algebra `L^∞(ℝⁿ)`, so `A` is a
     multiplication operator, and the only Hilbert–Schmidt multiplication operator on `L²(ℝⁿ)` is
     `0`"; `*Needs:*` at line 2034.
   - **Claim.** The route's inputs are §3.1, §10.1 and Mathlib `MeasureTheory.Lp`.
   - **Witness.** The route uses that the characters generate `L^∞(ℝⁿ)` and that `L^∞(ℝⁿ)` is its own
     commutant on `L²(ℝⁿ)`. No layer, contract or `*Needs:*` line has either; VonNeumannAlgebras V2
     states its multiplication/MASA theorem for a given finite measure, and Lebesgue measure is not
     finite.
   - **Repair.** Replace the bullet's argument by kernels: "if `‖A‖_{BMO_c} = 0` then the continuous
     function `π(A)` equals its mean on every cube, hence is constant, so `U_z A U_z* = A` for every
     `z`. Its kernel is `e^{2πi⟨z, x − y⟩} k_A(x, y)` (§3.1), so by the uniqueness of the kernel (§2.1)
     `(e^{2πi⟨z, x − y⟩} − 1) k_A(x, y) = 0` almost everywhere, for each `z`; over the countable set
     `z ∈ ℚⁿ`, almost every `(x, y)` with `k_A(x, y) ≠ 0` has `⟨z, x − y⟩ ∈ ℤ` for all `z ∈ ℚⁿ`, that
     is `x = y`; the diagonal is null because `n ≥ 1`, so `k_A = 0` and `A = 0`." Add "§2.1" to the
     `*Needs:*` of §10.2 and "Layer 2 (§2.1)" to the Layer 10 Dependencies and to the sentence
     "Layer 10 needs Layers 1 and 3" of How to read the build. Tested: for `n = 1`,
     `A = u ⊗ u*`, `u = 1_{[0,1]}`, `z = 1/2`, `(e^{πi(x−y)} − 1)·1_{[0,1]²}` is nonzero on a set of
     positive measure, so `π(A)` is not constant; for `n = 0` and `A = 1` the factor is `e⁰ − 1 = 0`
     and the diagonal has mass `1`, so nothing follows, as the Check at line 2028 requires.

2. **F02** (P3) §11.3 identifies `L²(ℝⁿ; S₂)` with `L²(ℝ³ⁿ)` "through §2.1", which does not give it

   - **Location.** `packages/SchattenClassesAndSchurMultipliers/README.md` lines 2201–2203: "on
     `L²(ℝⁿ; S₂(L²(ℝⁿ)))`, identified with `L²(ℝⁿ_z × ℝⁿ_x × ℝⁿ_y)` through §2.1"; `*Needs:*` at
     line 2234 ("§2.1, §10.2, §11.2; Mathlib `MeasureTheory.Lp.fourierTransformₗᵢ`").
   - **Claim.** §2.1 supplies the identification on which `T̃^c_N` (multiplication by `N(x, ξ)`) is
     defined.
   - **Witness.** §2.1 gives `S₂(L²(ℝⁿ)) ≅ L²(ℝⁿ × ℝⁿ)` only. The step `L²(μ; L²(ν)) ≅ L²(μ ⊗ ν)`
     is in no layer, contract or `*Needs:*` line. BochnerSpaces §4.2 states it (`exists_fubiniEquiv`,
     σ-finite `μ`, `ν`). The same `*Needs:*` omits §11.1, where `|||M|||_c` of the third bullet is
     defined.
   - **Repair.** (a) In §11.3 write "identified with `L²(ℝⁿ_z × ℝⁿ_x × ℝⁿ_y)` through the kernel
     unitary of §2.1 and the Fubini isometry `L²(μ; L²(ν)) ≅ L²(μ ⊗ ν)` of BochnerSpaces §4.2". (b)
     Add "§3.1, §11.1; BochnerSpaces §4.2" to the `*Needs:*` of §11.3 and "BochnerSpaces §4.2" to the
     Layer 11 Dependencies. (c) Add to the BochnerSpaces contract: "§4.2: for σ-finite `μ`, `ν`,
     `1 ≤ p < ∞` and a Banach space `X`, the isometric isomorphism `Lᵖ(μ; Lᵖ(ν; X)) ≅ Lᵖ(μ ⊗ ν; X)`
     with its almost-everywhere section formula; used at `p = 2`, `X = ℂ` in §11.3", and "the Fubini
     isometry (§4.2)" to the BochnerSpaces bullet of Scope and ownership. BochnerSpaces is already a
     supplier, so the dependency check is unchanged. Tested: on `{1, 2}` with counting measure both
     sides have dimension `2 · 4 = 8 = 2³`; for `N = 1` the multiplier is the identity on both; for
     a Toeplitz symbol `M_c(x, ξ) = m(ξ)` the operator is `T_m` on each entry, the first Check of
     §11.3.

3. **F03** (P3) A Check of §10.2 states facts about `J_k` of §10.3 and the inequality of §10.4

   - **Location.** `packages/SchattenClassesAndSchurMultipliers/README.md` lines 2029–2031:
     "definiteness fails, every `J_k` of §10.3 is `0`, and for `p = 4` and `Ψ(z) = e^{−Rz}` §10.4
     would assert `e^{−R/2} ≤ 4 C_n e^{−R}` for every `R > 0`"; `*Needs:*` at line 2034.
   - **Claim.** §10.2 needs §3.1 and §10.1.
   - **Witness.** `J_k` is defined at line 2040 (§10.3) and the inequality is stated at line 2075
     (§10.4); both sections need §10.2 (lines 2069, 2113), so an edge from §10.2 to them would be a
     cycle. This is the pattern of F02.
   - **Repair.** Move, do not add edges. Keep in §10.2: "The dimension `n = 0` is excluded: `ℝ⁰` is a
     point, `L²(ℝ⁰) = ℂ` and `U_z = 1`, so `π(A)` is constant and `‖A‖_{BMO} = 0` for every `A`, while
     `A = 1` has `‖A‖₂ = 1`; definiteness fails. For `n ≥ 1` the diagonal of `ℝⁿ × ℝⁿ` is null." Add
     to the Checks of §10.3: "`n = 0`: `|x − y| = 0 < 2^{−k}`, so every `J_k` is `0`, and
     `‖A‖_p ≤ liminf_k ‖J_k A‖_p` fails for `A = 1`." Add to the Checks of §10.4: "`n = 0` is
     excluded: there `‖·‖_{BMO} = 0` (§10.2), and for `p = 4`, `Ψ(z) = e^{−Rz}·1` the inequality
     would read `e^{−R/2} ≤ 4 C_n e^{−R}` for every `R > 0`." Tested: `Ψ(1/2) = e^{−R/2}` with
     `‖1‖₄ = 1` on `ℂ`; `sup_t ‖Ψ(1 + it)‖₂ = e^{−R}`; `e^{R/2} ≤ 4C_n` fails for `R > 2 ln(4C_n)`.

Three findings, all P3, none blocking. The four findings of the first review are repaired. No
statement was found false, vacuous or unowned; the Lean file elaborates with `sorry` as its only
warning and no declaration is padding. The three findings are the two patterns of the first review
(a route input with no supplier; a section stating facts about later sections) found again in
Layers 10 and 11, which the repairs did not touch.

## Previous findings

- **F01 — repaired.** Contract, `packages/SchattenClassesAndSchurMultipliers/README.md` lines
  408–416: "V2 (completed Hilbert tensor products): … used for the stabilisation of §1.4" and
  "V2.RectangularL2: … in §2.4, for the amplified spaces `L²(Ω × Fin m)` of §3.5 and … in §3.6".
  §1.4 `*Needs:*` (line 749) and the Layer 1 Dependencies (line 762) name "VonNeumannAlgebras V2
  (completed Hilbert tensor products)"; Scope (line 80) names V2. The cited paragraph exists in
  VonNeumannAlgebras, Layer 2 ("Construct completed Hilbert tensor products …").
- **F02 — repaired.** The Kronecker sentence is a §3.5 bullet (lines 1121–1123), with §3.4 and
  `Matrix.kroneckerMap` in the `*Needs:*` of §3.5 (line 1139) and no longer in that of §3.4
  (line 1102); the point-mass sentence is a §3.7 Check (lines 1192–1197) with §3.4 in its
  `*Needs:*`; the last bullet of §3.3 (line 1085) speaks of `‖S_M‖_p` only, and the null-set
  invariance of the completely bounded norm is a §3.5 bullet (lines 1118–1120).
- **F03 — repaired.** §6.4 (lines 1481–1495) now reads "`⟨g, S_M(A) f⟩ = Σ_j ⟨c_j g, A(d_j f)⟩`",
  with no `L²(μ; K) = L²(μ) ⊗̂ K`; `*Needs:*` (lines 1525–1528) has §2.1, §3.5,
  `MeasureTheory.integral_prod` and `MeasureTheory.hasSum_integral_of_dominated_convergence`. §6.3
  uses the same finite coordinate form (line 1448). Recomputed below.
- **F04 — repaired.** `packages/SchattenClassesAndSchurMultipliers/Suggested.lean` line 247:
  "`theorem schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm (n : ℕ)`" with no `hn`; README line 24
  without `n ≥ 1`; §9.5 lines 1919–1924 prove the case `n = 0` and line 1928 is its Check.

The repaired pattern of F01/F03 (an identification or structural fact used by a route with no
supplier) recurs in §10.2 and §11.3 (R01, R02); that of F02 (facts about later sections) recurs in
a Check of §10.2 (R03). I found no other instance: I read every `*Needs:*` line against its
section.

## Verified sound

**Principles.** No route-specific shortcut, no re-planned roadmap, no upward or cyclic supply, no
algorithm, no sorry'd data, no `set_option`, no copied passage; the organisation is the roadmap's
own (Source independence below).

**Elaboration.** `lake env lean` on `packages/SchattenClassesAndSchurMultipliers/Suggested.lean`
from the content repository: 11 warnings, each "declaration uses `sorry`", exit code 0, no other
message. 8 definitions with real bodies, 11 theorems, no `lemma`, `example`, `#eval`, `#synth`,
`True` placeholder. Imports: `import Mathlib` and five `TauCeti.*` modules, each used
(`schattenGauge`; `lpSchattenNorm`; `fourierMultiplierCbNorm` twice; the atomless theorem).
Elaborated types: I compared the 19 signatures of the worker's `#check @name` transcript with the
README statements. `schattenGauge` keeps both `CompleteSpace` binders; every theorem of the Schur
section keeps `[SigmaFinite μ]`; the two continuous-symbol theorems keep `[LocallyCompactSpace X]
[T2Space X] [BorelSpace X] [IsFiniteMeasureOnCompacts μ] [μ.InnerRegularCompactLTTop]`; the
transference theorem has lost `1 ≤ n →` and nothing else changed.

**Padding probe.** Each of the 11 sorried theorems was tried on scratch copies with `simp`, `rfl`,
`infer_instance`, `exact le_rfl`, `constructor <;> rfl`, `exact ⟨rfl, rfl⟩`, `exact Iff.rfl`,
`exact ⟨0, by simp⟩`, `norm_num`, `aesop`, and `simp` with all eight definitions unfolded: 11 of 11
fail under each of the 11 tactics (an error at each of the 11 proof lines in every run). None
restates a definition, mirrors a Check or treats a boundary case; the `n = 0` clause of the
transference docstring is a remark on one instance of a general theorem.

**Headline theorems** (README lines 11–30) against `Suggested.lean`:

| Headline | Lean | Status |
| --- | --- | --- |
| `M ↦ S_M` isometric on `S₂` | `schurNorm_two_eq` | stated |
| `M ↦ S_M` multiplicative, `*`-preserving | — | named in the module docstring as not statable: needs the map `A ↦ S_M(A)`, the kernel of §2.1, absent at the pins |
| invariance under `p ↦ p'` and transposition | `schurNorm_eq_of_holderConjugate` | stated |
| log-convexity, monotonicity in `|1/p − 1/2|` | `schurNorm_interpolation`, `schurNorm_mono_of_abs_inv_sub_le` | stated |
| Schur product theorem with norms | `schurNorm_of_posSemidef` | stated |
| Grothendieck–Haagerup | `schurNorm_eq_haagerupNorm` | stated |
| Lafforgue–de la Salle, atomless | `schurNorm_eq_schurCbNorm_of_forall_not_isAtom` | stated |
| continuous symbols | `schurNorm_le_iff_of_continuous`, `schurCbNorm_le_iff_of_continuous` | stated |
| Fourier–Schur transference | `schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm` | stated |
| Hörmander–Mikhlin–Schur | `schurNorm_le_hmsNorm` | stated |

Every Lean name appears in the README and each of the 19 backticked names the README attributes
to this roadmap is declared. `kernel_apply`, `kernel_unique`, `kernel_norm` are attributed to
AutomorphicSpectralTheory §0.8 and are there.

**Adversarial table** (repaired passages, sampled targets, headlines, targets of the findings).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 `schattenGauge` | identity of `ℓ²(ℕ)`; rank-one projection; `diag(1/(j+1))`; zero space | `∞` at every `p ≤ ∞`; `1`; `‖·‖₂² = π²/6`, `‖·‖₁ = ∞`, compact; `0` | holds; the `p = ∞` branch excludes `B(H)` | none |
| §1.3 interpolation example | `T(A) = Tr(A)E₁₁` on `M_n` | `C₀ = 1`, `C₁ = n`, bound `n^{1−1/p}` = norm; exchanged exponents `n^{1/4} < n^{3/4}` at `p = 4` | holds | none |
| §1.4 cb norms, new stabilisation text | transpose on `M_n`; `T` fixing `w₀`, zero on `S₁`; `H ⊗̂ ℂ^m` with `H = ℂ`, `m = 2`, `e₁⊗e₁ + e₂⊗e₂` | `‖t‖_∞ = 1`, `‖t‖_{cb,∞} = n`, `‖t‖_{cb,2} = 1`; `‖T‖₁ = 0`, `‖T‖₂ = ∞`, `‖T‖_{4/3} ≥ 1`; Hilbert norm `√2` (projective norm would be `2`) | holds; finiteness hypothesis present | none |
| §3.2 `schurNorm_two_eq` | `[[1,2],[3,4]]`; `μ = 0`; `M = 1_{(1,2)}` | norm `4` at `E₂₂`; `0 = 0`; adjoint is `S_{M̄} = S_M`, `S_{M̃}(E₁₂) = 0`, `S_M(E₁₂)* = E₂₁ = S_{M̃}(E₂₁)` | holds; the three symbol operations are distinguished | none |
| §3.4 triangular truncation | `A = [[√2,1],[−1,√2]]/√3` | rows orthonormal; `(S_M A)*(S_M A) = ⅓[[2,√2],[√2,3]]`, trace `5/3`, determinant `4/9`, eigenvalues `4/3`, `1/3`; norm `2/√3` | holds | none |
| §3.5 `schurCbNorm`, moved bullets | `[[1,2],[2,1]] = (3/2)J − (1/2)vvᵀ`; `m = 0`; `M ⊗ J₂` with rows `ι × Fin m` | bound `3/2 + 1/2 = 2`, attained at `E₁₂`; level `0` gives `0`; `[[1,1,2,2],[1,1,2,2],[2,2,1,1],[2,2,1,1]]` | holds | none |
| §3.7 new point-mass Check | masses `(1, 3)` | kernel ↦ `[[k₁₁, √3k₁₂],[√3k₂₁, 3k₂₂]]`, entrywise scaling commutes with Hadamard by `M`; `‖S_M‖₂ = 2 = ‖S_M‖_∞` | holds | none |
| §4.1 `schurNorm_eq_of_holderConjugate` | `M = 1_{(1,2)}`; `(p, q) = (1, ∞)` | `Tr(S_M(A)B) = A₁₂B₂₁ = Tr(A S_{M^t}(B))`, `Tr(A S_M(B)) = A₂₁B₁₂`; truncation `2/√3` at both ends | holds; dual is `S_{M^t}` | none |
| §4.2 `schurNorm_interpolation`, `…_mono_…` | endpoints `(0, ∞)`; `p₀ = p₁ = ∞`; truncation at `p = 4`; `p = ∞`, `q = 1` | a zero endpoint forces `M = 0`, so `0·∞` occurs only with left side `0`; `p⁻¹ = 0`; `(2/√3)^{1/2} = 1.0746 ∈ [1, 1.1547]`; `|0 − ½| = |1 − ½|` | holds with no finiteness hypothesis | none |
| §5.1 contractivity | `{1,2}`, trivial `𝒜`: `[[1,2],[2,1]]`, truncation, `1_{(1,2)}`; `ℕ`, `φ = 1` | `3/2 ≤ 2`, `3/4 ≤ 2/√3`, `1/4 ≤ 1`; `1 = 1` (with `condExp`: `1 = 0`) | holds | none |
| §5.2 martingale limits | dyadic `1_{x<y}`; empty family | `f₀ = 1/2`, `f₁ = [[½,1],[0,½]]` of norm `≥ 1`; left `1`, `sup ∅ = 0` | holds; nonemptiness in the statement | none |
| §6.1 `schurNorm_of_posSemidef` | `[[2,1],[1,1]]`; `[[1,2],[2,1]]`; empty `ι` | `2` at `E₁₁`; eigenvalue `−1`, diagonal `1`, norm `2`; `0 = ⨆ ∅` | holds; positivity needed | none |
| §6.3 new coordinate form | `[[1,2],[2,1]]`, `ξ_j = (√(3/2), v_j/√2)`, `η_k = (√(3/2), −v_k/√2)`; `ξ₁ = (i)`, `η₁ = (1)` | entry `(i,j)`: `Σ_n conj ξ_i(n) η_j(n) A_{ij}`; `(3/2)A − (1/2)D_vAD_v`; `‖ξ_j‖² = 2`, bound `2`; `M = −i`, form gives `−iA` (without the star `+iA`) | holds | none |
| §6.4 new route, `schurNorm_eq_haagerupNorm` | `cos(x − y)`, `ξ = η = (e^{ix}, e^{−ix})/√2`; `μ = 0`; `ξ = 0`, `η` unbounded | `(e^{i(y−x)} + e^{−i(y−x)})/2 = cos(x−y)`; `Σ_j|c_j|² = 1`; `Σ_j ‖c_j g‖² = ∫‖ξ‖²|g|²`; `0 = 0`; `0·∞ = 0` with `M = 0` | holds; domination `‖ξ‖_∞‖η‖_∞|g||k||f|` integrable | none |
| §7.1, §7.3 atomless theorem | countable–cocountable measure; `λ ≪ μ` with `μ` atomless; `A = [0,2]`, `t = ½` | space is an atom, no set of measure `½`; nested halves `μ(A_n) → 0`, `λ(A_n) = λ(A)` contradict `λ ≪ μ`; ratio `¼`, measure `½` | `IsAtom` is the right hypothesis; invariance under equivalence holds | none |
| §8.2 continuous symbols | `C = 0`; `N = 0`; repeated points; `M(x,y) = x`; discrete `X` beyond the continuum, `μ = δ_{x₀}` | forces `M = 0` on `supp μ²`, conull; vacuous `0 ≤ C`; block-constant matrix, so `Function.Injective`; second side only with `C = ∞`; class of `M` is `1`, norm `1` | holds; the `MemLp` conjunct and a.e. measurability are needed | none |
| §9.4 approximate identities | `p = ∞`, `n = 1`, `f = γ_R`, `g = T⁻¹γ_T` | `(1 + T²/R²)^{−1/2}`: `0.995` at `T = R/10`, `0.0995` at `T = 10R` | holds | none |
| §9.5 transference | `m = e_a`; `p = ∞`; `n = 0`, `m = 2i`; Fourier side at `p = ∞` | both `1`; both the total variation of the measure with transform `m`, or `∞`; volume on `ℝ⁰` is `δ₀` (elaborated: `volume_euclideanSpace_eq_dirac` at `Fin 0`), both sides `2`; `|∫tr(gh)| ≤ liminf ‖Λ(g)‖_∞ ‖h‖₁` | holds for every `m ∈ L^∞` and every `n` | none |
| §10.1 column and row BMO | `f = Σ 1_{I_k}E_{k1}`, `N = 4` | column `(1 − Σa_k²)E₁₁`, max `¾`, `0.866`; rows `diag(a) − aaᵀ`, `[[¼,−¼],[−¼,¼]]` has norm `½`, `0.707` | `g*g` pinned | none |
| §10.2 matrix BMO | `n = 0`, `A = 1`; `n = 1`, `u = 1_{[0,1]}`, `z = ½` | BMO `0`, `‖A‖₂ = 1`; `(e^{πi(x−y)} − 1)1_{[0,1]²} ≠ 0` | definiteness holds for `n ≥ 1`; route unsupplied | R01, R03 |
| §10.3 periodisation | `n = 2`, `k = 0`, `x = (.05,.05)`, `y = (.95,.95)`; `4^k ≥ 4√n` | `|x−y| = 1.27 ≥ 1`, `m₀(x) = m₀(y)`; `|p_k(x) − p_k(y)| ≥ 2^{−k}(1 − 2√n/4^k) ≥ 2^{−k}/2` | thresholds on `k` are in the statement | none |
| §10.4 interpolation | `Ψ(z) = C_∞^{z−1}C₂^{−z}T(U|A|^{pz/2})`; `T = id`; `n = 0`, `Ψ = e^{−Rz}` | `λ_i = ln C_∞ − ln C₂ + (p/2)ln s_i` real; `‖Ψ(it)‖_{BMO} ≤ 1`, `‖Ψ(1+it)‖₂ ≤ 1`; `C_n p ≥ 1`; `e^{−R/2} ≤ 4Ce^{−R}` fails | holds for `n ≥ 1` | R03 |
| §11.1 `hmsNorm` | `sign(x−y)`; `φ(ξ) = ξ/√(1+ξ²)`; `M = 1`; `k = 0` on the diagonal | `2`; maximum of `|ξ|(1+ξ²)^{−3/2}` at `ξ² = ½`: `0.3849`, total `2 + 0.770`; `2`; `0⁰ = 1` on a null set | matches Theorem A up to constants in `n` | none |
| §11.3 twisted multipliers | `M_c`, `M_r` against (2.2); `N = 1`; `{1,2}` | `M(x, x−ξ)`, `M(y−ξ, y)`; identity; dimensions `8 = 8` | holds; identification unsupplied | R02 |
| §11.5 `schurNorm_le_hmsNorm` | `M = 1`; `p ↦ p'`; measurability of `M`; dimension-two example at `R = 10` | `1 ≤ C·4·2`, `C ≥ 1/8`; `p²/(p−1) = pp'`; continuous off the null diagonal, bounded by `|||M|||/2`; `D = 11.05`, `(sin .905 + 10 cos .905)·100/122.1 = 5.70` | holds; `C` chosen before `M`, `p` | none |

**Sources: the seeded sample** (all fifteen targets read at their locators; none flagged
unverified by the author).

- §1.1: `lafforgue-delasalle-2011` lines 174–179; `cgpt-2023` lines 209–214.
- §1.4: `lafforgue-delasalle-2011` lines 183–190 with (2) at 187–189; `cgpt-2023` lines 217–219.
- §3.2: `lafforgue-delasalle-2011` lines 230–232, 267–268; `cgpt-2023` lines 224–226.
- §3.5: Lemma 1.5 at line 254.
- §4.1: Remark 1.2 at line 239 with (4), Remark 1.3 at line 244.
- §5.1: Lemma 1.10 at line 363, proof 366–381; the pairing identity at 404–413.
- §5.2: Lemma 1.11 at line 383, Remark 1.12 at line 393 (directed sets).
- §6.4: Theorem 1.7 at line 274 (norm, separable Hilbert spaces), (5) at 289 for the completely
  bounded equality, proof 286–337; `cgpt-2023` lines 89–94.
- §8.2: Theorem 1.19 at line 524, proof 535–588 (the "no isolated point" clause at 532–534);
  `cgpt-2023` lines 232–237; `caspers-delasalle-2015` Theorem 3.1 at line 282.
- §9.5: `cgpt-2023` (FS) lines 71–72; `caspers-delasalle-2015` Theorem 4.2 at 485, Theorem 5.2 at
  543, Corollary 5.3 at 626 (each for symbols in `M_{CB}A(G)`; the README proves every `m ∈ L^∞`
  by its own route and says so); `neuwirth-ricard-2011` Theorem 2.7 at 516.
- §10.1: `cgpt-2023` lines 246–263, line 683; `mei-2007` lines 96–110, 101–103.
- §10.3: `cgpt-2023` lines 348–378, Lemma 1.3 at 379.
- §10.4: Theorem 1.1 at line 313, Lemma 1.2 at 326, Lemma 1.4 at 471–484, (1.1) at 495, line 506;
  `mei-2007` Lemma 6.1 at 3218.
- §11.1: Theorem A at lines 149–154 (pure `x`- and `y`-derivatives, `|γ| ≤ [n/2] + 1`).
- §11.3: (2.2) at lines 572–582, (2.5) at 595–608, 668–680, (2.8) at 704, (2.9) at 705–718.

Also read: Remark 1.4 (246–252), Remark 1.6 (262), Lemma 1.9 (342), Lemma 1.13 (415), Question
1.14 (442), Lemma 1.17 (489), Theorem 1.18 (505), Notation 2.1 (597); `cgpt-2023` (HMS) line 79,
property i) line 231, (2.1) line 570, Remark 2.1 line 1042, Theorem A′ line 1070;
`caspers-delasalle-2015` lines 26–41, Lemma 4.1 at 449, Theorem 5.1 at 529, lines 638–642. No
locator slip. All 16 cited works are in `packages/SchattenClassesAndSchurMultipliers/sources.toml`;
I added no entry and requested no text.

**Library declarations at the pins.** One scratch file with `#check @name` for 67 names the README
or the Lean file cites elaborated without error: among them `MeasureTheory.lpMeas`,
`MeasureTheory.condExpL2`, `MeasureTheory.condExp_of_not_integrable`,
`MeasureTheory.MemLp.condExpL2_ae_eq_condExp'`, `MeasureTheory.Integrable.tendsto_ae_condExp`,
`ContinuousLinearMap.comp_condExp_comm`, `Matrix.PosSemidef.hadamard` and `.kronecker`,
`Complex.HadamardThreeLines.norm_le_interpStrip_of_mem_verticalClosedStrip`,
`MeasureTheory.Lp.fourierTransformₗᵢ`, `MeasureTheory.Measure.support`,
`MeasurableSet.exists_isCompact_lt_add`, `IsCompact.exists_isOpen_lt_add`,
`exists_continuousMap_one_of_isCompact_subset_isOpen`,
`MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le`,
`MeasureTheory.hasSum_integral_of_dominated_convergence`, `geometric_hahn_banach_point_closed`,
`ContDiffBump.ae_convolution_tendsto_right_of_locallyIntegrable`,
`volume_euclideanSpace_eq_dirac`, `ProbabilityTheory.gaussianReal_zero_var`,
`ContinuousMap.starSubalgebra_topologicalClosure_eq_top_of_separatesPoints`,
`NormalSpace.of_compactSpace_r1Space`, `Prod.opensMeasurableSpace`, `ENNReal.HolderConjugate`,
and Tau Ceti's six `OperatorIdealFamily` Schatten declarations,
`TauCeti.UnitarilyInvariantSeminorm.schatten`, `Matrix.frobeniusInnerProductSpace`, the five
`MeasureTheory.Lp.fourierMultiplierCLM` declarations and `MeasureTheory.Measure.IsAtom`. Every
Mathlib file path the README names exists at the pin (35 paths, including
`Mathlib/Basic/ENNReal/Holder.lean`, which holds `ENNReal.HolderConjugate`). Opened in source:
`TauCeti.exists_eLpNorm_fourierMultiplierCLM_le_of_norm_iteratedFDeriv_le`
(`TauCeti/Analysis/Fourier/MihlinHormander.lean` :300), `ContDiffBump.littlewoodPaleyPiece` and its
bound (`…/SchwartzSpace/LittlewoodPaley.lean`), `exists_subset_measure_eq_of_nullSingleton`
(`…/AtomlessStandardBorel/Transport.lean` :115), `ContinuousLinearMap.singularValue`
(`…/ApproximationNumber/Basic.lean` :77), `schatten_one`, `schatten_two`.

**Duplication audit.** By object: `roadmaps grep` over main and the open pull requests gives no
hit for Herz–Schur, Grothendieck–Haagerup, triangular truncation, double operator integral,
operator-valued or matrix BMO; "Schur multiplier" occurs only as `H₂(G, ℤ)`
(InverseGaloisAndArithmeticFundamentalGroups). Of the Lean names only `schattenGauge` occurs
elsewhere, in `TauCetiRoadmap/OperatorTheory/OperatorIdeals/Suggested.lean` line 438, inside a
different namespace and for a different object (a `SymmetricGauge` at a real exponent); the fully
qualified names differ. CStarAlgebras (README line 1179) owns the Haagerup tensor product of
operator spaces; the factorisation constant `‖M‖_H` of a symbol is defined here and nothing there
states it. NoncommutativeIntegration (README line 74) places the classification of Schur
multipliers outside its scope. The overlap list has no second copy, no dropped id and no
conflicting pull request, and the board's package index lists no other package on these objects.

Overlap check: read NoncommutativeIntegration, OperatorTheory/OperatorIdeals, NoncommutativeGeometry, BochnerSpaces, BanachSpaceTheory, VonNeumannAlgebras, and searched AmenableTracesOnCStarAlgebras and QuantumFoundations by object; shared objects and owners: Schatten families for `1 ≤ p < ∞` and the `B(H)` family at `p = ∞` — OperatorIdeals (cited; NoncommutativeGeometry consumes the same), the compact endpoint — this roadmap; `Lᵖ(B(H), Tr) = S_p`, duality, interpolation — NoncommutativeIntegration (cited); martingale BMO — NoncommutativeIntegration (the semifinite form a declared gap); the `L^∞` conditional expectation, divisibility of atomless measures and the Fubini isometry — BochnerSpaces §7.4, §7.5, §4.2 (the last to be cited, R02); Hilbert tensor products and the ultraproduct — VonNeumannAlgebras (cited); nothing has two owners.

**Supplier-order audit.** Output of the dependency check:

    depcheck: 244 roadmaps, 2239 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. Resolved now: NoncommutativeIntegration §1.3, §1.4, §1.5, §2.1,
§2.3 (operator estimate and regularisation are in its text), §2.5, §2.6 (two couples, bounded
`Lp_j → Lq_j`), §4.3, §4.4 (probability space, `1 ≤ p < ∞`), §7.3, §8.4 on main;
VonNeumannAlgebras V2 (the paragraph on completed Hilbert tensor products), V2.RectangularL2 (no
separability hypothesis), V4.Core, §13.2 (V13b, with the Hilbert-space ultraproduct) on main;
CStarAlgebras §1.6 (C1.6), §3.2 (C3.2) on main; BanachSpaceTheory B4.0 (the density
`m = μ.withDensityᵥ h`) on main; OperatorIdeals OI-A12, A23, A25, A30, A38, A40, B29, B32, B41,
B76, B80 ("Infinite-exponent Schatten family"), B88, C01, C13, C14 on main; UnboundedOperators
§5.1 (UO-E01) on main; AutomorphicSpectralTheory §0.8 (`kernel_apply`, `kernel_unique`,
`kernel_norm`, stated for σ-finite standard Borel spaces with separable `L²`), §0.9, §0.10 at the
head of its open pull request, earlier in the merge order; BochnerSpaces §7.4 (the `L¹` projection
without σ-finiteness of the trim, the `L^∞` contraction as its adjoint under it, positivity,
idempotence, tower law) and §7.5 (divisibility of atomless finite measures) at the head of its
open pull request, another author's new roadmap folder. No roadmap of the never-cite list is
cited.

**Declared gaps.** `sigma-finite-hilbert-schmidt-kernels` (AutomorphicSpectralTheory §0.8) and
`semifinite-martingale-bmo-interpolation` (NoncommutativeIntegration, Part II): the same two slugs
are in `design/plan.json`, each has a named supplier and a contract in the required form (README
lines 446–466 and 480–488), precise hypotheses, and asks for nothing already provided (§0.8 is
standard Borel; §8.4 is finite-tracial). Not findings; an acceptance after the repairs is
conditional on both.

**Shape and style.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to
read the build, eleven layers each ending with Examples and Dependencies, Downstream consumers,
References. Definitions carry an API list and at least three Checks (§1.1: 5, §1.4: 6, §2.1: 4,
§2.3: 3, §2.5: 6, §3.1: 4, §3.5: 3, §3.7: 4, §6.2: 3, §7.1: 4, §9.1: 3, §9.2: 3, §9.3: 3,
§10.1: 3, §10.2: 4, §10.3: 3, §11.1: 5, §11.3: 3). No LaTeX delimiters, pull-request numbers,
dates, anchors, machine paths or process words in the README or the Lean file; no numbering
tables; `theorem` only.

**Copyright.** Wording: 20 passages set beside their sources (the fifteen sampled statements, the
routes of §6.4, §7.2, §7.3 and §8.2 against the proofs of Theorem 1.7, Lemma 1.17, Theorems 1.18
and 1.19, and the docstring of `schurNorm_le_hmsNorm` against Theorem A); the longest shared run
is under ten words and is a formula or a standard name. Arrangement: the most cited source,
`lafforgue-delasalle-2011`, has in its §1 five subsections (cb maps; Schur multipliers; change of
measure; change of σ-algebra; continuous symbols). No one-to-one run: §1.4 ↔ 1.1; Layer 3 ↔ 1.2
without Theorem 1.7, which is in Layer 6 after Layer 5 because §6.4 needs §5.1; §3.7 ↔ 1.3;
Layers 5 and 7 split 1.4; Layer 8 ↔ 1.5; Layers 2, 4, 6, 9, 10, 11 have no counterpart. The order
of Layers 5, 7, 8 is forced by "Layer 7 needs Layers 2, 3 and 5" and "Layer 8 needs Layers 1, 3
and 5". Reuse: no table, figure, list of examples or numerical data is taken over; no public
formalisation of these statements was found to compare the Lean with.

Source independence: 20 passages compared with 5 sources, none shared; largest share lafforgue-delasalle-2011, 42 of 108 source citations; contents compared with lafforgue-delasalle-2011: independent.

## Not verifiable

- `pisier-similarity-2001`, `grafakos-classical-2014`, `simon-trace-ideals-2005`,
  `gohberg-krein-1969`, `reed-simon-1-1980`, `paulsen-2002`, `horn-johnson-topics-1991`,
  `musat-2003`, `jrwz-2020`: settled as uncertified in the manifest; their locators (chapters, one
  theorem number each for Grafakos and Musat) were not read. Each stands beside a locator into a
  text that was read, except the chapter citations of the Schur product theorem in §6.1, which is
  also Mathlib's `Matrix.PosSemidef.hadamard`.
- The published versions of the arXiv texts: not compared; every locator is a line of the arXiv
  version the manifest records.
- Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps show` at
  the indexed heads only; BochnerSpaces is not among the 238 names of the brief's list and was
  read through `roadmaps show`.

## Source issues

- **Misprint** in lafforgue-delasalle-2011 at Remark 1.4, printed page 6 (line 249): the source says the class at the larger exponent is the interpolation space between the classes at the smaller exponent and its conjugate; it should be the reverse, the smaller-exponent class interpolating between the larger one and its conjugate; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at the proof of Lemma 1.9, printed page 8 (line 348): the source says the conjugation embeds the Schatten class for the smaller measure into itself; it should be into the class for the dominating measure; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at §1.4, printed page 9 (line 359): the source says the product conditional expectation maps onto bounded functions of the larger product σ-algebra; it should be of the smaller one; affects nothing.
- **Error** in lafforgue-delasalle-2011 at Remark 1.6, printed page 7 (line 262): the source says the stabilised symbol has the same completely bounded norm for any σ-finite second factor; it should exclude the zero measure, where every norm is zero; affects nothing.
- **Error** in cgpt-2023 at §1.2 before Lemma 1.3, printed page 8 (lines 375–378): the source says the periodised operator has mean zero for every index; it should be only once the grid cubes have diameter at most the strip width; affects the proof.
- **Misprint** in cgpt-2023 at §1.2 before Lemma 1.3, printed page 8 (line 378): the source says the nonvanishing frequencies lie in the nonzero integers; it should be the nonzero integer vectors of the dimension; affects nothing.
- **Gap** in cgpt-2023 at the proof of Theorem 1.1, printed page 10 (line 506): the source says the Schatten norm equals the limit of the norms after removing the diagonal strip; it should claim only the lower-semicontinuity inequality, which suffices; affects the proof.

## For the human reviewers

- **Licence.** Every locator is a line of an arXiv version; `packages/SchattenClassesAndSchurMultipliers/sources.toml` records the version read for each, and the journal numbering was not compared.
- **Licence.** Nine of the sixteen sources are uncertified (paywalled books and two articles), cited by chapter or theorem number only; no end theorem rests on one of them alone.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2f44b25f2527dfa8bf0fab77d56b29f4e54c253a", "job": "REV-PKG-SchattenClassesAndSchurMultipliers~2", "model": "fable", "worker": "chris-x81"} -->
