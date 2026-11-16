# FIX-PKG-ZagierConjecturePolylogarithms~10

Findings of `REV-PKG-ZagierConjecturePolylogarithms~9` (three findings). Every edit is in `packages/ZagierConjecturePolylogarithms/README.md`; `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## REV-PKG-ZagierConjecturePolylogarithms~9/F01 (P2) — applied

Old (§5.8): one eight-point cochain `h = −(3/28)·Alt₈ D₃₁(r(3,4|2,5,6,7), r(6,7|1,3,4,5))`, stated to remove "its `Λ²B₂` component". New: a homotopy `h` on the seven-vector rows, `−(3/28)·Alt₇ D₃₁(r(1|2,5,6,7), r(2|1,3,4,5))` on `C₇(3)` and `−(1/84)·Alt₇ D₃₁(r(1,2,3,4), r(1,5,6,7))` on `C₇(2)`; `f′ = f − (δ∘h + h∘D)`, every component computed; eight-point element `+3/28`; Checks replaced.

Verification, computed (rows in the table below):

- The map `f` of §5.8 has two `Λ²B₂` components in degree two: the wedge term of `R₇³` on `C₇(3)` and `R₇²` on `C₇(2)` (§4.6). `R₇² ≠ 0`, by the README's own §4.8 Check: `R₇²∘p = −(1/84)·(9X) = −(3/28)X` on `C₈(3)` with `X ≠ 0`. For `N ≥ 5` the row `C₇(2)` is reached: the terms `t_a` of §4.3 with `|a| = N − 5` are seven vectors in dimension five, dual to `C₇(2)`; for `N = 4` (`p = 0`) only the diagonal rows `C_m(m−4)` occur. The source's correction (GR line 4247, p. 93) handles only `C₇(3)`.
- The correction is a chain homotopy because `δ² = 0` and `D² = 0`: `δf′ = fD − δhD = f′D`. On `C₈(4)`, `δ₂₂(𝓛₄R₈⁴) = (wedge of R₇³)∘p = δ₂₂(h)∘p`. On `C₈(3)` it is `−((3/28)X − (3/28)X) = 0`, on `C₈(2)` it is `−R₇²∂ = 0`, and on `C₈(1)` the term is `0`. So by §3.3 the degree-one components lie in `B₄(F)`. On `C₆` and `C₅`, `h = 0`, so degrees three and four are unchanged and §6.1's clause "change only the components in degrees one and two" stays true.
- Sign of the eight-point element. By the §4.8 rule `(Alt₇ g)∘p = −Alt₈ g(8|·)`, `h∘p = −(3/28)·(−Alt₈ …) = +(3/28)·Alt₈ D₃₁(r(8,1|2,5,6,7), r(8,2|1,3,4,5))`. So the review's sign point is right: the old text's `−3/28` would double the wedge instead of cancelling it.
- Gale-dual labels, exact rationals. For `B` the 4×4 Pascal matrix, with `(I|B)` and its dual `(−Bᵀ|I)` (Polylogarithms §3.6, "a dual matrix is `(-Bᵀ,I_{m-q})`", checked at its head), all 70 maximal minors of both are nonzero. `r(8,1|2,5,6,7)` of the dual equals `r(3,4|2,5,6,7)` of the original, both `2`. `r(8,2|1,3,4,5)` equals `r(6,7|1,3,4,5)`, both `9`. Read with the same labels on the original, the values are `3/2` and `19`. On three random rational matrices the two sides were also equal (for example `235/2079` on both sides, against `765431/4035` with the same labels on the original).

How the review's repair was changed:

- I wrote my own wording.
- I added the one-line structural reason that `δ₂₂` vanishes: `f′` is a map of complexes whose degree-two components have no `Λ²B₂` part. The termwise identities stay as a gloss.
- I added that `h` commutes with field embeddings, so `f′` is still a cocycle on the simplicial variety.
- I added the locators GR Theorem 1.14(c) and Corollary 1.15 (p. 16, GR lines 676 and 701), and GR lines 4244–4249.
- I added `§§1.5, 4.6` to *Needs*.
- The review's "random rational matrix" witness cannot be reproduced. I replaced it with the Pascal-matrix Check above, which also gives the values with the labels unchanged.

Pattern search:

- The old eight-point form occurred only in §5.8; Worked examples and §6.1 cite no coefficient.
- §5.9 ("the coboundary of §5.8 has zero residues", Lemma 9.6) stays valid for the new `h`. No divisor `|ab| = 0` makes both arguments of a `C₇(2)` term degenerate, so Lemma 9.6 applies term by term; antisymmetry holds modulo `B₄`, and `res∘δ` vanishes on `B₄`.
- The one simultaneous divisor of the `C₇(3)` row is `|125| = 0`, where `x → 1` and `y → ∞`. It was already present in the source's element, at `|3467| = 0`. Its residue was computed to be zero: the only surviving term is `sp D₂₁` in the case `a = 0 > b`, which is `0` by table (26).
- So §5.9 is unchanged.

## REV-PKG-ZagierConjecturePolylogarithms~9/F02 (P3) — applied

I added an API bullet list before `**Checks.**` in four sections:

- **§3.5:** the special derivations are free data `u_s` with `Σ[X_s,u_s] = 0`, determined up to `ℚX_s`, which matters only in degree one. Commutators stay special, with elements `[u_s,u′_s] + Du′_s − D′u_s`. The duality holds in every weight `m ≥ 1`.
- **§5.4:** local integrability and pushforward; the factors `(πi)^q` and the holomorphic component `−(1/8)dlog…` in weight four; the residue identity, so the map is a map of complexes; levelwise functoriality.
- **§5.6:** alternation of `r₃` and `μ₃`; `a₃` is defined on `A₃` and negated by odd permutations; `δ₃a₃ = (a₂∧a₁)ν` on `A⁰₃`; the collinear limit `−2μ₃`.
- **§5.8:** written for the repaired cocycle.

I reworded the review's text where it was imprecise. It wrote "with `u_s = [u_s,u′_s] + …`", which reuses `u_s` for a new element; I stated the elements of the commutator separately. I also added the centralizer fact and the uniqueness of `u_s` in degree `m ≥ 2`.

Pattern search: I also scanned the other sections without an API sentence: 1.5, 2.5, 3.3, 3.10–3.13, 4.2, 4.8, 5.2, 5.7, 5.9, 5.10, 6.2, 6.3 and 6.5. Most are theorem targets. §4.2 constructs nothing; it imports the flags. §3.13 and §5.7 list their properties as numbered items, (1)–(4) and (i)–(iii). None needed an API list.

## REV-PKG-ZagierConjecturePolylogarithms~9/F03 (P3) — applied

§1.3 locator, old → new: "(29) and (19), p. 12" → "(29), p. 12, GR line 494; the further specialization of (29) to the relations (19) of p. 9, GR line 336, is stated on p. 12, GR line 504".

Checked against the GR text: page 9 runs from GR line 323 to 365, and the display (19) is at line 336. Page 12 runs from line 467 to 523. `(19)` occurs nowhere else in the README or in `sources.toml`.

## Adversarial pass

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §5.8 `δ₂₂h` on `C₇(3)` | coefficient against §4.6 | `δ₂₂h = −(3/28)Alt₇(…)`; `R₇³` wedge `−3/28`; coefficient `1` instead gives `−31/28` | matches | new text |
| §5.8 `δ₂₂h` on `C₇(2)` | against `R₇²` | `−1/84` on both sides | matches | new row of `h` |
| `f′` chain map | `δf′` against `f′D` | both `fD − δhD`, using `δ² = D² = 0` | holds | — |
| degree one on `C₈(4)` | `Λ²B₂` parts | `(3/28)Alt₈W(8|·) − (3/28)Alt₈W(8|·) = 0`; with the old `−3/28`: `(6/28)Alt₈(…)` | vanishes | sign `+3/28` stated |
| degree one on `C₈(3)` | `δ₂₂(−h(∂+p))` | `−((3/28)X + (−3/28)X) = 0` | vanishes | — |
| degree one on `C₈(2)`, `C₈(1)` | `−h∂`; `−hD` | `−R₇²∂ = 0`; `h = 0` on `C₇(1)` and `C₇(0)` is killed, so `0` | vanish | — |
| degrees three and four | `h` on `C₆`, `C₅` | `0`, so `f′ = f` | unchanged | §6.1 still true |
| rows reached, `N = 4, 5, 6` | `t_a`, dimension `N − |a|`, dual `7 − N + |a|` | `N=4`: `C₇(3)` only. `N=5`: `C₇(2), C₇(3)`. `N=6`: `C₇(1), C₇(2), C₇(3)` | `C₇(2)` row needed for `N ≥ 5` | Check added |
| `R₇² ≠ 0` | §4.8 Check | `R₇²∘p = −(3/28)X`, `X ≠ 0` (ratio `−9` in §4.8) | nonzero | — |
| Gale labels | Pascal `B`; random rational `B` | `2 = 2`, `9 = 9`, same labels `3/2`, `19`; `235/2079 = 235/2079` against `765431/4035` | relabelling exact, discriminating | Check added |
| §5.9 residues, `C₇(2)` row | divisors `|ab| = 0` | `{1,2,3,4} ∩ {1,5,6,7} = {1}`: never both arguments | Lemma 9.6 termwise | none |
| §5.9 residues, `C₇(3)` row | `|125| = 0`: `1 − x = −|125||167|/(|127||156|)`, `y` simple pole | terms: `ord(x/y) = 1` with `sp D₂₁ = 0` (case `a=0>b`); `sp S₃(x/y) = 0`; `ord(1−1/y) = 0`; `sp S₃(y) = 0`; total `0` | zero residue | none |
| §3.5 commutator | Jacobi | `[[X,u],u′] − [[X,u′],u] = [X,[u,u′]]` | holds | API bullet |
| §3.5 weight one | `n` punctures besides `a` | derivations `n² − n(n−1)/2 − n = n(n−1)/2`; `CLie` weight one `n(n+1)/2 − n = n(n−1)/2`; `n = 1`: `0` | equal | API bullet |
| §3.5 uniqueness of `u_s` | centralizer in a free Lie algebra | commuting elements span a free abelian subalgebra, of rank ≤ 1 | `u_s` unique for `m ≥ 2`, up to `ℚX_s` for `m = 1` | stated |
| §5.4 holomorphic term | `n = 1, 2, 4` | `(−1)^{n−1}2^{1−n}`: `1`, `−1/2`, `−1/8` | matches the text | — |
| §5.6 coefficients | `r₃ = T₃/3` | `(1/6)` from `r₃` gives `(1/18)` from `T₃`; `−1/3` unchanged | matches §5.6 and Worked examples | — |
| F03 page | GR page markers | (19) at line 336, page 9 (lines 323–365); (29) at 494 and the specialization at 504, page 12 (467–523) | locator fixed | — |

## Checks run

- **Elaboration.** `lake env lean` on `packages/ZagierConjecturePolylogarithms/Suggested.lean`, run from the content checkout: exit 0, two warnings, both "declaration uses sorry" (124:8 `zagier_four_exists`, 133:8 `zagier_four_everyFamily`), nothing else.
- **`#check @name`.** One scratch copy of the file with `#check @name` for all ten declarations, elaborated once: exit 0; `unitVector`, `trilogCyclic`, `TrilogRelationFunction`, `IsCycle4` keep `[Field F]` (and `[AddCommGroup V]`, `[Module ℚ V]` where used); `periodMatrixFour`, `zagierDeterminantFour` and both theorems keep `[Field F] [NumberField F]`; `zagier_four_everyFamily` keeps `hc : ∀ j, IsCycle4 (c j)`; each equals its README §6.4 statement, nothing lost. The file is unchanged this round, and no binder changed.
- **Dependency check:**

```text
depcheck: 237 roadmaps, 2246 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

## Notes for the maintainer

- No Lean name changed, and no name that other roadmaps cite changed. No supplier, gap or merge-order edge was added. The new *Needs* entries `§§1.5, 4.6` are internal.
- I used Polylogarithms §3.6's duality normalization at its open head; the README cites it there and already lists it as a supplier.
- Ownership: the homotopy is part of this roadmap's own Chern cocycle (§5.8), which no other roadmap states. Nothing was moved.
- Source issue, for the record: GR §9.3, item 2 (p. 93, GR line 4247) prints the eight-point element without the factor `3/28` and gives no correction on the row `C₇(2)`. The README now says this in its own words.
