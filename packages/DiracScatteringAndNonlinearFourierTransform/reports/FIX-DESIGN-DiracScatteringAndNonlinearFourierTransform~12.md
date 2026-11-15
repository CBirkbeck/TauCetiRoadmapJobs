# Repair of DiracScatteringAndNonlinearFourierTransform (design, round 12)

This round answers the findings of `REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~11`. The verdict was
`needs_changes`: one P1 (F01) and one P3 (F02). Files edited:

- `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md` (Summary, Scope, Mathlib contract,
  How to read the build, §5.5 Check, §8.6 route, §8.9, Layer 9, Downstream consumers, References)
- `packages/DiracScatteringAndNonlinearFourierTransform/design/plan.json` (summary, targets 5.5, 8.6, 8.9 and
  Layer 9)
- `packages/DiracScatteringAndNonlinearFourierTransform/sources.toml` (new entry `denisov2026`; `cited_for` and
  locators of `poltoratski2024`, `mauth2022`, `mnatsakanyan2022`)

There is no `Suggested.lean` at the design stage, so no Lean was elaborated and the `#check` comparison of
elaborated types does not apply. `needs-references.toml` was not written: every source needed could be read.
The review's section "For the human reviewers" asks for no edit, and none was made for it.

## F01 (P1) — applied

Old → new: §9.4 (zero-interval insertion) and §9.5 (Lemma 10) are deleted, with their Mathlib bullet. §9.6
(absence of resonances a.e.) becomes the definition "§9.4 Resonance-free points" `R(f)`, for `E` and `Ẽ`.
§9.7 → §9.5 and §9.8 → §9.6, stated for `s ∈ R(f)` outside a null set. Summary, Scope, build, consumers and
References say the unconditional theorem is not claimed.

**Verification.** I recomputed the reviewer's witness in plain Python. With `θ_k = i h_k`
and heights `1, 0.99, 0.98`, the §9.2 moduli `|sin(θ_k − θ_j)/sin(θ_k − conj θ_j)|` are `0.0027860125`,
`0.0028445041`, `0.0056304720`. These equal the pseudo-hyperbolic distances of `ζ_k = e^{2iθ_k}`, and
`(d₁₂ + d₂₃)/(1 + d₁₂d₂₃) = 0.0056304720`. The relation the route uses on the second interval,
`sinh Δ/sinh(υ − 2Δ) = 0.0028151` (source's `υ = 2`), is not the true value `sinh Δ/sinh(υ − 3Δ) = 0.0028445`.
Solving the correct relations upward gives `Δ₁ = 0.0102119`, `Δ₂ = 0.0106540`. The third relation then holds to
`9·10⁻¹⁹`, so no contradiction arises. Independently, the half-turn of the disc about `ζ₁`,
`ζ ↦ φ_{ζ₁}⁻¹(−φ_{ζ₁}(ζ))`, sends heights `0.99, 0.98` to `1.0102119, 1.0208659`: the modified configuration is a
hyperbolic image of the original.

There is also a structural reason. Inserting a zero interval after `t₁` turns `f 1_{(t_j,t_k)}` into a translate,
whose transform has the same modulus at `s` (§5.6 translation rule). So moduli at `s` cannot separate the two
configurations. The OCR of poltoratski2024 line 1500–1509 shows the three relations as the reviewer describes.

No other legal source supplies a proof. The published proof's error is reported by mnatsakanyan2022 (line 9–13,
135–137); mauth2022 Theorem 5 (line 3820) follows the earlier argument. arXiv lists no version after v14
(19 Dec 2025). denisov2026 (arXiv:2605.25108 v2, fetched through the sources service) poses the a.e.
convergence of `b/a#` for `L²` potentials on `ℝ` as open question Q2R (line 211–212). Its Theorem 1.4
(line 215–216) gives an `L²` potential for which `a` and `b` diverge at every real point; in that construction
`r = b/a*` converges uniformly (line 617–622), so the moduli converge. That agrees with §9.5–§9.6, which assert
convergence only of the moduli of `a` and `b`.

**How the repair differs from the suggestion.**

- **Contiguous numbering.** The suggestion keeps §9.6–§9.8 and leaves gaps at 9.4 and 9.5. I renumbered instead:
  old §9.6 → §9.4, §9.7 → §9.5, §9.8 → §9.6. No roadmap on main or in an open pull request cites this package's
  ids (the overlap check lists none; `roadmaps resolve` finds nothing).
