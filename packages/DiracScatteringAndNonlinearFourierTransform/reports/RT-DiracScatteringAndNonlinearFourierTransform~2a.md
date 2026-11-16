<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18040#issuecomment-6908713153 -->
Red team round 2 pass a (claude) of 47f1421

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The declared gap `dirac-weyl-alternative` asks for a theorem §6.4 does not need

   - Location: `packages/DiracScatteringAndNonlinearFourierTransform/README.md:1701-1706`, "So at `λ₀ = −z₀` the
     square-integrable solutions do not form a line, `∞` is a limit-circle endpoint by the alternative of
     OperatorTheory/UnboundedOperators §4.8 … in particular at `z = 0`; there `det[Θ, Φ] = 1` gives `1 ≤ |Θ||Φ|`";
     with the contract and gap at 495–511, the scope bullet 107–112, `*Needs:*` 1708–1709, Dependencies 1913 and
     the `gaps` entry of `design/plan.json`.
   - Claim: the limit-point property at `∞` needs Weyl's alternative with its independence of the spectral
     parameter, to move from `z₀ ∈ ℂ₊` to `z = 0`, where the determinant argument is run.
   - Witness: `det M(t, z) = 1` holds at every `z` (§3.1, README 1161), so the determinant argument runs at `z₀`
     itself: `Θ(·, z₀), Φ(·, z₀) ∈ L²` and `1 = |AD − BC| ≤ |Θ||Φ|` contradict Cauchy–Schwarz. No other step of
     §6.4–§6.6 uses the alternative.
   - Why it is a finding: a declared gap must be minimal; this one asks OperatorTheory/UnboundedOperators for a
     statement whose only use here is already covered by §3.1 of this roadmap, and it makes Layer 6 wait for a
     supplier it does not need. (The existence of a square-integrable solution comes from the nested discs, and
     uniqueness of `m(z)` from `Θ(·, z) ∉ L²`; both are proved here.)
   - Repair (tested on the free case at `z₀ = i`: `Θ = (cosh t, i sinh t)`, `Φ = (−i sinh t, cosh t)`,
     `|Θ||Φ| = cosh 2t ≥ 1`, not integrable, and indeed `∫₀ᵗ|Θ|² = sinh(2t)/2 → ∞`):
     1. Replace README 1701–1706 from "Limit point:" to the end of the route by: "Limit point: if `Θ(·, z₀) ∈ L²`
        for some `z₀ ∈ ℂ₊`, then `Φ(·, z₀) ∈ L²` as well, since `Φ + wΘ` is square-integrable for `w` in the
        nonempty `⋂_t D_t(z₀)`. But `det M(t, z₀) = 1` (§3.1) gives `1 = |A D − B C| ≤ |Θ(t, z₀)| |Φ(t, z₀)|` for
        every `t ≥ 0`, and the right side is integrable on `[0, ∞)` by the Cauchy–Schwarz inequality, a
        contradiction."
     2. `*Needs:*` of §6.4 (1708–1709) → "§3.1, §3.2, §3.3; Mathlib `TendstoLocallyUniformlyOn.differentiableOn`."
     3. Delete the subsection "From TauCetiRoadmap.OperatorTheory/UnboundedOperators" and the paragraph "What
        OperatorTheory/UnboundedOperators must provide (gap:dirac-weyl-alternative) …" (495–511), and remove the
        `dirac-weyl-alternative` entry from the `gaps` list of `design/plan.json`.
     4. In the scope bullet (111–112) replace "§6.4 consumes the alternative and adds that `∞` is a limit-point
        endpoint for every potential, the Weyl discs and the Weyl function." by "None of this is consumed: §6.4
        proves from `det M = 1` (§3.1) that `∞` is a limit-point endpoint for every potential, and builds the Weyl
        discs and the Weyl function."
     5. Layer 6 Dependencies (1913): delete "OperatorTheory/UnboundedOperators §4.8 for §6.4;". The comparisons
        with §4.8 in the Conventions, in §1.2's fourth Check and in §6.4's first Check may stay as comparisons (the
        supplier is on main and its text at README 861–863, 876 of that roadmap reads as cited).

