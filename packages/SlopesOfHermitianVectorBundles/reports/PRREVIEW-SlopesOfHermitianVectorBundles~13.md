# Review of SlopesOfHermitianVectorBundles (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SlopesOfHermitianVectorBundles/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 412 changed lines since `b8f3652`. I checked the Origin, Method and Corollary labels the change adds to every section, the narrowed statements of 1.3, 4.3 and 6.2 with their wider forms, and the routes of 1.3a, 6.1 and 6.4 that now cite other roadmaps. I also checked the 28 sections of other roadmaps that the change cites, at this head. Every changed statement holds on the instances I computed, every section the change cites states what this roadmap says it does, and no layer, section or statement of `main` is lost, so there is no finding. There are four small corrections (a nonexistent locator "Chen (2010), §9.1" in four labels, a misattribution of Gaudron–Rémond's Lemme 6.2 in 4.5, an invariance clause of 6.1 labelled as this roadmap's own although its home states it, and the description's silence on this folder's supplier change) and one format note, none blocking. The human reviewers' decision on sections whose published form now lives in a general roadmap was applied; nothing else is left to them beyond the facts listed at the end.

## C01 — Four Origin labels cite "Chen (2010), §9.1", a division the cited version does not have

The References cite Chen 2010 "in the numbering of its preprint, arXiv:0706.2649v1". In that version Section 9 has no subsections: it runs from p. 36 to p. 41, with Proposition 9.1 and the unnumbered list of the three slope inequalities on p. 37 (Chen2010 lines 2094–2149). A reader who looks for §9.1 finds nothing. The labels affected are 2.2 (line 364), 2.3 (line 383), 2.4 (line 402) and 3.1 (line 494). Would you write "Chen (2010), §9, p. 37" in 2.2–2.4 and "Chen (2010), the display after Proposition 9.1, p. 37" in 3.1? These are the locators ArakelovGeometryAndAbelianHeights §§1A.5 and 1B.1 use for the same facts.

## C02 — 4.5 calls Gaudron–Rémond's Lemme 6.2 "the published form of (a)", but that lemma is about absolute minima, not maximal slopes

The Origin label of 4.5 (line 781) says (a) is adapted from Gaudron–Rémond 2013, Lemme 6.2, and the paragraph at line 791 ends "their Lemme 6.2 is the published form of (a)". Lemme 6.2 bounds first absolute minima: `Λ(E^{⊗ℓ}, ℚ̄) ≤ p(n, ℓ)·Λ(S^ℓ(E), ℚ̄)`, with `p(n, ℓ)` the least common multiple of the multinomial coefficients (Gaudron–Rémond 2013, arXiv:1109.2812v1, p. 11). What it shares with (a) is the computation in its proof, pp. 11–12, that the symmetrisation map has height `log p(n, ℓ)`. A reader looking there for the maximal-slope inequality (a) will not find it. Would you write instead: "their Lemme 6.2 is the analogue of (a) for first absolute minima; the computation `H(θ) = p(r, n)` in its proof, with 2.4 (b), gives (a) with `log p(r, n) ≤ min((r − 1)·ψ(n), log n!)`". The Origin label could then read "adapted from the proof of Gaudron and Rémond (2013), Lemme 6.2".

## C03 — The invariant choice in 6.1 is labelled as this roadmap's own, but its home, BanachSpaceTheory B7.HermitianNorms, states it too

The Origin of 6.1 (line 1057) says: "The choice invariant under a conjugate-linear involution, by averaging, is this roadmap's own formulation". The Labels paragraph of Conventions repeats this ("6.1 states a published theorem … with the invariant choice this roadmap's own"). At this head, B7.HermitianNorms (BanachSpaceTheory README, line 1321) states the bounds `‖x‖_J ≤ ‖x‖ ≤ √n·‖x‖_J` and also that `‖τ(x)‖_J = ‖x‖_J` for every conjugate-linear involution `τ` preserving `‖·‖`. It deduces this from the uniqueness of the least-volume norm (Chen–Moriwaki, Theorem 1.2.54). So all of 6.1's statement is in its home, and only the averaging route is this roadmap's. Would you write "the averaging route to the invariant choice is this roadmap's own; the invariant choice itself is the last clause of B7.HermitianNorms", and adjust the Labels sentence to match?

