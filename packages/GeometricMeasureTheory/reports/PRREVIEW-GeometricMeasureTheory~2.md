# Review of GeometricMeasureTheory (pull request #2581 at df9d9fa)

**Verdict:** accepted

**Summary.** Accepted. I found no false statement, missing hypothesis or supply problem. All eighteen source locators in the README match their texts (Maggi's two only as far as its public contents go), every Check and worked example recomputes correctly, the sixteen declarations of `Suggested.lean` elaborate at the pins with only `sorry` warnings and say what the README says, and the dependency check is clean. The previous round's five remarks are repaired, except that four headline theorems still cite no source (C01); there is one further small correction (C02) and no format note, and none of this blocks. The human reviewers have three points: the licence of the Maggi extract, the prior formalisations the README names, and Tau Ceti results that landed after the pin.

## C01 — Four headline theorems still cite no source: the perimeter bound of §5.4 and the three Jordan-curve theorems of §6.4

A reader who wants to check the hypotheses of these statements against the literature has nothing to open, although they are among the deepest results in the file. The eighteen locators the README now carries all check out. Two places still lack one:

- The bound `P(s; Ω) ≤ Hⁿ⁻¹(∂ᴹs ∩ Ω)` and its criterion (README §5.4, lines 752–765; `Suggested.lean` line 197) cite nothing.
- In §6.4 (lines 899–909; `Suggested.lean` lines 262, 274 and 280), Federer 1958, p. 450 is cited only for "finite perimeter exactly when finite length". Nothing is cited for `P(Ω) = H¹(C)`, the index theorem or the normal `−σJγ'`.

Sections 1.1, 3.2, 3.3 and 3.4 also cite nothing.

The smallest repair is a theorem-and-page locator at each of these claims and in the four docstrings. Where the README derives a result from its own layers, one clause saying so would do instead. That is the case for §6.4, whose route runs through Layer 1, De Giorgi's theorem (§5.3) and §6.1.

## C02 — The dimension-one paragraph of §5.2 needs the intervals of `W` to have pairwise disjoint closures

An implementer who formalises the sentence as written can pick a representation for which it fails. The sentence (lines 691–694) says that `s ∩ Ω` "agrees almost everywhere with `Ω ∩ W` for a union `W` of intervals whose endpoints in `Ω` form a locally finite subset of `Ω`, the reduced boundary of `s` in `Ω` is that set of endpoints".

Take `s = (0, 2)` and `Ω = ℝ`. Then `W = (0, 1) ∪ (1, 2)` meets the first condition and its endpoints are `{0, 1, 2}`. But `Dχ_s = δ_0 − δ_2` has no atom at `1`, so the reduced boundary is `{0, 2}`. The Example at line 792 already states the condition. Adding "with pairwise disjoint closures" after "a union `W` of intervals" makes the sentence true for every such `W`.

## Earlier findings

- R01 (no target had a locator): partly repaired. Eighteen locators now stand at the claims, for example "(Simon 1983, Definition 11.2, p. 60)" at line 216. Four headline theorems still have none (C01).
- R02 (tangential area formula said to be unstatable): repaired. The predicate `IsTangentialDifferential` and the theorem `lintegral_normDet_mul_eq_lintegral_tsum_of_isTangentialDifferential` are at `Suggested.lean` lines 101 and 114, and §2.3 names both. The module docstring no longer lists an unstatable headline.
- C01 (Simon link): repaired. The References link the 1983 ANU copy (line 1451).
- C02 (former G-labels): repaired. The table at lines 1009–1018 maps G1–G6 to Layers 1–6.
- N01 (Mathlib pull-request and Zulip links): repaired. Convention 12 and those links are gone.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §1.1 metric speed, arclength FTC | `γ = exp(2πiφ)`, `φ = (t + C)/2`; `γ` pausing on `[1, 2]` | `‖γ'‖ = π` a.e., `∫ = π` vs length `2π`; `s = γ`, `c(ℓ) = ℓ`, `γ' = s' = 0` on `(1, 2)` | holds; AC needed for the FTC, as stated |
| §2.1 `IsApproxTangentPlane`, `ae_existsUnique_…` | `M` a `k`-plane; two axes at `0`; `k = 0`, `M` locally finite; `k > dim E`; circle radius `ρ` | `r⁻ᵏ∫ = ∫_P φ` for every `r`; blow-up `= M`, no line; `Σφ((y−x)/r) → φ(0)`; `μHE[k] = 0`; `4ρ arcsin(r/2ρ)/(2r) → 1` | holds; Simon1983 line 2256 by change of variable, line 2298 |
| §2.2 graphs | identity of `ℝ²` into `ℝ⁴`; `C¹` `φ : ℝ → ℝ` | normDet `2 = √det(2I)` vs `√2` from `√(1+‖A‖²)`; `√(1+φ'²)`, Simon1983 line 1855 | holds |
| §2.3 tangential area formula (Lean) | unit circle, `f = x`; `ℝ × ℤ`, `g = 2^{−|m|}` on `[0,1]`; `dim F < k` | `∫|sin θ| = 4 = ∫₋₁¹ 2`; `3 = 3`; `0 = 0` (normDet of non-injective map, `μHE[k]` on `F`) | holds; Simon1983 lines 2575, 2606 |
| §2.4 coarea (Lean) | `f = ‖x‖` on ball `R`; `dim F = 0`; `f = |x|` on `ℝ` | `∫₀ᴿ nω_n r^{n−1} = ω_n Rⁿ`; normDet on zero space `1`, both `∫_s g`; `∫₀^∞ (g(y)+g(−y)) = ∫ g` | holds; Simon1983 lines 2618, 2632 |
| §3.3 one-dimensional BV | step function; `1_ℚ`; Mathlib `BoundedVariationOn.vectorMeasure_Ioc` | `Du = Σ(cᵢ − cᵢ₋₁)δ_{aᵢ}`; `|Du| = 0` vs pointwise `∞`; `(a, b] ↦ f(b+) − f(a+)` | holds; sign agrees with §3.1 |
| §3.4 Cantor–Lebesgue | `C(1/3)`, `C(2/3)`; `DC([1/3, 2/3])`; `∫_ℝ C` | `1/2`, `1/2`; `1/2 − 1/2 = 0`; `∞`, not in `BV(ℝ)` | holds |
| §4.1 strict approximation (Lean) | `u = 1` on `(0,1)`, `u_j = 1 + sin(jx)/j`; `sin(1/x)`; `Ω = ∅` | variation `→ 2/π ≠ 0`; `∞` forced by lower semicontinuity; trivial | holds; AnzellottiGiaquinta1978 line 65 for the finite case |
| §4.2 compactness | `sin(jπx)` on `(0,1)`; `1_{(j,j+1)}` on `(0,∞)` | variation `2j`, `L¹` norm `2/π`; BV norm `3`, no `L¹` limit | both hypotheses needed; Simon1983 line 1516 local |
| §4.3 regular levels | `‖x‖²`, `t = r²`; `x²`, `t = 0`, `n = 1` | `P = nω_n r^{n−1}`, `ν = −x/‖x‖` into ball; `P = 0` vs `H⁰{0} = 1` | holds; Simon1983 line 2707, inner normal |
| §5.1 truncation | `(0,1)²`, `x₀ = 0`, `r = 1/2` | `1 + π/4` on both sides | equality |
| §5.2 blow-up (Lean) | unit ball at `e₁`; `{y₂ > 0}`; square corner; `dim E = 0` | limit `{y₁ < 0}`; `ν = −e₂`, half-space is `s`; density `1/4`, not reduced; `∂*s = ∅` | holds; Simon1983 line 2734 |
| §5.2 dimension one (C02) | `s = (0,2)`, `W = (0,1) ∪ (1,2)` | endpoints `{0,1,2}` vs reduced boundary `{0,2}` | needs disjoint closures (C02) |
| §5.3 De Giorgi (Lean, two theorems) | ball radius `r`; `(0,1) ∪ (2,3)` in `ℝ`; `dim E = 0`; raw `μH[2]` | `nω_n r^{n−1}` both; counting measure, total `4`; `0 = 0`; `16` vs `4π` | holds; Simon1983 line 2720 |
| §5.4 Federer, perimeter bound (Lean) | ball ∪ `ℚⁿ`; `⋃(1/(2k+1), 1/(2k))` in `(0,1)`; `dim E = 0` | `P = nω_n = H(∂ᴹ) < H(frontier) = ∞`; `∞ = H⁰(endpoints)`; `∂ᴹ = ∅` | holds; bound unsourced (C01) |
| §6.1 Gauss–Green (Lean) | ball `R`, `φ = x`; exterior, `φ = x/‖x‖ⁿ` | `nω_n Rⁿ` both sides; `0` vs `−nω_n` without the extension's hypotheses | holds; Simon1983 line 2704 |
| §6.2 Lipschitz domains | `{t > |y|}`; unit cube | `ν = (−1, sign y)/√2`, outward; `P = 2n` | holds; AnzellottiGiaquinta1978 line 120 |
| §6.3 BV trace (Lean) | `u = 1`; `1_{B_{1/2}}` in `B₁`; `(−1,0)`, `(0,1)` glued; slit disc | divergence theorem, `D(1_Ω) = −νH`; trace `0`; jump `1 = |g₁ − g₂|`; limits `0`, `2π` | holds; AnzellottiGiaquinta1978 lines 256, 315, 326 |
| §6.4 index theorem (Lean) | counterclockwise and clockwise circle; Cantor-reparametrized circle | `σ = 1`, `−1`; index integral `1/2 ≠ ±1` | holds; AC needed |
| §6.4 perimeter, normal (Lean) | unit circle; square `0, 1, 1+i, i`; Koch curve | `−σiγ' = e^{it}`, `P = 2π = H¹`; `−i` on bottom edge; `H¹ = ∞` excluded | holds; equality unsourced (C01) |

- Source locators: 16 of the README's 18 were read at their pages. Simon1983 (12): lines 1451, 1516, 1855, 2256, 2285, 2298, 2523–2640, 2707, 2720, 2734. AnzellottiGiaquinta1978 (3): lines 65, 120, 256, 315, 326. Federer1958 (1): line 144. Maggi2012's 2 were checked against its contents and synopsis, lines 80, 88, 580–585. The 13 docstring locators of `Suggested.lean` repeat these.
- Library declarations opened at the pin (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`):
  - Tau Ceti: `ReducedBoundary.lean`:95, 106, 171; `CutByBall.lean`:228; `Volume/Polar.lean`:333; `LowerDensityEstimates.lean`:281; `EssentialBoundary.lean`:81, 143; `LipschitzDomain/Basic.lean`:482; `Winding/Number/Basic.lean`:76, 170; `PrincipalValue/Basic.lean`:161; `FilledHull.lean`:99; `JordanCurve/Basic.lean`:107; `Green/IndexOne.lean`:65.
  - Mathlib: `VectorMeasure/BoundedVariation.lean`:119, 123, 139.
- None of the 14 theorems is at the pin, searched by name and by object. The later Tau Ceti results named in the roadmap's status file (strict approximation on open sets, Lipschitz coarea, blow-up, the AC Jordan index) are absent at `2fd255d`.
- Cross-roadmap citations resolved on main, all present: PDE §1.1–§1.3, §1.5, §1.6; ConformalMapping §5.3, §5.5, §5.6; ContourIntegration Layer 0; DifferentialGeometry 5.6.1, 5.6.3, 12.5; Isoperimetry I3. The eleven downstream consumers named in the README exist on main and cite this roadmap.
- Automatic checks all passed. The dependency check prints `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`. DifferentialGeometry and this roadmap cite each other, but there is no section-level cycle. DifferentialGeometry consumes Layers 1–2 here. This roadmap consumes its 5.6.1 and 5.6.3 through pinned declarations, and its 12.5 only for the comparison in §6.2.
- Elaboration of `Suggested.lean` gives 14 `sorry` warnings and nothing else. A `#check @` run on all 16 declarations in one probe file gives types that agree with the README. `IsApproxTangentPlane` drops `[FiniteDimensional ℝ E]`, which its body does not use.
- The one-tactic probe (`first | simp | rfl | infer_instance | aesop`) fails on all 14 theorems, so none is padding.
- A 6-word scan of the README and `Suggested.lean` against the four cached texts finds only titles and stock phrases ("set of locally finite perimeter in").

Overlap check: read GaussianIsoperimetryAndClusters (main and its #2578 head), Varifolds (main and #2578 head), GeometricCurrents (main and #2490 head), Isoperimetry, PDE (main and #1614 head), RiemannianGeometry/Surfaces, DifferentialGeometry and ConformalMapping. Shared objects and their owners:

- approximate tangent planes of rectifiable sets and the tangential area formula: this roadmap. Varifolds 2.1 owns tangent spaces of measures.
- the Euclidean Lipschitz coarea formula: this roadmap. GeometricCurrents owns coarea on rectifiable sets.
- De Giorgi's theorem, the blow-up theorem and Federer's theorem: this roadmap. GaussianIsoperimetryAndClusters imports them for its weighted forms.
- the AC Jordan index theorem: this roadmap, §6.4. ConformalMapping §5.6 owns the continuous and piecewise-`C¹` cases. ConformalMapping §5.5 attributes the AC comparison to DifferentialGeometry 5.6.1, which does not plan it.
- signed area as `σ` times area: Isoperimetry I3.
- the divergence theorem on manifolds: DifferentialGeometry 12.5.

No object has two owners.

Source independence: 23 passages compared with 4 sources, none shared beyond titles and stock phrases. The passages are the 16 locators read at their pages, Maggi2012's 2 against its synopsis, Conventions 6–7, the §5.3 and §6.4 routes, and the docstrings of the coarea formula and `IsTangentialDifferential`, plus a 6-word scan of both files. Largest share: Simon1983, 12 of 18 README locators. Contents compared with Simon1983's contents (lines 39–110): independent. Layer 1 has no Simon chapter. Layer 2 (Simon §§8, 10–12) precedes Layer 3 (Simon §6), the reverse of Simon's order. Layers 5–6 correspond to parts of §14. Layer 4 and §§6.3–6.4 have no Simon counterpart.

Research link: Layers 2 and 5 are the rectifiability, area–coarea and De Giorgi–Federer structure theory (Simon1983 §§11–14; Maggi2012 Chapters 15–16, per its contents). The varifold and minimizing-hypersurface regularity theory of the same texts (Simon1983 Chapters 4–7; Maggi2012 Part III) is built on it, and Varifolds and GeometricCurrents consume it. This rests on the README and the texts read.

## Not verifiable

- Maggi2012 (Cambridge University Press, DOI 10.1017/CBO9781139108133): only the author's extract on CVGMT is legally readable (contents, synopses, references, index). So §13.2, p. 150 and Chapter 16, pp. 183–184 were confirmed as section, chapter and subject, but not as theorem statements.
- Simon1983 Theorem 3.2(2), behind the constant `2^{n−1}` in the §5.3 route: the OCR loses its conclusion (Simon1983 lines 622–624). It is a route detail, not a stated result.

Automatic checks set aside as false positives: none failed. Separately, the list of the file's declarations counts the word "theorem," in the module docstring (`Suggested.lean` line 25) as a declaration.

## Source issues

- none

## For the human reviewers

- Licence: the Maggi2012 extract (front matter, contents, synopses, index) was read from the CVGMT server of the Scuola Normale, which the README links (References, line 1449). I classed it as an institutional copy.
- Licence: References (lines 1461–1468) name prior formalisations: MovingSofa, a Hugging Face problem archive, hojonathanho/isoperimetric with its LeanPool copy, and kim-em/isoperimetric. The declarations of `Suggested.lean` were not compared with them.
- Fact: the roadmap's generated `STATUS.md` (Tau Ceti `aa6e43e`) reports results that landed after the pinned `2fd255d`: strict approximation on open sets, Lipschitz coarea, the blow-up theorem and the AC Jordan index. At a later pin, the matching `Suggested.lean` statements would restate library theorems.
