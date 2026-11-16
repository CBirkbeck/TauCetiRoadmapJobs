<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13810#issuecomment-6903946467 -->
Review (claude) of b670e40

Verdict: accepted

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

No finding. The one round-16 finding is repaired, the pattern repairs of the fix round hold, and
no false, vacuous, unowned or overclaimed statement was found in a full read of the README. No
gap is declared and none is needed (`gaps: []`, no `gap:` prerequisite). This review changed no
design file, plan or manifest entry. Maintainer notes: none were supplied.

## Previous finding and its repair

| Round-16 finding | Repaired passage | Assessment |
|---|---|---|
| F01 (P3): 6.3's `*Needs:*` line omits 5.2 | `design/README.md` 6.3, line 1558: "*Needs:* 1.4, 2.1, 3.1, 3.2, 3.6, 5.2, 5.5; RiemannianGeometry R5a (`B = 0` is equivalent to total geodesicity); …"; Layer 6 Dependencies, line 1651: "6.3 uses 1.4, 2.1, 3.1–3.2, 3.6, 5.2, 5.5, RiemannianGeometry R5a and …"; plan 6.3.1 and 6.3.2 list `target:5.2` | **Repaired.** Witness recomputed: `n = 0`, `R = 3π/4`, the geodesic `θ + t` stays in `{ǀθǀ ≤ 3π/4}` for `t ≤ 3π/4 − θ`, so 5.2's realisation formula gives `τ(θ, +1) = 3π/4 − θ`. |

The fix round also added the same kind of entry elsewhere. Each was checked against the text of
its section: 2.3 now lists 1.5 (line 629; "every principal curvature is at least `c`"); 3.2 lists
1.3 (738); 4.6 lists 1.3, 1.4, 2.1 (1180); 5.2 lists 2.1 (1277); 5.5 lists 2.1 (1400); 5.6 lists
2.1, 4.1 (1428); 6.1 and 6.2 list 5.1 (1485, 1512); 6.4 lists 1.3, 2.1, 5.2 (1601); 6.5 lists 1.4
(1642). The Dependencies paragraphs of Layers 2–6 agree with these lines. The R5a contract (line
279) now carries "`B = 0` exactly when the immersion is totally geodesic", which is on main at
`TauCetiRoadmap/RiemannianGeometry/README.md` lines 3260 and 3392. The reworded 1.6 bullet (lines
515–516) no longer uses 2.1's later notion.

The repaired pattern was sought in every other section (a notion of an earlier section named in
a statement, hypothesis or route whose section is not listed): 1.1–1.6, 2.1–2.2, 3.1, 3.3–3.6,
4.1–4.5, 5.1, 5.3, 5.4 read line by line against their `*Needs:*` lines; no further omission.
The Conventions' vocabulary (`ν_in`, `ν_out`, `T_q∂M`, `h`) and the layer preambles are not
repeated in each line, consistently throughout.

## Verified sound

**Coverage.** All 1,693 lines of the README were read this round and its formulas and Checks
recomputed by hand. The plan was checked by script: 6 layers, 49 targets, every `target:`
prerequisite exists and precedes its user (0 violations), every definition and construction has
at least three tests, every target has a locator, `gaps: []`. A section-by-section comparison of
the README `*Needs:*` lines with the plan's internal prerequisites shows no difference (two script
hits, 1.2 and 3.3, are supplier section numbers `12.2`, `12.5`, `1.1`, `1.3` read as internal
ones). Pattern search of the README: no LaTeX delimiter, pull-request number, machine path, HTML
anchor, `set_option`, round label or process word; the word "lemma" occurs only in names of
results (Gauss lemma, Lemma 3.1.12, tube lemma). Each layer ends with Examples and Dependencies.

**Dependency check, exact output:**

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 234 roadmaps, 2227 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. No supplier is on the never-cite list. The citation resolver's
list for this README is empty.

