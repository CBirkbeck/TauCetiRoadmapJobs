# Review of SlopesOfHermitianVectorBundles (pull request #3027 at 7b5fe43)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SlopesOfHermitianVectorBundles/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 412 changed lines since `b8f3652`. I checked the Origin, Method and Corollary labels the change adds to all 45 sections, the narrowed statements of 1.3, 4.3 and 6.2 with their wider forms, the routes of 1.3a, 6.1 and 6.4 that now cite other roadmaps, and every section of another roadmap that the change cites, at this head. The changed statements hold on the instances I computed, the cited sections state what this roadmap says they do, and no layer, section or statement of `main` is lost, so there is no finding. The folder is the same as at the head the previous review read, so its four small corrections stand (a locator "Chen (2010), §9.1" that does not exist, Gaudron–Rémond's Lemme 6.2 called the published form of 4.5 (a), the invariant choice of 6.1 labelled this roadmap's own, and the description's silence on this folder's supplier change); its format note on Massold's title is withdrawn, since the title agrees with the cited version. The human reviewers' decision on sections whose published form now lives in a general roadmap was applied; nothing else is left to them beyond the facts listed at the end.

## C01 — Four Origin labels cite "Chen (2010), §9.1", a division the cited version does not have

A reader who looks for §9.1 finds nothing: the References cite Chen 2010 "in the numbering of its preprint, arXiv:0706.2649v1", and that text has numbered sections only, with no subsections anywhere (Chen2010 lines 274, 626, 894, 1370, 1573, 1913, 2094 are its section headings). Section 9 begins on p. 36; the three slope inequalities are the unnumbered list on p. 37 (Chen2010 lines 2126–2129), followed by Proposition 9.1 (line 2134) and the display that writes the step as the sum of the sub-bundles of minimal slope at least `s` (lines 2143–2149). The labels affected are those of 2.2 (line 364), 2.3 (line 383), 2.4 (line 402) and 3.1 (line 494).

Would you write "Chen (2010), §9, p. 37" in 2.2–2.4 and "Chen (2010), the display after Proposition 9.1, p. 37" in 3.1?

## C02 — 4.5 calls Gaudron–Rémond's Lemme 6.2 "the published form of (a)", but that lemma compares first absolute minima, not maximal slopes

A reader who opens Lemme 6.2 for the maximal-slope inequality (a) will not find it. The lemma states `Λ(E^{⊗ℓ}, ℚ̄) ≤ p(n, ℓ)·Λ(S^ℓ(E), ℚ̄)`, with `p(n, ℓ)` the least common multiple of the multinomial coefficients (Gaudron–Rémond 2013, arXiv:1109.2812v1, p. 11; lines 676–683 of the text I read). What it shares with (a) is the computation in its proof, pp. 11–12, that the symmetrisation map `θ` is an isometry at the archimedean places and has height `p(n, ℓ)` (lines 694–702, 722). The two places are the Origin label of 4.5 (line 781: "(a) is adapted from Gaudron and Rémond (2013), Lemme 6.2") and the end of the paragraph at line 791 ("their Lemme 6.2 is the published form of (a)").

Would you write, at line 791, "their Lemme 6.2 is the analogue of (a) for first absolute minima; the computation `H(θ) = p(r, n)` in its proof, with 2.4 (b), gives (a), since `log p(r, n) ≤ min((r − 1)·ψ(n), log n!)`", and in the label "adapted from the proof of Gaudron and Rémond (2013), Lemme 6.2"?

## C03 — The invariant choice in 6.1 is labelled this roadmap's own, but its home, BanachSpaceTheory B7.HermitianNorms, states it too

The Origin of 6.1 (line 1057) says "The choice invariant under a conjugate-linear involution, by averaging, is this roadmap's own formulation", and the Labels paragraph of Conventions (line 51) repeats it. At this head B7.HermitianNorms (BanachSpaceTheory README, lines 1321–1330) states the bounds `‖x‖_J ≤ ‖x‖ ≤ √n·‖x‖_J` and also `‖τ(x)‖_J = ‖x‖_J` for every conjugate-linear involution `τ` preserving `‖·‖`, deduced from the uniqueness of the least-volume norm. So the whole statement of 6.1 is in its home and only the averaging route is this roadmap's; the contract "From TauCetiRoadmap.BanachSpaceTheory" (line 1475) also omits the invariance it could cite.

