# Repair round 7 of the SpectralSequencesAndConvergence design

Review settled: REV-DESIGN-SpectralSequencesAndConvergence~6 (five findings: F01 P1, F02 P2,
F03 P2, F04 P3, F05 P3). Files edited: `packages/SpectralSequencesAndConvergence/design/README.md`,
`packages/SpectralSequencesAndConvergence/design/plan.json`,
`packages/SpectralSequencesAndConvergence/sources.toml` (locator list of `helle-rognes2024` gains
Definition 3.1; no new key, no fetch). The design stage has no `Suggested.lean`, so there was
nothing to elaborate and no `#check` comparison was run.

## REV-DESIGN-SpectralSequencesAndConvergence~6/F01 (P1) — applied

7.4: "converges strongly to `A^{+∞}` and `RA^{+∞} ≅ W^n`" → for total degree `n`, strong
convergence to `H^n := A_{n+1}^{+∞}`, `F^s H^n = ker(A_{n+1}^{+∞} → A_{n+1}^s)`, `k` inducing
`E_∞^{s,n−s} ≅ gr^s H^n`, and `RA_{n+1}^{+∞} ≅ W^{n+1}`. Towers written `A_n^s`; *Degrees*
paragraph; limit half-plane criterion now uses total degrees `n, n+1`. Two step-couple Checks.

Verified. The witness is an exact couple of the stated degrees. At `D^{1,0}`,
`ker(i : D^{1,0} → D^{0,1} = 0) = ℤ = im k`. At `E^{0,0}`, `ker k = 0 = im j`. Elsewhere
`i : D^{s+1,−s} → D^{s,1−s}` is the identity, so `im i = ℤ = ker j` and `ker i = 0 = im k`. All
colimits vanish, `j = 0` makes every `d_r = 0`, and `E_∞^{0,0} = ℤ`, while `A_0^{+∞} = 0` and
`A_1^{+∞} = ℤ`. The source agrees: in the proof of Theorem 3.10 (helle-rognes2024 line 237–245)
the graded pieces of the limit are identified with `E_∞` through `γ`. By Definition 3.1 (line
113–114) `γ` may have nonzero internal degree, and here `γ = k : E^{s,t} → D^{s+1,t}` raises
total degree by one. The colimit side (Lemma 3.15 (a), line 206–209) goes through `β = j`, of
degree 0, so the colimit theorem and 7.5 keep their degree.

I worked out the degree bookkeeping myself. The limit theorem in total degree `n` uses:
`colim A_n = 0` (so `Im(j)/B_∞ = 0`), `colim A_{n+1} = 0` (exhaustiveness) and `RE_∞ = 0` at total
degree `n` (so `Q_{n+1}^{s} → Q_{n+1}^{s+1}` is onto and `RQ` is constant). That is why the
statement reads "`RE_∞ = 0` at the positions of total degree `n`". The old half-plane criterion
(vanishing in degrees `n−1, n, n+1`, giving `W^n = 0`) controlled the wrong tower. The new one
asks vanishing in degrees `n, n+1` for `s > s₁`. Then `i` is an isomorphism on `A_{n+1}^s` for
`s > s₁`, every `Im^r A_{n+1}^s` stabilises, `Z_r` stabilises at total degree `n` (6.2), and
`RE_∞ = 0` with `RA_{n+1}^{+∞} = W^{n+1} = 0`. The reviewer's repair is the one applied, with
`A_n^{±∞}` in place of the suggested letter `L`, so that the existing Checks keep their notation.

Same pattern elsewhere: Conventions "Exact couples" now records the total-degree behaviour of
`i, j, k` and the shift, with a pointer to the witnesses. The 7.4 Checks (zero couple, identity
couple, Example 8.1) and 7.5's route now carry the degree subscript. The plan's 7.4 statement,
locator, API (`conditionallyConvergentToColimit`, `conditionallyConvergentToLimit`,
`wholePlaneObstruction`, `boardman_strongConvergence_limit`,
`wholePlaneObstruction_eq_zero_of_halfPlane`) and tests are updated, and plan 7.5 says the
colimit theorem is used in the same total degree. I checked the Example 8.1 Check again under
the new criterion. In total degree `0`, `E_1` is nonzero in degree `0` for every `s ≥ 0`, so the
limit criterion still does not apply, as stated.

