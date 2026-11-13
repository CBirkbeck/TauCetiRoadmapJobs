# FIX-PKG-LefschetzPencilsAndVanishingCyclesPartII~3

Repair round for the review REV-PKG-LefschetzPencilsAndVanishingCyclesPartII~2 (four findings:
R01 and R03 at P1, R02 and R04 at P2). Each was checked against the pinned Mathlib and Tau Ceti,
the cached sources and a scratch Lean probe. All four are correct and all four are applied.
Edited: `packages/LefschetzPencilsAndVanishingCyclesPartII/README.md`, and docstrings only in
`packages/LefschetzPencilsAndVanishingCyclesPartII/Suggested.lean`. No Lean statement changed.
`metadata.toml`, `sources.toml` and `design/plan.json` (where `gaps` is still `[]`) are unchanged.

## REV-PKG-LefschetzPencilsAndVanishingCyclesPartII~2/R01 (P1) — applied

Old → new: §1.1 "not injective for `m ≥ 2`" and "origin fails for `B = 0`" now assume `k`
nontrivial, giving the nonzero coefficient. "Closed immersion only for `m > 0`" becomes "for
`m > 0`; for `m = 0` not over a nontrivial ring". Both negative-control Checks are now over `ℤ`.
New zero-ring Check (`ℤ/1ℤ`).

Verified with a scratch Lean probe at the pins. Over `ZMod 1`: `X_1 − X_0² = 0`, the map at
`(m, B) = (2, 2)` is injective, at `(0, 2)` it is surjective, the two origin maps agree at
`(2, 0)`, and `IsClosedImmersion` holds at `m = 0`. Over `ℤ`, for every `B`:
`φ(X_1 − X_0^B) = 0`, `X_1 − X_0^B ≠ 0`, the origin values are `0` versus `1` at `B = 0`, and
`polynomialGraph ℤ 0 2` is not surjective.

Pattern: I checked every Layer 1 claim that fails over the zero ring. These were already
correct: surjectivity for `m > 0`; "for `B = 0`, `m ≥ 1` the bounds force `h = 0`"; the
`m = 0` Checks, which are stated "over a field"; and the §1.2 zero-ring Check.
`exists_avoiding_graph` is vacuous over the zero ring, since there `h ≠ 0` is impossible.

## REV-PKG-LefschetzPencilsAndVanishingCyclesPartII~2/R02 (P2) — applied

Old → new: "no library states a coefficient theorem" is replaced. Scope, the Tau Ceti contract
and Layer 1 Dependencies cite `MvPolynomial.coeff_aeval_X_pow_weight` and
`MvPolynomial.injOn_aeval_X_pow`; Scope adds `Finsupp.exists_injOn_weight`. §1.2 applies the
imported theorem to the box `S_B`; the package's own step is injectivity of `w_B` there. New §1.1
bullet: `polynomialGraph` is `aeval`.

Verified at the pin: `TauCeti/RingTheory/MvPolynomial/Kronecker.lean` has `coeff_aeval_X_pow_weight`
at line 96, `injOn_aeval_X_pow` at line 109 and `Finsupp.exists_injOn_weight` at line 75, over a
commutative semiring. In the scratch probe:
- `polynomialGraph k m B h = MvPolynomial.aeval (fun i ↦ X ^ B ^ i) h` closes by `rw [aeval_def]; rfl`.
- `polynomialGraph_coeff` closes by `exact coeff_aeval_X_pow_weight hinj …` once injectivity is given.
- A 20-line proof of `Set.InjOn (weight fun i ↦ B ^ i) {d | ∀ i, d i < B}` elaborates for all `m`
  and `B`. It uses digits (`Nat.ofDigits_inj_of_len_eq`, `List.ofFn_injective`) for `B ≥ 2` and
  `interval_cases` for `B < 2`.

So the theorem is not one-tactic padding, and it stays in `Suggested.lean`. Its docstring and the
docstring of `polynomialGraph` now name the imported theorem.

Ownership by object: `roadmaps grep` for "Kronecker substitution" and for
`coeff_aeval_X_pow_weight`, on main and at all open heads, and the board packages. The only
other owner is main's ArithmeticInterpolationDeterminants §0.3 `powerSubstitution`, a
two-variable map with weight `(1, B)`. Scope now cites it as the `m = 2` case and states the
difference: it bounds only the `Z`-degree, while this package bounds every exponent of `m`
variables. Other hits (DiophantineApproximationAndTranscendence, HeightsRationalPointsAndObstructions,
SubspaceTheorem) consume Tau Ceti. None owns an `m`-variable base-`B` map.

