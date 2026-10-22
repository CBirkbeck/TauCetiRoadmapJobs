<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/169#issuecomment-6336412910 -->
Red team round 1 pass b (claude) of 0555e50

Verdict: needs_changes

1. **F01** (P1) PS.6.7 consumes two roadmaps that are later in the merge order, under superseded names, and the cited nodes do not exist

   **Location:** `packages/PeriodsAndSpecialValues/README.md:170`: “### GanGrossPrasadConjecturesForClassicalGroups GGP.8 and ArithmeticLevelRaisingAndBipartiteEulerSystems”; also `README.md:174`, `:1018`, `:1028`, `:1031`, `:1051`.

   **Claim:** The two suppliers exist today as `SelmerIwasawaCohomologyPartII` (open roadmap PR, draft) and `GanGrossPrasadUnitaryGroups` (board package); neither uses the name the package gives it. In the merge order on main `PeriodsAndSpecialValues` is line 152 while `SelmerIwasawaCohomologyPartII` is line 174 and `GanGrossPrasadUnitaryGroups` line 186, so PS.6.7 is an upward dependency on both. At their current texts, `GGP.8` is a single automorphic period identity (§7.4 `ggp8UnitaryPeriodIdentity`), none of the five node slugs `GGP.8/arithmetic-period-data`, `finite-diagonal-period`, `definite-integral-comparison`, `definite-diagonal-nonvanishing`, `weak-arithmetic-proposition` occurs, and the supplier explicitly disclaims the definite-period witness of LTXZZ Lemma 8.2.1. Part II states the rank-zero theorem (§8.1) only under an extra “uniform rank-one span hypothesis” and says the L-value-to-witness step “requires an independently supplied theorem”; PS.6.7's `rankZero_of_admissible` records neither. So LTXZZ Lemma 8.2.1 has no owner anywhere, and `bbk_rankZero_of_admissible`, `bbk_rankOne_of_classNeZero` are stated as supplied theorems with hypotheses weaker than the only candidate supplier's. (Extends pass a F02, which recorded the two names as absent; the current names, their order positions and their texts are new.)

   **Witness:** merge-order `ORDER.txt` on main lines 152, 174, 186; `TauCetiRoadmap/SelmerIwasawaCohomologyPartII/README.md:1` (title), `:9`, `:924–928` (“assume … the uniform rank-one span hypothesis below”), `:982` (“requires an independently supplied theorem converting L(1/2,Π₀×Π₁)≠0 to the definite witness”); `packages/GanGrossPrasadUnitaryGroups/README.md:1`, `:1369–1371`, `:1413` (“The period-witness premise … has an arithmetic owner … requires a continuation after this roadmap”); zero hits for the five slugs. LTXZZ Theorem 8.2.2 itself: cached legal copy, ltxzz-published lines 7583–7589 (p. 308–309).

   **Exact repair text:** Replace the contract at lines 170–174 by: “### SelmerIwasawaCohomologyPartII §§1.6, 4.2–4.3, 8.1–8.2 — the admissibility predicate, the diagonal graph cycle and projected Abel–Jacobi map, and the rank-zero and rank-one theorems, each with that roadmap's uniform realised-Frobenius span hypotheses. The definite-period witness of LTXZZ Lemma 8.2.1 is not supplied by any roadmap; `bbk_rankZero_of_admissible` takes it as an explicit hypothesis.” and “### GanGrossPrasadUnitaryGroups §7.4 `ggp8UnitaryPeriodIdentity` — the period identity only; no arithmetic nodes.” Then either (a) the board re-places PeriodsAndSpecialValues after both suppliers in the merge order, or (b) if the order stands, delete PS.6.7's three imported theorems and the two contracts, keep PS.6.6's predicate, and state PS.6.7 as the transport theorem `bbk_transport_of_witness` conditional on a `BBKRankZeroOne` witness. In both cases add the span hypotheses of Part II §8.1–8.2 to the statements of `rankZero_of_admissible` and `rankOne_of_classNeZero`.

