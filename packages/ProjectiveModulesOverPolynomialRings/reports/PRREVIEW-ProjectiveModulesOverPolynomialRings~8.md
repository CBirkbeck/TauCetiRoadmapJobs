# Review of ProjectiveModulesOverPolynomialRings (pull request #2295 at a48935d)

**Verdict:** needs changes

Incremental re-review of the 137 lines changed since `bde4633` (new target 3.6, the route of 4.4 through it, the RelativeFarguesFontaine contract removed, one reference dropped). Three findings, all P3, all in changed passages.

## R01 (P3) — The negative control for comaximality in 3.6 does not refute anything

**Location** `TauCetiRoadmap/ProjectiveModulesOverPolynomialRings/README.md:455-460`: “Neither hypothesis can be dropped. […] Without comaximality the localisations do not determine projectivity: for `R = ℤ[Y]`, `f = Y` and `g = 2 + Y` […]”

**Claim** The instance does not show that comaximality is needed: with `M₁ = R_f`, `M₂ = R_g` the conclusion of 3.6 holds there.

**Witness** `R = ℤ[Y]`, `f = Y`, `g = 2 + Y`, `α = 1`: `M = ℤ[Y]` is finitely generated projective with `R_f ⊗ M ≅ R_f`, `R_g ⊗ M ≅ R_g`; the route's module is `R_f ∩ R_g = ℤ[Y]` too.

**Repair** Replace the sentence from “Without comaximality” to the end of the bullet by an instance where the conclusion fails: “Without comaximality the statement fails: for a field `k`, `R = k[x, y]_(x, y) ⧸ (xy)` and `f = g = x + y` (in the maximal ideal), `R_f = R_g = R_fg = k(x) × k(y)`; take `M₁ = M₂ = k(x) × 0` and `α = 1`. Every finitely generated projective `R`-module is free, `M ≅ Rⁿ`, and `R_f ⊗[R] Rⁿ = k(x)ⁿ × k(y)ⁿ` is never `k(x) × 0`.” (Checked: `R` has the primes `(x)`, `(y)`, `(x, y)`; inverting `x + y` leaves the two minimal ones, and `R_f` is reduced of dimension 0.) The description's bullet “over `ℤ[Y]`, the non-comaximal `Y` and `2 + Y` do not separate `ℤ[Y]` from `ℤ[Y] ⊕ 𝔽₂`” then changes with it.

## R02 (P3) — 4.4: the glued module is not in the universe of `P` and `Q`

**Location** `TauCetiRoadmap/ProjectiveModulesOverPolynomialRings/README.md:582-583`: “3.6 glues `A[Y]_Y ⊗[A] P` and `A[Y]_h ⊗[A] Q` along this identification to a finitely generated projective `A[Y]`-module `M` in the universe of `P` and `Q`.”

**Claim** 3.6 returns `M` in the universe of the two pieces, and these are tensor products over `A : Type u` of `P, Q : Type v`, which live in `Type (max u v)`.

