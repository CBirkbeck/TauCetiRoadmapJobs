# Review of PseudoholomorphicCurveAnalysis (pull request #2528 at 8bc8c19)

**Verdict:** needs changes

**Summary.** Needs changes: two Checks assert false mathematics. The Check of 3.4 states the weak identity for `J = i` with the wrong sign on `i∂_tφ`, and the Check of 6.1 offers `log log(2/|1 − z|)` as a `W^{1,2}` function on the disc, which it is not. The change this pull request makes to the folder (the nine citations moved from CharacteristicClasses C3.2 to C3.0, and step 2 of 7.2 rerouted through the determinant line) is sound and every use is supported by C3.0 at this head. There are four small corrections and two format notes, none blocking; two points are left for the human reviewers.

## R01 (P2) — The Check of 3.4 writes the weak identity for `J = i` with `+i∂_tφ` where the transpose gives `−i∂_tφ`, and the identity as written is false

An implementer who takes the Check as the `J = i` instance of (B.4.3) would test the wrong adjoint operator: the identity as printed fails for the holomorphic solution `ξ = z`, which every correct weak formulation must accept.

In the first Check of 3.4 (README line 720) the text says "the identity becomes `∫⟨∂_sφ + i∂_tφ, ξ⟩ = −∫⟨φ, ∂_sξ + i∂_tξ⟩`". The weak equation it specialises (line 693) has `∂_sφ + Jᵀ∂_tφ` on the left, with the transpose for the real inner product, and for `J = i` that transpose is `−i`; the same Check uses this correctly one clause earlier, where `∫⟨Jᵀ∂_tφ, ξ⟩ = ∫⟨∂_tφ, iξ⟩` produces the boundary term `−∫_ℝ⟨φ, iξ⟩ ds`. Computed witness on `ℍ`, `n = 1`: take `ξ = z` (real on `ℝ`, `∂_sξ + i∂_tξ = 0`, so the right side is `0`) and `φ = χ(|z|)` a real radial cutoff (real on `ℝ`). Then `∂_sφ + i∂_tφ = χ′(r) z/r`, `⟨χ′ z/r, z⟩ = χ′(r) r`, and the left side is `π ∫₀^∞ χ′(r) r² dr = −2π ∫₀^∞ χ(r) r dr ≠ 0`. With the correct sign, `∂_sφ − i∂_tφ = χ′(r) z̄/r`, `⟨χ′ z̄/r, z⟩ = χ′(r) r cos 2θ`, and `∫₀^π cos 2θ dθ = 0`, as it must be.

Smallest change: replace `∂_sφ + i∂_tφ` by `∂_sφ − i∂_tφ` in that sentence (and, if wished, say "since `iᵀ = −i`"). The boundary-term sentences before and after it are correct and stay.

## R02 (P2) — The Check of 6.1 offers `log log(2/|1 − z|)` as a `W^{1,2}` function on the unit disc, but it is `−∞` at `z = −1` and its gradient is not square integrable there

The Check is meant to show that boundary values are a trace condition when `kp ≤ 2`; with a function outside `W^{1,2}` it shows nothing, and a reader who verifies it will find the example fails for a reason unrelated to the point `1`.

In the last Check of 6.1 (README lines 1077–1079): "the function `log log(2/|1 − z|)` is in `W^{1,2}` and has no continuous boundary value at `1`". On the closed unit disc `|1 − z|` reaches `2` at `z = −1`, where `log(2/2) = 0` and the outer logarithm is `−∞`. Near `−1` write `z = −1 + x + iy` and `δ = 2 − |1 − z| ≈ x − y²/4`; then `log(2/|1 − z|) ≈ δ/2` and `|∇ log log(2/|1 − z|)| ≈ 1/δ ≥ 1/x`. The wedge `|y| ≤ x`, `0 < x < x₀` lies in the disc (it needs `x ≥ (x² + y²)/2`), and on it `∫ |∇|² ≥ ∫₀^{x₀} (2x)/x² dx = ∞`. So the function is not in `W^{1,2}` of the disc.

