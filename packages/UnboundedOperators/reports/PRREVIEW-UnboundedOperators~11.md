# Review of UnboundedOperators (pull request #1027 at fea2b39)
Folder: `TauCetiRoadmap/OperatorTheory/UnboundedOperators/`
**Verdict:** needs changes

This is an incremental re-review of the 67 lines changed since `d0d839e`. It finds one P3 finding and no blocking finding. Both findings of the previous review are repaired; the new finding is a gap in one step of the §2.3 route that the R02 repair added. Below, `README.md` and `Suggested.lean` mean the two files of this folder.

## R01 (P3) — §2.3's commutant step approximates only in `L²(μ_A^x)`, which does not reach `f[P_A]Cx`

**Location.** `README.md:405`: "a bounded Borel f is reached from that algebra by approximation in `L²(μ_A^x)` (`MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le`)".

**Claim.**
- The step is meant to prove that a bounded C commuting with `R_A(z)` and `R_A(conj z)` commutes with every bounded Borel `f[P_A]`.
- Take `f_n` continuous with compact support and `f_n→f` in `L²(μ_A^x)`. Then `f_n[P_A]x→f[P_A]x`, so `Cf_n[P_A]x→Cf[P_A]x`, and `Cf_n[P_A]x=f_n[P_A]Cx`.
- To conclude, the step also needs `f_n[P_A]Cx→f[P_A]Cx`, that is `f_n→f` in `L²(μ_A^(Cx))`. Convergence in `L²(μ_A^x)` does not give this unless `μ_A^(Cx)` is dominated by `μ_A^x`. The README does not state that domination, and nothing on the *Needs:* line (`:426`) supplies it.
- Teschl's proof of Lemma 4.5 skips the same step (Source issues).

**Witness.** A=diag(0,1), x=e₁, C=X:
- `μ^x=δ₀` and `μ^(Cx)=δ₁`;
- `f_n≡0→1_{1}` in `L²(δ₀)`, yet `f_n[P]Cx=0≠e₂=1_{1}[P]Cx`.

Under commutation, only `μ^(Cx)≤‖C‖²μ^x` closes the step. Neither the README nor `teschl line 4933–4938` states it.

**Repair.** At `:405`, replace "by approximation in `L²(μ_A^x)`" with "by approximation in `L²(μ_A^x+μ_A^(Cx))`, a finite Borel measure on ℝ and hence regular, so that both `f_n[P_A]x→f[P_A]x` and `f_n[P_A]Cx→f[P_A]Cx`".

Alternatively, add "after showing `μ_A^(Cx)≤‖C‖²μ_A^x` from `‖g[P_A]Cx‖=‖Cg[P_A]x‖` for continuous g with compact support". This is the diagonal-domination step that SelfAdjointSpectralTheory SA-B79 uses (SA-B59), and the README may cite it instead.

**Tested** on A=diag(0,1), C=diag(2,3) (which commutes with `R_A(1/2)=diag(2,−2)`), x=(1,1), f=`1_{1}`:
- `μ^x=δ₀+δ₁` and `Cx=(2,3)`, so `μ^(Cx)=4δ₀+9δ₁`.
- Continuous `f_n` with `f_n(0)=0` and `f_n(1)=1` converge in `L²(μ^x+μ^(Cx))`.
- `Cf[P]x=C(0,1)=(0,3)` and `f[P]Cx=(0,3)`, as the repaired step gives.

## Previous findings

- R01 — repaired: `README.md:791–804`. "Teschl's Theorem 2.12 gives existence and uniqueness only. For complex separable H and lower bound 0 the extremal property is Krein's theorem … (arXiv:1208.4677v3, Theorem 12.1 and (12.8), p.54) … proved here over `[RCLike 𝕜]`". `Suggested.lean:234–238` matches.
- R02 — repaired: `README.md:426`. "SA-E01 for `P_A` (form (i), and the bounded functions `f[P_A]` of the route); SA-E05 and SA-E08 for the resolvent …". `:496` adds "Tau Ceti's unitary C₀-groups and Stone's theorem, Mathlib's Fuglede theorem". The route's own new step is R01 above.

