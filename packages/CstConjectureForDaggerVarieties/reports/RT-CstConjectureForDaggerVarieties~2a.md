<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1517#issuecomment-6452697257 -->
Red team round 2 pass a (codex) of 5687eb6

Verdict: needs_changes

1. **F01** (P1) The filtered-complex contract truncates only one side

   **Location:** `packages/CstConjectureForDaggerVarieties/README.md:114`, “τ_≤i F^(r+1)RΓ_dR(X/B_dR⁺)=tFʳRΓ_dR(X/B_dR⁺)”; also `design/plan.json`, gap `dagger-analytic-complexes`.

   **Claim:** This is an identity of derived complexes for i≤r.

   **Witness:** Take X=P¹_C and i=r=0. The left side has H²=0 by truncation. The right side has H²=tH²_dR(P¹/B_dR⁺)≅tB_dR⁺≠0. CN25 line 2231 has the same omitted truncation.

   **Exact repair text:** “For 0≤i≤r, multiplication by t induces an isomorphism τ_≤i FʳRΓ_dR(X/B_dR⁺) → τ_≤i F^(r+1)RΓ_dR(X/B_dR⁺), with image notation τ_≤i F^(r+1)RΓ_dR ≅ τ_≤i(tFʳRΓ_dR).” Replace the identity in both copies of the contract, and identify the missing right-hand truncation in the source locator note.

   **Repair test:** For P¹_C and i=r=0, H⁰ is B_dR⁺→tB_dR⁺, x↦tx, an isomorphism onto its image; both truncated sides have H²=0. The repaired statement still gives the degree-i t-shift consumed by §1.4.

2. **F02** (P2) The new BC limit gap asks again for the supplied Artinian theorem

   **Location:** `packages/CstConjectureForDaggerVarieties/README.md:94`, “every decreasing sequence of sub-BC objects of a finite BC object is stationary”; also `design/plan.json`, gap `bc-countable-inverse-limits`.

   **Claim:** Stationarity is missing from VectorBundlesAndIsocrystals and must be added with inverse-limit vanishing.

   **Witness:** `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:1699`, VB3 “Artinian property of BC”, already states stabilization of every descending chain of BC subobjects, under the same fixed-C/countability conventions.

   **Exact repair text:** “VectorBundlesAndIsocrystals VB3, Artinian property of BC, supplies stationarity of descending chains. What VectorBundlesAndIsocrystals must provide (gap:bc-countable-inverse-limits): For every countable inverse system of finite BC objects with BC transition maps, prove R¹lim=0 in the natural VS realization and after realization in the left heart, compatibly with those realization functors; use the supplied Artinian property to establish Mittag–Leffler.” Keep only that missing realization/limit statement in the plan's needs sentence, and cite the existing target by name.

   **Repair test:** For the constant Q_p tower, the supplied Artinian property is sufficient for stationarity; the remaining contract computes ker(1−shift)=Q_p and coker(1−shift)=0. Nothing requires a second proof of the Artinian theorem. This duplication was introduced when b.F01 was split.

3. **F03** (P3) The new splitting Check uses an undefined scalar extension from C

   **Location:** `packages/CstConjectureForDaggerVarieties/README.md:622`, “E₀=O(D)⊗̂B_dR⁺”.

   **Claim:** This is the degree-zero B_dR⁺ deformation cochain module for the dagger disc D/C, on which evaluation at its origin gives the required retraction.

   **Witness:** README:146 excludes a canonical embedding C→B_dR⁺; README:350 permits the scalar-extension presentation only over K. Taking the displayed tensor over Q_p instead gives constants C⊗̂_Q_p B_dR⁺, rather than B_dR⁺.

   **Exact repair text:** “Choose the standard dagger disc D₀ over Q_p and put D=D₀×C. Use the scalar-extension cochain model E₀=O(D₀)⊗̂_Q_p B_dR⁺. Then H₀=B_dR⁺, Q₀=E₀/B_dR⁺, and evaluation at T=0 on O(D₀), extended B_dR⁺-linearly, is a continuous retraction whose kernel maps homeomorphically onto Q₀. For the point, E₀=H₀=B_dR⁺ and Q₀=0.”

   **Repair test:** In the chosen model, 1⊗b maps to b and T⊗b maps to 0. The split constants are exactly B_dR⁺, and the kernel consists of the zero-constant-term cochains. This removes the ill-specified tensor in the a.F01 repair without asserting a C-linear lift.

4. **F04** (P2) The standard-lattice Check omits the nonnegative Newton-slope hypothesis

   **Location:** `packages/CstConjectureForDaggerVarieties/README.md:234`, “Such a pair is acyclic only when every Newton slope is 0”.

   **Claim:** For any pair in §0.4 with L=M⊗B_dR⁺, acyclicity forces Newton slopes zero.

   **Witness:** Let M=Fⁿʳe, φ(e)=p⁻¹e, N=0 and L=B_dR⁺e. Its Newton slope is −1, its bundle is O(1), and H¹(O(1))=0. Thus it is acyclic with nonzero Newton slope.

   **Exact repair text:** “For L=M⊗B_dR⁺, acyclicity means that every Newton slope is ≤0. Under the bounded refinement's additional hypothesis that the Newton slopes lie in [0,r], this forces every slope to be 0 and permits L′=L. As a negative control outside that hypothesis, φ(e)=p⁻¹e and L=B_dR⁺e give the acyclic bundle O(1).”

   **Repair test:** The slope −1 line satisfies −1≤0 and remains acyclic; the slope +1 line fails the inequality and gives O(−1); slope 0 gives O. The bounded-refinement assertion is preserved.

