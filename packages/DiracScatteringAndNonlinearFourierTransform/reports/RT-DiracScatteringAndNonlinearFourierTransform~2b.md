<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18040#issuecomment-6908783390 -->
Red team round 2 pass b (claude) of 47f1421

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) Four statements are narrowed below the sources they cite

   Location: `packages/DiracScatteringAndNonlinearFourierTransform/README.md:516-517`, "Layer 2 is the function
   theory of the upper half-plane at the generality the later layers use"; and the statements at 887–890, 991–996
   and 1016, 1935–1937 and 1955.

   Claim: the cited results are stated at the generality of their sources.

   Witness, four instances (source lines read):

   1. §2.3 weak type (887–888) is for a density `h ∈ L¹(Π)`; its locator mauth2022 Lemma 5 and Corollary 1
      (line 421–427) is for the Poisson extension of a Poisson-finite measure. `ν = δ₀` is outside the README's
      statement: `M_1 P[δ₀](x) = (1 + √2)/(2π|x|) ≈ 0.384/|x|` for small `|x|` (supremum of `y/(π((x − y)² + y²))`
      at `y = |x|/√2`), weak `L¹` near `0` and not integrable.
   2. §2.3 strong type (889–890) is for `L²`; its locator mauth2022 Lemma 6 (line 430–432) is for `1 < p < ∞`,
      and the pinned `TauCeti.lintegral_rpow_maximalFunction_le`, which the README itself describes as "strong
      type `(p,p)` for `1 < p`" (403–404), gives every such `p`.
   3. §2.6 (991–996, 1016) defines only `H²(ℂ₊)`; mauth2022 line 337–358 defines `H^p(ℂ₊)`, `1 < p < ∞`, and
      Lemmas 1, 2, 6 (line 359–377, 430–432) are for that range, as the README notes at 996. `F = (z + i)^{−1/2}`
      lies in `H³(ℂ₊)` (`∫ (1 + x²)^{−3/4} dx = √π Γ(1/4)/Γ(3/4) ≈ 5.244`) and not in `H²(ℂ₊)`
      (`∫ (1 + x²)^{−1/2} dx = ∞`).
   4. §7.1 (1929, 1935–1937) gives the representation `|θ′(x)| = c + Σ 2 Im ζₙ/|x − ζₙ|²` only for `θ_E` with `E`
      of order at most one, and §7.2 (1955) assumes "`θ` meromorphic inner with the representation of §7.1";
      poltoratski2024 states the representation for every meromorphic inner function (line 312–321) and Lemma 1
      for every one (line 332–346). The Blaschke product with zeros `ζₙ = √n + i/n` is meromorphic inner
      (`Σ Im ζₙ/(1 + |ζₙ|²) ≤ Σ n^{−2}`), and an entire `E` with `θ = E#/E` has `Σ |ζₙ|^{−2} ≥ Σ 1/(n + 1) = ∞`, so
      by AnalyticNumberTheoryPartI §0.23 it is not of order at most one: §7.1 supplies nothing for this `θ`.

   Repair (the present statements stay as the special cases; no Lean declaration changes):

   1. Line 516–517: replace the sentence by "Layer 2 is the function theory of the upper half-plane."
   2. §2.3, weak-type bullet: "Weak type: for a Poisson-finite `ν` and `R > 0`,
      `|{x ∈ [−R, R] : M_1 P[ν](x) > λ}| ≤ C_R (∫ dν/(1 + x²))/λ` for `λ > 0`, so `√(M_1 P[ν])` is integrable on
      every bounded interval (mauth2022 Lemma 5 and Corollary 1, line 421–427); `ν = |h| dx` is the case of a
      density. Route: for `0 < ε ≤ 1`, `h_ε = P[ν](· + iε)` satisfies `P[h_ε](z) = P[ν](z + iε)` (§2.2 applied to
      the nonnegative harmonic function `z ↦ P[ν](z + iε)`, whose measure is `h_ε dx` and whose `c` is `0`) and
      `∫ h_ε dΠ = πP[ν](i + iε) ≤ 2∫ dν/(1 + x²)`; the cones are open, so `{M_1 P[ν] > λ}` lies in the lower limit
      of the sets `{M_1 P[h_{1/n}] > λ}`, and the density case applies to each." Add §2.2 to §2.3's `*Needs:*`
      (§2.2 precedes §2.3 and needs only §2.1, so no cycle); add the Check
      "`ν = δ₀`: `M_1 P[δ₀](x) ≈ 0.384/|x|` near `0`, weak `L¹` and not integrable, while its square root is".
      Tested on `δ₀`: `∫ dν/(1 + x²) = 1` and `|{|x| ≤ R : 0.384/|x| > λ}| = 0.768/λ` for large `λ`.
   3. §2.3, strong-type bullet: "Strong type: for `1 < p < ∞`, `‖M_∞ P[g]‖_{L^p} ≤ C_p‖g‖_{L^p}` for `g ∈ L^p(ℝ)`
      (mauth2022 Lemma 6 line 430), with `C_p` three times the constant of
      `TauCeti.lintegral_rpow_maximalFunction_le`."
   4. §2.6: define `H^p(ℂ₊)` for `1 < p < ∞` by `‖F‖^p = sup_{y>0} ∫ |F(x + iy)|^p dx < ∞` and state the first
      bullet for it: "`F(· + iy) → F*` in `L^p(ℝ)`, `‖F*‖_{L^p} = ‖F‖`, `y ↦ ‖F(· + iy)‖_{L^p}` is nonincreasing,
      `F → F*` nontangentially almost everywhere, `F = P[F*]`, `|F(z)|^p ≤ 2‖F‖^p/(π Im z)` (mauth2022 Lemmas 1–2
      line 359–377) and `‖M_∞ F‖_{L^p} ≤ C_p‖F‖` (Lemma 6)". Keep the Paley–Wiener, Cauchy-formula (constant
      `1/(4π Im z)`), product, logarithmic-bound and weak-convergence bullets for `p = 2`. Add the Check
      "`(z + i)^{−1/2} ∈ H³(ℂ₊) ∖ H²(ℂ₊)`, with `|F(i)|³ = 2^{−3/2} ≈ 0.354 ≤ 2 · 5.244/π ≈ 3.34`". Tested at
      `p = 2`, `F = 1/(z + i)`, `z = i`: `1/4 ≤ 2π/π`.
   5. §7.1: add the bullet "Every meromorphic inner `θ` is `α e^{icz} B(z)` with `|α| = 1`, `c ≥ 0` and `B` the
      Blaschke product of its zeros `(ζₙ)` in `ℂ₊`, which satisfy `Σ Im ζₙ/(1 + |ζₙ|²) < ∞` and `|ζₙ| → ∞`; hence
      `|θ′(x)| = c + Σₙ 2 Im ζₙ/|x − ζₙ|²` for every `x ∈ ℝ` (poltoratski2024 line 312–321, 335–346). Route: `θ`
      divided by a finite Blaschke product is bounded holomorphic with unimodular boundary values, hence bounded
      by `1` (§2.5), which at `z = i` gives the Blaschke condition; the zeros of a meromorphic function do not
      accumulate, so `B` converges and is analytic across `ℝ`; `−log|θ/B|` is nonnegative harmonic on `ℂ₊` and
      tends to `0` locally uniformly at `ℝ`, so its measure in §2.2 is `0` and it equals `c Im z`." Change line
      1955 to "Let `θ` be meromorphic inner, `0 < ε < 1` and …", and add §2.2 to §7.1's `*Needs:*` and Layer 7's
      Dependencies. Tested on the witness: for `ζₙ = √n + i/n`, `c = 0` and the series
      `Σ (2/n)/((x − √n)² + n^{−2})` converges at every real `x` (terms `O(n^{−2})`), and at `E = z + i` it reduces
      to the existing Check `2/(1 + x²)`.

