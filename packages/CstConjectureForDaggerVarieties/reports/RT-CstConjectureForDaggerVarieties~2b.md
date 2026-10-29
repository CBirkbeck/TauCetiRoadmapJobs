<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1517#issuecomment-6486182053 -->
Red team round 2 pass b (claude) of 5687eb6

Verdict: needs_changes

1. **F01** (P2) §2.3 asserts a *reasonable* middle Pair for every small X; false for a disconnected small space

   **Location.** `packages/CstConjectureForDaggerVarieties/README.md:505` ("The middle piece is the reasonable B_dR⁺-Pair supplied by the filtered-cohomology presentation"); `README.md:29` (the qBC definition requires "such a torsion Pair", that is a reasonable one, as middle graded piece); `README.md:949` ("Present the reasonable B_dR⁺-Pair A densely").

   **Claim.** For every small X and 0≤i≤r, Hʳⁱ is a qBC in the README's sense, so Aʳⁱ=ker(Fʳⁱ→Bⁱ) is a reasonable B_dR⁺-Pair (Fréchet, or a c-compact inductive limit of Banach modules, both terms of the same type).

   **Witness.** CN25 Corollary 7.9 proof, line 2361, proves only "a B_dR⁺-Pair"; reasonableness is a hypothesis in Proposition 4.26 (line 1432, "Let W be a reasonable qBC, i.e., W=0 is a reasonable B_dR⁺-pair") and is proved only for quasi-compact X (Proposition 7.15, line 2426). Counterexample: X=D†⨿D, the disjoint union of the closed dagger disc and the open disc, a separated taut countable-at-infinity smooth dagger space. It is small: B⁰=B_dR⁺⊕B_dR⁺, Bⁱ=0 for i≥1 (both discs have B¹=0). At i=r=1, A¹¹=O(D†)/C⊕O(D)/C: the first summand is of compact type and not Fréchet, the second is a non-normable Fréchet space and not of compact type (a Fréchet space of compact type is finite dimensional), so the sum is neither, and the Pair is not reasonable. Hʳⁱ(X) is a qBC in CN25's sense (Definition 4.5, line 1007) but not in the README's.

   **Repair.** In Conventions (`README.md:29`) replace "such a torsion Pair as middle graded piece" by "a torsion B_dR⁺-Pair as middle graded piece; when that Pair is reasonable the filtration is unique (CN25 Proposition 4.26, line 1432)". In §2.3 replace the sentence at line 505 by: "The middle piece is the B_dR⁺-Pair supplied by the filtered-cohomology presentation and need not be finite BC. It is reasonable, and the filtration is then the unique one, when X is quasi-compact (compact type) or admits a finite admissible covering by Stein opens (Fréchet), which covers the three example classes of §1.2; for other small X only the constructed functorial filtration is asserted." Add the negative-control Check: "X=D†⨿D is small, and A¹¹=O(D†)/C⊕O(D)/C is a Pair that is neither Fréchet nor of compact type." In §2.3's proof route restrict "uniqueness theorem" to the reasonable case. In §5.4 (line 949) write "Present the B_dR⁺-Pair A densely by finite torsion pieces", and in the `qbc-pairs` contract ask for "dense finite-torsion presentations of every B_dR⁺-Pair (CN25 Theorem 9.8 proof, line 2834)". Tested: for D† alone A¹¹ is compact type, for D alone Fréchet, and for D†⨿D the repaired text asserts nothing false; §5.4 for D†⨿D still gives Hom_TVS(H¹,B_dR)=0=Hom(B¹,B_dR).

