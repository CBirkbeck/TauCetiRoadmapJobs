# Repair report: HochschildHomologyAndHKR, design round 8

Review resolved: `REV-DESIGN-HochschildHomologyAndHKR~7`. It has two findings, F01 and F02, both
P3. Both were verified against the pins and the cached sources, and both are applied. Files edited:

- `packages/HochschildHomologyAndHKR/design/README.md`
- `packages/HochschildHomologyAndHKR/design/plan.json`
- `packages/HochschildHomologyAndHKR/sources.toml` (one `cited_for` entry)

No new work is cited, and no `needs-references.toml` was written. There is no `Suggested.lean` at
the design stage, so nothing was elaborated and there was no `#check` binder audit to run.

Every library claim was checked at the pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`
and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` (the content checkout's `.lake/packages`,
equal to the plan's `baseline`).

## REV-DESIGN-HochschildHomologyAndHKR~7/F01 (P3) — applied

Old: §4.1 and the contracts named no pinned factor-restriction or `TauCeti.Bimodule` declaration.
New: two Tau Ceti contract bullets (README lines 386, 399); a variants bullet (line 168) and the
pinned list (line 106) in the scope; §4.1 statement clause, Needs and first API bullet (lines
1105–1123); Layer 4 Dependencies (line 1237); plan 4.1 statement, API entry and eight `tauceti:`
prerequisites.

**Evidence that the finding is right.** All of these were read at the pinned Tau Ceti:

- **The factor restrictions** (`TauCeti/Algebra/TensorProduct/Module.lean`, namespace
  `TauCeti.Algebra.TensorProduct`):
  - line 47: `moduleLeft`, an `abbrev` with `Module.compHom` along `includeLeft`;
  - line 51: `moduleRight`, the same along `includeRight`;
  - lines 55 and 60: `a • m = (a ⊗ 1) • m` and `b • m = (1 ⊗ b) • m`, both by `rfl`;
  - line 65: `moduleSMulCommClass`;
  - lines 80 and 88: the two scalar-tower theorems, under `[Module k M]` and
    `[IsScalarTower k (A ⊗[k] B) M]`;
  - line 103: `linearMapOfFactors`, which takes a `k`-linear `f` and the hypotheses `hleft` and
    `hright` and returns `M →ₗ[A ⊗[k] B] N`.
- **The bimodule `A`** (`TauCeti/Algebra/CentralSimple/Bimodule.lean`):
  - line 110: the type synonym `TauCeti.Bimodule f`;
  - line 142: its instance `Module (B ⊗[K] Aᵐᵒᵖ)`, by `Module.compHom` along
    `toEnd f = (AlgHom.mulLeftRight K A).comp (map f id)`;
  - line 184: `smul_of`, `(b ⊗ op a) • x = f b * x * a`.
- **Mathlib's side.** `instModuleTensorProductMop` is `TensorProduct.Algebra.module`
  (`Mathlib/Algebra/Azumaya/Defs.lean:39`), and `AlgHom.mulLeftRight` is its action (lines 43–56).

These declarations state part of §4.1: the inverse functor on objects, and one direction on maps.

**What neither pin has.** I searched both pins for an equivalence of categories:

- Tau Ceti's only `≌` with `Aᵐᵒᵖ` is `degreeZeroEquivalence`
  (`TauCeti/Algebra/Homology/DG/Module/Right/DegreeZero.lean:200`). It relates right modules to DG
  right modules, not bimodules.
- Mathlib's `Mathlib/Algebra/Module/Bimodule.lean` has subbimodules only.

So the new sentence "neither pinned library has the two round trips or the equivalence of
categories" is exact.

**Where the repair differs from the suggested wording.** The review's sentence "The pin has
neither the converse construction (Mathlib's `TensorProduct.Algebra.module`) …" is ambiguous:
Mathlib at the pin does have that construction. The new text says the converse is Mathlib's, and
only the round trips and the equivalence are missing. For the same reason, `TauCeti.Bimodule` is
described as "a carrier for places where an instance is required", not as the mandatory carrier.
`TauCeti.Bimodule (AlgHom.id k A)` agrees with `instModuleTensorProductMop` on pure tensors, and
hence everywhere.

**Same pattern elsewhere.** I searched the roadmap for every other use of `Aᵉ`-module structures:

- the conventions;
- §4.2 (the outer action on `B_n(A)`);
- §4.5 (the right `Aᵉ`-structure);
- §8.2 (`Rᵉ`-modules, commutative).

None of these states a restriction or a linearity criterion. The right `Aᵉ`-structure of §4.5 has
no pinned counterpart. Tau Ceti's `TauCeti.UniversalOneForms`
(`TauCeti/NoncommutativeGeometry/UniversalDifferential/OneForms.lean`) also uses
`linearMapOfFactors`, but no target here concerns the object representing derivations, so it is
not added.

## REV-DESIGN-HochschildHomologyAndHKR~7/F02 (P3) — applied

Old: §8.1's locator was "(HKR62 lines 268–279; Ginz05 Lemma 9.3.1, line 2187)". New (README line
1801): the statement over every `k` is proved by the route; Loday98 §3.2; neither of the other
sources names the `t_i` (HKR62 lines 268–271, regular local ring; Ginz05 lines 2193–2196,
asserted). Plan 8.1's locator now has `source` Loday98; `sources.toml` Loday98 `cited_for` gains
"§8.1".

**Evidence that the finding is right.** In the cached texts:

- **HKR62 lines 263–271.** They take a regular local ring `L` and a prime `J` with `L/J` regular.
  They obtain a regular sequence generating `J` by citing Matsumura, and name no element.
- **Ginz05 line 2187.** Lemma 9.3.1 gives `Tor` for any ideal generated by a regular sequence.
- **Ginz05 lines 2193–2196.** They assert, without proof, that the ideal of the diagonal of a
  smooth `X` is generated by a regular sequence. The ground field is algebraically closed of
  characteristic zero (Ginz05 lines 96–97).

Neither source mentions `X_i ⊗ 1 − 1 ⊗ X_i`, or any ring that is not a field or local.

**Where the repair differs from the suggested wording.** The review described HKR62's passage as
"the ideal of the diagonal". In fact Theorem 3.1 (line 210) treats any epimorphism `S → R`, and
`J = I S_M` there. The new wording therefore says "a prime ideal with regular quotient of a regular
local ring". Ginz05's assertion is described as asserted without proof, which leaves the
local-versus-global issue the review records as a source issue untouched. The Loday98 §3.2 locator
already appears at §8.4 for the same content (symmetric algebras over any `k`). Loday98 is settled
uncertified and is cited by locator only.

**Same pattern elsewhere.** §8.4 said HKR62's computation "uses only the regular sequence of §8.1".
HKR62 uses its own unnamed sequence, so this now reads "needs only a regular sequence generating the
ideal, here the one of §8.1" (line 1907). The §8.2 locators (HKR62 lines 268–279, the Koszul
resolution; Ginz05 lines 2187–2197) claim only the Koszul resolution and its zero differential.
That is what those lines contain, so they are unchanged. Plan 8.4's locator makes no claim about
the `t_i` and is unchanged.

