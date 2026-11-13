# Review of MixedHodgeModulesAndIrregularHodgeTheory (pull request #2279 at 2ecdd81)

**Verdict:** needs changes

## R01 (P2) — Layers 8–11 follow FSY Appendix A.4–A.7 section for section

**Location:** `TauCetiRoadmap/MixedHodgeModulesAndIrregularHodgeTheory/README.md` lines 833, 872, 951, 983: "## Layer 8: Classical mixed Hodge structures inside exponential ones" … "## Layer 11: Fourier cohomology, costalks and weights at infinity".

**Claim:** Four consecutive layers map one to one and in order onto four consecutive sections of the source cited most (FSY, 40 of 171 locators). Layers 8 and 10 have exactly the scope of A.4 and A.6 and cite FSY alone; Layers 9 and 11 are A.5 and A.7 with 9.3 (Yu) and 11.5–11.6 (MT) added.

**Witness:** `Layer 8 ↔ A.4`, `Layer 9 ↔ A.5`, `Layer 10 ↔ A.6`, `Layer 11 (11.1–11.4) ↔ A.7` (FSY lines 48–51, 2961, 2996, 3086, 3226); inside Layer 9, 9.1, 9.2, 9.4, 9.5, 9.6 follow A.15–A.23 in order.

**Repair:** The order is forced (9.1 *Needs* 8.1; 10.1 *Needs* 9.1, 9.2, 9.5, 8.1, 8.2; 11.1 *Needs* 10.1); the layer scopes are not. Move 8.1 to the end of Layer 6 (its *Needs* are 6.2–6.4, 6.6, 2.2, 4.7, 5.1, 5.3, 5.6) and 8.2 to the end of Layer 7 (its *Needs* are 8.1, 7.1, 7.6, 4.1, 5.3); move 10.1–10.2 to the end of Layer 9 as the classicality theorems of pair cohomology (their *Needs* stop at Layer 9); keep Layer 11. Extend the former-numbering map (C → §§6.7, 7.7; G → §§9.7–9.8) and the consumer bullets. Add to 8.1 the locator KS, §4.2, paragraph after Definition 7, p. 31 (KS line 1115), and to 10.2 the locator Yu, Theorem 3.3 and Corollary 3.4, pp. 23–24 (Yu lines 1249, 1283).

## R02 (P2) — The declared gaps and the README's supplier contracts disagree

**Location:** `TauCetiRoadmap/MixedHodgeModulesAndIrregularHodgeTheory/README.md` lines 88, 148, 82 and 130: "What ComplexComparisonPartII must provide (gap:rational-complex-local-system-dictionary)", "What GroebnerGeometry must provide (gap:normal-semigroup-cohen-macaulay)", and the contracts of `regular-holonomic-stability` and `blowup-exceptional-divisor`.

**Claim:** The README states seven gaps; the plan's `gaps` list as the board holds it declares five. The two absent ones (needed by 3.1 and 12.5) are announced to no supplier, and neither supplier states the result. For two of the five, the declared `needs` is wider than the README's and asks for what a named supplier already provides.

