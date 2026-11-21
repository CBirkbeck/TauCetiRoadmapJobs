# Review of SlopesOfHermitianVectorBundles (pull request #2880 at 9bfa4c7)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SlopesOfHermitianVectorBundles/`
**Verdict:** accepted

**Summary.** I found no false statement, no missing hypothesis, no upward or cyclic supply and no copied passage. The sampled locators in Gaudron 2008, Bost 1996, Bost 2001, Chen 2010 and Bost–Künnemann 2010 say what the README says. Every Check and worked example I recomputed holds, including the gluing identity of 1.2a, the frame bounds of Layer 5 and the determinant identities of 6.7 and 6.7b. There are three small corrections and no format notes, none of them blocking: a line of the description about the build, consumer claims about roadmaps that come earlier in the merge order or are on main, and a mislabelled group of columns in the route of 6.7. The human reviewers have to decide on the formal-proof source, which is the only source named for Layer 5 and for 6.7–6.7b.

## C01 — The description's validation sentence reports a `sorry` warning that this head cannot produce

The description says: "the targeted Lake build succeeds with `sorry` as the only warning". `Suggested.lean` declares nothing, so it contains no `sorry`. Elaborating it at this head ends with exit code 0 and no messages. Would "the targeted Lake build succeeds with no warning (the file declares nothing)" do?

## C02 — Three sentences name consumers that come earlier in the supply order and cannot cite this roadmap

A reader would take these sentences as planned dependencies. Each one would be an upward edge.

- In Downstream consumers (line 1044), HeightsRationalPointsAndObstructions §§5.10c and 5.17e–5.17f "can state their slope consequences on this roadmap". That roadmap precedes this one in the merge order, and it heads the merge-order chain of this pull request's description.
- In the same paragraph, the semistability of the theta bundles `π_*ℒ^{⊗n}` has an owner that "consumes 3.4". FaltingsFinitenessAndIsogenyTheoremsPartII requests that semistability from ArakelovGeometryAndAbelianHeights (its gap `cubist-model-symmetric-ample`). That roadmap is on main and cannot cite a roadmap that is not on main.
- In Scope and ownership (line 1052), "Abelian-variety statements (tangent metrics, cubist models and the semistability of theta bundles) belong to the abelian-height roadmaps that consume this one." The cubist models are ArakelovGeometryAndAbelianHeights §5.8 on main. Of the abelian-height roadmaps, only HeightsForLogSingularMetrics consumes this one, for tangent lattices.

The smallest repair is to name the owners without saying that they consume this roadmap. For example: "is ArakelovGeometryAndAbelianHeights §5.8 and the gap FaltingsFinitenessAndIsogenyTheoremsPartII declares on it". The other option is to drop "can state their slope consequences on this roadmap" and "its owner consumes 3.4".

## C03 — Step (4) of the route of 6.7 calls the columns of every level below `T − D` "the level-0 columns"

Step (4) is at line 926. It says that "the level-0 columns contribute `δ·Σ_{a<T−D} (a/D)·binom(a + D − 1, D − 1)`" in each group `s_i`. That sum runs over all levels `a < T − D`. It counts the `N_0` columns `l^α·l_D^{T−a}·m_p`, and it equals `δ·binom(T − 1, D + 1)`. The columns of level `0` in the sense of step (3) have degree `0` in the first `D` groups, so they contribute nothing. Replacing "the level-0 columns" with "the `N_0` columns `l^α·l_D^{T−a}·m_p` of the levels `a < T − D`" would make step (4) agree with step (3).

## Questions for the author

