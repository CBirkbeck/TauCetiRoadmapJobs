# Review of SobolevMapsBetweenManifolds (pull request #2230 at 80ac39d)

**Verdict:** needs changes

## R01 (P3) — §5.2 still carries no source locator

**Location:** `README.md:1051–1053` "the following are equivalent: `f ∈ W^{1,p}_loc(M, N)`; `‖Df‖ ∈ L^p_loc(M)` (§3.2). Route: in a chart, …"

**Claim:** The previous round asked for locators in five sections. §3.1, §3.2, §8.1 and §10.1 now have them, but this theorem still cites no source. The earlier suggested text, `|∇(ι ∘ f)| = ‖Df‖`, is exact only for the operator norm. For `f = id` of the round `S²`, the Hilbert–Schmidt value is `√2` while `‖Df‖ = 1`.

**Witness:** Hajlasz2009 line 28 (§1, p. 185) defines `W^{1,p}(M, N)` for compact Riemannian `M`, `N`, `p < ∞` and `N ⊆ ℝ^ν` isometrically, through `∇(ι ∘ u) ∈ Lᵖ` (lines 20–21).

**Repair:** After "`‖Df‖ ∈ L^p_loc(M)` (§3.2)" insert "(for compact Riemannian `M`, `N`, `p < ∞` and `N` isometrically embedded in `ℝ^ν`, where the class is defined by `|∇(ι ∘ f)| ∈ Lᵖ` and `‖Df‖ ≤ |∇(ι ∘ f)| ≤ √(dim M) ‖Df‖`: Hajłasz 2009, §1, p. 185)".

## Previous findings

- R01 — repaired: `Suggested.lean:335` states `isSobolevMap_iff_exists_hasColocalWeakMFDeriv`. The section comment is at `:254`, docstring lines 23–24 list it and lines 34–35 drop it from "not statable". `README.md:1117` names it, and the description states it.
- R02 — partly repaired: §3.1 (`README.md:651–652`), §3.2 (`:690–691`), §8.1 (`:1344–1346`) and §10.1 (`:1628–1629`) now cite their sources. §5.2 (`:1051–1053`) still has no locator; carried forward as R01.
- R03 — repaired: `README.md:453–454` "(Arendt–Kreuter, Thm 4.2, p. 9, for outer maps that are Lipschitz and one-sided Gateaux differentiable, on bounded domains or with `g(0) = 0`)".

## Verified sound

| Target | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §5.4 `isSobolevMap_iff_exists_hasColocalWeakMFDeriv` | `u = \|t\|^{1/2}`, `p = 3/2` and `p = 2` | `∫_{−1}^{1}\|Du\|ᵖ = 2^{1−p}/(1−p/2)`: `2√2` at `p = 3/2`, both sides true; `∞` at `p = 2`, both false (colocal `Du` unique a.e.) | holds | — |
| same, degenerate dimensions | `dim E' = 0`; `dim E = 0` | discrete `N`: `u` locally constant, `Du = 0`, both true; `T_xM = 0`: `Du = 0` unique, both true for every `u` | holds | — |
| same, padding probe | `simp [IsSobolevMap, hu]`; `constructor <;> simp_all`; `exact?` | goals remain; `exact?` returns only the theorem itself | not padding | — |
| §2.1(b) locator, Arendt–Kreuter Thm 4.2 | `g = cos`, `u = 0`, `p = 2` | `‖cos∘u‖_{L²(ℝ)} = ∞`, so the source needs bounded `Ω` or `g(0) = 0`; `‖·‖_{L²(−R,R)} = √(2R)`; `sup\|g′\| = 1` gives Lipschitz and Gateaux | holds | — |
| §3.1 locator, CVS §1.1 p. 3 | `μ = eˣdx` vs Lebesgue `λ` on `ℝ` | `μ([0,1]) = e − 1`, `λ = 1`; `μ(ℚ) = λ(ℚ) = 0`; lines 147–150 give the result for each measure | holds | — |
| §3.2 locator, CVS §1.1 p. 3 | `\|x\|^{−1/3}`; charts `x = 2y`, `x = y³` | `∫_{−1}^{1}\|x\|^{−1/3} = 3`; chart `x = 2y`: `∫\|2y\|^{−1/3}dy = 3/2`; under `y³`: `\|y\|^{−1}`, not `L¹_loc`, excluded by line 133 | holds | — |
| §8.1 locator, HP §3 p. 7 | `B²₂ → T²` quotient after `z ↦ z²`; `β = dy₁∧dy₂`, `dy₁` | `\|f^*β\| = 4\|z\|² = ‖Df‖²`; `\|f^*dy₁\| = 2\|z\| ≤ ‖Df‖ = 2\|z\|` | holds | — |
| §10.1 locator, Hajłasz §1 p. 185 | `x/\|x\|` on `B² → S¹ ⊆ ℝ²` | `\|∇u\| = \|x\|^{−1}`, `∫_B\|x\|^{−p} = 2π/(2−p)` for `p < 2`, `∞` for `p ≥ 2`; `u(x) ∈ S¹` off `{0}` | holds | — |
| §5.2 (R01) | `id` of round `S² ⊆ ℝ³` | `‖Df‖ = 1`, Hilbert–Schmidt `\|∇ι\| = √2 = √(dim M)`; no locator at the head | locator missing | R01 |

