# Repair report: HochschildHomologyAndHKR, design round 6

Review resolved: `REV-DESIGN-HochschildHomologyAndHKR~5`, with three findings, F01–F03, all P3.
Files edited:

- `packages/HochschildHomologyAndHKR/design/README.md`
- `packages/HochschildHomologyAndHKR/design/plan.json`
- `packages/HochschildHomologyAndHKR/sources.toml` (one locator: the Ginz05 entry now records its
  front-matter "Basic notation", p. 2)

No new work is cited and no `needs-references.toml` was written. There is no `Suggested.lean` at
the design stage, so nothing was elaborated and there was no `#check` binder audit to run.

Every library claim was checked at the pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`
and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

## REV-DESIGN-HochschildHomologyAndHKR~5/F01 (P3) — applied

Change: in the §7.6 Check, "the theorem is Ginz05 Theorem 9.1.3 and, for `k` perfect, HKR62
Theorem 5.2" becomes "HKR62 Theorem 5.2 when `k` is perfect, Ginz05 Theorem 9.1.3 when `k` is
algebraically closed of characteristic zero". The Check now names `𝔽₂[x,y]` (only HKR62 applies)
and `ℂ` (both apply). Plan 7.6 test `hkr_field` is changed the same way.

Evidence:

- Ginz05 lines 96–97 fix an algebraically closed ground field of characteristic zero for the
  whole text.
- Theorem 9.1.3 (line 2086) is stated for a smooth affine variety over that field.
- HKR62 Theorem 5.2 (line 548) assumes a regular affine algebra over a perfect field.
- `𝔽₂` is perfect and `𝔽₂[x,y]` is regular affine, so HKR62 Theorem 5.2 applies to it. Ginz05 does
  not, because its field has characteristic zero.

The same pattern elsewhere: each place that credits Ginz05 with a wider setting than its own now
states the setting.

- **§7.6 locator list:** "Ginz05 Theorem 9.1.3, line 2086" gains "over an algebraically closed
  field of characteristic zero".
- **§2.1 and §2.2 locators:** "over a field" becomes "over an algebraically closed field of
  characteristic zero". Plan 2.1 and 2.2 `where` are changed to match.
- **§8.4 locator:** "Ginz05 Lemma 9.3.1 … for a regular sequence in a commutative `k`-algebra" used
  the README's `k`, which is an arbitrary ring. It now reads "… in a commutative algebra over an
  algebraically closed field of characteristic zero".
- **References, Ginz05 entry:** now records the standing ground field (lines 96–97).
- **`sources.toml`:** the Ginz05 `locator` adds "Basic notation (p. 2)".

No statement changed.

## REV-DESIGN-HochschildHomologyAndHKR~5/F02 (P3) — applied

Change: §8.2 "`K_j` free of rank `C(m,j)`" → "free, with basis the wedges `e_I` over the
`j`-element subsets `I`"; its Needs gains `exteriorPower.instFree` and `Module.Basis.exteriorPower`,
plus a fourth Check (`m = 2`, `k = 0`). §7.5 Needs gains `exteriorPower.alternatingMapLinearEquiv`;
the Mathlib contract gains `Module.Basis.exteriorPower`; plan 7.5 and 8.2 match.

Evidence at the Mathlib pin:

- `Mathlib/LinearAlgebra/ExteriorPower/Basis.lean:95`: `Module.Basis.exteriorPower`, the basis
  indexed by `powersetCard I n` for a linearly ordered `I`, with no nontriviality hypothesis.
- `:162`: `exteriorPower.instFree`.
- `:174`: `exteriorPower.finrank_eq`, which assumes `[Nontrivial R]`.
- `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:212`: `exteriorPower.alternatingMapLinearEquiv`.

The old wording was false over `k = 0`, not merely undefined there. `Mathlib/LinearAlgebra/Dimension/Basic.lean:168`
(`rank_subsingleton`) gives rank `1` over the zero ring, whereas `C(2,1) = 2`. The new Check
records this.

The same pattern elsewhere. I checked every target that builds a map out of, or a basis of, an
exterior power against its Needs line.

- **§6.4:** gains `exteriorPower.alternatingMapLinearEquiv` with
  `KaehlerDifferential.linearMapEquivDerivation`, which define `ε^cl_n` on `Ω^n`. It also gains
  `exteriorPower.ιMulti` and `KaehlerDifferential.D`, which give the values of `π^cl_n`.
- **§8.3:** gains `Module.Basis.exteriorPower` and `Module.Basis.constr`, since `ι_j` is defined on
  the basis wedges.
- **§8.4:** gains `KaehlerDifferential.mvPolynomialBasis` and `Module.Basis.exteriorPower`. These
  give the basis `dX_I` of `Ω^n`, which "`ε^cl_n` is an isomorphism" needs.
- **Contract and Dependencies:** the Mathlib contract now lists `Module.Basis.constr` and
  `KaehlerDifferential.mvPolynomialBasis`. The Layer 6 and Layer 8 Dependencies paragraphs name
  these items.
- **Plan:** prerequisites for 6.4, 8.3 and 8.4 are updated to match.
- **Unchanged:** §§7.3, 7.4 and 7.6 already named what they use.

Where the new declarations are, at the pins:

- `Mathlib/RingTheory/Kaehler/Polynomial.lean:63`: `KaehlerDifferential.mvPolynomialBasis`.
- `Mathlib/LinearAlgebra/Basis/Defs.lean:507`: `Module.Basis.constr`.
- `Mathlib/RingTheory/Kaehler/Basic.lean:226, 355`: `KaehlerDifferential.D` and
  `KaehlerDifferential.linearMapEquivDerivation`.
- `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:56`: `exteriorPower.ιMulti`.

## REV-DESIGN-HochschildHomologyAndHKR~5/F03 (P3) — applied

Change: new §2.1 bullet: for `M = A`, `A ⊗[k] A^{⊗n} ≅ ⨂[k]^{n+1} A` carries `D_n` onto
`TauCeti.degenerateHochschildChains k A n` and `b` to the pinned faces, inducing
`N_•(A,A) ≅ TauCeti.normalizedHochschildChains.chainComplex k A`. Added: a fourth Check, Needs
entries, a Tau Ceti contract bullet, two Mathlib contract names, a §2.1 pointer in scope, Layer 2
Dependencies, plan 2.1 entries.

Evidence at the Tau Ceti pin, `TauCeti/RingTheory/CyclicCohomology/Normalized/Chains.lean`:

- `:53`, `degenerateHochschildChains`: the span of the tensors with `1` in a slot `i ≠ 0`.
- `:69`: the quotient by that span.
- `:242`, `:250`: `b` and `b_tensor`, the alternating sum of the faces `TauCeti.hochschildFace`.
  At `TauCeti/RingTheory/CyclicCohomology/Cochain.lean:233` the last face is
  `(a_{n+1}a₀, a₁, …, a_n)`.
- `:361`: `chainComplex`, in `ChainComplex (ModuleCat R) ℕ`.
- The hypotheses are `Ring A`, `Module k A`, `IsScalarTower k A A` and `SMulCommClass k A A`. All of
  them are supplied by `Algebra k A`.
- The module docstring says that the file does not compare these chains with the full complex.

Two details differ from the review's wording, and neither changes its content:

- **Direction.** The isomorphism is written in the direction `A ⊗ A^{⊗n} → ⨂^{n+1} A`, so that
  "carries `D_n` onto the pinned span" reads in the correct direction.
- **Complex, not just terms.** The identification is stated as an isomorphism with the pinned chain
  complex `chainComplex`, not only termwise, because the claim concerns the boundaries too.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §2.1 comparison, terms | `n = 0`; `n = 1`, `A = k[x]`; `n = 2`; `A = k`; `k = 0` | `n = 0`: `D₀ = 0` and the pinned span is `⊥` (`degenerateHochschildChains_zero`). `n = 1`: `span{m ⊗ 1}` against `span{a₀ ⊗ 1}`. `n = 2`: `im s₀ + im s₁ = span{m⊗1⊗a, m⊗a⊗1}`, which is "a `1` in slot 1 or 2". `A = k`: both give `0` in degree `≥ 1` and `k` in degree 0. `k = 0`: both are `0`. | holds |
| §2.1 comparison, boundaries | degree `1 → 0` on `Mat₂(k)`; degree `2 → 1` in general | Degree 1: ours is `ma − am`; the pinned value is face 0, `a₀a₁`, minus the last face, `a₁a₀`. At `(E₁₂, E₂₁)` both give `E₁₁ − E₂₂`. Degree 2: ours is `ma⊗c − m⊗ac + cm⊗a`; the pinned value is `(a₀a₁,a₂) − (a₀,a₁a₂) + (a₂a₀,a₁)`, which is the same. | holds, no sign twist |
| §2.1 wrong model: coefficient in the last slot | `A = k[x]`, `k` nonzero | `x ⊗ 1 ∈ D₁` would map to `1 ⊗ x`. Since `k[x]/k·1` is free on the `x̄^j`, `1 ⊗ x̄` is a basis vector of `A ⊗ Ā`, so `1 ⊗ x` is nonzero in the pinned `N₁`. | excluded by the new Check |
| §8.2 basis | `m = 0, 1, 2`; `k = 0`; `k = ℤ` | `m = 0`: `K₀ = k` with basis `e_∅`, and `K_j = 0` with the empty basis for `j ≥ 1`. `m = 1`: `e₁`. `m = 2`: `K₁` has basis `{e₁, e₂}` and `K₂` has basis `{e₁∧e₂}`. `k = 0`: these are bases of `0`, while Mathlib's rank is `1` (not `2`). `k = ℤ`: the bases have sizes `2` and `1`. | holds; the old rank claim fails at `k = 0` |
| §7.5 factorisation through `⋀^n` | `n = 0, 2`; scaling | `⟨D,D⟩(r₁,r₂) = det[[Dr₁,Dr₁],[Dr₂,Dr₂]] = 0`. `⟨rD₁,D₂⟩ = r⟨D₁,D₂⟩` by scaling a column. At `n = 0`, `⟨⟩ = 1` on `⋀⁰ = R`. | alternating and `R`-multilinear |
| §6.4 definition of `ε^cl_n` | `n = 0, 1` | `n = 1`: the derivation `r ↦ [1 ⊗ r]` (the route of §3.4) gives `r₀ dr₁ ↦ [r₀ ⊗ r₁]`. `n = 0`: the identity of `R`. | consistent with §6.4 Checks |
| §8.3 `ι` on the basis | `m = 0`; `j = 1` | `m = 0`: the empty basis gives `ι_j = 0` for `j > 0`, matching the `m = 0` Check of §8.3. `j = 1`: `e_i ↦ 1 ⊗ X_i ⊗ 1`. | holds |
| §8.4 basis `dX_I` | `m = 2`, `n = 2`; `m = 0` | `dX₁∧dX₂ ↦ [1⊗X₁⊗X₂ − 1⊗X₂⊗X₁]`, the `HH₂` basis vector. `m = 0`: `Ω⁰ = k = HH₀(k,k)`. | holds |
| §7.6 field Check | `k = 𝔽₂, R = 𝔽₂[x,y]`; `k = ℂ`; `k = 𝔽₂(u), R = 𝔽₂(u)[x]` | `𝔽₂`: perfect and regular affine, so HKR62 Theorem 5.2 applies; Ginz05 does not (characteristic 2). `ℂ`: both apply. `𝔽₂(u)`: neither citation applies and the Check claims neither; the theorem here still covers it. | holds |
| Ginz05 setting in §§2.1, 2.2, 8.4 and References | Ginz05 lines 96–97, 2187 | The ground field is fixed as algebraically closed of characteristic zero. Lemma 9.3.1 is for a commutative algebra over that field. | locators now say so |

## Checks

Dependency check (`tauceti-roadmap … gate --candidate packages/HochschildHomologyAndHKR/design/README.md --only HochschildHomologyAndHKR`):

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2233 edges, 0 problem(s)
```

