# Review of ModularCharactersAndBlocks (pull request #2534 at c59fc36)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** accepted

**Summary.** Accepted, with no findings. The head is the one the previous review read, so there was nothing to repair; this round rechecked every statement independently. The fifteen Lean statements, the sampled locators in Webb, Martínez and Sambale, and the worked examples all agree with what the README says. Two small corrections (a definition in `Suggested.lean` that no statement uses, and a misleading reason in its module docstring) and one format note remain, none blocking. The human reviewers have two licence questions to decide.

## C01 — `blockCharacters` is declared in `Suggested.lean` but no statement there uses it, so nothing tests its body

`Suggested.lean` keeps only the definitions its headline statements need. `blockCharacters` (line 267) occurs nowhere else in the file: with a wrong body (the block acting as `0` instead of the identity, or complex characters in place of `K`-valued ones) every declaration would still elaborate. Its two Checks (README lines 784–790) are prose only. ModularCharactersAndBlocksPartII restates the same body in its own file, so an error here would be copied there.

The smallest repair would state one result of §4.2 about it, under the hypotheses of `exists_blockIdempotent_iff_centralCharacter_congr`. Options: for a block idempotent `e_B` of `O[G]`, the character of an irreducible `K`-representation lies in `blockCharacters e_B` exactly when it does not vanish at `e_B`; or the sets `blockCharacters e_B` are nonempty and pairwise disjoint over distinct block idempotents; or Osima's linkage criterion. If the definition is kept only because ModularCharactersAndBlocksPartII cites the name, the module docstring could say that instead.

## C02 — The module docstring's reason for omitting the spanning half of the basis theorem names something the pins do not lack

The docstring (lines 34–37) says the spanning half "needs a complete family of simple modules indexed together with the `p`-regular classes". A reader concludes it cannot be stated at the pins. It can: `brauerCharacter` is defined in the file, a complete family is written exactly as in `card_simpleModules_eq_card_pRegularClasses` (or as the hypothesis `hexh` of `span_decompositionRows_eq_top`), and spanning needs no indexing by classes. What is true is that spanning adds nothing to the two stated halves. The count gives as many simple modules as `p`-regular classes, `linearIndependent_brauerCharacter` makes their Brauer characters independent, and by §2.1 they are class functions on the `p`-regular elements, a space of that dimension.

Suggested wording: "not stated separately: it follows from `card_simpleModules_eq_card_pRegularClasses` and `linearIndependent_brauerCharacter` by counting dimensions". Stating it would also do.

## N01 — The *Needs:* lines of §2.1 and §2.3 point at each other

§2.1's line (README lines 348–351) lists §2.3 for linear independence over a field that is not algebraically closed, and §2.3's line (line 456) lists all of §2.1. Line 338 explains that §2.3 uses only recognition over algebraically closed fields, which is imported. §2.3's line could say so: "recognition over algebraically closed fields (§2.1, from GL2AutomorphicRepresentationsAndTransfer §R17.5.11)".

## Verified sound

