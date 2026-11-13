<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13815#issuecomment-6850451534 -->
Review (claude) of b4f6a63

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) Schrödinger operators on closed manifolds have an owner on main that is not cited

   **Location:** 3.8, lines 1055–1069, and 3.9, lines 1088–1098 ("`Δ_X + V` has compact resolvent; its spectrum is discrete … if `V` is moreover smooth, every eigenfunction is smooth"); Scope, lines 72–83, which name RiemannianGeometry only for R7.8.

   **Claim:** these compact-manifold statements are owned here, on top of K5a and VariationalMethods.

   **Witness:** main `TauCetiRoadmap/RiemannianGeometry/README.md:3405` (R5c, "Schrödinger operators on compact manifolds"), lines 3484–3521: closed case of `Δ⁺ + q`, smooth real `q`: K5a realisation, `μ₁ ≤ μ₂ ≤ …`, `μ_k → +∞`, smooth eigenbasis, Courant–Fischer by VariationalMethods 4.1–4.4; line 3581: `λ₁(Δ⁺) = μ₂(Δ⁺)`.

   **Exact repair:** RiemannianGeometry is on main and already a supplier, so it keeps the statement and this roadmap cites it and keeps what differs.

   1. Scope: add a bullet. RiemannianGeometry R5c owns, on a closed manifold of dimension `≥ 1`, the self-adjoint realisation of `Δ⁺ + q` for smooth real `q` (through K5a), its discrete spectrum, the ordered eigenvalues `μ₁ ≤ μ₂ ≤ …` with `μ_k → +∞`, the smooth eigenbasis, the Courant–Fischer characterisation and the first positive eigenvalue `λ₁(Δ⁺) = μ₂(Δ⁺)`. None of it is restated. 3.8 identifies `Δ_X` of 3.6 with that realisation at `q = 0`; 3.9 owns bounded measurable `V`, dimension `0`, and the two-sided min–max bound.
   2. 3.8: replace "prove … every spectral value is an eigenvalue of finite multiplicity, … `λ_k → ∞`" and the Courant–Fischer sentence by: prove that `Δ_X` is the complex-linear extension of R5c's closed realisation of `Δ⁺` (the same K5a operator; on `L²(X; ℂ)` regarded as real, it is R5c's operator for the trivial rank-two bundle with `K = 0`), so that for `dim X ≥ 1`, `X ≠ ∅`, `λ_k(X) = μ_{k+1}(Δ⁺)` and R5c's spectral statements hold for `Δ_X`. Keep as owned: completeness of compact `X`, the identification with 3.6's closure, the multiplicity of `0` for several components, `dim X = 0` and `X = ∅`.
   3. 3.9: in the last bullet write "if `V` is moreover smooth and `dim X ≥ 1`, `Δ_X + V` is R5c's closed realisation of `Δ⁺ + V` and its eigenfunctions are smooth (RiemannianGeometry R5c)"; add to the section's first sentence that the compact clause is owned here for `V ∈ L^∞` that need not be smooth.
   4. Add RiemannianGeometry R5c to the Needs of 3.8 and 3.9, to the supplier contract, to the Layer 3 Dependencies and to the plan (`suppliers`, prerequisites of 3.8 and 3.9).
   5. Conventions, "Extended values" or 3.7: add the index comparison `λ_k(X) = μ_{k+1}` in R5c's numbering from `1`.

   Tested on the instances: circle of length `2π`, `V = 1` (smooth): R5c gives `μ_k = 1, 2, 2, 5, 5`, the list of the 3.9 Check, so that instance is now cited, not owned. `V = 1_{[0,π)}` is not smooth and a finite set has dimension `0`: R5c covers neither, and both stay targets of 3.9 with their Checks.