## REV-DESIGN-SpectralSequencesAndConvergence~6/F02 (P2) — applied

4.1: "The same formulas hold for `coreE₂CohomologicalNat` and `coreE₂CohomologicalFin`, and for
`coreE₂HomologicalNat` with `q` replaced by `−q`" → three clauses on native carriers. ℕ×ℕ clause
assumes `X.HasSpectralSequence coreE₂CohomologicalNat`; homological clause assumes
`…coreE₂HomologicalNat` and uses `n = −p − q`. `Fin (l+1)` clause uses clamped indices and
registers the `HasFirstPageComputation` instance. Two Checks added.

Verified at the Mathlib pin, `Mathlib/Algebra/Homology/SpectralObject/HasSpectralSequence.lean`:
- line 214–221: `coreE₂CohomologicalFin l` lives on `SpectralObject C (Fin (l+1))` with positions
  `ℤ × Fin l` and `deg = p + q.val`. Its indices are `i₀ = (q − (r−2)).toNat`, `i₁ = q`,
  `i₂ = q + 1` and `i₃ = Fin.clamp (q + r − 1).toNat`, that is `max(0, q−r+2)`, `q`, `q+1`,
  `min(l, q+r−1)`.
- line 356: `HasSpectralSequence` is an instance for every `Fin`-indexed spectral object, and
  line 347 for `coreE₂Cohomological`.
- line 303: `HasSpectralSequence` is a class, and line 410 and 453 supply it for the ℕ×ℕ recipes
  only from `IsFirstQuadrant` and `IsThirdQuadrant`.
- `FirstPage.lean` line 54–66: `HasFirstPageComputation` instances exist for the three `EInt`
  recipes only. At `r = 2`, `i₀ = q = i₁` and `i₃ = min(l, q+1) = q+1 = i₂` because `q < l`, so
  the instance for `Fin` holds and is now a stated step.

I recomputed the crossing-boundary example. With `H^n(i ≤ j) = H^n(G_j/G_i)`, page 2 has
`E_2^{1,0} = H^1(0≤1) = ℤ` and `E_2^{−1,1} = H^0(1≤2) = ℤ`, and `d_2` is the connecting map of
`0 → K^1 → K → K^0 → 0`, which is the identity. The recipe's page 3 at `(1,0)` is
`E^1(−1≤0≤1≤2) = 0`. The class's clause `isZero_H_obj_mk₁_i₃_le` fails at `(1,0)`, `r = 2`
(`H^0(1≤2) = ℤ`), and so does `IsFirstQuadrant.isZero₂`. With the class, I checked that the
ℕ×ℕ formulas hold. If `H^{n+1}(q−r+1 ≤ q−r+2) = 0`, then `H^{n+1}(q−r+1 ≤ q) → H^{n+1}(q−r+2 ≤ q)`
is mono, so the kernels of `δ` agree; the entering side is dual. Same pattern: the Mathlib
supplier contract now names `HasFirstPageComputation` and `spectralSequenceFirstPageXIso` and
says on which recipes `HasSpectralSequence` is an instance and on which it is a hypothesis.
Scope now mentions the towers of the `Fin (l+1)` sequence. The plan's 4.1 statement, hypotheses,
prerequisites and tests are updated. 4.5 already carried `IsFirstQuadrant` and `IsThirdQuadrant`
and 2.1's assignments use `deg` as Mathlib does, so neither needed a change.

## REV-DESIGN-SpectralSequencesAndConvergence~6/F03 (P2) — applied

