<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17292#issuecomment-6903419659 -->
Red team round 2 pass b (claude) of 8aca3f4

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §1.9 and §1.8 use the Schmidt series of a compact operator without its owner

   Location: `packages/SchrodingerOperatorsAndSpectralTypes/README.md:974-975`, "Pearson's argument
   (pearson78; rs3 Theorem XI.7) combines it with the Schmidt expansion of `C` and Rosenblum's lemma
   1.8"; *Needs:* at `README.md:980-981`. Also `README.md:931`, "The square root goes through the
   compact self-adjoint eigenbasis of `V` (SA-C86) and OperatorIdeals OI-B29–OI-B36".

   Claim: every input of a route is a target here, a named supplier section or a pinned declaration.

   Witness: neither *Needs:* line names an owner of `C = Σ s_j ⟨e_j, ·⟩ f_j` with `Σ s_j =
   nuclearENorm C`, nor of `a_n(V) = |λ_n|`; OI-B29 only defines `ν(T) = Σ aₙ(T)`. The owner is on
   main: `TauCetiRoadmap/BanachSpaceTheory/README.md:299-322` (B4: Schmidt series, `s_n = a_n(T)`).

   Repair (README only; BanachSpaceTheory is on main, so no merge-order edge is at risk):

   - `README.md:974-975`: "… combines it with the Schmidt series `C = Σ_j s_j ⟨e_j, ·⟩ f_j` of the
     compact operator `C` (BanachSpaceTheory B4: orthonormal families `(e_j)`, `(f_j)` and
     `s_j = a_j(C)`, so that `Σ_j s_j = nuclearENorm C < ∞`) and Rosenblum's lemma 1.8 …".
   - Pearson's *Needs:* line: add "BanachSpaceTheory B4 (Schmidt series of a compact operator, with
     `s_n = a_n`)".
   - `README.md:931`: "The square root goes through the compact self-adjoint eigenbasis of `V`
     (SA-C86), in which `|V|^{1/2}` is diagonal with entries `|λ_j|^{1/2}`, BanachSpaceTheory B4 (the
     approximation numbers of `V` are the `|λ_j|` in nonincreasing order, so
     `nuclearENorm V = Σ_j |λ_j|`) and OperatorIdeals OI-B32–OI-B35." Add B4 to the *Needs:* of 1.8.
   - Add to `## Exact supplier contracts`: "### From TauCetiRoadmap.BanachSpaceTheory — B4: for a
     compact `T : H → K` between complete Hilbert spaces, the Schmidt series
     `T x = Σ_j s_j ⟪e_j, x⟫ f_j` with orthonormal `(e_j)`, `(f_j)`, `s_j > 0` nonincreasing,
     operator-norm convergence of its truncations, and `s_n = a_n(T)` in OperatorIdeals' zero-based
     convention. Used in 1.8 and 1.9." Add "BanachSpaceTheory B4" to the Dependencies of Layer 1.

   Test on instances: `V = diag((−1)^{n+1}/n²)`: `a_n(V) = 1/(n+1)²`, `Σ = π²/6`, the energy of
   `diag(1/n)` (the README's own Check); `C = ⟨φ, ·⟩φ`, `‖φ‖ = 1`: one term, `s_0 = 1 = nuclearENorm C`.

2. **F02** (P2) Pearson's theorem is stated with `J` on one Hilbert space only

   Location: `README.md:959-962`, "Let `H₁`, `H₂` be self-adjoint on `ℋ` and `J` a bounded operator on
   `ℋ`"; `Suggested.lean:172-183` (`pearson_tendsto`, one carrier `H`).

   Claim: the roadmap's general statement of Pearson's theorem.

   Witness: the theorem holds for `H₁` on `ℋ₁`, `H₂` on `ℋ₂` and `J : ℋ₁ → ℋ₂`: apply the one-space
   statement on `ℋ₁ ⊕ ℋ₂` to `H₁ ⊕ 0`, `0 ⊕ H₂` and the block operator with entry `J`. The route never
   uses `ℋ₁ = ℋ₂`.

   The identification operator between two spaces is the reason for `J` (yafaev04 line 115–119
   attributes the modified wave operators to Kato). As far as I recall pearson78 states the theorem
   for two spaces; that text is uncertified and was not opened (see Not verifiable), so the finding
   rests on the mathematics and on the general-library principle, not on the source.

   Repair:

   - `README.md:959-962`: "Let `H₁` be self-adjoint on `ℋ₁`, `H₂` self-adjoint on `ℋ₂` and
     `J : ℋ₁ → ℋ₂` bounded, and suppose there is a trace-class `C : ℋ₁ → ℋ₂`
     (`ContinuousLinearMap.nuclearENorm C ≠ ⊤`) with `⟪H₂ψ, Jφ⟫ − ⟪ψ, J H₁φ⟫ = ⟪ψ, Cφ⟫` for all
     `ψ ∈ dom H₂` and `φ ∈ dom H₁` …"; the limits `W_±(H₂, H₁; J)` are then operators `ℋ₁ → ℋ₂`. Add
     the Check: "`ℋ₁ = L²(ℝ)`, `ℋ₂ = L²(ℝ) ⊕ ℂ`, `H₁ = M_x`, `H₂ = M_x ⊕ 5`, `J` the inclusion:
     `H₂J − JH₁ = 0`, `e^{itH₂} J e^{−itH₁} x = Jx` for every `t`, and `W_± = J`." Kato–Rosenblum
     stays the case `ℋ₁ = ℋ₂`, `J = 1`.
   - `Suggested.lean`, `pearson_tendsto` (pass b ran no Lean: elaborate it with `#check @…`;
     `nuclearENorm` is defined for maps `E →L[𝕜] F`, `TauCeti/Analysis/OperatorIdeal/Nuclear/Basic.lean:53`):

   ```lean
   theorem pearson_tendsto {K₁ K₂ : Type*} [NormedAddCommGroup K₁] [InnerProductSpace ℂ K₁]
       [CompleteSpace K₁] [NormedAddCommGroup K₂] [InnerProductSpace ℂ K₂] [CompleteSpace K₂]
       (H₁ : K₁ →ₗ.[ℂ] K₁) (H₂ : K₂ →ₗ.[ℂ] K₂) (h₁ : IsSelfAdjoint H₁) (h₂ : IsSelfAdjoint H₂)
       (J C : K₁ →L[ℂ] K₂) (hC : C.nuclearENorm ≠ ⊤)
       (hJC : ∀ (ψ : H₂.domain) (φ : H₁.domain),
         ⟪H₂ ψ, J φ⟫_ℂ - ⟪(ψ : K₂), J (H₁ φ)⟫_ℂ = ⟪(ψ : K₂), C φ⟫_ℂ)
       (P₁ : TauCeti.ProjValMeasure ℝ K₁) (hP₁ : IsSpectralMeasureOf H₁ P₁)
       (U₁ : TauCeti.Semigroups.StronglyContinuousGroup K₁)
       (U₂ : TauCeti.Semigroups.StronglyContinuousGroup K₂) (hU₁ : U₁.IsUnitary)
       (hU₂ : U₂.IsUnitary) (hgen₁ : U₁.complexGenerator hU₁ = Complex.I • H₁)
       (hgen₂ : U₂.complexGenerator hU₂ = Complex.I • H₂) (x : K₁) (hx : P₁.diag x ≪ volume) :
       (∃ y : K₂, Tendsto (fun t : ℝ => U₂ t (J (U₁ (-t) x))) atTop (𝓝 y)) ∧
         ∃ y : K₂, Tendsto (fun t : ℝ => U₂ t (J (U₁ (-t) x))) atBot (𝓝 y) := by
     sorry
   ```

   Test on instances: `K₁ = K₂`, `J = 1`, `C = V`: the hypothesis of `katoRosenblum`; `J = 0`, `C = 0`:
   limit `0`; the inclusion instance above: limit `Jx` on both sides.

3. **F03** (P3) the Check "Bounded below is needed" of §1.6 exhibits no failing clause

   Location: `README.md:851-853`, "`A = −diag(n)` on `ℓ²` … every `μ_n = −∞` and at `c = 0` the count
   is infinite, while the eigenspaces below `0` span an infinite-dimensional space."

   Claim: the instance refutes the theorem without the lower bound.

   Witness: in `ℕ ∪ {∞}` the two numbers of the Check agree (`∞ = ∞`), and the sequence is
   nondecreasing and `≤ +∞`: the three facts of `README.md:813-816` all hold. What fails is the
   eigenvalue description, and `Module.finrank` (`⊤ ≠ 0`).

   Repair: "Bounded below is needed: `A = −diag(n)` on `ℓ²` has `σ_ess = ∅` (each `−n` is isolated of
   multiplicity `1`) and every `μ_n = −∞`, which is neither a value in `ℝ ∪ {+∞}` nor an eigenvalue:
   the eigenvalues `−1 > −2 > …` have no least element, so there is no `n`-th eigenvalue. In
   `minMax_principle` at `c = 0` the count is `⊤`, while the eigenspaces below `0` span an
   infinite-dimensional space, whose `Module.finrank` is the junk value `0`; for `A` bounded below
   and `c < inf σ_ess(A)` that span has finite dimension (the paragraph above)." Note for the author,
   not a finding: with the dimension read in `ℕ∞` the three facts hold for every self-adjoint `A`
   (unbounded below with `inf σ_ess > −∞` gives infinitely many eigenvalues below every `c`).

