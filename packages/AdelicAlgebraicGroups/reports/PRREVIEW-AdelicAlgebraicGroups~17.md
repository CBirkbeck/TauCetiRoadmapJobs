# Review of AdelicAlgebraicGroups (pull request #792 at 8175963)

**Verdict:** needs changes

Line numbers below refer to `TauCetiRoadmap/AdelicAlgebraicGroups/README.md` and `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean` at `8175963`. Tau Ceti paths are relative to the pinned Tau Ceti (`2fd255d`), Mathlib paths to the pinned Mathlib (`1b1ccf4`).

The gate passes on this head, and all four findings of r16 (at `938ba48`) are repaired; details under Previous findings. No finding blocks acceptance. The three findings below are P3:
- one target restates four pinned Mathlib facts and cites an Arthur section that does not contain them;
- three AA.4.4 locators point at text that does not contain what they are cited for;
- one AA.3.6 target is announced for reductive groups but stated and defined only for semisimple ones.

## Previous findings (r16 at `938ba48`)

- **R01 (P2), the Weil-restriction headline is statable.** Repaired.
  - `Suggested.lean:9, 11` import `TauCeti.Algebra.HopfAlgebra.WeilRestriction` and `…Adeles.BaseChange`.
  - `Suggested.lean:159–172` states `exists_weilRestriction_adelicPointsEquiv` exactly as r16 proposed. The unstatable list (`:40–49`) no longer names Weil-restriction transport.
  - README `:1376–1377` names it on the *Lean:* line of *base-change-adelic*. Supplier rows "Weil restriction" (`:320`) and "Adelic base change" (`:321`) are added.
  - `grep RG2.0a` finds nothing; `:102–104`, `:206–209`, `:531–534`, `:1319–1322`, `:1332–1336` and `:1367–1375` cite the pinned declarations.
  - The theorem elaborates with the type of its README statement (below), and the one-tactic probe fails on it.
- **R02 (P3), congruence kernels.** Repaired. The "Congruence subgroups" row (`:322`) lists the pinned declarations, and `:1517–1519`, `:1540–1541` cite them. AA.5.2 (`:5231–5254`) defines `K(N)` through `TauCeti.HopfAlgebra.congruenceSubgroup` and cites membership, functoriality, openness and monotonicity. `grep RG2.0.3` finds nothing.
- **R03 (P3), docstring instances.** Repaired. `Suggested.lean:33–37` now reads "Hausdorff topological groups, locally compact for finite-type `H`. Their second countability … is a README statement, not an instance at these imports."
  - On a scratch copy with `[Algebra.FiniteType F H]`, `inferInstance` finds `T2Space`, `IsTopologicalGroup` and `LocallyCompactSpace` for all four carriers (12 of 12), and `LocallyCompactSpace (v.adicCompletion F)`.
  - So the sentence is accurate as written, local points included.
- **R04 (P3), Borel §1.8 locator.** Repaired.
  - `:1263–1270` is now an owned deduction through Mathlib `Subgroup.isClosed_of_isDiscrete` (`Topology/Algebra/OpenSubgroup.lean:372`) and `discreteTopology_iff_isOpen_singleton_one`.
  - Borel §1.8 is kept as the `S`-component companion (borel line 184–186, p. 9).

## R01 (P3) — *Topology of a closed homogeneous quotient* restates pinned Mathlib, and its Arthur locator does not contain it

Location: `README.md:1820–1826`: "prove that `H\G` is locally compact, Hausdorff and second countable, that `q` is open, and that over each compact subset … ([Arthur], §1, pp. 7–9; [BHV], …)".

Claim: these four topological facts are a target of this roadmap, supported by Arthur §1.

Witness: Mathlib proves all four for `MulAction.orbitRel.Quotient H G` with `H` closed (the declarations are listed in the repair). Arthur §1 assumes only a discrete `Γ` in a unimodular `H` (arthur line 207–209).

Repair:
1. Cite these Mathlib declarations for the Hausdorff, locally compact, second countable and open-map clauses, and add them to "From Mathlib":
   - `t2Space_quotient_mulAction_of_properSMul` (`Topology/Algebra/ProperAction/Basic.lean:113`), using that left actions of closed subgroups are proper (`:194–206`);
   - `IsOpenQuotientMap.locallyCompactSpace` (`Topology/Compactness/LocallyCompact.lean:190`) with `MulAction.isOpenQuotientMap_quotientMk` (`Topology/Algebra/ConstMulAction.lean:616`);
   - `ContinuousConstSMul.secondCountableTopology` (`:659`);
   - `isOpenMap_quotient_mk'_mul` (`:609`).
2. Keep only compact lifting as owned: cover a compact `K ⊆ H\G` by `q`-images of relatively compact open sets, which works because `q` is open; take a finite subcover and the union of the closures.
3. Delete "[Arthur], §1, pp. 7–9" from this target.

