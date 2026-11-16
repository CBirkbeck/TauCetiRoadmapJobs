<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18010#issuecomment-6907596045 -->
Red team round 1 pass b (claude) of 2485ce7

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §5.2 has one discriminating Check; the third is vacuous

   Location: `packages/Varifolds/README.md:1259–1260`, "M an affine subspace: B_M = 0 and
   δ(ι_#V)(X) = δV(X^⊤)." and "V = 0 gives 0 = 0; for k = 0 both sides vanish."

   Claim: three Checks test the comparison formula `δ(ι_#V)(X) = δV(X^⊤) − ∫ ⟨X, tr_S B_M⟩ dV`.

   Witness: the two quoted Checks hold for every wrong model of the B_M term (opposite sign, trace
   over T_xM instead of S, the term dropped): with B_M = 0, V = 0 or k = 0 that term is 0 in all of
   them. Only the great-sphere Check sees it.

   Repair: replace the third Check by

   > - M the unit cylinder {x_1² + x_2² = 1} ⊆ ℝ³, with ν = (x_1, x_2, 0), τ the horizontal unit
   >   tangent and B_M(τ, τ) = −ν, B_M(e_3, ·) = 0; k = 1. Each of the following curves is a geodesic
   >   of M, so H_V = 0 and σ_V = 0. For the vertical line {p} × ℝ, tr_S B_M = B_M(e_3, e_3) = 0 and
   >   ι_#V is stationary in ℝ³ (a straight line). For the circle S¹ × {0}, tr_S B_M = −ν and
   >   `H_{ι_#V} = −ν`, the mean curvature of a unit circle (4.4), with equality in
   >   `|H_{ι_#V}| ≤ k|B_M|`. For the helix t ↦ (cos t, sin t, t tan α), S is spanned by
   >   cos α τ + sin α e_3, tr_S B_M = −cos²α ν, and the curvature vector γ''/|γ'|² is −cos²α ν. A
   >   model with the full trace of B_M in place of tr_S B_M would give −ν for the vertical line,
   >   which is straight; the opposite sign would give +ν for the circle.

   Tested on the refuting instances: the vertical line separates tr_S from the full trace (0 against
   −ν), the circle separates the sign (−ν against +ν), and the helix separates tr_S from both
   constants (−cos²α ν).

2. **F02** (P3) two docstrings of `Suggested.lean` point at the wrong items of Simon's §42

   Location: `packages/Varifolds/Suggested.lean:419–420`, "`C ∈ VarTan(V, x)` (§7.2) … (Simon1983,
   42.1)", and `packages/Varifolds/Suggested.lean:440–444`, "… has a dilation-invariant weight,
   `‖C‖(λA) = λ^k ‖C‖(A)` (Simon1983, 42.3)".

   Claim: 42.1 defines VarTan, and 42.3 states stationarity, the ball masses and the dilation
   invariance.

   Witness: Simon1983 line 7736 (42.1) is the pair of hypotheses at x; line 7763 (42.2) is the
   dilation invariance of the weight; line 7768 (42.3) is the definition of VarTan. The README has it
   right at `packages/Varifolds/README.md:1615` ("42.1–42.3").

   Repair: in the docstring of `Euclidean.IsVarifoldTangent` write "(Simon1983, 42.3)"; in the
   docstring of `Euclidean.IsVarifoldTangent.isStationary` write "(Simon1983, 42.1–42.3)".

