# Review of AInfCohomology (pull request #1044 at b47987b)

**Verdict:** accepted

No P1 or P2 finding. The gate passes at this head (every scanner, the dependency check and the targeted build), `lake env lean` on `TauCetiRoadmap/AInfCohomology/Suggested.lean` reports `sorry` as the only warning (6 declarations), and the dependency check gives `depcheck: 205 roadmaps, 1409 edges, 0 problem(s)` with no UPWARD or CYCLE line. The five findings below are P3 and are the author's to take or leave before a human's final approval.

## R01 (P3) — Backticked own names for targets that `Suggested.lean` does not declare

Location: `TauCetiRoadmap/AInfCohomology/README.md`, throughout the layers (first instance line 522, "**Cyclotomic period elements** (`AInf.cyclotomic`)"; API bullets such as line 530 "`AInf.cyclotomic_mu`"; Check labels such as line 540 "`AInf.cyclotomic_test_unit`").

Claim: 511 backticked names of this roadmap's own (`AInf.*`, `Decalage.*`, `BKF.*`, `AOmega.*`, `AInfSheaf.*`, `Semistable.*`, `CohomologicalBK.*`) head targets, API bullets and Check bullets.

Witness: `Suggested.lean` declares 11 names (`integers`, `mu`, `xi`, `xiLevel`, `ker_fontaineTheta_eq_span_xi`, `iInf_span_xiLevel_eq_span_mu`, `finite_witt_coherence`, `deRhamMap`, `ainf_deRhamPlus_flat`, `ainf_invert_p_projective_free`, `ainf_free_of_torsionFree_reduction`); none of the 511 occurs in it, in Mathlib or in Tau Ceti at the pins. The house rule is that an API bullet carries a backticked Lean name only when `Suggested.lean` declares it, and that a Check never names a Lean counterpart. The gate's identifier check flags only namespace-qualified own names, which is why it passes.

Repair: keep the target titles as the handles (they already are: `*Needs:*` lines cite by title) and drop the parenthesised identifiers and the Check labels, or write them unbackticked as plain words. One mechanical pass suffices; the 11 declared names stay. The same pass should reword the Check at line 2068 that names the Lean carriers `PadicInt p → Padic p` as a witness.

## R02 (P3) — Alias names attributed to CrystallineCohomology do not exist there

Location: `README.md` lines 889–895 ("the names `Decalage.etaTerm`, … are aliases of that core; their cohomology and completion assertions are inherited from `Crystalline.pDecalage_degree`, `Crystalline.pDecalage_d`, `Crystalline.pDecalage_map`, `Crystalline.pDecalage_cohomology`, `Crystalline.pBockstein_decalage`, `Crystalline.derivedPDecalage_model` and `Crystalline.derivedPDecalage_completion`").

Claim: these seven declarations are supplied by CrystallineCohomology CR.4.

Witness: at the head of pull request #857, `grep -c "pDecalage\|pBockstein\|derivedPDecalage"` on the CrystallineCohomology README gives 0, and its `Suggested.lean` (90 lines) has none of them. The targets exist under their titles: *Principal p-décalage on torsion-free complexes* (CR.4.1, README line 3651), *Bockstein reduction of principal p-décalage* (line 4025) and *Derived p-décalage and completion* (line 4055).

Repair: replace the seven names by those three titles, which the roadmap already uses correctly in the `*Needs:*` line of *Décalage interface for Dieudonné consumers* (§AI.1.7).

## R03 (P3) — A layer "CR.0" that CrystallineCohomology does not have

Location: `README.md` lines 3003, 3040, 3131 and 3196 (e.g. line 3003 "CR.0 supplies `A_cris^0` as the divided power envelope of `A_inf→O_C/p` and `A_cris` as its p-adic completion").

Claim: a layer CR.0 of CrystallineCohomology supplies the uncompleted and completed envelopes `A_cris^0`, `A_cris` and the universal property of `A_cris^0`.

Witness: the CrystallineCohomology README at #857 has layers CR.1–CR.6, CR.3:Frobenius-isogeny, CR.3:duality and CR.5:log-algebra; `grep -c "CR\.0\b"` gives 0. The owner of these objects is DerivedDeRhamCohomology §PD.7 (*The crystalline period ring*, README line 2854 at #868), which this roadmap's supplier contract and its §AI.0:integral.2 already cite.

