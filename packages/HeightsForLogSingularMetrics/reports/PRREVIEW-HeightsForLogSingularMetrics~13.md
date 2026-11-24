# Review of HeightsForLogSingularMetrics (pull request #3027 at 374b9ce)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HeightsForLogSingularMetrics/`
**Verdict:** needs changes

**Summary.** A review of the change against `main`: 90 changed lines since `74a09b7`. I checked the new *Origin*, *Method of the formal proof* and *Corollary of* labels against their sources (Yuan–Zhang, Moriwaki, Zhang, Gaudron–Rémond, Roy–Thunder, Mourougane, Bost, Gaudron) and against the cited supplier sections at this head; they are accurate. The one finding is about ownership, not mathematics: the bound of 4.3b (c) now has two owners, because this pull request moved it into SlopesOfHermitianVectorBundles §4.3 while this roadmap's scope still claims it. There are no small corrections or format notes, and one point about scope is left to the human reviewers.

## R01 (P2) — The bound of 4.3b (c) now has two owners: this roadmap's scope still claims it, and SlopesOfHermitianVectorBundles §4.3 now states it as its own statement.

An implementer, and the progress record, see the same theorem `log λ^abs(Ē) ≤ −μ̂_max(Ē) + ½·log s₁` claimed by two roadmaps of the family. This roadmap's scope also contradicts itself in two consecutive paragraphs.

On `main`, SlopesOfHermitianVectorBundles §4.3 stated only the constant `((s₁ − 1)/2)·log 2` and said explicitly that the single-vector bound was not one of its targets (merge base, its README line 554). 4.3b (c) was proved here by applying (b) to the maximal destabilising sub-bundle. At this head:

- SlopesOfHermitianVectorBundles §4.3 states `μ̂_max(Ē) − ½·log s_1 ≤ −log λ^abs(Ē) ≤ μ̂_max(Ē)` as its statement (its README line 699). Its scope adds that this roadmap's 4.3b (b) and (c) state it "as well" (its line 1424).
- Here, the route of 4.3b (c) is now "By SlopesOfHermitianVectorBundles §4.3" (line 141), and the scope says that section "states the bound of 4.3b (c)" (line 265).
- The paragraph just above (line 263) still lists "the resulting bound for the first absolute minimum (4.3b (b), (c))" among what this roadmap owns.

4.3b (c) stays with its statement, since it is on `main`. Either repair settles it:

- (i) In the sentence of line 263, claim 4.3b (b) only, and say that 4.3b (c) records the bound that SlopesOfHermitianVectorBundles §4.3 (the earlier supplier) states. The route already cites it.
- (ii) Keep the ownership here, as on `main`: restore the merge-base route of (c) (apply (b) to the maximal destabilising sub-bundle), and let SlopesOfHermitianVectorBundles §4.3 again state only its product-bound form. This touches that folder.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| Headline (1), 0.4 (c)(ii)–(iii) at `t = exp(−1/s²)` | maximum over `0 < s < 1` | `8s·log³(1/s)` peaks at `u = log(1/s) = 3`: `216e⁻³ = 10.75 ≤ 10.8`; `4s·log²(1/s)` peaks at `u = 2`: `16e⁻² = 2.165 ≤ 2.2` | holds |
| 0.4 (c)(iii), 14.1 (c), References: formal proof's families "with approximate monotonicity only" | `IsRegFamily`, last clause, formal-proof source | `t ≤ t′ ⇒ φ_t ≤ φ_{t′} + C·ε(t′)` there; 0.4 asks `φ_t ≤ φ_{t′}` | the new wording is accurate |
| 0.4 *Origin*: (a) is Yuan–Zhang Thm 3.6.6 | weight `−Cℓ_s ≤ φ ≤ C`, `g₀ ≥ cλ_s`; `|s|² = e⁻¹⁰⁰` | `ℓ_s = 5.62`, `λ_s = 101`, ratio `0.056 → 0`: o(g₀). A log-pole weight would be O(g₀) only | hypothesis met |
| 4.3a *Corollary of* AGAHPartII §0.3a | `Spec ℤ`, `O(c)` | `vol^ = max(c,0) ≥ c`, strict for `c < 0`; closed-fibre nef implies geometric-fibre nef (§0.3a says so) | consistent |
| 4.3a (d), upper half from §0.3a | `Spec ℤ`, `M̄ = O(c)`, `d = 1`, `deg = 1` | the only point has height `c`; dense `{h ≤ e}` ⇔ `c ≤ e` ⇔ `M̄¹ ≤ e` | holds |
| Headline (2), 4.3b (b) *Corollary of* HRPO §5.17f.1 | `n = 1, 2, 3` | `½(H_n − 1) = 0, 0.25, 0.417` against `½·log n = 0, 0.347, 0.549`; `ℤ²`: `x = (1,0)` gives `0` | holds |
| 4.3b (b): integral generator after an extension | `K = ℚ(√−5)`, `Ē = 𝔭 = (2, 1+√−5)` | `deĝ = log 2 − 2·log 2`, so `−μ̂ = ½·log 2`; `𝔭O_{K(√2)} = (√2)` gives mean `½·log 2` | constant 0, as in the rank-one Check |
| 4.3b (c) and SlopesOfHermitianVectorBundles §4.3 (R01) | `ℤ ⊕ (ℤ, e^{−c})`; `ℤ²` | `s₁ = 1`: `−c ≤ −c`; `s₁ = 2`: `0 ≤ 0.347`; `½·log s` vs `((s−1)/2)·log 2` at `s = 1..4`: equal, equal, `0.549 < 0.693`, `0.693 < 1.040` | true; two owners |
| 4.3b *Method*: `h(ℙ^{n−1}) ≤ (n/2)·log n` | roots-of-unity points, `H_n − 1 ≤ log n` | point height `½·log n`; `n = 2`: exact `½ ≤ log 2 = 0.693` | holds |
| Headline (3), 14.1, *Method* | `sin²∠ = (1 − n₁·n₂)/2`; Legendre step `k = 1` | `n₁ = ±n₂` gives `0`, `1`; `∫ log((1−u)/2)du = −2 = −(2/1)·1`; `κ(3) = ½·23/15 = 23/30` | consistent |
| 14.2 *Method* (d): `det(1 + ZZ*) ≤ (N−q+1)^q` | `q=1,N=2`; `q=2,N=4` with `Z=[[1,1],[1,−1]]` and `[[1,1],[1,1]]` | `2 = 2`; `9 = 9`; `5 ≤ 9` | holds (Hadamard) |
| Headline (4), 16.1 *Origin*: published bounds are linear | Bost Prop 5.3 ii) p. 135; Gaudron Cor 4.5 at `g=1`, `h=100` | `μ̂_max ≤ C₅(g)·max(1, h, log deg)`; `12·100 + 16·log 24 = 1250.8` against `C·log 103 = 4.63C` | the contrast is accurate |
| 16.1 *Method*: `n` "of the order of the square of the height" | `n = 9⌈2+g²+h⁺⌉²` at `g=1`, `h=10` | `9·13² = 1521` against `h² = 100` | same order |
| *Labels*: every section has a formal-proof statement | 0.4, 4.3a, 4.3b, 14.1, 14.2, 16.1 | 6 of 6 (14.2 through (d), 14.1 through (c)) | holds |

