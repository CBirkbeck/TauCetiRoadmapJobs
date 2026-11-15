<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13737#issuecomment-6895041064 -->
Review (claude) of f21951c

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 4.3 uses two pinned Mathlib declarations that no *Needs:* line names

   **Location:** `design/README.md:997–1007` (4.3): "read the coordinates along an enumeration of `I`,
   under which they are independent with law `ν`, and apply the sequential zero-one law"; and
   "`ν^{⊗I}` … is `Γ`-invariant". Also `design/plan.json`, target 4.3 `prerequisites`.

   **Claim:** the route's inputs are `Measure.infinitePi`, the zero-one law, `ErgodicSMul` and the Tau
   Ceti criterion.

   **Witness:** `measure_zero_or_one_of_measurableSet_limsup_atTop`
   (`Mathlib/Probability/Independence/ZeroOne.lean:290`) takes `h_indep : iIndep s μ`. The supplier is
   `ProbabilityTheory.iIndepFun_infinitePi` (`Mathlib/Probability/Independence/InfinitePi.lean:124`);
   invariance is `MeasureTheory.Measure.infinitePi_map_piCongrLeft`
   (`Mathlib/Probability/ProductMeasure.lean:494`). Neither is in the README.

   **Exact repair:** add both names, with file and line, to the `MeasureTheory.Measure.infinitePi`
   bullet of "From Mathlib", to the *Needs:* line of 4.3 and to the plan's prerequisites of 4.3.
   Tested on `I = Γ = ℤ`, `ν = Bern(1/2)`: `iIndepFun_infinitePi` with `X i = id` gives independence of
   the coordinates, which is the `h_indep` of the zero-one law once reindexed along `e : ℕ ≃ ℤ`;
   `infinitePi_map_piCongrLeft` with `e = (· + 1)` gives shift invariance.

2. **F02** (P3) a manifest status word in the roadmap text

   **Location:** `design/README.md:979–980` ("georgii2011 Theorem 14.15 (uncertified)") and `:1125`
   ("georgii2011 Theorem 14.15, uncertified").

   **Claim:** none mathematical; the text records the manifest status of a source.

   **Witness:** `sources.toml`, entry `georgii2011`, already has `status = "uncertified"`. The house
   style keeps the README timeless; `thurston1990`, the other uncertified entry, is cited at
   `README.md:772` without the word.

   **Exact repair:** delete "(uncertified)" at `:980` and ", uncertified" at `:1125`. The References
   entry ("cited by bibliographic data") stays.

3. **F03** (P3) the Summary's "every edge slope" should say non-corner

   **Location:** `design/README.md:22–23`: "the classification on the edges of the slope triangle, with
   two distinct ergodic Gibbs measures of every edge slope (6.3)".

   **Claim:** every slope on an edge carries two distinct ergodic Gibbs measures.

   **Witness:** 6.3(f) (`:1333`) assumes `0 < s < 1`; at `s = 1` 6.2 (`:1310`) gives the single measure
   `δ_{M₁}`, and `s² = (s + s²)/2` exactly at `s ∈ {0,1}` (computed: `1/4` against `3/8` at `s = 1/2`).

   **Exact repair:** write "of every non-corner edge slope". Tested: at `(1,0)` the fibre is
   `{δ_{M₁}}`, excluded by the new wording; at `(1/2,0)` the two measures differ.

Three findings, all P3 (none blocking). The five round-5 findings are repaired and the repairs are
correct at the pins. The adversarial pass, recomputed from scratch this round (exact rational
arithmetic, brute-force enumeration and numerical quadrature), found no false statement, no missing
hypothesis and no wrong sign in any layer. Each of the three findings asks for a small repair of the README, so the verdict asks for changes: a fix round applies R01–R03.

## Previous findings: repair verification

Five findings in round 5; none was marked not actionable.

