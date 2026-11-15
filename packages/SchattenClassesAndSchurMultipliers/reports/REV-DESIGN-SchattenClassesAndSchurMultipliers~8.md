<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13838#issuecomment-6897933582 -->
Review (claude) of 8efc59f

Verdict: needs_changes

1. **F01** (P2) the interpolation law of §1.4 lacks a finiteness hypothesis (`0 · ∞`)

   **Location:** `packages/SchattenClassesAndSchurMultipliers/design/README.md` §1.4, lines 625–626:
   "Interpolation: `log ‖T^{(m)}‖_p` and `log ‖T‖_{cb,p}` are convex functions of `1/p` (§1.3 at every
   level)"; `design/plan.json`, target 1.4, api `cbNorm_interpolation`.

   **Claim:** for every linear `T : S₂(H) → S₂(K)` the extended norms are log-convex in `1/p`.

   **Witness:** on `ℓ²(ℕ)` take a linear `T` on `S₂` that vanishes on `S₁` and fixes one
   `w₀ ∈ S_{4/3} ∖ S₁` (algebraic complement). Then `‖T‖₁ = 0`, `‖T‖₂ = ∞`, `‖T‖_{4/3} ≥ 1`, while in
   `ℝ≥0∞` `0^{1/2} · ∞^{1/2} = 0`.

   Severity: a missing hypothesis. The norms are defined with values in `[0, ∞]` (README line 610),
   so the bullet asserts something at `log 0 = −∞` and `log ∞ = +∞`, where `(−∞) + (+∞)` has no value.
   Read as extended-real convexity that asserts nothing at an infinite endpoint it holds, but the
   transcription as `‖T‖_{p_θ} ≤ ‖T‖_{p₀}^{1−θ} ‖T‖_{p₁}^θ` in `ℝ≥0∞`, the form §4.2 uses, is false on
   the witness. §4.2 itself is safe: `‖S_M‖_p = 0` forces `M = 0`.

   **Exact repair:** replace the bullet by: "Interpolation: for `1 ≤ p₀, p₁ ≤ ∞`, `0 < θ < 1` and
   `1/p_θ = (1 − θ)/p₀ + θ/p₁`, if `‖T^{(m)}‖_{p₀}` and `‖T^{(m)}‖_{p₁}` are finite then
   `‖T^{(m)}‖_{p_θ} ≤ ‖T^{(m)}‖_{p₀}^{1−θ} ‖T^{(m)}‖_{p₁}^θ`, and the same for `‖T‖_{cb,p}` (§1.3 at
   every level on finite-rank operators; for `A ∈ S₂` with `‖A‖_{p_θ} ≤ 1`, finite-rank spectral
   truncations `A_k → A` converge in the norm of the larger endpoint exponent, so `T A_k → T A` in
   operator norm, and the gauge is lower semicontinuous, §1.1)." Add the Check: "Finiteness is needed
   in `[0, ∞]` arithmetic: a linear `T` on `S₂(ℓ²(ℕ))` vanishing on `S₁` and fixing some
   `w₀ ∈ S_{4/3} ∖ S₁` has `‖T‖₁ = 0`, `‖T‖₂ = ∞` and `‖T‖_{4/3} ≥ 1`." The plan's api statement takes
   the same wording. Tested on the witness: `‖T‖₂ = ∞`, so the repaired bullet asserts nothing, and
   with both endpoints finite the truncation argument was checked in the three cases `p_θ ≤ 2 ≤ p₁`,
   `2 < p_θ ≤ p₁` and `p_θ ≤ p₁ ≤ 2`.

One finding, R01 (P2): the interpolation law of §1.4 lacks the finiteness hypothesis it needs in
`[0, ∞]` arithmetic, and its inequality form fails on an explicit map. The repair is one bullet,
one Check and one api statement of the plan. The single finding of round 7 is repaired, and nothing
else in the design needs a change. The two declared supplier gaps,
`sigma-finite-hilbert-schmidt-kernels` and `semifinite-martingale-bmo-interpolation`, are precise
contracts and not findings.

Reviewed: `packages/SchattenClassesAndSchurMultipliers/design/README.md` (2,198 lines, read in full
this round), `design/plan.json` (11 layers, 45 targets, 7 suppliers, 2 gaps) and `sources.toml`
(16 entries). There is no `Suggested.lean` at the design stage. Elaboration: not available (this
lane does not elaborate); no Lean process was started. No maintainer notes were left for this
roadmap.

## Previous findings, checked first

Round 7 had one finding, F01; the repair report marks it applied and marks nothing as not
actionable.

