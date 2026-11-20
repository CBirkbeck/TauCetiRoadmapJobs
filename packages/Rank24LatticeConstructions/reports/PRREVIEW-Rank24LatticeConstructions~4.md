# Review of Rank24LatticeConstructions (pull request #2632 at 18f250a)

**Verdict:** accepted

**Summary.** Accepted, with no findings. This is an incremental re-review of the 20 README lines changed since `4e0bd8d`: both small corrections of the previous review are repaired, the new `A₂¹²` statement of §5.2 for monomial automorphisms is true and matches the pinned `monomialEquiv` convention, and the pull-request description agrees with this head. One format note is carried over, not blocking. The human reviewers still decide on the reuse of the Conway–Sloane generator column and on *SPLAG*, which could not be read.

## N01 — The last sentence of §2.1 still uses `|H|` for two different numbers

"With `|H|² = |A_R|` it gives `|H_r|² = |A_R|`" (README line 161) reads as a tautology until one sees that the first `|H|` is the displayed table entry and the second the order of the generated subgroup. "With (displayed order)² = `|A_R|`" would say it.

## Previous findings

The previous review, of `4e0bd8d`, had no findings (no R-numbered remark); its two small corrections and one format note are accounted for here.

- C01 — repaired: §4.1 (lines 352–354) now reads "a bare monomial equivalence of `(ℤ/3)^12` carries neither a proof that it preserves the quadratic form nor a lift to the root lattices, so the statement is made for the lattice isometry".
- C02 — repaired: §5.2 (lines 441–445) now quantifies over "every `u : Fin 12 → (ℤ/3)ˣ` and every permutation `σ` of `Fin 12` such that `monomialEquiv u σ` carries `TernaryGolay.code` onto itself"; the permutations are the case `u ≡ 1`.
- N01 — not repaired: line 161 is unchanged; written again above as N01.

## Verified sound

| statement | instances tried | values computed (README / independent) | result |
| --- | --- | --- | --- |
| §5.2, `A₂¹²` half (changed) | `u ≡ −1`, `σ = id`; `u ≡ 1`; general `(u, σ)` conjugated to table coordinates | `−1` on `A₂` sends label 1 to 2, both of norm 2/3, and `−C = C` for a linear code; `u ≡ 1` is the coordinate permutation (`monomialEquiv_one`, `LinearAlgebra/Monomial.lean:67`); table sign `ε_{σ(i)}·u_i·ε_i = ±1` | holds |
| §5.2 convention of `monomialEquiv` | pin's evaluation lemma against the README's description in the contracts ("scales a source coordinate before moving it") | `monomialEquiv u e x j = u (e.symm j) * x (e.symm j)` (`LinearAlgebra/Monomial.lean:57`): scale at source `i`, place at `e i`; agrees | holds |
| §5.2 against the `D₄⁶` analogue | hypothesis shape of the pinned declaration | `d4SixHexacodeAutIsometry` takes `monomialEquiv u σ ∈ monomialAut (Hexacode.code ω)` (`Rank24/D4Six/CodeAutomorphism.lean:177`); table sign there `c(σa)⁻¹·u a·c a`, same shape as above | consistent |
| §4.1 sentence (changed) | scalars `±1` of `ℤ/3` on `A₂` labels | `μ([1]) = μ([2]) = 2/3`, so every monomial map preserves `q`; the new sentence no longer denies this | holds |
| §4.1 coordinate action | pinned `a2TwelfthGolayIsometry_apply` | `(Tw)_j = ε_j · w_{p(j)}` (`Rank24/A2Twelfth.lean:147`), with `p = [0,4,7,10,9,5,1,8,6,11,3,2]`, `ε = [1,2,2,1,1,1,1,2,2,1,2,1]` as the README displays | holds |

The rows of the previous review for the untouched statements stand as in that review, of `4e0bd8d`; the diff changes no Lean statement.

