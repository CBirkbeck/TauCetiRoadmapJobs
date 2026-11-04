# Review of DiamondEtaleCohomology (pull request #922 at e465c50)

**Verdict:** accepted

## Repairs of the previous review

- R01 (comparison squares): repaired. `README.md:455` now reads “`λ_Y ∘ f_v ≅ f_qproét ∘ λ_{Y′}` (both `Y′_v → Y_qproét`) and `ν_Y ∘ f_qproét ≅ f_ét ∘ ν_{Y′}` (both `Y′_qproét → Y_ét`)”, and C1.1 (`README.md:646`) uses the same composites. Sources and targets now match; on the fold `P ⊔ P → P` both inverse images give `(M, M)`.
- R02 (pro-p supplier edge): repaired. `README.md:21` and `README.md:107–114` cite the completed `ProfiniteProPGroups` on main through six pinned declarations; I opened all six at the Tau Ceti pin (table below). The movable dependency check now reports `depcheck: 201 roadmaps, 1315 edges, 0 problem(s)` with no UPWARD, CYCLE or `moved:` line.
- R03 (HTML anchors): repaired. The gate reports `residue=0`; no `<a id=` remains.
- R04 (undeclared backticked API names): partly repaired. The `etaleSite.*` and `Det*` names are gone; nine own function-style names remain in backticks (finding R01 below, P3).
- R05 (namespace and layer markers): repaired. `Suggested.lean:37` is `namespace TauCetiRoadmap.DiamondEtaleCohomology`, with `/-! ## Layer C5/C7/C8/C9 -/` markers in README order; `#check` prints all eleven names with that prefix.
- R06 (D4.11 re-exports): repaired. C4.2 is deleted; `README.md:16` says the predicate and its basic API are “imported without restatement” and `README.md:1203` says “None of these is restated here”. The build table at `README.md:269` still says “Re-exported properness API” (finding R02 below, P3).
- R07 (bibliographic identities): repaired. `README.md:301–303` add Temkin 2010 (Lemma 6.3.2, arXiv v3 p. 48, which I confirmed at Temkin2010 line 2347 under the page-48 marker), Scheiderer 1992 with DOI, and Huber 1996.

## R01 (P3) — Own function-style names in backticks are not declared in `Suggested.lean`

**Location:** `README.md:1647` “Write `IsConstFGOn(F,Z)` for the restriction …”; also `HasFiltrationBy(P,F)` (1831), `IsPerfectConstructibleTop(A)` (1880), `modifiedTopologicalTrdeg(K,L)` (2245 and 7 more), `analyticDimTrg(f)` (2342), `diamondDimTrg(f)` (2371), `LocallyFiniteDimTrg(f)` (2410), `pointCd(ℓ,y)` (2503), `SpecializationChain(X,n)` (2648).

**Claim:** A backticked Lean-style name of this roadmap's own is a claim that `Suggested.lean` declares it; these nine are not declared there (the file declares eleven names, listed under Verified sound), and several appear inside API bullets and Checks.

**Witness:** `grep -o` of backticked camel-case identifiers followed by `(` in the README lists them; `Suggested.lean` has no `IsConstFGOn`, `pointCd` or `diamondDimTrg`.

**Repair:** Keep the mathematics and write the notions in prose or plain notation (“the modified topological transcendence degree of `L` over `K`”, “the point cohomological dimension at `y`”), reserving backticks for the eleven declared names and library names. This is the residue of the previous R04.

## R02 (P3) — Stale “re-exported” wording in the build table

**Location:** `README.md:269`: “| C4 | Re-exported properness API, partial properness and canonical compactification |”.

**Claim:** After the R06 repair C4 imports D4.11 without restatement (`README.md:1197`, `README.md:1203`); the table row still describes a re-export, and “re-export” is process wording.

**Witness:** `README.md:16`: “imported without restatement”; `README.md:1203`: “None of these is restated here”.

**Repair:** Replace the row text by “Imported properness API, partial properness and canonical compactification”.

## Verified sound

**Gate and build.** The worker's gate at e465c50 passes every check (`build=0`, `depcheck=0`, `residue=0`, `set_option=0`, `sorry-data=0`). I elaborated `TauCetiRoadmap/DiamondEtaleCohomology/Suggested.lean` with `lake env lean`: exit 0, exactly six `declaration uses sorry` warnings (lines 46, 80, 116, 131, 148, 173), nothing else. The diff outside the roadmap folder against `origin/main` is empty. `metadata.toml` is the only other file.

**Signatures.** A scratch copy with `#check @name` for all eleven declarations elaborated; each type carries its binders: `zariskiRiemannAcyclicity` keeps `IsAlgClosed K`, `IsAlgClosed K'`, `DiscreteTopology K'`, the torsion hypothesis on stalks and the special-fibre vanishing; `constructibleCompactSpectral` keeps `IsNoetherianRing Λ` and `SpectralSpace X`; `topologicalIndependenceDegree_eq_of_lt_top` keeps `NontriviallyNormedField`, `CompleteSpace`, `IsUltrametricDist`, `IsAlgClosed` on both fields, the isometry and the finiteness; `wild_kernel_pro_p` keeps `CompactSpace`, `T2Space`, `TotallyDisconnectedSpace`, `IsTopologicalGroup`, `CharP C p`, injectivity, joint continuity and closedness; `spectralCohomologicalBound` keeps `SpectralSpace X` and `topologicalKrullDim X ≤ d`; `compactGeneration_spectral` keeps `CommRing Λ`, `SpectralSpace X` and the uniform bound. The README statements of C5.7, C7.5, C8.5, C8.34, C8.44 and C9.8 have the same generality. Nothing changed. Note (not a finding): `IsAlgClosed K` in `topologicalIndependenceDegree_eq_of_lt_top` is not used by Temkin's Theorem 3.2.3; the dictionary between the two Lean degrees and Temkin's invariants needs only `L` complete and algebraically closed.

