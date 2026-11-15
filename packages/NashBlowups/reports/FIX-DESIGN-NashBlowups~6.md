# FIX-DESIGN-NashBlowups~6: repair of the design review

Review settled: `REV-DESIGN-NashBlowups~5`, five findings, all P3. Files edited:
`packages/NashBlowups/design/README.md`, `packages/NashBlowups/design/plan.json` and
`packages/NashBlowups/sources.toml`. There is no `Suggested.lean` at the design stage.

## REV-DESIGN-NashBlowups~5/F01 (P3) — applied

Verified. For `X = 𝔸¹` and `p` the origin, the ideal `(x)` is invertible, so `Bl_p X = X` and `h = q` is the identity.
For `X = 𝔸²`, the exceptional fibre is `ℙ¹`, so `h` is not an isomorphism.

Old → new: §1.3 Check 3 "For `X` smooth over `k`, … not an isomorphism" → "For `X` smooth over `k` of relative
dimension `r ≥ 2` … (a regular, hence reduced, scheme with exceptional fibre `ℙ^{r−1}_{κ(p)}`)". The Check now
also states that for `r = 1` the blowup is the identity, so the bound is needed. `plan.json` 1.3 test
`lift_blowup_not_terminal` is reworded the same way.

Pattern: every other blowup-of-a-point Check uses `𝔸²`, and each is correct: §1.2 Check 3, the §1.5 Check, the
Layer 1 Examples and §2.4 Check 1.

## REV-DESIGN-NashBlowups~5/F02 (P3) — applied

Verified. A script listed every italic (own) name of the README and searched every code span for it. The only
hits are the four the review names: §2.7 (two in the API bullet and the Check) and §7.1.

Old → new:
- §2.7 API: "`NashIterationResolves X d` holds iff" → "*NashIterationResolves* holds for `X` and `d` iff".
- §2.7 Check: "`NashIterationResolves X 2` holds although `NashIterationResolves X 1` fails" → "the iteration with
  `d = 2` resolves `X` although the iteration with `d = 1` does not". This is prose only, as a Check names no Lean
  counterpart.
- §7.1 API: the same change for *NormalizedNashIterationResolves*.
- `plan.json` test `nashIterate_wrong_dimension` gets the same prose.

## REV-DESIGN-NashBlowups~5/F03 (P3) — applied

Verified. `∂(x²) = 2x ∉ (x²)`, which contradicts "the stable ideal `(x²)`".

Old → new: §4.3 Check 1 → "`(x²)` is not `∂`-stable (`∂(x²) = 2x ∉ (x²)`), so its non-stable minimal prime `(x)`
is no counterexample; the only `∂`-stable ideals are `0` and `ℚ[x]`". The new text adds the proof: a polynomial of
least degree `n` in the ideal has `n`-th derivative equal to `n!` times its leading coefficient, a unit.

Pattern: every other stability claim was recomputed and holds:
- §4.3 Check 2: `∂_x(y²g) = y²∂_x g` and `∂_x(yg) = y∂_x g`.
- §4.3 Check 3: `∂(x^p g) = x^p g'`, while `∂x = 1 ∉ (x)`.
- §4.2: `L(r dx_j) = ∂r·dx_j`, and the stable-annihilator computation.
- §4.4 step 4 and the §4.4 Check.

## REV-DESIGN-NashBlowups~5/F04 (P3) — applied

Verified against stacksNormalization:
- §0.1 defines `c_f` only for two schemes over one `Spec R`, with target `Ω_{X/R}`.
- Line 2900 (01UV) is the version for a commutative square, with target `Ω_{X'/S'}`.
- On the review's witness, `0 → k(s)·ds` is not an isomorphism.

Old → new: §0.2 now defines `b_{g'} = e ∘ c_{g'} : g'*Ω_{X/R} → Ω_{X'/R} → Ω_{X'/R'}`. Here:
- `X'` is regarded over `Spec R`.
- `e` comes from `Scheme.relativeDifferentialsHomEquiv` applied to the universal `R'`-derivation, and is surjective
  (01UX, line 2918).
- Equivalently, `b_{g'}` is the adjoint of `h ↦ d_{X'/R'}(g'*h)` (01UV, line 2900).

The theorem asserts that `b_{g'}` is an isomorphism (01V0). Three Checks are added: `k → k(s)`, the inseparable
non-reduced base change, and `ℤ → 𝔽₂` (agreeing with `tensorKaehlerEquiv`). Also updated:
- §0.2 *Needs* gains Tau Ceti `Scheme.relativeDifferentialsHomEquiv`.
- `plan.json` 0.2: statement, locator, prerequisite, and three tests.
- `sources.toml` stacksNormalization `cited_for`.

Pattern: no other consumer of §0.2 used the ill-defined map. §2.6 uses it for `k → k'`, with target `Ω_{X_{k'}/k'}`,
which is now `b_{g'}`. §§3.1 and 3.3 use only the closed-immersion clause over one base.

## REV-DESIGN-NashBlowups~5/F05 (P3) — applied

Verified that nothing outside this package cites these numbers:
- `roadmaps grep` for `NashBlowups` and for `Nash blow`: "no match on main or in any open roadmap pull request".
- The overlap file lists no dropped ids.
- No board package README or plan names NashBlowups.

No old → new mapping table is therefore needed.

Old → new: §0.6 → §0.5 and §0.7 → §0.6. The renumbered references are:
- the headings;
- Scope (line 35);
- §4.4 step 5 and its *Needs*;
- the §5.4 route and its *Needs*;
- the §6.3 route, the §6.3 Check and its *Needs*;
- the Layer 6 Dependencies;
- `plan.json` ids, `target:` prerequisites and the 6.3 test text;
- the `cited_for` entries of `stacksVarieties` and `stacksAlgebra`.

