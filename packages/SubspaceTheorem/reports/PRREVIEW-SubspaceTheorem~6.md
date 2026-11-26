# Review of SubspaceTheorem (pull request #3182 at f813c69)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 17 changed lines since `5c8f654`. The change rewrites the action paragraph of 0.2 and the 0.2 row of the table in Scope and ownership; I checked every sentence of it by computation, against the Tau Ceti revision the repository pins, and against Tau Ceti's current `main`. The mathematics is right, but one finding blocks: the text now says Tau Ceti has `AbsoluteValue.instMulAction` for any `MulSemiringAction G F`, with `under_smul` under `SMulCommClass G R F`, and the pinned Tau Ceti has neither (it has the `F ≃ₐ[R] F` instance only), so a target that `main` plans is replaced by a library claim that is false at the pin. No small correction and no format note; the previous review's one small correction is repaired; the licence question and the unread Bombieri–Gubler remain for the human reviewers.

## R01 (P2) — 0.2 and the Scope table attribute to Tau Ceti "at the pins" an instance and three lemmas that the pinned Tau Ceti does not have

The README on `main` asks, in 0.2, for the action of a group `G` acting on `F` by ring automorphisms as a target ("Define the action in the generality of a group `G` … as a single instance"). The head replaces that target by a statement about the library: "`AbsoluteValue.instMulAction` is a single instance for a group `G` acting on a semiring `F` by ring automorphisms (`MulSemiringAction G F`)" (README lines 236–243), and the 0.2 row of the table whose header reads "Tau Ceti at the pin" (line 2470) lists `AbsoluteValue.instMulAction` and `AbsoluteValue.under_smul`. An implementer who works against the pinned library finds no such instance, and nothing in the roadmap plans it any more: the general action that ArithmeticGaloisRepresentations §2.1 consumes from 0.2 is neither a target nor a pinned declaration.

How I know. `lake-manifest.json` pins Tau Ceti at `2fd255d997` (unchanged by this pull request, and the same on `main`). At that revision `TauCeti/Analysis/AbsoluteValue/Action.lean` declares `instMulActionAlgEquiv : MulAction (F ≃ₐ[R] F) (AbsoluteValue F S)` (line 41), `smul_apply` with right side `w (σ.symm x)` (line 47), and `under_smul` and `liesOver_smul_iff` for `σ : F ≃ₐ[R] F` only (lines 54 and 58); a search of the pinned Tau Ceti and Mathlib finds no `AbsoluteValue.instMulAction`, and no `MulSemiringAction`, `SMulCommClass` or `g⁻¹ • x` in that file. The declarations the head describes do exist, exactly as described, on Tau Ceti's `main` since its commit `3b47ef09ee` of 2026-11-26 ("let any group of ring automorphisms act on absolute values"), which is later than the pin. Four names are affected: `AbsoluteValue.instMulAction` (absent at the pin), and `AbsoluteValue.smul_apply`, `AbsoluteValue.under_smul`, `AbsoluteValue.liesOver_smul_iff` (present at the pin, but for `F ≃ₐ[R] F`, not in the generality the sentences give them).

The smallest change, either of two. (a) Move the Tau Ceti pin of the repository to a revision that contains `3b47ef09ee`, after which every sentence of the changed paragraph and the table row is true as written; the pin is not this folder's, so that is a change for the maintainers of the Lake configuration. (b) Until the pin moves, keep the general action as the target it is on `main` and name only what the pin has: "is Tau Ceti's `AbsoluteValue.instMulActionAlgEquiv` … Define the action in the generality of a group `G` acting on `F` by ring automorphisms (`MulSemiringAction G F`), as a single instance with `(g • w) x = w (g⁻¹ • x)` …, and prove `(g • w).under R = w.under R` for an `R`-algebra `F` with `SMulCommClass G R F`", with `AbsoluteValue.instMulActionAlgEquiv` in the table row. The wording "for an `R`-algebra `F`" of this head is the right one to keep in either case.

## Previous findings