## C04 — The description does not say that this roadmap gains HeightsRationalPointsAndObstructions as a supplier

The change adds a contract "From TauCetiRoadmap.HeightsRationalPointsAndObstructions" (line 1440), for §§5.17c.1, 5.17d.1, 5.17f.1 and 5.17f.2. At the merge base this roadmap had no such contract and no *Needs:* line citing that roadmap. It also replaces its AdelicHeightsAndSuccessiveMinima §2.5a contract with DiophantineApproximationAndTranscendence §§1.3a and 2.5a–2.5c. The description lists supplier changes of this kind for GluedTargetAndDivisionInequality, ChowFormsAndHeightsOfSubvarieties, HermitianFormsAndLattices and BaseChangeAndGaloisRepresentationsForUnitaryGroups, but not for this roadmap. A sentence in "For reviewers" would cover it: "SlopesOfHermitianVectorBundles gains HeightsRationalPointsAndObstructions as a supplier (§§5.17c.1, 5.17d.1, 5.17f.1, 5.17f.2, for 3.5, 4.3, 4.5 and 6.3–6.5), and takes the adelic heights `H_A` from DiophantineApproximationAndTranscendence §§2.5a–2.5c instead of AdelicHeightsAndSuccessiveMinima §2.5a, which remains a supplier for §3.1."

## N01 — The title of Massold's preprint in the References (line 1525) drops words

