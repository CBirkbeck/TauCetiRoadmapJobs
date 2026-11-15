<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13760#issuecomment-6900681351 -->
Review (claude) of a8c0325

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §3.2 limit curves: the case `a′ = a` with `a ∉ J` is left open, and §3.3 uses it

   **Location:** `packages/CompressibleEulerEquations/design/README.md`, §3.2, bullet *Limit curves*:
   "a subsequence converges uniformly on compact subsets of an interval `J ∋ t_p` with
   `inf J = a′ ≥ a` to a causal curve `x` ending at `p`, and if `a′ > a` then `x` is
   past-inextendible in `D`"; the same clause in plan target 3.2.3.

   **Claim:** the statement is what the routes of §3.3 (*Compact pasts*, "a sequence of points of
   `J⁻_D(p)` that … converges outside `D` yields, by the limit-curve statement of §3.2, a
   past-inextendible curve") and *Openness* need.

   **Witness:** `n = 1`, field `(1, 0)`, `t₀ = 0`, `D = H₀ \ {(1, 0)}` (a domain),
   `x_m ≡ 1/m` on `[1, 2]`, `p_m = (2, 1/m) → p = (2, 0)`, `a_m = a = 1`. The limit is `x ≡ 0` on
   `J = (1, 2]`: `a′ = 1 = a`, so the clause "if `a′ > a`" is silent, yet the endpoints
   `(1, 1/m)` converge to `(1, 0) ∉ D`.

   **Exact repair:** in §3.2 and plan 3.2.3 replace the last clause by: "…to a causal curve `x`
   ending at `p`, where `J` is the largest such interval in `[a, t_p]`; if `a ∈ J` then
   `x_m(a_m) → x(a)` along the subsequence, and if `a ∉ J` (in particular if `a′ > a`) then `x` is
   past-inextendible in `D`". Tested on the witness: `a = 1 ∉ J` and `x ≡ 0` on `(1, 2]` has the
   past limit `(1, 0) ∉ D`, so it is past-inextendible, misses `S = Σ₀`, and `(2, 0) ∉ D⁺_D(Σ₀)`,
   as the compact-pasts route needs. On `D = H₀` with the same curves: `J = [1, 2]`, `a ∈ J`,
   `x_m(1) = 1/m → 0 = x(1)`. The repaired clause holds in general: if `x` had a past limit `q ∈ D`
   at `inf J`, the field is bounded by some `L` on a ball `B(q, r) ∩ H_{t₀} ⊆ D`, the `x_m` stay in
   it for a time `r/(2L)` below `inf J + η` (down to `a_m`), and Arzelà–Ascoli extends the
   convergence, against the maximality of `J`. The theorems of §3.3 are unchanged.

One finding, P3 (a case the limit-curve statement of §3.2 leaves open and its consumer §3.3 uses);
no P1 or P2. Both findings of round 12 are repaired. R01 carries an exact repair, so the verdict
asks for changes: a fix round applies R01, and nothing else is to repair. No supplier gap is
declared (`gaps: []` in `packages/CompressibleEulerEquations/design/plan.json`). This review
changed no file of the design and did not touch the manifest.
Elaboration: not available (this lane does not elaborate); the design stage has no
`Suggested.lean`, so the one-tactic probe and the `#check` comparison had nothing to run on. No
maintainer note was left for this roadmap. No text read contained instructions.

## Verified sound

### Round-12 findings, checked first

| Round-12 finding | Repaired passage (present README) | Disposition |
|---|---|---|
| F01 (P3) §7.1 continuous dependence did not keep the approximating data in the class of the existence interval | §7.1: "if `U₀^m → U₀` in `Ū + Hᵏ_Λ`, where each `U₀^m` takes values in `K` and satisfies `‖U₀^m − Ū‖_{Hᵏ_Λ} ≤ M`, the solutions of the `U₀^m`, which exist on `[0, T]` by the existence clause, converge to `U`"; plan 7.1 agrees; new Check and plan test `existence_time_depends_on_norm` | **Repaired.** |
| F02 (P3) the supplier's speed cited at §1.2, defined in its Conventions | Supplier contracts: "Conventions, *Propagation speed*: its notion of a speed `c ≥ 0` … (§1.2 gives the existence of one when the `Aʲ` are bounded)"; §5.2: "in the sense of SymmetricHyperbolicSystems' Conventions"; §5.2 *Needs:* and plan `suppliers` (`sections` has "Conventions") agree | **Repaired.** Read at the supplier's head: Conventions paragraph *Propagation speed* has the quoted formula for all `(t,x)`, `‖ω‖ ≤ 1`; §1.2 has the bullet "A speed exists when the `Aʲ` are bounded" with `√n M / λ`. |

Passages the repairs changed or added: the §7.1 continuity bullet and its Burgers scaling Check;
the §7.2 statement (uniform `T`, the class with bound `M`, continuity, the full-system sentence),
its route (`K`, `C′`) and *Needs:*; the two supplier bullets; the §5.2 comparison sentence and
*Needs:*; plan 5.2, 7.1, 7.2 and the supplier entry. All recomputed below; README and plan agree.

Repaired patterns searched in the rest of the text. (i) A convergence or uniformity claim whose
objects are not kept in the class that gives the common interval: §7.3 (`T` depends on the stated
list and the sup-bound `M`; no continuity clause), §8.3 (existence only), §5.4 (linear, on the
given `[0, T]`), §4.3 (continuity of `u ↦ Φ(u)` on `u` with values in the fixed `K`): none further.
(ii) A supplier notion cited at a section that only uses it: every other supplier citation was
opened at the head (list below): none further.

### Adversarial table

Recomputed by hand this round; coordinates `(t, x)`. Rows cover the repaired passages, the
fifteen sampled sections, the sections the round-12 table had no row for (§1.1, §3.3, §4.2,
§5.3), the headlines and the target of R01.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §7.1 continuity (repaired) | `G = ℝ`, `Ū = 0`, `K = [−1, 1]`, `‖U₀‖ = M`; `(1 ± 1/m)U₀`; `K = {Ū}` | norm `M(1 + 1/m) > M`: excluded; `M(1 − 1/m) ≤ M`, values in `K`: on `[0, T(M, K)]`; only datum `Ū`, constant solution | sound |
| §7.1 Burgers scaling Check (new) | `u₀^λ = −e^{−λ²x²}`, `λ = 1, 10` | `u₀′ = 2λ²x e^{−λ²x²}`, minimum at `x = −1/(λ√2)`: `−√2λe^{−1/2}` = `−0.8578`, `−8.578`; `T* = 1.1658/λ` = `1.1658`, `0.11658`; `‖u″‖² = λ⁴·λ⁻¹·3√(π/2)` = `3.760`, `3760`; values in `[−1, 0]` | sound; "`T` depends on `K` alone" refuted |
| §7.1 existence, uniqueness, continuation | `F ≡ 1`; Burgers `u₀ = −e^{−x²}`; full-rank `Λ`, `U₀ ≡ 1`, `Ū = 0`, `K = {1}` | `u₀ + t ∉ L²`; `T* = e^{1/2}/√2 = 1.1658`; `Ū ∉ K` only for full rank, where constants may depend on the fixed `Ū` (it is fixed before `T(M, K)`) | sound |
| §7.2 statement and route (repaired; headline) | `[ρ_*, ρ^*] ⊆ I`; `ρ_* = 1`, `C′ = 2`; `M = 0`; `p = ρ³/3` simple wave; `n = 3` | `|v̄ − v₀| ≤ C‖v̄ − v₀‖ ≤ CM`, so data in `K`, compact in `I × E`; `ρ ≥ ρ_* − C′t ≥ 1/2` for `t ≤ 1/4`; `C′ > 0` needed (else `ρ_*/0`); `|v·∇ρ + ρ div v| ≤ (|v₀| + CR)C₁R + (ρ₀ + CR)√n C₁R`; `v − ρ ≡ −1`, `v + ρ = 1 + e^{−x²}`, `T* = 1.1658`, `ρ ∈ [1, 3/2]`; `6 > 5`, `4 < 5` | sound |
| §7.2 continuation, full system | `∫‖∇U‖_∞ < ∞`, `(ρ, s)` in compact `L′ ⊆ 𝒪` | `d/dt‖v‖_∞ ≤ ‖v‖_∞‖∇v‖_∞ + C_{L′}(‖∇ρ‖_∞ + ‖∇s‖_∞)`, Grönwall: `v` bounded, so the §7.1 alternative is the stated `(ρ, s)` one; `ρ_* = min_L ρ > 0` | sound |
| Supplier speed against cones (§5.2, repaired locator) | transport `a = 1`; `c = 1/2`; `(1/2, 1)` | speed iff `c ≥ 1`; `(c, 0)` dominates iff `c ≥ 1` (symbol `c − 1` at `(c, −1)`); `1 > 1/2` and `−1/2 < 0`; `ζ₀ + ζ₁ ≥ |ζ₁|/2 ≥ 0`; general: `ξ·σξ ≥ (ζ₀ − c|ζ′|)ξ·A⁰ξ`, and `(c, ±ω)` gives `∓ξ·(ΣωA)ξ ≤ cξ·A⁰ξ` | sound |
| §3.2 limit curves (R01) | `D = H₀ \ {(1, 0)}`, `x_m ≡ 1/m` on `[1, 2]`; `D = H₀` | `J = (1, 2]`, `a′ = a = 1`, endpoints `→ (1, 0) ∉ D`, clause silent; `J = [1, 2]`, `x_m(1) → 0` | statement true, incomplete: R01 |
| §3.2 Checks, integral characterisation | field `(1, x)`, `e^{3t}`; Cantor curve `10f`; `|t|` | `|3e^{3t} − e^{3t}| = 2e^{3t}`, `0.0996` at `t = −1`, `≥ 2` on `[0, 1]`; `10 > 1 = ∫₀¹c`; slopes `±1` | sound |
| §1.1 equations of state | `ρ²/2`; `ρ²` at `1/2`; `−A/ρ`; `−ρ²`; `e^sρ²` at `(1, 0)` | `c(4) = 2` (wrong `c = p′`: `4`); `c² = 1`; `p′ = A/ρ² > 0`; `p′ = −2ρ < 0`; `∂_ρP = 2`, `∂_sP = 1`, `c = √2` | sound |
| §1.2, §1.3 | expanding flow `n = 1`, `t = 1`; boost `w = 1`; `P = e^sρ²`, `s = x`, `ρ = e^{−x/2}` | `−ρ₀/4 + ρ₀/4 = 0`, `−x/4 + x/4 = 0`; wrong rule residual `−1/(1 + t) = −1/2`; `P = 1`, wrong momentum `−e^{x/2}`; `Bs = 1` for `(1, 0, t)` | sound |
| §2.1 carrier | monotonicity; `κ`; wave system `n = 1` at `(0, 1)`; `ζ = (1/2, e₁)` | `ζ₀ + w·ζ′ ≥ c′|ζ′| − |w′ − w||ζ′| ≥ c|ζ′|`; `Σζᵢ Aⁱ ≥ −λ|ζ′|A⁰` (roots symmetric under `ω ↦ −ω`); `λ² − 1`, `det = −1`; `1/2 − 1 = −1/2` | sound |
| §2.2 symmetrisers | `ρ = 1`, `c = 2`, `v = 3`; full `S Mⁱ`; `(1, 0)`; `ζ = (−3, 1)`; `(2, 0)` | `A¹ = [[12, 4], [4, 3]]`, `(12 − 4λ)(3 − λ) − 16 = 4(λ − 1)(λ − 5)`; rows `(∂_ρP vⁱ/ρ, ∂_ρP eᵢ, ∂_sP vⁱ/ρ)`, `(∂_ρP eᵢ, ρvⁱ, ∂_sP eᵢ)`, `(∂_sP vⁱ/ρ, ∂_sP eᵢ, dvⁱ)`: symmetric; `ad − b² = ∂_ρP/ρ`; minors `2, 2, 2`; `[[0, 4], [4, 0]]`, `−16`; `2 − 3 − 2 = −3`; `ρ⁻¹·diag(c²/ρ, ρ) = diag(c²/ρ², 1)` | sound |
| §3.1 form, covectors | `n = 2`, `c = 2`, `v = (1, 0)`; covariance | Gram `[[−3, −1, 0], [−1, 1, 0], [0, 0, 1]]`, `det = −4`; `(1, 3, 0)`: `−4 + 4 = 0`; `(1, 4, 0)`: `5`; `ζ = (−3, 1, 0)`: `−2`, `g⁻¹ = −1 + 1 = 0`; `ξ + τw − τv = ξ − τ(v − w)` | sound |
| §3.3 statements | past-closed restriction; compact pasts; idempotence; slabs | an extension in `D` lies in `J⁻_D(q) ⊆ D′`; a curve reaching `Σ_{t₀}` cannot extend below `t₀`, so its foot is in `S`; a point `q ∈ D \ D⁺_D(S)` on an extension gives a concatenated inextendible curve missing `S` (if `t_q = t₀` then `q ∉ S` since `S ∩ D ⊆ D⁺_D(S)`); `|x(t) − x_p| ≤ (t_p − a)sup(|v| + c)` | sound (given R01's clause) |
| §3.3 Checks | closed `D`; field `(1, x²)`; expanding flow | every curve extends back with `ẋ = sign x`, so `D⁺_D(S) = D`; `x ≡ 1.9` exits at `0.9`; `x = 1/(1/4 − s)`: `−4` at `1/2`, `→ −∞`; `ẏ = (v − c)/(1 + t) − v/(1 + t) = −(1 + t)^{−3/2}`, `x = 2√(1 + t) − (1 + t)`, zero at `t = 3`, `0.828` at `t = 1` | sound |
| §4.1 norms | `n = 2`, `k = 2`, `e^{−|x|²}` | `π/2`; `π`; `∂₁₁`: `(16·3/16 − 4 + 4)π/2 = 3π/2`; `∂₁₂`: `π/2`; total `5π`; operator norm: `2π(1 − e^{−2}) + π(20 − 12 + 2)e^{−2}`, Tau Ceti norm² `(7/2 + 8e^{−2})π ≈ 4.58π` | sound |
| §4.2 embedding, interpolation | `e^{−x²}`; dilations; Tau Ceti additive form | `1 ≤ √(π/2) = 1.2533`; `2√(π/2) ≤ √5·√(π/2)`; left `λ^{1/2}`, wrong right `λ^{−1/3}·λ^{1/2} = λ^{1/6}`; `inf_ε(ε a + b/ε) = 2√(ab) = 2·3^{1/4}(π/2)^{1/4} = 2.947 ≥ 1.120`; `(3/4, 1/4)`: `λ⁰` | sound |
| §4.3 Gagliardo–Nirenberg, composition | Nirenberg's relation; scaling; `|x|^{−n/3}`; circle-valued map | `1/p = i/n + (i/k)(1/2 − k/n) = i/(2k)`, `a = i/k < 1` or `k − i − n/2 < 0` (no exceptional case); both sides `λ^{i − ni/(2k)}`, wrong ratio `λ^{−1/4}` = `2` at `1/16`; `∫r^{−n/3−1}` diverges; `π²·2π·(4/3) = 8π³/3`, sphere means `(0, 0)` | sound |
| §4.4 mollifiers | `a = sin(x/2)`, `u = sin x`; `Λ = 2πℤ`, `u = 1` | commutator `½[(φ̂(3ε/2) − φ̂(ε))sin(3x/2) − (φ̂(ε/2) − φ̂(ε))sin(x/2)]`, at `π`: `½(μ₂ε²/2)(5/4 − 3/4) = μ₂ε²/8`; `1 ≤ C/ε` false at `ε = 2C` | sound |
| §5.1 identity | `B = bI`; Jordan block; `A⁰ = √(1 + x²)` | `E = e^{−2bt}E(0)`; `(g − tf′, f)`; `π`, `π/8`, `2 asinh R` | sound |
| §5.2 weights | transport `a = 1`; moving cone | `−1 − sign x ≤ 0`; `−1/2 + 1 = 1/2`; support `(−1.1, −0.1)` meets `|x| < 0.55`; `M − e·w + w·e = M ≥ M|e|` | sound |
| §5.3 forcing Check | `A⁰ = 1/(2 + u)`, `U = sin mx`, `W = (δ + t)(2 + sin mx)` | `A⁰(U)∂_tW = 1`; `S_m ≥ ∫r″²/3 = πm⁴/3`; `2√S_m ≤ C₁√(2π)` gives `C₁ ≥ 2m²/√6 = √(2/3)m²` | sound |
| §5.4 third Check | `a = e^{sin x}`, `w = sin x + sin 2x` | `a(1/a)″ = sin x + cos²x`; `∫cos x w′² = 4·π/2 = 2π`; `∫cos x w″² = 8·π/2 = 4π`; `∫(−sin x − cos²x)w″w′ = π + 0`; `4π + 16π + 2π = 22π`; `2π + 5π + 17π` | sound |
| §6.1 (headline) | `A¹ = diag(z², 0)`, `Λ = ℤ`; cut-off | `g′·(1 − x²/x²) = 0`; `0.9 − 0.3 = 0.6`; `λI + θ(A⁰ − λI)`: `1.5` at `θ = 1/2` | sound |
| §6.2 Theorem, slab uniqueness | constant state on `(−2, 2)`; Burgers `κ(u) = (1 + |u|, 0)` | `1.4 < 1.5 < 1.6`; largest root of `ωu − λ` over `ω = ±1` is `|u|` | sound |
| §8.1 developments | `S = ∅`; truncation `T = 1/2`, `T = 0` | `D⁺_D(∅) = ∅`; slice `{0} × S` kept, `J⁻_D(q) ⊆ {t ≤ t_q}`; empty slice `≠ {0} × S` | sound |
| §8.2 (headline) | counter-flow `p = ρ²`, `ρ = 1/2`; union of a compatible family; criterion | `c² = 2ρ = 1`, speeds `2 − 1 = 1`, `−2 + 1 = −1`; towers disjoint iff `t < 1`; `(2, 0)`: `0 < 1`, `0 > −1`, `2 ≠ −2`; a curve leaving `D_i` backwards at `a > t₀` is inextendible in `D_i` and misses `S`, at `t₀` it lands in `S ⊆ D_i`; with `U_*` on `H_{t₀}`: `U = U_*` on `D` (§6.2, `O = H_{t₀}`), then `D ⊆ D⁺_{H_{t₀}}(S)` by first exit | sound |
| §8.3 (headline) | `S = E` | `J⁻_{D′}(p) ⊆ {t ≤ t_p} ∩ D′ ⊆ O` for `p ∈ D′ ∩ O`, so `U′ = U` there (§6.2): compatible, union above `D′`, a maximal `D′ ⊇ O` | sound |
| §8.4 (a), (b) (headline) | `{|x| < 1 − t/2}`; ball; expanding flow; lens `M = 5`, `1.05` | `X = −(1, v − θcb/|b|)`: `dφ(X) = −(a − θc|b|) > 0` iff `a < θc|b|`; `1/2 < 1`; `−e·v₀ + c₀ + v₀·e = c₀`; `0.2929 + 0.4142 = 0.7071`; `φ(−100, −400) = 260`, `ψ = ε + 100`; `−18.2ε < x < 0.514ε` | sound |

Round 12's rows for the §8.4 slab route and its periodicity Check, §7.3, the Besov and
circle-norm Checks of §4.1 and the worked example with full data carry computed values and are
relied on; those passages are unchanged since.

### Sources: the seeded sample

No locator is flagged unverified by the author. Every locator of the fifteen sampled sections into
a readable text was opened this round and resolves to the stated object:

- ChristodoulouMiao2014 lines 481–488 ((1.2)–(1.4)), 529 ((1.10)), 530–544 ((1.11)–(1.13)), 606
  ((1.24)), 672–676 ((1.39)–(1.40)), 685 (`√(−det g) = η`), 818–822, 833–838 ((2.1)–(2.3)),
  864–872, 872–880, 880–886.
- Christodoulou2019 lines 124–126, 130–138; AbbresciaSpeck2022 lines 149–152, 158–171
  ((1.1a)–(1.3)), 172–179, 408–414; LuoYu2023a lines 82–95 (`γ ∈ (1, 3)` at line 88); LuoYu2023b
  lines 417–419, 910 (Definition 2.13); LukSpeck2018 lines 1999–2008 (Definition 3.3, in the
  normalisation `c⁻²g`); Speck2016 line 1343 (§1.11).
- LukNotes lines 679 (Proposition 4.1), 724 (Proposition 4.4), 1158 (Theorem 5.3), 1210
  (Theorem 5.5), 1239 (Theorem 6.1), 1612 (Lemma 6.8, `F(0) = 0`), 1620 (Theorem 6.10).
- EperonReallSbierski2019 lines 767 (Theorem 3.45), 1129–1132, 1178–1182 (Proposition 4.63),
  1195–1198, 1338 and 1342 (Corollaries 4.68, 4.69, connected `S`), 1603 (Theorem 4.82).
- BarGinouxPfaffle2007 lines 1006–1008 (Definition 1.3.5), 3664–3668 (Theorem 3.2.11);
  Minguzzi2019 lines 1359–1364 (Theorem 2.12, Remark 2.13), 1917 (§2.11), 3576–3582
  (Definition 3.1, Remark 3.2), 3716–3718 (Proposition 3.16, (3.1)); MinguzziCone2019 lines
  680–683, 698, 1737–1740 (Definition 2.17, closed achronal `S`); Chrusciel2011 lines 534, 1169,
  1352, 1843–1848 (timelike `D⁺_I`), 1859.
- Nirenberg1959 line 318 (the Theorem); the exponents were checked through Nirenberg's
  dimensional relation (table).

### Pinned declarations opened

Mathlib at `1b1ccf4`, Tau Ceti at `2fd255d` (the checkouts' heads equal the revisions of
`lake-manifest.json`). All 55 name-and-line pairs of the supplier contracts (20 of Mathlib, 35 of
Tau Ceti) were tested by script at their stated lines this round; each line carries the named
declaration (for instance `zorn_le_nonempty₀` at `Mathlib/Order/Zorn.lean:126`,
`LipschitzWith.integral_lineDeriv_mul_eq` at `Mathlib/Analysis/Calculus/Rademacher.lean:170`,
`TauCeti.Wkp.norm_iteratedGradient_lowerOrder_le` at
`TauCeti/Analysis/Sobolev/Wkp/Interpolation.lean:335`,
`TauCeti.le_mul_exp_of_le_add_mul_integral` at `TauCeti/Analysis/ODE/Gronwall.lean:59`).

### Duplication and supplier-order audit

- **SymmetricHyperbolicSystems** (open pull request adding the folder; read at its head):
  Conventions *Propagation speed*; §1.2 (`LinearSystem n N` with fields `A0`, `A`, `B`,
  `LinearSystem.apply`, `IsSymmetricHyperbolic S lam` as `0 < lam`, `IsSymm` of `A0` and each
  `A j`, `lam * (ξ ⬝ᵥ ξ) ≤ ξ ⬝ᵥ (A0 *ᵥ ξ)`, all declared in its `Suggested.lean`); §2.1 (the
  identity with `K = ∂ₜA⁰ + Σⱼ ∂ⱼAʲ − B − Bᵀ`, `A⁰`, `Aʲ` of class `C¹`, `B` continuous); §2.2
  (single speed, `F = 0` on the cone, smoothed weight); §2.3; §7.3 (`C_b^∞` coefficients, smooth
  compactly supported data). Its Scope leaves quasilinear systems and the `Hˢ` theory outside,
  and its Downstream consumers name the quasilinear Cauchy problem as a consumer.
- **LorentzianGeometry** (open pull request adding the folder; read at its head): §6.1, §6.3
  (hyperplane trichotomy by the sign of `b⁻¹(ξ, ξ)`), §7.3 (form, `B`, inverse,
  `g(X, B) = −c² dt(X)`, causal `∂_t + Y` iff `|Y − v|_h ≤ |c|`, use in §12.6 on subsets), §8.2,
  §8.3, §9.2, §11.4, §12.6 (the four declarations; `S ∩ D ⊆ D⁺_D(S)` and monotonicity;
  concatenation; time functions with the extension form and one-point intervals; the slab
  identity; determination for `S` closed in an open set of a manifold without boundary;
  coverings) and §12.7 exist and state what the README assumes or compares with. `minkowskiForm`,
  `TimeOrientedLorentzianFieldOn`, `IsFutureCausalCurveIn`, `IsPastInextendibleIn`,
  `futureDomainOfDependenceIn` and `futureDomainOfDependenceIn_self` are declared in its
  `Suggested.lean`. Its §7.3 and Downstream consumers hand the fluid side, developments
  `D = D⁺_D(S)`, their uniqueness, maximal developments and local well-posedness to a
  hyperbolic-PDE roadmap.
- **PDE** (main): named as a boundary; nothing consumed. **IncompressibleFlows** (never-cite
  list) and **RelativisticQuantumFieldTheory**: named as boundaries only.
- Overlap facts (`roadmaps overlaps`, run this round): the roadmap is neither on main nor in an
  open pull request: no second copy, no other pull request changes it, no cited id is dropped,
  none is defined only by an open revision. `roadmaps resolve`, run this round: no cross-roadmap
  citation and no Lean name found nowhere. No roadmap cites CompressibleEulerEquations. The
  by-object searches of round 12 over main and the open heads were not repeated beyond the
  closest-roadmap lists, since no object was added since.

Overlap check: read LorentzianGeometry, SymmetricHyperbolicSystems, YangMillsConnectionsAndCaloricGauge, IncompressibleFlows, PDE, SobolevPolynomialApproximation, RiemannianGeometry; shared objects: the acoustical form, causal curves and `D⁺_D(S)` in subsets — owner LorentzianGeometry, imported here; null `C¹` horizons in a fixed spacetime — owner LorentzianGeometry §12.7, with the boundary of a development owned here and the difference stated in §8.4; the linear carrier, its predicate, its speed and the pointwise energy identity — owner SymmetricHyperbolicSystems, imported here; periodic Sobolev spaces on a full torus — owners PDE §7.2 (main) and IncompressibleFlows Layer 0, with `Hᵏ_Λ` for period groups of every rank owned here; nothing else shared.

Dependency check:

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2235 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every `*Needs:*` line was read: each item is a pinned declaration, a
section of this roadmap or a section of the two suppliers; the new items (§4.2 in §7.2,
SymmetricHyperbolicSystems' Conventions in §5.2) are an earlier internal section and an existing
supplier. The layer `### Dependencies` lines agree. No notion was moved down this round.

### Shape, style, headlines and plan

- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
  build, eight layers each ending with Examples and Dependencies, Downstream consumers, Worked
  examples, References. Every definition has at least three Checks; every theorem has a locator
  or says it is proved here.
- Organisation: the layers are worked back from the developments theorems; none is named after a
  source's chapter and the README does not say it follows a source.
- Headline theorems ("How to read the build"): §7.2, §6.1, §8.2–§8.3, §8.4. There is no
  `Suggested.lean` at this stage; every backticked identifier is a library or supplier
  declaration, and each was resolved (above).
- Style: no LaTeX delimiters, process words, pull-request numbers, dates, HTML or machine paths
  (pattern search); "lemma" occurs only in Zorn's and Friedrichs' lemma.
- `design/plan.json`: parses; 8 layers, 54 targets (37 theorems, 12 definitions, 4
  constructions, 1 example), every definition and construction with at least three tests, no
  dangling `target:` prerequisite, `gaps: []`; 5.2, 7.1, 7.2 and the supplier entry agree with
  the README. `sources.toml`: 21 entries, the 21 keys of the References (14 certified, 3
  uncertified, 4 waived), no local path.

### Copyright

Wording: sixteen passages set beside their sources this round: the equation of state
(AbbresciaSpeck2022 lines 165–171); the data and well-posedness sentence of §7.2 (lines
172–179); the Euler system (LuoYu2023a lines 82–88); entropy propagation (ChristodoulouMiao2014
lines 530–544); the definition of a development (lines 864–872); the classical uniqueness claim
(lines 875–880); the acoustical form (lines 672–676; LukSpeck2018 lines 1999–2008); the regular
boundary (Christodoulou2019 lines 130–138); the half-space configuration (LuoYu2023b lines
417–419); `D⁺_D(S)` (Minguzzi2019 lines 3576–3578, MinguzziCone2019 lines 1737–1740,
BarGinouxPfaffle2007 lines 1006–1008, Chrusciel2011 lines 1843–1848); Lipschitz parametrisation
(Minguzzi2019 lines 1359–1363); the embedding and the composition estimate (LukNotes lines
1210–1212, 1612–1615); the uniqueness criterion (EperonReallSbierski2019 lines 1338–1344).
Longest shared run: five words ("the union of all developments"), where the README reports the
source's claim in order to refute it. No table, figure, exercise or data set is taken over.

Arrangement: 100 source citations in the layers; Majda1984 17, ChristodoulouMiao2014 16
(LukNotes and AbbresciaSpeck2022 8 each). Of ChristodoulouMiao2014 only its §1.1, §1.2 and
§2.1.2 meet Layer 1, §3.1 and §8.1; Layers 2 and 4–7 have no counterpart there and no run of
layers follows its chapters.

Source independence: 16 passages compared with 12 sources, none shared; largest share Majda1984, 17 of 100 locators (ChristodoulouMiao2014 16); contents compared with ChristodoulouMiao2014: independent; Majda1984 could not be read (uncertified), so neither its wording nor its contents were compared.

## Not verifiable

- Majda1984 (Ch. 2, §§2.1–2.3, Theorem 2.1), Kato1975 (Theorem I), Dafermos2016 (Ch. V, §5.1,
  Theorem 5.1.1): settled as uncertified; cited by locator, text not read. The statements they
  are cited for were checked mathematically, not against the texts.
- Friedrichs1954, HawkingEllis1973, Christodoulou2007, ONeill1983: settled as waived; locators
  not checked.
- Nirenberg1959: the theorem is at line 318, but the OCR does not render its inequality or the
  number (2.2).
- Elaboration: not available in this lane, and the design has no Lean file.
- The routes of §3.3 (openness), §6.2 (the sweep), §7.1 (the iteration and the Bona–Smith step)
  and §8.4 (b) (the extension lens) have no source theorem at this generality in a readable
  text; they were checked by hand and on the instances of the tables of this and the previous
  round.
- The pinned declarations were compared by name and line this round; signatures in full were
  read in round 12 (five of them) and the pins have not moved.

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25: the source says two developments of the same data always agree on their common domain, so the union of all developments is the unique maximal one; it should be that they agree on the largest common development, with uniqueness needing an extra property of the data; affects a stated result.

## For the human reviewers

- **Merge order.** The suppliers LorentzianGeometry and SymmetricHyperbolicSystems are other authors' open pull requests adding new folders; neither is in `merge-order/ORDER.txt`, and the dependency check draws no edge to them.
- **Not tested.** Majda1984 has the largest share of locators (17 of 100) and is uncertified: its wording and its table of contents were not compared with Layers 4–7.
- **Licence.** LukNotes is a set of unpublished lecture notes read from the author's page (`packages/CompressibleEulerEquations/sources.toml`, entry `LukNotes`); it is cited only for wave-equation analogues.
- **Scope/ownership.** LorentzianGeometry's Downstream consumers also assign characteristic data and "characteristic for `□_g` iff null" to the hyperbolic-PDE roadmap; this design states the Euler-symbol form (§3.1) and leaves characteristic data to a Part II.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a8c032575903e8ee4c40a2c0dcdc565c34c34e0a", "job": "REV-DESIGN-CompressibleEulerEquations~13", "model": "fable", "worker": "chris-x80"} -->