1.1: "A presentation with `B = ⊥` and `Z = ⊤` is the identity presentation" → "For `A = X`, the
presentation `(⊥, ⊤, e)` with `e` the canonical identification … is the identity presentation;
transport along it is the identity. The two subobjects alone do not fix `e`." New Check: the
coordinate swap on `ℤ²` sends the axis `ℤ × 0` to `0 × ℤ`.

Verified: the definition makes `e` data, and with `e` the swap the preimage of `ℤ × 0` is
`0 × ℤ`. The plan's `refl` API already said "canonical iso". Its wording now matches the README,
the 1.1 statement records the claim, and the test `presentation_swap_marking` is added. No other
passage asserts identity transport from the subobjects alone. 1.4's rebasing goes through the
presentations of 1.2, which carry `E.iso`.

## REV-DESIGN-SpectralSequencesAndConvergence~6/F04 (P3) — applied

5.3 Check "a filtration finite on `K^0` and `K^1` but not on the zero terms" → the reviewer's
degreewise-finite complex (`K^m = ℤ`, `m ≥ 0`, `d = 0`, `F^p K^m = ℤ` iff `p ≤ m`), plus a
sentence that zero terms admit only the finite zero filtration. Plan test `zero_terms_trivial` →
`degreewise_not_uniformly_finite`.

Verified: `Subobject 0` is a single point. In the replacement, `gr^p K = ℤ` in degree `p` and
`E_1^{m,0} = ℤ`. `H^m(F^s K) = ℤ` iff `m ≥ s`, so the hypotheses hold in degree `n` with
`p₁ = n` and `p₀ = n + 2`. All differentials vanish, `d` being 0, and `gr^n H^n = ℤ = E_∞^{n,0}`.
No `b` has `F^b K = 0`, so the bullet on Tau Ceti's
`filtrationSpectralSequencePageXIsoGradedOfFinite` (a global `F^a = ⊥`, `F^b = ⊤`) does not apply.

## REV-DESIGN-SpectralSequencesAndConvergence~6/F05 (P3) — applied

Layer 3 Examples: "The vanishing of `d_r` for odd `r` is a degeneration statement on odd pages"
→ "Every differential of an odd page vanishes, so the homology of an odd page identifies it with
the next page; this does not assert degeneration (1.3) at an odd page …", with the reviewer's
witness (`d_1 = 0`, `d_2 = id`, `E_2 ≠ E_3 = 0`).