Smallest change: use `log log(4/|1 − z|)` (any constant larger than `2` in place of `2`). Then `log(4/|1 − z|) ≥ log 2 > 0` on the closed disc, the function is smooth away from `1`, its gradient near `1` has size `1/(ρ log(4/ρ))` with `∫ dρ/(ρ log²(4/ρ)) < ∞`, and it is unbounded at `1`, which is what the Check wants.

## C01 — The Tau Ceti contract says revision `333c9e49` "postdates the pin"; the manifest at this head pins a later revision that contains every file listed there

The contract (README lines 143–166) is written against `358314d4` and says of `333c9e49` "which postdates the pin, the files below exist and are adopted when the pin reaches them. Until then … are targets of PH3.1 and PH3.2". `lake-manifest.json` at this head pins Tau Ceti `2fd255d99`, of which both revisions are ancestors. At that pin: `HasCompactSupport.conjWirtingerDeriv_integral_sub_inv_smul_apply_one` (`∂̄T = id` on compactly supported `C¹` data, `TauCeti/Analysis/Complex/Pompeiu/Basic.lean` line 261), `exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv_of_hasCompactSupport` (`Wirtinger/CalderonZygmund.lean` line 194), `Wirtinger/Potential.lean`, `Wirtinger/Similarity.lean`, `CkHolderSpace` (`Analysis/Holder/Iterated.lean`) and `WeaklyHarmonicOn.exists_harmonicOnNhd_ae_eq` (`Analysis/InnerProductSpace/Harmonic/Weyl.lean` line 351).

By the README's own rule the condition is met, so a reader can no longer tell which of these are still targets. State the contract at the pin of the manifest, and drop the "until then … a target here" clauses in the contract and in the *Needs* lines of 3.1, 3.2 and 3.5 and the Dependencies of Layer 3, keeping as targets only what the pin does not have (the `Lᵖ` boundedness of `B`, the Hölder-scale bounds, Weyl's lemma for `∂̄`, the vector similarity principle).

## C02 — Two entries of the Tau Ceti contract no longer describe the pinned library

`ContinuousLinearMap.index_comp` is listed as a Tau Ceti declaration (README lines 159, 1185, 1218). At the pin Tau Ceti has no such declaration (the file `Analysis/Fredholm/Comp.lean` of `358314d4` is gone); the composition law is Mathlib's `ContinuousLinearMap.IsFredholm.index_comp` (`Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean` line 613). Cite that under "From Mathlib".

`W1p.hyperplaneTrace` is described (line 157) as "the `L²` trace of a whole-space `H¹` function on a hyperplane (the model `p = 2` only)". At the pin it is `W1p.hyperplaneTrace (_hp : p ≠ ∞) (a : ℝ) : W1p … ⊤ p →L[ℝ] Lp ℝ p …` (`TauCeti/Analysis/Sobolev/Trace/Hyperplane.lean` line 211), the `Lᵖ` trace for every finite `p`. Say so; the traces 3.4 and 6.1 need at `q ≤ 2` are then closer to the library than the text suggests.

## C03 — The genus comparison is cited from ModularForms by item labels and a Lean name that ModularForms on main does not have

The contract (README lines 193–194) and step 6 of 7.2 (lines 1317–1319) cite "ModularForms Layer 10B (iv)–(v)" and `analyticGenus_eq_topologicalGenus`; step 4 cites "Layer 10B (iii)". `TauCetiRoadmap/ModularForms/README.md` on main states these in §10B as unnumbered prose paragraphs (lines 1206–1216 for the point-twist induction and `h⁰(K) = g_an`, lines 1228–1234 for the equality of `g_an` with the topological genus), with no items (iii)–(v), and the name `analyticGenus_eq_topologicalGenus` occurs nowhere in that folder. A reader who searches for either finds nothing. Cite §10B by what it proves ("the point-twist Riemann–Roch induction", "`h⁰(K) = g_an`", "the equality of the analytic and topological genus"), stated there in prose, as the contract already does for AlgebraicTopology Stage 8.7.