2. **F02** (P3) The References say Mauth's dictionary matches a numbering it does not match

   Location: `packages/DiracScatteringAndNonlinearFourierTransform/README.md:2599-2600`, "used for Layers 2, 3,
   6 and 8 (§§2, 3.1–3.2, 3.7), whose dictionary (line 65–87) matches the numbering."

   Claim: the dictionary of mauth2022 agrees with the numbering of poltoratski2024 that the README cites
   (version 14, line 2348–2349).

   Witness: mauth2022 line 75–77 pairs its Lemma 43 with "Lemma 8" and Lemma 45 with "Lemma 9", and line 82–83
   pairs Corollary 7 with "Corollary 3" and Corollary 6 with "Corollary 4". The README (2247, 2297, 2159–2160),
   correctly by content, pairs Lemma 43 with Lemma 7, Lemma 45 with Lemma 8 and Corollary 6 with Corollary 3 of
   version 14.

   Repair: replace "whose dictionary (line 65–87) matches the numbering" by "whose dictionary (line 65–87) refers
   to that earlier version: it agrees with version 14 for Lemmas 1–6 and Corollaries 1–2, and from there on the
   pairs are those cited in §8.7–§8.9 (its Corollary 6, Lemma 43 and Lemma 45 are Corollary 3, Lemma 7 and
   Lemma 8 of version 14)". Tested: mauth2022 line 3140–3150 (Lemma 43) is the joint approximation of
   poltoratski2024 line 1028–1034 (Lemma 7); line 3251–3268 (Lemma 45) is the matching of line 1124–1138
   (Lemma 8); line 1397–1408 (Corollary 6) is line 1002–1012 (Corollary 3).

