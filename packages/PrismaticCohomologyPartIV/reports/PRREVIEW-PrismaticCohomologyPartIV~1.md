# Review of PrismaticCohomologyPartIV (pull request #1080 at d66a858)

**Verdict:** needs changes

The mathematics, the supplier order and the Lean file hold. The verdict is forced by the push gate, which fails on process residue (199 `<a id=…>` anchor tags), and the remaining findings are style and policy repairs. No P1 or P2 finding.

## R01 (P3) — Gate fails: 199 `<a id=…>` anchor tags

Location: `TauCetiRoadmap/PrismaticCohomologyPartIV/README.md` lines 13–14, 47–48, 75–76, 165–166, 193–194, … (two tags before every `###` and bold `§8.n` heading, 199 in all), and 29 intra-document links of the form `[§8.0b](#s8-0b)` in `*Needs:*` lines.

Claim: the worker's gate reports `residue=199 … FAIL` under the rule "no process residue … `<a id=` anchor tags", and the brief forbids acceptance while the gate fails.

Witness: `grep -c '<a id=' README.md` gives 199; `grep -c '](#s8-\|](#layer-8' README.md` gives 29. `gate.md` line 5 lists the rule and the first twenty lines.

Repair: delete every `<a id="…"></a>` line (and the blank line that follows it), and rewrite each `[§8.n](#s8-n)` link as the plain text `§8.n` (the anchor-free form every other `*Needs:*` item already uses, e.g. line 414 "§8.1; PrismaticCohomology §0.6"). Re-run the gate: `residue` must be 0 and the targeted build unchanged.

## R02 (P3) — Eight supplier declaration names do not exist at the suppliers' heads

Location: `README.md` line 18 (`DerivedDeRham.logQuasisyntomicSites`), line 52 (`DerivedDeRham.logQuasiregularSemiperfectoid`), line 80 (`DerivedDeRham.logCompatibleRootCovers`, `logQSynQrspBasis`, `logQSynUnfolding`), line 1419 (`DerivedDeRham.logSmoothCartierComparison`), lines 9, 1495 (`LogCrystalline.IsKummerHom`), lines 115, 1562 (`AdicSpace.henselianComparison_bijective_of_spec`).

Claim: each backticked name is presented as a declaration of CrystallineCohomology (§§CR.DDR.6.15–6.17, §CR.DDR.6.11, §CR.5:log-algebra.2) or ClassicalAdicEtaleCohomology (§2.5). None occurs in those roadmaps' README or `Suggested.lean` at their open heads (CrystallineCohomology at 6ab379a, ClassicalAdicEtaleCohomology at d99fe53), nor at the pins.

Witness: `grep -c logQuasisyntomicSites` on the CrystallineCohomology README and Lean at 6ab379a returns 0; likewise for the other five `DerivedDeRham.log*` names and `IsKummerHom`; `grep -c henselianComparison` on ClassicalAdicEtaleCohomology at d99fe53 returns 0. The cited sections exist and state what is consumed: CrystallineCohomology lines 9818 (CR.DDR.6.15), 9850 (6.16), 9887 (6.17), 9635 (6.11), 7905 (Kummer homomorphisms); ClassicalAdicEtaleCohomology §2.5 line 1065, whose torsion-sheaf comparison carries the slug `sheaf-comparison-3-2-9`. The names `gabberLogCotangent`, `logCotangentFunctoriality`, `freePrelogResolutions`, `logDerivedDeRham` (DerivedDeRhamCohomology §6.20) and `AInf.cohomology_finiteness_from_periods` (AInfCohomology §AI.5.2) do exist and are not at issue.

Repair: cite the supplier by section and title ("CrystallineCohomology §CR.DDR.6.15, log quasisyntomic sites and QRSP bases"; "CrystallineCohomology §CR.5:log-algebra.2, Kummer morphisms"; "ClassicalAdicEtaleCohomology §2.5, `sheaf-comparison-3-2-9`") and drop the invented declaration names; the supplier contract rows at lines 112–115 change the same way.

## R03 (P3) — About 385 backticked names of this roadmap's own with no declaration behind them

