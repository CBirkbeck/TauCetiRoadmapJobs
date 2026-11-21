# Review of ChowFormsAndHeightsOfSubvarieties (pull request #2891 at 6ac76a4)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ChowFormsAndHeightsOfSubvarieties/`
**Verdict:** needs changes

**Summary.** The mathematics holds up. The three headlines (6.1, 6.2 (b), 6.2 (a7)), the change-of-metric formula 5.17a and every worked Check were recomputed, by hand or numerically, and agree, and the empty `Suggested.lean` is justified because the pins have none of the carriers. One finding blocks: the height of the projective space of a Hermitian vector bundle (6.2 (a7)) is also owned, with its own proof, by HeightsForLogSingularMetrics §4.3b (a), whose head does not cite this roadmap, so this README's claim that it does is untrue as things stand. There are five small corrections and one format note. The human reviewers have to decide on the two sources for 6.1, which could not be read legally, and on the parts that cite no published source.

## R01 (P2) — The height of `ℙ(J^∨)` for a Hermitian vector bundle has two owners: 6.2 (a7) here and HeightsForLogSingularMetrics §4.3b (a)

With two owners, the same theorem would be formalised twice by two different routes. Also, two sentences of this README describe a citation that the other roadmap does not make. HeightsForLogSingularMetrics is an open roadmap of the same family. In its §4.3b (a) (its README line 93) it states that for `P = Proj Sym E^∨` the self-intersection is `Ō(1)^n = [K:ℚ]·n·(−μ̂(Ē) + ½(H_n − 1))`. It proves this by its own route (line 99: first the Cartier recursion for the standard metric, then a change of metric along `exp(sT)`). It lists the height of the projective bundle among what it owns (line 207), and its *Needs* line (line 101) does not name this roadmap.

With `J̄ = Ē^∨` this is exactly 6.2 (a7). Here `deĝ_n(Ē^∨) + ½·Σ_{m=1}^{n−1} H_m = −n·μ̂(Ē) + (n/2)(H_n − 1)`, by `Σ_{m=1}^{n−1} H_m = n·H_n − n`. Its route (line 99) changes the metric by the non-constant function `f = log(|A_σx|/|x|)`, which is this roadmap's 5.17a, and cites nothing for that step. Its contract with HeightsRationalPointsAndObstructions §5.17a (line 219) covers only a constant change. So two sentences here are not true of that head: the Downstream consumers bullet saying its §4.3b (a) "is 6.2 (a7)" and uses "the formula of 5.17a" (line 414), and the Scope sentence saying it uses these statements (line 424).

Smallest change: the family index lists this roadmap (line 111) before HeightsForLogSingularMetrics (line 114), so ownership stays here. HeightsForLogSingularMetrics §4.3b (a) should cite 6.2 (a7) with `J̄ = Ē^∨` (its normalised height is the (a7) value divided by `n`) and should cite 5.17a for the change of metric. It should also drop the height of the projective bundle from its ownership paragraph. No statement of this README changes. The finding closes when that head does this.

## C01 — The first headline is credited to two sources without theorem or page, and 5.17a and 6.2 name no source

As written, a reader cannot check 6.1 against the literature. Bost–Gillet–Soulé and Philippon appear only in the References (line 450), with no theorem number or page. 5.17a and 6.2 (a1)–(a7), (b) cite nothing. Would the author add the theorem and page of each source that states 6.1 (and 6.2 (b), if a published source does)? Where a statement has no published source, say in its section that it is proved here by the route given. This review could not open either text, so the author has to supply these locators.

## C02 — The routes of 6.1 (iii) and 6.2 (b) use the Poincaré–Lelong formula and integration over singular analytic cycles, but no *Needs* line names their owner

As written, the supplier list leaves out an input that the Crofton formula rests on. ComplexComparisonPartII C5.4 (on main) owns both, as `lelongPoincareSection` and `AnalyticCycleIntegration`, in the normalisation `(i/π)∂∂̄ log ‖s‖ = [div s] − c₁`, which agrees with the one used here. The README cites Griffiths–Harris instead (line 452). Add "ComplexComparisonPartII C5.4" to the *Needs:* of 6.1 (line 166) and 6.2 (line 348), and add a `### From TauCetiRoadmap.ComplexComparisonPartII` contract.

