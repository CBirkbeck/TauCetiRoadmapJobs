# FIX-DESIGN-FinitenessAndDualityOfGroups~11

Review settled: `REV-DESIGN-FinitenessAndDualityOfGroups~10`. It has three findings: F01 (P1), F02 (P1)
and F03 (P2). All three were verified and repaired.

Files changed:
- `packages/FinitenessAndDualityOfGroups/design/README.md`
- `packages/FinitenessAndDualityOfGroups/design/plan.json`

`sources.toml` is unchanged: no new work is cited, and the locators that are cited did not move. The
review's "For the human reviewers" section lists no finding, and nothing was changed because of it.

## F01 (P1) — applied

Verified. Over the zero ring, `R[H]` with its regular basis indexed by `H = G = ℤ` is the zero
module. So the stabilizer of every spanned submodule is `ℤ`, and it meets the core `ℤ` in `ℤ`. For
`R ≠ 0` the line stabilizer and the index stabilizer agree: `±e_{τ'} ∈ R·e_τ` forces `τ' = τ`.

Old → new (3.1(f)):
- **Old:** "stabilizer of a line spanned by a tensor of basis elements".
- **New:** `F_k = R[H × S_k]`, a free `H`-set basis, with index tuples `T_k` forming a `G`-set.
  `K_τ` is the stabilizer of the tuple and `χ_τ` is the Koszul sign of the graded permutation. Then
  `(Ind F)_k ≅ ⊕_τ Ind_{K_τ}^G(R_{χ_τ})` and `K_τ ∩ N = 1`.
- **Checks:** a zero-ring Check was added, and the sign Check now names the tuple stabilizer.
- **plan.json:** target 3.1 is synchronized and gains the test `zero_ring_index_stabilizer`.

Same pattern elsewhere: the 3.2 route used "free resolution … on `H`-free bases" and
"`Ind_K^G(ℤ_χ)`". It now reads "free `ℤH`-modules with chosen bases" and `Ind_{K_τ}^G(ℤ_{χ_τ})`. No
other section uses tensor or line stabilizers.

## F02 (P1) — applied differently

Verified at the pins and on main:
- **Tau Ceti.** `AbstractSimplicialComplex.barycentricSubdivisionRealizationHomeomorph`
  (`TauCeti/AlgebraicTopology/SimplicialComplex/Subdivision/Homeomorph.lean` line 221) relates two
  realizations of abstract complexes. No file in pinned Tau Ceti mentions both `SSet` and
  `AbstractSimplicialComplex`.
- **Mathlib.** Mathlib's `SimplicialSet/Subdivision.lean` leaves the comparison of `sd` with the
  nerve of nondegenerate simplices as a TODO.
- **Main.** Neither AlgebraicTopology §4.7 nor GeometricTopology §11.1 states the comparison.
- **Open pull requests.** PosetHomotopyAndSubgroupComplexes §3.1 plans it, but that roadmap is open
  and not in the merge order.

Old → new (5.4):
- **Old:** "nerve of the poset of simplices … whose realization is `|K|`".
- **New:** `sd K = nerve (TauCeti.SetLike.Face K)` (nonempty faces only). Its realization is
  homeomorphic to `|K|` in three steps:
  - gap:order-complex-nerve-realization (AlgebraicTopology §4.7);
  - `barycentricSubdivision_eq_orderComplex`;
  - `barycentricSubdivisionRealizationHomeomorph`.
- **Dimension bound:** `PartialOrder.mem_nerve_nonDegenerate_iff_strictMono` gives the bound.
- **Added:** contracts, *Needs:*, Dependencies, the Scope line, the gap in the plan, and the
  edge/hexagon Checks.

Differences from the requested repair:
1. **Narrower contract.** The gap asks only for the homeomorphism for partial orders, affine on
   simplices and the identity on vertices. It omits naturality in monotone maps because 5.4 never
   uses it, and a supplier contract should not ask for more than its consumer needs.
2. **One point is not actionable here.** The request to "record that PosetHomotopyAndSubgroupComplexes
   §3.1 must import this" asks for a change in another roadmap. It is listed under "For the
   maintainer".

The existing gap:simplicial-replacement-dimension is kept separate. No upward citation was added.

## F03 (P2) — applied

