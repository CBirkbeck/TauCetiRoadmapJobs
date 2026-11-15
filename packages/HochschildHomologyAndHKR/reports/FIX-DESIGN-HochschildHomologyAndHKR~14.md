# Repair report: HochschildHomologyAndHKR, design round 14

Review resolved: `REV-DESIGN-HochschildHomologyAndHKR~13`. It has one finding, F01 (P3). The finding
is right and is applied. One input that the finding did not name has the same defect and is repaired
too: `Tor_0 ≅ M ⊗_{Aᵉ} N` needs `M ⊗_{Aᵉ} −` to be right exact in the *second* variable.

Files edited:

- `packages/HochschildHomologyAndHKR/design/README.md`:
  - From Mathlib contract: `CategoryTheory.Functor.leftDerivedZeroIsoSelf`.
  - From Tau Ceti contract: `TauCeti.BalancedTensorProduct.liftEquiv`.
  - §4.5: the route paragraph's bullet numbers, the *Needs:* line, one new API bullet, the `Tor_0`
    bullet, the flatness bullet, the flat-resolution route and two new Checks.
  - The Layer 4 Dependencies and the Weibel94 entry under References.
- `packages/HochschildHomologyAndHKR/design/plan.json`, target 4.5:
  - statement, locator and prerequisites;
  - one new API entry, `HochschildHKR.tensor_rightExact`;
  - three API entries revised: `torZeroIso`, `flat_of_free` and `tor_flatResolution`;
  - two new tests.
- `packages/HochschildHomologyAndHKR/sources.toml`: the Weibel94 `locator` and `version_note` now
  also list §2.6. The key, the `uncertified` status (settled) and `cited_for` (which already
  contains `§4.5`) are unchanged.

No new work is cited, so no `needs-references.toml` was written. Nothing waits on a missing text.
There is no `Suggested.lean` at the design stage, so there was no `#check` binder audit and no
elaboration.

## REV-DESIGN-HochschildHomologyAndHKR~13/F01 (P3) — applied

**Verified at the pins.** All three witnesses hold.

- **(i)** The old bullet ("Free, hence projective, left `Aᵉ`-modules are flat") proves flatness only
  for free modules. The route then uses flatness of the projective `P_j`.
- **(ii)** Flatness as §4.5 defines it gives injectivity only. Short exactness after `− ⊗_{Aᵉ} P_j`
  also needs right exactness in the bimodule variable. No file of pinned
  `TauCeti/LinearAlgebra/TensorProduct/Balanced/` states right exactness or exactness. The only
  surjectivity fact is `TauCeti.BalancedExtension.map_surjective` in `Extension.lean:411`, which
  is about base extension, not this tensor product.
- **(iii)** `TauCeti.BalancedTensorProduct.finsuppScalarRight` (`Finsupp.lean:69`) is
  `M ⊗[A] (P →₀ A) ≃ (P →₀ M)`. That is free in the second variable. Pinned Tau Ceti has no form
  that is free in the first variable. `lid` (`Unit.lean:48`) is the rank-one case only.

The same gap affects a fourth input, which the finding did not name. Mathlib's
`CategoryTheory.Functor.leftDerivedZeroIsoSelf` (`Mathlib/CategoryTheory/Abelian/LeftDerived.lean:359`)
requires `[F.Additive] [PreservesFiniteColimits F]` (line 338). So the first API bullet
`Tor_0 ≅ M ⊗_{Aᵉ} N`, and the step "in degree zero `φ` induces the identity", need `M ⊗_{Aᵉ} −`
to be right exact in the second variable. No bullet stated that either.

**Change (old → new).**

- New first bullet: `N ↦ N ⊗_{Aᵉ} F` and `M ⊗_{Aᵉ} −` are right exact and commute with direct
  sums, as left adjoints (`liftEquiv`; Weibel94 §2.6); free forms via `lid` and
  `finsuppScalarRight`.
- Flatness bullet: "Free … are flat; projective ones too, as direct summands", with the retract
  argument.
- The route cites the new bullet three times.

**Departure from the suggested bullet.** The review asked for right exactness in the bimodule
variable only. The new bullet states both variables, for the `Tor_0` reason above. It is placed
first rather than just before the flat-resolution bullet, because the `Tor_0` bullet already uses
it. The references "fourth/fifth bullet below" in the route paragraph become "fifth/sixth".

