# Review of SobolevMapsBetweenManifolds (pull request #2230 at b0fd271)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: `README.md:1054–1057` "Convent–Van Schaftingen (§1.1, p. 3, and Def. 2.1, p. 8) define the homogeneous class `Ẇ^{1,p}(M, N)` of colocally weakly differentiable maps … for finite-dimensional, Hausdorff, second-countable Riemannian manifolds `M`, `N`, `p < ∞`".

## Verified sound

| Target | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §2.3 oscillation bound, exponent `1 − n/p` | `n = p = 1`, `u(z) = z`, symmetric `ρ`; `n = p = 2`, `u = z₁`; `n = 1`, `p = 2`, `u(z) = z` | LHS `ε/2`, RHS `C·2ε`; LHS `4ε/(3π)`, RHS `C·√π ε`, ratio ≈ `0.24`; LHS `ε/2`, RHS `C·√2 ε`. All ratios ε-free | holds; the exponent `1 − p/n` would give ratio `∝ ε^{3/2}` | — |
| §2.3 locator, Hajłasz (2.1), p. 188 (new setting) | page markers; hypotheses (Hajlasz2009 lines 128–175) | page 188 = lines 128–184; `u ∈ W^{1,n}(Bⁿ(0,1), N)`, `N ⊂ ℝ^ν`, balls `Bⁿ(x,ε)`; source's `Lⁿ` mean bounds README's `L¹` mean | "`ℝ^ν`-valued maps on balls of `ℝⁿ`", `p = n` match | — |
| §5.2 locator, CVS §1.1 and Def. 2.1 (R01) | `N = ℓ²`; `id` of round `S²`; `dim M = 0` | ℓ²: excluded (finite dimensions `m`, `n`, lines 128–130, page 3 = lines 100–156); `1 ≤ √2 ≤ √2`; `0 ≤ 0 ≤ 0` | setting now within the source's; Def. 2.1 at line 407, page 8 | — |
| §9.1 Nash citation, Hajłasz §1, p. 185 | `M = [0,1]`, `N = S¹`, `p = 2`; `p = ∞`; `M = ℝ` | lines 20–28: compact Riemannian `M`, `N`, `1 ≤ p < ∞`, `∂N = ∅`: covered; excluded; excluded | "compact `M`, `N` and `p < ∞`" matches | — |
| §9.1 Nash citation, Heikkilä–Pankka Prop. B.1 | `M = N = S²`, `p = ∞`; `p = 2` | lines 1247–1251 (p. 23), 1328–1329 (p. 24): closed oriented PL Riemannian `n`-manifolds, `n ≥ 2`, `W^{1,∞}` via Nash; `p = 2` not used | "closed `n`-manifolds and `p = ∞`" matches | — |
| `isSobolevMap_iff_memW1pLocM_comp_immersion` (docstring changed) | `ι = id_ℝ`; `ι : S¹ → ℝ²`, `φ(t) = \|t\|^{1/2}`, `p = 1, 2` | identical sides; `‖Df‖ = ‖D(ι∘f)‖ = 1/(2\|t\|^{1/2})`: both in `L¹_loc`, both outside `L²_loc` | iff holds; docstring sources cover `[1,∞)` and `{∞}`, closed ⇒ compact | — |

The rows for statements this change leaves untouched stand as in the previous review, of `e23a66d`.

- **Source locators checked (5 passages):** Hajlasz2009 lines 4–32 and 128–184; ConventVanSchaftingen2016 lines 100–156 and 392–414; HeikkilaPankka2025 lines 1232–1339.
- **Library declarations:** the Lean change is a docstring only. The elaborated type of `isSobolevMap_iff_memW1pLocM_comp_immersion` is unchanged: `[CompleteSpace E'] [CompleteSpace E'']`, `ContMDiff … 1 ι`, `IsImmersionAt` at every `y`, `Continuous f`. No `1 ≤ p` hypothesis, as before; the convention is at `README.md:139`.
- **Cross-roadmap citations:** QuasiregularMaps (open head, README:943) cites §5.1–§5.2. The change renumbers no heading, and no roadmap cites §2.3 or §9.1.
- **Gate:** rerun on `b0fd271`: every check 0, OK. `git diff --stat origin/main...HEAD` outside the folder is empty. Dependency check: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`.
- **Elaboration:** `lake env lean` on `Suggested.lean`: 28 `sorry` warnings and nothing else.
- **Pull-request text:** the title and description agree with this head. The new locators are in Hajłasz and in the arXiv numbering of Convent–Van Schaftingen and Heikkilä–Pankka, and the description already declares that numbering. Nothing was removed, renumbered or added as a supplier.
- Overlap check: read QuasiregularMaps (its scope section), YangMillsConnectionsAndCaloricGauge, SobolevDifferentialForms, Surfaces, RiemannianGeometry (open), and DifferentialGeometry, CalibratedGeometry, PseudoholomorphicCurveAnalysis (main), together with a search for the Nash-embedding class. The changed passages add no object. QuasiregularMaps owns the quasiregularity of PL maps, and §9.1 cites only the Nash-embedding Sobolev class used in that proof. Nothing is shared.

## Not verifiable

- None among the changed passages. Ziemer1989, Lee2012, Rickman1993, Mazya2011 and Bethuel1991 remain settled as uncertified, and the change rests on none of them.

## Source issues

- **Misprint** in Hajlasz2009 at (2.1), p. 188: the middle bound has the factor `C r`, but no `r` is defined there; it should be `C ε`, the ball radius, which is what makes the equality with `C′ (∫ |∇u|ⁿ)^{1/n}` hold; affects nothing.
- **Misprint** in HeikkilaPankka2025 at the proof of Prop. B.1, p. 24: the source writes the composite of the Nash embedding with the map as `p ∘ ι`; it should be `ι ∘ p`, since `p : M → N` and `ι : N → ℝ^m`; affects nothing.
- **Misprint** in ConventVanSchaftingen2016 at §2, definition of the operator norm, p. 8: the source takes the supremum over `e ∈ T_yN` with `|e|_{g_N} ≤ 1`; it should be over `e ∈ T_xM` with `|e|_{g_M} ≤ 1`; affects nothing.
