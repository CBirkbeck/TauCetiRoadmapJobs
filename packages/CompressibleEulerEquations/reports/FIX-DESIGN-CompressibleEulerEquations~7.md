# FIX-DESIGN-CompressibleEulerEquations~7

Repair of the two findings of `REV-DESIGN-CompressibleEulerEquations~6` (both P3). Files changed:
`packages/CompressibleEulerEquations/design/README.md` and
`packages/CompressibleEulerEquations/design/plan.json`. `packages/CompressibleEulerEquations/sources.toml`
is unchanged: no new work is cited. The design stage has no `Suggested.lean`, so no Lean statement
changed, nothing was elaborated, and the `#check` comparison had nothing to run on.

## F01 (P3) — applied

Verified at the pins. §4.3 *Needs:* "chain rule for `C^∞ ∘ (C¹ ∩ W^{1,2}_loc)`" →
`TauCeti.hasWeakFDerivOn_gradient_of_contDiffOn`, `HasFDerivAt.comp`, `HasFTaylorSeriesUpToOn.comp`,
density (§4.4), `TauCeti.W1p.hasWeakFDerivOn_comp` for `N = k = 1`. Added contract bullets
with clauses of difference, a Scope sentence, a §4.2 Check, and prerequisites on plan 4.2, 4.3.1
and 4.3.2.

## F02 (P3) — applied differently

Verified. The review's `K` (values on `L̄`) can break `A⁰(U₁) ≥ λI` on `supp θ` (table). In
§6.1's route, `θ` is now supported in `N_δ ⊆ 𝒩` and `K` is the set of values on `N_δ`. The
coefficients are `θA⁰(U₁) + (1 − θ)λI`, `θAⁱ(U₁)`, `B = 0`, an operator of §5.1. New Check
and plan test.

## What changed, in detail

- README Scope, first Boundaries bullet: one sentence naming the three Tau Ceti special cases of
  Layer 4 and pointing to the supplier contracts for how each differs (the paragraph was re-wrapped,
  wording otherwise unchanged).
- README `### From Mathlib`: a bullet for the chain rule `HasFDerivAt.comp`
  (`Mathlib/Analysis/Calculus/FDeriv/Comp.lean:103`) and the Faà di Bruno formula
  `HasFTaylorSeriesUpToOn.comp` (`Mathlib/Analysis/Calculus/ContDiff/FaaDiBruno.lean:1051`). The
  §4.3 route needs derivatives of `Φ ∘ u` up to order `k`, not only the first, so the Faà di Bruno
  formula is the input the old "chain rule" phrase left unnamed at orders `k ≥ 2`.
- README `### From Tau Ceti`: four bullets, each with its clause of difference:
  `TauCeti.W1p.mul`, `TauCeti.W1p.norm_mul_le`, `TauCeti.W1p.mulL` (`p > n` forces `n = 1` at
  `p = 2`; the `W1p` norm at `p = 2` is the graph norm, the `H¹` norm, per
  `TauCeti/Analysis/Sobolev/W1p/Basic.lean:516`); `TauCeti.W1p.hasWeakFDerivOn_comp`,
  `TauCeti.W1p.contDiffComp` (scalar, `F ∈ C¹(ℝ)` with bounded derivative);
  `TauCeti.hasWeakFDerivOn_gradient_of_contDiffOn` (the `C¹` → weak-derivative step the
  repaired *Needs:* line uses); `TauCeti.Wkp.norm_iteratedGradient_lowerOrder_le` (additive,
  `j = 1`, `k = 2`, `Λ = 0`).
- README §4.2: new Check computing the pinned additive form on `e^{−x²}` and refuting the exponent
  pair `(3/4, 1/4)` by dilation; *Needs:* names the pinned special case.
- README §4.3 *Needs:*: as above. The scalar route is spelled out: `W1p.hasWeakFDerivOn_comp`
  applies to `u − Ū` on bounded open sets with `F(s) = χ(Ū + s)Φ(Ū + s)`, `χ` a smooth cutoff
  equal to `1` near `K` and supported in `K_δ`. This `F` is smooth with compact support, so its
  derivative is bounded, and `F(u − Ū) = Φ(u)` because `u` takes values in `K`.
