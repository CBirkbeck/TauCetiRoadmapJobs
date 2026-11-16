<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18040#issuecomment-6907556453 -->
Red team round 1 pass b (claude) of 7aacc70

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Romanov's system differs by the sign of the spectral parameter as well as of `Q`

   Location: `packages/DiracScatteringAndNonlinearFourierTransform/README.md:151-152`, "This is
   Romanov's `JX′ + QX = λX` (romanov2014 line 231) and Denisov's `D = J d/dr + Q` with `J = Ω`
   (denisov2006 line 4245–4258) up to the sign of `Q`."

   Claim: both source systems are the present `ΩX′ = zX − Q_q X` up to the sign of `Q`.

   Witness: romanov2014 line 160–164 sets `J = [[0, −1], [1, 0]] = −Ω`. With `Q = 0`, `λ = z`,
   `JX′ = λX` gives `X′ = ΩzX`, solution from `(1, 0)`: `(cos tz, −sin tz) = Θ(t, −z)`, not `Θ(t, z)`.
   For Denisov (`J = Ω`, line 4253–4258) the sentence is right.

   Repair (replace the sentence; tested on the witness, `λ = −z` gives `(cos tz, sin tz) = Θ(t, z)`):

   > This is Denisov's `D = J d/dr + Q` with `J = Ω` (denisov2006 line 4245–4258) up to the sign of
   > `Q`. Romanov's `JX′ + QX = λX` (romanov2014 line 231) has `J = [[0, −1], [1, 0]] = −Ω`
   > (line 160–164), so it is the present system for `Q = −Q_q` and `λ = −z`, the dictionary given
   > below for OperatorTheory/UnboundedOperators §4.8; identities quoted from romanov2014 ((12), (15),
   > (16), Theorems 15–16) are restated here in the present `z`.

2. **F02** (P3) §2.5 route applies the pinned Jensen bound outside its hypothesis

   Location: `packages/DiracScatteringAndNonlinearFourierTransform/README.md:933-939`, "Uniqueness and
   the logarithmic bound transport Tau Ceti `TauCeti.eqOn_const_ball_of_tendsto_circleMap` and
   `AnalyticOnNhd.le_circleAverage_log_norm` through the Cayley transform".

   Claim: the pinned Jensen bound gives `log|F(i)| ≤ P[log|F*|](i)` and `log|F*| ∈ L¹(Π)` for a bounded
   holomorphic `F` on `ℂ₊`.

   Witness: at the pin, `AnalyticOnNhd.le_circleAverage_log_norm` (`TauCeti/Analysis/Complex/RadialUniqueness.lean`
   line 76) asks `AnalyticOnNhd ℂ f (closedBall c |r|)`. The Cayley image of `F = e^{−i/z}` (README's own
   Check, line 950) is analytic on the open unit disc only, with an essential singularity at `ζ = 1`.
   `MeasureTheory.lintegral_liminf_le` is not in §2.5's *Needs*.

   Repair: after "Jensen's bound is stated at the centre of the disc." insert

   > It is applied on the circles of radius `r < 1`, where the transported function `g` is analytic on
   > the closed disc: `k log r + log|τ| ≤` the circle average of `log|g|` at radius `r`, with `k` the
   > order of `g` at `0` and `τ` its trailing coefficient. As `r → 1`, `log⁺|g(rζ)| ≤ log⁺ sup|F|` and
   > `g(rζ) → g*(ζ)` for almost every `ζ` (§2.4 through the Cayley comparison of §2.1), so Fatou's lemma
   > for `log⁺ sup|F| − log|g(rζ)| ≥ 0` (Mathlib `MeasureTheory.lintegral_liminf_le`) gives
   > `log|τ| ≤ ∫ log|g*| dθ/2π`, hence `log|F*| ∈ L¹(Π)`, and, when `F(i) ≠ 0`, the bound at `z = i`.

   and add `MeasureTheory.lintegral_liminf_le` to the *Needs* line of §2.5 (README 941–945). Tested on
   `F = e^{−i/z}`: `g` is zero-free, `k = 0`, `log|g(rζ)| ≤ 0`, and both sides at `z = i` are `−1`.