2. **F02** (P3) The Dirichlet forms of §8.2–§8.6 are consumed but are not targets

   - Location: `README.md:2248-2250`, "where `η_C` is the error of §8.5 on `Q(s, C/t)` and `η̃_C` the same error
     for the data `B`, `D`, `μ̃`, `w̃` of `Ẽ`"; also 2163–2165 and 2200–2201 ("For `Ẽ = B − iD` the same argument
     runs with `B`, `D`, `μ̃` and `w̃`").
   - Claim: §8.7(1) and §8.8 may use §8.2–§8.6 for `Ẽ`, `K̃_t`, `μ̃`, `w̃`, `T̃₀`.
   - Witness: §8.2–§8.6 (2036–2155) state every result for `K_t`, `μ`, `w`, `D(t, λ, z) = A(z)C(λ) − C(z)A(λ)`
     and zeros of `E` only; no target states the numerator `B(z)D(λ) − D(z)B(λ)` or `η̃_C`. The reduction that
     gives them, `M_{−f} = ΩM_fΩ⁻¹`, is stated only later, in §9.4 (2467–2470).
   - Repair (tested on the free case: `B = −sin`, `D = cos`, so `B(z)D(λ) − D(z)B(λ) = sin(t(λ − z))`, the stated
     limit with `w̃ = 1`):
     1. Move the second API bullet of §9.4 (the `Ω`-conjugation, which needs only §3.1) to §3.1 as a bullet, and
        let §9.4 cite it there.
     2. After "`w`, `w̃` are the densities of §6.5." (2011) add: "Each statement of §8.2–§8.6 is also a target for
        the Dirichlet data, with `Φ`, `Ẽ`, `K̃_t` (§6.2), `μ̃`, `w̃`, `T̃₀`, `T̃₁` and the numerator
        `D̃(t, λ, z) = B(t, z)D(t, λ) − D(t, z)B(t, λ)` in place of `Θ`, `E`, `K_t`, `μ`, `w`, `T₀`, `T₁` and
        `D(t, λ, z)`. It is the Neumann statement for the potential `−f`: by the `Ω`-conjugation of §3.1,
        `Θ_{−f} = ΩΦ_f`, `E_{−f} = iẼ_f`, `D_{−f} = D̃_f`, `K_{t,−f} = K̃_{t,f}`, and `μ_{−f} = μ̃_f` because
        `m_{−f} = −1/m_f` (§6.5). Free case: `D̃ = sin(t(λ − z))`."
     3. Add §3.1 and §6.5 to the Layer 8 Dependencies if not already implied (Layer 3 and Layer 6 are listed).

3. **F03** (P3) `*Needs:*` lines of §8.6, §8.7, §8.8 and §9.3 omit §8.1

   - Location: `README.md:2144` ("`*Needs:*` §3.2, §7.3, §8.2, §8.5."), 2213 ("§7.2, §8.5, §8.6; …"), 2269
     ("§3.2, §6.5, §8.5, §8.6, §8.7."), 2433 ("§3.1, §3.2, §4.3, §6.8, §8.8, §8.9, §9.1, §9.2; …").
   - Claim: these lines list what each target uses.
   - Witness: §8.6 is stated with `T₀(s, D)` and `γ(t y(t))` (2123–2127), §8.7 with `T₀`, `T₁`, `T̃₀`, `T̃₁`
     (2160–2166), §8.8 with `T₁ ∩ T̃₁` (2241), §9.3 with `T₁(s, K) ∩ T̃₁(s, K)` (2397); all are defined in §8.1
     (2015–2019). §8.6 also uses the diagonal `K_t(z(t), z(t))` of §6.2 (2137).
   - Repair: 2144 → "`*Needs:*` §3.2, §6.2, §7.3, §8.1, §8.2, §8.5."; 2213 → "`*Needs:*` §7.2, §8.1, §8.5, §8.6;
     Tau Ceti …"; 2269 → "`*Needs:*` §3.2, §6.5, §8.1, §8.5, §8.6, §8.7."; 2433 → "`*Needs:*` §3.1, §3.2, §4.3,
     §6.8, §8.1, §8.8, §8.9, §9.1, §9.2; …". No edge becomes a forward reference.