Would you write "the averaging route to the invariant choice is this roadmap's own; the invariant choice itself is the last clause of B7.HermitianNorms", and adjust the Labels sentence to match?

## C04 — The description does not say that this roadmap gains HeightsRationalPointsAndObstructions as a supplier

The description never names this roadmap, yet the change gives it a new supplier contract, "From TauCetiRoadmap.HeightsRationalPointsAndObstructions" (line 1440), for §§5.17c.1, 5.17d.1, 5.17f.1 and 5.17f.2; at the merge base no *Needs:* line, Dependencies line or contract of this roadmap cited that roadmap. The change also takes the adelic heights `H_A` from DiophantineApproximationAndTranscendence §§2.5a–2.5c where the base cited AdelicHeightsAndSuccessiveMinima §2.5a. The description states supplier changes of this kind for other roadmaps of the family (SingularHermitianMetricsAndL2Methods "gains HeightsRationalPointsAndObstructions and ArakelovGeometryAndAbelianHeights as suppliers"), so a reader takes its silence here as no change.

A sentence would cover it: "SlopesOfHermitianVectorBundles gains HeightsRationalPointsAndObstructions as a supplier (§§5.17c.1, 5.17d.1, 5.17f.1, 5.17f.2, for 3.5, 4.3, 4.5 and 6.3–6.5), and takes the adelic heights `H_A` from DiophantineApproximationAndTranscendence §§2.5a–2.5c instead of AdelicHeightsAndSuccessiveMinima §2.5a, which remains a supplier for §3.1."

## Previous findings

The previous review (at 3bddf73) had no finding. The folder is byte-identical at this head, so its small corrections are not repaired and are restated above:

