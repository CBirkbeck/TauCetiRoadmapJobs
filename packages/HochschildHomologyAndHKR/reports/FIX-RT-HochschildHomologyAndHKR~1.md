# FIX-RT-HochschildHomologyAndHKR~1

This round settles the two red-team passes `RT-HochschildHomologyAndHKR~1a` (four findings) and
`RT-HochschildHomologyAndHKR~1b` (five findings). No two findings overlap, so each is settled once
below. Neither review's "For the human reviewers" section lists a finding. Nothing was changed
because of those sections, or because of the "Source issues" (Ginz05 errata).

## RT-HochschildHomologyAndHKR~1a/F01 (P2) — applied

Changed: §6.2's route "transport DGAInfinity Layer 0's brace relation" → Gerstenhaber's direct
computation (§§1.2, 5.1); the pinned Leibniz rule becomes a comparison. §6.2 *Needs:* drop
DGAInfinity Layers 0/8. The DGAInfinity contract no longer assumes a brace relation. Summary, Scope,
"How to read the build", §6.1 and Layer 6 Dependencies follow.

Verified: on main, `TauCetiRoadmap/DGAInfinity/README.md` Layer 0 (lines 269–271) lists only
"substitution/brace operations" with their Koszul sign, and Layer 8 (lines 522–524) lists "cup
product, braces". Neither states the relation `(F{G}){H} − F{G{H}} = F{G,H} + ±F{H,G}`, and the pin
has no multiple brace. So the old route used an input that no supplier states. Ginz05 (6.6.3),
line 1368, quotes the identity without proof. The direct proof needs no brace calculus, which makes
it the cheaper repair and removes the edge. A gap was therefore not declared.

How the cancellation works. In `δ(f∘g)`, `f∘δg` and `δf∘g`:

- An inner product inside the arguments of `g` cancels against an inner term of `δg`.
- An inner product outside them cancels against an inner term of `δf`.
- A product of `g(…)` with a neighbour cancels against an outer term of `δg`.
- The outer terms of `δf∘g` cancel against those of `δ(f∘g)`, except when `g` fills the first or
  the last slot of `δf`. Those two terms are `g ∪ f` and `f ∪ g`.

I checked this against the existing Checks at `(p,q) = (1,1), (1,0), (2,0), (0,1)`. At `p = 0`,
`g` fills the only slot, both outer terms survive, and both sides are `a ↦ g(a)x − xg(a)`.

## RT-HochschildHomologyAndHKR~1a/F02 (P3) — applied

Changed: §5.3 "with `s(p,0) = 1`" → "with `s(p,0) = 1` and `s(0,q) = 1`": a degree-zero `extMk` is
`Ext.mk₀` of the induced map, so the unsigned `extMk_comp_mk₀` and `mk₀_comp_extMk` give both
values. New §5.4 Check at `p = 0`: `f̃_i(a₀ ⊗ ⋯) = a₀x ⊗ ⋯` and
`θ_q[x ∪ g] = Ext.comp (mk₀ (· x)) (θ_q[g])`.

Verified at the pin: `Mathlib/CategoryTheory/Abelian/Projective/Ext.lean:255`
(`mk₀_comp_extMk`) is `(Ext.mk₀ g).comp (R.extMk f …) = R'.extMk (φ.hom.f n ≫ f)` for
`φ : Hom R' R g`, with no sign.

- **The lift.** `f̃` is `Aᵉ`-linear. It commutes with `b′` and with the augmentation exactly because
  `x` is central: `a₀xa₁ = a₀a₁x`.
- **The composite.** `f̃_q` followed by `g` sends `1 ⊗ a ⊗ 1` to `x g(a) = (x ∪ g)(a)`.
- **Consistency.** `(−1)^{0·q} = 1`, so this agrees with §5.4. The existing (0,0) Check already
  uses `θ₀[x] = mk₀(· x)`.

The module docstring of `Suggested.lean` now says that `s(p,q)` has no closed form at the pins for
`p, q ≥ 1`.

## RT-HochschildHomologyAndHKR~1a/F03 (P3) — applied

Changed: "No roadmap later in the merge order imports this one. The roadmaps … are earlier and
import DGAInfinity Layer 8 directly" → "No other roadmap imports this one. The roadmaps … import
DGAInfinity Layer 8 directly". Same section: "A later roadmap on Gerstenhaber algebras … would
build on Layers 6–8" → "… lie outside this roadmap".

