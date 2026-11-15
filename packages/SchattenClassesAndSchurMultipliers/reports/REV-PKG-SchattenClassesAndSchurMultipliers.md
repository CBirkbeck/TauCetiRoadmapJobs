<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17047#issuecomment-6899974453 -->
Review (claude) of d049fa3

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) The Hilbert tensor products of §1.4 have no supplier in its dependency line, and the V2.RectangularL2 contract names the wrong sections

   - **Location.** `packages/SchattenClassesAndSchurMultipliers/README.md` lines 399–401: "used for the
     amplifications `L²(Ω × Ω') ≅ L²(Ω) ⊗̂ L²(Ω')` of §1.4 and §3.7"; line 683–686 (§1.4,
     Stabilisation: "`S₂(H ⊗ L)`"); line 727–728 (§1.4 `*Needs:*`); line 739–741 (Layer 1
     Dependencies).
   - **Claim.** The contract says V2.RectangularL2 is consumed in §1.4 and §3.7.
   - **Witness.** §1.4 uses the abstract tensor product `H ⊗ L` of two Hilbert spaces, not an `L²`
     space; its `*Needs:*` (line 727) and the Layer 1 Dependencies cite no VonNeumannAlgebras V2.
     §3.7 (lines 1142–1167) uses no tensor product. The sections that cite V2.RectangularL2 are §2.4
     (line 889), §3.5 (line 1112) and §3.6 (line 1140).
   - **Repair.** (a) In the contract, replace "of §1.4 and §3.7" by "of §2.4, §3.5 and §3.6", and add a
     bullet: "V2 (completed Hilbert tensor products and bounded operator tensor maps): the tensor
     product `H ⊗ L` of two complex Hilbert spaces, with `H ⊗ ℂ^m ≅ H^m`; used for the stabilisation of
     §1.4." (VonNeumannAlgebras, Layer 2, the paragraph "Construct completed Hilbert tensor
     products …" before V2.RectangularL2). (b) Add "VonNeumannAlgebras V2 (completed Hilbert tensor
     products)" to the `*Needs:*` of §1.4 and to the Layer 1 Dependencies, and "V2" to the
     VonNeumannAlgebras bullet of Scope and ownership. Tested: with `L = ℂ^m` the cited tensor gives
     `H ⊗ ℂ^m ≅ WithLp 2 (Fin m → H)`, the `H^m` of line 657, so the finite case is unchanged.

