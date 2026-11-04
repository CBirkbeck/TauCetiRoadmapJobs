<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1232#issuecomment-6412538340 -->
Red team round 1 pass b (claude) of 5a6bc6d

Verdict: needs changes

1. **F01** (P2) A statable headline is absent: the finite affine coinvariant theorem (§2.3)

   **Location.** `packages/FunctionFieldArithmeticPartII/Suggested.lean` module docstring (lines 10–16: "Infinite affine coinvariants lack the coherent root-colimit coaction"); README §2.3 lines 4291–4307 ("δ(b)=1⊗b if and only if b=algebraMap(a) for some a∈A … including characteristic dividing n").

   **Claim.** `Suggested.lean` states every headline that is statable at the pins; the docstring names only the infinite coinvariant theorem as not statable and the file states only the two Layer 1 sharp criteria.

   **Witness.** §2.3 is stated on exactly the carriers the file already has (`rootChart`, `rootChartCoaction`) and needs no new definition; the README presents it as the affine input of §2.6 and §2.16 and lists coordinate comparisons as a deliverable (line 3). The statement below was elaborated against the pinned Mathlib (6b7abb3c7686) together with the file; it typechecks with the printed type `∀ (A : Type u_1) [CommRing A] (f : A) (n : ℕ), 0 < n → ∀ (b : rootChart A f n), (rootChartCoaction A f n) b = Algebra.TensorProduct.includeRight b ↔ b ∈ (algebraMap A (rootChart A f n)).range`.

   **Exact repair.** Append to `Suggested.lean` after `rootChartComparison_surjective_iff`:

   ```lean
   /-! ## Layer 2: Relative finite-root geometry -/

   /-- Invariants of the affine root chart (README §2.3): an element of A[t]/(tⁿ−f) is universally
   coinvariant for the root-chart coaction exactly when it is a coefficient, for every commutative A,
   every f and every positive n, including characteristic dividing n. -/
   theorem rootChartCoaction_eq_includeRight_iff (A : Type u) [CommRing A] (f : A) (n : ℕ)
       (hn : 0 < n) (b : rootChart A f n) :
       rootChartCoaction A f n b = Algebra.TensorProduct.includeRight b ↔
         b ∈ (algebraMap A (rootChart A f n)).range := by
     sorry
   ```

   and add to §2.3 the line "The headline signature uses `rootChartCoaction_eq_includeRight_iff`." Tested on the README's own instances: n=1, every b: both sides hold (B≅A). A=𝔽₂, f=0, n=2, b=t: δ(t)=h⊗t and 1⊗t are distinct basis vectors of the free A-module H⊗B, so the left side is false; t is not a coefficient (nonzero nilpotent basis element), so the right side is false. A=ℤ/4, f=0, n=2, b=2: δ(2)=1⊗2 and 2∈A, both true. Zero ring: both sides true.

2. **F02** (P3) Planning slugs and undefined names used as cross-references (Layers 1, 3, 5, 7, 8, 9)

   **Location** (line: name → owner section). 641, 1073, 1907, 3655, 3814, 3828, 3842, 4002 `lower_card` → §1.53; 649 `wrap_iff_lower` → §1.12; 1449 `root-identification-unit` → §1.50; 1450, 1467, 2266 `section-power-in-trivialization` → §1.49; 1545 `wrapping_card` → §1.53; 1637 `affineRootPointGroupoid` → §3.30; 2290–2292 `matrix_reindex`, `coefficientPermutation_sign`, `weight_product` → §§1.101, 1.28, 1.81; 2378 `rootChartEmbedding` → §1.35; 4063 `normalizationChange_chart` → §1.154; 4824 `root-limit-descent-native` → §3.58; 4922 `root-fpqc-descent` → §2.4; 5253, 5267 `transition-native` → §3.11; 6689, 11619 `kummer-coordinate-diagram` → §3.14; 11619 `kummer-classes-native` → §3.413; 11766 `kummer-limit-iso-detection`, `kummer-limit-class-lift` → §§3.80, 3.81; 11923 `frameAtlas` → §4.6; 12346, 12394, 12500 `relativeEvaluationEquivalence` → §5.10; 12370 `incidenceResidualEquivalence` → §5.11; 12461 `rootEffectiveOpen_baseChange` → §5.13; 12478 `rootNormalCrossingChart` → §5.16; 12502 `refinedAbelJacobiFibre` → §5.18; 12532 `rootFullFibre_inertia` → §5.21; 12551 `orderedInertia` → §5.22; 12553 `rootCoarseChart` → §§5.16, 5.19; 13312–13313 `symmetric-power-cohomology`, `alternating-invariants-exterior` → §§7.15, 7.9; 13555 "underlying evaluation-surjective", `sections_surjective` → §8.1; 13660 `weighted-cover`, `weighted-ramification`, `weighted-simply-connected` → §§8.6–8.8; 13719, 13720, 13722 `chart-descent-line`, `family-fibre-presentation`, "underlying high-degree-descent" → §§8.11, 8.5, 8.13; 13737 `relative-projective-quotient` → §8.10; 13899, 13906 `divisorTensorLine` → §9.2.

   **Claim.** Targets are cited by section number; every term is the literature's or defined in the roadmap (the round-4 review's F04 covered only the Layer 10 slugs).

   **Witness.** None of these names is a heading or is introduced by a definition; `rootNormalCrossingChart` occurs once (12478) and §5.16's heading is "Smooth quotient charts for root symmetric powers"; `transition-native` (5253) names no target.

   **Exact repair.** Replace each occurrence by the section citation in the list above, in the form "§5.16 (smooth quotient charts)"; for the Layer 1 snake_case items write "§1.53 (number of killed root columns)", "§1.12 (wrapping and lower coordinates)", "§1.101 (root comparison diagonal reindexing)", "§1.28 (root coefficient permutation sign)", "§1.81 (product of root comparison weights)". Tested: every replacement target exists at the cited heading at this head.

