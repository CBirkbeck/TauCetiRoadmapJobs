# Review of HeightsForLogSingularMetrics (pull request #2894 at 25e5ace)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HeightsForLogSingularMetrics/`
**Verdict:** needs changes

**Summary.** Needs changes, for one finding about ownership rather than mathematics. The height of the projective bundle of a Hermitian vector bundle (4.3b (a)) is the same theorem as ChowFormsAndHeightsOfSubvarieties §6.2 (a7), and that roadmap is earlier in the family's order and already lists 4.3b (a) as a consumer of (a7). So the statement has two owners and needs to be cited, not restated. Every formula, Check and worked example I recomputed holds, including the `N = 3` flag-variety numbers, the reflection formula on `Fl₃`, the constants in 0.4 (c) and the projective-space heights. There are also two small corrections (wrong section pointers, missing locators) and one format note, none blocking. Two questions go to the human reviewers: what status to give the formal proof that is the only source for 16.1, and confirmation of the host of the announcement.

## R01 (P2) — The height of the projective bundle in 4.3b (a) is already owned by ChowFormsAndHeightsOfSubvarieties §6.2 (a7), so this roadmap plans it a second time

As things stand, an implementer would prove the same identity twice, under two names, in two roadmaps of one family. Neither text says which roadmap owns it. The headline (2) of the Summary, the 4.3b route and the ownership paragraph (README line 207: "the height of the projective bundle of a Hermitian vector bundle over `O_K`") all claim it here.

How I know: ChowFormsAndHeightsOfSubvarieties (open pull request #2891), `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ChowFormsAndHeightsOfSubvarieties/README.md`:
- Lines 252–254 state (a7): the height of the whole space `ℙ(J^∨)` of a Hermitian vector bundle `J̄` of rank `N` is `deĝ_n(J̄) + ½Σ_{m=1}^{N−1}H_m`, where the height is `arithmeticIntersection/[K:ℚ]`.
- Line 420 claims ownership of "its value on the whole space".
- Line 414 says that 4.3b (a) here "is 6.2 (a7) for `J̄ = Ē^∨`".

With `J̄ = Ē^∨`, `ℙ(J^∨)` is the scheme of lines in `E` with the same metrised `O(1)`, and `deĝ_n(Ē^∨) = −n·μ̂(Ē)`. Since `½Σ_{m<n}H_m = (n/2)(H_n − 1)`, multiplying by `[K:ℚ]` gives exactly README line 93, `Ō(1)^n = [K:ℚ]·n·(−μ̂(Ē) + ½(H_n − 1))`. The change-of-metric computation in the 4.3b route is also ChowForms's §5.17a.

ChowForms comes before this roadmap in the family's order, so it is the owner. The smallest repair:
- Turn 4.3b (a) into a citation of ChowFormsAndHeightsOfSubvarieties §6.2 (a7), applied with `J̄ = Ē^∨`. The displayed formula can stay, so (b), (c) and the Checks read unchanged.
- Reduce the route of (a) to that identification.
- Move the height of the projective bundle from "This roadmap owns" to "Not owned here".
- Add ChowForms §§5.17a, 6.2 (a7) to the 4.3b *Needs*, the Layer 4 Dependencies and a `### From ChowFormsAndHeightsOfSubvarieties` supplier contract.
- In Summary (2) and the second bullet of the `Suggested.lean` docstring, say the formula is ChowForms's.

The description's list of open suppliers would then gain that roadmap.

## C01 — Three pointers in Downstream consumers name items that ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.15 does not have

README line 201 sends the reader to "§8.15 (b)" (antisymmetry, for 14.1 (c)) and to "§8.15 (c)" (the rate of 0.4 (c), and 16.1 in "§§8.15 (c), 8.16 (a)"). In that roadmap, §8.15 has only items (a) and (a1)–(a3). The antisymmetry is its section 8.15b, and the uses of 0.4 (c) and 16.1 are in its section 8.15c (Vanishing on the walls). The same paragraph already writes "8.15b" correctly once. Write 8.15b and 8.15c.

## C02 — Results taken from sources carry no theorem, page or declaration locator, so a reader cannot check them at the source

The References list papers by layer only. Some statements have a precise source that I checked. 4.3a (b), for a smooth metric, is Moriwaki, *Continuity of volumes on arithmetic varieties*, Theorem 6.2 with Example 6.1 (2) (p. 40 of arXiv v2: nef on every geometric fibre, semipositive curvature). That theorem and page could be cited at the claim.

The [FormalProof] credits for 0.4 (c)(iii), 14.1 (c) and 16.1 name no file or declaration. I opened the repository: its `src/Lemmata` directory alone lists over a hundred subdirectories with generic names, so without a locator the credited proofs cannot be found. Add theorem and page numbers to the literature entries (Bost–Gillet–Soulé for the projective-space height, Zhang and Roy–Thunder for 4.3b), and the Lean file and theorem name for each [FormalProof] credit.

## N01 — The layer and section ids skip numbers without explanation

The layers are 0, 4, 14 and 16 (sections 0.4, 4.3a, 4.3b, 14.1, 14.2, 16.1), so a reader looks for Layers 1–3 and 5–13. One sentence in the guide to the layers saying what the numbering follows would remove the puzzle.

## Questions for the author

- 16.1, step (3): two things I could not settle from the sketch alone, and the [FormalProof] credit has no locator to check them against.
  - Are the jets the plain derivatives `D_x^i s(0)`, so that the factor `i!` enters only through the Cauchy estimate? The divided jets `D_x^i/i!` of an integral section need not be integral: on `𝔾_m` over `ℤ`, `(t d/dt)²/2` sends `t` to `t/2`.
  - Is the "triangular determinant" a nonzero maximal minor of the jet matrix of the good translates of `θ` themselves? That is what would make the step independent of the slopes of `F_r`, as the text says, since an integral section of `F_r` with exact order `i` comes with no norm bound.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / independent) | Result | Change |
