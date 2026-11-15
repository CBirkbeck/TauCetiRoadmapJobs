# FIX-PKG-ModularFormsPartII~9

Findings of `REV-PKG-ModularFormsPartII~8` (three findings: one P2, two P3). The review's "For the human reviewers" section lists no finding, and nothing was changed because of it.

## F01 (P2) — applied

Checked against SpecialFunctionsTheta at its open head (76a507d, through `roadmaps show`). There, §2.2 is the quadratic relations and quartic identity, §4.2 the products and non-vanishing of the theta constants, §6.1 `k`, λ, its laws, the imaginary-axis facts and Jacobi's inversion, §6.2 the mapping theorem with boundary and cusp values, and §6.4 the hypergeometric identity on `F + 2n`.

Old → new: §2.2 → §4.2 (products), §4.1 → §2.2 (quartic), §5.1 and §§5.1–5.2 → §6.1, §5.3 → §6.2 (bijection, cusps) or §6.4 (hypergeometric identity). The edits are at README lines 22, 97, 278, 280, 285–287, 296, 302, 304, 332, 334, 336, 342, 344 and 359, and in the `modularLambda` docstring of `Suggested.lean`.

Applied differently in one detail, the region F. SpecialFunctionsTheta's Conventions define F with `0 < τ.im`, and our two definitions of F (the supplier contract and the proof of §2.2) now read `{τ ∈ ℍ : …}`. Without that restriction, `τ = 0.3 − 0.8i` satisfies all three inequalities (`|τ − 1/2| = 0.8246`, `|τ + 1/2| = 1.1314`), and SpecialFunctionsTheta's junk value is `λ = 0` there, which lies on the cut. In the proof of §2.6 I wrote "the fundamental region of `Γ(2)`" instead of a second letter F, so that the region is not confused with Gauss's F.

## F02 (P3) — applied

Old → new: the Dependencies lines now name what their `*Needs:*` lines name:
- Layer 2: parity `TauCeti.char_neg_one_of_modFormCharSpace_ne_bot` and the congruence-subgroup API.
- Layer 3: Mathlib `LaurentSeries`, `Subfield.closure`, `CongruenceSubgroup.Gamma`.
- Layer 5: gap:udc-rational-cusp-of-twisted-full-level.
- Layer 6: Mathlib η, Δ, `q`-expansion, boundedness and congruence API, `IsAlgebraic`, `IntermediateField`.
- Layer 7: gap:udc-bombieri-andre-katz, the Mathlib names and the Tau Ceti parity name.
- Layer 9: gap:udc-all-prime-cuspidal-model-of-full-level.

I repaired the same pattern in two layers the review did not list:
- Layer 1 now also names `MeromorphicAt`, `NumberField.RingOfIntegers`, `Subgroup.normalCore`, Δ and Tau Ceti `CongruenceSubgroup.Gamma_le_Gamma_of_dvd`. Its §1.8 *Needs:* names that last declaration.
- Layer 8 now names the graded ring (`ModularForm.instGCommRing`), η, Δ, θ, `q`-expansion and boundedness.

A script compared every family and every Tau Ceti name of each layer's *Needs:* lines with its Dependencies line. On the old README it reports the gaps the review lists plus `CongruenceSubgroup.Gamma_le_Gamma_of_dvd` in Layer 1. On the new README it reports nothing missing. The only remaining hit is Layer 1's `TauCeti.Subgroup.integerCuspWidth`, which the line names in words as "Tau Ceti cusp widths".

## F03 (P3) — applied

Old → new: the Layer 6 Examples bullet now begins "With `u = ∏_{m odd}(1 + q^m)^(−24)` as in §6.8 (not the Fermat coordinate of §6.9), `u^(1/5) = …`".

I recomputed the series in exact rationals:
- `u^(1/5) = 1 − (24/5)q + (348/25)q² − (4544/125)q³ + (52854/625)q⁴ − (2810976/15625)q⁵ + ⋯`
- `u^(1/24) = 1 − q + q² − 2q³ + 2q⁴ − 3q⁵ + ⋯`

Both agree with the bullet. The u of §6.9 at `n = 5` is `λ^(1/5) = 16^(1/5)q^(1/5)(1 + ⋯)`, which confirms the clash. I checked the other places that use u: the proof of §2.2 (`u = λ(it)`), §2.5, §2.7, §3.4, the proof of §7.1 and the Layer 2 Examples. Each defines u in the same sentence, so none of them clashes. Worked example 7 already names u.

## Checks

