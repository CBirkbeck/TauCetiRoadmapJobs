# Review of JacobianChallenge (pull request #1892 at 617bbe1)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 617bbe1. The folder is unchanged and stands as accepted by the previous review; every finding below is about the pull request's description, which no longer matches the head. No file in the folder needs to change.

## R01 (P3) — the description says the Jacobian is constructed by Galois descent

**Location:** pull request description, "What this changes": "with the Jacobian constructed over any field by Galois descent so that no rational point enters the definition".
**Claim:** The head constructs the Jacobian with no descent and no field extension.
**Witness:** `TauCetiRoadmap/JacobianChallenge/README.md` D.8, lines 1068–1076: `jacobianScheme X := (picZeroSets X).reprX`; "The definition uses no rational point and no extension of `k`". "Galois descent" occurs nowhere in the README.
**Repair:** Replace the clause by: "with the Jacobian defined over any field as the representing object of the degree-zero Picard fppf sheaf, so that no rational point and no field extension enters the definition (a finite separable extension is used only to prove properness and geometric integrality)".

## R02 (P3) — the description says Riemann–Roch is stated for coherent sheaves on Gorenstein curves

**Location:** pull request description, "What this changes": "Riemann–Roch for coherent sheaves on Gorenstein curves".
**Claim:** The head states Riemann–Roch for line bundles on the standing smooth curve and leaves the Gorenstein case to another roadmap.
**Witness:** README lines 54–58: "Serre duality and Riemann–Roch on Cohen–Macaulay and Gorenstein curves … are SchemeAndStackFoundations §2.20 … and §3.3"; B.4, line 638: "for every invertible `L` on the standing curve".
**Repair:** Replace by: "Riemann–Roch for line bundles on the standing curve without a rational point (the Cohen–Macaulay and Gorenstein cases stay with SchemeAndStackFoundations §2.20 and §3.3)".

## R03 (P3) — the description reverses the supply direction of duality

**Location:** pull request description, "Approach and generality": "duality through the trace so that the curve case is a corollary of the relative duality planned elsewhere".
**Claim:** At the head B.2 is proved here from Tate's residues and is consumed by the general duality, not derived from it.
**Witness:** README line 58: the Cohen–Macaulay and Gorenstein duality "restrict to B.2 on smooth curves and consume Layer B"; B.2's *Needs:* (lines 565–569) lists A.2, B.1, Tau Ceti and Mathlib only.
**Repair:** Replace by: "duality through the trace, proved here on smooth curves from Tate's residues, so that the duality on Cohen–Macaulay and Gorenstein curves planned in SchemeAndStackFoundations restricts to it and consumes Layer B".

## R04 (P3) — the description understates how much of the README is rewritten

**Location:** pull request description, "What this changes": "The roadmap keeps every layer and section label and restates three groups of targets".
**Claim:** The change rewrites the whole README (524 lines on main, 1521 at the head) and removes six top-level sections; only the layer letters A–F are kept.
**Witness:** Headings on main absent at the head: "The end goal (v1)", "Standing hypotheses", both "Inventory" sections, "The prerequisite tower", "Acceptance criteria", "Scope and caveats (Kevin Buzzard)"; the title loses "(Christian Merten's AG version)". Diffstat: 1782 insertions, 575 deletions.
**Repair:** Replace the sentence's opening by: "This revision rewrites the whole README in the house shape (Scope and ownership, Conventions, Exact supplier contracts, Layers A–F with numbered sections A.1–F.3, Downstream consumers). It keeps the six layers A–F and their subjects; the former end-goal, standing-hypotheses, inventory, acceptance-criteria and caveats sections are absorbed into those. Beyond the reshaping it restates three groups of targets".

## R05 (P3) — the description does not say that three Lean declarations are removed

