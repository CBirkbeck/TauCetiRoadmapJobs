<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16766#issuecomment-6899665992 -->
Review (claude) of ffd8f7d

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) target 2.4 has no locator, and the manifest lists it as citing aggarwal2023

   - **Location.** `packages/DimerModelsAndLozengeTilings/README.md` line 744, in 2.4: "Thus every
     domain in Aggarwal's sense is simply connected here." Also
     `packages/DimerModelsAndLozengeTilings/sources.toml` line 20, the aggarwal2023 `cited_for` entry
     "2.1, 2.4 simple connectivity of domains".
   - **Claim.** Every target carries a locator, and each `cited_for` record lists exactly the sections
     that cite the work (the criterion of the last repair report: "a section cites a work when it names
     the work's key").
   - **Witness.** A scan of the 51 numbered sections for the ten manifest keys: 2.4 is the only one
     naming none. The same scan against `cited_for`: all ten records exact, except aggarwal2023 with
     one extra section, 2.4.
   - **Repair.** In README 2.4 replace that sentence by: "Thus every domain in Aggarwal's sense, an
     induced subgraph whose union of faces is simply connected (aggarwal2023 lines 338–341), is simply
     connected here." No change to `sources.toml`. aggarwal2023 lines 338–341 were read: they define
     `F(R)`, simple connectivity of `R` through `F(R)`, and a domain. Tested on the instance that
     refuted the claim: with the sentence replaced, the scan finds a key in every numbered section
     and all ten `cited_for` records agree with the README in both directions.

One finding, P3 (0 blocking). The one finding of round 3 is repaired. No statement of
`packages/DimerModelsAndLozengeTilings/README.md` or `Suggested.lean` was found false, vacuous or
unowned; the elaboration passes with `sorry` as the only warning; the dependency check reports no
problem. The repair asked for is one sentence of the README: target 2.4 is the only numbered target
without a source locator, while the manifest record repaired last round lists 2.4 as citing
aggarwal2023.

## Round 3 findings, one by one

- **F01 (four `cited_for` records omit sections): repaired.** `sources.toml` now reads, for
  aggarwal2023, "4.4, 5.3, 5.4, 6.1 Gibbs measures, translation invariance, slope"; sheffield2005,
  "4.2, 4.3, 4.6, 5.3, 5.4 invariant events, ergodicity, face property"; kos2006, "2.1, 2.10 the
  flow form of the height function; gauge and magnetic invariance", "4.6, 5.2-5.3 dimer Gibbs
  measures", "8.3-8.5 …"; kenyon2009, "1.2, 1.5, 1.6 …", "2.3, 2.5, 2.10 …", "2.8, 3.1, 3.2 …",
  "4.6, 5.1-5.4 …", "6.1-6.4 …", "7.1-7.3, 8.2, 8.3, 8.5 …", "10.1-10.2 …". My own scan (sections
  naming each key, ranges expanded against the README headings): missing sections, none in any of
  the ten records; extra sections, none except aggarwal2023's 2.4 (R01). The repair's correction of
  the review (8.4 does not cite kenyon2009) is right: 8.4 names gorin2021, kos2006 and kenyon1997
  only. The repair changed `sources.toml` alone (`git diff` of the two heads: six `cited_for`
  lines); the manifest parses, ten records, no key, locator, URL or hash changed.
- **The repaired pattern elsewhere.** The three References lines that name sections
  (cohn-kenyon-propp2001 "2.8", thurston1990 "2.9", georgii2011 "4.2, 4.6 and 5.4") agree with the
  README. The pattern "a record and the text disagree" remains in the one place of R01.

## Verified sound

**Elaboration.** `lake env lean` on `packages/DimerModelsAndLozengeTilings/Suggested.lean`, run from
the content repository: exit 0; 17 warnings, each `declaration uses sorry`, at lines 115, 168, 184,
198, 234, 245, 331, 343, 375, 387, 409, 422, 453, 490, 503, 523, 553; no other message. Imports:
`import Mathlib` and `TauCeti.MeasureTheory.Group.ErgodicExtreme` (used by
`Specification.gibbsInvariant`). No `set_option`, `#eval`, `#print`, `#synth`, `lemma`, `opaque`,
`True` placeholder, sorried data or admitted `example`; no line over 100 characters.

**Signatures.** `#check @name` for all 57 declarations appended to a scratch copy and elaborated
once: exit 0, no error. The elaborated types agree with the README statements; the two Layer 4
theorems carry `[Countable Γ] [Infinite Γ] [Countable I] [DecidableEq I] [Finite S]
[DiscreteTopology S] [DiscreteMeasurableSpace S]`, properness, `X`, `γ` and `γ.IsEquivariant` in
their own signatures; `torus_partitionFunction_eq` carries both `NeZero` instances and the
periodicity of `w`. Nothing lost, nothing changed.

**One-tactic probe, all 17 sorried theorems.** Each `sorry` replaced by
`first | rfl | (simp; done) | infer_instance | (constructor <;> simp; done) | (intros; simp_all; done) | aesop | decide | (exact?; done)`
on a scratch copy: 17 of 17 fail (one error per theorem). No padding: no boundary-case theorem, no
mirrored Check, no value computation; every definition and instance is used by a headline.

**Headline theorems (README lines 18–28) against `Suggested.lean`.** 1.5 `tilingSubgraph_bijOn`;
2.5 `tilingOfHeight_bijOn`; 2.8 `flip_connected`; 2.9 `thurston_tileable_iff`; 3.2
`partitionFunction_eq_abs_det`; 3.3 `lozenge_correlation_eq_det`; 4.6 `gibbsInvariant_isExtreme`,
`gibbsInvariant_extreme_iff_ergodic`; 5.4 `lozengeGibbsInvariant_isExtreme`,
`lozengeGibbs_extreme_iff_ergodic`; 6.3 `slopeEdge_ergodicGibbs_equiv`,
`two_ergodicGibbs_of_slopeEdge`; 7.3 `torusLimit_mem_gibbsInvariant_slope`; 8.3
`torus_partitionFunction_eq`; 9.5 `exists_ergodicGibbs_of_slope`; 9.7
`incompleteBetaProcess_exists_unique`; 10.2 `localLimit_isLozengeGibbs`. 5.3 is named in the module
docstring as not stated separately, with its reason. All statable headlines are stated; none goes
through a stand-in.

**Names and shape.** All 57 Lean names occur in the README. 145 backticked identifiers of the
README that are not this roadmap's were searched at the pinned Mathlib and Tau Ceti: all found
(the nine not found are mathematical symbols such as `H_min`, `R_ring`). Every numbered target has
at least three Checks and a `*Needs:*` line; ten layers, each ending with Examples and
Dependencies. No LaTeX delimiters, pull-request numbers, dates, machine paths, HTML anchors, field
lists or target tables; "lemma" occurs three times, as an English word. No layer is named after a
source. The opening `module` line is the form of 54 of the 198 `Suggested.lean` files on main.

**Remarks that need no change.** (i) 9.2, first Check, says `W_{π/2}` contains every odd `n ≥ 2`;
`n = 1` is in it as well, and the Check is true as written. (ii) The route of 4.6 needs neither the
finiteness nor the topology of `S`; the hypotheses are those of the layer and of the weak-closedness
half, and are kept. (iii) `torusMeasure 0 s t` is `0` (the set is infinite); a strictly increasing
`φ` meets `0` at most once, so `torusLimit_mem_gibbsInvariant_slope` is unaffected.

### Adversarial table (values computed this round)

Rows for the fifteen sampled targets, the headline theorems and the target of R01. All values were
computed this round (exact rational arithmetic for the finite cases, Gauss–Legendre quadrature to
about 15 digits for the kernels).

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| 1.1 faces, symmetries | `ρ` on `e₁,e₂,e₃`; `ρ³`; `ρ(W(0))`, `ρ(B(0))`; the reflection | `ρ(1,0)=(0,1)`, `ρ(0,1)=(−1,−1)`, `ρ(1,1)=(−1,0)`; `ρ²(x,y)=(y−x,−x)`, `ρ³=id`; `ρW(0)={0,(0,1),(−1,0)}=W(−e₁)`, `ρB(0)={0,(−1,−1),(−1,0)}=B(−e₃)`; reflection sends `W(0)` to `{0,(0,1),(1,1)}=B(0)` | true; colours preserved by `ρ`, reversed by the reflection |
| Conventions: heights under `ρ` | `M₁,M₂,M₃` | `ρ⁻¹w=(w₂−w₁,−w₁)`; `H_{M₁}`: `(w₂−w₁)+w₁=w₂`; `H_{M₂}`: `−w₁+w₁=0`; `H_{M₃}`: `0+w₁=w₁` | agree with `ρM₁=M₂`, `ρM₂=M₃`, `ρM₃=M₁` |
| 1.5 `tilingSubgraph_bijOn` | `R=∅`, `{W(0)}`, hexagon | one tiling and one matching; none and none; `T_a`, `T_b` and two matchings of the 6-cycle | true |
| 1.6 row tilings | faces `W(x,y)`, `B(x,y)`; `ε=1_{[0,∞)}`; column reading, `ε=1_{{0}}` | `W(x,y)` has `((x,y),1)` or `((x,y),3)`, `B(x,y)` has `((x,y+1),1)` or `((x,y),3)`, by `ε_x`; `τ_{e₁}M_ε={((x',y),1):ε_{x'−1}=1}∪…=M_{σε}`; height of `ε=[x odd]` at `x=−1,−2`: `−1,−1=⌊x/2⌋`; column reading leaves `B(x,0)` with no edge | true |
| 2.4 bridge (R01) | closed `c` on `W(v)`; wedge `W(0)∪B(1,1)`; `R=∅` | vertex values `0, c(v,1), c(v,1)+c(v+e₁,2)=c(v,3)`, map `t·c(e)` mod `ℤ` on each edge, lift has integer increments `c(e)`; wedge meets only in `(1,1)`; `∅` fails Mathlib's nonemptiness | true; only the locator is missing |
| 2.5 `tilingOfHeight_bijOn` | triples round `W(v)`; `x+y` | `(a,b,a+b)∈{(0,0,0),(1,0,1),(0,1,1)}` select `(v,3)`, `(v,1)`, `(v+e₁,2)`; `x+y` has `e₃`-increment `2` | true |
| 2.8 `flip_connected` | every vertex-connected region of at most 6 faces, up to translation: 59,307, of which 52,235 simply connected, 564 of those tileable | flip classes equal to the number of tilings in 564 of 564 | true |
| 2.7, 2.9 `thurston_tileable_iff` | the same 52,235 regions (15,136 balanced and untileable) | boundary graph connected in 52,235; "`h` exists with `h(u')−h(u) ≤ ρ_R(u,u')`" equals "tileable" in 52,235, mismatches 0 | true |
| 3.1 hexagon matrix | rows `W(0),W(−e₁),W(−e₃)`, columns `B(0),B(−e₃),B(−e₂)` | `[[c,0,a],[b,a,0],[0,c,b]]`, `det=2abc`; unit weights `2`, columns swapped `−2`; weights of `T_a`, `T_b`: `abc`, `abc` | agree |
| 3.2 `partitionFunction_eq_abs_det` | the balanced simply connected regions above, random integer weights in `[1,9]` | `|det K|=Z` in all, including `Z=0` on the 15,136 untileable ones | true |
| 3.3 `lozenge_correlation_eq_det` | the tileable regions above, one and two pairs (up to 400 selections each, repeated faces included); hexagon | mismatches 0; hexagon: `K⁻¹=½[[1,1,−1],[−1,1,1],[1,−1,1]]`, `det[[½,½],[−½,½]]=½`; shared `B(0)`: equal rows, `0`; `c·ab/(2abc)=½` | true, without absolute value |
| 4.2 invariant events | `I=∅`; `I` finite nonempty; trivial group on a point | `I=∅`: proper, `Ω` a point; finite nonempty `I` with infinite `Γ`: `F=F'=I` meets every `γ`, not proper; trivial group: proper but finite, event of mass `½`, tail trivial; route: `μ(AΔγ_kC_k)=μ(AΔC_k)<2^{−k}`, limsup lies in `𝓕_{Λ_kᶜ}` for every `k` | true; infiniteness and properness both needed |
| 4.4 weak topology | two-point functions; trivial σ-algebra | `Bern(½)`: `¼`; `(δ₀+δ₁)/2`: `½`; trivial σ-algebra on `{0,1}`: trace on `{0̄,1̄}` has 2 sets, Borel 4 | true |
| 4.6 `gibbsInvariant_isExtreme` | empty carrier; `ν=fμ`, `f` tail | empty `X`: ambient set `∅`, statement true; `∫γ_Λ(C|·)f dμ=∫γ_Λ(f1_C|·)dμ=∫f1_C dμ=ν(C)` | true |
| 5.4 `IsLozengeGibbs`, faces | `δ_∅`; `2δ_{M₃}`; swap on `F` | `E` holds the three edges of a face, so no cylinder of a tiling contains `∅`: `0=0`; mass `2`; a tiling in `[ω]_E` swapped to `ω'` on `F` is a tiling (faces meeting `F` have all edges in `E`) | true; both extra clauses needed |
| 6.2 corners | `(1,0)`, `(0,0)`; `δ_{M_ε}`, `ε=1_{[0,∞)}` | every direction-1 edge a.s. present, so `M=M₁`; type-3 density `1−s−t=1`; `μ{(0,1)∈M}=1` without invariance and `M_ε≠M₁` | true |
| 6.3 `slopeEdge_ergodicGibbs_equiv`, `two_…` | `rowCode`; `β_s`; `ρ` | `rowCode(e₁+ᵥω)(x)=ω((x−1,0),1)`; `P(ε₀=ε₁=1)`: `s²` against `(s+s²)/2`, at `½`: `¼`, `⅜`; `(s,0)↦(1−s,s)↦(0,1−s)` | true |
| 6.4 fibres | `ν₃`; `a=(s,t,1−s−t)`; alternating rows | measures `≪ν₃` are `Σa_kδ_{M_k}` of slope `(a₁,a₂)`, so `a=(⅓,⅓,⅓)`; non-corner slope: two `a_k>0`, corners outside the fibre; average of `M_ε`, `M_{σε}`: slope `(½,0)` | true |
| 7.1 height changes | ten torus sizes up to `3×3` and `2×4` | attainable set equals `{n₂a+n₁b≤n₁n₂}` in all ten; type counts `n₂h₁`, `n₁h₂` in every tiling; tilings: 3, 5, 5, 9, 9, 9, 17, 17, 42, 33 | true |
| 8.2 sign formula | 12 torus sizes, all tilings, all `(a,b)`: 796 cases | sign of the permutation times the twists equals `(−1)^{h₁h₂+(n₂+1+b)h₁+(n₁+1+a)h₂}`: mismatches 0 | true |
| 8.3 `torus_partitionFunction_eq` | the matrix of the Lean definition, random integer weights in `[−5,7]`, ten sizes | `Z` and the right side: `−2,−2`; `51,51`; `−17,−17`; `−499,−499`; `−65,−65`; `−4,−4`; `5952,5952`; `−1912,−1912`; `−347160,−347160`; `146960,146960` | true for signed weights |
| 8.4 Check | `2×2`, weights `(1,1,1)` and `(2,3,5)` | dets `−3,5,5,5`, `c=(−1,1,1,3)`, `⅓`; dets `0,544,1044,1300`, `c=(60,100,150,190)`, `Z=1444`, `25/38` by enumeration and by the formula | agree |
| 9.1 kernel | `w=(1,1,1)`; `w=w(0.3,0.45)` | `G(0)=0.3333333333`, `G(0,−2)=−0.0576688856=√3/(2π)−⅓`; angles `0.3, 0.45, 0.25`; inverse identity `1.0000`, `~1e−16`, `~1e−17` at `d=0,(2,−1),(−1,3)`; row `m=1,2,3,−2`: `−0.2575181074, 0.1513653457, −0.0327877214, 0.1513653457` on both sides | agree |
| 9.2 good sizes | `θ=π/2`; `2π/3`; the proof of (a) | even `n`: distance `0`; odd: `π/(2n)>n^{−3/2}`; `n=4`: `π/12≈0.262>0.125`; both `n,n+1∉W_θ` give `|j−kn|=O(√n)`, so `θ/π` within `O(n^{−½})` of an integer | (a) true with `n+1`; Gorin's `n+2` fails |
| 9.3 determinantal measure | vertical type-1 pair, `w=(1,1,1)` | `u=(0,0),(0,1)`, `v=(0,−1),(0,0)`: `det[[G(0,−1),G(0,−2)],[G(0),G(0,−1)]]=0.1303340730=2/9−√3/(6π)` | agree |
| 9.6 kernel | `ξ=ξ(0.3,0.45)`, `e^{πi/3}` | `ξ=0.8210+1.1300i`, inverse `(0.3,0.45)`, `|ξ|=1.3968=w₂/w₃`, `|1−ξ|=1.1441=w₁/w₃`; diagonal `0.3`; `K(v₁;v₂)=−0.25`, `K(v₂;v₁)=−0.0597018710=s−Im ξ/π`; row `m=1,2,−3`: `0.3597018710, 0.2953223441, 0.0120311312` on both sides; uniform: `−⅓`, `0.0576688856` | agree |
| 9.7 (a), (b), `incompleteBetaProcess_exists_unique` | eight pairs at slope `(0.3,0.45)`; determinants | both sides of (a): `0.0521813486`, `0.2860307014`, `0.1513653457`, `−0.1411758998`, `−0.0529518996`, `0.1820928`, `−0.0299835368`, `0.3`; ratios `−0.8740, 1.9511, 1.2208`; pair: `0.0750745323` both; triple: `0.0342139661` both; uniform two-point `0.1303340730`; `m=0`: `1=1` | agree |
| 9.7 uniqueness remark | heights `1_{x>0}` on `y≤0`, then `1` or `y` | both are height functions (`e₃`-increments `1−1_{x>0}`), same `X={(0,y):y≤0}`, different tilings | Aggarwal's remark fails; (f) is right |
| 10.1 `LocalConvergence` | sign of the shift; hexagons | `(M−v_N)∩E={e:e+v_N∈M}`, the Lean event; with `+v_N` the window leaves `R₆+v_N` | convention pinned |
| 10.2 `localLimit_isLozengeGibbs` | mass; concentration; swap | `E=∅` gives mass `1`; each face condition holds once `f+v_N∈R_N`; swap on `F+v_N` keeps tilings of `R_N` once the faces meeting `F+v_N` lie in `R_N` | true |

### Sources: the seeded sample, read at the locators

Eight texts read; thurston1990 and georgii2011 are settled as uncertified. The author flagged no
locator as unverified. Each locator below supports the statement as written.

- 1.1: aggarwal2023 lines 324–337 (lattice and its two kinds of faces); gorin2021 lines 405–420
  (six directions).
- 1.6: gorin2021 lines 4638–4642 (extreme slope); kenyon2009 Exercise 13, line 891.
- 2.4: no locator in the target (R01); aggarwal2023 lines 338–341 read for the repair.
- 3.1: gorin2021 lines 1199–1215 (weighted Kasteleyn matrix) and 722–744 (the two labelings);
  kenyon2009 Sections 3.1 and 3.4 (headings at lines 428 and 489).
- 3.3: gorin2021 Theorem 3.5, lines 1281–1288, proof from 1294; kenyon2009 Corollary 3, lines
  557–565; kenyon1997 Theorem 6, lines 362–373.
- 4.2: sheffield2005 Lemma 3.2.2, lines 1367–1371, which attributes it to Theorem 14.15 of Georgii
  (line 1366).
- 4.4: gorin2021 Definition 13.1 and Lemma 13.2, lines 4509–4519; aggarwal2023 lines 412–418.
- 5.4: aggarwal2023 lines 412–420; kenyon2009 lines 781–809, 825–835, 869–878; gorin2021
  Definition 13.4 (4534–4537), Definition 13.6 and Lemma 13.7 (4556–4562), Exercises 13.3 and 13.9
  (4520–4526, 4583–4585); sheffield2005 lines 1367–1371.
- 6.2: gorin2021 Exercises 13.3 and 13.9; kenyon2009 Exercise 13.
- 6.4: kenyon2009 lines 860–866 (the argument the README corrects, as described).
- 9.2: gorin2021 Lemma 4.7, line 1766, and lines 1748–1770; kos2006 lines 691–708; kenyon2009
  lines 945–952.
- 9.3: gorin2021 Theorem 4.11 (1853) and Corollary 13.14 (4695); kos2006 Theorem 4.3 (714);
  kenyon2009 Section 6.1 (958).
- 9.6: aggarwal2023 Definitions 1.2–1.3, lines 463–476, and 505–507; okounkov-reshetikhin2003
  Definition 4, lines 965–968.
- 9.7: aggarwal2023 equation (1.2), lines 491–505, and the remark at 465–467;
  okounkov-reshetikhin2003 Theorem 2 (993), equation (36) (1076); gorin2021 lines 4744–4748 and
  Corollary 13.16 (4762).
- 10.1: aggarwal2023 lines 568–580 (Theorem 1.5 and the shift); gorin2021 Section 13.2, lines
  4530–4541; kenyon2009 lines 786–793.

### Library declarations opened at the pins

Mathlib at `1b1ccf4`, Tau Ceti at `2fd255d` (the revisions of `lake-manifest.json`). Opened this
round, at the lines the README gives: `cylinderEvents` 409, `cylinderEvents_mono` 415,
`cylinderEvents_le_pi` 418, `measurableCylinders` 275, `isPiSystem_measurableCylinders` 335,
`univ_mem_measurableCylinders` 345, `generateFrom_measurableCylinders` 366, `cylinderEventsCompl`
534, `isSetRing_measurableCylinders` 57, `isProper_iff_inter_eq_indicator_mul` 57,
`IsProper.setLIntegral_eq_comp` 73, `Kernel.Invariant` 39, `mulShift` 150, `isOpen_cylinder` 214,
`isClosed_cylinder` 219, `Subshift` 233, `MulSubshift` 253,
`measure_zero_or_one_of_measurableSet_limsup` 229, `uniformOn` 60,
`tendsto_measure_of_isClopen_of_tendsto` 362, the `CompactSpace (ProbabilityMeasure E)` instance
176, `isCoveringMap_coe` 32, `arrowAddAction` 101, `IsSimplyConnected` 137; Tau Ceti `tailFamily`
42, `tailProcess` 47, `tailProcess_eq_iInf_tailFamily` 64, `isExtreme_setOf_measure_eq_zero` 40,
`invariantMeasuresOfMeasureUnivEq` 75, `exists_smul_invariant_ae_eq` 53,
`ergodicSMul_iff_forall_smul_invariant` 68,
`det_submatrix_comp_inr_eq_sign_mul_det_mul_det_submatrix_comp_inl_nonsing_inv` 160,
`det_mul_det_submatrix_adjugate` 54. The others cited in the README were found by name at the pins
(145 identifiers searched, none missing).

Duplication by object: a search of both pinned libraries for Kasteleyn, lozenge and dimer finds only
Mathlib's four-functions file. No target is proved at the pin.

### Cross-roadmap citations resolved

On main: VonNeumannAlgebras V8.BernoulliArbitraryDiscrete (README line 2788); FactorRigidity §8.3
(line 767); TensorProductCombinatorics §1.1 (line 465); RandomMatrices §8.3 and §8.4 (lines 1183,
1253); GraphConnectivityAndFlows §6.7 (line 753; its perfect-matching predicate at line 773). At
its open head: ClassicalErgodicTheory §0.3 item 2 (lines 410, 418) and §1.4 item 2 (lines 772,
779). All are scope deferrals: no `*Needs:*` line names a roadmap, and the package declares no gap
(`design/plan.json`: `"gaps": []`).

### Dependency check

    depcheck: 246 roadmaps, 2241 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

### Duplication and overlap audit

The overlap facts: no other open pull request changes this roadmap, no cited id is dropped, no id
is defined only by an open revision, no second copy (main has no folder of this name, and the name
occurs in no open roadmap). Searches over the open heads and main, by object: Kasteleyn (only the
Potts–Fortuin–Kasteleyn identity of TemperleyLiebOperatorAlgebras), lozenge, dimer, discrete sine,
Thurston tileability, Gibbs specification (no match); Gibbs measure (ClassicalErgodicTheory §8.6,
the invariant measure of a potential on a shift; PDE, a renormalised measure); tail σ-algebra
(Exchangeability and ProbabilisticAndMetricNumberTheory, both `ℕ`-indexed); `structure Subshift`,
`structure Specification`, `def hexGraph`, `structure TriEdge` (no match in any Lean file). No
declaration of `Suggested.lean` has the fully qualified name of a declaration in a roadmap I could
read. Maintainer notes: none were left.

Overlap check: read ClassicalErgodicTheory, PointProcesses, MathematicalBilliards, Exchangeability,
ProbabilisticAndMetricNumberTheory, StochasticCalculus; Bernoulli action of a countable group on
`G → α`: VonNeumannAlgebras on main for finite `S`, also built by the open ClassicalErgodicTheory,
this roadmap keeps the proper-action variant 4.3 and says how it differs; `ℕ`-indexed tail
σ-algebra: Tau Ceti `tailProcess`, cited and identified with 4.1; nothing else shared.

### Copyright, licences and scope

Wording: 20 passages set beside the texts at their locators (the fifteen sampled targets and the
docstrings of `TriFace.edges`, `kasteleynMatrix`, `IsLozengeGibbs`, `incompleteBetaKernel` and
`LocalConvergence`). None reproduces a source sentence or follows one clause by clause; what
coincides is forced (the two vertex triples of a face, the formula of Theorem 3.5, the integrand
of the incomplete beta kernel). Arrangement: gorin2021 has the largest share, 47 of 158 locators.
Its contents (Lectures 1–13) set beside the layers: Layers 1–2 draw on Lecture 1, Layer 3 on
Lecture 2 and Sections 3.1–3.2, Layer 4 on nothing there, Layers 5–6 on Lecture 13, Layers 7–8 on
Section 3.3 and Lecture 4, Layer 9 on Lectures 4, 6 and 13, Layer 10 on Sections 13.1–13.2: no run
of layers maps one to one onto a run of lectures, and the order is forced by the dependency lines
(3 needs 2.8; 5 needs 4; 6 needs 5; 7 needs 4–6; 8 needs 7; 9 needs 4–8; 10 needs 5 and 9).
Reuse: table (3.4) of gorin2021 is restated as a rule; the unit-hexagon matrix of 3.1 coincides
with the worked example of gorin2021 lines 722–744 (to the humans, below).

Source independence: 20 passages compared with 7 sources, none shared; largest share gorin2021, 47
of 158 locators; contents compared with gorin2021: independent.

## Not verifiable

- thurston1990 and georgii2011: recorded as uncertified, cited by locator only; not read.
- kenyon1997 Theorem 6: the sentences are readable, the displayed formulas are lost in the text
  extraction; the identity was checked by computation instead.
- gorin2021 Definition 3.9 refers to a figure for the sides of the fundamental domain; the pairing
  of `a` with the seam crossed by type-2 lozenges was confirmed by the enumeration of 8.3 on ten
  torus sizes, not from the figure.
- 4.3, 9.4 and the weak-closedness half of 4.6: no finite computation decides them; the routes were
  read and their inputs resolved at the pins.

## Source issues

- **Error** in gorin2021 at Lemma 4.7, line 1766: the source says that for large `n` either `n` or `n + 2` lies in `W_θ`; it should be `n` or `n + 1`, since for `θ = π/2` no even `n` lies in `W_θ`; affects the proof.
- **Error** in kenyon2009 at Theorem 6 and Section 5.4, lines 836–839 and 858–866: the source says there is a unique ergodic Gibbs measure for every slope admitting an invariant measure and deduces ergodicity from extremality in a slope fibre; it should restrict uniqueness to interior slopes, and fibre-extreme measures need not be ergodic; affects a stated result.
- **Error** in aggarwal2023 at the remark after Definition 1.2, lines 465–467: the source says a plane tiling is determined by its type-1 positions unless that set is empty; it should require type-1 lozenges in one of every two consecutive rows (two tilings share the positions `{(0,y) : y ≤ 0}`); affects nothing.

## For the human reviewers

- **Licence.** gorin2021 was read from the author's page as a pre-publication copy of a Cambridge University Press book (`sources.toml`, `licence_class = "author-page"`); the README cites the printed numbering.
- **Licence.** The 3 × 3 unit-hexagon matrix and its column-swap remark in README 3.1 (lines 953–955) coincide with the worked example of gorin2021 lines 722–744; the README cites it and adds type weights.
- **Scope.** Interior uniqueness, the variational principle and Aggarwal's theorem are left to DimerModelsAndLozengeTilingsPartII (README lines 129–137, 2131–2135); no roadmap on main, open pull request or board package has that name.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ffd8f7d85926d0f7fa82756fc88c672cc6a61166", "job": "REV-PKG-DimerModelsAndLozengeTilings~4", "model": "fable", "worker": "chris-x83"} -->
