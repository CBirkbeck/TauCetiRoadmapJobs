<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14748#issuecomment-6898832088 -->
Review (claude) of 384bb15

Verdict: accepted
Conditional on the announced gaps: `normality-analytification`, `normal-riemann-extension`

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding: nothing in the design or the manifest needs a repair. The acceptance is conditional on the two declared supplier gaps `gap:normality-analytification` and `gap:normal-riemann-extension` (supplier ComplexComparisonPartII). The three findings of round 8 are repaired. No file of the design and no manifest entry was changed by this review.

Elaboration: not available (this lane does not elaborate). The package has no `Suggested.lean` at the design stage, so no Lean command was run and no build is claimed.

## Verified sound

### Round 8 findings, one by one

| Round 8 finding | Repaired passage | Status |
|---|---|---|
| Round 8, first (three locators) | §1.6: "this identification is proved here from §§1.2–1.4 and FuchsianOrbifolds Layer 0; Mok2012 line 21 to line 23 recalls only that the case n = 1 of the compactification problem … is classical". §2.2: "BaldiUllmo2023 line 582 to line 583 takes ω on S_Γ as the form of the natural Hermitian metric, its Poincaré growth being §8.3's". §2.3: "Mok2012 line 247 to line 254 and line 383 to line 389 call the metric of ω the canonical Kähler–Einstein metric, without stating the Einstein constant; the three statements are proved here". Read: Mok2012 line 21 to line 23 (the case n = 1 called classical), line 247 to line 254 and line 383 to line 389 (the form i∂∂̄(−log(Im zₙ − ‖z′‖²)) under that name, no constant); BaldiUllmo2023 line 582 to line 583 (ω introduced as the form of the natural Hermitian metric). Plan targets 1.6, 2.2, 2.3 carry the same locators. | Repaired |
| Round 8, second (consumers) | `design/plan.json` `consumers` has five entries, the fifth "Roadmaps on rank-one locally symmetric spaces, hyperbolicity of moduli and Margulis's commensurability criterion"; the README has five bullets. BaldiUllmo2023 line 361 to line 362 is Theorem 2.4.3. | Repaired |
| Round 8, third (Margulis lemma on main) | Scope: "The Margulis lemma for real hyperbolic space ℍⁿ and the thick–thin decomposition of finite-volume hyperbolic 3-manifolds are GeometricTopology §7.3; §4.4 differs in treating discrete subgroups of PU(1,n) acting on 𝔹ⁿ … and consumes nothing from it". On main, `TauCetiRoadmap/GeometricTopology/README.md:6908` is "### 7.3 Finite-volume hyperbolic 3-manifolds" and :6910 states the Margulis lemma for ℍⁿ. | Repaired |

The repair report also changed §7.2 (same pattern): "Mok2012 line 309 to line 311 works with the canonical Kähler–Einstein metric on such a quotient, without stating the Einstein constant, which is §2.3's". Read at Mok2012 line 309 to line 311: a torsion-free discrete Γ of finite volume for that metric, no constant. Sound.

No finding of the repair report was marked "not actionable in this package". No maintainer notes were supplied.

Repaired patterns searched in the rest of the design: every Mok2012, BaldiUllmo2023, MilneSVI, WitteMorris2015, Kiernan1972 and Deng2020 line locator of the fifteen sampled sections was opened (table below; all hold); §7.4's Mok2012 locator has the repaired wording; the "variant on another roadmap" pattern of round 8's third finding was searched by object across main and the open heads; the one further candidate, ArithmeticFuchsianGroups at n = 1, is no variant of a target of this roadmap (remark under the supplier and ownership audit).

### Coverage and shape

