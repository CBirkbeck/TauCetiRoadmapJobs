# Review of AdelicAlgebraicGroups (pull request #792 at 734ad39)

**Verdict:** needs changes

The gate passes on this head: every check is 0, including `depcheck=0`. All eight findings of the previous review (r14, at `d2e6304`) are repaired in this folder; the details are under Previous findings. One blocking finding remains. `Suggested.lean` restates as a scoped instance the point topology that the pinned Tau Ceti already provides as a global instance, and the README attributes that pinned API to a roadmap target (R01). The other four findings are P3: three locators that do not contain their statements, and one Check that does not discriminate.

## Previous findings (r14 at `d2e6304`)

- **R01 (P1), strong approximation had no owner.** Repaired. `README.md:4036–4037` reads: “define `Approximation.HasStrongApproximation F H S_f : Prop` to say that `G(F)G(F_S)` is dense in `G(𝔸_F)`”. The four targets are back: *Strong approximation* (`:4033`), *Borel density for S-arithmetic groups* (`:4109`), *strong-approximation-sufficiency* (`:4293`) and *Strong approximation for semisimple groups* (`:4324`), each with its Checks. `Suggested.lean:333–337` and `:358–366` match `2ca91be` line for line, apart from the pin rename `TauCeti.AlgHom.mapValue` → `AlgHom.mapValue`. Neither file mentions SieveMethodsAndPrimePatterns or a §5.3a any more.
- **R02 (P2), upward edge to SieveMethodsAndPrimePatterns.** Repaired. The movable dependency check prints `depcheck: 239 roadmaps, 2361 edges, 0 problem(s)`.
- **R03 (P2), strong-approximation headline missing from `Suggested.lean`.** Repaired. `README.md:4342` reads “*Lean:* `Approximation.hasStrongApproximation_of_simplyConnected`”, and the theorem elaborates (below).
- **R04 (P2), second owner in ClassicalArithmeticCompletion.** Repaired on this side: `README.md:5378` adds the Downstream consumers row for §§7.26 and 7.44. The section ids resolve on main (`ClassicalArithmeticCompletion/README.md:14986`, `:15080`, `:15456`), and main's `:137` imports AA §4.2. The residual sits in that roadmap's open revision, pull request 1409 at `aa03308`. Its §7.44 (`README.md:14925–14939`) and its `Suggested.lean:670`, `:677` still declare their own `evaluationTopology` and `HasStrongApproximation`, in a different namespace. Deleting them belongs to that pull request's review; nothing further is owed in this folder.
- **R05 (P3), no old → new line for the finite-image Artin functions.** Repaired, by `README.md:77–80`. Main's ClassicalArithmeticCompletion §7.30 (`README.md:267–269`) consumes exactly this content.
- **R06 (P3), two idele measures named `d^×x`.** Repaired, by `README.md:895–898` and the Check at `:917–920`. AnalyticNumberTheoryPartII §5.3j (`README.md:694` at `0717d3f`) puts `d^×x_v = (1 − q_v⁻¹)⁻¹dx_v/|x|_v` with self-dual `dx_v`, so `𝒪_v^×` has mass `N(𝔇_v)^{−1/2}`. Its archimedean factors are `dx/|x|` and `2dxdy/|z|_ℂ`, the same as here.
- **R07 (P3), Borel §5.5 locator.** Repaired. `:1346–1348` is now an owned deduction, with Tau Ceti `TauCeti.continuous_modularCharacter` (`TauCeti/MeasureTheory/Group/ModularCharacter.lean:101`) and three new Checks, recomputed below.
- **R08 (P3), README shape.** Repaired item by item:
  - the supplier table is contiguous (`:277–306`);
  - the duplicate Checks at former `:1740` and `:4546` are gone;
  - the two Checks blocks are merged (`:1844–1865`);
  - *Local polynomial comparison* states the claim before its Checks (`:3361–3376`);
  - the stray “;” line is joined (`:140`);
  - §5.3f is in the Layer 2 Dependencies (`:2204`).