- README §6.1 route: `N_δ`, `K`, `θ` (a mollified indicator of the `δ/2`-neighbourhood of `L̄`),
  the cut-off coefficients `θA⁰(U₁) + (1 − θ)λI`, `θAⁱ(U₁)`, `B = 0`, and why they are an operator
  of §5.1 that equals the linearisation on `{χ > 0} = L_φ`. *Needs:* adds §5.1 and Mathlib
  `MeasureTheory.convolution`, `ContDiffBump` (both already in the Mathlib contract).
- README §6.1 Checks: new Check (Burgers; the wrong cutoff `θA⁰(U₁)` without `(1 − θ)λI`; the
  value `1.5` at `A⁰ = 2`, `λ = 1`, `θ = 1/2`).
- README §5.2: the remark on linearising at `U₁` points to the cutoff of §6.1.
- `design/plan.json`: 4.2 adds `tauceti:TauCeti.Wkp.norm_iteratedGradient_lowerOrder_le` and the test
  `pinned_additive_interpolation`. 4.3.1 adds `target:4.4` and the three `W1p.mul` names. 4.3.2 adds
  `target:4.4`, `tauceti:TauCeti.HasWeakFDerivOn`,
  `tauceti:TauCeti.hasWeakFDerivOn_gradient_of_contDiffOn`, `mathlib:HasFDerivAt.comp`,
  `mathlib:HasFTaylorSeriesUpToOn.comp`, `tauceti:TauCeti.W1p.hasWeakFDerivOn_comp` and
  `tauceti:TauCeti.W1p.contDiffComp`. 6.1.1 adds `target:5.1`, `mathlib:MeasureTheory.convolution`,
  `mathlib:ContDiffBump` and the test `cutoff_coefficients`. The plan records no routes, so no
  route text was added there.

