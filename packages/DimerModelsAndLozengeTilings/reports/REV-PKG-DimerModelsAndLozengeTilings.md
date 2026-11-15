<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16766#issuecomment-6897688883 -->
Review (claude) of 80141fe

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Scope does not name the open roadmap that also builds Bernoulli actions

   - **Location.** `packages/DimerModelsAndLozengeTilings/README.md` lines 96–104: "the Bernoulli shift
     of an infinite discrete group `Γ` on `S^Γ` … which VonNeumannAlgebras owns … and its extension …
     which FactorRigidity §8.3 builds; 4.3 is a kept variant".
   - **Claim.** The paragraph lists every roadmap that builds the `I = Γ` case of 4.3.
   - **Witness.** The open roadmap ClassicalErgodicTheory, §0.3 item 2 ("For every countable discrete
     group `G`, construct the Bernoulli action on `G → α`") and §1.4 item 2 (mixing of Bernoulli
     actions of infinite countable groups), builds the same object. The README never names it.
   - **Repair.** After "which FactorRigidity §8.3 builds" insert ", and the Bernoulli action of a
     countable discrete group `G` on `G → α` with its mixing, which ClassicalErgodicTheory §0.3 and
     §1.4 build". The kept-variant clause that follows already states the difference (a proper action
     on an index set with several orbits, any law, tail triviality). Tested: with this sentence added
     the dependency check still prints `depcheck: 245 roadmaps, 2233 edges, 0 problem(s)`. It is a
     scope deferral, not a supplier: add no `*Needs:*` line and no supplier-contract entry.

2. **F02** (P3) Docstring of `Subshift` names the additive Mathlib structure

   - **Location.** `packages/DimerModelsAndLozengeTilings/Suggested.lean` lines 258–260: "Mathlib's
     `SymbolicDynamics.FullShift.Subshift` is the case `I = Γ`".
   - **Claim.** For `[Group Γ] [MulAction Γ I]` the Mathlib structure with `I = Γ` is `Subshift`.
   - **Witness.** At the pin, `Mathlib/Dynamics/SymbolicDynamics/Basic.lean` line 233 is
     `structure Subshift … [AddMonoid G]` (additive shift) and line 253 is `structure MulSubshift`
     (`[Monoid G]`, `mulShift`). README lines 1045–1046 and 1150 say `MulSubshift` correctly.
   - **Repair.** In the docstring write "Mathlib's `SymbolicDynamics.FullShift.MulSubshift` (additively
     `SymbolicDynamics.FullShift.Subshift`) is the case `I = Γ`". No statement changes.

3. **F03** (P3) The face property is cited to a lemma that does not state it

   - **Location.** `Suggested.lean` lines 371–373, docstring of `lozengeGibbsInvariant_isExtreme`:
     "(README 5.4, the lozenge instance of 5.3; gorin2021 Lemma 13.7, lines 4561–4582)"; README 5.4,
     lines 1430–1434, the same parenthesis for both Lean names.
   - **Claim.** gorin2021 Lemma 13.7 supports "the invariant Gibbs measures form a face of the
     invariant probability measures".
   - **Witness.** gorin2021 lines 4561–4562 state only that an extreme invariant Gibbs measure gives
     invariant events probability 0 or 1; its proof (lines 4574–4582) conditions on an invariant event.
     The face statement is sheffield2005 line 1370, in Lemma 3.2.2 (lines 1367–1371).
   - **Repair.** In the docstring replace the Gorin locator by "sheffield2005 Lemma 3.2.2, lines
     1367–1371; georgii2011 Theorem 14.15". In README 5.4 write "(sheffield2005 Lemma 3.2.2, lines
     1367–1371, for the face property; gorin2021 Definition 13.6 and Lemma 13.7, lines 4556–4582, and
     kenyon2009 lines 825–835, for the two notions of ergodicity)". The docstring of
     `lozengeGibbs_extreme_iff_ergodic` keeps its locators, which do support one direction.

