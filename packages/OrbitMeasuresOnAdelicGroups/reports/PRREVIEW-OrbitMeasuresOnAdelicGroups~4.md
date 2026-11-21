# Review of OrbitMeasuresOnAdelicGroups (pull request #2879 at 413804c)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/OrbitMeasuresOnAdelicGroups/`
**Verdict:** accepted

**Summary.** Accepted: no finding. The previous finding is repaired: 4.1 now cites EndoscopicTransferAndUnitaryTraceComparison §1.3 for the characteristic-zero centraliser statements in its text, its *Needs:* line, a supplier contract and the Scope. Three of the four earlier small corrections are repaired and one partly, which remains as the single small correction (two citations still have no locator); there are no format notes. I recomputed every Check, worked example and route constant, and reread the Oesterlé and Sansuc locators; all hold. The human reviewers have the family premise and the unread texts to decide.

## C01 — The citations of [Tate] and [Weil 1965] still carry no locator

In *tamagawa-multiplicative-group* (line 265) [Tate] is cited for the volume `κ_F` of the norm-one idele classes and the residue of the zeta integral, and in *homogeneous-gauge-measure* (line 166) [Weil 1965] is cited for the residue form `dx/dQ`; neither gives a theorem, section or page, so a reader cannot go to the place in an 87-page paper or in the thesis. The third citation of the earlier remark is repaired: [Weil] now reads "Chapter II, Section 2.4", and the top-form measure cites [Oesterlé], Chapter I, 2.3 and Theorem 2.4, p. 18, which I checked.

Add the section and page for each: for Tate, the theorem of the cited printing that computes the volume of the norm-one idele classes and the one giving the residue of the zeta function; for Weil 1965, the numbered sections where `dx/dQ` is introduced.

## Questions for the author

