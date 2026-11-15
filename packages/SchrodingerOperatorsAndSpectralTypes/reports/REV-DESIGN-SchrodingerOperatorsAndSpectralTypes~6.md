<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13815#issuecomment-6895154703 -->
Review (claude) of 3f5f1e1

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) The complexification of R5c's real operator has no owner in the text

   **Location.** Lines 372–375 (contract, under RiemannianGeometry R5c): "Used: the complexification of
   `L_D` … is self-adjoint with the same eigenvalues, the complex multiplicity of each being its real
   multiplicity"; 3.8, lines 1120–1121 and 1133–1137 ("both operators are self-adjoint"); 3.9, lines
   1175–1177 and 1195–1197; Needs of 3.8 (1139–1140) and 3.9 (1198–1202).

   **Claim.** The self-adjointness of `u ↦ L_D(Re u) + i·L_D(Im u)` on `L²(X; ℂ)` and the equality of
   real and complex multiplicities are available to 3.8's route, listed under what R5c supplies.

   **Witness.** Main `TauCetiRoadmap/RiemannianGeometry/README.md`, R5c (from line 3715): real bundles
   only, no complexified operator. Main `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md`
   §4.7 (UO-D06, lines 744–760) states it: `A_ℂ` on `WithLp 2 (TauCeti.Complexification H)`,
   "densely defined, closed and self-adjoint". Neither 3.8 nor 3.9 cites it.

   **Exact repair.** UnboundedOperators is on main and UO-D06 is already a supplier section.

   1. 3.8, new first item of the `dim X ≥ 1` clause: "The map `u ↦ Re u + I·Im u` is a complex-linear
      isometric equivalence of `L²(X; ℂ)` onto `WithLp 2 (TauCeti.Complexification L²(X; ℝ))`
      (`‖u‖² = ‖Re u‖² + ‖Im u‖²`), and carries the operator `u ↦ L_D(Re u) + i·L_D(Im u)` on
      `{u : Re u, Im u ∈ dom L_D}` to UnboundedOperators UO-D06's complexification `A_ℂ` of `A = L_D`,
      which is self-adjoint (UO-D06, real unbounded spectral restriction). For real `μ`,
      `ker(A_ℂ − μ) = ker(A − μ) + I·ker(A − μ)`, so the complex dimension of the eigenspace is the
      real one." The last sentence is owned here (one line: `A_ℂ` commutes with the conjugation, so
      real and imaginary parts of an eigenvector are eigenvectors).
   2. Needs of 3.8 and 3.9: add "UnboundedOperators UO-D06 (complexification of a real self-adjoint
      operator)". Layer 3 Dependencies already list UO-D06.
   3. Contract: delete the sentence "Used: the complexification … real multiplicity" from the R5c
      paragraph, and add to the UO-D06 entry "the complexification `A_ℂ` of a real self-adjoint `A` on
      Tau Ceti's Hilbert complexification, self-adjoint with domain `ι(dom A) + I·ι(dom A)`".
   4. Plan: add `roadmap:OperatorTheory UnboundedOperators UO-D06` to the prerequisites of 3.8 and 3.9.

   Tested on the instance of 3.8's own Check, the circle of length `2π`, `μ = 1`: `ker(L_D − 1) =
   span_ℝ(cos θ, sin θ)`, real dimension 2; `ker(A_ℂ − 1) = span_ℂ(cos θ, sin θ) = span_ℂ(e^{iθ},
   e^{−iθ})`, complex dimension 2; so `λ₁ = λ₂ = 1 = μ₂ = μ₃` as stated. The statements of 3.8 and 3.9
   are correct; only their supply is missing.

2. **F02** (P3) 1.6 does not say how it differs from the two existing Courant–Fischer statements

   **Location.** Scope, lines 32–34 ("the general min–max principle below the essential spectrum") and
   1.6, lines 595–613; the scope bullet "Stated by TauCetiRoadmap.VariationalMethods" of the previous
   head is gone and nothing replaces it for 1.6.

   **Claim.** 1.6 has no neighbour that states part of it.

   **Witness.** Main `TauCetiRoadmap/VariationalMethods/README.md` §4.4 (lines 782–808): for a compact
   form pair, `λₙ = rayleighMinMax ⊤ n`, the dual sup–inf formula over `n`-dimensional obstacle
   subspaces, monotonicity under `q ≤ q′`, the counting function. Pinned Tau Ceti
   `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`
   (`TauCeti/Analysis/InnerProductSpace/CourantFischer.lean:251`), finite-dimensional.

   **Exact repair.** Scope, new bullet: "**Min–max in the compact and finite-dimensional cases.**
   VariationalMethods 4.4 states Courant–Fischer, the obstacle formula, form monotonicity and the
   counting function for compact form pairs (eigenvalues indexed from `0`, junk value `0` past the
   dimension), and Tau Ceti's `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner` the
   finite-dimensional case with decreasingly sorted eigenvalues. 1.6 is the statement for every
   semibounded self-adjoint operator, with values in `ℝ ∪ {+∞}` and the essential-spectrum
   alternative; for the operator of a compact form pair `μ_{n+1}(A)` is VariationalMethods' `λₙ`." Add
   to 1.6 the Check: "`A = diag(1, 3, 5)`: `μ₁, μ₂, μ₃ = 1, 3, 5` are VariationalMethods' `λ₀, λ₁, λ₂`
   and Tau Ceti's `eigenvalues` at indices `2, 1, 0`; `μ₄ = +∞` where `rayleighMinMax ⊤ 3 = 0`." No
   supplier edge is needed (no target of 1.6 uses either). Tested on that instance: the three
   conventions give `1, 3, 5`, `1, 3, 5` and `5, 3, 1`, and differ at the fourth index (`+∞`, `0`,
   undefined).

3. **F03** (P3) "The funnel `y < 1`" of the parabolic cylinder

   **Location.** Line 1509: "infinite area: the funnel `y < 1` has infinite area".

   **Claim.** The wide end of `⟨z ↦ z + 1⟩\ℍ` is a funnel.

   **Witness.** Line 1279 uses "funnel ends" for the hyperbolic cylinder `⟨z ↦ 2z⟩\ℍ`, the standard
   meaning (a half-cylinder bounded by a closed geodesic). `⟨z ↦ z + 1⟩\ℍ` has no closed geodesic; its
   end `y → 0` is not one.

   **Exact repair.** "infinite area: the part `y < 1` has area `∫_0^1 dy/y² = ∞`". Tested: the
   computation is the one the sentence needs, and line 1279 keeps its meaning.

Three findings: one P2 and two P3; one blocking. The eight findings of round 5 are all repaired. The
blocking finding sits in the passage the round-5 repair of F01 added (3.8, 3.9 and the
RiemannianGeometry contract). The last repair report marked nothing "not actionable", so nothing is
re-raised. This is a design review: the README, the plan and the manifest were not changed. Line
numbers refer to `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md` unless another
file is named.

## Previous findings, checked first

| Round 5 finding | Status | Repaired passage and what was verified |
|---|---|---|
| F01 (P2) closed-manifold Schrödinger operators owned on main | repaired | Lines 79–89: "None of it is restated here: 3.8 proves that `Δ_X` of 3.6 is the complexification of R5c's operator at `q = 0`"; 3.8 lines 1113–1131; 3.9 lines 1164–1178; contract lines 363–375. R5c read on main (dimension `m ≥ 1`, real `E`, closed case "replace M by D", `μ₁ ≤ μ₂ ≤ …`, `μ_k → +∞`, Courant–Fischer over `W ⊂ V`, item 4). The repair left the complexification unsupplied: R01. Removing the VariationalMethods bullet left 1.6 without its comparison: R02. |
| F02 (P3) torsion and the method of AutomorphicSpectralTheory | repaired | Lines 1284–1296: "whose image in `PSL₂(ℤ)` is torsion-free (for instance `Γ(N)`, `N ≥ 2`, or `Γ₀(4)` …)", "finite-stabilizer orbifold charts". Open heads read: CongruenceSpectralGap §0.2 (`N′ = 3N`, invariants under `Γ/Γ(N′)`), AutomorphicSpectralTheory §1.16a. |
| F03 (P3) three locators | repaired | Lines 608–610, 630–641: (12.3) at teschl line 10585–10587, Lemma 12.1 at 10600–10601, (12.6) at 10609, Theorem 12.2 at 10617–10620, min–max at 5044–5052, Theorem 4.12(i) at 5063–5069; each read. The chain rule carries its own proof. |
| F04 (P3) Layer 2 dependency on Layer 1 | repaired | Lines 904–905: "… Independent of Layer 1."; lines 398–400. Needs of 2.1–2.3 name no Layer 1 item; plan prerequisites agree. |
| F05 (P3) width and height | repaired | Lines 1230–1232: "The pair `(w, a)` belongs to the chosen isometry, not to `C`"; Check at 1270–1274. |
| F06 (P3) 2.1's equivalence is the supplier's | repaired | Lines 807–813: "the equivalence is cited, not proved again"; SA-D22, SA-E08, SA-E11 read on main (README lines 1113, 1217, 1226). |
| F07 (P3) "the complete `L²` theory" | repaired | Lines 35–39. |
| F08 (P3) second gap attached to no target | repaired | Lines 423–430 and 434; plan `gaps[1].neededBy = ["1.1"]`. |

Repaired patterns searched in the rest of the text: every supplier paragraph of the contracts for a
"Used:" or "Assumed:" sentence that the supplier does not state (the SelfAdjointSpectralTheory and
QuantumFoundations ones are stated by the supplier; the R5c one is R01); every locator pair of a
definition and a theorem sharing one line range (none left); every "funnel", "cusp", "torsion"
(R03); every layer Dependencies line against the Needs lines of its targets (agree).

## Verified sound

**Scope of this round.** All eight repairs and the passages they changed; the fifteen seeded targets
in full (1.3, 1.4, 1.6, 1.7, 2.1, 2.3, 3.1, 3.3, 3.6, 3.7, 3.8, 3.9, 3.10, 4.2, 4.4); the other
sections recomputed while reading (1.1, 1.2, 1.5, 1.8, 1.9, 2.2, 3.2, 3.4, 3.5, 4.1, 4.3, 4.5);
every supplier citation resolved at main `1a19c9f` and at the open heads; the pinned names; both
gaps; the six maintainer notes; the plan (44 targets in 4 layers: 26 theorems, 17 definitions, 1
example; every definition has API entries and at least three tests).

**Principles.** No route-specific shortcut (separability only in 1.4(4); every `d ≥ 1`;
disconnected, zero-dimensional and empty manifolds treated). No copied passage, algorithm,
`set_option` or sorry'd data. Layers are named by their mathematics. No pull-request number, date,
round label, TeX delimiter or machine path in the README (grep). No upward supply.

**Adversarial table** (values computed this round).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 1.1 bare PVM item | `B ↦ 1_B(2)Q` on `ℂ²`; `1_B(2)Q + 1_B(5)(1−Q)` | value `Q ≠ 1` at `ℝ`, excluded by the pinned field `proj_univ`; `(i − diag(2,5))·diag((i−2)⁻¹,(i−5)⁻¹) = 1` | correct |
| 1.3 reduced restriction | `diag(1,2,3)`, `U = span(e₁,e₃)`; `U = 0`; `U = ℋ` | `σ(A|_U) = {1,3}`; `∅`; `σ(A)`; `(z − A|_U)R_A(z)u = u` for `u ∈ U` | correct |
| 1.4 definitions and (1)–(4) | `M_x` on `L²[0,1]`; `diag(q_n)`; `ℚ`, `(0,1)`, `[0,1] ∪ {2}`; `ℓ²(ℝ)`; `ℋ = 0`; pp case with `λ` an atom | `σ_ac = [0,1]`; `σ_pp = [0,1]`, `σ_ac = ∅`; essential closures `∅`, `[0,1]`, `[0,1]`; no maximal vector; all empty; an eigenvector serves as the single `f` | correct |
| 1.5 interval criterion | `a = b`; `L²([0,1] ∪ [2,3])`; fat Cantor `K` | right side vacuous while `{a} ⊄ ∅`; mass of `(1,2)` is `0`; `K^ess ⊆ K` has no interval | correct |
| 1.6 min–max and corollaries | `diag(1,3,5)`; `−1 ⊕ H₀`; `ℋ = 0`; Neumann/Dirichlet on `(0,1)`; `λ = 4`, `6`, `−1/2` | `1,3,5,+∞`; `−1,0,0,…`; `μ₁ = +∞ = inf ∅`; `(n−1)²π² ≤ n²π²`; counts `2 = 2`, `3 = 3`, `1 = 1` | correct; R02 is about neighbours |
| 1.7 wave operators, chain rule | `H₁ = H₂`; `H₁ = 0, H₂ = 1` on `ℂ`; `H₁ = H₂ = 0`, `H₃ = c ≠ 0` | `Ω = 1`; `e^{it}ψ` converges iff `ψ = 0`; `Ωψ = ψ ∈ D(H₃,H₂) = 0` iff `ψ = 0` | correct; intertwining sign as teschl (12.6) |
| 1.8 truncation, Rosenblum, square root | `x = |λ|^{−1/4}1_{[−1,1]}`; rank-one `C`; `m = 0`; `V = diag((−1)^{n+1}/n²)` | removed mass `2∫_0^{m^{−4}} λ^{−1/2} = 4/m²`; both sides `2πm²`; `0 ≤ 2π·0·⊤ = 0`; `Σ 1/n² = π²/6` both sides (pinned `nuclearENorm` is `∑' singularValue`) | correct |
| 1.9 Pearson, Kato–Rosenblum | `J = 0`; `V = 0`, `H₁ = diag(1,2)`; `H₁ = diag(1/n²)`, `V = −H₁`; `M_x`, `2M_x` | `W = 0`; `W = P_ac = 0`, `Ω = 1`; `e^{−it/n²}ψ_n` converges iff `ψ = 0`; `(e^{it} − 1)/(it) → 0` with norm `1` | correct; kato57 (1.1)–(1.3), Lemma 2.1 read |
| 2.1 cited cycle and `λ₀` | `A = 2` on `ℂ`, `γ = 1, 2, 3`; `ℋ = 0`; `M_x`; Gaussians | true, true, false in all three clauses; all true; all false; `c + π/n²` | correct; SA-D22 from `(γ − z)‖x‖ ≤ ‖(A − z)x‖` |
| 2.3 bound and factorisation | `d > max(a/(1−b), a + b|γ|)`; `sup_{s ≥ γ} |s|/(s − μ)`; `A = 2, V = 1, μ = 0`; scalar `V = −(a + b|λ|)` | `a/d + b < 1`, `(a + b|γ|)/d < 1`; `max(1, |γ|/d)` in the three sign cases; `(3/2)·2 = 3`; `t ↦ t − b|t|` increasing | correct |
| 3.1 Green pairing | `v = a + ib`, `u = c + id`; circle | `conj(v)Δu = aΔc + bΔd + i(aΔd − bΔc)`; `2πn²` both sides | correct; both support cases follow from the pinned `integral_mul_divergence` pair |
| 3.3 maximal operator | `e^{−|x|}`; `χ/|x|` on `ℝ³`; `(0,1)` | `−u + 2δ₀`; `4πδ₀`; `1, eˣ ∈ dom Δ_max` | correct; bms02 line 151–155, 179–180 |
| 3.5 cutoffs | clamp, step with thresholds `1/8`, `7/8` | gradient `≤ 2·(2/k)`; `(0,1)`: `1 ≤ (4/k)(1/2)` fails for `k > 2` | correct |
| 3.6 estimates | `χ = χ_k`; `Δu = −u` | `∫χ²|du|² ≤ ‖Δu‖‖u‖ + ½∫χ²|du|² + 2 sup|dχ|²‖u‖²`; `∫χ²|u|² ≤ 2 sup|dχ|²‖u‖²` | constants `2, 4` and `2` hold |
| 3.7 vocabulary | circle; `ℝ`; point; torus; two circles | `0,1,1,4,4` and `μ₁..μ₅` the same list; `λ₁⁺ = 0 = λ₁`; `+∞`; `4π²` four times; `λ₁ = 0 ≠ 1 = λ₁⁺` (connectedness needed) | correct |
| 3.8 compact manifolds | `S²`; `N` points; `∅`; circle, real vs complex kernels | `2,2,2`; `0` (`N` times) then `+∞`; `σ = ∅`; dimensions `2` and `2` | statements correct; supply is R01 |
| 3.9 bounded potentials | one point, `s = 1`; circle `V = 1`; `V = 1_{[0,π)}` | `T = i`, `T − T* = 2i = 2i·TT*`, `i + i⁻¹ = 0`; `1,2,2,5,5`; `u(0) = 0`, `(1 − λ)u′(0) = −λu′(0)` gives `u′(0) = 0` | correct |
| 3.10 cusp threshold | `u = e^{r/2}F(r)`, `F = e^{itr}ψ((r − n)/n)` | `y²∂_y² u = e^{r/2}(F″ − F/4)`; `‖u_n‖² = wn‖ψ‖²`; residual `−e^{r/2}e^{itr}(2itψ′/n + ψ″/n²)`; supports `[2^{j+1}, 3·2^j]`, `3·2^j < 2^{j+2}` | correct |
| 3.10 definition | scaling by `2`; truncation at `a′ = 2` | `(1,1) ↦ (2,2)`, area `1` both; area `1/2` | correct |
| Layer 3 Examples | `Γ(2)`, `Γ₀(4)`, `Γ₀(2)` | `−I` in all; index `6`, area `6·π/3 = 2π`; rows `(1,−1),(2,−1)`: det `1`, trace `0`, fixed point from `2z² − 2z + 1 = 0`, `z = (1 ± i)/2` | correct |
| 4.1 norms | Gaussian, `d = 1`; `1_{[−1,1]}` | `‖ξ²𝓕u‖² = 3/(16π²√2)`, `‖u″‖² = 3π²/√2`; `𝓕u = sin(2πξ)/(πξ)` | correct |
| 4.2 free Laplacian | `d = 1`, `ψ = e^{−πx²}`; `d = 0` | density `e^{−λ/(2π)}/(2π√λ)`, mass `2^{−1/2}`; `q = π/√2`; `σ_ess = ∅` | correct; agrees with QuantumFoundations §8.2 at `n = 1` |
| 4.3 change of resolvent point | `s = 0, 1` | `i = i`; `(1 + i)/2` both; slip gives `2 − i` | correct |
| 4.4 square well | `k = 0.739` | `k tan k = 0.673`, `√(1 − k²) = 0.674`, `E ≈ −0.454` | correct |
| 4.5 potential | `cos x + cos(√2x)` | `−2` approached, not attained | correct |
| Parabolic cylinder (worked example) | `y < 1` | `∫_0^1 dy/y² = ∞` | area claim correct; wording is R03 |

