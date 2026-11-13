# Repair report: FIX-DESIGN-CohomologyOfGroups~3

Files changed: `packages/CohomologyOfGroups/design/README.md` and
`packages/CohomologyOfGroups/design/plan.json`. `packages/CohomologyOfGroups/sources.toml` is
unchanged: its HS53 locator already records "Ch. I §5 Lemmas 1–2 and Prop. 5 (pp. 115–116)". There
is one review (`REV-DESIGN-CohomologyOfGroups~2`) with two findings. Both were checked against the
definitions and HS53 before any edit. The design stage has no `Suggested.lean`, so no Lean
declaration was added, changed or elaborated, and no `#check @name` binder audit applies.

## F01 (P1) — applied

Changed: in 6.1, "but no `F_t` is zero when `C̄` is unbounded: the bound holds degree by degree,
not globally" → "bounded in each degree; a global lower bound is not guaranteed … some `F_t` is
zero exactly when `N = G` or `M = 0` (then `F_{−1} = A_1 = 0`)". The `N = 1` and `N = G` Checks
gain the `ℤ/2`, `𝔽₂` instances. In the plan, 6.1 `filtration_finite`, `filt_N_trivial` and
`filt_N_G` match.

Verification. The definition (HS53 line 380–385) puts `f ∈ C̄ⁿ` in `A_j`, for `0 < j ≤ n`, when `f`
vanishes whenever `n − j + 1` of its arguments lie in `N`, and puts `A_j ∩ C̄ⁿ = 0` for `j > n`.

- **`N = G = ℤ/2`, `M = 𝔽₂`.** A normalized cochain is determined by its value at `(g, …, g)`, so
  `C̄ⁿ = 𝔽₂` for every `n` and `C̄` is unbounded. For `n ≥ 1`, all `n ≥ n − 1 + 1` arguments lie in
  `N`, so `A_1 ∩ C̄ⁿ = 0`. Also `A_1 ∩ C̄⁰ = 0` because `1 > 0`. Hence `F_{−1} = A_1 = 0`, and the
  old clause was false.
- **The general dichotomy, which replaces the clause.** If `N = G`, the same argument gives
  `A_1 = 0`. If `M = 0`, everything is zero. If `N ≠ G` and `M ≠ 0`, take `g ∉ N` (so `g ≠ 1`),
  `m ≠ 0` and `j ≥ 1`. The degree-`j` cochain with value `m` at `(g, …, g)` and `0` elsewhere is
  normalized. In degree `n = j` the condition is "vanishes whenever one argument lies in `N`", and
  this cochain meets it because `(g, …, g)` has no argument in `N`. So it lies in `A_j` and is
  nonzero. For `j ≤ 0`, `A_j = C̄ ⊇ C̄⁰ = M ≠ 0`. So no `F_t` is zero.
- **The review's wording was applied verbatim, with this dichotomy added.** The dichotomy is
  sharper and is proved above.

Pattern search: "global", "unbounded", "no `F_t`" and `GradedOfFinite` in both files.

- The 6.2 convergence Check (`N = 1`, `G = ℤ/2`: no `F_t` is zero) is the case `N ≠ G`, `M ≠ 0`.
  It is consistent and was kept.
- The 6.2 stabilization argument uses only:
  - the degreewise vanishing of `A_{p+r−1}` in degree `p + q + 1`;
  - `F_t = C̄` for `t ≥ 0`.

  These match the hypotheses `h₀` and `h₃` of the pinned `CochainComplex.filtrationSpectralSequencePageXIsoEInfty` (`TauCeti/Algebra/Homology/SpectralSequence/Filtered/Stabilization.lean`, around line 83), with native `q = −p − 1`: `q − r + 2 = 1 − p − r` and `q + r − 1 = r − p − 2`. No change was needed there.
- The supplier-contract sentence "No global bound `F_a = ⊥` is assumed" is still true. It was kept.

## F02 (P3) — applied

Changed: 2.3 "(HS53 Ch. I §5, Lemmas 1–2 and Prop. 5, p. 116)" → "(HS53 Ch. I §5, Lemma 1,
p. 115; Lemma 2 and Prop. 5, p. 116)". The plan's 2.3 locator was changed to match.

Verification:

- Page 6 of the extraction begins at HS53 line 221 with printed page 115 (line 222), and Lemma 1
  is at HS53 line 246.
- Printed page 116 begins at HS53 line 266–267. Lemma 2 is at line 273 and Prop. 5 at line 283.

Pattern search. Every HS53 page locator in the README and in plan.json was compared with the page
markers:

- Ch. I §2 Prop. 1 (line 83, p. 111); Prop. 2 and its corollary (lines 142, 154, p. 113);
  Prop. 4 (line 214, p. 114).