One P2 (the declared supplier gap asks for a theorem that §6.4 does not need: the roadmap's own `det M = 1`
closes the limit-point argument) and two P3. No statement of `Suggested.lean` and no bold README target was
refuted by an instance. All nine round-1 findings are repaired at this head and no repair introduced an error.

## Round-1 findings at this head

| Finding | Status | Witness at `packages/DiracScatteringAndNonlinearFourierTransform/README.md` |
|---|---|---|
| 1a/F01 (P2) vector-valued fundamental theorem is at the pins | repaired | 248–256: "For maps into a real Banach space, `IntervalIntegrable.ae_hasDerivAt_integral` (… line 67) …"; 378–382 Tau Ceti `…absolutelyContinuousOnInterval_intervalIntegral'`; `*Needs:*` at 546–548 and 578–580; Dependencies 769–770. Both declarations read at the pins (Mathlib `LebesgueDifferentiationThm.lean` 65–69, complete real target, a.e. `x ∈ uIcc a b`, every `c ∈ uIcc a b`; Tau Ceti `AbsolutelyContinuousFun.lean` 238–243, real normed `F`, `hc : c ∈ uIcc a b`): the README describes them exactly. `VitaliFamily.ae_tendsto_average` no longer occurs. |
| 1a/F02 (P3) §6.7 barrier Check | repaired | 1866–1867: "the instance `c = 0.7`, `T = 1.3` of the real constant potential on `[0, T]` of §6.5's second Check". Recomputed: `(1/π)∫ log w dΠ = 2T − 2 log|E(T, i)|` follows from `log|E(T, z)| − T Im z = P[log|E(T, ·)|]`. |
| 1a/F03 = 1b/F03 (P3) unused contract rows | repaired | grep of the README for `upper_half_plane_of_isBounded`, `Besicovitch`: no occurrence; line 84–89 no longer lists the half-plane Phragmén–Lindelöf principle; Mathlib's row at 271 stays and is used by §2.7 (1058). |
| 1a/F04 (P3) `*Needs:*` omissions | repaired | 1895: "`*Needs:*` §4.1, §4.4, §6.5, §6.7"; 2547: "`*Needs:*` §3.2, §4.1, §5.2, §5.5, §9.4, §9.5"; 1253: "Layer 1 (§1.2, §1.3, §1.4, §1.6)". (The same class recurs elsewhere: S03.) |
| 1b/F01 (P3) Romanov's sign of the spectral parameter | repaired | 160–164: "Romanov's `JX′ + QX = λX` … has `J = [[0, −1], [1, 0]] = −Ω` …, so it is the present system for `Q = −Q_q` and `λ = −z`". romanov2014 line 160–164 and 231 read; `(−Ω)⁻¹ = Ω`, so `X′ = Ω(λ − Q)X = −Ω(z − Q_q)X` for `λ = −z`, `Q = −Q_q`. |
| 1b/F02 (P3) Jensen bound outside its hypothesis | repaired | 957–969: "… is analytic on the closed disc of every radius `r < 1`, where the bound reads `k log r + log|τ| ≤` the circle average …"; 972 has `MeasureTheory.lintegral_liminf_le`. Fatou step recomputed: `log⁺S − ∫log|g*| ≤ liminf(log⁺S − k log rₙ − log|τ|) = log⁺S − log|τ|`. |
| 1b/F04 (P3) downstream consumers on main | repaired | 2576–2578: "Linear evolution equations whose coefficients are integrable but not essentially bounded in time …"; no roadmap on main is named as a consumer. |
| 1b/F05 (P3) Paley–Wiener scope | repaired | 127–134; AutomorphicSpectralTheory §1.6 at its open head (README line 959, 975) records `euclidean_paley_wiener` as described; `2 sin(tz)/z` is `O(1/|x|)` on `ℝ`. |

## The pass: record

### `Suggested.lean` (19 declarations; `noncomputable section`; the only `variable` is `{q : ℝ → ℂ}` inside `namespace DiracFundamentalSystem`; no instance arguments in scope)

