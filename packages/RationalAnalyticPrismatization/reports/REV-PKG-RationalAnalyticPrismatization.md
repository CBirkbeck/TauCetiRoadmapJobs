<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18047#issuecomment-6907506876 -->
Review (claude) of 7668462

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) 9.4: the relative Hodge–Tate torsor is stated without the hypothesis its proof uses

   **Location.** `packages/RationalAnalyticPrismatization/README.md` line 1488 ("prove the relative version over a perfect prism, with a `T_{X/D}{1}^dR`-torsor (ALRS Proposition 4.5.3 …)"), line 1498 (API: "Over a perfect prism (S, 𝒳, D) and a †-cohesive formally smooth X → D, the relative formal and overconvergent Hodge–Tate stacks are `T_{X/D}{1}^dR`-torsors …") and the `*Needs:*` line 1492.

   **Claim.** For every Gelfand stack X with a †-cohesive formally smooth map X → D, the relative stacks are torsors over the relative cones.

   **Witness.** The proof of ALRS Proposition 4.5.3(2) starts "since X is a Berkovich space" (ALRS line 3645) and applies ALRS Proposition 2.8.15, whose parts (2)–(3) assume Y → D → W → S infinitesimally cohesive with cotangent complexes (ALRS line 1810); the README states that hypothesis itself in 5.2 (line 1015). "Formally smooth" (ALRS Definition A.2.2(4), ALRS line 9586) only asks for a cotangent complex, so the README's route (which names 5.2) does not apply to the X it quantifies over. The `*Needs:*` line of 9.4 also omits §5.2 and §4.6, which the route uses. The README already repaired the same pattern in 10.11, where ALRS Proposition 5.8.9 is stated for a Berkovich space W although the source's statement says Gelfand stack.

   **Repair.** In line 1488 replace "prove the relative version over a perfect prism, with a `T_{X/D}{1}^dR`-torsor" by: "prove the relative version over a perfect prism: for X → D †-cohesive the corresponding relative squares are cartesian, and for a Berkovich space X with a formally smooth map X → D (so that X → D → 𝒳/φ^ℤ are infinitesimally cohesive with cotangent complexes, as 5.2 requires; the proof of the source assumes X Berkovich, ALRS line 3645) the map X^dR → `(X^{cone/(D,𝒳/φ^ℤ)}_s)^dR` is a `T_{X/D}{1}^dR`-torsor". In line 1498 replace "a †-cohesive formally smooth X → D" by "a Berkovich space X with a formally smooth map X → D (†-cohesive by ALRS Example 2.7.8(1))". Change the `*Needs:*` line to `§9.1; §9.2; §8.2; §5.1; §5.2; §4.6; §3.1`. Tested on the instances: for X = D (Berkovich, `T_{D/D}` = 0) the repaired statement gives the trivial torsor, as the fourth Check of 9.4 computes; for a Gelfand stack X that is not infinitesimally cohesive the repaired statement asserts nothing, where the original asserted a torsor with no proof route.

2. **F02** (P3) 2.3: the third Check separates Perf from the other two sheaves, not the other two from each other

   **Location.** `packages/RationalAnalyticPrismatization/README.md` line 580: "The object ℚ_p⟨T⟩ ∈ D(GSpec(ℚ_p)) is eventually connective and nuclear but not dualizable, so the three sheaves of categories are distinct."

   **Claim.** One object shows Perf, D^+ and Nuc pairwise distinct.

   **Witness.** ℚ_p⟨T⟩ lies in D^+ ∩ Nuc and outside Perf: it gives Perf ≠ D^+ and Perf ≠ Nuc and says nothing about D^+ versus Nuc. A wrong definition with Nuc = D^+ passes the Check.

   **Repair.** Replace the conclusion by "so Perf differs from both D^+ and Nuc" and add: "D^+ and Nuc differ in both directions: (∏_ℕ ℤ_p)[1/p] is static, hence eventually connective, and compact, and a compact nuclear object is dualizable, which it is not (the dualizable objects of `D(ℚ_{p,■})` are the perfect complexes, 1.7), so it is not nuclear; `⊕_{n≥0}` ℚ_p[−n] is a colimit of nuclear objects, hence nuclear, and lies in `D_{≥−n}` for no n." Tested: the two new objects are on opposite sides of D^+ versus Nuc, so a definition identifying them fails the Check.