2. **F02** (P3) §3.4 and §3.3 state facts about objects of the later §3.5 and §3.7 that their dependency lines omit

   - **Location.** `packages/SchattenClassesAndSchurMultipliers/README.md` lines 1071–1074 (§3.4): "the
     amplified symbol `M_m` of §3.5 is the Kronecker product of `M` with the all-ones `m × m` matrix …
     For point masses `w_i > 0` … the norms are the same (§3.7)"; line 1062 (§3.3, last bullet);
     `*Needs:*` at lines 1064 and 1081.
   - **Claim.** §3.4 needs §3.1, §3.3; §3.3 needs §1.1, §1.2, §1.4, §2.2, §3.1.
   - **Witness.** `M_m` is defined at line 1086 (§3.5) and the invariance under equivalent measures is
     proved at line 1149 (§3.7); `‖S_M‖_{cb,p}` of the §3.3 bullet is defined in §3.5. Neither
     `*Needs:*` line lists §3.5 or §3.7, and both are later targets.
   - **Repair.** Move, do not add edges (§3.5 needs §3.3, so an edge back would be a cycle). (a) Move
     the Kronecker sentence to §3.5 as an API bullet ("for a finite index set, `M_m` is the Kronecker
     product of `M` with the all-ones `m × m` matrix"), with `Matrix.kroneckerMap` and "§3.4" added to
     the `*Needs:*` of §3.5 and `Matrix.kroneckerMap` removed from that of §3.4. (b) Move the
     point-mass sentence to §3.7 as a Check of the change-of-measure bullet, with "§3.4" added to its
     `*Needs:*`. (c) In the last bullet of §3.3 keep `‖S_M‖_p` and move "and `‖S_M‖_{cb,p}`" to the
     bullets of §3.5. Tested on `M = [[1, 2], [2, 1]]`: `M_2 = M ⊗ J₂` is the 4 × 4 matrix used in §5.3
     (line 1324), which still reads from §3.5; §6.1 already needs §3.4 and §3.5.

3. **F03** (P3) The upper bound of §6.4 goes through `L²(μ; K) = L²(μ) ⊗̂ K`, which nothing supplies

   - **Location.** `packages/SchattenClassesAndSchurMultipliers/README.md` lines 1438–1439: "with
     `V_η : L²(μ) → L²(μ; K) = L²(μ) ⊗̂ K`, `f ↦ f · η`, and the kernel identity
     `S_M(A) = V_ξ* (A ⊗ 1_K) V_η`"; `*Needs:*` at lines 1467–1468.
   - **Claim.** The route's inputs are §2.5, §3.7, §4.1, §5.1, §6.2, §6.3, V13b, B4.0 and two Mathlib
     lemmas.
   - **Witness.** The identification of the Bochner space `L²(μ; K)` with `L²(μ) ⊗̂ K`, and the
     operator `A ⊗ 1_K` on it, appear in no layer, in none of the supplier contracts (V2.RectangularL2
     is scalar `L² ⊗̂ L²`) and in no `*Needs:*` line.
   - **Repair.** State the bound without the identification, in the form §6.1 already uses. Write
     `ξ = (ξ_n)`, `η = (η_n)` in coordinates of `ℓ²(ℕ)`; for `A ∈ S₂` with kernel `k` and
     `f, g ∈ L²(μ)`, the trace formula's Fubini step (§2.1, `kernel_apply`) and dominated convergence
     (`Σ_n |ξ_n(x)| |η_n(y)| ≤ ‖ξ(x)‖ ‖η(y)‖`) give `⟨g, S_M(A) f⟩ = Σ_n ⟨ξ_n g, A(η_n f)⟩`, hence
     `|⟨g, S_M(A) f⟩| ≤ ‖A‖ (Σ_n ‖ξ_n g‖²)^{1/2} (Σ_n ‖η_n f‖²)^{1/2} ≤ ‖A‖ ‖ξ‖_∞ ‖η‖_∞ ‖g‖ ‖f‖`; the
     same on `Ω × Fin m` with `ξ`, `η` independent of the second coordinate gives every level. Add
     "§2.1" to the `*Needs:*` of §6.4. Tested on the README's own example `M = cos(x − y)`,
     `ξ = η = (e^{ix}, e^{−ix})/√2`: `Σ_n |ξ_n|² = 1`, so the bound is `‖S_M(A)‖ ≤ ‖A‖`, the value `1`
     of line 1461.

4. **F04** (P3) `schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm` carries `hn : 1 ≤ n`, and the statement holds at `n = 0`

   - **Location.** `packages/SchattenClassesAndSchurMultipliers/Suggested.lean` line 246:
     "`theorem schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm (n : ℕ) (hn : 1 ≤ n)`"; README line 24
     and line 1702 ("Throughout this layer `n ≥ 1`").
   - **Claim.** Transference is stated for `n ≥ 1` only.
   - **Witness.** At `n = 0`, `EuclideanSpace ℝ (Fin 0)` is a point of volume `1`, `𝓕` is the
     identity, `T_m = m(0) · id` and the symbol is the constant `m(0)` on a one-point space: both
     sides equal `|m(0)|` for every `p` (levels `k ≥ 1`, `m ≥ 1` exist; level `0` contributes `0`).
   - **Repair.** Delete the binder `(hn : 1 ≤ n)` from the theorem, and "for `n ≥ 1`," from its
     docstring. In §9.5 add after the statement: "The equality also holds for `n = 0`, where `ℝ⁰` is a
     point of mass `1` and both sides are `|m(0)|`", and write "Fourier–Schur transference on `ℝⁿ`" in
     the Summary bullet without "`n ≥ 1`". The standing `n ≥ 1` of Layer 9 stays for its other
     sections. Tested on `n = 0`, `m = 2i`: `2 = 2`. (The same hypothesis of `schurNorm_le_hmsNorm` is
     not raised: the statement holds trivially at `n = 0`, with `|||M||| = 2|M(0, 0)|` and
     `C = 1/8`, but its route through Layer 10 needs `n ≥ 1`, as the Check at README line 1957 shows.)

Four findings, all P3, none blocking. No statement was found false, vacuous or unowned: the
mathematics, the Lean statements, the sampled locators and the supplier citations all held up. The
four repairs are small edits to `packages/SchattenClassesAndSchurMultipliers/README.md` (three
dependency-line and route repairs) and one binder in
`packages/SchattenClassesAndSchurMultipliers/Suggested.lean`.

There is no previous review of this package and no maintainer note to check.

## Verified sound

**Principles.** No route-specific shortcut, no re-planned roadmap, no upward or cyclic supply, no
algorithm, no sorry'd data, no `set_option`, no copied passage. The organisation is the roadmap's
own (see Source independence).

**Elaboration.** `lake env lean` on `packages/SchattenClassesAndSchurMultipliers/Suggested.lean`
from the content repository: 11 warnings, each "declaration uses `sorry`", no error and no other
warning. 8 definitions with real bodies, 11 theorems; no `lemma`, `#eval`, `#synth`, `example`,
`True` placeholder or process comment. All five `TauCeti.*` imports are used (Schatten family: `schattenGauge`; matrix Schatten
seminorm: `lpSchattenNorm`; `L²` multiplier and Frobenius: `fourierMultiplierCbNorm`; atoms: the
atomless theorem) and each module exists at the pin. Elaborated types: I compared the 19
elaborated signatures of the worker's `#check @name` transcript with the README statements; every
theorem keeps `[SigmaFinite μ]` and, for the two continuous-symbol theorems,
`[LocallyCompactSpace X] [T2Space X] [BorelSpace X] [IsFiniteMeasureOnCompacts μ]
[μ.InnerRegularCompactLTTop]`; nothing was lost and nothing changed.

**Padding probe.** Every one of the 11 sorried theorems was tried, on scratch copies, with `simp`,
`rfl`, `infer_instance`, `exact le_rfl`, `constructor <;> rfl` and `simp` with all eight
definitions unfolded: 11 of 11 fail under each tactic. None restates a definition, mirrors a Check
or treats a boundary case.

**Headline theorems** (README Summary, lines 11–30) against `Suggested.lean`:

| Headline | Lean | Status |
| --- | --- | --- |
| `M ↦ S_M` isometric on `S₂` | `schurNorm_two_eq` | stated |
| `M ↦ S_M` multiplicative, `*`-preserving | — | named in the module docstring as not statable (needs `A ↦ S_M(A)`, the kernel of §2.1); correct: in the kernel form it would be a tautology |
| invariance under `p ↦ p'` and transposition | `schurNorm_eq_of_holderConjugate` | stated |
| log-convexity, monotonicity in `|1/p − 1/2|` | `schurNorm_interpolation`, `schurNorm_mono_of_abs_inv_sub_le` | stated |
| Schur product theorem with norms | `schurNorm_of_posSemidef` | stated |
| Grothendieck–Haagerup | `schurNorm_eq_haagerupNorm` | stated |
| Lafforgue–de la Salle, atomless | `schurNorm_eq_schurCbNorm_of_forall_not_isAtom` | stated |
| continuous symbols | `schurNorm_le_iff_of_continuous`, `schurCbNorm_le_iff_of_continuous` | stated |
| Fourier–Schur transference | `schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm` | stated (R04) |
| Hörmander–Mikhlin–Schur | `schurNorm_le_hmsNorm` | stated |

Every Lean name appears in the README, and every backticked name the README attributes to this
roadmap (19) is declared in the file. `kernel_apply`, `kernel_unique`, `kernel_norm` are attributed
to AutomorphicSpectralTheory §0.8 and exist there.

**Adversarial table** (sampled targets, headlines, and the targets of the findings).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 extended gauge, `schattenGauge` | identity of `ℓ²(ℕ)`; rank-one projection; zero space; `V = 0` in `‖VXW‖_p ≤ ‖V‖‖X‖_p‖W‖` with `X` non-compact, `p = ∞` | `‖1‖_p = ∞` all `p ≤ ∞`; `‖e‖_p = 1`; `0`; `0 ≤ 0·∞ = 0` | holds; `p = ∞` branch excludes the wrong model `B(H)` | none |
| §1.2 norming by finite rank | `X = E₁₂`, `p = 2`; `X = diag((j+1)^{−2})`, `p = 1`; `X = 1` on `ℓ²(ℕ)` | `Tr(X E₂₁) = 1 = ‖X‖₂`, other order `u*|X| = 0`; `Σ_{j<d} (j+1)^{−2} → π²/6`; `Tr(P_d) = d → ∞ = ‖1‖_p` | holds, both sides `∞` together | none |
| §1.3 interpolation, example | `T(A) = Tr(A)E₁₁` on `M_n` | `C₀ = 1`, `C₁ = n`, bound `n^{1−1/p}` = true norm; exchanged exponents give `n^{1/4} < n^{3/4}` at `p = 4` | holds | none |
| §1.4 cb norms | transpose on `M_n`; `T` fixing `w₀ = diag(1/(j+1))`, zero on `S₁` | `‖t‖_∞ = 1`, `‖t‖_{cb,∞} = n`, `‖t‖_{cb,2} = 1`, `‖t‖_{cb,1} = n`; `‖T‖₁ = 0`, `‖T‖₂ = ∞`, `‖T‖_{4/3} ≥ 1` so `1 ≤ 0·∞` would fail | finiteness hypothesis is present for general `T` | R01 (supplier line) |
| §2.1 kernel, `IsKernelOperator` | `1_{(1,2)}` on `{1, 2}`; `min(x, y)` on `[0, 1]`; diagonal indicator | `E₁₂ δ₂ = δ₁`; `Σ ((j+½)π)^{−4} = (16/π⁴)(π⁴/96) = 1/6 = ∫∫ min² = 2·(1/12)`; zero operator | row convention pinned; isometry holds | none |
| §2.4 change of measure, sub-σ-algebras | `dν = h dμ`; `k(i, j) = u_i u_j`, `u_j = 1/(j+1)` on `ℕ` | `(UAU*f)(x) = √h(x) ∫ k^ν(x,y) √h(y) f(y) dμ(y)`; `‖k‖₂ = Σ u_j² = π²/6`, `Σ k = ∞` so `condExp` gives `0`, `condExpL2` gives `k` | holds; the source's misprinted target (line 348) is corrected | none |
| §2.5 `L^∞` conditional expectation | masses `(1, 3)`, trivial `𝒜`; adjoint of `g ↦ g(1)·1`; `{1,2,3,4}` with `{1,2},{3,4}` and with `{1,3},{2,4}`; Lebesgue on `ℝ`, trivial `𝒜` | `(a+3b)/4`, with `ρ = (3,1)`: `(a+b)/2`, i.e. `1/2 ≠ 1/4` at `(1,0)`; adjoint sends `1` to `(4, 0)`; `(½,½,0,0)` with mean `¼`; non-nested: `¼` against `(½,0,½,0)`; every constant satisfies the identity | each law excludes a named wrong model; σ-finiteness on `𝒜` needed | none |
| §3.1 `S_M` on `S₂`, `schurNorm_two_eq` | `[[1,2],[3,4]]`; `μ = 0`; `1_{x<y}` on the projection onto constants; level `m = 0` | norm `4` at `E₂₂` = `‖M‖_∞`; `0 = 0`; `‖S_M A‖₂² = 1/2`; contributes `0` | holds | none |
| §3.4 finite case | triangular truncation on `M₂`, `A = [[√2,1],[−1,√2]]/√3` | `A` unitary (row products `0`); `(S_M A)*(S_M A) = ⅓[[2,√2],[√2,3]]`, eigenvalues `4/3, 1/3`; norm `2/√3 > 1 = ‖M‖_∞` | holds | R02 (ordering) |
| §3.5–§3.6 cb norm, stabilisation | `M = [[1,2],[2,1]] = (3/2)J − (1/2)vvᵀ`; `ν = 0`; `M δ_{ij}` as wrong amplification | diagonal `3/2 − 1/2 = 1`, off-diagonal `2`, bound `3/2 + 1/2 = 2`, attained at `E₁₂`; all norms `0`; pinching kills the `(1,2)` block | holds; `ν ≠ 0` hypothesis present (the source omits it) | none |
| §4.1 `schurNorm_eq_of_holderConjugate` | `M = 1_{(1,2)}`; `(p, q) = (1, ∞)`; triangular truncation | `Tr(S_M(A)B) = A₁₂B₂₁ = Tr(A S_{M^t}(B))`, `Tr(A S_M(B)) = A₂₁B₁₂`; `2/√3` at both ends | holds, dual is `S_{M^t}` | none |
| §4.2 `schurNorm_interpolation`, `…_mono_…` | endpoint norms `(0, ∞)` in `[0, ∞]`; `p₀ = p₁ = ∞`; triangular truncation at `p = 4`; `|1/p − ½|` equal | `0·∞ = 0` would assert norm `0`, but a zero endpoint forces `M = 0` (finite rank dense in `S₂`), so the case does not occur; `p = ∞`; `(2/√3)^{1/2} ≈ 1.0746 ∈ [1, 1.1547]`; `p = q` or `p = q'` | holds without a finiteness hypothesis | none |
| §5.2 martingale limits | dyadic `1_{x<y}`; empty family | `f₀ = 1/2`, `f₁ = [[½,1],[0,½]]` (norm ≥ 1); left `1`, supremum over `∅` is `0` | holds; nonemptiness is in the statement | none |
| §5.3 ambient σ-algebra | `{1,2,3,4}`, blocks `[[1,2],[2,1]]` | both cb norms `2` (`M ⊗ J₂`) | holds; stated for cb norms only, as the source (Question 1.14 open) | none |
| §6.1 `schurNorm_of_posSemidef` | `[[2,1],[1,1]]`; `[[1,2],[2,1]]` (eigenvalue `−1`); empty `ι` | `2` at `E₁₁`; diagonal max `1` but norm `2`; `0 = ⨆ ∅` | holds; positivity needed | none |
| §6.2–§6.4 `haagerupNorm`, `schurNorm_eq_haagerupNorm` | `[[1,2],[2,1]]` with `ξ_j = (√(3/2), v_j/√2)`, `η_k = (√(3/2), −v_k/√2)`; `cos(x − y)`; `μ = 0`; `ξ = 0`, `η` unbounded; conjugation check `α = (1,i)/√2` | `⟨ξ_j, η_k⟩ = 3/2 − v_jv_k/2 ∈ {1, 2}`, `‖ξ_j‖² = 2`, so `‖M‖_H = 2`; `⟨ξ(x), ξ(y)⟩ = cos(x−y)`, value `1`; `0 = 0`; `0·∞ = 0` with `M = 0`; `Σψ_{ij}M_{ij} = 0 = ⟨ᾱ, S_M(a)β⟩`, `⟨α, ·⟩ = 1` | holds; `L²`-norm variant gives `∞` on the constant `1` and is excluded | R03 (route) |
| §7.1 atomless, §7.3 theorem | countable–cocountable measure; `μ = 0`; atom of infinite measure under σ-finiteness; `A = [0,2]`, `t = ½` | null singletons but the space is an atom, no set of measure `½`; both sides `0`; cannot occur (a finite positive piece splits it); ratio `¼`, measure `¼·2 = ½` | `IsAtom` agrees with the source's atoms for σ-finite `μ`; null singletons would be a weaker, wrong hypothesis | none |
| §8.1–§8.2 continuous symbols | repeated points; `M(x,y) = x`; `1_{x=y}` on `[0,1]`; `N = 0`; `C = 0`; `supp μ` conull under the three Lean hypotheses | block-constant matrix, norm between norm and cb norm, so `Function.Injective s` is needed; `C = ∞` only; multiplier `0` against identity restrictions of norm `1`; `0 ≤ C`; forces `M = 0` on the support; a compact subset of the open complement is null, σ-finiteness and inner regularity give the rest | holds; `MemLp` conjunct on the left handles unbounded `M` | none |
| §9.4 approximate identities | `n = 1`, `f = γ_R`, `g = T^{−1}γ_T` | mass `R(R² + T²)^{−1/2}`: `0.995` at `T = R/10`, `0.0995` at `T = 10R` | holds; narrower dual Gaussian at `p = ∞` | none |
| §9.5 transference | `m = e_a`; `m = cos`; `p = ∞`; `n = 0`; reflection | `T_m f = f(· + a)`, both cb norms `1`; `1 = 1`; both sides are the measure norm of `𝓕⁻¹m` or `∞`; `|m(0)| = |m(0)|`; `𝓕 m 𝓕⁻¹ = R T_m R` | holds for every `m ∈ L^∞`, beyond the `M_{CB}A(G)` symbols of the cited theorems, by the README's own route | R04 |
| §10.1 column and row BMO | `f = Σ 1_{I_k} E_{k1}`, `N = 4`; `f = e^{2πiz}e` | `⨍|f − f_Q|² = (1 − Σa_k²)E₁₁`, max `¾`, `0.866`; rows `diag(a) − aaᵀ`, norm `≤ 2 max a_k(1−a_k) ≤ ½`, `= ½` at `a = (½,½)`, `0.707`; `1` | column and row differ, `g*g` pinned | none |
| §10.3 periodisation | `n = 2`, `k = 0`, `x = (.05,.05)`, `y = (.95,.95)`; `4^k ≥ 4√n` | `|x−y| = 1.27 ≥ 1`, `m₀(x) = m₀(y)`: mean zero fails; `|p_k(x) − p_k(y)| ≥ 2^{−k}(1 − 2√n/4^k) ≥ 2^{−k}/2` | threshold on `k` is in the statement (the source omits it) | none |
| §10.4 interpolation with `S₂` | operator form with `Ψ(z) = C_∞^{z−1}C₂^{−z}T(U|A|^{pz/2})`; `T = id`; `n = 0` | `Ψ(2/p) = C_∞^{2/p−1}C₂^{−2/p}TA`, `‖Ψ(it)‖_{BMO} ≤ 1`, `‖Ψ(1+it)‖₂ ≤ 1`; `C_n p ≥ 1`; `e^{−R/2} ≤ 4Ce^{−R}` fails | holds for `n ≥ 1`; zero constants handled by `ε` | none |
| §11.1 `hmsNorm` | `sign(x−y)`; `φ(ξ) = ξ/√(1+ξ²)`; `M = 1`; range of `k` | `2`; `2 + 2·(1/√2)(3/2)^{−3/2} = 2 + 4/(3√3) ≈ 2.770`; `2`; `Finset.range (n/2 + 2)` is `0, …, ⌊n/2⌋ + 1` | matches the source up to constants depending on `n` | none |
| §11.5 `schurNorm_le_hmsNorm` | `M = 1`; `p ↦ p'`; quantifier order; measurability of `M` | `1 ≤ C·4·2`, so `C ≥ 1/8`; `p²/(p−1) = pp'` symmetric; `C` chosen before `M` and `p`; `M` is continuous off the null diagonal, hence a.e. measurable and bounded by `|||M|||/2` | holds; example in dimension two recomputed at `R = 10`: `5.70` | none |

**Sources: the seeded sample.** All fifteen sampled targets were checked against the texts.

- §1.2: `lafforgue-delasalle-2011` line 400 is the estimate (9) in the proof of Lemma 1.11;
  `caspers-delasalle-2015` lines 638–642 give the bilinear duality `Tr(AB)`. The formula at
  `p = 1` and for `X ∉ S_p` is the README's own, and it says so.
- §2.1: `lafforgue-delasalle-2011` lines 226–232 (identification of `S₂` with `L²(X × X)`).
- §2.4: lines 346–349 (proof of Lemma 1.9) and 366–381 (proof of Lemma 1.10).
- §2.5: lines 356–359 (situation (6)) and 422–424 (reduction by an `𝒜`-measurable density).
- §3.1: lines 226–238; `cgpt-2023` lines 220–226.
- §3.6: Lemma 1.5 at line 254, Remark 1.6 at line 262.
- §5.2: Lemma 1.11 at line 383, Remark 1.12 at line 393.
- §5.3: Lemma 1.13 at line 415, proof 419–439, Question 1.14 at line 442.
- §6.4: Theorem 1.7 at line 274, proof 286–337 (the cb equality is (5) at line 289);
  `cgpt-2023` lines 89–94.
- §7.1: atoms at lines 487–488. §7.2, §7.3 (read with it): Lemma 1.17 at 489, Theorem 1.18 at 505.
- §8.1: lines 555–559; the source uses a finite set `F` (distinct points) in Theorem 1.19, line 528.
- §9.4: `caspers-delasalle-2015` Lemma 4.1 at line 449 (for `1 < p < ∞`, `p/q` rational, as the
  README says), Theorem 4.2 at line 485.
- §10.1: `cgpt-2023` lines 246–263, line 683; `mei-2007` lines 96–110, 101–103.
- §10.3: `cgpt-2023` lines 348–378, Lemma 1.3 at 379, proof 380–454; lines 375–378 and 506.
- §10.4: Theorem 1.1 at line 313, (1.1) at 495, proof 485–539, Lemma 1.2 at 326, Lemma 1.4 at
  471–484; `mei-2007` Lemma 6.1 at line 3218.

Also read at their locators: Remarks 1.2–1.4 (lines 239–252), Lemma 1.9 (342), Lemma 1.10 (363),
Conjecture 1.8 (281–285), Notation 2.1 (597); `cgpt-2023` (FS) 71–72, (HMS) 79, Theorem A 149–154,
properties i), ii) 231–237, (2.1)–(2.18) at the lines the README gives, Remark 2.1 at 1042,
Theorem A′ at 1070; `caspers-delasalle-2015` Theorem 3.1 (282), 5.1 (529), 5.2 (543), Corollary
5.3 (626); `pisier-grothendieck-2012` (3.9) 656, 767–772, Proposition 3.3 (781), line 800, Remark
13.4 (2086), Lemma 23.1 (3439), Remark 23.4 (3541); `neuwirth-ricard-2011` Theorem 2.7 (516);
`potapov-sukochev-2011` Theorems 1 (76) and 7 (339). No locator slip found. All 16 cited works are
in `packages/SchattenClassesAndSchurMultipliers/sources.toml`; I added no entry.