| Declaration | Instances tried, values on each side | Result |
|---|---|---|
| `linear_caratheodory` | `a > b`: `ht₀` unsatisfiable. `P = 0 = F`: `Y ≡ y₀`. `P = t^{−1/2}` on `[0, 1]`: `Y = y₀e^{2√t}`. Composite `s ↦ P s (Y s)` is a.e. strongly measurable and dominated by `‖P‖ sup‖Y‖`, so no junk value of the interval integral enters the uniqueness clause. | true as typed; equals §1.2 |
| `diracCoeff` | `−Ω(z − Q_q)`: rows `(f, −z − g)`, `(z − g, −f)`; `q = i c`, `z = 0`: `[[0, −c], [−c, 0]]`, `Θ = (cosh ct, −sinh ct)` | equals README |
| `IsDiracSolution`, `DiracFundamentalSystem` | free: `(cos tz, sin tz)`, `(−sin tz, cos tz)`; wrong sign of `Q`: `A(t, 0) = e^{−ct}` against `e^{ct}` | sign fixed; values at `t < 0` unconstrained and never used |
| `hermiteBiehler(Dirichlet)` | `E′ = fA − (z + g)C − i(z − g)A + ifC = −izE + qE#`; free: `e^{−itz}`, `−ie^{−itz}` | ok |
| `scatteringA`, `scatteringB` | `a′ = e^{itz}q(E# + iẼ#)/2 = qe^{2izt}b#`, `b′ = qe^{2izt}a#`; free `1`, `0` | `q` lower left, as §4.1 |
| `IsResonanceFree` | `f ≡ 1`: zero of `Ẽ` at `−2ie^{−2t}`, so `0` excluded only because the definition includes `Ẽ`; `∃ T₀` absorbs `t ≤ 0` | equals §9.4 |
| `existsUnique_diracFundamentalSystem` | `q = 0`, `q = c`; uniqueness at `t ≥ 0` only | true |
| `nonlinear_plancherel` | `t = 0`: `0 = 0`; first order `∫|∫₀ᵗ q e^{2ixs}|² dx = π∫|q|²`, `log|a| ≈ ½|b|²`: `π/2`; `y·ye^{−2yv}` has mass `1/2`, so `y(a(iy) − 1) → ½∫|q|²` and `πy log|a(iy)| → (π/2)∫|q|²` | true; `hq` not needed for truth (note) |
| `exists_nonlinearFourier_plancherel` | `|q⌃* − ρ₁| = |ρ₂|(1 − |ρ₁|²)/|1 + uρ₂ conj ρ₁| ≤ |ρ₂|(1 + |ρ₁|)`; `∫|ρ₂|² ≤ ∫L(|ρ₂|) = π‖q‖²_{(T,∞)}`: `4π`. `−log(1 − |F|²) = 2 log|a|` | true |
| `IsSpectralMeasureOf` | a second pair `(β′, μ′)`: `β = lim u(iy)/y` since `P[μ](iy)/y → 0`; `β < 0` would give `P[μ]` a linear term `b + |β| > 0`; free: `Im i = 1 = P[dx]`, `2 dx` gives `2` | determines `(β, μ)` |
| `paleyWienerFunction` | `φ = 1`: `2 sin(tz)/z`, `‖·‖² = 4πt` | ok |
| `exists_isSpectralMeasureOf` | `Im z∫₀ᵗ|Φ + wΘ|² − Im w = Im(conj u·v)`, disc `|Ẽ + wE| ≤ |Ẽ# + wE#|`, `−Ẽ/E` interior; `f = 1_{[0,1]}`, `z = i`: `E = cosh√2 + √2 sinh√2`, `Ẽ = −i cosh√2`, `m = 0.44319 i` | true without the supplier gap (S01) |
| `spectralMeasure_isometry` | free: Plancherel; `g = π(1 + x²)|F|²` extends continuously by `0` at the Cayley point `1` when `zF ∈ PW_t` (Riemann–Lebesgue), so the atom `β δ₁` does not contribute | true |
| `spectralMeasure_unique` | `e^{iax}F ∈ PW_{t+|a|}`: `|F|²ν`, `|F|²μ` finite with equal characteristic functions; `ν = 2dx`: `2‖F‖² ≠ ‖F‖²` | true |
| `szego_condition` | `|E| = |a + b| ≤ 2|a|`, `dΠ ≤ dx`, `log|a| ≥ 0`: `∫log w_T dΠ ≥ −2π log 2 − π‖q‖²`; `klDiv σ ν = ν(X) − 1 − (1/π)∫log w dΠ`; free `0 ≥ −4.355` | true |
| `tendsto_truncation_of_isResonanceFree` | `(conj β − β)/√(ww̃) = 2i` ⇒ `Im β = −√(ww̃)`; `|1/√w + iβ/√w̃|² = 1/w + 1/w̃ + 2`; cross-check with `m`: `|a|² = (1 + |m|² + 2 Im m)/(4 Im m) = (1/w + 1/w̃ + 2)/4`; free `α = i`, `β = −i`, limit `0` | consistent |

