# Review of GeometricMeasureTheory (pull request #2581 at df9d9fa)

**Verdict:** accepted

**Summary.** Accepted: a second full pass found no false statement, no missing hypothesis and no supply problem. Every theorem, Check and worked example was recomputed, the eighteen source locators were read at their pages (Maggi's two only against its public contents), and `Suggested.lean` elaborates at the pins with fourteen `sorry` warnings and nothing else. There are three small corrections and one format note, none blocking; two of the corrections were already raised on this same head and stand unchanged. The human reviewers have three points: the licence of the Maggi extract, the prior formalisations the README names, and Tau Ceti results that landed after the pin.

## C01 — Four headline theorems cite no source: the perimeter bound of §5.4 and the three Jordan-curve theorems of §6.4

A reader who wants to compare the hypotheses of these statements with the literature has nothing to open, and they are among the deepest results stated. The bound `P(s; Ω) ≤ Hⁿ⁻¹(∂ᴹs ∩ Ω)` with its criterion (README §5.4, lines 752–765; `Suggested.lean` line 201) carries no locator; its criterion is the hard direction, a theorem of Federer's, and nothing in the four listed references is cited for it. In §6.4 (lines 899–909; `Suggested.lean` lines 266, 276, 285), Federer 1958, p. 450 is cited only for "finite perimeter exactly when … finite length"; that page does not give `P(Ω) = H¹(C)`, the index theorem or the normal `−σ J γ'`.

The smallest repair is a theorem-and-page locator at each claim and in the four docstrings, or, where the result is derived from this roadmap's own layers (as the route of §6.4 says for the perimeter equality and the normal), one clause saying that it is derived here and from which sections.

## C02 — The dimension-one sentence of §5.2 is true only for a suitably chosen `W`

Read as a statement about every such `W`, the sentence at lines 691–694 fails, so an implementer can formalise it wrongly: "agrees almost everywhere with `Ω ∩ W` for a union `W` of intervals whose endpoints in `Ω` form a locally finite subset of `Ω`, the reduced boundary of `s` in `Ω` is that set of endpoints".

Take `s = (0, 2)`, `Ω = ℝ`, `W = (0, 1) ∪ (1, 2)`. The endpoints are `{0, 1, 2}`, but `Dχ_s = δ_0 − δ_2` has no atom at `1` and the reduced boundary is `{0, 2}`. The Example at line 792 already carries the missing condition; inserting "with pairwise disjoint closures" after "a union `W` of intervals" makes the sentence true for every `W` it admits.

## C03 — The two De Giorgi statements in `Suggested.lean` hold without their hypotheses `hu` and `hfin`

`countablyRectifiable_reducedBoundary` (line 168) and `variationMeasure_indicator_eq_comap_restrict_reducedBoundary` (line 178) assume that `s` has locally finite perimeter in `Ω`, but at the pin both conclusions are trivially true when it does not: `TauCeti.reducedBoundary_eq_empty_of_not` (`Analysis/BoundedVariation/ReducedBoundary.lean`, line 171) makes the reduced boundary empty, and `TauCeti.variationMeasure` is `0` by its definition (`Analysis/BoundedVariation/VariationMeasure.lean`, lines 136–140), so the first is rectifiability of `∅` and the second reads `0 = 0`. The hypothesis `perimeter volume U s ≠ ⊤` is the library's `totalVariationOn … ≠ ∞` by `TauCeti.perimeter_def`.

Nothing is false, and the README statement with the hypothesis is the classical one. The docstring of the blow-up theorem (line 153) already says "no further hypothesis is needed" for the same reason; the two statements would either drop the hypotheses in the same way or say in their docstrings that they are kept for agreement with §5.3. Federer's theorem and the Gauss–Green formula need them and are right as they stand.

## N01 — Three links into this README from RiemannianGeometry on main will dangle

`TauCetiRoadmap/RiemannianGeometry/README.md` on main links the anchors `#g1--rectifiable-curves-and-arclength` (line 3026) and `#g3--distributional-bv-and-variation-measures` (lines 974 and 3008); the open revision of that roadmap in pull request #2578 keeps them. The table of former labels in Scope and ownership lets a reader follow, and the description says the links need updating. An explicit anchor on the two layer headings (`<a id="g1--rectifiable-curves-and-arclength"></a>`, likewise for `g3`) would keep the old links working without touching the other roadmap.

## Earlier findings

The previous review read this same head and raised no finding. Its two small corrections are unchanged, since the folder has not changed:

- Its C01 (four headline theorems without a locator): not repaired; "Federer 1958, p. 450" at line 906 is still the only citation in §6.4 and §5.4's bound still has none. Kept as C01.
- Its C02 (the dimension-one sentence, lines 691–694): not repaired. Kept as C02.

The repairs it recorded for the round before (locators at the claims, the tangential area formula stated at `Suggested.lean` lines 101 and 114, the 1983 Simon link, the G1–G6 table at lines 1009–1018, removal of the Mathlib pull-request and Zulip links) were confirmed again at this head.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §1.1 metric speed, arclength factorization | `γ = exp(2πiφ)`, `φ = (t + C)/2`; `γ` pausing on `[1, 2]` | `‖γ'‖ = 2π·½ = π`, `∫ = π` vs length `2π`; `s = γ`, `c(ℓ) = ℓ`, `γ' = s' = 0` on `(1, 2)` | holds; AC needed, as stated |
| §1 Examples, circle twice | `exp(it)` on `[0, 4π]` | multiplicity `2` off `z = 1`, `3` at `1`; length `4π = 2·2π` | holds |
| §2.1 `IsApproxTangentPlane`, `ae_existsUnique_…` (Lean) | `M = P`; two axes at `0`; `k = 0`, `M` locally finite; `k > dim E`; circle radius `ρ`; non-integrable blow-up | `r⁻ᵏ∫ = ∫_P φ`; blow-up `= M`; `Σφ((y−x)/r) → φ(0)`; `μHE[k] = 0`; `4ρ arcsin(r/2ρ)/(2r) → 1`; junk `0 ≠ ∫_P φ` | holds; Simon1983 lines 2256, 2285, 2298 |
| §2.1 uniqueness bullet | two `k`-planes with equal `∫_P φ` for all `φ` | supports of `Hᵏ⌊P`, `Hᵏ⌊P'` equal, so `P = P'`; no `k`-plane when `k > dim E` | holds for every `M`, `x` |
| §2.2 graphs | identity of `ℝ²` in `ℝ⁴`; `C¹` `φ : ℝⁿ → ℝ`; Lebesgue point of `Dφ` | `2 = √det(2I)` vs `√2`; `√(1+‖∇φ‖²)`, Simon1983 line 1855; weights `J(x+rz) → J(x)` in `L¹_loc` | holds |
| §2.3 tangential area formula (Lean) | unit circle, `f = x`; `ℝ × ℤ`, `g = 2^{−|m|}`; `k = 0`; `dim F < k`; arbitrary `L` off the a.e. set | `∫|sin θ| = 4 = 2·2`; `3 = 3`; `Σ_M g` both sides; `0 = 0`; integrand a.e. equal to the measurable `J^M f` | holds; Simon1983 lines 2575, 2606 |
| §2.4 coarea (Lean) | `f = ‖x‖` on ball `R`; `dim F = 0`; `dim F = dim E`; `f = |x|` on `ℝ` | `∫₀ᴿ nω_n r^{n−1} = ω_n Rⁿ`; normDet on zero space `1`, both `∫_s g`; area formula; `∫₀^∞(g(y)+g(−y)) = ∫g` | holds; Simon1983 lines 2618, 2632, 2640 |
| §3.1 vector-measure derivative | `1_{(0,∞)}`; `1_{(−∞,0)}`; `⟪a, x⟫` | `∫₀^∞ψ' = −ψ(0)`, `Du = δ₀`; `−δ₀`; `Du = a·vol`, `|Du| = ‖a‖|Ω|` | holds; Simon1983 line 1451 |
| §3.2 operations | `1_{(0,2)}`, `1_{(1,3)}`; `1_{(0,1)}`, `1_{(1,2)}`; unit ball dilated by `r` | `2 + 2 = 4`; `2 < 4`; variation `nω_n r^{1−n}`, `L¹` norm `ω_n r^{−n}` | holds |
| §3.3 one-dimensional BV | step function; `1_ℚ`; Mathlib `vectorMeasure_singleton` | `Du = Σ(cᵢ − cᵢ₋₁)δ_{aᵢ}`; `|Du| = 0` vs pointwise `∞`; atom `f(x⁺) − f(x⁻)` | holds; sign agrees with §3.1 |
| §3.4 Cantor–Lebesgue | `C(1/3)`, `C(2/3)`; `DC([1/3, 2/3])`; `∫_ℝ C` | `½`, `½`; `0`; `∞`, so not in `BV(ℝ)` | holds |
| §4.1 strict approximation (Lean) | `1 + sin(jx)/j` on `(0,1)`; `sin(1/x)`; `Ω = ∅` | variation `→ 2/π ≠ 0`; `∞` forced by lower semicontinuity; trivial | holds; AnzellottiGiaquinta1978 line 65 (finite case) |
| §4.2 compactness | `sin(jπx)` on `(0,1)`; `1_{(j,j+1)}` on `(0,∞)` | variation `jπ·2/π = 2j`, `L¹` norm `2/π`; BV norm `1 + 2 = 3`, no `L¹` limit | both hypotheses needed; Simon1983 line 1516 |
| §4.3 regular levels | `‖x‖²`, `t = r²`; `x²`, `t = 0`, `n = 1` | `P = nω_n r^{n−1}`, `ν = −x/‖x‖`; `P = 0` vs `H⁰{0} = 1` | holds; Simon1983 line 2707 |
| §5.1 approximation, truncation | coarea level selection on `(δ, 1−δ)`; `(0,1)²`, `r = ½` | `P ≤ |Du_j|/(1−2δ)`, symmetric difference `≤ ‖u_j − χ‖/δ`; `1 + π/4` both sides | holds; Maggi2012 line 80 (contents only) |
| §5.2 blow-up (Lean) | unit ball at `e₁`; `{y₂ > 0}`; `(0,∞) ⊆ ℝ`; square corner; `dim E = 0` | limit `{y₁ < 0}`; `ν = −e₂`, half-space `= s`; `ν = −1`, `{y > 0}`; density `¼`; `∂*s = ∅` | holds; Simon1983 line 2734 |
| §5.2 dimension one (C02) | `s = (0,2)`, `W = (0,1) ∪ (1,2)` | endpoints `{0,1,2}` vs reduced boundary `{0,2}` | needs disjoint closures |
| §5.3 De Giorgi (Lean, two theorems; C03) | ball; `(0,1) ∪ (2,3)`; `dim E = 0, 1`; raw `μH[2]`; `s` not of locally finite perimeter | `nω_n r^{n−1}` both; counting measure, `4`; countable set is `0`-rectifiable; `16` vs `4π`; `∅` rectifiable, `0 = 0` | holds; hypotheses redundant |
| §5.4 Federer, perimeter bound (Lean) | ball ∪ `ℚⁿ`; `⋃(1/(2k+1), 1/(2k))` in `(0,1)`; `dim E = 0`; `(−1,1)∖{0}` | `P = nω_n = H(∂ᴹ) < H(frontier) = ∞`; `∞ = H⁰(endpoints)`; `0 ≤ 0`; `2 = 2 < 3` | holds; Maggi2012 lines 88, 580–585; bound unsourced (C01) |
| §6.1 Gauss–Green (Lean) and extension | ball `R`, `φ = x`; `(0,1) ⊆ ℝ`; exterior, `φ = x/‖x‖ⁿ`; cutoff `η(x/R)` | `nω_n Rⁿ` both; `φ(1) − φ(0)` both; `0` vs `−nω_n`; error `≤ (C/R)∫_s‖φ‖` or `(C/R)‖φ‖_∞|s|` | holds; Simon1983 lines 2704, 2720 |
| §6.2 Lipschitz domains | `{t > |y|}`; unit cube | `ν = (−1, sign y)/√2`, outward; `P = 2n` | holds; AnzellottiGiaquinta1978 line 120 |
| §6.3 BV trace (Lean) and bullets | `u = 1`; `1_{B_{1/2}}` in `B₁`; gluing `(−1,0)`, `(0,1)`; general gluing; slit disc | divergence theorem, `D(1_Ω) = −νH`; trace `0`; jump `1`; `Ω = Ω₁ ∪ Ω₂ ∪ Γ`, `ν₁ = −ν₂` a.e. on `Γ`; limits `0`, `2π` | holds; AnzellottiGiaquinta1978 lines 256, 315, 326 |
| §6.4 index theorem (Lean) | both circles; Cantor-reparametrized circle; `z` on the trace | `σ = 1`, `−1`; index integral `(2πi)⁻¹·πi = ½`; statement quantifies off the trace only | holds; AC needed |
| §6.4 perimeter, normal (Lean) | both circles; square `0, 1, 1+i, i`; `green_ac_flux` sign; Koch curve | `−σiγ' = γ` (outward) for both; `−i` on bottom edge; `Dχ·(X,Y) = iγ'·(X,Y)`; `H¹ = ∞` excluded | holds; Federer1958 line 144 for finiteness only (C01) |

- Source locators: 16 of the README's 18 read at their printed pages. Simon1983 (12): lines 1451, 1516, 1855, 2256, 2285, 2298, 2523–2640, 2707, 2720, 2734. AnzellottiGiaquinta1978 (3): lines 65, 120, 256, 315, 326. Federer1958 (1): lines 17–23, 142–144. Maggi2012 (2): contents and synopsis only, lines 80, 88, 580–585.
- Library declarations opened at the pins (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`): `ReducedBoundary.lean`:95, 106, 171; `VariationMeasure.lean`:136, 212; `TotalVariation.lean`:100; `Perimeter.lean`:64; `Space.lean`:47; `EssentialBoundary.lean`:81, 143; `Rectifiable/Basic.lean`:44; `LowerDensityEstimates.lean`:281; `FilledHull.lean`:99; `JordanCurve/Basic.lean`:107; `Winding/Number/Basic.lean`:76; `Green/IndexOne.lean`:65; `LipschitzDomain/Basic.lean`:482; Mathlib `Covering/Besicovitch.lean`:1077, `VectorMeasure/BoundedVariation.lean`:139, 386. About two dozen further supplier names were confirmed to exist by search.
- None of the 14 theorems is at the pin, by name or by object.
- Cross-roadmap citations resolved on main, all present: PDE §1.1–§1.3, §1.5, §1.6 (lines 677–905); ConformalMapping §5.3, §5.6; ContourIntegration Layer 0; DifferentialGeometry 5.6.1, 5.6.3, 12.5 and its section on rectifiable curves; Isoperimetry I3.
- Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`. No change outside the folder. The automatic checks all passed.
- Elaboration of `Suggested.lean`: 14 `sorry` warnings, nothing else. `#check @` on all 16 declarations agrees with the README; `IsApproxTangentPlane` drops `[FiniteDimensional ℝ E]`, which its body does not use.
- One-tactic probe (`first | rfl | simp | infer_instance | exact?`) fails on all 14 theorems: no padding. Every headline of the README summary is stated; none is declared unstatable.
- Description against the head: 11 conventions, 20 numbered sections, 49 Checks, 4 references, 3 anchored links from RiemannianGeometry and the list of 14 stated theorems all match; no sentence is contradicted.

Overlap check: read Isoperimetry (main and its open revision #2597), GaussianIsoperimetryAndClusters (main), Varifolds (main), GeometricCurrents (main and #2490), PDE (main and #1614), DifferentialGeometry and RiemannianGeometry (main). Approximate tangent planes, the tangential area formula, the Euclidean Lipschitz coarea formula, De Giorgi's and Federer's theorems, BV traces and the AC Jordan index theorem: this roadmap, imported by the others by label. Coarea on rectifiable sets: GeometricCurrents. Signed area as `σ` times area: Isoperimetry I3. Divergence theorem on manifolds: DifferentialGeometry 12.5. Sobolev trace and Lipschitz domains: PDE §1.6. Nothing has two owners; no declaration name of `Suggested.lean` occurs in another roadmap's Lean file.

Source independence: 24 passages compared with 4 sources (the 16 locators read, Maggi2012's 2 against its synopsis, Conventions 6–8, the routes of §5.3 and §6.4, two docstrings), plus a six-word scan of both files against the four texts, which finds only titles and stock phrases such as "set of locally finite perimeter in"; none shared. Largest share Simon1983, 12 of 18 locators; contents compared with Simon1983 (lines 42–58): independent — Layer 1 has no counterpart, Layer 2 (§§8, 10–12) precedes Layer 3 (§6), Layer 4 and §§6.3–6.4 have none.

Research link: Layers 2 and 5 are the rectifiability, area–coarea and De Giorgi–Federer structure theory of Simon 1983 (§§11–14) and Maggi 2012 (Chapters 15–16, per its contents), on which the varifold and regularity theory of the same texts is built; §6.3 is Anzellotti–Giaquinta 1978. Rests on the README and the texts read.

## Not verifiable

- Maggi2012 §13.2, p. 150 and Chapter 16, pp. 183–184: only the author's extract (contents, synopses, references, index) is legally readable, so section, chapter, page and subject were confirmed, not the theorem statements.
- Simon1983 Theorem 3.2(2), behind the constant `2^{n−1}` in the route of §5.3: the scan loses its conclusion (Simon1983 lines 622–624). A route detail, not a stated result.

Automatic checks set aside as false positives: none failed.

## Source issues

- none

## For the human reviewers

- Licence: the Maggi2012 extract was read from the CVGMT server of the Scuola Normale Superiore, linked in the README's References (line 1449); classed here as an institutional copy.
- Licence: the References (lines 1461–1468) name prior formalisations (MovingSofa, a Hugging Face problem archive, hojonathanho/isoperimetric and its LeanPool copy, kim-em/isoperimetric). The declarations of `Suggested.lean` were not compared with them.
- Not tested: Maggi2012's statements at §13.2 and Chapter 16 could not be read; wording and hypotheses were not compared with it. Simon1983, the source with the largest share, was read in full where cited.
- Fact: the folder's generated `STATUS.md` reports strict approximation on open sets, Lipschitz coarea, the blow-up theorem and the AC Jordan index as landed in Tau Ceti after the pinned `2fd255d`; at a later pin those four statements of `Suggested.lean` would restate library theorems.
