# Review of HeightsForLogSingularMetrics (pull request #3027 at e47c8ec)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HeightsForLogSingularMetrics/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 92 changed lines since `b8f3652`. I checked the new *Origin*, *Method of the formal proof* and *Corollary of* labels, the rewritten route of 4.3b (c), the scope and the supplier contracts against the cited supplier sections at this head and against the sources I could read (Yuan–Zhang, Moriwaki, Zhang, Roy–Thunder, Mourougane, Bost, Moret-Bailly). The previous finding, two owners for the bound of 4.3b (c), is repaired, and no finding remains. There is one small correction, to the pull request's description, and no format note; one point about scope is left to the human reviewers.

## C01 — The description says PELModuli, DiamondsAndVStacks and ShimuraVarieties are changed, and this head changes no file in them.

Under "Corrections to `*Needs:*` lines" the description lists corrections to PELModuli M2.5, DiamondsAndVStacks D2.7 and ShimuraVarieties §7.3 and says "PELModuli, DiamondsAndVStacks and ShimuraVarieties are changed in these lines only". At this head the three folders are identical to `main` (the diff of each against `main` is empty; the 126 files the pull request changes lie in other folders), so a reader looks for changes that are not there. Drop the three items and that sentence, or say that `main` already has these corrections.

## Previous findings

- R01 — repaired. The scope now claims "the absolute Siegel lemma with the constant `½·log n`, for an integral vector after a finite extension (4.3b (b))" only (line 263), and says that "SlopesOfHermitianVectorBundles §4.3 states the bound for the first absolute minimum that 4.3b (c) records" (line 265). The route of 4.3b (c) cites that section (line 141), whose statement is `μ̂_max(Ē) − ½·log s_1 ≤ −log λ^abs(Ē) ≤ μ̂_max(Ē)` and whose own *Corollary of* line names HeightsRationalPointsAndObstructions §5.17f.1. The overview (line 9) says Layer 4 "records" the bound. One owner remains: HeightsRationalPointsAndObstructions §5.17f.1, with SlopesOfHermitianVectorBundles §4.3 and 4.3b (c) as its corollaries.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| Headline (1), 0.4 (c)(ii)–(iii), unchanged statement; label and References reworded | `t = exp(−1/s²)` | `(log log 1/t)³/log(1/t) = 8s²·log³(1/s)`; `8s·log³(1/s)` peaks at `216e⁻³ = 10.75 ≤ 10.8`; `4s·log²(1/s)` at `16e⁻² = 2.17 ≤ 2.2` | holds |
| 0.4 *Origin*: (a) applies Yuan–Zhang Theorem 3.6.6 | weight `−Cℓ_s ≤ φ ≤ C`; `log(1/|s|²) = 100`, `10⁴` | `ℓ_s/λ_s = 0.0556`, `0.00102`, tending to `0`: `o(g₀)` as the theorem asks; a log pole would be `O(g₀)` only | hypothesis met |
| 4.3a *Corollary of* ArakelovGeometryAndAbelianHeightsPartII §0.3a, for (b) smooth | `Spec ℤ`, `O(c)` | `vol^ = max(c, 0) ≥ c`, strict for `c < 0`; §0.3a asks geometric fibres and notes closed fibres suffice, as 4.3a (b) assumes | same theorem |
| 4.3a (d), upper half from (b) | `Spec ℤ`, `d = 1`, `deg = 1`, `M̄ = O(c)` | one point, height `c`; dense `{h ≤ e}` iff `c ≤ e`; `M̄¹ = c ≤ 1·e·1` | holds |
| Headline (2), 4.3b (b) *Corollary of* HeightsRationalPointsAndObstructions §5.17f.1 | `n = 1, 2, 3, 5, 10` | `½(H_n − 1) = 0, 0.25, 0.417, 0.642, 0.965` against `½·log n = 0, 0.347, 0.549, 0.805, 1.151` | weaker constant follows |
| 4.3b: slope normalisations of the two roadmaps | `Ē` rescaled by `e^{−c}`, rank `n`, any `K` | here `deĝ/([K:ℚ]n) = c`; there `deĝ_n/r = c` | agree |
| 4.3b (c) against SlopesOfHermitianVectorBundles §4.3 | `ℤ ⊕ (ℤ, e^{−c})`; `ℤ²` | `s₁ = 1`: `−c ≤ −c + 0`; `s₁ = 2`: `0 ≤ 0.347`; left inequality rearranged is (c) | same bound, cited |
| 4.3b (c), scope: `½·log s ≤ ((s−1)/2)·log 2` | `s = 1, 2, 3, 5` | `0 = 0`; `0.347 = 0.347`; `0.549 < 0.693`; `0.805 < 1.386` | holds, equality for `s ≤ 2` |
| 4.3b *Method*: `h(ℙ^{n−1}) ≤ (n/2)·log n` from root-of-unity points | point `(1, ζ, …)`; 4.3a (d) upper with `d = n`, `deg = 1` | point height `½·log n`; bound `n·½·log n`; `n = 2`: exact `½ ≤ 0.693` | holds |
| Headline (3), 14.1 *Origin* and *Method* | `ℙ¹_ℤ`, `k = 1`; the sphere integral | `2κ(1)·deg Ξ = 2·½·2 = 2`; directly `Ξ̄ = Ō(2)`: `4·½ = 2`; `∫_{−1}^{1} log((1−u)/2) du = −2` | consistent |
| 14.2 *Method* (d): `det(1_q + ZZ^*) ≤ (N−q+1)^q` | `q=1, N=3`, `Z = (1, ζ)`; `q=2, N=3`, `Z = (1,1)ᵀ` | `3 = 3`; `3 ≤ 4` (Hadamard: each row of `[1_q, Z]` has squared norm `N−q+1`) | holds |
| Headline (4), 16.1 *Origin*: forms (b1), (b2), (a) | (b1) from (a) | `log(2+g+h) ≤ log(2+g) + log(2+h)`; at `g=1, h=0`: `1.099 ≤ 1.099 + 0.693`; `n = 9⌈2+g²+h⁺⌉² = 81` | label matches 16.1 (b) |
| *Labels* paragraph: every section carries both labels | 0.4, 4.3a, 4.3b, 14.1, 14.2, 16.1 | 6 *Origin*, 6 *Method*, 2 *Corollary of* (4.3a, 4.3b) for 6 sections | holds |