5. **F05** (P1) The proper-times-Stein proof cites a limit theorem that is not supplied

   **Location:** `packages/CstConjectureForDaggerVarieties/README.md:851,857`, “the analytic Stein limit theorem for S_n”; “§1.5, Stein limit computation”.

   **Claim:** §1.5 or the named contracts provide R¹lim vanishing for the Stein factor's pro-étale groups.

   **Witness:** §1.5:425–437 contains only a fixed-space diagram. README:120 supplies R¹lim X_n and R¹lim F̄_n, not R¹lim(Ω^(j−1)(S_n)/ker d). On discs F̄_n¹¹=0 while this omitted quotient is O(S_n)/C≠0.

   **Exact repair text:** Add before the product argument: “For every strict dagger-affinoid exhaustion S=⋃S_n of a smooth dagger Stein space and every j≥0, prove R¹lim_n(Ω^(j−1)(S_n)/ker d)=0 in LH(C_Q_p), with Ω⁻¹=0. Combine this with the top row of §1.5 and the supplied R¹lim X_n^(j,j)=0 to obtain R¹lim Hʲ_proét(S_n,Q_p(j))=0.” Replace the nonexistent §1.5 limit citation by this target. Its proof must explicitly identify, after cofinal shrinkings, the derived towers of dagger differential-form sections with the rigid Banach-section towers; import AdicSpacesPartIII R3.4, “Dense restriction of coherent quasi-Stein sections” and “Exactness of dense inverse sequences of Banach spaces”, for the latter, then use the strict six-term sequence and R²lim=0 for the quotient. If that differential-form tower identification is not proved here, declare precisely that missing identification as an AdicSpacesPartIV gap in both README and plan.

   **Repair test:** For j=1 on a disc, this proves the needed vanishing for O(S_n)/C itself; vanishing for the zero F̄_n¹¹ no longer stands in for it. For j=0 the quotient is zero. For a constant disc tower the difference map has section a_n=−Σ_(k<n)b_k, so the new assertion gives R¹lim=0 as required. AdicSpacesPartIII:10069–10103 supplies the cited Banach results; LocallyAnalyticDistributions §0.2:455 assumes finite-dimensional cohomological Mittag–Leffler and does not supply this infinite-dimensional LB case.

6. **F06** (P2) The positive crystalline supplier gap does not state its criterion

   **Location:** `packages/CstConjectureForDaggerVarieties/README.md:82`, “the additional positivity criterion … that proves exact B_cris⁺ equality”; also `design/plan.json`, gap `positive-crystalline-hom`.

   **Claim:** This sentence is an exact supplier contract sufficient for §5.5.

   **Witness:** It specifies neither the tested coefficients nor the condition implying positivity. README:960–966 explicitly says the known bounds allow t⁻¹B_cris⁺ and do not imply equality. Naming an unspecified additional argument supplies no mathematical hypothesis or conclusion.

   **Exact repair text:** “For r≥0 and a finite Frobenius module M over Fⁿʳ with slopes in [0,r], put X_crisʳ(M)=(M⊗B_cris⁺)^(φ=pʳ). Supply the following positivity implication: if λ∈M∨⊗t⁻ʳB_cris⁺ induces, by evaluation on X_crisʳ(M), a natural TVS map with values in B_cris⁺ on every sympathetic C-algebra, then λ∈M∨⊗B_cris⁺. Require this assertion and its evaluation identification to commute with extension to F̂ⁿʳ and the Frobenius operators.” Use this explicit implication, or a precisely stated weaker criterion covering every M=Hⁱ_HK(X), r=i in §5.5, as the needs sentence in both declarations. Keep it conditional until supplied; do not infer it from the sandwich.

   **Repair test:** For M the trivial line and r=1, choose x∈(B_cris⁺)^(φ=p) with θ(x)=1. The coefficient λ=t⁻¹ sends x to x/t∉B_dR⁺, so it fails the newly explicit positivity premise. At r=0 the trivial line gives X=Q_p and exactly B_cris⁺ as its positive-valued evaluation coefficients.

7. **F07** (P2) Two independent supplier obligations remain bundled together

   **Location:** `packages/CstConjectureForDaggerVarieties/README.md:68,80`, “strictness and closed image … and the cup-product Künneth isomorphism”; “period-Hom reconstruction … and … a weakly admissible subfiltration”.

   **Claim:** Each of these is one minimal gap with one needs sentence.

   **Witness:** Strict differentials are consumed in §1.5; Künneth in §3.2. Bounded subfiltrations are consumed in §0.4; arithmetic reconstruction in §5.3. Neither pair of obligations is one theorem or one prerequisite of the same proof step.

   **Exact repair text:** Split `dagger-strictness-kunneth-over-c` into `dagger-strictness-over-c` (“For smooth dagger affinoids and smooth dagger Stein spaces over C, every global de Rham differential has closed image and is strict in the fringe, respectively Fréchet, topology”) and `dagger-kunneth-over-c` (“For smooth dagger X,Y/C having finite-dimensional de Rham cohomology in every degree, cup product induces ⊕_(a+b=n)Hᵃ_dR(X)⊗_C Hᵇ_dR(Y)≅Hⁿ_dR(X×Y) for every n≥0”). Split `bounded-arithmetic-filtration` into `bounded-arithmetic-subfiltration` (retain precisely the bounded weakly admissible subfiltration assertion) and `acyclic-arithmetic-period-hom` (“For an acyclic arithmetic filtered (φ,N,G_K)-module (M,Fil) over the standing K, let V=V_st(M,Fil). Evaluation induces Hom^sm_GK,cont(V,B_st)≅M∨ as (φ,N,G_K)-modules over Fⁿʳ and Hom_GK,cont(V,B_dR)≅M_K∨ as filtered K-modules, with Filʲ(M_K∨)=(Fil^(1−j)M_K)⊥; retain compatibility with the bounded twists of CN25 Corollary 5.10”). Keep the original named suppliers and sections; update plan slugs, README contracts and the consuming Needs lines together.

   **Repair test:** The disc differential d(T)=dT belongs to the strictness contract; the two-annulus product dimension calculation (1,1)⊗(1,1)=(1,2,1) belongs to Künneth. The trivial arithmetic line with Hodge jump 1 has the bounded admissible subfiltration with jump 0, whereas its period-Hom reconstruction is a separate identification of rank-one period modules. No mathematical scope is removed.

