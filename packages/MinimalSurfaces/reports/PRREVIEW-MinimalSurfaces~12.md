# Review of MinimalSurfaces (pull request #2491 at 89b898c)
Folder: `TauCetiRoadmap/RiemannianGeometry/MinimalSurfaces/`
**Verdict:** needs changes

**Summary.** Needs changes, for one finding: the Reduction in the new item 7.8 gives the constant `κ = ½ min(λ, (1 + c₀/λ)⁻¹)` without requiring `c₀ ≥ 0`. When `c₀` is negative, which an ambient manifold of negative Ricci curvature allows, that constant is negative or undefined. The rest of 7.8 checks out: the cone criterion, the Hardy inequality, the scaling and comparable-weight laws, and every Check. There are four small corrections: the without-boundary convention that the half-plane Check needs, a locator for the stable half of the cone criterion, the Chodosh locator of 6.1, and three sentences of the description. There is also one format note. The humans have four facts to weigh: a licence class, an unrefereed preprint, the absence of any consumer of 7.8, and a source that could not be tested.

## R01 (P2) — The Reduction of 7.8 needs `c₀ ≥ 0`: for negative `c₀` its constant `κ = ½ min(λ, (1 + c₀/λ)⁻¹)` is negative or undefined

As written, the Reduction admits any constant `c₀` (README lines 1703–1707). Anyone who formalises it as stated gets a false statement, because the definition of strict stability requires `κ > 0`. Take the totally geodesic `ℍ² ⊂ ℍ³` with weight `w ≡ 1`. Then `|A|² + Ric(ν,ν) = −2 ≤ c₀ w⁻²` with `c₀ = −2`, and the weaker inequality holds with `λ = 1`, since it reads `−∫ζ² ≤ ∫|∇ζ|²`. The formula then gives `κ = ½ min(1, (1 − 2)⁻¹) = −½`, and at `λ = 2` it divides by zero. Yet `κ = 1` works, because `Q(ζ) = ∫|∇ζ|² + 2∫ζ²`. The step that fails is the second inequality of the route, `c₀∫w⁻²ζ² ≤ (c₀/λ) Q(ζ)`. It multiplies `Q(ζ) ≥ λ∫w⁻²ζ²` by `c₀/λ`, which preserves the direction only when `c₀ ≥ 0`.

The smallest repair is to write "If `|A|² + Ric_g(ν,ν) ≤ c₀ w⁻²` on Σ for some `c₀ ≥ 0`". The cone application already has `c₀ = max |A_Γ|² ≥ 0`, so nothing downstream changes.

## C01 — The convention for the singular set needs "without boundary", or the half-plane Check has no singular set

The Conventions let a submanifold have boundary (line 122). Read that way, the closed half-plane is a smooth embedded hypersurface near its edge. The convention of 7.8 (lines 1665–1669) would then put the line `{x₂ = x₃ = 0}` into Σ. The Check "Test functions must cross the singular set" (line 1737) would then concern a hypersurface with boundary and an empty singular set. The source excludes this reading: Simon23 line 73–76 defines a smooth embedded hypersurface through open parameter domains, so it has no boundary. The fix is to write "a smooth embedded two-sided hypersurface without boundary in U" at line 1665, and "near which `Σ̄` is a smooth embedded hypersurface without boundary" at line 1668.

## C02 — The stable half of the cone criterion has no locator

The item claims that C is stable iff `λ₁ + ((n−2)/2)² ≥ 0` (lines 1713–1714) and cites [Simon21, 1.1–1.5]. Simon states only the strict version there: 1.4 is equivalent to 1.5 (Simon21 line 65–77). The non-strict statement is Simons' criterion, as given in [Chodosh, Proposition 26.1, p. 64] (Chodosh line 2840–2843). Chodosh states it for test functions that vanish near the vertex and remarks that a cutoff extends it. Adding that locator to the Cones bullet would cover this half.

## C03 — 6.1 cites [Chodosh, §24], which contains no Morse index

The sources line of 6.1 (line 1188) cites §24, but that section holds Corollary 24.1, the doubly traced Gauss equation and the Schoen–Yau theorem (Chodosh line 2683–2743). The notes define no index anywhere. The index form of 6.1 is the second-variation formula in arbitrary codimension, [Chodosh, Theorem 23.2, p. 60] (Chodosh line 2663–2668). Cite that instead, or drop the Chodosh locator.

## C04 — Three sentences of the description do not match the head