**Library declarations opened at the pins** (file and line):

- Tau Ceti: `TauCeti.OperatorIdealFamily.schatten` (`Analysis/OperatorIdeal/Family/Schatten.lean`,
  real `p` with `1 ≤ p`), `gauge_schatten` :64 (`(∑' aₙ^p)^{1/p}` in `ℝ≥0∞`, for every bounded
  map), `lowerSemicontinuous_gauge_schatten` :81, `gauge_schatten_le_of_le` :93,
  `finiteSubmodule_schatten_le_of_le` :101, `schatten_isComplete` :109; `schatten_one`
  (`…/Family/TraceClass.lean` :90), `schatten_two` (`…/Family/HilbertSchmidt.lean` :112);
  `ContinuousLinearMap.singularValue` (`…/ApproximationNumber/Basic.lean` :77);
  `TauCeti.UnitarilyInvariantSeminorm.schatten`
  (`Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/Schatten.lean` :68, `p : ℝ≥0∞` with
  `Fact (1 ≤ p)`, operator norm at `∞`); `Matrix.frobeniusInnerProductSpace`
  (`Analysis/Matrix/Frobenius.lean` :57, scoped at :73); `MeasureTheory.Lp.fourierMultiplierCLM`
  (`Analysis/Fourier/L2Multiplier.lean` :88) with `norm_…_le` :126, `…_compL_…` :159, `adjoint_…`
  :177, `tendsto_…_apply` :299;
  `TauCeti.exists_eLpNorm_fourierMultiplierCLM_le_of_norm_iteratedFDeriv_le`
  (`Analysis/Fourier/MihlinHormander.lean` :300); `ContDiffBump.littlewoodPaleyPiece`
  (`…/SchwartzSpace/LittlewoodPaley.lean` :87, needs `ContDiffOn ℝ ∞`) and its bound :196;
  `MeasureTheory.Measure.IsAtom` (`MeasureTheory/Measure/Atom.lean` :59: measurable, positive
  measure, every measurable subset null or of full measure; it does not require finite measure);
  `exists_subset_measure_eq_of_nullSingleton` (`…/AtomlessStandardBorel/Transport.lean` :115).
