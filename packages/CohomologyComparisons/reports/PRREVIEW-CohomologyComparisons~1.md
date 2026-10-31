# Review of CohomologyComparisons (pull request #1064 at a99732e)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/CohomologyComparisons/README.md` (1516 lines) and `Suggested.lean` (42 lines, no declarations). The gate at this head fails on `residue` only (2 hits); depcheck reports no problem; the Lean file elaborates with no output. One P2 (supplier ownership in §2.24), five P3.

## R01 (P3) — Gate residue: two HTML anchors and two "stable identifier" lines

Location: `README.md` lines 1414, 1428 (`<a id="cp6-pan-…"></a>`) and lines 1418, 1432 ("Stable target identifier: `CP.6/pan-…`").

Claim: the gate's residue rule rejects `<a id=` anchors (`gate.md`: residue=2, FAIL). The two "Stable target identifier" lines are the same process device in prose; the board reads targets only as `### k.n Title` headings, so neither carries information.

Witness: `gate.md` lists exactly lines 1414 and 1428; no other target in the file has an anchor or an identifier line, so §§6.12–6.13 are the only two labelled this way.

Repair: delete the four lines. CompletedCohomologyPartII (its README lines 633 and 1223) names these two ids in "Downstream applications" sentences; those become that roadmap's own one-line repair (cite §6.12 and §6.13 by number). Nothing else cites them (`roadmaps grep --fixed 'CP.6/'`).

## R02 (P2) — §2.24 re-plans PrismaticCohomologyPartIII Layer 7 and omits the owners its proof route uses

Location: `README.md` line 61 ("Relative analytic F-crystals, their extension to perfect-complex F-crystals and relative étale–crystalline equivalence are constructed in §2.24"), §2.24 lines 584–604, in particular "Build the integral étale realization `T` on `Y_K` and the F-isocrystal realization `E′` on `Y_{p=0}`. Prove the equivalence between analytic prismatic F-crystals and crystalline `ℤ_p`-local systems in Guo–Reinecke Theorem A" and the Check "At `Y=Spf O_K` the realization recovers the crystalline lattice functor of Guo–Reinecke Theorem 1.2".

Claim: PrismaticCohomologyPartIII (merge order 56, before this roadmap at 161) already owns the objects §2.24 builds for the vector-bundle part and the point case: §7.5 `Prismatic.FCrystal.PrismaticFCrystal` (Vect^φ(X_Δ) on a p-adic formal scheme, its README line 1146), §7.9 `Prismatic.FCrystal.etaleRealization` (the étale realization `T` to `Loc_{ℤ_p}(X_η)`, line 1237), §7.10 `Prismatic.FCrystal.crystallineRealization` (line 1264), §7.13 (F-crystals over O_C are Breuil–Kisin–Fargues modules, line 1334) and §7.22 (the Spf O_K equivalence with crystalline lattices, Bhatt–Scholze Theorem 1.2 = Guo–Reinecke Theorem 1.2, line 1529). §2.24's `*Needs:*` line (604) cites none of them, and the supplier contract for PartIII (line 61) covers only §§6.8–6.9 and 7.0. The Check that the point case is "recovered" therefore plans a supplier's theorem again. The same `*Needs:*` line also omits two inputs the cited proof uses: full faithfulness in Theorem A reduces to Fargues's functor (gr line 194–199), owned by AInfCohomology §AI.2.3, and the descent step of Proposition 4.20 uses the Beilinson fibre square (gr lines 211–215), owned by PrismaticCohomologyPartIII §7.0 and recorded here only in Layer 3.7 (a later layer).

Witness: PrismaticCohomologyPartIII head, README lines 1146, 1237, 1264, 1334, 1529; gr lines 186–215 (Theorem A "extends the result of Bhatt–Scholze in Theorem 1.2"; strategy of proof).

Repair: in §2.24 keep as targets only what Guo–Reinecke add: the analytic category (GR §3) with its descent, `analyticToPerfect` (Theorem 5.10), the perfect-complex crystalline comparison (Theorem 6.4) and `perfectRelativeCohomology` (Corollary 6.14), Theorem 9.15, and the relative extension of Theorem A. State that the restriction of `AnalyticPrismaticFCrystal Y` to vector bundles on all of Spec A is PartIII §7.5's category, that `T` and `E′` on that subcategory are PartIII §§7.9–7.10, and turn the Spf O_K Check into an agreement statement with PartIII §7.22 and §7.13. Add PrismaticCohomologyPartIII §§7.1, 7.5, 7.9, 7.10, 7.13, 7.22, AInfCohomology §AI.2.3 and PrismaticCohomologyPartIII §7.0 (for the fibre square) to the `*Needs:*` line, and extend the PartIII paragraph of the supplier contracts (line 61) accordingly.

## R03 (P3) — §0.1 restates AInfCohomology AI.0.1 and AI.0:integral.1 lemmas under new names

