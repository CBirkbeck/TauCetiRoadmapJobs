# Review of SlopesOfHermitianVectorBundles (pull request #2880 at f1cce85)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SlopesOfHermitianVectorBundles/`
**Verdict:** accepted

**Summary.** Accepted: the full pass found no false statement, no missing hypothesis and no unsound dependency. Every Check and worked example that was recomputed agrees with the theorem of its section, the 44 source locators that could be read are right, and every supplier section and library declaration cited exists where it is cited. There is one small correction (a paragraph of 4.3 whose title promises the form of the formal proof and does not give it) and two format notes, none blocking. Two questions are left for the human reviewers: several targets have the unrefereed formal proof as their only source, and that proof's repository carries no licence.

## C01 — The paragraph of 4.3 titled "The form of the formal proof" does not say which form [FormalProof] has, and the constant it displays is not that form

A reader who follows the convention of this README (where a target names [FormalProof], the form that proof establishes is recorded at the target) expects this paragraph, at lines 546–550, to record what the formal proof states. It never names [FormalProof]. The bound it displays, `log λ^abs(Ē) ≤ −μ̂_max(Ē) + ½·(H_{s_1} − 1)`, is the sharpened constant; the formal proof's statement has `½·log` of the rank (in `GroundTheory/HeightsAndTheta/Heights/KernelsLattice.lean`, `LineOfLargeDegree.Statement` reads `F.slope − 1/2·log i − ε ≤ F.lineDegree K' v`), which is what HeightsForLogSingularMetrics §4.3b (b) records. The formal proof does not state the product bound of 4.3 either: that comes from DiophantineApproximationAndTranscendence §2.5.

The mathematics of the paragraph is true (`H_s − 1 ≤ log s`, and the single-vector bound is Zhang's absolute Siegel lemma, owned by HeightsForLogSingularMetrics §4.3b). The smallest change is one sentence: "[FormalProof] has the single-vector bound with the constant `½·log s_1` (HeightsForLogSingularMetrics §4.3b (b)), and not the product bound of this target"; or a title that does not promise the formal proof's form.

## N01 — Five works in the References are cited at no claim with a locator

Stuhler 1976 and Grayson 1984 (3.1, 3.2), Borek 2005 (4.2), de Bruijn–Erdős 1952 (6.3a) and Philippon 1991 (6.6) are named in the References for those sections, but no sentence of the sections gives a theorem or page in them, and 6.3a does not name de Bruijn–Erdős at all although its hypothesis (comparable pairs, a nondecreasing error with `Σ f(k)/k² < ∞`) is theirs rather than Chen's. A theorem number at the claim, or the words "for comparison" in the References, would tell a reader what each is cited for.

## N02 — The remark of 5.6 cites FreeProbability F8, which the supplier contracts and the Dependencies of Layer 5 do not list

The Haar mean `dd′/D` is used there only to interpret the hypothesis, so nothing depends on it; a clause in the remark saying that it is for comparison only, or a line in the contracts, would make the lists complete.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.4 degrees along a map | `diag(1,2)` on `ℤ²`; `id : ℤ → ℤ(c)`; `2·id` | (ii): `0 ≤ 0 + 2·log 2`; (i): `0 = c + (−c)`; `h(2·id) = log 2 − log 2 = 0` | holds | none |
| 1.8 Euclidean lattices | `A₂`; lines `ℚ(1,2)`, `ℚ(2,−1)` in `ℤ²` | covolume `√3/2`, slope `½·log(2/√3) = 0.0719`; both lines `−½·log 5` | holds | none |
| 2.1 maximal and minimal slopes | `ℤ ⊕ ℤ(c)`; `A₂`; rank one | `μ̂_max = c`, `μ̂_min = 0`, `μ̂ = c/2`; `A₂` lines `≤ 0 < 0.0719`; rank one all equal | holds | none |
| 2.3 image form | `id`; projection `ℤ² → ℤ` | both sides `μ̂_min(Ē)`; `h = 0`, image slope `0 = μ̂_min(ℤ²)` | holds | none |
| 2.4 Bost's inequality (headline 2) | `ℚ(i)`: `Ō_K → O_K` with doubled norm; projection with `‖e₁‖ = e^(−c)`; `ℤ(1,1) ⊂ ℤ²` | (a) `0 ≤ −log 2 + log 2`; (b) fails without injectivity: `c > 0`; (e) `−½·log 2 ≤ 0` | holds; injectivity needed | none |
| 2.5 filtered form (headline 2) | `ℤ²`, `V¹ = ℚe₁`, targets `ℤ(a)`, `ℤ` | `1·(a − a) + 1·(0 + 0) = 0 = deĝ_n(ℤ²)` | equality | none |
| 3.1 steps | `ℤ ⊕ ℤ(c)`; semistable bundle | `E_{≥θ} = ℚ²`, `ℚe₂`, `0` on `θ ≤ 0`, `(0, c]`, `> c`; semistable: only `E_K`, `0` | holds | none |
| 3.2, 3.3, 3.5 filtration (headline 1) | `ℤ(c)² ⊕ ℤ`; `A₂`; `2ℤ² ⊂ ℤ²`; `ℤ²` over `ℚ(i)` | `V_1` of rank 2, not `ℚe₁`; reduced basis gives `(0, 0.1438)` ≠ `(0.0719, 0.0719)`; slopes `−log 2`; line `(1,i)`: `−½·log 2 < 0` | holds | none |
| 4.1, 4.2 minima and slopes (headline 3) | `ℤ` with norm `ρ` times the absolute value; `Ō_{ℚ(i)}`; `ℤ²`; `A₂` | both bounds `log ρ`; upper `log(2/√π)`; `log(2/π) ≤ 0 ≤ log(4/π)`; `c(ℚ,2) = 2·log 2 − log π = 0.2416 ≥ 0.0719` | holds | none |
| 4.3 absolute minima (headline 3) | `ℤ²`; `ℤ ⊕ ℤ(c)`; rank one; chain of constants | `s_1 = s_2 = 2`: constants `½·log 2`, `log 2`; `s_1 = 1`: `0`; `s(s−1)/(2(s−i+1)) ≤ n(n−1)/2`; `H_s − 1 ≤ log s` | holds | C01 (wording) |
| 4.4 tensor products (headline 3) | lines; `(ℤ²)^{⊗m}`; `ab − 1` against `a(a−1) + b(b−1)` | `ε_K(1) = 0`; (ii) allows `m·(3/2)·log 2`; difference `½[(a−b)² + (a−1)² + (b−1)²] ≥ 0` | holds | none |
| 4.5 symmetric powers (headline 3) | `Sym²(ℤ²)`; `Sym³(ℤ³)`; `r ≤ 2`; Legendre terms | `0.347 ≤ log 2 ≤ 2·log 2 ≤ 4·log 2`; `0.896 ≤ 3.296 ≤ 9.53`; Legendre terms in `[0, r−1]` | holds | none |
| 5.1, 5.2 counting and layer cake | `x = (0,2)`, `s = u = 1`, `τ = ½`; `w ≡ 0`, `w ≡ 1` | count `1 ≤ 4/3`; `μ̂ ≥ a`, `μ̂ ≥ a − H` | holds | none |
| 5.3, 5.4 frame lemma | coordinate lines; three vectors at `2π/3`; steps (1)–(5) rederived | complement `εD ≤ 2εD`; `Q = (3/2)·1`, bound `4/3`; `x − √(ηx) ≤ c` gives `x ≤ η + 2c` | holds | none |
| 5.5 nearly tight frame (headline 4) | `Ē ⊕ L̄`; rank 1 in `ℤ⁴`; zero map with `Q = 0`; integrals | `η = 1/d`: bound `−H/d`, true `−H/(d+1)`; `η = 3`, `H < 0`: false; `0 ≥ 1` false; `2√u(√(u+H)−√u) ≤ H` | holds; `H ≥ 0` and `tr Q > 0` needed | none |
| 5.6 pairwise Gram bounds | `ϖ = 1/4`, `η₀ = η₁ = √e₀ = 1/8`; coordinate lines of `ℂ²`; one line with `D* = ϖ = M` | `η = 1.118 ≤ 1.25`; `η = 0`; `η = M − 1`; `ϖ(2 − 6.5ϖ + 0.5ϖ² − 0.125ϖ³) > 0` | holds | N02 (citation) |
| 5.7 compression | `ϖ = 1/20`, `ϑ = 1/4`; `ϑ = 0` | `κ = 0.2692`, `η′ = 1.34 ≤ 1.55`; `e′ = e`, `η′ = η` | holds | none |
| 6.1 Hermitian norms | `ℓ^∞`, `ℓ¹` on `ℂ^N`; average of `h`, `h′` | `N^(−1/2)·ℓ² ≤ ℓ^∞ ≤ ℓ²`; `ℓ² ≤ ℓ¹ ≤ √N·ℓ²`; both bounds linear in the form | holds | none |
| 6.3, 6.3a, 6.4 section lattices | `ℙ¹` Fubini–Study; `a_n = ⌊n/3⌋` with `a_4 = 0`; `a_n = nμ + C·log(n+1)`; `−n·log n` | norms² `k!(n−k)!/(n+1)!`, limit `½·log 2`; pair `(1,3)` not comparable, `(2,2)` gives `0 ≥ 0`; `(n+m+1)² ≥ (n+1)(m+1)`; loss `k·log 2` | holds | N01 (locator) |
| 6.5 Bergman densities | `ℙ¹` Fubini–Study; point mass | density `n + 1 = r_n`, defect `½·log r_n`; no norm once `rk ≥ 2` | holds | none |
| 6.6 spherical heights | `s₁ + s₂`; `s₁s₂`; `det(s_0, s_1)`, `N = 2` | `m = ½·log 2 − ½`, equality `√2`; `0 ≥ −1 + log 2`, torus version false; `−½ ≥ −(log 2 + 1)` | holds | none |
| 6.7 determinant identity and slope lines | `ℙ¹`; conic; `ℙ²`, `T = 4`; identity for `e_T` | `e_T = (T−1)(T+2)/2`, `deg g = 0`; `r_T = 2T+3`, `deg g = T−1`; `15`, `e_T = 10`, `deg g = 6` | holds | none |
| 6.7a over a coordinate bundle | `‖x_2‖ = 2`, `T = 3`; three generators of `ℤ²`; conic with Gram `G` | `−3.06 ≥ −7.35`; loss `5/8`, `27/11`; `(G⁻¹)₂₂ = 10/23`, floor `2.86` | holds | none |
| 6.7b flat on a subspace | `u², uv` on `ℙ¹`, `T = 3`; `β = e^(−2A)`; identity (e′) − `r_T`·(f′) | `8.546 ≥ −5.886`, `1.068 ≥ −2.516`; threshold `A > 13.164`, at `A = 20`: `36.796 > 35.087`; five terms rederived | holds; `β ≥ 1` needed | none |
| 1.2, 1.2a Gram formula and gluing | `ℤ²`, basis `e₁ ± e₂`; `e = ½`; `ℚ(i)`, `𝔭 = (2+i)`; (iii) with `D = m = 1` over `ℚ` | `log 2 − ½·log 4 = 0`; `−log 2 + log 2 = 0`; `1 + 0 = −v_𝔭(1/5)`; right side `−½·log(aλ²) = deĝ(R̄)` | holds | none |
| 2.6 orthogonal idempotents | `{a ≡ b mod 2}`; `ℚ(i)`, `mod (1+i)` | `−log 2 = −log 2 + log 2 − log 2`; `−½·log 2 = −½·log 2 + ½·log 2 − ½·log 2` | equality | none |

- Source locators checked against the text: 44, in six sources (Gaudron 2008: 20; Bost 2001: 8; Bost 1996: 6; Chen 2010: 6; Bost–Künnemann 2010: 3; Gaudron–Rémond 2014: 1); all agree in number, page, hypotheses and constants.
- Formal-proof statements opened: four (`Formalism.HN.TheoremFSharp`, `Formalism.FN.MinkowskiIIUpper`, `GlobalTheory.HSShort.SlopeBound` with `cst` and `Hyp`, `LineOfLargeDegree.Statement`); the six cited file paths exist; hypotheses and constants agree with what 5.5, 4.1 and 6.7b (f′) say the proof states.
- Library declarations opened at the pins: 16 of Mathlib and 31 of Tau Ceti, all present (for example `Mathlib/RingTheory/MvPowerSeries/GaussNorm.lean:241`, `TauCeti/LinearAlgebra/SymmetricPower/Basic.lean:191`, `TauCeti/RepresentationTheory/GaloisDescent/Span.lean:41`, `TauCeti/Probability/Distributions/Uniform/Sphere/Basic.lean:77`).
- Cross-roadmap citations resolved: 57 sections or named targets in 24 roadmaps (16 on main, 8 at open heads), all present with the cited subject; the slope of ArakelovGeometryAndAbelianHeights §1.3 is written there as `deĝ/rank`, which the README states and does not use.
- Duplication by object: no roadmap on main or at an open head, and nothing in the pinned libraries, states maximal slopes, the Harder–Narasimhan filtration of a Hermitian bundle, Bost's inequality, Fekete's lemma with an error or the frame lemma.
- Automatic checks: all passed at this head; rerun by hand, the two remaining lines are the three family-index files outside the folder and the default order not yet listing the roadmap, neither a defect.
- Elaboration: `Suggested.lean` elaborates with no message; it declares nothing, so there was no signature to compare and no theorem to probe for padding. No carrier for a Hermitian vector bundle or its degree exists at the pins, so none of the four headlines is statable, as the docstring says.
- The description was read against the head: its suppliers, its statement that the Lean file declares nothing and its validation sentence all hold.

Dependency check: `depcheck: 146 roadmaps, 1833 edges, 0 problem(s)`.

Overlap check: read AdelicHeightsAndSuccessiveMinima, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ChowFormsAndHeightsOfSubvarieties, HeightsForLogSingularMetrics, MultiplierIdealsOfPairsAndPointSeparation (open), ArakelovGeometryAndAbelianHeights, DiophantineApproximationAndTranscendence, HeightsAndUnits (main); the third list is empty. Adelic heights `H_A`: DiophantineApproximationAndTranscendence §2.5, named in AdelicHeightsAndSuccessiveMinima §2.5a. Minkowski's second theorem over `K` for balanced bodies: AdelicHeightsAndSuccessiveMinima §3.1. Spherical heights of multiforms: this roadmap (6.6, 6.7a), cited by ChowFormsAndHeightsOfSubvarieties. The absolute Siegel lemma for one vector: HeightsForLogSingularMetrics §4.3b. Slopes, maximal slopes and the explicit Hilbert–Samuel inequality: this roadmap, cited by the others.

Source independence: 12 passages compared with 6 sources, none shared; largest share Gaudron2008, 18 of 40 locators; contents compared with Gaudron2008 (§4 degree, §5 slopes with filtration and minima, §6 slope inequalities, §7 symmetric powers): independent, since heights of maps and the slope inequality (its §6) stand in Layers 1–2 before the filtration (its §5), and Layers 5–6 have no counterpart.

Research link: Layers 1–4 are the slope theory of Bost (1996, 2001), Gaudron (2008), Chen (2010) and Bost–Künnemann (2010), used by Gaudron–Rémond (2014) for the period theorem; Layers 5–6 supply the slope inequalities of Alpöge's formal proof (2026) of the Riemann hypothesis for Dirichlet L-functions. Rests on the README's References and the six sources read.

## Not verifiable

- Stuhler 1976, Grayson 1984, Borek 2005, Philippon 1991, de Bruijn–Erdős 1952, Struppeck–Vaaler 1990: paywalled and recorded as uncertified; the README gives no locator in them, so nothing was to be checked at a locator (N01).
- Roy–Thunder 1996 and John 1948 are cited through suppliers only; their texts were not opened.
- Of the sampled targets, 1.8, 2.3, 4.3, 5.2, 5.6, 6.1, 6.5 and 6.6 carry no locator into a readable source; they were checked by computation and against their supplier sections.
- In the fifth Check of 6.7a the numerically computed values `ht_J̄(f) ≈ −4.18` and `β ≈ 0.67`, and in the fourth Check of 6.7b the sweeps over integer `A` in `[−20, 100]`, were not recomputed; the explicit determinants (`±s_{0,2}·f²`, `±s_{0,1}²·s_{0,2}²·f⁵`) were not expanded.
- The proof of the remark on fixed divisors in 6.7 was read and its two examples recomputed (`Q_Φ(a) = a` in both); Kodaira's lemma and the polynomiality of Euler characteristics were not checked against a source.

## Source issues

- none

## For the human reviewers

- Scope: targets 1.2a (iii), 5.3–5.7, 6.7b and 6.7a (i)–(iii) name as their only source [FormalProof], a Lean formalization announced on 20 November 2026 (README, References); no refereed text states them, and 6.7 and 6.7a (iv) are the roadmap's own.
- Licence: the public repository of [FormalProof] says it was published without a licence (its README, section License). The roadmap cites its file paths and declaration names and restates statements in its own words; `Suggested.lean` declares nothing.