Two findings: one P2 (a hypothesis the source's proof and the roadmap's own input use, missing from a statement of 9.4) and one P3 (a Check whose conclusion is wider than its example). Everything else that was checked is sound; the evidence is below. There is no previous review of the package and no maintainer note.

## Verified sound

**Principles.** No route-specific shortcut found; coefficients ℚ_p are the source's stated restriction (ALRS Remark 1.27) and are declared in Scope and Conventions. No re-planned roadmap: AnalyticStacks (open) hands Gelfand rings, Gelfand stacks, de Rham stacks and prismatization to this roadmap and places Gestalten outside its scope (its README lines 22–23); a search of all open heads and main for Gestalt, Stefanich, "Gelfand (ring|stack)", prismatization, "Hyodo–Kato stack", "analytic de Rham stack" finds only AnalyticStacks' boundary sentences. No algorithm, no sorry'd data, no `set_option`.

**Dependency check** (output): `depcheck: 246 roadmaps, 2318 edges, 0 problem(s)`. No UPWARD or CYCLE line.

**Elaboration.** `lake env lean` on `packages/RationalAnalyticPrismatization/Suggested.lean` from the content checkout: exit 0, no output (no warning at all: the file declares nothing, so there is no `sorry`). Import header: `module`, `import Mathlib`, no other import. No `#check @name` comparison applies (0 declarations); the one-tactic padding probe has nothing to probe.

**Headline theorems** (from the README Summary) and `Suggested.lean`: (1) comparison with the relative Fargues–Fontaine curve, 11.6 with 11.1 and 11.4; (2) pro-étale cohomology as twistor cohomology, 11.7; (3) Hodge–Tate stacks and arithmetic, geometric, mixed Sen theory, 11.2, 11.5, 11.8; (4) decompletion, 10.12, 11.9, 11.10; (5) twistor duality, 12.2–12.4; (6) projective bundle formula, 12.5; (7) Riemann–Hilbert, 12.6. All seven are named in the module docstring as not statable, each with the missing carriers. I agree for each: every statement quantifies over Gelfand stacks, and the pins have no analytic rings, no derived ∞-category of solid modules, no six-functor formalism and no stacks on Gelfand rings (checked: `CondensedMod.IsSolid` at Mathlib/Condensed/Solid.lean:83 is a predicate on condensed modules only; `TauCeti.FarguesFontaine.spaX` at Quotient.lean:59 is a topological orbit space). No stand-in is stated. No padding.

**Pinned declarations opened** (Mathlib 1b1ccf4, Tau Ceti 2fd255d; 25 of 25 exist at the cited file and line): `LightProfinite` (LightProfinite/Basic.lean:44), `LightCondensed` (Condensed/Light/Basic.lean:29), `MulRingSeminorm` (RingSeminorm.lean:61), `spectralNorm` (SpectralNorm.lean:381), `WittVector` (Defs.lean:52), `WittVector.fontaineTheta` (FontaineTheta.lean:166), `BDeRhamPlus` (BDeRham.lean:75), `CondensedMod.IsSolid` (Solid.lean:83), `PadicComplex` (Complex.lean:137), `PadicInt.mahlerEquiv` (MahlerBasis.lean:353, `C(ℤ_[p], E) ≃ₗᵢ[ℤ_[p]] C₀(ℕ, E)`), `TauCeti.LocallyAnalytic` and `.eval` (LocallyAnalytic.lean:45, :85), `TauCeti.AnalyticStage.amiceMap` (Amice/Basis.lean:494), `spaY`, `frobeniusHomeomorph` (Y.lean:116, :220), `IsRadiusLowerBound`, `IsRadiusUpperBound`, `isRadiusLowerBound_comap_frobenius_iff`, `windowU`, `windowV` (Window.lean:102, :108, :149, :260, :267), `spaX`, `compactSpace_spaX`, `t0Space_spaX` (Quotient.lean:59, :259, :271). The README attributes no backticked Lean name to this roadmap; `Spectrum` and `Huber.GelfandSpectrum` are the suppliers' names (TropicalAndBerkovichArithmetic `Suggested.lean` line 37; AdicSpacesPartIII README line 661 and `Suggested.lean` line 798), so the second lead of the citation list is no finding.