|---|---|---|---|---|
| 0.4 predicate, Hodge-line Check | modular curve near a cusp, `‖dz‖² = Im τ` | `φ = −log Im τ ∼ −log log(1/|q|)`: `−Cℓ_s ≤ φ ≤ C`, curvature `≥ 0` | holds | none |
| 0.4 Poincaré and convolution Checks | `φ = −log log(1/|z|²)`; disc, annulus, smooth kernels | `Δφ = 4/(|z|²log²(1/|z|²))`; mass `4π/log(1/s²)`; ratio `πc·log(16/t²)/16`; `(i/2π)`-mass `1/log(1/ρ)` | holds | none |
| 0.4 (c) numerical constants | `t = exp(−1/s²)`, `0 < s < 1` | `max 8s·log³(1/s) = 216e⁻³ ≈ 10.75 ≤ 10.8`; `max 4s·log²(1/s) = 16e⁻² ≈ 2.17 ≤ 2.2` | holds | none |
| 0.4 (b) non-monotonicity example | `ℙ¹_ℤ`, trivial bundle, weights `2^{−j}f_j` | weights decrease; self-intersection `−(1/4π)∫i∂w∧∂̄w`: `0` (even `j`), negative (odd `j`) | holds | none |
| 0.4 conic Check | `xy = p²z²`, chart `z = 1` | `ℤ[y]/(p(y−p))` reduced Cartier; `x−p`, `y−p` independent in `𝔪/𝔪²` at the node | holds | none |
| 0.4 dependence on upper bound | `ℙ¹`, `D = {0}`, `u_b` | `u_b ≥ 0`, `sup = log(1/b²)`; mass on `{|z| ≤ b}` is `R²/(R²+b²) = ½` | holds | none |
| 4.3a (a), (b), Check | `Spec ℤ`, `O(c)`; moriwaki-2009 line 2413 | `vol = max(c, 0) ≥ c`; Moriwaki's hypotheses = nef on geometric fibres plus semipositive | holds | C02 |
| 4.3a (d) | `d = 1`: `Spec ℤ`, `Spec O_K` | lower: `c ≥ e ⇒ c ≥ e`; twist `M̄(−e)^d = M̄^d − d·e·deg` | holds | none |
| 4.3b (a) formula | `n = 1, 2, 3`; `A_σ = e^c·I` | `½Σ_{m<n}H_m = (n/2)(H_n−1)`: `0, ½, 5/4`; scaling changes both sides by `n·c·[K:ℚ]` | holds | R01 |
| 4.3b (a) against ChowForms §6.2 (a7) | `J̄ = Ē^∨` | `[K:ℚ](deĝ_n(Ē^∨) + ½ΣH_m) = [K:ℚ]·n(−μ̂ + ½(H_n−1))` | same theorem | R01 |
| 4.3b (b), (c) | `ℤ²`; `n = 1`; `s₁ ≥ 2` | bound `¼`, `x = (1,0)` gives `0`; `½(H_s−1) ≤ (s−1)/4 < 0.347(s−1)` | holds | none |
| 14.1 (a) on `ℙ¹_ℤ` | `Z = Spec ℤ`, `k = 1` | `−4E[log sin θ] = 2 = 2κ(1)·deg Ξ`, so `Ô(1)² = ½` | holds | none |
| 14.1 (a) on `Fl₃ → ℙ²_ℤ` | `k = 2`, `V = O³/ℓ` | independent recursion: `Ĥ₁²Ĥ₂² = 1 + ¾ = 7/4`; `Ξ̂⁴ = 24·7/4 − 50 = −8` = `4·⅔·(−3)` | holds | none |
| 14.1 equivalent forms, `κ` | general `D`, `k` | `C(D+1,2k)/C(D,2k−1) = (D+1)/2k`; `π_*ξ^{2k−1} = 2·disc^{k−1}`; `κ = ½, ⅔, 23/30, 88/105` | holds | none |
| 14.1 (v) Legendre integral | `k = 1, 2` | `∫log((1−u)/2)du = −2`, `∫…u²du = −8/9`; formula gives `−2`, `−8/9` | holds | none |
| 14.2 `N = 3` values | `Fl₃`, `|Ψ| = 1` | from `7/4`: `x₀²x₁² = −¾`, `x₀x₁³ = −¼`, `x₁⁴ = ½`; `ℓ⁴` matches `½b(a−b)(10a²+ab−b²)`; `41/2` at `(2,1,0)` | holds | none |
| 14.2 Check against 14.1 | transposition of `λ₀`, `λ₁` | `ĥ(a,b)+ĥ(b,a) = ½(a−b)²(a²+10ab+b²) = 2g₁u² + (4/3)g₃u⁴`, `g₁ = 3s²/4`, `g₃ = −¾` | holds | none |
| 14.2 (d) | `q = 1`; `ℙ¹` | `(N/2)(H_N−1) ≤ (N/2)log N`; `½ < log 2` | holds | none |
| 16.1 metric normalisation | `ℂ/(ℤ+τℤ)`; `τ = itI_g` | `‖dz‖² = Im τ/π` (Deligne); dual-form formula gives `t/π = π⁻¹(Im τ)₁₁` | holds | none |
| 16.1 statement | `g = 1`; `E₁ × E₂` | `−h(E) ≤ ½log 2π` (AGAH §6.5); `μ̂_max = max(−h(E_i))` bounded | consistent; source not locatable | C02 |
| 16.1 step (2) | rank `ρ = 1` key identity | AGAH §5.8: `−½h + ¼log((2π)^{−g}) = −½h − (g/4)log 2π` | matches | none |
| Downstream consumer pointers | ArithmeticVolumes §8.15 | §8.15 has (a), (a1)–(a3) only; uses are in §§8.15b, 8.15c | pointer slip | C01 |

