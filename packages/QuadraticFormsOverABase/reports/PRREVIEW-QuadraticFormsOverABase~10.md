# Review of QuadraticFormsOverABase (pull request #1930 at c6ecaae)

**Verdict:** needs changes

## R01 (P3) — Provenance gives the Hasse–Minkowski theorem to QuadraticFormInvariants, which leaves it to GlobalQuadraticForms

**Location:** `TauCetiRoadmap/QuadraticFormsOverABase/README.md:1022–1023`: "Its main theorems concern forms over `ℚ`, `ℚ_p` and `ℝ`, which Scope leaves to QuadraticFormInvariants." The description's Provenance paragraph has the same clause.

**Claim:** The main theorem of `LeanPool/HasseMinkowski` is Hasse–Minkowski isotropy over `ℚ`. QuadraticFormInvariants, on main, leaves Hasse–Minkowski to GlobalQuadraticForms. It owns only the Hilbert symbol and Hasse invariant over a nonarchimedean local field (Layer 6). The sentence this replaces said "other roadmaps", which was correct.

**Witness:** LeanPool `HasseMinkowski/Main.lean:197` `hasseMinkowski : Isotropic Q ↔ EverywhereLocallyIsotropic Q`. QuadraticFormInvariants `README.md:90–92` gives "Hasse–Minkowski" to GlobalQuadraticForms. GlobalQuadraticForms `README.md:773` is "5.5 Hasse–Minkowski isotropy".

**Repair:** Replace the sentence with: "Its main theorems concern forms over `ℚ`, `ℚ_p` and `ℝ`, fields in which `2` is invertible: the Hasse–Minkowski theorem is GlobalQuadraticForms' (§5.5), and the Hilbert symbol and the Hasse invariant over a nonarchimedean local field are QuadraticFormInvariants' (Layer 6)."

In the description, change "treats forms over `ℚ`, `ℚ_p` and `ℝ`, which Scope leaves to QuadraticFormInvariants" to "treats forms over `ℚ`, `ℚ_p` and `ℝ` (Hasse–Minkowski: GlobalQuadraticForms §5.5; local Hilbert symbols: QuadraticFormInvariants Layer 6)".

The dependency check of the repaired README reports 0 problems.

## R02 (P3) — The description names a `conj` that the head lacks and says `orthogonalGroup` carries its own proofs

**Location:** Description, Acceptance test: "no `sorryAx` in any definition (`orthogonalGroup` and `conj` carry their own proofs)."

**Claim:** `Suggested.lean` declares no `conj`. `orthogonalGroup` is the range of a homomorphism and has no proof fields of its own. The claim before the parenthesis is true.

**Witness:** `grep -c conj Suggested.lean` gives `0`. `Suggested.lean:225–228` reads `(QuadraticMap.orthogonalToGeneralLinear (mapCoeffs (algebraMap R A) Q)).range`. `#print axioms` on all 17 definitions, run on a scratch copy, gives only `propext`, `Classical.choice` and `Quot.sound`.

**Repair:** "Elaboration probe: no auto-bound binders; no theorem closed by one tactic; no `sorryAx` in any of the 17 definitions (`orthogonalGroup` is the range of Tau Ceti's `QuadraticMap.orthogonalToGeneralLinear`)."

## Previous findings

- R01 — repaired: "`LeanPool/CompositionAlgebrasOverRings` treats quadratic forms on finitely generated projective modules over any commutative ring without dividing by `2`." (README:1029–1040). References list the three projects, and the description's Provenance paragraph is updated.
- R02 — repaired: "Its `Prod.lean` also shows, over a commutative ring `R` in which `2` is invertible, that the matrix of `QuadraticForm.baseChange A Q` … is the matrix of `Q` mapped into `A`" (README:1023–1027). The clause before it is R01 above.
- R03 — repaired: the description now has "**Layer 4.** `C₀(Q)` Azumaya ⇔ `δ'` unit (odd rank `≥ 3`)". The Layer 5 and 6 bullets are as proposed, and the Boundaries sentence names LefschetzPencils §§2.1–2.2, HyperellipticCurves §0.1, GeometryOfNumbers… §2.3 and §6.8.
- R04 — repaired: the description now says "the product of quadratic algebras of 5.2" and has no Stacks bullet. Its Acceptance-test sentence lists 0.2, 2.1, 3.1, 3.4 and 6.1, as `Suggested.lean:37–49` does.