Repair: replace each "CR.0" by "DerivedDeRhamCohomology §PD.7" (and §PD.6 for the envelope's universal property).

## R04 (P3) — A target title cited in ClassicalAdicEtaleCohomology §4.7 that is not a target

Location: `README.md` line 2692 (*Algebraization and descent of semistable charts*, `*Needs:*` "ClassicalAdicEtaleCohomology, §4.7 (*Local algebraization of semistable formal charts*)") and the supplier contract at line 447 ("Section 4.7 supplies local algebraization of semistable formal charts").

Claim: ClassicalAdicEtaleCohomology §4.7 has a target of that name.

Witness: at #875, §4.7 is *Bloch–Kato–Hyodo filtrations* (README line 2537); the algebraization appears there as a proof step (line 2600, "Étale locally on 𝔛, a semistable formal chart is the completion of a semistable O_K-scheme T…") over its finite discretely valued base, not as a target. This roadmap's own target already carries the statement over `O_C` with its route (Elkik approximation, Stacks 04D1, Huber 1.7.3(iii), Gabber–Ramero 7.1.6).

Repair: cite the step as "ClassicalAdicEtaleCohomology §4.7, the algebraization step of its Bloch–Kato–Hyodo construction", or drop the citation and let *Algebraization and descent of semistable charts* own the statement outright, which its proof sketch already does.

## R05 (P3) — Library name at the pin

Location: `README.md` line 273 ("`WittVector.Isocrystal` and `WittVector.FractionRing.frobenius`"), repeated at lines 1808 and 1887.

Claim: Mathlib at `6b7abb3c` has `WittVector.FractionRing.frobenius`.

Witness: `Mathlib/RingTheory/WittVector/Isocrystal.lean:40` names the map `WittVector.FractionRing.frobeniusRingHom p k` (notation `φ(p, k)`); there is no `FractionRing.frobenius`.

Repair: write `WittVector.FractionRing.frobeniusRingHom`.

## Verified sound

**Gate and build.** The worker's gate at b47987b passes every check (`set_option=0 … build=0 OK`). I elaborated `Suggested.lean` myself with `lake env lean` from the worktree: 6 `declaration uses sorry` warnings, nothing else. The signature file `#check @name` for all 11 declarations elaborates; the two "dropped binder" leads are harmless: `mu` loses `[CharP S p] [PerfectRing S p]` because `[ε] − 1` needs neither, and `deRhamMap` loses `CompleteSpace`, `IsAlgClosed`, `CharZero`, which its type does not mention; every theorem keeps all of (C) through the `include` line. Dependency check: `depcheck: 205 roadmaps, 1409 edges, 0 problem(s)`. AInfCohomology sits at line 53 of the merge order; every supplier is on main (PerfectoidSpaces, DerivedModuleAlgebra, EnhancedDerivedSheaves, AdicSpaces (Completed), AdicSpacesPartII/III, AdicEtaleGeometry, BordismFormalGroups, DGAInfinity, SchemeAndStackFoundations) or earlier in the order (TangentialBordism 9, StableHomotopyKTheory 12, PadicPeriodRings 17, DerivedDeRhamCohomology 18, CrystallineCohomology 19, PerfectoidQuotients 20, ArithmeticGaloisDuality 42, FiniteFlatGroups… 45, ClassicalAdicEtaleCohomology 52). Every roadmap named under *Downstream consumers* is later (PrismaticCohomology 54, PadicHodgeTheory 107, CohomologyComparisons 161, HeckeStacksAndLocalShtukas 171, HabiroCohomologyFoundations 187, RefinedTraceMethods 306). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AInfCohomology'` is empty.

**Padding probe.** A scratch copy of `Suggested.lean` with each `sorry` replaced by `first | rfl | simp | infer_instance | (intros; rfl) | (intros; simp)` fails on all six theorems (`simp made no progress` at lines 82, 89, 101, 111, 119, 134). No `example`, no `def` with a `sorry` body, no `set_option`, single `import Mathlib`, `theorem` only.

**Headline theorems.** The end theorems named in the Summary are BMS1 Theorem 1.8 (arXiv v3 p.5, cache line 241), ČK (1.2.1) (p.2, line 60) and Theorem 7.4 (p.69, line 3056), the torsion inequalities BMS1 Theorem 1.1 (p.2, line 92) and ČK Theorems 7.9 and 7.12 (pp.70–71, lines 3107, 3147), the de Rham lattice ČK Theorem 8.7 (p.73–74, line 3231; the README says p.74, the statement starts at the foot of p.73) and Breuil–Kisin descent BMS2 Theorem 1.2 (arXiv p.3, line 88). None is statable at the pins: there is no formal scheme, pro-étale period sheaf, `Lη`, log crystalline site or cyclotomic spectrum in Mathlib `6b7abb3c` or Tau Ceti `a91d3aaf` (`Mathlib/RingTheory/Perfectoid/` holds only `BDeRham`, `FontaineTheta`, `Untilt`). The module docstring names each of them with the missing carrier. The six stated theorems are genuine sub-results with the right hypotheses (rows below), not stand-ins.

**Sources (the seeded sample, verified at the locator; `bms1` = arXiv:1602.03148v3 text, `ck` = arXiv:1710.06145v3 text, `bms2pub` = Publ. IHÉS 129 text with printed page = cache page + 198, `zav` = arXiv:2111.01830v3 text).**

- *Regularity of integral periods*: bms1 line 1062 (Lemma 3.10(i), p.22: a generator of ker θ is a nonzerodivisor), line 1202 (Proposition 3.17(ii), p.25: μ is a nonzerodivisor; (iii) ξ̃_r = φ^r(μ)/μ), line 1342 (proof of Lemma 3.23, p.27: (p, ξ_r) is a regular sequence). Supports the statement.
- *Completed cotangent description of the twist*: zav line 424 (p.10: O_C{1} := T_p(Ω¹_{O_C/ℤ_p}) = L̂_{O_C/ℤ_p}[−1]) and line 1607 (Theorem 3.3.3, p.35, proof pp.35–36). Supports the statement; the relative vanishing is PerfectoidQuotients §0.3, which exists at #1042 (README line 740).
- *Principal cohomology quotient*: bms1 line 2356 (Lemma 6.4, pp.49–50): H^i(η_I C) = (H^i(C)/H^i(C)[I]) ⊗ I^{⊗i}. The normalized model drops the twist; the README says so.
- *Composition of décalage*: bms1 line 2460 (Lemma 6.11, p.52): Lη_{I·J} ≅ Lη_I ∘ Lη_J.
- *Surjectivity of the Bockstein comparison*: bms1 line 2512 (Proposition 6.12, surjectivity paragraph, p.53); the README's lift-and-correct argument is the printed one.
- *Completion at the décalage ideal*: bms1 line 2629 (Lemma 6.20, p.55): first map `(Lη_I C)^∧ → Lη_I Ĉ`, hypothesis "I locally free of rank 1"; the README's repleteness hypothesis is the sheaf-completion input from EnhancedDerivedSheaves E4, declared.
- *Derived p-completion on a site that is not replete*: ck line 268 ((1.7.1), p.7) with the same three Stacks tags; Stacks 0940 (R lim, cache line 2087), 0A07 (Lemma 23.3: Rf_* commutes with R lim, line 2142), 0944 (Lemma 50.1: derived completion and Rf_*, line 5733) say what the target uses them for.
- *Almost-to-honest décalage criterion*: bms1 line 3037 (Lemma 8.11(ii), p.64), hypotheses verbatim (f ∈ I nonzerodivisor; kernel and cokernel killed by I; H^i(C) and H^i(C)/f without nonzero I-killed elements); the Check is Remark 8.12.
- *Framing independence and sheaf descent*: bms1 line 3305 (Theorem 9.4(iii), p.70), 3558 (Lemma 9.9, p.74), 3644 (Lemma 9.13, p.76), 3755 (Lemma 9.15, p.78).
- *Global crystalline and Witt specializations*: ck line 2549 (Corollary 5.43, p.58: qcqs with completed tensors, proper with ordinary tensors and finite freeness after inverting p), line 2546 (the log structure `ℚ_{≥0} → W(k̄)` of §5.42). Exact match.
- *Topological Hochschild homology as a cyclotomic spectrum*: BMS2 arXiv §1.2 and §§2.2–2.3; NS Lemma II.4.2 (cache `ns` line 2167, p.48) for the completed Tate comparison that gives φ : TC⁻ → TP after p-completion; π_0 THH(A) = A, rational agreement with HH and the HKR graded pieces are standard. Supports the statement.
- *Relative trace specializations of the sphere polynomial base*: bms2pub line 4000 (Lemma 11.6, printed p.301: base change along z ↦ 0 gives THH(A ⊗_{O_K} k), compatibly with 𝕋 and φ_p), line 4021 (Proposition 11.7) and Corollary 11.8 (p.301). Exact match.
- *Relative Breuil–Kisin trace coefficients*: bms2pub line 4079 (Proposition 11.10, pp.302–303): π_*TC⁻ = 𝔖^{(−1)}[u,v]/(uv−E), π_*TP = 𝔖^{(−1)}[σ^{±1}], Tate target O_K[ϖ^{1/p}][σ^{±1}], can(u) = Eσ, can(v) = σ^{−1}, φ(u) = σ, φ(v) = φ(E)σ^{−1}. The README's unit α records the dependence on the normalization of E (KN22 §4, cache p.12 = printed p.1693); its Check at K = ℚ_p recomputes can(b̄) = −pσ̄ = pφ(b̄) with α = −1.
- *Breuil–Kisin Frobenius décalage identity* and *Breuil–Kisin A_inf base change*: bms2pub lines 3901 (Theorem 11.2, p.298), 4134 (Corollary 11.12, p.304), 4186 (Proposition 11.15, p.305) and 4216 (proof of Theorem 11.2, p.306); Remark 11.17 (arXiv line 3553, p.85). The composite `loc ∘ can⁻¹ ∘ Φ` is the printed composite.

**Other locators opened:** bms1 Proposition 4.13 (line 1784, p.37: freeness if M ⊗ W(k) or M ⊗_θ O is p-torsion-free), Corollary 4.12 (line 1778), Lemma 3.23 (line 1320, p.27: kernel (μ), cokernel killed by W(𝔪^♭), spherically complete case), Proposition 3.24 (line 1365, p.28), Lemma 6.19 (line 2621), Lemma 6.9 (line 2426, p.51), Remark 4.29 (line 2073, p.43), Remark 4.31 (line 2116), Lemma 10.1 and Corollary 10.2 (lines 3810, 3831, p.80), Lemma 8.16 (line 3147, p.66), Proposition 13.21 (line 5709), Theorem 14.3 (line 5842); ck Lemma 3.18 (line 645), Lemma 3.24 (line 754), Proposition 3.25 (line 758), Theorem 3.9 (line 523), Lemma 3.4 (line 458), §6.1 flatness of A_inf → B_dR⁺ (line 2616, p.60), Corollary 7.5 (line 3066), §7.6 (lines 3072–3080); BMS2 Theorem 6.1 (pub p.243), Proposition 4.31 (p.230), Theorem 7.2 (p.255), Theorem 8.17 (p.276), Theorem 9.6 (p.286); NS Lemma I.2.1 (p.13), Theorem I.3.1 (p.18), Corollary I.4.3 (p.28), Proposition III.3.1 (p.75), Proposition IV.3.2 (p.114), Corollary IV.3.3 (p.117), Theorem IV.4.4 (p.121); AR05 Theorem 4.5 (p.18 = printed 1240), Proposition 4.9 (p.21), Theorem 5.12 (p.31); Stacks 0539, 00NZ, 0ASP (Warfield), 0ASU. All agree with the README's pages and statements.

**Library declarations at the pins.** `WittVector.fontaineTheta` (`Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:165`), `fontaineTheta_teichmuller` (182), `surjective_fontaineTheta` (195), `BDeRhamPlus` (`BDeRham.lean:75`, the adic completion of `Localization.Away p` at `ker fontaineThetaInvertP`, which is exactly what `deRhamMap` targets), `fontaineThetaInvertP` (62), `PreTilt.untilt` (`Untilt.lean:49`), `WittVector.frobeniusEquiv` (`WittVector/Frobenius.lean:283`), `isAdicCompleteIdealSpanP` (`Complete.lean:116`), `WittVector.map_surjective` (`Basic.lean:263`), `Module.Flat.flat_iff_torsion_eq_bot_of_isBezout` (`Flat/TorsionFree.lean:92`, needs `IsBezout` and `IsDomain`, both true of a valuation ring), `Module.free_of_flat_of_isLocalRing`, `Submodule.isTorsionFree_iff_torsion_eq_bot`, `comonadicExtendScalars` (`ModuleCat/Descent.lean:59`), `Module.FaithfullyFlat.lTensor_bijective_iff_bijective` (399), `Module.equiv_free_prod_directSum` (`Module/PID.lean:255`), `PowerSeries.substAlgHom_X`, `HasSubst.X_pow`, `coeff_subst_X_pow`, `constantCoeff_subst_X_pow` (`PowerSeries/Substitution.lean`), `Module.Invertible` (`PicardGroup.lean`), `continuousCohomology` (`RepresentationTheory/Homological/ContCohomology/Basic.lean`), `DividedPowers` (`DividedPowers/Basic.lean:77`), `DividedPowerAlgebra` (`DividedPowerAlgebra/Init.lean:99`), `WeierstrassCurve.j` (`Weierstrass.lean:388`), `MvPolynomial.pderiv`, `AdicCompletion.evalₐ_of`, `IsAdicComplete.liftRingHom`; Tau Ceti `WittVector.isAdicComplete_span_p_teichmuller`, `span_p_teichmuller_eq_top_iff` (`RingTheory/WittVector/Complete.lean`), `frobeniusEquiv_symm_teichmuller` (`WittVector/Frobenius.lean:49`), `TauCeti.Huber.WittVector.isHuberRing_adicTopology_span_p_teichmuller` and `isTateRing…_iff` (`Huber/WittVector.lean:51, 61`), `TauCeti.FarguesFontaine.spaY` (`FarguesFontaine/Y.lean:116`), `windowU`, `windowV` (`Window.lean:255, 262`), `spaX` (`Quotient.lean:56`), `TauCeti.fittingIdeal` (`FittingIdeal/Basic.lean:343`), `fittingIdeal_baseChange` (`BaseChange.lean`). Only R05 is off.

**Cross-roadmap citations resolved** (at the heads named in the brief, or on main): PerfectoidQuotients §0.0 `fontaine_tor_independence`, §0.2 `finiteFontaineTheta`, `frobenius_surjectivity_equivalences`, `theta_map_preserves_generator`, §0.3 `perfectoid_cotangent_mod_p_vanishes`, `perfectoid_absolute_cotangent`, §0.5, §§1.3–1.4 `bhattRootExtension`; CrystallineCohomology §CR.4.4 *Finite Witt base change for integral perfectoid rings* (line 5306; the section is titled *Inputs on Witt vectors*), *Witt localization and étale descent* (5956), *Relative Frobenius–Verschiebung procomplexes*, *Continuous relative de Rham–Witt complex*, *Laurent Witt weights…*, *Relative Witt forms over perfectoid bases*, *Strict Dieudonné complexes as décalage fixed points*, *Universal saturated de Rham–Witt complex*, *Nygaard, conjugate, Hodge and lift filtrations*, *Finite and infinite crystalline de Rham–Witt comparison*, CR.3:Frobenius-isogeny's two targets, CR.2's three targets, CR.5:log-algebra *Prelog rings*, *Log regular schemes*, *Kato chart criterion*, *Integral morphisms*, CR.5 *Log de Rham complexes*, *Semistable chart differential formula*, *Morphisms of Cartier type*, *Fine/Quasi-coherent log PD envelopes*, *PD smooth log thickenings*, *Log PD Poincaré lemma*, CR.6 *Standard log Witt bases*, *Hyodo–Kato monodromy*, *Frobenius–monodromy relation*, *Nilpotence…*, *Ramified Hyodo–Kato base change*; DerivedDeRhamCohomology §§1.14–1.22, PD.6, PD.7, Layer 2, 5.1–5.5, 5.23; PadicPeriodRings §§1.2–1.5, 2 (`PadicFieldCompletion`, `tateSen_H0`, `tateSen_character`), 3, 4.1 (`generalBasePeriodRings`), 4.2–4.3; FiniteFlatGroups… R07.2.18, R07.4.1, R07.4.4, R07.4.12, R07.4.13, R07.4.15 (`𝔖{1}`), R07.4.16 (`kisinPeriodScalarMaps`; its line 6226 agrees that `𝔖{1} ⊗_{ι₁} A_inf = A_inf{1} = μ⁻¹(ℤ_p(1) ⊗ A_inf)`, the convention of §AI.0:integral.1); TangentialBordism B4.2 and B4.7; ArithmeticGaloisDuality §D7.3 *Continuous cochains in the derived category*; ClassicalAdicEtaleCohomology §1.3 *Descent and the étale–pro-étale comparison*; EnhancedDerivedSheaves §0.2 `ClassicalDerived.replacements`, E1.3–E1.4 *Derived sheaf tensor*, E2.1 *Countable products in a replete topos*, E2.2 (re-export of SchemeAndStackFoundations §2.17 `IsReplete.derived_limits`), E2.6 *Unbounded hypercover descent*, E4.1 *Derived complete sheaves*, *Colimits of complete sheaves*, E4.3 `derivedCompleteModules_weakSerre`, `derivedComplete_iff_cohomology`, E4.4 *Completed sheaf tensor product*, E4.5 *Equivalences detected modulo the ideal* (`isIso_of_isIso_mod`), E5:abstract *Operadic algebras*, E5:presentability.2 `spectra`, E5:spectra-comparison `eilenbergMacLane`, `moduleSpectra_equiv_derived`, `symmetricSpectra_equiv_spectra`; DerivedModuleAlgebra §§0.K.1, 0.4, 0.6, 0.8, 0.10–0.13, 1.T.1, 1.1–1.9; PerfectoidSpaces P0.2, P0.5, P0.15, P1.17–P1.18, P1.24–P1.25, P4 (compatible-root annuli, line 10348), P7.16 `ProEtaleSite.affinoidPerfectoid_basis`, `proEtale_rootTorus_exists`; AdicEtaleGeometry A1 (corrected coverings, *Finite-étale towers* line 4495); AdicSpacesPartIII F0.1–F0.8, R2.1–R2.9, R3.1, R3.2, R3.5 *Kiehl glueing…* (10288), R3.6 (`relativeDifferentials.deRhamComplex`, `proper-affinoid-cohomology-finite`), R3.7; AdicSpacesPartII R0.1b, R0.9, R0.17 *Algebraic models of affinoid étale maps*; SchemeAndStackFoundations §0.6 (`reflexive_extension_normal`, `coherent_hartogs`), §0.9, §1.1, §2.17, §2.18, §§2.20, 3.3, §§4.3–4.4; BordismFormalGroups §F6.5; DGAInfinity Layer 8; AdicSpaces (Completed) Layer 6 §§6.1–6.4. The worker's `roadmaps resolve` likewise reports no cross-roadmap citation found nowhere; its 511 unresolved Lean names are R01.

**Ownership.** By object, in the roadmaps on main and the open heads the brief lists: no roadmap earlier in the order builds `Lη` on a ringed topos (CrystallineCohomology CR.4 builds the principal-`p` module case, which this roadmap imports as the base), Breuil–Kisin–Fargues modules, `AΩ`, the pro-étale period sheaves `Ô⁺_X`, `𝔸_inf,X`, `𝔹_dR⁺` and `O𝔹_dR⁺`, the canonical `B_dR⁺`-deformation, or THH as a cyclotomic spectrum (THH occurs earlier only in StableHomotopyKTheory as a configuration-space remark and in DerivedDeRhamCohomology as a reference; the other owners, KTheoryFiniteLocalFields 67, RefinedTraceMethods 306, HabiroCohomologyFoundationsPartII 310, are later). PadicHodgeTheory (#1062) and CohomologyComparisons (#1064) cite §AI.3.1 for the period sheaves and build only `O𝔹_dR,log`, so the direction is consistent. Ownership against open pull requests not listed in the brief was not checked.

**Adversarial table** (values computed on each side).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions witness θ(μ)=0, θ(ξ̃)=p, θ̃(μ)=ζ_p−1, θ̃(ξ̃)=0 | ε=(1,ζ_p,…) | θ([ε])=1 so θ(μ)=0; θ(φξ)=Σ_{j<p}1=p; θ̃(μ)=θ([ε^{1/p}]−1)=ζ_p−1; θ̃(ξ̃)=θ(ξ)=Σζ_p^j=0 | holds; swapping ξ,ξ̃ fails all four | none |
| μ=ξ·φ⁻¹(μ), φ(μ)=ξ̃μ | one variable | ξ([ε^{1/p}]−1)=[ε]−1; Σ[ε]^j([ε]−1)=[ε]^p−1 | holds | none |
| ξ_r=∏φ^{−j}ξ = μ/φ^{−r}μ; ker θ_r=(ξ_r) | r=1,2 | r=1: ξ; r=2: ξφ⁻¹(ξ)=μ/φ⁻²(μ) | matches BMS1 Lemma 3.23 | none |
| θ_{r+1}(ξ)=V(1) | r=1, ghost map | ghost(θ_2 ξ)=(θξ, θφξ)=(0,p)=ghost(V(1)); ghost(p)=(p,p) | ξ is a lift, p is not | none |
| Ann(V^j(1))=(q_{r,j}), q_{r,j}=([ζ_{p^j}]−1)/([ζ_{p^r}]−1) | r=2,j=0; p=2,r=2,j=1 | q_{2,0}=0, Ann(1)=0, Ann(0)=W_2; q=1+[ζ_4], zeroth coordinate 1+ζ_4≠0, V(1) has zeroth coordinate 0 | matches Cor 3.18 | none |
| `ker_fontaineTheta_eq_span_xi` (Lean) | hε: untilt(ε^{1/p}) primitive | forces untilt(ε)=1 and all untilt(ε^{1/p^n}) primitive; xi=Σ[ε^{1/p}]^j | BMS1 3.16/3.17 as stated | none |
| `iInf_span_xiLevel_eq_span_mu` (Lean) | r≥1 (r=0 gives span{1}=⊤, harmless) | xiLevel r=∏_{j<r}φ^{−j}(xi)=ξ_r | Lemma 3.23 | none |
| `finite_witt_coherence` (Lean) | r=1 | W_1(O_C)=O_C, W_1(O_C^♭)=O_C^♭, valuation rings coherent | Prop 3.24 for O_K of a perfectoid field, both C and C^♭ | none |
| `ainf_deRhamPlus_flat` (Lean) | n=1 quotient | B_dR⁺/ξ=C; target is Mathlib's AdicCompletion of Localization.Away p | ČK §6.1 p.60 (Raynaud–Gruson II.1.4.2.1) | none |
| `ainf_invert_p_projective_free` (Lean) | rank 0; rank 1 | zero module free; Cor 4.12 for any finite projective | none |  none |
| `ainf_free_of_torsionFree_reduction` (Lean) | M=A_inf/p; M=(p,ξ); M free | A_inf/p ⊗_θ O_C=O_C/p has p-torsion (excluded); (p,ξ)[1/p] free but (p,ξ)/ξ(p,ξ) has the class of ξ killed by p (excluded); free M passes | Prop 4.13 last clause with M⊗_θ O | none |
| Principal cohomology quotient | [ℤ→ℤ] by 4, f=2 | η_2=[ℤ→ℤ] by 2; H^1 both sides ℤ/2 = (ℤ/4)/(ℤ/4)[2] | holds | none |
| Divided differential, two-term check | [R→R] by f², degrees 0,1 and −3,−2 | δ_0(1)=f; same in negative degrees; "divided_once" δ_0(1)=2 for f=2, d=4 | holds | none |
| Derived décalage non-exactness | 0→ℤ/p→ℤ/p²→ℤ/p→0 | Lη_p(ℤ/p)=0, Lη_p(ℤ/p²)=ℤ/p | not a triangle | none |
| Change of generator u^{−i} | f′=uf | f^i x=f′^i x′ ⇒ x′=u^{−i}x; [R→R] by f² shifted to −1,0: terms f⁻¹R, R, normalized differential f | holds | none |
| Bockstein complex | [ℤ→ℤ] by p; by p² | dx=p·x ⇒ β=id; dx=p²x ⇒ β=0; [ℤ→ℤ] by p acyclic on both sides | holds | none |
| Monoidality over a valuation ring | DVR, f=π, C=R/π; C=D=R/π² | Lη_π(R/π)=0 both sides; Lη_π(R/π²)=R/π, tensor R/π⊗^L R/π = R/π in degrees 0,−1 both sides | holds | none |
| Completion counterexample | B=ℚ[x], F=S−x, N restricted sequences | F injective on M (top coefficient −x a_N); ker F on N = {(a,xa,x²a,…)}≠0; F(v_N)=−x^N e_{N−1}; comparison N→N/N[t] not injective | refutes commutation of Lη_t with x-completion | none |
| Lemma 6.9 lower map (truncation bounds) | C=ℤ in degree 0, n=1, f=p | (η_pC)^0=ℤ ⊄ pℤ=I·C^0; H^1=0 so the map τ^{≥1}Lη→I⊗τ^{≥1} is 0→0 | README's "repair of the printed quotient identity" is right (see Source issues) | none |
| Factorization criterion (Lemma 8.16) | A=ℤ, f=2, C=D=ℤ[−1] | Lη_2(ℤ[−1])=2ℤ[−1]; ×2 factors, identity does not (H^1 mod 2 map nonzero) | holds | none |
| Koszul signs | g=(x,y) on ℤ[x,y] | d¹(1,0)=−y, d¹(0,1)=x, d¹d⁰(m)=xym−yxm=0; noncommuting E₁₂,E₂₁: d²(1,0)=(1,0)≠0 | holds; commutativity needed | none |
| q-de Rham model | n=1,2,−1 | d(T)=T dlog_q T; d(T²)=(1+q)T² dlog_q T; [−1]_q=−q^{−1}·1; [n]_q=−q^n[−n]_q | holds | none |
| Hodge–Tate specialization | 𝔛=Spf O_C; one torus coordinate | Ω̃=O_C[0]; H¹≅R·dlog T{−1}, H²=0 | Theorems 8.3, 9.2(i) | none |
| Unshifted finite Witt specialization along θ_r | r=1; φ^r(μ)=μξ̃_r | r=1 gives θ and Ω^•; φ²(μ)=φ(ξ̃)ξ̃μ=ξ̃_2μ | consistent with Theorem 1.10 and Prop 6.12 | none |
| Bounded PD subrings A_cris^{(m)} | m<p; m=p; m≥p² | j! unit for j<p so A_cris^{(m)}=A_inf; A_cris^{0,(p)}=A_inf[T]/(p!T−ξ^p) p-torsion-free (mod p it is O_C^♭[T]/(ξ̄^p), a domain quotient); ξ̃=p·unit for m≥p² | holds | none |
| A_cris^{(p)}/p has μ-torsion | p=2; p>2 | ξ̄=(ε^{1/p}−1)^{p−1}, μ̄=(ε^{1/p}−1)^p, μ̄^{p−1}=ξ̄^p=0; torsion class 1 (p=2) or μ̄^{p−2} | holds | none |
| Residue-dimension criterion counterexample | D={0}∪{v>√2} in ℂ_p^♭ | D=𝔪D (choose √2<v(y)<v(x)), D⊗k=0, D not principal | holds | none |
| p-local freeness from two realizations | M=A_inf/(μ) | M[1/pμ]=0; M[1/p]=A_inf[1/p]/μ has μ-torsion; M⊗B_cris⁺=B_cris⁺/μ≠0 not projective | crystalline hypothesis needed | none |
| Cokernel of A_inf(1)→A_inf{1} | rank one | (μ⁻¹A_inf/A_inf)(1)≅A_inf/μ; p-inversion not projective | BKF category not closed under cokernels | none |
| Monomial indices, level and weights | p=2, r=1, s=1 | ((0,2),(4)) = 2·((0,1),(2)), exact level 0; ((0,2),(1)) at level 2: 2∤1 so exact level 2, weights (2,1); ((1,0),(0)) weights (−1,0), exact level 1 | holds | none |
| Root tower non-flatness | node, p=2, m=1 | generic degree 2; node fibre k[a,b]/(a²,b²,ab) length 3 | not flat | none |
| δ₁ on node chart | X₀,X₁ | δ₁X₀−X₀=([ε]⁻¹−1)X₀=−[ε]⁻¹μX₀; δ₁X₁−X₁=μX₁; on X₁^{1/p}: [ε^{1/p}]−1=φ⁻¹(μ)∉(μ) | holds | none |
| Decalage torsion check (AΩ^psh torus) | v^♭(ε−1) vs v^♭(p^♭) | v(ζ_{p^n}−1)·p^n=p/(p−1); (p^♭)^{1/p^j} has value p^{−j}<p/(p−1) so [·]∈W(𝔪^♭)∖(μ) | holds | none |
| Length formula l(M_η)=l(M_s)−l(Tor₁) | n=1, M=V^r⊕⊕V/a_i | l(M_η)=r, l(M_s)=r+s, l(Tor₁(M,k))=s | Lemma 4.14 | none |
| Relative BK trace coefficients | K=ℚ_p, E=u−p, u↦0 | E↦−p, α↦−1: can(b̄)=−pσ̄=pφ(b̄); α=1 would force 2pσ̄=0 | holds, matches TC⁻(𝔽_p)→TP(𝔽_p) | none |
| Tate constructions | X=H𝔽_p trivial; X=Hℚ | 𝔽_p[t], 𝔽_p[t^{±1}]; Hℚ^{tC_p}=0, Hℚ^{hC_p}=Hℚ; ℚ[t^{±1}]^∧_p=0 | holds | none |
| Nygaard non-descent dichotomy | K=ℚ_p(p^{1/p}), E=u^p−p; K=ℚ_p | φ(u−p)=E, O₀=ℤ_p, O_K free of rank p; (u−p) not a power series in u^p | holds | none |
| De Rham torsion divisibility | S=ℤ_p[[u]], C=[S→S²→S] | H¹(C)=S/p; at u=p: H¹(C⊗^L ℤ_p)=ℤ_p/p², not ℤ_p/p | derived specialization needed | none |
| Nodal conic model | XY=πZ² | special fibre two lines, H⁰(O)=k, H¹(O)=0; ω restricts to O(−1): H⁰(ω)=0, H¹(ω)=k; log de Rham O_K,0,O_K | holds | none |

## Not verifiable

- Sources cited at individual targets but not fetched for this review (outside the seeded sample): Beilinson, *On the crystalline period map* (arXiv:1111.3316v4), Kato (*Logarithmic structures of Fontaine–Illusie*, *Toric singularities*), Gabber–Ramero (*Almost ring theory*, arXiv v3 numbering), Fujiwara–Kato, Huber's book, Ullrich, Raynaud–Gruson, Tsuji, EGA III/IV, Lodh, Nekovář–Nizioł, Schlessinger, Illusie. Their locators were not opened; nothing in the sample depends on them.
- Bruner–May–McClure–Steinberger, *H∞ ring spectra and their applications* (LNM 1176), cited for the Dyer–Lashof operations in §AI.7.2: not available from an open repository; cited by locator only.
- SW20, Sch13 and its corrigendum, BLM: fetched (author copies) but their locators were not checked line by line; the README's SW20 printed/PDF page offsets were not recomputed.
- Ownership against open pull requests that the brief does not list with their files was not checked.

## Source issues

- **Error** in BMS1 (arXiv:1602.03148v3) at Lemma 6.9, proof, printed p.51: the source says that when H^n(C)[I]=0 the sheaf I^{⊗n}⊗C^{n−1} contains (η_I C)^{n−1}, with quotient I^{n−1}⊗H^n(C)[I]; it should be that (η_I C)^{n−1} lies in I^n C^{n−1} + I^{n−1}Z^{n−1}(C), the quotient by that sum being I^{n−1}⊗H^n(C)[I] (counterexample C=ℤ[0], n=1, f=p); affects the proof.
- **Gap** in ČK (arXiv:1710.06145v3) at Theorem 3.9, proof, printed p.13: the source says the quotient H/H[ζ_p−1] of H=H^i_cont(Δ,R_∞) has no nonzero 𝔪-torsion and then applies Lemma 3.4; it should check (H/(ζ_p−1)H)[𝔪]=0, which is Lemma 3.4's hypothesis and follows from Proposition 3.8; affects the proof.
- **Misprint** in ČK (arXiv:1710.06145v3) at §7.2, printed p.68: the source says "by (2.3), (4.18.1), and (5.43.2)"; it should be (2.3.1); affects nothing.
- **Misprint** in BMS2 (Publ. Math. IHÉS 129) at proof of Theorem 11.2, printed p.306: the source says the complex is gr⁰ of the absolute TC⁻(A;ℤ_p)[1/u]; it should be the relative TC⁻(A/𝕊[z];ℤ_p)[1/u] of Proposition 11.15, on which u and the 𝔖-action are defined; affects nothing.