- Prop. 5 alone (line 283, p. 116), as cited by 3.3; Prop. 7 (line 341, p. 117).
- Ch. II §1 definitions (lines 368–392, p. 118); Prop. 1 and Lemma 1 (lines 409, 419, p. 119);
  Thm. 1 (line 489, p. 121).
- Ch. II Thm. 2 and Prop. 3 (lines 654, 677, p. 125); Thm. 3 (line 694, p. 126).
- Ch. III §1 (line 701, p. 126); Prop. 1 (line 796, p. 128); Thm. 2 (line 825, p. 129); remark
  (lines 854–856, p. 130); Thm. 4 (line 984, p. 133).

All of them agree, and no other page slip was found.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| 6.1 degreewise bound `A_j ∩ C̄ⁿ = C̄ⁿ` (`j ≤ 0`), `A_{n+1} ∩ C̄ⁿ = 0` | `G = ℤ/2`, `N = 1` and `N = G`, `M = 𝔽₂`, `n = 0, 1, 2` | `A_0 ∩ C̄ⁿ = 𝔽₂`. `A_{n+1} ∩ C̄ⁿ = 0` by the `j > n` convention, for `n = 0, 1, 2`. | Holds; unchanged. |
| 6.1 global dichotomy: some `F_t = 0` iff `N = G` or `M = 0` | `N = G = ℤ/2`, `M = 𝔽₂`; `N = 1 ⊂ ℤ/2`, `M = 𝔽₂`; `N = 2ℤ/4 ⊂ ℤ/4`, `M = 𝔽₂`; `G = 1`; `M = 0` | `N = G`: `A_1 ∩ C̄ⁿ = 0` for all `n` while `C̄ⁿ = 𝔽₂`. `N = 1`: `A_j ∩ C̄ʲ = C̄ʲ = 𝔽₂ ≠ 0` for all `j ≥ 1`. `ℤ/4`: the generator `1 ∉ 2ℤ/4` gives `δ_{(1,…,1)} ∈ A_j ∩ C̄ʲ`, nonzero; for `j = 1` it vanishes at `0, 2, 3` and is nonzero at `1`. `G = 1`: here `N = G`, `C̄ = M` in degree 0, `A_1 = 0`. `M = 0`: everything is 0. | New statement holds in both directions; old clause refuted by the first instance. |
| 6.1 Check `N = 1`, `ℤ/2`, `𝔽₂` | `j = −2, 0, 1, 3` | `A_{−2} = A_0 = C̄`, nonzero in every degree. `A_1 ⊇ C̄¹ = 𝔽₂`. `A_3 ⊇ C̄³ = 𝔽₂` but `A_3 ∩ C̄² = 0`. So `n ≥ max(j, 0)` is the exact range. | Agrees with the API bullet. |
| 6.1 Check `N = G`, `ℤ/2`, `𝔽₂` | `n = 0, 1, 5` | `C̄⁰ = C̄¹ = C̄⁵ = 𝔽₂`. `A_1 ∩` each is `0`. The spectral sequence column: `E₁^{0,q} = H^q(ℤ/2, 𝔽₂) = 𝔽₂`. | Agrees with the bullet and with the 6.2 `N = G` Check. |
| 6.2 convergence (unchanged; reread against the new bullet) | Classical `(p, q) = (0, 0)` and `(1, 2)` | `(0, 0)`: page `max(3, 2) = 3`, and `A_2` is zero in degree 1. `(1, 2)`: page `max(5, 3) = 5`, `A_5` is zero in degree 4, and `C̄/A_{−2} = 0`. | Uses only the degreewise bound; consistent. |
| 2.3 locator | HS53 page markers | Lemma 1: line 246 (p. 115). Lemma 2: line 273 (p. 116). Prop. 5: line 283 (p. 116). | Locator corrected. |

## Checks run

Dependency check (command from the brief), output:

```text
candidate: CohomologyOfGroups is not in the merge order yet; checked as if placed after IntegralIwasawaTheoryPartII (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2179 edges, 0 problem(s)
```

The output has no UPWARD and no CYCLE line. The "not in the merge order yet" line is the expected
message at the design stage. `plan.json` parses as JSON after the edits.

There were no gate failures to repair in this round.

## For the maintainer

- No target, Lean name, section number or supplier citation changed. Other roadmaps cite nothing
  here that moved.
- No ownership question arises: the repairs correct a property of this roadmap's own filtration
  and a page locator. No construction moved and no new supplier was cited, so the ownership check
  against open pull requests was not re-run for these edits.
- No new source was needed. `needs-references.toml` was not created.
- No suspicious instructions were found in the review text.
