# Review of PadicHodgeTheory (pull request #1062 at c1968e3)

**Verdict:** needs changes

Incremental re-review of the 32 lines changed since 33a1e09, and of the pull request's title and description against this head.

## R01 (P3) — The repaired FO locator in §1.4 is now a wrong page

**Location:** `TauCetiRoadmap/PadicHodgeTheory/README.md` line 404: "(FO, (4.10), p. 78; B08, §I.2, p. 5)".

**Claim:** FO's display (4.10), the formula `g(π_ε)=(1+π_ε)^χ(g)−1`, is on printed p.78.

**Witness:** FO (56590ae4) line 3173 carries (4.10) on PDF page 86, printed p.80 (offset −6: the contents, line 72, put §4.3.2 on p.78, and its heading is line 3119 on PDF page 84). The text at 33a1e09, "(4.10), p. 80", was right; the previous review misquoted it as "§4.3.2, p. 80".

**Repair:** restore "(FO, (4.10), p. 80; B08, §I.2, p. 5)".

## R02 (P3) — The changed passages cite supplier declaration names that the suppliers' heads no longer carry

**Location:** README lines 908, 917, 919 (`PG.wachModule`, `PG.wachLattice`, `PG.wachModule_dcris`), 1322, 1326 (`PG.RelativePhiModule`, `PG.RelativeBPair`, `PG.RelativeBPair_classical`), 1342, 1344, 1350 (`PG.relativePeriodDerivedComparison`), 20, 82, 756 (`IsOrdinaryOfWeight`), 940 (`HerrCohomology`, `HerrCohomology.baseChange`).

**Claim:** these are declarations of PhiGammaModulesAndIwasawaCohomology §§6.0, 1.0b–1.0c and of LocalGaloisDeformationRings §§0.4, 1.7.

**Witness:** `roadmaps grep --fixed` for each name over main and every open head: no hit in either supplier (README or `Suggested.lean`). PhiGamma §6.0 at its head writes "the rational N_F(V) and the embedded integral lattice N_F(T)=N_F(V)∩D(T)"; the sections and their content exist, the names do not.

**Repair:** cite by section and object, without a declaration name. For line 908: "Inside the same period realization, the Wach lattice of PhiGammaModulesAndIwasawaCohomology §6.0 is `N_F(T)=N_F(V)∩D(T)`, and `N_F(T)[1/p]=N_F(V)`"; lines 917, 919: "the supplied filtered isomorphism `λ_V : D_cris(V) ≃ N(V)/πN(V)` of §6.0", "`im(N_F(T)→N(V)/πN(V))`"; lines 1322–1350: "the relative `φᵈ`-modules, relative B-pairs, their classical adapter and the derived comparison of PhiGammaModulesAndIwasawaCohomology §§1.0b–1.0c"; lines 20, 82, 756, 940: "the ordinary-of-weight-λ predicate of LocalGaloisDeformationRings §1.7", "the Herr cohomology and its base change of §0.4". The same de-naming applies to the remaining supplier names of the contract paragraphs at lines 80, 86 and 88 (`cyclotomicNormField`, `fieldEtaleRealization`, `deRhamDiffEq…`, `CoefficientRobbaModule`, …), none of which occurs at the suppliers' heads either, and it makes the sentence "`PG` denotes this supplier's namespace" (line 88) unnecessary.

## R03 (P3) — The description names p-adic monodromy as an endpoint of §5.1

**Location:** pull request description, first paragraph after the summary block: "Its endpoints are the group-valued period torsor (§5.5), p-adic monodromy (§5.1), filtered de Rham comparison with coefficients (§7.2) …".

**Claim:** §5.1 proves the p-adic monodromy theorem.

**Witness:** README line 984: "NoncommutativeAndEquivariantIwasawa §F.6 stage 3 supplies the embedded differential lattice … and `deRham_iff_potentiallySemistable` … it constructs no second lattice"; README line 3 names the endpoint "the localization presentation of the de Rham differential lattice (§5.1)".

**Repair:** "Its endpoints are the group-valued period torsor (§5.5), the localization presentation of the de Rham differential lattice (§5.1; the lattice and the p-adic monodromy theorem are imported from NoncommutativeAndEquivariantIwasawa §F.6), filtered de Rham comparison with coefficients (§7.2), …".

## R04 (P3) — The description's dependency paragraph names one supplier section and calls every other roadmap a consumer

**Location:** pull request description: "By section, the README uses: MotivesAndAlgebraicCycles §6.8, the tensor-isomorphism torsor imported in §5.5. Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** the only supplier still in a pull request that the README uses by section is MotivesAndAlgebraicCycles §6.8.

**Witness:** README `## Exact supplier contracts` (lines 40–112) imports, by section, from roadmaps that are open pull requests: PhiGammaModulesAndIwasawaCohomology §§1.0–1.0c, 1.3, 1.5–1.6, 3.9, 5.6a, 6.0–6.1 (line 86), LocalGaloisDeformationRings §§0.3–0.4, 1.7 (line 80), PadicLocalLanglandsForGL2Qp §0.2, NoncommutativeAndEquivariantIwasawa §F.6.

**Repair:** replace the two sentences by: "This pull request adds the roadmap. By section, the README imports from suppliers that are still pull requests: PadicPeriodRings §§1–4; PhiGammaModulesAndIwasawaCohomology §§1.0–1.0c, 1.3, 1.5–1.6, 3.9, 5.6a, 6.0–6.1 (norm fields, étale and Robba realizations, B-pairs, the de Rham differential lattice, Wach modules); PadicLocalLanglandsForGL2Qp §0.2 (filtered (φ,N)-modules, Colmez–Fontaine, `D_dif`); NoncommutativeAndEquivariantIwasawa §F.6 (`D_pst`, `N_dR`, p-adic monodromy); LocalGaloisDeformationRings §§0.3–0.4, 1.7 (coefficient Robba modules, Herr cohomology, ordinary flags); FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1, R07.3–R07.5; ArithmeticGaloisRepresentations §§2.4, 2.6, 6.1, 6.3; MotivesAndAlgebraicCycles §6.8; the full list is the README's supplier contracts. Its consumers are those of the README's last section." In the validation paragraph, "with author-side red-team passes to follow" is also out of date: the head contains those repairs.