## C04 — The Summary names Chapter 3 of McDuff–Salamon as part of the roadmap's main source, but no locator goes there

The Summary (README lines 10–11) says "The spine is McDuff–Salamon … Appendices B and C and Chapter 3." The README's locators into the chapters of that book are Theorem 2.3.5 (§2.3, used in 3.5) and Theorem 4.1.1 (§4.1, used in 5.2); nothing is cited from Chapter 3, and the Scope section leaves the material of Chapter 2 other than §2.3 to HeegaardFloer F2.2. Name the sections actually used ("Appendices B and C, §2.3 and §4.1").

## N01 — PDE is cited by labels PDE on main no longer uses

"PDE Lane A item k" and "Lane E" (Scope, contract, *Needs* lines of 1.1–1.3, 3.1, 3.3, 3.4, 6.1) are now "Layer 1 §1.k (Ak)" and "Layer 5 (E20–E26)" in `TauCetiRoadmap/PDE/README.md` on main, which has no "Lane". The letters still identify the sections; the wording would be better matched to main.

## N02 — Two sentences say the plan follows a source

"The spine is McDuff–Salamon" (Summary) and "Prove it in three lemmas, following McDuff–Salamon §B.4" (3.3). The layers are the roadmap's own (see the comparison of contents below), so the sentences undersell it; "(sources: …)" and "as in McDuff–Salamon §B.4" would say the same without presenting a source as the plan.

## Verified sound

**Previous review.** The previous report on this folder accepted it with no finding open. Its one recorded point outside the folder (single ownership against HeegaardFloer and AnalyticStableMaps) is now settled on main: `TauCetiRoadmap/HeegaardFloer/README.md` lines 26, 2065 and 2094–2101 name this roadmap as owner of the planar and compact Cauchy–Riemann package and cite PH2.4, PH3.1; `TauCetiRoadmap/AnalyticStableMaps/README.md` line 21 lists PH1, PH3–PH7.2 as consumed, "none of them is stated again here".

**The change of this pull request.** Nine citations move from CharacteristicClasses C3.2 to C3.0 (README lines 189–192, 1233, 1268, 1292–1293, 1311, 1348–1349, 1378, 1394). Each resolves in `TauCetiRoadmap/CharacteristicClasses/README.md` at this head, item C3.0 (lines 1006–1101): the definition of `c₁` of a line as the Euler class and `c₁(E) = c₁(det E)`; `det L ≃ L`, `det(ℂ^r) ≃ ℂ`, `det(E ⊕ E′) ≃ det E ⊗ det E′`; invariance under isomorphism; `c₁(L*) = −c₁(L)` over paracompact Hausdorff bases; Stage 1's signed zero count, sum of vanishing orders for holomorphic sections, evaluated tensor additivity and evaluated Whitney formula on a closed oriented surface.

