# Review of ClassifyingTopoi (pull request #1997 at eda0511)

**Verdict:** needs changes

Incremental re-review of the 2 lines changed since f78f0a4 (README line 840, the Research context). The previous finding is repaired. The sentence it sits in still states the order of the duality the wrong way round (one P3, below). Gate, dependency check and elaboration are as in the previous round. `Suggested.lean` is unchanged.

## R01 (P3) — The quotients of a theory form a Heyting algebra in the order of 2.5, not a coHeyting algebra

**Location.** `TauCetiRoadmap/ClassifyingTopoi/README.md` lines 840–841: "The duality of 2.5 makes the lattice of quotients of a theory a coHeyting algebra, the subtopoi of its classifying topos".

**Why this is in scope.** This is the sentence the diff edits, and its subject ("The duality of 2.5 makes the lattice of quotients of a theory a") is on the changed line. To check the newly cited section, I checked the claim against 2.5.

**Claim.** 2.5 (README lines 536–540; Lean `exists_quotient_topology`, `exists_quotient_theory`, `Suggested.lean` lines 291–307) matches `T ⊆ T'` with `J ≤ J'`. A larger quotient therefore gets a smaller subtopos, `Sheaf J' (Type u)` inside `Sheaf J (Type u)`, so the duality reverses order. The subtopoi form a coHeyting algebra. So the quotients, ordered by inclusion of axioms as 2.5 orders them, form the opposite lattice. That opposite is a Heyting algebra, and in general it is not a coHeyting algebra (computed in the table below for the theory classified by `Sh(ℝ)`). The appositive "the subtopoi of its classifying topos" identifies the lattice of quotients with the subtopos lattice, when the duality only makes it the opposite of that lattice.

**Witness.** Caramello arXiv:0905.0299v1 Theorem 5.1, p. 37 (line 3450): quotients, `T ≤ T'` iff `T'` proves `T`'s axioms, form a Heyting algebra; subtoposes form a coHeyting algebra (p. 13, line 1287). README line 554: largest quotient ↦ degenerate subtopos.

**Repair.** Lines 840–841: "The duality of 2.5 reverses order: ordered by inclusion of axioms, the quotients of a theory form the opposite of the coHeyting algebra of subtopoi of its classifying topos, hence a Heyting algebra (Caramello 2017, « Lattices of theories », Theorem 5.1 in the numbering of arXiv:0905.0299v1), and Caramello's method of topos-theoretic bridges …". Tested on the Check that refuted the original: `T' = T` gives `J' = J`, the bottom quotient matched with the whole topos (the top subtopos); `T ∪ {⊤ ⊢ bot}` gives `J' = ⊤`, the top quotient matched with the degenerate subtopos (the bottom). The order is reversed, as the repaired sentence says.

## Previous findings

- R01 — repaired: line 840 now reads "should be constructions on topoi. The duality of 2.5 makes the lattice of quotients of a theory a". 2.5 is "Quotients and finer topologies" (line 534), the duality theorem (lines 542–544). The rest of the sentence is R01 above.

## Verified sound

**Gate, order, build.**
- Worker's gate at eda0511 (`scratch/gate.md`): every check passes.
- Gate run by hand at this head: 0 on every check except `depcheck=1`, with the single line "depcheck: NOT IN ORDER: ClassifyingTopoi (insert it after its last supplier)". This is the same line as in the previous round. The public merge-order file does not list this new roadmap yet, and the brief says that is not a finding.
- Dependency check against the candidate order: `depcheck: 236 roadmaps, 2263 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. ClassifyingTopoi is at line 401 of the candidate order. SchemeAndStackFoundations is on main. GrothendieckTopoi and LocallyPresentableCategories are new-roadmap pull requests, cited by name and section.
- `lake env lean` on `TauCetiRoadmap/ClassifyingTopoi/Suggested.lean`: exit 0, 18 warnings, all "declaration uses `sorry`", no error, 22 s.
- `git diff f78f0a4 HEAD -- TauCetiRoadmap/ClassifyingTopoi/Suggested.lean` is empty, so the previous round's signature pass and one-tactic padding probe (all 18 sorried theorems fail `first | rfl | simp | infer_instance | trivial | decide | exact ⟨⟩`) still hold for this file.
- I re-read the seven "dropped binder" leads in `scratch/signatures.md` (`CatStructure.pow`, `termMap`, `IsModel`, `IsHom`, `Isomorphic` and two more). Each elaborated type contains `[inst : Category.{u_i, u_j} E]`, so all seven are false positives.
- Nothing changes outside the folder: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ClassifyingTopoi'` is empty.

