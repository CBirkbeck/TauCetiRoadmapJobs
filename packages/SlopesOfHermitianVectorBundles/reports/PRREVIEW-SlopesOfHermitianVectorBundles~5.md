# Review of SlopesOfHermitianVectorBundles (pull request #2880 at bad8bca)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SlopesOfHermitianVectorBundles/`
**Verdict:** accepted

**Summary.** Accepted: I found no false statement, no missing hypothesis, no upward or cyclic supply and no copied passage. The statements, Checks and constants I recomputed hold (Layers 1–5, the degree and slope identities of 6.6–6.7b), and the sampled locators in Gaudron 2008, Bost 2001 and Bost–Künnemann 2010 say what the README says. There are five small corrections and no format notes, none blocking. What the formal proof states, which the README now records at fifteen places, could not be checked against that proof and is left to the human reviewers.

## C01 — The route of 6.1 and the BanachSpaceTheory contract cite a declaration name that only an open revision of that roadmap defines

In the route of 6.1 (line 830) and in the supplier contract "From TauCetiRoadmap.BanachSpaceTheory" (line 1183), John's bound is cited as `banachMazurDist_euclideanSpace_le_sqrt`. BanachSpaceTheory on main states the bound in B7 in words ("Derive `d(E,ℓ²_n) ≤ √n` over `𝕜`") and has no such name; the pinned Tau Ceti has none either. The name occurs only at the head of the open pull request #1854, which revises BanachSpaceTheory. A reader who searches main for it finds nothing, and neither the description nor its merge-order paragraph names that revision.

Either cite B7 as it is on main (the bound `d(E, ℓ²_n) ≤ √n`, without the name), or name #1854 in the description as a pull request that merges first.

## C02 — Three sentences name as consumers roadmaps that come earlier in the supply order

In Downstream consumers (line 1128), HeightsRationalPointsAndObstructions §§5.10c and 5.17e–5.17f "can state their slope consequences on this roadmap"; that roadmap is earlier in the merge order and heads the chain in this pull request's description, so it cannot cite this one. In the same paragraph, the gap addressed to ArakelovGeometryAndAbelianHeights §5.8 "would consume 3.4 (ii)"; that roadmap is on main. In Scope and ownership (line 1136), abelian-variety statements "belong to the abelian-height roadmaps that consume this one"; the cubist models are ArakelovGeometryAndAbelianHeights §5.8 on main. Each sentence reads as a planned upward edge.

Would it do to name the owners without the consumption: drop "can state their slope consequences on this roadmap" and "and would consume 3.4 (ii)", and end the scope sentence at "belong to the abelian-height roadmaps"?

## C03 — Step (4) of the route of 6.7 calls the columns of every level below `T − D` "the level-`0` columns"

At line 993, step (4) says that in each group `s_i` "the level-`0` columns contribute `δ·Σ_{a<T−D} (a/D)·binom(a + D − 1, D − 1)`". The sum runs over all levels `a < T − D` and counts the `N_0` columns `l^α·l_D^{T−a}·m_p`; it equals `δ·binom(T − 1, D + 1)`. The columns of level `0` in the sense of step (3) have degree `0` in the first `D` groups and contribute nothing. Replace "the level-`0` columns" by "the `N_0` columns `l^α·l_D^{T−a}·m_p` of the levels `a < T − D`".

## C04 — 3.4a claims every dimension, and its route now rests on a section that does not say so, while the pinned lemma that does is no longer named

3.4a (line 443) takes `V` "of any dimension". Its route and its Needs line cite only ArithmeticGaloisRepresentations §7.7, whose paragraph on Galois descent of subspaces sits among statements for finite-dimensional representations and does not state the dimension of `V`. The pinned Tau Ceti has `TauCeti.GaloisDescent.span_invariants_eq_top` (`RepresentationTheory/GaloisDescent/Span.lean`, line 41), for a semilinear representation of a finite group with no finiteness hypothesis on the space; with it 3.4a follows in two lines. An implementer reading 3.4a no longer learns that the library has the statement.

Name the Tau Ceti declaration beside §7.7 in the route and the Needs line of 3.4a, or drop "(of any dimension)"; 3.5 uses only the finite-dimensional case.

## C05 — The description's validation sentence does not describe this head

The description says "the targeted Lake build succeeds with `sorry` as the only warning". `Suggested.lean` declares nothing and contains no `sorry`; elaborating it at this head ends with exit code 0 and no message. Would "the targeted Lake build succeeds with no warning (the file declares nothing)" do? The description also lists only AdelicHeightsAndSuccessiveMinima and HermitianFormsAndLattices under "Depends on"; since this head the README also takes Galois descent from ArithmeticGaloisRepresentations §7.7, the Gamma–Beta laws from StandardDistributions §§4.1, 4.3 and Kawamata–Viehweg vanishing from AlgebraicModuliForArithmeticGeometry §9.10 (all on main), which a sentence under Dependencies could say.

