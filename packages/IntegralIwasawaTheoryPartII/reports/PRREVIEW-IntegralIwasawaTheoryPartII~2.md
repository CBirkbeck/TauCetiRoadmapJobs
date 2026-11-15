# Review of IntegralIwasawaTheoryPartII (pull request #2267 at ca0b79d)

**Verdict:** accepted

Incremental re-review of the 132 lines changed since `f3022f4`, and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: "(Dasgupta–Kakde–Ventullo §1, the definition preceding Conjecture 2 and (6), p. 836; §1.1, (8), p. 838)"; DKV16 line 126 defines the regulator, lines 129–130 follow.
- R02 — repaired: "(Dasgupta–Kakde–Ventullo §1, (2)–(3) at `n = 0` and `L(χ, 0) ≠ 0`, p. 834; the exact order for `r ≤ 1`, p. 837)"; DKV16 lines 56–58, 66, 75–76, 158.
- R03 — repaired: "`Ψ_ℓ^+` takes values in `(1/2)M_ℓ`, which contains `M_ℓ`", with `M_ℓ ⊂ M_ℚ` named; CD14 lines 224–228.
- R04 — repaired: the `*Needs:*` line of 2.2 begins "2.1; NoncommutativeAndEquivariantIwasawa §F.5 …"; 2.2b is no longer listed.
- R05 — repaired: the `*Needs:*` line of 2.5a begins "2.2, 2.2a, 2.2b, 2.3, 2.4, 2.5; …"; 2.5 does not list 2.5a, so no cycle.

## Verified sound

| Statement | Instances tried | Values computed (roadmap side / other side) | Result | Change |
|---|---|---|---|---|
| 0.4 regulator, as quoted by the new opening of 0.2 (`det(−L)/det(O)`) | `O=(2), L=(3)`; `O=diag(2,3), L=diag(5,7)` | `−3/2`; `35/6` / DKV16 line 126 with (8): determinant of `(−L)O⁻¹` | agrees | locator only (R01) |
| 1.9, as quoted by the new opening of 1.6 (`L_alg = det X/det Y = R_p`) | `r = 1`, `O=2, L=3, y=1`; `r = 2`, `Y = I`, diagonal data above | `x = −3/2`; `X = diag(−5/2, −7/3)`, `det X = 35/6` / 0.4: `−3/2`, `35/6` | agrees | none |
| 0.6 integrality sentence | `m = 1`, `ℓ = 3`; `ℓ = 2` | `1/2 ∈ (1/2)M_3`, `1/2 ∉ ℤ[1/3]`, so `M_3 ⊊ (1/2)M_3`; `(1/2)M_2 = M_2` / CD14 line 228 | agrees; "contains" is right, including at `ℓ = 2` | wording (R03) |
| 5.5 rank zero | `ℚ(i)`, `p = 3`; `p = 2` | `L^*(χ,0) = (1/2)(1 − (−1)) = 1 = D_χ`; `χ(2) = 0`, `1/2 = D_χ`; empty determinant `1` / DKV16 (2)–(3) at `n = 0` | agrees | locator only (R02) |
| New opening of 3.4 (leading lines) | Case 1, `r = s = 1`; Case 3, `r = t = 1`, `s = 2` | `W_1 = E[π]/(π²)`, `π ≠ 0` in `𝔪/𝔪²`; `z = π − cπ²` has class `π ≠ 0`, `yW_3/y²W_3 = E·cπ²` / 3.4, 3.6 | agrees | none |
| `*Needs:*` of 2.2 and 2.5a | order `2.1, 2.2, 2.2a, 2.2b, 2.3, 2.4, 2.5, 2.5a, 2.6` | every edge of Layer 2 points to an earlier entry of that order; 2.5 → {0.5, 2.2, 2.2b, 2.3, 2.4}, 2.5a → 2.5, 2.6 → 2.5a | acyclic | R04, R05 |
| The ten new section openings ("… consume it") | 38 consumer claims against the `*Needs:*` lines | 36 are direct `*Needs:*` edges; 5.4 → 3.3 and 4.5 → 3.8–3.10 are cited in the routes of 5.4 and 4.5 | every claim is backed | none |

