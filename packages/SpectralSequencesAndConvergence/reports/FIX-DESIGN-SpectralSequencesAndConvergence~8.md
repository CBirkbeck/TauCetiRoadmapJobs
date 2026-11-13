# Repair round 8 of the SpectralSequencesAndConvergence design

Review settled: REV-DESIGN-SpectralSequencesAndConvergence~7 (one finding: F01, P2). Files edited:
`packages/SpectralSequencesAndConvergence/design/README.md` and
`packages/SpectralSequencesAndConvergence/design/plan.json`. `sources.toml` is unchanged: the
cited Stacks tags 012W and 0BDW are already in the `stacks-012K` entry, and no new work is cited.
This is the design stage, so there is no `Suggested.lean`. Nothing was elaborated and no `#check`
comparison was run.

## REV-DESIGN-SpectralSequencesAndConvergence~7/F01 (P2) — applied

README 3.4: the Euler bullet "Under a finite filtration in every degree and finitely many nonzero
positions on page `r`, all in `P`: …" now reads "*Euler identity.* Suppose `E` converges weakly to
`H` in every total degree (`I = ℤ`), every `H^n` has a finite filtration, and page `r` has finitely
many nonzero positions, all in `P`. Then …". It now has an explicit route, and two Checks were
added.

**Verification.** The finding is correct. Take the standard assignment `(p, q) ↦ (p, p + q)` over
`ℚ`, with `P` the finite-dimensional spaces and `v = dim`. Let all pages be zero, `H^1 = ℚ` with
`F^p H^1 = ℚ` for `p ≤ 0` and `0` for `p ≥ 1`, and every other `H^n = 0`.

- Weak convergence in `I = {0}` holds: `H^0 = 0`, and every `E_∞` of total degree `0` is `0`.
- Every filtration is finite.
- The page sum is `0` and the abutment sum is `(−1)^1 · 1 = −1`.

So the old statement is false. Stacks proves the identity for a finitely filtered complex, which
converges in every degree by Lemma 24.11 before Lemma 24.12 is applied (stacks-012K line
3152–3158 and line 3175–3197). The repaired hypotheses match that.

**Route written into 3.4.** I checked each step myself.

- Vanishing persists to later pages (2.2). So for every `r′ ≥ r`, the nonzero positions of page
  `r′` lie inside the finite set `S` of nonzero positions of page `r`.
- Let `f₋` and `f₊` be the least and greatest filtration degree of a position in `S`. On page
  `r′` a differential raises the filtration degree by `r′ − e` (2.1). For `r′ > f₊ − f₋ + e`, a
  differential leaving a nonzero position lands at filtration degree above `f₊`, which is a zero
  object.
- Hence `E` degenerates at `R = max(r, f₊ − f₋ + e + 1)` (1.3), and `E_∞ ≅ E_R` everywhere (1.4).
  If `S` is empty, every page from `r` on is zero.
- Iterating 2.3 from page `r` to page `R` shows the page sums agree.
- In each degree, weak convergence plus the finite filtration gives
  `v(H^n) = Σ_{deg pq = n} v(E_∞(pq))`. Injectivity of `(fil, deg)` (2.1) puts each graded piece
  at one position. `H^n = 0` when no position of `S` has total degree `n`, so only finitely many
  `H^n` are nonzero.

The local clauses (strong convergence, the finite chain, vanishing, Serre class) still need
convergence in degree `n` only, and the text now says so. The *Needs* line now lists 1.3, 1.4 and
2.2 for the Euler identity. The plan's prerequisites gain `target:1.3` and `target:1.4`.

**Checks added to README 3.4** (plan tests `euler_needs_all_degrees`,
`euler_needs_finite_filtrations`):

- The reviewer's witness as a negative control. Convergence fails in degree 1 because
  `gr^0 H^1 = ℚ` while `E_∞^{0,1} = 0`. The paired positive case puts `ℚ` at `(0, 1)` on every
  page with zero differentials; it converges in every degree and both sums are `−1`.
- A control for the finite-filtration hypothesis, which I kept. Take zero pages and `H^0 = ℚ` with
  the constant filtration. Weak convergence holds in every degree because all graded pieces are
  `0`, but the abutment sum is `1` and the page sum is `0`.

**plan.json 3.4.** The statement now separates the local clauses from the Euler identity and adds
the route. Its hypotheses are split into three entries: local clauses; Euler identity (weak
convergence with `I = ℤ`, finite filtrations of every `H^n`, finite support on page `r` in `P`);
and the conditions on `P` and `v`.

**The same pattern elsewhere** (conclusions in several degrees, or about `H^n`, drawn without
convergence in those degrees):

- README 3.6, two rows. "Over all `n` with convergence these splice into a long exact sequence"
  became: the sequences for `n` and `n + 1` share the map `E_2^{n,1} → E_2^{n+2,0}`. Convergence in
  every degree of an interval splices them into one exact sequence over that interval. Convergence
  in every degree gives the long exact sequence
  `⋯ → E_2^{n+1,0} → H^{n+1} → E_2^{n,1} → E_2^{n+2,0} → H^{n+2} → ⋯`. The plan's 3.6 statement
  got the same clause.
- plan.json 3.6, two columns. The plan statement had no convergence hypothesis; it now says
  "convergence in degree `n`", as the README already did. Without it the clause is false: zero
  pages with `H^n = ℚ` under the constant filtration break `0 → 0 → ℚ → 0 → 0`.
