# Repair of the design review of YangMillsConnectionsAndCaloricGauge (round 4)

Files edited: `packages/YangMillsConnectionsAndCaloricGauge/design/README.md`,
`packages/YangMillsConnectionsAndCaloricGauge/design/plan.json` and
`packages/YangMillsConnectionsAndCaloricGauge/sources.toml`. There is one review
(REV-DESIGN-YangMillsConnectionsAndCaloricGauge~3) with two findings. Both are correct.

- F02 is applied as asked.
- F01 is applied differently. The reviewer's repair route relies on `‖DB‖_{L¹L²} < ∞` for `Ḣ^{−1}` data,
  which 8.3 states but which is false (shown below). So the decay clause has a different route, and
  8.3's `L¹` clause is corrected to the `ℓ²L¹` form the source actually proves and uses.

## F01 (P2) — applied differently

Old → new: 8.3's last clause `‖DB‖_{L¹Ḣ^σ} ≲ …` → `‖DB‖_{ℓ²L¹Ḣ^σ} ≲ …`, plus a decay clause (`J = [0, ∞)`,
`−2 < σ < 2`: `B(s) → 0` in `Ḣ^σ`) with its route, and function and 2-form versions. 9.5 cites the decay
for `F_{0j}` and `curl_A B`, and makes `A₀` converge block by block from `ℓ²L¹`.

**The finding is right.** 8.3 (README lines 1313–1323 before this round) stated well-posedness, the bounds
and the `L¹` bound, but no limit at `s = ∞`. 9.5's route took "`F_{0j}` tends to `0` in `Ḣ^σ`" from 8.3. The
source has the same gap: OhTataru-YMHF line 2543 asserts the decay, and line 3404 takes `L²` decay from
"the `L²` theory in Theorem 4.3", whose statement (lines 1187–1189) is the bound (4.10) only.

**Why the suggested route cannot be used.** It needs `‖DB‖_{L¹L²} < ∞` from the `σ = 0` case of 8.3's
`L¹` clause (Theorem 4.6, line 1290). That clause is false even at `A = 0`:

- Take `b = Σ_{k=1}^{K} b_k`, with `b̂_k` supported in the annulus `2^k ≤ |ξ| < 2^{k+1}` and
  `‖b_k‖_{Ḣ^{−1}} = K^{−1/2}`. Then `‖b‖_{Ḣ^{−1}} ≈ 1`.
- For `4^{−k−1} ≤ s ≤ 4^{−k}`, the heat multiplier is bounded below on block `k`. The blocks are
  orthogonal, so `‖∇e^{sΔ}b‖_{L²} ≥ ‖∇e^{sΔ}b_k‖_{L²} ≳ 2^k‖b_k‖_{L²} ≈ 4^k K^{−1/2}`.
- Integrating over these disjoint intervals gives `‖∇e^{sΔ}b‖_{L¹L²} ≳ Σ_{k≤K} K^{−1/2} = K^{1/2}`, which
  is unbounded.

The source's proof of Theorem 4.6 is block by block (lines 1297–1320: (4.17), (4.19) and interpolation
give `‖P_k(DB)‖_{L¹L²} ≲ d_k`). Summing the squares gives the `ℓ²L¹` norm (defined at line 857), and every
application of the theorem uses that norm: Lemma 5.23 at line 2207 and Lemma 5.33 at line 2546. At
`A = 0`, `‖∇e^{sΔ}P_kb‖_{L¹L²} ≲ 2^k∫₀^∞e^{−c4^ks}ds‖P_kb‖_{L²} ≈ ‖P_kb‖_{Ḣ^{−1}}`, so the `ℓ²L¹` form holds.

**The decay route used instead** (README 8.3, "Route for the decay"). It uses only bounds 8.3 already
states:

1. Take `G = H = 0` and data in `L² ∩ Ḣ^{−1/2}`. The `σ = 0` bound gives `∫₀^∞‖DB‖²_{L²} < ∞`, so
   `DB(s_n) → 0` in `L²` along some `s_n → ∞`.
