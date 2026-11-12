# Review of YangMillsConnectionsAndCaloricGauge (pull request #2164 at 4db2911)

**Verdict:** needs changes

## R01 (P3) — The `MemLp` fields of `IsFiniteEnergySU2Potential` fall outside Mathlib's `Lp` API

**Location.** `Suggested.lean` lines 78 and 111–114: `attribute [local instance] Matrix.frobeniusNormedAddCommGroup …`; `MemLp A 2 (volume.restrict K) ∧ ∀ v, MemLp (fun x => DA x v) 2 (volume.restrict K)`; `MemLp (fun x => curvature A DA x j k) 2 volume`.

**Claim.** These terms take their topology from Matrix's global instance and their norm from the local Frobenius instance. No `ESeminormedAddMonoid` instance on `Matrix (Fin 2) (Fin 2) ℂ` matches that pair, so `MemLp.zero`, `MemLp.add` and Hölder's inequality do not apply to these fields. Without bridging the instances by hand, nobody can use the hypotheses when proving the headline, nor check even `A = 0`.

**Witness.** With the file's local instances, `inferInstance : ESeminormedAddMonoid (Matrix (Fin 2) (Fin 2) ℂ)` fails. In `example : IsFiniteEnergySU2Potential 0 0`, `simp` makes no progress on `MemLp 0 2 (volume.restrict K)` and leaves `MemLp (fun x => 0) 2 volume` unsolved.

**Repair.** State the two fields entrywise, on `ℂ`-valued functions:

```lean
  memLp_restrict : ∀ K : Set (EuclideanSpace ℝ (Fin 4)), IsCompact K → ∀ j a b,
    MemLp (fun x => A x j a b) 2 (volume.restrict K) ∧
      ∀ v, MemLp (fun x => DA x v j a b) 2 (volume.restrict K)
  memLp_curvature : ∀ j k a b, MemLp (fun x => curvature A DA x j k a b) 2 volume
```

In README §6.4 (lines 1439–1442), change the bullet to read "every entry of `A` and `DA` is square integrable on every compact set, and every entry of every curvature coefficient lies in `L²`". Tested on a scratch copy:
- the file elaborates with only the two `sorry` warnings;
- `IsFiniteEnergySU2Potential 0 0` closes with `TauCeti.hasWeakFDerivOn_zero`, and with `simp` in every other field.

## R02 (P3) — §1.1 restates Lie-algebra facts that Tau Ceti proves, and the `𝔰𝔲(2)` identification is uncited

**Location.** README line 476: "`𝔤` is a real Lie subalgebra of the skew-Hermitian matrices, `exp(𝔤) ⊆ G`, and `Ad(g)𝔤 = 𝔤` for every `g ∈ G`". `Suggested.lean` lines 19–20: "`𝔰𝔲(2)` is the trace-free skew-Hermitian matrices".

**Claim.** The pinned Tau Ceti already proves these facts. The From Tau Ceti contract and §1.1's *Needs:* line do not cite them, so §1.1 plans a target that already exists.

**Witness.** Tau Ceti `Geometry/Lie/Subgroup/`:
- `Unitary.lean:136`: the Lie algebra of the unitary matrices is `Aᴴ = −A`;
- `LieAlgebra.lean:359`: `lieSubalgebraOfSubgroup_mono`;
- `LieAlgebra.lean:395`: `Ad_mem_lieSubalgebraOfSubgroup`;
- `SpecialUnitary.lean:98`: the special unitary group's Lie algebra is `Aᴴ = −A ∧ trace A = 0`.

**Repair.**
- Under From Tau Ceti, add these four declarations with their files:
  - `TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff_conjTranspose_eq_neg`;
  - `TauCeti.Lie.lieSubalgebraOfSubgroup_mono`;
  - `TauCeti.Lie.Ad_mem_lieSubalgebraOfSubgroup`, read in matrix coordinates through `TauCeti.Lie.tangentAd_units` (`Geometry/Lie/Adjoint/Units/Basic.lean`);
  - `TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_GLSpecialUnitary_lieSubalgebra_iff`.