- plan.json 3.6, first quadrant. The edge morphisms now require "convergence in degree `n`", and
  the extended sequence for `m ≥ 1` requires "convergence in all degrees `≤ m + 1`". This matches
  the README's "convergence in degrees up to `m + 1`".
- No change needed in the other places I checked:
  - the other users of 3.4 (3.6, 4.4, and a Check in 5.3) use only the local
    clauses;
  - 2.3 is a statement about pages;
  - 4.5, 5.3, 5.4, 7.4 and 7.5 assume their hypotheses in every degree they conclude about;
  - no other Euler identity appears in the README or the plan.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| 3.4 Euler, old hypotheses | Zero pages, `I = {0}`, `H^1 = ℚ` with `F^0 = ℚ`, `F^1 = 0` | Page sum 0; abutment sum −1 | False; repaired as above |
| 3.4 Euler, old hypotheses | Zero pages, `I = {0}`, `H^m = ℚ` for all `m > 0` | Page support empty; abutment support infinite | Finiteness claim false; repaired |
| 3.4 Euler, repaired | `ℚ` at `(0,1)` on every page, `H^1 = ℚ` | Page −1; abutment −1; `R = max(r, 0 − 0 + 0 + 1)` | Holds |
| 3.4 Euler, repaired | ×2 example over ℚ: `E_2^{0,1} = E_2^{2,0} = ℚ`, `d_2` iso | `f₋ = 0`, `f₊ = 2`, `e = 0`, `R = 3` (degenerates at 3, not 2, as in the 1.3 Check); page-2 sum `−1 + 1 = 0`; `E_3 = 0` forces every `H^n = 0`; abutment 0 | Holds |
| 3.4 Euler, repaired | Length: `E_2^{0,1} = ℤ/4`, `E_2^{2,0} = ℤ/2`, `d_2` onto | `R = 3`; `E_3^{0,1} = ℤ/2`, `E_3^{2,0} = 0`; `H^1` of length 1; abutment −1; page `−2 + 1 = −1` | Holds |
| 3.4 Euler, repaired | Classical assignment `e = 1`, filtered complex `ℤ →(×2) ℤ`, native positions `(1,−1)`, `(3,−2)`, `r = 2` | `fil` = 0, 1; `R = max(2, 1 − 0 + 1 + 1) = 3`; the native page-2 differential `×2` is nonzero, page 3 is `E_∞` with `ℤ/2` at fil 1; `H^1 = ℤ/2` | Bound correct for `e ≠ 0` |
| 3.4 Euler, repaired | Empty support on page `r` | All later pages 0; `E_∞ = 0`; finite filtrations force every `H^n = 0`; both sums 0 (empty sums) | Holds |
| 3.4 Euler, repaired | Constant filtration `H^0 = ℚ`, zero pages, convergence in every degree | Abutment 1, page 0 | Finite filtrations needed; Check added |
| 3.4 route bound | `e` large negative | `R = max(r, …) ≥ r ≥ r₀`; no page below `r₀` arises | Holds |
| 3.4 local clauses | Unchanged; `ℤ/4` versus `ℤ/2 ⊕ ℤ/2` | Length `2 = 1 + 1` in both | Unchanged |
| 3.6 two-row splicing | Hopf pages `E_2^{0,0} = E_2^{0,1} = E_2^{2,0} = E_2^{2,1} = ℤ`, `d_2` iso, convergence everywhere | Degrees `n = −1, 0, 1, 2` give `H^0 = ℤ`, `H^1 = 0`, `H^2 = 0`, `H^3 = ℤ`; consecutive pieces share `E_2^{n,1} → E_2^{n+2,0}` | Holds |
| 3.6 two-row splicing | Convergence only in degrees `{1, 3}` | The pieces for `n = 0` and `n = 2` share no map (`E_2^{0,1} → E_2^{2,0}` versus `E_2^{1,1} → E_2^{3,0}`) | "Interval" is needed |
| plan 3.6 two columns | Zero pages, `H^n = ℚ`, constant filtration (no convergence) | `0 → 0 → ℚ → 0 → 0` not exact | Convergence in degree `n` needed; added to plan |
| plan 3.6 first quadrant | `j < 0`, convergence in degree `j` | First-quadrant `E_∞` of total degree `j` is 0; exhaustive and separated give `H^j = 0 = E_2^{j,0}` | Holds under "all degrees `≤ m + 1`" |

## Checks run

Dependency check (the brief's command), output in full:

    candidate: SpectralSequencesAndConvergence is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
    depcheck: 240 roadmaps, 2177 edges, 0 problem(s)

There is no UPWARD and no CYCLE line. `plan.json` parses as JSON and `sources.toml` as TOML.

## For the maintainer

- No Lean names, section numbers or targets were added, renamed or removed. No other roadmap's
  citation is affected.
- Ownership: the repair narrows hypotheses of this roadmap's own target 3.4; it adds no new
  construction. `roadmaps grep` finds no Euler identity for spectral-sequence pages, and no
  citation of Stacks Lemma 24.12 (tag 0BDW), on main or in any open roadmap pull request. So no
  second owner exists.
- No source was fetched and `needs-references.toml` was not written.
- Nothing in the review text was read as an instruction.
