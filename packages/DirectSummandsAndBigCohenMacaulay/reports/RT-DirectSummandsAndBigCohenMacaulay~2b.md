<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1452#issuecomment-6485234023 -->
Red team round 2 pass b (claude) of fef1736

Verdict: needs_changes

1. **F01** (P3) §0.5's completion theorem is cited only to statements; the proof's primary source is absent

   **Location.** `packages/DirectSummandsAndBigCohenMacaulay/README.md:298`, "(ANDRE18B … line 659; BMPSTWW … line 516; HEITMANNMA18 … line 123.)" and :302 "This section owns the arbitrary-module completion and change-of-parameters assertion".

   **Claim.** For M ≠ mM with Hⁱ_m(M) = 0 for i < d, the m-adic completion is balanced big Cohen–Macaulay, with the three locators as its sources.

   **Witness.** ANDRE18B line 659 and HEITMANNMA18 line 123 only use the statement; BMPSTWW line 517 attributes it to Bruns–Herzog, Exercise 8.1.7 and Theorem 8.5.1, and none of the cited texts proves it. The README's proof route stops at the ownership sentence.

   **Repair.** Add to References `- **BH93**. Winfried Bruns and Jürgen Herzog, *Cohen–Macaulay rings*, Cambridge Studies in Advanced Mathematics 39, 1993; Exercise 8.1.7 and Theorem 8.5.1 (Bartijn–Strooker); cited by locator, uncertified.` and record it in `sources.toml` with `status = "uncertified"`. In §0.5 replace the locator list by "(ANDRE18B, §4.1, sentence after Définition 4.1.1, p. 85; ANDRE18B line 659; BMPSTWW, §2.2, paragraph after conditions (a)–(d), p. 12; BMPSTWW line 516, which cites BH93, Exercise 8.1.7 and Theorem 8.5.1 for the completion; HEITMANNMA18 … line 123.)" and after "the maximal-adic completion is balanced" add "(BH93, Theorem 8.5.1, uncertified: complete M, show every system of parameters acts weakly regularly on M̂ through the vanishing of the lower local cohomology, and keep M̂/mM̂ = M/mM ≠ 0)". Tested on the instance R = k[X]_(X), M = R: BH93 8.5.1 gives k⟦X⟧ balanced, agreeing with Check :307.

2. **F02** (P3) §4.10 cites a survey sentence for the equal-characteristic-zero existence; the primary source is not in the manifest

   **Location.** `packages/DirectSummandsAndBigCohenMacaulay/README.md:907`, "(BMPSTWW, §2.2, paragraph before Theorem 2.5, p. 13; BMPSTWW line 561; ANDRE18B, §0.7 and §4.3, pp. 75 and 87; ANDRE18B line 747.)".

   **Claim.** The locators support the existence theorem for Noetherian local rings containing ℚ and its reduction to characteristic p.

   **Witness.** BMPSTWW lines 561–562 only say that in equal characteristic the result is Hochster–Huneke's [HH92, HH95]; ANDRE18B line 747 is the proof of Théorème 0.7.2 and line 184 calls the equal-characteristic case already known. Neither text contains the reduction. HH92 (Annals of Mathematics 135 (1992), 53–89) has no manifest key; HH95 is uncertified and cited only for §1.2(d) and §2.3.

   **Repair.** Add `- **HH92**. Melvin Hochster and Craig Huneke, *Infinite integral extensions and big Cohen–Macaulay algebras*, Annals of Mathematics (2) 135 (1992), 53–89; the equal-characteristic-zero existence theorem and its reduction to characteristic p by Artin approximation; cited by locator, uncertified.` to References and `sources.toml` (fetch through the sources service first; record uncertified if only the paywalled page resolves), and in §4.10 replace the locator list by "(HH92, the equal-characteristic-zero existence theorem and its proof by reduction to characteristic p; uncertified. BMPSTWW, §2.2, p. 13; BMPSTWW line 561, which attributes the result to HH92 and HH95; ANDRE18B, §0.7, p. 75; ANDRE18B line 184.)". Tested on Check :918: the quotient ℚ[ε]/ε² → ℚ is the dimension-zero instance, where no reduction is needed.

3. **F03** (P3) the elliptic-cone Check of §7.1 uses Kovács's Theorem 1 without a locator

   **Location.** `packages/DirectSummandsAndBigCohenMacaulay/README.md:1225`, "so by Kovács the unit for a resolution does not split"; the §7.1 locator list at :1192 names only BHATT12 and BHATT18.

   **Claim.** The cone ℂ[x,y,z]/(x³+y³+z³) is not a derived splinter because the unit for the blow-up of the vertex does not split.

   **Witness.** The step "unit splits for a resolution ⇒ rational singularities" is KOVACS00, Theorem 1 (line 11, p. 187), which the README cites nowhere; §7.7 cites only Theorems 2 and 5 (lines 50, 148) for the attribution and the source error. Theorem 1's proof does not pass through Theorem 5, so the Check is sound but its locator is missing.

   **Repair.** In the Check write "(KOVACS00, Theorem 1, p. 187; KOVACS00 line 11: a left inverse of O_X → Rφ_*O_Y for a resolution φ forces rational singularities; the blow-up Y of the vertex has R¹π_*O_Y = H¹(E, O_E) = ℂ ≠ 0)" and add "KOVACS00, Theorem 1, p. 187; KOVACS00 line 11" to the §7.1 locator list. Tested on the instance: for the elliptic curve E = V(x³+y³+z³) ⊂ ℙ², H¹(E,O_E) = ℂ, so the vertex is not rational and Theorem 1 excludes the retraction.