The arXiv title of 0711.1667 is "Diophantine Approximation of non-algebraic points on varieties II: Explicit estimates for arithmetic Hilbert Functions".

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.1 Origin (sample) | Gaudron2008 at each locator | (22) p. 47 adelic rescaling; Lemme 4.5 proof p. 49 presentation; after Prop. 4.23 p. 61 `H = exp(−deg_n)`; Lemme 5.6 proof p. 65 | holds | none |
| 1.2a labels (sample) | statement untouched; Method against (iii) | labels describe the lower bound of (iii), which Downstream says GluedTarget uses | consistent | none |
| 1.3 narrowed statement | `K = ℚ(i)`, `φ = ·(1+i)^{-1}` on `Ō_K`, `I = (1+i)` | `h_∞ = −½log2`, `log N(I)/2 = ½log2`; bound `0`, actual `h(φ) = 0`; without ideal term `−½log2 < 0` false | holds, sharp | none |
| 1.3 rescaling clause | `Ē(c) → F̄(c′)` | operator norm ×`e^{c−c′}` at all `d` embeddings; `h_∞` shifts by `c − c′` | holds | none |
| 1.3a = AGAH §1.2a | `Sym²(ℤ²)`; multinomial sum `r = m = 2` | squared norms `1, ½, 1` both texts; `Σ 2!/α! = 1+2+1 = 4 = 2²` | identical (i)–(v) with `m = n` | none |
| 2.5 special case via AGAH §1A.6 | Check `ℤ²`, `F^1 = ℚe₁` | `h(φ_0) = −a`, `μ̂_max = a`, `h(φ_1)=0`: `0 ≤ 0` both texts; Bost2001 Prop. 4.6 is this preimage form | holds | none |
| 2.6 integer form (sample) | `E = {a≡b mod 2} ⊂ ℤ²`, `g = 2` | `deg_n E = −log2`, `E_1, E_2` each `−log2`; `−log2 ≤ −2log2 + log2` | equality | none |
| 3.1 Origin (sample) | Chen2010 §9 | step as sum of sub-bundles of `μ̂_min ≥ s`: display after Prop. 9.1, p. 37; no §9.1 exists | content holds, locator wrong | C01 |
| 3.2 Origin (sample) | Bost1996, Gaudron2008 | Prop. A.1 p. 148 (filtration, semistable quotients); Prop. 5.13 p. 70 existence and uniqueness | holds | none |
| 3.3 Origin (sample) | Gaudron, Chen–Moriwaki | Lemme 5.10 p. 68–69 `μ_1 = μ_max`; Prop. 4.3.40 `μ̂_r = μ̂_min`; (4.63)–(4.64) integral of ranks | holds | none |
| 4.2 Origin (sample) | Gaudron2008, BK2010 | Thm 5.20 p. 76 generalises Borek; Prop. 3.3.1 first minimum vs `μ̂_max` | holds | none |
| 4.3 statement | rank 1; `ℤ⊕(ℤ,e^{−c})`; `ℤ²`; `A₂` | `μ̂=−log λ=μ̂`; `c ≤ c ≤ c`; `−0.347 ≤ 0 ≤ 0`; `−0.275 ≤ −logλ^abs ≤ 0.0719` with `λ^abs ≤ 1` | holds | none |
| 4.3 constants | `s = 1,2,3,10` | `H_s−1`: `0, .5, .833, 1.929`; `log s`: `0, .693, 1.099, 2.303`; `((s−1)/2)log2`: `0, .347, .693, 3.12` vs `½log s`: `0, .347, .549, 1.15` | `½log s ≤ ((s−1)/2)log2`, equal iff `s ≤ 2` | none |
| 4.3 Origin (sample) | Gaudron–Rémond 2013 | Thm 1.1 `1 ≤ Λe^{μ̂_max} ≤ √n`; Lemme 3.2 proof uses `F` with `μ̂(F) = μ̂_max`, constant `(H_{dim F}−1)/2`; Zhang Thm 5.2 cited p. 6 | holds | none |
| 4.4 route change | `a = b = 2`, `s = 4` | `½log4 = 0.693 ≤ (3/2)log2 = 1.040` | holds | none |
| 4.4 added remark | GR2013 Cor. 1.4 (2), intro | `½Σ log dim E_i`; Chen [Ch] `Σ log dim E_i`; per factor `½log r ≤ ½log r + (r(r−1)/2)log2` | holds | none |
| 4.5 remarks (sample) | `r = n = 2` | GR Thm 6.1: `½log3 + log2 = 1.242 ≤ 2n log r = 2.77`; (a): `min(log2, log2) = log 2 = log p(2,2)`; Lemme 6.2 is about `Λ` | Thm 6.1 reading holds; Lemme 6.2 attribution wrong | C02 |
| 4.5 cited bounds (sample) | Gaudron2008, Bost2001, Bost1996 | Thm 7.1 (2) p. 82 `2ℓn log n`; (4.6) p. 196 `2 rk log rk`; Prop. A.4 p. 149 constant `C(rg E)` | holds | none |
| 5.4, 5.5, 5.7 labels (sample) | FormalProof `TheoremFSharp` | statement only: `e ≤ 1/4`, totally complex `K`, `4u·log(1+H/u) + (η+4√e)H`; matches Layer 5 text | consistent | none |
| 6.1 via B7.HermitianNorms | `ℓ^∞`, `ℓ¹` on `ℂ^N` | `N^{−½}|x|_2 ≤ |x|_∞ ≤ |x|_2`; `|x|_2 ≤ |x|_1 ≤ √N|x|_2`; invariance also in B7 | holds | C03 |
| 6.2 split (sample) | `ℙ¹`, `O(1)` | `dim H⁰(O(n)) = n+1 ≤ C(n+1)` with `C = 1`; wider form keeps `S_n`, used by 6.3 | holds | none |
| 6.4 via HRPO §5.17d.1 (sample) | `ℙ¹` FS `L²` norms | defects `½log(n+1) ≤ ½log(n+2)`; one-sided sup-comparability implies HRPO two-sided; limit `½log2` both texts; Chen Prop. 9.11 p. 41 | holds | none |
| 6.5 corollary (sample) | BBWN §0.3; HRPO §5.17c.1 | distortion `= sup` form `= Σ` over ON basis; mass `N`; `ℙ¹`: density `n+1` | holds | none |
| 6.6 (iv) status | `N = 1, 2` | `c_1 = 0 ≤ 0.5`; `c_2 = ½(log2+1) = 0.847 ≤ log2+½ = 1.193` | FormalProof constant weaker, as said | none |
| Headline (1) | `ℤ⊕(ℤ,e^{−c})` | flag `0 ⊊ ℚe₂ ⊊ ℚ²`, slopes `(c, 0)`, polygon `(0,0),(1,c),(2,c)` | holds (unchanged) | none |
| Headline (2) | multiplication by 2 on `Ō_ℚ` | `h = log2 − log2 = 0`; (a) `0 ≤ 0` | holds (unchanged) | none |
| Headline (3), new clause | as in 4.3 rows | `μ̂_max − ½log s_1 ≤ −log μ^abs_1 ≤ μ̂_max` with values above | holds | none |
| Headline (4) | orthogonal sum of isometric embeddings | `e = η = δ = u = 0`, `s = μ̂(F̄)`: `μ̂(F̄) ≥ μ̂(F̄)` | holds (unchanged) | none |