Elaborated signatures: no Lean was run (not permitted in this pass). The file has no section hypothesis that a
declaration could lose; the 19 types in the worker's `signatures.md` (0 flagged) agree with the file, and each
agrees with its README statement. Nothing changed.

### README targets (55 read), values recomputed in this pass

| Target | Computed | Result |
|---|---|---|
| §1.1 | `α = −1`: `v ≤ α(e^B − 1)`, `u ≤ αe^B` (negative `α` allowed) | ok |
| §1.6, §1.7 | `exp∫₀ᵗ dr/(z − r) = z/(z − t)`; Picard iterates stay in `B`: `M(t) + M_τ(e^{Λ(t)} − 1) ≤ M_τe^{Λ(t)}`; `0.1e^{0.4} = 0.149` | ok |
| §2.1 | `1 + x² ≤ 2(1 + u²)(1 + (x − u)²)` gives `C(z)`; `S[ν](i)` real; dilation `λP[ν](λz)`; `S[1/(1+x²)](i) = 1/2 = i/(2i)` | ok |
| §2.3 | `(s − x)² + y² ≤ max(2, 1 + 2α²)((s − x′)² + y²)`; supremum `(φ + 2)/(3 − φ) = 2.618` at `s = y(1+√5)/2`; `P[1_{[0,1]}](2 + i) = 0.1025`, maximal function `1/4` | ok |
| §2.4–§2.8 | `1/2 − arctan(1/2)/π = 0.352`; `‖1/(x − z)‖² = π/y` gives `1/(4πy)`; `𝓕g(σ) = 2πφ(2πσ)` supported on `σ ≥ 0`, value `−2πie^{−2πw}`; `O_h(i) = e^{log 2} = 2`; `πe^{2y}/(y + 1)` | ok |
| §3.1–§3.3 | `M(1, 0) = [[3.5465, −1.3683], [−1.3683, 0.8099]]`; parity under `diag(1, −1)`; `|u − iv|² − |u + iv|² = 4 Im(conj u·v)` | ok |
| §4.1–§4.5 | `r′ = 2izr + conj q − qr²`; `∂ₜ(|a|² − |β|²) = 4 Im z|β|²`; `ρ′ = qe^{2izt}/a²`; dilation and translation on the first-order term | ok |
| §5.1–§5.5 | `‖r‖₂ ≤ 2‖q‖/(2y)`; `e^{−2yt}/(2√y)`; `L(0.999) = 6.2151`, `0.3563 ≤ 0.7656`, `0.0943 ≤ 0.1292`; `I(−0.25) ≈ 56.55·0.2215 = 12.53`, `I(−0.5) ≈ 21.73`; `∫|1 − g|² dΠ ≤ 2π Re(1 − g(i))` | ok |
| §6.1–§6.8 | kernel `2i(ac′ − ca′)/(2πi(conj w − z))`; `E = z + i`: `1/π`; `−D/C = 0.59189 i`, `−B/A = 0.38582 i`, radius `1/(2·4.8527) = 0.10304`; `f ≡ 1`, `x = 2`: `|E|² = 4/3 + (2/3) sin(2√3T + φ₀)`, mean of `1/|E|²` is `√3/2`; `∂_r|E|^{−2} = −2 Re(q/E²)`; `klDiv σ(2σ) = 1 − log 2` | ok |
| §7.1–§7.3 | `θ′ = 2izθ + f(1 − θ²)`; `(√(1+ε) + 1)/ε < 3/ε`; `0.2, 0.16, 0.1` | ok |
| §8.1–§8.9 | `D(·, z₀) = iβE`, `E(conj z₀) = 2 conj β`, `K_t(z₀, z₀) = |β|²/(πy)`; `‖K − c Sinc‖² = Sinc(1/w − 2c + c²w)`; zeros `((k + ½)π − ½ log(5/3) i)/t`; `g′ = t cos(A − B)/cos²B`; `2 sinh 3.04/sinh 3 = 2.082`, `2 sinh 3.2/sinh 3 = 2.4448` | ok |
| §9.1–§9.6 | `t₁ = 0`: `(iE − Ẽ)/(2i) = (E + iẼ)/2`; `θ₂ − conj θ₁ = e + 2iυ`; `sinh²(ε₂ + 2υ) − sinh²ε₂ = N²`; `ΩMΩ⁻¹ = [[D, −C], [−B, A]]`; zero of `Ẽ` at `−2ice^{−2ct}`; `|E(10, ½)| = 2885·2.2307 = 6435`; `sinh 0.01/sinh 1.99 = 0.002786` | ok |

