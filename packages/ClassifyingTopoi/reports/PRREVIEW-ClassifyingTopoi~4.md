# Review of ClassifyingTopoi (pull request #1997 at 5e87b40)

**Verdict:** accepted

Incremental re-review of the 10 lines changed since eda0511 (README lines 840–845, the Research context). The previous finding is repaired and the repair introduces no new problem. No finding remains. The gate passes, the dependency check shows no problem, and `Suggested.lean` is unchanged and elaborates with `sorry` as its only warning.

## Previous findings

- R01 — repaired: lines 840–843 now read "The duality of 2.5 reverses order: ordered by inclusion of axioms, the quotients of a theory form the opposite of the coHeyting algebra of subtopoi of its classifying topos, hence a Heyting algebra (… Theorem 5.1, p. 37 …)".

## Verified sound

**Gate, order, build.**
- Worker's gate at 5e87b40 (`scratch/gate.md`): every check passes, including `build=0`.
- Gate run by hand at this head: 0 on every check except `depcheck=1`, with the single line "depcheck: NOT IN ORDER: ClassifyingTopoi (insert it after its last supplier)". This is the same line as in the two previous rounds: the public merge-order file does not list this new roadmap yet, which the brief says is not a finding.
- Dependency check against the candidate order: `depcheck: 236 roadmaps, 2263 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/ClassifyingTopoi/Suggested.lean`: exit 0, 18 warnings, all "declaration uses `sorry`", no error.
- `git diff eda0511 HEAD -- TauCetiRoadmap/ClassifyingTopoi/Suggested.lean` is empty, so the signature pass (the seven "dropped binder" leads of `scratch/signatures.md` are false positives, each type carries its `Category` instance) and the one-tactic padding probe of the earlier rounds (all 18 sorried theorems fail it) still hold for this file.
- Nothing changes outside the folder: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ClassifyingTopoi'` is empty. The diff since eda0511 is `README.md` only, 6 insertions and 4 deletions.

**The changed passage and what it cites.**
- Caramello, arXiv:0905.0299v1 (cache `294c646c…`, glyph-coded text decoded; page `N` begins at its `=== page N ===` line, page 37 at line 3446, page 38 at line 3565):
  - Theorem 5.1 is at line 3450, on p. 37, as the new locator says. It states that the closed geometric quotients of `T`, ordered by "`T ≤ T'` iff `T'` proves the axioms of `T`", form a Heyting algebra. Lines 3439–3449 (pp. 36–37) say this is the order matching `≤` on the Grothendieck topologies of the syntactic site under Theorem 3.6, which is the order of 2.5 (`T ⊆ T'` with `J ≤ J'`, README lines 536–540).
  - Lines 1284–1288, p. 13 (read in the previous round): subtoposes of a topos form a coHeyting algebra. With `J ≤ J'` giving `Sheaf J' (Type u)` inside `Sheaf J (Type u)`, the quotients are the opposite lattice, so "opposite of the coHeyting algebra of subtopoi, hence a Heyting algebra" is what the source supports.
- The citation form "Caramello 2017, « Lattices of theories », Theorem 5.1, p. 37 in the numbering of arXiv:0905.0299v1" is the form of the README's other eight citations of that chapter (for example lines 568–569), and the References entry (lines 857–860) identifies the chapter with the arXiv text.
- The new sentence agrees with the rest of the README: the 2.5 Check at line 554 (largest quotient ↦ `J' = ⊤`, the degenerate topos; `J' = J` ↦ the same models) is the two-point witness of the order reversal, and "Heyting", "coHeyting" appear nowhere else. The other mentions of subtopoi (lines 61–62, 200, 220, 541–542) state the correspondence with `J' ≥ J` and do not speak of the order on theories.
- The passage adds no Lean name, section number or supplier citation; "2.5" is "Quotients and finer topologies" (line 534), the duality theorem (lines 542–544).