- Library declarations opened at the pin for the changed passages: `monomialEquiv` and its evaluation lemmas (`LinearAlgebra/Monomial.lean:51–67`), `monomialAut` (`InformationTheory/Coding/Equivalence.lean:448`), `d4SixHexacodeAutIsometry` (`Rank24/D4Six/CodeAutomorphism.lean:177`), `a2TwelfthGolayIsometry` (`Rank24/A2Twelfth.lean:134`), `a2TwelfthGlueModuleIsometry` (`Rank24/Glue/IdentifiedRows.lean:127`), `DynkinType.gluedLatticePiIsometry` (`RootLattice/Glued.lean:386`). The name added to the *Needs:* line of §5.2, `monomialEquiv`, is listed in the Tau Ceti contracts (README line 678).
- Source locators: the changed passages keep their locators (*SPLAG* Chapter 16 §1; Ebeling Chapters 1 and 3), both not readable; no new locator was added.
- Cross-roadmap citations: none added or changed. The one inbound link by anchor (CFSGBasicProperties on main, to the Layer 6 heading) still resolves; the six layer headings at this head are Layers 2–6 as on main.
- Dependency check: `depcheck: 200 roadmaps, 2197 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks re-run at this head: every count zero; no file changes outside the folder.
- Elaboration: `Suggested.lean` gives eight `sorry` warnings and nothing else; the file did not change since `4e0bd8d`, and the eight elaborated types are as compared there.
- Pull-request description against this head: 15 Checks (3, 1, 2, 1, 2, 1, 2, 3 by section), eight theorems, two Tau Ceti imports, Layers 2–6 kept with Layer 1 forming no layer, the roadmap on main revised and `Suggested.lean` rewritten; its §5.2 bullet states the widening to monomial automorphisms of the ternary Golay code, and its §4.1 bullet ("content unchanged") is right. No sentence is contradicted and no change is left unstated.

Overlap check: read OrthogonalTamagawaAndLatticeMass, IntegralLattices, LevelOneAutomorphicFormsForClassicalGroups, BoundsOnCodes, LatticePackingsAndPerfectForms, AlgebraicCodingTheory, ThetaSeries as in the previous review; nothing shared. The change adds no object: the monomial symmetries of the ternary Golay code act on a lattice owned here, and `monomialEquiv` and `monomialAut` are cited from Tau Ceti, not restated.

Source independence: changed passages only; 2 passages compared (the §4.1 sentence and the §5.2 statement), with no readable source at their locators (*SPLAG* and Ebeling are not readable), and against CS82 §4 and Che20 §5.3, which contain neither; none shared. Largest share *SPLAG*, 11 of 20 locator sites, text and contents not readable; no layer was added, removed or reordered.

Research link: the 23 glued lattices with their glue codes and the Leech lattice are Niemeier's 1973 list in the Conway–Sloane (1982) form; Chenevier (2020, §5.3) takes exactly these Lagrangians as input for the characteristic masses of Niemeier lattices. Rests on the README's References and on CS82 §4 and Che20 §5.3, both read.

## Not verifiable

- *SPLAG* (Conway–Sloane 1999) Chapter 16 §1 and Ebeling 2013 Chapters 1 and 3, the locators of the two changed passages: recorded as paywalled, no legal open copy. The changed statements were checked by computation and against the pinned library instead.

## Source issues

- none

## For the human reviewers

- Reuse: the generator column of the Layer 2 table (README lines 119–141) carries the 23 generator entries of Conway–Sloane 1982 Table V (CS82 lines 358–379), in its notation and row order; the table is already on main in this form.
- Not tested: *SPLAG*, the source with the largest share of locators (11 of 20 sites), could not be read legally; its wording and table of contents were not compared.
- Scope fact: the `Suggested.lean` docstring (lines 46–51) says the six Layer 2–3 statements follow from pinned row theorems by case analysis; the roadmap's other new targets are §3.3, §4.1, §5.1, §5.2 and §6.1.