| Round-5 finding | Status | Repaired passage and check |
|---|---|---|
| F01 (P2) 4.5 restated Mathlib's proper kernels | **Repaired** | `README.md:1058–1066`: "Mathlib kernels `γ_Λ : Kernel[𝓕_{Λᶜ,X}, 𝓕_X] X X` … each an `IsMarkovKernel` and `ProbabilityTheory.Kernel.IsProper` … consistent: `γ_Λ ∘ₖ γ_Δ = γ_Δ`". Opened at the pin: `Proper.lean:47`, `:57`, `:73`; `Invariance.lean:39`; `Defs.lean:55/70/138`; `Composition/Comp.lean:50` (`(η ∘ₖ κ) a = (κ a).bind η`, so the right factor acts first, as the README says); `MapComap.lean:152`; `MeasurableSpace/Basic.lean:233`. The `comap` along the identity is needed for the composite to typecheck and is stated. |
| F02 (P2) cylinder ring restated | **Repaired** | `README.md:940–943`: "Cylinder events are the members of `MeasureTheory.measurableCylinders (fun _ : I => S)`". Pin: `Cylinders.lean:275/335/345/366/409/415/418`, `ProjectiveFamilyContent.lean:57`, `Filtration.lean:534`, `MeasuredSets.lean:86` (three hypotheses, all now in the contract), `PiSystem.lean:106`. |
| F03 (P2) Bernoulli ergodicity owned on main | **Repaired** | `README.md:92–100` and `:1002–1004`. Resolved on main: `TauCetiRoadmap/VonNeumannAlgebras/README.md:2788` (V8.BernoulliArbitraryDiscrete, action `x(g⁻¹h)`, the same as here), `TauCetiRoadmap/FactorRigidity/README.md:767` (§8.3). The fix worker's correction "null fixed-point sets" instead of "essential freeness" matches `VonNeumannAlgebras/README.md:2794`. |
| F04 (P3) "subshift" wider than Mathlib's | **Repaired** | `README.md:921–927`. Pin: `SymbolicDynamics/Basic.lean:150` (`mulShift g x h = x (g * h)`), `:233`, `:253`, `:214`, `:219`. Witness recomputed: the action of `1` sends `1_{{0}}` to `1_{{1}}`; `shift (−1)` gives `1_{{1}}`, `shift 1` gives `1_{{−1}}`. |
| F05 (P3) 4.6(b) bridge lemma | **Repaired** | `README.md:1127–1133`: "each of their level sets is almost equal to an exactly invariant event (Tau Ceti `TauCeti.MeasureTheory.exists_smul_invariant_ae_eq`)". Pin: `TauCeti/MeasureTheory/Group/CountableAction.lean:53` (no hypothesis on the measure), `:68`. |

Repaired pattern searched in the rest of the design (a library object restated, or a route input
not named): one further instance, R01.

## Verified sound

### Coverage