**Witness:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/design/plan.json` `gaps`: five slugs, neither of the two. Its `blowup-exceptional-divisor` asks for `E = P(N_{Z/X})` and `O_X̃(−E)|_E = O_E(1)`, which SchemeKTheoryOperations §5.7 states; its `regular-holonomic-stability` lists duality, which SpringerResolutionAndCharacteristicCycles §9.7 proves.

**Repair:** Bring `design/plan.json` `gaps` to the README: add `rational-complex-local-system-dictionary` (ComplexComparisonPartII §C6.1, `needs` = README line 88) and `normal-semigroup-cohen-macaulay` (GroebnerGeometry §G2, `needs` = first sentence of line 148); replace the `needs` of `blowup-exceptional-divisor` by line 130 and drop "duality" from that of `regular-holonomic-stability`. An earlier package review reports seven matching slugs; if a later plan exists, publish that one to the board.

## R03 (P3) — Supplier contracts that no target consumes, and one consumed section missing from its Needs

**Location:** `README.md` lines 34 and 128: "The nonsingular projective model of a curve and the expansion at a rational place are AlgebraicCurves Layers 9 and 12"; "§3.3 (degrees and Riemann–Roch for vector bundles on curves)".

**Claim:** AlgebraicCurves Layers 9 and 12, SchemeAndStackFoundations §3.3 and SpringerResolutionAndCharacteristicCycles §§8.5 and 9.5 are listed as consumed, but no `*Needs:*` line names them. Conversely 12.1 uses SchemeAndStackFoundations §4.17 in its statement and its `*Needs:*` omits it.

**Witness:** "AlgebraicCurves" occurs only at README lines 34, 126, 128; "SchemeAndStackFoundations … 3.3" only at lines 34, 128; "8.5" only at lines 24, 78; §4.17 at line 1068, while the `*Needs:*` of 12.1 lists 2.1, 9.2, ResolutionOfSingularitiesCharacteristicZero and ComplexComparisonPartII only.

**Repair:** Delete AlgebraicCurves from lines 34, 126–128 and from the supplier heading; delete §3.3 from lines 34 and 128, and §§8.5, 9.5 from lines 24 and 78 (or name each in the `*Needs:*` of the target that uses it). Add "SchemeAndStackFoundations §4.17" to the `*Needs:*` of 12.1 and to its entry at line 1199.

## R04 (P3) — The `### Dependencies` paragraphs disagree with the `*Needs:*` lines

**Location:** `README.md` line 639: "5.1 needs 4.5–4.7, 1.2, SpringerResolutionAndCharacteristicCycles §§9.1–9.7 and Tau Ceti's Tate twists".

**Claim:** Layer-level dependency paragraphs name suppliers and sections that the targets' own `*Needs:*` lines do not, and omit ones they do.

**Witness:** 5.1 `*Needs:*` has "§9.1 and gap:regular-holonomic-stability" only. Line 1199 gives 12.4 only AnalyticToricGeometryPartII §0.3, while its `*Needs:*` adds AnalyticToricGeometry Layer 0 and PadicDifferentialEquationsAndRigidCohomology §RD.6.53. Line 363 omits SpringerResolutionAndCharacteristicCycles from 2.3 and 2.4.

**Repair:** Rewrite each `### Dependencies` paragraph from the `*Needs:*` lines of its layer, item for item (Layers 1, 2, 4, 5 and 12 differ: 1.2, 1.5, 2.3, 2.4, 4.2–4.6, 5.1, 12.4, 12.6, 12.8).

## R05 (P3) — 11.6 renames the quotient of 11.4

**Location:** `README.md` line 1046: "and `0 → M → Π M → M″ → 0` as in 11.4".

**Claim:** 11.4 calls the constant quotient `M′^H`; 11.6 cites the same sequence with `M″`, and its Checks use `M″`.

**Witness:** `README.md` line 1025: "`0 → M^H → Π M^H → M′^H → 0` with `M′` constant of ambient weights `≥ w + 1`".

**Repair:** Write `M′` throughout 11.6 (statement, both weight clauses and the three Checks).

## R06 (P3) — The description's opening paragraph stops at a colon

**Location:** pull-request description, first paragraph: "On these it constructs:".

**Claim:** The sentence announces a list that does not follow; the next paragraph is the folder line. The description also does not say that two supplier contracts (R02) are requested from ComplexComparisonPartII and GroebnerGeometry, beyond the five the plan declares.

**Witness:** The head's Summary (README line 3) continues the same sentence with the twelve layers; the description has none of it.