## REV-PKG-LefschetzPencilsAndVanishingCyclesPartII~2/R03 (P1) — applied

Old → new: §1.3 "no graph avoids every proper closed subset" now needs `m ≥ 2` over a field
(image inside `V(X_1 − X_0^B)`); `m = 1` is the identity. "How to read the build" separates
`φ(h) ≠ 0` (ring) from the dense open (field). New Checks: `m = 2`, `m = 1`, `ℤ/4ℤ` with `h = 2`.

Verified. For `m = 2`, `B = 3`: the image is `V(X_1 − X_0³)`, and the preimage of its complement
is `D(T³ − T³) = ∅`. For `m = 1`: the preimage of `D(T² + T + 1)` over `𝔽_2` is itself. Over
`ℤ/4ℤ`: `φ(2) = 2 ≠ 0` and `2² = 0`; the probe proves both. The Summary now says "over the
field `k`" before the geometric clause; it was already in a field context. The
`exists_avoiding_graph` docstring already said "Over a field", so it is unchanged.

## REV-PKG-LefschetzPencilsAndVanishingCyclesPartII~2/R04 (P2) — applied

Old → new: "Not in this roadmap" now says Corollary 3.4 does make the curve meet a dense open
`U`, by adding a closed point of `U` to the finite set. The real obstacles: a chart is not
projective, and Theorem 3.3 does not assert `H ∩ X` is connected for non-projective `X`.
Downstream consumers corrected likewise.

Verified. Poonen2004 line 536–539 (Corollary 3.4, p. 10): any finite set `F` of closed points of a
smooth projective geometrically integral `X`, and a smooth projective geometrically integral `Y ⊇ F`
of each dimension. Poonen2004 line 514–517 (Theorem 3.3): `X` smooth quasi-projective, and `H ∩ X`
smooth of dimension `m − 1` containing `F`. Line 519–521 (Remark 1) asserts connectedness only for
projective, geometrically connected `X` with `m ≥ 2`.

Witness for the remaining obstacle: the quadric `Q = {xy = zw} ⊂ ℙ³`, the point `p = [0:0:0:1]`,
`X = Q ∖ {p}`, and the tangent plane `H = {z = 0}`. Then `H ∩ X` is two disjoint affine lines:
smooth, of dimension 1, and disconnected. The usage at KisinZhou2024 line 2345–2346 (Cor. 5.2.7)
and line 2413–2414 (Prop. 5.3.5) was re-read; the chart `Y` there is a smooth scheme with no
projectivity claimed.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 non-injectivity, `m ≥ 2`, `k` nontrivial | `ℤ`, `B = 0`; `ℤ`, `B = 3`; `ℤ/1ℤ`, `B = 2` | `X_1 − 1 ↦ 1 − 1 = 0`, coeff at `X_1` is `1`; `X_1 − X_0³ ↦ T³ − T³ = 0`; over `ℤ/1ℤ` the polynomial is `0` | hypothesis needed and sufficient | nontriviality added |
| §1.1 origin failure at `B = 0` | `ℤ`, `𝔽_2`, `ℤ/1ℤ`, `m = 2` | `X_1`: origin value `0`; image `1`, value at `T = 0` is `1`; over `ℤ/1ℤ`, `0 = 1` | fails exactly over the zero ring | nontriviality added |
| §1.1 closed immersion at `m = 0` | `ℤ`; a field; `ℤ/1ℤ` | coeff of `T` in `C a` is `0 ≠ 1`, so not surjective; over `ℤ/1ℤ` surjective, `∅ → ∅` | "only for `m > 0`" false over the zero ring | restated |
| §1.1 `aeval` agreement | general `k, m, B`; `m = 0`; `m = 1, B = 0` | Lean `rw [aeval_def]; rfl`; both are `C` at `m = 0`; both send `X_0 ↦ T` at `m = 1` | true | new API bullet |
| §1.2 route via Tau Ceti | `h = X_0²X_1 − X_0X_1²`, `B = 3`, `ℤ` | weights `5, 7, 6` → coefficients `1, −1, 0`, equal to source | true | route rewritten |
| box injectivity of `w_B` | `m = 2, B = 3`; `B = 1`; `B = 0, m = 2`; `B = 0, m = 0` | `d_0 + 3d_1` is a bijection `{0,1,2}² → {0,…,8}`; box `{0}`; box `∅`; box = {empty vector}; Lean proof for all `m, B` | true | stated with cases |
| §1.2 query-bound Check | `h = X_1`, `B = 2`, `e = (2,0)` | `w_2(e) = 2`; coeff of `T²` in `T²` is `1`; coeff of `X_0²` in `X_1` is `0` | negative control valid | Check added |
| §1.2 injectivity on the box | `B = 2`, `m = 2`: `X_0X_1` vs `X_0 + X_1`; `X_1` vs `X_0²` | `T³ ≠ T + T²`; `X_1, X_0² ↦ T²`, but `X_0²` is outside the box | consistent | sentence added |
| §1.3 no single graph, `m = 2` | field, `B = 3` | image `V(X_1 − X_0³)`; preimage of complement `D(0) = ∅` | true | Check added |
| §1.3 `m = 1` | `𝔽_2`, `Z = V(T² + T + 1)` | preimage of `D(T² + T + 1)` is `D(T² + T + 1) ≠ ∅` | true | Check added |
| §1.3 ring vs field | `ℤ/4ℤ`, `h = 2`; `ℤ/6ℤ`, `h = 2` | `φ(h) = 2 ≠ 0`, `2² = 0`, `D = ∅`; over `ℤ/6ℤ`, `D(2) = 𝔸¹_{𝔽_3}`, nonempty, not dense in `𝔸¹_{𝔽_2} ⊔ 𝔸¹_{𝔽_3}` | the field (domain) is what the passage uses | Check and prose added |
| Summary, over `k` | `𝔽_2`, `h = X_0²X_1 − X_0X_1²`, `B = 3` | `D(T⁵ + T⁷) = 𝔸¹ ∖ {0,1}`, nonempty | true | "over the field `k`" |
| Poonen Cor. 3.4 meets `U` | `ℙ²_{𝔽_2}`, `F = {[0:0:1], [1:0:1]}`, `U = D(X_0)` | `X_0` takes values `0` and `1` at the two points; the curve contains `[1:0:1] ∈ U` | meets `U`, dense since integral | Scope/consumers rewritten |
| Poonen Thm. 3.3 connectedness | `Q = {xy = zw}`, `X = Q ∖ {[0:0:0:1]}`, `H = {z = 0}` | `H ∩ Q = {z = x = 0} ∪ {z = y = 0}`, meeting only at the removed point | `H ∩ X` smooth, dimension 1, disconnected | wording "does not assert" kept |
| ArithmeticInterpolationDeterminants §0.3 comparison | `m = 2`, `B = 3`, `F = Z² W` | `powerSubstitution 3 F = X^(2+3) = X⁵`; `polynomialGraph k 2 3 F = T⁵` | same map at `m = 2` | Scope bullet |