## Verified sound

**Gate and dependency check.**
- The worker's gate at `fea2b39` has every rule at 0 (`OK`).
- My rerun of the brief's gate command has every rule at 0 except `depcheck=1: NOT IN ORDER: UnboundedOperators (insert it after its last supplier)`. That rule reads the configured merge order. It is not a finding: the candidate order lists this roadmap at line 10, after VonNeumannAlgebras (5), CStarAlgebras (7), HilbertModules (8) and OperatorKTheory (9).
- The dependency check against the candidate order:

```
depcheck: 238 roadmaps, 2352 edges, 0 problem(s)
```

- There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty. Since `d0d839e` only `README.md` (43 lines) and `Suggested.lean` (24 lines) changed.

**Elaboration, signatures and probe.**
- `lake env lean` on `Suggested.lean` takes 12.9 s and gives 22 warnings, all "declaration uses `sorry`", and no other diagnostic.
- The diff changes only the docstrings of four theorems (`:66–73`, `:193–198`, `:230–238`, `:445–451`). No statement changed.
- One scratch file is `Suggested.lean` plus `#check @…` for all 30 declarations. It elaborates without error, and every type is identical to `d0d839e`, which r10 compared with the README.
  - `friedrichs_extension_extremal` keeps `[RCLike 𝕜]`, `[CompleteSpace H]`, `hdense`, `hsym` and `hγ`.
  - No binder is lost.
- One-tactic probe: in a scratch copy, the four theorems whose docstrings changed (`existsUnique_spectralIntegral`, `exists_spectralType_decomposition`, `friedrichs_extension_extremal`, `isSelfAdjoint_closure_neg_laplacian_add_potential`) got `first | (rfl; done) | (trivial; done) | (infer_instance; done) | (simp; done) | (aesop; done) | sorry`. All four stay at `sorry` (22 warnings, no error).
- The other 18 statements are unchanged since r10's probe. No padding.

**Headline theorems.** The list and the not-statable docstring (`Suggested.lean:45–60`) are unchanged since r10. It has the same 22 theorems; `P_A`, Sturm–Liouville minimal and maximal operators and the translation surface are not at the pins. Every Lean name appears in the README.

**Adversarial table.** Conventions:
- inner products are conjugate-linear in the first slot;
- `R_A(z)=(zI−A)⁻¹`;
- `U(t)=exp(itA)`.

Rows marked (r10) carry the previous report's row for an unchanged statement. Rows marked **new** compute the changed passages.

