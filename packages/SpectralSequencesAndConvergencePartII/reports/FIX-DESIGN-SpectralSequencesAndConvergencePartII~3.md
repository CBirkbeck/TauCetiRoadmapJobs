# FIX-DESIGN-SpectralSequencesAndConvergencePartII~3: repair report

Files changed: `packages/SpectralSequencesAndConvergencePartII/design/README.md` (§5.1 statement, route and
one new Check; §6.2 route and one extended Check) and
`packages/SpectralSequencesAndConvergencePartII/design/plan.json` (target 5.1 statement, API
`ExactCouple.Pairing.satisfiesMassey_succ_iff`, new test `index_shift_from_one`; target 6.2 test `z_mod_pr`).
`sources.toml` is unchanged: every locator used is may-primer line 249–287 or 136–168, inside the ranges
the manifest already records. No new target, no layer change, no Lean name added, renamed or removed.

## REV-DESIGN-SpectralSequencesAndConvergencePartII/F01 (P2) — applied

Confirmed (computation below). Old: "under `μ_0`, `φ` satisfies `μ_n` iff `φ′` satisfies `μ_{n−1}`". New: "under
`μ_0`, for every `m ≥ 0`, `φ` satisfies `μ_{m+1}` iff `φ′` satisfies `μ_m`", with a route showing where `n ≥ 1`
is used (`j₁i₁ = 0`, `iⁿk = 0`). The `ℤ →(×4) ℤ` witness is a new negative-control Check. Same change in
`plan.json` 5.1 statement and API.

## REV-DESIGN-SpectralSequencesAndConvergencePartII/F02 (P3) — applied

Confirmed: a cocycle `u` has `du = 0`, so `f^r w = 0` forces `w = 0`. Old: "a cocycle `u` of `M` with
`du = f^r w`". New: "a cochain `u ∈ Mⁿ` whose reduction modulo `f^r` is a cocycle has `du = f^r w` for a unique
`w`, a cocycle since `f^r dw = d²u = 0`". The `ℤ/p^r` Check (README and `plan.json` `z_mod_pr`) now
computes this representative.

## Evidence for the two findings

**F01.** may-primer line 252–268: `μ_n` is defined for `n ≥ 0` (line 266), and Proposition 4.1 (line 267–268)
states the shift to `n − 1` without a lower bound; the proof (line 269–279) writes `a′ = i₁(a)` and
`k₁(x) = i₁ⁿ(a)`, which only makes sense for `n ≥ 1`. The design's former sentence inherited the gap. Witness,
recomputed in the README's bigrading (`D^{s,t} = H^{s+t}(M)`, `E^{s,t} = H^{s+t}(M/2M)`, `i : D^{s+1,t−1} → D^{s,t}`
is `×2`, `j` degree `(0,0)`, `k` degree `(1,0)`), for `M = (ℤ →(×4) ℤ)` in degrees `0, 1`:
`H⁰(M) = 0`, `H¹(M) = ℤ/4`, `H⁰(M/2) = H¹(M/2) = ℤ/2`; `k(1) = [4/2] = 2 ∈ D^{1,0}`; `j(2) = 0` so `d₁ = 0`
everywhere (`k` on `E^{s,1−s}` lands in `H²(M) = 0`). Pairing: `𝔽₂` product on `E^{s,−s} × E^{s′,−s′}`, zero
otherwise. `μ_0(φ)`: both sides 0, true. `μ_1(φ)`: `x = y = 1 ∈ E^{0,0}`, `a = b = 1 ∈ D^{2,−1}` (`2·1 = 2`); any
`c ∈ D^{2,−1}` with `2c = 2` is odd, `j(c) = 1`, while `j(a)·1 + 1·j(b) = 0` (products of total degree `1` with
`0` vanish): false. `φ′ = φ` on `E₂ = E`; `d₂(1) = j(a) = 1 ∈ E^{2,−1}` (bidegree `(2,−1)`), so
`d₂(1·1) = 1 ≠ 0 = d₂(1)·1 + 1·d₂(1)`: `μ_0(φ′)` false. Repaired `m = 0`: false ⟺ false; former reading at
`n = 0` with `0 − 1 = 0`: true ⟺ false. The converse direction, which may-primer line 279 leaves as "proven
similarly", was checked step by step and its route is now in the README: `x` is a `d`-cycle since
`jk(x) = j iⁿ(a) = 0` for `n ≥ 1`; `μ_m` for `φ′` gives `[j(c)] = [j₁(a)y ± x j₂(b)]` in `E′`, so the two differ by
`jk(z)`; `c − k(z)` still has `iⁿ(c − k(z)) = iⁿ(c)` because `ik = 0` and `n ≥ 1`.