Tested: a scratch file (`import Mathlib`; `G` a second countable locally compact Hausdorff topological group, `H` closed) elaborates with exit 0:
- `T2Space (MulAction.orbitRel.Quotient H G) := inferInstance`;
- `LocallyCompactSpace …` by the second item's lemma pair;
- `SecondCountableTopology …` by the third;
- `IsOpenMap (Quotient.mk (MulAction.orbitRel H G))` by the fourth.

## R02 (P3) — Three AA.4.4 locators do not contain what they are cited for

Locations, witnesses and repairs:

| Location (quote) | Witness | Repair |
|---|---|---|
| `:4760–4763`, *compact-kernel-split-centre*: "multiplication gives `K∞ ≃ A_G(ℝ)^0 × (K∞ ∩ ker H_{G,∞})` ([Arthur], §2, pp. 13–15)" | arthur lines 567–694 (pp. 13–15) are (2.1), the Hecke algebra and (2.2). `A_G` appears only at p. 15 line 742, which is already §3. The product `G(𝔸) = G(𝔸)^1 × A_G(ℝ)^0` is §3, p. 16 (line 763–765). | "([Arthur], §3, pp. 15–16, for the product decomposition; the restriction to `K∞ ⊇ A_G(ℝ)^0` is this roadmap's deduction)" |
| `:4841–4845`, *Fibre mass for full stabilizers*: "`∑_{y↦x} 1/\|A_y\| = [U : U′]/\|A_x\|` ([Arthur], §1, pp. 7–8)" | arthur lines 204–300 (pp. 7–8) are the compact-quotient Selberg trace formula. They contain no level map and no fibre mass. | Replace the locator with "this roadmap's deduction: orbit–stabilizer for the finite group `A_x` acting, through conjugation by `g`, on the `[U : U′]` cosets `U/U′`", as the next target already does. |
| `:4674`: "`GroupTheory/DoubleCoset/Map.lean`, lines 38–67" | At the pinned Tau Ceti, `quotientMapOfLELeft` is at line 34 and `quotientMapOfLELeft_surjective` at line 72, both outside 38–67. | "lines 34–76" |

Tested on `GL₁/ℚ` with `K∞ = ℝ_{>0} = A_G(ℝ)^0`:
- `K∞ ∩ ker H_G = {1}`, and the decomposition is the p. 16 product restricted to `K∞`.
- For `U(3) ⊃ U(9)`, every rational stabilizer is `ℚ^× ∩ ℝ_{>0}U = {1}`. The fibre sum is `3 = [U(3) : U(9)]/1`, as orbit–stabilizer gives.

## R03 (P3) — *Finitely many fixed-`K` Siegel sets cover* is announced for connected reductive `G` but stated and defined only for connected semisimple `G`

Location: `README.md:3565–3568`: "The theorem applies to connected reductive `G`; the window enlargement … For `G` connected semisimple over `ℚ`, `Γ` arithmetic, `K` fixed and `M ⊂ K` compact".

Claim: the covering by finitely many fixed-`K` Siegel sets holds for connected reductive `G`.

Witness: AA.3.2's Siegel sets assume "`𝐆` connected semisimple over `ℚ`" (`:2618`). The cited source has the same setting: bkt line 25 and line 301 assume a connected semisimple `ℚ`-group for Proposition 2.7(1) (line 378–382).

Repair: delete "The theorem applies to connected reductive `G`;". If the reductive case is wanted, state it as its own target on the Siegel triples of AA.3.7, whose source setting (Orr §2.B, orr line 216) is reductive, with its own locator.

Tested:
- For `G = G_m` over `ℚ` the deleted sentence asserts a covering by Siegel sets that AA.3.2 does not define, since its hypothesis excludes tori.
- The semisimple statement is unaffected. For `SL₂/ℚ` there is one `Γ`-class of `ℚ`-parabolics (`ℙ¹(ℚ)` is one `SL₂(ℤ)`-orbit, borel line 862–863), and one Siegel set with `t < √3/2` covers.

## Verified sound

**Gate, build and dependency check.**
- **Gate.** My run on `8175963` prints `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 … statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run adds `build=0`.
- **Folder contents.** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- **Build.** `lake env lean` on `Suggested.lean` exits 0 with 19 warnings, all `declaration uses 'sorry'`: the 18 of r16 plus the new theorem.
- **Dependency check.** The movable check prints `depcheck: 239 roadmaps, 2365 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
  - `ORDER.txt` lists suppliers SmoothRepresentationsOfLocalGroups (line 25), PolylogarithmFunctions (38), AnalyticNumberTheoryPartI (49) and AnalyticNumberTheoryPartII (50), then this roadmap (51).
  - Later come consumers: SieveMethodsAndPrimePatterns (56), ArithmeticLocallySymmetricSpaces (58) and ProbabilisticAndMetricNumberTheory (61).
  - The ProbabilisticAndMetricNumberTheory and KleinianGroups mentions (`:1838`, `:3136`, `:3162`) are prose about downstream special cases, not *Needs:* edges.
  - No never-cite roadmap is cited.