- The previous review had no finding. Its small correction C01 (the invariance of the restriction was asked "for a subring `R`") is repaired: the head says "For an `R`-algebra `F` with `SMulCommClass G R F`, `(g • w).under R = w.under R`" (line 241), the generality of `AbsoluteValue.under`.
- Its question on the example of 9.5 lies in untouched text the change does not affect and stands as it was.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 0.2, `(g • w) x = w (g⁻¹ • x)` is an absolute value and a left action | `G = S₃`, `g, h` not commuting; `g = 1`; `x = 0` | `((gh)•w) x = w(h⁻¹•g⁻¹•x) = (g•(h•w)) x`; variant `w(g•x)` gives `(hg)•w`; `w(g⁻¹•x)=0 ⇔ x=0` | sound mathematically |
| 0.2, "is Tau Ceti's `AbsoluteValue.instMulAction`" | pinned Tau Ceti `2fd255d997`; Tau Ceti `main` at `3b47ef09ee` | pin: `instMulActionAlgEquiv` on `F ≃ₐ[R] F` only; `main`: `instMulAction` for `[Group G] [MulSemiringAction G F]` | false at the pin: R01 |
| 0.2, `smul_apply` | pin; Tau Ceti `main` | pin: `(σ • w) x = w (σ.symm x)`; `main`: `(g • w) x = w (g⁻¹ • x)` | generality not at the pin: R01 |
| 0.2, the `F ≃ₐ[K] F` case via Mathlib `AlgEquiv.applyMulSemiringAction` | `σ • x = σ x`, `σ⁻¹ = σ.symm` | `(σ • w) x = w (σ.symm x)`, equal to the pinned instance's value | sound; Mathlib instance at `Algebra/Algebra/Equiv.lean` line 702 |
| 0.2, `(g • w).under R = w.under R` under `SMulCommClass G R F` | `F = ℚ(i)`, `G = Gal(F/ℚ)`, `R = ℚ`; control `R = F`, `w` the `(2+i)`-adic value | `g⁻¹•(r•1) = r•1`, both sides `w(r)`; control: `w(2+i) < 1 = w(2−i)`, `SMulCommClass` fails | sound mathematically; lemma in this generality not at the pin: R01 |
| 0.2, `g • w` lies over `v` iff `w` does | both directions, from the row above | `(g•w).under R = v ⇔ w.under R = v` since the two restrictions are equal | sound mathematically; R01 for the name's generality |
| 0.2, `exists_algEquiv_comp_eq` (untouched, depends on the action) | `w' = σ⁻¹ • w` | `w' x = w(σ x) = (w ∘ σ) x`, the stated form | sound, unchanged |
| Scope table, row 0.2 | each of the ten names at the pin | nine found at the pin; `AbsoluteValue.instMulAction` not found | R01 |

- Source locators checked against the text: 0; the changed paragraph's only locator (Bombieri–Gubler) is unreadable, and no target of the seeded sample falls in changed or affected text.
- Library declarations opened at the pin: 6 (Tau Ceti `Analysis/AbsoluteValue/Action.lean` lines 41, 47, 54, 58; Mathlib `AlgEquiv.applyMulSemiringAction`, `Algebra/Algebra/Equiv.lean` line 702; `AbsoluteValue.under`); the same Tau Ceti file read on Tau Ceti's `main`.
- Cross-roadmap citations resolved: 1 (ArithmeticGaloisRepresentations §2.1 at this head names SubspaceTheorem §§0.1 and 0.2 in its *Needs:* line; SubspaceTheorem does not cite it back).
- The record: no layer, section or heading of the README at the merge base is removed, renumbered or retitled; the one item whose status changes is the general action of 0.2 (R01).
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 38 `sorry` warnings and nothing else; the file is unchanged against `main` and does not use the action, so the signature comparison and one-tactic probe of the earlier review stand. The change adds no headline theorem.
- The pull request's text: "`TauCetiRoadmap/SubspaceTheorem` §0.2 names the action on absolute values as Tau Ceti's `AbsoluteValue.instMulAction`, the single instance for any `MulSemiringAction G F`, with `AbsoluteValue.under_smul` and `AbsoluteValue.liesOver_smul_iff`" describes the head accurately; its claim about the library is the subject of R01.

Overlap check: read DiophantineApproximationAndTranscendence, HeightsAndUnits, AdelicHeightsAndSuccessiveMinima; the action of a group on `AbsoluteValue F ℝ` is stated only in SubspaceTheorem 0.2 (owner), which ArithmeticGaloisRepresentations §2.1 cites; nothing else shared.

Source independence: changed passages only: 2 passages (the paragraph of 0.2, the table row) compared with 1 text (the module docstring of Tau Ceti's `Analysis/AbsoluteValue/Action.lean`, at the pin and on its `main`), nothing shared beyond the formula `w ∘ g⁻¹`; largest share Bombieri–Gubler, about 50 of 174 source mentions, whose text could not be read; no layer added, removed or reordered, so the arrangement was not compared.

Research link: Layer 6 is the Schmidt–Schlickewei Subspace Theorem (1972, 1977) in the form of Evertse–Schlickewei (2002); Layer 9 is the elementary half of Evertse (2010); 7.3 is Adamczewski–Bugeaud (2007); 8.6 is Corvaja–Zannier and Bugeaud–Corvaja–Zannier (2003). Rests on the README's references and Evertse2010 §2.

## Not verifiable

- Bombieri–Gubler, Corollaries 1.3.2 and 1.3.5, the locator that opens the changed paragraph of 0.2: behind the publisher's paywall, no copy held locally; the paragraph was checked by computation and against the library, not against the source.

Automatic checks set aside as false positives: the check that the pull request changes nothing outside its roadmap folders flagged the two generated GRH umbrella files; they are regenerated from the *Needs:* lines by the repository's own workflow and their diff only records the new dependency edges.

## Source issues

- none

## For the human reviewers

- **Licence.** Tau Ceti's `Analysis/AbsoluteValue/Action.lean` says the action is also defined in `rwst/Subspace-Theorems` at `09835cb` (Apache 2.0); `Suggested.lean` was not compared with that repository.
- **Not tested.** Bombieri–Gubler, the source with the largest share of the locators (about 50 of 174 mentions), could not be read legally; the changed paragraph cites nothing new from it.
- **Pin.** R01 is repaired without touching the roadmap if the Tau Ceti pin in `lake-manifest.json` (`2fd255d997`) moves to a revision containing Tau Ceti commit `3b47ef09ee`; whether to move the pin is the maintainers' decision.