**Overlaps and ownership.** `scratch/overlaps.md` reports no other pull request changing this folder and no dropped ids in either direction. The change adds no object, so the ownership search of the earlier rounds over main and the open heads stands.

**Headline theorems (unchanged; all statable ones stated).**
- 1.2 `realize_hom`, `realize_toInf`; 1.3 `isModel_ofStructure_iff`; 1.4 `IsModel.map`.
- 2.2 (b) `exists_interp_eq_iSup_exs`; 2.3 `exists_isClassifyingSite`; 2.4 `exists_equivalence`; 2.5 `exists_quotient_topology`, `exists_quotient_theory`.
- 3.1 `isOfPresheafType_of_isHorn`; 3.2 `isClassifyingSite_genericObject`; 3.3 `isClassifyingSite_genericTorsor`, `moritaEquivalent_torsorTheory_iff`; 3.4 `isClassifyingSite_genericInterval`.
- 4.1 `isClassifyingSite_genericRing`, `finitePresentation_of_isFinitelyPresentable`; 4.2 `isSheaf_forget_zariskiTopology`; 4.3 `isClassifyingSite_localRingTheory`.
- 2.2 (a) needs GrothendieckTopoi's `IsFiltering`, and the module docstring names it as not statable.

**Adversarial table.** The first block has values computed at this head for the changed statement. The rows marked "r3, from r2" are carried forward from the previous report (`PRREVIEW-ClassifyingTopoi~3`, which carried them from `PRREVIEW-ClassifyingTopoi~2`) for statements the diff leaves untouched.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Research context: the 2.5 duality reverses order | `T' = T`; `T' = T ∪ {⊤ ⊢ bot}` (2.5 Check, line 554) | `J' = J`: bottom quotient ↦ whole topos, the top subtopos. `J' = ⊤`: top quotient ↦ degenerate topos, the bottom subtopos | order-reversing, as now stated |
| Research context: quotients are the opposite of a coHeyting algebra, hence Heyting | Sierpiński topos: sublocales `0`, open point, closed point, whole — a 4-element Boolean lattice, both Heyting and coHeyting, so it does not separate. Then `T_ℝ` classified by `Sh(ℝ)` with sublocales `a = ℝ∖ℚ`, `b_q = {q}` (previous report) | `a ∧ b_q = 0` for every `q`, so `⋁(a ∧ b_q) = 0`; `a ∧ ⋁b_q = a ∧ ℚ ≠ 0` (both dense). Subtopoi: not a frame, coHeyting only. Opposite lattice: Heyting, not coHeyting | "Heyting" is the right side and "coHeyting" would be false; sound |
| Research context: locator | Caramello Thm 5.1 | line 3450, between the page-37 marker (3446) and the page-38 marker (3565); order = provability of axioms; bottom `T`, top the contradictory theory | Theorem 5.1, p. 37: correct |
| Conv. 2 / 1.1 `ex` (r3, from r2) | ℤ, `ex (var 0 = var 1 * var 1)` at 4, 2 (Lean) | `4 = 2·2` closed; `2 = a²` refuted | sound |
| 1.1 `bot` (r3, from r2) | context 0 | `∃ i : PEmpty` is `False` | sound |
| 1.2 `IsSetModel` (r3, from r2) | `{⟨0, top, ex top⟩}` on `PEmpty`, `PUnit` | false, true | sound |
| 1.2 `toInf` (r3, from r2) | `bot`; torsion at 1 in ℤ/6 and ℤ | false; true (`k = 5`), false | sound |
| 1.2 `realize_hom` (r3, from r2) | ℤ ⊂ ℚ, `∃y, 2y = 1` | false in ℤ, true in ℚ | sound |
| 1.3 `interp` (r3, from r2) | `Bool` diagonal; `{0} ∨ {0}` in ℤ | 2 of 4 pairs; image 1 element vs coproduct 2 | sound |
| 1.3 `IsHom`, `Isomorphic` (r3, from r2) | `n ↦ 2n`; `𝟙 Bool`, `∅ ⊆ {true}` | `2 ≠ 1`; not conversely | sound |
| 1.4 `IsModel.map` (r3, from r2) | `X ↦ X × X`; `X ↦ Bool × X` | `(f,t)` not a constant; `|Bool × 1| = 2` | sound |
| 2.1 (ii) not from (i) (r3, from r2) | `Discrete Bool`, `⊥` | `Hom(F, G) = ∅` vs one homomorphism | sound |
| 2.2 𝒞_T hom-sets (r3, from r2) | `(1, x² = x) ⟶ (1, top)` | `ℤ[x]/(x² − x)` identifies `x`, `x²`; `ℤ[x]` does not (`2 ≠ 4`) | sound |
| 2.2 𝒞_∅ (r3, from r2) | empty language | maps `Fin m → Fin n`, `𝒞_∅ ≃ FinSetᵒᵖ` | sound |
| 2.2 (b) universes (r3, from r2) | `and`, `iSup`, `ex`, atoms | product, sigma, `m + 1`, `PUnit` in `Type u` | sound |
| 2.3 universe Check (r3, from r2) | symbols `Type u`; `ULift.{u+1} Bool` | injection of `Type u` into a small set impossible; square of the arrow category | sound |
| 2.4 (r3, from r2) | `G = ℤ/2` | two isomorphisms `U.map 𝟭 ≅ U` | sound |
| 2.5 (r3, from r2) | `T ∪ {⊤ ⊢ bot}`; `J' = J` | `J' = ⊤`; `T' = T` | sound |
| 2.6 (r3, from r2) | `FinSet` vs `FinInj` | both Cauchy complete; `Fin 2 ⟶ Fin 1` not mono | sound |
| 3.1 Horn (r3, from r2) | `commRingTheory`, `localRingTheory`, `torsorTheory G` | Horn; not (`bot`); not (`ex top`) | sound |
| 3.2 variance (r3, from r2) | `FintypeCat.Skeleton` | functors on `FinSetᵒᵖ`: Boolean algebras | sound |
| 3.3 action, Morita (r3, from r2) | `𝔖₃` `(12)`, `(23)`; `ZMod 4` vs `(ZMod 2)²` | `ab ≠ ba`; orders `{1,2,4,4}` vs `{1,2,2,2}` | sound |
| 3.4 Conv. 6, `Δ[1]` (r3, from r2) | `δ`, `σ` on `0,1,2`; level `n` | `0`, `1`; `0,0,1`, `0,1,1`; `n + 2` maps | sound |
| 4.1 `FPRing`, wrong model (r3, from r2) | `⟨0,⊥⟩`, `⟨0,⊤⟩`, `⟨1,⊥⟩`; `x ↦ x + 1` | ℤ initial, `0` terminal, `ℤ[X]`; zero `1`, sum `a + b − 1` | sound |
| 4.2 (r3, from r2) | zero ring; ℤ with `{2, 3}`; `{ℤ → ℤ[1/2]}` | `⊥` covers; `3 − 2 = 1`; `ℤ ≇ ℤ[1/2]` | sound |
| 4.3 (r3, from r2) | ℤ at 3; ℤ/6; ℤ/4; zero ring | non-units `3, −2`; `3, 4`; local; `0 = 1 ⊢ bot` excludes | sound |

## Not verifiable

- Johnstone, *Elephant*, A4.5.13(f) (subtoposes form a coHeyting algebra): paywalled (OUP); Caramello's own statement of it (p. 13, line 1287) was used. The README's changed passage does not cite the Elephant for it.
- Caramello 2017 (OUP) book numbering: the README cites the numbering of arXiv:0905.0299v1, which was checked.
- Mac Lane–Moerdijk, Makkai–Reyes, Hakim, Moerdijk LNM 1616, Joyal–Tierney: paywalled, as in the earlier rounds; none is cited by the changed passage.

## Source issues

- none