- C01 (Chen §9.1) — not repaired: lines 364, 383, 402, 494 unchanged; restated as C01.
- C02 (Lemme 6.2) — not repaired: lines 781, 791 unchanged; restated as C02.
- C03 (invariant choice of 6.1) — not repaired: lines 51, 1057 unchanged; restated as C03.
- C04 (description) — not repaired: the description still does not name this roadmap; restated as C04.
- N01 (Massold's title) — withdrawn: the first page of arXiv:0711.1667v2, the version line 1525 cites, carries the title the README gives, "Diophantine Approximation on varieties II: Explicit estimates for Arithmetic Hilbert Functions".

Of the other roadmaps' files changed since that head, two are suppliers here (AlgebraicModuliForArithmeticGeometry, HermitianFormsAndLattices); neither change touches a section this roadmap cites (§9.10's statement, §§4.0 (f)–(g), 4.0b).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.3 bound with the ideal `I` (sample) | `K = ℚ(i)`, `φ = ·(1+i)^{-1}` on `Ō_K`, `I = (1+i)` | `h_∞ = −½log2`; `log N(I)/2 = ½log2`; bound `0`; `h(φ) = 0` by the product formula; without the ideal term `0 ≤ −½log2` fails | holds, sharp | none |
| 1.3 Origin and home (sample) | Bost2001, Gaudron2008, AGAH §§1A.1, 1A.5 | (4.10) on p. 199; Déf. 6.1 p. 77; Déf. 4.11 pp. 52–53; §1A.1 lists all eleven properties; §1A.5 bound needs `a_𝔭 ≥ 0`, i.e. `I ⊂ O_K` | as stated | none |
| 1.3a = AGAH §1.2a, `m = n` (sample) | `Sym²(ℤ²)`; `r = m = 2` | squared norms `α!/2! = 1, ½, 1` in both; `Σ 2!/α! = 1+2+1 = 4 = 2²`; Gaudron p. 84 has `(i!/ℓ!)^{1/2}` | (i)–(v) agree | none |
| 1.5, 1.6 as corollaries | DAT §§2.5b, 2.5c through `deĝ_n = −log H_A` | `H(V+W)H(V∩W) ≤ H(V)H(W)` ⇒ supermodular; `H ≥ e^{−c·dim}` ⇒ `deĝ_n ≤ c·dim`; `deĝ_n ≥ B` ⇔ `H ≤ e^{−B}` | holds | none |
| 1.7 Origin (sample) | Gaudron Prop. 5.2, GR 2013 §2.7, Bost2001 (4.3), (4.5) | Prop. 5.2 pp. 62–63 (slope of tensor product); §2.7 p. 5 exterior powers; (4.3), (4.5) p. 196 | locators hold | none |
| 2.2 Origin (sample) | Bost2001 (4.2); Gaudron Lemme 5.6, Propriétés 5.7 (2); Chen | (4.2) p. 195; Lemme 5.6 p. 65; 5.7 (2) pp. 65–66; Chen has no §9.1, inequalities on p. 37 | content holds, one locator wrong | C01 |
| 3.1 Origin (sample) | Chen2010 lines 2143–2149 | step `= Σ` of sub-bundles with `μ̂_min ≥ s`, display after Prop. 9.1, p. 37; AGAH §1B.1 states largest maximiser of `g_θ` | content holds, locator wrong | C01 |
| 3.2, 3.5 Origins (sample) | Bost1996, Gaudron2008, GR 2013 | Prop. A.1 p. 148; Prop. A.2 pp. 148–149; Prop. 5.13 p. 70; Lemme 3.2 p. 6 gives `1 ≤ Λe^{μ̂_max}` | holds | none |
| 4.1, 4.2 Origins (sample) | Gaudron2008, BostKunnemann2010 | Thm 5.19 p. 75; Thm 5.20 p. 76; Prop. 3.3.1 (line 1633); (3.37)–(3.38) (lines 1751–1753) | holds | none |
| 4.3 statement (sample; headline (3)) | rank 1; `ℤ⊕(ℤ,e^{−c})`; `ℤ²` | `μ̂ = −logλ = μ̂`; `s_1=1`: `c ≤ c ≤ c`; `s_1=2`: `−0.347 ≤ 0 ≤ 0` | holds | none |
| 4.3 from HRPO §5.17f.1 | `s = 1, 2, 3, 10` | `½(H_s−1)`: `0, .25, .417, .964`; `½log s`: `0, .347, .549, 1.151`; `((s−1)/2)log2`: `0, .347, .693, 3.119` | `½(H_s−1) ≤ ½log s ≤ ((s−1)/2)log 2`, last equal iff `s ≤ 2` | none |
| 4.3 Origin (sample) | GR 2013 lines 73–75, 346–350 | Thm 1.1: `1 ≤ Λe^{μ̂_max} ≤ √n`; Lemme 3.2 proof takes `F` with `μ̂(F) = μ̂_max`, constant `(H_{dim F}−1)/2` | holds | none |
| 4.4 (i) route change | `s = 1, 2, 4`; `ab = 4` | `½log s ≤ ((s−1)/2)log2`: `0≤0`, `.347≤.347`, `.693≤1.040 ≤ 1.040` | holds | none |
| 4.4 added remark | GR 2013 Cor. 1.4 (2), p. 3 | constant `½Σ log dim E_i`; Chen's `Σ log dim E_i` quoted there; per factor `½log r ≤ ½log r + (r(r−1)/2)log 2` | "sharper than (ii)" holds | none |
| 4.5 remarks (sample) | `r = n = 2`; GR 2013 Thm 6.1, Lemme 6.2, introduction | Thm 6.1: `½log 3 + log 2 = 1.242`; (a): `min(log2, log2) = log 2 = log p(2,2)`; intro: `2 log n` for `2n log n`; Lemme 6.2 is about `Λ` | Thm 6.1 reading holds; attribution of Lemme 6.2 wrong | C02 |
| 4.5 cited bounds (sample) | Gaudron Thm 7.1, Bost2001 (4.6), Bost1996 Prop. A.4, HRPO §5.17f.2 | p. 82; p. 196 with `2 rk·log rk`; p. 149 with `C(rg E)`; §5.17f.2 states `0 ≤ … ≤ 2ℓr log r` | holds | none |
| 5.7 special case (sample) | `ϖ = 1/20`, `√e = 1/40`, `η = ¼`; `ϑ = ¼`, `.01`, `0` | `κ = .269, .0128, 0`; `η′ = 1.341, .283, .25`; bound `5ϖ + 2.6√ϑ = 1.55, .51, .25`; `e′ = e/(1−ϑ) ≤ 4e/3` | holds (statement untouched) | none |
| 6.1 via B7.HermitianNorms (sample) | `ℓ^∞` on `ℂ^N`; averaging | `N^{−½}‖x‖_2 ≤ ‖x‖_∞ ≤ ‖x‖_2`; `½(h+h′)`: both bounds survive, `avg(cx) = avg(x)` since `c² = 1`; B7 states the invariance | holds | C03 |
| 6.2 narrowed statement | `ℙ¹`, `O(1)` | `dim H⁰(O(n)) = n+1 ≤ C(n+1)`, `C = 1`; wider form keeps `S_n`, which 6.3 cites | holds | none |
| 6.4 = HRPO §5.17d.1 | hypotheses side by side; `ℙ¹` Check | both: `𝒳` integral, projective, flat, `L` ample; `ε_n ≤ c log(n+2)` ⇒ `e^{−c log(n+2)}‖·‖_sup ≤ ‖·‖_n ≤ ‖·‖_sup`; limit `½log 2` in both | covered | none |
| 6.5 corollary | HRPO §5.17c.1 | density independent of basis, integral `= dim`, `‖s‖_μ ≤ sup‖s‖ ≤ (sup B)^{½}‖s‖_μ`; `ℙ¹`: density `n+1` | holds for manifolds, as the label says | none |
| 6.6 (iii), (iv) status (sample) | equality case; `N = 1, 2` | `P = ⟨x,u⟩^e`: `m_σ = −(e/2)H_{N−1}`, so bound `= 1 = |P(u)|`; `c_N = ½(log N + H_{N−1})`: `0 ≤ .5`, `.847 ≤ 1.193` | holds; FormalProof constant weaker, as said | none |
| 6.7b (sample) | `e_T` closed form, `(D,T) = (1,2),(1,3),(2,3),(2,4)` | sums `2, 5, 3, 10`; closed form `2, 5, 3, 10` | holds (statement untouched) | none |
| Layer 6 Dependencies "Layers 1–3" | *Needs:* lines of 6.1–6.7b | 6.3 needs 2.2, 2.4, 3.5; 6.4 now needs 6.3 and HRPO §5.17d.1 only; no 4.x left in Layer 6 | consistent | none |
| Headline (1) | `ℤ⊕(ℤ,e^{−c})`, `c > 0` | flag `0 ⊊ ℚe₂ ⊊ ℚ²`, slopes `(c, 0)`, polygon through `(1,c),(2,c)` | holds (unchanged) | none |
| Headline (2) | multiplication by 2 on `Ō_ℚ` | `h = log 2 − log 2 = 0`; `0 ≤ 0 + 0` | holds (unchanged) | none |
| Headline (4) | one isometric embedding onto `F` | `e = η = δ = u = 0`, `s = μ̂(F̄)`: `μ̂(F̄) ≥ μ̂(F̄)` | holds (unchanged) | none |

