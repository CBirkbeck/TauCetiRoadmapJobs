# Review of GroebnerGeometry (pull request #2587 at 5c81ce7)

**Verdict:** accepted

**Summary.** Accepted: there are no findings. This is an incremental re-review of the 68 lines changed since `ab404d0`; the five small corrections of the previous review are all repaired, and I recomputed the new reduction of the `SL₂` theorem from `n ≤ 3` to four rows and the restated hypotheses of §4.10, which hold. The restored anchor before Layer 4 also settles the deferred point about the links of three other roadmaps. One small correction (a sentence of the description that the restored anchor makes untrue) and one format note remain, neither blocking. One point is left to the human reviewers: Miller–Sturmfels, the most-cited source, could not be read.

## C01 — The description still says that the links to the old G4 anchor open the top of the README, but this head restores that anchor

The description says: "The old heading of G4 is gone, so the links of DeformationAndDerivedPatchingAlgebra, DeformationAndDerivedPatchingAlgebraPartII and ResolutionOfSingularitiesCharacteristicZero to its anchor open the top of the README; those links are in those roadmaps." At this head `README.md` line 706 carries an explicit anchor with the id `g4-rees-algebras-and-flat-initial-families` directly before the heading of Layer 4, so those three links (DeformationAndDerivedPatchingAlgebra line 78, DeformationAndDerivedPatchingAlgebraPartII line 118, ResolutionOfSingularitiesCharacteristicZero line 33, on main) land on Layer 4. The description also does not mention the table of former labels `G1`–`G6` added to the scope section.

A sentence that would be right: "The old heading of G4 is gone; an anchor with its old id stands before Layer 4, so the links of the three roadmaps that use it still land there, and the scope section has a table from the former labels G1–G6 to Layers 1–6."

## N01 — In §1.1, "contraction to the variables `e τ`" uses the direction of `e` from §1.7, not §1.1's `e : σ → τ`

Line 157, unchanged from the previous review: with §1.1's `e : σ → τ` the variables are `e σ` (the image of `e`). The pinned `MonomialOrder.IsGroebnerBasis.comap_rename` (`TauCeti/RingTheory/MvPolynomial/Groebner/Elimination.lean:68`), cited in §1.7, has `e : τ → σ`.

## Previous findings

The previous review (of `ab404d0`) raised no finding, so there is no R-numbered point to account for. Its small corrections and its format note, at this head:

- C01 (§4.10, Noetherian base) — repaired: "for any ring `A`: … and, when `A` is Noetherian, the comparison of `(S/I)_m` with `Γ(X, O_X(m))` for all sufficiently large `m`" (lines 897–900).
- C02 (Convention 1) — repaired: "Normal forms need only a Gröbner basis whose nonzero members have unit leading coefficients; reduced bases, Buchberger completion and SAGBI theory are over a field `k`" (lines 79–81).
- C03 (Hashimoto's range) — repaired: "over every commutative ring and for `n ≥ 4` … For `n ≤ 3` the coaction preserves the degree in each row" (lines 1070–1074), and the same clause in the docstring of `equalizer_sl2Coaction_eq_adjoin_minors`.
- C04 (§6.2 pointer) — repaired: "using SchemeAndStackFoundations §2.6's computation of `H⁰(ℙ¹, O(d))`" (line 1186).
- C05 (downstream consumers) — repaired: separate bullets for CanonicalModelsAndGonality (§§4.9–4.10), AlgebraicModuliForArithmeticGeometry §1.5 (§4.9 and Layer 2's counts) and DeformationAndDerivedPatchingAlgebraPartII (§§4.9–4.11) (lines 1304–1310).
- N01 (§1.1, `e τ`) — not repaired: written again above as N01.

## Deferred findings

- D01 — resolved: the README now carries an explicit anchor with the old G4 id before the Layer 4 heading (line 706), so the three roadmaps' links land there unchanged.

## Verified sound

| Statement | Instances tried | Statement side | Other side (computed, source or library) | Result |
|---|---|---|---|---|
| `equalizer_sl2Coaction_eq_adjoin_minors`, reduction for `n ≤ 3` (§5.5, docstring) | `n = 0, 1, 2, 3` inside 4 rows | invariants `k`, `k`, `k[p₀₁]`, `k[p₀₁, p₀₂, p₁₂]` | every monomial in the `p_ij` is row-homogeneous; the part of `k[p_ij : i<j<4]` of degree `0` in rows `≥ n` is spanned by monomials in `p_ij`, `j < n` | holds |
| §5.5 locator | Hashimoto Theorem 17 and its setting | "every commutative ring and `n ≥ 4`" | Hashimoto line 225–226: `4 ≤ 2t ≤ n`, `E = k^(2t−2)`, so `t = 2` gives a plane and `n ≥ 4`; line 372–374: `R` any commutative ring | agrees |
| §4.10 sheafification (changed) | `A = k[a₁, a₂, …]`, `I = ∑ a_i (x₀, x₁)^i`; `A` Noetherian | charts, exactness, `S(−d)~`, `(S/I)~` stated for any `A`; comparison only for Noetherian `A` | `a_(m+1) x₀^m ≠ 0` in `(S/I)_m` (`I_m = (a₁..a_m) S_m`) but `x₀·`, `x₁^(m+1)·` it lie in `I`: zero on both charts, every `m` — excluded by the new hypothesis | holds |
| Convention 1 (changed) | normal form over a ring | "unit leading coefficients" | `TauCeti/RingTheory/MvPolynomial/Groebner/NormalForm.lean:202–207`: `hG : ∀ g ∈ G, g ≠ 0 → IsUnit (m.leadingCoeff g)` over a commutative ring | agrees |
| §6.2 pointer (changed) | SchemeAndStackFoundations on main | "§2.6's computation of `H⁰(ℙ¹, O(d))`" | its line 4357 is "2.6 Quasi-coherent cohomology"; line 4420: `H⁰(ℙ¹_k, O(1))` of dimension `2`; `2 + 3 = 5` sections of the scroll | agrees |
| Downstream consumers (changed) | three roadmaps on main | three bullets, lines 1304–1310 | AlgebraicModuli… §1.5 (heading line 741) cites G2 and G4 at 772, 778; CanonicalModels… cites G4 only (153, 792); PartII lines 115–120, 1552–1554 (Layer K3, heading 1405) | agrees |
| Former-label table and anchor (added) | `G1`–`G6`; the id at line 706 | `Gk` ↦ Layer `k`; anchor before Layer 4 | agrees with lines 66–67 ("cite Layer `k` … as `Gk`"); three links on main use exactly this id | agrees |

The rows for the untouched statements stand as in the previous review, of `ab404d0`.

- Source locators checked against the text, 2: Hashimoto Theorem 17 (line 372–374) and its standing setting (line 225–226). The seeded sample falls in the changed passages only at §4.10 and §6.2; the Stacks locator of §4.10 (Tag 0BXF) is unchanged.
- Library declarations opened at the pin, 1: `NormalForm.lean:198–207` (Tau Ceti).
- Cross-roadmap citations resolved on main, 6: SchemeAndStackFoundations §2.6 (lines 4357, 4420); AlgebraicModuliForArithmeticGeometry §1.5 (741, 764–778); CanonicalModelsAndGonality (153, 792); DeformationAndDerivedPatchingAlgebraPartII (115–120, 1405, 1552–1554); DeformationAndDerivedPatchingAlgebra (78) and ResolutionOfSingularitiesCharacteristicZero (33) for the anchor.
- Dependency check: `depcheck: 182 roadmaps, 2071 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder. Every automatic check passed and none was set aside.
- Elaboration: `Suggested.lean` elaborates with 11 `sorry` warnings and nothing else; the diff changes one docstring and no signature, so the elaborated types and the one-tactic probes of the previous review stand. Imports are `import Mathlib` and seven `TauCeti.*` modules; no `set_option`.
- Headlines: unchanged; the 11 stated theorems and the two named as not statable are as in the previous review.
- Pull request text: read against this head; the one sentence the head contradicts is C01. The rest (49 sections, the kept, removed and added declarations, the suppliers) is unaffected by the change.

Overlap check: read TensorProductCombinatorics and ClassicalGroups (closest by vocabulary, open and on main; the results list is empty); nothing shared, as in the previous review. §4.10 now states its chart and exactness facts for the polynomial ring over any ring; DeformationAndDerivedPatchingAlgebraPartII K3.3 owns the statements for an arbitrary ℕ-graded ring and says it does not restate this roadmap's polynomial-ring ones, so the owner of the polynomial-ring case is this roadmap.

Source independence: changed passages only; 3 passages compared with 1 source (Hashimoto), none shared; largest share MillerSturmfels, 9 of 49 locator lines (text not readable); the diff adds, removes and reorders no layer, so the contents comparison stands as before: independent.

Research link: Layer 3 states the SAGBI criterion and lifted-relation presentation of Bruns–Conca–Lembo (2025); Layer 5 the flag-minor degeneration of Kogan–Miller (2003) and Göbel's conjecture as proved by Reichstein (2003) and Thiéry–Thomassé (2006); Layer 6 the tree degenerations of Speyer–Sturmfels (2003). Rests on the sources read.

## Not verifiable

- Miller–Sturmfels, *Combinatorial Commutative Algebra* (uncertified): not read; no changed passage cites it.
- Eisenbud, *Commutative Algebra*, and Cox–Little–O'Shea (uncertified): not read; no changed passage cites them.

## Source issues

- none

## For the human reviewers

- Not tested: MillerSturmfels has the largest share of the README's locators (9 of 49 locator lines) and its text could not be read legally; the wording was not compared with it, and the arrangement only with the chapter list on its author's page.