- Replace §1.1's first bullet with: "From Tau Ceti: `𝔤 ⊆ 𝔲(N)` (monotonicity and the unitary computation), `exp(𝔤) ⊆ G`, and `Ad(g)𝔤 = 𝔤` for `g ∈ G`; hence the tangent space of `G` at `g` is `g𝔤 = 𝔤g`."
- Add the four declarations to §1.1's *Needs:* line.
- Cite the special-unitary theorem in §6.4's bullet on `IsFiniteEnergySU2Potential` and at `Suggested.lean` lines 19–20.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| 1.4 Cartan-form normalisation | `Φ` frame at `e₁`; C5a.3 at `k = 2` | `dΦ(e₂,e₃,e₄) = (k,i,j)`; `kij = −1`; `3(−2−2) = −12`; `·2π² = −24π²`; `⅓ ⇒ −8π²`; `CS = tr(θΩ) − (1/6)tr(θ[θ,θ])` | correct | none |
| 1.4 Check 3 against OhTataru-YMHF line 2869 | `f = −⟨·,·⟩` | `2∫₀¹(t⟨a∧da⟩ + ½t²⟨a∧[a∧a]⟩)dt = −(⟨a_j,∂_k a_l⟩ + ⅓⟨a_j,[a_k,a_l]⟩)dx^{jkl}`, as printed | correct | none |
| 1.6 `γ₀(𝔰𝔲(2))`, cubic bound | `diag(i,−i)`, `[[0,1],[−1,0]]`; `ω^a = λ(i,j,k)` | `\|[X,Y]\|² = 8`, `\|X\|²\|Y\|² = 4`, ratio `√2`; `6√2·4λ³ = 24√2\|λ\|³ = (2√6/3)√2(6λ²)^{3/2}` | correct | none |
| 2.2 Approximation | Lemma 3.2 (lines 1038–1072); half-balls `V`, `W` | source `h = 1` on `W` (line 1049) needs `V̄ ∩ W̄ = ∅`; closures meet on `{x₁ = 0}`; `exp(−1/x₁)`·bump is positive exactly on `W` | README right | none |
| 2.3 Products and inverses | Lemmas 3.1 and 3.3 (lines 1000–1010, 1081–1090) | bound at line 1018 equals the README bullet; `∂O⁻¹ = −O⁻¹∂OO⁻¹` (line 1086); `O⁻¹ = O*` is an isometry | correct | none |
| 3.3 Patching | eight balls at `±(1−ε)e_j` | `max(r² − ar + a²) = max(a², 1−a+a²) < 1`; separation `√2a`; margin `≤ ε`; Prop 3.9 line 1303 `W^{k,d/k}` against bound `W^{k−1,d/k}` | README right | none |
| 3.4 Concentration radii | BPST | `96π²∫₀^r s³(1+s²)⁻⁴ds = 8π²r⁴(r²+3)/(r²+1)³` via `w³−3w+2 = (w−1)²(w+2)`; small `r`: `24π²r⁴` | correct | none |
| 4.1 Uhlenbeck (headline) | linearisation at `A = 0`; `U(1)` | `O = expψ`: `∂^ℓÃ_ℓ = −Δψ`, `x^ℓÃ_ℓ = −∂_rψ`; Neumann-harmonic `ψ` is constant, so `O' = cO` | correct | none |
| 4.2 Punctured ball | Thm 3.12 (lines 1398–1412); `d = 3` monopole | Hölder gives `∫_{S_r}\|F\|^{3/2} ≥ (2π\|n\|)^{3/2}(4πr²)^{−1/2}`; `∫₀¹dr/r = ∞` | correct | none |
| 4.3 Div–curl regularity | `A_n = n^{−3/2}sin(nx₁)i dx²`; gradient field | `‖A_n‖_{W^{1,2}} ≈ n^{−1/2}`, `‖∂²A_n‖_{L^{4/3}} ≈ n^{1/2}`; `−R_iR_jΔφ` has symbol `−4π²ξ_iξ_jφ̂` | README right; Remark 3.15 wrong | none |
| 5.2 Good global gauge (headline) | dilation; translated BPST | `(r,R) ↦ (r/λ, R/λ)`, `R/r` fixed; centre `x₀ = b` keeps the remainder norm | correct | none |
| 5.4 Topological class | `A = −2x₁ i dx¹`, `b = j dx²/(1+\|x\|²)` | `F[A] = 0`; `F₁₂[A+b] = −2x₁j/(1+\|x\|²)² − 4x₁k/(1+\|x\|²)`; `k`-part² ≈ `r⁻²`, `∫r dr = ∞` | correct | none |
| 5.5 Trivial class (headline) | `−ηO;x`, `O = Φ(x/\|x\|)` | `χ = −8π² ≠ 0`, while `χ = 0` on `Ḣ¹` (OhTataru-YMHF Lemma 6.7, line 2864) | correct | none |
| 6.2 Class invariance | Cor 1.10 (lines 445–448); `Φ(x/\|x\|)` | `χ_f = ∫_{S³}Φ*ω_f = −8π²`; constant `O_(∞)` gives `0` | correct | none |
| 6.3 Bogomol'nyi | `I₊ = I₋ = 1`; BPST | `ℰ_e − χ = 2I₊`; `ℰ_e − \|χ\| = 2min(I₊,I₋) = 2`; BPST `ℰ_e = χ = 8π²` | correct | none |
| `exists_int_instantonNumber_eq` | ASD curvature; BPST; `A = 0` | integrand equals `\|F\|²`; BPST `c₂ = 1`; without the `2`, `½`; with `(4π²)⁻¹`, only even values; `instantonNumber 0 0 = 0` by `simp` | correct | none |
| `exists_potential_instantonNumber_eq` | `−ηO;x`, `O = Φ(x/\|x\|)⁻ⁿ` | `F` supported in `1 ≤ \|x\| ≤ 2`, so `L²`; `deg O = −n`, so `c₂ = n`; `n = 0`: `A = 0` | correct | none |
| `IsFiniteEnergySU2Potential` | `A = 0`, `DA = 0` | `MemLp.zero` and `simp` fail on the original fields; the entrywise fields close by `simp` | usability defect | R01 |
| 1.1 Lie algebra of `G` | Tau Ceti `Unitary.lean:136`, `SpecialUnitary.lean:98` | `𝔲(n) = {Aᴴ = −A}` and `𝔰𝔲(n) = {Aᴴ = −A, tr A = 0}` are pinned; README restates them | duplication | R02 |
| 7.5 Energy gap (headline) | Sobolev chain; opposite pair in `𝔰𝔲(2)⊕𝔰𝔲(2)` | `8√6π‖F⁺‖ ≤ 2√6γ₀‖F⁺‖²`, so `∫\|F⁺\|² ≥ 16π²/γ₀² = 8π²`; pair: `16π² = 0 + 32π²/2` | correct | none |
| 7.7 Ground state (headline) | `SU(2)`; inner product times `c` | `16π²/2 = 8π²` = BPST energy; `γ₀ ↦ c^{−1/2}γ₀`, so `E_GS ↦ cE_GS` | correct | none |
| 8.1 Envelopes and realisation | `c_k = 2^k` for `k ≤ 0`; Riesz kernel; thin shell | `c_k/c_j = 2^{−n}` against `2^{−(1−ε)n}`: ratio `2^{εn} → ∞`; `Γ(3/2)/(2π²Γ(1/2)) = 1/(4π²)`; `(4π)^σ`, not `2^σ` | correct | none |
| 9.1 Curvature flows | `A = λ(i,j,k,0)`, `λ' = −8λ³` | `∂_sF₁₂ = −32k = −16k + (−16k)`; `D_sF_{s1} = 192i`, `Δ_AF_{s1} = 64i`, right side `128i` | correct | none |
| 9.3 Local well-posedness | Thm 5.9 (lines 1873–1875); dilation | `s₀(λa(λ·)) = λ⁻²s₀(a)`; `U(1)`: `A(s) = ∇φ + e^{sΔ}a^{df}` is global | correct | none |
| 9.4–9.5 Continuation, flat limit (headline) | `Q` under dilation; `sin` on `L²(0,1)` | `λ⁶λ⁻⁴λ⁻² = 1`; `‖u_n‖ = π/√n`, `‖cos u_n − 1‖_op = 2`, relative error `1` | correct | none |
| 9.6 Dichotomy (headline) | small energy | a bubble has `E_GS ≤ ℰ_e(Q) ≤ ℰ_e(a) ≤ ε < E_GS`: impossible, so the first alternative holds | correct | none |
| 9.7 Threshold | `SU(2)`; proof (lines 2942–2988) | `2E_GS = 16π²`; `E ≥ ℰ_e(Q) + \|χ(Q)\| ≥ 2E_GS`; BPST `\|A\| ≈ \|x\|⁻¹ ∉ L⁴` | correct | none |
| 10.1 Flat connections are pure gauges | `U(1)`, `a = i∇φ`; `cO` against `Oc`; Lemma 7.3 | `(cO)⁻¹∂(cO) = a`; `(Oc)⁻¹∂(Oc) = Ad(c⁻¹)a`; `c^p_{jk} ≲ 2^{−(4/p)\|j−k\|}`, as at line 3164 | correct | none |
| 10.2 Caloric gauge (headline) | `U(1)`, `ã_t = it dφ` | `O_t = e^{itφ}`, `Cal = 0`; `ψ = iφ`, `dCal = i dφ − i dφ = 0` | correct | none |
| 10.4 Caloric manifold (headline) | unit-sphere chart; `t ↦ (t³, \|t\|³)` | inverse `(y − ⟨y,e⟩e)/⟨y,e⟩` returns `v`; the curve has derivative `0` at `0`, so it is no immersion | correct | none |
| 10.5 Projection (headline) | `w = D(a)c₀` | `b = 0`, `c = −c₀`; `U(1)`: `Π_a` is the Leray projection | correct | none |
| Gap `vector-valued-wkp` (README text) | `GraphStep/ScalarProjection.lean:118` | `toW1pL` gives only maps to the scalar classes: no inverse, no vector-valued `k ≥ 2` class, no local class | minimal | none |