## R01 (P2) — The evaluation topology on points is restated, although the pinned Tau Ceti provides it

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean:96–101`, docstring: “It restates the point topology of ReductiveGroupsPartII, RG2.0.1, and is scoped to this namespace so that the canonical instance remains RG2's.” The same attribution appears in `README.md:981` (“*Lean:* `AdelicPoints`, `evaluationTopology`”), `:1154` (“RG2.0 (`PointTopology.locallyCompactSpace_of_finiteType`)”) and `:167–171` (RG2.0.1, RG2.0.3).

Claim: the point topology, its topological-group structure, local compactness and compact open integral points are not at the pins. So this roadmap restates the topology and cites ReductiveGroupsPartII's planned target for the rest.

Witness: the Tau Ceti pin `2fd255d` (identical to main's pin) has, in `TauCeti/Topology/Algebra/PointTopology/`:
- `Basic.lean:110`, the global `instance instTopologicalSpaceWithConv : TopologicalSpace (WithConv (A →ₐ[k] R))`;
- `Basic.lean:261`, `locallyCompactSpace_of_finiteType`;
- `Group.lean:102`, `isTopologicalGroup`;
- `Separation.lean:64/97/113`, the T2, second countable and locally compact instances;
- `IntegralPoints.lean:102/116`.

Repair:

1. **`Suggested.lean`.** Add `import TauCeti.Topology.Algebra.PointTopology.Group` and `import TauCeti.Topology.Algebra.PointTopology.Separation`, and delete the scoped `evaluationTopology` (lines 96–101). The two topologies are equal: the induced topology from `R^H` is the infimum of the evaluation topologies.
2. **`README.md:981`.** Drop `evaluationTopology` from the *Lean:* line.
3. **Supplier table.** Add a row “Point topology | `TauCeti.PointTopology.instTopologicalSpaceWithConv`, `isTopologicalGroup`, `instT2SpaceWithConv`, `instSecondCountableTopologyWithConv`, `instLocallyCompactSpaceWithConv`, `locallyCompactSpace_of_finiteType`, `isOpenEmbedding_mapValue_integer`, `isCompact_range_mapValue_integer`; `TauCeti/Topology/Algebra/PointTopology/{Basic,Group,Separation,IntegralPoints}.lean` | the topology of AA.1.1 at `R = 𝔸_F, 𝔸_{F,f}, F_∞, F_v`”.
4. **AA.1 citations.** Cite these declarations where AA.1.1, AA.1.2 and `:167–168` now cite RG2.0, RG2.0.1 or RG2.0.3 for the point topology. Replace `:1154`'s RG2 attribution by `TauCeti.PointTopology.locallyCompactSpace_of_finiteType`.
5. ***Adelic groups are locally compact*.** Restate it as the ring-level inputs these instances need (second countability of the adeles from AA.0.4 *adelic-borel-structure*, local compactness from Tau Ceti `Adeles/LocallyCompact`), or delete it.

Tested on a scratch copy with exactly change 1. After the targeted `lake build` of the two modules, `lake env lean` exits 0 with the same 18 `sorry` warnings. `inferInstance` then finds `IsTopologicalGroup (AdelicPoints F H)`, and `LocallyCompactSpace (AdelicPoints F H)` and `T2Space (FiniteAdelicPoints F H)` under `[Algebra.FiniteType F H]`, all from Tau Ceti. On the head itself the global instance is not imported: a scratch `inferInstance` outside the namespace fails. So there is no instance clash today, only duplication.

## R02 (P3) — *Points over a product of rings* cites a passage about products of schemes

Location: `README.md:1105–1108`: “prove `WithConv (H →ₐ[F] R₁ × R₂) ≃* WithConv (H →ₐ[F] R₁) × WithConv (H →ₐ[F] R₂)`, naturally and as topological groups … ([Conrad], Proposition 2.1, proof, p. 2)”.

Claim: Conrad's proof of Proposition 2.1 supports the comparison for a product of coefficient rings.

Witness: Conrad line 95–97 (p. 2) proves that `(X ×_R X′)(R) → X(R) × X′(R)` is a homeomorphism, which is a product of schemes. The product of coefficient rings is the map (3.6.2), `X(∏R_i) → ∏X(R_i)`, in the proof of Theorem 3.6 (Conrad line 303–316, p. 7).

Repair: cite “[Conrad], Proposition 2.1, p. 2 (the topology is the subspace topology from `R^A`), and the proof of Theorem 3.6, (3.6.2), p. 7”. Alternatively call the identification an owned deduction from `(R₁ × R₂)^A = R₁^A × R₂^A`. Tested: for `G_a`, `Hom_F(F[T], R₁×R₂) = R₁ × R₂`; for `G_m`, `(R₁×R₂)^× = R₁^× × R₂^×`. In both cases the product topology is the one induced from `(R₁×R₂)^H`.

## R03 (P3) — The Check of *Basis change with determinant control* does not test the sorting clause

Location: `README.md:2683–2686`: “The sorting permutation is part of the conclusion … **Check:** `diag(4,1)` is 5-reduced but unsorted; swapping the two basis vectors sorts it.”

Claim: the Check pins the reordering `σ` in the conclusion.

Witness: `diag(4,1)` is already `(std, 5)`-reduced, so the unsorted conclusion “`b` is `(e, C″)`-reduced” also passes it. The Check does not tell the stated theorem from the version without `σ`. That version is false, as the next paragraph shows.

Repair: replace the Check by the following. “For `N ≥ 2`, `b = diag(1, N)` is `(std, 2)`-reduced and satisfies condition (3) in the swapped basis `e = (e₂, e₁)` with `C = 2`. It is `(e, C″)`-reduced only for `C″ > N`, so no `C″` depending on `e, C, e′, C′` alone works without re-sorting; the sorted basis gives `(std, 2)`.” Tested:
- in `std`: (1) `N < 2N` and `1 < 2`, (2) `1 < 2N`, (3) `N < 2N`;
- in `e` the Gram matrix is `diag(N, 1)`, and condition (2) reads `N < C″`.

## R04 (P3) — *orbit-map-siegel-preimage* cites the BKT step that the erratum corrects

Location: `README.md:3768–3774`: “prove that for every Siegel set `𝔖 ⊂ X`, `ι⁻¹(𝔖)` is contained in finitely many Siegel sets of `𝐇(ℝ)/K_H` … ([BKT], §4.5, pp. 17–18 (arXiv v2); JAMS pp. 932–933)”.

Claim: BKT §4.5 is the source for the preimage statement.

Witness: BKT line 805 (p. 17) derives it from [B-HC62, 7.5]. BKT erratum line 121–125 (§1.5, p. 3) says that this reference is for real Siegel sets and should be replaced by [BGST] 28.1 (BGST line 631–635, p. 14).

Repair: add “[BKT erratum], §1.5, p. 3; [BGST], Proposition 28.1, pp. 14–15”, and add *Intersecting Siegel sets with a subgroup* and *orr-schnell-containment* to the *Needs:* line. The target's Cartan hypothesis (`:3770`) is exactly what Proposition 28.1 needs through Orr–Schnell's forward containment. Tested on the sibling target `:3754–3760`, which already cites the corrected pair.

## R05 (P3) — Two AA.4.5 locators do not contain their statements

Location:
- `README.md:4779–4783`, *Degree of a Hecke correspondence*: “`UgU` is the disjoint union of `[U : U ∩ gUg⁻¹]` cosets … ([Arthur], §2, p. 13)”;
- `:4786–4793`, *Hecke correspondences*, with the same locator;
- `:4851–4854`, *Class sets of groups with simply connected derived group*, citing “[LT], §3.2.2, (21), p. 14”.

Claim: Arthur p. 13 proves the coset count, the correspondence `T_g` and its covering degree, and LT (21) proves the general class-set bijection.

Witness: Arthur line 581–591 (p. 13) only introduces the Hecke algebra `H(G(𝔸^S), K_S)` acting by convolution. LT line 510–528 (p. 14) applies strong approximation to one product group, `GL_d(D) × ∏ Res_{K_i/ℚ} GL_{n_i}`.

Repair:
1. In both Hecke targets, call the coset count an owned deduction from Tau Ceti `HeckeCoset.degree_eq_relIndex` (already in *Needs:*) and AA.4.4's covering target.
2. Cite [Milne], §5, p. 58, for `T(g) : [x, a] ↦ [x, ag]` (Milne line 2520–2525).
3. Keep [Arthur], §2, p. 13, only as context for the Hecke algebra.
4. Write the LT locator as “generalizing [LT], §3.2.2, (21), p. 14, which treats the group `GL_d(D) × ∏ Res GL_{n_i}`”.

Tested on `GL₂/ℚ`, `U = GL₂(ℤ̂)`, `g = diag(p,1)` at `p`: `[U : U ∩ gUg⁻¹] = p + 1`, a value Arthur p. 13 does not state.

## Verified sound

**Gate and build.**
- My gate run on this head prints `set_option=0 blob=0 latex=0 … statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `lake env lean TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean` exits 0 with exactly 18 warnings, all “declaration uses `sorry`”.
- The worktree's Mathlib (`1b1ccf4`) and Tau Ceti (`2fd255d`) pins equal main's.

