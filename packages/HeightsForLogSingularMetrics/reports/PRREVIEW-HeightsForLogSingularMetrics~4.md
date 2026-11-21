# Review of HeightsForLogSingularMetrics (pull request #2894 at 2c30dcc)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HeightsForLogSingularMetrics/`
**Verdict:** accepted

**Summary.** Accepted: I found no false or unsupported statement. Every Check and numerical witness was recomputed (the heights `½`, `5/4`, `−8`, `41/2`, the `κ(k)`, the `Fl₃` polynomial, the rate constants `10.8` and `2.2`, the conic example), every cited supplier section was opened and says what the README takes from it, and Moriwaki's Corollary 6.4 supports 4.3a (b) as stated. The head is the one the previous review read, so its three remarks stand unrepaired and are repeated below with two new ones: four small corrections and one format note, none blocking. One question on the error term of 16.1 step (3), and four points for the human reviewers (the unpublished source of 16.1 and its missing licence among them).

## C01 — The [FormalProof] credits and the Zhang and Roy–Thunder entries give no locator, so the credited results cannot be found in their sources

A reader who wants to check 0.4 (c)(iii), 14.1 (c) or the jet step of 16.1 (README line 182, with its constant `½log(e·n·n/3)`) against the source is given a repository and nothing else (References, line 263). The repository's front page names only its challenge and main files; no module on slopes, the Siegel lemma or the reflection formula is named there. Zhang 1995 and Roy–Thunder 1996 (line 260) are cited for 4.3b without a theorem or page.

The smallest change: name, for each [FormalProof] credit, the Lean file and theorem; give the theorem numbers for Zhang's successive minima (HeightsRationalPointsAndObstructions §5.17f cites it as Theorem 5.2, pp. 208–211) and for Roy–Thunder's absolute Siegel lemma.

## C02 — The description says every pull request of the family carries an identical family index; the heads differ

