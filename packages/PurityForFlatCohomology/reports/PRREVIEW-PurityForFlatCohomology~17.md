# Review of PurityForFlatCohomology (pull request #1840 at a825987)

**Verdict:** accepted

Incremental re-review of 0 changed lines since a825987. The folder is unchanged; this round read the pull request's title and description against the head. No finding.

## Previous findings

- R01 — repaired: the description's summary block now reads "Zariski–Nagata purity and the étale-depth bound for coefficients of invertible order need no perfectoid input; for every commutative finite étale group the bound follows from complete-intersection purity", which is what §1.6 and §6.3 say.

## Verified sound

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | Description: étale-depth bound, invertible order (§1.6) and every finite étale `G` (§6.3, `etaleDepth_ge_virtualDimension`) | `R = k⟦x,y⟧/(xy)`, `vdim = 2 − 1 = 1`; `G = ℤ/ℓ` (`ℓ` invertible) and `G = ℤ/p`, `char k = p` | `U_R` = two points: `G(R) = ℤ/n → G(U_R) = (ℤ/n)²` diagonal, so `H⁰_𝔪 = 0`, `H¹_𝔪 ⊇ coker = ℤ/n ≠ 0` | vanishing for `i < 1`, fails at `i = 1 = vdim`; Lean: injective at `i = 0`, bijectivity clause needs `1 < 1`, not claimed | none |
| 2 | Description: "Zariski–Nagata purity assumes no excellence or normality" (§1.8, `zariskiNagata_full_faithful_connected`) | `R = k⟦x,y,z⟧/(xy)`, non-normal, `vdim = 2`; `R = k⟦x,y⟧/(xy)`, `vdim = 1` | `vdim 2`: `U_R` = two punctured planes meeting in a punctured line, connected. `vdim 1`: `U_R` = two points, disconnected | the Lean hypotheses are `IsLocalRing`, `IsNoetherianRing`, `2 ≤ vdim` only; the bound 2 is sharp | none |
| 3 | Description: "The vanishing and Hartogs lemmas hold over any ring" (§§0.4, 0.5) | `A = k[x_1, x_2, …]` (non-Noetherian), `M = A`, `Z = V(x_1, x_2)`; and `Z = Spec A`, `d ≥ 1` | `x_1, x_2` regular: `H⁰_Z = 0`, `H¹_Z = 0` (`A → A[1/x_1] ∩ A[1/x_2]` bijective). `Z = Spec A`: `H⁰_Z = A ≠ 0` | §0.4 and §0.5 both say "No Noetherian hypothesis"; the hypothesis that the sequence vanishes on `Z` is needed | none |

The rows of the previous reviews for untouched statements stand as in the previous review, of `a825987`; the diff changes no statement.

- The description against the head: the fifteen theorems its prose lists are the fifteen theorems of `Suggested.lean` (25 declarations: 15 theorems, 10 definitions), each with the hypotheses the prose gives (elaborated signatures compared: strictly henselian regular of dimension `≥ 2`; henselian regular with residue field of dimension at most one; locally Noetherian with regular local rings of dimension `≥ 2` along the closed subset; `vdim ≥ 2` and `≥ 3`). The folder holds `README.md`, `Suggested.lean`, `metadata.toml`, as it says; it adds a roadmap that is not on main, and says so by its title and "Roadmap folder" sentence.
- The description's suppliers and consumers: the 19 `### From TauCetiRoadmap.*` contracts of the README are 8 roadmaps on main (SchemeAndStackFoundations, LocalPurity, ModularCurves, ReductiveGroups, EtaleCohomologyFoundations, DerivedModuleAlgebra, EnhancedDerivedSheaves, PerfectoidSpaces) and the 11 open ones of the `depends-on` block; the two consumers it names are those of `README.md` lines 211–219 and 3492–3498, with the sections it attributes to them (§0.2 and Layer 3; §§1.4–1.5).
- The module docstring names every headline it does not state (eight items, each with the missing carrier), as the description says.
- Cross-roadmap citations resolved: 2 (SchemeAndStackFoundationsPartII at its open head cites this roadmap's §0.2, §0.3 and Layer 3 as owned here; GroupSchemesOverABase at its open head, see below). Citations found nowhere: 0. Overlaps: no other open pull request changes the roadmap, no cited id dropped, none defined only by an open revision.
- Source locators checked: 0 new; no passage changed, so no seeded target falls in a changed passage, and the README flags no locator as unverified.
- Gate rerun at a825987: every counter 0, `OK`; the worker's `gate.md` shows `build=0`. Dependency check: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 15 warnings, all ``declaration uses `sorry` ``, 0 errors. Outside-folder diff against `origin/main`: empty.
- Overlap check: read SchemeAndStackFoundationsPartII, LocalPurity, GroupSchemesOverABase; fppf cohomology with supports and Layer 3: owned here, cited by SchemeAndStackFoundationsPartII; Zariski–Nagata purity for regular rings: owner LocalPurity, cited here; groups of multiplicative type over an arbitrary base: owned here and by GroupSchemesOverABase (see For the human reviewers).
- Source independence: changed passages only; 0 passages changed, so 0 compared with 0 sources; largest share CS24, unchanged; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- The description's sentence on AI assistance (the number of review and red-team rounds on the job board): the board's history is not among the files of this review.
- As before: SGA3 VIII–X (§§7.12a–7.12e), Aus62 Theorem 1.3 (§7.2), DF84 Remark 3 (§8.18), Avr77 Proposition 3.6 (§1.2) are uncertified, cited by locator only.

## Source issues

- none

## For the human reviewers

- **Scope.** GroupSchemesOverABase (open, #1522; its Scope and Layer 2) owns the same objects as §§7.12a–7.12e here, groups of multiplicative type and tori over an arbitrary base; this README does not name it. Which roadmap owns them is undecided.
