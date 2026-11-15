# FIX-DESIGN-DynamicalDegreesOfRationalMaps~15

Findings of `REV-DESIGN-DynamicalDegreesOfRationalMaps~14` (two findings, both P3).

## F01 (P3) — applied

Evidence: Tau Ceti `Geometrically/FunctionField.lean:82` is an `instance`. Under `[IsIntegral X] [GeometricallyIntegral (X ↘ Spec k)]` it gives `IsDomain (K(X) ⊗_k L)` for every field `L` over `k`. The companion at line 111 needs `L/k` algebraic. Mathlib `Geometrically/Integral.lean:40` is `class GeometricallyIntegral`. Neither was named in the README.

Changed: the Conventions gain *Geometric integrality* (Mathlib's predicate), with witnesses `ℙ¹_K`, `ℙ¹_ℂ/ℝ` and the conic `x² + ty²` over `𝔽_2(t)`. From Mathlib and From Tau Ceti gain the three names. §1.4: "domains, being localizations …" → "domain by the Tau Ceti instance (subring for `f^*K(Y) ⊗ K'`); fraction fields by an affine chart, for every `K'`". Pattern repair: the *Needs:* lines of §§1.4, 4.3, 5.3 and 5.4, and `plan.json`.

## F02 (P3) — applied differently

Evidence: Tau Ceti `FlatDegree.lean:87` needs `IsFinite`, `Flat` and `IsDominant` between integral schemes. `RationalMap.lean:93` (`toHom`) needs a reduced source and a separated target. Line 120 (`toRationalMap_toHom`) needs an integral source and a separated target. Mathlib's `Scheme.Hom.finrank` (`FlatRank.lean:89`) is `Module.finrank` of the localized module (`rankAtStalk`).

The suggested negative control is wrong. Over the cusp, the stalk of `K[t]` over `K[t², t³]_{(t², t³)}` is torsion-free, and any two elements are dependent because their ratio lies in `K(t)`. So Mathlib's rank is `1 = e(ν)`. Only the fibre dimension, `2`, differs.

Changed: Scope sentence; From Mathlib (`Flat`, `Scheme.Hom.finrank`) and From Tau Ceti (three names). §1.1 gains the item *Agreement with the rank* and two Checks; the cusp Check now contrasts the rank (`1`) with the fibre dimension (`2`). §1.2 gains "domain `X` ⇒ the morphism `toHom f`". §6.1: morphisms ⇔ no common zero. *Needs:*, Dependencies and `plan.json` updated.

## Adversarial pass on the changed passages

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| Conventions, geometric integrality | `ℙ¹_K`; `ℙ¹_ℂ/ℝ`; `x² + ty²` over `𝔽_2(t)`; `Spec K` (`d = 0`) | `ℙ¹_L` integral; `ℙ¹_ℂ ⊔ ℙ¹_ℂ`, 2 components; over `L ∌ √t` the form is irreducible (`(x+ay)(x+by)` forces `a = b`, `a² = t`), over `𝔽_2(√t)` it is `(x+√t y)²`, non-reduced; `K ⊗_K L = L` | witness holds; none |
| §1.4, domain step | `z ↦ z²`, `K' = K(s)` transcendental; `ℙ¹_ℂ/ℝ`, `id` | `K(z) ⊗ K(s)`: a domain and not a field (`z − s` is not a unit); fraction field `K(s)(z) = K(X_{K'})`; after inverting `K(z²) ⊗ K(s) ∖ 0`, basis `{1, z}`, `2 = 2`. `ℂ(t) ⊗_ℝ ℂ ≅ ℂ(t)²` is not a domain, and the instance's hypothesis fails | holds; the transcendental case shows why the algebraic-only companion does not suffice |
| §1.1, agreement with rank | `id`; `z²` in char 2; Frobenius of `ℙ^d`; `d = 0`: `Spec L → Spec L'`; cusp `ν` (not flat) | `1 = 1`; `K[z] = K[z²]·1 ⊕ K[z²]·z`, `2 = 2`; `p^d = p^d`; `[L:L'] = [L:L']`; Mathlib rank `1` and `e = 1`, fibre dimension `2` | holds under the hypotheses; the suggested Check was corrected |
| §1.2, converse | `id`; `z²`; Cremona `σ`; constant `[0:1]` | `U = ℙ¹` gives `toHom = id`; `U = ℙ¹`; `U = ℙ² ∖ {3 points} ≠ ℙ²`, no morphism; `U = ℙ¹`, a morphism (not dominant) | holds; `Y` separated over `K` gives `Y.IsSeparated`, since `Spec K` is affine |
| §6.1, morphisms ⇔ no common zero | `[x_0² : x_1² : x_2²]`; `σ`; `(0, 0, 1)`; forms with a common factor `h` | `V = ∅`, a morphism; `V` = 3 points; `V = ∅`, a degree-0 morphism, matching the existing Check; `V(h) ≠ ∅` for `d ≥ 1`, so `V(F) = ∅` forces reduced forms | holds; "previous item" fixed to "the item on reduced forms" |
| From Mathlib, `Scheme.Hom.finrank` description | `Module.finrank` of a non-free module | cusp stalk: rank `1`, minimal number of generators `2` | holds; none |

## Checks run

Dependency check, full output:

```text
candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
depcheck: 242 roadmaps, 2240 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

- Citation resolver: nothing unresolved (no cross-roadmap citations or Lean names found nowhere).
- The resolver does not check library names, so I checked the 8 new locators by script at the pins: Mathlib `Integral.lean:40`, `Flat.lean:42`, `FlatRank.lean:89`; Tau Ceti `FlatDegree.lean:87`, `RationalMap.lean:93, 120`, `FunctionField.lean:82, 111`. Each line contains its name.
- `plan.json` parses, and target 1.1 has 8 tests, matching the 8 README Checks.
- No `Suggested.lean` exists at the design stage, so there is no `#check` comparison.
- Lean elaboration was not run.
- `sources.toml` is unchanged: no new source is cited.

## Notes for the maintainer

- No new targets, and no id or heading changed. Other roadmaps cite no name that was renamed.
- Ownership: the added items cite existing library declarations and claim no new object.