**Repair:** Replace "On these it constructs:" by "On these it constructs the Betti constructible categories and regular Riemann–Hilbert (Layer 1), Fourier–Laplace operations (Layer 2), variations of mixed Hodge structure on punctured curves (Layer 3), pure and mixed Hodge modules with their operations (Layers 4–5), exponential mixed Hodge structures and the Deligne filtration (Layers 6–8), pair cohomology, the `tg` criterion and Fourier cohomology (Layers 9–11), and the logarithmic and Newton descriptions of the irregular Hodge filtration (Layer 12). It declares seven supplier gaps, listed under the README's supplier contracts."

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 12.6 / `twistedDeRham_concentration_finrank` (headline) | `n = 0`; `φ = x`, `x²`, `x + x⁻¹` on `G_m`; `x + y + 1/(xy)`; `φ = x` on `G_m²`; `φ = 0`, `n = 1` | `1 = 0!·1`; `1, 2, 2 = 1!·vol`; `3 = 2!·3/2`; segment, hypothesis fails, `H¹ = H² = ℂ`; `{0}` not full dimensional, `H⁰ = ℂ` | holds; AS lines 569–573, 583–590; Yu lines 1397–1416 |
| Lean carriers of 12.4 | `d²` for `n = 2`; `forms n q` for `q > n`; `coboundaries φ 0`; empty face; face `Δ` (zero functional) | `D₁D₂ − D₂D₁ = 0`; `⊥`; `⊥`; excluded by nonemptiness; contains `0`, excluded | agree with README |
| 1.1 stratification of a map | `xy : A² → A¹`; `j : G_m → A¹`; cusp; umbrella | fibres `ℂ^×` vs two lines; `P¹` admits no map to `A¹` extending `j`; secant and tangent limits both `(1, 0)` | consistent; Verdier not readable |
| 1.5 regular Riemann–Hilbert | `O_X`; `δ_0`; `E^t` | `ℂ_X[d]`; skyscraper in degree `0`; irregular at `∞`, excluded | Kash84 lines 1101–1166 (analytic form) |
| 2.2 Fourier–Laplace | `δ_a`, `O`, twice-transform, `[∂_t, t]` | `(∂_t − a)·1 = 0` gives `E^{at}`; `t·1 = 0` gives `δ_0`; `τ ↦ −τ`, `δ_{−a}`; `[τ, −∂_τ] = 1` | holds; FSY lines 2773–2779; MT lines 2104–2107, both signs opposite as stated |
| 3.4 `L²` Hodge theory | constant on `P¹ ∖ {0, ∞}`; Legendre | `H⁰ = ℚ`, `H² = ℚ(−1)`, `H¹ = 0`; `χ = 2·(−1) + (1 + 1 + 0) = 0`, so `H¹ = 0` | consistent; Zucker waived |
| 4.6 mixed Hodge modules | point; rank-3 variation of 3.3 | `Ext¹(ℚ(0), ℚ(1)) = ℂ/2πiℚ`; `N e ≠ 0` with `N` zero on `gr^W`, so no relative filtration | Sai90 lines 94–104, 1236–1300, 3147, 3158 |
| 4.7 abelianness, strictness | `δ_0ℚ → j_! pℚ`; bidegree set `{p ≤ r, r + s ≤ k}` | `W_0` of target = image; `⊕ I^{r,s}` over the set is `W_k ∩ F^p` | Sai90 lines 66–71; pinned theorem `Strictness.lean:88` |
| 5.5 divisor localization | `{0} ⊂ A¹`; `xy = 0` | `0 → δ_0ℚ → j_! pℚ → pℚ → 0`; stalk of `i^!` is `ℚ²` (degree 0), `ℚ` (degree 1) vs `ℚ` | holds; FSY lines 2872–2890, its `H⁰` corrected to `H^{−1}` |
| 6.2 projector | `δ_0ℚ`, `pℚ_{A¹}`, `K`; kernel and cokernel of `η` | `K`; `0` (`RΓ(A¹, j_!ℚ) = 0`); `K`; constants with fibres `H^{−1}`, `H⁰` of `N` | holds; KS lines 1100–1117; FSY lines 2897–2910 |
| 6.6 Fourier localization | `δ_0`; `O`; `FT K` | `O(∗0)`; `δ_0(∗0) = 0`; `θ∂_θ ↦ −∂_t t`, so `D/D(∂_t t) = O(∗0)` | holds; FSY p. 70, lines 3167–3200 |
| 7.4 twistor strictness | `δ_0 V`; `pℚ_{P¹}` | injectivity of `F^p V → V`; zero groups | Sab10 lines 1360–1372 |
| 7.6 bifiltered realization; 7.1 | `δ_0 V` at index `λ`; `δ_0ℚ(−1)` | cokernel `F_{−⌈λ⌉}V = F^{⌈λ⌉}V`; `F¹ = ℂ`, `F^{1+ε} = 0` | FSY lines 2949–2960; ESY lines 1158, 1269–1276 |
| 10.1 `tg` criterion | `V = pt`, `g = 0`; `g = 1`; `g = x` | `I(ℚ)` in degree 0, `I(ℚ(−1))` in degree 2; all zero; `H² = H²_c = I(ℚ(−1))` | FSY lines 3090–3102, three clauses match |
| 11.1 Fourier cohomology | `δ_0 V`; `pℚ_{A¹}` | pair degree `r = 1`, so `j = 0`; `H²(A², tτ) = I(ℚ(−1))`, so `j = 1` | FSY lines 3231–3235 |
| 11.2 costalk | `pℚ`; `K` | `i^! = ℚ(−1)[−1]`; `H⁰ = ℚ`, `H¹ = ℚ(−1)` vs `H^•_dR(O(∗0)) = ℂ, ℂ` | FSY line 3241, its `A¹_t` read as `A¹_τ` |
| 12.1 pole-order complex | `(G_m, x)` on `P¹`, `λ ∈ (0, 1]`, `λ = 0`, compact twist | `H¹ = H⁰(O) = ℂ`; `coker(ℂ → ℂ²) = ℂ`; `H⁰(O(−1)) = 0`, jump at 0 | Yu lines 209–218, 334–360; ESY lines 289, 884, 941 |
| 4.2 `V`-filtration signs | `O`, `δ_0`, Kummer, nilpotent log connection | indices `0`; `1`; `−a − k`; `N e_1 = −e_0 = var(can e_1)` | consistent with the `T = exp(−2πi·Res)` of ComplexComparisonPartII line 4465 |
| 5.2 weights | `G_m → pt`; `ℚ[−1]` on a point | `2 ≥ 1`, `0 ≤ 1`; weights `≤ −1`, dual `≥ 1` | Sai90 lines 166–171, 3513–3519, 3656–3662 |
| 11.4 without the "no punctual section" clause of FSY A.31 | `M = δ_0ℚ` | `Π M = K`, `M′ = pℚ_{A¹}` of weight `1 = w + 1` | generalization holds |
| 12.5 Hilbert-series count | `x²`; `x + x⁻¹`; nonsaturated `⟨(4,0),(3,1),(1,3),(0,4)⟩` | `1 + t^{1/2}` at `t = 1` is `2`; `ℂ[x, y]/(xy, x − y)` of dimension 2; `t⁴·s⁶t² = s⁴·s²t⁶`, depth 1 | holds; AS lines 442–445, 617 |
| R01 | FSY contents against Layers 6–11 | pairs `8 ↔ A.4`, `9 ↔ A.5`, `10 ↔ A.6`, `11 ↔ A.7`; exact scope for 8 and 10, supersets for 9 and 11 | finding |
| R02 | README gap slugs against the plan held on the board | 7 slugs in README, 5 in plan; 2 `needs` sentences wider than the README's | finding |

