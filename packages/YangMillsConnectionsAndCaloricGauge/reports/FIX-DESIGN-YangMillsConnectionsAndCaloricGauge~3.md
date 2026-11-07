# Repair of the design review of YangMillsConnectionsAndCaloricGauge (round 3)

Files edited: `packages/YangMillsConnectionsAndCaloricGauge/design/README.md` and
`packages/YangMillsConnectionsAndCaloricGauge/design/plan.json`. `sources.toml` is unchanged: its
OhTataru-YMHF entry already records §4 (Theorems 4.1–4.8) and Lemmas 5.16–5.33 and cites 9.5 and 10.5,
and its OhTataru-TopClass entry already cites 2.2. There is one review
(REV-DESIGN-YangMillsConnectionsAndCaloricGauge~2) with two findings. Both are correct. F01 is applied as
the review's preferred option (a). F02 is applied differently: its route repair is right, but one of its
claims is not, and that changes the statement.

## F01 (P2) — applied

Old → new: §9.5 "`b ∈ Ḣ^σ`, `0 ≤ σ ≤ 1` … the statement above keeps the range that is proved" → "`−1 < σ ≤ 1`",
with the bound `‖B_∞‖_{Ḣ^σ} ≲_{Q,M₁} ‖b‖_{Ḣ^σ}`, a de Turck route for `−1 < σ < 1`, the source clause kept
(Lemma 5.33(2) writes `0 ≤ σ ≤ 1`; `1 < σ < 2` is not stated), and a `U(1)`, `σ = −½` Check. §10.5 gains a
route naming 9.5 as the input.

**Verified.** Proposition 7.9(1) is proved for `−1 < σ < 1` from Corollary 5.15 (OhTataru-YMHF lines
3381–3384). Corollary 5.15 claims `−1 < σ < 2` (lines 1954–1955). Its proof, Lemma 5.33(2), states
`0 ≤ σ ≤ 1` (lines 2515–2516). So §10.5 needed `B_∞` on `(−1, 0)`, which §9.5 did not supply.

**Why the source's route covers `(−1, 0)`.** I checked the argument for `0 ≤ σ < 1` (lines 2538–2549)
step by step:

- `F_{0j}` solves the homogeneous covariant heat equation. Theorem 4.3 holds for `−2 < σ < 2` (line 1187).
- The `A₀` bound `‖D_jF_{0j}‖_{ℓ²L¹Ḣ^{σ+1}} ≲ ‖b‖_{Ḣ^σ}` is the bound of Lemma 5.23, Case 1. That case is
  stated for `−1 < σ < 1` (lines 2172 and 2200–2208), through Theorem 4.6, also `−1 < σ < 1` (line 1289).
  It is the `L¹` bound of README 8.3.
- The product step is `Ḣ¹ × Ḣ^{σ+1} → Ḣ^σ` on `ℝ⁴` (`s₁ = 1`, `s₂ = σ + 1`, `d/2 = 2`). It holds when
  `s₁, s₂ < 2` and `s₁ + s₂ > 0`, that is for `−2 < σ < 1`. I checked the three Bony pieces with
  Bernstein; the scaling exponents are `σ − 2` on both sides.
- The decay of `F_{0j}` in `Ḣ^σ` for `σ < 0` reduces to the `L²` decay the source uses (line 2543;
  Remark 7.10, lines 3403–3404). Use the uniform `Ḣ^σ` bound, the dense subspace `L² ∩ Ḣ^{σ₁}` with
  `σ₁ < σ`, and interpolation. For example `‖f‖_{Ḣ^{−1/2}} ≤ ‖f‖^{1/2}_{Ḣ^{−1}}‖f‖^{1/2}_{L²}` by
  Cauchy–Schwarz over blocks.

The README states this route in §9.5.

**Same pattern elsewhere.** The other places that use the linearised limit were updated to match:

- plan.json 9.5: statement, locator, prerequisites (`target:8.3`, `target:9.1`, PDE §7.1, §7.3) and a new
  test `u1Negative`.
- plan.json 10.5: prerequisites, and the `decomposition` API statement.
- Layer 9 and Layer 10 Dependencies now name PDE §7.1 and §7.3 for the product bound.
- The PDE contract now says that §7.3 states its estimates in `𝒞^α`. The `Ḣ^σ` product bound follows
  from §7.3's decomposition and §7.1's Bernstein inequality (PDE main lines 2795–2800).

I also checked the third bullet of §10.5, the bound `‖L(a, w)‖_{ℓ¹Ḣ^{σ+1}}` for `−1 < σ < 1`. The source
proves it "as in Lemma 5.31", and that lemma is stated for `Ḣ¹` and `L²` data only (lines 2443–2451).
Its integration of `∂_sD^ℓB_ℓ = −2[B_j, D^ℓF_{ℓj}]` extends to `Ḣ^σ`: the product
`ℓ²L^∞Ḣ^σ × ℓ²L¹Ḣ¹ → L¹ℓ¹Ḣ^{σ−1}` needs `σ < 2` (low–high) and `σ + 1 > 0` (resonant). So it is not the
same defect, and nothing else needed changing.