## Verified sound

| # | Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|---|
| 1 | Provenance ¶2: HasseMinkowski's main theorems → QuadraticFormInvariants | LeanPool `hasseMinkowski` over `ℚ`; QuadraticFormInvariants README:90; GlobalQuadraticForms README:773 | owner the sentence names: QuadraticFormInvariants / owner that roadmap names: GlobalQuadraticForms §5.5 | false attribution | R01 |
| 2 | 0.2 `mapCoeffs_eq_baseChange` against `Prod.lean` `baseChange_toMatrix`, `baseChange_discr` | `R = ℤ[1/2]`, `A = R[t]`, `Q = x² + 3xy + 2y²`, `v = t e₀ + e₁` | coefficients `[[1,3],[0,2]]`: `t² + 3t + 2` / `toMatrix [[1,3/2],[3/2,2]]`: `t² + 3t + 2`; `discr −1/4` both; `det polar = −1 = 4·(−1/4)` | holds | none |
| 3 | 2.1 `IsSmooth` against `IsGPRNonsingular` and `QuadraticMap.Nondegenerate` | `xy/𝔽₂`; `x² + y²/𝔽₂`; `x²/𝔽₂`, `n = 1` | `det polar = 1`: yes/yes/yes; `(1,1)` in radical, `det polar = 0`: no/no/no; `δ' = 1`, radical `0`, polar kernel rank 1: yes/yes/yes | same notion | none |
| 4 | Tau Ceti `etale_iff_isUnit_discr` (`b² + 4a`) against LeanPool `isGPRRegular_conic_iff` (`t² − 4n₀`, `a = −n₀`, `b = t`) | `ℤ[√2]`; `ω² = −1 − ω` over `𝔽₂`; `ℤ[i]` | `8 / 8` (non-unit); `−3 = 1 / 1` (unit, `𝔽₄`); `−4 / −4` (non-unit) | same criterion | none |
| 5 | 6.1 and LeanPool `discrOfDegree` against HyperellipticCurves `formDiscr` | `f = 1 + X + X²`, `n = 2`; `f = 2 + 3X`, `n = 2`; `f = 2`, `n = 1` | `a₂·formDiscr = −3` / `−Res₂,₁(f, 1+2X) = −3`; `discrOfDegree = 3²·1 = 9` / `formDiscr = 9`, 6.1 `0 / 0`; `1 / 1` | holds; degree drop agrees | none |
| 6 | Provenance ¶1: authors "named in each file's header and in LeanPool's NOTICE" | headers of `Regularity.lean`, `Resultant.lean`, `Prod.lean`; NOTICE:75–76, 160, 516–560 | headers: Garibaldi / Stoll / jayyswan; NOTICE: repositories `skipgaribaldi/…`, `MichaelStollBayreuth/…`, `jayyswan/…`, plus the HassePrinciple authors | holds | none |
| 7 | Description: no `sorryAx` in any definition; "`orthogonalGroup` and `conj` carry their own proofs" | `#print axioms` on 17 definitions; grep for `conj` | 17 × `[propext, Classical.choice, Quot.sound]`; `conj`: 0 declarations; `orthogonalGroup` = `….range` | parenthesis false | R02 |

Rows for the untouched statements stand as in the previous review, of `5626f46`. `Suggested.lean` is byte-identical since `7cf144f`, and the README is identical above `## Provenance`.