| Round 7 finding | Status | Repaired passage and what was recomputed |
|---|---|---|
| F01 (P2), three properties of the `L^∞` expectation attributed to BochnerSpaces §7.4 | Repaired | §2.5 opening (README 827–837): "the linear contraction of `L^∞(Ω, 𝓑, μ)` adjoint to the `L¹` projection `E₁` … which agrees with `MeasureTheory.condExpL2` on `L^∞ ∩ L²`"; four statements proved in §2.5 (839–857): `𝒜`-measurable values, positivity, tower law, agreement with `condExp`; contract (451–460): "Nothing else is assumed of `E[· | 𝒜]`"; Scope (46–51, 99–110); plan target 2.5 is a `theorem` with the three new Mathlib prerequisites, and targets 6.4, 7.2, 7.3 gained `target:2.5`. BochnerSpaces §7.4 at its open head states exactly what the contract now lists (construction as adjoint of the `L¹` projection, agreement on intersections with `L²`, the `L^∞` adjoint formulas; for `E₁`: idempotence, range, positivity, tower law, identification with native conditional expectation). Recomputed below. |

Repaired pattern searched in the rest of the design (a supplier cited for a statement it does not
make): the seven contracts were set beside the suppliers again (table under "Suppliers and
order"). The rank-one formulas `Tr(u ⊗ v*) = ⟨v, u⟩` and `‖u ⊗ v*‖₁ = ‖u‖‖v‖` attributed to
VonNeumannAlgebras V4.Core are stated there (`TauCetiRoadmap/VonNeumannAlgebras/README.md`
line 1394); the `|m| ≤ Cμ` form of BanachSpaceTheory B4.0 is a special case of its hypothesis
`m.variation ≪ μ` with finite variation (line 380–385), and `‖h‖ ≤ C` follows from its variation
formula. No other instance found.

## Verified sound

### Principles and shape

- No route-specific shortcut (arbitrary σ-finite spaces; every `1 ≤ p ≤ ∞` where the sources allow
  it), no re-planned roadmap, no algorithm, no copied passage, no `set_option`, no sorry'd data (no
  Lean file). The extension of NoncommutativeIntegration is requested as a Part II through a
  declared gap; the Sobolev form is left to this roadmap's own Part II.
- Organisation: eleven layers named by their mathematics; no sentence says the roadmap follows a
  source (grep for "follows the source/paper/book": none).
- Shape (script, this round): 45 `### k.n` headings equal to the 45 plan ids in order; 45 Needs
  lines; 11 `### Examples`, 11 `### Dependencies`. No LaTeX delimiter, pull-request number, round
  label, process word or machine path (the six hits of "lemma" are Smith's, Urysohn's and Fatou's
  lemmas and source locators "Lemma 1.4", "Lemma 6.1", "Lemma 1.11"). The README names no Lean
  declaration of its own; `roadmaps resolve` lists no citation and no Lean name found nowhere.
- Both gap slugs appear in the README (lines 81, 89, 397, 430) and in the plan's `gaps` with a named
  supplier and section; each `needs` is one statement with its hypotheses.
- Headlines (Summary): the multiplier algebra with duality and interpolation (§3.2, §4.1, §4.2),
  the Schur product theorem (§6.1), Grothendieck–Haagerup (§6.3, §6.4), the atomless and
  continuous-symbol theorems (§7.3, §8.2), Fourier–Schur transference (§9.5) and the
  Hörmander–Mikhlin–Schur theorem (§11.5). Each is a target with hypotheses and a locator and has a
  row below. There is no `Suggested.lean` to probe for padding or absent headlines at this stage.

### Adversarial table

The fifteen sampled targets, the headline theorems, the passages the round 8 repair changed and the
target R01 touches. Every value was computed this round.