## Verified sound

Read the complete README (1,018 lines), Suggested.lean (55 lines), source manifest, design gap list, both previous reviews and their repair report, and the repository README and CONTRIBUTING rules. Counts: **0 Lean declarations; 33 docstring headlines; 44 numbered mathematical targets; 109 Check bullets; 44 principal target locator blocks resolved against four cached works; 8 cited roadmap supplier groups and all 22 declared gap entries checked.** There are no separate bold mathematical targets: the bold labels are Summary and Checks; all 44 numbered targets were reviewed. The computations below are tests of the statements, not proofs of the declared supplier contracts.

### Verification of the ten earlier findings

Here a.Fxx and b.Fxx refer to the two round-one reports. Each repaired quotation is from the present package README unless specified otherwise. The repair report marks no finding “not actionable in this package”. None of S01–S07 depends on overruling such a settlement.

| Earlier finding | Status | Repaired passage and present location | Verification and regression audit |
|---|---|---|---|
| a.F01, unspecified extension-duality input | Repaired; new Check defect S03 | :122, “a continuous B_dR⁺-linear retraction E_q→H_q of the inclusion, for the finite-free topology on H_q” | The sentence quantifies over every finite affinoid cover and integer q and fixes E,H,Q and their topologies. The point gives E=H=R,Q=0, retraction identity. The disc Check added at :622 has the scalar problem S03. |
| a.F02, 42 nondiscriminating Checks | Repaired as to the original restatement/proof-instruction bullets | :290, “generated by the map sending e to 1”; :292, “of rank one as the theorem asserts” | The original bullets were removed, moved to mathematical prose, or replaced by instances. All 109 Check bullets were re-evaluated; the sample below retains distinguishing cases: ranks 0 and 1, image 1 rather than 0, U₁ versus ordinary pointwise Hom. S03 and S04 concern different defects in surviving Checks. |
| a.F03, bounded derived category insufficient | Repaired | :108, “countable towers of complexes with a common lower cohomological bound”; “the bounded-below strict derived category” | Both README and plan include truncation compatibility. For X_n=∐_(m≤n)A^m, Hⁿ contains the nonzero n-fold dlog class; τ≤i has amplitude [0,i]. The gap now covers these towers without a common upper bound. |
| a.F04, wrong coefficient field for isocrystal classification | Repaired | :100, “§CR.4.7, Slope decomposition on the existing isocrystal carrier” | Its target at `TauCetiRoadmap/CrystallineCohomology/README.md:6530` permits arbitrary perfect k. For k=F_p(z)^perf, the unit module is rank 1 over W(k̄)[1/p], not finite over W(F̄_p)[1/p]. Needs at :278 and :608 use the repaired owner. |
| b.F01, three compound gap groups | Repaired for the identified groups; residual problems S02 and S07 | :116, “gap:stable-range-period-map”; :118, “gap:stein-affinoid-syntomic-diagram”; :128, “gap:analytic-hk-gaga” | Four analytic contracts, a separate BC-limit contract, and separate algebraic/GAGA/log contracts are present with matching plan slugs. §3.3 consumes the algebraic and GAGA inputs, not the log sequence. S02 is a duplication introduced by the split; S07 concerns two other independent pairs of obligations. |
| b.F02, open versus closed tubes and misplaced smallness dependency | Repaired | :758, “a sequence ε′_n in \|K̄×\| decreasing to ε”; :760, “§3.4, smallness of X∖Z” | GK04 line 499 gives the ≥ε′ complements. For P¹,∞ the pieces are closed discs of radii 1/ε′, with union the open disc of radius 1/ε. Every dR vector is (K,0). Passing to a divisible value group corrects the discrete-radius defect in the earlier suggested repair as well. |
| b.F03, source sign attribution | Repaired | :388, “whose plus sign is replaced here by the difference map, so that v∘u=0” | CN25 line 2127 prints the sum. At the point the repaired composite is 1−1=0, whereas 1+1=2≠0 for p=2 and p=3. |
| b.F04, Isocrystal locator and field-name heading | Repaired | :50, “Isocrystal.lean:113”; :193, “weak admissibility and acyclicity over C” | The pinned class begins at :113; :112 closes its docstring. The classification theorem is still :180 and is explicitly one-dimensional. |
| b.F05, undefined naive interior and missing source | Repaired | :362, “a Stein open subvariety of Y whose complement in Y is open and quasi-compact” | CN1 line 1163 supports the affinoid definition; CN1 is now a certified manifest entry. The gap now requests only naive interiors of smooth dagger affinoids. The open disc inside a closed disc has the boundary annulus as open quasi-compact complement. |
| b.F06, process narrative in Lean | Repaired | `Suggested.lean:46`, “Proper rigid comparison over K and C is consumed from CohomologyComparisons” | The flagged sentence is deleted. The remaining text identifies mathematical ownership and missing carriers. The namespace contains zero declarations before and after the repair. |

### Adversarial-test context

Notation for this audit: R=B_dR⁺, B=B_dR, Q=Q_p, P=Spa(C), D a smooth dagger disc, A a dagger annulus, U₁=(B_cris⁺)^(φ=p). Every row inherits prime p, characteristic-zero complete discretely valued K, perfect countable residue field, C=completion(K̄), and the separated, taut, countable-at-infinity conventions. Topological assertions use the actual strict left heart and the specified natural functors. Source citations below refer to the cached, line-numbered texts; the locators were read, not inferred from previous reports.

