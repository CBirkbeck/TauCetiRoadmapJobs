<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/6570#issuecomment-6658302174 -->
Review (claude) of 229fbb7

Verdict: needs_changes

1. **F01** (P3) 4.1 should cite Tau Ceti's `tailProcess`

   - **Location.** `packages/DimerModelsAndLozengeTilings/design/README.md` line 218 ("At that pin
     Mathlib has ... no tail σ-algebra of a product space") and lines 231–235 (the Tau Ceti holdings,
     which list only the one-map invariant σ-algebra and `ergodic_shift_infinitePi_const`); target 4.1
     (line 770), API bullet "For `I` countable, `𝓣` is the `limsup` along the cofinite filter".
   - **Claim.** The tail σ-algebra of 4.1 is new to the library.
   - **Witness.** `TauCeti/Probability/Process/Tail/Basic.lean` line 47 at the pin defines
     `TauCeti.Probability.tailProcess X := limsup (fun k => comap (X k)) atTop` for an ℕ-indexed
     process, with `tailProcess_eq_iInf_tailFamily` (line 64); `TauCeti/Probability/Exchangeability/Arrays/Tail.lean`
     line 73 has the ℕ×ℕ version `arrayTail`. Along an enumeration of the countable index set `I`, 4.1's
     `𝓣 = ⋂_Λ 𝓕_{Λᶜ}` is exactly `tailProcess` of the coordinate process, which is the "limsup form"
     4.1 restates.
   - **Repair.** In "From Tau Ceti" add `TauCeti.Probability.tailProcess` and
     `tailProcess_eq_iInf_tailFamily` (file and line); in Scope say in one clause how 4.1 differs (an
     arbitrary countable index with a proper group action, equivariance); replace the limsup API bullet
     by "for an enumeration `e : ℕ ≃ I`, `𝓣` equals `tailProcess (fun k ω => ω (e k))`", which is
     the statement Mathlib's zero-one law consumes. Tested on `I = ℤ`, `S = {0,1}`: the event
     "infinitely many ones" is tail for both definitions, `ω(0) = 1` for neither.

2. **F02** (P3) 2.7, second part: the tilings must have height functions

   - **Location.** README line 541: "If the boundary graph of `R` is connected, any two tilings of `R`
     have height functions that agree on `∂R` once normalised"; `plan.json` target 2.7, hypotheses
     "boundary graph connected (second part)".
   - **Claim.** Connectedness of the boundary graph alone gives a well-defined boundary height.
   - **Witness.** Height functions of tilings exist only for exact height cochains (2.6 needs
     `IsSimplyConnectedRegion R`); 2.6's own Check 2 exhibits the tiling `T` of `R_ring` whose cochain
     sums to `−1` around `W(0)` and has no height function, so the sentence presupposes a hypothesis
     it does not state.
   - **Repair.** State the second part as "If `R` is simply connected (or, more generally, for any two
     tilings of `R` whose height cochains are exact) and the boundary graph of `R` is connected, their
     height functions agree on `∂R` once normalised at a common boundary vertex", and add the
     hypothesis to `plan.json`. On the unit hexagon the repaired statement gives
     `h = (0,0,0,−1,−1,−1)` for both `T_a` and `T_b`, as the Check computes.

3. **F03** (P3) plan target 1.6 has no README subsection

   - **Location.** `packages/DimerModelsAndLozengeTilings/design/plan.json`, Layer 1, target `1.6`
     (`rowTiling`, kind example, locator kenyon2009 Exercise 13, line 891, 0 tests); README Layer 1
     has subsections 1.1–1.5 and puts the row tiling `M_ε` under `### Examples` (line 403).
   - **Claim.** The plan and the README describe the same 51 targets (the commit says 51; the plan has
     52).
   - **Witness.** `grep -n "### 1.6"` on the README finds nothing; the row tiling is consumed as a
     definition by 6.1 (Check 3), 6.3(a), 7.3 (Check 2) and 10.2 (Check 1).
   - **Repair.** Add `### 1.6 Row tilings` to the README (define `M_ε` for `ε ∈ {0,1}^ℤ`, API: it is a
     plane tiling with no type-2 lozenge, `H_{M_ε}(x,y) = Σ_{0≤i<x} ε_i` for `x ≥ 0`, `τ_{e₂}M_ε = M_ε`
     and `τ_{e₁}M_ε = M_{σε}`; three Checks: `ε ≡ 1` gives `M₁`, `ε ≡ 0` gives `M₃`, the alternating
     `ε` has height `⌊x/2⌋` on `x ≥ 0`), or delete 1.6 from the plan; the two files must agree.

