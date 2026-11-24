# Review of ArakelovGeometryAndAbelianHeights (pull request #3027 at e7914b5)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 666 changed lines since `aecb53a`. The folder is byte-for-byte the text the previous review accepted, so I re-read every added section (symmetric powers, the Gram and adelic degree formulas, Layers 1A–1B on slopes, Bost's slope inequality and the Harder–Narasimhan filtration, Mumford's good metrics in §§5.1a–5.1d), recomputed its examples, re-read the locators of the seeded sections that fall in the change (§§1.2a, 1.5a, 5.1d) and resolved every new supplier citation at this head. There is no finding. Three small corrections (the description's account of this folder, the `Suggested.lean` docstring, one locator in untouched text) and two format notes remain from the previous review, none blocking. One question is left for the human reviewers: the "Corollary of" convention under which a family roadmap restates sections of this one.

## C01 — The description's account of this folder leaves out Mumford's good metrics (§§5.1a–5.1d) and the suppliers the folder gains

The description says this roadmap receives "slopes of Hermitian vector bundles, heights", and that the new supplier relations are "in the citing roadmap's supplier contracts". A reader does not learn that the folder now also owns Poincaré growth, good forms, good metrics and their Chern forms (§§5.1a–5.1d, about 100 lines, cited by AutomorphicBundles at this head), nor which suppliers it gains. Text that would be right: "ArakelovGeometryAndAbelianHeights gains symmetric powers and the Gram and adelic degree formulas (§§1.2a–1.6a), Layers 1A–1B (heights of linear maps, maximal and minimal slopes, Bost's slope inequality, the Harder–Narasimhan filtration and its base change) and Mumford's good metrics (§§5.1a–5.1d). Its new suppliers are DiophantineApproximationAndTranscendence §§2.5–2.5c, SuccessiveMinima §0.1, ArithmeticGaloisRepresentations §7.7, ComplexComparisonPartII §C5.4, ComplexKahlerGeometry Layer 3 and §§4.1–4.2, and CharacteristicClasses §§4.1–4.2."

## C02 — The `Suggested.lean` docstring accounts for Layers 1–6 only, not for the new Layers 1A–1B or §5.1d

The docstring explains layer by layer why no headline is statable, but never names Bost's slope inequality, the Harder–Narasimhan filtration or Mumford's Theorem 1.4 (§5.1d), so a reader cannot tell whether they were considered for the acceptance test. They are not statable: the pinned Mathlib and Tau Ceti have no hermitian vector bundle over `O_K`, no Arakelov degree, no slope and no form with Poincaré growth (a search of both for such structures finds none). One more bullet would do, for example: "Layers 1A–1B's slope inequality and canonical filtration, and §5.1d's Chern forms of good metrics, need hermitian vector bundles over `O_K` with their degrees and slopes, and currents on complex manifolds, none of which the pins supply."

## C03 — Untouched text: §1.14, line 649, cites Faltings' Lemma 3 on p. 356 for the point height, which Faltings defines on p. 354

The source line of §1.14 reads "§3, Lemma 3 and its proof, p. 356". Faltings defines the height of a point as `(1/[K:ℚ])·Grad(p*O(1))` on p. 354 (Faltings1983 line 255); Lemma 3 on p. 356 (line 323) is the finiteness statement for metrics with logarithmic singularities, which §5.2 already cites. The fix is "§3, p. 354". This is a remark for a separate pull request.

## N01 — §1.5b, line 309, cites Roy–Thunder for the heights `H_Ξ` without a locator

DiophantineApproximationAndTranscendence §§2.5a and 2.5c cite §1, Lemma 3.1 and Propositions 4.1–4.2 of the same paper for the same heights; those locators would do here.

## N02 — Untouched text: §5.3, line 1971, calls the extension `ω_G`, while the same sentence writes the extended Hodge line as `ω̄_G`

The sentence ends "for the extension `ω_G`" after "the Faltings metric on `ω̄_G|_S`". One notation would do.

## Questions for the author