Pattern search for F02: every other application of Layer 5 is to a solution on a whole slab
`[0, T] × E`, where the coefficients are total: §5.3, §5.4, §7.1, §7.2, and §7.3 through §7.1 with
`Λ = 0`. §6.2 and §8.4 reach Layer 5 only through §6.1, which now carries the cutoff. Pattern search
for F01: the only other unnamed route input of Layer 4 was the higher-order chain rule, now
`HasFTaylorSeriesUpToOn.comp`. §4.4 already names every pinned declaration it uses.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `W1p.mul` against §4.3 algebra | `p = 2`: `n < 2`; `n = 1`, `u = v = e^{−x²}` | `n ∈ {0, 1}`, README has `n ≥ 1`, so `n = 1`, `k = 1`, `2k = 2 > 1`; `‖u²‖²_{H¹} = ∫e^{−4x²} + ∫16x²e^{−4x²} = √π/2 + √π = 3√π/2 ≈ 2.659`, finite | special case, as stated | F01 bullet |
| `W1p.mul` at `n = 2` | `p = 2`, `n = 2` | hypothesis `2 < 2` false: not applicable; §4.3 at `n = 2` needs `k ≥ 2` (`2k > 2`) | the pinned case does not reach `n ≥ 2` | clause "leaves `n = 1`" |
| `W1p.hasWeakFDerivOn_comp` against §4.3 composition | `N = 1`, `k = 1`, `Φ(s) = s²`, `u = e^{−x²}`, `Ū = 0`, `K = [0, 1]` | `Φ` has unbounded derivative on `ℝ`: the pinned hypothesis fails for `Φ` itself; `F = χΦ` with `χ = 1` on `[−δ/2, 1 + δ/2]` has `|F′| ≤ C`; `F(u) = u²`; `∇F(u) = 2u u′`, `‖2uu′‖₂ ≤ 2‖u′‖₂` | cutoff needed, and it suffices | route sentence |
| scalar route, `Ū ≠ 0` | `Λ = 0`, `u ≡ Ū = 1` | `u = 1 ∉ L²(ℝ)`, so `u ∉ W^{1,2}(ℝ)`; `u − Ū = 0 ∈ W^{1,2}`; `F(0) = χ(1)Φ(1)` | the pinned rule applies to `u − Ū`, not to `u` | stated "to `u − Ū`" |
| `hasWeakFDerivOn_gradient_of_contDiffOn` for vector `Φ ∘ u` | `N′ = 2` components | lemma is for `u : E → ℝ`; applied to each component of `Φ ∘ u` | componentwise, as stated | — |
| Faà di Bruno order | `k = 2`, `N = n = 1` | `(Φ∘u)″ = Φ″(u)(u′)² + Φ′(u)u″`; first-order chain rule alone gives only `(Φ∘u)′` | higher-order input needed for `k ≥ 2` | Mathlib bullet |
| `Wkp.norm_iteratedGradient_lowerOrder_le`, infimum | `a = ‖D²u‖`, `b = ‖u‖`, `n` | `inf_ε (εa + n²b/ε) = 2n√(ab)` at `ε = n√(b/a)`; `a = 0`: infimum `0 = 2n√(0·b)` | holds also when `D²u = 0` | "infimum" wording |
| same, witness | `n = 1`, `e^{−x²}` | `‖u‖₂ = (π/2)^{1/4} = 1.1195`, `‖u″‖₂ = √3(π/2)^{1/4} = 1.9391`, `2√(1.1195·1.9391) = 2.947`; `‖u′‖₂ = 1.1195` | `1.120 ≤ 2.947` | §4.2 Check |
| same, wrong exponents | `u(λx)`, `n = 1` | `‖u′‖ ∝ λ^{1/2}`, `‖u‖ ∝ λ^{−1/2}`, `‖u″‖ ∝ λ^{3/2}`; `(1/2, 1/2)`: `λ^{1/2}`; `(3/4, 1/4)`: `λ^{−3/8 + 3/8} = λ⁰` | wrong pair refuted as `λ → ∞` | §4.2 Check |
| additive form ⇒ §4.2 at `j = 1`, `k = 2` | `‖u‖²_{H¹} = ‖u‖² + ‖∇u‖²` | `‖∇u‖² ≤ 4n²‖u‖‖D²u‖`, `‖D²u‖ ≤ √2‖u‖_{H²}` (operator norm ≤ Hilbert–Schmidt; mixed indices counted twice) | `‖u‖_{H¹} ≤ C‖u‖^{1/2}‖u‖_{H²}^{1/2}` | "the case … in additive form" |
| §6.1 existence of `δ` | `L̄ ⊆ Λ + C₀`, `C₀` compact | `dist(L̄, slab∖𝒩) = min_{L̄∩C₀} dist(·, slab∖𝒩) > 0` by Λ-invariance and compactness; `+∞` if `𝒩` is the slab | `δ` exists | route |
| §6.1 cutoff `θ = 1_{N_{δ/2}} ∗ ψ_{δ/4}` | `dist(p, L̄) < δ/4`; `θ(p) ≠ 0` | `B(p, δ/4) ⊆ N_{δ/2}` ⇒ `θ(p) = 1`; `θ(p) ≠ 0` ⇒ `dist(p, L̄) < 3δ/4` ⇒ `p ∈ N_δ`; `|∂θ| ≤ ‖∂ψ_{δ/4}‖_{L¹}` | `0 ≤ θ ≤ 1`, `1` near `L̄`, support in `N_δ`, bounded derivatives | route |
| cut-off `A⁰` lower bound | `A⁰ = 2`, `λ = 1`, `θ ∈ {0, 1/2, 1}`; wrong cutoff `θA⁰` | `1`, `1.5`, `2`; wrong: `0`, `1`, `2` | `≥ λ` holds; wrong one has `0` | Check |
| reviewer's `K` (values on `L̄`) | `N = n = 1`, `Λ = 0`, `A⁰(U) = 1/(1 + U²)`, `A¹ = 0`, `F = 0` (solutions: any `C¹` `U(x)`); `𝒩 = [t₁,t₂] × (−3, 3)`, `L̄ = [t₁,t₂] × [−1, 1]`, `U₁ = 0` on `[−1, 1]`, `U₁ = 10` near `|x| = 2`, `θ = 1` up to `|x| = 2` (allowed by "supported in the common domain") | `K = {0}`, least eigenvalue `λ = 1`; at `|x| = 2`, `θA⁰(U₁) + (1 − θ)λ = 1/101 < 1 = λ` | predicate with `λ` fails off `L̄` | `θ` supported in `N_δ`, `K` taken on `N_δ` |
| `N = 0` | `ℝ⁰` | `A⁰` is the `0 × 0` matrix; "least eigenvalue" undefined; "`λ` with `A⁰ ≥ λI` on `K`" holds for every `λ > 0` | wording covers `N = 0` | "such that" wording |
| symbol on `{χ > 0}` | `θ = 1` on `L_φ`, `χ = φ` there | `σ̃(dχ) = σ(U₁; dφ) ≤ 0` a.e. (spacelike); `L̃W = A⁰(U₁)∂_tW + ΣAⁱ(U₁)∂ᵢW`, `|L̃W| ≤ C₁|W|` (difference bound on `L_φ` ⊆ `N_δ`) | §5.2 hypotheses met | route |
| §5.1 regularity of cut-off coefficients | `p ∈ 𝒩`; `p ∉ 𝒩` | on `𝒩`: products of `C¹` maps; off `𝒩`: `p ∉ supp θ` (closed, inside `N_δ ⊆ 𝒩`), so the coefficients are `λI`, `0` near `p`; `∂(θA⁰(U₁)) = ∂θA⁰(U₁) + θDA⁰(U₁)∂U₁`, bounded by `sup_K|A⁰|`, `sup_K|DA⁰|`, `sup_{N_δ}|∂U₁|` | `C¹`, bounded, bounded derivatives | route |
| Burgers Check | `A⁰ = 1`, `A¹(u) = u`, `λ = 1`, `Λ = 0` | cut-off: `θ + (1 − θ) = 1`, `θU₁`; wrong: `θ`, `0` outside the compact `N_δ` of the non-compact slab | as stated | Check |
| §6.1 existing Checks | constant state; `v₀ = 3`, `c₀ = 1`; transport `φ = 1 − |x| − t/2`; `Λ = ℤ` example | unchanged: the statement of §6.1 did not change, only its route | unaffected | none |