**Padding probe.** On scratch copies each of the six `sorry`s was replaced by `simp`, `rfl`, `infer_instance` and an `intros; constructor/simp_all/aesop` cascade: all six fail in every probe (unsolved goals or no progress). No declaration restates a definition, mirrors a Check or computes a value. `extendByZero` has a real body: the left Kan extension along `Over.forget U` evaluated at `V` is the colimit over `V ≤ W ≤ U` of `F(W)`, which is `F(V)` for `V ⊆ U` (the object `V` is terminal in that comma category) and the empty colimit `0` otherwise, so it is the left adjoint, not the direct image. `IsConstructibleSheaf` uses constant values on constructible locally closed strata exactly as ECD Definition 20.1(i).

**Headline theorems.** The README names C5.7, C7.5, C8.5 (finite case), C8.34, C8.44 and the spectral form of C9.8 as the statable headlines; all six are in `Suggested.lean`. The docstring names the geometric endpoints (site comparisons, base change, descent and coreflection, four operations, compactification, proper base change, field invariance, diamond constructibility, dimension bounds, spatial compact generation) and the analytic dimension formulas C8.49–C8.51 as not statable, with the missing carriers. I found no further statable headline: C8.6–C8.13 and C8.33 are inputs to the stated ones, C8.37 is ClassicalAdicEtaleCohomology's theorem, and no stand-in predicate is used.

**Seeded sample, “Perfectoid field-test reduction” (`README.md:2773–2797`).** CS17 Remark 4.2.20 (arXiv 1511.02418v1 p. 54, CS17 lines 2406–2411) is the unrestricted field-pair predicate for all complete nonarchimedean `K` and open bounded `K⁺ ⊆ O_K`, as restated. ECD Definition 15.5 and Lemma 15.6 (ECD lines 3735–3756, under the page-91 marker) give the marked-untilt diamond and the étale-site comparison, for any analytic adic space over `ℤ_p`. Conrad Theorem 1.1 (Conrad line 43, p. 1; proof §2 from line 61) has no characteristic restriction. Stacks 00IA (algebra chapter, Lemma 10.50.2) gives a valuation ring of the residue field of `C` dominating `V = T⁺/m_T`; its contraction to the residue field of `T` dominates `V`, hence equals `V`, so `C⁺ ∩ T = T⁺`. I recomputed the reduction: the closed point of a `(C, C⁺)`-lift lands in an affinoid `U = Spa(A, A⁺)` that also contains the generization, the lift is `A → C` with `A⁺ → C⁺`, it factors through `T` because the restriction to `Spa(C, O_C)` is the given `A → T`, and `A⁺ → C⁺ ∩ T = T⁺` gives the `(T, T⁺)`-lift; uniqueness holds because `Spa(C, C⁺) → Spa(T, T⁺)` is surjective (primes of the dominating ring lie over primes of `V`) and `T → C` is injective. The three Checks compute as stated: `C = T` is the identity; `ℚ_p ⊂ ℂ_p` contracts `O_ℂ_p` to `ℤ_p`; the rank-two identity square has zero lifts through `Spa(C, O_C) → Spa(C, C⁺)`. The fourth Check of C8.48a (`README.md:2753–2763`) is correct: the valuation rings of an algebraic closure of `k(t)` trivial on `k` have rank one and are infinite in number, each chart `Spa(C, C_V⁺)` has two points, distinct charts meet in `η`, every `(T, T⁺)`-test contracts to `O_C` or to exactly one `C_V⁺`, and the closure of `η` is the whole non-quasicompact union, so tautness fails while every field test lifts uniquely; this separates the predicate from C4.5 exactly as the target claims. Partial properness is local on the target through C4.13–C4.14 (the compactification commutes with base change and `f` is partially proper iff `Y′ → Ȳ′^{/Y}` is an isomorphism), which justifies the gluing over affinoid opens.

