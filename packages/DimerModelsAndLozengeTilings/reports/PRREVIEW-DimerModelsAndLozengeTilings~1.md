# Review of DimerModelsAndLozengeTilings (pull request #2422 at 8ce8e79)

**Verdict:** needs changes

## R01 (P3) — the residue evaluations of 9.1 and 9.7(a) have no supplier

**Location:** `TauCetiRoadmap/DimerModelsAndLozengeTilings/README.md` lines 2023–2025 and 2170–2171: "obtained by integrating `φ` by residues over the arc" and "it is obtained by evaluating the `φ`-integral of `G_w` by residues"; *Needs:* lines 2010 and 2194.

**Claim:** Both routes evaluate an inner integral over the unit circle by residues, but neither *Needs:* line (9.1: 8.5, `intervalIntegral`, `tendsto_integral_exp_inner_smul_cocompact`; 9.7: 4.4, 9.3, 9.4, 9.6) nor the Mathlib supplier contracts names a circle-integral or residue input.

**Witness:** At the pin, `Mathlib/MeasureTheory/Integral/CircleIntegral.lean` has `circleIntegral` (line 435), `circleIntegral.integral_sub_zpow_of_ne` (line 615) and `circleIntegral.integral_sub_inv_of_mem_ball` (line 748). The README cites none of them.

**Repair:** Change the 9.1 line to "*Needs:* 8.5; Mathlib `intervalIntegral`, `tendsto_integral_exp_inner_smul_cocompact`, `circleIntegral`, `circleIntegral.integral_sub_inv_of_mem_ball`, `circleIntegral.integral_sub_zpow_of_ne` (for `a = w₃ + w₁e^{−iφ}`, the inner integral `(2π)⁻¹ ∫₀^{2π} e^{id₁θ} dθ / (a + w₂e^{iθ})` is `[|a| > w₂] (−w₂)^{−d₁} a^{d₁−1}` for `d₁ ≤ 0` and `[|a| < w₂] (−a)^{d₁−1} w₂^{−d₁}` for `d₁ ≥ 1`)." Change the 9.7 line to "*Needs:* 4.4, 9.1, 9.3, 9.4, 9.6." Add the three names, with that file and those lines, to "From Mathlib". The stated inner formula reproduces `G(0,−2) = √3/(2π) − 1/3` (computed value −0.0577) and the densities `θ_k/π` at `w = (1, 1.6, 1.3)`.

## R02 (P3) — `positiveSteps` has no API and only one Check

**Location:** `README.md` lines 966–969: "Define `positiveSteps p` for a walk `p` in `regionGraph R`: the number of its darts that go from a vertex `u` to `u + e_k` for some `k`." No API list follows. The only Check that involves it is the `R₆'` step (lines 991–992).

**Claim:** `positiveSteps` is a definition of `Suggested.lean` (line 194) that 2.9's statement depends on. It needs an API list and at least three Checks that tell it apart from plausible wrong models: counting every dart, or the reversed orientation.

**Witness:** In `regionGraph {W(0)}`, the closed walk `0 → e₁ → e₃ → 0` has 2 positive darts and its reverse has 1. The all-darts model gives 3 in both directions, and no current Check separates the two models.

**Repair:** After the paragraph at lines 966–969, insert:
"API:
- `positiveSteps` is `0` on the empty walk, `1` on the one-dart walk from `u` to `u + e_k`, and `0` on the one-dart walk from `u + e_k` to `u`.
- It is additive under concatenation of walks, and `positiveSteps p` plus `positiveSteps` of the reversed walk equals the length of `p`.
- For a height function `H` on `R` and a walk `p` from `u` to `v` in `regionGraph R`, `H(v) − H(u) ≤ positiveSteps p`.