- Mathlib: `lpMeas` (`…/ConditionalExpectation/AEMeasurable.lean` :88), `condExpL2`
  (`CondexpL2.lean` :68), `condExp` (`Basic.lean` :101), `condExp_of_not_integrable` :171,
  `ContinuousLinearMap.comp_condExp_comm` :357, `MemLp.condExpL2_ae_eq_condExp'` :388 (needs
  `SigmaFinite (μ.trim hm)`), `condExp_indicator` (`Indicator.lean` :73),
  `exists_pos_lintegral_lt_of_sigmaFinite` (`Integral/Lebesgue/Countable.lean` :227),
  `lintegral_trim`, `Integrable.tendsto_ae_condExp` (`Probability/Martingale/Convergence.lean`
  :427, real-valued `g`, `IsFiniteMeasure`, `Filtration ℕ`), `IsCompactOperator` and
  `compactOperator` (`Analysis/Normed/Operator/Compact/Basic.lean` :69, :256), `Matrix.hadamard`
  (`LinearAlgebra/Matrix/Hadamard.lean` :43), `Matrix.PosSemidef.kronecker` and `.hadamard`
  (`Analysis/Matrix/Order.lean` :188, :214), `CompletelyPositiveMap`, `CStarMatrix`, the
  three-lines lemma (`Analysis/Complex/Hadamard.lean` :592), `Lp.fourierTransformₗᵢ`
  (`Analysis/Fourier/LpSpace.lean` :51), `Measure.support` (`MeasureTheory/Measure/Support.lean`
  :59), `InnerRegularCompactLTTop` (`Regular.lean` :336), `MeasurableSet.exists_isCompact_lt_add`
  :821, `IsCompact.exists_isOpen_lt_add` :930 (needs `IsLocallyFiniteMeasure`, `R1Space`,
  `BorelSpace`), `exists_continuousMap_one_of_isCompact_subset_isOpen`
  (`Topology/UrysohnsLemma.lean` :529), `exists_continuous_zero_one_of_isClosed` :322,
  `MemLp.exists_hasCompactSupport_eLpNorm_sub_le` (`ContinuousMapDense.lean` :142, under
  `NormalSpace`, `R1Space`, `WeaklyLocallyCompactSpace`, `μ.Regular`, as the README says),
  `NormalSpace.of_compactSpace_r1Space` (`Topology/Separation/Regular.lean` :606),
  `Prod.opensMeasurableSpace` (`BorelSpace/Basic.lean` :406, needs
  `SecondCountableTopologyEither`), the Stone–Weierstrass theorem (`StoneWeierstrass.lean` :399),
  `geometric_hahn_banach_point_closed` (`Separation.lean` :352),
  `ContDiffBump.ae_convolution_tendsto_right_of_locallyIntegrable` (`Convolution.lean` :103),
  `NullSingletonClass` with the deprecated alias `NoAtoms`
  (`Typeclasses/NullSingletonClass.lean` :31, :34–35), `gaussianReal_zero_var` and
  `nullSingletonClass_gaussianReal` (`Gaussian/Real.lean` :227, :233), `Matrix.toEuclideanCLM`
  (`CStarAlgebra/Matrix.lean` :101), `Matrix.toEuclideanLin` (`PiL2.lean` :1219),
  `Matrix.kroneckerMap`, `Matrix.transpose`, `PiLp.innerProductSpace`, `integral_prod`
  (`Integral/Prod.lean` :443), `Measure.withDensity`, `ENNReal.HolderConjugate`, `UnitAddTorus`,
  `LinearMap.IsSymmetric.eigenvectorBasis`. Every name the README or the Lean file cites exists at
  the pin, in the file the README names.

