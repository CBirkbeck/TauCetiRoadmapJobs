# FIX-PKG-ModularityAndLanglandsExtensionsPartII~9

This round answers the two findings of `REV-PKG-ModularityAndLanglandsExtensionsPartII~8`, both P3. Each
was checked against the sources (`th24`, `nt21`, `nt26`) and against the supplier
ArithmeticGaloisRepresentations §4.4 at its open head. Only
`packages/ModularityAndLanglandsExtensionsPartII/README.md` was edited. `Suggested.lean`,
`sources.toml`, `metadata.toml` and `design/plan.json` are unchanged.

## F01 (P3) — applied

**Changed.** In the last Check of §13.8, the claim "lies between `SL_2(𝔽_{p^b})` and `k^× SL_2(𝔽_{p^b})`"
now reads: after conjugation, the projective image is `PSL_2(𝔽_{p^b})` or `PGL_2(𝔽_{p^b})`, and the group
lies between `SL_2(𝔽_{p^b})` and `k^× GL_2(𝔽_{p^b})`, where `k ⊇ 𝔽_{p^b}` is a finite field. The quotient
argument uses the abelian group `k^× GL_2/SL_2`. The Check also gives the `PGL_2` witness and notes the
slip in th24's proof.

**Evidence.**
- **The sandwich fails for the witness.** Take `a` odd, so `7^a ≡ 3 mod 4`, and
  `H = {g ∈ GL_2(𝔽_{7^a}) : det g = ±1}`.
  - `|H| = 2q(q² − 1)` with `q = 7^a`. The only scalars in `H` are `±1`, so the projective image has
    order `q(q² − 1)`: it is `PGL_2(𝔽_q)`.
  - If `SL_2(𝔽_{7^b})` lies in `H`, comparing 7-parts gives `b ≤ a`. The projective image of
    `k^× SL_2(𝔽_{7^b})` is `PSL_2(𝔽_{7^b})`, of order `7^b(7^{2b} − 1)/2 < q(q² − 1)`.
  - So the old sandwich is impossible. The new one holds with `b = a` and `k = 𝔽_q`.
- **The witness occurs as `r̄(G_{F(ζ_7)})`.** Take `det r̄ = ε̄^{−1}χ̄`, with `χ̄` quadratic and
  non-trivial on `G_{F(ζ_7)}`. Then `r̄(G_F) = H`. The subgroup `r̄(G_{F(ζ_7)})` contains a conjugate of
  `SL_2(𝔽_q)`, which is a subgroup of `H` with determinant 1, hence `SL_2(𝔽_q)` itself. Its determinant
  is onto `{±1}`, so `r̄(G_{F(ζ_7)})` is all of `H`.
- **The supplier already states the correct form.** ArithmeticGaloisRepresentations §4.4, at its head,
  states `[G, G] = SL₂(F_0)` and `G ⊂ k̄^× · GL₂(F_0)` (its citation: ACC+, Lemma 7.1.6). The slip is
  in th24's proof only (`th24` lines 1896–1900).
- **The conclusion of the Check is unchanged.** `H/SL_2(𝔽_q) ≅ {±1}`, which has order 2, prime to 7.

**Pattern.** `k^× SL_2` occurred only here. The other "sandwich" passages (§9.1, the
ModularityAndLanglandsExtensions §1.7 contract) are projective, `PSL_2 ⊂ Proj ⊂ PGL_2`, and correct.

## F02 (P3) — applied

**Changed.**
- §8.1: "(nt21 Lemma 8.4 and proof, p. 95)" → "pp. 95–96".
- §4.1: "(nt21, Notation, pp. 8–9; §1, standard assumptions and the pure inner twist, pp. 9–10)" →
  "(nt21, Notation, pp. 7–8; §1, standard assumptions and the pure inner twist, pp. 8–10)".

**Evidence.**
- **§8.1.** Lemma 8.4 starts at `nt21` line 4640 (p. 95). Its proof runs past the page marker at
  line 4662 and ends at line 4665 (p. 96).
- **§4.1, Notation.** `Φ_n` (line 327) and `θ_n` (lines 337–341) are on p. 7. `U_n`, its pinning, the
  `L`-group and the Levi subgroups are on p. 8 (lines 341–371). The Notation section itself begins on
  p. 6 (line 246), but nothing on p. 6 is used here.
- **§4.1, §1.** §1 and the standard assumptions start on p. 8 (lines 372–385). The data `G_n`, `ξ`,
  `(ξ, u)` and `μ`, and the maps `ι_v`, `ι_w`, are on p. 9 (lines 388–421). Compatibility with base
  change is on p. 10 (lines 435–439).
- The earlier locator in §4.1, "the data fixed under the standard assumptions, p. 9", is correct and
  unchanged.

**Pattern.** I rechecked every other "… and proof, p. N" locator in the README, and all are correct:

| Locator | Lines | Page markers |
|---|---|---|
| nt21 Lemma 3.3 | 2656–2660 | p. 54 starts at 2631, p. 55 at 2678 |
| nt21 Lemma 3.6 | 2736–2744 | p. 56 starts at 2728, p. 57 at 2775 |
| nt26 Proposition 3.14 | 1123–1141 | p. 24 starts at 1091, p. 25 at 1142 |

`nt21 Notation` is cited only in §4.1.

## Checks run

- **Elaboration.** `lake env lean packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean`, run
  from the content checkout, exits with 0. Its only output is two "declaration uses `sorry`" warnings,
  at lines 98 and 117. No `TauCeti.*` module needed building.
- **Signatures.** I put `#check @name` for all four declarations into one scratch file and elaborated
  it once. The types match the worker's signature list and the README: `symPowerEulerFactor`,
  `HasQuadraticSelfTwist` with `[NeZero N]`, the level-one theorem with `1 ≤ n` and the Satake
  hypothesis, and the level-`N` theorem with `2 ≤ k`, `¬HasQuadraticSelfTwist f`, `1 ≤ n` and the
  Satake hypothesis at `p ∤ N`. Nothing was lost and nothing changed; the file is unedited.
- **Dependency check** (`gate --depcheck … --movable`): output

      depcheck: 240 roadmaps, 2283 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **Ownership.** No new target, construction or citation was added. The one supplier relied on more
  heavily, ArithmeticGaloisRepresentations §4.4, is already in the contracts and earlier in the merge
  order. No cross-roadmap id changed.

## Adversarial pass (changed statements)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §13.8 Check: sandwich `SL_2(𝔽_{p^b}) ≤ H ≤ k^× GL_2(𝔽_{p^b})` | `PGL_2` case: `p = 7`, `a = 3`, `H = {det = ±1}` | Projective image order `343·(343² − 1) = 40353264`, against `|PSL_2(𝔽_{343})| = 20176632`. `H ⊂ GL_2(𝔽_{343}) = 𝔽_{343}^× GL_2(𝔽_{343})` | New form holds; `k^× SL_2` fails | Sandwich restated |
| Same | `PSL_2` case: `H = SL_2(𝔽_q)` (`det r̄ = ε̄^{−1}`) | `H ⊂ k^× SL_2 ⊂ k^× GL_2`; `H/SL_2 = 1` | Both forms hold | None |
| Same | Scalars from a larger `k`: `H = μ_{q²−1}·SL_2(𝔽_q)`, `k = 𝔽_{q²}` | Projective image `PSL_2(𝔽_q)`; `H/SL_2 ≅ μ_{q²−1}/{±1}`, of order `(q² − 1)/2`, prime to `p` | Holds | `k` is now named as a finite field containing `𝔽_{p^b}` |
| No quotient of `p`-power order | `GL_2(𝔽_{125})`, `p = 5`; witness above, `p = 7` | `GL_2/SL_2 ≅ 𝔽_{125}^×`, order `124 = 4·31`, `5 ∤ 124`; `{±1}`, order 2, `7 ∤ 2` | Trivial | Group replaced by `k^× GL_2/SL_2` |
| `k^× GL_2(𝔽_{p^b})/SL_2(𝔽_{p^b})` is abelian, of order dividing `(|k| − 1)(p^b − 1)` | Commutator of `λg` and `μh` | `[λg, μh] = [g, h] ∈ SL_2(𝔽_{p^b})`. Surjection from `k^× × 𝔽_{p^b}^×`; for `k = 𝔽_{125} = 𝔽_{p^b}` the bound is `124·124`, and `124` divides it | Holds | New text |
| Perfectness of `SL_2(𝔽_{p^b})` | `p^b = 3` (excluded by `p ≥ 5`); `p^b ≥ 5` | `SL_2(𝔽_3)` has a quotient of order 3; `SL_2(𝔽_q)` is perfect for `q ≥ 4` | `p ≥ 5` needed and in scope | None |
| `r̄(G_{F(ζ_7)}) = {det = ±1}` when `det r̄ = ε̄^{−1}χ̄` | `χ̄ = 1`; `χ̄` non-trivial on `G_{F(ζ_7)}` | `χ̄ = 1`: image `SL_2(𝔽_q)`, the `PSL_2` case. Otherwise: determinant onto `{±1}`, so the image is `H`, the `PGL_2` case | Both cases occur | The `PGL_2` instance is in the Check |
| §8.1 locator | `nt21` lines 4640–4665 | Page marker for p. 96 at line 4662 | pp. 95–96 | Fixed |
| §4.1 locator | `nt21` lines 246, 327–439 | Notation content on pp. 7–8; §1 on pp. 8–10 | — | Fixed |

## For the maintainer

- No name that another roadmap cites changed, and no Lean name changed.
- th24 Lemma 7.3's proof prints the sandwich with `k^× SL_2(𝔽_{p^b})`. Any roadmap that copies that line
  into a Check inherits the slip. ArithmeticGaloisRepresentations §4.4 already has the correct
  `k̄^× · GL₂(F_0)` form.