2. The diamagnetic and Sobolev inequalities give `‖B‖_{L⁴} ≲ ‖DB‖_{L²}` and
   `‖∂B‖_{L²} ≲ ‖DB‖_{L²} + ‖A‖_{L⁴}‖B‖_{L⁴}`, so `‖B(s_n)‖_{Ḣ¹} → 0`.
3. Interpolation, `‖u‖_{L²} ≲ ‖u‖^{2/3}_{Ḣ^{−1/2}}‖u‖^{1/3}_{Ḣ¹}`, together with the uniform `Ḣ^{−1/2}` bound
   gives `‖B(s_n)‖_{L²} → 0`.
4. Restart at `s_n`: the `σ = 0` bound on `[s_n, ∞)`, with constants no larger than on `[0, ∞)`, gives
   `B(s) → 0` in `L²`.
5. For other `σ`: finite block sums `Σ_{|k|≤N}P_ku` are dense in `Ḣ^σ = Ḃ^σ_{2,2}` and lie in every `Ḣ^τ`.
   Interpolate with the uniform `Ḣ^{σ'}` bound, and control the approximation error by the uniform
   `Ḣ^σ` bound.
6. For nonzero `G` and `H`: split the solution at `S`; the forced part is bounded by the tails of the
   `G` and `H` norms beyond `S`.

The index `−½` is used rather than `−1`, so that the step stays clear of the covariant-norm caveat at
`σ ≤ −1`.

**Pattern repaired** (other places that took decay from bounds alone):

- *9.5, `σ = 1` route.* It cited "lines 2530–2537": `curl_A B → 0` in `L²`, which the source asserts at
  line 2535 from "the `L²` solvability" (the same gap). `curl_A B` is a 2-form, so 8.3 now says that
  everything in it holds with the same proofs for `𝔤`-valued functions and 2-forms. The term
  `−2[F_j^k, B_k]` is replaced by a constant-coefficient bilinear bracket term `R(F, B)`; the proofs use
  only `|R(F,B)| ≲ |F||B|`, the Leibniz rule, and that the adjoint of `R(F, ·)` has the same form. The
  route now writes the forcing `[F, DB] + [DF, B] ∈ L²Ḣ^{−1}` as `D^kH_k` with
  `H = DΔ_A^{−1}(…) ∈ L²L²` by 8.2, and cites the decay clause. 9.5's Needs gains 8.2.
- *9.5, de Turck step.* The `ℓ²L¹` bound is applied to the `𝔤`-valued function `D^ℓF_{ℓ0}`; this is why
  8.3 now covers functions. The README now names the right side `[DF, F_{0x}] + [F, DF_{0x}]` and checks it
  lies in `L¹Ḣ^{σ−1}` (below).
- *9.5, convergence of `A₀`.* With `ℓ²L¹` instead of `L¹`, convergence of `A₀(s)` in `Ḣ^{σ+1}` is now proved
  block by block. Each block's tail tends to `0` and is dominated by the square-summable
  `‖P_kD^ℓF_{ℓ0}‖_{L¹Ḣ^{σ+1}}`, so dominated convergence in `ℓ²` applies. This is the source's own step at
  lines 2546–2547.
- *9.5, negative range.* The separate reduction for `σ < 0` (dense `L² ∩ Ḣ^{σ₁}` and interpolation) is
  replaced by a citation of the decay clause, which covers `−2 < σ < 2`.
- *10.5* needs no edit. Its route takes `W(∞)` from 9.5 and never uses `F_{0j}` decay directly; the
  `c`-formula of Proposition 7.9(2) is not routed through Remark 7.10 in the README.