Location: `README.md` throughout, e.g. line 174 `LogRH.AlgebraicFrobeniusModule`, line 330 `Log.DeltaLogStructure.mk`, line 349 (a Check) `Log.DeltaLogStructure.trivialLog_deltaLog`, line 1526 `TauCeti.LogAdic.LogStructure`; line 159 says these "are not declarations of `Suggested.lean`".

Claim: house style makes a backticked name of the roadmap's own a claim that `Suggested.lean` declares it, and a Check "never names or claims a Lean counterpart". `Suggested.lean` declares nothing (correctly: no carrier for a headline exists at the pins), so every one of these names, including the `TauCeti.LogAdic.*` names announced as "shared", is unbacked, and the Check bullets are labelled with Lean-style names. The worker's citation tool lists 385 such names.

Witness: `scratch/citations.md` ("Lean names found nowhere", 385 entries, all this roadmap's namespaces `LogPrismaticSite`, `Log`, `FormalLog`, `PrelogPrism`, …); `Suggested.lean` lines 40–43 contain only the namespace.

Repair: as in the PotentialModularityAndCompatibleSystems repair: drop the backticks and restate each API bullet and Check in prose ("Define the predicate *algebraic Frobenius module* …", "**Trivial log structure.** On `ℤ_(p)` …"), delete line 159's disclaimer, and refer to targets by section and description elsewhere. (The docstring title of `Suggested.lean`, "headline targets", can become "target signatures" in the same pass.)

## R04 (P3) — Cross-reference and locator slips

Location and witness, one per item:

- line 187: "the non-lisse input to §8.69". §8.69 (KY Theorem 7.30) uses no Riemann–Hilbert input; the use is §8.76's Lemma 8.5 route (line 1918), where KY line 3335 builds the map through Bhatt–Lurie. Write §8.76.
- line 1203: "§5.18's initiality of `Δ_inj→Δ`" names no roadmap; the target is PrismaticCohomologyPartII §5.18 (its README line 1831, "q-Poincaré comparison of the Čech–Koszul bicomplex"). Qualify it.
- line 954–958: the identification `RΓ(Spf(R)_ét, L̂) ≅ (τ^{≤1}Δ̄){1}[1]` is K1 Remark 5.4 (K1 line 1169, p.27), not part of Theorem 5.3. Add the locator.
- line 1353–1357: clause (3) (semiperfectoid `S`: `Δ_{S/R,perf}` discrete, a perfect prism, `≅ Δ^init_{S,perf}`) is KY Proposition 4.19, p.40 (KY line 1550), which the locator line omits.
- line 170: "Definition 5.2.1 … pp.39–42": Definition 5.2.1 is on p.38 (BLRH line 1485, page 39 starts at line 1493).
- line 1426: "`P → R` is a smooth chart over `(A/I, M_A)`" should read "`M_A → P` is a smooth chart" (KY Corollary 5.17, line 1931).

Repair: the six edits above.

## Verified sound

**Gate and tooling.** `gate.md`: every check 0 except `residue=199`; `build=0`. `diff --stat origin/main...HEAD` outside the folder: empty. Depcheck (command of the brief, `--movable`): `depcheck: 205 roadmaps, 1430 edges, 0 problem(s)`, no UPWARD or CYCLE line. `lake env lean TauCetiRoadmap/PrismaticCohomologyPartIV/Suggested.lean` from the worktree: exit 0, no output, 3 s (the file declares nothing; `#check` probes and one-tactic probes are vacuous). Pins read from `lake-manifest.json`: Mathlib 6b7abb3c7, Tau Ceti a91d3aafa.

**Suppliers resolved (every citation, at the stated copy).** On main: DerivedModuleAlgebra (§0.13 line 1151; §§1.1–1.9 lines 1573–2028), EnhancedDerivedSheaves (§0.3 line 455, §E1.3 549, §E1.4 580, Layer E2 line 2031, E3 1117, E5:abstract 1436, E5:animation 1896), SchemeAndStackFoundations (Layer 2 line 3232, §2.6 3437, §2.18 3959, Layer 4 5033), AdicEtaleGeometry (§A1.6 line 3259, §A1.9 4077), PerfectoidSpaces (P1.16 4525, P1.17 4611, P1.18 4652, P1.24 5049, P1.25 5101), AdicSpaces (Completed/, Layers 0–3 lines 136–457). At open heads: PrismaticCohomology (§0.3, §0.6, §0.28, §0.39 as bold paragraphs; §0.65 line 1225, §0.71 1315, §1.0 1715, §2.31 2801), PrismaticCohomologyPartII (Layer 3 line 113, Layer 4 716, Layer 5 1415, §§5.0–5.3 1419–1515, §§5.23–5.25 1935–1959), PrismaticCohomologyPartIII (§6.1 172, §6.4 236, §6.5 248, §7.2 955, §7.7 1068, §7.8 1080), CrystallineCohomology (CR.5:log-algebra.1–.6 lines 7607–8371, CR.5.1–5.4 8466–9058, CR.6 10020, CR.DDR.6.3/6.3.1/6.6/6.11/6.15–6.18 lines 9329–9929), DerivedDeRhamCohomology (§5.1–5.7 from 4263, §PD.6 2226, §PD.7 2854, §6.20 5158 with the four names above), AInfCohomology (AI.0 513, AI.1 878, AI.2.2 1650, AI.3.3 2185, AI.5.1 2505, AI.5.2 2588 with `AInf.cohomology_finiteness_from_periods` stating exactly BMS1 Cor. 4.20, AI.6 2648), ClassicalAdicEtaleCohomology (§§1.2–1.4 lines 211–416, §2.5 1065), DiamondsAndVStacks (D1 2234, D2.7–2.9 4244–4391, D4 5761, D5 6850, D6.1–6.3 8661–8831), DiamondEtaleCohomology (C0.2 341, C0.13 531, C0.14 539, C2.3 814), PadicHodgeTheory (§§0.2–0.5 lines 141–270). Merge order: all suppliers precede line 118; CohomologyComparisons (line 161) is the consumer and its README (lines 66, 833–835) cites §§8.1–8.29, 8.35, 8.41–8.42, 8.56, 8.60, 8.69 consistently with this roadmap's "Downstream consumers".

**Ownership.** `roadmaps grep` for "log prism|prelog prism|δ_log" and "Kummer-étale|log diamond|p-Kummer|Hyodo–Kato" over main and the 433 open heads: the only other hits are PrismaticCohomology's supplier table (mentions, not constructions), CohomologyComparisons §4.6 (consumer), CrystallineCohomology (Kummer morphisms and Hyodo–Kato complexes, both cited here as suppliers), and the sibling checkouts CohomologyComparisonsPartII (rev/1364, consumes Hyodo–Kato through CrystallineCohomology) and CstConjectureForDaggerVarieties (rev/1759, consumes through CohomologyComparisons). No second owner of log prisms, log prismatic sites, log diamonds, the quasi-pro-Kummer-étale site or the p-Kummer realization. Open pull requests whose files the brief does not give were not checked.

**Sources and locators (sampled targets plus the headlines).** Texts read in the cache: K1 (arXiv 2007.14037v3), KY (2306.00364v1), BLRH (1711.04148v1), SSV (1307.4246v3), ČK (1710.06145v3), KatoII (1905.10678v2), BdJ11, Mathew, KL, MW20 (2005.06855v1), DLLZ (author page), CN21 (author page), HK94 (Numdam Astérisque 223), SW (author page), Inoue (2505.01084v2). All page numbers of the sampled targets matched the printed pages. Checked statement by statement: 8.0a (K1 Def. A.2–A.3, Lemmas A.4–A.5, Cor. A.6–A.7, Def. A.8, Lemmas A.9–A.10, Def. A.22–A.23, proof of Prop. 3.9); 8.0b (Def. A.11, Remarks A.12–A.14, A.16, A.18–A.19, Props. A.15, A.17, A.20); 8.0c (SSV Thm. 4.17, Rem. 4.18, Thm. 5.6; KY Lemmas 2.9–2.10, Thm. 2.11); 8.0d (K1 Remarks 6.6–6.7, 6.9, Prop. 6.8); 8.1–8.2 (K1 Def. 2.2, Rem. 2.3, Ex. 2.4, Rem. 2.5); 8.3–8.6 (Rem. 2.6, Not. 2.7, Lemmas 2.9, 2.11, 2.13, Ex. 2.10, Prop. 2.14, Cor. 2.15, Prop. 2.16); 8.7 (Constr. 2.17, Rem. 2.18); 8.8–8.10 (Def. 3.3, Ex. 3.4, the rigidity paragraph, Rem. 3.5, Ex. 1.3); 8.11–8.13 (Props. 3.6, 3.7, 3.9, 3.11, Lemma 3.8); 8.14–8.17 (KY Def. 2.18, Rem. 2.21, 2.24, 2.36, Constr. 2.22, Def. 2.25, 2.35, Lemma 2.28, Cor. 2.29, Ex. 2.30, 2.37–2.38, Prop. 2.39, Lemma 2.40, Conv. 2.34); 8.18–8.20 (K1 Def. 4.1, Remarks 4.2–4.6; KY Def. 7.34); 8.21–8.26 (Constr. 4.7, Remarks 4.8–4.10, Lemmas 4.11–4.12, Prop. 4.13, Lemma 4.14, §5.2, Lemma 5.2, Thm. 5.3, Rem. 5.4, Cor. 5.5, Lemma 5.7, Prop. 5.8); 8.30–8.35 (Def. 6.4, Rem. 6.5, Thms. 6.1, 6.3, the §6.2 functor); 8.36–8.41 (Def. 7.1, Ex. 7.2, Lemmas 7.3–7.4, Thms. 7.10, 7.13, 7.17, Constr. 7.15–7.16, Rem. 7.18, Thm. 8.1, Rem. 8.3, Thm. 8.5, ČK Prop. 6.8); 8.43–8.45 (KY Def. 3.1–3.3, 3.11, Rem. 3.12–3.14, Lemmas 3.16–3.17); 8.46–8.50 (Def. 4.3, Rem. 4.4, Prop. 4.5, Cor. 4.6, Props. 4.7–4.8, Def. 4.9, Rem. 4.10, Prop. 4.12); 8.51 (Props. 4.14, 4.17, 4.19, Cor. 4.21); 8.52–8.57 (Thm. 5.1, Ex. 5.2, Assumption 5.3, Def. 5.5, Prop. 5.7, Def. 5.13, Props. 5.14, 5.24, 5.29, Cors. 5.17–5.18, 5.27, 5.31, 5.35, Rem. 5.20, 5.32, Constr. 5.21, 5.25–5.26, Lemma 5.22); 8.58 (K1 Ex. 1.6); 8.59–8.61 (KY Thm. 6.1, Remarks 6.2–6.3, Lemma 6.5; DLLZ Def. 2.2.2, Thm. 4.4.15, Lemmas 4.4.27, 4.4.29); 8.62a (MW20 Def. 2.1, Lemmas 2.7, 2.9, Prop. 3.5, 3.7, 3.9, Cor. 3.15); 8.63–8.68 (KY Def. 7.3–7.4, Conv. 7.5, Ex. 7.6, Lemma 7.7, Cors. 7.8–7.9, Lemma 7.11, Def. 7.12, Rem. 7.13, Def. 7.14, Prop. 7.16, Def. 7.17–7.18, Lemma 7.21, Prop. 7.22, Cor. 7.23, Rem. 7.24, Thm. 7.25, Cor. 7.27, Rem. 7.28–7.29); 8.69 (Thm. 7.30, Cor. 7.31); 8.70, 8.73–8.75 (Def. 7.32, 7.35, Thms. 7.36–7.37 as printed, Prop. 7.38, Rem. 7.39; Inoue Def. B.2, Lemma B.3, Prop. B.4); 8.76–8.78 (Def. 8.1, Thm. 8.2, Props. 8.3–8.4, Lemma 8.5, Props. 8.8–8.9); 8.76a (CN21 Lemma 2.4, Thm. 2.6; HK94 Lemma 2.22, Props. 2.23–2.24; BLRH Def. 2.4.1, Thm. 2.4.3, Def. 5.2.1, Props. 5.2.2, 5.2.4, 9.2.3, Cor. 9.2.4, Rem. 9.4.2, Props. 9.5.1, 9.5.5–9.5.6, Def. 9.5.2, Thm. 9.6.1, Prop. 9.6.2 for §8.0). Each hypothesis the README states is the source's or stronger; the three places where the README deliberately departs from a source (§8.40 free presentations instead of K1 Construction 7.15's ambient basis; §8.67's torsion-free `P^gp`; §8.74's p-Kummer target and §8.77's log PD deformation replacing KY's Theorem 7.36 and Proposition 8.9 steps) each repair a genuine defect of the source recorded under "Source issues".