Verified. Main's EtaleCohomologyFoundations §F.10.3 (README lines 1330–1340) defines
`Tr^G = ε∘Tr_HS`. It proves `Tr_Λ(γ,P) = |Z_γ|·Tr^{Z_γ}_Λ(γ,P)` without dividing by `|G|`, and it
identifies the commutative HS trace with `LinearMap.projectiveTrace`. Take `Γ̃ = G × ℤ` with `ℤ`
acting trivially and `γ = (g,1)`. Then `Z_γ = C_G(g)` and the left side is `χ_P(g)`.

Old → new (7.2):
- **Old:** an independent proof of `χ_P(g) = |C_G(g)|·r_P([g⁻¹])`.
- **New target:** the comparison `Tr^{C}(g,P) = r_P([g⁻¹])`, proved on the right-coset `RC`-basis.
  `Cx ↦ x⁻¹g⁻¹x` is a bijection onto `[g⁻¹]`, and no division is needed.
- **Consequence:** the character identity follows from the supplier's formula.
- **Also updated:**
  - the Scope bullet, a new §F.10.3 contract bullet, and the Layer 7 Dependencies;
  - in plan.json, target 7.2 (statement, prerequisites and tests) and the supplier's `what`;
  - a new `𝔽_p` no-division Check.

Same pattern elsewhere: 7.1 (the conjugacy-coordinate rank) and 8.2–8.3 (identity-class ranks,
Euler characteristics) are not stated by §F.10.3, so they stay. §F.10.3's coinvariant formula
`Tr(1,P_G) = Σ′ Tr^{Z_γ}` is not restated anywhere here. The only consumer of 7.2 is 7.3(a), which
uses the character identity; it is unchanged.

## Adversarial pass (changed statements)

| Statement | Instances tried | Values computed (each side) | Result / change |
|---|---|---|---|
| 3.1(f) index stabilizer | `R = 0`, `H = G = ℤ`, `F₀ = RH`, basis `{1}` | `T₀ = ℤ` regular, `K = 1`, `K ∩ N = 1`, term `Ind₁^ℤ 0 = 0 = F₀`; line version: stabilizer `ℤ`, `∩N = ℤ` | old false, new holds; Check added |
| 3.1(f) | `R = ℤ`, `H = G`, `F₀ = ℤH` | `T₀ = H`, `K = 1`, `Ind₁^G ℤ = ℤG = F₀` | holds |
| 3.1(f) | `H = 1`, `G = C₂`, `F = R·x` (deg 1) | `T₂ = {(x,x)}`, `K = C₂`, `χ(s) = −1`, term `R_χ`; `N = 1` | holds; over `𝔽₂`, `χ ↦ 1`, the sign-free model |
| 3.1(f) | `H = 1`, `G = C₂`, `F = (Rx →id Ry)` | `T₁ = {(x,y),(y,x)}` one free orbit → `RG`; `T₀ = {(y,y)}`, `K = G`, `χ = 1` → `R`; `T₂`: `R_χ` | matches the contractible Check (`R(x⊗x) → RG → R`) |
| 3.1(f) nonabelian | `G = S₃`, `H = A₃` (normal), `F₀ = ℤA₃`, transversal `1, s` | `a·(x₁,x₂) = (ax₁, a⁻¹x₂)`, `s·(x₁,x₂) = (x₂,x₁)`; 9 tuples = 3 orbits of size 3, each `K ≅ C₂`, `K ∩ A₃ = 1`; ranks `3+3+3 = 9 = 3²` | holds; `K` finite, nontrivial (`G` has torsion) |
| `χ_τ` homomorphism | `K = C₂` on `(x,x)` | `χ(s)² = 1 = χ(s²)` | holds |
| 5.4 `sd K` | `K` = vertex | nerve of one point = `Δ[0]`, realization point = `|K|` | holds |
| 5.4 `sd K` | `K` = edge | `(3,2)` vs `(2,1)` cells, Euler `1 = 1`; `{0,1} ↦` midpoint | holds; Check added |
| 5.4 `sd K` | `K = ∂Δ²` | 6 vertices, 6 edges, no 2-simplex: hexagon, `H₁ = ℤ = H₁(S¹)`; with `∅`: cone, `H₁ = 0` | empty face must be excluded (it is: Mathlib faces are nonempty); Check added |
| 5.4 `sd K` | `K = Δ²` | `7 − 12 + 6 = 1`; top dimension `2 = dim K` | dimension bound `≤ N` holds |
| 5.4 dimension | `dim K = N` | strict chains of nonempty faces have cards in `[1, N+1]`, length `≤ N+1`, simplex dim `≤ N` | holds |
| gap contract | indiscrete preorder on 2 points | order complex an edge, nerve infinite-dimensional | restricted to partial orders; `Face K` is one |
| 7.2 comparison | `P = RG` | `Tr^C = [G:C]·[g=1] = [g=1]`; `r([g⁻¹]) = [g=1]` | holds |
| 7.2 | `S₃` over `ℚ`, trivial `P`, `g` = (12), (123), 1 | `Tr^C = 1/2, 1/3, 1/6`; `r = 3/6, 2/6, 1/6` | holds; `χ = 1` each |
| 7.2 | `S₃` over `ℚ`, sign idempotent, `g` = (12) | `C = C₂`, `g` acts as `−1`, `Tr^C = −1/2`; `r([g]) = 3·(−1/6) = −1/2`; `χ = 2·(−1/2) = −1 = sgn g` | holds |
| 7.2 | `C₃`, `ζ(g) = ω` | `Tr^G = ω·(1/3)`; coefficient of `g⁻¹` in `e`: `ω/3`; of `g`: `ω²/3` | inverse forced |
| 7.2 | `G = 1`, `R = ℚ×ℚ`, `P = R(1,0)` | both `(1,0)`; Mathlib trace `0` | holds |
| 7.2 | `𝔽_p`, `C_p`, `RG`, `g = 1` | `Tr = r = 1`, `χ = p = 0 = p·1` | holds; comparison is stronger (Check added) |
| 7.2 | `R = 0` | all sides `0` | holds |
| supplier specialization | `Γ̃ = G×ℤ`, `γ = (g,1)` | `Z_γ = {h : h(g,1) = (g,1)h} = C_G(g)`; `Tr_R(γ,P) = χ_P(g)` | hypotheses met (`P` finite projective over `RG`) |