Two new findings (one P2, one P3). All nine findings of round 1 are repaired at this head and no repair
introduced an error. No statement of `Suggested.lean` and no bold README target was refuted by an instance.

## Round 1 findings at this head

| Earlier finding | Status | Witness at `47f1421` (`packages/DiracScatteringAndNonlinearFourierTransform/README.md`) |
|---|---|---|
| 1a/F01 (P2) vector-valued fundamental theorem is at the pins | repaired | Line 248–253: "For maps into a real Banach space, `IntervalIntegrable.ae_hasDerivAt_integral` (… line 67)"; line 378–382 adds `IntervalIntegrable.absolutelyContinuousOnInterval_intervalIntegral'`; `*Needs:*` of §1.1 (546–548) and §1.2 (578–580) cite them; `VitaliFamily.ae_tendsto_average` no longer occurs. Both declarations read at the pins (Mathlib file line 67, hypothesis `IntervalIntegrable f volume a b`, conclusion for a.e. `x ∈ uIcc a b` and every `c ∈ uIcc a b`; Tau Ceti file line 240, real normed space, `c ∈ uIcc a b`): the README's restatements agree. |
| 1a/F02 (P3) barrier Check refers to a potential not in §6.5 | repaired | Line 1866–1867: "the instance `c = 0.7`, `T = 1.3` of the real constant potential on `[0, T]` of §6.5's second Check". §6.5's second Check (1780) is that family. |
| 1a/F03 = 1b/F03 (P3) contract rows nothing consumes | repaired | `Besicovitch.ae_tendsto_rnDeriv` and `TauCeti.PhragmenLindelof.upper_half_plane_of_isBounded` occur nowhere; Summary (5–6) lists "Carathéodory, Grönwall, maximal-function and Nevanlinna–Pick modules"; the Vitali row (260–262) ends "in §2.4". |
| 1a/F04 (P3) `*Needs:*` lines omit inputs | repaired | Line 1895: "*Needs:* §4.1, §4.4, §6.5, §6.7"; line 2547: "*Needs:* §3.2, §4.1, §5.2, §5.5, §9.4, §9.5"; line 1253: "Layer 1 (§1.2, §1.3, §1.4, §1.6)". No forward reference results. |
| 1b/F01 (P3) Romanov's sign of the spectral parameter | repaired | Line 161–163: "has `J = [[0, −1], [1, 0]] = −Ω` (romanov2014 line 160–164), so it is the present system for `Q = −Q_q` and `λ = −z`". Recomputed: `V = 0`, `λ = −z` gives `(cos tz, sin tz) = Θ(t, z)`; `λ = z` gives `Θ(t, −z)`. |
| 1b/F02 (P3) Jensen bound applied outside its hypothesis | repaired | Line 958–964: "analytic on the closed disc of every radius `r < 1`, where the bound reads `k log r + log|τ| ≤` …"; `MeasureTheory.lintegral_liminf_le` is in §2.5's `*Needs:*` (972). Pinned statement read (`TauCeti/Analysis/Complex/RadialUniqueness.lean` line 76: `AnalyticOnNhd` on `closedBall c |r|`, `r ≠ 0`, order times `log r` plus log of the trailing coefficient). Fatou step recomputed: `∫(log⁺S − log|g(rₙζ)|) ≤ log⁺S − log|τ| − k log rₙ`. |
| 1b/F04 (P3) downstream bullet names roadmaps on main | repaired | Line 2576–2578 names no roadmap: "Linear evolution equations whose coefficients are integrable but not essentially bounded in time". |
| 1b/F05 (P3) §2.7 not delimited from `euclidean_paley_wiener` | repaired | Line 127–134. Read against AutomorphicSpectralTheory §1.6 at its open head (smooth functions in the closed ball of radius `R`, bounds `(1 + ‖λ‖)^N e^{−R‖Re λ‖}`): the README's description agrees. `2 sin(tx)/x = O(1/|x|)`, not rapidly decreasing. |