3. **F03** (P3) supplier contract puts a Mathlib lemma in the wrong file

   Location: `packages/Varifolds/README.md:229–231`,
   "`InnerProductSpace.euclideanHausdorffMeasure_eq_volume`, `LinearMap.normDet`,
   `LinearMap.normDet_comp` and `LinearMap.euclideanHausdorffMeasure_image_eq_normDet_mul_volume`
   (`Mathlib/Analysis/InnerProductSpace/NormDet.lean`; …".

   Claim: all four declarations are in `Mathlib/Analysis/InnerProductSpace/NormDet.lean`.

   Witness: at the pin, `theorem InnerProductSpace.euclideanHausdorffMeasure_eq_volume` is at
   `Mathlib/Geometry/Euclidean/Volume/Measure.lean:191`; `NormDet.lean:436` only uses it. The other
   three are in `NormDet.lean` (`normDet` at line 69, `normDet_comp` at line 324).

   Repair: move the name next to the measure's own file: "`MeasureTheory.Measure.euclideanHausdorffMeasure`
   and `InnerProductSpace.euclideanHausdorffMeasure_eq_volume`
   (`Mathlib/Geometry/Euclidean/Volume/Measure.lean`; the measure is defined on any extended metric
   space, a constant multiple of `μH[d]`, and equals Lebesgue measure on a d-dimensional inner product
   space)", and leave "`LinearMap.normDet`, `LinearMap.normDet_comp` and
   `LinearMap.euclideanHausdorffMeasure_image_eq_normDet_mul_volume`
   (`Mathlib/Analysis/InnerProductSpace/NormDet.lean`; …)".

4. **F04** (P3) Lemma 2.22 of the Alexandrov-space preprint is cited for an inequality it does not state

   Location: `packages/Varifolds/README.md:1338–1340`, "(`monotonicity_inequality` and
   `monotoneOn_exp_mul_densityRatio`, for W = M; Scharrer2022 line 1120–1127 and 1184–1203, Lemma 3.3
   and Remark 3.4; AgnolettoCorreaHoyosDaSilvaNardulli2025 line 542, Lemma 2.22)"; the same citation
   at `packages/Varifolds/Suggested.lean:332`.

   Claim: Lemma 2.22 states the integrated inequality with the one-sided bound κ and the term
   k√κ ‖V‖(B_t(x)).

   Witness: AgnolettoCorreaHoyosDaSilvaNardulli2025 line 524 assumes |sec| ≤ K; line 542–640 gives
   two-sided bounds for the σ-derivative of a mollified mass ratio weighted by h, with coefficients
   c(σ, ±K), for σ below a radius ρ_0(r_0, K). Scharrer2022 line 1120–1127 and 1184–1203 does state
   the inequality.

   Repair, README: "…; Scharrer2022 line 1120–1127 and 1184–1203, Lemma 3.3 and Remark 3.4. A
   differential form for a weighted, mollified mass ratio, under a two-sided bound |sec| ≤ K, is
   AgnolettoCorreaHoyosDaSilvaNardulli2025 line 542, Lemma 2.22)". Repair, docstring of
   `monotonicity_inequality`: "(Scharrer2022, Lemma 3.3 and Remark 3.4; compare
   AgnolettoCorreaHoyosDaSilvaNardulli2025, Lemma 2.22, under a two-sided curvature bound)".

5. **F05** (P3) the Conventions say one universe; the Lean file has four

   Location: `packages/Varifolds/README.md:187`, "All types live in a single universe."

   Claim: the Lean carriers share one universe.

   Witness: `packages/Varifolds/Suggested.lean:60–62` binds `{E : Type*}`, `{H : Type*}`,
   `{M : Type*}`, and line 403 `{N : Type*}`; the elaborated `constancy` has `E : Type u_1`,
   `H : Type u_2`, `M : Type u_3`, `N : Type u_4`.

   Repair: delete the sentence (the Lean statements are universe polymorphic, which is the more
   general reading).

Five findings, all P3: one Check section with a vacuous Check, two locator slips in docstrings and
in the supplier contracts, one citation that supports less than the sentence it closes, and one
README sentence that disagrees with the Lean file. No statement of `Suggested.lean` was refuted on
any instance tried, no supplier citation failed to resolve, and the dependency check is clean.

Dependency check (run on the head, unchanged files):