| # | Statement | Instances | Values computed on each side | Result; change |
|---|---|---|---|---|
| 1 | `existsUnique_spectralIntegral`; **new** generality sentence `:238`, docstring `:66–73` | H=ℓ²(ℝ) (nonseparable) with P(B)=multiplication by `1_B`, f(t)=t; x=Σ_{k≥1}k⁻²e_k; x′=Σk⁻¹e_k; atoms 0,1 on ℂ², x=(1,2), f=(2,i); X=∅ | ∫\|f\|²dμˣ=Σk²k⁻⁴=π²/6<∞, so x∈dom; for x′, Σk²k⁻²=∞, so x′∉dom; no step uses a countable basis. f[P]x=(2,2i), ‖·‖²=8 (r10). X=∅ forces H=0 | true without separability or ℝ |
| 2–5 | §1.4 pushforward, §1.5 spectral family, `existsUnique_maximal_multiplier`, `existsUnique_projValMeasure_of_normal` | r10 rows 2–5 | unchanged (r10) | true (r10) |
| 6 | `commute_resolvent_iff_commute_stoneGroup` | Pauli X,Z, z=w=i | [R_X(i),R_Z(i)]=(XZ−ZX)/4≠0; U(π/2)V(π/2)=−XZ≠−ZX (r10) | false=false (r10) |
| 7 | same, real point | A=diag(0,1), z=½; B=diag(2,3); B=X | R_A(½)=diag(2,−2); both sides true for diag(2,3), both false for X (r10) | true (r10) |
| 8 | same | A=B; H=0 | both sides true (r10) | true (r10) |
| 9 | §2.3 *Needs:* `:426` against the route `:405` (**new**) | each route input against the line | P_A→SA-E01 ✓; nonreal R_A(z)=∫(z−s)⁻¹dP_A→SA-E05 ✓; real z→SA-E08 ✓; group→SA-E43, Stone ✓; Lemma 4.4→Stone–Weierstrass ✓; Lemma 4.5→`MemLp.exists_hasCompactSupport_eLpNorm_sub_le` ✓ | repaired (prev. R02) |
| 10 | §2.3 route, Lemma 4.4 step (**new**) | σ(A)={0,1}, z=½ and z=i; σ(A)=ℝ, z=i | z=½: g(0)=2, g(1)=−2, g(∞)=0, which separates {0,1,∞}; z=i: g(0)=−i, g(1)=(−1−i)/2, g(∞)=0; σ(A)=ℝ: g injective on ℝ and g→0 at ∞, so dense in C₀ | true at real and nonreal z |
| 11 | §2.3 route, Lemma 4.5 step (**new**) | A=diag(0,1), x=e₁: C=X; C=diag(2,3) | C=X: μ^x=δ₀, μ^(Cx)=δ₁, f_n≡0→`1_{1}` in L²(δ₀), but f_n[P]Cx=0≠e₂=f[P]Cx; C=diag(2,3): μ^(Ce₁)=4δ₀≤9δ₀=‖C‖²μ^(e₁) | step needs the second measure: R01 |
| 12 | §2.3 route, converse via J_f (**new**) | A=diag(0,1), U(s)=diag(1,e^{is}) | C commuting with U(π)=diag(1,−1) is diagonal, so it commutes with R_A(½)=diag(2,−2) and R_A(i); X fails at U(π): XU(π)=−U(π)X | true |
| 13 | §2.3 separability remark (**new**) | Lemmas 4.4, 4.5, 4.9 and the route | no step uses a countable basis or a cyclic decomposition; P_A is SA-E01, which has no separability hypothesis | true |
| 14 | §2.4 API, `existsUnique_jointProjValMeasure`, §2.6 | r10 rows 10–12 | unchanged (r10) | true (r10) |
| 15 | `discreteSpectrum`, `essentialSpectrum`, `notMem_essentialSpectrum_iff` | r10 rows 13–14 | unchanged (r10) | true (r10) |
| 16 | `exists_spectralType_decomposition`; **new** docstring `:193–198` | H=ℓ²(ℝ), P(B)=mult. by `1_B`; diag(0,1); M_x on L²[0,1] | ℓ²(ℝ): every μˣ=Σ\|x_t\|²δ_t has countable support, so H_pp=H. A finite control ρ would need ρ({t})>0 for all t∈ℝ, impossible since #{t: ρ({t})>1/n}≤nρ(ℝ). H_pp=ℂ²; H_ac=L²[0,1] (r10) | true with no finite control measure |
| 17 | §3.5 realization; `resolventSet_alternatives_of_isClosed_symmetric`; §§4.3–4.6 | r10 rows 16–21 | unchanged (r10) | true (r10) |
| 18 | `existsUnique_selfAdjoint_of_closed_form`; Lax–Milgram contract | r10 rows 22, 24 | unchanged (r10) | true (r10) |
| 19 | `friedrichs_extension_extremal`; **new** route `:791–804`, Check `:827`, docstring `:230–238` | −d² on C_c∞(0,1), T Neumann, S_F Dirichlet, h=1, λ=−1; EGNT (12.8) with γ=0, a=1; ℂ with S=2, γ=1, t=0 | sup over H¹ of 2∫u−∫\|u′\|²−∫\|u\|² is attained at u=1 and equals 2−0−1=1=⟨1,(T+1)⁻¹1⟩. Over H₀¹ the value is q_B[v]=∫u_D=1−2tanh(½)=0.075766. So ⟨1,R_T(−1)1⟩=−1≤−0.075766=⟨1,R_SF(−1)1⟩. EGNT: (S_F+1)⁻¹ gives 0.0758 ≤ 1 from (T+1)⁻¹, the same order. On ℂ: R_T(0)=R_SF(0)=−½, equality | true; route correct (sup identity: F(u)=q_B[v]−q_B[u−v]) |
| 20 | §4.8 Green, LC/LP | r10 row 25 | unchanged (r10) | true (r10) |
| 21 | `integralOperator_counterexample`, Nelson theorems, Weyl, relatively compact perturbation, branches | r10 rows 26–32 | unchanged (r10) | true (r10) |
| 22 | `isSelfAdjoint_closure_neg_laplacian_add_potential`; **new** docstring `:445–451` | Vb≡1, V₂=0; V₂=\|x\|⁻¹1_{\|x\|<1}, Vb=0 | ‖Vb u‖=‖u‖, relative bound 0; −Δ+1 is essentially self-adjoint on C_c∞ but σ_ess=[1,∞)≠[0,∞), so Teschl's (10.4) fails and only essential self-adjointness is claimed; ∫_{\|x\|<1}\|x\|⁻²dx=4π, so V₂∈L² | true; docstring right |
| 23 | tensor sum, tensor product, Stone factorization | r10 rows 34–37 | unchanged (r10) | true (r10) |
| 24 | milestone map; `smulSub` | r10 rows 38–39 | unchanged (r10) | true (r10) |
| 25 | Layer 2–6 Dependencies (**new**) against every *Needs:* line of the layer | Layer 2: 6 lines; Layer 3: 5; Layer 4: 8; Layer 5: 7; Layer 6: 4 | every supplier named on a *Needs:* line appears in its layer's paragraph, e.g. §4.1 B5, PD-B29, PD-B32 within "B5" and "PD-B23–PD-B34"; §5.3's §2.3/§2.5 within "Layer 2's strong commutation and joint PVM"; no layer cites a later layer | consistent |