Verified: `roadmaps grep 'HochschildHomologyAndHKR'` finds no match on main or at any open head, so
the new sentence is true. No other "merge order", "earlier" or "later" wording about the pipeline
remains in the README or `Suggested.lean`.

## RT-HochschildHomologyAndHKR~1a/F04 (P3) — applied

Changed: §8.1 "`t_i = X_i ⊗ 1 − 1 ⊗ X_i` of `Rᵉ = R ⊗[k] R`" → "`… − 1 ⊗ op X_i` of
`Rᵉ = R ⊗[k] Rᵐᵒᵖ`"; its route first maps `Rᵉ ≅ R ⊗[k] R` (`Algebra.TensorProduct.congr`,
`AlgEquiv.toOpposite`), both added to *Needs:* and "From Mathlib". Conventions fix the
identification; the §4.1 Check and "Regular sequences" line follow.

Verified at the pin:

- `AlgEquiv.toOpposite` is `A ≃ₐ[R] Aᵐᵒᵖ` for commutative `A`
  (`Mathlib/Algebra/Algebra/Opposite.lean:200`).
- `Algebra.TensorProduct.congr` is at `Mathlib/RingTheory/TensorProduct/Maps.lean:613`.
- `R ⊗[k] Rᵐᵒᵖ` is a `CommRing` (an `inferInstance` example elaborates), so §8.2's Koszul complex
  over a commutative ring applies to `Rᵉ` directly.

The other uses of `R ⊗ R` for `Rᵉ` (§8.1–8.3 Checks, §4.5 Checks) are read through the new
convention.

## RT-HochschildHomologyAndHKR~1b/F01 (P2) — applied differently

Changed: `Suggested.lean` gains `/-! ## Layer 2: Normalisation -/` with
`exists_homotopyEquiv_normalizedHochschildCochainComplexι` (import
`TauCeti.RingTheory.CyclicCohomology.Normalized.Basic`). It states `∃ e : HomotopyEquiv
(normalizedHochschildCochainComplex k A N) (hochschildCochainComplex k A N), e.hom =
normalizedHochschildCochainComplexι k A N`. The module docstring, §2.2 (bullet and Check), the Tau
Ceti contract and "Variants kept here" now name it.

Why the repair differs. The review proposed `QuasiIso (…ι)`. §2.2 proves more: that the inclusion is
a homotopy equivalence over every `k`. Stating only the quasi-isomorphism would be the weakened
substitute that `Suggested.lean` must avoid, so I stated the homotopy-equivalence form.

Verified:

- **The pin.** `TauCeti/RingTheory/CyclicCohomology/Normalized/Basic.lean:300` defines the
  inclusion. Its docstring and every use in Tau Ceti show no homotopy-equivalence or
  quasi-isomorphism result for it.
- **What still cannot be stated.** The pin has no unnormalised Hochschild chain complex, so the
  docstring keeps "not statable" for chains and for cochains with arbitrary bimodule coefficients.
- **Instances.** For `A = N = k`, the pinned full complex is `k` in every degree with differentials
  `0, 1, 0, 1, …`; the normalised complex is `k` in degree 0 and 0 above; the homotopy uses
  `h^{2j} = 1`. For `k = 0` and for `A = 0`, both complexes are 0.
- **Ownership.** No roadmap on main or at an open head plans this comparison over a general `k`.
  NoncommutativeGeometry N1.Cyclic keeps the case `k = N = ℂ` on cohomology, already recorded under
  "Variants kept here".

## RT-HochschildHomologyAndHKR~1b/F02 (P3) — applied

Changed: the `hochschildBimoduleCohomology` docstring "the cohomology … of the Hochschild cochain
complex" → "the quotient of `Zⁿ` by `Bⁿ ∩ Zⁿ`; the cohomology of the complex under
`SMulCommClass A Aᵐᵒᵖ M`". The `hochschildBimoduleCocycles` docstring, §1.2 and "The carriers of
`Suggested.lean`" say the same; a new §1.2 Check is the negative control.

Verified: take `A = M = Mat₂(ℤ)` with `op b • m = bᵀm`, a left `Aᵐᵒᵖ`-module since
`(cb)ᵀ = bᵀcᵀ`. Then `δ(δm)(a,b) = (bᵀa − abᵀ)m`. At `a = b = E₁₂`, `m = 1` this is
`E₂₂ − E₁₁ ≠ 0`. Every theorem has `SMulCommClass` in scope or takes `M = A`, so no statement
changes.

## RT-HochschildHomologyAndHKR~1b/F03 (P3) — applied