**Other locators opened.** ECD Lemma 19.4 (lines 4534–4539, p. 110) matches C5.7 and the Lean statement word for word, including both fields algebraically closed, arbitrary `V`, torsion `F` and vanishing on `f⁻¹(s)`. ECD Definition 20.1 and Lemma 20.4 (lines 4640–4663, p. 113) match C7.1 and C7.5: noetherian `Λ`, constant finitely generated values on constructible locally closed strata, compact iff constructible, filtered colimits. ECD Proposition 21.16 and Lemma 21.17 (lines 5191–5244, pp. 126–127) give C8.33–C8.41; the pro-p kernel is the subgroup acting trivially on `C′×/(1 + C′°°)`, in characteristic `p`, as in `wild_kernel_pro_p`. ECD Proposition 20.17 (lines 4983–5004, p. 121) is C9.8–C9.12 with `j_!Λ` generators and compact = perfect-constructible. ECD Definitions 21.1, 21.2, Lemma 21.3, Question 21.4, the modified-degree paragraph, Definitions 21.5, 21.7, Remark 21.8, Propositions 21.9, 21.11, 21.15, Lemma 21.13 and Remark 21.14 (lines 5012–5190) match C8.1–C8.3, C8.7–C8.8, C8.10, C8.14, C8.16–C8.17, C8.20–C8.31 and C8.45–C8.48. ECD Theorem 16.1 (line 3762, p. 92), Proposition 17.6 (line 4029, p. 98), Definition 18.1, Proposition 18.3, Definition 18.4, Remark 18.5, Proposition 18.9, Proposition 18.10 (lines 4124–4390), Theorem 19.2 (line 4460), Lemma 14.5 (line 3425), Definition 14.13 (line 3625), Propositions 20.10, 20.14 and 20.16 match C1.3–C1.5, C3.5–C3.6, C4.1, C4.4–C4.6, C4.17–C4.18, C5.8–C5.9, C0.10, C2.2, C9.13, C7.19 and C7.22. Temkin §2.1.6, Remark 2.1.10, Lemma 2.2.2 (lines 207–239, pp. 5–6), Lemma 3.1.6, Theorem 3.1.9, Corollary 3.1.10, Theorems 3.2.1 and 3.2.3 (lines 281–346, pp. 7–8) match C8.4–C8.5 and C8.9: the Lean `topologicalTrdeg` equals Temkin's generating degree and `topologicalIndependenceDegree` equals his `top.tr.deg` when `L` is complete and algebraically closed (a dense intermediate field of transcendence degree `n` has a transcendence basis `S` with `L` topgebraic over `K̂(S)`, and conversely the algebraic closure of `K(S)` in `L` is dense; the supremum over finite independent sets equals the supremum over all, since subsets of independent sets are independent). KST Lemma 6.6 (lines 1013–1032, p. 24) gives the chain orientation `x₀ ≻ … ≻ xₙ`, `γ_n ↦ x₀`, the normalized complex supported on non-degenerate chains and the citations of Scheiderer used in C8.42–C8.44. Stacks 0A3G (cohomology chapter, Proposition 20.22.4(1)) is the bound of C8.44. CS17 Propositions 4.2.19 and 4.2.21 (lines 2401–2440) are C8.49–C8.51.