- Source locators checked against the text: Yuan–Zhang v9 Thm 3.6.6, p. 97; Zhang 1995 Thm (5.2) p. 208 and Lemma (5.4) p. 209; Moriwaki Cor 6.4; Gaudron–Rémond 2017 §1 and §5.2 (Zhang's `exp((H_n−1)/2)`, Roy–Thunder's product form); Roy–Thunder Thm 2.2 p. 6 and Thm 8.1 p. 21; Mourougane Main theorem p. 2, Thm 4 and §8.2 pp. 20–21; Bost Prop 5.3 p. 135 and §5.3.4 (first jets at the origin); Gaudron 2019 Prop 4.2 p. 444 and Cor 4.5 p. 445 (first jets at a torsion point, p. 443). In all, 9 sources and 14 locators.
- Cross-roadmap citations in the changed text, resolved at this head: ArakelovGeometryAndAbelianHeightsPartII §§0.3, 0.3a, 3.1, 4.2, 4.3; HeightsRationalPointsAndObstructions §5.17f.1 (names `absoluteSiegel_harmonic`, `firstAbsoluteMinimum`, as in its README); SlopesOfHermitianVectorBundles §4.3; DiophantineApproximationAndTranscendence §2.5. All 8 exist and say what is cited. §0.3a and §5.17f.1 are new in this pull request.
- Formal-proof source opened: `IsRegFamily`, `IsRegFamilyC2`, `IsSingWeight` (`ReciprocityTheory/AnalyticForms/LeviForms/IsRegFamilyInhabitStatement.lean`), `LineOfLargeDegree.Statement` (`GroundTheory/HeightsAndTheta/Heights/KernelsLattice.lean`) and `moriwakiBig_outright`.
- Record: no heading, layer id or item of the merge-base README is removed or retitled (4 layers and 6 sections, same ids). `Suggested.lean` is unchanged.
- Automatic checks: the worker's checks all passed. My own gate run flags 118 files outside the folder. Every one belongs to a folder this pull request owns (the 92 directories match the brief's list, plus the family index), so there is no change outside the pull request.
- Dependency check: `depcheck: 132 roadmaps, 1471 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Elaboration: `lake env lean …/Suggested.lean` exits 0 with no messages. The file declares nothing, so there were no signatures to `#check` and nothing to probe for padding. The docstring names all four headlines as not statable, and the change leaves the headlines unchanged.

Overlap check: I read the scopes of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, MultiplierIdealsOfPairsAndPointSeparation, HeightsRationalPointsAndObstructionsPartII (#1821), ChowFormsAndHeightsOfSubvarieties and ProjectiveModelsAndPeriodBoundsOnShimuraVarieties. Objects shared with the changed text and their owners:
- Moriwaki's inequality: ArakelovGeometryAndAbelianHeightsPartII §0.3a (cited).
- Zhang's absolute Siegel lemma: HeightsRationalPointsAndObstructions §5.17f.1 (cited).
- The bound of 4.3b (c): SlopesOfHermitianVectorBundles §4.3 and this roadmap (R01).
- The height of the projective bundle: ChowFormsAndHeightsOfSubvarieties §6.2 (a7) (cited, unchanged).

Ownership against the other open pull requests was checked with the roadmaps tool. Only folders of this pull request state these objects.

Source independence: changed passages only. I compared 11 passages (the six *Origin* labels, the *Method* labels of 4.3b, 14.1, 14.2 and 16.1, and the Yuan–Zhang reference line) with 9 sources; no wording is shared beyond standard names such as "o(g₀)-singularity". The largest share of locators is [FormalProof], about 46 of some 60 source citations. Contents were not compared, because the diff adds, removes or reorders no layer.

Research link: Layers 0 and 4 extend the arithmetic intersection and volume theory of Gillet–Soulé (1990), Zhang (1995), Moriwaki (2009) and Yuan–Zhang (2021) to log-log singular metrics (cf. Burgos Gil–Kramer–Kühn 2007). 16.1 sharpens the linear slope bounds of Bost (1996) and Gaudron (2019). The roadmap serves the formal proof announced by Alpöge (2026). This rests on the README's overview and References and on the sources read.

## Not verifiable

- The *Method of the formal proof* labels of 0.4, 4.3a, 14.1 and 16.1 were checked only for consistency with the routes and with the formal-proof declarations I opened, not step by step through the formal proof.
- Maillot (1995), Tamvakis (1999), Burgos Gil–Kramer–Kühn (2007) and Kühn (2001) were not opened. They are background citations without a locator.

## Source issues

- none

## For the human reviewers

- The decision on general roadmaps was applied. No section leaves this roadmap: 4.3a and 4.3b keep their statements and name ArakelovGeometryAndAbelianHeightsPartII §0.3a and HeightsRationalPointsAndObstructions §5.17f.1, which this pull request adds, and both state the published theorems as cited. The decision on GeneralizedRiemannHypothesisFromWindowBounds does not concern this folder.
- Scope fact: the *Origin* labels of 14.1 and 16.1 say "particular to this proof". The only source for their statements is [FormalProof] and [Announcement] (Alpöge, 2026), which have no refereed publication; the nearest published results are cited (Mourougane 2003; Bost 1996; Gaudron 2019).
