# Repair of DiracScatteringAndNonlinearFourierTransform (design, round 13)

This round answers the three findings of `REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~12`: F01 (P2), F02 (P3) and F03 (P3). Files edited:

- `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md`: Scope, §8.7, §8.8 route, Layer 8 Examples, §9.4 third bullet, §9.5 route, References.
- `packages/DiracScatteringAndNonlinearFourierTransform/design/plan.json`: targets 8.7 (statement, one test reworded, one test added), 8.8, 9.4 (third API bullet) and 9.5.
- `packages/DiracScatteringAndNonlinearFourierTransform/sources.toml`: `version_note` of `poltoratski2024`, `locator` and `cited_for` of `mnatsakanyan2022`, `locator` of `denisov2026`.

There is no `Suggested.lean` at the design stage. So nothing was elaborated and the `#check` comparison does not apply. `needs-references.toml` was not written, because every text this round needed is in the cache. The review's "For the human reviewers" section asks for no edit, and none was made for it.

## F01 (P2) — applied

Old → new. §8.7 gains clause (3): at almost every `s`, if every `T₀(s, K)` is bounded, then `E(t, ·) + iα e^{−itz}/√w(s) → 0` on every `Q(s, D/t)`. It comes with its own constant-box route and the reviewer's √t Check. The §9.5 route now reads: `N_f` from §8.7(3) for `f` and `−f`; resonance-freeness makes every `T₀(s, K)` bounded, so §8.7(3) applies.

**Verification.** The finding is right.

- §8.7(1) asserts convergence for one function `C(t)`, and only along `T₁(s, C)`. Since `T₁` decreases in `C`, lowering `C` enlarges the time set, and (1) says nothing on the added times.
- I recomputed the witness: `log t − √t ≤ log 4 − 2 = −0.614 < 0`, so the zero `s + (log t)/t − i/(2t)` lies in `Q(s, √t/t)` above height `−1/t`. It also leaves `Q(s, K/t)` once `t > e^K`.
- The proposed (3) is true. Its route needs only §8.5 on constant boxes and §7.2:
  - §7.2's disc of radius `3|y − x|/ε < 24π/(εt)` about a point of `J_t` lies in `Q(s, (4π + 24π/ε)/t)`.
  - The two-term form differs from `e^{itx₀}e^{−itz}/√w` by `O(δe^D)` on `Q(s, D/t)`.

**How the text differs from the suggestion.**

- **The parameter set in the route of (3) is pinned down.** It is the set of two-term forms with `c₁c₂w = cos(t(x₂ − x₀))` and `c₁`, `c₂` bounded. Without it, `t(x₂ − x₀) ≡ π`, `c₁ = c₂` would give a second form with constant phase derivative and break the choice of `ε`.
- **The two-term form had a sign error, now fixed.** The route printed `E ≈ −cos(t(z − x₂))/(c₂w) − …`. The correct form is `+cos`:
  - `A(t, z) = D(t, x₁, z)/c₂` and `C(t, z) = D(t, z, x₀)/c₁` hold exactly. For `f = 0.7·1_{[0,1]} − 0.4·1_{[1,2]}` at `t = 2`, the residual is `1.3·10⁻¹⁵` at `z = 0.37 + 0.21i`.
  - In the free case `+cos` gives `e^{−itz}`, while `−cos` gives `−e^{itz}`.
  - The route now names `x₀, x₁, x₂, c₁, c₂` and the relation `c₁c₂w = cos(t(x₂ − x₀)) + o(1)`. The free-case Check records the witness.
- **(2) states its own hypothesis.** It now reads "if the approximation of `E` in (1) holds at `s` for a function `C(t) → ∞`", which is the source's Corollary 3(2) (line 1008–1012). Before, "this" would have pointed at the new Ẽ clause too.

**Pattern: the other places that use §8.7 at a function it does not supply.**

- **Layer 8 Examples.** It said "§8.7(2) holds" for compact support. (2) needs `t ∉ T₀(s, C(t))` for the function of (1), which nothing guarantees there. It now says the conclusion of §8.7(3) holds at every `s`, with `E(t, z) = e^{−itz}e^{iTz}E(T, z)`.
  - Computed for `f = 1_{[0,3]}`, `s = 0.5`, `D = 2`: the supremum error is `64.9`, `8.30`, `0.849` at `t = 10, 100, 1000`, so `t·error` stays near `650–850`, an `O(1/t)` error.
  - `w(0.5) = |E(3, 0.5)|^{−2} = 0.004458`.