The rows for the statements the diff does not touch stand as in the previous review, of `f3022f4`.

- The diff changes no statement: it turns 21 subsection headings into bold-labelled targets inside 10 grouped sections, keeping every former id (0.3, 0.4, 1.4, 1.7–1.9, 3.2, 3.3, 3.5, 3.6, 3.8–3.10, 4.3–4.5, 4.7, 4.9, 5.2–5.4), adds ten opening paragraphs, and makes the five repairs. No layer is added, removed or reordered.
- Citations of the merged ids resolved: every `*Needs:*` line of the README (63 lines read), and the section references in the docstring of `Suggested.lean` (§§0.7, 0.8, 1.9, 2.3, 2.6, 3.8–3.10, 5.5–5.8), and the open CohomologyOfGroups, which cites §0.7 (unchanged) as the owner of the cap product and the edge isomorphism.
- Source locators checked against the text in the changed passages: 5 (DKV16 lines 56–66, 75–76, 113, 126–130, 158; CD14 lines 224–228), all exact. Sample targets 0.2, 0.6 and 5.5 fall in the changed passages; for 1.6, 3.1, 3.7 and 4.6 only the heading and the opening paragraph changed.
- Pull request text: the title, the summary block and the prose were read against this head (rank zero and one in 5.5, 5.7, 5.8; no Leopoldt or exact-order hypothesis in 5.6; the exported interfaces in "Downstream consumers"; the pull request adds the folder, 0 headings and 0 declarations removed); no sentence is contradicted and no change is left unstated.
- Gate at this head: every check passes (`set_option=0 … depcheck=0 … stray-files=0 outside-folder=0`, build included in the worker's run). Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder.
- Elaboration: `Suggested.lean` (unchanged since `f3022f4`) elaborates with `declaration uses sorry` at line 66 as the only warning; the elaborated type of its one declaration keeps `CommRing k`, `Group G`, `S.Normal` and the vanishing hypothesis.
- Remark, untouched text: the route of 5.4 cites 3.3 and that of 4.5 cites 3.8–3.10, which their `*Needs:*` lines reach only through 3.6 and 4.1.
- Overlap check: read NoncommutativeAndEquivariantIwasawa, IntegralIwasawaTheory, PadicFamilies, EulerSystemsCyclotomicMainConjecture, OrdinaryAutomorphicFormsAndModularityLifting, and CohomologyOfGroups (later in the merge order); nothing shared (the edge isomorphism and cap product of §0.7 are owned here and cited by CohomologyOfGroups).

Source independence: changed passages only; 5 passages compared with 2 sources (DKV16, CD14), none shared beyond a theorem statement and formulas; the ten opening paragraphs have no counterpart in a source; largest share DKV16, as in the previous review (61 of about 123 locators); contents not compared again, since the diff adds, removes and reorders no layer.

## Not verifiable

- Sc93, Theorem 4: paywalled, settled as uncertified; checked only through its restatement, CD14 lines 349–351.
- AL13, Proposition 3.11 and Theorem 3.6; W86, Proposition 1.5; Br82, Chapters III §6, V §3, VII §6: uncertified, cited by locator; none is in a changed passage.
- DKV16 preprint (arXiv v1), Theorem 3.2, p. 16: the cached text is the published article; not in a changed passage.

## Source issues

- none

## For the human reviewers

- **Licence.** CD14 is read from an author page (`sites.math.duke.edu`), in the pagination of an author copy dated 4 November 2014, not the published Cambridge Journal of Mathematics pagination (README, References).
- **Not tested.** The normalization of DKV16 Theorem 3.2 is cited to the arXiv v1 preprint, p. 16, which was not read; 2.6 states it as part of the theorem independently of that locator.
- **Scope.** The roadmap applies corrections to published statements (README, "Corrections to the sources", including a level factor in DKV16 (29)–(31) and an exponent in DDP11 Proposition 2.3); no published erratum was found in the cached sources.