**Cross-roadmap citations resolved.** MotivesAndAlgebraicCyclesPartII Layer 0 (the first lead): the roadmap is a package on the board, earlier in the merge order, and its Layer 0 is "The Banach arc-site" with `Marc(A) ≃ Marc(A^u)` (its README lines 100, 138): no finding. AnalyticStacks at its open head: all 35 sections of the "Sections consumed" line exist (headings 0.2–7.7 read), and §4.2 (modulus δ(g) = [gKg⁻¹ : K], line 905 and Conventions (4)), §4.5, §6.3(1) (dualizing complex det(I/I²)^∨[−c]), §1.7 (ε₁ of weight −1, differential raising the weight), §4.4(6), §2.3(7) state what is cited; its consumer note maps this roadmap's 18 contracts to those sections. On main: EnhancedDerivedSheaves (13 ids), DerivedModuleAlgebra §§0.4, 0.5, 0.25, 1.E.0, AdicSpacesPartIII §R3.9. At open heads: PadicHodgeTheory §§2.2, 2.3, 4.4, 7.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2 (`HT(χ_p)=+1`, line 1569); DiamondsAndVStacks §§D6.4, D6.5; TropicalAndBerkovichArithmetic §§0.1, 0.15, 0.30 (its Check: the strict closed subdisc is quasi-étale, not étale, as the Conventions say); PadicFunctionalAnalysis §4.4; NoncommutativeAndEquivariantIwasawa §§0.1, 0.2, 0.6, 0.7; RefinedTraceMethods §§1.7, 1.10, 4.3; SolidAnalyticRings §1.5; PadicPeriodRings §§1.3, 1.4; VectorBundlesAndIsocrystals (the three quoted target titles exist).

**Declared gap.** `gap:proetale-v-comparison` (DiamondsAndVStacks §D6.5): same slug in the plan and the README (line 160), named supplier, one precise sentence with its hypotheses; §D6.5 states the étale-site comparison only and no roadmap states a pro-étale versus v-cohomology comparison (searched `RΓ_v`, v-cohomology, pro-étale/v-site at all heads). Sound as a contract. The other 20 plan entries are discussed under "For the human reviewers".

**Sources: the seeded sample (15 targets, all read against the text).** The author flagged no locator as unverified.

