# FIX-DESIGN-HochschildHomologyAndHKR~15

Review settled: `REV-DESIGN-HochschildHomologyAndHKR~14` (one finding, F01). Its "For the human
reviewers" section lists nothing.

## F01 (P3) — applied

§4.2 bullet "`A^{⊗n}` projective … likewise flat" → §1.4 first bullet (flat/projective by induction from `A^{⊗0} ≅ k`), plus a degreewise-exactness bullet and the full Mathlib inputs on §1.4's *Needs:*. §4.2 now cites §1.4 for `B_n(A)` projective. Same repointing in §§4.5, 7.2, 7.6, the Mathlib contract and plan targets 1.4, 4.2, 4.5, 7.2, 7.6.

## Details of the F01 repair

Verified: §1.4's chain clause needs `− ⊗[k] A^{⊗n}` exact and its cochain clause needs
`Hom_k(A^{⊗n}, −)` exact. These need `A^{⊗n}` flat, resp. projective. That fact was stated only in
§4.2, bullet 1. Neither pin has a flatness or projectivity instance for `PiTensorProduct` or
`TensorPower`: I searched the instances and theorems of `LinearAlgebra/PiTensorProduct/*`,
`LinearAlgebra/TensorPower/*` and every Mathlib or Tau Ceti file mentioning both a tensor power and
`Module.Flat`/`Module.Projective`/`Module.Free`. The only related result is `Basis.piTensorProduct`
(finite index, free factors), which gives neither flatness nor projectivity. The statement of §1.4
was true; only its inputs came late.

Changes (old → new):

- §1.4: *Needs:* "§1.3; … `Module.Flat`, `Module.Projective`" → the same plus `TensorPower.algebraMap₀`,
  `TensorPower.mulEquiv`, `PiTensorProduct.subsingletonEquiv`, `PiTensorProduct.lift`,
  `Module.Flat.self`, `Module.Flat.instTensorProduct`, `Module.Flat.of_linearEquiv`,
  `Module.Projective.of_free`, `Module.Projective.tensorProduct`, `Module.Projective.of_equiv'`,
  `Module.Flat.rTensor_preserves_injective_linearMap`, `rTensor_exact`,
  `LinearMap.rTensor_surjective`, `Module.projective_lifting_property`. New bullets: (1) `A^{⊗n}` is
  flat or projective when `A` is, by induction on `n` from `A^{⊗0} ≅ k`; (2) exactness in each
  degree, flat, projective and split cases.
- §4.2: bullet "`A^{⊗n}` projective … likewise flat" → "`B_n(A) ≅ Aᵉ ⊗[k] A^{⊗n}` is
  `Aᵉ`-projective for `k`-projective `A` (`Module.Projective.tensorProduct`; §1.4, first bullet)";
  *Needs:* "§4.1" → "§§1.4, 4.1".
- plan.json: target 1.4 takes the API entry `HochschildHKR.tensorPower_projective` (moved from 4.2)
  and a degreewise-exactness entry, plus the Mathlib prerequisites above. Target 4.2 gets
  `target:1.4` and the API entry `barResolution_term_projective` in place of the moved one.

Repair the pattern (every other place that used the fact through §4.2):

- §4.5 route "`A^{⊗n}` is `k`-flat (§4.2)" → "(§1.4)"; *Needs:* "§§1.1, 4.1–4.2" → "§§1.1, 1.4, 4.1–4.2";
  plan 4.5 gets `target:1.4`. The second "(§4.2)" in §4.5 (the augmentation is a resolution) is
  §4.2's own content and stays.
- §7.6 route "`C_n(R,R)` is a projective `R`-module (§4.2 and `Module.Projective.tensorProduct`)" →
  "(§1.4 and …)"; *Needs:* "§§1.5, 4.2, …" → "§§1.4, 1.5, …". §4.2 was cited in §7.6 for this alone.
  Plan 7.6: `target:4.2` → `target:1.4`.
- §7.2 used the same fact without a section reference: "(for instance `R` projective as a
  `k`-module, by `Module.Projective.tensorProduct`)" → "by §1.4 and `Module.Projective.tensorProduct`";
  *Needs:* "§§1.5, 7.1" → "§§1.4, 1.5, 7.1"; plan 7.2 gets `target:1.4`.
