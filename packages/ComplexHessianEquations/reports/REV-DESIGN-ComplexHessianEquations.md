<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/6536#issuecomment-6657626936 -->
Review (claude) of ab4bd34

Verdict: needs_changes

1. **F01** (P2) Layer 1 re-plans the min–max formula and Weyl's bounds owned by OperatorTheory/PolarDecomposition

   Location: `design/README.md` §1.1 ("Prove the min–max characterization `λ_i(T) = max_{dim W = i} min … ⟨u, Tu⟩` … extending Mathlib's Rayleigh supremum") and §1.2 ("if `S ≤ T` then `λ_i(S) ≤ λ_i(T)` … and `|λ_i(S) − λ_i(T)| ≤ ‖S − T‖`"); `plan.json` targets 1.1 (API `eigenvalues_eq_minmax`) and 1.2.

   Claim: these three statements are new targets of this roadmap. The Scope says "No roadmap on the content repository … owns any of these objects" and lists Weyl monotonicity among what Layer 1 owns.

   Witness: the roadmap `TauCetiRoadmap/OperatorTheory/PolarDecomposition/README.md` on main (c9a16a0) states, for symmetric endomorphisms of a finite-dimensional inner product space with eigenvalues sorted nonincreasingly (its Conventions, line 55–56), PD-A51 Courant–Fischer min–max (line 254–256), PD-A52 eigenvalue monotonicity in the Loewner order (line 257–259) and PD-A53 the Weyl perturbation bound `|λ_k(S) − λ_k(T)| ≤ ‖S − T‖` (line 260–261), Milestone A7 (line 290). OperatorTheory/Majorization already consumes them from there (its line 68–73). The principle "what another roadmap plans is imported by name and section, never planned again" applies.

   Repair: delete the min–max target from §1.1 and the two statements of §1.2 (the Checks move to §1.1's Checks of the relative eigenvalue vector, which remains this roadmap's object); add a supplier contract `### From TauCetiRoadmap.OperatorTheory/PolarDecomposition` naming PD-A51, PD-A52 and PD-A53 with the hypotheses "symmetric endomorphism of a finite-dimensional inner product space, eigenvalues in nonincreasing order"; replace `*Needs:* §1.1` / `§1.2` in §§1.3–1.5, 3.1, 4.1 by "OperatorTheory/PolarDecomposition PD-A51–A53"; delete plan target 1.2 and the `eigenvalues_eq_minmax` API entry, repointing their prerequisites; in Scope, move "Weyl monotonicity" from the owned list to the deferral list. The §1.2 locator "globally Lipschitz (lewis1996 line 193–194)" then goes too: Lewis states local Lipschitz continuity (line 193–195), and the constant-one bound is PD-A53.

2. **F02** (P2) §1.3 re-plans the von Neumann trace inequality and Ky Fan's maximum principle owned on main

   Location: `design/README.md` §1.3 ("Prove: for `F, B ∈ Sym(E)` … `Re tr(FB) ≥ Σ_i γ_i μ_i` … and symmetrically `Re tr(FB) ≤ Σ_i γ_i μ_{n+1−i}`. Route: … the matrix `(|⟨f_i, b_j⟩|²)` is doubly stochastic … Deduce Ky Fan's maximum principle: the sum `κ_m(T)` of the `m` largest eigenvalues of `T` equals `max tr(PT)` over orthogonal projections `P` of rank `m`"); `plan.json` target 1.3.

   Claim: the trace inequality, its doubly stochastic route and Ky Fan's maximum principle are built here.

   Witness: `TauCetiRoadmap/OperatorTheory/PrincipalAngles/README.md` on main, PA-B32 (line 272–273): von Neumann's trace inequality `tr(TS) ≤ Σ_i λ_i(T)λ_i(S)` for symmetric finite-dimensional operators with decreasing eigenvalue lists (the README's upper bound; the lower bound is PA-B32 applied to `−S`, since `λ_i(−S) = −λ_{n+1−i}(S)`), with PA-B31 the Birkhoff bilinear bound (line 270–271). `TauCetiRoadmap/OperatorTheory/Majorization/README.md` on main: MAJ-A18–A22 (line 153–160) define the Schur weights `w_{ik} = |⟨v_i, e_k⟩|²`, prove they are doubly stochastic and that diagonals are their image of the spectrum; MAJ-A27 (line 176–178) is Ky Fan's maximum principle: for symmetric `S` and an orthonormal family of `k` vectors, `Σ Re⟨Sw_i, w_i⟩` is at most the sum of the `k` largest eigenvalues (the equality `κ_m(T) = max tr(PT)` follows by evaluating at the top eigenvectors).

   Repair: cite PA-B32 (both directions, via `−S`) and MAJ-A27 in a supplier contract `### From TauCetiRoadmap.OperatorTheory/PrincipalAngles` and `### From TauCetiRoadmap.OperatorTheory/Majorization`, and reduce §1.3 to what is new here: the uniqueness of the maximizing projection under the gap `λ_m(T) > λ_{m+1}(T)`, the differentiability of `κ_m` with gradient `P_T` (lewis1996 Theorem 2.1, line 150–158), and the convexity and subadditivity of `κ_m` as one-line consequences of MAJ-A27. Update plan target 1.3's statement and prerequisites (add `roadmap:OperatorTheory/PrincipalAngles PA-B32`, `roadmap:OperatorTheory/Majorization MAJ-A27`; drop `mathlib:doublyStochastic_eq_convexHull_permMatrix`, which Majorization consumes, from this roadmap's Mathlib contract unless §1.5's half-space route still uses it directly). The Checks of §1.3 stay. Tested on the instance that refuted the original: `F = diag(2, 1)`, `B = diag(0, 3)`: PA-B32 gives `tr(FB) = 3 ≤ 2·3 + 1·0 = 6` and, applied to `−B`, `−3 ≤ 2·0 + 1·(−3)`, that is `tr(FB) ≥ 3`, the two bounds of the README.