4. **F04** (P3) 9.7(a): state the diagonal conjugation

   - **Location.** README line 1456: "`det[w₁G_w(v_i − v_j − e₂)] = det[K_ξ(v_i;v_j)]`, from an
     entrywise identity up to a diagonal conjugation and a transposition"; Check 1 (line 1481) gives
     the conjugation `κ(x,y) = (−1)^{x+y}` only at `ξ = e^{πi/3}`.
   - **Claim.** The conjugation is `(−1)^{x+y}`.
   - **Witness.** Computed at slope `(s,t) = (0.3, 0.45)`, `w = w(s,t)`, `|ξ| = 1.3968`,
     `|1−ξ| = 1.1440`: `w₁G((0,−2)) / K_ξ((0,1);(0,0)) = −0.8740 = −1/|1−ξ|`;
     `w₁G((−2,−1)) / K_ξ((2,0);(0,0)) = 1.9511 = |ξ|²`;
     `w₁G((−1,−2)) / K_ξ((1,1);(0,0)) = 1.2209 = |ξ|/|1−ξ|`. The determinants agree
     (`0.075075` both for the vertical pair, `0.067089` for the horizontal pair, `0.034214` for the
     triple `(0,0),(1,2),(−1,1)`), so the claim is true but the Check's `κ` is the `|ξ| = 1` case.
   - **Repair.** State the entrywise identity as
     `w₁G_w(v_i − v_j − e₂) = (−1)^{(x_i−x_j)+(y_i−y_j)} |ξ|^{x_j−x_i} |1−ξ|^{y_i−y_j} K_ξ(v_j;v_i)`,
     with `|ξ| = w₂/w₃` and `|1−ξ| = w₁/w₃` by the law of sines, and add a Check at `(1/2,1/4)` or
     `(0.3,0.45)` with the three ratios above. Tested: at `ξ = e^{πi/3}` both moduli are `1` and the
     formula reduces to the existing `κ`.

Four P3 findings, each with a repair for the fix round; no P1 or P2 finding. The design re-plans no
existing roadmap, cites one supplier on main (PadicMeasuresIwasawaAlgebras §6.4, resolved), declares
no gaps, contains no copied passage, no algorithm, no process residue, and its mathematics survived
a computed adversarial pass on every sampled target and every headline.

## Verified sound

**Principles.** General library (locally finite periodic graphs with a proper countable-group
action in Layers 4–5, arbitrary finite regions in Layers 1–3, every slope in Layer 9); the only
cross-roadmap supplier is on main; ownership moves nothing; no copied passage (statements are
restated, locators are line numbers); no computational algorithm; no sorry'd data or `set_option`
(no Lean file at the design stage). Open pull requests: `roadmaps grep` for dimer, lozenge,
Kasteleyn, height function, Gibbs measure, Gibbs specification, tail σ-algebra, DLR, discrete sine
kernel, incomplete beta and determinantal point process found no owner of any object of this
roadmap (hits: Potts–Fortuin–Kasteleyn sums in TemperleyLiebOperatorAlgebras, Morse height
functions, the Gauss-map tail σ-algebra of ProbabilisticAndMetricNumberTheory §5529, Tau Ceti's
`tailProcess` (R01), RandomMatrices §8.3–8.4 continuous determinantal processes, already deferred
in Scope). TensorProductCombinatorics (open, earlier in the order) is hives, correctly described as
not needed; GraphConnectivityAndFlows §6.7 (main, line 753) is the multiset capacitated Kőnig
theorem, correctly not used; RandomMatrices §8.3–8.4 exist on main (lines 984, 1029).

**Gate.**

```
candidate: DimerModelsAndLozengeTilings is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2180 edges, 0 problem(s)
```

