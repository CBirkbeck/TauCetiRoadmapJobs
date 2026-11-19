# Review of ComplexCurveModuli (pull request #2548 at 4b53f57)

**Verdict:** accepted

**Summary.** Accepted: a full second reading of the unchanged head found no false statement, no unsupported result and no supply defect. Every Check and worked example was recomputed by hand and holds, the seven admitted theorems of `Suggested.lean` hold on the degenerate cases tried, and every numbered locator into Robbin–Salamon was read at its place. There is one small correction (the missing citation of the owner of the boundary's second fundamental form, carried over from the previous review) and one question about the cited version of Wendl's notes; neither blocks. Nothing is left for the human reviewers to decide.

## C01 — The geodesic-boundary condition of §0.4 does not cite RiemannianManifoldsWithConvexBoundary §1.4, which owns the second fundamental form of the boundary

A consumer who knows that a boundary has vanishing second fundamental form (a Nielsen core in FuchsianOrbifoldsPartII, which consumes §0.4, is one) has no stated bridge to `HasGeodesicBoundary`. The README makes the identification in passing, "so the condition says that the boundary has geodesic curvature zero" (§0.4, lines 316–317), without saying where that notion lives.

RiemannianManifoldsWithConvexBoundary is on main. Its §1.4 (README line 563) defines `II` of `∂M` on `𝓡∂ (n+1)`, and its line 103 records `II = k_g ds²` on surfaces. It defines no geodesic-boundary predicate (its §2.1 has only the convexity predicates), so nothing here is a second owner; only the citation is missing. One sentence in the *Boundary* paragraph would do, for example: "For a unit-speed boundary curve the normal part of the covariant acceleration is `II(γ′, γ′)` (RiemannianManifoldsWithConvexBoundary §1.4), so `HasGeodesicBoundary g` holds exactly when `II ≡ 0`", with §1.4 added to the *Needs:* line and the supplier contracts.

## Questions for the author

- The References cite Wendl's notes as "version 3.3", and §3.5 cites its §§4.2–4.3. The copy that can be read openly is arXiv:1011.1690v2, which is version 3.2; there §4.2 is the classification of pointed Riemann surfaces and §4.3 the implicit function theorem, and the offset map `Diff^(k+1,p) × T → J^(k,p)` is in the proof of Theorem 4.30 (Wendl lines 5743–5761). Does version 3.3 keep this numbering? I could not read 3.3; if it cannot be checked, citing version 3.2 (arXiv v2) would make the locator verifiable.

## Previous findings

- The previous review, of this same head, raised no finding. Its small correction C01 is not taken up (the folder is unchanged) and is repeated above as C01.

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1c supported isotopies (sample) | circle triples (0,1/3,2/3), (0,2/3,1/3); pinned hypotheses | opposite cyclic orders, so rank > 1 needed; pin has T2, boundaryless, `1 < rank`, preconnected open U, compact A | matches pin | none |
| §0.1d boundary extension (sample) | collar parameter r ≤ 0 and r ≥ 1 | pin: prescribed lift at r ≤ 0, identity at r ≥ 1 (`collarDiffeomorphOfLift_apply_of_one_le`) | laws supported | none |
| §1.4 partitioned arrows (sample) | r₁ = r₂ = 1; one block; injective relabelling | `∏ S(Λ_c)` trivial versus `S₂` of order 2; pin proves wide, `≤` under merging, equality under injective relabelling | true | none |
| §2.0 manifolds as analytic spaces (sample) | f(0) = 0 on the disc; z ↦ 1 + z | pullback of z is f; 1 + z is a unit, so the map is not local | Check true | none |
| §2.1 node charts (sample) | s ≡ 0; s = b²; s(b) ≠ 0 | `∂_x f = y`, `∂_y f = x` coprime; (xy) radical, not prime; (xy − b²) prime; hyperbola misses both axes | true | none |
| §2.2 flatness | u = x + y, v = x − y; `ℂ{b,x}/(bx)` | `u² − v² = 4xy`; monic of degree 2 in u; b·x = 0 with x ≠ 0 | true | none |
| §2.4 smoothing ideal, plumbing (sample) | xy = b²; permanent node; nodal genus-one curve | ideal (b²) ≠ 0 with ds(0) = 0; ideal 0; smooth fibre genus 0 + 1 = 1 | true | none |
| §3.3 `dim Def¹` | three-sphere chain, 5 marks; nodal genus one, 1 mark; sphere, 1 mark | 0 + 2 = 3·0 − 3 + 5; `H¹(O(−1)) = 0`, 1 = 3 − 3 + 1; 0 = −3 + 1 + 2 | true | none |
| §3.4 index formula | chain with diagonal unfolding: dim B = 1, k = 2, r = 1 | 3 − 0 − 5 + 1 + 2 − 1 = 0; ker = 0, coker = 0, coker KS of dimension 1; without defect −1 | true | none |
| §3.5 slice | η anticommuting with j₀ | `ι(η)² = −1`; `dι(0)η = j₀η − ηj₀ = 2j₀η`; source formula at RobbinSalamon2006 line 1062 | true | none |
| §3.6 integrability (sample) | α = 0; torus fibre; bracket convention | mixed term `dj(â) + j dj(iâ)`; pin: `N = (0, −j M)`, `(0, −ζ)`, source bracket = −Mathlib's | matches pin and source eq. (6) | none |
| §4.1 marked-section equation | section b ↦ (b, σ(b)) for `J = [[i,0],[α,j]]` | `dσ(iâ) = α(â) + j dσ(â)`, hence `dσ(â) + j dσ(iâ) + α(iâ) = 0` using `α(iâ) = −jα(â)` | true; source line 1379 | none |
| §4.2 Hardy decomposition (sample) | closed core with Γ empty | constants have `Dξ = 0` and zero trace, so no injective trace; README excludes it | consistent with §3.2 | none |
| §4.3 neck graph | `x^(−n)` on `xy = a` | `x^(−n) = a^(−n) yⁿ`, so mode −n of ξ equals `aⁿ` times mode n of η | true | none |
| §4.5 universality for restricted families (headline) | xy = t²; a₁ = a₂ = t | classified by a = t², derivative 0 at 0; A₁ total space; rank-one smoothing derivative | consistent with §3.4 | none |
| §4.6 deformation groupoids (sample) | trivial ℙ¹ family, Φ_t(z) = z + t | Φ₀ = id, Φ ≠ id: an arrow that is the identity on the central fibre | claim true | none |
| §4.7 miniversal unfoldings (sample) | sphere with 0, 1, 2 special points; unmarked torus | `h⁰(O(2 − k))` = 3, 2, 1; `h⁰(O)` = 1; base dimension −3 + 0 + 3 = 0 | true | none |
| §5.2 universal charts (sample) | (g, n) = (0, 4) at a nodal curve | base of dimension 1; openness is Theorem 5.3 (RobbinSalamon2006 line 750) | supported | none |
| §5.5 arrow topologies (sample) | r₁ = r₂ = 1 | swap lies in `S₂`, not in the trivial product | Check true | none |
| §6.1 annuli (sample) | neck `|x|,|y| < r`, xy = a | annulus `|a|/r < |x| < r`, modulus `(2π)⁻¹ log(r²/|a|)`; `log(1/ρ_a) = −log|a| + 2 log r` | true | none |
| §6.2 collars | lengths ≤ 2 arsinh(1); genus 2; four-punctured sphere | `sinh(ℓ/2) ≤ 1` contradicts product > 1; 3g − 3 + N = 3 and 1 | true; source line 3372 | none |
| §6.3 compactness (headline) | (0, 4); (1, 1) | cross-ratio sphere compact, smooth locus `ℂ ∖ {0,1}` not; proper into locally compact Hausdorff gives closed relation | consistent | none |
| §7.1 forgetting (sample) | bridge xy = t₁, uv = t₂, yu = 1 | `xv = (t₁/y)(t₂/u) = t₁t₂`; persists when either node does | true | none |
| §7.2 collision bubbles (sample) | point meeting the node of the nodal genus-one curve | two components with 3 special points each; 2 vertices, 2 edges, b₁ = 1, genus 1 | true | none |
| §8.3 low genus | (0,3), (0,4), (1,1), (2,0) | 3g − 3 + n = 0, 1, 1, 3; z ↦ 1/z swaps x, y and fixes xy | true | none |
| `exists_zlattice_nonempty_diffeomorph_of_eulerChar_eq_zero` | ω = dz on `ℂ/(ℤ + ℤτ)`; ω ↦ iω | `∫ i ω ∧ ω̄ = 2 Im τ = 2 Im(conj(A)B)`; AB changes sign, conj(A)B does not | true | none |
| `exists_hyperbolicMetric_metric_eq_rescale_of_eulerChar_neg` | genus 2; Klein bottle; empty M | area 4π; χ = 0 excluded; χ(∅) = 0 excluded; non-orientable χ < 0 holds by double cover | true | none |
| `exists_hyperbolicMetric_hasFiniteVolume_metric_eq_rescale_of_eulerChar_lt_card` | sphere with 3 and 2 punctures; torus with 1; ℝP² with 1 and 2 | 2 < 3 holds, area 2π; 2 < 2 fails; 0 < 1; 1 < 1 fails; χ(U) = −1 hyperbolic | true | none |
| `eq_of_metric_eq_rescale_restrictOpenTangentSpace` | sphere minus 2 points; genus 2 minus a point | no complete hyperbolic metric (cover ℂ); complete conformal metric is the cusped one, restriction incomplete | true (vacuous where χ ≥ #P) | none |
| `HasGeodesicBoundary` | flat cylinder; flat disc; (0, t + t³) | accelerations 0; −(cos t, sin t) ≠ 0; (0, 6t) ≠ 0 but speed ≠ 1 | determines geodesic boundary | none |
| `exists_hyperbolicMetric_metric_eq_rescale_hasGeodesicBoundary_of_eulerChar_neg` | pants; annulus; disc | area −2πχ = 2π; 0 and −2π impossible, both excluded by χ < 0 | true; RobbinSalamon2006 line 3318 | none |
| `eq_of_metric_eq_rescale_of_hasGeodesicBoundary` | pants; annulus | `dr² + ℓ² cosh² r dθ²` even in r, doubles to genus 2, closed uniqueness applies; annulus vacuous | true | none |
| `finite_ordered_iff_forall_eulerChar_lt` | sphere with 2, 3 special points; torus with 0, 1; genus 2 with 0; no components | 2 < 2 false, group `z ↦ λz`; 2 < 3; 0 < 0 false, translations; 0 < 1; −2 < 0; both sides true | true, both directions | none |
| §0.2 Riemann–Roch index | (0, 3 marks), (1, 1), (2, 0) | 3 − 3g − |D| = 0, −1, −3; the degree would give −1, −1, −2 | true | none |
| §0.4 cusp linearization | `t^(−δ)`; `t^(−1) log t` | `(−t²∂_t² + 2) t^(−δ) = (2 − δ − δ²) t^(−δ)`; roots t², t⁻¹; `(1/3) t⁻¹ log t ↦ t⁻¹` | true | none |
| §0.4 boundary paragraph (C01) | unit-speed boundary curve | tangential acceleration 0, normal part `II(γ′, γ′)`; RiemannianManifoldsWithConvexBoundary line 103 has `II = k_g ds²` | statement true, citation missing | C01 |

- Source locators read at the text: RobbinSalamon2006 3.7–3.8 (lines 565–580), 5.2–5.6 (732–768), 6.5–6.6 (828–872), 8.1 (988–1003), 9.1 (1040–1087), 9.2 (1088), 10.2 with equation (6) (1127–1150), 11.4 Steps 1 and 3 (1301–1394), §§12–15 (1429–2999), 17.1–17.5 (3298–3374); Wendl §§4.2–4.3 in version 3.2 (lines 52–55, 5743–5761). All support the statements as written.
- Library declarations opened at the pins: Tau Ceti `Geometry/Diffeomorphism/Diffeotopy/DiscConfiguration.lean:107`, `Configuration.lean:109`, `Extend.lean:52`, `AddCircle.lean:312, 348`; `AlgebraicGeometry/Curves/NodalGluing/PartitionedAuxiliaryMarks.lean:195–223`, `FiniteAutomorphisms.lean:126, 163, 189`, `AuxiliaryMarks.lean:345`; `Geometry/Manifold/Complex/FamilyNijenhuis.lean:99–211`; `Geometry/Manifold/Riemannian/Hyperbolic.lean:51`, `Hyperbolic/ClosedSurface.lean:76, 105`, `Geodesic/Basic.lean:100–121`; `Analysis/Sobolev/Circle/Neck.lean:478`, `HardyGraph.lean:190`; Mathlib `CategoryTheory/Groupoid/Subgroupoid.lean:157`, `RingTheory/Flat/Tensor.lean:80`. About forty further cited Tau Ceti names were found declared at the pin. Nothing at the pins proves a stated target.
- Cross-roadmap citations resolved on main: ComplexComparisonPartII §§C-1.1, C0.3, C1.9, C3.2; ComplexKahlerGeometry §§1.1, 1.2, 3.2, 3.4, 4.1, 5.10; PseudoholomorphicCurveAnalysis §§5.2, 6.1, 7.1, 7.2; HeegaardFloer F1.1, F1.4 (`CZ = −μ_RS`, line 2222), F2.3, F2.6a; GeometricTopology §§1.1, 1.7, 3.3; PDE §§1.1, 1.4, 1.6, 1.7, 4.2; Orbifolds O1, O3, O4, O5; StableReduction Layers 3, 9, 10; ModularForms §10B; FuchsianOrbifolds Layer 5; ComplexTori Milestone 1; AlgebraicTopology §§7.1–7.3; ImplicitAtlases §7.4; ConformalMapping Layers 0, 1, 2, 4. All sixteen suppliers are on main.
- Dependency check output: `depcheck: 200 roadmaps, 2201 edges, 0 problem(s)`. No UPWARD or CYCLE line. The pull request changes only `TauCetiRoadmap/ComplexCurveModuli/README.md` and `TauCetiRoadmap/ComplexCurveModuli/Suggested.lean`.
- Elaboration of `TauCetiRoadmap/ComplexCurveModuli/Suggested.lean`: seven `sorry` warnings (lines 70, 81, 100, 118, 152, 166, 186) and nothing else. One-tactic probe on a copy of the file (`rfl`, `infer_instance`, `simp`, `trivial`, `simp_all`, `aesop`) closes none of the seven. The elaborated types of the eight declarations of Layers 0 and 1 were set beside their README statements: same hypotheses, no lost binder. The file was not changed.
- Headline theorems: the uniformization statements (closed, punctured, bordered, with uniqueness), the genus-one classification and stability as finiteness are stated; universality and miniversality, compactness and properness with the action charts, Riemann–Roch and the Robbin–Salamon index, `dim Def¹` and the low-genus moduli are named in the module docstring with the missing carrier. The proved node-chart prototype is marked as such in the docstring.
- Pull-request text against the head: 55 Check bullets counted ("about 55"); eight declarations added and one removed, as listed; the sixteen supplier subsections match the list; the broken ConformalMappingPartII fragment is stated. No sentence contradicts the head.
- Automatic checks: all passed; none set aside.

Overlap check: read AnalyticStableMaps, GromovWittenTheory and HeegaardFloer (main), TeichmullerGeometry and FuchsianOrbifoldsPartII (open heads), and, for citations of this roadmap, MappingClassGroupsAndCanonicalRepresentations, GroupActionsOnRiemannSurfaces, StableReductionPartII, ConformalMappingPartII and PainleveEquations; nothing shared. TeichmullerGeometry's scope hands the normal forms, closed uniformization, properness, the deformation complex, slices, integrability, universal unfoldings and the collar and geodesic-cut ingredients to this roadmap by item and states that supply runs one way; FuchsianOrbifoldsPartII consumes D0.1, D0.4 and D6.2 and owns only the extension to cusped orbifolds; StableReductionPartII states that its clutching is on algebraic stacks, a different carrier.

Source independence: 11 passages compared with 2 sources (RobbinSalamon2006 at 3.8, 5.2, 6.5, 8.1, 9.1, 9.2, 10.1–10.2, 11.4 Step 3, 17.2–17.3 and the proof of 17.5; Wendl at lines 5743–5761), none shared beyond formulas and standard terms; largest share RobbinSalamon2006, 21 of 24 body locators; contents compared with RobbinSalamon2006 (§§1–17): independent. Its universal unfoldings and groupoid (§§5–6) precede its analysis (§§7–15), while here they are Layers 4–5 after it; its §17.3 is in Layer 0 and its orbifold structures (§2) in Layer 8; Layers 2 and 7 and §§0.1–0.2, 3.3, 4.5–4.7 have no counterpart section. The corrigendum was not read.

Research link: Layers 3–6 are the analytic construction of the Deligne–Mumford orbifold of Robbin and Salamon (2006, corrigendum 2007), extended in §4.5 to all restricted families; AnalyticStableMaps and GromovWittenTheory build stable-map moduli and Gromov–Witten operations on it. Rests on the README's Downstream consumers and References and on RobbinSalamon2006 §§5–6, 17.

## Not verifiable

- Robbin–Salamon corrigendum (J. Eur. Math. Soc. 9 (2007), 901–905): behind a subscription, recorded as uncertified; Lemmas A–B and its Remark, cited in §3.6, were not read. The Nijenhuis criterion they are cited for is proved at the Tau Ceti pin.
- Robbin–Salamon 2006, journal version: behind a subscription; the README's locators are to arXiv v4, which was read.
- Wendl, version 3.3: not read; version 3.2 (arXiv v2) was read instead (see the question above).
- Hummel's book, cited by Robbin–Salamon §17: not consulted; §§6.2–6.3 prove those ingredients and do not cite it.

## Source issues

- **Gap** in RobbinSalamon2006 at Lemma 10.2, printed page 28: the source reduces integrability over an m-dimensional base to m = 1 and tests only mixed base–fibre pairs; it should also treat the horizontal component for two independent base directions, a separate component of the Nijenhuis tensor; affects the proof; corrected in print at J. Eur. Math. Soc. 9 (2007), 901–905.

## For the human reviewers

- none
