# FIX-PKG-SpectralSequencesAndConvergence~5

Review settled: `REV-PKG-SpectralSequencesAndConvergence~4` (two findings, both P3). Both are
README repairs; `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are
unchanged.

## F01 (P3) — applied

Verified. For `q ≥ b`, `b − q + 1 ≤ 1 < 2`, so `max(2, q − a + 2, b − q + 1) = max(2, q − a + 2)`;
this equals `q − a + 2` only when `q ≥ a`, and 4.4 imposes no order between `a` and `b`. Witness:
zero spectral object, `a = 5`, `b = 0`, `q = 1`: `max(2, −2, 0) = 2`, `q − a + 2 = −2`.

4.4 (`packages/SpectralSequencesAndConvergence/README.md`): "from page `q − a + 2` with zero limit
page if `q ≥ b`" → "from page `max(2, q − a + 2)` with zero limit page if `q ≥ b`". Added a Check
*No order between the bounds* with the witness above and `ℤ →(×2) ℤ` at `q = 0`.

Pattern search: `q − a + 2`, `b − q + 1`, `b − a + 1` and "from page" occur elsewhere only at
README 4.3's stabilisation bullet (`max(q − i + 2, j − q + 1)` with `i ≤ q < j`, both terms
`≥ 2`, correct), README 4.4's Lean paraphrase and `Suggested.lean` line 136/154 (the theorem
quantifies over `r ≥ 2` with both inequalities, correct). No other occurrence.

## F02 (P3) — applied

Verified. "First-quadrant filtered complex" occurs only in 7.5's last Check; 2.2 and 3.6 define
first-quadrant spectral sequences, and a filtration with `E_1` in the first quadrant need not
satisfy 7.5's or 5.3's hypotheses (constant filtration of `ℤ`: `E_1 = 0`, not complete).

7.5 Checks: the bullet → a Check defining the class by `F^0 K = K` and `F^{m+1} K^m = 0` (this
forces `K^m = 0` for `m < 0`, so the review's third condition is dropped as redundant), deriving
finiteness, boundedness (`β(n) = n + 1`, `α(n) = −1`), regularity and the lower bound, 5.3's
`p₁ = 0`, `p₀ = n + 2`, the review's worked example, and the constant filtration as non-example.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 4.4 page bound, clause `a ≤ q < b` | `a = −2`, `b = 0`, `q ∈ {−2, −1}` | `max(2, 2, 3) = 3 ≤ 3 = b − a + 1`; `max(2, 3, 2) = 3 ≤ 3` | holds | none |
| 4.4 page bound, clause `q ≥ b` (new) | zero object `a = 5`, `b = 0`, `q = 1`; `q = 7`; `ℤ →(×2) ℤ`, `n = 1`, `q = 0` | `max(2, −2) = 2 = max(2, −2, 0)`; `max(2, 4) = 4 = max(2, 4, −6)`; `max(2, 4) = 4 = max(2, 4, 1)` | holds | clause replaced |
| 4.4 "zero limit page if `q ≥ b`" | `ℤ →(×2) ℤ`, `n = 1`, `q = 0` | `EInfty 0 1 ≅ gr^1 H^1 = F^1/F^2`, `F^1 = abutmentFiltration 1 1 = ℤ/2`, `F^2 = abutmentFiltration 0 1 = im(H^1(G_0) → H^1) = ℤ/2`, quotient `0` | holds | none |
| 4.4 `q < a` and `q ≥ b` | zero object, `q = 1` | page-2 object zero by the bullet "`q < a` gives zero page-2 object"; bound `2` | holds | none |
| 7.5 class `F^0 K = K`, `F^{m+1} K^m = 0` | `m = −1`; `m = −2` | `K^{−1} = F^0 K^{−1} = F^{m+1} K^{−1} = 0`; `K^{−2} = F^0 K^{−2} ⊆ F^{−1} K^{−2} = 0` | `K^m = 0` for `m < 0` | condition dropped as implied |
| `gr^p K^m ≠ 0` only for `0 ≤ p ≤ m` | `p = −1`; `p = m + 1` | `F^{−1}/F^0 = K^m/K^m = 0`; `F^{m+1} K^m = 0` | holds | none |
| `E_1^{p,q} = 0` unless `p, q ≥ 0` | `E_1^{p,q} = H^{p+q}(gr^p K)` | needs `p ≥ 0` and `p ≤ p + q` | holds | none |
| exhaustive and complete (7.5's sense) | degree `m` | join `F^0 K^m = K^m`; `K^m / F^p K^m = K^m` for `p ≥ m + 1`, limit `K^m` | holds | none |
| bounded (2.2) with `β(n) = n + 1`, `α(n) = −1` | total degree `n`, filtration `p` | `E_1^{p,n−p} = 0` for `p ≥ n + 1` (`p > p + q` impossible) and for `p ≤ −1` | holds; bounded below ⇒ regular (2.2) | none |
| 5.3 with `p₁ = 0`, `p₀ = n + 2` | `n = −1`; `n = 3` | `F^s K^{n} = 0` for `s ≥ n + 1`, `F^s K^{n+1} = 0` for `s ≥ n + 2`; `F^s K = K` for `s ≤ 0` | holds | none |
| worked example `K^m = ℤ`, `d = 0`, `F^p K^m = ℤ` iff `p ≤ m` | `n = 0, 2` | `F^0 K = K`, `F^{m+1} K^m = 0`; `E_1^{n,0} = ℤ`, all `d_r = 0`, `gr^n H^n = ℤ` | holds | `n ≥ 0` stated |
| non-example: constant `F^p K^0 = ℤ` | `ℤ` in degree `0` | `E_1 = 0`; `H^0 = ℤ`; `lim_p ℤ/ℤ = 0 ≠ ℤ`; `H^0(F^s K) = ℤ` for all `s` | not complete, 5.3 fails | added as non-example |

## Checks

- Elaboration: `lake env lean packages/SpectralSequencesAndConvergence/Suggested.lean` from the
  content checkout: exit 0; eight "declaration uses `sorry`" warnings (lines 99, 111, 150, 175,
  194, 224, 250, 270), nothing else.
- Signatures: one scratch file with `#check @name` for all 11 declarations, elaborated once (exit
  0). Every elaborated type matches its README statement and the worker's `signatures.md`; no
  binder lost. `convergence_of_hasConvergenceBounds` asks for `2 ≤ r`, `q − a + 2 ≤ r`,
  `b − q + 1 ≤ r`, which is the corrected README bound. Nothing changed.
- Dependency check (`gate --depcheck … --movable`):

      depcheck: 242 roadmaps, 2194 edges, 0 problem(s)

  No UPWARD, CYCLE or moved line.
- Citations (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name found
  nowhere. The worker's two leads (`DoubleComplex.edgeBottom`, `edgeLeft`, README line 365) are
  DerivedModuleAlgebra's names, cited as that roadmap's; not touched by this round.

## Gate failures

None listed.

## For the maintainer

- No Lean name, section number or target id changed; no consumer is affected. No new source or
  locator; `sources.toml` and `needs-references.toml` untouched.
- Ownership: no construction was added; the 7.5 Check is a worked consequence of this roadmap's own
  5.3 and 7.5, so no ownership search was needed.