```
depcheck: 246 roadmaps, 2296 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line for Varifolds.

## Verified sound

Counts: 40 declarations of `Suggested.lean` read (25 definitions and instances, 15 theorems); 34
README targets read (1.1–9.4), every line of both files; 63 source locators verified against the
texts; 47 Checks recomputed; 15 sibling citations resolved; 96 backticked library names resolved at
the pins.

**Signatures.** No Lean was run (this pass is read-only). The elaborated types of the worker's
signature record were compared with the README statements, one by one. The 18 "dropped binder"
leads are all definitions and instances whose types do not need the binder (`grassmannBundle`
keeps only `[IsManifold I ∞ M]` and `[Bundle.RiemannianBundle …]`); all ten Riemannian theorems
carry `[I.Boundaryless]`, `[SecondCountableTopology M]`, `[IsContMDiffRiemannianBundle I ∞ E …]`,
`[IsRiemannianManifold I M]` and `[BorelSpace M]`, and all five Euclidean theorems carry
`[FiniteDimensional ℝ F]` and `[BorelSpace F]`. Nothing changed.

**Adversarial pass, `Suggested.lean`** (context: section variables of line 60–69 unless noted;
Euclidean declarations use only F, k and `{W : Opens F}`).

| Declaration | Instances tried | Values on each side | Result |
|---|---|---|---|
| `grassmannBundle`, `Euclidean.grassmannian` | k = 0; k = dim; k > dim; non-self-adjoint idempotent [[1, t], [0, 0]] | {0}; {1}; ∅; excluded by `IsStarProjection` | sound |
| `weight`, `Euclidean.weight` | Dirac at (x, P); horizontal and vertical lifts of H¹ on the x-axis | δ_x; equal weights, different V | sound |
| `VarifoldTendsto` | δ_{(j e_1, P)}; j·δ_{(0, P)} | limit 0, mass drops 1 → 0; no limit | sound |
| `IsRectifiable`, `IsIntegral` (both carriers) | V = 0; v(L, ½); vertical lift; Dirac; figure eight; non-measurable θ; target of dimension below k | θ = 0; rectifiable, not integral; excluded by the plane clause; excluded (Hᵏ{0} = 0); admitted; `withDensity` equals that of a measurable minorant, integer valued when θ is; U_j = ∅ forces V = 0 | sound |
| `Euclidean.blowUp` | v([0, 1] × {0}, 1), s = λ | mass λ⁻¹ = λ⁻ᵏ·1; a V with infinite mass near ∂W gives junk integrals for finitely many j only | sound |
| `firstVariation`, `Euclidean.firstVariation` | unit circle, X = ψ y; line, X = ψ e_2; k = 0 | 2π = d/dt 2πeᵗ; 0; 0 | sound |
| `IsStationary`, `HasLocallyBoundedFirstVariation`, `firstVariationMass` (both carriers) | line; unit circle; vertical lift with X_n = n⁻¹ψ sin(n y_2) e_2 | 0; ‖δ[C]‖ = H¹⌞C; δV(X_n) = ∫ψ(t, 0) dt with sup\|X_n\| ≤ 1/n, unbounded | sound |
| `exists_firstVariation_eq_riesz` | half hyperplane; v(L, 1 + y_1²); k = 0; k > dim M | H = 0, σ = Hᴺ⁻², η = −e_1; H = (θ'/θ) e_1, σ = 0; δV = 0; V = 0. Last conjunct: mutually singular parts add | sound |
| `unitBallVolume`, `densityRatio`, `HasDensity`, `upperDensity` | H¹ on a line; two crossing lines; δ_0 with k = 1 | 2ρ/(2ρ) = 1; 2; 1/(2ρ) → ∞ (value ⊤ allowed) | sound |
| `Euclidean.monotonicity_identity` | line {y_2 = a}, σ < a < ρ; unit circle, σ < 1 < ρ; k = 0; open balls against the annulus σ ≤ r < ρ | 2√(ρ² − a²)/ρ on both sides; 2π/ρ = 2π − 2π(1 − 1/ρ); μ(annulus) on both sides; both sides left continuous in σ and in ρ | sound |
| `monotonicity_inequality` | great circle on S², κ = 1; volume of S², k = 2; κ = 0 flat; dependent u, v in `hcurv` | 2 ≤ 2 + 2(ρ − σ); π ≤ 8/π + ∫ 2f, with ∫ ≥ 8 − 5.1σ; 6.1 without the excess term; the quotient is 0 ≤ κ | sound |
| `monotoneOn_exp_mul_densityRatio` | Grönwall from f(σ) ≤ f(ρ) + c∫_σ^ρ f; c = 0 | f(σ) ≤ e^{c(ρ − σ)} f(ρ); f monotone | sound |
| `ae_hasDensity` | v(L, e^{−1/\|t\|}) at 0; Lebesgue with a constant line | density 0 exists at the null point; density 0 everywhere | sound |
| `hasDensity_and_limsup_le_of_firstVariationMass_le` | step multiplicity 1, 2 on a line (σ_V = δ_0); no `hV` binder | hypothesis fails for every Λ on U ∋ 0 (3/2 < 2 is not a counterexample); `hΛ` on small balls gives local boundedness in U | sound |
| `one_le_upperDensity_of_mem_support` | ½ v(L, 1); segment with U = B_a(0) | hypothesis `hθ` fails; Θ = 1 at each point of spt ∩ U | sound |
| `constancy` | two parallel lines (N not connected); open half-line; graph of sin(1/t); k = dim M; atom on a line | excluded; θ_0 > 0 forces the closure into Σ, so only V = 0; θ_0 = 0; multiple of the volume; not stationary, δV'(X) = 1 | sound |
| `Euclidean.IsVarifoldTangent`, `exists_isVarifoldTangent` | vertical lift at 0 (no bounded first variation) | Θ = 1, V_{0,λ} = V, limit exists | sound |
| `Euclidean.IsVarifoldTangent.isStationary` | vertical lift; step multiplicity (k = 1); the measure of density 1 + ½ sin(log r) cos ϑ | `hV` fails; ρ⁰‖δV‖(B_ρ) = 1 does not tend to 0; ball masses 2πρ but angular test −π/4 at λ = 1, π/4 at λ = e^π, so not a weight of a stationary C | sound |
| `isRectifiable_of_ae_density_pos` | Lebesgue with a constant line; vertical lift | Θ = 0, hypothesis fails; `hV` fails | sound |
| `rectifiable_compactness` | alternating lines y_2 = 0, 1; zigzags of amplitude 1/i; segments of length 1/(2i) | two subsequential limits, both rectifiable; ‖δV_i‖ = √2(i − 1) + 2 → ∞; ‖δV_i‖ = 2i → ∞ | sound |
| `integral_compactness` | v(L, 1) + v(L_i, 1), L_i → L; ½ v(L, 1) | limit v(L, 2); `hint` fails | sound |
| `Euclidean.IsVarifoldTangent.isRectifiable` | V not rectifiable; ½ v(L, 1); θ = 0 | route uses 7.1 and 7.3 only, neither needs V rectifiable; `hlow` fails; C = 0 | sound |
| `Euclidean.IsVarifoldTangent.isIntegral` | no `hlow` binder | {Θ* < 1} is ‖V‖-null for integral V, so `hlow` holds | sound |

**Adversarial pass, README** (values recomputed).

| Target | Instances | Values | Result |
|---|---|---|---|
| 1.1 | lines ℓ_θ; L_s = diag(1, s); frame (1, 1); O ∘ e | P_θ − P_0 = sin θ·R, R² = 1; two different limits at (diag(1, 0), P_{π/2}); ½[[1, 1], [1, 1]]; S ↦ O⁻¹S | sound |
| 1.2 | h = diag(1, 4), u = (1, 1) | u/5 against u/2 | sound |
| 2.1 | φ(y) = 2y, μ = H¹⌞L; exponents −k ± 1 | ½H¹⌞L; 0 and ∞ | sound |
| 2.3 | graph of \|t\|^{3/2} | (26√13 − 16)/27 ≈ 2.879 > 2√2 | sound |
| 3.1 | f = 2y; f = (y_1, 0); f = t²; f = y_1 with k = 2 | mass 2; 0; v([0, 1], 2); 0 against π | sound |
| 3.3 | \|y_1\|H¹⌞L + \|y\|⁻¹ dy; weight e^{−1/\|y_1\|} | r² + 2πr, Θ(0) = π, ratio 9 > 3 + 1; ratio ≥ e^{1/(2r)} | sound |
| 4.2 | L(X) = ∫(X¹ + X²) | √2 vol against 2 vol | sound |
| 4.4 | dilation laws; circle of radius R/λ | δ(V_{x,λ})(Y) = λ^{1−k}δV(Y ∘ η); \|H\| = λ/R | sound |
| 4.5 | g = e⁴ᵗdt², h = 4g; general estimate with only \|Dg\| bounded | 2 against 4, 8/(3√3) < 2; \|Dh\| ≤ \|Dg\| + ‖h − g‖_{C¹} closes the bound | sound |
| 5.1 | graph of \|t\|^{5/2} | ∫φ'u'(1 + u'²)^{−1/2} = −∫φu''(1 + u'²)^{−3/2} | sound |
| 6.1 | exponential form; weighted identity | d(e^{Λt}F) ≥ e^{Λt} dJ; ρI' − kI = ρJ' + ∫φ(y − x)·P_S∇h − δV(X_ρ) | sound |
| 6.3 | a.e. route; e^{−1/\|t\|}; segment in B_a | lim sup f ≤ lim inf f; ratio ≥ ρ⁻², doubling ≥ (2r)⁻¹e^{1/(3r)}; 2a < 4a | sound |
| 6.4 | g = e²ᵗdt² | θ̃ = 1, (θ̃w)' = eᵗ ≠ 0 | sound |
| 6.5 | X = ψγ(r)(y − ξ); catenoid piece | div_S X = kγ + γ'\|P_S(y − ξ)\|²/r; area 2π(h + sinh h cosh h) | sound |
| 7.2 | X = h(y)y on C | d/dλ λ⁻ᵏ∫h(y/λ) d‖C‖ = 0 | sound |
| 7.4 | zigzag, i = 2 | √2 + 2 | sound |
| 7.5 | plane with multiplicity m; small disc; dense discs | m ≤ (1 + δ)m + δ; ratio ≥ 4/(πρ) > ε; total radial length < ε²/π < ½, 2/r_j > ε | sound |
| 7.6 | spikes 1 + i·1_{E_i} | weak limit 3/2, truncation at 2 tends to 1 | sound |

**Suppliers.** GeometricMeasureTheory G2 (rectifiability closure, approximate tangent planes, area
formula with extended multiplicities, C¹ graphs); GeometricCurrents G1 (real constancy theorem by
coordinate test derivatives), G2 (chart comparison, mass of the current of a compact oriented
smooth source, integral currents), G5 (minimizers), G6 (unoriented Grassmann bundle, compactness
over compact base regions, Radon compactness, auxiliary varifold); RiemannianGeometry R4 item 1
(radial Hessian zero and the comparison on a smooth normal-distance domain), R5a, R5a.2, R5b;
RiemannianGeometry/MinimalSurfaces Scope and ownership, 3.1 and 3.3; HopfRinow (Completed) Layers
0, 1, 2 and 4. Each section exists on main and makes the statement it is cited for. All are on
main; none is in the list of roadmaps never to cite. `design/plan.json` declares no gap and the
README names none.

**Ownership.** "varifold" occurs in no open roadmap head; on main only in GeometricCurrents,
GeometricMeasureTheory and MinimalSurfaces, each of which the README cites and delimits. No other
`Suggested.lean` has the namespace `TauCetiRoadmap.Varifolds`. The pins have no varifold, no
k-dimensional density of a measure (`TauCeti.HasDensityAt` is the relative density of a set) and
no integral current.

**Headlines and padding.** Headlines of the Summary: Riesz decomposition (stated), monotonicity
Euclidean and Riemannian (stated), densities (stated), Allard's rectifiability (stated), the two
compactness theorems (stated, fixed metric), varifold tangents and tangent cones (stated in E),
constancy (stated), intrinsic against ambient (docstring: not statable), the G6 identification
(docstring: not statable). The four "not statable" claims were checked at the pins. One-tactic
probe: none of the 15 theorems follows from one library lemma or one tactic; the shortest,
`one_le_upperDensity_of_mem_support`, needs the support argument and a `limsup` lower bound on top
of the preceding theorem. No `example`, no `#check`, no `set_option`, no `lemma`. Policy: the pull
request changes only `packages/Varifolds/`; no process words or pull-request numbers in the README
or the docstrings; every target has a locator.

