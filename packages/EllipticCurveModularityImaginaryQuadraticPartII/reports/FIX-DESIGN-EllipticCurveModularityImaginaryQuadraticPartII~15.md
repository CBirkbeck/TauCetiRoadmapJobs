# FIX-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~15

The review has one finding, F01. Its `## For the human reviewers` section lists no finding, so nothing
was changed because of it.

## F01 (P3) — applied

Old (Conventions): "`F = K(μ_n)` is meant in the Summary, Layers 2 and 8, §7.5 and Layer 1 outside
§1.2; … Layer 3 uses only local fields". New: the list also names Scope and ownership and How to read
the build. It adds that in the supplier contracts `F` is the cited field, that in Downstream consumers
it is the field of ModularityAndLanglandsExtensions §2.29, and that `F` is never a finite field. §3.1
and the AGR §7.7 contract now write the finite field as `k`.

Verification. I checked every bare `F` in the README against the record. The four lines the review
names are correct: line 27 (`cyclotomic_switch_field` of `ζ₅ ∉ F`), line 39 (descent along `F/K`) and
How to read the build ("seed for `V_η` over `F`") all mean `K(μ_n)`. Downstream consumers ("drop the
hypothesis `ζ₅ ∉ F`") uses the `F` of ModularityAndLanglandsExtensions §2.29. That section begins "For
imaginary CM F" and its `cm_modularity` paragraph has `ζ₅∉F`, read with `roadmaps show`.

The same pattern turned up in places the review did not name:

- **Layer 3, §3.1.** The text said "the groups `H¹(SL₂(F), ad⁰)` of its §7.7", with `F` a finite field
  (the letter of ArithmeticGaloisRepresentations §7.7, line 5132 of that README). This made the
  record's claim that "Layer 3 uses only local fields `F_v` …" false. The fix renames it to `k`, the
  field letter of §3.1, which three lines later already writes `H¹(SL₂(k), ad⁰) = 0`.
- **Supplier contracts, ArithmeticGaloisRepresentations §7.7.** `H⁰(SL₂(F), ad⁰) = H¹(SL₂(F), ad⁰) = 0`
  for `F` finite with `#F ≠ 5` is renamed to `k`. The `plan.json` supplier entry for
  ArithmeticGaloisRepresentations is renamed the same way.
- **Other supplier-contract uses of `F`.** These keep the cited statement's own field, which the new
  sentence records:
  - Tau Ceti `eulerCharacteristic_mixed`: a finite extension of `ℚ_ℓ`.
  - CrystallineLocalGlobalCompatibilityCM §8.7 `ζ_p ∈ F` and §9.10 `[F⁺:ℚ]`: an imaginary CM field
    (line 36 of that README: "`F` is an imaginary CM field").
  - Supplier obligations (ACC23 §3.1): a CM field containing an imaginary quadratic field.
- **Conventions bullet on `M(1)` and `H¹_ur`.** It is stated for a generic `G_F`. The record now says
  it applies to whichever `F` is in force.
- **The other letter records in the same paragraph (same construction).** I mapped every use of each
  letter to its section. Three records missed uses outside the layers, and one missed a use in another
  supplier contract:
  - The switch parameter `t`: `A_t` and `B_t` also occur in the Summary, Scope and ownership and the
    parent's §8.4 contract. These are now named.
  - The matrix `U`: it also occurs in the Frobenius witness of the Conventions. Now named.
  - `G_D`: it also occurs in the parent's §7.4 contract. Now named.
  - The tame-character tuple `χ`: it also occurs, as the index of `𝒮_χ`, in the
    CrystallineLocalGlobalCompatibilityCM contract. Now named.

  The records for `η, ψ, χ` (How to read the build, Layer 2, §8.1), `w`, `p`, `E`, `O`, the levels
  `K` and `λ` hold: no use lies outside what they state.

No statement, hypothesis, target name, locator or Check changed. Only notation records changed, plus
the renaming of a finite field from `F` to `k` in two places of the README and one of `plan.json`.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Record: `F = K(μ_n)` in Summary, Scope, How to read the build, Layers 1 (outside §1.2), 2, 8 and §7.5 | lines 10–11 (`F = K(μ₃ₚ)`, `n = 3p`); 27, 39; 344; 367, 422; Layer 2, lines 435–580; 1354–1355 (genericity descends from `F` by Theorem 1.2); 1408 (`F = K(μ₃ₚ)` CM by Theorem 1.1) | each `F` is `K(μ_n)`; `n = 3p` gives `μ₃ₚ = μ_n` | holds | list extended by two sections |
| Record: own `F` in §1.2, Layers 4–6, §7.4 | §1.2 "Let `K ⊆ F` be number fields"; §4.1 "number field with `μ₅ ⊂ F`", §4.2 "Keep the setting of §4.1", §4.3 "CM field with `μ₅ ⊂ F`"; §5.1 datum; §6.1, §6.2 "Let `F` be a CM field"; §7.4 "Let `F` be a CM field" | every use is bound by its section's own "Let" | holds | none |
| Record: Layer 3 has only `F_v`, `F'_w` | §3.1, now line 599: `H¹(SL₂(F), ad⁰)` with `F` finite, before the edit | `F` was a finite field, which falsified the record | failed, repaired | `F` → `k` (agrees with §3.1's `k` and its later `H¹(SL₂(k), ad⁰) = 0`) |
| AGR §7.7 restated with `k`: `H⁰ = H¹ = 0` for `SL₂(k)`, `k` finite odd, `#k ≠ 5` | `k = 𝔽₃`; `𝔽₅`; `𝔽₇`; `𝔽₂` | `𝔽₃`: `N = 1 + D + D² = (D − 1)²`, `(D−1)²f = −2e = e`, `ker N = ⟨e, h⟩ = im(D − 1)`, so `H¹(⟨U⟩) = 0` and, by injectivity of restriction to the Sylow subgroup, `H¹ = 0`. `𝔽₅`: torus `diag(a, a⁻¹)` acts on the class `ξ(U) = f` by `a⁻⁴`, which is `1` for all `a ∈ 𝔽₅ˣ`, so the class survives (one-dimensional). `𝔽₇`: `3⁴ = 81 ≡ 4 ≠ 1`, so the class dies and `H¹ = 0`. `𝔽₂`: excluded by "odd" (trace form degenerate, Gram determinant `−2 = 0`) | holds; only the letter changed | none beyond the letter |
| Supplier-contract `F`s | Tau Ceti Euler characteristic; CLGC §§8.7, 9.10; ACC23 §3.1 | finite extension of `ℚ_ℓ`; imaginary CM (CLGC README line 36); CM field containing an imaginary quadratic field (README line 324) | matches the new sentence | sentence added |
| Downstream `F` | ModularityAndLanglandsExtensions §2.29 | "For imaginary CM F … (`ζ₅∉F` if `p=3`)"; "`cm_modularity`: when `ζ₅∉F`" | matches | sentence added |
| "`F` never denotes a finite field" | every bare `F` after the edit (scan of code spans by section) | finite-field uses: none left; `(F-ss)` in §2.3 and §8.1 is Frobenius semisimplification, not a field | holds | none |
| Record of `t` | Summary lines 9, 10, 13, 17 (`B_t`, `A_t`); Scope line 58; parent's contract (§8.4 `B_t ⊗ χ_(h(t))`); §§4.3, 5.2, 5.4 (`t = |T|`) | the curve parameter appears outside Layers 2, 7, 8 only in those three places; `t = |T|` only in Layers 4–5 | was incomplete, repaired | three places named |
| Record of matrix `U` | Conventions Frobenius witness (`U¹¹ = U`, `U⁷ = [[1,2],[0,1]]`); Layers 3–6; `U(K)` in §§2.1, 2.2, 7.1, 7.2, 7.5 | the matrix is in the witness and Layers 3–6; the open is in Layers 2 and 7 | was incomplete, repaired | witness named |
| Record of `G_D` | §7.5 line 1352; parent's contract line 245 | the same group in both | was incomplete, repaired | contract named |
| Record of `χ = (χ_v)` | Layer 5; CLGC contract `𝒮_χ`, `𝒮_{χ,Q}` | same index | was incomplete, repaired | contract named |

## Checks

Dependency check, run on the final text:

```text
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2273 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The edge count went from 2272 in the review's run to 2273.
Every supplier this README names (ModularityAndLanglandsExtensions, CrystallineLocalGlobalCompatibilityCM,
ArithmeticGaloisRepresentations) was already cited, and all are earlier in the merge order.

Citation resolver on the final README: the same three leads as before (`LeHung26, §4.4`,
`OpenAI26, §9.4`, `CaptainSude26, §4`). These are source keys followed by a section, not roadmaps, so
they are not defects. The fourth lead the worker listed, `ResidualImage.adZeroRep`, no longer appears:
it is a declaration of ArithmeticGaloisRepresentations §7.9. "Lean names found nowhere: None."

`plan.json` parses as JSON after the edit.

`Suggested.lean`: this package is at the design stage and has no Lean file. No `#check` comparison was
possible or needed; no Lean name was added, changed or removed.

Gate failures listed in the brief: none.

## For the maintainer

- No target, Lean name, section number or heading changed, so citations from other roadmaps are
  unaffected. The edits are confined to the Conventions paragraph on notation, one clause of §3.1, the
  ArithmeticGaloisRepresentations §7.7 contract bullet and its `plan.json` entry.
- Ownership: no new object was introduced, so no ownership search was needed. `sources.toml` is
  unchanged and no source was fetched; `needs-references.toml` was not written.
- I found nothing suspicious in the review text.