3. **F03** (P2) The monotonicity clause of §1.5 lacks the ellipticity hypothesis

   Location: `design/README.md` §1.5, fourth bullet ("Monotonicity: if `Γ + Γ_n ⊆ Γ` … `S ≤ T`, then `T ∈ Sym_Γ(E)` and `F_f(S) ≤ F_f(T)`, with equality only if `S = T`. For vectors, if `μ ∈ Γ` and `μ ≤ ν` componentwise then `ν ∈ Γ` and `f(μ) ≤ f(ν)`"); `plan.json` target 1.5 (hypotheses: `Γ open, convex, permutation-invariant`, `f : Γ → ℝ symmetric and C¹`).

   Claim: the inequality and its equality clause hold for every symmetric `C¹` `f` on such `Γ`.

   Witness: `Γ = Γ_1 ⊂ ℝ²`, `f = −σ_1` (symmetric, `C¹`, concave), `S = diag(1, 0) ≤ T = diag(2, 0)`: `F_f(S) = −1 > −2 = F_f(T)`. For the equality clause, `f ≡ 0` gives `F_f(S) = F_f(T)` with `S ≠ T`. The bullet is used by §4.1 for admissible pairs, where `∂_j f > 0` holds, so the consumer is unaffected, but the statement as written is false.

   Repair: add the hypothesis "`∂_i f ≥ 0` on `Γ`" for the inequality and "`∂_i f > 0`" for the equality clause (both in the README bullet and in plan 1.5's hypotheses), and add the negative-control Check "`f = −σ_1` on `Γ_1`, `S = diag(1, 0) ≤ T = diag(2, 0)`: `F_f(S) = −1 > −2`, so ellipticity is needed". With `∂_i f > 0` the instance is excluded and the clause holds by the mean value theorem along `λ(S) ≤ λ(T)` (PD-A52).

4. **F04** (P3) §8.3 applies the De Giorgi lemma to a function that is not right-continuous

   Location: `design/README.md` §8.3 ("§8.2 applied to `s ↦ (c_t^n/V_t)·∫_{Ω_s} e^{nF_t} ω_X^n`") with `Ω_s = {φ_t ≤ −s}` (Layer 8 preamble); §8.2 requires `φ` "nonincreasing and right-continuous".

   Witness: `s ↦ m(Ω_s)` is left-continuous: as `s ↓ s_0`, `{φ_t ≤ −s}` increases to `{φ_t < −s_0}`. A `C²` solution can be constant `−1` on an open set `U` (there `ω_{t,φ_t} = ω_t` and the equation fixes `F_t` on `U`), so at `s_0 = 1` the right limit is `m({φ_t < −1})`, which is `m(Ω_1) − m(U) < m(Ω_1)` when `U` is the whole level set. gpt2023 line 407 asserts continuity without proof.

   Repair: apply §8.2 to the strict sublevel function `s ↦ (c_t^n/V_t)·∫_{{φ_t < −s}} e^{nF_t} ω_X^n`, which is right-continuous (`{φ_t < −s}` increases to `{φ_t < −s_0}` as `s ↓ s_0`), and run the Hölder step of gpt2023 (2.14) on `{φ_t < −s}`; `A_s` is unchanged because its integrand vanishes on `{φ_t = −s}`, and the lower bound `A_s ≥ r·(c_t^n/V_t)∫_{{φ_t < −s−r}} e^{nF_t}` still holds since `−φ_t − s > r` there. The conclusion `{φ_t < −S_∞} = ∅` gives `inf φ_t ≥ −S_∞` as before.

5. **F05** (P3) The Mathlib contract cites the finite-dimensional implicit function theorem for a Banach-space use

   Location: `design/README.md`, Exact supplier contracts, From Mathlib ("`HasStrictFDerivAt.implicitFunction` (`Mathlib/Analysis/Calculus/Implicit.lean`): the inverse and implicit function theorems in Banach spaces, used for openness in the continuity method"); plan target 6.6 prerequisite `mathlib:HasStrictFDerivAt.implicitFunction`.

   Witness: at the pin, `Mathlib/Analysis/Calculus/Implicit.lean` line 448–464: `HasStrictFDerivAt.implicitFunction` lives in `section FiniteDimensional` with `[FiniteDimensional 𝕜 F]` on the target. The continuity method's target `C^{k,α}(X)` is infinite-dimensional. The Banach version is `HasStrictFDerivAt.implicitFunctionOfComplemented` (line 342), and §6.6's route uses only `HasStrictFDerivAt.toOpenPartialHomeomorph` (`InverseFunctionTheorem/FDeriv.lean` line 117), since §5.2 makes the linearization an isomorphism.

   Repair: drop `HasStrictFDerivAt.implicitFunction` from the contract and from plan 6.6's prerequisites (or replace it by `HasStrictFDerivAt.implicitFunctionOfComplemented` if a route through it is kept), and describe the contract as the inverse function theorem in Banach spaces.

6. **F06** (P3) The pss2012 dictionary omits the factor in the Ricci form

   Location: `design/README.md`, Conventions, "Dictionaries" bullet, and §6.1 ("`Ric(ω) = −i∂∂̄ log det(g_{k̄j})` … (pss2012 (2.2) and (6.4), line 163–164 and 1005–1006)").

   Witness: pss2012 line 163–164 writes `Ricci(ω_φ) = −(i/2)∂∂̄ log ω_φ^n`, half of the README's `−i∂∂̄ log det g`, consistent with its `(i/2)` normalization of forms. The README's formula is the standard one and its Check (`Ric(ω_FS) = 2ω_FS` on `ℂP¹`: `det g = (1 + |z|²)^{−2}`, so `−i∂∂̄ log det g = 2 i∂∂̄ log(1 + |z|²)`) is correct, but the dictionary only converts `φ` and `Δ`.

   Repair: add to the Dictionaries bullet "pss2012's Ricci form is half ours, `Ric_PSS = (1/2)Ric`, so that `Ric_PSS = λ ω_PSS` and `Ric = λ ω` carry the same `λ`".

7. **F07** (P3) The declared gaps' `needs` sentences describe the absence, not the statement

   Location: `design/plan.json` gaps `weak-harnack-supersolutions` ("PDE plans the Harnack inequality in Lane E item 23 but does not state the weak Harnack inequality for supersolutions on which the L¹ bound rests.") and `abp-maximum-principle` ("No roadmap plans the Aleksandrov–Bakelman–Pucci maximum principle; PDE on its main branch does not.").

   Witness: the intake reads `needs` as the contract; the hypotheses (divergence form, bounded measurable coefficients, `q > m/2`; `C²` functions, positive definite `a`, upper contact set) sit only in `detail` and in the README's contract paragraphs. Both gaps are otherwise precise, minimal (checked: Tau Ceti at the pin has only `TauCeti/Analysis/PDE/Harnack/StrongPrinciple.lean` for harmonic functions and De Giorgi local boundedness; PDE on main plans neither statement) and declared with the same slugs in README and plan.

   Repair: make each `needs` the one-sentence statement with its hypotheses, as in the README's contracts: "the weak Harnack inequality `r^{−m}‖u‖_{L¹(B_{2r})} ≤ C(inf_{B_r} u + r^{2−m/q}‖f‖_{L^q(B_{4r})})`, `q > m/2`, for nonnegative weak supersolutions of divergence-form uniformly elliptic equations with bounded measurable coefficients" and "the Aleksandrov–Bakelman–Pucci bound `sup_Ω u ≤ sup_{∂Ω} u + C(m)·diam(Ω)·‖(Lu)^−/D^{1/m}‖_{L^m(Γ⁺)}` for `C²` functions on bounded domains and `L = a^{ij}∂_i∂_j` with positive definite `a`".

8. **F08** (P3) A vacuous entropy bullet in §3.4

   Location: `design/README.md` §3.4 API ("For normalized `F`, `V⁻¹ ∫ e^{nF} ω_X^n = 1 ≤ Ent_p(F) + e^n`").

   Witness: for normalized `F` the left side is `1` by definition and `Ent_p ≥ 0`, so the bullet says `1 ≤ e^n + (something ≥ 0)`. The useful form is gpt2023 (3.2), line 450–451, for unnormalized `F`: `V⁻¹ ∫ e^{nF} ω_X^n ≤ Ent_p(F) + e^n`, since `e^{nF} ≤ e^{nF}|F|^p` where `|F| ≥ 1` and `e^{nF} < e^n` where `|F| < 1`; it is what §8.6's reduction to the normalized setting uses.

   Repair: state the bullet for arbitrary `F ∈ C⁰(X)` and `p > 0`, and keep "for normalized `F`, `Ent_q(F) ≤ 1 + Ent_p(F)` for `q ≤ p`" as the second bullet.

9. **F09** (P3) The §7.1 route names inputs without a locator or owner

   Location: `design/README.md` §7.1 ("Lelong's monotonicity of `r^{2−2n}·mass(B(x, r))` for plurisubharmonic functions bounds the Lelong numbers uniformly. The one-variable estimate for subharmonic functions with bounded Riesz mass …").

   Witness: neither Lelong's monotonicity formula nor the one-variable Riesz-mass estimate is a target, a supplier section (ComplexKahlerGeometry K6.1's "Lelong estimates" concern analytic sets, ComplexComparisonPartII C5.4 regularizes plurisubharmonic functions) or a pinned declaration, and the only locator of 7.1 is an attribution (pss2012 line 2943–2945; gpt2023 line 287–289) to the uncertified hormander1990.

   Repair: either name both as sub-statements of 7.1 with their hypotheses (a `C²` plurisubharmonic `u` on `B(0, 2)`, the Riesz measure `Δu·dV`, the monotone quantity `r^{2−2n}∫_{B(x,r)} Δu`), or add a readable locator for them (Demailly's *Complex Analytic and Differential Geometry*, Chapter III, is on the author's page and is a legal source; fetch it through the sources service if used).