**Sources.** Simon1983: 46 locators (3.3, 3.5, 4.1–4.2, 4.4, 9.3, 9.5, 9.6, 11.1, 11.4, 11.8–11.9,
§15, 16.4, 16.6, 17.3–17.4, 17.8, 17.9, 19.1–19.3, §38, 39.1–39.4, 40.1–40.7, 41.1–41.2,
42.1–42.10). Scharrer2022: 4 (first variation, Lemma 2.7, Lemma 3.3, Remark 3.4).
AgnolettoCorreaHoyosDaSilvaNardulli2025: 10. Simon2023: 2. EdelenSpolaor2023: 1. Federer1969,
Allard1972 and Maggi2012 are uncertified and cited by locator only.

Source independence: 12 passages compared with 5 sources, none shared beyond standard names and
statements the mathematics forces (the closest are listed for the human reviewers); largest share
Simon1983, 85 of 128 locators; contents compared with Simon1983: independent (nine layers against
the five sections of its Chapter 8; Layers 2, 5 and 9 have no counterpart there, Layer 6 joins
§40, §41 and parts of §17 and §19, and the order of Layers 4, 6, 7, 8 is forced by their *Needs:*
lines 6.1 → 4.1–4.4, 7.2 → 6.1, 7.3 → 6.3–6.4 and 7.1–7.2, 8.1 → 7.1–7.3).