- Source locators checked against the text: 41 (Gaudron2008 16, Gaudron–Rémond 2013 8, Chen2010 7, Bost2001 6, Bost1996 4, BostKunnemann2010 2), with Massold's title page. Page numbers: Gaudron PDF page + 20, Bost 1996 PDF page + 113, Bost 2001 PDF page + 160.
- Library declarations opened at the pins: Tau Ceti `SymmetricPower.toTensorPower` (`TauCeti/LinearAlgebra/SymmetricPower/Basic.lean:191`), `SymmetricPower.toTensorPower_injective` (same file, line 243), `span_invariants_eq_top` (used at `TauCeti/FieldTheory/Galois/SemilinearDescent.lean:115`).
- Cross-roadmap citations resolved at this head: ArakelovGeometryAndAbelianHeights §§1.2a, 1.5a, 1.5b, 1.6a, 1.14, 1A.1–1A.6, 1B.1–1B.5 (headings all present; §§1.2a, 1A.1, 1A.4, 1A.5, 1B.1 read in full); DiophantineApproximationAndTranscendence §§1.3a, 2.5a, 2.5b, 2.5c; HeightsRationalPointsAndObstructions §§5.17c.1, 5.17d.1, 5.17f.1, 5.17f.2; BanachSpaceTheory B7.HermitianNorms; GeometryOfNumbersAndQuadraticArithmetic §§0.3.1, 0.3.2; ArithmeticGaloisRepresentations §7.7 (its paragraph on Galois descent of subspaces). The consumers HeightsForLogSingularMetrics §4.3b (c) and AdelicHeightsAndSuccessiveMinima (line 302) cite the new 4.3 and its wider form correctly.
- Record: the merge base and this head have the same 6 layers and the same 45 numbered sections; the only heading added is the contract for HeightsRationalPointsAndObstructions; 45 Checks blocks before and after. 4.3 and 6.2 keep their former statements as "Wider form" blocks, and 1.3 keeps its property list as the statement of its home. What is deleted is the routes of 1.3a, 6.1 and 6.4, now in their homes.
- Automatic checks: the worker's checks all passed. My rerun passed every check except the count of files outside the folder (below). The dependency check printed `depcheck: 129 roadmaps, 1442 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file declares nothing, so there is no `#check` comparison and no one-tactic probe to make; the change touches its docstring only, which names every headline and what each lacks at the pins.
- Overlap check: read HeightsRationalPointsAndObstructionsPartII, AdelicHeightsAndSuccessiveMinima, ChowFormsAndHeightsOfSubvarieties, HeightsForLogSingularMetrics. Zhang's absolute Siegel lemma is owned by HeightsRationalPointsAndObstructions §5.17f.1 (4.3 here and HeightsForLogSingularMetrics §4.3b are corollaries); the adelic heights `H_A` by DiophantineApproximationAndTranscendence §2.5a; spherical heights of forms by its §1.3a (6.6 here and ChowFormsAndHeightsOfSubvarieties cite it). Nothing else is shared; no open pull request changes this roadmap.
- Source independence: 12 changed passages compared with 6 sources (changed passages only), nothing shared beyond formulas, standard names and statements of a dozen words; largest share of the locators among texts Gaudron2008 (about 37 of 200 source mentions; [FormalProof], a Lean repository, has 65); contents not compared, since the change adds, removes and reorders no layer.
- Research link: Layers 2–4 are the slope method of Bost (1996, 2001), with the absolute Siegel lemma of Zhang (1995) in the form of Gaudron–Rémond (2013); Layer 6 states Chen's (2010) convergence of normalised maximal slopes; Layer 5, 1.2a and 6.7b are inputs of Alpöge's announced formal proof (2026) of GRH for Dirichlet L-functions. Rests on the README's Summary and References and on the texts read.

