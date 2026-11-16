# FIX-PKG-ConstructiveFieldTheoryPhi4~2

One review (`REV-PKG-ConstructiveFieldTheoryPhi4`, at 273ca98) with three P3 findings, all about locators. All three are right; each is applied, and the same pattern (a "Prove" paragraph with no locator) was repaired in one more place (README §3.6). No statement, hypothesis, Lean signature or Check changed. The review's "For the human reviewers" and "Source issues" sections list no finding; nothing was changed because of them.

## F01 (P3) — applied

Verified: in `aizenman-duminilcopin-2021` the page-4 marker is line 141; (1.11) is line 139 (p. 3), (1.12) is line 145 (p. 4), and (1.17) is line 230 (p. 5, which runs from line 189 to line 237). README §1.2: "(1.11)–(1.12), p. 4" → "(1.11)–(1.12), pp. 3–4". This now agrees with §1.1. Pattern search: every other Section-1 equation locator in the README ((1.4), (1.5)–(1.6), (1.7), (1.10), (1.12), (1.14)–(1.15), (1.16)–(1.17), (1.19), (1.20)) was checked against the page markers and is correct. The Lean docstring of `gibbsMeasure` gives no page.

## F02 (P3) — applied

Verified. `aizenman-duminilcopin-2021` lines 1314–1319 (Lemma 5.7, (5.38)) and lines 1342–1344 (footnote 5, the finite-volume factor `⟨τ_0τ_u⟩_Λ`) are on p. 30 (lines 1305–1345). No readable source states `χ ≤ 1/(1 − 2dβ)` itself:
- the Duminil-Copin lectures give the Simon and Lieb inequalities only as Exercise 40, p. 50;
- Peled–Spinka, Remark 2.7, p. 18, bounds a different critical point, the one for long-range order.

The locator therefore goes on the route's input, as the review proposes. README §4.3: "the Simon–Lieb inequality of 3.5 with Λ = {v}" → "… (in the finite-volume form of Aizenman–Duminil-Copin, Lemma 5.7 with footnote 5, p. 30)". The docstring of `criticalPoint_ising_ge` cites the same locator.

Same pattern: README §3.6, line 390 (the reflections satisfying the Messager–Miracle-Solé hypotheses) also had no locator. It now cites `aizenman-duminilcopin-2021` lines 1033–1038 (the list after (5.2), p. 23), which covers the coordinate hyperplanes and the hyperplanes `x_i − x_j = a`. The README adds that `x_i + x_j = a` is conjugate to `x_i − x_j = a` under `x_j ↦ −x_j`.

## F03 (P3) — applied

Verified. `sokal-1982` lines 846–853 and 857–863 (p. 342, before the page-28 marker at line 855, and p. 343) describe the integration-by-parts field equation, not a moment bound. README §3.7 already cites (3.4)–(3.5) for the identity only. The docstring of `phi4_secondMoment_le` changed from "(Sokal, Section 3.1, (3.4)–(3.5); README §3.7)" to "(derived from the integration-by-parts identity of Sokal, Section 3.1, (3.4)–(3.5), by Jensen's and the Cauchy–Schwarz inequalities; README §3.7)". Pattern search: no other place cites (3.4)–(3.5).