- **Previous review (at `a69a7e7`).** All four findings are repaired:
  - R01: `Suggested.lean:132–150` states integrality and surjectivity;
  - R02: README lines 281–292 cite `TauCeti.WeakDerivStep`, and line 372 asks only for `k ≥ 2`, the equivalence and the local classes;
  - R03: README lines 87–89 read "§4.1 for the Euler expression and its currents, §5.2 for the gauge identity";
  - R04: all three description sentences are replaced.
- **Gate, dependency check, diff.** The gate re-run at `4db2911` passes: every check is 0, result `OK`. The dependency check prints `depcheck: 236 roadmaps, 2139 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The roadmap is at merge-order line 14, after SmoothBundlesConnections (13). The diff outside the folder is empty.
- **Elaboration.** `lake env lean` on `Suggested.lean`: exit 0, two `sorry` warnings (lines 132, 145). The `#check @` types of all five declarations and both fields match README §6.4. One-tactic probes (`simp`, `norm_num` with `instantonNumber`) leave both theorems open, so neither is padding.
- **Sources.** All 15 sampled targets were checked at their locators:
  - OhTataru-TopClass lines 236–264, 330–470, 840–920, 955–1105, 1140–1500, 1686–1705;
  - OhTataru-YMHF lines 548–594, 840–958, 1536–1612, 1855–1982, 2333–2342, 2828–2992, 3158–3212;
  - OhTataru-Threshold lines 234–248, 1060–1078.
