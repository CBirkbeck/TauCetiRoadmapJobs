# Repair report: HochschildHomologyAndHKR, design round 11

Review resolved: `REV-DESIGN-HochschildHomologyAndHKR~10`. It has three findings, F01–F03, all P3.
I checked each one against the pinned Tau Ceti (`2fd255d9`), DerivedModuleAlgebra on main
(`1a19c9f`) and this roadmap's own text. All three are right and all three are applied. While
repairing them I found one more occurrence of the F03 pattern, and that is repaired too.

Files edited:

- `packages/HochschildHomologyAndHKR/design/README.md`
- `packages/HochschildHomologyAndHKR/design/plan.json` (target 2.2 only)

`sources.toml` is unchanged. The repairs cite only pinned declarations and a roadmap on main, so no
new work is cited and no `needs-references.toml` was written. There is no `Suggested.lean` at the
design stage. Nothing was elaborated, and there was no `#check` binder audit to run.

## REV-DESIGN-HochschildHomologyAndHKR~10/F01 (P3) — applied

**Verified.** In `TauCeti/RingTheory/Extension/SquareZero/Basic.lean`, the `variable` lines at 246–247,
364–365 and 377–378 all end with `[IsScalarTower A Bᵐᵒᵖ M]`. These blocks govern three things: the
trivial extension `squareZero`, the `Zero (Exal A B M)` instance (line 368) and
`extensionClass_eq_zero_iff` (line 387).

**Change (old → new).** The "From Tau Ceti" bullet on `TauCeti.SquareZeroExtension` listed four
hypotheses: "`Module Bᵐᵒᵖ M`, `IsCentralScalar B M`, `Module A M` and `IsScalarTower A B M`". It now
lists five: the same four, then `IsScalarTower A Bᵐᵒᵖ M`.

**Same pattern elsewhere.** No other place lists these hypotheses. Plan target 3.6 states the
roadmap's bimodule hypotheses, not the pinned ones. The README's bimodule convention already
contains `IsScalarTower k Aᵐᵒᵖ M`, so the §3.6 comparison (`A = k`, `B = R`) needs no change.

## REV-DESIGN-HochschildHomologyAndHKR~10/F02 (P3) — applied

**Verified.** `TauCeti/RingTheory/HochschildCohomology/Complex.lean` declares the following:

- `hochschildCocycles` (line 79);
- `hochschildCoboundaries` (line 91), which is `⊥` in degree zero;
- `mem_hochschildCocycles_zero_iff` (line 124): the degree-zero cocycles are the traces;
- `abbrev hochschildCohomology` (line 166), the homology of `hochschildCochainComplex`;
- `hochschildCohomology.mk` (190), `mk_surjective` (207), `mk_eq_zero_iff` (215) and `desc` (248).

**Change (old → new).**

- **Variants bullet on §1.2.** Old: the pinned complex "compute[s] `HH^n(A, Hom_k(A,M))`". New: its
  cohomology `TauCeti.hochschildCohomology` (with its cocycles, coboundaries and `mk`) is
  `HH^n(A, Hom_k(A,M))`.
- **Contract bullet.** It now names all eight declarations and states what each says.
- **§2.2 Needs line.** It gains four names.
- **§2.2 comparison bullet.** New text: currying carries cocycles onto `Z^n` and coboundaries onto
  `B^n`, so `TauCeti.hochschildCohomology k A N n ≅ HH^n(A, A →ₗ[k] N)`, with `mk` going to the
  class map.
- **§2.2 Checks.** One new Check (computed below).
- **Layer 2 Dependencies.** It now names the cohomology.
- **Plan target 2.2.** It gains four prerequisites, the matching clause in the API entry
  `normalizedCochainComplex_isoTauCeti`, and the new test `normalized_cochains_pinned_cohomology`.

**Same pattern elsewhere.** I searched the pinned Tau Ceti for every `abbrev …Cohomology` and
`…Homology` on Hochschild or cyclic carriers:

- `TauCeti.AInfinityAlgebra.PositiveHochschild.Cohomology` is already cited.
- The cyclic cohomologies (`cyclicCohomology`, `relativeCyclicCohomology`, `reducedCyclicCohomology`,
  the continuous ones) are cyclic theory, which this roadmap leaves to KTheoryFiniteLocalFields
  §4.0 and NoncommutativeGeometry N1.
- `TauCeti.normalizedHochschildChains.chainComplex` has no pinned homology.

Nothing else is uncited.

## REV-DESIGN-HochschildHomologyAndHKR~10/F03 (P3) — applied

**Verified.** DerivedModuleAlgebra on main, README lines 1339–1385 (§0.5), says three things: the
trivial extension "is split"; `Exal_A(B,M)` and the Baer sum are defined; derivations correspond to
sections of the trivial extension. Its Checks give `ℤ/4 → ℤ/2` as one instance with nonzero class.
It never states that the class is zero if and only if the extension splits. That criterion is the
pinned `TauCeti.SquareZeroExtension.extensionClass_eq_zero_iff` (`Basic.lean:387`).

**Change (old → new).**

- **Scope, "leaves to other roadmaps".** Old: "the vanishing of the class exactly for split
  extensions". New: "the split trivial extension".
- **Variants bullet on §3.6.** Old: "keeps them with the criterion that the class vanishes exactly
  for split extensions". New: "keeps them; Tau Ceti's
  `TauCeti.SquareZeroExtension.extensionClass_eq_zero_iff` proves that the class vanishes exactly
  for split extensions".

**Same pattern elsewhere.** The "Already in the pinned libraries" sentence put the criterion inside
the list glossed "(the objects of DerivedModuleAlgebra §0.5)". It now reads: "… `TauCeti.Exal` (the
objects of DerivedModuleAlgebra §0.5), with the criterion that the class vanishes exactly for split
extensions (`…extensionClass_eq_zero_iff`)".

