# Review of DimerModelsAndLozengeTilings (pull request #2422 at 72bfddb)

**Verdict:** accepted

No findings.

## Verified sound

| Target | Instances tried | Left side (computed) | Right side (computed) | Result |
| --- | --- | --- | --- | --- |
| Conventions: faces, heights, rotation | `W(0)`, `B(0)`; `M₁, M₂, M₃`; `ρ` on `e₁, e₂, e₃` | closure round `W(v)`: `(#M-edges) − 1 = 0`; `ρ³ = id`; `H_{M₁}(ρ⁻¹w) + w₁ = w₂` | `H_{M₂} = y`; `ρM₂ = M₃`: `−w₁ + w₁ = 0`; Gorin height of `M₃`: `x + y`, steps `+1`, `−2` | agree |
| 1.3 Regions | `{W(0)}`; `R₆`; `Faces` of the unit square, of `{0, e₁}`; boundary of `Faces(V)` | `3 = 2·0 + 3`; `18 = 2·6 + 6`; `{W(0), B(0)}`; `∅` | six faces at `0` in `R₆`, so `0 ∉ ∂R₆`; Aggarwal's boundary equals `∂(Faces(V))` both ways | agree |
| 1.5 `tilingSubgraph_bijOn` | `R = ∅`; `{W(0)}`; `R₆`; free tilings of `{W(0)}` | 1 tiling; 0; 2 (`T_a`, `T_b`, each a partition of `R₆`); three free tilings, edgeless subgraph | 1 matching of the empty graph; 0; 2 matchings of the 6-cycle; hence restricted to tilings | agree |
| 1.6 Row tilings | `ε = 1_{[0,∞)}`; column reading with `ε = 1_{{0}}` | `W(x,y)`, `B(x,y)` each get one edge; `τ_{e₁}M_ε = M_{1_{[1,∞)}}` | `(σε)_x = ε_{x−1}`; `B(x,0)` gets no edge in the column reading | agree; wrong model excluded |
| 2.1–2.4 simple connectivity | `R_ring` (12 faces listed), ray cochain; `R₆` shelling; hole `Q = {W(0)}` | cochain closed on `B(k,0)`, `W(k,0)`: `1 + 0 = 1`; sum round `W(0)`: `0 + 1 − 0 = 1` | not exact; shelling adds one edge five times, two edges last | agree |
| 2.5 `tilingOfHeight_bijOn` | `M₁, M₂, M₃`; `M_ε` alternating; `⌊(x+y)/2⌋`; `x + y` | `x`, `y`, `0`; `⌊x/2⌋` (`x = −1`: `−1`); `e₃`-increment `1` everywhere | `(a, b, a+b) ∈ {(0,0,0), (1,0,1), (0,1,1)}`: one edge per face; `x + y`: increment `2`, rejected | agree |
| 2.6 Heights on regions | `{W(0)}`; `R_ring` with `T`; `R₆` normalised at `(1,0)` | `(H(e₁), H(e₃))`: `(1,1), (0,1), (0,0)`; `T` covers the 12 faces once, sum round `W(0)`: `−1` | all three height functions; no height for `T`; `T_a`: `H(0) = 0`, `T_b`: `H(0) = −1` | agree |
| 2.8 `flip_connected` | `R₆`; descent vertex of the route; 2 × 2 torus, height change `(1,0)` | `T_a → T_b` at `0`: `H(e_k) = 0 = H(−e_k) + 1`; tie-break `v₁ + v₂` minimal excludes `H(v−e_k) = H(v)` | two torus tilings, no type-2 lozenge, no flip | agree |
| 2.9 `thurston_tileable_iff` | `R₆`; `{W(0)}`; `R₆'`; `R = ∅` in the unrestricted form | `R₆'`: `h = 0,0,0,0,1,1,1,1`, `h(1,1) − h(2,1) = 1 > 0 = ρ_R`; `c₀` round a triangle: `−1` | `W(0,0)`, `W(1,0)` both adjacent only to `B(1,0)`: no tiling; `min_u(h(u) + ρ_R(u,v))` rises by `0` or `1` | agree |
| 2.10 Finite changes | `T_a` against `T_b`; `M₁` against `M₃` | `T_a ∖ T_b`: directions `3, 1, 2`; `T_b ∖ T_a`: `1, 2, 3` | one each; `M₁ Δ M₃` infinite, statement silent | agree |
| 3.2 `partitionFunction_eq_abs_det` | `R₆` unit and `(a,b,c)`; `R₆'`; `R_ring` | `det [[c,0,a],[b,a,0],[0,c,b]] = 2abc`; `det [[1,0,0],[1,0,0],[1,1,1]] = 0` | `2abc`; `0` tilings; ring: 12-cycle, 2 tilings, matchings differ by a 6-cycle, `det = 0` | agree; negative control holds |
| 3.3 `lozenge_correlation_eq_det` | `R₆`; `n = 0`; repeated face; repeated pair | `K⁻¹ = ½[[1,1,−1],[−1,1,1],[1,−1,1]]`; `det[[½,½],[−½,½]] = ½`; `n = 0`: `1` | mass of `T_a`: `½`; `1`; equal rows: `0`; repeated pair would give `0 ≠ ½`, excluded by injectivity | agree |
| Restricted Leibniz sums | `A = [[1,2,0],[0,1,3],[4,0,1]]`, rows `(0,2)`, columns `(1,0)` | `det A = 25`; `Λ_A = A(1,2) = 3` | `25 · det[[12,−3],[1,6]]/625 = 3` | agree |
| 4.3 Bernoulli | `I = ∅`; `ν = δ_a`; `(Bern(⅓)^{⊗ℤ} + Bern(⅔)^{⊗ℤ})/2` | one-point space; point mass; density event of mass `½` | ergodic; ergodic; not ergodic, not a product | agree |
| 4.5 Specifications | independent kernels `ν = Bern(½)`, `ν' = Bern(⅓)`; identity kernels on `{0,1}^ℤ` | `γ_{{0}} ∘ₖ γ_{{0,1}}{ω(0) = 1} = ½`; identity kernel at `C = {ω(0) = 1}`: values `0, 1` on one exterior class | `γ_{{0,1}}`: `⅓`, consistency fails; not `𝓕_{Λᶜ}`-measurable | agree; order of `∘ₖ` pinned |
| 4.6 `gibbsInvariant_isExtreme`, `gibbsInvariant_extreme_iff_ergodic` | `I = ∅`; `X = ∅`; `X₀ = {0̄, 1̄}`; density `2·1_{ω(0)=1}`; trivial `Γ` on `C₆` | `(fμ).bind γ_Λ (C) = ∫ γ_Λ(f1_C)dμ = (fμ)(C)` for exterior-measurable `f`; `∅` is a face | non-tail density: not Gibbs; finite `Γ`: midpoint `(δ_{M_a} + δ_{M_b})/2` Gibbs, endpoints not | agree; `Infinite Γ` needed and present |
| 5.2 `IsDimerGibbs` | `C₆`, `w(e₀) = 2`; `ℤ` with the empty configuration | `1·μ{M_a} = 2·μ{M_b}`: `μ{M_a} = ⅔` | Boltzmann `2/(2+1)`; reversed reading `⅓`; empty configuration passes identities, fails the null clause | agree |
| 5.3–5.4 dimer and lozenge faces | `V = ∅`; edgeless `G`; point mass at `∅`; `2δ_{M₃}` | Gibbs set `= {δ}`, `= ∅`; window contains a whole face, both cylinders mass `0` | faces of the invariant probabilities; excluded by concentration and by mass `1` | agree |
| 6.3 `slopeEdge_ergodicGibbs_equiv`, `two_ergodicGibbs_of_slopeEdge` | `s = ½`; `s ∈ {0,1}`; `ρ` on slopes | `P(ε₀ = ε₁ = 1)`: `s²` and `(s + s²)/2`: `¼`, `⅜` | equal only at `s ∈ {0,1}`; `(s,0) ↦ (1−s, s) ↦ (0, 1−s)` covers the three open edges | agree |
| 6.4 fibres | `ν₃`; `Σ a_k δ_{M_k}` | slope `(a₁, a₂)`; `(⅓,⅓)` forces `a = (⅓,⅓,⅓)` | `ν₃{M = M₁} = ⅓`: extreme in the fibre, not ergodic | agree |
| 7.1 Torus tilings | brute force, `1×1`, `1×2`, `2×2`, `2×3`, `3×3` | counts `3, 5, 9, 17, 42`; `1×2`: `(0,0), (1,0), (0,2)` once, `(0,1)` twice; `2×2`: `1,2,2,1,1,2` | all height changes satisfy `n₂a + n₁b ≤ n₁n₂`; `(2,1)` on `2×2` absent | agree |
| 7.3 `torusLimit_mem_gibbsInvariant_slope` | `(0,0)`; `(½,0)` with `m = 50`, `k = 2`, `j = 1`; empty cylinder | `C(98,49)/C(100,50) = 2500/9900 = 0.2525` | `→ ¼`; mass `1` in the limit; `⌊ns⌋ + ⌊nt⌋ ≤ n` keeps the set nonempty | agree |
| 8.2 sign of a torus tiling | Lean-form `K_{ab}`, `1×1` to `3×3`, generic weights on `3×2` | `Σ_M sign·weight` | `det K_{ab}` for all four `(a,b)`, six sizes (difference `< 10⁻⁶`) | agree |
| 8.3 `torus_partitionFunction_eq` | `1×1`, `1×2`, `2×1`, `2×2`, `2×3`, `3×3`, `3×2` generic, `1×2` signed | `Z`: `3, 5, 5, 9, 17, 42, 41225.3945, 1` | dets e.g. `1×2`: `3, 5, −1, 1`; `2×2`: `−3, 5, 5, 5`; `3×3`: `0, 28, 28, −28`; right sides equal `Z` | agree |
| 8.4 torus correlations | `2×2`, type-3 lozenge at `W(0)`, unit and `(2,3,5)` | `c_{ab}`: `(−1,1,1,3)`; `(60,100,150,190)`, `Z = 1444`, dets `0, 544, 1044, 1300` | `⅓`; `5·380/2888 = 25/38 = 950/1444` by enumeration | agree |
| 9.1 kernel | `w = (1,1,1)`; `(1,1,3)`; slope `(0.3, 0.45)` | `G(0) = .33333`, `G(0,−2) = −.05767` (two quadratures); `w₃G(0) = 1.0000` | `⅓`; `√3/(2π) − ⅓ = −.057669`; angles `.3000, .4500, .2500` | agree |
| 9.2 good sizes | `θ = π/2`; `2π/3`; `0.1` at `n = 188, 189` | `π/12 = .2618 > .125`; `2.636·10⁻⁴ < 3.879·10⁻⁴`; `2.669·10⁻⁴ < 3.849·10⁻⁴` | even `n ∉ W_{π/2}`; `4 ∈ W_{2π/3}`; both outside `W_{0.1}` | agree |
| 9.5 `exists_ergodicGibbs_of_slope` | `(⅓,⅓)`; `(½,¼)`; `(½,0)`; `(0.3,0.45)` | `w = (1, .7071, .7071)`, `1 < √2`; `(1,0,1)` not positive | densities `w_kG_w = (.3000, .4500, .2500)`; edge slope from 6.3 | agree |
| 9.6–9.7 `incompleteBetaKernel`, `incompleteBetaProcess_exists_unique` | 35 pairs `(v_i, v_j)`, both crossing sides, slope `(0.3, 0.45)`; `ξ = e^{πi/3}`; `m = 0` | `w₁G_w(v_i − v_j − e₂)`; `K_ξ(v;v) = .3333`; `K_ξ(v₁;v₂) = −.3333`, `K_ξ(v₂;v₁) = .05767` | factor `· K_ξ(v_j;v_i)`: max difference `1.0·10⁻⁹`; dets `.07507`, `.03421` both sides; `2/9 − √3/(6π) = .13033` | agree |
| 9.7(f) uniqueness | heights `1_{x>0}` on `y ≤ 0`, then `H = 1` or `H = y` | both height functions (increments in `{0,1}`), same `X(M) = {(0,y) : y ≤ 0}` | different tilings; a type-1 lozenge in row `y` or `y+1` forces `g_y(x+1) = 0` or `g_y(x) = 0` | agree |
| 10.2 `localLimit_isLozengeGibbs` | forced regions of `M_{1_{[0,∞)}}`; `M_c`, height `min(0,x,y)` | unique tiling, limit `δ_{M_ε}`; `M_c`: `H(e_k) = 0 = H(−e_k) + 1` | Gibbs, not invariant; point masses: limit `δ_{M_c}` not Gibbs, so uniformity is needed | agree |
| 10.3 Aggarwal's lattice side | `A = B = C = 1` | vertices `(0,0), (1,0), (0,1), (1,2), (2,2), (2,1)` (aggarwal2023 lines 370–375) | the six neighbours `(1,1) ± e_k`: `R₆ + (1,1)` | agree |