New errors introduced by the repairs: none found. The new §2.5 Check (981–985) was recomputed:
`−i/z` at `z = i(1 + w)/(1 − w)` is `−(1 − w)/(1 + w)`, singular at `w = −1`; real part `−1` at `w = 0`, `0` on
`|w| = 1`.

## The pass: record

### `Suggested.lean` (19 declarations; `noncomputable section`; the only `variable` is `{q : ℝ → ℂ}` inside `namespace DiracFundamentalSystem`; no instance arguments outside `linear_caratheodory`)

| Declaration (README section) | Instances tried and values computed | Result |
|---|---|---|
| `linear_caratheodory` (§1.2); `[NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]` | `a > b`: `ht₀` unsatisfiable. `a = b = t₀`: `Y(t₀) = y₀`. `P = t^{−1/2}`: `y₀e^{2√t}`. `P = 1/t` fails `hP`. `Y₂ = 1_{(2,3)}` on `[0,1]`: `EqOn` holds, global equality would not. `s ↦ P s (Y s)` is a.e. strongly measurable for `Y` continuous on `Icc` | true as typed; equals README over `ℝ` |
| `diracCoeff` (§3.1) | `−Ω(z − Q_q) = [[f, −z − g], [z − g, −f]]` computed; `q = 1 + i`, `z = 0`: `[[1, −1], [−1, −1]]`, square `2·1` | equals README |
| `IsDiracSolution`, `DiracFundamentalSystem` (§3.1) | free: `(cos tz, sin tz)`, `(−sin tz, cos tz)`; `f = c`, `z = 0`: `(e^{ct}, 0)`; opposite sign of `Q` gives `e^{−ct}`; `q = ic`: `(cosh ct, −sinh ct)` | sign pinned; values at `t < 0` unconstrained and never used |
| `hermiteBiehler`, `hermiteBiehlerDirichlet` (§3.2) | `E′ = −izE + qE#` derived from `diracCoeff`; free `e^{−itz}`, `−ie^{−itz}`; `EẼ# − ẼE# = 2i` | ok |
| `scatteringA`, `scatteringB` (§4.1) | `a′ = qe^{2izt}b#`, `b′ = qe^{2izt}a#` derived; constant `c`: `a = e^{izt}(cos κt − iz sin κt/κ)`, `b = e^{izt}c sin κt/κ`, `κ² = z² − |c|²`; `a(1, 5i) = 1.0934`, `a(1, −5i) = 237` | `q` lower left, as README |
| `IsResonanceFree` (§9.4) | `t ≤ 0`: covered by a large `T₀`; free: every `s`; `f ≡ 1`: zero of `Ẽ` at `≈ −2ie^{−2t}`, so `0` excluded | equals README |
| `existsUnique_diracFundamentalSystem` (§3.1) | `q = 0`, `q = c`; uniqueness is `linear_caratheodory` on each `[0, T]` | true |
| `nonlinear_plancherel` (§4.4) | `t = 0`: `0 = 0`. First order: `∫|∫₀ᵗ qe^{2ixs}|² dx = π∫|q|²`, `log|a| ≈ ½|b|²`, so `π/2`. `q = 1` on `[0,1]`: `|a|² = 1 + sin²κ/κ²` | true with `π/2` |
| `exists_nonlinearFourier_plancherel` (§5.4–§5.5) | `q⌃* − ρ₁ = uρ₂(1 − |ρ₁|²)/(1 + uρ₂ conj ρ₁)`, modulus `≤ |ρ₂|(1 + |ρ₁|) ≤ 2|ρ₂|`; `∫|ρ₂|² ≤ ∫L(|ρ₂|) = π‖q‖²_{(T,∞)}`; `q = 0`: `F = 0` | true; `F` determined a.e. |
| `IsSpectralMeasureOf` (§6.5) | free: `Im i = 1 = P[dx]`; `2dx` gives `2`; kernel without `1/π` gives `π`; `β < 0` or a second pair `(β′, μ′)` contradicts §2.2's uniqueness for `P[μ]` | determines `(β, μ)` |
| `paleyWienerFunction` (§2.7) | `φ = 1`: `2 sin(tz)/z`, `∫ = 4πt = 2π·2t` | ok |
| `exists_isSpectralMeasureOf` (§6.4–§6.5) | on `ℝ`, `Im(−Ẽ/E) = (AD − BC)/|E|²`; `f = 1_{[0,1]}`: `m(i) = i/(1 + √2 tanh √2) = 0.4432i`; `f ≡ 1`: `m = (1 + iκ)/z` from the decaying eigenvector, `Im m(i) = √2 − 1` | true given the declared gap |
| `spectralMeasure_isometry` (§6.6) | free: Plancherel; `2dx` fails by `2`; limit passage from the dense class checked (locally uniform convergence plus Cauchy in `L²(μ)`) | true |
| `spectralMeasure_unique` (§6.6) | polarisation with `e^{iax}k_ε ∈ PW_{ε+|a|}`; zeros of `k_ε` at `πn/ε` move with `ε` | true |
| `szego_condition` (§6.8) | `|E| = |a + b| ≤ 2|a|`, `dΠ ≤ dx`, `log|a| ≥ 0`: `−2π log 2 − π‖q‖²`; free `0 ≥ −4.355`; `f ≡ c` violates `hq`, `w = 0` on `(−c, c)` | true |
| `tendsto_truncation_of_isResonanceFree` (§9.6) | limit `(1/√w − iβ/√w̃)/(1/√w + iβ/√w̃)`, `Im β = −√(ww̃)`: denominator modulus² `1/w + 1/w̃ + 2`; free `α = i`, `β = −i`, limit `0`; `f = c1_{[0,T]}` at `0`: `cosh² cT` | consistent with §9.5 |