- **Libraries opened at the pins.**
  - Tau Ceti 2fd255d9: `WeakDeriv/Basic.lean:251`; `GraphStep/Basic.lean:184, 209, 399`; `ScalarProjection.lean:118`; `Wkp/Basic.lean:147`; `MeyersSerrin.lean:291`; `Morrey.lean:181`; `HodgeStar/AlternatingForm.lean:76, 111, 157`; `Lie/Subgroup/Embedded.lean:157`, `Units.lean:58`, `LieAlgebra.lean:277, 359, 395`, `Unitary.lean:136`, `SpecialUnitary.lean:98`; `Hurewicz/Absolute.lean:161`.
  - Mathlib: `Analysis/Matrix/Normed.lean:528–562`; `LpSeminorm/Basic.lean:118`; `Normed/Group/Defs.lean:117`.
  - Neither pin has a Hardy inequality, an `Lᵖ` Neumann problem or a gauge-theory carrier.
- **Citations resolved on main (d2e9ef27).**
  - SmoothBundlesConnections B3.1, B4.1, B4.2 (lines 871, 979, 1010). Its open revision keeps them at 1164, 1275, 1307 and keeps the Part II assignment.
  - LocalVariationalFieldTheory §4.1 (792) and §5.2 (856).
  - DifferentialGeometry Layers 0, 1, 5, 10 (691, 862, 1644, 2681), with items 10.3–10.5 at 2716.
  - AlgebraicTopology §6.5 (2967) and §8.3 (3334); RiemannianGeometry R6 (3358); Yamabe Y2 (150); CharacteristicClasses C4 (1321) and C5a (1420).
  - PDE §§1.2–1.6, 2.2–2.3, 3.2, 6.1, 6.3, 7.1–7.3 and Layer 5 (lines 720–2785).
