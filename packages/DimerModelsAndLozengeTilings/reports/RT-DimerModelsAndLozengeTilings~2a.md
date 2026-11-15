<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16766#issuecomment-6903289419 -->
Red team round 2 pass a (claude) of 2ff33d4

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 5.3's `*Needs:*` line and the Layer 5 Dependencies disagree with its route

   Location: `packages/DimerModelsAndLozengeTilings/README.md:1455-1459`, "the ergodicity
   equivalences follow from the face property and Tau Ceti's `ErgodicSMul.iff_mem_extremePoints`. …
   *Needs:* 4.6, 5.2; … Tau Ceti `TauCeti.MeasureTheory.isExtreme_setOf_measure_eq_zero`,
   `TauCeti.MeasureTheory.ergodicSMul_iff_forall_smul_invariant`"; and `:1540-1543`.

   Claim: the `*Needs:*` line and the layer's Dependencies paragraph list what the route of 5.3 uses.

   Witness: the route names `ErgodicSMul.iff_mem_extremePoints`, absent from the `*Needs:*` line; the
   line names `ergodicSMul_iff_forall_smul_invariant`, absent from the route and from `:1540-1543`,
   which gives `iff_mem_extremePoints` to 5.4 only.

   Repair (both lemmas exist at the pin: `TauCeti/MeasureTheory/Group/ErgodicExtreme.lean:239`,
   `TauCeti/MeasureTheory/Group/CountableAction.lean:68`):

   - In 5.3 replace "the ergodicity equivalences follow from the face property and Tau Ceti's
     `ErgodicSMul.iff_mem_extremePoints`." by "the ergodicity equivalences follow from the face
     property, Tau Ceti's `ErgodicSMul.iff_mem_extremePoints` (extreme in `𝔓_inv` iff ergodic) and
     `TauCeti.MeasureTheory.ergodicSMul_iff_forall_smul_invariant` (ergodic iff every exactly
     invariant event has measure `0` or `1`)."
   - In the `*Needs:*` line of 5.3 add `ErgodicSMul.iff_mem_extremePoints` after
     `TauCeti.MeasureTheory.isExtreme_setOf_measure_eq_zero`.
   - Replace the Layer 5 Dependencies paragraph by: "Layer 4; Mathlib `SimpleGraph.Iso.mapEdgeSet`
     and Tau Ceti `TauCeti.MeasureTheory.isExtreme_setOf_measure_eq_zero`,
     `ErgodicSMul.iff_mem_extremePoints` and
     `TauCeti.MeasureTheory.ergodicSMul_iff_forall_smul_invariant` (5.3); for 5.4 also 1.2, 1.5 and
     2.10, and Mathlib `VAddInvariantMeasure`, `ErgodicVAdd`, `IsExtreme`."

   Tested on the instance of 5.3's first Check (`ℤ`, `Γ = 2ℤ`): `δ_even` is extreme in the segment
   (first lemma gives ergodic) and the invariant event "the edge `{0,1}` is present" has measure `1`
   (second lemma); the midpoint fails both. No statement changes.

Round 2. The six findings of round 1 (four after merging the two overlapping pairs) are repaired
at this head and the repairs introduce no error. The full pass was run again: every line of
`packages/DimerModelsAndLozengeTilings/README.md` and `Suggested.lean` was read, every statement was
instantiated, and the statements of Layers 2, 3 and 8 were brute-forced with scripts written for
this pass. One new finding, P3.

## Round 1 findings at this head