| Row | Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- | --- |
| A01 | 0.2 block idempotents; `complete_blockIdempotents_unique` (webb 12.1.1–12.1.3, pdf 234–235 = pp. 227–228; martinez 2.11, p. 15) | `𝔽₃[C₂]`; `𝔽₂[C₃] → 𝔽₄[C₃]` | `(1+t)/2 = 2(1+t) = −(1+t)`; `(1+α²r+αr²) + (1+αr+α²r²) = 2 + (α+α²)(r+r²) = r+r²` | Pass | none |
| A02 | 0.3 cores; `pPrimeCore` | `S₃`, `A₄`; `H = ⟨(12)⟩`; `H = ⊤` | `O_{2'}(S₃) = C₃`, `O_{3'}(S₃) = 1`, `O_{3'}(A₄) = V₄`; `N.subgroupOf ⊤` normal iff `N` normal; infinite `N` has `Nat.card = 0`, excluded | Pass | none |
| A03 | 1.1 splitting system (webb §9.4 pdf 155 = p. 148; 10.1.1 pdf 177 = p. 170) | `e = 3`, `p = 7`; `e = 1`, `p = 5` | `2³ = 8 ≡ 1`, `4³ = 64 ≡ 1 mod 7`; `ℚ` has 2 roots of unity, `ℚ₅` has 4 | Pass | none |
| A04 | 1.2 lattices (webb 9.4.8 pdf 160 = p. 153; martinez 1.7, 1.8, p. 4) | `C₂`, `p = 2`; `G = 1` | `t` acts as `1` and `−1 = 1` on `O(1+t) ⊕ O(1−t)`: `k ⊕ k`; both lattices class `2`; `O`, `mO` class `1` | Pass | none |
| A05 | 1.3; `existsUnique_blockIdempotent_map_residue` | `ℤ₂[C₃]`; a complete family of lifts | `1/3 ≡ 1`, `2/3 ≡ 0`, `−1/3 ≡ 1 mod 2`; `1 − ∑ b_i` is idempotent, reduces to `0`, so is `0` | Pass | none |
| A06 | 2.1 `brauerCharacter` (webb §10.1 lines 7159–7165, p. 170; 10.1.3 pp. 170–171; martinez p. 37 for induction) | `C₃/𝔽₄`; `𝔽₂²` trivial; `Ind_1^{S₃}(1)`, `p = 2` | `1, ζ₃, ζ₃²`; value `2` against trace `0`; `(6, 0) = 2(1,1) + 2(2,−1)` | Pass | none |
| A07 | `linearIndependent_brauerCharacter` (webb 10.2.2, p. 176, for a splitting field) | `C₃` over `𝔽₄`; over `𝔽₂`; empty `ι` | Vandermonde in `1, ζ₃, ζ₃²` nonzero; no `τ` since `|μ₃(𝔽₂)| = 1 ≠ 3`; empty family independent | Pass | none |
| A08 | 2.2; `card_simpleModules_eq_card_pRegularClasses` (webb 9.3.6 pdf 154 = p. 147; 9.3.1–9.3.5) | `S₃`, `p = 2, 3`; `C₃/𝔽₂` | `2 = 2` both primes; `(t−1)² = 0` so `t ≡ 1 mod T`; non-splitting `2 ≠ 3` | Pass | C02 |
| A09 | 2.3 residue splitting (webb 9.2.7 pdf 151 = p. 144; Exercises 4, 8(a) pdf 172–173 = pp. 165–166) | descent dimension count; `𝔽₂(T)`, `C₃` | `dim k̄₀⊗k₁ = d`, matrix algebra `d²`, so `d = 1`; `X²+X+1` irreducible over `𝔽₂(T)`: simples of dimensions 1, 2 | Pass | N01 |
| A10 | `span_decompositionRows_eq_top` | `S₃`, `p = 3`; `q`-elementary `E = C × Q`, `p ∣ |C|` | rows `(1,0), (0,1), (1,1)` span `ℤ²`, Cartan columns index `3`; Sylow `p` of `E` central, `E/P` a `p'`-group, simples lift | Pass | none |
| A11 | 3.1 pairing; `cartanMatrix_eq_transpose_mul_decomposition` (webb 10.2.1 pdf 181 = p. 174; 9.5.4, 9.5.6 pp. 159–160) | `S₃`, `p = 2, 3`; `C₄/ℤ₂` | `(2·1 + 2·2)/6 = 1`, `(4 − 4)/6 = 0`; `DᵀD = [[2,1],[1,2]]`; non-splitting `DᵀD = 6 ≠ 4 = C` | Pass | none |
| A12 | 4.1 `e_χ` (webb 3.6.2 pdf 49 = p. 42) | `C₂/ℚ₂`; `C₃` | `e₊e₋ = (1 − t²)/4 = 0`; `∑_j ζ₃^{−j} = 0` gives `∑ e_j = 1` | Pass | none |
| A13 | 4.2; `exists_blockIdempotent_iff_centralCharacter_congr`; `SameBlock` (martinez 2.1 p. 9, 2.2 p. 10, 2.11–2.12 pp. 15–16; sambale 1.6 p. 15) | `S₃`, `M ∋ 2`, `M ∋ 3`; `C₃`; `ℂ[[t]]` | `ω = 3, −3, 0`: `−6 ∈ M`, `−3 ∉ M`; `2(−1/2 − 1) = −3`; `(1−ζ₃)² = −3ζ₃`; residue char `0`: congruence is equality | Pass | none |
| A14 | 4.2 `blockCharacters`, Osima linkage | `S₃/ℤ₂[ζ₃]`; `p = 2, 3` | `(1+r+r²)/3` acts `1, 1, 0`; sums `1+2 = 3`, `2−2 = 0`; `2 + 3·0 = 2`; `f_A` coefficients in `O` since `|G|_p ∣ Φ^A(1)` | Pass; no statement uses the definition | C01 |
| A15 | 5.1 generalized decomposition numbers (sambale 1.9, p. 15); 5.2 | `S₃`, `p = 3`; `p = 2` | `d^r = (1, 1, −1)`; `det Q = −3`, `Q*Q = diag([[2,1],[1,2]], 3)`; `p = 2`: `Q*Q = diag(2, 1, 2)` | Pass | none |
| A16 | `brauerProjection_mul` (webb 12.4.1, 12.5.3) | `S₃`, `P = ⟨t⟩`, char 2; over `ℚ`; `P = C₃` | `x = r+r²`: `x² = x`, both sides `0`; `ℚ`: `2 ≠ 0`; `(∑ t_i)² = 3(1+r+r²)`, projection `1+r+r² ≠ 0` | Pass | none |
| A17 | 6.2 `IsDefectGroup`; `isDefectGroup_conj` (webb 12.5.2 p. 244, 12.5.5 p. 246, 12.4.5 p. 241; sambale 1.4–1.5 p. 14; martinez 3.2, 4.3) | `S₃`, `p = 2`; `C₃`, `p = 2` | `Br_{⟨t⟩}(1+r+r²) = 1`, `Br_{⟨t⟩}(r+r²) = 0`; without the `p`-group condition `C₃` would be maximal | Pass | none |
| A18 | `isDefectGroup_iff_sylow_of_augmentation_ne_zero` (webb 12.4.7 pdf 249 = p. 242) | any `p`-subgroup `P` | `P`-orbits off `C_G(P)` have size divisible by `p`, so `aug(e) = aug(Br_P(e)) ≠ 0`; maximal `p`-subgroups are Sylow | Pass | none |
| A19 | `blockDefect`, `card_eq_pow_blockDefect` | `S₃`, `p = 2`; `e = 0` | `{d : 2 = 2^d} = {1}`; block `r+r²`: `{0}`; `e = 0`: empty set, `sSup = 0`; one-tactic probe does not close | Pass | none |
| A20 | 6.2 `O`-form, defect zero, direct products | `ℤ₂[S₃]`; `𝔽₂[S₃]`; `S₃ × C₂` | `(6 − 3(r+r²))/9 = (2−r−r²)/3`; `Tr_1` coefficient `|C_G(c)|·∑`: `6, 3, 2`; defect `1 + 0` | Pass | none |
| A21 | `brauerCorrespondent`, `brauer_first_main` (webb 12.6.4 pdf 257 = p. 250; martinez 4.5, 4.6 p. 26, 4.10 p. 27; sambale 1.12 p. 16) | `S₃`, `D = ⟨t⟩`; `D = 1`; `S₅`, `p = 3` | `Br_D(1+r+r²) = 1`; identity for `D = 1`; `3`-cores `(2)`, `(1,1)`, `(3,1,1)`: two blocks of defect group `D`; `χ_{(4,1)}(s) = 2` | Pass | none |
| A22 | 7.2 second main theorem, block form; `sum_sameBlock_mul_conj_eq_zero` (sambale 1.11, 1.13, 1.14 p. 16; martinez 2.4 p. 11) | `S₃`, `p = 2` | `g=1`, `h=(12)`: `1·1 + 1·(−1) = 0`; `g=h=1`: `2 + 4 = 6`; `u ∈ D_b`, so `C_G(D_b) ≤ C_G(u)` | Pass | none |
| A23 | 7.3; `brauer_third_main_local` (sambale 1.15 p. 17; martinez 5.9 p. 35) | `P = 1`; `S₃`, `P = H = ⟨t⟩` | `e₀b ≠ 0` iff `b = e₀`; `Br_P(e₀)·1 = 1`, augmentation `1`; `Br_P(e₀)` is `N_G(P)`-fixed, so central in `k[H]` | Pass | none |
| A24 | 8.3; `mem_pPrimeCore_iff_forall_principalBlock` | `S₃`, `p = 2, 3`; `C_p` | `ker 1 ∩ ker sgn = C₃`; `std` faithful: `1`; `Φ_1` constant and nonzero on the intersection, so it is a `p'`-group | Pass | none |
| A25 | 8.4 interfaces | GlaubermanZStar head `d642d3e` | it cites `§0.3`, `M1`, `M4`, `M8`; all resolve through lines 53–54 and §0.3; its Lean file has no `pPrimeCore` | Pass | none |
| A26 | 8.2 inflation and covering | `S₃`, `N = C₃` | `(1 − 3 + 2)/6 = 0`, `(1 + 3 + 2)/6 = 1`; `e_α + e_{α²} = 2 + (α²+α)(r+r²) = r+r²` | Pass | none |
| A27 | 2.4 `p ∤ |G|` without splitting | `C₃/ℤ₂`; `ℤ_(7)` | simples `1, 2` on both sides, `D = I₂`; not complete: `2` against `3` simples | Pass | none |
| A28 | module docstring, spanning half | count against independence | `#simples = #p`-regular classes `= dim`; an independent family of that size spans | Reason misleads | C02 |

