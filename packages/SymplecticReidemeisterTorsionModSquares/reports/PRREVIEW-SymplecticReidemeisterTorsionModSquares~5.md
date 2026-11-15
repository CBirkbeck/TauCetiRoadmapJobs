# Review of SymplecticReidemeisterTorsionModSquares (pull request #1645 at d54bae5)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 95862e1; this round reads the pull request's title and description, as they stand now, against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "…Chebotarev density and low-degree bordism into one three-manifold theorem… The metaplectic cover enters only the separate real statement, via the vanishing Bockstein of its class", which agrees with `README.md:1184`, `:1214`–`:1230`.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §§8.1–8.2 real vanishing, cited by the repaired sentence | r=1, G=SL₂(ℝ), π₁=ℤ; Gal(ℂ/ℝ)=C₂ | Covers by 2ℤ and 4ℤ: ℤ/4→ℤ/2 sends 1↦1, so the metaplectic class lifts to ℤ/4, group Bockstein 0. H*(C₂;𝔽₂)=𝔽₂[t], β_et(t)=t²≠0, so ker β_et=0 and c₃₁=0. | Agrees: the cover is consumed here, through a vanishing Bockstein | none |
| §7.5 topological theorem, the description's headline | S³ and ℝP³, constant rank two; ℝP³, sign character ⊗ rank two, K=𝔽₃ | χ₁/₂ = 2−0 = 2; 2−0 = 2; 0−0 = 0: even in all three. *Needs:* closure §7.4, §3.7, §3.2 has 0 citations of Layer 8 or MetaplecticAutomorphicForms. | Agrees with "the semicharacteristic is even"; independent of the metaplectic cover | none |
| `zassenhaus_primary_formula` (`Suggested.lean:40`), the description's acceptance test | K², Q=x²+3y²: A=−1; A=reflection in e₂; Q=x²+y², A=diag(−1,1) | A=−1: V₋=K², U=0, D=det diag(1,3)=3; reflections give 1·3=3. Reflection in e₂: Gram 3, det(t/2 on ⟨e₁⟩)=1, D=3=Q(e₂). diag(−1,1): D=1·1=1=Q(e₁). | Agrees on all three | none |

The rows for every other statement stand as in the previous review, of `95862e1`.

- Description sentences checked against the head: 14 (summary block 3 paragraphs, prose 5 paragraphs); 14 agree. Passages opened: `README.md:3`, `:610`, `:802`, `:830`, `:868`, `:1176`–`:1184`, `:1212`–`:1246`; `Suggested.lean:1`–`57`.
- Title and kind of change: the folder is absent from `origin/main`; 3 files, 93 headings and 1 Lean declaration added, 0 removed. The description says it adds a roadmap folder; agrees.
- Folder diff `95862e1`→`d54bae5`: empty. The head is a merge of main; `git diff --stat origin/main...HEAD` outside the folder is empty, so the files listed as changed since `95862e1` are main's own.
- Suppliers: all 12 `From …` subsections resolve to a folder on main or to an open roadmap named in the description's dependency block; none added or dropped since the previous review.
- Gate, rerun at this head: every counter 0, `OK` (including `outside-folder=0`, `stray-files=0`, `readme-ids-missing=0`, `depcheck=0`); the worker's run adds `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/SymplecticReidemeisterTorsionModSquares/Suggested.lean` gives one warning, `40:8: declaration uses 'sorry'`. Elaborated signature of the 1 declaration: five instance binders, `Q`, `hQ`, `A` all present; none dropped.
- Board reports for "1 independent review round and 2 red-team rounds": 1 package review, red-team rounds 1a/1b and 2a/2b present. Overlap data: no other open pull request changes this roadmap, 0 cited ids dropped, 0 defined only by an open revision, no second copy on main; 0 unresolved citations, 0 unresolved Lean names.

Overlap check: read FourManifolds, ArithmeticKTheory, HomotopySpheres (open), TangentialBordism, HomotopySpheres, CharacteristicClasses (main); nothing shared beyond the TangentialBordism citations, which TangentialBordism owns; results-and-headings list empty.

Source independence: changed passages only; 0 folder passages changed, so 0 passages compared with 0 sources this round; largest share AV-v1, 68 of 71 locators; no layer added, removed or reordered, so the contents comparison stands as in the earlier reviews.

## Not verifiable

- The description's attribution of the port to a named model is a statement about process, not checkable from the folder.
- The 14 declared supplier contracts are unchanged and were not reopened; a `sorry` build verifies the signature of `zassenhaus_primary_formula`, not the theorem.

## Source issues

- none

## For the human reviewers

- **Scope.** 68 of 71 README locators point to AV-v1, cited only as arXiv:2303.13436v1 (2023), with no journal reference (`TauCetiRoadmap/SymplecticReidemeisterTorsionModSquares/README.md`, References). Whether a refereed version exists was not established.
- **Licence.** Thom (1954, Commentarii Mathematici Helvetici) is linked as an "institutional copy" on a personal archive page of a university host (README, References); the status of that copy was not settled here.