**Dependency check.** The movable check (`--order` on the worker's `ORDER.txt`) prints `depcheck: 239 roadmaps, 2361 edges, 0 problem(s)`. In that order, SmoothRepresentationsOfLocalGroups is at line 25, AnalyticNumberTheoryPartI at 49, AnalyticNumberTheoryPartII at 50, this roadmap at 51 and SieveMethodsAndPrimePatterns, a consumer, at 55. No roadmap from the never-cite list is cited.

**Signatures.** I elaborated `#check @name` for all 61 declarations in one scratch file. The five dropped-binder leads of `signatures.md` are harmless: `box` keeps `Group` and drops an unused `TopologicalSpace`, and `InfinitePoints`, `IsCentralCocharacter`, `algebraicPointMap` and `IsFaithfulAlgebraicPointHom` drop an unused `[NumberField F]`. Every theorem carries the hypotheses its README statement needs. In particular:
- `hasStrongApproximation_of_simplyConnected` binds `F`, `[NumberField F]`, `G : TauCeti.SemisimpleCommHopfAlgCat F` and `hsc`. Tau Ceti's semisimple category is finite type, smooth and geometrically connected (`Semisimple/Basic.lean:177–189`), so its quotient hypothesis is the README's factorwise condition.
- `isCoveringMap_levelMap` carries `hK` and `hKH`.

**One-tactic probe.** On a scratch copy, every `sorry` was replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | (trivial; done) | (decide; done) | (norm_num; done) | (exact?; done)`. All 18 theorems failed, `exact?` included, so none is padding.

**Headline theorems.** All are stated:
- finite class numbers: `finite_classes`;
- finite volume: `exists_fundamentalDomain_normOne_lt_top`, `finite_volume_iff`, `arithmetic_finite_volume_iff`;
- compactness: `exists_compact_normOne_iff`;
- strong approximation: `hasStrongApproximation_of_simplyConnected`;
- weak approximation: `hasWeakApproximation_of_simplyConnected`;
- neat levels: `exists_isNeatLevel_le`, `isCoveringMap_levelMap`;
- quaternion norms: `nrd_image`;
- Fourier limits: `tendsto_quadraticKernel_haar`, `isMulLeftInvariant_of_tendsto`;
- convergent Haar products: `exists_unique_convergentHaarProduct`.

The docstring names the unstatable ones with the missing carrier: Tamagawa normalization, Siegel covering and cusps, Weil-restriction transport, the disconnected finite-volume criterion, the torsor Hasse principle, the GL₁ class and cohomology identifications, and the GL₂ Riemann-surface comparison.

**Pinned declarations opened.**
- Tau Ceti `PointTopology/{Basic:110,261; Group:102,142; Separation:64,97,113; Functoriality:110,145; IntegralPoints:102,116; WeilRestriction:110}`, all for R01.
- `TauCeti.continuous_modularCharacter` (`MeasureTheory/Group/ModularCharacter.lean:101`).
- `Matrix.SpecialLinearGroup.map_intCast_zmod_surjective` (`LinearAlgebra/Matrix/SpecialLinearGroup/Basic.lean:532`).
- `TauCeti.SemisimpleCommHopfAlgCat` and `simplyConnectedSemisimpleCommHopfAlgProperty` (`SimplyConnected/Basic.lean:65`).
- Mathlib `ModularCharacter.lean:93,130`; it has no compact-subgroup lemma, so the AA.1.5 deduction is owned.

A scan of the README's 262 backticked library names found every Mathlib and Tau Ceti name at the pins. The 12 names not found there are other roadmaps' targets, and all resolve:
- on main, in ReductiveGroupsPartII: `GeometricRoots.characterValue(_coe)`, `Decomposition.modularCharacter_eq_one`, `Lang.lang_surjective`, `LocalIntegration.modularCharacter_eq_adjointModulus`, `PointTopology.generalLinearPointsHomeomorph`, `WeilRestriction.functor_isCorepresentable`, `ZExtension.derivedIdeal_{gl,sl}_n`;
- on main, in SchemeAndStackFoundations: `Torsor.trivial_iff_section`, `torsorClasses.mk_eq_base_iff`;
- in ArithmeticLocallySymmetricSpaces, a downstream consumer: `LocallySymmetric.IsCartanInvolution`, in its open head's `README.md:1168–1188`.

**Cross-roadmap citations resolved at their heads.**
- AnalyticNumberTheoryPartI §2.18a (`README.md:1683` at `3667daa`): Brauer continuation with a leading coefficient that is finite and nonzero, and positive for `ρ` realized over `ℚ`.
- AnalyticNumberTheoryPartII (`0717d3f`): §5.3f (`:642–644`, `dx_v(O_v)=1`); §5.3h (`:673–687`, `V_𝔸/V` of volume one); §5.3j (`:694`); §5.3k (`:700`); §5.3l (`:706–711`, Borel moduli `|t₁/t₂|`); §5.3m (`:718–721`). Its `Suggested.lean` has `exists_unique_restrictedAddHaar` (`:267`), `exists_unique_quotientMeasure` (`:312`) and `gl2_classNumber` (`:352`). Its `README.md:3105` records this roadmap as the consumer.
- SmoothRepresentationsOfLocalGroups SR.1.1 (`README.md:1044` at `4178a1e`).
- SieveMethodsAndPrimePatterns (`8111bc5`) now consumes AA §4.2 (`README.md:19`, `:3727`, `:3828`), so the supply runs one way.

**Ownership.** `roadmaps grep` on main and every open head searched for `HasStrongApproximation`, `evaluationTopology`, neat levels, the convergent Haar product and the Tamagawa measure. The only second definitions are those of pull request 1409 noted under R04. A search of the Tau Ceti pin for restricted-product Borel structures, Siegel sets, neatness, strong approximation, adelic integral models, unimodularity and Tamagawa measures of algebraic groups found nothing beyond R01's point topology.

**Sources: the seeded sample, read at the locators.** Page markers equal printed pages for Arthur, Conrad, Rosengarten, BKT, the BKT erratum, Orr, Milne, Rapinchuk, HW, Khayutin, LT, BGST and Gordon. For the rest: Borel's printed page is the marker plus 3, Borel–Tits's the marker plus 53, and Witte Morris's the marker minus 16.

| Sample target | Locators checked (source line) | Result |
|---|---|---|
| 0.2 | none external; AnalyticNumberTheoryPartII §5.3f box formula and uniqueness (`README.md:642`) | supports the owned deduction |
| 0.3 | Rosengarten §1 p. 2 (line 52–70); Conrad Thm 3.6 p. 6 (line 281–295); Borel §5.5 p. 21 (line 668–678) | supports; PRR Lemma 3.63 paywalled |
| 1.2 | Conrad Prop 2.1 p. 2 (line 53–61), proof (line 95–97); Rem 3.5 p. 6 (line 253); Thm 3.6 pp. 6–8 (line 281–316); §4 p. 9 (line 422–440); Borel §1.2 p. 7 (line 98–118); Witte Morris A4.6 p. 435 (line 18075) | supports, except R02 |
| 1.5 | Borel–Tits Thm 5.3 p. 96 (borel-tits line 1711–1719); Borel §5.5 p. 20 (line 655–658), §1.7 p. 8 (line 168–176), §1.2 p. 7 | supports |
| 2.2 | Arthur §5 p. 25 (line 1345–1351; the known exponent misprint, under Source issues) | supports; BHV unread, PRR Thm 3.64 paywalled |
| 2.5 | Gordon (48) p. 32 (line 1626); computations recomputed below | supports; PRR Thms 3.60 and 3.71 paywalled |
| 3.1 | Borel §1.13 p. 11 (line 269–274); Borel–Tits §5.8 p. 98 (line 1792), §5.9 (line 1802), §5.12 p. 99 (line 1832); Arthur §4 pp. 22–24 (line 1156–1287), §7 p. 32 (line 1694–1714) | supports; PRR §2.1.14 paywalled |
| 3.2 | BKT §2.2 and (2.1)–(2.3) p. 8 (line 331–349); Def 2.3 and Lemma 2.4 (line 358–366); (2.4) p. 9 (line 426); Def 4.11 pp. 17–18 (line 810–816); §4.5 p. 18 (line 817–822); erratum §1.1 p. 1 (line 11–34), Rem 1.1(1) p. 2 (line 50–52) | supports; Check R03; two source issues |
| 3.3 | Orr §2.A pp. 5–6 (line 192–215); Borel §§3.1, 3.3, Lemmas 4.3–4.4, Thm 4.5, §5.3, Thm 5.4 (line 398, 430, 522–545, 636–645) | supports; BHC and PRR paywalled |
| 3.4 | Arthur §8 and Thm 8.1 p. 37 (line 2025–2045); Borel Thm 5.1 p. 19 (line 608), Cor 2.5 and Prop 2.7 p. 13 (line 363, 372), 5.6 p. 21 (line 679), 5.8 p. 22 (line 716), 7.2–7.3 p. 25 (line 853–862); Milne Thm 3.3 (line 1483), Props 3.5–3.6 (line 1521–1531), Prop 4.1 p. 43 (line 1911), Lemmas 5.12–5.13 p. 57 (line 2475–2495); BKT Prop 2.7 p. 9 (line 378–392), Rem 1.4(1) p. 5 (line 210–215); Conrad Thm 3.4(3) p. 5 (line 243–247) | supports |
| 3.7 | Orr Lemma 2.1 and §2.B pp. 6–7 (line 216–245), Thm 4.1 p. 15 (line 656–661), §4.A p. 16 (line 685), Lemmas 4.2–4.5 (line 715–767), Prop 4.7 and Lemmas 4.8–4.9 (line 817–868), Lemmas 4.10–4.11 (line 924–951), Lemmas 4.12–4.13 (line 984–995), Prop 4.14 (line 1010); BGST Prop 28.1 p. 14 (line 631–635); BKT erratum proof of Thm 1.2 p. 3 (line 94–99) | supports, except R04; Orr–Schnell not readable |
| 4.1 | HW §1 p. 6 (line 258–262), Thm 6.1 p. 21 (line 872–882), Lemme 6.3 (line 911); Rapinchuk Lemma 1.2 p. 3 (line 96); Khayutin §2.3 p. 16 (line 658–674) | supports; PR 1994 paywalled |
| 4.2 (restored) | Rapinchuk §2.1 Definition p. 7 (line 349–350), Thm 2.3 and the note after it p. 12 (line 565–577), Remark 1 (line 578–584), §2.6 p. 16 (line 742); Arthur Thm 2.1(a) p. 12 (line 539–542) | supports |
| 4.5 | Milne §5 p. 58 (line 2516–2525), Lemma 5.21 p. 61 (line 2658–2677); LT (21) p. 14 (line 519–529), (28) p. 16 (line 578–621); Arthur (2.1) p. 13 (line 572) | supports, except R05 |
| 4.6 | Khayutin §2.3 pp. 15–16 (line 653–678), Def 3.1 p. 22 (line 912–919), proof of Prop 3.6 p. 25 (line 1013–1034) | supports; PRR Thm 1.34 paywalled |
| 4.7 | Khayutin Prop 3.6 p. 24 (line 1001–1008), Remark 3.7 and proof p. 25 (line 1011–1039) | supports |

The README flags no locator as unverified.

**Adversarial table.** Every value was computed this round.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| 0.2 right invariance of `∏ʳ μ_i` | `∏ S₃` with Haar probabilities; one `ax+b` factor | the compact product carries one bi-invariant probability; on `ax+b`, right translation by `diag(2,1)` scales left Haar by `Δ = 2` | true; hypothesis needed |
| 0.3 change of normalization | scalars `(2, ½)`; `(2,1,1,…)` | `∏ᶠ c_i = 1`; `2` | true |
| 0.3 factorizable integral | `C₂` with counting measure, constants `2, 3` | `4·6 = 24`; probability normalization gives `2·3 = 6` | true |
| Lean `exists_unique_convergentHaarProduct` | `ι = ∅`; `ι = Unit`, `C₄`, `B = {0,2}`; `SL₂` tail over `ℚ` | Dirac mass with `∏∅·∏'∅ = 1`; `ν(box C) = #C`, `ν(univ) = 4`; `∑p⁻² ≈ 0.452`, `∏(1−p⁻²) = 6/π² ≈ 0.608 > 0` | true |
| 0.3 functoriality | `x ↦ 2x` on `ℝ` | pushforward of `[0,2]` has mass `1` | true |
| 0.4 `d^×x` against §5.3j | `ℚ(i)`; `ℚ` | `N(𝔇₂) = 4 = \|d\|`, ratio `2`; annulus masses `4π` and `2π`; ratio `1` | true; R06 repaired |
| 1.1 `AdelicPoints`, topology | `H = F`; `G_a`; `G_m` | a point; `𝔸_F`; inversion not continuous for the subspace topology of `𝔸^×`; the topology equals Tau Ceti's induced one | true; R01 |
| 1.1 `IntegralModel.localPoints` | `G_a`, `X ↦ pT`; standard `G_m` | `p⁻¹𝒪_v ⊋ 𝒪_v`; `𝒪_v^×` | true |
| 1.2 points over `R₁ × R₂` | `G_a`; `G_m` | `R₁×R₂`; `R₁^× × R₂^×`; Conrad p. 2 treats `(X×X′)(R)` | true; R02 |
| Lean `exists_restrictedProductEquiv` | `H = F`; standard `G_m` model | singletons; `𝔸_f^× ≃ Πʳ[F_v^×, 𝒪_v^×]` | true |
| 1.2 component groups | `ℝ^×`; `SO(x²−y²)(ℝ)`; `PGL₂(ℝ)`; `ℤ ≤ ℝ` | `2`; `2`; `2`; infinitely many, but not real points (Zariski closure `G_a`) | true |
| 1.5 `Δ` on compact and central elements | upper Borel of `GL₂(ℝ)`; `ax+b` | right Jacobian `\|a₀d₀²\|` gives `Δ(diag(a,d)) = \|a/d\|`: `1` on `diag(a,a)` and `diag(±1,±1)`, `2` at `diag(2,1)`; `ax+b`: `Δ = \|a\|`, centre trivial | true; R07 repaired |
| 1.5 Weyl orbit product | `GL₂`, `diag(2,1)`; `SL₂`, `diag(2,½)`; `PGL₂`, `[diag(−1,1)]` | `2I`; `I`; `α(b) = −1`, `b² = 1`, `b ∉ Z∩A` | true |
| 1.5 *local-congruence-levels* | `n(1)`, `n⁻(1)` with `N𝒪_v = ϖⁿ𝒪_v` | `n(1) ∈ K₁∖K`; `n⁻(1) ∉ K₀` | true |
| 2.1 `A_G(ℝ)⁰` | `ℚ(√2)`, idele `(2, ½; 1)`; graph in `G_m × T¹` | norm `1` and not scalar, so outside; the graph passes the group clauses and fails the defining clause | true |
| 2.2 modulus | `O(GL₂)/(X₁₀)`, `diag(2,1)`, `diag(1,2)`; `diag(3,1)` at 3 | `2`, `½`, both determinant norms `2`; upper `⅓`, lower `3`; `P = G` gives `1` | true |
| 2.2 *quotient-measure* | `B ≤ SL₂(ℝ)` | `Δ_G\|_B = 1 ≠ Δ_B(diag(a,a⁻¹)) = a²` | true |
| 2.4 Weil, corrected volumes, order | `GL₂`, `q = 2`; `SL₂/𝔽₂`; nonsplit torus | `6/16 = 3/8`; `2·6/16 = 3/4`; `2·1·3 = 6`; `\|−2−1\| = 3` | true |
| 2.5 scalar Jacobians | `ℚ(i)/ℚ`, `β = (1,i)`; `E = F`, `β = (b)` | `j_∞ = ½`, `j_p = 1`, `∏ = ½ = \|−4\|^{−1/2}`; `j = \|b\|⁻¹`, `ω_β = b⁻¹dx` | true |
| 2.5 gauge forms | trivial group, `ℚ(i)`, `1+i` | `N(1+i) = 2`; masses `2` at `ℂ`, `½` above 2 | true |
| 2.5 *tamagawa-restriction-scalars* | `G_m`, `ℚ(i)/ℚ` | the omitted factors would be `\|d_ℚ\|^{1} = 1` and `\|d_E\|^{1/2} = 2` | true |
| 3.1 `H_P` | Borel of `GL₂`, `w·diag(2,1)` | `= diag(1,2)·w`, so the simple root gives `−log 2`; additivity would give `log 2` | true |
| 3.1 splitting `a_{P₁} → a_{P₂}` | Borel to `GL₂` | `(a,d) ↦ a+d`, lift `z ↦ (z/2, z/2)` | true |
| 3.2 change of compact | `SL₂`, `u = n(1)`, `k = w` | `k·i = i` (height `1`); `k·(1+i) = (−1+i)/2` (height `½`) | true |
| 3.2 reduced forms | `I`; `diag(4,1)`; `diag(1,4)`; `n = 0` | reduced; fails (2); reduced; needs `C > 1` | true |
| 3.2 Cholesky bounds | `b = Nᵀdiag(d)N` | `b_i/C < d_i`, `d_i/d_{i+1} < C²`; converse `b_ii ≤ d_i(1 + R²∑R^{i−k})` | true |
| 3.2 basis change | `diag(1,N)`, `e′ = std`, `C′ = C = 2`, `e` swapped | reduced in `std`; (3) holds in `e`; `(e, C″)` needs `C″ > N` | true; Check R03 |
| 3.3 Siegel domain, Gram, `μ₂` | `[[√y, x/√y],[0, 1/√y]]`; columns `(1,0),(1,2)`; `G_m/μ₂` | membership iff `\|x\|≤u`, `y≥t`, and `g·i = x+iy`; Gram `[[1,1],[1,5]]`; `2` not a rational square | true |
| 3.4 S-arithmetic | `ℤ` vs `p⁻¹ℤ`; `π = 3+√2` | indices `1, p`; `ππ′ = 7` | true |
| 3.4 Siegel sets | `ρ = ½ + i√3/2`; window `[−1,1]`, `y > ½` | height `√3/2` fails the strict inequality; `1` and `n(1)` both lie in the set | true |
| Lean `arithmetic_finite_volume_iff` | `G_m/ℚ`, `{±1}`; `SL₂(ℤ)` | infinite volume and `X* = ℤ`: both sides false; volume `π/3` and `X* = 0`: both sides true | true |
| Lean `finite_classes` | `G_m`, `ℤ̂^×`; `U = {1}` | one class; excluded by `IsOpen` (`ℚ^×\𝔸_f^×` is uncountable) | true |
| Lean `exists_fundamentalDomain_normOne_lt_top`, `finite_volume_iff` | `G_m`; `G_a`; Borel of `SL₂` | `ℚ^×\𝔸¹` compact, but full volume infinite with `GroupLike ≅ ℤ`; `𝔸/ℚ` compact with `GroupLike = {1}`; `B(𝔸)¹` unimodular, compact fibres over a compact base | true |
| Lean `exists_compact_normOne_iff` | `G_m`; `GL₂`, `X₁₁ ↦ T` | `T^k` central, compact; `[[2,2],[0,1]] ≠ [[2,1],[0,1]]` | true |
| Lean `exists_reduced_GLZ` | `n = 0, 1`; `I₂` | `C = 2` works (`1 < 2·1`; `b < 2b`); reduced | true |
| 3.7 counterexample groups | tilted `x = 2`; nonsplit `(3,2)`; `η·diag(2,1,½)·η⁻¹` | `[[2,−3/2],[0,½]]`, image `(1−y)+iy`; `9−8 = 1`; `[[35/16,0,9/16],[0,1,0],[−9/16,0,5/16]]`, `DJD = J`; `(ηᵀη)₁₃ = −3/2` | true |
| 3.7 *orbit-map-siegel-preimage* | Cartan hypothesis at `:3770` | BGST 28.1 needs forward containment, which Orr–Schnell gives under that hypothesis | true; R04 |
| 4.1 weak approximation, torsors | `μ₂` at `{∞,2}`; empty `S`; `x² = 2`; `S₃` | `{(1,1),(−1,−1)}` not dense; a point; no `ℚ`-point but an `ℝ`-point; `x·g` fails `(gh)·x` | true |
| Lean `hasWeakApproximation_of_simplyConnected` | trivial group; `SL₂`; `Sinf = Sf = ∅` | dense in a point; elementary matrices | true |
| 4.2 strong approximation predicate | `G_a`, `S = ∞`; `G_m/ℚ`, `x = 2` at 2, `U = (1+5ℤ₅)×∏ℤ_p^×`; trivial group | `F + (F_∞×0)` dense; rational points of `xU` would be `±2`, residues `2, 3 ≢ 1` mod 5; a point | true; r14 R01 repaired |
| 4.2 sufficiency Checks | `SL₂`, `S = ∞`; `PGL₂`, class `2` at 5; Hurwitz | `SL₂(ℤ) ↠ SL₂(ℤ/N)`; `±1` both squares mod 5 (`1`, `4`), `2` not; 24 units, discrete | true |
| Lean `hasStrongApproximation_of_simplyConnected` | trivial; `SL₂`, `Sf = ∅`; `SL₂ × D¹` with `D` definite | `hS` empty, a point; quotients `SL₂`, `PGL₂` noncompact; `hS` fails at the quotient `D¹` and the conclusion is false there | true |
| 4.2 Borel density | `SL₂(ℤ)`; Hurwitz at `S = ∞`, then `{∞, 3}` | Zariski dense; finite (24) with compact `G_S`; infinite | true |
| 4.3 neatness, `p`-adic radii | `(0 −1; 1 1)·2`; `p = 2`, `−1`; `p = 3`, `4` | eigenvalue ratio `ζ₃`; `\|−2\|₂ = ½` on the boundary; `\|3\|₃ = ⅓ < 3^{−1/2}` | true |
| Lean `exists_isNeatLevel_le` | `GL₂`, `U = GL₂(ℤ̂)` | `U′ = K(3)` normal, neat, index `\|GL₂(𝔽₃)\| = 48` | true |
| Lean `isCoveringMap_levelMap` | `GL₁`, `U(3) ⊃ U(9)`; `Γ(9) → Γ(3)`; `ℚ(√2)`, `η = (1+√2)⁴` | `2 → 6`, fibres `3`; `648/24 = 27`; `η ≡ 1` mod 4, `≢ 1` mod 8, `H_G(K∞) = L(ℤ+(1+√2)ℤ) ≠ ℝ`, not a covering | true; `hKH` needed |
| 4.5 Hecke | `T_{g⁻¹}` vs `T_g`; Iwahori, `diag(p,1)`, `diag(1,p)` | translation by central `p⁻¹` multiplies `\|det x_∞\|` by `p²`; reductions have zero first column vs zero bottom row, so the double cosets are disjoint | true; R05 |
| Lean `nrd_image` | Hamilton, `c = −1, 3`; `ℚ(i)` | no unit of norm `−1` and RHS false; `3 = 1+1+1`, RHS true; RHS vacuous, every `c` a norm | true |
| Lean `compactSpace_ideleClassGroup_quotient_squares` | real scalar `2`; `−1` at 3 | dies (`√2` is an idele); survives (`−1` is not a square in `ℚ₃`); squares of `C_F¹` compact, so the range is closed | true |
| Lean `tendsto_quadraticKernel_haar`, `isMulLeftInvariant_of_tendsto` | coordinates on `∏{±1}`; repeated `χ` | `∫χ_m dm_n = δ_{mn} → 0`; repetition (excluded by `hχ`) leaves a non-invariant limit | true |
| Lean `nonempty_connectedComponent_homeomorph` | `ℚ`; `ℚ(√2)`, `Q = ∅` | `Units.rank = 0`, points; `Λ = ⟨2 log ε⟩`, a circle | true |
| Lean `exists_componentHomeomorph` | `GL₂(ℤ̂)`; `K(3)` | `ℚ_{>0} ∩ ℤ̂^× = 1`, one component `SL₂(ℤ)\ℍ`; `(ℤ/3)^×`, two components | true |

## Not verifiable

- **Platonov–Rapinchuk–Rapinchuk 2023 and Platonov–Rapinchuk 1994.** Cambridge and Academic Press paywalls; their locators are taken as given. This covers Lemma 3.63, Theorems 3.60, 3.64, 3.71, 4.12, 4.20, 5.22, 5.24, 1.34, §§2.1.14 and 3.5, and Theorems 6.4, 6.6, 7.8, 7.12 and Proposition 6.17, including the `Suggested.lean` docstring locator “Theorem 7.12, p. 427”.
- **Borel–Harish-Chandra 1962 (JSTOR), Schneider 2011 and Voight 2021 (Springer).** Paywalled.
- **Orr–Schnell 2023.** The README's URL is MSP's subscriber PDF, which the sources service holds in no legal licence class. I relied on Orr arXiv v6, which incorporates the correction (Orr line 671–684).
- **BHV author manuscript.** No legal copy was located.
- **Outside this round's sample.** Stacks tags 0245, 04TY and 04SK; Casselman; Sutherland; CG; Loeffler; Platonov 1969 and its addendum; Dudas–Michel. None of them was read this round.
- **Ownership against open pull requests.** I checked it through `roadmaps grep` over every open head and the listed checkouts. I did not read the full READMEs of ArithmeticLocallySymmetricSpaces, ShimuraVarieties, ShimuraData or the ReductiveGroups revisions, which are nearest in vocabulary; their checkouts are not given in this brief.

## Source issues

- **Error** in BKT at §4.5, printed page 18 (arXiv v2): the source says a form that is `(e′,C′)`-reduced, and satisfies condition (3) in `e`, is `(e,C″)`-reduced with `C″` depending only on `e, C, e′, C′`; it should allow reordering `e` by the values `b(e_i)`, since `diag(1,N)` refutes the unordered claim; affects nothing (the proof reorders the basis separately, same page).
- **Misprint** in BKT at §2.2, formula (2.3), printed page 8: the source calls the displayed formula the right action of `P` on itself; it is left multiplication by `p₀ = n₀a₀m₀`; affects nothing.
- **Misprint** in Arthur at §5, printed page 25: the source says left and right Haar measures on `P(𝔸)` satisfy `d_ℓp = e^{2ρ(H_P(p))} d_rp`; it should be `e^{−2ρ(H_P(p))}`, as the same text's left Haar measure on p. 21 (line 1107) shows; affects nothing.
