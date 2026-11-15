# Review of EtaleHomotopyTypes (pull request #1806 at 62169a7)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 62169a7. The folder is unchanged; this round reads the pull request's title and description against the head. Both findings are about the description; neither asks for a change in the folder.

## R01 (P3) — the description makes AnabelianGeometryAndNonabelianChabauty a consumer; the head makes it an earlier, independent roadmap

**Location:** pull request description, `<!-- roadmap-summary -->` block, "Why Tau Ceti wants it": "The finite-coefficient K(π,1) applications and arithmetic fundamental-group applications of AnabelianGeometryAndNonabelianChabauty depend on results proved here: raw K(π,1) recognition, finite-cover transport, the effacement criterion, the elementary-fibration sequence and the orbit theorems."

**Claim:** AnabelianGeometryAndNonabelianChabauty does not depend on this roadmap. It merges first, cites this roadmap nowhere, and states those Schmidt–Stix theorems itself on its own carrier, as `TauCetiRoadmap/EtaleHomotopyTypes/README.md` line 13 says.

**Witness:** AnabelianGeometryAndNonabelianChabauty README at its open head c71ec32: 0 occurrences of "EtaleHomotopyTypes"; its own §§1.5, 1.6, 1.10, 1.11. Merge order: line 179 against 242. The description's own depends-on block lists it as a supplier.

**Repair:** Replace the sentence with: "The finite-coefficient K(π,1) applications and arithmetic fundamental-group applications belong to AnabelianGeometryAndNonabelianChabauty Layer 1, which merges first and states the Schmidt–Stix theorems it uses on its own pointed carrier (its §§1.5–1.6 and 1.10–1.11). This roadmap states them on the strict rigid type, with the pro-space theory beneath: raw K(π,1) recognition, finite-cover transport, the effacement criterion, the elementary-fibration sequence and the orbit theorems are the interfaces on which such applications rest."

## R02 (P3) — two sentences of the description describe a Lean file with declarations and `sorry`; the head has neither

**Location:** pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "Validation: the targeted Lake build succeeds with `sorry` as the only warning".

**Claim:** `Suggested.lean` at this head declares nothing, so there is no definition, no theorem and no `sorry` warning. The description's first paragraph says so itself ("`Suggested.lean` states nothing").

**Witness:** `TauCetiRoadmap/EtaleHomotopyTypes/Suggested.lean` lines 86–88: an empty namespace after the module docstring; the word `sorry` occurs 0 times; elaboration prints nothing (exit 0); the worker's change summary counts 0 Lean declarations added.

**Repair:** Replace the first with "`Suggested.lean` declares nothing: a module docstring naming, layer by layer, the carrier each headline lacks, and an empty namespace"; the second with "Validation: the targeted Lake build succeeds with no warning (the file has no declaration and no `sorry`)".

## Previous findings

- none: the previous report (of 62169a7) was an acceptance with no finding; its three repaired findings of the round before stand as it recorded them.