## Not verifiable

- Allard1972, Federer1969, Maggi2012: uncertified, no text; their section locators were not
  checked.
- Simon1983, 40.4 (line 7546, printed p. 236): the extraction shows the first-variation term of the
  weighted identity with a plus sign. The README's minus sign is what the computation gives (see
  the 6.1 row). Whether the print has the plus sign or the extraction lost a minus cannot be
  settled from the text file.
- Simon1983, proof of 42.8 (line 7958–7985): displays (7) and (8) are missing from the extraction,
  so the README's remark at `packages/Varifolds/README.md:1881–1882`, that the source uses only the
  measure bound on the exceptional set, could not be compared with the print. The README's own
  argument with the mass bound on Z was checked and is sound.
- 7.5 for h ≠ e and the set Z ("this roadmap's"): the statement was tested on four instances and
  the route read against Simon1983 line 8014–8048; steps (ii)–(iii) of the source's proof (line
  8052–8151) are too damaged in the extraction to follow line by line.
- The sign convention of `CovariantDerivative.sectionalCurvature` (positive on round spheres) was
  read from its definition `⟨R(u, v)v, u⟩ / det Gram`; the convention of the pinned curvature
  tensor behind it was not recomputed on an example.
- No `#check` run was made in this pass; the comparison used the worker's elaborated signatures.

