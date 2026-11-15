# Review of AutomorphicBundlesPartII (pull request #1823 at 3330afd)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 3330afd; this round reads the pull request's title and description against the head and re-runs the gate. The gate now fails on one `statement-hygiene` rule (R01), and three sentences of the description disagree with the head (R02–R04). All four are P3.

## R01 (P3) — gate `statement-hygiene`: a `Nonempty (… ≃ₗ …)` conclusion under a name without `nonempty_`

**Location.** `TauCetiRoadmap/AutomorphicBundlesPartII/Suggested.lean` lines 73–80: "theorem finiteCoefficientSerreDuality … : Nonempty (Module.Dual (dvrCoefficientRing O ϖ n) (integerCoherentCohomology …) ≃ₗ[dvrCoefficientRing O ϖ n] integerCoherentCohomology … ((d : ℤ) - i))".

**Claim.** The gate fails: a theorem concluding `Nonempty` of an equivalence must be named `nonempty_*` (or state the canonical map with `IsIso`, or give the isomorphism as data).

**Witness.** Gate at 3330afd: `statement-hygiene=1 … FAIL`, "line 80: P3 theorem `finiteCoefficientSerreDuality` concludes `Nonempty (Module.Dual …`". The file's docstring says the canonical map needs the coherent duality trace, absent at the pins.

**Repair.** Rename the theorem to `nonempty_finiteCoefficientSerreDuality` (statement unchanged) and replace the backticked name in README §1.6 (line 323) and in the description's summary block. Tested: the hygiene scanner returns no hit on a copy of the file with only this rename.

## R02 (P3) — description: "thirteen other headlines"; the docstring lists fourteen

**Location.** Pull request description: "the module docstring lists the thirteen other headlines and the carriers each lacks at the pins."

**Claim.** The count is wrong at this head.

**Witness.** `Suggested.lean` lines 18–31: fourteen bullets (Layer 2; Layer 3 ×2; Layers 3–4; Layer 5 ×3; Layer 6 ×2; Layer 7; Layer 8 ×4); `grep -c '^\* '` gives 14.

**Repair.** "the module docstring lists the fourteen other headlines and the carriers each lacks at the pins."

## R03 (P3) — description: `cm_serre_duality` attributed to the library

**Location.** Pull request description, summary block: "The duality theorem also extends the library's Serre duality for curves and `cm_serre_duality` to arbitrary relative dimension over Artinian DVR quotients."

**Claim.** `cm_serre_duality` is not a library declaration, and it already holds in arbitrary dimension (over a field); only the curve statement is the library's.

**Witness.** README line 13: "SchemeAndStackFoundations §2.20's `cm_serre_duality` is Serre duality for a proper Cohen–Macaulay scheme over a field". `grep -rn cm_serre_duality` over the pinned Tau Ceti: no hit.

**Repair.** "The duality theorem extends Tau Ceti's Serre duality for curves over a field to arbitrary relative dimension, and SchemeAndStackFoundations §2.20's `cm_serre_duality` from a field to Artinian DVR quotients, for smooth proper schemes and finite locally free coefficients."

## R04 (P3) — description: "Hilbert–Siegel threefolds"

**Location.** Pull request description, first paragraph after the summary block: "to the higher coherent cohomology of Siegel and Hilbert–Siegel threefolds."

**Claim.** The Hilbert–Siegel varieties of the roadmap are not threefolds for F≠ℚ.

**Witness.** README §5.0 line 873: "At hyperspecial p-level with p totally split, the integral model is smooth of relative dimension 3[F:ℚ]." The README uses "threefold" for Siegel only (lines 3, 1251).

**Repair.** "to the higher coherent cohomology of Siegel threefolds and of the Hilbert–Siegel varieties of Res_(F/ℚ)GSp₄ (dimension 3[F:ℚ])."

## Previous findings

- none: the previous report (of 3330afd, the same head) had no finding; its own `## Previous findings` bullets (the Δ(Π₀) splitting of §5.0, the §5.1 descent sentence) stand, the folder being unchanged.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.6 / `finiteCoefficientSerreDuality` (touched by R01; cited by the description) | O=ℤ₂, ϖ=2, n=2, A=ℤ/4, X=ℙ¹_A, d=1, F=O(1), i=0,1,2 | Hom(F,Ω)=O(−3). i=1: Dual(H¹(O(−3)))=Dual(A²)=A², H⁰(O(1))=A². i=0: 0 and H¹(O(1))=0. i=2: H²=0 and degree −1 is the zero module | true; `Nonempty` form holds, the rename changes no statement |
| same | d=0, X=Spec A, F=A; n=0 | Λ⁰Ω=O, Dual(A)=A and H⁰=A; n=0: A is the zero ring, both sides 0 | true |
| Docstring list of non-statable headlines (R02) | count | 14 bullets at lines 18–31; description says 13 | description wrong |
| Hilbert–Siegel dimension (R04) | F=ℚ; [F:ℚ]=2 | 3; 6 | "threefold" only for F=ℚ |

Rows for every other statement stand as in the previous review, of `3330afd`.

- Gate, run by this review on 3330afd: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=1 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`; the worker's run adds `build=0`. The one hit is R01.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean`: the only diagnostic is `warning: declaration uses sorry` at line 73. The three elaborated signatures are those of the previous report; no binder lost.
- Files outside the folder: none changed (`git diff --stat origin/main...HEAD` outside the folder is empty); the folder holds README.md, Suggested.lean and metadata.toml.
- Description against the head, sentences checked and found right: the roadmap is added, not a revision (not on main; 1723 insertions, 0 deletions); three files; "consumes every layer" (README Downstream consumers, Layers 1–8); three Lan–Suh ranges (§§5.4–5.6); boundary vanishing in every degree over ℚ and degree zero over totally real F (§§8.2, 8.5); h¹ = l₀·h⁰ conditional (§8.9); K-projective lifting up to homotopy (README lines 47, 771); solid (A,A)■ interface and Hilbert–Siegel EO geometry (§§3.0a, 5.0); 5 package review rounds and 2 red-team rounds (the board's reports); validation counts (gate above, apart from R01).
- Cross-roadmap citations: no change; `roadmaps resolve` lists none missing.
- Overlap check: read HigherHidaAndColemanTheory, PadicFamiliesPartII, GSp4NonregularModularityLifting (open) and SmoothRepresentationsOfLocalGroups (main); nothing shared. The three open ones cite this roadmap as supplier (§§2.2–2.5, 3.0a–3.13, 5.1–5.2, 8.8, Layers 1–8) and restate none of it; normalized Satake stays with SmoothRepresentationsOfLocalGroups SR.4, cited here.
- Source independence: changed passages only; 0 passages compared (the folder is unchanged since the head the previous review read), arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- GK19 Remark 10.1.3, p. 962 (§7.1): settled as uncertified in the manifest; cited by locator only.
- The seeded sample (§§1.4, 2.4, 3.0a, 3.4, 3.8, 3.13, 4.2, 5.1, 5.14, 5.15, 6.1, 7.3, 8.4, 8.6, 8.7) falls in no changed passage and was not reread this round.
- The generated blocks of the description (`depends-on`, `merge-order`) are outside the check of the text.

## Source issues

- none

## For the human reviewers

- none