**Checks.**
- The closed walk `0 → e₁ → e₃ → 0` in `regionGraph {W(0)}` has `positiveSteps` `2` and its reverse `1`. Counting all darts would give `3` both ways.
- The one-dart walk `(2,1) → (1,1)` of `R₆'` has `positiveSteps` `0`. The reversed reading, counting darts from `u + e_k` to `u`, gives `1`; Thurston's inequality would then hold on `R₆'`, which has no tiling.
- The one-dart walk `0 → e₃` has `positiveSteps` `1`, which bounds the increments `0` of `H_{M₃}` and `1` of `H_{M₁}`."

## R03 (P3) — the GibbsMeasure project is cited but not in the manifest

**Location:** `README.md` lines 2373–2376: "[gibbsmeasure] Y. Dillies and coauthors, the GibbsMeasure project, a Lean formalisation of specifications and Gibbs measures following georgii2011 (Apache 2.0)". It is also cited at lines 1322–1327 (4.5).

**Claim:** Every cited work must be recorded in the roadmap's `sources.toml`. This one is not.

**Witness:** `packages/DimerModelsAndLozengeTilings/sources.toml` has 10 `[[source]]` entries (aggarwal2023, sheffield2005, kos2006, kenyon2009, okounkov-reshetikhin2003, cohn-kenyon-propp2001, kenyon1997, gorin2021, thurston1990, georgii2011) and none for `gibbsmeasure`. The file header names its authors as Yaël Dillies and Matteo Cipollina.

**Repair:** Record it through the sources service: `--id gibbsmeasure`, `--locator-scheme section`, `--locator "GibbsMeasure/Specification.lean: Specification, IsConsistent"`, `--cited-for "4.5"`, with the URL of that file at commit `fffe01e3a5d783fbe95b629cd34b97d50939b42b`. In the reference, write "Y. Dillies, M. Cipollina" in place of "Y. Dillies and coauthors".

## R04 (P3) — the pull request's dependency paragraph contradicts the README

**Location:** Pull request description: "Dependencies (the roadmaps the README cites by name and section, and what they in turn need; the Lean imports none of them). … Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** No list follows the "Dependencies" heading. The README also names ClassicalErgodicTheory, which is not on main and is not a consumer.

**Witness:** `README.md` lines 106–108 and 134–141 name ClassicalErgodicTheory §0.3 (item 2), §1.4 (item 2), §5.1 and §8.4 as the owner of neighbouring objects. That roadmap is absent from the content repository's main branch; it exists only as an open roadmap pull request.

**Repair:** Replace the paragraph with: "Dependencies: none. The README consumes no other roadmap (its supplier section *From other roadmaps* is None), and the Lean imports only Mathlib and `TauCeti.MeasureTheory.Group.ErgodicExtreme`. Scope and ownership names, as owners of neighbouring objects that this roadmap does not use: VonNeumannAlgebras, FactorRigidity, TensorProductCombinatorics, RandomMatrices, GraphConnectivityAndFlows, SpecialFunctionsEiLiErfIncompleteGamma and ContourIntegration (on main), and ClassicalErgodicTheory (an open roadmap pull request). Its consumer is the Part II, DimerModelsAndLozengeTilingsPartII."

## Verified sound

| Target | Instances tried | Left side (computed) | Right side (computed) | Result |
| --- | --- | --- | --- | --- |
| 1.1 faces and lozenges | `W(0)`, `B(0)`; aggarwal2023 lines 328–361 | `W(v)={v,v+e₁,v+e₃}`, `B(v)={v,v+e₂,v+e₃}`; type 1 = `W(v)∪B(v−e₂)` | Aggarwal's faces and type-1 vertices `(x,y),(x,y+1),(x+1,y+1),(x+1,y+2)` with `v=(x,y+1)` | agree |
| 1.2 `hexGraph` | neighbours of `W(0)`; 6-cycle at `0` | `B(0)`, `B(0,−1)`, `B(1,0)`; cycle via `(0,3),(0,2),((−1,0),1),((−1,−1),3),((0,−1),2),(0,1)` | recomputed from `TriFace.edges`; `W(0)`, `B(1,−1)` share only `(1,0)` | agree |
| 1.3 regions | `{W(0)}`, `R₆`, `Faces(V)` | `3 = 2·0+3`; `18 = 2·6+6` | Aggarwal's ∂ equals `∂(Faces V)`: both inclusions via a face at `v` outside `R` | agree |
| 1.5 `tilingSubgraph_bijOn` | `R = ∅`, `{W(0)}`, `R₆` | tilings: 1, 0, 2 | perfect matchings: 1 (empty), 0, 2 of `C₆` | agree |
| 2.4 | `{W(0)}`, wedge `W(0)∪B(1,1)`, `R_ring` | `F(R)` simply connected: yes, yes, no | combinatorial: yes, yes, no (cochain sums to `1` round `W(0)`) | agree |
| 2.5 `tilingOfHeight_bijOn` | `M₁,M₂,M₃`; `⌊(x+y)/2⌋`; `x+y` | `H = x, y, 0`; `⌊(x+y)/2⌋` has `e₃`-increment 1, no type 3 | `x+y` has `e₃`-increment 2, not a height function; `x+y−3H` gives Gorin's `+1/−2` rule | agree |
| 2.6 | `{W(0)}`; `T` on `R_ring` | three free tilings ↔ `(H(e₁),H(e₃)) = (1,1),(0,1),(0,0)` | `T` covers all 12 faces once; increments `0,0,1` sum to `−1` round `W(0)` | agree |
| 2.7 | hexagon; `R_strip`; wedge | hexagon `h = 0,0,0,−1,−1,−1`, consistent round the loop | strip: `M₃`, `M₂` give `0` vs `1` on `y=1` | agree |
| 2.8 `flip_connected` | hexagon; selection rule | `T_a → T_b` at `0`; `H_max(0)−H_min(0) = 1` | max `H−H_min`, then max `H`, then min `v₁+v₂` forces `H(v±e_k)` pattern; stays `≥ H_min` | agree |
| 2.9 `thurston_tileable_iff` | `{W(0)}`, `{W(0),B(0)}`, `R₆'` | `{W(0)}`: `0+0−1 ≠ 0`, no `h`, no tiling; lozenge: `h ≡ 0`, tiling `{(0,3)}` | `R₆'`: `h(1,1)−h(2,1) = 1 > 0`; `W(0,0)`, `W(1,0)` both see only `B(1,0)` | agree |
| 2.10 | `T_a`, `T_b` | `T_a∖T_b`: one edge per direction | `T_b∖T_a`: one edge per direction | agree |
| 3.2 `partitionFunction_eq_abs_det` | hexagon `(a,b,c)`; `R₆'`; `R_ring` | `det = 2abc`; `0`; `0` | `Z = 2abc`; no tiling; `Z = 2` (not simply connected, 6-cycle odd) | agree |
| 3.3 `lozenge_correlation_eq_det` | hexagon, unit and type weights | `K⁻¹ = ½[[1,1,−1],[−1,1,1],[1,−1,1]]`; `det[[½,½],[−½,½]] = ½` | mass of `T_a` = ½; `c·ab/(2abc) = ½` | agree |
| Conventions, `Λ_A` | `A = [[1,2,0],[0,1,3],[4,0,1]]` | `Λ_A = A(1,2) = 3`, `det A = 25` | `25·det[[12,−3],[1,6]]/625 = 3` | agree |
| 4.5 `Specification`, `IsGibbs` | sheffield2005 lines 305–342; `Kernel.comp` (Comp.lean line 50) | Gibbs is `μγ_Λ = μ`, here `μ.bind γ_Λ = μ` | `∘ₖ` applies right factor first: `γ_{0}∘ₖγ_{0,1}` gives ½ vs `γ_{0,1}` ⅓ | agree; order pinned |
| 4.6 `gibbsInvariant_isExtreme` | trivial group on `C₆`; proper `ℤ` | finite group: `(δ_a+δ_b)/2` Gibbs, `δ_a` not → face fails | Lean carries `Infinite Γ`, properness; limsup of translated cylinders is tail, error `Σ2^{−k}` | agree |
| `gibbsInvariant_extreme_iff_ergodic` | identity spec on `X₀ = {0̄,1̄}` | extreme points `δ_{0̄}`, `δ_{1̄}` | ergodic ones the same; midpoint gives `{1̄}` mass ½ | agree |
| 5.2 `IsDimerGibbs` | `C₆`, `w(e₀) = 2` | identity: `1·μ{M_a} = 2·μ{M_b}` → `μ{M_a} = ⅔` | Boltzmann `2/3`; reversed reading `⅓` | agree |
| 5.3 `dimerGibbsInvariant_isExtreme` | `ℤ`, `Γ = 2ℤ`; empty edge set | `𝒢_inv` = segment `δ_even`–`δ_odd`, endpoints ergodic | empty edge set: properness vacuous, face is `∅` (or all, `V = ∅`) | agree |
| 5.4 lozenge face, ergodicity | `ν₃ = (δ_{M₁}+δ_{M₂}+δ_{M₃})/3` | in `lozengeGibbsInvariant`, slope `(⅓,⅓)` | event `{M = M₁}` invariant, mass ⅓: neither ergodic nor extreme | agree |
| 6.1 `slope` | `δ_{M_k}`; `ρ` | `(1,0),(0,1),(0,0)` | aggarwal2023 lines 421–431, gorin2021 Def. 13.10; `ρ`: `(1,0) ↦ (0,1)` | agree |
| 6.3 `slopeEdge_ergodicGibbs_equiv` | `s = 0, 1`; shift direction | `rowCode(e₁ +ᵥ ω)(x) = ω⟨(x−1,0),0⟩` | `= σ(rowCode ω)(x)`; `δ_{M₃} ↔ δ_{0̄}`, `δ_{M₁} ↔ δ_{1̄}` | agree |
| 6.3 `two_ergodicGibbs_of_slopeEdge` | `s = ½`; `ρ` twice | `P(ε₀=ε₁=1)`: Bernoulli `¼` | `β_s`: `(s+s²)/2 = ⅜`; `(s,0) ↦ (1−s,s) ↦ (0,1−s)` | agree |
| 7.2 `torusMeasure` | floor tiling; `n = 2`, `(½,0)` | increments in `{0,1}` iff `n₂a+n₁b ≤ n₁n₂`; `⌊ns⌋+⌊nt⌋ ≤ n` | enumerated: 2 tilings with height change `(1,0)` | agree |
| 7.3 `torusLimit_mem_gibbsInvariant_slope` | `(0,0)`; `(½,0)` | `μ^{0,0}_n = δ_{M₃}` | `C(2m−k,m−j)/C(2m,m) → 2^{−k}` | agree |
| 8.3 `torus_partitionFunction_eq` | all `n₁,n₂ ≤ 3`, 3 random signed integer weights each | enumerated `Z`; tilings 3,5,9,5,9,17,9,17,42 | four-determinant formula equal in all 27 trials; 2×2 dets `−3,5,5,5` | agree |
| 8.3 signed weight | 1×2, `w((0,0),3) = −1` | `Z = 1` | dets `−1,1,−1,1`; `(−1+1+1+1)/2 = 1` | agree |
| 8.4 | 2×2, `(w₁,w₂,w₃) = (2,3,5)` | cofactor formula `5(−60+100+150+190)/2888 = 25/38` | enumeration `25/38`; `det K₀₀ = 0` | agree |
| 9.1 `G_w` | `w = (1,1,1)`; `(1,1.6,1.3)` | `G(0,−2) = −0.0576`; densities `.2146,.4841,.3013` | `√3/(2π)−⅓ = −0.0577`; `θ_k/π = .2146,.4841,.3013` | agree |
| 9.2 `W_θ` | `θ = π/2`; `θ = 0.1`, `n = 188, 189` | gorin2021 Lemma 4.7: `n` or `n+2` | `π/2`: every even `n` fails; `2.64·10⁻⁴ < 3.88·10⁻⁴`, both fail | README's `n` or `n+1` right |
| 9.4 | type-3 pair | `w₃²(G(0)²−G(d)G(−d))` | covariance `−w₃²G(d)G(−d)` | agree |
| 9.7 `incompleteBetaProcess_exists_unique` | `(s,t) = (0.3,0.45)`, six pairs | `w₁G_w`: `.2860,.1514,.3686,.0522,.1821,−.0393` | `κ`-conjugated `K_ξ`: `.2860,.1514,.3686,.0522,.1821,−.0393` | agree within `3·10⁻⁵` |
| 9.7 determinants, diagonal | pair, triple; `K_ξ(v;v)` | `det w₁G`: `.07505`, `.03420`; `K_ξ(v;v) = .3000` | `det K_ξ`: `.07507`, `.03421`; `s = .3` | agree |
| 10.2 `localLimit_isLozengeGibbs` | `R₆ + v_N`; `M_c = min(0,x,y)` | swapping `F`-patterns is a bijection of tilings of `R_N` once `F`'s faces lie in `R_N` | hexagon limit `½δ_{T_a}+½δ_{T_b}` not on `𝔈(𝕋)`; `δ_{M_c}` not Gibbs | agree |
| R01 inner integral | `w = (1,1,1)`, `d = (0,−2)` | `[|a|>w₂]/a` route gives `−0.0576` | `√3/(2π)−⅓ = −0.0577` | input unnamed in *Needs:* |
| R02 `positiveSteps` | `0→e₁→e₃→0` | positive darts 2, reverse 1 | all-darts model 3, 3 | no Check separates them |

