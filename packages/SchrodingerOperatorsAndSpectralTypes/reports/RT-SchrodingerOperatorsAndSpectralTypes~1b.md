<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17292#issuecomment-6902397358 -->
Red team round 1 pass b (claude) of 35f3419

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) the transport law of `IsSpectralMeasureOf` is stated for every partial operator

   **Location.** `packages/SchrodingerOperatorsAndSpectralTypes/README.md:512-513` (§1.1, second law
   of the predicate): "If `IsSpectralMeasureOf A P` and `U : ℋ → ℋ'` is unitary, then
   `B ↦ U P(B) U⁻¹` is the spectral measure of `U A U⁻¹`". The predicate is introduced at line 501
   "For a partial operator `A`".

   **Claim.** The law holds for every partial operator `A` satisfying the predicate.

   **Witness.** The predicate is written with `LinearPMap.resolvent`, which at the pin is
   `(exists_isResolventAt_of_mem A lambda).choose`
   (`TauCeti/Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean:169-170`): off the resolvent
   set it is an unconstrained choice (the README says so itself at line 331, "a junk value off it").
   For `A` with a nonreal `z` outside its resolvent set (for instance `A = ⊥` on `ℂ²`, where
   `z − A : 0 → ℂ²` is never onto), `resolvent A z` and `resolvent (U A U⁻¹) z` are two unrelated
   chosen operators, so nothing transports the hypothesis: the law can be neither proved nor refuted.
   The detailed "Unitary transport" law at line 540 is stated for self-adjoint `A` only, and the proof
   sketch (line 551) uses SA-E05 and SA-E44, which exist only for self-adjoint `A`; the bullet at 512
   is the one statement that drops it.

   **Repair.** Replace the bullet by:

   > - If `A` is self-adjoint, `IsSpectralMeasureOf A P` and `U : ℋ → ℋ'` is unitary, then
   >   `B ↦ U P(B) U⁻¹` is the spectral measure of `U A U⁻¹` (the transport law below). Self-adjointness
   >   is used: the predicate reads `LinearPMap.resolvent`, which is a junk value at a nonreal point
   >   outside the resolvent set, and a junk value is not transported by `U`.

   and add to the Checks of the predicate:

   > - The predicate is meaningful only when every nonreal `z` is a resolvent point (as for
   >   self-adjoint `A`, SA-D18): for `A = ⊥` on `ℂ²` no `z` is one, `LinearPMap.resolvent A z` is an
   >   arbitrary operator, and no law of this section is asserted for such `A`.

   Tested on the refuting instance: with `A` self-adjoint every nonreal `z` lies in the resolvent set
   (SA-D18), `U R_A(z) U⁻¹` inverts `z − U A U⁻¹` on the actual domains, so
   `resolvent (U A U⁻¹) z = U R_A(z) U⁻¹` by `LinearPMap.resolvent_eq_of_isResolventAt` (same file,
   line 178), and `⟪Uf, U R_A(z) U⁻¹ Uf⟫ = ⟪f, R_A(z) f⟫ = ∫ (z − s)⁻¹ dμ_f`; `A = ⊥` no longer
   satisfies the hypotheses. No Lean declaration changes (`IsSpectralMeasureOf` is a definition and
   every theorem that uses it assumes `IsSelfAdjoint`).