- **§8.8 route.** "§8.7 for `E` and `Ẽ`" needs one function for both. With two functions `C_E ≠ C_Ẽ`, neither their minimum nor their maximum works: the minimum leaves the times uncovered, the maximum the boxes.
  - §8.7(1) now states that one function `C(t)` gives the approximations of both `E` and `Ẽ` (with `w̃`, `T̃₀`, `T̃₁`).
  - Its route says why: the functions of §8.5 and §8.6 come from diagonal arguments over constant box sizes, which can be run for both at once (poltoratski2024 line 832–833, 879, 907–909).
  - §8.8's route cites "§8.7(1) for `E` and `Ẽ`, with their common function `C(t)`".
- **§9.4.** The first API bullet (the function with empty boxes) is unchanged; it is still a true statement about `R(f)`. §9.5 no longer uses it.

## F02 (P3) — applied differently

Old → new.

- **Scope.** "Its published proof has an error" now reads: an error in the proof of Lemma 11 of an earlier arXiv version, which mnatsakanyan2022 cites as the 2021 e-print. The Scope adds that version 14 has no Lemma 11.
- **denisov2026.** "states … as an open question" becomes "poses as a question (Q2R) whether … `b/a#` … converges".
- **References and manifest.** The References entry and the `version_note` drop "published version".

**Why differently.**

- **No "arXiv versions of 2021–2022".** mnatsakanyan2022 line 1812–1813 cites the e-print arXiv:2103.13349 of 2021 with no version number, so the suggested phrase cannot be checked. I wrote "an earlier arXiv version … which mnatsakanyan2022 cites as the e-print … of 2021" instead.
- **Lemma 11 is not in version 14.** A grep of the v14 text finds Lemmas 1–10 and no Lemma 11.
- **Denisov's quotient is `b/a#`, not `b/a`.** Q2R (line 211–212) asks about `b/a#` in its own normalisation (line 165–195), for `q·χ_{|x|<T}` (line 165). The text names that quotient rather than this roadmap's `b/a`.

**Pattern.** The same claim also appeared in `mnatsakanyan2022.cited_for` in `sources.toml` ("the published proof"); it now reads "the proof of Lemma 11 of an earlier arXiv version". `grep published` finds no other occurrence in the README or plan.json.

## F03 (P3) — applied

Old → new (§9.4 third bullet and its plan.json mirror): "the finitely many with `|Re ζ − s| ≤ C/T₀`" → "the finitely many in the compact box `Q(s, C/T₀)`, which contains `Q(s, C/t)` for `t ≥ T₀`". I added "for some `T₀ > 0`", because `Q(s, C/T₀)` needs `T₀ ≠ 0`; `f = 0` is still covered through `[1, ∞)`.

**Verification for `f = 1_{[0,3]}`, `s = 1.3`, `C = 1`.**

- `Q(1.3, 1/3)` contains exactly one zero of `E(3, ·)` (argument principle), namely `1.3477019 − 0.0841825i`. So `δ = 0.08418` and `C/δ = 11.88`.
- `Q(1.3, 1/t)` contains 1 zero at `t = 5` and `t = 11`, and 0 zeros at `t = 12` and `t = 20`.

**Pattern.** The Layer 8 Example drew the same conclusion from "all at positive distance from `ℝ`". It now uses the compact box `Q(s, C/T)`, which contains at most finitely many zeros.

## Adversarial pass on the changed text

