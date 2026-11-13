# FIX-PKG-NonordinaryCMSpecialValues~8

Round 8 repair of the NonordinaryCMSpecialValues package, settling the three findings of `REV-PKG-NonordinaryCMSpecialValues~7`. All three are correct P3 defects in README Checks and all three are applied. Searching for the same patterns turned up two more Checks that needed scoping: §0.3, which lacked `p ∤ f`, and §2.8, which did not say why `φ` is unramified at `p`. Both are repaired. Only `packages/NonordinaryCMSpecialValues/README.md` changed. `Suggested.lean`, `sources.toml`, `metadata.toml` and `design/plan.json` are untouched. No headline theorem, target statement, Lean name or citation changed.

## F01 (P3) — applied

§3.2, first Check: "so `l` divides both `[F_n : H] = 2208 · 47^{2n}` and `[L[r] : K] = 23^r`" → "so for `r ≥ 1`, `l` divides both … (at `r = 1`, `gcd(2208, 23) = 23`) …; at `r = 0`, `L[0] = K`, the degrees `2208 · 47^{2n}` and `1` are coprime, and disjointness is immediate."

Same pattern, §3.2 third Check: "a coprime-degree argument would fail for `l | (p² − 1)p^{2n}`" → "for `l | (p² − 1)p^{2n}` a coprime-degree argument fails at every `r ≥ 1` and applies only at `r = 0`, where `L[0] = K`."

Verified: `47² − 1 = 2208 = 23·96`. §3.1 allows `r = 0` with `L[0] = K`. The §3.1 Check "`l | (p + 1)` is allowed" makes no claim about `r` and needs no change. An admissible example exists: `p = 229` (inert, since `229 ≡ 5 mod 7`), with `l = 23 | 230`.

## F02 (P3) — applied

§2.6, first Check: "`χ = 1`, `r = 1`: … `1 − φ̄((p))/p² = 1 + 1/p`" → "`χ = 1`, `r = 1`, `ψ = φ` conjugation-equivariant as in §0.1, `p` inert and `φ` unramified at `p`: §0.1 gives `φ̄((p)) = −p`, so … `1 + 1/p`".

New negative-control Check, using `y² = x³ − x` over `Q(i)`:
- At the split prime 5, `φ(𝔭) = −1 ± 2i` and the deletion is `8/5`. This equals `1 − a_5/5 + 5/25`, where `a_5 = −2`. The single-ideal expression gives `4/5` and the inert formula gives `6/5`; both are wrong.
- At the ramified conductor prime 2, the deletion factor is `1`.

Same pattern, two more places:
- §0.3, Check on the trivial `p`-character: added "for `p ∤ f`", and the case `p | f`, where the factor is `1`.
- §2.8, Check "`χ = 1`": added the reason `φ` is unramified at `p`. `E` has good reduction above `p` (§0.4), and `p` splits completely in `H`, so the local norm is the identity.

The §5.3 Checks and the Layer 2 Examples are already in a setting where `p` is prime to the conductor (canonical `φ` with `p ∤ D`, or `Q(√−7)` with `p = 5`). They need no change.

## F03 (P3) — applied

§5.1, first Check: "the opposite twist `Qφ̄(a)ν(a)` shifts the central point to `s = −1`" → "`L(λ_ν, s) = L(φ̄ν, s + 1)` has centre `s = 0`. The opposite twist `N·φ̄ν` has `L(Nφ̄ν, s) = L(φ̄ν, s − 1)` and centre `s = 2`; its value at `s = 0` is `L(φ̄ν, −1)`."

Added a worked case: `Q(√−7)`, the prime `(5)`, `φ̄((5)) = −5`.
- The three Euler denominators all equal `6/5`: the divided twist at `s = 0`, `φ̄` at `s = 1`, and the opposite twist at `s = 2`.
- The opposite twist at `s = −1` gives `3126`.