| Statement | Instances | Values computed on each side | Result / change |
|---|---|---|---|
| §1.4 definition, duality (sampled) | transpose on `M_n`; block trace; non-continuous `T` | flip `Σ E_{ji} ⊗ E_{ij}` (norm `1`) goes to `Σ E_{ij} ⊗ E_{ij} = n ·` rank-one projection, so `n`; `Tr(T^{(m)}(A)B) = Σ_{ij} Tr(T(A_{ij})B_{ji}) = Σ Tr(A_{ij} T^♯(B_{ji}))`; `Tr(AᵀB) = Tr(ABᵀ)` so `t^♯ = t` and `‖t‖_{cb,1} = n` | sound |
| §1.4 interpolation | `T = 0` on `S₁`, `T w₀ = w₀`, `w₀ ∈ S_{4/3} ∖ S₁` | `‖T‖₁ = 0`, `‖T‖₂ = ∞` (zero on a dense subspace, not zero), `‖T‖_{4/3} ≥ 1`; `0^{1/2}∞^{1/2} = 0` in `ℝ≥0∞` | R01 |
| §1.4 stabilisation | `‖T‖₂ = ∞`, blocks `B_k`; finite `F` | `Σ ‖B_k‖₂² ≤ Σ 4^{−k} < ∞`, `Σ ‖T B_k‖₂² = ∞`; `Tr((T ⊗ id)(A) P_F B P_F) = Tr((T ⊗ id)(P_F A P_F) B)` | sound |
| §2.2 trace formula (sampled) | `A = iE₁₂`, `C = E₂₁`; two one-point spaces | `k_{A*} = −i·1_{(2,1)}`, `⟨k_{A*}, k_C⟩ = conj(−i) = i = Tr(AC)`; unconjugated gives `−i`; `1 = 1` | sound |
| §2.3 transposition (sampled) | bilinear adjoint; `iE₁₂`; `f = i` | `∫ (JA*Jf) g = ⟨A*Jf, g⟩ = ⟨Jf, Ag⟩ = ∫ f (Ag)`; `(iE₁₂)^T = iE₂₁`, adjoint `−iE₂₁`; `J D_{f̄} J = D_f`, so `D_i^T = i`, `D_i* = −i` | sound |
| §2.5 `𝒜`-measurable values (changed) | `g ∈ L¹`, `A ∈ 𝒜`; masses `(1, 3)`, projection `g ↦ g(1)·1` | `∫ 1_A E[φ] g = ∫ φ E₁(1_A g) = ∫ φ 1_A E₁(g) = ∫ E[1_A φ] g`; `∫ φ P(g) dμ = g(1)(φ(1) + 3φ(2))`, so `P*(1) = (4, 0)`, while `E[1] = 1` | sound |
| §2.5 positivity (changed) | masses `(1, 3)`; `B ⊆ {Im E[φ] > 0}` | `(a + 3b)/4 ≥ 0`; `Im ∫_B E[φ] > 0` against `∫ φ E₁(1_B) ≥ 0` | sound |
| §2.5 tower law (changed) | `{1,…,4}`, `φ = 1_{{1}}`; masses `(1, 3, 1, 1)`; non-nested | `(1/2, 1/2, 0, 0)`, mean `1/4`; `(1/4, 1/4, 0, 0)`, outer mean `(1/4 + 3/4)/6 = 1/6 = E[φ | 𝒜']`; `(1/2, 0, 1/2, 0) ≠ 1/4` | sound |
| §2.5 agreement with `condExp` (changed) | `φ ∈ L^∞ ∩ L¹`; counting `ℕ`, `φ = 1` | `∫ |φ|² ≤ ‖φ‖_∞ ∫ |φ|`; pinned lemma needs `Integrable`, `MemLp 2`, `SigmaFinite (μ.trim hm)`, all present; `E[1] = 1`, `condExp = 0`, hypothesis fails | sound |
| §2.5 module property, density | `g`, `k` `𝒜`-measurable in `L²`; `ρ = (3, 1)` on masses `(1, 3)` | `⟨g, φk⟩ = ∫ φ (conj g · k) = ∫ E[φ] conj g · k`; masses `(3, 3)` give `(a + b)/2`, `1/2` against `1/4` at `(1, 0)` | sound |
| §3.2 headline | `M = 1_{(1,2)}` | `S_M(E₁₂) = E₁₂`, `⟨k_A, M k_B⟩ = ⟨M̄ k_A, k_B⟩`, `S_{M̃}(E₁₂) = 0`, `S_M(E₁₂)* = E₂₁ = S_{M̃}(E₂₁)` | sound |
| §3.3 norms and extension (sampled) | `A ∈ S₂ ∩ S_p`, truncations `A_k`; `M_k → M` bounded | `S_M A_k → S_M A` in `S₂`, gauge lower semicontinuous, so the finite-rank supremum is the norm; `Tr(S_{M_k}(A)B) = ∫∫ M_k k_A(x, y) k_B(y, x)` with integrable `k_A k_B^t`, dominated | sound |
| §3.4 (used by §4.2, §6.3) | truncation at the unitary `[[√2, 1], [−1, √2]]/√3` | `B*B = [[2, √2], [√2, 3]]/3`: trace `5/3`, determinant `4/9`, eigenvalues `4/3`, `1/3`; norm `2/√3` | sound |
| §4.1 trace duality (sampled, headline) | `M = 1_{(1,2)}` | `Tr(S_M(A)B) = A₁₂B₂₁ = Tr(A S_{M^t}B)`; `Tr(A S_M B) = A₂₁B₁₂`; both sides `∫∫ M k_A(x, y) k_B(y, x)` | sound |
| §4.2 interpolation (sampled, headline) | truncation at `p = 4`; `[[1, 2], [2, 1]]`; a norm `0` | `(2/√3)^{1/2} = 1.0746 ∈ [1, 1.1547]`; all `2`; `‖S_M‖_p = 0` kills `S_M` on finite rank, so `M = 0` and no `0 · ∞` | sound |
| §5.1 contractivity (sampled) | `{1, 2}`, trivial `𝒜`; counting `ℕ`, `φ = 1` | averages `6/4 = 3/2 ≤ 2`, `3/4 ≤ 1.1547`, `1/4 ≤ 1`; `1 = 1`, with `condExp` it would read `1 = 0` | sound |
| §6.1 headline | `[[2, 1], [1, 1]]`; `[[1, 2], [2, 1]]`; empty `ι` | determinant `1`, `S_M(E₁₁) = 2E₁₁`; eigenvalues `3`, `−1`, diagonal maximum `1 ≠ 2`; `0` | sound |
| §6.3 finite Grothendieck–Haagerup (sampled) | `α = (1, i)/√2`, `β = (1, 1)/√2`, `a = I`, `M = diag(1, i)`; `[[1, 2], [2, 1]]` | `Σ ψM = 1/2 + i·i/2 = 0 = ⟨ᾱ, S_M(a)β⟩`, `⟨α, ·⟩ = 1/2 + conj(i)·i/2 = 1`; `⟨ξ_j, η_k⟩ = 3/2 − v_j v_k/2`, `‖ξ_j‖² = 2` | sound |
| §6.4 σ-finite Grothendieck–Haagerup (sampled, headline) | kernel identity; `cos(x − y)`; principal `𝒰` | `⟨ξ(x), ∫ k_A(x, y) f(y) η(y) dy⟩ = ∫ ⟨ξ(x), η(y)⟩ k_A f`; `(e^{−ix}e^{iy} + e^{ix}e^{−iy})/2`; pairs with `M_k`, not `M`; `|m|(s) ≤ ‖a‖ μ(s)` gives the B4.0 hypothesis | sound |
| §7.1 atomless measures (sampled) | atom `E` of σ-finite `ν ~ μ`; `A = [0, 2]`, `t = 1/2`; `μ ⊗ 0` | some `E ∩ S_n` carries `ν(E)`, so `ν(E) < ∞`; `ν(E ∖ B) = 0 ⇒ μ(E ∖ B) = 0`; `(1/4)·2 = 1/2`, ratio `t` gives `1`; zero measure, atomless | sound |
| §7.3 atomless theorem (sampled, headline) | chain for finite `𝒜`, `n` pieces; null minimal set | level-`n` norm on `L²(𝒜)` = norm on `L²(𝓑')` with masses `μ(A)/n` `≤` (§7.2) `‖E[M | 𝓑'²]‖` `≤` (§5.1) `‖M‖`; a null piece contributes `0` to `L²` | sound |
| §8.1 finitely supported approximation (sampled) | `f ∈ C_c(X)`, partition of oscillation `< ε` | `|Σ μ(V_i) f(x_i) − ∫ f dμ| ≤ ε μ(K)`; product pieces `V_i × V_j` for `F`; total mass `μ(K_α) ≤ μ(X)` | sound |
| §8.2 continuous symbols (sampled, headline) | `δ₀ + δ₁`; `M = x`; `C = 0`; `X × ℕ` | `2`; second condition only with `C = ∞`; `M = 0` a.e. and continuous, so `0` on the support; a finite subset of `supp μ × ℕ` is a submatrix of an amplification | sound |
| §9.5 headline | `g ↦ 𝓕(m 𝓕⁻¹ g)`; kernel; `m = e_a` | `R 𝓕⁻¹(m 𝓕 R g) = R T_m R g`; `1_F(s) m(s − t) ǧ(s − t) 1_F(t)`; `T_m f = f(· + a)`, `R T_m R f = f(· − a)` | sound |
| §9.3–§9.4 (inputs of §9.5) | `p = 1`; Gaussians; pairing | `u*u = v*v = |g|`, `‖P_F T_u‖₂² = |F| ‖u‖₂²`; `R^{−n}(R^{−2} + T^{−2})^{−n/2} = (1 + R²/T²)^{−n/2}`; `∫ ǧ(u) ĥ(u) du = ∫ g h` | sound |
| §10.1 column and row BMO (sampled) | `N = 4` columns; `e^{2πiz} e`; dyadic comparison | `1 − Σ a_k² ≤ 3/4`, `0.866`; `diag(a) − aaᵀ` at `a = (1/2, 1/2)`: `1/2`, `0.707`; `(1 − |⨍_Q e^{2πiz}|²) e`; `⨍_Q |f − f_{Q̂}|² ≤ 2ⁿ ⨍_{Q̂}` | sound |
| §10.4 interpolation with matrix BMO (sampled) | operator form; `p = 2`; `n = 0` | `Re z = 0`: `C_∞^{−1} C_∞ ‖U|A|^{pit/2}‖ ≤ 1`; `Re z = 1`: `C₂^{−1} C₂ ‖|A|^{p/2}‖₂ = 1`; `Ψ(2/p) = C_∞^{2/p−1} C₂^{−2/p} TA`; `e^{−R/2} ≤ 4C e^{−R}` fails | sound |
| §10.3 thresholds (input of §10.4) | `n = 2`, `k = 0` | `√n 8^{−k} ≤ 2^{−k}` iff `4^k ≥ √n`; `2^{−k} − 2√n 8^{−k} ≥ 2^{−k}/2` iff `4^k ≥ 4√n`; `0.9√2 = 1.27 ≥ 1` | sound |
| §11.5 headline | `M = 1`; `p ↦ p'`; `ξ/√(1 + ξ²)`; planar example | `1 ≤ C_n · 4 · 2`; `p²/(p − 1) = pp'`; `2 · (1/√2)(3/2)^{−3/2} = 0.770`; `R²|sin(R/D) + R cos(R/D)|/D² = 5.70` at `R = 10` | sound |
| Contract BochnerSpaces §7.4 | masses `(1, 3)`, `g = (g₁, g₂)` | `∫ E[φ] g = ((a + 3b)/4)(g₁ + 3g₂) = ∫ φ E₁(g)` with `E₁(g) = (g₁ + 3g₂)/4` | sound |