4. **F04** (P3) "gorin2021 lines 4638–4642" is cited for statements those lines do not make

   - **Location.** README 6.2, line 1508: "Each of these point masses is an ergodic Gibbs measure
     (gorin2021 lines 4638–4642; kenyon2009 Exercise 13, line 891)"; the same locator in 1.6 (lines
     630–631) and 6.3 (line 1541).
   - **Claim.** The cited lines state that the frozen point masses are ergodic Gibbs measures and
     describe the measures of edge slopes.
   - **Witness.** gorin2021 lines 4638–4642 only define an "extreme" slope (one proportion zero). The
     three frozen measures as components of an invariant Gibbs measure are gorin2021 Exercise 13.3
     (lines 4520–4526) and Exercise 13.9 (lines 4583–4585).
   - **Repair.** In 6.2 cite "gorin2021 Exercises 13.3 and 13.9, lines 4520–4526 and 4583–4585;
     kenyon2009 Exercise 13, line 891". In 1.6 and 6.3 write "the extreme slopes of gorin2021 lines
     4638–4642" so that the locator is attached to the definition it contains; the statements of 1.6
     and 6.3 are proved in the README and keep sheffield2005 Theorem 9.5.1 as their source.

Four findings, all P3 (0 blocking). No statement of `Suggested.lean` or of the sampled README
targets was found false, vacuous or unowned; the elaboration passes with `sorry` as the only
warning; the dependency check reports no problem. The four repairs are a scope clause, a docstring
name and two locators.

Previous review of this package: none. Maintainer notes: none.

## Verified sound

**Elaboration.** `lake env lean` on `packages/DimerModelsAndLozengeTilings/Suggested.lean` from the
content repository: exit 0, 17 warnings, each `declaration uses sorry`, at lines 115, 168, 184, 198,
234, 245, 330, 342, 374, 385, 407, 420, 451, 488, 501, 521, 551; no other message. Imports:
`import Mathlib` and `TauCeti.MeasureTheory.Group.ErgodicExtreme` (used by
`Specification.gibbsInvariant`). No `set_option`, `#eval`, `#print`, `lemma`, `opaque`, sorried
data or admitted `example`.

**Signatures.** `#check @name` on the 16 declarations with implicit binders, on a scratch copy:
every theorem carries its hypotheses in its own signature (`gibbsInvariant_isExtreme`:
`[Group Γ] [Countable Γ] [Infinite Γ] [MulAction Γ I] [Countable I] [DecidableEq I] [Finite S]
[TopologicalSpace S] [DiscreteTopology S] [MeasurableSpace S] [DiscreteMeasurableSpace S]`, the
properness hypothesis, `X`, `γ`, `γ.IsEquivariant`); nothing lost, nothing changed.

**One-tactic probe, all 17 sorried theorems.** Each `sorry` replaced by
`first | rfl | (simp; done) | infer_instance | (constructor <;> simp; done) | (intros; simp_all; done) | …`:
17 of 17 fail. `gibbsInvariant_extreme_iff_ergodic` and `lozengeGibbs_extreme_iff_ergodic` follow
from the face theorems and Tau Ceti's `ErgodicSMul.iff_mem_extremePoints`, but that lemma needs
`MeasurableConstSMul Γ X` (README 4.4 API) and, for the lozenge form, the transport to
`Multiplicative (ℤ × ℤ)`; neither closes in one step. No padding found; all 40 definitions and
instances are used by a headline statement.

**Headline theorems (README summary, lines 18–28) against `Suggested.lean`.**
1.5 `tilingSubgraph_bijOn`; 2.5 `tilingOfHeight_bijOn`; 2.8 `flip_connected`; 2.9
`thurston_tileable_iff`; 3.2 `partitionFunction_eq_abs_det`; 3.3 `lozenge_correlation_eq_det`; 4.6
`gibbsInvariant_isExtreme`, `gibbsInvariant_extreme_iff_ergodic`; 5.4
`lozengeGibbsInvariant_isExtreme`, `lozengeGibbs_extreme_iff_ergodic`; 6.3
`slopeEdge_ergodicGibbs_equiv`, `two_ergodicGibbs_of_slopeEdge`; 7.3
`torusLimit_mem_gibbsInvariant_slope`; 8.3 `torus_partitionFunction_eq`; 9.5
`exists_ergodicGibbs_of_slope`; 9.7 `incompleteBetaProcess_exists_unique`; 10.2
`localLimit_isLozengeGibbs`. 5.3 is named in the module docstring as not stated separately, with
the reason (its statement needs the constructed kernels of 5.2); it is 4.6 applied to that
specification, and both 4.6 and the lozenge instance are stated. I did not count it as an absent
headline.

**Names.** All 57 Lean names occur in the README; every backticked name the README attributes to
this roadmap is declared in the Lean file (script over both files: none missing).