| Target | Locators checked against the text | Result |
|---|---|---|
| 2.2 | ALRS Construction 2.1.2 (line 704), Remarks 2.1.3 (751), 2.1.4 (780), footnote 58 (8962); ABLB Remark 4.2.8 (2209); HM 3.3.3 (1924), 3.4.11 (2258); Gest Definitions 6.5, 6.9, 6.12, Propositions 6.10, 6.13 | agree; hypotheses agree |
| 2.3 | ALRS line 809, Lemmas 2.1.8 (820), 2.1.9 (841), 2.1.10 (861); ABLB Lemma 4.2.11 (2235), Definition 4.2.12 (2253) | agree (Check: R02) |
| 4.2 | ALRS Remark 2.6.7 (1309), Definitions 2.6.8 (1321), 2.6.10 (1332), 2.6.12 (1344), Lemma 2.6.11 (1339), Warning 2.6.13 (1351); ABLB Definition 3.2.8 (1658) | agree |
| 4.3 | ALRS Definition 2.7.1 (1366), Example 2.7.2, Lemmas 2.7.3 (1375), 2.7.4 (1441), 2.7.5 (1461), Example 2.7.6 (1523) | agree |
| 4.6 | ALRS Definition A.2.2 (9552), Example A.2.3 (9591), Lemmas A.2.4 (9595), A.2.5 (9601) | agree; the README has the base change in the right direction (source misprint) |
| 5.2 | ALRS Definition 2.8.11 (1712), Example 2.8.12 (1724), Lemmas 2.8.13 (1762), 2.8.14 (1777), Proposition 2.8.15 (1805), Remark 2.8.16 | agree |
| 5.4 | ALRS Definition 3.1.1 (2195), Proposition 3.1.3 (2221), Remark 3.1.4 (2230), Definition 3.1.5 (2240), (3.1.1) (2255), Remark 3.1.6 (2263), line 2283 | agree |
| 8.5 | ALRS Remark 4.2.12 (3287), Proposition 4.2.13 (3309) and proof (3327, 3347), Corollary 4.2.14 (3362) | agree |
| 9.4 | ALRS Definition 4.5.1 (3602), Propositions 4.5.2 (3614), 4.5.3 (3630), line 9169 | absolute part agrees; relative part: R01 |
| 10.11 | ALRS §5.8 (7454), Lemmas 5.8.1 (7473), 5.8.2 (7511), 5.8.5 (7555), 5.8.8 (7581), Propositions 5.8.9 (7595), 5.8.10 (7627, proof 7654), Remark 5.8.6 | agree; the README states 5.8.9 for a Berkovich space, as the proof needs |
| 11.1 | ALRS Theorem 6.1.1 (7756), Remark 6.1.5 (7873), footnote 48 (7776), Example 6.1.7 (7888) | agree; the README corrects Remark 6.1.5 (see Source issues) |
| 11.2 | ALRS Theorem 6.1.3 (7798), Example 6.1.4 (7868) | agree |
| 11.7 | ALRS (1.2.2) (480) | agree (smooth partially proper) |
| 11.10 | ALRS Definition 6.4.4 (8384), Construction 6.4.5 (8404), Lemma 6.4.8 (8454), Remark 6.4.9 (8471), Propositions 6.4.10 (8477), 6.4.12 (8539, 8545); RCSen Theorem 1.0.4 (113); RJRC22 Lemma 3.21 (862) | agree |
| 12.5 | ALRS Construction 6.6.1 (8992), Remarks 6.6.2 (9006), 6.6.4 (9032), 6.6.6 (9084), Proposition 6.6.7 (9093); Zav Definition 5.2.8 (1949); ABLB Lemma 6.2.9 (5303) | agree |

Also read outside the sample: ALRS Theorem 6.3.1 (8082) for the headline 11.6, Theorem 6.5.4 (8745) and Remark 6.5.5 (8819) for 12.2, Construction 4.9.1 and Remarks 4.9.2–4.9.3 (4233–4298) for 9.8, Theorem 5.2.14 (5314) for 10.4, Lemma 2.8.6 (1653) for 5.1, ABLB Definition 6.2.8 (5300), Gest Propositions 7.9 (2479), 9.5 (3082), Corollary 9.8 (3166).

