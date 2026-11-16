# PORT-DimerModelsAndLozengeTilings

Port of the accepted package `packages/DimerModelsAndLozengeTilings/` into
`TauCetiRoadmap/DimerModelsAndLozengeTilings/{README.md,Suggested.lean,metadata.toml}`.

## Result

- Branch: `roadmap/dimer-models-and-lozenge-tilings`, one commit on main `51d880d`.
- Head commit: `8ce8e7983a90c79be88b1c18c7c81aaa3edfe1f6`, message
  `DimerModelsAndLozengeTilings: roadmap (README, Suggested.lean, metadata)`.
- Files: `TauCetiRoadmap/DimerModelsAndLozengeTilings/README.md` (2379 lines), `Suggested.lean`
  (595 lines), `metadata.toml` (`topic = "math.PR"`, the package's topic, same one-key shape as the
  folders on main). Nothing outside the folder is touched.
- Build (`lake build TauCetiRoadmap.DimerModelsAndLozengeTilings.Suggested`):
  `Build completed successfully (18248 jobs).` 18 warnings, all `declaration uses 'sorry'` (one per
  theorem); no other warning, no error.
- Gate: `gate DimerModelsAndLozengeTilings: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0
  sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0
  lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0
  round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0
  outside-folder=0 source-material=0 OK`