**Duplication audit.** By object, at the pins: no Schatten compact endpoint (Tau Ceti's `p = ∞`
family is OI-B80, gauge `‖T‖` on all bounded maps), no kernel theorem, no Schur multiplier beyond
`Matrix.hadamard`, no completely bounded map on Schatten classes, no operator-valued BMO, no
atomless class (only `IsAtom`, consumed). The near-match list for the Lean declarations gives no
pinned statement equal to a target. Across main and the open roadmap pull requests
(`roadmaps grep`, README text): "Schur multiplier" occurs only in the group-homology sense; no hit
for Herz–Schur, Grothendieck–Haagerup, Hörmander–Mikhlin–Schur, matrix or operator-valued BMO,
completely bounded maps on Schatten classes or `Lᵖ`, double operator integrals, triangular
truncation; Hilbert–Schmidt kernels only in AutomorphicSpectralTheory §0.8 (cited); no declaration
name of `Suggested.lean` occurs in another roadmap. The overlap list has no second copy, no
dropped id, no conflicting pull request. NoncommutativeIntegration places "the classification of
Schur multipliers" outside its scope (its README, line 74).

Overlap check: read NoncommutativeIntegration, OperatorTheory/OperatorIdeals and BochnerSpaces (scope and the cited sections), and searched NoncommutativeGeometry, BanachSpaceTheory, VonNeumannAlgebras, AmenableTracesOnCStarAlgebras and QuantumFoundations by object; shared objects and owners: the Schatten scale for `1 ≤ p < ∞` and the `B(H)` family at `p = ∞` — OperatorIdeals (cited), the compact endpoint — this roadmap; `Lᵖ(B(H), Tr) = S_p`, duality, interpolation — NoncommutativeIntegration (cited); martingale BMO — NoncommutativeIntegration (finite-tracial on main, the semifinite form a declared gap); the `L^∞` conditional expectation and divisibility of atomless measures — BochnerSpaces §7.4, §7.5 (cited), the further properties of §2.5 — this roadmap; nothing has two owners.