2. **F02** (P3) A §0.4 Check is false without the slope bound

   **Location.** `packages/CstConjectureForDaggerVarieties/README.md:234` ("Such a pair is acyclic only when every Newton slope is 0, and then L′=L").

   **Claim.** For L=M⊗B_dR⁺, E(M,L) is the bundle of the isocrystal with slopes the negatives of the Newton slopes, so acyclicity forces all Newton slopes to be 0.

   **Witness.** M=Fⁿʳe, φ(e)=p⁻¹e, N=0, L=B_dR⁺e: t_N=−1, t_H=0, degree t_H−t_N=1, E=O(1), which is acyclic (H¹(O(1))=0) with Newton slope −1≠0. The sentence is true only under the bounds of the bounded refinement (slopes in [0,r]), which the Check does not state.

   **Repair.** Replace by: "Such a pair is acyclic exactly when every Newton slope is ≤0; under the slope bound [0,r] of the refinement this means every Newton slope is 0, and then L′=L. For φ(e)=p⁻¹e the pair gives O(1) and is acyclic although its Newton slope is −1." Tested: φ=p⁻¹ gives O(1) acyclic; φ=p gives O(−1), not acyclic; φ=1 gives O with L′=L.

3. **F03** (P3) A §4.4 Check computes the pro-étale value for an étale group

   **Location.** `packages/CstConjectureForDaggerVarieties/README.md:841` ("T a disjoint union of countably many points and Y=P¹: H⁰(Y×T)=∏Q_p=Q_p⊗∏Q_p").

   **Claim.** The étale Q_p-cohomology of §4.4, obtained by inverting p on RΓ_ét(−,Z_p) (`README.md:836`, "Invert p and take cohomology over the field Q_p"), has H⁰_ét(T,Q_p)=∏_N Q_p for T=⨿_N Spa(C).

   **Witness.** RΓ_ét(T,Z_p)=∏_N Z_p in degree 0, and (∏_N Z_p)⊗_{Z_p}Q_p is the space of sequences with bounded denominators, a proper subspace of ∏_N Q_p (the sequence (p⁻ⁿ)_n lies in the second, not the first). ∏_N Q_p is the pro-étale value (used correctly in §4.7's Check at line 885).

   **Repair.** Replace the Check by: "T a disjoint union of countably many points and Y=P¹: H⁰_ét(Y×T,Q_p)=(∏_N Z_p)[1/p]=Q_p⊗(∏_N Z_p)[1/p], the sequences with bounded denominators, strictly smaller than the pro-étale ∏_N Q_p; both sides of the Künneth formula agree, and finiteness is needed only on the proper factor; for two nonproper factors no formula is asserted." Tested: both sides equal (∏Z_p)[1/p] since H⁰(P¹,Q_p)=Q_p.

4. **F04** (P2) The `bc-countable-inverse-limits` contract asks for a target its supplier already states

   **Location.** `packages/CstConjectureForDaggerVarieties/README.md:94` ("Provide that every decreasing sequence of sub-BC objects of a finite BC object is stationary and, consequently, that R¹lim vanishes …"); the same `needs` in `design/plan.json`.

   **Claim.** The stationary-chain clause is missing from VectorBundlesAndIsocrystals and must be supplied under this gap.

   **Witness.** VectorBundlesAndIsocrystals at its head, VB3 "Curvature, the tilted coherent heart and HN invariants", target "Artinian property of BC" (anchor `artinian-bc`, `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:1698`): "Every descending chain W₀ ⊇ W₁ ⊇ ⋯ of BC subobjects stabilizes", with both of CN25 Remark 3.15's arguments and the locator p.16. Only the R¹lim consequence in the VS realization and the left heart is absent there.

   **Repair.** In both files replace the `needs` by: "Provide, from the Artinian property of BC (VB3, Curvature, the tilted coherent heart and HN invariants, 'Artinian property of BC'), that R¹lim vanishes for every countable inverse system of finite BC objects with BC transition maps, in the natural VS realization and in the left heart (CN25 Remark 3.15, line 764)." Keep the slug and supplier section. Tested on the §4.3 consumer: Mittag–Leffler for the images of H̄_m→H̄_n (a decreasing chain in the finite BC H̄_n, stationary by the cited target) gives R¹lim H̄_n=0, which is all §4.3 uses.

Pins at this head: Mathlib `f6090c7`, Tau Ceti `358314d4` (both moved since round 1; every library locator was re-read at the new pins). Suppliers were read at their current heads through the roadmaps tool (CrystallineCohomology, CohomologyComparisons, PadicHodgeTheory, VectorBundlesAndIsocrystals, LocallyAnalyticDistributions, ClassicalAdicEtaleCohomology) or on main (AdicSpacesPartII, AdicSpacesPartIV).

## Round-1 findings at this head

| Finding | Status | Witness at 5687eb6 |
|---|---|---|
| a.F01 (extension-duality contract vague) | repaired | `packages/CstConjectureForDaggerVarieties/README.md:122` states `de-rham-quotient-splitting` with E_q, H_q, Q_q, the Čech–de Rham model, the finite-free topology and the homeomorphism clause; §2.9 (lines 616, 622, 624) consumes it; the computed q=0 disc Check holds (retraction f↦f(0), kernel ≅ Q₀). |
| a.F02 (42 restating Checks) | repaired | 45 `**Checks.**` headers for 44 sections plus Conventions, none duplicated; the §0.7 Checks are the three computed instances (rank 1 with e↦1, zero, rank one through Q_p·t), recomputed below. |
| a.F03 (bounded-below strict derived category) | repaired | `README.md:27` ("bounded-below strict derived category"), `README.md:108` (contract asks for the bounded-below category, left t-structure, τ_≤i compatibility), `README.md:358` and `README.md:792` (⨿Aᵐ witness, amplitude [0,i] after truncation). |
| a.F04 (VB0 residue field) | repaired | `README.md:98–100` new CrystallineCohomology block citing §CR.4.7; CR.4.7's "Slope decomposition on the existing isocrystal carrier" exists at head #857 (perfect k, blocks over k̄); VB0 is named only as not covering k=F_p(z)^perf (`README.md:100`); §0.6 and §2.8 Needs repointed. |
| b.F01 (compound contracts) | repaired | 22 slugs in README and `design/plan.json`, identical `needs` text (checked by script); the nine split contracts carry CN25 locators that resolve (lines 1954, 2231, 2405, 960, 2647, 2098, 2601, 2664, 764, 2491, 2493, 2507–2525). |
| b.F02 (§3.7 route) | repaired | `README.md:758` uses U_ε′={|f_j|≥ε′}, ε′∈|K̄×| (GK04 line 55: Γ*=|k_a*|), the increasing union and the derived limit; `README.md:760` transports smallness from §3.4; the P¹ Check (`README.md:756`) computes closed discs {|T|≤1/ε′}. |
| b.F03 (plus sign locator) | repaired | `README.md:388` "whose plus sign is replaced here by the difference map, so that v∘u=0". |
| b.F04 (two slips) | repaired | `README.md:50` cites `Isocrystal.lean:113` (class at line 113 at the new pin too); `README.md:193` reads "over C". |
| b.F05 (naive interior) | repaired | `README.md:362` defines it for a smooth dagger affinoid, citing CN1 line 1163 (verified: Stein subvariety with open quasi-compact complement, p.26); `sources.toml` records CN1 as certified open-repository; References list CN1. |
| b.F06 (process sentence) | repaired | `Suggested.lean` docstring ends with the statability paragraph; no process sentence. |

No repair introduced a new error: every Check added in the repair round was recomputed (ledger below). The §3.7 route's use of |K̄×| is correct (|K×| is discrete, so (ε,ε₀)∩|K×| can be empty).

## Verified sound

**Scope and policy.** `git diff --stat origin/main...HEAD` touches only `packages/CstConjectureForDaggerVarieties/` (README.md, Suggested.lean, design/plan.json, metadata.toml, sources.toml, four reports). No pull-request number, process word, `set_option`, Lean `lemma`, machine path or LaTeX in README or Suggested.lean. Every one of the 44 targets carries a CN25 locator (plus GK04, BKV22, CN1 where used). `Suggested.lean`: single `import Mathlib`, one module docstring in the required form, the namespace, no declaration.

**Dependency gate** (run read-only with `--movable`):

```
moved: CstConjectureForDaggerVarieties moved in the merge order from #8 to #204, right after its last supplier CohomologyComparisons (CrystallineCohomology, ClassicalAdicEtaleCohomology, LocallyAnalyticDistributions, PadicHodgeTheory, VectorBundlesAndIsocrystals also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 188 roadmaps, 1233 edges, 0 problem(s)
```

No UPWARD or CYCLE line. All six pull-request suppliers are new-roadmap pull requests; AdicSpacesPartII and AdicSpacesPartIV are on main. The "never cite" list is empty.

**Gaps.** 22 slugs; README and `design/plan.json` agree slug by slug with identical supplier, section and `needs` text (script). No supplier is `none`. Each `needs` is a single contract with hypotheses. Twenty-one ask for nothing a pin or supplier already provides: AdicSpacesPartIV F1.11's Theorem A and Künneth are stated for the fraction field of a complete DVR (lines 5851, 5880 on main), F1.9's *dagger-strict-differentials* for discretely valued K, and F1.11's tube invariance is Grosse-Klönne's Theorem C (components of the special fibre, line 5724), not Corollary 3.8 (horizontal coordinate divisors), so the three AdicSpacesPartIV gaps are genuine; PadicHodgeTheory §2.7 and its Conventions fix finite K/Q_p, so the resolution gap is genuine; ClassicalAdicEtaleCohomology §8.4 requires n invertible in O_Y⁺, so the Z_p contract is genuine. The twenty-second, `bc-countable-inverse-limits`, restates its supplier's "Artinian property of BC" in its first clause (S04).

**Pinned declarations (12, all re-read at the new pins).** `BDeRhamPlus` (`Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`, adic completion of the p-inverted Witt tilt along ker θ, zero ring when p=0 in R, as the README says), `BDeRham` (:88), `WittVector.Isocrystal` (`Isocrystal.lean:113`), `isocrystal_classification` (:180, algebraically closed k, finrank 1), `Module.Free` (:43), `Module.Finite` (:121), `ModuleCat` (:56), `BicartesianSq` (:56), `TauCeti.AdicSpace` (`Adic.lean:243`, full subcategory of sheafy locally affinoid pre-adic spaces), `spaY` (`Y.lean:116`), `frobeniusHomeomorph` (:218), `spaX` (`Quotient.lean:56`). Neither pin has Hyodo–Kato, syntomic, pro-étale, Banach–Colmez, dagger or coherent Fargues–Fontaine carriers (`RingTheory/Perfectoid` holds only BDeRham, FontaineTheta, Untilt; the Tau Ceti `FarguesFontaine` folder holds Y, Quotient, Window; Mathlib's `Sites/Proetale.lean` is for schemes), so all 33 headline theorems in the docstring remain not statable and no stand-in is used. No padding: the file declares nothing.

**Sibling citations (8 roadmaps, 52 sections or named subsections, all resolve).** CrystallineCohomology §CR.4.7 "Slope decomposition on the existing isocrystal carrier" (perfect k; standard blocks F(e_i)=e_{i+1}, F(e_b)=p^a e_1 over an algebraic closure, the same convention as CN25 line 1861 and VectorBundlesAndIsocrystals). CohomologyComparisons §4.8, §4.9, §4.9a (`RigidHyodoKatoCohomology` for rigid X/C under §4.8's base assumptions; dagger version is the gap), §4.10, §4.11. PadicHodgeTheory §§0.2–0.5 (§0.5: N(u)=−1), §2.7 (`properRigidLogResolution`, reduced proper rigid X/C, finite K), §§3.4 (t_H(D′)≤t_N(D′) weak admissibility), 3.5–3.7 (D*_pst as smooth Hom), §5.2 (modification degree t_N−t_H, curve degree opposite). VectorBundlesAndIsocrystals: VB0 "Coefficient category and rational blocks" (residue field F̄_q, as the README says), "Dieudonné–Manin classification of finite isocrystals"; VB1 "Bundles, annuli and derived cohomology", "The exact tensor isocrystal-to-bundle functor", "Slope-sensitive cohomology of standard bundles", "Untilts and completed local rings", "Harder–Narasimhan filtration of geometric bundles"; VB2 classification "Geometric classification of vector bundles", "Hom and extension calculus for geometric bundles"; VB3 "Sympathetic algebras and the classical category", "Curvature, the tilted coherent heart and HN invariants", "Period modules and curvature calculus", "Curvature-zero finite-length modules" (CN25 Prop. 3.17), "VS Hom vanishing from torsion period modules" (B_dR⁺ and B_dR targets, bounded-image step named), "Le Bras equivalence", "Euler–Poincaré height formula" (ht H⁰−ht H¹=rk, torsion height 0), "The fundamental untilt sequence and degree-one divisors". LocallyAnalyticDistributions §0.0 (left hearts from bounded cochain complexes; compact-type regularity and strong duality for finite K/Q_p), §0.2 (strict countable inverse limits for Fréchet complexes with closed-image differentials). ClassicalAdicEtaleCohomology §1.3, §1.4, §8.4, §9.7. AdicSpacesPartII R0.5, R0.10–R0.17, R1; AdicSpacesPartIV F1.7, F1.8 (dagger analytification), F1.9, F1.10, F1.11, F1.12, F1.16.

**Ownership.** `roadmaps grep` over main and the 416 open heads for qBC, de Rham slopes, naive interior, proper times Stein, almost proper, C_st-conjecture, sympathetic and `CstConjectureForDaggerVarieties` finds the objects nowhere except as references in the suppliers' bibliographies and VB3's sympathetic Vector Spaces (which this roadmap consumes). No other roadmap states the C-lattice pairs, the analytic square or the recovery theorems. Ownership against open pull requests was checked through that index, not by reading each listed sibling checkout file by file.

**Source locators.** 71 CN25 lines were read against the cached text; every cited theorem, lemma, remark, definition or equation is at the line given, and every printed page claimed agrees with the page markers (lines 329–381 lie on p.8, inside the "§1.3, pp.7–8" range). GK04 lines 55, 499–520, 556–571 (Γ*=|k_a*|; Proposition 3.7 with U_i={|f_i|≥ε}, X−U≅D⁰(ε)^m×Z; Corollary 3.8(a),(c) on pp.16, union case by Čech). BKV22 lines 1176–1187 (tube |f_U|≤ε, ε∈|K*|, trivialization independence). CN1 line 1163, p.26.

**Counts.** Declarations read: 0 (33 docstring items checked against the pins). Targets read: 44, plus Conventions, four Examples blocks, Worked examples. Locators verified: 71 CN25, 4 GK04, 1 BKV22, 1 CN1. Checks tested with computed values: 41. Sibling citations checked: 52. Pinned declarations: 12.

**Adversarial ledger** (R=B_dR⁺, D closed dagger disc, D° open disc, U₁=(B_cris⁺)^(φ=p), values computed on each side).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions Nφ=pφN, N(u)=−1 | φ=diag(1,p), Ne₁=e₀ | N(e₁+ue₀)=e₀−e₀=0; N(e₁−ue₀)=2e₀; horizontal lift exp(uN) since (N_M−∂_u)exp(uN_M)m=0 | consistent; CN25 line 1856 writes exp(−uN), which the README says it translates | none |
| Conventions u versus u_π | Q₂(√2), Q₃ | u=2u_π, N(u_π)=−1/2; Q₃: u=u_π | pinned | none |
| Conventions degree t_H−t_N | t⁻¹R, R, tR on trivial line | degrees 1,0,−1; O(1),O,O(−1) | source prints t_N−t_H (line 1633) | none |
| Conventions qBC with reasonable middle | D†; D°; D†⨿D at i=r=1 | A¹¹ compact type; Fréchet; neither | third instance refutes | S01 |
| 0.1 lattice pair | rank 0; tᵐR | 0; distinct embedded lattices | holds | none |
| 0.2 bundle and V_st | trivial, L=R; L=tᵐR; 0 | O, Q_p; O(−m); 0 | holds | none |
| 0.3 predicates | O, O(1), O(−1), 0 | acyclic T,T,F,T; w.a. T,F,F,T | both directions | none |
| 0.4 criteria and refinement | r=1, φ=p, L=R; L=t⁻¹R; trivial φ, L=t⁻¹R | O(−1), H¹≠0, no L′; degree 0, L′=L; O(1), L′=R | acyclicity needed | none |
| 0.4 Check 4 | φ=p⁻¹, L=R | O(1), acyclic, Newton slope −1 | Check false as stated | S02 |
| 0.5 eigenspace and kernel | trivial, r=0; r=1; L=t⁻¹R at r=0 | Q_p, quotient 0; 0→Q_pt→U₁→C→0; upper bound fails | holds; Remark 5.16 line 1833 | none |
| 0.5 X_st^r as H⁰ | slope s∈[0,r] | E(M{−r},M⊗R) slopes r−s≥0, H¹=0, height dim M | holds | none |
| 0.6 generation | slope 0 r=0; slope 1 r=0; M=0 | Q_p spans R; (B_cris⁺)^(φ=p⁻¹)=0; 0 | slope bound needed | none |
| 0.7 Hom | trivial r=0; M=0; trivial r=1 | rank 1, e↦1; 0; Hom(U₁,B_dR)=Hom(Q_pt,B_dR)=B_dR | holds | none |
| 0.8 Hom from kernel | L=Re, r=1; L=t⁻¹Re; φ=p, L=Re | V=Q_pt, rank 1; V=U₁, rank 1; X¹=Q_pe↪Ce, V=0, Hom 0 | acyclicity needed | none |
| 0.9 truncation | r=0; r=1,k=2 | iso; ·t on R/t²: kernel tR/t² (killed by t), cokernel C (killed by t) | kernel bound tʳ (line 1942), cokernel t²ʳ (line 1946) | none |
| 1.1 filtered groups | point; D at i=r=1; i<0 | (R,tʳR,0); (0,O(D)/C,O(D)/C); 0 | F≠Fil | none |
| 1.2 small | point; D; ⨿_N pt; D†⨿D° | rank (1,0,…); small though H¹_proét infinite; ∏R not finite free; small | fourth instance feeds S01 | none |
| 1.3 difference map | point i=r=0 | v(1,1)=0, sum gives 2 | line 2127 prints a sum (register E9) | none |
| 1.4 twist | point i=0, r→1 | U₁/Q_pt≅C=R/tR via θ | matches line 2230 | none |
| 1.5 kernel | point r=0; D r=1; annulus r=1 | (B_cris⁺)^(φ=p⁻¹)=0; ker(O/C→Ω¹)=0; (B_cris⁺)^(φ=p⁻¹)e=0, dT/T survives | matches line 2109 | none |
| 1.6 proper and Stein | point; D i=r=1 | horizontals injective; both onto, kernel O(D)/C | matches lines 2197–2199 | none |
| 2.1 range r≥dim X | annulus i=1, r=1; P¹ i=2, r=1 | F¹RΓ=t·F⁰RΓ(X/B_dR) in degrees ≤1; Ω²=0 so equality in all degrees | holds for r≥dim X | none |
| 2.2 kernels | point i=0,r=1; D i=r=1 | U₁∩tR=Q_pt, onto by θ; 0 | holds | none |
| 2.3 pieces | P¹ (0,1),(1,1); D (1,1); point | (0,0,Q_pt); (0,0,0); (0,O/C,0); (0,0,Q_p) | holds; see S01 for "reasonable" | S01 |
| 2.3 torsion description | small X | t^r·A=0 since t^r∘(F→B→F) is t^r on F | A=(F)_tors | none |
| 2.4 sequence | point i=0,r=1; D i=r=1 | kernel diagonal Q_pt; 0→O/C→O/C⊕0→0 | exact | none |
| 2.5 height | point r=0; D r=1; O(−1) | 1=1+0+0; 0=0+0+0; ht H¹=−1<0 | strictness for bundle H¹ only | none |
| 2.6 equivalence | point r=0; D r=1 | all five hold; H_syn¹(pt,0)=0 | holds | none |
| 2.7 all degrees | D; O in degree 0 plus O(−1) in degree 2 | holds; degree 2: 1−1=0≠1 | quantifier necessary | none |
| 2.8 splitting | point r=0,1; D | (Q_p,0), (U₁,0); HK¹=0, Tate-algebra H¹ non-Hausdorff | overconvergent carrier needed | none |
| 2.9 decomposition | point; D i=r=1; q=0 on D | Q_p=0⊕Q_p⊕0; O/C=P₁; retraction f↦f(0) | holds | none |
| 3.1 predicate | point; affinoid; ⨿_N pt | O; via §§1.6, 2.7; not small | holds | none |
| 3.2 products | D×D; annulus² | dR (1,0,0); (1,2,1), dT/T∧dS/S; ∂²(TS)/∂T∂S=1 kills pro-étale Künneth | holds | none |
| 3.3 analytification | A¹; G_m | (1,0), O; lattice t⁻¹R, degree 1−1=0, O | holds | none |
| 3.4 almost proper | Z=∅; Z=X; nonreduced Z | proper case; 0; same U | holds | none |
| 3.5 discrepancy | D=∅ | both complexes 0 | holds | none |
| 3.6 tubes | m=s both conventions; P¹, ∞ | ∅ and whole fibre; A¹→D† unfiltered (K,0) both, gr⁰ misses (1−πT)⁻¹ | source "filtered" (E16) refuted | none |
| 3.7 tubes | c=0; f=T, ε=\|π\|; πT; ε=\|π\|²; P¹, ∞ | ∅/whole; {\|T\|≤\|π\|}; whole chart; π² in, π out; U_ε′={\|T\|≤1/ε′}, union {\|T\|<\|π\|⁻¹} | GK 3.7 keeps {∃i:\|f_i\|≥ε′}; limit step correct | none |
| 4.1 exhaustion | constant; Q_p[0] Roos; ⨿Aᵐ | R¹lim=0; (H⁰,H¹)=(Q_p,0); Hⁿ_dR(X_n)∋dlog class | holds in bounded-below category | none |
| 4.2 obstruction sequence | D constant tower; ⊕_(j≥n)Q_p | lim O/C, R¹lim 0; lim 0, R¹lim∋(1,1,…) | six-term sequence ends with R¹lim B_n=R¹lim F̄⁰_n=0 (§4.1) | none |
| 4.3 criterion | constant X; D at r=i=1; ⊕_(j≥n)Q_p | all R¹lim 0; H/A=0 finite BC; R¹lim≠0 | criterion is about these towers | none |
| 4.4 Künneth | P¹×T; Y=pt; T=⨿_N pt | Hⁱ(T)⊕Hⁱ⁻²(T)(−1); identity; both sides (∏Z_p)[1/p] | formula holds; Check value is pro-étale | S03 |
| 4.5 R¹lim | P¹×D°, S_n=closed discs | H⁰=Q_p, H²=Q_p(−1) (H²(S_n)=0 as Ω¹/ker d=0 and HK²=0) constant towers | holds | none |
| 4.6 pro-étale Künneth | P¹×D° | Q_p, H¹(S), Q_p(−1), H¹(S)(−1) | holds | none |
| 4.7 proper×Stein | pt×⨿_N pt (Stein: S_n⋐S_(n+1) via f=(0,…,0,p⁻¹)) | ∏Q_p⊕∏R→∏R onto, kernel diagonal; B⁰ not finite free | holds without smallness | none |
| 5.1 differential term | i=0; D over K, i=1 | 0; ψ(T⊗c)=0 by Hom_(G_L)(C,B_dR)=0 (line 500) and density | holds | none |
| 5.2 torsion kernel | D over K, i=r=1; point | A¹¹=O(X_C)/C, image of Ω⁰/ker d, Hom 0; A=0 | holds | none |
| 5.3 recovery over K | point i=0; P¹ i=2; D i=1 | Fⁿʳ, K; Fⁿʳt⁻¹ with φ=p⁻¹, Kt⁻¹ jump −1; both 0 though H¹_proét≠0 | contravariant, matches PadicHodgeTheory twist | none |
| 5.4 recovery over C | point; D i=1; D†⨿D° i=1 | B_st, B_dR; 0=0; 0=0 | holds; source proof uses any Pair (line 2834) | S01 (wording) |
| 5.5 positive crystalline | point i=0; i=1 | B_cris⁺, Filᵏ=tᵏR; t⁻¹∈t⁻¹B_cris⁺∖B_cris⁺ | equality is the declared gap | none |
| 5.6 scope | rank 0,1,2; good vs Tate elliptic | ranks 0,1,2; N rank 0 vs 1 | holds | none |

**Checks tested and found correct (41):** Conventions 7; §0.1 three; §0.2 three; §0.3 three; §0.4 three of four; §0.5 five; §0.6 two; §0.7 three; §0.8 two; §0.9 two; §1.1 three; §1.2 three; §1.3 three; §1.4 two; §2.2 three; §2.4 two; §2.9 three; §3.7 five; §4.1 four; §4.2 three; §4.5 one; §5.3 three (the remaining Checks were read and found to be computed instances, not restatements).

## Not verifiable

- The 22 declared contracts are conditional on their suppliers; this pass checks their precision, minimality and declaration, not their proofs. None is raised as a finding.
- Reasonableness of Aʳⁱ for the three example classes (quasi-compact, naive interior, analytification) is asserted in the S01 repair on the strength of the LB/Fréchet topologies of CN25 Theorem 6.14 and finite Čech complexes; CN25 proves it in print only for quasi-compact X (Proposition 7.15). The repair wording makes this the explicit scope.
- CN25's sign convention for N on the coordinate u is not stated in the cached text; the README's N(u)=−1 (from PadicHodgeTheory §0.5) is internally consistent, and the README says it translates the source's series at line 1856.
- Surjectivity of 1−φ on B_cris⁺ (used in the §2.6 and §2.8 Checks) is a standard period-ring fact not in the four recorded sources.
- CN25's §9.1.3 extends Lemma 9.6 to non-quasi-compact small X in one sentence; the README's §5.2 proof route follows it. Its density argument over countable Čech complexes was not checked.
- No Lean command was run; `Suggested.lean` has no declaration, so the per-declaration `#check` comparison has zero cases.
- The journal pagination of CN25 was not collated; all locators refer to the author manuscript recorded in `sources.toml`.

## Source issues

- **Misprint** in CN25 at equation (8.8), Lemma 8.10 proof and footnote 22, printed pages 52–53, CN25 lines 2597, 2634 and 2651: the source pairs the pro-étale group H_n (resp. H̄_n) with the image filtration F̄_n (resp. F_n/tʳF⁰_n, called a sub-B_dR⁺-module of F⁰_n/tʳF⁰_n); it should use F_n with H_n, or F̄_n with H̄_n=H_n/A_n, since F_n→F⁰_n has kernel A_n; on the dagger disc at i=r=1 the printed sequences read 0→O(D)/C→0→0→0 and 0→0→O(D)/C→0→0; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5687eb6a75d0a7b29bdd9dd5401bbbe078ea53a7", "job": "RT-CstConjectureForDaggerVarieties~2b", "model": "fable", "worker": "chris-x10"} -->