## C03 — ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.15c and 8.16 do not use 6.1

The Downstream consumers bullet (line 413) says that "§§8.15c, 8.16 and 8.18 use 6.1". At that roadmap's head, §§8.15c–8.16 (its lines 578–735) cite neither this roadmap nor Chow forms, and its contract for this roadmap (line 1915) says "Used in 8.18, 8.18e". Change it to "§8.18 uses 6.1 …".

## C04 — The family index credits this roadmap with Chow forms and spherical heights, which it cites from other roadmaps

The family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 111–113) describes this roadmap as "Chow forms of projective subvarieties, spherical heights of multihomogeneous forms, and the heights of subvarieties they define". The README takes Chow forms from AlgebraicModuliForArithmeticGeometry §1.6 and spherical heights from SlopesOfHermitianVectorBundles §6.6 (line 422). A more accurate blurb: "the change of metric in arithmetic intersection numbers, the comparison of the Fubini–Study height of a projective cycle with the spherical height of its Chow form, and heights of cycles in the projective space of a Hermitian vector bundle".

## C05 — Two sentences of the pull request's description do not match the head

The sentence "is carried, with identical content, by every pull request of the family" does not hold for FiniteReductiveGroups: at its head, three lines of the family index without the credit to the formal proof stand in place of lines 9–14 here. Either say that the heads are being brought to one version, or name the differing one. The sentence "the targeted Lake build succeeds with `sorry` as the only warning" is also wrong: `Suggested.lean` contains no `sorry` and elaborates with no message. Write "builds with no warning".

## N01 — Layer 5's only section is numbered 5.17a, which is also the id of the HeightsRationalPointsAndObstructions section it extends

The text writes both "5.17a" and "HeightsRationalPointsAndObstructions §5.17a" for the change-of-metric material (for example lines 288 and 414). A consumer has already merged the two. One option would be to write "5.17a of this roadmap" where the bare id appears; another would be to renumber Layer 5, which no roadmap cites yet.

## Questions for the author

- Is 6.2 (b), the comparison relative to a Hermitian vector bundle `J̄`, stated in Bost–Gillet–Soulé §4 or in Bost's work on heights of cycles in `ℙ(E^∨)`? If so, what is the locator? The text could not be opened legally here.

## Verified sound