- FaltingsFinitenessAndIsogenyTheoremsPartII declares gaps on ArakelovGeometryAndAbelianHeights: the existence and extension invariance of `μ̂_max`, the morphism slope inequality and the metric-rescaling law. Once ArakelovGeometryAndAbelianHeights takes them up, 2.1, 3.5, 2.4 (a) and the rescaling law of 2.1 here would have a second owner, and that owner would be on main. Which owner is intended: this roadmap, with those gaps pointed elsewhere, or ArakelovGeometryAndAbelianHeights, with these targets then citing it? What stopped me: the gaps are still requests. ArakelovGeometryAndAbelianHeights on main does not state them, so no second owner exists yet.
- Could the file and declaration names of [FormalProof] be given at 1.2a (iii), 5.3–5.7 and 6.7–6.7b? What stopped me: the sources service does not classify the repository's host, so I did not open it. I checked those routes directly.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.2 sub-bundles, Gram and comparison formulas | `ℤ(1,1) ⊂ ℤ²`; basis `e₁ ± e₂`; basis `½` of `ℤ`; `½ℤ` with norm `2|·|` | quotient norm `1/√2`: `−½log2 + ½log2 = 0`; index 1, Gram det 4 → 0; index −1, det ¼ → 0; `+log2 − log2 = 0` | holds | none |
| 1.4 degrees along a map | `2·id`, `diag(1,2)` on `ℤ²` | `h = log2 − log2 = 0`, so `0 ≤ 0`; `h = log2`, so `0 ≤ 2log2` (`‖Λ²φ‖ = 2 < 4`); Gaudron Lemmes 6.2–6.3, pp. 77–78 match | holds | none |
| 1.5 supermodularity | `ℚe₁`, `ℚ(1,1)` in `ℤ²`; orthogonal summands; `V ⊂ W` | `0 + 0 ≥ 0 − ½log2`; equality; equality. Gaudron Prop. 4.23, p. 61: the error term vanishes when Hermitian | holds | none |
| 2.3 image form | `φ = id`; projection `ℤ² → ℤ`; route with `W′ ⊊ W` | `μ̂_min` on both sides; `0 = 0`; 1.4 (ii) applied to `Ē/V′ → F̄_W/W′` | holds | none |
| 3.1 HN steps | `ℤ ⊕ (ℤ, e^{−c}|·|)`; semistable; maximiser `M = 0` | `ℚ²` (θ ≤ 0), `ℚe₂` (0 < θ ≤ c), `0` (θ > c); supermodular argument covers `M = 0` | holds | none |
| 3.4a Galois descent | `ℚ(i)/ℚ`, lines `M(1,i)`, `M(1,1)` | `(1,i) ↦ (1,−i)`: not stable; `(1,1)` descends; Tau Ceti `span_invariants_eq_top` (GaloisDescent/Span.lean:41) exists | holds | none |
| 3.5 base change | `ℤ²` over `ℚ(i)`, line `(1,i)`; ideal `(1+i)` | relative height 2, `deĝ_n = −½log2 < 0`; `−½log2` invariant; Bost 1996 Prop. A.2, pp. 148–149 | holds | none |
| 5.1 counting slopes | `x = (0,2)`, `s = u = 1`, `τ = ½`; `u = 0` | count 1 ≤ 4/3; `u = 0` forces every `x_k = s` | holds | none |
| 5.4 rank at one place | sources `e₁, e₂, −e₁−e₂`, Gram `[[1,−½],[−½,1]]` | `Q = (3/2)·1`, `e = η = δ = 0`; deleting one: codimension `0 ≤ 4/3` | holds | none |
| 5.6 pairwise Gram bounds | coordinate lines of `ℂ²`; `ϖ = ¼`, `η₀ = η₁ = √e₀ = ⅛`; polynomial on `(0, ¼]` | `η = 0` exactly; `η ≈ 1.118 ≤ 1.25`; the identity in `ϖ` holds at 250 sample points | holds | none |
| 6.1 Hermitian approximation | `ℓ^∞`, `ℓ¹` on `ℂ^N`; conjugation average | `N^{−½}|x|₂ ≤ |x|_∞ ≤ |x|₂`; `|x|₂ ≤ |x|₁ ≤ √N|x|₂`, equality at `(1,…,1)` | holds | none |
| 6.3a Fekete with error | `a_n = ⌊n/3⌋`, `a₄ = 0`; `nμ + C log(n+1)`; binary tree of the route | no violation for `n, m < 300`, limit 1/3; splits admissible, node sizes ≤ `2N/2^i` for `m ≤ 8`, `q < 400` | holds | none |
| 6.4 asymptotic maximal slope | `ℙ¹` Fubini–Study; the error function `f` | `½log((n+1)binom(n,⌊n/2⌋))/n → ½log2`; `f` nondecreasing, `O(log k)`; Chen Prop. 9.11, p. 41 | holds | none |
| 6.5 `L²` norms, Bergman density | `ℙ¹` Fubini–Study; Dirac measure | `B_n = n + 1 = r_n`; a section vanishing at the atom has `L²` norm 0 | holds | none |
| 6.7a coordinate bundle | `‖x₂‖ = 2`, `T = 3`; `J̄(t)`; conic, `T = 2, 3` | `−3.060 ≥ −7.352`, opposite sign gives `−0.42` (fails); rescaling change 0; `Δ = ±s_{0,2}f²`, `±s_{0,2}²f⁵` (exact, 4 draws) | holds | none |
| Headline 3.2/3.3 HN filtration, polygon | `(ℤ,e^{−c}|·|)² ⊕ ℤ`; `A₂` | `V₁` of rank 2, slopes `c > 0`; `A₂` both slopes `0.0719`; Gaudron Prop. 5.13, p. 70; Bost 1996 Prop. A.1, p. 148 | holds | none |
| Headline 2.4/2.5 slope inequality | identity `Ō_{ℚ(i)} → (O_K, 2|·|)`; filtered `ℤ²`; projection | `0 ≤ −log2 + log2` (unnormalised `0 ≤ −log2` fails); `0 ≤ 0`; without injectivity `μ̂_max = c > 0` | holds | none |
| Headline 4.2/4.3 minima | `A₂`; `ℤ ⊕ (ℤ,e^{−c}|·|)`; `ℤ²` | `c(ℚ,2) = log(4/π) ≈ 0.2416`; `s₁ = 1` gives equality; `ℤ²` constants `½log2`, `log2` | holds | none |
| Headline 4.4/4.5 tensor, symmetric powers | `Sym²ℤ²`, `Sym³ℤ³`; `ε_K(1)` | `0.347 ≤ 0.693, 1.39, 2.77`; `0.896 ≤ 3.30 ≤ 9.53`; `κ(K,1) = (½log|d_K| − r₂log(π/2))/d ≥ 0` (Minkowski) | holds | none |
| Headline 5.5 nearly tight frame | `F̄ = Ē ⊕ L̄`; `ℤ(1,1,0,0) ⊂ ℤ⁴`; zero map | `η = 1/d`: bound `μ̂(Ē) − H/d`, true `μ̂(Ē) − H/(d+1)`; negative `H` gives a false bound; `2√u(√(u+H)−√u) ≤ H` ⇔ `H² ≥ 0` | holds | none |
| 6.7b identity after (f′) | expansion with `r_T(1−z) = N_0`, `r_T z = ϱ + w` | difference = `N₀D(D+1)(h+c) + c(N₀D(D+1)+wT+ϱD) + ½logβ(wT+ϱD) + w logΛ_D + ϱ logΛ_T` | holds | none |
| 6.7b first Check | `u², uv`, `T = 3` | `Δ = ±s_{0,1}²s_{0,2}²f⁵` (exact, 4 draws); `8.546 ≥ −5.886`; `1.068 ≥ −2.516`; frame floor `−8.659`, `−4.422` | holds | none |
| 6.7 route step (4) | degree count | `Σ_{a<T−D}(a/D)binom(a+D−1,D−1) = binom(T−1,D+1)`; columns of level 0 alone give 0 | label wrong | C03 |
| Downstream consumers, scope | merge order; main | HeightsRationalPointsAndObstructions precedes this roadmap in the merge order; ArakelovGeometryAndAbelianHeights is on main | claims wrong | C02 |
| Description, validation | `lake env lean Suggested.lean` | exit 0, no messages; nothing declared | no warning | C01 |

