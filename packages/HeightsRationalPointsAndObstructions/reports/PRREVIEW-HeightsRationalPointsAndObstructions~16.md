# Review of HeightsRationalPointsAndObstructions (pull request #3027 at e47c8ec)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 256 changed lines since `b8f3652`. The thirteen added sections (5.9b.1–5.9b.2, 5.17a.1, 5.17c.1–5.17c.7, 5.17d.1, 5.17f.1–5.17f.2), the changed scope and supplier-contract sentences and the added references were read in full; every added statement was recomputed on instances, every cited supplier section was opened at this head, and seven of the cited sources were read at their locators. No finding. One small correction (the description's one-phrase summary of this roadmap's additions) and one format note remain, neither blocking; nothing is left for a human to decide.

## C01 — The description summarises this roadmap's additions as "slopes of Hermitian vector bundles, heights", which leaves out the Bergman-kernel sections and the change of metric

The description's list of the largest additions has "ArakelovGeometryAndAbelianHeights and HeightsRationalPointsAndObstructions (slopes of Hermitian vector bundles, heights)". Seven of the thirteen sections this roadmap gains are complex analysis: §§5.17c.1–5.17c.7 (Bergman densities and their asymptotics, the Suita inequality, Demailly's characterisation of big line bundles), and §5.17a.1 is the change of metric in arithmetic intersection numbers. A reader of the description would not look for them here.

Text that would be right: "ArakelovGeometryAndAbelianHeights and HeightsRationalPointsAndObstructions (slopes of Hermitian vector bundles, heights; in the latter also Bergman kernels and their asymptotics and the change of metric in arithmetic intersection numbers)".

## N01 — The code-font names of the added sections are proposed names that `Suggested.lean` does not declare

Examples: `projectiveCycleHeight_eq_chowSphericalHeight` (5.9b.1), `fekete_superadditive_error` (5.17d.1), `symmetricPower_maxSlope_bounds` (5.17f.2). A reader cannot tell a proposal from a declaration; a proposed name would be written in prose, or declared.

## Previous findings

- R01 (of the review before last, kept as D01) — repaired: 5.17c.2, line 2876: "in case (iii) this is the space `H(Ω, φ) = {f ∈ O(Ω) : ∫_Ω |f|²e^(−φ) dλ < ∞}` that ComplexComparisonPartII defines in C7.9 and C7.13, used here as it stands."
- C01 — partly repaired: the description still has "(slopes of Hermitian vector bundles, heights)" for this roadmap (C01 above).
- N01 — not repaired: the proposed names remain in code font without a declaration (N01 above).