## Verified sound

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| Description: consumers named (R01) | each roadmap the summary calls a user, at main and the open heads | EllAdicHomotopyTypesAndWeights: 16 citations of this roadmap (§§0.1, 3.2–3.4), merge order 297 > 242; AnabelianGeometryAndNonabelianChabauty: 0 citations, 179 < 242; ArithmeticKTheoryPartII: order 345, no text anywhere | EllAdic sentence right; Anabelian sentence wrong | R01 |
| Description: Lean and validation sentences (R02) | `lake env lean` on `Suggested.lean`; count of `sorry`; count of declarations | 0 lines of output, exit 0; 0; 0 | "states nothing" right; "`sorry` as the only warning" and "definitions and theorems" wrong | R02 |
| Description: "identification of the raw fundamental pro-group with the finite étale group and the profiniteness … on noetherian geometrically unibranch schemes" against §3.6 | Spec k; nodal cubic (not unibranch); 𝔾_m | Spec k: π₁ = G_k, π_n trivial for n ≥ 2, Et = BG_k; nodal cubic: raw π₁ → ℤ, only its completion ℤ̂ is the finite étale group; 𝔾_m: ℤ̂(1) | description's qualifier matches README line 592 (unibranch needed for π₁ itself) | none |
| Description: "no pro-category, no étale fundamental group of a scheme, no analytification and no p-finite homotopy types" at the pins | grep of pinned Mathlib and Tau Ceti for each carrier | Pro definitions: 0 files; analytification: 0; p-finite types: 0; finite étale: `Mathlib/RingTheory/Etale/Finite.lean` only (algebras over a ring, as the docstring says) | right | none |
| Description: "every prime including 2 and 3", "one component at a time" against Conventions and §6.6 | p = 2 on Spec ℂ; ∐_ℕ Spec ℂ | both realizations a point, H^* = 𝔽₂ in degree 0; 𝔽_p^ℕ against functions on βℕ, so the completion is componentwise | matches README line 25 and §6.6 | none |

The rows of the previous reviews for the folder's statements stand as in the previous review, of `62169a7`: the folder is byte-identical.

- Description read against the head: the three paragraphs of the summary block and every clause of the prose (the results named for Layers 0–6, the not-statable sentence, the folder line, the dependencies and validation lines); two passages wrong (R01, R02). The title is right: the folder is not on `origin/main` and the pull request adds it (3 files, 1180 insertions, 0 deletions).
- The description's validation counts hold: gate at 62169a7 `set_option=0 sorry-data=0 readme-ids-missing=0 depcheck=0 outside-folder=0 build=0 OK`; `git diff --stat origin/main...HEAD` outside the folder is empty.
- Dependency check, run on this head: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line; EtaleHomotopyTypes is at line 242 of the merge order.
- Elaboration: `lake env lean TauCetiRoadmap/EtaleHomotopyTypes/Suggested.lean`, exit 0, no output; no declaration, so no padding probe and no `#check` comparison applies.
- Cross-roadmap citations resolved this round: 4 (AnabelianGeometryAndNonabelianChabauty §§1.5, 1.6, 1.10, 1.11 at its open head, lines 3952, 3976, 4304, 4326 of its README); the worker's resolver lists no cross-roadmap citation found nowhere; its one Lean-name lead (README line 721) is in untouched text the previous review passed.
- Seeded sample: none of the fifteen targets (0.5, 1.5, 1.6, 1.9, 2.2, 2.3, 4.1, 4.4, 4.5, 5.2, 6.2, 6.3, 6.5, 6.6, 6.7) falls in a changed passage, since the folder has none; not rechecked.
- Remark (untouched text): the README's Downstream consumers and the description name ArithmeticKTheoryPartII, which has no text on main or in an open pull request; it is named as a consumer only.
- Overlap check: read EllAdicHomotopyTypesAndWeights, AnabelianGeometryAndNonabelianChabauty, KanQuillen, SimplicialCategories, EnrichedLocalization (open) and StableHomotopyKTheory, BordismFormalGroups, EtaleCohomologyFoundations (main); the raw étale type is stated by AnabelianGeometryAndNonabelianChabauty §1.5 on a pointed homotopy-category carrier and here on the strict rigid carrier (README line 13 states the difference); the Kan–Quillen model is owned by GeneralizedCohomology §G2.1 on main, not here; nothing else shared.
- Source independence: changed passages only: the folder has none, so 0 passages compared with 0 sources; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- The description's "after 7 independent review rounds and 2 red-team rounds on the job board": the board's history is not among this review's inputs.
- Ownership against open pull requests beyond the sibling checkouts and the service's index of 2026-11-15T10:40:44Z was not checked.
- Giraud, SGA4, FGV, BK, AM, Fr, SGA5: settled uncertified, as in the previous report; nothing changed that uses them.

## Source issues

- none

## For the human reviewers

- none