### Adversarial table (computed values)

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| Conventions: faces, edges, lozenge types | `W(v)`, `B(v)`, edges `(v,1)`, `(v,2)`; aggarwal2023 lines 346–361 | `(v,1) ∈ W(v), B(v−e₂)`; type 1 vertices `(a,b−1),(a,b),(a+1,b),(a+1,b+1)` = Aggarwal's with `(x,y)=(a,b−1)`; type 2 likewise with `(x,y)=(a−1,b)` | agree |
| Rotation `ρ(x,y)=(−y,x−y)` and `H_{ρM}(w)=H_M(ρ⁻¹w)+w₁` | `ρ³`; `M₁→M₂`, `M₂→M₃`, `M₃→M₁` | `ρ²(x,y)=(y−x,−x)`, `ρ³=id`; `(w₂−w₁)+w₁=w₂`; `−w₁+w₁=0`; `0+w₁=w₁` | agree |
| 1.4 `IsTiling`; 1.5 `tilingSubgraph_bijOn` | `R=∅`; `{W(0)}`; unit hexagon | `∅`: one tiling `∅`, one perfect matching of the empty graph; `{W(0)}`: 0 and 0; hexagon: `T_a`, `T_b` checked face by face, 6-cycle has 2 matchings | true |
| 2.5 `tilingOfHeight_bijOn` | increments `(a,b,a+b)` round `W(v)`; `M₁`, `M₃`; `H=x+y` | `(0,0,0)→(v,3)`, `(1,0,1)→(v,1)`, `(0,1,1)→(v+e₁,2)`: exactly one edge each; `H_{M₁}=x` has `e₃`-increment 1 = `1−[(v,3)∈M₁]`; `x+y` has `e₃`-increment 2, rejected | true |
| 2.7 boundary heights | unit hexagon from `h(1,0)=0`; strip; wedge `W(0)∪B(1,1)` | hexagon: `0,0,0,−1,−1,−1`, loop closes (`−1+1=0` at the last diagonal edge); strip: `0` versus `1` on `y=1`; wedge: `c₀` sums to `−1` round `W(0)`, no `h` | Checks hold |
| 2.8 `IsFlip`, lattice formulas | `T_a` at `v=0` | `T_a ⊇ {(0,3),(−e₁,1),(−e₂,2)}`, image `{(0,1),(0,2),(−e₃,3)} = T_b`; flip condition `H(e_k)=H(0)=H(−e_k)+1` holds for `k=1,2,3` on `T_a`; `H_min ≤ H ≤ H_max` from `H(v)−H(u) ≤ ρ_R(u,v)` | true |
| 2.9 `thurston_tileable_iff` | hexagon; `{W(0)}`; `R₆'`; wedge | `R₆'`: `W(0,0)` and `W(1,0)` each adjacent in `R₆'` only to `B(1,0)`; boundary `h` = `0,0,0,0,1,1,1,1`; `h(1,1)−h(2,1)=1 > 0 = positiveSteps` of the one-dart walk; converse direction: `min_u(h(u)+ρ)` has increments in `{0,1}` (a positive step adds ≤ 1, a negative one ≤ 0) | true, both directions |
| 3.2 `partitionFunction_eq_abs_det` | hexagon unit and type weights; `R₆'`; `R_ring`; `{W(0)}`; wedge | `det[[c,0,a],[b,a,0],[0,c,b]] = 2abc`; `det[[1,0,0],[1,0,0],[1,1,1]] = 0`, no tiling; `R_ring`: 12-cycle verified edge by edge, 2 tilings, 6-cycle odd, `det = 0 ≠ 2` (simple connectivity needed); `{W(0)}`: no `σ`; wedge: `K=[0]`, `Z=0` | true |
| 3.3 `lozenge_correlation_eq_det` | hexagon, `n=0,1,2`; repeated face; repeated pair | cofactors of `[[1,0,1],[1,1,0],[0,1,1]]`: `K⁻¹(B(0),W(0))=1/2`, `K⁻¹(B(0),W(−e₁))=1/2`, `K⁻¹(B(−e₃),W(0))=−1/2`, `K⁻¹(B(−e₃),W(−e₁))=1/2`; `det=1/4+1/4=1/2`; `n=0`: `1=1`; equal `g`: two equal rows, `0=0`; repeated pair: left `1/2`, right `0`, excluded by injectivity | true; injectivity needed |
| Restricted Leibniz witness (Conventions) | `A=[[1,2,0],[0,1,3],[4,0,1]]` | `det A=25`; adjugate `[[1,−2,6],[12,1,−3],[−4,8,1]]`; `det[[12,−3],[1,6]]/625=3/25`; `25·3/25=3=A(1,2)` | agree |
| 4.2, 4.6 face property | trivial group on a point; nonamenable `Γ`; `I=∅`; `S=∅` | trivial group: invariant event of mass `1/2` not tail (excluded by `Infinite Γ`); route uses only `μ(A Δ γC)=μ(A Δ C)` and properness, no averaging; `I=∅` or `S=∅`: `X` has ≤ 1 point, face trivial | true; `Infinite Γ` needed; `Finite S` not needed by the face statement (note, no change) |
| 4.5 `Specification`, order of `∘ₖ` | Mathlib `comp` at the pin; `Bern(1/2)`/`Bern(1/3)` Check | `(η ∘ₖ κ) a = (κ a).bind η`, so `comp_eq` is `γ_Δ γ_Λ = γ_Δ`; composite gives `1/2` against `1/3` | convention pinned |
| 5.4 `IsLozengeGibbs` | `F=∅`; empty configuration; `E` without the neighbours of `F` | `F=∅`: `ω=ω'`; empty configuration: both cylinders null, excluded by the concentration clause; with `E ⊇` all edges of faces meeting `F`, `ω'`|F glued to any `η ∈ [ω]_E` is a plane tiling, so both cylinders have conditional mass `1/N(η)` | equivalent to the uniform specification |
| 6.1 slope | `δ_{M₁},δ_{M₂},δ_{M₃}`; `ρ` | `(1,0),(0,1),(0,0)`; `ρ_*`: `(1−s−t,s)`, `(1,0)↦(0,1)↦(0,0)↦(1,0)` | agree |
| 6.3 `slopeEdge_ergodicGibbs_equiv`, `two_ergodicGibbs_of_slopeEdge` | `s=0`, `s=1`; a tiling without type 2; `β_s` | columns forced: `(x,y),3 ∈ M ⇒ (x,y±1),3 ∈ M`; finite change of `M_ε` impossible (height constant on vertical lines); `σ∘rowCode = rowCode∘τ_{e₁}`; `P(ε₀=ε₁=1)`: `s²` versus `(s+s²)/2`, at `s=1/2`: `1/4`, `3/8`; edges by `ρ`: `(s,0)↦(1−s,s)↦(0,1−s)` | true |
| 7.3 `torusLimit_mem_gibbsInvariant_slope` | `n=0`; `E=∅`; slope | `⌊ns⌋+⌊nt⌋ ≤ n`, set nonempty for `n ≥ 1`; `E=∅` gives `ν(univ)=1`; `μ_n{(0,1)∈M}=⌊ns⌋/n → s` | true |
| 8.1 `twistedKasteleyn`, 8.3 `torus_partitionFunction_eq` | brute force over all torus tilings, random integer periodic weights of both signs, the Lean matrix transcribed entry by entry | sizes `(n₁,n₂)` and (number of tilings, both sides): `(1,1)`: 3, `−3=−3`; `(1,2)`: 5, `−16`; `(2,1)`: 5, `1`; `(2,2)`: 9, `−433`; `(2,3)`: 17, `−68`; `(3,2)`: 17, `−4442`; `(3,3)`: 42, `18951`; `(1,3)`: 9, `−124`; `(1,4)`: 17, `18`; `(4,2)`: 33, `−6442`; equal in all ten | true, including `n=1` and signed weights |
| 8.2 sign formula | parity check | `Σ_{a,b} ε_{ab}(−1)^{bh₁+ah₂}·c = 4·[h₁,h₂ even] − 2(−1)^{h₁h₂+h₁+h₂} = 2` in all four parity classes | agree with 8.3 |
| 8.3 Checks | `1×2` unit and signed weights | `det K_{ab}=(w₃+(−1)^a w₂)²−(−1)^b w₁²`: `3,5,−1,1`, `(3+5+1+1)/2=5`; signed: `−1,1,−1,1`, `(−1+1+1+1)/2=1`, tilings `1+1+1−1−1=1` | agree |
| 9.1 `G_w` witness | `w=(1,1,1)`, residues in `θ` | `G(0)=(1/2π)(4π/3)(1/2)=1/3`; `G(0,−2)=(√3−2π/3)/(2π)=√3/(2π)−1/3`; inverse identity `w₃G(d)+w₁G(d−e₂)+w₂G(d+e₁)=[d=0]` | agree |
| 9.5 `exists_ergodicGibbs_of_slope` | `w(s,t)` at `(0.3,0.45)`, `(0.5,0.25)`, `(0.2,0.1)` | numerical `(w₁G(−e₂), w₂G(e₁), w₃G(0))` = `(0.3,0.45,0.25)`, `(0.5,0.25,0.25)`, `(0.2,0.1,0.7)` | slopes as claimed |
| 9.6 `incompleteBetaKernel`, 9.7 `incompleteBetaProcess_exists_unique` | the Lean polygonal paths, Simpson quadrature; `det[w₁G_w(v_i−v_j−e₂)]` against `det[K_ξ(v_i;v_j)]` | `K_ξ(v;v)=s` (0.33333, 0.3, 0.5, 0.2); pair `(0,0),(0,1)` at `(1/3,1/3)`: `0.13033 = 0.13033 = 2/9−√3/(6π)`; at `(0.3,0.45)`: `0.07507 = 0.07507`; triple `(0,0),(1,2),(−1,1)`: `0.03421 = 0.03421`; row pair at `s=1/2`: `0.14868 = 1/4−1/π²`; four points at `(0.2,0.1)`: `0.0013 = 0.0013`; slope from `ξ`: `(arg ξ/π, −arg(1−ξ)/π)=(s,t)` | agree; `m=0`: `1=1`; non-injective `v`: right side 0, excluded |
| 9.7 uniqueness clause | tilings with equal `X(M)` | `H=1_{x>0}` on `y ≤ 0` continued by `H=1` or `H=y`: two height functions, same `X(M)={(0,y):y≤0}`; excluded because rows are almost surely nonempty (row gap probability is determined by the correlations) | true as stated |
| 9.2 good sizes | `θ=π/2`; `θ=2π/3` | even `n`: distance 0; odd `n`: `π/(2n) > n^{−3/2}`; `n=4`: `π/12 ≈ 0.262 > 0.125`; `n` or `n+1`: `|θ/π+m| ≤ c/√n` impossible for large `n` | true |
| 10.2 `localLimit_isLozengeGibbs` | `E=∅`; hexagons without exhaustion; a face of the window | `ν(univ)=1`; without `hexh` the limit `(δ_{T_a}+δ_{T_b})/2` is not on plane tilings; with it each face has one edge with probability 1 for large `N`, and the swap of `ω`|F for `ω'`|F is a bijection of tilings of `R_N` | true |
| 10.3 hexagon Check | `A=B=C=1` | vertices `(0,0),(1,0),(0,1),(1,2),(2,2),(2,1)` = neighbours of `(1,1)` | agree |

