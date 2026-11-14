# Repair report: FIX-DESIGN-CohomologyOfGroups~8

Files changed:

- `packages/CohomologyOfGroups/design/README.md`
- `packages/CohomologyOfGroups/design/plan.json`

`packages/CohomologyOfGroups/sources.toml` is unchanged. The manifest already records Loh19
Thm. 3.2.22 and Cor. 3.2.23 for Target 5.1, and no new work is cited.

One review (`REV-DESIGN-CohomologyOfGroups~7`) with one finding, F01 (P2). It was checked against:

- Loh19 line 5854–5866 (Thm. 3.2.22, printed p. 135);
- Tau Ceti at the pin: `TauCeti/Algebra/Homology/Monoidal/Homology/Kunneth/Sequence.lean`, lines 18–50, 270, 307, 729 and 786–793;
- DerivedModuleAlgebra on main, §0.2 and §S.1;
- a direct computation.

The design stage has no `Suggested.lean`. No Lean declaration was added, changed or elaborated, so
the `#check @name` binder audit had nothing to run on. The review's "For the human reviewers" and
"Source issues" sections contain no finding and changed nothing. No text read in this job
contained instructions.

## F01 (P2) — applied differently

**Verified.** Loh19 Thm. 3.2.22 covers a principal ideal domain, one complex of flat modules and an arbitrary second complex. It gives a natural sequence that splits, but not naturally. The roadmap's sequence required `N` projective, and its splitting also required `M` projective. The witness is correct: `ℤ[1/3]` is flat but not projective, and `M = 𝔽₂` is not projective, so the stated theorem said nothing. The numbers check out: `𝔽₂² → 𝔽₂³ → 𝔽₂` in degree 2. The degree-1 and degree-3 values are recomputed below.

**Change (README §5.1 and plan 5.1).** The hypothesis "`N` projective; split when `M` is also projective" became "`k` of global dimension ≤ 1 and one of `M`, `N` flat over `k`". The sequence is now stated as exact, natural, and split (not naturally). Added:

- a route: `gap:flat-kunneth` for flat `N`; exchange the factors for flat `M`; Tau Ceti handles the projective case directly;
- two Checks: the `ℤ[1/3]` witness, and the negative control `G = H = 1`, `M = N = ℤ/2`.

The scope bullet, the Tau Ceti contract (now also naming `homologyKunnethShortComplexSplitting`), the Layer 5 Dependencies, the plan's supplier entry and the plan's `gaps` were updated to match.

**What differs from the suggested repair, and why.**

- *Ring class.* The review asked for the flat clause over a principal ideal domain only. The statement is true whenever `k` has global dimension ≤ 1, which is the class the roadmap already uses for 5.1 and 5.2:
  - Exactness: over such `k`, submodules of flat modules are flat, so `C(H; N)` has flat boundaries.
  - Splitting: replace both complexes by ℕ-indexed complexes of projectives. Tensoring with a bounded-below flat complex keeps quasi-isomorphisms, and the projective complexes have split cycles, so Tau Ceti's splitting carries over.
  - Narrowing to a PID would have created two tiers of hypothesis with no mathematical reason.
- *Supplier section.* The gap goes to DerivedModuleAlgebra **§0.2** (derived tensor products, K-flat models), not §S.1. §S.1 is the double-complex spectral sequence. The Künneth sequence is the homology of a tensor product with a K-flat complex, which is §0.2's object. §0.2 has no Künneth sequence (grep of its README on main), and no open pull request revises DerivedModuleAlgebra.

**Ownership.** I searched main and the open heads (`roadmaps grep`) for a Künneth sequence with a flat complex, by object. AlgebraicTopology §5.1 consumes Tau Ceti's singular Künneth and is not an owner for arbitrary complexes, and no other roadmap owns it. DerivedModuleAlgebra (on main) owns K-flat models and the derived tensor product, so the generic theorem is requested there as `gap:flat-kunneth`. The group-homology application stays in 5.1.

**Pattern.** I searched for the same projective-only restriction elsewhere and found nothing to change:

- 5.2 takes an arbitrary `A` in degree 0 against the free `C(G; k)`.
- 5.3 and the products in 5.4 are over a field.
- 3.1 (Layer 3) correctly uses flatness in homology and projectivity in cohomology.
- No consumer inside the roadmap (5.3, 5.4, 6.3) used the old hypothesis.

## Checks run

Dependency check:

```text
candidate: CohomologyOfGroups is not in the merge order yet; checked as if placed after IntegralIwasawaTheoryPartII (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2173 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The new supplier edge (DerivedModuleAlgebra §0.2) points to a roadmap on main.

Other checks:

- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- `HomologicalComplex.homologyKunnethShortComplexSplitting` exists at the Tau Ceti pin (`Sequence.lean:793`).
- `plan.json` parses: 2 gaps and 139 tests (137 + 2).

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result, change |
|---|---|---|---|
| 5.1 sequence, flat `N` | `k = ℤ`, `G = H = ℤ/2`, `M = 𝔽₂`, `N = ℤ[1/3]`, `n = 0,1,2,3` | Tensor + Tor = middle in each degree. n=0: 1+0 = 1 = `dim H₀`. n=1: 2+0 = 2. n=2: 2+1 = 3. n=3: 3+1 = 4 = `dim H₃(V₄, 𝔽₂)` | Holds; added as a Check |
| 5.1, no flat factor | `G = H = 1`, `M = N = ℤ/2` over ℤ | Middle `H₁ = 0`; Tor term `ℤ/2` | Fails, so the hypothesis is needed; added as a negative Check |
| 5.1, global dimension | `k = ℤ/4`, `G = 1`, `M = ℤ/2`, `H = ℤ/2`, `N = ℤ/4` (free) | `H_*(ℤ/2, ℤ/4) = ℤ/4, ℤ/2, ℤ/2, …`; actual `H₂ = ℤ/2`; formula `ℤ/2 ⊕ Tor₁^{ℤ/4}(ℤ/2, ℤ/2)` has order 4 | Fails, so "global dimension ≤ 1" is needed and kept |
| 5.1, flat `M` (exchange) | `M = ℤ[1/3]`, `N = 𝔽₂`, `G = H = ℤ/2` | Same values as row 1, with `Tor₁` symmetric; the cross product changes by `(−1)^{pq}` on each summand | Exactness is preserved |
| 5.1 splitting | `M = 𝔽₂`, `N = ℤ` over ℤ, `G = H = ℤ/2`, n=2 | Tensor `0 ⊕ ℤ/2 ⊕ ℤ/2` and Tor `ℤ/2` give `(ℤ/2)³ = H₂(V₄, 𝔽₂)`, elementary abelian, not `ℤ/4 ⊕ ℤ/2` | Consistent with the general splitting |
| 5.1 degenerate rings | field `k`; zero ring | Field: Tor = 0 and the cross product is an isomorphism, as in the field clause. Zero ring: every term is 0 | Consistent |
| 5.1, existing projective case | `k = ℤ`, `M = N = ℤ`, `G = H = ℤ/2`, n=2,3 | n=2: `H₁⊗H₁ = ℤ/2`, Tor 0. n=3: two tensor `ℤ/2` and `Tor₁(ℤ/2, ℤ/2)`, giving `(ℤ/2)³` | Existing Checks unchanged |
| `gap:flat-kunneth` | `K = ℤ/2[0]`, `L = (ℤ →2 ℤ)`; `ℤ/4` instance above | `K ⊗ L = (ℤ/2 →0 ℤ/2)`: `H₀ = ℤ/2 ⊗ ℤ/2`, `H₁ = Tor₁(ℤ/2, ℤ/2) = ℤ/2`. Over `ℤ/4` it fails | Hypotheses are the right ones |
| Route of the gap | the quasi-isomorphisms `K′ ⊗ L′ → K′ ⊗ L → K ⊗ L` | First map: tensoring with `K′` (bounded-below projective) applied to `L′ → L`. Second map: tensoring with `L` (bounded-below flat) applied to `K′ → K`. Projective complexes over a hereditary ring have projective cycles and boundaries and split cycles | Valid; no circular input |
| Tau Ceti contract text | `Sequence.lean` lines 270, 307, 786 | Lines 270 and 307 require projective cycles and a projective cokernel of `iCycles` in `L`; line 786 requires split `iCycles` in `K` | The contract wording now matches the pin |

## For the maintainer

- New supplier gap `gap:flat-kunneth`, for DerivedModuleAlgebra §0.2. It is a request on a roadmap that is on main. DerivedModuleAlgebra (or a Part II of it) must state the Künneth sequence for an ℕ-indexed complex of flat modules over a commutative ring of global dimension ≤ 1, natural and split (not naturally). The gap's README line gives a route.
- No name that another roadmap cites was changed. Target 5.1 keeps its id and name.
- Ownership against open pull requests was checked with the roadmap tool's `grep` over every open head.