**F02.** For `u ∈ Mⁿ` with `du ∈ f^r M^{n+1}`: `du = f^r w` with `w` unique because `f` (hence `f^r`) is injective
on `M^{n+1}` (the standing hypothesis of 6.1); `f^r dw = d(du) = 0` gives `dw = 0`. Lifting `u mod f` to `u`,
`du = f·(f^{r−1}w)`, so `k(u mod f) = [f^{r−1}w] = f^{r−1}[w]`; lifting `u mod f^r` to `u mod f^{r+1}`,
`du ≡ f^r·w`, so `β_r(u mod f^r) = w mod f`. Both formulas kept; only the hypothesis on `u` changed.

## Pattern search (other occurrences)

- Index shifts with a natural-number `n − 1`: README lines with `n−1` are the abutment `Ext^{n−1}` in the
  hypercohomology Check (2.4, abutment in degrees `1, 2` only), the `ℤ`-graded universal-coefficient sequence
  `Ext¹(H_{n−1}X, M)` (4.2, `n ∈ ℤ`), `f^{r−1}` with `r ≥ 1` throughout 6.2, and `E_2^{n−1}` in the Hatcher
  Check (`n ∈ ℤ`). None ranges over `ℕ` with a junk value at `0`; no change. In `plan.json` the two
  occurrences named by the review (5.1 statement and API) are the only `μ_{n−1}`; both repaired.