| Finding | Status | Repaired passage (witness) |
|---|---|---|
| 1a/F01 and 1b/F01 (P2), 5.3 statable and absent | repaired | `Suggested.lean:372-380`: "theorem dimerGibbsInvariant_isExtreme {V Γ : Type*} [Countable V] [Group Γ] [Countable Γ] [Infinite Γ] (G : SimpleGraph V) [G.LocallyFinite] (τ : Γ →* (G ≃g G))". The "Not stated separately" paragraph is gone from the module docstring (`Suggested.lean:30-32`); `README.md:1448-1451` names the theorem. |
| 1a/F02 and 1b/F02 (P3), equivariance unused | repaired | `README.md:1293`: "(b) For every specification `γ`, equivariant or not, `𝒢_inv(γ)` is a face of `𝔓_inv(X)`". `Suggested.lean:322-328` and `:334-340` have no `hγ` and no `[DecidableEq I]`; `IsEquivariant` occurs in neither file. |
| 1a/F03 (P3), `w(s,t)` defined inside 9.5 | repaired | `README.md:258`: "The sine weights of `(s,t) ∈ 𝒯` are the type weights `w(s,t) = (sin πs, sin πt, sin π(1−s−t))`"; 9.5 (`:2005`), 9.6 (`:2030`) and 9.7 (`:2047`) cite the Conventions. |
| 1b/F03 (P3), free tilings and Aggarwal | repaired | `README.md:163-167`: "The lozenges of a free tiling may overlap in a face outside `R` (1.4, Checks). For a region `Faces(V)` of 1.3 they cannot"; the Check at `:618-622`; 2.6 scoped at `:813`. |

New text of the repairs, recomputed here:

- `IsDimerGibbs`, direction of the weights: on `C₆` with `w(e₀) = 2`, `ω = M_a`, `ω' = M_b`,
  `F = E` all edges, the identity reads `1·μ{M_a} = 2·μ{M_b}`, so `μ{M_a} = 2/3`, the Boltzmann
  value. Correct.
- `IsDimerGibbs`, the window `E`: for `η` in `[ω]_E ∩ 𝔛(G)`, replacing `η` by `ω'` on `F` gives a
  dimer configuration, because every edge at an endpoint of `F` lies in `E`, where the result
  equals `ω'`. So the cylinder form is the DLR property.
- `dimerGibbsInvariant_isExtreme`: `V = ∅` gives `{δ} ⊆ {δ}`; a graph with vertices and no edge
  gives the Gibbs set `∅`; `ℤ` with `Γ = 2ℤ` gives the segment `[δ_even, δ_odd]` inside the
  invariant measures; `C₆` with the trivial group is excluded by `[Infinite Γ]` (the midpoint
  `(δ_a + δ_b)/2` refutes the statement there). Non-invariant `w`: a tail-measurable density is
  unchanged by the swap on `F`, so the argument does not use invariance of `w`. True.
- `(g • ω) e = ω (τ(g⁻¹) e)` is a left action: `Mathlib/Algebra/Order/Group/End.lean:73` defines
  `f₁ * f₂ := f₂.trans f₁`.
- Sine weights: at `(0.3, 0.45)`, `(sin 54°, sin 81°, sin 45°) = (0.8090, 0.9877, 0.7071)`,
  `w₂/w₃ = 1.3968 = |ξ|`, `w₁/w₃ = 1.1441 = |1−ξ|`; the side opposite the angle `πs` at `0` is
  `|1−ξ|`. Correct.
- 1.4, new Check: `W(0)` contains only `(0,3)` and `W(−e₁)` only `(0,2)` of `M`; the heights are
  `H(e₁) = H(e₃) = H(−e₁) = 0`, `H(e₂) = 1`, consistent along `((−1,0),3)` (increment `1`).
  `B(0) = {0, e₂, e₃} ⊆ V(R)`, so `R ≠ Faces(V)` for every `V`. Correct.
- 4.6, two new Checks: `½ fμ + ½ (2−f)μ = μ` and `fμ{ω(0)=1} = 1 ≠ 1/2 = fμ{ω(1)=1}`; the
  non-equivariant independent kernels have a single Gibbs measure, not invariant. Correct.

## The pass: statements, instances, values

Context of `Suggested.lean`: no `variable` or `include` line; every binder is in the declaration's
own signature. `open MeasureTheory ProbabilityTheory Filter Topology Complex`,
`open scoped ENNReal`, `noncomputable section`, one namespace; instances
`AddAction (ℤ × ℤ) TriEdge`, `AddAction (ℤ × ℤ) (TriEdge → Bool)` (`arrowAddAction`),
`CoeSort` and `MulAction Γ X` of a `Subshift`. The elaborated types in the worker's
`signatures.md` (59 declarations) were compared one by one with the README statements: no binder
lost, same generality. No Lean was run and no file of the package other than this report was
written.