3. **F03** (P3) Process and template residue in the prose

   **Location.** "merged SchemeAndStackFoundations" at lines 4806, 4814, 4836 (twice), 4859, 4861, 4863, 5662, 11293, 11401, 11486; "the stated coordinate construction" at lines 2252, 3937, 12501, 14000; "source-qualified" at lines 13036, 13482.

   **Claim.** No process narrative; prose, not unexpanded planning templates.

   **Witness.** "merged" records the supplier's pull-request state (the same roadmap is cited at 190 other sites without it); at 3937 the sentence reads "construct C_B from the stated coordinate construction root-point action groupoid Q(B)" and at 14000 "from the stated coordinate construction auxiliary-divisors theorem": a template phrase that was never expanded; "the source-qualified tame stack proper pushforward" (13036) qualifies nothing stated in the roadmap.

   **Exact repair.** Delete "merged" at the eleven sites. Write 2252 as "from the coordinates of §§1.49–1.50 and 1.76–1.77", 3937 as "from §3.30's root-point action groupoid Q(B)", 12501 as "from the Picard stacks of §§4.1 and 4.3", 14000 as "from §9.1's auxiliary-divisors theorem"; write 13036 as "Apply §7.27's proper pushforward" and 13482 as "Apply §8.12 with R=∅". Tested: no mathematical content changes.

4. **F04** (P3) Checks that restate the API; §1.57, §1.82 and §1.71 have fewer than three discriminating Checks

   **Location.** §1.57 lines 1142–1143 and §1.82 lines 1574–1575 (identical lists; the first two Checks are the API bullets at 1134–1136 and 1565–1566); §1.71 lines 1340–1342; §1.19 line 489, §1.88 line 1679, §1.89 line 1707, §1.111 line 2074, §1.162 line 2887 ("For arbitrary positive exponent, the normalization scheme morphism is flat, surjective and locally of finite presentation"); §1.121 line 2223 and §1.175 lines 3098–3099 and §1.203 lines 3576–3577 ("Check both whole projection-recovery equalities"); §1.138 line 2524; §3.153 lines 9313–9315; §3.236 line 8712 and §3.275 line 9298 (the single Check is the theorem); §3.290 line 9551; §3.369 lines 10832–10835.

   **Claim.** Each definition has at least three discriminating Checks; a Check is not a restatement.

   **Witness.** §1.57's Check 1, "the embedding map is bijective on the full Hom type and its Hom equivalence preserves the bundled unit label", is the statement of §1.57; only its ℤ/4 Check computes a value, so §1.57 and §1.82 each have one discriminating Check. §1.71's Checks 1–3 are its API bullets 1, 3–4 and 5–7; only Check 4 (ℤ/4→ℤ/2, p=(1,2)) and Check 5 (n=0) compute values.

   **Exact repair.** Replace the restating Checks by instances with values: for §1.57 and §1.82, "Over 𝔽₃ at f=1, n=2 the chart points t↦1 and t↦2 are connected by exactly one arrow, labelled 2: 2·1=2 and 2²=1; its framed image has label 2, not 1" and "Over ℤ/4 at f=0, n=2 the points with roots 0 and 2 have no arrow, since 2=w·0 has no solution"; for §1.71, "For φ=id the map fixes T and the coefficient 3 of ℤ/4" and "For ℤ/4→𝔽₂ at n=2, u=3, y=1 the target is 𝔽₂[T]/((T−1)²), where T−1≠0 and (T−1)²=0"; for §3.236 and §3.275, "For ℤ→ℤ/2 and i=1, ε_B(U_φ(h_1))=1=φ(ε_A(h_1)); for ℤ→ℤ/1 both composites send 1 to 0"; for the "arbitrary positive exponent" Checks of §§1.19, 1.88, 1.89, 1.111, 1.162 delete the Check (the remaining Checks of those targets compute values). Tested: the values above were recomputed (2·1=2, 2²=4=1 in 𝔽₃; (T−1)²=T²−2T+1=T²+1=0 in 𝔽₂[T]/(T²−1)).