Elaborated signatures: Lean was not run (not permitted). The 19 types in the worker's `signatures.md` were
compared with the README statements; no binder is lost and nothing changed. `Suggested.lean` is unchanged
since round 1.

### README targets (55 sections read, every line)

| Target | Values computed | Result |
|---|---|---|
| §1.1 | `α = −1`, `β = 1`, `u = −e^t`: equality; `β = −1`: `1/2 > e^{−1}` | ok |
| §1.3–§1.6 | `exp(B)exp(A) = [[1,1],[1,2]]`, reversed `[[2,1],[1,1]]`; Duhamel bound `e − 1 ≤ e`; `exp∫₀ᵗ dr/(z − r) = z/(z − t)` | ok |
| §1.7 | local existence in the equality case: the Picard map need not preserve `B` (`e^{−Λ} + Λ ≥ 1`), but the first-exit argument gives `m = L = 0` after the exit time, so a constant continuation exists; `0.1e^{0.4} = 0.149` | statement true |
| §2.1 | `C(z)` from `1 + x² ≤ 2(1 + u²)(1 + (x − u)²)`; `S[ν](i)` real; `P[1/(1 + x²)](2i) = 1/3`; Cayley `(8/9)/(10/9) = 4/5`; `P[Re ζ](2i) = 1/3`; dilation `λP[ν](λz)` | ok |
| §2.2–§2.4 | `πyP[ν](iy) = ∫ y²/(x² + y²) dν`; cone constant: maximum of `(s² + 1)/((s − 1)² + 1)` at `s = (1 + √5)/2`, value `2.618`; aperture `max(2, 1 + 2α²)`; `(arctan 2 − π/4)/π = 0.102`; `1/2 − arctan(1/2)/π = 0.352` | ok |
| §2.5–§2.8 | Fatou step (above); `1/(z + i) = −i∫₀^∞ e^{−s}e^{isz} ds`, `‖·‖² = π`; Cauchy kernel norm² `1/(4πy)`; `𝓕(1/(x + i))(w) = −2πie^{−2πw}`, `w > 0`; `k_t(λ, λ) = sinh(2ty)/(2πy)`; `O_{log|x+i|}(i) = 2`; `∫|e^{−iz}/(z + i)|² = πe^{2y}/(y + 1)` | ok |
| §3.1–§3.3 | derivative of `M(λ)*ΩM(z)` is `(z − conj λ)M*M`; `exp(ΩQ_{1+i}) = [[3.5465, −1.3683], [−1.3683, 0.8099]]`; `|E|² − |E#|² = 4 Im z∫|Θ|²`, free `2 sinh 2ty` | ok |
| §4.1–§4.5 | concatenation from `G(t) = D_sG₂D_s⁻¹G₁`; translation, modulation, dilation; `r′ = 2izr + conj q − qr²`; `∂ₜ(|a|² − |β|²) = 4 Im z|β|²`; `∂ₜρ = qe^{2izt}/a²` | ok |
| §5.1–§5.6 | `‖r‖₂ ≤ ‖q‖/y`; tail `‖q‖e^{−2yt}/(2√y)`; `4/5`, `9/25`; `L(0.999) = 6.2151`, `0.3563 ≤ 0.7656`, `0.0943 ≤ 0.1292`; `∫|1 − 1/a₂|² dΠ ≤ 2π Re(1 − 1/a₂(i))`; `0.0108 + 0.0326 = 0.0434`; `I ≈ 400 · (π · 0.09/2) · x̄/(1 + x̄²)` gives `≈ 13` and `≈ 22` at `ξ = −0.25, −0.5`, consistent with `12.54`, `21.71` | ok |
| §6.1–§6.4 | kernel of `z + i`: `2i(conj w − z)/(2πi(conj w − z)) = 1/π`; `∂ᵣ|E|^{−2} = −2 Re(q/E²)`; Weyl radius `|EẼ# − ẼE#|/(|E|² − |E#|²) = 1/(2 Im z∫|Θ|²)`; `−D/C = 0.5919i`, `−B/A = 0.3858i`; limit point from `1 ≤ |Θ||Φ|` at `z = 0` | ok |
| §6.5–§6.8 | `ww̃ = (Im m)²/|m|² ≤ 1`; masses `0.5373`, `0.4159` at `T = 0.5, 2`; `|E(T, 2)|² = 4/3 − (1/3)cos 2θ + (1/√3)sin 2θ ∈ [2/3, 2]`, mean of the reciprocal `√3/2`, period `π/√3`; coefficient of `ξᵏ` in `H_ν` is `2∫ ζ̄ᵏ dν`; `klDiv σ (2σ) = 1 − log 2`; `S ≤ log ν(X)` from `mul_log_le_klDiv` | ok |
| §7.1–§7.3 | `θ′/θ = −2i Im(E′/E)` on `ℝ`; `(√(1 + ε) + 1)/ε < 3`; `0.2, 0.16, 0.1`; `θ′ = 2izθ + f(1 − θ²)`; `ζ′ = −f/∂_zθ` | ok (generality: S01) |
| §8.1–§8.9 | `[tanh p, coth p]`; `D(t, λ, z₀) = iβE(λ)`, `E(conj z₀) = 2 conj β`, `K = |β|²/(πy)`, `2|β|²w ≈ sinh 2ty`; zeros of `T` at height `−P/t`, `|e^{−itζ}| = e^{−P}`; `1.25, 0.75`, `0.9284`; determinant of the matched forms `i|κ|² sinh 2ty′` | ok |
| §9.1–§9.6 | `t₁ = 0` reduces to the dictionary; `θ₂ − conj θ₁ = e + 2iυ`; `sinh²(ε₂ + 2υ) − sinh² ε₂ = N²`; `ΩQΩ⁻¹ = −Q`, `E_{−f} = iẼ_f`, `m_{−f} = −1/m_f`; zero of `Ẽ` from `e^{2κt} = (c + iz + κ)/(c + iz − κ)` at `≈ −2ice^{−2ct}`; `|E(10, 1/2)| ≈ 6433`; `(conj β − β)/√(ww̃) = 2i` | ok |