**Adversarial table.**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 1.1 half-disc reflection | `k = 1`; `k = 2`, `u = t` | `c₁ = 1`; `c₁ + c₂ = 1`, `−c₁ − c₂/2 = 1` gives `c₂ = 4`, `c₁ = −3`; `−3τ·(−1) + 4·(−τ/2)`, i.e. `3τ − 2τ = τ` | holds |
| 1.1 Checks | `|z|`; `t^{1/2}` | `∫ r^{−p} r dr < ∞` iff `p < 2`; `∫ t^{−p/2} dt < ∞` iff `p < 2` | hold |
| 1.2 mixed exponents, `i = 0` | `q < 2`; `q = 2`; `q > 2`; `p = q = 4/3` | `1/r = 1/q + (1/p − 1/2) < 1/q` iff `p > 2`; `1/p + 1/s ≤ 1/2` for large `s`; `L^∞·L^p`; exponents `8/5`, `28/15 < 2`, `32/15 > 2` | holds; `p > 2` used |
| 1.2 composition Check | `u = |z|^{−2/5}`, `p = 4/3` | `|D(u²)| ~ |z|^{−9/5}`, `(9/5)(4/3) = 12/5 > 2` | holds |
| 2.3 adapted chart | `dΦ(x, 0)`; `L = ℂ × 0` | `eⱼ ↦ ∂ⱼγ`, `ieⱼ ↦ J∂ⱼγ`, `dΦ(i·ieⱼ) = −∂ⱼγ = J(J∂ⱼγ)`; rank `2 ≠ 4` | intertwines; hypothesis used |
| 2.4 Beltrami, groupoid, double | `ψ = z + a z̄`; `z ↦ −z̄`; disc, annulus | `∂̄ψ = a`, `∂ψ = 1`, Jacobian `1 − |a|²`; `Im(−z̄) = Im z`, antiholomorphic; `χ = 2·1`, `2·0` | hold |
| 3.1 `T`, `B` | `f = 1_{D_1}` | inside `∂̄(w̄) = 1`; outside mean value gives `π·(1/w)/π = 1/w`; `B f = −1/w²`, `∫ r^{−2p} r dr < ∞` iff `p > 1`; `∫ r^{−p} r dr = ∞` iff `p ≤ 2` | holds |
| 3.1 normalisation against the pin | Cauchy–Pompeiu at the pin | `(2π)⁻¹ ∫ (w − z)⁻¹(∂ₓu + i∂ᵧu) = u`; `conjWirtingerDeriv = ½(D·1 + i D·i)`; so `π⁻¹` for `∂̄` | agrees |
| 3.2 solution formula | real `f, g`, `h = f + ig` | `Δ(½ Re Th) = 2 Re ∂h = ∂_s f + ∂_t g`; `log|z|`: data `L^r` iff `r < 2` | holds |
| 3.4 weak identity, `J = i` | `ξ = z`, `φ = χ(r)` | printed form: left `−2π∫χ r dr`, right `0`; with `−i∂_tφ`: left `∫₀^π cos 2θ = 0` | false as printed: R01 |
| 3.4 disc kernel, normal derivative, reflection | `e^{3iθ/2}ℝ`; `k = −1`; `ξ = z` | `aₙ = conj(a_{3−n})`, real dimension `4`; `0`; `∂_t z = i = i∂_s z`; `conj(s + it) = s − it` | hold |
| 3.5 Checks and Lean | `ξ = z e^{−z̄}`; `e^{−1/|z|²}`; `J = ΦiΦ⁻¹` | `∂̄ξ = −ξ`; `C = −2z/|z|⁴`, size `2|z|^{−3}`; `(∂_sΦ + J∂_tΦ)σ + Φ(∂_sσ + i∂_tσ) = −Cξ` | hold |
| 4.1 Checks | `log log(1/|z|)` near `0`; `u = z̄` | `∫ dr/(r log² r) < ∞`, unbounded; `du` = conjugation | hold |
| 4.2 predicate | `u = z`; `u = z̄`; Floer | `1 + i·i = 0`; `1 + i(−i) = 2`; `ν(∂_s) = ½JX`, `ν(∂_t) = −Jν(∂_s) = ½X`, `η = JX` | holds |
| 5.1 interior and smooth (Lean) | `f = z² log log(1/r)` | `∂̄f = z³/(2r² log r)`; `J² = (−v, −a + 2∂̄f v̄ − 2∂̄f v̄)`; graph: `(0, 2∂̄f − 2∂̄f) = 0`; `∂²f ∋ 2 log log(1/r)` | `p ≠ ∞` needed; consistent |
| 5.1 boundary (Lean) | `U ∩ ℝ = ∅`; `ℓ = 2` on a manifold | reduces to the interior statement; chart `C²`, pushed structure `C¹`, planar `ℓ = 1` gives `W^{2,p}` | consistent with README |
| 5.2 and its planar Lean form | `mz`; `z/m`; `u_m ≡ m`; `L = (0, 1)` | `‖du‖ = m`; `1/m ≤ 1`, limit `0`; `c = 0`, images `{m}`; limit `0 ∉ L` | each hypothesis used |
| 6.1 Checks | `z e₁`, `2s e₁`; `log log(2/|1 − z|)` | `z = i` at `θ = π/2`; at `z = −1`: `log 1 = 0`, `|∇|² ≥ 1/x²` on a wedge, `∫ 2 dx/x = ∞` | last one false: R02 |
| 6.2 exponents | `ℓ = 1, k = 1`; `ℓ = 2, k = 1` | `q ≤ p`; `2/p − 1 < 0 ≤ 2/q`, all `q > 1`; compactness needs `1/p < 1/2` | hold |
| 6.3 boundary term and disc duality | `F = ℝⁿ`; `(ℂ, e^{ikθ/2}ℝ)` | term `−∫⟨iξ, η(∂_s)⟩`; `dz̄(∂_θ) = −ie^{−iθ}`, `g ∈ c·e^{i(−k−2)θ/2}ℝ`, dimension `−1 − k` for `k ≤ −1` | holds |
| 6.4 | torus; sphere | kernel `2`, cokernel `2`, index `0`; kernel `2`, cokernel `0`, index `2 = χ` | hold |
| 7.1 Maslov index | `(ℂ, e^{ikθ/2}ℝ)`; `(ℂ², ℝ ⊕ e^{iθ}ℝ)`; pin | `E_F` of degree `k`; `0 + 2`; `maslovIndex_rotation = finrank ℂ E = 1` on `ℂ` | convention agrees with the pin |
| 7.2 Riemann–Roch | `TS²`; disc; annulus; `𝒪(−1)`, `𝒪(−2)` | `2 + 4 = 6`; `1 + k`; `0`; `2 − 2 = 0`; `μ + 2χ = −4 + 4 = 0`, `H¹ = ℂ` | hold |
| 7.2 step 2 (changed) | `E ≅ ℂ^{n−1} ⊕ L`, `n ≥ 2` | `det E ≅ det(ℂ^{n−1}) ⊗ det L ≅ ℂ ⊗ L ≅ L`, so `c₁(E) = c₁(L)` by C3.0 | supported; no Whitney formula needed |
| 7.2 steps 4–7 (changed citations) | point twist; doubling | six-term sequence: index `+2`, `c₁ + 1`; `2nχ(Σ) + 2μ = 2 ind D` | consistent with C3.0 Stage 1 |
| 3.3 ladder and system | `p = 4`, `q₀ = 3`; `k = 1` | `r₀ = 12/7`, `q₁ = 12`, `r₁ = 3`; rows `[S, ∂_sJ]`, `[0, S + ∂_tJ]` | hold |