- "From Mathlib" contract: added `TensorPower.algebraMap₀`, `Module.Projective.of_free`,
  `Module.Projective.of_equiv'`, `Module.projective_lifting_property`, `Module.Flat.self`,
  `Module.Flat.of_linearEquiv`, the name `Module.Flat.instTensorProduct` of the previously unnamed
  flat tensor-product instance, `rTensor_exact` and `LinearMap.rTensor_surjective`, each with what
  is assumed of it. Layer 1's Dependencies paragraph now names flat and projective modules (§1.4).

§8.3 cites §4.2 for the bar resolution itself, not for this fact, and is unchanged. No layer moved,
no target was added, and no section number changed.

### Pinned declarations used by the repair (Mathlib `1b1ccf4b`)

| Name | File and line | What is relied on |
| --- | --- | --- |
| `TensorPower.algebraMap₀` | `Mathlib/LinearAlgebra/TensorPower/Basic.lean:201` | `R ≃ₗ[R] ⨂[R]^0 M` |
| `TensorPower.mulEquiv` | same file, `:75` | `⨂^n M ⊗ ⨂^m M ≃ₗ ⨂^(n+m) M` |
| `PiTensorProduct.subsingletonEquiv` | `Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean:814` | `⨂` over a subsingleton index (here `Fin 1`) is the factor |
| `PiTensorProduct.lift` | same file, `:427` | multilinear maps `≃ₗ` linear maps out of `⨂` |
| `Module.Flat.self`, `Module.Flat.of_linearEquiv` | `Mathlib/RingTheory/Flat/Basic.lean:166`, `:182` | `R` flat over itself; transport along `≃ₗ` |
| `Module.Flat.instTensorProduct` | same file, `:234` (anonymous instance in `namespace Module.Flat`) | `Flat S (M ⊗[R] N)` from `Flat S M`, `Flat R N`. The name is the one the toolchain's `DeclNameGen` (v4.36.0-rc2) gives: the namespace constant `Module.Flat` is dropped, leaving `instTensorProduct`. Mathlib's own docstring at `Mathlib/RingTheory/Flat/Stability.lean:88` uses the same name. |
| `Module.Flat.rTensor_preserves_injective_linearMap` | same file, `:121` | `f` injective ⇒ `f.rTensor X` injective for flat `X` |
| `Module.Projective.of_free`, `Module.Projective.of_equiv'` | `Mathlib/Algebra/Module/Projective.lean:161`, `:188` | free ⇒ projective; transport along `≃ₗ` |
| `Module.Projective.tensorProduct` | same file, `:240` (variables at `:214–216`: `R` a semiring, `R₀` commutative, `Algebra R₀ R`, `IsScalarTower R₀ R M`) | `M ⊗[R₀] N` is `R`-projective; applies with `R = Aᵉ` noncommutative |
| `Module.projective_lifting_property` | same file, `:91` | maps out of a projective lift along surjections |
| `rTensor_exact` | `Mathlib/LinearAlgebra/TensorProduct/RightExactness.lean:395` (root namespace; `CommRing R`, `Exact f g`, `g` surjective) | right exactness of `− ⊗ Q` |
| `LinearMap.rTensor_surjective` | same file, `:147` | `rTensor` keeps surjections |

### Adversarial pass on the changed and added statements

