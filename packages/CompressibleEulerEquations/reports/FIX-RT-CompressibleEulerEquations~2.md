# FIX-RT-CompressibleEulerEquations~2: repair of red-team round 2 (passes a and b)

Ten findings: one P2 and nine P3. Where the two passes overlap, a single section settles them.
I checked every finding against the pinned Tau Ceti files, the cached source texts and the
README's own statements, and all ten hold. Two repairs differ from the wording the reviewers
proposed (said below). `Suggested.lean` is unchanged: no finding touches a Lean statement.

## RT-CompressibleEulerEquations~2a/F01, RT-CompressibleEulerEquations~2b/F04 (P3) — applied

Verified at the pin: `TauCeti/Analysis/Sobolev/Wkp/LineDeriv.lean:156,267,287` and
`Wkp/ContDiffRepresentative.lean:101`, `WeakDeriv/Classical.lean:145`. Added two "From Tau Ceti"
bullets (`packages/CompressibleEulerEquations/README.md:322-340`). Scope `:69`: "six" → "nine
special cases", adding the interior `Cʲ` embedding. §4.1 bullet and *Needs*: the induction
through `exists_value_eq_iff_…`. §4.2 route and *Needs*: `exists_contDiffOn_ae_eq` gives the
regularity, and `toZeroAtInfty` gives the bound and the decay.

## RT-CompressibleEulerEquations~2b/F03 (P3) — applied

Verified: `Circle/Derivative.lean:83,98,195`. Circle bullet (`README.md:424-450`): "three" →
"five special cases", plus a sentence on the derivative and the `C^j_b` embedding for
`2k > 1 + 2j`. Dropped the embeddings from the list of differences. Updated the §4.2 *Needs*
note and the Scope count (nine, with 2a/F01).

## RT-CompressibleEulerEquations~2a/F02, RT-CompressibleEulerEquations~2b/F05 (P3) — applied

§3.3 gains three causal-past Checks (`README.md:1072-1089`): the constant-field formula (excludes
the chronological and strict models), the slit half-space (excludes "past in `𝔐` ∩ D"), and the
punctured half-space (not compact, `p ∉ D⁺`). §6.1 gains the compactness and periodicity
non-examples of a lens function (`:1875-1882`).

## RT-CompressibleEulerEquations~2a/F03, RT-CompressibleEulerEquations~2b/F02 (P3) — applied differently

