# Repair report: HochschildHomologyAndHKR, design round 10

Review resolved: `REV-DESIGN-HochschildHomologyAndHKR~9`. It has one finding, F01 (P2). I checked
it against the pinned Tau Ceti (`2fd255d9`), the pinned Mathlib (`1b1ccf4b`), DerivedModuleAlgebra
on main (`1a19c9f`) and this roadmap's own §§3.3, 3.5 and 3.6. The finding is right and is applied.
One part of the suggested contract wording was not accurate and is applied in corrected form
(below). The same pattern also occurred in §3.3; that occurrence is repaired too.

Files edited:

- `packages/HochschildHomologyAndHKR/design/README.md`
- `packages/HochschildHomologyAndHKR/design/plan.json` (targets 3.3 and 3.6)

`sources.toml` is unchanged. The repair cites only pinned declarations and a roadmap on main, so
no new work is cited and no `needs-references.toml` was written. There is no `Suggested.lean` at
the design stage, so nothing was elaborated and there was no `#check` binder audit to run.

## REV-DESIGN-HochschildHomologyAndHKR~9/F01 (P2) — applied

**What changed (old → new).**

- **Scope, "Already in the pinned libraries"** (README line 104): only `TrivSqZeroExt` was listed.
  Now it also lists Mathlib's `derivationToSquareZeroEquivLift`. It also lists Tau Ceti's
  `TauCeti.SquareZeroExtension` with `.Hom`, `.Splitting`, `TauCeti.Exal` and
  `.extensionClass_eq_zero_iff`, described as the objects of DerivedModuleAlgebra §0.5.
- **Scope, "leaves to other roadmaps"** (line 77): the DerivedModuleAlgebra entry named §0.K.1
  only. It now also names §0.5.
- **Scope, variants bullet on §3.6** (lines 180–186): one added clause says what DerivedModuleAlgebra
  §0.5 and the pinned `TauCeti.SquareZeroExtension k R M` keep. They keep commutative rings, require
  no `k`-section, and keep "class zero iff split". §3.6 is noncommutative and `k`-split. The two
  meet in the `R ⊕_f M` for symmetric `f`.
- **From Mathlib** (line 358): the hypotheses of `derivationToSquareZeroEquivLift`, which is cited
  and not consumed.
- **From Tau Ceti** (line 514): a new bullet for `TauCeti/RingTheory/Extension/SquareZero/Basic.lean`.
- **§3.6** (lines 1121–1138):
  - The Needs line now names the pinned declarations.
  - A new API bullet gives the comparison (statement in the pass table below).
  - A new Check, the review's three-case repair test (line 1151).
  - A clause added to the `HH²(k,M) = 0` Check: in the commutative case it is
    `TauCeti.Exal.subsingleton_self`.
- **Layer 3 Dependencies** (line 1177): names the pinned file. It says DerivedModuleAlgebra §0.5 is
  cited and enters only through its pinned form.
- **plan.json, target 3.6**: five `tauceti:` prerequisites, an API entry
  `HochschildHKR.cohomologyTwoClassification_squareZeroExtension`, the test
  `hh2_tauceti_comparison`, and the extended `hh2_k`.

**Evidence that the finding is right.**

- *The pinned declarations exist.* `TauCeti/RingTheory/Extension/SquareZero/Basic.lean` declares
  `SquareZeroExtension` (line 69), `Hom` (line 122), `Splitting` (line 211), `ι_algebraMap_smul`
  (line 108), `Exal` (line 317), `extensionClass` (line 325), `extensionClass_eq_zero_iff`
  (line 387) and `Exal.subsingleton_self` (line 399). In that file the ring `E` is a `CommRing`,
  and `ι` is an additive map.
- *DerivedModuleAlgebra owns the object.* On main, `TauCetiRoadmap/DerivedModuleAlgebra/README.md`
  §0.5 (line 1339 on) plans this object: square-zero extensions, their isomorphisms, `Exal_A(B,M)`
  and the split class. Its line 97 states that rings are commutative.
- *The overlap was uncited.* This README named neither the pinned declarations nor §0.5.

