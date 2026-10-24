<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1051#issuecomment-6378884283 -->
Review (claude) of d11cfe3

Verdict: needs changes

1. **F01** (P2) gap:coherent-topos-pushouts asks for Deligne's theorem, which AdicEtaleGeometry already provides

   - **Location.** `packages/ArcTopologyAndDescent/README.md` line 76: the gap asks for "the representable coherence and quasi-compact relation criteria, Deligne enough points and coherence of pushouts…". Also line 761 ("Deligne completeness from the topos supplier") and the Needs of §§5.2, 5.3, 5.5 and 8.6.
   - **Claim.** No earlier roadmap supplies Deligne's enough-points theorem for coherent sites or the qcqs-object vocabulary of a topos.
   - **Witness.** `TauCetiRoadmap/AdicEtaleGeometry/README.md` (main) line 5763, §A1.15 *coherent-topos-enough-points*: enough points for any essentially small site with coherent topos. `TauCetiRoadmap/AdicSpacesPartII/README.md` line 8005, §R0.19.10: qcqs objects and morphisms, algebraic topoi.
   - **Repair.** In the SchemeAndStackFoundations contract, cite AdicEtaleGeometry §A1.15 (`coherent-topos-enough-points`) and AdicSpacesPartII §R0.19.10, and add both to the Needs of §§5.2–5.3. Narrow the gap's `needs` (README and plan) to what those sections lack. That is: arc-sheafified representables on the bounded site are coherent; the criterion for a coherent sheaf by a surjection from h_X^# with quasi-compact relation (BM21 Lemma 4.19(2)–(3)); and coherence of pushouts along monomorphisms (BM21 Lemma 4.23). Test on the bounded arc site of §5.1. It has finite limits and every covering family has a finite covering subfamily, so the "for instance" clause of §A1.15 applies.

2. **F02** (P2) gap:perfectoid-tate-constant-comparison asks for the comparison that ClassicalAdicEtaleCohomology §2.6 already states

   - **Location.** README line 104 (the gap), line 106, and §12.2 (lines 1442 and 1448, the Needs).
   - **Claim.** ClassicalAdicEtaleCohomology §§2.5–2.6 lack the constant Z/p^n comparison between Spec A[1/p] and Spa(A[1/p],A) for p-complete integral perfectoid A.
   - **Witness.** `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md` at its open head, §2.6, line 1065. It covers p-torsion-free integral perfectoid R with R=(R[1/p])° and any finite étale commutative p-power-order G (so Z/p^n): H^q(Spec R[1/p],G)≅H^q(Spa(R[1/p],R),G^an), with a tilt analogue.
   - **Repair.** Cite ClassicalAdicEtaleCohomology §2.6 (the Česnavičius Theorem 4.10 comparison and its tilt version) in the ClassicalAdicEtaleCohomology contract and in §12.2's Needs. For general p-complete integral perfectoid A, pass to R=(A[1/p])°, which leaves A[1/p] unchanged (PerfectoidQuotients §§0.4–0.5, torsion removal and p-integral closure). Narrow the gap to whatever is still missing: compatibility with PerfectoidSpaces §P3.20 tilting and open restriction, and, if it is used, comparing Spa(A[1/p],A) with Spa(A[1/p],R). Drop the gap if nothing is missing. Test case: A = the p-adic completion of Z_p[p^{1/p^∞}]. It is p-torsion-free and A=(A[1/p])°, so §2.6 applies directly with G=Z/p^n.