**Library declarations at the pins (file:line).** `PerfectRing` Mathlib/FieldTheory/Perfect.lean:44 (on `[Pow R ℕ]`, so it applies to monoids as claimed), `powMulEquiv` :68; `Perfection` RingTheory/Perfection.lean:39 (`[Pow α ℕ]`), `coeffMonoidHom` :63, `pthRootMonoidHom` :69, `instance : PerfectRing (Perfection M p) p` :99 (the "unique p-divisibility of M♭" the README imports), `PreTilt := Perfection (ModP O p) p` :633; `GrothendieckGroup` GroupTheory/MonoidLocalization/GrothendieckGroup.lean:36, `of` :47, `of_injective` :50 (needs `IsCancelMul`); `emultiplicity_factorial_mul` Data/Nat/Multiplicity.lean:149, `multiplicity_factorial_pow` :161; `IsPGroup.iff_card` GroupTheory/PGroup.lean:117; `TruncatedWittVector.mk` RingTheory/WittVector/Truncated.lean:74, `coeff` :78; `powersHom` Algebra/Group/Nat/Hom.lean:71; `GeneralLinearGroup.map` LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:187; `Associates` Algebra/GroupWithZero/Associated.lean:405; `Ideal.jacobson` RingTheory/Jacobson/Ideal.lean:65; `DividedPowers` RingTheory/DividedPowers/Basic.lean:77; `WittVector.teichmuller` RingTheory/WittVector/Teichmuller.lean:93; `PadicInt.toZModPow` NumberTheory/Padics/RingHoms.lean:447; `Condensed` Condensed/Basic.lean:44; `ObjectProperty.FullSubcategory` (used at Condensed/Basic.lean:57); Tau Ceti `IsProP` at TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean. No δ-ring, prism, perfectoid-ring, log-structure or diamond carrier exists at either pin (grep for `DeltaRing|pDerivation|Perfectoid` finds only Mathlib's `RingTheory/Perfectoid/{Untilt,FontaineTheta,BDeRham}` and `TauCeti/RingTheory/Huber/WittVector`), which confirms the docstring's "not statable" list for every headline.

**Headline theorems.** Log Hodge–Tate comparison (8.28), completed base change (8.29), log crystalline comparison (8.35), semistable AΩ comparison (8.41), Nygaard graded pieces and completeness (8.53–8.54), log de Rham comparison (8.56), Frobenius isogeny (8.57), Breuil–Kisin descent (8.58), Kummer-étale comparison (8.69), the p-Kummer Laurent equivalence (8.74), proper pushforward (8.75), the `A_inf[1/φ^{-1}(μ)]` comparison (8.76), Hyodo–Kato scalar comparison (8.77), BKF structure (8.78). None is statable at the pins and each is named in the module docstring with its missing carrier. No stand-in and no padding (the previous head's `DeltaLogStructure` API block was removed in d66a858, correctly).

**Adversarial pass.** One row per statement checked; values computed on both sides.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 8.1 axioms (1)–(3), `nonzero_logDelta_witness` | p=2, A=ℤ, M=ℕ, α(0)=1, α(n>0)=0, δ_log(n)=(3ⁿ−1)/2 | (2): 1·0=δ(1)=0, 0=δ(0); (3): 1+2δ_log(n+m)=3^{n+m}=(1+2δ_log n)(1+2δ_log m); δ_log(1)=1, δ_log(2)=4, 1+2δ_log(1)=3 | holds, not rank one | none |
| 8.1 `trivialLog_deltaLog` | ℤ_(p), x=1+p | δ(1+p)=((1+p)−(1+p)^p)/p, δ_log=δ(1+p)/(1+p)^p (K1 Ex. 2.4(1)) | holds | none |
| 8.1 `not_any_map` | ℤ_(p)[x], δ(x)=1 | x^p ∤ 1; x a nonzerodivisor so K1's criterion applies | no δ_log | none |
| 8.2 φ_M formula | log ring, p∈rad A; rank-one prelog chart | 1+pδ_log(m) unit; α(φ_M m)=α(m)^p(1+pδ_log m)=φ(α m); rank one: m↦m^p | matches K1 Rem. 2.3 | none |
| 8.3 free ring; 8.6 fraction formula | ℤ_(p){x}, x^{−1} | δ_log(x^{−1})=(0−y₀)/(1+py₀)=−y₀/(1+py₀) (K1 Lemma 2.11 proof) | holds | none |
| 8.7 exactification | (ℤ_p⟨X₀,X₁⟩,ℕ²)→(ℤ_p⟨X₀⟩,ℕ), sum | M′={(a,b):a+b≥0}=X₀^ℕ(X₁/X₀)^ℤ; A′=A[T^{±1}]/(X₀T−X₁) | holds | none |
| 8.7 Remark 2.18 reading | base (B,M_B), M_B→N integral | README: M_B→M′ integral; K1 prints "N→M′" (no such map) | README right; source misprint | errata |
| 8.8 rigidity; `not_delta_pair` | (ℤ_p[x],(x),x^ℕ), δ(x)=0 | δ(x)=0 not a unit; ℤ_p[x] not (p,x)-complete | not a prism | none |
| 8.10 Breuil–Kisin chart | E(0)=p·unit; φ(u)=u^p+p variant | u↦0 gives (W(k),(p),ℕ→0); δ(u)=1 not divisible by u^p | holds | none |
| 8.14 perfect ⇒ Associates perfect | x^p=y^p·u | u=w^p with w a unit (w·w^{p−1}u^{−1}=1) so x=yw | injective and surjective | none |
| 8.14 `nat_not_perfect` | ℕ additive, p=2 | 1 has no half; ℕ♭={0}; ℕ/ℕ^×=ℕ≠0 | not perfect, not perfectoid | none |
| 8.14 pseudo-perfectoid non-example | KY Rem. 2.21 monoid | M/M^×≅ℕ[1/p], M♭ trivial (no p-th roots of units y_j) | holds | none |
| 8.14 `valuationMonoid` | O_C∖{0} | value monoid divisible; (1+p) has many p-th roots | perfectoid, not perfect | none |
| 8.15 p=2 unit check | O_C, unit 3 | φ(3)=3, δ(3)=(3−9)/2=−3, δ_log(3)=−3/9=−1/3≠0 | full log structure not rank one | none |
| 8.21/8.26 log affine line | C^n, G=X₀^ℤ | ∧^i(A/I⊗ℤ)=0 for i≥2; H¹{1}=R·dlog X₀; dX₀=X₀·dlog X₀ not an iso | holds (K1 Lemma 5.7, Prop. 5.8) | none |
| 8.28/8.79 ranks | semistable chart, d coords with one relation | rank Ω¹_log = d (8.28 over A_inf, coords t₀..t_d) and d−1 (8.79, x₁..x_d) | binomial ranks consistent | none |
| 8.40 merge map | X₀,X₁↦X, a=(1,1) | Y²(1+q)e = [2]_q Y² e; ordinary pullback 2Y²e; difference (q−1)Y²e | holds | none |
| 8.40 order homotopy | A=[a]_q, B=[b]_q, t=q−1 | (G−F)¹(u,v)=(q^b−1)u+(1−q^a)v = H²(Bu−Av) with H²=t·; degrees 0,2 give 0 | chain homotopy identity holds | none |
| 8.40 `intrinsic_lattice`, monomials | X^{−1}, X^n | (q^{−1}−1)/(q−1)=−q^{−1}; D(X^n)=[n]_qX^n, n=0,2 | holds | none |
| 8.40 missing coordinate | N=2ℕ, p=2, Y=X² | ambient ∇(Y)=(1+q)Y dlog X=((1+q)/2)Y dlog Y, (1+q)/2∉ℤ₂[[q−1]] | ambient basis not integral; resolved model needed | errata (K1 7.15) |
| 8.41 completion ideals | (p,μ) vs (p,φ(ξ)) | φ(ξ)=φ(μ)/μ≡μ^{p−1} mod p, μ^p∈(p,φ(ξ)) | same radical, same completion | none |
| 8.42 right column | ČK Prop. 6.8 | comparison RΓ_crys(X/B⁺_dR)→RΓ_ét⊗B⁺_dR unlabelled; (2.3.2) iso since φ^{−1}(μ)∈(B⁺_dR)^× | README's diagram matches ČK | errata (K1 8.5 misprint) |
| 8.60 twist | DLLZ Lemma 4.4.29 | cup product lands in R^iε_*(μ_n^{⊗i}); printed target R^iε_*(μ_n) | README's twisted formula right | errata |
| 8.62 negative control | y^p=1+pX over C⟨X⟩ | v_p(binom(1/p,m)p^m)=−v_p(m!)→−∞: no convergent root; cover étale at X=0 | holds | none |
| 8.67 torsion units | P=ℤ/2, n=2 | ℚ_p⟨P⟩=ℚ_p×ℚ_p; t↦t²=1 sends both points to t=1; t=−1 missed | not surjective; KY 7.22 needs P^gp torsion-free | errata |
| 8.69 point | X₀=Spf O_C | (W(C♭)/p^m)^{φ=1}=ℤ/p^m | holds | none |
| 8.72 finite-level inertia | p=2, a=[[0,−1],[1,−1]]; p=3, −1 | det a=1, a³=1, a≠1, order 3 mod 2; −1 of order 2 mod 3 | not p-groups | none |
| 8.74 essential image | prime-to-p root cover of the log disc | KY line 3201 asserts M_S/M_S^× divisible for perfectoid log rings; only p-divisible (Rem. 2.36) | preprint theorem overclaims; p-Kummer restriction correct | errata |
| 8.76a contraction exponent | γ_r([m]), φ^n | v_p((p^n r)!/r!)=(p^n r−r)/(p−1)=r·e(n) by Legendre; r=1,p=2: n=1→1, n=2→3 (t²=2γ₂, t⁴=24γ₄) | holds | none |
| 8.76a non-equality | p=2, 2T | φ(2T)=2T² but 2!γ₂(2T)=4T² | README's caveat right | none |
| 8.76a rigidity | denominators p^{cn}, contraction p^{e(n)} | e(n)−cn→∞ so Σ(1−φ)^k converges in a fixed p-power multiple | CN21 Lemma 2.4 argument transfers | none |
| 8.77 KY 8.9 step | M₀=ℕ→O_C, 1↦π, [π♭]≠0 | (A_crys,ℕ→0)→^{φⁿ}(A_crys,M_crys) needs h(1) with α(h(1))=φⁿ(0)=0, but α(m·u)=[m]u≠0 | KY's "map of pre-log rings" does not exist; §8.76a route needed | errata |
| 8.0b flatness | A=∏ℤ/pⁿ, B=A⟨T⟩, f=Σe_np^{n−1}Tⁿ | Tor₁^A(A/p,B)=B[p]/Ann_A(p)B; pf=0; Ann_A(p)B ⊂ polynomials, f not polynomial | not p-completely flat; K1 Rem. A.16(1) needs bounded torsion | errata |
| 8.0a relative finiteness boundary | X=Spec k[t], chart ⊕_{a∈k}ℕe_a, generic point | every étale neighbourhood meets infinitely many a; a finitely generated chart covers finitely many | no relatively fine chart | none |
| 8.0a log-group lift | Q⊂ℤ², pa=pb+c, c↦u ∉ k^{×p} | lifts of a−b have p-th power u·v^p≠1; Spec k has no nontrivial étale neighbourhood | Cor. A.7 hypothesis genuinely needed | none |
| 8.0 Witt reduction check | W₂(k)/p over ℤ/p² | Tor_i^{ℤ/p²}(𝔽_p,𝔽_p)=𝔽_p all i≥0 | derived reduction unbounded | none |

Hypotheses in scope: every Lean-side `variable` question is vacuous (no declarations); each README theorem carries its hypotheses in the sentence, and the standing conventions (bounded prelog prisms, integral monoids, Koshikawa smoothness, Cartier type where used) match KY's Theorem 2.

**Declared gaps.** None declared (no `design/plan.json`); no `gap:` prerequisite in the README.

## Not verifiable

- KYcorr (Inoue–Koshikawa–Yao, Corrigendum, Adv. Math. 503 (2026) 111223): the README's researchmap author copy answers HTTP 403 to the sources service and the DOI resolves only to the paywalled publisher page (recorded `uncertified`). §8.71 (Lemma 1, Definition 2, Example 3), §8.72 (Definition 4, Proposition 5, Remark 6), §§8.73–8.75 (Theorem 7, Introduction) are cited by locator only. Their content is consistent with the defect in KY's Theorem 7.36 proof identified above and with Inoue Proposition B.4, which was read.
- Kato89 (Johns Hopkins 1989), Theorems 6.4 and 6.10 (§§8.76a, 8.77): not in an open repository.
- OgusDraft, Proposition 4.3.17(1) (§8.7): the Berkeley URL returns 404; the 2018 book is not open.
- Tsuji, Tunisian J. Math. 1 (2019) (§8.69, saturated = Cartier type): MSP landing page only; KY Remark 7.29 (read) states the equivalence.
- Nakayama II Prop. 5.4 (§8.59), Huber Cor. 3.2.3 (§8.61), SW Lemma 17.1.8 and KL (§8.65): proof-route citations; SW and KL were fetched but not read beyond the citation.

## Source issues

- **Misprint** in K1 at Remark 2.18, printed p.13: the source says the conclusion is that `N → M′` is integral; it should be `M_B → M′` is integral (there is no map from `N` to `M′`); affects nothing.
- **Error** in K1 at Remark A.16(1), printed p.57: the source says the chart algebra `A⟨P⟩` is `I`-completely flat over `A⟨M_A⟩` for every smooth chart; it should assume bounded `p^∞`-torsion in `A` (for `A = ∏ ℤ/pⁿ`, `A⟨T⟩` has `Tor₁^A(A/p, A⟨T⟩) ≠ 0`); affects a stated result.
- **Gap** in K1 at Construction 7.15, printed p.44: the source says the log q-de Rham construction works for every submonoid `N ⊂ M_D^gp ⊕ ℤ^S`; for `N = 2ℕ` at `p = 2` the operator sends `X²` to `(1+q)X² dlog X`, not an integral multiple of `dlog(X²)`; it should restrict to free presentations; affects the proof (Theorem 7.17 for non-free `N`).
- **Misprint** in K1 at Theorem 8.5, printed p.49: the diagram writes `RΓ_crys(X^ad_C, ℤ_p) ⊗ B⁺_dR`; it should be `RΓ_ét(X^ad_C, ℤ_p) ⊗ B⁺_dR`, and the arrow from `RΓ_crys(X^ad_C/B⁺_dR)` is an isomorphism only after `⊗ B_dR` (ČK19 Prop. 6.8); affects nothing.
- **Error** in KY at Proposition 7.22, printed pp.75–76: the source says the n-th power chart map is surjective finite Kummer-étale for every fs `P`; for `P = ℤ/2`, `n = 2` the map misses the component `t = −1`; it should assume `P^gp` torsion-free (true for sharp `P`); affects a stated result.
- **Error** in KY at Theorem 7.36 (proof), printed p.82: the source says the generic fibres of saturated perfect log prisms have `M_S/M_S^×` divisible, so that Laurent F-crystals realize to all `ℤ_p`-local systems; the monoid is only uniquely p-divisible, and prime-to-p Kummer covers are outside the essential image; it should restrict to p-Kummer local systems; affects a stated result; corrected in print at the Corrigendum, Adv. Math. 503 (2026) 111223, Theorem 7 (text not read; recorded by the roadmap).
- **Gap** in KY at Proposition 8.9 (proof), printed p.90: the source says `(W(k),N) → (A_crys,N) → (A_crys,M_crys)` via `φⁿ` is a composite of maps of pre-log rings; when a positive chart element has nonzero image in `A_inf` no monoid map lies over `φⁿ`; it should pass through a PD deformation of the hollow chart (as in this roadmap's §8.76a); affects the proof.
- **Misprint** in DLLZ at Lemma 4.4.29, printed p.65: the source says `∧^i(R¹ε_*(μ_n)) → R^iε_*(μ_n)` is an isomorphism; the cup-product target is `R^iε_*(μ_n^{⊗i})`; affects nothing (the two agree étale-locally).