**Location:** pull request description (whole text); `TauCetiRoadmap/JacobianChallenge/Suggested.lean`.
**Claim:** `cartierPicardEquiv`, `cartier_sheaf_iso_iff_principal` and `properIntegralGroup_commutative` are on main and absent at the head; the description names only the replacement of pointed Picard representability.
**Witness:** `Suggested.lean` on main, lines 32, 39, 47; none occurs at the head. The pins have them: Tau Ceti `CartierDivisor/ClassGroup.lean:123`, Mathlib `AlgebraicGeometry/Group/Abelian.lean:131`.
**Repair:** Add: "`Suggested.lean` drops `cartierPicardEquiv`, `cartier_sheaf_iso_iff_principal` and `properIntegralGroup_commutative`, which the pinned Tau Ceti (`classGroupAddEquivLineBundleClass`, `SchemeWeilDivisor.equivCartierDivisor`) and Mathlib (`isCommMonObj_of_isProper_of_geometricallyIntegral`) now prove and the README cites, and replaces `pointedCurvePicard_representable` by `hasPicardScheme_of_curve` and `isRepresentable_picZeroSets`."

## Previous findings

- none: the previous review (of 617bbe1) listed no finding.

## Verified sound

| statement | instances tried | values on each side | result | change |
|---|---|---|---|---|
| D.8 `jacobianScheme` defined without a rational point (cited by the description, R01) | pointless real conic; `ℙ¹_k`; conic base-changed to `ℂ` | `Pic⁰` sheaf is zero, representing object `Spec ℝ`, dimension `0 = g`; `Spec k` against `picardScheme = ∐_ℤ Spec k`; `(Spec ℝ)_ℂ = Spec ℂ = Jac ℙ¹_ℂ` | holds | none |
| B.4 Riemann–Roch without a rational point (cited by the description, R02) | pointless real conic, `P` of degree 2; `ℙ¹`, `𝒪(n)`; elliptic curve | `χ(𝒪(P)) = 3 − 0 = 3 = 2 + 1 − 0`; `n + 1 = n + 1 − 0`; `χ(L) = deg L + 1 − 1` | holds | none |

The rows for all other statements stand as in the previous review, of 617bbe1: the diff changes no statement.

- Folder change since the previous review: 0 lines; nothing changed outside the folder (`git diff --stat origin/main...HEAD` outside the folder is empty).
- Gate at 617bbe1, my run: every counter 0, `OK` (`depcheck=0`, `stray-files=0`, `outside-folder=0`); the worker's run also reports `build=0`.
- `lake env lean TauCetiRoadmap/JacobianChallenge/Suggested.lean`: exit 0, 14 warnings, all "declaration uses `sorry`".
- Dependency check with `--movable`: `depcheck: 245 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line; JacobianChallenge is line 1 of the merge order.
- Description sentences checked against the head and found right: `HasPicardScheme`, `picardScheme`, `picardSchemeIso` (D.2, `Suggested.lean` lines 111–122); `JacobianVariety` without a rational point; Tate's residue trace (B.2); `Scheme.genus` throughout (B.3); C.4 built without Quot schemes (README lines 65–67, 798); cube theorem for products (E.1); the F.2–F.3 targets; "edits a roadmap on main and depends on no open roadmap PR" (supplier contracts name Mathlib, Tau Ceti and SchemeAndStackFoundations, on main and already cited there).
- Library declarations opened at the pins for R05: 4 (Mathlib `Group/Abelian.lean:131`; Tau Ceti `CartierDivisor/ClassGroup.lean:123`, `WeilDivisor/Scheme/Picard.lean:252`, `WeilDivisor/Scheme/Cartier/Inverse.lean:341`).
- Seeded sample: no sampled target falls in a changed passage (there is none); all four were verified in the previous reviews.
- Overlap check: `overlaps.md` lists no shared pull request, no dropped id and no id only an open revision defines; the scopes of JacobianChallengePartII, SchemeAndStackFoundations and StableReduction were not read again this round, the folder being unchanged since they were.
- Source independence: changed passages only; 0 passages compared, the diff adding or changing none; the arrangement was not compared again, no layer being added, removed or reordered.

## Not verifiable

- Mumford, *Abelian Varieties*, §5 (C.2, untouched): no legal copy found, as in the previous review; Stacks 0B91, 0BDN and 0B9T cover the same statements.
- Hartshorne, Serre, Bosch–Lütkebohmert–Raynaud, Stichtenoth and Milne's *Jacobian Varieties*: settled as uncertified, cited by locator only.
- The description is quoted to me as cut after the generated blocks; anything after the cut is outside this check.

## Source issues

- none

## For the human reviewers

- none
