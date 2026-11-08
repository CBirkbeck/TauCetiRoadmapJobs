# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at e083f44)

**Verdict:** needs changes

This is an incremental re-review of the 2 lines changed since f7e0d6b: the page locator of §5.7. The gate passes, the dependency check reports 0 problems, and `Suggested.lean` is unchanged.

- **R02 of the previous review (P3)** is repaired: the locator now reads "pp. 219–220 (printed)" with the three ILO14 lines, and each is where the README says.
- **R01 of the previous review (P2)** is not repaired, and the head of PurityForFlatCohomology's pull request has moved the other way: it owns §§1.4–1.5 again and names this roadmap as their importer. The two heads now hand local Lefschetz and local duality to each other. It is re-raised as R01 below with the facts that decide the direction.

## R01 (P2) — Local Lefschetz and local duality on regular local rings have two owners, and each head hands them to the other

**Location:**
- `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:23`: "PurityForFlatCohomology takes the local Lefschetz theorem from §7.3 … and owns none of these statements."
- `README.md:1570`: "PurityForFlatCohomology §1.6 consumes local Lefschetz (§7.3)".

**Claim:** This roadmap owns §§5.6–5.7, 6.3, 6.9, 6.11, 6.12, 7.1 and 7.3; PurityForFlatCohomology owns none of them and its §1.6 consumes §7.3.

**Witness:** PurityForFlatCohomology's pull request #1840 at head 0306f553 (2026-11-08 00:34, after this head):
- `TauCetiRoadmap/PurityForFlatCohomology/README.md:171–172`: the local étale duality statements and the local Lefschetz theorem (§§1.4–1.5) are "to be imported by EtaleDualityAndPerverseSheavesPartII"; `:2947–2948` repeats it.
- `:875` (§1.4) restates §7.1, §6.11 and the regular-local case of §6.12; `:928` (§1.5) restates §7.3 with the same quantifiers and the same locator, CS24 Lemma 3.2.3.
- `:962` and `:966`: §1.6 cites its own §1.5, not §7.3 here.

The history of that head: commit 48f8bb15 (2026-11-07 22:57) applied the previous review's repair (deleted §§1.4–1.5, cited §§7.1, 6.10–6.12 and 7.3 here); commit 758db60f (23:09) withdrew it because the non-movable dependency check printed `UPWARD: PurityForFlatCohomology (#220) -> EtaleDualityAndPerverseSheavesPartII (#385)`. PurityForFlatCohomology's review ~3 then wrote that its position "is the correct one by merge order" and that this pull request "must cite §§1.4–1.5 here".

**Why the merge-order argument does not settle it the other way.**
1. The merge order is movable. I ran the dependency check with `--movable` on the README of commit 48f8bb15 (the text that cites this roadmap), saved in my scratch directory: `moved: PurityForFlatCohomology moved in the merge order from #220 to #385, right after its last supplier EtaleDualityAndPerverseSheavesPartII; checked as moved`, then `depcheck: 243 roadmaps, 2458 edges, 0 problem(s)`. A `moved:` line is not a defect under the project's rule; the worker moves the roadmap when it submits. Without `--movable` the same text gives the one UPWARD line quoted above and nothing else.
2. The move obstructs nothing. `roadmaps grep --readme-only 'PurityForFlatCohomology'` over main and the 476 open heads hits only this roadmap (consumer paragraph and Scope, no supplier edge), #1840 itself, and GroupSchemesOverABase #1522, which the merge order does not list. SchemeAndStackFoundationsPartII (`ORDER.txt` line 258), which #1840 names as a future importer of its Layer 3, is not on main and cites PurityForFlatCohomology nowhere.
3. The content cannot be owned earlier. PurityForFlatCohomology §1.4(a) is Gabber's affine Lefschetz theorem for a strictly henselian excellent regular local ring, ILO14 XV Corollaire 1.2.4 (ILO14 line 10362); §1.4(b)'s dualizing clause is ILO14 XVII Théorème 0.9 (line 12220). Its route says these "are Gabber's theorems at the locators above and are the substance of this target" (`:901`), with *Needs* EtaleCohomologyFoundations §F.5, LefschetzPencilsAndVanishingCycles §0.10 and SchemeAndStackFoundations §§0.21, 2.15 (`:902–904`). None of these gives uniformization, oriented descent or the finiteness theorem, which ILO14's proof uses (ILO14 lines 10429–10431, 10471, 10559) and which only Layers 0–5 here plan. PurityForFlatCohomology's own gate report (GATE-PurityForFlatCohomology~1, H01) states exactly this and lists "put this roadmap after EtaleDualityAndPerverseSheavesPartII and reapply 48f8bb1" as a clean settlement. Owning §1.4(a) there is therefore either an unowned prerequisite or a re-plan of this roadmap's Layers 0–5, and citing it from here would make §7.1 (a special case of §5.7, proved here) depend on a roadmap that cannot prove it.