- Source locators checked against the text: 46 (Gaudron2008 14, Bost1996 7, Bost2001 7, Chen2010 7, Gaudron–Rémond 2013 6, BostKunnemann2010 2, Chen–Moriwaki 3, BBWN 1, counting the 1.3a, 1.7, 2.x and 3.x Origins with the sample). Page numbers: Gaudron PDF page + 20, Bost 1996 PDF page + 113, Chen v1 as printed.
- Library declarations opened at the pins: Tau Ceti `SymmetricPower.toTensorPower` (`TauCeti/LinearAlgebra/SymmetricPower/Basic.lean:191`), `SymmetricPower.toTensorPower_injective` (same file, line 243), `TauCeti.arakelovLogHeight` (`TauCeti/NumberTheory/Height/Arakelov/Basic.lean:127`), `ZLattice.covolume_sq_eq_det_gram` (`TauCeti/Algebra/Module/ZLattice/Covolume.lean:253`), `uniformSphereMeasure` (`TauCeti/Probability/Distributions/Uniform/Sphere/Basic.lean:77`).
- Cross-roadmap citations resolved at this head, 28 in all. ArakelovGeometryAndAbelianHeights: §§1.2a, 1.5a, 1.5b, 1.6a, 1.14, 1A.1–1A.6, 1B.1–1B.5. DiophantineApproximationAndTranscendence: §§1.3a, 2.5a–2.5c. HeightsRationalPointsAndObstructions: §§5.17c.1, 5.17d.1, 5.17f.1, 5.17f.2. Also GeometryOfNumbersAndQuadraticArithmetic §§0.3.1–0.3.2, BanachSpaceTheory B7.HermitianNorms and ArithmeticGaloisRepresentations §7.7 (its paragraph on Galois descent of subspaces). Each states what the citing line says. The citing consumers HeightsForLogSingularMetrics §4.3b (c) and AdelicHeightsAndSuccessiveMinima (line 302) match the new 4.3.
- Record: the merge base has 6 layers and 45 numbered sections, and all keep their ids and subjects at this head. No heading is removed and no statement is lost. 4.3 and 6.2 keep their former statements as "Wider form" blocks; 1.3 keeps its list of properties as the statement of its home. The deleted text is the routes of 1.3a, 6.1 and 6.4, now cited from their homes, and the AdelicHeightsAndSuccessiveMinima §2.5a names.
- Automatic checks: the worker's checks all passed. My rerun of the gate passed every check except 127 changes outside the folder, all in folders the brief names as the pull request's own. The brief's diff command for other changes printed nothing. The dependency check reported 129 roadmaps, 1442 edges and 0 problems (no UPWARD, CYCLE or moved line).
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no warning. The file declares nothing, and the change touches its docstring only, which still lists the headlines and why none is statable at the pins.
- Overlap check: read HeightsRationalPointsAndObstructionsPartII, AdelicHeightsAndSuccessiveMinima, ChowFormsAndHeightsOfSubvarieties, HeightsForLogSingularMetrics. Zhang's absolute Siegel lemma is owned by HeightsRationalPointsAndObstructions §5.17f.1; 4.3 here and HeightsForLogSingularMetrics §4.3b are corollaries of it. The adelic heights `H_A` are owned by DiophantineApproximationAndTranscendence §2.5a, and spherical heights by its §1.3a (6.6 here and ChowFormsAndHeightsOfSubvarieties cite it). Nothing else is shared, and no open pull request also changes this roadmap.
- Source independence: 11 changed passages compared with 8 sources (changed passages only), with nothing shared beyond formulas, standard names and statements of a dozen words. The largest share of source mentions is [FormalProof], 65 of about 200; among texts it is Gaudron2008, with 37. Arrangement was not compared, since no layer was added, removed or reordered.
- Research link: Layers 2–4 are the slope method of Bost (1996, 2001), used for the period theorem of Masser–Wüstholz and by Gaudron–Rémond (2014). Layer 6 includes Chen's (2010) convergence of normalised maximal slopes. Layer 5, 1.2a and 6.7b are inputs of Alpöge's announced formal proof (2026) of GRH for Dirichlet L-functions. This line rests on the README Summary and References and on Bost1996 and Chen2010.