**The changed passage and what it cites.**
- Caramello, arXiv:0905.0299v1 (cache `294c646c…`, glyph-coded text decoded line by line in scratch; page `N` begins at `=== page N ===`):
  - Theorem 3.6, line 1436, p. 15: the bijection between quotients of `T` and subtoposes of `Set[T]`. This is the duality 2.5 states, and the number 2.5 is now right.
  - §5.2, lines 3433–3444, pp. 36–37: the order on quotients that matches `≤` on topologies of the syntactic site is "`T' ≤ T''` iff `T''` proves `T'`'s axioms". Theorem 5.1, line 3450: with that order the quotients form a Heyting algebra, with bottom `T` and top the contradictory theory.
  - Lines 1284–1288, p. 13: the subtoposes of an elementary topos form a coHeyting algebra (citing Elephant A4.5.13(f)).
- Every other mention of "2.4" in the README refers to uniqueness, as it should: lines 526, 548, 558 (the Sierpiński equivalence follows from uniqueness), 567, 571, 595 and 659. Line 380 cites GrothendieckTopoi 2.4, another roadmap.
- `Sheaf.instHasColimitsOfShape` (Mathlib contract, README line 176; one of the 12 "found nowhere" leads in `scratch/citations.md`) resolves at the pin: `#check @CategoryTheory.Sheaf.instHasColimitsOfShape` gives `[HasWeakSheafify J D] [HasColimitsOfShape K D] → HasColimitsOfShape K (Sheaf J D)` (`Sites/Limits.lean:214`). The other 11 leads are this roadmap's own names, which the gate's `readme-ids-missing=0` confirms are declared in `Suggested.lean`, and GrothendieckTopoi's `homEquivInverse`, which the previous round resolved at that head (line 228).

**Overlaps and ownership.** `scratch/overlaps.md` reports no other pull request changing this folder and no dropped ids in either direction. The change adds no object, so the previous round's ownership search over main and the 458 open heads stands: no second owner of classifying topoi, geometric logic, syntactic sites, presheaf type, Morita equivalence of theories, `FPRing` or the Zariski topos.

**Headline theorems (unchanged; all statable ones stated).**
- 1.2 `realize_hom`, `realize_toInf`; 1.3 `isModel_ofStructure_iff`; 1.4 `IsModel.map`.
- 2.2 (b) `exists_interp_eq_iSup_exs`; 2.3 `exists_isClassifyingSite`; 2.4 `exists_equivalence`; 2.5 `exists_quotient_topology`, `exists_quotient_theory`.
- 3.1 `isOfPresheafType_of_isHorn`; 3.2 `isClassifyingSite_genericObject`; 3.3 `isClassifyingSite_genericTorsor`, `moritaEquivalent_torsorTheory_iff`; 3.4 `isClassifyingSite_genericInterval`.
- 4.1 `isClassifyingSite_genericRing`, `finitePresentation_of_isFinitelyPresentable`; 4.2 `isSheaf_forget_zariskiTopology`; 4.3 `isClassifyingSite_localRingTheory`.
- 2.2 (a) needs GrothendieckTopoi's `IsFiltering`, and the module docstring names it as not statable.

