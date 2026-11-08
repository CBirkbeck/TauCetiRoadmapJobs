# FIX-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~4

One review (`REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~3`) with one P2 finding, on
§6.2. The finding is correct and was applied as suggested. Files changed:

- `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md`: the §6.2 statement,
  its proof sketch and its Checks, plus one clause in §7.5.
- `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/plan.json`: target 6.2's
  statement, hypotheses, locator and tests.

`sources.toml` is unchanged.

## F01 (P2) — applied

**Verification.** CN23 Lemma 6.1.4 (line 4562) is stated for `r_{E,5}`, which takes values in
`GL₂(𝔽₅)`. Its order-two case (lines 4569–4571) uses `𝔽₅`-coefficients: if `det g = −1` then
`det(2g) = 1`. The reviewer's instance over `𝔽₂₅` refutes the README's step "(4) fails ⇒ `ζ₅ ∈ F`"
for general coefficients. I recomputed it with a scratch script.

The protected source route itself assumes `ζ₅ ∈ F`: CaptainSude26 line 267 says "Let F be CM with
μ₅ ⊂ F". So adding `ζ₅ ∈ F` to the protected alternative does not narrow the statement below what
the sources support.

I also looked at a more general repair: base change to `F(ζ₅)` and then descend. It would need
decomposed genericity of `ρ̄|G_{F(ζ₅)}`. Theorem 6.2 does not assume this, and it does not follow
from decomposed genericity over `F`, because `F(ζ₅)` lies inside the field cut out by `ρ̄`. That
repair would therefore add a hypothesis that no source states. I did not adopt it.

**Old → new.** §6.2: "or that there is a nonempty finite set `P` …" → "or that `ζ₅ ∈ F` and there is
…". The false sentence "for `ζ₅ ∉ F` … gives (4)" is deleted. The sketch now argues directly from
`ζ₅ ∈ F`: the preimage of `PSL₂(𝔽₅)` in `SL₂(k̄)` is `SL₂(𝔽₅)`, so the image is `SL₂(𝔽₅)`. The first
Check is now the `𝔽₅` versus `𝔽₂₅` contrast. I added an order-four Check that holds for every
coefficient field.

**The same pattern elsewhere.**

- §7.5 applies Theorem 6.2 over `L ⊇ K ∋ ζ₅`. It now says explicitly that `L` contains `ζ₅` and that
  the protected alternative is the one used. The mathematics is unchanged.
- §8.1 uses Theorem 6.2 only through §7.5.
- The Downstream paragraph already restricts to "a field containing `ζ₅`".
- Theorem 2.1 (`cm_modularity` with `ζ₅ ∉ K`) uses Lemma 6.1.4 only for the `GL₂(𝔽₅)`-valued `A_t[5]`,
  which is the lemma's own setting.
- No other passage in the README or `plan.json` uses the argument "the determinant alone gives (4)".

`plan.json` 6.2:

- `statement`, `hypotheses` and `locator.where` were updated to match the README.
- Test `lifting_det_order_two` was rewritten to the `𝔽₅`/`𝔽₂₅` contrast.
- Test `lifting_det_order_four` was added.
- Test `lifting_imag_quadratic` now says that the protected alternative is unavailable for imaginary
  quadratic `F`.
- The test count went from 90 to 91.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 6.2 protected alternative with `ζ₅ ∈ F` | `ζ₅ ∈ F`, (4) fails | `ε̄₅⁻¹` trivial on `G_F`, so `G_F = G_{F(ζ₅)}`; projective image `PSL₂(𝔽₅)`. Preimage in `SL₂(k̄)`: `λg` with `λ² = 1`, so `λ = ±1`. A subgroup of order `≥ 60` contains the unique involution `−1`, so the image is `SL₂(𝔽₅)` (order 120) | sketch valid | hypothesis added |
| 6.2, (4) with `ζ₅ ∉ F`, det of order 2, `𝔽₅` coefficients | `⟨SL₂(𝔽₅), diag(1,−1)⟩` | order `240`, projective image `60` (`det(2g) = 4·(−1) = 1`); kernel indices `60 ≠ 120` | (4) holds | first Check |
| 6.2, (4) with `ζ₅ ∉ F`, det of order 2, `𝔽₂₅` coefficients | `μ² = 2`, `h = diag(1,2)` | `det(μh) = 4 = −1`; `tr(μh) = 3μ`; `(μh)² = diag(2,3)`; `|Γ̃| = 240`; determinants `{1, 4}`; projective image `120` (`proj SL₂(𝔽₅)`: `60`); kernel indices `120 = 120`; some trace not in `𝔽₅` | (4) fails with `ζ₅ ∉ F`; the old claim is false | first Check |
| 6.2, (4) with `ζ₅ ∉ F`, det of order 4 | normalizer of `PSL₂(𝔽₅)` | normalizer in `PGL₂(𝔽₂₅)` has order `120`, found by exhaustive search; in `PGL₂(k̄)` the centralizer is trivial (perfect and absolutely irreducible), so `N ↪ S₅`; `[G_F:G] ≤ 120 < 240 = [G_F:H]` | (4) holds for every `k` | new second Check |
| 6.2 imaginary quadratic `F` | `F = ℚ(i)`, `ℚ(√−3)` | `[ℚ(ζ₅):ℚ] = 4 > 2`, so `ζ₅ ∉ F` and the protected alternative is unavailable; the parent's §5.2 hypotheses include (4) (parent README §5.2, "If ℓ=5 and the projective residual image …") | theorem = `potentiallySemistableCM` | Check reworded |
| 7.5 application | `K ∋ ζ₅`, `L ⊇ K` solvable CM | `ζ₅ ∈ L`; `det A_t[5] = ε̄₅` trivial on `G_L`; image `SL₂(𝔽₅)` kept by linear disjointness and perfectness | protected alternative applies | clause made explicit |

All values above were computed by a scratch script, which works in `𝔽₂₅ = 𝔽₅[μ]/(μ² − 2)` by
breadth-first generation of the groups and exhaustive search over `GL₂(𝔽₂₅)` for the normalizer.

## Checks run

- **Dependency check** (command as in the brief):

  ```
  candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
  depcheck: 245 roadmaps, 2414 edges, 0 problem(s)
  ```

  No UPWARD or CYCLE line.
- **Citation resolver** (`roadmaps resolve` on the README) gives the same three leads as before:
  `LeHung26, §4.4` (line 340), `OpenAI26, §9.4` (line 449) and `CaptainSude26, §4` (line 800). Each
  is a manifest source id followed by a section sign, i.e. a source locator, not a roadmap citation.
  No Lean names were found missing.
- **Lean.** The design package has no `Suggested.lean`; the README's Lean paragraph is unchanged, and
  Theorem 6.2 is still not statable at the pins. No `#check` comparison applies.
- **Sources.** No new source. The locators used are CaptainSude26 line 267 and CN23 lines 3849–3872
  and 4562–4572, all in texts the manifest already records. No `needs-references.toml` was written.

## Notes for the maintainer

- No Lean name, section or target id changed, so other roadmaps' citations are not affected.
  Theorem 6.2's protected alternative now carries `ζ₅ ∈ F`. Its only consumers are this roadmap's
  §7.5, and through it §8.1, which already work over fields containing `ζ₅`.
- Ownership: the repair adds no new object, so no ownership check was needed. The overlaps file
  lists no open pull request that changes this roadmap and no dropped id.
- Whether a Galois representation with image `⟨SL₂(𝔽₅), μh⟩` and `det = ε̄₅⁻¹` exists over some CM
  field is not settled here. The repair does not depend on it: the deleted step was a general
  implication, and it fails for that image.
