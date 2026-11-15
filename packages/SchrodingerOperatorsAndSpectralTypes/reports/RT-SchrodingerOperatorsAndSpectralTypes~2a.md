<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17292#issuecomment-6903395825 -->
Red team round 2 pass a (claude) of 8aca3f4

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Layer Dependencies paragraphs omit suppliers their sections need

   Location: `packages/SchrodingerOperatorsAndSpectralTypes/README.md:1637-1642` (Layer 3,
   "### Dependencies"): "Layers 1 and 2; DifferentialGeometry Layer 12; RiemannianGeometry R5c (3.8,
   3.9) and R7.8; Completed/HopfRinow; HilbertModules H6; ComplexKahlerGeometry K5a; …".

   Claim: the paragraph lists the suppliers of Layer 3.

   Witness: §3.6's own *Needs:* line (`README.md:1328-1329`) has "PDE §1.2 (density of `C_c^∞` in the
   zero-boundary space `W^{1,2}_0` on Euclidean open sets)", used in step (c); PDE does not occur in
   `:1637-1642`. Likewise §4.4 needs SA-D22 (`:1797`) and the Layer 4 paragraph (`:1842-1843`) lists
   "SA-C54, SA-E47" only.

   Repair: at `:1638` write "…Completed/HopfRinow; HilbertModules H6; ComplexKahlerGeometry K5a; PDE
   §1.2 (3.6); PseudodifferentialOperators P1.0; …"; at `:1842-1843` write "SelfAdjointSpectralTheory
   SA-C54, SA-D22, SA-E47". Tested on the witness: after the edit every roadmap named in a *Needs:*
   line of 3.1–3.10 and 4.1–4.5 occurs in its layer's paragraph (PDE is on main, so no new edge and no
   change to the dependency check).