5. **F05** (P3) Citations without a manifest line, one into a text that does not contain the lemma, and anchor lines reused for different statements

   **Location and witness.**
   - §2.4 line 4327 "QCoh supplier is Stacks023T" and §2.5 line 4360 "(The Stacks Project, Proposition 35.5.2 (023T) and Lemma 35.7.6 (05B2) …)": no source id or line; both lemmas are in the cached Descent extraction: STACKS-AFFINE-DESCENT line 807 (023T) and line 1011 (05B2).
   - §3.12 line 4848 "The Stacks Project, Lemma 59.28.5 (tag 040Q)": in STACKS-KUMMER at line 1505.
   - §3.13 line 4867 "Lemmas 32.2.2 (tag 01YX)": in Stacks-finite-root-projections-codex-7e92bd at line 51 (the sentence at 4871 gives the ids of the other three lemmas only).
   - §7.2 line 12899 (ETINGOF), §7.5 line 12958 and §7.9 line 13064 (CONRAD-EXT), §7.3 line 12916 (NOOHI), §7.6 line 12974 (MILNE-CFT), §8.11 line 13709 and §8.12 line 13727 (ACV01): no line; the passages are ETINGOF line 1493 (Theorem 3.8), CONRAD-EXT line 497 (display (4.1)), NOOHI line 700 (Theorem 7.11), MILNE-CFT lines 3357 (Proposition 1.30) and 3368 (Corollary 1.31), ACV01 lines 1594 and 1615.
   - §10.8 line 14281 and §10.26 line 14623 attribute "Lemma 95.14.2 (04UJ)" to STACKS-TORSORS line 149: that extraction is the Cohomology-on-Sites chapter and contains no tag 04UJ (zero hits), so the cited text does not contain the lemma.
   - Anchor lines reused for other statements: MILNE-LEC line 3104 (Theorem 11.4) is cited in §§10.27–10.29 for "§9 property (c) p.64, Remark 9.3 p.65, Example 9.5 p.66; Proposition 11.1 p.77", which are at lines 2631 (Remark 9.3) and 3058 (Proposition 11.1); STACKS-NORMS line 1496 (section heading) is cited in §§10.8, 10.9, 10.21, 10.31 for Lemmas 31.18.1/2/3/6, which are at lines 1513, 1536, 1553, 1591; YZ19 line 7333 (start of §A.2) is cited in §§4.5, 4.7, 5.1, 5.5, 5.8, 5.10, 5.12, 5.13, 5.15, 5.17, 5.20, 5.23, 7.3, 7.11, 9.5, 9.7 for "Definition A.1, p. 514" and other items of §A.1 (Definition A.1 is at line 6918, A.1.4 at 7142, A.1.5 at 7184); AV99 line 234 is Lemma 2.3.4 but is cited as "Lemma 2.2.3, p. 4" (§§7.11, 7.14) and "Proof of Lemma 2.3.3, p. 5" (§7.2).
   - The References entry for ETINGOF (line 14766) reads "§3.1, Theorem 3.1, pp.33–34" while §7.2 cites "Proof of Theorem 3.8, p. 37".

   **Claim.** Every locator is `<id> line N` into a recorded text that contains the statement.

   **Exact repair.** Write the citations as `STACKS-AFFINE-DESCENT line 807`, `STACKS-AFFINE-DESCENT line 1011`, `STACKS-KUMMER line 1505`, `Stacks-finite-root-projections-codex-7e92bd line 51`, `ETINGOF line 1493`, `CONRAD-EXT line 497`, `NOOHI line 700`, `MILNE-CFT line 3357` and `line 3368`, `ACV01 line 1594`/`line 1615`, `MILNE-LEC line 2631`/`line 3058`/`line 3104`, `STACKS-NORMS line 1513`/`1536`/`1553`/`1591`, `YZ19 line 6918` for Definition A.1 and the §A.1 lines listed, `AV99 line 234 — Lemma 2.3.4` (and the correct lines for Lemmas 2.2.3 and 2.3.3 once read); for 04UJ either add a manifest entry for the Algebraic Stacks chapter and cite its line, or cite SchemeAndStackFoundations §§1.15 and 2.3 (torsor gluing) instead; correct the ETINGOF reference entry to "§3.3, Theorem 3.8, p. 37". Tested: all listed lines were read and carry the named statements.

6. **F06** (P3) `TauCeti.RootsOfUnityGroup` is cited as a declaration

   **Location.** README line 43: "Use `TauCeti.RootsOfUnityGroup` in `TauCeti/Algebra/AlgebraicGroup/RootsOfUnity/` for the diagonalizable character and functor of points."

   **Claim.** The backticked name is a declaration of the pinned Tau Ceti.

   **Witness.** At the pin (a91d3aafa8cd) `RootsOfUnityGroup` is a namespace (`TauCeti/Algebra/AlgebraicGroup/RootsOfUnity/Basic.lean` line 56); the carrier is `TauCeti.RootsOfUnityGroup.groupScheme` (`…/RootsOfUnity/Scheme.lean` line 82), and the points calculations are `TauCeti.RootsOfUnityGroup.pointsMulEquiv` (Basic.lean) and `TauCeti.RootsOfUnityGroup.schemePointsMulEquiv` (Scheme.lean line 101).

   **Exact repair.** "Use `TauCeti.RootsOfUnityGroup.groupScheme`, `TauCeti.RootsOfUnityGroup.pointsMulEquiv` and `TauCeti.RootsOfUnityGroup.schemePointsMulEquiv` in `TauCeti/Algebra/AlgebraicGroup/RootsOfUnity/` …". Tested: the three names exist at the pin.