## Round-1 findings at this head

Each earlier finding (pass a: a.F01–a.F08; pass b: b.F01–b.F04), the passage at fef1736, and the status.

| Finding | Repaired passage at this head | Status |
|---|---|---|
| a.F01 (§7.4 roots) | `packages/DirectSummandsAndBigCohenMacaulay/README.md:1273` "left inverse in the almost derived category of the basic setup (K°, K°°), that is, with respect to the ideal K°°A"; Check at :1287 (completed ℚ₃(μ_{3^∞}) has no cube root of 3). The Check is correct: X³−3 is Eisenstein, its splitting field has group S₃, cyclotomic subextensions are abelian, Krasner keeps algebraic elements of the completion in the tower. | repaired |
| a.F02 (three input theorems removed from Suggested.lean) | FIX-RT~1 marks it disputed (Layer 0–1 inputs, not headlines; reversing FIX-PKG~2 F08). The reason stands: §§0.5, 0.6, 1.2 are consumed by the stated headlines and are not end theorems. | not re-raised |
| a.F03 (P1.4) | README :590 "PerfectoidSpaces §P1.4 (exists pseudouniformizer with compatible roots), applied to g, gives π = gw with w a unit"; :608, :704, :88. P1.4 on main (`TauCetiRoadmap/PerfectoidSpaces/README.md:3955`) states ϖ = ϖ₁·u with u a unit for ϖ₁ᵖ | p. | repaired |
| a.F04 (`hsep`) | not actionable (Part II scope), README :13 names the Part II; :1111 and :1159 correct the Heitmann–Ma attributions (height-one quotient square; Corollary 4.3 removes separability). HEITMANNMA18 line 544 confirms. | settled |
| a.F05 (Checks) | §3.2 computed Frobenius Check :604; §4.2 relation-restatement Check gone (:760–766 are five computed Checks); scope bullets moved into prose. | repaired |
| a.F06 (build order) | README :143 "build §4.9 before §4.8 … §§5.2–5.3 before the flat-domination proof of §5.1"; §5.1 *Needs* split at :991. | repaired |
| a.F07 (locator) | :541 "ANDRE18B line 551"; :1107 "Remarques 2.6.1(4) … ANDRE18B line 575". ANDRE18B line 551 is Corollaire 2.6.1; line 575 begins item (4). | repaired |
| a.F08 / b.F02 (§7.7) | :1335–1341: trace lemma on f^!O_X = L invertible in degree 0, Jacobian section, τ∘unit = e, `qeResolution`; Popescu limit passage and Kovács route deleted; gap `grauert-riemenschneider` absent from plan.json and README; ResSing contract cites §7.5 (:139). Recomputed: Check :1345 gives 2y·c with values (2, 0) = Tr; Check :1346 L = O(E); Check :1347 ranks 2 vs 1. SchemeAndStackFoundations §2.19 on main supplies `globalDuality`, `upperShriek_lci` ("f^!O_Y tensor-invertible, locally a shifted line bundle"), `upperShriek_flat_baseChange`, `upperShriek_etale`, `pushforwardRightAdjoint_affine_finite` (`TauCetiRoadmap/SchemeAndStackFoundations/README.md:4105–4129`); ResSing §7.5 `qeResolution` at its head (reduced Noetherian quasi-excellent ℚ-schemes, projective birational, regular source). No new error found: gluing of the local Jacobian sections follows from generic agreement on the integral Y; the shift is fixed by the finite étale generic fibre. | repaired |
| b.F01 (pointed modifications) | §4.2 :745 algebra modification T[X]/(F) with (F) the ideal, double sequences, finite witnesses; §4.3 :772 criterion for algebra modifications, "if" by the countable tower of simultaneous modifications; §4.4 :790 key lemma for R-algebra maps with exponent e′+δ(e+1/pᵐ); §4.5 :818 C = δ(1+⋯+δ^{ℓ−1}). Recomputed: e₀ = 0, e_{i+1} = δe_i + 1/pᵐ gives e_ℓ = (1+⋯+δ^{ℓ−1})/pᵐ and witness exponent δe_ℓ = C/pᵐ; δ=2, ℓ=2: C=6, 6/16 ≤ 1/2, 6/8 > 1/2. Suggested.lean docstring :20–22 updated. | repaired |
| b.F03 (Stacks texts) | :25 "STACKS line 4671 in the commutative-algebra text"; :131 "line 4296 in the flattening text"; :1240, :1251 "lines 2350 and 2413 in the cohomology-of-schemes text". Verified in the cached additional texts: algebra line 4671 = Definition 42.1 (030O); coherent 290 = Lemma 4.2 (01XI), 2350 = Proposition 19.1 (02O5), 2413 = Lemma 19.2 (02O6); more-algebra 13484 = Lemma 101.2 (0A6A); flat 4296 = Lemma 31.4 (081T). | repaired |
| b.F04 (flat-local transport) | :119 fourth clause "For a flat local map R→R′ … m_R R′ = m_{R′} …"; plan.json `parameter-systems` has the same text; §4.7(4) :853 cites it; *Needs* :860. | repaired |