## Checks run

Dependency check, as prescribed:

```text
candidate: FinitenessAndDualityOfGroups is not in the merge order yet; checked as if placed after CohomologyOfGroups (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2201 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line.

- **Citation resolver.** `roadmaps resolve` gives the same five leads as before this round and no
  missing Lean name. They are:
  - CohomologyOfGroups §4.6 and MotivicStructuresInModuliOfCurves §2.1, which are board packages;
  - three source locators misread as roadmap names.
- **Pinned names that the tool could not check.** It cannot check names outside TauCetiRoadmap on
  this host, so each name added this round was opened at Tau Ceti `2fd255d9` or Mathlib `1b1ccf4b`:
  - `CategoryTheory.nerve` (`Nerve.lean` line 37)
  - `SSet.toTop` (`SingularSet.lean` line 66)
  - `PartialOrder.mem_nerve_nonDegenerate_iff_strictMono` (`NerveNondegenerate.lean` line 58)
  - `AbstractSimplicialComplex.Realization` (`Realization/Basic.lean` line 71)
  - `TauCeti.SetLike.Face` (`SimplicialComplex/Basic.lean` line 27)
  - `TauCeti.AbstractSimplicialComplex.orderComplex` (`OrderComplex.lean` line 57)
  - `TauCeti.PreAbstractSimplicialComplex.barycentricSubdivision_eq_orderComplex`
    (`Subdivision/Basic.lean` line 76)
  - `AbstractSimplicialComplex.barycentricSubdivisionRealizationHomeomorph` (`Homeomorph.lean`
    line 221)
- **Not run.** There is no `Suggested.lean` at the design stage, so no `#check` comparison and no
  elaboration were run. plan.json parses, and its formatting round-trips unchanged.
- **Ownership.**
  - The order-complex/nerve comparison is assigned to AlgebraicTopology §4.7 by a gap. It is generic
    simplicial-realization theory on main, earlier than every open roadmap.
  - The centralizer formula is imported from EtaleCohomologyFoundations §F.10.3.
  - Signed tensor induction (3.1) stays owned here: the pinned construction is sign-free.
  - Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps show` for
    the comparison only.

## For the maintainer

- **New gap.** `gap:order-complex-nerve-realization`, on AlgebraicTopology §4.7 (on main), needed by
  5.4. When AlgebraicTopology states it, PosetHomotopyAndSubgroupComplexes §3.1, which is open and
  plans the same homeomorphism together with its naturality, would duplicate it. Settling that is
  for that roadmap: cite AlgebraicTopology, or own the naturality only.
- **No id changed.** Targets 3.1, 5.4 and 7.2 keep their numbers and plan names. No supplier was
  added. EtaleCohomologyFoundations §F.10.3 and AlgebraicTopology §4.7 were already suppliers.
- **Review text.** No suspicious instructions were found in it.
