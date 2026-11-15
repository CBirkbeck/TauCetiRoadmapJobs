# Review of QuadraticFormInvariantsPartII (pull request #1834 at b38ee3c)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: the `roadmap-summary` block now reads “proving roundness, that nonsingular ones are isotropic exactly when hyperbolic”; the first prose paragraph reads “roundness, and, for nonsingular ones (`1 − 4a₀ ≠ 0`), isotropy equivalent to hyperbolicity”. The folder is unchanged.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| PR text “nonsingular ones are isotropic exactly when hyperbolic” against `not_anisotropic_quadraticPfister_iff_equivalent_dualProd` (§1.5) | ℚ, `m = 0`, `a₀ = 1/4`; ℚ, `m = 0`, `a₀ = 0` | `a₀ = 1/4`: `1 − 4a₀ = 0`, form `(x + y/2)²`, zero at `(1, −2)`, polar determinant `0` vs `−1`: excluded by `h`. `a₀ = 0`: `x(x + y)`, zero at `(0,1)`, `≅ uv`. | Text and statement agree; the singular instance is outside both. | None. |
| PR text “with 2 invertible the nonsingular ones are the parent's minus-sign forms of positive fold” against §1.1 | ℚ, `m = 0`, general `a₀`; `a₀ = 1/2` | `x² + xy + a₀y² = (x + y/2)² − ((1 − 4a₀)/4)y² ≅ ⟨1, −(1 − 4a₀)⟩ = ⟨⟨1 − 4a₀⟩⟩`; `a₀ = 1/2`: `⟨1, 1⟩`. Fold `m + 1 ≥ 1`. | Agrees with README §1.1 and the §6.5 Check. | None. |
| PR text “unit Pfister form of fold `dim K + 1`” against `not_anisotropic_quadraticPfister_of_kroneckerDimension` (§6.5) | `K` the henselization of `ℚ(x)` at `x` | `kroneckerDimension = 1 + 1 = 2`; `ε : Fin 2`, fold `3`, dimension `2³ = 8`; README Check form `⟨⟨−1, −1, −1⟩⟩ = 8⟨1⟩`. | Fold `r + 1` on both sides. | None. |
| PR text “the 19 headline theorems … the six definitions” against `Suggested.lean` | declaration count | 25 declarations: 6 definitions (`quadraticPfister`, `extendScalars`, `kummerSymbol`, `IsCi`, `kroneckerDimension`, `constantField`), 19 theorems; 19 `sorry` warnings on elaboration. | Counts agree. | None. |

The adversarial rows of the untouched statements stand as in the previous review, of `b38ee3c`.

- Diff since `b38ee3c`: 0 lines in the folder, 0 statements, 0 headings, 0 supplier citations changed; 0 paths outside the folder. No seeded-sample target falls in changed text.
- PR text, read sentence by sentence against the head: title, `roadmap-summary` block and prose; 0 contradicted sentences. Checked: adds a new folder (2504 insertions, README, `Suggested.lean`, `metadata.toml`); the parent's limits (“roundness only up to fold two”, “degrees one and two”) against QuadraticFormInvariants on main, README lines 84, 1047, 1091; the not-statable list (Hauptsatz and invariant-zero criterion in characteristic two, Kato's theorem, Milnor's original form, Jannsen's Hasse principle) against the module docstring, `Suggested.lean`:40–55; “no finite generation” and the direct bound on the local compositum against README §§6.2, 6.5; “the Witt groups are imported” against Scope (HermitianKTheoryOfPoincareCategories §§3.4, 4.5, 7.9; GeometryOfNumbersAndQuadraticArithmetic §6.4); the consumers against `## Downstream consumers`.
- Suppliers: the README's 16 supplier subsections are 6 roadmaps on main (QuadraticFormInvariants, ProfiniteCohomology, ClassFieldTheory, SchemeAndStackFoundations; AdicSpaces and RealAlgebraicGeometry under `Completed/`) and the 10 open ones the `depends-on` block lists; none added or dropped.
- Elaborated signatures: 2 compared with the PR text and README, §1.5 (`h : 1 − 4 * a₀ ≠ 0` present) and §6.5 (`hO`, `hr`, `ha₀`, `hreal` present).
- Gate rerun at `b38ee3c`: every scanner 0, `OK`; the worker's gate records `build=0`. Direct elaboration of `Suggested.lean`: exit 0, 19 `sorry` warnings, no other message.
- Dependency check: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Overlap scan: 0 other pull requests change this roadmap, 0 cited ids dropped, 0 ids defined only by an open revision, 0 unresolved cross-roadmap citations; the one Lean lead, `IsCi.exists_common_zero`, is declared at `Suggested.lean`:301. QuadraticFormsOverABase (open) cites §0.2 `extendScalars` here as supplier, its README lines 42, 86, 258, 328: one owner.

Overlap check: read QuadraticFormInvariants (main and open: Witt theory with `2` invertible, roundness to fold two), GlobalQuadraticForms (main: number-field local–global theory), GeometryOfNumbersAndQuadraticArithmeticPartII (integral Witt comparison), AdicCoefficientsAndComparisonsPartII, LocalFieldsRamificationPartII, KTheoryFiniteLocalFields (suppliers); nothing shared.

Source independence: changed passages only: 0 passages changed in the folder, so 0 compared with 0 sources; no layer added, removed or reordered, so the locator shares and the arrangement were not compared again.

## Not verifiable

- `kato82`, `arason75`, `milnor70`: settled as uncertified, cited by locator only; no changed passage cites them.
- The consumers LogicAndDefinabilityInNumberTheoryPartII and RealSurfacePeriodIndex named in the PR text are neither on main nor among the open pull requests indexed: what they take from this roadmap was checked against this README's `## Downstream consumers` only.
- “2 independent review rounds and 2 red-team rounds” in the description's AI-assistance line: a process record outside the repository, not checked.

## Source issues

- none

## For the human reviewers

- none