- Representatives called cocycles: "cocycle" occurs once in the README (the 6.2 route, repaired) and not at
  all in `plan.json`. The analogous representative in the 5.2 route ("a representative `x̃` of `x` with
  `dx̃ ∈ F^{p+n+1}A`") is already a cochain of `F^pA`, not a cocycle, and is correct: `k₁(x) = [dx̃]` equals
  `iⁿ(a)` in `H(F^{p+1}A)`, and correcting `x̃` by a cochain of `F^{p+1}A` makes `dx̃` represent `a`.

## Checks run

Dependency check (the brief's `gate` command, after all edits):

```text
candidate: SpectralSequencesAndConvergencePartII is not in the merge order yet; checked as if placed after ArithmeticGaloisDuality (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2177 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `plan.json` parses as JSON; it has 24 targets and 87 tests (one added). README
lines touched are wrapped at the file's width; no LaTeX delimiters, machine paths or process wording added.

Lean: this is the design stage and the package has no `Suggested.lean`, so there is no declaration to
`#check` and no elaboration was run; no Lean name in the README or plan changed.

Ownership: no new object, construction or supplier is introduced (the repairs restate an existing target and
an existing route), so the ownership and overlap position of the previous round is unchanged and was not
re-searched. No gate failures were listed for this round.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| 5.1 equivalence `μ_{m+1}(φ) ⟺ μ_m(φ′)` under `μ_0` | Bockstein couple of `ℤ →(×4) ℤ`, `f = 2`, `m = 0` | `μ_1(φ)`: `j(c) = 1` vs right side `0`, false; `μ_0(φ′)`: `d₂(1·1) = 1` vs `0`, false | false ⟺ false: holds. New Check. |
| same | `ℤ →(×p^r) ℤ`, `f = p`, `r ≥ 2`, `𝔽_p` product in total degree `0` | `k(1) = p^{r−1}`; `μ_n(φ)` needs `pⁿa = p^{r−1}`, solvable iff `n ≤ r−1`, and then `j(c) = 1` iff `n = r−1`; so `μ_n(φ)` fails only at `n = r−1`. Derived couple `D′ = pℤ/p^r ≅ ℤ/p^{r−1}`: `μ_m(φ′)` fails only at `m = r−2` | `μ_{m+1}(φ)` and `μ_m(φ′)` fail at the same `m = r − 2`: holds for every `m`. `r = 3`, `m = 0`: true ⟺ true. |
| same | Zero pairing | `c = 0` for every `n`; `φ′ = 0` | true ⟺ true for every `m`. |
| same | Bockstein couple of `ℤ` (`k = 0`, `i = ×ℓ`) with `ℤ/ℓ` product | `iⁿ(a) = 0` forces `a = 0`, `c = 0`; derived couple again has `k′ = 0`, `D′ = ℓℤ` | true ⟺ true for every `m`. |
| same, hypothesis `μ_0` | Stupid filtration of `ℤ →(×2) ℤ` | `d(1·1) = 2`, Leibniz side `0` | `μ_0` fails, `φ′` undefined: excluded by the hypothesis, as stated. |
| 5.1 consequence "μ for `φ` ⇒ μ for every `φ_r`" | Zero pairing; `k = 0` Bockstein couple | Both satisfy every `μ_m` on every page | Still follows: `μ` gives `μ_0` and every `μ_{m+1}`, hence every `μ_m(φ′)`. |
| 5.1 route (converse) | `ℤ →(×4) ℤ` at `m = 1` (`n = 2`) | `k(1) = 2 = i²(a)` needs `4a = 2` in `ℤ/4`: no `a`; only `x` with `k(x) = 0` are admissible | Vacuously consistent; `iⁿk = 0` used with `n = 2`. |
| 6.2 route: cochain `u` with `u mod f^r` a cocycle | `ℤ →(×p^r) ℤ`, `u = 1` | `du = p^r`, `w = 1`, `k(1) = p^{r−1}[1] ∈ ℤ/p^r`, `β_r(1) = 1` | `d_r` an isomorphism, matching the `ℤ/p^r` Check; extended that Check. |
| same | `ℤ →(×p^{r+1}) ℤ`, `u = 1` | `w = p`, `k(1) = p^r[1]`, `β_r(1) = p mod p = 0` | `d_r(1) = 0`; the isomorphism is `d_{r+1}`, as the `ℤ/p^r` Check with `r+1` predicts. |
| same | `r = 1`, `ℤ →(×p) ℤ` | `w = 1`, `k(1) = [1]`, `β₁(1) = 1` | Agrees with 6.1's sign Check `d_1 = +1`. |
| same | `M = ℤ[0]` | `u = 1` is a cocycle of `M`, `w = 0` | `k = 0`, all `d_r = 0`, agreeing with 6.1's `ℤ[0]` Check. |
| same, uniqueness of `w` | `M = ℤ/p[0]`, `f = p` | `p·M = 0`: `f^r` not injective, `w` not unique | Excluded by 6.1's standing hypothesis (its negative-control Check). |
| same | `f` a unit (`A = ℤ`, `f = 1`) | `M/fM = 0` | Every page `0`; the formulas are statements about `0`. |

## Notes for the maintainer

- No Lean names, target ids or section numbers changed; no consumer inside or outside this roadmap is
  affected. The plan API name `ExactCouple.Pairing.satisfiesMassey_succ_iff` already had the `succ` form;
  only its statement changed.
- The review's "Source issues" (may-primer Proposition 4.1 index range; Example 2.3's free summand) are not
  findings. The first is the origin of F01 and the README now says the source's index is positive; the
  second does not touch the README, whose Hatcher Check already gives `ℤ/p` for a free summand.
- The review's "For the human reviewers" items (the base `SpectralSequencesAndConvergence` must be accepted
  and ordered first; four uncertified works not compared) need no edit and none was made.
- No text in the review was treated as an instruction; nothing suspicious found.