## Previous findings

- R01 — partly repaired: lines 613 ("situation (0.2)(2), arXiv pp.2–3"), 1326 ("Remark 6.3.16, p.142"), 986 ("B02, Thm. 4.10") and 842 ("pp. 22, 25–26") are right; line 404 "(4.10), p. 78" is now wrong (R01 above).
- R02 — repaired: no alias of this roadmap's own remains (`RegularOrdinary`, `herrComplex` and the `x = PG.x` sentences are gone; lines 86 and 88 name the supplier's objects in its contract). The prefixed names written instead have drifted (R02 above).

## Verified sound

| Statement | Instances | Values | Result |
|---|---|---|---|
| §1.4 `γ_a(π)=(1+π)^a−1=aπ(1+h_a)` (line 404, changed locator) | `a=−1`; `a=2`, p odd | `−π/(1+π)=−π(1−π+π²−…)`, `h=−π+…∈πℤ_p[[π]]`; `2π+π²=2π(1+π/2)`; `φγ_a(π)=(1+π)^(pa)−1=γ_aφ(π)` | holds |
| §3.6 ordinary characters (line 756, reworded) | `K=ℚ_p`, n=2, λ=0 | `ψ₁=u⁰=1`; `ψ₂(Art_geom u)=u^(−(0+1))=u⁻¹`; weights `0,−1` strictly ordered | holds |
| §4.4 Wach lattice identities (line 908, reworded) | `ℚ_p(−h)`, `T=ℤ_p e` | `N(V)=B⁺π^h e`, `D(T)=A e`; intersection `A⁺π^h e`; inverting p gives `B⁺π^h e` | holds |
| §4.5 Herr complex (line 940, reworded) | scalars `φ=2, γ=3` | `d⁰(1)=(1,2)`; `d¹(1,2)=2·1−1·2=0` | holds |
| §7.6 finite-radius complex (line 1342, prefix only) | `d=1`, p=2, `r=1`, `s=1/2` | `q=2`, `r/q=1/2`, `s≤r/q` ✓; target interval `[1/2,1/2]`; `s=3/4` fails the bound | holds |

The rows for untouched statements stand as in the previous review, of 33a1e09.

- Source locators re-read at the text: 5 (Bierstone–Milman df21a462 line 274 "(0.2)" on arXiv p.2–3, Berkovich class line 287 p.3; KL a6a11742 line 5611 p.142; B02 142e7948 lines 1747 p.43 "Théorème 4.10", 1112 p.25, 1126 p.26, 960 p.22; FO line 3173 printed p.80). Seeded sample inside the diff: §§1.4, 3.6, 7.6; §1.4's locator is R01, the other two change wording only.
- Cross-roadmap citations in the changed passages resolved at the open heads: sections PhiGammaModulesAndIwasawaCohomology §§1.0b, 1.0c, 1.5, 1.6, 5.6a, 6.0, 6.1 and LocalGaloisDeformationRings §§0.3, 0.4, 1.7 exist with the cited content; the declaration names do not (R02). `multiplicativeTateParameter` (named in the Lean docstring) still exists at FiniteFlatGroupsAndIntegralPadicHodgeTheory.
- Gate at c1968e3: every check 0, `OK`. `lake env lean TauCetiRoadmap/PadicHodgeTheory/Suggested.lean`: exit 0, `declaration uses sorry` (line 70) the only diagnostic; the Lean file is unchanged since 33a1e09, so its signatures and the padding probe stand.
- Dependency check: `depcheck: 247 roadmaps, 2257 edges, 0 problem(s)`; no UPWARD or CYCLE line. Outside-folder diff against `origin/main`: empty.
- Overlap facts: RigidAnalyticGeometry §§7.4 and 8.4 (README lines 1374, 1451) are dropped by the open revision of RigidAnalyticGeometry, which maps them to AdicSpacesPartIII R3.6 and R3.7; the README already cites those two sections beside them, so the citations stay valid. No other open pull request changes this roadmap.
- Overlap check: read FiniteFlatGroupsAndIntegralPadicHodgeTheory, PhiGammaModulesAndIwasawaCohomology, CohomologyComparisons (scope and their lines naming this roadmap; the third list is empty); nothing shared: Wach modules, relative B-pairs and the differential lattice are PhiGamma's and imported here, and CohomologyComparisons cites §§0.2–0.5 as a consumer.
- Pull request text: title, summary block and the paragraph on the folder agree with the head (3 Lean declarations added, `metadata.toml` present, headline `potentiallyMultiplicativeTwistReduction`, affinoid crystalline presentation at §0.4, the p-divisible argument of §9.3); the two sentences that do not are R03 and R04.
- Source independence: changed passages only; 7 changed locator and wording passages compared with 4 sources (FO, B02, KL, Bierstone–Milman), none shared; largest share BC, 35 locator groups, then S13 29 and B02 28; arrangement not compared again (the diff adds, removes and reorders no layer).

## Not verifiable

- The items of the previous review stand unchanged (Kottwitz 1986, Fontaine 1982, the printed pages of Gleason–Lim–Xu, Heuer, Qian and Nakamura); the diff touches none of them.

## Source issues

- none (none new in the passages re-read; the five of the previous review stand)

## For the human reviewers

- none