2. **F02** (P3) "Groups with torsion" and the method attributed to AutomorphicSpectralTheory

   **Location:** lines 1196–1198: "Quotients by groups with torsion are orbifolds, outside 3.6; CongruenceSpectralGap §0.2 … and AutomorphicSpectralTheory §1.16a (`Γ₀(N)`) treat them by passing to a torsion-free normal subgroup"; line 1191.

   **Claim:** torsion in `Γ` makes `Γ\ℍ` an orbifold; both suppliers pass to a torsion-free cover.

   **Witness:** `−I ∈ Γ(2)` and `−I ∈ Γ₀(4)`, yet neither has elliptic points: `Γ(2)\ℍ` is the thrice-punctured sphere (index `6`, three cusps, genus `0`, area `2π`), a manifold. AutomorphicSpectralTheory §1.16a (head, line 1278) works in "finite-stabilizer orbifold charts", with no cover.

   **Exact repair:** line 1191: "For a congruence subgroup `Γ` whose image in `PSL₂(ℤ)` is torsion-free (for instance `Γ(N)`, `N ≥ 2`, or `Γ₀(4)`)". Lines 1196–1198: "Quotients by groups whose image in `PSL₂(ℝ)` contains elliptic elements are orbifolds, outside 3.6; CongruenceSpectralGap §0.2 treats every congruence group by passing to the torsion-free normal subgroup `Γ(N′)` and taking invariants under the finite quotient group, and AutomorphicSpectralTheory §1.16a treats `Γ₀(N)` in orbifold charts." Tested on `Γ(2)`: it now falls under 3.6, 3.7 and 3.10 (`ker = ℂ·1`, `[1/4, ∞) ⊆ σ_ess`), as it should; `Γ₀(2)`, with the elliptic point `(1 + i)/2`, stays outside.

3. **F03** (P3) Three locators in 1.6 and 1.7

   **Location:** line 573: "`dim ran P_A((−∞, λ)) = #{n : μ_n(A) < λ}` (teschl line 5063–5069)"; lines 592–594 and 599–600 (definition of `D_±`, and the chain rule under "teschl Lemma 12.1 and Theorem 12.2, line 10600–10620").

   **Claim:** the cited lines state these three things.

   **Witness:** teschl line 5063–5069 is Theorem 4.12(i), the inequality `dim Ran P_A((−∞, λ)) ≥ k` from `k` trial vectors. The definition of the wave operators is (12.3), teschl line 10585–10587, p. 247. Lemma 12.1 and Theorem 12.2 contain no chain rule.

   **Exact repair:** line 573: "(a consequence of the min–max theorem, teschl line 5044–5052; the lower bound `≥ k` from `k` trial vectors is teschl line 5063–5069, Theorem 4.12(i))". Line 593: "(teschl line 10585–10587, (12.3), p. 247)". Chain-rule bullet: add "(rs3 §XI.3, the chain rule; proved here from `‖e^{itH₃}e^{−itH₂}(e^{itH₂}e^{−itH₁}ψ − Ω_±(H₂,H₁)ψ)‖ → 0`)" and restrict the Teschl locator to the first two bullets. Update plan 1.6b and 1.7b locators. The statements themselves are correct (table below).

4. **F04** (P3) Layer 2 lists a dependency on Layer 1 that no target has

   **Location:** line 855: "Layer 1 (for `σ`, `P_A` and 1.3); SelfAdjointSpectralTheory Parts C, D, E; Tau Ceti Kato–Rellich."

   **Claim:** Layer 2 needs Layer 1.

   **Witness:** the Needs lines of 2.1 (line 774–775), 2.2 (line 797) and 2.3 (lines 828–829) name no Layer 1 item, and neither do the plan prerequisites of 2.1a, 2.1b, 2.2, 2.3; `σ` and `P_A` are SA-D02 and SA-E01.

   **Exact repair:** line 855: "SelfAdjointSpectralTheory Parts C, D, E; UnboundedOperators UO-D06; Tau Ceti Kato–Rellich. Independent of Layer 1." In "How to read the build" (line 384) keep "both need Layers 1 and 2" and add that Layers 1 and 2 are independent of each other.

5. **F05** (P3) Width and height of a cusp end are not invariants of the end

   **Location:** lines 1144–1152: "an open set `C ⊆ X` with an isometry `C ≅ (ℝ/wℤ) × (a, ∞)` … (width `w`, height `a`)" and "a standard cusp end with the same width and height".

   **Claim:** `w` and `a` are attached to `C`.

   **Witness:** `(x, y) ↦ (cx, cy)` is an isometry `(ℝ/wℤ) × (a, ∞) → (ℝ/cwℤ) × (ca, ∞)` for the metric `(dx² + dy²)/y²`. So `y > 1` in `⟨z ↦ z + 1⟩\ℍ` has width `1`, height `1`, and also width `2`, height `2`; only `w/a = 1` is common.

   **Exact repair:** after the definition add: "The pair `(w, a)` belongs to the chosen isometry: composing with `(x, y) ↦ (cx, cy)` replaces it by `(cw, ca)`, and only the area `w/a` is determined by `C`." Reword the third bullet: "the image … is a standard cusp end, with the same width and height for the transported isometry". Add the instance above as a Check. 3.10's theorem does not use `w` or `a` beyond `e^{2n} > a`, and is unaffected.

