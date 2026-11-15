# Review of QuadraticFormInvariantsPartII (pull request #1834 at b38ee3c)

**Verdict:** needs changes

## R01 (P3) — The pull request's description still drops nonsingularity from isotropy ⇔ hyperbolicity

**Location:** PR description, `roadmap-summary` block: “quadratic Pfister forms `quadraticPfister`, proving roundness, that isotropy means hyperbolicity”; first prose paragraph: “quadratic Pfister forms, roundness, and isotropy equivalent to hyperbolicity”.
**Claim:** The repair qualified the README (lines 9–10, 42–44, 433) and the module docstring of `Suggested.lean` (lines 21–22), but not the description, which is what the previous R01 located. The head states the equivalence only under `1 − 4a₀ ≠ 0` (`TauCetiRoadmap/QuadraticFormInvariantsPartII/README.md:759`, `TauCetiRoadmap/QuadraticFormInvariantsPartII/Suggested.lean:90`).
**Witness:** Over ℚ, `m = 0`, `a₀ = 1/4`: `quadraticPfister` is `(x + y/2)²`, zero at `(1, −2)`, polar determinant `0`; the hyperbolic plane has `−1`. The head's own Check, README:773–774.
**Repair:** In the `roadmap-summary` block write “proving roundness in every fold, that a nonsingular one is isotropic exactly when it is hyperbolic, Springer's theorem, …”; in the first prose paragraph write “quadratic Pfister forms, roundness, and, for nonsingular ones (`1 − 4a₀ ≠ 0`), isotropy equivalent to hyperbolicity”. No change to the roadmap folder is needed.

## Previous findings

- R01 — partly repaired: README:9–10 now reads “their roundness in every fold and, for nonsingular ones, the equivalence of isotropy with hyperbolicity” (likewise README:42–44, 433, `Suggested.lean`:21–22); the PR description is unchanged. Raised again as R01.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Changed summaries (README:9–10, 42–44, 433; `Suggested.lean`:21–22) against `not_anisotropic_quadraticPfister_iff_equivalent_dualProd`, §1.5 | ℚ, `m = 0`, `a₀ = 1/4` | `1 − 4a₀ = 0`: excluded by hypothesis `h`. Form `(x + y/2)²`: isotropic true, hyperbolic false (polar determinant `0` vs `−1`). | Summaries now agree with the statement. | None in folder; PR text, R01. |
| Same, nonsingular side | ℚ, `m = 0`, `a₀ = 0` | `1 − 4a₀ = 1`; `q = x(x + y)`, `q(0,1) = 0`; `u = x, v = x + y` (determinant `1`) gives `uv`. | Isotropic and hyperbolic: both true. | None. |
| “for nonsingular ones … in every characteristic” in characteristic two | 𝔽₂, `m = 0`, `a₀ = 0` and `a₀ = 1` | `1 − 4a₀ = 1 ≠ 0` for both; `[1,0]`: zero at `(0,1)`, `≅ xy`. `[1,1]`: values `1,1,1` on nonzero vectors, anisotropic, not hyperbolic. | The qualifier is empty in characteristic two; equivalence holds on both instances. | None. |
| “roundness in every fold” kept unqualified against `quadraticPfister_smul_equivalent_of_represents`, §1.4 | ℚ, `m = 0`, singular `a₀ = 1/4`, `c = s²` | Represented units are the nonzero squares; `s²(x + y/2)² = (sx + sy/2)²`, isometric by scaling by `s`. | Roundness holds without nonsingularity, as the summaries now say. | None. |

The adversarial rows of the untouched statements stand as in the previous review, of `43253eb`.

- Diff since `43253eb`: 17 lines, 4 passages (3 in the README, 1 in the module docstring of `Suggested.lean`); 0 statements, 0 headings, 0 `*Needs:*` lines, 0 supplier citations changed; 0 paths outside the folder.
- Source locators: 1 read for the changed passages, EKM Corollary 9.10 at ekm line 2933, with its proof through Proposition 9.8 at ekm line 2936; 0 of the 15 seeded targets other than §1.5 fall in changed text, and §1.5 itself is unchanged.
- Elaborated signatures: the 2 Layer 1 theorems compared with README §1.4 and §1.5; `h : 1 − 4 * a₀ ≠ 0` present in the second, absent by design in the first.
- PR text: title, prose and `roadmap-summary` read against the head; 1 finding (R01); the count “19 headline theorems … six definitions” matches the 19 `sorry` warnings and 6 definitions.
- Gate rerun at `b38ee3c`: every scanner 0, `OK`; the worker's gate records `build=0`. Direct elaboration of `Suggested.lean`: exit 0, 19 `sorry` warnings, no other message.
- Dependency check: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Overlap scan: 0 other pull requests change this roadmap, 0 cited ids dropped, 0 ids defined only by an open revision; 0 unresolved cross-roadmap citations; the one Lean lead, `IsCi.exists_common_zero`, is declared in `Suggested.lean`.

Overlap check: read QuadraticFormInvariants (main and open: Witt theory with `2` invertible, Pfister roundness to fold two), GlobalQuadraticForms (number-field local–global theory), GeometryOfNumbersAndQuadraticArithmeticPartII (integral Witt comparison), AdicCoefficientsAndComparisonsPartII, LocalFieldsRamificationPartII, KTheoryFiniteLocalFields (suppliers); nothing shared: the changed passages name only all-fold quadratic Pfister theory, owned here.

Source independence: changed passages only: 4 passages compared with 1 source (ekm line 2933), none shared (longest common run 2 words, a standard term); no layer added, removed or reordered, so the locator shares and the arrangement were not compared again.

## Not verifiable

- `kato82`, `arason75`, `milnor70`: settled as uncertified, cited by locator only; no changed passage cites them.

## Source issues

- none

## For the human reviewers

- none