The check printed no UPWARD or CYCLE line. No roadmap supplier was added: every new input is a
pinned Mathlib or Tau Ceti declaration.

Citation resolver (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name is
found nowhere. The previous lead `TauCeti.StarkSystems.toExteriorBidual` (an IntegralIwasawaTheory
§12.6 carrier) no longer appears.

The resolver did not check names outside TauCetiRoadmap on this host. I checked each new name by
hand at the pins, with its namespace:

- `PiTensorProduct.subsingletonEquiv`: `Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean:814`.
- `TensorPower.cast`: `Mathlib/LinearAlgebra/TensorPower/Basic.lean:97`.
- `rank_subsingleton`: root namespace, `Mathlib/LinearAlgebra/Dimension/Basic.lean:168`.
- The Tau Ceti names are in the `TauCeti` and `TauCeti.normalizedHochschildChains` namespaces, at
  the lines given under F03.

Other checks:

- `plan.json` parses, and its one-space indentation is preserved.
- `sources.toml` parses.
- No line I added contains a LaTeX delimiter or a process word.

Elaboration and binder audit: not applicable, since there is no `Suggested.lean` at the design
stage.

## Notes for the maintainer

- **No id changed.** No target id, heading or plan name changed, so no other roadmap's citation is
  affected. Plan 2.1 gains the API name `HochschildHKR.normalizedChainComplex_isoTauCeti` and the
  test `normalized_pinned_comparison`; plan 8.2 gains the test `koszul_basis`.
- **Ownership.** I searched main and the open heads, by object, for `normalizedHochschildChains`,
  `degenerateHochschildChains` and "normalized Hochschild chains". The only other hits are
  AInfCohomology and RefinedTraceMethods. Both import DGAInfinity Layer 8's normalised chains of
  DG algebras, which the scope of this roadmap already lists as a separate variant. No roadmap
  owns the comparison of the ungraded normalised complex with the pinned Tau Ceti carrier, so this
  roadmap owns it in §2.1.
- **No suspicious instruction** was found in the review text.