6. **F06** (P3) 2.1's form-bound criterion is the supplier's statement

   **Location:** lines 766–768: "prove that the following are equivalent: `γ‖x‖² ≤ ⟪x, Ax⟫` for every `x ∈ dom A`; `σ(A) ⊆ [γ, ∞)`; `P_A((−∞, γ)) = 0`."

   **Claim:** the equivalence is a target of this roadmap.

   **Witness:** main SelfAdjointSpectralTheory SA-E11 (README line 1226) gives third ⇒ first; SA-D22 with SA-E08 gives the converse. The open revision of that roadmap states the two-way form as its headline `forall_le_re_inner_iff_proj_Iio_eq_zero` (§3.3, "Semiboundedness from spectral support").

   **Exact repair:** in 2.1 write: "The equivalence of the form bound with `P_A((−∞, γ)) = 0` is SelfAdjointSpectralTheory's (SA-E11, with SA-D22 and SA-E08 for the converse) and is cited, not proved again; this section adds the clause `σ(A) ⊆ [γ, ∞)`, the definition of `λ₀` and its variational formula." Keep the Checks. At the package stage the two-clause equivalence is not a `Suggested.lean` statement. No dependency on the revision is created: every cited id exists on main and the revision's "Former SA numbering" table maps each one.

7. **F07** (P3) "The complete `L²` theory" overclaims

   **Location:** lines 34–35: "the complete `L²` theory of the scalar Laplace–Beltrami operator on noncompact Riemannian manifolds".

   **Claim:** the roadmap owns the whole `L²` theory.

   **Witness:** line 110–113 excludes heat kernels and the spectral description of finite-area surfaces; Layer 3 proves essential self-adjointness, the domain and form identifications and a spectral vocabulary, on complete manifolds.

   **Exact repair:** "the `L²` realisation of the scalar Laplace–Beltrami operator on complete Riemannian manifolds (essential self-adjointness on `C_c^∞`, operator and form domains, kernel, bottom of the spectrum, ordered eigenvalues, bounded potentials and the cusp threshold)".