Location: `README.md` line 93 ("Its components are the theorems `muOf_eq_xiOf_mul` … `wittReduction_xiOf`, `wittReduction_muOf` … `ker_fontaineTheta`, `ker_fontaineThetaTilde`") and the table rows for `muOf`, `xiOf`, `xiTildeOf`, `fontaineThetaTilde`, `wittReduction`, `ainfToBdRPlus` (lines 114–120).

Claim: these are AInfCohomology's `AInf.cyclotomic_factorization` (μ = ξ·φ⁻¹(μ)), `AInf.cyclotomic_kernel` (ker θ = (ξ), ker θ̃ = (ξ̃)), `AInf.tildeTheta` with `AInf.tildeTheta_ker`, and `AInf.residue_periods` (μ ↦ 0, ξ ↦ p), at AInfCohomology head README lines 521–560 and 749–760; the `ainfToBdRPlus` row asks to prove that ξ is a uniformizer of `BDeRhamPlus`, which the README's own line 31 assigns to PadicPeriodRings §1.5 (its README line 217–224 proves `t` is a uniformizer). Line 87 says "the new work is their commuting diagram", but line 93 lists the component lemmas as theorems proved here.

Witness: AInfCohomology README line 530 (`AInf.cyclotomic_factorization`), 532 (`AInf.cyclotomic_kernel`), 552 (`AInf.tildeTheta_ker`), 757 (`AInf.residue_periods`); PadicPeriodRings README line 221.

Repair: keep `SpecializationDictionary`, `IsNormalized`, `standard` and the commuting-square statements (`period_composite`, the rational factorization, `witt_frobenius`); replace the component theorems and the duplicated table rows by citations of the four AInf names and PadicPeriodRings §1.5, and say in one clause that the standard dictionary's entries are those supplied objects.

## R04 (P3) — Sixty-three backticked names of this roadmap's own with no declaration in `Suggested.lean`

Location: `README.md` throughout: `SpecializationDictionary.*` (lines 89–123), `RelativeInfinitesimalSite.*` (492–506), `AnalyticPrismaticFCrystal`, `analyticToPerfect`, `perfectCrystallineRealization` (584–590), `finiteBaseComparisonAgreement` (656), `gradedBeilinsonSquare*` (702–715), `monodromyTransport` (822), `truncatedTorsionLength` (975), `panLogPeriod*` (1139–1149), `smallHasseCanonicalSubgroups*` (1161–1163), `panBasis*` (1188–1197), `relativeFilteredComparison*` (1220–1231), `algebraicDeRhamTrace` (1267), `tracePeriod_*` (1288), `projectiveBundleRelation` (1328), `panCompactificationRestriction`, `panAlmostIntegralComparison` (1380, 1396).

Claim: a backticked name of the roadmap's own is a claim that `Suggested.lean` declares it; the file declares nothing (correctly, see Verified sound). The gate's `readme-ids-missing` is 0 only because it checks namespace-qualified names.

Witness: `Suggested.lean` lines 38–42 (empty namespace); 63 distinct such names counted by regex.

Repair: write the names as prose labels (bold titles or plain words), as AInfCohomology did for its own API names, or state in the opening of each API list that the names are intended Lean interfaces not declared at the pins; do not add definitions to `Suggested.lean` for them (none makes a headline statable).

## R05 (P3) — `Suggested.lean` docstring form

Location: `Suggested.lean` lines 4–8.

Claim: the title is "headline targets" where the form is "<title>: target signatures", and the sentence "Statements here suggest Lean forms for headline theorems; discharging them finishes neither a layer nor the roadmap" describes statements the file does not contain.

Witness: lines 4–8 versus lines 38–42.

Repair: retitle "p-adic cohomology comparisons: target signatures" and replace the sentence by one saying the file states no theorem; keep the list of missing carriers (it is accurate).

## R06 (P3) — Locator and supplier-title drift

Location: §6.2 line 1167; §5.12 line 1085; §2.5 line 380.

Claim: (a) §6.2 cites Scholze's torsion paper by the preprint numbering (Theorem III.2.1, Corollaries III.2.2, III.2.6, Lemma III.2.4, Definition III.2.7, Proposition III.2.8, "pp.31–35") while the References entry is the Annals version with printed pages 945–1066 (and cites Theorem 3.1.2 by printed pages 971–972). In the Annals text these are Theorem 3.2.1 p.975, Corollary 3.2.2 p.976, Lemma 3.2.4 p.977, Corollary 3.2.6 pp.977–978, Definition 3.2.7 p.978, Proposition 3.2.8 p.979 (scholzetorsion lines 1183, 1208, 1241, 1269, 1307, 1320; file page 31 = printed 975). (b) §5.12 quotes CrystallineCohomology §CR.3.5 as "Proper smooth tests and a crystalline torsion surface"; its title at the head is "Computations and tests" (line 3209; the surface and both torsion groups are there, lines 3369–3444). (c) §2.5 drops Lemma 13.12(ii)'s hypothesis "if Σ is sufficiently large" (bms line 5405).

