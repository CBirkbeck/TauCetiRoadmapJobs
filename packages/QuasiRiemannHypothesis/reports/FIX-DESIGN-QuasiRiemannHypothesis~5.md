# FIX-DESIGN-QuasiRiemannHypothesis~5: repair of the design review

Review answered: `REV-DESIGN-QuasiRiemannHypothesis~4` (3 findings: 1 P2, 2 P3; F03 has four parts).
Files changed: `packages/QuasiRiemannHypothesis/design/README.md`,
`packages/QuasiRiemannHypothesis/design/plan.json` (11 layers, 55 targets, 161 tests, `gaps = []`),
`packages/QuasiRiemannHypothesis/sources.toml` (one locator, one `cited_for`). No target was added,
removed or renumbered. The review's "For the human reviewers" section was read and nothing was changed
for it.

## F01 (P2) — applied

§7.3: "for every `ε > 0` … when `(1 + T₁)^A ≤ U^(ε/10)`" → "for every `ε' > 0` there is
`ε₀(ε', r_max)` … when the bin parameter satisfies `ε ≤ ε₀` and `(1 + T₁)^A ≤ U^(ε'/10)`", with the loss
computation in the route. §7.4 and §10.4: loss `ε'`, bin parameter small in terms of `ε'`. `plan.json`
7.3, 7.4, 10.4 changed to match.

Evidence: `openai2026quasiRH` lines 2574–2576 (Lemma 8.2: `ε₀` depends only on the loss and the length
ranges; the garbled hypothesis line carries the bound on the bin parameter), line 2603 ("taking" the
bin parameter and `ε₁` small in terms of the prescribed loss), lines 2627–2628 (Proposition 8.3 assumes
"the loss and height hypotheses of Lemma 8.2"), and lines 2983–2986 (Proposition 9.2, the same).
Witness, recomputed: the shifted line gives `U^(δr + 12εr + 2ε₁)`, which exceeds `U^(δr + ε)` at
`r = 1`. The repair as tested: with `ε₀ = ε'/(48 r_max)`, `ε₁ = ε'/8` and `A ≥ 2C`, the exponents are
at most `δr + ε'/2` and `δ(1 − m) + 3ε'/4`, and the height factor `(3 + T₁)^(2C) ≤ 9^C (1 + T₁)^A` is at
most `9^C U^(ε'/10)`. In total `0.85ε' < ε'`.

Same pattern elsewhere: §10.4 had "for every `ε > 0`, after reducing the losses of §7.4" while `ε` is also
the parameter of the bin it is stated for. It now has `ε'` and "with the bin parameter `ε` small enough
in terms of `ε'` as in §7.4", the review's suggested wording, but with `ε'` so that one letter does not
name two numbers. This matches §10.5, which already uses `ε` for the bin and `ε'` for the loss. The
other uses of `ε` in Layers 9–10 (§§9.4, 10.2, 10.7) are local losses and do not refer to a bin; they
were left as they are.

## F02 (P3) — applied

§7.4: "the `O(ε)` constants are absolute" → "the `O(ε')` constants depend only on the floor `a₀` (they
are `O(1/(2a₀ − 1))`, absolute at the source's `a₀ = 51/100`)". The route now states
`2δ(m − 1/2)₊ ≪ ε'`, hence `m ≤ 1/2 + O(ε'/δ)` with `δ > 2a₀ − 1`. Examples: `|M_r|² ≫ U^(δ/2 − O(ε'))`,
derived from `δr − ε' ≥ δ/2 − (C'δ + 1)ε'`. There is a new Example on the floor dependence.

Evidence: `openai2026quasiRH` lines 2702–2703 derive the bound from `δ ≥ 1/50`. Computed: at
`a₀ = 51/100`, `1/(2δ) < 25`; at `a₀ = 1/2 + 10⁻⁶`, `1/(2δ)` is about `2.5 · 10⁵`. `plan.json` 7.4
records the dependence on `a₀`.

## F03 (P3) — applied

- §5.1: `|D_𝔯(σ + it)| ≪_ε` → `≪_{K,ε}`. `plan.json` 5.1 now carries `≪_{K,σ₀,ε}`, `≪_{K,ε}` and
  `≪_{σ₀}`. New Check and test: a field of degree `d` in which `2` splits completely, `a_𝔭 = −1`. Then
  `D_𝔯(0) = 2^d = N𝔯` against `2^(dε)`, and `D_𝔯(σ₀) = (1 + 2^(−σ₀))^d`. The logarithmic-derivative bound
  `log N𝔯/(2^(σ₀) − 1)` is independent of `K`, so it keeps `≪_{σ₀}`. Such fields exist in every degree:
  take a monic integer polynomial 2-adically close to `∏(x − i)` and irreducible modulo another prime.
- §10.5, retained integral: "restricted as in `openai2026quasiRH` (10.14)" → the restriction stated in
  the roadmap's own words. Arguments have imaginary part `γ_j + Σ_{k ≤ n_v} a_jk v_k`, with
  `|γ_j| ≤ (3i + 1)T₁` and `|v_k| ≤ T₁/(2n_v(1 + max_j |a_jk|))`; the three Mellin heights are among
  the `v_k`. So the added height is `< T₁/2` and the arguments stay below `(3i + 2)T₁`. New Check and test:
  `n_v = 3`, coefficients `(1, −3, 0)`, giving `5T₁/24 < T₁/2`, against `2T₁/3` without the factor
  `1 + max|a|`. Evidence: `openai2026quasiRH` lines 3456–3469 and 3486 (p. 77). The review writes `m`
  for the number of heights; it is `n_v` here because `m` is already used in §10.5 (the external-tails
  bullet) and in Layer 7. No other hypothesis in the README is stated only by a reference to a source.