## F02 (P3) — applied differently

Old → new: §2.2 route "cut-off `h` vanishing on `V` and off a compact subset of `X` and equal to `1` on `W`"
→ "smooth `h : X → [0, 1]` vanishing on `V` and off `U` and positive on `W`". The hypothesis "`V`, `W`
with disjoint closures" → "`V ∩ W = ∅`" (the source's). The sentence "replaced by disjoint closures, which
the cut-off `h` needs" is replaced, and three Checks are added.

**Verified.** Take the review's witness `U = W = B₁`, `V = ∅`. A smooth `h = 1` on `B₁` equals `1` on `∂B₁`,
so it is positive at points off `U`, where `O_δ ≠ O`. That breaks "equal to `O` off `U`".

**Why differently.** The review keeps disjoint closures, saying they are "exactly what such an `h`
needs". They are not:

- For open `V` and `W`, `V ∩ W = ∅` implies `W ∩ V̄ = ∅`: a point of `W ∩ V̄` has the neighbourhood `W`,
  which would meet `V`.
- So `W ⊆ U ∖ V̄`, an open set. Every open subset of `ℝ^d` is the positivity set of a smooth `h ≥ 0`.
- `O_δ` is smooth where `h > 0`, since `O_δ(x) = (δh(x))^{−d}∫ζ((x − z)/(δh(x)))O(z) dz`. It equals `O`
  where `h = 0`.

With the corrected cut-off, the source's own hypothesis `V ∩ W = ∅` (OhTataru-TopClass lines 1039–1040)
is enough. The narrowing to disjoint closures was justified only by the cut-off equal to `1` (line 1049),
and that cut-off is now gone. The README must not be narrower than the source, so the source's
hypothesis is restored.

The consumers of 2.2 use only its conclusion, which is unchanged: 2.3, 2.4, 2.5, 3.3 and 5.2's homogeneous
extension of a smoothed annulus gauge. They accept the weaker hypothesis.

New Checks:

- the review's witness, with the bump `exp(−1/(1 − |x|²))`;
- the half-balls `V = B₁ ∩ {x₁ < 0}`, `W = B₁ ∩ {x₁ > 0}`, whose closures touch. No continuous `h` is
  `0` on `V` and `1` on `W`, while `exp(−1/x₁)·bump` is positive exactly on `W`;
- `V = U`, `W = ∅`, which keeps the singularity of 2.1's map: smoothness is claimed on `W` only.

plan.json 2.2 is updated: statement, hypotheses, and three tests (`ballCutoff`, `touchingClosures`,
`smoothOnlyOnW`). Same pattern: the other cut-off in the roadmap, `η = 0` on `B₁` and `η = 1` off `B₂`
(Layer 5), joins sets with disjoint closures (`B̄₁` and `ℝ^d ∖ B₂`), so it needs no change.

## Checks

Dependency check (`gate --candidate … --only YangMillsConnectionsAndCaloricGauge`), exact output:

```
candidate: YangMillsConnectionsAndCaloricGauge is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 243 roadmaps, 2388 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. Citation resolver (`roadmaps resolve` on the README): cross-roadmap
citations found nowhere: none; Lean names found nowhere: none. plan.json loads, with 52 targets and 115
tests (111 before; 3 added for 2.2 and 1 for 9.5). Every definition still has at least three tests. Gaps
and `neededBy` are unchanged. A scan of the added README lines for process words, LaTeX delimiters and
pull-request references found nothing.

`Suggested.lean`: none at the design stage, so there was no elaboration and no `#check` comparison.