Repair: (a) cite by Annals numbers and printed pages, or add the preprint to the References; (b) quote the actual title or cite by number only; (c) add "for Σ sufficiently large".

## Verified sound

**Gate and depcheck.** `gate.md` at a99732e: all scanners 0 except residue=2 (R01); build=0. Dependency check run by me on this head:

    depcheck: 205 roadmaps, 1440 edges, 0 problem(s)

CohomologyComparisons is at merge-order line 161; every cited supplier is earlier (PadicPeriodRings 17, DerivedDeRhamCohomology 18, CrystallineCohomology 19, AlgebraicModuliForArithmeticGeometry 31, FiniteFlatGroupsAndIntegralPadicHodgeTheory 45, ClassicalAdicEtaleCohomology 52, AInfCohomology 53, PrismaticCohomology 54–56, LocallyAnalyticDistributions 63, ModularCurvesPartII 70, EtaleDualityAndPerverseSheaves 91, PadicHodgeTheory 107, PrismaticCohomologyPartIV 118, CompletedCohomologyPartII 159) or on main (AdicSpacesPartII/III/IV, AdicEtaleGeometry, EnhancedDerivedSheaves, EtaleCohomologyFoundations, PerfectoidSpaces, DerivedModuleAlgebra, SchemeAndStackFoundations, AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices; AdicSpaces, LocalGaloisGroups, ProfiniteArithmetic under Completed). Roadmaps named only in Downstream consumers (HodgeTateAndCanonicalSubgroups 164, PerfectoidShimuraVarieties 165, HabiroCohomologyFoundations 187, RefinedTraceMethods 306) are later and not on any `*Needs:*` line. No diff outside the roadmap folder.

**Lean.** `lake env lean` on `Suggested.lean` at the pins (Mathlib 6b7abb3c, Tau Ceti a91d3aa, matching the README's line 31 and 33 and `lake-manifest.json`): exit 0, no output. The file declares nothing, so the signature check and the one-tactic probe have nothing to test. Headline statability at the pins, checked by object: Mathlib has `AlgebraicGeometry.Scheme.EllAdicCohomology` (pro-étale ℓ-adic cohomology of a scheme, `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:75`, in `Type (u+1)`, no Galois action, no comparison), `BDeRhamPlus`/`BDeRham` (`RingTheory/Perfectoid/BDeRham.lean:75, 88`, no Galois action), `WittVector.fontaineTheta` (`FontaineTheta.lean:165`), `PreTilt.untilt` (`Untilt.lean:49`); no crystalline, prismatic, Hyodo–Kato, formal-scheme or rigid-analytic cohomology, and no algebraic de Rham cohomology (`Mathlib/AlgebraicGeometry` has no cotangent-sheaf or hypercohomology file); Tau Ceti has adic spectra, rational subsets and the Fargues–Fontaine window but nothing perfectoid-étale, crystalline or prismatic. So none of the headline theorems (BMS Theorems 14.5–14.6, CK Theorem 9.5, CN Theorems 6.2/6.4/6.8, GR Theorem 10.13, Hodge–Tate degeneration, Pan's Proposition 7.2.3) is statable, and the docstring's account of what each lacks is correct.

**Library names at the pins** (all found): `WittVector.frobeniusEquiv` (WittVector/Frobenius.lean:283), `AdicCompletion.eval_of` (AdicCompletion/Basic.lean:387), `AdicCompletion.ext` (Basic.lean:314), `AdicCompletion.evalₐ`, `evalₐ_of`, `ext_evalₐ` (Algebra.lean:132, 153, 171), `AdicCompletion.isAdicComplete` (Completeness.lean), `AdicCompletion.liftRingHom`/`IsAdicComplete.liftRingHom`/`eq_liftRingHom` (RingHom.lean:48, 169, 93, 184), `Module.length` (Length.lean:30, ℕ∞-valued as stated), `IsNilpotent.exp`, `exp_add_of_commute` (Nilpotent/Exp.lean:50, 76), `cyclotomicCharacter` (CyclotomicCharacter.lean:307), `ModuleCat.extendScalars` (ChangeOfRings.lean:399); Tau Ceti `PadicTateTwist`, `finrank`, `galoisRepresentation` (RootsOfUnity/PadicTateTwist.lean:69, 182, 195), `TauCeti.ValuationSpectrum.spaRationalFamily`, `inter_mem_spaRationalFamily` (Spa/RationalSubset/Basis.lean:93, 131, 188), `WittVector.frobeniusEquiv_symm_teichmuller` (WittVector/Frobenius.lean:49), `TauCeti.RingTheory.Nilpotent.Exp` (`nilpotentExpUnit`, `expZSMulHom`, lines 125, 149: integer-parameter, unit-valued, as the README says), `FarguesFontaine/Window.lean` exists.

