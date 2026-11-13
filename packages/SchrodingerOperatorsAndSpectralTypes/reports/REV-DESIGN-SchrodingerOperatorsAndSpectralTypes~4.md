<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13815#issuecomment-6849192020 -->
Review (claude) of aeba54f

Verdict: needs_changes

1. **F01** (P2) The congruence Laplacian is handed to roadmaps that are earlier and prove it themselves

   **Location:** lines 1163–1166 ("3.6 gives the essential self-adjointness and maximal domain that AutomorphicSpectralTheory §1.16a and CongruenceSpectralGap §0.2 use") and 1357–1361 (Downstream consumers); `design/plan.json` `consumers` entries AutomorphicSpectralTheory, CongruenceSpectralGap, MaassForms.

   **Claim:** those three roadmaps consume 3.6, 3.7 and 3.10.

   **Witness:** CongruenceSpectralGap (open pull request #1504), `TauCetiRoadmap/CongruenceSpectralGap/README.md:174`: on `Γ(N′)\ℍ` it proves "by Gaffney's cutoff argument" essential self-adjointness itself; AutomorphicSpectralTheory (#925) README line 1277 likewise. Merge order: lines 96, 156, 157; this roadmap is placed after QuantumFoundations, line 212.

   **Exact repair:** The instance `X = Γ(N′)\ℍ` of 3.6 (and "kernel = constants" of 3.7) has two owners and the README states the supply in the impossible direction: no roadmap anywhere cites this one (`roadmaps grep` finds no occurrence of its name), and a roadmap at position 96, 156 or 157 cannot consume one placed after 212. Settle it as an overlap, the earlier roadmap keeping its statement:

   1. In `## Scope and ownership` add a bullet: CongruenceSpectralGap §0.2 proves, for a torsion-free congruence cover `Γ(N′)\ℍ`, essential self-adjointness of `d*d` on `C_c^∞`, the maximal domain and `ker = ℂ·1`, and AutomorphicSpectralTheory §1.16a the `Γ₀(N)` orbifold realisation; both are earlier and are not restated; 3.6 and 3.7 are the statements for every complete Riemannian manifold, and agree with theirs on that surface.
   2. Replace the sentence at lines 1164–1166 by the comparison: on `X = Γ(N′)\ℍ`, `Δ_X` of 3.6 is the operator CongruenceSpectralGap §0.2 constructs (both are the closure of the same operator on `C_c^∞(X; ℂ)`), and 3.7's kernel `ℂ·1` is its kernel statement; 3.10 adds `[1/4, ∞) ⊆ σ_ess`.
   3. In `## Downstream consumers` and in the plan's `consumers`, delete AutomorphicSpectralTheory, CongruenceSpectralGap and MaassForms; RelativisticQuantumFieldTheory, RicciFlow, SpectralManifolds and PositiveMass (order lines 214, 215, 233, 290) are later and may stay.

   Tested on the refuting instance: for `Γ = Γ(2)`, `N′ = 6`, `Γ(6)\ℍ` is a connected complete finite-area surface; CongruenceSpectralGap §0.2 gives essential self-adjointness and kernel `ℂ·1`, 3.6–3.7 give the same two conclusions (one component of finite volume, so `dim ker = 1`); after the repair the README names one owner for that instance and no upward consumer.

2. **F02** (P3) `Δ` carries two opposite signs

   **Location:** lines 144–153 (Conventions: "`Δ = −div grad` is nonnegative", next bullet "`−Δ` is multiplication by `4π²‖ξ‖²`"), line 1203 ("`Δu = (4π²‖x‖² − 2πd)u`"), Layer 4 and the Summary (`−Δ + V`).

   **Claim:** one sign convention for `Δ` holds throughout.

   **Witness:** with the stated convention and `ψ = e^{−πx²}`: `Δψ = −ψ'' = (2π − 4π²x²)ψ`, whose transform is `+4π²ξ²ψ̂`, so `Δ` (not `−Δ`) has multiplier `4π²ξ²`; line 1203 at `x = 0` gives `−2πd`, the convention gives `+2πd`.

   **Exact repair:** Keep the objects (they are pinned correctly by `𝓕H₀𝓕⁻¹ = M_{4π²‖ξ‖²}` and by the QuantumFoundations contract, "Mathlib's sign of `Δ`"), and fix the notation: in the Laplacian-sign bullet add that on `ℝ^d` in Layer 4, in the Fourier bullet and in the Summary, `Δ` denotes Mathlib's `Σ ∂ⱼ²`, so that `H₀ = −Δ` there equals Layer 3's `Δ_X` for `X = ℝ^d`; repeat it in the "Throughout" line of Layer 4. Then line 1203 reads correctly (`Σ∂ⱼ² e^{−π‖x‖²} = (4π²‖x‖² − 2πd)u`), the Fourier witness reads `−ψ'' = (2π − 4π²x²)ψ ↦ 4π²ξ²ψ̂`, and the 3.6 Check "`Δ_X = H₀`" is `−Σ∂ⱼ² = −Σ∂ⱼ²`.

3. **F03** (P3) "Hilbert–Schmidt ⇒ compact" is cited without its identifier

   **Location:** lines 347–348 ("OperatorIdeals OI-B29–OI-B36 … and the corollary Hilbert–Schmidt ⇒ compact"), line 1269; plan 4.3b prerequisite `OI-B32-OI-B41`, plan supplier sections `OI-B29-OI-B41`.

   **Claim:** the cited range contains the compactness statement.

   **Witness:** main `TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md:563`: "OI-C14 — Hilbert–Schmidt operators are compact"; OI-B37–B41 (lines 365–376) are Minkowski, domination, adjoint invariance, the ideal inequality and the family. The statement is also at the pin.

   **Exact repair:** Cite the pinned theorem `ContinuousLinearMap.isCompactOperator_of_hilbertSchmidtEnergy_ne_top` (`TauCeti/Analysis/InnerProductSpace/HilbertSchmidt/Columns.lean:257`) in the Tau Ceti contract and in the Needs of 4.3, with OI-C14 as its roadmap identifier; in the plan, replace the 4.3b prerequisite by `tauceti:` that name and OI-C14, and the supplier sections by `OI-B29-OI-B36`, `OI-C14`. Tested: the rank-truncated kernel operator `M_{V_R}𝓕⁻¹M_{f_R}𝓕` of 4.3 has finite energy `‖V_R‖₂²‖f̌_R‖₂²`, which is the hypothesis of that theorem.

4. **F04** (P3) UnboundedOperators is cited at a path it does not have

   **Location:** lines 57 and 251 ("TauCetiRoadmap.UnboundedOperators"); plan supplier `"UnboundedOperators"`.

   **Claim:** the supplier sits at the top level of the roadmap tree.

   **Witness:** on main it is `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md`, beside SelfAdjointSpectralTheory and OperatorIdeals, which the README does write as `TauCetiRoadmap.OperatorTheory/…` (lines 49, 233, 345).

   **Exact repair:** Write `TauCetiRoadmap.OperatorTheory/UnboundedOperators` in the two headings and `OperatorTheory/UnboundedOperators` in the plan's supplier entry and in the two `gaps[*].supplier` fields if the intake resolves suppliers by path (the dependency gate resolves the bare name today: 0 problems).

5. **F05** (P3) The Hilbert basis in Rosenblum's bound is unbound

   **Location:** line 614: "`‖C‖²_HS = ContinuousLinearMap.hilbertSchmidtEnergy C b`".

   **Claim:** the right-hand side is a defined quantity.

   **Witness:** the pinned definition (`HilbertSchmidt/Basic.lean:89`) is `hilbertSchmidtEnergy (T : E →L[𝕜] F) (b : HilbertBasis ι 𝕜 E) : ℝ≥0∞`; no `b` is introduced in 1.8.

   **Exact repair:** "for every Hilbert–Schmidt `C` and every Hilbert basis `b` of `ℋ` (the energy is independent of `b`, OperatorIdeals OI-B35), `∫_ℝ ‖C e^{−itH} x‖² dt ≤ 2π m² · hilbertSchmidtEnergy C b`", the inequality read in `ℝ≥0∞`. Tested on the Check at line 638: `C = ⟨φ, ·⟩φ` has energy `Σ_b |⟨φ, b⟩|²‖φ‖² = 1` for every basis, and both sides are `2πm²`.

Five findings: one P2 and four P3; one blocking. This is a design review; the README, the plan and the sources manifest were not changed. The six findings of round 3 are all repaired. No finding of the last repair report was marked not actionable, so nothing is re-raised. Line numbers below refer to `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md` unless another file is named.

Since round 3, UnboundedOperators and VariationalMethods have merged: both are on main (`TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md`, `TauCetiRoadmap/VariationalMethods/README.md`). Every UO and VariationalMethods citation was resolved again against main, not against the former pull-request heads.

## Previous findings, checked first

| Round 3 finding | Status | Repaired passage and what was verified |
|---|---|---|
| R01 (P1) Weyl criterion without supplier | repaired | Lines 272–277: "What UnboundedOperators must provide (gap:weyl-criterion): in §3.2 (UO-C02), Weyl's criterion as a stated item"; line 1138–1141 names the direction used; plan `gaps[0]` has the same slug and 3.10b lists `gap:weyl-criterion`. Main UO-C02 (UnboundedOperators README line 535–543) still mentions Lemma 6.17 only inside its Fredholm proof and lists three API items, none the criterion, so the gap is real. teschl line 6277–6281 matches the `needs` sentence. |
| R02 (P1) bare-PVM recovery | repaired | Lines 114–122 and 279–284: the bounded integral of `(z − s)⁻¹` "maps `ℋ` into `dom A_P` and is a two-sided inverse of `z − A_P` (UnboundedOperators UO-A02, gap:spectral-integral-resolvent)". Main UO-A02 (line 261) proves the inverse only for the measure of a given `A`; UO-A03 (line 273–275) obtains its product law by transport to `P_A`, so no main item gives it for a bare `P`. Plan `gaps[1]` matches. |
| R03 (P2) change of resolvent point | repaired | Lines 1260–1268: `M_V (H₀ − i)⁻¹ = M_V (H₀ + 1)⁻¹ [I + (1 + i)(H₀ − i)⁻¹]`. Recomputed from the pinned identity `R(λ) − R(μ) = (μ − λ) R(λ) R(μ)` (Tau Ceti `Resolvent/Basic.lean:280`) at `λ = −1`, `μ = i`: `−(H₀+1)⁻¹ + (H₀−i)⁻¹ = (1+i)(H₀+1)⁻¹(H₀−i)⁻¹`. Scalar values in the table. |
| R04 (P2) UO-E06 boundary | repaired | Lines 91–100 and 1302–1306: "UnboundedOperators UO-E06 owns real `V = V₂ + V_∞` … in dimension three"; main UO-E06 (line 1035) says the same and sends Coulomb to a consumer; QuantumFoundations §9.5 at its head owns the Coulomb model through UO-E06. |
| R05 (P3) contract synchronisation | repaired | Lines 239–246 list SA-C86 and SA-E30; lines 67–70, 261–262 and 446–449 attribute arbitrary-`ℋ` restriction self-adjointness to 1.3, SA-C19 and `LinearPMap.IsReducing.isSelfAdjoint_restrict` (`Reducing.lean:144`). Main UO-C03 (line 554) still lists restriction self-adjointness only "in the finite-control-measure case". |
| R06 (P3) normal resolvent | repaired | Lines 1079–1085: "SA-C86 applied to the compact **normal** operator `T`", with `T − T* = 2is·T T*`; recomputed below. `Eigenbasis.lean:113` takes a self-adjoint `A` with compact resolvent, as the text says. |

Repaired patterns searched in the rest of the text: "Weyl" occurs only with the gap (lines 60, 272–277, 1138–1141, 1146, 1175) and as Weyl's theorem of UO-E04 (line 265), which UO-E04 does state; no other resolvent-point change is silent (2.3 writes `(A − μ)⁻¹ = −R_A(μ)`, 3.9 uses one nonreal point throughout); SA-C86 in 1.8 is applied to a self-adjoint, hence normal, `V`; every UO-E06 mention is confined to `ℝ³`.

## Verified sound

**Scope of this round.** All six repairs; every passage they changed; the fifteen seeded targets in full; the headline theorems; the Conventions; all supplier citations (resolved again because two suppliers moved to main); every backticked library name; the two declared gaps; the six maintainer notes. For untouched, unsampled text (1.1, 1.2, 1.6, 1.7, 2.2, 3.2, 3.4, 3.6, 3.10, 4.1, 4.4, 4.5) the round-3 table carries computed values; I recomputed the rows marked † below as spot checks and found them correct.

**Principles.** No route-specific shortcut (no separability unless stated, every dimension `d ≥ 1`, disconnected and zero-dimensional manifolds included); no re-planned roadmap apart from the overlap of R01; no copied passage, algorithm, `set_option` or sorry'd data; four layers named by their mathematics, Layers 3 and 4 independent, order forced by the dependency lines. No process words, pull-request numbers, TeX delimiters or machine paths in the README (grep over the file: only "Lemma" in source locators matched).

**Adversarial table** (values computed this round).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions, bare PVM with gap | Dirac at `2` on `ℂ`, `z = i`; `diag(n)` on `ℓ²`; `ℋ = 0` | `(i−2)·(i−2)⁻¹ = 1`; `n²/(1+n²) ≤ 1` so the range lies in the second-moment domain; all integrals `0` | holds given the gap |
| 1.3 reduced restriction | `diag(1,2,3)`, `U = span(e₁,e₃)`; `U = 0`; `U = ℋ` | `Q` commutes with `R(i) = diag((i−1)⁻¹,(i−2)⁻¹,(i−3)⁻¹)`; `A Q x = Q A x` from `x = R y`: `z Q x − Q y`; spectra `{1,3}`, `∅`, `{1,2,3}` | correct; teschl line 3282–3304 and 4945–4946 (pp. 80, 116) say what is cited |
| 1.4 definitions | `N = ℚ`, `(0,1)`, `[0,1]∪{2}`; `diag(1,2)` vectors `(1,1)`, `(1,0)` | `N^ess = ∅, [0,1], [0,1]`; `N^ess ⊆ closure N`; `μ = δ₁+δ₂` dominates, `δ₁` does not dominate `δ₂` | correct; (3.79) at teschl line 4315–4319 |
| 1.4(1) all three types | `M_x ⊕ diag(q_n)`; atom at `λ` for pp | ac mass of `(λ−ε,λ+ε)` is `2ε > 0` for `f = 1`; for pp an eigenvector charges every interval; annuli `J_m` chosen with strictly increasing `m` are disjoint | equivalence holds in both directions |
| 1.4(3), maximal measure per type | `μ_ψ = Leb|[0,1] + c + δ₅` | `{h > 0}^ess = [0,1]`; a set null for the ac part is `Leb`-null on `{h>0}` and `μ_ψ`-null off the singular carrier | correct (teschl Lemma 3.15, line 4326–4332; 4424) |
| 1.4(4) | `ℓ²(ℝ)` coordinate operator | `μ_ψ` has countably many atoms, `μ_{e_t} = δ_t` for another `t` | separability needed, as stated (teschl Lemma 3.16 under his standing separability) |
| 1.5 interval criterion | `a = b = 0`, `A = 0`; `L²([0,1]∪[2,3])`; fat Cantor `K` | right side vacuous, `{0} ⊄ ∅`; mass of `(1,2)` is `0`; `K^ess` has empty interior | all three items correct; `a < b` needed |
| 1.8 definition and API | `x = 1_{[0,1]}`, `m = −1, 0, 1, 2`; `x = |λ|^{−1/4}1_{[−1,1]}` | density `1 ≤ m²`: true, false, true, true; `{h ≤ m²} = {|λ| ≥ m⁻⁴}`, removed mass `2·2·m⁻² = 4/m²` | correct |
| 1.8 Rosenblum bound | `x = m·1_{[0,1]}`, rank-one `C`; `H = 0` on `ℂ` | `∫|⟨φ,e^{−itλ}x⟩|²dt = 2π∫m²|φ|² = 2πm²`, bound `2πm²·1`; atomic control: left side `∞` | `2π` correct; kato57 line 92–96, 111 |
| 1.8 square root | `V = diag((−1)^{n+1}/n²)` | `Σ 1/n² = π²/6` on both sides | correct |
| 1.9 Pearson | `J = 1`, `C = V`; `J = 0`; `ℋ = ℂ`, `H₁ = 0`, `H₂ = c` | derivative of `⟪e^{−iuH₂}ψ, Je^{−iuH₁}φ⟫` is `i⟪ψ_u, Cφ_u⟫`; `W = 0`; `P_ac(0) = 0` so `W = 0` although `e^{itc}` has no limit | statement is yafaev04 Theorem 1.8 (line 193–194); intertwining `e^{isH₂}W(t) = W(t+s)e^{isH₁}` checked |
| 1.9 Kato–Rosenblum | `V = 0`, `H₁ = diag(1,2)`; `diag(1/n²)`, `V = −H₁` | `W = P_ac = 0`, `Ω = 1`; `ℋ_ac = 0` both sides, `D_± = 0` | (1.1)–(1.3) of kato57 line 25–35 match, including `W* = W(H₁,H₂)` |
| 2.1 equivalence | `A = 2` on `ℂ`, `γ = 1, 2, 3`; `ℋ = 0`; `M_x` on `L²(ℝ)` | true, true, false in all three clauses; all true; all false | correct; SA-D22, SA-E08, SA-E11 on main say what the route uses |
| 2.3 bound | `γ = 0`, `a = 1`, `b = 1/2`; `A = λ ≥ γ`, `V = −(a+b|λ|)`; `γ = −1`, `λ ∈ [−1,0]` | `−max(2,1) = −2`; `‖A(A−μ)⁻¹‖ = sup_{s≥γ}|s|/(s−μ) ≤ max(1,|γ|/d)`; `λ(1+b) − a ≥ γ − a − b|γ|` | correct; teschl's (6.3) translated as the README says |
| 2.3 sign | `A = 2`, `V = 1`, `μ = 0` | `(1 − V R_A(0))(A − 0) = (3/2)·2 = 3` | correct |
| 3.1 Green | circle, `u = v = e^{inθ}`; pairing expansion | `2πn²` both sides; `(a − ib)(c + id) = ac + bd + i(ad − bc)` | conjugate-linear in `v`, as stated |
| 3.3 maximal operator | `e^{−|x|}`; `χ/|x|` on `ℝ³` | `−u'' = −u + 2δ₀`; `4πδ₀ +` smooth | bms02 line 151–155 and 179–180 match |
| 3.5 cutoffs | clamp, `η = 1/8`, `ε = 1/k`; `(0,1)` | gradient `≤ 2·(1/k + 1/k) = 4/k`; `g ≥ 7/8` where clamp `= 1`; `1 ≤ (4/k)(1/2)` fails for `k > 2` | correct; R7.8 item 8 on main (RiemannianGeometry README line 3708) gives the smoothing |
| 3.6 cutoff estimate † | `χ = χ_k` | `‖χdu‖² ≤ ‖Δu‖‖u‖ + ½‖χdu‖² + 2 sup|dχ|²‖u‖²`; for `Δu = −u`: `‖χu‖² ≤ sup|dχ|²‖u‖²` | README's constants `2, 4` and `2` hold (the last with room) |
| 3.7 vocabulary | `S¹`, `ℝ`, point, `ℝ²/ℤ²` | kernel dimension `1, 0, 1`; `λ₁⁺ = 1, 0, +∞`; `λ₁ = μ₂ = 1, 0, +∞`; torus `λ₁..λ₄ = 4π²` | `λ₁⁺ = λ₁` under the stated hypotheses; hm23 line 41–47 as cited |
| 3.8 compact case | `N` points; `∅`; `S²` | `μ_n = 0` for `n ≤ N`, `+∞` after, supplier junk `0` for `k ≥ N` (VariationalMethods README line 114–116, 786); `σ = ∅`; `0, 2, 2, 2, 6` | the range `k < dim L²(X)` is exactly the supplier's non-junk range |
| 3.9 resolvent route | point, `V = c`, `s > |c|` | `T = (c − is)⁻¹`, `T − T* = 2is/(c² + s²) = 2is·TT*`; eigenvalue `is + T⁻¹ = c` | normal, not self-adjoint; correct |
| 3.9 step potential | circle, `V = 1_{[0,π)}` | Rayleigh quotient of `1` is `1/2`; `(1−λ)u'(0) = −λu'(0)` forces `u'(0) = 0` | no smooth eigenfunction; `H²` claim only |
| 3.10 cusp sequence † | `f = e^{itr}ψ((r−n)/n)` | `(∂_r² − ∂_r)(e^{r/2}f) = e^{r/2}(f'' − f/4)`; residual `−e^{itr}(2itψ'/n + ψ''/n²)`; `‖u_n‖² = wn‖ψ‖²`; supports `(2^{j+1}, 3·2^j)`, `3·2^j < 2^{j+2}` | correct; uses the gap direction only |
| 4.2 free Laplacian | `d = 1`, `ψ = e^{−πx²}`; `d = 0` | density `2·e^{−λ/(2π)}/(4π√λ)`, mass `Γ(½)√(2π)/(2π) = 2^{−1/2}`; `q(ψ) = 4π²·(4π)⁻¹·2^{−1/2} = π/√2`; `σ_ess = ∅` at `d = 0` | (7.26) at teschl line 7137–7143; QuantumFoundations §8.2 density at `n = 1` agrees |
| 4.3 compactness | cutoffs at radius `R`; `V = 1` | error `≤ ‖V‖_∞/(1 + 4π²R²) + ess sup_{|x|>R}|V|`; spectrum of `(H₀+1)⁻¹` is `[0,1]` | teschl Lemma 7.11 (line 7213–7228, p. 170) supports both orders |
| 4.3 change of point | `s = 0, 1, 3` | `i`, `(1+i)/2`, `(3+i)/10` on both sides; bracket modulus `(s+1)/√(s²+1)`: `1, √2, 4/√10` | identity and bound `≤ √2` hold |
| 4.4 Schrödinger | `V = c`; `d = 1` square well; `d = 3` vs `4`, `V = cos x₁` | `σ = [c,∞)`; `k tan k = κ` at `k = 0.739`: `0.739·0.911 = 0.673 = √(1 − 0.546)`; UO-E06 applies only at `d = 3` | correct; teschl Theorem 10.2 used only with decay |
| 4.1 norms † | Gaussian, `d = 1` | `E x² = 1/(4π)`, `E x⁴ = 3/(16π²)`: `‖u''‖² = (3π² − 4π² + 4π²)/√2`; ratio to `‖ξ²𝓕u‖²` is `16π⁴` | correct up to the sign notation of R02 |
| R01 instance | `Γ(6)\ℍ` | two owners of essential self-adjointness and of `ker = ℂ·1`; order positions 96/156/157 against 212 | finding |

**Sources.** Twenty-one manifest entries, eight certified, thirteen settled uncertified; every key cited in the README is in the manifest and nothing was fetched. Sampled locators read at the text: teschl line 3282–3304, 4315–4332, 4350–4366, 4388–4427, 4945–4946, 5044–5069, 5683–5720, 3043–3046, 6277–6281, 6358–6360, 7095–7143, 7213–7228, 9578–9589, 10595–10620; kato57 line 21–35, 92–111; yafaev04 line 116–122, 136–140, 191–206; rosenblum57 line 70–72, 80–95; bms02 line 128–129, 151–157, 179–182, 245–256; hm23 line 41–47, 60–66, 104–105; kps26 line 10–50; lp80 line 251–256, 279–301. Each supports its statement with the hypotheses the README adds (separability for Lemma 3.16, connectedness for bms02, decay for Theorem 10.2). Printed pages checked for Lemma 2.24 (80), Corollary 4.6 (116), Lemma 6.17 (145), Lemma 7.11 (170), (7.26) (168), Theorem 10.2 (222).

**Pinned libraries** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, as in the plan's baseline). All 57 backticked library names resolve; opened this round: `ProjValMeasure` and its fields `proj`, `diag`, `inner_proj` (`ProjValMeasure/Basic.lean:91–104`), `integral` (`Integral.lean:218`), `LinearPMap.resolvent` and `resolvent_sub_resolvent` (`Resolvent/Basic.lean:169, 280`), `IsReducing.isSelfAdjoint_restrict` (`Reducing.lean:144`), the compact-resolvent equivalence (`CompactResolvent.lean:69`, nonreal `z`), the eigenbasis theorem (`Eigenbasis.lean:113`), `IsRelativelyBounded` (`RelativeBound.lean:56`), `add_of_isRelativelyBounded` (`KatoRellich.lean:118`; the file has no core or lower-bound theorem, so 2.3 is new), `riemannianVolume` and its two instances (`Volume.lean:82, 179`, `Support.lean:36`), `laplaceBeltrami`, `divergence`, `integral_mul_laplaceBeltrami`, `HyperbolicMetric`, `Wkp`, `W1p`, `nuclearENorm`, `hilbertSchmidtEnergy`; Mathlib `MemSobolev` (`Sobolev.lean:153`, with `Fact (1 ≤ p)`), `HaveLebesgueDecomposition`, `eq_singularPart`, `eq_withDensity_rnDeriv`, `IsCompactOperator.comp_clm` (`Compact/Basic.lean:271`), `isCompactOperator_of_tendsto` (459), `fourierTransformₗᵢ`. A search of both libraries for essential spectrum, spectral-type subspaces, wave operators, Friedrichs extensions and min–max for partial operators found nothing: no target restates a pinned declaration.

**Suppliers, resolved now.** On main: UnboundedOperators UO-A01 (line 241), A02 (259), A06 (303), A07 (309), C01 (523), C02 (533), C03 (552; now stated for every normalized PVM on `ℝ`, with no control measure), D06 (703), E01 (900), E04 (983; `V(A − i)⁻¹`), E05 (1027), E06 (1033); SelfAdjointSpectralTheory SA-B44–45, B85, C12–C19, C25–C28, C39, C44, C52–C54, C86, D02, D12, D18, D22, E01–E13, E26–E30, E44, E47 (each located and read); VariationalMethods 4.4 (782) and 5.1–5.2 (839, 882); ComplexKahlerGeometry K5a and K5a.ComponentwiseCompact (2092); RiemannianGeometry R7.8 item 8 (3708); `Completed/HopfRinow`; PDE §1.2 (720), §1.3 (769), §6.3 (2309); SmoothBundlesConnections B2.2 (605); PseudodifferentialOperators P1.0; HilbertModules H6 (705); DifferentialGeometry 12.2–12.5; OperatorIdeals OI-B29–B36 (349–363); FuchsianOrbifolds Layer 3 (563). At its open head: QuantumFoundations §8.2 and §9.5. No citation is of a later roadmap.

**Declared gaps.** `gap:weyl-criterion` and `gap:spectral-integral-resolvent`: each has a named supplier and section, one `needs` sentence with its hypotheses, the same slug in the plan and the README, and asks for a statement main does not have (see the first table). The supplier is now on main; the contracts stand as declared.

**Maintainer notes.** All six hold as descriptions of the round-3 text and all six are repaired in this text: (1) lines 91–100; (2) lines 67–70, 261–262, 446–447, 461; (3) the gap; (4) lines 1260–1268, 1298–1300; (5) the gap; (6) lines 239–246. The closing instruction ("check that 4.4 says so") is met at lines 1302–1306. The ownership decisions (UO-C03 subspaces, QuantumFoundations §8.2, this roadmap for 1.3, the named spectra and bounded potentials in every dimension) are respected; R01 concerns the hyperbolic Laplacian, which the notes do not cover.

**Duplication and overlap.** `roadmaps grep` over main and the open heads for Kato–Rosenblum, Pearson, Gaffney, essential self-adjointness, wave operators, absolutely continuous spectrum and min–max: no other owner of the Layer 1 scattering statements, of the complete-manifold theorem in general, or of bounded potentials in every dimension; RelativisticQuantumFieldTheory's wave operators are Haag–Ruelle's, a different object; the one shared instance is R01. `overlaps.md` reports no pull request changing this roadmap, no dropped id and no revision-only id, and I found none.

Overlap check: read UnboundedOperators (main), VariationalMethods (main), SelfAdjointSpectralTheory (main), QuantumFoundations (#1771), CongruenceSpectralGap (#1504), AutomorphicSpectralTheory (#925); shared: the pp/ac/sc subspaces — UnboundedOperators UO-C03; the free Hamiltonian — QuantumFoundations §8.2; `L² + L^∞` potentials on `ℝ³` — UnboundedOperators UO-E06; essential self-adjointness and kernel of the Laplacian on a torsion-free congruence cover — CongruenceSpectralGap §0.2 (R01). PositiveMass (#2247) and the SelfAdjointSpectralTheory revision (#1854) were not read this round.

**Supplier-order gate.** Output of the prescribed command:

```
candidate: SchrodingerOperatorsAndSpectralTypes is not in the merge order yet; checked as if placed after QuantumFoundations (the intake inserts it when its design is accepted)
depcheck: 206 roadmaps, 1901 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

**Shape.** 44 plan targets, 17 definitions, each definition with an API list and at least three Checks in the plan and the README; every theorem has hypotheses and a locator; every layer ends with Examples and Dependencies. The design has no `Suggested.lean`: headline statability, padding and binders are package-stage checks. The README's own backticked expressions are mathematical notation; it attributes no Lean name to this roadmap.

## Not verifiable

- Elaboration: not available (this lane does not elaborate; say so in the report). No Lean command was run.
- The thirteen settled uncertified texts (`strichartz83`, `chernoff73`, `kato76`, `cfks87`, `gaffney54`, `rs1`, `rs2`, `rs3`, `grigoryan09`, `chavel84`, `iwaniec02`, `lp76`, `pearson78`) were not read; of the sampled targets, 3.1, 3.5 and 3.8 rest on their locators alone for the source side, and on supplier sections and computation for the mathematics. Pearson's proof is not in the readable yafaev04 text, which states the theorem only.
- Published numbering of the arXiv copies of `bms02`, `hm23`, `kps26` was not compared with the journal versions.
- Ownership against open pull requests was checked through `roadmaps grep` and the six roadmaps named in the overlap line; the other open heads were searched by object keywords only, not read.

## Source issues

- **Misprint** in teschl at Theorem 6.4, equation (6.3), printed page 135: the source says the lower bound uses the quotient of the ambient coefficient by the relative coefficient minus one; it should be divided by one minus the relative coefficient; affects a stated result.
- **Misprint** in teschl at Theorem 6.4, proof, printed page 135: the source says the factorisation uses the resolvent at the same signed point as the shifted operator; it should use the opposite point for his resolvent convention `(A − z)⁻¹`; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "aeba54ff60cd378c8ee2ac5648067f878bf9945d", "job": "REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~4", "model": "fable", "worker": "chris-x11"} -->