4. **F04** (P3) two `*Needs:*` lines omit inputs their own text uses

   Location and witness.

   1. §1.8, `README.md:927-935`: the route needs `⟪y, e^{−itH} x⟫ = ∫ e^{−itλ} dμ_{y,x}(λ)` and the
      Cauchy–Schwarz bound of the polarised measure; the *Needs:* line has only SA-E26. Owners:
      UO-B03 (`e^{is·}[P_A]`) and UO-A01
      (`TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:410`, `:243`).
   2. §3.10, `README.md:1583-1584`: "*Needs:* 3.1, 3.6; UnboundedOperators UO-C02 with
      gap:weyl-criterion", while the definitions of the section are written on
      `TauCeti.UpperHalfSpace`, `TauCeti.IsLocalRiemannianIsometry` and
      `TauCeti.Manifold.instRiemannianBundleOpen` (`README.md:327-334` says "These carry the cusp ends
      of 3.10").

   Repair.

   1. §1.8: "*Needs:* 1.1, 1.2; SelfAdjointSpectralTheory SA-C86, SA-E26; UnboundedOperators UO-A01
      (matrix elements of a spectral integral through the polarised measure, and its bound), UO-B03
      (`e^{isH} = e^{is·}[P_H]`), UO-C03; …" (rest unchanged, with S01's addition). Both ids are
      already in the supplier contract, so no new edge.
   2. §3.10: "*Needs:* 3.1, 3.6; UnboundedOperators UO-C02 with gap:weyl-criterion; Tau Ceti
      `TauCeti.UpperHalfSpace` with its hyperbolic metric, `TauCeti.IsLocalRiemannianIsometry`,
      `TauCeti.Manifold.instRiemannianBundleOpen`."

Two P2 findings (an uncited owner of a proof-plan input, and a headline stated below its natural
generality) and two P3 findings (one Check, two `*Needs:*` lines). No P1. No statement of
`Suggested.lean` was found false as typed. No Lean was run in this pass (the brief gives none);
the 19 elaborated types of the worker's signature file were compared with the README by reading.

## Round 1 findings at this head

| Finding | Status | Witness at `8aca3f4` |
|---|---|---|
| 1a/F01 (P2), kernel owner in §4.3 | repaired | `packages/SchrodingerOperatorsAndSpectralTypes/README.md:1729-1735`: "An operator on `L²(ℝ^d)` given by a kernel in `L²(ℝ^d × ℝ^d)` is Hilbert–Schmidt … (AutomorphicSpectralTheory §0.8, `hilbert_schmidt_kernel` …)"; the *Needs:* line (1750), the contract (481–488), the scope bullet (133–136) and the Layer 4 Dependencies (1843) carry it. §0.8 exists at the supplier's open head with the stated hypotheses (σ-finite standard Borel, separable `L²`, norm `‖K‖₂`); AutomorphicSpectralTheory is line 101 of the merge order, this roadmap line 221. |
| 1a/F02 = 1b/F01 (P2), transport law | repaired | `README.md:527-532`: "If `A` is self-adjoint, `IsSpectralMeasureOf A P` and `U : ℋ → ℋ'` is unitary, then …"; Check at 548–554. Recomputed: `A = ⊥` on `ℂ²` has empty resolvent set (`R = 0` cannot satisfy `(z − A)R = 1`); `A = i`, `z = 2i`: left side `−i`, right side has imaginary part in `[−1/2, 0)`. |
| 1a/F03 (P2), bounded potentials on a complete manifold | repaired | `Suggested.lean:298-323`, `laplacian_add_potential_isSelfAdjoint_closure`; docstring list `Suggested.lean:45-46`; `README.md:1471-1473`. Tested below (Table A); true. |
| 1a/F04 (P3), `λ₁⁺ = λ₁` | repaired | `README.md:1362-1370`: "if `X` is connected with `vol_g(X) < ∞`, then `λ₁⁺(X) = λ₁(X)`. Route, by the two cases for `0` …". Both cases recomputed (Table B). |
| 1a/F05 (P3), Plancherel named | repaired | `README.md:933-935`: "Mathlib `MeasureTheory.Lp.norm_fourier_eq` (Plancherel on `L²`) and `MeasureTheory.Lp.fourierTransformₗᵢ`"; both at the pin (`Mathlib/Analysis/Fourier/LpSpace.lean:90` and `:51`). |
| 1a/F06 (P3), unused contract rows | repaired | `HyperbolicMetric`, `W1p`, `UpperHalfPlane` occur nowhere in the README; `README.md:303-304` reads "`TauCeti.Wkp` in `TauCeti/Analysis/Sobolev/` …". |
| 1b/F02 (P3), three `*Needs:*` lines | repaired | §3.2 `README.md:1213` ("HilbertModules H6 (`(closure T)* = T*`)"); §1.6 `README.md:819-820` (SA-D12, SA-D22, SA-E08 added, line after the second paragraph); §4.4 `README.md:1796` ("*Needs:* 1.4, 2.1, 2.2, 4.1, 4.2, 4.3"). |

No repair introduced a false statement. The new edge to AutomorphicSpectralTheory is downward. The
repair report marked nothing `not actionable`.

## Adversarial pass

### Table A: `Suggested.lean` declarations

Context: no `variable` block; every declaration carries its binders. `[CompleteSpace H]` is present
wherever `ProjValMeasure` or `IsSelfAdjoint` occurs; `essentialSpectrum` and `minMaxValue` have none
by design.

| Declaration (line) | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `IsSpectralMeasureOf` (73) | `A = 2` on `ℂ`, `P = δ₂`, `δ₃`; `A = i`, `z = 2i`; `A = ⊥` on `ℂ²`; `H = 0` | `(i−2)⁻¹ = (−2−i)/5` both sides; `(i−3)⁻¹ = (−3−i)/10 ≠`; `−i` vs imaginary part in `[−1/2, 0)`; resolvent set empty; `0 = 0` | determines `P` for self-adjoint `A` (Stieltjes inversion, polarisation) | none |
| `diag_spectralType_components` (87) | `M_x ⊕ ½` on `L²[0,1] ⊕ ℂ`, `(1,0,1)` split; cross terms; `fpp` with `S` countable; `f = 0` | `Leb|[0,1] + δ_{1/2}`; `|μ_{f,g}(B)|² ≤ μ_f(B)μ_g(B)` with `μ_fac ⟂ μ_fsc ⟂ μ_fpp` gives `0`; atoms of `μ_f` are those of `μ_fpp`, a subset `T ⊆ S`, `μ_fpp(S ∖ T) = 0`; all `0` | true | none |
| `acSpectrum` (104) | `M_x` on `L²[0,1]`; `diag(q_n)`; `M_x ⊕ 2`, `t = 2`; `H = 0` | `[0,1]`; `∅`; ac vectors are `(g, 0)`, mass `0` near `2`; `∅` | real body | none |
| `perfect_acSpectrum_and_mem_iff` (113) | `∅`; limit of points of `σ_ac`; isolated `t`; annuli for a single `f` | `Perfect ∅`; an interval around the limit contains one around `t_k`; `μ_f{t} = 0` forces mass on `I_ε ∖ {t}`, whose support point lies in `σ_ac`; `Σ w_k P(J_{m_k}) f_{n_k}` has measure `Σ |w_k|² μ_{f_{n_k}}|J_{m_k}` | true | none |
| `Icc_subset_acSpectrum_iff` (123) | `M_x` on `L²([0,1] ∪ [2,3])`, `[0,1]`, `[1,2]`; `a = b` | every open `J ⊆ (0,1)` charged by `f = 1`; `J = (1.2, 1.8)` uncharged, `1.5 ∉ σ_ac`; right side vacuous, `{a} ⊄ ∅` for `P = δ_a` | true; `a < b` needed | none |
| `essentialSpectrum` (134) | `0` on `ℂ`; `0` on `ℓ²`; `diag(1/n)`; UO's body | `∅`; `{0}`; `{0}`; `spectrum ∖ discreteSpectrum`, same set (`TauCetiRoadmap/OperatorTheory/UnboundedOperators/Suggested.lean:168-178`) | agrees with UO-C02 | none |
| `minMaxValue` (143) | `diag(1,3,5)`, `n = 0..3`; `H = 0`; `−diag(n)` | `1, 3, 5, ⊤`; `⊤`; `⊥` | `μ_{n+1}` with `n` obstacles | none |
| `minMax_principle` (154) | `diag(1,3,5)`, `c = 4`, `c = 3`; `M_x` on `L²[0,1]`; `0` on `ℓ²`; `H = 0`; `−diag(n)` without `hγ`; monotone | `2 = 2`; `1 = 1`; `Σ = 0`, no `c < 0` with a count; `Σ = 0`, count `0 = 0` for `c < 0`; `0 = 0`; `⊤ ≠ finrank = 0`; padding obstacles by `0` | true; `hγ` needed only through `finrank` | S03 |
| `pearson_tendsto` (172) | `J = 0`; `J = 1`, `C = V`; `H₁` pure point; Duhamel sign | limit `0`; Kato–Rosenblum; only `x = 0`; `d/du ⟪e^{−iuH₂}ψ, Je^{−iuH₁}φ⟫ = i⟪ψ_u, Cφ_u⟫` | true; one carrier only | S02 |
| `katoRosenblum` (191) | `V = 0`; `diag(1/n²)`, `V = −diag(1/n²)`; `M_x + c` (not trace class) | `y = x`; no ac vectors, `∅ = ∅`; `e^{itc}x` diverges, excluded | true | none |
| `katoRellich_lowerBound_hasCore` (215) | scalar `A = λ ≥ γ`, `V = −(a + b|λ|)`; `γ = −10`, `a = 0`, `b = ½`, `V = A/2`; a smaller lower bound `γ′ < γ`; `sup_{λ ≥ γ} |λ|/(λ−μ)` | `λ − a − b|λ| ≥ γ − a − b|γ|`; `−15 = −10 − max(0, 5)`, sharp; the route uses only `σ(A) ⊆ [γ′, ∞)`; `max(1, |γ|/d)` (decreasing on `λ < 0`, monotone to `1` on `λ ≥ 0`) | true | none |
| `complexLaplacian` (229) | `‖x‖²` on `ℝ^d`; `yˢ` on `ℍ`; `e^{inθ}` | `−2d`; `s(1−s)yˢ`; `n²e^{inθ}` | sign `−div grad` | none |
| `gaffney_isSelfAdjoint_closure` (245) | `(0,1)`; dimension `0`; `M = ∅`; case `V = 0` of the next theorem | deficiency `(2,2)`, excluded by `CompleteSpace`; `T = 0` on finitely supported, closure `0` on `ℓ²`, `w = 0`; `Lp = 0`; first two clauses coincide | true | none |
| `exists_mem_domain_closure_eq_zero_iff` (272) | `ℝ`; `S¹`; `⊔_ℕ S¹`; dimension `0` | only `0`; constants; `ℓ²` of componentwise constants; every function locally constant, kernel all of `ℓ²` | true both directions | none |
| `laplacian_add_potential_isSelfAdjoint_closure` (298) | circle, `V = 1`; `V = 1_{[0,π)}`; `M = ℕ`, `V(p) = −1/(p+1)`; `M = ∅`; `V = −x⁴` | `n² + 1 ≥ 1`; Rayleigh quotient of `1` is `½ ≥ 0`; `Σ V(p)|x_p|² ≥ −‖x‖²`, domain `ℓ²`; `essInf` over the zero measure times `0`; excluded by `MemLp V ⊤` | true | none |
| `cuspRegion` (327) | `a = 1`; `a ≤ 0` | `{y > 1}`; all of `ℍ`, excluded by `0 < a` | real body | none |
| `IsStandardCuspEnd` (336) | quotient of `⟨z+1⟩\ℍ` on `ℍ_1`, `w = 1`, `w = 2`; metric instance on the open part | accepted; rejected (`(0,y) ~ (1,y)`, `1 ∉ 2ℤ`); `instRiemannianBundleOpen` restricts the hyperbolic instance of `UpperHalfSpace` (`Hyperbolic/UpperHalfSpace/Basic.lean:343`, scoped in `TauCeti`, opened at `Suggested.lean:62`) | determines the end | none |
| `Ici_quarter_subset_essentialSpectrum` (351) | `u_n = y^{1/2+it}ψ((log y − n)/n)` | `‖u_n‖² = wn‖ψ‖²`; `Δ(y^{1/2}f) = y^{1/2}(f/4 − f″)`; residual ratio `≤ (2|t|‖ψ′‖/n + ‖ψ″‖/n²)/‖ψ‖`; supports `[2^{j+1}, 3·2^j]` disjoint | true | none |
| `schrodinger_isSelfAdjoint_closure` (377) | `V = c`; `d = 1`, `V = −1_{[−1,1]}`; `d = 0`; multiplier of `MemSobolev 2 2` | `σ = [c, ∞)`; `k tan k = κ`: `0.739·0.911 = 0.673`, `κ = 0.674`, `E = −0.454`; `σ_ess = ∅`, excluded by `hd`; `(1 + ‖ξ‖²)^{s/2}` at `s = 2` (`Mathlib/Analysis/Distribution/Sobolev.lean:149-155`) | true | none |

### Table B: README targets

| Target | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions | `μ = 2Leb|[0,1]`; `e^{−πx²}`; `A = 2`, `V = 3`; `u = e^{−π‖x‖²}` | `Leb.withDensity 2 = μ`, reversed `4Leb`; `−ψ″ = (2π − 4π²x²)ψ`; `(3,0)` and `(0,3/2)`; `Σ∂ⱼ²u = (4π²‖x‖² − 2πd)u` | agree | none |
| 1.1 | `diag(1,2)`, `f = (1,i)`, `g = 3·1_{{2}}`; `A = 0`, `f = h` | `9δ₂`; `4δ₀ ≠ 2δ₀` | agree | none |
| 1.2–1.3 | `√2·1_{[0,1]}`; `diag(1,2,3)`, `U = span(e₁,e₃)` | `2Leb` vs `4Leb`; `{1,3}` | agree | none |
| 1.4–1.5 | `([0,1] ∪ {2})^ess`, `ℚ^ess`, `(0,1)^ess`; maximal `ψ` and type `sc` | `[0,1]`, `∅`, `[0,1]`; `μ_f ≪ μ_ψ`, `μ_f` atomless on a null set gives `μ_f ≪ μ_{P_sc ψ}` | agree | none |
| 1.6 | core with obstacles; form order; `−diag(n)` | kernels of finitely many graph-continuous functionals meet a core densely; `(n−1)²π² ≤ n²π²`; three facts hold in `ℕ ∪ {∞}` | theorem sound | S03 |
| 1.7 | chain rule; Hardy space | norm equals `‖e^{itH₂}e^{−itH₁}ψ − Ωψ‖`; `e^{iax}H² ⊆ H²` only for `a ≥ 0` | agree | none |
| 1.8 | `x = m1_{[0,1]}`, rank-one `C`; `|λ|^{−1/4}`; `diag((−1)^{n+1}/n²)` | `2πm²` both; tail `4/m²`; `π²/6` both | agree; owner of `a_n(V) = |λ_n|` | S01, S04 |
| 1.9 | Duhamel; `V = 0` on `diag(1,2)`; `M_x`, `2M_x` | `i⟪ψ_u, Cφ_u⟫`; `W = 0`, `Ω = 1`; `(e^{it} − 1)/(it) → 0`, distance `1` | agree | S01, S02 |
| 2.1–2.3 | Gaussians `e^{−πx²/n²}`; `A = 2`, `V = 1`, `μ = 0`; `a/d + b·max(1, |γ|/d) < 1` | `π/(n√2)`, `n/√2`, quotient `π/n²`; `(3/2)·2 = 3`; iff `d > a/(1−b)` and `d > a + b|γ|` | agree | none |
| 3.1–3.5 | `e^{−|x|}`; `χ/|x|`; step `φ`; `(0,1)` | `−u + 2δ₀`; `4πδ₀`; gradient `2·(2/k) = 4/k`; `1 ≤ 2/k` false for `k > 2` | agree | none |
| 3.6 | cutoff estimates (a), (b) | `‖χdu‖² ≤ 2‖Δu‖‖u‖ + 4 sup|dχ|²‖u‖²`; `∫χ²|u|² ≤ sup|dχ|²‖u‖²` | agree | none |
| 3.7 | circle; `ℝ`; a point; `⊔_ℕ S¹`; torus | `0,1,1,4,4`; `0 = 0`; `+∞ = +∞`; `1 ≠ 0`; `4π²` four times | agree | none |
| 3.8–3.9 | `S²`; one point, `s = 1`; `V = 1_{[0,π)}` | `2,2,2`; `T = i`, `T − T* = 2i = 2i·TT*`, `i + i⁻¹ = 0`; `(1−λ)u′(0) = −λu′(0)` | agree | none |
| 3.10 | area; `(x,y) ↦ (2x,2y)`; `yˢ ∈ L²` | `w/a`; `(1,1) → (2,2)`; iff `Re s < ½` | agree | S04 |
| Layer 3 Examples | `Γ(2)`; `Γ₀(2)` | area `6·π/3 = 2π`; `2z² − 2z + 1 = 0`, `z = (1+i)/2`, trace `0` | agree | none |
| 4.1–4.2 | `e^{−πx²}`; spectral density `d = 1`; form | `3π²/√2` and `3/(16π²√2)`, ratio `16π⁴`; `e^{−λ/2π}/(2π√λ)`, mass `2^{−1/2}`; `π/√2` | agree | none |
| 4.3–4.5 | resolvent change at `s = 0, 1`; sign slip; `sup|…−f_R|`; `cos x + cos √2x` | `i`, `(1+i)/2`; `2 − i`; `(4π²R² + 1)⁻¹`; `−2` not attained | agree | none |

## Dependency check

    depcheck: 237 roadmaps, 2247 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. This roadmap is line 221 of `merge-order/ORDER.txt`, after
QuantumFoundations (220); AutomorphicSpectralTheory is line 101, CongruenceSpectralGap 164,
MaassForms 165. BanachSpaceTheory (S01) is on main.

## Verified sound

- Declarations read: 19 of 19 (7 definitions with real bodies, 12 theorems with `sorry`), every
  line of the file. Each elaborated type of the worker's signature file was compared with its
  README statement: no binder lost; `∞` is the smooth index in `ContDiff`/`ContMDiff`/`IsManifold`
  and `ℝ≥0∞`'s top in `MemLp`. One `import Mathlib`, 11 `TauCeti.*` modules; no `set_option`,
  `lemma`, sorry'd data, `#eval`, process text or machine path.
- Targets read: all 27 sections 1.1–4.5, every line of the README (1912 lines).
- Locators verified against the cached texts: 51 (teschl 27, bms02 5, kato57 5, yafaev04 4, lp80 3,
  hm23 3, kps26 3, rosenblum57 1).
- Checks recomputed: 58 (values in Tables A and B); none false; one inconclusive (S03). No
  definition has fewer than three.
- Sibling citations resolved at main or the open head: 64. SelfAdjointSpectralTheory 26 ids, with
  the statements of SA-D18, SA-D22, SA-E05, SA-E08, SA-E11, SA-E13, SA-E26–SA-E30, SA-E44 read.
  UnboundedOperators UO-A01, A02, A03, A06, A07, B03 (numbering (i)–(iii)), C01, C02, C03, D06, E04
  read; E01, E05, E06 by heading. AutomorphicSpectralTheory §0.8 read, §1.16a by heading.
  QuantumFoundations §8.2 read (density formula equals the README's at `n = 1`), §9.5 by heading.
  CongruenceSpectralGap §0.2 read (`N′ = 3N ≥ 3`), §0.6 by heading. BanachSpaceTheory B4 read.
  By heading: OperatorIdeals OI-A35, A40, B29, B32, B35, B36; RiemannianGeometry R7.8 item 8;
  ComplexKahlerGeometry K5a.ComponentwiseCompact; HilbertModules H6; SmoothBundlesConnections B2.2;
  PseudodifferentialOperators P1.0; VariationalMethods 3.1, 4.4, 5.1; PDE §§1.2, 1.3, 6.3;
  FuchsianOrbifolds Layer 3; GeometricTopology §7.1; ComplexCurveModuli D6; DifferentialGeometry
  Layer 12.
- Pinned declarations resolved with their files: 27 Tau Ceti and 21 Mathlib names of the supplier
  contracts, including the bodies of `LinearPMap.resolvent` (a `Classical.choose`),
  `ProjValMeasure` (fields `proj`, `diag`, `diag_finite`, `inner_proj`, `proj_univ`, `proj_inter`),
  `IsRelativelyBounded`, `IsLocalRiemannianIsometry`, `MemSobolev`, `nuclearENorm`. No pinned
  declaration proves a target: the pin has no essential spectrum, wave operator, min–max value for
  partial operators, or Kato–Rellich lower bound.
- Gaps: `weyl-criterion` and `spectral-integral-resolvent` have the same slug in
  `design/plan.json` and the README, a named supplier and section, and one precise `needs` each.
  UO-C02 names Lemma 6.17 only inside its proof; UO-A02 inverts `z − A` for the measure of a given
  `A`. Not raised.
- Headlines: Lebesgue decomposition, structure of `σ_ac`, interval criterion, min–max, Pearson,
  Kato–Rosenblum, Kato–Rellich bound and cores, Gaffney–Chernoff–Strichartz, `L²` kernel, bounded
  potentials on a manifold, cusp threshold, `−Δ + V`: all stated. The three not statable are named
  in the module docstring with the missing carrier. Padding probe: no theorem follows from one
  library lemma; `gaffney_isSelfAdjoint_closure` is the case `V = 0` of
  `laplacian_add_potential_isSelfAdjoint_closure` but is the roadmap's main headline and is kept.
- Ownership: searched main and the open heads (`roadmaps grep`) for the Schmidt series (owner
  found, S01); round 1's searches for Kato–Rosenblum, Pearson, wave operators, Gaffney and cusp
  ends were not repeated. No fully qualified name collides (`essentialSpectrum` here and in
  UnboundedOperators live in different namespaces with the same body).
- Policy: the pull request changes only `packages/SchrodingerOperatorsAndSpectralTypes/`.

Source independence: 13 passages compared with 8 sources (teschl line 4315–4325, 4350–4353, 5044–5055, 5704–5720, 6277–6281, 7213–7228; bms02 line 151–157; kato57 line 92–111; yafaev04 line 116–122 and 191–206; lp80 line 251–256; hm23 line 41–47; kps26 line 26–39), none shared beyond formulas and hypothesis lists (longest common run: the statement of teschl Lemma 6.17 in the gap sentence, forced by the mathematics); largest share teschl, 40 of 97 locators; contents compared with teschl: independent (Layer 1 draws on its Ch. 3, 4 and 12 with kato57 and yafaev04, Layer 2 on Ch. 6, Layer 3 on none, Layer 4 on Ch. 7 and 10; the order is forced by the `*Needs:*` lines 3.7 → 1.6, 2.1 and 4.4 → 2.2, 4.3). The 13 uncertified texts were not compared.

## Not verifiable

- `pearson78` and `rs3` Theorem XI.7 (uncertified): whether the published statements take `J`
  between two Hilbert spaces (S02 rests on the mathematics, not on these texts).
- `kato76` (uncertified): "Ch. V §4.1" for the bound `γ − max(a/(1−b), a + b|γ|)`
  (`README.md:1127`, `Suggested.lean:213`) and "Ch. X §4.4" for Kato–Rosenblum (`README.md:995`,
  `Suggested.lean:190`). From memory the bound is Theorem 4.11 in Ch. V §4.4 and the trace-class
  theorem is Theorem 4.4 in Ch. X §4.3; both round 1 passes recalled the same. Not opened.
- `rs1`, `rs2`, `strichartz83`, `chernoff73`, `gaffney54`, `grigoryan09`, `chavel84`,
  `iwaniec02`, `lp76`, `cfks87`: uncertified, cited by locator only.
- `kps26`: the journal data "Ann. of Math. 203 (2026)" is not in the cached arXiv text.
- RiemannianGeometry R5c ("item 4 of its scalar principal-eigenfunction part") and MaassForms §0.1
  were not reopened this round; `roadmaps resolve` lists neither as missing.
- The Lean statement proposed in S02 was not elaborated.
- Ownership against public formalisations outside the pinned libraries was not checked.

## Source issues

- **Misprint** in teschl at Theorem 6.4, equation (6.3), printed page 135: the source says the second entry of the maximum is `b` divided by `a − 1`, negative for `a < 1`; it should be `b` divided by `1 − a`; affects a stated result.
- **Error** in teschl at the proof of Theorem 6.4, printed page 135: the source says one may take `−λ` below the minimum of `γ` and `b/(a − 1)`; it should be below `γ` minus the larger of `a|γ| + b` and `b/(1 − a)`; affects the proof.
- **Gap** in teschl at Theorem 4.10, printed page 119: the source says the min–max formula holds for every self-adjoint operator; it should assume the operator bounded below, as otherwise there is no first eigenvalue; affects a stated result.

## For the human reviewers

- **Not tested.** Thirteen of the 21 cited works are uncertified (`sources.toml`, status `uncertified`): neither wording nor locators were compared with them; two `kato76` locators are doubtful (Not verifiable).
- **Licence.** `kps26` is cited as "Ann. of Math. 203 (2026)" (`README.md:1903-1905`); the cached copy is arXiv 2010.05881v3 and carries no journal reference.
- **Scope.** Spectral theory of self-adjoint and Schrödinger operators; the certified sources are a refereed monograph and journal articles (`teschl`, `kato57`, `rosenblum57`, `bms02`, `lp80`, `hm23`). No flag.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8aca3f4a647a0e226766b652a93a330e1a4a40c8", "job": "RT-SchrodingerOperatorsAndSpectralTypes~2b", "model": "fable", "worker": "chris-x26"} -->