- *Other consumers of 8.3* (8.4; 9.3's route; 9.4) use only the `L^∞`/`L²` bounds, not the `L¹` form, so
  they are unchanged.

**Notation.** The Conventions now define `ℓ^pY` for a space-time norm `Y`, citing OhTataru-YMHF
line 857. They also note `‖u‖_{ℓ²L¹Ḣ^σ} ≲ ‖u‖_{L¹Ḣ^σ}` (Minkowski) and that the reverse fails (8.3, Checks).

**New Checks in 8.3:**

- the `ℓ²L¹` versus `L¹` example above;
- decay at `A = 0` by dominated convergence, with no uniform rate (low-frequency data at `s = 4^m`);
- a negative control: a static non-flat Yang–Mills connection (BPST) violates `F ∈ L²([0,∞); Ḣ¹)` and has
  the stationary `L²` solution `B_j = ξ^kF_{kj}`.

**plan.json.**

- 8.3: statement updated (`ℓ²L¹`, decay, functions and 2-forms, route); hypothesis
  "`J = [0, ∞)` for the decay clause"; locator records the misprint at line 1290 and the unproved decay at
  lines 2535, 2543 and 3404; prerequisites gain PDE §7.2 and `MeasureTheory.eLpNorm_le_eLpNorm_fderiv_of_eq`.
- 8.3 tests: four added. Three are the new Checks. The fourth is `sigmaTwo`, the README's existing third
  Check, which plan.json lacked.
- 9.5: "by 8.3" becomes "by the decay clause of 8.3"; `L¹` becomes `ℓ²L¹`; the `σ = 1` decay is added; the
  locator records the gaps at lines 2535 and 2543; prerequisite `target:8.2` added.

## F02 (P3) — applied

Old → new: 5.6 "(OhTataru-Threshold line 1074; OhTataru-TopClass line 53)" → "(OhTataru-Threshold line 1074)".
In `plan.json` 5.6, the locator `where` changes from "line 1074; OhTataru-TopClass line 53" to "line 1074". In
`sources.toml`, "5.6" is dropped from the OhTataru-TopClass `cited_for`, since 5.6 no longer cites that paper.

**Verified.** OhTataru-TopClass line 53 is the table-of-contents entry "4.1. Solvability results for the
inhomogeneous Gauss equation" (page 2). OhTataru-Threshold line 1074 identifies the topological class
with the homotopy class of `O : S³ → G`. The only `π₃` statement in OhTataru-TopClass is Bott's theorem
(Theorem 6.1, lines 2339–2344). It is not the forgetful-map bijection 5.6 proves, so the locator is
deleted rather than replaced.

**Pattern.** Every README locator that points into the first 140 lines of a source was compared with the
contents pages:

| Source | Contents pages | Locators checked |
|---|---|---|
| OhTataru-YMHF | lines 20–88 | 92–102, 103–118 |
| OhTataru-TopClass | lines 30–93 | 121–127, 165–183 |
| OhTataru-Threshold | lines 23–86 | none in that range |
| Rade-YMHeat | none | 212–223 |
| GurskyKelleherStreets-GapTheorem | none | 117–123, 139–153 |

All of these locators are body text. 5.6 was the only one that pointed into a contents page.

## Checks

**Dependency check** (final text):

```
candidate: YangMillsConnectionsAndCaloricGauge is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2401 edges, 0 problem(s)
```

No UPWARD and no CYCLE line.

**Citation resolver** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name is
missing.

**Style greps** on the added lines: no LaTeX delimiters, no machine paths, no pull-request numbers, no
process words. One phrase was caught and rewritten while editing: a Conventions pointer that called
some Checks "new".

**Elaboration.** None was run. A design has no `Suggested.lean`, so there is nothing to elaborate and no
`#check` comparison to make.

**plan.json.** It parses, and still has 52 targets and 4 gaps. Tests went from 115 to 119, all four on
8.3. The test kinds are the existing ones ("non-example" for the negative controls).

## Adversarial pass (every statement added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 8.3 `L¹` clause as it stood (`‖DB‖_{L¹Ḣ^σ} ≲ ‖B(0)‖_{Ḣ^{σ−1}}`) | `A = 0`, `σ = 0`, `b = Σ_{k≤K}b_k`, `‖b_k‖_{Ḣ^{−1}} = K^{−1/2}` | `‖b‖_{Ḣ^{−1}} ≈ 1`; on `[4^{−k−1}, 4^{−k}]`, `‖∇e^{sΔ}b‖ ≳ 4^kK^{−1/2}`; integral `≳ K^{1/2}` | **false** | `ℓ²L¹` on the left; negative-control Check |
| 8.3 `ℓ²L¹` clause | `A = 0`, single block `P_kb` | `‖∇e^{sΔ}P_kb‖_{L¹L²} ≲ 2^k(c4^k)^{−1}‖P_kb‖_{L²} ≈ ‖P_kb‖_{Ḣ^{−1}}`; `ℓ²` sum `≈ ‖b‖_{Ḣ^{−1}}` | holds | none |
| `‖u‖_{ℓ²L¹Ḣ^σ} ≲ ‖u‖_{L¹Ḣ^σ}` (Conventions) | Minkowski | `(Σ_k(∫‖P_ku‖)²)^{1/2} ≤ ∫(Σ_k‖P_ku‖²)^{1/2} ≈ ∫‖u‖_{Ḣ^σ}` | holds; the reverse fails by row 1 | none |
| 8.3 decay, `A = 0` | `b ∈ Ḣ^σ`, every `σ` | `∫|2πξ|^{2σ}e^{−8π²s|ξ|²}|b̂|² → 0`: integrand dominated by `|2πξ|^{2σ}|b̂|²`, pointwise `→ 0` for `ξ ≠ 0` | holds | Check |
| 8.3 decay rate | `b̂` in `|ξ| ≤ 2^{1−m}`, `s = 4^m` | multiplier `≥ e^{−4π²·4^m·4^{1−m}} = e^{−16π²}` | no uniform rate; the clause is rightly qualitative | Check |
| 8.3 decay, static non-flat connection | BPST, `B_j = ξ^kF_{kj}` | Bianchi: `D_jB_i − D_iB_j = −ξ^kD_kF_{ij}`; then `Δ_AB_i = [F_{ji},B_j] − ξ^k[F_{jk},F_{ij}] = −2[F_{ij},B_j]`; `|B| ≈ |x|^{−4}` is in `L²`; `‖F‖_{L²([0,∞);Ḣ¹)} = ∞` | nonzero stationary solution, so the time-global hypothesis is needed | negative-control Check |
| decay route, step `‖B‖_{L²} ≲ ‖B‖^{2/3}_{Ḣ^{−1/2}}‖B‖^{1/3}_{Ḣ¹}` | Hölder on the Fourier side, `p = 3/2`, `q = 3` | `|ξ|` exponents `−2/3 + 2/3 = 0`; `|û|` exponents `4/3 + 2/3 = 2` | holds | none |
| decay route, `‖∂B‖ ≲ ‖DB‖ + ‖A‖_{L⁴}‖B‖_{L⁴}` and `‖B‖_{L⁴} ≲ ‖DB‖` | diamagnetic `|∂|B|| ≤ |DB|` (`⟨B,[A,B]⟩ = 0` for Ad-invariant `⟨,⟩`), Sobolev `Ḣ¹ ⊂ L⁴` on `ℝ⁴` | `[A,B] ∈ L²` from `L⁴ × L⁴` | holds | none |
| decay route, restart at `s_n` | constants depend on `‖A‖_{L^∞Ḣ¹}`, `‖F‖_{L²Ḣ¹}`, `‖∂_sA‖_{L²L²}` | on `[s_n, ∞)` each norm is at most its value on `[0, ∞)` | holds | none |
| decay route, density and interpolation | `σ = 1.5`, `σ' = 1.8`; `σ = −1.5`, `σ' = −1.8` | `θ = σ/σ' = 5/6` in both cases; `‖·‖_{Ḣ^σ} ≤ ‖·‖^{1−θ}_{L²}‖·‖^θ_{Ḣ^{σ'}} → 0`; block sums converge in `Ḣ^σ` (tail of an `ℓ²` sum) | holds on `(−2, 2)` | none |
| decay with `G`, `H` | split at `S` | forced part `≲ ‖G‖_{L¹([S,∞))} + ‖H‖_{L²([S,∞))} → 0`; homogeneous part from `B(S)` decays | holds | none |
| 8.3 for functions and 2-forms | `R = 0`; `R = −2[F_j^k, B_k]`; `curl_A B` with `−2ad(F)` | `|⟨R(F,B),B⟩| ≲ ‖F‖_{Ḣ¹}‖B‖_{L²}‖DB‖_{L²}` (`L⁴·L^{8/3}·L^{8/3}`), so Gronwall with `∫‖F‖²_{Ḣ¹} < ∞`; `D[X,Y] = [DX,Y] + [X,DY]` (Jacobi); adjoint `⟨[F,B],C⟩ = −⟨B,[F,C]⟩` | the `σ = 0`, `σ = 1` and duality steps carry over | clause added |
| 9.5 right side `[DF, F_{0x}] + [F, DF_{0x}] ∈ L¹Ḣ^{σ−1}` | `σ = −½, 0, ½` | `L² × Ḣ^{σ+1} → Ḣ^{σ−1}` needs `0, σ+1 < 2` and `σ+1 > 0`; `Ḣ¹ × Ḣ^σ → Ḣ^{σ−1}` needs `σ < 2` and `1 + σ > 0`; `DF ∈ L²L²` from `F ∈ L²L⁴`, `A ∈ L^∞L⁴`; time `L² × L² → L¹` | holds on `(−1, 1)`, with 8.3's hypotheses only | text added |
| 9.5 `A₀` convergence from `ℓ²L¹` | tails `t_k(s) = ∫_s^∞‖P_kD^ℓF_{ℓ0}‖_{Ḣ^{σ+1}}` | `t_k(s) ≤ t_k(0)`, `Σt_k(0)² < ∞`, `t_k(s) → 0`; `‖A₀(∞) − A₀(s)‖² ≈ Σ_kt_k(s)² → 0` | holds | text added |
| 9.5 `σ = 1`: forcing as `D^kH_k` | `f = [F,DB] + [DF,B]` | `[F,DB] ∈ L²L^{4/3}` (`F ∈ L²L⁴`, `DB ∈ L^∞L²`); `[DF,B] ∈ L²L^{4/3}` (`DF ∈ L²L²`, `B ∈ L^∞L⁴`); `L^{4/3} ⊂ Ḣ^{−1}`; `f = D^k(D_kΔ_A^{−1}f)` with `‖DΔ_A^{−1}f‖_{L²} ≲ ‖f‖_{Ḣ^{−1}}` (8.2 at `σ = 1`) | holds | text added |
| 9.5 `U(1)` Check against the decay clause | `F_{0j} = B_j − ∂_jA₀` solves the heat equation | `e^{sΔ}b^{df} → 0` in `Ḣ^{−1/2}`, as in the Check | consistent | none |
| 5.6 without the TopClass locator | the based-versus-free argument in the text | `O ≃ O(e₁)⁻¹O`; `H(t,e₁)⁻¹H(t,·)` is based | unchanged, supported by OhTataru-Threshold line 1074 | locator only |

## For the maintainer

- **Changed for other roadmaps.** No Lean names exist at the design stage, and no section id was
  renumbered. Content changes: 8.3 now states the `ℓ²L¹` bound (no longer `L¹`), a decay clause, and the
  function and 2-form versions. A consumer reading 8.3's old `L¹` clause would have had a false bound.
- **Source issues to forward with the review's list:**
  - *Misprint.* OhTataru-YMHF Theorem 4.6, PDF page 27, line 1290: the left side is printed in
    `L¹Ḣ^σ`. It should be `ℓ²L¹Ḣ^σ`, which is what the proof gives (lines 1297–1320) and the applications
    use (lines 2207, 2546). The `L¹` form is false at `A = 0`.
  - *Gaps.* The unproved decay at lines 2535, 2543 and 3404, now supplied by 8.3's decay clause.
- **Ownership.** `roadmaps grep -i` over main and every open head found no other roadmap stating
  "covariant heat", "Yang.Mills heat", "caloric", "ℓ²L¹" or "diamagnetic", so this roadmap owns the decay
  clause. Ownership was checked against the open pull requests through these tools.
- **Overlaps.** Unchanged from round 3. No open pull request changes this roadmap. The DifferentialGeometry
  Layer 10 item in the overlaps listing is the round-1 F01 part (ii) already marked not actionable; it was
  not re-raised.
- **Sources.** No new source was cited and none fetched; `needs-references.toml` was not written.
  `sources.toml` changes: the OhTataru-YMHF locator now names the `ℓ^pX` norms of §3.2 and Remark 7.10;
  "5.6" is dropped from the OhTataru-TopClass `cited_for`.