**Sources read at their locators (changed passages and the sampled targets they touch).** For `teschl`, printed page = PDF page − 12.

| Target | Locator | Lines | Verdict |
|---|---|---|---|
| §1.1 (sampled) | §3.1 (3.25)–(3.27), p.91; Theorem 3.2, (3.28)–(3.29), p.92 | `teschl line 3729`, `3734`, `3740`, `3752–3758` | supported |
| §1.1, §2.3 (new) | §1.2, p.42, standing separability | `teschl line 1754`, `1780` | supported |
| §2.3 (sampled, new route) | Lemma 4.4, p.115; Lemma 4.5, p.116; Lemma 4.9, (4.24)–(4.25), Problem 4.2, p.117 | `teschl line 4904–4914`, `4926–4943`, `4967–4987` | supported; Lemma 4.4 allows any z∈ℂ∖K; Lemma 4.5's proof has the gap of R01 (Source issues) |
| §4.7, docstring (new) | EGNT Theorem 12.1 and (12.8), p.54; separable complex H | `eckhardt-gesztesy-nichols-teschl line 3309–3331`, `215` | supported: S_F largest among nonnegative self-adjoint extensions, `(S_F+a)⁻¹≤(S̃+a)⁻¹` for a>0 |
| §5.7, docstring (new) | Lemma 10.1, p.221; Theorem 10.2, p.222 | `teschl line 9562–9564`, `9578–9589` | supported; Teschl's bounded part is in `L^∞_∞`, and the docstring now says so |

The other sampled targets (§§1.2a, 2.4, 3.1, 3.4, 3.5, 4.5, 4.6, 5.2, 5.4, 5.6, 6.1–6.3) are unchanged except for their layers' Dependencies paragraphs, which row 25 checks. r10 read their locators.

