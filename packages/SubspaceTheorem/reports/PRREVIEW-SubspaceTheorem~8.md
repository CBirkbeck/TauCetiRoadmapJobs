# Review of SubspaceTheorem (pull request #3182 at 96d24f3)

**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 19 lines changed since `f813c69`, all in the action paragraph of 0.2 and the 0.2 row of the table in Scope and ownership. The previous finding is repaired: the general action of a group of ring automorphisms on absolute values is again a target, and the only library declaration the text now attributes to the pinned Tau Ceti for it, `AbsoluteValue.instMulActionAlgEquiv`, is there. No finding, no small correction, one format note; the licence question, the unread Bombieri–Gubler and the Tau Ceti pin remain for the human reviewers.

## N01 — One sentence of 0.2 describes the state of a branch at a moment

"Tau Ceti's main branch has this, newer than the pinned Tau Ceti, as `AbsoluteValue.instMulAction` …" (README lines 242–243) is true today (checked below) and stops being true as written when the pin moves, at which point the item becomes a completed one. Nothing need change now; when the pin moves, the sentence would become the item's `*In Tau Ceti:*` line with the three names.

## Previous findings

- R01 — repaired: "is Tau Ceti's `AbsoluteValue.instMulActionAlgEquiv` … Define the action in the generality of a group `G` acting on `F` by ring automorphisms (`MulSemiringAction G F`), as a single instance"; the table row lists `AbsoluteValue.instMulActionAlgEquiv` only.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 0.2, "the action of `F ≃ₐ[K] F` … for any algebra of semirings, is Tau Ceti's `AbsoluteValue.instMulActionAlgEquiv`" | pinned Tau Ceti `2fd255d997`, `Analysis/AbsoluteValue/Action.lean` | line 38: `[CommSemiring R] [Semiring F] [Algebra R F]`; line 41: `MulAction (F ≃ₐ[R] F) (AbsoluteValue F S)`; line 47: `(σ • w) x = w (σ.symm x)` | true at the pin |
| 0.2, "`σ • w` lying over `v` when `w` does" | same file | lines 54, 58, 62: `under_smul`, `liesOver_smul_iff` and the `LiesOver` instance for `σ : F ≃ₐ[R] F` | true at the pin |
| 0.2, target `(g • w) x = w (g⁻¹ • x)` is a left action | `G = S₃`, `g, h` not commuting; `g = 1`; `x = 0` | `((gh)•w) x = w(h⁻¹•g⁻¹•x) = (g•(h•w)) x`; the variant `w(g•x)` gives `(hg)•w`; `w(g⁻¹•x) = 0 ⇔ x = 0` | sound |
| 0.2, the `F ≃ₐ[K] F` case through Mathlib `AlgEquiv.applyMulSemiringAction` | `σ • x = σ x`, `σ⁻¹ = σ.symm` | `w(σ⁻¹ • x) = w(σ.symm x)`, the pinned instance's value | sound; Mathlib `Algebra/Algebra/Equiv.lean` line 702 |
| 0.2, target `(g • w).under R = w.under R` under `SMulCommClass G R F` | `F = ℚ(i)`, `G = Gal(F/ℚ)`, `R = ℚ`; control `R = F`, `w` the `(2+i)`-adic value | `g⁻¹•(r•1) = r•(g⁻¹•1) = r•1`, both sides `w(r)`; control: `w(2+i) < 1 = w(2−i)`, and `SMulCommClass` fails | sound; hypothesis needed |
| 0.2, "Tau Ceti's main branch has this … as `AbsoluteValue.instMulAction` with `AbsoluteValue.under_smul` and `AbsoluteValue.liesOver_smul_iff`" | the same file on Tau Ceti's `main` today; the pin | `main`: `instMulAction` for `[Group G] [Semiring F] [MulSemiringAction G F]` (line 53), `smul_apply` with `w (g⁻¹ • x)` (59), `under_smul` (79), `liesOver_smul_iff` (83); pin: no `instMulAction` | true (N01) |
| Scope table, row 0.2 | each of the nine names at the pin | all nine found (`instMulActionAlgEquiv` at `Action.lean` line 41; the two transitivity lemmas at `NumberTheory/NumberField/PlacesOver/Galois.lean` lines 58 and 74) | true at the pin |