## Dependency check

```
depcheck: 251 roadmaps, 2383 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Suppliers resolved at their current versions: AnalyticNumberTheoryPartI
§0.23 (main, README line 644: `n = ⌊ρ⌋`, `E_n`, degree `≤ n`, `Σ|α|^{−n−1} < ∞`); AutomorphicSpectralTheory §0.5
and §1.6 (open head, earlier in the merge order: line 104 against 105); OperatorTheory/UnboundedOperators §4.8
(main). The declared gap has the same slug, supplier and section in `design/plan.json` and in the README and a
single precise `needs` sentence; its minimality is S01.

## Verified sound

- Declarations read: 19 of 19 (every line of `Suggested.lean`). Single `import Mathlib` (after the `module`
  keyword, as in 71 `Suggested.lean` files on main), no `set_option`, no `lemma`, no sorry'd data, no `#`
  commands, a docstring on every declaration, real bodies on native carriers. Headline theorems named by the
  README (28–34): §1.2, §3.1, §4.4, §5.4–§5.5, §6.5, §6.6 (two), §6.8, §9.6; all nine are stated, none through a
  stand-in, and the module docstring says so. One-tactic probe: none follows from a pinned lemma (the nearest,
  `TauCeti.exists_continuousOn_eq_forall_mem_Icc_eq_picard`, asks `‖M t‖ ≤ K` almost everywhere); no padding.
- Targets read: 55 of 55 (README lines 1–2623, every line).
- Library citations: about 100 declarations checked at the pinned Mathlib and Tau Ceti for name, file and line (all
  match); statements read for the two declarations of the round-1 repair and for the Carathéodory theorem.
  Duplication by object: the pinned Tau Ceti has no half-plane Hardy space, Fatou theorem, Paley–Wiener space,
  outer function, de Branges space or integrable-coefficient Carathéodory theorem (`Analysis/ODE/ScalarLinear.lean`
  is the constant scalar case, `Analysis/Complex/Conformal/RadialLimit.lean` needs an integrable derivative,
  `Analysis/Fourier/Hardy/` is the disc).
- Locators verified in this pass: 24 against the cached texts (poltoratski2024 11, romanov2014 8, mauth2022 2,
  mnatsakanyan2022 2, denisov2026 1); each holds the statement it is cited for.
- Checks: all Check bullets read; about 70 recomputed (tables above); none false, vacuous or a restatement;
  every definition has at least three.
