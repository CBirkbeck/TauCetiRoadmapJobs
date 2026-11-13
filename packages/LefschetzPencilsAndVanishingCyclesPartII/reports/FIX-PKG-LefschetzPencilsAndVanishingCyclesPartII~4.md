# FIX-PKG-LefschetzPencilsAndVanishingCyclesPartII~4

Repair round for the review REV-PKG-LefschetzPencilsAndVanishingCyclesPartII~3. That review has one
finding, F01 (P2). I checked it against the cached author version of Poonen2004. It is correct and
is applied.

Edited files:
- `packages/LefschetzPencilsAndVanishingCyclesPartII/README.md`: the Poonen synopsis in "Scope and
  ownership", one new Check in §2.4, and the Poonen sentence in "Downstream consumers".
- `packages/LefschetzPencilsAndVanishingCyclesPartII/sources.toml`: the `cited_for` list of
  `Poonen2004`.

Unchanged:
- `Suggested.lean`. It does not mention Poonen, and the review asks for the four signatures to stay
  as they are.
- `metadata.toml`.
- `design/plan.json`, whose `gaps` list is still `[]`.

## REV-PKG-LefschetzPencilsAndVanishingCyclesPartII~3/F01 (P2) — applied

Old → new:
- Scope: Corollary 3.4 is now stated for `X` with `dim X ≥ 1`. A new sentence says that for
  `dim X = 0` the variety is `Spec 𝔽_q`, contains no curve, and §2.4 uses a constant morphism from
  `𝔸¹` instead. Theorem 3.3 is now stated for `X ⊆ ℙⁿ` with `dim X ≥ 1`, and `H ∩ X` is smooth of
  dimension `dim X − 1`.
- Downstream consumers: "of dimension at least one" is added to both Poonen references.
- §2.4: a new negative-control Check for `Spec 𝔽_2`.

**Evidence.** Poonen2004 line 514 (Theorem 3.3, p. 10) assumes a smooth quasi-projective
`X ⊆ ℙⁿ` of dimension `m ≥ 1`, and its conclusion is that `H ∩ X` is smooth of dimension `m − 1`.
Lines 536–539 (Corollary 3.4) assume dimension `m ≥ 1` and `1 ≤ y ≤ m`, so there is no admissible
`y` when `m = 0`. The reviewer's witness is correct. `Spec 𝔽_2` is smooth, projective (it is `ℙ⁰`)
and geometrically integral. The ideals of `𝔽_2` are `0` and `(1)`, so its only nonempty closed
subscheme is itself, which has dimension `0`. It therefore contains no curve.

**Repair of the pattern.** I searched the package for every synopsis of a cited external result
(`grep -i "poonen|corollary 3|theorem 3.3|projective"` over the README, `Suggested.lean` and
`sources.toml`):
- Poonen appears in exactly two passages: "Not in this roadmap" (Scope and ownership) and
  "Downstream consumers". Both are repaired.
- The References entry gives locators only, and `Suggested.lean` has no Poonen text.
- I reread the other external results the README restates against their cached lines and found no
  other missing hypothesis:
  - Stacks-Varieties line 528 (04KV): connected with a rational point.
  - Stacks-Varieties line 2084 (056T): smooth over a field.
  - Stacks-Varieties line 2147 (0CDW): requires a variety. The README applies it to the affine,
    connected, hence integral, `C`.
  - Stacks-Properties line 433 (033N): locally Noetherian.
  - Stacks-Morphisms line 3743 (054L): affine target neighbourhood, `d ≥ 0`.
- I recorded the citation of Poonen in §2.4 and in "Downstream consumers" in the manifest:
  `cited_for` changes from `["Scope and ownership"]` to `["Scope and ownership", "2.4",
  "Downstream consumers"]`.

The reviewer also lists a source issue: Poonen's Theorem 3.3 claims a geometrically integral `H`
even when `n = 1`. The README does not repeat it, because the README's synopsis asserts nothing
about `H` beyond the smoothness and dimension of `H ∩ X`. For `n = m = 1`, `X = ℙ¹_{𝔽_2}` and
`F = {0, ∞}`, the hypersurface `H = V(XY)` gives `H ∩ X = {0, ∞}`. That is smooth of dimension
`0 = 1 − 1` and contains `F`, so the weaker synopsis is true.