- Source locators checked against the text: 84 (webb 40, martinez 31, sambale 13), every label at its page; 34 statements read in full. Webb's printed page is the PDF page minus 7, Martínez's minus 8, Sambale's equals it. All support the statements as written.
- Library declarations opened at the pins: `TauCeti.cartanMatrix` (`RepresentationTheory/GrothendieckGroup/CartanMatrix.lean:138`, entry `[P j : S i]`), `TauCeti.IsPrimitiveIdempotent` (`RingTheory/Idempotents/Primitive/Basic.lean:89`), `card_eq_card_of_isPrimitiveIdempotent` (`Primitive/Decomposition.lean:199`, cardinality only), and 30 further cited names found at the files the README gives (among them `IsAdicComplete.henselianRing`, Mathlib `RingTheory/Henselian.lean:154`; `littleWedderburn`, `RingTheory/LittleWedderburn.lean:169`; `Representation.ofQuotient`, `RepresentationTheory/Basic.lean:352`). Neither library defines a Brauer character, a defect group, a Brauer homomorphism or a `p`-core.
- Cross-roadmap citations resolved on main (`faef063`): GL2AutomorphicRepresentationsAndTransfer §R17.5.11 (line 2943, "owned here") and §R17.5.12 (2958); OddOrderTheorem §1.1 (316–334, matching the contract); ArithmeticGaloisDuality §R02.4.4 (target at 3650); RamificationOfCompleteDiscretelyValuedFields §4a.3 (1185); CharacterTheory §§3.5, 4.3, 4.5 (497, 741, 817); QuiverRepresentations Layer 3 (507); GrothendieckEulerForms Layers 2, 4 (352, 602). None of the four non-family suppliers cites this roadmap.
- Dependency check output: `depcheck: 200 roadmaps, 2201 edges, 0 problem(s)`. No upward citation, no cycle.
- Elaboration: `Suggested.lean` exits 0 with 15 warnings, all `declaration uses sorry`. All signatures carry their binders explicitly (no `variable` block), and each was read against its README statement. A scratch copy trying `rfl`, then `simp`, on all 15 statements closes none.
- Automatic checks: all passed at this head. No change outside the folder against the base; the family index equals main's.
- Pull-request text: title and description read against the head and the diff; the six added declarations, the restated `pPrimeCore`, the new supplier OddOrderTheorem and the reordering are all stated. Nothing to correct.