## Source issues

- **Misprint** in Simon1983 at the proof of 42.8, printed p. 250: the source says the maximum of ψ_i and an integer N above θ_0 converges in L¹ to θ_0; it should be the minimum of ψ_i and N; affects nothing.
- **Gap** in AgnolettoCorreaHoyosDaSilvaNardulli2025 at the proof of Theorem 2.32, printed p. 17: the source says locally bounded first variation is preserved by the push-forward under a bi-Lipschitz smooth chart, without argument; it should be proved, since the two first variations differ by a term in the derivative of the test field; affects the proof.

## For the human reviewers

- **Licence.** `packages/Varifolds/README.md:1680–1683` lists conditions (i)–(iv) in the order and
  with the numbering of Simon1983 line 7781–7787 (Remark 42.5); at most four consecutive words are
  shared. Whether an enumerated list of hypotheses is expression is yours to read.
- **Licence.** AgnolettoCorreaHoyosDaSilvaNardulli2025 is an arXiv preprint (2504.10758v3) with no
  published version recorded in `packages/Varifolds/sources.toml`; it is cited in 13 sections,
  always beside Simon1983, Allard1972 or Scharrer2022.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2485ce7b88ed73a01668009c599b59506b4dd03d", "job": "RT-Varifolds~1b", "model": "fable", "worker": "chris-x90"} -->