Changed: `cohomological_hkr` docstring "…; Weibel, …, Theorem 9.4.7" → "…; the homological form
over a field is Weibel, …, Theorem 9.4.7". Pattern: the `cohomological_hkr_hom_kaehler` docstring
calls Loday 3.4.4 "the homological form, which this dualises"; README §7.6 groups Loday98 3.4.4,
Weibel94 9.4.7 and AV20 Proposition 1.2 as the homological form.

Verified: AV20 line 70–71 (Proposition 1.2) is the homological, derived statement. Ginz05
line 2086–2088 states both forms. HKR62 line 548–557 (Theorem 5.2) states `Ext ≅ E(T_R)`. Weibel94
and Loday98 are uncertified, so their content is taken from their standard locators, not read.

## RT-HochschildHomologyAndHKR~1b/F04 (P3) — applied

Changed: `detCochain` docstring "(README §7.5; Ginzburg, §9.2)" → "`D₁ ∪ ⋯ ∪ Dₙ` evaluated on the
alternation … of Ginzburg, §9.2". README §7.5 "(Ginz05 §9.2, lines 2101–2156; …)" → cup product
composed with Ginz05's alternation map, line 2142; HKR62 for alternating forms; AV20 for `n!`.
§8.5's citation is restated likewise; a §7.5 Check gains the alternation value.

Verified: Ginz05 lines 2101–2166 display only `alt` (line 2142) and `π` (line 2154); no determinant
of derivations occurs there. The identity behind the new wording: `det(D_j(r_i)) = Σ_σ sgn σ Π_j
D_j(r_{σ(j)}) = (D₁ ∪ ⋯ ∪ D_n)(alt(r₁ ⊗ ⋯ ⊗ r_n))`. On `k[x,y]` this gives `1 − 0 = 1` at `(x,y)`
and `0 − 1 = −1` at `(y,x)`. The other Ginz05 §9.2 citations (§6.4 and §8.3, for the alternation
and the projection) are correct and unchanged.

## RT-HochschildHomologyAndHKR~1b/F05 (P3) — applied

Changed: §5.2 gains three **Checks**: `A = k` (`HH^• = k`, product of `k`); `R = k[x]`
(`HH¹ = R[∂]`, `HH^{≥2} = 0`, `[p] ∪ [∂] = [p∂]`, `[∂] ∪ [∂] = 0` although `(∂ ∪ ∂)(x,x) = 1`);
central `x` gives `x ∪ δm = δ(xm)`, while non-central `E₁₁` on `Mat₂(k)` gives
`(δx ∪ δm)(E₂₁,E₁₁) = E₂₂ ≠ 0`.

Verified: `E₂₁E₁₁ − E₁₁E₂₁ = E₂₁`, `E₁₁E₁₂ − E₁₂E₁₁ = E₁₂`, `E₂₁E₁₂ = E₂₂`. For central `x`,
`x(am − ma) = a(xm) − (xm)a`. The `k[x]` values come from §3.3 (no inner derivations on a
commutative algebra) and §8.4 with `m = 1`.

## Checks run

- **Elaboration.** `lake env lean packages/HochschildHomologyAndHKR/Suggested.lean` (from the content
  checkout) exits 0. Output: 8 warnings `declaration uses 'sorry'` (the 7 existing theorems plus
  `exists_homotopyEquiv_normalizedHochschildCochainComplexι`), no error. The imported Tau Ceti
  modules already had object files, so nothing was built.
- **Signatures.** I put `#check @name` for all 14 declarations into one scratch file and elaborated
  it once. The 13 existing declarations have the same elaborated types as in the worker's signature
  file; only docstrings changed. The new theorem carries every binder in its own signature (`k A N`,
  `CommRing k`, `Ring A`, `Algebra k A`, `AddCommGroup N`, `Module k N`). `IsScalarTower k A A` and
  `SMulCommClass k A A` are found by instance search, and there are no section variables. It agrees
  with the §2.2 bullet.
- **Library names.** A second scratch file checks the newly cited names: `AlgEquiv.toOpposite`,
  `Algebra.TensorProduct.congr`, `mk₀_comp_extMk`, `extMk_comp_mk₀`,
  `TauCeti.normalizedHochschildCochainComplexι`, `TauCeti.hochschildCochainComplex`,
  `HomotopyEquiv`, plus the `CommRing (R ⊗[k] Rᵐᵒᵖ)` instance. All elaborate. The two
  `TauCeti.AInfinityAlgebra.hochschildDifferential_*` lemmas kept in §6.2 were read at
  `TauCeti/Algebra/Homology/AInfinity/Algebra/Hochschild/Basic.lean:86` and `:166`.