- "as a new section 7.8 beside the stability theory and positive Jacobi functions it uses": 7.8 uses Q, 6.3, MS1 (a) and a Hardy inequality proved in place (README lines 388–390 and 1745–1746). It uses no positive Jacobi function. This would read "beside the stability theory it uses".
- "strict stability with a weight: the form dominates a positive multiple of the weighted L² norm": the head's definition bounds Q from below by `κ∫(|∇ζ|² + w⁻²ζ²)` (lines 1677–1681). The L² version is the weaker inequality of the Reduction, and the two agree only under its curvature bound. This would read "a positive multiple of `∫(|∇ζ|² + w⁻²ζ²)`".
- "the first eigenvalue of the link's Jacobi operator": the head uses `−Δ_Γ − |A_Γ|²`. The Jacobi operator of Γ in Sⁿ also carries `Ric_(Sⁿ)(ν,ν) = n − 1`, which would move the threshold. This would read "the lowest eigenvalue of `−Δ_Γ − |A_Γ|²` on the link".

## N01 — The docstring of `Suggested.lean` lists 7.8 among "the other headlines of `README.md`" (lines 35–38), but the README's summary (lines 3–12) names no result of 7.8 as a headline. One of the two would say which it is.

## Verified sound

| Statement | Instance | Roadmap side | Computed side | Result |
|---|---|---|---|---|
| 7.8 Reduction, κ formula | totally geodesic `ℍ² ⊂ ℍ³`, `w ≡ 1`, `c₀ = −2`, `λ = 1` | `κ = ½ min(λ,(1+c₀/λ)⁻¹)` works | `½ min(1,−1) = −½`; at `λ = 2`, `0⁻¹`; true κ = 1 | fails for `c₀ < 0`: R01 |
| 7.8 Reduction, `c₀ ≥ 0` | any ζ | `κ = ½ min(λ,(1+c₀/λ)⁻¹)` | `Q ≥ (1+c₀/λ)⁻¹∫|∇ζ|²` and `Q ≥ λ∫w⁻²ζ²`; averaging gives κ | holds |
| 7.8 cone criterion, Simons cone | n = 7, `Γ = S³(1/√2)×S³(1/√2)` | `λ₁ + 25/4 = 1/4` | curvatures ±1 (3 each), `|A_Γ|² = 6`, `λ₁ = −6`; Simon21 line 339–342: β = 1 | holds |
| 7.8 cones `C_(p,q)` | n = p+q+1 | `(n²−8n+8)/4` | `|A|² = p·q/p + q·p/q = n−1`; n = 3: −7/4, 6: −1, 7: 1/4 | holds |
| 7.8 weighted Hardy | `f ∈ C¹_c([0,∞))`, n ≥ 3 | constant `((n−2)/2)²` | cross term `= −2H∫f²r^(n−3)`; boundary term `f(0)²·0^(n−2) = 0` | holds |
| 7.8 substitution `u = r^((n−1)/2) f` | f vanishing near 0 | gives UO-D07's half-line Hardy | `∫f′²r^(n−1) = ∫u′² + (b²−b)∫u²/r²`, `H − b² + b = ¼` | holds |
| 7.8 sharpness | truncations of `r^(−(n−2)/2)φ₁` | converse directions | Hardy ratio tends to H; `λ₁+H < 0` gives `Q < 0`, `= 0` no λ | holds |
| 7.8 plane, n = 2 | ζ(0) ≠ 0 | not strictly stable | `∫|X|⁻²ζ² ≈ 2πζ(0)²∫dr/r = ∞` | holds |
| 7.8 hyperplane, n ≥ 3 | n = 3 | strictly stable | `κ = H/(1+H) = (1/4)/(5/4) = 1/5` | holds |
| 7.8 half-plane | weight `|x₂|`, ζ off the line | `κ = 1/5` | `∫x₂⁻²ζ² ≤ 4∫|∇ζ|²`, so `κ(1+4) = 1`; on the line `∫_0 x₂⁻² = ∞` | holds; convention C01 |
| 7.8 one-sided | `ℝP² ⊂ ℝP³`, ζ = 1 | `2·2π > 0` | `(0 + 2)·Area = 2·2π = 4π` | holds |
| 7.8 comparable weights | `w′ = |x|+|ξ|`, w = distance, b = √2 | κ min(1, b⁻²) | `w⁻² ≤ b²w′⁻²`; κ/2; `√(a²+b²) ≤ a+b ≤ √2√(a²+b²)` | holds |
| 7.8 scaling | `x ↦ tx`, w homogeneous | factor `t^(n−2)` | each term: `t⁻²` (integrand) times `tⁿ` (measure) | holds |
| 7.8 stable half of criterion | locator | [Simon21, 1.1–1.5] | Simon21 line 65–77 strict only; Chodosh line 2840 Prop. 26.1 non-strict | C02 |
| 7.8 C¹ test functions | `ζ_k → ζ` in C¹ | admissible | Fatou on `|A|²ζ²`, `w⁻²ζ²`; bounded convergence on `|∇ζ|²`, Ric term | holds |
| 2.3 `M_g` | `u = ½|x|²` | `(n+(n−1)|x|²)/(1+|x|²)^(3/2)` | `div(x(1+r²)^(−1/2)) = (n(1+r²)−r²)/(1+r²)^(3/2)`; Chodosh line 3411–3414 | holds |
| 2.3 non-flat metric | `e^(2at)(dx²+dt²)`, `t⁻²(dx²+dt²)` | `−nae^(−at₀)`, n | `H = e^(−φ)(H₀ − n∂_νφ)` with φ = at, φ = −log t | holds |
| 3.3 convex hull | catenoid, `|x₃| ≤ h` | in `{ρ ≤ cosh h, |x₃| ≤ h}` | `ρ = cosh x₃ ≤ cosh h`; Chodosh line 1236–1243 | holds |
| 3.4 small ball | `S^m`, κ = 1; `ℝ²/ℤ²` | `r < π/2`; inj ½ | `cot r > 0` iff `r < π/2`; loop of length 1 has far point at ½; CM4 line 974–977 | holds |
| 3.5 mean value | line, `u = cos(√a x)` | `C ≥ √aR/(2 sin √aR)` | `∫u = 2 sin(√aR)/√a`; limits ½ (a → 0) and π/4 | holds; [CM] unread |
| 4.1 barriers | λ = 1/100, ρ = 1 | height 0.0530 | `0.01·log(100+√9999) = 0.05298`; Chodosh line 2405–2415 | holds |
| 6.1 index | `S²_eq ⊂ S³` | index 1, nullity 3, `Q(a+bx₁) = −8πa²` | `j(j+1)−2`: −2, 0 (×3), 4; `−∫(a+bx₁)·2a = −8πa²` | holds; C03 |
| 6.3 one-sided | `ℝP² ⊂ ℝP³` | index 0 | odd j: `j(j+1)−2 ≥ 0`; constant is τ-even | holds |
| 6.4 | `S²_eq`; Clifford torus | `Q(1) = −8π`, `−8π²` | `(0+2)·4π`, `(2+2)·2π²`; Chodosh line 2685–2691 | holds |
| 7.4 constant | c = ⅓ | `2q²+⅓s² − (6/5)Q² = (1/5)(2q−s)²` | `(4/5)q² − (4/5)qs + (1/5)s²`; Lynch line 468–530 | holds |
| 7.4 half-catenoid | u = tanh v | `dist²(q+s) ≤ 1` | `q = 1/(sinh²v cosh⁴v)`, dist = sinh v: `(2cosh²v−1)/cosh⁴v`; `(cosh²v−1)² ≥ 0` | holds |
| 7.5 half-catenoid | stable by 7.3 | `≤ ½` at sinh v = 1 | `2x/(1+x)² ≤ ½ ⇔ (1−x)² ≥ 0`, x = sinh²v | holds |
| 7.7 | planes `x₃ = ±1/i` | multiplicity 2, h = 1 | Chodosh line 3438–3440, 3475–3480, 3557–3572 | holds |
| 8.1 radii | `r = s/2`, `σ = s/4` | `B_(s/2)(x) ⊂ B_(3s/2)(p) ∖ B_(s/2)(p)` | triangle inequality; hypotheses match Chodosh line 3352–3354 | holds |
| 10.2 | Clifford torus, k = 2 | `λ₁ = 2 ≥ 1` | `−Δ = −2(∂θ²+∂ψ²)`: `2(a²+b²)`; Chodosh line 3687–3719 | holds |
| 10.4 | hexagonal torus | `8π²/√3 ≈ 45.59 ≤ 16π` | dual shortest vector `2/√3`, `λ₁ = 16π²/3`, area `√3/2`; YangYau line 43, 114 | holds |
| 10.5 | flat `T³`, plane `px₁+qx₃ = 0` | area `√(p²+q²)` | lattice basis `(0,1,0)`, `(q,0,−p)`, cross product norm `√(p²+q²)`; Chodosh line 3787–3791 | holds |
| 4.2 `range_eq_plane_of_minimal_of_nonneg` | plane `x₃ = c ≥ 0` | conclusion with c | harmonic coordinates, proper, image `{y 2 = c}` | holds |
| 5.1 `exists_sq_mul_hessianCoordNormSq_le_lintegral` | catenoids λ𝒞 | ε < 8π | `∫|A|² = 4π∫sech²v dv = 8π`; `2σ²/λ²` unbounded | holds |
| 7.5 `exists_sq_mul_hessianCoordNormSq_le_of_stable` | plane | `R²|A|² ≤ C` | `|A| = 0`; metric tied by `IsRiemannianManifold` | holds |
| 7.6 `exists_affine_of_minimalSurfaceEquation` | `u = xy`, `x²−y²` | not solutions | left side `−2xy`, `8(y²−x²)` | holds |
| 10.3 `herschMap` | `a = (0,0,3/5)`, `x = e₁` | `(4/5,0,3/5)` | `√(1−9/25) = 4/5`, `⟨a,x⟩ = 0` | holds |
| MS9 opening | Clifford torus | equality in the bound | `C_g = 2`; `2·2π² = 2·2π² − 0` | holds |
| 11.1 | spheres of radii 1, 2 | `d²L/ds² = ½` | `L = √(5−4cos(s/2)) = 1 + s²/4 + …`; endpoint terms `−½ + 1` | holds |
| 12.1 | `ℝP³`, d = 2 | genus `2γ−1` | `γ̃ − 1 = 2(γ − 1)` | holds |
| Description, 7.8 inputs | "positive Jacobi functions it uses" | Q, 6.3, MS1 (a), Hardy | README lines 388–390, 1745–1746 | C04 |