**Pinned declarations opened (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`; paths relative to the library roots).**

| Library file and line | Declaration | Checked |
| --- | --- | --- |
| Mathlib `CategoryTheory/Sites/SheafCohomology/Basic.lean:56` | `Sheaf.H` = `Ext` from the constant sheaf `ℤ` | sheaf cohomology on any site; used by C5.7 and C8.44 |
| Mathlib `CategoryTheory/Presentable/Finite.lean:49` | `IsFinitelyPresentable` = `Hom(X, −)` preserves filtered colimits | ECD's “compact” in Lemma 20.4 |
| Mathlib `CategoryTheory/Triangulated/Generators.lean:132` | `triangEnvelope` = closure under shifts, products, retracts, extensions | thick closure in C9.8 |
| Mathlib `Topology/KrullDimension.lean:37` | `topologicalKrullDim` into `WithBot ℕ∞` | `⊥` for `∅`, as C8.1 |
| Mathlib `Topology/Sheaves/Over.lean` | `Opens.sheafEquivOver`, `overPullbackSheafEquivOver` | used by `extendByZero` |
| Mathlib `Analysis/Normed/Field/Approximation.lean` | `IsAlgClosed.of_denseRange` has `[CharZero L]` | README's statement that it does not discharge C8.6 is right |
| Mathlib `RingTheory/Valuation/LocalSubring.lean` | `LocalSubring.exists_le_valuationSubring` | the domination input of the sampled reduction |
| Mathlib | `mateEquiv`, `irreducibleSetEquivPoints`, `krullDim_eq_of_orderIso`, `nonempty_limitCone_of_compact_t2_cofiltered_system`, `trdeg_add_eq`, `spectralNorm.normedField`, `spectralNorm_extends`, `PadicAlgCl`, `PadicComplex`, `continuousCohomology`, `isEquiv_iff_valuationSubring`, `WithConstructibleTopology`, `IsProperMap` | all present at the pin |
| Tau Ceti `AlgebraicGeometry/AdicSpace/Spa/Basic.lean:101,108,114` | `spa`, `spa_def`, `mem_spa_iff`: continuous points of `Spv` sub-unit on the plus ring | with the discrete topology every valuation is continuous, so `spa` is the set of valuation rings of `K′` containing the image of `V`, i.e. ECD's `T′` |
| Tau Ceti `AlgebraicGeometry/AdicSpace/ValuationSpectrum/Basic.lean:73,106` | `ValuationSpectrum` (valuative relations), `basicOpen {v(f) ≤ v(s) ≠ 0}` | on a field this is the Zariski–Riemann topology |
| Tau Ceti `Topology/Algebra/Group/Profinite/ProP/Basic.lean:68,75,102,146,162` | `IsProP`, `isProP_iff`, `isProP_iff_isPGroup`, `IsProP.of_surjective`, `IsProP.quotient` | as cited |
| Tau Ceti `…/Profinite/Sylow/Existence.lean:102`, `Sylow/Basic.lean:83`, `Sylow/Conjugacy.lean:48`, `Procyclic.lean:113` | `exists_isProPSylow`, `IsProPSylow.isProP`, `IsProPSylow.eq_of_normal`, `isProP_closedZpowers_zpowHat_idem` | the four Sylow inputs of C8.33–C8.35 exist |
| Tau Ceti `…/Sylow/CohomologicalDimension.lean:81`, `…/ProP/CohomologicalDimension.lean:133` | `IsProPSylow.cohomologicalDimensionAt_eq`, `IsProP.cohomologicalDimensionAt_le_iff_subsingleton_cohomFp` | the R02 repair's declarations |
| Tau Ceti `RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Basic.lean:146` | `cohomologicalDimensionAt` | all discrete `ℓ`-primary torsion coefficients |
| Tau Ceti `Topology/Spectral/ProConstructible.lean:112,118` | `IsProConstructible`, `isProConstructible_iff_isClosed` | as cited |
| Tau Ceti `CategoryTheory/Sites/ExtensionByZero.lean:121,254,315` | `PresheafExtensionByZero.functor`, `.adjunction`, `preservesFiniteLimits_sheafPullback` (abelian groups) | module-valued exactness is this roadmap's, as stated |

**Cross-roadmap citations resolved (every one, at main or at the open head).** DiamondsAndVStacks (#820, merge order 15): D0.23, D1, D2, D3.8, D4, D4.5 (`X ↦ C(|X|, T)` sheaf), D4.11 (properness, closed immersions, composition, base change, field-valuative criterion), D5, D6.1, D6.4, D6.8. ClassicalAdicEtaleCohomology (#875, order 52): §§2.1, 2.4, 2.5, 3.1 (taut: quasiseparated plus quasicompact closures), 6.1–6.3, 7.1–7.3 (the support-vanishing statement with `X₁ → X₃` surjective), 10.1–10.4, 11.2 (`field_cohomological_dimension_transcendence`). ArithmeticGaloisDuality (#858, order 42): R02.1, R02.2, R02.2.1 (Hochschild–Serre for a closed normal subgroup and discrete modules). On main: EnhancedDerivedSheaves §§0.1–0.4, E1.4 (`enhancedCoeffChange`, `enhancedPullback`, `enhancedPushforward`), E2.2–E2.4 (`postnikovCompletion`), E3.4 (`coherentMate`, `cutoffRightAdjoint_compat`); SchemeAndStackFoundations §2.11 (`artinSchreier_sequence`), §2.15 (`gabber_affine_proper_base_change`, `etale_cohomology_limits`, `etale_galois_comparison`); EtaleCohomologyFoundations F.2.1 (`VanishingCycles.properBaseChange`); AdicSpacesPartII R0.7 (`ValuationSpectrum.exists_amalgamation`), R0.11 (`κ(x)`), R0.19.10; AdicEtaleGeometry A1, A2.1, A2.6 (`AdicSpace.relDim`); DGAInfinity Layers 5–6; ProfiniteCohomology Layers 0, 10, 11; LocalFieldsRamification Layer 4; PerfectoidSpaces P0–P6 (`isPerfectoidField_of_isAlgClosed`); Completed AdicSpaces Layers 0–5 and ProfiniteProPGroups Layers 2, 3, 6. The three resolver leads (`AdicSpace.relDim`, `ValuationSpectrum.exists_amalgamation`, `VanishingCycles.properBaseChange`) are targets of AdicEtaleGeometry A2.6, AdicSpacesPartII R0.7 and EtaleCohomologyFoundations F.2.1 respectively, not missing pinned names. Consumers named (DiamondSixOperations 74, AdicCoefficientsAndComparisons 90, FarguesFontaineDiamonds 102) are later in the order and are cited only as consumers. Dependency check output:

```text
depcheck: 201 roadmaps, 1315 edges, 0 problem(s)
```

**Ownership and duplication.** `roadmaps grep` over the 432 open heads and main finds none of the eleven Lean names elsewhere. By object: ClassicalAdicEtaleCohomology §2.4 states Huber's Theorem 0.2 (vanishing of constant torsion coefficients on a Zariski–Riemann locus, `zariskiRiemann_cohomology_eq_zero`); C5.7 is ECD Lemma 19.4 for arbitrary torsion sheaves vanishing on the special fibre, a different theorem, and C5.7 lists §§2.1–2.5 as inputs. CAEC §1 cites ECD Lemma 20.4 only as an input to Hansen's reduction on locally noetherian analytic spaces; the spectral-space theorem C7.5 is stated nowhere else. Scheiderer's bound appears elsewhere only as a citation (DiamondSixOperations, a consumer); Temkin's degree, the wild kernel and the spectral compact-generation theorem are stated nowhere else. The topological `extendByZero` adapter is built from Mathlib's slice equivalence and is owned here; TopologicalSheafCohomology (#973) uses the same Mathlib construction on locally compact Hausdorff spaces only. Ownership against open pull requests whose files the brief did not give was not checked beyond the roadmap search service.

**Principles.** No prime-restricted shortcut (prime-to-`p` hypotheses are ECD's and come with negative controls), no re-planned roadmap, no algorithm, no `set_option`, no sorried data, a single `import Mathlib` plus two existing `TauCeti.*` modules.

**Adversarial table.** `P = Spa(C, O_C)`, `C` algebraically closed perfectoid of characteristic `p`; `S = Spa(C, C⁺)` of rank two with points `η` (open) and `s` (closed), sheaves on `S` written as `(F_s → F_η)`; `j : {η} → S`, so `j_!M = (0 → M)` and `j_*M = (M → M)`; `D₂ = P ⊔ P`; `M = 𝔽_ℓ`, `ℓ ≠ p` unless the row says otherwise. Values are what I computed on each side.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| C0.1 étale site | `P`; `∅`; fold `D₂ → P` | étale maps to `P` are disjoint unions of `P`, sections equivalence; `∅`: one object; fold: images cover, so covering | retain |
| C0.2 qproét site | `P × ℤ_p` | finite quotients `pⁿ` points, limit `ℤ_p`; maps to finite discrete sets factor through a stage | retain |
| C0.3 v-site | `P`; `C ⊊ C′` | `Spa(C′) → P` covers but is not qproét; identity cover has image `{P}` | retain |
| C0.4 cutoffs | `Λ = 0`; `Y = ∅`; `M[1]` | zero categories; `H⁻¹(M[1]) = M` at both cutoffs, other `Hⁱ = 0` | retain |
| C0.5 algebraic topoi | `D₂`; infinite union of `P` | finite cover size 2 vs no finite subcover; topos and stack qc agree | retain |
| C0.6 stalks | `S`, `j_!M` | stalks `(0, M)`, `Γ = 0`; the `O_C`-point alone gives `M`, missing `0` | retain higher-rank points |
| C0.7 enough points | `0 → j_!M` | iso at `s` (`0 → 0`), not at `η` (`0 → M`); the map is not an iso | retain |
| C0.8 squares | fold `D₂ → P` | both composites `(D₂)_v → P_qproét` and `(D₂)_qproét → P_ét`; inverse images `M ↦ (M, M)` | repaired, retain |
| C0.9 coherent bases | `D₂` components | fibre product of distinct components `∅`, same `P`; cover of size 2 | retain |
| C0.10 hull | `id_P`; `D₂ → P`; `Spa(C′) → P` | hulls with 1, 2 and 1 points; `Spa(C′) → P` not pro-étale, hull `P` | retain |
| C0.11 hull and products | `D₂ ×_P D₂` | 4 components both sides | retain |
| C0.12 `λ*` values | `D₂ → P`, constant `M` | `M²` both sides | retain |
| C0.13 limits | product `M × M`; equalizer of `id, 0` | `M²`; `0` on both sides | retain |
| C0.14 full faithfulness | `M` on `P` | unit `a ↦ a`, kernel and cokernel `0` | retain |
| C0.15 higher `λ_*` | étale `M`; `S₃` | `Hⁱ = 0` for `i > 0`; nonabelian `H¹` trivial torsor only | retain |
| C0.16 pro basis | `ℤ_p = lim ℤ/pⁿ` | `(ν*M)(P × ℤ_p) = colim M^{pⁿ}` = locally constant maps | retain |
| C0.17 `ν*` | `M`; `S₃` | unit identity; `Hⁱ = 0` for `i > 0`; `H¹` singleton | retain |
| C0.18 limits of spatial diamonds | `ℤ/pⁿ` tower, finite `M` | `H⁰` = functions through a finite stage on both sides; `H^{>0} = 0` | retain |
| C0.19 std topos | `S`, `(A → B)` | `Γ = A`, `H^{>0} = 0` in both pictures | retain |
| C0.20–C0.21 repleteness | `ℤ/pⁿ⁺¹ → ℤ/pⁿ` | `ℤ_p → ℤ/p` onto, `1 ↦ 1` | retain |
| C0.22 left completeness | `⊕_{r≥0} M[r]` | `H^{−r}(τ^{≥−n}) = M` iff `r ≤ n`; limit recovers `M` in every degree | retain |
| C0.23–C0.24 comparison | `M[0]`; `⊕ M[r]` | `Hom(M, M) = 𝔽_ℓ` in all three categories; every `H^{−r} = M` after both pullbacks | retain |
| C1.1 mates | fold, `(M, M)` | mates act as identity on `M²`; `f = id` gives identity | retain |
| C1.2 reduction | `S`, `j_!M` vs `M` | closed stalks `0` and `M`; `Γ = 0` and `M` | retain |
| C1.3–C1.5 comparisons | fold, `(M, M)`; `p = 2, ℓ = 3` and `p = 3, ℓ = 2` | `R⁰ = M²`, `Rⁱ = 0` (`i > 0`) both sites; `n = ℓ` invertible in both cases | retain |
| C1.5 negative control | disc over `C ⊊ C′`, `𝔽_p` | Artin–Schreier class of `c′T` not in the image of `H¹(D_C)`; comparison fails for `p`-torsion | retain hypothesis |
| C1.6–C1.8 derived | fold, `(M[1], M[2])` | `H⁻¹ = H⁻² = M` on each side | retain |
| C1.9–C1.12 base change | fold pulled back to `D₂`, `M[1]` | four points upstairs, each stalk `H⁻¹ = M²` | retain |
| C2.1 v-local étaleness | `D₂ → P`, `M[0]` | pullback `(M, M)`, descends to `M` | retain |
| C2.2 `D_ét` | `0`; `M[1]`; `S ↦ C(S, ℤ_p)` | first two étale; the third is degree 0 and not locally constant on `P × (ℕ ∪ ∞)` | retain |
| C2.3–C2.6 tests | tower `⊕_{r≤n} M[r]`; `M[1]` | `H^{−r}` eventually constant `M`; cohomology sheaves étale | retain |
| C2.7–C2.8 pushforward | finite fold, `(M, 0)`; `(M[1], M[2])` | outputs `M[0]`; `H⁻¹ = H⁻² = M`, étale | retain |
| C2.9 enhanced categories | `Λ = 0`; fold; singular cutoff example | zero; mate invertible on finite products; `|S| = ℓ^κ > κ` so the mate fails on `H⁰` | retain non-invertibility |
| C2.10 hyperdescent | split two-sheet cover | datum `(M, M, id)`, equalizer the diagonal `M`, higher Čech `0` | retain |
| C2.11–C2.12 cutoff and `𝒟_ét` | `P`, `𝔽_ℓ`; `Λ = 0` | `D(𝔽_ℓ)` with `M ≠ 0`; zero category | retain |
| C2.13–C2.14 coreflection | `M[1]`; `S ↦ C(S, ℤ_p)` | counit `id_M` on `H⁻¹`; coreflection `ℤ_p[0] ≠` the sheaf | retain |
| C3.1 pullback | `D₂ → P`, `M[1]`; `[P/G]` | `(M, M)`; `End(Λ[G])` is `Λ[G]` vs the `|G|×|G|` matrix ring, so `pull q` not fully faithful | retain |
| C3.2–C3.4 `Rf_*` | fold `(M, 0)`; countable fold `⊔_ℕ P` | `Hom((M,M),(M,0)) = Hom(M,M)`; ambient `C(|X|, Λ^ℕ)` non-étale, coreflection constant `Λ^ℕ` | retain |
| C3.5–C3.6 base change | cartesian folds, `N = 0` | `M²` fibrewise, `Rⁱ = 0` for `i > 0` | retain |
| C3.7–C3.8 tensor | `Λ = ℤ`, `ℤ/2 ⊗^L ℤ/2` | `H⁰ = H⁻¹ = ℤ/2`; underived has only `H⁰` | retain derived |
| C3.9–C3.10 Hom | `ℤ/2, ℤ`; `A = ⊕_ℕ ℤ` | `RHom` has `H¹ = ℤ/2`; v-Hom `C(S, ℤ^ℕ)` not étale, étale Hom constant `ℤ^ℕ` | retain |
| C3.11 coefficients | `ℤ → ℤ/p`, `ℤ/p` | `H⁻¹ ≠ 0`, underived fails | retain |
| C4.1 properness consequences | `S ⊃ {η}`; `[P/G]` | open point not closed, 0 lifts; `BG` of lifts, not 0-truncated | retain |
| C4.3 lc Hausdorff | `ℝ → pt`; `{0,1} → pt` | fibre noncompact vs compact | retain |
| C4.4 ring criterion | `id`; `{η} ⊂ S` | 1 lift; 0 lifts | retain |
| C4.5–C4.6 partial properness | open disc; closed disc; `Spa(C,O_C) → ∗`; glued `X` | open disc: pp, not qc; closed disc: qc, not pp (rank-two boundary points); pp iff residue field algebraic over `𝔽_p` (`(O_C)′ = O_C`); gluing: 2 lifts at the rank-one point | retain |
| C4.7 cancellation | identities; `{η} ⊂ S` then `id_S` | composite proper iff factor proper on these | retain |
| C4.8–C4.9 envelope | `C⁺ = O_C`, residue `𝔽̄_p` | `𝔽_p + m_C` integrally closed is `O_C`; envelope `P` | retain |
| C4.10–C4.12 envelope limits | `P → P ← P` | limit `P`, envelope `P`; identity quasi-pro-étale | retain |
| C4.13–C4.15 compactification | `id_S`; closed disc `D` | `S`; `D ⊂ D̄` is the rational open `{|T| ≤ 1}`, not all of `D̄` | retain |
| C4.16 image | `{a,b} → {a}` in `D₂` | image closed, proper over `P` | retain |
| C4.17 colimit | infinite union of `P`; `Spa(C,O_C) → ∗`, `C = 𝔽_p((t))^{a∧}` | finite subunions proper, union pp not qc; residue field `𝔽̄_p` so pp, `P ×_{Spd 𝔽_p} P` not qc, closed subsheaves `∅, P` only | retain qs target |
| C4.18 tautness | `id_S`; `{η} ⊂ S` | taut, lifts 1 vs 0 | retain |
| C5.1–C5.3 `f_!` | fold `(M, M)`; `j : {η} → S` | `f_! = M ⊕ M`; `j_!M = (0 → M)`, `j_*M = (M → M)` | retain |
| C5.4 exchange map | `f = id_S` | both sides `j_!M`, map identity at `η`, `0 → 0` at `s` | retain |
| C5.5–C5.6 compactified points | `C′ = C`, plus `O_C` | one-point spaces, residue valuation ring `k` | retain |
| C5.7 headline | `V = K`; rank-one `V ⊊ K`, `K′ = K` | `V = K`: one point, `F = 0`; `Spa(K,V) = {K, V}`, `j_!M` has stalks `(0, M)`, `Γ = 0`, `H^{>0} = 0`; constant `M` violates the hypothesis and has `Γ = M` | retain |
| C5.8–C5.9 proper base change | `id_S`, `j_!M[1]`; `⊕ j_!M[r]` | `η`-stalk `H⁻¹ = M`, `s`-stalk `0`; all degrees with bound `0` | retain |
| C6.1 field invariance | `C → C′`, `Y = P` | `End(M) = 𝔽_ℓ` both; `H^{>0} = 0` | retain |
| C6.2 annuli | `|ϖ| = |t|^a`, `a = 1, 2` | `n = 1`: `[1,1]`; `n = 2`: `[1/2, 2]` | retain `n ≥ 1` |
| C6.3–C6.4 annulus cohomology | full root tower | Kummer `H¹` transitions `×ℓ = 0`, colimit `H¹ = 0`, `H⁰ = M`; `p`-roots alone leave `H¹ = M` | retain full tower |
| C6.5–C6.7 discrete bases | `k = 𝔽̄_p`, `C = k((t))^{a∧}`; `D₂`, `∅` | `H⁰ = M`, `H^{>0} = 0`; clopen counts 4 and 4; empty: all `0`, one clopen | retain |
| C7.1 constructible | `(M → 0)` on `S`; `⊕_ℕ Λ` on a point; Cantor set `j_!Λ_U` | true with two strata; false (infinite rank); `U` not qc so not constructible | retain |
| C7.2–C7.3 std and stacks | `P × S`, skyscraper at non-isolated `s`; disc minus a point | `{s}` closed not clopen: not constructible; `U` not qc | retain |
| C7.4–C7.5 headline | `×2` on `ℤ`; `ℚ = colim ℤ[1/n!]` | kernel `0`, cokernel `ℤ/2`, image `2ℤ`; `colim Hom(ℚ, ℤ[1/n!]) = 0 ≠ Hom(ℚ, ℚ)` so `ℚ` not finitely presentable and not constructible | retain |
| C7.6–C7.8 descent, continuity | `D₂ → P`, `⊕_ℕ Λ`; `ℤ/2ⁿ` tower | both pullbacks infinite rank; support indicator at stage `n = 2` | retain |
| C7.9–C7.11 local systems, `L|_Z`, dévissage | `(M → M)` vs `(0 → M)`; `Z = {s}` | ranks `(1,1)` vs `(0,1)`; cokernel `(M → 0)`; pieces `(0→M), (M→0)` | retain |
| C7.12 perfect local systems | `Λ²`; `ℤ[ε]/ε²`, `Λ/ε` | dual `Λ²`, `e_i*(e_j) = δ_ij`; `Tor_n(Λ/ε, Λ/ε) = Λ/ε` for all `n`, not perfect | retain |
| C7.13–C7.17 perfect-constructible | `(M → 0)`; `Λ/ε`; `⊕ M[r]` | stratified perfect; constructible but not perfect; unbounded fails | retain |
| C7.18 descent | split cover, `Λ[1]` | Tor amplitude `[−1,−1]` on both sheets and descended | retain |
| C7.19–C7.21 compactness, limits | `C_n = Mⁿ`; `ℤ[1/n!] → ℚ`; differential `1/6` | `M^{(ℕ)}` both sides; `colim = ℚ = Hom(ℚ,ℚ)`; descends to `ℤ[1/6]` | retain |
| C7.22–C7.24 characterizations | constant `M` on `S`; 2-adic tower; `ℚ^{(ℕ)}` | two perfect pieces; partition factors mod 2; `ℚ^{(ℕ)}` not perfect | retain |
| C8.1–C8.2 dimensions | `∅, P, S`; `id_S`, `S → pt`, `∅ → pt` | `⊥, 0, 1`; fibre dimensions `0, 1, ⊥` | retain |
| C8.3 generating degree | `K = K`; discrete `K(t)`; `ℚ_p ⊂ ℂ_p`; Gauss `K(T)` | `0`; `1`; `0` (algebraic closure dense); `1` (image of `K` closed) | retain |
| C8.4 independence | `ℚ_p ⊂ ℂ_p`; discrete `K(t)`; `∅` | `0`; `1`; empty set independent, degree `≥ 0` | retain |
| C8.4a–C8.4c perturbations | `t′ = t + a`, `0 < |a| < 1`, Gauss `t` | `r(t) = 1`, displacement `|a| < α`; algebraic `t` has radius `0`, no admissible `t′` | retain |
| C8.5 headline | `K = K`; `C ⊂ C(t)^{a∧}` | `0 = 0`; `1 = 1` (residue transcendence degree 1 rules out `0`) | retain |
| C8.6–C8.9 generators, tower, monotone | `n = 0,1,2`; `C ⊂ C(t)^{a∧} ⊂ C(t,u)^{a∧}` | `(t, 0)` works for `n = 2`; `2 ≤ 1 + 1`; `1 ≤ 2` | retain |
| C8.10–C8.11 modified degree | `E = L`; Gauss variable | bounds `0`, `1`; residue bound forbids smaller; `1 = 1` | retain |
| C8.11a amalgamation | `L = M = K` | `E = K^{a∧}`, norms exact on `0, 1`; rescaled norm fails isometry | retain |
| C8.12–C8.13 | two Gauss variables; identity square | `2 ≤ 1 + 1`; `0 ≤ 0` | retain |
| C8.14–C8.20 geometric dimension | `id_P`; Gauss field point; `∅` | `0, 1, ⊥`; empty composite `⊥` without `∞` arithmetic; union of `Pⁿ` locally finite, no uniform bound | retain |
| C8.21–C8.23 direct images | fold; `j : {η} → S` | `Rⁱj_* = 0` (`i > 0`); `j_*M = (M → M) ≠ j_!M` | retain |
| C8.24–C8.25 presentations | `P`; norms `|·|` and `|·|^{√2}` | `G = 1`, one point; value groups `e^ℚ` vs `e^{√2ℚ}`, no isometry | retain |
| C8.26–C8.27 modules | trivial `M`; `S₃` regular over `𝔽₅` | invariants dimension 1 both, module dimension 6 | retain |
| C8.28 point cd | `P`; `K = 𝔽_p((t^{1/p^∞}))^∧` | `0`; `x^p − x = 1` forces `|x| ≤ 1` and `0 = 1` in `𝔽_p`, so `H¹ ≠ 0` and `cd_p = 1` | retain |
| C8.29–C8.31 stabilizers | geometric `S` | stabilizers trivial, `1 ⊂ 1` closed; `H⁰ = M`, `H^{>0} = 0` | retain |
| C8.32 extension | `C_p × C_ℓ` | `∞ ≤ 0 + ∞`; trivial: `0 ≤ 0 + 0` | retain |
| C8.33 wild automorphism | `γ = id`; `x = 0` | errors `0`; `‖0/0 − 1‖ = 1`, strict inequality fails at `0` | retain `x ≠ 0` |
| C8.34 headline | faithful trivial action of `1`; `C_ℓ` acting trivially | kernel `1` pro-`p`; kernel `C_ℓ` not pro-`p` although all errors are `0`, so faithfulness is needed | retain |
| C8.35–C8.36 | `G = P = C_p`; `G = 1` | `0 = 0`; `k′₀ = k`, Galois group `1` | retain |
| C8.37 residue bound | `F = k`; perfect closure of `k(t)` | `0 ≤ 0`; Kummer class `t` gives `1 ≤ 1` | retain |
| C8.38–C8.39 tame inertia | `r = 0, 1` | `Hom(0, μ) = 0`; `Hom(ℚ, μ_{p′}) = 𝔸_f^{(p)}`, compact subgroups have `cd_ℓ ≤ 1` | retain |
| C8.40 | Gauss radius 1; rationally independent radius | `1 + 0 ≤ 1`; `0 + 1 ≤ 1`; Abhyankar for `C(S)`, unchanged by algebraic closure and completion | retain |
| C8.41 | `id_P`; Gauss extension | `0 ≤ 0`; `0 ≤ 1` | retain |
| C8.42–C8.43 chains | `S`, `n = 0,1,2` | weak chains `2, 3, 4`; nondegenerate `2, 1, 0`; `C⁰ = A ⊕ B`, `C¹ = B`, `d(a,b) = b − r(a)`, `H⁰ = A`, `H¹ = 0` | retain |
| C8.44 headline | `∅`; point; `S` | `⊥, 0, 1`; `H^{>0} = 0` on point and `S`, `H^{>1} = 0` on `S` | retain |
| C8.45–C8.48 | `S`, `V = {η}`, `U = ∅`; `F = 0` | boundary `{s}` of dimension `0 < 1`; empty support gives all `0` | retain |
| C8.48a and sampled reduction | `id`; `{η} ⊂ S`; `ℚ_p ⊂ ℂ_p`; glued `X` | lifts `1, 0`; `O_ℂ_p ∩ ℚ_p = ℤ_p`; `X` qs, unique field lifts, `closure{η} = X` not qc | retain |
| C8.49–C8.51 | rank-one and Gauss points of `ℙ¹`, `ℙ¹ × ℙ¹` | closure dimensions `0, 1`; `2 = 1 + 1` | retain |
| C9.1–C9.2 | `C_n = Mⁿ[0]`; `D₂`, `N = 0` | `M^{(ℕ)}` both sides; bound stays `0` | retain |
| C9.3–C9.4 Postnikov | `L_n = ⊕_{r≤n} M[r]` | `H^{−r}(Rlim) = M`, comparison identity at `i = −n` | retain |
| C9.5 coproducts | family of `M[0]` | `RΓ(⊕M) = M^{(ℕ)}`, not `M^ℕ` | retain |
| C9.6–C9.7 generators | `Λ`; `A = M[1]` | identity of `Λ^{(ℕ)}` does not factor through a finite subsum; `Hom(Λ, A[−1]) = M ≠ 0` | retain |
| C9.8 headline | point; `S`; `Λ = 0` | `End(Λ) = Λ`, perfect complexes; `(Λ→Λ), (0→Λ)` with cone `(Λ→0)` detect both stalks; zero category | retain |
| C9.9–C9.13 | `Λ/ε` over `ℤ[ε]/ε²`; `⊕ M[r]` | `Tor_n = Λ/ε` all `n`: not compact, not perfect; unbounded not compact | retain |
| C9.14 | `D₂` over `P`, `d = e = 0` | `H⁰ = M²`, `H^{>0} = 0`, two perfect generators | retain |
| `extendByZero` adapter | `U = ∅`, `U = X`, `{η} ⊂ S` | `0`, identity, `(0 → M)`; direct image gives `(M → M)` | retain |
| conventions | `[ℤ --2→ ℤ]` in degrees `−1, 0`; chain `(η, s)`; `Λ = 0`, `X = ∅` | `H⁻¹ = 0`, `H⁰ = ℤ/2`; strict length `1`, first vertex `η`; zero categories, dimension `⊥` | retain |

## Not verifiable

- Scheiderer 1992 (§2, Remark 2.5, Theorem 4.1, Proposition 4.7, and Corollary 4.6 which ECD cites): the journal is paywalled; the sources service finds no legal copy. The use of these inputs was checked through KST Lemma 6.6 (lines 1013–1032) and Stacks 0A3G, not at the original locators.
- Huber 1996, §1.1, (1.1.14)(f), p. 45 (C8.11a): the book is paywalled and the locator was not opened.
- CS17: read from arXiv 1511.02418v1 (Remark 4.2.20 on p. 54 there); the Annals page numbers 711–712 cited in the README were not verified, the statement numbers agree.
- Temkin 2010: read from arXiv 0707.3953v3, where Lemma 6.3.2 is on p. 48 as the README says; the Journal of Algebraic Geometry pagination was not verified.

## Source issues

- **Misprint** in ECD at Proposition 20.14, printed p. 119: the source says `A` has `Λ`-coefficients but writes the Hom groups and the direct system over `𝔽_ℓ`; it should use `Λ` throughout; affects a stated result.
- **Gap** in ECD at Proposition 18.9, printed p. 106: the source says every partially proper map of v-sheaves is a filtered colimit of proper maps without a quasiseparatedness hypothesis on the target; it should assume the target quasiseparated, as `Spa(C, O_C) → ∗` for `C = 𝔽_p((t))^{a∧}` shows; affects the proof.
- **Error** in CS17 at Proposition 4.2.19, printed p. 711: the source says the dimension equals the maximal residue transcendence degree, presupposing attainment; it should say supremum, allowing empty and unbounded spaces; affects a stated result.
- **Misprint** in Conrad at §1, printed p. 1: the source says negative integers congruent to one modulo an odd prime have square roots in `ℚ_3`; it should say `ℚ_p` for that prime; affects nothing.