Overlap check: read ModularCharactersAndBlocksPartII (`765678c`), GlaubermanZStar (`d642d3e`) and LocalFiniteGroupTheory (open), ModularInduction, CharacterTheory, OddOrderTheorem and GL2AutomorphicRepresentationsAndTransfer (main). Shared objects and their owners:
- `π`-cores: OddOrderTheorem §1.1; §0.3 cites it and adds nothing. LocalFiniteGroupTheory also plans them, which is between it and OddOrderTheorem.
- The Brauer character over algebraically closed fields, recognition, the cover–simple pairing, linear independence: GL2AutomorphicRepresentationsAndTransfer §R17.5.11. This roadmap owns the extension to other fields.
- `blockCharacters`, `IsDefectGroup`, the defect, the Brauer correspondent: this roadmap. PartII cites §§4.2, 6.2, 7.1 and repeats two bodies in its own namespace, so no fully qualified name is shared.
- The decomposition map: a kept variant of ArithmeticGaloisDuality §R02.4.4, with the difference stated (any `p`-modular system; integral surjectivity).

Source independence: 84 locators checked, plus 8 further passages compared with 3 sources (the §2.1 definition against webb lines 7159–7165; the §3.1 route against webb 7392–7419; the §2.2 route against webb 6170–6183; defect classes in §6.2 against martinez 696–704; §4.2 against martinez 365–366; `brauer_first_main` against martinez 1085–1088; §7.3 against sambale 478–480; `IsDefectGroup` against sambale 350–351). None shares wording beyond formulas and statements of a dozen words. Largest share webb, 52 of 107 locators; contents compared with webb Chs. 9–12: independent (Layers 0, 5, 8 and §§7.2–7.3 have no Webb chapter; Layer 2 joins Webb §§9.2–9.3 with Ch. 10, Layer 3 joins §9.5 with §10.2; the *Needs:* lines force the order of Layers 4–7). Craven's text was not opened this round.