**Library declarations opened at the pins.**
- Mathlib:
  - `ContinuousMap.starSubalgebra_topologicalClosure_eq_top_of_separatesPoints` (`Topology/ContinuousMap/StoneWeierstrass.lean:399`, compact X, `RCLike 𝕜`; used on the one-point compactification, as the README says);
  - `MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le` (`MeasureTheory/Function/ContinuousMapDense.lean:142`, `[R1Space] [WeaklyLocallyCompactSpace] [μ.Regular]`, p≠∞);
  - `LinearMap.continuous_of_isClosed_graph` (`Analysis/Normed/Operator/Banach.lean:538`) and `ContinuousLinearMap.ofIsClosedGraph` (`:569`);
  - `banach_steinhaus` (`Analysis/Normed/Operator/BanachSteinhaus.lean:40`);
  - `RiemannianBundle` (`Topology/VectorBundle/Riemannian.lean:420`) and `IsContinuousRiemannianBundle` (`:60`);
  - `IsStarNormal.commute_star_right` (`Analysis/CStarAlgebra/Fuglede.lean:178`);
  - `IsCompactOperator` (`Analysis/Normed/Operator/Compact/Basic.lean:69`);
  - `SchwartzMap.fourierTransformCLM` (`Analysis/Distribution/SchwartzSpace/Fourier.lean:53`, with `instFourierPair` at `:130`), for the converse direction.
- Tau Ceti:
  - `LinearPMap.resolvent` (`Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean:169`) and `resolvent_sub_resolvent` (`:280`);
  - `TauCeti.riemannianVolume` (`Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82`) and `eq_riemannianVolume_iff` (`:93`), in namespace `TauCeti`;
  - `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul` (`Analysis/Semigroups/Group/Stone/Unbounded.lean:106`).

**Cross-roadmap citations resolved** (main at `19d2a1c`).
- SelfAdjointSpectralTheory: SA-A21 `:225`, SA-C39 `:888`, SA-C55 `:929`, SA-D17 `:1103`, SA-D18 `:1105`, SA-D20 `:1109`, SA-E01 `:1202`, SA-E05 `:1211`, SA-E06 `:1213`, SA-E07 `:1215`, SA-E08 `:1217`, SA-E26 `:1260`, SA-E43 `:1307`.
  - SA-E08 says that a Borel set of resolvent points has `P_A(B)=0`, which is what §2.3 uses at a real z.
  - SA-E01, SA-E05 and SA-E08 are also at the heads of #1854 and #1187.
- VonNeumannAlgebras V10.ClosedOperators (`:2249`): polar decomposition, cyclic reducing summands and the derivative on `L²[0,1]` are all within `:2249–2290`. V2 is unchanged since r10.
- BanachSpaceTheory B5 Hilbert dimension (`:42`).
- PDE A1, A3, A4 and A6 (`:677`, `:769`, `:803`, `:905`; labels at `:196`).
- `Completed/OrthogonalL2Bases`.
- HilbertModules H6 and H7, LieGroups Layers 2 and 5, PolarDecomposition and G5.5-RealHilbert are unchanged since r10.
- The resolver's one lead, `applyWord`, is `CommonInvariantDomain.applyWord` (`Suggested.lean:321`).

**Ownership and overlaps.**
- The overlap listing reports no pull request changing this roadmap, no dropped id and no id that only an open revision defines.
- The changed passages state no new object. The commutant step and the Friedrichs extremality are proof routes for targets already owned here: §2.3, and §4.7 (which VariationalMethods defers to this roadmap).
- SelfAdjointSpectralTheory owns only the bounded commutant (SA-B57, SA-B79). The README may cite SA-B79 in the repair of R01.

**README form.**
- The new text has no LaTeX, no process words, no pull-request numbers and no machine paths.
- The References entries for EGNT (`:1508`) and Teschl (`:1524`, `:1535`) carry the new locators.

**Remarks on untouched text (no change requested).**
- The `J_f` paragraph after §2.3 uses Mathlib's Fourier transform without naming it on the *Needs:* line. `SchwartzMap.fourierTransformCLM` exists at the pin.
- The pull-request description still describes earlier heads.

## Not verifiable

- **Kato (1995), Nelson (1959) and Weidmann (1987)** are settled as uncertified. No changed passage relies on them except §2.3's untouched pointer to Nelson's Section 10, which r10 checked mathematically.

## Source issues

- **Gap** in teschl at Lemma 4.5 (proof), printed p.116: the source says choosing `f_n→f` in `L²(dμ_ψ)` gives `f_n(A)Bψ→f(A)Bψ`; it should be convergence in `L²(μ_ψ+μ_(Bψ))`, or a prior bound `μ_(Bψ)≤‖B‖²μ_ψ` from the continuous case; affects the proof.
