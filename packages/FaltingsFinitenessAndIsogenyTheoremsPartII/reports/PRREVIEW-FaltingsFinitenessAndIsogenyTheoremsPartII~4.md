# Review of FaltingsFinitenessAndIsogenyTheoremsPartII (pull request #1738 at f49680f)

**Verdict:** accepted

Incremental re-review of 0 changed lines since f49680f. This round reads the pull request's title and description against the head. No finding.

## Previous findings

- The previous report (of f49680f) carried no finding; its R01 of the round before stays repaired: README line 362 cites “the minimal period subvariety A_ω of EllipticCurveModularityPartII §6.0f”, and §2.1 defines only Δ_L.

## Verified sound

### The pull request's text against the head

| Sentence of the title or description | What the head shows | Result |
|---|---|---|
| Title “…: roadmap”; “Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)” | The folder is not on `origin/main`; the change is 1331 insertions, 0 deletions, in exactly these three files | agrees |
| “`class_index_bound` for full orders in division ℚ-algebras”; “covers every full order on both module sides without presupposing Jordan–Zassenhaus” | README lines 7 and 603 (supremum in the extended naturals; right modules through the opposite algebra); `Suggested.lean` line 47 | agrees |
| “Bost's proof of the period theorem extended to arbitrary reduction through semistable cubist models of every symmetric ample line” | README line 411 and the cubist-model contract at line 79 | agrees |
| “cyclic presentations give the norm-body inequality for division algebras of every index” | README lines 118 and 671 (“every index n, odd or even”) | agrees |
| “The roadmap separates abelian, regular and reduced traces”; “Regular-trace discriminants need no reduced-trace theory” | Conventions (Tr_A(1)=2g, tr_B(1)=dim B, reduced trace only through a stated comparison); line 15 (−16 against −1 on M₂(ℤ)) | agrees |
| “the quadratic elliptic rate is imported rather than rederived”; “derives the elliptic j-height estimate from the existing sharp elliptic isogeny supplier” | README lines 13 and 134: EllipticCurveModularityPartII §6.0f, consumed by Layer 6 | agrees |
| “The adelic bound keeps every prime”; “uniform integral Tate bounds over finitely generated characteristic-zero fields” | README line 7; §7.7, §§8.4–8.5 | agrees |
| “ComplexMultiplicationAndExplicitReciprocityPartII needs the dimension-only isogeny and polarization-free order bounds … Richard–Yafaev … assumes the uniform integral Tate bound” | Downstream consumers, README line 1213; that roadmap's README line 12 names §5.5 here as owner | agrees |
| “FaltingsFinitenessAndIsogenyTheorems stops at qualitative finiteness and integral commutants at almost all primes” | README line 7 (reaches R28.6) | agrees |
| “Its native-carrier acceptance statements are the division-order class-index bound and the geometric elliptic j-height bound” | `Suggested.lean`: one definition, two theorems; README line 157 | agrees |
| “Minkowski and double centralizers come from Mathlib and Tau Ceti” | README line 37 (Mathlib lattice-point theorem) and line 15 (Tau Ceti double centralizer) | agrees |
| “Validation: … `sorry` as the only warning … 0 problem(s) … outside-folder diff has 0 path(s)” | Gate, depcheck, elaboration and diffstat below | agrees |
| “after 3 independent review rounds and 2 red-team rounds” | The board's package reports: review ~3, red-team rounds 1 and 2 | agrees |

No supplier, section or declaration changed since the text was written that it leaves unstated: the suppliers named in the README's contracts that are not on main (AbelianSchemesAndArithmeticModuli, ArakelovGeometryAndAbelianHeights, GeometryOfNumbersAndQuadraticArithmetic, AutomorphicBundles, FaltingsFinitenessAndIsogenyTheorems, EllipticCurveModularityPartII, ArithmeticGaloisRepresentations, NeronModelsAndSemistableAbelianVarieties, InverseGaloisAndArithmeticFundamentalGroups, and PELModuli and ShimuraCompactifications cited at lines 15 and 124) are the eleven of the generated `depends-on` block; SuccessiveMinima, HeightsAndUnits, SemisimpleAlgebras, ClassicalArithmeticCompletion, ClassFieldTheory and IntegralLattices are on main.

### Adversarial table

The diff changes no statement; rows for the two statements the description names.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `class_index_bound` (§3.5) | D=ℚ, O=ℤ, e=1, M=½ℤ; D=ℚ(i), O=ℤ[2i], M=ℤ[i]; M=ℚ without `Module.Finite ℤ` | ℤ: f(1)=½, index 1 ≤ 1^(1/2)=1. ℤ[2i]: Gram [[2,0],[0,−8]], disc −16; index of αℤ[2i] in ℤ[i] is 2N(α), least 2 ≤ 16^(1/2)=4. M=ℚ: every index is 0, excluded | holds; finiteness hypothesis needed and present | none |
| `elliptic_isogeny_j_height_bound` (§6.1) | D=1 with E₁=E₂, j=0; D=1, h_F=−1 in the supplier bound | log 1=0, so max(1, log D)=1; right side C·(1+0)²=C against degree 1: needs C≥1, chosen before k. Supplier: 10⁷·985²=9,702,250,000,000 ≤ 9,781,210,000,000 | holds; constant precedes the field | none |

The rows for the untouched statements stand as in the previous review, of f49680f.

### Counts

- Gate at this head, `--base origin/main`: every counter 0, `OK`; the worker's record adds `build=0`.
- Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration of `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheoremsPartII/Suggested.lean`: two `declaration uses sorry` warnings (47:8, 68:8), nothing else. The three elaborated signatures in the worker's record equal those the previous review compared with README §§3.1, 3.5, 6.1; no binder lost.
- `git diff --stat origin/main...HEAD` outside the folder: empty. Folder diff since f49680f: empty, so no seeded target falls in a changed passage and no source locator was reopened.
- Cross-roadmap citations resolved again: EllipticCurveModularityPartII §6.0f at its open head 99111f0 (definition of A_ω at its README line 823, API lines 829–831, consumer note line 1156); ComplexMultiplicationAndExplicitReciprocityPartII README line 12 (§5.5 exists here, line 921).
- Remark, untouched text: README line 136 says Cartier's smoothness theorem “is proved there”; at 99111f0 §6.0f imports it from GroupSchemesOverABase §4.5 (its lines 93, 823). The existence of A_ω is still supplied by §6.0f, and GroupSchemesOverABase is already in this pull request's merge order.
- Overlaps: no other open pull request changes this roadmap; no cited id dropped; no id defined only by an open revision.

Overlap check: read ComplexMultiplicationAndExplicitReciprocityPartII, ArakelovGeometryAndAbelianHeights, FaltingsFinitenessAndIsogenyTheorems, HeightsRationalPointsAndObstructionsPartII, SuccessiveMinima; geometric isogeny estimate: owner this roadmap §5.5 (cited by the first); height change along an isogeny: owner ArakelovGeometryAndAbelianHeights §4.4 (cited here); nothing else shared.

Source independence: changed passages only; 0 passages changed, so 0 compared; arrangement not compared again (no layer added, removed or reordered); the previous reviews' comparison stands.

## Not verifiable

- mw93-periods and mw95-refine (waived), igusa and fw84 (uncertified): settled, cited by locator, not requested again.

## Source issues

- none

## For the human reviewers

- none