### Library declarations opened at the pins

Mathlib at `2fd255d`, Tau Ceti at `1b1ccf4`. Every file and line the README gives was opened;
all match: `infinitePi_map_piCongrLeft` (ProductMeasure.lean 494), `iIndepFun_infinitePi`
(InfinitePi.lean 124), `iIndepFun_iff_iIndep`, `iIndepFun.precomp` (Independence/Basic.lean 231,
323), `Pi.borelSpace` 645, `DiscreteMeasurableSpace.toBorelSpace` 673, `Subtype.borelSpace` 188,
`Bool.borelSpace` 697, `Bool.instMeasurableSpace := ⊤`, the `CompactSpace (ProbabilityMeasure E)`
instance (Prokhorov.lean 176), `tendsto_measure_of_isClopen_of_tendsto` (Portmanteau.lean 362),
`measurableCylinders` 275, `isPiSystem_measurableCylinders` 335, `univ_mem_measurableCylinders` 345,
`generateFrom_measurableCylinders` 366, `cylinderEvents` 409, `cylinderEvents_mono` 415,
`cylinderEvents_le_pi` 418, `Filtration.cylinderEventsCompl` 534, `isSetRing_measurableCylinders`
57, `IsPiSystem.comap` 106, `exists_measure_symmDiff_lt_of_generateFrom_isSetRing` 86, `Kernel`
55/70, `IsMarkovKernel` 138, `Kernel.comp` 50 (`η ∘ₖ κ` applies `κ` first), `Kernel.comap` 152,
`measurable_id''` 233, `MeasurableSpace.comap_mono` 121, `Kernel.IsProper` 47 (a structure whose
field uses `𝓑 ⊓ 𝓧`; no measurability of the kernel beyond its type, no Markov property),
`isProper_iff_inter_eq_indicator_mul` 57, `IsProper.setLIntegral_eq_comp` 73, `Kernel.Invariant`
39, `Subshift` 233, `MulSubshift` 253, `mulShift` 150, `isOpen_cylinder` 214, `isClosed_cylinder`
219, the two zero-one laws 229 and 290, `ErgodicVAdd` 31, `ErgodicSMul` 43,
`VAddInvariantMeasure` 51, `IsExtreme` 63 (a structure: `B ⊆ A` and the left-endpoint clause),
`Set.extremePoints` 70, `IsCoveringMap.existsUnique_continuousMap_lifts` 489,
`AddCircle.isCoveringMap_coe` 32, `IsSimplyConnected` 137,
`tendsto_integral_exp_inner_smul_cocompact` 177, `SimpleGraph.fromRel` 135, `toSubgraph` 574,
`Walk.darts` 123, `Set.BijOn` 318, `Relation.ReflTransGen` 374, `arrowAddAction` 101 (a `def`),
`uniformOn` 60, `Measure.real` 102, `Measure.bind` 235, `Matrix.submatrix` 457, `Ergodic` 49,
`MeasurePreserving` 44, `isPerfectMatching_iff` 254. Tau Ceti: `invariantMeasuresOfMeasureUnivEq`
(ErgodicExtreme.lean 75), `ErgodicSMul.iff_mem_extremePoints` 239 (needs `[Group G] [Countable G]
[MulAction G X] [MeasurableConstSMul G X]`, probability measure), `exists_smul_invariant_ae_eq`
53, `ergodicSMul_iff_forall_smul_invariant` 68, `isExtreme_setOf_measure_eq_zero` (Face.lean 40),
`tailFamily` 42, `tailProcess` 47, `tailProcess_eq_iInf_tailFamily` 64, `arrayTail` 43,
`det_submatrix_comp_inr_eq_sign_mul_det_mul_det_submatrix_comp_inl_nonsing_inv` 160,
`det_mul_det_submatrix_adjugate` 54, `ergodic_shift_infinitePi_const` 63,
`TauCeti.IsPerfectMatching`, `Matrix.gibbsState`.