2. **F02** (P3) three `*Needs:*` lines omit an input their own text uses

   **Location and witness.**

   1. `README.md:1171` (§3.2) uses "`Δ₀† = (closure Δ₀)†` (HilbertModules H6)"; the `*Needs:*` line
      of §3.2 (`README.md:1182-1184`) lists 3.1, SmoothBundlesConnections B2.2, Tau Ceti and Mathlib
      only.
   2. `README.md:779-782` (§1.6, "The statement without spectral projections") uses that a form lower
      bound `γ` puts `σ(A)` in `[γ, ∞)` (SA-D22, as §2.1 cites it), that the spectrum is closed
      (SA-D12) and "SA-E08 off the spectrum"; the `*Needs:*` line of §1.6 (`README.md:774-775`) lists
      "1.3; SelfAdjointSpectralTheory SA-E11–SA-E13, SA-C39; UnboundedOperators UO-A01–UO-A02, UO-C02,
      UO-D06".
   3. `README.md:1729` (§4.4, third clause) says "`σ_ac(H_V)`, `σ_sc(H_V)`, `σ_pp(H_V)` are defined
      by 1.4"; the `*Needs:*` line of §4.4 (`README.md:1743-1745`) lists "2.1, 2.2, 4.2, 4.3; …".

   **Repair.**

   1. §3.2: "*Needs:* 3.1; SmoothBundlesConnections B2.2; HilbertModules H6 (`(closure T)* = T*`);
      Tau Ceti `TauCeti.riemannianVolume` and its open-positivity instance; Mathlib …" (rest
      unchanged).
   2. §1.6: move the `*Needs:*` line after the paragraph "The statement without spectral projections"
      (it covers both paragraphs) and write "*Needs:* 1.3; SelfAdjointSpectralTheory SA-C39, SA-D12,
      SA-D22, SA-E08, SA-E11–SA-E13; UnboundedOperators UO-A01–UO-A02, UO-C02, UO-D06." All three
      added ids exist on main (`TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md:1086`,
      `:1113`, `:1217`) and are already in this README's supplier contract (line 359-361), so no new
      edge is created and "Layers 1 and 2 are independent" stays true.
   3. §4.4: "*Needs:* 1.4, 2.1, 2.2, 4.2, 4.3; …" (rest unchanged).

One P2 (a law of the new predicate stated without the hypothesis that makes it provable) and one
P3 (dependency lines). No P1. No declaration of `Suggested.lean` was found false,
vacuous, padded or duplicated at the pins; no headline that is statable at the pins is absent.

## Verified sound

Counts: 18 declarations of `Suggested.lean` read (7 definitions, 11 theorems; every line of the
file); every bold target of README §§1.1–4.5 read (27 sections, every line of the README); 52
locators verified against the cached texts (teschl 32, bms02 6, kato57 4, yafaev04 3, rosenblum57
2, hm23 3, lp80 3, kps26 2; three source mistakes found, under Source issues; printed pages checked for teschl lines 1780, 3287, 3983, 4326, 4945,
6277, 7137, 7213, 9578, 10585); 118 Check bullets read, each one with a numerical or set-valued claim recomputed (the instances
are in the tables below), none false, vacuous or a restatement, and no definition with fewer
than three; 71 sibling citations resolved (36 SA ids and 13 UO ids on main, and
VariationalMethods 4.4, QuantumFoundations §8.2 and §9.5 at its open head, RiemannianGeometry R5c
and R7.8 item 8, ComplexKahlerGeometry K5a and K5a.ComponentwiseCompact, DifferentialGeometry
Layer 12, CongruenceSpectralGap §0.2 at its open head, AutomorphicSpectralTheory §1.16a,
FuchsianOrbifolds Layer 3 items 1 and 3, GeometricTopology §7.1, OperatorIdeals OI-A35, OI-A40,
OI-B29, OI-B35, OI-B36, OI-C14, PDE §§1.2, 1.3, 6.3, HilbertModules H6, SmoothBundlesConnections
B2.2, PseudodifferentialOperators P1.0); 47 pinned library names resolved with their files (18
Mathlib, 29 Tau Ceti), all present where the README says.