- **Defined through §8.1.** `R(f)` is the set of `s` with `T₀(s, C)` and `T̃₀(s, C)` bounded for every `C`, so
  the definition reuses §8.1's sets.
- **Stronger Checks.** The `f ≡ c` Check is computed: for `0 < |s| < c`, `s ∈ R(f)` while `|E(t, s)|` grows,
  so square integrability cannot be dropped. At `s = 0`, `Ẽ(t, ·)` has a zero near `−2ic e^{−2ct}`
  (`−9.0808·10⁻⁵ i` at `c = 1`, `t = 5`) while `E(t, ·)` has none. So a definition through `E` alone would
  admit `0`; this is the discriminating Check for including `Ẽ`.
- **`Ẽ` handled in §9.5's route.** §9.4's API carries `Ẽ_f = −iE_{−f}` and `w_{−f} = w̃_f`, which §9.5's route
  uses to apply §8.7 to `−f`.
- **Why §9.5's route still works.** The route lowers `C(t)` of §8.7(1) to the function of §9.4, so that §8.7(2)
  applies.
- **Inherited claims and the new citation.** I checked the reviewer's claims that §9.3's route and the
  deductions (9.9)–(9.10) stand; §9.3 is unchanged. denisov2026 is cited in the Scope and References as
  evidence of the open status.

**Pattern.** The other places that relied on the deleted route are all updated:

- §8.9 named §9.6 as a consumer; now §9.3 only.
- §5.5's Check pointed to §9.7; now §9.6.
- "How to read the build" and the Summary said "the non-linear Carleson theorem"; both now state the
  conditional theorem.
- The poltoratski2024 reference said v14 "proves" the absence of resonances; it now says v14 "argues" it and
  that the moduli it compares do not determine the motion.
- Layer 9 Dependencies drop Taylor's theorem, `sinh` smoothness and Layer 7 (no Layer 9 target cites §7.x).
  They add §6.4–§6.5.

## F02 (P3) — applied

Old → new (README §8.6 route and plan.json target 8.6): "so `D(t, z(t), ·) = iβE(t, ·)`" → "so
`D(t, ·, z(t)) = iβE(t, ·)`, since `D(t, λ, z(t)) = βC(t, λ) + iβA(t, λ)`". The conclusion
`2|β|²w(s) = (1 + o(1)) sinh(2t y(t))` is unchanged.

Verified numerically in plain Python. For `f = 1` on `[0, 3]` with the zero
`z₀ = 1.34770 − 0.08418i` of `E(3, ·)` and `λ = 0.4 + 0.1i`:

- `D(t, λ, z₀) − iβE(λ)` has modulus `2·10⁻¹⁴`.
- `D(t, z₀, λ) + iβE(λ)` has modulus `2·10⁻¹⁴`.
- The old claim `D(t, z₀, λ) = iβE(λ)` is off by `29.3`.

Pattern: the only other uses of the three-argument `D` are the Layer 8 preamble, §8.5 and its Checks. They use
the order `D(t, λ, z)` correctly; for instance `D(t, λ, 0) = A(t, 0)C(t, λ)` since `C(t, 0) = 0`.

## Adversarial pass on the changed text