**Supplier citations resolved.** PadicMeasuresIwasawaAlgebras §6.4 on main
(`TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` line 3845; `Suggested.lean` lines
1029–1049 declare `Matrix.compound`, `compound_mul`, `higherAdjugate` over `Fin m`,
`compound_mul_higherAdjugate`), so the three "found nowhere" names of the worker's citation list are
declarations of a roadmap on main, not of the pinned libraries, and the README says so. Tau Ceti at
`358314d`: `invariantMeasuresOfMeasureUnivEq` (ErgodicExtreme.lean 75),
`convex_invariantMeasuresOfMeasureUnivEq` (86), `ErgodicSMul.iff_mem_extremePoints` (239, with
`[Group G] [Countable G] [MulAction G X] [MeasurableConstSMul G X] [IsProbabilityMeasure μ]`),
`exists_smul_invariant_ae_eq` (CountableAction.lean 54), `ergodicSMul_of_forall_smul_invariant` (72),
`isExtreme_setOf_measure_eq_zero` (Face.lean 40), `ergodic_shift_infinitePi_const`
(Exchangeability/PathSpace/Law/Extreme.lean 103). Mathlib at `f6090c7`: `SimpleGraph.induce`
(Maps.lean 227), `LocallyFinite` (Finite.lean 382), `IsMatching` (Matching.lean 66),
`IsPerfectMatching` (235), `isPerfectMatching_iff` (253), `Pi.compactSpace`/`Function.compactSpace`
(Compact.lean 1177–1181), `MeasurableSpace.pi` (Constructions.lean 574), `Pi.borelSpace`
(BorelSpace/Basic.lean 646: countable index, second-countable factors, as the README says),
`Measure.infinitePi` (ProductMeasure.lean), `CompactSpace (ProbabilityMeasure E)` (Prokhorov.lean
175–178), `tendsto_measure_of_isClopen_of_tendsto` (Portmanteau.lean 364),
`IsPiSystem.tendsto_probabilityMeasure_of_tendsto_of_mem` (831: second countable, countably
generated filter, neighbourhood condition, as the README says),
`exists_measure_symmDiff_lt_of_generateFrom_isSetRing` (MeasuredSets.lean 85: finite measure, ring
of sets, countable cover),
`measure_zero_or_one_of_measurableSet_limsup` (ZeroOne.lean 229), `ErgodicVAdd`/`ErgodicSMul`
(Action/Basic.lean 31, 43), `SMulInvariantMeasure` (Group/Defs.lean 59), `Matrix.det_apply`
(Determinant/Basic.lean 66), `adjugate_apply` (Adjugate.lean 193), `Matrix.inv`
(NonsingularInverse.lean 166), `Equiv.Perm.sign` (Sign.lean 357), `IsSimplyConnected`
(SimplyConnected.lean 134, with `.nonempty` at 144), `SimplyConnectedSpace` (40),
`LocallyPathConnectedSpace` (LocallyPathConnected.lean 61),
`IsCoveringMap.existsUnique_continuousMap_lifts` (Lifting.lean 477: `[SimplyConnectedSpace A]
[LocallyPathConnectedSpace A]`), `AddCircle.isCoveringMap_coe` (Covering/AddCircle.lean 32),
`tendsto_integral_exp_inner_smul_cocompact` (RiemannLebesgueLemma.lean 178). Mathlib has no
tilings, height functions, Kasteleyn matrices or Gibbs specifications (grep).

**Sources (seeded sample, 15 targets, all read at the locator).**