Duplication by object: a search of both pinned libraries for Kasteleyn matrices, lozenges, dimers,
height functions, Gibbs specifications and `IsGibbs` finds only the Fortuin–Kasteleyn–Ginibre
inequality, a link to an external Gibbs-measure project in a module docstring
(`Mathlib/Probability/CondVar.lean` line 22) and `Matrix.gibbsState`. Nothing the package states
exists at the pins. `slope` and `Subshift` share short names with Mathlib declarations (`slope`,
`SymbolicDynamics.FullShift.Subshift`) but live in the roadmap's namespace and are different
objects.

### Cross-roadmap citations resolved (main)

VonNeumannAlgebras target V8.BernoulliArbitraryDiscrete (README line 2788: infinite discrete `Γ`,
finite `S`, at least two positive weights — as the scope paragraph says); FactorRigidity §8.3
"Bernoulli enlargements and the descent lemma"; TensorProductCombinatorics §1.1 "The lattice,
rhombi and hives"; RandomMatrices §8.3 and §8.4; GraphConnectivityAndFlows §6.7. All are scope
deferrals; the package names no roadmap supplier and declares no gap (`design/plan.json`:
`"gaps": []`).

### Dependency check

    depcheck: 245 roadmaps, 2233 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The merge order lists the roadmap at line 412.