2. **F02** (P3) the References entry of `rs2` omits §X.1, which the body cites twice

   Location: `packages/SchrodingerOperatorsAndSpectralTypes/README.md:1909`: "`rs2` (Ch. IX, §X.2,
   Theorem X.12)".

   Claim: the References list gives the locators of each work cited.

   Witness: `README.md:1335` ("essentially self-adjoint (rs2 §X.1)", `ℝ⁴ ∖ {0}`) and `:1539` ("limit
   circle at `±∞`, rs2 §X.1"); the manifest entry of `rs2` in `sources.toml` has "§X.1 (essential
   self-adjointness examples: −Δ on ℝⁿ minus a point, limit-circle potentials)".

   Repair: at `:1909` write "`rs2` (Ch. IX, §X.1, §X.2, Theorem X.12)". Tested: the three body
   locators of `rs2` (Ch. IX at `:1653`, §X.1 at `:1335` and `:1539`, §X.2 and Theorem X.12 at `:196`,
   `:1127`, `:1781`) then all occur in the entry and agree with the manifest.

Round 2. No P1 and no P2 finding. Two P3 findings (S01, S02), both one-line edits of the README.
Every round-1 finding is repaired at this head and no repair introduced an error. No Lean was run in
this pass (the brief gives no Lean command); the 19 elaborated types of the worker's signature file
were compared with the source and with the README by reading.

## Round-1 findings at this head

| Round-1 finding | Status | Witness at `8aca3f4` |
|---|---|---|
| 1a/F01 (P2), §4.3 kernel energy without owner | repaired | `packages/SchrodingerOperatorsAndSpectralTypes/README.md:1729-1732`: "An operator on `L²(ℝ^d)` given by a kernel in `L²(ℝ^d × ℝ^d)` is Hilbert–Schmidt … (AutomorphicSpectralTheory §0.8, `hilbert_schmidt_kernel` …)"; also in the *Needs:* line (`:1750`), the Layer 4 Dependencies (`:1843`), the scope (`:133-136`) and a contract (`:481-488`). §0.8 exists at the supplier's open head with that name and those hypotheses (σ-finite standard Borel, separable `L²`); the supplier is line 101 of `merge-order/ORDER.txt`, this roadmap line 221. |
| 1a/F02 = 1b/F01 (P2), transport law for every partial operator | repaired | `README.md:527-528`: "If `A` is self-adjoint, `IsSpectralMeasureOf A P` and `U : ℋ → ℋ'` is unitary, then `B ↦ U P(B) U⁻¹` is the spectral measure of `U A U⁻¹`"; new Check at `:548-554`. Recomputed: `A = ⊥` on `ℂ²` has empty resolvent set (`R y ∈ dom A = 0` forces `(z − A)Ry = 0 ≠ y`); `A = i` on `ℂ`, `z = 2i`: left side `−i`, right side has imaginary part `∫ −2/(s²+4) dμ ∈ [−1/2, 0)`. |
| 1a/F03 (P2), statable headline of §3.9 absent | repaired | `Suggested.lean:298-323` `laplacian_add_potential_isSelfAdjoint_closure`; module docstring `:45-46`; `README.md:1471-1473`. The added domain clause is true: `M_V` is bounded, so the closure of `Δ₀ + V` has the domain of the closure of `Δ₀`, the maximal domain of §3.6. |
| 1a/F04 (P3), needless isolation clause in §3.7 | repaired | `README.md:1363-1364`: "if `X` is connected with `vol_g(X) < ∞`, then `λ₁⁺(X) = λ₁(X)`", with the two-case route at `:1364-1370`. Recomputed on the circle (`1 = 1`), a point (`+∞ = +∞`) and an end `dr² + r⁻⁴dθ²` (`0 = 0`). |
| 1a/F05 (P3), "Mathlib Plancherel" | repaired | `README.md:934-935`: "Mathlib `MeasureTheory.Lp.norm_fourier_eq` (Plancherel on `L²`) and `MeasureTheory.Lp.fourierTransformₗᵢ`"; both are in `Mathlib/Analysis/Fourier/LpSpace.lean` (lines 90, 51). Factor: `t = 2πτ` gives `∫ |∫ e^{−itλ} g|² dt = 2π‖g‖²`. |
| 1a/F06 (P3), unused contract rows | repaired | `HyperbolicMetric`, `W1p`, `UpperHalfPlane` no longer occur in the README; `:303-304` reads "`TauCeti.Wkp` in `TauCeti/Analysis/Sobolev/`" (pin: `TauCeti/Analysis/Sobolev/Wkp/Basic.lean:145`). |
| 1b/F02 (P3), three *Needs:* lines | repaired | §3.2 `:1213` has "HilbertModules H6 (`(closure T)* = T*`)"; §1.6 `:819-820` has "SA-C39, SA-D12, SA-D22, SA-E08, SA-E11–SA-E13" after the second paragraph; §4.4 `:1796` has "1.4, 2.1, 2.2, 4.1, 4.2, 4.3". |

No repair report item is marked `not actionable in this package`; nothing is re-raised.

## Adversarial pass: `Suggested.lean`

Context: the file has no `variable` block and no `include`; every declaration carries its own
binders. `H` is `[NormedAddCommGroup H] [InnerProductSpace ℂ H]`, with `[CompleteSpace H]` wherever
a `ProjValMeasure` or `IsSelfAdjoint` occurs; the manifold theorems carry `[EMetricSpace M]`,
`[IsRiemannianManifold I M]`, `[CompleteSpace M]`, `[I.Boundaryless]`, `[IsManifold I ∞ M]`,
`[SecondCountableTopology M]`, `[BorelSpace M]`.

| Declaration (README section) | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `IsSpectralMeasureOf` (1.1) | `A = 2` on `ℂ` with `δ₂`, `δ₃`; `A = i` on `ℂ`, `z = 2i`; `A = ⊥` on `ℂ²`; `H = 0` | `(i−2)⁻¹ = (−2−i)/5` both sides; `(−3−i)/10 ≠`; left `−i`, right imaginary part in `[−1/2, 0)`; resolvent set empty, value unspecified; `0 = 0` | real body; determines `P` for self-adjoint `A` | none |
| `diag_spectralType_components` (1.2) | `M_x ⊕ ½` on `L²[0,1] ⊕ ℂ`, `f = (1,1)`; cross terms; atoms; `f = 0` | `Leb|[0,1] + δ_{1/2}`, ac part `Leb|[0,1]`, atom set `{1/2}`; `|μ_{f,g}(B)|² ≤ μ_f(B∩N)μ_g(B∩N) + μ_f(B∖N)μ_g(B∖N) = 0` for a carrier `N` of one measure null for the other; the atom set `A` is countable so `μ_ac(A) = μ_sc(A) = 0` and `μ_pp(Aᶜ) = 0`; `0 = 0` | true | none |
| `acSpectrum` (1.4) | `M_x` on `L²[0,1]`; `diag(q_n)`; `M_x ⊕ 2` at `t = 2`; `H = 0` | `[0,1]`; `∅`; excluded (`μ_f{2} = 0` for ac `f = (g, 0)`); `∅` | real body | none |
| `perfect_acSpectrum_and_mem_iff` (1.4) | `∅`; isolated point `t`; one vector from many | `Perfect ∅`; an ac `f` charging `I_ε` has `μ_f{t} = 0`, so its support meets `I_ε ∖ {t}` in a point of `σ_ac`; annuli `J_m = I_{1/m} ∖ I_{1/(m+1)}`, distinct `m_k`, `f = Σ 2^{−k} g_k/‖g_k‖` has `μ_f(I_ε) ≥ 4^{−k} μ_{g_k}(J_{m_k})/‖g_k‖² > 0` | true | none |
| `Icc_subset_acSpectrum_iff` (1.5) | `M_x` on `L²([0,1] ∪ [2,3])`, `[a,b] = [0,1]`, `[1,2]`; `a = b` | holds with `f = 1`; `J = (1.2, 1.8)` has mass `0` and `1.5 ∉ σ_ac`; excluded by `a < b` (right side vacuous, `{a} ⊄ ∅` for `A = 0`) | true both ways | none |
| `essentialSpectrum` (1.6) | `0` on `ℂ`; `0` on `ℓ²`; `diag(1/n)`; body against `TauCetiRoadmap/OperatorTheory/UnboundedOperators/Suggested.lean:168-178` | `∅`; `{0}`; `{0}`; `spectrum ∖ discreteSpectrum` unfolds to the same set (the clause `z ∈ spectrum` is implied by the difference) | same object, other namespace | none |
| `minMaxValue` (1.6) | `diag(1,3,5)`, `n = 0..3`; `H = 0`; `0` on `ℂ`, `n = 1` | `1, 3, 5, ⊤`; `⊤`; `φ = 0` gives `0`, `φ ≠ 0` gives `⊤`, supremum `⊤` | `μ_{n+1}`, `EReal` | none |
| `minMax_principle` (1.6) | `diag(1,3,5)` at `c = 4`, `c = 3`; `M_x` on `L²[0,1]`; `0` on `ℓ²`; `H = 0`; `−diag(n)` | `Σ = ⊤`, count `2 = finrank 2`, `1 = 1`; `Σ = 0`, all values `0`, no `c < 0` counts; `Σ = 0`, `0 = 0`; `⊤ ≤ ⊤`, `0 = 0`; `encard = ⊤ ≠ 0 = finrank`, excluded by `hγ` | true | none |
| `pearson_tendsto` (1.9) | `J = 0`, `C = 0`; `J = 1`, `C = V`; `H₁ = diag`; Duhamel sign | limit `0`; Kato–Rosenblum; only `x = 0` is ac; `d/du ⟪e^{−iuH₂}ψ, Je^{−iuH₁}φ⟫ = i⟪H₂ψ_u, Jφ_u⟫ − i⟪ψ_u, JH₁φ_u⟫ = i⟪ψ_u, Cφ_u⟫` | true; `complexGenerator = i • H` is `U(t) = e^{itH}` | none |
| `katoRosenblum` (1.9) | `V = 0`; `diag(1/n²)`, `V = −diag(1/n²)`; `M_x`, `V = c·1` | `y = x`; both ac subspaces `0`, `∅ = ∅`; `e^{itc}x` diverges, excluded (not trace class) | true | none |
| `katoRellich_lowerBound_hasCore` (2.3) | `γ = 0`, `V = −(a + bA)`; `A = λ ≥ γ`, `V = −(a + b|λ|)`; `γ = −10`, `a = 0`, `b = ½`, `V = A/2`; `sup_{λ≥γ}|λ|/(λ−μ)` | `(1−b)A − a ≥ −a ≥ −a/(1−b)`; `≥ γ − a − b|γ|`; `−15 = −10 − max(0, 5)`; `max(1, |γ|/d)`, so `a/d + b·max(1,|γ|/d) < 1` iff `d > a/(1−b)` and `d > a + b|γ|` | true; sharp in the third | none |
| `complexLaplacian` (3.1) | `‖x‖²` on `ℝ^d`; `yˢ` on `ℍ`; `e^{inθ}` | `−2d`; `s(1−s)yˢ`; `n²e^{inθ}` | sign `−div grad` | none |
| `gaffney_isSelfAdjoint_closure` (3.6) | `(0,1)`; `M = ∅`; dimension `0`; cutoff estimates | deficiency `(2,2)`, excluded by `CompleteSpace`; `L² = 0`; `T = 0`, closure `0` on `ℓ²`, `w = 0` for every `u`; `∫χ²|du|² ≤ 2‖Δu‖‖u‖ + 4sup|dχ|²‖u‖²`, `∫χ²|u|² ≤ sup|dχ|²‖u‖²` | true | none |
| `exists_mem_domain_closure_eq_zero_iff` (3.7) | `S¹`; `ℝ`; `S¹ ⊔ ℝ`; `⊔_ℕ S¹` | constants; `0` only; `c·1_{S¹}`; `ℓ²` of indicators, both sides | true both ways | none |
| `laplacian_add_potential_isSelfAdjoint_closure` (3.9) | circle, `V = 1`; `V = 0`; `M = ℕ` discrete, `V(p) = −1/(p+1)`; `M = ∅`; `V = −x⁴` on `ℝ` | `n² + 1 ≥ 1 = essInf`; Gaffney, `0 ≤ ⟪u,Δu⟫`; closure `M_V` on `ℓ²`, `Σ V(p)|x_p|² ≥ −‖x‖²`, domain all of `ℓ²`; `0 ≤ 0`; excluded by `MemLp V ⊤` | true | none |
| `cuspRegion` (3.10) | `a = 1`; `a ≤ 0` | `{y > 1}`; all of `ℍ` (excluded later by `0 < a`) | real body, openness proved | none |
| `IsStandardCuspEnd` (3.10) | quotient map of `⟨z+1⟩\ℍ` on `ℍ_1`, `w = 1`, `w = 2`; target of dimension `≠ 2` | accepted; rejected (`(0,y) ~ (1,y)`, `1 ∉ 2ℤ`); `mfderiv` not invertible | determines the end up to `(x,y) ↦ (cx,cy)` | none |
| `Ici_quarter_subset_essentialSpectrum` (3.10) | `u_n = y^{1/2+it}ψ((log y − n)/n)` | `‖u_n‖² = wn‖ψ‖²`; `(Δ − ¼ − t²)u_n = −y^{1/2+it}(2itψ′/n + ψ″/n²)`, ratio `≤ (2|t|‖ψ′‖/n + ‖ψ″‖/n²)/‖ψ‖`; supports `log y ∈ [2^{j+1}, 3·2^j]`, `3·2^j < 2^{j+2}` | true | none |
| `schrodinger_isSelfAdjoint_closure` (4.4) | `V = c`; `V = 1` in the last clause; `d = 1`, `V = −1_{[−1,1]}`; `d = 0` | `σ = [c,∞)`; hypothesis fails (`σ_ess = [1,∞)`); `0.739·tan 0.739 = 0.673`, `κ = 0.674`, `E = −0.454 ∈ [−1,0)`; excluded by `hd` | true | none |

One-tactic probe: none of the 12 theorems follows from one library lemma or restates a definition
(the pins have no essential spectrum, wave operator, min–max value for partial operators, or
Kato–Rellich bound; `TauCeti/Analysis/InnerProductSpace/LinearPMap/KatoRellich.lean` has
self-adjointness only). No padding. Headlines of the Summary: Lebesgue decomposition, structure of
`σ_ac`, interval criterion, min–max, Pearson, Kato–Rosenblum, Kato–Rellich bound and cores,
Gaffney–Chernoff–Strichartz, `L²` kernel, bounded potentials on a complete manifold, cusp
threshold, `−Δ + V` on `ℝ^d`: all stated. The three clauses that are not statable (`H¹₀ = H¹` and
the form domains of §3.6 and §4.2, the identification of §3.8) are named in the module docstring
with the missing carrier.

## Adversarial pass: README targets

| Section | Instances | Values on each side | Result |
|---|---|---|---|
| Conventions | `μ = 2Leb|[0,1]`; `A = 2`, `U(t) = e^{2it}`; `(a,b)` lettering for `A = 2`, `V = 3`; `e^{−πx²}` | `Leb.withDensity 2 = μ`, reversed `4Leb`; derivative `2i`; `(3,0)` and `(0,3/2)`; `−ψ″ = (2π − 4π²x²)ψ` | agree |
| 1.1 | `diag(1,2)`, `f = (1,i)`, `g = 3·1_{{2}}`; `A = 0`, `f = h` | `9δ₂`; `4δ₀ ≠ 2δ₀` | agree |
| 1.3 | `diag(1,2,3)`, `U = span(e₁,e₃)`; `U = 0` | `{1,3}`; `∅` | agree |
| 1.4, 1.5 | `([0,1] ∪ {2})^ess`, `ℚ^ess`, `(0,1)^ess`; fat Cantor `K` | `[0,1]`, `∅`, `[0,1]`; `K^ess ⊆ K` has no interval | agree |
| 1.6 | Neumann and Dirichlet on `(0,1)`; `0` on `ℓ²` with the wrong model; obstacles on a core | `(n−1)²π² ≤ n²π²`; count `⊤` against `finrank = 0`; a graph-dense subspace meets a finite-codimension graph-closed subspace densely | agree |
| 1.7 | `H₂ = H₁ + c`; Hardy space | `e^{itc}` diverges; `e^{iax}` preserves it exactly for `a ≥ 0` | agree |
| 1.8 | `x = m·1_{[0,1]}`, rank-one `C`; `|λ|^{−1/4}1_{[−1,1]}`; `m = 0` with infinite energy | `2πm²` both sides; tail `∫_{|λ|<m^{−4}}|λ|^{−1/2} = 4/m²`; `x = 0`, `0 ≤ 0` | agree |
| 1.9 | `V = 0`, `diag(1,2)`; `H₁ = M_x`, `H₂ = 2M_x`, `x = 1_{[0,1]}` | `W_± = 0`, `Ω_± = 1`; `(e^{it} − 1)/(it) → 0`, distance `1` | agree |
| 2.1 | Gaussians `e^{−πx²/n²}`; SA-D22, SA-E08, SA-E11 as cited | `‖u‖² = n/√2`, `‖u′‖² = π/(n√2)`, quotient `π/n²`; the three ids on main state exactly the three implications | agree |
| 2.2, 2.3 | `A = 2`, `V = 1`, `μ = 0`; `γ = 0`, `a = 1`, `b = ½` | `(3/2)·2 = 3`; bound `−2` | agree |
| 3.1–3.4 | circle Green; `e^{−|x|}`; `χ/|x|` on `ℝ³`; `(0,1)` | `2πn²` both sides; `−u + 2δ₀`; `4πδ₀`; Poincaré constant `π⁻¹`, fails for `1` | agree |
| 3.5 | step thresholds; `(0,1)` | slope `4/3 < 2`, gradient `2·(2/k)`; `1 ≤ 2/k` false for `k > 2` | agree |
| 3.7 | circle; torus `ℝ²/ℤ²`; `⊔_ℕ S¹`; two-case route | `0,1,1,4,4`; `λ₁..λ₄ = 4π²`; `λ₁⁺ = 1 ≠ 0 = λ₁`; least point of `σ ∖ {0}` is `< inf σ_ess` or equals it | agree |
| 3.8, 3.9 | `S²`; one point, `s = 1`; `V = 1_{[0,π)}` | `2,2,2`; `T = i`, `T − T* = 2i = 2i·TT*`, `i + i⁻¹ = 0`; Rayleigh `½`, `(1−λ)u′(0) = −λu′(0)` | agree |
| 3.10 | area; `(x,y) ↦ (2x,2y)`; `yˢ ∈ L²`; `Γ₀(2)` fixed point | `w/a`; `(1,1) → (2,2)`, area `1`; iff `Re s < ½`; `(z−1)/(2z−1)` fixes `(1+i)/2` | agree |
| 4.1 | `e^{−πx²}`; norm comparison | `‖u″‖² = 3π²/√2`, `‖ξ²û‖² = 3/(16π²√2)`, ratio `16π⁴`; `N ≤ ‖u‖ + ‖Δu‖/4π²`, `‖u‖ + ‖Δu‖ ≤ (1+4π²)N` | agree |
| 4.2 | density at `d = 1`; form | `e^{−λ/2π}/(2π√λ)`, mass `2^{−1/2}`, equal to QuantumFoundations §8.2's formula at `n = 1`; `q(u) = π/√2` | agree |
| 4.3 | change of point at `s = 0, 1`; norm convergence | `i`, `(1+i)/2` both sides, slip `2 − i`; `≤ ‖V − V_R‖_∞ + ‖V‖_∞(4π²R²+1)⁻¹` | agree |
| 4.4, 4.5 | `cos x + cos √2x`; frequencies without `θ_{−n} = −θ_n` | `−2` approached, not attained; `(e^{ix} + e^{2ix})/2` not real | agree |

## Dependency check

    depcheck: 237 roadmaps, 2247 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The suppliers that are not on main are FuchsianOrbifolds (line
50), AutomorphicSpectralTheory (101), CongruenceSpectralGap (164), MaassForms (165) and
QuantumFoundations (220); this roadmap is line 221.

## Verified sound

- Declarations read: 19 of 19 (7 definitions with real bodies, 12 theorems with `sorry`), every
  line of `Suggested.lean`; one `import Mathlib`, 11 `TauCeti.*` modules, each used and present at
  the pin; no `set_option`, `lemma`, `#eval`, sorry'd data, `True` placeholder or process text.
  Every Lean name occurs in the README and the README names no declaration of its own that the file
  lacks. Elaborated types: read from the worker's signature file (19 entries), no binder lost; no
  Lean was run.
- Targets read: all 27 sections 1.1–4.5 with routes, *Needs:* lines, Checks, Examples and
  Dependencies, and the Summary, scope, Conventions, contracts, Downstream consumers, Worked
  examples and References (every line of the README).
- Checks: 119 Check bullets read; every numerical or set-valued claim recomputed (tables above);
  none false, vacuous or a restatement; no definition has fewer than three.
- Locators verified against the cached texts: 58 (teschl 31, bms02 5, kato57 5, yafaev04 4,
  rosenblum57 3, hm23 4, lp80 3, kps26 3); printed pages of teschl checked at lines 1780, 3287,
  3983, 4945, 5704, 6277, 7137, 7213, 9578, 10585 (page marker minus 12).
- Sibling citations resolved at main or at the open head: 65 (SelfAdjointSpectralTheory 24 ids;
  UnboundedOperators UO-A01, A02, A03, A06, A07, B03, C01, C02, C03, D06, E04, E05, E06;
  AutomorphicSpectralTheory §0.8, §1.16a, §§4.1–4.4; QuantumFoundations §8.2, §9.5;
  CongruenceSpectralGap §0.2, §0.6; MaassForms §0.1; RiemannianGeometry R5c item 4, R7.8 item 8;
  ComplexKahlerGeometry K5a, K5a.ComponentwiseCompact; HilbertModules H6; SmoothBundlesConnections
  B2.2; PseudodifferentialOperators P1.0; ComplexCurveModuli D6 item 2; GeometricTopology §7.1;
  FuchsianOrbifolds Layer 3 items 1 and 3; VariationalMethods 3.1, 4.4, 5.1; OperatorIdeals OI-A35,
  OI-A40, OI-B29; PDE §1.2, §1.3, §6.3; DifferentialGeometry Layer 12). SA-B85 has the
  nondegenerate `C₀(X)` case §1.4(4) uses; UO-E05 states the `H₀²` closure the Check of §3.2 cites.
- Pinned declarations: 66 names of the supplier contracts found in the files the README gives (42
  Tau Ceti, 24 Mathlib), with the quoted content of `IsRelativelyBounded`, `ProjValMeasure`'s
  fields, `LinearPMap.resolvent`, `HasCore`, `IsLocalRiemannianIsometry`, `IsRiemannianManifold`,
  Stone's theorem and the scoped instance `Manifold.instRiemannianBundleOpen`.
- Ownership, by object, over main and the open heads through `roadmaps grep`: no other roadmap
  states Kato–Rosenblum, Pearson's theorem, Glazman's count, abstract wave operators, the
  absolutely continuous spectrum of a projection-valued measure, the Kato–Rellich lower bound or
  the Gaffney–Chernoff–Strichartz theorem for general manifolds (SobolevDifferentialForms' "Gaffney
  identity on the cube" is another result; CongruenceSpectralGap §0.2 is the case `Γ(N′)\ℍ`, cited).
  No fully qualified name of `Suggested.lean` is declared by a roadmap that can be read.
- Gaps: `weyl-criterion` and `spectral-integral-resolvent` have the same slug in `design/plan.json`
  and in the README, the supplier `OperatorTheory/UnboundedOperators` with a section, and one
  `needs` sentence with its hypotheses; UO-C02 on main names Lemma 6.17 inside a proof only.
- Policy: `git diff --stat origin/main...HEAD` shows only `packages/SchrodingerOperatorsAndSpectralTypes/`;
  no pull-request number, process word, machine path or algorithm in the README or the Lean file.
- Arrangement: teschl's chapters (2 self-adjointness, 3 spectral theorem, 4 applications, 6
  perturbation theory, 7 free operator, 10 one-particle operators, 12 scattering) against the
  layers: Layer 1 draws on Ch. 3, 4 and 12 with kato57, yafaev04 and rosenblum57, Layer 2 on Ch. 6,
  Layer 3 on none, Layer 4 on Ch. 7 and 10. No layer is a chapter and the order is not the book's;
  the order 1, 2 before 3, 4 is forced by the *Needs:* lines of 3.7 (1.6, 2.1) and 4.4 (1.4, 2.2).

Source independence: 13 passages compared with 8 sources (teschl line 4388–4425 with §1.2 and §1.4, line 5044–5055 with §1.6, line 5704–5711 with §2.3, line 6277–6281 with the gap sentence, line 10600–10620 with §1.7, line 9578–9584 with §4.4; kato57 line 21–35 with §1.9 and line 92–96 with §1.8; bms02 line 151–157 with §3.2; yafaev04 line 191–206 with §1.9; hm23 line 41–47 with §3.7; lp80 line 251–256 with §3.10; kps26 line 26–39 with §4.5; rosenblum57 line 70–72 with §1.9), none shared beyond formulas and hypothesis lists (longest common run 8 words, the statement of teschl Lemma 12.1); largest share teschl, 40 of 97 locators; contents compared with teschl: independent.

## Not verifiable

- `kato76` (uncertified, no text): "Ch. V §4.1" for the bound `γ − max(a/(1 − b), a + b|γ|)`
  (`README.md:1127`, `Suggested.lean:213`) and "Ch. X §4.4" for Kato–Rosenblum (`README.md:995`).
  From memory the bound is Theorem 4.11 of Ch. V §4 in its subsection on semibounded operators,
  and Kato–Rosenblum is Theorem 4.4 of Ch. X §4; if so the locators give theorem numbers as
  subsection numbers. Whoever holds the book should check; "Ch. V §4, Theorem 4.11" and "Ch. X §4,
  Theorem 4.4" would be the safe form.
- `rs1`, `rs2`, `rs3`, `pearson78`, `strichartz83`, `chernoff73`, `gaffney54`, `grigoryan09`,
  `chavel84`, `iwaniec02`, `lp76`, `cfks87`: uncertified; the statements they are cited for were
  checked mathematically, not against the texts.
- `kps26`: the cached text is OCR; (1.3) and Theorem 1.1 are legible enough to confirm `d ≥ 2`,
  `l > d`, `max |n_j| ≤ Q` and the full-measure set, not the displayed formulas.
- Whether UnboundedOperators UO-A03's "inverse-symbol" corollaries are stated for every
  projection-valued measure or for `P_A` only (its text says "for Borel `f, g`" and routes the
  product law through `P_A`). If for every one, `gap:spectral-integral-resolvent` asks for less than
  it seems; the text does not settle it.
- OperatorIdeals OI-B32, OI-B35, OI-B36, OI-C14: found by the citation resolver, not reopened in
  this pass.
- `Suggested.lean` was not elaborated in this pass.
- Ownership against public formalisations outside the pinned libraries was not checked.

## Source issues

- **Misprint** in teschl at Theorem 6.4, equation (6.3), printed page 135: the source says the second entry of the maximum is `b` over `a − 1`, negative for `a < 1`; it should be `b` over `1 − a`; affects a stated result.
- **Error** in teschl at the proof of Theorem 6.4, printed page 135: the source says `−λ` may be taken below the smaller of `γ` and `b/(a − 1)`; it should be below `γ` minus the larger of `a|γ| + b` and `b/(1 − a)`; affects the proof.
- **Gap** in teschl at Theorem 4.10, printed page 119: the source says the min–max formula holds for every self-adjoint operator; it should assume the operator bounded below, or read the values in the extended reals; affects a stated result.

## For the human reviewers

- **Licence.** `kps26` is cited as "Ann. of Math. 203 (2026)" (`README.md:1903-1905`); the cached copy is the arXiv version dated 2 May 2025 and carries no journal reference.
- **Not tested.** Thirteen of the 21 cited works are uncertified (`sources.toml`, status `uncertified`); wording and locators were not compared with them, and the two `kato76` locators are doubtful (Not verifiable).
- **Scope.** Spectral theory of Schrödinger operators and of the Laplace–Beltrami operator; the sources are refereed monographs and journal articles (`teschl`, `kato57`, `bms02`, `lp80`, `hm23`). No flag.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8aca3f4a647a0e226766b652a93a330e1a4a40c8", "job": "RT-SchrodingerOperatorsAndSpectralTypes~2a", "model": "fable", "worker": "chris-x52"} -->