- DifferentialGeometry 5.5a on main defines the density `|ω|` of a top form on a real manifold and its integral, with chart independence by the absolute-determinant change of variables. Should the real case of *top-form-measure* cite it for chart independence? 5.5a states an integral of densities on manifolds with a model, and I could not tell from its text whether it yields the Borel measure on `Y(ℝ)` that 2.6 needs, so I do not raise it.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Earlier R01 (4.1 against EndoscopicTransfer §1.3) | lines 440, 463–467, 503, 524–526 | §1.3 on main (lines 120–142): reductive `G_δ⁰`, connected for simply connected `G_der`, abelian centraliser a maximal torus; all three now cited | repaired |
| Earlier C01 (locators) | lines 52, 166, 265 | Weil now "Chapter II, Section 2.4"; Oesterlé I 2.3–2.4 added; Tate and Weil 1965 still bare | partly (C01) |
| Earlier C02 (Oesterlé's modulus) | line 93 | Oesterle1984 line 470: modulus `‖det Ad‖⁻¹`; README now says it is the inverse of its character | repaired |
| Earlier C03, C04 (description; family index) | description; index lines 55–58 | description names LogicAndDefinabilityInNumberTheory as only open supplier; index says "central induced tori" | repaired |
| 2.6 *top-form-measure* (sampled), Checks | `dT/T` on `ℤ_p^×`; `x²+y²` over `ℝ`; `2ω` | `1 − p⁻¹`; `dx/(2y) ∧ (2x dx + 2y dy) = dx∧dy`, circle mass `∫dφ/2 = π`, `∫₀¹π dr = π`; `2, 4, 1/2` | holds |
| 2.6, sign against Logic §2.12 | `ρ` a `(d−d′)`-form, `π*ω′` a `d′`-form | `ρ∧π*ω′ = (−1)^{(d−d′)d′} π*ω′∧ρ`; §2.12's own Check gives `−dx/x` base-first, `+dx/x` here | holds |
| 2.6 *tamagawa-measure-unipotent-radical* | affine group `(a,b)(a′,b′) = (aa′, ab′+b)` | left Haar `da db/a²`; `μ(E·(a₀,0)⁻¹) = a₀ μ(E)`; `χ(a) = a` on `Lie N`; so `Δ = |χ|` in Mathlib's convention | holds |
| same, left invariance in `(m,n)` | left `n′`, left `m′` | `n′·mn = m(m⁻¹n′m)n`: translation in `N`; `m′·mn = (m′m)n` | holds |
| 2.6 *homogeneous-gauge-measure* (i), Checks | Borel on `G_m`; `SL₂×G_m` on `𝔸²`; affine group on `𝔸¹` | `a(s)n(u)a(t) = n(s²u)a(st)`, Jacobian `s³`, form `du∧dt/t³`; stabiliser `[[s,u],[0,s⁻¹]]`, `(1,s)^*dy₁∧dy₂ = s⁻²`; `det Ad(a,b) = a` | holds |
| 2.6 (iii) (headline 2) | `SL₂` on `F²`; `GL₂` on `PGL₂`; `G_m` on `G_m` | primitive vectors `1 − q⁻²`; `(1−q⁻¹)(1−q⁻²)/(1−q⁻¹) = 1−q⁻²`; `X^*(G_m) → 0` not injective, `∏(1−q⁻¹) = 0` excluded | holds |
| 2.6 (iii), constants | general | `|d|^{−dim G/2}/|d|^{−dim H/2} = |d|^{−dim X/2}`; `ρ_G = ρ_H` since `X^*(G)⊗ℂ ≅ X^*(H)⊗ℂ`; moduli both trivial | holds |
| 2.6 (iv) (headline 2) | `x²+y²+z²`; `Φ = y` | mass `4πr/(2√r) = 2π√r`, `∫₀¹ = 4π/3`; `dx∧dy = dx∧Φ^*dy` gives `ω_X = dx`; `∏c_v/c′_v = |d|^{−(dim A − dim B)/2}` | holds |
| 3.4a *tamagawa-multiplicative-group* (sampled; headline 1) | `ℚ`; `ℚ(i)` | `ℚ^×\𝔸¹ ≅ ℤ̂^×`, mass `1 = κ_ℚ`; `κ = 2π/(4·2) = π/4`; `2dxdy/r² = dθ·2dr/r`; `2π·(1/2)/4 = π/4` | holds |
| same, route constants | finite `v`; `s → 1⁺` | AnalyticNumberTheoryPartII §5.3j: `d^×x_v = (1−q⁻¹)⁻¹N𝔇_v^{−1/2}dx/|x|`, so `λ_v|dx/x|_v = N𝔇_v^{1/2}d^×x_v`; `τ_{G_m} = κ⁻¹d^×x`; both limits `vol·f̂(0)`, `κ_F·f̂(0)` | holds |
| 3.4a *tamagawa-number-unipotent-radical* (headline 3) | affine group, `a > 0`; fibre over `m` | `(a,0)(1,b′)`: `(da/a)db′`; `(1,b)(a,0)`: `(da/a)(db/a)`; fibre `m⁻¹N(F)m\N(𝔸)`, volume `|χ(m)|^{±1}τ(N) = τ(N)` on `M(𝔸)¹` | holds |
| same, finiteness | AdelicAlgebraicGroups §3.4 | *Finite volume of `G(F)\G(𝔸)^1`* is stated there for every connected linear group (main, line 2827) | supplier covers `M ⋉ N` |
| 3.4a *tamagawa-central-induced-quotient* (headline 3) | `GL_n`; `GL₂×G_m`; `U(1)`; norm sequence | `i = n`, `τ(PGL_n) = n`; image `2ℤ`, `i = 2 = τ(PGL₂)τ(G_m)`; `i = 2`, `τ(U(1)) = 2`; `i = 1` would give `1/2 ≠ 1` | holds |
| same, lattice index | `Λ_{T₁} ⊂ Λ′` of index `i` | `da_{G₂} = i·da_{T₁}⊗da_{G₃}`, so `τ¹_{G₂} = i⁻¹τ¹_{T₁}⊗τ¹_{G₃}`; Sansuc 10.5: `τ(G′)τ(G″)/τ(G) = #coker` | holds |
| 4.1 (sampled; headline 4), Checks | `GL_n`; `PGL₂`, char `≠ 2`; `SL₂`, `s = −1` | `∏GL_{m_a}`; `w·diag(1,−1)·w⁻¹ = −diag(1,−1)`, trivial in `PGL₂`, and `w` does not commute with the torus; `C = SL₂` | holds |
| 4.1 route | `n_β` in `SL₂`; `F(s) = s` | `[[1,1],[0,1]][[1,0],[−1,1]][[1,1],[0,1]] = [[0,1],[−1,0]]`, swaps `𝔤_{±β}`; `g ∈ C(s) ⇔ F(g) ∈ C(F(s))` | holds |
| Lean 4.1 (a), (c) | elaborated copy; `rfl`, `simp`, `infer_instance`, `exact hH`, `simp_all` | both elaborate; every one-tactic attempt leaves the goal (smoothness, connectedness, no unipotent normal subgroup) open; no Tau Ceti theorem on semisimple centralisers | faithful, not padding |
| C01 | lines 166, 265 | no section or page after [Weil 1965] and [Tate] | small correction |

- Source locators checked against the text: 13 in Oesterle1984 (Introduction p. 13, line 50; I 2.3 and 2.4 p. 18, lines 241–252; Def. 4.7 p. 22, line 415; Prop. 5.3 p. 23, line 470; Def. 5.9 p. 24, line 508; 5.12 and Ex. 5.14 (1), (2) p. 25, lines 538–562; III Thm 3.3 p. 37, line 1031; III Thm 5.3 p. 41, line 1166; IV Cor. 3.3 p. 56, line 1778) and 1 in Sansuc1981 (Cor. 10.5 p. 77, line 2565); all support the statements as written.
- Library declarations opened at the pins: 8 by `#check` or `#print` (`NumberField.dedekindZeta_residue`, `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, `groupCohomology.coindIso`, `groupCohomology.H1ofAutOnUnitsUnique`, `ImplicitFunctionData.implicitFunction`, `MeasureTheory.Measure.addHaarMeasure`, `TauCeti.reductiveCommHopfAlgProperty`, `TauCeti.geometricallyConnectedCommHopfAlgProperty`), and `TauCeti.dedekindZeta_eulerProduct_hasProd` read at `NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean:498`.
- Cross-roadmap citations resolved on main: AdelicAlgebraicGroups §§0.3, 1.1, 1.4, 2.1, 2.2, 2.4, 2.5, 3.4 and nine statements; ReductiveGroupsPartII RG2.0, RG2.3.7; ReductiveGroups Layers 3, 5, 7, 7C, 9E; AnalyticNumberTheoryPartII §§5.3f, 5.3h, 5.3j, 5.3k; EndoscopicTransferAndUnitaryTraceComparison §1.3; GeometryOfNumbersAndQuadraticArithmetic §3.3. At its open head: LogicAndDefinabilityInNumberTheory §§2.7, 2.12.
- Automatic checks: all passed. Dependency check: `depcheck: 170 roadmaps, 1988 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: a copy of `Suggested.lean` elaborates with `sorry` as its only warning; `#check @name` of both declarations agrees with 4.1 (a) and (c), no binder lost, nothing changed.
- Headlines: (1) `τ(G_m) = 1`, (2) the homogeneous-space comparison, (3) `τ(M ⋉ N) = τ(M)` and the central induced quotient are not statable (no normalised Haar measure on adeles or ideles, no gauge-form measure at the pins) and the docstring says so; (4) is stated in two clauses.
- Changes outside the folder: the three files of the family index only.

Overlap check: read HermitianFormsAndLattices, ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups, BaseChangeAndGaloisRepresentationsForUnitaryGroups, FiniteReductiveGroups (open), AdelicAlgebraicGroups, ReductiveGroupsPartIII, EndoscopicTransferAndUnitaryTraceComparisonPartII (main); the list by results is empty; nothing shared with these beyond consumption by HermitianFormsAndLattices and FiniteReductiveGroups. Outside the lists: the characteristic-zero centraliser statements are owned by EndoscopicTransferAndUnitaryTraceComparison §1.3 (main) and cited; the nonarchimedean gauge measure and its Fubini formula by LogicAndDefinabilityInNumberTheory §§2.7, 2.12 and cited; GeometryOfNumbersAndQuadraticArithmetic §3.3 (main) proves only the cases `PGL₁(D)` and orthogonal stabilisers inside its own targets, and the general statements are owned here.

Source independence: 14 passages compared with 2 sources at their locators, plus 5 route passages (*tamagawa-measure-unipotent-radical*, *homogeneous-gauge-measure* (iii), *tamagawa-number-unipotent-radical*, *tamagawa-central-induced-quotient*, the docstring of 4.1 (c)) against Oesterle1984; none shared, no clause-by-clause translation of the French; largest share Oesterle1984, 13 of 20 locators; contents compared with Oesterle1984 (Chapters I–VI): independent, the layers being measures, Tamagawa numbers and centralisers, not its chapters. Weil, Platonov–Rapinchuk–Rapinchuk, Tate, Weil 1965, Steinberg and Humphreys could not be read.

Research link: Layers 2–3 are the Tamagawa-measure comparisons of Weil (1961, 1965), Sansuc (1981) and Oesterlé (1984), used by HermitianFormsAndLattices for `τ(U(V)) = 2`, local densities and Siegel's main theorem; Layer 4 is Steinberg's connectedness theorem (1968), used by FiniteReductiveGroups. Rests on the README's overview and Downstream consumers, and on Oesterle1984 and Sansuc1981.

## Not verifiable

- Weil, *Adeles and Algebraic Groups*, Chapter II, Section 2.4: a book with no open copy; not in the manifest.
- Platonov–Rapinchuk–Rapinchuk, Theorem 3.71, p. 196: a 2023 Cambridge University Press book behind a paywall.
- Weil 1965, Acta Mathematica 113: the sources service resolved its DOI only to a paywalled page (recorded as uncertified).
- Tate's thesis in Cassels–Fröhlich: no open copy; not in the manifest.
- Steinberg, Memoirs of the AMS 80, Theorem 8.1, and Humphreys, §2.11: no legal copy found by the sources service in the previous round; not searched again.

## Source issues

- none

## For the human reviewers

- Scope: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`) and the description say the family follows a formal proof of the Riemann hypothesis for Dirichlet L-functions announced on 20 November 2026. I did not verify this; this roadmap's statements are standard Tamagawa theory and do not depend on it.
- Not tested: six cited texts (Weil 1961, Platonov–Rapinchuk–Rapinchuk, Tate, Weil 1965, Steinberg, Humphreys) could not be read legally, so wording was not compared with them. The source with the largest share, Oesterle1984, was read.