### Duplication and overlap audit

`scratch/overlaps.md`: no other open pull request changes this roadmap, no cited id is dropped, no
id is defined only by an open revision, no second copy. Searches of the open heads and main, by
object: "Kasteleyn" (only the Fortuin–Kasteleyn identity of TemperleyLiebOperatorAlgebras, a
different object), "lozenge" and "dimer" (no match), "subshift", "Gibbs", "Bernoulli shift",
"tail σ-algebra", "determinantal", "perfect matching", and the declaration names of the Lean file
(no match for any).

Overlap check: read ClassicalErgodicTheory, Exchangeability, ProbabilisticAndMetricNumberTheory
(and VonNeumannAlgebras V8, FactorRigidity §8.3, RandomMatrices §8.3–8.4); Bernoulli action of a
countable group on `G → α`: VonNeumannAlgebras on main for finite `S`, also built by the open
ClassicalErgodicTheory, this roadmap keeps only the proper-action variant 4.3 (R01); `ℕ`-indexed
tail σ-algebra: Tau Ceti `tailProcess`, cited; Gibbs measures of ClassicalErgodicTheory §8.4–8.6 are
the Bowen property of an invariant measure of a map, a different object from a specification's
Gibbs measures; its subshifts are Mathlib's `Subshift` over `ℤ`, cited there and here; nothing else
shared.