Boundary exclusions were also checked against each row's context: the zero ring cannot be a characteristic-zero field; p=0 or 1 is not prime; q=1 is not a residue-field cardinality; a finite inseparable extension in characteristic zero does not exist; K of equal characteristic p has p=0 and is outside scope; nonsmooth C[ε]/ε² is outside smooth targets, whereas a nonreduced boundary with the same support is allowed in §3.4. Non-quasi-separated spaces are excluded by separatedness. Empty spaces have zero cohomology, and identity pullbacks give identity maps. There is no rank division, numerical degree of a zero polynomial, or natural-number subtraction used to hide a boundary value. The rank-zero slope conventions and the integer r−1 at r=0 are explicit. None of these exclusions removes p=2, p=3 or arbitrary ramification.

### Lean declaration and headline ledger

| File range | Declarations | Section variables and instances | Outcome |
|---|---:|---|---|
| `packages/CstConjectureForDaggerVarieties/Suggested.lean:1–55` | 0 | No variable, include, definition, instance or theorem blocks | Single `import Mathlib`; required namespace; 33 named missing-carrier headlines matching the README. Zero signatures to elaborate, zero lost instances, zero admitted data and zero one-tactic padding. No Lean command was run. |

All 33 headlines require at least one absent carrier: the full geometric period rings with φ,N,t and topology; coherent Fargues–Fontaine bundles and their cohomology; strict analytic HK/de Rham/syntomic/pro-étale complexes; or natural VS/TVS and qBC objects. Algebraic predicates on arbitrary modules would not state these headlines. The pinned `WittVector.Isocrystal` and algebraic BDeRham carriers do not fill these gaps. No statable headline was found missing.

### Sampled adversarial Checks

The following 47 rows sample the 109 Check bullets reviewed. Slashes in the tail-tower examples are interpreted as cokernels in the stipulated left heart, not separated topological quotients. With the locally convex direct-sum topology, 0→V_n→⊕Q→Q^n→0 identifies their R¹lim with [⊕Q→∏Q]; the ordinary vector-space quotient records its underlying classes.