- Source locators checked against the text: 5 (`wendl-lectures` lines 2194, 2394, 2482, 2850, 4833: Theorems 2.62, 2.73, 2.78, 2.89, 3.22), all supporting the statements they are cited for; `oh-riemann-hilbert` lines 5–31 (subject of the paper).
- Library declarations opened at the pins: 24 (Tau Ceti `2fd255d99`: `conjWirtingerDeriv` `Wirtinger/Basic.lean` 80, Pompeiu 162 and 261, `CalderonZygmund.lean` 194, `Weyl.lean` 103 and 351, `maslovIndex_rotation` `Maslov/Index.lean` 212, `IsMaximalTotallyReal` `TotallyReal/Basic.lean` 50, `SmoothAlmostComplexStructure`, `IsPseudoholomorphic`, `isPseudoholomorphicAt_iff_isJHolomorphicAt` `JHolomorphic.lean` 509, `ContDiff.addHaar_image_criticalPoints_eq_zero` `Sard/OutermostStratum.lean` 369, `W1p.hyperplaneTrace` 211, `W1p0.extendByZeroL` `W1p/Extension.lean` 229, the `W1p` files; Mathlib: `IsFredholm.comp` 544, `IsFredholm.index_comp` 613, `eventually_nhds_index_eq` and `index_continuousOn_isFredholm` in `Fredholm/Open.lean`, `IsSmoothEmbedding`, `IsImmersionAt`, `TestFunction`).
- Cross-roadmap citations resolved: CharacteristicClasses C2.3 and C3.0 (this head); PseudodifferentialOperators Layer 5 §5.2 and §6.2 (main; "P5.2" is §5.2 of Layer 5, labelled P5); AlgebraicTopology Stage 6 item 5, Stage 7.1, Stage 8.7 (main, through its table of former stage numbering, §6.5, §7.1, §8.7); FuchsianOrbifolds Layer 5 `RiemannSurface.genus`; ModularForms §10B (C03); PDE (N01); TeichmullerGeometry Layer 7.4 (an open new roadmap, cited for scope only, section present at its head); ComplexCurveModuli D0.
- Dependency check: `depcheck: 200 roadmaps, 2191 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Changes outside this folder and CharacteristicClasses: none.
- Automatic checks: all passed. Elaboration of a copy of `Suggested.lean` with `#check @name` for all 11 declarations: no error, six `sorry` warnings and nothing else; each elaborated type carries its instance binders and the hypotheses of its README statement; nothing changed. One-tactic probe (`first | simp_all | rfl | infer_instance`): none of the six theorems closes.
- Headline theorems: interior bootstrapping (finite and smooth), boundary bootstrapping (both forms), gradient-bound convergence and the similarity principle are stated; the surface-level forms, converging-data estimates, Fredholm theorem and Riemann–Roch are named in the docstring with the missing carrier. The pin now has the scalar smooth similarity principle and the smooth-data Cauchy transform, neither of which proves a stated theorem.
- The pull request's text describes the folder's change correctly (references moved from C3.2 to C3.0, no remaining dependence on C3.1–C3.2).

