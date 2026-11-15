# Review of ProjectiveModulesOverPolynomialRings (pull request #2295 at f5960d5)

**Verdict:** needs changes

Incremental re-review of the 13 lines changed since `a48935d`. The three repairs to the README are correct. One P3 finding is left: a sentence in the pull request's description that the repair made stale.

## R01 (P3): The description's adversarial pass still reports the comaximality instance the head dropped

**Location** Pull request description, "Adversarial pass", Zariski gluing bullet: “over `ℤ`, ranks `1 ≠ 2` glue to nothing; over `ℤ[Y]`, the non-comaximal `Y` and `2 + Y` do not separate `ℤ[Y]` from `ℤ[Y] ⊕ 𝔽₂`;”

**Claim** The head removed this instance from 3.6's Check 3 because it refutes nothing. The description still reports it as the comaximality test and leaves out the counterexample the head now uses.

**Witness** With `M₁ = R_f`, `M₂ = R_g`, `α = 1`, the module `M = ℤ[Y]` satisfies 3.6's conclusion. README:458–462 now uses `k[x, y]_(x, y) ⧸ (xy)` with `f = g = x + y`. The description's own Acceptance-test paragraph names that ring, so the two sections disagree.

**Repair** Replace the bullet with: “over `ℤ`, ranks `1 ≠ 2` glue to nothing; over the local ring `k[x, y]_(x, y) ⧸ (xy)`, the non-comaximal `f = g = x + y` with `M₁ = M₂ = k(x) × 0` and `α = 1` glue to no finitely generated projective module, since every such module is free;”

## Previous findings

- R01: partly repaired. README:458–460 now reads “Without comaximality the statement fails: for a field `k`, `R = k[x, y]_(x, y) ⧸ (xy)` and `f = g = x + y` (in the maximal ideal)…”. The description bullet that its repair named is unchanged; it is R01 above.
- R02: repaired. README:585–586 now reads “… `A[Y]`-module `M` in the universe of the two pieces (that of `A` and `P` together); 4.3 is applied to `M` in that universe.”
- R03: repaired. README:431–433 now reads “… XV.4.4 bis, p. 866, applied with `θ₁₂ = α` and `θ₂₁ = α⁻¹`: its condition on triples of distinct indices is empty for two comaximal elements, …”

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 3.6 Check 3, `R_f` in the new control | `R = k[x, y]_(x, y) ⧸ (xy)`, `f = g = x + y` | `Spec R = {(x), (y), (x, y)}`, `D(f) = {(x), (y)}`; `(x) + (y) ∋ f`, `(x) ∩ (y) = 0`; CRT gives `R_f ≅ k(y) × k(x)` | As stated (product of the two function fields) | None |
| 3.6 Check 3, the conclusion fails | `M₁ = M₂ = k(x) × 0`, `α = 1`; `M ≅ Rⁿ` (`R` local) | ranks of `R_f ⊗ Rⁿ` at the two points: `(n, n)`; of `M₁`: `(1, 0)`; no `n` matches, `n = 0` included | Counterexample holds | None |
| 3.6 Check 3 against the Lean signature with `hfg` dropped | `Rf = Rg = Rfg = Localization.Away (x + y)`, identity algebra maps | `IsLocalization.Away (f * f) Rf` holds (inverting `f²` = inverting `f`); towers trivial; only `IsCoprime f f` fails (`x + y ∈ m`) | Refutes exactly the dropped hypothesis | None |
| 3.6 locator, XV.4.4 bis at `n = 2` | `θ₁₂ = α`, `θ₂₁ = α⁻¹` | first condition: `α⁻¹ ∘ α = id_(M₁₂)`, `α ∘ α⁻¹ = id_(M₂₁)`; second: no distinct `i, j, k` in `{1, 2}` | Source supports 3.6 as written | None |
| 3.6, the description's old instance | `ℤ[Y]`, `f = Y`, `g = 2 + Y`, `M₁ = R_f`, `M₂ = R_g`, `α = 1` | `M = ℤ[Y]`: `R_f ⊗ M = R_f`, `R_g ⊗ M = R_g`; the conclusion holds | Not a control | R01 |
| 4.4 route, universe, `u > v` | `A = ULift.{1} ℤ`, `P = Q = ℤ : Type 0` | pieces `A[Y]_Y ⊗[A] P : Type 1`, both in one universe as 3.6 needs; `M : Type 1`; 4.3 at `v = 1`; extendedness witness `ULift P` | Sentence and route agree | None |
| 4.4 route, universe, `u < v` | `A : Type 0`, `P, Q : Type 1` | pieces in `Type (max 0 1) = Type 1`; `M : Type 1`; `P ≅ M(1)` in one universe | Agrees | None |

The rows for every other statement stand as in the previous review, of `a48935d`.

- Source locators checked against the text: 2. LombardiQuitte2015 XV.4.4 bis (lines 41087–41123; file page 898 is printed p. 866) and XV.2.2 item 4 (lines 40413–40422, printed p. 852).
- Declarations compared with the changed route: `exists_finite_projective_glue` (Suggested.lean:142, `M₁ M₂ : Type v`), `isExtendedFrom_of_isExtendedFrom_monicLocalization` (Suggested.lean:187, universe-polymorphic in `P`), `IsExtendedFrom` (Suggested.lean:74, `N` in `M`'s universe), `nonempty_linearEquiv_of_monicLocalization` (Suggested.lean:196). The pinned Tau Ceti has no theorem gluing modules over localisations.
- Gate at this head: every check passes. Run locally against the public order, `depcheck` printed `NOT IN ORDER: ProjectiveModulesOverPolynomialRings (insert it after its last supplier)`; at this stage that is not a finding. With the candidate order: `depcheck: 245 roadmaps, 2230 edges, 0 problem(s)`, placed after its one supplier, PadicDifferentialEquationsAndRigidCohomology (lines 122–123).
- Elaboration of `Suggested.lean` (`lake env lean`): 18 `sorry` warnings, nothing else. The file has not changed since `a48935d`.
- Outside the folder: `git diff --stat origin/main...HEAD` is empty.
- The description read against the head: its Acceptance-test paragraph on 3.6 (universe, `θ₁₂ = α`, new control), the Layer 4 bullet, Ownership and Review point 4 agree with the head. The one disagreement is R01.

Overlap check: read HomologicalStabilityOfGeneralLinearGroups (frames and stability; nothing shared), RelativeFarguesFontaine (§6.2 recovers Zariski gluing with no named target) and AlgebraicVectorBundles on main (module-sheaf pullback and determinants; nothing shared). Two-element Zariski gluing (3.6) is owned here.

Source independence: changed passages only. 3 passages (the 3.6 locator clause, 3.6's Check 3, the 4.4 universe sentence) compared with 1 source, LombardiQuitte2015 at XV.4.4 bis; none shared. Largest share is LombardiQuitte2015, about 27 of 74 locators (no locator added or removed). No layer was added, removed or reordered, so the contents comparison stands: independent.

## Not verifiable

- Suslin 1977, Theorem 2, p. 479 (1.1): not read, as in the previous reviews; this change does not touch it.
- Suslin 1976, Horrocks 1964, Theorem 1, and Lang, Theorem XXI.3.4: not read; supported through Quillen1976, LombardiQuitte2015 and Kedlaya2004, as recorded before.
- The works cited only in Research context: not read; no target depends on them.

## Source issues

- none

## For the human reviewers

- **Licence.** Quillen1976 lines 22–27: the GDZ scan carries terms that restrict reproduction. The README and this report give only locators and restatements.
