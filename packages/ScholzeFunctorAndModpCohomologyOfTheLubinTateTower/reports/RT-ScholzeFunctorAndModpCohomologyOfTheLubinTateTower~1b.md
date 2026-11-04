<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1702#issuecomment-6417020339 -->
Red team round 1 pass b (claude) of 90f788e

Verdict: needs changes

1. **F01** (P1) §1.3's local almost-finite-image lemma is unowned

   **Location.** `packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md` line 124: "especially §2.7, supplies local toric primitive comparison, nested affinoid refinements and the finite-image propagation argument"; line 329: "then good-coordinate charts and nested strict rational subsets. Maps of the resulting Čech spectral sequences propagate almost finite images"; line 338 (`*Needs:*`).

   **Claim.** The proof route of §1.3 (SCH18 Corollary 3.6) rests on the local lemma SCH18 Lemma 3.5 = SCH13 Lemma 5.6(ii): for a smooth affinoid V over Spa(C,O_C) with good coordinates and a strict rational subset U⊂V, the image of Hⁱ(V_ét,O⁺/p)→Hⁱ(U_ét,O⁺/p) is almost finitely generated. The README cites PadicHodgeTheory §2.7 for it.

   **Witness.** PadicHodgeTheory §2.7 (head of its open pull request, line 594 onward) imports the absolute primitive theorem from AInfCohomology §AI.3.1 and says of the local estimates only that "these local estimates describe the supplied absolute theorem"; its targets are the primitive comparison, a relative interface, integral perfectness, SNC compact support and log resolution. AInfCohomology §AI.3.1 (head #1044, "Primitive mod-p comparison and finiteness") uses "local estimates Lemmas 5.3–5.8" inside its own proof route and states no separate target for them; a grep of that roadmap for "strict rational", "good coordinates" and "Lemma 5.6" finds nothing else. SCH18 line 505–508 (Lemma 3.5, p. 12) is the statement at the generality §1.3 needs; SCH18 line 530 applies it inside the proof of Corollary 3.6.

   **Repair.** Either declare it: add to `design/plan.json` `gaps` and to the README's PadicHodgeTheory/AInfCohomology contract the line "What AInfCohomology must provide (gap:local-almost-finite-image): For a smooth affinoid V over Spa(C,O_C) with good coordinates and a strict rational subset U⊂V, the image of Hⁱ(V_ét,O⁺/p)→Hⁱ(U_ét,O⁺/p) is almost finitely generated over O_C for every i≥0, with the strict-containment condition of SCH18 Definition 3.4 (SCH13, Lemma 5.6(ii), pp. 29–30; SCH18, Lemma 3.5, p. 12)", and cite the gap in the §1.3 `*Needs:*` line in place of "PadicHodgeTheory §2.7"; or state that lemma in §1.3 as an explicit sub-target in the roadmap's own words with the same locators, keeping PadicHodgeTheory §2.7 only for the nested-affinoid refinement vocabulary. Tested on the closed unit disc with U the disc of radius |p| (README line 335): the local lemma is the statement needed before Temkin's criterion and the Čech comparison are applied.

2. **F02** (P2) gap:analytic-topology-dimension asks for what HodgeTateAndCanonicalSubgroups §6.36 already provides

   **Location.** `packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md` line 148: "What ClassicalAdicEtaleCohomology must provide (gap:analytic-topology-dimension): For a d-dimensional rigid analytic space over a complete nonarchimedean field, cohomology of every abelian sheaf in the analytic topology vanishes in degrees greater than d"; `design/plan.json` gaps entry `analytic-topology-dimension`; `*Needs:*` lines 376 and 566.

   **Claim.** The gap is declared as missing from every earlier roadmap.

   **Witness.** HodgeTateAndCanonicalSubgroups §6.36 "Cohomological dimension of the analytic site" (head #1084) is the target `TauCeti.LogAdic.analytic_cohomological_dimension`: for qcqs rigid X of dimension d, locally of finite type over a nonarchimedean k, `H^i(X_an,F)=0` for every abelian analytic sheaf F and i>d, with the closed-disc and Tate-curve Checks. HodgeTateAndCanonicalSubgroups is line 233 of `merge-order/ORDER.txt`, this roadmap line 309. Both uses here are on qcqs spaces: ℙᵣ⁻¹_C in §1.5 (SCH18 line 773) and ℙ¹_C in §3.2 (LUD17 Theorem 4.6 after the pushforward of §3.1).

   **Repair.** Delete the `analytic-topology-dimension` entry from `design/plan.json` `gaps` and the sentence quoted above from line 148. Add a supplier subsection "### From TauCetiRoadmap.HodgeTateAndCanonicalSubgroups: Section 6.36 supplies the vanishing of analytic-topology cohomology of every abelian sheaf above the dimension for qcqs rigid spaces (`TauCeti.LogAdic.analytic_cohomological_dimension`); it is applied to ℙᵣ⁻¹_C and ℙ¹_C." Replace "ClassicalAdicEtaleCohomology gap:analytic-topology-dimension" in lines 376 and 566 by "HodgeTateAndCanonicalSubgroups §6.36". Tested on ℙ¹_C: d=1 and H²_an vanishes, which is the degree-two input of §3.2.

3. **F03** (P2) "admissibility is necessary" for the Galois extension is false

   **Location.** `packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md` line 380: "For admissible π prove that it extends uniquely to a continuous Gal_F-action, commuting with Dˣ; admissibility is necessary, since a continuous action of the profinite Gal_F on a discrete set has finite orbits."

   **Claim.** The sentence asserts that the Weil action on Sⁱ(π) extends to Gal_F only when π is admissible.

   **Witness.** r=1, A=k, π=⊕_{m≥1} k[t,t⁻¹]/(tᵐ−1) with O_Fˣ trivial and ϖ↦t. π^{O_Fˣ}=π is infinite-dimensional, so π is not admissible. S⁰(π)=π (README line 318) and geometric Frobenius acts by t⁻¹ summand-wise; a vector with nonzero components in the summands m₁,…,m_s has orbit of size at most lcm(m₁,…,m_s) and open stabiliser, so the W_F-action extends continuously through Ẑ→ℤ/lcm. The finite-orbit argument shows only that the negative control k[t,t⁻¹] (line 393) has no extension; it does not show admissibility is necessary. DPS23 line 1337–1338 asserts the Gal_F-action on Šⁱ(M) for every locally admissible M∨.

   **Repair.** Replace the clause after the semicolon by: "the extension can fail without admissibility (negative control below), and it exists for every locally admissible π, a filtered colimit of admissible subrepresentations, by the colimit law of §1.2; the target is stated for locally admissible π, with the admissible case as SCH18 Proposition 4.6." Add the instance above as a positive-control Check and say in §1.2 (line 309) that Šⁱ carries the Gal_F-action on the whole dual category (DPS23 line 1337). This is the accepting review's open F01 made into a correction of a false sentence.

4. **F04** (P3) §4.2 re-proves the K_p-injectivity that CompletedCohomologyAndLocalGlobalCompatibility §1.7 supplies

   **Location.** `packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md` line 597: "Prove that λ can be chosen so that S≠0, S is admissible in the block of r̄ˢˢ, and its GL₂(ℤ_p)-restriction is injective in the fixed-ζ smooth category"; line 73: "Sections 1.5–1.7 supply … fixed-central-character injectivity".

   **Claim.** Admissibility and fixed-central-character injectivity of the localised definite module are stated as targets here although the README's own supplier paragraph imports them.

   **Witness.** CompletedCohomologyAndLocalGlobalCompatibility §1.7(c)–(d) (head #1270, lines 66–75 of its §1.7): `S_ψ(U^p,E/O)` is injective among smooth K_p-representations with the prescribed central character under the smallness hypotheses, and "the torsion module is admissible for D_p^×; its localised summands remain admissible and injective on K_p", citing CDN Proposition 4.7(a); its §4.12 then takes S_{ψ,λ,𝔪} admissible with injective K-restriction as given (CDN Propositions 4.7–4.8).

   **Repair.** Rewrite the sentence as: "Admissibility and fixed-central-character injectivity of S_ψ(U^p,L/O)_𝔪 on K_p are imported from CompletedCohomologyAndLocalGlobalCompatibility §1.7(c)–(d). Prove here that λ can be chosen with S_{ψ,λ,𝔪}≠0 (DPS23, Lemma 8.6), that Hom_{U_p^𝔭}(λ,−)_𝔪 preserves admissibility and GL₂(ℤ_p)-injectivity in the fixed-ζ category (CDN23, Proposition 4.8), and that S lies in the block of r̄ˢˢ." Tested on λ=O: the imported injectivity is the statement for S_ψ(U^p,L/O)_𝔪 itself.

5. **F05** (P3) the imported covering classification is claimed for locally compact kernels

   **Location.** `packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md` line 441: "For a nonarchimedean local field E and separable locally compact abelian A with trivial SL₂(E)-action, use the supplied rank-two covering classification H²_top(SL₂(E),A)≃Hom_cont(μ(E),A)"; line 100.

   **Claim.** KTheoryLowDegrees §11.5 is cited for Moore's Theorem 10.3 in Moore's generality.

   **Witness.** KTheoryLowDegrees §11.5 (head #1248, lines 1069–1079) defines its relative central extensions for "a profinite abelian M with trivial action", proves the classification "first … for finite M" and then "general profinite M", and keeps the local classification as a target in that setting; no locally compact kernel appears. The consumer needs only A=𝔽_p (line 443) and finite coefficient extensions (line 445).

   **Repair.** Replace "separable locally compact abelian A" by "finite, or more generally profinite, abelian A" in line 441, and in line 100 write "supplies Moore's local SL₂ covering classification with profinite kernels"; Moore's statement for separable locally compact A (MOO68, Theorem 10.3, printed p. 51) stays as the source locator only. Tested on A=𝔽₃, E=ℚ₃: Hom(μ₂,𝔽₃)=0, the case §2.2 uses.

6. **F06** (P3) a supplier cited without a section

   **Location.** `packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md` line 456: "the degree-one/two continuous-cocycle dictionary of Tau Ceti and ProfiniteCohomology".

   **Claim.** The `*Needs:*` line of §2.2 cites a roadmap on main with no section and Tau Ceti with no declaration.

   **Witness.** `TauCetiRoadmap/ProfiniteCohomology/README.md` on main (6fd1c2e) has the dictionary in "Layer 2: the explicit low-degree complex and its functoriality" (line 725); the pinned Tau Ceti has no declaration named in the README for degree-two cocycles.

   **Repair.** Write "ProfiniteCohomology Layer 2 (explicit low-degree complex: one- and two-cocycles and extensions)" and drop "of Tau Ceti", or name the Tau Ceti declaration used.

7. **F07** (P3) SCH18 line locator for Lemma 3.12

   **Location.** `packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md` line 200: "(SCH18, Proposition 2.12, Lemmas 2.13 and 3.12, pp. 9–10, 17; SCH18 line 389, line 729)".

   **Claim.** Line 729 locates Lemma 3.12.

   **Witness.** SCH18 line 717 is "Lemma 3.12. For any compact open subgroup K⊂D× and any sheaf G on (ℙⁿ⁻¹_C/K)_ét, there is a Hochschild–Serre spectral sequence"; line 729 is inside the proof of Lemma 3.13.

   **Repair.** Replace "line 729" by "line 717" (p. 17 is correct).

8. **F08** (P3) the twist isomorphism is narrowed to smooth δ

   **Location.** `packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md` line 382: "and for a smooth character δ obtain Sⁱ(π⊗δ∘det)≃Sⁱ(π)⊗(δ⁻¹⊠δ)".

   **Claim.** The source statement is restricted to smooth δ.

   **Witness.** DPS23 line 1401–1404 (Lemma 7.4, p. 31) states the isomorphism for any continuous character δ:Fˣ→Oˣ and any smooth O-torsion π; for A non-Artinian such a δ (an unramified Oˣ-valued character, or a character with infinite image) is not smooth, while π⊗δ∘det is still smooth because each vector is killed by some 𝔪ʲ and δ⁻¹(1+𝔪ʲ) is open.

   **Repair.** Write "for a continuous character δ:Fˣ→Aˣ (smooth when A is Artinian)" and keep the smooth case as the Check.

9. **F09** (P3) the module docstring gives the wrong missing carrier for the block-vanishing theorem

   **Location.** `packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/Suggested.lean` lines 21–23: "Fust's Ext comparison, reductive finiteness and block vanishing: the derived smooth category, general reductive rational-point carrier and mod-p blocks are missing."

   **Claim.** The vanishing Hⁱ(SL₂(ℚ_p),π)=0 of README line 423 is said to need mod-p blocks.

   **Witness.** README line 423 states the exclusions "as representations, including small-prime coincidences, rather than assuming a three-element block"; FUST22 line 399–402 (Proposition 5.1) excludes twists of 1, Sp and Ind_B^G α as representations. What the pins lack is the carrier of absolutely irreducible smooth mod-p representations of GL₂(ℚ_p) with their twists, and the Steinberg and principal-series objects, which SmoothRepresentationsOfLocalGroups SR.2.1 and PadicLocalLanglandsForGL2Qp §2.6 plan.

   **Repair.** Replace "and mod-p blocks are missing" by "and the absolutely irreducible smooth mod-p representations of GL₂(ℚ_p), their twists, the Steinberg representation and the principal series Ind_B^G α are missing (they are planned by SmoothRepresentationsOfLocalGroups SR.2.1 and PadicLocalLanglandsForGL2Qp §2.6)".

No pass-a report exists on the pull request at this head: its comments are the pass-a brief posted by the board, the round-1 review, the round-2 fix report and the accepting round-2 review. There is therefore no pass-a finding to confirm or reject; the accepting review's one open finding (its F01, P3) is taken up in R03 below.

## Verified sound

**Head and policy.** The board checkout is at 90f788e; `git diff --stat origin/main...HEAD` touches only `packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/` (README.md, Suggested.lean, design/plan.json, metadata.toml, two reports, sources.toml). The plan.json change reformats the gaps list only. No `lemma`, `set_option`, `#eval`, `#print`, pull-request number or process word in the README or the Lean file; `sources.toml` has twelve entries, no machine path. Imports are `import Mathlib` and one `TauCeti.*` module that exists at the pin (`TauCeti/RepresentationTheory/Homological/ContCohomology/TrivialFp.lean`, line 73 defines `trivialFp`).

**Dependency check**, run as prescribed from the board checkout with `--movable`:

```text
depcheck: 56 roadmaps, 662 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The citation resolver (main 6fd1c2e, 366 open heads) lists no cross-roadmap citation and no Lean name found nowhere.

**Declarations read (4) against the pins** (Mathlib 6b7abb3c, Tau Ceti a91d3aaf, in the shared Lake package directory): `continuousCohomology` is `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean` line 131 with `[TopologicalSpace G] [IsTopologicalGroup G]` (line 46–47), degree 0 the invariants (the resolution is shifted by one, line 97–106); `ContRepresentation.coindV` line 533 (carrier f(φ g·h)=π g (f h)), `coind` line 550 (right translation, needs `IsTopologicalGroup` on both groups, line 545); `TopRep.res` line 262, `coind₁` line 243; `IsSmoothDiscrete` (discrete module, open stabilisers) at `SmoothDiscrete/Basic.lean` line 272; `shapiroIso` (closed subgroup of a profinite group, discrete coefficients, forward map restriction then evaluation) at `Shapiro/AllDegrees.lean` line 244; `finite_continuousCohomology_of_isOpen_of_normal_of_prime` at `Finiteness.lean` line 155 with its open-normal, finite-coefficient and lower-degree hypotheses; `SL2.commutator_eq_top` at `SpecialLinearGroup.lean` line 804 with a≠0, a²≠1; every file named in the Mathlib table exists at the pin. The elaborated binder list reported by the fix report (`#check @name` on all four declarations) was not re-run (no Lean is run in this pass); the signatures were read line by line and carry every hypothesis the README states: compactness, Hausdorffness, the analytic `LieGroup` structure, noetherian complete local coefficients with finite residue field of characteristic p, the discrete scalar topology, smoothness, bounded 𝔪-torsion with 0<j, admissibility; closedness of J, joint continuity, the continuous section and its right-inverse law; `Fact p.Prime` and 2<p. No sorry'd data, no `True` placeholder, no hypothesis containing its conclusion, no padding (no declaration follows from one library lemma: Mathlib has no Shapiro lemma, Tau Ceti's is profinite-only, and no finiteness or Moore-type statement exists at the pin).

**Targets read.** All 28 subsections of Layers 0–6, the Conventions, every supplier contract, every `*Needs:*` line (28), the Examples and Dependencies paragraphs, the Worked examples and References: every line of the README (871) and of `Suggested.lean` (116).

**Locators verified (103 numbered line locators, every one opened; every printed-page claim checked against the extraction's page markers).** SCH18 318, 335, 389, 440, 451, 481, 511, 551, 727, 769, 792, 808, 819, 871, 892, 1278 (pages 8–29 as claimed; Definition 3.4 at line 501–504 is the strict-containment condition of §1.3 verbatim in content; Theorem 4.3 at line 803 is the Serre-subcategory statement; Proposition 4.7 at line 892–899 carries the inverse of Art·Nrd under Scholze's convention); SCH13 462, 516, 537, 567 (Lemma 2.12's hypotheses (i)–(iii) at lines 517–531 match §1.4 exactly: p_k q_k=π, exactness in the middle of M₁→M_{k+1}→M_k, compatible Frobenius isomorphisms); LUD17 862, 916, 922, 958, 972, 1099, 1159, 1230, 1236, 1252, 1269, 1303, 1331 (Theorem 3.14 with B′={det∈ℤ_pˣ} at 926; Theorem 4.6 for all smooth χ₁,χ₂ and the remark at 1328 that they need not be distinct; Corollary 4.7); FUST22 100, 107, 358, 399, 434, 478, 598 (printed page = extraction page + 278: Lemma 6.2 on p. 290, Lemma 6.6 on p. 293 within the cited range; k any commutative ring and G locally profinite at line 22; α at line 375 is diag(a,d)↦ω(a)ω(d)⁻¹; "p-adic reductive group" at 523–525 is the F-points of a connected reductive group over finite F/ℚ_p); MOO68 2054, 2060 (both on the page whose running head reads 51; Theorem 10.3 for separable locally compact abelian A); CDN23 all 44 locators (pages agree with the printed pages as the References say; Theorem 2.1 at 923 is the gap statement; G′=G/(ϖI₂)^ℤ at 181; I(χ₁,χ₂)=Ind(χ₂⊗χ₁ε⁻¹) at 593, the Conventions' convention; Theorem 3.2 and Lemma 3.10; Corollaries 3.11 and 3.13 with the Steinberg-block exclusion; chapter 4's standing F=ℚ_p, p>2 at 1563; Propositions 4.3, 4.5, 4.7, 4.10; Lemma 4.13 with the three ascent steps; Lemma 4.17; Theorem 4.22 "valable pour F quelconque" at 1925–1927; Corollary 4.21 and Remark 4.20; Theorem 4.23, Lemma 4.24, Remark 4.25; §4.3.3 with the unproved "défini sur F" at 2022; Theorem 4.26, Lemmas 4.27–4.28, Remark 4.29); DPS23 1330, 1387, 1401, 1418, 1748, 1769, 1852, 1889; GK14 1689, 1712, 1729 (F≠𝔽_p assumed for adequacy at 1709); STR08 337, 372; ECD17 3541; PAS22 1242 (Lemma 6.1 with the χ⊕χω exclusion).

**Supplier citations resolved at the heads the brief prescribes (every cited section found; 30 roadmaps).** On main: ClassFieldTheory Layers 5 (line 920) and 9 (1505); Chebotarev Layer 10 (410); ProfiniteCohomology Layer 2 (725); PerfectoidSpaces P0.5, P0.13, P0.29, P2, P3.18–P3.22, P5, P8; AdicSpacesPartII R0.10, R0.18; EtaleCohomologyFoundations §0.9 (1120, Kummer classes, projective bundle formula, Check "c₁(O(1)) has trace +1") and §0.11 (1157, smooth trace, Check "the ℙ¹ trace sends c₁(O(1)) to 1"). At open heads: CompletedCohomologyAndLocalGlobalCompatibility §0.6 (312: full-rank period torsor, equivariant site, F_π and Sⁱ for admissible π, admissible O-torsion extension with filtered-colimit comparison, C-independence, bound 2(n−1)), §§1.5–1.7, 3.7, 4.12 (1703: S¹(S_{ψ,λ,𝔪})≅Ĥ¹ and ρ_𝔪⊗N isotypy); EndoscopicTransferAndUnitaryTraceComparison §§12.2–12.8, 12.11, 12.14 (central quotient by ϖ_E^ℤ with n height classes), 12.19 (rank-two Drinfeld descent only), 12.21 (Stein Mittag–Leffler for every n≥1); SmoothRepresentationsOfLocalGroups SR.0.1–SR.0.4, SR.0d.1–SR.0d.2, SR.2.1; PadicLocalLanglandsForGL2Qp §§0.1, 0.3, 2.1–2.7, Layer 3, 5.1–5.4, 6.7–6.8; KTheoryLowDegrees §11.5; DiamondsAndVStacks D0, D4, D6; DiamondEtaleCohomology C0 with the subsection "Quasi-pro-étale comparison and continuity" (548) and C0.18 for ECD Proposition 14.9 (572); IgusaVarietiesAndTorsionConcentration IG.4.1 (equivariant site of a continuous locally profinite action with `equivariantSite.pullback`, `equivariantSite.slice`); PadicHodgeTheory §2.7 (see R01); NoncommutativeAndEquivariantIwasawa Layer 0 (§0.2 compact p-adic analytic groups, §0.5 noetherianity through complete filtrations); DeformationAndDerivedPatchingAlgebra §1.10 (`cohenCompatibleLift` into p-torsion targets); CompletedCohomologyPartII Layer 3; ClassicalAdicEtaleCohomology §§1.1, 1.3, 1.5, 8.2; PerfectoidShimuraVarieties §§1.13–1.15; LocalGaloisDeformationRings §3.4; PotentialModularityAndCompatibleSystems §§2.23, 4.15; AutomorphicGaloisRepresentations §§3.7, 3.10, 3.11; GL2AutomorphicRepresentationsAndTransfer R16.3, R17.3, R17.4; HilbertModularVarietiesAndShimuraCurves R18.3, R18.4; ReductiveGroupsPartII RG2.2. Board designs: ModpRepresentationsOfGL2OverLocalFields has nodes MP.0/torsion-admissibility, finite-presentation, finiteness-calculus, amalgam-coherence, scalar-extension, MP.1/central-ext, finite-type-presentation, cosocle-length, smooth-dual-length; LubinTateFormalModulesAndQuasiCanonicalLifts has LT.2/lt-character and LT.2/reciprocity-comparison. Every supplier is earlier in `merge-order/ORDER.txt` or on main (ModpRepresentationsOfGL2OverLocalFields at line 306, this roadmap at 309).

**Declared gaps (seven).** Each has the same slug in `design/plan.json` and in a README "What … must provide" sentence under the supplier's subsection with a named supplier and section; each `needs` sentence is single and carries its hypotheses. `temkin-good-germs`, `arithmetic-stein-hochschild-serre`, `height-zero-modular-uniformisation`, `potentially-barsotti-tate-lifts` and `lubin-tate-arithmetic-descent` were searched by object across main and the 366 open heads (`roadmaps grep`): no earlier roadmap states them (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.10 classifies residual types of tame potentially Barsotti–Tate lifts, not existence for every residual representation; GL2ModularityLifting §5.7 is Kisin's modularity theorem). `proetale-finite-presentation` names ProetaleCohomologyOfPAdicCurvesAndTowers, which has a DESIGN job on the design ledger dated 2026-10-26 and no text yet (Not verifiable). `analytic-topology-dimension` is R02.

**Checks tested with values (46).** Conventions: lift change by 2 in ℚ₅ gives δ(2)⁻¹=3, d=2 gives 2, Art(w)=2 gives 3, product 2·3=1; unramified δ(ϖ)=2: geometric Frobenius 3, arithmetic 2; v(det ϖI₂)=2; trace of a degree-d divisor is d, so 1 and 0 in 𝔽₂, 1 and 2 in 𝔽₃; Hom_O(O,O)⊗L/O=L/O versus (L/O)⊗(L/O)=0. §0.2: (ℤ/2)ˣ one element, (ℤ/4)ˣ two; r=1 Weil scalar 3 and Dˣ scalar 2. §0.3: C_p (d=0) has dim Hⁱ=1 in every degree; ℤ_p has (1,1,0,…) also at p=2; C⁰(H,𝔽_p) coinduced so H^{>0}=0; ⊕ℕ𝔽_p fails admissibility; ℚ_p/ℤ_p with H=1 has H⁰ infinite. §1.2/1.5: ℙ¹ with 𝔽_p gives (𝔽_p,0,𝔽_p(−1),0); A=𝔽_p[ε]/ε² gives S² of dimension 2; 𝔽_p((T))/𝔽_p[[T]] has π[Tʲ] of size pʲ and infinite S⁰. §1.4: constant family O_K/π has γ(M_p)=(1) against Frobenius (p). §1.6: det(zIᵣ)=Nrd(z)=zʳ; negative control k[t,t⁻¹] and positive control k[t,t⁻¹]/(tᵐ−1). §2.1: C₂ with J=1 and 𝔽₂: induced dimension 2, H⁰ dimension 1, H^{>0}=0 (free module) on both sides; S₃ with J=1: dimension 6, invariants 1; diag(t,1) has determinant t, tI₂ has t²; T(Tf)(x)=f(x). §2.2: p=3 forces 2a=0 so a=0; p=5 gives 4a=0; |μ(ℚ₉)|=8, |μ(ℚ₃(ζ₃))|=6 with Hom to 𝔽₃ one-dimensional, |μ(𝔽₃((t)))|=2; p=2 gives Hom(μ₂,𝔽₂) of order 2; a=2 has a²−1=3≠0 in ℚ₃; cocycle identity and coboundary formula. §2.3: d¹d⁰v(g,h)=ghv−gv−ghv+v+gv−v=0; r=1 collapse to Shapiro. §2.5: supersingular π gives an isomorphism; π=1 at odd p gives zero multiplicity, at p=2 the outer group is k. §3.1: diag(p,p⁻¹) has determinant 1 and is not integral. §3.2: S¹(St)→S²(1)=k(−1) surjective since S²(Ind 1)=0. §4.1: SL₂(𝔽₉) perfect; even degree gives invariant sum 0 in ℚ/ℤ. §4.2: p=3 with residue degree 3: |kˣ|=26, ξ² of order 13 not in 𝔽₃ˣ. §4.4: m-th roots of unity, prime-to-p part. §5.1: pro-p Iwahori fixed vectors nonzero for every irreducible. §5.2: Nrd(O_Dˣ)=ℤ_pˣ, two unit cosets; (1−σ) is surjective on ∏_ℤ W by finite partial sums, so H¹(pℤ,C⁰(ℚ_pˣ,k))=0. §5.3: centre ℚ_pˣ/pℤ≅ℤ_pˣ, 𝔽₃ˣ gives two characters, 𝔽₂ˣ one. §6.2: C_p unipotent module: invariants ke₁, coinvariants k[e₂], natural map zero. §6.4: image of ℚ_p in a finite group is trivial by divisibility. All as stated.

**Adversarial table.**

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| `compactLie_cohomology_finite` | H=C_p, d=0, A=𝔽_p, j=1 | ChartedSpace on a point model forces H discrete, hence finite; Hⁱ(C_p,𝔽_p)=𝔽_p every i; finite | True, no cd bound claimed |
| same | H=ℤ_p, A=ℤ/p², X=ℤ/p² trivial, j=2 | H⁰=ℤ/p², H¹=ℤ/p², H²=0; `Module.Finite` and `Finite` hold | True |
| same, hypothesis `hkill` | A=ℤ_p, X=ℚ_p/ℤ_p, H=1 | X[pⁱ] finite for all i (admissible) but H⁰ infinite; excluded by 0<j and 𝔪ʲX=0 | Essential, present |
| same, `LieGroup` without `IsManifold` | any compact H with the given charts | analytic multiplication in the preferred charts near each point gives an open standard subgroup; a compact group with an open p-adic analytic subgroup is p-adic analytic | Statement true as typed |
| `continuousCohomology_coind_iso` | J=H | coindV={f: f(jh)=j f(h)}≅X by f↦f(1); both sides Hⁱ(H,X) | True |
| same | H=S₃ discrete, J=A₃, X=𝔽₃ trivial | coindV = functions on A₃\S₃, dimension 2; H⁰ dimension 1 on both sides; H¹(S₃,𝔽₃[S₃/A₃])=H¹(A₃,𝔽₃)=Hom(ℤ/3,𝔽₃), dimension 1 both sides | True; 2≠1 excludes a termwise isomorphism |
| same, `hJ` not redundant | J dense in H | J\H indiscrete, so every section is continuous while J is not closed | Hypothesis independent, kept |
| same, coset direction | `rightRel`: x~y ↔ y x⁻¹∈J | classes Jx; a function with f(jh)=j f(h) is determined on J\H; the section has the right domain | Convention correct |
| `moore_sl2_h2_vanishes` | p=3, 5, 2 | μ(ℚ_p) of order 2, 4, 2; Hom(μ,𝔽_p) of dimension 0, 0, 1; degree 2 of `continuousCohomology` is H² (resolution shifted by one) | True for 2<p, false at p=2, hypothesis present |
| same, Moore versus continuous cochains | discrete kernel A, totally disconnected H | an extension with discrete kernel is a local homeomorphism; sections over the clopen cosets of a compact open subgroup glue continuously; coboundaries from changing the section | Comparison in §2.2 sound |
| §1.6 Galois extension | π=⊕_m k[t,t⁻¹]/(tᵐ−1), r=1 | not admissible; orbits of size ≤ lcm; extension exists | R03 |
| §2.3 vanishing Hʲ(M_∞,π̲)=0, j≥2, every r | r=3, M_∞ of dimension 2 | affinoid perfectoid pieces have Hʲ(𝔽_p)=0 for j≥2 by Artin–Schreier; R¹lim of H¹ vanishes by density of Stein restrictions; so H²=0 also in dimension 2 | True for every r, as stated |
| §2.2 H¹_cont(SL₂(ℚ_p),𝔽_p)=0 | p=2, 3 | H¹=Hom_cont(SL₂(ℚ_p),𝔽_p)=0 since SL₂(ℚ_p) is perfect (a=2, a²−1=3≠0) | True |
| §4.3 cokernel | r̄ˢˢ=χ⊕χε versus generic | PAS22 Lemma 6.1: norm-one units act trivially on the cokernel; zero cokernel unless χ⊕χω | Matches |
| §5.4 range | F=ℚ₃, n=1, K large | CDN23 Theorem 2.13 (line 1307): non-admissible dual for F≠ℚ_p and n>0; theorem correctly limited to F=ℚ_p | Matches |
| §6.1 general F | F=ℚ₂, π=1 | outer group H²(SL₂(ℚ₂),k)=k, finite; the theorem uses only finiteness of Hⁱ(SL₂(F),π) (FUST22 Lemma 6.6) | True without §2.2 |
| gap `analytic-topology-dimension` | ℙ¹_C, ℙᵣ⁻¹_C | qcqs of dimension 1 and r−1; HodgeTateAndCanonicalSubgroups §6.36 applies | R02 |
| §1.3 local input | closed disc V, U the disc of radius |p| | U strictly contained; the needed statement is SCH18 Lemma 3.5, not a target of PadicHodgeTheory §2.7 or AInfCohomology §AI.3.1 | R01 |

**Ownership.** By object across main, the open heads (`roadmaps grep`) and the board's package and design folders in this checkout: no other roadmap states the noncompact continuously split Shapiro comparison, the continuous-cocycle consequence of Moore's theorem, Ludwig's quotient and vanishing, Scholze's functor with general complete local coefficients, or the Layer 5–6 tower theorems; the four fully qualified Lean names are declared nowhere else.

## Not verifiable

- **BW00, Chapter IX, Proposition 2.3:** uncertified by the manifest; cited by locator only in §2.1 and in the docstring of `continuousCohomology_coind_iso`. CDN23 line 1555 cites the same proposition for the same Shapiro step, with the continuous-section hypothesis.
- **ProetaleCohomologyOfPAdicCurvesAndTowers, section "Arithmetic finite presentation":** the roadmap exists only as a DESIGN job on the project's design ledger (2026-10-26) with no README on main, in an open pull request or on the board; the gap is a declared contract and its `needs` sentence is CDN23 Theorem 2.1 (line 923); the section cannot be checked.
- **Lean elaboration and the `#check @name` binder check:** not re-run in this pass (no Lean is run here); the fix report's run (exit 0, three `sorry` warnings at lines 64, 91 and 110) is relied on, and the signatures were read against the pinned sources line by line.
- **Ownership against board packages at other pull-request heads:** only the packages and designs present in this board checkout and the roadmaps reachable through `roadmaps grep` (main and 366 open heads) were searched; packages that exist only at other board heads were not fetched.
- **ECD17 Lemma 23.6, p. 144** (References line 870) is not cited by any target and was not opened.

## Source issues

- **Error** in CDN23 at proof of Lemma 4.13, (4.15), printed p. 44 (line 1854): the source writes the component functions of the scalar quotient at infinite level as functions on the units modulo the subgroup generated by p; it should be modulo the subgroup generated by p², since the central scalar acts on components through its determinant; affects the proof.
- **Error** in CDN23 at proof of Lemma 4.13, printed p. 44 (line 1855): the source calls the compact level groups of the division algebra torsion-free; at level zero the group contains roots of unity; the finiteness used needs only a compact p-adic Lie group; affects the proof.
- **Misprint** in CDN23 at Proposition 4.3, printed p. 37 (line 1575): the conclusion says a character factors through the Galois group of K over ℚ_p although K is not assumed Galois; it should say the character is trivial on the absolute Galois group of K; affects nothing.
- **Gap** in CDN23 at §4.3.3, printed p. 48 (line 2022): the source asserts without proof that the scalar quotient of a finite Lubin–Tate level is defined over F; it should be proved by effective Weil descent after killing the height translation; affects a stated result.
- **Gap** in DPS23 at Lemma 7.4, printed p. 31 (lines 1401–1404): the source asserts a Galois-equivariant twist isomorphism for every smooth torsion representation although the Galois action exists only for locally admissible ones; it should say Weil-equivariant in general; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "90f788e", "job": "RT-ScholzeFunctorAndModpCohomologyOfTheLubinTateTower~1b", "model": "fable", "worker": "fable-rt235"} -->