No pass-a report exists on the pull request (the comments on #1232 are the four reviews and three repair notes); the "pass-a findings" section below therefore says so and confirms the round-4 review's findings instead, which are the only prior findings at this head. All line numbers refer to `packages/FunctionFieldArithmeticPartII/README.md` unless a file is named. Sources are cited as `<id> line N` into the worker's cached extractions.

## Pass-a findings

No pass-a report exists on #1232. The only prior findings at this head are the round-4 review's F01–F07 (all P3); each was re-verified in this pass:

- F01 (seven Layer 7 `*Needs:*` lines cite the unnumbered Layer 8 input: lines 12918, 12934, 13020, 13120, 13200, 13235, 13304; Layer 8's Dependencies at 13753 consume Layer 7): confirmed; none of the seven routes uses projective-space simple connectivity.
- F02 (Layer 1 targets need Layer 3 and Layer 2 targets: §1.35 line 789 → §§3.30, 3.33; §1.58 line 1162 and §1.87 line 1659 → §3.31; §1.106 line 2004 → §3.49; §1.225 line 3966 → §3.30; §1.240 line 4191 → §2.4): confirmed.
- F03 (camel-case names split into words without backticks): confirmed at lines 4111, 4456, 4490, 4869, 4907, 6334, 11490, 12408, 12542, 12664, 12698, 12769, 12786, 12821, 12838, 12885, 12901, 12960, 12976, 13066, 13082, 13521, 13574, 13895, 14218, 14234, 14283, 14656.
- F04 (Layer 10 slugs and ASCII residue; §3.427's "lim_n μ_n=Ẑ(1)" at 11744): confirmed (slugs at 14371, 14534, 14566, 14571).
- F05 (truncated sentence at 477, 871, 1246, 1259, 1665, 2023, 2036, 2049, 2062, 2405, 2418, 2431, 2444, 2693; dangling clause at 12938): confirmed.
- F06 (§3.86 Checks at 6160–6162): confirmed; the second Check holds for every A-algebra map out of B_3 and the third restates the directed-system identity.
- F07 (§7.29 line 13414 over an algebraic closure): confirmed; DeligneWeightsAndPurity §8.24 at its open head constructs `dmStack_etaleCohomology` over 𝔽_q (its line 3274) and no clause over k̄.

The round-2 finding marked not actionable in this package (architecture) is not re-raised.

## Verified sound

**Head and policy.** Checkout at 5a6bc6d55e09a242a28720a8407f348760bf405e, the pull request's current head. `git diff --stat origin/main...HEAD` touches only `packages/FunctionFieldArithmeticPartII/` (README.md, Suggested.lean, design/plan.json, metadata.toml, sources.toml, four reports). No `lemma`, `set_option`, `#print`, `#eval`, `#synth`, `True` placeholder, pull-request number or job id in README.md or Suggested.lean (the "Lemma" hits are source citations). `metadata.toml` is `topic = "math.NT"`. Every numbered target has a locator line.

**Dependency check** (run from the board checkout, `--movable`): `moved: FunctionFieldArithmeticPartII moved in the merge order from #16 to #169, right after its last supplier FunctionFieldArithmetic (EtaleCohomologyFoundations, AlgebraicModuliForArithmeticGeometry, InverseGaloisAndArithmeticFundamentalGroups, DeligneWeightsAndPurity also came after it); checked as moved (the worker moves it there when it submits)` and `depcheck: 56 roadmaps, 643 edges, 0 problem(s)`. No UPWARD or CYCLE line.

**Declared gaps.** The seven gaps in `design/plan.json` (`finite-diagonalizable-coarse`, `invertible-section-coordinates`, `completed-lattice-root-dictionary`, `quadratic-root-residue-character`, `coherent-site-universe-lifts`, `invertible-sheaf-universe-lifts`, `normal-proper-hyperplane-covers`) appear with identical `needs` sentences under "Exact supplier contracts" in the supplier's subsection (lines 51, 53, 65, 67, 79, 85, 91); each names a supplier earlier in the order or on main; each `needs` is a single precise statement with its hypotheses (the hyperplane gap restates SGA1 X 2.10–2.11 with the normality and dim g(X)≥2 hypotheses, read at SGA1 lines 8303 and 8308). None asks for something the pins already provide.

**Suggested.lean** (5 declarations read; elaborated once with `#check @` for each against the pinned Mathlib build, no `set_option`): `rootChart`, `rootChartCoaction` (its tactic body compiles), `rootChartComparison`, `rootChartComparison_injective_iff`, `rootChartComparison_surjective_iff`. Elaborated types agree with README §§1.7, 1.26, 1.184, 1.185: both criteria carry `(hn : 0 < n)` explicitly, `A : Type u` with `[CommRing A]`, no section variable lost. Truth as typed: for n≥1 the comparison sends t^i⊗t^j to h^i⊗t^{i+j} with coefficient f exactly when i+j≥n; for n≥2 the kernel is {Σc_{ij}t^i⊗t^j : c_{ij}=0 for i+j<n, f·c_{ij}=0 for i+j≥n} and the image misses h⊗1 unless f is a unit; for n=1 both algebras are A⊗A and the map is the identity. Both iffs hold on the zero ring (0 is a unit, multiplication by 0 is injective on a singleton). No padding: neither criterion follows in one tactic, restates a definition or mirrors a Check. Imports: the single line `import Mathlib`. The headline list in the docstring was checked against the README's end theorems (§§3.398, 3.413, 7.23, 8.13, 9.5, 10.20, 10.28) and each named carrier is indeed absent at the pins (no root stack, no lisse category on stacks, no torsor towers); the one statable omission is R01.

**Targets read.** All 816 numbered targets, the unnumbered Layer 8 input, Conventions, Exact supplier contracts, Examples and Dependencies of every layer, Downstream consumers, Worked examples and References (14,784 lines, read in full).

**Pinned names.** All 367 backticked names in the README were swept against the pinned Mathlib (6b7abb3c7686), Tau Ceti (a91d3aafa8cd), Batteries and core; every name resolves except the roadmap-owned ones (`rootChart*`, `rootStack`, `rootGerbe`, `GerbeLimitFamily`, `limitStackDescent`, `neutralizationEquivalence`, `nonemptyAffineLimitGerbe`, `dmStack_etaleCohomology*`) and R06. In particular `DirectLimit.Algebra.of/of_f/lift/lift_of/hom_ext`, `DirectLimit.Ring.lift/hom_ext`, `DirectLimit.exists_eq_mk` (`Mathlib/Order/DirectedInverseSystem.lean:130`, exact), `DirectLimit.mk_injective`, `finite_of_finite_type_of_isJacobsonRing` (`Mathlib/RingTheory/Jacobson/Ring.lean:676`, exact), `AdjoinRoot.finitePresentation`, `finCycle`, `Finset.card_product_filter_lt`, `Nat.choose_two_right`, `AlgebraicGeometry.Scheme.fppfTopology`/`fpqcTopology`, `CategoryTheory.Pseudofunctor.IsStack`, the seven `exteriorPower.*` names, `PiTensorProduct.reindexRepresentation`, `groupCohomology.natCard_nsmul_eq_zero`, the two `AddCircle.*` names, `TauCeti.AlgebraicGeometry.InvertibleSheaf.*` and `TauCeti.SheafOfModules.freePUnitIsoUnit` exist with the stated files; `Mathlib/Algebra/Colimit/DirectLimit.lean` carries `instance : Algebra R (DirectLimit G f)` and the `→ₐ[R]` lift, as §3.64 requires.

**Sibling citations** (resolved on main or at the open heads, not from memory): SchemeAndStackFoundations §§0.1, 0.9, 1.1, 1.15, 1.16, 1.18–1.23, 2.3, 2.10, 2.11, 3.3–3.7, 4.13 exist on main with the cited content; `rootStack` (its line 2972), `.transition` (2976), `rootStack.test_fibre_nonreduced` (2984), *Torsor.hom_isIso* (README-only name, its line 288 convention), `NonabelianH1` with `map`/`map_id`/`map_comp` (3334–3344) and `affine_transition_limits` (850) exist. AlgebraicVectorBundles L0A–L0C (lines 215, 228, 254). ModularCurves §0F states the finite-locally-free Weil restriction (412–420). AlgebraicCurves Layer 12 (1085), JacobianChallenge Layers A–D (111, 135, 143, 218), ProfiniteCohomology Layer 10 (1549), RepresentationTheory/SchurWeyl Layer 8 (352). EtaleCohomologyFoundations §§F.0.2, F.0.A1, F.0.A2, F.2.1, F.2.6, F.2.7, F.3a, F.4.1–F.4.6, 0.11, F.5, F.6, F.8 (all `##` headings on main). FunctionFieldArithmetic §§0.1, 2.1, 4.1, 4.2, 4.5–4.10 at its open head. AlgebraicModuliForArithmeticGeometry §§4.3, 4.4, 4.23 with `neutralizationEquivalence`, `rootGerbe`, `GerbeLimitFamily`, `limitStackDescent`, `nonemptyAffineLimitGerbe` at its open head. InverseGaloisAndArithmeticFundamentalGroups §IG.5.7 contains the bold target "Finite-cover criteria for full monodromy image" (its line 6349) with exactly the dense-open-of-a-connected-normal-locally-noetherian-DM-stack clause the README consumes. DeligneWeightsAndPurity §8.24 with the five `dmStack_etaleCohomology*` names at its open head (lines 3274–3294). 52 section citations and 18 declaration names checked; two owners for one object were not found (the root stack, its charts and branch fibre are consumed from SchemeAndStackFoundations §1.21, root gerbes from AlgebraicModuliForArithmeticGeometry §4.3 with invertible exponent, Weil restriction from ModularCurves §0F; the infinite root stack, coframe towers, root Picard stack and character sheaf are stated nowhere else in the readable siblings).

**Locators verified** (77, every one read at the cited line): TV17 631, 650, 668, 707, 714, 733, 738, 778 (Prop. 3.4, 3.5, §3.1, Lemma 3.7, Def. 3.8, Remark 3.9, Prop. 3.10, Cor. 3.13); STACKS-KUMMER 1401, 1442, 1455, 1505, 4675 (03PK, Lemma 28.3 with its proof's B=A[T]/(Tⁿ−a), 040Q, 0DV4); FramedRoot 7989 and 8013 (Example 4.9.22, Exercise 4.9.23; the printed page 158 ends at line 7963, so pp.159–160 is right); NormalizationThree 1383, 1387, 1410 (01JO, 01JP, 01JQ, p.31); FramedFppfCover 837 (021M); AGV08 2404, 2431 (B.1, B.2); AffineRootPointGroupoid 966 (022Y); AOV08 906, 910, 924, 454 (Def. 3.1, Thm 3.2, Cor. 3.3, Prop. 2.7); STACKS-FLAT-COLIMIT 4437, 11925, 21359 (090N, 00NQ, 07NF); STACKS-AFFINE-DESCENT 4181 (0245); STACKS-DESCENT-PROPERTIES 2626 (02KY); STACKS-STACK-REGULARITY 625, 651, 664; STACKIFICATION 825 (02ZO/02ZP); Stacks-finite-root-projections 46, 51; YZ19 5656, 5736, 6918, 6943, 6968, 7015, 7095, 7142, 7184, 7235, 7248 (Lemma A.5 with ϖ_x⁻¹ ↦ O_X(x)^♮ as the README's sign convention says), 7340, 7368, 7410, 7450, 7507 (Lemma A.9 with the bound d≥ρ+max{2g−1,1}), 7644, 7677, 7758, 7806, 7850, 7880, 7896; StacksPic 753 (0372); StacksRes 729 (05Y8); STACKS-DIV 207 (0B9C); STACKS-PROP 3754 (0CL4); STACKS-QF 2140 (06PT); STACKS-RES 1772 (06MC); STACKS 3249, 3290, 3334, 2524 (0BSE, 0H2W, 0EYG, 0BMB); ETINGOF 1493; CONRAD-EXT 497; NOOHI 288, 700; MILNE-CFT 3357, 3368; ACV01 1594, 1615; LO-P 169, 287, 327, 354; SGA1 8303, 8308, 8606; StacksVanishing 2454 (0E3A); StacksBaseChange 2815 (07VJ); STACKS-TORSORS 149 (03AG); STACKS-NORMS 1496, 1513, 1536, 1553, 1591 (0BCX, 0BUT, 0BCY, 0BCZ, 0BD2); MILNE-LEC 3104, 3058, 2631. B24 is settled uncertified and cited by locator alone.

**Adversarial pass** (one row per statement checked; values computed on each side):

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `rootChartComparison_injective_iff` | n=1; n=2,f=2 over ℤ; n=2,f=0 over a field; n=2,f=2 over ℤ/4; zero ring | n=1: Θ=id, both sides true. ℤ: kernel = {c : 2c=0}=0 and ·2 injective. field f=0: t⊗t↦0, kernel ≠0 and ·0 not injective. ℤ/4: 2(t⊗t)↦2·2(h⊗1)=0, kernel≠0 and 2·2=0. zero ring: both true | true | none |
| `rootChartComparison_surjective_iff` | n=1; ℤ,f=2; 𝔽₂,f=1; ℤ/8,f=4; zero ring | h⊗1 has preimage iff 1∈fA: ℤ: no, 2 not a unit; 𝔽₂: 1 unit, image all; ℤ/8: cokernel A/(4)≅ℤ/4; zero ring: 0 unit | true | none |
| `rootChartCoaction` t ↦ h⊗t | n=3 over 𝔽₇, ζ=2; n=2, ζ=−1 | evaluation at ζ=2 gives 2t, at ζ⁻¹=4 gives 4t; −1 gives −t | orientation as §1.7 | none |
| Conventions line 17 factorial relation | i=0,2; f=2 | u_0¹=2; u_2⁶=2 and T³≠2 in ℤ[T]/(T⁶−2) (coordinates (0,0,0,1,0,0) vs (2,0,…)) | true | none |
| Conventions line 19 sign witness | n=2, β′=−β | β′(t)=−β(t); zero-section automorphism label −1 | consistent with §§1.75, 3.12 | none |
| Conventions line 27 bound | g=0,ρ=1,d=2; g=1,ρ=1,d=2 | B=2, n=3, a=2, weights (2,2,1); B=2, n=2, a=1, ranks (1,2,1) | matches §§8.4, 8.5, Layer 8 Examples | none |
| Conventions line 29 norm sign | c+dt, a=0 | det((c,ad),(d,c))=c²−ad², =c² at a=0 | matches §10.9 | none |
| §1.4 framed roots | ℤ/4,f=3,n=2,(u,y)=(3,1); ℤ/9,f=0,n=2 | 3·1=3; no unit squares to 3 (1²=3²=1); 1·3²=9=0; arrow 3→0 needs 0=w·3 with w a unit, impossible | Checks true | none |
| §1.20 normalization arrows | ℤ/9,(1,3)→(1,6) label −1; ℤ/7,f=1,(1,1)→(2,2) label 2 | 6=−1·3, 1·1=1; 2=2·1, 2·2²=8=1, 2⁻¹=4 | true | none |
| §1.26 Checks | ℤ/8,f=4,n=2; 𝔽₂,f=1,n=2 | image A³⊕4A, cokernel ℤ/4 with 2z≠0,4z=0; bijective, (x−1)²=x²−1=0 | true | none |
| §1.28 sign | n=2; n=3 | (−1)^{1·1}=−1; rows 0,1,2 are id and two 3-cycles, product +1; (−1)^E would give −1 | true | none |
| §1.53, §1.81, §1.100, §1.124, §1.228 | n=3; n=2,f=2; n=2; n=3 | |W|=3; product of weights 2; dim 4; det=−f at n=2, f³ at n=3; range dim 6=9−3 | true | none |
| §2.13 atlas V_n(f) | λ·(z,q)=(λz,λⁿq); ℂ,f=1,n=2; 𝔽_p[x],f=x,n=p | zⁿ=qf preserved; V_2(1)=𝔾_m connected vs W_2(1) two points; atlas Spec 𝔽_p[z,q,q⁻¹] regular | true | none |
| §2.17 regularity | X=𝔸¹,D=(x²),n=2 | z²=qx² is nodal at x=z=0 | hypothesis D regular necessary | none |
| §2.18 DM locus | Spec ℤ,s=2,n=3; char p,n=p | 3 invertible on V(2) ⇒ DM; (1+ε)^p=1 detects nonreduced inertia | true | none |
| §3.6 coherent scalars | ℤ, σ_1=−1, others 1 | (−1)²=1; σ_2³=1≠−1=σ_1 | incoherence witnessed | none |
| §3.14 Kummer coordinates | ℝ; 𝔽_p(t) | compatible families: trivial and ([−1]_n)_n (trivial at odd n); [t]_p nontrivial | true | none |
| §3.24, §3.151, §3.308 | ℂ, σ_i=exp(2πi/d_i) | ζ₆³=−1=ζ₂; conjugation gives (1−√3i)/2; (g·g)·x at u_2 is ζ₆²=(−1+√3i)/2 | true | none |
| §3.34 automorphisms over ℝ | lim μ_n(ℝ) | need ζ∈μ₄(ℝ)={±1} with ζ²=−1: none, so the limit is trivial | true | none |
| §3.54 power functor | ℤ/4,f=0, 4→2 | label 3 ↦ 3²=1 | not injective, as stated | none |
| §3.63, §3.65, §3.284 | 2!→3!; 2!→3!→4!; d_1=2, d_2=6 | t_2↦t_6³; t_2↦t_24¹²; E(v_2)=u_1, T⁻¹(e_[1/2]⊗u_2)=e_[1/2]⊗v_6 | true | none |
| §3.309 Check | ℤ/2, v=u_1−1 | (e−1)²=e²+1=0; Δ(e−1)=e⊗e−1⊗1=(e−1)⊗(e−1)+(e−1)⊗1+1⊗(e−1) | true | none |
| §3.330 characters | ℤ/4,f=2,i=2,k=2 | η(u_2²)=e_[2/6]⊗u_2²=e_[1/3]⊗u_2² | true | none |
| §3.375 character of v_n | n=2; n=1 | (6/2)/6=1/2; e_[1]=e_[0] | true | none |
| §3.13 / §3.144 roots of 2 | closed point of Spec ℚ[T] with residue ℚ(√2) | contains √2, no cube root of 2 (degree 3>2) | fppf trivialization excluded | none |
| §4.4, §4.6, §4.11 square action | 𝔽₅, L=O, R rational | (f,v)=(1,2): 4≠1 not an arrow; (4,2) arrow; u=2: γ=1↦4, 4⁻¹·2²=1; (γ,a)=(1,1)↦(4,2) with 4⁻¹·4=1 | true | none |
| §4.12 inertia | one split branch; 𝔽₅[ε]/ε², α=ε | u↦(u²,u) gives 𝔾_m; u=−1 sends ε to −ε≠ε | true | none |
| §5.11, §5.22, §5.23 | d=2,I={x,y}; m=3 block; D=x+y | intersection reduced point x+y; ((ζη)⁻¹,ζ,η) swapped 0↔1 gives ((ζη)⁻¹,η) in omitted-zero coordinates; 2!/(1!1!)=2 fibre points | true | none |
| §6.4 kernel size | R with r closed points | ∏μ₂(κ_x) has 2^r elements, not 2^{deg R} | true | none |
| §6.8 Check | 𝔽₇, v=2 | ū=4, v⁻¹=4, 4²=16=2=4⁻¹ | gluing equation holds with v⁻¹, fails with v | none |
| §6.9, §6.11 | ℙ¹/𝔽₃, R one degree-two point; ℙ¹/𝔽₅, R={0} | 𝔽₉^×/squares and μ₂(𝔽₉) both of order 2; A_R≅𝔽₅^×≅C₄ via v↦(v⁻²,v), (4,2) of order 4; two rational branches over 𝔽₃: c=1 gives 4 elements, c=2 none | true | none |
| §6.12 sign | a_x=π_x⁻¹, deg x=2 | E=−x, O_X(x), degree 2 | agrees with YZ19 line 7250 and FunctionFieldArithmetic §0.1 | none |
| §7.1 Koszul action | K^{⊗2}, 2 invertible; ℤ/2 | transposition acts by −1, invariants 0; sign trivial, invariants the whole line | true | none |
| §7.9 | d=2, rank 2; rank 1, d=2 | invariants ⟨e₁⊗e₂−e₂⊗e₁⟩ of rank C(2,2)=1; zero | true | none |
| §7.11, §7.14, §7.18 | ℙ¹, R={0,∞}, quadratic χ | stalks of 𝓜_2 at 2·0, 0+∞ vanish; sign part of H*(ℙ¹) is 0 = H*(ℙ¹,j_*L) | true | none |
| §7.26 Checks | 𝔽₅, E=ℚ₃, Frob↦4; J=[[1,1],[0,1]] | 4≡1 (mod 3), 4³=64≡1 (mod 9), order 3; infinite image in ℤ₃^×; Jⁿ=[[1,n],[0,1]], one invariant line, commutant dimension 2 | true | none |
| Layer 8 input | r=1 | 2g(Y)−2=−2m ⇒ g=1−m ⇒ m=1 | true | none |
| §8.1, §8.5, §8.12 | d≥B; g=1,ρ=1,d=2; g=0,ρ=2 | deg L(−R)=d−ρ≥2g−1>2g−2 so H¹=0; ranks (1,2,1); threshold 2+max(−1,1)=3 | true | none |
| §8.6–8.8 weighted quotient | (a,ρ)=(1,1); (2,1) | cover P¹→W(2,1) of rank 2 ramified at x=0; rank 4 | true | none |
| §9.6 | away degree-two P, d=−5, B=3 | 4[P]: −5+8=3≥3; 3[P]: −5+6=1<3 | true | none |
| §9 Examples, §10.5, §10.7, §10.11 | D=2x, deg x=2; d=1,2,3 | tensor line eigenvalue a², dual a⁻²; Tr(T)=a (a, −1 at d=2 with a=−1, 2 not 8 at d=3) | true | none |
| §10.3 | r=id_ℤ | (1,±1) members, (−1,1) not (−1≠1²) | true | none |
| §10.31 and Worked example 8 | ℙ¹→ℙ¹, t↦t², 𝔽₅ | deg ν*O(m)=2m so O(±1) do not descend; Nm O(1)=O(1); global root units 8, norm image 4, (1,1,−1) outside | true | none |
| Worked examples 3–5 | 720/5=144, 720/120=6, 120/5=24; n=3,a=2 over ℚ; ℝ | 6·24=144; arrow class [1/2], coframe class [2], ratio 4 not a cube; two real classes with trivial automorphisms | true | none |

**Checks tested.** 61 Checks and worked examples recomputed (the rows above); all agree with the formulas of their sections and with each other (the sign convention π_x⁻¹↦O_X(x) is used identically in Conventions line 29, §§6.3, 6.6, 6.7, 6.12, 10.13 and YZ19 Lemma A.5).

## Not verifiable

- B24 (uncertified, settled): the locators p.133 and pp.135–136 cited in §§3.2, 3.14, 3.62, 3.78, 3.80, 3.81, 3.97, 3.120, 3.121, 3.404, 3.409, 3.413, 3.418, 3.427, 3.428 and Worked examples were not read.
- AV99 "Lemma 2.2.3, p. 4" (§§7.11, 7.14): only line 234 (Lemma 2.3.4) was read; the page of Lemma 2.2.3 was not confirmed.
- Ownership against open pull requests other than those the brief lists with files, and the three open-PR suppliers read through `roadmaps show` (AlgebraicModuliForArithmeticGeometry, InverseGaloisAndArithmeticFundamentalGroups, DeligneWeightsAndPurity), was not checked beyond those.
- The deep targets (§3.13, §3.398, §7.7, §7.29, §8.12, §10.28) were checked for hypotheses, inputs and degenerate cases, not re-proved.

## Source issues

- **Misprint** in YZ19 at Lemma A.5, proof, printed p.518 (YZ19 line 7281): the proof writes the idele coefficient of a framed line as the local trivialization composed after the inverse of the generic one; with that composite the completed lattice of O_X(x) corresponds to the uniformizer, contradicting the lemma's normalization ϖ_x⁻¹↦O_X(x)^♮; it should be the generic trivialization composed after the inverse local one, as the README's §6.5 uses; affects the proof.
- **Misprint** in YZ19 at Proposition A.11, proof, printed p.523 (YZ19 lines 7732–7736 and 7744): the proof pulls μ_{d₁,d₂} back along the single Abel–Jacobi map of degree d₁+d₂, though both sides live on the product of two Picard components, and writes the symmetric-power sheaf where the Picard-descended sheaf is meant in (A.9); it should pull back along the product of the two Abel–Jacobi maps and read L^Pic; affects the proof.
- **Gap** in YZ19 at display (A.11), printed p.525 (YZ19 line 7872): the display is called an exact sequence of Picard stacks without a definition of exactness for Picard stacks; on isomorphism classes exactness fails at the first Picard group of the cover (for ℙ¹→ℙ¹, t↦t², the invariant line O(1) is killed by 1−σ but is not a pullback, degrees being even); it should be stated as the two based fibre sequences with their connecting obstructions, as the README's §§10.26–10.28 do; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5a6bc6d", "job": "RT-FunctionFieldArithmeticPartII~1b", "model": "fable", "worker": "fable-rt219"} -->