**Adversarial table** (values computed here).

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 11.6 headline, via 11.7 Checks | X = GSpec(ℚ_p); K of degree n | `RΓ(Gal_{ℚ_p}, ℚ_p)`: dims 1, 2, 0, χ = −1 = −[ℚ_p:ℚ_p]; H¹ = Hom(K^×, ℚ_p) of dim n + 1 | consistent | none |
| 11.1 Frobenius-twisted product | K = `ℚ_{p²}`; K = `ℚ_{p³}` with σ and σ⁻¹ | untwisted: H⁰ = K ⊗ ℚ_p of dim 2, dims 2, 4, 0; required: `RΓ(Gal_K, ℚ_p)` dims 1, 3, 0. Twisted by σ: σ⊗φ acts factorwise by φ on ∏_τ B, invariants ℚ_p³; by σ⁻¹: factors permuted cyclically, invariants `ℚ_{p³}` | twisted form with σ is the right one; the source's untwisted formula fails for K ≠ ℚ_p | none (README already twisted) |
| 11.2 Sen operator `θ_{O{n}}` = n | n = 0, n ≠ 0, sign −1 | n = 0: K →⁰ K gives H⁰ = H¹ = K, H² = 0; n ≠ 0: all zero; sign fixed by HT(χ_p) = +1 at the supplier (line 1569) | consistent with Tate | none |
| 12.2 dualizing complex O{1}[2] of Div¹ | Tate duality; modulus of ℚ_p ⋊ ℚ_p^×, K = ℤ_p ⋊ (1 + pℤ_p), a = p | H⁰(ℚ_p) = 1 ↔ H²(ℚ_p(1)) = 1; H¹: 2 ↔ 2. [pℤ_p : pℤ_p]/[ℤ_p : pℤ_p] = 1/p, so δ(p) = p⁻¹ as in AnalyticStacks Conventions (4) | consistent | none |
| 12.3–12.5 projective bundle | d = 1, d = 0, G_m | f_*O = O ⊕ O{−1}[−2]; f_*O{1}[2] = O{1}[2] ⊕ O = (f_*O)^∨; d = 0: O ≅ O; G_m over ℚ_p: O{1}[2] then O{2}[4] over the point | the three sections agree | none |
| 9.8 Breuil–Kisin twist, Conventions | e = (log q/(q − 1)) ⊗ e⟨1⟩ | φ(log q/(q − 1)) = p log q/(q^p − 1) = p·[p]_q⁻¹·log q/(q − 1); φ(e⟨1⟩) = p⁻¹e⟨1⟩; φ(e) = [p]_q⁻¹e; without ⟨1⟩: p·[p]_q⁻¹ | consistent with Conventions and 9.9 (log_Δ(q) = (q − 1)e, p⁻¹φ(log q) = log q) | none |
| Twists, 6.3 and Conventions | P¹ on Hyodo–Kato stacks | f_*O = O ⊕ O(−1)[−2], ω = O(1)[2], H² ⊗ ω = O; with ω = O(−1)[2]: O(−2) ≠ O; O(1) = (ℚ_p, p⁻¹φ) has sections B^{φ=p} ≠ 0 | consistent across 6.3, 6.4, 7.6, 12.2 | none |
| 8.5 radius regions | κ versus 1/κ | Hodge–Tate at 1, inverse Frobenius translates at p⁻ⁿ; (1, ∞) contains none; (0, p) ↔ (1/p, ∞), (1, ∞) ↔ (0, 1) in the radius of 𝒳_T; φ multiplies κ by p on both | agrees with ALRS 4.2.13 and its proof | none |
| 9.4 relative torsor | X = D; X not infinitesimally cohesive | X = D: `T_{D/D}` = 0, trivial torsor, `D^{†-HT/D^†}` = D^†; general Gelfand stack: 5.2 not applicable | statement wider than its route | R01 |
| 2.3 Check 3 | ℚ_p⟨T⟩; (∏ℤ_p)[1/p]; ⊕ℚ_p[−n] | in D^+ ∩ Nuc ∖ Perf; in D^+ ∖ Nuc; in Nuc ∖ D^+ | first object alone does not separate D^+ from Nuc | R02 |
| 2.2 six functors, 0-proper | closed disc, open disc, identity | closed: f_! = f_* forgetful; open: f_!O in degree 1, f_*O in degree 0, so f_! ≇ f_*; identity: all trivial | discriminating | none |
| 4.2 morphism classes | open disc, overconvergent disc, Tate closed disc, †-rational subdisc | rigid smooth; Berkovich-smooth not rigid smooth; neither; Berkovich-étale not rigid étale | as ALRS Warning 2.6.13 | none |
| 4.3 pushouts, Lemma 2.7.5 | two discs along origins; Z = ∅; A = C = ℚ_p[T], B = ℚ_p | ℚ_p⟨S⟩ ×_{ℚ_p} ℚ_p⟨T⟩ = ℚ_p⟨S,T⟩/(ST); disjoint union; (⊕_{even}B[n], ⊕_{odd}B[n]) not in the image on full D | consistent with (3) being only on D^+ and Perf | none |
| 4.6 deformation theory | A¹; 0 → A¹; (A¹)^dR | L = O·dT (dual of connective perfect); L = ℚ_p[1], dual ℚ_p[−1] not connective; L = 0 | discriminating | none |
| 5.1–5.2 cones, square-zero lifts | Y = point, ∅; Sqz(ℚ_p/ℚ_p; ℚ_p) | A¹/G_m; G_m/G_m (∅(0) is a point); τ_{≥0}Hom(0, M[1]) = point, extension ℚ_p[ε]/ε² | consistent; weight −1 agrees with AnalyticStacks (t of weight −1) | none |
| 5.4 A¹/G_m^† versus A¹/Ĝ_m | vector bundle on |T| ≤ r; skyscraper ℚ_p[θ] | T∂_T T^n = nT^n, norm ≤ 1, entire series converge; Σ p^{n²}θ^n has no limit in ℚ_p[θ] | same vector bundles, different sheaves, as ALRS Remark 3.1.6 | none |
| 10.4 Lazard's criterion | (1 + p)^a; Σ p^k binom(a, p^k); d = 2; ϖ = p^{1/2}, ϖ = p² | c_n = p^n, (r/p)^n → 0 iff r < p; p^{−k}r^{p^k} → ∞; Legendre: Σ v_p(⌊α_i/p^h⌋!) ∈ [|α|/(p^h(p−1)) − d(2 + log_p(|α|+1)), |α|/(p^h(p−1))]; |p|_ϖ = 1/4 and 2^{−1/2} | iff holds in both directions on the instances; hypothesis |p|_ϖ ≤ 1/2 discriminates | none |
| 10.11 torsors | trivial torsor; Γ finite; G trivial | trivial ↦ trivial; BΓ^sm its own relative de Rham stack; `Y^{H-la}/H^la` on both sides | consistent; 5.8.9 stated with W Berkovich | none |
| 11.10 | K_∞ = K(μ_{p^∞}); trivial torsor | `K^{u,la}_∞` = K(μ_{p^∞}) uncompleted, as in 9.7 and 9.4 Check 1 ((B⁺_dR/t^n)^la = K_∞[t]/t^n, ALRS line 9172); g_β = 0 | consistent | none |
| Layer 1 Checks (sampled 1.2, 1.3, 1.6, 1.8) | ℚ_p⟨T⟩, ℚ_p[ε]/ε², colim ℚ_p⟨T/pⁿ⟩, overconvergent disc, ℚ_p(μ_{p^∞}) | `A_{≤1}` = ℤ_p⟨T⟩; Nil† = ℚ_pε; T ∈ Nil† not nilpotent; Nil† = 0 and A^u = ℚ_p⟨T⟩; †-reduction ≠ completion | consistent with each other and with 7.2, 8.1 | none |
| Layer 0 (0.2–0.5) | D(k[x]) over D(k); B²G_m; finite sets | 0-affine, 0-proper, 1-étale, not 0-suave (⊗k[x] does not preserve products); 1-affine not 0-affine; fold map: f_! = f_* = ⊕, relative algebra Λ × Λ | agree with Gest 6.5–6.13, 9.3–9.8 as cited | none |