| Target | Locator checked | Finding |
|---|---|---|
| 1.2 | gorin2021 690–702 (hexagonal dual, bipartite, tilings ↔ perfect matchings); kenyon2009 95–113 | supports |
| 2.1 | aggarwal2023 338–341 (domain = simply connected induced subgraph, `F(R)`); gorin2021 454–457; kos2006 177–181 | supports; combinatorial form is the roadmap's own, said so |
| 2.2 | gorin2021 454–457 (consistency of local rules) | supports |
| 2.3 | kenyon2009 360–367 (divergence-free flows dual to gradients) | supports the duality used |
| 2.5 | aggarwal2023 384–399 (height function, increments `{0,1}`, uniqueness on simply connected `R`); gorin2021 447–458; kenyon2009 353–385 | supports |
| 2.9 | gorin2021 Theorem 1.4 lines 521–526 (two conditions), Corollary 1.5 line 613; thurston1990 uncertified | supports; roadmap's `h` form is the `{0,1}`-increment translation of Gorin's `+1/−2` form, equivalent as stated |
| 3.4 | gorin2021 Theorem 3.5 1281–1288 and proof 1294–1352 (Jacobi/Prasolov, "no absolute value" left to the reader); kenyon2009 Cor. 3 557–565; kenyon1997 Thm 6 362–373 | supports |
| 4.2 | sheffield2005 Lemma 3.2.2 1367–1371 (face property, citing Georgii 14.15) | supports as "ingredient"; georgii2011 uncertified |
| 4.5 | sheffield2005 303–342 (probability kernels, `μγ_Λ = μ`) | supports |
| 5.3 | gorin2021 Def. 13.4–13.6, Lemma 13.7 4534–4582; aggarwal2023 413–420; kos2006 195–202; kenyon2009 825–835; sheffield2005 1352–1371 | supports; the roadmap correctly notes Gorin's ergodic = extreme in `𝒢_inv` versus Kenyon's trivial invariant events |
| 7.2 | kos2006 206–213 (`μ_n(s,t)` with height change `(⌊ns⌋,⌊nt⌋)`); kenyon2009 860–863 | supports |
| 8.4 | gorin2021 Thm 4.10 1847–1850 (signs `±`); kos2006 Thm 4.2 658–666; kenyon1997 Lemma 8 401–406 | supports; the roadmap's complementary-minor form is the correct reading when `det K_ab = 0` |
| 8.5 | gorin2021 Claims 4.1–4.2 1545–1600, (4.8) 1895; kenyon2009 729–763; kos2006 668–679 | supports |
| 9.5 | kos2006 Thm 2.1 215–220 (existence half); kenyon2009 836–843; gorin2021 Cor. 6.3 2287–2298 | supports |
| 10.2 | aggarwal2023 413–415, 568–580; gorin2021 4538–4541; kenyon2009 786–809 | supports |

Also read: gorin2021 Prop. 3.7–3.8 and Def. 3.9, Thm 3.10 with table (3.4) (1416–1472), Lemma 4.7
(1748–1806), Thm 4.11 (1853–1871), Thm 6.1 and Ex. 6.2 (2256–2286), Cor. 13.14–13.16 (4695–4786);
kenyon2009 Lemma 4–5 and (3) (682–724), §5.4–5.5 (844–891), §6.1–6.2 (958–1036); aggarwal2023
Def. 1.2–1.3, (1.2) (463–507); okounkov-reshetikhin2003 Def. 4, Thm 2, (36) (965–1083); kenyon1997
85–93, 184–197, 380–406; sheffield2005 Thm 9.1.1 (5443–5445), Thm 9.5.1 (6195–6198). All ten cited
works are in `sources.toml` with the status the author recorded; no entry is wrong.