Overlap check: read HeegaardFloer (main), AnalyticStableMaps (main), SobolevMapsBetweenManifolds (main), DGFloer and TeichmullerGeometry (open heads); the planar and compact Cauchy–Riemann package, PH1 and PH4.1: owner PseudoholomorphicCurveAnalysis, cited by all four consumers; the `L^∞` Beltrami theory: owner TeichmullerGeometry Layer 7.4. The open heads of the HeegaardFloer and AnalyticStableMaps revisions were not available and were not read.

Source independence: 6 passages compared with 2 sources (`wendl-lectures`, `oh-riemann-hilbert`), none shared; largest share McDuff–Salamon, about 59 of 67 locators, text and contents page not readable (publisher page refused), so wording and arrangement were not compared with it; by the README's own locators Layer 1 draws on B.1, Layer 2 on B.4, C.5 and E.3, Layer 3 on B.2, B.4 and §2.3, Layer 5 on B.4 and §4.1, Layer 6 on C.1–C.2, Layer 7 on C.1, C.3 and C.4, which is not a one-to-one run.

Research link: the elliptic regularity, Fredholm theory and Riemann–Roch of McDuff–Salamon (2012, Appendices B and C) and Wendl (2010, Theorems 2.89, 3.22), prerequisites of Floer and Gromov–Witten theory; consumed on main by HeegaardFloer, AnalyticStableMaps and ComplexCurveModuli. Rests on the README's references and those roadmaps' texts.

## Not verifiable

- McDuff–Salamon, *J-holomorphic Curves and Symplectic Topology*, 2nd ed.: not openly available. Every locator into it (Chapters 2 and 4, Appendices B, C, E) is cited by locator only; the statements were checked by computation and, where they overlap, against Wendl Theorems 2.62, 2.73, 2.78, 2.89 and 3.22.
- Vekua and Ahlfors are cited by chapter without a readable text; nothing in the layers rests on a locator into them.

## Source issues

- none

## For the human reviewers

- **Not tested.** McDuff–Salamon has the largest share of the locators (about 59 of 67) and neither its text nor its contents page could be read; the wording and arrangement comparisons were made only against `wendl-lectures` and `oh-riemann-hilbert`.
- **Licence.** `TauCetiRoadmap/PseudoholomorphicCurveAnalysis/README.md` lines 555–559 cite the public formalisation `t4v1/damian_formalizare` (`MorseFloer/Part2/CauchyPompeiu.lean`, `CauchyHolder.lean`) as existing work and mention possible code integration; its licence was not examined.