## Questions for the author

- Could each sentence "[FormalProof] states …" (1.2a (iii), 5.3, 5.4, 5.5, 5.7, 6.6 (v), 6.7a (ii)–(iii), 6.7b (f′), and the paragraph opening Layer 5) carry the file and declaration name in that repository? They give hypotheses, ranges and constants (`e ≤ 1/4`, `ϑ ≤ 1/2`, `ϖ ≤ 1/20`, `η′ = 5ϖ + 3·√ϑ`, the floor `cst`) with no locator. What stopped me: the repository's host is in no licence class of the sources service, so I did not open it; I checked only that each recorded form follows from the form stated beside it.
- FaltingsFinitenessAndIsogenyTheoremsPartII requests `μ̂_max` with its invariance, the morphism inequality and the rescaling law from ArakelovGeometryAndAbelianHeights. If that roadmap takes them up, 2.1, 3.5, 2.4 (a) and the rescaling law here have a second owner on main. Which owner is intended? What stopped me: the gaps are requests; ArakelovGeometryAndAbelianHeights on main does not state them.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.3 heights of vectors and maps | `2·id` on `Ō_ℚ`; `x ∈ Ō_K^n`; identity `Ō_ℚ → Ō_ℚ(t)` | `log 2 − log 2 = 0`; `TauCeti.arakelovLogHeight = log(height2^[K:ℚ]) = [K:ℚ]·h`; `h = h_∞ = −t`, `2h_∞ = −2t < h` | holds | none |
| 1.3a symmetric powers | `Sym²ℤ²`; (v) two trivial lines | norms² `1, ½, 1`; slopes `0, ½log2, 0`; `Σ n!/α! = 4 = r^n`; Gaudron2008 line 2112 ff. (p. 83–84) | holds | none |
| 1.4 degrees along a map | `2·id`, `diag(1,2)` on `ℤ²` | `0 ≤ 0`; `0 ≤ 2log2`; Gaudron2008 lines 1921, 1931 (Lemmes 6.2, 6.3, pp. 77–78); Bost2001 line 1524 (p. 199) | holds | none |
| 1.7 slopes of constructions | `Sym²ℤ²`; `det Sym²diag(a,b)`; `ℚ(i)` | `(1/6)·log2`; `(ab)³`, exponent `binom(3,2)`; `0 ≤ −log2 + log2`, unnormalised `0 ≤ −log2` false | holds | none |
| 1.8 Euclidean lattices | `A₂`; lines `ℚ(1,2)`, `ℚ(2,−1)` | covolume `√3/2`, slope `½log(2/√3) = 0.0719`; both degrees `−½log5` | holds | none |
| 2.1 maximal and minimal slopes | `ℤ ⊕ (ℤ,e^{−c}|·|)`; ideal twist | `μ̂_max = c`, `μ̂_min = 0`; `deĝ(𝔞) = −log N𝔞`; Bost2001 lines 1352–1360 (p. 195), Gaudron2008 lines 1488, 1499 | holds | none |
| 2.2 duality, sums, extensions | dual of `ℤ ⊕ (ℤ,e^{−c}|·|)`; `ℤ(1,1) ⊂ ℤ²` | `0 = −μ̂_min`, `−c = −μ̂_max`; `0 ≤ max(−½log2, ½log2)`; Bost2001 line 1361; Gaudron2008 line 1509 | holds | none |
| 2.3 image form | `φ = id`; projection `ℤ² → ℤ` | both sides `μ̂_min(Ē)`; `0 = 0`; route uses 1.4 (ii) on `Ē/V′ → F̄_W/W′` | holds | none |
| 3.1 Harder–Narasimhan steps | `ℤ ⊕ (ℤ,e^{−c}|·|)`; dual, `θ = 0, −c` | `ℚ²`, `ℚe₂`, `0`; `(E^∨)_{≥0}` of dimension 1 = `(ℚe₂)^⊥`; `(E^∨)_{≥−c}` everything | holds | none |
| 3.4a Galois descent | `ℚ(i)/ℚ`, `M(1,i)`, `M(1,1)` | `(1,i) ↦ (1,−i)`, not stable; `(1,1)` descends; §7.7 on main read; Tau Ceti lemma at Span.lean:41 | holds | C04 |
| 4.4 tensor products | `a = b = 2`; lines; `(ℤ²)^{⊗m}` | `3 ≤ 4`; `ε_K(1) = 0`; `m·(3/2)·log2`; BostKunnemann2010 lines 1751, 1753 (p. 40) | holds | none |
| 5.2 slopes from coranks | `w ≡ 0`, `w ≡ 1` | `μ̂ ≥ a`; `μ̂ ≥ a − H`; integrand `0` for `τ > H` | holds | none |
| 5.3 frame lemma | coordinate lines; three vectors at `2π/3`; `ε ≥ ¼` | `εD ≤ 2εD`; `0 ≤ 4/3`; `x − √(ηx) ≤ c ⇒ x ≤ η + 2c`; `4ε ≥ 1` makes both bounds `≥ D` | holds | none |
| 5.5 nearly tight frame (headline 4) | `Ē ⊕ L̄`; `ℤ(1,1,0,0) ⊂ ℤ⁴`; scaling by 2 | `η = 1/d`, bound `−H/d` vs true `−H/(d+1)`; `η = 3`; `2√u(√(u+H)−√u) ≤ H`; display homogeneous of degree 1 | holds | none |
| 6.1 Hermitian approximation | `ℓ^∞`, `ℓ¹` on `ℂ^N` | `N^{−½}|x|₂ ≤ |x|_∞ ≤ |x|₂`; `|x|₂ ≤ |x|₁ ≤ √N|x|₂`; cited name absent on main | holds | C01 |
| Headline 1: filtration, polygon, base change (3.2, 3.3, 3.5) | `(ℤ,e^{−c}|·|)² ⊕ ℤ`; `A₂`; `ℤ²` over `ℚ(i)` | `V₁` of rank 2; slopes `0.0719` twice; line `(1,i)` has `deĝ_n = −½log2` | holds | none |
| Headline 2: slope inequality (2.4, 2.5) | projection with `c > 0`; filtered `ℤ²`; 2.6 over `ℚ(i)` | `μ̂_max = c > 0` without injectivity; `0 ≤ 0`; `−½log2 = −½log2 + ½log2 − ½log2` | holds | none |
| Headline 3: minima (4.1–4.3), powers (4.5) | `(ℤ,ρ|·|)`; `ℤ²`; `ℚ(i)`; `Sym³ℤ³` | both bounds `log ρ`; `log(2/π) ≤ 0 ≤ log(4/π)`; `log(2/√π)`; `c(ℚ,2) = 0.2416`; `0.90 ≤ 3.30 ≤ 9.53` | holds | none |
| 5.6, 5.7 pairwise and compressed forms | `ϖ = ¼`, `η₀ = η₁ = √e₀ = ⅛`; `ϖ = 1/20`, `ϑ = ¼` | `η = 1.118 ≤ 1.25`; polynomial `ϖ(2 − 6.5ϖ + 0.5ϖ² − 0.125ϖ³)`; `κ = 0.2692`, `η′ = 1.3405 ≤ 1.55`; `1.25·3.76·0.539 = 2.53` | holds | none |
| 6.6 spherical heights | `s₁ + s₂`; `s₁s₂`; `det(s₀,s₁)` | `½log2 − ½`; `m = −1`, `0 ≥ −1 + log2`; `−½ ≥ −(log2 + 1)`; (v) follows from one bound `B_k` per column | holds | none |
| 6.7 route, step (4) | degree count; `ℙ²`, `T = 4`; conic | `Σ(a/D)binom(a+D−1,D−1) = binom(T−1,D+1)`; `e_T = 10`, `deg g = 6`; `deg g = T − 1` | label wrong | C03 |
| 6.7b (e′), (f′) | `u², uv`, `T = 3`; identity after (f′) | `8.546 ≥ −5.886`; `1.068 ≥ −2.516`; difference `N₀D(D+1)(h+c) + c(N₀D(D+1)+wT+ϱD) + ½logβ(wT+ϱD) + w logΛ_D + ϱ logΛ_T` | holds | none |
| Downstream consumers, scope | merge order; main | HeightsRationalPointsAndObstructions precedes this roadmap; ArakelovGeometryAndAbelianHeights is on main | wording | C02 |
| Description | elaboration of `Suggested.lean` | exit 0, no message; nothing declared | stale | C05 |