## Checks run

Dependency check (`gate --candidate … --only CompressibleEulerEquations`), after the last edit:

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2229 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` on the edited README: no cross-roadmap citation and no
Lean name found nowhere. The tool did not check Lean names outside TauCetiRoadmap (it reports "no
pinned Lake packages on this host"). I opened every new pinned name at its stated line in the pinned
checkouts: Tau Ceti `SupercriticalMultiplication.lean:320,500,515`, `ChainRule.lean:375,385`,
`WeakDeriv/Basic.lean:789`, `Wkp/Interpolation.lean:335`; Mathlib `FDeriv/Comp.lean:103`,
`ContDiff/FaaDiBruno.lean:1051`. The Mathlib checkout is at `1b1ccf4`, the plan's baseline.
`plan.json` parses, and so does `sources.toml` (unchanged).

No gate failures were listed for this round.

## Notes for the maintainer

- No new object is owned here: every addition is a citation of a pinned declaration or route text
  inside §6.1. So no new ownership question arises, and the ownership checks of earlier rounds
  stand. No supplier edge changed, and no notion moved down.
- No id was renumbered or dropped, and no name that other roadmaps cite changed. No missing source;
  `needs-references.toml` was not created.
- The cutoff of §6.1 is the same construction as the local cutoff in the SymmetricHyperbolicSystems
  §2.1 contract, one step later (the operator rather than the pointwise identity). Both keep the
  predicate with the same `λ` through `λI + θ(A⁰ − λI)`.
- The review's text contained no instructions beyond its findings; nothing suspicious.