- Source locators checked against the text: 41 in total. Gaudron2008: 19 (pp. 47–84, among them Prop. 4.23 at Gaudron2008 line 1365, Lemmes 6.2–6.4 at lines 1921–1943, Thm 7.1 at line 2062). Bost2001: 9 (lines 1356–1598). Bost1996: 6 (lines 475–827). Chen2010: 4 (lines 633–2396). BostKunnemann2010: 2 (lines 1633, 1751). GaudronRemond2014: 1 (line 1245). All theorem numbers, pages and hypotheses match.
- Library declarations opened at the pins: 14 in Mathlib, among them `Polynomial.IsPrimitive.dvd_iff_fraction_map_dvd_fraction_map` (RingTheory/Polynomial/GaussLemma.lean:307), `MvPowerSeries.gaussNorm_mul_eq_mul` (RingTheory/MvPowerSeries/GaussNorm.lean:241), `Measure.toSphere_apply_univ` (MeasureTheory/Constructions/HaarToSphere.lean:88) and `IsPrincipalIdealRing.of_finite_primes` (RingTheory/DedekindDomain/PID.lean:167). 18 in Tau Ceti: the symmetric-power API, `SymmetricPower.toTensorPower_injective` (needs `n!` a unit), the Galois-descent lemmas, the subspace heights and the covolume lemmas. Tau Ceti has no Hermitian vector bundle carrier at the pin, which confirms the docstring.
- Cross-roadmap citations resolved: 26. On main: ArakelovGeometryAndAbelianHeights §§1.1–1.6, 1.12–1.13, 5.8; DiophantineApproximationAndTranscendence §§0.2, 1.3, 2.5; SubspaceTheorem §§4.1–4.2; SuccessiveMinima §0.1; GeometryOfNumbersAndQuadraticArithmetic §§0.3, 2.2.4 (`IntegralQuadraticLattice.mem_iff_local`, a proposed name there); BanachSpaceTheory B7; SchemeAndStackFoundations §4.18; JacobianChallenge C.1–C.2. At open heads: AdelicHeightsAndSuccessiveMinima §§2.5a, 3.1; HermitianFormsAndLattices §§4.0 (f)–(g), 4.0b; ChowFormsAndHeightsOfSubvarieties §§6.1–6.2.
- Dependency check: `depcheck: 171 roadmaps, 1991 edges, 0 problem(s)`. Running the gate without the candidate order flags only the placement (not yet in the merge order, as expected) and the three family-index files, which this pull request owns. No file changes outside the folder and the family index.
- Elaboration: `lake env lean` on `Suggested.lean` returns exit 0 with no messages. The file declares nothing, so there was nothing for `#check @name` and no one-tactic probe. Its docstring names all four headlines as not statable, with the carriers each lacks.
- Overlap check: read AdelicHeightsAndSuccessiveMinima, ChowFormsAndHeightsOfSubvarieties, HeightsForLogSingularMetrics, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties and FaltingsFinitenessAndIsogenyTheoremsPartII (open), and ArakelovGeometryAndAbelianHeights, DiophantineApproximationAndTranscendence and HeightsAndUnits (main). Shared: the adelic height `H_A` (owner DiophantineApproximationAndTranscendence §2.5, named in AdelicHeightsAndSuccessiveMinima §2.5a, cited here); the spherical heights of 6.6 and 6.7a (owner here, consumed by ChowFormsAndHeightsOfSubvarieties); `μ̂_max`, the morphism inequality and the rescaling law (owner here; FaltingsFinitenessAndIsogenyTheoremsPartII requests them from ArakelovGeometryAndAbelianHeights as gaps, not stated there at main). HeightsForLogSingularMetrics 4.3b, a sharper absolute Siegel bound, is its own result.
- Source independence: 47 passages compared with 6 sources: the 41 locators plus 6 further passages (Conventions, the route of 2.4 (b), 3.4 (i), 6.3a, 3.2, the route of 2.2). Nothing is shared beyond forced formulas. Largest share: Gaudron2008, 19 of 41 locators. Contents compared with Gaudron2008 (§§4–7 against Layers 1–4): independent. Gaudron's §6 is split between Layers 1 and 2, and its §5 among Layers 2–4. Layers 5 and 6 have no counterpart. Layer 2 comes before Layer 3 because the Needs of 3.1 and 3.4 on 2.1–2.3 force it.
- Research link: Layers 2–4 are the slope theory of Bost (1996, 2001) and Gaudron (2008), used in Bost's proof of the period theorem of Masser–Wüstholz and in Bost's algebraicity criterion for foliations. 6.3–6.4 is Chen's (2010) convergence of normalised maximal slopes. This rests on the README's References and on Bost1996, Bost2001 and Chen2010 as I read them.