**Repair:**

*In this folder:* no edit. Lines 23 and 1570 state the single-owner assignment that the mathematics forces, and they are correct once #1840 reapplies 48f8bb15.

*In PurityForFlatCohomology's pull request #1840 (same author):* reapply commit 48f8bb15's ownership text, that is delete §§1.4–1.5, the bullets at `:171–172` and `:2947–2948`, and the local-duality and local-Lefschetz clause of the Scope's owned list (`:70–71`); restore the `From TauCetiRoadmap.EtaleDualityAndPerverseSheavesPartII` contract citing §7.1 for §1.4(a), §6.11 and §6.10's regular clause for §1.4(b), §6.12 for §1.4(c) and §7.3 for §1.5; in §1.6 (`:962`, `:966`) cite "EtaleDualityAndPerverseSheavesPartII §7.3". Run its gate with the movable dependency check: on that text it prints the `moved:` line and 0 problems (tested, above). Keep the three independent fixes of 48f8bb15 that 758db60f retained.

If the operator instead settles ownership at PurityForFlatCohomology, this folder's edit would be to delete §§7.1 and 7.3 and the regular-local case of §6.12 and cite its §§1.4–1.5, but §1.4(a) there then has no owner for Gabber's affine Lefschetz theorem, so I do not recommend it.

## Previous findings

- R01 — not repaired: `README.md:23` still reads "PurityForFlatCohomology takes the local Lefschetz theorem from §7.3 … and owns none of these statements"; #1840 head 0306f553 owns §§1.4–1.5 and names this roadmap as the importer (`:171–172`). Re-raised as R01.
- R02 — repaired: `README.md:984` reads "(ILO14, Exposé XV, Corollaire 1.2.2 and Corollaire 1.2.4, pp. 219–220 (printed); Exposé 0, Corollaire 8, p. 5; ILO14 lines 10350, 10362, 396)". Each line and page checked below.

## Verified sound

**Scope of this re-review.**
- The diff is one line, `README.md:984`, the locator sentence of §5.7. I read §5.7 in full (`:982–996`) and the two passages that cite it, Scope `:23` and §7.1's route (`:1378`), and the Downstream consumers paragraph (`:1570`), because R01 lives there.
- `git diff --stat origin/main...HEAD` outside the folder lists 0 paths. `Suggested.lean` has a 0-line diff since f7e0d6b.