- Dependency check (the brief's `gate --depcheck … --movable` command), full output:

      depcheck: 235 roadmaps, 2228 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- Citation resolver (`roadmaps resolve` on the ported README): no cross-roadmap citation and no Lean
  name found nowhere. The tool could not check Mathlib and Tau Ceti names on this host, so I checked
  them myself: every backticked identifier of the README (166 identifier-shaped tokens) is declared
  in the pinned Mathlib, the pinned Tau Ceti or `Suggested.lean`, apart from subscript notation
  (`T_a`, `R_ring`, `H_max`, …) and `NeZero`, which is Lean core (`Init/Data/NeZero.lean`). Every
  cited library file exists at the pins and every cited line number was opened (all Mathlib line
  citations of the package, and the new ones below).

## Draft pull request body

This pull request adds the roadmap **Dimer models and lozenge tilings**, a library of
two-dimensional lattice statistical mechanics with the dimer model on the hexagonal lattice
(equivalently, lozenge tilings of the triangular lattice) as its worked case. Starting from
Mathlib's simple graphs and perfect matchings, product spaces and Markov kernels, weak convergence
of probability measures, curve integrals and determinants, and from Tau Ceti's characterisation of
ergodic countable-group actions as extreme invariant measures, its contour integrals and Jacobi's
complementary-minor identity, it builds the triangular lattice and its dual hexagonal graph,
tilings of arbitrary regions as perfect matchings, height functions, a combinatorial simple
connectivity bridged to `IsSimplyConnected`, flips and Thurston's tileability criterion,
Kasteleyn's theorem and Kenyon's determinantal local statistics on finite simply connected regions;
then Gibbs specifications on subshifts with a proper action of a countable group, the dimer
specification of any locally finite periodic graph, the face property and the extreme-point
characterisation of ergodic invariant Gibbs measures; slopes and the classification on the boundary
of the slope triangle (two distinct ergodic Gibbs measures at every non-corner edge slope); torus
tilings, torus limits and the four-determinant Kasteleyn formula on the torus; and, through the
explicit inverse Kasteleyn kernel, an ergodic Gibbs measure of every slope, identified with
Okounkov–Reshetikhin's incomplete beta process and, along a row, with the discrete sine kernel. It
ends with local limits of uniform tilings of growing regions, which it proves Gibbs: the lattice
side of Aggarwal's universality theorem. The point is to give Tau Ceti a reusable DLR Gibbs-measure
layer, which Mathlib and Tau Ceti lack, together with a complete and checkable account of the
exactly solvable lozenge model, so that the variational principle, Sheffield's uniqueness theorem
and Aggarwal's universality theorem (its Part II) and lattice spin systems can be built on it.

## Dependencies that are still pull requests

None. The roadmap consumes Mathlib and Tau Ceti only ("From other roadmaps: None" in the README).
ClassicalErgodicTheory, still a pull request, is named in Scope and ownership only, as the owner of
neighbouring objects (its §§0.3, 1.4, 5.1, 8.4); no target consumes it, and the dependency check
reports no edge problem.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already met the form: 18 headline theorems (every end
theorem of the README's summary), 41 definitions and structures each used by a headline statement,
no sorry'd data, no `example`, no `set_option`, no padding. Changes to the Lean file:

- `incompleteBetaKernel` is restated through Mathlib's `curveIntegral` along `Path.segment` (a
  supplier repair, below), with its 1-form written `ContinuousLinearMap.toSpanSingleton ℂ (f z)`,
  the shape Tau Ceti's contour integrals use.
- The module docstring now opens with the standard note ("The roadmap is `README.md`; this file is
  not the roadmap. It is the roadmap's acceptance test …") and says that every headline theorem of
  the summary is statable and stated, and where README 5.3's general ergodicity criterion lives
  (`gibbsInvariant_extreme_iff_ergodic` for the dimer specification; lozenge instance
  `lozengeGibbs_extreme_iff_ergodic`).

**Mechanical `#check @` pass.** I appended `#check @name` for all 59 declarations to a temporary
copy of the file, built it with the brief's `lake build` command, and compared every elaborated
type with the worker's `signatures.md` by script: 59 compared, 0 differences (the kernel's type
`ℂ → ℤ × ℤ → ℤ × ℤ → ℂ` is unchanged). The file has no `variable` line, so no section binder can be
lost; each Layer 4 and 5 theorem carries `[Countable Γ] [Infinite Γ]`, countability of the index or
vertex type and properness in its own signature, `torus_partitionFunction_eq` carries both `NeZero`
instances and periodicity of `w`, as the README states. The temporary block was removed before the
commit.

## Supplier replacements and duplication removals

- **Supplier repair, Lean and README.** The package defined `incompleteBetaKernel` as two
  `intervalIntegral`s over `[0,1]` of `f(a + t(b − a))(b − a)`, which is Mathlib's
  `∫ᶜ z in Path.segment a b, …` by `curveIntegral_segment`
  (`Mathlib/MeasureTheory/Integral/CurveIntegral/Basic.lean`, line 306, no integrability
  hypothesis). It is now written with `curveIntegral`. In the temporary build I proved the new
  definition equal to the package's, for every `ξ`, `v₁`, `v₂`, by
  `simp only [incompleteBetaKernel, curveIntegral_segment, ContinuousLinearMap.toSpanSingleton_apply, smul_eq_mul, AffineMap.lineMap_apply_module', Complex.real_smul]`
  followed by `ring_nf` under `intervalIntegral.integral_congr`. The mathematics, including the
  junk value for real `ξ`, is unchanged. README Conventions, 9.6, the Mathlib contracts and the
  Layer 9 dependencies cite `curveIntegral`, `Path.segment`, `curveIntegral_segment` and
  `curveIntegral_trans`.
- **New route through existing Tau Ceti theory (9.6).** The package's path-independence API item
  ("any path … gives the same value (Cauchy's theorem …)") named no input. Tau Ceti has, at the pin,
  the homology form of Cauchy's theorem `TauCeti.Contour.homologyCauchyTheorem`
  (`TauCeti/Analysis/Contour/HomologyCauchy.lean`, line 108), `TauCeti.Contour.IsNullHomologous`,
  `TauCeti.Contour.windingNumber` and the bridge
  `TauCeti.Contour.intervalIntegral_deriv_smul_segment_eq_curveIntegral`
  (`TauCeti/Analysis/Contour/Primitive.lean`, line 129). These are the completed ContourIntegration
  roadmap's Layer 3. The item is restated for piecewise `C¹` paths meeting the real axis in one
  point of the prescribed side, and its route uses these declarations. They are added to the Tau
  Ceti contracts and to Scope and ownership.
- **Duplication sweep.** I searched by object over main, the 444 open roadmap pull requests at
  their heads (`roadmaps grep`) and the 213 board package READMEs. The objects searched were
  lozenge, dimer, domino, Kasteleyn, Thurston, honeycomb/hexagonal/triangular lattice, incomplete
  beta, sine kernel, DLR/Gibbs measure/specification, tail σ-algebra, subshift, determinantal,
  perfect matching, Ising/percolation, Gaussian free field/height function, extreme points/ergodic
  decomposition, Bernoulli shift/action and the zero-one law. No other owner exists of any target,
  so nothing is deleted. The roadmap owns the lattice, tilings, heights, Kasteleyn theory, DLR
  specifications on subshifts with proper actions, dimer and lozenge Gibbs measures, slopes, torus
  theory and the kernels: nothing on main, at an open head or on the board plans them. These
  boundary notes were added to Scope and ownership, each saying in one clause how it differs:
  - ClassicalErgodicTheory §8.4, `IsGibbsMeasure T φ μ`: Bowen's Gibbs property of an equilibrium
    state, a different notion.
  - ClassicalErgodicTheory §5.1: closedness and convexity of the invariant probabilities of a
    single continuous map. 4.6(c) is the countable-group form on a subshift.
  - SpecialFunctionsEiLiErfIncompleteGamma Layer 15, the real incomplete Beta function `B_x(a,b)`:
    not the incomplete beta kernel.
  - Mathlib's `DiscreteTiling.Prototile`, `Protoset` and `PlacedTile`
    (`Mathlib/Combinatorics/Tiling/Tile.lean`, new at this pin; it has placed tiles and no
    tilings). 1.4 gains an API item identifying lozenges with placed tiles of the three-lozenge
    protoset under `Multiplicative (ℤ × ℤ)`, and a Check.
  - Tau Ceti's contour integrals (above).
- **Prior art.** Mathlib's `Mathlib/Probability/CondVar.lean` points to the GibbsMeasure project. I
  read its `GibbsMeasure/Specification.lean` at commit
  `fffe01e3a5d783fbe95b629cd34b97d50939b42b` (repository `YaelDillies/gibbs-measure`, Apache 2.0).
  It has `Specification S E` on the full product, with kernels `Kernel[cylinderEvents Λᶜ]` and the
  consistency equation `(γ Λ₁).comap id _ ∘ₖ γ Λ₂ = γ Λ₂`, which is exactly 4.5's. README 4.5 now
  says that its shape follows that project and how it differs: a subshift `X`, and Markov and
  properness as fields. The Gibbs predicate is the conditional-expectation form, equivalent to ours
  by 4.5's first API item. The project is listed in References as `gibbsmeasure`. Lean names of
  that external repository are kept out of backticks so that no gate reads them as this roadmap's
  own.
- **Citation corrected.** GraphConnectivityAndFlows §6.7 → §§6.7 and 6.9. §6.7 supplies the
  perfect-matching predicate of a multigraph; the perfect matchings of regular bipartite
  multigraphs are §6.9.
- **Citations re-resolved.** Each was checked at main or at its open head:
  - VonNeumannAlgebras V8.BernoulliArbitraryDiscrete (README line 2788): finite `S`, at least two
    positive weights, ergodicity proved.
  - FactorRigidity §8.3 (line 767).
  - TensorProductCombinatorics §1.1 (line 465).
  - RandomMatrices §8.3 and §8.4 (lines 1183, 1253).
  - GraphConnectivityAndFlows §§6.7, 6.9 (lines 753, 798).
  - SpecialFunctionsEiLiErfIncompleteGamma Layer 15 (line 1567).
  - Completed ContourIntegration Layer 3 (line 184).
  - ClassicalErgodicTheory, read with `roadmaps show` at its open head: §0.3 item 2 (the Bernoulli
    action of a countable group on `G → α`), §1.4 item 2 (its mixing), §5.1 (invariant
    probabilities of a map) and §8.4 (`IsGibbsMeasure T φ μ`).

## Fixes a mathematician would flag (README read once more in full)

1. Scope, Jacobi's identity: "a square matrix with unit determinant" could be read as `det = 1`.
   The Tau Ceti lemma assumes `IsUnit A.det`, so the text now says "invertible determinant".
2. 9.6, path independence: "any path" said nothing about regularity, although a curve integral
   needs a piecewise `C¹` path, and the text cited no input. Restated, with a route (above).
3. Conventions, incomplete beta kernel: the Lean-facing gloss used `f` and `c` before defining
   them. Both are now defined in place.
4. 9.2(a) holds "for all large `n`", but how large depends on `θ`; nothing in the text showed it.
   New Check: for `θ = 0.1`, both `188` and `189` lie outside `W_θ` (`j = 6` gives distances
   `2.64·10⁻⁴ < 3.88·10⁻⁴` and `2.67·10⁻⁴ < 3.85·10⁻⁴`). The Check also derives why the threshold
   grows as `θ → πℤ`. The last pair of consecutive failures is `n = 188` for `θ = 0.1` and
   `n = 3560` for `θ = 0.03`, and no pair occurs for `θ = 1, 2` among `n < 200000`.
5. 9.6 *Needs:* listed `Complex.log`, which nothing uses. Removed; the curve-integral and contour
   names are listed instead.
6. Exact supplier contracts said nothing about roadmap suppliers. There is now a "From other
   roadmaps: None" subsection, and the Layer 9 Dependencies, which said only "Layers 4–8", now list
   their Mathlib and Tau Ceti inputs.
7. Wording: "Outside this roadmap, and the content of its Part II, …" became "Outside this roadmap,
   and the subject of its Part II (DimerModelsAndLozengeTilingsPartII): …".

No statement of a target changed. No Check was dropped, and two Checks were added: 1.4 (placed
tiles) and 9.2 (threshold).

## Adversarial pass

The values below were computed for this port by scripts written for it, kept in the job's scratch
directory: `adv_exact.py`, exact rational arithmetic transliterating `Suggested.lean`;
`adv_float.py`, quadrature, with the `φ`-integral of `G_w` done by residues; `adv_heights.py`. The
pass covers every Lean theorem and every README target and convention.

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: faces, edges, lozenges | `W(0)`, `B(0)`, `(0,1)`, `(0,3)` | `TriFace.edges` transliterated: `(0,1) ∈ W(0), B(−e₂)`; `(0,3) ∈ W(0), B(0)`; type 1 `W(v) ∪ B(v−e₂)` has vertices `v−e₂, v, v+e₁, v+e₃` | as stated | none |
| Conventions: heights, Gorin's height | `M₁, M₂, M₃`; `h_G` along `e₁`, `−e₃` | `H = x, y, 0`; `h_G` along `e₁`: `1 − 3[(v,1)∈M]` ∈ {+1, −2}; along `−e₃`: `1 − 3[(v−e₃,3)∈M]` | as stated | none |
| Conventions: rotation `ρ(x,y) = (−y,x−y)` | `ρ⁻¹(a,b) = (b−a,−a)`; `M₁→M₂`, `M₃→M₁`, `M₂→M₃` | `H_{M₁}(ρ⁻¹w) + w₁ = w₂`; `0 + w₁ = w₁`; `−w₁ + w₁ = 0`, for all `w ∈ [−3,3]²` | true | none |
| Conventions: restricted Leibniz witness | `A = [[1,2,0],[0,1,3],[4,0,1]]`, rows `(0,2)`, cols `(1,0)` | `det A = 25`; `25A⁻¹ = [[1,−2,6],[12,1,−3],[−4,8,1]]`; `Λ_A = 3`; `det[(A⁻¹)(j_l,i_m)] = 3/25`; `25·3/25 = 3`; Tau Ceti's identity with `σ` the 3-cycle: `A(1,2) = 3 = 25·det[[12,−3],[1,6]]/625` | true | none |
| Conventions: kernels `G_w` | `w = (1,1,1)` | `G(0) = 0.3333325`, `G(0,−2) = −0.0576697` vs `√3/(2π) − 1/3 = −0.0576689` | agree | none |
| Conventions: sine weights, `ξ` | slopes `(1/3,1/3)`, `(0.3,0.45)`, `(0.5,0.25)` | `w(0.3,0.45) = (0.80902, 0.98769, 0.70711)`; `\|ξ\| = 1.396802 = w₂/w₃`; `\|1−ξ\| = 1.144123 = w₁/w₃`; `arg ξ/π, −arg(1−ξ)/π` return `(0.333333,0.333333)`, `(0.3,0.45)`, `(0.5,0.25)` | true | none |
| Conventions: incomplete beta kernel (Lean, curve-integral form) | equality with the package form | proved in a temporary build for all `ξ, v₁, v₂` | equal | Lean restated |
| 1.2 `hexGraph`, 1.4 `IsTiling` | unit hexagon; `{W(0)}`; `{W(0), W(−e₁)}` with `M = {(0,3),(0,2)}` | 2 tilings (`T_a`, `T_b` as listed); 0 tilings; `M` free tiling `True`, tiling `False` | as stated | none |
| 1.4 placed tiles (new item) | `T_a` | placed tiles `3@0, 1@(−1,0), 2@(0,−1)` have faces `{W(0),B(0)}`, `{W(−1,0),B(−1,−1)}`, `{W(−1,−1),B(0,−1)}`, a partition of `R₆`; stabilizer of `{W(0),B(0)}` in `ℤ²` is `{0}` | true | new item, new Check |
| 1.5 `tilingSubgraph_bijOn` | `R = ∅`; `{W(0)}`; hexagon | `{M \| IsTiling ∅ M} = {∅}` ↔ the one perfect matching of the empty graph; `0 ↔ 0`; `2 ↔ 2` (6-cycle) | true | none |
| 1.6 row tilings | `ε = 1_{[0,∞)}` on `[−4,4]²`; column reading with `ε = 1_{{0}}` | every face has exactly one edge: `True`; `B(0,0)` has `0` edges | as stated | none |
| 2.1, 2.3 simple connectivity, holes | `R_ring`, `Q = {W(0)}` | `R_ring`: 2 tilings, both with cochain sum `−1` round `W(0)` | not simply connected, as stated | none |
| 2.5 `tilingOfHeight_bijOn` | `⌊(x+y)/2⌋`; `x + y`; `min(0,x,y)` on `[−4,4]²` | height fn: `True`, `False`, `True`; `⌊(x+y)/2⌋` has `e₃`-increment `1` everywhere (no type 3) | true | none |
| 2.6, 2.7 heights on regions, boundary heights | hexagon, normalised `H(1,0) = 0` | `T_a`: `H(0) = 0`; `T_b`: `H(0) = −1`; both `0` at `(1,0),(0,1),(1,1)` and `−1` at `(−1,0),(0,−1),(−1,−1)` | as stated | none |
| 2.8 `flip_connected`, `IsFlip` | hexagon, `v = 0`, Lean `IsFlip` transliterated | `{(0,3),((−1,0),1),((0,−1),2)} ⊆ T_a` and the replacement gives `T_b`: `True` | true | none |
| 2.9 `thurston_tileable_iff` | `{W(0)}`; `R₆'` | `{W(0)}`: boundary increments force `h(e₃)−h(0) = 0` and `= 1`, no `h`, no tiling; `R₆'`: `ρ((2,1),(1,1)) = 0`, `ρ((1,1),(2,1)) = 1`, `h(1,1)−h(2,1) = 1 > 0`, 0 tilings | both sides false | none |
| 3.1, 3.2 `partitionFunction_eq_abs_det` | hexagon unit and `(a,b,c) = (2,3,7)`; `R₆'`; `R_ring`; wedge `{W(0),B(1,1)}`; `{W(0)}` | `det = 2`, `84 = 2abc`; `R₆'`: `K = [[1,0,0],[1,0,0],[1,1,1]]`, `det 0`, `Z = 0`; `R_ring`: `det 0`, `Z = 2` (excluded, not simply connected); wedge: `K = [[0]]`, `Z = 0`; `{W(0)}`: `Z = 0` (finsum over no tiling) | true; simple connectivity needed | none |
| 3.3 `lozenge_correlation_eq_det` | hexagon one pair, two pairs, repeated black face; type weights; `n = 0` | `K⁻¹` rows `(½,½,−½),(−½,½,½),(½,−½,½)`; `P = ½`, `½`, `0`; weights `(2,3,7)`: brute `½` = formula `½`; `n = 0`: `Z/Z = 1 = 1·det[] ` | true | none |
| 4.1, 4.2 tail σ-algebra, invariant events | trivial action of `ℤ` on `{pt}` | `{g : pt ∈ F, g·pt ∈ F'} = ℤ`, not finite; invariant event `ω(pt) = 1` has mass `½` under `(δ₀+δ₁)/2`; `I` finite: `Λ = I` makes `𝓣` trivial | properness needed | none |
| 4.3 Bernoulli | `(Bern(⅓)^⊗ℤ + Bern(⅔)^⊗ℤ)/2`; `ν = δ_a` | event "density ⅓" has mass `½`, not ergodic; product of `δ_a` is a point mass, ergodic | as stated | none |
| 4.5 `Specification`, consistency direction | `ν = Bern(½)`, `ν' = Bern(⅓)`, `Λ = {0} ⊆ Δ = {0,1}` | Mathlib `(η ∘ₖ κ) a = (κ a).bind η`; `γ_{0} ∘ₖ γ_{0,1}` gives `{ω(0)=1}` mass `½`, `γ_{0,1}` gives `⅓`: inconsistent; reversed composite gives `⅓` | the field excludes the bad family | none |
| 4.6 `gibbsInvariant_isExtreme`, `gibbsInvariant_extreme_iff_ergodic` | `X₀ = {0̄,1̄}`, identity specification; independent specification on `ℤ` with `S = ℤ`; trivial `ℤ`-action on a point | segment `[δ_{0̄}, δ_{1̄}]`, extreme points ergodic, midpoint gives `{1̄}` mass `½`; one-point face `{ν^⊗ℤ}`; trivial action: Gibbs set `{½δ₀+½δ₁}` is the midpoint of non-Gibbs `δ₀`, `δ₁`, so not a face, and `hproper` fails | true; hypotheses needed | none |
| 5.1 dimer configurations | `ℤ`, `Γ = 2ℤ` | exactly 2 configurations (even, odd edges) | as stated | none |
| 5.2 `IsDimerGibbs`, weight direction | `C₆`, `w(e₀) = 2`, `ω = M_a`, `ω' = M_b`, `F = E` | `1·μ{M_a} = 2·μ{M_b}`, `μ{M_a} = ⅔ = w(M_a)/(w(M_a)+w(M_b))`; reversed reading gives `⅓` | true | none |
| 5.3 `dimerGibbsInvariant_isExtreme` | `C₆`, trivial group | Gibbs set `{(δ_{M_a}+δ_{M_b})/2}`, midpoint of non-Gibbs invariant `δ`s: fails, excluded by `[Infinite Γ]` | hypothesis needed | none |
| 5.4 `lozengeGibbsInvariant_isExtreme`, `lozengeGibbs_extreme_iff_ergodic` | `ν₃ = (δ_{M₁}+δ_{M₂}+δ_{M₃})/3`; `δ_{M₁}`; `δ_∅`, `2δ_{M₃}` | `ν₃` invariant Gibbs, event `M = M₁` mass `⅓`: neither extreme nor ergodic; `δ_{M₁}` both; `δ_∅` fails only concentration, `2δ_{M₃}` only mass one | true | none |
| 6.1 `slope` | `δ_{M₁}`, `ν₃`, `ρ_*δ_{M₁}` | `(1,0)`; `(⅓,⅓)`; `(1−1−0, 1) = (0,1)` | as stated | none |
| 6.2 corners | `δ_{M_ε}`, `ε = 1_{[0,∞)}` | `μ{(0,1) ∈ M} = 1`, not `δ_{M₁}`, not invariant | invariance needed | none |
| 6.3 `slopeEdge_ergodicGibbs_equiv` | intertwining; `s = 0` | `rowCode(e₁ +ᵥ ω)(x) = ω((x−1,0),1) = (σ rowCode ω)(x)`; `δ_{M₃} ↦ δ_{0̄}`; a finite change of a tiling of `Φ₂` is trivial, so both cylinders of a nontrivial swap miss `Φ₂` | true | none |
| 6.3 `two_ergodicGibbs_of_slopeEdge` | `β_s` vs `Bern(s)` | `P(ε₀ = ε₁ = 1)`: `0.375` vs `0.25` at `s = ½`; `0.195` vs `0.09` at `s = 0.3` | distinct | none |
| 6.4 fibres | `ν₃` | extreme in the fibre over `(⅓,⅓)`, not ergodic (mass `⅓` event) | as stated | none |
| 7.1, 7.2 torus tilings, height changes | `1×1, 1×2, 2×1, 2×2, 2×3, 3×2, 3×3, 1×3, 3×1, 4×2` | `3, 5, 5, 9, 17, 17, 42, 9, 9, 33` tilings; `2×2` by height change `(0,0):1, (0,1):2, (0,2):1, (1,0):2, (1,1):2, (2,0):1`; floor tiling `(1,1)` on `2×2` has `e₃`-increment `1` everywhere | as stated | none |
| 7.3 `torusLimit_mem_gibbsInvariant_slope` | `(0,0)`; `(½,0)` pattern `k = 2, j = 1`, `m = 50`; `n = 0` | `δ_{M₃}` for all `n`; `C(98,49)/C(100,50) = 2500/9900 = 0.2525 → ¼`; `torusMeasure 0 s t = 0` (infinite set), met at most once by strictly increasing `φ` | true | none |
| 8.1 `twistedKasteleyn` | unit weights, all four `(a,b)` | `1×1`: `3, 1, 1, −1`; `1×2`: `3, 5, −1, 1`; `2×1`: `3, −1, 5, 1`; `2×2`: `−3, 5, 5, 5`; `3×3`: `0, 28, 28, −28` (order `00, 01, 10, 11`) | convention pinned by `1×2` vs `2×1` | none |
| 8.2 sign formula | `2×2` floor tiling `(1,1)`, `a = b = 0` | exponent `1 + 3 + 3 = 7`, sign `−1`; sum over the 9 tilings `1 − 2 − 2 + 1 + 1 − 2 = −3 = det K₀₀` | true | none |
| 8.3 `torus_partitionFunction_eq` | the 10 sizes above, unit weights and 5 random signed integer periodic weights each | unit: right side `3, 5, 5, 9, 17, 17, 42, 9, 9, 33` equals the count; signed: equal in all 50 trials | true for real weights | none |
| 8.4 torus correlations | `2×2`, type-3 lozenge at `W(0)`, unit and `(2,3,5)` | unit `c = (−1, 1, 1, 3)`, probability `6/18 = ⅓`; `(2,3,5)`: `Z = 1444`, `det = (0, 544, 1044, 1300)`, `c = (60, 100, 150, 190)`, formula `25/38` = brute `25/38` | true | none |
| 8.5 Fourier | `2×2`, unit, `a = 1, b = 0` | `(2+i)(i)(2−i)(−i) = 5 = det K₁₀` | true | none |
| 9.1 angles, non-liquid | sine weights at `(0.3,0.45)`, `(0.5,0.25)`; `w = (1,1,3)` | `w₁G(−e₂), w₂G(e₁), w₃G(0) = 0.30000, 0.45000, 0.25000` and `0.5, 0.25, 0.25`; `w₃G(0) = 1.000000` | as stated | none |
| 9.2 good sizes | `θ = π/2`, `2π/3`, `0.1`, `0.03`, `1`, `2` | no even `n ∈ W_{π/2}`, every odd `n ≥ 3` in it; `3 ∉ W_{2π/3}`, `4 ∈`; last failing pairs `188` (`θ = 0.1`), `3560` (`θ = 0.03`), none for `θ = 1, 2` below `200000` | true, θ-dependent threshold | new Check |
| 9.3 determinantal measure | uniform, type-1 at `(0,0)` and `(0,1)` | `1/9 − K₁₂K₂₁ = 0.1303341 = 2/9 − √3/(6π)` | agree | none |
| 9.5 `exists_ergodicGibbs_of_slope` | `(½,¼)`; `(½,0)` | `w = (1, 0.7071, 0.7071)`, strict triangle `True`; sine formula `(1,0,1)`, not positive, so the edge route of 6.3 is needed | true | none |
| 9.6 kernel values | diagonal at three slopes; vertical neighbours at `(⅓,⅓)` and `(0.3,0.45)`; row at `s = ½` | `K(v;v) = 0.333333, 0.300000, 0.500000`; `K((0,0);(0,1)) = −0.333333`, `−0.250000 = −(1−s−t)`; `K((0,1);(0,0)) = 0.0576689`, `−0.0597019 = s − Im ξ/π`; row `m = 1, 2, 3, −1`: `0.318310, 0, −0.106103, 0.318310` = `\|ξ\|^m sin(πsm)/(πm)` | as stated | path item restated |
| 9.7(a) kernel identity, `incompleteBetaProcess_exists_unique` | 25 pairs from `{(0,0),(0,1),(1,2),(−1,1),(2,0)}` at `(0.3,0.45)` | max `\|w₁G(vᵢ−vⱼ−e₂) − (−1)^{…}\|ξ\|^{xⱼ−xᵢ}\|1−ξ\|^{yᵢ−yⱼ}K_ξ(vⱼ;vᵢ)\| = 5.2·10⁻¹¹`; slope returned exactly | agree | none |
| 9.7(e) sine kernel | row pair at `s = ½` | `¼ − 1/π² = 0.148679` | as stated | none |
| 10.1 `LocalConvergence` | translated hexagons | without exhaustion the limit `(δ_{T_a}+δ_{T_b})/2` is not concentrated on plane tilings; excluded by `hexh` | as stated | none |
| 10.2 `localLimit_isLozengeGibbs` | `min(0,x,y)` | height function: `True`; its point masses converge to a non-Gibbs `δ`: uniformity used; `E = ∅` gives `ν univ = lim 1 = 1` | true | none |

Context: no statement depends on a `variable` block. Generality: README and Lean agree, as the
`#check` pass above shows; no README sentence is narrower or wider than its Lean statement.
Unused hypotheses: `0 ≤ s ≤ 1` in `slopeEdge_ergodicGibbs_equiv` is not needed for truth (both sets
are empty outside it). This is a P3 note only, carried from the accepted review.

## Ownership against open work

Checked through the roadmaps tool against main and all 444 open roadmap pull requests at their
heads, and against the board packages. ClassicalErgodicTheory is not among the 229 sibling
checkouts the brief lists, so I read it with `roadmaps show`. No declaration of `Suggested.lean`
has the fully qualified name of a declaration in a roadmap I could read. The overlap tool reports
nothing for this roadmap: no open pull request changes it, it cites no dropped id, and main has no
second copy. Its closest roadmaps (ClassicalErgodicTheory, PointProcesses, RandomGraphs,
Exchangeability, ProbabilisticAndMetricNumberTheory, MathematicalBilliards) were read for scope;
PointProcesses lists infinite-volume Gibbs processes and determinantal processes as outside its
scope. No object has two owners.

## Unresolved, for the worker and the humans

- **Scope, carried from the accepted review.** Interior uniqueness, the variational principle and
  Aggarwal's theorem are assigned to `DimerModelsAndLozengeTilingsPartII`, which exists nowhere: not
  on main, not as a pull request, not on the board. The README names it as the Part II and does not
  cite it as a supplier.
- **Licence, carried from the accepted review.** gorin2021 was read as the author's pre-publication
  copy of a CUP book. The `3 × 3` hexagon Kasteleyn example of 3.1 coincides with gorin2021
  lines 722–744, which the README cites.
- **Coordination.** The README cites the GibbsMeasure project as prior art for 4.5. Whether to
  coordinate with its authors, as the README's "Coordinate first" rule suggests, is a human
  decision.
- **Sources not re-verified.** thurston1990 and georgii2011 remain uncertified (cited by locator
  only). The displayed formulas of kenyon1997 Theorem 6 and Lemmas 7–8 were lost in extraction;
  3.3, 8.3 and 8.4 rest on the enumerations above.
- **Open neighbours.** If ClassicalErgodicTheory renumbers §§0.3, 1.4, 5.1 or 8.4 before it merges,
  the four scope citations follow it. They are boundary notes, not dependencies.
- No suspicious instruction was found in any text read (package, reports, other roadmaps, fetched
  pages).


Pull request: #2422 (roadmap/dimer-models-and-lozenge-tilings at 8ce8e79)