| README line / section | Computed values | Result / change |
|---|---|---|
| 35 / conventions | Nφ(e₁)=pe₀=pφN(e₁); N(e₁+ue₀)=0, N(e₁−ue₀)=2e₀≠0 for p=2,3. | Values agree in the stated context. |
| 36 / conventions | For t⁻¹R,R,tR the degrees are +1,0,−1 and bundles O(1),O,O(−1). | Values agree in the stated context. |
| 37 / conventions | Difference composite at 1 is 1−1=0; sum is 2. A jump-one dual has jump −1; (Fil⁰D)⊥=0 at dual degree 1. | Values agree in the stated context. |
| 38 / conventions | Identity differential gives (H⁰,H¹)=(0,0); zero differential gives (K,K). K[−1] contributes in degree 1, K[1] in degree −1. | Values agree in the stated context. |
| 41 / conventions | gh(e₁)=e₂; hg(e₁)=e₃. Contragredient gh(e₁∨)=e₂∨; a transposition squared fixes every basis vector. | Values agree in the stated context. |
| 42 / conventions | π²=2 gives u=2u_π; N(u_π)=−1/2 and N(u)=−1. For π=3 the factor is 1 and N(u_π)=−1. | Values agree in the stated context. |
| 163 / 0.1 | Rank 0: span_B(0)=0=M⊗B; the zero pair is admitted. | Values agree in the stated context. |
| 165 / 0.1 | Rank 1 with L=0: L[1/t]=0≠B, so fullness fails. | Values agree in the stated context. |
| 234 / 0.4 | Newton −1,L=R: bundle O(1), H¹=0, but Newton slope is not 0. Newton +1 instead gives O(−1). | S04: add the missing slope qualification. |
| 259 / 0.5 | r=1: ker(U₁→C)=Qt, image=C, quotient C. | Values agree in the stated context. |
| 276 / 0.6 | Slope 1,r=0: eigencondition on coefficients is φ=p⁻¹, giving 0; span 0≠R. | Values agree in the stated context. |
| 292 / 0.7 | 0→Qt→U₁→C→0 and Hom(C,B)=Ext¹(C,B)=0 give Hom(U₁,B)=B, rank 1; unrestricted Q-linear C-point Hom is larger. | Values agree in the stated context. |
| 307 / 0.8 | Slope 1,L=R,r=1: X=Qe→Ce injective, V=0; Hom rank 0 versus claimed rank 1 without acyclicity. | Values agree in the stated context. |
| 322 / 0.9 | ×t:R/t²→R/t² has kernel tR/t² and cokernel R/t; both killed by t, hence by the stated t and t² bounds. | Values agree in the stated context. |
| 355 / 1.1 | Disc: ker(d:O→Ω¹)=C; A¹¹=O/C and [T]≠0 with dT≠0. | Values agree in the stated context. |
| 380 / 1.2 | Countable points: B⁰=∏R; reduction mod t is ∏C, not finite-dimensional. | Values agree in the stated context. |
| 404 / 1.3 | On c₀, T(a)_n=p^na_n has dense proper image: b_n=p^n lies outside it. Separated cokernel 0; left-heart cokernel [c₀→c₀] nonzero. | Values agree in the stated context. |
| 435 / 1.5 | Disc,r=1: top kernel O/C contains [T]≠0; a zero-kernel model fails. | Values agree in the stated context. |
| 482 / 2.1 | Point,r=1: Newton −1 and lattice tR give degree −1−(−1)=0; lattice-only change gives −1. | Values agree in the stated context. |
| 524 / 2.3 | P¹ at (0,1): (0,0,Qt), height 1; at (1,1):(0,0,0). Substituting r for i would erase the first rank 1. | Values agree in the stated context. |
| 525 / 2.3 | Disc at (1,1): (positive,torsion,negative)=(0,O/C,0); total O/C. | Values agree in the stated context. |
| 541 / 2.4 | Disc sequence is identity on O/C followed by zero; failure terms 0 but horizontal kernel O/C. | Values agree in the stated context. |
| 557 / 2.5 | Point:1=1+0+0. Disc:0=0+0+0. Substituting Q-dimension gives infinite instead of 0 on the disc. | Values agree in the stated context. |
| 573 / 2.6 | Point,r=0: h¹_(−1)=h¹₀=0,H_syn¹=0, height 1=dim HK⁰; all five conditions true. | Values agree in the stated context. |
| 591 / 2.7 | Formal O at degree 0 gives 1=1; O(−1) at degree 2 gives height 1−1=0≠rank 1. | Values agree in the stated context. |
| 606 / 2.8 | Tate-algebra ω has coefficients p^n→0; every primitive has infinitely many coefficients 1, so does not converge. Dagger HK¹=0. | Values agree in the stated context. |
| 622 / 2.9 | Written O(D_C)⊗̂R has no specified C→R. Repaired D₀/Q_p model: 1⊗b↦b,T⊗b↦0; point E=H=R,Q₀=0. | S03: replace the scalar-extension model. |
| 656 / 3.1 | Countable points: ∏R not finite free, so predicate false despite every component satisfying it. | Values agree in the stated context. |
| 671 / 3.2 | Annuli: (1+x)²=1+2x+x²; degree-two dlogT∧dlogS≠0. | Values agree in the stated context. |
| 685 / 3.3 | A¹: algebraic and analytic dR=(1,0); algebraic étale H¹=0, analytic pro-étale H¹=O/C with [T]≠0. | Values agree in the stated context. |
| 700 / 3.4 | Z=∅ gives original proper cohomology; Z=X gives all 0. Thickening ∞ in P¹ leaves U=A¹,dR=(1,0). | Values agree in the stated context. |
| 731 / 3.6 | (1−πT)⁻¹ converges beyond unit radius but has pole π⁻¹ on A¹; gr⁰ restriction is not onto. Unfiltered dR=(K,0) on both. | Values agree in the stated context. |
| 755 / 3.7 | c=0: intersection is whole and complement empty; union empty and complement whole. | Values agree in the stated context. |
| 756 / 3.7 | Closed tube &#124;S&#124;≤ε leaves &#124;T&#124;<1/ε; U_ε′ are closed discs &#124;T&#124;≤1/ε′. Boundary &#124;T&#124;=1/ε is excluded from union but included in U_ε. All dR vectors (K,0). | Values agree in the stated context. |
| 790 / 4.1 | δ(a)_n=b_n for a_n=−Σ_(k<n)b_k; ker=Q,coker=0. Shifted cone has H⁰=Q; unshifted has H^(−1)=Q. Constant V[−1] has H¹=V. | Values agree in the stated context. |
| 791 / 4.1 | Disc stages at i=r=1: F=O(S_n)/C≠0, F̄=0; the whole F is the lost torsion kernel. | Values agree in the stated context. |
| 792 / 4.1 | X_n contains A^n with nonzero n-fold dlog; H^n≠0 for every n, while each τ≤i has amplitude [0,i]. | Values agree in the stated context. |
| 808 / 4.2 | Tail direct sums: lim=0; R¹lim is represented in the left heart by [⊕Q→∏Q]. Its underlying quotient is Q^N/⊕Q; all-ones class nonzero. | Values agree in the stated context. |
| 823 / 4.3 | Disc: A=H=O/C,H/A=0; R¹lim(H/A)=0 independently of the DR premise. | Values agree in the stated context. |
| 841 / 4.4 | Countable T: H⁰(P¹×T)=∏Q=Q⊗∏Q, an infinite-dimensional group with finite proper-factor rank 1. | Values agree in the stated context. |
| 855 / 4.5 | Y=P¹,S_n discs: H⁰=Q,H²=Q(−1); both constant towers have R¹lim=0. H¹ stages remain O(S_n)/C. | Values agree in the stated context. |
| 869 / 4.6 | P¹×D: degrees 0–3 are Q,H¹(D),Q(−1),H¹(D)(−1); degree 3 nonzero from H²(P¹)⊗H¹(D). | Values agree in the stated context. |
| 885 / 4.7 | Countable points: difference ∏Q⊕∏R→∏R onto, kernel diagonal ∏Q; ∏R is not finite free. | Values agree in the stated context. |
| 909 / 5.1 | i=0 source 0 gives Hom 0. Disc,i=1: [T]≠0 but every equivariant ψ sends T⊗c to 0; density yields zero map. | Values agree in the stated context. |
| 938 / 5.3 | P¹,i=2: evaluation period t⁻¹ has φ=p⁻¹ and filtration jump −1, versus original φ=p,jump +1. | Values agree in the stated context. |
| 954 / 5.4 | Disc: natural Hom(O/C,B_st)=Hom(O/C,B)=0. Coefficient extraction on the class of T gives a nonzero continuous Q-linear C-point functional, hence a different Hom notion. | Values agree in the stated context. |
| 971 / 5.5 | For i=1,t⁻¹∈t⁻¹B_cris⁺ but t⁻¹∉B_cris⁺; outer bounds alone leave an undecided coefficient. | Values agree in the stated context. |

### Examples outside Check blocks

These six layer examples and four worked examples are also included in the audit; they are not counted again among the 109 Check bullets.