- Source locators checked against the text: moriwaki-2009 lines 2383–2418 and 2395–2398 (Theorem 6.2, Example 6.1 (2), p. 40); yuan-zhang-2025 lines 1274–1294 (boundary divisor and boundary norm, §2.4, pp. 36–37); Announcement, all four pages (no mathematics of this roadmap); the [FormalProof] repository opened at `src`, `src/Lemmata`, `src/Development`, with no locator to follow.
- Library at the pins: Tau Ceti `Submodule.subspaceHeight` (`TauCeti/NumberTheory/Height/Arakelov/Subspace/Basic.lean:292`), `TauCeti.absoluteHeight2` (`…/Arakelov/Absolute.lean:52`), `TauCeti/AlgebraicGeometry/AbelianVariety/TangentSpace.lean`, `TauCeti/AlgebraicGeometry/Grassmannian`. Neither Tau Ceti nor Mathlib has Hermitian vector bundles over `O_K`, Arakelov degrees or arithmetic intersection numbers; the docstring's claims hold.
- Cross-roadmap citations resolved: ArakelovGeometryAndAbelianHeightsPartII §§0.1, 0.3, 1.2, 1.3, 3.1, 3.3 (3), 4.2, 4.3; HeightsRationalPointsAndObstructions §§5.17a, 5.17d, 5.17f; SingularHermitianMetricsAndL2Methods §§5.3, 5.5, 7.7 (a)–(d), 7.8 (a)–(d) with its first and fourth Checks; SlopesOfHermitianVectorBundles §§1.3, 2.1, 4.3; on main ArakelovGeometryAndAbelianHeights §§1.1–1.6, 1.12, 2.7, 2.8, 5.1, 5.8, 6.5, ResolutionOfSingularitiesCharacteristicZero §§5.1, 5.5, 6.2, ComplexComparisonPartII C5.4, SchubertGeometry S1.1, S3.5, AbelianSchemesAndArithmeticModuli §§A5.1–A5.4, DiophantineApproximationAndTranscendence §2.5; FaltingsFinitenessAndIsogenyTheoremsPartII §2.3; consumer ArithmeticVolumes §§8.11, 8.15–8.17. All exist and say what is cited, except the two pointers of C01.
- Supplier order: the dependency check reports 170 roadmaps, 1987 edges, 0 problems (no UPWARD or CYCLE line). The family suppliers SingularHermitianMetricsAndL2Methods and SlopesOfHermitianVectorBundles come before this roadmap in the family index; ChowFormsAndHeightsOfSubvarieties (R01) does as well.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no messages. The file declares nothing, so there was nothing to `#check` and no one-tactic probe; there is no padding.
- Headlines: (1) limit numbers 0.4 (b)–(c), (2) 4.3b (a)–(b), (3) reflection formula 14.1 (a), (c), (4) 16.1. All four are named in the module docstring as not statable, with the missing carriers.
- Overlap check: read ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, SingularHermitianMetricsAndL2Methods, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, ChowFormsAndHeightsOfSubvarieties, SlopesOfHermitianVectorBundles and ArakelovGeometryAndAbelianHeights. One object is shared: the height of the projective bundle of a Hermitian vector bundle (4.3b (a) here, §6.2 (a7) there), whose owner is ChowFormsAndHeightsOfSubvarieties (R01). The regularisations and mixed measures are owned by SingularHermitianMetricsAndL2Methods and cited here. ArithmeticVolumes cites this roadmap and owns nothing of it. ProjectiveModels' seminegativity over curves (6.2a) is a different statement.