- The previous review of this head recorded no findings; there was none to recheck, and the folder is unchanged since.
- Source locators checked against the text: 77 in 8 sources (aggarwal2023 13, gorin2021 25, kenyon2009 14, sheffield2005 8, kos2006 8, kenyon1997 4, okounkov-reshetikhin2003 3, gibbsmeasure 2), the 15 sampled targets included; the README flags none as unverified.
- Library declarations opened at the pins: 64 in Mathlib and 17 in Tau Ceti, each at the file and line the supplier contracts give (for example `ErgodicSMul.iff_mem_extremePoints`, `ErgodicExtreme.lean`:239; `ProbabilityTheory.Kernel.IsProper`, `Proper.lean`:47; the complementary-minor identity, `ComplementaryMinor.lean`:160).
- Cross-roadmap citations resolved: VonNeumannAlgebras V8.BernoulliArbitraryDiscrete, FactorRigidity §8.3, TensorProductCombinatorics §1.1, RandomMatrices §8.3–8.4, GraphConnectivityAndFlows §§6.7 and 6.9, SpecialFunctionsEiLiErfIncompleteGamma Layer 15 and the completed ContourIntegration on main; ClassicalErgodicTheory §0.3, §1.4, §5.1, §8.4 at its open head. None is a supplier.
- Gate re-run at this head: every check 0, OK. Dependency check: `depcheck: 241 roadmaps, 2261 edges, 0 problem(s)`. No change outside the folder.
- Elaboration: `lake env lean` of `TauCetiRoadmap/DimerModelsAndLozengeTilings/Suggested.lean` gives 18 `sorry` warnings and nothing else. The 59 elaborated types were compared with the README statements: no binder lost, the standing hypotheses of Layers 4 and 5 (`Countable`, `Infinite Γ`, properness, `LocallyFinite`, positivity) are in each signature. One-tactic probe (`rfl`, `simp`, `infer_instance`, `constructor <;> simp`) on a scratch copy: none of the 18 theorems closes; every definition is used by a headline.
- Headlines of the README summary (1.5, 2.5, 2.8, 2.9, 3.2, 3.3, 4.6, 5.3–5.4, 6.3, 7.3, 8.3, 9.5, 9.7, 10.2): all stated in `Suggested.lean`, none through a stand-in. Pull request text: title and description agree with the head (new roadmap, no supplier, the Lean imports, the roadmaps named in Scope and their status).
- Duplication by object, over main and the 454 open roadmap pull requests (`Kasteleyn`, lozenge, dimer, Gibbs specification, tileability, discrete sine kernel, tail σ-algebra): no other owner; no fully qualified name of `Suggested.lean` occurs elsewhere.

