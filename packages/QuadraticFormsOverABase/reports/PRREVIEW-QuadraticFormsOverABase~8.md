# Review of QuadraticFormsOverABase (pull request #1930 at 5626f46)

**Verdict:** needs changes

## R01 (P3) — Provenance leaves out the LeanPool project that overlaps this roadmap

**Location:** `TauCetiRoadmap/QuadraticFormsOverABase/README.md:1021` and `:1059`: "`LeanPool/HasseMinkowski` proves the Hasse–Minkowski theorem for quadratic forms over `ℚ`" … "projects `LeanPool/HasseMinkowski`."

**Claim:** The section is there to map existing Lean code to targets. It maps only a project about forms over `ℚ`, which shares nothing this roadmap owns. It leaves out the LeanPool project at the same commit that covers 0.2 and 2.1 and the quadratic-algebra criterion of 2.4 and 5.1, all without dividing by `2`. The repository README's porting rule asks for such existing work to be cited.

**Witness:** LeanPool at `f8b9b72`, `CompositionAlgebrasOverRings/`: `QuadraticForm/Regularity.lean:315` `IsGPRNonsingular` (radical `⊥` after every field base change, which is 2.1's `IsSmooth`); `QuadraticForm/NonsingularOverFields.lean:315`; `QuadraticForm/BaseChangeProjective.lean:347`; `Composition/QuadraticEtale.lean:232` (`IsUnit (t ^ 2 - 4 * n₀)`).

**Repair:** After the HasseMinkowski paragraph, add:

> `LeanPool/CompositionAlgebrasOverRings` treats quadratic forms on finitely generated projective
> modules over any commutative ring without dividing by `2`. It defines base change through a
> bilinear representative and shows that it agrees with `QuadraticForm.baseChange` when `2` is
> invertible (`QuadraticForm/BaseChangeProjective.lean`; compare 0.2's `mapCoeffs_eq_baseChange`).
> It defines `QuadraticForm.IsGPRNonsingular`, the vanishing of the radical after every base change
> to a field, and compares it with `QuadraticMap.Nondegenerate` over a field
> (`QuadraticForm/Regularity.lean`, `QuadraticForm/NonsingularOverFields.lean`; compare 2.1's
> `IsSmooth`). It also proves that the norm of a free quadratic algebra is regular exactly when
> `t² − 4n₀` is a unit (`Composition/QuadraticEtale.lean`; compare Tau Ceti's
> `QuadraticAlgebra.etale_iff_isUnit_discr`, used in 2.4 and 5.1).
> `LeanPool/HyperellipticCurves/ForMathlib/Resultant.lean` defines the discriminant at formal
> degree, `Polynomial.discrOfDegree`, with its compatibility with ring maps and its degree-drop
> formula (compare HyperellipticCurves §0.1's `formDiscr` and 6.1).

In the References entry, change "projects `LeanPool/HasseMinkowski`" to "projects `LeanPool/HasseMinkowski`, `LeanPool/CompositionAlgebrasOverRings`, `LeanPool/HyperellipticCurves`". Update the description's "Provenance" paragraph to match.

## R02 (P3) — "nothing there treats forms over a base" is false of HasseMinkowski

**Location:** `README.md:1022–1024`: "These are forms over fields with `2` invertible, which Scope leaves to other roadmaps; nothing there treats forms over a base, half-discriminants or the orthogonal group scheme."

**Claim:** The project also proves base-change lemmas for forms over any commutative ring in which `2` is invertible. Read through the polar matrix, these are 0.2's `mapCoeffs_eq_baseChange`.

**Witness:** `LeanPool/HasseMinkowski/Prod.lean:83–98` at `f8b9b72`: `baseChange_toMatrix` and `baseChange_discr` under `[CommRing R] [Invertible (2 : R)]`. At `R = ℤ[1/2]`, `A = R[t]`, `Q = x² + x y`, both sides are `!![1, 1/2; 1/2, 0]`.

**Repair:** Replace the sentence with: "Its main theorems concern forms over `ℚ`, `ℚ_p` and `ℝ`, which Scope leaves to QuadraticFormInvariants. Its `Prod.lean` also shows, over a commutative ring `R` in which `2` is invertible, that the matrix of `QuadraticForm.baseChange A Q` in the base-changed basis is the matrix of `Q` mapped into `A` (`baseChange_toMatrix`, `baseChange_discr`). This is a matrix form of 0.2's `mapCoeffs_eq_baseChange`. Nothing there concerns half-discriminants or the orthogonal group scheme."

## R03 (P3) — The description's Layer 4, 5 and 6 bullets claim results the head assigns to other owners

**Location:** Description, "## Scope": "**Layer 4.** `C₀(Q)` Azumaya ⇔ `δ'` unit (odd rank `≥ 3`); the centre of `C₀(Q)` finite étale of rank two (even rank `≥ 2`, `Q` smooth)." The "Layer 5." and "Layer 6." bullets have the same problem.

**Claim:** At this head:
- Layer 4 is 4.1 alone, and the even-rank centre belongs to LefschetzPencilsAndVanishingCycles §2.2.
- "`QuadraticAlgebra R a b` étale ⇔ `b² + 4a` unit" is Tau Ceti's, and Layer 5 only consumes it.
- Layer 6 owns only the resultant identity. Base change, the root at infinity and the étale criterion for monic `f` belong to HyperellipticCurves §0.1 and Tau Ceti.

The Boundaries sentence also leaves out those suppliers and two others from the `depends-on` block.

**Witness:** `README.md:90–92` (the centre is §2.2's); `:77` and `:867` (Tau Ceti `QuadraticAlgebra.etale_iff_isUnit_discr`, consumed); `:937` ("This layer adds the resultant identity at formal degree"); `:825` (Layer 4's only subsection).

**Repair:** Use these bullets:

- "**Layer 4.** `C₀(Q)` Azumaya ⇔ `δ'` unit (odd rank `≥ 3`)."
- "**Layer 5.** The discriminant algebra of an even-rank form is étale ⇔ the form is smooth, through Tau Ceti's `QuadraticAlgebra.etale_iff_isUnit_discr`; the product of two free quadratic algebras and, when `(2, b₁, b₂) = R`, its description as the invariants of `σ₁ ⊗ σ₂`."
- "**Layer 6.** `aₙ formDiscr n f = (−1)^(n(n−1)/2) Res_{n,n−1}(f, f′)` for `natDegree f ≤ n`, on HyperellipticCurves §0.1's `formDiscr`."

Add to the Boundaries sentence: "ordinary forms, their normal form and the even-rank Clifford centre with LefschetzPencilsAndVanishingCycles §§2.1–2.2, `formDiscr` with HyperellipticCurves §0.1, lifting of isometries with GeometryOfNumbersAndQuadraticArithmeticPartII §2.3, `arfInvariant` with GeometryOfNumbersAndQuadraticArithmetic §6.8".

## R04 (P3) — The description names a §5.3, Stacks tags and a single unstated headline, none of which match the head

**Location:** Description: "the product of quadratic algebras of 5.3"; "The Stacks Project, Definition 10.144.1 and Lemma 10.144.2 (Tags 00UB, 00UC)"; "README 3.4 (forms ↔ torsor classes) is not stated".

**Claim:** At this head:
- Layer 5 has only 5.1 and 5.2, and the product of quadratic algebras is 5.2.
- The README cites no Stacks tag.
- The module docstring lists five unstated headlines, not one: 0.2's `extendScalars` comparison, 2.1's ordinarity comparison, 3.1's comparison with §0.1a, 3.4 and 6.1.

**Witness:** `README.md:864`, `:880` (`### 5.1`, `### 5.2`, no `### 5.3`); `grep -c 'Stacks\|00UB\|00UC' README.md` gives `0`; `Suggested.lean:37–49` (five "Not stated here" bullets).

**Repair:**
- Change the Review sentence to "… and the product of quadratic algebras of 5.2."
- Delete the Stacks bullet.
- Change the Acceptance-test sentence to: "README 0.2's comparison with `extendScalars`, 2.1's comparison with ordinarity, 3.1's comparison with OrthogonalTamagawaAndLatticeMass §0.1a, 3.4 (forms ↔ torsor classes) and 6.1 (the resultant identity) are not stated. Each lacks its supplier's carrier at the pins (QuadraticFormInvariantsPartII §0.2, LefschetzPencilsAndVanishingCycles §2.1, OrthogonalTamagawaAndLatticeMass §0.1a, SchemeAndStackFoundations §2.3, HyperellipticCurves §0.1), and the docstring says so."

## Previous findings

- none: the previous report (at 7cf144f) was an acceptance with no finding.

## Verified sound

| # | Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|---|
| 1 | Provenance: HasseMinkowski is about forms over fields only | `R = ℤ[1/2]` (not a field), `A = R[t]`, `Q = x² + x y`, `Prod.lean` `baseChange_toMatrix` | hypotheses `CommRing`, `Invertible 2` hold; matrix `!![1, 1/2; 1/2, 0]` / `!![1, 1/2; 1/2, 0]` | sentence false | R02 |
| 2 | 0.2 `mapCoeffs_eq_baseChange` against LeanPool `baseChangeOfProjective_eq_baseChange` | `R = ℤ[1/2]`, `Q = x² + x y`, `x = t e₀ + e₁`; `𝔽₂ → 𝔽₄`, `x = (1, ω)` | `t² + t` / `t² + t`; `1 + ω = ω²` / `ω²` (representative `!![1, 1; 0, 0]`) | holds; same comparison exists in LeanPool | R01 |
| 3 | 2.1 `IsSmooth` against LeanPool `IsGPRNonsingular` | `x²/𝔽₂`; `2x²/ℤ`; `x²/𝔽₂[ε]`; `x² + t y²/𝔽₂(t)` | `δ' = 1` smooth / nonsingular; `δ' = 2` not / not; `δ' = 1` smooth / nonsingular; `det = 0` not / radical `(√t, 1)` | same notion | R01 |
| 4 | Tau Ceti `etale_iff_isUnit_discr` (`b² + 4a`) against LeanPool `isGPRRegular_conic_iff` (`t² − 4n₀`, `a = −n₀`, `b = t`) | `ℤ[i]` `(−1, 0)`; `ℤ[(1+√5)/2]` `(1, 1)`; `𝔽₄/𝔽₂` `(1, 1)` | `−4 / −4`; `5 / 5`; `1 / 1` | same criterion | R01, R03 |
| 5 | Description Layer 4: even-rank centre | `n = 2`, `x² + x y + y²` over `𝔽₂`, `t = e₀e₁` | `t² = e₀(1 − e₀e₁)e₁ = t − 1`, so `C₀ = 𝔽₂[t]/(t² + t + 1) = 𝔽₄`; owner §2.2 (LefschetzPencils README:1591) | not a target here | R03 |
| 6 | 6.1 and the degree drop the description assigns to Layer 6 | `f = X + X²`, `n = 2`; `f = c + bX`, `n = 2` | `a·formDiscr = 1` / `(−1)·a(4ac − b²) = 1`; `formDiscr 2 f = b²` (HyperellipticCurves README:547) / left side `0`, `Res = 0` | 6.1 holds; degree drop is §0.1's | R03 |

Rows for the untouched statements stand as in the previous review, of 7cf144f; `Suggested.lean` is byte-identical since then.

- **Gate:** the worker's `gate.md` reports 0 on every check, with `build=0`. My rerun against the public order gives `depcheck=1` only for "NOT IN ORDER: QuadraticFormsOverABase", because the public file does not list it yet. The candidate order lists it at line 417, after its last supplier, GeometryOfNumbersAndQuadraticArithmeticPartII (416). Not a finding.
- **Dependency check** (the brief's command, `--movable`): `depcheck: 235 roadmaps, 2239 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean …/Suggested.lean` exits 0 in 7 s with 22 warnings, all `declaration uses 'sorry'`.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuadraticFormsOverABase'` is empty. The 563 files in the change list since 7cf144f all come from the merge of main (`a267c240`).
- **LeanPool at `f8b9b72`:** `lean-toolchain` v4.35.0 and Mathlib `inputRev` v4.35.0, both earlier than our pin (Lean v4.36.0-rc2, Mathlib `1b1ccf4`). Root `LICENSE` is Apache-2.0, and the card `projects/hasse-minkowski.yaml` says `license: Apache-2.0`. Provenance ¶1's description of LeanPool matches LeanPool's own README. `HasseMinkowski/Main.lean:197` (`hasseMinkowski` over `ℚ`), `HilbertSymbol/{Padic,Real,Reciprocity}.lean` and `HasseInvariant.lean:67` confirm ¶2's first sentence.
- **Declarations opened:** 9 LeanPool declarations (`Prod.lean:89, 98`, `Regularity.lean:315`, `NonsingularOverFields.lean:315`, `BaseChangeProjective.lean:347`, `QuadraticEtale.lean:232`, `Main.lean:197`, `HasseInvariant.lean:67`, `Resultant.lean:214`). At the pins: Tau Ceti `Algebra/QuadraticAlgebra/Etale.lean:29` and Mathlib `Algebra/QuadraticAlgebra/Discriminant.lean:52`.
- **Cross-roadmap citations resolved** at their heads: LefschetzPencilsAndVanishingCycles `evenClifford_center_etale_azumaya` (README:1591), HyperellipticCurves `formDiscr` (README:545–548). `roadmaps resolve` reports nothing found nowhere.
- Overlap check: read ArithmeticStatisticsPartII (open), OrthogonalSpinGroups (main, `Completed/`, and its open revision). ArithmeticStatisticsPartII §1.3's ternary `4 Det` is that roadmap's own; this roadmap owns the general `δ'` and states the comparison in Scope. OrthogonalSpinGroups works over a field with `Invertible (2 : K)` (its README:116), so nothing is shared. `overlaps.md` reports no pull request that changes this roadmap and no dropped or revision-only id.
- Source independence: changed passages only; 2 passages (Provenance ¶1–2) compared with 2 texts (LeanPool `README.md` and `projects/hasse-minkowski.yaml` at `f8b9b72`). The longest shared run is 5 words, the licence phrase "permissively licensed (Apache-2.0 or MIT)". The change cites no mathematical source, and no layer was added, removed or reordered, so the contents comparison and locator shares stand as in the previous review.

## Not verifiable

- Nothing in the changed passage: LeanPool was read at its pinned commit. The earlier reports' items concern untouched text and stand as recorded there.

## Source issues

- none

## For the human reviewers

- **Licence:** the new section cites LeanPool, whose root `LICENSE` at `f8b9b72` is Apache-2.0. `HasseMinkowski` files carry Apache-2.0 headers. `RankCriteria.lean` and `HilbertSymbol/Existence.lean` say they are derived from mariainesdff/HassePrinciple (Apache-2.0). No `Suggested.lean` declaration shares a name or statement with them.
- **Licence:** the card `LeanPool/projects/composition-algebras-over-rings.yaml` (R01) records `license: Apache-2.0`, `provenance: AI` and the source repository skipgaribaldi/CompositionAlgebras-lean. Its names (`IsGPRNonsingular`, `baseChangeOfProjective`) differ from those in `Suggested.lean`.
- **Coordination:** the description says that LeanPool's maintainers have not been contacted. `README.md:1018` says adaptation is agreed with them first. Nothing is adapted.