**Correction to the suggested wording.** The review's contract bullet gives the hypotheses as
"`A`, `B` commutative rings, `M` a `B`-module". That is too weak for the zero class and for
`extensionClass_eq_zero_iff`. Both are declared under the further `variable` line 377 of the pinned
file: `[Module Bᵐᵒᵖ M] [IsCentralScalar B M] [Module A M] [IsScalarTower A B M]`. The contract
bullet states these hypotheses. In this roadmap they hold because of its convention for the
symmetric bimodule of a commutative `R` (§ Conventions, "Bimodules").

**Pattern repaired elsewhere.** The pattern is a commutative special case that has an owner on
main and was left uncited. It also occurs in §3.3, in the first API bullet (line 1023): derivations
correspond to sections of `TrivSqZeroExt A M`. DerivedModuleAlgebra §0.5 owns the commutative case
("`A`-derivations `B → M` are in bijection with `A`-algebra sections of `B ⊕ M → B`"). Its Needs
line names Mathlib's `derivationToSquareZeroEquivLift`.

The repairs:

- A clause on the §3.3 bullet (lines 1025–1028).
- A variants bullet (lines 187–190).
- The extended `HochschildHKR.mem_bimodDerivations_iff_section` statement in the plan.

No statement changed. No other occurrence was found. The search covered "square-zero",
`TrivSqZeroExt`, "split", `Exal` and "section" across the README. §3.5 already cites `TrivSqZeroExt`.

**Ownership against open pull requests.** I ran `roadmaps grep` for `TauCeti\.SquareZeroExtension|TauCeti\.Exal`:
no match on main or at any open head. I also searched for `HH²` near "square-zero". The only match
is CyclicHomologyLieHomologyAndQuasiFreeAlgebras line 22, which is quasi-freeness defined by
lifting and owns no classification. This roadmap therefore stays the owner of the noncommutative
`k`-split classification.