**Shape.** 110 numbered subsections in 13 layers; every one has exactly one `*Needs:*` line and at least three Checks (counted mechanically: minimum 3); every layer ends with `### Examples` and `### Dependencies`; the sections Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Downstream consumers, References are present. No LaTeX delimiters, no pull-request numbers, no machine paths, no process words (searched: round, checkpoint, handoff, removed, current, optional, deferred, TODO; the two hits of "lemma" are "Shapiro's lemma" and "the Poincaré lemma"). The manifest has 24 entries, the 24 works of the References; every cited id is in it; no local path in it; I fetched nothing and added no entry.

**Duplication by object.** Nothing the README states as its own exists at the pins (no Gelfand ring, analytic ring, six-functor formalism, Stefanich ring; checked by the searches above). Mahler's theorem and the Amice basis map are cited, not restated; Lazard's criterion in d variables with Banach coefficients is kept with the one-clause difference from LocallyAnalyticDistributionsPartII §1.5 stated in Scope.

Overlap check: read AnalyticStacks, PrismaticCohomologyPartIII, AInfCohomology, PrismaticCohomologyPartIV, CohomologyComparisons, CrystallineCohomology, EnhancedDerivedSheaves, PerfectoidSpaces; nothing shared: AnalyticStacks owns analytic stacks, their six functors, Cartier duality and the two-level suave and étale maps and names this roadmap as the owner of Gelfand rings, Gelfand stacks, de Rham stacks and prismatization; Gestalten at all levels are owned here (Layer 0) and by no other roadmap; the integral Breuil–Kisin twist, prismatic logarithm and Sen operator stay with PrismaticCohomology Parts I–III and are used here in Checks only; CohomologyComparisons owns Pan's decompletions of specific period representations, a different object from the decompletion of Layer 10.

