<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17292#issuecomment-6902404983 -->
Red team round 1 pass a (claude) of 35f3419

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §4.3 uses the Hilbert–Schmidt energy of an `L²`-kernel operator without its owner

   Location: `packages/SchrodingerOperatorsAndSpectralTypes/README.md:1682-1685`, "the integral
   operator with kernel `V_R(x) (𝓕⁻¹f_R)(x − y)`, whose Hilbert–Schmidt energy in any Hilbert basis is
   `‖V_R‖₂² ‖f_R‖₂² < ∞` (Parseval in the second variable and Plancherel)"; *Needs:* at
   `README.md:1697-1702`.

   Claim: every input of the route is a target here, a named supplier section or a pinned declaration.

   Witness: the step "an operator on `L²(ℝ^d)` given by a square-integrable kernel has Hilbert–Schmidt
   energy equal to the squared `L²` norm of the kernel" is in no *Needs:* entry. OperatorIdeals
   (cited: OI-C14, OI-B29–OI-B36) has no kernel statement: its README contains neither "kernel" nor
   "integral operator"; OI-C12 is the discrete column identity. The pinned Tau Ceti files under
   `TauCeti/Analysis/InnerProductSpace/HilbertSchmidt/` have no kernel operator either. The owner is
   AutomorphicSpectralTheory §0.8 (`hilbert_schmidt_kernel`, README line 239–241 at its open head: on
   σ-finite standard Borel measure spaces a square-integrable kernel gives a Hilbert–Schmidt operator
   with exactly its kernel `L²` norm). AutomorphicSpectralTheory is line 101 of
   `merge-order/ORDER.txt`, this roadmap line 221, so the citation is downward.

   Repair (README only):

   - In the route of 4.3 replace "whose Hilbert–Schmidt energy in any Hilbert basis is
     `‖V_R‖₂² ‖f_R‖₂² < ∞` (Parseval in the second variable and Plancherel)" by "whose Hilbert–Schmidt
     energy in any Hilbert basis is the squared `L²(ℝ^d × ℝ^d)` norm of the kernel
     (AutomorphicSpectralTheory §0.8, `hilbert_schmidt_kernel`), that is
     `‖V_R‖₂² ‖𝓕⁻¹f_R‖₂² = ‖V_R‖₂² ‖f_R‖₂² < ∞` by Fubini and Plancherel
     (`MeasureTheory.Lp.fourierTransformₗᵢ`)".
   - Add "AutomorphicSpectralTheory §0.8 (Hilbert–Schmidt operators from square-integrable kernels)"
     to the *Needs:* line of 4.3, to the Dependencies paragraph of Layer 4, and a subsection
     "From TauCetiRoadmap.AutomorphicSpectralTheory" under `## Exact supplier contracts`: "§0.8: on
     σ-finite standard Borel measure spaces, a square-integrable kernel gives a Hilbert–Schmidt
     operator whose energy is the squared `L²` norm of the kernel; used in 4.3 on `ℝ^d` with Lebesgue
     measure."

   Test on the witness: `V_R = 1_{B_R}`, `f_R = (4π²‖ξ‖² + 1)⁻¹ 1_{‖ξ‖ ≤ R}` are in `L²(ℝ^d)`, Lebesgue
   measure on `ℝ^d` is σ-finite standard Borel, the kernel norm is `‖V_R‖₂ ‖f_R‖₂ < ∞`, and §0.8
   applies. Run the dependency check after the edit (no UPWARD line is expected: line 101 < line 221).