Reviewed: `packages/ComplexHessianEquations/design/README.md`, `packages/ComplexHessianEquations/design/plan.json` (8 layers, 48 targets, 2 declared gaps) and `packages/ComplexHessianEquations/sources.toml` (18 entries). No previous review. No `Suggested.lean` exists at the design stage, so the Lean checks (elaboration, padding probe, headline statability) are not applicable; elaboration is in any case not available in this lane. Three findings are blocking (P2); six are notes (P3). Nothing is route-specific, nothing re-plans a roadmap wholesale, no supply runs upward, and no source passage is copied; the findings are repairable by citations and hypotheses.

## Verified sound

Principles. The Kähler existence theorem (§6.6) is stated for every `n ≥ 1` and every smooth `F`, with the admissible-pair form for an arbitrary Kähler background; nothing is restricted to a dimension, a small `F` or a special family. The target brief's (T3) Hermitian half and (T5) are moved to a declared "ComplexHessianEquations Part II" with the reason stated in Scope; the brief allowed a split and forbade only route-specific planning of (T3), so this is a scope decision, not a defect. The target's claim that the pure Hessian quotient satisfies the structural condition was refuted by the author and the pair is restated with `c·σ_p^{1/p}`; I recomputed both witnesses (table). No text is copied from a source (spot-checked the ten certified texts at every sampled locator). No algorithm. No process residue: no pull-request number, date, path or anchor in README, plan or manifest; the two "Read at commit" pins name the library commits, as other designs on the board do.

Supplier order. Gate output:

```
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2184 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every supplier is on main at c9a16a0 and every cited section exists: ComplexManifolds Milestones 1–2 (README line 172, 197); ComplexKahlerGeometry K1 (line 96; the conventions `g(u,v) = ω(u,Jv)`, `h_T` conjugate-linear in the first slot, `ω = (i/2)Σ dz∧dz̄` at line 60–77 agree with the README's), K2 (line 193–199: `∂`, `∂̄`, squares zero, Leibniz, pullback naturality), K4 (line 479–505: Chern connection, `A = h⁻¹∂h` at line 86, `(1,1)` curvature), K5a (line 570 onward; line 1047–1076: self-adjoint realization, finite-dimensional kernel, smooth eigensections, Green inverse of formally self-adjoint nonnegative Laplace-type operators on compact manifolds), K6.0 (line 1245–1256: Kähler metrics by closedness, `h_ij = δ_ij + O(|z|²)`, `Δ_d = 2Δ_∂ = 2Δ_∂̄`); PseudodifferentialOperators §5.4 (line 1337) and §6.2 (line 1523–1560: Schauder regularity for smooth-coefficient elliptic operators, Fredholm theory, solvability exactly when the adjoint-kernel conditions vanish); DifferentialGeometry Layers 0, 1, 5, 12 (line 268, 311, 503, 910) with `integralTopForm_mextDeriv_eq_zero` (line 520), `laplaceBeltrami` (line 921), `riemannianVolumeForm` (line 923), `integral_mul_laplaceBeltrami` (line 931); Yamabe Y1.1 (line 113–121: continuous `H¹ → L^{p_n}` on closed manifolds, the Sobolev inequality consumed); PDE Lane C items 12–13 and Lane E items 22–23 (line 290–295, 331–340). Consumers resolve: K3Surfaces §2.1 (open pull request, line 359–367: the two-dimensional Monge–Ampère equation with its own continuity method, a special case of §6.6; K3Surfaces is not in the merge order, so its relative position is undetermined and it is not a supplier), OptimalTransport Layer 6 (line 764, real Monge–Ampère), ComplexComparisonPartII C5.4 (positive currents and regularization, not integrability). The two declared gaps are contracts: PDE on main plans neither statement (Lane C item 13 is Hopf's principle; item 23 is De Giorgi–Nash–Moser with the Harnack inequality for solutions), and the open revision of PDE (its §3.2 and §5.4) plans both, so they close on its merge. `roadmaps resolve` reports no citation and no Lean name found nowhere.

Library declarations at the pins (Mathlib f6090c7, Tau Ceti 358314d), all opened: `LinearMap.IsSymmetric.eigenvalues` (`InnerProductSpace/Spectrum.lean` 278, `irreducible_def`), `eigenvalues_antitone` (311), `hasEigenvalue_eigenvalues` (319), `det_eq_prod_eigenvalues` (389), `eigenvectorBasis`; `Matrix.IsHermitian.eigenvalues` (`Matrix/Spectrum.lean` 66), `spectral_theorem` (142), `det_eq_prod_eigenvalues` (192), `trace_eq_sum_eigenvalues` (239); `LinearMap.IsSymmetric.hasEigenvalue_iSup_of_finiteDimensional` (`Rayleigh.lean` 326, needs `[Nontrivial E]`); `doublyStochastic_eq_convexHull_permMatrix` (`Convex/Birkhoff.lean` 163); `MvPolynomial.esymm` (`Symmetric/Defs.lean` 202) and `Multiset.esymm` (69); `Polynomial.card_roots_le_derivative` (`LocalExtr/Polynomial.lean` 63); `Real.geom_mean_le_arith_mean_weighted` (`MeanInequalities.lean` 129); `HasStrictFDerivAt.toOpenPartialHomeomorph` (`InverseFunctionTheorem/FDeriv.lean` 117); `ArzelaAscoli.isCompact_closure_of_isClosedEmbedding` (`Ascoli.lean` 474). Tau Ceti: `TauCeti.SmoothTwoForm` (`TwoForm/Basic.lean` 61: a smooth section of continuous bilinear forms with `isAlt`, as the README says), `SmoothTwoForm.Tames` (`Symplectic/Manifold/TwoForm.lean` 114: `0 < form x v (J x v)` for `v ≠ 0`), `Invariant` (136), `Compatible` (157: the conjunction, no closedness), `TauCeti.riemannianVolume` (`VolumeDensity/Volume.lean` 76). The only mismatch is R05.

Sources, the seeded sample (every locator read in the cached text):

- 1.2: lewis1996 line 193–195 states local Lipschitz continuity of `λ` as a difference of Ky Fan sums (the README's constant-one bound is Weyl; see R01).
- 1.4: lewis1996 Theorem 1.1 line 77–81 (iff, gradient `U^*Diag(f'(λ(X)))U`), the real symmetric remark line 144, Lemma 2.2 line 165–166, Lemma 2.3 line 185–187, Theorem 2.4 line 199–217, the `C¹` exercise line 468–469; spruck2005 Theorem 1.4(i) line 11072–11073. All support the statements as written, including the "only if" direction (line 83–86).
- 1.6: gpt2023 line 246–250 (Euler identity from degree-one homogeneity) and line 255 (the arithmetic–geometric step) as cited.
- 2.1: spruck2005 Lemma 2.6 line 11257–11259, Proposition 2.7 line 11268–11270 (its equality clause is false off `Γ_n`; the README restricts it, see Source issues), Corollary 2.8 line 11271–11275, Lemma 2.10 line 11279–11293 (hypotheses `λ ∈ Γ_r`, `r ≥ k`, `s ≥ l` as restated); dinew-kolodziej2014 line 152–159.
- 2.4: guo-phong2024 line 76–90 (conditions (1)–(4): symmetric cone `Γ_n ⊂ Γ ⊂ Γ_1`, symmetric degree-one `f`, `∂f/∂λ_j > 0`, `∏ ∂f/∂λ_j ≥ γ`); gpt2023 line 71–76 and (1.4) line 84–86; szekelyhidi2018 line 29–31 and 183–185 (convex cone, concave `f`); gpt2023 Lemma 4 line 744–769 (concavity on `Γ`, AM–GM over `∏μ_j = 1`); guo-phong2024 line 103–104 (positive combinations on intersections); spruck2005 line 11314 (superadditivity of the geometric mean).
- 2.5: gpt2023 line 90–93 and 770–776 (Monge–Ampère, Hessian, `(σ_k/σ_l)^{1/(k−l)} + cσ_p^{1/p}` with `c > 0`); guo-phong2024 line 91–104.
- 3.2: dinew-kolodziej2014 line 33–35 (`(dd^c u)^m ∧ β^{n−m} = (m!(n−m)!/n!)σ_m β^n`, with `d^c = i(∂̄ − ∂)` so `dd^c = 2i∂∂̄`, as the dictionary says), line 165–172 (the tangent inequality for `λ, μ ∈ Γ_m`), Proposition 1.7 line 259–263; gpt2023 line 924–926 (the Maclaurin form inequality with an unspecified `c(n,k)`, which is `1` in the README's normalization: `(β^k ∧ ω^{n−k}/ω^n)^{1/k} = S_k^{1/k} ≥ S_n^{1/n}`).
- 4.2: tosatti-weinkove2010 Corollary 1 line 38–47 (unique `b` and unique `φ`, Monge–Ampère on Hermitian manifolds).
- 5.2: pss2012 is cited only for context; PseudodifferentialOperators §6.2 and PDE item 22 are the inputs and resolve (above).
- 6.1: pss2012 (2.2) line 163–164 (see R06), (6.2)–(6.5) line 994–1008, the Yau–Aubin bracket line 1015–1016, (5.4) line 837–840, (7.1)–(7.4) line 1046–1064.
- 6.2: pss2012 Theorem 3 line 304–308 (dependence on `n`, an upper bound for `‖F‖_{L^∞}` with `F = e^f > 0`, and `ω_0`), the Moser route line 246–303 including the Poincaré start at line 299–303; tosatti-weinkove2010 line 104–106 (`sup F` only).
- 6.4: pss2012 Theorem 9 line 1078–1081 (`C⁵` solution; constants from `∂∂̄ log F`, `∇∇̄∇ log F`, `inf F`, `‖Rm‖_{C¹}`), (7.5)–(7.7) line 1070–1077; twwy2015 line 132–135.
- 6.6: tosatti-weinkove2010 line 52–59 (the Kähler constant `b`), pss2012 Theorem 1 line 170–179 and §2.2 line 216–233.
- 8.1: gpt2023 Lemma 1 line 198–302, with the constants (2.6) line 227, the trace identity line 249–250, the AM–GM step line 255–260, the α-invariant application line 280–289. The README's `inf φ_t < −s` hypothesis and smooth-approximation route are correct repairs of the source (see Source issues).
- 8.3: gpt2023 Theorem 2 line 120–130, the proof line 303–441 with `δ_0 = (p − n)/(pn)` at line 383, `B_0` (2.15) line 384–387, the explicit bound (2.19) line 437–441.

Also read for the headline and finding rows: gpt2023 Theorem 1 line 84–89 and the smoothness of `F` assumed in its proof at line 443; Theorem 3 line 458–476; Lemmas 5–6 line 785–844; Theorem 4 line 847–850; Lemmas 7–8 and Theorem 5 line 861–952 (Theorem 5's dependence list omits `γ`; the README rightly adds it); (5.5) line 974–981; the `L¹` bound at line 689–692; guedj-zeriahi2005 Proposition 1.7 line 255–274; pss2012 Theorem 31 line 2946–2955; szekelyhidi2018 line 17–24.

Ownership, by object. `roadmaps grep` over main and the 455 open pull requests at their heads, and the board packages, for: Monge–Ampère; complex Hessian equation; spectral function; Gårding cone and hyperbolic polynomial (no match); plurisubharmonic; Calabi–Yau theorem (no match); α-invariant and exponential integrability; Aleksandrov–Bakelman–Pucci; weak Harnack; Newton and Maclaurin inequalities (no owner); Poincaré inequality; Courant–Fischer, Weyl, Ky Fan, von Neumann (the hits of R01–R02). ShimuraVarieties §7.0g (open pull request, merge order line 94) needs a negative Kähler–Einstein metric, a different equation, and is not a consumer. ArakelovGeometryAndAbelianHeightsPartII (board) plans pluripotential Monge–Ampère measures, a different object. Nothing else owns admissible pairs, the structural condition, the comparison principle, Yau's theorem, the α-invariant or the Guo–Phong–Tong bounds. Ownership against open pull requests was checked through the tool for every open roadmap pull request (375 new roadmaps).

Shape and completeness. Eight layers, each with `### Examples` and `### Dependencies`; every definition (1.1, 1.4, 2.2, 2.4, 3.1, 3.3, 3.4) has an API list and at least three Checks (counted: 4, 3, 3, 3, 3, 3, 3), with a non-example in each; every theorem carries hypotheses in its sentence and a locator; every `*Needs:*` line resolves. House style: Unicode mathematics in code spans, no LaTeX delimiters, no `**T017**` tables, no "optional" or "deferred" items.

Adversarial pass (values computed on each side):

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions, `λ_ω[α]` | `ℂⁿ`, `ω = Σ dx∧dy`, `α = i∂∂̄|z|²` | `i dz∧dz̄ = 2 dx∧dy`, so `α = 2ω`, `λ = 2e`; relative to `2ω`: `e` | witness pins the pair `(α, ω)` | none |
| Conventions, `H_α` Hermitian | `α` J-invariant | `H(Ju,v) = α(u,v) + iα(Ju,v) = −iH(u,v)` using `α(Ju,v) = −α(u,Jv)`; `H(v,u) = conj H(u,v)`; `H_ω(u,u) = g(u,u) > 0` | conjugate-linear first slot, `λ_ω[ω] = e` | none |
| Conventions, `i∂∂̄u` | `u = x_1²` on `ℂ` | `(1/2)(D²u(∂_y,∂_y) − D²u(∂_x, −∂_x)) = 1 = (dx∧dy)(∂_x,∂_y)`; J-invariant and antisymmetric by substitution | matches `u_{zz̄} = 1/2` | none |
| Conventions, Laplacians | `|z|²`, `x_1²` | `Δ_ω = 2n`, Euclidean `4n`; `1` versus `2` | `2Δ_ω = Δ_g` on Kähler | none |
| 1.1 relative eigenvalues | Gram `diag(2,1)`, `a = diag(2,3)`; `−a`; `a(u,v) = ū_1v_2 − ū_2v_1` | `g⁻¹a = diag(1,3)`, `λ = (3,1)`, Euclidean `(3,2)`; `λ[−a] = (−1,−3)`; matrix `[[0,1],[−1,0]]`, eigenvalues `±i` | holds; non-Hermitian excluded | R01 for the min–max |
| 1.1 `det(Id + tA)` | `A = diag(1,2,3)` | `(1+t)(1+2t)(1+3t) = 1 + 6t + 11t² + 6t³` | holds | none |
| 1.2 Weyl | `diag(3,0) ≤ diag(3,1)`; `[[0,ε],[ε,0]]` | `(3,0) ≤ (3,1)`, cross pairing `3 > 1`; `λ = (ε,−ε)`, `‖T‖ = ε` | true, owned by PD-A52/A53 | R01 |
| 1.3 von Neumann–Fan | `F = diag(2,1)`, `B = diag(0,3)`, `B' = diag(3,0)` | `tr FB = 3`, bounds `3` and `6`; `tr FB' = 6` | true, owned by PA-B32 | R02 |
| 1.3 Ky Fan gradient | `T = diag(3,1,1)`, `m = 1, 2` | `m=1`: gap `3 > 1`, gradient `diag(1,0,0)`; `m=2`: eigenvalues `3, 1+t, 1−t`, two largest sum to `4 + |t|` | gap needed; this part is new | kept |
| 1.4 Lewis | `f = σ_2`, `T = [[2,1],[1,2]]` | `det T = 3`, `3T⁻¹ = [[2,−1],[−1,2]]`; wrong model `diag(1,3)` | eigenbasis formula | none |
| 1.4 only-if | `f = max`, `T = Id`, `H = diag(1,0)` | `λ_1(Id + tH) = 1 + max(t,0)` | non-differentiable both sides | none |
| 1.5 concavity | `det^{1/2}` at `diag(4,1)`, `diag(1,4)` | `2, 2`, midpoint `5/2` | holds | none |
| 1.5 convexity of `Sym_Γ` | `Γ_2 ∪ {μ_1 > 0, −μ_1/2 < μ_2 < −μ_1/3} ∪ mirror` | `(1,−0.4)`: `−0.5 < −0.4 < −0.333` in; `(1,0.1)` in; midpoint `(1,−0.15)` out; `σ_1 = 0.6 > 0` so `Γ ⊆ Γ_1`, `Γ_2 ⊆ Γ` | an admissible non-convex cone | none |
| 1.5 monotonicity | `f = −σ_1`, `Γ_1`, `S = diag(1,0) ≤ T = diag(2,0)`; `f ≡ 0` | `F(S) = −1 > −2 = F(T)`; `F(S) = F(T)`, `S ≠ T` | false without ellipticity | R03 |
| 1.6 determinant and Euler | `f = σ_2^{1/2}`, `T = diag(1,4)`; `f = σ_2` | partials `1, 1/4`, `det = 1/4`, `tr(∇F·T) = 2 = F`; `8 = 2F` | holds, degree matters | none |
| 1.6 trace AM–GM | `A = diag(1,4)`, `B = Id`, `B = A⁻¹` | `5 ≥ 4`; `2 = 2`; `tr(AB) = Σ eig(A^{1/2}BA^{1/2}) ≥ n det^{1/n}` | equality iff `B = cA⁻¹` | none |
| 2.1 Newton, Maclaurin | `(1,2,3)`; `(1,0,0)`; `−e` | `S = (2, 11/3, 6)`: `12 ≤ 121/9`; `2 ≥ 1.915 ≥ 1.817`; `S_1S_3 = 0 = S_2²` with unequal entries; `−1 < 1` | equality clause only on `Γ_n`; Maclaurin needs the cone | none (source issue) |
| 2.1 shift expansion | `n = 3`, `k = 2`, `λ = e`, `t = 1` | `σ_2(2e) = 12 = 3 + 6 + 3` | holds | none |
| 2.2 `Γ_k` | `(3,3,−1)`, `(2,2,−1)`, `−e ∈ ℝ³` | `σ = (5, 3, −9)`; `σ_2 = 0`; `σ_2(−e) = 3`, `σ_1 = −3`, midpoint `0 ∉ {σ_2 > 0}` | lower `σ_j` needed | none |
| 2.2 `Γ(σ_k,e) = Γ_k` | inclusion `⊇` | `σ_k(λ + te) = Σ_j binom(n−j,k−j)σ_j t^{k−j} > 0` for `t ≥ 0` when `σ_1..σ_k > 0` | holds | none |
| 2.3 quotient, tangent | `σ_2/σ_1` at `(4,1)`, `(1,4)`, `(2.5,2.5)`; `σ_2^{1/2}`, `λ = (1,4)`, `μ = (4,1)` | `0.8, 0.8, 1.25`; `2 ≤ 4 + 1/4` | holds | none |
| 2.4 positivity | `σ_1 − ε|λ|` at `(1, −1+δ)` | `∂_j f = 1 − ελ_j/|λ| > 0`; `f = δ − ε√(1 + (1−δ)²) < 0`; `σ_1 = δ > 0` | `f > 0` only on `Γ_n` | none |
| 2.4 combinations | superadditivity | `∏(a x_j + b y_j)^{1/n} ≥ a∏x_j^{1/n} + b∏y_j^{1/n} ≥ aγ_1^{1/n} + bγ_2^{1/n}` | constant as stated | none |
| 2.5 constants | MA `n = 2` at `(1,4)`; Hessian `n = 3`, `k = 2` at `e`; `k = 1`, `k = n` | `1·(1/4) = 2⁻²`; `∂_jσ_2^{1/2}(e) = (1/2)3^{−1/2}·2 = 3^{−1/2} = binom(3,2)^{1/2}/3`, `γ = 3^{−3/2}`; `1`; `n^{−n}`; Maclaurin gives `nγ^{1/n} = binom(n,k)^{1/k}` | sharp at `e` | none |
| 2.5 pure quotient | `n = 2`, `(ε,1)`; `n = 3`, `(M,1,1)` | `ε²/(1+ε)⁴`; `∂_1 f = 3/(M+2)²`, `∂_2 f = (M²+M+1)/(M+2)²`, product `3(M²+M+1)²/(M+2)⁶ → 0` | no structural constant | none |
| 3.2 form identity | `n = 2`, `α = λ_1e_1 + λ_2e_2`, `ω = e_1 + e_2` | `α∧ω = (λ_1+λ_2)e_1e_2 = ((λ_1+λ_2)/2)ω²`; `α² = λ_1λ_2ω²` | holds | none |
| 3.2 Gårding mixed | polarization | `M_k(α, β^{(k−1)}) = (1/k)D_α(σ_k∘λ)(β) ≥ σ_k(α)^{1/k}σ_k(β)^{(k−1)/k}` from concavity of `p^{1/k}` on the matrix cone | holds | none |
| 3.2 `∫Δ_ω u ω^n` | double Stokes | `= n∫u·i∂∂̄ω^{n−1}`, `0` when `dω = 0` or `n = 1` | Kähler needed | none |
| 3.3 constants | `χ = ω`, `F = 0`; `ℂP¹`, `χ = 2ω`, area `1`; Hessian normalization | `c = 1, binom(n,k)^{1/k}, n`; `c = 2`; `c^k = binom(n,k)∫χ^k∧ω^{n−k}/∫e^{kF}ω^n` from `χ_φ^k∧ω^{n−k} = σ_k/binom(n,k)·ω^n` | holds, matches gpt2023 (5.5) up to `binom` | none |
| 3.4 entropy | normalized `F` | `1 ≤ Ent_p + e^n` is `1 ≤ e^n + (≥ 0)` | vacuous | R08 |
| 3.4 volumes | `χ = ω_X` | `V_t = (1+t)^nV`, `c_t^n = V_t/V = (1+t)^n` | holds | none |
| 4.1 comparison | `ℂ`, `χ = ω`, `ψ = −|z|²/4` | `i∂∂̄ψ = −ω/2`, `λ[χ_ψ] = 1/2 ≤ 1` | holds | none |
| 4.2 uniqueness | two components; no normalization; route | `ψ = −1` on `X_2` solves with `c = f(e)`; `φ, φ+1`; `a = ∫_0^1∇F_f(h_s)ds` continuous positive definite, `Re tr(aH_{i∂∂̄w}) = (c' − c)e^F = 0` | connectedness, `sup = 0`, `Γ` convex all used | none |
| 5.1 Laplacians | unit torus `cos 2πx`; `ω = e^{x_1}ω_0` on `ℂ²` | `Δ_ω = −2π²u`, Euclidean `−4π²u`; conformal `Δ_g u = e^{−ρ}(Δ_0u + ⟨∇ρ,∇u⟩)`, so `2Δ_ω u − Δ_g u = −e^{−x_1}` | Kähler needed | none |
| 5.2 isomorphism, compactness | torus; `u_j = j^{−α}sin(jx)` | `Δ_ω⁻¹cos 2πx = −cos 2πx/(2π²)`; quotient at `|x−y| = π/(2j)` is `(2/π)^α`, `sup → 0` | `β` summand, strict exponent loss | none |
| 5.3 Poincaré | circle `2π`, `sin` | `λ_1 = 1`, `‖sin‖ = ‖cos‖` | equality case | none |
| 5.4 `L¹` bounds | `ψ_ε = log((|z|²+ε)/(1+|z|²))` on `ℂP¹`; `φ = −M` | `ω' + i∂∂̄ψ_ε = i∂∂̄ log(|z|²+ε) ≥ 0`, `sup = 0`, `∫(−ψ_ε)` bounded; unbounded without `sup = 0` | holds; gap input correct for the second statement (`∂_i(√g g^{ij}∂_j(−φ)) ≤ 2A√g`) | none |
| 6.1 Ricci | `ℂP¹`, `ω = i∂∂̄ log(1+|z|²)` | `det g = (1+|z|²)^{−2}`, `Ric = 2ω`; `2ω` gives the same | holds; pss factor `1/2` | R06 |
| 6.2 `C⁰` | `ℂ²/ℤ⁴`, `φ = ε cos 2πx_1` | `φ_{zz̄} = −π²ε cos`, `i∂∂̄φ = −2π²ε cos·dx_1∧dy_1`, `λ = (1 − 2π²ε cos, 1)`, `e^F` as stated, `∫e^Fω² = ∫ω²`, `osc = 2ε`, `sup F = log(1+2π²ε)` | holds | none |
| 6.3 `C²` | `λ = (4, 1/4)`, `e` | `tr h = 17/4`, `4/17 ≤ 17/4`; `1/n` versus `n` | holds | none |
| 6.4 `C³` | torus solution | `∂_{z_1}h_{11} = −2π²ε·(1/2)(−2π sin) = 2π³ε sin(2πx_1)`, `S = O(ε²)` | holds | none |
| 6.6 Yau | `F = 0, a`; unit torus `n = 1`, `F = ε cos 2πx`; `n = 1` route | `b = 0, −a`; `∫_0^1 e^{ε cos 2πx} = I_0(ε)`, `b = −log I_0(ε) = −ε²/4 + O(ε⁴)`; `ω_φ = (1 + Δ_ωφ)ω`, solvable iff `e^b∫e^Fω = ∫ω` | holds; openness via `toOpenPartialHomeomorph` and §5.2 | R05 |
| 7.1 local estimate | `u = c log(|z|²/4)`; `−|x|^{−1}` on `ℝ⁴` | `e^{−αu} = 4^{αc}|z|^{−2αc}` integrable iff `αc < n`; `Δ r^{−1} = −r^{−3} < 0` so `−|x|^{−1}` subharmonic, `∫_{B(0,2)}|x|^{−1} < ∞`, `e^{α/|x|} ∉ L¹` | `α ∼ 1/A`; plurisubharmonicity needed | R09 (locators) |
| 7.2 global | `ψ_ε` near `0`; `2ω̂` | `(|z|²+ε)^{−α}` unbounded in `L¹` iff `α ≥ 1`; `α(2ω̂) = α(ω̂)/2` | `α` depends on `ω̂` | none |
| 8.1 comparison | `A_s` sign; `φ_t ≡ 0` | `A_s > 0 ⟺ {φ_t < −s} ≠ ∅ ⟺ inf φ_t < −s`; `Ω_s = ∅` | hypothesis exact | none |
| 8.2 De Giorgi | `1_{[0,1)}`; `e^{−s}`; `δ_0 = 0`; the induction | `rφ(s+r) ≤ φ(s)` both; `s_{j+1} − s_j < 2B_0φ_j^{δ_0} ≤ 2^{−jδ_0}`, sum `1/(1−2^{−δ_0})` | holds as stated | none |
| 8.3 route | `φ_t ≡ −1` on open `U` | `s ↦ m{φ_t ≤ −s}` jumps at `s = 1` from the right | right-continuity fails | R04 |
| 8.3 exponents | `p = n`; `δ_0` | `δ_0 = (p−n)/(pn) = 0` | `p > n` needed | none |
| 8.4 energy | `χ ≤ ω_X` | `φ_t` is `2ω_X`-quasi-plurisubharmonic; Jensen with `ω_φ^n/V_t` gives `E_t ≤ C(Ent_1)` | holds | none |
| 8.5 (c) | `p' < 1` | Jensen needs `V⁻¹∫Fe^{nF} ≤ Ent_{p'}`, which uses `|F| ≤ |F|^{p'}` only for `p' ≥ 1` | restriction correct | none |
| 8.6 fixed | `n = 1` | `N = 1`, `p' = n = 1`: 8.5(c) gives `E(φ) ≤ C` with no Hölder exponent `n/(n−1)` | route repairs the source | none |
| 8.7 Lemma 8, Theorem 5 | `k = n`; `n = 2, k = 1`; `γ` | `n/(n−k)` infinite; `|x|^{−2} ∈ L^{p'}(ℝ⁴)` iff `p' < 2`; `q = n/k` conjugate; Theorem 2 needs `γ` | holds; `γ` rightly added | none |

Gaps. Both declared gaps are precise in the README's contracts, minimal (Tau Ceti at the pin has `TauCeti/Analysis/PDE/Harnack/StrongPrinciple.lean` for harmonic functions only and `LocalBoundedness.lean` for De Giorgi local boundedness, neither statement; PDE on main plans neither), named by the same slug in README and plan, and needed exactly where used (5.4.2, 8.5–8.7; 8.5–8.6). R07 is about the wording of `needs` only. The acceptance, once the P2 findings are repaired, is conditional on these two gaps.

Headline theorems for the package stage (from the Summary): (T1) Lewis's derivative theorem and Spruck's concavity theorem with the structural equivalence (§§1.4–1.6, 2.4); (T2) uniqueness (§4.2); (T3) Yau's theorem (§6.6); (T4) the Guo–Phong–Tong bounds on fixed and degenerating backgrounds (§§8.3, 8.6); the uniform exponential integrability (§7.2). At the pins, (T1) is statable on `LinearMap.IsSymmetric` with `HasFDerivAt`; (T2)–(T4) and §7.2 need carriers the pins lack (continuous real (1,1)-forms, `i∂∂̄` of a `C²` function, Kähler metrics on a complex manifold), so the package's `Suggested.lean` should state (T1) and name the rest in its docstring unless it keeps simple definitions on `TauCeti.SmoothTwoForm.Compatible`.

## Not verifiable

- gilbarg-trudinger2001 (Theorems 2.1, 3.5, 8.18, 9.1, Lemmas 9.2, 17.16), yau1978 §2, szekelyhidi2014 Theorem 3.1, tian1987, hormander1990 Chapter IV, kolodziej1998 §1, cns1985 §1, ckns1985 Theorem 1: paywalled or blocked, recorded `uncertified` and settled; cited by locator only. The readable locators for the same statements (pss2012, gpt2023, tosatti-weinkove2010) were checked instead.
- Elaboration: no `Suggested.lean` exists at the design stage, and this lane does not elaborate.
- The relative merge-order position of K3Surfaces (open pull request, not in `merge-order/ORDER.txt`): the README calls it a later consumer; it is not cited as a supplier, so nothing depends on it.

## Source issues

- **Error** in spruck2005 at Proposition 2.7, printed page 290: the source says the Newton inequality `H_{r−1}H_{r+1} ≤ H_r²` on all of `ℝⁿ` is an equality only when all components are equal; it should restrict the equality clause to `λ ∈ Γ_n` (positive entries), since `λ = (1,0,0)` gives `H_1H_3 = 0 = H_2²` with unequal entries; affects a stated result.
- **Gap** in gpt2023 at the proof of Lemma 1, line 217–218 (arXiv v1, p. 6): the source says the auxiliary equation (2.3) has a unique smooth solution by Yau's theorem although its right-hand side `τ_k(−φ_t − s)·e^{nF_t}` is only as regular as the `C²` solution `φ_t`; it should approximate the right-hand side by smooth positive functions and pass to the limit, or cite an existence theorem for `C^{2}` data; affects the proof.
- **Gap** in gpt2023 at the proof of Theorem 2, line 407 (p. 9): the source says the sublevel function `s ↦ (c_t^n/V_t)∫_{{φ_t ≤ −s}} e^{nF_t}` is clearly continuous; it is only left-continuous when a level set of `φ_t` has positive measure, and Lemma 2 needs right-continuity; it should use the strict sublevel sets, on which `A_s` and the Hölder step are unchanged; affects the proof.
- **Gap** in gpt2023 at Theorem 1, line 84–89 (p. 3): the source says `F` is a real function and `φ ∈ C²`; its proof at line 443 assumes `F` smooth; it should state the smoothness assumed or add the approximation argument; affects a stated result.
- **Misprint** in gpt2023 at Theorem 5, line 948–952 (p. 20): the source says the constant depends only on `n, k, q, ω_X, χ, ‖e^{nF_t}‖_{L^q}` and `c_t^n/V_t`; it should also list the structural constant `γ`, through which Theorem 2 enters; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ab4bd342e7249697e7a7b3ae02d48a650f423698", "job": "REV-DESIGN-ComplexHessianEquations", "model": "fable", "worker": "chris-x17"} -->