8. **F08** (P3) The second gap is attached to no target

   **Location:** lines 124–129 (Conventions: "for a bare normalized real projection-valued measure `P` it applies to the self-adjoint `A_P`"); `design/plan.json`, `gaps[1]` (`spectral-integral-resolvent`).

   **Claim:** the gap is declared like the first one.

   **Witness:** `gaps[0]` has `neededBy: ["3.10b"]` and 3.10b lists `gap:weyl-criterion`; `gaps[1]` has no `neededBy`, and no target of the plan lists `gap:spectral-integral-resolvent` (the plan's prerequisite strings contain one gap only).

   **Exact repair:** make the transfer a stated item at the end of 1.1: "For a normalized projection-valued measure `P` on `ℝ`, `P` is the spectral measure of the self-adjoint `id[P]` (UO-A01–UO-A02), so 1.1–1.9 hold with `P` in place of `P_A`. *Needs:* SA-E05, SA-E44; UnboundedOperators UO-A02 with gap:spectral-integral-resolvent." In the plan add `gap:spectral-integral-resolvent` to the prerequisites of 1.1 and `"neededBy": ["1.1"]`; shorten the Conventions bullet to a pointer, keeping its two witnesses.

Eight findings: one P2 and seven P3; one blocking. This is a design review; the README, the plan and the sources manifest were not changed. The five findings of round 4 are all repaired. The last repair report marked no finding "not actionable", so nothing is re-raised. Line numbers refer to `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md` unless another file is named.

## Previous findings, checked first

| Round 4 finding | Status | Repaired passage and what was verified |
|---|---|---|
| F01 (P2) congruence Laplacian handed upward | repaired | Lines 100–108: "CongruenceSpectralGap §0.2 proves, on a torsion-free principal congruence cover … None of these is restated here"; lines 1191–1198 give the comparison; lines 1394–1399 and the plan's `consumers` no longer list AutomorphicSpectralTheory, CongruenceSpectralGap, MaassForms. Read at the open heads: CongruenceSpectralGap §0.2 (`N′ = 3N`, Gaffney cutoffs, kernel the constants) and §0.6; AutomorphicSpectralTheory §1.16a; MaassForms §0.1. The repair introduced the two slips of R02. |
| F02 (P3) two signs of `Δ` | repaired | Lines 154–168 and 1211–1214: "`Δ` on `ℝ^d` is Mathlib's `Σⱼ ∂ⱼ²`, so that `H₀ = −Δ ≥ 0` there is Layer 3's `Δ_X`". Mathlib `SchwartzMap.laplacian_eq_fourierMultiplierCLM` (`Analysis/Distribution/FourierMultiplier.lean:107`) reads `Δ f = −(2π)² • …`, as the contract says. |
| F03 (P3) Hilbert–Schmidt ⇒ compact | repaired | Lines 250–252, 1289–1292, 1304–1306 cite `ContinuousLinearMap.isCompactOperator_of_hilbertSchmidtEnergy_ne_top` (`HilbertSchmidt/Columns.lean:257`) and OI-C14 (OperatorIdeals README line 563); plan 4.3b and the supplier sections match. |
| F04 (P3) supplier path | repaired | Lines 58, 272, 293, 300 and the plan's supplier, both `gaps[*].supplier` and 24 prerequisites use `OperatorTheory/UnboundedOperators`; the gate still reports 0 problems. |
| F05 (P3) unbound Hilbert basis | repaired | Lines 636–643: "every Hilbert basis `b` of `ℋ`, `∫_ℝ ‖C e^{−itH} x‖² dt ≤ 2π m² · hilbertSchmidtEnergy C b`, the inequality read in `ℝ≥0∞`"; `hilbertSchmidtEnergy_indep` is at `HilbertSchmidt/Basic.lean:150`. |

Repaired patterns searched in the rest of the text: every bare `Δ` (Layers 1–3 nonnegative, Layer 4 Mathlib's; no mixed use); every supplier heading path; every `hilbertSchmidtEnergy` with its basis; every sentence that says another roadmap "uses" or "consumes" this one (only the Downstream list, whose four roadmaps are later or would consume through a revision).

## Verified sound

**Scope of this round.** The five repairs and every passage they touched; all fifteen seeded targets in full (statement, route, Checks, locators); the remaining sections 1.1, 1.2, 1.4, 2.2, 3.1, 3.5, 3.8–3.10, 4.1, 4.4, 4.5 recomputed; the Conventions; every supplier citation resolved again at main `42813dd` and at the open heads; every backticked library name at the pins; both gaps; the six maintainer notes; the plan (44 targets: 26 theorems, 17 definitions, 1 example; each definition has an API list and at least three tests).

**Principles.** No route-specific shortcut (no separability unless stated; every `d ≥ 1`; disconnected, zero-dimensional and empty manifolds treated); no copied passage, algorithm, `set_option` or sorry'd data; layers named by their mathematics; no pull-request number, date, round label, TeX delimiter or machine path in the README (grep: only "Lemma" in source locators and "Rosenblum's lemma" matched). The one re-planned object is R01.

**Adversarial table** (values computed this round).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 1.3 reduced restriction | `diag(1,2,3)`, `U = span(e₁,e₃)`; `U = 0`; `U = ℋ` | `Q` commutes with `R(i)`; for `x = R(z)y`: `AQx = zQx − Qy = QAx`; spectra `{1,3}`, `∅`, `{1,2,3}` | correct |
| 1.4, maximal vector per type | `μ_ψ = Leb|[0,1] + c + δ₅`; `f ∈ ℋ_sc`, `N` null for `μ_{P_sc ψ}` | `μ_f(N) = μ_f(N ∩ S′ ∖ At)`; `μ_ψ` of that set is `0 + 0 + 0` | the API bullet holds |
| 1.5 interval criterion | `a = b = 0`, `A = 0`; `L²([0,1] ∪ [2,3])`; both directions | right side vacuous while `{0} ⊄ ∅`; mass of `(1,2)` is `0`; endpoints by closedness need `a < b` | correct |
| 1.6 min–max | `diag(1,3,5)`; `−1 ⊕ H₀`; core in place of `dom A` | `1, 3, 5, +∞`; `−1, 0, 0, …`; correction `ψ_k − Σ c_j^k η_j`, `c^k → 0`, keeps `ψ_k` in the core and orthogonal | correct, including "any core" |
| 1.6 counting clause | `diag(1,3,5)`, `λ = 4` | `dim ran P((−∞,4)) = 2 = #{1, 3}` | true; locator is R03 |
| 1.6 form order | Neumann and Dirichlet on `(0,1)` | `(n−1)²π² ≤ n²π²`; `Q(D) ⊊ Q(N)` | correct |
| 1.7 intertwining, chain rule | `H₁ = 0`, `H₂ = 1` on `ℂ`; `H₂ = H₁ + c` | `e^{it}ψ` converges only for `ψ = 0`; `e^{itc}` | `Ωe^{−isH₁} = e^{−isH₂}Ω` as teschl (12.6); chain rule holds pointwise |
| 1.8 definition, truncation | `x = 1_{[0,1]}`, `m = −1, 0, 1`; `x = |λ|^{−1/4}1_{[−1,1]}` | density `1 ≤ m²`: true, false, true; removed mass `2∫_0^{m^{−4}} λ^{−1/2} = 4/m²` | correct |
| 1.8 Rosenblum bound | rank-one `C`, `x = m·1_{[0,1]}`; `m = 0` | both sides `2πm²`; `m = 0` forces `x = 0`, and `0 ≤ 2π·0·⊤ = 0` in `ℝ≥0∞` | correct; kato57 line 92–96 |
| 1.8 square root | `V = diag((−1)^{n+1}/n²)` | `Σ 1/n² = π²/6` on both sides; `nuclearENorm` is the sum of singular values (`Nuclear/Basic.lean:53`) | correct |
| 1.9 Pearson | `J = 1`; `J = 0`; derivative | `d/du ⟪ψ_u, Jφ_u⟫ = i(⟪H₂ψ_u, Jφ_u⟫ − ⟪ψ_u, JH₁φ_u⟫) = i⟪ψ_u, Cφ_u⟫`; `e^{isH₂}W(t) = W(t+s)e^{isH₁}` | correct; yafaev04 line 193–194 |
| 1.9 Kato–Rosenblum | `V = 0`, `H₁ = diag(1,2)`; `H₁ = M_x`, `H₂ = 2M_x` | `W = P_ac = 0`, `Ω = 1`; `∫_0^1 e^{itx}dx = (e^{it} − 1)/(it) → 0`, norm `1` | correct; kato57 (1.1)–(1.3) at line 25–35 |
| 2.1 equivalence | `A = 2` on `ℂ`, `γ = 1, 2, 3`; `ℋ = 0`; `M_x` | true, true, false in all three clauses; all true; all false | correct (R06 is about ownership) |
| 2.3 bound | `d > max(a/(1−b), a + b|γ|)`, cases `|γ| ≤ d`, `|γ| > d`; `γ = 0`, `a = 1`, `b = ½` | `a/d + b < 1`; `(a + b|γ|)/d < 1`; bound `−2`; `sup_{s ≥ γ}|s|/(s − μ) ≤ max(1, |γ|/d)` | correct |
| 2.3 sign | `A = 2`, `V = 1`, `μ = 0` | `(1 − VR_A(0))(A − 0) = (3/2)·2 = 3` | correct |
| 3.1 Green pairing | `v = a + ib`, `u = c + id` | `conj(v)Δu = aΔc + bΔd + i(aΔd − bΔc)`, matching the four gradient terms | conjugate-linear in `v` |
| 3.2 initial operator | `(0,1)`: `eˣ`, `e^{−x}` | `(−∂² + 1)e^{±x} = 0`, both in `L²(0,1)` | not essentially self-adjoint; bms02 line 151–155 |
| 3.3 maximal operator | `e^{−|x|}`; adjoint pairing | `−u″ = −u + 2δ₀`; `∫ w ū = ∫ v Δū` for all test `u` gives `Δv = w` | correct |
| 3.4 forms | `(0,1)` | Dirichlet `n²π²`, `n ≥ 1`; Neumann `n ≥ 0`; `1 ∈ H¹ ∖ H¹₀` | correct; teschl line 2914–2917, 2960–2966 |
| 3.5 cutoffs | clamp, `η = 1/8`, `ε = 1/k` | gradient `≤ 2·(2/k) = 4/k`; `(0,1)`: `1 ≤ (4/k)(½)` fails for `k > 2` | correct |
| 3.6 estimates | `χ = χ_k` | `‖χdu‖² ≤ ‖Δu‖‖u‖ + ½‖χdu‖² + 2 sup|dχ|²‖u‖²`; for `Δu = −u`: `‖χu‖² ≤ 2 sup|dχ|²‖u‖²` | constants `2, 4` and `2` hold |
| 3.7 vocabulary | `S¹`, `ℝ`, point, `ℝ²/ℤ²`; `λ₁⁺ = λ₁` | `0, 1, 1, 4, 4`; `λ₁⁺ = 0`; `+∞`; `4π²` four times; `σ_ess ⊆ σ ∖ {0}` when `0` is isolated and simple | correct |
| 3.8, 3.9 compact case | circle, `V = 1`; `V = 1_{[0,π)}`; `N` points; one point, `s = 1` | `1, 2, 2, 5, 5`; `u(0) = u′(0) = 0` forces `u = 0`; `μ_n = +∞` for `n > N`; `T = i`, `T − T* = 2i = 2i·TT*` | statements correct; R01 |
| 3.10 cusp sequence | `F = e^{itr}ψ((r − n)/n)` | `Δ(e^{r/2}F) = e^{r/2}(F/4 − F″)`; `‖u_n‖² = wn‖ψ‖²`; `3·2^j < 2^{j+2}` | correct |
| 3.10 definition | scaling by `c = 2` | `(1, 1) ↦ (2, 2)`, area `1` both | R05 |
| 4.1 norms | Gaussian, `d = 1` | `‖u″‖² = 3π²/√2`, `‖ξ²𝓕u‖² = 3/(16π²√2)`, ratio `16π⁴` | correct |
| 4.2 free Laplacian | `d = 1`, `ψ = e^{−πx²}`; `d = 0` | density `e^{−λ/(2π)}/(2π√λ)`, mass `2^{−1/2}`; `q(ψ) = π/√2`; `σ_ess = ∅` at `d = 0` | (7.26) at teschl line 7137–7143; agrees with QuantumFoundations §8.2 at `n = 1` |
| 4.3 compactness | radius `R`; `s = 0, 1` | error `≤ ‖V‖_∞/(1 + 4π²R²) + ess sup_{|x|>R}|V|`; `(s − i)⁻¹ = (s + 1)⁻¹(1 + (1 + i)/(s − i))`: `i`, `(1 + i)/2` | correct; teschl line 7213–7228 |
| 4.4 square well | `k = 0.739` | `k tan k = 0.673`, `√(1 − k²) = 0.674`, `E ≈ −0.454` | correct |
| 4.5 potential | `cos x + cos(√2 x)` | `−2` not attained: `(2a + 1)√2 = 2b + 1` has no integer solution | correct; kps26 line 20–50 (`d ≥ 2`, `l > d`) |
| R02 instance | `Γ(2)`, `Γ₀(4)`, `Γ₀(2)` | `−I` in all three; elliptic points `0, 0, 1`; area of `Γ(2)\ℍ` is `6·π/3 = 2π` | finding |

**Sources.** Twenty-one manifest entries (eight certified, thirteen settled uncertified); every key cited in the README is in the manifest; nothing was fetched. Read at the text for the fifteen sampled targets: teschl line 2912–2918, 2958–2967, 3042–3046, 3280–3306, 4313–4334, 4348–4368, 4386–4428, 4940–4948, 5040–5072, 5683–5722, 6275–6282, 6356–6361, 7084–7092, 7135–7144, 7211–7230, 9576–9590, 10580–10624; kato57 line 15–40, 88–114; yafaev04 line 78–145, 188–208; rosenblum57 line 66–96; bms02 line 124–131, 148–158, 176–184, 240–258; hm23 line 38–48, 58–67, 102–106; kps26 line 5–60; lp80 line 249–257, 277–302. Printed pages confirmed from the page headers: Lemma 2.24 (80), Corollary 4.6 (116), Theorem 6.4 (135), Lemma 6.17 (145), Theorem 7.8, Lemma 7.9 and (7.26) (168), Lemma 7.11 (170), Theorem 10.2 (222). Each supports its statement with the hypotheses the README adds, except the three locators of R03. No locator is flagged as unverified by the author.

**Pinned libraries** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`). Every backticked library name in the README was searched at the pins and found; opened this round: `ProjValMeasure` (`ProjValMeasure/Basic.lean:91`), `norm_sq_proj_apply` (275), `diag_univ` (299), `proj_mul_comm` (200); `LinearPMap.resolvent_sub_resolvent` (`Resolvent/Basic.lean:280`); `IsReducing.isSelfAdjoint_restrict` (`Reducing.lean:144`); `IsSelfAdjoint.isFormalAdjoint` (`SelfAdjoint.lean:105`); `add_of_isRelativelyBounded` (`KatoRellich.lean:118`); `IsRelativelyBounded` (`RelativeBound.lean:56`); the compact-resolvent equivalence (`CompactResolvent.lean:69`) and eigenbasis (`Eigenbasis.lean:113`); `nuclearENorm` (`Nuclear/Basic.lean:53`) and its compactness theorem (153); `hilbertSchmidtEnergy_indep` (`HilbertSchmidt/Basic.lean:150`); the Hilbert–Schmidt compactness theorem (`Columns.lean:257`); `laplaceBeltrami` (`Laplacian.lean:238`); `integral_mul_laplaceBeltrami` (`DivergenceTheorem.lean:312`); `isLocallyFiniteMeasure_riemannianVolume` (`Volume.lean:179`); `HyperbolicMetric` (`Hyperbolic.lean:51`); `W1p` (`Sobolev/W1p/Basic.lean:372`); Mathlib `MemSobolev` (`Sobolev.lean:153`), `memSobolev_iff_exists_smulLeftCLM_fourier` (222, multiplier `(1 + ‖x‖²)^{s/2}`), `MemSobolev.laplacian` (348), `eq_singularPart` and `eq_withDensity_rnDeriv` (`Lebesgue.lean:404, 522`), `mutuallySingular_singularPart` (106), `IsCompactOperator.comp_clm` (`Compact/Basic.lean:271`), `isCompactOperator_of_tendsto` (459), `adjoint_apply_of_not_dense` (`LinearPMap.lean:172`), `fourierTransformₗᵢ` (`LpSpace.lean:51`). Neither library has an essential spectrum of a partial operator or a Weyl criterion for it.

**Suppliers, resolved now.** Main: UnboundedOperators UO-A01 (README line 241), A02 (259), A06 (303), A07 (309), C01 (523), C02 (533), C03 (552), D06 (703), E01 (900), E04 (983), E05 (1027), E06 (1033), each read; SelfAdjointSpectralTheory SA-B44–45, B85, C12–C19, C25–C28, C39, C44, C52–C54, C86, D02, D12, D18, D22, E01–E13, E26–E30, E44, E47, each located; VariationalMethods 4.4 (782, `CompactFormPair.rayleighMinMax`), 5.1–5.2; ComplexKahlerGeometry K5a and K5a.ComponentwiseCompact (2092); RiemannianGeometry R7.8; `Completed/HopfRinow`; PDE §1.2, §1.3, §6.3; SmoothBundlesConnections B2.2 (605); PseudodifferentialOperators P1.0; HilbertModules H6 (705); OperatorIdeals OI-B29–B36, OI-C14; FuchsianOrbifolds Layer 3 (563). Open heads: QuantumFoundations §8.2 and §9.5; CongruenceSpectralGap §0.2, §0.6; AutomorphicSpectralTheory §1.16a, §§4.1–4.4; MaassForms §0.1. The open revision of SelfAdjointSpectralTheory keeps every cited SA id reachable through its "Former SA numbering" table (checked id by id, ranges included). No citation is of a later roadmap.

**Declared gaps.** `gap:weyl-criterion`: main UO-C02 names Lemma 6.17 in a locator sentence and in its Fredholm proof, and its three API items do not include the criterion; no other roadmap or pin states it; the `needs` sentence matches teschl line 6277–6281; same slug in the plan and the README. `gap:spectral-integral-resolvent`: main UO-A02 proves the inverse only for the measure of a given operator; precise and minimal; same slug in both places; its attachment is R08. Both name a supplier and a section. The acceptance of a later round would be conditional on both.

**Maintainer notes.** All six were repaired in earlier rounds and remain so: (1) lines 92–99 and 109–110; (2) lines 68–71, 282–283, 469–470; (3) the first gap; (4) lines 1295–1303 and 1335–1336; (5) the second gap; (6) lines 260–267. The closing instruction is met at lines 1340–1343. The ownership decisions are respected and not reopened.

**Duplication and overlap.** `roadmaps grep` over main and the open heads for Kato–Rosenblum, Pearson, wave operators, Gaffney, Chernoff, min–max, absolutely continuous spectrum, essential closure, maximal spectral vector, Schrödinger operator and the Weyl criterion. No second owner of Layer 1's scattering statements or spectral parts, of the complete-manifold theorem, or of bounded potentials on `ℝ^d`. RelativisticQuantumFieldTheory's wave operators are Haag–Ruelle's. SobolevDifferentialForms' "Gaffney" is the Gaffney inequality for forms on a cube, a different statement. The hits that matter are R01 (RiemannianGeometry R5c) and R06. `overlaps.md` reports no pull request changing this roadmap, no dropped id and no revision-only id; I found none.

Overlap check: read UnboundedOperators (main), VariationalMethods (main), SelfAdjointSpectralTheory (main and its open revision), CongruenceSpectralGap, QuantumFoundations, AutomorphicSpectralTheory (open), and RiemannianGeometry R5b–R5c (main); shared: the pp/ac/sc subspaces — UnboundedOperators UO-C03; the free Hamiltonian — QuantumFoundations §8.2; `L² + L^∞` potentials on `ℝ³` — UnboundedOperators UO-E06; the congruence Laplacian — CongruenceSpectralGap §0.2; `Δ⁺ + q` on closed manifolds — RiemannianGeometry R5c (R01); the form-bound criterion — SelfAdjointSpectralTheory SA-E11 (R06). RelativisticQuantumFieldTheory was searched, not read.

**Supplier-order gate.** Output of the prescribed command:

```
candidate: SchrodingerOperatorsAndSpectralTypes is not in the merge order yet; checked as if placed after QuantumFoundations (the intake inserts it when its design is accepted)
depcheck: 207 roadmaps, 1901 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

**Shape.** Summary, Scope, Conventions, supplier contracts, build paragraph, four layers each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. Every definition has API bullets and at least three Checks; every theorem has hypotheses and a locator, except the chain rule (R03). The layer order is not a source's: Layer 1 draws on teschl §3.3, §4.3 and §12.1 and on kato57, Layer 2 on §6.1, Layer 3 on no chapter of teschl, Layer 4 on §7.2 and §10.1. A design has no `Suggested.lean`: headline statability, padding and binders are package-stage checks. The README attributes no Lean name to this roadmap.

Source independence: 16 passages compared with 8 sources (teschl, kato57, yafaev04, rosenblum57, bms02, hm23, kps26, lp80), none shared beyond standard names and formulas; largest share teschl, 33 of 109 locators; contents compared with teschl: independent.

## Not verifiable

- Elaboration: not available (this lane does not elaborate). No Lean command was run.
- The thirteen settled uncertified texts (`strichartz83`, `chernoff73`, `kato76`, `cfks87`, `gaffney54`, `rs1`, `rs2`, `rs3`, `grigoryan09`, `chavel84`, `iwaniec02`, `lp76`, `pearson78`) were not read. Of the sampled targets, 3.4 and 3.6 rest on their locators alone for those sources, and on `bms02`, `teschl` and computation otherwise. Pearson's proof is not in the readable texts; yafaev04 states the theorem only. The section number given for the chain rule in R03 (`rs3` §XI.3) is from memory of that text, not read.
- Published numbering of the arXiv copies of `bms02`, `hm23`, `kps26` was not compared with the journal versions.
- Ownership against open pull requests was checked through `roadmaps grep` and the roadmaps named in the overlap line; other open heads were searched by keyword only.

## Source issues

- **Misprint** in teschl at Theorem 6.4, equation (6.3), printed page 135: the source says the second entry of the maximum is the ambient coefficient over the relative coefficient minus one; it should be over one minus the relative coefficient; affects a stated result.
- **Misprint** in teschl at Theorem 6.4, proof, printed page 135: the source says the factor uses his resolvent at the same signed point as the shifted operator; it should be at the opposite point, since his resolvent is the inverse of the operator minus the point; affects the proof.

## For the human reviewers

- **Licence.** `teschl` is read from the author's online edition of an AMS book; 33 of 109 locators point into it. The wording and arrangement checks found nothing shared (`sources.toml`, entry `teschl`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b4f6a638f1cd1200ce7ac33d3b74f947fe002c85", "job": "REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~5", "model": "fable", "worker": "chris-x52"} -->