### Dependency check

```
depcheck: 251 roadmaps, 2383 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

## Verified sound

- Declarations read: 19 of 19. One `import Mathlib`, no `set_option`, no `lemma`, no sorry'd data, no `#`
  command, a docstring on each; every Lean name occurs in the README. The nine headline theorems the README
  lists (28–34) are all stated, none through a stand-in. One-tactic probe: no declaration follows from a
  pinned lemma or restates a definition; no padding.
- Targets read: 55 of 55 sections (README 2623 lines). Every definition has at least three Checks; about 75
  Checks recomputed by hand (table above); none found false, vacuous or a restatement.
- Pinned declarations: the 128 backticked names of the supplier contracts were searched mechanically at the
  pinned Mathlib and Tau Ceti; all exist (`Matrix.Norms.L2Operator` is a scope, as the README says). Twelve
  statements were read at the cited line and agree with the README's description:
  `IntervalIntegrable.ae_hasDerivAt_integral`, `…absolutelyContinuousOnInterval_intervalIntegral'`,
  `AnalyticOnNhd.le_circleAverage_log_norm`, `Matrix.det_exp` (Tau Ceti, line 75),
  `TauCeti.rouche_exists_eq_zero_iff`, `TauCeti.I_mul_herglotzTransform_cayley_eq`,
  `TauCeti.halfSpacePoissonKernel_le_mul`, `TauCeti.lowerSemicontinuous_klDiv_finiteMeasure`,
  `MeasureTheory.Lp.dualOneEquiv`, `MeasureTheory.Measure.ext_of_charFun`,
  `MeasureTheory.measure_limsup_atTop_eq_zero` (outer-measure class), `Real.tendsto_integral_exp_smul_cocompact`.