**Supplier-order audit.** Output of the dependency check:

    depcheck: 246 roadmaps, 2245 edges, 0 problem(s)

No UPWARD or CYCLE line. Each citation was resolved now: NoncommutativeIntegration §1.3, §1.4,
§1.5, §2.1, §2.3 (regularisation, operator estimate), §2.5, §2.6, §4.3, §4.4, §7.3, §8.4 on main;
VonNeumannAlgebras V4.Core (trace, cyclicity, `S₂(H, K) ≅ K ⊗̄ conj(H)`, `B(H) = S₁*`),
V2.RectangularL2, §13.2 (V13b: the Hilbert-space ultraproduct with quotient inner product,
completeness and coordinate norm) on main; CStarAlgebras C1.6, C3.2 on main; BanachSpaceTheory
B4.0 on main (the reflexive finite-measure density with `m = μ.withDensityᵥ h` and the variation
formula is in that section, under its approximation-property heading); OperatorIdeals OI-A12,
A23, A25–A30, A38–A40, B29–B41, B76–B88 (B80 is the `B(H)` family, as the README says), C01–C14
on main; UnboundedOperators §5.1 (UO-E01) on main; AutomorphicSpectralTheory §0.8, §0.9, §0.10 at
the head of its open pull request (a new roadmap folder, earlier in the merge order);
BochnerSpaces §7.4, §7.5 at the head of its open pull request (another author's new roadmap
folder): §7.4 has the `L¹` projection with positivity, idempotence, tower law and the `L^∞`
adjoint under a σ-finite trim, §7.5 the divisibility of atomless finite measures. No roadmap of
the never-cite list is cited. One observation that needs no change here: NoncommutativeIntegration
§2.1 prints the norming element as `u*|x|^{p−1}`; the README consumes it as `|X|^{p−1}u*`, says so
with the witness `X = E₁₂` (`u*|X| = 0`), and §1.2 constructs the elements itself, so nothing in
this package depends on the supplier's order.