Research link: Layers 4–7 (blocks, defect groups, generalized decomposition numbers, Brauer's three main theorems) are the base of Sambale's monograph on block invariants (Sambale, LNM 2127, 2014, Ch. 1); §8.4 supplies GlaubermanZStar's route to Glauberman's `Z*` theorem. Rests on the README and on `sambale` Ch. 1.

## Not verifiable

- Navarro (`navarro`), Theorem 6.10, and Serre (`serre`), Part III §§15.2 and 16.1: settled as uncertified, cited by locator.
- Craven (`craven`), the four locators of §6.3: not opened this round; §6.3 was outside the sample.
- The two AxiomMath/CFSG files named under References (README lines 1648–1650): not opened.
- The shape of `Subgroup.pCore` in the open Mathlib pull request that §0.3 follows: not re-read this round.

## Source issues

- **Error** in webb at §9.4, p. 148 (webb lines 6229–6231): the source says that when `F` has a primitive `m`-th root of unity, `m` the exponent of `G`, so do `R` and `k`; it should be the `p'`-part of `m` for `k`, since characteristic `p` has no primitive `m`-th root when `p ∣ m`; affects nothing.

## For the human reviewers

- Licence: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:1648–1650` names two files of the public repository AxiomMath/CFSG as proof sources for §§7.2–7.3. `Suggested.lean` was not compared with that repository and its licence was not read.
- Licence: `martinez` (course notes, Firenze 2024) and `craven` (lecture notes, 2008) are unpublished notes on their authors' pages; the published `webb` and `sambale` carry 68 of the 107 locators.