The description's sentence "carried, with identical content, by every pull request of the family" is false at the present heads. Against this pull request's `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, the index of #2884 and #2911 is the same, that of #2891 and #2879 differs in 5 lines, and that of #2880, #2882, #2909 and #2923 in 47 lines (51 in #2883, 57 in #2910). The index here is the older one: its ChowFormsAndHeightsOfSubvarieties entry (line 111) does not mention the heights of cycles in the projective space of a Hermitian vector bundle, which 4.3b (a) now cites from that roadmap's §6.2.

Would you bring this pull request's index to the later version, or drop "with identical content" and say which version merges first?

## C03 — The README takes conventions from, and says it extends, FaltingsFinitenessAndIsogenyTheoremsPartII, which merges later and uses another normalisation of the height

The last sentence of Conventions (line 17) says that conventions not restated are those of, among others, FaltingsFinitenessAndIsogenyTheoremsPartII, and the overview (line 7) says the roadmap "extends" it. That roadmap is placed after this one in the merge order, appears in no *Needs:* line, Dependencies paragraph or supplier contract, and its Conventions fix `h_F` in the Faltings normalisation, whereas 16.1 states `h(A)` in Deligne's. Nothing in 16.1 uses its conventions: the Hodge inner product and `h(A)` are defined in 16.1 itself. A reader following line 17 would import the wrong normalisation.

The smallest change: remove that roadmap from the sentence of line 17, and in line 7 keep only the comparison ("Layer 16 complements the bound of … §2.3"), which is what the Check of 16.1 and the scope section already say.

## C04 — The key degree identity with its constant is credited to *Pinceaux de variétés abéliennes* alone

The References entry for Moret-Bailly (line 262) credits "the models and the key degree identity used in 16.1" to Astérisque 129. The identity 16.1 uses is the metrised one, `deĝ_n(π_*ℒ̄) = −½h(A) − (g/4)·log 2π`. Bost's exposé, which the README also lists, attributes that slope formula in the principal case to Moret-Bailly's later paper on the functional equation of the theta function (Compositio Math. 75 (1990), 203–217), resting on the monograph (pp. 16–17 of the Numdam file, after Théorème 4.2 (ii)). ArakelovGeometryAndAbelianHeights §5.8 takes it from Pazuki, Theorem 3.4 (v).

The smallest change: add the 1990 paper to that entry.

## N01 — `ZLattice` is a namespace at the pinned Mathlib, not a declaration

The module docstring of `Suggested.lean` (line 58) says Mathlib has `ZLattice`. At the pin the class is `IsZLattice` (`Mathlib/Algebra/Module/ZLattice/Basic.lean:434`); `ZLattice` is only the namespace of `ZLattice.covolume` (`Mathlib/Algebra/Module/ZLattice/Covolume.lean:62`, `:73`). Write `IsZLattice`.

## Questions for the author

- 16.1, step (3), line 182: the error term is written `O((h⁺ + g·log(2 + g + h⁺))/n)`. The inputs named for the comparison of sup and `L²` norms are those of ArakelovGeometryAndAbelianHeights §5.8, whose matrix lemma has the constant `C(g) = (8g/π)(1 + 2g²log(4g))` and whose theta bound has `log c(g)` of the order of `g⁴`, both stated for a fixed `r`. With `n ≍ (2 + g² + h⁺)² ≥ g⁴` the conclusion `O(log(2 + g + h⁺))` survives these constants, but the displayed term is smaller than what §5.8 supplies. Is a sharper comparison used, or should the term read with the constants of §5.8? What stopped me: the argument is credited to [FormalProof] without a file or declaration.

## Previous findings

The previous review, of this same head, had no finding. Its remarks:

- C01 (locators of [FormalProof], Zhang, Roy–Thunder): not repaired; "It is the source of the close regularisations and the rate with exponent `2`" (line 263) still names no file. C01 above.
- C02 (identical family index): not repaired; the description is unchanged. C02 above, with the present counts.
- N01 (`ZLattice`): not repaired; "for which Mathlib has `ZLattice`" (line 58). N01 above.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / independent) | Result | Change |
|---|---|---|---|---|
| 0.4 predicate and Hodge Check | `‖dz‖² = Im τ`, `q = e^{2πiτ}` | `φ = −log Im τ ∼ −log log(1/|q|)`; `φ ≤ C`, `φ ≥ −Cℓ_s`; `−log y` psh | holds; matches §5.1 with exponent 0 on `‖e‖^{−1}` | none |
| 0.4 (b) non-monotone `I_t` | `ℙ¹_ℤ`, weights `2^{−j}f_j` | `2^{−j} ≥ 2^{−j−1}f` (`f ≤ 2`), `2^{−j}f ≥ 2^{−j−1}`; values `0`, `−(4^{−j}/4π)∫i∂f∧∂̄f` | decreasing weights, alternating `I` | none |
| 0.4 (b) route, `i∂∂̄ψ_τ` | `u = |s|²`, `ξ = ∂log u` | `∂∂̄log(u+τ) = uτ/(u+τ)²·ξ∧ξ̄ + u/(u+τ)·∂∂̄log u`; `g_τ ≤ 1/(4P_τ)`; `ℓ_s ≤ 6loglog` at `L = log 4`: `1.87 ≤ 1.96` | holds | none |
| 0.4 (c)(ii), (iii) rates | layer cake with `μ(λ>x) ≤ C·log x/x` | bulk `∫_1^{log(1/t)} log x/x = ½(loglog)²`; tail `(loglog)²/log`; total `(loglog)³/log`, close: `(loglog)²/log` | holds | none |
| 0.4 (c) constants at `t = e^{−1/s²}` | `x = log(1/s)` | `8x³e^{−x}` max at `x=3`: `10.754`; `4x²e^{−x}` max at `x=2`: `2.165` | `≤ 10.8`, `≤ 2.2` | none |
| 0.4 Checks 5, 6 | `φ = −log log(1/|z|²)` | `Δφ = 4/(r²L²)`; mass on `{|z|<s}`: `4π/log(1/s²)`; `(i/2π)∂∂̄` mass `1/log(1/ρ)`; ratio `πc·log(16/t²)/16` | holds | none |
| 0.4 Check 8 | `u_b` on `ℙ¹`, `D = {0}` | `u_b ≥ 0 ⇔ |z|²(1−b²) ≥ 0`; `sup = log(1/b²)`; mass of `{|z| ≤ b}`: `½` | holds | none |
| 0.4 Check 9 | conic `xy = p²z²`, chart `z = 1` | `ℤ[y]/(p(y−p))` reduced; `x−p`, `y−p` independent in `𝔪/𝔪²` (dimension 3), quotient `ℤ` | not principal at the node | none |
| 4.3a (b) | `Spec ℤ`, `O(c)`; moriwaki-2009 lines 2395–2418, 2467–2471 | `max(c,0) ≥ c`; Cor. 6.4: nef on geometric fibres, semipositive ⇒ `vol ≥ deg` | locator and hypotheses match | none |
| 4.3a (d) | `Spec ℤ`; trivial bundle `O(c)` on `ℙ¹_ℤ` (`deg = 0`) | `c ≥ e ⇒ c ≥ e`; `0 ≥ 2e·0`, `0 ≤ 2e·0`; `M̄(−c)^d = M̄^d − dc·deg` | both halves hold | none |
| 4.3b (a) against ChowForms §6.2 (a7), `J̄ = Ē^∨` | `n = 1, 2, 3` | `Σ_{m<n}H_m = 0, 1, 5/2 = nH_n − n`; `Ō(1)^n = 0, ½, 5/4` for `ℤ^n` | same identity | none |
| 4.3b (b) | `n = 1`; `ℤ²`; rescaling by `e^{−c}` | constant `0`; `¼ + η`, `x = (1,0)` gives `0`; both sides `−nc[K:ℚ]`; contradiction `−nη[K:ℚ] < 0` | holds | none |
| 4.3b (c) | `s = 2`; `ℤ²` | `½(H_s−1) ≤ (s−1)/4 < 0.3466(s−1)`; `λ^abs = 1`, bound `e^{1/4}` | holds; agrees with Slopes §4.3 | none |
| 14.1 (a), `ĥ(u)+ĥ(−u)` | binomial identity; `Z = Spec ℤ`, `ℤ²` | `2C(D+1,2k)2^{−2k}·2κ·2^{2k−1}/C(D,2k−1) = (D+1)κ/k`; `Ξ̄² = 4·½ = 2 = 2κ(1)·2` | holds | none |
| 14.1 `disc`, `κ`, split integral | `Ξ = c₁ + 2ξ`, `ξ² + c₁ξ + c₂ = 0` | `Ξ² = c₁² − 4c₂`; `κ = ½, ⅔, 23/30, 88/105`; `∫log((1−u)/2)u^{2k−2} = −2, −8/9` | holds | none |
| 14.1 Check on `Fl₃` | `Ξ = −x₀ − 2x₁`; other fibration `x₁ − x₀` | `(x₀+2x₁)⁴ = 10 − 18 − 8 + 8 = −8`; `(x₁−x₀)⁴ = ½+1−4.5−5 = −8`; `k=1`: `0+5−3 = 2 = deg` | consistent with 14.2 values | none |
| 14.1 (b) telescoping | `T = A^{2i}B^{2k−1−2i}M^r` | sum `= A^{2k}B − B^{2k+1}`; `I_Y = ½·Σ(−2∫)`; `k=1`: `−4·(−½) = 2` | holds | none |
| 14.2 (b) route, (c) | general `N`; `N = 3` | coefficient of `x_i`: `λ_i − λ_{N−1} + λ_{N−1}`; `ℓ⁴ = 5a³b − 4.5a²b² − ab³ + ½b⁴ = ½b(a−b)(10a²+ab−b²)`; `41/2` | holds | none |
| 14.2 Check, symmetrised | `s = a+b`, `u = a−b` | `g₁ = 3s²/4`, `g₃ = −¾`; `1.5s²u² − u⁴ = ½(a−b)²(a²+10ab+b²)` | equals 14.1 (a) | none |
| 14.2 (d) | `q=1, N=2`; `ℙ^{N−1}` | `log 2 > ½`; `(N/2)log N ≥ (N/2)(H_N − 1)`; `det(AA^*) ≤ N^q` | holds | none |
| 16.1 metric | `ℂ/(ℤ+τℤ)`; product of elliptic curves | `Im H(1,τ) = −1`; `‖dz‖² = Im τ/π` three ways; `∏Im τ_j/π` for both determinant metrics | consistent with §2.7 | none |
| 16.1 statement and step (1) | `g = 1`; `E₁ × E₂` | `−h(E) ≤ ½log 2π`; `μ̂_max = max(−h(E_i))`; `½(H_k−1) ≤ ½log g` gives `C + 1` | holds | none |
| 16.1 steps (2), (3) | `ρ = 1`; jets of order `≤ n/3` | §5.8: `−½h − (g/4)log 2π`; `L^n` separates jets to order `n − 2 ≥ n/3`; unitriangular change of trivialisation keeps the minor | shape holds; error term not verified | question |
| Description: identical index | index at ten sibling heads | differing lines `0, 0, 5, 5, 47, 47, 47, 47, 51, 57` | sentence false | C02 |
| Conventions, line 17 | merge order; FaltingsFinitenessAndIsogenyTheoremsPartII Conventions | later than this roadmap; `h_F` Faltings there, Deligne in 16.1 | misleading import | C03 |

- Source locators checked against the text: moriwaki-2009 lines 2385–2418 (p. 40) and 2460–2471 (pp. 41–42); Bost's exposé (Numdam) pp. 16–17 and 21–22; the Announcement (190 lines, no mathematics of these sections).
- Library declarations opened at the pins: Mathlib `IsZLattice`, `ZLattice.covolume`; Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety` (`AlgebraicGeometry/AbelianVariety/Basic.lean:95`, with `TangentSpace.lean`), `Submodule.subspaceHeight` (`NumberTheory/Height/Arakelov/Subspace/Basic.lean:292`), `AlgebraicGeometry/Grassmannian`, `AlgebraicGeometry/LineBundle/Degree.lean`. No Hermitian vector bundle over `O_K`, Arakelov degree or arithmetic intersection number at either pin.
- Cross-roadmap citations resolved, each section opened: ArakelovGeometryAndAbelianHeightsPartII §§0.1, 0.3, 1.2, 3.1, 3.3 (3), 4.2, 4.3 (3); HeightsRationalPointsAndObstructions §§5.17a, 5.17d, 5.17f (both named declarations); ArakelovGeometryAndAbelianHeights §§1.3, 1.12, 2.7, 2.8, 5.1, 5.8, 6.5; ResolutionOfSingularitiesCharacteristicZero §§5.1, 5.5, 6.2; ComplexComparisonPartII C5.4; SchubertGeometry S1.1, S3.5; AbelianSchemesAndArithmeticModuli A5.1–A5.4; SingularHermitianMetricsAndL2Methods §§7.7 (a)–(d), 7.8 (a)–(d); SlopesOfHermitianVectorBundles §§1.3, 2.1, 4.3; ChowFormsAndHeightsOfSubvarieties §6.2 (a), (a4), (a7); DiophantineApproximationAndTranscendence §2.5; FaltingsFinitenessAndIsogenyTheoremsPartII §2.3; the downstream §§8.11, 8.15–8.17.
- Dependency check: `depcheck: 171 roadmaps, 1994 edges, 0 problem(s)`; no UPWARD or CYCLE line. The worker's automatic checks all passed.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no message. The file declares nothing, so there is no signature to compare and no one-tactic probe to run; nothing is padding.
- Headlines: (1) 0.4 (b)–(c); (2) 4.3b (b); (3) 14.1 (a), (c); (4) 16.1. None is statable at the pins; the module docstring names each with the carriers it lacks.
- Changes outside the folder: only the three family index files, which are this pull request's own.