**Elaborated signatures.** I did not run Lean (the brief gives this pass no Lean command). I
compared each of the 18 elaborated types in the worker's `signatures.md` with the source and with
the README statement: no binder lost, `∞` elaborates to the smooth index in `ContDiff ℝ ∞` and
`ContMDiff … ∞` (not the analytic `⊤` that UO-E06 warns of), `⨅ … , (t : EReal)` ends before `→`
in `minMax_principle` (the notation's body is parsed at level 60), `-(Δ f) x` is `-(Δ f x)`, and
the `Lp → 𝓢'` coercion in `schrodinger_isSelfAdjoint_closure` is `Lp.toTemperedDistribution`.
Nothing changed.

**Dependency check** (output of the command of the brief, run on the README at `35f3419`):

```
depcheck: 240 roadmaps, 2261 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Both declared gaps (`gap:weyl-criterion`,
`gap:spectral-integral-resolvent`) have the same slug in `design/plan.json` and in the README, name
`OperatorTheory/UnboundedOperators` with a section, and ask for something main does not state
(UO-C02 uses Lemma 6.17 inside a proof only; UO-A02 proves the resolvent inversion for the spectral
measure of a given operator, not for a bare `P`). Not raised.

**Policy.** The pull request changes only `packages/SchrodingerOperatorsAndSpectralTypes/`; no
pull-request number, process word, `lemma`, `set_option`, `#eval`, machine path or algorithm in the
README or the Lean file; one `import Mathlib` then 11 `TauCeti.*` modules, each used by a
declaration and each present at the pin.

**Ownership.** Searched main and the open heads for Kato–Rosenblum, Pearson, wave operators,
Gaffney/Chernoff/Strichartz essential self-adjointness, Glazman, absolutely continuous spectrum,
standard cusp ends: no other owner. CongruenceSpectralGap §0.2 (earlier in the order) proves the
Gaffney argument on `Γ(N′)\ℍ` only and the README says so; `essentialSpectrum` repeats UO-C02's
formula verbatim (`TauCetiRoadmap/OperatorTheory/UnboundedOperators/Suggested.lean:168-178`) under
a different namespace and the README disclaims ownership; `schrodinger_isSelfAdjoint_closure`
overlaps UO-E06's `isSelfAdjoint_closure_neg_laplacian_add_potential` only at `d = 3`, `V₂ = 0`, and
the README says so. No fully qualified name collides.

**Headlines and padding.** Headlines of the Summary: Lebesgue decomposition (stated), structure of
`σ_ac` (stated), interval criterion (stated), min–max (stated), Pearson (stated), Kato–Rosenblum
(stated), Kato–Rellich bound and cores (stated), Gaffney–Chernoff–Strichartz (stated), `L²` kernel
(stated), cusp threshold (stated), `−Δ + V` (stated); `H¹₀ = H¹` and the form domains (not
statable: no `H¹` of a manifold and no form domain at the pins, named in the module docstring);
identification with R5c/K5a (not statable, named). One-tactic probe on the 11 theorems: none
follows from one library lemma (pin greps for min–max, wave operators, essential spectrum,
`adjoint`/`closure` comparison, Kato–Rellich bound: only `IsSelfAdjoint.add_of_isRelativelyBounded`,
which gives neither the bound nor the cores). No padding found.

### Table A: `Suggested.lean` declarations

Context: no `variable` block; every declaration carries its own binders. `H` is always
`[NormedAddCommGroup H] [InnerProductSpace ℂ H]`, with `[CompleteSpace H]` wherever a
`ProjValMeasure` or `IsSelfAdjoint` occurs.

| Declaration | Instances tried | Values computed | Result |
|---|---|---|---|
| `IsSpectralMeasureOf` | `A = 2` on `ℂ`, `P = δ₂`, `δ₃`; kernel `(s − z)⁻¹`; `H = 0` | `(i−2)⁻¹ = (−2−i)/5` both sides; `(i−3)⁻¹ = (−3−i)/10 ≠`; `Im` of the two sides `−1/5` vs `+∫(1+s²)⁻¹dμ > 0`; `0 = 0` | determines `P` for self-adjoint `A`; inverse kernel excluded; non-self-adjoint `A`: R01 |
| `diag_spectralType_components` | `M_x ⊕ diag(1/2)`, `f = (1,1)`; Cantor; `f = 0`; `fac = fsc = 0` | `μ_f = Leb|[0,1] + δ_{1/2}`, ac part `Leb|[0,1]`, singular `δ_{1/2}`, atoms `{1/2}`; `c`, atom set `∅`, restrict `= 0 = μ_{fpp}`; all `0`; `μ_f` carried by countable `S`, `rnDeriv = 0` a.e., `withDensity = 0` | true; cross terms vanish because the type subspaces are orthogonal and `P(B)`-invariant |
| `acSpectrum` | `M_x` on `L²[0,1]`; `diag(q_n)`; `M_x ⊕ diag(2)`, `t = 2`; `H = 0` | `[0,1]`; `∅` (no nonzero ac vector); `2 ∉` (an ac `f` is `(g, 0)`, mass `0` near `2`); `∅` | real body; the clause `μ_f ≪ Leb` excludes the model "support of `P`" |
| `perfect_acSpectrum_and_mem_iff` | `∅`; `M_x` on `L²[0,1]`, `t = 0, 1, 2`; single-`f` direction | `Perfect ∅`; `f = 1` charges `(−ε, ε)` and `(1−ε, 1+ε)`, nothing near `2`; if no `g_n` charges all `I_{1/m}`, each lives on an annulus, a subsequence has disjoint annuli and `Σ 2^{−k} g_{n_k}/‖g_{n_k}‖` works | true |
| `Icc_subset_acSpectrum_iff` | `M_x` on `L²([0,1] ∪ [2,3])`, `[a,b] = [0,1]`, `[1,2]`; endpoint `a`; fat Cantor `K` | every open `J ⊆ (0,1)` charged by `f = 1`; `J = (1.2, 1.8)` uncharged and `1.5 ∉ σ_ac`; `(a, a+ε)` is an admissible `J`; some `J ⊆ (0,1) ∖ K` uncharged | true in both directions; `a < b` needed (`a = b`: right side vacuous, `{a} ⊄ ∅`) |
| `essentialSpectrum` | `0` on `ℂ`; `0` on `ℓ²`; `diag(1/n)`; rational diagonal | `∅`; `{0}` (kernel infinite-dimensional); `{0}` (not isolated, `ker = ⊥`); `ℝ` | equals UO-C02's formula term by term |
| `minMaxValue` | `diag(1,3,5)`, `n = 0..3`; `H = 0`, `n = 0` | `1, 3, 5, ⊤`; `⊤` (no unit vector) | `μ_{n+1}` with `n` obstacles; `EReal` removes the junk `0` |
| `minMax_principle` | `diag(1,3,5)`, `c = 4`, `c = 3`; `M_x` on `L²[0,1]`; `−1 ⊕ H₀`, `c = −1/2`; `0` on `ℓ²`; `H = 0`; `−diag(n)` without `hγ` | `Σ = ⊤`, count `2 =` finrank `2`; `1 = 1`; `Σ = 0`, all values `0`, count `0 = 0` for `c < 0`; count `1 = 1`; `Σ = 0`, `0 = 0`; `⊤ ≤ ⊤`, `0 = 0`; `encard = ⊤ ≠ 0 = finrank` | true; `hγ` needed |
| `pearson_tendsto` | `J = 0`; `J = 1`, `C = V`; `H₁ = diag`, any `x` with `μ_x ≪ Leb` | limit `0`; reduces to Kato–Rosenblum; `x = 0`, limit `0` | true; convention `U(t) = e^{itH}` from `complexGenerator = i • H` (`A = 2`: derivative `2i`) |
| `katoRosenblum` | `V = 0`; `H₁ = diag(1/n²)`, `V = −diag(1/n²)`; `M_x` + rank one; `V = c·1` (not trace class) | `y = x`; both ac subspaces `0`, `∅ = ∅`; `σ_ac = ℝ` both; excluded: `e^{itc}x` diverges | true |
| `katoRellich_lowerBound_hasCore` | `b = 0`, `V = −a`; `A = λ ≥ γ`, `V = −(a + b|λ|)`; `γ = −10`, `a = 0`, `b = 1/2`, `V = A/2`; `V = 0`, `a = b = 0` | `γ − a = γ − max(a, a)`; `λ − a − b|λ| ≥ γ − a − b|γ|` (`λ ↦ λ − b|λ|` increasing); `A + V ≥ −15 = −10 − max(0, 5)`; bound `γ` | true; sharp in the third instance |
| `complexLaplacian` | `‖x‖²` on `ℝ^d`; `yˢ` on `ℍ`; `e^{inθ}` | `−2d`; `s(1−s)yˢ`; `n²e^{inθ}` | sign `−div grad` |
| `gaffney_isSelfAdjoint_closure` | `ℝ^d`; `dim 0` countable discrete; `M = ∅`; `(0,1)` (not complete) | `H₀`, maximal domain `H²`; `T = 0`, closure `0` on `ℓ²`, `w = 0` works for all `u`; `Lp = 0`; excluded by `CompleteSpace` (`eˣ ∈ ker(T* + 1)`) | true; hypotheses determine `T` (volume has full support) |
| `exists_mem_domain_closure_eq_zero_iff` | `S¹`; `ℝ`; `⊔_ℕ S¹`; `S¹ ⊔ ℝ` | constants both sides; only `0` both sides; `ℓ²` of componentwise constants both sides; `c·1_{S¹}` both sides (an `L²` locally constant function vanishes on `ℝ`) | true both directions |
| `cuspRegion` | `a = 1`; `a ≤ 0` | `{y > 1}`; all of `ℍ` (excluded later by `0 < a`) | real body with a proof of openness |
| `IsStandardCuspEnd` | quotient map of `⟨z+1⟩\ℍ` on `ℍ_1` with `w = 1`, `w = 2`; totally geodesic `ℍ²/ℤ → ℍ³/ℤ` | accepted; rejected (`(0,y) ~ (1,y)`, `1 ∉ 2ℤ`); rejected: `IsLocalRiemannianIsometry` requires `mfderiv` invertible (`Isometry/Local.lean:74`), so `dim M = 2` | the fibre condition and the invertibility exclude the wrong models |
| `Ici_quarter_subset_essentialSpectrum` | parabolic cylinder; Weyl vectors `u_n = y^{1/2+it}ψ((log y − n)/n)` | `σ = [1/4, ∞)`; `‖u_n‖² = wn‖ψ‖²`, residual ratio `≤ (2|t|‖ψ'‖/n + ‖ψ''‖/n²)/‖ψ‖`, supports `log y ∈ [2^{j+1}, 3·2^j]` disjoint | true |
| `schrodinger_isSelfAdjoint_closure` | `V = c`; `V = −1_{[−1,1]}`, `d = 1`; `d = 0` | `σ = [c, ∞)`, bound attained, decay clause not applicable for `c ≠ 0`; `k tan k = κ`, `k ≈ 0.739`, `κ ≈ 0.674`, `E ≈ −0.454 ∈ [−1, 0)`, `σ_ess = [0, ∞)`; `σ_ess = ∅ ≠ [0,∞)`, excluded by `hd` | true; `MemSobolev 2 2` is the multiplier `(1 + ‖ξ‖²)` (`Sobolev.lean:73-74`) |

### Table B: README targets (values recomputed)

| Section | Instances | Values on each side | Result |
|---|---|---|---|
| Conventions | `μ = 2Leb|[0,1]`; `ψ = e^{−πx²}`; `A = 2`, `V = 3` lettering | `Leb.withDensity 2 = μ`, reversed gives `4Leb`; `−ψ'' = (2π − 4π²x²)ψ`, transform `4π²ξ²e^{−πξ²}`; `(3,0)` and `(0,3/2)` | agree |
| 1.1 | `diag(1,2)`, `f = (1,i)`, `g = 3·1_{{2}}`; `A = 0`, `f = h = (1,0)`; `|s/(z−s)| ≤ 1 + |z|/|Im z|` | `μ_{g(A)f} = 9δ₂`; `4δ₀ ≠ 2δ₀`; `s/(z−s) = −1 + z/(z−s)` | agree; transport bullet R01 |
| 1.2, 1.3 | `M_x ⊕ diag(1/2)`; `diag(1,2,3)`, `U = span(e₁,e₃)`; `U = 0` | as Table A; `σ(A|_U) = {1,3}`; `∅` | agree |
| 1.4, 1.5 | `([0,1] ∪ {2})^ess`, `ℚ^ess`, `(0,1)^ess`; `ℓ²(ℝ)` coordinate operator; `M_x ⊕ diag(2)` | `[0,1]`, `∅`, `[0,1]`; no maximal vector (`μ_ψ` has countably many atoms); `2 ∉ σ_ac` | agree |
| 1.6 | Neumann/Dirichlet on `(0,1)`; `diag(1,3,5)` against VariationalMethods 4.4 and Mathlib indices | `(n−1)²π² ≤ n²π²`; `λ₀,λ₁,λ₂` and indices `2,1,0`, junk `0` at index `3` (VariationalMethods README line 786) | agree |
| 1.7–1.9 | `H₂ = H₁ + c`; `x = m·1_{[0,1]}`, `C = ⟨φ,·⟩φ`; `|λ|^{−1/4}1_{[−1,1]}`; `diag((−1)^{n+1}/n²)`; Duhamel sign; `M_x`, `2M_x` | `e^{itc}` diverges; `2πm²` both sides; tail `4/m²`; `π²/6 = π²/6`; `d/du⟪e^{−iuH₂}ψ, Je^{−iuH₁}φ⟫ = i⟪ψ_u, Cφ_u⟫`; `(e^{it} − 1)/(it) → 0`, distance `1` | agree |
| 2.1–2.3 | Gaussians `e^{−πx²/n²}`; `‖A(A−μ)⁻¹‖`; `A = 2`, `V = 1`, `μ = 0` | `‖u'‖² = π/(n√2)`, `‖u‖² = n/√2`, quotient `π/n²`; `sup_{λ≥γ} |λ|/(λ−μ) = max(1, |γ|/d)`; `(3/2)·2 = 3` | agree |
| 3.1–3.5 | circle Green; `e^{−|x|}`; `χ/|x|` on `ℝ³`; step `φ`; `(0,1)` | `2πn² = 2πn²`; `−u + 2δ₀`; `4πδ₀`; slope `4/3 < 2`, thresholds `1/4, 3/4` impossible; `1 ≤ 2/k` false for `k > 2` | agree |
| 3.6 | cutoff estimates (a), (b) | `∫χ²|du|² ≤ ‖Δu‖‖u‖ + ½‖χdu‖² + 2 sup|dχ|²‖u‖²`; `∫χ²|u|² ≤ sup|dχ|²‖u‖²` (README has the weaker `2 sup`) | agree |
| 3.7–3.9 | circle; flat torus; `⊔_ℕ S¹`; `S²`; one-point `X`, `T = (0−i)⁻¹`; `V = 1_{[0,π)}` | `0,1,1,4,4`; `λ₁..λ₄ = 4π²`; `λ₁⁺ = 1 ≠ 0 = λ₁`; `2,2,2`; `T − T* = 2i = 2i·TT*`, `i + i⁻¹ = 0`; Rayleigh `1/2`, `(1−λ)u'(0) = −λu'(0)` | agree |
| 3.10 | area; scaling `(x,y) ↦ (2x,2y)`; `yˢ ∈ L²`; `Δ(y^{1/2}f(log y))` | `w/a`; `(1,1) → (2,2)`, area `1`; iff `Re s < 1/2`; `y^{1/2}(1/4 − ∂_r²)f` | agree |
| 4.1–4.5 | `u = e^{−πx²}`; `1_{[−1,1]}`; spectral density `d = 1`; resolvent change of point at `s = 0, 1`; `cos x + cos √2x`; `Γ(2)`; `Γ₀(2)` | `‖u''‖² = 3π²/√2`, `‖ξ²û‖² = 3/(16π²√2)`, ratio `(4π²)²`; `sin(2πξ)/(πξ)`; `e^{−λ/(2π)}/(2π√λ)`, mass `2^{−1/2}`, equal to QuantumFoundations §8.2's formula at `n = 1`; `i = i`, `(1+i)/2`, slip gives `2 − i`; `−2` not attained (`√2` irrational); area `2π`; fixed point `(1+i)/2` | agree |

## Not verifiable

- `kato76` (uncertified): the lower bound `γ − max(a/(1−b), a + b|γ|)` is cited as "Ch. V §4.1"
  (`README.md:1096`, `Suggested.lean:212`). From memory the semibounded statement is Theorem 4.11
  in Ch. V §4.4 and §4.1 holds only the self-adjointness theorem; I could not open the text, so
  this is not a finding. The same for "Ch. X §4.4" (`README.md:964`), which may be Theorem 4.4 of
  Ch. X §4.3. Whoever holds the book should check both locators.
- `strichartz83` Theorem 2.4, `chernoff73`, `gaffney54`, `grigoryan09` Ch. 3, 4, 11, `rs1` §VII.2,
  `rs2` Ch. IX, §X.1, §X.2, Theorem X.12, `rs3` §XI.3 and Theorems XI.7–XI.8, `pearson78`,
  `chavel84` Ch. I, `iwaniec02` Ch. 4, 7, 11, `lp76` Ch. 1, 8, `cfks87` Ch. 1: uncertified,
  cited by locator; the statements they are cited for are standard and were checked mathematically,
  not against the texts.
- `kps26` Theorem 1.1 (line 47–50): the cached text is OCR of an image scan and garbled in the
  displayed formulas; the hypotheses `d ≥ 2`, `l > d` (line 20–21) and the full-measure set are
  legible and agree with the README.
- ComplexCurveModuli D6 "item 2" (cusp and collar coordinates) and RiemannianGeometry R5c "item 4 of
  its scalar principal-eigenfunction part": the sections exist on main; I did not locate the
  numbered items. Both are cited only in scope and downstream paragraphs.
- The Lean file was not elaborated in this pass; see "Elaborated signatures" above.
- Ownership against open pull requests was checked through `roadmaps grep` over the open heads and
  main; the brief's list gives files for 234 of the 458 open pull requests.

Source independence: 12 passages compared with 8 sources (teschl line 4388–4419 with §1.2, line
5044–5055 with §1.6, line 6277–6281 with the gap sentence, line 7213–7228 with §4.3, line
10600–10620 with §1.7; kato57 line 92–111 with §1.8; bms02 line 151–157 with §3.2; yafaev04 line
116–122 and 191–206 with §1.9; hm23 line 41–43 with §3.7; lp80 line 251–256 with §3.10; kps26 line
26–39 with §4.5; rosenblum57 line 70–72 with §1.9), none shared beyond formulas and hypothesis
lists; largest share teschl, 40 of 97 source-id occurrences in the README body; contents compared
with teschl (Layer 1 draws on its Ch. 3 §3.3, Ch. 4 §4.3–4.4 and Ch. 12 together with kato57 and
yafaev04, Layer 2 on Ch. 6 §6.1, Layer 3 on no chapter of it, Layer 4 on Ch. 7 and Ch. 10; the
layers are not a run of its chapters and their order is forced by the `*Needs:*` lines 3.7 → 1.6,
2.1 and 4.4 → 2.2, 4.3): independent.

## Source issues

- **Misprint** in teschl at Theorem 6.4, (6.3), printed page 135 (line 5709–5711): the source says
  the second entry of the maximum is `b` divided by `a − 1`, which is negative for `a < 1` and so
  never the maximum; it should be `b` divided by `1 − a`; affects a stated result.
- **Error** in teschl at the proof of Theorem 6.4, printed page 135 (line 5718–5720): the source
  says one may take `−λ` below the minimum of `γ` and `b/(a − 1)`; it should be below
  `γ − max(a|γ| + b, b/(1 − a))` (for `A = −10`, `B = A/2` the sum is `−15`, not `≥ −10`); affects
  the proof.
- **Gap** in teschl at Theorem 4.10, printed page 119 (line 5044–5052): the source says the min–max
  formula holds for every self-adjoint operator; it should assume the operator bounded below (for
  `−diag(n)` every min–max value is `−∞` and there is no first eigenvalue); affects a stated
  result.

## For the human reviewers

- **Licence.** `teschl` is read from the author's online edition of an AMS book, `kato57` and `lp80`
  from journal archives (`sources.toml`); their licence classes are recorded there and were not
  re-examined here.
- **Not tested.** Thirteen cited works are uncertified (`rs1`, `rs2`, `rs3`, `kato76`, `grigoryan09`,
  `gaffney54`, `chernoff73`, `strichartz83`, `chavel84`, `iwaniec02`, `lp76`, `cfks87`, `pearson78`):
  wording and locators were not compared with them; two `kato76` locators are doubtful (Not
  verifiable).
- **Scope.** Spectral theory of Schrödinger operators and of the Laplace–Beltrami operator;
  sources are refereed monographs and journal articles (`teschl`, `kato57`, `bms02`, `lp80`). No
  flag.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "35f3419d98b16a0eeba70aa18eb9f01fdec1260a", "job": "RT-SchrodingerOperatorsAndSpectralTypes~1b", "model": "fable", "worker": "chris-x55"} -->
