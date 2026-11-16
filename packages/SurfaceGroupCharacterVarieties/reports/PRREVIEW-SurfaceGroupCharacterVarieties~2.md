# Review of SurfaceGroupCharacterVarieties (pull request #2430 at f6c8f48)

**Verdict:** needs changes

## R01 (P3) — the description's dependency blocks omit the new supplier LieGroupsPartII

**Location** Pull request description, prose before the generated blocks: "The open pull requests that must merge first are in the merge order below." The `depends-on` and `merge-order` blocks follow it.

**Claim** This head adds LieGroupsPartII as a supplier. It is an open pull request (#2427), not on main, yet neither block lists it, so the sentence is false at this head.

**Witness** README lines 1565–1566 and 1702–1703 have *Needs:* LieGroupsPartII §§7.1 and 8.1. `depends-on` lists seven pull requests and the `merge-order` chain about 120, none of them #2427.

**Repair** Regenerate both blocks at this head. Add `- [ ] #2427 LieGroupsPartII` to `depends-on`. Insert `#2427 (LieGroupsPartII)` in the `merge-order` chain after `#2229 (RealSemisimpleLieGroups)`, which it cites as a supplier, and before this pull request.

## Previous findings

- R01 — repaired: README line 178 adds a bullet beginning "the self-adjoint linear groups `IsSelfAdjointLinearGroup` … LieGroupsPartII §§7.1, 8.1". Line 667 adds the contract `### From TauCetiRoadmap.LieGroupsPartII`, and lines 1605–1614 add the §5.4 comparison target.
- R02 — repaired: README line 1470 now reads "(Galois descent along `ℂ/ℝ`, as in the proof sketch below; real forms as fixed groups of antiholomorphic involutions: BCGGO2024 lines 467–470)".
- R03 — repaired: `Suggested.lean` lines 338–339 now read "(Layer 7.2, which proves the topological statement; Sikora2012 lines 835–837 for the unique closed orbit in each fibre of the affine quotient)".
- R04 — repaired: `Suggested.lean` lines 48–50 now read "it holds for every `(g, n)`, so no genus enters, but `Mod(S*)` consists of classes of orientation-preserving homeomorphisms, which the pins lack for a topological surface".

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §5.3 `G^ℝ = K exp(𝔭)`, real case (new route through LieGroupsPartII §§8.1, 7.1) | `𝐆 = GL₁` with `G^ℝ = ℝ^×` and with `ℝ_{>0}`; `𝐆 = SO(1,1)` with `G^ℝ = 𝐆(ℝ)⁰` | `ℝ^×`: `K = {±1}`, `−2 = (−1)·exp(log 2)`. `ℝ_{>0}`: `K = {1}`. `SO(1,1)⁰`: `−exp(tY)` has `k = −1`, and both lie outside `G^ℝ` | holds; the step "`k ∈ G^ℝ`" is right | none |
| §5.3 `G(ℂ) = U exp(i𝔲)` through `Res_{ℂ/ℝ}` realified in `GL_{2N}` | `GL₁`; `GL₂` | `a+ib ↦ [[a,−b],[b,a]]`, whose transpose is `ā−ib̄`; `U(1)·exp(ℝ)`. For `GL₂`: hermitian part `Sym₂ ⊕ i·Skew₂`, dimension `3+1 = 4 = dim Herm₂` | holds | none |
| §5.4 comparison: real reductive linear iff `IsSelfAdjointLinearGroup` (new) | `SO(V)`; `ℝ^× ⊂ GL₁`; unitriangular `N`; `{diag(2^k,2^{−k})}`; irrational line in `T²` | `SO`, `ℝ^×` are yes on both sides (1 and 2 components). `N` is no on both (`K exp 𝔭 = {1}`, `E₁₂ᵀ ∉ N`). Discrete group: `K exp 𝔭 = {1}`, infinitely many components. Line: not closed | equivalence holds on each | none |
| §5.4 `symmetricPart G` = symmetric elements of `linearLieAlgebra G` | `G = {1} ⊂ GL₂`, `X = 2πJ`; `SL₂(ℝ)` | `exp X = 1` but `exp(X/4) = J ∉ G`, so both sides are `{0}`. `SL₂`: traceless symmetric on both sides. The Lean bodies match (`∀ t, ∃ g ∈ G, ↑g = exp(t•X)`) | holds for every subgroup | none |
| §5.2 bijection (locator changed) | `(𝔾_m, id)`, `(𝔾_m, inv)`; `F` for `GL₁` | both conjugations are `z ↦ z̄`, `F = ℝ[z, z⁻¹]`, unique `α = inv`. BCGGO2024 lines 467–470 define real forms only | the locator now supports exactly what it is cited for | none |
| `characterVariety_universalHausdorffQuotient` (docstring locator changed) | `Γ = ℤ`, `GL₂`, `ρ(1) = [[1,1],[0,1]]` | `I` lies in the orbit closure, so `q(ρ) = q(I)`; `(tr, det) = (2, 1)` on both; Sikora2012 line 835: one closed orbit per class | holds; signature unchanged | none |
| Non-descent bullet of the module docstring | `(0,3)` with `S₃`; `(1,0)` with `S₃` | `F₂ ↠ S₃` has non-commutative image, so no descent. Every `ℤ² → H` has commutative image, so it descends. No genus enters; `Mod(S*)` is orientation-preserving (README §3.5) | consistent with README §3.5 | none |

Rows for the statements the diff leaves untouched stand as in the previous review, of `077c1ce`.

- Source locators checked against the text: 3 changed locators, all correct. They are BCGGO2024 lines 467–470, Sikora2012 lines 835–837 and BohmLafuente2021 lines 1021–1022 (`G` and `𝔤` closed under transpose).
- Cross-roadmap citations resolved at the head of LieGroupsPartII (e515f2a): §7.1, §8.1 and the standing hypotheses of Layer 8. Its `Suggested.lean` lines 82 and 91 (`IsSelfAdjointLinearGroup`, `linearLieAlgebra`) match the new contract. ReductiveGroupsPartII §RG2.0a.2 was checked on main (README line 1128).
- Gate: every check passes. The dependency check reports `depcheck: 248 roadmaps, 2342 edges, 0 problem(s)`. In the merge order LieGroupsPartII is line 65 and this roadmap line 310, so the new edge points downward. No file outside the folder changed.
- Elaboration: `lake env lean` on `Suggested.lean` gives 13 warnings, all ``declaration uses `sorry` ``. The only Lean change is two docstrings; the elaborated signature of `characterVariety_universalHausdorffQuotient` is unchanged.
- Overlap check: read LieGroupsPartII this round (its scope and §§7.1, 8.1). It owns self-adjoint linear groups and real points as such groups, now cited; this roadmap owns §5.4's `GL(V)` variant and its comparison. The other closest roadmaps, read in the previous review, are untouched by the diff. `overlaps.md` reports no dropped ids.
- Kempf–Ness elsewhere: only TensorProductCombinatorics on main (projective, complex) has it, a different object.
- Declared gaps: none changed by the diff.
- Source independence: changed passages only. 7 passages (scope bullet, LieGroupsPartII contract, §5.2 sentence, §5.3 sketch, §5.4 variant and comparison, two docstrings) compared with 3 sources. The longest shared run is "unique closed orbit" (3 words, Sikora2012 line 835). No layer was added, removed or reordered, so the arrangement was not compared again (previous: largest share BohmLafuente2021, independent).

## Not verifiable

- Knapp2002 (waived): Ch. VI §§1–2, its one remaining locator, in §5.1, which the diff does not change.
- FarbMargalit2012, RichardsonSlodowy1990, Richardson1988 and Goldman1984: waived or uncertified; their locators are in passages the diff does not touch.

## Source issues

- **Misprint** in Sikora2012 at §11, p. 18 (line 836; also lines 141 and 882): the source cites Proposition 30 for the closed-orbit criterion; it should be Theorem 30 (line 572); affects nothing.

## For the human reviewers

- Not tested: FarbMargalit2012 (11 locators), RichardsonSlodowy1990 (4), Knapp2002 (1), Richardson1988 (1) and Goldman1984 (1) could not be read (waived or uncertified). Wording and arrangement were not compared against them.