| Statement (section) | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| `TriFace.edges`, `hexGraph`, lozenge types (L1, Conventions) | `W(0)`, `B(0)`; Aggarwal's type-1 and type-2 vertex lists | `W(0) ∩ B(0) = {(0,3)}`; type 1 with `v = (x,y+1)`: `{(x,y),(x,y+1),(x+1,y+1),(x+1,y+2)}`, type 2 with `v = (x+1,y)`: `{(x,y),(x+1,y),(x+1,y+1),(x+2,y+1)}`, both equal to aggarwal2023 lines 348 and 353 | sound |
| `tilingSubgraph_bijOn` (1.5) | `R = ∅`, `{W(0)}`, `R₆`, `univ` | 1 ↔ 1; 0 ↔ 0; 2 ↔ 2; surjectivity: an edge of `M` in `f` is the shared edge of a matched pair containing `f` | true |
| `IsSimplyConnectedRegion` (2.1) | `R_ring` cochain; wedge; `{W(0)}` | on `B(1,0)`: `1 + 0 = 1`; on `W(1,0)`: `0 + 1 = 1`; on `B(2,0)`: `1 + 0 = 1`; round `W(0)`: `0 + 1 − 0 = 1` | sound |
| `tilingOfHeight_bijOn` (2.5), rotation law | `M₁, M₂, M₃`; `ρ⁻¹w = (w₂−w₁, −w₁)` | `H_{ρM₁} = (w₂−w₁)+w₁ = w₂`; `H_{ρM₂} = −w₁+w₁ = 0`; `H_{ρM₃} = w₁` | true |
| `flip_connected`, `IsFlip` (2.8) | six faces of both triples; the tie-break of 2.8; 590 tileable simply connected regions (script) | both triples cover `W(v), B(v), W(v−e₁), B(v−e₂), W(v−e₃), B(v−e₃)`; at the chosen `v`, `H(v+e_k) = H(v)` (else `H(v)` not maximal) and `H(v−e_k) = H(v)−1` (else `v₁+v₂` not minimal); flip graph connected in all 590, no flip leaves the tilings | true |
| `thurston_tileable_iff` (2.9) | 3079 simply connected regions of 1–13 faces, 1141 of them pinched (script, difference constraints by Floyd–Warshall); `R₆'` | criterion equals tileability in all 3079; `R₆'`: `h(1,1) − h(2,1) = 1 > 0`; one non-simply-connected region where the two sides differ (hypothesis needed) | true |
| `partitionFunction_eq_abs_det` (3.2) | the same regions, random integer weights in `[1,9]`, exact arithmetic; hexagon | `|det| = Z` in every balanced simply connected region; hexagon `[[c,0,a],[b,a,0],[0,c,b]]`, `det = 2abc` | true |
| `lozenge_correlation_eq_det` (3.3) | 2360 random families of 0–3 pairs (adjacent and non-adjacent, repeated faces) on tileable regions; hexagon | both sides equal as exact rationals in all 2360; hexagon `K⁻¹ = ½[[1,1,−1],[−1,1,1],[1,−1,1]]`, `det[[½,½],[−½,½]] = ½` | true |
| `Specification`, `IsGibbs` (4.5) | order of `∘ₖ`; `Kernel.IsProper` at the pin | `γ_{0} ∘ₖ γ_{0,1}` gives `1/2` against `1/3`; the pin's `IsProper` uses `𝓑 ⊓ 𝓧`, equal to `𝓑` here since `exterior ≤` trace | sound |
| `gibbsInvariant_isExtreme`, `gibbsInvariant_extreme_iff_ergodic` (4.6) | `I = ∅`; `I` finite nonempty; `X = ∅`; `X₀`; route of (a) | one-point space, `{δ} ⊆ {δ}`; properness fails (all `γ` meet `F = F' = I`), vacuous; `∅ ⊆ ∅`; segment, endpoints ergodic; `(fμ)γ_Λ(A) = ∫ γ_Λ(f 1_A) dμ = μ(f 1_A)` for exterior-measurable `f` | true |
| `IsDimerGibbs`, `dimerGibbsInvariant_isExtreme` (5.2, 5.3) | as listed under "Round 1 findings" | `2/3`; `{δ}`; `∅`; segment | true |
| `IsLozengeGibbs`, lozenge face and ergodicity theorems (5.4) | `δ_∅`; `2δ_{M₃}`; `ν₃`; edges of `hexGraph` at a vertex | excluded by the null clause; by mass; member, event `M = M₁` of mass `1/3`; the edges at the two faces of `e` are the edges of those faces | true |
| `slopeEdge_ergodicGibbs_equiv` (6.3) | `s = 0, 1`; a tiling `ω ∉ Φ₂` whose window `E` looks type-2-free; shift direction | `{δ_{M₃}} ↔ {δ_0̄}`; if `[ω]_E` meets `Φ₂` then the swap of a `Φ₂` tiling is itself, so `ω' = ω`, else both cylinders are null; `rowCode((1,0) +ᵥ ω) x = ω((x−1,0),1)` | true |
| `two_ergodicGibbs_of_slopeEdge` (6.3) | `Bern(s)`, `β_s`; `ρ` on slopes | `s²` against `(s+s²)/2`; `(s,0) ↦ (1−s,s) ↦ (0,1−s)` | true |
| `torusMeasure`, `torusLimit_mem_gibbsInvariant_slope` (7.2, 7.3) | `n = 0`; emptiness; the swap on a torus | `uniformOn` of an infinite set is `0`, met at most once by `φ`; `⌊ns⌋ + ⌊nt⌋ ≤ n`, floor tiling periodic; the swap is made on all translates of `F`, where a periodic `η` equals the translate of `ω` | true |
| `twistedKasteleyn`, `torus_partitionFunction_eq` (8.1, 8.3) | 15 tori from `1×1` to `5×1`, `3×3`, `4×2`, unit and random integer weights in `[−5,7]` (script, the Lean matrix entry by entry) | equal in all 45 runs; tiling counts `3, 5, 9, 9, 17, 17, 42, 33, 33`; sign sum `(−1)^{h₁h₂}(1 + (−1)^{h₁} + (−1)^{h₂} − (−1)^{h₁+h₂}) = 2` in all four parity classes | true |
| 8.5 | `2×2`, `1×2` | `3·1·1·(−1) = −3`; `(2+i)(2−i)(i)(−i) = 5`; `1×2`: `3, −1, 5, 1` and `(3+5+1+1)/2 = 5` | true |
| 9.1, row formula and angles | residue in `u = e^{−iφ}` | `w₁G(m,−1) = (2π)⁻¹ ∫_{π−θ₁}^{π+θ₁} e^{imθ} dθ = (−1)^m sin(mθ₁)/(πm)`; `w₂G(e₁) = θ₂/π` by the same residue in `e^{iθ}` | true |
| 9.2(a) | both `n`, `n+1` bad | `|α − (j'−j)| ≤ 2n^{−1/2}/π` with `α = θ/π ∉ ℤ`, impossible for large `n` | true |
| `incompleteBetaKernel` (9.6) | diagonal; vertical pair both orders; row | `arg ξ/π`; `−(1−s) + t = −(1−s−t)` (arguments of `z` and `1−z` change by `−2π(1−s)` and `−2πt`); `s − Im ξ/π`; `(ξ^m − ξ̄^m)/(2πim) = |ξ|^m sin(πsm)/(πm)` | sound |
| `incompleteBetaProcess_exists_unique` (9.7) | uniform `ξ = e^{πi/3}`; limits `t → 0` and `s+t → 1` of the vertical pair `s² + (1−s−t)(s − Im ξ/π)`; uniqueness | `2/9 − √3/(6π) ≈ 0.1303` from `K_ξ` and from `G`; `s` (column-constant tilings) and `s² − sin²(πs)/π²`; the increment between rows `y`, `y+1` is forced unless both rows are empty | true |
| `exists_ergodicGibbs_of_slope` (9.5) | corners, edges, interior | 6.2; 6.3; sine weights liquid, slope `(θ₁/π, θ₂/π) = (s,t)` | true |
| `LocalConvergence`, `localLimit_isLozengeGibbs` (10.1, 10.2) | empty cylinder; the swap in `R_N`; `M_c` | mass `1`; the swapped edges have both faces in `R_N − v_N` for large `N`; `H = min(0,x,y)` has `H(e_k) = 0 = H(−e_k)+1` | true |
| 2.7, 2.3, 2.10, 1.3 (boundary) | route of 2.7; `Faces(V)` boundary | a locally constant function on `∂R` extends to a closed plane cochain, whose primitive is constant on the edge-connected complement; a face outside `Faces(V)` has at most one edge in `E(R)` | true |