### Adversarial pass on the changed statements

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Corollary 3.4 synopsis, `dim X ≥ 1` | `X = Spec 𝔽_2` | `dim X = 0`; closed subschemes `∅` and `X`; no subscheme of dimension `1` | Excluded by the new hypothesis; the old synopsis was false here | Hypothesis added |
| same | `X = ℙ¹_{𝔽_2}`, `F` = its three rational points, `U = D(X_0)` | `dim X = 1`; `Y = X` contains `F` (3 points) and meets `U` in a set of 2 rational points; `Y ∩ U` is dense in `Y` | Holds | none |
| same, dense-open clause | `ℙ²_{𝔽_2}`, mark `[0:0:1]`, `U = D(X_0)`, added point `[1:0:1]` | `X_0` takes the values `0` and `1` at the two points; any curve through both meets `U` | Holds | none |
| "for `dim X = 0`, `X = Spec 𝔽_q`" | `Spec 𝔽_4` over `𝔽_2`; `Spec 𝔽_2` | `𝔽_4 ⊗ 𝔽̄_2 ≅ 𝔽̄_2 × 𝔽̄_2`, not a domain, so not geometrically integral; `𝔽_2 ⊗ 𝔽̄_2 = 𝔽̄_2`, a domain | Only the degree-one field passes | none |
| Theorem 3.3 synopsis, `dim X ≥ 1`, `H ∩ X` of dimension `dim X − 1` | `X = [0:1] ⊆ ℙ¹`, `F = X` (`dim X = 0`) | Every `H ⊇ F` gives `H ∩ X = X`, of dimension `0 ≠ −1` | Hypothesis is necessary | Hypothesis added |
| same | `n = m = 1`, `X = ℙ¹_{𝔽_2}`, `F = {0, ∞}`, `H = V(XY)` | `H ∩ X = {0, ∞}`: reduced, 2 rational points, dimension `0 = 1 − 1` | Holds, and the synopsis does not claim `H` geometrically integral | none |
| same, connectedness caveat | `Q: xy = zw ⊆ ℙ³` minus `p = [0:0:0:1]`, cut by `z = 0` | `{z = x = 0} ∪ {z = y = 0}`, meeting only at `p`; after removing `p`, two disjoint affine lines | The caveat still holds; `dim X = 2 ≥ 1` | none |
| Downstream: "Corollary 3.4 requires … dimension at least one" | Kisin–Zhou smooth chart `Y` (KisinZhou2024 lines 2341–2347) | If `dim Y = 0`, no curve `C′ ⊆ Y` exists; `exists_same_field_curve` still gives `C = 𝔸¹` and a constant map | Consistent with §2.4 | Qualifier added |
| New §2.4 Check: `Y = Spec 𝔽_2` | `f = 𝟙`, `y = 𝟙`, `V = U = Y` | `C = 𝔸¹_{𝔽_2}`, `g = s_C`; `g ≫ f = s_C`; `c ≫ s_C = 𝟙`; `c ≫ g = c ≫ s_C = 𝟙 = y`; `g⁻¹(U) = C`, which is nonempty and dense | All conclusions of `exists_same_field_curve` hold. Agrees with §2.4 step 3 (`m = 0`), the Check "A point", and the scope sentence | Check added |
| Lean `exists_same_field_curve` on that instance | `Smooth (V.ι ≫ f)` with `V = ⊤` | `V.ι` is an isomorphism, and `Spec 𝔽_2 → Spec 𝔽_2` is smooth | The hypotheses are satisfiable; the statement is not vacuous here | none |

No other theorem, definition or Check changed, so no other Check needs recomputing. The new Check
uses `exists_same_field_curve`, whose statement did not change.

## Checks

**Elaboration.** I ran `lake env lean packages/LefschetzPencilsAndVanishingCyclesPartII/Suggested.lean`
from the content checkout. It exited `0` with exactly four warnings, `declaration uses sorry`, at
lines 55, 66, 81 and 105. There were no errors and no other warnings. The only import is
`import Mathlib`, so no `TauCeti.*` build was needed.

**`#check @name`.** I put all five declarations in one scratch file: `polynomialGraph`,
`polynomialGraph_coeff`, `exists_avoiding_graph`, `exists_marked_etale_curve` and
`exists_same_field_curve`. It elaborated with exit `0`. Each elaborated type agrees with its README
statement. No binder was lost: for example, `[Smooth (V.ι ≫ f)]` is still in
`exists_same_field_curve`, and `[IsIntegral V] [IsAffine V] [Etale π]` are still in
`exists_marked_etale_curve`. Nothing changed, since `Suggested.lean` was not edited.

**Dependency check.** Output of `gate --depcheck … --movable`:

```text
depcheck: 236 roadmaps, 2134 edges, 0 problem(s)
```

It reports no UPWARD, CYCLE or moved line.

**Citations.** `roadmaps resolve` on the README found no cross-roadmap citations and no Lean names
that are missing everywhere.

**Gate failures.** None were listed for this round.

## Notes for the maintainer

- No Lean name changed, and no cross-roadmap citation or section id changed. No roadmap that cites
  this one is affected.
- **Ownership.** This round adds no construction or target. The only additions are a hypothesis
  restored in a synopsis of a cited paper, and a Check. The ownership established in earlier rounds
  is unchanged. The overlap report lists no open pull request that changes or drops ids of this
  roadmap; the closest in vocabulary is SchemeAndStackFoundations, which is cited as on main.
  I did not re-run an object search against the open pull requests, because no new object was
  introduced.
- **Sources.** No new source was fetched. `needs-references.toml` was not created: every text this
  round needed (Poonen2004, KisinZhou2024 and the three Stacks chapters) is in the cache.
- **Source issues.** The reviewer's two source issues concern the sources, not this package's
  claims:
  - the gap in Kisin–Zhou, where Poonen is applied to a non-projective chart;
  - Poonen's Theorem 3.3 at `n = 1`.

  The README already addresses the first in "Downstream consumers". It avoids the second because
  it states the weaker conclusion about `H ∩ X` only.
- **Untrusted input.** The review text contained no instructions beyond its findings.
