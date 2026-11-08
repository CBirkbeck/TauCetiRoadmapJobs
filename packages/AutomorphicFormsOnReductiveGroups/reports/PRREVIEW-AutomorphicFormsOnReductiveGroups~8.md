# Review of AutomorphicFormsOnReductiveGroups (pull request #1037 at 753cac0)

**Verdict:** accepted

Incremental re-review of the 10 lines changed since e8f59c8 (README lines 43, 45, 852 and 941; nothing changed outside the folder; `Suggested.lean` unchanged). The change set is the repair of the previous review's R01: the supplier paragraph for EtaleCohomologyFoundations now records F.4.0 at its actual generality (every nonarchimedean local field, integral models over a discrete valuation ring with its fraction field), §5.6 instantiates `exists_stable_lattice_iff`, `GaloisLattice.IntegralModel.nonempty`, `exists_pow_le` and `nonempty_iso_genericFibre` in both characteristics instead of re-proving the equal-characteristic case, and the Layer 5 Dependencies line matches. Every name, hypothesis and claim of the new text was checked against EtaleCohomologyFoundations on main and against the pinned Mathlib; the gate, the dependency check and the elaboration pass. No finding remains. The previous review's R02 (the pull-request description's merge-order block) is unchanged and is settled under the brief's rule on findings a repair report marked not actionable in the package; it is recorded below for the human.

## Previous findings

- R01 — repaired: line 45 "F.4.0 supplies `ContinuousRep.exists_stable_lattice_iff` for every nonarchimedean local field, including equal characteristic … `nonempty` (compact group, valuation ring compact and open in the field) … `exists_pow_le` … `nonempty_iso_genericFibre`"; line 852 instantiates these at `E=𝔽_q((t))` and at finite `E/ℚ_p`, adds only conjugation transport; line 941 "over every nonarchimedean local field". Verified against `TauCetiRoadmap/EtaleCohomologyFoundations/Suggested.lean` lines 275, 296, 341, 360 and 365 on main (see Verified sound). The repair introduced no new problem: the thirteen §5.6 Checks are now Checks of the instantiation (the three equal-characteristic ones agree with F.4.0's own Checks), the Darmon–Diamond–Taylor citation that carried the deleted proof is gone from the README with no dangling reference, and the two other passages that cite §5.6 (line 39, `Submodule.IsLattice` over `ℤ_[p]` and over local valuation rings; line 898, the localization isomorphism `eqAfterInverting`) still name targets §5.6 keeps.
- R02 — not repaired, settled: the pull-request description's `<!-- merge-order -->` block still names #934, #1015 and #1145 as prerequisites; the README cites QuaternionicModularForms, NoncompactQuantumSymmetry and SmoothBanachRepresentations only under `## Downstream consumers`, and the dependency check loads no edge to them. The r5 repair report answered this finding (H04) as pull-request text outside the files a repair may edit, which is correct, so by the brief's rule on findings marked not actionable in the package it is not raised again; the human approving the pull request should drop those three numbers from the block (and the stale sentence on #1220, since §2.2 records the reductive centre as a LieHighestWeight Layer 9 gap).

## Verified sound

**Gate, build, edits outside the folder.** The worker's gate at 753cac0: every check 0, `OK`. `git diff --stat origin/main...HEAD` outside the folder is empty. `lake env lean` on `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/Suggested.lean` prints only `declaration uses sorry` (line 47), exit 0. Dependency check output at this head:

```
depcheck: 236 roadmaps, 2193 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; the merge order lists this roadmap at line 63, after ArithmeticLocallySymmetricSpaces (62); EtaleCohomologyFoundations is on main.

**Lean form and headline.** `Suggested.lean` is byte-for-byte the file the previous review read: one module docstring, `namespace TauCetiRoadmap.AutomorphicFormsOnReductiveGroups`, a single `import Mathlib`, no `set_option`, no sorry'd data, no `lemma`. The worker's elaborated signature of `compactFinite_dense_locallyConvex` carries `[CompactSpace K] [T2Space K] [IsUniformAddGroup E] [T2Space E] [LocallyConvexSpace ℝ E] [CompleteSpace E]` and the joint-continuity hypothesis and concludes `Dense` of the set of vectors with finite-dimensional orbit span: the README §2.1 statement at the same generality, no binder dropped. The one-tactic probe and the headline list stand as in the previous report (no changed Lean statement).

**The changed supplier paragraph (line 45) against EtaleCohomologyFoundations on main (c9a16a0).** `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` line 852: the stable-lattice theorem is stated for every nonarchimedean local field, integral-model operations for a DVR `O` with fraction field `E`. `TauCetiRoadmap/EtaleCohomologyFoundations/Suggested.lean`: `ContinuousRep.exists_stable_lattice_iff` (line 275) under `[Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]`, for `K : Subgroup (GL (Fin n) E)`, `IsCompact (closure K) ↔ ∃ L : Submodule 𝒪[E] (Fin n → E), Submodule.IsLattice E L ∧ (K-stable)`; `GaloisLattice.IntegralModel` (line 296) with fields `lattice`, `stable`, `fg`, `span_eq_top` and instance `isLattice : Submodule.IsLattice E Λ.lattice` (line 313); the section variables (line 323) `[IsDomain O] [IsDiscreteValuationRing O] [IsFractionRing O E]`; `nonempty_iso_genericFibre` (line 341) giving `Nonempty (ContinuousRep.Iso (Λ.toContinuousRep.baseChange E) ρ)` under topological-ring, continuous-smul and module-topology hypotheses; `smul` (line 350, the homothety); `nonempty` (line 360) under `[CompactSpace Γ] [CompactSpace O] [IsTopologicalRing E]` and `Topology.IsOpenEmbedding (algebraMap O E)`; `exists_pow_le` (line 365), `∃ a, 𝔪^a • Λ ≤ Λ' ∧ 𝔪^a • Λ' ≤ Λ`. Each clause of line 45 names one of these with its hypotheses. Pinned Mathlib: `IsNonarchimedeanLocalField` (`NumberTheory/LocalField/Basic.lean` line 45) extends `IsValuativeTopology`, `LocallyCompactSpace` and `ValuativeRel.IsNontrivial` with no characteristic hypothesis, so `𝔽_q((t))` is an instance, as line 45 and §5.6 say; `Submodule.IsLattice` (`Algebra/Module/Lattice.lean` line 67) with `fg` and `span_eq_top`.

**The changed §5.6 paragraph (line 852).** For `J ⊂ GL_n(E)` compact with the tautological action on `E^n` (module topology on a finite-dimensional space, action jointly continuous as a restriction of matrix multiplication), `nonempty` applies with `Γ = J`, `O = O_E`: `O_E` is compact (profinite: `ℤ_p`-finite in characteristic zero, `𝔽_q[[t]]` with finite `𝔽_q` in equal characteristic) and `algebraMap O_E E` is an open embedding (the unit ball is open); `O_E` is a DVR and `E` its fraction field in both cases. `exists_pow_le` needs only the DVR. `nonempty_iso_genericFibre` needs the inherited topology on `Λ` to be the `O_E`-module topology: `Λ ≅ O_E^n` carries the product topology from `E^n`, which is the module topology. "Stability under all group elements implies setwise equality": `jL ⊆ L` for all `j ∈ J` and `j⁻¹ ∈ J` give `L ⊆ jL`. The Ding locator: `ding` line 2911 (printed p.71, §4.2.2 heading) and lines 2925–2926 (printed p.72) define `W_{ξ,τ}` as a `GL_n(O_{F⁺_v})`-invariant `O_E`-lattice in a locally algebraic representation, which is the coefficient-lattice setting the paragraph cites it for.

**Seeded sample.** Of the fifteen sampled targets only §5.6 falls in the changed passages; its two locators (EtaleCohomologyFoundations F.4.0, Ding §4.2.2 pp.71–72) are verified above. The other fourteen are untouched since the previous full reviews, which opened their locators (2.5, 3.1, 4.3, 6.1, 7.1 in the previous report's table; 0.1a, 3.3, 4.2, 5.3, 5.5, 5.8b, 6.5, 6.8, 7.3a in the r2–r5 reports).

**Adversarial table** (new rows for the changed statements with computed values; the rows for untouched statements are carried from the previous report, marked "(previous report)").

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §5.6 existence in equal characteristic via `nonempty` | `E = 𝔽_q((t))`, `J = GL_n(𝔽_q[[t]])`, `n = 0, 1, 2` | hypotheses of `nonempty`: `J` compact (profinite), `O_E = 𝔽_q[[t]]` compact, open embedding; conclusion a stable `Λ`; `n = 0`: `Λ = 0` unique; `n ≥ 1`: `𝔽_q[[t]]^n` stable, `t·𝔽_q[[t]]^n` stable and distinct (`t` not a unit) | holds, instance of F.4.0 | none |
| §5.6 existence in characteristic zero via `nonempty` | `E = ℚ_2`, `J = {[[1,a],[0,1]] : a ∈ ℤ_2}` | `ℤ_2²` stable; `2ℤ_2² ≠ ℤ_2²` (Nakayama, `p = 2`); `ℤ_2 e₁ ⊕ 2ℤ_2 e₂` also stable, not homothetic to `ℤ_2²` | holds | none |
| §5.6 non-example via `exists_stable_lattice_iff` | `J = ⟨t⟩ ⊂ GL_1(𝔽_q((t)))`; `⟨diag(p^m,1)⟩ ⊂ GL_2(ℚ_p)` | closure noncompact (valuation of `t^k` unbounded); the iff gives no stable lattice; any candidate `L ∋ x ≠ 0` would contain `t^{−k}x` for all `k`, not finitely generated | holds | none |
| §5.6 commensurability `exists_pow_le` | `Λ = ℤ_p`, `Λ' = p^k ℤ_p`, `k ∈ ℤ` | `a = |k|` works: `p^{|k|}ℤ_p ⊆ p^kℤ_p` and `p^{|k|} p^k ℤ_p ⊆ ℤ_p`; `a = 0` fails for `k ≠ 0` | holds | none |
| §5.6 generic fibre `nonempty_iso_genericFibre` | `Λ = 𝔽_q[[t]]^n` | `𝔽_q((t)) ⊗ 𝔽_q[[t]]^n ≅ 𝔽_q((t))^n`, dimension `n` both sides, action of `J` preserved; `n = 0`: both zero | holds | none |
| §5.6 conjugation transport `J ↦ gJg⁻¹`, `L ↦ gL` | `E = ℚ_p`, `n = 2`, `J` unipotent `ℤ_p`-entries, `L = ℤ_p²`, `g = diag(p,1)` | `gL = pℤ_p ⊕ ℤ_p`; `gJg⁻¹ = {[[1,pa],[0,1]]}` sends `(x,y) ↦ (x+pay, y) ∈ gL`; the wrong model `g⁻¹Jg = {[[1,a/p],[0,1]]}` sends `(0,1) ∈ gL` to `(a/p,1) ∉ gL` for `a = 1`; `g⁻¹(gL) = L` | holds, wrong model excluded by the Check | none |
| line 45 hypotheses of `nonempty` as stated | `O = ℤ`, `E = ℚ` discrete; `O = 𝔽_q[[t]]` | `ℤ` is not compact and not a DVR: `nonempty` does not apply (and `GL_1(ℚ) ⊃ ⟨2⟩` has no stable `ℤ`-lattice); `𝔽_q[[t]]` compact DVR: applies | the stated hypotheses are exactly the theorem's | none |
| `compactFinite_dense_locallyConvex` (Lean) | trivial `K`; finite `K`; `E = 0`; `K = S¹` on `C(S¹)`; `K = ∏ C₂` on `C(K)` | trivial or finite `K`: every orbit spans ≤ `#K` dimensions, set `= E`, dense; `E = 0`: dense; `C(S¹)`: trigonometric polynomials dense, rotations isometries so jointly continuous; `∏C₂`: functions through finite quotients dense | holds (previous report) | none |
| §5.6 Checks: `pL ≠ L` at positive rank, `p = 2` included; rank 0 | `L = ℤ_p`, `p = 2`; rank 0 | `2ℤ_2 ≠ ℤ_2` (Nakayama); `0` is the only lattice | holds (previous report) | none |
| §5.6 Check: divided powers vs symmetric square | `L = ℤ²`, degree 2 | symmetric tensors map to `e₁², 2e₁e₂, e₂²`, index 2 in `Sym²`; degree `m` denominators ≤ `m` | holds (previous report) | none |
| §1.3 `vanEstIso`, degenerate cases | `L` compact; `L = ℝ^n`, `n = 0, 1`; `L` finite | compact: `V^L` in degree 0, 0 above; `ℝ^n`: `Λ^q(ℝ^n)^*`, `n = 0`: `ℝ` in degree 0, `n = 1`: `ℝ, ℝ`; finite: `K_L = L`, both sides `V^L` | holds (previous report) | none |
| §1.3 Check `H^q(𝔰𝔩₂, SO(2); ℂ)` and `O(2)` | `q = 0, 1, 2` | `ℂ, 0, ℂ`; reflection acts by `−1` on `Λ²(𝔭)` so `H²(…, O(2)) = 0` | holds (previous report) | none |
| §1.3 Check `GL_n(ℝ)/O(n)` dimension | `n = 1, 2` | `n(n+1)/2 = 1, 3`; `n = 1`: `ℝ^×/{±1} ≅ ℝ_{>0}` | holds (previous report) | none |
| §2.3a `P = G` iff `Σ = ∅`; bridge | `ℝ^×`, `SL₂(ℝ)`, compact `G`, `GL_n(ℝ)` | `ℝ^×`: `P = G`, `𝔭₀ = ℝ`; `SL₂`: `Σ = {±λ}`, `P` upper triangular; `GL_n`: `S_n` relative Weyl group for `O(n)` and `SO(n)` | holds (previous report) | none |
| §2.5 `W_ℝ` conventions | `j·2`; pullback of `|x|^s sgn^ε`; `D_k(0)` | `(j·2)² = −4`, `norm(j·2) = −4`; `|x|^s∘norm(z) = |z|^{2s}`, at `j`: `(−1)^ε`, Knapp's `(±, t)` with `t = 2s`; `D_k(0) ↔ Ind((z/|z|)^{k−1})`, lowest type `ℓ+1` | holds (previous report) | none |
| §2.5 symmetric powers | `n = 1`, `m = 0`; `n = 2`, `m = 2` | dimension `binom(n+m−1, m)`: `1`; `3`; restriction to `ℂ^×` diagonalizable | holds (previous report) | none |
| §2.5 Check: non-semisimple parameter | `w ↦ ((1, log|norm w|),(0,1))` | eigenvalues 1, image unbounded, Jordan block | excluded as stated (previous report) | none |
| §3.1 smooth automorphic forms | compact `G_∞`; `GL₂`, level `K₀(N)`, type `e^{ikθ}`, ideal `(Ω − k(k−2)/4, centre)` | compact: finitely many types per cofinite ideal, `A_∞ = A`; `GL₂`: weight-`k` vectors with that Casimir in `D_k^+` or holomorphic Eisenstein, finite-dimensional; weight 0 with no ideal: infinitely many Laplace eigenvalues | holds (previous report) | none |
| §3.1 `classicalEquiv` components | `GL₁/F` at maximal level; `GL₂/ℚ` at `K₀(N)` | class group indexes components; one component, `Γ₀(N)` after positive determinant | holds (previous report) | none |
| §4.3 `ψ_ℚ` conventions | `x = 1/3`; adele `(1/2; 0, 0, …)` | `e^{2πi/3}·e^{−2πi/3} = 1`; with `+` sign `e^{4πi/3} ≠ 1`; `ψ(1/2) = −1` so not in `ℚ⊥` | holds (previous report) | none |
| §4.3 `F⊥ = F` | general `F` | `F⊥` discrete, `F⊥/F` closed discrete in a compact group hence finite, an `F`-vector space, so 0 | holds (previous report) | none |
| §4.3 Eisenstein coefficients | `k = 4` | `−2k/B_k = 240`, constant term 1 | holds (previous report) | none |
| §5.1 C- versus L-algebraic | `GL₂`: trivial rep; `D_k(0)`; `Sym^{k−2}`; `SL₂`, `PGL₂` | `ρ = (1/2, −1/2)`: trivial C-algebraic, not L; `D_k(0)`: `((k−1)/2, −(k−1)/2)`, `−ρ` integral iff `k` even; `λ+ρ = (k−3/2, −1/2)`; `ρ ∈ X*(T)` for `SL₂`, not `PGL₂` | holds (previous report) | none |
| §5.1 Chenevier–Taïbi convention | `|·|`, `|·|^{it}`, `sgn`, `D₂(0)` | `x` acts by `x²`, `x^{2it}`, `1`, `sgn(x)`: only the last two are `±1` | holds (previous report) | none |
| §5.2 coefficient equation | `D_k(μ)` with `V_{(a,b)}` | `a − b = k − 2`, `a + b = −μ`; `μ = 0`: `a = (k−2)/2`; `μ = 2−k`: `Sym^{k−2}` | holds (previous report) | none |
| §5.2 Check `GL₁(ℝ)`, `π = sgn`, coefficient `x^m` | `m` even, odd | `O(1)` acts by `(−1)^{m+1}`: no invariant cochains for even `m`; odd `m`: acyclic | holds (previous report) | none |
| §5.2 Casimir match | `D_k ⊗ Sym^m` | `k(k−2)/4 = m(m+2)/4` iff `m = k−2` | holds (previous report) | none |
| §5.3 formulas | `PGL₂/ℚ`; imaginary quadratic; `PGL₃/ℚ`; `SL₂(ℂ)`; real-quadratic torus; `GL_n` over CM | `(q₀, ℓ₀) = (1, 0)`, `(1, 1)`, `(2, 1)`; `SL₂(ℂ)`: defect 1; torus: `ℓ₀ = 1`, `q₀ = 0`; CM `GL_n`: `dn − 1`, `dn(n−1)/2` as ALS.F.7 | holds (previous report) | none |
| §5.5 purity arithmetic | `n = 2`, `k = 12`; unitary | `D₁₂(−10)`: `w_raw = −10`, `w_C = −11`, twist `5`; unitary: `w_raw = 0`, `w_C = −1` | holds (previous report) | none |
| §5.7 rationality | trivial; `χ₋₄`; order `m`; `Q₈` | `ℚ`; `ℚ`, conductor 4; `ℚ(ζ_m)`; Schur index 2 | holds (previous report) | none |
| §5.8 torsion eigensystem Check | `T = ℤ[X]` on `ℤ/8`, `c = 4` | `4·(even) ≡ 0 mod 8`: both `X ↦ ±1` eigen-characters | holds (previous report) | none |
| §5.8a, §5.8b twists | `𝔽₇`, `(t,s) = (2,3)`, `χ = 2`; `q = 3`, `det = 6` | `(4, 5)`; `3⁻¹ = 5`, `s = 2`, `qs = 6` | holds (previous report) | none |
| §6.1 Hermitian datum | `SL₂`; `GSp₄`; compact mod centre; product | `dim 𝔭⁻ = 1`; `dim 𝔭⁻ = 3`, compact `A₁`; both 0; dimensions add | holds (previous report) | none |
| §6.3 `GSp₄` coordinates | `(3,2;0)`, `(2,2;−2)`, `(4,2;−3)`, `(3,2;1)` | `ρ_T = (2,1;−3/2)`, `ρ_H = (2,1;0)`; `c_H`: `5, 0, 0, 7`; totals `5−5 = 0`, `7−7 = 0` | holds (previous report) | none |
| §6.3 chambers and walls | `(4,2)`, `(4,−2)`, `(2,−4)`, `(−2,−4)`, `(2,−2)`, `(t,t)` | `C₀…C₃`; `(2,−2) ∈ C₁ ∩ C₂`; `(t,t)` compact wall; `(0,3) ↦ (2,1)` regular | holds (previous report) | none |
| §6.4 component theory | `ε`; `E(4,2)` | `ε² = 1`, `ν(ε) = −1`; `(4,2) ↦ (−2,−4) ↦ (4,2)` | holds (previous report) | none |
| §6.5 degrees | `C₀`, `C₃`, `C₁` | degrees `0`, `3`, `1` | holds (previous report) | none |
| §6.6 `Separated` | `(20,10)`, `(12,12)`, `(12,2)`, `(5,0)` at `R = 5` | `11,19,27,8 > 5`; `1` fails; `11,11,11,0` holds; `5,5,5,0` fails strictness | holds (previous report) | none |
| §6.6 elementary implications | `k − l > R + 2`, `l = 2` or `l > R + 2` | `x − y > R`, `x > R`, `x + y > R`, `y ∈ {0} ∪ (R, ∞)`; converse for `R > 2` | holds (previous report) | none |
| §6.6 Pilloni parity | `λ = (a, 0; c)` | `a − c` odd | holds (previous report) | none |
| §6.7 `C(κ)` | `g = 1`, `κ = −k`, `k > 1`, `k = 1`, `κ = 1` | `{1}`, `{1,s}`, `{s}` | holds (previous report) | none |
| §6.8 scalar parameters | `Sp₂`, `k = 2, 1`; `Sp₄`, `k = 3, 2`; `U(1,1)`; `U(2,2)` | `1`, `0`; `(2,1)`, `(1,0)` singular; `(1/2,−1/2)` regular; minimal type `(3,3)` | holds (previous report) | none |
| §7.1 characters | finite order `m`; norm character | `ℚ(ζ_m)`; infinity type `1`, conductor `1`; orbit span `{1, log}` | holds (previous report) | none |
| §7.2 raising operator and Casimir | `f = 1`, `y = 1`, `k = 2`; `Δ` | `R(U)φ = 2iδ_k f`; `2iδ_2(1) = 2`; Casimir `30` | holds (previous report) | none |
| §7.3 Hecke normalization | `k = 0, 2`; `Δ`, `p = 2` | ratio `p^{1−k/2}`: `p`, `1`; `−24/32 = −3/4`, twist by `2⁵` recovers `−24` | holds (previous report) | none |
| §7.3a coordinates | `Δ`, `p = 2`; weight 2 | `(−24, 2^{10})`, constant `2^{11}`; converted `(−24/2^{11/2}, 1/2)`; weight 2: `pχ(p)`, `χ(p)` | holds (previous report) | none |
| §7.4 abstract carrier | `Γ = 1`; `Γ = J = G₀`; `C₂` on `ℤ`; `S₃` trace; `S₃` slash | `M`; `M^{G₀}`; `2f(1)`; `a+b+c` vs `a+2c`; `1` vs `0` | holds (previous report) | none |
| §7.4 Gross model | `γ_p = 2`, `g_p = 3` | `ρ(g_p)⁻¹F`; reversed inverse gives `3F ≠ F/3` | holds (previous report) | none |
| §7.7 slices | `f(g₁)h(g₂)`; `f₁h₁ + f₂h₂` | slice rank 1; 2 | holds (previous report) | none |
| §0.1 level conjugation | `S₃`, `f(g) = g(2)`, `y = (012)`, `j = (01)` | `R(y)f(1) = 0`; `R(y)f(y⁻¹jy) = 2` | holds (previous report) | none |
| §0.1a sign | `f(g) = g` on `ℝ` | `R(X)R(a)f = ∫a = R(−L_Xa)f` | holds (previous report) | none |
| §0.3 volume threshold | `SL₂(ℝ)`, `ℝ_{>0}` | converges iff `r > 2`; `2/r` | holds (previous report) | none |
| §0.4 exponent pieces | `G_m²`, `φ = t₂²η(t₁/t₂)` | `H₀ ≤ H′ ≤ 5H₀²`; `t²` vs `t` | holds (previous report) | none |
| §2.2 trace-form Casimir | `gl₂`, `μ = (1,1)`, `0` | direct `2`; one-based `2`; zero-based with one-based indices `−2` | holds (previous report) | none |
| §2.2 `SL₂` trivial infinitesimal character | `I(ε, ν)`, `ν² = 1` | classes `ℂ, D₂^±, I(1,1)`, four | holds (previous report) | none |
| §2.6 compact-Cartan relations | `[X_c,Y_c]`, `[H_c,X_c]`, `Ω v_k` | `H_c`; `2X_c`; `(k² − 2k)/4` | holds (previous report) | none |
| §2.7 `L²(ℝ)` translation | `1_{[0,1]}` | `‖π(t)1 − 1‖² = 2t` | holds (previous report) | none |
| §4.4 generation | `ℚ_p`, `c = 0` | `w(a)` with `v(a) = −1`, conjugation fills `N(ℚ_p)` | holds (previous report) | none |
| §4.5 Bessel | `ν = 1/2`, `u = 1` | `0`; sign-flipped `1/2` | holds (previous report) | none |

**Checks examined in the changed section.** §5.6 keeps 13 Checks; the three equal-characteristic ones (`𝔽_q[[t]]^n` stable with distinct `t`-multiple; rank zero; `⟨t⟩` noncompact with no lattice) agree with F.4.0's own Checks, and none is a restatement of the instantiated theorems. Counts for the other sections are unchanged from the previous report.

**Principles.** The repair removes the only re-planned passage (R01); the remaining text plans nothing a supplier owns, cites EtaleCohomologyFoundations by section and declaration name, contains no pull-request number, process word, LaTeX or local path, and the declared gaps `gap:banach-gfinite-density` and `gap:reductive-enveloping-centers` are unchanged.

## Not verifiable

- Nothing in the changed lines. The untouched citations without a legal open copy stand as in the previous report: Borel–Jacquet, Flath and Langlands (Corvallis I); Knapp, *Lie Groups Beyond an Introduction* (§2.3a); Kudla, *Tate's Thesis* (§4.3); Vogan 1984, Lapid and Kostant 1961 (paywalled, not in the sample).

## Source issues

- none in the changed lines (the four Getz and Pilloni misprints recorded by the previous report are unchanged and not repeated).