No other passage in the README claims a centre shift (searched for `centre`, `central point`, `s − 1)`, `s + 1)`, `norm twist`). The Conventions' unitary normalisation `η|·|^{1/2}`, which moves the centre to `1/2`, is correct: `L(ηN^{−1/2}, s) = L(η, s + 1/2)`.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| §3.2 noncoprime-degree Check | `p = 47`, `l = 23`, at `r = 0, 1, 2` and `n = 0` | `[F_0:K] = 2208`, `[L[r]:K] = 1, 23, 529`; gcds `1, 23, 23` | `r ≥ 1` needed and added; `r = 0` stated as the coprime case |
| §3.2 inertness/splitting data | `(−7/47)`, `(−7/23)` | `40²³ ≡ 46 ≡ −1 mod 47`; `−7 ≡ 16 = 4² mod 23` | unchanged, correct |
| §3.2 third Check | `l | (p² − 1)p^{2n}`, `r = 0` vs `r ≥ 1` | gcd `1` at `r = 0`, `23` at `r ≥ 1` | scoped to `r ≥ 1` |
| §2.6 inert deleted factor | `Q(√−7)`, canonical `φ`, `p = 5` inert, unramified | `φ̄((5)) = −5`; `1 + 5/25 = 6/5`; `v_5 = −1` | correct under the added hypotheses |
| §2.6 split control | `Q(i)`, `y² = x³ − x`, `p = 5` | `#E(F_5) = 8`, `a_5 = −2`; `((6+2i)/5)((6−2i)/5) = 40/25 = 8/5`; single ideal `1 − 5/25 = 4/5` | added as a negative control |
| §2.6 ramified control | same curve, `p = 2`, `(1+i) | f = (1+i)³` | primitive factor `1` | added |
| §2.6 non-equivariant φ | `φ((p)) = ε·p`, `ε` a root of unity ≠ `−1` | factor `1 − ε̄/p ≠ 1 + 1/p` | equivariance hypothesis added |
| §0.3 trivial-`p` deletion | `p ∤ f` inert: `p = 7`, `y² = x³ − x`; `p | f` | `1 + 7/49 = 8/7`, `v_7 = −1`; at `p | f` factor `1` | `p ∤ f` added, `p | f` case added |
| §2.8 `χ = 1` factor | BKO setting, `E` good above `p`, `(p)` principal so split in `H` | `H_w = K_p`, `ψ_{E,w} = φ_p` unramified; `φ̄((p)) = −p` | reason added; value `1 + 1/p` unchanged |
| §5.1 divided twist | `η = φ̄`, `Q = 25`, `η((5)) = −5` | coefficient `−1/5`; denominator at `s = 0`: `6/5`; `φ̄` at `s = 1`: `6/5` | centre `0` confirmed |
| §5.1 opposite twist | same | coefficient `−125`; denominators at `s = 2`: `1 + 125/625 = 6/5`; at `s = −1`: `3126`; at `s = 0`: `126` | centre `2` stated (was `−1`) |
| Conventions unitary centre | `η N^{−1/2}` | `L(ηN^{−1/2}, s) = L(η, s + 1/2)`, centre `1/2` | unchanged, correct |

Every value in the table was recomputed with exact rational arithmetic, including `#E(F_5)`, the split product, the gcds and the residues mod 47 and 23.

## Checks run

- **Lean elaboration.** `lake env lean packages/NonordinaryCMSpecialValues/Suggested.lean`, run from the content checkout: exit 0. The only output was `declaration uses 'sorry'` at lines 130:8, 140:8 and 166:8 (`rohrlichCount_eq_zero`, `rohrlichCount_lt`, `centralValue_parity_dichotomy`). Both imported Tau Ceti modules were already built.
- **Signatures.** `Suggested.lean` was not changed, so I did not re-run the `#check @name` comparison. The provided `signatures.md` reports 0 of 12 declarations losing a section binder. No README target whose Lean counterpart exists changed.
- **Dependency check.** Output:

  ```text
  depcheck: 223 roadmaps, 1981 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line.

## Gate failures

None were listed for this round.

## Notes for the maintainer

- No Lean name, section number, target or citation changed, so no other roadmap's citation of this package is affected.
- No new sources were needed. The changed Checks are computations against this roadmap's own §§0.1, 0.4 and the Conventions, so `sources.toml` and `needs-references.toml` are unchanged.
- No ownership question arises: the edits add no construction, only Check scoping and negative controls.
- The review's "For the human reviewers" item (the settled statuses of KATO99 and BOXALL92) lists no finding. Nothing was changed for it.
