# Review of CompletedCohomologyAndLocalGlobalCompatibility (pull request #1270 at 873a475)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/` at `873a475dd561603601f69487e9d5f135a7370202`. Since `bd1e251` the folder changed by 192 lines. `Suggested.lean` now holds only its docstring and namespace. §0.7 cites OverconvergentAutomorphicForms §0.7 and ArithmeticStatisticsPartIV §3.2, and the pins and locators are corrected.

The gate passes and the dependency check is clean. All nine findings of the previous review are repaired. All 15 seeded targets agree with their sources. Five P3 defects remain, none blocking.

## R01 (P3) — Lean names credited to three suppliers that declare none of them

**Location:** `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:133` (“§§1.1–1.2 supplies `relativeAnnulus`, `relativeRobba`, `RelativePhiGammaModule` and `relativeDrig` … Its §§7.1 and 7.5 supply `characterModule` and `Triangulation`”). Also:
- line 197 (“§R18.4.8, `residualEisensteinVanishing`”) and line 650 (unbackticked);
- line 2133 (“satisfies `PanNicePrime` of GL2ModularityLifting §10.1”), line 2135 (“`PanNicePrime.lattice`, `PanNicePrime.iff`”) and line 2150.

**Claim.** The cited sections exist and supply the objects. The relative annulus and Robba ring, relative (φ,Γ)-modules and their realization, character lines and saturated triangulations are in PhiGammaModulesAndIwasawaCohomology §§1.1, 1.2, 7.1 and 7.5. Residual Eisenstein vanishing is HilbertModularVarietiesAndShimuraCurves §R18.4.8, and the nice Hecke prime is GL2ModularityLifting §10.1. None of these suppliers declares the ten backticked or parenthesised names, in its README or in its `Suggested.lean`. Each name is a claim about a supplier that cannot be resolved. This is the defect class of the previous review's R07, which this head repaired only for PadicLocalLanglandsForGL2Qp.