Verified: browning-sawin2020 line 75 and line 575 assert only that the odd-page differentials
vanish. 1.3 defines degeneration at `s` as the vanishing of every differential of every page
`r ≥ s`. No other passage calls odd-page vanishing degeneration (grep "odd").

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 7.4 limit clause, shifted | limit step couple; zero couple; `D = ℤ`, `i = id`, `E = 0` | step: `E_∞^{0,0} = ℤ`, `A_1^{+∞} = ℤ`, `F^0 = ℤ`, `F^1 = 0`, `gr^0 = ℤ`; unshifted `A_0^{+∞} = 0`; zero: all 0; identity: colim `ℤ ≠ 0`, hypothesis fails | holds; unshifted model refuted |
| 7.4 `RA_{n+1}^{+∞} ≅ W^{n+1}` | limit step couple, `n = 0` | `RA_1^{+∞} = lim¹(ℤ, id) = 0`; `W^1 = colim_s lim¹_r(constant) = 0` | holds |
| 7.4 colimit clause (unchanged degree) | colimit step couple; Example 8.1 | step: `A_0^{−∞} = ℤ`, `F^0 = ℤ`, `F^1 = 0`, `gr^0 = ℤ = E_∞^{0,0}`, `W^0 = 0`; Example 8.1: `W^0 = ∏k/⨁k` = meet | holds, no shift |
| 7.4 limit half-plane, degrees `n, n+1` | limit step couple `n = 0`, `s₁ = 0`; Example 8.1 `n = 0, −1` | step: `E_1 = 0` for `s > 0` in degrees 0, 1, gives `RE_∞ = 0`, `W^1 = 0`; Example 8.1: degree-0 `E_1 ≠ 0` for all `s ≥ 0`, so it does not apply | holds |
| 7.4 colimit half-plane | colimit step couple | `E_1 = 0` for `s < 0` in degrees −1, 0; `A_0^s → A_0^{−∞}` iso for `s ≤ 0`; `W^0 = 0` | holds |
| Conventions: `k` raises total degree | `c = (1,0)`: `E^{s,t}` (degree `s+t`) → `D^{s+1,t}` (degree `s+t+1`); `j`, `i` keep `s+t` | witnesses as above | holds |
| 4.1 ℕ×ℕ clause with the class | crossing-boundary `K`; first-quadrant `ℤ →(×2) ℤ` | `K`: page-2 homology at (1,0) is `ℤ`, recipe page 3 is `0`, class fails; with class, kernels agree by the mono `H^{n+1}(q−r+1≤q) → H^{n+1}(q−r+2≤q)` | holds; hypothesis needed |
| 4.1 Fin clause | `l = 2`, `r = 2, 3`; `l = 0`; `l = 1`, `q = 0`, `r = 5` | r=3: (0,0,1,2), (0,1,2,2); r=2: (q,q,q+1,q+1); l=0: no positions; l=1: (0,0,1,1), so `Z = ⊤`, `B = ⊥` | holds |
| 4.1 homological clause | `p = q = 0`, `r = 2`; `p = 1`, `q = 0`, `r = 3` | (0,0,1,1), `n = 0`; (−1,0,1,2), `n = −1`, `δ : H^{−1}(0≤1) → H^0(−1≤0)` | holds |
| 4.1 Fin `HasFirstPageComputation` | `q = l − 1` | `i₃ = min(l, l) = l = q + 1` | holds |
| 1.1 identity presentation | canonical `e`; swap on `ℤ²`; `X = 0` | canonical: axes fixed; swap: `ℤ×0 ↦ 0×ℤ`; `X = 0`: one point | holds; marking needed |
| 5.3 replacement Check | `n = −1, 0, 3` | `n = −1`: `p₁ = −1`, `p₀ = 1`, `H^0(F^1K) = 0`; `n = 0`: `gr^0H^0 = ℤ`; `n = 3`: `H^3(F^sK) = ℤ` iff `s ≤ 3`, `p₀ = 5` | holds |
| 3 Examples, odd pages | `d_1 = 0`, `d_2 = id` on `ℤ` at (0,1), (2,0) | `E_1 = E_2`, `E_3 = 0`; odd `d` all zero; not degenerate at 1 | holds |

## Checks

Dependency check (`gate --only SpectralSequencesAndConvergence`), after the edits:

    candidate: SpectralSequencesAndConvergence is not in the merge order yet; checked as if placed after StableHomotopyKTheory (the intake inserts it when its design is accepted)
    depcheck: 240 roadmaps, 2176 edges, 0 problem(s)

No UPWARD or CYCLE line. `roadmaps resolve` on the edited README: no unresolved cross-roadmap
citation and no unresolved Lean name. `plan.json` parses as JSON and `sources.toml` as TOML. No
gate failures were listed for this round.

## For the maintainer

- No supplier changes, no new targets, no renamed ids, and no backticked name of this roadmap's
  own. No other roadmap cites the changed 7.4 or 4.1 statements by content.
- StableHomotopyKTheory §7.26 (open, read at its head) states Boardman's theorems for towers of
  spectra without a degree identity. 7.4 calls itself "the algebraic content" of §7.26. If §7.26
  later states the limit identification with a degree, it must include the same shift by the
  degree of `k`. This is a note, not a change here.
- Ownership against open work: no new construction was introduced. The `Fin` first-page instance
  sits in this roadmap's own 4.1, where Mathlib's recipe is used.
- No suspicious instructions were found in the review text.