## Adversarial pass (every statement added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.2 with `V ∩ W = ∅` | `U = W = B₁`, `V = ∅` | bump `h = exp(−1/(1−|x|²))` in `(0, e^{−1}]` on `B₁`, `0` off; `O_δ = O` off `B₁`, smooth on `B₁` | holds | Check 1 |
| 2.2, touching closures | `V = B₁∩{x₁<0}`, `W = B₁∩{x₁>0}` | at `x = 0`, limits of an Urysohn `h` are `0` from `V` and `1` from `W` (impossible); `exp(−1/x₁)·bump > 0` iff `x₁ > 0`, `|x| < 1` | holds with the positivity cut-off | Check 2 |
| 2.2, degenerate | `V = U`, `W = ∅`; `V = W = ∅` | `O' = O` in both | holds; no smoothness on `V` | Check 3 |
| 2.2, finite `G` | `G = {±1}` | `G^{k,p}_loc` maps are a.e. locally constant; `π_G ∘ O_δ` is locally constant where smooth | consistent | none |
| `V ∩ W = ∅ ⇔ W ∩ V̄ = ∅` (open sets) | `V = (−1,0)`, `W = (0,1)` | `V̄ = [−1,0]`, `W ∩ V̄ = ∅`; positivity set `U ∖ V̄ = (0,1) = W` | holds | route text |
| 9.5 at `σ = −½`, `G = U(1)` | `b = ∇ψ + b^{df}` | `∂_sB = ΔB − ∇div B`: `∇ψ` static, `‖P_k e^{sΔ}b^{df}‖ ≤ e^{−c4^k s}‖P_k b^{df}‖ → 0`, so `B_∞ = ∇ψ`, curl `0`, `‖B_∞‖ ≤ ‖b‖` | holds | Check |
| 9.5 product bound | `s₁ = 1`, `s₂ = σ+1`, `σ = −½, 0, ½` | `s₂ = ½, 1, 3/2 < 2`; `s₁+s₂ = 3/2, 2, 5/2 > 0`; scaling `λ^{σ−2}` on both sides | holds for `−2 < σ < 1` | route |
| 9.5 decay of `F_{0j}`, `σ < 0` | `σ = −½`, `σ₁ = −1` | `θ = σ/σ₁ = ½`; `Σ2^{−k}a_k² ≤ (Σ2^{−2k}a_k²)^{1/2}(Σa_k²)^{1/2}` | reduction valid | route |
| 9.5 endpoints | `σ = −1`; `σ = 1`; `1 < σ < 2` | Theorem 4.6 and Lemma 5.23, Case 1 exclude `σ = −1`; `σ = 1` by div–curl (lines 2530–2537); `1 < σ < 2` unproved | range `−1 < σ ≤ 1` | statement |
| 9.5 curl identity | `B_∞ = D(A_∞)a_{0,∞}` | `D_kD_ja₀ − D_jD_ka₀ = [F_{kj}(A_∞), a₀] = 0`; `[A_∞, B_∞] ∈ Ḣ^{σ−1}` needs `1 + σ > 0` | holds on `(−1, 1]` | none |
| 9.5 de Turck formula | `F_{0j} = ∂_tA_j − ∂_jA₀ + [A₀, A_j]` | `= B_j − D_jA₀`, so `B_j = F_{0j} + D_jA₀` | holds | none |
| 10.5 route sign | `W(∞) = −∇c` | `div W(∞) = −Δc`, so `c = −Δ⁻¹∂^ℓW(∞)_ℓ` (a draft with `+` was wrong and is corrected) | holds | route |
| 10.5 route vs Checks | `U(1)`; `w = D(a)c₀`; `w ∈ T^{L²}_a𝒞` | `U(1)`: `W(∞) = ∇Δ⁻¹div w`, `c = −Δ⁻¹div w`, `b = w − ∇Δ⁻¹div w` (Leray); `W(∞) = ∇c₀`, `c = −c₀`, `b = 0`; `W(∞) = 0`, `c = 0`, `b = w` | agrees with all three Checks | none |
| 10.5 constants | `a ∈ 𝒞_Q`, `ℰ_e ≤ E` | `‖a‖_{Ḣ¹} ≲_{Q,E} 1` (10.3), so `M₁ = M₁(Q,E)` in 9.5's bound | holds | route |
| 10.5 third bullet, `σ ∈ (−1,0)` | `[B, DF]`, `B ∈ ℓ²L^∞Ḣ^σ`, `DF ∈ ℓ²L¹Ḣ¹` | low–high `2^{j(σ−1)}2^{j(2−σ)}2^{−j} = 1`; high–low `1`; resonant summable iff `σ + 1 > 0` | holds | none |
| PDE §7.3 contract | PDE main lines 2795–2800 | estimates stated in `𝒞^α` only | the `Ḣ^σ` product bound is derived, not cited | contract clause |

## For the maintainer

- No name that another roadmap cites has changed. The section numbers are unchanged, and no Lean names
  are declared at the design stage.
- §9.5 now states the linearised limit on `−1 < σ ≤ 1`, wider than before. Any consumer that cited the
  old range keeps a true citation.
- §2.2 now carries the source's weaker hypothesis `V ∩ W = ∅`. Neither the review's "Source issues" note
  on OhTataru-TopClass Lemma 3.2 nor the README's old sentence is needed for the statement: only the
  source's proof (an Urysohn `h` equal to `1` on `W`) needs disjoint closures. The README now records
  this.
- Ownership: the `Ḣ^σ` product law on `ℝ⁴` is derived here from PDE §7.1 and §7.3. `roadmaps grep` for an
  `L²`-based product law over main and every open head found no owner. IncompressibleFlows (open) builds
  Bony's paraproduct for its own Besov theory; PDE §7.3 on main is the supplier cited.
- Overlaps (the overlap listing for this roadmap): the only item is the drop of DifferentialGeometry Layer 10 by the
  open DifferentialGeometry revision. It was settled in the previous round (the degree exists only on
  main) and is untouched here.
- No passage in the review asked for anything outside this job.