Read all 1935 lines of the README, the plan (10 layers, 51 targets; every definition has at least 3
API entries and 3 tests; every target has a locator; no forward `target:` edge; `gaps: []`,
`suppliers: []`; baseline equal to `lake-manifest.json`: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`)
and the manifest (10 works, one key each; 8 certified, 2 settled uncertified). No LaTeX delimiters,
machine paths, pull-request numbers or round labels in the README. No declared gaps. No maintainer
notes. No author-flagged unverified locator.

### Seeded source sample (15 targets, each read at the cited lines)

| Target | Lines read | Outcome |
|---|---|---|
| 1.2 | gorin2021 688–702; kenyon2009 95–113 | Dual hexagonal graph, bipartite, tilings as matchings: supported. |
| 2.2 | gorin2021 447–458 | Consistency of the local rule; the square identity is the roadmap's own, recomputed below. |
| 2.3 | kenyon2009 353–368 | Flow–height duality as cited; the obstruction theorem is the roadmap's own, checked below. |
| 2.8 | gorin2021 754–784; kenyon2009 535–551; cohn-kenyon-propp2001 341, 404–417 | Maximal height function, flips as cube moves, lattice of heights: supported. |
| 4.3 | sheffield2005 1349–1360 | Lemma 3.2.1: extremity and ergodicity as triviality on invariant events. |
| 4.5 | sheffield2005 303–342 | Kernels and `μγ_Λ = μ`. The abstract consistent family is the roadmap's own packaging; the locator sits at the Gibbs clause it supports. |
| 5.3 | gorin2021 4534–4582; aggarwal2023 410–420; kos2006 193–202; kenyon2009 825–835; sheffield2005 1352–1371 | Both definitions of "ergodic" and the face lemma at the cited lines. |
| 6.3 | sheffield2005 6195–6198; gorin2021 4634–4644; kenyon2009 891 | Theorem 9.5.1 as cited; (a)–(f) are the roadmap's own, checked below. |
| 7.3 | kenyon2009 844–866; kos2006 206–220 | Limits are invariant Gibbs of the given slope; ergodicity rightly not claimed. |
| 8.1 | gorin2021 1452–1472; kenyon1997 380–390 | Definition 3.9 and table (3.4); the rule `ε_{ab} = −1` iff `(a,b) ≡ (n₁,n₂)` is the table in the roadmap's own form. |
| 8.4 | gorin2021 1847–1850; kos2006 657–668 | Both use inverse minors; the complementary-minor form is the correct general one (row 6). |
| 9.1 | gorin2021 1853–1873, 2256–2269; kenyon2009 958–980; kos2006 714–740 | Kernel, zeros, angles: supported. |
| 9.3 | gorin2021 4693–4700, 1853–1871; kos2006 714–727 | Supported. |
| 9.4 | kenyon1997 85–93; kos2006 732–735; kenyon2009 1011–1016 | Mixing for the uniform measure and quadratic decay of covariances. |
| 9.6 | aggarwal2023 461–476; okounkov-reshetikhin2003 965–968 | Definitions 1.2, 1.3 and Definition 4 as stated; `X(M)` centre `v + (1/2,0)` recomputed. |

### Adversarial table

Computed this round from scripts in the scratch directory (not in the repository).

| # | Statement | Instances | Values computed | Result |
|---|---|---|---|---|
| 1 | 4.5 consistency and its order | `γ_{0}` Bern(1/2), `γ_{0,1}` Bern(1/3)⊗² | `γ_{0} ∘ₖ γ_{0,1}`: `P(ω₀=1) = 1/2` against `1/3`; reversed composite: proper `γ_Λ` integrates the `𝓕_{Δᶜ}`-measurable `γ_Δ(C|·)` to its value, so equality always | order discriminates; holds |
| 2 | 4.5 Gibbs ⇔ conditional expectation | `B = X` in `setLIntegral_eq_comp` | `∫ γ_Λ(C|·) dμ = (μ.bind γ_Λ)(C)` | both directions hold |
| 3 | 4.1 equivariance and enumeration form | `ℤ`, `Λ = {0}`, `γ = 1`, `E = {ω(−1)=1}`; `I = ∅`; `I` finite nonempty | `γE = {ω(0)=1} ∈ 𝓕_{{1}ᶜ}`, `∉ 𝓕_{{0}ᶜ}`; `I` finite nonempty with `F = F' = I` makes every `γ` meet, so not proper; `tailFamily n = cylinderEvents (e[0,n))ᶜ` | holds |
| 4 | 4.2 | proof steps on general `S` | `μ(A Δ γ_kC_k) = μ(A Δ C_k) < 2^{−k}`; `limsup` lies in every `𝓕_{Λ_nᶜ}`; Borel–Cantelli | holds |
| 5 | 4.6(a), (b) | `f` tail-measurable; `f = 2·1_{ω(0)=1}` | `(fμ).bind γ_Λ (C) = ∫ γ_Λ(f1_C|·) dμ = (fμ)(C)`; non-tail `f` gives `ω(0) = 1` a.s., not resampled | holds; hypothesis needed |
| 6 | 8.2, 8.3, 8.4 on tori | 1×1 `(1,1,1)`; 1×2; 2×1 `(2,3,5)`; 2×2 unit and `(2,3,5)`; 2×3; 3×2 `(1,2,3)`; 3×3 | tilings 3, 5, 5, 9, 9, 17, 17, 42; sign formula wrong in 0 tilings × 4 twists; `Z` from determinants = brute `Z` (3, 5, 58, 9, 1444, 17, 1640, 42); 1×2 dets `(3,5,−1,1)`; 2×2 unit `(−3,5,5,5)`, `c = (−1,1,1,3)`, probability `1/3`; `(2,3,5)`: dets `(0,544,1044,1300)`, `c = (60,100,150,190)`, probability `25/38` | holds |
| 7 | 7.1 attainable height changes | 2×3, 3×3 | 2×3: `{(0,0),(0,1),(0,2),(0,3),(1,0),(1,1),(2,0)}` = `{3a + 2b ≤ 6}`; 3×3 includes `(2,1)`, `(1,2)`, not `(2,2)` | holds |
| 8 | 3.1–3.3 hexagon, 3.2 ring, 2.9 `R₆'` | unit and `(2,3,5)` weights | hexagon: 2 tilings `T_a`, `T_b`; `det = ±2`, `±60 = 2abc`; `K⁻¹` entries `1/2, 1/2, −1/2, 1/2`; pair determinant `1/2`. Ring = the 12 faces meeting `W(0)`; 2 tilings `T`, `T'`; `det = 0`. Ten-face path: 1 tiling `T ∖ {((−1,−1),3)}`. `R₆'`: matrix `[[1,0,0],[1,0,0],[1,1,1]]`, `det 0`, 0 tilings; boundary heights `0,0,0,0,1,1,1,1` recomputed | holds |
| 9 | 2.8 flip rule and descent | general argument; hexagon | neighbour `v+e_k` with `H+1` would lie in the maximal set with larger `H`; neighbour `v−e_k` with equal `H` would lie in it with smaller `v₁+v₂` (`−1, −1, −2`); flip sends `T_a` to `T_b`; `min` of two heights: increment in `{0,1}` with no congruence condition | holds |
| 10 | 2.2, 2.3 cochain of the ring | faces `B(1,0), W(1,0), B(2,0)` | closure: `1+0 = 1`, `0+1 = 1`, `1+0 = 1`; on `W(0)`: `0 + 1 − 0 = 1`; sum over `∂Q` equals the coboundary at the start face, `±1`, and vanishes for an exact cochain | holds |
| 11 | Conventions: rotation and heights | `M₁, M₂, M₃` | `ρ³ = id`; `ρM₁ = M₂`: `(w₂−w₁)+w₁ = w₂`; `ρM₃ = M₁`: `0 + w₁`; `ρM₂ = M₃`: `−w₁ + w₁ = 0`; slope `(s,t) ↦ (1−s−t, s)` | holds |
| 12 | 6.3 | row tilings; `s = 1/2` | no type-2 edge forces constant columns; `τ_{e₁}M_ε = M_{σε}`; `P(ε₀=ε₁=1)`: `s²` against `(s+s²)/2`, `1/4` against `3/8` | holds |
| 13 | 7.2, 7.3 | 2×2 uniform; `(1/2,0)` | type-1 count `12` of `36`: `1/3`; `C(2m−3, m−j)/C(2m,m)` at `m = 500`: `0.1246, 0.1251, 0.1251, 0.1246 → 1/8` | holds |
| 14 | 9.1 | `w = (1,1,1)`, `(2,3,4)`, `(1,1,3)` | `G(0) = 0.33333`; `G(0,−2) = −0.057667` against `√3/(2π) − 1/3 = −0.057669`; `(2,3,4)`: `w₁G(−e₂), w₂G(e₁), w₃G(0) = 0.16086, 0.25871, 0.58043` = angles/π; row formula at `m = 1,2,3`: `−0.15410, 0.13484, −0.10594` on both sides; inverse identity `1, 0, 0`; `(1,1,3)`: `w₃G(0) = 1.0000` | holds |
| 15 | 9.2 | `θ = π/2, 2π/3`; five angles, `n < 3000` | `W_{π/2}` = odd `n`; `3 ∉ W_{2π/3}`, `4 ∈` (`π/12 = 0.2618 > 0.125`); `n` and `n+1` both bad only for `n ≤ 188` | holds |
| 16 | 9.3 Check | `w = (1,1,1)` | `G(0,−1)² − G(0,−2)G(0) = 0.130331` against `2/9 − √3/(6π) = 0.130334` | holds |
| 17 | 9.6, 9.7(a) | slope `(0.3, 0.45)`; 7 pairs | `|ξ| = 1.39680 = w₂/w₃`, `|1−ξ| = 1.14412 = w₁/w₃`; `K_ξ(v;v) = 0.3000`; vertical values `−0.2500 = −(1−s−t)`, `−0.05970 = s − Im ξ/π`; identity (a) agrees to `10⁻¹⁰` at all 7 pairs; ratios `−0.87403, 1.95106, 1.22085`; determinants `0.075075` and `0.034214` on both sides | holds |
| 18 | 9.7(f) counterexample | `H = 1_{x>0}` below, `1` or `y` above | both are height functions (increments checked along `e₁, e₂, e₃` across row `0 → 1`), both have `X = {(0,y) : y ≤ 0}` | holds |
| 19 | 10.2 Check 3; 10.3 Check 3 | `H = min(0,x,y)`; `A=B=C=1` | `H(e_k) = 0`, `H(−e_k) = −1`; hexagon vertices are the six neighbours of `(1,1)` | holds |
| 20 | 1.3 API | `{W(0)}`, `R₆`, vertex sets | `3 = 0 + 3`, `18 = 12 + 6`; a vertex with all six neighbours in `V` has all six faces in `Faces(V)` | holds |

### Pinned declarations and cross-roadmap citations

Opened at the pins this round: every declaration of the repaired passages (listed in the repair
table), `ZeroOne.lean:229/290`, `Kernel/Basic.lean:111` (`Kernel.id`),
`TauCeti/Probability/Process/Tail/Basic.lean:42/47/64`,
`TauCeti/LinearAlgebra/Matrix/Determinant/ComplementaryMinor.lean:160` (statement read; the
contract paraphrase matches), `TauCeti/MeasureTheory/Group/ErgodicExtreme.lean:75/86/239`,
`TauCeti/MeasureTheory/Measure/Face.lean:40`. The remaining contract names were located by round 5
with file and line; the pins have not moved.

Citations resolved on main: VonNeumannAlgebras V8.BernoulliArbitraryDiscrete (`README.md:2788`),
FactorRigidity §8.3 (`:767`), TensorProductCombinatorics §1.1 (`:465`), RandomMatrices §8.3–8.4
(`:1183`, `:1253`), GraphConnectivityAndFlows §6.7 (`:753`). All are scope citations; none is a
supplier.

### Ownership and overlaps

`roadmaps grep` over main and the open heads for Kasteleyn, lozenge, dimer, Gibbs specification,
Gibbs measure, tail σ-algebra, perfect matching, sine kernel, Bernoulli shift, subshift,
`cylinderEvents`: no roadmap states dimers, lozenge tilings, Kasteleyn matrices or specifications.
ClassicalErgodicTheory (open) has Bowen–Gibbs measures of one map on subshifts of finite type, a
different object, and lists ergodicity of Bernoulli shifts as Tau Ceti's. PointProcesses excludes
determinantal processes and infinite-volume Gibbs processes from its scope. Of the board checkout,
only `packages/ConstructiveFieldTheoryPhi4/design/README.md:19` mentions specifications, to exclude
them. `scratch/overlaps.md`: no other pull request changes this roadmap, no dropped id, no
revision-only id, third closest-roadmap list empty.

Overlap check: read ClassicalErgodicTheory, PointProcesses, MathematicalBilliards, RandomGraphs, Exchangeability, ProbabilisticAndMetricNumberTheory, StochasticCalculus; shared: ergodicity of Bernoulli shifts — owner VonNeumannAlgebras V8.BernoulliArbitraryDiscrete on main, cited, 4.3 a kept variant; sequence tail σ-algebras — owner Tau Ceti (`tailProcess`), cited; nothing else shared.

### Supplier order

Every *Needs:* line and Dependencies paragraph read; no roadmap is a supplier. Dependency check:

```text
candidate: DimerModelsAndLozengeTilings is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2229 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Shape, headline theorems

README shape as required (Summary, Scope and ownership, Conventions, Exact supplier contracts, How
to read the build, ten layers each ending with Examples and Dependencies, Downstream consumers,
Worked examples, References). Layer order: 3.2 needs 2.8; 5 needs 4; 7 needs 5–6; 8 needs 7; 9
needs 4–8. Headline theorems from the Summary: 1.5, 2.5, 2.9, 3.2, 3.3, 4.6, 5.3, 6.3, 7.3, 8.3,
9.5, 9.7, 10.2, each a named target with hypotheses and a locator. There is no `Suggested.lean` at
the design stage, so there is no padding probe and no `#check` comparison. For the package stage:
the README backticks about two dozen names of its own (`TriEdge`, `hexGraph`,
`two_ergodicGibbs_of_slopeEdge`, …); each must be declared in `Suggested.lean` or lose its
backticks.

### Copyright and arrangement

Compared the roadmap's wording with the source at each of the 15 sampled targets and at ten further
passages (Conventions on heights, slopes and kernels; 2.9; 3.2; 8.3; 9.2; 9.7; 10.2). Shared
material is formulas and standard names only; the `ε_{ab}` rule of 8.3 is stated as a parity
condition, not as the source's table. gorin2021 has the largest share. Its contents (Lectures 1–19)
against the layers: Layer 2 ↔ Lecture 1 and Layer 3 ↔ Lecture 2 in the same order, forced by
3.2 *Needs:* 2.8; Layers 4–6 (from Lecture 13 and sheffield2005) precede Layers 7–8 (Lectures 3–4);
Layer 9 draws on Lectures 4, 6 and 13; Lectures 5, 7–12, 14–19 have no layer. No one-to-one run.

Source independence: 25 passages compared with 7 sources, none shared; largest share gorin2021, 47 of 164 source citations; contents compared with gorin2021: independent.

## Not verifiable

- Lean elaboration: not available (this lane does not elaborate; say so in the report). No Lean
  command was run.
- `thurston1990` and `georgii2011`: settled uncertified entries, cited by locator; not requested.
- kenyon1997 lines 392–406: the displayed formulas of Lemmas 7–8 are missing from the extraction;
  the statements were checked through gorin2021 Theorem 4.10, kos2006 Theorem 4.2 and enumeration.
- The publisher pagination of gorin2021 was not checked; the cached pre-publication copy was.
- The READMEs of the two packages in the board index (AnalyticNumberTheory,
  LawrenceVenkateshMethod) live on other pull requests' heads and were not fetched; both are
  number-theoretic by title.

## Source issues

- **Error** in gorin2021 at Lemma 4.7, pre-publication p. 45 (line 1766): the source says that for large n either n or n+2 is a good size; it should be n or n+1, since for the angle π/2 every even n fails; affects the proof.
- **Gap** in gorin2021 at Theorem 4.10, pre-publication p. 46 (lines 1847–1849): the source says torus correlations are inverse-matrix minors for arbitrary weights; it should use complementary minors or assume four nonzero determinants, weights (2,3,5) on the 2 × 2 torus being singular; affects a stated result.
- **Error** in kenyon2009 at Theorem 6 and Section 5.4, preprint pp. 28–29 (lines 836–839, 858–859): the source says every slope of the closed triangle has a unique ergodic Gibbs measure; it should restrict uniqueness to interior slopes, non-corner edge slopes carrying at least two; affects a stated result.
- **Gap** in kenyon2009 at Section 5.4, preprint p. 29 (lines 863–866): the source says torus limits are ergodic because extreme points of the fixed-slope set are ergodic; it should prove ergodicity separately, the equal mixture of the three frozen measures being fibre-extreme and not ergodic; affects the proof.
- **Error** in aggarwal2023 at Section 1.3 after Definition 1.2, preprint p. 10 (lines 465–467): the source says a plane tiling is determined by its type-1 positions unless that set is empty; it should require that no two consecutive rows lack type-1 lozenges; affects nothing.

## For the human reviewers

- **Licence.** `gorin2021` is read from the author's pre-publication copy (`sources.toml`, `licence_class = "author-page"`); it has the largest share of the locators, and its publisher pagination was not compared.
- **Scope.** The proposed DimerModelsAndLozengeTilingsPartII (Sheffield's uniqueness, the variational principle, Aggarwal's theorem) is named in `design/README.md:116` and in no board package or open pull request; whether to commission it is a human decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f21951c274d7a7dab69763a30167de8d4aff1a82", "job": "REV-DESIGN-DimerModelsAndLozengeTilings~6", "model": "fable", "worker": "chris-x80"} -->