| Statement | Instances tried | Values computed (this side / other side) | Result |
|---|---|---|---|
| 5.17a change of metric | `ℙ¹_ℤ`, `L̄_0` trivial, `L̄_1 = Ō(1)`, `f = |x_0|²/‖x‖²`; `f ≡ t` | `0 + ∫ f c₁ = ½` (symmetry with `|x_1|²/‖x‖²`, sum `1`); `[K:ℚ]·t·deg`, the constant-change Check of the supplier | holds |
| 6.1 headline | `[1:1] ∈ ℙ¹(ℚ)`; `ℙ¹`; linear `ℙ^d ⊂ ℙ^n` | `½log2` vs `½log2 − ½`, difference `½`; `½` vs `−½`, difference `1`; `½ΣH_m + ½((d+1)H_n − ΣH_m) = ((d+1)/2)H_n` | holds |
| 6.1 degenerate cases | `n = 0`; `Z = 0`; `d = 0` point of degree 2 `[1:i]` | both sides `0`; `F = 1`, both `0`; `log2` vs `log2 − 1`, difference `1 = ½·2` | holds |
| 6.1 (ii) | `{X_0 = pX_1}`, `s = e_0`; `{X_1² = 2X_0X_2}`, `s = ½e_1`; `[1:0]`, `s = p⁻¹e_0` | `−log p` both sides; `log 2` both (`ord_W = 1 − 2`); `log p` both | holds |
| 6.1 (iii) | `{X_0 = pX_1}`, `s = e_0`, `n = 2` | `m(F) − m(pV_2) = ½log(p²+1) − log p − ¼` = `−∫log‖X_0‖c₁ − ¾` | holds |
| 6.1 double-fibre Check | `∫log‖X_0‖c₁`, `∫log‖X_1‖c₁`, `E log|Σw_k²|` on `S⁵` | quadrature `−1.999998` / `−2`; `−1.306848` / `log2 − 2 = −1.306853`; Monte Carlo `−0.4997 ± 0.0004` / `−½` | holds |
| 6.1 quadric-surface Check | Segre quadric, `d = 2`, `n = 3` | `E log|m|² = ψ(3)+ψ(2)−2ψ(4) = −7/6`; `E log|det| = −4/3`; `3 + 5/2 = 11/2 = c(2,3)·2` | holds |
| 6.2 (a5)/(b), point | `ℚ(i)`, Gram `[[2,i,0],[−i,3,1],[0,1,5]]`, `ξ = (1,−2,3)` | `ξG⁻¹ξ* = 5.347826 = 123/23`, `det = 23`; `0.83835` vs `0.08835`, difference `¾` | holds |
| 6.2 (b), dualisation | `ℤ²`, Gram `diag(1,t)`, `[1:2]` | `½log(1+4/t)` falls in `t`; undualised `½log(1+4t)` would rise | holds |
| 6.2 (a7) | `N = 1`; `ℤ²`, Gram `[[2,1],[1,3]]`; `ℚ(i)` bundle above | `deĝ_n(J̄)` via (a5) and `deĝ(J̄^∨) = −deĝ(J̄)`; `−0.30472` both sides; `−0.31775` both | holds |
| 6.2 (a4)/(a6), rescaling at one place | `ℚ(2^{1/3})`, `λ = 0.3`, curve of degree 2 | complex `2·0.3·4/3 = 0.8`, real `0.4`, both sides; over `ℚ`: `0.3`, `0.6` | holds |
| 6.2 conic Check | standard metric; Gram `[[2,1,0],[1,3,1],[0,1,5]]` | height `1.604601` (quadrature) vs `m(F) + 3 = 1.60431 ± 0.0006` (Monte Carlo); `−0.488373` vs `−3.48862 + 3 = −0.48862 ± 0.0006` | holds |
| 6.2 index-2 sublattice | `M′ = ℤe_1 ⊕ 2ℤe_2`, `[2:1]`, `[1:2]`, `ℙ¹` | both sides fall by `log 2`; unchanged; `deĝ_n = −log 2`, recursion gives `−log2 + ½` | holds |
| 6.2 (b) route, step (3)–(4) | `d/dt log‖ξ‖^∨_t`; `∫ξ(Xw)/ξ(w)dν` | `ξXe^{2tX}ξ*/ξe^{2tX}ξ*` = Rayleigh quotient at `ξ^♯ = e^{2tX}ξ*`; `X_11 +` phase-averaged zero | holds |
| Wrong constants (Checks) | `(d+1)H_n` in place of `((d+1)/2)H_n`; spanning family of length `n = 3` | `c(0,1) = 1` vs `½`; `¾` vs `½` | rejected as stated |
| R01 identification | HeightsForLogSingularMetrics §4.3b (a) with `J̄ = Ē^∨` | `−deĝ_n(Ē) + ½Σ_{m<n}H_m = −nμ̂ + (n/2)(H_n − 1)` = its `Ō(1)^n/[K:ℚ]` | same object |
| `Suggested.lean` | elaboration at the pins; one-tactic probe | exit 0, no message; no declaration, so nothing to probe and nothing to `#check` | holds |