**Signatures.**
- I elaborated `#check @name` for 52 declarations in one scratch file: all 19 theorems and the definitions and structures they use. The `GL₂` abbreviations were read in the source. The run exits 0.
- The new theorem elaborates to `∀ F [Field F] [NumberField F] E [Field E] [NumberField E] [Algebra F E] HE [CommRing HE] [HopfAlgebra E HE] [Algebra.FinitePresentation E HE], ∃ e, ∀ x h, (e x).ofConv h = adeleBaseChangeAlgEquiv F E (comm F E 𝔸_F ((pointsMulEquiv F E HE 𝔸_F x).ofConv h))`.
  - Its generality matches the README: finite type equals finite presentation over a field, and `E/F` is automatically finite.
  - The pinned `WeilRestriction` needs `Module.Finite` and `Module.Projective` over `F` (`RingTheory/WeilRestriction/Basic.lean:222–223`), both found by inference.
- The five dropped-binder leads of `signatures.md` are harmless:
  - `box` does not use its `TopologicalSpace`;
  - `InfinitePoints`, `IsCentralCocharacter`, `algebraicPointMap` and `IsFaithfulAlgebraicPointHom` do not use `[NumberField F]`.

**One-tactic probe.**
- On a scratch copy, the new theorem's `sorry` was replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | (trivial; done) | (decide; done) | (norm_num; done) | (exact?; done)`. Every alternative fails, and `exact?` reports it could not close the goal. So the theorem is not padding.
- The other 18 statements are unchanged since r16, whose probe failed on all of them.

**Headline theorems.** All are stated, except those the docstring names as not statable:

| Headline | Lean statement |
|---|---|
| Convergent Haar products | `exists_unique_convergentHaarProduct` |
| Restricted-product comparison | `exists_restrictedProductEquiv` |
| Restriction of scalars on adelic points | `exists_weilRestriction_adelicPointsEquiv` |
| Arithmetic covolume | `arithmetic_finite_volume_iff` |
| Finite class numbers | `finite_classes` |
| Finite volume | `exists_fundamentalDomain_normOne_lt_top`, `finite_volume_iff` |
| Compactness | `exists_compact_normOne_iff` |
| `GL_n` reduction | `exists_reduced_GLZ` |
| Weak and strong approximation | `hasWeakApproximation_of_simplyConnected`, `hasStrongApproximation_of_simplyConnected` |
| Neat levels, covering maps, Hecke degree (`U′ = U ∩ gUg⁻¹`) | `exists_isNeatLevel_le`, `isCoveringMap_levelMap` |
| Quaternion norms | `nrd_image` |
| Idele classes modulo squares | `compactSpace_ideleClassGroup_quotient_squares` |
| Fourier limits | `tendsto_quadraticKernel_haar`, `isMulLeftInvariant_of_tendsto` |
| `GL₁` tori | `nonempty_connectedComponent_homeomorph` |
| `GL₂` decomposition | `exists_componentHomeomorph` |

The docstring's unstatable items each name their missing carrier: Tamagawa normalization (gauge measures, Artin L-functions), Siegel covering and cusps, the disconnected criterion, the torsor Hasse principle, `GL₁` classes and cohomology, and the `GL₂` Riemann surfaces.

**Library declarations opened at the pins (53).**

| Area | File and line |
|---|---|
| Tau Ceti, Weil restriction | `Algebra/HopfAlgebra/WeilRestriction.lean:215, 242, 274, 318, 403, 451`; `RingTheory/WeilRestriction/Basic.lean:222, 228, 248`; `RingTheory/WeilRestriction/Composition.lean:65, 90`; `Topology/Algebra/PointTopology/WeilRestriction.lean:53` |
| Tau Ceti, adelic base change | `NumberTheory/NumberField/Global/Adeles/BaseChange.lean:177, 188, 209, 275` (`adeleBaseChangeAlgEquiv_symm_algebraMap` gives the `E`-linearity of the coefficient map) |
| Tau Ceti, congruence subgroups | `Algebra/AlgebraicGroup/CongruenceSubgroup/Basic.lean:62, 73, 101, 106, 112, 161`; `…/Topology.lean:67`; `…/GeneralLinear/CongruenceSubgroup.lean:36, 48`; `…/GeneralLinear/Topology.lean:100`; `RingTheory/DedekindDomain/FiniteAdeleRing/Basic.lean:133` |
| Tau Ceti, point topology and double cosets | `Topology/Algebra/PointTopology/Separation.lean:97, 113`; `…/Basic.lean:261`; `GroupTheory/DoubleCoset/Map.lean:34, 43, 50, 64, 72`; `GroupTheory/DoubleCoset/Fiber.lean:57, 81` |
| Mathlib | `Topology/Algebra/OpenSubgroup.lean:372`; `GroupTheory/Index.lean:643`; `Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:58, 83, 188, 191`; `Topology/Algebra/ProperAction/Basic.lean:113, 205`; `Topology/Algebra/ConstMulAction.lean:609, 616, 623, 659`; `Topology/Compactness/LocallyCompact.lean:190`; `Topology/Algebra/Group/Quotient.lean:50, 119, 140` |