Ownership against open pull requests was checked through the roadmap search over the open heads
listed in the brief.

### Shape and style

Summary, Scope and ownership, Conventions, Exact supplier contracts (From Mathlib, From Tau Ceti),
How to read the build, ten layers each ending with Examples and Dependencies, Downstream consumers,
Worked examples, References. Every numbered target has at least three Checks (2.7 has four, 4.4
four, 4.5 four, 5.4 five, 8.3 four, 8.4 four, 9.7 four). No LaTeX delimiters, no pull-request
numbers, dates, paths, HTML anchors, field lists or target-numbering tables; no layer named after
a source. The layer order is forced where it matters (2.8 → 3.2; 4.6 → 5.3 → 5.4; 8.3 → 8.4 → 9.3)
and Layer 4 is independent of Layers 1–3, as the README says.

### Sources: the seeded sample, read at the locators

All ten manifest entries are present; eight texts read, two settled as uncertified.

- 1.4: aggarwal2023 lines 342–364 (dimer covering as perfect matching of the dual graph, the three
  types), 380–383 (free tilings); gorin2021 lines 690–702. Supported.
- 2.5: aggarwal2023 lines 384–399; gorin2021 lines 447–458 (increments `+1`, `−2`); kenyon2009
  lines 353–367. Supported; the README's height is its own normalisation with the conversion
  stated.
- 2.7: aggarwal2023 lines 403–407; gorin2021 lines 511–514. Supported.
- 2.8: gorin2021 lines 756–782 and the footnote at 765–769; kenyon2009 lines 537–550;
  cohn-kenyon-propp2001 Section 1.4, lines 404–412 (join and meet of height functions, for
  dominos). Supported.
- 2.9: gorin2021 Theorem 1.4 at lines 521–526, Corollary 1.5 at line 613. Supported.
- 3.2: gorin2021 Theorem 2.1 at 714–717, Theorem 3.1 at 1218–1219; kenyon2009 Theorem 2 at line
  504; kenyon1997 Theorem 2 at 184–186. Supported.
- 4.2: sheffield2005 lines 1341–1344 (tail σ-algebra), Lemma 3.2.2 at 1367–1371, which itself
  refers to Georgii's Theorem 14.15 (line 1366). The README presents 4.2 as an ingredient with its
  own route; consistent with the text.
- 5.1: kenyon2009 lines 96–100; gorin2021 lines 4494–4501. Supported.
- 6.1: aggarwal2023 lines 421–431 and 453–456; gorin2021 Definition 13.10 from line 4590; kos2006
  lines 203–205; kenyon2009 lines 829–832. Supported.
- 6.3: sheffield2005 Theorem 9.5.1 at 6195–6198 (the general statement); kenyon2009 Exercise 13 at
  line 891; gorin2021 lines 4638–4642 (see R04).
- 8.1: gorin2021 Definition 3.9 at 1452–1457; kenyon1997 Section 4.1 at 380–390. Supported.
- 8.3: gorin2021 Theorem 3.10 and table (3.4) at 1458–1472 (`ε_{ab} = −1` exactly at
  `(a,b) = (n₁,n₂)` modulo 2, as the README states); kenyon2009 equation (3) at line 724 (`n` odd);
  kenyon1997 Lemma 7 at 392–396 (both even); kos2006 lines 657–666. Supported.
- 9.4: kenyon1997 lines 85–93; kos2006 lines 732–735; kenyon2009 Section 6.2 from line 1011.
  Supported.
- 9.5: kos2006 Theorem 2.1 at 215–220; kenyon2009 lines 836–843; gorin2021 Corollary 6.3 at
  2287–2298. Supported.
- 10.3: aggarwal2023 Theorem 1.5 at 572–580, Example 1.1 at 370–375. Supported.
- Also read for the headlines: aggarwal2023 Definitions 1.2–1.3 (463–476) and equation (1.2)
  (491–507); okounkov-reshetikhin2003 Definition 4 (965–968) and Theorem 2 (993–1006); sheffield2005
  Section 1.1.2 (303–342) and Lemma 3.2.1 (1352–1360); gorin2021 Theorem 3.5 (1281–1288), Lemma
  4.7 (1766), Definitions 13.1–13.6 and Lemma 13.7 (4509–4582); kenyon2009 Corollary 3 (557–565),
  lines 844–866; kos2006 Theorems 4.2–4.3.