- Source locators checked against the text: Yuan–Zhang v9 Theorem 3.6.6 (printed p. 97); Moriwaki Corollary 6.4 (p. 42), Example 6.1 (p. 40), Corollary 6.3 (p. 41); Zhang Theorem (5.2) p. 208 and Lemma (5.4) p. 209; Roy–Thunder Theorem 2.2 p. 6 and Theorem 8.1 p. 21; Mourougane Main theorem, Theorem 4 and §8.2 (pp. 20–21); Bost Proposition 5.3; Moret-Bailly Théorème 3.3 p. 216. In all, 7 sources and 13 locators.
- Cross-roadmap citations in the changed text, resolved at this head: ArakelovGeometryAndAbelianHeightsPartII §§0.3, 0.3a, 3.1, 4.2, 4.3; HeightsRationalPointsAndObstructions §5.17f.1 (it declares `firstAbsoluteMinimum` and `absoluteSiegel_harmonic` in its README); SlopesOfHermitianVectorBundles §§1.3, 2.1, 4.3; ChowFormsAndHeightsOfSubvarieties §6.2 (a7); DiophantineApproximationAndTranscendence §2.5. All 12 exist and say what is cited.
- Record: no heading, layer id or item of the README at the merge base is removed or retitled (4 layers, 6 sections, same ids); `Suggested.lean` is unchanged.
- Library declarations opened: none needed; `Suggested.lean` declares nothing, so there was no signature to compare and nothing to probe for padding. Its docstring names the four headlines as not statable and says what each lacks.
- Automatic checks: the worker's checks all passed. My own run reports only the pull request's files in its other folders; each of the 126 changed files lies in a folder the pull request owns.
- Dependency check: `depcheck: 129 roadmaps, 1443 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no message.

Overlap check: read ChowFormsAndHeightsOfSubvarieties, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties and HeightsRationalPointsAndObstructionsPartII (open), and the suppliers the change cites. Shared objects and owners: Moriwaki's inequality, ArakelovGeometryAndAbelianHeightsPartII §0.3a (cited); Zhang's absolute Siegel lemma and the comparison of the first absolute minimum with the maximal slope, HeightsRationalPointsAndObstructions §5.17f.1 (cited, here and by SlopesOfHermitianVectorBundles §4.3); the height of the projective bundle, ChowFormsAndHeightsOfSubvarieties §6.2 (a7) (cited, unchanged). A search of the open roadmap pull requests finds the absolute Siegel lemma and log-log singular metrics only in folders of this pull request and on `main`.

Source independence: changed passages only; 8 passages compared with 6 sources (the *Origin* labels of 0.4, 4.3a, 4.3b, 14.1 and 16.1, the *Method* label of 4.3b, and the reference lines of Yuan–Zhang and Mourougane), none shared beyond standard names such as "`o(g₀)`-singularity"; largest share [FormalProof], 24 of about 42 locators in the layers, whose text was not read in this round; contents not compared, the diff adding, removing or reordering no layer.

Research link: Layers 0 and 4 extend the arithmetic intersection and volume theory of Gillet–Soulé (1990), Zhang (1995), Moriwaki (2009) and Yuan–Zhang (2021) to log-log singular metrics; 16.1 sharpens the linear slope bounds of Bost (1996) and Gaudron (2019); the roadmap serves the formal proof announced by Alpöge (2026). Rests on the README's overview and References.

## Not verifiable

- Gaudron and Rémond, *Corps de Siegel* (2017), and Gaudron, *Some explicit computations in Arakelov geometry of abelian varieties* (2019): no legal copy found through the sources service (the publisher's page only), so the attribution of the constant `½(H_n − 1)` to Zhang in the first, and Proposition 4.2 and Corollary 4.5 of the second, were not read in this round.
- Bost, Proposition 5.3: the statement is in the cached text (bost-1996 lines 553–561), but its displayed inequalities are not in the extraction, so the linear dependence on the height was not read off the formula.
- The formal proof's source was not opened in this round: the wording "with approximate monotonicity only" (0.4 (c)(iii), 14.1 (c), References) and the *Method of the formal proof* labels were checked only against the routes and the statements of this README.
- Maillot (1995), Tamvakis (1999), Burgos Gil–Kramer–Kühn (2007), Kühn (2001), Gillet–Soulé (1990) and Bost–Gillet–Soulé (1994) were not opened; they are cited without a locator.

## Source issues

- none

## For the human reviewers

- The decision on general roadmaps was applied: no section leaves this folder; 4.3a and 4.3b keep their statements and name ArakelovGeometryAndAbelianHeightsPartII §0.3a and HeightsRationalPointsAndObstructions §5.17f.1, which state the published theorems. The other decision does not concern this folder.
- Scope fact: the *Origin* labels of 14.1 and 16.1 (README lines 165 and 222) say "particular to this proof"; their only source is [FormalProof] and [Announcement] (Alpöge, 2026), with Mourougane (2003), Bost (1996) and Gaudron (2019) cited as nearest published results.
- Not tested: [FormalProof] has the largest share of the locators and its text was not read in this round; the wording of the changed passages was compared with the published sources only.