- Locators verified: 59 against the cached texts (poltoratski2024 18, mauth2022 16, romanov2014 9,
  denisov2006 4, taothiele2012 4, killipsimon2003 4, mnatsakanyan2022 3, denisov2026 1). Each holds the
  statement it is cited for, except the remark of S02. The README's account of §9 of poltoratski2024
  (line 1380–1533: inserted zero intervals, comparison of moduli on three subintervals, Lemma 10) matches the
  text.
- Sibling citations checked: 7. AutomorphicSpectralTheory §0.5 and §1.6 at its open head (merge order line 104,
  this roadmap line 105); AnalyticNumberTheoryPartI §0.23 on main; OperatorTheory/UnboundedOperators §4.8
  (UO-D07) on main, which plans the `Ju′ + Vu` endpoint classification without a displayed alternative;
  AsymptoticExpansions §10.1, StochasticCalculus S6.5 and OperatorTheory/ToeplitzOperators Layers 2–5 exist on
  main. The declared gap `dirac-weyl-alternative` has the same slug, supplier and section in
  `design/plan.json` and in the README, and is not raised; the pull request changes `plan.json` only in its
  `gaps` list.
- Ownership by object, through `roadmaps grep` on main and the open heads: de Branges spaces, Hermite–Biehler
  functions, outer functions, nontangential limits, Fatou's theorem, Paley–Wiener spaces, the half-plane Hardy
  space, meromorphic inner functions, the Szegő condition, the non-linear Fourier transform, Carathéodory
  existence, Liouville's formula, Weyl discs. No second owner. ConformalMappingPartII (main) uses the disc
  Herglotz formula only. SchrodingerOperatorsAndSpectralTypes (open) declares
  `TauCetiRoadmap.SchrodingerOperatorsAndSpectralTypes.IsSpectralMeasureOf`, a different fully qualified name
  for a different object (an operator and a projection-valued measure). No declaration of `Suggested.lean`
  shares a fully qualified name with another roadmap.