| Statement | Instances tried and values computed | Result | Change |
| --- | --- | --- | --- |
| §1.4 bullet 1: `A^{⊗n}` flat (resp. projective) when `A` is | `n = 0`, `k = ℤ`, `A = 𝔽_p` (neither flat nor projective): `A^{⊗0} ≅ ℤ`, free; conclusion true, and the bullet says "whatever `A` is" for `n = 0`. `n = 1`: `A^{⊗1} ≅ A` by `subsingletonEquiv`. `k = ℤ`, `A = ℤ[x]`: `A^{⊗2} ≅ ℤ[x,y]`, basis `xⁱyʲ`, free. `k = ℤ`, `A = ℚ`: `A^{⊗2} = ℚ ⊗ ℚ ≅ ℚ` (`q ⊗ r ↦ qr`), torsion-free hence flat; `Hom_ℤ(ℚ, ℤ) = 0`, so not projective. This refutes the wrong model "flat tensor powers are projective". `k = 0`: every term is `0`. | holds | added |
| §1.4 bullet 2: degreewise exactness | Flatness is needed: `k = ℤ`, `A = ℤ[x]/(px)`, symmetric bimodules `ℤ --p--> ℤ → ℤ/p` (`x` acts by `0`, through `A/(x) = ℤ`). The sequence is not `ℤ`-split (no nonzero `ℤ/p → ℤ`). In degree 1, `M' ⊗ A → M ⊗ A` is `p` on `A = ℤ ⊕ x𝔽_p[x]`, and `1 ⊗ x ↦ p ⊗ x = 1 ⊗ px = 0`, with `1 ⊗ x ≠ 0`: not injective, so the hypothesis cannot be dropped. Split case: for `A = 𝔽_p` over `ℤ`, every bimodule sequence is `𝔽_p`-split, hence `ℤ`-split, and the chains are exact although `A` is not flat. Degree `0`: `C₀ = C⁰ = M`, the given sequence. Projective cochains: `A = ℤ[x]`, `ℤ[x] → 𝔽_p[x]`; a `ℤ`-linear `f : A → 𝔽_p[x]` lifts by lifting each `f(xⁱ)`. | holds | added |
| §4.2 new bullet: `B_n(A)` `Aᵉ`-projective for `k`-projective `A` | `A = k`: `Aᵉ = k`, `B_n = k`, free. `A = Mat₂(k)`: `Aᵉ ≅ Mat₄(k)`, `A^{⊗n}` free of rank `4ⁿ`, `B_n ≅ (Aᵉ)^{4ⁿ}`, free. Hypothesis not necessary, no contradiction: `k = ℤ`, `A = ℚ`: `B_n(ℚ) = ℚ = Aᵉ`, free over `Aᵉ` though `A` is not `ℤ`-projective. The pinned instance allows a noncommutative `R = Aᵉ` (`[Semiring R]`). | holds | replaced bullet |
| §4.5 route through §1.4 | `k = ℤ`, `A = ℚ[x]` (the §4.5 Check): `A^{⊗n} = ℚ[x₁,…,x_n]`, torsion-free, so flat; matches that Check's `Tor_n = ℚ[x], ℚ[x], 0, …`. The non-flat Check `A = ℤ[x]/(px)` is outside the hypothesis, as before. | holds | citation only |
| §7.2 parenthetical, §7.6 route | `k = ℤ`, `R = ℤ[x]`: `C₁(R,R) = R ⊗ R = ℤ[x,y]`, free over `R = ℤ[x]` (acting on `x`) with basis `yʲ`. `k = 𝔽₂`, `R = 𝔽₂[x,y]`: `C_n` free over `R`. | holds | citation only |
| Contract entry `rTensor_exact` | Hypotheses at the pin: `CommRing R`, `Exact f g`, `g` surjective. The contract now says "an exact pair `f, g` with `g` onto", and the use in §1.4 has `M → M''` onto. | agrees | entry added |

All other statements are textually unchanged; their round-14 computed values stand.

## Checks run

Dependency check (the command of the brief), after all edits:

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 241 roadmaps, 2251 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Inside the roadmap, §1.4 no longer depends on §4.2, so every internal
edge now points forward.

Citation resolver on the edited README: no cross-roadmap citation and no Lean name found nowhere.
It reports that Lean names outside TauCetiRoadmap were not checked on this host, so I checked each
new Mathlib name at the pin by hand (table above). The `toExteriorBidual` lead in the worker's
citation listing is IntegralIwasawaTheory §12.6's carrier, cited under its contract; the round-14
review settled it and this repair does not touch it.

Lean: this is the design stage. There is no `Suggested.lean`, and the brief gives no Lean
command, so no `#check` file was elaborated. The binder audit does not apply yet.

`plan.json` is valid JSON with the file's existing formatting (indent 1, UTF-8). `sources.toml` was not
changed: the repair adds no citation, and no `needs-references.toml` was written.

## Ownership and overlaps

The moved fact (tensor powers of flat or projective modules) has no owner on main or at the open
heads. A by-object search of every roadmap with `roadmaps grep` found only unrelated
uses: StableReduction's tensor powers of line bundles, and HeightsRationalPointsAndObstructions'
`faithfulProjective_tensorPower_free`, a K-theoretic root statement. Neither pin has it, so this
roadmap stays its owner, as it was in §4.2. The worker's overlap listing names no pull request
that changes this roadmap, no dropped id, and no id only an open revision defines.

## For the maintainer

- No section, layer or target id changed. Other roadmaps cite no backticked name of this roadmap
  (there is no `Suggested.lean`). Only the plan-internal API entry `HochschildHKR.tensorPower_projective`
  moved, from target 4.2 to 1.4.
- Nothing in the review was suspicious or instruction-like.