- **Gate:** the worker's `gate.md` reports 0 on every check, with `build=0`. My rerun gives `depcheck=1` only for "NOT IN ORDER: QuadraticFormsOverABase", against the public order. The candidate order lists it at line 426, after its last supplier, GeometryOfNumbersAndQuadraticArithmeticPartII (line 425). Not a finding.
- **Dependency check** (the brief's command, `--movable`): `depcheck: 258 roadmaps, 2453 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line, with or without the R01 repair.
- **Elaboration:** `lake env lean …/Suggested.lean` exits 0 in 6 s with 22 warnings, all `declaration uses 'sorry'`. The pins (Lean v4.36.0-rc2, Mathlib `1b1ccf4`, Tau Ceti `2fd255d`) are unchanged by the merge `c6ecaae`.
- **Outside the folder:** `git diff --stat origin/main...HEAD` outside the folder is empty. The files listed since `5626f46` come from the merge of main. With whitespace normalised, the References change only by the two added project names.
- **LeanPool declarations opened at `f8b9b72`:** 9 of them: `Prod.lean:89, 98`, `BaseChangeProjective.lean:347`, `Regularity.lean:315`, `NonsingularOverFields.lean:315`, `QuadraticEtale.lean:232`, `Resultant.lean:214, 258`, `Main.lean:197`. Also opened: `NOTICE` and three project cards.
- **Pinned declarations opened:** Mathlib `Algebra/QuadraticAlgebra/Discriminant.lean:52`, `LinearAlgebra/QuadraticForm/Basic.lean:1208` and `LinearAlgebra/QuadraticForm/Radical.lean:115`; Tau Ceti `Algebra/QuadraticAlgebra/Etale.lean:29`.
- **Citations resolved:** HyperellipticCurves §0.1 (README:545–556 at `91861b5`); QuadraticFormInvariants README:5–7 and 90–92; GlobalQuadraticForms README:27–29 and 773 (main). `roadmaps resolve` finds two names nowhere, `discrOfDegree` and `IsGPRNonsingular`. Both are LeanPool names, attributed to their files and found at `Resultant.lean:214` and `Regularity.lean:315`.
- **Remark on untouched text:** Scope (README:83–84) gives every form over a field in which `2` is invertible to QuadraticFormInvariants. That roadmap leaves global forms to GlobalQuadraticForms (its README:90). None of the 15 seeded targets lies in the changed passages.

Overlap check: read HyperellipticCurves (open, §0.1 and its LeanPool list), QuadraticFormInvariants and GlobalQuadraticForms (main), ArithmeticStatisticsPartII (open) and OrthogonalSpinGroups (main). They share these objects:
- `formDiscr` is owned by HyperellipticCurves §0.1 and consumed in 6.1.
- The ternary `4 Det` is owned by ArithmeticStatisticsPartII §1.3; this roadmap owns the general `δ'`.
- OrthogonalSpinGroups works over a field with `Invertible (2 : K)` (its README:117) and shares nothing.
- `overlaps.md` reports no pull request that changes this roadmap and no dropped or revision-only id.

Source independence: changed passages only. 3 passages (Provenance ¶1–3) were compared with 7 LeanPool texts at `f8b9b72`: `NOTICE`/`README.md`, the docstrings of `BaseChangeProjective`, `Regularity`, `NonsingularOverFields`, `QuadraticEtale`, `Resultant`, and `Prod`. The longest shared runs are the 7-word licence phrase "permissively licensed (Apache-2.0 or MIT)", which is untouched text, and the 6 words "quadratic algebra is regular exactly when", which sit inside a 15-word statement. No layer was added, removed or reordered, so the contents comparison and the locator shares stand as in the previous review.

## Not verifiable

- The description's "depth 31" in the open-pull-request dependency graph: no tool available here computes that depth.

## Source issues

- none

## For the human reviewers

- **Licence:** at `f8b9b72`, LeanPool's root `LICENSE` is Apache-2.0. The cards record `license: Apache-2.0` for `hasse-minkowski` (provenance mix), `composition-algebras-over-rings` (AI, skipgaribaldi/CompositionAlgebras-lean) and `hyperelliptic-chabauty-coleman` (AI, MichaelStollBayreuth/HyperellipticCurves). No `Suggested.lean` declaration shares a name or statement with them.
- **Licence:** LeanPool `NOTICE:531–559` records that `HasseMinkowski/RankCriteria.lean`, `HilbertSymbol/Existence.lean` and `Padics/Squares.lean` are derived from mariainesdff/HassePrinciple (Apache-2.0).
- **Coordination:** `README.md:1018–1019` says adaptation is agreed first with the authors of the code. The description says LeanPool's maintainers have not been contacted. Nothing is adapted in `Suggested.lean`.