Name index: all 101 backticked `TauCeti.*` declaration names of the README, and 30 further cited Mathlib and Tau Ceti names, occur as declarations at the pins. The 102nd name is the namespace `TauCeti.PointTopology`.

**Cross-roadmap citations resolved** (main at `172efce`, open heads from the index).
- **AnalyticNumberTheoryPartII** (head `3f8e782`):
  - §5.3f (`README.md:668`), §5.3h (`:699`), §5.3j (`:720`, `O_v^×` mass `N(𝔇_v)^{−1/2}`), §5.3k (`:733`), §5.3l (`:745`), §5.3m (`:764`);
  - `exists_unique_restrictedAddHaar` (`Suggested.lean:268`), `exists_unique_quotientMeasure` (`:313`), `gl2_classNumber` (`:353`).
  - §5.3k gives uniqueness only among measures satisfying the integration formula, so AA.2.2's uniqueness among all invariant Radon measures is a genuine addition.
- **AnalyticNumberTheoryPartI** (head `8984606`): §2.18a (`README.md:12, 14`), which names this roadmap as consumer.
- **ReductiveGroupsPartII on main.**
  - Targets: *smooth-group-analytic-charts* `:640`, *equal-characteristic-…* `:682`, *reductive-model* `:3858`, *hyperspecial-vertices* `:4447`, *lang-theorem* `:5203`, *iwasawa-parabolic-integral* `:6304`, *kneser-tits-local* `:6339`, *parabolic-adjoint-determinant* `:6389`, *iwasawa-integration-and-unimodularity* `:6427`, *levi-of-apartment-vector* `:2377`.
  - Names: `AlgebraicRelativeRoots` `:176`, `characterValue_coe` `:1588`, `ZExtension.derivedIdeal_{gl,sl}_n` `:2588–2590`.
  - Lean: `Lang.lang_surjective` (`Suggested.lean:212`), `LocalIntegration.modularCharacter_eq_adjointModulus` (`:314`), `Decomposition.modularCharacter_eq_one` (`:330`).
- **ProbabilisticAndMetricNumberTheory** (pull request 1421): `lattice_invariant_probability_unique` (`README.md:6344`), `modularQuotient_existsUnique_invariant` (`:6435`).
- **KleinianGroups** (pull request 432): `isDiscrete_bianchi` (`Suggested.lean:192`).
- **Consumers** still find what they cite:
  - ArithmeticLocallySymmetricSpaces: §4.3 `Neat.IsNeatLevel`, §3.4 `Reduction.levelArithmetic`;
  - ShimuraVarieties, ShimuraData (§§1.3–1.4), AutomorphicBundles (§4.3, §4.5);
  - main's ClassicalArithmeticCompletion: AA §4.2, §3.4, and AA.2.4, whose old → new move to AnalyticNumberTheoryPartI §2.18a is recorded at `:77–80`.

**Ownership.**
- `roadmaps grep` over main and every open head for the new headline, `HasStrongApproximation`, `IsNeat*`, `levelArithmetic` and the convergent Haar product finds a second definition only in the ClassicalArithmeticCompletion revision (pull request 1409, `Suggested.lean:677`). That revision's main version already cites AA §4.2, so the duplicate is that pull request's to remove, as r15 and r16 concluded.
- `overlaps.md` reports no open pull request changing this roadmap and no dropped ids.
- ReductiveGroupsPartII on main still lists this roadmap as consumer of RG2.0.3 and RG2.0a (`README.md:7165–7173`) and cites `AdelicPoints.gm_not_subspace` (`:459`). These are that roadmap's records, made stale because AA now consumes the pinned Tau Ceti carriers. No change is needed in this folder.

**Sources: the seeded sample, read at the locators.**
- **Printed pages.** Borel's printed page is the page marker plus 3, and Witte Morris's the marker minus 16. For Conrad, Arthur, Milne, BKT, the BKT erratum, LT, Rapinchuk, Khayutin, Orr, Rosengarten, Gordon, Dudas–Michel and CG, markers equal printed (arXiv) pages.
- **Fetching.** Rosengarten (arXiv 1806.10723v3), Rapinchuk (1207.4425), Gordon (2205.02391v1), Khayutin (1710.04557v3), Orr (1609.01315v6), Dudas–Michel (author page) and CG (1207.4224v2) were fetched through the sources service, with no manifest edit.
- **Unverified flags.** The README flags no locator as unverified.

