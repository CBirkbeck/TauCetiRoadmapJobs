# Review of HeightsForLogSingularMetrics (pull request #2894 at ab8344f)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HeightsForLogSingularMetrics/`
**Verdict:** accepted

**Summary.** Accepted: no statement, Check or worked example was found false, every published locator that could be read supports the statement it is attached to, and every cross-roadmap citation resolves to a section that says what the README assumes. There are five small corrections (two about the mathematics: the case `g = 0` of 16.1 and an unbounded loss in 0.4 (c); one about provenance; two about the description) and one format note, none blocking. Left for a human: 16.1 (a) and the Layer 0 and Layer 14 theorems have no refereed source, and the formal proof they are measured against, which carries 44 of the 51 locators, could not be read from a legal place, so neither its statements nor its arrangement were compared.

## C01 — 16.1 (a) admits `g = 0`, where the maximal slope is not defined

A reader instantiating 16.1 (a) at the zero abelian variety gets `μ̂_max` of the zero lattice, which the supplier does not define. In 16.1 (a) (line 179), headline (4) of the Summary (line 5) and the fourth bullet of the `Suggested.lean` docstring, `A` is "a principally polarised abelian variety of dimension `g`" with no lower bound on `g`, and (b1) (line 181) quantifies over "every `g ≥ 0`". SlopesOfHermitianVectorBundles §2.1 defines `μ̂_max(Ē)` "for a nonzero `Ē`", and ArakelovGeometryAndAbelianHeights §5.8, from which the route takes all its inputs, assumes `g ≥ 1`.

The smallest change: write "of dimension `g ≥ 1`" in the three places, or say once that `μ̂_max` of the zero bundle is `−∞`, so that the case is vacuous.

## C02 — In 0.4 (c) the integer `m ≥ sup_t ε_i(t)` need not exist

The definition of a regularisation (line 32) asks only that `ε(t) → 0` as `t → 0`; on `(0, t₀)` the loss may be unbounded near `t₀` (for instance a family whose loss is `1/(t₀ − t)` there), and then no integer satisfies "`m` an integer `≥ sup_t ε_i(t)`" (line 42; the same in the route of (b), line 44). Nothing stated becomes false, since every conclusion concerns `t → 0`, but (c) as written has no `Ā`-twist for such a family.

The smallest change: "after shrinking `t₀` so that the losses are bounded" before the choice of `m`, in (c) and in the route of (b).

## C03 — Several targets say neither where they come from nor that they are the roadmap's own

A reader cannot tell which of the targets without a locator are in the literature, which are in the formal proof, and which are new here. The Conventions paragraph (lines 19–22) covers only targets that name [FormalProof], and 14.1 (c) and 16.1 (a) say in words that they are "this roadmap's own form". But 0.4 (a) and (b) (the adelic line bundle and the existence and independence of the limit numbers), 14.1 (a) and (b) (the reflection formula for smooth metrics) and 14.2 (a)–(c) carry no locator and no such sentence; the References entries that name these sections (Gillet–Soulé, Bost–Gillet–Soulé, Yuan–Zhang, Maillot, Tamvakis) give no theorem or page, and two of them are marked "background".

The smallest change: one sentence in Conventions, or at each of these targets, saying either "stated and proved here by the route below; not taken from a source" or giving the locator where a source states it (for instance for the `N = 3` flag numbers of 14.2, if they are in the cited paper on flag varieties).

## C04 — The description's sentence on the family index no longer matches the heads