### Sources

The author flags no locator as unverified. All fifteen sampled targets were checked at their
locators in the cached texts.

| Target | Passages read | Result |
|---|---|---|
| 1.4 | lafforgue-delasalle-2011 lines 183–190; cgpt-2023 lines 216–219 | amplification over every Hilbert space, equation (2), `n`-norm |
| 2.2 | lafforgue-delasalle-2011 lines 239–243 | Remark 1.2, formula (4), bilinear |
| 2.3 | lafforgue-delasalle-2011 lines 226–230, 244–245; pisier-grothendieck-2012 line 2086 | bilinear duality; Remark 1.3; Remark 13.4 (transpose has cb-norm `n`) |
| 3.3 | lafforgue-delasalle-2011 lines 233–238, 397–413, 432–439; cgpt-2023 lines 226–229 | as cited; estimate (9) at line 400 |
| 4.1 | lafforgue-delasalle-2011 lines 239–245 | Remarks 1.2 and 1.3 |
| 4.2 | lafforgue-delasalle-2011 lines 246–252 | Remark 1.4; exponents exchanged at line 249, as the README records |
| 5.1 | lafforgue-delasalle-2011 lines 356–381, 404–413 | (6), Lemma 1.10 at line 363, the pairing identity |
| 6.3 | pisier-grothendieck-2012 lines 656–665, 781–802, 2086–2089, 3439, 3541–3545 | (3.9), (3.10), Proposition 3.3 with its proof, Remark 13.4, Lemma 23.1, Remark 23.4 |
| 6.4 | lafforgue-delasalle-2011 lines 274–278, 286–337; cgpt-2023 lines 89–94 | Theorem 1.7 for the norms, (5) for the completely bounded norms |
| 7.1 | lafforgue-delasalle-2011 lines 487–488 | atoms defined without positivity, as the README remarks |
| 7.3 | lafforgue-delasalle-2011 lines 281–285, 505–520; cgpt-2023 line 231 | Theorem 1.18 and its proof; Conjecture 1.8 |
| 8.1 | lafforgue-delasalle-2011 lines 555–559 | vague approximation by finitely supported measures in the support |
| 8.2 | lafforgue-delasalle-2011 lines 524–588; cgpt-2023 lines 232–237; caspers-delasalle-2015 lines 282–289 | Theorem 1.19 with `C > 0` and "less than"; the README's `C ≥ 0` and `≤` version holds (row above) |
| 10.1 | cgpt-2023 lines 246–263, 683; mei-2007 lines 96–110 | Mei's column and row seminorms; infimum over constants |
| 10.4 | cgpt-2023 lines 313–347, 471–539; mei-2007 line 3218 | Theorem 1.1, Lemma 1.2 ii), Lemma 1.4, inequality (1.1) and its proof |