2. **F02** (P2) the transport law of `IsSpectralMeasureOf` is stated for every partial operator

   Location: `README.md:501-513`: "For a partial operator `A` on `ℋ` … define the predicate
   `IsSpectralMeasureOf`" and the second law "If `IsSpectralMeasureOf A P` and `U : ℋ → ℋ'` is
   unitary, then `B ↦ U P(B) U⁻¹` is the spectral measure of `U A U⁻¹` (the transport law below)".

   Claim: a law of the predicate for every partial operator `A`.

   Witness: the predicate reads `LinearPMap.resolvent A z` at every nonreal `z`, and off the resolvent
   set that value is unspecified (`TauCeti/Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean`
   lines 163–170: a `Classical.choose`, "an unspecified junk value"). For a non-self-adjoint `A` with
   a nonreal spectral point `z₀` (for instance `A = i` on `ℂ`, `z₀ = i`), `resolvent A z₀` and
   `resolvent (U A U⁻¹) z₀` are two unrelated choices, so the law cannot be proved. The "transport
   law below" (`README.md:540-541`) and its proof (`README.md:551-552`, through SA-E05 and SA-E44)
   are for self-adjoint `A` only.

   Repair: at `README.md:512` write "If `A` is self-adjoint, `IsSpectralMeasureOf A P` and
   `U : ℋ → ℋ'` is unitary, then `B ↦ U P(B) U⁻¹` is the spectral measure of `U A U⁻¹` (the transport
   law below; for self-adjoint `A` every nonreal `z` is a resolvent point, so no unspecified value of
   `LinearPMap.resolvent` enters)." Add to the Checks of 1.1: "The predicate is used for self-adjoint
   `A` only: for `A = i` on `ℂ` the point `z = i` is not a resolvent point, `LinearPMap.resolvent A i`
   is unspecified, and no law of the predicate is asserted."

   Test on the witness: with `A` self-adjoint, `z₀ = i ∈ ρ(A) ∩ ρ(U A U⁻¹)` and
   `R_{UAU⁻¹}(z) = U R_A(z) U⁻¹`; for `A = 2` on `ℂ`, `U = 1`: `(i − 2)⁻¹` on both sides.