The rows for untouched statements stand as in the previous review, of `f813c69`.

- Source locators checked against the text: 0; the changed paragraph's only locator (Bombieri–Gubler) is unreadable, and no target of the seeded sample other than 0.2 falls in changed or affected text.
- Library declarations opened at the pin: 7 (Tau Ceti `Analysis/AbsoluteValue/Action.lean` lines 38, 41, 47, 54, 58, 62; Mathlib `AlgEquiv.applyMulSemiringAction`); the same Tau Ceti file read on Tau Ceti's `main`.
- Cross-roadmap citations resolved: 1 (ArithmeticGaloisRepresentations §2.1 at this head names SubspaceTheorem §§0.1 and 0.2 in its *Needs:* line and states the `MulSemiringAction` action on places as its own target; SubspaceTheorem does not cite it back, and 0.2 now plans the general action it consumes).
- The record: against the merge base the folder differs by 6 lines, all in the paragraph of 0.2 ("a subring `R`" became "an `R`-algebra `F`", and the sentence of N01 is added); no layer, section, item or heading is removed, renumbered or retitled.
- Dependency check: `depcheck: 93 roadmaps, 1039 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 38 `sorry` warnings and nothing else; the file is identical to the one on `main` and does not use the action, so the signature comparison and the one-tactic probe of the earlier reviews stand. The change adds or removes no headline theorem.
- The pull request's text: its sentence on this folder ("§0.2 asks for `(g • w).under R = w.under R` for an `R`-algebra `F` with `SMulCommClass G R F` (it said "a subring `R`"), and notes that Tau Ceti's main branch, newer than the pinned Tau Ceti, has the general action as `AbsoluteValue.instMulAction`; it stays a target until the pin moves") describes the head exactly; the regenerated GRH umbrella is stated.

Overlap check: read DiophantineApproximationAndTranscendence, HeightsAndUnits, AdelicHeightsAndSuccessiveMinima; the action of a group on `AbsoluteValue F ℝ` is a target only of SubspaceTheorem 0.2 (owner), which ArithmeticGaloisRepresentations §2.1 cites; nothing else shared.

Source independence: changed passages only: 2 passages (the paragraph of 0.2, the table row) compared with 1 text (the module docstring of Tau Ceti's `Analysis/AbsoluteValue/Action.lean`, at the pin and on its `main`), nothing shared beyond the formula `w ∘ σ⁻¹`; largest share Bombieri–Gubler, about 50 of 174 source mentions, whose text could not be read; no layer added, removed or reordered, so the arrangement was not compared.

Research link: Layer 6 is the Schmidt–Schlickewei Subspace Theorem (1972, 1977) in the form of Evertse–Schlickewei (2002); Layer 9 is the elementary half of Evertse (2010); 7.3 is Adamczewski–Bugeaud (2007); 8.6 is Corvaja–Zannier and Bugeaud–Corvaja–Zannier (2003). Rests on the README's references and Evertse2010 §2.

## Not verifiable

- Bombieri–Gubler, Corollaries 1.3.2 and 1.3.5, the locator that opens the changed paragraph of 0.2: behind the publisher's paywall, no copy held locally; the paragraph was checked by computation and against the library, not against the source.

Automatic checks set aside as false positives: the check that the pull request changes nothing outside its roadmap folders flagged the two generated GRH umbrella files; they are regenerated from the *Needs:* lines, and their diff only records the new dependency edges (SubspaceTheorem §§0.1 and 0.2 under ArithmeticGaloisRepresentations §2.1, and the new edge of IdelicReciprocityCountsAndCyclotomicClassGroups §1.1), as the description says.

## Source issues

- none

## For the human reviewers

- **Licence.** Tau Ceti's `Analysis/AbsoluteValue/Action.lean` says the action is also defined in `rwst/Subspace-Theorems` at `09835cb` (Apache 2.0); `Suggested.lean` was not compared with that repository.
- **Not tested.** Bombieri–Gubler, the source with the largest share of the locators (about 50 of 174 mentions), could not be read legally; the changed paragraph cites nothing new from it.
- **Pin.** The general action of 0.2 is a target although Tau Ceti's `main` already has it (`AbsoluteValue.instMulAction`); the pin in `lake-manifest.json` is `2fd255d997`. Whether to move the pin is the maintainers' decision.