Also read: cgpt-2023 lines 59–79 and 149–154 ((FS), (HMS), Theorem A), 348–379 (§10.3),
lafforgue-delasalle-2011 lines 254–268, 339–349, 383–439, 489–501. All 16 cited works have a
manifest key (7 certified with cached text, 9 uncertified); no entry was added or changed and no
text was requested.

### Suppliers and order

Dependency check output:

```
candidate: SchattenClassesAndSchurMultipliers is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2237 edges, 0 problem(s)
```

No UPWARD or CYCLE line. BochnerSpaces is in neither the merge order nor main, so the check does
not see that edge; it is an open pull request of another author that adds a new roadmap folder, an
allowed supplier, and the pull request ported from this design names it in its merge-order
paragraph.

| Supplier | Where | Resolved this round |
|---|---|---|
| OperatorTheory/OperatorIdeals (main) | `TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md` | OI-A12, A23, A25, A27–A30, A38, A40, B29, B32, B35, B41, B76, B80 (line 473, the `p = ∞` family), B88, C01, C13, C14 all present |
| VonNeumannAlgebras (main; an open revision also read) | `TauCetiRoadmap/VonNeumannAlgebras/README.md` 1006–1010, 1299–1310, 1394, 4692, 5183–5186 | V2.RectangularL2 (arbitrary measures, equal to `μ.prod ν` for σ-finite ones), V4.Core (trace, cyclicity, `B(H) = S₁*`, `S₂(H, K) ≅ K ⊗̄ conj(H)`, rank-one formulas), §13.2 (V13b) Hilbert-space ultraproduct with quotient inner product, completeness, coordinate norm; the open revision keeps all three |
| NoncommutativeIntegration (main) | `TauCetiRoadmap/NoncommutativeIntegration/README.md` 286, 321, 360, 453, 498, 566, 594, 841, 878, 1243, 1423–1426 | §1.3–§1.5, §2.1, §2.3, §2.5, §2.6, §4.3, §4.4, §7.3; §8.4 is finite-tracial, so the gap is not already provided; line 74 puts the classification of Schur multipliers outside that roadmap |
| CStarAlgebras (main) | `TauCetiRoadmap/CStarAlgebras/README.md` 435, 918 | C1.6, C3.2 |
| BanachSpaceTheory (main; an open revision also read) | `TauCetiRoadmap/BanachSpaceTheory/README.md` 359, 380–385 | B4.0: reflexive real `Y`, finite `μ`, `m.variation ≪ μ`, Bochner density with the variation formula; kept at the open revision |
| AutomorphicSpectralTheory (open, new roadmap) | its README at the open head, 100, 240–249, 261–263, 275 | §0.8 on σ-finite standard Borel spaces with `kernel_apply`, `kernel_unique`, `kernel_norm`; §0.9 consumes the trace of V4 ("no second trace"); §0.10 |
| BochnerSpaces (open, new roadmap, another author) | its README at the open head, §7.4 and §7.5 | as in the table of previous findings; §7.5: for measurable `A` and `0 ≤ t ≤ 1` a measurable subset of measure `t μ(A)` |