## Not verifiable

- BostGilletSoule1994, Corollary 1.4.3 and (1.4.10) (6.6 Origin): the cached text is empty (no text was extracted from the PDF).
- Borek2005, Stuhler1976, Grayson1984, Philippon1991, DeBruijnErdos1952, StruppeckVaaler1990: settled as uncertified; cited by locator only.
- Zhang (1995) Theorem 5.2, Bombieri–Vaaler (1983) Theorems 3 and 6, Thiel (2012), David–Philippon (1999), Chen (2009), Bost–Chen (2013), Chen–Moriwaki (2020), Berman–Boucksom–Witt Nyström (2011): not in the cache; I read them only as quoted by the roadmaps that state them or by Gaudron–Rémond 2013.
- The *Method of the formal proof* labels, and the statements said to be those of [FormalProof] (5.7, 6.7b, the constant `log N + ½` of 6.6 (iv)): I did not read the Lean repository; I checked only that each label is consistent with the statement and route beside it.

Automatic checks set aside as false positives: the check that a pull request changes no file outside the roadmap folder under review counted 128 files, all of them in the other roadmap folders this pull request adds or revises or the family's index; each of those has its own review, so nothing here changes a file that is not the pull request's own.

## Source issues

- **Misprint** in Bost2001 at the proof of Proposition 4.6, p. 201: the source says the inequality just proved is (4.6); it should say (4.14), the display of Proposition 4.6, (4.6) being the symmetric-power bound; affects nothing.
- **Misprint** in Chen2010 at the proof of Proposition 9.1, p. 37: the source says, in the proof, that `s` is at most the minimal slope and concludes for the level `s − h(φ)`; it should take `s ≤ μ̂_min − h(φ)` and conclude for the level `s`, as the statement does; affects nothing.

## For the human reviewers

- Decision applied (sections whose published form now lives in a general roadmap): 1.3 takes its property list from ArakelovGeometryAndAbelianHeights §1A.1, and 1.3a, 6.1 and 6.4 take their routes from its §1.2a, BanachSpaceTheory B7.HermitianNorms and HeightsRationalPointsAndObstructions §5.17d.1; each home states them at this head.
- Layer 5, 1.2a (iii) and 6.7b have [FormalProof] as their only source: a public Lean repository with an announcement of 20 November 2026 (README References). The new Method labels describe its proofs, which I did not read.