**Supplier citations resolved on main** (content checkout at `818115d7`):
`TauCetiRoadmap/RiemannianGeometry/README.md` line 156 (standing setting: Hausdorff,
second-countable, boundaryless), 191 (averaged `H=(1/m)tr B`, outward unit sphere `B=−g` times
position), 1576 (2.2, R1.4), 3205 (R5a), 3260 and 3392 (`B=0` iff totally geodesic), 3266
(`B(X,Y)=−⟨X,Y⟩ν` on the outward unit sphere), 3715 (R5c), 3751–3753 (relatively compact smooth
domain, half-space `x_m>0`), 3873 (K5a's Seeley extension of the metric), 3886–3887 (`Dᵢ={ρᵢ<0}`,
regular value 0, `{ρᵢ≤0}` compact, `ρ₂=−1` for closed `M`), 4469 (R7.9; "M is second countable,
as everywhere"), 4590–4596 (outward exactly when `dφ(dι v)>0`; the outward normal is `ν` on `D₋`
and `−ν` on `D₊`); `RiemannianGeometry/Surfaces/README.md` 296–327 (normal strips,
`a_tt + K a = 0`, `a(s,0)=1`, `a_t(s,0)=−k_g`, circle `a = 1 − t/ρ`);
`DifferentialGeometry/README.md` 414 (5.1, `TauCeti.exists_isOutwardPointingField`), 419 (12.1,
`TauCeti.nonempty_contMDiffRiemannianMetric`), 2796 (Layer 12), 2950 (12.5's
`exists_halfSpaceOutwardUnitNormal`; `Suggested.lean` 1020); `GeometricTopology/README.md` 785
(Layer 1: Hausdorff and second countable), 788 (1.1), 809 (the interior), 815 (the interval collar
`(0, t) ↦ t/2`, `(1, t) ↦ 1 − t/2`, which 3.3's Check uses), 851 (1.3), 856 (`∂M × (−1, 1)`), 866
(connected when both pieces are and `∂M ≠ ∅`), 871 (the double, closed exactly when `M` is
compact); `ComplexKahlerGeometry/README.md` 1440 (5.1, K5a), 1796 (the half-space Seeley
extension); `SmoothBundlesConnections/README.md` 1306 (B6.0, whose second paragraph exports
"positive uniform normal and strong-convexity radius bounds on each compact set", with
`IsNormalDomain` on every tangent ball of that radius); `Completed/HopfRinow/README.md` 264
(Layer 1), 427 (Layer 2); consumers `PositiveMass/README.md` 921, 951–960 (averaged `tr A/(n−1)`
for the inward normal, the convention of 1.5) and `AffineMorseLefschetz/README.md` 819, 841.

**Pinned declarations.** The 93 backticked identifiers of the README were sought at the pinned
Mathlib and Tau Ceti by script: every library name resolves; the 17 that do not are mathematical
symbols (`II_q`, `h_r`, `K_c`, …) and `exists_halfSpaceOutwardUnitNormal`, a DifferentialGeometry
target cited as such. Opened this round: `TauCeti/Geometry/Manifold/RegularValue/Scalar/Sublevel.lean`
lines 16–21 and 473–474 (`scalarRegularSublevelChartedSpace : ChartedSpace (EuclideanHalfSpace
(n + 1)) {x | f x ≤ a}` for a boundaryless manifold modelled on `E` with `dim E = n + 1`, which is
3.1's setting; boundary `f⁻¹(a)`; it states nothing about the inclusion, which is why 3.1 takes
that from R7.9). The README attributes no backticked Lean name to this roadmap.

**Seeded source sample** ("book" = paternain-salo-uhlmann2023, "article" =
stefanov-uhlmann-vasy2021, "UV" = uhlmann-vasy2016; cached texts read this round). The author
flagged no locator as unverified.

| Target | Locator read | Result |
|---|---|---|
| 1.1 | book lines 2684–2696 | strata by the sign of `⟨v, ν⟩` with `ν` inward (2688), `∂₀SM = S(∂M)` (2696); as cited |
| 1.4 | book lines 2728–2737, 2781–2784; article line 53 | `Π_x(v, w) = −⟨∇_v ν, w⟩`, independent of the extension; `−Π = Hess ρ` on glancing vectors; positivity; as cited |
| 1.5 | lee-riemannian2018 Ch. 8 | not readable (uncertified); the averaged convention agrees with RiemannianGeometry 191 and PositiveMass 951 |
| 1.6 | book lines 2462–2473 | Lemma 2.5.2: `{r = r̄}` strictly convex iff `b′(r̄) > 0`, cited "in the rotationally symmetric case" only; the general law rests on lee-riemannian2018 (uncertified) and the README's route, recomputed below |
| 2.2 | book lines 2781–2784, 2838–2841; UV lines 499–503 | Lemma 3.1.12 and the equivalence at 2840–2841; covector form at 503; as cited |
| 3.1 | article lines 96–97; UV lines 25–26; book 2770–2772 | `M` not necessarily compact inside a boundaryless extension; `ρ > 0` inside, `< 0` outside; `M = {ρ ≥ 0}`; as cited |
| 3.2 | article lines 128–129, 198–200, 203–205; UV 137–140, 507–509 | "strictly concave from the superlevel sets" (129, 199–200); the distance-function example (203–205); UV's concavity from the side of the superlevel sets (508–509); as cited |
| 3.4 | book lines 2755–2762 | the source extends the metric only for subsets of `ℝⁿ` and leaves the general case to the double; the README's statement and route are its own, the locator is for the fact |
| 4.1 | book lines 2646–2658, 2763–2765 | maximal interval of a geodesic in `M`; geodesics of a closed extension; as cited |
| 4.2 | book lines 2801–2828, 2781–2784, 2841–2844, 2795–2798; UV 499–503 | the three derivatives of Lemma 3.1.13 (source: normalised `ρ`; README carries `ǀdρǀ`); Taylor expansion at 2842; leaving and no interior tangency at 2795–2798; as cited |
| 4.5 | UV lines 30–32, 504–524; article 128–134 | `x̃ = −ρ − ε|z − p|²` (512), the uniform bound (505–506), compactness of `{x̃ ≥ −c, ρ ≥ 0}` (513–514), `O_c` (523–524); as cited |
| 5.1 | book lines 2646–2648, 2682–2696, 2931, 3063–3079; article 151–153 | `SM`, `∂±SM`, `μ`, flow and generator; the article's opposite labels and `L : ∂₋SM → ∂₊SM`; as cited |
| 5.3 | book lines 2970–2982, 3039–3041, 3044–3045 | Lemma 3.2.10 as stated; Exercise 3.2.12 has no parameters and is used with them at 3039–3041, as the README says; `∂_r Q(0, y₀) > 0` is the README's addition |
| 5.5 | book lines 3081–3106 | Proposition 3.3.1 (compact, strictly convex boundary; (i)–(iii)); the proof's enlargement `M₁` is 4.6's `M_δ`; the first two bullets (no convexity; Hessian criterion) are the README's own, derived below |
| 6.3 | book lines 2499–2521, 2677–2680 | small caps satisfy Herglotz, large caps trap the equator; compact hyperbolic subdomains non-trapping; `cot R`, `u`, `coth R` are the README's own |

Also read at their locators: 2.1 (book 2449–2461, 2738–2739; article 89–93), 3.5 (book 2749–2762),
5.2 (book 2659–2676, 2849–2861), 5.4 (book 2865–2867, 2935–2937, 3027–3030, 3046–3055), 5.6 (book
3114–3127), 6.1 (book 307–310), 6.5 (article 66–72; book 2462–2481), Conventions (book 2642).

**Adversarial table** (values computed this round: the sampled targets, the headlines and the
passages the fix round changed).

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.1 trichotomy | half-space `n = 1`; `[0, 1]` at `0` | `dx⁰(−e₀) = −1` outward, `dx⁰(e₁) = 0` tangent, `dx⁰(e₀) = 1` inward; `T_q∂M = 0`, `t ↦ t` has derivative `+1`, inward | holds | none |
| 1.4 descriptions | ball radius `R`; exterior; half-space; `n = 0` | `−(−2g)/(2R) = h/R`; `−(2g)/2 = −h`; `0`; with `N = x`, `⟨∇_u x, w⟩ = ⟨u, w⟩`; with `ν_in`, `−h` | agree; the inward-normal variant fails the ball witness | none |
| 1.5 `S`, `H` | unit sphere; cylinder; exterior | `S = id`, `H = 1`; eigenvalues `1, 0`, `H = 1/2`; `−1` | holds; matches R5a's averaged trace | none |
| 1.6 conformal law | derivation; `φ = log 2`; disc `φ = −ǀxǀ²`; `φ = (ǀxǀ² − 1)²` | on `T∂M`: `Hess_ĝ ρ = Hess ρ + ⟨grad φ, grad ρ⟩g`, `ǀdρǀ_ĝ = e^{−φ}ǀdρǀ`, so `II^ĝ = e^φ(II − dφ(ν_in)h)`; `2h`; `dφ(−x) = 2`, `e^{−1}(1 − 2)h`, `Ĥ = e(1 − 2) = −e`; `h`; `Ŝ = e^{−φ}(S − dφ(ν_in))` from `ĥ = e^{2φ}h` | sign as stated; circumference `2πr e^{−r²}` decreases at `r = 1`, consistent with concavity | none |
| 1.6 reworded bullet | `φ ≡ log 2`; `φ = −ǀxǀ²` | `2h` against `h`, same sign; `dφ(ν_in) = 2 ≠ 0`, `−e^{−1}h`: sign flips, so the hypothesis is used | holds | none |
| 2.1 predicates | `{y ≥ x³}`; `n = 0` | `Hess ρ(t, t) = −6x/(1 + 9x⁴)`, `ǀdρǀ = (1 + 9x⁴)^{1/2}`, `II = 6x/(1 + 9x⁴)^{3/2}`; both strict conditions vacuous | holds; exclusion needs `n ≥ 1`, as stated | none |
| 2.2 Hessian iff (headline) | ball with `ρ` and `(2 + x₁)ρ`; exterior; `n = 0` | `−2h`; `−2(2 + x₁)h`, factor in `[1, 3]`; `+2h`; no nonzero tangent vector | both directions hold | none |
| 2.3 uniform bound | hyperbola epigraph; ball; `[−1, 1]`; `∂M = ∅` | `y″/(1 + y′²)^{3/2} = (1 + 2x²)^{−3/2} → 0`; `c = 1`; every `c`; every `c` | compactness needed, as stated | none |
| 3.1 regular domains | `(2 + x₁)(1 − ǀxǀ²)`; `x₀² − x₁²` | at `x₁ = −3`: `(−1)(−8) = 8`; `{ρ′ ≥ 0}` = ball ∪ `{x₁ ≤ −2}`; on `x₁ = −2`, `dρ′ = (1 − ǀxǀ²)dx₁ ≠ 0`; `dρ = 0` at the origin | holds | none |
| 3.2 sublevel sets | `ǀzǀ²`, `c > 0`; `c = 0`; affine `x`; `n = 0` | `II = 2h/(2√c) = h/√c`; critical value; `Hess = 0`; `ker dx = 0`, vacuous | holds | none |
| 3.3 `ρ̃ = φ₀χ(t) + φ₁s` | `t > 0`; `t < 0`; near `∂M`; `[0, 1]` | both terms `≥ 0`, sum `> 0`; both `≤ 0`, sum `< 0`; `φ₁ = 0`, `ρ̃ = χ(t) = t`, `dρ̃(∂_t) = 1`; `t = 2x`, `M̃ = (−1/2, 3/2)`, slope `2` | regular value `0`, `M = {ρ̃ ≥ 0}` | none |
| 3.4 extension | `√x`; `(x + 1/100)dx²`; `ψ g_ext + (1 − ψ)g_N` | derivative unbounded at `0`; positive iff `x > −1/100`; convex combination of positive forms where `ψ > 0` | holds | none |
| 3.5 realisation (headline) | disc with radial collar; `[0, 1]`, `(1 + x)²dx²`; closed `M`; `M = ∅`; doubled point | `ρ̃ = 2(1 − ǀxǀ)` on `3/4 < ǀxǀ < 5/4`; length `3/2`; `ρ̃ ≡ 1`; empty domain; non-Hausdorff, no realisation | holds | none |
| 3.6 comparison | unit sphere; cylinder; exterior | `⟨−⟨X,Y⟩x, −x⟩ = ⟨X, Y⟩`, `K = 0 + 1·1 − 0 = 1`; `0 + 1·0 − 0 = 0`; `⟨B, +x⟩ = −h` | holds with R5a's Gauss sign | none |
| 4.1 geodesics of a domain | ball, `q ∈ S^n`, `v ⊥ q`; `v = 0`; outward `v` | `ǀq + tvǀ² = 1 + t²ǀvǀ² > 1`; constant curve on `ℝ`; a `C¹` curve on `[0, ε)` in `M` has inward or tangent derivative | holds | none |
| 4.2 second-order contact (headline) | ball; exterior; `{y ≥ x⁴}`; `[0, 1]` | `ρ(q + tv) = −t²`, `−ǀdρǀ II = −2`; `+t²`; `−t⁴` with `II = 0`; an interior boundary time is a minimum of `ρ ∘ γ`, so tangent, so `γ′ = 0` when `T_q∂M = 0` | iff holds; leaving does not give strict convexity | none |
| 4.3 `ρ̂ = ψr + (1 − ψ)s` | `W₁`; `M ∖ W`; `W ∖ M` with `r < −δ`; closedness | `ψ = 1`, `ρ̂ = r`; `ψ = 0`, `s = 1`; both `r` and `−1` are `< −δ`, so `ρ̂ < −δ`; `M ∪ W₁ = int M ∪ W₁` is open | `{ρ̂ ≥ −δ} ∖ M ⊆ {r ≥ −δ}` | none |
| 4.4 normal coordinates | ball radius `R`; cap; strip | `h_r = (1 − r/R)²h₀`, `−½∂_r h_r = h₀/R`; `a = sin(φ₀ − r)/sin φ₀`, `−a_r(0) = cot φ₀`; `d_M((0.8, 0), ∂M) = 0.2 ≠ 0.8` | holds | none |
| 4.5 convexity function (headline) | disc at `q = (0, −1)`; exterior; `[0, 1]` | `Hess x̃ = (2 − 2ε)g`, `dx̃_q = 2q = (0, −2) = −dρ_q`, `K_c ⊆ {εǀz − qǀ² ≤ c}`; `−(2 + 2ε)g`; unit `v` has `ǀdρ(v)ǀ = ǀdρǀ`, first bullet vacuous for `δ < ǀdρǀ` | holds | none |
| 4.6 enlargements | unit ball, `ε₁ = 1/4`; `(1 − r²)e^{−r²}`; arc of `S¹` | `II = h/(1 + δ)`; radial derivative `−2r(2 − r²)e^{−r²}`: `−2/e` at `1`, `0` at `√2`, minimum `−e^{−2}`; tubes disjoint iff `ε ≤ min(R, π − R)` | holds | none |
| 5.1 strata | disc; `[a, b]`; `dim SN` | torus, two circles, annulus; four points, `μ = ±1`; `2(n + 1) − 1 = 2n + 1` | holds | none |
| 5.2 exit time | annulus at `(−3/2, −1)`; shifted start; reversal on `[a, b]` | `13/4 ≤ 4`, exit at `x = √3`: `3/2 + √3`; `3/2 − √(2δ − δ²) → 3/2`; `(x + t − a) = (x − a) + t` | discontinuous without convexity; identities hold | none |
| 5.3 fold form | `y − t²`; `y − t⁴`; general | `Q = r`, `a = y`; `∂_t²h = 0`, excluded; `a = h(g(y), y) ≥ h(0, y) ≥ 0`, zeros at `r = ±√a` for `r = sF^{1/2}`, `t = g + s` | holds | none |
| 5.4 regularity (headline) | ball, `b = ⟨x, v⟩`, `c = 1 − ǀxǀ²`; glancing limit; `[a, b]` | `σ = −2b`, `T = c`, `(σ + √(σ² + 4T))/2 = −b + √(b² + c)`; `a = 4(b² + c)`, `Q(±√a) = −b ± √(b² + c)`; from `ρ ∘ γ ≈ ǀdρǀ(μt − ½ II t²)`, `μ/τ → II/2`, disc `sin θ/(2 sin θ) = 1/2`; `σ = a + b − 2x`, `Xσ = −2` | holds | none |
| 5.5 criteria (headline) | ball, `f = ⟨x, v⟩`; closed `M ≠ ∅`; `M = ∅`; closed component plus a ball; `u = −∫₀^{τ_δ} h ∘ φ_t` | `Xf = 1`, bound `(1 − (−1))/1 = 2`; (F, F, F); (T, T, T); (F, F, F); `u(φ_s z) = −∫_s^{τ_δ(z)} h(φ_t z)dt`, derivative `h(z)` | equivalence holds on each | none |
| 5.6 scattering (headline) | ball; disc; `[a, b]` | `⟨x − 2bv, v⟩ = −b`, `α² = id`, fixed points `b = 0`; `ℓ = 2 sin θ = 2√(1 − ǀwǀ²)`; `α(a, +1) = (b, +1)`, `α(b, +1) = (a, +1)` | holds | none |
| 6.1 balls | boundary point, unit `v`, `b = ⟨x − c, v⟩`; ellipse vertex; speed `1/4` | on `∂₊`: `−b + ǀbǀ = −2b`; on `∂₋`: `−(b + ǀbǀ) = −2b`; `(2/b²)/(2/a) = a/b²`; `(0 + √(1/16))/(1/16) = 4` | holds | none |
| 6.3 caps and hyperbolic balls (repaired) | `R = π/4`, `π/2`; `p = 2e`, `R = π/3`; `(0, 2)`; `(0, 1)`; arc `R = 3π/4` | `cot = 1`, `0`; `ǀdρǀ² = 4 − 1/4`, `(1/4)/(√15/4) = 1/√15 ≈ 0.258 ≠ 0.577`; `u = 5/4`, `ǀduǀ = 2·3/8 = 3/4`, `(5/4)² − 1 = 9/16`; `u = 1`, `du = 0`; `Hess u_xx = 1/y − (1/y)u_y = 1/(2y) + (x² + 1)/(2y³) = u/y²`; `τ(θ, ±1) = 3π/4 ∓ θ ≤ 3π/2` | holds; 5.2, 3.6 and R5a are now listed | none |
| 6.4 small balls | torus `R = 1/4`; `S¹`; `S²` | `II = 2h/(2·1/4) = 4h = h/R`, `τ ≤ (1/4 + 1/4)/1 = 1/2`; `θ²` smooth on `B(p, π)`; caps convex iff `R < π/2` | holds | none |
| 6.5 conformal ball | general `φ`; `φ = s² − 2s`; `φ = −s` | `e^φ(1/r + 2rφ′) = b′/r`; `b′ = e^{r⁴ − 2r²}(1 − 4r² + 4r⁴) = e^{…}(2r² − 1)²`, zero at `1/√2`, `b′(1) = e^{−1}`; `−e^{−1}h`; `r/c(r) = b(r)` for `c = e^{−φ(r²)}` | holds; agrees with the article's condition (1.1) | none |

Sections 1.2, 1.3 and 6.2 were also read in full and their Checks recomputed
(`g(e₀ − ae₁, e₁) = a − a = 0`, norm² `1 − a²`; `x(1 − x)` has `ǀdρǀ = 1` at both ends;
`ρ(q + tv) = t²ǀvǀ²` on the exterior).

**Duplication and ownership.** Roadmap search this round (445 open heads, then main; README
text): "scattering relation", "non-trapping", "boundary defining function", "strictly convex
boundary", "convex boundary", "mean-convex", "boundary normal coordinates", "geodesic X-ray",
"lens rigidity": no match outside this roadmap. "Exit time": StochasticCalculus and
DysonBrownianMotion (stopping times) and SymplecticGeometry/IntegrableSystems 596–608 (the exit
time of a Hamiltonian flow from a polytope-like region `P`, with no metric, second fundamental
form or geodesic flow): different objects. "Fermi coordinates": RiemannianGeometry/Surfaces
1.2–1.3 (dimension two, named in the Scope) and ComplexCurveModuli 152. "Signed distance":
RiemannianGeometry 4688 (a Check of R7.9, cited) and GeometricCurrents 870. "Weingarten":
FreeProbability and RandomMatrices (Weingarten calculus, unrelated) and ManifoldOptimization 719,
which cites RiemannianGeometry's shape operator. MathematicalBilliards (main) owns planar convex
tables through Mathlib's `StrictConvex`, with no second fundamental form of a manifold boundary.
The open LorentzianGeometry states, for a hypersurface with a chosen unit normal in a
semi-Riemannian manifold, `k(X, Y) = g(∇_X ν, Y)` with `B = −ε k ν` (its lines 184–190); for
`ε = 1` and `ν = ν_out` this is `B = II ν_in`, the sign of 3.6, and it uses the unaveraged trace
`H = tr_h k` where this roadmap follows RiemannianGeometry R5a's averaged one. It is not a
supplier and its object (a hypersurface with a chosen normal) is not the boundary of a manifold
with boundary, so nothing is shared. The board's package index was read (AnalyticNumberTheory,
LawrenceVenkateshMethod; neither on this subject). The overlap report lists no dropped id, no
revision-only id, no other pull request changing this roadmap and no second copy.