2. **F02** (P1) SelmerIwasawaCohomology §§4.3, 4.5, 4.6 do not exist

   **Location:** `packages/PeriodsAndSpecialValues/README.md:164`: “L4: period fundamental sequences (4.3), crystalline and de Rham realization data (4.5), small-weight filtered Frobenius modules and their comparison (4.6–4.7)”; also `:889`, `:901`, `:913`.

   **Claim:** Layer 4 of SelmerIwasawaCohomology begins at §4.7; there are no §§4.1–4.6. The three contents attributed to §§4.3, 4.5, 4.6 are imports of that roadmap from FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P3 (fundamental period sequences) and §R07.P5 (crystalline and de Rham realization data). PS.6.1, PS.6.2 and PS.6.5 cite a supplier for sections that do not exist where they are cited.

   **Witness:** `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:1863–1865` (“## Layer 4 …” followed directly by “### 4.7 Small-weight crystalline realization and extension exactness”); `:1933` (“*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P5 (Crystalline and de Rham realization data); … §R07.P3 (Fundamental period sequences …)”); `:121`.

   **Exact repair text:** At line 164 write “L4: small-weight crystalline realization and extension exactness (4.7), the Bloch–Kato local condition (4.9), global finite Selmer reductions and conjugation (4.24) and uniform local annihilation away from p (4.25).” Add a supplier subsection “### FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P3, §R07.P5 — fundamental period sequences with continuous sections; crystalline and de Rham realization data (PS.6.1, PS.6.2, PS.6.5).” Repoint lines 889, 901, 913 and the Dependencies lines accordingly.

3. **F03** (P2) The arbitrary-pair comparison and the period evaluation map are MotivesAndAlgebraicCycles targets, not inputs or PS.2 constructions

   **Location:** `packages/PeriodsAndSpecialValues/README.md:120`: “the de Rham input contract of MotivesAndAlgebraicCycles MC.5 (`completion-de-rham-interface`) … the general case extends C5 and is needed by MC.5 and PS.2.1 alike”; `:522`: “This layer owns the actual numerical evaluation”; `:526`, `:549`.

   **Claim:** No node `completion-de-rham-interface` exists in MotivesAndAlgebraicCycles. That roadmap owns the relative/arbitrary-pair de Rham comparison as its own construction target (§5.7), and it constructs the marked evaluation `per : P → ℂ` with `per(ℓ) = 2πi` (§§6.7, 6.9) and lists PeriodsAndSpecialValues as a consumer of that evaluation. PS.2.1 plans `periodEvaluation` again and PS.2.2 plans its identification with the comparison point, which is MC's torsor theorem with its marked point. What another roadmap plans is imported, never planned again. (Pass a F03 asked for a registered gap for the arbitrary-pair comparison; no gap is needed: MC §5.7 already owns it.)

   **Witness:** `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:53` (“This relative-pair construction belongs to §5.7; smooth-proper de Rham comparison does not imply it.”), `:1008` (“Construct the nonproper comparison for every smooth separated finite-type variety”), `:1159` (“Construct the marked evaluation of this formal algebra”), `:1194` (“gives a marked point `per:P→ℂ`, evaluating a period by the pairing `γ(Φω)` and sending `ℓ` to `2πi`”), `:13`; zero hits for `completion-de-rham-interface`.

   **Exact repair text:** In the MC contract replace the `completion-de-rham-interface` sentence by “MC §5.7: the relative de Rham comparison for finite-type pairs (PS.2.1); MC §6.7 and §6.9: the full algebra `P = P_eff[ℓ⁻¹]` and its marked evaluation `per : P → ℂ` with `per(ℓ) = 2πi` (PS.2.1–PS.2.3).” Delete the paragraph at lines 120 and the ownership sentence at 522. Restate PS.2.1 as “Properties of MC's `per`: `periodEvaluation_symbol`, `periodEvaluation_stokes` (with the boundary sign ∫_γ δα = ∫_{∂γ} α), `periodEvaluation_mul` (graded product sign), `periodEvaluation_tate`, all proved from MC §§5.7, 6.9”, and PS.2.2 as the comparison of PS.0's `I = β⁻¹` convention with MC's β-point, deleting `periodEvaluation_eq_comparisonPoint` as a construction.

4. **F04** (P1) The modular period adapter has no supplier for the critical-value formula it imports

   **Location:** `packages/PeriodsAndSpecialValues/README.md:457`: “Import the AL.5 critical-value formula with its modular-symbol periods Ω_f^± (built from TauCetiRoadmap ModularForms Layer 8)”; also `:128`, `:471`.

   **Claim:** AutomorphicLFunctionsAndLocalFactors AL.5 takes the nonzero periods Ω⁺, Ω⁻ and “its proved critical-value algebraicity theorem” as inputs and does not construct either; it never cites ModularForms. ModularForms Layer 8 on main supplies modular symbols and the Eichler–Shimura period map, not the algebraicity of `L(f, m)` divided by the signed period. So `modularMotive_period` and `modularMotive_deligneAlgebraic` rest on an unowned theorem. The owner exists earlier in the merge order: ModularSymbolsPadicLFunctions Layer 1.

   **Witness:** `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:2931` (“takes an actual holomorphic newform f … nonzero periods `Ω⁺` and `Ω⁻` and its proved critical-value algebraicity theorem”); `TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:30–31`, `:1307` (“### 1.1 Period lines and integral periods”), `:1364` (“### 1.2 The twisted Mellin formula and algebraicity of critical values”); `ORDER.txt` on main line 105.

   **Exact repair text:** Add the supplier “### ModularSymbolsPadicLFunctions §§1.1–1.2 — signed period lines Ω_f^± and saturated integral periods; the twisted Mellin formula and the algebraicity of `L(f, χ̄, j+1)/Ω_f^{±}` for 0 ≤ j ≤ k (PS.1.6).” At line 457 write “Import the signed periods and the algebraicity theorem from ModularSymbolsPadicLFunctions §§1.1–1.2, and the finite Euler corrections and leading terms from AL.5”; delete “built from TauCetiRoadmap ModularForms Layer 8” and the AL.5 attribution of the formula at lines 128 and 471.

5. **F05** (P2) Deligne's virtual-object determinant is already a target of NoncommutativeAndEquivariantIwasawa, not a shared gap on GeneralAlgebraicKTheory

   **Location:** `packages/PeriodsAndSpecialValues/README.md:180`: “This is the input that NoncommutativeAndEquivariantIwasawa NE.2 and NE.7 also take from GeneralAlgebraicKTheory Layer 4”; also `:39`, `:610`, `:627`.

   **Claim:** NE §2.7 constructs `noncommutativeDeterminant` (Deligne's Picard groupoid V(R) with `detPerfect_quasiIso`, `_exact`, `_acyclic`, `_shift`, base change) from GAK §§3.14, 5.7, 5.10, 5.11, 6.19 and PadicMeasuresIwasawaAlgebras §5.1, and NE.7.15 consumes “[2.7] (the determinant functor)”. NE takes nothing of the kind from GAK Layer 4. The package's `virtualPerfectDeterminant` (PS.3.1, PS.5.1) re-plans that target, and its description of NE's supply is false. NE is line 25 of the merge order, so it may be cited.

   **Witness:** `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:1069` (“### 2.7 The localized `K₁` of Fukaya and Kato”), `:1079` (“Construct `noncommutativeDeterminant`: Deligne's Picard groupoid `V(R)` …”), `:1094` (its Needs line), `:96` (its GAK contract).

   **Exact repair text:** Replace the “Virtual objects” paragraph (line 180) by “### NoncommutativeAndEquivariantIwasawa §2.7 — `noncommutativeDeterminant`: Deligne's Picard category V(R) of virtual objects of finitely generated projective R-modules with its universal determinant functor on bounded perfect complexes, with `detPerfect_quasiIso`, `detPerfect_exact`, `detPerfect_acyclic`, `detPerfect_shift`, base change, and agreement with PadicMeasuresIwasawaAlgebras §5.1 for commutative R (PS.3.1, PS.5.1).” Delete `virtualPerfectDeterminant` from PS.3.1 and PS.5.1 and the clause “as specified in the GeneralAlgebraicKTheory supplier contract” at lines 610 and 627; keep GAK §§4.15–4.17 for the relative groups only.

6. **F06** (P2) IntegralIwasawaTheory §11.7 is quoted without its totally-real hypothesis on F

   **Location:** `packages/PeriodsAndSpecialValues/README.md:192`: “for every prime p and every finite abelian extension F of a totally real field k, the inverse determinant of the Iwasawa complex of F_∞ is generated by the equivariant p-adic L-function”; also `:856`.

   **Claim:** The supplier's `integralDeterminantMainConjecture` is stated for a finite totally real abelian extension F/k and a finite set S ⊇ S_∞ ∪ S_p ∪ S_ram. The package drops “totally real” on F and the set S. The abelian Tate case `abelianTate_ETNC` for a general abelian L/ℚ (not totally real) therefore needs the CM twist of §11.1 and the descent, which the package owns, but it must quote §11.7 with its hypotheses.

   **Witness:** `TauCetiRoadmap/IntegralIwasawaTheory/README.md:1454` (“for any prime p, totally real k, finite totally real abelian F/k, `S⊇S_∞∪S_p∪S_ram`”).

   **Exact repair text:** At line 192 write “for every prime p, every totally real field k, every finite totally real abelian extension F/k and every finite set S ⊇ S_∞ ∪ S_p ∪ S_ram, the inverse determinant of the Iwasawa complex of F_∞ over S is generated by the equivariant p-adic L-function …; the CM minus part is reduced to this case by §11.1.” At line 856 write “descends, at each odd p, the integral determinant main conjecture of IntegralIwasawaTheory §11.7 for the maximal totally real subfield and its §11.1 twist for the CM part to finite level”.

7. **F07** (P2) ArithmeticGaloisDuality D7.5 has no compactly supported complex “without the places above p”

   **Location:** `packages/PeriodsAndSpecialValues/README.md:160`: “D7.5 (continuous cochains with compact support, including the version without the places above p, and the real complete Tate cochains at 2)”; also `:745`, `:759` (“compact support without p”).

   **Claim:** D7.5 defines compact support for a finite set S of places containing those above p and the archimedean ones; the only reduced model (under p odd or no real places) drops the archimedean terms, not the p-adic ones. The variant PS.4.4 cites does not exist at the supplier; the real complete Tate cochains at 2 do.

   **Witness:** `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:5391` (“### D7.5 Compact support and derived global duality”), `:5394` (“a finite set of places containing those above `p` and the archimedean ones”), `:5405`, `:5739–5744` (the p = 2 real-place Tate cochains).

   **Exact repair text:** At line 160 write “D7.5 (continuous cochains with compact support for a finite set S of places containing those above p and the archimedean ones, derived global duality, and the real complete Tate cochains at 2)”. At lines 745 and 759 replace “compact support without p” by “compact support with the real places and the places above p in S”.

8. **F08** (P2) The K3 cycle-lattice contract cites a layer and three targets that do not exist and attributes to the supplier a statement it does not make

   **Location:** `packages/PeriodsAndSpecialValues/README.md:104–106`: “The existing target `K3.0/cycle-lattice`, together with `K3.0/k3-surface` and `K3.0/ns-lattice`, supplies the integral Betti cup lattice of a smooth projective complex K3: free of rank 22, even, unimodular and of signature (3,19)”; also `:1213`, `:1229`.

   **Claim:** K3SurfacesAndSymplecticBoundedness has Layers 1–8, no “K3.0”, and none of the three names in its README, Suggested.lean or metadata. Its §3.3 `IsK3.complexIntegralBetti` gives freeness with ranks (1,0,22,0,1), the Hodge numbers and the injectivity of c₁ with image ker(H²(ℤ) → H²(O)); it states neither evenness nor unimodularity nor signature (3,19) of H²(X,ℤ) (its only signature statements concern Pic). PS.8.4's application of IntegralLattices 5H needs exactly those three facts, so they are an unowned prerequisite as written.

   **Witness:** `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:451–453` (“### 3.3 Integral topology of projective complex K3 surfaces … `IsK3.complexIntegralBetti` … Hⁱ(M,ℤ) is free of ranks (1, 0, 22, 0, 1)”), `:506–508` (`IsK3.picardLattice`, signature (1,ρ−1)); zero hits for “3,19”, “K3.0”, “cycle-lattice”, “ns-lattice”, “k3-surface”.

   **Exact repair text:** Replace lines 104–106 by “### K3SurfacesAndSymplecticBoundedness §3.3, §4.2 — `IsK3.complexIntegralBetti` (Hⁱ(X,ℤ) free of ranks (1,0,22,0,1), c₁ : Pic(X) → H²(X,ℤ) injective with saturated image) and `IsK3.picardLattice`. What K3SurfacesAndSymplecticBoundedness must provide (gap:k3-betti-even-unimodular): the cup form on H²(X,ℤ) of a projective complex K3 is even, unimodular and of signature (3,19) (Huybrechts, Chapter 1, Proposition 3.5, pp. 15–17).” Repoint lines 1213 and 1229 to §3.3 and the gap slug, and register the slug in the plan's gaps.

9. **F09** (P2) The ArithmeticGaloisRepresentations contract mislabels its sections and cites a statement the supplier does not make

   **Location:** `packages/PeriodsAndSpecialValues/README.md:124`: “Layer 2 (2.4 Weil–Deligne representations and purity, 2.5 local factors and Frobenius semisimplification) and Layer 3 (conductors, local–global compatibility). The node `global-conductor-and-prime-to-p-conductor` …”; also `:122`, `:376`, `:490`.

   **Claim:** The labels “R01.2”, “R01.3” occur nowhere in the supplier. §2.4 is the arithmetic Weil–Deligne adapter and purity is §2.6; Frobenius semisimplification is imported there from SmoothRepresentationsOfLocalGroups SR.5.2, not proved in §2.5; local–global compatibility is not a Layer 3 target (it appears only in the supplier's downstream list); and no node `global-conductor-and-prime-to-p-conductor` exists — the content is `Conductor.globalConductor` and `Conductor.primeToPConductor` in §3.3.

   **Witness:** `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:1768` (“### 2.4 Arithmetic Weil–Deligne adapter”), `:1867` (“### 2.5 Local factors”), `:1869`, `:1981` (“### 2.6 Monodromy filtration and purity”), `:2664–2672` (“**Global conductors.** … `Conductor.globalConductor ρ Σ`, `Conductor.primeToPConductor ρ̄`”), `:5190`; zero hits for “R01” and for the slug.

   **Exact repair text:** Replace lines 122–124 by “### ArithmeticGaloisRepresentations §§2.4–2.6, §3.3 — the arithmetic Weil–Deligne adapter (2.4), local factors (2.5; Frobenius semisimplification is SmoothRepresentationsOfLocalGroups SR.5.2), monodromy filtration and purity (2.6), and `Conductor.globalConductor`, `Conductor.primeToPConductor` (3.3), which supply an ideal away from the coefficient prime. Local–global compatibility is not supplied by this roadmap.” Replace “R01.2”/“R01.3” at lines 34, 376, 490 and 519 by these section numbers, and move the local–global compatibility input of PS.1.1 to AutomorphicLFunctionsAndLocalFactors AL.4 `local-parameter-comparison`, which takes a compatible realization as input.

10. **F10** (P3) Supplier labels, nodes and contract clauses that do not match the suppliers' current texts

    **Location:** `packages/PeriodsAndSpecialValues/README.md:138` (“EtaleDualityAndPerverseSheaves EDC.2:pairings”), `:216` (“ModularCurvesPartII R13.3 … `generalized-tate-n-gon`”), `:218–220` (“Polylogarithms P.1 … Li_n on the unit disc”), `:204` (“CR.7 … horizontal Frobenius and cup pairing”), `:112` (“MC.2–MC.6”), `:188` (“NE.7.13 … and its rational version”), `:168` (`uniform-strong-realization-for-polarized-systems`), `:90` (“the Mordell–Weil regulator with the index-squared law”).

    **Claim:** (i) The supplier has no “EDC.” labels; its Layer 2 is perverse hearts, and the two duality nodes are Layer 0 §§0.5–0.6. (ii) ModularCurvesPartII §13.3 is the geometric integral Hecke algebra; the Tate n-gon with j = q⁻¹ + 744 + ⋯ is §3.6, and the slug does not occur. (iii) The Polylogarithms package has no “P.” numbering and no Layer 1, and says Li_n is owned by PolylogarithmFunctions (merge order line 36). (iv) Cup products are CrystallineCohomology CR.3, not CR.7. (v) MotivesAndAlgebraicCycles labels only “MC.2”; its other layers are “Layer 3–6”. (vi) The rational interpolation formula is NE.7.14, a separate section. (vii) The AG2.6 heading now reads “Uniform strong realization of polarized systems”; the explicit anchors were removed. (viii) EllipticCurves Layer 6 defines the regulator with basis independence only; it states no index-squared law, which is PS.6.3's own `ellipticRegulator_index`.

    **Witness:** `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:663`, `:776`, `:820`, `:1339`; `TauCetiRoadmap/ModularCurvesPartII/README.md:1101` (“### 3.6 Generalized Tate n-gons”), `:1124`, `:3578`; `packages/Polylogarithms/README.md:11`, `:67`; `TauCetiRoadmap/CrystallineCohomology/README.md:35`, `:2143`; `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:324`, `:442`; `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:3519`; `TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:2775`; `TauCetiRoadmap/EllipticCurves/README.md:1225–1227`.

    **Exact repair text:** (i) “EtaleDualityAndPerverseSheaves Layer 0, §§0.5–0.6 (`galoisFrobeniusEquivariance`, `adicAndRationalPoincareDuality`)”. (ii) “ModularCurvesPartII §3.6 (generalized Tate n-gons, with j = q⁻¹ + 744 + O(q))”. (iii) “### PolylogarithmFunctions — the principal classical polylogarithm Li_n, equal to its series on the open unit disc (PS.9.3)”, deleting the Polylogarithms contract. (iv) “CR.3 (crystalline cup products) and CR.7 (coefficients, horizontal Frobenius)”. (v) “MotivesAndAlgebraicCycles MC.2 and Layers 3–6”. (vi) “NE.7.13 the interpolation formula for the Tate motive and NE.7.14 its version for ℚ-rational characters under Leopoldt”. (vii) cite “AG2.6 ‘Strong coefficient field’ and ‘Uniform strong realization of polarized systems’” by heading. (viii) at line 90 delete “with the index-squared law”.

11. **F11** (P3) Two suppliers carry the `TauCetiRoadmap` prefix although they are not on main

    **Location:** `packages/PeriodsAndSpecialValues/README.md:27`: “**TauCetiRoadmap NumberFieldArithmetic**”; `:32`: “**TauCetiRoadmap IntegralHeckeAndGaloisDeterminants** Layer 0, §0.6”; also `:182`, `:678`, `:771`, `:815`, `:880`.

    **Claim:** NumberFieldArithmetic exists only under `Completed/`; a supplier that exists only as `Completed/X` is cited as `[X](../../Completed/X/README.md)`. IntegralHeckeAndGaloisDeterminants is not on main at all (neither `TauCetiRoadmap/` nor `Completed/`); it is line 23 of the merge order, so it may be cited, but only as an open roadmap by name, like the package's other order-only suppliers. §0.6's content is as claimed.

    **Witness:** `Completed/NumberFieldArithmetic/README.md:8–9`; absence of `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/` and `Completed/IntegralHeckeAndGaloisDeterminants/` on main; `ORDER.txt` on main line 23.

    **Exact repair text:** At line 27 write “[NumberFieldArithmetic](../../Completed/NumberFieldArithmetic/README.md)”; at lines 32 and 182 write “### IntegralHeckeAndGaloisDeterminants §0.6” without the prefix, and likewise at 678, 771, 815, 880.

12. **F12** (P3) `Suggested.lean` imports a Tau Ceti module it does not use

    **Location:** `packages/PeriodsAndSpecialValues/Suggested.lean:2`: “import TauCeti.Geometry.Hodge.Tate.Basic”.

    **Claim:** The only mentions of `TauCeti.Hodge.tate` are in the module docstring (line 19) and a docstring (line 80); no declaration refers to the module. A probe copy with line 2 deleted elaborates against the pinned Mathlib with exit 0 and 44 `declaration uses sorry` warnings and no other diagnostic. Policy: `import Mathlib` plus only the `TauCeti.*` modules actually used.

    **Witness:** probe elaboration of the copy without line 2: exit 0, 44 sorry warnings; `Suggested.lean:19`, `:80` are comments.

    **Exact repair text:** Delete line 2. Keep the docstring sentence about `TauCeti.Hodge.tate` as prose.

13. **F13** (P3) Eight sorried theorems close with one tactic from the pinned Mathlib

    **Location:** `packages/PeriodsAndSpecialValues/Suggested.lean:49` (`comparisonMatrix_det_basisChange`), `:71` (`tatePeriod_add`), `:159` (`gammaℂ_eq_two_mul_gammaComplexBCGP`), `:164` (`gammaComplexBCGP_one`), `:206` (`tateTorsorEvaluation_T`), `:325` (`quarticMonodromy_isometry`), `:329` (`quarticMonodromy_product`), `:335` (`quarticMonodromy_infinity_unipotent`).

    **Claim:** Stated as targets but each is one tactic from Mathlib; the proofs below were checked in a probe copy of the file (exit 0 for these examples). They should be proved in place or dropped as targets (the matrix facts can stay as proved `example`s under their definitions).

    **Witness:** probe copy, examples appended after the file's declarations, elaborated with the file's own definitions.

    **Exact repair text:**
    ```lean
    theorem comparisonMatrix_det_basisChange {n : ℕ} (A C P : Matrix (Fin n) (Fin n) ℂ) :
        (C⁻¹ * P * A).det = (C.det)⁻¹ * P.det * A.det := by
      simp [Matrix.det_mul, Matrix.det_nonsing_inv, Ring.inverse_eq_inv']

    theorem tatePeriod_add (m n : ℤ) : tatePeriod (m + n) = tatePeriod m * tatePeriod n := by
      simp [tatePeriod, zpow_add₀ Complex.two_pi_I_ne_zero]

    theorem gammaℂ_eq_two_mul_gammaComplexBCGP (s : ℂ) :
        Complex.Gammaℂ s = 2 * gammaComplexBCGP s := by
      simp [Complex.Gammaℂ, gammaComplexBCGP, mul_assoc]

    theorem gammaComplexBCGP_one : gammaComplexBCGP 1 = 1 / (2 * (Real.pi : ℂ)) := by
      simp [gammaComplexBCGP, Complex.cpow_neg_one]

    theorem tateTorsorEvaluation_T (n : ℤ) :
        tateTorsorEvaluation (LaurentPolynomial.T n) = tatePeriod n := by
      simp [tateTorsorEvaluation, tatePeriod, LaurentPolynomial.eval₂_T]

    theorem quarticMonodromy_isometry (i : Fin 5) :
        (quarticMonodromy i).transpose * quarticGram * quarticMonodromy i = quarticGram := by
      revert i; decide

    theorem quarticMonodromy_product :
        quarticMonodromy 4 * quarticMonodromy 3 * quarticMonodromy 2 * quarticMonodromy 1 *
          quarticMonodromy 0 = 1 := by
      decide

    theorem quarticMonodromy_infinity_unipotent :
        (quarticMonodromy 4 - 1) ^ 3 = 0 ∧ (quarticMonodromy 4 - 1) ^ 2 ≠ 0 := by
      decide
    ```

## Verified sound

- Read all 2,020 lines of `README.md` (78 numbered target blocks, 10 layers, Corrections, Worked examples, Downstream consumers, References) and all 725 lines of `Suggested.lean` (139 declarations: 53 definitions, 48 theorems, 38 examples). No `lemma`, no `#eval`/`#print`/`#synth`, no `True` placeholder, no sorried data; the one `set_option` is pass a F01.
- Elaboration: as submitted, the file fails at line 1 only because the compiled object of `TauCeti.Geometry.Hodge.Tate.Basic` is missing in the review environment (see Not verifiable). The probe copy without that import elaborates with exit 0 and exactly 44 `declaration uses sorry` warnings and no other diagnostic. Every sorried statement is therefore well typed; the import is unused (F12).
- One-tactic probe: 22 attempts; 8 close (F13); 14 do not close with a single tactic (`realGammaRegular_iff`, `unitCritical_iff`, `riemannZeta_two_div_tatePeriod`, `fixedPeriodAlgebraic_rescale`, `legendre_radicand_lower`, `quarticPeriodLine_isotropic`, `quarticLocalRatio_reflection`, `quinticResidue_nilpotent`, `quinticBoundary_horizontal`, `quinticBoundary_pairing`, `multipleZeta_nil`, `dworkCoeff_two`, and others not tried). Four of these close with short multi-tactic scripts (`unfold legendreRadicand; nlinarith [sq_nonneg (1 - u ^ 2), hlam.1]`; `simp [quarticPeriodLine, quarticGram, dotProduct, Matrix.mulVec, Fin.sum_univ_three]; ring`; `ext i j; fin_cases i <;> fin_cases j <;> simp [quinticBoundaryMatrix, quinticBoundaryPairing, Matrix.mul_apply, Fin.sum_univ_four] <;> ring`; `rw [riemannZeta_two, tatePeriod]; field_simp; ring_nf; simp [Complex.I_sq]`), reported for information, not as findings.
- Adversarial pass on every Lean statement: degenerate instances tried and found consistent — rank 0 (`det_fin_zero`, singular `C` gives `C⁻¹ = 0` on both sides of `comparisonMatrix_det_basisChange`), `tatePeriod 0`, `UnitCritical` at 0, ±1, 2, −2, `OffDiagonalCritical 0 1`, zero value/zero period in `FixedPeriodAlgebraic`, `arctan_period_bounds` at N = 0, `legendreMidpoint` at N = 0 excluded, `quinticBoundaryMatrix` at p = 0 (both identities hold trivially), `DescendingTuple []` (singleton, term 1), `mzv_summable_iff` for `[]`, `[1]`, `[1,2]`, `hoffman_count` at N = 0, 1, `numerical_spanning` and `zagier_evaluation` at the empty index (both need `multipleZeta [] = 1`, which is stated), `mzv_span_finrank_le` at N = 1. Conventions recomputed by hand: `I = β⁻¹` on ℚ(±1), ℚ(0); Deligne (5.1.8) direction (matches the cached legal copy, Deligne line 635, p. 16); the elliptic worked case (uniformizer expansion x = 2s⁻² + 3 + O(s²), η = −2s⁻²ds + O(1), polar primitive 2/s; the substitutions giving B = [[2K, 2J],[2iK, 2iH]], H in the u-variable, 0 < J < K < H, det B = 4iK(H − J)); the critical-integer rules for off-diagonal and diagonal blocks; Γ_{ℂ,B}(1), (2), (3); ε(R)ε(R^∨) = N; the heap identity PQ⁻¹R versus RQ⁻¹P; Tate cohomology parities; the predicted order −1 for ℚ(1); the pulled-back operator (all four coefficients equal L_z written in t with θ_z = −θ_t/4).
- Checks recomputed numerically (Python, exact rationals): all five quartic monodromy matrices are G₀-isometries, M_∞M₄M₃M₂M₁ = 1, (M_∞ − 1)² ≠ 0 = (M_∞ − 1)³; the dual ∞-action on (i, −1, −2) gives p′ = 4 + i and the direct action gives −(32 + i)/(63 + 4i); A₁..A₃ = 24, 2520, 369600; g₁, g₂ = 104, 12276; h₀..h₃ = 0, 0, 10816, 2293824; q = z + 104z² + 15188z³ + 2585184z⁴; Z = q − 104q² + 6444q³ − 311744q⁴; 2·104² − 6444 = 15188; the q³ coefficient identity giving Z₂ = −104; Gram determinant −4, isotropy and 8(Im p)²; det D = 1, det R = 12 (0 mod 3, 5 mod 7), the δ-intertwining of u_s ↦ (−1)^s s! r_s; N⁴ = 0 ≠ N³; NF = pFN and FᵀJF = p³J for every δ; (θ+1)(θ+2)(θ+3)(θ+4) coefficients; B_n for p = 3 (B₃ = 1/2), B_p = 1/p! + 1/p, the valuation bound v₃(B_n) ≥ −5n/18 and the Legendre estimate; pair weights 0, 0, 0, 1/2, 1, 35/24; Δ₃ = 25/648 giving entry 1 at p = 3; d_N for N ≤ 8 and the {2,3}-word counts; Zagier coefficients 1, −2, 9/2, 3, −11/2 and the determinant 5/2; the weight-five stuffle consistency ζ(2,3) + ζ(3,2) = ζ(2)ζ(3) − ζ(5); the shifted all-two identities at n = 1, 2; 01 ⧢ 01 multiplicities; Z_*, Z_⧢ on [1,1] and [1,2]; ρ(T²), ρ(T³); ζ(2)² = (5/2)ζ(4), ζ(3,1) = π⁴/360, ζ(2,2) = π⁴/120; S₀, S₁, S₂ = 1, 2/3, 13/15; the midpoint values 8/5 and 8/√17; legendreRadicand(1/2, u) = 1 + u⁴; D_λ ≥ (1 − λ)(1 + u²)² and the Lipschitz bound 8/(1 − λ)^{3/2} giving 2/(N(1 − λ)^{3/2}). 45 Check groups recomputed, all correct except those already in pass a (F12, F16).
- Locators: 74 theorem/page locators checked against the cached legal copies by their page markers (Deligne 5, Burns–Flach 7, Huber–Müller-Stach 8, LTXZZ published 10, Hartmann 9, Brown 12, Zagier 2, IKZ 5, Burns–Venjakob final 3, Kedlaya 5, Huybrechts 3, Shapiro 5), with the statements read for Deligne (5.1.8), Definition 1.3, BF Theorem 3.1(b)–(c), Remark 10 (ℤ[1/2][G], r < 1), LTXZZ Lemma 8.2.1, Theorems 8.2.2 and 8.3.2, BV Corollary 5.7 (ℚ_p-rational characters, n_ρ = 1 for permutation characters). All cited numbers exist on the cited pages; two one-page offsets at the start of ranges (Zagier Propositions 1–3 begin on printed p. 983, Shapiro Theorem 5.13 begins on p. 12 of the arXiv copy) are not raised. BK, DG, Serre, NS, Park and BG are not in the cache (see Not verifiable).
- Pinned declarations: all 24 Mathlib names cited that I grepped exist at the pin (`Complex.Gammaℝ_eq_zero_iff`, `sub_one_mul_padicValNat_factorial`, `PhragmenLindelof.horizontal_strip`, `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`, `riemannZeta_four`, `hurwitzZeta_neg_nat`, `MeasureTheory.Measure.infinitePi`, `IsLocalization.Away.mul_invSelf`, `ordinaryHypergeometric`, `LaurentPolynomial.eval₂_T`, `intervalIntegral.integral_comp_mul_deriv'`, `tendsto_integral_of_dominated_convergence`, `riemannZeta_neg_nat_eq_bernoulli`, `completedRiemannZeta_one_sub`, `zeta_nat_eq_tsum_of_gt_one`, `DirichletCharacter.rootNumber`, `Matrix.det_of_isUpperTriangular`, `Complex.Gamma_mul_Gamma_eq_betaIntegral`, `Complex.Gamma_mul_Gamma_one_sub`, `meromorphicOrderAt`, `PowerSeries.substInv`, and the ones pass a listed); `TauCeti.Hodge.tate`, `tate_F`, `latticeConj` exist in the pinned Tau Ceti.
- Supplier citations: 33 suppliers checked against their current texts (main checkout, open roadmap pull requests at their heads, or board packages), 2 by me directly and 31 through helpers whose witness lines I re-read for every item raised. Supported as cited: ComplexComparisonPartII C5.1/C5.2/C5.6/C5.7; NeronModelsAndSemistableAbelianVarieties §6.10 `StrictCompatibleSystemExport`; WeilConjectures WC.1–WC.2; DirichletPadicLFunctions §0.4 and the B₁ = +1/2 convention; AutomorphicGaloisRepresentationsPartII AG2.5 (Prop. 3.2.4) and AG2.6 content; ArithmeticGaloisDuality D7.1, D7.3, the p = 2 real Tate cochains; EtaleDualityAndPerverseSheaves' two duality nodes (content); SelmerIwasawaCohomology §§2.9, 2.21, 2.23, 2.24, 3.14, 4.7, 4.9, 4.24, 4.25; GeneralAlgebraicKTheory §§4.15–4.17, §6.19 `gilletWaldhausen_general`; IntegralHeckeAndGaloisDeterminants §0.6; NoncommutativeAndEquivariantIwasawa NE.7.9, 7.13, 7.14, 7.15 and the shifted-complex contract; IntegralIwasawaTheory §§11.1, 11.7 (modulo F06); CrystallineCohomology CR.5, CR.6.2, the named target inside CR.6.3, CR.7; PadicDifferentialEquationsAndRigidCohomology RD.1.46, RD.1.63, RD.3, RD.4.20–4.24, RD.4.29, RD.4.31, RD.4.36–4.38, RD.7.1, RD.7.10; AnabelianGeometryAndNonabelianChabauty Layer 2; ComputationalNumberTheory CN.4 items (primitive characters and level-one forms only); ModularForms Layers 0, 7, 8; StableReduction Layer 4; PadicMeasuresIwasawaAlgebras §5.1 names; SchemeAndStackFoundations §§1.17, 1.23 (`finite_quotient_coarse`), 4.11; AlgebraicTopology Stage 6 (manifold duality; no surface-specific item); EllipticCurves Layers 1, 2, 4, 7; Completed NumberFieldArithmetic (regulator and class number formula). Head pins cited for PRs 1212, 857, 1002, 1006 are stale but every cited section survives at the current heads (subsumed by pass a F01).
- Dependency check, run twice (the clone's merge-order file and the merge-order file on main, which lists this roadmap at line 152):

```text
depcheck: 9 roadmaps, 96 edges, 0 problem(s)
```

  `grep -nx PeriodsAndSpecialValues merge-order/ORDER.txt` is empty in the clone (its order file predates the intake) and returns line 152 on main. The parser sees 9 roadmaps and does not read the package's supplier headings, so the UPWARD dependencies of F01 are reported here from the order file directly.
- Not re-raised (pass a, round 1 pass a, F01–F18): `set_option` and PR/head references; the unowned suppliers MotivicEtaleKTheory, BorelRegulators, EllipticRegulators, RankZeroOneBSD, PotentialAutomorphyDworkMotivesPartII (F02; F01 above extends F02 for the two renamed ones only); unregistered extension gaps (F03); the PS/MC/AL/NC reverse-supply cycle claims at lines 1983–1988 (F04; all four suppliers list PS only as a consumer); computational deliverables in PS.7 (F05); the missing headlines `mzv_allTwo` and `det_ne_zero_of_two_adic_triangular` (F06); the integral exponential domain (F07); RΓ_f versus RΓ (F08); the weight ≤ −3 narrowing (F09); p = 2 in the Dwork sums (F10); the stale TensorWords path (F11); the Ext witness (F12); missing Lean mirrors (F13); docstrings and `mzvDecodeAux` (F14); the absent `sources.toml` on this head (F15; the copy now on main registers only BV-final and the waived Tate); the two normalization labels (F16); the internal backward prerequisites (F17); the HMS-book equation numbers (F18).

## Not verifiable

- `Suggested.lean` as submitted: the compiled object of `TauCeti.Geometry.Hodge.Tate.Basic` is missing in the review environment, so the file fails at its import; this is a limitation of the review setup. The rest of the file was elaborated in a probe copy without that import (clean apart from `sorry`).
- Sources with no cached legal copy: Bloch–Kato (BK), Deligne–Goncharov (DG), Serre's Delange–Pisot–Poitou exposé, Nagura–Sugiyama (NS), Park and Burns–Greither (BG). The BK Conjecture 5.15 formula, the DG proposition numbers, the NS formulas (26) and (39), and Park Proposition 5.2 / Corollary 4.12 / Definition 3.1 are taken as cited; pass a certified BK, DG, NS and Park from its own copies. Tate's article is waived in the manifest on main.
- The `sources.toml` at this head is absent (pass a F15); the copy on main lists only BV-final (certified) and Tate (waived). The locator checks above used cached copies registered by other packages' manifests (Huybrechts, LTXZZ) and cached arXiv/EMS/MPIM copies of the remaining works, identified by their header lines.
- `quarticA_recurrence`, `quarticMirrorCoordinate_coeff`, `quarticMirror_integral`, `quartic_symmetric_square`, `legendre_substitution`, `legendre_midpoint_error`, `arctan_period_bounds`, `dworkSigma0_summable`, `dworkSigma2_summable`, `mzv_stuffle`, `mzv_shuffle`, `zagier_evaluation`, `hoffman_count`, `numerical_spanning`, `mzv_span_finrank_le`: checked by hand or numerically in low degree, not proved.
- Whether a declared gap can be registered for F08 (no `design/plan.json` is readable at this head, as pass a noted); if not, the three lattice facts become a PS.8.4 target.