- **Ownership.** No open roadmap owns caloric, instanton-number or Yang–Mills heat-flow objects. FourManifolds §5.3 (head 46ee76a9, merge-order line 134) states the unit-ball Coulomb gauge for `SU(2)`, `d = 4`. This earlier roadmap owns that statement in general (README 126–131), so the citation belongs in FourManifolds.
- **Gaps.** All six slugs appear in `design/plan.json` and the README, and none has supplier `none`. In plan.json, the `needs` of `vector-valued-wkp` still says `k ≥ 0`, while the README asks only for what the pin lacks; the package cannot change plan.json.

## Not verifiable

- Uhlenbeck-LpCurvature Thm 1.3, Uhlenbeck-RemovableSingularities Thm 4.1, FreedUhlenbeck-Instantons Ch. 3, DonaldsonKronheimer Ch. 3: recorded `uncertified` (paywalled). §§4.1, 4.2, 7.3 and 7.6 also cite OhTataru-TopClass.
- Bogomolnyi-Stability, MimuraToda-TopologyLieGroups Ch. IV–V, BahouriCheminDanchin-FourierAnalysis §§2.3, 2.6: `uncertified`. No sampled target rests on them alone.

## Source issues

- **Gap** in OhTataru-TopClass at Lemma 3.2 proof, p. 21: the source says a smooth `h` equal to `0` on `V` and `1` on `W` exists when `V ∩ W = ∅`; it should take `h` vanishing on `V` and positive on `W`, since the closures may meet; affects the proof.
- **Misprint** in OhTataru-TopClass at Proposition 3.9, p. 26: the source says the global potential lies in `W^{k,d/k}(B_R)`; it should be `W^{k−1,d/k}(B_R)`, as the displayed bound states; affects a stated result.
- **Error** in OhTataru-TopClass at Remark 3.8, p. 26: the source says separated unit balls have Lebesgue constant of order one; it should keep the Lebesgue number, since eight balls at `±(1−ε)e_j` have margin at most `ε`; affects the proof.
- **Misprint** in OhTataru-TopClass at (1.26), p. 17: the source says `−⟨F ∧ F⟩` is the all-index sum without a factor; it should carry `¼`, as in OhTataru-YMHF (6.11); affects a stated result.
- **Error** in OhTataru-TopClass at Proposition 1.6(1), p. 9, and proof of Proposition 1.9, p. 35: the source says gauges at infinity are homotopic and constant gauges keep the class; for disconnected `G` this holds only up to two-sided constants (the `O(4)` reflection); affects a stated result.
- **Error** in OhTataru-TopClass at Theorem 1.5, p. 8: the source says `D^{(n)}F ∈ Lᵖ(B_R)` gives `B ∈ Ẇ^{n+1,p}(ℝ^d)`; it should assume `D^{(n)}F ∈ Lᵖ(ℝ^d)`, since the hypothesis says nothing outside `B_R`; affects a stated result.
- **Error** in OhTataru-TopClass at Remark 3.15, p. 29: the source says convergence of `A_n` in `W^{m,d/(m+1)}` yields convergence of `∂^{(≤m+1)}Ã_n`; it should also require `D^{(j)}F[A_n]` to converge in `L^{d/(j+2)}`, `j ≤ m`, since `n^{−3/2}sin(nx₁)i dx²` refutes it at `m = 1`; affects a stated result.
- **Misprint** in OhTataru-YMHF at the proof of Theorem 6.6, p. 63: the source says `2χ(Q) − 2ε = 2E_GS − 2ε`; it should be `≥`, since only `χ(Q) = ℰ_e(Q) ≥ E_GS` is known; affects nothing.