Source independence: 6 passages compared with 3 sources (moriwaki-2009, yuan-zhang-2025, Announcement); none shares wording beyond forced formulas. The README gives no theorem or page locators. The largest share of attributions is [FormalProof], 3 of 11; its contents could not be compared, as it is a Lean repository with no locator given. The layer order is forced by the *Needs* lines (4.3a needs 0.4, 16.1 needs 4.3b, 14.1 (c) needs 0.4): independent.

Research link: Layers 0 and 14 extend Gillet–Soulé (1990) and Bost–Gillet–Soulé (1994) intersection theory to log-log metrics, alongside Burgos Gil–Kramer–Kühn (2007). 4.3a extends Moriwaki's generalised Hodge index theorem (2009); 4.3b is the Zhang (1995) / Roy–Thunder (1996) absolute Siegel lemma; 16.1 complements Bost (1995). The README References support this, and moriwaki-2009 for 4.3a.

## Not verifiable

- [FormalProof] for 0.4 (c)(iii), 14.1 (c) and 16.1: no file or declaration is named, and the repository could not be searched for the statements.
- Bost–Gillet–Soulé 1994: no legal copy found by the sources service. The 4.3b (a) and 14.1 values were checked by independent computation instead.
- Gillet–Soulé 1990, Zhang 1995, Roy–Thunder 1996, Tamvakis 1999, Maillot 2000, Burgos Gil–Kramer–Kühn 2007, Kühn 2001, Bost 1995 and Moret-Bailly 1985 are cited without locators and were not opened.

Automatic checks set aside as false positives: the rule that a pull request changes nothing outside the roadmap folder under review (so that no other roadmap is edited without its own review) flagged only the three index files of the Riemann Hypothesis for Dirichlet L-functions family, which this pull request owns as the family's index; and the full gate's note that the roadmap is absent from the merge order, which is not a defect, since the standalone dependency check places it after its last supplier and reports no problem.

## Source issues

- none

## For the human reviewers

- 0.4 (c)(iii), 14.1 (c) and 16.1 are credited to a Lean formalisation announced on 20 November 2026 (README lines 259–260). 16.1 "is not attributed to a published source" (README line 209). The announcement (Announcement p. 1) says no written account exists yet.
- Licence: the announcement was read at `alpo.ge`, which I recorded as the author's own page because the domain matches the author's surname; please confirm. The licence of the GitHub repository was not checked.
- Not tested: the source with the largest share of attributions ([FormalProof]) gives no locator, so neither the wording nor the arrangement was compared with it.
