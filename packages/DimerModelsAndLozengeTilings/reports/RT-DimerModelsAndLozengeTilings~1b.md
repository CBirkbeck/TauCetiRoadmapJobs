<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16766#issuecomment-6901786977 -->
Red team round 1 pass b (claude) of 3e57c8c

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) the general periodic-graph face theorem 5.3 is statable at the pins and absent

   **Location.** `packages/DimerModelsAndLozengeTilings/Suggested.lean:28–32`: "Not stated separately:
   the face theorem for dimer measures on a general locally finite periodic graph (README 5.3). It is
   4.6 applied to the weighted dimer specification of README 5.2, a constructed family of proper
   kernels". README line 21–22 lists "(4.6, 5.3, with its lozenge instance in 5.4)" among the end
   theorems.

   **Claim.** 5.3 cannot be stated without constructing the kernels `γ^w` and the subshift `𝔛(G)`.

   **Witness.** README 5.2, API bullet "Cylinder identities" (README lines 1374–1377): the Gibbs
   property of `γ^w` is `w(ω' ∩ F) · μ[ω]_E = w(ω ∩ F) · μ[ω']_E`, "this needs no conditional
   probability". `IsLozengeGibbs` (`Suggested.lean:360`) is exactly this form with `w ≡ 1` on
   `hexGraph`. The carriers exist at the pin: `SimpleGraph.edgeSet`, `SimpleGraph.LocallyFinite`
   (`Mathlib/Combinatorics/SimpleGraph/Finite.lean:382`), `SimpleGraph.Hom.mapEdgeSet`
   (`Mathlib/Combinatorics/SimpleGraph/Maps.lean:362`), `G ≃g G`. So the headline is statable with one
   simple definition, and only its special case is stated: the acceptance test cannot tell a library
   that proves 5.3 for periodic graphs from one that proves it for the hexagonal lattice alone.

   **Repair.** In Layer 5 of `Suggested.lean`, before `IsLozengeGibbs`, add the definition and the
   theorem below; remove the paragraph "Not stated separately … Layer 5." from the module docstring
   (keep its last sentence on cylinder convergence) and the sentence "The face theorem for a general
   periodic graph (5.3) is stated there through … a constructed family of kernels." from README lines
   32–34; in README 5.2 name the definition (`IsDimerGibbs G w μ`) at the cylinder-identity bullet and
   in 5.3 name the theorem. The text was written against the pinned signatures but not elaborated in
   this pass (no Lean command is available to a red-team pass); the repair worker elaborates it and
   runs `#check @` on both names.

   ```lean
   /-- A configuration on the edges of `G` is a perfect matching: every vertex lies in exactly one
   edge of value `true`. -/
   def IsMatchingConfig {V : Type*} (G : SimpleGraph V) (ω : G.edgeSet → Bool) : Prop :=
     ∀ v : V, ∃! e : G.edgeSet, ω e = true ∧ v ∈ (e : Sym2 V)

   /-- **Dimer Gibbs measures** in cylinder form (README 5.2): a probability measure concentrated on
   perfect matchings such that, for matchings `ω`, `ω'` agreeing off a finite set `F` of edges and
   every finite `E` containing each edge that shares a vertex with an edge of `F`,
   `w(ω' ∩ F) · μ[ω]_E = w(ω ∩ F) · μ[ω']_E`. -/
   def IsDimerGibbs {V : Type*} (G : SimpleGraph V) (w : G.edgeSet → ℝ)
       (μ : Measure (G.edgeSet → Bool)) : Prop :=
     IsProbabilityMeasure μ ∧ μ {ω | ¬ IsMatchingConfig G ω} = 0 ∧
       ∀ (F E : Finset G.edgeSet) (ω ω' : G.edgeSet → Bool),
         IsMatchingConfig G ω → IsMatchingConfig G ω' → (∀ e ∉ F, ω e = ω' e) →
         (∀ e ∈ F, ∀ e' : G.edgeSet, (∃ v, v ∈ (e : Sym2 V) ∧ v ∈ (e' : Sym2 V)) → e' ∈ E) →
         ENNReal.ofReal (∏ e ∈ F with ω' e = true, w e) * μ {η | ∀ e ∈ E, η e = ω e} =
           ENNReal.ofReal (∏ e ∈ F with ω e = true, w e) * μ {η | ∀ e ∈ E, η e = ω' e}

   /-- **The face property for dimer measures on a periodic graph** (README 5.3; sheffield2005
   Lemma 3.2.2, lines 1367–1371; georgii2011 Theorem 14.15). For a locally finite graph on a countable
   vertex type, a countable infinite group acting by automorphisms, properly on the edges, and a
   positive edge weight, the invariant dimer Gibbs measures form a face of the invariant probability
   measures on configurations. -/
   theorem dimerGibbsInvariant_isExtreme {V Γ : Type*} [Countable V] [Group Γ] [Countable Γ]
       [Infinite Γ] (G : SimpleGraph V) [G.LocallyFinite] (ρ : Γ →* (G ≃g G))
       (hproper : ∀ F F' : Finset G.edgeSet,
         {g : Γ | ∃ e ∈ F, (ρ g).toHom.mapEdgeSet e ∈ F'}.Finite)
       (w : G.edgeSet → ℝ) (hw : ∀ e, 0 < w e) :
       IsExtreme ℝ≥0∞
         {μ : Measure (G.edgeSet → Bool) | IsProbabilityMeasure μ ∧
           ∀ g : Γ, μ.map (fun ω e => ω ((ρ g⁻¹).toHom.mapEdgeSet e)) = μ}
         {μ | IsDimerGibbs G w μ ∧
           ∀ g : Γ, μ.map (fun ω e => ω ((ρ g⁻¹).toHom.mapEdgeSet e)) = μ} := by
     sorry
   ```

   Tested on the instances of README 5.2–5.3: `G = ℤ` with nearest-neighbour edges, `Γ = 2ℤ`: the two
   matchings have no common finite modification, every cylinder identity has `ω = ω'`, the Gibbs set
   is the segment `[δ_even, δ_odd]` inside the invariant measures concentrated on matchings, a face
   (a mixture charging a non-matching is excluded by the null clause). A graph with no perfect
   matching: both the Gibbs set and its trace are empty, a face. `G = hexGraph`, `w ≡ 1`: the
   definition unfolds to `IsLozengeGibbs` under the identification of `hexGraph.edgeSet` with
   `TriEdge` (README 1.2). Invariance of `w` is not assumed: the face property does not need it (R02).

2. **F02** (P3) equivariance of the specification is not used by the face property

   **Location.** README line 1274: "(b) If `γ` is `Γ`-equivariant, `𝒢_inv(γ)` is a face of
   `𝔓_inv(X)`"; `Suggested.lean:335` and `:347`, hypothesis `(hγ : γ.IsEquivariant)` (and the
   `[DecidableEq I]` it brings) of `gibbsInvariant_isExtreme` and `gibbsInvariant_extreme_iff_ergodic`.

   **Claim.** The face property and the ergodicity criterion need an equivariant specification.

   **Witness.** The README's own route for (b) (lines 1286–1291) uses only: the two measures and
   their combination are invariant, so the densities are almost invariant; 4.2 (a statement about an
   invariant measure and a proper action, no `γ`); and (a) (properness of each `γ_Λ` and the Gibbs
   property of the combination). Equivariance appears in no step. So both Lean theorems hold verbatim
   without `hγ`; with it they are stated below the generality the route proves.

   **Repair.** README 4.6(b): "(b) For every specification `γ`, equivariant or not, `𝒢_inv(γ)` is a
   face of `𝔓_inv(X)` …" and add after the route: "Equivariance of `γ` is not used; it is what makes
   `𝒢(γ)` itself `Γ`-invariant (4.5)." In `Suggested.lean` delete `(hγ : γ.IsEquivariant)` and
   `[DecidableEq I]` from both theorems, delete `Specification.IsEquivariant` (no stated theorem then
   needs it; the README keeps the notion in prose, without the backticked Lean name), and replace
   "an equivariant specification" by "a specification" in the two docstrings and the module docstring.
   Add the negative control as a Check of 4.6: invariance of the two measures is what is used — for
   the independent specification with `ν = Bern(1/2)`, `μ = ½(f₁μ) + ½(f₂μ)` with
   `f₁ = 2·1_{ω(0)=1}`, `f₂ = 2·1_{ω(0)=0}` is Gibbs and invariant while neither summand is invariant
   or Gibbs. Tested: on the identity specification on `X₀` and on the independent specification (both
   equivariant) nothing changes; for a non-equivariant family (site `0` resampled by `Bern(1/3)`, the
   others by `Bern(1/2)`) the only Gibbs measure is not invariant, `𝒢_inv = ∅`, a face.

3. **F03** (P3) "free tiling" is cited to Aggarwal but is a wider notion on general regions

   **Location.** README lines 163–164: "a free tiling drops the first condition and only asks `M` to
   consist of edges of faces of `R`"; README line 587–588 cites "aggarwal2023 lines 342–364 and
   380–383" for it; 2.6 cites aggarwal2023 lines 380–401.

   **Claim.** The README's free tilings are Aggarwal's.

   **Witness.** `R = {W(0), W(−e₁)}`, `M = {(0,3), (0,2)}`: each face of `R` contains exactly one edge
   of `M`, so `M` is a free tiling here, but its two lozenges `W(0) ∪ B(0)` and `W(−e₁) ∪ B(0)` overlap
   in `B(0) ∉ R`; aggarwal2023 lines 380–383 asks for a tiling of a larger domain. `M` is not the
   restriction of a plane tiling either. (2.6 remains true for the README's notion: `H = 0` at
   `0, e₁, e₃, −e₁` and `1` at `e₂` is a height function on `R`.)

   **Repair.** Add to the Conventions item "Regions and tilings": "The lozenges of a free tiling may
   overlap in a face outside `R`; for `R = Faces(V)` (1.3) an outside face has at most one edge in
   `E(R)`, the lozenges are disjoint, and this is Aggarwal's free tiling (aggarwal2023 lines
   380–383)." Add to 1.4 the Check: "`R = {W(0), W(−e₁)}`, `M = {(0,3), (0,2)}` is a free tiling whose
   two lozenges share `B(0) ∉ R`; `R` is not of the form `Faces(V)`, since `B(0)` has its three
   vertices in `V(R)`." Tested on the witness: with the added sentence the citation is correct for
   `Faces(V)` and silent otherwise.

One P2 (a headline of the README's own list is statable at the pins and absent) and two P3. No
statement of `Suggested.lean` and no README target was found false: every theorem was instantiated
on degenerate cases, the torus identities were brute-forced, and the kernel identities were
evaluated numerically (table below).

## Verified sound

Counts: 57 declarations of `Suggested.lean` read (17 theorems, 40 definitions, structures and
instances), each compared with its elaborated type in the worker's `signatures.md` (no `#check`
was run by this pass; no declaration lost a binder; all 57 names occur in the README and the
resolver lists no README name missing from the Lean); 51 README targets read (every line of the
README); 162 Check bullets in 51 Checks blocks (minimum 3 per target), all evaluated and none found
false; 90 library declarations opened at the pins (file, and line where the README gives one), all
present as described; 99 source locators opened in the cached texts; 6 sibling citations resolved.

Dependency check (the brief's command, unchanged): `depcheck: 239 roadmaps, 2243 edges, 0
problem(s)` — no UPWARD or CYCLE line. No gap is declared (`design/plan.json` `gaps` is `[]`) and
none is needed. `git diff --stat origin/main...HEAD` touches only the package folder. No `lemma`,
`set_option`, `#eval`, `#print`, pull-request number or process narrative in the README or the
Lean file.

Ownership. Searched the roadmaps on main and the open heads for Kasteleyn, dimer, lozenge, DLR and
Gibbs specifications, tail σ-algebras, subshifts, height functions, Thurston's criterion,
determinantal and sine kernels: no second owner. Kasteleyn occurs on main only as
Fortuin–Kasteleyn (TemperleyLiebOperatorAlgebras); Gibbs measures in ClassicalErgodicTheory §8.6
are equilibrium states of Hölder potentials on shifts, a different object. The scope citations
resolve: VonNeumannAlgebras V8.BernoulliArbitraryDiscrete (README line 2788 there), FactorRigidity
§8.3, ClassicalErgodicTheory §0.3 item 2 and §1.4 item 2 (open head), TensorProductCombinatorics
§1.1, RandomMatrices §8.3–8.4, GraphConnectivityAndFlows §6.7. None is used as a supplier.

Padding probe. No declaration follows from one tactic or one library lemma.
`gibbsInvariant_extreme_iff_ergodic` and `lozengeGibbs_extreme_iff_ergodic` follow from the face
theorems with `IsExtreme.extremePoints_eq` and `ErgodicSMul.iff_mem_extremePoints`, but need the
measurable action on a subshift and the additive transport, neither at the pins: kept.

Notes (not findings): `hs₀`, `hs₁` of `slopeEdge_ergodicGibbs_equiv` are not needed for truth
(both sets are empty outside `[0,1]`); `[Finite S]`, `[DiscreteTopology S]`,
`[DiscreteMeasurableSpace S]` are not used by the route of 4.6(b) either, but they are the README's
standing hypotheses of 4.4–4.6.

### The adversarial pass

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `latticeDir`, `TriEdge`, `TriEdge.target`, `TriFace`, `TriFace.edges` | `W(0)`, `B(0)`; edge `(v,1)`, `(v,2)`, `(v,3)` | `(v,1) ∈ W(v), B(v−e₂)`; `(v,2) ∈ B(v), W(v−e₁)`; `(v,3) ∈ W(v), B(v)`; `W(0) ∩ B(0) = {(0,3)}` | agrees with Conventions and aggarwal2023 lines 324–361 |
| `hexGraph` | `W(0)`; `W(0)` vs `B(1,−1)` | neighbours `B(0), B(−e₂), B(e₁)`; common vertex only, not adjacent | sound |
| `AddAction` instances; `arrowAddAction` | `w = e₁`, indicator of one edge | `(w +ᵥ ω) e = ω(−w +ᵥ e)`: edge set translated by `+w` | sound; no competing instance on `TriEdge → Bool` |
| `IsTiling`, `tilingSubgraph`, `tilingSubgraph_bijOn` | `R = ∅`; `{W(0)}`; hexagon; `univ` | 1 ↔ 1; 0 ↔ 0; 2 ↔ 2 (6-cycle); injective since two faces share ≤ 1 edge | true |
| `regionEdges`, `boundaryEdges`, `boundaryVertices`, `regionGraph` | `{W(0)}`; `R₆`; `R₆'` | 3 boundary edges; `18 = 2·6 + 6`; `R₆'` boundary edges listed, 8 boundary vertices | sound |
| `IsClosedOn`, `IsSimplyConnectedRegion` | `{W(0)}`; `R_ring` (12 faces recomputed); two triangles at a vertex | primitive exists; cut cochain on `((n,0),2)`, `((n,0),3)`, `n ≥ 1` closed on the ring, sum `1` round `W(0)`; wedge is simply connected | determines `H¹ = 0` and connectedness |
| `neutralIncrement`, `IsHeightFunction`, `tilingOfHeight`, `tilingOfHeight_bijOn` | `H = x`, `y`, `0`, `⌊(x+y)/2⌋`, `x+y`; triples `(a,b,a+b)` | `M₁`, `M₂`, `M₃`; no type 3; not a height function; exactly one edge per face for `(0,0,0),(1,0,1),(0,1,1)` | true |
| Gorin height `h_G = x + y − 3H`; rotation law `H_{ρM}(w) = H_M(ρ⁻¹w) + w₁` | `M₃`; `M₁ → M₂ → M₃ → M₁` | `+1` along `e₁`, `−2` along `−e₃`; `w₂`, `0`, `w₁` | conventions pinned |
| `IsFlip`, `flip_connected` | hexagon at `v = 0`; 2 × 2 torus `(1,0)`; cactus regions | six faces of the two triples coincide; `T_a ↔ T_b`; no flip on the torus (not a region); tie-break of 2.8 yields `H(v±e_k)` as required | true |
| `positiveSteps`, `thurston_tileable_iff` | `{W(0)}`; `{W(0),B(0)}`; `R₆'`; a region with a pinch vertex | both sides false; both true (`h ≡ 0`); `h(1,1) − h(2,1) = 1 > 0`, untileable; sufficiency via `H = min_u (h(u) + ρ(u,·))` needs no simple connectivity, necessity does (`R_ring`: tiling `T` with sum `−1`) | true; equivalent to gorin2021 Theorem 1.4 under `h_G = x + y − 3H` |
| `whiteFaces`, `blackFaces`, `kasteleynMatrix`, `partitionFunction`, `partitionFunction_eq_abs_det` | hexagon unit and `(a,b,c)`; `R₆'`; `R_ring`; `R = ∅` | `det = 2`, `2abc`; `det 0`, no tiling; 12-cycle, `det 0`, `Z = 2` (hypothesis needed); `1 = det` of the empty matrix | true; positivity needed for `|·|` |
| `lozenge_correlation_eq_det` | hexagon: one pair; two pairs; repeated black face; `n = 0` | `1/2`; `det[[1/2,1/2],[−1/2,1/2]] = 1/2`; `0`; `1 = 1`; `(K')⁻¹(σ g, f) = K⁻¹(g,f)` | true; injectivity of pairs needed |
| Restricted Leibniz witness | `A = [[1,2,0],[0,1,3],[4,0,1]]` | `det 25`, adjugate recomputed, `75/625 = 3/25`, `Λ = 3` | sound |
| `Subshift`, its `CoeSort` and `MulAction`, `Subshift.exterior` | `I = Γ = ℤ`; empty carrier; `I = ∅` | `(1 • 1_{0}) = 1_{1} = shift(−1)`; all sets empty; one-point space | sound |
| `Specification`, `IsGibbs`, `IsEquivariant`, `gibbsInvariant` | identity specification on `X₀`; identity on the full shift; independent specification; two inconsistent laws | Gibbs for all; excluded by the source σ-algebra; unique Gibbs measure; `γ_{0} ∘ₖ γ_{0,1}` gives `1/2 ≠ 1/3` | `∘ₖ` order is the consistency `γ_Δ γ_Λ = γ_Δ` |
| `gibbsInvariant_isExtreme`, `gibbsInvariant_extreme_iff_ergodic` | `X₀`; independent specification; non-tail density `2·1_{ω(0)=1}`; trivial action on a point (not proper) | segment, endpoints ergodic; one point; not Gibbs; 4.2 fails | true; R02 |
| `IsLozengeGibbs`, `lozengeGibbsInvariant`, the two lozenge theorems | `δ_∅`; `2δ_{M₃}`; `δ_{M_k}`; `ν₃` | excluded by the null clause; by mass; members; member, not ergodic, event mass `1/3` | true; cylinder form equals the DLR property |
| `slope`, `rowCode`, `slopeEdge_ergodicGibbs_equiv` | `s = 0`, `1`, `1/2`; `Φ₂` structure | `(v,1) ∈ M ⇔ (v,3) ∉ M ⇔ (v+e₂,1) ∈ M`; no finite modification (height constant on vertical lines); `rowCode((a,0) +ᵥ ω) x = ε(x − a)` | true |
| `two_ergodicGibbs_of_slopeEdge` | `Bern(s)` and `β_s`; rotation | `s²` vs `(s+s²)/2`; `slope(ρ_*μ) = (1−s−t, s)` maps `t = 0` to `s+t = 1` to `s = 0` | true |
| `IsTorusTiling`, `heightChange`, `torusMeasure`, `torusLimit_mem_gibbsInvariant_slope` | `n = 0`, `1`, `2`; `(s,t) = (1/2,1/2)`, `n` odd | infinite set gives measure `0`; three tilings; floor tiling `⌊(ax+by)/n⌋` realises every `a + b ≤ n`; `⌊n/2⌋ + ⌊n/2⌋ ≤ n`; empty cylinder gives mass one | true |
| `torusPartitionFunction`, `twistedKasteleyn`, `torus_partitionFunction_eq` | brute force over all tilings for `(n₁,n₂) ∈ {1..4} × {1..3}`, `n₁n₂ ≤ 9`, random integer weights in `[−5,7]` | both sides equal in all 11 cases (e.g. `−1191072` on 3 × 3); 2 × 2 unit: `−3, 5, 5, 5`, 9 tilings; 1 × 2 unit: `3, 5, −1, 1`, 5 tilings | true, matches gorin2021 table (3.4) |
| 8.2 sign formula; 8.4 Checks; 8.5 | all tilings of the same tori, all `(a,b)`; type-3 lozenge on 2 × 2 at weights `(1,1,1)`, `(2,3,5)` | no sign mismatch; `c = (−1,1,1,3)`, `1/3`; `c = (60,100,150,190)`, `det = (0,544,1044,1300)`, `Z = 1444`, `25/38` equal to the direct count | true |
| Kernel conventions `P̂_w`, `G_w` | `w = (1,1,1)`, `(1,1,3)`, `(1,1,2)` | `G(0) = 1/3`, `G(0,−2) = √3/(2π) − 1/3`, inverse identity `w₃G(d) + w₁G(d−e₂) + w₂G(d+e₁) = δ`; `w₃G(0) = 1`; single zero `(π,π)` | sound |
| 9.2(a) | `θ = π/2`; `θ = 2π/3`, `n = 3, 4` | `‖α‖ ≤ ‖nα‖ + ‖(n+1)α‖ ≤ 2n^{−1/2}/π` gives `n` or `n + 1`; `π/12 > 1/8` | true; gorin2021 Lemma 4.7 as printed is false |
| `incompleteBetaKernel` | diagonal; vertical neighbours; `ξ → 0`, `ξ → ∞`; reversed crossing rule | `s`; `−(1−s−t)` and `s − Im ξ/π`; two-point value `→ s` in both limits (frozen directions `e₂`, `e₃`); reversed rule gives a value `> 1` | sides of crossing pinned |
| 9.7(a) and `incompleteBetaProcess_exists_unique` | slope `(0.3, 0.45)`, pairs and a triple; `ξ = e^{πi/3}` | entrywise identity to `5·10⁻⁴` on 13 entries; ratios `−0.8740`, `1.9511`, `1.2209`; determinants `0.07507`, `0.03421` on both sides; `w₂G(e₁) = 0.45`; `2/9 − √3/(6π)` | true; `t` is the type-2 density; uniqueness holds since rows are a.s. nonempty |
| `exists_ergodicGibbs_of_slope` | `(1/3,1/3)`, `(1/2,1/4)`, `(1/2,0)`, corners | `w` liquid; `1 < √2`; not positive, edge case by 6.3; frozen | true |
| `LocalConvergence`, `localLimit_isLozengeGibbs` | all faces; translated hexagons; forced regions; `M_c` | limit `μ`; limit not on plane tilings (exhaustion needed); `δ_{M_ε}`; `δ_{M_c}` not Gibbs (uniformity needed) | true |

## Not verifiable

- `thurston1990` and `georgii2011` are recorded as uncertified: their locators (the article; Theorem
  14.15) were not read. Both statements are restated in sources that were read (gorin2021 Theorem
  1.4; sheffield2005 Lemma 3.2.2).
- The Lean text of R01 was not elaborated; no Lean command is available to this pass.
- gorin2021 lines 1748–1790 (Lemma 4.7 and its proof) are broken by empty page markers in the
  extraction; the statement at line 1766 is legible, the displayed formulas are not.
- Whether the published versions of aggarwal2023, sheffield2005, kos2006 and kenyon2009 keep the
  numbering of the arXiv versions read was not checked; the README says which version it cites.
- Ownership against the open pull requests was checked through the `roadmaps grep` index of
  2026-11-15 and the six sibling files read; no other open head was read in full.

## Source issues

- **Error** in gorin2021 at Lemma 4.7, line 1766: the source says that for large `n` one of `n`, `n + 2` avoids the bad set `W_θ`'s complement; it should be `n` or `n + 1`, since at `θ = π/2` every even `n` fails; affects the proof.
- **Error** in aggarwal2023 at the remark after Definition 1.2, lines 465–467: the source says a plane tiling is determined by its type-1 positions unless that set is empty; it should require a type-1 lozenge in one of every two consecutive rows; affects nothing.
- **Error** in kenyon2009 at Section 5.4, lines 863–866: the source says ergodicity of a torus limit follows because the extreme points of the fixed-slope convex set are the ergodic measures; it should use extremality among all invariant Gibbs measures, the fixed-slope set not being a face; affects the proof.
- **Error** in kenyon2009 at Theorem 6 and its use, lines 836–839 and 858–859: the source says each slope of the closed triangle carries a unique ergodic Gibbs measure; it should restrict uniqueness to interior slopes, the open edges carrying several (sheffield2005 Theorem 9.5.1); affects a stated result.

Source independence: 12 passages compared with 7 sources (aggarwal2023 lines 380–383, 395–398, 413–415, 421–431, 472–476; gorin2021 lines 521–526, 4534–4537; sheffield2005 lines 1367–1371; kenyon2009 lines 537–543, 698–710; kos2006 lines 211–213; okounkov-reshetikhin2003 lines 965–968), none shared beyond formulas and standard names (longest common run 3 words); largest share gorin2021, 47 of 159 locators; contents compared with gorin2021 (Lectures 1, 2, 3, 4, 6, 13 against Layers 2, 3, 3 and 8, 8–9, 9, 4–6 and 10): independent, since Layers 1, 4, 5 and 7 have no counterpart lecture, Layer 9 merges three lectures, and the order 2 → 3 → 8 → 9 is forced by the `*Needs:*` lines of 3.2 (2.8), 8.1 (7.1) and 9.1 (8.5). No table, figure or exercise list of a source is reused.

## For the human reviewers

- **Licence.** `gorin2021` is read from the author's page (`sources.toml`, `licence_class = "author-page"`), a pre-publication copy of a Cambridge University Press book; it carries the largest share of the locators (47 of 159).
- **Scope.** README 6.4, 9.2 and 9.7 state corrections to published sources (kenyon2009 lines 860–866, gorin2021 Lemma 4.7, aggarwal2023 lines 465–467); each was recomputed here and holds, but no refereed erratum is cited for them.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3e57c8cf4bf3ee98b2839a5e702e346a8d5b816f", "job": "RT-DimerModelsAndLozengeTilings~1b", "model": "fable", "worker": "chris-x30"} -->