- Sibling citations checked: 7 (the three suppliers; AsymptoticExpansions §10.1, StochasticCalculus S6.5,
  OperatorTheory/ToeplitzOperators Layers 2–5, AutomorphicSpectralTheory §1.6 as comparisons). Ownership by
  object, searched on main and at the open heads with `roadmaps grep`: de Branges, Weyl function, limit point,
  Paley–Wiener, outer and inner functions, Fatou and nontangential, half-plane Hardy space, Carathéodory and
  Grönwall with integrable data, non-linear Fourier, Szegő condition, Hermite–Biehler, Liouville and Dyson. No
  second owner (StochasticCalculus's signed Grönwall, line 2958, has a constant kernel). `roadmaps resolve`
  leads (10 names) are this file's own structure fields and namespace declarations. No fully qualified name
  of `Suggested.lean` occurs in another roadmap.
- Policy: the pull request changes only the package folder; no pull-request numbers or process narrative in
  the README or docstrings; no machine paths; every target has a locator.

## Not verifiable

- garnett2007 (uncertified), coddingtonlevinson1955, debranges1968, remling2018, krein1955 (waived): locators
  not read.
- The estimates of §8.2–§8.4, §8.7 and §9.3 (universality, the Rouché step, the covering argument): every
  displayed identity and constant was recomputed and each step's inputs were checked, but a line-by-line
  verification is the size of the source's proof.
- Numerical Checks obtained by quadrature or ODE integration for non-constant potentials (§3.1, §4.1, §4.5,
  §6.4, §9.2): not rerun; the closed-form Checks beside them were.
- poltoratski2024 was read from an OCR text; displayed formulas are partly garbled and were matched on labels
  and prose.
- Ownership against the open pull requests was checked with `roadmaps grep` on the objects listed above, not by
  reading every sibling checkout.

Source independence: 15 passages compared with 5 sources, none shared beyond formula-forced statements; largest share poltoratski2024, 71 of 190 locators; contents compared with poltoratski2024 (§§1–9 and appendix, line 102–125): independent (Layer 3 ↔ §1 and part of §2, Layers 4–5 ↔ §5 placed before Layer 6 ↔ rest of §2, Layer 7 ↔ §§3–4, Layer 8 ↔ §§6–8, Layer 9 ↔ §9; the order §8.2 → … → §8.8 is forced by their `*Needs:*` lines); garnett2007 and the four waived books could not be read.

## Source issues

- **Misprint** in poltoratski2024 at (5.5), §5, line 545–547: the source says the `L¹(ℝ)` norm of `log|a(t, ·)|` equals the squared `L²(0, t)` norm of the potential; it should be `π/2` times that norm in its normalisation; affects a stated result.
- **Misprint** in mauth2022 at (4), §1, line 206–210: the source says the same identity with constant one, and half the `L¹` norm of `log(1 − |f†|²)` equal to the squared norm; it should carry the factor `π/2`; affects a stated result.
- **Misprint** in poltoratski2024 at Lemma 8, (8.5), line 1131–1138: the source says the matched forms at `s` keep the factor `γ(ty)` of the hypothesis; it should be `γ(ty′)`, which the determinant identity (2.2) forces when `y′ ≠ y`; affects the proof.
- **Gap** in poltoratski2024 at Lemma 9, line 1350–1352: the source says the statement holds for the longest subinterval of the dyadic interval with a zero in the box; its proof uses Lemma 8, which asks `1 < ty` (line 1127), so the times must be restricted to zeros below height `−1/t`; affects the proof.

## For the human reviewers

- **Scope.** §9.6 is conditional on resonance-free points; poltoratski2024 Theorem 1 (Ann. of Math. 199, line 578–581) is unconditional. README 136–145 declines it, citing the preprint mnatsakanyan2022 (line 9–13, 133–138) on an earlier arXiv version.
- **Scope.** README 142–145 and 2592–2596 assert that the comparison in §9 of the published proof does not determine the motion of a resonance (§9.4, fourth Check). This pass recomputed the Check's numbers but did not assess the published proof.
- **Scope.** §8.8, §8.9 and §9.1–§9.3 feed no final target of this roadmap (§9.5–§9.6 need §8.7 and §9.4); README 2585–2586 names a future proof that almost every point is resonance-free as their consumer.
- **Licence.** poltoratski2024 was read as OCR of arXiv version 14; mauth2022, an unrefereed arXiv text, carries 54 of the README's 190 source mentions.
- **Not tested.** garnett2007 (10 mentions, paywalled) and the four waived books were not read; `Suggested.lean` was not compared with public formalisations outside the pinned libraries.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "47f14217c05874fa859836dcd5f91ba29bfadfe4", "job": "RT-DiracScatteringAndNonlinearFourierTransform~2a", "model": "fable", "worker": "chris-x29"} -->