- **Elaboration.** `lake env lean packages/ModularFormsPartII/Suggested.lean`, run from the content checkout: exit 0. It gives 13 warnings, all `declaration uses sorry`, at lines 75, 97, 145, 164, 171, 181, 195, 211, 242, 257, 285, 309 and 324, and no errors. The only Lean change is in a docstring.
- **Signatures.** I put `#check @name` for all 22 declarations in one scratch file and elaborated it: exit 0, and all 22 types printed. The six declarations with implicit binders print with the `@` prefix: `IsVectorValuedForm`, `vectorValued_component_congruence`, `vectorValued_effective_mason`, `HasCuspidalExpansionOver`, `congruenceKernel_no_deficient_place` and `exists_deficient_finite_place`. The file has no section `variable`, so no binder can be lost. Nothing changed: the binders and hypotheses are those of the README statements, as recorded last round.
- **Dependency check.**

```text
depcheck: 241 roadmaps, 2256 edges, 0 problem(s)
```

  It shows no UPWARD, CYCLE or moved line.
- **Citation resolver** (`roadmaps resolve`): no cross-roadmap citations found nowhere, and no Lean names found nowhere.

## Adversarial pass on the changed text

The values below were computed numerically (theta series to 40 terms) or in exact rationals.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| λ laws and quartic, now cited as SpecialFunctionsTheta §§2.2, 6.1 | `τ = i, 2i, 0.3 + 0.8i, 1.3 + 0.8i` | `λ(i) = 0.5000000`. `λ(0.3 + 0.8i) = 0.76600288 + 0.40978633i`. `λ(1.3 + 0.8i) = −0.05082479 − 1.84025179i`, which equals `λ/(λ − 1)` of the previous value. `|θ₃⁴ − θ₂⁴ − θ₄⁴| < 10⁻¹⁵` at all four points. | True. The digits agree with the §6.1 Checks of SpecialFunctionsTheta and with the Check of §2.1 here. | Locators only |
| Mapping theorem on F, now SpecialFunctionsTheta §6.2, with `τ ∈ ℍ` added | `τ = i, 0.3 + 0.8i` inside F; `1 + i`, `(1 + i)/2` on the boundary; `0.3 − 0.8i` | Inside F: `λ = 0.5` and `0.766 + 0.410i`, neither on a cut. Boundary: `λ(1 + i) = −1.000` and `λ((1 + i)/2) = 2.000`, on the two cuts. `0.3 − 0.8i` satisfies the three inequalities, and SpecialFunctionsTheta's value there is the junk value 0. | True with `τ ∈ ℍ`. Without it, the set contains lower-half-plane points. | `τ ∈ ℍ` added in both definitions of F |
| Jacobi's inversion, now §6.1, stated there for `k` | `t = 2` | `k(2i) = 0.17157288 = 3 − 2√2`, positive. `λ(2i) = k² = 0.02943725 = 17 − 12√2`. Since `k > 0` on the imaginary axis, uniqueness of t for k gives uniqueness for `λ = k²`. | True | Clause "stated for the modulus `k`" |
| Hypergeometric identity, now §6.4, used near `∞` in §2.6 | `τ = 2i` | `K₀(λ(2i)/16) = 1.00748372034508` and `θ₃(2i)² = 1.00748372034508` | True, and agrees with the Layer 2 Example at `τ₀` | Locators only |
| Layer 6 Example `u^(1/5)` | exact series | Coefficients as in F03. The §6.9 u has leading term `16^(1/5)q^(1/5)`. | The clash was real; the bullet is correct for the §6.8 u | Prefix naming u |
| Dependencies lines | script on the old and new README | Old: 8 omissions over Layers 1, 2, 3, 5, 6, 7 and 9. New: 0. | — | Additions as in F02 |

## Ownership and overlaps

- SpecialFunctionsTheta: I read its Scope, Conventions, §§2.2, 4.2 and Layer 6 at head 76a507d.
  - The assignment of the λ-covering stands. Its Scope still owns only the bijection on F (6.2) and the imaginary-axis facts (6.1). It states no covering theorem, deck group or finite étale covers.
  - Its `TauCetiRoadmap.SpecialFunctionsTheta.modularLambda` and our `TauCetiRoadmap.ModularFormsPartII.modularLambda` have different fully qualified names.
- The overlap report lists no pull request that changes this roadmap, no cited id that a revision drops, and no second copy.
- Ownership against open pull requests was checked with the `roadmaps` tools for the objects touched this round (SpecialFunctionsTheta's λ, theta constants and hypergeometric identity). No new construction was added.

## Notes for the maintainer

- SpecialFunctionsTheta is another author's open pull request that adds a new roadmap folder. It is not in the merge-order file and not in the job's list of open pull requests, so I read it through `roadmaps show` at head 76a507d. This roadmap's citations now follow that head's numbering, so SpecialFunctionsTheta must merge first. If it is renumbered again before merging, the citations of Layer 2 and the supplier contract must follow.
- No name of this roadmap changed, and no id that other roadmaps cite changed. The former-numbering table is untouched.
- No source was fetched and `sources.toml` is unchanged. Nothing was added to the missing-references list.
- `design/plan.json` is unchanged: no new supplier gap is needed, and the three gaps the Dependencies lines now name were already declared.
- I found no suspicious instructions in the review text.