- Earlier findings: the previous report, for the head 664cc10 of another pull request, raised none, so there is nothing to repair here.
- Source locators read against the text: 29, all of the seeded sample except [CM], [Simons], [FCS], [SY], [ChoiSchoen] and [ChoiWang]. They comprise Simon23 (p. 3, 1.2, 4.12), Simon21 (1.1–1.5, 1.4, §3 p. 8), Chodosh (Theorem 32.5, Corollaries 8.2–8.3, Theorem 20.1, Corollary 19.6, §14, §§23–24, Corollary 24.1, Proposition 26.1, Theorem 33.1, Propositions 33.3–33.4, §32, Theorems 34.3 and 34.5, §34.3), Lynch (Theorem 1.1, Proposition 4.1, Proposition B.1), YangYau (Theorem 1 on p. 55, Proposition on p. 58, p. 59) and CM4 (Lemma C.1).
- Pinned declarations opened: `TauCeti.Manifold.laplaceBeltrami` (`TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean:238`), `TauCeti.Manifold.hessian` (same file, line 135), `TauCeti.riemannianVolume` (`VolumeDensity/Volume.lean:82`), `TauCeti.Manifold.mgradient` (`Gradient/Basic.lean:73`) and Mathlib's `MeasureTheory.lintegral_liminf_le` (`MeasureTheory/Integral/Lebesgue/Add.lean:237`), which is Fatou's lemma for the C¹ step of 7.8.
- Cross-roadmap citations resolved: R5a.2 on main (`RiemannianGeometry/README.md` line 3399, the minimal-cone equivalence), UnboundedOperators §4.8 (UO-D07) on main (half-line Hardy inequality), R5b and MS1 (a). The parent is unchanged by this pull request.
- Ownership of strict stability: Varifolds 9.4 on main (line 2114) leaves Simon's strict stability to RiemannianGeometry, and a search of main and every open head for strict stability, minimal cones and the Simons cone finds no other statement of it. So 7.8 is its single owner.
- Automatic checks: the gate was run on this head and every check reports 0. The dependency check printed `depcheck: 215 roadmaps, 2310 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 5 `sorry` warnings and nothing else. The 7 elaborated signatures match their README statements and none lost a binder. The Lean file changes only in its docstring.
- Padding probe: done by reading. The five theorems are deep results that no single tactic closes, and the two definitions (`hessianCoordNormSq`, `herschMap`) are needed to state them.
- Nothing outside the folder changes against the base.

Overlap check: I read GeometricCurrents (its open revision and main), PDE, LorentzianGeometry, HeegaardFloer and ManifoldOptimization (open), and RiemannianGeometry, Surfaces and PositiveMass (main), plus Varifolds and UnboundedOperators (main), found by object. Objects they share with this roadmap, and their owners:
- The minimal-cone equivalence: RiemannianGeometry R5a.2, which 7.8 cites.
- The half-line Hardy inequality: UnboundedOperators UO-D07. 7.8 proves the weighted form that allows `f(0) ≠ 0` and says that it does not consume UO-D07.
- Simons' classification of stable minimizing cones and the Simons cone's stability: GeometricCurrents G6–G7. In 7.8 the Simons cone appears only as a Check.
- The singular set under Simon's convention: Varifolds 9.1 defines `sing^∞` of a varifold, which is the same set for `[Σ]`, and neither roadmap consumes the other.

No open pull request changes this roadmap or drops an id it cites.

Source independence: 15 passages compared with 6 sources (Simon23, Simon21, Chodosh, Lynch, YangYau, CM4): the singular-set convention, the definition of strict stability, the Reduction, the cone criterion against both Simon21 and Chodosh Proposition 26.1, the Simons cone Check, and the routes of 7.4, 10.2, 4.2, 8.1, 6.4, 3.3, 10.4, 3.4, 2.3 and 7.7. No wording is shared beyond formulas and standard terms; 7.8's routes for the Reduction (averaging) and the cone (eigen-expansion with Hardy) differ from Simon's θ-absorption and Chodosh's `t = log r`. The largest share is Chodosh, with 57 of 167 bracketed locators. Comparing the layers with Chodosh's contents (MS3 ↔ §§8–9, MS4 ↔ §20, MS5 ↔ §§28–30, MS6 ↔ §§23–24, MS7 ↔ §§25, 33, MS8 ↔ §32, MS9 ↔ §§31, 33, MS10 ↔ §34.1–34.2, MS11 ↔ none, MS12 ↔ §34.3) shows they are independent: the order differs, MS11 and 7.8 have no counterpart, and MS8 coming before MS9 is forced by the *Needs:* line of 9.1.

Research link: 7.8 is the strict stability of Simon (Simon21, Theorem 1.10, 2021; Simon23, Theorem 1.1, 2023), which he uses to construct strictly stable minimal hypersurfaces with an arbitrary closed singular set `{0}×{0}×K`. Layers 9–12 lead to the Choi–Schoen compactness theorem (1985), and 7.4–7.5 to Schoen's curvature estimate (1983). This rests on the README and on Simon21 and Simon23, which I read.

## Not verifiable

- [CM] (AMS GSM 121): no legal copy exists, so the locators of 3.5, 6.1, 6.3 and 7.7 into it remain unread.
- [Simons] (Annals 1968, JSTOR) and [FCS] (Comm. Pure Appl. Math.) are paywalled, so the locators of 6.1 and 6.3 into them remain unread.
- [SY] (Manuscripta Math.) is paywalled and the arXiv search was rate-limited; 6.4 was checked against Chodosh Corollary 24.1 instead.
- [ChoiSchoen] (Invent. Math.) is paywalled, so the locators of 8.1 and 10.5 into it remain unread.
- [ChoiWang]: Project Euclid returned only a landing page; 10.2 was checked against Chodosh Theorem 34.3.
- [CM4]: I read arXiv:math/0210119v1, but the README cites the Annals version, whose appendix numbering I could not compare.

## Source issues

- **Misprint** in Simon23 at Theorem 1.1, p. 3: the source repeats the word "and" before the clause on the singular set; it should appear once; affects nothing.
- **Misprint** in Simon21 at the running head of the odd pages (for example p. 3): the source spells the name in the title as "Louville"; it should be "Liouville"; affects nothing.
- **Gap** in Chodosh at Theorem 34.3, p. 83: the source assumes only that M is orientable with `Ric ≥ k` and that Σ is two-sided minimal; it should also assume M and Σ closed and Σ embedded, which the proof uses to separate M; affects nothing.

## For the human reviewers

- Licence: [Chodosh] was fetched from the author's Stanford page (web.stanford.edu/~ochodosh), a host the sources service does not classify. It was classified as author-page, as in earlier reviews.
- Scope: the route of 7.4 follows [Lynch], an unrefereed preprint (arXiv:2611.12758v1, 2026). The theorem that route serves, 7.5, is Schoen's published estimate.
- Scope: no item of this roadmap consumes the new 7.8 (README lines 1745–1746, 1763–1764 and 2395–2399). The uses its sources name are Simon's (Simon21 Theorem 1.10, Simon23 Theorem 1.1).
- Not tested: [CM], with 31 of 167 locators (the second-largest share), has no legal copy, so parts 1 and 2 were not checked against it.
