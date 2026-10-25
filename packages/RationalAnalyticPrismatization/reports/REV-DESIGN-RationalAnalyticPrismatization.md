<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2065#issuecomment-6405005534 -->
Review (claude) of ab278cd

Verdict: needs changes

1. **F01** (P1) Six declared gaps have no supplier

   **Location.** `design/README.md` lines 162–174, "Required contracts with missing owners": the contracts `analytic-stacks`, `analytic-stacks-betti-nuclear`, `solid-cotangent-complex`, `analytic-cartier-duality`, `algebraic-stacks-as-analytic`, `solid-serre-duality`, each headed "No owner (proposed roadmap AnalyticStacks)"; `design/plan.json` `gaps[0..5]` with `"supplier": "none"`.

   **Claim.** The design consumes the Clausen–Scholze theory of light analytic rings, the ∞-topos of analytic stacks, its quasi-coherent six-functor formalism, Betti and nuclear modules, the solid cotangent complex, Cartier duality and algebraic stacks as analytic stacks through six contracts whose supplier is `none`. Twenty of the 88 targets name `analytic-stacks` alone (plan `neededBy`), and every layer's Dependencies line cites at least one of the six.

   **Witness.** No roadmap or package named AnalyticStacks exists: not under `TauCetiRoadmap/` on main, not in `packages/` on the board, not among the 367 open roadmap pull requests (`roadmaps list`, `roadmaps show AnalyticStacks`), and no board issue matches "AnalyticStacks" (`gh issue list --search`, read-only, zero results). `packages/MotivesAndAlgebraicCyclesPartII/design/README.md` lines 2132–2136 ("Interface 5: `AnalyticStacks:AS.0`") requests the same unowned interface, which confirms the need but supplies nothing.

   **Repair.** Under the brief's rubric a gap whose supplier is `none` is unowned (P1); the design cannot name a supplier that does not exist, so the repair is an operator action, not a fix-worker edit: file the prerequisite roadmap `AnalyticStacks` as a board target (its scope is already written out in the design's six "Supply:" paragraphs and in the report's "Proposed Part IIs and new roadmaps"), then set `supplier: "AnalyticStacks"` and `section: "AS.k"` on each of the six gaps in `plan.json` and the README, keeping the slugs. Until that roadmap exists the six contracts are precise enough to be announced on its job once it does; if the board instead decides to accept supplier-less contracts, this finding is for a human to settle and the review would be accepted conditional on the seven gaps listed in the review JSON. The gap `proetale-v-comparison` (supplier DiamondsAndVStacks §D6.5) is owned and precise; see Verified sound.

2. **F02** (P2) "0-proper" is restated as D-proper in a formalism the source does not use

   **Location.** `design/README.md` line 19 ("Where ALRS calls a map 0-proper, the corresponding target states that it is D-proper, which gives f_! ≅ f_* by HM Lemma 4.6.4(ii)"); line 11 ("maps called 0-proper by ALRS are stated here as D-proper … as ALRS Remark 2.1.1 permits"); the targets 10.2 (line 1355), 10.6 (1424), 10.12(1) (1508), 11.1 (1534), 11.2 (1549), 11.4 (1578), 11.5(1) (1592), 11.6 (1606), 12.1(3) (1690), 12.2(2)–(3) (1705), 12.4 (1734).

   **Claim.** Every "0-proper"/"0-affine" statement of ALRS (a Gestalten notion, ALRS Construction 2.1.2, Sch26b Definitions 6.5 and 6.12) holds as "D-proper" in HM's sense for the six-functor formalism of 2.2, which is the ABLB formalism pulled back from analytic stacks.

   **Witness.** HM Definition 4.6.1 (HM line 3731) defines D-proper only for a truncated map *in the !-able class E* of the formalism. ALRS proves 0-properness in the Gestalten-extended formalism E₁, not membership in E₂: Theorem 5.1.1(1) (ALRS line 4743), Theorem 6.1.1(1) (line 7757), Theorem 6.2.1(1) (line 7922), Theorem 6.3.1 (line 8083), Theorem 6.5.4(2)–(3) (lines 8750, 8753), Proposition 6.5.3(3) "0-affine" (line 8656), Proposition 6.5.10 "0-proper (hence !-able)" (line 8940); even Lemma 5.2.2(3), used by 10.2, is proved from "Πᶜᵒⁿᵗ → GSpec(ℚ_p) which is 0-proper and 0-truncated" (line 4899). ALRS Remark 2.1.1 (lines 688–701) says Gestalten are used (1) to trivialize codualizing sheaves of 0-proper maps, used in Theorems 6.5.4 and 6.5.8, and (2) for !-ability of finitely presented maps; it offers the l.c.i. restriction only for (2), and for (1) points to Remarks 6.5.6 and 6.5.9, which are sketches ("should give rise to a different proof … We do not pursue this here", lines 8932–8937). ALRS Remark 2.1.3 (lines 751–765) transfers properties from E₂ to E₁ for maps in E₀, not the converse. The report's sentence "It agrees with ALRS's 0-proper wherever the design uses it" has no target behind it.

   **Repair.** Either (a) declare the Gestalten layer as a further gap (slug e.g. `gestalten-n-proper`: n-affine and n-proper maps of Gestalten, the conservative functor Gest((−)_D) and the extension of D to Corr(GelfStk, E_{0-proper}); Sch26b Definitions 6.5, 6.12, Propositions 6.10, 6.13; ALRS Construction 2.1.2, line 704) on the same supplier as R01, and state the eleven targets as the source does ("0-proper", "0-affine diagonal"), keeping f_! ≅ f_* as a consequence; or (b) keep D-proper in the formalism of 2.2 but add to each of the eleven targets the explicit sub-statement "f lies in the !-able class of 2.2 and f_! → f_* is an equivalence", with a route (membership in E₀ of ALRS Remark 2.1.3 and the transfer there, or the deformation-to-the-normal-bundle argument of Remark 6.5.9 written out as a target), and replace "as ALRS Remark 2.1.1 permits" at lines 11 and 1686 by a statement that this is the design's own deviation for purpose (1). Under either repair 12.2's route sentence "avoiding the p-adic monodromy theorem … as in ALRS Remark 6.5.5" must say that the source only sketches it.