Gaps. `sigma-finite-hilbert-schmidt-kernels`: precise, minimal (V2.RectangularL2 and V4.Core give
the unitaries but not the integral formula `kernel_apply`; the trace formula is derived in §2.2,
not requested), same slug in the README and the plan, supplier AutomorphicSpectralTheory §0.8.
`semifinite-martingale-bmo-interpolation`: precise, same slug in both files, supplier
NoncommutativeIntegration Part II; the mean-zero and `E_{−1} = 0` conventions agree with
cgpt-2023 lines 465–470. Neither is a finding.

Overlaps: the overlap file lists no conflicting head, no dropped id, no id that only an open
revision defines and no second copy; the two open revisions of suppliers were opened and keep the
cited ids. Ownership by object (`roadmaps grep`, main and open heads): "Schur multiplier"
elsewhere is the group-cohomological one, apart from the exclusion in NoncommutativeIntegration;
"completely bounded" is CStarAlgebras C3.2 (cited) and uses of it; `BMO_C` is
NoncommutativeIntegration §8.4, the supplier of the gap, and no roadmap states operator-valued or
matrix BMO on `ℝⁿ`; "Schur product" has no analytic owner; the Haagerup tensor product and the
factorisation `‖V‖‖W‖ = ‖u‖_cb` are CStarAlgebras and are not restated here; "Mihlin" in PDE and
PseudodifferentialOperators is the scalar Fourier theorem, which this roadmap takes from Tau Ceti;
"Fourier multiplier" in FactorRigidity is on group von Neumann algebras, outside this scope; the
only other Hilbert–Schmidt kernel is AutomorphicSpectralTheory §0.8.

Overlap check: read BochnerSpaces, AmenableTracesOnCStarAlgebras, BanachSpaceTheory, VonNeumannAlgebras, NoncommutativeIntegration, NoncommutativeGeometry, OperatorTheory/OperatorIdeals (YangMillsConnectionsAndCaloricGauge searched by object only); shared with BochnerSpaces: the `L^∞` conditional expectation under a σ-finite trim and the divisibility of atomless finite measures, owner BochnerSpaces §7.4 and §7.5, cited; the operator trace, owner VonNeumannAlgebras V4.Core, cited; the Schatten families, owner OperatorTheory/OperatorIdeals, cited; nothing else shared.