The previous review had no blocking finding, and the folder is unchanged since the head it read.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 5.9b.1 `projectiveCycleHeight_eq_chowSphericalHeight` | `[1:1] ∈ ℙ¹_ℚ`; `ℙ¹ ⊂ ℙ¹`; `ℙ² ⊂ ℙ²` | Point: `½log2 = (½log2 − ½) + ½`. `ℙ¹`: `½ = −½ + 1`. `ℙ²`: `5/4 = (−¼ − ¾) + (3/2)(3/2)` | holds |
| 5.9b.1 `chowSphericalIntegral_hyperplaneSection` | `d = 0`, point `[a]`, any `s`; `Y = ℙ¹`, `s = (1,0)`; `s ↦ cs` | Point: `log‖a‖ − ½H_n` both sides. `ℙ¹`: `−½ = −½ + ½ − ½`. Scaling: `deg Y·log|c|` cancels | holds |
| 5.9b.2 `projectiveSpaceHeight_hermitian` | `N = 1`; recursion step `N → N−1` | `N = 1`: `deĝ_n(J̄) + 0`. Step: `−log|u|_σ + ½H_{N−1}` per embedding, and `deĝ(J̄) = deĝ(J̄/u) − Σ_σ log|u|_σ` | holds |
| 5.9b.2 `projectiveSpaceHeight_value` | `N = 1, 2, 3`; closed form | `0`, `½`, `5/4`; `Σ_{m<N} H_m = N·H_N − N`; `½ ≤ log 2 ≈ 0.693`, `5/4 ≤ 1.648` | holds |
| 5.17a.1 `arithmeticIntersection_changeMetric` | `d = 0`; `f = t` constant; `f = −t` on `r` factors (as used in 5.17f.1) | `d = 0`: `deĝ` shifts by `Σ_σ f(σ)`. `f = t`: `[K:ℚ]·t·deg`, the Check of 5.17a. `r` factors: `−r·[K:ℚ]·t` | holds |
| 5.17c.1 density of a measure | `O(n)` on `ℙ¹`; point mass, `dim H⁰ ≥ 2` | `n + 1`, integral `n + 1 = dim`. Point mass: a section vanishing there has norm `0`, hypothesis fails | holds; hypothesis needed |
| 5.17c.2 weighted Bergman space | disc radius `r`; `O(k)` on `ℙ¹`, `k ≥ 0`, `k < 0`; `dV ↦ c·dV` | `1/(πr²)` at centre, decreasing in `r`; `k + 1`; `0`; density divides by `c` | holds |
| 5.17c.3 `suita_inequality` | disc radius `r` at centre | `c = 1/r`, `c² = 1/r² = π·1/(πr²)` | equality, as stated |
| 5.17c.4 `bergmanDensity_localUpperBound` | Fock space on `ℂ`; disc, flat metric; `O(1)` on `ℙ¹`; `λ_j ≤ 0` | `n/π` against `c₁/dλ = 1/π`; `n⁻¹·1/(π(1−|z|²)²) → 0`; `(n+1)/n → 1`; model integral diverges, bound `→ 0` | holds |
| 5.17c.5 `bergmanDensity_leadingOrder` | `O(1)` on `ℙ¹`, `dV = ω_FS`; integrate | `(n+1)/n → 1`; integral gives `dim H⁰/n^d → ∫c₁^d/d!` | holds |
| 5.17c.6 `bergmanDensity_singular_offAnalytic` | `S = ∅`, `dV = ω^d/d!` | `(c₁^d/d!)/(ω^d/d!) = c₁^d/ω^d`, the limit of 5.17c.5 | consistent |
| 5.17c.7 `big_iff_singularMetric` | `O(1)`, `O` on `ℙ¹`; `O(H+E)` on the blow-up of `ℙ²` | `L·E = 0 + (−1) = −1`, not nef; `(H − δE) + (1+δ)E` has current `≥ ω′` | holds |
| 5.17d.1 `maxSlope_firstMinimum` | `ℤ`; `ℤ²`; `O_K`, `K = ℚ(i)` | `0 ≤ 0 ≤ 0`; `−½log2 ≤ 0 ≤ 0`; `−log 2 ≤ −½log2 ≤ −½log2` | holds |
| 5.17d.1 `fekete_superadditive_error` | proof recomputed with `m = (k−1)n + r′`, `r′ ∈ [n, 2n)` | `liminf a_m/m ≥ a_n/n − f(n)/n` for each `n ≥ n_0`, so `liminf ≥ limsup` | holds |
| 5.17d.1 route, product of sections | two factors, `n_i ≥ 0` | `(n_1+n_2+2) ≤ (n_1+2)(n_2+2)`; `Σ_σ ∏ ≤ ∏ Σ_σ`; `f(n)` as displayed, the spare `+½log[K:ℚ]` dropped | holds |
| 5.17d.1 Check on `ℙ¹_ℤ` | monomial norms, `n → ∞` | `k!(n−k)!/(n+1)!`; slope `½log((n+1)·binom(n,k))`; limit `½log 2` | holds |
| 5.17f.1 `absoluteSiegel_harmonic`, `firstAbsoluteMinimum_maxSlope` | rank one; `ℤ²`; `ℤ ⊕ (ℤ, e^(−c)|·|)` | Equalities; `1 ≤ 1 ≤ e^{1/4} ≈ 1.284 ≤ 1.414`; `λ^abs = e^{−c}`, `μ̂_max = c`, `μ̂ = c/2` gives `e^{−c/2} < 1` | holds; `μ̂_max` needed below |
| 5.17f.1 route, height of `ℙ(E_K)` | 5.9b.2 with `J̄ = Ē^∨`, `N = r` | `−r·μ̂ + (r/2)(H_r − 1) = r·(−μ̂ + ½(H_r − 1))`; after the shift, `−r·[K:ℚ]·η < 0` | holds |
| 5.17f.2 `symmetricPower_maxSlope_bounds` | `ℓ = 0`; rank one; `Sym²ℤ²` | `0 ≤ 0 ≤ 0`; equalities; `0 ≤ ½log2 − 0 ≤ 8·log 2` | holds |
| 5.17f.2 `absoluteSiegel_basis` and the collected constant | general `r`; index bookkeeping | `Σe_i ≤ −deĝ_n + (r/2)(H_r − 1)`; codimension `r−j+1`; `½ + ½ + (r−1)/2 + r/2 = r + ½ ≤ 2r` | holds |

