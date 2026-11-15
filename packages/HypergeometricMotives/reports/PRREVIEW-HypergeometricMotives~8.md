# Review of HypergeometricMotives (pull request #1716 at 68b0f5f)

**Verdict:** accepted

Incremental re-review of 0 changed lines since ece7e65. No finding: the folder is unchanged, and the description now agrees with the head.

## Previous findings

- R01 — repaired: the description now reads "the geometric construction of the hypergeometric cohomological subquotient in the rational Nori category … (5.0)", then 5.10 and 5.13, and "General motives and realizations, Weil–Deligne representations and Artin and Swan conductors are consumed".
- R02 — repaired: "`TauCetiRoadmap/HypergeometricMotives/README.md`: the roadmap, 6 layers and 62 milestones."

## Verified sound

| Statement | Instances | Values computed (description or README side / my side) | Result |
|---|---|---|---|
| Description: "6 layers and 62 milestones" | numbered `### k.n` headings per layer at `68b0f5f` | 12 + 9 + 10 + 12 + 15 + 4 = 62; `## Layer` headings: 6 | holds |
| Description: "local invariants at every prime including the wild ones (5.10)"; 5.10 Check, tame | Legendre `t = −3`, `p = 3`: `y² = x(1 − x)(x + 3)` | reduction `y² = x²(1 − x)`: 3 points over `𝔽₃`, node with tangents `y = ±x` rational, so split multiplicative: factor `1 − T`, exponent 1, Swan 0, as README | holds |
| 5.10 Check, wild | Legendre `t = 2`, `p = 2` | `λ = 2` gives `j = 1728`; README conductor `32 = 2⁵`, invariants 0, so `5 = 2 + Swan`, Swan 3; with Swan 0: `2² = 4 ≠ 32` | holds |
| Description: "the full Euler product, assembled under all-prime rational compatibility (5.13)"; `a_(p^e)` = coefficient of `T^e` in `1/F_p` | Legendre `t = 2`, `p = 5` | my count: 8 projective points, `a₅ = −2`, `F₅ = 1 + 2T + 5T²`; `1/F₅ = 1 − 2T − T² + …`, so `a₂₅ = −1 = a₅² − 5` | holds |

The rows of the previous reviews for the folder's statements stand as in the previous review, of `ece7e65`; no statement changed.

- Description sentences read against the head, 15 in all (three summary paragraphs, the prose paragraph, three file bullets): all agree. Opened for the rewritten paragraph: `README.md:17–21`, `:68–70`, `:73–78`, `:87–89`, `:306–322`, `:1659–1685` (5.0), `:2075–2096` (5.10), `:2172–2185` (5.13), `:1467` (4.7 heading); `metadata.toml` has `topic = "math.NT"`.
- The pull request adds the roadmap (not on `origin/main`; 3642 insertions, no heading or declaration removed); the title agrees.
- Gate at `68b0f5f` (my run): every counter `0`, result `OK`; the worker's gate with the targeted build reports `build=0`.
- Dependency check: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/HypergeometricMotives/Suggested.lean`: 46 `declaration uses sorry` warnings, no error, no other warning.
- `git diff --stat origin/main...HEAD` outside the roadmap folder: empty (the files changed since `ece7e65` outside the folder come from merging main). Working tree clean.
- `scratch/overlaps.md`: no other open pull request changes this roadmap, no cited id dropped, none defined only by an open revision. `scratch/citations.md`: the same six external provenance names (`README.md:2534–2566`), none claimed for `Suggested.lean`.
- Overlap check: read CharacterSumsOverFiniteFields, PotentialAutomorphyDworkMotivesPartII, ClassicalArithmeticCompletion; finite hypergeometric sums: owner HypergeometricMotives (CharacterSumsOverFiniteFields README 84–85, 245 hands them over); Levelt triple and rigidity: owner HypergeometricMotives §§3.1–3.4 (PotentialAutomorphyDworkMotivesPartII README 88–90 cites them); companion matrices: owner ClassicalArithmeticCompletion 2.46, 2.60, cited here.
- Source independence: changed passages only; 0 passages changed in the folder, so 0 compared; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts": a statement about other pull requests, not checked against this head.
- Beukers–Heckman 1989 (DOI 10.1007/BF01393900): no legal copy, as in the previous rounds; nothing changed depends on it.

## Source issues

- none

## For the human reviewers

- **Licence.** `TauCetiRoadmap/HypergeometricMotives/README.md:2520–2573` (Provenance) maps Layer 5 targets to two external Lean formalisations of the Weil conjectures and says both are Apache-2.0; the licences were not read in this review.