## Checks

- `lake env lean packages/LefschetzPencilsAndVanishingCyclesPartII/Suggested.lean`, run from the
  content checkout, exits 0. There are four warnings `declaration uses 'sorry'` (lines 55, 66, 81,
  105) and no errors. The line numbers moved only because docstrings grew.
- `#check @name` for all five declarations, in one scratch copy of the file: each elaborated type
  is token for token the worker's signature listing. No binder was lost or changed, and the file
  has no section `variable`s. Every README statement of the five names matches its binders.
- Dependency check:

  ```text
  depcheck: 236 roadmaps, 2134 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the README: "Cross-roadmap citations found nowhere: None. Lean names
  found nowhere: None." The resolver does not check external Lean names, so I checked the new
  ones at the pins myself:
  - `MvPolynomial.aeval_def` (`Mathlib/Algebra/MvPolynomial/Eval.lean` line 575)
  - `Nat.injOn_ofDigits` (`Mathlib/Data/Nat/Digits/Lemmas.lean` line 360)
  - the three Tau Ceti names (`TauCeti/RingTheory/MvPolynomial/Kronecker.lean` lines 75, 96, 109)
- Gate failures listed in the brief: none.

## For the maintainer

- No Lean name or statement changed, and no id other roadmaps could cite changed.
- New cross-roadmap citation: ArithmeticInterpolationDeterminants §0.3 `powerSubstitution`, a
  roadmap on main, cited as a comparison and not as a supplier. `roadmaps overlaps` finds no open
  pull request changing that roadmap.
- The review's "Source issues" entry refines the Kisin–Zhou erratum. The gap is the missing
  non-projective reduction and the control of the component through the mark; it is not that
  Corollary 3.4 fails to meet an open in its projective setting. The erratum register is outside
  this package, so it was not edited.
- Ownership against open pull requests was checked by object using `roadmaps grep`, over all
  439 indexed open heads and main.
- Main's SubspaceTheorem README calls `exists_injOn_weight` `MvPolynomial.exists_injOn_weight`.
  At the pin it is `Finsupp.exists_injOn_weight`. That is outside this package and is noted only.