3. **F03** (P2) gap:affine-characteristic-primary-cohomology: the only consumer needs constant coefficients, which SchemeAndStackFoundations already supplies

   - **Location.** README lines 94–96 (the gap and its justification) and §10.1, line 1264 ("EtaleCohomologyFoundations §F.3 characteristic-primary contract"). §10.1's statement (line 1258) is for "every constant torsion abelian group Λ".
   - **Claim.** The p-primary input of §10.1 is missing and needs arbitrary p-primary sheaves on affine characteristic-p schemes.
   - **Witness.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md` (main) §2.11, lines 3670 and 3692 (`Etale.artinSchreier_vanishing`), proves H^q(X_ét,ℤ/p)=0 for q≥2 on affine X in characteristic p. Line 3888 (§2.15, `gabber_test_strictly_henselian`) gives vanishing on strictly henselian local rings, which covers the zero-dimensional case.
   - **Repair.** In §10.1's Needs and in the contracts, cite SchemeAndStackFoundations §2.11 (`artinSchreier_sequence`) and §2.15. Add the Z/p^n dévissage and filtered coefficient colimits (§2.5) for arbitrary constant torsion Λ. Then delete the gap from the README and the plan. If arbitrary p-primary sheaves are wanted for a named consumer, keep a narrowed gap for that extension only, with §2.11 as its base. Test case: char K=p, n=1, Λ=Z/p. A model B of dimension 1 has H^q(Spec B,Z/p)=0 for q≥2 by §2.11, which is the bound q>n required by §10.1. For n=0, B is a finite product of artinian local K-algebras with algebraically closed residue field, which are strictly henselian, so H^q=0 for q≥1 by §2.15.

4. **F04** (P2) §11.2 misidentifies the connected components of a quasi-compact open

   - **Location.** README line 1372: "Any quasi-compact open of the spectrum of a product of aic valuations has no nonsplit étale covers; its connected components are the corresponding ultraproduct valuation spectra, possibly of higher rank."
   - **Claim.** The connected components of a quasi-compact open U ⊂ Spec ∏V_i are the ultraproduct spectra Spec ∏_U V_i.
   - **Witness.** One factor V, aic of rank one, t a pseudouniformizer: U=D(t)=Spec Frac V is connected, yet Spec ∏_U V = Spec V. CS24 Lemma 2.2.4 (lines 774–777) identifies ultraproducts only for Spec ∏V_i.
   - **Repair.** Replace the clause with: "the connected components of Spec ∏_i V_i are the spectra Spec ∏_U V_i (possibly of higher rank), and each connected component of a quasi-compact open is the spectrum of a localization of one of them, a valuation ring with algebraically closed fraction field (CS24 Lemma 2.2.4, p. 19)". The repaired clause holds on the test case: Spec Frac V is the spectrum of V_(0).

5. **F05** (P2) right cancellation is credited to PrismaticCohomology §2.0, which does not state it

   - **Location.** README line 64 ("closure and right-cancellation rules") and line 333, the Needs of §1.6 ("the supplied right-cancellation rule for v-covers"). The arc version (BM21 Lemma 2.3) is used, unowned, in §4.6's reduction to finitely presented covers (line 708).
   - **Claim.** PrismaticCohomology §2.0 supplies right cancellation for v- and arc-covers.
   - **Witness.** `TauCetiRoadmap/PrismaticCohomology/README.md` at its open head, §2.0, lines 2656 and 2665. It supplies only composition and base change (`Arc.Cover.baseChange`, `Arc.Cover.comp`, `Arc.Cover.ofVCover`). §1.7 here owns right cancellation for universally subtrusive maps, but §1.7 comes after §1.6.
   - **Repair.** Delete "and right-cancellation" from line 64. In §1.6, add an API bullet before the rule is used: "if g∘f is a v-cover then g is a v-cover" (immediate from the lifting definition; RYD10 p. 8, RYD10 line 350). Point §1.6's Needs at that bullet. In §2.5 and §2.7, add "if g∘f is an arc-cover then g is an arc-cover" (BM21 Lemma 2.3, p. 9, BM21 line 364), and add §2.7 to §4.6's Needs. Test case: Spec A[x₁,x₂,…]→Spec A→Spec A with A[x₁,…,x_n] as the middle stage. Any lift through the composite projects to a lift through the second map. This is not graded P1 because the missing statement is one line from the definitions; the route is not blocked.

6. **F06** (P3) §8.4 gives the wrong page for BS22 Remark 8.9

   - **Location.** README line 988: "BS22 Remark 8.9 p. 68".
   - **Witness.** BS22 line 2610 (Remark 8.9) falls on printed page 67. Page 68 begins at BS22 line 2630.
   - **Repair.** Change it to "BS22 Remark 8.9, p. 67". The aic-completion clause is supported more directly by CS24 §2.2.1, p. 18 (CS24 line 733), which says that I-adic completion preserves algebraic closedness. Cite that as well.

7. **F07** (P3) two target statements restate supplied results

   - **Location.** README line 376, §2.2: "Every v-cover is an arc-cover." Line 819, §6.1: "An aic valuation domain … [is] strictly henselian."
   - **Witness.** PrismaticCohomology §2.0 already supplies `Arc.Cover.ofVCover` (its README line 2665). ClassicalAdicEtaleCohomology §6.1 (its README line 3078) proves that a valuation ring with algebraically closed fraction field is absolutely integrally closed and strictly henselian.
   - **Repair.** In §2.2, write "By PrismaticCohomology §2.0 (`Arc.Cover.ofVCover`) every v-cover is an arc-cover;" and keep the noetherian-target and rank-one base-change statements as the targets. In §6.1, cite ClassicalAdicEtaleCohomology §6.1 for strict henselianity and keep the closed-point-stalk and FinSet statements. Add both citations to the Needs.

8. **F08** (P3) §4.4 must state that the extensions are strict

   - **Location.** README line 686: "Suppose each nonmaximal p extends upward to some [p,q]∈P and each nonzero q extends downward to some [p,q]∈P."
   - **Witness.** BM21 Lemma 4.7(3)–(4) (lines 1124–1125) require q⊋p, r⊊p. Non-strictly, q=p always works and the lemma fails: V of BM21 Remark 2.18, P = intervals avoiding (0) plus {(0)}, is closed as required yet lacks Spec V.
   - **Repair.** Write "each nonmaximal p admits q⊋p with [p,q]∈P, and each nonzero q admits r⊊q with [r,q]∈P". Add the P above as a negative-control Check.

9. **F09** (P3) spurious Needs edges to GeneralAlgebraicKTheory §§8.5–8.6

   - **Location.** README lines 24 and 138, and the Needs of §2.3 (line 392), §4.3 (line 682) and §5.5 (line 795).
   - **Witness.** `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md` at its open head: §8.5 is exactness of Milnor's K₁ sequence and §8.6 is the K₁–K₀ Mayer–Vietoris sequence. Neither defines or "supplies" a Milnor datum, which this README defines in its Conventions (line 31).
   - **Repair.** Remove GeneralAlgebraicKTheory §§8.5–8.6 from the Needs of §§2.3, 4.3 and 5.5 and cite the Conventions definition instead. Keep only the scope-table deferral of K-theoretic excision. Check §2.3 afterwards: its proof (BM21 Lemma 2.7) uses only the pullback A=B×_(B/J)A/I.

10. **F10** (P3) the docstring gives the wrong reason why the effective-epimorphism criterion is not statable

   - **Location.** `packages/ArcTopologyAndDescent/Suggested.lean` lines 22–24: the criterion "lack[s] the coherent symmetric monoidal Perf functor, scheme perfection and the general algebraic-space reconstruction interface".
   - **Witness.** BM21 Theorem 5.17's second assertion (line 1878) mentions only arc-covers (`IsSchemeArcCover` is in the file) and universally effective epimorphisms of qcqs perfect F_p-schemes; Perf enters only the proof. The pins lack a perfect-scheme predicate.
   - **Repair.** Give the reason for the criterion separately: the missing carrier is the category of qcqs perfect F_p-schemes. Alternatively, state the criterion with a real-bodied perfect-scheme predicate and Mathlib's `EffectiveEpi` over `IsPullback` squares in that full subcategory.

11. **F11** (P3) style

   - **Location.** Line 646: "with the kernel-containment repair in the the kernel condition stated here" (doubled "the", process wording). Line 1051 lists the same AdicEtaleGeometry §A1.0.5 contract twice. Line 1234 gives the `IsTorsionEtaleSheaf` API as one sentence, not bullets.
   - **Repair.** Line 646 → "(BM21, Lemma 4.3, pp. 25–26; the condition ker f⊆p is added to the printed statement.)". Remove the duplicate at line 1051. Split the line-1234 API into bullets: subobjects, quotients and extensions; étale restriction; detection on an affine étale basis.

12. **F12** (P3) sources.toml: BS22's locator field holds a CS24 locator

   - **Location.** `packages/ArcTopologyAndDescent/sources.toml` line 50, BS22 `locator`: "…Lemmas 8.8 and Remark 8.9, pp. 67–68; CS24 Lemma 2.2.3 p. 19; …".
   - **Repair.** Move "CS24 Lemma 2.2.3 p. 19" to the CS24 entry's locator (it already lists Lemmas 2.2.3–2.2.4). Correct "Lemmas 8.8" to "Lemma 8.8".

Files reviewed: `packages/ArcTopologyAndDescent/README.md` (1527 lines), `packages/ArcTopologyAndDescent/Suggested.lean` (124 lines), `metadata.toml`, `sources.toml`, and the `gaps` list of `design/plan.json`. There is no previous review of the package. Five findings are blocking (P2) and seven are P3 notes. The mathematics of the four Lean signatures is sound, and so is every sampled locator except one page number. The blocking findings concern supplier contracts: three declared gaps ask for results that earlier roadmaps already state, and one contract credits PrismaticCohomology §2.0 with a rule it does not state. The fifth is a false clause in §11.2.

## Verified sound

**Elaboration.** `lake env lean` on `Suggested.lean`, run from the content checkout at the manifest pins (Mathlib `6b7abb3c…`, Tau Ceti `a91d3aaf…`), finishes in 6 s. It gives exactly four warnings, all "declaration uses `sorry`", at lines 55, 73, 105 and 115. The one Tau Ceti import, `TauCeti.RingTheory.MvPowerSeries.TateAlgebra.Basic`, has its object file, and it is genuinely used: `MvPowerSeries.instAlgebraIsRestrictedSubring`, at `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:313`, supplies the `→ₐ[K]` in `HasAffinoidPresentation`. There is no `set_option`, `lemma`, `#eval`, sorry'd data, or another roadmap's module.