- Source locators checked against the text: 46 (FSY 21, Sai90 8, Yu 7, ESY 6, AS 5, KS 4, Kash86 3, MT 2, Sab10 1, Kash84 1), all at the stated page or line.
- Library declarations opened at the pins: 21 (among them `Mixed/Strictness.lean:88, 110, 131`, `Mixed/Abelian.lean:33`, `Tate/Basic.lean:93, 102`, `CohenMacaulay/Ring.lean:40`, `KoszulComplex/Regular.lean:140`, `MonoidAlgebra/Defs.lean:64`, `Convex/Exposed.lean:55`, `ZLattice/Covolume.lean:231`); all exist as described.
- Cross-roadmap citations resolved: 58 sections of 18 suppliers, each heading found on main or at the open head; statements read for ComplexComparisonPartII §§C5.6, C6.1, LefschetzPencilsAndVanishingCycles §1.7, ShimuraVarieties §3.5b.1, SpringerResolutionAndCharacteristicCycles §§9.1, 9.7, SchemeKTheoryOperations §5.7, GroebnerGeometry §G2, AnalyticToricGeometryPartII §0.3.
- Gate: every check passed at 2ecdd81. Dependency check: `depcheck: 237 roadmaps, 2141 edges, 0 problem(s)`.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning; `#check @name` on the 13 declarations shows no lost binder; the one-tactic probes (`simp`, `rfl`, `infer_instance`, `aesop`, unfolding `simp`, an `exact` term) all fail on the theorem; no padding.
- The former-numbering map is needed: TopologicalMirrorSymmetryForHitchinSystems (README lines 61, 176, 327) and MotivicEtaleKTheory (README line 738) cite the lettered ids.
- Open request on this roadmap not answered here: TopologicalMirrorSymmetryForHitchinSystems README line 63, `gap:geometric-compact-mhs` (compact-support realization beyond smooth quasi-projective varieties).
- Overlap check: read LefschetzPencilsAndVanishingCycles, EtaleDualityAndPerverseSheaves, SheafConvolutionOnAbelianVarieties, MappingClassGroupsAndCanonicalRepresentations, ComplexComparisonPartII, EtaleCohomologyFoundations; the regular holonomic Riemann–Hilbert equivalence is owned here (1.5), and SheafConvolutionOnAbelianVarieties README line 122 still requests it from ComplexComparisonPartII (`gap:holonomic-riemann-hilbert-index`), to be repointed there; nothing else shared.
- Source independence: 22 passages compared with 9 sources, none shared beyond formulas; largest share FSY, 40 of 171 locators; contents compared with FSY: Layers 8–11 follow Appendix A.4–A.7 (R01).