- Source locators checked against a text: 0 (the README has none). Bost–Gillet–Soulé and Philippon could not be read; Gillet–Soulé 1990 was read and does not contain Chow forms or projective-space heights.
- Library declarations opened at the pins: `Polynomial.gaussNorm_mul` (Mathlib `RingTheory/Polynomial/GaussNorm.lean:277`), `MeasureTheory.Measure.toSphere` (`MeasureTheory/Constructions/HaarToSphere.lean:52`), `Polynomial.mahlerMeasure` (`Analysis/Polynomial/MahlerMeasure.lean:81`), `AlgebraicGeometry.AlgebraicCycle` (`AlgebraicGeometry/AlgebraicCycle/Basic.lean:44`), `TauCeti.height2` (`NumberTheory/Height/Arakelov/Basic.lean:65`), `TauCeti.AlgebraicGeometry.Chow.ChowGroup` (`AlgebraicGeometry/Chow/Basic.lean:295`). No Hermitian vector bundle, Fubini–Study metric, Chow form or arithmetic intersection number exists at either pin, so the headlines are not statable.
- Cross-roadmap citations resolved: HeightsRationalPointsAndObstructions §§5.9b, 5.17a (open head); SlopesOfHermitianVectorBundles §6.6 (i), (ii), (vi) and §6.7a (i) (open head); AlgebraicModuliForArithmeticGeometry §1.6 and ArakelovGeometryAndAbelianHeights §§1.1–1.3, 1.5, 1.6 (main); the consumers ArithmeticVolumes… §§8.18, 8.18e and HeightsForLogSingularMetrics §4.3b (open heads). All exist with the stated content, except as noted in R01 and C03.
- Dependency check: `depcheck: 171 roadmaps, 1991 edges, 0 problem(s)` (no UPWARD or CYCLE line). Automatic checks: all passed.
- Outside-folder diff: only the three family-index files, which belong to this pull request.
- Overlap check: read SlopesOfHermitianVectorBundles, HeightsForLogSingularMetrics, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ArakelovGeometryAndAbelianHeightsPartII and SingularHermitianMetricsAndL2Methods (open), and ArakelovGeometryAndAbelianHeights (main). Shared objects: the height of `ℙ(J^∨)` (owner: this roadmap; also owned by HeightsForLogSingularMetrics §4.3b, R01); spherical heights and `ν` (owner: SlopesOfHermitianVectorBundles §6.6, cited here); Hermitian vector bundles and their degree (owner: ArakelovGeometryAndAbelianHeights §§1.1–1.6, cited here); Poincaré–Lelong (owner: ComplexComparisonPartII C5.4, C02).
- Source independence: 4 passages (the 5.17a statement and route, the routes of 6.1 (ii) and (iii)) compared with 1 readable source (GS90); none shared. The README has no source locator, so no source has a share (the References name 4 works). Contents were not compared with Bost–Gillet–Soulé, the source cited for the main headline, because it could not be read.
- Research link: 6.1 is the comparison theorem of Bost–Gillet–Soulé (1994) and Philippon (1991) between the Fubini–Study height of a cycle and the spherical Mahler measure of its Chow form. In this family it turns the explicit arithmetic Hilbert–Samuel inequalities of SlopesOfHermitianVectorBundles §§6.7–6.7a into height bounds in ArithmeticVolumes… §§8.18, 8.18e. This rests on the README's Summary and References and on those roadmaps' heads.

## Not verifiable

- Bost–Gillet–Soulé, J. Amer. Math. Soc. 7 (1994): the sources service found no legal copy (the AMS landing page is on a host in no licence class); 6.1 could not be checked against it.
- Philippon, Math. Ann. 289 (1991): paywalled (Springer DOI), recorded as uncertified; 6.1 could not be checked against it.
- Griffiths–Harris (1978): a book, not fetched; it is cited only for the Poincaré–Lelong formula (see C02).

## Source issues

- none

## For the human reviewers

- Not tested: the two sources given for 6.1, Bost–Gillet–Soulé (JAMS 1994) and Philippon (Math. Ann. 1991), could not be read (AMS host unclassified; Springer paywall). Neither wording nor arrangement was compared with them.
- Scope: 5.17a and 6.2 (a1)–(a7), (b) cite no published source and rest on the README's own routes. The family index (lines 9–14) says the family follows a formal proof announced on 20 November 2026.
