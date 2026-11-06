<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/6954#issuecomment-6675926184 -->
Review (claude) of ab3da9a

Verdict: needs_changes

1. **F01** (P2) 1.9 states Kato–Rosenblum for the 1.7 wave operator, not for its compression to `ℋ_ac(H₁)`

   Location: README line 530–534, "`Ω_±(H₂,H₁)` is a partial isometry with initial space
   `ℋ_ac(H₁)` and final space `ℋ_ac(H₂)`"; the Check at line 547, "`V = 0`: `Ω_± = P_ac(H₁)`".

   Claim: the operator `Ω_±` of 1.7 (defined on `D_±`, the set of all `ψ` for which
   `e^{itH₂}e^{−itH₁}ψ` converges) is, under the trace-class hypothesis, a partial isometry with
   initial space `ℋ_ac(H₁)`.

   Witness: `V = 0`, `H₁ = H₂ = diag(1, 2)` on `ℂ²` (trace class, self-adjoint). By 1.7,
   `D_± = ℂ²` and `Ω_± = 1` (1.7's own Check "`H₁ = H₂`: `Ω_± = 1`"), while `ℋ_ac(H₁) = 0`; a partial
   isometry with initial space `0` is the zero operator, so the 1.9 statement is false for the 1.7
   object, and the two Checks ("`Ω_± = 1`" in 1.7, "`Ω_± = P_ac(H₁)`" in 1.9) contradict each other
   on the same instance. Kato's theorem (kato57 line 25–35, (1.1)) is about
   `s-lim e^{itH₁}e^{−itH₀}P₀`, the limit composed with the projection onto the absolutely
   continuous subspace, as the target's filed item 5 also wrote it.

   Repair: in 1.9 (and in plan target 1.9) name the compressed operator, for instance
   `W_±(H₂,H₁) := Ω_±(H₂,H₁) P_ac(H₁)` (defined on `ℋ` once 1.9's existence clause
   `ℋ_ac(H₁) ⊆ D_±` holds), and state the partial-isometry, adjoint (`W_±(H₂,H₁)* = W_±(H₁,H₂)`) and
   intertwining (`H₂ P_ac(H₂) = W_± H₁ P_ac(H₁) W_±*`) clauses for `W_±`; keep `Ω_±` of 1.7 as the
   unrestricted limit. Change the Check to "`V = 0`: `W_± = P_ac(H₁)` while `Ω_± = 1`". Tested on
   the witness: `W_± = P_ac = 0` on `ℂ²`, a partial isometry with initial and final space `0`;
   on `H₁ = M_x` on `L²(ℝ)` with `V = 0`, `W_± = Ω_± = 1 = P_ac`.

2. **F02** (P2) 3.8 is stated for the empty manifold and identifies `λ_k` with junk-valued Courant–Fischer values in dimension 0

   Location: README line 843–849, "`σ(Δ_X) = σ_disc(Δ_X)` consists of eigenvalues
   `0 = λ₀ ≤ λ₁ ≤ ⋯` … the `λ_k` are the Courant–Fischer values of VariationalMethods 4.4; and if
   `dim X ≥ 1` and `X ≠ ∅` then `λ_k → ∞`".

   Claim: for every compact `X` (the Conventions admit dimension `0` and do not exclude `∅`), `0` is
   an eigenvalue `λ₀` of `Δ_X`, and `λ_k(X) := μ_{k+1}(Δ_X)` equals VariationalMethods 4.4's
   `rayleighMinMax ⊤ k`.

   Witness (two instances): (i) `X = ∅` is compact; `L²(X) = 0`, `σ(Δ_X) = ∅`, so no `λ₀ = 0` exists,
   and by the Conventions' extended-value rule `λ₀ = μ₁(Δ_∅) = inf ∅ = +∞ ≠ 0`. Only the last clause
   carries `X ≠ ∅`; 3.7 states its bottom-of-spectrum clause "for `X ≠ ∅`". (ii) `X` = `N` points,
   `N ≥ 1`: the README's own 3.8 Check gives `λ_k = 0` for `k < N`, and 1.6's convention gives
   `λ_k = +∞` for `k ≥ N` (empty admissible set), whereas VariationalMethods 4.4 (its head, "for
   `dim L ≤ n` it is the junk value `0`") gives `rayleighMinMax ⊤ k = 0` for `k ≥ N`. So
   "the `λ_k` are the Courant–Fischer values of VariationalMethods 4.4" is false for `k ≥ N`.

   Repair: begin the eigenvalue clause with "if `X ≠ ∅`" (as 3.7 does), and state the Courant–Fischer
   identification for `k < dim L²(X)` (automatic when `dim X ≥ 1`, since `L²(X)` is then
   infinite-dimensional), adding the `N`-point instance as the negative-control Check for the junk
   value. Tested: `X = ∅` now makes no claim about `λ₀`; for `N` points the identification holds for
   `k < N` (`0 = 0`) and is not asserted for `k ≥ N`.

3. **F03** (P3) 3.5's smooth step cannot have the stated slope

   Location: README line 772–774, "a fixed smooth step `φ` equal to `0` on `(−∞, 1/4]`, to `1` on
   `[3/4, ∞)` and with `|φ'| ≤ 2`".

   Claim: such a smooth `φ` exists.

   Witness: `1 = φ(3/4) − φ(1/4) = ∫_{1/4}^{3/4} φ' ≤ (1/2)·sup|φ'|`, so `sup|φ'| ≥ 2` with equality only
   when `φ' ≡ 2` on `(1/4, 3/4)`, which is incompatible with `φ'` continuous and `0` at the endpoints.
   The theorem's bound `4/k` is still attainable.

   Repair: take `φ = 0` on `(−∞, 1/8]`, `φ = 1` on `[7/8, ∞)` with `|φ'| ≤ 2` (a rise of `1` over
   length `3/4` needs average slope `4/3 < 2`, so a smooth such step exists); the `1/8`-approximation
   `g` of the clamp `f` still gives `χ_k = φ∘g = 1` where `f = 1` (`g ≥ 7/8`) and `0` where `f = 0`
   (`g ≤ 1/8`), with `|grad χ_k| ≤ 2·(2/k) = 4/k`. Tested on flat `ℝ^d`: `|grad χ_k| ≤ 2·(1/k + 1/k)`
   after smoothing, consistent with the Check "gradient `≤ 2/k`" up to smoothing.

4. **F04** (P3) 3.8's dimension-0 Check contradicts the extended-value convention

   Location: README line 854–855, "`λ₀ = ⋯ = λ_{N−1} = 0`, so `λ_k → ∞` fails and the clause needs
   `dim X ≥ 1`".

   Claim: on `N` points the sequence `λ_k` does not tend to `+∞`.

   Witness: by the Conventions ("Min–max values … take values in `ℝ ∪ {+∞}`") and 1.6's Check
   ("`μ₄ = +∞`"), `λ_k = μ_{k+1}(Δ_X) = +∞` for `k ≥ N`, so the sequence does tend to `+∞`; what fails
   is that `L²(X)` is finite-dimensional, so there are only `N` eigenvalues.

   Repair: reword the Check: "`L² = ℂ^N` has only `N` eigenvalues, all `0`, and `λ_k = +∞` for
   `k ≥ N`; the clause asserts infinitely many finite eigenvalues tending to infinity, which needs
   `dim X ≥ 1`", and phrase the 3.8 clause accordingly ("the eigenvalues, listed with multiplicity,
   form an unbounded sequence").

5. **F05** (P3) 1.6's corollary uses an undefined order "`A ≤ B` in form sense"

   Location: README line 459–460, "`A ≤ B` in form sense gives `μ_n(A) ≤ μ_n(B)`".

   Claim: a form order on semibounded self-adjoint operators with possibly different domains is
   understood.

   Witness: the README defines no such order; teschl line 5056–5057 (Corollary 4.11) writes
   `A ≥ B` as `A − B ≥ 0` for operators on a common domain, and 1.6 computes `μ_n` on `dom A` or on
   the form domain, so without a domain inclusion the comparison is not even well-posed.

   Repair: state the order as "`Q(B) ⊆ Q(A)` and `q_A(ψ) ≤ q_B(ψ)` for `ψ ∈ Q(B)`", with `Q` the form
   domain of UO-D06; then the min–max over `Q(A) ⊇ Q(B)` is at most the min–max over `Q(B)` of the
   larger form, which is the claimed inequality. Tested on `A = diag(1,3)`, `B = diag(2,4)`:
   `μ₁ = 1 ≤ 2`, `μ₂ = 3 ≤ 4`.

6. **F06** (P3) 3.2 calls the operator on `C_c^∞` "the minimal operator", against its cited source

   Location: README line 657–659, "Define the **minimal operator** `Δ₀` as the partial operator with
   domain `D₀` … (bms02 line 151–157)".

   Claim: the source's minimal operator is the operator on `C_c^∞`.

   Witness: bms02 line 152–153 defines the minimal operator as the closure of the operator from the
   initial domain `C_c^∞`, and the maximal operator as its adjoint.

   Repair: either call `Δ₀` "the Laplacian on `C_c^∞(X; ℂ)`" and note that its closure is bms02's
   minimal operator, or define the minimal operator as `closure Δ₀` and keep `Δ₀` as the initial
   operator; 3.3's "`Δ₀† = Δ_max`" is unaffected since `(closure Δ₀)† = Δ₀†`.

7. **F07** (P3) 1.2 attributes the nonseparable counterexample to UO-C03, which does not state it

   Location: README line 388–391, "it is false in general, by UO-C03's example on `ℓ²(ℝ) ⊕ L²(ℝ)`".

   Claim: UnboundedOperators UO-C03 contains that example.

   Witness: UO-C03 at the open head (UnboundedOperators §3.3) states the finite-control-measure
   qualification and the arbitrary-`ℋ` construction, but no `ℓ²(ℝ) ⊕ L²(ℝ)` example (searched for
   `ℓ²(ℝ)`, "nonseparable", "counting measure"). The example itself is right: for the coordinate
   operator `⊕ M_x`, `P_A(M) = P_pp` forces `1_M(t) = 1` for every `t ∈ ℝ` and `1_M = 0` almost
   everywhere, impossible.

   Repair: state the example as this roadmap's own Check of 1.2 (with the computation above) and cite
   UO-C03 only for the finite-control-measure case.

8. **F08** (P3) 3.10's locator points past the passage that supports the cusp identity

   Location: README line 866–867 and 870–872, "(lp80 line 279–290 for the zero Fourier mode on a
   cusp …)" and "`Δ (y^{1/2} f(log y)) = y^{1/2}(1/4 − ∂_r²) f`".

   Claim: lp80 line 279–290 supports the identity used in the Weyl-sequence route.

   Witness: lp80 line 279–290 defines the zero Fourier coefficient and the data orthogonal to the
   incoming and outgoing spaces; the identity is lp80 line 251–256, where `x`-independent solutions
   satisfy `u_tt = y²(∂ₓ² + ∂ᵧ²)u + u/4` and the substitution `s = log y`, `v = u/√y` gives the classical
   wave equation `v_tt = v_ss`, that is, `(Δ − 1/4)(√y v) = −√y v_ss`. I recomputed the identity
   directly: `∂ᵧ²(y^{1/2}f(log y)) = y^{−3/2}(f'' − f/4)`.

   Repair: cite lp80 line 251–256 (equations (2.8)–(2.10)) for the identity and keep line 279–290
   for the zero-mode vocabulary.

9. **F09** (P3) 1.4 cites SA-B85 for a cyclic decomposition of a PVM on `ℝ`; SA-B85 is stated for compact `K`

   Location: README line 441–442 and 220–221, "the countable orthogonal cyclic decomposition of
   SA-B85" and "SA-B85 (orthogonal cyclic decomposition; countable in a separable space)".

   Claim: SA-B85 provides the cyclic decomposition of the spectral PVM of an unbounded `A`.

   Witness: OperatorTheory/SelfAdjointSpectralTheory on main, SA-B85 (README line 676–690), is for a
   unital representation of `C(K, ℂ)` with `K` compact metrizable; the passage from `ℝ` to its
   one-point compactification and the agreement of `C₀(ℝ)`-cyclic and `C(ℝ⁺)`-cyclic subspaces is
   SA-B86 (README line 733–759), which UnboundedOperators also cites for the same purpose (its head,
   line 1283).

   Repair: cite "SA-B85–SA-B86" in 1.4's route, the supplier contract and plan target 1.4d.

10. **F10** (P3) 3.2's interval Check cites UO-E05 for the closure's domain

   Location: README line 679–680, "its closure has domain `H²₀(0,1)` (UnboundedOperators UO-E05)".

   Claim: UO-E05 states that the closure of `−d²/dx²` on `C_c^∞(0,1)` has domain `W^{2,2}_0(0,1)`.

   Witness: UO-E05 at its head (UnboundedOperators §5.6) states the Dirichlet Laplacian with domain
   `H²(0,1) ∩ H¹₀(0,1)` and sine-span and form cores; it does not state the closure of the minimal
   operator or `W^{2,2}_0`. The fact is standard (`W^{2,2}_0` is PDE §1.2's `TauCeti.Wkp0` with
   `k = 2`).

   Repair: cite PDE §1.2 (A2) for `W^{2,2}_0(0,1)` as the closure of `C_c^∞` in the `W^{2,2}` norm,
   which is the graph norm of `−d²/dx²` on `(0,1)` up to equivalence, and keep UO-E05 for the
   Dirichlet realisation only.

11. **F11** (P3) LaTeX escape inside a code span

   Location: README line 342, "`g = 3·1_{\{2\}}`".

   Claim: house style (ASCII in code spans, no LaTeX).

   Witness: the backslash-escaped braces are LaTeX residue; `1_{{2}}` or `1_{2}` is the intended
   indicator.

   Repair: write `g = 3·1_{{2}}` (and the same in the design report's table if it is kept).

12. **F12** (P3) two source citations cover a narrower case than the statement they support

   Location: README line 783–786 (3.6 cites bms02 Corollary 2.10 for every complete `X`) and line
   807–810 (3.7 cites hm23 line 41–43 for the kernel on every complete `X`).

   Claim: the sources state the general cases.

   Witness: bms02 line 128–129 assumes `M` connected throughout; hm23 line 39–43 is about finite-area
   hyperbolic surfaces. The README's statements are true in the generality written (3.5's route
   enumerates components, and 3.7's kernel route is self-contained), but the citations do not say so.

   Repair: add "bms02 assumes `M` connected; the disconnected case follows componentwise, since
   `L²(X) = ⊕_j L²(X_j)` and `Δ₀` preserves the summands" to 3.6, and in 3.7 cite hm23 for the
   finite-area surface case only (grigoryan09 Ch. 4 by locator for the general kernel statement).

Files reviewed: `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md` (README),
`packages/SchrodingerOperatorsAndSpectralTypes/design/plan.json` (plan),
`packages/SchrodingerOperatorsAndSpectralTypes/sources.toml` (manifest). No previous review.
Line numbers below refer to the README unless a file is named.

## Verified sound

**Principles.** No route-specific shortcut (every statement is for arbitrary self-adjoint
operators, arbitrary smooth Riemannian manifolds, every `d ≥ 1`); no re-planned roadmap (the
decomposition `ℋ = ℋ_pp ⊕ ℋ_ac ⊕ ℋ_sc`, the Friedrichs extension, Weyl's criterion and the
relatively compact perturbation theorem are imported from UnboundedOperators by section; the
compact case consumes ComplexKahlerGeometry K5a and VariationalMethods 4.4); no copied passage
(spot-checked 1.1–1.9, 2.3, 3.6, 3.10, 4.2–4.5 against teschl, kato57, bms02, lp80, kps26); no
computational algorithm; no process residue (grep for `$`, `\(`, pull-request numbers, "deferred",
"optional", "so far", "removed", machine paths: none); the word `lemma` occurs only in
"Glazman's lemma" and "Rosenblum's lemma". The free Laplacian on `H²(ℝ^d)` is moved down from
QuantumFoundations §8.2 (merge-order line 202, later than this design's position) with the move
recorded in the Scope; QuantumFoundations §8.2 at its head (its README line 887–889) plans
`−Δ/(2m)` on `H²(ℝⁿ)` with `σ = σ_ac = [0,∞)`, so the move is required and correct.

**Dependency check.** Output of the gate command on the design README:

```
candidate: SchrodingerOperatorsAndSpectralTypes is not in the merge order yet; checked as if placed after HilbertModules (the intake inserts it when its design is accepted)
note: supplier VariationalMethods of SchrodingerOperatorsAndSpectralTypes is not in the merge order; it must be inserted before SchrodingerOperatorsAndSpectralTypes
depcheck: 242 roadmaps, 2371 edges, 0 problem(s)
```

No UPWARD or CYCLE line. UnboundedOperators (another author's pull request adding a new roadmap
folder; its OperatorTheory changes are not consumed: every SA- citation was resolved on main) and
VariationalMethods (another author's new-roadmap pull request) are consumable; HilbertModules is
at merge-order line 11; the consumers AutomorphicSpectralTheory (82), CongruenceSpectralGap (146),
QuantumFoundations (202), RicciFlow (204), SpectralManifolds (222), PositiveMass (271) are all
later; MaassForms and RelativisticQuantumFieldTheory are not in the order. No cycle:
ComplexKahlerGeometry and VariationalMethods appear only as suppliers.

**Supplier citations resolved** (each opened at main or at the open head): SA-B21, SA-B44,
SA-B45, SA-B85, SA-C12–SA-C19, SA-C25, SA-C28, SA-C39, SA-C44, SA-C52–SA-C54, SA-C86, SA-D02,
SA-D12, SA-D18, SA-D22, SA-E01, SA-E05–SA-E09, SA-E11–SA-E13, SA-E26–SA-E30, SA-E44, SA-E47
(OperatorTheory/SelfAdjointSpectralTheory on main, README lines 291–1327); OI-B29, OI-B32, OI-B36,
OI-B41 (OperatorIdeals on main, lines 349–375); UO-A01, UO-A02, UO-A06, UO-A07, UO-C01, UO-C02,
UO-C03, UO-D06, UO-E01, UO-E04, UO-E05, UO-E06 (UnboundedOperators head, §§1.1–5.7); HilbertModules
H6 (head, "if T* is densely defined, T is closable and `(closure T)* = T*`", deficiency spaces);
VariationalMethods 4.4, 5.1, 5.2 (head); ComplexKahlerGeometry K5a (`BundleTest`,
`BundleDistribution`, `H^s_loc`, "`Pu ∈ H^s_loc` implies `u ∈ H^(s+2)_loc`" with the explicit
`L²_loc → H¹_loc` step, the compact `H²` realisation with compact resolvent and smooth eigenbasis,
K5a.ComponentwiseCompact; main README lines 631–1160); PseudodifferentialOperators P1.0 (main,
line 164 and 404–405, density transpose and formal adjoint); SmoothBundlesConnections B2.2 (main,
line 605 and the density/injectivity/separability clauses under `IsLocallyFiniteMeasure` and
`IsOpenPosMeasure`); DifferentialGeometry 12.2–12.5 (main, Layer 12: `mgradient`, `divergence`,
`laplaceBeltrami := divergence ∘ mgradient`, full support, `integral_mul_laplaceBeltrami`);
RiemannianGeometry R7.8 item 8 (main, line 1373–1376: bounded Lipschitz `f`, continuous `η > 0`,
`ε > 0` give smooth `g` with `|g − f| ≤ η`, `sup|dg| ≤ Lip(f) + ε`) and R4's Killing–Hopf (line
749); Completed/HopfRinow (b) (closed bounded sets compact; line 57); PDE §1.2 (A2), §1.3 (A3),
§6.3 (F26) (main, lines 720, 769, 2309); FuchsianOrbifolds Layer 3 "cusps and q-coordinates"
(main, line 263). The design-stage citation tool reported no unresolved citation; I confirmed
each by hand.

**Library declarations opened at the pins.** Mathlib: `LinearPMap.IsFormalAdjoint.le_adjoint`
(Analysis/InnerProductSpace/LinearPMap.lean:194), `adjoint_isClosed` (:332),
`mem_adjoint_domain_of_exists` (:163), `adjoint_apply_of_not_dense` (:172); `LinearPMap.IsClosable`
(Topology/Algebra/Module/LinearPMap.lean:66), `closure` (:93), `isClosable_iff_exists_closed_extension`
(:132), `HasCore` (:141); `Measure.singularPart_add_rnDeriv`
(MeasureTheory/Measure/Decomposition/Lebesgue.lean:122, `μ.singularPart ν + ν.withDensity (μ.rnDeriv ν) = μ`,
so the README's orientation is right), `mutuallySingular_singularPart` (:106), `eq_singularPart`
(:404), `eq_withDensity_rnDeriv` (:522); `TemperedDistribution.MemSobolev`
(Analysis/Distribution/Sobolev.lean:153, multiplier `(1 + ‖x‖²)^{s/2}`, so `1 + ‖ξ‖²` at `s = 2`),
`memSobolev_iff_exists_smulLeftCLM_fourier` (:222), `MemSobolev.laplacian` (:348);
`SchwartzMap.laplacian_eq_fourierMultiplierCLM` (Analysis/Distribution/FourierMultiplier.lean:107,
multiplier `−(2π)²‖ξ‖²`) and `TemperedDistribution.laplacian_eq_fourierMultiplierCLM` (:208);
`MeasureTheory.Lp.fourierTransformₗᵢ` (Analysis/Fourier/LpSpace.lean:51); `IsCompactOperator.comp_clm`
(Analysis/Normed/Operator/Compact/Basic.lean:271), `isCompactOperator_of_tendsto` (:459);
`InnerProductSpace.instLaplacian` (Analysis/InnerProductSpace/Laplacian.lean:138);
`IsCoercive.continuousLinearEquivOfBilin` (LaxMilgram.lean:105). Tau Ceti: `TauCeti.ProjValMeasure`
with fields `proj`, `diag`, `diag_finite`, `inner_proj` (Analysis/InnerProductSpace/ProjValMeasure/Basic.lean:91–101),
`proj_mul_comm` (:200), `norm_sq_proj_apply` (:275), `diag_univ` (:299), `ProjValMeasure.integral`
(Integral.lean:218); `LinearPMap.IsRelativelyBounded` (Analysis/Normed/Operator/LinearPMap/RelativeBound.lean:56,
`‖V x‖ ≤ a * ‖x‖ + b * ‖A x‖` with `A.domain ≤ V.domain`, confirming the README's lettering);
`IsSelfAdjoint.add_of_isRelativelyBounded` (Analysis/InnerProductSpace/LinearPMap/KatoRellich.lean:118,
hypotheses `IsSelfAdjoint A`, `V.IsFormalAdjoint V`, `V.IsRelativelyBounded A a b`, `b < 1`);
`IsSelfAdjoint.isFormalAdjoint` (SelfAdjoint.lean:105); `TauCeti.riemannianVolume`
(Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82, Lindelöf Borel manifold with a continuous
metric), `isLocallyFiniteMeasure_riemannianVolume` (:179), `isOpenPosMeasure_riemannianVolume`
(Support.lean:36); `TauCeti.Manifold.laplaceBeltrami` (Riemannian/Laplacian.lean:238, `divergence ∘ mgradient`),
`divergence` (:55); `integral_mul_laplaceBeltrami` (Riemannian/DivergenceTheorem.lean:312, `f` of class
`C¹` with compact support, `g` of class `C²`, `[I.Boundaryless]` in scope at line 73); `TauCeti.HyperbolicMetric`
(Riemannian/Hyperbolic.lean:51, needs `[PreconnectedSpace M]`, used only in Checks); `TauCeti.Wkp`
(Analysis/Sobolev/Wkp/Basic.lean, real-valued) and `W1p` (W1p/Basic.lean:372); `ContinuousLinearMap.nuclearENorm`
(Analysis/OperatorIdeal/Nuclear/Basic.lean:53), `isCompactOperator_of_nuclearENorm_ne_top` (:153);
`hilbertSchmidtEnergy` (Analysis/InnerProductSpace/HilbertSchmidt/Basic.lean:89, takes a Hilbert basis);
`IsSelfAdjoint.hasCompactResolvent_iff_isCompactOperator_resolvent` (LinearPMap/CompactResolvent.lean:69).
By object: no essential closure, wave operator, spectral-type subspace, min–max value, Laplacian
partial operator on a manifold, or free Laplacian exists at either pin (grep for the objects, not the
names). Tau Ceti's `CourantFischer` statements (Analysis/InnerProductSpace/PointSpectrum.lean,
KyFan.lean, Matrix/Eigenvalues/Basic.lean) are the compact and finite-dimensional cases, as the design
report says; 1.6 is the general semibounded case and is owned here. Ownership against open pull
requests was checked for the sibling checkouts the brief names and, by the index, for all 459 heads
(grep for Kato–Rosenblum, wave operator, essential closure, Gaffney, min–max, quasi-periodic, the
Friedrichs/minimal/maximal Laplacian, `σ_ac`, essential self-adjointness of the Laplacian): the only
hits are the consumers named in the README (QuantumFoundations §8.2, CongruenceSpectralGap §0.2,
MaassForms) and VariationalMethods' compact min–max; SobolevDifferentialForms (new, on `ℝⁿ`) does
not plan Gaffney cutoffs on manifolds.

**Source sample** (every sampled target checked at its locator; the cited line ranges contain the
cited statements):

| Target | Source and locator | What the text says at the locator | Result |
|---|---|---|---|
| 1.1 | teschl line 4399–4411 (proof of Lemma 3.19) | `dμ_φ = Σ |f_n|² dμ_{ψ_n}` over an orthogonal cyclic decomposition | supports bounded calculus and spectral orthogonality; the restriction law is the case `g = 1_B` |
| 1.2 | teschl line 4388–4394 ((3.83), Lemma 3.19) | `ℋ_xx` by the type of `μ_ψ`; `P_xx = χ_{M_xx}(A)` | supports the identification; Teschl's Borel-set clause holds under his standing separability (teschl line 1780), as the README says |
| 1.3 | teschl line 4420–4427 ((3.85), unitary invariance) | `σ_xx(A) = σ(A|ℋ_xx)`, invariance under unitary equivalence | supports 1.3–1.4's definitions |
| 1.4 | teschl line 4315–4332 ((3.79), Lemma 3.15), 4350–4366 (Lemma 3.16) | `N^ess`, `σ(μ_ac) = M_ac^ess`, maximal spectral vector via weights `ε_j` | supports (1)–(4); Lemma 3.16's "every" is under separability (line 1780) |
| 1.7 | teschl line 10595–10620 (Lemma 12.1, (12.6), Theorem 12.2) | `D(Ω_±)`, `Ran(Ω_±)` closed, `Ω_±` unitary between them, `Ω_± e^{−itH₀} = e^{−itH}Ω_±`, reduction and intertwining (12.8) | supports 1.7 |
| 1.9 | kato57 line 21–35 (Theorem 1), 64–121 ((2.1)–(2.11)), 92–111 (Lemma 2.1); rosenblum57 line 70–72 (Theorem 1.6) | `s-lim e^{itH₁}e^{−itH₀}P₀` partial isometries with initial `𝔐₀`, final `𝔐₁`, adjoints (1.2), (1.3); Duhamel (2.2); Lemma 2.1 with `2πm²‖A‖²_HS`; Rosenblum's purely ac case | supports 1.8–1.9 once R01's compression is written |
| 2.3 | teschl line 5683–5720 (Lemma 6.3, Theorem 6.4) | `A`-bound as `lim ‖BR_A(±iλ)‖`, the semibounded estimate `a·max(1, |γ|/(λ+γ)) + b/(λ+γ)`, Kato–Rellich with the printed bound `γ − max(a|γ| + b, b/(a−1))` | supports the theorem; printed bound is a misprint (Source issues) |
| 3.1 | DifferentialGeometry 12.5 on main; grigoryan09 Ch. 4 (uncertified) | `integral_mul_laplaceBeltrami`, `integral_laplaceBeltrami_symm` on boundaryless `M` | supports Green's formula for real functions; the complex form is the README's |
| 3.2 | bms02 line 151–157 | minimal operator = closure from `C_c^∞`; maximal = adjoint; `Dom(H_max) = {u ∈ L² : Hu ∈ L²}` | supports 3.2–3.3 up to the vocabulary slip R06 |
| 3.3 | bms02 line 152–155, 179–182 (Theorem 2.3) | `Dom(H_{V,max}) ⊂ W^{2,2}_loc` for `V ∈ L^p_loc` (`p = 2`, `n ≤ 3`; `p > n/2`, `n ≥ 4`); `V = 0` qualifies | supports `dom Δ_max ⊆ H²_loc` |
| 3.6 | bms02 line 245–246 (Corollary 2.10), 252–256 (Remark 2.12), 128–129 (connected `M`) | complete `g^{TM}` gives `D*D` essentially self-adjoint; `D = d` gives the scalar Laplacian | supports the theorem for connected `X` (R12) |
| 3.7 | hm23 line 41–43, 44–47, 104–105 | bottom of spectrum `0` simple iff connected (finite area); spectral gap below `1/4`; `λ₁(X_i) → 1/4` | supports `λ₁⁺` and the finite-area kernel clause (R12) |
| 3.8 | chavel84 Ch. I (uncertified) | cited by locator | not readable; statement is the standard compact spectral theorem and is also K5a's |
| 3.10 | lp80 line 251–256, 279–290; teschl line 6277–6281 (Lemma 6.17) | `x`-independent waves: `s = log y`, `v = u/√y` give `v_tt = v_ss`; zero Fourier coefficient; Weyl's criterion with orthonormal singular sequences | supports the route (R08 moves the locator) |
| 4.3 | teschl line 7213–7218 (Lemma 7.11) | `f(p)g(x)`, `g(x)f(p)` compact for `f, g ∈ L^∞_∞`, Hilbert–Schmidt for `f, g ∈ L²` | supports 4.3 with `f = (p² + 1)⁻¹` |
| 4.5 | kps26 line 20–39 ((1.1)–(1.6)), 47–50 (Theorem 1.1) | `V = Σ V_n e^{i⟨θ_n,x⟩}`, `V_{−n} = conj V_n` (bar lost in OCR, reality stated at line 29), `θ_n = Σ n_j ω_j`; Theorem 1.1 with `d ≥ 2`, `l > d`, full-measure frequencies | supports 4.5 and the Layer 4 Example |

Also checked: teschl line 5044–5055 (Theorem 4.10) for 1.6 and 2.1, 5063–5069 (Theorem 4.12),
5704–5711 for 2.2 and 3.9, 7086–7136 (Theorem 7.8, Lemma 7.9) for 4.2, 9578–9589 (Theorem 10.2;
`V ∈ L^∞_∞` for `n > 3`, `L^∞_∞ + L²` for `n ≤ 3`) for 4.4's essential-spectrum clause, 2914–2917
(Theorem 2.12) and 2960–2966 (Theorem 2.13) for 3.4. All consistent with the statements.

**Adversarial pass** (sampled targets, headlines, and every target a finding touches):

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: Lebesgue orientation | `μ = 2·Leb|[0,1]` | Mathlib: `μ.singularPart Leb + Leb.withDensity (μ.rnDeriv Leb) = μ`; `Leb.withDensity 2 = 2Leb|[0,1]`; reversed `μ.withDensity 2 = 4Leb|[0,1]` | README orientation right | none |
| Conventions: Fourier witness | `ψ = e^{−πx²}` | `ψ'' = (4π²x² − 2π)ψ`; `𝓕(−ψ'') = 4π²ξ²e^{−πξ²}` | holds | none |
| Conventions: relative-bound lettering | `A = 2`, `V = 3` on `ℂ` | Tau Ceti `IsRelativelyBounded V A a b` is `a‖x‖ + b‖Ax‖`; pairs `(3,0)`, `(0,3/2)` | holds | none |
| 1.1 bounded calculus, restriction, orthogonality | `diag(1,2)`, `f = (1,i)`, `g = 3·1_{{2}}`; `A = 0`, `f = h = e₁`; zero space | `μ_f = δ₁ + δ₂`; `g(A)f = (0,3i)`, `μ = 9δ₂` vs `3δ₂` for `|g|`; `μ_{f+h} = 4δ₀ ≠ 2δ₀`, `⟨f,P(ℝ)h⟩ = 1`; `μ_f(B∩C)` for restriction | holds | none |
| 1.2 identification; Borel-value clause | `M_x ⊕ diag(1/2)`, `f = (1,1)`; Cantor measure; coordinate operator on `ℓ²(ℝ) ⊕ M_x` | `μ_f = Leb|[0,1] + δ_{1/2}`; `P_ac f = (1,0)`, `P_pp f = (0,1)`; `c` atomless; `P_A(M) = P_pp` forces `1_M ≡ 1` and `1_M = 0` a.e. | holds; clause correctly left to UO-C03's separable case | R07 (attribution only) |
| 1.3 compression PVM | `diag(1,2,3)`, `U = span(e₁,e₃)`; `U = 0`; `U = ℋ` | `σ(A|_U) = {1,3}`; `∅`; `σ(A)`; `Q` commuting with all `P_A(B)` commutes with `R(z)`, so `Q dom A ⊆ dom A` | holds | none |
| 1.4 (1)–(4) | `M_x` on `L²[0,1]`; `diag(q_n)`; `M_x ⊕ diag(q_n)`; `ℓ²(ℝ)` coordinate operator; zero space; annulus construction | `σ_ac = [0,1]`, `∅`, overlap `[0,1]`; `(0,1)^ess = [0,1]`, `ℚ^ess = ∅`; single `f = Σ c_k P_A(J_{m_k}) f_{m_k}` with disjoint annuli, `μ_f(I_ε) ≥ |c_k|² μ_{g_k}(J_{m_k}) > 0`; no maximal vector on `ℓ²(ℝ)` (`μ_{e_t} = δ_t`) | holds; (3) needs a maximal vector, (4) separability, both stated | R09 (supplier id) |
| 1.4 (2) no isolated points | isolated `λ ∈ σ(A_ac)` | `P_{A_ac}(I_ε) = P_{A_ac}({λ})` and `μ_{P_ac f}({λ}) = 0` for all `f` | holds | none |
| 1.5 interval criterion | `a = b = 0`, `A = 0`; `M_x` on `L²([0,1]∪[2,3])`; fat Cantor `K` | `(0,0) = ∅` vacuous vs `{0} ⊄ ∅`; density `1_{[0,1]∪[2,3]}`, `σ_ac ∩ (1,2) = ∅`; `σ_ac = K^ess ⊆ K`, no interval | holds with `a < b` | none |
| 1.6 min–max | `diag(1,3,5)`, `n = 4`; `M_x` on `L²[0,1]`; `−1 ⊕ H₀`; zero space; `n = 1` | `μ₄ = sup inf ∅ = +∞`; `μ_n = 0 = inf σ_ess`; `μ₁ = −1`, `μ_n = 0`; zero space `μ_n = +∞ = inf ∅`; `n = 1` gives `λ₀` of 2.1 | holds; form order undefined | R05 |
| 1.7 wave operators | `H₁ = H₂`; `H₁ = 0`, `H₂ = 1` on `ℂ`; `M_x` vs `M_x + c`; chain rule | `D = ℋ`, `Ω = 1`; `e^{it}` diverges, `D = 0`; `e^{itc}` diverges, `D = 0` though `ℋ_ac = ℋ`; `W₃₁(t)ψ = W₃₂(t)Ω₂₁ψ + W₃₂(t)(W₂₁(t)ψ − Ω₂₁ψ)` | holds | none |
| 1.8 Rosenblum's lemma and square root | `M_λ`, `x = m·1_{[0,1]}`, `C = ⟨φ,·⟩φ`; `|λ|^{−1/4}1_{[−1,1]}`; `V = diag((−1)^{n+1}/n²)` | `∫|⟨φ,e^{−itλ}x⟩|²dt = 2π∫|φx|² = 2πm²` (Plancherel with kernel `e^{−itλ}`), `‖C‖²_HS = 1`, equality; `∫|λ|^{−1/2} = 4 < ∞`, density unbounded; `|V|^{1/2} = diag(1/n)`, energy `π²/6 = Σ 1/n²` | holds | none |
| 1.9 Kato–Rosenblum | `V = 0`, `H₁ = diag(1,2)` on `ℂ²`; `M_x` with rank-one `V`; `diag(1/n²)` with `V = ∓diag(1/n²)`, `V = −diag(1/n)` | `D_± = ℂ²`, `Ω_± = 1`, `ℋ_ac = 0`: the 1.7 object is not a partial isometry with initial space `ℋ_ac(H₁)`; `σ_ac(H₂) = ℝ`; `H₂ = 0`, `ℋ_ac = 0` both; `Σ 1/n = ∞` not trace class | false as worded for the 1.7 object; true for `Ω_± P_ac(H₁)` | R01 |
| 2.1 bottom of spectrum | zero space; `M_x` on `L²(ℝ)`; `H₀ + c` | `σ = ∅`, `sInf ∅ = 0` junk; not bounded below; `λ₀ = c`, not attained | holds with `ℋ ≠ 0` | none |
| 2.2 bounded perturbation | `diag(0,1) + diag(1,−1)`; `V = c`; graph norms | `λ₀ = 0 ∈ [−1,1]`; equality; `‖x‖ + ‖(A+V)x‖ ≤ (1+‖V‖)(‖x‖+‖Ax‖)` | holds | none |
| 2.3 Kato–Rellich bound | `a = 1`, `b = 1/2`, `γ = 0`; scalar `A = λ ≥ γ`, `V = −(a + b|λ|)`; `A = H₀`, `V = −H₀`; the resolvent estimate | bound `−2`; `A + V ≥ γ − (a + b|γ|)` in both signs of `γ`; `A + V = 0` on `H²` not closed; `‖VR_A(μ)‖ ≤ a/d + b·max(1,|γ|/d)` with `sup_{s ≥ γ} |s|/(s−μ) = max(1, |γ|/d)`; `< 1` iff `d > max(a/(1−b), a + b|γ|)` by the two-case analysis `d ≥ |γ|` / `d < |γ|` | holds; equals Kato's form; Teschl's printed denominator is a misprint | none (Source issues) |
| 3.1 sign and Green | flat `‖x‖²`; `ℍ`, `yˢ`; circle `e^{inθ}` with and without conjugation; `⟨d(iv),du⟩` | `Δ‖x‖² = −2d` (library `+2d`); `Δyˢ = s(1−s)yˢ`, `Δy² = −2y²`; `2πn²` vs `0`; `⟨d(iv),du⟩ = −i⟨dv,du⟩` (conjugate-linear in `v`); compact support on `u` instead of `v` handled by a cutoff `χ = 1` near `supp u` | holds | none |
| 3.2 minimal operator | `ℝ`; `(0,1)`; dimension `0` | `∫|u'|²`; `(Δ_max + 1)e^{±x} = 0`, deficiency `(2,2)`; `Δ₀ = 0` on finitely supported functions | holds; vocabulary differs from bms02 | R06, R10 |
| 3.3 maximal operator | `e^{−|x|}` on `ℝ`; `χ/|x|` on `ℝ³`; `(0,1)` | `Δu = −u + 2δ₀` (`u'' = e^{−|x|} − 2δ₀`); `−div grad(1/|x|) = 4πδ₀`; `Δ_max 1 = 0`, `eˣ ∈ ker(Δ_max + 1)` | holds | none |
| 3.4 forms | `ℝ`; `(0,1)`, `u = 1`; `𝔞(iu,iu)`, `𝔞(u,iv)` | `H¹ = H¹₀ = W^{1,2}`, `Δ_F = H₀`; Poincaré `‖u‖ ≤ π⁻¹‖u'‖` fails for `1`; Dirichlet `n²π²` (`n ≥ 1`) vs Neumann (`n ≥ 0`); `= 𝔞(u,u)`, `= i𝔞(u,v)` | holds | none |
| 3.5 Gaffney cutoffs | `(0,1)`; flat `ℝ^d`; countable union of circles; the smooth step | `1 ≤ (4/k)(1/2)` false for `k > 2`; `|grad| ≤ 2/k` before smoothing; `χ_k = 1` on the first `k` circles for `k ≥ 4` (`2 − π/k ≥ 1`); `∫_{1/4}^{3/4}φ' = 1 ≤ sup|φ'|/2` forces `φ' ≡ 2`, not smooth | statement holds; route constants impossible | R03 |
| 3.6 Gaffney–Chernoff–Strichartz | step (a) with `χ_k²u`; step (b) with `Δu + u = 0`; `ℝ⁴∖{0}`; `(0,1)`; disconnected `X` | `∫χ_k²|du|² ≤ 2‖Δu‖‖u‖ + 4 sup|dχ_k|²‖u‖²` (Cauchy–Schwarz with weight `1/2`); `∫χ_k²|u|² ≤ sup|dχ_k|²‖u‖² → 0`; `∫_{|x|<1}|x|^{−4}d⁴x = ∫r^{−1}dr = ∞`; `1 ∈ dom Δ_max ∖ dom Δ_F`; `L²(X) = ⊕ L²(X_j)` splits `Δ₀` | holds (bms02 cited for connected `M`) | R12 |
| 3.7 vocabulary | circle; `ℝ`; point; torus `ℝ²/ℤ²`; `λ₁⁺ = λ₁` clause with `σ = {0} ∪ [c,∞)` and with `σ_ess = ∅` | `0, 1, 1, 4, 4`; `λ₁⁺ = inf(0,∞) = 0 = μ₂`; `λ₁⁺ = λ₁ = +∞`; `4π²` with multiplicity `4`; `λ₁⁺ = c = inf σ_ess = μ₂` when no eigenvalue in `(0,c)`; second eigenvalue in the compact case | holds | none |
| 3.8 compact case | `S²`; `N` points; two circles; `X = ∅` | `l(l+1)`, mult `2l+1`, `λ₁ = λ₂ = λ₃ = 2`; `λ_k = 0` for `k < N`, `+∞` for `k ≥ N` (README) vs `0` (VariationalMethods junk); mult of `0` is `2`; `σ(Δ_∅) = ∅`, `λ₀ = +∞ ≠ 0` | false for `∅` and for `k ≥ N` in dimension `0` | R02, R04 |
| 3.9 bounded potentials | `V = c`; circle, `V = 1_{[0,π)}`; `V = −x⁴` on `ℝ` | `σ + c`; Rayleigh of `1` is `π/(2π) = 1/2`, so `0 ≤ λ₀ ≤ 1/2`; limit circle at `±∞` | holds | none |
| 3.10 cusp threshold | `y^{1/2+it}`; `u_n = y^{1/2+it}ψ((log y − n)/n)`; parabolic and hyperbolic cylinders | `Δyˢ = s(1−s)yˢ = (1/4 + t²)yˢ`; `∫_a^∞ y·y^{−2}dy = ∞`; `yˢ ∈ L²` iff `2Re s − 2 < −1`; `dy/y² = e^{−r}dr`; `∂ᵧ²(y^{1/2}f) = y^{−3/2}(f'' − f/4)`; `(Δ − 1/4 − t²)u_n = −y^{1/2}e^{itr}(2itψ'/n + ψ''/n²)`, `‖u_n‖² = wn∫|ψ|²`, ratio `O(1/n)`; supports in `r ∈ (2n,3n)`, disjoint along `n_k = 2^k`; area `w/a = 1`; funnels have infinite area | holds | R08 (locator) |
| 4.1 `H²` four ways | `e^{−π‖x‖²}`; `1_{[−1,1]}`; the `2π` witness | `Δu = (4π²‖x‖² − 2πd)u`; `𝓕1_{[−1,1]} = sin(2πξ)/(πξ)`, `ξ²𝓕u ∉ L²`, `u'' = δ'_{−1} − δ'_1`; `‖u''‖² = 2^{−1/2}(16π⁴·3/(16π²) − 16π³/(4π) + 4π²) = 3π²·2^{−1/2}`, `‖ξ²𝓕u‖² = 3·2^{−1/2}/(16π²)`, ratio `16π⁴ = (4π²)²` (numerically `1558.55` both sides); `N(u) ≤ ‖u‖ + (4π²)⁻¹‖Δu‖`, `‖u‖ + ‖Δu‖ ≤ (1 + 4π²)N(u)` | holds | none |
| 4.2 free Laplacian | `d = 1`, `ψ = e^{−πx²}`; `d = 0` | density `2·e^{−λ/(2π)}/(4π√λ) = e^{−λ/(2π)}/(2π√λ)`, mass `(2π)^{−1}√π·√(2π) = 2^{−1/2} = ‖ψ‖²` (numerically `0.70711`); `ℝ⁰`: `H₀ = 0`, `σ_pp = {0}`; level sets `{‖ξ‖ = r}` null for `d ≥ 1` | holds with `d ≥ 1` | none |
| 4.3 local compactness | `1_{B_1}`, `(1+‖x‖²)^{−1/2}`, `cos x₁`; `1_{⋃[n,n+n^{−2}]}`; `V = 1`; the norm limit | vanish / do not; `Σ n^{−2} < ∞` yet `|V| = 1` far out; `σ((H₀+1)⁻¹) = [0,1]` uncountable; `‖M_V𝓕⁻¹M_f𝓕 − M_{V_R}𝓕⁻¹M_{f_R}𝓕‖ ≤ ‖V − V_R‖_∞‖f‖_∞ + ‖V‖_∞‖f − f_R‖_∞ → 0` | holds | none |
| 4.4 bounded potentials | `V = c`; `d = 1`, `V = −1_{[−1,1]}`; `d = 3`, `V = 1_{B_1}` | `σ = [c,∞)`; even bound state `k tan k = κ`, `k² + κ² = 1`: `k = 0.7391`, `κ = 0.6736`, `E = −0.4538 ∈ [−1,0)`; no odd state (`k ≤ 1 < π/2`); `σ ⊆ [0,∞)` and `σ_ess = [0,∞)` give `σ = [0,∞)` | holds | none |
| 4.5 quasi-periodic potentials | `cos x + cos(√2x)`; `V_{±e₁} = i`; `θ_{e₁} = 1`, `θ_{−e₁} = 2`; `Q = 0` | `inf = −2` not attained (`√2` irrational), approached (Kronecker); `2i cos x`; `(e^{ix} + e^{2ix})/2` not real; `V = V₀` real constant | holds | none |
| Context: separability | all Layer 1 statements | only 1.4(3) needs a maximal vector and 1.4(4) separability; Teschl's standing assumption at line 1780 | in scope | none |
| Context: completeness and nonemptiness | 3.1–3.4 (none), 3.5–3.10 (complete), 2.1/3.7 (`X ≠ ∅`), 3.8 | `(0,1)` and `∅` instances above | 3.8 lacks `X ≠ ∅` | R02 |
| Plan consistency | all 44 targets | prerequisite targets exist and precede their consumers; every definition has an API list and at least 3 tests; every target a locator in a manifest key | holds | none |

**Shape.** The README has the upstream headings in order (Summary; Scope and ownership;
Conventions; Exact supplier contracts; How to read the build; Layers 1–4 each ending with
`### Examples` and `### Dependencies`; Downstream consumers; Worked examples; References). Every
definition lists its API and at least three Checks (18 definitions in the plan, 3–4 tests each);
every theorem carries hypotheses in the sentence and a locator; every `*Needs:*` line lists
pinned declarations, supplier sections or earlier targets. No `**T017**` tables, no field lists,
no LaTeX delimiters (one escaped brace, R11). Headline theorems for the package stage: 1.2, 1.4–1.5,
1.6, 1.9, 2.3, 3.6, 3.10, 4.2, 4.4; at the pins 2.3 (through `LinearPMap.IsRelativelyBounded` and
`IsSelfAdjoint`), 3.2–3.6 (through `TauCeti.Manifold.laplaceBeltrami`, `MeasureTheory.Lp` and
`LinearPMap.closure`), and 4.1–4.4 (through `MeasureTheory.Lp.fourierTransformₗᵢ` and `MemLp`) are
statable; Layer 1 needs the spectral PVM of an unbounded self-adjoint operator (SA-E01, not at the
pin: Tau Ceti's spectral theorem files cover bounded normal operators), so its headlines will be
named in the module docstring as not statable unless the package finds a pinned carrier.

## Not verifiable

- `strichartz83` Theorem 2.4, `chernoff73`, `gaffney54`, `kato76` Ch. V §4.1 and Ch. X §4.4,
  `cfks87` Ch. 1, `rs1` §VII.2, `rs2` Ch. IX, §X.1, §X.2, Theorem X.12, `rs3` §XI.3, Theorems
  XI.7–XI.8, `grigoryan09` Ch. 4 and 11, `chavel84` Ch. I, `iwaniec02` Ch. 4, 7, 11, `lp76` Ch. 1
  and 8: settled as uncertified in the manifest, cited by locator only; not opened. For each, the
  cited statement was checked instead against a certified text (teschl, bms02, kato57) or by direct
  computation (the adversarial table), so no claim rests on an unread text alone.
- Elaboration: not available (this lane does not elaborate; a design has no `Suggested.lean`).
- Ownership against open pull requests whose files the brief does not give was checked only
  through the index of 459 heads (`roadmaps grep`), not by reading each README.

## Source issues

- **Misprint** in teschl at Theorem 6.4, equation (6.3), printed page 135 (teschl line 5709–5711 and 5720): the source says the lower bound of `A + B` is `γ` minus the maximum of `a|γ| + b` and `b/(a − 1)`, in its lettering `‖Bψ‖ ≤ a‖Aψ‖ + b‖ψ‖`; it should be the maximum of `a|γ| + b` and `b/(1 − a)`, which is what the proof's resolvent estimate (Lemma 6.3) and Kato's Theorem V.4.11 give; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ab3da9ae763fd762fc8fe456d609119c6978c254", "job": "REV-DESIGN-SchrodingerOperatorsAndSpectralTypes", "model": "fable", "worker": "chris-x17"} -->