Read the 970-line README in full, the 57 plan targets in 12 layers (ids equal to the README's 57 subsections, script), 17 suppliers, 5 consumers, 2 gaps, and the 17 manifest entries (8 certified, 8 uncertified, 1 waived, one key per work).

- Every one of the 57 subsections has a `*Needs:*` line and at least three Checks (script: none below three); every plan target has at least three tests and a locator; plan prerequisites are acyclic and point backwards (script: no forward or missing `target:` edge).
- Twelve layers, each ending with Examples and Dependencies; the order is forced (§6.1 needs §§4.1–4.5, 5.2–5.3; §8.1 needs §6.4; §9.2 needs §§8.2–8.4; §10.1 needs §§9.4–9.5; §11.4 needs §10.5; §12.3 needs §8.5).
- Style scan: no LaTeX delimiter, `$`, machine path, pull-request number, round label, `set_option`, "optional", "deferred", "for later", "removed" or "current"; every "lemma" is the Margulis, Selberg or Schwarz lemma as mathematics. No algorithm. The README attributes no backticked Lean name to this roadmap.
- Gaps: the same two slugs in `plan.json` and under "What ComplexComparisonPartII must provide"; supplier named; `neededBy` (9.4, 9.5, 10.4; 9.4, 9.5, 10.5) equals the targets with `gap:` prerequisites. Minimality checked at the heads: ComplexComparisonPartII §C0.6 (README:1471–1480) constructs finite analytic normalization and §C−1.2 (:1117) `completedAnalyticStalkComparison`, and its README:2926–2927 says its own route avoids "the normality of the analytification of a normal scheme and the extension theorem on normal analytic spaces"; ShimuraVarieties §2.5 proves normality only of the Baily–Borel quotient; ComplexKahlerGeometry K3's Riemann extension (its §3.5, README:1038–1050 on main) is stated on manifolds and asserts nothing for singular ambient spaces. Precise, minimal, declared: no finding.

### Adversarial table (computed values)

Conventions: ⟨a,u⟩ = Σ conj(aⱼ)uⱼ; curvature −2 normalisation.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Scope clause on GeometricTopology §7.3 (repaired) | n = 1, point tanh t; n = 2 | d_𝔹(0, tanh t) = √2\|t\|, d_ℍ² = 2\|t\|, ratio 1/√2, so ε rescales by √2; n = 2 curvatures −2 and −1/2, not constant | Pass |
| Conventions: Heisenberg law, ρ | general a, a′; a = 1, a′ = i | composite vertical part t + t′ + 2i⟨a,a′⟩ − 2i Re⟨a,a′⟩ = t + t′ − 2 Im⟨a,a′⟩; (1,0)(i,0) = (1 + i, −2), reverse (1 + i, 2), commutator T_{−4}; Im v and \|u\|² both gain 2 Re⟨a,u⟩ + \|a\|² | Pass |
| Conventions: Cayley, vertical metric | w general; u = 0 | ρ∘C = (1 − \|w\|²)/\|1 − wₙ\|²; ∂∂̄(−log y) = 1/(4y²), metric (dx² + dy²)/(2y²); ℓ(a_s) = (1/√2) log s² = √2 log s; T_t: √2 arcsinh(\|t\|/(2y)) | Pass |
| §1.4 unimodularity, K ≅ U(n) | g_t, reflection in K; P_∞ | Δ(g_t) = Δ(g_{−t}) = Δ(g_t)⁻¹ = 1; P_∞: a_s scales Lie N by s^{2n−2}·s² = s^{2n} ≠ 1 | Pass |
| §1.5 boundary, MAN (sample) | Z_K(Y_{eₙ}); τ → ∞; n = 2 map to the Heisenberg group | āDeₙ = eₙ gives D = diag(D′, a), action u ↦ a⁻¹D′u; C(tanh τ·eₙ) = (0, i e^{2τ}), s = e^τ; z″ = −t″/4 + (p + p′)(q + q′)/2 = z + z′ + pq′ with t″ = t + t′ − 2(pq′ − qp′); dims 1 + 1 + 3 = 5 = 8 − 4 + 1 | Pass |
| §1.6 n = 1 (sample, repaired locator) | [diag(1, −1)]; A | C(−w) = i(1 − w)/(1 + w) = −1/C(w); order 4 in SL₂(ℝ), 2 in PSL₂(ℝ); a_s ↦ z ↦ s²z | Pass |
| §2.1 Aut(B) (headline) | tanh t = −1/2; w/2; z + z² | (w − 1/2)/(1 − w/2); Df(0) = 1/2; unbounded domain | Pass |
| §2.2 (repaired locator) | w = (1/2, 0), u = e₁; volume; n = 1 | h = 4/3 + 4/9 = 16/9, g = 32/9 on both sides; det h = (1 − \|w\|²)^{−n}(1 + \|w\|²/(1 − \|w\|²)) = (1 − \|w\|²)^{−(n+1)}; π/6 against π/3 and 2π/3 | Pass |
| §2.3 (repaired locator) | n = 1, 2 | Ric = −(n+1)ω from det h; −½B with B = 2(n + 1)g_𝔹 gives −(n + 1)g_𝔹; Killing −1/3, −1/12 times 6 = −2, −1/2 | Pass |
| §2.4 distance | tanh t·e₁ | right side cosh² t; Killing length (4(n + 1))^{1/2}\|t\|, ratio √(2(n + 1)) | Pass |
| §3.3 classification (headline) | two axes of B²; segment | reducible; real dimension 1 | Pass |
| §3.4 fixed sets (sample) | [diag(1, e^{iθ}, 1)]; [diag(1, ζ, ζ)]; W ∩ W′ | eigenspace of 1 is span(e₀, e₂), fixed set {w₁ = 0}; only 0; a subspace of a (1,m) space containing a positive vector has signature (1,k), k ≥ 0 | Pass |
| §4.1 eigenvector lemma | Jordan block gw = λw + v | ⟨gv, gw⟩ = ⟨v,w⟩ + λ̄⟨v,v⟩, so ⟨v,v⟩ = 0 | Pass |
| §4.2 displacement (sample) | n_{(a,t)} at (0, iy); screw m·T_t at (u, x + i(y + \|u\|²)) | With the form i(v̄ − v′) − 2⟨u,u′⟩: cosh²(d/√2) = ((2y + \|a\|²)² + t²)/(4y²) ≥ (1 + \|a\|²/(2y))², so d ≈ √2\|a\|/√y and positive on each horosphere; screw: ((2y + 2A)² + (B + t)²)/(4y²) with A = Σ\|uⱼ\|²(1 − cos θⱼ), \|B\| ≤ 2CA, bounded below by 1 + min(t²/(16y²), \|t\|/(2Cy)): sublevel sets lie in horoballs; horospheres ∫dy/(√2y) = (1/√2)\|log(N₂/N₁)\| | Pass |
| §4.3 parabolic and loxodromic (sample) | a_{1/2}, T_1; general h = m a_s n | a_s T_t a_s⁻¹ = T_{s²t}, so T_{4^{−k}} → 1; conjugates stay in M·(compact part of N) and a constant subsequence would give a limit in M, not parabolic | Pass |
| §4.4 Margulis lemma | coset count; S₃; C_m | x, y ∈ gᵢV gives x⁻¹y ∈ V⁻¹V ⊂ U; F·C_j = C_{j+1}; a strict chain to C_m needs m + 1 cosets; A₃ of index 2 | Pass |
| §4.5 | ⟨n_{(1,0)}, n_{(i,0)}⟩; a ∈ ℤ | T_{−4} in the group, Λ = ℤ[i]; isotropic real subspace has dimension ≤ n − 1 < 2n − 2 for n ≥ 2 | Pass |
| §5.1 lattices (sample) | Γ(2)/{±1}; ⟨T_1⟩ | 6·π/6 = π; ∫_ε^1 dy/(2y²) = (ε⁻¹ − 1)/2 → ∞, ∫_Y^∞ = 1/(2Y) | Pass |
| §5.3 covolume (sample) | Killing rescaling; horoball; strip | volume factor (2(n + 1))^{2n/2} = (2(n + 1))^n; ∫_N^∞ ρ^{−(n+1)}dρ < ∞, ∫_0^1 = ∞ | Pass |
| §6.1 cusp theorem (headline) | H of the last Check; y = 1000 | zᴴHz = −iv + iv̄ − 2\|u\|² = 2(Im v − \|u\|²); √2·arcsinh(1/2000) = 0.000707106752 | Pass |
| §6.3 Selberg (headline) | Γ(3), Γ(2) | traces −2, −1, 0, 1 are 1, 2, 0, 1 mod 3; −1 excluded by torsion-freeness; −1 ∈ Γ(2) | Pass |
| §6.4 neat | diag(1/2, i, 2) | ratios ±2i, ±i/2, 4, 1/4 and 1 three times; 2i·(i/2) = −1 | Pass |
| §7.2 torsion-free quotients (sample, repaired locator) | Γ(3); PSL(2,ℤ) at i | genus 0 with four cusps; local degree 2; Ric(ω_Γ) = −2ω_Γ at n = 1 since π is a local isometry | Pass |
| §8.1 cusp charts (headline) | general a; (λ, iλ) | \|q\|² = e^{−4π Im v/τ}, so ρ > 0 iff \|q\|² < e^{−4π\|u\|²/τ}; multiplier χ(a)e^{−(4π/τ)⟨a,u⟩ − (2π/τ)\|a\|²}; τ = 4λ², χ((1 + i)λ) = e^{−πi} = −1 | Pass |
| §8.2 toroidal compactification (sample) | exponent match; E_b; (λ, iλ) | πH_b(u,a) = −(4π/τ)⟨a,u⟩, πH_b(a,a)/2 = −(2π/τ)\|a\|²; E_b(a,a′) = (4/τ) Im⟨a,a′⟩ ∈ ℤ; E′(iv,v) = (4/τ)\|v\|² > 0; E′(iλ,λ) = 1; deg L_b = −1 | Pass |
| §8.3 asymptotics (sample) | n = 1; cross terms | Im v = −(τ/2π) log\|q\|, metric \|dq\|²/(2\|q\|² log²\|q\|), ω = i dq∧dq̄/(4\|q\|² log²\|q\|); −log ρ = const − log(−log‖·‖); mixed terms bounded by Cauchy–Schwarz | Pass |
| §8.4 | ℓ = 0, 1; adjunction | radial dr/r·(−log r)^{(ℓ−1)(n+1)} diverges iff (ℓ − 1)(n + 1) ≥ −1 iff ℓ ≥ 1; K_{X^M}\|_{T_b} = L_b⁻¹ | Pass |
| §§9.1–9.3 Mok's theorem (headline) | genus 2, 3; Γ(2)/{±1}; ℓ ≥ 2 | 6g − 6 ≥ 2g + 1 for g ≥ 2, 4g − 4 ≥ 2g + 1 iff g ≥ 3; E = O(1), −(2ℓ − 1) + 3(ℓ − 1) = ℓ − 2; ∂̄(χν^ℓ) has compact support in X and iΘ(K^{ℓ−1}) = (ℓ − 1)(n + 1)ω > 0 for ℓ ≥ 2 | Pass |
| §9.5 arbitrary lattice (sample) | {1, −1}; ⟨r₁, r₂⟩; PSL(2,ℤ) | π₁ of the punctured quotient is Γ_x ≠ 1 for n ≥ 2 (S^{2n−1} simply connected); invariants w₁², w₂²; cusp classes of Γ′ modulo F are those of Γ | Pass |
| §10.1 hyperbolic embedding (sample) | circle \|q\| = r | 2πr/(√2 r\|log r\|) = √2π/\|log r\| → 0; interior limit points are separated by completeness, distinct cusps by the horosphere distance of §4.2 | Pass |
| §10.3 Borel algebraicity (sample, headline) | exp into the j-line; identity | not algebraic and Γ has torsion; unique algebraization | Pass |
| §10.5 uniqueness (sample, headline) | image of Γ₀(2); doubled ℙ¹; nodal cubic; n = 1 | index 3, widths 1 + 2, one elliptic point of order 2, genus 1 + 3/12 − 1/4 − 1 = 0, X_Γ ≅ ℂ*; six against three boundary points; two branches at the node; a normal curve germ is smooth, punctured disc connected | Pass |
| §11.1 (n = 1 against ArithmeticFuchsianGroups) | PSL(2,ℤ); A = diag(2,1) | ker p = {±1}, p(SL₂(ℤ)) = PSL₂(ℤ); A·SL₂(ℤ)·A⁻¹ ∩ SL₂(ℤ) = Γ⁰(2) of index 3 | Statement passes; no change |
| §11.3 Shimura datum (headline) | z = i; n = 1, 2 | h₀(i) = [diag(1, −1, …, −1)]; Y_v ↦ Y_{(z/z̄)v}; \|det g\|² = (−1)^{n+1}: −1 for n = 2, 1 for n = 1 | Pass |
| §12.1 definitions (sample) | Z = S_Γ; points; {w₂ = w₁²} | m = n allowed, H = G; excluded by dim ≥ 1; not in an affine line; a component's regular locus is totally geodesic once it is so on a dense open part (B = 0 is a closed condition) | Pass |
| §12.4 (headline) | B × {s}, B × S_Γ, {x₀} × S_Γ | (dim Q, dim U) = (n, 0), (2n, n), (n, 0) | Pass |

### Seeded source sample

| Target | Locators read and result |
|---|---|
| 1.5 | BaldiUllmo2023 line 517 to line 519 (unipotent radical and its centre), line 559 to line 571 (Siegel domain and D(N)); Mok2012 line 138 to line 154 (the group W_b, its commutator group, S(N)). Supported; the conjugate in the pairing is the roadmap's (Source issues). |
| 1.6 | Mok2012 line 21 to line 23. Supported as worded. |
| 3.4 | Goldman1999 Ch. 3 only (uncertified, not read); the statement was recomputed above. |
| 4.2 | Mok2012 line 383 to line 403 (restriction of ω to vertical half-planes, small displacement of the vertical translation in S(N)); BaldiUllmo2023 line 566 to line 581. Supported as inputs. |
| 4.3 | Mok2012 line 338 to line 342 (no common fixed point, after Eberlein–O'Neill). Supported. |
| 5.1 | WitteMorris2015 line 1893 (Definition 4.1.9), line 1940 (Definition 4.1.16), line 1944 (a group with a lattice is unimodular); BaldiUllmo2023 line 355 to line 357 (commensurability). Supported. |
| 5.3 | WitteMorris2015 line 1899 to line 1921, Proposition 4.1.11 (lattice iff a fundamental domain of finite measure); BaldiUllmo2023 line 338 to line 339 (cocompact). Supported; the equality with vol_ω is the roadmap's. |
| 7.2 | Mok2012 line 309 to line 311. Supported as worded. |
| 8.2 | Mok2012 Theorem 1, line 476 to line 484; Main Theorem, line 546 to line 550 (components biholomorphic to abelian varieties); BaldiUllmo2023 line 510 to line 516. Supported. |
| 8.3 | Mok2012 line 240 to line 304 with Proposition 1 at line 295 (the two-sided volume estimate with δ²(−log δ)^{n+1} in the denominator); BaldiUllmo2023 Definition 3.3.4 and Theorem 3.3.5, line 586 to line 601. Supported. |
| 9.5 | MilneSVI Remark 3.13(a), line 1722 to line 1724 (torsion: normal analytic space, normal variety); BaldiUllmo2023 Theorem 3.1.12, line 455 to line 462. Supported. |
| 10.1 | Kiernan1972 line 57 to line 75 (punctured-disc metric, shrinking circles, distance decrease, the definition of hyperbolic embedding); Deng2020 line 61 to line 63. Supported. |
| 10.3 | MilneSVI Theorem 3.14, line 1742 to line 1744 (torsion-free arithmetic, nonsingular quasi-projective V); proof, line 1764 to line 1769; minimality, line 1775 to line 1780; Deng2020 Theorem A, line 87 to line 90, with the hypotheses the README states. Supported. |
| 10.5 | Mok2012 line 11 to line 16 (minimality among normal compactifications, arithmetic case); MilneSVI line 1690 to line 1694; BaldiUllmo2023 line 511 to line 516. Supported as worded: none states the uniqueness, as the README says. |
| 12.1 | BaldiUllmo2023 line 49 to line 50 (totally geodesic subvarieties, dimension > 0), Definition 3.1.6, line 421 to line 423, Definition 3.1.13, line 468 to line 473. Supported. |

No locator in the README is flagged by the author as unverified other than the settled uncertified and waived works.

### Pinned declarations opened

Pins: Mathlib 1b1ccf4, Tau Ceti 2fd255d (the checkouts' heads, equal to the commits the README names). All 39 file-and-line citations hold the named declaration at the cited line.

- Mathlib: `Algebra/Lie/Classical.lean:175`, `LinearAlgebra/UnitaryGroup.lean:105`, `Logic/Equiv/Fin/Basic.lean:224`, `LinearAlgebra/Projectivization/Basic.lean:48`, `Topology/Algebra/Projectivization.lean:44`, `Analysis/Complex/UnitDisc/Basic.lean:30`, `Analysis/Complex/Schwarz.lean:189`, `Topology/Algebra/ConstMulAction.lean:534, :566, :601`, `Topology/Algebra/Group/DiscontinuousSubgroup.lean:28`, `Topology/Algebra/Group/Subgroup.lean:155`, `Topology/Algebra/ProperAction/CompactlyGenerated.lean:95`, `MeasureTheory/Group/FundamentalDomain.lean:69, :679, :695`, `GroupTheory/Commensurable.lean:58, :141`, `AlgebraicGeometry/Normalization.lean:122`, `RingTheory/Jacobson/Ring.lean:60, :681, :691`, `RingTheory/Ideal/KrullsHeightTheorem.lean:282`; also `MulAction.orbitRel.Quotient` (`GroupTheory/GroupAction/Defs.lean:349`), `Matrix.ProjectiveSpecialLinearGroup` (`LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean:36`), `UpperHalfPlane` (`Analysis/Complex/UpperHalfPlane/Basic.lean:28`).
- Tau Ceti: `Topology/Algebra/UnitaryGroup.lean:104, :110`, `Topology/Algebra/Projectivization.lean:188, :215, :311`, `Geometry/Manifold/Instances/Projectivization.lean:54, :82, :96`, `Analysis/Complex/CauchyIntegralPolydisc.lean:351`, `Geometry/Manifold/Instances/Quotient.lean:253`, `MeasureTheory/Group/ProperlyDiscontinuous.lean:100`, `Topology/Algebra/GroupAction/FreeLocus.lean:36`, `GroupTheory/SpecificGroups/Heisenberg.lean:58`, `Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82`; the directories `Analysis/Complex/Fuchsian` and `Analysis/Complex/Conformal/SchwarzPick` exist.

Read for what they say: `exists_isFundamentalDomain_of_properlyDiscontinuousSMul` assumes second countable, T2, locally compact, `ContinuousConstSMul`, `ProperlyDiscontinuousSMul`, `Countable G`, and the null complement of `freeLocus`, and gives a measurable set with pairwise disjoint translates, as the contract says; `dist_le_div_mul_dist_of_mapsTo_ball` takes `DifferentiableOn ℂ f (ball c R₁)` and `MapsTo` into a closed ball; `IsFundamentalDomain.covolume_eq_volume` needs `Countable G` and an invariant measure, both available in §5.3.

### Supplier and ownership audit

Each citation was resolved at this round's heads (main 1a19c9f; open heads of the index of 2026-11-15).

- RealSemisimpleLieGroups (open, new roadmap): §3.1 (README:805), §5.2 (:1105), §5.3 (:1134), §5.4 (:1169), §5.6 (:1254), §5.7 (:1286: the form linear in the first slot, `Y_v ↦ Y_{āAv}`, g_𝔹, Killing = 2(n + 1)·g_𝔹, sub-balls for 1 ≤ m ≤ n). Its "Outside this roadmap" paragraph (:137–142) leaves Selberg's lemma, finite generation, non-arithmetic ball quotients and the full biholomorphism group of the ball outside itself.
- ComplexComparisonPartII (open): §§C-1.1 (:1004), C-1.2 (:1104), C0.6 (:1471), C1.4 (:1689), C1.6 (:1861), C1.9 (:1977), C4.1 (:2679), C4.2 (:2701), C4.4 (:2742), and the nine cited names.
- AbelianSchemesAndArithmeticModuli §A5.3 (:2628, `appellHumbert` :2630); ShimuraVarieties §§P.1 (:156), P.2, P.6 (:233), 0.1, 0.4, 0.5, 1.2, 2.1, 2.2, 2.5, 2.7 (:660), 3.1, 3.2, 3.3 (:770), 3.4a, 3.5 (:920); PELModuli §M5.5 (:3663, the three names); ShimuraData §3.8 (:529); AlgebraicModuliForArithmeticGeometry §§5.4 (:8675), 9.5 (:10168); ResolutionOfSingularitiesCharacteristicZero §6.2 (:894); ArithmeticLocallySymmetricSpaces §ALS.0.5; ShimuraCompactifications Layer 2 (:1142, named in the Scope only).
- Main: AdelicAlgebraicGroups §§1.1 (:1003), 3.4 (:3112, "Arithmetic lattices in a real Lie group" :3384), 4.3 (:4609); ComplexTori Milestone 1 (:130); FuchsianOrbifolds Layers 0–4 (:296, :368, :405 with L2.1 :407, :563, :604); VonNeumannAlgebras Layer 9 (:2861); ComplexManifolds Milestones 4–7 (:238, :267, :296, :319); ComplexKahlerGeometry K4 (:1091), K6.0 (:2321); RiemannianGeometry R4.7, R5a; SchemeAndStackFoundations §1.17 (:3417, `finiteGroupQuotient_projective` :3450); RepresentationTheory/LieGroups Layer 9 (`kakDecomposition` :1362); Completed/ConformalMapping Layer 2 (:531); Completed/HopfRinow; GeometricTopology §7.3 (:6908).

`roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. `scratch/overlaps.md`: no other pull request changes this roadmap, no dropped id, no revision-only id, no second copy; main has no folder of this name; the board's package index lists no package of this subject, and among the board's package folders only LieGroupsPartII's design names PU(1,n), as a consumer of the minimal parabolic subgroup.

Searched by object with `roadmaps grep` (main and open heads): Selberg's lemma, Margulis lemma, PU(1,n), complex hyperbolic, ball quotient, hyperbolically embedded, Cartan's uniqueness, Zassenhaus neighbourhoods, neat lattices and subgroups, Garland, cusp structure and precisely invariant horoballs, normal analytic spaces. PU(1,n) and complex hyperbolic space occur only in RealSemisimpleLieGroups (cited); Selberg's lemma and Cartan's uniqueness theorem only as items it leaves out; the Margulis lemma only in GeometricTopology §7.3 (Scope); "hyperbolically embedded" and "Zassenhaus neighbourhood" nowhere; neat subgroups of arithmetic groups in AdelicAlgebraicGroups §4.3 (Scope and Conventions); "Garland" on main is the loop-group paper of KacMoody, not reduction theory. This roadmap is the owner of Layers 4–10 and 12.

**Remark (no change needed): §11.1 at n = 1 and ArithmeticFuchsianGroups.** ArithmeticFuchsianGroups (open, new roadmap, earlier in the merge order) §1.1 (README:457) defines arithmetic Fuchsian groups through orders of quaternion algebras over totally real fields, and its §2.1 (README:1034) proves the commensurator criterion for lattices of PSL₂(ℝ). This README does not name it. That is not a defect of this design: §11.1 defines no arithmeticity predicate of its own (it reads AdelicAlgebraicGroups §3.4's, on main, and adds only the witness form, the ℚ-simple reduction and the isogeny statement, none of which ArithmeticFuchsianGroups states), the Scope (README:22) leaves Margulis's arithmeticity and commensurability criteria outside, and nothing is consumed from ArithmeticFuchsianGroups. So no object has two owners here; a comparison of the quaternionic predicate with §3.4's on PSL₂(ℝ) lies between ArithmeticFuchsianGroups and AdelicAlgebraicGroups. The instance both texts compute agrees: PSL(2,ℤ) satisfies the quaternionic predicate (ArithmeticFuchsianGroups README:488 and :993, k = ℚ, the order M₂(ℤ)) and §11.1's (first Check, 𝐆 = SL₂, ker p = {±1}, p(SL₂(ℤ)) = PSL₂(ℤ)).

Overlap check: read RealSemisimpleLieGroups, ArithmeticFuchsianGroups, ShimuraVarieties, KleinianGroups, ComplexComparisonPartII, FuchsianOrbifolds, ConformalMappingPartII, AdelicAlgebraicGroups, and also GeometricTopology and ShimuraCompactifications; form, groups, ball, metric, sub-balls → RealSemisimpleLieGroups §5.7; MAN → RealSemisimpleLieGroups §3.1; arithmetic-lattice predicate and neat levels → AdelicAlgebraicGroups §§3.4, 4.3; arithmetic quotients and Baily–Borel → ShimuraVarieties; the n = 1 quotient and cusps → FuchsianOrbifolds; Margulis lemma for ℍⁿ → GeometricTopology §7.3, for 𝔹ⁿ → this roadmap; quaternionic arithmetic lattices of PSL₂(ℝ) and their commensurator criterion → ArithmeticFuchsianGroups §1.1 and Layer 2, which §11.1 neither restates nor consumes (remark under the supplier and ownership audit); KleinianGroups (PSL(2,ℂ) on ℍ³) and ConformalMappingPartII share nothing; nothing else shared.

Dependency check, run on the unchanged design:

```text
candidate: BallQuotientsAndComplexHyperbolicLattices is not in the merge order yet; checked as if placed after ShimuraData (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2251 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

### Headline theorems

From the Summary: Aut(B) = PU(1,n) (§2.1); totally geodesic subvarieties are sub-balls (§3.3); the cusp structure theorem (§6.1); finite generation and Selberg's lemma (§§6.2–6.3); the normal analytic quotient (§7.1); the toroidal compactification by abelian varieties (§8.2); L² jets and projectivity of S*_Γ (§§9.1–9.5); the extension theorem and Borel algebraicity (§§10.2–10.3); uniqueness of the model and of the finite-point compactification (§§10.4–10.5); the Shimura datum and the Baily–Borel comparison (§§11.3–11.4); Γ-special equals totally geodesic (§§12.2–12.3); the intersection setting (§12.4). Each is a named target with hypotheses. The padding probe, the binder check and the statable-headline check apply to `Suggested.lean`, which does not exist at this stage.

### Copyright, wording, arrangement, reuse

- **Wording.** The roadmap's text of the fifteen sampled sections was set beside the sources at the locators above, with six further passages: §8.1 against Mok2012 line 152 to line 176; §9.3 against Mok2012 line 546 to line 562; §10.5's proof against Mok2012 line 11 to line 16; the Conventions' Heisenberg paragraph against Mok2012 line 138 to line 146; §11.1 against BaldiUllmo2023 line 333 to line 339; the Scope's commensurability sentence against BaldiUllmo2023 line 355 to line 362. No sentence, list or proof plan is shared; the longest common runs are formulas and names the mathematics forces (the Siegel inequality, the map Ψ, "E = K ⊗ [D]"), under a dozen words.
- **Arrangement.** BaldiUllmo2023 has the largest share (35 of 120 source mentions in the layers; Mok2012 28). Its sections (introduction; lattices and arithmeticity; real Shimura data, the ball, toroidal compactification, special subvarieties in its §3; Hodge theory and finiteness afterwards) do not map onto the twelve layers: its §3 is spread over Layers 1, 3, 6, 8, 10, 11 and 12, its §2 over Layers 5 and 11, and its later sections are outside the scope. Mok2012 (§§1.1–1.3, then the Main Theorem) is nearest to Layers 8–9, but its §1.3 is Layers 4–6, placed before its §§1.1–1.2 because §8.1 needs §6.4, and §§8.5, 9.5, 9.6 are not in it.
- **Reuse.** No table, figure, exercise list or data set is taken over.

Source independence: 21 passages compared with 6 sources (BaldiUllmo2023, Mok2012, WitteMorris2015, MilneSVI, Kiernan1972, Deng2020), none shared beyond forced formulas; largest share BaldiUllmo2023, 35 of 120 locators in the layers; contents compared with BaldiUllmo2023 and Mok2012: independent. Goldman1999 and the other settled unread works could not be compared.

## Not verifiable

- Goldman1999 Ch. 3 (the only locator of sampled §3.4, and a locator of §§1.4, 2.1, 2.3–2.5, 3.2–3.3): settled uncertified, text not read; the statements it is cited for were recomputed above.
- Cartan1957, Raghunathan1972, Borel1969, Alperin1987, Borel1972, BailyBorel1966, SiuYau1982: settled uncertified, not read. GarlandRaghunathan1970: waived, not read; §6.1 (2) rests on BaldiUllmo2023's quotation of it.
- Lean elaboration, the one-tactic probe and the `#check` comparison: no Lean file exists at this stage, and this lane does not elaborate.
- Ownership against open pull requests was checked through the tools' index of open heads (477 pull requests); the brief's list of 240 names does not include RealSemisimpleLieGroups, ComplexComparisonPartII, ShimuraVarieties or ShimuraCompactifications, whose heads the tools did provide.

## Source issues

- **Misprint** in Mok2012 at §1.1, equation (1), printed p. 4 (line 142 to line 144): the source says the pairing a′·z′ is the sum of aᵢzᵢ; it should be the sum of conj(aᵢ)zᵢ, for the map to preserve the Siegel domain; affects nothing.
- **Gap** in Mok2012 at §1.1, equations (5)–(6), printed p. 5 (line 173 to line 175): the source says every element of Γ ∩ W_b has vertical part an integer multiple of τ, so no unitary factor appears; it should allow a real vertical part t, giving the factor e^{2πit/τ}; affects a stated result.
- **Misprint** in Mok2012 at the proof of the Main Theorem, printed p. 14 (line 604): the source says the bundle trivial near D is the canonical bundle tensored with the inverse of [D]; it should be tensored with [D], as at line 569; affects nothing.
- **Misprint** in Mok2012 at §1.3, equation (5), printed p. 9 (line 390 to line 396): the source says the restriction of ω to a vertical half-plane is i dzₙ∧dz̄ₙ over ρ²; it should carry the factor 1/4; affects nothing.
- **Error** in BaldiUllmo2023 at §3.2, printed p. 12 (line 500 to line 502): the source says the stabiliser of a subspace is a product of PU(1,m) and a compact group; it should be an extension of PU(1,m) by a compact kernel; affects a stated result.
- **Misprint** in BaldiUllmo2023 at §3.2, printed p. 12 (line 501): the source says m is the rank of the subspace; it should be its dimension minus one; affects nothing.

## For the human reviewers

- **Ordering.** RealSemisimpleLieGroups, supplier of §§3.1 and 5.2–5.7, is an open new-roadmap pull request and is absent from `merge-order/ORDER.txt`; the gate placed this roadmap after ShimuraData without testing that edge.
- **Licence.** Mok2012 was read as the HKU IMR preprint IMR2009-4 (`sources.toml`, licence class author-page), not as the published chapter; its numbering was not compared with the printed volume.
- **Not tested.** Goldman1999 and eight other uncertified or waived works were not compared for wording; BaldiUllmo2023, the largest-share source, was read and compared.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "384bb15519d633fdf917860b869eeece3364e9da", "job": "REV-DESIGN-BallQuotientsAndComplexHyperbolicLattices~9", "model": "fable", "worker": "chris-x82"} -->