**Binder and type audit.** In a scratch copy, `#check @` was run on all nine declarations. The file has no `variable` block, so no binder can be dropped. All nine elaborated types match their README statements (§§2.5, 2.7, 10.0, 10.8). With `pp.universes`, every carrier is in universe u, and `F.H q` is `Sheaf.H.{u,u,u,u+1}`, an Ext group in `Type (u+1)`. `Sheaf.H` is `Ext` from the constant sheaf ℤ (`Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56`). Non-vacuity: `IsRingArcCover (RingHom.id A)` was proved in the scratch file with W=V and e=id, and it elaborated with no error. No change.

**Headline and padding check.** The README's headline list (Summary, line 3) matches the docstring: four headlines are stated and eight are named as not statable with the missing carrier. R10 is the one inaccuracy in a stated reason. One-tactic probes all fail: `simp` and `aesop` on `arc_affine_purity` (aesop leaves both directions open), `simp` on `arc_spectral_characterization`, and `infer_instance` and `simp` on `affinoid_artin_grothendieck`. No declaration restates a definition or a Check, so there is no padding.

**Dependency check.** `gate --depcheck … --movable` printed `depcheck: 29 roadmaps, 266 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The roadmap sits at ORDER line 123. Its suppliers are on main (SchemeAndStackFoundations, DerivedModuleAlgebra, AdicSpaces, AdicSpacesPartII, RigidAnalyticGeometry, AdicEtaleGeometry, PerfectoidSpaces, EnhancedDerivedSheaves, EtaleCohomologyFoundations) or are new-roadmap open pull requests earlier in the order (PrismaticCohomology, DiamondsAndVStacks, ClassicalAdicEtaleCohomology, PerfectoidQuotients, DerivedDeRhamCohomology, ResolutionOfSingularitiesCharacteristicZero, GeneralAlgebraicKTheory, SchemeKTheoryOperations). The citations resolver reported no cross-roadmap citation found nowhere. Its single lead, `sources.toml` at line 1512, is a file name and not a Lean name.

**Sample of sources (15 targets plus the 3 headline locators), checked at the text.**
- §0.1: BM21 Def 3.26, p. 22, line 922.
- §1.3: BS17 Def 2.7 and Prop 2.8, p. 6, lines 238 and 242. The README drops surjectivity of Y→X but covers by Y⊔Z→X; the sheaf condition reduces correctly because Y×_X Y = Δ(Y) ∪ E×_Z E.
- §1.7: RYD10 Def 2.2 (line 330), Prop 2.7 (389), Thm 2.8 (421) and Cor 2.9 (459), pp. 7–10. Also BS17 Remark 2.2 and Example 2.3 (line 186, pp. 4–5) and BM21 Prop 2.13 (line 447, p. 11).
- §3.6: BM21 Remark 3.16 and Construction 3.17 (lines 816 and 826, p. 20), Lemma 3.27 (line 928, p. 22), and BS17 Lemma 6.2 (line 966, p. 21).
- §4.4: BM21 Lemma 4.7 (line 1120, pp. 27–28); see R08.
- §7.7: BM21 Thm 5.16 (line 1843, pp. 44–45), BS17 Lemma 3.16 (line 601, p. 14), Thm 11.2 (line 1871, p. 40) and Thm 11.15 (line 1990, p. 43).
- §8.4: BM21 Prop 6.2 (line 1946, p. 47); BS22 Remark 8.9 is on p. 67 (R06).
- §9.1: BM21 Def 6.14 (line 2126, p. 51) and Def 6.19 (line 2203, p. 53).
- §9.2: BM21 Example 6.15 (line 2130).
- §9.7: BM21 Example 6.20(4) (lines 2207 and 2213, p. 53). The README's quantifier (one c for all n) is the intended one.
- §10.3: BM21 Prop 7.7 (line 2430, p. 58).
- §11.1: CS24 §2.2.1 (lines 711–736, pp. 18–19).
- §11.2: CS24 Lemmas 2.2.3–2.2.4 (lines 764–777); see R04.
- §11.3: BS22 Def 8.7 (line 2594) and Remark 8.9, with CS24 line 711. The rank-zero argument is correct: a p-complete field has p=0, and K→O_L, with L the completed algebraic closure of K((s)), is an injective local extension of rank one.
- §11.5: CS24 Thm 2.2.5 and Remark 2.2.6 (lines 800 and 821, pp. 20–21).
- Headline locators: BM21 Prop 2.11 (line 423, p. 11) and Prop 2.19 (line 557, p. 14) match the two Layer-2 signatures, including qcqs X, Y and every qcqs base change. BM21 Thm 7.3 (line 2340, p. 56) matches both affinoid signatures: |ℓ|=1 is exactly "ℓ prime to the residue characteristic" for K algebraically closed and complete.

Spot checks outside the sample: BM21 Def 1.14 (line 228), Lemma 4.13 (line 1288), Lemma 4.19 (line 1381), Lemmas 4.9–4.12 (lines 1209–1283), Thm 5.17 (line 1875), Thm 6.25 (line 2283) and Prop 7.6 (line 2382); BS17 Cors 2.14–2.15 (lines 387 and 426) and Remark 4.2 (line 708); BH16 Thm 1.5 (line 86, which matches gap:algebraic-space-perf-tannaka exactly: X qcqs, S arbitrary); HJ14 Prop 6.1 and Cor 6.5 (lines 693 and 738, printed pp. 464–465); CMM21 Thm 6.3 proof and Lemma 6.4 (lines 2180 and 2201); CS24 Lemmas 2.2.2, 3.1.2 and 4.2.6 (lines 755, 1207 and 1717). No passage is copied into the README; definitions are paraphrased.

**Pinned Mathlib declarations opened (file:line at the pin), all as the README describes.** `ValuationRing` (`RingTheory/Valuation/ValuationRing.lean:64`, which needs `IsDomain`), `PreValuationRing.cond` (:59), `ValuationRing.iff_local_bezout_domain` (:406), `IsLocalHom` (`Algebra/Group/Units/Hom.lean:270`), `Module.Flat.flat_iff_torsion_eq_bot_of_isBezout` (`RingTheory/Flat/TorsionFree.lean:92`), `Module.FaithfullyFlat.of_flat_of_isLocalHom` (`RingTheory/Flat/FaithfullyFlat/Algebra.lean:60`), `Ring.KrullDimLE` (`RingTheory/KrullDimension/Basic.lean:30`), `IsAlgClosed` and `IsAlgClosed.exists_root` (`FieldTheory/IsAlgClosed/Basic.lean:62,78`), `FirstOrder.Language.Ultraproduct.sentence_realize` (`ModelTheory/Ultraproducts.lean:154`), `SpectralSpace` (`Topology/Spectral/Basic.lean:38`), `IsSpectralMap` (`Topology/Spectral/Hom.lean:42`), `Scheme.smallEtaleTopology` (`AlgebraicGeometry/Sites/Etale.lean:50`), `AffineEtale.Spec`, `AffineEtale.sheafEquiv` and `isGrothendieckAbelian_sheaf_smallEtaleTopology` (`AlgebraicGeometry/Sites/AffineEtale.lean:47,140,149`), `pointSmallEtale` and the `HasEnoughPoints` instance (`AlgebraicGeometry/Sites/EtalePoint.lean:62,156`), `IsGrothendieckAbelian.hasExt` (`CategoryTheory/Abelian/GrothendieckCategory/HasExt.lean:36`), `DerivedCategory` (`Algebra/Homology/DerivedCategory/Basic.lean:87`), `IsAdicComplete` and `AdicCompletion` (`RingTheory/AdicCompletion/Basic.lean:56,171`), `MvPowerSeries.IsRestricted` and `.subring` (`RingTheory/MvPowerSeries/Restricted.lean:33,107`), and `IsAlmostIntegral`, `completeIntegralClosure` and `IsAlmostIntegral.isIntegral_of_nonZeroDivisors_le_comap` (`RingTheory/IntegralClosure/IsIntegral/AlmostIntegral.lean:26,31,86`). On §9.7, Mathlib's almost integrality and the README's total integral closure really differ. In a rank-two V, with t∈m∖p and y∈p, the element 1/t is almost integral with denominator y, since v(y·t^{-n})=(1,−n)>0 for all n, but 1/t is not in V^tic. So §9.7 duplicates nothing.

**Cross-roadmap citations resolved (main, or the head of a new-roadmap pull request).**
- PrismaticCohomology §2.0 (README line 2652): v- and arc-covers, arc_p, the formal arc site, BM21 Thms 5.4, 5.13, 6.4 and 6.11, Cor 6.17, and BS22 Prop 8.10. Everything the README credits to it is there except right cancellation (R05).
- PrismaticCohomology §§0.79–0.82.
- DiamondsAndVStacks §§D0.6, D0.11 (`IsSpectralSubmersion`), D0.12 (`isSpectralSubmersion_limMap`), D0.16, D0.18 and D0.22 (Set/Ab Boolean sheaves).
- ClassicalAdicEtaleCohomology: §6.1 (surjective, injective local and faithfully flat are equivalent); §6.3 (total-cohomology invariance, Huber Cor 4.2.7(i)–(ii)); §2.5 (Huber 3.2.2, 3.2.9 and 3.2.10); §2.6 (R02).
- SchemeAndStackFoundations §§0.9, 0.11–0.14, 0.24–0.25, 1.1–1.10, 2.1–2.3, 2.7, 2.11, 2.14, 2.15 (`gabber_affine_proper_base_change` for arbitrary henselian pairs), 4.7–4.8, 4.11–4.12 and 4.16.
- EtaleCohomologyFoundations §§F.0.1, 0.5–0.7, F.2.1 (proper base change for arbitrary torsion), F.2.6, F.3 (prime-to-characteristic affine vanishing only, which supports the need for a p-primary source; see R03 for that source) and G.1–G.3.
- EnhancedDerivedSheaves §§E0.1–E0.8, 0.1–0.4, E1.3–E1.6, E2.6–E2.8 (E2.8 = finite inductive level and perfect h-topology), E4.1–E4.3, Layer E5:descent and E5:abstract.5.
- SchemeKTheoryOperations §4.10 (`perfect_vHyperdescent` with Tor-amplitude strata).
- AdicEtaleGeometry §A1.0.5 (finite étale under henselian completion, t a nonzerodivisor; the bounded-torsion extension is genuinely missing, so that gap is minimal).
- AdicSpaces Layers 0–1.
- AdicSpacesPartII §§R0.3, R0.9, R0.13, R0.19, R1.1, R1.3 and R1.9.
- RigidAnalyticGeometry §§1.1–1.3 (Noether normalisation and dimension).
- PerfectoidSpaces §§P1.4–P1.8, P1.15, P1.24, P1.27, P2.2, P3.2, P3.9–P3.12 and P3.20.
- PerfectoidQuotients §§0.4–0.6.
- ResolutionOfSingularitiesCharacteristicZero §§5.1–5.2.
- DerivedModuleAlgebra §§0.2, 0.4, 0.7–0.8, 0.11–0.12, 0.14 and 1.1–1.9.
- DerivedDeRhamCohomology §§2.1–2.26.

**Declared gaps.** Six gaps; each slug appears in README and plan with the same supplier and `needs`. algebraic-space-perf-tannaka (BH16 Thm 1.5), constructible-etale-space-descent (no universally-submersive descent in SchemeAndStackFoundations) and bounded-torsion-punctured-approximation (A1.0.5 covers only a nonzerodivisor t) are precise and minimal. The other three are R01, R02 and R03.

**Ownership.** Objects searched with `roadmaps grep` over main and the 332 open heads, and by local grep over the board packages and the fetched supplier READMEs: arc-topology, arc-sheaf, arc descent, universally spectrally submersive, universally injective, Artin–Grothendieck, total integral closure, Milnor excision, and the nine Lean names of `Suggested.lean`. Only suppliers or downstream consumers turned up: EtaleDualityAndPerverseSheavesPartII, PerfectoidQuotientsPartII and the SchemeAndStackFoundationsPartII design all consume this roadmap. MotivesAndAlgebraicCyclesPartII's arc-covers are of Banach rings, a different object. No other roadmap owns BM21 Props 2.11 or 2.19 or Thm 7.3. No declaration in `Suggested.lean` shares a fully qualified name with another roadmap.

**README shape and Checks.** The README has the required headings in order. Every layer ends with Examples and Dependencies. There are 35 Checks lists, and every definition (§§0.1, 0.6, 1.1, 1.3, 1.7, 2.5, 2.7, 3.1, 3.2, 3.5, 3.8, 4.3, 5.1, 7.4, 8.1, 8.7, 9.1, 9.3, 9.4, 9.7, 10.0 three predicates, 11.1, 11.4) has three or more Checks. Every theorem has a locator. There are no LaTeX delimiters and no process words other than R11's.

### Adversarial pass (values computed)

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `IsRingArcCover` | id_A; k→0; 0→0; k[ε]/ε²→k | id: W=V, e=id (proved in Lean); k→0: needs a ring map 0→W into a domain, impossible, so false; 0→0: no map 0→V, so vacuously true; dual numbers: a(ε) is nilpotent in a domain, so 0, and W=V lifts | determines its object | none |
| `arc_affine_purity` | A=B=V; V→Frac V; k→0; 0→0; V a field | A=B=V: the class of 1 in V/(t²) maps to 1⊗1≠0 (both sides true); V→Frac V: V/(t)⊗Frac V=0, so the class of 1 maps to 0 and the lift fails (t would be a unit), both false; k→0: test M=k maps to 0 (false), LHS false; 0→0: both vacuous; field V: universal injectivity ⇔ K⊗_A B≠0 ⇔ a lift to a field | holds both ways | none |
| `IsSchemeArcCover` | Spec Frac V→Spec V; rank-two split | first: test id_V, a local lift would make t a unit, so false; split: every rank-≤1 test factors (BM21 Lemma 2.7), so true | correct | none |
| `arc_spectral_characterization` | rank-two split; Spec Frac V→Spec V; X=∅; ∅→Spec k | split: the subsets with open preimage are ∅, {0}, {0,p}, {0,p,m}, i.e. 4 of 8, exactly the opens; generic inclusion: {m} has preimage ∅ (compact open) but is not open, so RHS false = LHS; X=∅: both true; ∅→Spec k: surjectivity fails and the V=k test fails | holds | none |
| `HasAffinoidPresentation` | n=0; A=0; K[T]; K⟨T⟩/(T²) | T₀=K (restriction over a finite index type is vacuous); 0 is a quotient of T₀; K[T]: a surjection T_n→K[T] sends the unit 1+πX_i to the unit 1+πg, forcing g constant, so it fails; dual numbers present | discriminates | none |
| `IsTorsionEtaleSheaf` | Z/6; Z over a point; ⊕_r Z/ℓ^r | 6x=0; n·1=n≠0, so fails; a section supported in r≤R is killed by ℓ^R, and no common exponent exists | correct | none |
| `IsPrimePowerTorsionEtaleSheaf` | ℓ=0; ℓ=1; Z/r with r≠ℓ prime | 0¹·x=0, so everything passes (the theorem adds `Fact ℓ.Prime`); 1ⁿ·x=x, so only 0 passes; ℓⁿ·1≠0 in Z/r | correct | none |
| `affinoid_artin_grothendieck` | A=K, d=0; A=0; d>dim A; universe | H^q(Spec K,F)=0 for q≥1, consistent with q>1; Spec 0: every sheaf is terminal, so the Ext groups vanish; an upper bound weakens nothing; F.H q : Type (u+1) through HasExt.{u+1} | true (BM21 7.3(1)) | none |
| `affinoid_artin_grothendieck_prime_to_residue` | K=C_p with ℓ=p; char K=p; residue char 0 | \|p\|=1/p≠1, so excluded; (p:K)=0 has norm 0, so excluded; residue char 0 allows every ℓ, as BM21 does | matches BM21 7.3(2) | none |
| §0.1 aic | Q, T²−2; the zero ring; k×k; polynomial 1 | 0 rational roots; there is no monic polynomial of positive degree; roots taken coordinatewise; degree 0 is excluded (the literal source wording fails) | correct | source issue recorded |
| §0.3 cardinal bound | A=Q̄ | \|V₀\|≤\|K₁\|≤max(\|A\|,ℵ₀)=ℵ₀ | correct | none |
| §0.4 finite rank | rank-two lex valuation on k(x,y) | the subfield k(x) gives rank 1, k(x,y) gives rank 2; no common bound across infinite transcendence degree | correct | none |
| §0.5 prime square | v(y)=(1,0), v(x)=(0,1) | v(y/xⁿ)=(1,−n)>0, so y∈xⁿV and p≅pV_p; p=0 gives an identity side | correct | none |
| §0.6 intervals | [p,p]; [0,m]; rank two | κ(p); V; V_p and V/p | correct | none |
| §0.7 smooth approximation | k[ε]/ε²; k[t]_(t) | a colimit of reduced rings is reduced, but ε≠0 and ε²=0; Ω¹=V dt | correct | none |
| §1.1 universal descent | Z[0], identity cover | Tot=Z[0]; equalizer fib(0)=Z⊕Z[−1] with H¹=Z | correct | none |
| §1.3 abstract blowup | Z=X, Y=∅; Z=∅; Bl₀A² | the cover is id; Y≅X; E=P¹ | correct | none |
| §1.4 h-criterion | a non-surjective square | Y⊔Z covers and Y×_X Y=Δ(Y)∪E×_Z E, so the equalizer reduces to F(Y)×_{F(E)}F(Z) | correct | none |
| §1.5 perfect v | perfect rank-two split | a canonical cover that is not a v-cover (BS17 Remark 4.2 through Lemma 6.3) | correct | none |
| §1.6 approximation | A[x₁,x₂,…] | each stage is faithfully flat; the colimit is not finitely presented for A≠0 | correct | R05 |
| §1.7 subtrusive | rank-two split under every valuation base change W | ker⊄p: identity; pW=W: identity; otherwise Spec W_q⊔Spec W/pW, where any Z with open preimages equals some D(J), so open; the pair 0⇝m has no lift | submersive but not subtrusive, as BM21 line 457 says | none |
| §2.2 arc versus v | noetherian target | Rydh 2.8 with DVR tests | correct | R07 (duplicate sentence) |
| §2.3 Milnor squares | I=0; I=A | A×B→A has a section; B/J=0 forces A=B | trivial covers, as stated | R09 |
| §2.4 rank-one criterion | A=Frac V | no point over m, so no lift of 0⇝m | fails, as stated | none |
| §2.7 limits | BM21 Remark 2.18 chain | the preimage of (0) is βN∖N, not open, while compact opens descend | correct | none |
| §3.1 cotruncated | the point in spaces | Map(*,X)=X with no uniform bound | excluded, as stated | none |
| §3.2 finitary | R[x₁,x₂,…] | the identity does not factor through R[x₁..x_n] for R≠0 | fails, as stated | none |
| §3.4 h to v | BS17 Cors 2.14–2.15 | hypotheses match; continuity of cohomology is assumed explicitly | correct | none |
| §3.5 detection | the empty family for O | the empty cover fails, O(X)→pt, while the family "detects" vacuously | not detecting, as stated | none |
| §3.6 ultraproducts | one factor; nonprincipal ultraproduct (Remark 2.18) | fibre Spec A₁; rank >1 | correct | none |
| §3.7 obstruction | k[x,y] with a rank-two valuation | an injective local map into rank ≤1 would surject 3 primes onto ≤2 | correct | none |
| §3.8 Boolean sheaf | I=∅; I={1,2} | F(0) terminal; F(k₁)×F(k₂) | correct | none |
| §4.1 prime extension | V a field ⊂ W, p=0; V→V/q with p⊊q | pW=0 and the largest q is m_W, W⊗V=W_{m_W}=W; pW=0 contracts to q≠p | the kernel condition is needed, as stated | none |
| §4.3 excision | node k[x,y]/(xy) over k[y] and k[x]; the image sheaf H | k×_k k[y]=k[y] and k[x]×_k k=k[x]; (V→V_p, V→V/p) lies in the fibre product while id_V∉H(V) | correct | none |
| §4.4 interval induction | Remark 2.18 V with P avoiding (0) | the non-strict reading is vacuous and P≠all | needs strictness | R08 |
| §4.5 split descent | s∈ker∖p | pW=0 and W⊗V_p=W⊗κ(p)=0, so the square W→W, 0→0 | correct | none |
| §4.7 rank-one detection | k=−1 in Lemma 4.10 | (−1)-truncated values are ∅ or a point | correct | none |
| §5.1 bounded site | Spec Q⊔∐Spec Z_(p) over Z | the test Z→F_q fails for any finite subfamily missing q | not a cover, as stated | none |
| §5.2–5.5 topos | BM21 Lemma 4.19, 4.21–4.24 | statements match | correct | R01 (supplier) |
| §5.6 subcanonicity | h_{A¹} along k[ε]/ε²→k | sections k[ε]/ε² versus the equalizer k | fails, as stated | none |
| §6.1 strict henselian | aic V | supplied by ClassicalAdicEtaleCohomology §6.1 | correct | R07 |
| §6.5 étale objects | rank n; the fold {1,2}→{*} | n+1 vertices; the fold is a morphism but not injective | correct (E3) | none |
| §7.3 constructible | Λ=Z/4, Z/2 | Tor_i=Z/2 for all i (periodic resolution by ·2) | in Dᵇ_cons, not finite-Tor | none |
| §7.4–7.6 h-forms | Spec k[ε]/ε²; k[t]; aic V | F₀=k; F₁=k[t]dt; p=p² (divisible value group) | correct | none |
| §7.7 Perf | V→V_p×V/p | descendable, being a finite limit (BM21 line 1863) | correct | none |
| §7.8 canonical covers | rank 0 and rank 1 V | R≠0 from the equalizer; R′=K×k with R′⊗R′=R′ would force V≅R′, which is absurd | correct | R10 (docstring) |
| §8.1 formal datum | I=0; I=A; Z→Z_p | A≅B; all quotients 0; Z/pⁿ on both sides | correct | none |
| §8.4 completion | t a unit; t a pseudouniformizer | completion 0 (excluded); V̂={\|x\|≤1} | correct | R06 (page) |
| §8.5 counterexample | rank two, f∈m∖p | p⊂fⁿV for all n, so p⊂ker(V→V̂) | not a v-cover, as stated | none |
| §8.7 rigidity | Z_p→F_p | the ring functor changes, so it is not rigid | correct | none |
| §9.1 arc_t | R=V→R[1/t]; t a unit | a lift forces t to be a unit, so not a cover; no tests | correct | none |
| §9.3 arc_t-equivalence | Z_p[x]/(px)→Z_p | the p-power torsion is xF_p[x] and the quotient is Z_p | an equivalence | none |
| §9.4 E_t | complete aic V; t=0; t a unit | Λ in degree 0; R̂[1/0]=0; R̂_t=0 | correct | none |
| §9.7 total integral closure | Z_p with p^{-1}; Mathlib almost-integral | c≥n for all n fails; the two notions differ (y·t^{-n}∈V) | correct, not a duplicate | none |
| §9.10 excision | A→B integral, A[1/t]≅B[1/t] | tⁿbⁿ∈t^{n−c}A, so integral; nil kernel | matches BM21 6.25 | none |
| §10.1 rational domains | (X,1) at X=0 | min=0, max=1 | max is correct | R03 (gap) |
| §10.3 tubes | S_r with U_r↦πU_{r+1} | π^r·πU_{r+1}=π^{r+1}U_{r+1}=f, and f∈∩π^rV=0 | correct | none |
| §10.5 Künneth | ℓ=p in mixed characteristic | excluded by the hypothesis | correct | none |
| §10.7 constant vanishing | d=0,1,2 | 2d+2>2d+1, i.e. 2>1, 4>3, 6>5 | correct | none |
| §10.8 trace argument | S₃ with ℓ=2,3; C_ℓ | index 3≡1 (mod 2); index 2, and 2·2≡1 (mod 3); (g−1)^ℓ=0 | correct | none |
| §11.1 I-complete | I=A; Z_p→Q_p | V/IⁿV=0 means no tests; the Z_p test fails | correct | none |
| §11.2 product basis | one factor V and the open D(t) | the component Spec Frac V ≠ Spec V | false clause | R04 |
| §11.3 formal comparison | a p-complete field; F_p[ε]/ε² | char p, extended by K→O_L; a cover | correct | none |
| §11.4 arc_I | (2,3) in Z; (x,y) | D(2)∪D(3) is everything; (0,1)∉D(xy) | correct | none |
| §11.5 completed descent | the whole completion | R̂_I is I-henselian, so RΓ(R̂_I)=RΓ(R/I) (SSF §2.15) | correct | none |
| §12.2 local degree zero | a product of aic rank-one rings | finite covers split (algebraically closed fraction field) | correct | R02 (gap) |
| §12.4–12.7 | BS22 Prop 8.10; CMM21 6.3; CS24 2.2.2, 4.2.6 | hypotheses match | correct | none |
| Conventions | Z[−1]; C_p | H¹(Z[−1])=H⁰(Z)=Z; \|ℓ\|=1 ⇔ ℓ≠p | correct | none |
| Worked example | k((x))((y)) | v(y/xⁿ)=(1,−n)>0, so y∈∩xⁿV and x∈m∖p | correct | none |

## Not verifiable

- HUB96 (Huber's 1996 book) is paywalled and settled as `uncertified`. Its locators (Cor 3.2.2 p. 174; Thms 3.2.9–3.2.10 pp. 180–181; Cor 4.2.7 pp. 244–245) were checked only against the restatements in ClassicalAdicEtaleCohomology §§2.5 and 6.3, not against the text.
- BS17 "proof pp. 46–47" of Theorem 11.2(2) (§7.7): only the theorem and Theorem 11.15 were read; the proof pages were not read in full.
- Ownership against board packages whose files live on other board pull-request heads (for example SchemeAndStackFoundationsPartII and DiamondsAndVStacksPartII) was checked only through their local design or report files and the board index. Their package READMEs at their own heads were not opened.

## Source issues

- **Misprint** in BM21 at Definition 3.26, p. 22: the definition asks every monic polynomial to have a root, which the constant polynomial 1 never has in a nonzero ring; it should say every monic polynomial of positive degree; affects nothing.
- **Misprint** in BM21 at Remark 3.31, p. 23: it attributes the existence of a v-cover by a product of valuation rings to "Proposition 3.29"; it should be Lemma 3.29 with Proposition 3.30; affects nothing.
- **Misprint** in BM21 at the proof of Proposition 2.19, p. 15: the disjoint union of the rank-one interval rings V_i is indexed up to n, but V_i exists only for i<n; it should run from 0 to n−1; affects nothing.
- **Misprint** in BM21 at the proof of Proposition 3.32, p. 24: the displayed equivalence has F(Spec S) on both sides; it should map F(Spec S) to G(Spec S); affects nothing.
- **Gap** in BM21 at the proof of Proposition 6.3, p. 47: when the test valuation ring is a field it chooses a pseudouniformizer, which a field lacks; it should factor that case through R/I = R̂_I/IR̂_I; affects the proof.
- **Misprint** in BM21 at Example 6.20(4), p. 53: the definition of the total integral closure omits the quantifier on the exponent N; it should require one c working for every N≥0; affects nothing.
- **Misprint** in BM21 at the proof of Lemma 7.8, p. 58: it bounds below the minimum of the absolute values of unit-ideal generators, which can vanish (for (X,1) at X=0); it should use the maximum; affects the proof.
- **Misprint** in BS22 at footnote 15 in the proof of Theorem 9.1, p. 72: the valuation rings are said to have algebraically closed residue fields; splitting of finite covers needs algebraically closed fraction fields; affects the proof.
- **Misprint** in HJ14 at the proof of Proposition 6.1, p. 464: it needs the higher direct images to vanish for degrees above one, then reduces to degree one; it should say degrees at least one; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d11cfe3", "job": "REV-PKG-ArcTopologyAndDescent", "model": "opus", "worker": "fable-rev45"} -->