**Proof route of the new bullet.** `TauCeti.BalancedTensorProduct.liftEquiv` (`Basic.lean:184`)
identifies `k`-linear maps `N ⊗_{Aᵉ} F → X` with balanced bilinear maps. These are naturally:

- the `Aᵉ`-linear maps `F → Hom_k(N,X)`, with `(e·φ)(n) = φ(n·e)`;
- the right-linear maps `N → Hom_k(F,X)`, with `(φ·e)(f) = φ(e·f)`.

So each functor is a left adjoint, hence right exact and preserving all colimits.

**Pattern search.**

- No other passage builds exactness from injectivity-only flatness over a noncommutative ring, or
  uses `finsuppScalarRight` in the first variable. The searches were for "hence projective",
  "stays short exact", "preserves injective", "on each summand" and `finsuppScalarRight`.
- §1.4 tensors over the commutative `k` with Mathlib's `Module.Flat`. Mathlib proves exactness
  there (`Module.Flat.rTensor_exact`, `Mathlib/RingTheory/Flat/Basic.lean:341`), so no change.
- §2.1 (line 883) cites the right exactness of `⊗[k]`, which Mathlib has.

**Ownership.** I searched by object, at main and at the open heads ("right exact" near
"balanced tensor"). The one match is InverseGaloisAndArithmeticFundamentalGroupsPartII §1.4, and
it only uses the fact inside a proof sketch: it states no target. DerivedModuleAlgebra §0.2 owns
derived tensor products over commutative rings only. This roadmap therefore owns the fact, as an
API bullet of §4.5 for the enveloping algebra.

### Adversarial pass (statements added or changed)

| Statement | Instances tried and values computed | Result | Change |
| --- | --- | --- | --- |
| New bullet: right exact, first variable | `k = A = ℤ`, `F = ℤ/p`: `0 → ℤ --p--> ℤ → ℤ/p → 0` becomes `ℤ/p --0--> ℤ/p --id--> ℤ/p → 0`. Middle: `ker id = 0 = im 0`; right: onto; left: kernel `ℤ/p = Tor₁(ℤ/p,ℤ/p)`. Flat `F = ℚ`: `0 → ℚ --p--> ℚ → 0 → 0`, short exact. | right exact, not exact: as stated | new Check |
| New bullet: direct sums, not products | `(ℤ ⊕ ℤ) ⊗ ℚ = ℚ²`; `(⊕_ℕ ℤ) ⊗ ℚ = ⊕_ℕ ℚ`. Every element of `(Π_ℕ ℤ) ⊗ ℚ` is `x ⊗ 1/n` (common denominator), so its image in `Π_ℕ ℚ` misses `(1, 1/2, 1/3, …)`. | sums only: as stated | same Check |
| New bullet: second variable, used by `Tor_0` | `leftDerivedZeroIsoSelf` hypotheses at line 338: additive and `PreservesFiniteColimits`. Wrong model, a left-exact functor: `(−)[p]` on `ℤ`-modules, with `0 → ℤ --p²--> ℤ → ℤ/p² → 0`, has `L₀ = coker(0 → 0) = 0 ≠ ℤ/p = (ℤ/p²)[p]`. `A = k = ℤ`, `M = ℤ`, `N = ℤ/p`: `Tor_0 = ℤ/p = ℤ ⊗ ℤ/p`. | right exactness needed and holds | bullet cites it |
| New bullet: adjunction actions | `(e·(e′·φ))(n) = (e′·φ)(n·e) = φ(n·(ee′)) = ((ee′)·φ)(n)`: a left action. Balanced `β`: `(e·β(−,f))(n) = β(n·e, f) = β(n, e·f)`, so `f ↦ β(−,f)` is `Aᵉ`-linear. Similarly `β(n·e, −) = β(n,−)·e`. | holds | — |
| New bullet: free `Q`, swap | Right structure on the bimodule `Aᵉ`: `(x⊗op y)·(a⊗op b) = bx ⊗ op(ya)`. With `τ(x⊗op y) = y⊗op x`, `τ` of that is `ya ⊗ op(bx) = τ(x⊗op y)·(a⊗op b)` (regular). `Mat₂`, `x = E₁₂`, `a = E₂₁`, `y = b = 1`: both sides `E₂₁ ⊗ op E₁₂`. Without `τ`: `E₁₁ ⊗ 1 ≠ E₁₂ ⊗ op E₂₁`. `I = ∅`: `0 = (∅ →₀ F)`. | swap needed and suffices | — |
| Flatness bullet: projective via retract | `(f⊗P)x = 0` gives `(f⊗Q)(id⊗i)x = 0`, so `(id⊗i)x = 0`, so `x = (id⊗r)(id⊗i)x = 0`. `ℤ/6`: `3² = 3`, `4² = 4`, `3+4 = 1`, `3·4 = 0`. `P = {0,3} ≅ ℤ/2`, not free (`2 ≠ 6^r`). `N ⊗ P ≅ 3N` by `n ⊗ 3 ↦ 3n`; the inverse is well defined since `(n−n′)⊗3 = 3(n−n′)⊗3`. Noncommutative: `A = Mat₂(k)` over a field gives semisimple `Aᵉ ≅ Mat₄(k)`, so every module is flat. | holds | new Check |
| Flat-resolution route (revised) | `k = A = ℤ`, `0 → ℤ --p--> ℤ → ℤ/p → 0`, `F_• = [ℤ → ℚ]` resolving `ℚ/ℤ`: termwise short exact. `H₁(ℤ/p ⊗ F_•) = ker(ℤ/p → 0) = ℤ/p = Tor₁(ℤ/p,ℚ/ℤ)`. Free `Q = ℤ`: `H₁ = ker(ℤ → ℚ) = 0`, `H₀ = ℚ/ℤ = Q ⊗ N`. Non-flat terms `[𝔽_p]`, `M = 𝔽_p`: `H₁ = 0 ≠ 𝔽_p`. | holds | inputs cited |
| Route paragraph numbering | Bullets now: 1 right exactness, 2 `Tor_0`, 3 projective vanishing, 4 projective resolutions, 5 flatness (including `Aᵉ ⊗[k] X`), 6 flat resolutions. "Fifth" is `B_n(A)` flat; "sixth" is flat resolutions. | consistent | renumbered |