| Sample target | Locators checked (source line) | Result |
|---|---|---|
| 0.2 | AnalyticNumberTheoryPartII §5.3f (its README `:668`) | supports |
| 0.3 | Rosengarten §1 p. 2 (rosengarten 49–63), Lemma 3.5 p. 26 (1017–1030); Conrad Thm 3.6 p. 6 (281–295); Borel §5.5 p. 21 (672–678) | supports; PRR Lemma 3.63 paywalled |
| 1.2 | Conrad Prop 2.1 p. 2 (53–61), Rem 3.5 p. 6 (253–277), Thm 3.6 p. 6 (281–295), (3.6.2) p. 7 (308), §4 p. 9 (422–437); Borel §1.2 p. 7 (98–118); Witte Morris A4.6 p. 435 (18075) | supports |
| 1.4 | Borel §1.3 p. 7 (121–128), §1.4 pp. 7–8 (129–146); Conrad Ex 2.4 p. 3 (119–128), Ex 4.2 pp. 9–10 (452–470); Arthur §2 p. 11 | supports |
| 1.5 | Borel–Tits Thm 5.3 p. 96 (1711–1717, with `Z°` in the proof); Borel Lemma 5.5 p. 20 (655–658), §1.7 p. 8 (168–176), §1.2 p. 7 (98–106); Milne §4 p. 42 | supports |
| 2.1 | Arthur §3 pp. 15–16 (742–765), §5 p. 24 incl. (5.1) (1307–1310), §6 p. 30 (1588–1590); Borel §1.3 p. 7, §1.5 Prop p. 8 (155–156), Lemma 5.9 and §5.8 p. 22 (716–736) | supports |
| 2.2 | Arthur §5 p. 25 (1348–1351); Arthur §1 pp. 7–9 (204–300) | §5 supports (sign misprint under Source issues); §1 does not (R01); PRR Thm 3.64 paywalled, BHV unread |
| 2.4 | Rosengarten §1.1 pp. 2–3 (49–91); Gordon (1) p. 3 (117), (48) p. 32 (1626); Dudas–Michel Prop 7.12(iii) p. 27 (1245), Prop 7.14 p. 28 (1278–1279) | supports (7.14 misprint under Source issues); PRR Thms 3.71, 5.22, Ex 5.23 paywalled |
| 2.5 | Rosengarten §1 p. 2 (61–62); Gordon (48) p. 32 | supports; PRR Thms 3.60, 3.71 paywalled |
| 3.2 | BKT §2.2 and (2.2) p. 8 (331–346), Def 2.3 (358–360), Lemma 2.4 (365–366), Def 2.5 p. 8 (367–373), (2.4) p. 9 (426), §4.5 p. 17 (799); erratum §1.1 p. 1 (11–19), Rem 1.1(1) p. 2 (50–52) | supports |
| 3.6 | BKT Prop 2.7(1)–(5) p. 9 (378–392); Borel Thm 7.3 p. 25 (862–863); Orr §§2.B–2.C pp. 6–7 (216–246) | supports, except the generality sentence (R03) |
| 4.2 | Rapinchuk Def p. 7 (349–350), Prop 2.1 p. 9 (436–440), §2.3 pp. 9–11 (446–542), Thm 2.3 and Remarks p. 12 (565–580), §2.6 and Lemma 2.7 p. 16 (742–744), §3 p. 17 (814); Arthur Thm 2.1(a) p. 12 (539–542), §16 p. 89 (5167); Borel §2.6 p. 13 (366–371) | supports; Schneider, Platonov and PRR not read |
| 4.4 | Milne Lemma 5.11 p. 56 (2462), Lemmas 5.12–5.13 and footnote 40 p. 57 (2475–2513), p. 58 (2516–2525); LT §3.2 p. 11 (407), (20) and (21) p. 14 (496, 519), §3.2.3 p. 16 (578) | supports, except R02 |
| 4.6 | Khayutin §2.3 pp. 15–16 (653–658), Def 3.1 p. 22 (912), Prop 3.6 p. 24 (1001), proof p. 25 (1013–1034) | supports; PRR Thm 1.34 paywalled |
| 5.2 | Milne §4 p. 42, Prop 4.1 p. 43 (1911), Lemma 5.13 p. 57 (2486), `T(g)` p. 58 (2522–2524), Thm 5.17 p. 59 (2579), p. 63 (2728–2730); Borel §1.7 p. 8 | supports |

Outside the sample, I read CG §8.2, p. 79 (cg line 3582) for the README's correction in *gl1-XQ-components*. The correction is right (see Source issues).