Overlap check: read ManifoldOptimization, LorentzianGeometry, SmoothBundlesConnections, TeichmullerGeometry, RealSemisimpleLieGroups (open), RiemannianGeometry, Surfaces, HopfRinow (main); the sublevel inclusion, outward criterion, normal collar and defining function of a compact separating hypersurface: owner RiemannianGeometry R7.9, cited; the compact case of the realisation: owner RiemannianGeometry R5c, cited; immersion second fundamental form, Gauss equation and total geodesicity: owner RiemannianGeometry R5a, cited; the normal strip of an arc in a surface: owner Surfaces 1.2–1.3, named in the Scope; uniform normal radii: owner SmoothBundlesConnections B6.0, cited; nothing else shared. The third list (results and headings) is empty.

**Shape.** The layers are named by their mathematics and the README does not say it follows a
source. The order is forced by the dependency lines: Layer 2 needs 1.4–1.6; Layer 3 needs
1.1–1.4; Layer 4 needs 3.1 and 3.5; Layer 5 needs 4.1–4.2 and 4.6; Layer 6 needs all. Every
definition (1.3, 1.4, 1.5, 2.1, 3.1, 3.2, 5.1, 5.2, 5.4's `τ̃`, 5.6) has API bullets and at least
three Checks; every theorem has its hypotheses in the sentence and a locator. Two source lines are
longer than the rest of the file (830 and 1496); this needs no change at the design stage.

**Headline theorems and padding.** Seven end theorems in the Summary: 2.2, 3.5, 4.2, 4.5, 5.4,
5.5, 5.6. There is no `Suggested.lean` at the design stage, so the one-tactic probe, the binder
audit and the import check have nothing to inspect. Elaboration: not available (this lane does
not elaborate). No Lean command was run.

**Copyright and arrangement.** Eighteen passages were set beside the sources at the locators
listed above (1.1, 1.3, 1.4, 2.1, 2.2, 3.1, 3.2, 3.5, 4.1, 4.2, 4.5, 5.1, 5.2, 5.3, 5.4, 5.5, 5.6,
6.5). None reproduces a sentence or follows a source clause by clause. The longest shared run is
in 5.4, eleven words of a one-line theorem statement (book lines 2936–2937) that the mathematics
fixes; next is the name "strictly concave from the superlevel sets" (article line 129). 5.5's
route names the steps of the source's proof of (i) ⇒ (ii) in the README's own words and with its
own objects (`M_δ` of 4.6, the extension of 3.4). Contents of the book against the layers: §3.1
is spread over 1.1, 1.4, 2.1, 3.5, 4.1–4.3, 5.1, 5.2; §3.2 ↔ 5.3–5.4; §3.3 ↔ 5.5–5.6; §2.5 ↔
1.6, 6.2, 6.3, 6.5. The order inside Layer 5 is forced (5.2 needs 5.1; 5.4 needs 5.1–5.3; 5.5 and
5.6 need 5.4). Layers 1–4 and 6 map onto no run of sections. No table, figure or exercise list is
reused.

Source independence: 18 passages compared with 3 sources, none shared; largest share paternain-salo-uhlmann2023, 46 of 84 named source mentions; contents compared with paternain-salo-uhlmann2023: independent.

## Not verifiable

- lee-riemannian2018 (Ch. 5–8), lee-smooth2012 (Theorem 9.25), sharafutdinov1994 (Ch. 4): settled
  as uncertified; not read. 1.5, the general law of 1.6, 3.6, the form `dr² + h_r` of 4.4 and the
  general statement of 6.4 have no certified locator besides them; their signs and normalisations
  are fixed by the computed values above and, for 1.5 and 3.6, by RiemannianGeometry R5a's text.
- The arXiv texts were read at the recorded versions (uhlmann-vasy2016 v1,
  stefanov-uhlmann-vasy2021 v3), not against the journal typesetting; the book was read in the
  authors' copy the manifest records, as a text extraction.
- Book line 3029 reads the second function of Lemma 3.2.11 as `τ` at "x − v" where `τ(x, −v)` is
  meant; whether the comma is missing in print or only in the extraction could not be settled
  from the extraction, so it is not listed as a source issue.
- No elaboration: there is no Lean file and this lane does not elaborate.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed p. 47: the source says the derivative of `b` is positive at radius 1; it should be at the outer radius `r₁`; affects a stated result.

## For the human reviewers

- **Licence.** paternain-salo-uhlmann2023 was read from an author's page copy carrying the publisher's personal-use notice (`packages/RiemannianManifoldsWithConvexBoundary/sources.toml`, `licence_class = "author-page"`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b670e40c46aa3d44fe87dc41cbf9e0d9089b19d1", "job": "REV-DESIGN-RiemannianManifoldsWithConvexBoundary~17", "model": "fable", "worker": "chris-x26"} -->