### Pinned libraries

Opened at the pins this round (declaration, file and line):
`MeasureTheory.condExp_indicator` (`Mathlib/MeasureTheory/Function/ConditionalExpectation/Indicator.lean` 73),
`MeasureTheory.MemLp.condExpL2_ae_eq_condExp'` (`…/ConditionalExpectation/Basic.lean` 388, with
`[SigmaFinite (μ.trim hm)]`), `MeasureTheory.lpMeas` (`…/AEMeasurable.lean` 88),
`MeasureTheory.condExpL2` (`…/CondexpL2.lean` 68), `MeasureTheory.condExp_of_not_integrable`
(`…/Basic.lean` 171), `ContinuousLinearMap.comp_condExp_comm` (`…/Basic.lean` 357),
`MeasureTheory.exists_pos_lintegral_lt_of_sigmaFinite` (`Mathlib/MeasureTheory/Integral/Lebesgue/Countable.lean` 227),
`MeasureTheory.lintegral_trim`, `LinearMap.IsSymmetric.eigenvectorBasis`
(`Mathlib/Analysis/InnerProductSpace/Spectrum.lean` 297),
`MeasureTheory.Integrable.tendsto_ae_condExp` (`Mathlib/Probability/Martingale/Convergence.lean`
361: real-valued, `IsFiniteMeasure`, `Filtration ℕ`, `StronglyMeasurable[⨆ n, ℱ n] g`),
`compactOperator`, `Matrix.hadamard`, `Matrix.PosSemidef.kronecker` and `Matrix.PosSemidef.hadamard`
(`Mathlib/Analysis/Matrix/Order.lean` 188, 214), `Matrix.toEuclideanCLM`, `Matrix.kroneckerMap`,
`MeasureTheory.Lp.fourierTransformₗᵢ` (`Mathlib/Analysis/Fourier/LpSpace.lean` 51),
`MeasurableSet.exists_isCompact_lt_add` and `IsCompact.exists_isOpen_lt_add`
(`Mathlib/MeasureTheory/Measure/Regular.lean` 821, 930; the latter with locally finite, R₁, Borel,
as the contract says), `exists_continuousMap_one_of_isCompact_subset_isOpen` and
`exists_continuous_zero_one_of_isClosed` (`Mathlib/Topology/UrysohnsLemma.lean` 529, 322),
`MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le`
(`Mathlib/MeasureTheory/Function/ContinuousMapDense.lean` 142; `NormalSpace` comes from the file's
`variable` line 67, as the contract says), `MeasureTheory.integral_prod`
(`Mathlib/MeasureTheory/Integral/Prod.lean` 443), `geometric_hahn_banach_point_closed`,
`ContDiffBump.ae_convolution_tendsto_right_of_locallyIntegrable`,
`ContinuousMap.starSubalgebra_topologicalClosure_eq_top_of_separatesPoints`,
`NormalSpace.of_compactSpace_r1Space`, `Prod.opensMeasurableSpace`
(`…/BorelSpace/Basic.lean` 406, `SecondCountableTopologyEither`), `MeasureTheory.Measure.support`,
`PiLp.innerProductSpace`, `CompletelyPositiveMap`, `CStarMatrix`, `UnitAddTorus`,
`MeasureTheory.NullSingletonClass` with the alias `NoAtoms`, the two Gaussian lemmas. Tau Ceti:
the six Schatten-family names (`TauCeti/Analysis/OperatorIdeal/Family/Schatten.lean` 64–109),
`schatten_one` (`…/TraceClass.lean` 90), `schatten_two` (`…/HilbertSchmidt.lean` 112),
`ContinuousLinearMap.singularValue`, `TauCeti.UnitarilyInvariantSeminorm.schatten` (`p : ℝ≥0∞`,
`Fact (1 ≤ p)`), the five `fourierMultiplierCLM` names (`TauCeti/Analysis/Fourier/L2Multiplier.lean`
88–299; the definition is `𝓕⁻¹ ∘ (m ·) ∘ 𝓕`, matching the convention witness), the
Mihlin–Hörmander theorem, the two Littlewood–Paley names, `MeasureTheory.Measure.IsAtom`
(`TauCeti/MeasureTheory/Measure/Atom.lean` 59: measurable, positive, subsets null or full) and
`MeasureTheory.Measure.exists_subset_measure_eq_of_nullSingleton` (standard Borel, null
singletons). None is missing. Neither library has a completely bounded map on Schatten classes, a
Schur multiplier or a named atomless predicate (grep by object).