## Adversarial pass (statements whose locators changed)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.2 invariances (change of variables in (1.11)/(1.17)) | two Ising sites, swap g; non-even `ρ = (2δ₋₁+δ₁)/3`, J = 0 | swap: `⟨σ_x⟩ = ⟨σ_y⟩`; flip fails without evenness: `⟨φ_x⟩ = −1/3 ≠ 0` | sound; evenness needed for the flip | locator only |
| `criticalPoint_ising_ge` | d = 0; d = 1, β = ¼; two sites, β = 0.3 | d = 0: `(2·0)⁻¹ = ∞`, χ = 1 for all β, so β_c = ∞; d = 1: `χ = (1+tanh ¼)/(1−tanh ¼) = 1.648721 = e^{1/2} ≤ 2`; two sites: `χ_v = 1 + tanh 0.3 = 1.291313 ≤ 1 + 0.3·χ_w = 1.387394` | sound; the route's factor is `⟨σ_v²⟩_{{v}} = 1` for Ising spins (it would be `∫φ²dρ` for φ⁴, so the target is stated only for Ising spins) | locator only |
| `phi4_secondMoment_le` | (λ, b, K) = (1, 0, 0), (1, 1, 0), (1, −2, 0), (0.1, 3, 0), one site, by quadrature | ⟨φ²⟩ = 0.337989 ≤ M = 0.5; 0.520899 ≤ 0.809017; 0.172565 ≤ 0.5; 14.827200 ≤ 15.164855; the identity `4λ⟨φ⁴⟩ = 1 + 2b⟨φ²⟩` gives 1.000000 = 1.000000, 2.041797 = 2.041797, 0.309741 = 0.309741, 89.963198 = 89.963198 | sound for both signs of b; the bound is the positive root of `4λm² − (2b₊+K)m − 1` | docstring locator only |
| 3.6 reflections (`messager_miracleSole` hypotheses) | `x_i + x_j = a`, a ∈ ℤ; `x_i = a`, a ∈ ℤ + ½; d = 2, V = {0,1}², R(x) = (1 − x₂, 1 − x₁) | a site in V₊ has `x_i + x_j ≥ a + 1` and one in V₋ has `≤ a − 1`; one lattice step changes the sum by ≤ 1, so `J_{x,Ry} = 0`; for a ∈ ℤ + ½ the only neighbour pair (x, Ry) across the plane has y = x, excluded by distinctness; in the d = 2 example V₊ = {(1,1)}, V₀ = {(1,0),(0,1)}; conjugating by `x_j ↦ −x_j` maps `(x_i, x_j)` to `(a − x_j, a − x_i)` | sound; a ∈ ℤ needed for diagonals (otherwise R leaves ℤ^d) | locator only |

## Checks run

- **Elaboration.** `lake env lean packages/ConstructiveFieldTheoryPhi4/Suggested.lean`, run from the content checkout, gives 29 warnings `declaration uses sorry`, one per theorem (29 theorems), and no other message. The only import beyond `import Mathlib` is `TauCeti.Combinatorics.Enumerative.PerfectMatching`, which was already built.
- **Binders.** A scratch copy of the file with `#check @name` appended for all 60 declarations (29 theorems, 30 definitions and one structure, including `ReachabilityScheme.fieldLaw`, `ReachabilityScheme.HasLimitLaw` and `ReachabilityScheme.Converges`) elaborated with no error. Only docstrings changed, so no elaborated type changed. `phi4_secondMoment_le` keeps `[Fintype V] [DecidableEq V]`, `0 < lam` and the row-sum hypothesis. `criticalPoint_ising_ge` is `∀ d, (2 * ↑d)⁻¹ ≤ criticalPoint d (nnCoupling d) isingMeasure`, as in README §4.3.
- **Dependency check.** `gate --depcheck` printed `depcheck: 235 roadmaps, 2231 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Citations.** The two leads in the worker's citations list are `ReachabilityScheme.HasLimitLaw` and `ReachabilityScheme.fieldLaw`. Both are this roadmap's own declarations, confirmed by `#check`.

## Notes for the maintainer

- The locators are the only change. Every declaration name and every section or target id is kept, so nothing that other roadmaps cite has moved. `sources.toml` needed no change: its `aizenman-duminilcopin-2021` entry already lists (5.1)–(5.10) and Lemma 5.7 with footnote 5, and its `sokal-1982` entry already lists Section 3.1 ((3.4)–(3.5)). `plan.json` was not touched, and no supplier gap is needed.
- Nothing new was stated, so ownership did not change and needed no new check against the open pull requests.
- Nothing in the review text was suspicious.