The other mentions of §0.5 attribute only the extensions and the derivation–section bijection,
which §0.5 does state:

- README lines 191–193, 1056 and 1208;
- plan targets 3.3 and 3.6.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Contract: `Exal A B M` has zero `[TrivSqZeroExt B M]`, and class `0` iff split, under the five hypotheses | `A = ℤ`, `B = M = 𝔽₂` with `ℤ/4 → 𝔽₂`, `ι(1) = 2`; `TrivSqZeroExt 𝔽₂ 𝔽₂`; `M = 0` | The five instances hold for the symmetric `𝔽₂`-module. A ring section of `ℤ/4 → 𝔽₂` needs `1 ↦ 1`, so `1 + 1 = 0 ↦ 2 ≠ 0`: no splitting, class `≠ 0`. `inl` splits `TrivSqZeroExt`: class `0`. For `M = 0`, `π` is bijective and splits: class `0`. | holds | fifth hypothesis added (F01) |
| §1.2 variants bullet: pinned cohomology is `HH^n(A, Hom_k(A,M))`, not `HH^n(A,M)` | `A = k`; `A = k[x]`, `N = k` with `x` acting by `0` | `A = k`: both differentials are multiplication by `Σ_{i=0}^{n+1}(−1)^i`, which is `0` for even `n` and `1` for odd `n`. Pinned: `H⁰ = N`, `H^n = 0` for `n ≥ 1`. `HH^n(k, Hom_k(k,N) ≅ N)` is the same. `A = k[x]`: `HH⁰(k[x],k) = Z⁰ = k`, while the pinned `H⁰` is `Hom_k(k[x],k)`, which surjects onto `k²` by `χ ↦ (χ(1),χ(x))`. | holds | names added (F02) |
| §2.2: currying carries pinned cocycles onto `Z^n(A, A →ₗ N)` and coboundaries onto `B^n`, so `hochschildCohomology k A N n ≅ HH^n(A, A →ₗ[k] N)`; `mk` goes to the class map | `n = 0` for every `A`; `n = 1`, `A = k[x]`, `N = k`, `φ(a₀,a₁) = (a₀∂a₁)(0)`; `k = 0` | `n = 0`: pinned cocycles are `χ(ab) = χ(ba)`. `Z⁰(A, A →ₗ N)` is `a·g = g·a`, i.e. `g(ya) = g(ay)`: the same set. Both coboundary groups are `0` (pinned `⊥`; `B⁰ = 0`). `n = 1`: `bφ = (a₀a₁∂a₂ − a₀∂(a₁a₂) + a₂a₀∂a₁)(0) = 0`. Pinned `B¹ = {χ(a₀a₁) − χ(a₁a₀)} = 0` (commutative), and inner derivations into `A →ₗ k` are `0` (`g(ya) = g(ay)`). So `mk φ ≠ 0` and `[ψ] ≠ 0`, with `ψ(x)(1) = φ(1,x) = 1`. `k = 0`: every term is `0`. | holds | new comparison clause and Check (F02) |
| Universe check for the §2.2 isomorphism | pinned `A : Type u`, `M : Type*`; convention puts `k, A, N` in `u` | `A →ₗ[k] N : Type u`, so both sides live in `ModuleCat.{u} k`. | holds | none |
| Scope: §0.5 states the split trivial extension | DerivedModuleAlgebra main, line 1344 | "…and is split" is present. No iff is stated in lines 1339–1385. | holds | wording (F03) |
| Variants bullet on §3.6: the pinned criterion proves "class 0 iff split" | `Basic.lean:387` | `E.extensionClass = 0 ↔ Nonempty E.Splitting`, under the five hypotheses of F01. | holds | wording (F03) |

The Checks that use the changed objects were recomputed:

- the §2.2 comparison Check, which is unchanged and agrees with the new clause;
- the three-case §3.6 comparison Check, which is unchanged and uses `TauCeti.Exal k R k` under the
  symmetric-bimodule convention, which includes `IsScalarTower k Rᵐᵒᵖ M`;
- the `HH²(k,M) = 0` Check, which cites `TauCeti.Exal.subsingleton_self`. That instance needs no
  further hypothesis (its block at line 396 has only `Module A N`).

## Checks run

Dependency check (`gate --candidate … --only HochschildHomologyAndHKR`), output:

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2245 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line.

`roadmaps resolve` on the edited README found no cross-roadmap citation and no Lean name that is
found nowhere. On this run it did not check names outside TauCetiRoadmap. So I checked by hand
every Tau Ceti name I added, at the pin, in
`TauCeti/RingTheory/HochschildCohomology/Complex.lean` (lines 79, 91, 124, 166, 190, 207, 215, 248;
all in `namespace TauCeti`).

The worker's earlier lead `TauCeti.StarkSystems.toExteriorBidual` (README §7.3) predates this round.
It is IntegralIwasawaTheory §12.6's planned carrier, cited as such, and was untouched.

`plan.json` parses. Its formatting and key order are unchanged, and the diff touches target 2.2
only.

## Notes for the maintainer

- No target was added, renamed or removed. No section id changed. No supplier or gap changed. The
  one gap, `smooth-hkr-antisymmetrisation` (RefinedTraceMethods §1.9), is unchanged.
- Ownership: no new construction. The added text cites pinned Tau Ceti declarations, and the F03
  rewording reattributes a criterion from DerivedModuleAlgebra §0.5 to its pinned owner. No other
  roadmap is affected.
- The review's "Source issues" (Ginz05 misprints) and its "For the human reviewers" section ask for
  no change here, and none was made.