- The author flagged no locator as unverified.

### Copyright, licences and scope

Wording: 18 passages of the README and of the Lean docstrings set beside the texts at their
locators (the statements of 1.4, 2.5, 2.9, 3.2, 3.3, 4.5, 4.6, 5.4, 6.1, 7.2, 8.1, 8.3, 9.5, 9.6,
9.7, 10.3, the Conventions paragraph on heights, the docstring of `IsLozengeGibbs`). None
reproduces a source sentence; the longest shared runs are formulas and standard names. Arrangement:
gorin2021 has the largest share, 49 of 168 locators. Its lectures 1, 2, 3, 4, 6 and 13 are used;
Layer 4 has no counterpart there, Layers 5, 6 and 10 draw on Lecture 13 and precede Layers 7–8
(Lecture 3.3) and Layer 9 (Lectures 4, 6, 13); no run of layers maps one to one onto a run of
lectures. Reuse: the 3 × 3 hexagon matrix of 3.1 coincides with the worked example of gorin2021
lines 722–744; the README derives it in its own coordinates, extends it to type weights (`2abc`)
and uses it as a Check; table (3.4) of gorin2021 is restated as a rule, not copied.

Source independence: 18 passages compared with 7 sources, none shared; largest share gorin2021, 49
of 168 locators; contents compared with gorin2021: independent.

## Not verifiable

- thurston1990 and georgii2011: recorded as uncertified, cited by locator only; not read.
- kenyon1997 Theorems 2 and 6, Lemmas 7 and 8: the sentences are readable at the cited lines, the
  displayed formulas are lost in the text extraction; the formulas were checked against
  kenyon2009 and gorin2021 instead.
- gorin2021 Definition 3.9 speaks of "the vertical side of `F` with `n₁` vertices"; the figure
  is not readable in the extraction. The pairing of `a` with `n₁` used by the README was confirmed
  from the proof (lines 1480–1482: loop length `n₁u + n₂v`, sign `(−1)^{…+au+bv}`) and by the
  brute-force computation above, not from the figure.
- gorin2021 lines 1748–1763: the display defining `W_θ` is interleaved with page markers; the
  statement of Lemma 4.7 at line 1766 is readable.

## Source issues

- **Error** in gorin2021 at Lemma 4.7, lines 1766–1780: the source says that for large `n` either `n` or `n + 2` lies in `W_θ`; it should be `n` or `n + 1`, since for `θ = π/2` no even `n` lies in `W_θ`; affects the proof.
- **Error** in kenyon2009 at Theorem 6 and Section 5.4, lines 836–839 and 858–866: the source says there is a unique ergodic Gibbs measure for every slope of the closed triangle and that the invariant Gibbs measures of a given slope reduce to one point; it should restrict uniqueness to interior slopes, and the fibre over `(1/3,1/3)` also contains the equal mixture of the three frozen measures; affects a stated result.
- **Error** in aggarwal2023 at the remark after Definition 1.2, lines 465–467: the source says a plane tiling is determined by its type-1 positions unless that set is empty; it should require type-1 lozenges in the rows (two tilings share the positions `{(0,y) : y ≤ 0}`); affects nothing.

## For the human reviewers

- **Licence.** gorin2021 was read from the author's page as a pre-publication copy of a Cambridge University Press book (`sources.toml`, `licence_class = "author-page"`); the README cites the printed numbering.
- **Licence.** The field `Specification.comp_eq` (`Suggested.lean` lines 304–306) has the shape I recall of the consistency field in the public GibbsMeasure formalisation linked from `Mathlib/Probability/CondVar.lean` line 22; names and carrier differ; that repository was not opened.
- **Scope.** Kasteleyn's theorem is stated for hexagonal-lattice regions only; the general planar theorem, interior uniqueness and Aggarwal's theorem go to a Part II that no pull request or package carries yet (README lines 127–135).
- **Licence.** The 3 × 3 unit-hexagon matrix and its column-swap remark in README 3.1 (lines 951–953) coincide with the worked example of gorin2021 lines 722–744; the README cites it and adds type weights.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "80141fe701d6a22fc02f22a22215e780da182115", "job": "REV-PKG-DimerModelsAndLozengeTilings", "model": "fable", "worker": "chris-x83"} -->