**Adversarial table.** Every value was computed this round.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| Lean `exists_unique_convergentHaarProduct` | `ι = ∅`; one `C₄`, `B = {0,2}`, `S = ι`; `SL₂` tails | Dirac: `1·∏'∅ = 1`; mass `2`, empty tail; `∏(1 − q_v⁻²) > 0`, `< 1` | true |
| 0.2 *restricted-haar-product* | right invariance on `C₂` counting | left box `{0}` = right box = `1` | true |
| 0.3 finite rescaling | two `C₂`, `c = (2, ½)`; one factor `c = 2` | `∏ᶠc = 1`, mass `4 = 4`; `8 = 2·4` | true |
| 0.3 factorizable integral, functoriality | `C₂` with constant `2`; `2, 3` on two copies; `x ↦ 2x` on `ℝ` | `4`; `4·6 = 24`; `[0,2]` has pushforward mass `1` | true |
| 1.1 integral models | `G_a`, `X ↦ pT` | `localPoints = p⁻¹𝒪_v ⊋ 𝒪_v`; `Γ = p⁻¹ℤ` at `S = {∞}` | true |
| Lean `exists_restrictedProductEquiv` | standard `G_m` model; `H = F` | `𝔸_f^× ≃ Πʳ[ℚ_p^×, ℤ_p^×]`; singletons | true |
| 1.2 Lie components | `μ₂`; `SO(x²−y²)`, `SO(x²+y²)`; `SL₂`, `PGL₂`; `ℤ ⊂ ℝ` | `2`; `2`, `1`; `1`, `2`; infinitely many, Zariski closure `G_a` | true |
| 1.3 discreteness (r16 R04) | `G_a`, `U = Ô_F`; `GL₁/ℚ`, `ℤ̂^×` | `F ∩ Ô_F = 𝒪_F` infinite, not discrete; `{±1}` finite, discrete | true |
| Lean `exists_weilRestriction_adelicPointsEquiv` | `ℚ(i)/ℚ`, `G_a`, point `i`; conjugate coefficient map; `E = F` | `i⊗1 ↦ 1⊗i ↦` diagonal `i`; conjugate gives `−i` and is not `ℚ(i)`-linear; unit equivalence | true; not padding |
| 1.4 tower clause | `ℚ⊂ℚ⊂ℚ`, `G_m`, inversion twist | identity on points vs `2 ↦ ½` | true |
| 1.5 `Δ` on compact and central | upper Borel of `GL₂(ℝ)`, left Haar `da db dd/(a²\|d\|)` | `map(·diag(a,d))` factor `\|a/d\|`: `1` on `diag(a,a)` and `diag(±1,±1)`; `2` at `diag(2,1)` on the closed `{diag(a,1)}`; `ax+b`: `\|a\|` | true |
| 1.5 Weyl orbit products | `GL₂`, `diag(2,1)`; `SL₂`, `diag(2,½)`; `PGL₂`, `[diag(−1,1)]` | `2I`; `I`; `α(b) = −1`, `b² = 1`, `b ∉ Z∩A = 1` | true |
| 1.5 *local-congruence-levels* | `[[1,1],[0,1]]`; `[[1,0],[1,1]]` | in `K₁`, not `K`; in neither (`c = 1 ∉ N𝒪_v`) | true |
| 2.1 characters, `a_G` | `det` on scalars of `GL₂`; `Res_{ℚ(i)/ℚ}G_m`; squaring | `1 ↦ 2`, cokernel `ℤ/2`; rank `1` vs `2`; `a(φ) = 2` | true |
| 2.1 `H_G` | ideles `1` and `p` at `p`; `ℚ[ℤ^(ℕ)]` | norms `1`, `p⁻¹`; `x_n → 1` but `H_G(x_n) = e_n`, and a functional with value `1` on every `e_n` is continuous | true |
| 2.1 `A_G` | `G_m × T¹`, graph of `φ`; real quadratic `(2, ½)` | central, meets `G(𝔸)^1` in `1`, not `ℝ_{>0}×1`; norm `1`, not scalar | true |
| 2.2 modulus | `O(GL₂)/(X₁₀)` at `diag(2,1)` and `diag(1,2)`; `ℚ₃` at `diag(3,1)`; `n(x)diag(a,1)` | `2`, `½` (det norms `2`, `2`); upper `⅓`, lower `3`; `(a,x)↦(2a,x)` doubles `da dx/a²`, `Δ = 2` | true |
| 2.2 conventions vs Arthur p. 25 | `ax+b`: left `da db/a²`, right `da db/a` | `d_l/d_r = a⁻¹ = δ⁻¹`, as the README says; Arthur prints `e^{+2ρ}` | README true; source misprint |
| 2.2 closed homogeneous quotient | `G` second countable LCH, `H` closed | `T2`, LC, second countable, open map elaborate in Mathlib | restates Mathlib (R01) |
| 2.4 gauge forms | upper Borel `diag(a,d)`; `O(GL₂)/(X₁₀)`, `diag(2,1)`; `G_a/ℂ` | pullback `(a/d)⁻¹`; Ad det `2`, pullback `½`; unit square `2`, `[0,2]²` `8`, `dx dy` gives `1` | true |
| 2.4 Weil, orders, corrected volumes | `GL₂`, `q = 2`; `SL₂/𝔽₂`; nonsplit rank one; `n = 0` | `6/16 = 3/8`, corrected `3/4`; `2·1·3 = 6`; `\|−2−1\| = 3`; `GL₀` correction `2 ≠ 1` | true |
| 2.4 absolute convergence | `q⁻¹` coefficient | `−tr θ + #(θ-fixed simple roots) = −tr(θ\|X*(H)_ℚ)`, cancelled by `L_v(X*(G),1)` | true |
| 2.4 Tamagawa | `G_a/ℚ` on `[0,1)×ℤ̂`; `G_m` | `1`; `λ_v·(1−q_v⁻¹) = 1` | true |
| 2.5 global Jacobian | `ℚ(i)/ℚ`, `β = (1,i)`; `ℚ(√2)/ℚ`, `β = (1,√2)`; `E = F`, `β = (b)` | `½ = 4^{−1/2}`; `\|D\| = 2√2`, `1/(2√2) = 8^{−1/2}`; `∏\|b\|_v⁻¹ = 1` | true |
| 2.5 gauge restriction | `G_a`, `β = (b)`; trivial group, `ℚ(i)`, gauge `1+i` | `ω_β = b⁻¹dx`, `j = \|b\|⁻¹`; `N = 2`, masses `2` and `½` | true |
| 2.5 `τ(Res G_m)` | `ℚ(i)/ℚ` without `\|d\|^{−d/2}` | factors `1` and `2` | true |
| 3.2 reduced forms | `I`; `diag(4,1)`; `diag(1,4)`; `diag(1,¼)`; basis change `diag(1,N)` | reduced; (2) `4 < 2` fails; reduced; (2) `1 < ½` fails; swapped basis needs `C″ > N` | true |
| 3.2 fixed `K` | `k = [[0,−1],[1,0]]`, `u = n(1)` | `k·i = i` (height `1`); `k(1+i) = −½+½i` (height `½`) | true |
| 3.2 Cholesky and diagonal bounds | `b_i ≥ d_i`, `∏d = det` | `b_i/d_i < C`, `d_i/d_{i+1} < C²`; `(B⁻¹)_kk ≤ D/d_k` | true |
| 3.6 cusps and covering | `SL₂/ℚ`; `G_m/ℚ` | one `Γ`-class, `t < √3/2` covers; AA.3.2 sets undefined | R03 |
| Lean `arithmetic_finite_volume_iff` | `G_m/ℚ`; `SL₂/ℚ` | `{±1}\ℝ^×` infinite and `X* = ℤ`; finite and `X* = 0` | true |
| Lean `finite_classes` | `G_m`, `ℤ̂^×`; `U = {1}` | `Cl(ℤ) = 1`; excluded by `IsOpen` | true |
| Lean `exists_fundamentalDomain_normOne_lt_top`, `finite_volume_iff` | `G_m`; `G_a` | `ℚ^×\𝔸¹` compact, full quotient infinite; `𝔸/ℚ` compact, `X* = 0` | true |
| Lean `exists_compact_normOne_iff` | `G_m`; `GL₂`, `X₁₁ ↦ T` | central; `[[2,2],[0,1]] ≠ [[2,1],[0,1]]` | true |
| Lean `exists_reduced_GLZ` | `n = 0` | `1 < C·1` needs `C > 1`; `C = 2` | true |
| Lean `hasStrongApproximation_of_simplyConnected` | `G_m/ℚ`, `x = 2` at 2, `U` with `1+5ℤ₅`; `PGL₂`, class `2` at 5; `SL₂ × D¹` | `±2 ≡ 2, 3 (mod 5)`; squares mod 5 are `{1,4}`; `hS` fails for compact `D¹(ℝ)` | true |
| Lean `hasWeakApproximation_of_simplyConnected` | `μ₂`, `{∞,2}` (non-example); trivial group | `{(1,1),(−1,−1)}` not dense; a point | true |
| 4.3 neat elements | `(0 −1; 1 1)·2`; `ζ₃` at 3; `−1` at 2 | ratio `ζ₃`, det `4`; `3^{−1/2}`; boundary `½` | true |
| Lean `exists_isNeatLevel_le` | `GL₂`, `U = GL₂(ℤ̂)` | `K(3)`, index `48`; `GL₂(ℚ) ∩ K(3) = Γ(3)` | true |
| Lean `isCoveringMap_levelMap` | `GL₁`, `U(3) ⊃ U(9)`; `SL₂`, `Γ(9) → Γ(3)`; `ℚ(√2)`, `η = 17+12√2` | `2 → 6`, fibres `3`; `648/24 = 27`; `η ≡ 1+4√2 (mod 8)`, `η² ≡ 1`, `(L,−L) ≡ √2(L,0) mod Λ`, irrational rotation | true; `hKH` needed |
| 4.4 double cosets | `S₃`, `g = (01)`, `k = (12)`; `a = (01)(12)` | `(gk)(0) = 1`, `(kg)(0) = 2`; `(ga)(0) = 0`, `(ga⁻¹)(0) = 2` | true |
| 4.4 compact kernel, fibre mass | `GL₁`, `K∞ = ℝ_{>0}`; `U(3) ⊃ U(9)` | `K∞ ∩ ker H_G = 1`; `3 = 3/1` | true; locators (R02) |
| 4.4 groupoid | `GL₂`, `ℝ_{>0}O(2)` at `1`; `ℝ_{>0}SO(2)` at `i`, `ρ` | `O₂(ℤ)` order `8`, `hrh⁻¹ = r⁻¹`; `4`, `6` (`8`, `12` with `O(2)`) | true |
| 4.5 Hecke | `diag(p,1)` at `p`; Iwahori `diag(p,1)` vs `diag(1,p)` | index `p+1`; zero first column vs zero bottom row | true |
| Lean `nrd_image` | Hamilton, `c = −1, 3`; split `a = 1` | no norm, RHS false; `1+1+1`, RHS true; RHS vacuous, every `c` a norm | true |
| Lean `compactSpace_ideleClassGroup_quotient_squares` | `2` at `∞`; `−1` at 3 | `√2` is an idele, dies; a rational square would make `−1` a square in `ℚ₃`, survives | true |
| 4.6 pushforward | `C₄`, `T = {0,2}`, shift `1` | mass `½` at `1`, `3` | true |
| Lean Fourier pair | coordinates on `∏ℕ{±1}`; a repeated `χ` | `∫χ_m dm_n = 0` (`m ≠ n`) `→ 0`; kernel Haar measure as limit, excluded by `hχ` | true |
| Lean `nonempty_connectedComponent_homeomorph` | `ℚ`; `ℚ(√2)`, `Q = ∅`; `levelQ` at `3`, `p = 2` | rank `0`, a point; `⟨2 log ε⟩`, a circle; `4` in, `2` out | true |
| 5.2 congruence levels | `N = 𝒪_F`; `[[1,1],[0,1]]`; `N = 0` | `congruenceSubgroup_top`, all of `GL₂(Ô_F)`; entry `1 ∉ NÔ_F`, in `K₁` only; `congruenceSubgroup_bot`, `{I₂}` not open | true |
| Lean `exists_componentHomeomorph` and 5.2 components | `GL₂(ℤ̂)`; `K(3)` with `SO(2)` vs `O(2)`; `−I` at levels 2, 3; section at `2+3i` | one component; `2` vs `1` (milne line 2730); `∈ Γ(2)`, `∉ Γ(3)`; `[[3,2],[0,1]]`, det `3` | true |
| 5.3 level change | Hurwitz order, `U₁(9)` at 3 | `72` rows, traces `−2…2`, `2 − trd ≡ 0 (mod 9)` only at `1`; `3 = (72/2)·(1/12)` | true |
| Docstring instances | four carriers, finite-type `H` | `T2Space`, `IsTopologicalGroup`, `LocallyCompactSpace`: 12 of 12 inferred | true (r16 R03) |