- **Dependency check output:**

      depcheck: 250 roadmaps, 2367 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **Citation resolver** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean
  name found nowhere. The resolver did not check names outside TauCetiRoadmap on this host; those
  were checked by the `#check` file above.

## Adversarial pass on the statements added or changed

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `exists_homotopyEquiv_normalizedHochschildCochainComplexι` | `A = N = k`; `k = 0`; `A = 0`; `A = k[x]`, `N = k`; slot-0 variant | `d = Σ_{i=0}^{n+1}(−1)^i = 0,1,0,1,…`, `H⁰ = k` both sides, `h^{2j} = 1`; `0 = 0`; multilinear maps on `0` vanish; `φ(a₀,a₁) = (a₀∂a₁)(0)` normalised, `bφ = 0`, class `≠ 0` on both sides; variant gives normalised complex `0` and loses `H⁰ = k` | holds; variant excluded (new §2.2 Check) |
| `hochschildBimoduleCohomology` docstring | bimodule; transposed `Aᵐᵒᵖ`-action on `Mat₂(ℤ)` | `B ⊆ Z` by `δδ = 0`; `δδ1(E₁₂,E₁₂) = E₂₂ − E₁₁` | holds; negative control added |
| §5.3 `s(0,q) = 1` | `p = 0`, `x` central; `q = 0` | `f̃_q ≫ g̃(1⊗a⊗1) = x g(a)`; `(−1)^{0}` = 1; `f̃₀ ≫ g = f ≫ ḡ` | holds; `(−1)^q` excluded by `mk₀_comp_extMk` |
| §5.2 Checks | `k`; `k[x]`; `Mat₂(k)`, `x = E₁₁`, `m = E₁₂` | `HH^• = k`; `[p]∪[∂] = [p∂]`, `[∂]∪[∂] ∈ HH² = 0`, `(∂∪∂)(x,x) = 1`; `E₂₂ ≠ 0` | holds |
| §6.2 direct route | `(1,1)`, `(1,0)`, `(2,0)`, `(0,1)`; `p = 0` slot count | `f∘δg + δf∘g − δ(f∘g) = f∪g + g∪f`; `y f(a) − f(a) y`; `g(a)x − xg(a)`, at `Mat₂(ℤ)`, `E₁₁`, `E₁₂`: `−E₁₂` | holds |
| §4.1 Check (`Rᵉ ≅ R ⊗ R`) | commutative `R`; `Mat₂(k)` | `μ((a⊗op b)(r⊗op s)) = arsb = a(rs)b`; `op(E₁₂E₂₁) = op E₁₁ ≠ op E₂₂ = op E₁₂·op E₂₁` | holds |
| §8.1 (`t_i ∈ R ⊗[k] Rᵐᵒᵖ`) | `m = 0`; `m = 1`; `k[x]/(x²)` | `Rᵉ ≅ k`, empty sequence; `t ↦ X − Y`, nonzerodivisor in `k[X,Y]`; `t(x⊗1 + 1⊗x) = 0` | holds; Checks unchanged |
| §7.5 / `detCochain` citation | `k[x,y]`, `(x,y)`, `(y,x)` | `(∂_x∪∂_y)(x⊗y − y⊗x) = 1`, `(∂_x∪∂_y)(y⊗x − x⊗y) = −1`; `det I₂ = 1` | holds |

## For the maintainer

- **Name changes.** No name another roadmap cites changed; no roadmap cites this one. The one new
  Lean name is `exists_homotopyEquiv_normalizedHochschildCochainComplexι` in namespace
  `TauCetiRoadmap.HochschildHomologyAndHKR`. No roadmap I can read declares a statement of that name.
- **Suppliers.** No new supplier, no new gap, no change to `design/plan.json`, `sources.toml` or
  `metadata.toml`.
- **DGAInfinity dependency.** The edge to DGAInfinity Layer 0 is now used only by §6.1's comparison
  clauses, which no later section consumes.
- **Uncertified sources.** The new wording for Weibel94 Theorem 9.4.7 ("the homological form over a
  field") and Loday98 Theorem 3.4.4 ("the homological form") rests on the standard description of
  those theorems, not on a reading of the texts.
- **Ownership against open work.** I checked the new statement against the open pull requests listed
  in the brief, using the `roadmaps grep` tool on their heads and on main. No second owner.