Computed values come from plain Python, with piecewise-constant fundamental matrices in closed form.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §9.4 definition | free case; `f = c1_{[0,T₀]}`; `f ≡ 1` at `s = 0.5, −0.3, 0.9, 0` | zero counts in `Q(s, 5/t)` by the argument principle: `s = 0.5`: `E` 0,0,0 and `Ẽ` 1,0,0 at `t = 10, 20, 40` (the `t = 10` zero is the one near `0`); `s = 0`: `Ẽ` has 1 at every `t`, zero `−4.1223·10⁻⁹ i` at `t = 10` against `−2e^{−20}i = −4.1223·10⁻⁹ i` | holds; `0 ∉ R(f)`, `(0, 1) ⊂ R(f)` | Checks 2–3 |
| §9.4 API 1, `C(t)` | `T_k = max(k, T(s,1..k))` | `t ∈ (T_k, T_{k+1}]` gives `t > T(s, k)`, and `C(t) = k → ∞` | holds | none |
| §9.4 API 2, conjugation | `f = 0.7` on `[0,1]`, `−0.4` on `[1,2]`, `z = 0.3 + 0.2i` | `A_{−f} − D_f`, `C_{−f} + B_f`, `B_{−f} + C_f`, `D_{−f} − A_f`, `Ẽ_f + iE_{−f}` all `0.0`; `m_{−f} + 1/m_f = 5·10⁻¹⁶`; `det M = 1` | holds | none |
| §9.4 API 3, compact support | same `f` followed by `1.5` of zero potential | `E(3.5) − e^{−1.5iz}E(2)` has modulus `4·10⁻¹⁶` | holds | none |
| §9.4 Check 4, moduli | heights `1, .99, .98` and their half-turn image | both give `0.0027860, 0.0028445, 0.0056305`; addition law exact to `10⁻¹⁸` | holds | Check added |
| §9.5 statement | free case; `w = 0.7`, `w̃ = 0.9`; `f = c1_{[0,T]}` at `0` | `(conj β − β)/√(ww̃) = 2i` for `β = −√(1−ww̃) − i√(ww̃)`; free `−iα = 1`, `−iβα = −i`; `w(0) = e^{−2cT}`, `w̃(0) = e^{2cT}`, limit `cosh² cT` | holds | none |
| §9.5 null set | `ww̃ = 0`; `f ≡ c` at `s = 1/2` | `s ∈ R(f)` but `\|E(10, ½)\| = 6434` against `e^{√0.75·10} = 5769` times `\|1 + (1 − i/2)/0.866\|/2 = 1.115` | `L²` needed; `N_f` includes `{ww̃ = 0}` | Check in §9.4, §9.6 |
| §9.6 statement | `w = 0.7`, `w̃ = 0.9`; integrable `f`; compact support; free case | denominator `\|1/√w + iβ/√w̃\|² = 4.5397 = 1/w + 1/w̃ + 2`; `\|A\|, \|C\| ≤ \|E\|` on `ℝ` since `A, C` are real there | holds | none |
| §8.6 route (F02) | `f = 1` on `[0,3]`, zero `z₀` | above | statement holds, route repaired | F02 |
| §8.9 consumer sentence | §9.3 at `p ∈ ℝ ∩ Q(s, C/2ⁿ⁺¹)` | the lemma's hypotheses are the same at every `p`, with `w(s)`, `w̃(s)` fixed | holds | rewording |
| Scope claims about denisov2026 | line 204–216, 617–622, 661–669 | Q2R posed; Theorem 1.4 for some `q ∈ L²(ℝ)`; `r` converges uniformly in the construction | as stated | none |

## Checks

Dependency gate:

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2243 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. No supplier was added, and the suppliers are unchanged:
AnalyticNumberTheoryPartI §0.23, AutomorphicSpectralTheory §0.5 and OperatorTheory/UnboundedOperators §4.8.

- **Citations.** `roadmaps resolve` on the README: none found nowhere.
- **Consistency.** README and plan.json both have 55 sections/targets with the same ids, 55 `**Checks.**`
  blocks (none with fewer than three bullets), and no dangling `target:` prerequisite. `sources.toml` parses.
- **Ownership.** `roadmaps grep -i 'resonance-free|non-linear Fourier|nonlinear Fourier'` has no match on main
  or in any open roadmap pull request. This roadmap owns `R(f)`; it is defined here because it is the hypothesis
  of its own §9.5–§9.6.

## For the maintainer

- **The headline is now conditional.** §9.6 proves convergence at almost every resonance-free point, not
  convergence almost everywhere. Whether to accept this, or to wait for a proof that almost every point is
  resonance-free, is the scope question the review leaves to the humans. The README now records why the
  unconditional statement is not claimed, in its Scope paragraph and the poltoratski2024 reference.
- **Renumbering (no external citers).** Layer 9 now runs §9.1–§9.6. Old §9.4 (insertion) and §9.5 (Lemma 10)
  are gone; old §9.6 → §9.4 Resonance-free points; old §9.7 → §9.5; old §9.8 → §9.6.
- **plan.json names.** Removed: `insertZeroInterval`, `sinh_ratio_gap`, `eventually_no_resonance_in_box`,
  `diracE_asymptotics_ae`, `nlft_truncate_tendsto_ae`. New: `resonanceFreePoints`,
  `diracE_asymptotics_resonanceFree`, `nlft_truncate_tendsto_resonanceFree`. No roadmap cites any of them.
- **New source.** `denisov2026` (arXiv:2605.25108 v2), open repository, certified. It is cited only for the
  status of the problem.
- **Untrusted text.** Nothing in the review or the sources asked for actions outside the job.