**Witness** `A = ULift.{1} ℤ : Type 1`, `P = Q = ℤ : Type 0` (4.4's Lean signature allows it): `Localization.Away Y ⊗[A] P : Type 1`, so `exists_finite_projective_glue` gives `M : Type 1`, not `Type 0`.

**Repair** Write “… `A[Y]`-module `M` in the universe of the two pieces (that of `A` and `P` together); 4.3 is applied to `M` in that universe.” Nothing else changes: `isExtendedFrom_of_isExtendedFrom_monicLocalization` takes its module in any universe, so the route still needs no `Shrink`.

## R03 (P3) — 3.6: the source's compatibility conditions are not empty for two elements

**Location** `TauCetiRoadmap/ProjectiveModulesOverPolynomialRings/README.md:431-432`: “concrete local-global principle XV.4.4 bis, p. 866, whose compatibility conditions are empty for two comaximal elements”

**Claim** XV.4.4 bis has two conditions; only the one on triples of distinct indices is empty for `n = 2`.

**Witness** LombardiQuitte2015 line 41098: the first condition asks that `θ₂₁ ∘ θ₁₂` be the identity of `M₁₂`, for `i ≠ j` in `1..n`; lines 41099–41107 are the condition on distinct `i, j, k`.

**Repair** “… XV.4.4 bis, p. 866, applied with `θ₁₂ = α` and `θ₂₁ = α⁻¹`: its condition on triples of distinct indices is empty for two comaximal elements, …”.

## Previous findings

- none: the previous report, of `bde4633`, had no finding (its R01 and R02 bullets recorded repairs of the review before it; the passages they quote are superseded: the description now says “There is one supplier edge” and “states 18 headline theorems”, both right at this head).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 3.6 `exists_finite_projective_glue` | `f = 1`, `g = 0`; zero ring; `f = g` | `R_g = R_fg = 0`, `M = M₁`; all modules `0`; `IsCoprime f f` forces `f` a unit, `M = M₁` | Holds | None |
| 3.6, dependence on `α` (Check 2) | `R = ℤ[√−5]`, `f = 2`, `g = 3`, `α = u⁻¹`, `u = 1 + √−5` | `u(1 − √−5) = 6`; `M = R_f ∩ uR_g`; `2/u = (1 − √−5)/3 ∈ R_g`, so `𝔞R_g = uR_g`, `M ≅ (2, u)`; `a² + 5b² = 2` unsolvable | Check correct | None |
| 3.6, necessity of `α` (Check 3, first half) | `ℤ`, `f = 2`, `g = 3`, `M₁ = ℤ[1/2]`, `M₂ = ℤ[1/3]²` | ranks over `ℤ[1/6]`: `1` and `2`; no `α`, no `M` | Check correct | None |
| 3.6, necessity of comaximality (Check 3, second half) | `ℤ[Y]`, `Y`, `2 + Y`; `k[x, y]_(x, y) ⧸ (xy)`, `f = g = x + y` | first: `M = ℤ[Y]` satisfies the conclusion; second: `R_f = k(x) × k(y)`, `M₁ = k(x) × 0`, free `Rⁿ` gives `k(x)ⁿ × k(y)ⁿ` | Check's instance is no control | R01 |
| 3.6 route, `M → M₁` a localisation at `f` | `R_f ⊗ −` on `0 → M → M₁ × M₂ → R_fg ⊗ M₂` | `(M₁)_f = M₁`, `(M₂)_f = R_fg ⊗ M₂`; kernel `{(x, α(1 ⊗ x))} ≅ M₁` | Agrees | None |
| 3.6, conclusion without compatibility with `α`, against its consumer 4.4 | `M(1)`, `M(0)`, `A⟨Y⟩ ⊗ M` | `M(1) = A ⊗[A[Y]_Y] (A[Y]_Y ⊗ P) = P`; `M(0) = Q` through `A[Y]_h`; only the two isomorphisms are used | Suffices | None |
| 4.4 route, comaximality of `Y` and `h` | `H = (X + 2)`; `H = (2X + 1)` | `h = 1 + 2Y`, `h − 2Y = 1`; `Y H(1/Y) = 2 + Y`, `(Y, 2 + Y) = (Y, 2) ≠ (1)` | Agrees with README 599–604 | None |
| 4.4 route, universe of the glued module | `A : Type 1`, `P : Type 0` | pieces and `M` in `Type 1`; 4.3 polymorphic in the module's universe | Route sound, sentence wrong | R02 |

The rows for every other statement stand as in the previous review, of `bde4633`.

- Source locators checked against the text: 2. XV.2.2 item 4 (LombardiQuitte2015 lines 40413–40422, printed p. 852) and XV.4.4 bis (lines 41087–41126, printed pp. 866–867); both support 3.6 as stated, with the reading of R03.
- Library declarations opened at the pin: `Module.projective_of_localization_maximal'` (`RingTheory/LocalProperties/Projective.lean:167`, needs `Module.FinitePresentation`, which the route supplies), `Module.Finite.of_localizationSpan'` (`RingTheory/Localization/Finiteness.lean:229`), `Module.FinitePresentation.of_localizationSpan'` (`RingTheory/LocalProperties/FinitePresentation.lean:27`), `IsLocalization.flat` (`RingTheory/Flat/Localization.lean:37`), `IsCoprime` (`RingTheory/Coprime/Basic.lean:43`). No gluing theorem for modules over localisations at the pinned Mathlib or Tau Ceti; `Algebra/Category/ModuleCat/Descent.lean` is the categorical statement, not this one.
- Cross-roadmap citations resolved at the open head: RelativeFarguesFontaine §6.1 (exact squares, glueing data), §6.2 (its bullet recovering Zariski gluing from the square `R → R_f`, `R_g → R_fg`; no named target for it), §6.4, §6.5. That roadmap is later in the merge order, so 3.6 is rightly stated here.
- Elaboration of `Suggested.lean` at the pins: 18 `sorry` warnings, nothing else. Elaborated type of `exists_finite_projective_glue` compared with README 3.6: same hypotheses, no section binder lost (`A` does not occur). One-tactic probe on a scratch copy: `simp`, `infer_instance`, `rfl`, `aesop` and `exact ⟨M₁, …⟩` all fail.
- Dependency check: `depcheck: 245 roadmaps, 2232 edges, 0 problem(s)`; one supplier, PadicDifferentialEquationsAndRigidCohomology, directly before this roadmap.
- Gate: every check passed (`build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`, `statement-hygiene=0`). Nothing outside the folder differs from the merge base (`git diff --stat origin/main...HEAD` outside the folder is empty).
- The description read against the head: one supplier edge; 18 theorems and 4 definitions; 3.6 in the Layer 3 bullet, the sources list (XV.2.2 p. 852, XV.4.4 bis p. 866), the names at the pin and Review point 4; Research context of three paragraphs; Schäppi absent from both. No sentence contradicts the head.

Overlap check: read HomologicalStabilityOfGeneralLinearGroups, RelativeFarguesFontaine, FiniteEquivalenceRelations, PadicDifferentialEquationsAndRigidCohomology; exact squares, glueing pairs and Beauville–Laszlo are RelativeFarguesFontaine's (§6.1–§6.5), descent along pure maps FiniteEquivalenceRelations' (4.2), finite free resolutions PadicDifferentialEquationsAndRigidCohomology's (§RD.0.55–§RD.0.56); the two-element Zariski gluing has no named target elsewhere and is owned here (3.6).

Source independence: changed passages only: 4 passages (the statement and the route of 3.6, its docstring, the Scope paragraph) compared with 1 source, LombardiQuitte2015 at XV.2.2 and XV.4.4 bis, none shared; largest share LombardiQuitte2015, about 27 of 74 locators; a section was added to Layer 3 but no layer added, removed or reordered, and 3.6 comes from Chapter XV while Layers 3–5 draw on Chapter XVI, so the contents comparison stands: independent.

## Not verifiable

- Suslin 1977, Theorem 2, p. 479 (1.1): not read, as in the previous review; untouched by this change.
- Suslin 1976, Horrocks 1964, Theorem 1, and Lang, Theorem XXI.3.4: not read; supported through Quillen1976, LombardiQuitte2015 and Kedlaya2004 as recorded before.
- The works cited only in Research context: not read; no target depends on them.

## Source issues

- none

## For the human reviewers

- **Licence.** Quillen1976 lines 22–27: the GDZ scan carries terms restricting reproduction; the README and this report give locators and restatements only.