**Supplier citations resolved at the heads** (section exists with the cited content): AInfCohomology §§AI.0.1, AI.0:integral.1–2, AI.0:period-comparison.1, AI.1.1–1.4, AI.2, AI.3–AI.5, AI.6.3–AI.6.7, AI.7.2 and the names `AInf.canonical_deformation_free` (l.3442), `AInf.canonical_rational_comparison` (3478), `AInf.integral_deformation_agreement` (3489), `AInf.bdr_infinitesimal_envelope.*` (3310–3313), `AInf.canonical_bdr_etale_map.*` (3462–3465), `AInf.Trace.THH` (3862), `AInf.Trace.bokstedt_periodicity` (3927), `Semistable.pNormalizedMonodromy` (3235), `Semistable.hyodoKatoInterface` (3278; its clause (iv) is CK (9.2.2) with `N_left=(e_K⁻¹N_raw)⊗1+1⊗N_p`, as §4.2 uses it). CrystallineCohomology §§CR.1.1–1.4, 2.1–2.3, 3.1–3.5, CR.3:Frobenius-isogeny.1, CR.3:duality.1, CR.4.6–4.7, CR.5, CR.6.1–6.5 (lines 613–11098). PrismaticCohomology §§0.73–0.82, 1.1–1.23, 2.1–2.30; PartII §§1.7, 3.9–3.10, 3.20, 4.25–4.31, 5.23–5.25; PartIII §§6.8–6.9, 7.0 with `Prismatic.Syntomic.syntomicComplex`, `syntomicCup`, `syntomicToFil` (330–337), `Prismatic.Trace.rationalBeilinson`, `relativeComparison_boundedDenominators` (919), `Prismatic.Beilinson.chi`, `chi_boundedDenominator`, `square`, `cofibre` (940); PartIV §§8.1, 8.27–8.29, 8.30–8.35, 8.41–8.42, 8.52–8.57, 8.60–8.61, 8.69. PadicHodgeTheory §§0.2–0.5, 2.1–2.7, 3.1–3.5, 6.1–6.2, 7.1–7.3, 8.1–8.2 with `prismaticSpecializationAgreement` (line 1426). PadicPeriodRings §§1.5, 3, 4.1–4.3. DerivedDeRhamCohomology §§1.14–1.22, 2.22–2.26, 5.14, 5.23–5.24, PD.1–PD.7. ClassicalAdicEtaleCohomology §§1.1–1.4, 4.1, 8.2, 9.5, 9.7, 11.1. FiniteFlatGroups… R07.1, R07.2.21, R07.3.1–3.3, R07.3.15–3.17 (3.17 is the `[0,p−2]` lattice theorem), R07.4, R07.6.6 (`illusieObstructionHomomorphisms`, line 8527). AlgebraicModuli… §§6.1, 7.8, 8.2, 9.4–9.7. EtaleDualityAndPerverseSheaves §§1.1–1.3, 4.4. LocallyAnalyticDistributions §§0.0–0.3. ModularCurvesPartII §3.15 (`contractionMapsBetweenLevels`, 1329), §4.11 (`fixedPairingIntegralComponents`, 1597). CompletedCohomologyPartII §§2.2–2.9, 4.3–4.5, 8.4, 8.6–8.7, F.4. PELModuli M3; AbelianSchemesAndArithmeticModuli A0–A4; DerivedModuleAlgebra §§0.4, 0.8, 1.1–1.9. On main: AdicSpacesPartII R0.15–R0.17; AdicSpacesPartIII F0, R2, R3.6–R3.7; AdicSpacesPartIV F1 (dagger); AdicEtaleGeometry A1.10–A1.12; EnhancedDerivedSheaves E0–E5; EtaleCohomologyFoundations 0.9–0.11, F.5–F.7; PerfectoidSpaces P2, P3.21 (etale-almost-acyclicity); SchemeAndStackFoundations §§4.11, 5.4–5.6, Layer 2 (§2.20 relative dualising complexes and Serre duality), Layer 4; AlgebraicVectorBundles L0B, L0C, L2B.