No repair introduced a new error that I could find (the §7.7 lemma and the §§4.2–4.5 route were recomputed above).

## Verified sound

- **Declarations read:** 19 of 19 in `packages/DirectSummandsAndBigCohenMacaulay/Suggested.lean` (9 definitions with real bodies, 10 admitted theorems). No `lemma`, `set_option`, `#eval`, `#print`, `True` placeholder or sorry'd data. Imports: `import Mathlib` and `import TauCeti.RingTheory.RegularLocalRing.Basic` (the module exists at the Tau Ceti pin, `TauCeti/RingTheory/RegularLocalRing/Basic.lean`, supplying `TauCeti.IsRegularLocalRing.isDomain`). The worker's elaboration failed on a missing Tau Ceti object file, not on the file; no Lean was run in this read-only pass, and the signatures were compared by hand against the README (table below). Every hypothesis a statement needs is in its own signature; no section `variable` is used, so no binder can be lost.
- **Pinned declarations located** (Mathlib `6b7abb3…`, Tau Ceti `a91d3aa…`): `CategoryTheory.HasInjectiveDimensionLE` (`Mathlib/CategoryTheory/Abelian/Injective/Dimension.lean:52`), `Algebra.IsTranscendentalSeparable` (`Mathlib/FieldTheory/TranscendentalSeparable.lean:72`), `IsRegularLocalRing` extends `IsLocalRing, IsNoetherianRing` and `IsRegularRing` extends `IsNoetherianRing` (`Mathlib/RingTheory/RegularLocalRing/Defs.lean:51, 92`), `IsLocalRing.ResidueField.map` with `[IsLocalHom f]` (`Mathlib/RingTheory/LocalRing/ResidueField/Basic.lean:95`), `RingTheory.Sequence.IsRegular` extends `IsWeaklyRegular` (`Mathlib/RingTheory/Regular/RegularSequence.lean:146`; `Ideal.ofList` used there), `Functor.rightDerivedFunctorPlus` and `rightDerivedFunctorPlusUnit` (`Mathlib/Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean:46, 95`), `SheafOfModules.unitToPushforwardObjUnit` (`Mathlib/Algebra/Category/ModuleCat/Sheaf/PullbackFree.lean:59`), `Scheme.Modules.pushforward` additive (`Mathlib/AlgebraicGeometry/Modules/Sheaf.lean:165, 198`), `singleMapHomologicalComplex` (`Mathlib/Algebra/Homology/Additive.lean:262`), `CochainComplex.Plus`, `DerivedCategory.Plus.Q`, `HasDerivedCategory.standard`, `mapCochainComplexPlus`, `isZero_single_obj_X`, `isStrictlyGE_iff`; Tau Ceti `Module.Flat.pi` (finite index) and `FaithfullyFlat.pi_of_exists_submodule_ne_top` (`TauCeti/RingTheory/Flat/Pi.lean:75`).
- **Targets read:** 52 sections, every *Needs* line, every Dependencies list, the Conventions, supplier contracts, worked examples and references.
- **Headlines:** the ten stated theorems are the README's end theorems (§§4.9, 4.11, 5.1, 5.3, 5.4, 5.5, 6.2, 6.4, 7.6, 7.8); the three unstatable ones (perfectoid covers, the modification criterion, cohomology-killing covers) are named in the module docstring. Special cases (§§1.3, 2.3, 3.7, 4.10, 7.7) and §5.5(1) are consequences of stated headlines and are correctly absent. **Padding probe:** none of the ten theorems follows by one tactic or one library lemma; `structureComplex` and `derivedUnit` are needed to state `DerivedSplinter`; no `example`.
- **Checks tested:** 74 computed (table below); every Lean definition has at least three discriminating Checks (SplitAlgebra 8, Splinter 6, ParameterSystem 3, BalancedBigCM 5, PureAlgebra 3, SeparableResidueMap 4+4, structureComplex 3, derivedUnit 3, DerivedSplinter 5).
- **Locators verified against the cached texts:** 84 (ANDRE18B 36: lines 27, 41, 54, 70, 72, 81, 113, 179, 184, 189, 551, 575, 586, 598, 618, 630, 638, 641, 643, 659, 664, 692, 720, 741, 747, 769, 779, 780, 802, 818, 822, 868, 873, 890, 912, 928; BHATT18 12: 17, 27, 32, 137, 202, 451, 469, 547, 563, 604, 616 and the proof of 6.1 at 606–614; BHATT12 12: 20, 30, 38, 42, 91, 103, 105, 114, 256, 294, 314, 366; HOCHSTER02 8: 172, 175, 180, 187, 192, 225, 245, 258; HEITMANNMA18 3: 123, 143, 544; BMPSTWW 4: 507, 516, 561, 672; HUNEKELYUBEZNIK 1: 75 (Theorem 2.1: R a local domain containing a field of characteristic p, surjective image of a Gorenstein local ring A with no hypothesis on A's characteristic, matching the Lean signature); KOVACS00 5: 11, 50, 89, 148, 193; DATTAMURAYAMA 1: 1315 (Proposition 5.4.1(iii), n = 1 gives the Henselian DVR); HOCHSTERLC 1: 623; HOCHSTER73 1: 235; CHASE60 1: 139; STACKS 6: algebra 4671, coherent 290/2350/2413, more-algebra 13484, flat 4296). All support the claims as stated; S01–S03 concern missing primary locators, not wrong ones.
- **Sibling citations checked:** 71. On main: SchemeAndStackFoundations §§0.9, 0.11, 0.15, 0.17, 2.6, 2.7, 2.18, 2.19 (with the six named declarations), 2.21, 4.12 (Noetherian integral `modification_domination`, so the qcqs gap is not already provided), 4.13; PerfectoidSpaces P0.12, P1.4 (`exists-pseudouniformizer-with-compatible-roots`: ϖ = ϖ₁u, ϖᵖ | p), P1.24, P1.25, P2, P3 and the ten hyphenated labels (root-ideal-basic-setup :967, almost-hom-and-adjoints :1264, change-of-basic-setup :1460, almost-algebra-lower-shriek-shriek :1564, lower-shriek-shriek-faithful-flatness :1581, almost-dual-and-trace :1835, almost-zero-limits-and-colimits :3251, sheaf-theorem-and-almost-acyclicity :6799, integral-closure-almost-finite-etale :8691, almost-purity-theorem :8751); DerivedModuleAlgebra §§0.K.1, 1.T.1, 1.1.1, 1.E.0, 1.M.2; EnhancedDerivedSheaves §E1.4, §E1.6 (`isRegularRing_projectiveDimension_le`, Kunz, `completeNoetherianLocal_cohenPresentation` at :768), §E1.8 (`liftingObstruction_map` at :878); StableReduction Layer 2 "coherent curve theory, duality, and positivity" (:354). At their current heads through the roadmap index: DeformationAndDerivedPatchingAlgebra §§1.9, 1.10, 1.13, 1.14, 1.15, 3.1, 3.2, 3.4, 3.7, 3.9, 4.1, 7.3; DeformationAndDerivedPatchingAlgebraPartII §K0.1, §K0.3; PerfectoidQuotients §§0.7, 1.3, 1.4; DerivedDeRhamCohomology §1.10 "Bhatt's ordinary flatness criterion"; ResolutionOfSingularitiesCharacteristicZero §7.5 `qeResolution`. PerfectoidSpacesPartII is the design-stage board package (`packages/PerfectoidSpacesPartII/design/README.md`, merge order line 72, before this roadmap at 73): all 15 cited RA node ids exist; `krull-detection-lemma` (:1734) has exactly the hypotheses §§2.2 and 4.6 use (Noetherian R, finite M, faithfully flat S, idempotent K, nonzero preimage in local R); `ramified-kummer-almost-flatness` (:2039) is over A = W(k)⟦T⟧, so gap:ramified-multielement-kummer asks for something not provided; `flat-integral-model` (:1994) is the S of §2.2.
- **Declared gaps:** `ramified-multielement-kummer`, `common-cohen-extension`, `parameter-systems`, `perfectoid-base-modification-domination` carry the same slug and text in `design/plan.json` and the README contracts; each is precise and minimal against the supplier as checked above. The four supplier-less intake records G1–G4 (`equal-char-zero-existence-proof`, `char-zero-derived-splitting-bridges`, `arbitrary-module-completion-proof`, `pointed-modification-finite-witness`) remain in plan.json without a supplier; FIX-PKG~2 F01–F04 settled them as not actionable in this package (the intake retires them), G2 and G4 now describe routes the README no longer uses, and the mathematics of G1 and G3 is addressed in S01–S02 only as to locators. Not re-raised.
- **Ownership:** the roadmap-index grep over main and the 414 open pull requests finds no other owner of "algebra modification", "balanced big Cohen", "derived splinter" or "direct summand theorem"; "absolute integral closure" occurs only in SchemeAndStackFoundations (main and its revising pull requests, which are not dependencies) and ClassicalAdicEtaleCohomology (a use). The namespace `TauCetiRoadmap.DirectSummandsAndBigCohenMacaulay` is declared in no other `Suggested.lean`. Ownership against open pull requests whose files the brief does not give was checked only through that grep.
- **Dependency direction**, exact output: `depcheck: 186 roadmaps, 1220 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The citation resolver's single lead (PerfectoidSpacesPartII §RA.5) is the board design package above.
- **Policy:** `git diff --stat origin/main...HEAD` touches only `packages/DirectSummandsAndBigCohenMacaulay/` (README, Suggested.lean, design/plan.json, metadata.toml, sources.toml, reports); no pull-request numbers or process narrative in README or docstrings; `theorem` only; every target has a locator; no computational algorithm; no machine path.

### Lean declarations: context, instances, values

| Declaration (line); README | Context in the signature | Instances, values | Result |
|---|---|---|---|
| `SplitAlgebra` (46); §0.1 | CommRing R S, Algebra | ℤ→ℚ: Hom_ℤ(ℚ,ℤ)=0; ℤ→ℤ[i]: coefficient of 1, ρ1=1; ℝ→ℂ: Re(i²)=−1≠Re(i)²=0; R=S=0: ρ1=1 since 1=0 | matches |
| `Splinter` (52); §0.2 | CommRing; S : Type u finite | k[ε]/ε²: not reduced; K[x,y]/(xy): x=(x+y)(1,0)∈(x+y)S, x∉(x+y)R; field: holds | matches |
| `ParameterSystem` (59); §0.3 | local Noetherian, List | k, []: 0=0, radical ⊥=m; k⟦X⟧,[X²]: radical (X); [1]: radical R≠m; k⟦X,Y⟧,[X,X]: radical (X)≠m | matches |
| `BalancedBigCM` (66); §0.4 | local Noetherian, Module | M=0: m•⊤=⊤; ℚ over ℤ_(p): pℚ=ℚ; k⟦X⟧/(X): X·1=0; regular R: holds | matches |
| `PureAlgebra` (73); §1.2 | Algebra, M : Type u | ℤ→ℚ, M=ℤ/2: 1⊗1=0; R→R×R: first projection retracts | matches |
| `absoluteIntegralClosure_charP` (84); §4.9 | R local Noetherian domain, A local Noetherian with injdim_A A ≤ n, A→R surjective, CharP R p | R=A=𝔽₂: R⁺=𝔽̄₂, xs=[], R⁺≠mR⁺; A=ℤ_p⟦x⟧→R=𝔽_p⟦x⟧: A Gorenstein of characteristic 0 is allowed by HL 2.1 | true as typed |
| `exists_balanced` (95); §4.11 | local Noetherian; C : Type u | 𝔽₂[ε]/ε²: C=𝔽₂, mC=0; regular R: C=R | true |
| `directSummand` (104); §5.1 | IsRegularRing (Noetherian), Module.Finite, injective | R=0: S=0, ρ=0 works; ℤ→ℤ[i]; the normal Fermat cubic over 𝔽₂ is excluded (not regular) | true |
| `finiteCover_flatDomination` (111); §5.3 | same; T : Type (max u v) | R=0: T=0 faithfully flat (no maximal ideals); ℤ₂, S=R×R/2: T=R | true |
| `absoluteIntegralClosure_split` (120); §5.4 | regular local, m-adically complete | field K: K̄ basis projection; `isDomain` from Tau Ceti makes `FractionRing R` a field | true |
| `monomial_noncontainment` (127); §5.5 | ParameterSystem, m<n | d=0: 1∉⊥; k⟦X,Y⟧, n=2, m=1: XY∉(X²,Y²); m=0,n=1: 1∉m | true |
| `SeparableResidueMap` (136); §6.2 | local, IsLocalHom, induced algebra | 𝔽₂→𝔽₂: degree 1; 𝔽₂→𝔽₂(t): transcendental separable; 𝔽₂(t)→𝔽₂(t^{1/2}): fails | matches |
| `weakFunctoriality_regularTarget` (145); §6.2 | B complete Noetherian local domain, B′ complete regular local, CharZero both, residue char p, injective, separable | id on ℤ₂: C=C′=ℤ₂; ℤ₂⟦T⟧→ℤ₂⟦T,V⟧/(TV−2): target regular, 2∈m², covered; after the Cohen extension B″ embeds in the domain B″′ so stays a domain | true |
| `pureSubring_cohenMacaulay` (162); §6.4 | B local Noetherian, B′ regular local, local hom, char 0, residue char p, pure, separable | dim 0: IsRegular B [] ⟺ B≠0; C₂ on ℤ₃⟦X⟧: ℤ₃⟦X²⟧ CM | true |
| `structureComplex` (178); §7.1 | Scheme | Spec 𝔽₂: degree 0 term 𝔽₂; ∅: zero; k[ε]/ε²: ε kept | matches |
| `derivedUnit` (189); §7.1 | f : X ⟶ Y | id: identity on H⁰; Spec(A×A)→Spec A: a↦(a,a); Spec ℤ/2→Spec ℤ: 2↦0 | matches |
| `DerivedSplinter` (205); §7.1 | CommRing; X : Scheme.{u}, proper surjective | R=0: X=∅, unit is the identity of 0; non-reduced R: Spec R_red→Spec R has no retraction | matches |
| `splinter_iff_derivedSplinter_charP` (213); §7.6 | Noetherian, CharP p | 𝔽_p⟦x,y⟧: both; node: both fail; k[ε]/ε²: both fail | true |
| `derivedDirectSummand` (221); §7.8 | IsRegularRing | blow-up of k⟦X,Y⟧: unit iso; d=0 blow-up: empty, not surjective; R=0 | true |

### Adversarial pass on README targets

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.1 splittings | ℝ→ℂ; node normalization; ℤ→ℚ; zero K-algebra; split ⟺ generator for finite S | Re: (i²,i)↦(−1,0); (x+y)(1,0)=(x,0); Hom=0; 1=0; τ(S)=R gives local unit values f(s), then g=f(s·−) has g(1) a unit | holds |
| §0.2 splinters | ℤ; k[ε]/ε²; node; K[t²,t³]; ℚ-domains | 1 primitive in S/tors; nilpotent; contraction fails; quotient K·t torsion ≠0; normal ⟺ splinter | holds |
| §0.3 big CM | ℚ/ℤ_(p); K⟦X,Y⟧/(XY,Y²); M=0; d=0; monomial law | pℚ=ℚ; (0:X)∋Y≠0; m·0=0; empty list; d=0: 1·M⊄0 | holds |
| §0.4 balanced | R/x₁R; k⟦X⟧/(X); change of rings | depth d−1; X·1=0; sop of A ↦ sop of B (gap clause 3), m_AC⊆m_BC≠C | holds |
| §0.5 completion | k[X]_(X); M=0; Koszul step | k⟦X⟧/X=k; 0; H^i_m(M)=colim H^i(K(xᵗ;M))=0 for i<d | holds; S01 |
| §0.6 faithful flatness | DVR, C=Frac A; Tor induction | C/ϖC=0; h=ht P, P∈Ass(A/(x)), Tor_j(N,C)=0 by Koszul with x a prefix of a sop | holds |
| §0.7 obstruction | id; 2:ℤ→ℤ; K[t²,t³]⊂K[t]; free rank>0 | cone 0; class 1∈ℤ/2; Ext¹≠0; B/A projective | holds |
| §0.8 reductions | S=A×A/I; height-one P∋p in Z̄ | projection; Q⊆P nonzero prime forces Q=P ∌ p, contradiction | holds |
| §0.9 trace | ℤ[(1+√5)/2]; K(√a); a=1 | Tr=1, 1/2∉ℤ; (2,0)↦(1,0); degree 1 | holds |
| §0.10 dim ≤ 2 | DVR; k[ε]/ε²; reflexive depth | torsion-free free; basis (1,ε); depth min(2,dim)=dim | holds |
| §1.1 endomorphism criterion | r=0 Frobenius; V⟦x⟧, σx=x^q; σ injective | ∩σʲ(m)R=rR; rank q; σ=τ|_R injective since τ is | holds |
| §1.2 complete pure ⟹ split | field; Datta–Murayama K₁(k) | ev₁ surjective via E; Hom_V(V^{1/p},V)=0 with V⊆V^{1/p} faithfully flat (Kunz) | holds |
| §1.3 char p | 𝔽_p⟦x⟧⊂𝔽_p⟦x^{1/p}⟧, p=2,3 | integer-exponent projection, 1↦1 | holds |
| §2.1 mod Iᵐ | A=ℤ,I=ℤ; Hom(ℤ/2,ℤ/2ⁿ) | 0→0 splits, ℤ→ℤ/2 does not; zero transitions | holds |
| §2.2 mod pᵐ | ℤ₂, g=1, m=1,2; injectivity | pg≡0 mod 2, ≡2 mod 4; pᵐB∩A=pᵐA by normality | holds |
| §2.3 W(k)⟦T⟧ | n=0; Kummer B | W(k); purity | holds |
| §3.1 Cohen presentation | ℤ_p[√p]⟦x₂⟧; f₀=p²+X²; p∣f | f=X₁²; u=1−p, f=X²/(1−p); p−f=p·unit forces char p | holds |
| §3.2 perfectoid cover | A₀=ℤ_p; gᵖ=f+ph; P1.4 | O_K; u=1+h unit (no constant term); π=gw, πᵖ=p·uwᵖ | holds |
| §3.3 almost ff | A₀=ℤ₂, M=A₀/m; (b) | 2^{1/2}≠0 in A/2A; π^{1/pⁿ}∈IA_{!!} gives p∈I^{pⁿ}, so I=A₀ by Krull | holds |
| §3.4 detection | ℤ₂, g=1, m=2,3 | p²g=4: 0 mod 4, ≠0 mod 8; p²g∉Annʲ by Krull | holds |
| §3.5 annuli | g=1; 𝔽₄ | constant tower; Tr(1)=0, Tr(ω)=1 | holds |
| §3.6 limit | constant tower; Q₀=0 | lim V=V, lim¹=0; Hom=0 | holds |
| §3.7 Bhatt | y²=x+p, p odd and p=2 | disc 4(x+p), g=x+p≢0 mod p | holds |
| §4.1 almost CM | O_K/ℤ_p; 𝔽_p⟦X,Y⟧/(XY,Y²), π=1; D=0; dim 0 | J=m_D⊄pD; (0:X)=(Y) not killed; roots ∈ m·0; colon empty | holds |
| §4.2 algebra modifications | k⟦x⟧[t]/(xt), k=0; (XY,Y²); x−xX; zero relation; R/(X) | T/tT=R kills t²; kills Y; X↦1; X≠0, xX=0; T/T=0 bad | holds |
| §4.3 criterion | only-if; if: tower of simultaneous modifications | extension along both parts; a witness in B_{i+1} uses finitely many F_r, so lies in a finite single-step sequence; balance by §0.5 | holds |
| §4.4 key lemma | π unit; p=2, e=0, m=1; k=0 | colon = ideal; exponents 1/2, 1, 3/2; x₁α(u₁)=0 gives α(u₁)=0; F↦0 | holds |
| §4.5 exponent bound | δ=2, ℓ=2, p=2, h=1; ℤ₂, D=O_K | C=6; m=4: 6/16≤1/2, m=3: 6/8>1/2; 2^{1/2ʰ}∉2D | holds |
| §4.6 criteria | ℤ₂, x₁=4, g=1; (a) via Krull detection | 2∈(π)∩A∖4A; a=πd, π^{1/pʰ}d∈D′ gives a∈π^{1−1/pʰ}D′⊆K; RA.5 hypotheses met | holds |
| §4.7 reductions | ℤ_p⟦x,y⟧/(xy); ℤ₂⟦X,Y⟧/(2X,2Y), (2+X,Y); (3) | B/(x)=ℤ_p⟦y⟧; quotient ℤ₂/4, images (X,Y) and (2,0); pb nilpotent with b not nilpotent would make bⁿ pⁿ-torsion, so B_red is p-torsion-free | holds |
| §4.8 André existence | (2X,2Y); (2X); x₁=p²; B″ non-domain | both branches; ℤ₂⟦Y⟧; (p,x₂,…) m-primary so B finite over A, P=0 by dimension; minimal-prime quotient taken again | holds |
| §4.9 Hochster–Huneke | 𝔽₂, []; 𝔽_p⟦x,y⟧; A of char 0 | R⁺/mR⁺≠0; faithfully flat; HL 2.1 allows it | holds |
| §4.10 char 0 | ℚ[ε]/ε²; ℤ[1/6][X] at p=2,3 | C=ℚ; empty fibre | holds; S02 |
| §4.11 all local rings | 𝔽₂[ε]/ε² | C=𝔽₂ | holds |
| §4.12 squares | id; π=2, π′=4; δ on D[1/π] | quotient 2^{1/2ⁿ}, reverse has valuation −1/2ⁿ; δ(π)∣π′ makes δ(π) invertible in D′[1/π′] | holds |
| §5.1 direct summand | R=0; Fermat cubic 𝔽₂[a,b,c]/(a³+b³+c³)→squares | S=0; z⁴=x³z+y³z∈(x²,y²)S, c²≠0 in 𝔽₂[c]/c³; a³+b³+c³↦(x³+y³+z³)²=0 | holds |
| §5.2 products | empty; ∏ℤ; k⊕V, V²=0 | 0 not ff; injective scalars; (x₁,x₂,…)∈Ann(x₀)∖VM | holds |
| §5.3 domination | field; ℤ₂, S=R×R/2; universes | residue field; 2T=0 on the wrong factor; S_m : Type (max u v), product over maximal ideals of R | holds |
| §5.4 R⁺ splits | complete DVR; field; char p | finite subalgebras free; K̄; ff by §4.9 | holds |
| §5.5 monomial | d=0; node, x+y; k⟦X,Y⟧, n=2; (1) | 1∉0; iff for m≥n; XY∉(X²,Y²), (XY)²∈; pure gives contracted | holds |
| §6.1 purity and completion | k[X]_(X)→k[X,Y]_(X,Y); C=completion_{m_BB′}B′ | Y=0 extends; C/m_B^nC=B′/m_B^nB′, Krull on finite P | holds |
| §6.2 weak functoriality | ℤ_p⟦T⟧→ℤ_p⟦T,V⟧/(TV−p), p=2; residue maps; B″ | regular, 2∈m²; 𝔽₂→𝔽₂(t) separable; B″↪B″′ domain | holds |
| §6.3 descent | B=B′=C=C′=k⟦X,Y⟧ | (0:X)=0, (X):Y=(X) | holds |
| §6.4 pure subrings CM | C₂ on ℤ₃⟦X⟧; S₃ on ℤ₅⟦X₁,X₂,X₃⟧; trivial group | a+bX↦a; X₁↦e₁/3, 6 unit; identity | holds |
| §7.1 derived splinters | field; elliptic cone; Spec 𝔽₂; ∅; k[ε]/ε²; A×A; ℤ→ℤ/2; A→B finite injective | H¹(E,O_E)=ℂ≠0 (Kovács Thm 1); degree-0 term; zero; ε kept; (a,a); 2↦0; Spec B→Spec A surjective by lying over | holds; S03 |
| §7.2 perfectness | finite B; elliptic curve; 𝔸¹; Čech bound | pd finite; H⁰=H¹=k; k[T] infinite; Hⁱ=0 for i≥t | holds |
| §7.3 reductions | A×A; Z=closure of a closed point of the generic fibre | identity composite; Z integral, proper, dominant hence surjective, generic fibre finite | holds |
| §7.4 almost split | Y finite; Y=Spec(K°/p); ℚ₃(μ_{3^∞}); Y[1/p]=Spec B[1/p] | §3.5; εp≠0 in the domain K°; no cube root of 3 (S₃ vs abelian, Krasner); Y×_B C is an isomorphism over Spec C[1/p] | holds |
| §7.5 killing cohomology | [p] on E, p=2,3; Spec R | [p]*=p=0 on H¹; no positive cohomology | holds |
| §7.6 splinter ⟺ derived | 𝔽_p⟦x,y⟧; node; char-2 field; lift of the unit | both / both fail; Hom(A,H⁰(Y))→Hom(A,RΓ(Y)) iso in D^{≥0} | holds |
| §7.7 char 0 derived | K⟦x⟧⊂K⟦x^{1/2}⟧; blow-up of K⟦x,y⟧; ℙ¹→ℙ¹ squaring; field; elliptic curve | 2y·c: (1,y)↦(2,0)=Tr; L=O(E), τ=id; ranks 2 vs 1, ½Tr; Tr(1)=e; Ext²_k=0 | holds |
| §7.8 derived direct summand | finite; blow-ups d=1,2; d=0; mixed-characteristic route | RΓ=A₀; Proj ∅, k→0; a retraction of A_n→RΓ(Z_n) composed with the base-change map RΓ(Z)⊗^L A_n→RΓ(Z_n) retracts the derived-tensor unit, so no flatness of A₀→A_n is needed (BHATT18 line 614) | holds |
| Conventions: obstruction | 0→ℤ→²ℤ→ℤ/2; id | class 1∈ℤ/2; 0 | fixed |

## Not verifiable

- HH95 (uncertified) and HH92 (no manifest key): the equal-characteristic-zero reduction of §4.10 was not read; S02 asks for its locator. The section or theorem number inside HH92 was not established (a web search returned only the bibliographic entry), so the repair cites the paper and the result.
- BH93 (Bruns–Herzog), cited by BMPSTWW line 517 for §0.5: not read (uncleared book); S01 asks for a locator only.
- No Lean was run (read-only pass; the worker's elaboration failed on a missing Tau Ceti object file). The 19 signatures were checked by hand against the README and the pinned declarations above; the `derivedUnit` body was checked against the pinned names it uses, not elaborated.
- PerfectoidSpacesPartII was read from the board package's design README, a design-stage text whose RA node ids may still be renumbered before its package stage.
- The six suppliers not on main (ResolutionOfSingularitiesCharacteristicZero, DeformationAndDerivedPatchingAlgebra and its Part II, PerfectoidQuotients, DerivedDeRhamCohomology, PerfectoidSpacesPartII) were read at the heads the roadmap index returns, not at heads the brief names.
- §§3.5–3.6 almost-pro-zero bookkeeping, §4.8's André flatness input and §6.2's D′ construction were checked against the RA.0–RA.5 contract statements and ANDRE18B §§4.2–4.4, not recomputed.
- The compatibility of global duality with flat base change to the generic point, used in §7.7 to read τ∘unit at the generic point, is implicit in SchemeAndStackFoundations §2.19's `upperShriek_flat_baseChange` and was not traced to a separate supplier declaration.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "fef1736", "job": "RT-DirectSummandsAndBigCohenMacaulay~2b", "pass": "b"} -->

<!-- tauceti-roadmap-review {"agent": "claude", "head": "fef173649da81183d384ef317d5c9cdae1617236", "job": "RT-DirectSummandsAndBigCohenMacaulay~2b", "model": "fable", "worker": "chris-x9"} -->