3. **F03** (P2) Compound `needs` sentences

   **Location.** `design/plan.json` `gaps[0]` … `gaps[5]`, field `needs`; the same sentences at `design/README.md` lines 164–174.

   **Claim.** Each `needs` names one missing thing. `analytic-stacks` reads "Light analytic rings …, the ∞-topos of analytic stacks …, its quasi-coherent six-functor formalism …, and the calculus of suave, prim, D-smooth, D-proper and D-étale maps" and its Supply paragraph lists six deliverables (a)–(f); `analytic-stacks-betti-nuclear` bundles Betti realization, nuclear modules and the Fredholm criteria (three sources, three statements); `analytic-cartier-duality` bundles two 1-categorical dualities, the stacky duality and the description of D(BG_m); `algebraic-stacks-as-analytic` bundles (−)ᶜᵒⁿᵈ, three identifications of sheaf categories, Â¹ = BG_a[−1] and shearing; `solid-serre-duality` bundles suaveness of regular immersions and the dualizing complex of smooth maps.

   **Witness.** Brief rubric: "a vague or compound `needs` (P2)". The Supply paragraphs already enumerate the parts with their own locators (e.g. README line 164 items (a)–(f)).

   **Repair.** One gap per deliverable, mechanically from the Supply items: e.g. split `analytic-stacks` into `light-analytic-rings` (item a), `analytic-stack-topos` (b), `qcoh-six-functors` (c), `suave-prim-calculus` (d), `classifying-stack-dualizing` (e), `hypercover-inversion` (f), each with a one-sentence `needs` carrying its hypotheses, the same slug in `plan.json` and the README, and the `neededBy` lists redistributed (1.1–1.6 need (a); 2.1, 2.4, 2.7 need (b); 2.2, 3.3, 6.3–6.4, 12.x need (c)–(d); 10.1, 10.3 need (e); 2.3 needs (f)). Likewise for the other five.