**Copyright.** Wording: the 15 sampled sections and 6 further passages (5.1, 9.8, 10.4, 11.6, 12.2, the docstring of `Suggested.lean`) were read beside the source; in addition the whole README was compared mechanically with ALRS, ABLB, Gest, HM and RCSolid for shared runs of eight or more words. The longest shared runs of prose are 11 words (Gest line 3043, a forced description of an adjoint) and 9–10 words (standard stability phrases); longer runs are formulas, lists of names of notions and bibliographic titles. No passage follows a source clause by clause. Arrangement: ALRS has five chapters and an appendix; the roadmap has 13 layers, by number Layer 0 ↔ Gest VI–IX; Layer 1 ↔ ABLB §§2–3; Layer 2 ↔ ALRS 2.1–2.2 with ABLB §4; Layer 3 ↔ 2.3–2.5; Layer 4 ↔ 2.6–2.7 and Appendix A; Layer 5 ↔ 2.8–2.9 and 3.1; Layer 6 ↔ 3.2 with ABLB §§5–6; Layer 7 ↔ 3.3–3.7; Layer 8 ↔ 4.1–4.3 and 4.7; Layer 9 ↔ 4.4–4.6 and 4.8–4.10; Layer 10 ↔ §5 with 5.1 last; Layer 11 ↔ 6.1–6.4; Layer 12 ↔ 6.5–6.7. This is not one to one (only Layer 10 has the scope of one chapter), and the order is forced: the `### Dependencies` lines give Layer k ← Layers up to k − 1 for every k except Layer 10 ← Layers 0–7, whose free position the README states. Reuse: no table, figure or list of exercises is taken over.

Source independence: 21 passages compared with 5 sources by reading and the whole README by shared-run search, none shared beyond 11 forced words; largest share ALRS, 796 of 1250 locators; contents compared with ALRS: independent (13 layers against 5 chapters and an appendix, order forced by the dependency lines).

## Not verifiable

- Laz65 Chapitre III (1.3.9.2): the formula is garbled in the OCR text (Laz65 line 2876); the statement of 10.4 was checked against ALRS Theorem 5.2.14 (ALRS line 5314–5327) and the heading of (1.3.9) (Laz65 line 2873) only.
- Ownership against open pull requests was checked through the roadmap search tools (README and `Suggested.lean` at the open heads), not by reading every open roadmap in full.
- The roughly 95 subsections outside the sample were not compared with their sources locator by locator; their Checks were recomputed where the table above says so, and their locators were not opened unless listed.

## Source issues

