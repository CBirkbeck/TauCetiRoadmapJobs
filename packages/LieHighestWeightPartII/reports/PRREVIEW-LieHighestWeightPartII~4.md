# Review of LieHighestWeightPartII (pull request #2277 at 72812a6)

**Verdict:** needs changes

Incremental re-review of 106 changed lines since `26297a5`. Three findings, all P3; none blocks on the mathematics.

## R01 (P3) — LieHighestWeight §5.1 citation is dropped by that roadmap's open revision

**Location:** `TauCetiRoadmap/LieHighestWeightPartII/README.md` line 14: "The symmetry sign of the invariant form on a finite-dimensional self-dual irreducible module is TauCetiRoadmap.RepresentationTheory.LieHighestWeight §5.1 (`invariantForm_isSymm_iff_tits_sign`)"; and line 314, last sentence of the bullet.

**Claim:** The citation added at this head resolves on main only. The open revision of LieHighestWeight (#1797) renumbers §5.1 and removes the target, with no old → new mapping, so the citation breaks when it merges.

**Witness:** Main: LieHighestWeight README line 1440 (`### 5.1 Opposition, ordinary duality and self-duality`), target at line 1485. Head of #1797: line 834 is `### 5.1 The invariant form on weights and the Casimir element`; `tits_sign` occurs in neither file there, nor in any other roadmap.

**Repair:** State the fact here; §2.1 already proves it. Line 14, replace the two sentences from "The symmetry sign of the invariant form …" to "… the only case §2.2 needs." by: "§2.1 constructs the explicit invariant form `β_n` on each standard `sl₂`-module and proves from its Gram matrix that it is symmetric for even `n` and alternating for odd `n`; this is the only symmetry sign §2.2 needs, and no symmetry sign on a module of a larger algebra is stated or consumed here." Line 314: delete the sentence "This is the case `L = sl₂` … Gram matrix of `β_n`." Tested: with both removed, every LieHighestWeight citation left (Layer 7 with `serreLift_injective_of_base`, Layer 8) resolves on main (lines 1744, 2220) and at #1797 (lines 961, 1101).

## R02 (P3) — Description counts nine headline theorems; the head states eleven

**Location:** Pull request description: "`Suggested.lean` states nine headline theorems: restricted-module recovery, recognition in types `A`, `C`, `B`/`D` with an odd part and full type `D`, exceptional adjoint recognition, semisimple recognition, the half-integrality test, and positive-real-part recognition."

**Claim:** The head adds two theorems to `Suggested.lean` that the sentence neither counts nor names.

**Witness:** `TauCetiRoadmap/LieHighestWeightPartII/Suggested.lean` lines 72 (`exists_innerAut_iff_neutral_conjugate`) and 286 (`existsUnique_positiveRealPart`); elaboration reports 11 `sorry` declarations, 16 declarations in all.

**Repair:** "`Suggested.lean` states eleven headline theorems: conjugacy of triples from their neutral elements, restricted-module recovery, recognition in types `A`, `C`, `B`/`D` with an odd part and full type `D`, exceptional adjoint recognition, semisimple recognition, the half-integrality test, existence and uniqueness of the positive real part, and positive-real-part recognition."

## R03 (P3) — Description omits the supplier MotivesAndAlgebraicCycles and misdescribes the LieHighestWeight citations

**Location:** Pull request description: "Roadmaps on main and ReductiveGroupsPartIII are cited by name and section as suppliers."; and "cited by layer and target so that the citations name the same content on main and in the open revision of LieHighestWeight".

**Claim:** The head adds a supplier that is not on main and that the prose does not name. The second sentence is contradicted by the §5.1 citation of R01 until that is repaired.

**Witness:** README line 122, `### From TauCetiRoadmap.MotivesAndAlgebraicCycles` (§§6.2–6.3), consumed in the `*Needs:*` of §5.3 (line 566) and the Layer 5 dependencies (line 618); MotivesAndAlgebraicCycles is open as #1313, merge order line 95.

**Repair:** "Roadmaps on main, ReductiveGroupsPartIII and MotivesAndAlgebraicCycles (§§6.2–6.3, tensor generation by a faithful comodule, used in §5.3) are cited by name and section as suppliers." The second sentence stands once R01 is repaired.

## Previous findings

- none: the previous report, of `26297a5`, raised no finding.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `exists_innerAut_iff_neutral_conjugate` (§0.3, new in Lean) | `L = 0`; sl₂ `(H,E,F)` vs `(H,cE,c⁻¹F)`; vs `(−H,F,E)`; zero vs nonzero triple | `L=0`: both true. Second: `Ad(diag(c^½,c^−½))` conjugates, needs `√c`. Third: `Ad(w)` then `Ad(diag(i,−i))` gives `E↦F`. Fourth: `h=0` forces `e=f=0`, both sides false | True; `IsAlgClosed` is used and present | None |
| §0.3 route: `f` determined by `h, e` | sl₂, `(H,E,F)` | `ker(ad E) ∩ L_(−2) = KE ∩ KF = 0` | Holds | None |
| `existsUnique_positiveRealPart` (§5.4, new in Lean) | `GL₁`, `s = 2i`; trivial group; `SL₂`, unipotent `s` (hypothesis dropped) | `GL₁`: weight `n` gives `(2i)ⁿ`, forces `r = 2`. Trivial: `r = 1`. Unipotent: `r = s` and `r = 1` both satisfy the predicate | True; semisimplicity needed and present | None |
| §3.2 Checks, `G₂`, `A = [[2,−1],[−3,2]]` | principal; `(0,1)`; `(1,0)`; `(−1,0)` | Heights `1,1,2,3,4,5`, top `10`, total `2+12=14`. `(0,1)`: `D = 4,4,1`. `(1,0)`: `D = 4,2,1,2`. `θ = 3α₁+2α₂` gives bound `3` | All as stated | None |
| §3.2 Check, `F₄` principal | `a = (2,2,2,2)` | `D_0 = 4`, `D_2 = 4`, `θ` of height `11` so `D_22 = 1`; `Σ_(j≤0) = 4+24 = 28`; without rank term `48` | As stated | None |
| §3.3 Check, `G₂` top degrees | labels `0,(0,1),(1,0),(0,2),(2,2)` | `Σ a_i θ_i = 0, 2, 3, 4, 10`, pairwise distinct | Injective on these five | None |
| §3.5 Checks against CH Tables 2–4 | `E₈` principal; `F₄` `A1`, `~A1`; `G₂` `(0,2)` | CH line 1737: `i_max 58`, starts `8,0,8`, ends `1`. `F₄`: `22 = 4+18` both; `D_1 = 14` vs `8` (CH lines 1827–1828). `G₂`: `4 + 2·5 = 14` (CH line 1833) | Agree with CH rows | None |
| §5.3 generation by a faithful comodule | `𝔾_m`, `V` the weight-one character | Coefficient `t`, antipode image `t⁻¹`; together generate `K[t,t⁻¹] = H`; `t` alone gives `K[t] ≠ H`, so the dual is needed | Matches MotivesAndAlgebraicCycles §§6.2–6.3 and the pinned criterion | None |
| Downstream reduction to §5.5 | `SL₃` adjoint, `ν = 0`; `q > 1` | `n_(ν,τ)(0) = 8 = weightPattern` at `0`; `7` distinct weights; `τ(q^ν)` acts by `q^⟨μ,ν⟩ > 0` | As stated | None |
| §2.0 Killing inputs | `so(2)`; `sp(0)`; `so(3)` | `hasTrivialRadical_so` asks `3 ≤ card`: excludes `so(2)` (abelian), admits `so(3)`; `hasTrivialRadical_sp` has no nonemptiness hypothesis | README states both ranges correctly | None |

Rows for the untouched statements stand as in the previous review, of `26297a5`.

- Source locators checked against the text: 9. DG lines 139, 143, 151 (p.4) and 262 with Appendix A on pp.7–15; SOM line 361 (p.15) and its title page; CH line 781 (§6, p.16), line 1737 (p.36), Tables 2–4 at lines 1734–1837 (pp.35–37).
- Pinned Tau Ceti declarations opened: 9. `Tangent/Lie/Adjoint/Centralizer/Basic.lean:81`, `:147`; `…/Centralizer/Eigenspace.lean:94`, `:190`; `Representation/Orbit.lean:278`, `:287` (finite type, algebraically closed, characteristic zero); `Lie/Symplectic/Killing.lean:160`; `Lie/Orthogonal/Killing.lean:206`; `Representation/Faithful/Basic.lean:311`.
- Cross-roadmap citations resolved: 4. LieHighestWeight §5.1 (main only, R01); MotivesAndAlgebraicCycles §6.2 and §6.3 at #1313; GlobalShtukasAndFunctionFieldLanglandsPartII §8.0 at its head (states recognition for Frobenius-fixed `ν`, proof route through Weyl characters, as README line 24 says).
- Gate rerun at this head: every scanner 0, `OK`. Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration of `Suggested.lean`: 11 warnings, all `declaration uses sorry`, no error. Elaborated signatures of the two new theorems compared with README §0.3 and §5.4: same hypotheses, no lost binder.
- One-tactic probe of the two new theorems (`simp`, `rfl`, `infer_instance`): none closes; neither is padding. No declaration of the same name or statement in the pinned libraries or in any other roadmap.
- Overlap check: read LieHighestWeight (main and #1797), MotivesAndAlgebraicCycles (#1313), GlobalShtukasAndFunctionFieldLanglandsPartII, ReductiveGroups; one shared object: recognition of real parts from weight patterns, owner §5.5 here. GlobalShtukasAndFunctionFieldLanglandsPartII §8.0 proves its form independently and does not cite §5.5; that roadmap is later in the merge order, so the citation is its to add.
- Source independence: changed passages only; 5 passages compared with 3 sources (DG, SOM, CH), none shared (the table rows formerly listed are replaced by single computed values); largest share CH, 24 of 37 explicit line locators; no layer added, removed or reordered, so the contents comparison of the earlier review stands.

## Not verifiable

- Published CH, DG and KIR versions remain uncollated with the arXiv versions and author-page draft the README cites; the locators above are to the versions cited.
- The description's sentence on AI assistance and later author-side passes describes process, not the head; it was not checked.

## Source issues

- none

## For the human reviewers

- **Scope.** The four end theorems are Lemmas 2.4, 6.30, 10.9 and Proposition 10.2 of CH, read at arXiv v1; CH supplies 24 of the README's 37 explicit line-locator occurrences.
- **Scope.** §3.3 asserts injectivity on 7, 28, 34, 274, 245 candidate profiles. CH reports a computer calculation without a proof; an earlier review reproduced those counts by script.
- **Licence.** SOM is unpublished workshop notes (§3.2 unfinished, §4.1 empty), hosted on another mathematician's university page; the manifest classifies the copy as institutional.
- **Licence.** KIR is the author-page draft of a Cambridge University Press book; the manifest classifies the copy as author-page.