**Adversarial table.** The first block is new and has values computed for the changed statement. The rows marked r2 are carried forward from the previous report (`PRREVIEW-ClassifyingTopoi~2`) for statements the diff leaves untouched.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Research context: order of the 2.5 duality | `T' = T`; `T' = T ∪ {⊤ ⊢ bot}` (2.5 Check, line 554) | `J' = J`: bottom quotient matched with the whole topos, the top subtopos. `J' = ⊤`: top quotient matched with the degenerate topos, the bottom subtopos | order-reversing → R01 |
| Research context: are the quotients coHeyting in 2.5's order anyway? | `T_ℝ`: one 0-ary relation per open of `ℝ`, the frame axioms, `⊤ ⊢ ∃x ⊤` and `⊤ ⊢ x = y`; classifying topos `Sh(ℝ)`. Sublocales `a = ℝ∖ℚ` and `b_q = {q}` | `ℝ∖{q}` is not in `a`, since `int((ℝ∖{q}) ∪ ℚ) = ℝ`; so `a ∧ b_q = 0` and `⋁ (a ∧ b_q) = 0`. `⋁ b_q = ℚ`, and `ℚ`, `a` both contain `∅`, so both are dense; `a ∧ ℚ` contains the regular-open sublocale, which is not `0` | subtopoi of `Sh(ℝ)` do not form a frame, so the quotients of `T_ℝ` (the opposite lattice) are not coHeyting: the sentence is false, not just ambiguous → R01 |
| Research context: Heyting side | Caramello Thm 5.1 (line 3450) | bottom `T`, top the contradictory theory, provability order = 2.5's `⊆` | the repair's claim is sourced |
| 2.5 = the duality | Caramello Thm 3.6 (line 1436, p. 15) | quotients ↔ subtoposes of `Set[T]` | the number is right |
| Conv. 2 / 1.1 `ex` (r2) | ℤ, `ex (var 0 = var 1 * var 1)` at 4, 2 (Lean) | `4 = 2·2` closed; `2 = a²` refuted | sound |
| 1.1 `bot` (r2) | context 0 | `∃ i : PEmpty` is `False` | sound |
| 1.2 `IsSetModel` (r2) | `{⟨0, top, ex top⟩}` on `PEmpty`, `PUnit` | false, true | sound |
| 1.2 `toInf` (r2) | `bot`; torsion at 1 in ℤ/6 and ℤ | false; true (`k = 5`), false | sound |
| 1.2 `realize_hom` (r2) | ℤ ⊂ ℚ, `∃y, 2y = 1` | false in ℤ, true in ℚ | sound |
| 1.3 `interp` (r2) | `Bool` diagonal; `{0} ∨ {0}` in ℤ | 2 of 4 pairs; image 1 element vs coproduct 2 | sound |
| 1.3 `IsHom`, `Isomorphic` (r2) | `n ↦ 2n`; `𝟙 Bool`, `∅ ⊆ {true}` | `2 ≠ 1`; not conversely | sound |
| 1.4 `IsModel.map` (r2) | `X ↦ X × X`; `X ↦ Bool × X` | `(f,t)` not a constant; `|Bool × 1| = 2` | sound |
| 2.1 (ii) not from (i) (r2) | `Discrete Bool`, `⊥` | `Hom(F, G) = ∅` vs one homomorphism | sound |
| 2.2 𝒞_T hom-sets (r2) | `(1, x² = x) ⟶ (1, top)` | `ℤ[x]/(x² − x)` identifies `x`, `x²`; `ℤ[x]` does not (`2 ≠ 4`) | sound |
| 2.2 𝒞_∅ (r2) | empty language | maps `Fin m → Fin n`, `𝒞_∅ ≃ FinSetᵒᵖ` | sound |
| 2.2 (b) universes (r2) | `and`, `iSup`, `ex`, atoms | product, sigma, `m + 1`, `PUnit` in `Type u` | sound |
| 2.3 universe Check (r2) | symbols `Type u`; `ULift.{u+1} Bool` | injection of `Type u` into a small set impossible; square of the arrow category | sound |
| 2.4 (r2) | `G = ℤ/2` | two isomorphisms `U.map 𝟭 ≅ U` | sound |
| 2.5 (r2) | `T ∪ {⊤ ⊢ bot}`; `J' = J` | `J' = ⊤`; `T' = T` | sound |
| 2.6 (r2) | `FinSet` vs `FinInj` | both Cauchy complete; `Fin 2 ⟶ Fin 1` not mono | sound |
| 3.1 Horn (r2) | `commRingTheory`, `localRingTheory`, `torsorTheory G` | Horn; not (`bot`); not (`ex top`) | sound |
| 3.2 variance (r2) | `FintypeCat.Skeleton` | functors on `FinSetᵒᵖ`: Boolean algebras | sound |
| 3.3 action, Morita (r2) | `𝔖₃` `(12)`, `(23)`; `ZMod 4` vs `(ZMod 2)²` | `ab ≠ ba`; orders `{1,2,4,4}` vs `{1,2,2,2}` | sound |
| 3.4 Conv. 6, `Δ[1]` (r2) | `δ`, `σ` on `0,1,2`; level `n` | `0`, `1`; `0,0,1`, `0,1,1`; `n + 2` maps | sound |
| 4.1 `FPRing`, wrong model (r2) | `⟨0,⊥⟩`, `⟨0,⊤⟩`, `⟨1,⊥⟩`; `x ↦ x + 1` | ℤ initial, `0` terminal, `ℤ[X]`; zero `1`, sum `a + b − 1` | sound |
| 4.2 (r2) | zero ring; ℤ with `{2, 3}`; `{ℤ → ℤ[1/2]}` | `⊥` covers; `3 − 2 = 1`; `ℤ ≇ ℤ[1/2]` | sound |
| 4.3 (r2) | ℤ at 3; ℤ/6; ℤ/4; zero ring | non-units `3, −2`; `3, 4`; local; `0 = 1 ⊢ bot` excludes | sound |

## Not verifiable

- Johnstone, *Elephant*, A4.5.13(f): that subtoposes form a coHeyting algebra. The book is paywalled (OUP), so I used Caramello's own statement of it (p. 13, line 1287). The same applies to D1.1–D1.4 and D3.1, as in the previous round.
- Mac Lane–Moerdijk VIII–X with page ranges; Makkai–Reyes pp. 272–297; Hakim Ch. III §3; Moerdijk LNM 1616; Joyal–Tierney: paywalled (Springer, AMS). None of them is cited by the changed passage.
- Caramello 2017 (OUP) book numbering: the README cites the numbering of arXiv:0905.0299v1, which was checked.

## Source issues

- none
