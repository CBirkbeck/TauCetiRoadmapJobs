<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16766#issuecomment-6901776055 -->
Red team round 1 pass a (claude) of 3e57c8c

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) the general-graph face theorem 5.3 is a named headline, statable at the pins, and absent

   Location: `packages/DimerModelsAndLozengeTilings/Suggested.lean:28-32`, "Not stated separately: the
   face theorem for dimer measures on a general locally finite periodic graph (README 5.3). It is 4.6
   applied to the weighted dimer specification of README 5.2, a constructed family of proper kernels";
   `packages/DimerModelsAndLozengeTilings/README.md:21-22` lists 5.3 among the end theorems.

   Claim: 5.3 cannot be stated without constructing the kernels `γ^w`.

   Witness: `README.md:1374-1377` gives the Gibbs property of `γ^w` as cylinder identities
   `w(ω' ∩ F) · μ[ω]_E = w(ω ∩ F) · μ[ω']_E` and says "this needs no conditional probability".
   `IsLozengeGibbs` (`Suggested.lean:360-366`) is that form with `w ≡ 1`; the weighted form on
   `Sym2 V → Bool` needs only `SimpleGraph`, `Sym2.map` and `Measure`, all at the pins.

   Repair: state 5.3 in `Suggested.lean`, Layer 5, before `IsLozengeGibbs`, with two predicate
   definitions and one theorem, and replace the "Not stated separately" paragraph of the module
   docstring by the sentence on weak limits only. No Lean was run in this read-only pass: elaborate the
   text below with `#check` before submitting, and add the three names to README 5.1–5.3.

   ```lean
   /-- A perfect-matching configuration of `G`, as a function on `Sym2 V`: only edges of `G` are
   present and every vertex lies in exactly one present edge (README 5.1). -/
   def IsDimerConfiguration {V : Type*} (G : SimpleGraph V) (ω : Sym2 V → Bool) : Prop :=
     (∀ e, ω e = true → e ∈ G.edgeSet) ∧ ∀ v : V, ∃! e, ω e = true ∧ v ∈ e

   /-- Dimer Gibbs measures of an edge weight `w` in cylinder form (README 5.2): a probability
   measure concentrated on perfect-matching configurations such that, for configurations `ω`, `ω'`
   agreeing off a finite `F` and every finite `E` containing the edges of `G` that share a vertex
   with a member of `F`, `w(ω' ∩ F) · μ[ω]_E = w(ω ∩ F) · μ[ω']_E`. -/
   def IsDimerGibbs {V : Type*} (G : SimpleGraph V) (w : Sym2 V → ℝ)
       (μ : Measure (Sym2 V → Bool)) : Prop :=
     IsProbabilityMeasure μ ∧ μ {ω | ¬ IsDimerConfiguration G ω} = 0 ∧
       ∀ (F E : Finset (Sym2 V)) (ω ω' : Sym2 V → Bool),
         IsDimerConfiguration G ω → IsDimerConfiguration G ω' → (∀ e ∉ F, ω e = ω' e) →
         (∀ e ∈ F, ∀ e' ∈ G.edgeSet, (∃ v, v ∈ e ∧ v ∈ e') → e' ∈ E) →
         ENNReal.ofReal (∏ e ∈ F.filter (fun e => ω' e = true), w e) *
             μ {η | ∀ e ∈ E, η e = ω e} =
           ENNReal.ofReal (∏ e ∈ F.filter (fun e => ω e = true), w e) *
             μ {η | ∀ e ∈ E, η e = ω' e}

   /-- **The face property for dimer measures on a periodic graph** (README 5.3; sheffield2005
   Lemma 3.2.2, lines 1367–1371; kos2006 lines 195–202). For a locally finite graph on a countable
   vertex type, a countable infinite group acting by automorphisms, properly on edges, and an
   invariant positive edge weight, the invariant dimer Gibbs measures form a face of the invariant
   probability measures on configurations. -/
   theorem dimerGibbsInvariant_isExtreme {Γ V : Type*} [Group Γ] [Countable Γ] [Infinite Γ]
       [Countable V] [MulAction Γ V] (G : SimpleGraph V) (hfin : ∀ v, (G.neighborSet v).Finite)
       (hG : ∀ (g : Γ) (u v : V), G.Adj (g • u) (g • v) ↔ G.Adj u v)
       (hproper : ∀ F F' : Finset (Sym2 V),
         {g : Γ | ∃ e ∈ F, e ∈ G.edgeSet ∧ Sym2.map (g • ·) e ∈ F'}.Finite)
       (w : Sym2 V → ℝ) (hw : ∀ e, 0 < w e) (hwΓ : ∀ (g : Γ) (e : Sym2 V), w (Sym2.map (g • ·) e) = w e) :
       IsExtreme ℝ≥0∞
         {μ : Measure (Sym2 V → Bool) | IsProbabilityMeasure μ ∧
           ∀ g : Γ, μ.map (fun ω e => ω (Sym2.map (g⁻¹ • ·) e)) = μ}
         {μ | IsDimerGibbs G w μ ∧ ∀ g : Γ, μ.map (fun ω e => ω (Sym2.map (g⁻¹ • ·) e)) = μ} := by
     sorry
   ```

   Tested on the instances of README 5.1–5.3. `G = ℤ` with nearest-neighbour edges, `Γ = 2ℤ`:
   configurations agreeing off a finite set are equal, so the identity is `c · m = c · m`; the right
   set is the segment `[δ_even, δ_odd]`, a face of the invariant probability measures (concentration on
   a set is a face). `V = ∅`: one configuration, both sets are `{δ}`. A graph with vertices and no
   edge: no configuration, the right set is empty. `C₆` is excluded by the hypotheses (an infinite
   group cannot act properly on six edges), as in README 5.1, third Check.

   If the author prefers not to state it: delete "5.3," from the list of end theorems at
   `README.md:21-22` and the sentence at `README.md:32-34`, so that the headline is 4.6 with its
   instance 5.4, and keep 5.3 as a target. Either repair removes the finding; the first is the one the
   acceptance-test rules ask for.

2. **F02** (P3) equivariance is not used by the face property 4.6(b)

   Location: `packages/DimerModelsAndLozengeTilings/README.md:1274`, "(b) If `γ` is `Γ`-equivariant,
   `𝒢_inv(γ)` is a face of `𝔓_inv(X)`"; `Suggested.lean:335` and `:347`, `(hγ : γ.IsEquivariant)`.

   Claim: the face property and the ergodic-iff-extreme statement need an equivariant specification.

   Witness: the README's own route (`README.md:1286-1291`) never uses `hγ`. If `μ = aμ₁ + bμ₂` is
   Gibbs and `μ₁, μ₂` are invariant, `μ` is invariant, `dμ₁/dμ` is a.s. invariant, hence a.s. tail
   (4.2), and (a) applies. Instance: independent kernels with `ν₀ = δ₁`, `νᵢ = Bern(1/2)` otherwise;
   `𝒢_inv = ∅`, a face.

   Repair: in `README.md` 4.6 replace "(b) If `γ` is `Γ`-equivariant, `𝒢_inv(γ)` is a face of
   `𝔓_inv(X)`" by "(b) `𝒢_inv(γ)` is a face of `𝔓_inv(X)`, for every specification `γ` (equivariance
   is not needed; it makes `𝒢(γ)` itself `Γ`-invariant, 4.5)". In `Suggested.lean` delete the binder
   `(hγ : γ.IsEquivariant)` and `[DecidableEq I]` from `gibbsInvariant_isExtreme` and
   `gibbsInvariant_extreme_iff_ergodic`, change "an equivariant specification" to "a specification" in
   their docstrings and in the module docstring ("of an equivariant specification on" becomes "of a
   specification on"), and delete the definition `Specification.IsEquivariant` from the Lean file
   (no statement then uses it; README 4.5 keeps it as a definition, written without backticks or with
   the Lean name removed, since 5.2 and 5.3 still use the notion). Tested on the instance above
   (both sets of the `IsExtreme` statement are then `𝔓_inv` and `∅`) and on the identity
   specification of README 4.5 on `X₀` (segment in segment).

3. **F03** (P3) the weights `w(s,t)` are defined inside 9.5 and used by 9.6 and 9.7, which do not list it

   Location: `packages/DimerModelsAndLozengeTilings/README.md:1967-1968`, "for `w = w(s,t)` of 9.5 is
   the law of sines" (9.6, whose `*Needs:*` at `:1961` names Mathlib only), and `:1985`, "Let `ξ` be in
   the upper half-plane, `(s,t)` its slope and `w = w(s,t)`" (9.7, `*Needs:* 4.4, 9.3, 9.4, 9.6` at
   `:2012`).

   Claim: 9.6 and 9.7 depend only on what their `*Needs:*` lines name.

   Witness: `w(s,t) = (sin πs, sin πt, sin π(1−s−t))` and its liquidity appear only in the route of 9.5
   (`README.md:1943-1945`), a target whose statement is about existence for all of `𝒯̄`; 9.7(a), (b)
   and (d) need the definition and the liquidity, not 9.5's theorem.

   Repair: add to the Conventions bullet "Complex slope and incomplete beta kernel", after the
   definition of `ξ(s,t)`: "For `(s,t) ∈ 𝒯` the sine weights are
   `w(s,t) = (sin πs, sin πt, sin π(1−s−t))`; they are positive and liquid, being the sides of a
   triangle with angles `πs`, `πt`, `π(1−s−t)` opposite them (law of sines)." Then in 9.5 replace
   "with `w(s,t) = (sin πs, sin πt, sin π(1−s−t))`, which is liquid by the law of sines and has angles
   `πs`, `πt`, `π(1−s−t)` opposite its sides" by "with the sine weights `w(s,t)` of the Conventions",
   and in 9.6 replace "for `w = w(s,t)` of 9.5" by "for the sine weights `w = w(s,t)` (Conventions)".
   Tested: at `(s,t) = (0.3, 0.45)` the definition gives `w ≈ (0.8090, 0.9877, 0.7071)`,
   `w₂/w₃ ≈ 1.3968 = |ξ|`, `w₁/w₃ ≈ 1.1441 = |1−ξ|`, the values 9.7's second Check uses.

One P2 (a headline the README names is statable at the pins and absent from `Suggested.lean`) and
two P3. No statement of `Suggested.lean` or of the README was found false: every theorem was
instantiated on its degenerate cases and every numerical Check that could be recomputed was
recomputed (table below).

## The pass: statements, instances, values

Elaborated types were read from the worker's `scratch/signatures.md` (57 declarations, `#check @name`
output) and compared one by one with the README statements; no binder is lost and none differs from
the README's generality except where R02 says so. No Lean was run in this pass and no file of the
package was changed.

Context of `Suggested.lean`: no `variable` or `include` line; every binder is in the declaration's
own signature. `open MeasureTheory ProbabilityTheory Filter Topology Complex`, `open scoped ENNReal`,
`noncomputable section`, one namespace. Three instances: `AddAction (ℤ × ℤ) TriEdge`,
`AddAction (ℤ × ℤ) (TriEdge → Bool)` (`arrowAddAction`), `MulAction Γ X` for a `Subshift`.

| Statement (section) | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| `TriFace.edges`, `hexGraph` (L1) | `W(0)`, `B(0)`, `B(−e₂)`, `B(1,−1)` | `W(0) ∩ B(0) = {(0,3)}`; `(0,1) ∈ W(0), B(−e₂)`; `W(0)`, `B(1,−1)` share no edge | sound |
| `IsTiling` (L1) | `R = ∅`; `{W(0)}`; unit hexagon; `M₁ ∪ M₃` | `∅` only; none; `T_a`, `T_b`; `W(0)` holds 2 edges | sound |
| `tilingSubgraph_bijOn` (L1) | `R = ∅`, `{W(0)}`, `R₆`, `Set.univ` | 1 ↔ 1; 0 ↔ 0; 2 ↔ 2 (6-cycle); injectivity from "two faces share ≤ 1 edge" and clause 1 of `IsTiling` | true |
| `IsSimplyConnectedRegion` (L2) | `{W(0)}`; `R_ring`; wedge `W(0) ∪ B(1,1)`; `∅` | exact; ring cochain sums to `1` round `W(0)`; exact and connected through `(1,1)`; excluded | sound |
| `tilingOfHeight_bijOn` (L2) | `H = x`, `y`, `0`, `⌊(x+y)/2⌋`, `x + y` | `M₁`, `M₂`, `M₃`, a tiling without type 3, not a height function (`e₃`-increment 2); face triples `(0,0,0),(1,0,1),(0,1,1)` select one edge each | true |
| `IsFlip`, `flip_connected` (L2) | `R₆` at `v = 0`; wedge; 2 × 2 torus | `T_a → T_b` exactly the first disjunct; wedge has no tiling; torus not a `Finset` region | true |
| `thurston_tileable_iff` (L2) | `{W(0)}`; `R₆`; `R₆'`; wedge; nil walk | no `h` (`0 + 0 ≠ 1`); `h = 0,0,0,−1,−1,−1`; `h(1,1) − h(2,1) = 1 > 0`; no `h`; `0 ≤ 0`. Constraint system `0 ≤ H(v+e_k) − H(v) ≤ 1` is a difference system, feasible iff the stated inequalities | true |
| `kasteleynMatrix`, `partitionFunction_eq_abs_det` (L3) | `R₆` unit and type weights; `R₆'`; `R_ring`; wedge | `det = 2`, `2abc`; `0 = 0`; ring: `det 0`, `Z = 2` (excluded, not simply connected); `[0]`, `Z = 0` | true |
| `lozenge_correlation_eq_det` (L3) | `R₆`: one pair; two pairs; shared `B(0)`; `n = 0`; repeated pair | `1/2`; `det[[1/2,1/2],[−1/2,1/2]] = 1/2`; `0 = 0`; `1 = 1`; repeated pair excluded by `hfg` (LHS `1/2`, RHS `0`) | true |
| Restricted Leibniz witness (Conventions) | `A = [[1,2,0],[0,1,3],[4,0,1]]` | `det = 25`, adjugate as printed, `Λ = 3 = 25 · 3/25` | sound |
| `Subshift`, `Specification`, `IsGibbs` (L4) | `X₀ = {0̄,1̄}` identity kernels; independent kernels; order of `∘ₖ` | proper at all pairs; unique Gibbs measure `ν^{⊗I}`; `γ_{0} ∘ₖ γ_{0,1}` gives `1/2` against `1/3`, so the stated order is the non-vacuous one | sound |
| `gibbsInvariant_isExtreme` (L4) | trivial group on a point (excluded); `X = ∅`; `I = ∅`; `X₀`; non-equivariant kernels | `Bern(1/2) = (δ₀+δ₁)/2` refutes it without `Infinite`/properness; `∅ ⊆ ∅`; `{δ}`; segment; `𝒢_inv = ∅` | true; `hγ` unused (R02) |
| `gibbsInvariant_extreme_iff_ergodic` (L4) | `X₀`: endpoints and midpoint | extreme and ergodic; neither (`{1̄}` has mass `1/2`) | true |
| `IsLozengeGibbs` (L5) | `δ_∅`; `2δ_{M₃}`; `δ_{M_c}` (`H = min(0,x,y)`); `δ_{M₃}` | fails concentration; fails mass; fails the identity at the hexagon round `0`; holds | sound |
| `lozengeGibbsInvariant_isExtreme`, `lozengeGibbs_extreme_iff_ergodic` (L5) | `ν₃ = (δ_{M₁}+δ_{M₂}+δ_{M₃})/3`; `δ_{M_k}` | in the set, not extreme, `{M = M₁}` has mass `1/3`; extreme and ergodic | true |
| `slope`, `rowCode`, `slopeEdge_ergodicGibbs_equiv` (L6) | `s = 0`, `1`, `1/2`; shift direction | `{δ_{M₃}} ↔ {δ_0̄}`; `{δ_{M₁}} ↔ {δ_1̄}`; type-2-free tilings are column-constant and admit no finite change; `rowCode((1,0) +ᵥ ω)_x = ε_{x−1}` | true |
| `two_ergodicGibbs_of_slopeEdge` (L6) | `s = 1/2`, `t = 0`; rotation | `P(ε₀ = ε₁ = 1) = 1/4` against `3/8`; `slope(ρ_*μ) = (1−s−t, s)` carries `(s,0)` to the other two edges | true |
| `IsTorusTiling`, `heightChange`, `torusMeasure` (L7) | `n = 0`, `1`, `2`; `(s,t)` on `𝒯̄` | `n = 0`: infinite set, measure `0`, met at most once by a strictly monotone `φ`; 3 tilings; floor tiling `⌊(⌊ns⌋x + ⌊nt⌋y)/n⌋` shows nonemptiness | sound |
| `torusLimit_mem_gibbsInvariant_slope` (L7) | `(0,0)`; `(1/2,0)`; empty cylinder | `δ_{M₃}`; `C(2m−k, m−j)/C(2m,m) → 2^{−k}`; mass `1`; slope `⌊ns⌋/n → s` | true |
| `twistedKasteleyn`, `torus_partitionFunction_eq` (L8) | all tori `1×1 … 4×2, 1×4, 3×3`, unit and random signed integer periodic weights, brute force over all torus tilings with the Lean matrix | `Z = RHS` in all 20 runs: e.g. `2×2`: `(3+5+5+5)/2 = 9`; `3×3`: dets `0, 28, 28, −28`, `Z = 42`; `1×2` signed: `(−1+1+1+1)/2 = 1` | true |
| Sign formula 8.2 | every torus tiling of 11 tori up to `4×3`, all `(a,b)` | `0` mismatches with `(−1)^{h₁h₂+(n₂+1+b)h₁+(n₁+1+a)h₂}` | true |
| Torus correlations 8.4 | `2×2`, type-3 lozenge at `W(0)`, weights `(1,1,1)` and `(2,3,5)` | `c = (−1,1,1,3)`, `1/3`; `det K₀₀ = 0`, `c = (60,100,150,190)`, `Z = 1444`, `25/38` | true |
| `G_w` (Conventions, 9.1) | `w = (1,1,1)`; row formula | `G(0) = 1/3`; `G(0,−2) = √3/(2π) − 1/3`; `w₁G((m,−1)) = (−1)^m sin(θ₁m)/(πm)` by residues | sound |
| 9.2(a) | `θ = π/2`, `2π/3` | even `n` never in `W_{π/2}`, so "`n` or `n+2`" fails and "`n` or `n+1`" holds (`‖α‖ ≤ 2n^{−1/2}/π` is impossible for large `n`); `3 ∉ W`, `4 ∈ W` | true |
| `exists_ergodicGibbs_of_slope` (L9) | corners; `(1/2,0)`; `(1/2,1/4)` | `δ_{M_k}`; sine weights `(1,0,1)` not positive, edge case from 6.3; `(1, √2/2, √2/2)` liquid | true |
| `incompleteBetaKernel` (L9) | `v₁ = v₂`; vertical and horizontal neighbours; wrong side of crossing | `arg ξ/π = s`; `−(1−s−t)` and `s − Im ξ/π`; `Im ξ/π` and `Im ξ/(π\|ξ\|²)`; reversed convention gives a two-point value `> s` | sound |
| `incompleteBetaProcess_exists_unique` (L9) | `m = 0`; `ξ = e^{πi/3}`; slope `(0.3,0.45)`; limits `t → 0`, `s+t → 1`; uniqueness | `1 = 1`; `2/9 − √3/(6π) ≈ 0.1303` from both kernels; ratios `−0.8740`, `1.9511`, `1.2209`, determinants `0.0751`, `0.0342`; two-point value tends to `s` and to `s² − sin²(πs)/π²`; a tiling is fixed by `X(M)` when no two consecutive rows are empty | true |
| `LocalConvergence`, `localLimit_isLozengeGibbs` (L10) | translated hexagons; forced regions; `δ_{M_c}`; empty cylinder | limit not on plane tilings (exhaustion fails); `δ_{M_ε}`; not uniform, not Gibbs; mass `1` | true |

Dependency check (`gate --depcheck … --name DimerModelsAndLozengeTilings … --pr 16766`), full
output: `depcheck: 239 roadmaps, 2243 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.

Ownership against open work: `roadmaps grep` over the open heads and main for lozenge, dimer,
Kasteleyn, Gibbs specification, DLR, tail σ-algebra, determinantal, Thurston and height function,
and for the fully qualified Lean names, finds no second owner and no shared declaration name.
ClassicalErgodicTheory §8.6 (open) builds Bowen's Gibbs measures of a potential on a shift, a
different object; PointProcesses is not cited.

## Verified sound

- Declarations read: 57 of 57 (17 theorems, 37 definitions and structures, 3 instances); each
  theorem instantiated as in the table. No `lemma`, `set_option`, `#eval`, `True` placeholder,
  sorry'd data or second `Mathlib` import; `TauCeti.MeasureTheory.Group.ErgodicExtreme` exists at
  the pin. Every Lean name occurs in the README (checked by script).
- Padding probe: no declaration follows by one tactic or one library lemma, restates a definition
  or mirrors a Check; every definition is used by a stated theorem.
- Targets read: all 51 numbered sections and the Conventions; every `*Needs:*` line checked
  against the sections it names (one omission, R03).
- Checks: 162 read; about 140 recomputed by hand or by script (all of Layers 1–3, 6–9 and the
  Conventions witnesses; Layer 8 and 9.6–9.7 numerically). None false.
- Library declarations: about 90 Mathlib and 13 Tau Ceti names checked at the pins by grep, with the
  file and the line the README gives; all present, every stated line number correct. The pins have no Gibbs specification,
  Kasteleyn matrix, lozenge or height-function declaration.
- Sibling citations checked: 6 of 6 (VonNeumannAlgebras Layer 8 `V8.BernoulliArbitraryDiscrete`,
  FactorRigidity §8.3, ClassicalErgodicTheory §0.3 item 2 and §1.4 item 2 at its open head,
  TensorProductCombinatorics §1.1, RandomMatrices §8.3–8.4, GraphConnectivityAndFlows §6.7); none is
  consumed by a proof route.
- Source locators verified against the cached texts: 68 (aggarwal2023 15, gorin2021 18,
  kenyon2009 14, kos2006 9, sheffield2005 4, kenyon1997 4, okounkov-reshetikhin2003 3,
  cohn-kenyon-propp2001 1); all point at the statement cited.
- Policy: the pull request changes only `packages/DimerModelsAndLozengeTilings/`; no pull-request
  number or process narrative in the README or docstrings; every target has a locator.
- Wording and arrangement: 20 passages set beside their sources (the statements of 2.6, 2.7, 2.9,
  3.2, 4.5, 4.6, 5.2, 5.3, 5.4, 6.4, 7.2, 7.3, 8.2, 8.3, 9.2, 9.6, the Conventions bullets on the
  torus and the kernel, and the docstrings of `IsLozengeGibbs` and `thurston_tileable_iff`); nothing
  shared beyond formulas and standard names. Against the lectures of gorin2021: its Lecture 1 is
  split over Layers 1–2, Lectures 2–3 over Layers 3 and 8, Lecture 4 and 6 lie in Layer 9, and
  Lecture 13 is spread over Layers 4, 5, 6 and 10 on both sides of the torus layers; Lectures 5,
  7–12 and 14 on are not used. No run of layers maps one to one onto a run of lectures. No table,
  figure or list of exercises is taken over.

Source independence: 20 passages compared with 8 sources, none shared; largest share gorin2021,
49 of 171 locators; contents compared with gorin2021: independent.

## Not verifiable

- thurston1990 and georgii2011 (Theorem 14.15): uncertified, cited by locator alone; the statements
  used were checked against gorin2021 Theorem 1.4 and sheffield2005 Lemma 3.2.2 instead.
- The Lean text proposed in R01 was not elaborated: this pass runs no Lean.
- 9.2(b), 9.3 and 9.4 (Riemann sums on good tori, the limit measure, mixing): the routes were
  checked step by step and the kernel identities numerically, but the limit statements themselves
  cannot be tested on a finite instance.
- 2.4 (topological to combinatorial simple connectivity): route checked against the pinned
  statements of the lifting theorem; no instance beyond the three Checks.
- The printed numbering of gorin2021: the cached text is the author's pre-publication copy; theorem
  numbers were not compared with the printed book.

## Source issues

- **Error** in aggarwal2023 at Section 1.3, the remark after Definition 1.2, printed page 10: the source says a tiling of the whole lattice is determined by its type-1 positions unless there are none; it should be that it is determined when no two consecutive rows lack type-1 lozenges; affects nothing.
- **Error** in kenyon2009 at Section 5.4, the paragraph after the construction of the conditioned torus measures, printed page 29: the source says the extreme points of the invariant Gibbs measures of a given slope are the ergodic ones; it should be that this holds for extreme points of all invariant Gibbs measures, a slope fibre not being a face; affects the proof.
- **Error** in kenyon2009 at Theorem 6 and the sentence after the slope triangle in Section 5.4, printed pages 28–29: the source says there is a unique ergodic Gibbs measure for every slope of the closed triangle; it should be for every interior slope, edge slopes carrying several; affects a stated result.
- **Error** in gorin2021 at Lemma 4.7, Lecture 4: the source says that for large n either n or n + 2 lies in the set of good sizes; it should be n or n + 1, since for the angle π/2 no even n is good; affects the proof.
- **Gap** in gorin2021 at the proof of Lemma 13.7, Lecture 13: the source says the two normalised restrictions to an invariant event and its complement are Gibbs; it should first show that invariant events are almost surely tail events; affects the proof.
- **Gap** in kos2006 at Theorem 4.2, Section 4.3 (and gorin2021 Theorem 4.10): the source says the torus edge probability is a weighted sum of minors of the four inverse matrices; it should use complementary minors, one matrix being singular on the uniform 3 × 3 torus; affects a stated result.

## For the human reviewers

- **Licence.** `Suggested.lean:296-313` (`Specification`, `IsGibbs`: kernels for the exterior σ-algebra indexed by `Finset`, consistency by `∘ₖ`) has the shape of the public Lean project GibbsMeasure, from which Mathlib's `Kernel.IsProper` comes; not compared with that repository's text.
- **Licence.** gorin2021, the source with the largest share of locators (49 of 171), is read from the author's page copy of a Cambridge University Press book (`sources.toml`, `licence_class = "author-page"`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3e57c8cf4bf3ee98b2839a5e702e346a8d5b816f", "job": "RT-DimerModelsAndLozengeTilings~1a", "model": "fable", "worker": "chris-x82"} -->