3. **F03** (P3) Two supplier-contract entries are consumed nowhere

   Location: `packages/DiracScatteringAndNonlinearFourierTransform/README.md:416-418`
   (`TauCeti.PhragmenLindelof.upper_half_plane_of_isBounded`), `:245`
   (`Besicovitch.ae_tendsto_rnDeriv`), and the scope clause `:84` "the half-plane Phragmén–Lindelöf
   principle for bounded functions".

   Claim: the contracts list what the layers consume ("consumed as listed in the supplier contracts",
   README 77).

   Witness: each name occurs once in the README, in the contract list only. No *Needs* line, route or
   Check names either: §2.7 uses Mathlib `PhragmenLindelof.right_half_plane_of_bounded_on_real`, §2.4
   uses `VitaliFamily.ae_tendsto_rnDeriv`.

   Repair: delete the bullet at 416–418, the clause "the half-plane Phragmén–Lindelöf principle for
   bounded functions," at line 84, and the words "and `Besicovitch.ae_tendsto_rnDeriv`
   (`MeasureTheory/Covering/Besicovitch.lean` line 1077)" at line 245; or name the section that uses
   each in its *Needs* line.

4. **F04** (P3) "Downstream consumers" names a roadmap on main that takes its ODE input from Mathlib

   Location: `packages/DiracScatteringAndNonlinearFourierTransform/README.md:2541-2542`, "PDE §6.2
   (Galerkin systems with coefficients integrable in time) and StochasticCalculus (comparison arguments
   for linear systems): §1.1, §1.2 and §1.7."

   Claim: PDE §6.2 and StochasticCalculus consume §1.1, §1.2, §1.7.

   Witness: `TauCetiRoadmap/PDE/README.md:264` on main assigns "the Galerkin systems of §6.2" to
   "Picard–Lindelöf and Grönwall in `Mathlib/Analysis/ODE/`". Neither PDE nor StochasticCalculus on main
   mentions this roadmap, and a roadmap on main consumes only Mathlib, Tau Ceti and main.

   Repair (replace the bullet):

   > - Evolution equations with coefficients merely integrable in time (Galerkin systems beyond the
   >   continuous-in-time case that PDE §6.2 takes from Mathlib's Picard–Lindelöf theorem) and comparison
   >   arguments for linear systems, in later roadmaps: §1.1, §1.2 and §1.7.

5. **F05** (P3) Scope does not delimit §2.7 from the Paley–Wiener target of an earlier roadmap

   Location: `packages/DiracScatteringAndNonlinearFourierTransform/README.md:1015-1016`, "Paley–Wiener
   theorem: an entire `F` of exponential type at most `t` … whose restriction to `ℝ` is
   square-integrable belongs to `PW_t`", and the ownership list 44–48.

   Claim: this roadmap owns the Paley–Wiener spaces and theorem, with no other owner named.

   Witness: AutomorphicSpectralTheory §1.6 (earlier in the merge order, line 104 against 105) records
   the target `euclidean_paley_wiener`: the Fourier–Laplace transform of smooth functions supported in a
   ball is onto the entire functions with rapid-decay bounds of exponential type. The README's scope
   compares §1.2 with AsymptoticExpansions §10.1 but is silent here.

   Repair: add after the AsymptoticExpansions paragraph (README 122–125)

   > AutomorphicSpectralTheory §1.6 states the Euclidean Paley–Wiener theorem for smooth compactly
   > supported functions (`euclidean_paley_wiener`: rapid decay of every order on an entire function of
   > exponential type). §2.7 is the `L²` theorem on `ℝ`, for densities in `L²(−t, t)` and entire functions
   > of exponential type square-integrable on `ℝ`; `2 sin(tz)/z ∈ PW_t` is the transform of an indicator,
   > which the smooth theorem excludes, and neither statement contains the other. This roadmap uses only
   > its own.

   Tested on the instance: `2 sin(tz)/z` is `O(1/|x|)` on `ℝ`, so it fails the rapid-decay clause and
   lies in `PW_t` (§2.7 first Check). No declaration name is shared.

Five findings, all P3. No statement of `Suggested.lean` and no bold README target was refuted by an
instance; every sibling citation resolves; every cited pinned declaration exists at the cited file
and line. The package was read whole (README 2587 lines, `Suggested.lean` 258 lines); nothing in the
checkout was edited and no Lean was run.

## Verified sound

Counts: 19 declarations read (all of `Suggested.lean`); 55 README sections read with every target and
API block in them (Layers 1–9); 53 source locators verified against the cached texts; 60 Checks
recomputed by hand or numerically; 7 sibling citations resolved; 105 pinned declarations checked for
name, file and line, 24 of them read for their hypotheses.

Dependency check (the command of the brief):

```
depcheck: 246 roadmaps, 2298 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` shows only the package
folder (README, Suggested.lean, design/plan.json, metadata.toml, the package report).

Sibling citations, each read where it is cited: OperatorTheory/UnboundedOperators §4.8 (UO-D07) on
main (`Ju′ + V(r)u`, `J = [[0, −1], [1, 0]]`, locally integrable Hermitian `V`, endpoint
classification planned without a displayed alternative: matches the declared gap
`gap:dirac-weyl-alternative`, same slug, supplier and section in `design/plan.json` and README
488–493; precise and single); AutomorphicSpectralTheory §0.5 at its open head (triple `a = Re F(i)`,
`b ≥ 0`, `dν = (1 + t²)dρ`); AnalyticNumberTheoryPartI §0.23 on main (`n = ⌊ρ⌋`, `E_n`, degree
`≤ n`); AsymptoticExpansions §10.1 on main (continuous kernel, separable bound);
StochasticCalculus S6.5 on main; OperatorTheory/ToeplitzOperators Layers 2–5 on main; PDE §6.2 on
main (R04). Ownership by object (grep of main, of the open heads and of the pinned libraries for
Carathéodory with integrable coefficient, half-plane Hardy space, nontangential limits, Fatou, outer
functions, de Branges, Hermite–Biehler, Weyl function, limit point): no second owner; the nearest
pinned statements (`TauCeti/Analysis/ODE/Caratheodory.lean` essentially bounded,
`ScalarLinear.lean`, `Inhomogeneous.lean`, `Wronskian.lean`, the disc Hardy space) are strictly
more special. No fully qualified name of `Suggested.lean` occurs in another roadmap.

Headline theorems (README 28–34 and the module docstring list the same nine): §1.2, §3.1, §4.4,
§5.4–§5.5, §6.5, §6.6 (two), §6.8, §9.6. All nine are stated, none through a stand-in; the ten
definitions and structure fields have real bodies on native carriers; no `sorry`'d data, no
`set_option`, no `lemma`, single `import Mathlib`. One-tactic probe: none of the nine follows from a
pinned lemma (the nearest, `TauCeti.exists_continuousOn_eq_forall_mem_Icc_eq_picard`, needs
`‖M t‖ ≤ K` almost everywhere, which `P(t) = t^{−1/2}` fails). No padding. Lean against README:
binders compared declaration by declaration with `scratch/signatures.md` (0 lost binders; nothing
changed, so no `#check` run was needed). Note, not a finding: `nonlinear_plancherel` carries `hq`
(integrability on every `[0, T]`) beyond what its conclusion on `[0, t]` uses; it is the README's
standing convention for a potential.

Adversarial pass, values computed:

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| `diracCoeff` = `−Ω(z − Q_q)` | general; `f = c`, `z = 0`; `q = ic` | `Ω(z−Q) = [[−f, z+g], [−(z−g), f]]`; `Θ = (e^{ct}, 0)`; `Θ = (cosh ct, −sinh ct)` | matches |
| Free case, dictionary §4.1 | `q = 0` | `E = e^{−itz}`, `Ẽ = −ie^{−itz}`, `a = 1`, `b = 0`, `EẼ# − ẼE# = 2i` | holds |
| `scatteringA/B` solve §4.1 system | general | `a′ = e^{itz}q(E# + iẼ#)/2 = e^{2izt} q b#` | holds |
| Constant `q` at `z = 0` | `q = c` | `E = cosh + (q/|q|) sinh`, `iẼ = cosh − (q/|q|) sinh`; `a = cosh|c|T`, `b = (c/|c|) sinh|c|T` | holds |
| `nonlinear_plancherel` constant | `q = 1` on `[0, 1]`; `q = 0.5 + 1.2i` on `[0, 0.7]`; `t = 0` | quadrature on `[−4000, 4000]`: `1.570671` vs `π/2 = 1.570796`; `1.858041` vs `1.858252`; `0 = 0` | `π/2`, not the sources' `1` |
| §4.3 half-plane inequality | `q = 1`, `z = ±5i` | `|a(1, 5i)| = 1.0934`; `|a(1, −5i)| = 237.2 < |b| = 2385.5` | holds in closed `ℂ₊` only |
| Christoffel–Darboux, §3.3 | derivative of `M*ΩM`; free | `(z − conj λ) M*M`; `2 sinh 2ty` both sides | holds |
| `exists_nonlinearFourier_plancherel` rate | §5.3 law; `T = 0` | `|q⌃* − ρ₁| = |ρ₂|(1 − |ρ₁|²)/|1 + uρ₂ conj ρ₁| ≤ 2|ρ₂|`, `∫|ρ₂|² ≤ π‖q‖²_{(T,∞)}`; `‖F‖² ≤ π‖q‖² ≤ 4π‖q‖²` | holds |
| §5.3 pseudo-hyperbolic law | `ρ₁ = ρ₂ = 1/2`, `u = 1` | `4/5`; `9/25 = 9/25` | holds |
| `IsSpectralMeasureOf` determines `μ` | free; `2dx`; kernel without `1/π` | `P[dx] = 1 = Im i`; `2 ≠ 1`; `π ≠ 1`; `β = lim u(iy)/y` | determines `(β, μ)` |
| Weyl disc, §6.4 | free; `f = 1_{[0,1]}`, `z = i` | radius `1/sinh 2ty`; `m(i) = i/(1 + √2 tanh √2) = 0.4432i` | holds |
| §6.5 Checks | `f ≡ 1` | `m(i) = i(√2 − 1)`; `|E(T, 2)|² ∈ [2/3, 2]`, mean of `1/|E|²` is `√3/2` | holds |
| `spectralMeasure_unique` | `ν = 2dx` free | `2‖F‖² ≠ ‖F‖²`; equality on `F conj G`, `F, G ∈ ⋃PW_t`, is equality of tempered measures | holds |
| `szego_condition` constant | truncation; barrier `c = 0.7`, `T = 1.3` | `log w_T ≥ −2 log 2 − 2 log|a|`, `∫ log|a| dΠ ≤ (π/2)‖q‖²`; `(1/π)∫ log w dΠ = 2T − 2 log 5.8076 = −0.9184` | holds |
| §6.7 entropy formula | `ν = 2σ`; `νₙ` | `1 − log 2`; `log 2`; bound `0.158293` | holds |
| §7.2 radius | `b_{10i}` | `0.2, 0.16, 0.1`; `(√(1+ε) + 1)/ε < 3/ε` | holds |
| §8.6 normalisation | zero `z₀` | `D(conj z₀, z₀) = 2i|β|²`, `K_t(z₀, z₀) = |β|²/(πy)`, `2|β|²w ≈ sinh 2ty` | holds |
| §8.7 two-term form | `M = diag(2, 1/2)` | `a = 1.25`, `b = 0.75`, zeros at height `½ log(5/3) = 0.2554`, `0.9284` | holds |
| §8.9, §9.2 identities | determinant; `a_{t₁→t₂}` | `i|κ|² sinh 2ty′`; `2i sinh 3.04/sinh 3 = 2.0820i`, `2i sinh 3.2/sinh 3 = 2.4448i`; `sinh(2ε₂ + 2υ) sinh 2υ/N² = 1` | holds; `γ(ty′)` forced |
| §9.4 `Ω`-conjugation | general | `ΩQΩ⁻¹ = −Q`; `E_{−f} = iẼ_f`, `Ẽ_{−f} = −iE_f`, `m_{−f} = −1/m_f` | holds |
| §9.4 `f ≡ c` Check | `c = 1`, `t = 5`; `s = 1/2`, `t = 10` | zero of `Ẽ` at `−2e^{−10} i = −9.08·10⁻⁵ i`; `|E| = 6433` | holds |
| `tendsto_truncation_of_isResonanceFree` | free; compact support; limit constant | `β = −i`, limit `0`; `|1/√w + iβ/√w̃|² = 1/w + 1/w̃ + 2 > 0`, so `a ≠ 0` on the disc | holds |
| `IsResonanceFree` junk | `t ≤ 0` | `C/t < 0` empty box; `t = 0`: `E = 1`, `Ẽ = −i` | no spurious case |
| `linear_caratheodory` | `a = b = t₀`; `P = t^{−1/2}`; `P = 1/t` | `Y(t₀) = y₀`; `y₀e^{2√t}`; excluded by `hP` | holds |
| §2.1–§2.8 Checks | as listed in the README | `1/(5π)`; `1/3` twice; ratio sup `2.618 < 3`; `0.352`; `‖1/(z+i)‖² = π`; `O_h(i) = 2` | all hold |

Source independence: 14 passages compared with 8 sources, none shared beyond formula-forced statements; largest share poltoratski2024, 71 of 188 source mentions; contents compared with poltoratski2024 (§§1–10): independent — Layers 3–6 split and reorder its §§1, 2, 5, Layer 7 merges §§3–4, Layer 8 merges §§6–8, and the order of §8.2–§8.8 is forced by their *Needs* lines (each needs its predecessor); waived and uncertified texts (garnett2007, coddingtonlevinson1955, debranges1968, remling2018, krein1955) could not be read.

## Not verifiable

- Locators into `garnett2007` (uncertified), `coddingtonlevinson1955`, `debranges1968`,
  `remling2018`, `krein1955` (waived): no text in the cache; cited by locator only.
- Numerical Checks needing an ODE solver for a non-constant potential (README 1151–1152, 1208,
  1262–1266, 1270–1272, 1293–1295, 1361–1362, 1485–1488, 1536–1537, 1688–1693): not recomputed; the
  constant-potential Checks beside them were.
- The proof routes of §8.2–§8.4 and §9.3 (the universality and Borel–Cantelli arguments) were checked
  for their inputs and for the algebra of each displayed identity, not line by line as proofs.
- Formulas in `poltoratski2024` were read from an OCR text; displayed equations are partly garbled
  (for example line 484–489, 1402–1413), so locators were matched on statement labels and prose.
- Ownership against open pull requests was checked through `roadmaps grep` and the heads named above,
  not by reading all 240 sibling checkouts.

## Source issues

- **Error** in poltoratski2024 at (5.5), §5, line 545–548: the source says the `L¹(ℝ)` norm of `log|a(t, ·)|` equals the squared `L²(0, t)` norm of the potential; it should be `π/2` times that norm in its normalisation; affects a stated result.
- **Error** in mauth2022 at (4), §1, line 206–210: the source says the same identity with constant one, and half the `L¹` norm of `log(1 − |f†|²)` equal to the squared norm; it should carry the factor `π/2` in both identities; affects a stated result.
- **Misprint** in poltoratski2024 at Lemma 8, (8.5), line 1131–1138: the source says the matched forms at `s` keep the factor `γ(ty)` of the hypothesis; it should be `γ(ty′)`, which the determinant identity (2.2) forces when `y′ ≠ y`; affects the proof.

## For the human reviewers

- **Scope.** README §9.6 is conditional on resonance-free points; poltoratski2024 Theorem 1 (Ann. of Math. 199; line 578–581) is unconditional. README 127–142 declines it, citing the preprints mnatsakanyan2022 (line 9–13) and denisov2026 (line 211–212).
- **Scope.** README 2559–2560 and §9.4's fourth Check assert that the comparison in §9 of the published proof (poltoratski2024 line 1482–1533) does not determine the motion of a resonance. This pass did not verify or refute that assertion.
- **Licence.** `mauth2022`, `romanov2014`, `taothiele2012`, `denisov2026` and `mnatsakanyan2022` are cited by arXiv identifier only (README References 2562–2579); `mauth2022` carries 54 of the README's 188 source mentions.
- **Not tested.** `Suggested.lean` was not compared with public formalisations outside the pinned libraries (no search was made); no resemblance is known.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7aacc703c85a275dd00e6fd8822d1f83c7cfdf08", "job": "RT-DiracScatteringAndNonlinearFourierTransform~1b", "model": "fable", "worker": "chris-x30"} -->