- FaltingsFinitenessAndIsogenyTheoremsPartII declares on this roadmap the gap `gap:hermitian-symmetric-power-slope` (`μ̂_max(SymⁿĒ) ≤ n(μ̂_max(Ē) + 2 log r)`, its line 1149). The new §§1A.3–1A.5 and 1B.5 supply its three other slope gaps, as the new Downstream-consumers paragraph says, but not this one; §1.6a gives only the slope of `Sym^m Ē`, not the bound for its maximal slope. Is HeightsRationalPointsAndObstructions meant to supply it, or this roadmap? The contract sits in a roadmap this pull request does not change, so I cannot tell what is intended.

## Verified sound

Adversarial table: the statements the diff adds or changes, with the values computed on each side.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.2a (ii), (v) monomial norms; multinomial sum (seeded) | `Sym²(ℤ²)`; two trivial lines, `m=2` | squared norms `1, ½, 1`; rescaling `½ log(2!/1!1!) = ½ log 2`, degrees `0, ½ log 2, 0`; `1+2+1 = 2²`; Gaudron p. 84 gives `(i!/ℓ!)^{1/2}` | holds |
| §1.5a Gram, comparison and index formulas (seeded) | `ℤ²`, basis `e₁±e₂`; `ℤ`, `e=½`; `ℤ` vs `½ℤ`, norm `2|·|` | `log 2 − ½ log 4 = 0`; `𝔟=(2)`: `−log 2 + log 2 = 0`; `+log 2 − ½ log 4 = 0`; `e_i ∈ E` forces `𝔟 ⊇ O_K`, index `N(𝔟)^{−1}` | holds |
| §1.5b (ii) `deĝ_n(Ē_V) = −log H_Ξ(V)` | `ℚ(i)`, `V=K(1,1)`; `Ξ_∞=diag(1,e^{−c})` | section `(1,1)`: `−2·log√2 = −log 2`, relative height `2`; `ℚe₂`: `H=e^{−c}`, degree `c` | holds |
| §1.5b (iii) dual-height identity | general `V` | `−log H_{Ξ^{−t}}(V^⊥) = −log H_Ξ(V) + log|det Ξ| = deĝ_n(Ē_V) − deĝ_n(Ē) = deĝ_n((Ē/V)^∨)` | holds |
| §1.6a slopes of `Sym^m`, determinants | `r=m=2`; `diag(a,b)` | `N=3`, slope `log 2/6 = (½ log 2)/3`; `det Sym² = a²·ab·b² = (ab)^{binom(3,2)}`; `binom(m+r−1,r)/N = m/r` | holds |
| §1A.1 heights | `2·id` on `Ō_ℚ`; `(1,1)`; `Ē(c)→F̄(c′)` with §1.1's `e^{−c}‖·‖` | `log 2 − log 2 = 0`; `½ log 2`; operator norm `e^{c−c′}‖φ‖`, height `h+c−c′` | holds |
| §1A.2 (ii) | `diag(1,2)`, `2·id` on `ℤ²` | `0 ≤ 2 log 2`, `‖Λ²φ‖=2<4`; `0 ≤ 0` | holds |
| §1A.3 slopes, (v) rescaling | `ℤ⊕(ℤ,e^{−c}|·|)`; `A₂`; squared norms `×c₀` | `c, 0, c/2`; covolume `√3/2`, slope `½ log(2/√3) = 0.0719`, lines `≤ 0`; norm `×√c₀` is `Ē(−½ log c₀)` | holds |
| §1A.4 duality | dual `ℤ⊕(ℤ,e^{c}|·|)` | `μ̂_max = 0 = −μ̂_min(Ē)`, `μ̂_min = −c = −μ̂_max(Ē)` | holds |
| §1A.5 (a), (b), (d) | projection `x ↦ x₂`, `‖e₁‖=e^{−c}` | `h=0`, `μ̂_min(Ē)=0`: (a) `0 ≤ 0`; (b) would read `c ≤ 0`, false, so injectivity is needed | holds |
| §1A.6 filtered inequality | `ℤ²`, `F¹=ℚe₁`, `Ḡ₀=(ℤ,e^{−a}|·|)` | `h(φ₀)=−a`, `μ̂_max(Ḡ₀)=a`, second term `0+0`; bound `0 = deĝ_n(ℤ²)` | holds |
| §1B.1–1B.3 steps, flag, polygon, (iv) | `ℤ⊕(ℤ,e^{−c}|·|)` | steps `ℚ²`, `ℚe₂`, `0`; slopes `(c,0)`; `∫₀^∞ dim E_{≥t} dt = c`; `Σ(a−μ_j) = ra − deĝ_n ≤ Σ(a−μ_j)⁺` | holds |
| §1B.4 (iv), (v), (vi) | same bundle; `2ℤ² ⊂ ℤ²` | `(E^∨)_{≥θ}`: `E^∨`, `ℚe₁^∨`, `0` equals `(E_{>−θ})^⊥` in all three ranges; `B=0`, `μ̂_min=0`; slopes `−log 2 = 0 − log 4/2` | holds |
| §1B.5 base change | `ℤ²` over `ℚ(i)`, line `(1,i)` | relative height `(1+1)^{2/2}=2`, `deĝ_n = −½ log 2 < 0`: still semistable of slope 0 | holds |
| §5.1a Poincaré area | `{0<|z|<½}` | `4π∫₀^{½} dr/(r log²r) = 4π/log 2` | holds |
| §5.1b–5.1c connection form | `H = −log|z|`; frame `z·e` | `∂ log(−log|z|) = dz/(2z log|z|)`; `∂h(e_i,e_j) = (Hθ)_{ij}`, so `θ = H^{−1}∂H`; `(det H′)^{−1} = 1/(|z|²|log|z||)` violates (i) | holds |
| §5.1d Chern forms (seeded) | proof sketch; Mumford Thm 1.4 | `∂θ = −θ∧θ`, `∂(θ∧θ) = 0`, so `d(θ∧θ) = ∂̄(θ∧θ) = ∂∂̄θ = d(∂̄θ)`; source states goodness and the class in `H^{2k}(X̄,ℂ)`, as the text says | holds |
| Conventions: `μ̂_n` | `(O_K, 2|·|)` over `ℚ(i)` | `deĝ = −2 log 2`, `μ̂_n = −log 2`, the value over `ℚ`; `μ̂ = −2 log 2` is not | holds |
| `Suggested.lean` (unchanged) | elaboration at the pins | 0 declarations; exit 0, no output; no one-tactic probe possible | holds |
| §1.14 locator (C03) | Faltings1983 | point height at line 255 (p. 354); Lemma 3 at line 323 (p. 356) is the log-singular finiteness | locator wrong, untouched |