- Source locators checked against the text: 14, in seven sources (gaudronremond2013 lines 73–75, 326–327, 346–353; hsiaomarinescu2014 lines 405–413, 2470–2475; chen2010 lines 633–638, 668–675, 2215–2226, 2265–2270, 2332, 2396–2399; berman2004 line 104; bbwn2011 lines 137–150; chambertloirthuillier2009 lines 220–227; gaudron2008 lines 1140, 2062).
- Seeded sample: three of the fifteen targets lie in the change. 5.17f.1: supported (gaudronremond2013 lines 326–353 have both displays and the constant `(H_n − 1)/2`). 5.17c.2: case (ii) supported (hsiaomarinescu2014 lines 2470–2475); Demailly, Kobayashi and Aronszajn not read. 5.9b.1: recomputed on three instances; its sources not read (below). The README flags no locator as unverified.
- Cross-roadmap citations resolved at this head: 43 section citations in six roadmaps (ArakelovGeometryAndAbelianHeights §§1.1–1.6a, 1.12, 1A.1–1A.5, 1B.5; DiophantineApproximationAndTranscendence §§1.3a, 2.5; AlgebraicModuliForArithmeticGeometry §§1.1, 1.5, 1.6; ComplexComparisonPartII C1.4, C1.6, C1.9, C5.4, C5.4a, C5.4b, C5.4f, C5.4g, C7.7, C7.9, C7.13, C7.16–C7.18; ClassicalArithmeticCompletion §6.20; BanachSpaceTheory B7.HermitianNorms). All exist with the content cited; none of the six cites this roadmap.
- Record: no heading, layer, item or Lean declaration of the README at the merge base is removed or retitled; 13 headings are added, each under a new id.
- Dependency check: `depcheck: 132 roadmaps, 1482 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 7 `declaration uses sorry` warnings and no error. The file is unchanged by the pull request, so the signature comparison and the one-tactic probe were not repeated.
- Automatic checks: the worker's run passed every check.
- Pull request text: the one sentence about this roadmap was read against the head (C01).

Overlap check: read HeightsRationalPointsAndObstructionsPartII (open), ArithmeticDynamics, ArithmeticStatisticsPartVI and ArakelovGeometryAndAbelianHeightsPartII (main); nothing shared. For the added sections, searched every roadmap at this head: the space `H(Ω, φ)` and the Ohsawa–Takegoshi theorem are owned by ComplexComparisonPartII (C7.9, C7.7) and cited here; the product of the absolute minima is owned by DiophantineApproximationAndTranscendence §2.5 and cited here; the roadmaps of the RiemannHypothesisForDirichletLFunctions family cite §§5.9b.1–5.17f.2 and state none of them.

Source independence: 9 passages compared with 7 sources, none shared beyond formulas and hypotheses that can be written one way only (changed passages only); largest share of the added locators chen2010, 8 of about 45; contents not compared, since no layer is added, removed or reordered. Not read: bgs1994, philippon1991, Soulé 1991, Bost–Künnemann, Zhang 1995, Demailly's texts.

Research link: §§5.9b.1–5.17f.2 state the slope-method and Bergman-kernel theorems of Zhang 1995, Bost 2001, Gaudron 2008, Chen 2010, Gaudron–Rémond 2013, Berman 2004 and Hsiao–Marinescu 2014, which the README's finiteness route (Zhang's successive minima, Bogomolov, Vojta–Rémond) uses. Rests on the README's sections and the sources read.

## Not verifiable

- bgs1994 (5.9b.1, 5.9b.2, 5.17a.1): the publisher's page is on a host in no licence class; the identities were recomputed instead.
- philippon1991 (5.9b.1): paywalled, recorded as uncertified; the archimedean identity was recomputed for `d = 0` and for `ℙ¹`.
- Soulé 1991, Bost–Künnemann 2010, Zhang 1995, Błocki 2013, Suita 1972, Guan–Zhou 2015, Tian 1990, Zelditch 1998, Catlin 1999, Kobayashi 1959, Aronszajn 1950, Demailly's three texts, Bost 1996 and 2001, Chambert-Loir 2011: not fetched in this review.
- sombra2005 §3 (the bound `(N/2)·log N` of 5.9b.2): the text is an OCR whose formulas are not legible; the bound follows from the stated value and `H_N ≤ 1 + log N`.

## Source issues

- **Misprint** in chen2010 at Proposition 9.6, p. 39 (arXiv:0706.2649v1): the source says the middle term is minus half the logarithm of a supremum, over nonzero sections, of the sum of squared norms; it should be the infimum of that sum (equivalently the supremum of minus half its logarithm); affects nothing.

## For the human reviewers

- none