Remarks for the package stage, no change to the design: `TauCeti.OperatorIdealFamily.schatten`
takes the proof `1 ≤ p` as an argument; §9.2's `F_k` needs a named inner-product carrier, since
Mathlib gives matrices no global inner product instance.

### Copyright and arrangement

Wording: the README was set beside the source at each locator of the sources table and at
lafforgue-delasalle-2011 lines 174–190 (§1.1, §1.4), 254–268 (§3.6), 366–381 (§5.1), 493–501
(§7.2), 535–588 (§8.2), cgpt-2023 lines 264–285 (§10.2), 485–539 (§10.4) and
pisier-grothendieck-2012 lines 795–802 (§6.3). No sentence is reproduced or followed clause by
clause; the longest shared run is three words ("the triangle inequality", §7.2 against line 500).
No table, figure or list of examples is taken over.

Arrangement: lafforgue-delasalle-2011 has 41 of the 100 source citations of the layers. Its §1 has
the subsections 1.1–1.5 (lines 180, 212, 338, 352, 521). Pairs by number: `§1.4 of Layer 1 ↔ §1.1`,
`Layer 3 ↔ §1.2`, `Layers 5 and 7 ↔ §1.4`, `Layer 8 ↔ §1.5`; Layers 2, 4, 6, 9, 10 and 11 have no
counterpart section, the source's §1.3 is split between §2.4 and §3.7, and its Theorem 1.7 (inside
its §1.2) is Layer 6, after the conditional-expectation layer its proof needs. The order
3 → 5 → 7 and 5 → 8 is forced by the Dependencies lines of Layers 5, 7 and 8. Not a one-to-one map.

Source independence: 23 passages compared with 5 sources, none shared; largest share lafforgue-delasalle-2011, 41 of 100 locators; contents compared with lafforgue-delasalle-2011: independent.

## Not verifiable

- The nine works recorded as uncertified (reed-simon-1-1980, simon-trace-ideals-2005,
  gohberg-krein-1969, paulsen-2002, pisier-similarity-2001, horn-johnson-topics-1991,
  grafakos-classical-2014, musat-2003, jrwz-2020): not available legally to this run; cited by
  locator only.
- The estimates inside the proofs of cgpt-2023 behind §10.3 (lines 380–454) and §11.3–§11.4 (lines
  628–1041): statements, hypotheses, thresholds and conventions were checked; the comparison of
  small and large cubes and the far-part estimate were not re-derived.
- Agreement of the preprint numbering with the published versions was not compared; the manifest
  names the versions read.
- Elaboration, the one-tactic probe and the `#check` audit: not available (this lane does not
  elaborate, and the design has no Lean file).

## Source issues

Those read this round.

- **Misprint** in lafforgue-delasalle-2011 at Remark 1.4, printed p. 6 (line 249): the source says `S_q` is the interpolation space between `S_p` and `S_{p'}` for `2 ≤ p ≤ q`; it should be `S_p` between `S_q` and `S_{q'}`, with `1/p = θ/q' + (1 − θ)/q`; affects nothing.
- **Error** in lafforgue-delasalle-2011 at Remark 1.6, printed p. 7 (lines 262–266): the source says the completely bounded norm is unchanged for every auxiliary σ-finite space; it should require a nonzero auxiliary measure, the zero measure giving norm zero; affects a stated result.
- **Misprint** in lafforgue-delasalle-2011 at the proof of Theorem 1.7, printed p. 8 (line 317): the source says the double integral defining the pairing is taken against one measure only; it should integrate in both variables, as at line 291; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at the proof of Lemma 1.9, printed p. 8 (line 348): the source says the conjugation embeds into the Schatten class of the `ν`-space; it should be the Schatten class of the `μ`-space; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at §1.4, printed p. 9 (line 359): the source says the product conditional expectation maps into `L^∞` of the larger σ-algebra `𝓑 ⊗ 𝓑`; it should be `L^∞` of `𝒜 ⊗ 𝒜`; affects nothing.
- **Error** in cgpt-2023 at §1.2, printed pp. 7–8 (lines 375–378): the source says `π_k ∘ J_k(A)` has mean zero for every `k`; it should require `4^k ≥ √n`, since for `n ≥ 2` and small `k` one grid cell contains points at distance `≥ 2^{−k}`; affects the proof.
- **Gap** in cgpt-2023 at the proof of Theorem 1.1, printed p. 10 (lines 506–508): the source says `‖A‖_p` is the limit of `‖J_k(A)‖_p`; it should claim only `‖A‖_p ≤ liminf_k ‖J_k(A)‖_p`, which follows from `S₂` convergence and is all the proof uses; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8efc59fe658fe6c66a2a09e87711d12ed13bb25c", "job": "REV-DESIGN-SchattenClassesAndSchurMultipliers~8", "model": "fable", "worker": "chris-x81"} -->
