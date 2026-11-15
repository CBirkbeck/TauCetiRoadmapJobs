# Review of NumberFieldEnumeration (pull request #1718 at b4cc7c9)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `TauCetiRoadmap/NumberFieldEnumeration/README.md:630` now distinguishes simple roots, the root count with multiplicity, distinct real roots and real embeddings.
- R02 — repaired: `TauCetiRoadmap/NumberFieldEnumeration/Suggested.lean:74–100` defines explicit canonical data and their projection, states existence and uniqueness, and updates the classification statements and image sets.
- R03 — repaired: `TauCetiRoadmap/NumberFieldEnumeration/Suggested.lean:286` binds `Fact (Irreducible ...)` directly in the composite equality.
- R04 — repaired: `TauCetiRoadmap/NumberFieldEnumeration/Suggested.lean:313` binds `Fact (Irreducible ...)` directly in the prefix equality.

## Verified sound

| Statement | Instances tried | Left-side values | Right-side values | Result; change |
|---|---|---|---|---|
| `CanonicalPolynomial` | `K=ℚ`; `X`, `X−1`, `0` | Keys of defining polynomials: `(0,1,[0,0])`, `(1,1,[1,−1])` | `X` minimizes; `X−1` loses; `0` fails defining membership | Explicit subtype excludes both wrong models |
| `polredabs` | Canonical datum for `ℚ(√5)` | Underlying polynomial `X²−X−1`; norm `3`, discriminant `5` | Projection `X²−X−1`; competitor `X²−5` has norm `10` | Projection preserves the selected polynomial |
| `exists_polredabs` | `ℚ`; `ℚ(√5)` | Minima `X`, `X²−X−1`, with norms `0`, `3` | Canonical-data cardinality `1` in each case | Nonempty in both degrees; no fallback value |
| `polredabs_unique` | `K=ℚ(√5)`; two canonical data | Both minimal keys `(3,5,[1,−1,1,−1])` | Both projections `X²−X−1`; sign competitor has `[1,1,1,−1]` | Equality holds; tie-break remains necessary |
| `polredabs_eq_of_algEquiv` | `ℚ(√5)` and the quotient by `X²−5` | Presentation norms `3` and `10`; field discriminant `5` | Both canonical outputs `X²−X−1`, norm `3` | Explicit data preserve invariance |
| `nonempty_algEquiv_of_polredabs_eq` | Same two models; negative control `ℚ(i)` | Equal outputs `X²−X−1`; control output `X²+1` | Isomorphism sends the quotient root to `√5`; control signatures `(0,1)≠(2,0)` | Converse holds; control fails equality hypothesis |
| Changed cyclotomic Check, §1.2 | `ℚ(ζ₅)`; polynomials `X⁴∓X³+X²∓X+1` | Both norms `4`, absolute discriminants `125` | Sign vectors begin `[1,−1] < [1,1]` | Every canonical datum selects the minus signs |
| `relativeImage` | `F=ℚ,r=2,D=5,Γ=1,R={0,1}`; then `D=0` | Relative bound `1/2+5/2=3`; generating polynomial norm `3` | `X²−X−1` belongs; at `D=0`, `5≤0` fails | Existential canonical data preserve membership and rejection |
| `canonicalPolys` | `(n,D)=(0,1),(1,0),(1,1)` | Field degrees cannot be `0`; rational discriminant `1` | Sets `∅`, `∅`, `{X}`; cardinalities `0,0,1` | Degree and discriminant boundaries preserved |
| `hunterImage` | `n=2,D=4,Γ=1`; then `D=0` | Bound `5/2`; candidates `X²−X+1,X²+1,X²+X+1` | Image `{X²−X+1,X²+1}`; at `D=0`, image `∅` | Three inputs give two canonical outputs; `Fact` supplies quotient fields |
| `hunter_relativeImage_eq_canonicalPolys` | `n=4,D=1008`; quartics `X⁴∓5X²+7`, base `ℚ(√−3)` | Both canonical memberships; norm `4√7≈10.5830` exceeds absolute bound `9.4218` | `m=2,D′=3`; `3²=9≤1008`; relative norm `10.5830≤3+4√7≈13.5830` | Both supplied by relative branch; explicit data and `Fact` preserve it |
| `prefix_characterization` | Prefixes `2.2.5`, `2.0.4`, `2.1.5` | Sets `{X²−X−1}`, `{X²+1}`, `∅` | Root counts `2,0`; quotient discriminants `5,−4`; no quadratic with one real root | Both directions agree after binder repair |
| Root-count explanation, §2.3 | Roots `(1±√5)/2` of `X²−X−1` | Multiplicities `1,1`; total `1+1=2` | Distinct real roots `2`; real embeddings `2` | Corrected count agrees; individual multiplicity remains `1` |

Untouched statement rows stand as in the previous review of `a72fb99`.

- Changed scope: 109 lines; 11 added or changed Lean declarations, including 6 theorem statements; seeded §§1.2 and 2.3 intersect the changes; 0 layer additions, removals or reorderings.
- Sources: 3 locators checked against cached text: `lmfdb-polredabs` lines 90–100, `lmfdb-label` lines 90–100, `lmfdb-discriminant` lines 90–100; 0 new locators.
- Pinned declarations opened: 5, at `Mathlib/FieldTheory/Minpoly/Basic.lean:41`, `Mathlib/RingTheory/AdjoinRoot.lean:920`, `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean:444`, `TauCeti/NumberTheory/NumberField/Index/Basic.lean:70`, `TauCeti/NumberTheory/NumberField/IntrinsicLabel.lean:72`.
- Suppliers: 9 section contracts resolved across NumberFieldArithmetic §§3.1, 3.3, 4.1–4.2, 8.1; EffectiveBounds Layer 2; GeometryOfNumbersAndQuadraticArithmetic §§0.2.1, 0.2.2, 0.3.1; no new supplier or ownership conflict.
- PR text: title, prose and `roadmap-summary` match the new folder's 2 layers, 6 milestones and 34 declarations, including explicit canonical data; 0 discrepancies or outside-folder changes against the merge base.
- Gate: worker gate passes every check at this head. Rerun has only `depcheck: NOT IN ORDER: NumberFieldEnumeration (insert it after its last supplier)`, explicitly exempt in the brief; candidate-order output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`.
- Lean: targeted build and direct elaboration exit 0, with 18 `sorry` warnings only; all 34 `#check @name` signatures inspected, with 0 lost hypotheses; worktree remains clean.
- Padding probes: all 18 targets resist each of `simp`, `rfl`, and `infer_instance`; changed targets require minimum existence, coefficient recovery or field classification beyond the opened pinned declarations.

Overlap check: read NumberFieldArithmetic, PolynomialGaloisGroups and EffectiveBounds from the closest-roadmap lists, plus supplier GeometryOfNumbersAndQuadraticArithmetic; intrinsic arithmetic and prefixes belong to NumberFieldArithmetic, effective Hermite counts to EffectiveBounds, polynomial Galois classification to PolynomialGaloisGroups, and projected lattices to GeometryOfNumbersAndQuadraticArithmetic. The indexed ownership search found no second owner of canonical polynomial selection.

Source independence: changed passages only—9 passages compared with 3 sources, with no copied expression or reused material found; among the 3 checked source locators, `lmfdb-polredabs` has 1 of 3 (tied). No layer changed, so source arrangement and the full-document locator shares were not reopened.

## Not verifiable

- The previous review's unavailable background texts (`hlp1952`, `hermite1850`, `cohen1993`, `pohst1982`) were not reopened; no changed mathematical claim requires them.

## Source issues

- none

## For the human reviewers

- none
