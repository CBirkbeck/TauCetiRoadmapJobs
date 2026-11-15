# Review of SymplecticReidemeisterTorsionModSquares (pull request #1645 at 95862e1)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 95862e1; this round reads the pull request's title and description against the head. One P3 finding, in the description only: the roadmap folder needs no edit.

## R01 (P3) — The description places the metaplectic cover in the three-manifold theorem

**Location** Pull request description, block `<!-- roadmap-summary -->`, paragraph "Why Tau Ceti wants it": "It joins graded determinants, finite-field and number-field Chern classes, Chebotarev density, low-degree bordism and the metaplectic cover into one three-manifold theorem".

**Claim** The head contradicts it: the metaplectic cover enters only the real Chern vanishing of Layer 8, a statement about group homology of discrete Sp₂ᵣ(ℝ), not the three-manifold theorem §7.5 or anything §7.5 needs.

**Witness** `README.md:1184` (§7.5 *Needs:* §7.4; §3.7; §3.2); `README.md:1208` (Layer 7 Dependencies: no MetaplecticAutomorphicForms, no Layer 8); MetaplecticAutomorphicForms occurs only at `README.md:13`, `1224`, `1246`. README line 3 calls the Bockstein argument "separate".

**Repair** Replace the sentence's first clause by: "It joins graded determinants, finite-field and number-field Chern classes, Chebotarev density and low-degree bordism into one three-manifold theorem, uses the metaplectic cover for the separate vanishing of the real degree-three Chern component, and hands later roadmaps the boundary, circle, specialization and comparison results without acyclicity hypotheses."

## Previous findings

- none: the previous report (at 95862e1) raised no finding, and its own `## Previous findings` carried none forward.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `zassenhaus_primary_formula` (`Suggested.lean:40`), cited by the description as the acceptance test | V=K, Q=x², A=1; V=K, B=(2), A=−1; ℚ², B=I₂, A=rotation by 90° | A=1: t=2, V₋=0, empty Gram det 1, det(t/2 on U=V)=1, D=1=θ(1). A=−1: t=0, V₋=V, U=0, D=2·1=2; reflection value [Q(v)]=[2]. Rotation: V₋=0, det((1+A)/2)=2/4=1/2, class [2]; reflections in (1,0),(1,1) give 1·2=2. | Agrees on all three; description's sentence on the acceptance test is correct | none |
| §7.5 topological theorem (touched by R01) | Constant rank-two system on S³; its *Needs:* closure | χ₁/₂=2−0=2, raw RT=[−1], normalized (−1)¹·[−1]=1; Chern evaluation on the zero label 1. Closure §7.4→§§7.1,7.3→Layers 3–6: 0 citations of §8.1, §8.2 or MetaplecticAutomorphicForms. | Theorem agrees; independent of Layer 8 | description only (R01) |
| §§8.1–8.2 real vanishing (touched by R01) | Kernel ℤ→ℤ/4→ℤ/2; Gal(ℂ/ℝ)=C₂ | 1↦1↦1, so the metaplectic class lifts to ℤ/4 and its Bockstein is 0; β_et(t)=t²≠0 is an isomorphism of one-dimensional groups, forcing c₃₁=0. Domain H₃(Sp₂ᵣ(ℝ);𝔽₂); no manifold in the statement. | Sound; it is where the metaplectic cover is consumed | none |

The rows for every other statement stand as in the previous review, of `95862e1`.

- Description sentences checked against the head: 14 (summary block 3 paragraphs, prose 5 paragraphs); 13 agree, 1 is R01. Checked passages: `README.md:3`, `:139`, `:588`, `:612`, `:655`, `:753`, `:804`, `:832`, `:870`, `:1134`–`:1176`, `:1214`, `:1228`, `:1250`; `Suggested.lean:1`–`57`.
- Title: adds a roadmap; `origin/main` has no such folder, 3 files added, 93 headings and 1 Lean declaration added, 0 removed. Agrees.
- Changes since the description's first head (`008fe06e`→`95862e1`, 7 README lines): no supplier added or dropped (TangentialBordism B2.5 → B5.7 within one supplier), no heading, headline or declaration changed; the description states none of the changed details, so nothing in it went stale.
- Validation paragraph, recomputed: gate at this head all counters 0, `OK` (set_option=0, sorry-data=0, readme-ids-missing=0, outside-folder=0, stray-files=0); outside-folder diff empty; worktree clean.
- Dependency check: `depcheck: 244 roadmaps, 2230 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/SymplecticReidemeisterTorsionModSquares/Suggested.lean` gives one warning, `40:8: declaration uses 'sorry'`, nothing else. Elaborated signature of the 1 declaration compared with §4.1: all five instance binders present, none dropped.
- Board reports present for the description's "1 independent review round and 2 red-team rounds": 1 package review, red-team rounds 1a/1b and 2a/2b. Agrees.
- Overlap data: no other open pull request changes this roadmap, no cited id dropped, none defined only by an open revision, no second copy on main; citation resolver lists 0 unresolved citations and 0 unresolved Lean names.

Overlap check: read FourManifolds, ArithmeticKTheory, HomotopySpheres (open), TangentialBordism, HomotopySpheres, CharacteristicClasses (main); nothing shared beyond the TangentialBordism B1–B2, B3.1, B5.7 citations, which TangentialBordism owns; results-and-headings list empty.

Source independence: changed passages only; 0 folder passages changed, so 0 passages compared with 0 sources this round; largest share AV-v1, 68 of 71 locators; no layer added, removed or reordered, so the contents comparison stands as in the earlier reviews.

## Not verifiable

- The description's attribution of the port to a named model is a statement about process, not about the head; not checkable from the folder.
- The 14 declared supplier contracts are unchanged and were not reopened; a `sorry` build verifies the signature of `zassenhaus_primary_formula`, not the theorem.

## Source issues

- none

## For the human reviewers

- **Scope.** 68 of 71 README locators point to AV-v1, cited only as arXiv:2303.13436v1 (2023), with no journal reference (`TauCetiRoadmap/SymplecticReidemeisterTorsionModSquares/README.md`, References). Whether a refereed version exists was not established.
- **Licence.** Thom (1954, Commentarii Mathematici Helvetici) is linked as an "institutional copy" on a personal archive page of a university host (README, References); the status of that copy was not settled here.