| README location | Instance and computed values | Result |
|---|---|---|
| Layer 0 /328 | t⁻¹R,R,tR give degrees 1,0,−1; acyclicity (T,T,F), weak admissibility (F,T,F); H¹(O(−1)) has height −1. At p=2, wrong horizontal vector has N=2e₀≠0. | Consistent with §§0.1–0.5. |
| Layer 1 /455 | Point difference sequence has kernel diagonal Q and cokernel 0. Disc at (1,1) has HK=B=0,F=H=O/C; r=0 point kernel at φ=p⁻¹ is 0. | Consistent with the stable range and integer power. |
| Layer 2 /628 | Point pieces (0,0,Q), height 1; disc pieces (0,O/C,0), height 0. A nonzero O(−1) defect contributes −1, never a compensating positive height. | No cancellation invalidates the equivalence argument. |
| Layer 3 /764 | Annuli product has (1,2,1). P¹,∞ tube comparison has dR=(1,0) on both sides; the rational function has pole π⁻¹ and cannot extend to A¹. | Correct for the indicated closed dagger disc; the projective closed-tube variant uses the open disc in §3.7. |
| Layer 4 /891 | P¹×D has degrees 1,2,3 equal to H¹(D),Q(−1),H¹(D)(−1). Passing n↦2n keeps the constant Q and Q(−1) tower limits and their zero R¹lim. | Finite-factor topology agrees; general proof input S05 remains. |
| Layer 5 /993 | Point arithmetic duals Fⁿʳ,K versus geometric extensions B_st,B. Disc differential term nonzero but Hom=0. P¹ degree 2 gives φ=p⁻¹ and jump −1 on the dual. | Arithmetic and geometric conclusions distinct. |
| Worked line /1005 | Lattices t⁻¹R,R,tR have degrees 1,0,−1. For twisted point, φ_total(t)=p⁻¹pt=t; shifted lattice tR thus gives O, not O(−1). | Correct direction of twist. |
| Worked curves /1007 | g=0,1,2 gives ranks/heights (1,0,1),(1,2,1),(1,4,1); Aʳʳ=0. Good/Tate elliptic N ranks 0/1. N²=0 gives exp(uN)e₁=e₁+ue₀ and exp(−uN)(e₁+ue₀)=e₁. | Zero genus, rank two and sign tested. |
| Worked disc /1009 | [T]≠0 in F¹¹=H¹=O/C, maps to dT≠0; HK image and Fil¹¹ both 0; height 0. | The erroneous replacement F=Fil erases an actual nonzero class. |
| Worked tube /1011 | ΣπⁿTⁿ converges for radius ρ<|π|⁻¹, including some ρ>1; denominator at π⁻¹ is 0. Both unfiltered cohomologies (K,0). | Excludes a filtered quasi-isomorphism. |

### Supplier, ownership and pin resolution

The content repository was read at `544c1af6dcd973ff1aa97fc4635b6bd714248329`. Its manifest pins Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; the checked library trees have those commits. The roadmap service resolved the other cited suppliers at their current new-roadmap heads. Resolver output reported no unresolved roadmap citation or Lean name; its warning that external pinned packages were not scanned was addressed by the direct pin reads below.

| Cited supplier | Resolved sections / targets | Scope and convention check |
|---|---|---|
| AdicSpacesPartII, on main | R0.5 completed tensors; R0.10–R0.17 morphisms, differentials and smoothness; R1 analytification, R1.7 rigid–adic comparison | Complete Hausdorff tensor factors and the appropriate scalar topology are required. Quasi-separated rigid spaces correspond to the stated adic spaces. No dagger or period theorem is inferred merely from an adic carrier. |
| AdicSpacesPartIV, on main | F1.7:4238; F1.8:4515; F1.9:4662 and strict differentials:5005; F1.11:5594 and Künneth:5880; F1.12:5897; F1.16:6460 | Dagger geometry permits complete rank-one bases. Strictness requires discretely valued bases and the stated finiteness; Künneth is quasi-compact mixed-characteristic. The C extensions therefore remain contracts. The annulus dimensions (1,1), sign dT/T and rigid-disc primitive obstruction agree. |
| PadicHodgeTheory | §§0.2–0.5 geometric periods; §2.7 properRigidLogResolution; §§3.4–3.7 arithmetic filtered modules; §5.2 modifications | §0.5 has N(u)=−1, Nφ=pφN and N(u_π)=−1/e_K. Arithmetic numerical degree and curve modification degree use opposite signs, explicitly transported here. Resolution has the finite-K standing C, so the general-K extension is a real gap. |
| CrystallineCohomology | §CR.4.7, “Slope decomposition on the existing isocrystal carrier”, :6530 | Finite-dimensional Witt isocrystals over arbitrary perfect k, with algebraically closed classification. For k=F_p(z)^perf the completed unit module still has rank 1, repairing a.F04. |
| VectorBundlesAndIsocrystals | VB1 bundles/annuli, exact tensor isocrystal functor, slope-sensitive cohomology, untilt local rings and HN; VB2 geometric classification and Hom/Ext; VB3 sympathetic realization, Le Bras, curvature/HN, Euler height and period modules | E=Q_p and the fixed C/countability specialization matches this package. O(d/h) has rank h and slope d/h, opposite the isocrystal slope. ht H⁰−ht H¹=rank. Curvature-zero finite-length modules and natural torsion-Hom vanishing are already owned. Artinian BC is already owned too: S02. |
| LocallyAnalyticDistributions | §§0.0–0.2 strict categories, left hearts, tensors and countable limits | Bounded complexes in the base construction, Fréchet/finite-dimensional-ML hypotheses in §0.2, and finite-K restrictions for compact-type duality were retained. The bounded-below, unrestricted countable-limit calculus is explicitly a gap. |
| CohomologyComparisons | §§4.8–4.9 algebraic comparison and duality; §4.9a analytic HK; §§4.10–4.11 proper comparison over K and C | Analytic HK at §4.9a is not yet the full model-free dagger package. Proper comparison and its induced F⁰ lattice are imported rather than reproved. Separate C-algebraic, GAGA and proper-log contracts cover the additional scopes. |
| ClassicalAdicEtaleCohomology | §§1.3–1.4 coefficient dictionary; §8.4 base change and projection formula; §9.7 pairings/traces | General coefficient-category statements do not supply the perfect integral p-adic proper-factor complex. Existing torsion base change has invertibility conditions. The integral p-adic contract is a genuine extension. |