- Source locators checked against the text: 38 (aggarwal2023 9, gorin2021 12, kenyon2009 7, kos2006 4, sheffield2005 4, kenyon1997 2); every one of the 15 sampled targets is supported at its locator.
- Library declarations opened at the pins: 62 Mathlib (all present, cited lines match), 19 Tau Ceti (all present; `ErgodicSMul.iff_mem_extremePoints` needs `[Countable G] [MeasurableConstSMul G X]`, as the README says).
- Cross-roadmap citations resolved: 13. These are VonNeumannAlgebras V8.BernoulliArbitraryDiscrete (Layer 8 on main, kept at its open revision's head), FactorRigidity §8.3, ClassicalErgodicTheory §0.3, §1.4, §5.1, §8.4 (open head), TensorProductCombinatorics §1.1, RandomMatrices §8.3–8.4, GraphConnectivityAndFlows §§6.7, 6.9, SpecialFunctionsEiLiErfIncompleteGamma Layer 15 and ContourIntegration L3.
- Gate re-run at this head: every check 0, OK. Dependency check: `depcheck: 238 roadmaps, 2248 edges, 0 problem(s)`.
- Elaboration: `lake env lean` of `Suggested.lean` gives 18 `sorry` warnings and nothing else. `#check @` of all 59 declarations in a scratch copy matches the README; no section variables, no lost binders.
- One-tactic probe (`simp`, `rfl`, `infer_instance`, `exact?`): 0 of 18 theorems close; nothing is padding. Every headline named in the summary is stated.
- Overlap check: read ClassicalErgodicTheory and PointProcesses (open), Exchangeability, ProbabilisticAndMetricNumberTheory and MathematicalBilliards (main); the results list is empty. Shared objects: Bernoulli actions on `G → α` (owner ClassicalErgodicTheory §0.3, item 2; 4.3 is the declared proper-action variant) and `tailProcess` (owner Tau Ceti, cited). Bowen–Gibbs `IsGibbsMeasure` (ClassicalErgodicTheory §8.4) is a different object.
- Source independence: 25 passages compared with 6 sources, none shared beyond formulas and standard names. Largest share is gorin2021, 50 of 178 source citations. Contents compared with gorin2021: Lectures 1, 2, 3, 4, 13 map to Layers 2, 3, 8, 9 and 4–6/10, not one to one, with Layers 4–7 interposed: independent. kenyon2009 §§5.1–5.4 match Layers 5–7 only in the order that *Needs:* 5.3 → 6.1 → 7.3 forces.

## Not verifiable

- thurston1990 (2.9): the manifest records it as uncertified (paywalled); cited by bibliographic data only, and not opened.
- georgii2011 Theorem 14.15 (4.2, 4.6, 5.4): the manifest records it as uncertified; the statement was checked through its restatement as sheffield2005 Lemma 3.2.2 (lines 1367–1371).

## Source issues

- **Error** in gorin2021 at Lemma 4.7, p. 45: the source says that for large `n` either `n` or `n + 2` lies in `W_θ`; it should be `n` or `n + 1`, since for `θ = π/2` every even `n` fails; affects the proof.
- **Error** in aggarwal2023 at the remark after Definition 1.2, p. 10: the source says a plane tiling is determined by its type-1 positions unless there are none; it should be: determined when no two consecutive rows lack type-1 lozenges (heights `1_{x>0}` below and `1` or `y` above share `X(M)`); affects nothing.
- **Error** in kenyon2009 at Section 5.4, p. 29: the source says extreme points of the slope-`(s,t)` invariant Gibbs measures are ergodic, so that set is a point; it should be a separate ergodicity argument, since `(δ_{M₁}+δ_{M₂}+δ_{M₃})/3` is extreme there but not ergodic; affects the proof.
- **Gap** in gorin2021 at Lemma 13.7, p. 111: the source says, without proof, that restricting a Gibbs translation-invariant measure to a translation-invariant event gives a Gibbs measure; it should be preceded by showing that invariant events are almost surely tail events; affects the proof.

## For the human reviewers

- **Licence.** `Specification` (`Suggested.lean` lines 299–310) follows the shape of `Specification` and `IsConsistent` in github.com/YaelDillies/gibbs-measure, `GibbsMeasure/Specification.lean` at commit fffe01e3 (header: Apache 2.0, Y. Dillies, M. Cipollina). Its consistency equation is identical; the field names and the subshift carrier differ. README 4.5 acknowledges this.