### Adversarial pass on the new and changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `R ⊕_f M` commutative ⇔ `f` symmetric (commutative `R`, symmetric `M`) | general; `k = 0`; `M = 0`; `R = k` | `(a,m)(b,m′) − (b,m′)(a,m) = (ab − ba, am′ + mb + f(a,b) − bm − m′a − f(b,a)) = (0, f(a,b) − f(b,a))`. `k = 0`: all zero. `M = 0`: `f = 0`. `R = k`: `f(a,b) = ab·f(1,1)`, symmetric | holds both ways | none |
| Symmetric `f` ⇒ `R ⊕_f M` is a `TauCeti.SquareZeroExtension k R M` | the structure fields; universes | `CommRing` by the row above. `π` = first projection, a surjective `k`-algebra map with `π(c·(1,−f(1,1))) = c`. `ι(m) = (0,m)` is additive and injective, with range `0 × M = ker π`. `(a,m″)(0,m) = (0, am + f(a,0)) = (0, am)` because `f(a,0) = 0`. Rings in `u = max u u` | holds | none |
| Splittings = sections of (d); class `0` ⇔ `[f] = 0` | `k[x]/(x²)`, `M = k`, `f(x,x) = 1` | A section has `s(x) = (x,c)`, and `(x,c)² = (0, xc + cx + 1) = (0,1) ≠ 0 = s(x²)`. So there is no splitting, the class is nonzero, and `[f] ≠ 0` | holds | none |
| Converse: a pinned extension with a `k`-section is `k`-split, and its `f_s` is symmetric | `ι` linearity; right action | `ι(c•m) = ι(algebraMap c • m) = c•ι(m)` (`ι_algebraMap_smul` with `IsScalarTower k R M`). `ι(m)ι(m′) = ι(π(ι m)•m′) = 0`. `ι(m)·e = ι(π(e)•m) = ι(m·π(e))` because `M` is symmetric. `f_s(a,a′) = f_s(a′,a)` because `E` is commutative | holds | none |
| Coboundaries are symmetric; classes with a symmetric cocycle correspond to commutative `k`-split extensions | `δg`; `δ(∂_x∂_y)` on `k[x,y]` | `δg(a,b) = ag(b) − g(ab) + bg(a) = δg(b,a)`. `δ(∂_x∂_y)(a,b) = −(∂_xa∂_yb + ∂_ya∂_xb)`, symmetric, and in characteristic 2 equal to the worked example's `⟨∂_x,∂_y⟩`. Injectivity follows from (a) and (c); surjectivity holds because `f_s = f` for `s(a) = (a,0)` | holds; agrees with Worked examples | wording made explicit |
| Check, case 2: `ℤ/4 → 𝔽₂` | `k = ℤ`, `R = M = 𝔽₂` | `ι(1) = 2`, additive since `2 + 2 = 0`. `x·2m = 2(x mod 2)m`. An algebra section would need `1 + 1 = 0 ↦ 2 ≠ 0`, so there is none. A `ℤ`-linear `v = s(1)` has `2v = 0`, so `v ∈ {0,2}` and `π(v) = 0 ≠ 1`. `HH²`: `δ¹ = 1`, `δ² = 0`, so `HH² = 0` | holds | none |
| Check, case 3: `f = ∂_x ∪ ∂_y` on `k[x,y]` | cocycle condition; `(x,y)` against `(y,x)` | `δf(a,b,c) = a∂_xb∂_yc − (a∂_xb + b∂_xa)∂_yc + ∂_xa(b∂_yc + c∂_yb) − ∂_xa∂_yb·c = 0`. `f(x,y) = 1`, `f(y,x) = 0`. `(x,0)(y,0) = (xy,1)` and `(y,0)(x,0) = (xy,0)`. The antisymmetric part is a class invariant and equals `1`, so `[f] ≠ 0`. This agrees with the worked example, where `[∂_x ∪ ∂_y]` generates `HH²(𝔽₂[x,y])` | holds | none |
| `HH²(k,M) = 0` ↔ `TauCeti.Exal.subsingleton_self` | `R = k` | Pinned: `Subsingleton (Exal A A N)` with only `[Module A N]`. Contract worded "at most one element", not "one element" | holds | contract wording corrected before submission |
| `derivationToSquareZeroEquivLift` hypotheses | pin, lines 28–29, 44, 71, 116 | `CommSemiring R`, `CommSemiring A`, `CommRing B`, `Algebra R A`, `Algebra R B`, `Algebra A B`, `IsScalarTower R A B`, `I^2 = ⊥`; lifts of `IsScalarTower.toAlgHom R A (B ⧸ I)` | stated as such | none |

## Checks run

- **Dependency check** (final text):

  ```text
  candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
  depcheck: 246 roadmaps, 2245 edges, 0 problem(s)
  ```

  There is no UPWARD and no CYCLE line. No supplier edge was added: DerivedModuleAlgebra (on
  main) was already a supplier, and §0.5 is cited in the scope, not consumed.
- **`roadmaps resolve`**:
  - Cross-roadmap citations found nowhere: none.
  - Lean names found nowhere: none. The earlier lead `TauCeti.StarkSystems.toExteriorBidual` no
    longer appears; it is IntegralIwasawaTheory §12.6's target, unchanged.
  - The tool reported "Lean names outside TauCetiRoadmap were not checked". So I checked every new
    pinned name by hand at the pins, with the files and lines given above.
- **plan.json**: it parses. Only 3.3's first API statement and 3.6's prerequisites, API and tests
  changed.
- **Hygiene of the added text**: no LaTeX delimiters, process words, machine paths or pull-request
  numbers.

## For the maintainer

- No name that other roadmaps cite changed. The target ids, layer titles and plan names are kept.
  One plan API name was added: `HochschildHKR.cohomologyTwoClassification_squareZeroExtension`.
- DerivedModuleAlgebra on main does not record the pinned names `TauCeti.SquareZeroExtension` or
  `TauCeti.Exal` for §0.5. Its own resolution table maps §0.5 to planned names under
  `Algebra.CotangentComplex`. This README therefore says that Tau Ceti "has" these objects at the
  pin, not that they are DerivedModuleAlgebra's formalisation. A later revision of
  DerivedModuleAlgebra may want to record the pinned file.