- Downstream consumers: "**ExplicitMultiplicativeFunctions**" → "**ExplicitMultiplicativeFunctions,
  Part II**". Confirmed at that roadmap's open head: its "Zero-free inputs" section says of the
  half-plane that none of its consequences is planned. Same pattern: the bullet "**SieveMethodsAndPrimePatterns** §2.9 and its successors" named a roadmap
  on main that supplies `SieveApplications.leastNonresidue` to §11.3 and does not plan the
  `(log p)^12` bound (its §2.9 has the definition and Linnik's theorem only). It is now
  "**SieveMethodsAndPrimePatterns, Part II**". The `plan.json` consumers are updated to match.
- `sources.toml`, `liu2026improved`: `locator` gains "(1.2)" and `cited_for` gains "1.2"
  (`liu2026improved` line 307 is the display; README §1.2 cites it). `plan.json` 1.2's locator gains
  "liu2026improved (1.2)". A mechanical comparison of every source's `cited_for` with the README
  sections that cite it found no other mismatch.

## Checks

Dependency check (`gate --candidate … --only QuasiRiemannHypothesis`), after all edits:

    candidate: QuasiRiemannHypothesis is not in the merge order yet; checked as if placed after BianchiModularForms (the intake inserts it when its design is accepted)
    depcheck: 261 roadmaps, 2606 edges, 0 problem(s)

No UPWARD or CYCLE line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name
found nowhere. The earlier lead `SieveApplications.leastNonresidue` is a declaration that
SieveMethodsAndPrimePatterns §2.9 names on main.

No `Suggested.lean` exists at the design stage, so nothing was elaborated and there was no
`#check` pass. A scan of the added text found no LaTeX delimiters, process words or machine paths. A
7-word shingle scan of the added text against the cached `openai2026quasiRH` and `liu2026improved` found
no shared run, after one 8-word list ("a buffered L-value, reciprocal or logarithmic derivative") was
reworded.

Ownership: no construction was added. The only consumer names that changed are the two Part II names
above. Ownership against the open pull requests was checked with `roadmaps show` for
ExplicitMultiplicativeFunctions (open) and SieveMethodsAndPrimePatterns (main), and neither has a
Part II yet.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §7.3 `M_r` bound | `r = 1`, `r = r_max`; `ε = ε₀ = ε'/(48 r_max)`, `ε₁ = ε'/8` | `12εr ≤ ε'/4`, `+ 2ε₁ = ε'/2`; at `r = 1` without `ε ≤ ε₀`: `12ε > ε` for every `ε > 0` | holds with the bin hypothesis | F01 |
| §7.3 `S_m` reflected | `m = 0, 1, 2, 3`; `C` of §7.2 | `(24 − 12m)ε = 24ε, 12ε, 0, −12ε ≤ ε'/2`; `+ε'/4`; `(3 + T₁)^(2C) ≤ 9^C(1 + T₁)^A`, `A ≥ 2C`; total `0.85ε'` | holds | F01 |
| §7.3 `S_m` direct | `m = 1/4` | `δ/4 + 3ε + 2ε₁ ≤ δ/4 + ε'/2` | holds | none |
| §7.4 comparison | `a₀ = 51/100`; `a₀ = 1/2 + 10⁻⁶` | `2δ(m − 1/2)₊ ≤ 3ε'/2` (losses `ε'/2` each): `m − 1/2 < 37.5ε'`; `≈ 3.75 · 10⁵ ε'` | constant `O(1/(2a₀ − 1))` | F02 |
| §7.4 individual bounds | `m ≤ 1/2`; `m > 1/2` | `δ min(m, 1 − m) ≤ δm` in both, so `|M_r|² ≫ U^(δr − ε')` after the product bound is divided by `|S_m|²` | holds | none |
| §7.4 Example | `r ≥ 1/2 − C'ε'` | `δr − ε' ≥ δ/2 − (C'δ + 1)ε'` | `U^(δ/2 − O(ε'))`, not `U^(δ/2 − ε')` | F02 |
| §10.4 | floor `51/100`, `t = 1` | `r ≥ 1/2 − O(ε')` with constant `< 25 · 3/2`; `R(1/50) = 1`, `R(1) = 1/2`, `R(2/3) = 2/3` | holds | `ε'` |
| §5.1 second bound | degree `d`, `2` split completely, `σ = 0` | `2^d` against `2^(dε)` | constant depends on `K` | F03 |
| §5.1 first bound | same field, `s = σ₀` | `(1 + 2^(−σ₀))^d / 2^(dε) → ∞` when `2^ε < 1 + 2^(−σ₀)` | constant depends on `K` | F03 |
| §5.1 log-derivative | any `K` | `Σ log N𝔭/(N𝔭^(σ₀) − 1) ≤ log N𝔯/(2^(σ₀) − 1)` | `K`-free | none |
| §10.5 height restriction | `n_v = 3`, `(1, −3, 0)`; general | `T₁/12 + 3T₁/24 = 5T₁/24 < T₁/2`; `|a_jk v_k| ≤ (M_k/(1 + M_k)) T₁/(2n_v) < T₁/(2n_v)`; `(3i + 1) + 1/2 < 3i + 2` | holds; without `1 + max|a|`: `2T₁/3` | F03 |
| consumers | ExplicitMultiplicativeFunctions; SieveMethodsAndPrimePatterns | scope lines read at head and on main: neither plans the consequence | Part II | F03 |

## For the maintainer

- No name that another roadmap cites changed. No roadmap cites QuasiRiemannHypothesis.
- The Downstream consumers list now names two planned Part II roadmaps
  (ExplicitMultiplicativeFunctions, Part II; SieveMethodsAndPrimePatterns, Part II). Neither exists
  yet, and neither base roadmap is asked to change.
- No suspicious instruction was found in the review text.