## Not verifiable

- [FormalProof] (GitHub repository) and [Announcement] (PDF on alpo.ge): the sources service classifies neither host, and I did not open them. They are the only named source for 1.2a (iii), 5.3–5.7 and 6.7–6.7b. I checked the routes of those targets instead.
- Stuhler1976, Grayson1984, Borek2005, StruppeckVaaler1990, Philippon1991 and DeBruijnErdos1952 are uncertified, settled as paywalled, and cited by name only.
- Bost1996 Prop. 4.3, 4.4, A.1, A.2 and A.4: the formulas are missing from the text layer of the cached scan. Theorem numbers, pages and hypotheses are verified.
- BostGilletSoule1994: the cached text is empty. It is cited only in Downstream consumers and for the normalisation of 6.6.
- Gaudron2008 §7, pp. 84–86: the OCR of the proof's constants is illegible. The statement of Thm 7.1 is verified.

## Source issues

- **Misprint** in Chen2010 at Prop. 9.1, p. 37 (arXiv v1): the proof starts from `s ≤ μ̂_min(F)` and concludes `φ(F_K) ⊂ F^HN_{s−h(φ)}`, while the statement assumes `s ≤ μ̂_min(F) − h(φ)`; it should run with `s + h(φ)` in place of `s`, or conclude `F^HN_s`; affects nothing.

## For the human reviewers

- Licence: [FormalProof] (github.com/leanprover-community/riemann-hypothesis) and [Announcement] (alpo.ge/remark.pdf) are on hosts the sources service does not classify, and I did not open them. They are dated one day before this review (README line 1106).
- Scope: Layers 1–4 and 6.1–6.6 rest on refereed work (Bost1996, Bost2001, Gaudron2008, Chen2010, BostKunnemann2010). Layer 5 and 6.7–6.7b name no source other than that unrefereed formalisation (README lines 1106, 1123).