Dependency check (the brief's command, unchanged), full output:
`depcheck: 237 roadmaps, 2240 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.

Ownership against open work: `roadmaps grep` over the open heads and main for Kasteleyn, lozenge,
dimer, DLR, Gibbs specification and Gibbs measure, tail σ-algebra, determinantal process, height
function, Thurston and discrete sine finds no second owner (Kasteleyn only as Fortuin–Kasteleyn in
TemperleyLiebOperatorAlgebras; tail σ-algebras of `ℕ`-indexed processes in Exchangeability and
ProbabilisticAndMetricNumberTheory; Gibbs measures of potentials in ClassicalErgodicTheory §8.6).
The overlap list names no shared roadmap, second copy or dropped id.

## Verified sound

- Declarations read: 59 named declarations and 4 instances of `Suggested.lean` (18 theorems,
  36 definitions, 1 abbreviation, 4 structures), each compared with its elaborated type. No
  `lemma`, `set_option`, `#eval`, `True` placeholder, sorry'd data or second `Mathlib` import;
  `TauCeti.MeasureTheory.Group.ErgodicExtreme` exists at the pin; every definition is used by a
  stated theorem.
- Headline theorems of the README (1.5, 2.5, 2.8, 2.9, 3.2, 3.3, 4.6, 5.3, 5.4, 6.3, 7.3, 8.3,
  9.5, 9.7, 10.2): all stated; none is named as not statable and none needs to be.
- Padding probe: no declaration follows by one tactic or one library lemma.
  `gibbsInvariant_extreme_iff_ergodic` and `lozengeGibbs_extreme_iff_ergodic` need the face
  theorem, the measurable action on a subshift (not at the pins) and
  `ErgodicSMul.iff_mem_extremePoints`; kept.
- Targets read: 51 numbered sections and the Conventions, every line. Every `*Needs:*` line was
  set against its route; one imprecision (S01).
- Checks: 167 bullets in 51 blocks, at least 3 per target; the following recomputed by hand or by
  script (about 90 across Layers 1–3 and 5–8, the new Checks of 1.4, 4.6, 5.2 and 5.3, and the kernel Checks
  of 9.1, 9.6, 9.7 that have closed forms). None false.
- Library declarations: 38 opened at the pins with the file the README gives (30 with their
  line numbers, all correct), including the three added in round 1 (`RelIso` group instance,
  `SimpleGraph.Iso.mapEdgeSet`, `isExtreme_setOf_measure_eq_zero`); all present as described.
  Tau Ceti's `ergodicSMul_infinitePi_const` (finitary permutations of `ℕ`, not a proper action)
  is a different statement from 4.3.
- Sibling citations checked: 6 of 6 (VonNeumannAlgebras V8.BernoulliArbitraryDiscrete,
  FactorRigidity §8.3, ClassicalErgodicTheory §0.3 item 2 and §1.4 item 2 at its open head,
  TensorProductCombinatorics §1.1, RandomMatrices §8.3–8.4, GraphConnectivityAndFlows §6.7); all
  resolve and none is consumed by a proof route.
- Source locators verified against the cached texts: 44 (aggarwal2023 13, gorin2021 14,
  sheffield2005 5, kos2006 5, okounkov-reshetikhin2003 3, kenyon2009 2, kenyon1997 2), among
  them the new locator sheffield2005 line 354; all point at the statement cited.
- Policy: the pull request changes only `packages/DimerModelsAndLozengeTilings/`; no
  pull-request number, process narrative or machine path in the README or the Lean file; every
  target has a locator; no gap is declared (`design/plan.json` has `"gaps": []`) and none is
  needed.
- Wording, arrangement, reuse: 11 passages set beside their sources (the lattice and lozenge
  conventions, free tilings, the Gibbs property in 5.2 and 5.4, 2.9, 4.6(b), 7.2–7.3, the torus
  convention of 8.1, the kernel of 9.6, 5.3's two notions of ergodicity); nothing shared beyond
  formulas and standard names. gorin2021's Lectures 1, 2, 3, 4, 6, 13 are spread over Layers 2,
  3, 3 and 8, 8–9, 9, 4–7 and 10; Layers 1, 4 and 5 have no lecture, and the order 2 → 3 → 8 → 9
  is forced by the `*Needs:*` lines of 3.2 (2.8), 8.1 (7.1) and 9.1 (8.5). No table, figure or
  exercise list is taken over.

Source independence: 11 passages compared with 6 sources, none shared; largest share gorin2021, 49 of 173 locators; contents compared with gorin2021: independent.

## Not verifiable

- thurston1990 and georgii2011 (Theorem 14.15): uncertified, cited by locator alone; the
  statements used were read in gorin2021 Theorem 1.4 and sheffield2005 Lemma 3.2.2.
- 9.2(b), 9.3 and 9.4 (Riemann sums on good tori, the limit measure, mixing): routes checked step
  by step; the limit statements cannot be tested on a finite instance.
- 9.7(a) away from the diagonal, a row and the vertical pair: the entrywise identity was not
  recomputed numerically in this pass (round 1 did it at slope `(0.3, 0.45)`); the three cases
  with closed forms agree.
- 2.4 (topological to combinatorial simple connectivity): route read against the pinned lifting
  theorem; no instance beyond its Checks.
- The printed numbering of gorin2021 (the cached text is the author's pre-publication copy) and
  the published numbering of the arXiv versions cited.
- No Lean was run: the elaborated types are the worker's.

## Source issues

- **Error** in gorin2021 at Lemma 4.7, Lecture 4, line 1766: the source says that for large `n` one of `n`, `n + 2` is a good size; it should be `n` or `n + 1`, since at the angle `π/2` no even `n` is good; affects the proof.
- **Gap** in gorin2021 at the proof of Lemma 13.7, Lecture 13, lines 4574–4582: the source says the normalised restrictions to an invariant event and its complement are Gibbs; it should first show invariant events are almost surely tail events; affects the proof.
- **Gap** in gorin2021 at Theorem 4.10, Lecture 4, line 1849 (and kos2006 Theorem 4.2, lines 658–666): the source says the torus probability is a signed combination of minors of the four inverse matrices; it should use complementary minors, one matrix being singular on the uniform 3 × 3 torus; affects a stated result.
- **Error** in aggarwal2023 at the remark after Definition 1.2, lines 465–467: the source says a plane tiling is determined by its type-1 positions unless there are none; it should require a type-1 lozenge in one of every two consecutive rows; affects nothing.
- **Error** in kenyon2009 at Section 5.4, lines 858–859 (use of Theorem 6): the source says each slope of the closed triangle carries a unique ergodic Gibbs measure; it should restrict uniqueness to interior slopes, the open edges carrying several; affects a stated result.
- **Error** in kenyon2009 at Section 5.4, lines 863–866: the source says ergodicity of a torus limit follows since the extreme points of the fixed-slope set are the ergodic measures; it should use extremality among all invariant Gibbs measures, a slope fibre not being a face; affects the proof.

## For the human reviewers

- **Licence.** gorin2021, the source with the largest share of locators (49 of 173), is read from the author's page copy of a Cambridge University Press book (`sources.toml`, `licence_class = "author-page"`).
- **Licence.** `Suggested.lean:294-311` (`Specification`, `IsGibbs`: proper kernels for exterior σ-algebras indexed by `Finset`, consistency by `∘ₖ`) has the shape of the public GibbsMeasure project, from which Mathlib's `Kernel.IsProper` comes; that repository was not compared.
- **Scope.** README 6.4, 9.2 and 9.7 correct statements of published sources (kenyon2009 lines 860–866, gorin2021 Lemma 4.7, aggarwal2023 lines 465–467); each was recomputed and holds, and no published erratum is cited.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2ff33d429e47bae9af6e9e9603984e07c753440a", "job": "RT-DimerModelsAndLozengeTilings~2a", "model": "fable", "worker": "chris-x81"} -->