The other §4.5 Checks were re-read against the changed bullets: `Mat₂` `Tor_0 = k`, `ℚ[x]`,
`ℤ[x]/(px)`, `ℚ/ℤ`, `A = k`, `Tor(M,Aᵉ)` and the wrong-side action. None uses a changed value. The
`Aᵉ` case of the new bullet gives `Tor_0(M,Aᵉ) = M ⊗_{Aᵉ} Aᵉ ≅ M` (`rid`), matching the Check.

## Checks run

Dependency check:

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 243 roadmaps, 2250 edges, 0 problem(s)
```

No UPWARD or CYCLE line. No roadmap supplier was added.

The citation resolver (`roadmaps resolve`) was run on the edited README. It reports no
cross-roadmap citation and no Lean name found nowhere. On this host it does not check names outside
TauCetiRoadmap, so I opened every new pinned name by hand:

- `CategoryTheory.Functor.leftDerivedZeroIsoSelf`: `Mathlib/CategoryTheory/Abelian/LeftDerived.lean:359`,
  in `namespace CategoryTheory` / `Functor`;
- `Module.Flat.of_retract`: `Mathlib/RingTheory/Flat/Basic.lean:173`, `[CommSemiring R]`;
- `TauCeti.BalancedTensorProduct.liftEquiv`: `TauCeti/LinearAlgebra/TensorProduct/Balanced/Basic.lean:184`.

`plan.json` parses as JSON and `sources.toml` as TOML. The scan for LaTeX delimiters found none.

## For the maintainer

- No name that another roadmap cites has changed. The plan's API entry is new,
  `HochschildHKR.tensor_rightExact`. The plan's other names are unchanged.
- The worker's resolver lead `TauCeti.StarkSystems.toExteriorBidual` (README §7.3 and the supplier
  contract) is not at the pins. The README presents it as the carrier of IntegralIwasawaTheory §12.6
  and EulerSystemsAndKolyvaginSystems §6.1. Both resolve, and the resolver run on the edited README
  lists nothing. It was not part of this finding and is unchanged.
- Ownership against open pull requests was checked with `roadmaps grep` at their heads (see
  Ownership above).