## Not verifiable

- BostGilletSoule1994, Corollary 1.4.3 and (1.4.10): the cached text is empty (no PDF text extractor on the worker). I checked the bound through its quotation in Bost2001, lines 1865–1876.
- Borek2005, Stuhler1976, Grayson1984, Philippon1991, DeBruijnErdos1952, StruppeckVaaler1990: settled as uncertified, so I cited them by locator only.
- Zhang (1995) Thm 5.2 (checked only as quoted in Gaudron–Rémond 2013, arXiv:1109.2812v1, p. 6), Bombieri–Vaaler (1983), Thiel (2012) (title and pages confirmed through Crossref), David–Philippon (1999), Chen (2009), Bost–Chen (2013): not in the cache and not needed for the sample.
- The *Method of the formal proof* labels: I read only the statements `LineOfLargeDegree.Statement` and `TheoremFSharp` in the public repository, not the Lean proofs the labels describe.

Automatic checks set aside as false positives: the check that a pull request changes no file outside the roadmap folder under review, when rerun without the list of folders this pull request adds or revises, counted its 127 files in those other roadmap folders as changes outside this one; those folders belong to this pull request and each has its own review, so nothing here changed a file it does not own.

## Source issues

- **Misprint** in Bost2001 at the proof of Proposition 4.6, p. 201: the source says the inequality just proved is (4.6); it should say (4.14), the inequality of Proposition 4.6 ((4.6) is the symmetric-power bound); affects nothing.

## For the human reviewers

- Decision applied (sections whose published form now lives in a general roadmap): 1.3 takes its property list from ArakelovGeometryAndAbelianHeights §1A.1, and 1.3a, 6.1 and 6.4 take their routes from AGAH §1.2a, BanachSpaceTheory B7.HermitianNorms and HeightsRationalPointsAndObstructions §5.17d.1. Each home states them at this head.
- Layer 5, 1.2a (iii) and 6.7b have [FormalProof] as their only source: a public Lean repository with an announcement of 20 November 2026 (README References). The new labels describe its proofs.
- The pull request's head on GitHub is now 1a8d3f0; this review reads 3bddf73.