**Ownership against open work.** AutomorphicBundles (#1069, order 163) B3.HT.1 and HodgeTateAndCanonicalSubgroups (#1084, order 164) §§3.4, 3.6 import `smallHasseCanonicalSubgroups` from CohomologyComparisons §6.2 (their README lines 3226–3283 and 1210–1262), so §6.2 is the single owner of the shared subgroup. PerfectoidShimuraVarieties (#1085) assumes `g ≥ 2` in its tower chart targets (lines 720, 734, 748), leaving the genus-one tower to §6.2. GaloisSectionsPadicPeriodMaps (#1739) cites §§6.4–6.7 for the Betts–Stix compatibilities (lines 813–817, 902); CstConjectureForDaggerVarieties (#1759) cites §§4.8–4.11 (lines 461, 699, 779); CohomologyComparisonsPartII (#1364), RefinedTraceMethods (#1493) and HabiroCohomologyFoundations cite this roadmap as consumers. CrystallineCohomology §CR.3.5 constructs the BMS §2.2 torsion surface including the étale `ℤ/p²` via Hochschild–Serre (lines 366, 539, 3369–3444), so §5.12's use is an import. The Betts–Stix range (finite extensions of ℚ_p) is narrower than §6.4's complete discretely valued `K`; the proofs of Propositions 3.19–3.20 use only Scholze's comparison (Theorem 8.4, valid for such `K`), traces, Künneth and resolution, so the stated range is supported.

**Seeded sample, read at the locators** (cache ids: bms = 285f7d20, ck = 47000db5, gr = 3c49a5f2, schpht = ed9187b3, cn2 = bb1628cf, dllz = dccd18f6, pan2 = 0873b61a, bettsstix = 7aa79403; all open-repository or author-page texts):

- 1.6: bms Theorem 14.3(iv) line 5855 (page 120) states `RΓ_Ainf(X)⊗A_inf[1/μ] ≃ RΓ_ét(X,ℤ_p)⊗A_inf[1/μ]` for proper smooth `𝔛/O`; Lemma 4.26 line 2010 (pp.41–42) gives `M⊗W(C♭) = T⊗W(C♭)` and `M[1/μ] = T⊗A_inf[1/μ]`. Matches.
- 1.8: bms Theorem 14.1 and proof lines 5752–5800 (pp.118–119) and §12.2 at line 4796 ("The canonical isomorphism"). Matches.
- 2.5: bms Lemma 13.12 lines 5400–5409 (pp.110–111): `D_Σ(R) ≅ (R_A⊗̂_A B_dR⁺)[[X_u−ũ : u∈Σ, u≠T_1..T_d]]` for Σ sufficiently large. Matches up to R06(c).
- 2.12: bms Remark 13.20 line 5626 (p.114): `H^i_dR(X_0/K)⊗_K B_dR⁺ ≃ H^i_crys(X/B_dR⁺)` via the unique continuous lift `K→B_dR⁺`; proof of Theorem 13.1 line 5635 (p.115). Matches.
- 2.13: bms proof of 13.1, compatibility diagram lines 5671–5684 (p.115); schpht Theorem 8.4 line 2217 (p.48) for discretely valued `k` with perfect residue field, filtered comparison. Matches.
- 2.17: bms Theorem 14.5(i) and proof lines 5882–5906 (pp.120–121): compatibility of Theorems 12.1 and 13.1 "on the level of the explicit complexes". Matches.
- 3.1: bms Proposition 13.21 line 5709 and Remark 13.22 line 5729 (p.116): fix a section `k→O/p`, `H^i_crys(Y/A_crys)[1/p] ≅ H^i_crys(Ȳ/W(k))⊗A_crys[1/p]` φ-equivariantly; Theorem 14.6 proof line 5944 (p.122): canonical section for a discretely valued base. Matches.
- 4.1: ck §7.1–7.2 lines 3028–3040 (pp.68–69): `X` proper, `X_k` purely d-dimensional, the three specializations (7.2.1); Corollary 5.43 lines 2549–2556 (pp.58–59): the completed `A_cris` and `W(k)` log-crystalline identifications, ordinary tensors for proper `X`; Theorem 2.3 line 367 (p.9). Matches.
- 4.8: cn2 line 69–72 (p.2): `k` perfect and countable; footnote 6 lines 559–569 (p.12): separable sympathetic algebras using countability of `O_C/p`; Theorem 6.2 line 1985 and footnote 17 line 2008 (p.40): Beilinson's comparison for an arbitrary algebraic variety, φ, N, filtered `B_dR` form, (6.3). Matches.
- 5.2: bms Theorem 14.5(ii) lines 5888–5890 (p.120): `length_{W(k)}(H^i_crys,tor/p^n) ≥ length_{ℤ_p}(H^i_ét,tor/p^n)` for all `n ≥ 0`. Matches.
- 5.6: bms Theorem 1.1 lines 92–106 and inequality (1) line 120 (pp.2–3): `dim_k H^i_dR(X_k) ≥ dim_{F_p} H^i_ét(X_C,F_p)` for proper smooth formal `𝔛/O_K`. Matches.
- 6.1: dllz Definition 2.2.10 lines 596–611 (pp.12–13): `S_{i,r}` as the monoid algebra of `M_i×_M M♭` over `R_i⊗̂W(R♭⁺)/ξ^r` modulo `α_i(a′)=[α♭(a″)]e_a`, `Fil^r=(ker θ_log)^r`; Proposition 2.3.15 line 859 (pp.18–19): `B_dR⁺[[P−1]] ≅ OB_dR,log⁺` filtered; Corollary 2.4.2 line 940 (pp.20–21): Poincaré lemma; Corollary 2.4.5 line 974 (p.21): log Faltings extension. pan2 §6.3.5–6.3.8 lines 4220–4291 (pp.99–101): properties (1)–(4), `∇_log`, the strict Poincaré sequence, (6.3.2), (6.3.3). Matches.
- 6.3: gr Convention 10.12 line 4988, Theorem 10.13 line 4992 (p.99): `(A,I)` perfect, p-completely flat over `(A_inf,[p]_q)`, `A⊗_{W(k)}O_K` admits a map from `R` compatible with `R→A`, filtered isomorphism over `B_dR(A)` with the `I`-adic and Hodge-tensor filtrations; Remark 10.14 lines 5002–5018 (pp.99–100): functorial in the prism and section, canonical after `OB_dR`; Construction 10.15 line 5040 (p.100); §6.1 line 2743 (p.55) `D^b_lisse`; Theorem 9.15 line 4654 (p.92); schpht Theorem 8.8(ii) lines 2368–2374 (p.52). Matches.
- 6.4: bettsstix Proposition 3.19 lines 1366–1388 (p.27): graded-algebra, naturality, finite extension, Künneth. Matches.
- 6.11: pan2 §1.2.2 lines 253–258 (p.6): `χ̃_k` is the infinitesimal character of `Sym^{k−1}` of the dual of the standard representation; §3.3.2 lines 1034–1045 (p.24): `K_∞` the maximal `ℤ_p`-extension of `K` in `K(μ_{p^∞})`, `ℤ_p^× = (ℤ/p)^× × (1+2pℤ_p)`, `W_K` = `G_{K_∞}`-fixed `G_K`-analytic vectors; Proposition 6.3.9 lines 4303–4311 (pp.100–101): (1)–(3) and the graded pieces `O^{la,χ̃_l}(U)(j)_K⊗Ω¹(C)^{⊗(i−j)}`, independence of `k>i`. Matches.

Also read (not in the sample): bms Theorem 14.6 (pp.121–122), Remark 14.4 (p.120), Theorem 2.10 (p.17: `H²_ét(H_C,ℤ_p)_tor ≅ ℤ/p²`, `H²_crys(H_k/W)_tor ≅ k⊕k`), Lemma 4.18 (p.39), Example 4.24 (p.41), §4.3 line 1576 (`𝔖→A_inf`, `T ↦ [π♭]^p`, as §0.4 states), Proposition 4.34 (p.44), Proposition 13.23 (p.117); ck Proposition 9.2, Remark 9.3, §9.1 (`N=−d/dT`, `φ(T)=pT`, `Nφ=pφN`), Theorem 9.5, Remark 9.6 (pp.75–77), Theorem 7.9 (p.70), Lemma 7.11 and Theorem 7.12 (p.71), Theorem 8.7 and Remark 8.8 (p.74), Proposition 6.8 (p.66); gr Definition 10.1–Lemma 10.3 (p.94), Convention 10.4–Construction 10.6 (p.95), Theorem 10.7 (p.96), Corollaries 10.8–10.9, Proposition 10.10 (p.97), Proposition 10.11 and (36) (p.98), Corollary 6.14 (p.61); cn2 Theorem 6.4 and proof (pp.40–41), Remark 6.7, Theorem 6.8 with the filtration `Im(H^r(Fil^i)→H^r)` and Remark 6.10 (p.42); ammn (2a0224b2) Definition 7.10 and Theorem 7.11 (p.52), Construction 7.12 and Theorem 7.13 (p.53), Theorem 6.17 and Construction 6.16 (p.44), Example 6.13 (p.43), Lemma 6.19 (p.45), Definition 5.5 (p.26); pan1 (c2fed4f1, arXiv v3) §4.4.1 (p.47), Corollary 4.4.3 and Lemma 4.4.4 (p.48), Theorems 4.1.2 (p.33) and 4.1.7 (p.36); guo (718c048a) Theorem 1.2.7 (p.5), Corollary 1.2.11 (p.6), Remark 2.2.2 (p.13), Lemma 4.1.10 (p.31); cn1 (f4798bc3) Theorem 4.6 (p.38), Theorem 4.27 (p.46), Corollary 4.32 (p.47), standing "separated, taut" (line 312); cdn (2cdb1de2) Proposition 3.12 (p.36); bms2 (5e584923) Theorem 1.12 (p.6), Remark 1.14 (p.7), Theorem 1.15 (p.8); koshikawa (90f68a84) Theorem 8.1, Remarks 8.2–8.3 (p.45), Theorem 8.5 (p.49); ky (7c55cba2) Theorem 2 (pp.2–3); scholze erratum (3cfa56b9) items (1)–(3); scholzetorsion (ebac854f) Theorem 3.1.2 (printed 971) and §3.2 (see R06 and Source issues).

**Adversarial pass.** One row per statement checked; values computed on each side.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| §0.1 `μ = ξ·φ⁻¹(μ)` | `x=[ε^{1/p}]`, any ε | `(Σ_{i<p} x^i)(x−1) = x^p−1 = [ε]−1`; at ε=1 both sides 0 | holds for all ε as stated | none |
| §0.1 wrong models | `ξ=μ`; `ξ=φ(μ)/μ=ξ̃` | with `ξ=μ`: `θ̃(μ)=ζ_p−1` but `θ̃(μ·φ⁻¹μ)=(ζ_p−1)(ζ_{p²}−1)`, unequal; with `ξ=ξ̃`: `θ(ξ̃·φ⁻¹μ)=p(ζ_p−1)≠0=θ(μ)` | both excluded by `μ=ξ·φ⁻¹(μ)` | none |
| §0.1 `θ(ξ)=0`, `θ(ξ̃)=p`, `w(ξ)=p`, `w(μ)=0` | primitive ε | `Σ_{i<p} ζ_p^i = 0`; `θ(ξ̃)=Σ θ([ε])^i = p`; in `W(k)`: `[ε^{1/p}]↦1` since `(ζ_p−1)^p ∈ pO`, so `ξ↦p`, `μ↦0` | all hold | none |
| §0.1 `ξ̃=φ(ξ)`, `ker θ̃=(ξ̃)` | — | `θ̃(φ(ξ))=θ(ξ)=0`; wrong `ξ̃=φ⁻¹(ξ)`: `θ̃(φ⁻¹ξ)=θ(φ⁻²ξ)=Σ ζ_{p³}^{i}·…≠0` | holds; wrong model excluded | none |
| §0.1 residue at odd p | tilt element −1 | residue −1 ≠ 1 in k for p odd; at p=2, −1=1 | Check correct, p=2 excluded as stated | none |
| §0.4 no unital `W(F̄_p)→ℤ_p` | — | would induce field map `F̄_p→F_p`, injective, impossible | holds | none |
| §0.4 `𝔖→A_inf`, `u↦[π♭]^p` | bms line 1576 | source: `T ↦ [π♭]^p` | convention matches | none |
| §1.10 derived reduction | `R=ℤ, a=p, K=ℤ/p`; `R=ℤ/4, a=2, K=ℤ/2` | `Tor_1^ℤ(ℤ/p,ℤ/p)=ℤ/p` in degree −1; over `ℤ/4` periodic resolution gives `Tor_i=ℤ/2` all i, so `H^{−2}=ℤ/2`; derived quotient: `[ℤ/2 →0 ℤ/2]` in degrees −1,0 | three Checks correct | none |
| §1.11/§3.7 syntomic at `F_p` | weight 0; weight 1; `R=ℤ_p, i=1` | `fib(1−φ=0 on ℤ_p) = ℤ_p⊕ℤ_p[−1]`; `φ−p = 1−p` unit so `ℤ_p(1)(F_p)=0`; square: `fib(0→ℚ_p)=ℚ_p[−1]`, consistent with `(ℤ_p^×)^∧⊗ℚ=ℚ_p` | correct | none |
| §2.14 degeneration | `P¹` | `h^{0,0}+h^{1,1}=2=dim H⁰_dR+dim H²_dR`, `h^{1,0}=h^{0,1}=0` | consistent | none |
| §2.15 twist sign | `P¹`, `b=1` | `E_2^{1,1}=H¹(Ω¹)(−1)` ⇒ `H²_ét⊗C = C(−1)`, weight −1 with `ℚ_p(1)` of weight +1 | consistent with Conventions | none |
| §2.18 `F_GR` | `ξ̃↦ξ`, `t↦t/p` | `φ⁻¹(φ(ξ))=ξ`; `φ⁻¹(log[ε])=log[ε^{1/p}]=t/p`; untransported `θ(ξ̃)=p`, a unit after inverting p | Check correct | none |
| §2.19 Check | `p=5`, `y²z=x³−xz²` | `Δ=−16(4(−1)³)=64`, good reduction at 5; `H¹(E,O)` rank 1, flat base change | correct | none |
| §2.20 ranks | genus g curve, trivial crystal | `1, 2g, 1` | correct | none |
| §3.4/§3.5 `B_cris^{G_K}=K_0` | `K=ℚ_p`, point | both maps identity on `B_cris`, `D_cris=ℚ_p` | Check correct | none |
| §3.8 arithmetic point | `𝔛_0=Spf ℤ_p` | `RΓ_crys(Spec F_p/ℤ_p)=ℤ_p`, upper right `fib(φ−p^i on A_cris)[1/p]`; no map `F̄_p→F_p` | consistent | none |
| §3.8 triangle sign | corner maps identity | `(right,−bottom)∘(top,left)(x) = x−x = 0` | correct | none |
| §4.5 transport | `N e_1=e_0`, `N e_0=0` | `exp(−cN)e_1 = e_1−ce_0`; `e=2`, `c=2ℓ`, `N_norm=E_{12}/2`: `1−ℓE_{12}`; `c+d`: `1−(c+d)N` | correct | none |
| §4.5/§4.7 `Nφ=pφN` | `φ=diag(1,p)`, `N=E_{12}` | `Nφe_1=pe_0=pφNe_1`; `φN e_1=e_0` vs `pNφe_1=p²e_0` | holds; reverse fails for `p²≠1` | none |
| §4.5 `N_Bst(log[π♭])=−1/e` | ck §9.1 `N=−d/dT`, `T` the p-torsor coordinate | `log[p♭]=e·log[π♭]+log(unit)`, so `N(T_π)=−1/e` | consistent with AInf AI.6.4 witness (√5 example gives 1/2) | none |
| §5.2 `truncatedTorsionLength` | `ℤ/p²`; `(ℤ/p)²`; `ℤ`; `n=0` | lengths 1,2 and 2,2; 0; 0 | Checks correct | none |
| §5.2 inequality on BMS Thm 2.10 | `ℤ/p²` vs `k⊕k`, `k` the residue field | `n=1`: 1 ≤ 2; `n=2`: 2 ≤ 2 (length over `W(k)` of `k⊕k` is 2) | consistent | none |
| §5.6 derivation | `n=1` of §5.5 in degrees i, i+1 | `dim H^i_dR(X_k) = rk + dim(tor_i/p) + dim(tor_{i+1}[p])`, same for `F_p`-étale, ranks equal | bound follows | none |
| §5.8 normalized length | `O_K/(π)`, `O_K/(p)`, `a=0` | `1/e`, `1`, Fitting ideal 0 ⇒ excluded | correct | none |
| §5.12 exponent | `ℤ/p²` vs `(ℤ/p)²` | `p` kills the second, not the first; subquotients of a p-killed module are p-killed | no inclusion | none |
| §6.1 connection | `∇_log(X²)`, `∇_log(j(q²))` | `2X∇_log X`; `2j(q)²dlog q`; `res dlog q = 1`, `res dlog 1 = 0` | correct | none |
| §6.2 Hasse exponents | `m=1,2` | `(p−1)/(p−1)=1`, `(p²−1)/(p−1)=p+1` | correct | none |
| §6.2 points at p=2 | `R′={(a,b)∈O_C²: a≡b mod 2}`, `s=(−1,1)∈μ_2(R′)` | `s−1=(−2,0)`; `√2(a,b)=(−2,0)` forces `(−√2,0)∉R′`; but `(−2,0)²=(4,0)=2·(2,0)∈2R′` | `s∈C_1(R′)` and not `≡0 mod 2^{1/2}`: forward inclusion of Scholze Cor. 3.2.6 fails; README direction correct | none (Source issues) |
| §6.2 charts | `U_1={∣x∣≤1}`, `U_2={∣x∣≥1}` | `0∈U_1∖U_2`, `∞∈U_2∖U_1`, intersection `∣x∣=1` | Checks correct | none |
| §6.3 lift | `K=ℚ_p(√p)` | `b²=p` in `A_inf` ⇒ `b̄²=0` in domain `O_C^♭` ⇒ `b=pz` ⇒ `pz²=1`, impossible | Check correct | none |
| §6.3 curve | genus g, `T=ℤ_p` | Hodge pieces `1,g,g,1`; `H¹` weights `0,−1` each `g` | consistent with §0.4 and §4.12 | none |
| §6.5 scalar model | `a=2` | `2` vs `1/2` | direction detected | none |
| §6.6 twist | `(c_dR⊗a^{⊗−r})` | bettsstix (3.10): `H^{2r}_ét(r) → H^{2r}_dR⟨r⟩` | matches | none |
| §6.8 relation | rank 1; trivial rank 2; `L⊕M` | `h−c_1`; `h²`; `(h−c_1(L))(h−c_1(M))`; sub-line convention gives `h+c_1` | Checks correct; Grothendieck convention | none |
| §6.11 p=2 | `Gal(ℚ_2(μ_{2^∞})/ℚ_2)` | `ℤ_2^× = {±1}×(1+4ℤ_2)` | Check correct; pan2 line 1037 uses `1+2pℤ_p` | none |
| §6.11a residues | `c` cusps; `q=q′^{p^r}` | Gysin: cokernel rank `c−1`; pullback multiplies the residue by `p^r`, zero mod `p^m` for `r≥m`; `H²` pullback by degree `d` is `d` | Checks correct | none |
| §6.15/§6.11 truncation | `gr^i(B_dR⁺/t^k)` | zero for `i≥k` | `k>i` needed | none |
| §4.1 chart hypotheses | ck Theorem 9.5 | `π∈O_K∖{0}` nonunit, varying with `U`; §7.1 `X_k` purely d-dimensional | matches | none |

## Not verifiable

- none. Every cited text was read from an open repository or an author page; the Annals copy of Scholze's torsion paper is a publisher-open PDF. Koshikawa's Definition 4.1 was located only by reference (line 144); not needed for any sampled target.

## Source issues

- **Error** in Scholze, On torsion in the cohomology of locally symmetric varieties, at Corollary 3.2.6 (preprint III.2.6), printed pp.977–978: the source says the canonical subgroup's points over every p-adically complete flat ℤ_p^cycl-algebra R′ are exactly the sections congruent to zero modulo p^{(1−ε)/p^m}; it should assume R′ integrally closed in R′[1/p] (the proof extracts a p^m-th root of a coordinate), or state only that congruent sections lie in C_m; affects a stated result (witness: p=2, R′={(a,b)∈O_C²: a≡b mod 2}, s=−1∈μ_2=C_1).