## Adversarial pass on the changed statements

`E_ij` are matrix units. `h` is the §4.2 homotopy `h(a₀ ⊗ ⋯) = 1 ⊗ a₀ ⊗ ⋯`.

| Statement | Instances tried and values computed | Result | Change |
| --- | --- | --- | --- |
| Contract: restrictions `a • m = (a ⊗ 1) • m`, `b • m = (1 ⊗ b) • m` at `B = Aᵐᵒᵖ` | `A = M = Mat₂(k)` with the action `(a ⊗ op b)·m = amb`: `(E₁₂ ⊗ 1)·E₂₂ = E₁₂`, which is `E₁₂E₂₂`. `(1 ⊗ op E₂₁)·E₂₂ = E₂₂E₂₁ = E₂₁`, which is `m·b` with `m·b = op b • m`. `A = B = k`: `k ⊗ k ≅ k`, and both restrictions are the given action. `k = 0`: `A ⊗ B = 0` forces `M = 0`. | holds | none |
| Contract: the restrictions commute | `a = E₁₂`, `b = E₂₁`, `m = E₂₂`: `a(mb) = E₁₂E₂₁ = E₁₁` and `(am)b = E₁₂E₂₁ = E₁₁`. In `Aᵉ`, `(a ⊗ 1)(1 ⊗ op b) = a ⊗ op b = (1 ⊗ op b)(a ⊗ 1)`. | holds | none |
| Contract: compatibility with `k` needs `IsScalarTower k (A ⊗[k] B) M` | `k = A = B = M = ℂ` with `k` acting on `M` by conjugation: `(i ⊗ 1)·1 = i`, but `i • 1 = −i` under that `k`-action. The tower fails and so does compatibility, so the hypothesis is needed. | hypothesis kept | none |
| Contract and §4.1 API: `linearMapOfFactors` | `A = k[x]`, `k ≠ 0`, `f = h : B₀ → B₁`. Left hypothesis: `h((x ⊗ 1)·(1 ⊗ 1)) = 1 ⊗ x ⊗ 1`, but `(x ⊗ 1)·h(1 ⊗ 1) = x ⊗ 1 ⊗ 1`, so it fails. Right hypothesis: `h(1 ⊗ x) = 1 ⊗ 1 ⊗ x = (1 ⊗ 1 ⊗ 1)·x`, so it holds. `h` is right-linear only, as the §4.2 Check says. A bimodule map `f` satisfies both, since `(a ⊗ 1)·m = a(1·m) = am` and `(1 ⊗ op b)·m = mb` (`moduleAux_apply`). `A = k`: every `k`-linear map qualifies. | holds | none |
| Contract and §4.1: `TauCeti.Bimodule (AlgHom.id k A)` agrees with `instModuleTensorProductMop` | Pure tensors: `toEnd id (b ⊗ op a) x = mulLeftRight(b ⊗ op a) x = bxa` (`smul_of`, `AlgHom.mulLeftRight_apply`). Both actions are additive in the scalar, so they agree everywhere (`TensorProduct.induction_on`). `Mat₂`: `(E₁₂ ⊗ op E₂₁)·E₂₂ = E₁₁` both ways; the reversed order gives `E₂₁E₂₂E₁₂ = 0`. `A = k`: `(c ⊗ op d)·x = cdx` both ways. | holds | none |
| Scope variant: §4.1 adds the round trips and the equivalence | Bimodule → `Aᵉ`-module → restriction: `a • m ↦ (a ⊗ 1)·m = a(1·m) = am`, the original action. `Aᵉ`-module → restriction → `TensorProduct.Algebra.module`: `(a ⊗ op b)·m ↦ a·(op b·m) = (a ⊗ 1)(1 ⊗ op b)·m`, the original action. Neither identity is stated at either pin; no `≌` of bimodules exists there. | holds | none |
| §4.1 Checks, recomputed | `Mat₂`: `E₁₁`, and `0` for the reversed order. Commutative `R`: `μ((a ⊗ b)(x ⊗ y)) = axby = ab·μ(x ⊗ y)`. `A = k`: `Aᵉ = k`. | hold | none |
| §8.1 locator: HKR62 lines 268–271 | Line 263: `L` is a regular local ring and `J` a prime ideal of `L` with regular quotient. Lines 268–271: `J` is generated by an `R`-sequence, cited, unnamed. | as worded | wording fixed |
| §8.1 locator: Ginz05 lines 2193–2196 | Line 2194: `R = A ⊗ A`, `J` is the diagonal ideal. Line 2195: smooth implies a regular sequence, unproved and unnamed. Lines 96–97: `k` algebraically closed of characteristic zero. | as worded | wording fixed |
| §8.1 statement (unchanged) against the new wording | `k = ℤ/4`, `m = 1`: `t = −Y` in `(ℤ/4)[X][Y]` is monic, hence a nonzerodivisor, and generates the kernel of `Y ↦ 0`. No cited passage covers this ring, and the wording no longer claims one does. `m = 0`: `Rᵉ = k`, the kernel is `0`, the empty sequence. `k[x]/(x²)`: `t(x ⊗ 1 + 1 ⊗ x) = 0`, the Check's zero divisor, still outside the statement. | holds | none |
| §8.4 locator: "needs only a regular sequence generating the ideal" | HKR62 lines 272–278: the Koszul resolution of `L/J` is built from the sequence, and `(L/J) ⊗ X` has zero boundary. `R = k[X]`: `R ⊗_{Rᵉ}(Rᵉ →t→ Rᵉ)` is `R →0→ R`, since `t` acts by `X − X = 0`. So `Tor₁ = Tor₀ = R`, as §8.4 states for `m = 1`. | holds | wording fixed |