## Not verifiable

- **Platonov–Rapinchuk–Rapinchuk 2023 and Platonov–Rapinchuk 1994.** Cambridge University Press and Academic Press paywalls.
  - Every PRR and PR locator is taken as given, including the `Suggested.lean` docstring locators (Theorems 4.12, 5.22(2), 5.24, 7.8, 7.12, 1.34, Lemma 3.63).
  - The README's statement that the proof of PRR Theorem 5.22, p. 315, prints an exponent `d` in its scalar-rescaling sentence could not be checked.
- **Paywalled or unread:**
  - Schneider 2011 and Voight 2021 (Springer), Borel–Harish-Chandra 1962 (JSTOR): paywalled.
  - Platonov 1969 and its addendum: the English translation is paywalled, and the README's pagination is that of the translation.
  - BHV: no legal copy located.
  - Khayutin's Annals pagination and BKT's JAMS pagination: only the arXiv versions were read.
- **Outside this round's sample:** Sutherland, Conrad RGS, Casselman, Loeffler, HW, Orr–Schnell, BGST and the Stacks tags were not read this round.
- **Not in the manifest.** The roadmap's `sources.toml` records only ten works. The other cited works were read through the sources service without a manifest edit, which this review does not make.
- **Ownership against open pull requests:** checked by `roadmaps grep` over every open head. I did not read the full READMEs of ShimuraVarieties, ShimuraData or the ReductiveGroups revisions.

## Source issues

- **Misprint** in arthur at §5, p. 25: the source says left and right Haar measures on `P(𝔸)` satisfy `d_ℓp = e^{2ρ(H_P(p))} d_rp`; it should be `e^{−2ρ(H_P(p))}`, as its own §7, p. 32, `mn`-order formula and the `ax+b` group give; affects nothing.
- **Misprint** in Dudas–Michel at Proposition 7.14, p. 28: the source says `|T_w^F| = det(wF − 1 | X(T))`; it should be the absolute value of that determinant, which is `−(q+1)` for the nonsplit rank-one torus; affects nothing.
- **Error** in CG at §8.2, p. 79 (arXiv v2): the source says the component group of `X_Q` is the maximal exponent-`p^n` quotient of the ray class group of conductor `Q`; it should be an extension of the narrow class group by a quotient of `∏_{v∈Q} 𝒪_v^×/𝒪_v^{×p^n}` (`ℚ(√−5)`, `Q = ∅`, `p = 3` gives `ℤ/2`); affects a stated result.
