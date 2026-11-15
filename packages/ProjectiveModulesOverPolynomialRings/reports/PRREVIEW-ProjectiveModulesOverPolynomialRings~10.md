# Review of ProjectiveModulesOverPolynomialRings (pull request #2295 at 4f4a2a8)

**Verdict:** accepted

Incremental re-review: the folder has 0 changed lines since `f5960d5`. The new head is a merge of main, which brings nothing into the pull request's diff. No findings.

## Previous findings

- R01: repaired. The description's Zariski gluing bullet now reads “over the local ring `k[x, y]_(x, y) ⧸ (xy)`, the non-comaximal `f = g = x + y` with `M₁ = M₂ = k(x) × 0` and `α = 1` glue to no finitely generated projective module, since every such module is free;”. This agrees with README:458–462.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 3.6, the comaximality control (description bullet, README:458–462) | `R = k[x, y]_(x, y) ⧸ (xy)`, `f = g = x + y`, `M₁ = M₂ = k(x) × 0`, `α = 1` | `D(f) = {(x), (y)}`, `R_f ≅ k(y) × k(x)`; `R` is local, so `M ≅ Rⁿ` with ranks `(n, n)` against `(1, 0)`; no `n` works, `n = 0` included | Counterexample holds; description and README agree | None |
| 3.6, Lean signature on the same instance | `Rf = Rg = Rfg = Localization.Away (x + y)`, identity algebra maps | `IsLocalization.Away ((x + y)²)` holds; the towers are trivial; `IsCoprime f f` would need `x + y` to be a unit, but `x + y ∈ 𝔪` | Refutes exactly `hfg` | None |
| 3.6, dependence on `α` (description bullet) | `ℤ[√−5]`, `f = 2`, `g = 3`, `M₁ = R_2`, `M₂ = R_3`, `α = u⁻¹`, `u = 1 + √−5` | `u(1 − √−5) = 6`, a unit of `R_6`; `2/u = (1 − √−5)/3 ∈ R_3`; `𝔞R_2 = R_2`, `𝔞R_3 = uR_3`; `a² + 5b² = 2` has no solution | `M ≅ (2, 1 + √−5)`, not free; the Check stands | None |
| 3.6, degenerate cover | `f = 1`, `g = 0` | `1·1 + 0·0 = 1`, so `IsCoprime` holds; `R_g = R_fg = 0`, `M₂ = 0`, `α` is unique, `M = M₁` | As stated | None |
| 3.6 locator, XV.4.4 bis at `n = 2` | LombardiQuitte2015 lines 41087–41123 (file page 898, printed p. 866); XV.2.2 item 4, lines 40413–40422 (printed p. 852) | first condition: `α⁻¹ ∘ α = id`, `α ∘ α⁻¹ = id`; the condition on distinct triples in `{1, 2}` is empty; item 4 covers f.g. projective | The source supports 3.6 as written | None |

The rows for every other statement stand as in the previous review, of `f5960d5`.

- Gate at `4f4a2a8` (worker): every check passes, the build included. A local re-run with `--base origin/main` fails one check: `depcheck: NOT IN ORDER: ProjectiveModulesOverPolynomialRings (insert it after its last supplier)`. That run reads the public order, and at this stage this is not a finding.
- Dependency check against the candidate order: `depcheck: 245 roadmaps, 2230 edges, 0 problem(s)`. The candidate order puts PadicDifferentialEquationsAndRigidCohomology at line 122 and this roadmap at line 123.
- Elaboration (`lake env lean`): 18 `sorry` warnings and nothing else. A scratch copy with `#check @name` for all 22 declarations elaborates. No declaration has lost a section binder, and nothing changed.
- Outside the folder: `git diff --stat origin/main...HEAD` is empty. The four files the merge touches (`.github/ISSUE_TEMPLATE/*`, `README.md`, `RiemannianGeometry/MinimalSurfaces/README.md`) come from main. The pins are unchanged: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`.
- Cross-roadmap citations resolved: 17.
  - PadicDifferentialEquationsAndRigidCohomology at `457e49f`: §RD.0.55, §RD.0.56 and §RD.3.27, plus `HasFiniteFreeResolution`, `.isStablyFree`, `hasFiniteFreeResolution_polynomial` and `hasUnimodularExtension_iff` (Suggested.lean:128, 161, 192, 221; all in the ring's universe).
  - GeneralAlgebraicKTheory 9.16 and 10.12a.
  - RelativeFarguesFontaine §6.1–§6.5.
  - AlgebraicKTheory 0.3, 0.5, 1.1, 2.1, 4.1, 4.2 and Layer 6, on main.
- Source locators re-read: 2, both at LombardiQuitte2015 (XV.4.4 bis and XV.2.2 item 4). These are the locators the changed description bullet relies on.
- Description checked against the head: the 18 theorems, the 4 definitions, the module form, the single supplier edge, the 3.6 control and "nothing outside the folder" all agree with it. Its Elaboration paragraph names `f5960d59` as the current head. The folder at `4f4a2a8` is identical to that commit, and CI's `build` is pending at `4f4a2a8`, so the paragraph's claim still holds.

Overlap check: read HomologicalStabilityOfGeneralLinearGroups (frames, `E_n` stability, Suslin's spectral sequence; nothing shared). The lists of roadmaps on main closest by vocabulary and closest by results are empty. RelativeFarguesFontaine §6.2 still mentions Zariski gluing only as an unnamed specialisation bullet, so two-element Zariski gluing (3.6) is owned here.

Source independence: changed passages only. The folder's diff is empty, so no passage is new. 3.6's locator clause was set beside LombardiQuitte2015 lines 41087–41123, and no wording is shared beyond the principle's name. Largest share: LombardiQuitte2015, about 27 of 74 locators, unchanged. No layer was added, removed or reordered, so the contents comparison stands: independent.

## Not verifiable

- Suslin 1977, Theorem 2, p. 479 (1.1): not read, as in the previous reviews; this change does not touch it.
- Suslin 1976, Horrocks 1964 (Theorem 1) and Lang, Theorem XXI.3.4: not read. They are supported through Quillen1976, LombardiQuitte2015 and Kedlaya2004, as recorded before.
- The works cited only in Research context: not read; no target depends on them.

## Source issues

- none

## For the human reviewers

- **Licence.** Quillen1976 lines 22–27: the GDZ scan carries terms that restrict reproduction. The README and this report give only locators and restatements.