- Source locators read at their place this round: 23. Gaudron2008: Lemmes 4.4–4.5 (pp. 48–49), formula (22) (p. 47), Lemme 7.3 (p. 83) and the monomial norms (p. 84), §3 symmetric product. Bost2001: (4.1) and §4.1.1 (p. 195), Lemma 4.2 (p. 196), §4.1.2, (4.10), Proposition 4.5 (4.11) (p. 199), Proposition 4.6 (4.14) (p. 200). Bost1996: A.2–A.3 (p. 147), Propositions A.1–A.3 (pp. 148–149), footnote 4 (p. 149). Mumford1977: the definitions and Propositions 1.1–1.3, Theorem 1.4 (pp. 240–243). Faltings1983: pp. 354, 356. The other locators of the added text were read by the previous review at the same text and not re-read.
- Seeded sample: §§1.2a, 1.5a and 5.1d lie in the change and were checked in full. §§1.2, 1.6 and 5.1 are untouched but cited by the new sections; the items cited (§1.2 (i)–(vi), §1.1's `Ē(c)` with norms `e^{−c}‖·‖`) are there as cited. §§1.8, 1.10, 5.0b, 5.2, 5.4, 5.7, 5.8, 6.1 and 6.6 are untouched and unaffected, and were not re-read.
- Library declarations opened at the pins: Tau Ceti `LinearAlgebra/SymmetricPower/Basic.lean` lines 109, 135, 142, 191, 233, 243, 252; `Basis.lean` lines 162, 187, 192; `Algebra/Category/ModuleCat/SymmetricPower/BaseChange.lean` line 44; `NumberTheory/Height/Arakelov/Subspace/Basic.lean` line 292. Mathlib `LinearAlgebra/TensorPower/Symmetric.lean` line 53; `NumberTheory/NumberField/ProductFormula.lean` line 98; `NumberField/InfinitePlace/Basic.lean` line 274.
- Cross-roadmap citations resolved at this head: DiophantineApproximationAndTranscendence §§2.5, 2.5a, 2.5b, 2.5c (lines 1070, 1410, 1428, 1444; submodularity, the bound `c(A)` and the finiteness are stated as cited); SuccessiveMinima §0.1 (`orthonormal_coordinate_hadamard`, its `Suggested.lean` line 187); ArithmeticGaloisRepresentations §7.7; ComplexComparisonPartII §C5.4 (`CurrentCalculus`, locally integrable forms as currents); ComplexKahlerGeometry Layer 3, §§3.5, 4.1–4.2; CharacteristicClasses §§4.1–4.2.
- The roadmap as a record: the six layers of the merge base keep their ids and titles; the 8 deleted lines are each replaced in place by a longer version; the ids 1.2a, 1.5a, 1.5b, 1.6a, 1A, 1B, 5.1a–5.1d are new.
- Automatic checks: every check passed. The dependency check prints `depcheck: 132 roadmaps, 1473 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `lake env lean` on `Suggested.lean`: exit 0, no output.
- Previous review: no finding was open. Its three small corrections, two format notes and its question stand unchanged, since the folder did not change; the description was reworded but still omits what C01 names.
- Ownership against open work: searched every open head and `main` for the Harder–Narasimhan filtration of hermitian bundles, maximal destabilising sub-bundles, the slope inequality and Poincaré growth. BallQuotientsAndComplexHyperbolicLattices §8.3 (`main`) proves a bound of that shape for one Kähler form and defines no predicate; the other hits concern isocrystals, shtukas and vector bundles on curves.

Overlap check: read RiemannHypothesisForDirichletLFunctions/SlopesOfHermitianVectorBundles, ArakelovGeometryAndAbelianHeightsPartII, HeightsRationalPointsAndObstructions and AutomorphicBundles at this head, FaltingsFinitenessAndIsogenyTheoremsPartII and FaltingsFinitenessAndIsogenyTheorems as this head has them, and HeightsRationalPointsAndObstructionsPartII by search for the changed objects. Slopes, the Harder–Narasimhan filtration, Bost's slope inequality and Mumford's good metrics are owned here; HeightsRationalPointsAndObstructions, AutomorphicBundles and FaltingsFinitenessAndIsogenyTheoremsPartII cite these sections; SlopesOfHermitianVectorBundles restates §§1.5a–1.6a and 1A.1–1A.5 under "Corollary of" labels, which is for its own review. Nothing else shared.

Source independence: changed passages only; 8 passages compared with 4 sources (Gaudron2008, Bost2001, Bost1996, Mumford1977), none shared beyond formulas and hypothesis lists. Largest share Gaudron2008, 42 of the 105 named locators of the added text (the previous review's count, same text). Contents of Layers 1A–1B compared with Gaudron2008 §§5–6: independent; the slope inequalities come before the filtration here, the reverse of that source, forced by §1B.2's use of §1A.5 (b), (c).

Research link: Layers 1A–1B are Bost's slope method (Bost 1996; Bost 2001), used in the period and isogeny theorems of Bost and of Gaudron–Rémond (2014) that FaltingsFinitenessAndIsogenyTheoremsPartII consumes; §§5.1a–5.1d are Mumford's good metrics (1977), behind the modular height of Layer 5. Rests on the README's Downstream consumers paragraph and Bost1996 Appendice A.

## Not verifiable

- Roy–Thunder (J. reine angew. Math. 476, De Gruyter, paywalled): cited in §1.5b without a locator (N01); not opened.
- Stuhler (Arch. Math. 1976) and Grayson (Comment. Math. Helv. 1984), Springer, paywalled: cited as the origin of the construction in §§1B.1–1B.2 without a locator; not opened. Bost1996 p. 148 attributes the filtration to both.
- Chen2010, ChenMoriwaki2020 and GaudronRemond2013 locators of the added text: the texts are open, but they were not re-read this round.

## Source issues

- **Misprint** in Bost2001 at the proof of Proposition 4.6, p. 201: the source says inequality (4.6) follows from (4.15)–(4.17); it should be (4.14), the inequality of Proposition 4.6; affects nothing.

## For the human reviewers

- RiemannHypothesisForDirichletLFunctions/SlopesOfHermitianVectorBundles (its lines 73–292 and following) states §§1.5a–1.6a and 1A.1–1A.5 of this roadmap again, labelled "Corollary of: ArakelovGeometryAndAbelianHeights", under the convention the description proposes.