- **Error** in ALRS at Remark 6.1.5, p. 145: the source says the twistor stack of an unramified K is the plain product of GSpec(K) with Div¹; it should be the quotient of GSpec(K) × Div¹~ by the Frobenius acting through σ on K (H⁰ must be ℚ_p, not K); affects a stated result.
- **Gap** in ALRS at Proposition 4.5.3(2), p. 69–70: the statement takes any Gelfand stack X over D; the proof assumes X is a Berkovich space and uses Proposition 2.8.15, which needs infinitesimal cohesiveness; it should state that hypothesis; affects a stated result.
- **Gap** in ALRS at Proposition 5.8.9, p. 139–140: the statement takes a Gelfand stack Z with a group action; the proof uses that Z is a Berkovich space; it should assume Z Berkovich; affects a stated result.
- **Misprint** in ALRS at Lemma A.2.5(3), p. 178: the source says the base change is along a map from X to X′ and writes h′ from Y to Y; it should be a map X′ → X and h′: Y′ → Y; affects nothing.
- **Misprint** in ALRS at Definition A.2.2(3), p. 177: the source says the connective module M lies in the connective part of D(M); it should be D(R); affects nothing.
- **Misprint** in ALRS at Example 2.8.12(1), p. 32: the source introduces the connective module as N and then uses M; it should use one letter; affects nothing.
- **Misprint** in ALRS at Definition 4.5.1(2), p. 69: the source labels the relative formal Hodge–Tate stack with D^† while defining it by base change to D^∧; it should be labelled with D^∧, as Proposition 4.5.3 does; affects nothing.
- **Misprint** in ALRS at Proposition 4.2.13, proof, p. 64: the source says Frobenius identifies the region (0, 1) of X^Δ with the region (0, p) of 𝒳_T; it should be the region (0, p) of X^Δ; affects nothing.
- **Misprint** in ALRS at Lemma 5.8.8, p. 139: the source says the decompletion is Y^la and takes Z = BH^la × X^la; it should be X^la and Z = BH^la × X^la/G^la, a stack over X^la/G^la; affects nothing.
- **Misprint** in ALRS at Proposition 5.8.10, proof of (2), p. 140: the source says the map from BU to the group 𝐇(ℚ_p)^la is a Berkovich-étale cover; it should be the map to its classifying stack; affects nothing.
- **Misprint** in ALRS at Theorem 6.5.4(1), p. 161: the source says O⟨1⟩ denotes the shifted complex O(1)[2]; it should be the unshifted line bundle of Remark 4.9.3(1), with the dualizing complex O⟨1⟩[2], as part (3) writes O{1}[2]; affects nothing.
- **Misprint** in ALRS at Theorem 5.2.14, p. 101: the source says Lazard's result is Corollary I.3.9; it should be Chapitre III, (1.3.9) Corollaire; affects nothing.

## For the human reviewers

- **Scope.** The main sources are unpublished: ALRS (preprint 2026, author page; the manifest's `version_note` says not refereed), ABLB (arXiv 2025), Gest (lecture notes, author page), RCSolid (notes): 796 + 185 + 123 + 29 of about 1250 locators.
- **Licence.** ALRS, Gest and Sch24 were read from author pages (`licence_class = "author-page"` in `packages/RationalAnalyticPrismatization/sources.toml`); no licence is stated for them.
- **Declared gaps.** `packages/RationalAnalyticPrismatization/design/plan.json` lists 21 gaps; the README declares one. Two plan gaps (`gestalten-affine-proper`, `gestalten-transmutation`) have supplier `none`: the README now owns that content as Layer 0. Eighteen name AnalyticStacks sections that exist at its open head.
- **Arrangement.** Layers 7–12 run through ALRS §§3.3–6.7 in the source's order (pairs under "Copyright" above); I judged the order forced by the dependency lines and the layers not one to one with the chapters.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "76684620fb690808a0d3b88d355b5343e5eda30f", "job": "REV-PKG-RationalAnalyticPrismatization", "model": "fable", "worker": "chris-x81"} -->
