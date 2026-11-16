# GATE-SiegelModularForms~2: answers to human review

One review comment was unanswered; it makes one point (H01).

## H01 (mycaule) — answered

LeanPool's `LeanModularForms` at `f8b9b72` (ContourIntegral, ForMathlib, GeneralizedResidueTheory, HeckeRIngs with AbstractHeckeRing/GL2/GLn, Modularforms with Eisenstein/Delta/Eta/E2/DimensionFormulas/JacobiTheta, SpherePacking, ValenceFormula) holds only degree-one material. This roadmap plans none of that material: every degree-one object it uses comes from the pins (Mathlib `ModularForm.E`, `CuspForm.discriminant`, `ModularForm.dimension_level_one`, `NumberTheory/HeckeRing/Defs.lean`; Tau Ceti `NumberTheory/HeckeRing/*`, `ModularForms/LevelOne/*`) or from named roadmaps. So no citation of LeanPool is needed; README §"Exact supplier contracts" already says nothing waits on an external repository. Checking the one shared object, the abstract Hecke ring, did turn up an error. The README credited its convolution product to Mathlib, but at the pin Mathlib's `HeckeRing/Defs.lean` gives only the `FunLike`/`AddCommMonoid`/`AddCommGroup` structure (lines 202–208). It also labelled Tau Ceti's generic modules "for `g = 1`". The commit makes these changes:

- README 7.1 (lines 2211–2232), its *Needs:* line, Layer 7 *Dependencies* (2450–2454), the build overview (482) and the Tau Ceti supplier contract (276–280, 305–313) now cite Tau Ceti's generic `HeckeCosetModule.instRingHeckeRing` and Shimura's criterion `HeckeCosetModule.mul_comm_of_antiInvolution`.
- The `Suggested.lean` docstring (line 40) changed "the Hecke algebra as a ring with its characters" → "the Satake transform `H_p ⊗ ℚ → ℚ[Y]^W`" as what 7.4 lacks at the pins.

## Build

`lake build TauCetiRoadmap.SiegelModularForms.Suggested` at commit `61c6276`: `Build completed successfully (18854 jobs).` It gave 72 `declaration uses 'sorry'` warnings and no errors. The same command also succeeded at `bee9025` before any edit.

## Gate

```
gate SiegelModularForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
  depcheck: NOT IN ORDER: SiegelModularForms (insert it after its last supplier)
```

The only nonzero count is `depcheck=1`, and the line was the same at `bee9025` before any edit. It says that SiegelModularForms is not yet listed in `ORDER.txt`, which is the design-stage condition. The intake places the roadmap after its last supplier; this is not a dependency defect.

## Dependency direction check

```
NOT IN ORDER: SiegelModularForms (insert it after its last supplier)
depcheck: 248 roadmaps, 2377 edges, 1 problem(s)
```

There is no UPWARD and no CYCLE line. The repair adds no cross-roadmap edge: the new citations are pinned Tau Ceti declarations.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `H(Γ_g, GSp⁺_{2g}(ℚ))` is Mathlib's `HeckeRing` with Tau Ceti's ring structure (7.1, contract) | Mathlib `HeckeRing/Defs.lean` at the pin; Tau Ceti `Associativity.lean:484`; `g = 0` | Mathlib instances: `FunLike`, `AddCommMonoid`, `AddCommGroup` only, no `Mul`. `instRingHeckeRing` needs `[IsHeckeTriple Δ H H]` and `[Ring R']`. At `g = 0`, `GL` of the empty index type is trivial, so there is one double coset and the ring is `ℤ`. | Holds. `IsHeckeTriple` is the first target of 7.1; the README's "ring of coefficients" matches `[Ring R']`. | Credit moved from Mathlib to Tau Ceti. |
| `γ ↦ γ^∨ = μ(γ)γ⁻¹` is a `HeckeAntiInvolution` of `GSp⁺_{2g}(ℚ)` preserving `Γ_g` | Algebraic identities | Anti-multiplicative: `(γδ)^∨ = μ(γ)μ(δ)δ⁻¹γ⁻¹ = δ^∨γ^∨`. Multiplier: `(μγ⁻¹)J(μγ⁻¹)ᵀ = μ²·μ⁻¹J = μJ`, so `μ(γ^∨) = μ(γ) > 0`. Involutive: `(γ^∨)^∨ = μ(μγ⁻¹)⁻¹ = γ`. `γ ∈ Γ_g` has `μ = 1`, so `γ^∨ = γ⁻¹ ∈ Γ_g`. | Holds; matches the three fields `toFun`, `involutive`, `mem_H` at the pin. | None beyond the citation. |
| `γ ↦ γ^∨` fixes every double coset, so the ring is commutative by `mul_comm_of_antiInvolution` | `g = 2, p = 2`; `g = 1, γ = [[1,1],[0,2]]`; scalar `c·1`; noncommutative coefficients | `diag(1,1,2,2)^∨ = 2·diag(1,1,½,½) = diag(2,2,1,1) = J·diag(1,1,2,2)·J⁻¹`, the same double coset. `[[1,1],[0,2]]^∨ = 2·[[1,−½],[0,½]] = [[2,−1],[0,1]]`, elementary divisors `(1,2)` on both sides. `(c·1)^∨ = c²·c⁻¹·1 = c·1`. With `2 × 2` matrix coefficients `a, b`, `(a[1])(b[1]) = ab[1] ≠ ba[1]` when `ab ≠ ba`. | Holds over commutative coefficients and fails without them. | The contract states "over a commutative coefficient ring", matching `[CommSemiring R]`. |
| `Suggested.lean` docstring: 7.4 lacks the Satake transform, not the Hecke ring | Grep of the pinned Mathlib and Tau Ceti for `Satake` | Mathlib: no match. Tau Ceti: only `ModularForms/Newforms/Satake.lean` (the `GL₂` newform roots of `X² − a_p X + χ(p)p^{k−1}`) and a use in `Newforms/BadPrime/Primes.lean`. There is no transform `H_p → ℚ[Y]^W`. | 7.4 stays unstatable, now for the correct reason; stating only an abstract isomorphism would be a weakened substitute. | Docstring line only; no declaration changed. |

## Elaborated signatures

No declaration of `Suggested.lean` changed; only the module docstring (lines 40–42) changed. So the elaborated types are still those recorded in `signatures.md`, and the `#check @name` comparison was not rerun this round. The module build above succeeds. The five dropped-binder leads in `signatures.md` are not part of this review point and were not reopened.

## Ownership

The abstract Hecke ring is owned by the pins: Mathlib has the types and Tau Ceti has the product, ring, `HeckeAntiInvolution` and Shimura's criterion, for any group. This roadmap owns only its Siegel instance (7.1). A search of the open roadmap pull requests and main for `instRingHeckeRing`, `mul_comm_of_antiInvolution` and "abstract Hecke ring" found only citations of the same Tau Ceti declarations, in AutomorphicBundles, IgusaVarietiesAndTorsionConcentration (and Part II), BianchiModularForms, VonNeumannAlgebras, HigherHidaAndColemanTheory and EisensteinIdealAndRationalTorsion. No roadmap claims ownership, so there is no conflict.

## Sources

No source was newly cited and no `needs-references.toml` entry was written. The LeanPool repository listing was read on GitHub as data; it contained no instructions.

## Commit

`61c6276` — "SiegelModularForms: review repairs (Hecke ring product and commutativity credited to Tau Ceti, not Mathlib)". It changes `TauCetiRoadmap/SiegelModularForms/README.md` (+28/−11) and `TauCetiRoadmap/SiegelModularForms/Suggested.lean` (+3/−2). Not pushed.