Overlap check: read ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, SingularHermitianMetricsAndL2Methods, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, ChowFormsAndHeightsOfSubvarieties, SlopesOfHermitianVectorBundles, ArakelovGeometryAndAbelianHeights. The height of the projective space of a Hermitian vector bundle: ChowFormsAndHeightsOfSubvarieties §6.2 (a7), cited here. The complex regularisation and mixed measures of log-log weights: SingularHermitianMetricsAndL2Methods §§7.7–7.8, cited here; the arithmetic predicate, adelic bundle and limit numbers are owned here. The single-vector bound `½(H_{s₁} − 1)`: owned here, and SlopesOfHermitianVectorBundles §4.3 says so. The logarithmic-singularity predicate: ArakelovGeometryAndAbelianHeights §5.1, cited. ProjectiveModels shares nothing.

Source independence: 6 passages compared with 3 sources (4.3a (b) and the Moriwaki reference with moriwaki-2009; the 16.1 metric, statement and step (2) with Bost's exposé; the summary and the `Suggested.lean` docstring with the Announcement), none shared; largest share [FormalProof], credited for 3 results against 1 located citation of moriwaki-2009, with no table of contents to compare; contents compared with moriwaki-2009: independent. Zhang 1995, Bost–Gillet–Soulé 1994 and Roy–Thunder 1996 could not be read.

Research link: Layers 0 and 14 extend the intersection theory of Gillet–Soulé (1990) and Bost–Gillet–Soulé (1994) to log-log metrics, beside Burgos Gil–Kramer–Kühn (2007); 4.3a extends Moriwaki's generalised Hodge index theorem (2009); 4.3b follows Zhang (1995) and Roy–Thunder (1996); 16.1 complements Bost (1995). Rests on the README's References, moriwaki-2009 and Bost's exposé.

## Not verifiable

- [FormalProof], for 0.4 (c)(iii), 14.1 (c) and 16.1: no file or declaration is named, and the repository's front page names none for these subjects.
- Zhang 1995 and Bost–Gillet–Soulé 1994 (J. Amer. Math. Soc.): the publisher's pages are on a host the sources service does not classify; not read.
- Roy–Thunder 1996: the open repository returned the journal's landing page, not the article; not read.
- Bost's exposé, Proposition 5.3: the displayed inequalities are lost in the text extraction; only the statement's hypotheses and constants were read.

## Source issues

- none

## For the human reviewers

- Scope: 0.4 (c)(iii), 14.1 (c) and all of 16.1 rest on a Lean formalisation announced on 20 November 2026; the README says 16.1 "is not attributed to a published source" (line 209), and the Announcement (lines 45–49) says no written account exists yet.
- Licence: the repository the README links for [FormalProof] states on its front page that the submission was published without a licence and is mirrored for verification only.
- Licence: the Announcement was read at `alpo.ge`, recorded as the author's own page; please confirm the host.
- Not tested: [FormalProof], the source with the largest share of credits, has no locator; neither wording nor arrangement (nor the origin of the section ids 0.4, 4.3a, 4.3b, 14.1, 14.2, 16.1) was compared with it.
