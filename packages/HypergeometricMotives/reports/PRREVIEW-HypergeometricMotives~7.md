# Review of HypergeometricMotives (pull request #1716 at ece7e65)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since ece7e65. The folder is unchanged and stands as the previous review left it; both findings concern the pull request's description, which was written for the first head and not updated when 5.0 was added.

## R01 (P3) — the description says the motive is not constructed; the head constructs it

**Location:** pull request description, prose paragraph after the summary block: "… and tame conductor exponents of the LMFDB's hgm section; the motive itself is cited, not constructed."

**Claim:** The head contradicts the sentence, and the paragraph leaves out what the roadmap gained since the first head: the geometric construction 5.0, the local invariants at every prime including wild ones (5.10), and the full Euler product (5.13).

**Witness:** `TauCetiRoadmap/HypergeometricMotives/README.md:17–19`: "The geometric layer constructs the hypergeometric cohomological subquotient, its Betti, de Rham and ℓ-adic realizations"; `:78`: "The hypergeometric subquotient and its comparison maps are constructed in 5.0 here." The description's own summary block says the same.

**Repair:** Replace the end of the paragraph, from "and the Frobenius traces" on, by: "the geometric construction of the hypergeometric cohomological subquotient in the Nori category with its Betti, de Rham and ℓ-adic realizations and trace and Hodge comparisons (5.0), and the Frobenius traces, Euler factors, determinant discriminant, tame conductor exponents, local invariants at every prime including the wild ones (5.10) and the assembled Euler product (5.13) of the LMFDB's hgm section. General motives, realizations, Weil–Deligne representations and conductors are consumed from the supplier roadmaps."

## R02 (P3) — the description counts 61 milestones; the head has 62

**Location:** pull request description, file list: "`TauCetiRoadmap/HypergeometricMotives/README.md`: the roadmap, 6 layers and 61 milestones."

**Claim:** The count is that of the first head. The README at this head has 62 numbered sections.

**Witness:** Numbered `### k.n` headings at `ece7e65`: 12 (1.1–1.12) + 9 (2.1–2.9) + 10 (3.1–3.10) + 12 (4.1–4.12) + 15 (5.0–5.14) + 4 (6.1–6.4) = 62. The count is 61 up to `08f6be1a` and 62 from `f847e920`, which added 5.0.

**Repair:** "`TauCetiRoadmap/HypergeometricMotives/README.md`: the roadmap, 6 layers and 62 milestones."

## Previous findings

- none: the previous report (of `ece7e65`, accepted) listed no finding of its own, and the three findings it accounted for (R01–R03 of the review before it) stand repaired in the unchanged folder.

## Verified sound

| Statement | Instances | Values computed (description or README side / my side) | Result |
|---|---|---|---|
| Description: "61 milestones" (R02) | numbered sections per layer at each of the 7 commits of the branch | 61, 61, 61, 62, 62, 62, 62; at head 12 + 9 + 10 + 12 + 15 + 4 = 62 | description wrong |
| Description: "the motive itself is cited, not constructed" (R01); 5.0 twist `j = (κ − w)/2` | Legendre `A2.2_B1.1` | `Φ_2²/Φ_1² = (X² − 1)²/(X − 1)⁴`, so `γ = [2, 2, −1, −1, −1, −1]`, length `6 = κ + 3`, `κ = 3`, `w = 1`, `j = 1`: integral, nonnegative, as 5.0 asserts of its construction | 5.0 constructs; description wrong |
| Summary block: "Ono's … point counts" (6.1), and the `t` convention | `y² = x(1 − x)(x − t)` over `𝔽₅`, `t = 2` and `t = 1/2 = 3` | `t = 2`: 8 projective points, `a₅ = −2`, matching README "`a_5 = −2`"; `t = 1/2`: 4 points, `a₅ = +2`, matching "`A2.2_B1.1_t1.2` has `a_5 = +2`" | holds |

The rows of the previous review for the folder's statements stand as in that review, of `ece7e65`; no statement changed.

- Description sentences read against the head, 14 in all (the three summary paragraphs, the prose paragraph, the three file bullets): 12 agree with the head, 2 are R01 and R02. Checked in particular: 6 layers (README `## Layer 1`–`## Layer 6`); `metadata.toml` has `topic = "math.NT"`; "every prime power outside the wild primes without a splitting congruence" agrees with 4.7 (`README.md:1467–1480`); "Artin conductors at every prime" with 5.10 (`:2075–2082`); the two consumer sentences with `## Downstream consumers` (`:2510–2518`); the Nori category and the supplied comparisons with `:306–338`.
- The pull request adds the roadmap (not on `origin/main`; 3642 insertions, 0 deletions, no heading and no declaration removed); the title "feat: roadmap for hypergeometric motives" agrees.
- Gate at `ece7e65` (my run): every counter `0`, result `OK`; the worker's gate with the targeted build reports `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/HypergeometricMotives/Suggested.lean`: 46 `declaration uses sorry` warnings, no error, no other warning.
- `git diff --stat origin/main...HEAD` outside the roadmap folder: empty. Working tree clean.
- `scratch/overlaps.md`: no other open pull request changes this roadmap, no cited id is dropped, no id is defined only by an open revision. `scratch/citations.md`: the same six external provenance names as before (`README.md:2534–2566`), none claimed for `Suggested.lean`.
- Overlap check: the closest-roadmap lists name CharacterSumsOverFiniteFields, PotentialAutomorphyDworkMotivesPartII, CurvesOverFiniteFields, HyperellipticCurves, AbelianVarietiesOverFiniteFields (open), ClassicalArithmeticCompletion, PadicExtensionFamilies (main), none by results; their scopes were not read again this round, since the folder is unchanged since the previous review's ownership check.
- Source independence: changed passages only; 0 passages changed in the folder, so 0 compared; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts": a statement about other pull requests, not checked against this head.
- Beukers–Heckman 1989 (DOI 10.1007/BF01393900): no legal copy, as in the previous rounds; nothing changed depends on it.

## Source issues

- none

## For the human reviewers

- **Licence.** `TauCetiRoadmap/HypergeometricMotives/README.md:2520–2573` (Provenance) maps Layer 5 targets to two external Lean formalisations of the Weil conjectures and says both are Apache-2.0; the licences were not read in this review.
