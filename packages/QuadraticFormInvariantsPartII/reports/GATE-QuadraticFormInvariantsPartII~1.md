# GATE-QuadraticFormInvariantsPartII~1: answers to human review of `43253eb`

One review comment was unanswered: CBirkbeck's posted review of `43253eb`, which makes one point (F01). The repair is commit `b38ee3c` on the branch (not pushed).

## H01 (CBirkbeck) — applied

Applied in the roadmap text, wherever the same claim occurs: "their roundness and the equivalence of isotropy with hyperbolicity" → "their roundness in every fold and, for nonsingular ones, the equivalence of isotropy with hyperbolicity" in the Summary (`TauCetiRoadmap/QuadraticFormInvariantsPartII/README.md:9–11`); "their roundness in every fold and the equivalence of isotropy, hyperbolicity and vanishing of the Witt class" → the same qualification in Scope and ownership (README:42–44, where it is also needed because a singular form has no class in `I_q(F)`); "roundness and the isotropy criterion in every fold and characteristic" → "roundness in every fold and characteristic, and the isotropy criterion for nonsingular ones" in How to read the build (README:433–434); and the matching bullet of the module docstring of `TauCetiRoadmap/QuadraticFormInvariantsPartII/Suggested.lean:21–22`. The README does not write the reviewer's `(1 − 4a₀ ≠ 0)` in these overview passages because `a₀` is not yet defined there. "Nonsingular" is defined in Conventions (README:134–136), and §1.1 and §1.5 already give the criterion `1 − 4a₀ ≠ 0`. The PR description is outside what this job may edit, so its `roadmap-summary` block and first prose paragraph still need the reviewer's wording: "roundness in every fold, and isotropy equivalent to hyperbolicity for nonsingular quadratic Pfister forms (`1 − 4a₀ ≠ 0`)". That wording is correct as it stands, since `a₀` is the terminal slot of `quadraticPfister a a₀`.

Other occurrences checked and left unchanged, because each is already restricted to nonsingular forms:
- the invariant-zero criterion (Summary line 16 "nonsingular Pfister form"; §3.9 "nonsingular quadratic `n`-fold Pfister form");
- the Hauptsatz route (§2.11), which uses Pfister forms whose classes lie in `I_qⁿ(F)`;
- the characteristic-two step of §6 (README:1765), where `1 − 4a₀ = 1`;
- the parent's "two-fold isotropy criterion" (README:34), which is about diagonal unit Pfister forms with `2` invertible, and these are always nonsingular;
- the Lean statement `not_anisotropic_quadraticPfister_iff_equivalent_dualProd`, which already carries `h : 1 − 4 * a₀ ≠ 0`, and its docstring, which already says "nonsingular".

## Adversarial pass on the changed sentences

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Roundness in every fold, no nonsingularity (Summary, Scope, How to read, Lean docstring) | ℚ, `m = 0`, `a₀ = 1/4` (singular) | `q = (x + y/2)²`; a nonzero value is `c = s²`; `q(s x, s y) = s² q(x, y) = c q(x, y)`, so `c q ≅ q` | Round although singular: keeping roundness unqualified is correct | Qualifier attached only to the isotropy clause |
| Isotropy ⇔ hyperbolicity, nonsingular only | ℚ, `m = 0`, `a₀ = 1/4` | `1 − 4a₀ = 0`; isotropic at `(1, −2)`: `1 − 2 + 1 = 0`; polar determinant `4a₀ − 1 = 0` versus `−1` for `x y` | Isotropic and not hyperbolic; the qualifier excludes this case | Qualifier added |
| Same, nonsingular, `2` invertible | ℚ, `m = 0`, `a₀ = 0` | `1 − 4a₀ = 1`; `q(0, 1) = 0`; `x² + x y = u v` with `u = x`, `v = x + y`, determinant `1` | Isotropic and hyperbolic: both sides true | None |
| Same, characteristic two, anisotropic | `𝔽₂`, `m = 0`, `a₀ = 1` | `1 − 4a₀ = 1 ≠ 0`; `[1, 1]` takes the value `1` at `(1, 0)`, `(0, 1)` and `(1, 1)`; its class in `I_q(𝔽₂) ≅ ℤ/2` is nonzero | Anisotropic and not hyperbolic: both sides false | None |
| Same, characteristic two, `m = 1` | `𝔽₂`, `a = (1)`, `a₀ = 1` | `⟨⟨1⟩⟩_b ⊗ [1, 1] = [1, 1] ⊥ [1, 1]` (sign invisible); value `1 + 1 = 0` at `(1, 0, 1, 0)`; `[1, 1] ⊥ [1, 1] ≅ [1, 0] ⊥ ℍ ≅ ℍ ⊥ ℍ` by EKM Example 7.23, p. 44 | Isotropic and hyperbolic: both sides true | None |
| Vanishing of the Witt class (Scope bullet) | singular `[1, 1/4]` over ℚ | Classes in `I_q(F)` are defined only for nonsingular forms (§0.5) and `[1, 1/4]` has polar determinant `0` | The third condition is meaningless without nonsingularity; the qualifier covers it | Qualifier added |
| Nonsingularity ⇔ `1 − 4a₀ ≠ 0` (the criterion the qualifier refers to, §1.1) | any `m`, any `a` | The polar matrix is block diagonal with blocks `w_k [[2, 1], [1, 2a₀]]`, each of determinant `w_k² (4a₀ − 1)`, and every `w_k` is a unit | Agrees with EKM's convention that Pfister forms are nondegenerate (ekm line 2853) and with Corollary 9.10 (ekm line 2933) | None |

The Lean diff touches only the module docstring (`Suggested.lean:21–22`). No declaration's type, binders or body changed, so the elaborated signatures recorded for the 25 declarations stand as they were. The build again shows 19 `sorry` warnings, the same as before the change. README and Lean agree: the README bullet and the docstring bullet now carry the same qualification.

Ownership: the repair adds no object and no citation, so it raises no ownership question. The overlap scan reports no open pull request that changes this roadmap and no dropped cited ids.

## Build

`lake build TauCetiRoadmap.QuadraticFormInvariantsPartII.Suggested`: `Build completed successfully (18718 jobs).` 19 warnings, all `declaration uses 'sorry'`, and no errors.

## Gate

Before the commit, the only failure was `dirty=2`, for the two uncommitted files. After commit `b38ee3c`:

```
gate QuadraticFormInvariantsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

## Dependency check

```
depcheck: 246 roadmaps, 2235 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

## For the worker

- The PR description's `roadmap-summary` block and first prose paragraph still need the qualification of H01, in the wording given there. This job may not edit PR text.
- No text in the review was suspicious. The citation lead `IsCi.exists_common_zero` (README line 1594) is outside this point and was not touched.