**Declared gaps.** `sigma-finite-hilbert-schmidt-kernels` (AutomorphicSpectralTheory §0.8) and
`semifinite-martingale-bmo-interpolation` (NoncommutativeIntegration, Part II): each has the same
slug in `design/plan.json` and in the README, a named supplier, a contract in the required form
under the supplier's subsection (README lines 431–451 and 465–473), exact hypotheses, and asks for
nothing already provided (§0.8 is stated for standard Borel spaces with separable `L²`; §8.4 is
finite-tracial). They are not findings; an acceptance after the repairs is conditional on both.

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
build, eleven layers each ending with Examples and Dependencies, Downstream consumers, References.
Every definition has an API list and at least three Checks (§1.1: 5, §1.4: 6, §2.1: 4, §2.3: 3,
§2.5: 6, §3.1: 4, §3.5: 3, §6.2: 3, §7.1: 4, §9.1: 3, §9.2: 3, §9.3: 3, §10.1: 3, §10.2: 4,
§10.3: 3, §11.1: 5, §11.3: 3); every theorem has its hypotheses and a locator. The layer order
stated at lines 528–532 agrees with the `*Needs:*` lines except as in R01–R03. No LaTeX
delimiters, no process words, pull-request numbers, dates, anchors or machine paths in the README
or the Lean file; no numbering tables.