The description says the family `README.md` "is line for line the one at the heads of the OrbitMeasuresOnAdelicGroups, DiscreteSeriesCoefficientsAndAutomorphicMetrics, SlopesOfHermitianVectorBundles, ChowFormsAndHeightsOfSubvarieties, MultiplierIdealsOfPairsAndPointSeparation, SingularHermitianMetricsAndL2Methods and ProjectiveModelsAndPeriodBoundsOnShimuraVarieties pull requests". At this head the index agrees only with those of MultiplierIdealsOfPairsAndPointSeparation (#2911), ProjectiveModelsAndPeriodBoundsOnShimuraVarieties (#2910) and ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (#2923, which the description lists among those that differ). The other five (#2879, #2880, #2884, #2891, #2909) share an older text that differs from this one in two places of the opening paragraph: the first sentence (this head adds "the generalized Riemann hypothesis (GRH), that is,") and the sentence on the repository of the formal proof (this head adds that it was published without a licence and is mirrored for verification only). The entry for this roadmap is the same in all.

The text that would be right: name the three pull requests whose index is identical, and say that the others differ in the family's opening paragraph or in the entries of other sub-roadmaps.

## C05 — The description does not list HeightsRationalPointsAndObstructions among the suppliers on main

The Dependencies paragraph says "Of the roadmaps on main it consumes ArakelovGeometryAndAbelianHeights, ResolutionOfSingularitiesCharacteristicZero, ComplexComparisonPartII, SchubertGeometry …, AlgebraicModuliForArithmeticGeometry §§1.1, 1.3 … and AbelianSchemesAndArithmeticModuli". HeightsRationalPointsAndObstructions is on main now (§§5.9b, 5.17a, 5.17d, 5.17f are there with the names the README uses) and is the supplier the README cites most. The generated `depends-on` and `merge-order` blocks still list it as an open pull request (#1017).

The text that would be right: add "HeightsRationalPointsAndObstructions §§5.9b, 5.17a, 5.17d, 5.17f" to the list of roadmaps on main; the two generated blocks are refreshed by their tool.

## N01 — References without a locator

The entries for Gillet–Soulé 1990, Bost–Gillet–Soulé 1994, Yuan 2008, Yuan–Zhang, Burgos Gil–Kramer–Kühn 2007, Kühn 2001, Maillot 2000 and Tamvakis 1999 name a layer and no theorem or page. Where an entry is background, saying so (as two already do) is enough; where a target rests on it, a locator at the target would let a reader find it.

## Questions for the author

- 16.1, step (3): the route uses "plain iterates" `D_x^i θ_j(0)` of sections of `ℒ^{⊗n}` and says they are "integral in a rigidified basis". A derivative of a section needs a trivialisation of `ℒ^{⊗n}` along the formal one-parameter subgroup of `x`; which trivialisation is meant, and why is it integral at the places where the Moret–Bailly model has disconnected fibres? ArakelovGeometryAndAbelianHeights §5.8 states the rigidification at the origin only, and the files of the formal proof named for this step could not be read, so this could not be checked.
- 16.1, step (3): the bound "at most `(det Im τ_σ)^{1/4}` times a factor whose logarithm is `O(g⁴)`" for the ratio of the sup norm of `θ` to its `L²`-norm is called "this route's own" and has no supplier; §5.8 bounds sums of theta values at `r`-torsion points (its constant `c(g)`), not the supremum over the torus. Is the supremum bound meant as part of the target 16.1, to be proved from the series in Siegel's fundamental domain? No written account exists to check the exponent `g⁴` against.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 0.4 definition, equivalence with ArakelovGeometryAndAbelianHeights §5.1 | `‖e‖² = e^{−φ}‖e‖₀²`, `−Cℓ_s ≤ φ ≤ C` | `‖e‖^{−1} ≤ e^{C/2}‖e‖₀^{−1}` (exponent 0); `‖e‖ ≤ (e(1+log(1/|s|²)))^{C/2}‖e‖₀`; converse gives `φ ≥ −2n·log(1+…) − C` | equivalent | none |
| 0.4 conventions against suppliers | `‖·‖ = e^{−φ/2}‖·‖₀` in PartII §0.1's `c₁ = (1/πi)∂∂̄log‖s‖` | `(1/πi)∂∂̄(−φ/2) = (i/2π)∂∂̄φ`; `γ = 2πθ` matches SingularHermitianMetrics §7.7 (`h = e^{−φ}h₀`) | consistent | none |
| 0.4 (b) monotonicity (ChowForms §5.1) | `t′ < t`, `f = (φ_t − φ_{t′})/2 ≥ 0` | `J_t − J_{t′} = Σ∫f·(positive measures) ≥ 0`; `ℙ¹_ℤ` example: even `j` gives 0, odd `j` gives `−(4^{−j}/4π)∫i∂f∧∂̄f < 0` | `J_t` monotone, `I_t` not | none |
| 0.4 (b) finiteness route | `ψ_τ = −C·log P_τ`, `u = |s|²` | `i∂∂̄log(u+τ) = (uτ/(u+τ)²)iξ∧ξ̄ − (u/(u+τ))i∂∂̄a`; `g_τ(u=τ) = 1/(4log(1/2τ))`; `ℓ_s/log log(1/|s|²) ≤ 1.87/0.327 = 5.72 ≤ 6` at `|s|² = 1/4` | as stated | none |
| 0.4 (c)(ii), (iii) rates | layer cake with `μ{λ ≥ R} ≤ C·log R/R` | bulk `≤ δ(t)·C(log log)²`, tail `≤ C(log log)²/log`; at `t = e^{−1/s²}`: `8s²log³(1/s) ≤ 8·27e^{−3}·s = 10.75s`; `4s²log²(1/s) ≤ 16e^{−2}·s = 2.17s` | `(log log)³/log`, `(log log)²/log`; `10.8`, `2.2` hold | C02 |
| 0.4 Checks 5, 6 (Poincaré weight) | `φ = −log log(1/|z|²)` | `Δφ = 4/(|z|²log²(1/|z|²))`; mass on `{|z|<s}` `= 4π/log(1/s²)`; `(i/2π)∂∂̄φ`-mass on `{|z|²<ρ}` `= 1/log(1/ρ)`; ratio `πc·log(16/t²)/16`; closeness `≤ C·t/t^{1/2}` | as stated | none |
| 0.4 Check 8 | `u_b = log((|z|²+b²)/(b²(1+|z|²)))` | `u_b ≥ 0 ⇔ b² ≤ 1`; `sup = log(1/b²)`; mass of `(i/2π)∂∂̄log(|z|²+b²)` on `{|z| ≤ b}` `= ½` | as stated | none |
| 0.4 Check 9 (conic) | `xy = p²z²`, chart `z = 1` | `ℤ[y]/(p(y−p))` reduced; `(x−p, y−p)` has two independent images in `𝔪/𝔪²` (dim 3) at `(p,x,y)`, so not principal | as stated | none |
| 4.3a (b) | `Spec ℤ`, `O(c)`; Moriwaki Cor. 6.4 | `vol^ = max(c,0) ≥ c`; equality fails for `c < 0`; source hypothesis "nef on every geometric fibre" = README's nef on closed fibres plus the generic one | supported | none |
| 4.3a (d) | `d = 1`; shift `M̄(−c)` | `M̄(−c)^d = M̄^d − d·c·deg`; lower: nef ⇒ `≥ 0`; upper: positive self-intersection ⇒ small section ⇒ points off its divisor have `h ≥ e″ > e` | both halves follow | none |
| 4.3b (a) | `n = 1, 2, 3`; rescaling by `e^{−c}`; `J̄ = Ē^∨` in ChowForms (a7) | `Σ_{m<n}H_m = nH_n − n` (1; 2.5); `h(ℙ¹) = ½`, `h(ℙ²) = 5/4`; `H_n − 1 ≤ log n`; both sides drop by `n·c·[K:ℚ]`; `deĝ_n(Ē^∨) = −nμ̂` | identity and bound hold | none |
| 4.3b (b), (c) | `n = 1`; `ℤ²`; `s₁ = 1, 2, 3` | contradiction `n·e·[K:ℚ] > Ō(1)^n`; `ℤ²`: bound `½log 2 = 0.347` (`¼` with the value), `x = (1,0)` gives 0; `½log s` vs `((s−1)/2)log 2`: 0/0, 0.347/0.347, 0.549/0.693 | hold | none |
| 14.1 (a) | `ℙ¹_ℤ`; `Z = Spec O_K` rank 2; `Fl₃ → ℙ²` | `4Ô(1)² = 2`; `Ξ̄² = 4(−deĝĒ + [K:ℚ]/2) + 4deĝĒ = 2[K:ℚ]` both ways; `ξ² = c₁² − 4c₂`; `Ξ̂⁴ = (x₀+2x₁)⁴ = 10 − 18 − 8 + 8 = −8 = 4·⅔·(−3)` | agrees with 4.3b and 14.2 | none |
| 14.1 constants | `κ(1..4)`; `∫_{−1}^{1}log((1−u)/2)u^{2k−2}du`, `k = 1, 2`; coefficient identity | `½, ⅔, 23/30, 88/105`; `−2`, `−8/9`; `2·C(D+1,2k)·2κ/(2·C(D,2k−1)) = (D+1)κ/k` | as stated | none |
| 14.1 (b), (c) | telescoping; reference normalisation | `A^{2k}B − B^{2k+1} = Σ_{i<k}(A²−B²)A^{2i}B^{2k−1−2i}`; `∫_{ℙ¹×ℙ¹}c₁(A−B)c₁(B) = 4` | as stated | none |
| 14.2 | `N = 2`; `N = 3` from two fibrations; `λ = (2,1,0)` | `a = x₀²x₁² = −¾` from `5 + 4a = 2`; `c = x₁⁴ = ½` from `c + 3/2 = 2`; `b = −¼` from `c − 4b = 3/2`; `ℓ⁴ = 5a³b − (9/2)a²b² − ab³ + ½b⁴`; `41/2`; symmetrised `= u²(6m² − u²)`; degree `3ab(a−b)` | all values confirmed | none |
| 14.2 (b), (d) | wall identity; `q = 1, N = 2` | `Σ_j(λ_{j−1}−λ_j)(−Σ_{i<j}x_i) − λ_{N−1}p₁ = −Σλ_ix_i`; Hadamard `det(AA^*) ≤ N^q`; bound `log 2` vs `½` | hold | none |
| 16.1 metric | `g = 1`; general `g` in `H`-orthonormal coordinates | `‖∂/∂z‖² = π/Im τ`, `‖dz‖² = Im τ/π = (2π)^{−1}|∫dz∧dz̄|`; `(2π(g−1)!)^{−1}·2(g−1)! = 1/π`; determinant `π^{−g}` both ways | Deligne's normalisation | none |
| 16.1 (a), (b), route | `g = 0`; `g = 1`; product; (b1) from (a); jet count | `μ̂_max(0)` undefined; `−h(X)` bounded above; `max(−h₁, −h₂)`; `(2+g)(2+h) ≥ 2+g+h`; Cauchy at `R² = i/(n‖x‖²)` gives `½log(e·n·N)`, `N = n/3`; `(2+g²+h)² ≥ g⁴+h`; mean log `L²`-norm `= ½h + (g/4)log 2π` from §5.8 with `ρ = 1` | route coherent given its inputs | C01; questions |
| 16.1 against the linear bound | FaltingsFinitenessAndIsogenyTheoremsPartII §2.3 | its second tangent-height input is `h(F) ≥ −c_g·max(1, h_Del, …)`; slopes for `H` exceed those for `π·H` by `½log π` | comparison correct | none |
| `Suggested.lean` docstring | library names at the pins | `IsZLattice` (Mathlib `Algebra/Module/ZLattice/Basic.lean:434`), `ZLattice.covolume` (`…/Covolume.lean:73`), `Submodule.subspaceHeight` (Tau Ceti `NumberTheory/Height/Arakelov/Subspace/Basic.lean:292`), `TauCeti.AlgebraicGeometry.AbelianVariety` (`AlgebraicGeometry/AbelianVariety/Basic.lean:95`) | all exist; none carries an archimedean metric | none |

- Source locators checked against the text: 7 of the 7 published ones. moriwaki-2009 lines 2393–2398, 2413–2418, 2467–2471 (Example 6.1 (2), Theorem 6.2, Corollary 6.4, pp. 40–42); zhang-1995 lines 885–889 (Theorem (5.2), p. 208) and 926–927 (Lemma (5.4), p. 209); roy-thunder-1996 lines 243–245 (Theorem 2.2, p. 6) and 760–762 (Theorem 8.1, p. 21); moret-bailly-1990 line 429 (Théorème 3.3, p. 216); bost-1996 lines 421–423, 445–449 (p. 130).
- Library declarations opened at the pins: 4 (table, last row); Tau Ceti has no Hermitian vector bundle, Arakelov degree or absolute Siegel lemma (its `NumberTheory/SiegelsLemma.lean` is about the exponent of the classical lemma over `ℤ`).
- Cross-roadmap citations resolved: every cited section of 13 roadmaps. On main: ArakelovGeometryAndAbelianHeights §§1.1–1.6, 1.12, 2.7, 2.8, 5.1, 5.8, 6.5; HeightsRationalPointsAndObstructions §§5.9b, 5.17a, 5.17d, 5.17f; ResolutionOfSingularitiesCharacteristicZero §§5.1, 5.5, 6.2; ComplexComparisonPartII C5.4; SchubertGeometry S1.1, S2.1; AlgebraicModuliForArithmeticGeometry §§1.1, 1.3; AbelianSchemesAndArithmeticModuli A5.1–A5.4; DiophantineApproximationAndTranscendence §2.5. At open heads: ArakelovGeometryAndAbelianHeightsPartII §§0.1, 0.3, 1.2, 1.3, 3.1, 3.3, 4.2, 4.3, 4.8; FaltingsFinitenessAndIsogenyTheoremsPartII §2.3; SingularHermitianMetricsAndL2Methods §§5.3, 5.5, 7.7, 7.8; SlopesOfHermitianVectorBundles §§1.3, 2.1, 4.3; ChowFormsAndHeightsOfSubvarieties §§5.1, 6.2; ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.11, 8.15 (a3), 8.15b, 8.15c, 8.16, 8.17.
- Dependency check: `depcheck: 170 roadmaps, 1990 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` exits with no message. The file declares nothing, so there is no signature to compare and no one-tactic probe to run; nothing is padding.
- Headlines: (1) 0.4 (b)–(c); (2) 4.3b (b); (3) 14.1 (a), (c); (4) 16.1 (a). None is statable at the pins without a structure for Hermitian vector bundles with their Arakelov degree or for metrised line bundles on arithmetic varieties; the docstring names each with what it lacks. The case `K = ℚ` of (2) is a special case and is rightly not stated.
- Changes outside the folder: only the three files of the family index, the pull request's own. The worker's automatic checks all passed at this head.
- Duplication: 4.3b (a) is cited from ChowFormsAndHeightsOfSubvarieties §6.2 (a7), not planned again; 4.3b (c) sharpens the constant of SlopesOfHermitianVectorBundles §4.3 and says so; the product form of the Siegel lemma stays with DiophantineApproximationAndTranscendence §2.5.

Overlap check: read ChowFormsAndHeightsOfSubvarieties, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, SingularHermitianMetricsAndL2Methods, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties (by search), ArakelovGeometryAndAbelianHeights, HeightsRationalPointsAndObstructions; the height of the projective space of a Hermitian vector bundle: owner ChowFormsAndHeightsOfSubvarieties §6.2 (a7), cited here; regularisation and mixed measures of log-log weights: owner SingularHermitianMetricsAndL2Methods §§7.7–7.8, cited here; arithmetic intersection numbers on singular models: owner HeightsRationalPointsAndObstructions §5.17a, cited here; nothing owned twice.

Source independence: 9 passages compared with 6 sources (the seven locators above, the parenthesis on nefness in 4.3a (b) beside moriwaki-2009 lines 2395–2398, step (2) of 16.1 beside bost-1996 lines 421–449, the References entry beside Announcement lines 45–53), none shared; largest share [FormalProof], 44 of 51 locators, whose text could not be read; contents compared with the readable sources only (no layer maps onto a run of sections of any of them): independent of those, not tested against [FormalProof].

Research link: Layer 4 extends Moriwaki's generalised Hodge index theorem (2009) and Zhang's theorem of successive minima (1995) to log-log singular metrics; Layer 16 complements Bost's linear slope bound (1996) using Moret-Bailly's key formula (1990); Layers 0, 14, 16 are inputs of Alpöge's formal proof (2026). Rests on the README and the sources read.

## Not verifiable

- [FormalProof]: none of the 38 distinct files named in the README could be read; the sources service finds no legal copy (the repository's raw host is in no licence class). The forms recorded in 0.4 (c), 4.3a (b), (d), 4.3b, 14.1 (c), 14.2 (d) and 16.1 (b), and the References entry, were not compared with it.
- Gillet–Soulé 1990, Bost–Gillet–Soulé 1994, Yuan 2008, Yuan–Zhang, Burgos Gil–Kramer–Kühn 2007, Kühn 2001, Maillot 2000, Tamvakis 1999: cited without locators and not in the sources cache; not read.
- 16.1 (a) with an absolute constant: the route is coherent given its inputs (table), but the two steps in the questions above have no written account to check.
- Ownership against open pull requests was checked by search over the open heads and main, and by reading the six roadmaps of the overlap line.

## Source issues

- none

## For the human reviewers

- Scope: 16.1 (a) is "not attributed to a published source" (README lines 181, 216); 0.4 (b), 14.1 and 14.2 (a)–(c) carry no locator; the Announcement (lines 45–49) says no written account of the proof exists yet.
- Licence: the family index (lines 13–15) reports that the repository of [FormalProof] says the proof was published without a licence and is mirrored for verification only; this README names 38 of its file paths with declaration names.
- Licence: the Announcement is recorded as read from its author's own page (`alpo.ge`); please confirm the host.
- Not tested: [FormalProof] carries 44 of 51 locators and could not be read legally; its wording, its statements and its arrangement (including the origin of the ids 0.4, 4.3a, 4.3b, 14.1, 14.2, 16.1) were not compared.