4. **F04** (P3) Pinned Tau Ceti Fargues–Fontaine declarations are not cited

   **Location.** `design/README.md` line 44 ("No Tau Ceti declaration is imported directly; the pinned library contains no Gelfand rings, prismatization, locally analytic vectors, Sen operators or Hyodo–Kato theory"); 6.1, line 884 ("On analytic adic spaces, D^×_{FF,S} agrees with the period domain Y_S of VectorBundlesAndIsocrystals §VB−1 … and κ_ϖ with periodRadius").

   **Claim.** The classical carrier and radius of 6.1 are supplied only by two roadmaps still in pull requests.

   **Witness.** At the Tau Ceti pin `a91d3aa`, `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Y.lean` line 116 defines `TauCeti.FarguesFontaine.spaY` (𝒴 = D(p) ∩ D([ϖ]) in Spa(W(R), W(R))), line 218 `frobeniusHomeomorph`; `Window.lean` lines 97–103 define `IsRadiusLowerBound`/`IsRadiusUpperBound` (the bounds q ≤ κ(v) ≤ q for κ = log v([ϖ])/log v(p)), line 144 `isRadiusLowerBound_comap_frobenius_iff` (Frobenius multiplies κ by p), lines 255–262 the windows U_n, V_n; `Quotient.lean` line 56 defines the orbit space `spaX` = 𝒴/φ^ℤ with `compactSpace_spaX` (line 200) and `t0Space_spaX` (line 212). These are exactly the classical objects and the normalization κ_ϖ ∘ φ = p·κ_ϖ that 6.1 states and compares.

   **Repair.** Add a `From Tau Ceti` bullet naming these declarations with file and line as the classical adic carrier of 6.1–6.2 (the Gelfand-stack realization remains this roadmap's), and make 6.1's comparison bullet cite them next to RelativeFarguesFontaine §1.2 and VectorBundlesAndIsocrystals §VB−1; replace "No Tau Ceti declaration is imported directly" by the list.

5. **F05** (P3) Finitely presented !-ability narrowed to locally †-l.c.i. maps

   **Location.** `design/README.md` line 11, line 1686, 12.1(4) (line 1690: "locally †-l.c.i. maps of Berkovich spaces are Δ-!-able"), 12.4 (line 1734: "locally †-l.c.i. and whose underlying map of arc-stacks is proper").

   **Claim.** ALRS Proposition 6.5.3(3)–(4) and Proposition 6.5.10 hold for maps locally of †-finite presentation (ALRS lines 8654–8658, 8938–8940); the design states them for the smaller class of locally †-l.c.i. maps, and its own Check (line 1701, the cusp y² = x³) exhibits a finitely presented closed immersion the design no longer covers.

   **Witness.** ALRS Remark 2.1.1 (lines 697–701) offers the restriction as a way to avoid Gestalten, so the narrowing is sourced and the Scope paragraph declares it; but the principle is that a statement is never narrowed below what the source supports.

   **Repair.** With R02(a): state 12.1(3)–(4) and 12.4 at the source's generality behind the Gestalten gap, and keep the l.c.i. case as the route that needs no gap (a Check or a sub-statement). With R02(b): keep the restriction but move the cusp sentence of line 1701 into Scope as the explicit statement lost.

6. **F06** (P3) Locators without a source id, and one attribution

   **Location.** `design/README.md` line 857 "(Remark 3.1.6)"; line 1012 "(Lemma 3.5.2)"; line 1247 "(Remark 2.9.7(1))", "(Remark 2.9.7(2))"; line 931 "(Lemma 4.4.3, Proposition 4.4.7, Corollary 4.4.10)"; line 25 "ABLB writes O⟨1⟩ for O(1)[2]".

   **Claim.** Every locator names its source.

   **Witness.** The bare numbers are ALRS Remark 3.1.6, Lemma 3.5.2 (ALRS line 2670) and Remark 2.9.7, and ABLB §4.4 at line 931; the notation O⟨1⟩ := pullback of O(1)[2] is introduced in ALRS Theorem 6.5.4(1) (ALRS lines 8746–8747), and the ABLB extraction contains no `⟨1⟩`.

   **Repair.** Prefix the source id at the four places; at line 25 attribute the shifted notation to ALRS Theorem 6.5.4(1) (the design's own convention, O⟨1⟩ unshifted with the shift written [2], is consistent throughout and may stay).

7. **F07** (P3) Two theorem statements transcribed verbatim

   **Location.** `design/README.md` line 1720, "Let f: Y → X be a rigid smooth morphism of Berkovich spaces of relative dimension d" (16 words identical to ALRS line 8875); line 1217, "an epimorphism of Gelfand stacks which is infinitesimally cohesive and admits a cotangent complex" (13 words identical to ALRS line 4062).

   **Claim.** Statements are in the author's own words.

   **Witness.** A 16-word shingle scan of the README against the ALRS and ABLB texts finds these two prose runs (the other hits are formulas and bibliography titles).

   **Repair.** Rephrase the two clauses (e.g. "for a rigid smooth map of Berkovich spaces whose relative dimension is d" and "an epimorphism that is infinitesimally cohesive with a cotangent complex").

Reviewed at the design pull request's head `ab278cd` (confirmed equal to the pull request's current head before reading). Files reviewed: `packages/RationalAnalyticPrismatization/design/README.md` (1813 lines, 88 targets in 12 layers), `packages/RationalAnalyticPrismatization/design/plan.json`, `packages/RationalAnalyticPrismatization/sources.toml` (23 entries, unchanged by this review; nothing was fetched). This lane does not elaborate Lean, and the design stage carries no `Suggested.lean`, so items 6–7 of the brief (Lean form, one-tactic probe) are recorded as not available below.

## Verified sound

**Head and files.** Board checkout at `ab278cd`, equal to the pull request's `headRefOid`; working tree clean.

**Principles.** No re-planned roadmap: by object, Gelfand rings and stacks, derived Berkovich spaces, analytic de Rham and Hyodo–Kato stacks, δ-spaces, the prismatization, twistor and Hodge–Tate stacks and the decompletion theorem are defined nowhere on main, on the board, or in the 367 open pull requests (`roadmaps grep` for Gelfand, prismatiz, δ-space, twistor stack, Hyodo–Kato stack, locally analytic Banach–Colmez returned no owner other than the comparison partners the design cites). Supply direction: gate output below, 0 problems. No copied passages beyond R07 (9-, 13- and 16-word shingle scans against ALRS and ABLB). No computational algorithm. No `set_option`, no sorry'd data (no Lean file). Policy grep for process words, pull-request numbers, `lemma`, "optional/deferred/for later", LaTeX delimiters: zero hits.

**Gate.** `gate --candidate … --only RationalAnalyticPrismatization --order …`:

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after LocallyAnalyticRepresentationsOfLocalGroups (the intake inserts it when its design is accepted)
depcheck: 56 roadmaps, 665 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Build order inside the design: all 88 targets' `target:` prerequisites point to earlier targets (scripted over `plan.json`, 0 violations).

**Citations resolved.** The resolver's three leads (MotivesAndAlgebraicCyclesPartII §BM.0, LocallyAnalyticRepresentationsOfLocalGroups §§LR.2–LR.3, LocallyAnalyticDistributionsPartII §ND.0) are board packages at merge-order positions 220, 302 and 300, all before the candidate's position; their sections exist: `packages/MotivesAndAlgebraicCyclesPartII/design/README.md` line 49 "BM.0 — The Banach arc-site", line 134 `BM.0/strict-basis` (a Banach ring is strictly totally disconnected if analytic, uniform, M(A) profinite, residue fields algebraically closed, matching 1.8's API bullet), line 2132 Interface 5 `AnalyticStacks:AS.0`; `packages/LocallyAnalyticRepresentationsOfLocalGroups/design/README.md` line 580 (LR.2), 702 (`derived-analytic-vectors`), 776 (LR.3), 921 (`solid-analytic-vectors`); `packages/LocallyAnalyticDistributionsPartII/design/README.md` line 65 (ND.0). Every other cited supplier section was located by heading in the cited roadmap on main, on the board, or at its open head (scripted over the 33 suppliers and 82 section citations of `plan.json`; all HEAD matches), including: SolidAnalyticRings §1.5 "Light solid abelian groups"; EnhancedDerivedSheaves §E0.5, E2.6, E2.7, E5:abstract.2, E5:presentability.4, E5:descent (and `isDescendable_colimit_of_uniformIndex` at its line 1821), E5:cotangent-export.1; DerivedModuleAlgebra §§0.4, 0.5, 0.25, 1.E.0 (perfect complexes); TropicalAndBerkovichArithmetic §§0.1, 0.7, 0.8, 0.11, 0.13, 0.15, 0.17, 0.19 and `Spectrum` (its `Suggested.lean` line 37, subtype of `MulRingSeminorm` bounded by the norm); AdicSpacesPartIII §R3.9 and `Huber.GelfandSpectrum`; AdicSpacesPartII §§R0.4, R0.10, R0.16, R1.1; AdicSpacesPartIV §§F1.1, F1.2, F1.7; RigidAnalyticGeometry §6.2; PerfectoidSpaces §§P1.1, P1.10, P1.16 (primitive elements in W(R⁺)), P1.27, P2.10, P7.16; SchemeAndStackFoundations §§1.15, 1.18, 1.19, 1.21, 1.22, 5.5; ReductiveGroups Layer 1; AdicEtaleGeometry §§A1.12, A2.4; EtaleCohomologyFoundations §0.9; ClassicalAdicEtaleCohomology §§8.2, 9.3; RelativeFarguesFontaine §§1.2 (`radiusFunctionAndRationalAnnuli`, `periodRadius`, with rad_ϖ(φx) = q·rad_ϖ(x), the same normalization as 6.1), 2.1, 2.2 (`diamondFormulaAndMapToBase`), 3.2, 4.7; VectorBundlesAndIsocrystals §§VB−1 (`relative-annuli`), VB0, VB1 (RΓ_proét(S,E) ≃ RΓ(X_S,O) at its line 603), VB3, VB4; FarguesFontaineDiamonds §§F2, F4; DiamondsAndVStacks §§D6.4, D6.5; PadicHodgeTheory §§2.2, 2.3, 4.4, 7.1 (`associatedLocalSystem` with `shift` M(E[1]) = tM(E), its line 1236); AInfCohomology §AI.3.1; PadicPeriodRings §§1.3, 1.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2 ("The cyclotomic Sen operator is 1", matching HT(χ_p) = +1); LocallyAnalyticDistributions §0.1 (Amice's theorem); NoncommutativeAndEquivariantIwasawa §0.1 and §0.6 "Ordered coordinates of a uniform group"; PhiGammaModulesAndIwasawaCohomology §1.4 (`cyclotomicDecompletionEquivalence`); ClassicalAdicEtaleCohomologyPartII §5.9; CohomologyComparisons §6.7; PrismaticCohomology §1.5; PrismaticCohomologyPartII §§3.9, 4.12, 4.13; PrismaticCohomologyPartIII §6.10. No upward citation: every supplier is on main or earlier than position 302.

**Mathlib at pin `6b7abb3`** (opened in a checkout at that commit): `LightProfinite` at `Mathlib/Topology/Category/LightProfinite/Basic.lean:42` (CompHausLike with totally disconnected and second countable), `LightCondensed` at `Mathlib/Condensed/Light/Basic.lean:28`, `MulRingSeminorm` at `Mathlib/Analysis/Normed/Unbundled/RingSeminorm.lean:61`, `spectralNorm` at `Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:381` (defined through the minimal polynomial over K, as the README says), `WittVector` at `Mathlib/RingTheory/WittVector/Defs.lean:52`, `WittVector.fontaineTheta` at `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:165`, `BDeRhamPlus` at `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75` (adic completion at ker θ[1/p] of the localization away from p; its docstring confirms the zero-ring remark when p = 0 in R), `PadicComplex` at `Mathlib/NumberTheory/Padics/Complex.lean:137`. All eight file:line claims exact. Tau Ceti at pin `a91d3aa`: no module mentions Gelfand rings, prismatization, locally analytic vectors, Sen operators, Hyodo–Kato, Berkovich spaces or light condensed objects (grep); the Fargues–Fontaine modules are R04.

**Sources, seeded sample** (ALRS cached text, 193 pages; theorem number, page and line checked at each locator; hypotheses compared with the README):

| Target | Locators read | Result |
|---|---|---|
| 2.4 | ALRS Thm 2.1.7 line 797 p. 15–16; ABLB Prop 4.6.4 line 2916 p. 55 (adds "quasi-pro-étale after uniform completion", as the README says); ABLB Cor 4.4.10 line 2641 | three parts match; qfd hypotheses on (2)–(3) kept |
| 3.6 | ALRS Lemma 2.5.2 line 1178 p. 22; Prop 2.5.3 line 1197 p. 23 | the three anima and the three functors match, incl. L = fib(O_X → f_*O_Z) and the descent of V(L)^× → A¹ |
| 4.1 | ALRS Lemma 2.6.1 line 1248 p. 24; Def 2.6.4 line 1275; Lemma 2.6.5 line 1293; ABLB Def 4.7.2 line 3051 | the three equivalent conditions, the four smoothness notions and their implications match |
| 4.2 | ALRS Rem 2.6.7 line 1309, Def 2.6.8 line 1321, Def 2.6.10 line 1332, Lemma 2.6.11 line 1339, Def 2.6.12 line 1344, Warning 2.6.13 line 1351 (p. 25) | match; the three disc examples of the Checks are the source's (lines 1359–1362) |
| 5.2 | ALRS Def 2.8.11 line 1712 p. 32; Ex 2.8.12 line 1724; Lemma 2.8.13 line 1762 p. 33; Lemma 2.8.14 line 1777; Prop 2.8.15 line 1805 p. 34 | match, incl. the pullback square along L_{D/S} → L_{D/W} and the T_{Y/D}[1] ⊗ N*-torsor |
| 5.3 | ALRS Rem 2.9.1 line 1866 p. 35; Rem 2.9.2 line 1900 p. 36; Prop 2.9.3 line 1914; Cor 2.9.4 line 2010 p. 38; Ex 2.9.5 line 2021; Prop 2.9.9 line 2119 p. 40 | match; Beilinson heart and the D-de Rham complex as stated |
| 7.1 | ALRS Def 3.3.1 line 2398 p. 46; Rem 3.3.2 line 2417; Ex 3.3.4 line 2429; Lemma 3.5.2 line 2670 p. 51 | match; footnote 20 supports "a property" |
| 7.3 | ALRS Def 3.4.2 line 2470 p. 47; Rems 3.4.3–3.4.5 lines 2479–2488; Prop 3.4.12 line 2569 p. 49; Rem 3.4.13 line 2586; Rem 3.4.14 line 2599; Def 3.4.15 line 2614 p. 50; Lemma 3.4.16 line 2617; Def 3.4.18 line 2651 p. 51 | match; footnote 24 supports the Check on sheafification |
| 8.2 | ALRS Def 4.1.1(5)–(7) line 2965 p. 57; Rem 4.1.2(2)–(4) lines 2980–2993; Def 4.1.4 line 3010 p. 58; Rem 4.1.5–4.1.6 lines 3012–3017; Def 4.1.8 line 3048 p. 59 | match |
| 8.7 | ALRS Thm 4.7.1 line 4040 p. 78 | the three parts match verbatim in content |
| 9.4 | ALRS Def 4.5.1 line 3602 p. 69; Prop 4.5.2 line 3614; Prop 4.5.3 line 3630 | match, incl. the (T_X(−1) ⋊ G_m)^dR-torsor and the relative T_{X/D}{1}^dR-torsor |
| 9.5 | ALRS Def 4.6.1 line 3674 p. 70; Lemma 4.6.4 line 3819 p. 73; Rem 4.6.5 line 3876 p. 74; Constr 4.6.6 line 3891 p. 75; Prop 4.6.8 line 3920; Cor 4.6.10 line 3966 p. 76; Sch13 Cor 6.14 line 1787 p. 39 | match; Sch13 gives 0 → Ô(1) → gr¹OB⁺_dR → Ô ⊗ Ω¹ → 0 as stated |
| 10.2 | ALRS Lemma 5.2.2 line 4860 p. 94; Constr 5.2.3 line 4906; Lemma 5.2.5 line 4957 p. 95; Lemma 5.2.7 line 5072 p. 97 | match except the proper/D-proper wording (R02) |
| 10.8 | ALRS Def 5.5.1 line 5997 p. 112; Prop 5.5.6 line 6055 p. 113; Cor 5.5.13 line 6203 p. 116; Def 5.5.14 line 6213; Lemmas 5.5.16–17 line 6225 | match; the README's "M ⊗ A" elides the ring Γ(G, (τ≥0A^{Bin})_{ϖ^{(d+1)ϵ}}) over which M is a module (a P3-level imprecision, folded into R06's repair: write the base ring) |
| 12.2 | ALRS Thm 6.5.4 line 8745 p. 161–162; Rem 6.5.7 line 8864 p. 164 | dualizing complexes match; "0-proper with 0-affine diagonal" in (2) is R02 |
| headline 11.6 | ALRS Thm 6.3.1 line 8082 p. 149; Thm 1.15 line 356 | hypotheses (K finite over ℚ_p, X smooth partially proper) match; R02 wording |
| 12.3, 12.4, 12.5, 12.1 | ALRS Thm 6.5.8 line 8875, Rem 6.5.9 line 8932, Prop 6.5.10 line 8938, Cor 6.5.11 line 8952, Prop 6.5.3 line 8649 | 12.3's upper-shriek form is the source's (the design's correction of the target note is right); R05 |

No locator the author flagged as unverified exists in the design.

**Adversarial table** (computed values):

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 1.2 API "multiplication by p maps A_{≤r} into A_{≤r/p}" | A = ℚ_p⟨T⟩, r = 1 | A_{≤1} = ℤ_p⟨T⟩, p·ℤ_p⟨T⟩ = A_{≤1/p} by the Check; with \|p\| = p^{-1} the radius scales by 1/p | consistent |
| 1.3 "A^u = 0 ⇒ A = 0" | unit criterion at f = 0 | 0 is a unit in A^u = 0, hence in A, so 1 = 0 in A | holds |
| 1.5 points of M(ℚ_p⟨T⟩) | Gauss point, T = 0, trivial absolute value | \|T\| = 1, \|T\| = 0 are bounded multiplicative seminorms; the trivial norm has \|p\| = 1 ≠ p^{-1} | Check correct, negative control correct |
| 2.5 C^lc(ℕ ∪ {∞}, ℚ_p) | n = ∞ neighbourhoods | locally constant at ∞ ⇒ constant on {n ≥ N} ∪ {∞}: eventually constant sequences ≠ convergent sequences | holds |
| 3.4 ℚ_p^la(A) | A = ℚ_p[ε]/ε², A = C_p[ε]/ε² | X^dR(A) = X(A^u) = ℚ_p resp. C_p; X(ℚ_p)^dR(A) = locally constant maps M(A^u) → ℚ_p = ℚ_p; fibre product = ℚ_p ⊕ ℚ_pε resp. {a + bε, a ∈ ℚ_p, b ∈ C_p} | both Checks hold; 7.5's Γ(FF_{C_p[ε]/ε²}, O) = ℚ_p ⊕ C_pε agrees |
| 3.6 divisor with s = 0 | X = GSpec(ℚ_p) | O_Z = cofib(0: O → O) = O ⊕ O[1], so Z = GSpec(ℚ_p ⊕ ℚ_p[1]) | holds |
| 4.6 zero section 0 → A¹ | I = (T) | L = I/I²[1] = ℚ_p[1]; dual ℚ_p[−1] not connective; amplitude [−1,0] | holds |
| 4.8 L_{BG_m} | G = G_m, trivial group | e^*L_{G_m}[−1] = O·dT/T[−1] = O[−1]; trivial G gives L = 0 | holds |
| 5.1 cones of the point and of ∅ | (Z, D) with D = ∅ (s a unit) or D ≠ ∅ | pt(D) = pt always ⇒ A¹/G_m; ∅(D) = pt iff D = ∅ ⇒ G_m/G_m | holds |
| 5.1 weight of the universal ideal | t of weight −1 (ALRS line 1753) | Ω¹_{A¹} = O·dt has weight −1 = I; ω_{A¹/G_m → BG_m} = I[1], ω_{BG_m} = O[−1], ω_{A¹/G_m} = I | 12.2's Check consistent with 3.6 and Conventions |
| 6.1 radius κ_ϖ = log\|[ϖ]\|/log\|p\| | untilt point of C♭ with ϖ = p♭; the p = 0 locus; φ | \|[p♭]\| = \|p\| ⇒ κ = 1; log\|p\| → −∞ ⇒ κ → 0, so κ^{-1}(0) = {\|p\| = 0}; φ^*[ϖ] = [ϖ]^p ⇒ κ(φx) = p·κ(x) | matches ALRS lines 2318–2321, RelativeFarguesFontaine §1.2 and `isRadiusLowerBound_comap_frobenius_iff` at the pin |
| 6.3 twists on Hyodo–Kato stacks | O(n) = (ℚ_p, p^{-n}φ); G_m; P¹ | φ(dlog T) = p·dlog T ⇒ H¹(G_m) = (ℚ_p, pφ) = O(−1); H²(P¹) = O(−1), ω = O(1)[2] ⇒ trace lands in O(−1) ⊗ O(1) = O; with ω = O(−1)[2] it would land in O(−2) | holds; ABLB Thm 6.3.1's (O(1)[2])^{⊗d} agrees |
| 6.4(2), 11.7, 12.2 Tate duality for ℚ_p | K = ℚ_p; K of degree n | H^i(G_{ℚ_p}, ℚ_p) has dims 1, 2, 0 (Hom(ℤ̂ × ℤ_p^×, ℚ_p) is 2-dimensional, H² dual to H⁰(ℚ_p(1)) = 0), χ = −1; for [K:ℚ_p] = n, dim H¹ = n + 1, χ = −n; pairing H⁰ ↔ H²(ℚ_p(1)) = ℚ_p, H¹ ↔ H¹(ℚ_p(1)) | all three Checks hold |
| 9.8 Breuil–Kisin witness | cyclotomic prism, e = (log q/(q − 1)) ⊗ e⟨1⟩ | φ(log q) = p log q, φ(q − 1) = (q − 1)[p]_q, φ(e⟨1⟩) = p^{-1}e⟨1⟩ ⇒ φ(e) = [p]_q^{-1}e; without ⟨1⟩: p[p]_q^{-1}e′ | holds; 9.9's log_Δ(q) = (q − 1)e is φ-invariant for the twisted Frobenius |
| 9.5 Faltings' extension | X = GSpec(ℚ_p); X = G_m | Ω¹ = 0 ⇒ FE = O{1}; on G_m the class γ ↦ t = log[ε] ∈ H¹(ℤ_p(1), Ĉ(1)) is nonzero, so non-split, and the subobject is Ô(1) not Ô (Sch13 Cor 6.14) | holds |
| 10.1 twisted group algebra | Π = ℤ/2 swapping ℚ_p × ℚ_p | crossed product of the Galois ℤ/2-algebra ℚ_p × ℚ_p is M_2(ℚ_p); untwisted product gives ℚ_p⁴ commutative | holds |
| 10.3 Mahler criterion | f(a) = (1 + p)^a; f = Σ p^k binom(a, p^k) | c_n = p^n, \|c_n\|r^n = (r/p)^n → 0 iff r < p; for the second, \|c_{p^k}\|r^{p^k} = p^{-k}r^{p^k} → ∞ for every r > 1 | both Checks hold (p = 2 also satisfies the first, so "p odd" is unnecessary but harmless) |
| 11.2 sign of the arithmetic Sen operator | C_p(n), n = 0 and n ≠ 0 | θ = n: n ≠ 0 kills H*; n = 0 gives H⁰ = H¹ = K; with θ_{O{1}} = −1 the Sen weight of the Tate twist would be −1, against R07.P7.2's "cyclotomic Sen operator is 1" | holds |
| 12.3, 12.4, 12.5 on P¹ and G_m | d = 1; Y = G_m over ℚ_p | ⊕_{k=0}^1 O{1−k}[2−2k] = O{1}[2] ⊕ O; f_*O = O ⊕ O{−1}[−2], dual O ⊕ O{1}[2] = f_*(O{1}[2]); G_m: f^!O = O{1}[2], composed with ω_{Div¹} = O{1}[2] gives O{2}[4] | holds; the upper/lower-shriek distinction in 12.3's Check is right |
| 12.2(3) dualizing complex off the Hodge–Tate locus | I trivial on Div¹ ∖ Q_p^HT | O{1}[2] = I ⊗ O⟨1⟩[2] restricts to O⟨1⟩[2], the pullback of 12.2(1)'s complex; on FF_{Q_p^⋄} the pullback of O{1} is the slope-0 Tate twist, of O⟨1⟩ the slope-1 bundle (6.4's two H⁰ computations: ℚ_p(1) vs B_cris^{φ=p}) | consistent |
| 7.6 sign of the twist in BC | λ = 1, λ = −1 | O(1) := descent of O ⊗ D_{−1} has H⁰(FF_{C♭}) = B^{φ=p} = BC(O(1))(C) ≠ 0; with D_1 it would be 0; H¹(O(−1)) = C_p/ℚ_p | holds |
| 2.4(1) descendable cover of ℚ_p | A = ℚ_p → ℚ_p^cyc; A = 0 | retraction ℚ_p^cyc → ℚ_p exists (index 1 descendability); empty family covers ∅ | holds |
| 1.8 nilperfectoid examples | C_p[ε]/ε²; ℚ_p(μ_{p^∞}) uncompleted; ℚ_p | †-red = C_p = A^u ✓; †-red = itself ≠ completion ✗; ℚ_p not perfectoid ✗ | holds |