- Policy: the pull request changes only the package folder; no pull-request numbers or process narrative in the
  README or docstrings; every target has a locator.

Source independence: 14 passages compared with 8 sources, none shared beyond formula-forced statements; largest share poltoratski2024, 71 of 190 source mentions; contents compared with poltoratski2024 (§§1–9, line 102–125): independent — Layers 3 and 6 split its §§1–2, Layers 4–5 take its §5 and precede Layer 6, Layer 7 merges §§3–4, Layer 8 merges §§6–8, Layer 9 is §9, and the order of §8.2–§8.8 is forced by their `*Needs:*` lines (each needs its predecessor); garnett2007, coddingtonlevinson1955, debranges1968, remling2018 and krein1955 could not be read.

## Not verifiable

- Locators into garnett2007 (uncertified) and coddingtonlevinson1955, debranges1968, remling2018, krein1955
  (waived): no text.
- The analytic routes of §8.2–§8.4, §8.7(3) and §9.3 were checked for their inputs and for every displayed
  identity and constant, not line by line as proofs.
- Numerical Checks that need an ODE solver for a non-constant potential (§3.1, §4.1, §4.2, §4.5, §6.4) and the
  twelve-digit quadratures were not rerun; the closed-form Checks beside them were.
- poltoratski2024 was read from an OCR text; several displayed formulas are garbled (for example line
  1402–1413, 1465–1470) and were matched on labels and prose, and against mauth2022 where it has the same
  statement.
- Ownership against open pull requests was checked through `roadmaps grep` and the heads named above, not by
  reading all 245 sibling checkouts.

## Source issues

- **Error** in poltoratski2024 at (5.5), §5, line 545–548: the source says the `L¹(ℝ)` norm of `log|a(t, ·)|` equals the squared `L²(0, t)` norm of the potential; it should be `π/2` times that norm in its normalisation; affects a stated result.
- **Error** in mauth2022 at (4), §1, line 206–210: the source says the same identity with constant one, and half the `L¹` norm of the logarithm of one minus the squared transform equal to the squared norm; it should carry `π/2` in both; affects a stated result.
- **Misprint** in poltoratski2024 at Lemma 8, (8.5), line 1131–1138: the source says the matched forms at `s` keep the factor `γ(ty)` of the hypothesis with the new height `y′` inside the sine; it should be `γ(ty′)`, as (2.2) forces; affects the proof.
- **Misprint** in mauth2022 at Lemma 45, (58), line 3262–3268: the source says the matched forms keep `γ(ty)` with `y′` inside the sine and cosine; it should be `γ(ty′)`; affects the proof.

## For the human reviewers

- **Scope.** README §9.6 is conditional on resonance-free points; poltoratski2024 Theorem 1 (line 579–581, Ann. of Math. 199) is unconditional. README 136–145 and 2590–2597 decline it, citing mnatsakanyan2022 (line 9–13, 135–137) and their own §9.4 fourth Check.
- **Scope.** README 2595–2596 asserts that the comparison of moduli in §9 of poltoratski2024 version 14 (line 1482–1533) does not determine the motion of a resonance. The description of §9 matches the text; the assertion itself was not verified or refuted here.
- **Scope.** §8.6, §8.8, §8.9 and §9.1–§9.3 feed no final target of this roadmap (§9.5–§9.6 need §8.7(3) and §9.4); README 2585–2586 names their consumer as a future proof that almost every point is resonance-free.
- **Licence.** poltoratski2024 was read as OCR of an image-only arXiv version 14 (`sources.toml`, `version_note`); mauth2022, an unrefereed arXiv text, carries 54 of the 190 source mentions.
- **Not tested.** `Suggested.lean` was not compared with public formalisations outside the pinned libraries; no resemblance is known.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "47f14217c05874fa859836dcd5f91ba29bfadfe4", "job": "RT-DiracScatteringAndNonlinearFourierTransform~2b", "model": "fable", "worker": "chris-x30"} -->