**Copyright.** Wording: 18 passages set beside their sources (the fifteen sampled statements and
the routes of §5.1, §7.2, §7.3 against the proofs of Lemmas 1.10, 1.17 and Theorem 1.18); the
longest shared run is under ten words and is a formula or a standard name. Arrangement: the
most-cited source is `lafforgue-delasalle-2011`, whose §1 has five subsections (cb maps; Schur
multipliers on `S_p(L²)`; change of measure; change of σ-algebra; continuous symbols). The README
has no one-to-one run: its §1.4 ↔ 1.1, Layer 3 ↔ 1.2 without the Grothendieck–Haagerup theorem
(moved to Layer 6, after Layer 5, because §6.4 needs §5.1), §3.7 ↔ 1.3, Layers 5 and 7 split 1.4,
Layer 8 ↔ 1.5, and Layers 2, 4, 6, 9, 10, 11 have no counterpart there; the order of Layers 5, 7
and 8 is forced by "Layer 7 needs Layers 2, 3 and 5" and "Layer 8 needs Layers 1, 3 and 5". Reuse:
no table, figure, list of examples or numerical data is taken over; the worked values are the
README's own.

Source independence: 18 passages compared with 5 sources, none shared; largest share lafforgue-delasalle-2011, 43 of 124 locators; contents compared with lafforgue-delasalle-2011: independent.

## Not verifiable

- `pisier-similarity-2001`, `grafakos-classical-2014`, `simon-trace-ideals-2005`,
  `gohberg-krein-1969`, `reed-simon-1-1980`, `paulsen-2002`, `horn-johnson-topics-1991`,
  `musat-2003`, `jrwz-2020`: recorded as uncertified (paywalled) in the manifest; their locators
  (chapters, one theorem number each for Grafakos and Musat) were not checked against the texts.
  Each stands beside a locator into a text that was read, except the chapter-level citations of
  the Schur product theorem in §6.1, which is also Mathlib's `Matrix.PosSemidef.hadamard`.
- The published versions of the arXiv texts (Duke Math. J., Ann. of Math., Trans. Amer. Math. Soc.,
  Bull. Amer. Math. Soc., Mem. Amer. Math. Soc.): not compared; every locator is into the arXiv
  version the manifest records, and the References name those versions.
- The identity of the volume of `EuclideanSpace ℝ (Fin 0)` with the unit point mass, used in R04,
  was computed by hand from the definition (Haar measure normalised on the parallelepiped of an
  orthonormal basis) and not elaborated.

## Source issues

- **Misprint** in lafforgue-delasalle-2011 at Remark 1.4, printed page 6 (line 249): the source says the class at the larger exponent is the interpolation space between the classes at the smaller exponent and its conjugate; it should be the reverse, the smaller-exponent class interpolating between the larger one and its conjugate; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at the proof of Lemma 1.9, printed page 8 (line 348): the source says conjugation by the density isometry embeds the Schatten class for the smaller measure into itself; it should be into the class for the dominating measure; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at §1.4, printed page 9 (line 359): the source says the product conditional expectation maps onto the bounded functions of the larger product σ-algebra; it should be of the smaller one; affects nothing.
- **Error** in lafforgue-delasalle-2011 at Remark 1.6, printed page 7 (line 262): the source says the stabilised symbol has the same completely bounded norm for any σ-finite second factor; it should exclude the zero measure, where every norm is zero; affects nothing.
- **Error** in cgpt-2023 at §1.2 before Lemma 1.3, printed page 8 (lines 375–378): the source says the periodised operator has mean zero for every index; it should be only once the grid cubes have diameter at most the strip width, in dimension two or more; affects the proof.
- **Misprint** in cgpt-2023 at §1.2 before Lemma 1.3, printed page 8 (line 378): the source says the nonvanishing frequencies lie in the nonzero integers; it should be the nonzero integer vectors of the dimension; affects nothing.
- **Gap** in cgpt-2023 at the proof of Theorem 1.1, printed page 10 (line 506): the source says the Schatten norm equals the limit of the norms after removing the diagonal strip; it should claim only the lower-semicontinuity inequality, which suffices; affects the proof.

## For the human reviewers

- **Licence.** Every locator is a line of an arXiv version; `sources.toml` records for `lafforgue-delasalle-2011` that the Duke version's numbering was not compared. The README's References name both the journal and the arXiv version.
- **Licence.** Nine of the sixteen sources are uncertified (paywalled books and two articles), cited by chapter or theorem number only; no end theorem rests on one of them alone.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d049fa3a51ab5229b6969d9e66f47c9b1c50658e", "job": "REV-PKG-SchattenClassesAndSchurMultipliers", "model": "fable", "worker": "chris-x30"} -->