Every SchemeAndStackFoundations §0.7 citation is left as it was. Those are lines 45, 226, 368, 382, 490, 691, 701,
810, 1005, 1009, 1019 and 1046, and the plan's `roadmap:` prerequisites and supplier sections.

## Adversarial pass on changed and added statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §0.2 `b_{g'}` iso | `R' = R` | `g' = id`, `c = id`, `e = id`, `b = id` | iso |
| §0.2 | `R' = 0` | `X' = ∅`, both sides zero | iso (trivially) |
| §0.2 | `k → k(s)`, `X = Spec k` | `c_{g'}: 0 → k(s)ds`; `b: 0 → 0` | `c` not iso, `b` iso: target over `R'` pinned |
| §0.2 | `k = 𝔽_p(t) → k(τ)`, `X = Spec k[y]/(y^p − t)` | `Ω_{K/k} = K dy`; `A' = k'[u]/(u^p)`; `Ω_{A'/k}` free on `dτ, du`, `c(dy) = dτ + du`; `Ω_{A'/k'} = A' du`, `b(dy) = du` | iso with non-reduced, inseparable base change; `c` not surjective |
| §0.2 | `ℤ → 𝔽₂`, `𝔸¹_ℤ` | `Ω_{𝔽₂/ℤ} = 0`; `b(dT) = dT` | identity, matches `tensorKaehlerEquiv` |
| §0.2 | `R → R_f` | `Ω_{R_f/R} = 0`, `e` iso, `b` = restriction | iso |
| §0.2 closed immersion | `i = id`; `Spec k → 𝔸¹` | `c = id`; `k dx → 0` | surjective; not injective in general |
| §0.2 affine chart | `B = R' ⊗_R A` | pinned `tensorKaehlerEquiv : B ⊗[A] Ω[A⁄R] ≃ₗ[B] Ω[B⁄S]` (`Mathlib/RingTheory/Kaehler/TensorProduct.lean:238`, `S = R'`) | agrees |
| §1.3 Check 3 | `r = 2` (`𝔸²`), `r = 1` (`𝔸¹`), `r = 0` (`Spec k`) | fibre `ℙ¹`, not iso; `(x)` invertible, identity; `Bl = ∅` | `r ≥ 2` needed; `r = 0` excluded |
| §1.3 Check 3 hypotheses | `Bl_p X` for `X` smooth of relative dimension `r`, `p` closed | charts `A[m/x_1] ≅ A[T_2..T_r]/(x_1T_i − x_i)` are regular; `h⁻¹(X) = Bl_p X` | `Z` reduced and density hold |
| §2.7 Check (prose) | cusp char 2 with `d = 2`, `d = 1` | `X_sm^{(2)} = ∅`, `X^{(1)} = ∅` smooth; `X^{(i)} ≅ X` singular for all `i` | `d = 2` resolves, `d = 1` does not |
| §4.3 Check 1 | `(x²)`; nonzero stable `I` with least degree `n = 0, 1, 2` | `∂(x²) = 2x ∉ (x²)`; `∂^n f = n!·a_n ∈ ℚ^×` | only `0` and `ℚ[x]` |
| §0.5, §0.6 renumbering | every reference | §4.4 step 5 and §5.4 use smoothness at closed points (now §0.5); §6.3 and its Check use normal base change (now §0.6) | consistent; 37 plan ids, all `target:` resolve |

## Checks

Dependency gate:

```
candidate: NashBlowups is not in the merge order yet; checked as if placed after DeformationAndDerivedPatchingAlgebra (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2232 edges, 0 problem(s)
```

The gate prints no UPWARD and no CYCLE line.

`roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name that is found nowhere. The two leads
in the worker's citations file (`DerivedDeRham.IsPBasis`, `pBasis_kaehler_basis`) now resolve.

Consistency checks:
- `plan.json` parses, with 37 targets and 118 tests, and no test name is repeated.
- The README `###` target headings and the plan ids agree.
- Every plan name appears in italics in the README.
- `sources.toml` parses, with 15 entries.

Lean: no `Suggested.lean` exists at the design stage, so no `#check` comparison was run and no Lean command was run.

No gate failures were listed for this round.

## Ownership and sources

- The F04 repair defines the base-change map of §0.2, which was already this roadmap's target. Neither the pinned
  Tau Ceti `AlgebraicGeometry/Modules/Differentials/` (no base-change file) nor any roadmap supplies a base-change
  map for Tau Ceti's `Ω_{X/R}`. Two roadmaps have similar results on different objects:
  - AdicSpacesPartIII (main) `relativeDifferentials.baseChangeIso` is for locally noetherian analytic adic spaces.
  - HodgeTateAndCanonicalSubgroups §0.21 `conormal_baseChange` concerns invariant differentials `ω_H` of a finite
    locally free group scheme.
- No source was fetched. The new locators were read in the cached stacksNormalization text: line 2900 (01UV), line
  2918 (01UX) and line 2926 (01V0). `needs-references.toml` was not created.

## Notes for the maintainer

- The numbering of Layer 0 changes: §0.6 → §0.5 (smoothness at closed points over a perfect field) and §0.7 → §0.6
  (normality under separable base change). Plan ids 0.6 → 0.5 and 0.7 → 0.6 change with them. No roadmap on main,
  in an open pull request or on the board cites NashBlowups, so nothing breaks.
- No declaration name changed. The base-change map `b_{g'}` is notation inside §0.2, not a new declaration.
- The review text contained no instruction-like passages.