Overlap check: read ClassicalErgodicTheory, PointProcesses, Exchangeability, ProbabilisticAndMetricNumberTheory, MathematicalBilliards; nothing shared (Bernoulli actions on `G → α` stay with ClassicalErgodicTheory and VonNeumannAlgebras, 4.3 is the proper-action variant on a general index set; tail σ-algebras of ℕ-indexed processes are Tau Ceti's, consumed in 4.1).

Source independence: 21 passages compared with 8 sources, none shared beyond formulas and declaration names; largest share gorin2021, 48 of 165 locators; contents compared with gorin2021: independent (Layers 4–6 use its Lecture 13 and precede Layers 7–9, which use Lectures 3, 4 and 6; Layer 3 merges parts of Lectures 2 and 3; the orders 2 → 3 and 7 → 8 → 9 are forced by the *Needs* lines of 3.2, 8.1 and 9.1).

## Not verifiable

- thurston1990: uncertified, cited by bibliographic data; 2.9 was checked against gorin2021 Theorem 1.4 and by the direct argument.
- georgii2011 Theorem 14.15: uncertified; its statement was read only as restated in sheffield2005 lines 1366–1371.

## Source issues

- **Error** in gorin2021 at Lemma 4.7, lines 1748–1780: the source says that for large `n` one of `n`, `n + 2` lies in `W_θ`; it should be one of `n`, `n + 1`, since for `θ = π/2` every even `n` fails; affects the proof.
- **Error** in aggarwal2023 at the remark after Definition 1.2, lines 465–467: the source says a plane tiling is determined by its type-1 positions whenever these are nonempty; it should be required that no two consecutive rows lack type-1 lozenges; affects nothing.
- **Error** in kenyon2009 at Theorem 6 and Section 5.4, lines 836–839 and 858–859: the source says there is a unique ergodic Gibbs measure for every slope of the closed triangle; it should be for interior slopes only, since non-corner edge slopes carry several; affects a stated result.
- **Error** in kenyon2009 at Section 5.4, lines 863–866: the source says the extreme points of the invariant Gibbs measures of a given slope are the ergodic ones; it should be that this holds for all invariant Gibbs measures, not slope by slope (the equal mixture of the three frozen measures is a counterexample); affects the proof.

## For the human reviewers

- **Licence.** `Specification` (`TauCetiRoadmap/DimerModelsAndLozengeTilings/Suggested.lean` lines 299–310) has the shape of `Specification` and `IsConsistent` in github.com/YaelDillies/gibbs-measure, `GibbsMeasure/Specification.lean` (gibbsmeasure lines 34–63; Apache 2.0); the README cites it in 4.5. Whether its authors were consulted is not stated.
- **Licence.** gorin2021 was read from the author's pre-publication copy on his university page (README References); the published book's numbering was not compared.