**Gate.** Run on this head: every scanner 0, result `OK`, exit 0 (the worker's gate also reports `build=0`). The required dependency check, complete output:

```text
depcheck: 243 roadmaps, 2457 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The diff adds no cross-roadmap citation.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/Suggested.lean` takes 15 s and exits 0; the only warnings are six "declaration uses `sorry`" (lines 65, 88, 181, 225, 262, 280). The file is unchanged since c83a1a6, so the `#check @name` comparison of all 9 declarations from the earlier reports stands: 0 dropped binders, and `scratch/signatures.md` agrees for all 9. The module docstring still names local Lefschetz as not statable (local étale cohomology with supports is missing at the pins). The one-tactic padding probe of the earlier full reviews stands for the same reason.

**Sources checked at this head.** ILO14 is the arXiv v1 text; its file page is the printed page + 6 (file page 226 carries the running head "220 XV. THÉORÈME DE LEFSCHETZ AFFINE" at line 10361).

| Target | Text read | Outcome |
| --- | --- | --- |
| §5.7, Corollaire 1.2.2 | ILO14 line 10350: X quasi-excellent strictly local with δ_X(t) = dim closure of t; `H^q(Y, F) = 0` for q > f^*δ_X(F); the footer "219" is at line 10359 | Printed p. 219; hypotheses agree with the README. |
| §5.7, Corollaire 1.2.4 | ILO14 line 10362, after the p. 220 head at 10361: X strictly local quasi-excellent of dimension d, U affine open, n invertible; `H^q(U, ℤ/n) = 0` for q > d | Printed p. 220; statement identical to the README's first sentence. |
| §5.7, Exposé 0 Corollaire 8 | ILO14 line 396, under the running head "0. INTRODUCTION 5" (line 369) and before "6" (line 416): X local noetherian henselian quasi-excellent of dimension d, residue field k, U affine open, ℓ invertible; cd_ℓ(U) ≤ d + cd_ℓ(k), and cd_ℓ(K) = d + cd_ℓ(k) for X integral | Printed p. 5; both clauses of the README's second sentence agree. |
| PurityForFlatCohomology §1.4(a) (R01) | ILO14 line 10362 again; CS24 (3.2.3.2) p. 33 | The statement owned there is §7.1 here, a case of §5.7. |

**Cross-roadmap citations resolved this round.**
- PurityForFlatCohomology at #1840 head 0306f553 (local checkout): §1.4 at `:875`, §1.5 at `:928`, §1.6 at `:950` with *Needs* "§§0.2, 1.1, 1.5; LefschetzPencilsAndVanishingCycles §0.10; …" (`:966`); ownership bullets at `:171–172` and `:2947–2948`; owned list at `:70–71`.
- The same roadmap at commit 48f8bb15 (via `git show`, saved to scratch): contract `### From TauCetiRoadmap.EtaleDualityAndPerverseSheavesPartII` at its line 354, *Needs* citations at 860 and 972.
- Merge order: LefschetzPencilsAndVanishingCycles 56, EtaleCohomologyFoundations 57, PurityForFlatCohomology 221, SchemeAndStackFoundationsPartII 258, EtaleDualityAndPerverseSheavesPartII 386.
- `scratch/overlaps.md` lists no dropped ids and no other pull request that changes this roadmap; `scratch/citations.md` lists the same 7 leads as the previous rounds (PerfectoidQuotientsPartII §Q5.1 and six supplier Lean names), untouched by the diff and settled in the earlier reports.

**Adversarial table.** Λ = ℤ/ℓ or ℤ/n with n invertible; grading cohomological.

| Statement | Instances tried | Values on each side | Result / change |
| --- | --- | --- | --- |
| §5.7 locator (`:984`, changed) | the three cited lines against the page markers | Line 10350 lies between file-page marker 225 (printed 219) and the footer "219" at 10359; line 10362 follows the head "220" at 10361; line 396 follows the head "5" at 369 and precedes "6" at 416 | "pp. 219–220" and "p. 5" correct; no change. |
| §5.7 statement (sample, unchanged text) | strict trait with U = η; henselian DVR over 𝔽_q; strictly local artinian X | **Trait:** `H^q(η, Λ) = 0` for q > 1 (tame inertia ℤ_ℓ(1) has cd 1), matching d = 1. **DVR over 𝔽_q:** cd_ℓ(K) = 1 + cd_ℓ(𝔽_q) = 2. **Artinian:** U ∈ {∅, X}, `H^q(X, Λ) = 0` for q > 0 = d. | Correct. |
| Scope `:23` "owns none of these statements" | #1840 head 0306f553 | `:171–172` and `:875–948` own §§1.4–1.5 | False at that head (R01). |
| §7.3 against PurityForFlatCohomology §1.5 | DVR, f = π; k⟦x,y⟧, f = x; f = 0 | **DVR:** degree 0 is `0 → ℤ/ℓ`, injective not onto, both sides. **k⟦x,y⟧:** degrees 0, 1 are `0 → 0`; degree 2 is `0 → ℤ/ℓ(−1)`, both sides. **f = 0:** identity, both sides. | Same values on every instance: a duplicate, not a divergence (R01). |
| §7.1 against PurityForFlatCohomology §1.4(a) | d = 1, f = π; f = 0; f a unit | **d = 1:** `R[1/f] = L`, cd_ℓ L = 1, vanishing for i > 1 on both sides. **f = 0:** empty scheme. **f a unit:** outside f ∈ 𝔪 on both sides. | Same statement; one owner needed (R01). |
| Downstream consumers (`:1570`) | #1840 §1.6 at head | cites its own §1.5 (`:962`, `:966`), not §7.3 | False at that head (R01). |
| 0.1–0.8, 1.1–1.7, 2.1–2.4, 3.1–3.6, 4.1–4.2, 5.1–5.6, 5.8, 6.1–6.12, 7.2, 8.1–8.6, and the 9 Lean declarations | as in the reviews at f7e0d6b, c83a1a6, ffdd816, d6c3ae4, f7fc49c and 047baea | values recorded there | Textually unchanged; carried forward. |

**Declared gaps.** The five gap slugs and their contracts are untouched by the diff; the previous checks stand. No new gap.

**Ownership against open work.** Searched with `roadmaps grep` over main and the 476 open heads: "PurityForFlatCohomology" (three hits, listed under R01); the "affine Lefschetz", "local Lefschetz" and "local étale duality" searches of the previous review were not repeated, since the diff adds no object.

## Not verifiable

- **Ill03** and **Epp73** remain settled as uncertified. The diff does not touch them.
- The published Astérisque pages of the ILO14 locators were not compared; the README states arXiv v1 printed pages.

## Source issues

- none