**Adversarial table** (values computed by hand or by a pure-Python script in the scratch directory;
`G` by the exact residue reduction of the `φ`-integral and Simpson in `θ`; `K_ξ` by Simpson along
the polygonal paths; tori by exhaustive enumeration with exact determinants).

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: faces, edges, lozenge types | `W(0)`, `B(0)`, `B(−e₂)`, Aggarwal's three vertex quadruples | `W(v)∪B(v−e₂) = {v−e₂,v,v+e₁,v+e₃}` = Aggarwal type 1 with `(x,y)=v−e₂`; type 2 and 3 likewise; `(0,3)` the only shared edge of `W(0)`,`B(0)` | agrees | none |
| Conventions: height increments and Gorin's `h_G = x+y−3H` | `M₁,M₂,M₃`, each face relation | `H_{M₁}=x`, `H_{M₂}=y`, `H_{M₃}=0`; on `W(v)` the three cases `(0,0,0)`,`(1,0,1)`,`(0,1,1)` of `c(v,1)+c(v+e₁,2)=c(v,3)` give exactly one `M`-edge; `h_G` rises `1` along a side, drops `2` across | agrees | none |
| Rotation `ρ` and `H_{ρM}(w) = H_M(ρ⁻¹w)+w₁` | `ρ(e₁),ρ(e₂),ρ(e₃)`, `ρ³`, `ρW(0)`, and the `e₁`-increment for arbitrary `M` | `(e₂, −e₃, −e₁)`, `ρ³=id`, `ρW(0)=W(−e₁)`; increment of RHS `= H_M(ρ⁻¹w−e₃)−H_M(ρ⁻¹w)+1 = [(ρ⁻¹w−e₃,3)∈M]` = LHS | agrees | none |
| 1.3 `3|R| = 2|E°|+|E∂|`; interior vertex iff six faces | `{W(0)}`, unit hexagon, `Faces(V)` | `3=0+3`, `18=12+6`; `Faces({0,e₁,e₃,e₂}) = {W(0),B(0)}`, `Faces({0,e₁}) = ∅` | agrees | none |
| 1.5 tilings = perfect matchings | `R=∅`, `{W(0)}`, hexagon | `1`/`1`, `0`/`0`, `2`/`2` (6-cycle) | agrees | none |
| 2.1 `R_ring` not simply connected | the twelve listed faces, the dual-path cochain | closed on `B(1,0)`: `1+0=1`; on `W(1,0)`: `0+1=1`; sum round `W(0)` `=1`, all three edges in `E(R_ring)` | agrees | none |
| 2.3 holes | `R_ring, Q={W(0)}`; five faces, `Q={W(0)}` | hypothesis holds / fails (`B(e₁)` shares `(e₁,2)`); Stokes gives `±1` on `∂Q` | agrees | none |
| 2.4 topological ⟹ combinatorial | wedge `W(0)∪B(1,1)`, `R_ring` | wedge: closed cochains glue at `(1,1)`; `F(R_ring)` not simply connected, 2.4 silent, 2.3 decides | agrees | none |
| 2.5 Lipschitz bound `≤ max(a,b,0)` | `(1,1),(−1,0),(2,1),(1,−1),(−1,−2)` | `1,0,2,1,0` via paths `e₃`, `−e₁`, `e₃e₁`, `e₁(−e₂)`, `(−e₃)(−e₂)` | agrees | none |
| 2.6 free tilings ↔ heights | `{W(0)}`, hexagon normalised `H(1,0)=0` | `(1,1),(0,1),(0,0)` are all three height functions; `T_a,T_b` give `H=0,0,0,−1,−1,−1` and `H(0)=0` resp. `−1` | agrees | none |
| 2.7 boundary height | hexagon outer loop, `R_strip`, wedge | loop closes (`0,0,0,−1,−1,−1`); strip boundary heights `0` and `1` on `y=1`; wedge: connected boundary, no `h` | agrees | R02 (hypothesis wording) |
| 2.8 flip and the descent argument | vertex maximising `H−H_min`, then `H(v)`, then `v₁+v₂`; hexagon | `H(v+e_k)=H(v)` (else a maximiser with larger `H`), `H(v−e_k)=H(v)−1` (else a maximiser with smaller `v₁+v₂`); `T_a→T_b` by the flip at `0` | agrees | none |
| 2.9 Thurston | `{W(0)}`, hexagon, `R₆'` | `c₀` round a triangle `0+0−1≠0`; `R₆'` shelled in 6 steps, `h=(0,0,0,0;1,1,1,1)`, `h(1,1)−h(2,1)=1>0=ρ((2,1),(1,1))`; matrix `[[1,0,0],[1,0,0],[1,1,1]]`, `det 0` | agrees | none |
| 3.1–3.2 Kasteleyn | hexagon unit and `(a,b,c)` weights; `R_ring` | `det[[1,0,1],[1,1,0],[0,1,1]]=2`; `det[[c,0,a],[b,a,0],[0,c,b]]=2abc`; `R_ring` tilings `T,T'` differ by a 6-cycle (odd): `det 0`, `Z=2` | agrees | none |
| 3.3 cofactor identity | `k=1`; `k=n=2` with `(j₁,j₂)=(2,1)`; `i₁=i₂` | `adj(j,i) = det·A⁻¹(j,i)`; `−1 = det A·(−det A⁻¹)`; `0=0` | agrees | none |
| 3.4 local statistics | hexagon unit weights, cofactors | `K⁻¹ = ½[[1,1,−1],[−1,1,1],[1,−1,1]]ᵀ`-pattern: `K⁻¹(B0,W0)=½`, `(B0,W(−e₁))=½`, `(B(−e₃),W0)=−½`, `(B(−e₃),W(−e₁))=½`; `det[[½,½],[−½,½]]=½` = mass of `T_a`; `(a,b,c)`: `c·ab/(2abc)=½` | agrees | none |
| 4.1–4.2 properness and tail events | `Γ=ℤ` trivial on `{pt}`; `(δ₀+δ₁)/2` | invariant event of measure `½`, tail σ-algebra trivial; properness needed. Route: `μ(AΔγ_kC_k)<2^{−k}`, `T=limsup`, Borel–Cantelli | agrees | R01 (cite `tailProcess`) |
| 4.3 Bernoulli ergodic | `ν=δ_a`; `(Bern(⅓)^{⊗ℤ}+Bern(⅔)^{⊗ℤ})/2` | point mass ergodic; density-`⅓` event has measure `½` | agrees | none |
| 4.4 cylinder convergence | `Bern(½)^{⊗ℤ}` vs `(δ_0+δ_1)/2` | one-point `½=½`, two-point `¼≠½` | agrees | none |
| 4.5–4.6 specifications, face, closedness | trivial and independent specifications; `f=2·1_{ω(0)=1}` | every measure Gibbs / only `ν^{⊗I}`; `∫γ_Λ(C|·)f dμ = ∫1_C f dμ` for tail `f`; non-tail `f` breaks it | agrees | none |
| 5.1–5.2 configuration space, dimer specification | `ℤ` nearest-neighbour, `Γ=2ℤ`; `C₆`; infinite-degree vertex | two points, completion sets singletons, every measure Gibbs; `C₆` Boltzmann `½,½`; closedness fails | agrees | none |
| 5.4 type weights give the uniform specification | hexagon, `(a,b,c)` | both tilings weight `abc`; 2.10 on `T_aΔT_b`: one edge per direction each side | agrees | none |
| 6.1 slope, `slope(ρ_*μ)=(1−s−t,s)` | `δ_{M₁},δ_{M₂},δ_{M₃}`, `ν₃`, `Bern(s)` rows | `(1,0),(0,1),(0,0)`, `(⅓,⅓)`, `(s,0)`; `ρ⁻¹` of direction 1 is direction 3 | agrees | none |
| 6.2 corners | slope `(1,0)` ⟹ all direction-1 edges a.s. ⟹ `M₁`; non-invariant `M_{1_{[0,∞)}}` | `μ{(0,1)∈M}=1` but `μ≠δ_{M₁}` | agrees | none |
| 6.3 edges of the triangle | (b) `H_{M'}−H_M` finitely supported and nondecreasing along verticals ⟹ `0`; (f) `β_s` | `P(ε₀=ε₁=1)`: `s²` vs `(s+s²)/2`, at `s=½`: `¼` vs `⅜`; `β(A)∈{0,1}` for shift-invariant `A` since `β` is Bernoulli for `σ²` | agrees | none |
| 6.4 extreme non-ergodic fibre point | `ν₃`, `Σa_kδ_{M_k}` | `μ≪ν₃` ⟹ `μ=Σa_kδ_{M_k}`, slope `(a₁,a₂)=(⅓,⅓)` forces `a=(⅓,⅓,⅓)`; `ν₃{M=M₁}=⅓` | agrees; refutes kenyon2009 863–866 | none |
| 7.1 height changes and the floor tiling | `1×1`, `2×2` with `(1,1)`, `(2,1)` on `2×2` | 3 tilings; `⌊(x+y)/2⌋` has `e₃`-increment `1`, counts `2,2,0`; `2·2+2·1=6>4` | agrees (brute force) | none |
| 7.3 torus limits | `(½,0)` on `2m×2m`; `(⅓,⅓)` on `3×3` | `C(2m−k,m−j)/C(2m,m)→2^{−k}`; height change `(1,1)`, slope exactly `(⅓,⅓)` | agrees | none |
| 8.1 twisted determinants | `1×2`, `2×2` unit weights, from the definition | `det K₀₀,K₀₁,K₁₀,K₁₁ = 3,5,−1,1` and `−3,5,5,5`; `(2,3,5)` weights on `2×2`: `0,544,1044,1300` | agrees | none |
| 8.2 sign formula | every tiling of the `1×1,1×2,2×1,2×2,2×3,3×2,3×3` tori, all `(a,b)`, unit and `(2,3,5)` weights | Leibniz sign (permutation sign times seam signs) equals `(−1)^{h₁h₂+(n₂+1+b)h₁+(n₁+1+a)h₂}` for all 2·(3+5+5+9+17+17+42)·4 cases; `2×2` floor tiling is the 4-cycle with sign `−1` | agrees | none |
| 8.3 partition function | same tori; `ε` table for all parities | `Σ_{ab} ε_{ab}(−1)^{…} = 2` for all `(n₁,n₂,h₁,h₂) mod 2`; `(Σ ε det)/2 = Z`: `3,5,5,9,17,17,42,1444,68`; `1×1`: `w₁+w₂+w₃`; `ε₀₀=−1` on `1×1` would give `w₃−w₁−w₂` | agrees | none |
| 8.4 torus correlations | `1×1` type 3; two lozenges at one white face | `w₃·2/(2Z) = w₃/Z`; empty signed sums, `0` | agrees | none |
| 8.5 Fourier | all tori above; `3×3` uniform | `∏(w₃+w₂z+w₁w⁻¹)` equals the exact determinants (imaginary parts `≤1e−13`); `3×3`: `det K₀₀=0` (eigenvalue `1+e^{2πi/3}+e^{−2πi/3}`), `Z=42` | agrees | none |
| 9.1 kernel, angles, row formula | `w=(1,1,1)`; `w=(1,1.3,0.8)`; `m=1,2,3,−2` | `G(0)=0.33334`, `G(0,−1)=0.33332`, `G(0,−2)=−0.057663` vs `√3/(2π)−⅓=−0.057669`; `w₁G(−e₂)=0.27916` vs `θ₁/π=0.27917`, `w₂G(e₁)=0.50996` vs `0.50995`, `w₃G(0)=0.21088` vs `0.21088`; row: `−0.24473/−0.24473`, `0.15649/0.15649`, `−0.05185/−0.05184`; inverse identity `1.000` at `u=v`, `≤6e−16` otherwise; `(1,1,3)`: `|P̂|≥1`; `(1,1,2)`: Jacobian `[[0,0],[−1,1]]` | agrees | none |
| 9.2 good sizes | `θ=π/2`, `θ=2π/3` | even `n` hit `j=n/2`; odd `n`: `π/(2n)>n^{−3/2}`; `3∉W` (`j=2`), `4∈W` (`π/12=0.262>0.125`); (a) with `n+1`: two consecutive bad `n` force `|j(n+1)−j'n|≤(2/π)√n` with `j≈θn/π`, impossible for large `n` when `θ/π∉ℤ` | agrees; Gorin's `n+2` fails at `π/2` | none |
| 9.3 determinantal measure | uniform, type-1 at `(0,0),(0,1)` | `det[[⅓,−0.05767],[⅓,⅓]] = 0.13034` vs `2/9−√3/(6π)=0.13033`; only one `n_i ∈ W_{θ₀}` is needed (grid points stay `>n₁^{−3/2}` from both zeros) | agrees | none |
| 9.4 mixing | type-3 covariance; `ν₃` | `−w₃²G(d)G(−d)→0`; `ν₃`: `⅓≠1/9` | agrees | none |
| 9.5 every slope | `(⅓,⅓)`, `(½,¼)`, `(½,0)` | `w=(√3/2)(1,1,1)`; `(1,√2/2,√2/2)` liquid (`1<√2`), angles `(0.5,0.25,0.25)π` computed; `(1,0,1)` not positive | agrees | none |
| 9.6 incomplete beta kernel | `ξ=e^{πi/3}`; crossing sides | `K(v;v)=0.33333`; `K((0,0);(0,1))=−0.33333=−(1−s−t)`; `K((0,1);(0,0))=0.057669=s−Im ξ/π`; across `(−∞,0)` the diagonal would be `−⅔` | agrees | none |
| 9.7 incomplete beta process | slopes `(⅓,⅓)`, `(½,¼)`, `(0.3,0.45)`; pairs vertical, diagonal, horizontal, triples | `det[w₁G] = det[K_ξ]` to `1e−5` in all 14 cases (one `(⅓,⅓)` triple lost to the script's cancellation at `w₂=w₃`, re-done at the other slopes); row `s=½`: `¼−1/π²=0.1487`; (f) counterexample heights `1_{x>0}` and `1`/`y` both valid, same `X(M)` | agrees | R04 (state the conjugation) |
| 10.1–10.2 local limits | hexagons `R₆+v_N`; `M_c=min(0,x,y)` | limit `(δ_{T_a}+δ_{T_b})/2` not on `𝔈(𝕋)`; `M_c` admits the flip at `0` (`H(e_k)=0=H(−e_k)+1`), `δ_{M_c}` not Gibbs | agrees | none |

**Headline theorems** (from the Summary): 1.5, 2.5, 2.9, 3.2, 3.4, 4.6/5.3, 7.3, 6.3, 8.3, 9.5,
9.7, 10.2. No `Suggested.lean` exists at the design stage and this lane does not elaborate. Each
headline mentions only objects the README defines with real bodies on native carriers (`ℤ × ℤ`,
`Fin 3`, `Set TriFace`, `TriEdge → Bool`, `Matrix`, `ProbabilityMeasure`, `intervalIntegral`), with
the Gibbs property given by the cylinder identities of 5.2 (no conditional expectation needed), so
all twelve are statable at the pins; the backticked names the README attributes to the roadmap
(`isTiling_iff_isPerfectMatching`, `planeHeight_bijective`, `thurston_tileable_iff`,
`partitionFunction_eq_abs_det`, `lozenge_correlation_eq_det`, `gibbsInvariant_extreme_iff_ergodic`,
`IsLozengeGibbs`, `slopeEdge_ergodicGibbs_equiv`, `two_ergodicGibbs_of_slopeEdge`,
`torusLimit_mem_gibbsInvariant_slope`, `torus_partitionFunction_eq`,
`exists_ergodicGibbs_of_slope`, `incompleteBetaProcess_exists_unique`,
`localLimit_isLozengeGibbs`) are exactly these headlines and their carriers, which the package's
`Suggested.lean` must declare. Padding probe: not applicable before the file exists; the package
stage should keep out of the file the Checks of 3.1, 7.1, 8.1 and 9.1, which compute small values.

**Shape.** Summary, Scope and ownership (with deferrals by section), Conventions, Exact supplier
contracts (Mathlib, Tau Ceti, one roadmap), How to read the build, ten layers each with `*Needs:*`
lines, API bullets, three Checks per definition (52 targets, 147 tests in the plan), Examples and
Dependencies, Downstream consumers, Worked examples, References. Unicode mathematics, no LaTeX
delimiters, no process words, no pull-request numbers, no machine paths, no target tables. Every
theorem has hypotheses in the sentence and a locator.

**Settled by reading.** Counts: 52 targets read, 147 Checks evaluated, 38 adversarial rows above,
53 library declarations opened, 7 open-text sources read at 60 locators, 1 supplier roadmap
resolved, 4 scope deferrals verified.

## Not verifiable

- thurston1990 (JSTOR only) and georgii2011 (de Gruyter only): settled uncertified in
  `sources.toml`; cited by locator with the statements taken from gorin2021 Theorem 1.4 and
  sheffield2005 Lemma 3.2.2, both read.
- Elaboration of a Lean file: no `Suggested.lean` at the design stage and this lane does not
  elaborate.

## Source issues

- **Error** in gorin2021 at Lemma 4.7, printed page 74 (lines 1766–1780): the source says that for
  large `n` either `n` or `n+2` lies in `W_θ`; it should be `n` or `n+1` (for `θ = π/2` every even
  `n` has `θ = πj/n` with `j = n/2`, and the proof's `O(1/n)` difference can be `0`); affects the
  proof (the roadmap's 9.2(a) uses `n+1`).
- **Gap** in kenyon2009 at Section 5.4, printed page 29 (lines 862–866): the source says
  ergodicity of a torus limit follows because the slope fibre of translation-invariant Gibbs
  measures is convex with the ergodic measures as its extreme points; it should note that the fibre
  over a non-corner slope is not a face (the measure `(δ_{M₁}+δ_{M₂}+δ_{M₃})/3` is extreme in the
  fibre over `(1/3,1/3)` and not ergodic), so ergodicity needs another argument; affects the proof.
- **Error** in aggarwal2023 at Section 1.3, printed page 10 (lines 465–467): the source says a
  tiling `M` of `R` is determined by the set `X(M)` of its type-1 lozenges unless `R = T` and `X(M)`
  is empty; it should require that no two consecutive rows lack type-1 lozenges (two plane tilings
  with heights `1_{x>0}` below row `1` and `1` resp. `y` on rows `≥ 1` share `X(M) = {(0,y) : y ≤ 0}`);
  affects nothing (the roadmap's 9.7(f) carries the correct statement).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "229fbb7fde2b1c7b2018fb8c9c495046a09e2a59", "job": "REV-DESIGN-DimerModelsAndLozengeTilings", "model": "fable", "worker": "chris-x18"} -->