**Gaps.** Seven gaps are declared with the same slug in `plan.json` and the README (counts of each slug in the README: 34, 11, 3, 10, 6, 5, 5). `proetale-v-comparison`: supplier DiamondsAndVStacks §D6.5 exists (its line 9298, "The étale-site comparison", étale and finite étale sites of Y and Y^⋄ for analytic adic Y over ℤ_p); the needs sentence is precise (rigid X over a nonarchimedean field over ℚ_p, Ẑ_p[1/p] on X_proét versus topological ℚ_p on X^⋄_v) and minimal as far as I could check: a grep of the roadmaps on main and at the open heads for `RΓ_v` and for "pro-étale … v-site/v-cohomology" found only the perfectoid-space comparisons of DiamondsAndVStacks D2 and PerfectoidTowers (vector bundles across sites), not the cohomology comparison for rigid X.

**Shape.** Every definition and construction (30 of the 88 targets) has an API list and 3–4 Checks (minimum 3; scripted). Every layer ends with Examples and Dependencies. Section headings and house style match the roadmaps on main. The ABLB numbering collation in the report and References (six labels) is consistent with the ABLB v2 text at the lines cited.

**Headline theorems** (from the Summary and Layers 11–12): 11.6 (ALRS Theorem 6.3.1) with 11.1 and 11.4; 11.7 (pro-étale cohomology as twistor cohomology); 11.2, 11.5, 11.8 (Hodge–Tate stacks and Sen operators, inverse Faltings' extension); 10.12 (decompletion theorem) with 11.9–11.10 (torsors); 12.2–12.4 (duality); 12.5 (projective bundle formula); 12.6 (Riemann–Hilbert functor). None is statable at the pins: every carrier (Gelfand stacks, X^{Div¹}, X^HT, FF_{X^⋄} as a Gelfand stack, G^la) is absent from Mathlib and Tau Ceti; the classical statements they recover (Tate's theorem, Sen operators, Faltings' extension, Kummer Chern classes) are owned by the roadmaps the design cites as Checks, as the operator note asks. The package stage must therefore produce a `Suggested.lean` whose docstring names these headlines as not statable and states nothing in their place. Lean elaboration: not available (this lane does not elaborate, and there is no Lean file at the design stage); the one-tactic padding probe is not applicable.

**Design shape (judgement, not a finding).** The operator note proposes a split into about ten roadmaps. Under the project's principles a single roadmap is admissible here: the 1813-line README is mid-sized next to the roadmaps on main it consumes, the merge order can insert one roadmap after position 302, every layer has one direction of supply, and downstream roadmaps can import "RationalAnalyticPrismatization Layers 1–6" by section exactly as they would import a separate roadmap. The one seam where a split would buy something is ABLB versus ALRS: Layers 1–6 (Gelfand rings and stacks, derived Berkovich spaces, analytic de Rham and Hyodo–Kato stacks, Fargues–Fontaine curves as Gelfand stacks) are the content of a different paper and will be consumed by the syntomification and integral Part IIs the README itself names, and Layer 10 (decompletion, ALRS §5) depends only on Layers 1–7; if the board prefers the split, those two cuts (Layers 1–6 | 7–9 + 11–12 | 10) follow the design's own dependency structure and need no re-planning. The design's choice to declare the Clausen–Scholze analytic-stack layer as a prerequisite roadmap rather than plan it is right, and is what R01 asks to be made real.

## Not verifiable

- Lean elaboration and the padding probe: no `Suggested.lean` exists at the design stage and this lane does not elaborate.
- Ownership against open pull requests: the brief names the sibling pull requests without file paths; I resolved every roadmap the design cites at its open head through `roadmaps show`, and searched the open heads by object with `roadmaps grep`, but did not read all 367 open roadmaps by hand.
- The Gestalten source (Gest) was not read beyond ALRS's description of what it supplies (R02 rests on ALRS's own statements of which notion is proved).
- The ABLB extraction contains no `⟨1⟩` glyph, so the attribution at README line 25 could not be confirmed either way (R06).
- Whether every "0-proper" map of ALRS lies in the !-able class of the ABLB formalism (the mathematical content behind R02) is not decided by any text I could read; R02 asks the design to state it as a target or declare the gap.

## Source issues

- **Misprint** in ALRS at Remark 2.1.6, printed page 15 (ALRS line 794): the source cites ABLB Lemma 3.6.2 for "strictly totally disconnected with A^{†-red} = A^u is nilperfectoid"; it should be ABLB v2 Lemma 3.1.17 (ABLB line 1428); affects nothing.
- **Misprint** in ALRS at Theorem 5.2.14, printed page 101 (ALRS line 5314): the source cites Lazard "Corollary I.3.9"; it should be Chapitre III, (1.3.9) Corollaire, printed page 77 (Laz65 line 2873); affects nothing.
- **Misprint** in ALRS at Theorem 6.5.4, printed page 161 (ALRS lines 8746–8753): part (1) writes the dualizing complex as O⟨1⟩ with the shift [2] absorbed into O⟨1⟩, part (3) writes O{1}[2] with the shift outside; it should use one convention (the design's: O⟨1⟩ unshifted, [2] written); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ab278cd", "job": "REV-DESIGN-RationalAnalyticPrismatization", "model": "fable", "worker": "fable-rev164"} -->