§5.4's "bounds of §5.3 hold uniformly in ε by Friedrichs' lemma" → the direct computation with
`A^μ(t, x)` and `B` (`README.md:1731-1750`), inverting at `Ā⁰`, or at a value of `A⁰` for
full-rank `Λ` (pass b's caveat). *Needs*: "§§4.1–4.4 …, §5.1", not pass a's "§5.3
(computation)": the route no longer uses §5.3, and never used §5.2.

## RT-CompressibleEulerEquations~2a/F04 (P3) — applied

ChristodoulouMiao2014 lines 872–878 claim uniqueness on all of `D₁ ∩ D₂`. §6.2
(`README.md:1915-1917`) now says this and names the hypothesis `J⁻_D(p) ⊆ O` it adds. Same
pattern in §8.1 (`:2243`): "lines 864–880" became "lines 864–872 for developments, and lines
872–880, which assert … compatible, false … by §8.2". §8.2 already says it.

## RT-CompressibleEulerEquations~2a/F05 (P3) — applied

`sources.toml`: added "Downstream consumers" to the `cited_for` of ChristodoulouMiao2014,
Christodoulou2019, AbbresciaSpeck2022, LuoYu2023a and LuoYu2023b. Christodoulou2007
`locator` "Ch. 1–2" → "Ch. 1", the only chapter the README cites (§8.1, Downstream consumers,
References). A section-by-section scan of every other key found no further mismatch.

## RT-CompressibleEulerEquations~2b/F01 (P2) — applied

§4.3 *Commutators* (`README.md:1290-1303`): hypotheses are now Λ-periodic `f` with
`∇f ∈ L^∞ ∩ Hᵏ⁻¹_Λ`, and `g ∈ L^∞ ∩ Hᵏ⁻¹_Λ`. `[∂^α, f]g` is the Leibniz sum over `0 < β ≤ α`,
with a Hölder–GN–Young route at order `|α| − 1`. §5.3 (`:1663-1667`) centres at `Mⁱ(Ū)`. New
Check at `:1332-1338`.

## Checks run

- Elaboration: `lake env lean packages/CompressibleEulerEquations/Suggested.lean` (from the
  content checkout) gives exit 0, with 15 warnings "declaration uses `sorry`" (lines 256, 277, 299,
  334, 356, 390, 425, 440, 451, 464, 493, 506, 523, 542, 559) and no error. The file is unchanged
  in this round.
- `#check @name` pass: one scratch file, `Suggested.lean` followed by `#check @…` for all 37
  declarations, elaborated once. The 37 printed types are identical, after whitespace
  normalisation, to the worker's elaborated signatures, so no binder is lost and nothing changed.
- Dependency check (command of the brief), verbatim:

      depcheck: 251 roadmaps, 2381 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name of this
  roadmap that cannot be resolved. The resolver does not check Tau Ceti names on this host, so
  each new `TauCeti.*` name was read at the pin with its namespace:
  - `TauCeti.Wkp.exists_contDiffOn_ae_eq`: `namespace TauCeti`/`Wkp`, line 101.
  - `TauCeti.HasWeakFDerivOn.contDiffOn_succ`: Classical.lean:145.
  - The three `TauCeti.Wkp.…LineDeriv…` lemmas: `namespace TauCeti`, lines 156, 267, 287.
  - `TauCeti.CircleSobolev.derivative`, `norm_derivative_le` and `hasDerivAt_toContinuousMap`:
    `namespace TauCeti`/`CircleSobolev`, lines 83, 98, 195.
  - `TauCeti.CircleSobolev.norm_toContinuousMap_le`: Circle/Basic.lean:831.
- No machine path occurs in the README or in `sources.toml` (searched).

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Commutator, §4.3 (new hypotheses) | `Λ = 0`, `n = 1`, `k = 2`, `α = 2`, `f = 1 + e^{−x²}`, `g = e^{−x²}` | `[∂², f]g = (12x² − 2)e^{−2x²}`. LHS² `= 144·(3√π/128) − 48·(√π/16) + 4·(√π/2) = (19/8)√π = 4.2096`, so LHS `= 2.052`. RHS `= √2e^{−1/2}·√2(π/2)^{1/4} + 2(π/2)^{1/4}·1 = 1.358 + 2.239 = 3.597` | holds with `C = 1` |
| Commutator, `m = 0` | `|α| = 1`: `[∂ᵢ, f]g = ∂ᵢf·g` | `‖∂ᵢf g‖ ≤ ‖∇f‖_∞‖g‖_{L²}` | no GN needed; `k ≥ 1` required |
| Commutator, Hölder exponents | `i + j = m`, `0 < i, j < m` | `i/(2m) + j/(2m) = 1/2`; GN exponents `1 − i/m = j/m`, `1 − j/m = i/m` | product `= (‖F‖_∞‖g‖_{Hᵐ})^{j/m}(‖F‖_{Hᵐ}‖g‖_∞)^{i/m}`, Young closes |
| Commutator, constant shift | `f ↦ f + c` | every term contains `∂^βf` with `β > 0`, so the change is `0` | invariant, as used in §5.3 and §5.4 |
| "`f − f̄ ∈ Hᵏ_Λ` suffices" | `2k > n + 2` versus `k = 1`, `n = 2` | `∇f ∈ Hᵏ⁻¹_Λ ⊆ L^∞` needs `2(k − 1) > n`. For `k = 1`, `n = 2` it fails, so the clause is restricted to `2k > n + 2` | restricted |
| §5.3 commutator | Burgers, `Λ = 0`, `Ū = 1`, `U = 1 + e^{−x²}`, `W ∈ H²` | `M¹(U) − M¹(Ū) = e^{−x²} ∈ L^∞ ∩ H²`; `∂ₓW ∈ H¹ ⊆ L^∞`; bound `C(‖U_x‖_∞‖W‖_{H²} + ‖U − 1‖_{H²}‖W_x‖_∞)` | hypotheses met |
| §5.4 uniform estimate | pass a's witness: `A⁰ = 1`, `A¹ = |t − 1/2|`, `B = 0`, `Λ = 2πℤ`. Pass b's witness: `A¹ = 0`, `B = sin x` | `∂ₓA¹ = 0`, `∂_tA⁰ = 0` and all commutators `0`, so `dE_k/dt = 0`. `∂_tW = −sin x·W`, so `dE_k/dt ≤ C(‖sin x‖_{Hᵏ_Λ})E_k` | estimate holds; neither operator is of §5.3's form |
| §5.4 inversion centring | `Λ = 2πℤ` (full rank), `Ā⁰ = 0`, `A⁰ = 1` | `0` is not invertible, so centring at `Ā⁰` is impossible; centring at `A⁰(t, x₀) = 1` works, since constants lie in `Hᵏ_Λ` | caveat stated |
| §5.4 inversion, `Λ = 0` | `A⁰ = Ā⁰ + a(x)`, `a ∈ Hᵏ`, `A⁰ ≥ λ₀` | `a(x) → 0` as `|x| → ∞`, so `Ā⁰ ≥ λ₀I` and `Ā⁰ ∈ K` | centring at `Ā⁰` is valid |
| Principal term, §5.4 | symmetric `Aⁱ`, `V = J_ε∂^αW_ε ∈ H¹_Λ` | `∂ᵢ⟨AⁱV, V⟩ = ⟨(∂ᵢAⁱ)V, V⟩ + 2⟨Aⁱ∂ᵢV, V⟩`, integral over `F` is `0` | `= −½∫⟨(∂ᵢAⁱ)V, V⟩` |
| `causalPast`, constant field | `(1, 0)`, `p = (1, 0)`, `D = H₀` | `(0, 1)`: `|1| ≤ 1 − 0` ✓. `(0, 1.1)`: `1.1 > 1` ✗. `p`: one-point `J`, a null set, so the a.e. clause is vacuous ✓. Strict model: `∫₀¹|ẋ| < 1` excludes `(0, 1)` | as stated |
| `causalPast`, slit domain | `D = H₀ \ ({1/2} × [−1, 1])` | `|x(1/2)| ≤ 1/2` would lie in the slit, so `J ⊆ (1/2, 1]`; `(0, 0)`: in `D`, in the cone of `p` in `𝔐`, not in `J⁻_D(p)` | as stated; `p ∉ D⁺_D(Σ₀)` via `x ≡ 0` |
| `causalPast`, punctured | `D = H₀ \ {(1/2, 0)}` | `(0, 0)` via `(1/2, 1/4)`: slopes `0.25/0.5 = 1/2` twice ✓. `(1/2 − δ, 0)` via `(1/2, η)`, `η ≤ δ` ✓. The set misses `(1/2, 0)`, a limit point, so it is not compact | as stated; `p ∉ D⁺_D(Σ₀)` |
| `IsLensFunction`, compactness | `Λ = 0`, `φ = 1 − t` on `[0, 2] × ℝ` | `{φ > 0} = [0, 1) × ℝ` in no compact set, so no `K` exists. Solutions `(0, x)`, `(g(t + 1/x), x)`: at `t = 0`, `1/x < 0`, so `g = 0`; at `(0.9, −10/3)` the argument is `0.6 ∈ (1/2, 1)` | non-example; needed for `eqOn_lens` |
| `IsLensFunction`, periodicity | `Λ = 2πℤ`, `R − |x − x₀| − Mt`, `t = 0` | values `R` and `R − 2π` | not periodic, so not a lens function |
| Interior `Cʲ` embedding at `Λ = 0` | `2k > n + 2j`, `k₀ = k − j` | `2k₀ = 2k − 2j > n`, `k₀ + j = k`; `n = 1`, `k = 2`, `j = 1`: `2·1 > 1` | matches the pinned hypothesis |
| §4.2 bound via `toZeroAtInfty` | `|α| ≤ j` | `2(k − |α|) ≥ 2(k − j) > n` | each `∂^αu` is in range |
| Circle `C^j` embedding | `t = k`, `j` derivatives | at step `i` need `k − i − 1 > 1/2` for `i ≤ j − 1`, i.e. `2k > 2j + 1`; `k = 2`, `j = 1`: `s = 1 > 1/2`, `t = 2` | matches `2k > n + 2j` with `n = 1` |
| Circle derivative ⇄ §4.1 `∂ᵢ` | `fourier m` on `AddCircle T` | `d/dx e^{2πimx/T} = (2πim/T)e^{2πimx/T}`, norm `≤ 2π/T` | the case `Λ = Tℤ` |
| LineDeriv ⇄ `IsWeakDerivFamily` | `k = 1`, `n = 1`, `u = e^{−x²}` | family `(u, −2xe^{−x²})`, both in `L²`; the pinned lemma with `k = 0` gives the `W^{1,2}` element | consistent |
| Scope count "nine" | listed items | `ℝⁿ`: product, chain rule, interpolation, interior `Cʲ` (4). Circle: representatives, algebra, holomorphic action, derivative, differentiability (5) | `4 + 5 = 9`; circle bullet `5` |

## Ownership and suppliers

No construction was added. The commutator estimate was already this roadmap's (§4.3), and the
new contract bullets cite pinned Tau Ceti declarations without restating them. No supplier gap
is needed (`design/plan.json` keeps `"gaps": []`). No cross-roadmap citation changed.

## For the maintainer

- No Lean name, section, layer or target id changed, so no other roadmap's citation is affected.
- The §4.3 commutator estimate now has weaker hypotheses than before: `∇f` instead of `f` in
  `L^∞ ∩ Hᵏ_Λ`, and `g ∈ Hᵏ⁻¹_Λ`. Any later roadmap citing it gets the stronger statement.
- No source was fetched. No text is missing, and `needs-references.toml` was not written.