All values were computed in plain Python, with piecewise-constant fundamental matrices in closed form, generator `[[f, −z], [z, −f]]`.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §8.7 route, two-term form | `f = 0.7·1_{[0,1]} − 0.4·1_{[1,2]}`, `t = 2`; free case `t = 3`, `z = 0.4 − 0.3i` | `x₀ = 0`, `x₁ = −2.485625`, `c₁ = 1.349859`, `c₂ = 0.816774`; identity residual `1.3·10⁻¹⁵`, `2.4·10⁻¹⁵`; `+cos` form `− e^{−itz}`: `6·10⁻¹⁷`; `−cos` form `= −e^{itz}` exactly | sign was wrong | `−cos` → `cos`; free Check extended |
| §8.7 route, normalisation | `w = 0.7`, `a = 0.3`, `c₁ = 1.3`, `c₂ = cos a/(c₁w)` | `\|Q\|² − \|P\|² = 1.428571 = 1/w`; `γ(1.7)² sinh(3.4)/(2w) = 1.428571` | holds | relation `c₁c₂w = cos(t(x₂ − x₀))` added to the route |
| §8.7(3) route, choice of `ε` | ratio `sup/inf` of the phase derivative over `J_t` | `a = 0`, `c₁ = c₂ = 1`: `1.0000000`; `a = 0.1`: `1.2218`; `a = 0`, `c₁ = 1.05`: `1.2155`; `a = 0.3`: `1.8390` | `1` only at the exponential | parameter set stated |
| §8.7(3) | free case; reviewer's configuration; geometry of §7.2 | `α = i`, residual `0`; `log t − √t ≤ −0.6137`; `t > e^K` ⇒ `(log t)/t > K/t`; disc radius `< 24π/(εt)`, centre within `4π/t` of `s` | holds; not implied by (1), (2) | clause and Check added |
| §8.7(2) | approximant zero at bounded `ty ≤ M` | a zero within `π/(2t)` of `s` at height `≤ M/t`; Rouché with `\|approximant\| ≥ γ(M)c(r)/√w` on radius `r/t` puts a zero of `E` in `Q(s, C(t)/t)` | holds for any `C(t) → ∞` | hypothesis reworded |
| §8.7(1) common function | free case | `E`, `Ẽ` have no zeros, `T₁ = T̃₁ = (0, ∞)`; every `C(t)` serves both | holds | clause added (supports §8.8) |
| Layer 8 Example | `f = 1_{[0,3]}`, `s = 0.5`, `D = 2` | sup error `64.9`, `8.30`, `0.849` at `t = 10, 100, 1000`; `w(0.5) = 0.004458` | holds at every `s` | cites §8.7(3) |
| §9.4 bullet 3 | `f = 1_{[0,3]}`, `s = 1.3`, `C = 1`; `T₀ = 0` | one zero, `δ = 0.08418`; counts `1, 1, 0, 0` at `t = 5, 11, 12, 20`; `Q(s, C/0)` undefined | holds with box and `T₀ > 0` | F03 |
| §9.5 route | free case; conjugation | `α = i`, `β = −i`; zeros of `E_{−f} = iẼ_f` are those of `Ẽ_f`, so `T₀^{−f}(s, K) = T̃₀(s, K)`; the `Ẽ` limit `Ẽ + α′e^{−itz}/√w̃` gives `β = −iα′/α`, unimodular | holds | route rewritten |
| Scope and References (F02) | mnatsakanyan2022 line 9–13, 135–137, 1812–1813; poltoratski2024 v14 grep; denisov2026 line 165–195, 204–216 | `[Pol21]` = 2021 e-print, Lemma 11 on p. 48; v14 Lemmas 1–10 only; Q2R on `b/a#` with `q·χ_{\|x\|<T}`, no word "open" | as now stated | wording |

## Checks

**Dependency gate** (command of the brief):

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 243 roadmaps, 2248 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. Suppliers are unchanged: AnalyticNumberTheoryPartI §0.23, AutomorphicSpectralTheory §0.5 and OperatorTheory/UnboundedOperators §4.8. Declared supplier gaps: none.

- **Citations.** `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name that is missing everywhere.
- **Consistency.**
  - README and plan.json both have 55 sections/targets with the same ids, and 55 `*Needs:*` lines.
  - The README has 55 `**Checks.**` blocks, none with fewer than three bullets; §8.7 now has four.
  - The plan.json statements of 8.7, 8.8, 9.5 and the 9.4 bullet equal the README text, whitespace aside.
  - `sources.toml` parses with 13 entries.
- **Ownership.** No new object or target was introduced: (3) and the common-function clause are clauses of this roadmap's own §8.7. So no ownership question arises against main or the open pull requests.
- **Gate failures listed in the brief.** None.

## For the maintainer

- **No ids changed.** Section numbers and target names are unchanged. plan.json gains one test name in target 8.7: `clauseThreeNotFromOneAndTwo`. No other roadmap cites this package.
- **New dependency in §8.8.** §8.8 now depends on the common-function clause of §8.7(1). That clause rests on the source's own diagonal arguments (line 832–833, 879, 907–909). A later reviewer may want it stated in constant-box form, as §8.5 is; only §9.3 consumes §8.8, and §9.3 has no consumer inside the roadmap.
- **Untrusted text.** The review contains no instruction to run anything or act outside the job.