3. **F03** (P2) a statable headline is absent: bounded potentials on a complete manifold (§3.9)

   Location: `Suggested.lean:40-47` ("Every headline theorem of the roadmap that is statable at the
   pins is stated below: …") and `Suggested.lean:49-57` (the three clauses named as not statable).

   Claim: every statable headline is stated, and every other one is named.

   Witness: the README Summary (`README.md:18-20`) and the ownership paragraph (`README.md:33-36`)
   list "bounded potentials" among what Layer 3 proves on complete manifolds; §3.9
   (`README.md:1427-1429`) states that for `X` complete and real `V ∈ L^∞(X)`, `Δ₀ + V` is essentially
   self-adjoint on `C_c^∞(X; ℂ)` and its closure is `≥ ess inf V`. Every carrier of that statement is
   already in the file (`gaffney_isSelfAdjoint_closure` for the operator on test functions,
   `schrodinger_isSelfAdjoint_closure` for `MemLp V ⊤` and `essInf`), it is neither stated nor named
   in the module docstring, and it is the manifold form of the roadmap's title object. It is not
   padding: it needs 3.6, the bounded perturbation theorem and the identification of the closure.

   Repair: add after `exists_mem_domain_closure_eq_zero_iff` (and add "the Schrödinger operators
   `Δ_X + V` with bounded real potentials on a complete manifold (§3.9)" to the docstring list, and
   the sentence "The first assertion is `laplacian_add_potential_isSelfAdjoint_closure` in
   `Suggested.lean`" to §3.9):

   ```lean
   /-- Bounded potentials on a complete Riemannian manifold (README §3.9). For a bounded measurable
   real `V`, the operator `Δ + V` on compactly supported smooth complex functions, `Δ = −div grad`,
   is essentially self-adjoint in `L²(M, vol_g)`, and its closure is bounded below by `ess inf V`
   (Teschl, Theorem 6.4, with relative bound `0`, applied to the Laplacian of README §3.6). -/
   theorem laplacian_add_potential_isSelfAdjoint_closure {E : Type*} [NormedAddCommGroup E]
       [NormedSpace ℝ E] [FiniteDimensional ℝ E] {HM : Type*} [TopologicalSpace HM]
       {I : ModelWithCorners ℝ E HM} [I.Boundaryless] {M : Type*} [EMetricSpace M]
       [ChartedSpace HM M] [IsManifold I ∞ M] [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
       [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
       [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)] [IsRiemannianManifold I M]
       [CompleteSpace M] [SecondCountableTopology M] [MeasurableSpace M] [BorelSpace M]
       (V : M → ℝ) (hV : MemLp V ⊤ (TauCeti.riemannianVolume I M))
       (T : Lp ℂ 2 (TauCeti.riemannianVolume I M) →ₗ.[ℂ] Lp ℂ 2 (TauCeti.riemannianVolume I M))
       (hdom : ∀ u, u ∈ T.domain ↔ ∃ f : M → ℂ, ContMDiff I 𝓘(ℝ, ℂ) ∞ f ∧ HasCompactSupport f ∧
         (u : M → ℂ) =ᵐ[TauCeti.riemannianVolume I M] f)
       (hact : ∀ (u : T.domain) (f : M → ℂ), ContMDiff I 𝓘(ℝ, ℂ) ∞ f → HasCompactSupport f →
         ((u : Lp ℂ 2 (TauCeti.riemannianVolume I M)) : M → ℂ) =ᵐ[TauCeti.riemannianVolume I M] f →
         (T u : M → ℂ) =ᵐ[TauCeti.riemannianVolume I M]
           fun x => complexLaplacian I f x + (V x : ℂ) * f x) :
       IsSelfAdjoint T.closure ∧
         ∀ x : T.closure.domain,
           essInf V (TauCeti.riemannianVolume I M) *
               ‖(x : Lp ℂ 2 (TauCeti.riemannianVolume I M))‖ ^ 2 ≤
             (⟪(x : Lp ℂ 2 (TauCeti.riemannianVolume I M)), T.closure x⟫_ℂ).re := by
     sorry
   ```

   The binders are those of `gaffney_isSelfAdjoint_closure` and the two potential clauses those of
   `schrodinger_isSelfAdjoint_closure`; this pass ran no Lean, so the repair worker elaborates it
   (`#check @…`) before submitting. Test on instances: circle of length `2π`, `V = 1`: eigenvalues
   `n² + 1 ≥ 1 = ess inf V` (the README's own Check of 3.9); `V = 0`: the statement is the first
   clause of `gaffney_isSelfAdjoint_closure` with `0 ≤ ⟪u, Δu⟫`; `M = ∅`: `L² = 0`, both sides `0`.

4. **F04** (P3) §3.7: the hypothesis `0 ∉ closure(σ(Δ_X) ∖ {0})` is not needed

   Location: `README.md:1331-1332`: "if `X` is connected with `vol_g(X) < ∞` and
   `0 ∉ closure(σ(Δ_X) ∖ {0})`, then `λ₁⁺(X) = λ₁(X)`".

   Witness: let `X` be connected of finite volume with `0 ∈ closure(σ(Δ_X) ∖ {0})`, for instance a
   surface with an end `(1, ∞) × S¹`, metric `dr² + r⁻⁴ dθ²` (area `2π ∫ r⁻² dr < ∞`, bottom of the
   essential spectrum `lim (f′/2f)² = lim r⁻² = 0`). Then `λ₁⁺(X) = 0`, `0 ∈ σ_ess(Δ_X)`, and by 1.6
   `0 ≤ μ₂(Δ_X) ≤ inf σ_ess = 0`, so `λ₁(X) = 0 = λ₁⁺(X)`: the conclusion holds without the clause.

   Repair: "if `X` is connected with `vol_g(X) < ∞`, then `λ₁⁺(X) = λ₁(X)` (if `0` is isolated in
   the spectrum it is a simple eigenvalue outside `σ_ess`, and `μ₂` is the next spectral value;
   otherwise `0 ∈ σ_ess(Δ_X)` and both sides are `0`)". The Check on `⊔ S¹_j` (`README.md:1354-1355`)
   then reads "the last item needs `X` connected of finite volume", as it does now.

5. **F05** (P3) §1.8 *Needs:* names "Mathlib Plancherel", not a declaration

   Location: `README.md:904`: "`ContinuousLinearMap.hilbertSchmidtEnergy_indep`; Mathlib Plancherel."

   Witness: the pinned statement is `MeasureTheory.Lp.norm_fourier_eq`
   (`Mathlib/Analysis/Fourier/LpSpace.lean:90`, `‖𝓕 f‖ = ‖f‖` on `L²`), for the kernel
   `e^{−2πi⟨x,ξ⟩}` of the Conventions; the route's kernel is `e^{−itλ}`.

   Repair: "Mathlib `MeasureTheory.Lp.norm_fourier_eq` and `MeasureTheory.Lp.fourierTransformₗᵢ`
   (`Mathlib/Analysis/Fourier/LpSpace.lean`; Plancherel for the kernel `e^{−2πi⟨x,ξ⟩}`, the factor `2π`
   of the estimate coming from `t = 2πτ`)". Test: the README's equality Check (`README.md:920-922`)
   gives `∫ |⟨φ, e^{−itλ}x⟩|² dt = 2π ∫ |φ x|²`, which is `2π ‖𝓕(conj φ · x)‖²` after `t = 2πτ`.

6. **F06** (P3) supplier-contract rows that nothing uses

   Location: `README.md:297-298` ("`TauCeti.HyperbolicMetric` … used in Checks"), `README.md:299-300`
   ("`TauCeti.Wkp` and `TauCeti.W1p`"), `README.md:260` ("`UpperHalfPlane`").

   Witness: `HyperbolicMetric`, `W1p` and `UpperHalfPlane` each occur once in the README, in these
   rows. No Check names `TauCeti.HyperbolicMetric`; 4.1 uses `TauCeti.Wkp` only; 3.10 and
   `Suggested.lean` use `TauCeti.UpperHalfSpace ℝ`, not Mathlib's `UpperHalfPlane`.

   Repair: delete "`TauCeti.HyperbolicMetric` in `.../Riemannian/Hyperbolic.lean` (smooth, complete,
   constant curvature `−1`), used in Checks"; write "`TauCeti.Wkp` in `TauCeti/Analysis/Sobolev/`
   (real-valued weak-derivative spaces on an additive Haar measure)"; delete "`UpperHalfPlane`," from
   the Mathlib row.

Three P2 findings (one uncited owner of a proof-plan input, one law stated without the hypothesis
that makes it provable, one statable headline absent from `Suggested.lean`) and three P3 findings.
No statement of `Suggested.lean` was found false. No Lean was run in this pass: the 18 elaborated
types of the worker's signature file were compared with the README by reading.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `IsSpectralMeasureOf` | `A = 2` on `ℂ`, `P = δ₂`, `δ₃`; `ℋ = 0`; non-self-adjoint `A = i` | `(i−2)⁻¹ = (−2−i)/5` both sides; `(i−3)⁻¹ = (−3−i)/10 ≠`; `0 = 0`; `resolvent A i` unspecified | definition sound for self-adjoint `A` | R02 |
| `diag_spectralType_components` | `M_x ⊕ ½` on `L²[0,1] ⊕ ℂ`, `f = (1,1)`; `f = 0`; `fsc` on Cantor measure; cross terms | `Leb|[0,1] + δ_{1/2}`, ac part `Leb|[0,1]`, atoms `{1/2}`; `0 = 0`; `|μ_{f,g}(B)|² ≤ μ_f(B∩N) μ_g(B∩N) + … = 0` for a Lebesgue-null carrier `N` | true | none |
| `acSpectrum`, `perfect_acSpectrum_and_mem_iff` | `ℋ = 0`; `diag(q_n)`; `M_x ⊕ 2`; isolated point | `∅`, `Perfect ∅`, right side false for `f = 0`; `∅`; `[0,1]`, `2` excluded since `μ_f{2} = 0` for ac `f`; annuli `J_m` carry mass, support point in `σ_ac` | true | none |
| `Icc_subset_acSpectrum_iff` | `M_x` on `L²([0,1] ∪ [2,3])`, `[a,b] = [0,1]`, `[1,2]`; `a = b` | holds with `f = 1`; `J = (1.2, 1.8)` has no ac mass and `1.5 ∉ σ_ac`; excluded by `a < b` | true | none |
| `essentialSpectrum` | `0` on `ℂ`; `0` on `ℓ²`; `diag(1/n)`; UnboundedOperators' body | `∅`; `{0}`; `{0}`; same set (its extra clause `z ∈ spectrum` is implied by the set difference) | agrees with UO-C02 | none |
| `minMaxValue`, `minMax_principle` | `ℋ = 0`; `A = 0` on `ℂ`; `diag(1,3,5)`; `M_x` on `L²[0,1]`; `−diag(n)` | all `⊤`, count `0 = finrank ⊥`; values `0, ⊤`, at `c = 1` count `1 = 1`, at `c = 0` count `0 = 0`; `1,3,5,⊤`, at `c = 4` count `2 = 2`; all `0`, `Σ = 0`, no `c < 0` counts; unbounded below, excluded by `hγ` | true | none |
| `pearson_tendsto` | `J = 0`, `C = 0`; `J = 1`, `C = V`; `H₁ = 0`, `H₂ = c` on `ℂ` | limit `0`; Kato–Rosenblum; `ℋ_ac = 0`, only `x = 0`, limit `0` | true (Reed–Simon form hypothesis, sign `U(t) = e^{itH}`) | none |
| `katoRosenblum` | `V = 0`; `diag(1/n²)`, `V = −diag(1/n²)`; `H₁ = M_x`, `V = c` (not trace class) | `y = x`; no ac vectors, `∅ = ∅`; `e^{itc}x` diverges, excluded | true | none |
| `katoRellich_lowerBound_hasCore` | scalar `A = λ ≥ γ`, `V = −(a + b|λ|)`; `γ = −10`; `a = b = 0`; `‖A(A−μ)⁻¹‖` | `λ − a − b|λ| ≥ γ − a − b|γ|` (increasing in `λ` for `b < 1`); `−10 − a − 10b` = bound when `a + 10b ≥ a/(1−b)`; bound `γ`; `sup_{λ≥γ} |λ|/(λ−μ) = max(1, |γ|/d)` | true | none |
| `complexLaplacian` | `‖x‖²` on `ℝ^d`; `yˢ` on `ℍ`; `e^{inθ}` | `−2d`; `s(1−s)yˢ`; `n² e^{inθ}` | sign as stated | none |
| `gaffney_isSelfAdjoint_closure` | `(0,1)` (incomplete, excluded); `M = ∅`; dimension `0`; `ℝ⁴ ∖ 0` | deficiency `(2,2)`; `L² = 0`; `Δ = 0` on `ℓ²`; not complete, not covered | true; second clause is the adjoint domain | none |
| `exists_mem_domain_closure_eq_zero_iff` | `ℝ`; `S¹`; `S¹ ⊔ ℝ`; `⊔_ℕ S¹` | only `0`; constants; `c·1_{S¹}`; `ℓ²` of indicators; converse: `∫_{X_j} Δφ = 0` | true | none |
| `cuspRegion`, `IsStandardCuspEnd` | `⟨z ↦ z+1⟩\ℍ`, `w = 1`, `w = 2`; compact `X`; `dim M ≠ 2` | accepted; rejected (`(0,y) ~ (1,y)`, `1 ∉ 2ℤ`); no chart exists (injectivity radius `≤ w/2y → 0`); differential not invertible | definition determines the end up to the stated rescaling | none |
| `Ici_quarter_subset_essentialSpectrum` | `u_n = y^{1/2+it} ψ((log y − n)/n)` | `‖u_n‖² = w n ‖ψ‖²`; `Δ(y^{1/2} f) = y^{1/2}(f/4 − f″)`; residual ratio `≤ (2|t|‖ψ′‖/n + ‖ψ″‖/n²)/‖ψ‖`; supports `[2^{j+1}, 3·2^j]` disjoint | true | none |
| `schrodinger_isSelfAdjoint_closure` | `V = c`; `V = 1` at the last clause; `d = 1`, `V = −1_{[−1,1]}`; `d = 0` | `σ = [c, ∞)`; `σ_ess = [1,∞)`, hypothesis fails; `k tan k = κ`: `0.739·tan 0.739 = 0.674`, `E = −0.454 ∈ [−1,0)`; excluded by `0 < d` | true | none |
| §1.8 Rosenblum estimate | `x = m 1_{[0,1]}`, rank-one `C`; truncation of `|λ|^{−1/4}` | `2π m²` both sides; `‖x − x_m‖² = 4/m²` | consistent | R05 (locator) |
| §2.1 Gaussians | `e^{−πx²/n²}` | `‖u‖² = n/√2`, `‖u′‖² = π/(n√2)`, quotient `π/n²` | as stated | none |
| §3.5 cutoffs | `(0,1)`; step thresholds | `1 ≤ (4/k)(1/2)` fails for `k > 2`; slope `4/3 < 2`, gradient `2·(2/k)` | as stated | none |
| §3.6 route (a), (b) | Young with `½` | `‖χdu‖² ≤ 2‖Δu‖‖u‖ + 4 sup|dχ|²‖u‖²`; `∫χ²|u|² ≤ sup|dχ|²‖u‖²` | as stated (the README's constant `2` in (b) is not sharp) | none |
| §3.7 `λ₁⁺ = λ₁` | end `dr² + r⁻⁴dθ²`; `ℝ`; a point | `0 = 0`; `0 = 0`; `+∞ = +∞` | holds without the isolation clause | R04 |
| §3.9 resolvent | one point, `s = 1` | `T = i`, `T − T* = 2i = 2i·TT*`, `i + i⁻¹ = 0` | as stated | none |
| §4.1 norms | `e^{−πx²}` | `‖u″‖² = 3π²/√2`, `‖ξ²𝓕u‖² = 3/(16π²√2)`, ratio `16π⁴` | as stated | none |
| §4.2 density | `d = 1`, `e^{−πx²}` | `e^{−λ/2π}/(2π√λ)`, mass `2^{−1/2}`; equals QuantumFoundations §8.2's formula at `n = 1` | as stated | none |
| §4.3 identity and kernel | `s = 0`, `s = 1`; kernel energy | `i`, `(1+i)/2` both sides; needs the kernel theorem | identity true | R01 |
| §4.5 | `cos x + cos √2 x` | `−2` not attained (`√2 ≠ (2m+1)/(2k+1)`) | as stated | none |
| Kato–Rellich misprint claim | `teschl line 5709–5711` | `b/(a−1) ≤ 0` for `a < 1`, so the printed maximum is `a|γ| + b` | README's correction is right | Source issues |

## Dependency check

    depcheck: 240 roadmaps, 2261 edges, 0 problem(s)

No UPWARD or CYCLE line. This roadmap is line 221 of `merge-order/ORDER.txt`, after
QuantumFoundations (line 220), its last supplier that is not on main.

## Verified sound

- Declarations read: 18 of 18 in `Suggested.lean` (6 definitions with real bodies, 12 theorems
  with `sorry`); each elaborated type in the worker's signature file compared with its README
  statement; no binder lost; `∞` is the smooth index in `ContDiff`/`ContMDiff`/`IsManifold` and
  `ℝ≥0∞`'s top in `MemLp`. Single `import Mathlib`, 11 `TauCeti.*` modules, all used and all
  present at the pin; no `set_option`, no `lemma`, no sorry'd data, no process text.
- Targets read: all 27 sections 1.1–4.5 with their routes, *Needs:* lines, Checks, Examples and
  Dependencies; Summary, Scope, Conventions, supplier contracts, Downstream consumers, Worked
  examples, References.
- Locators verified against the cached texts: 54 (teschl 30, bms02 5, kato57 6, yafaev04 4,
  rosenblum57 2, hm23 3, lp80 3, kps26 1 plus its `d ≥ 2`, `l > d` at line 20–21); printed pages
  of teschl checked against the page markers (offset 12).
- Checks recomputed: 61, among them every numerical value in the Conventions, 1.1, 1.6, 1.8, 2.1,
  2.3, 3.5, 3.9, 3.10, 4.1–4.4.
- Library declarations checked at the pins: 46 Tau Ceti and 24 Mathlib names of the supplier
  contracts, with the quoted hypotheses (`IsRelativelyBounded` lettering, `ProjValMeasure` fields
  `diag_finite`, `inner_proj`, `proj_univ`, the junk value of `LinearPMap.resolvent`,
  `nuclearENorm` as the sum of approximation numbers, `IsUnitary`, `IsLocalRiemannianIsometry`,
  the hyperbolic metric instance on `TauCeti.UpperHalfSpace`, the scoped instance
  `instRiemannianBundleOpen`). No pinned declaration already proves a target; the pinned
  Kato–Rellich file has self-adjointness only.
- Sibling citations checked at main or at the open head: 78 (SelfAdjointSpectralTheory 37 ids;
  UnboundedOperators UO-A01, A02, A03, A06, A07, B03 with its numbering (i)–(iii), C01, C02 with
  the body of its `essentialSpectrum`, C03, D06, E04, E05, E06; QuantumFoundations §8.2;
  CongruenceSpectralGap §0.2, §0.6; AutomorphicSpectralTheory §0.8, §1.16a, §§4.1–4.4; MaassForms
  §0.1; VariationalMethods 3.1, 4.4, 5.1; RiemannianGeometry R5c item 4, R7.8 item 8;
  ComplexKahlerGeometry K5a and K5a.ComponentwiseCompact; DifferentialGeometry Layer 12; PDE A2,
  A3, F26; HilbertModules H6; PseudodifferentialOperators P1.0; SmoothBundlesConnections B2.2;
  OperatorIdeals OI-A35, A40, B29, B30, B35, B36, C14; FuchsianOrbifolds Layer 3;
  GeometricTopology §7.1; ComplexCurveModuli D6 item 2; HopfRinow Layers 0–4).
- Ownership: no roadmap on main or open states Kato–Rosenblum, Pearson's theorem, Glazman's count,
  the abstract wave operators, the Gaffney–Chernoff–Strichartz theorem for general manifolds or the
  cusp threshold (searched by object in the 458 open heads and main); the only uncited owner found
  is R01's. `essentialSpectrum` here and in UnboundedOperators have different fully qualified names
  and the same body.
- Gaps: `weyl-criterion` and `spectral-integral-resolvent` have the same slugs in
  `design/plan.json` and in the README, a named supplier and section, and a single precise `needs`.
- The pull request changes only the package folder.

Source independence: 14 passages compared with 8 sources, none shared (the longest common run is the formula-forced statement of teschl Lemma 12.1, 8 words); largest share teschl, 34 of 89 locators; contents compared with teschl: independent (Layer 1 draws on its §§3.2–3.3, 4.3–4.4 and 12.1 with kato57 and yafaev04, Layer 2 on §6.1, Layer 3 on none of it, Layer 4 on §§6.4, 7.2 and 10.1; no layer maps onto one chapter and the order is not the book's).

## Not verifiable

- `kato76` (uncertified, no text): the README cites "Ch. V §4.1" for the lower bound
  `γ − max(a/(1 − b), a + b|γ|)` (`README.md:1096`, `1100`). From memory the bound is the theorem
  on semibounded operators later in Ch. V §4, not §4.1, and Kato–Rosenblum is in Ch. X §4; neither
  could be opened.
- `rs1`, `rs2`, `rs3`, `pearson78`, `strichartz83`, `chernoff73`, `gaffney54`, `grigoryan09`,
  `chavel84`, `iwaniec02`, `lp76`, `cfks87`: uncertified, cited by locator only.
- `kps26`: the journal data "Ann. of Math. 203 (2026)" in the References is not in the cached
  arXiv text (dated 2 May 2025).
- Whether UnboundedOperators UO-A03's "inverse-symbol" corollaries are meant for every
  projection-valued measure or for `P_A` only; if for every one, `gap:spectral-integral-resolvent`
  asks for less than it seems. The text of UO-A03 does not settle it.
- The Lean statement proposed in R03 was not elaborated (no Lean command is permitted in this
  pass).
- Ownership against public formalisations outside the pinned libraries was not checked.

## Source issues

- **Misprint** in teschl at Theorem 6.4, equation (6.3), printed page 135 (and the last line of its proof): the source says the lower bound of the perturbed operator is `γ` minus the larger of `a|γ| + b` and `b/(a − 1)`, a quantity that is never positive; it should be the larger of `a|γ| + b` and `b/(1 − a)`; affects a stated result.

## For the human reviewers

- **Licence.** `kps26` is cited as "Ann. of Math. 203 (2026)" (`README.md:1848-1850`); the cached
  copy is arXiv 2010.05881v3 and carries no journal reference. The publication data was not
  confirmed.
- **Licence.** `teschl` is read from the author's online edition (`README.md:1831-1832`); printed
  page numbers were inferred from the file's page markers with offset 12.
- **Not tested.** Twelve of the 21 sources are uncertified and were compared neither for wording
  nor for locators (`sources.toml`, status `uncertified`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "35f3419d98b16a0eeba70aa18eb9f01fdec1260a", "job": "RT-SchrodingerOperatorsAndSpectralTypes~1a", "model": "fable", "worker": "chris-x80"} -->