The rows for statements this change leaves untouched stand as in the previous review, of `ed21777`.

- **Source locators checked (7):** ArendtKreuter2018 lines 338–345, 378–382; ConventVanSchaftingen2016 lines 128–153, 407–408; HeikkilaPankka2025 lines 322–342; Hajlasz2009 lines 20–28, 35–36.
- **Library declarations:** the new theorem uses only this file's definitions and Mathlib's `mfderiv` and `extChartAt`. It elaborates against Mathlib `1b1ccf4` and Tau Ceti `2fd255d`.
- **Cross-roadmap citations:** the open head of QuasiregularMaps cites §1.2, §3.1, §3.3, §4.2–§4.6, §5.3, §6.1–§6.3 and §7.1 here. The change renumbers none of them. The `*Needs:*` change at `README.md:1151` (§4.2–§4.8) points only backwards.
- **Gate:** rerun on `80ac39d`: every check 0, OK. `git diff --stat origin/main...HEAD` outside the folder is empty. Dependency check: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 28 `sorry` warnings (27 before, plus the new theorem) and nothing else. `#check @isSobolevMap_iff_exists_hasColocalWeakMFDeriv` keeps `FiniteDimensional ℝ E'`, `BorelSpace N`, `T2Space`, `SecondCountableTopology` of `M` and `N`, and both `IsManifold` binders. This matches `README.md:154–161` and §5.4.
- **Pull-request text:** the description's `Suggested.lean` paragraph states the new §5.4 comparison. Its not-statable list matches the docstring's change. Title and file list agree with the head.
- Overlap check: read QuasiregularMaps, YangMillsConnectionsAndCaloricGauge, SobolevDifferentialForms, Surfaces, RiemannianGeometry (open), and DifferentialGeometry, PseudoholomorphicCurveAnalysis, CalibratedGeometry (main). The changed object, the comparison of the colocal class with the continuous class (§5.4), is owned here; a search for "colocal" finds no other roadmap. The other shared objects keep the owners recorded at `ed21777`.

## Not verifiable

- None among the changed passages. Ziemer1989, Lee2012 and Rickman1993 remain settled as uncertified, and no changed passage rests on them.

## Source issues

- **Misprint** in ConventVanSchaftingen2016 at §1.1, definition of local integrability, p. 3: the source asks for a chart `ψ : V → ℝ^m` with `x ∈ M`; it should be `x ∈ V`; affects nothing.