The S05 repair additionally resolves AdicSpacesPartIII R3.4 on main: dense coherent restrictions at :10069, dense Banach inverse-system exactness at :10080, and countable-exhaustion cohomology at :10105. These are earlier-owned generic results; the repair does not ask this package to rebuild Banach inverse-limit theory.

Ownership searches used the roadmap service's current-head index and object searches in the supplied sibling checkouts, main, Completed and board packages: lattice modifications, finite isocrystals, qBC/reasonable Pairs, bounded period eigenspaces, natural period-Hom, Stein inverse limits and analytic recovery. Matches were resolved at the cited head or pin before being used. `TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/README.md:574` concerns pointwise admissible pairs over Q_p-breve, without N, and later Tannakian families. It does not supply this roadmap's general (φ,N) acyclic lattice-pair theory or analytic qBC comparison. `TauCetiRoadmap/CohomologyComparisonsPartII/README.md:93` concerns classical log-syntomic producers and their h-comparison, not these analytic dagger/qBC end theorems. Generic bundle gluing and finite BC remain assigned to VectorBundlesAndIsocrystals. No second fully qualified Lean name can occur here because Suggested.lean declares none. No dependency was taken from either later sibling.

| Pinned declaration | File and line | What its actual body/type supplies; what it does not supply |
|---|---|---|
| BDeRhamPlus | `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75` | Adic completion of the p-inverted Witt-tilt algebra along theta's kernel, under CommRing R, prime p, p nonunit and p-adic completeness. No Fontaine complete-DVR/topological-field identification in this definition. At p=0 in R its localized carrier collapses to 0. |
| BDeRham | `Mathlib/RingTheory/Perfectoid/BDeRham.lean:88` | Localization by the specified completed generators. It is not by itself a nonzero geometric period field with t,φ,N. |
| WittVector.Isocrystal | `Mathlib/RingTheory/WittVector/Isocrystal.lean:113` | Module over Witt fractions plus Frobenius-linear automorphism. No finite dimension, monodromy, lattice or descent fields. |
| WittVector.isocrystal_classification | `Mathlib/RingTheory/WittVector/Isocrystal.lean:180` | One-dimensional classification over algebraically closed residue field. Does not classify arbitrary finite-rank HK modules. |
| Module.Free | `Mathlib/LinearAlgebra/FreeModule/Basic.lean:43` | Existence of a basis, with no finiteness condition. Infinite free modules are admitted. |
| Module.Finite | `Mathlib/RingTheory/Finiteness/Defs.lean:121` | Finite generation of the top submodule, with no freeness condition. Z/2 over Z is finite but not free. |
| ModuleCat | `Mathlib/Algebra/Category/ModuleCat/Basic.lean:56` | Bundled additive groups/modules and linear maps. No topology or strict left-heart realization. |
| CategoryTheory.BicartesianSq | `Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/BicartesianSq.lean:56` | Both pullback and pushout conditions on the given square. Does not construct the analytic maps or their exactness. |
| TauCeti.AdicSpace | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:243` | Full subcategory of sheafy, locally affinoid pre-adic spaces, the two predicates at :206. No automatic dagger structure, smoothness, properness or cohomology. |
| TauCeti.FarguesFontaine.spaY | `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Y.lean:116` | Valuation-spectrum locus where p and the Teichmüller parameter do not vanish. No coherent curve category. |
| TauCeti.FarguesFontaine.frobeniusHomeomorph | Same file, :218 | Homeomorphism induced by Witt Frobenius, with the actual IsAdic hypothesis. No semistable cohomology operators. |
| TauCeti.FarguesFontaine.spaX | `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.lean:56` | Orbit quotient by the cyclic subgroup generated by that homeomorphism, with quotient topology. No vector-bundle cohomology on the quotient. |

The source/API searches therefore support the Lean statability decision. Generic algebraic cochain complexes and Mathlib's ring-theoretic syntomic predicates cannot stand in for the absent analytic syntomic complex.

### Declared gaps and policy

All **22** README slugs, suppliers and needs sentences match the top-level plan entries exactly. No supplier is `none`. Precision and minimality defects are recorded in S01, S02, S06 and S07; S05 identifies a missing proof input. The other declared contracts remain conditional dependencies.

Every definition has at least three actual instance Checks: §§0.1,0.2,0.3,0.5,1.1,1.2,1.3,2.1,3.1 and 4.1. The other headings state theorems or explanatory consequences rather than introducing additional standalone definitions. Imported notions are resolved to their owners. There is no algebraic algorithm, no `set_option`, no Lean `lemma`, no source-passage block, no pull-request number in README/docstrings, and no sorry'd data.

### Dependency gate and package scope

The requested movable dependency check returned:

```
moved: CstConjectureForDaggerVarieties moved in the merge order from #8 to #204, right after its last supplier CohomologyComparisons (AdicSpacesPartIV, CrystallineCohomology, ClassicalAdicEtaleCohomology, LocallyAnalyticDistributions, PadicHodgeTheory, VectorBundlesAndIsocrystals also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 155 roadmaps, 1051 edges, 0 problem(s)
```

There is no UPWARD or CYCLE result. The moved line is not a finding. It is a prospective order calculation, not evidence that this review changed ORDER.txt. The package's existing diff against origin/main touches nine files, all inside `packages/CstConjectureForDaggerVarieties/`. This pass changed only its report and scratch notes. No Git write, Lean build, issue/PR write or network posting was performed.

## Not verifiable

- The 22 supplier contracts are not completed formalizations. They are accepted as declared dependencies except for the precise defects listed above. Tests do not certify their proofs, particularly the continuous B_dR⁺-linear retraction and exact positive-crystalline recovery. No finding is based merely on a declared result's present absence.
- No Lean elaboration was performed, as required by the read-only brief. There are zero declarations, hence no `#check @name` signatures to inspect. Missing-carrier assertions were checked directly against the pinned sources instead.
- Journal pagination and published corrections were not collated. The package expressly uses CN25's 61-page author manuscript, GK04 arXiv v1, BKV22 arXiv v2 and CN1 arXiv v3; all four texts were available legally in the supplied cache. No missing-reference request is needed. The errata below concern these versions only.