**Witness.** PhiGammaModulesAndIwasawaCohomology (#1310) README lines 761, 868, 2800 and 3008 state the objects in prose; no file contains these names. HilbertModularVarietiesAndShimuraCurves (#1005) README line 3474, and GL2ModularityLifting (#1071) README line 2478, are prose-only. `roadmaps grep` finds `PanNicePrime` and `residualEisensteinVanishing` only in this README.

**Repair.**
- Line 133: “the relative annulus and relative Robba ring of PhiGammaModulesAndIwasawaCohomology §1.1, its relative (φ,Γ)-modules and relative realization of §1.2, the character modules of §7.1 and the saturated triangulations of §7.5”.
- Lines 197 and 650: “HilbertModularVarietiesAndShimuraCurves §R18.4.8 (residual Eisenstein vanishing)”.
- Line 2133: “is nice in the sense of GL2ModularityLifting §10.1”.
- Line 2135: “The nice-prime predicate, its lattice extraction and its characterisation are those of GL2ModularityLifting §10.1”.
- Line 2150: write “GL2ModularityLifting §10.1 (Pan's nice Hecke prime)”.

After these edits, every backticked name in the README is declared at the pins or in the cited supplier: the remaining Mathlib, Tau Ceti and AutomorphicFormsOnReductiveGroups names were all checked (see Verified sound).

## R02 (P3) — Catalogue handles used as names in five *Needs:* lines

**Location:** `README.md:650` (“shimuraH0_nonEisenstein (coefficient extension contract)”), line 1268 (“§3.5a (allowablePoint_deformation)”), lines 1594 and 1674 (“§4.1 (awayFamily_descent, awayFamily_product)”), and line 1807 (“panBlockDimension (supplier contract)”).

**Claim.** These are Lean-style identifiers for targets of this roadmap. They are not the literature's names, the README defines none of them, and `Suggested.lean` declares nothing. A reader cannot resolve them. The house style requires standard vocabulary or a definition.

**Witness.** Each token occurs only on the lines cited. The targets carry prose titles elsewhere: “Shimura H⁰ coefficient extension” (line 197), “allowable-point deformation comparison” (line 1237), “the finite-residue-field descent” and “the product co-Whittaker comparison” (lines 1467–1468), and “Pan block dimension comparison” (line 174).

**Repair.** Replace each handle by its prose title:
- line 650: “the Shimura H⁰ coefficient extension of the further comparison inputs”;
- line 1268: “§3.5a (allowable-point deformation comparison)”;
- lines 1594 and 1674: “§4.1 (finite-residue-field descent and product co-Whittaker comparison)”;
- line 1807: “the Pan block dimension comparison of the supplier contracts”.

## R03 (P3) — Four garbled sentences

**Location:** `README.md:278` (“Prove the cohomological structure comparison the reducible Banach structure comparison on the domain of Definition 3.3.15”), line 280 (“Construct the cohomological adapter the nonspecial crystalline completion comparison to PadicLocalLanglandsForGL2Qp §§3.8 and 4.3”), line 1050 (“The arithmetic comparison the cohomological Hecke-image comparison identifies this ring”) and line 1824 (“Then its the integral duality comparison transports (1)”).

**Claim.** In each sentence two noun phrases sit side by side, apparently left over from a renaming, so the sentence does not parse. The statements are targets, so the reader cannot tell which comparison is meant.

**Witness.** The four quoted passages.

**Repair.**
- Line 278: “Prove the cohomological form of the reducible Banach structure comparison on the domain of Definition 3.3.15 …”.
- Line 280: “Construct the cohomological adapter of the nonspecial crystalline completion comparison of PadicLocalLanglandsForGL2Qp §§3.8 and 4.3 …”.
- Line 1050: “The cohomological Hecke-image comparison identifies this ring …”.
- Line 1824: “Then its integral duality comparison transports (1) …”.

## R04 (P3) — The CDP page range starts one page early

**Location:** `README.md:280`, line 1741 and line 2388 (“CDP Theorem 3.23(a), §3.3.4, pp. 24–26”).

**Claim.** Neither §3.3.4 nor Theorem 3.23 is on p. 24, which ends §3.3.3.

**Witness.** In the arXiv text the README links, the page-25 marker is at CDP line 1142. §3.3.4 begins at line 1146 and Theorem 3.23 is at line 1161, both on p. 25. The exceptional-case proof ends on p. 26 (line 1189 onwards).

**Repair.** Write “pp. 25–26” in all three places.

## R05 (P3) — A source summary restates the exponent that the roadmap calls a source slip

**Location:** `README.md:907` (“EM11, §7.4, pp. 97–98: At a classical point of conductor N, `Ĥ^1(K_1^p(N))[𝔭]_{l.alg} ≅ ρ(𝔭) ⊗ Sym^{a−b−1} ⊗ det^b ⊗ π_p(V)`”).

**Claim.** Lines 221 and 2251 say that the `det^b` printed in EM11 §7.4 is a slip for `det^{b+1}`. Line 907 nevertheless states the `det^b` formula, unflagged, as the content of §7.4, so the README contradicts itself.

**Witness.** Take weight 2, so (a,b) = (0,−1). Then `det^b = det^{−1}` and the scalar uI acts by u⁻² ≠ 1. The worked example at line 898 and §6.3's Check at line 2266 give the trivial algebraic factor, with scalar 1. EM11 line 5129 prints `det^b`; Theorem 3.3.22 (EM11 line 1441) has `det^{b+1}`.

**Repair.** Write `det^{b+1}` at line 907 and add “(EM11 prints `det^b`; see §6.3)”. Tested at (a,b) = (0,−1): `det^0` acts by 1, which matches line 898.

## Previous findings (review at `bd1e251`)

- **R01 (P2, two owners of the rank-n completed unitary space): repaired.** Scope row line 30 assigns the completed space “of rank n ≥ 2 at small tame level” to OverconvergentAutomorphicForms §0.7. Line 154 imports it from there and extends CompletedCohomologyPartII §8.5 only to “rank `n = 1` … and tame levels whose classes have nontrivial stabilizers”. Lines 23, 139, 390 and §5.1 step 4 (line 1887) agree. OverconvergentAutomorphicForms §0.7 (#1422 README line 398) states exactly that object, for n ≥ 2.
- **R02 (P3, `haveI`) and R04 (P3, API catalogue in Lean): repaired.** All seven declarations are deleted. `Suggested.lean` lines 106–108 say that the split-place identities are API. README lines 412–414 use no Lean name of the roadmap's own.
- **R03 (P3, module warnings): repaired.** Line 1 is `module`. `lake env lean` prints nothing.
- **R05 (P3, Gaussian binomials unowned): repaired.** The scope row at line 22 and lines 137, 412 and 431 cite ArithmeticStatisticsPartIV §3.2 (#1172 README line 130).
- **R06 (P3, wrong pins): repaired.** README line 69 and `Suggested.lean` lines 13–14 give `1b1ccf4b…` and `2fd255d9…`, which are the pins of `lake-manifest.json`.
- **R07 (P3, PadicLocalLanglandsForGL2Qp names): repaired.** `MontrealFunctor`, `GL2Block`, `WDTypeRing`, `residualGalois` and `blockIdentification` no longer occur. Line 264 now reads “the bijection `B ↔ ρ̄_B` of its §5.2, with the block identifications of its §5.6”. The same defect class persists for three other suppliers (R01 above).
- **R08 (P3, page ranges): repaired.** Line 1399 reads “pp. 38–39”, line 2073 “pp. 19–20” and line 2075 “pp. 53–59”.
- **R09 (P3, process vocabulary): repaired.** No “node” remains. Line 186 reads “ModularCurvesPartII §14.9, stated for residue characteristic `ℓ ≥ 3`, is not sufficient”, and line 170 “§1.1’s local lifting ring supplies representability only”.

## Verified sound

### Gate, dependency check and elaboration

```text
gate CompletedCohomologyAndLocalGlobalCompatibility: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
depcheck: 240 roadmaps, 2457 edges, 0 problem(s)
```

- The dependency check shows no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- `lake env lean` on `Suggested.lean` exits 0 with no message.
- `Suggested.lean` declares nothing, so the `#check @name` comparison and the one-tactic padding probe have nothing to test.

### Headline theorems (README Summary and Layers 4–6)

| | Headline |
|---|---|
| H1 | Emerton Theorem 1.2.1 (§4.5) |
| H2 | refined compatibility (§4.4) |
| H3 | mod-p compatibility (§4.6) |
| H4 | completed-homology duality (§4.7) |
| H5 | definite quaternionic compatibility (§4.9) |
| H6 | Pan's block compatibility and classicality (§4.11) |
| H7 | Scholze's Shimura-curve comparison (§4.12) |
| H8 | patched support and Breuil–Mézard (§§5.3–5.6) |
| H9 | Pan's nice-prime and residually irreducible theorems (§§5.7–5.8) |
| H10 | §§6.1–6.4 |

None is statable at the pins:
- Mathlib `1b1ccf4b` has `AlgebraicGeometry.Scheme.EllAdicCohomology` (`Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:76`). That is pro-étale ℤ_ℓ-cohomology of a single scheme.
- Tau Ceti has modular-curve moduli problems (`TauCeti/AlgebraicGeometry/ModularCurve/`).
- Neither library has the p-level towers with their G-action, B(V), deformation rings, patched modules or Galois representations of eigenforms.

The docstring (lines 18–100) names each missing carrier by section. That is correct, so no headline is missing or forced through a stand-in.

### Library declarations opened at the pins (24)

Mathlib:
- `AdicCompletion.eval_surjective` (`RingTheory/AdicCompletion/Basic.lean:395`)
- `AdicCompletion.pow_smul_top_eq_ker_eval` (`RingTheory/AdicCompletion/Completeness.lean`)
- `Representation.IntertwiningMap` (`RepresentationTheory/Intertwining.lean:36`)
- `ContIntertwiningMap` (`RepresentationTheory/Continuous/Basic.lean:81`)
- `PrimeSpectrum.zeroLocus_eq_univ_iff` (`RingTheory/Spectrum/Prime/Basic.lean:302`)
- `range_comap_of_surjective` (`RingTheory/Spectrum/Prime/RingHom.lean:236`)
- `Module.support_eq_zeroLocus` (`RingTheory/Support.lean:216`, needs `Module.Finite`)
- `Subalgebra.topologicalClosure` (`Topology/Algebra/Algebra.lean:263`)
- `PadicInt.dense_span_mahler` (`NumberTheory/Padics/MahlerBasis.lean:392`)
- `IsUltrametricDist` (`Topology/MetricSpace/Ultra/Basic.lean:47`)
- `IsNonarchimedeanLocalField` (`NumberTheory/LocalField/Basic.lean:46`)
- `IsHeckeTriple` (`NumberTheory/HeckeRing/Defs.lean:75`)
- `HeckeRing`, `Field.absoluteGaloisGroup`, `IsDedekindDomain.FiniteAdeleRing`, `RingCat.sectionsSubring`, `CuspForm`, `ringKrullDim`: all present in their stated files.

Tau Ceti:
- `HeckeCoset.degree` (`TauCeti/NumberTheory/HeckeRing/Basic.lean:902`)
- `HeckeCosetModule.single` (same file `:969`)
- `HeckeCosetModule.single_mul_single_of_mem_normalizer` (`.../Normalizer.lean:219`)
- `LeftCosetModule.deg` (`.../Degree.lean:104`, a ring homomorphism)
- `TauCeti.diagGL` (`TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Diagonal/Basic.lean:107`)

### Cross-roadmap citations resolved (67)

Each was checked at the head given in the brief, or on main:
- **CompletedCohomologyPartII (#1035):** 31 cited sections. These are §§1.5, 2.1, 2.10, 3.1, 3.13–3.17, 4.7, 5.1, 5.3–5.5, 6.1, 6.3–6.5, 6.7, 7.1–7.2, 8.1, 8.3–8.4, 8.7, 8.10–8.15. §8.5 (line 1795) is stated for LLHLM's definite `GL_3`, as line 154 says.
- **OverconvergentAutomorphicForms (#1422):** §§0.6 and 0.7 (lines 315, 398).
- **AutomorphicFormsOnReductiveGroups (#1037):** §7.4 (line 1219, `LevelAlgebraicModularForm` and `inverseActionHeckeEquiv`) and §7.5 (line 1246).
- **IntegralHeckeAndGaloisDeterminants (#1689):** §3a.1 (line 1612, both named targets), §1.2 (1865), §1.3 (2152) and §4.2 (3178).
- **ArithmeticStatisticsPartIV (#1172):** §3.2 (line 128).
- **GlobalGaloisDeformations (#920):** R04.3–R04.6 and G7 (table lines 31–36), §4.7 (854), §4.11 (996) and §6.6 (1574, `DyadicPatchingDatum`).
- **HilbertModularVarietiesAndShimuraCurves (#1005):** §R18.4.8 (line 3474).
- **GL2ModularityLifting (#1071):** §10.1 (line 2478). CC1–CC5 are stated there as conditional hypotheses (line 17), so this roadmap is not cited upward.
- **EndoscopicTransferAndUnitaryTraceComparison:** §§12.3, 12.5–12.8.
- **AdicEtaleGeometry (main):** A1.6 and A4.2a.
- **ReductiveGroupsPartII (main):** RG2.0a.
- **PerfectoidTowers:** P9.4.
- **DiamondEtaleCohomology:** C0–C1.
- **PhiGammaModulesAndIwasawaCohomology (#1310):** §§1.1, 1.2, 7.1, 7.5 (sections present; names see R01).
- **ArithmeticGaloisRepresentations (#856):** `GaloisRep.carayol_conj_of_trace_eq` (its `Suggested.lean` line 332).
- **LocalGaloisGroups and ProfiniteArithmetic:** both on main under `Completed/`.

### Ownership and overlaps

The overlap report lists no dropped id, no revision-only id and no conflicting head. Read against the open heads:
- **ScholzeFunctorAndModpCohomologyOfTheLubinTateTower (#1757, merge order 377):** imports this roadmap's §0.6, §1.7(c)–(d) and §4.12 by name (its README line 9). The direction of supply is single, and there is no second owner.
- **TriangulineVarietyAndItsLocalModel (#1829, order 259):** cites §5.2a here and declares `gap:unrestricted-trianguline-variety` on it (its README line 107). That is a consumer's request, not a defect of this folder.
- **HilbertModularVarietiesAndShimuraCurvesPartII (#1745):** §5.6 works with BHHMS's Shimura curves split above p, which is a different carrier from §1.5 here.
- **QuaternionicModularForms §2.1:** a parallel specialisation of AutomorphicFormsOnReductiveGroups §7.4, as found before.
- **§0.7's local Hecke facts:** they rely on SmoothRepresentationsOfLocalGroups SR.1.2/1.4/1.5/4.1/4.3, IntegralHeckeAndGaloisDeterminants §3a.1 and ArithmeticStatisticsPartIV §3.2. None of these states the coset counts, quadratic relation or inversion identity.

### Seeded sample: 15 targets read at their locators

Texts were fetched through the sources service (the sources are listed under the table). All 15 agree with their sources, including hypotheses.

| Target | Passage read | Outcome |
|---|---|---|
| 0.1 | EM11 Defs 3.1.1 (line 706, p. 14), 3.1.11, 3.1.13, Prop 3.1.12 (lines 790–813, p. 16), Prop 3.1.3 (732), Lemma 3.1.6 (751–773, p. 15), Lemmas 3.1.16–3.1.17 (836–848, p. 17); EM-ORD1 Thm 4.4.6 (line 1759, p. 36); EM-JAC1 Defs 3.4.1–3.4.5 (lines 1532–1562, journal p. 806), Thm 4.2.32 (2710, p. 828), Props 4.3.4–4.3.6 (p. 834) | Agrees. The README correctly replaces Lemma 3.1.6's rational injectivity by rational isomorphism (Source issues). |
| 0.3 | CDP §3.3.4 and Thm 3.23 (lines 1146–1200); BB Déf 4.2.4 (p. 37), Thm 4.3.1 (p. 38), Cors 5.3.1–5.3.3 (p. 52); BS07 §1 (p. 2), §4 (pp. 14–17); EM11 Def 3.3.15, Prop 3.3.24, Props 3.4.2, 3.4.5 (lines 1367, 1458, 1488, 1557) | Agrees. “Nonspecial” includes the exceptional case (δ₁ = x^κδ₂ versus x^{κ−1}εδ₂). Page start: R04. |
| 0.4 | EM11 Thm 3.3.13, Rem 3.3.14 (lines 1339–1348, p. 26); PAN Thms 3.4.5–3.4.6, Lemmas 3.4.10–3.4.11, Cor 3.4.12, Rem 3.4.13 (lines 1159–1218, pp. 27–28); PASKUNAS-IMAGE Thm 1.10 (p. 6), Prop 4.17 (p. 38), Cor B.5 (p. 153); NAK Prop B.26 (line 4464); PASKUNAS-2ADIC §2.2 “no assumption on the prime p” (line 379), Thm 2.22 (line 701, p. 15) | Agrees, including the finite central map with no centre isomorphism, and p = 3 retained through PASKUNAS-2ADIC §2.2. |
| 1.4 | EM11 Def 5.3.7, Lemma 5.3.8, (5.3.9), Rem 5.3.10 (lines 2598–2640, pp. 50–51), Prop 5.3.15 (2678, p. 52), Cor 5.3.19 (2760, p. 53) | Agrees; neatness is retained. EM11's r > 0 is stated as r ≥ 0, which is weaker and true. |
| 2.7 | DLB Lemmes 4.5–4.7 (lines 877–911, pp. 21–22); PAN 3.2.10 | Agrees. DLB still prints `π_f^{K_p}` (line 911). |
| 3.1 | EM11 Def 5.2.1 (2397), Def 5.2.2, Rem 5.2.3 (2430–2466, p. 47), Lemma 5.2.4 (2492–2506, p. 48) | Agrees; the eventual isomorphism holds below level `N_{Σ₀}`. |
| 3.7a | PAN §5.3.1 (lines 3156–3168), §5.6, Prop 5.6.1, Rem 5.6.2 (3738–3751, p. 86), proof and Lemma 5.6.9 (3905–3976, pp. 89–91) | Agrees: θ̄, the weight-one Eisenstein series, Θ, cuspidality and the twist. The §5.3.1 hypothesis [F_v:ℚ_p] ≥ 2 is unused in pp. 89–91, as the README says. |
| 4.5 | EM11 Thm 1.2.1 (lines 104–137, p. 3) | Agrees: (a), (b), p-distinguishedness, and the embedding clause on V. |
| 4.8 | DLB §13, Déf 13.3, Rem 13.4 (lines 2897–2915, p. 69), Lemmes 13.6–13.7 (2925–2943, p. 70) | Agrees. |
| 4.10 | PAN 3.5.1–3.5.4, Def 3.5.2, Rem 3.5.3 (lines 1222–1243, pp. 28–29) | Agrees: the block comes from ρ̄_{m,v}⊗ε, and the twist ψε⁻¹. |
| 4.12 | CDN Props 4.7–4.8, Rem 4.9 (lines 1877–1899, p. 49), §4.1.4, Props 4.11–4.12 (1935–1969, pp. 50–51); PASKUNAS-LUDWIG Lemma 6.2 (line 1272, p. 28) | Agrees, including the polynomial `X² − T_vX + N(v)S_v`. |
| 5.2a | BHS T_reg and Déf 2.4 (lines 296–310, p. 7), Thm 3.21 via EP Thm 6.6 (line 1250, p. 27); EP Prop 6.9–Thm 6.12 (lines 1271–1321, pp. 27–28) | Agrees: regular locus x^{−i}, x^{1+i}\|x\|. |
| 5.5a | TUNG-2 §6.1, Rem 6.1.1, Prop 6.1.2 (lines 1416–1437, p. 30), Props 6.2.1–6.2.4, Cor 6.2.5 (pp. 31–32), Lemma 6.3.1–Prop 6.3.5 (1518–1545, pp. 32–33), Prop 5.4.1 (1381, p. 29) | Agrees. TUNG-2's invariant-ring misprint (line 1431) is corrected in the README. |
| 5.8 | PAN Thm 8.0.1 (lines 5555–5575, p. 124), Rems 8.0.2–8.0.4, 8.0.5 (p. 125), Prop 8.4.9, Cor 8.4.10 (p. 132), Thm 1.0.4 (line 189, p. 5) | Agrees, including both p = 3 shapes. |
| 6.1 | EM11 Cor 1.2.2, Thms 1.2.3–1.2.4 (lines 149–215, pp. 3–4), Rem 1.2.5 (222–232, p. 5) | Agrees, including Kisin's (ε ∗; 0 1). |

Sources and how they were obtained:
- EM11, EM-ORD1, BHS: author pages.
- PAN, DLB, TUNG-2, CDN, EP, CDP, NAK, PASKUNAS-IMAGE, PASKUNAS-2ADIC, PASKUNAS-LUDWIG, BB: arXiv.
- EM-JAC1: Numdam.
- BS07: IHÉS preprint server.

### Adversarial pass (values computed this round)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §0.1 integral-isomorphism criterion | A = O, m = (ϖ), trivial G: identity; `O→O²`, x↦(x,0); ϖ on O | iso / socle k→k injective / coker 0; rational inj., socle k→k² inj., coker O; rational iso, socle map 0, coker k | Printed EM11 Lemma 3.1.6 fails on the second map; README's corrected form holds; the Checks at lines 248–250 discriminate |
| §0.1 ordinary parts | χ ≠ χ^w | `Ord_B(Ind_B χ)=χ^w`; same-Borel formula gives `Hom_T(χ,χ^w)=0` against an identity map | Opposite-Borel adjunction (EM-ORD1 line 1759) is required |
| §0.3 p=5 filtered module | φ = diag(p,p²), Fil¹⁻³ = E(e₁+e₂) | t_H = 0+3 = 3 = t_N = 1+2; lines Ee₁ (0,1), Ee₂ (0,2); ratio p, so nongeneric; Sym² on diag(p,p⁻¹): p², 1, p⁻² | Weakly admissible and irreducible; the Langlands quotient is not unitarisable |
| §0.3 nonspecial vs exceptional | δ₁ = x^κδ₂ vs δ₁ = x^{κ−1}εδ₂ | ε ≠ x as characters of ℚ_p^×, so the conditions are disjoint | Exceptional points are nonspecial, as stated |
| §0.4/§4.10 E_B for supersingular blocks | p ≥ 3, p = 3 | PASKUNAS-2ADIC Thm 2.22 E ≅ R^ψ, any p; R^{ps} = R^ψ for irreducible ρ̄ | Check at line 1778 holds |
| §0.7 coset counts and quadratic relation | n=2, q=3; n=3, q=2; n=4, q=2 | 4²=16=3·4+4·1; 7²=49=4·7+3·7; 15²=225=8·15+3·35=120+105 | `[n]²=q^{n−1}[n]+(q+1)[n choose 2]` holds |
| §0.7 Hecke polynomial | general n; n=2 | `(−1)^j q^{j(j−1)/2}·q^{j(n−j)/2}e_j=(−1)^j q^{j(n−1)/2}e_j` gives `∏(X−q^{(n−1)/2}X_i)`; n=2: `X²−T^{(1)}X+qT^{(2)}` | Agrees with IntegralHeckeAndGaloisDeterminants §3a.1 |
| §0.7 conjugate place | ι_{w^c}=c∘(ᵗ·)⁻¹∘ι_w | `ι_w(η_{w^c}^{(j)})=diag(ϖ^{(j)},1)⁻¹`; `ϖ·diag(ϖ^{(j)},1)⁻¹=diag(1^{(j)},ϖ^{(n−j)})~η^{(n−j)}`; rank one λ↦λ⁻¹ | `T_{w^c}^{(j)}=(T^{(n)})⁻¹T^{(n−j)}` |
| §0.7 Iwahori count | n=2, j=1 | q^{j(n−j)} = q, versus hyperspecial q+1 | Check at line 428 discriminates |
| R01 (previous) repair | n=2, p=5, small U^p; n=1 | OverconvergentAutomorphicForms §0.7: `lim_k colim_{U_wp}S(U_wpU^wp,ξ⊗τ,O/ϖ^k)`, n≥2, maximal level at other p-places; README line 154: same object; n=1 is outside n≥2 | Single owner per rank |
| §1.4 Check, level 11, p=3 | a₂ = −2 | `X²+2X+2≡X²−X+2` mod 3, discriminant −7≡2, a nonsquare; an F₉-splitting χ⊕χ^{(3)} gives det(c)=χ(c)²=1≠−1 | Absolutely irreducible |
| §1.4(d) vs EM11 Cor 5.3.19 | pro-p K_p, neat | source r > 0; README r ≥ 0 | Weaker and true |
| §1.5 Check, D of discriminant 26, p=2 | ψ even quadratic of conductor 5 | the idele 2 at 5 lies in ℤ₅^× ⊂ U^p and ψ₅(2) = (2/5) = −1, so x = −x and 2A_n=0; D₀ ramified at {13,∞} (even) | Internally consistent (González–Rotger not re-read) |
| §1.6 odd mod-4 ψ; F₃ indiscrete | p=2; M=F₃ | f(−g)=f(g)=−f(g) gives 2f=0: O-valued 0, E/O-valued killed by 2; in F₃, 2 is a unit so the submodule is {0}, not closed | Checks at lines 677–678 hold |
| §2.8 Frobenius conversions | geometric diag(2,3), q=7 | arithmetic: 1/2+1/3=5/6, det 1/6, root 1/2; dual: 5, 6, 2; ε-twist: 7/2+7/3=35/6, 49/6, 7/2 | Check at line 1023 holds |
| §2.8 Hensel checks | (X−2)(X−3)/ℤ₅; (X−2)²−5; X²+X+1/F₄ | derivative −1 is a unit; roots 2±√5 ∉ ℚ₅ (v₅(5) odd); derivative 1 mod 2, lifts ζ₃, ζ₃² | Checks at lines 1024–1025 hold |
| §2.8 W = det | uI | det: u², dual u⁻²; distinct iff u⁴≠1 | Check at line 991 holds |
| §3.2 determinant normalisation | level 11, ℓ=2 | ℓS_ℓ = 2 = χ(2)·2; EM11 p. 47 prints S_ℓ (line 2466) | README's ℓS_ℓ is correct |
| §3.4 Mahler Check | p=3, K₁(11)^p, S₆₇ | 66 = 2·3·11, so v₃=1; 67≡1 mod 11 puts 67⁻¹I in the centre of K₁(11); S₆₇ ≡ 67⁻¹·67 = 1 mod m; translation by a generator of 1+3ℤ₃ is onto C | mH=H, so lim H/m^nH = 0 ≠ H |
| §3.7a Pan Proposition 5.6.1 | two places, p=5, χ̄=2 | Σₒ={1}: ordinary values (1,2); complement (2,1); trace 3 for both; θ̄=(1,3), θ̄χ̄=(2,6≡1) | Each character nontrivial somewhere; Checks hold |
| §3.8 pro-modular primes | R↠R/I; ℤ→ℚ | V(I); I=0: all, I=R: none; kernel 0 but (2) not a contraction | Surjectivity needed, as stated |
| §4.5 hypotheses | p odd, V̄\|G = 1⊕1 | (b) holds (1⊕ε̄ ≠ 1⊕1); p-distinguishedness fails | Only (1) applies, as the README says |
| §4.12 polynomial | CDN line 1963 | `X²−T_vX+N(v)S_v` | Agrees with README line 1816 |
| §5.1 n=1 projectivity Check | Λ_Z[[K]] | = O[[s,t,u]]; t−u is a non-zero-divisor, injective on products of free modules | Uniformizer-only Λ is needed |
| §5.5 dyadic fibre | δ(u)=u² on Ĝ_m | (1+z)²=1 ⇔ z(z+2)=0; free of rank 2 over ℤ₂; special fibre F₂[[z]]/(z²) of length 2, times 2⁻¹ gives 1 | Normalisation correct |
| §5.5 −I restriction test | p=2, U ⊂ 1+4M₂(ℤ₂) | ([−I]−1)² = 2−2[−I] = 0 in characteristic 2; a free k[t]/(t²)-module has t≠0 | Fixed-character category required |
| §5.4/§5.6 component Check | R=k[x,y]/(xy), M=R/(x) | support V(x); the component V(y) is missed; annihilator (x)≠0 | Ambient ring required |
| §6.2 density Check | k[x]→k; k[η]/(η²)→k | both reduced, dense point, kernel (x)≠0; nilpotent kernel (η)≠0 | Density on the source and reducedness both needed |
| §6.3 exponent | (a,b)=(0,−3), u=6; (0,−1) | det^{b+1}: u²·u⁻⁴=1/36 = scalar on (Sym²)^∨; det^b: u²·u⁻⁶=1/1296; (0,−1): det⁰ gives 1 | b+1 correct; R05 |
| §6.3 non-crystabelline ⇒ irreducible | reducible de Rham V | over abelian L the inertia action on D_pst is unipotent and finite, hence trivial, so V is crystabelline | Domain claim holds |
| Worked examples | 11a1 at 5 and 2 | #E(F₅)=5, a₅=1, roots of X²−X+5 have valuations 0,1; X²+2X+2 at geometric Frob gives X²+X+1/2 at arithmetic (sum −2/2, product 1/2) | Correct |
| Headlines H1–H10 | statability at the pins | `EllAdicCohomology` of one scheme and modular-curve moduli exist; towers, B(V), deformation rings and eigenform Galois representations do not | Not statable; the docstring says so |

## Not verifiable

- CHT §3.3 (cited at lines 381 and 433): no legal copy. The Stanford author URL returns 404, the IAS copy 403, and Publ. IHÉS is paywalled. EG14 §5.2 cites CHT §3.3 for the same model.
- Shimura, *Introduction to the arithmetic theory of automorphic functions*, Proposition 3.3: a book with no legal copy here. Tau Ceti's `Degree.lean` docstring cites it for the same degree homomorphism.
- Ribet 1990, Proposition 3.8, and Ribet 1995, Corollary p. 140: paywalled (uncertified).
- González–Rotger, Theorem 3.1 and Table 3.2: not fetched this round. The §1.5 Check was verified only for internal consistency.

## Source issues

- **Error** in EM11 at Lemma 3.1.6, p. 15: the source says a rationally injective map whose residual m-socle map is injective is an isomorphism; it should assume a rational isomorphism, since the proof needs a torsion cokernel; affects a stated result.
- **Misprint** in PAN at §5.3.1, p. 74: the source says χ(Frob_v) ≡ 1 mod ϖ for v in Σ_p∖S, which is empty; it should be v in S∖Σ_p, as in §4.1 and §6; affects nothing.
- **Misprint** in EM11 at §5.2, after Remark 5.2.3, p. 47: the source says the determinant of ρ(K_{Σ₀}) at Frob_ℓ is S_ℓ; it should be ℓS_ℓ, as in Definition 5.2.2; affects nothing.
- **Misprint** in EM11 at §7.4, p. 97: the source says the locally algebraic factor and lattice carry det^b; it should be det^{b+1}, as in Theorem 3.3.22 which §7.4 proves; affects nothing.
- **Misprint** in DLB at Lemme 4.7, p. 22: the source says the G-equivariant decomposition has factors π_f^{K_p}; it should be π_f^{K^p}, the tame level; affects nothing.
- **Misprint** in TUNG-2 at §6.1, p. 30: the source says R̃_∞ is free over R^inv_∞ ⊗ R^{loc,p}(σ^p); it should be R^inv_∞ ⊗ R^{loc,p}(C^p), matching R̃_∞'s own base change; affects nothing.