## Not verifiable

- 1.1 (Verdier, Théorème 3.3, Corollaire 5.1): recorded uncertified; text not read.
- 3.4 (Zucker, Theorem 4.8, §§5–8): recorded waived; text not read.
- 1.2–1.5 (Dimca, Theorems 4.1.5, 3.2.3, 5.1.20, 5.2.21, 5.3.1, 5.3.3): uncertified; the algebraic form of 1.5 rests on it, Kash84 stating the analytic one.
- 3.2, 3.3 (Schmid, Theorem 6.16; SZ, §§1–4), 4.2 (Kash76), 12.5 (Kou, §2, Théorème 2.8): uncertified; not read.
- KloostermanMomentsAndPotentialAutomorphy (README lines 40, 1203): in the merge order, but no folder on main or at an open head; what it owns was not checked.

## Source issues

- **Misprint** in FSY at Appendix A.2, p. 62 (FSY line 2832): the source says the dual of the constant Hodge module of a `d`-fold is its twist by `(−d)`; it should be the twist by `(d)`, as its own proofs of A.19 and A.22 use; affects nothing.
- **Misprint** in FSY at Example A.3, p. 63 (FSY line 2876): the source says the restriction of the constant Hodge module to a reduced divisor sits in cohomological degree `0`; it should be degree `−1`, as in its four-term sequence on p. 62; affects nothing.
- **Misprint** in FSY at Theorem A.30, p. 71 (FSY line 3241): the source says the point inclusion is into the output line with coordinate `t`; it should be into the input line with coordinate `τ`, where the module lives; affects nothing.
- **Misprint** in FSY at Example A.27, p. 71 (FSY line 3222): the source says the composite of the two pushforwards is the zero map; it should say that the function `tg` restricts to zero on the divisor, so the pushforward factors through the origin; affects nothing.
- **Error** in Yu at §4(a), p. 26 (Yu line 1378): the source says a Laurent polynomial whose Newton polyhedron has the origin in its interior is a proper map to the line; it should claim only that the Newton filtration is exhaustive, the fibres being positive-dimensional affine for `n ≥ 2`; affects nothing.

## For the human reviewers

- Licence: `sources.toml` records Sai88, Sai90, Kash86 and AS with `licence_class = "answered-by:CBirkbeck"`; the cached AS and Sai90 texts carry publisher addresses (cambridge.org, ems.press). Their legal status is the operator's answer, not checked here.
- Licence: FSY cites for Theorem A.24 a work listed as "in preparation" (FSY line 3317); the roadmap does not cite it.
- Scope: nothing to flag; every main source is refereed or an arXiv version of a refereed paper, KS being an arXiv preprint (arXiv:1006.2706v2) cited for definitions that FSY restates.