**Sources.** Twenty-one manifest entries (eight certified, thirteen settled uncertified); every key
cited in the README is in the manifest; nothing was fetched and no `needs-references.toml` was
written. No locator is flagged as unverified by the author. Read at the text: teschl line
2910–2918, 2956–2967, 3041–3046, 3278–3306, 3976–3994, 4311–4334, 4346–4368, 4384–4428, 4940–4948,
5036–5072, 5680–5722, 6274–6282, 6354–6361, 7082–7144, 7209–7230, 9574–9590, 10578–10622; kato57
line 15–40, 88–114; yafaev04 line 112–142, 188–208; rosenblum57 line 66–96; bms02 line 124–131,
148–158, 176–184, 240–258; hm23 line 38–48, 58–67, 102–106; kps26 line 18–52; lp80 line 247–258,
276–302. Each supports its statement with the hypotheses the README adds (separability for Lemma
3.16; the disconnected case beyond bms02's standing connectedness; every bounded `V` beyond Theorem
10.2's decaying class).

**Pinned libraries** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`). Opened this round: `ProjValMeasure`
(`ProjValMeasure/Basic.lean:91`, fields `proj`, `diag`, `diag_finite`, `inner_proj`, `proj_univ`,
`proj_inter`), `proj_mul_comm` (200), `norm_sq_proj_apply` (275), `diag_univ` (299),
`ProjValMeasure.integral` (`Integral.lean:218`); `IsReducing.isSelfAdjoint_restrict`
(`Reducing.lean:144`); `LinearPMap.resolvent` and `resolvent_sub_resolvent`
(`Resolvent/Basic.lean:169, 280`); the compact-resolvent equivalence (`CompactResolvent.lean`) and
eigenbasis (`Eigenbasis.lean:113`); `nuclearENorm` (`Nuclear/Basic.lean:53`) and its compactness
theorem (153); `hilbertSchmidtEnergy_indep` (`HilbertSchmidt/Basic.lean`); the Hilbert–Schmidt
compactness theorem (`Columns.lean:257`); `add_of_isRelativelyBounded` (`KatoRellich.lean`);
`IsRelativelyBounded` (`RelativeBound.lean`); `laplaceBeltrami` (`Laplacian.lean:238`),
`divergence` (55); `integral_mul_laplaceBeltrami` (`DivergenceTheorem.lean:312`);
`riemannianVolume` (`Volume.lean:82`), its locally-finite instance (179) and open-positivity
instance (`Support.lean:36`); `HyperbolicMetric` (`Hyperbolic.lean:51`); `Complexification`
(`Normed/Module/Complexification.lean:82`); Mathlib `HasCore` (`LinearPMap.lean:141`),
`isClosable_iff_exists_closed_extension` (132), `mem_adjoint_domain_of_exists` (163),
`adjoint_apply_of_not_dense` (172), `IsFormalAdjoint.le_adjoint` (194), `adjoint_isClosed` (332),
`memSobolev_iff_exists_smulLeftCLM_fourier` (`Sobolev.lean:222`), `MemSobolev.laplacian` (348),
both `laplacian_eq_fourierMultiplierCLM` (`FourierMultiplier.lean:107, 208`),
`fourierTransformₗᵢ` (`LpSpace.lean:51`), `IsCompactOperator.comp_clm` (`Compact/Basic.lean:271`),
`isCompactOperator_of_tendsto` (459), `mutuallySingular_singularPart`, `singularPart_add_rnDeriv`,
`eq_singularPart`, `eq_withDensity_rnDeriv` (`Lebesgue.lean:106, 122, 404, 522`), `instLaplacian`
(`InnerProductSpace/Laplacian.lean:138`). Neither library has an essential spectrum of a partial
operator, a Weyl criterion, wave operators, or essential self-adjointness of a Laplacian (grep);
the one neighbour is the finite-dimensional Courant–Fischer file of R02.

**Suppliers, resolved now.** Main: UnboundedOperators §1.1 (line 241), §1.2 (259), §1.3 (273),
§1.6 (303), §1.7 (309), §3.1 (523), §3.2 (533), §3.3 (552), §4.7 (703), §5.1 (900), §5.4 (983),
§5.6 (1027), §5.7 (1033), each read; SelfAdjointSpectralTheory SA-B44–45, B85, C12–C19, C25, C28,
C39, C44, C52, C54, C86, D02, D12, D18, D22, E01, E05–E09, E11–E13, E26–E30, E44, E47, each
located and the ones a route uses read; RiemannianGeometry R5c (3715–) and R7.8 item 8 (4437);
ComplexKahlerGeometry K5a and K5a.ComponentwiseCompact (2092); VariationalMethods 4.4 (782);
DifferentialGeometry 12.2–12.5; PDE §1.2 (720), §1.3 (769), §6.3 (2309); SmoothBundlesConnections
B2.2 (605); PseudodifferentialOperators P1.0; HilbertModules H6 (705); OperatorIdeals OI-B29,
B35, B36, C14; FuchsianOrbifolds Layer 3 (563); `Completed/HopfRinow`. Open heads: QuantumFoundations
§8.2 and §9.5; CongruenceSpectralGap §0.2 and §0.6; AutomorphicSpectralTheory §1.16a; MaassForms
§0.1. No cited section is missing where it is cited. `citations.md` lists nothing found nowhere.

**Declared gaps.** `gap:weyl-criterion`: UO-C02 on main names Lemma 6.17 in a locator sentence and
uses a singular Weyl sequence in its Fredholm proof; its three API items do not include the
criterion; the `needs` sentence matches teschl line 6277–6281; same slug in the plan and the
README. `gap:spectral-integral-resolvent`: UO-A02 on main proves the inverse for the measure of a
given operator, and UO-A03's product rule is transported for `P_A` only, so the bare-measure
statement is not provided; precise, minimal, same slug in both places, attached to 1.1. Both name a
supplier and a section. A later acceptance would be conditional on both.

**Maintainer notes** (none holds at this head; each was repaired in an earlier round).

1. Not held: lines 107–114 give UO-E06 only `L² + L^∞` on `ℝ³` and send Coulomb to QuantumFoundations §9.5; lines 124–125 exclude `L^p` and the Kato class.
2. Not held: lines 75–78 and 294–295 say UO-C03 gives self-adjointness with a finite control measure and 1.3 gives it in general.
3. Not held: every mention of Weyl's criterion carries `gap:weyl-criterion` (lines 67–68, 305–310, 1254–1257).
4. Not held: lines 1393–1401 state the passage from `(H₀ + 1)⁻¹` to `(H₀ − i)⁻¹` with its identity.
5. Not held: the last item of 1.1 with `gap:spectral-integral-resolvent`.
6. Not held: the contract lists SA-C86 and SA-E30 (lines 272–279).

The closing instruction is met at lines 1437–1441 (4.4 names UO-E06 as its three-dimensional case).
The ownership decisions recorded in the notes are respected.

**Duplication and overlap.** By object, over main and the open heads: spectral-type subspaces
(UO-C03, cited), essential spectrum (UO-C02, cited), free Hamiltonian (QuantumFoundations §8.2,
cited), `L² + L^∞` potentials (UO-E06, cited), the congruence Laplacian (CongruenceSpectralGap
§0.2, cited as an instance), closed-manifold `Δ⁺ + q` (R5c, cited), the form-bound cycle (SA,
cited), complexification of a real self-adjoint operator (UO-D06, not cited: R01), Courant–Fischer
for compact pairs (VariationalMethods 4.4, not cited: R02). `overlaps.md` reports no pull request
changing this roadmap, no dropped id, no revision-only id and no second copy; none found.

Overlap check: read UnboundedOperators (main), VariationalMethods (main), SelfAdjointSpectralTheory (main), CongruenceSpectralGap, QuantumFoundations, AutomorphicSpectralTheory (open), and RiemannianGeometry R5c (main); shared: pp/ac/sc subspaces — UnboundedOperators UO-C03; free Hamiltonian — QuantumFoundations §8.2; `L² + L^∞` potentials on `ℝ³` — UnboundedOperators UO-E06; congruence Laplacian — CongruenceSpectralGap §0.2; `Δ⁺ + q` on closed manifolds — RiemannianGeometry R5c; form-bound criterion — SelfAdjointSpectralTheory; complexified real operator — UnboundedOperators UO-D06 (R01); Courant–Fischer for compact form pairs — VariationalMethods 4.4 (R02). RelativisticQuantumFieldTheory and the open SelfAdjointSpectralTheory revision were not reread this round.

**Supplier-order gate.** Output of the prescribed command:

```
candidate: SchrodingerOperatorsAndSpectralTypes is not in the merge order yet; checked as if placed after QuantumFoundations (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2234 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every Needs line was read against its target; the one missing item is R01.

**Shape.** Summary, Scope, Conventions, supplier contracts, build paragraph, four layers each ending
with Examples and Dependencies, Downstream consumers, Worked examples, References. Every definition
has API bullets and at least three Checks; every theorem has hypotheses and a locator. The layer
order is the roadmap's own: Layer 1 draws on teschl §3.3, §4.3–4.4 and §12.1 and on kato57, Layer 2
on §6.1, Layer 3 on no chapter of teschl, Layer 4 on §7.2 and §10.1; Layers 1 and 2, and 3 and 4,
are independent. A design has no `Suggested.lean`: headline statability, padding, binders and
imports are package-stage checks, and the README attributes no Lean name to this roadmap.

Source independence: 17 passages compared with 8 sources (teschl, kato57, yafaev04, rosenblum57, bms02, hm23, kps26, lp80), none shared beyond standard names and formulas; largest share teschl, 35 of 92 locators; contents compared with teschl: independent.

## Not verifiable

- Elaboration: not available (this lane does not elaborate). No Lean command was run.
- The thirteen settled uncertified texts (`strichartz83`, `chernoff73`, `kato76`, `cfks87`,
  `gaffney54`, `rs1`, `rs2`, `rs3`, `grigoryan09`, `chavel84`, `iwaniec02`, `lp76`, `pearson78`)
  were not read. Of the sampled targets, 3.6's attribution to Gaffney, Chernoff and Strichartz and
  the `rs2 §X.1` examples rest on their locators alone; the statements are checked against bms02
  and by computation. The `rs3 §XI.3` locator of the chain rule cannot be checked; the README
  proves the rule in one line.
- Published numbering of the arXiv copies of `bms02`, `hm23`, `kps26` was not compared with the
  journal versions.
- Ownership against open pull requests was checked with `roadmaps show` for the four open roadmaps
  named above and by the worker's overlap and citation lists; other open heads were not read.

## Source issues

- **Misprint** in teschl at Theorem 6.4, equation (6.3), printed page 135: the source says the second entry of the maximum is the ambient coefficient over the relative coefficient minus one; it should be over one minus the relative coefficient; affects a stated result.
- **Misprint** in teschl at Theorem 6.4, proof, last line, printed page 135: the source says the admissible shift is bounded by the same quotient with denominator the relative coefficient minus one; it should have one minus the relative coefficient, and a negative sign; affects the proof.

## For the human reviewers

- **Licence.** `teschl` is read from the author's online edition of an AMS book; 35 of 92 locators point into it. The wording and arrangement checks found nothing shared (`sources.toml`, entry `teschl`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3f5f1e1f59cb19f4ac61f1fad4bf7f46c9374d02", "job": "REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~6", "model": "fable", "worker": "chris-x80"} -->