## Source issues

- **Error** in CN25 at §5.1.2, printed p.32, CN25 line 1633: the source says degree is Newton minus Hodge while its acyclicity argument treats positive Hodge excess as positive; it should be Hodge minus Newton for that slope convention; affects a stated result.
- **Misprint** in CN25 at Lemma 5.4 proof, printed p.33, CN25 line 1675: the source says unchanged filtration steps have index different from zero; it should be index different from the selected step i₀; affects the proof.
- **Misprint** in CN25 at Proposition 5.20, printed p.38, CN25 line 1898: the source says the kernel's source uses unrestricted semistable periods; it should be the bounded positive semistable eigenspace, which maps into the displayed positive-period quotient; affects a stated result.
- **Misprint** in CN25 at Proposition 5.20 proof, printed p.38, CN25 line 1906: the source says the chosen admissible lattice contains the original lattice; it should be contained in the original lattice, as required by Remark 5.14 and the kernel inclusion; affects the proof.
- **Misprint** in CN25 at Proposition 5.23 proof diagram, printed p.39, CN25 line 1928: the source says the upper-left coefficient module already contains a factor tʳ; it should be the untwisted R/tᵏ source, with multiplication by tʳ in the composite; affects the proof.
- **Misprint** in CN25 at Remark 6.13(i), printed p.42, CN25 line 2089: the source says the proper comparison uses the unfiltered positive cohomology lattice; it should be the induced F⁰ lattice in localized de Rham cohomology; affects a stated result.
- **Misprint** in CN25 at Corollary 6.19, printed p.43, CN25 line 2137: the source says the diagram has étale cohomology in its upper corner; it should be pro-étale cohomology, as supplied by the syntomic period map and Theorem 6.14; affects a stated result.
- **Error** in CN25 at sequence (6.17), printed p.43, CN25 line 2127: the source says to add the two comparison components after a same-sign diagonal; it should be their difference, whose composite with the diagonal is zero; affects the proof.
- **Misprint** in CN25 at Remark 6.23(ii), printed p.45, CN25 line 2231: the source says a truncated filtered complex equals an untruncated t-multiple; it should be truncated on both sides in degrees at most i; affects the proof.
- **Misprint** in CN25 at Lemma 7.13 and Remark 7.14, printed p.49, CN25 lines 2416, 2423: the source says block indices range through J_j and one coefficient field has exponent h_i; it should be J_i for degree i and h_j for the selected block; affects the proof.
- **Gap** in CN25 at Proposition 7.15 proof, printed p.49, CN25 lines 2439–2444: the source says compact-type reflexivity supplies continuous period-linear coordinate extensions and the required homeomorphic complement; it should be justified for the actual B_dR⁺-module cochain quotient, beyond ordinary scalar-valued duality; affects the proof.
- **Error** in CN25 at Theorem 8.1(c) proof, printed p.51, CN25 line 2525: the source says filtered logarithmic positive-period cohomology is finite length; it should be a finite module, generally a lattice rather than torsion: the degree-zero point gives B_dR⁺; affects the proof.
- **Error** in CN25 at Proposition 8.3 and proof, printed p.51, CN25 lines 2544, 2552: the source says tube restriction is a quasi-isomorphism of filtered de Rham complexes; it should be unfiltered invariance, with only the induced-lattice inclusion needed for acyclicity; affects a stated result.
- **Gap** in CN25 at Proposition 8.4 proof, printed p.52, CN25 line 2566: the source says open-polydisc tube invariance directly treats the stated closed tube; it should be followed by descent along larger radii decreasing to the chosen radius; affects the proof.
- **Misprint** in CN25 at equation (8.7) and Remark 8.9(iii), printed pp.52–53, CN25 lines 2595, 2615: the source says the global filtered term has a stage index and the limit comes from equation (6.11); it should be the global term and the stagewise sequence (8.8); affects the proof.
- **Error** in CN25 at Lemma 8.13 proof, printed p.54, CN25 line 2693: the source says cohomology on the arbitrary second factor with proper-factor coefficients is perfect; it should be the proper factor's coefficient complex whose perfection permits commuting it with global sections; affects the proof.
- **Gap** in CN25 at Remark 9.9(ii), printed p.58, CN25 lines 2862–2865: the source says the nonnegative-Frobenius-iterate condition gives exact positive crystalline coefficients; it should be justified by a restricted positivity criterion distinguishing crystalline from maximal positive periods; affects the proof.
- **Error** in CN25 at Lemma 3.16, printed p.16, CN25 line 773: the source says every sub-BC containing no additive line satisfies a strict dimension-height inequality; it should be restricted to nonzero subobjects, since the zero object gives 0<0; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5687eb6a75d0a7b29bdd9dd5401bbbe078ea53a7", "job": "RT-CstConjectureForDaggerVarieties~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