- Source locators checked against the text: 17. Gaudron2008: 8 (lines 1488, 1499, 1509, 1902, 1921, 1931, 1943, 2112). Bost2001: 7 (lines 1300, 1352, 1361, 1375, 1384, 1513, 1524). BostKunnemann2010: 2 (lines 1751, 1753). Numbers, pages and hypotheses match.
- Library declarations opened at the pins: 14 in Tau Ceti, among them `TauCeti.arakelovLogHeight` (NumberTheory/Height/Arakelov/Basic.lean:127), `TauCeti.Probability.uniformSphereMeasure` (Probability/Distributions/Uniform/Sphere/Basic.lean:77), `map_uniformSphereMeasure` (:138), `stdGaussian_map_sphereDirection` (:251), `HasLaw.indepFun_sphereDirection_norm_stdGaussian` (:277), `ZLattice.covolume_dual` (Algebra/Module/ZLattice/Covolume.lean:273), `SymmetricPower.toTensorPower_injective` (LinearAlgebra/SymmetricPower/Basic.lean:243), `Submodule.covolume_mixedImage`, `exists_pseudoBasis`. No Hermitian vector bundle carrier at the pin.
- Cross-roadmap citations resolved: 34. On main: ArithmeticGaloisRepresentations §7.7; StandardDistributions §§4.1, 4.3; AlgebraicModuliForArithmeticGeometry §§1.6, 9.10; FreeProbability F8; DiophantineApproximationAndTranscendence §2.5 (`twistedFiltration`, `absoluteAdelicMinima`); SubspaceTheorem §§4.1–4.2; SuccessiveMinima §0.1; GeometryOfNumbersAndQuadraticArithmetic §2.2.4; ArakelovGeometryAndAbelianHeights §1.14; four Harder–Narasimhan sections of other roadmaps. At open heads: AdelicHeightsAndSuccessiveMinima §§2.5a, 3.1; HermitianFormsAndLattices §§4.0, 4.0b; HeightsRationalPointsAndObstructions §§5.9b, 5.10c, 5.17a–f; ArakelovGeometryAndAbelianHeightsPartII §§0.3, 4.2–4.3; ChowFormsAndHeightsOfSubvarieties §§6.1–6.2; ThetaChainsAndFrobeniusPrimeSums §9.6; the five gaps of FaltingsFinitenessAndIsogenyTheoremsPartII.
- Dependency check: `depcheck: 171 roadmaps, 1993 edges, 0 problem(s)`. No file changes outside the folder and the family index. Automatic checks: all passed.
- Elaboration: `lake env lean` on `Suggested.lean` returns exit 0 with no message. The file declares nothing, so there was nothing for `#check @name` or the one-tactic probe; its docstring names the four headline groups as not statable, with the carriers each lacks.
- Overlap check: read AdelicHeightsAndSuccessiveMinima, ChowFormsAndHeightsOfSubvarieties, HeightsForLogSingularMetrics, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, FaltingsFinitenessAndIsogenyTheoremsPartII (open), ArakelovGeometryAndAbelianHeights, DiophantineApproximationAndTranscendence, HeightsAndUnits (main). Shared: the adelic height `H_A` (owner DiophantineApproximationAndTranscendence §2.5, cited); spherical heights 6.6, 6.7a (owner here; ChowFormsAndHeightsOfSubvarieties cites them); `μ̂_max` and the morphism inequality (owner here; requested elsewhere as gaps, not stated on main); Galois descent of subspaces (owner ArithmeticGaloisRepresentations §7.7, cited).
- Source independence: 19 passages compared with 3 sources (the 17 locators, the routes of 1.3 and 2.4 (b)); none shared beyond forced formulas. Largest share Gaudron2008, 18 of 40 locators; contents compared with Gaudron2008 §§4–7: independent (its §6 is split between Layers 1 and 2 and precedes its §5 material here; Layers 5 and 6 have no counterpart). [FormalProof] not readable: not compared.
- Research link: Layers 2–4 are the slope theory of Bost (1996, 2001) and Gaudron (2008), used in Bost's proof of the period theorem of Masser–Wüstholz; 6.3–6.4 is Chen's (2010) convergence of maximal slopes. Rests on the README's References and on Bost2001 and Gaudron2008 as read.

## Not verifiable

- [FormalProof] (a GitHub repository) and [Announcement] (a PDF on alpo.ge): the sources service puts neither host in a licence class, so neither was opened. Every sentence of the README on what [FormalProof] states is unchecked against it.
- Stuhler1976 and Grayson1984 (the only sources named for 3.1), Borek2005, StruppeckVaaler1990, Philippon1991, DeBruijnErdos1952: uncertified, cited by name.
- Bost1996 and Chen2010 locators were not reopened in this round; 5.2 and 2.3 carry no locator (stated with their routes).

## Source issues

- none

## For the human reviewers

- Licence: [FormalProof] (github.com/leanprover-community/riemann-hypothesis) and [Announcement] (alpo.ge/remark.pdf), README lines 1224–1225, are on hosts in no licence class; neither was read.
- Scope: Layers 1–4 and 6.1–6.6 rest on refereed sources (Bost1996, Bost2001, Gaudron2008, Chen2010, BostKunnemann2010). 1.2a (iii), Layer 5 and 6.7b name only [FormalProof], an unrefereed formalisation announced 20 November 2026 (README line 1207).
- Not tested: wording and arrangement were not compared with [FormalProof], which the README names on 26 lines without a file or declaration locator.