## Checks

**Dependency check**:

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2237 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The edge count rose from 2233 to 2237 because §4.1 and Layer 4
now name Tau Ceti library declarations; no roadmap supplier was added.

**Citation resolver** (`roadmaps resolve`): no cross-roadmap citation and no Lean name found
nowhere. On this host the resolver did not check names outside TauCetiRoadmap, so it did not
re-raise the worker's one lead, `TauCeti.StarkSystems.toExteriorBidual`. That name is unchanged. It
is IntegralIwasawaTheory §12.6's planned name, as the review confirms, and the README presents it as
a supplier's name.

I checked the library names myself. The eight new Tau Ceti names were each found at their declaring
line at the pin (lines listed under F01). `AlgHom.mulLeftRight` and `AlgHom.id` were found in the
pinned Mathlib.

**Hygiene.** The README has no LaTeX delimiters, no process words and no machine paths.
`plan.json` parses and is re-serialised in its original format. `sources.toml` parses with 9
entries.

**Ownership.** This round adds no construction. `roadmaps grep` for `linearMapOfFactors`,
`TauCeti.Bimodule` and bimodule ↔ enveloping-algebra equivalences finds only SemisimpleAlgebras. It
cites `TauCeti.Bimodule` as an existing library declaration and plans no equivalence of categories,
so §4.1's ownership is unchanged.

**Gate failures**: none listed for this round.

## Notes for the maintainer

- No id, heading or name that another roadmap could cite was changed.
- Plan 8.1's primary locator source is now Loday98, which is settled uncertified. The certified
  texts (HKR62, Ginz05) stay in the locator as context. The statement over every `k` rests on the
  route inside §8.1 (Mathlib `MvPolynomial.span_X_image_eq_ker_aeval_ite_mem`, Tau Ceti
  `MvPolynomial.isWeaklyRegular_map_X`), not on a source.
- No passage in the review asked for anything outside this job.
